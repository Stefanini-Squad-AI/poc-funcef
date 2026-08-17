unit QExport3PDF;

interface

{$I VerCtrl.inc}

uses Classes, SysUtils, DB, QExport3{$IFDEF VCL6}, Variants{$ENDIF}

  {$IFDEF WIN32}
    , Windows {$IFNDEF NOGUI}, Graphics{$ELSE}, QExport3Graphics{$ENDIF}
  {$ENDIF}
  {$IFDEF LINUX}
    , Types {$IFNDEF NOGUI}, QGraphics{$ELSE}, QExport3Graphics{$ENDIF}
  {$ENDIF};

type

  TPDFFontName = (poHelvetica, poHelveticaBold, poHelveticaOblique,
    poHelveticaBoldOblique, poCourier, poCourierBold, poCourierOblique,
    poCourierBoldOblique, poTimesRoman, poTimesBold, poTimesItalic,
    poTimesBoldItalic, poSymbol, poZapfDingbats);

  TPDFFontEncoding = (poStandardEncoding, poWinAnsiEncoding,
    poMacRomanEncoding, poPDFDocEncoding);

  TPDFBox = class;

  TPDFFont = class(TPersistent)
  private
    FFontName: string;
    FBaseFont: TPDFFontName;
    FFontSize: integer;
    FFontEncoding: TPDFFontEncoding;
    FFontColor: TColor;
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    property FontName: string read FFontName write FFontName;
  published
    property BaseFont: TPDFFontName read FBaseFont write FBaseFont
      default poHelvetica;
    property FontEncoding: TPDFFontEncoding read FFontEncoding
      write FFontEncoding default poWinAnsiEncoding;
    property FontSize: integer read FFontSize write FFontSize default 10;
    property FontColor: TColor read FFontColor write FFontColor
      default clBlack;
  end;

  TPDFDocument = class(TComponent)
  private
    FPDFFile: TStream;
    FPageContents: TStringList;
    FStreamBegin: integer;
    FObjOffsets: TStringList;
    FFonts: TStringList;
    FObjNumber: integer;
    FFont: TPDFFont;
    FLineWidth: double;
    FLineSpacing: double;
    FLineColor: TColor;
    FFillColor: TColor;

    FMediaBox: TPDFBox;
    FTrimBox: TPDFBox;

    function AddObj: integer;
    procedure WriteStr2PDF(Source: string);
    procedure WriteBOF;
    //procedure WriteInfo;
    function WriteCatalog(PagesNum, OutLinesNum: integer): integer;
    function WriteOutLines: integer;
    function WriteResources : integer;
    function WritePages(FontsObj: integer): integer;
    function WriteXref: integer;
    procedure WriteTrailer(CatalogNum: integer; XrefOffset: integer);
    procedure WriteEof;
    procedure SetFont(Value: TPDFFont);
    function GetMediaBox: TPDFBox;
    function GetTrimBox: TPDFBox;
    procedure SetMediaBox(const Value: TPDFBox);
    procedure SetTrimBox(const Value: TPDFBox);
  public
    //constructor Create(AOwner: TComponent; Stream: TStream);
    constructor CreateWithStream(AOwner: TComponent; Stream: TStream);
    destructor Destroy; override;
    procedure BeginDoc;
    procedure EndDoc;
    procedure AddFont(NewFont: TPDFFont);
    procedure NewPage;
    procedure EndPage;
    procedure StringOut(x, y: integer; const Str: string; Color: TColor);
    procedure TextOut(x, y: integer; const Text: TStrings);
    procedure Line(x1, y1, x2, y2: double; Color: TColor);
    procedure FillRect(x1, y1, x2, y2: double; Color: TColor);
    procedure SetTextFont(Value: TPDFFont);
    function ChangeFillColor(Color: TColor): TColor;
    function ChangeLineColor(Color: TColor): TColor;
  published
    property ObjNumber: integer read FObjNumber;
    property Font: TPDFFont read FFont write SetFont;
    property LineWidth: double read FLineWidth write FLineWidth;
    property LineSpacing: double read FLineSpacing write FLineSpacing;
    property LineColor: TColor read FLineColor;
    property FillColor: TColor read FFillColor;

    property MediaBox: TPDFBox read GetMediaBox write SetMediaBox;
    property TrimBox: TPDFBox read GetTrimBox write SetTrimBox;
  end;

  TQPDFWriter = class(TQExportWriter)
  private
    FPDFDocument: TPDFDocument;
  public
    constructor Create(AOwner: TQExport3; AStream: TStream); override;
    destructor Destroy; override;
  published
    property PDFDocument: TPDFDocument read FPDFDocument;
  end;

  TPDFBox = class(TPersistent)
  private
    FLeft, FBottom, FRight, FTop: integer;
  public
    procedure Assign(Source: TPersistent); override;
  published
    property Left: integer read FLeft write FLeft;
    property Bottom: integer read FBottom write FBottom;
    property Right: integer read FRight write FRight;
    property Top: integer read FTop write FTop;
  end;

  TQExportPDFPageOptions = class(TPersistent)
  private
    FUnits: TQExportUnits;
    FFormat: TQExportPageFormat;
    FWidth: integer;
    FHeight: integer;
    FOrientation: TQExportPageOrientation;
    FMarginLeft: integer;
    FMarginRight: integer;
    FMarginTop: integer;
    FMarginBottom: integer;

    FMediaBox: TPDFBox;
    FTrimBox: TPDFBox;

    procedure SetFormat(const Value: TQExportPageFormat);
    function IsWidth: boolean;
    function GetWidth: double;
    procedure SetWidth(const Value: double);
    function IsHeight: boolean;
    function GetHeight: double;
    procedure SetHeight(const Value: double);
    procedure SetOrientation(const Value: TQExportPageOrientation);
    function GetMarginLeft: double;
    procedure SetMarginLeft(const Value: double);
    function GetMarginRight: double;
    procedure SetMarginRight(const Value: double);
    function GetMarginTop: double;
    procedure SetMarginTop(const Value: double);
    function GetMarginBottom: double;
    procedure SetMarginBottom(const Value: double);
    function GetMediaBox: TPDFBox;
    function GetTrimBox: TPDFBox;
  protected
    property MediaBox: TPDFBox read GetMediaBox;
    property TrimBox: TPDFBox read GetTrimBox;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    // Порядок важен - загружается в Менеджерах в таком порядке
    property Units: TQExportUnits read FUnits write FUnits default unInch;
    property Width: double read GetWidth write SetWidth stored IsWidth;
    property Height: double read GetHeight write SetHeight stored IsHeight;
    property Format: TQExportPageFormat read FFormat write SetFormat default pfA4;
    // До сюда
    property Orientation: TQExportPageOrientation read FOrientation
      write SetOrientation default poPortrait;
    property MarginLeft: double read GetMarginLeft write SetMarginLeft;
    property MarginRight: double read GetMarginRight write SetMarginRight;
    property MarginTop: double read GetMarginTop write SetMarginTop;
    property MarginBottom: double read GetMarginBottom write SetMarginBottom;
  end;

  TPDFOptions = class(TPersistent)
  private
    FHeaderFont: TPDFFont;
    FCaptionFont: TPDFFont;
    FDataFont: TPDFFont;
    FFooterFont: TPDFFont;

    FPageOptions: TQExportPDFPageOptions;

    FRowSpacing: double;
    FColSpacing: double;
    FGridLineWidth: integer;
    FGridLineColor: TColor;

    function IsRowSpacing: boolean;
    function IsColSpacing: boolean;
    procedure SetHeaderFont(const Value: TPDFFont);
    procedure SetCaptionFont(const Value: TPDFFont);
    procedure SetDataFont(const Value: TPDFFont);
    procedure SetFooterFont(const Value: TPDFFont);
    procedure SetPageOptions(const Value: TQExportPDFPageOptions);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property PageOptions: TQExportPDFPageOptions read FPageOptions
      write SetPageOptions;

    property HeaderFont: TPDFFont read FHeaderFont write SetHeaderFont;
    property CaptionFont: TPDFFont read FCaptionFont write SetCaptionFont;
    property DataFont: TPDFFont read FDataFont write SetDataFont;
    property FooterFont: TPDFFont read FFooterFont write SetFooterFont;

    property RowSpacing: double read FRowSpacing write FRowSpacing
      stored IsRowSpacing;
    property ColSpacing: double read FColSpacing write FColSpacing
      stored IsColSpacing;
    property GridLineWidth: integer read FGridLineWidth write FGridLineWidth
      default 1;
    property GridLineColor: TColor read FGridLineColor write FGridLineColor
      default clBlack;
  end;

  TQExport3PDF = class(TQExport3FormatText)
  private
    FOptions: TPDFOptions;
    CurY : integer;
    TableBeginY: integer;
    //ColXs: array of integer;
    ColXs: TList;
    procedure SetOptions(const Value: TPDFOptions);
    procedure PlotVertGridLines(Top: integer; Bottom: integer);
  protected
    procedure BeginExport; override;
    procedure WriteCaptionRow; override;
    procedure WriteDataRow; override;
    procedure WriteHeader;
    procedure WriteFooter;
    procedure EndExport; override;
    function GetWriter: TQPDFWriter;
    function GetWriterClass: TQExportWriterClass; override;
    function GetSpecialCharacters: TSpecialCharacters; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function NormalString(const S: string): string; override;
    //procedure Abort; override;
  published
    property Options: TPDFOptions read FOptions write SetOptions;
    property ColumnsWidth;
    property ColumnsAlign;
    property OnGetCellParams;
  end;

