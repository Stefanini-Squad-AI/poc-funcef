unit TXTIFF;

interface

uses
  Windows, Classes, Graphics, SysUtils, Math;

type
  TDirEntry = record
    Tag: Word;
    TagType: Word;
    ValueType: LongInt;
    Value: LongInt;
  end;

  TDirItem = class
    Position: LongInt;
    Start: Boolean;
    Entry: TDirEntry;
  end;

  TTIFImage = class
    FDir: TList;
    FCount: Integer;
    FStream: TFileStream;
  private
    procedure BuildDir;
    procedure WriteDir;
    procedure AddItem(Tag, TagType, ValueType, Value: Integer; First: Boolean);
    procedure UpdateItem(Tag, Value: Integer);
    function FindItem(Tag: Integer): Integer;
    procedure ProcessImage(Bitmap: TBitmap);
    procedure ProcessPal(Bitmap: TBitmap);
    procedure ProcessRGB(Bitmap: TBitmap);
    procedure ProcessBW(Bitmap: TBitmap);
    function RLECompress(Byte: PByteArray; Size: Integer): String;
  public
    constructor Create(Stream: TFileStream);
    destructor Destroy; override;
    procedure Add(Bitmap: TBitmap);
  end;

const
	TIFHeader: array[0..7] of Byte = ($49, $49, $2A, $00, $08, $00, $00, $00);
  XYResolution: array[0..7] of Byte = ($C0,$03,$00,$00, $0A,$00,$00,$00);
  BWResolution: array[0..7] of Byte = ($2C,$01,$00,$00, $01,$00,$00,$00);
  BitsPerSample: array[0..2] of Word = ($0008, $0008, $0008);

implementation

{ TTIFImage }

constructor TTIFImage.Create(Stream: TFileStream);
begin
  FDir    := TList.Create;
  FCount  := 0;
  FStream := Stream;
  FStream.Write(TifHeader, SizeOf(TifHeader));
end;

destructor TTIFImage.Destroy;
var
  I: Integer;
begin
  WriteDir;
//  FStream.Free;
  for I := 0 to FDir.Count - 1 do begin
    TDirItem(FDir[I]).Free;
  end;
  FDir.Free;
  inherited;
end;

procedure TTIFImage.AddItem(Tag, TagType, ValueType, Value: Integer; First: Boolean);
var
  T: TDirItem;
begin
  T := TDirItem.Create;
  T.Position    := 0;
  T.Entry.Tag   := Tag;
  T.Entry.TagType   := TagType;
  T.Entry.ValueType := ValueType;
  T.Entry.Value := Value;
  T.Start := First;
  FDir.Add(T);
end;

function TTIFImage.FindItem(Tag: Integer): Integer;
var
  I, N: Integer;
begin
  Result := -1;
  N := 0;
  for I := 0 to FDir.Count - 1 do begin
    if TDirItem(FDir[I]).Entry.Tag = Tag then begin
       N := N + 1;
       if N = FCount then begin
          Result := I;
          Break;
       end;
    end;
  end;
end;

procedure TTIFImage.UpdateItem(Tag, Value: Integer);
var
  I: Integer;
begin
  I := FindItem(Tag);
  if I <> -1 then begin
     TDirItem(FDir[I]).Entry.Value := Value;
  end;
end;

procedure TTIFImage.Add(Bitmap: TBitmap);
begin
  FCount := FCount + 1;
  BuildDir;
  ProcessImage(Bitmap);
end;

procedure TTIFImage.BuildDir;
begin
  AddItem($0100, $0003, $00000001, $00000000, True);    // ImageWidth
  AddItem($0101, $0003, $00000001, $00000000, False); 	// ImageLength
  AddItem($0103, $0003, $00000001, $00008005, False);   // Compression
  AddItem($0106, $0003, $00000001, $00000002, False);   // PhotometricInterpretation
  AddItem($0111, $0004, $00000001, $00000000, False);   // StripOffsets
  AddItem($0116, $0004, $00000001, $00000000, False);   // RowsPerStrip
  AddItem($0117, $0004, $00000001, $00000000, False);   // StripByteCounts
  AddItem($011A, $0005, $00000001, $00000000, False);   // X-Resolution
  AddItem($011B, $0005, $00000001, $00000000, False);   // Y-Resolution
  AddItem($0128, $0003, $00000001, $00000002, False);   // Resolution Unit
