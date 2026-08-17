unit QExport3RTFList;

{$I VerCtrl.inc}

interface

uses Classes, QExport3
     {$IFDEF WIN32}
       , Windows {$IFNDEF NOGUI}, Graphics{$ELSE}, QExport3Graphics{$ENDIF}
     {$ENDIF}
     {$IFDEF LINUX}
       {$IFNDEF NOGUI}, QGraphics{$ELSE}, QExport3Graphics{$ENDIF}
     {$ENDIF};

type

  TRTFHeader = class
  private
    FDefaultFont: integer;
    FVersion: integer;
    FDefaultTab: integer;
    FCode: string;
    function GetSize: integer;
  public
  {$IFDEF VCL3}
    constructor Create(AVersion: integer; const ACode: string; ADefaultFont: integer;
                        ADefaultTab: integer);
  {$ELSE}
    constructor Create(AVersion: integer = 1; const ACode: string = 'ansi';
                       ADefaultFont: integer = 0; ADefaultTab: integer = 720);
  {$ENDIF}
    property Version: integer read FVersion write FVersion;
    property Code: string read FCode write FCode;
    property DefaultFont: integer read FDefaultFont write FDefaultFont;
    property DefaultTab: integer read FDefaultTab write FDefaultTab;
    property Size: integer read GetSize;
  end;

  TRTFFontTableItem = class
  private
    FFontNumber: integer;
    FFontFamily: string;
    FFontName: string;
    procedure SetFontFamily(const Value: string);
    procedure SetFontName(const Value: string);
    procedure SetFontNumber(const Value: integer);
    function GetSize: integer;
    function GetAsText: string;
  public
    constructor Create(ANumber: integer; const AFamily, AName: string);
    property FontNumber: integer read FFontNumber write SetFontNumber;
    property FontFamily: string read FFontFamily write SetFontFamily;
    property FontName: string read FFontName write SetFontName;
    property Size: integer read GetSize;
    property AsText: string read GetAsText;
  end;

  TRTFFontTable = class(TList)
  private
    procedure FreeAll;
    function GetFontItems(index: integer): TRTFFontTableItem;
    procedure SetFontItems(index: integer; const Value: TRTFFontTableItem);
    function GetSize: integer;
  public
    destructor Destroy; override;
    function GetFontIndexByName(const FontName: string): integer;
    property FontItems[index: integer]: TRTFFontTableItem read GetFontItems
      write SetFontItems; default;
    property Size: integer read GetSize;
    function GetNextNumber: Integer;
  end;

  TRTFColorTableItem = class
  private
    FRed: integer;
    FGreen: integer;
    FBlue: integer;
    function GetSize: integer;
    function GetAsText: string;
    function GetColor: TColor;
   public
 {$IFDEF VCL3}
    constructor Create(Color: TColor);
    constructor CreateRGB(ARed, AGreen, ABlue: integer);
 {$ELSE}
    constructor Create(ARed, AGreen, ABlue: integer); overload;
    constructor Create(Color: TColor); overload;
 {$ENDIF}
    property Red: integer read FRed write FRed;
    property Green: integer read FGreen write FGreen;
    property Blue: integer read FBlue write FBlue;
    property Color: TColor read GetColor;
    property AsText: string read GetAsText;
    property Size: integer read GetSize;
  end;

  TRTFColorTable = class(TList)
  private
    procedure FreeAll;
    function GetColors(index: integer): TRTFColorTableItem;
    procedure SetColors(index: integer; const Value: TRTFColorTableItem);
    function GetSize: Integer;
    function GetColorIndex(Color: TColor): integer;
  public
    destructor Destroy; override;
    property Colors[index: integer]: TRTFColorTableItem read GetColors
      write SetColors; default;
    property Size: Integer read GetSize;
    function GetNextNumber: integer;
  end;

  TrtfColorType = (ctText, ctBackground, ctHighlight);

  TQRTFWriter = class(TQExportWriter)
  private
    FHeader: TRTFHeader;
    FFontTable: TRTFFontTable;
    FColorTable: TRTFColorTable;
    procedure SetHeader(const Value: TRTFHeader);
  public
    constructor Create(AOwner: TQExport3; AStream: TStream); override;
    destructor Destroy; override;
    procedure WriteBOF;
    procedure WriteEOF;
    procedure WritePara;
    procedure WriteHeader;
    procedure WriteFontTable;
    procedure WriteColorTable;
    procedure AddFont(AFont: TRTFFontTableItem);
    procedure AddColor(AColor: TRTFColorTableItem);
    procedure SetFont(Font: TFont; NeedWrite: boolean; var FontStr: string);
    function GetFontText(Font: TFont; Local: boolean): string;
    function GetColorText(Color: TColor; ColorType: TrtfColorType): string;
    property Header: TRTFHeader read FHeader write SetHeader;
    procedure Insert(APosition: integer; const Buffer; Count: Integer);
    function AlignToStr(Value: TQExportColAlign): string; override;
  end;