implementation

uses QExport3Common;

const
  QER_FontAlreadyExist = 'Font %s already exists';

  stPDFBof = '%PDF-1.3'#$0D;

  stPDFInfo = '%d 0 obj'#$0D+
              '<< /Producer (%s)'#$0D+
              '/Author (%s)'#$0D+
              '/CreationDate (%s)'#$0D+
              '/Creator (%s)'#$0D+
              '/Keywords (%s)'#$0D+
              '/Subject (%s)'#$0D+
              '/Title (%s)'#$0D+
              '/ModDate (%s)'#$0D+
              '>>'#$0D+
              'endobj'#$0D;


  stPDFCatalog = '%d 0 obj'#$0D+
                  '<< /Type /Catalog '#$0D+
                  '/Pages %d 0 R '#$0D+
                  '/Outlines %d 0 R '#$0D+
                  '>>'#$0D+
                  'endobj'#$0D;

  stPDFOutLines = '%d 0 obj'#$0D+
                   '<< /Type /Outlines'#$0D+
                   '/Count 0'#$0D+
                   '>>'#$0D+
                   'endobj'#$0D;

  stPDFPages = '%d 0 obj'#$0D+
                '<< /Type /Pages'#$0D+
                '/Count %d'#$0D+
                '/Kids [%s]'#$0D+
                '>>'#$0D+
                'endobj'#$0D;

  stPDFFont = '%d 0 obj'#$0D+
              '<< /Type /Font'#$0D+
              '/Subtype /Type1'#$0D+
              '/Name /%s'#$0D+
              '/BaseFont /%s'#$0D+
              '/Encoding /%s'#$0D+
              '/FirstChar 0'#$0D+
              '/LastChar 255'#$0D+
              '/Widths [%s]'#$0D+
              '>>'#$0D+
              'endobj'#$0D;

  stPDFResources = '%d 0 obj'#$0D+
                   '<< /Font <<%s >> /ProcSet [ /PDF /Text ] >>'#$0D+
                   'endobj'#$0D;

  stPDFPage = '%d 0 obj'#$0D+
               '<< /Type /Page'#$0D+
               '/Parent %d 0 R'#$0D+
               '/Resources %d 0 R'#$0D+
               '/MediaBox [%d %d %d %d]'#$0D+
               '/TrimBox [%d %d %d %d]'#$0D+
               '/Contents %s'#$0D+
               '>>'#$0D+
               'endobj'#$0D;

  stPDFStreamHeader  = '%d 0 obj'#$0D+
                       '<< /Length %d 0 R >>'#$0D+
                       'stream'#$0D;

  stPDFStreamFooter = 'endstream'#$0D+
                      'endobj'#$0D;

  stPDFText = 'BT'#$0D+
                    '/%s %d Tf'#$0D+
                    '%d %d Td (%s) Tj'#$0D+
                    'ET'#$0D;

  stPDFSetFillColor = '%f %f %f rg'#$0D;

  stPDFSetLineColor = '%f %f %f RG'#$0D;


  stPDFLine = '%.1f %.1f m '#$0D+
              '%.1f %.1f l '#$0D+
              '%.1f w '#$0D+
              'S'#$0D;

  stPDFRect = '%.1f %.1f %.1f %.1f re %s'#$0D;


  stPDFStreamLength = '%d 0 obj'#$0D+
                      '%d '#$0D+
                      'endobj'#$0D;

  stPDFXRefHeader = 'xref'#$0D+
                     '0 %d'#$0D+
                     '0000000000 65535 f '#$0D;

  stPDFXRefBody = '%10.10d 00000 n '#$0D;

  stPDFTrailer = 'trailer'#$0D+
                  '<< /Size %d'#$0D+
                  '/Root %d 0 R'#$0D+
                  '>>'#$0D+
                  'startxref'#$0D+
                  '%d'#$0D;

  stPDFEof = '%%EOF';

  PDFFontStringName: array [1..14] of string = ('Helvetica','Helvetica-Bold',
    'Helvetica-Oblique','Helvetica-BoldOblique', 'Courier', 'Courier-Bold',
    'Courier-Oblique', 'Courier-BoldOblique', 'Times-Roman', 'Times-Bold',
    'Times-Italic', 'Times-BoldItalic', 'Symbol', 'ZapfDingbats');

  PDFEncodingStringName: array [1..4] of string = ('StandardEncoding',
    'WinAnsiEncoding', 'MacRomanEncoding', 'PDFDocEncoding');

  FontBaseWidths: array[1..256] of integer =(
    300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300,
    300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300, 300,
    275, 389, 333, 600, 556, 1000, 722, 222, 389, 389, 556, 600, 278, 333, 278, 278,
    556, 556, 556, 556, 556, 556, 556, 556, 556, 556, 333, 333, 600, 600, 600, 500,
    1000, 667, 667, 700, 667, 667, 611, 750, 722, 389, 500, 667, 611, 889, 722, 750,
    667, 750, 667, 611, 611, 722, 667, 944, 667, 667, 611, 389, 278, 389, 600, 500,
    278, 500, 500, 500, 500, 500, 333, 500, 500, 278, 278, 500, 278, 820, 540, 500,
    540, 500, 389, 500, 333, 550, 444, 722, 500, 444, 500, 333, 222, 333, 600, 275,
    667, 667, 611, 667, 722, 611, 722, 500, 500, 500, 500, 500, 500, 444, 500, 500,
    500, 500, 278, 278, 278, 278, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500,
    556, 400, 556, 556, 556, 500, 600, 556, 800, 800, 990,278, 278, 275, 1000, 611,
    275, 600, 275, 275, 667, 576, 275, 275, 275, 275, 275, 350, 350, 275, 778, 500,
    500, 389, 600, 275, 556, 275, 275, 556, 556, 1000, 275, 667, 667, 611, 944, 778,
    500, 1000, 556, 556, 278, 278, 600, 275, 444, 667, 167, 600, 389, 389, 556, 556,
    556, 278, 278, 556, 1000, 667, 667, 667, 667, 667, 389, 389, 389, 389, 611, 611,
    275, 611, 722, 722, 722, 278, 278, 278, 278, 278, 278, 278, 278, 278, 278, 278);

