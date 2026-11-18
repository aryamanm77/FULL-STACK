import fs from 'fs';
import { db } from '../database/db.js';
import { processDocumentConversion } from '../engine/conversionEngine.js';

export function getConversionHistory(req, res) {
  try {
    const { department, documentType, status } = req.query;
    const records = db.getConversionRecords({ department, documentType, status });

    res.json({
      success: true,
      statusCode: 200,
      message: 'Conversion history retrieved',
      data: {
        total: records.length,
        records
      }
    });
  } catch (err) {
    res.status(500).json({
      success: false,
      statusCode: 500,
      error: { code: 'HISTORY_FETCH_ERROR', message: err.message }
    });
  }
}

export function downloadOriginalDocument(req, res) {
  try {
    const { recordId } = req.params;
    const record = db.getConversionRecord(recordId);

    if (!record || !record.originalFilePath || !fs.existsSync(record.originalFilePath)) {
      return res.status(404).json({
        success: false,
        statusCode: 404,
        error: { code: 'FILE_NOT_FOUND', message: 'Original document file is not found or has been moved.' }
      });
    }

    res.download(record.originalFilePath, record.originalFilename);
  } catch (err) {
    res.status(500).json({
      success: false,
      statusCode: 500,
      error: { code: 'DOWNLOAD_ERROR', message: err.message }
    });
  }
}

export async function reprocessDocument(req, res) {
  try {
    const { recordId } = req.params;
    const record = db.getConversionRecord(recordId);

    if (!record || !record.originalFilePath || !fs.existsSync(record.originalFilePath)) {
      return res.status(404).json({
        success: false,
        statusCode: 404,
        error: { code: 'FILE_NOT_FOUND', message: 'Original document file not found for reprocessing.' }
      });
    }

    const file = {
      path: record.originalFilePath,
      originalname: record.originalFilename,
      size: record.fileSize || fs.statSync(record.originalFilePath).size
    };

    const result = await processDocumentConversion(file, {
      documentType: record.documentType,
      department: record.department,
      semester: record.metadata?.semester,
      subjectName: record.metadata?.subjectName,
      subjectCode: record.metadata?.subjectCode,
      uploadedBy: req.headers['x-user-name'] || 'Reprocessing Action'
    });

    res.json({
      success: true,
      statusCode: 200,
      message: 'Document reprocessed successfully',
      data: result
    });
  } catch (err) {
    res.status(500).json({
      success: false,
      statusCode: 500,
      error: { code: 'REPROCESS_ERROR', message: err.message }
    });
  }
}

export function deleteRecord(req, res) {
  try {
    const { recordId } = req.params;
    db.deleteConversionRecord(recordId);

    res.json({
      success: true,
      statusCode: 200,
      message: 'Conversion record and associated files removed'
    });
  } catch (err) {
    res.status(500).json({
      success: false,
      statusCode: 500,
      error: { code: 'DELETE_ERROR', message: err.message }
    });
  }
}

export function getAuditLogs(req, res) {
  try {
    const logs = db.getAuditLogs(100);
    res.json({
      success: true,
      statusCode: 200,
      data: logs
    });
  } catch (err) {
    res.status(500).json({
      success: false,
      statusCode: 500,
      error: { code: 'AUDIT_FETCH_ERROR', message: err.message }
    });
  }
}

