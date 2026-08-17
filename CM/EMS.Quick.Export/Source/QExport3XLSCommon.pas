unit QExport3XLSCommon;

interface

uses SysUtils;

type
  ExlsFileError = class(Exception);

const
  MAX_COL_COUNT          = 255;
  MAX_ROW_COUNT          = 65535; {zero based}
  MAX_SHEET_COUNT        = 250;
  //------

  MAX_RECORD_DATA_SIZE   = 8224;
  DEF_COL_WIDTH          = 8;
  DEF_ROW_HEIGHT         = 12.75;
  DEFAULT_FORMAT         = 15;
  DEFAULT_TEXT_FORMAT    = 'General';

  //------

  BIFF_BOF_VER           = $0600;

  //------

  BIFF_BOF_GLOBALS       = $0005;
  BIFF_BOF_WORKSHEET     = $0010;
  BIFF_BOF_CHART         = $0020;

  //------

  BIFF_FORMULA           = $0006;
  BIFF_EOF               = $000A;
  BIFF_CALCCOUNT         = $000C;
  BIFF_CALCMODE          = $000D;
  BIFF_PRECISION         = $000E;
  BIFF_REFMODE           = $000F;
  BIFF_DELTA             = $0010;
  BIFF_ITERATION         = $0011;
  BIFF_PROTECT           = $0012;
  BIFF_PASSWORD          = $0013;
  BIFF_HEADER            = $0014;
  BIFF_FOOTER            = $0015;
  BIFF_EXTERNSHEET       = $0017;
  BIFF_NAME              = $0018;
  BIFF_WINDOWPROTECT     = $0019;
  BIFF_NOTE              = $001C;
  BIFF_SELECTION         = $001D;
  BIFF_1904              = $0022;
  BIFF_PRINTHEADERS      = $002A;
  BIFF_PRINTGRIDLINES    = $002B;
  BIFF_FONT              = $0031;
  BIFF_CONTINUE          = $003C;
  BIFF_WINDOW1           = $003D;
  BIFF_BACKUP            = $0040;
  BIFF_CODEPAGE          = $0042;
  BIFF_DEFCOLWIDTH       = $0055;
  BIFF_WRITEACCESS       = $005C;
  BIFF_OBJ               = $005D;
  BIFF_SAVERECALC        = $005F;
  BIFF_COLINFO           = $007D;
  BIFF_GUTS              = $0080;
  BIFF_WSBOOL            = $0081;
  BIFF_GRIDSET           = $0082;
  BIFF_HCENTER           = $0083;
  BIFF_VCENTER           = $0084;
  BIFF_BOUNDSHEET        = $0085;
  BIFF_COUNTRY           = $008C;
  BIFF_HIDEOBJ           = $008D;
  BIFF_PALETTE           = $0092;
  BIFF_FNGROUPCOUNT      = $009C;
  BIFF_SCL               = $00A0;
  BIFF_SETUP             = $00A1;
  BIFF_MULRK             = $00BD;
  BIFF_MULBLANK          = $00BE;
  BIFF_BOOKBOOL          = $00DA;
  BIFF_XF                = $00E0;
  BIFF_MERGEDCELLS       = $00E5;
  BIFF_BITMAP            = $00E9;
  BIFF_MSODRAWINGGROUP   = $00EB;
  BIFF_MSODRAWING        = $00EC;
  BIFF_SST               = $00FC;
  BIFF_LABELSST          = $00FD;
  BIFF_DSF               = $0161;
  BIFF_SUPBOOK           = $01AE;
  BIFF_PROT4REV          = $01AF;
  BIFF_TXO               = $01B6;
  BIFF_REFRESHALL        = $01B7;
  BIFF_HLINK             = $01B8;
  BIFF_PROT4REVPASS      = $01BC;

  BIFF_DIMENSIONS        = $0200;
  BIFF_BLANK             = $0201;
  BIFF_NUMBER            = $0203;
  BIFF_BOOLERR           = $0205;
  BIFF_STRING            = $0207;
  BIFF_DEFAULTROWHEIGHT  = $0225;
  BIFF_WINDOW2           = $023E;
  BIFF_RK                = $027E;
  BIFF_STYLE             = $0293;
  
  BIFF_FORMAT            = $041E;
  BIFF_SHRFMLA           = $04BC;

  BIFF_QUICKTIP          = $0800;
  BIFF_BOF               = $0809;

  CHART_UNITS            = $1001;
  CHART_CHART            = $1002;
  CHART_SERIES           = $1003;
  CHART_DATAFORMAT       = $1006;
  CHART_LINEFORMAT       = $1007;
  CHART_AREAFORMAT       = $100A;
  CHART_SERIESTEXT       = $100D;
  CHART_CHARTFORMAT      = $1014;
  CHART_LEGEND           = $1015;
  CHART_BAR              = $1017;
  CHART_LINE             = $1018;
  CHART_PIE              = $1019;
  CHART_AREA             = $101A;
  CHART_AXIS             = $101D;
  CHART_TICK             = $101E;
  CHART_VALUERANGE       = $101F;
  CHART_CATSERRANGE      = $1020;
  CHART_AXISLINEFORMAT   = $1021;
  CHART_DEFAULTTEXT      = $1024;
  CHART_TEXT             = $1025;
  CHART_FONTX            = $1026;
  CHART_OBJECTLINK       = $1027;
  CHART_FRAME            = $1032;
  CHART_BEGIN            = $1033;
  CHART_END              = $1034;
  CHART_PLOTAREA         = $1035;
  CHART_3D               = $103A;
  CHART_RADAR            = $103E; 
  CHART_SURFACE          = $103F;
  CHART_RADARAREA        = $1040;
  CHART_AXISPARENT       = $1041;
  CHART_SHTPROPS         = $1044;
  CHART_SERTOCRT         = $1045;
  CHART_AXESUSED         = $1046;
  CHART_POS              = $104F;
  CHART_AI               = $1051;
  CHART_FBI              = $1060;
  CHART_AXCEXT           = $1062;
  CHART_PLOTGROWTH       = $1064;
  CHART_SIINDEX          = $1065; 

  //------

  BOOL_ERR_ID_NULL       = $00;
  BOOL_ERR_ID_DIV_ZERO   = $07;
  BOOL_ERR_ID_VALUE      = $0F;
  BOOL_ERR_ID_REF        = $17;
  BOOL_ERR_ID_NAME       = $1D;
  BOOL_ERR_ID_NUM        = $24;
  BOOL_ERR_ID_NA         = $2A;

  BOOL_ERR_STR_NULL      = '#NULL!';
  BOOL_ERR_STR_DIV_ZERO  = '#DIV/0!';
  BOOL_ERR_STR_VALUE     = '#VALUE!';
  BOOL_ERR_STR_REF       = '#REF!';
  BOOL_ERR_STR_NAME      = '#NAME?';
  BOOL_ERR_STR_NUM       = '#NUM!';
  BOOL_ERR_STR_NA        = '#N/A';

  GUID_OF_STD_LINK: array[1..16] of byte =
    ($D0, $C9, $EA, $79, $F9, $BA, $CE, $11,
     $8C, $82, $00, $AA, $00, $4B, $A9, $0B);

  HLINK_UNKNOWN_VALUE = $00000002;

  GUID_OF_URL_MONIKER: array[1..16] of byte =
    ($E0, $C9, $EA, $79, $F9, $BA, $CE, $11,
     $8C, $82, $00, $AA, $00, $4B, $A9, $0B);

  GUID_OF_FILE_MONIKER: array[1..16] of byte =
    ($03, $03, $00, $00, $00, $00, $00, $00,
     $C0, $00, $00, $00, $00, $00, $00, $46);

  UNKNOWN_SEQUENCE1: array[1..24] of byte =
    ($FF, $FF, $AD, $DE, $00, $00, $00, $00,
     $00, $00, $00, $00, $00, $00, $00, $00,
     $00, $00, $00, $00, $00, $00, $00, $00);

  UNKNOWN_SEQUENCE2: array[1..2] of byte =
    ($03, $00);

  MSO_DGGCONTAINER    = $F000;
  MSO_BSTORECONTAINER = $F001;
  MSO_DGCONTAINER     = $F002;
  MSO_SPGRCONTAINER   = $F003;
  MSO_SPCONTAINER     = $F004;
  MSO_DGG             = $F006;
  MSO_BSE             = $F007;
  MSO_DG              = $F008;
  MSO_SPGR            = $F009;
  MSO_SP              = $F00A;
  MSO_OPT             = $F00B;
  MSO_CLIENTTEXTBOX   = $F00D;
  MSO_CLIENTANCHOR    = $F010;
  MSO_CLIENTDATA      = $F011;
  MSO_BLIPSTART       = $F018;
  MSO_SPLITMENUCOLORS = $F11E;

  MSO_SPID     = $0401;

  msosptHostControl  = $C9;
  msosptTextBox      = $CA;
  msosptPictureFrame = $4B;

  OBJ_END      = $00;
  OBJ_CF       = $07;
  OBJ_PIOGRBIT = $08;
  OBJ_NTS      = $0D;
  OBJ_CMO      = $15;

  BLIP_DIB     = $07A8;
  BLIP_JPEG    = $046A;
  BLIP_PNG     = $06E0;
  BLIP_WMF     = $0216;
  BLIP_EMF     = $03D4;

