import type ExcelJS from 'exceljs';
import type {
  ExtractedQuestionPreviewRow,
  ExtractedStudentPreviewRow,
  QuestionImageAsset,
  QuestionImageField,
} from '../types';
import { triggerBlobDownload } from './exportUtils';
import {
  base64ToUint8Array,
  ensureImageDataUrl,
  sha256Hex,
  uint8ArrayToBase64,
} from './browserPdfOcr';
import type { ParsedQuestionRow, QuestionExcelParseResult } from './fileHandlers';

export const STANDARD_STUDENT_HEADERS = ['Sl.no.', 'Student Name', 'USN', 'Date of Birth'] as const;
export const STANDARD_QUESTION_HEADERS = [
  'Sl.no.',
  'Questions',
  'Question image',
  'option A',
  'option A img',
  'option B',
  'option B img',
  'option C',
  'option C img',
  'option D ',
  'option D  img',
  'Key Answer',
] as const;

export const LEGACY_QUESTION_HEADERS = [
  'Module Number',
  'Question Text',
  'Option A',
  'Option B',
  'Option C',
  'Option D',
  'Correct Option',
] as const;

const FIELD_TO_IMAGE_COL_INDEX: Record<QuestionImageField, number> = {
  QUESTION_TEXT: 2, // col C (0-based)
  OPTION_A: 4,      // col E
  OPTION_B: 6,      // col G
  OPTION_C: 8,      // col I
  OPTION_D: 10,     // col K
};

const FIELD_TO_COL_INDEX: Record<QuestionImageField, number> = {
  QUESTION_TEXT: 1, // col B (0-based)
  OPTION_A: 2,      // col C
  OPTION_B: 3,      // col D
  OPTION_C: 4,      // col E
  OPTION_D: 5,      // col F
};

const COL_INDEX_TO_FIELD: Record<number, QuestionImageField> = {
  1: 'QUESTION_TEXT',
  2: 'OPTION_A',
  3: 'OPTION_B',
  4: 'OPTION_C',
  5: 'OPTION_D',
};

async function loadExcelJs(): Promise<typeof ExcelJS> {
  const mod = await import('exceljs');
  return ((mod as unknown as { default?: typeof ExcelJS }).default || mod) as typeof ExcelJS;
}

async function loadJsZip() {
  const mod = await import('jszip');
  return ((mod as unknown as { default?: typeof import('jszip') }).default || mod) as typeof import('jszip');
}

function sanitizeCellValue(val: ExcelJS.CellValue): string {
  if (val === null || val === undefined) return '';
  if (val instanceof Date) {
    const y = val.getUTCFullYear();
    const m = String(val.getUTCMonth() + 1).padStart(2, '0');
    const d = String(val.getUTCDate()).padStart(2, '0');
    return `${y}-${m}-${d}`;
  }
  if (typeof val === 'object') {
    if ('richText' in val && Array.isArray(val.richText)) {
      return val.richText.map((r) => r.text).join('').trim();
    }
    if ('text' in val && typeof val.text === 'string') {
      return val.text.trim();
    }
    if ('result' in val && val.result !== undefined) {
      return String(val.result).trim();
    }
  }
  return String(val).trim();
}