function GetStringWidth(str: string; size: integer): integer;
var
  i: integer;
  f: double;
begin
  f := 0;
  for i := 1 to Length(str) do
    f := f + size * FontBaseWidths[Ord(str[i]) + 1] / 1000;
  Result := Trunc(f);
end;

function GetNCharWidth(c: double; size: integer): integer;
var
  i, s: integer;
begin
  s := 0;
  for i := 1 to High(FontBaseWidths) do
    s := s + FontBaseWidths[i];
  Result := Trunc(c * size * s / 256{Length(FontBaseWidths)} / 1000);
end;

{ TPDFFont }
constructor TPDFFont.Create;
begin
  inherited;
  FFontName := EmptyStr;
  FBaseFont := poHelvetica;
  FFontSize := 10;
  FFontEncoding := poWinAnsiEncoding;
  FFontColor := clBlack;
end;

procedure TPDFFont.Assign(Source: TPersistent);
begin
  if Source is TPDFFont then
  begin
    FFontName := (Source as TPDFFont).FontName;
    FBaseFont := (Source as TPDFFont).BaseFont;
    FFontSize := (Source as TPDFFont).FontSize;
    FFontEncoding := (Source as TPDFFont).FontEncoding;
    FFontColor := (Source as TPDFFont).FontColor;
    Exit;
  end;
  inherited;
end;