type
  TBOOL_ERR_STRINGS = array[0..6] of WideString;

const
  BOOL_ERR_STRINGS: TBOOL_ERR_STRINGS =
    (BOOL_ERR_STR_NULL, BOOL_ERR_STR_DIV_ZERO, BOOL_ERR_STR_VALUE,
     BOOL_ERR_STR_REF, BOOL_ERR_STR_NAME, BOOL_ERR_STR_NUM, BOOL_ERR_STR_NA);

const
  ptgExp         = $01;
  ptgTbl         = $02;
  ptgAdd         = $03;
  ptgSub         = $04;
  ptgMul         = $05;
  ptgDiv         = $06;
  ptgPower       = $07;
  ptgConcat      = $08;
  ptgLT	         = $09;
  ptgLE	         = $0A;
  ptgEQ	         = $0B;
  ptgGE	         = $0C;
  ptgGT	         = $0D;
  ptgNE	         = $0E;
  ptgIsect       = $0F;
  ptgUnion       = $10;
  ptgRange       = $11;
  ptgUplus       = $12;
  ptgUminus      = $13;
  ptgPercent     = $14;
  ptgParen       = $15;
  ptgMissArg     = $16;
  ptgStr         = $17;
  ptgAttr        = $19;
  ptgSheet       = $1A;
  ptgEndSheet    = $1B;
  ptgErr         = $1C;
  ptgBool        = $1D;
  ptgInt         = $1E;
  ptgNum         = $1F;
  ptgArray       = $20;
  ptgFunc        = $21;
  ptgFuncVar     = $22;
  ptgName        = $23;
  ptgRef         = $24;
  ptgArea        = $25;
  ptgMemArea     = $26;
  ptgMemErr      = $27;
  ptgMemNoMem    = $28;
  ptgMemFunc     = $29;
  ptgRefErr      = $2A;
  ptgAreaErr     = $2B;
  ptgRefN        = $2C;
  ptgAreaN       = $2D;
  ptgMemAreaN    = $2E;
  ptgMemNoMemN   = $2F;
  ptgNameX       = $39;
  ptgRef3d       = $3A;
  ptgArea3d      = $3B;
  ptgRefErr3d    = $3C;
  ptgAreaErr3d   = $3D;
  ptgArrayV      = $40;
  ptgFuncV       = $41;
  ptgFuncVarV    = $42;
  ptgNameV       = $43;
  ptgRefV        = $44;
  ptgAreaV       = $45;
  ptgMemAreaV    = $46;
  ptgMemErrV     = $47;
  ptgMemNoMemV   = $48;
  ptgMemFuncV    = $49;
  ptgRefErrV     = $4A;
  ptgAreaErrV    = $4B;
  ptgRefNV       = $4C;
  ptgAreaNV      = $4D;
  ptgMemAreaNV   = $4E;
  ptgMemNoMemNV  = $4F;
  ptgFuncCEV     = $58;
  ptgNameXV      = $59;
  ptgRef3dV      = $5A;
  ptgArea3dV     = $5B;
  ptgRefErr3dV   = $5C;
  ptgAreaErr3dV  = $5D;
  ptgArrayA      = $60;
  ptgFuncA       = $61;
  ptgFuncVarA    = $62;
  ptgNameA       = $63;
  ptgRefA        = $64;
  ptgAreaA       = $65;
  ptgMemAreaA    = $66;
  ptgMemErrA     = $67;
  ptgMemNoMemA   = $68;
  ptgMemFuncA    = $69;
  ptgRefErrA     = $6A;
  ptgAreaErrA    = $6B;
  ptgRefNA       = $6C;
  ptgAreaNA      = $6D;
  ptgMemAreaNA   = $6E;
  ptgMemNoMemNA  = $6F;
  ptgFuncCEA     = $78;
  ptgNameXA      = $79;
  ptgRef3dA      = $7A;
  ptgArea3dA     = $7B;
  ptgRefErr3dA   = $7C;
  ptgAreaErr3dA  = $7D;

  tkArea3D       = [$3B, $5B, $7B];

  XLS_STANDARD_PALETTE: array[0..55] of integer =
    ($000000, $003399, $003333, $003300, $663300, $800000, $993333, $333333,
     $000080, $0066FF, $008080, $008000, $808000, $FF0000, $996666, $808080,
     $0000FF, $0099FF, $00CC99, $669933, $CCCC33, $FF6633, $800080, $969696,
     $FF00FF, $00CCFF, $00FFFF, $00FF00, $FFFF00, $FFCC00, $663399, $C0C0C0,
     $CC99FF, $99CCFF, $99FFFF, $CCFFCC, $FFFFCC, $FFCC99, $FF99CC, $FFFFFF,
     $FF9999, $663399, $CCFFFF, $FFFFCC, $660066, $8080FF, $CC6600, $FFCCCC,
     $800000, $FF00FF, $00FFFF, $FFFF00, $800080, $000080, $808000, $FF0000);

  XLS_COLOR_NAMES: array[0..55] of string =
    ('Black', 'Brown', 'Olive Green', 'Dark Green', 'Dark Teal', 'Dark Blue', 'Indigo', 'Gray-80%',
     'Dark Red', 'Orange', 'Dark Yellow', 'Green', 'Teal', 'Blue', 'Blue-Gray', 'Gray-50%',
     'Red', 'Light Orange', 'Lime', 'Sea Green', 'Aqua', 'Light Blue', 'Violet', 'Gray-40%',
     'Pink', 'Gold', 'Yellow', 'Bright Green', 'Turquoise', 'Sky Blue', 'Plum', 'Gray-25%',
     'Rose', 'Tan', 'Light Yellow', 'Liht Green', 'Light Turquoise', 'Pale Blue', 'Lavender', 'White',
     'Color1', 'Color2', 'Color3', 'Color4', 'Color5', 'Color6', 'Color7', 'Color8',
     'Color9', 'Color10', 'Color11', 'Color12', 'Color13', 'Color14', 'Color15', 'Color16');

  COLOR_INDEX:  array[0..55] of byte =
    ($08, $3C, $3B, $3A, $38, $12, $3E, $3F,
     $10, $35, $13, $11, $15, $0C, $36, $17,
     $0A, $34, $32, $39, $31, $30, $14, $37,
     $0E, $33, $0D, $0B, $0F, $28, $3D, $16,
     $2D, $2F, $2B, $2A, $29, $2C, $2E, $09,
     $18, $19, $1A, $1B, $1C, $1D, $1E, $1F,
     $20, $21, $22, $23, $24, $25, $26, $27);

  {PATTERN_NAMES: array[0..47] of WideString =
    ('5%', '10%', '20%', '25%', '30%', '40%',
     '50%', '60%', '70%', '75%', '80%', '90%',
     'Light downward diagonal', 'Light upward diagonal',
     'Dark downward diagonal', 'Dark upward diagonal',
     'Wide downward diagonal', 'Wide upward diagonal',
     'Light vertical', 'Light horizontal',
     'Narrow vertical', 'Narrow horizontal',
     'Dark vertical', 'Dark horizontal',
     'Dashed downward diagonal', 'Dashed upward diagonal',
     'Dashed horizontal', 'Dashed vertical',
     'Small confetti', 'Large confetti',
     'Zig zag', 'Wave', 'Diagonal brick', 'Horizontal brick', 'Weave', 'Plaid',
     'Divot', 'Dotted grid', 'Dotted diamond', 'Shingle', 'Trellis', 'Sphere',
     'Small grid', 'Large grid', 'Small checker board', 'Large checker board',
     'Outlined diamond', 'Solid diamond');}

LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

InternalNumberFormats: array[0..49] of WideString = (
'',
'0',
'0.00',
'#,##0',
'#,##0.00',
'_($#,##0_);($#,##0)',
'_($#,##0_);[Red]($#,##0)',
'_($#,##0.00_);($#,##0.00)',
'_($#,##0.00_);[Red]($#,##0.00)',
'0%',
'0.00%',
'0.00E+00',
'# ?/?',
'# ??/??',
'm/d/yy',
'd-mmm-y',
'd-mmm',
'mmmm-yy',
'h:mm AM/PM',
'h:mm:ss AM/PM',
'h:mm',
'h:mm:SS',
'm/d/yy h:mm',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'(#,##0_);(#,##0)',
'(#,##0_);[Red](#,##0)',
'(#,##0.00_);(#,##0.00)',
'(#,##0.00_);[Red](#,##0.00)',
'_(* #,##0_);_(* (#,##0);_(* "-"_);_(@_)',
'_($* #,##0_);_($* (#,##0);_($* "-"_);_(@_)',
'_(* #,##0.00_);_(* (#,##0.00);_(* "-"??_);_(@_)',
'_($* #,##0.00_);_($* (#,##0.00);_($* "-"??_);_(@_)',
'mm:ss',
'[h]:mm:ss',
'mm:ss.0',
'# #0.0E+0',
'@');