export async function buildStudentWorkbookBlob(
  rows: Pick<ExtractedStudentPreviewRow, 'usn' | 'studentName' | 'dob'>[]
): Promise<Blob> {
  const Excel = await loadExcelJs();
  let workbook: InstanceType<typeof Excel.Workbook>;
  try {
    const res = await fetch('/templates/std_template.xlsx');
    if (res.ok) {
      workbook = new Excel.Workbook();
      await workbook.xlsx.load(await res.arrayBuffer());
    } else {
      throw new Error();
    }
  } catch (_) {
    workbook = new Excel.Workbook();
    const sheet = workbook.addWorksheet('Sheet1');
    sheet.columns = [
      { header: 'Sl.no.', key: 'slno', width: 10 },
      { header: 'Student Name', key: 'studentName', width: 38.28 },
      { header: 'USN', key: 'usn', width: 18 },
      { header: 'Date of Birth', key: 'dob', width: 21 },
    ];
  }

  const sheet = workbook.worksheets[0];
  const headerRow = sheet.getRow(1);
  headerRow.height = 24;

  rows.forEach((row, idx) => {
    const added = sheet.addRow([
      idx + 1,
      row.studentName.trim(),
      row.usn.trim().toUpperCase(),
      row.dob.trim(),
    ]);
    added.height = 20;
    added.eachCell((cell) => {
      cell.numFmt = '@';
      cell.alignment = { vertical: 'middle', horizontal: 'left' };
    });
  });

  const buffer = await workbook.xlsx.writeBuffer();
  return new Blob([buffer], {
    type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
  });
}

export async function buildQuestionWorkbookBytes(params: {
  moduleNumber: number;
  subjectCode: string;
  rows: ExtractedQuestionPreviewRow[];
}): Promise<Uint8Array> {
  const Excel = await loadExcelJs();
  let workbook: InstanceType<typeof Excel.Workbook>;
  try {
    const res = await fetch('/templates/q_template.xlsx');
    if (res.ok) {
      workbook = new Excel.Workbook();
      await workbook.xlsx.load(await res.arrayBuffer());
    } else {
      throw new Error();
    }
  } catch (_) {
    workbook = new Excel.Workbook();
    for (let m = 1; m <= 5; m++) {
      const ws = workbook.addWorksheet(`Module ${m}`);
      ws.columns = [
        { header: 'Sl.no.', width: 10 },
        { header: 'Questions', width: 38.42 },
        { header: 'Question image', width: 29 },
        { header: 'option A', width: 11.71 },
        { header: 'option A img', width: 21.14 },
        { header: 'option B', width: 12.71 },
        { header: 'option B img', width: 17 },
        { header: 'option C', width: 12.42 },
        { header: 'option C img', width: 15.28 },
        { header: 'option D ', width: 13.42 },
        { header: 'option D  img', width: 17 },
        { header: 'Key Answer', width: 19 },
      ];
    }
  }

  const sheet = workbook.getWorksheet(`Module ${params.moduleNumber}`) || workbook.worksheets[0];
  const imageMapSheet = workbook.getWorksheet('_ImageMap') || workbook.addWorksheet('_ImageMap', { state: 'veryHidden' });

  for (let i = 0; i < params.rows.length; i++) {
    const q = params.rows[i];
    const excelRowNumber = i + 2;

    const added = sheet.addRow([
      i + 1,
      q.questionText.trim(),
      '',
      q.optionA.trim(),
      '',
      q.optionB.trim(),
      '',
      q.optionC.trim(),
      '',
      q.optionD.trim(),
      '',
      q.correctOption.trim().toUpperCase(),
    ]);

    added.eachCell((cell, colNumber) => {
      cell.alignment = {
        vertical: 'top',
        horizontal: colNumber === 1 || colNumber === 12 ? 'center' : 'left',
        wrapText: true,
      };
    });

    const textLines = Math.max(
      2,
      Math.ceil(q.questionText.length / 44),
      Math.ceil(q.optionA.length / 24),
      Math.ceil(q.optionB.length / 24),
      Math.ceil(q.optionC.length / 24),
      Math.ceil(q.optionD.length / 24)
    );
    let maxImageDisplayH = 0;

    const byField = new Map<QuestionImageField, QuestionImageAsset[]>();
    for (const img of q.images || []) {
      const list = byField.get(img.targetField) || [];
      list.push(img);
      byField.set(img.targetField, list);
    }

    for (const [field, fieldImgs] of byField.entries()) {
      fieldImgs.sort((a, b) => a.sequence - b.sequence);
      const colIdx0 = FIELD_TO_IMAGE_COL_INDEX[field] ?? 2;

      for (let seqIdx = 0; seqIdx < fieldImgs.length; seqIdx++) {
        const asset = fieldImgs[seqIdx];
        const imgBytes = base64ToUint8Array(asset.base64Data);
        const sha256 = asset.sha256 || (await sha256Hex(imgBytes));

        const excelImageId = workbook.addImage({
          buffer: imgBytes.buffer.slice(imgBytes.byteOffset, imgBytes.byteOffset + imgBytes.byteLength) as unknown as ExcelJS.Buffer,
          extension: asset.mimeType === 'image/jpeg' ? 'jpeg' : 'png',
        });

        const srcW = Math.max(24, asset.width || 120);
        const srcH = Math.max(24, asset.height || 90);
        const maxW = field === 'QUESTION_TEXT' ? 190 : 140;
        const maxH = 100;
        const scale = Math.min(1, maxW / srcW, maxH / srcH);
        const displayW = Math.round(srcW * scale);
        const displayH = Math.round(srcH * scale);
        if (displayH > maxImageDisplayH) maxImageDisplayH = displayH;

        const colOffset = Math.min(0.65, 0.05 + seqIdx * 0.25);
        const rowOffset = 0.22;

        sheet.addImage(excelImageId, {
          tl: { col: colIdx0 + colOffset, row: excelRowNumber - 1 + rowOffset },
          ext: { width: displayW, height: displayH },
          editAs: 'oneCell',
        });

        imageMapSheet.addRow([
          asset.assetId,
          excelRowNumber,
          q.previewId,
          field,
          seqIdx + 1,
          asset.mimeType,
          asset.width,
          asset.height,
          asset.altText || '',
          String(excelImageId),
          sha256,
        ]);
      }
    }

    const rowPtHeight = Math.max(
      36,
      textLines * 15 + (maxImageDisplayH > 0 ? Math.ceil(maxImageDisplayH * 0.78) + 18 : 8)
    );
    added.height = Math.min(240, rowPtHeight);
  }

  const out = await workbook.xlsx.writeBuffer();
  return new Uint8Array(out as ArrayBuffer);
}