{ TPDFDocument }
constructor TPDFDocument.CreateWithStream(AOwner: TComponent; Stream: TStream);
begin
  inherited Create(AOwner);
  FPDFFile := Stream;
  FPageContents := TStringList.Create;
  FObjOffsets := TStringList.Create;
  FFonts := TStringList.Create;
  FFont := TPDFFont.Create;
  FLineWidth := 1;
  FLineSpacing := 1;
  FLineColor := RGB(0, 0, 0);
  FFillColor := RGB(0, 0, 0);
  DecimalSeparator:='.';
  FMediaBox := TPDFBox.Create;
  FMediaBox.Left := 0;
  FMediaBox.Bottom := 0;
  FMediaBox.Right := 612;
  FMediaBox.Top := 792;
  FTrimBox := TPDFBox.Create;
  FTrimBox.Left := 50;
  FTrimBox.Bottom := 50;
  FTrimBox.Right := 562;
  FTrimBox.Top := 742;
end;

destructor TPDFDocument.Destroy;
begin
  FPageContents.Free;
  FObjOffsets.Free;
  FFonts.Free;
  FFont.Free;
  FMediaBox.Free;
  FTrimBox.Free;
  inherited;
end;

function TPDFDocument.AddObj: integer;
begin
  Inc(FObjNumber);
  FObjOffsets.AddObject('', TObject(FPDFFile.Size));
  Result := FObjNumber;
end;

procedure TPDFDocument.WriteStr2PDF(Source: string);
begin
  FPDFFile.Seek(0, soFromEnd);
  FPDFFile.WriteBuffer(Source[1], Length(Source));
end;

procedure TPDFDocument.WriteBOF;
begin
  WriteStr2PDF(stPDFBof);
end;

function TPDFDocument.WriteCatalog(PagesNum, OutLinesNum: integer): integer;
begin
  Result := AddObj;
  WriteStr2PDF(Format(stPDFCatalog, [Result, PagesNum, OutLinesNum]));
end;

function TPDFDocument.WriteOutLines: integer;
begin
  Result := AddObj;
  WriteStr2PDF(Format(stPDFOutLines, [Result]));
end;

function TPDFDocument.WritePages(FontsObj: integer): integer;
var 
  i, ObjNum: integer;
  Kids: string;
begin
  // calc Kids
  Kids := EmptyStr;
  for i := 0 to  FPageContents.Count - 1 do
    Kids := Kids + Format('%d 0 R ',[FObjNumber + 2 + i]);
  //Pages
  Result := AddObj;
  WriteStr2PDF(Format(stPDFPages, [Result, FPageContents.Count, Kids]));
  //Kids pages
  for i := 0 to FPageContents.Count - 1 do begin
    ObjNum := AddObj;
    WriteStr2PDF(Format(stPDFPage, [ObjNum, Result, FontsObj,
      FMediaBox.Left, FMediaBox.Bottom, FMediaBox.Right, FMediaBox.Top,
      FTrimBox.Left, FTrimBox.Bottom, FTrimBox.Right, FTrimBox.Top,
      FPageContents.Strings[i]]));
  end;
end;

function TPDFDocument.WriteResources: integer;
var 
  i, fn : integer;
  FontsText: string;
  wbuf: string;
begin
  FontsText := '';
  wbuf := '';
  for i := 1 to High(FontBaseWidths) do
    wbuf := wbuf + IntToStr(FontBaseWidths[i]) + ' ';
    for i := 0 to FFonts.Count -1 do begin
      with FFonts.Objects[i] as TPDFFont do begin
        fn := AddObj;
        WriteStr2PDF(Format(stPDFFont, [fn, FontName,
          PDFFontStringName[Ord(BaseFont) + 1],
          PDFEncodingStringName[Ord(FontEncoding) + 1], wbuf]));
        FontsText := FontsText + Format('/%s %d 0 R ', [FontName, fn]);
      end;
    end;
  //write res
  Result := AddObj;
  WriteStr2PDF(Format(stPDFResources, [Result, FontsText]));
end;

function TPDFDocument.WriteXref: integer;
var
  i: integer;
begin
  Result := FPDFFile.Position;
  WriteStr2PDF(Format(stPDFXRefHeader, [ObjNumber + 1]));
  for i := 0 to FObjOffsets.Count - 1 do
    WriteStr2PDF(Format(stPDFXRefBody, [integer(FObjOffsets.Objects[i])]));
end;

procedure TPDFDocument.WriteTrailer(CatalogNum: integer; XrefOffset: integer);
begin
  WriteStr2PDF(Format(stPDFTrailer, [ObjNumber + 1, CatalogNum, XrefOffset]));
end;

procedure TPDFDocument.WriteEof;
begin
  WriteStr2PDF(stPDFEof);
end;

procedure TPDFDocument.BeginDoc;
begin
  FPageContents.Clear;
  FObjOffsets.Clear;
  FObjNumber := 0;
  FFonts.Clear;
  FLineWidth := 1;
  FLineSpacing := 1;
  FLineColor := RGB(0, 0, 0);
  FFillColor := RGB(0, 0, 0);
  WriteBOF;
  //WriteInfo;
end;

procedure TPDFDocument.EndPage;
var
  Size: integer;
begin
  if FPageContents.Count > 0 then
  begin
    //calc stream length
    Size := FPDFFile.Position - FStreamBegin;
    //write stream end
    WriteStr2PDF(stPDFStreamFooter);
    //write stream length
    WriteStr2PDF(Format(stPDFStreamLength, [AddObj, Size]));
  end;
end;

procedure TPDFDocument.NewPage;
var
  ObjNum: integer;
begin
  EndPage;
  ObjNum := AddObj;
  FPageContents.Add(Format('%d 0 R', [ObjNum]));
  //write stream header
  WriteStr2PDF(Format(stPDFStreamHeader, [ObjNum, ObjNum + 1]));
  FStreamBegin := FPDFFile.Position;