type
  PBIFF_Header = ^TBIFF_Header;
  TBIFF_Header = packed record
    ID    : word;
    Length: word;
  end;

  PBIFF_BOF = ^TBIFF_BOF;
  TBIFF_BOF = packed record
    Version     : word;
    DataType    : word;
    BuildID     : word;
    BuildYear   : word;
    HistoryFlags: integer;
    LowVersion  : integer;
  end;

  PBIFF_FONT = ^TBIFF_FONT;
  TBIFF_FONT = packed record
    Height      : word;
    Option      : word;
    PaletteIndex: word;
    Boldness    : word;
    Script      : word;
    Underline   : byte;
    Family      : byte;
    Charset     : byte;
    NotUsed     : byte;
    NameLen     : byte;
    NameOpt     : byte;
    Name        : array[0..65535] of byte;
  end;

  PBIFF_XF = ^TBIFF_XF;
  TBIFF_XF = packed record
    FontIndex  : word;
    FormatIndex: word;
    Data1      : word;
    Data2      : word;
    Data3      : word;
    Data4      : word;
    Data5      : word;
    Data6      : longint;
    Data7      : word;
  end;

  PBIFF_STYLE = ^TBIFF_STYLE;
  TBIFF_STYLE = packed record
    Index  : word;
    BuiltIn: byte;
    Level  : byte;
  end;

  PBIFF_FORMAT = ^TBIFF_FORMAT;
  TBIFF_FORMAT = packed record
    ID       : word;
    FormatLen: word;
    FormatOpt: byte;
    Format   : array[0..65535] of byte;
  end;

  PBIFF_DEFAULTROWHEIGHT = ^TBIFF_DEFAULTROWHEIGHT;
  TBIFF_DEFAULTROWHEIGHT = packed record
    Options: word;
    Height : word;
  end;

  PBIFF_DEFCOLWIDTH = ^TBIFF_DEFCOLWIDTH;
  TBIFF_DEFCOLWIDTH = packed record
    Width: word;
  end;

  PBIFF_COLINFO = ^TBIFF_COLINFO;
  TBIFF_COLINFO = packed record
    FirstCol: word;
    LastCol : word;
    Width   : word;
    XF      : word;
    Options : word;
    Reserved: byte;
  end;

  PBIFF_DIMENSIONS = ^TBIFF_DIMENSIONS;
  TBIFF_DIMENSIONS = packed record
    FirstRow: integer;
    LastRow : integer;
    FirstCol: word;
    LastCol : word;
    Reserved: word;
  end;

  PBIFF_SST = ^TBIFF_SST;
  TBIFF_SST = packed record
    Total : integer;
    Unique: integer;
  end;

  PBIFF_BLANK = ^TBIFF_BLANK;
  TBIFF_BLANK = packed record
    Row: word;
    Col: word;
    XF : word;
  end;

  PBIFF_WINDOW1 = ^TBIFF_WINDOW1;
  TBIFF_WINDOW1 = packed record
    Left        : word;
    Top         : word;
    Width       : word;
    Height      : word;
    Options     : word;
    ActiveSheet : word;
    FirstVisible: word;
    SelectCount : word;
    TabWidth    : word;
  end;

  PBIFF_CELL_RANGE = ^TBIFF_CELL_RANGE;
  TBIFF_CELL_RANGE = packed record
    FirstRow: word;
    LastRow: word;
    FirstCol: word;
    LastCol: word;
  end;

  PBIFF_WINDOW2 = ^TBIFF_WINDOW2;
  TBIFF_WINDOW2 = packed record
    Options      : word;
    TopRow       : word;
    LeftCol      : word;
    GridLineColor: integer;
    ZoomInPreview: word;
    ZoomInNormal : word;
    Reserved     : integer;
  end;

  PBIFF_SELECTION = ^TBIFF_SELECTION;
  TBIFF_SELECTION = packed record
    Pane     : byte;
    ActiveRow: word;
    ActiveCol: word;
    ActiveRef: word;
    Refs     : word;
    Row1     : word;
    Row2     : word;
    Col1     : word;
    Col2     : byte
  end;

  PBIFF_SCL = ^TBIFF_SCL;
  TBIFF_SCL = packed record
    Numerator  : word;
    Denominator: word;
  end;

  PBIFF_LABELSST = ^TBIFF_LABELSST;
  TBIFF_LABELSST = packed record
    Row     : word;
    Col     : word;
    XFIndex : word;
    SSTIndex: integer;
  end;

  PBIFF_BOOLERR = ^TBIFF_BOOLERR;
  TBIFF_BOOLERR = packed record
    Row    : word;
    Col    : word;
    XFIndex: word;
    BoolErr: byte;
    Error  : byte;
  end;

  PBIFF_NUMBER = ^TBIFF_NUMBER;
  TBIFF_NUMBER = packed record
    Row    : word;
    Col    : word;
    XFIndex: word;
    Value  : double;
  end;

  PBIFF_BOUNDSHEET = ^TBIFF_BOUNDSHEET;
  TBIFF_BOUNDSHEET = packed record
    BOFPos    : integer;
    Visibility: byte;
    // $00 - Visible
    // $01 - Hidden
    // $02 - Strong visible
    SheetType : byte;
    // $00 - WorkSheet
    // $02 - Chart
    // $06 - Visual Basic module
    NameLen   : byte;
    NameOpt   : byte;
    Name      : array[0..65535] of byte;
  end;

  PBIFF_COUNTRY = ^TBIFF_COUNTRY;
  TBIFF_COUNTRY = packed record
    CountryDef   : word;
    CountryWinIni: word;
  end;

  PBIFF_TXO = ^TBIFF_TXO;
  TBIFF_TXO = packed record
    Options     : word;
    Orientation : word;
    Reserved1   : array[0..5] of byte;
    TextLength  : word;
    FormatLength: word;
    Reserved2   : array[0..3] of byte;
  end;

  PBIFF_TXORUN = ^TBIFF_TXORUN;
  TBIFF_TXORUN = packed record
    CharIndex1: word;
    FontIndex1: word;
    Reserved1 : cardinal;
    CharIndex2: word;
    FontIndex2: word;
    Reserved2 : cardinal;
  end;

  PBIFF_NOTE = ^TBIFF_NOTE;
  TBIFF_NOTE = packed record
    Row          : word;
    Col          : word;
    Options      : word;
    ObjID        : word;