implementation

uses SysUtils;

const // do not localize

  { RTF Header }
  SRTFVersion = '\rtf%d';
  SCode = '\%s';
  SDefaultFont = '\deff%d';
  SDefaultTab = '\deftab%d';

  { RTF Font table }
  SNil = 'nil';
  SFontTable = '{\fonttbl';
  SFontItem = '{\f%d\f%s %s;}';

  { RTF Color table}
  SColorTable = '{\colortbl';
  SColorItem = '\red%d\green%d\blue%d;';

{ TRTFFontTable }

constructor TRTFFontTableItem.Create;
begin
  inherited Create;
  FFontNumber := ANumber;
  FFontFamily := AFamily;
  FFontName := AName;
end;

function TRTFFontTableItem.GetAsText: string;
begin
  Result := Format(SFontItem, [FontNumber, FontFamily, FontName]);
end;

function TRTFFontTableItem.GetSize: integer;
begin
  Result := Length(GetAsText);
end;

procedure TRTFFontTableItem.SetFontFamily(const Value: string);
begin
  if FFontFamily <> Value then FFontFamily := Value;
end;

procedure TRTFFontTableItem.SetFontName(const Value: string);
begin
  if FontName <> Value then FFontName := Value;
end;

procedure TRTFFontTableItem.SetFontNumber(const Value: integer);
begin
  if FFontNumber <> Value then FFontNumber := Value;
end;

{ TRTFFontTable }

procedure TRTFFontTable.FreeAll;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if Assigned(Items[i]) then
      TRTFFontTableItem(Items[i]).Free; // !!!
end;

destructor TRTFFontTable.Destroy;
begin
  FreeAll;
  inherited Destroy;
end;

function TRTFFontTable.GetFontItems(index: integer): TRTFFontTableItem;
begin
  Result := TRTFFontTableItem(Items[index]);
end;

procedure TRTFFontTable.SetFontItems(index: integer;
  const Value: TRTFFontTableItem);
begin
  TRTFFontTableItem(Items[index]).FontNumber := Value.FontNumber;
  TRTFFontTableItem(Items[index]).FontFamily := Value.FontFamily;
  TRTFFontTableItem(Items[index]).FontName := Value.FontName;
end;

function TRTFFontTable.GetFontIndexByName(const FontName: string): integer;
begin
  for Result := 0 to Count - 1 do
    if CompareText(FontName, FontItems[Result].FontName) = 0 then exit;
  Result := -1;
end;

function TRTFFontTable.GetSize: integer;
var
  I: Integer;
begin
  Result := Length(SFontTable) + 2; //  + CRLF
  for I := 0 to Count - 1 do
    Result := Result + FontItems[I].Size;
end;

function TRTFFontTable.GetNextNumber: Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Count - 1 do begin
    if FontItems[I].FontNumber > Result then
      Result := FontItems[I].FontNumber;
  end;
  if Result <> -1 then inc(Result);
end;

{ TQRTFWriter }

constructor TQRTFWriter.Create;
begin
  inherited;
{$IFDEF VCL3}
  FHeader := TRTFHeader.Create(1, 'ansi', 0, 720);
{$ELSE}
  FHeader := TRTFHeader.Create;
{$ENDIF}
  FFontTable := TRTFFontTable.Create;
  FColorTable := TRTFColorTable.Create;
end;

destructor TQRTFWriter.Destroy;
begin
  FFontTable.Free;
  FColorTable.Free;
  FHeader.Free;
  inherited;
end;

procedure TQRTFWriter.AddColor(AColor: TRTFColorTableItem);
begin
  FColorTable.Add(AColor);
end;