end;

procedure TPDFDocument.AddFont(NewFont: TPDFFont);
begin
  if FFonts.IndexOf(NewFont.FontName) = -1
    then FFonts.AddObject(NewFont.FontName, NewFont)
    else raise Exception.CreateFmt(QER_FontAlreadyExist, [NewFont.FontName]);
end;

procedure TPDFDocument.SetFont(Value: TPDFFont);
begin
  FFont.Assign(Value);
end;

procedure TPDFDocument.StringOut(x, y: integer; const Str: string;
  Color: TColor);
var
  OldColor: TColor;
begin
  OldColor := clBlack;
  if Color <> FFillColor then OldColor := ChangeFillColor(Color);
  WriteStr2PDF(Format(stPDFText, [FFont.FontName, FFont.FontSize, x, y, Str]));
  if Color <> FFillColor then ChangeFillColor(OldColor);
end;

procedure TPDFDocument.SetTextFont(Value: TPDFFont);
begin
  SetFont(Value);
end;

procedure TPDFDocument.TextOut(x, y: integer; const Text: TStrings);
var
  i: integer;
begin
  for i := 0 to Text.Count - 1 do
    StringOut(x, y - Trunc(i * FLineSpacing * FFont.FontSize), Text.Strings[i],
      FFillColor);
end;

procedure TPDFDocument.Line(x1, y1, x2, y2: double; Color: TColor);
var
  OldColor: TColor;
begin
  OldColor := clBlack;
  if Color <> FLineColor then OldColor := ChangeLineColor(Color);
  WriteStr2PDF(Format(stPDFLine, [x1, y1, x2, y2, FLineWidth]));
  if Color <> FLineColor then ChangeLineColor(OldColor);
end;

function TPDFDocument.ChangeLineColor(Color: TColor): TColor;
var
  Red, Green, Blue: byte;
begin
  Result := FLineColor;
  Red := Byte(Color);
  Green := Byte(Color shr 8);
  Blue := Byte(Color shr 16);
  WriteStr2PDF(Format(stPDFSetLineColor, [Red / $FF, Green / $FF, Blue / $FF]));
  FLineColor := Color;
end;

procedure TPDFDocument.FillRect(x1, y1, x2, y2: double; Color: TColor);
var
  OldFillColor: TColor;
begin
  OldFillColor := clBlack;
  if Color <> FFillColor then OldFillColor := ChangeFillColor(Color);
  WriteStr2PDF(Format(stPDFRect,[x1, y1, x2, y2, 'f']));
  if Color <> FFillColor then ChangeFillColor(OldFillColor);
end;

function TPDFDocument.ChangeFillColor(Color: TColor): TColor;
var
  Red, Green, Blue: byte;
begin
  Result := FFillColor;
  Red := Byte(Color);
  Green := Byte(Color shr 8);
  Blue := Byte(Color shr 16);
  WriteStr2PDF(Format(stPDFSetFillColor, [Red / $FF, Green / $FF, Blue / $FF]));
  FFillColor := Color;
end;

procedure TPDFDocument.EndDoc;
var
  OutLinesNum, ResourcesNum, PagesNum, CatalogNum: integer;
  XrefOffest: integer;
begin
  EndPage;
  OutLinesNum := WriteOutLines;
  ResourcesNum := WriteResources;
  PagesNum := WritePages(ResourcesNum);
  CatalogNum := WriteCatalog(PagesNum, OutLinesNum);
  XrefOffest := WriteXref;
  WriteTrailer(CatalogNum, XrefOffest);
  WriteEof;
end;

function TPDFDocument.GetMediaBox: TPDFBox;
begin
  Result := FMediaBox;
end;

function TPDFDocument.GetTrimBox: TPDFBox;
begin
  Result := FTrimBox;
end;

procedure TPDFDocument.SetMediaBox(const Value: TPDFBox);
begin
  FMediaBox.Assign(Value);
end;

procedure TPDFDocument.SetTrimBox(const Value: TPDFBox);
begin
  FTrimBox.Assign(Value);
end;

{ TQPDFWriter }
constructor TQPDFWriter.Create(AOwner: TQExport3; AStream: TStream);
begin
  inherited;
  FPDFDocument := TPDFDocument.CreateWithStream(nil, AStream);
end;

destructor TQPDFWriter.Destroy;
begin
  PDFDocument.Free;
  inherited;
end;

{ TPDFBox }
procedure TPDFBox.Assign(Source: TPersistent);
begin
  if Source is TPDFBox then begin
    FLeft := (Source as TPDFBox).Left;
    FBottom := (Source as TPDFBox).Bottom;
    FRight := (Source as TPDFBox).Right;
    FTop := (Source as TPDFBox).Top;
    Exit;
  end;
  inherited;
end;

{ TPDFOptions }
constructor TPDFOptions.Create;
begin
  inherited;
  FHeaderFont := TPDFFont.Create;
  FHeaderFont.FontName := 'HeaderFont';
  FCaptionFont := TPDFFont.Create;
  FCaptionFont.FontName := 'CaptionFont';
  FDataFont := TPDFFont.Create;
  FDataFont.FontName := 'DataFont';
  FFooterFont := TPDFFont.Create;
  FFooterFont.FontName := 'FooterFont';

  FPageOptions := TQExportPDFPageOptions.Create;

  FRowSpacing := 1;
  FColSpacing := 3;
  FGridLineWidth := 1;
  FGridLineColor := clBlack;
end;

destructor TPDFOptions.Destroy;
begin
  FHeaderFont.Free;
  FCaptionFont.Free;
  FDataFont.Free;
  FFooterFont.Free;
  FPageOptions.Free;
  inherited;