//    AuthorLength : word;
  end;

  PBIFF_SUPBOOK_INTERNAL = ^TBIFF_SUPBOOK_INTERNAL;
  TBIFF_SUPBOOK_INTERNAL = packed record
    SheetCount: word;
    Relict: word; {Value: $0104}
  end;

  PBIFF_SETUP = ^TBIFF_SETUP;
  TBIFF_SETUP = packed record
    PaperSize              : word;
    ScalingFactor          : word;
    StartingPageNumber     : word;
    FitToWidth             : word;
    FitToHeight            : word;
    OptionFlags            : word;
    PrintResolution        : word;
    VerticalPrintResolution: word;
    HeaderMargin           : double;
    FooterMargin           : double;
    NumberOfCopies         : word;
  end;

  PBIFF_BITMAP = ^TBIFF_BITMAP;
  TBIFF_BITMAP = packed record
    Unknown1: word; {0009}
    Unknown2: word; {0001}
    NextPartSize: cardinal;
    Unknown3: word; {000C}
    Unknown4: word; {0000}
    Width: word;
    Height: word;
    PlaneCount: word; {0001}
    ColorDepth: word; {0018 - 24 bits}
  end;

  PBIFF_AGGREGATE = ^TBIFF_AGGREGATE;
  TBIFF_AGGREGATE = packed record
    Row: word;
    Col: word;
    XF: word;
    Value: double;
    Options: word;
    Reserved: integer;
    ParseLen: word; // = $OD
    TokenID: byte; // = $25
    StartRow: word;
    FinishRow: word;
    StartCol: byte;
    StartColFlag: byte;  // = $C0
    FinishCol: byte;
    FinishColFlag: byte; // = $C0
    PtgFuncVarV: byte; // = $42
    Arguments: byte;  // = $01
    InternalFunction: word;
  end;

  PBIFF_XTI = ^TBIFF_XTI;
  TBIFF_XTI = packed record
    Supbook : word;
    FirstTab: word;
    LastTab : word;
  end;

  PBIFF_PTGRef = ^TBIFF_PTGRef;
  TBIFF_PTGRef = packed record
    Row: word;
    Col: word;
  end;

  PBIFF_PTGRef3D = ^TBIFF_PTGRef3D;
  TBIFF_PTGRef3D = packed record
    Index: word;
    Row: word;
    Col: word;
  end;

  PBIFF_PTGArea = ^TBIFF_PTGArea;
  TBIFF_PTGArea = packed record
    Row1: word;
    Row2: word;
    Col1: word;
    Col2: word;
  end;

  PPTG_AREA3D = ^TPTG_AREA3D;
  TPTG_AREA3D = packed record
    Index: word;
    Row1 : word;
    Row2 : word;
    Col1 : word;
    Col2 : word;
  end;

  PBIFF_PTGName = ^TBIFF_PTGName;
  TBIFF_PTGName = packed record
    NameIndex: word;
    Reserved: word;
  end;

  PBIFF_PTGNameX = ^TBIFF_PTGNameX;
  TBIFF_PTGNameX = packed record
    ExternSheetIndex: word;
    ExternNameIndex: word; // 1 based
    Reserved: word;
  end;

  PCHART_FBI = ^TCHART_FBI;
  TCHART_FBI = packed record
    Width        : word;
    Height       : word;
    HeightApplied: word;
    Scale        : word;
    FontIndex    : word;
  end;

  PCHART_CHART = ^TCHART_CHART;
  TCHART_CHART = packed record
    Top   : cardinal;
    Left  : cardinal;
    Width : cardinal;
    Height: cardinal;
  end;

  PCHART_PLOTGROWTH = ^TCHART_PLOTGROWTH;
  TCHART_PLOTGROWTH = packed record
    Horizontal: cardinal;
    Vertical  : cardinal;
  end;

  PCHART_FRAME = ^TCHART_FRAME;
  TCHART_FRAME = packed record
    FrameType: word;
    Flags: word;
  end;

  PCHART_LINEFORMAT = ^TCHART_LINEFORMAT;
  TCHART_LINEFORMAT = packed record
    Color      : cardinal;
    Pattern    : word;
    Weight     : word;
    FormatFlags: word;
    ColorIndex : word;
  end;

  PCHART_AREAFORMAT = ^TCHART_AREAFORMAT;
  TCHART_AREAFORMAT = packed record
    ForegroundColor     : cardinal;
    BackgroundColor     : cardinal;
    Pattern             : word;
    FormatFlags         : word;
    ForegroundColorIndex: word;
    BackgroundColorIndex: word;
  end;

  PCHART_SERIES = ^TCHART_SERIES;
  TCHART_SERIES = packed record
    CategoryType : word;
    ValueType    : word;
    CategoryCount: word;
    ValueCount   : word;
    BubbleType   : word;
    BubbleCount  : word;
  end;

  PCHART_AI = ^TCHART_AI;
  TCHART_AI = packed record
    LinkType     : byte;
    ReferenceType: byte;
    Flags        : word;
    FormatIndex  : word;
    FormulaSize  : word;
  end;

  PCHART_PTG_AREA3D = ^TCHART_PTG_AREA3D;
  TCHART_PTG_AREA3D = packed record
    ID: byte;
    PTG_AREA3D: TPTG_AREA3D;
  end;

  PCHART_SERIESTEXT = ^TCHART_SERIESTEXT;
  TCHART_SERIESTEXT = packed record
    TextID: word;
    Length: byte;
  end;

  PCHART_DATAFORMAT = ^TCHART_DATAFORMAT;
  TCHART_DATAFORMAT = packed record
    PointNumber : word;
    SeriesIndex : word;
    SeriesNumber: word;
    FormatFlags : word;
  end;

  PCHART_SERTOCRT = ^TCHART_SERTOCRT;
  TCHART_SERTOCRT = packed record
    ChartGroupIndex: word;
  end;

  PCHART_SHTPROPS = ^TCHART_SHTPROPS;
  TCHART_SHTPROPS = packed record
    PropertyFlags: word;
    EmptyAs      : byte;
    Unknown      : byte;
  end;

  PCHART_DEFAULTTEXT = ^TCHART_DEFAULTTEXT;
  TCHART_DEFAULTTEXT = packed record
    ObjectID: word;
  end;

  PCHART_TEXT = ^TCHART_TEXT;
  TCHART_TEXT = packed record
    HorizontalAlignment: byte;
    VerticalAlignment  : byte;
    BackgroundMode     : word;
    Color              : cardinal;
    Left               : cardinal;
    Top                : cardinal;
    Width              : cardinal;
    Height             : cardinal;
    OptionFlags1       : word;
    ColorIndex         : word;
    OptionFlags2       : word;
    Rotation           : word;
  end;

  PCHART_POS = ^TCHART_POS;
  TCHART_POS = packed record
    TopLt: word;
    BotRt: word;
    X1   : cardinal;
    Y1   : cardinal;
    X2   : cardinal;
    Y2   : cardinal;
  end;

  PCHART_FONTX = ^TCHART_FONTX;
  TCHART_FONTX = packed record
    FontIndex: word;
  end;

  PCHART_AXESUSED = ^TCHART_AXESUSED;
  TCHART_AXESUSED = packed record
    AxesCount: word;
  end;

  PCHART_AXISPARENT = ^TCHART_AXISPARENT;
  TCHART_AXISPARENT = packed record
    AxisIndex: word;
    Top      : cardinal;
    Left     : cardinal;
    Width    : cardinal;
    Height   : cardinal;
  end;

  PCHART_AXIS = ^TCHART_AXIS;
  TCHART_AXIS = packed record
    AxisType: word;
    Reserved: array[0..15] of byte;
  end;

  PCHART_CATSERRANGE = ^TCHART_CATSERRANGE;
  TCHART_CATSERRANGE = packed record
    CrossingPoint  : word;
    FrequencyLabels: word;
    FrequencyMarks : word;
    FormatFlags    : word;
  end;

  PCHART_AXCEXT = ^TCHART_AXCEXT;
  TCHART_AXCEXT = packed record
    MinCategory  : word;
    MaxCategory  : word;
    MajorValue   : word;
    MajorUnits   : word;
    MinorValue   : word;
    MinorUnits   : word;
    BaseUnit     : word;
    CrossingPoint: word;
    OptionFlags  : word;
  end;

  PCHART_TICK = ^TCHART_TICK;
  TCHART_TICK = packed record
    MajorMarkType : byte;
    MinorMarkType : byte;
    LabelPosition : byte;
    BackgroundMode: byte;
    Color         : cardinal;
    Reserved1     : array[0..15] of byte;
    DisplayFlags  : word;
    ColorIndex    : word;
    Reserved2     : word;
  end;

  PCHART_VALUERANGE = ^TCHART_VALUERANGE;
  TCHART_VALUERANGE = packed record
    MinValue    : double;
    MaxValue    : double;
    MajorInc    : double;
    MinorInc    : double;
    AxisCrosses : double;
    FormatFlags : word;
  end;

  PCHART_AXISLINEFORMAT = ^TCHART_AXISLINEFORMAT;
  TCHART_AXISLINEFORMAT = packed record
    LineID: word;
  end;

  PCHART_CHARTFORMAT = ^TCHART_CHARTFORMAT;
  TCHART_CHARTFORMAT = packed record
    Reserved    : array[0..15] of byte;
    FormatFlags : word;
    DrawingOrder: word;
  end;

  PCHART_BAR = ^TCHART_BAR;
  TCHART_BAR = packed record
    SpaceBars: word;
    SpaceCategories: word;
    FormatFlags: word;
  end;

  PCHART_LINE = ^TCHART_LINE;
  TCHART_LINE = packed record
    FormatFlags: word;
  end;

  PCHART_PIE = ^TCHART_PIE;
  TCHART_PIE = packed record
    Angle: word;
    Donut: word;
    OptionFlags: word;
  end;

  PCHART_AREA = ^TCHART_AREA;
  TCHART_AREA = packed record
    FormatFlags: word;
  end;

  PCHART_SURFACE = ^TCHART_SURFACE;
  TCHART_SURFACE = packed record
    OptionFlags: word;
  end;

  PCHART_RADAR = ^TCHART_RADAR;
  TCHART_RADAR = packed record
    OptionFlags: word;
  end;

  PCHART_RADARAREA = ^TCHART_RADARAREA;
  TCHART_RADARAREA = packed record
    OptionFlags: word;
  end;

  PCHART_3D = ^TCHART_3D;
  TCHART_3D = packed record
    Rotation   : word;
    Elevation  : word;
    Distance   : word;
    PlotHeight : word;
    Depth      : word;
    Space      : word;
    OptionFlags: word;
  end;

  PCHART_LEGEND = ^TCHART_LEGEND;
  TCHART_LEGEND = packed record
    Top        : cardinal;
    Left       : cardinal;
    Width      : cardinal;
    Height     : cardinal;
    LegendType : byte;
    Spacing    : byte;
    OptionFlags: word;
  end;

  PCHART_OBJECTLINK = ^TCHART_OBJECTLINK;
  TCHART_OBJECTLINK = packed record
    LinkedTo   : word;
    SeriesIndex: word;
    DataIndex  : word;
  end;

  PCHART_SIINDEX = ^TCHART_SIINDEX;
  TCHART_SIINDEX = packed record
    Index: word;
  end;

  PMSO_Header = ^TMSO_Header;
  TMSO_Header = packed record
    Options: word;
    FBT    : word;
    Length : cardinal;
  end;

  TClusterID = packed record
    DgID      : cardinal;
    ShapesUsed: cardinal;
  end;

  PMSO_Dgg = ^TMSO_Dgg;
  TMSO_Dgg = packed record
    MaxShapeID  : cardinal;
    ClusterCount: cardinal;
    ShapesSaved : cardinal;
    DrawingsSaved: cardinal;
    ClusterID: TClusterID;
  end;

  PMSO_Dg = ^TMSO_Dg;
  TMSO_Dg = packed record
    ShapeCount : cardinal;
    CurrShapeID: cardinal;
  end;
  
  PMSO_Sp = ^TMSO_Sp;
  TMSO_Sp = packed record
    ID   : cardinal;
    Flags: cardinal;
  end;

  PMSO_OPT = ^TMSO_OPT;
  TMSO_OPT = packed record
    Options: word;
    Value  : cardinal;
  end;

  PMSO_Anchor = ^TMSO_Anchor;
  TMSO_Anchor = packed record
    Options: word;
    Col1: word;
    Col1Offset: word;
    Row1: word;
    Row1Offset: word;
    Col2: word;
    Col2Offset: word;
    Row2: word;
    Row2Offset: word;
  end;

  PMSO_SplitMenuColors = ^TMSO_SplitMenuColors;
  TMSO_SplitMenuColors = packed record
    TopLevelFill: cardinal;
    LineType    : cardinal;
    Shadow      : cardinal;
    ThreeD      : cardinal;
  end;

  PMSO_BSE = ^TMSO_BSE;
  TMSO_BSE = packed record
    WinType  : byte;
    MacType  : byte;
    Checksum : array[0..15] of byte;
    Tag      : word;
    Size     : cardinal;
    RefCount : cardinal;
    DelOffset: cardinal;
    IsTexture: byte;
    NameLen  : byte;
    Dummy    : word;
  end;

  POBJ_CMO = ^TOBJ_CMO;
  TOBJ_CMO = packed record
    ObjectType : word;
    ObjectID   : word;
    OptionFlags: word;
    Reserved   : array[0..11] of byte;
  end;

  TXLS_FUNCTION = packed record
    Min: byte;
    Max: byte;
    Name: string;
  end;

  TXLS_FUNCTION_ID = (fidCount, fidIf, fidIsNa, fidIsError, fidSum, fidAverage,
    fidMin, fidMax, fidRow, fidColumn, fidNA, fidNPV, fidSTDEV, fidDollar,
    fidFixed, fidSin, fidCos, fidTan, fidATan, fidPI, fidSqrt, fidExp, fidLN,
    fidLog10, fidAbs, fidInt);

  TXLS_FUNCTIONS = array[0..367] of TXLS_FUNCTION;

  TWordBit = (b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15);
  TWordBits = set of TWordBit;