end;

procedure TTIFImage.WriteDir;
var
  I, J, N: Integer;
  T: TDirItem;
  Pos: LongInt;
  DirSize: Word;
begin

  I := 0;

  while I <= FDir.Count - 1 do begin

    N := FDir.Count - I;
    for J := I + 1 to FDir.Count - 1 do begin
      T := TDirItem(FDir[J]);
      if T.Start then begin
         N := J - I;
         Break;
      end;
    end;

    // Write IFD size

    DirSize := N;
    FStream.Write(DirSize, SizeOf(DirSize));

    // Write image IFD

    for J := I to I + N - 1 do begin
      T := TDirItem(FDir[J]);
      T.Position := FStream.Position;
      FStream.Write(T.Entry, SizeOf(T.Entry));
    end;

    // Write link to next IFD

    if (I + N - 1) < (FDir.Count - 1) then begin
       Pos := FStream.Position + 4;
       FStream.Write(Pos, SizeOf(Pos));
    end;

    I := I + N;

  end;

  Pos := 0;
  FStream.Write(Pos, SizeOf(Pos));

  if FDir.Count > 0 then begin
     T := TDirItem(FDir[0]);
     FStream.Seek(4, soFromBeginning);
     Pos := T.Position - 2;
     FStream.Write(Pos, SizeOf(Pos));
  end;
end;

procedure TTIFImage.ProcessImage(Bitmap: TBitmap);
begin
  UpdateItem($0100, Bitmap.Width);
  UpdateItem($0101, Bitmap.Height);
  UpdateItem($0116, Bitmap.Height);

  if Bitmap.PixelFormat in [pf1bit] then begin
     ProcessBW(Bitmap);
  end;

  if Bitmap.PixelFormat in [pf4bit, pf8bit] then begin
     ProcessPal(Bitmap);
  end;

  if Bitmap.PixelFormat in [pfDevice, pf16bit, pf32Bit, pfCustom] then begin
     Bitmap.PixelFormat := pf24bit;
     ProcessRGB(Bitmap);
  end;

  if Bitmap.PixelFormat in [pf24bit] then begin
     ProcessRGB(Bitmap);
  end;
end;

procedure TTIFImage.ProcessPal(Bitmap: TBitmap);
var
  Line: PByteArray;
  I: Integer;
  R: String;
  DC, hOld: hDC;
  ColSize, RowSize: Integer;
  ColTbl: array[0..255] of TRGBQuad;
  ColRed: array[0..255] of Word;
  ColGrn: array[0..255] of Word;
  ColBlu: array[0..255] of Word;
begin

  AddItem($0102, $0003, $00000001, $00000008, False);         // BitsPerSample

  if Bitmap.PixelFormat = pf4Bit then begin
     ColSize   := 16;
     RowSize   := Bitmap.Width div 2;
     UpdateItem($0102, 4);
  end else begin
     ColSize   := 256;
     RowSize   := Bitmap.Width;
     UpdateItem($0102, 8);
  end;

  AddItem($0140, $0003, ColSize * 3, $00000008, False);   // ColorMap
  UpdateItem($0106, 3);
  UpdateItem($0117, RowSize * Bitmap.Height);

  DC := CreateCompatibleDC(0);
  hOld := SelectObject(DC, Bitmap.Handle);
  GetDIBColorTable(DC, 0, ColSize, ColTbl);
  SelectObject(DC, hOld);
  DeleteDC(DC);

  for I := 0 to ColSize - 1 do begin
    ColRed[I] := ColTbl[I].rgbRed * 256;
    ColGrn[I] := ColTbl[I].rgbGreen * 256;
    ColBlu[I] := ColTbl[I].rgbBlue * 256;
  end;

  UpdateItem($0140, FStream.Position);
  FStream.Write(ColRed, ColSize * 2);
  FStream.Write(ColGrn, ColSize * 2);
  FStream.Write(ColBlu, ColSize * 2);

  UpdateItem($011A, FStream.Position);
  FStream.Write(XYResolution, SizeOf(XYResolution));
  UpdateItem($011B, FStream.Position);
  FStream.Write(XYResolution, SizeOf(XYResolution)); // X is same as Y

  UpdateItem($0111, FStream.Position);

  for I := 0 to Bitmap.Height - 1 do begin
    Line := Bitmap.ScanLine[I];
    R := RLECompress(Line, RowSize);
    FStream.Write(R[1], Length(R));