end;

procedure TPDFOptions.Assign(Source: TPersistent);
begin
 if Source is TPDFOptions then begin
   SetHeaderFont((Source as TPDFOptions).HeaderFont);
   SetCaptionFont((Source as TPDFOptions).CaptionFont);
   SetDataFont((Source as TPDFOptions).DataFont);
   SetFooterFont((Source as TPDFOptions).FooterFont);

   FPageOptions.Assign(TPDFOptions(Source).PageOptions); 

   FRowSpacing := (Source as TPDFOptions).RowSpacing;
   FColSpacing := (Source as TPDFOptions).ColSpacing;
   FGridLineWidth := (Source as TPDFOptions).GridLineWidth;
   FGridLineColor := (Source as TPDFOptions).GridLineColor;
 end else
   inherited;
end;

procedure TPDFOptions.SetDataFont(const Value: TPDFFont);
begin
  FDataFont.Assign(Value);
end;

procedure TPDFOptions.SetHeaderFont(const Value: TPDFFont);
begin
  FHeaderFont.Assign(Value);
end;

procedure TPDFOptions.SetFooterFont(const Value: TPDFFont);
begin
  FFooterFont.Assign(Value);
end;

procedure TPDFOptions.SetCaptionFont(const Value: TPDFFont);
begin
  FCaptionFont.Assign(Value);
end;

function TPDFOptions.IsColSpacing: boolean;
begin
  Result := FColSpacing <> 3;
end;

function TPDFOptions.IsRowSpacing: boolean;
begin
  Result := FRowSpacing <> 1;
end;

procedure TPDFOptions.SetPageOptions(const Value: TQExportPDFPageOptions);
begin
  FPageOptions.Assign(Value); 
end;

{ TQExport3PDF }

constructor TQExport3PDF.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOptions := TPdfOptions.Create;
  ColXs := TList.Create;
  //SetLength(ColXs, 0);
end;

destructor TQExport3PDF.Destroy;
begin
  FOptions.Free;
  ColXs.Free;
  //SetLength(ColXs, 0);
  inherited;
end;

procedure TQExport3PDF.SetOptions(const Value: TPDFOptions);
begin
  FOptions.Assign(Value);
end;

function TQExport3PDF.GetWriter: TQPDFWriter;
begin
  Result := TQPDFWriter(inherited GetWriter);
end;

function TQExport3PDF.GetWriterClass: TQExportWriterClass;
begin
  Result := TQPDFWriter;
end;

procedure TQExport3PDF.BeginExport;
var
  i: integer;
begin
  inherited;
  CurY := Options.PageOptions.TrimBox.Top;
  TableBeginY := CurY;
  ColXs.Clear;
  ColXs.Add(Pointer(Options.PageOptions.TrimBox.Left));
  for i := 0 to Columns.Count - 1 do
    ColXs.Add(Pointer(Integer(ColXs[ColXs.Count - 1]) + GetNCharWidth(Columns[i].Width + Options.ColSpacing,
      Options.DataFont.FontSize)));
//  SetLength(ColXs, Columns.Count + 1);
//  ColXs[0] := Options.TrimBox.Left;
//  for i := 0 to Columns.Count -1 do
//    ColXs[i+1] := ColXs[i] + GetNCharWidth(Columns[i].Width +
//      Options.ColumnSpacing, Options.DefaultFont.FontSize);
  GetWriter.PDFDocument.MediaBox.Assign(FOptions.PageOptions.MediaBox);
  GetWriter.PDFDocument.TrimBox.Assign(FOptions.PageOptions.TrimBox);
  GetWriter.PDFDocument.BeginDoc;
  GetWriter.PDFDocument.NewPage;
  GetWriter.PDFDocument.LineWidth := Options.GridLineWidth;
  GetWriter.PDFDocument.LineSpacing := Options.RowSpacing;
  GetWriter.PDFDocument.ChangeLineColor(Options.GridLineColor);
  WriteHeader;
  GetWriter.PDFDocument.AddFont(Options.DataFont);
  GetWriter.PDFDocument.AddFont(Options.CaptionFont);
  GetWriter.PDFDocument.AddFont(Options.HeaderFont);
  GetWriter.PDFDocument.AddFont(Options.FooterFont);
end;

procedure TQExport3PDF.WriteDataRow;
var
  i, TextLeft: integer;
  CurrAlign: TQExportColAlign;
  CurrBackground: TColor;
  CurrFont: TFont;
  FieldValue: string;
begin
  GetWriter.PDFDocument.SetTextFont(Options.FDataFont);
  if CurY - Trunc(Options.DataFont.FontSize * (1 +
    Options.RowSpacing))  < Options.PageOptions.TrimBox.Bottom then begin
    //add vert lines
    PlotVertGridLines(TableBeginY, CurY);
    CurY := Options.PageOptions.TrimBox.Top;
    TableBeginY := CurY;
    GetWriter.PDFDocument.NewPage;
    GetWriter.PDFDocument.ChangeFillColor(Options.DataFont.FontColor);
    GetWriter.PDFDocument.ChangeLineColor(Options.GridLineColor);
    GetWriter.PDFDocument.Line(Integer(ColXs[0]), CurY,
      Integer(ColXs[ColXs.Count - 1]), CurY, Options.GridLineColor);
  end;
  CurY := CurY - Trunc(Options.DataFont.FontSize * (1 +
    Options.RowSpacing / 2));
  for i := 0 to ExportRow.Count - 1 do begin
