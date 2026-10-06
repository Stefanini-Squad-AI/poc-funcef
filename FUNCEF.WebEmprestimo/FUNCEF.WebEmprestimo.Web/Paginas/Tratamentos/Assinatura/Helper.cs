#region SIG 28915
///
/// Autor:
/// Eliamar Tani
///
/// Data da Alteração:
/// 12/12/2016 12:24:23
///
/// Descrição da Alteração:
/// Criação do arquivo
///
#endregion

using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
 
/// <summary>
/// Classe estática utilizada para criptografar a querystring
/// </summary>
public static class CriptografiaHelper
{
    const string encryptionKey = "WEBEMP123";
 
    /// <summary>
    /// Método para criptografar os dados da querystring
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    public static string Encrypt(string text)
    {
        byte[] clearBytes = Encoding.Unicode.GetBytes(text);
        using (Aes encryptor = Aes.Create())
        {
            var pdb = new Rfc2898DeriveBytes(encryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (var ms = new MemoryStream())
            {
                using (var cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                text = Convert.ToBase64String(ms.ToArray());
            }
        }
        return text;
    }
 
    /// <summary>
    /// Método para criptografar os dados da querystring
    /// </summary>
    /// <param name="clearText"></param>
    /// <returns></returns>
    public static string Decrypt(string text)
    {
        text = text.Replace(" ", "+");
        byte[] cipherBytes = Convert.FromBase64String(text);
        using (Aes encryptor = Aes.Create())
        {
            var pdb = new Rfc2898DeriveBytes(encryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (var ms = new MemoryStream())
            {
                using (var cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(cipherBytes, 0, cipherBytes.Length);
                    cs.Close();
                }
                text = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
 
        return text;
    }
}