import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import mammoth from 'mammoth';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const IMAGES_DIR = path.resolve(__dirname, '../../../uploads/images');

if (!fs.existsSync(IMAGES_DIR)) {
  fs.mkdirSync(IMAGES_DIR, { recursive: true });
}

export async function extractFromDocx(filePath) {
  const images = [];
  let imgIndex = 0;

  const options = {
    convertImage: mammoth.images.inline((element) => {
      return element.read('base64').then((imageBuffer) => {
        const ext = element.contentType.split('/')[1] || 'png';
        const imgName = `docx_img_${Date.now()}_${imgIndex++}.${ext}`;
        const imgPath = path.join(IMAGES_DIR, imgName);
        fs.writeFileSync(imgPath, Buffer.from(imageBuffer, 'base64'));

        const imgObj = {
          id: `img_${Date.now()}_${imgIndex}`,
          filename: imgName,
          url: `/uploads/images/${imgName}`,
          contentType: element.contentType
        };
        images.push(imgObj);

        return {
          src: imgObj.url
        };
      });
    })
  };

  const rawTextResult = await mammoth.extractRawText({ path: filePath });
  const htmlResult = await mammoth.convertToHtml({ path: filePath }, options);
  const textWithImageMarkers = htmlResult.value
    .replace(/<img\b[^>]*>/gi, '\n[Image]\n')
    .replace(/<br\s*\/?>/gi, '\n')
    .replace(/<\/(?:p|div|li|h[1-6]|tr)>/gi, '\n')
    .replace(/<[^>]+>/g, ' ')
    .replace(/&nbsp;/gi, ' ')
    .replace(/&amp;/gi, '&')
    .replace(/&lt;/gi, '<')
    .replace(/&gt;/gi, '>')
    .replace(/&quot;/gi, '"')
    .replace(/&#39;/gi, "'")
    .replace(/[ \t]+\n/g, '\n')
    .replace(/\n{3,}/g, '\n\n')
    .trim();

  return {
    text: rawTextResult.value.trim(),
    textWithImageMarkers: images.length > 0 ? textWithImageMarkers : rawTextResult.value.trim(),
    html: htmlResult.value,
    images,
    messages: rawTextResult.messages || []
  };
}