//    FieldValue := inherited GetColData(ExportRow[i]);
    FieldValue := ExportRow[i].GetExportedValue(true);
    // default cell params
    CurrFont := nil;
    try
      CurrFont := TFont.Create;
      CurrFont.Color := Options.DataFont.FontColor;
      CurrAlign := Columns[i].ColAlign;
      CurrBackground := clWhite;
      GetCellParams(RecordCounter, i, FieldValue, CurrAlign, CurrFont,
        CurrBackground);
      if CurrBackground <> clWhite then
      begin
        GetWriter.PDFDocument.FillRect(Integer(ColXs[i]), CurY -
          Options.DataFont.FontSize * Options.RowSpacing / 2,
          Integer(ColXs[i + 1]) - Integer(ColXs[i]),
          Options.DataFont.FontSize * (1 + Options.RowSpacing) -
          Options.GridLineWidth / 2, CurrBackground);
      end;
      TextLeft := Integer(ColXs[i]) + GetNCharWidth(
        Options.ColSpacing / 2, Options.DataFont.FontSize);
      case CurrAlign of
      ecaCenter: TextLeft := TextLeft + (GetNCharWidth(
        Columns[i].Width, Options.DataFont.FontSize) -
        GetStringWidth(FieldValue , Options.DataFont.FontSize)) div 2;
      ecaRight: TextLeft := Integer(ColXs[i + 1]) - GetNCharWidth(
      Options.ColSpacing / 2, Options.DataFont.FontSize) -
       GetStringWidth(FieldValue, Options.DataFont.FontSize);
      end;
      GetWriter.PDFDocument.StringOut(TextLeft, CurY, FieldValue,
        CurrFont.Color);
    finally
      CurrFont.Free;
    end;
  end;
  CurY := CurY - Trunc(Options.DataFont.FontSize * Options.RowSpacing /2);
  GetWriter.PDFDocument.Line(Integer(ColXs[0]), CurY,
    Integer(ColXs[ColXs.Count - 1]), CurY, Options.GridLineColor);
end;

procedure TQExport3PDF.EndExport;
begin
  if CurY <> Options.PageOptions.TrimBox.Top then
    PlotVertGridLines(TableBeginY, CurY);
  WriteFooter;
  GetWriter.PDFDocument.EndPage;
  GetWriter.PDFDocument.EndDoc;
  inherited;
end;

procedure TQExport3PDF.WriteCaptionRow;
var
  i: integer;
begin
  GetWriter.PDFDocument.SetTextFont(Options.CaptionFont);
  GetWriter.PDFDocument.Line(Integer(ColXs[0]), CurY,
    Integer(ColXs[ColXs.Count - 1]), CurY, Options.GridLineColor);
  CurY := CurY - Trunc(Options.CaptionFont.FontSize *
    (1 + Options.RowSpacing / 2));
  for i := 0 to Columns.Count - 1 do begin
    GetWriter.PDFDocument.StringOut(Integer(ColXs[i]) + GetNCharWidth(
      Options.ColSpacing / 2, Options.CaptionFont.FontSize), CurY,
      inherited GetColCaption(i), Options.CaptionFont.FontColor);
  end;
  CurY := CurY - Trunc(Options.CaptionFont.FontSize * Options.RowSpacing / 2);
  GetWriter.PDFDocument.Line(Integer(ColXs[0]), CurY,
    Integer(ColXs[ColXs.Count - 1]), CurY, Options.GridLineColor);
end;

procedure TQExport3PDF.WriteHeader;
var i: integer;
begin
   if Header.Count > 0 then begin
     GetWriter.PDFDocument.SetTextFont(Options.HeaderFont);
     for i := 0 to Header.Count - 1 do begin
       CurY := CurY - Trunc(Options.HeaderFont.FontSize *
         (1 + Options.RowSpacing / 2));
       if CurY < Options.PageOptions.TrimBox.Bottom then begin
         GetWriter.PDFDocument.NewPage;
         GetWriter.PDFDocument.ChangeFillColor(Options.HeaderFont.FontColor);
         GetWriter.PDFDocument.ChangeLineColor(Options.GridLineColor);
         CurY := Options.PageOptions.TrimBox.Top - Trunc(Options.HeaderFont.FontSize *
           (1 + Options.RowSpacing / 2));
       end;
       GetWriter.PDFDocument.StringOut(Options.PageOptions.TrimBox.Left, CurY, Header[i],
         Options.HeaderFont.FontColor);
     end;
     CurY := CurY - Trunc(Options.HeaderFont.FontSize *
       Options.RowSpacing / 2);
   end;
   TableBeginY := CurY;
end;

procedure TQExport3PDF.WriteFooter;
var
  i: integer;
begin
   if Footer.Count > 0 then begin
     GetWriter.PDFDocument.SetTextFont(Options.FooterFont);
     for i := 0 to Footer.Count - 1 do begin
       CurY := CurY - Trunc(Options.FooterFont.FontSize *
         (1 + Options.RowSpacing / 2));
       if CurY < Options.PageOptions.TrimBox.Bottom then begin
         GetWriter.PDFDocument.NewPage;
         CurY := Options.PageOptions.TrimBox.Top - Trunc(Options.FooterFont.FontSize *
           (1 + Options.RowSpacing / 2));
       end;
       GetWriter.PDFDocument.StringOut(Options.PageOptions.TrimBox.Left, CurY, Footer[i],
         Options.FooterFont.FontColor);
     end;
   end;
end;

procedure TQExport3PDF.PlotVertGridLines(Top: integer; Bottom: integer);
var
  i: integer;
begin
  for i := 0 to Columns.Count do
    GetWriter.PDFDocument.Line(Integer(ColXs[i]), Top +
      Options.GridLineWidth / 2, Integer(ColXs[i]), Bottom -
      Options.GridLineWidth / 2, Options.GridLineColor);
end;

function TQExport3PDF.NormalString(const S: string): string;
var
  i: integer;
