using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using i = System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FUNCEF.Planus.WebEmprestimo.Web
{
    public class ImagemHelper
    {
        public static byte[] TrataTamanhoFoto(Stream stream, i.ImageFormat imageFormat)
        {
            byte[] result;
            Bitmap srcBmp = new Bitmap(stream);
            SizeF newSize = new SizeF(114, 151);
            Bitmap target = new Bitmap((int)newSize.Width, (int)newSize.Height);
            using (Graphics graphics = Graphics.FromImage(target))
            {
                graphics.CompositingQuality = CompositingQuality.HighSpeed;
                graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                graphics.CompositingMode = CompositingMode.SourceCopy;
                graphics.DrawImage(srcBmp, 0, 0, newSize.Width, newSize.Height);
                using (MemoryStream memoryStream = new MemoryStream())
                {
                    target.Save(memoryStream, imageFormat);
                    result = memoryStream.ToArray();
                }
            }

            return result;
        }

        public static byte[] TrataTamanhoFoto(byte[] imageBytesArray, i.ImageFormat imageFormat)
        {
            byte[] array;
            using (MemoryStream ms = new MemoryStream(imageBytesArray))
            {
                array = TrataTamanhoFoto(ms, imageFormat);
            }
            return array;
        }

        public static string ImageToBase64(Bitmap image, System.Drawing.Imaging.ImageCodecInfo codecInfo, System.Drawing.Imaging.EncoderParameters codecParams)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                // Convert Image to byte[]
                image.Save(ms, codecInfo, codecParams);
                byte[] imageBytes = ms.ToArray();

                // Convert byte[] to Base64 String
                string base64String = Convert.ToBase64String(imageBytes);
                return base64String;
            }
        }

        public static byte[] ImageToMemory(Bitmap image, System.Drawing.Imaging.ImageCodecInfo codecInfo, System.Drawing.Imaging.EncoderParameters codecParams)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                // Convert Image to byte[]
                image.Save(ms, codecInfo, codecParams);
                byte[] imageBytes = ms.ToArray();
                return imageBytes;
                // Convert byte[] to Base64 String
                //string base64String = Convert.ToBase64String(imageBytes);
                //return base64String;
            }
        }
    }
}