procedure TQRTFWriter.AddFont(AFont: TRTFFontTableItem);
begin
  FFontTable.Add(AFont);
end;

function TQRTFWriter.GetColorText(Color: TColor; ColorType: TrtfColorType): string;
var
  ColorIndex, CurPos: Integer;
  CurItem: TRTFColorTableItem;
  ResStr: string;
begin
  Result := '';
  ColorIndex := FColorTable.GetColorIndex(Color);
  if ColorIndex = -1 then begin
    CurPos := Header.Size + FFontTable.Size + FColorTable.Size;
    CurItem := TRTFColorTableItem.Create(Color);
    AddColor(CurItem);
    Insert(CurPos, CurItem.AsText[1], Length(CurItem.AsText));
    ColorIndex := FColorTable.GetNextNumber;
  end;
  case ColorType of
    ctText: ResStr := '\cf%d';
    ctBackground: ResStr := '\cbpat%d';
    ctHighlight: ResStr := '\highlight%d';
  end;
  Result := Format(ResStr, [ColorIndex]);
end;

function TQRTFWriter.GetFontText(Font: TFont; Local: boolean): string;
var
  FontIndex, CurPos: integer;
  CurItem: TRTFFontTableItem;
begin
  Result := '';
  FontIndex := FFontTable.GetFontIndexByName(Font.Name);
  if FontIndex = -1 then begin
    CurPos := Header.Size + FFontTable.Size;
    CurItem := TRTFFontTableItem.Create(FFontTable.GetNextNumber, SNil,
      Font.Name);
    AddFont(CurItem);
    Insert(CurPos, CurItem.AsText[1], Length(CurItem.AsText));
    Result := Format('\f%d', [FontIndex]);
  end;
end;

procedure TQRTFWriter.WriteBOF;
begin
  Write('{');
end;

procedure TQRTFWriter.WriteHeader;
begin
  with FHeader do begin
    Write(Format(SRTFVersion, [Version]));
    Write(Format(SCode, [Code]));
    Write(Format(SDefaultFont, [DefaultFont]));
    WriteLn(Format(SDefaultTab, [DefaultTab]));
  end;
end;

procedure TQRTFWriter.Insert(APosition: integer; const Buffer; Count: Integer);
var
  P: Pointer;
  BufferSize: LongInt;
begin
  BufferSize := Stream.Size - APosition;
  {$IFDEF WIN32}
  P := VirtualAlloc(nil, BufferSize, MEM_COMMIT, PAGE_READWRITE);
  {$ENDIF}
  {$IFDEF LINUX}
  GetMem(P, BufferSize);
  {$ENDIF}
  if not Assigned(P) then
    raise Exception.Create('VirtualAlloc failed! :-(');
  try
    Stream.Position := APosition;
    Stream.ReadBuffer(P^, BufferSize);
    Stream.Position := APosition;
    Stream.WriteBuffer(Buffer, Count);
    Stream.WriteBuffer(P^, BufferSize);
  finally
    {$IFDEF WIN32}
    VirtualFree(P, 0, MEM_RELEASE);
    {$ENDIF}
    {$IFDEF LINUX}
    FreeMem(P);
    {$ENDIF}
  end;
end;

procedure TQRTFWriter.WritePara;
begin
  WriteLn('\par');
end;

procedure TQRTFWriter.SetFont(Font: TFont; NeedWrite: boolean; var FontStr: string);
var
  FontIndex, CurPos: integer;
  CurItem: TRTFFontTableItem;
begin
  FontIndex := FFontTable.GetFontIndexByName(Font.Name);
  if FontIndex = -1 then begin
    CurPos := Header.Size + FFontTable.Size;
    CurItem := TRTFFontTableItem.Create(FFontTable.GetNextNumber, SNil,
      Font.Name);
    AddFont(CurItem);
    Insert(CurPos - 1, CurItem.AsText[1], Length(CurItem.AsText));
    FontIndex := CurItem.FontNumber;
  end;
  FontStr := Format('\f%d', [FontIndex]) + Format('\fs%d', [Font.Size * 2]);
  if NeedWrite then WriteLn(FontStr);
end;

procedure TQRTFWriter.SetHeader(const Value: TRTFHeader);
begin
  FHeader.Version := Value.Version;
  FHeader.Code := Value.Code;
  FHeader.DefaultFont := Value.DefaultFont;
  FHeader.DefaultTab := Value.DefaultTab;