const
  XLS_FUNCTIONS: TXLS_FUNCTIONS = (
  {000} (Min: 01; Max: 99; Name: 'COUNT'),
  {001} (Min: 02; Max: 03; Name: 'IF'),
  {002} (Min: 01; Max: 01; Name: 'ISNA'),
  {003} (Min: 01; Max: 01; Name: 'ISERROR'),
  {004} (Min: 01; Max: 99; Name: 'SUM'),
  {005} (Min: 01; Max: 99; Name: 'AVERAGE'),
  {006} (Min: 01; Max: 99; Name: 'MIN'),
  {007} (Min: 01; Max: 99; Name: 'MAX'),
  {008} (Min: 00; Max: 01; Name: 'ROW'),
  {009} (Min: 00; Max: 01; Name: 'COLUMN'),
  {010} (Min: 01; Max: 01; Name: 'NA'),
  {011} (Min: 01; Max: 99; Name: 'NPV'),
  {012} (Min: 01; Max: 99; Name: 'STDEV'),
  {013} (Min: 01; Max: 02; Name: 'DOLLAR'),
  {014} (Min: 01; Max: 03; Name: 'FIXED'),
  {015} (Min: 01; Max: 01; Name: 'SIN'),
  {016} (Min: 01; Max: 01; Name: 'COS'),
  {017} (Min: 01; Max: 01; Name: 'TAN'),
  {018} (Min: 01; Max: 01; Name: 'ATAN'),
  {019} (Min: 00; Max: 00; Name: 'PI'),
  {020} (Min: 01; Max: 01; Name: 'SQRT'),
  {021} (Min: 01; Max: 01; Name: 'EXP'),
  {022} (Min: 01; Max: 01; Name: 'LN'),
  {023} (Min: 01; Max: 01; Name: 'LOG10'),
  {024} (Min: 01; Max: 01; Name: 'ABS'),
  {025} (Min: 01; Max: 01; Name: 'INT'),
  {026} (Min: 01; Max: 01; Name: 'SIGN'),
  {027} (Min: 02; Max: 02; Name: 'ROUND'),
  {028} (Min: 03; Max: 03; Name: 'LOOKUP'),
  {029} (Min: 01; Max: 03; Name: 'INDEX'),
  {030} (Min: 02; Max: 02; Name: 'REPT'),
  {031} (Min: 01; Max: 03; Name: 'MID'),
  {032} (Min: 01; Max: 01; Name: 'LEN'),
  {033} (Min: 01; Max: 01; Name: 'VALUE'),
  {034} (Min: 00; Max: 00; Name: 'TRUE'),
  {035} (Min: 00; Max: 00; Name: 'FALSE'),
  {036} (Min: 01; Max: 99; Name: 'AND'),
  {037} (Min: 01; Max: 99; Name: 'OR'),
  {038} (Min: 01; Max: 01; Name: 'NOT'),
  {039} (Min: 02; Max: 02; Name: 'MOD'),
  {040} (Min: 03; Max: 03; Name: 'DCOUNT'),
  {041} (Min: 03; Max: 03; Name: 'DSUM'),
  {042} (Min: 03; Max: 03; Name: 'DAVERAGE'),
  {043} (Min: 03; Max: 03; Name: 'DMIN'),
  {044} (Min: 03; Max: 03; Name: 'DMAX'),
  {045} (Min: 03; Max: 03; Name: 'DSTDEV'),
  {046} (Min: 01; Max: 99; Name: 'VAR'),
  {047} (Min: 03; Max: 03; Name: 'DVAR'),
  {048} (Min: 02; Max: 02; Name: 'TEXT'),
  {049} (Min: 01; Max: 04; Name: 'LINEST'),
  {050} (Min: 01; Max: 04; Name: 'TREND'),
  {051} (Min: 01; Max: 04; Name: 'LOGEST'),
  {052} (Min: 01; Max: 04; Name: 'GROWTH'),
  {053} (Min: 01; Max: 01; Name: 'GOTO'),
  {054} (Min: 01; Max: 01; Name: 'HALT'),
  {055} (Min: 01; Max: 01; Name: 'RETURN'),
  {056} (Min: 02; Max: 05; Name: 'PV'),
  {057} (Min: 02; Max: 05; Name: 'FV'),
  {058} (Min: 02; Max: 05; Name: 'NPER'),
  {059} (Min: 03; Max: 05; Name: 'PMT'),
  {060} (Min: 03; Max: 05; Name: 'RATE'),
  {061} (Min: 03; Max: 03; Name: 'MIRR'),
  {062} (Min: 01; Max: 02; Name: 'IRR'),
  {063} (Min: 00; Max: 00; Name: 'RAND'),
  {064} (Min: 02; Max: 03; Name: 'MATCH'),
  {065} (Min: 03; Max: 03; Name: 'DATE'),
  {066} (Min: 03; Max: 03; Name: 'TIME'),
  {067} (Min: 01; Max: 01; Name: 'DAY'),
  {068} (Min: 01; Max: 01; Name: 'MONTH'),
  {069} (Min: 01; Max: 01; Name: 'YEAR'),
  {070} (Min: 01; Max: 02; Name: 'WEEKDAY'),
  {071} (Min: 01; Max: 01; Name: 'HOUR'),
  {072} (Min: 01; Max: 01; Name: 'MINUTE'),
  {073} (Min: 01; Max: 01; Name: 'SECOND'),
  {074} (Min: 00; Max: 00; Name: 'NOW'),
  {075} (Min: 01; Max: 01; Name: 'AREAS'),
  {076} (Min: 01; Max: 01; Name: 'ROWS'),
  {077} (Min: 01; Max: 01; Name: 'COLUMNS'),
  {078} (Min: 02; Max: 04; Name: 'OFFSET'),
  {079} (Min: 01; Max: 01; Name: 'ABSREF'),
  {080} (Min: 01; Max: 01; Name: 'RELREF'),
  {081} (Min: 01; Max: 01; Name: 'ARGUMENT'),
  {082} (Min: 02; Max: 03; Name: 'SEARCH'),
  {083} (Min: 01; Max: 01; Name: 'TRANSPOSE'),
  {084} (Min: 01; Max: 01; Name: 'ERROR'),
  {085} (Min: 01; Max: 01; Name: 'STEP'),
  {086} (Min: 01; Max: 01; Name: 'TYPE'),
  {087} (Min: 01; Max: 01; Name: 'ECHO'),
  {088} (Min: 01; Max: 01; Name: 'SET.NAME'),
  {089} (Min: 01; Max: 01; Name: 'CALLER'),
  {090} (Min: 01; Max: 01; Name: 'DEREF'),
  {091} (Min: 01; Max: 01; Name: 'WINDOWS'),
  {092} (Min: 01; Max: 01; Name: 'SERIES'),
  {093} (Min: 01; Max: 01; Name: 'DOCUMENTS'),
  {094} (Min: 01; Max: 01; Name: 'ACTIVE.CELL'),
  {095} (Min: 01; Max: 01; Name: 'SELECTION'),
  {096} (Min: 01; Max: 01; Name: 'RESULT'),
  {097} (Min: 02; Max: 02; Name: 'ATAN2'),
  {098} (Min: 01; Max: 01; Name: 'ASIN'),
  {099} (Min: 01; Max: 01; Name: 'ACOS'),
  {100} (Min: 02; Max: 99; Name: 'CHOOSE'),
  {101} (Min: 03; Max: 04; Name: 'HLOOKUP'),
  {102} (Min: 03; Max: 04; Name: 'VLOOKUP'),
  {103} (Min: 01; Max: 01; Name: 'LINKS'),
  {104} (Min: 01; Max: 01; Name: 'INPUT'),
  {105} (Min: 01; Max: 01; Name: 'ISREF'),
  {106} (Min: 01; Max: 01; Name: 'GET.FORMULA'),
  {107} (Min: 01; Max: 01; Name: 'GET.NAME'),
  {108} (Min: 01; Max: 01; Name: 'SET.VALUE'),
  {109} (Min: 01; Max: 02; Name: 'LOG'),
  {110} (Min: 01; Max: 01; Name: 'EXEC'),
  {111} (Min: 01; Max: 01; Name: 'CHAR'),
  {112} (Min: 01; Max: 01; Name: 'LOWER'),
  {113} (Min: 01; Max: 01; Name: 'UPPER'),
  {114} (Min: 01; Max: 01; Name: 'PROPER'),
  {115} (Min: 01; Max: 02; Name: 'LEFT'),
  {116} (Min: 01; Max: 02; Name: 'RIGHT'),
  {117} (Min: 02; Max: 02; Name: 'EXACT'),
  {118} (Min: 01; Max: 01; Name: 'TRIM'),
  {119} (Min: 04; Max: 04; Name: 'REPLACE'),
  {120} (Min: 03; Max: 04; Name: 'SUBSTITUTE'),
  {121} (Min: 01; Max: 01; Name: 'CODE'),
  {122} (Min: 01; Max: 01; Name: 'NAMES'),
  {123} (Min: 01; Max: 01; Name: 'DIRECTORY'),
  {124} (Min: 02; Max: 03; Name: 'FIND'),
  {125} (Min: 02; Max: 02; Name: 'CELL'),
  {126} (Min: 01; Max: 01; Name: 'ISERR'),
  {127} (Min: 01; Max: 01; Name: 'ISTEXT'),
  {128} (Min: 01; Max: 01; Name: 'ISNUMBER'),
  {129} (Min: 01; Max: 01; Name: 'ISBLANK'),
  {130} (Min: 01; Max: 01; Name: 'T'),
  {131} (Min: 01; Max: 01; Name: 'N'),
  {132} (Min: 01; Max: 01; Name: 'FOPEN'),
  {133} (Min: 01; Max: 01; Name: 'FCLOSE'),
  {134} (Min: 01; Max: 01; Name: 'FSIZE'),
  {135} (Min: 01; Max: 01; Name: 'FREADLN'),
  {136} (Min: 01; Max: 01; Name: 'FREAD'),
  {137} (Min: 01; Max: 01; Name: 'FWRITELN'),
  {138} (Min: 01; Max: 01; Name: 'FWRITE'),
  {139} (Min: 01; Max: 01; Name: 'FPOS'),
  {140} (Min: 01; Max: 01; Name: 'DATEVALUE'),
  {141} (Min: 01; Max: 01; Name: 'TIMEVALUE'),
  {142} (Min: 03; Max: 03; Name: 'SLN'),
  {143} (Min: 03; Max: 03; Name: 'SYD'),
  {144} (Min: 03; Max: 05; Name: 'DDB'),
  {145} (Min: 01; Max: 01; Name: 'GET.DEF'),
  {146} (Min: 01; Max: 01; Name: 'REFTEXT'),
  {147} (Min: 01; Max: 01; Name: 'TEXTREF'),
  {148} (Min: 01; Max: 02; Name: 'INDIRECT'),
  {149} (Min: 01; Max: 03; Name: 'REGISTER'),
  {150} (Min: 01; Max: 99; Name: 'CALL'),
  {151} (Min: 01; Max: 01; Name: 'ADD.BAR'),
  {152} (Min: 01; Max: 01; Name: 'ADD.MENU'),
  {153} (Min: 01; Max: 01; Name: 'ADD.COMMAND'),
  {154} (Min: 01; Max: 01; Name: 'ENABLE.COMMAND'),
  {155} (Min: 01; Max: 01; Name: 'CHECK.COMMAND'),
  {156} (Min: 01; Max: 01; Name: 'RENAME.COMMAND'),
  {157} (Min: 01; Max: 01; Name: 'SHOW.BAR'),
  {158} (Min: 01; Max: 01; Name: 'DELETE.MENU'),
  {159} (Min: 01; Max: 01; Name: 'DELETE.COMMAND'),
  {160} (Min: 01; Max: 01; Name: 'GET.CHART.ITEM'),
  {161} (Min: 01; Max: 01; Name: 'DIALOG.BOX'),
  {162} (Min: 01; Max: 01; Name: 'CLEAN'),
  {163} (Min: 01; Max: 01; Name: 'MDETERM'),
  {164} (Min: 01; Max: 01; Name: 'MINVERSE'),
  {165} (Min: 01; Max: 01; Name: 'MMULT'),
  {166} (Min: 01; Max: 01; Name: 'FILES'),
  {167} (Min: 04; Max: 06; Name: 'IPMT'),
  {168} (Min: 04; Max: 06; Name: 'PPMT'),
  {169} (Min: 01; Max: 99; Name: 'COUNTA'),
  {170} (Min: 01; Max: 01; Name: 'CANCEL.KEY'),
  {171} (Min: 01; Max: 01; Name: 'FOR'),
  {172} (Min: 01; Max: 01; Name: 'WHILE'),
  {173} (Min: 01; Max: 01; Name: 'BREAK'),
  {174} (Min: 01; Max: 01; Name: 'NEXT'),
  {175} (Min: 01; Max: 01; Name: 'INITIATE'),
  {176} (Min: 01; Max: 01; Name: 'REQUEST'),
  {177} (Min: 01; Max: 01; Name: 'POKE'),
  {178} (Min: 01; Max: 01; Name: 'EXECUTE'),
  {179} (Min: 01; Max: 01; Name: 'TERMINATE'),
  {180} (Min: 01; Max: 01; Name: 'RESTART'),
  {181} (Min: 01; Max: 01; Name: 'HELP'),
  {182} (Min: 01; Max: 01; Name: 'GET.BAR'),
  {183} (Min: 01; Max: 99; Name: 'PRODUCT'),
  {184} (Min: 01; Max: 01; Name: 'FACT'),
  {185} (Min: 01; Max: 01; Name: 'GET.CELL'),
  {186} (Min: 01; Max: 01; Name: 'GET.WORKSPACE'),
  {187} (Min: 01; Max: 01; Name: 'GET.WINDOW'),
  {188} (Min: 01; Max: 01; Name: 'GET.DOCUMENT'),
  {189} (Min: 03; Max: 03; Name: 'DPRODUCT'),
  {190} (Min: 01; Max: 01; Name: 'ISNONTEXT'),
  {191} (Min: 01; Max: 01; Name: 'GET.NOTE'),
  {192} (Min: 01; Max: 01; Name: 'NOTE'),
  {193} (Min: 01; Max: 99; Name: 'STDEVP'),
  {194} (Min: 01; Max: 99; Name: 'VARP'),
  {195} (Min: 03; Max: 03; Name: 'DSTDEVP'),
  {196} (Min: 03; Max: 03; Name: 'DVARP'),
  {197} (Min: 01; Max: 02; Name: 'TRUNC'),
  {198} (Min: 01; Max: 01; Name: 'ISLOGICAL'),
  {199} (Min: 03; Max: 03; Name: 'DCOUNTA'),
  {200} (Min: 01; Max: 01; Name: 'DELETE.BAR'),
  {201} (Min: 01; Max: 01; Name: 'UNREGISTER'),
  {202} (Min: 01; Max: 01; Name: '202'),
  {203} (Min: 01; Max: 01; Name: '203'),
  {204} (Min: 01; Max: 01; Name: 'USDOLLAR'),
  {205} (Min: 01; Max: 01; Name: 'FINDB'),
  {206} (Min: 01; Max: 01; Name: 'SEARCHB'),
  {207} (Min: 01; Max: 01; Name: 'REPLACEB'),
  {208} (Min: 01; Max: 01; Name: 'LEFTB'),
  {209} (Min: 01; Max: 01; Name: 'RIGHTB'),
  {210} (Min: 01; Max: 01; Name: 'MIDB'),
  {211} (Min: 01; Max: 01; Name: 'LENB'),
  {212} (Min: 01; Max: 02; Name: 'ROUNDUP'),
  {213} (Min: 01; Max: 02; Name: 'ROUNDDOWN'),
  {214} (Min: 01; Max: 01; Name: 'ASC'),
  {215} (Min: 01; Max: 01; Name: 'DBCS'),
  {216} (Min: 02; Max: 03; Name: 'RANK'),
  {217} (Min: 01; Max: 01; Name: '217'),
  {218} (Min: 01; Max: 01; Name: '218'),
  {219} (Min: 02; Max: 05; Name: 'ADDRESS'),
  {220} (Min: 02; Max: 03; Name: 'DAYS360'),
  {221} (Min: 00; Max: 00; Name: 'TODAY'),
  {222} (Min: 05; Max: 07; Name: 'VDB'),
  {223} (Min: 01; Max: 01; Name: 'ELSE'),
  {224} (Min: 01; Max: 01; Name: 'ELSE.IF'),
  {225} (Min: 01; Max: 01; Name: 'END.IF'),
  {226} (Min: 01; Max: 01; Name: 'FOR.CELL'),
  {227} (Min: 01; Max: 99; Name: 'MEDIAN'),
  {228} (Min: 02; Max: 99; Name: 'SUMPRODUCT'),
  {229} (Min: 01; Max: 01; Name: 'SINH'),
  {230} (Min: 01; Max: 01; Name: 'COSH'),
  {231} (Min: 01; Max: 01; Name: 'TANH'),
  {232} (Min: 01; Max: 01; Name: 'ASINH'),
  {233} (Min: 01; Max: 01; Name: 'ACOSH'),
  {234} (Min: 01; Max: 01; Name: 'ATANH'),
  {235} (Min: 03; Max: 03; Name: 'DGET'),
  {236} (Min: 01; Max: 01; Name: 'CREATE.OBJECT'),
  {237} (Min: 01; Max: 01; Name: 'VOLATILE'),
  {238} (Min: 01; Max: 01; Name: 'LAST.ERROR'),
  {239} (Min: 01; Max: 01; Name: 'CUSTOM.UNDO'),
  {240} (Min: 01; Max: 01; Name: 'CUSTOM.REPEAT'),
  {241} (Min: 01; Max: 01; Name: 'FORMULA.CONVERT'),
  {242} (Min: 01; Max: 01; Name: 'GET.LINK.INFO'),
  {243} (Min: 01; Max: 01; Name: 'TEXT.BOX'),
  {244} (Min: 01; Max: 01; Name: 'INFO'),
  {245} (Min: 01; Max: 01; Name: 'GROUP'),
  {246} (Min: 01; Max: 01; Name: 'GET.OBJECT'),
  {247} (Min: 04; Max: 05; Name: 'DB'),
  {248} (Min: 01; Max: 01; Name: 'PAUSE'),
  {249} (Min: 01; Max: 01; Name: '249'),
  {250} (Min: 01; Max: 01; Name: '250'),
  {251} (Min: 01; Max: 01; Name: 'RESUME'),
  {252} (Min: 02; Max: 02; Name: 'FREQUENCY'),
  {253} (Min: 01; Max: 01; Name: 'ADD.TOOLBAR'),
  {254} (Min: 01; Max: 01; Name: 'DELETE.TOOLBAR'),
  {255} (Min: 01; Max: 01; Name: '255'),
  {256} (Min: 01; Max: 01; Name: 'RESET.TOOLBAR'),
  {257} (Min: 01; Max: 01; Name: 'EVALUATE'),
  {258} (Min: 01; Max: 01; Name: 'GET.TOOLBAR'),
  {259} (Min: 01; Max: 01; Name: 'GET.TOOL'),
  {260} (Min: 01; Max: 01; Name: 'SPELLING.CHECK'),
  {261} (Min: 01; Max: 01; Name: 'ERROR.TYPE'),
  {262} (Min: 01; Max: 01; Name: 'APP.TITLE'),
  {263} (Min: 01; Max: 01; Name: 'WINDOW.TITLE'),
  {264} (Min: 01; Max: 01; Name: 'SAVE.TOOLBAR'),
  {265} (Min: 01; Max: 01; Name: 'ENABLE.TOOL'),
  {266} (Min: 01; Max: 01; Name: 'PRESS.TOOL'),
  {267} (Min: 01; Max: 01; Name: 'REGISTER.ID'),
  {268} (Min: 01; Max: 01; Name: 'GET.WORKBOOK'),
  {269} (Min: 01; Max: 99; Name: 'AVEDEV'),
  {270} (Min: 03; Max: 05; Name: 'BETADIST'),
  {271} (Min: 01; Max: 01; Name: 'GAMMALN'),
  {272} (Min: 01; Max: 01; Name: 'BETAINV'),
  {273} (Min: 03; Max: 05; Name: 'BINOMDIST'),
  {274} (Min: 01; Max: 01; Name: 'CHIDIST'),
  {275} (Min: 02; Max: 02; Name: 'CHIINV'),
  {276} (Min: 02; Max: 02; Name: 'COMBIN'),
  {277} (Min: 03; Max: 03; Name: 'CONFIDENCE'),
  {278} (Min: 03; Max: 03; Name: 'CRITBINOM'),
  {279} (Min: 01; Max: 01; Name: 'EVEN'),
  {280} (Min: 03; Max: 03; Name: 'EXPONDIST'),
  {281} (Min: 03; Max: 03; Name: 'FDIST'),
  {282} (Min: 03; Max: 03; Name: 'FINV'),
  {283} (Min: 01; Max: 01; Name: 'FISHER'),
  {284} (Min: 01; Max: 01; Name: 'FISHERINV'),
  {285} (Min: 02; Max: 02; Name: 'FLOOR'),
  {286} (Min: 04; Max: 04; Name: 'GAMMADIST'),
  {287} (Min: 03; Max: 03; Name: 'GAMMAINV'),
  {288} (Min: 02; Max: 02; Name: 'CEILING'),
  {289} (Min: 04; Max: 04; Name: 'HYPGEOMDIST'),
  {290} (Min: 03; Max: 03; Name: 'LOGNORMDIST'),
  {291} (Min: 03; Max: 03; Name: 'LOGINV'),
  {292} (Min: 03; Max: 03; Name: 'NEGBINOMDIST'),
  {293} (Min: 04; Max: 04; Name: 'NORMDIST'),
  {294} (Min: 01; Max: 01; Name: 'NORMSDIST'),
  {295} (Min: 03; Max: 03; Name: 'NORMINV'),
  {296} (Min: 01; Max: 01; Name: 'NORMSINV'),
  {297} (Min: 01; Max: 01; Name: 'STANDARDIZE'),
  {298} (Min: 01; Max: 01; Name: 'ODD'),
  {299} (Min: 02; Max: 02; Name: 'PERMUT'),
  {300} (Min: 03; Max: 03; Name: 'POISSON'),
  {301} (Min: 03; Max: 03; Name: 'TDIST'),
  {302} (Min: 04; Max: 04; Name: 'WEIBULL'),
  {303} (Min: 02; Max: 02; Name: 'SUMXMY2'),
  {304} (Min: 02; Max: 02; Name: 'SUMX2MY2'),
  {305} (Min: 02; Max: 02; Name: 'SUMX2PY2'),
  {306} (Min: 02; Max: 02; Name: 'CHITEST'),
  {307} (Min: 02; Max: 02; Name: 'CORREL'),
  {308} (Min: 02; Max: 02; Name: 'COVAR'),
  {309} (Min: 03; Max: 03; Name: 'FORECAST'),
  {310} (Min: 02; Max: 02; Name: 'FTEST'),
  {311} (Min: 02; Max: 02; Name: 'INTERCEPT'),
  {312} (Min: 02; Max: 02; Name: 'PEARSON'),
  {313} (Min: 02; Max: 02; Name: 'RSQ'),
  {314} (Min: 02; Max: 02; Name: 'STEYX'),
  {315} (Min: 02; Max: 02; Name: 'SLOPE'),
  {316} (Min: 04; Max: 04; Name: 'TTEST'),
  {317} (Min: 03; Max: 04; Name: 'PROB'),
  {318} (Min: 01; Max: 99; Name: 'DEVSQ'),
  {319} (Min: 01; Max: 99; Name: 'GEOMEAN'),
  {320} (Min: 01; Max: 99; Name: 'HARMEAN'),
  {321} (Min: 01; Max: 99; Name: 'SUMSQ'),
  {322} (Min: 01; Max: 99; Name: 'KURT'),
  {323} (Min: 01; Max: 99; Name: 'SKEW'),
  {324} (Min: 02; Max: 03; Name: 'ZTEST'),
  {325} (Min: 02; Max: 02; Name: 'LARGE'),
  {326} (Min: 02; Max: 02; Name: 'SMALL'),
  {327} (Min: 02; Max: 02; Name: 'QUARTILE'),
  {328} (Min: 02; Max: 02; Name: 'PERCENTILE'),
  {329} (Min: 02; Max: 03; Name: 'PERCENTRANK'),
  {330} (Min: 01; Max: 99; Name: 'MODE'),
  {331} (Min: 02; Max: 02; Name: 'TRIMMEAN'),
  {332} (Min: 02; Max: 02; Name: 'TINV'),
  {333} (Min: 01; Max: 01; Name: '333'),
  {334} (Min: 01; Max: 01; Name: 'MOVIE.COMMAND'),
  {335} (Min: 01; Max: 01; Name: 'GET.MOVIE'),
  {336} (Min: 01; Max: 99; Name: 'CONCATENATE'),
  {337} (Min: 02; Max: 02; Name: 'POWER'),
  {338} (Min: 01; Max: 01; Name: 'PIVOT.ADD.DATA'),
  {339} (Min: 01; Max: 01; Name: 'GET.PIVOT.TABLE'),
  {340} (Min: 01; Max: 01; Name: 'GET.PIVOT.FIELD'),
  {341} (Min: 01; Max: 01; Name: 'GET.PIVOT.ITEM'),
  {342} (Min: 01; Max: 01; Name: 'RADIANS'),
  {343} (Min: 01; Max: 01; Name: 'DEGREES'),
  {344} (Min: 02; Max: 99; Name: 'SUBTOTAL'),
  {345} (Min: 02; Max: 03; Name: 'SUMIF'),
  {346} (Min: 02; Max: 02; Name: 'COUNTIF'),
  {347} (Min: 01; Max: 01; Name: 'COUNTBLANK'),
  {348} (Min: 01; Max: 01; Name: 'SCENARIO.GET'),
  {349} (Min: 01; Max: 01; Name: 'OPTIONS.LISTS.GET'),
  {350} (Min: 01; Max: 01; Name: 'ISPMT'),
  {351} (Min: 01; Max: 01; Name: 'DATEDIF'),
  {352} (Min: 01; Max: 01; Name: 'DATESTRING'),
  {353} (Min: 01; Max: 01; Name: 'NUMBERSTRING'),
  {354} (Min: 01; Max: 02; Name: 'ROMAN'),
  {355} (Min: 01; Max: 01; Name: 'OPEN.DIALOG'),
  {356} (Min: 01; Max: 01; Name: 'SAVE.DIALOG'),
  {357} (Min: 01; Max: 01; Name: 'VIEW.GET'),
  {358} (Min: 02; Max: 99; Name: 'GETPIVOTDATA'),
  {359} (Min: 01; Max: 02; Name: 'HYPERLINK'),
  {360} (Min: 01; Max: 01; Name: 'PHONETIC'),
  {361} (Min: 01; Max: 99; Name: 'AVERAGEA'),
  {362} (Min: 01; Max: 99; Name: 'MAXA'),
  {363} (Min: 01; Max: 99; Name: 'MINA'),
  {364} (Min: 01; Max: 99; Name: 'STDEVPA'),
  {365} (Min: 01; Max: 99; Name: 'VARPA'),
  {366} (Min: 01; Max: 99; Name: 'STDEVA'),
  {367} (Min: 01; Max: 99; Name: 'VARA'));

  XF_DEFAULT: array[0..15] of TBIFF_XF = (
    (FontIndex: 0; FormatIndex: 0; Data1: $FFF5; Data2: $0020; Data3: $0000;
     Data4: $0000; Data5: $0000; Data6: $00000000; Data7: $20C0),
    (FontIndex: 1; FormatIndex: 0; Data1: $FFF5; Data2: $0020; Data3: $F400;
     Data4: $0000; Data5: $0000; Data6: $00000000; Data7: $20C0),
    (FontIndex: 1; FormatIndex: 0; Data1: $FFF5; Data2: $0020; Data3: $F400;
     Data4: $0000; Data5: $0000; Data6: $00000000; Data7: $20C0),
    (FontIndex: 2; FormatIndex: 0; Data1: $FFF5; Data2: $0020; Data3: $F400;
     Data4: $0000; Data5: $0000; Data6: $00000000; Data7: $20C0),
    (FontIndex: 2; FormatIndex: 0; Data1: $FFF5; Data2: $0020; Data3: $F400;
     Data4: $0000; Data5: $0000; Data6: $00000000; Data7: $20C0),
    (FontIndex: 0; FormatIndex: 0; Data1: $FFF5; Data2: $0020; Data3: $F400;
     Data4: $0000; Data5: $0000; Data6: $00000000; Data7: $20C0),
    (FontIndex: 0; FormatIndex: 0; Data1: $FFF5; Data2: $0020; Data3: $F400;
     Data4: $0000; Data5: $0000; Data6: $00000000; Data7: $20C0),
    (FontIndex: 0; FormatIndex: 0; Data1: $FFF5; Data2: $0020; Data3: $F400;
     Data4: $0000; Data5: $0000; Data6: $00000000; Data7: $20C0),
    (FontIndex: 0; FormatIndex: 0; Data1: $FFF5; Data2: $0020; Data3: $F400;
     Data4: $0000; Data5: $0000; Data6: $00000000; Data7: $20C0),
    (FontIndex: 0; FormatIndex: 0; Data1: $FFF5; Data2: $0020; Data3: $F400;
     Data4: $0000; Data5: $0000; Data6: $00000000; Data7: $20C0),
    (FontIndex: 0; FormatIndex: 0; Data1: $FFF5; Data2: $0020; Data3: $F400;
     Data4: $0000; Data5: $0000; Data6: $00000000; Data7: $20C0),
    (FontIndex: 0; FormatIndex: 0; Data1: $FFF5; Data2: $0020; Data3: $F400;
     Data4: $0000; Data5: $0000; Data6: $00000000; Data7: $20C0),
    (FontIndex: 0; FormatIndex: 0; Data1: $FFF5; Data2: $0020; Data3: $F400;
     Data4: $0000; Data5: $0000; Data6: $00000000; Data7: $20C0),
    (FontIndex: 0; FormatIndex: 0; Data1: $FFF5; Data2: $0020; Data3: $F400;
     Data4: $0000; Data5: $0000; Data6: $00000000; Data7: $20C0),
    (FontIndex: 0; FormatIndex: 0; Data1: $FFF5; Data2: $0020; Data3: $F400;
     Data4: $0000; Data5: $0000; Data6: $00000000; Data7: $20C0),
    (FontIndex: 1; FormatIndex: 0; Data1: $0001; Data2: $0020; Data3: $0000;
     Data4: $0000; Data5: $0000; Data6: $00000000; Data7: $20C0));

  STYLE_DEFAULT: array[0..5] of TBIFF_STYLE = (
    (Index: $8010; BuiltIn: $03; Level: $FF),
    (Index: $8011; BuiltIn: $06; Level: $FF),
    (Index: $8012; BuiltIn: $04; Level: $FF),
    (Index: $8013; BuiltIn: $07; Level: $FF),
    (Index: $8000; BuiltIn: $00; Level: $FF),
    (Index: $8014; BuiltIn: $05; Level: $FF));

implementation

end.