export async function buildQuestionWorkbookBlob(params: {
  moduleNumber: number;
  subjectCode: string;
  rows: ExtractedQuestionPreviewRow[];
}): Promise<Blob> {
  const bytes = await buildQuestionWorkbookBytes(params);
  const copy = new Uint8Array(bytes.byteLength);
  copy.set(bytes);
  return new Blob([copy.buffer], {
    type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
  });
}

export async function buildMultiModuleZipBlob(params: {
  subjectCode: string;
  files: { fileName: string; moduleNumber: number; rows: ExtractedQuestionPreviewRow[] }[];
}): Promise<Blob> {
  const JSZip = await loadJsZip();
  const zip = new JSZip();

  for (const item of params.files) {
    const xlsxBytes = await buildQuestionWorkbookBytes({
      moduleNumber: item.moduleNumber,
      subjectCode: params.subjectCode,
      rows: item.rows,
    });
    zip.file(item.fileName, xlsxBytes);
  }

  return zip.generateAsync({ type: 'blob' });
}

export async function downloadStudentExcelTemplateLocal(
  departmentCode: string,
  semesterNumber: number,
  section: string
): Promise<void> {
  const blob = await buildStudentWorkbookBlob([]);
  const cleanSection = section.replace(/\s+/g, '');
  triggerBlobDownload(blob, `${departmentCode}_Sem${semesterNumber}_${cleanSection}_Student_Template.xlsx`);
}

export async function downloadQuestionExcelTemplateLocal(
  subjectCode: string,
  moduleNumber: number
): Promise<void> {
  const blob = await buildQuestionWorkbookBlob({
    moduleNumber,
    subjectCode,
    rows: [],
  });
  triggerBlobDownload(blob, `MITM_${subjectCode}_Module_${moduleNumber}_Template.xlsx`);
}

/**
 * Fallback OpenXML relationship extractor using JSZip in case an XLSX workbook was
 * re-saved by desktop Excel / LibreOffice and ExcelJS sheet.getImages() omits an anchor.
 */