end;

procedure TQRTFWriter.WriteColorTable;
var
  i: integer;
begin
  Write(SColorTable);
  for i := 0 to FColorTable.Count - 1  do
    Write(FColorTable[i].AsText);
  WriteLn('}')
end;

procedure TQRTFWriter.WriteEOF;
begin
  Write('}');
end;

procedure TQRTFWriter.WriteFontTable;
var
  I: Integer;
begin
  Write(SFontTable);
  for i := 0 to FFontTable.Count - 1 do Write(FFontTable[I].AsText);
  WriteLn('}');
end;

function TQRTFWriter.AlignToStr(Value: TQExportColAlign): string;
begin
  case Value of
    ecaLeft: Result := '\ql';
    ecaCenter: Result := '\qc';
    ecaRight: Result := '\qr';
    else Result := EmptyStr;
  end
end;

{ TRTFHeader }

constructor TRTFHeader.Create;
begin
  inherited Create;
  FVersion := AVersion;
  FCode := ACode;
  FDefaultFont := ADefaultFont;
  FDefaultTab := ADefaultTab;
end;

function TRTFHeader.GetSize: integer;
begin
  Result := Length(SRTFVersion) - 2 + Length(IntToStr(FVersion)) +
    Length(SCode) - 2 + Length(FCode) +
    Length(SDefaultFont) - 2 + Length(IntToStr(FDefaultFont)) +
    Length(SDefaultTab) - 2 + Length(IntToStr(FDefaultTab)) +  2;
end;

{ TRTFColorTableItem }

constructor TRTFColorTableItem.Create(Color: TColor);
var
  RGBColor: LongInt;
begin
  inherited Create;
  RGBColor := Color;
  {$IFDEF WIN32}
  FRed := GetRValue(RGBColor);
  FGreen := GetGValue(RGBColor);
  FBlue := GetBValue(RGBColor);
  {$ELSE}
  FRed := Byte(RGBColor);
  FGreen := Byte(RGBColor shr 8);
  FBlue := Byte(RGBColor shr 16);
  {$ENDIF}
end;

{$IFDEF VCL3}
constructor TRTFColorTableItem.CreateRGB(ARed, AGreen, ABlue: integer);
{$ELSE}
constructor TRTFColorTableItem.Create(ARed, AGreen, ABlue: integer);
{$ENDIF}
begin
  inherited Create;
  FRed := ARed; FGreen := AGreen; FBlue := ABlue;
end;

function TRTFColorTableItem.GetSize: integer;
begin
  Result := Length(GetAsText);
end;

function TRTFColorTableItem.GetAsText: string;
begin
  Result := Format(SColorItem, [Red, Green, Blue]);
end;

function TRTFColorTableItem.GetColor: TColor;
begin
  {$IFDEF WIN32}
  Result := RGB(FRed, FGreen, FBlue);
  {$ELSE}
  Result := (FRed or (FGreen shl 8) or (FBlue shl 16));
  {$ENDIF}
end;

{ TRTFColorTable }

destructor TRTFColorTable.Destroy;
begin
  FreeAll;
  inherited Destroy;
end;

procedure TRTFColorTable.FreeAll;
var
  i: integer;
begin
  for i := 0 to Count - 1 do begin
    if Assigned(Items[i]) then
      TRTFColorTableItem(Items[i]).Free;
  end;
end;

function TRTFColorTable.GetColorIndex(Color: TColor): integer;
begin
  for Result := 0 to Count - 1 do
    if GetColors(Result).Color = Color then exit;
  Result := -1;
end;

function TRTFColorTable.GetColors(index: integer): TRTFColorTableItem;
begin
  Result := TRTFColorTableItem(Items[index]);
end;

function TRTFColorTable.GetNextNumber: Integer;
begin
  Result := Count - 1;
end;

function TRTFColorTable.GetSize: Integer;
var
  I: Integer;
begin
  Result := Length(SColorTable) + 2; //  + CRLF
  for I := 0 to Count - 1 do
    Result := Result + Colors[I].Size;
end;

procedure TRTFColorTable.SetColors(index: integer;
  const Value: TRTFColorTableItem);
begin
  with TRTFColorTableItem(Items[index]) do begin
    Red := Value.Red;
    Green := Value.Green;
    Blue := Value.Blue;
  end;
end;

end.