//    FStream.Write(Line^, RowSize);
  end;

end;

function TTIFImage.RLECompress(Byte: PByteArray; Size: Integer): String;
var
  C, LastOut, LastBuf: String;
  I, LastCnt: Integer;
begin

  C := '';
  Result  := '';
  LastOut := '';
  LastCnt := 0;

  for I := 0 to Size - 1 do begin

    C := CHR(Byte[I]);

    if (C = LastOut) and (LastCnt <= 127) then begin
       if Length(LastBuf) > 0 then begin
          Result := Result + CHR((Length(LastBuf)) - 1) + LastBuf;
          LastBuf := '';
       end;
       Inc(LastCnt);
    end else begin
       if LastCnt = 0 then begin
       end else if LastCnt > 1 then begin
          Result := Result + CHR(257 - LastCnt) + LastOut;
       end else begin
          LastBuf := LastBuf + LastOut;
          if Length(LastBuf) >= 128 then begin
             Result := Result + CHR((Length(LastBuf)) - 1) + LastBuf;
             LastBuf := '';
          end;
       end;
       LastCnt := 1;
       LastOut := C;
    end;

  end;

  if Length(LastBuf) > 0 then begin
     Result := Result + CHR((Length(LastBuf)) - 1) + LastBuf;
  end;

  if LastCnt = 1 then begin
     Result := Result + CHR(0) + LastOut;
  end;

  if LastCnt > 1 then begin
     Result := Result + CHR(257 - LastCnt) + LastOut;
  end;

end;

procedure TTIFImage.ProcessBW(Bitmap: TBitmap);
var
  Line: PByteArray;
  RowSize, I: Integer;
begin

  RowSize := Trunc(Ceil(Bitmap.Width / 8));

  UpdateItem($0117, RowSize * Bitmap.Height);
  UpdateItem($0106, 1);

  UpdateItem($011A, FStream.Position);
  FStream.Write(BWResolution, SizeOf(BWResolution));
  UpdateItem($011B, FStream.Position);
  FStream.Write(BWResolution, SizeOf(BWResolution)); // X is same as Y

  UpdateItem($0111, FStream.Position);

  for I := 0 to Bitmap.Height - 1 do begin
    Line := Bitmap.ScanLine[I];
    FStream.Write(Line^, RowSize);
  end;

end;

procedure TTIFImage.ProcessRGB(Bitmap: TBitmap);
var
  Col: Byte;
  Line: PByteArray;
  ColorPix, I, J: Integer;
begin

  AddItem($0102, $0003, $00000003, $00000008, False);   // BitsPerSample
  AddItem($0115, $0003, $00000001, $00000003, False);   // SamplesPerPixels

  ColorPix := 3;

  UpdateItem($0117, ColorPix * Bitmap.Width * Bitmap.Height);
  UpdateItem($0103, 1);

  UpdateItem($011A, FStream.Position);
  FStream.Write(XYResolution, SizeOf(XYResolution));
  UpdateItem($011B, FStream.Position);
  FStream.Write(XYResolution, SizeOf(XYResolution)); // X is same as Y
  UpdateItem($0102, FStream.Position);
  FStream.Write(BitsPerSample, SizeOf(BitsPerSample));

  UpdateItem($0111, FStream.Position);

  for I := 0 to Bitmap.Height - 1 do begin

    Line := Bitmap.ScanLine[I];

    // Swap R & B bytes

    for J := 0 to Bitmap.Width - 1 do begin
      Col := Line[(J * ColorPix) + 2];      // Red
      FStream.Write(Col, SizeOf(Col));
      Col := Line[(J * ColorPix) + 1];      // Green
      FStream.Write(Col, SizeOf(Col));
      Col := Line[(J * ColorPix) + 0];      // Blue
      FStream.Write(Col, SizeOf(Col));
    end;

  end;

end;

end.