begin
  Result := EmptyStr;
  for i := 1 to Length(S) do begin
    if S[i] in GetSpecialCharacters then begin
      case S[i] of
       '\': Result := Result + '\\';
      end;
    end
    else Result := Result + S[i];
  end;
end;

function TQExport3PDF.GetSpecialCharacters: TSpecialCharacters;
begin
  Result := ['\'];
end;

{ TQExportPDFPageOptions }

constructor TQExportPDFPageOptions.Create;
begin
  inherited;
  FMediaBox := TPDFBox.Create;
  FTrimBox := TPDFBox.Create;
  FUnits := unInch;
  FOrientation := poPortrait;
  MarginLeft := 1.18;
  MarginBottom := 0.79;
  MarginRight := 0.59;
  MarginTop := 0.79;
  Format := pfA4;
end;

destructor TQExportPDFPageOptions.Destroy;
begin
  FMediaBox.Free;
  FTrimBox.Free;
  inherited;
end;

procedure TQExportPDFPageOptions.Assign(Source: TPersistent);
begin
  if Source is TQExportPDFPageOptions then begin
    FUnits := TQExportPDFPageOptions(Source).FUnits;
    FFormat := TQExportPDFPageOptions(Source).FFormat;
    FWidth := TQExportPDFPageOptions(Source).FWidth;
    FHeight := TQExportPDFPageOptions(Source).FHeight;
    FOrientation := TQExportPDFPageOptions(Source).FOrientation;
    FMarginLeft := TQExportPDFPageOptions(Source).FMarginLeft;
    FMarginRight := TQExportPDFPageOptions(Source).FMarginRight;
    FMarginTop := TQExportPDFPageOptions(Source).FMarginTop;
    FMarginBottom := TQExportPDFPageOptions(Source).FMarginBottom;
    Exit;
  end;
  inherited;
end;

procedure TQExportPDFPageOptions.SetFormat(const Value: TQExportPageFormat);
begin
  if FFormat <> Value then begin
    FFormat := Value;
    if FFormat <> pfUser then begin
      FWidth := InchToDot(GetPageFormatInchWidth(FFormat));
      FHeight := InchToDot(GetPageFormatInchHeight(FFormat));
    end;
  end;
end;

function TQExportPDFPageOptions.IsWidth: boolean;
begin
  Result := FFormat = pfUser;
end;

function TQExportPDFPageOptions.GetWidth: double;
begin
  Result := Dot2Units(FUnits, FWidth);
end;

procedure TQExportPDFPageOptions.SetWidth(const Value: double);
begin
  FWidth := Units2Dot(FUnits, Value);
  FFormat := pfUser;
end;

function TQExportPDFPageOptions.IsHeight: boolean;
begin
  Result := FFormat = pfUser;
end;

function TQExportPDFPageOptions.GetHeight: double;
begin
  Result := Dot2Units(FUnits, FHeight);
end;

procedure TQExportPDFPageOptions.SetHeight(const Value: double);
begin
  FHeight := Units2Dot(FUnits, Value);
  FFormat := pfUser;
end;

procedure TQExportPDFPageOptions.SetOrientation(const Value: TQExportPageOrientation);
var
  Sz: TSize;
  Rect: TRect;
begin
  if FOrientation <> Value then begin
    FOrientation := Value;

    Sz.cx := FWidth;
    Sz.cy := FHeight;
    FWidth := Sz.cy;
    FHeight := Sz.cx;

    Rect.Left := FMarginLeft;
    Rect.Right := FMarginRight;
    Rect.Top := FMarginTop;
    Rect.Bottom := FMarginBottom;

    if FOrientation = poLandscape then begin
      FMarginLeft := Rect.Bottom;
      FMarginRight := Rect.Top;
      FMarginTop := Rect.Left;
      FMarginBottom := Rect.Right;
    end
    else begin
      FMarginLeft := Rect.Top;
      FMarginRight := Rect.Bottom;
      FMarginTop := Rect.Right;
      FMarginBottom := Rect.Left;
    end;
  end;
end;

function TQExportPDFPageOptions.GetMarginLeft: double;
begin
  Result := Dot2Units(FUnits, FMarginLeft);
end;

procedure TQExportPDFPageOptions.SetMarginLeft(const Value: double);
begin
  FMarginLeft := Units2Dot(FUnits, Value);
end;

function TQExportPDFPageOptions.GetMarginRight: double;
begin
  Result := Dot2Units(FUnits, FMarginRight);
end;

procedure TQExportPDFPageOptions.SetMarginRight(const Value: double);
begin
  FMarginRight := Units2Dot(FUnits, Value);
end;

function TQExportPDFPageOptions.GetMarginTop: double;
begin
  Result := Dot2Units(FUnits, FMarginTop);
end;

procedure TQExportPDFPageOptions.SetMarginTop(const Value: double);
begin
  FMarginTop := Units2Dot(FUnits, Value);
end;

function TQExportPDFPageOptions.GetMarginBottom: double;
begin
  Result := Dot2Units(FUnits, FMarginBottom);
end;

procedure TQExportPDFPageOptions.SetMarginBottom(const Value: double);
begin
  FMarginBottom := Units2Dot(FUnits, Value);
end;

function TQExportPDFPageOptions.GetMediaBox: TPDFBox;
begin
  Result := FMediaBox;
  FMediaBox.Left := 0;
  FMediaBox.Bottom := 0;
  FMediaBox.Right := FWidth - 1;
  FMediaBox.Top := FHeight - 1;
end;

function TQExportPDFPageOptions.GetTrimBox: TPDFBox;
begin
  Result := FTrimBox;
  FTrimBox.Left := FMarginLeft;
  FTrimBox.Bottom := FMarginBottom;
  FTrimBox.Right := FWidth - FMarginRight - 1;
  FTrimBox.Top := FHeight - FMarginTop - 1;
end;

end.
