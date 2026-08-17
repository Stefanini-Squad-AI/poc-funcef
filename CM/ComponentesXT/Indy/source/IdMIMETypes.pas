unit IdMIMETypes;

{
2000-Mar-27 Pete Mee
 - ReturnMIMETypes should return the most relevant MIME type+encoding pair
   to the values passed - i.e., removes x- where it is unnecessary & modifies
   the type if it is known to be incorrect.  (Stupid-)Example:
   application/octet-stream + x-base64 should be application/octet-stream +
   base64... Warning: this file is expected to grow to become mainly constants!!
}

interface

const
     MIMESplit = '/';
     MIMEXVal = 'x-';

     MIMETypeApplication = 'application' + MIMESplit;
     MIMETypeAudio = 'audio' + MIMESplit;
     MIMETypeImage = 'image' + MIMESplit;
     MIMETypeMessage = 'message' + MIMESplit;
     MIMETypeMultipart = 'multipart' + MIMESplit;
     MIMETypeText = 'text' + MIMESplit;
     MIMETypeVideo = 'video' + MIMESplit;
     MaxMIMEType = 6;

     // MIME Sub-Types
     MIMESubOctetStream = 'octet-stream';
     MIMESubMacBinHex40 = 'mac-binhex40';
     MaxMIMESubTypes = 1;

     // BinToASCII
     MIMEEncBase64 = 'base64'; // Correct MIME type
     MIMEEncUUEncode = MIMEXVal + 'uu'; // A guess...
     MIMEEncXXEncode = MIMEXVal + 'xx'; // A guess...
     MaxMIMEBinToASCIIType = 2;

     // Message Digests - a MIME type probably doesn't exist for these...
     MIMEEncRSAMD2 = MIMEXVal + 'rsa-md2';
     MIMEEncRSAMD4 = MIMEXVal + 'rsa-md4';
     MIMEEncRSAMD5 = MIMEXVal + 'rsa-md5';
     MIMEEncNISTSHA = MIMEXVal + 'nist-sha';
     MaxMIMEMessageDigestType = 3;

     // Compression Types
     MIMEEncRLECompress = MIMEXVal + 'rle-compress'; // Probably doesn't exist
     MaxMIMECompressType = 0;

     MaxMIMEEncType = MaxMIMEBinToASCIIType + MaxMIMEMessageDigestType + 1 +
       MaxMIMECompressType + 1;

     // Only put long, frequent full values in. Keep this list short, otherwise
     // it'll be a nightmare & produce HUGE .exe files with LARGE useless
     // sections (the above is bad enough on it's own!).
     MIMEFullApplicationOctetStream = MIMETypeApplication + MIMESubOctetStream;

     // Returns true if matched, false if not.  If true, vars may be altered.
     function ReturnMIMEType(var MediaType, EncType : String) : Boolean;

var
   MIMEMediaType : array [0..MaxMIMEType] of String;

implementation

uses
  IdGlobal,
  SysUtils;

function ReturnMIMEType;
var
   MType, SType, EType : String;
   i : LongWord;
begin
     i := IndyPos(MIMESplit, MediaType);
     MType := Copy(MediaType, 1, i);
     SType := Copy(MediaType, i + 1, length(MediaType));
     EType := EncType;

     i:=PosInStrArray(LowerCase(MType),MIMEMediaType);
     case i of
       0 : begin
         // MIMETypeApplication - application/
       end;
       1 : begin
         // MIMETypeAudio - audio/
       end;
       2 : begin
         // MIMETypeImage - image/
       end;
       3 : begin
         // MIMETypeMessage - message/
       end;
       4 : begin
         // MIMETypeMultipart - multipart/
       end;
       5 : begin
         // MIMETypeText - text/
       end;
       6 : begin
         // MIMETypeVideo - video/
       end;
     else begin
          if LowerCase(Copy(MType, 1, 2)) = MIMEXVal then begin
             i:=PosInStrArray(LowerCase(Copy(MType, 3, length(MType))),MIMEMediaType);
             case i of
               0 : begin
                 // MIMETypeApplication - application/
                 MType := MIMETypeApplication;
               end;
               1 : begin
                 // MIMETypeAudio - audio/
                 MType := MIMETypeAudio;
               end;
               2 : begin
                 // MIMETypeImage - image/
                 MType := MIMETypeImage;
               end;
               3 : begin
                 // MIMETypeMessage - message/
                 MType := MIMETypeMessage;
               end;
               4 : begin
                 // MIMETypeMultipart - multipart/
                 MType := MIMETypeMultipart;
               end;
               5 : begin
                 // MIMETypeText - text/
                 MType := MIMETypeText;
               end;
               6 : begin
                 // MIMETypeVideo - video/
                 MType := MIMETypeVideo;
               end;
             end;
          end;
       end;
     end;

     result := false;
end;

initialization
  MIMEMediaType[0] := MIMETypeApplication;
  MIMEMediaType[1] := MIMETypeAudio;
  MIMEMediaType[2] := MIMETypeImage;
  MIMEMediaType[3] := MIMETypeMessage;
  MIMEMediaType[4] := MIMETypeMultipart;
  MIMEMediaType[5] := MIMETypeText;
  MIMEMediaType[6] := MIMETypeVideo;
end.