async function extractOpenXmlDrawingFallbacks(
  arrayBuffer: ArrayBuffer,
  imagesByRowAndField: Map<string, QuestionImageAsset[]>
): Promise<number> {
  try {
    const JSZip = await loadJsZip();
    const zip = await JSZip.loadAsync(arrayBuffer);
    const sheet1Xml = await zip.file('xl/worksheets/sheet1.xml')?.async('text');
    const sheet1Rels = await zip.file('xl/worksheets/_rels/sheet1.xml.rels')?.async('text');
    if (!sheet1Xml || !sheet1Rels) return 0;

    const drawingRefMatch = sheet1Xml.match(/<drawing[^>]*r:id="([^"]+)"/i);
    if (!drawingRefMatch) return 0;
    const relId = drawingRefMatch[1];

    const parser = new DOMParser();
    const relDoc = parser.parseFromString(sheet1Rels, 'application/xml');
    const rels = Array.from(relDoc.getElementsByTagName('Relationship'));
    const drawingRel = rels.find((r) => r.getAttribute('Id') === relId);
    if (!drawingRel) return 0;

    let drawingTarget = (drawingRel.getAttribute('Target') || '').replace(/^\.\.\//, 'xl/');
    if (!drawingTarget.startsWith('xl/')) drawingTarget = `xl/worksheets/${drawingTarget}`;

    const drawingXmlText = await zip.file(drawingTarget)?.async('text');
    const drawingFileName = drawingTarget.split('/').pop() || '';
    const drawingRelsText = await zip.file(`xl/drawings/_rels/${drawingFileName}.rels`)?.async('text');
    if (!drawingXmlText || !drawingRelsText) return 0;

    const drawRelsDoc = parser.parseFromString(drawingRelsText, 'application/xml');
    const mediaTargetByRelId = new Map<string, string>();
    Array.from(drawRelsDoc.getElementsByTagName('Relationship')).forEach((r) => {
      const id = r.getAttribute('Id');
      const target = r.getAttribute('Target');
      if (id && target) {
        const normTarget = target.replace(/^\.\.\//, 'xl/');
        mediaTargetByRelId.set(id, normTarget.startsWith('xl/') ? normTarget : `xl/${normTarget}`);
      }
    });

    const drawDoc = parser.parseFromString(drawingXmlText, 'application/xml');
    const anchors = [
      ...Array.from(drawDoc.getElementsByTagName('xdr:twoCellAnchor')),
      ...Array.from(drawDoc.getElementsByTagName('xdr:oneCellAnchor')),
      ...Array.from(drawDoc.getElementsByTagName('twoCellAnchor')),
      ...Array.from(drawDoc.getElementsByTagName('oneCellAnchor')),
    ];

    let addedCount = 0;
    for (const anchor of anchors) {
      const fromEl =
        anchor.getElementsByTagName('xdr:from')[0] || anchor.getElementsByTagName('from')[0];
      const colEl =
        fromEl?.getElementsByTagName('xdr:col')[0] || fromEl?.getElementsByTagName('col')[0];
      const rowEl =
        fromEl?.getElementsByTagName('xdr:row')[0] || fromEl?.getElementsByTagName('row')[0];
      const blip =
        anchor.getElementsByTagName('a:blip')[0] || anchor.getElementsByTagName('blip')[0];
      const embedId = blip?.getAttribute('r:embed') || blip?.getAttribute('embed');
      if (!colEl || !rowEl || !embedId) continue;

      const zeroCol = Number(colEl.textContent || -1);
      const zeroRow = Number(rowEl.textContent || -1);
      const excelRowNum = zeroRow + 1;
      const field = COL_INDEX_TO_FIELD[zeroCol];
      if (!field || excelRowNum < 2) continue;

      const mediaPath = mediaTargetByRelId.get(embedId);
      const mediaFile = mediaPath ? zip.file(mediaPath) : null;
      if (!mediaFile) continue;

      const mediaBytes = await mediaFile.async('uint8array');
      const hash = await sha256Hex(mediaBytes);
      const key = `${excelRowNum}:${field}`;
      const existing = imagesByRowAndField.get(key) || [];
      if (existing.some((im) => im.sha256 === hash)) continue;

      const lower = (mediaPath || '').toLowerCase();
      const mimeType: 'image/png' | 'image/jpeg' =
        lower.endsWith('.jpg') || lower.endsWith('.jpeg') ? 'image/jpeg' : 'image/png';

      existing.push({
        assetId: `openxml-r${excelRowNum}-${field.toLowerCase()}-${existing.length + 1}`,
        targetField: field,
        sequence: existing.length + 1,
        mimeType,
        width: 140,
        height: 100,
        base64Data: ensureImageDataUrl(uint8ArrayToBase64(mediaBytes), mimeType),
        sha256: hash,
      });
      imagesByRowAndField.set(key, existing);
      addedCount += 1;
    }

    return addedCount;
  } catch {
    return 0;
  }
}

export async function parseQuestionWorkbookInBrowser(params: {
  file: File;
  subjectModuleCount: number;
  expectedModuleNumber?: number;
  existingQuestionTexts?: string[];
}): Promise<QuestionExcelParseResult> {
  const Excel = await loadExcelJs();
  const arrayBuffer = await params.file.arrayBuffer();
  const workbook = new Excel.Workbook();

  try {
    await workbook.xlsx.load(arrayBuffer);
  } catch (err) {
    return {
      success: false,
      fatalError: `Failed to read Excel workbook: ${err instanceof Error ? err.message : 'invalid XLSX structure'}.`,
      fileName: params.file.name,
      fileSizeBytes: params.file.size,
      rows: [],
      validCount: 0,
      invalidCount: 0,
      totalImagesExtracted: 0,
    };
  }

  const allVisibleSheets = workbook.worksheets.filter(
    (ws) => ws.state !== 'veryHidden' && ws.name !== '_ImageMap'
  );
  if (allVisibleSheets.length === 0) {
    return {
      success: false,
      fatalError: 'The Excel workbook has no visible worksheets.',
      fileName: params.file.name,
      fileSizeBytes: params.file.size,
      rows: [],
      validCount: 0,
      invalidCount: 0,
      totalImagesExtracted: 0,
    };
  }

  // Determine target sheets:
  // If single-module mode and there is a sheet named Module X, select it; otherwise inspect all visible sheets with rows
  let targetSheets = allVisibleSheets;
  if (typeof params.expectedModuleNumber === 'number') {
    const specificModuleSheet = allVisibleSheets.find((ws) => {
      const match = ws.name.match(/module\s*(\d+)/i);
      return match && Number(match[1]) === params.expectedModuleNumber;
    });
    if (specificModuleSheet) {
      targetSheets = [specificModuleSheet];
    }
  }

  const existingSet = new Set(
    (params.existingQuestionTexts || []).map((t) => t.trim().toLowerCase())
  );
  const seenInFile = new Set<string>();
  const rows: ParsedQuestionRow[] = [];
  const distinctModulesSeen = new Set<number>();
  let totalImagesExtracted = 0;

  for (const sheet of targetSheets) {
    if (sheet.rowCount < 2) continue;

    const sheetModMatch = sheet.name.match(/module\s*(\d+)/i);
    const sheetDefaultModule = sheetModMatch ? Number(sheetModMatch[1]) : (params.expectedModuleNumber || 1);

    const headerRow = sheet.getRow(1);
    const rawHeaders: string[] = [];
    for (let c = 1; c <= sheet.columnCount; c++) {
      rawHeaders.push(sanitizeCellValue(headerRow.getCell(c).value));
    }
    while (rawHeaders.length > 0 && rawHeaders[rawHeaders.length - 1] === '') {
      rawHeaders.pop();
    }

    const cleanHeaders = rawHeaders.map((h) => h.toLowerCase().replace(/[^a-z0-9]/g, ''));

    // Detect columns
    let questionCol = cleanHeaders.findIndex((h) => h === 'questions' || h.includes('questiontext') || h === 'prompt');
    let qImgCol = cleanHeaders.findIndex((h) => h === 'questionimage' || h === 'questionimg');
    let optACol = cleanHeaders.findIndex((h) => h === 'optiona');
    let aImgCol = cleanHeaders.findIndex((h) => h === 'optionaimg');
    let optBCol = cleanHeaders.findIndex((h) => h === 'optionb');
    let bImgCol = cleanHeaders.findIndex((h) => h === 'optionbimg');
    let optCCol = cleanHeaders.findIndex((h) => h === 'optionc');
    let cImgCol = cleanHeaders.findIndex((h) => h === 'optioncimg');
    let optDCol = cleanHeaders.findIndex((h) => h === 'optiond');
    let dImgCol = cleanHeaders.findIndex((h) => h === 'optiondimg');
    let keyCol = cleanHeaders.findIndex((h) => h === 'keyanswer' || h === 'correctoption' || h === 'correct' || h === 'answer');
    let modCol = cleanHeaders.findIndex((h) => h === 'modulenumber' || h === 'module');

    // Fallbacks if 12-column standard template (q_template.xlsx)
    if (rawHeaders.length >= 10) {
      if (questionCol === -1) questionCol = 1;
      if (qImgCol === -1) qImgCol = 2;
      if (optACol === -1) optACol = 3;
      if (aImgCol === -1) aImgCol = 4;
      if (optBCol === -1) optBCol = 5;
      if (bImgCol === -1) bImgCol = 6;
      if (optCCol === -1) optCCol = 7;
      if (cImgCol === -1) cImgCol = 8;
      if (optDCol === -1) optDCol = 9;
      if (dImgCol === -1) dImgCol = 10;
      if (keyCol === -1) keyCol = 11;
    } else if (rawHeaders.length === 7) {
      // Legacy 7-column template fallback
      if (modCol === -1) modCol = 0;
      if (questionCol === -1) questionCol = 1;
      if (optACol === -1) optACol = 2;
      if (optBCol === -1) optBCol = 3;
      if (optCCol === -1) optCCol = 4;
      if (optDCol === -1) optDCol = 5;
      if (keyCol === -1) keyCol = 6;
    }

    if (questionCol === -1 || optACol === -1 || keyCol === -1) {
      continue; // Skip non-question worksheets
    }

    // Sheet images
    const sheetImages = sheet.getImages();
    const imagesByRowAndField = new Map<string, QuestionImageAsset[]>();
    const brokenImageRefsByRow = new Map<number, string[]>();

    const mediaById = new Map<
      string,
      { base64DataUrl: string; mimeType: 'image/png' | 'image/jpeg'; sha256: string }
    >();

    for (const imgRef of sheetImages) {
      const imgIdKey = String(imgRef.imageId);
      if (!mediaById.has(imgIdKey)) {
        const media = workbook.getImage(Number(imgRef.imageId));
        if (media && media.buffer) {
          const rawBytes =
            media.buffer instanceof Uint8Array
              ? media.buffer
              : new Uint8Array(media.buffer as ArrayBuffer);
          const ext = (media.extension || 'png').toLowerCase();
          const mimeType: 'image/png' | 'image/jpeg' =
            ext === 'jpeg' || ext === 'jpg' ? 'image/jpeg' : 'image/png';
          mediaById.set(imgIdKey, {
            base64DataUrl: ensureImageDataUrl(uint8ArrayToBase64(rawBytes), mimeType),
            mimeType,
            sha256: await sha256Hex(rawBytes),
          });
        }
      }
    }

    // Inspect image placements
    for (const imgRef of sheetImages) {
      const tl = imgRef.range?.tl as
        | { nativeRow?: number; nativeCol?: number; row?: number; col?: number }
        | undefined;
      const zeroRow = Math.floor(tl?.nativeRow ?? tl?.row ?? -1);
      const zeroCol = Math.floor(tl?.nativeCol ?? tl?.col ?? -1);
      const excelRowNum = zeroRow + 1;
      const imgIdKey = String(imgRef.imageId);

      let field: QuestionImageField | undefined;
      if (zeroCol === qImgCol || zeroCol === questionCol) field = 'QUESTION_TEXT';
      else if (zeroCol === aImgCol || zeroCol === optACol) field = 'OPTION_A';
      else if (zeroCol === bImgCol || zeroCol === optBCol) field = 'OPTION_B';
      else if (zeroCol === cImgCol || zeroCol === optCCol) field = 'OPTION_C';
      else if (zeroCol === dImgCol || zeroCol === optDCol) field = 'OPTION_D';
      else field = COL_INDEX_TO_FIELD[zeroCol];

      const media = mediaById.get(imgIdKey);
      if (!field || excelRowNum < 2 || !media) continue;

      const key = `${excelRowNum}:${field}`;
      const list = imagesByRowAndField.get(key) || [];
      const rangeExt = (imgRef.range as { ext?: { width?: number; height?: number } } | undefined)?.ext;
      list.push({
        assetId: `xlsx-img-s${sheet.id}-r${excelRowNum}-${field.toLowerCase()}-${list.length + 1}`,
        targetField: field,
        sequence: list.length + 1,
        mimeType: media.mimeType,
        width: Math.round(rangeExt?.width || 140),
        height: Math.round(rangeExt?.height || 100),
        base64Data: media.base64DataUrl,
        sha256: media.sha256,
      });
      imagesByRowAndField.set(key, list);
      totalImagesExtracted += 1;
    }

    for (let r = 2; r <= sheet.rowCount; r++) {
      const row = sheet.getRow(r);
      let moduleRaw = modCol >= 0 ? sanitizeCellValue(row.getCell(modCol + 1).value) : '';
      if (!moduleRaw && sheetDefaultModule) {
        moduleRaw = String(sheetDefaultModule);
      }
      const questionText = questionCol >= 0 ? sanitizeCellValue(row.getCell(questionCol + 1).value) : '';
      const optionA = optACol >= 0 ? sanitizeCellValue(row.getCell(optACol + 1).value) : '';
      const optionB = optBCol >= 0 ? sanitizeCellValue(row.getCell(optBCol + 1).value) : '';
      const optionC = optCCol >= 0 ? sanitizeCellValue(row.getCell(optCCol + 1).value) : '';
      const optionD = optDCol >= 0 ? sanitizeCellValue(row.getCell(optDCol + 1).value) : '';
      let correctOption = keyCol >= 0 ? sanitizeCellValue(row.getCell(keyCol + 1).value).toUpperCase() : '';
      if (correctOption.startsWith('OPTION ')) correctOption = correctOption.substring(7).trim();
      if (correctOption.startsWith('OPTION')) correctOption = correctOption.substring(6).trim();

      const qImgs = (imagesByRowAndField.get(`${r}:QUESTION_TEXT`) || []).sort((a, b) => a.sequence - b.sequence);
      const aImgs = (imagesByRowAndField.get(`${r}:OPTION_A`) || []).sort((a, b) => a.sequence - b.sequence);
      const bImgs = (imagesByRowAndField.get(`${r}:OPTION_B`) || []).sort((a, b) => a.sequence - b.sequence);
      const cImgs = (imagesByRowAndField.get(`${r}:OPTION_C`) || []).sort((a, b) => a.sequence - b.sequence);
      const dImgs = (imagesByRowAndField.get(`${r}:OPTION_D`) || []).sort((a, b) => a.sequence - b.sequence);
      const hasAnyImage = qImgs.length + aImgs.length + bImgs.length + cImgs.length + dImgs.length > 0;

      if (!questionText && !optionA && !optionB && !optionC && !optionD && !correctOption && !hasAnyImage) {
        continue;
      }

      const errors: string[] = [...(brokenImageRefsByRow.get(r) || [])];
      let modNum = Number(moduleRaw) || sheetDefaultModule;

      if (!Number.isInteger(modNum) || modNum < 1 || modNum > params.subjectModuleCount) {
        errors.push(
          `Module Number: "${moduleRaw || 'blank'}" must be an integer between 1 and ${params.subjectModuleCount}.`
        );
      } else {
        distinctModulesSeen.add(modNum);
        if (
          typeof params.expectedModuleNumber === 'number' &&
          modNum !== params.expectedModuleNumber
        ) {
          errors.push(
            `Strict Module-Wise Rule: Row belongs to Module ${modNum}, but selected upload batch is Module ${params.expectedModuleNumber}. Upload each module separately.`
          );
        }
      }

      if (!questionText && qImgs.length === 0) {
        errors.push('Question Text: Question text or diagram image is required.');
      } else if (questionText) {
        const norm = questionText.toLowerCase();
        if (seenInFile.has(norm)) {
          errors.push('Question Text: Duplicate question within the uploaded file.');
        }
        if (existingSet.has(norm)) {
          errors.push('Question Text: Duplicate of an existing active question in this subject.');
        }
        seenInFile.add(norm);
      }

      const optPairs = [
        { label: 'Option A', text: optionA, imgs: aImgs },
        { label: 'Option B', text: optionB, imgs: bImgs },
        { label: 'Option C', text: optionC, imgs: cImgs },
        { label: 'Option D', text: optionD, imgs: dImgs },
      ];
      if (optPairs.some((o) => !o.text && o.imgs.length === 0)) {
        errors.push('Options A–D: All four options require text or an embedded option image.');
      } else {
        const sigs = optPairs.map(
          (o) => `${o.text.toLowerCase()}::${o.imgs.map((img) => img.sha256 || img.assetId).join(',')}`
        );
        if (new Set(sigs).size < 4) {
          errors.push('Options A–D: All four options must be distinct.');
        }
      }

      if (!['A', 'B', 'C', 'D'].includes(correctOption)) {
        errors.push(`Correct Option: "${correctOption || 'blank'}" must be A, B, C, or D.`);
      }

      rows.push({
        rowNumber: rows.length + 1,
        moduleNumber: Number.isInteger(modNum) ? modNum : null,
        moduleRaw: String(modNum),
        questionText,
        optionA,
        optionB,
        optionC,
        optionD,
        correctOption,
        questionImages: qImgs,
        optionAImages: aImgs,
        optionBImages: bImgs,
        optionCImages: cImgs,
        optionDImages: dImgs,
        isValid: errors.length === 0,
        errors,
      });
    }
  }

  if (rows.length === 0) {
    return {
      success: false,
      fatalError: 'No non-empty question rows were found inside the uploaded Excel workbook.',
      fileName: params.file.name,
      fileSizeBytes: params.file.size,
      rows: [],
      validCount: 0,
      invalidCount: 0,
      totalImagesExtracted,
    };
  }

  if (typeof params.expectedModuleNumber === 'number' && distinctModulesSeen.size > 1) {
    return {
      success: false,
      fatalError: `Strict Module-Wise Rule Violation: This workbook mixes multiple modules (${Array.from(distinctModulesSeen)
        .sort((a, b) => a - b)
        .map((m) => `Module ${m}`)
        .join(', ')}). Single-module upload requires every question to belong to Module ${params.expectedModuleNumber}.`,
      fileName: params.file.name,
      fileSizeBytes: params.file.size,
      rows,
      validCount: 0,
      invalidCount: rows.length,
      totalImagesExtracted,
    };
  }

  const validCount = rows.filter((r) => r.isValid).length;
  return {
    success: true,
    fileName: params.file.name,
    fileSizeBytes: params.file.size,
    rows,
    validCount,
    invalidCount: rows.length - validCount,
    totalImagesExtracted,
  };
}
