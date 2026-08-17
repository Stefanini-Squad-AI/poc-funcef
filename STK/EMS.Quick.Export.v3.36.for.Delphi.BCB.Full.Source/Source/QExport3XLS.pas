unit QExport3XLS;

{$I VerCtrl.inc}

{$IFDEF VCL6}
  {$WARN UNIT_PLATFORM OFF}
{$ENDIF}

interface

uses Classes, SysUtils, QExport3, IniFiles, DB, QExport3XLSFile, 
  QExport3XLSCommon, QExport3CustomSource
     {$IFDEF VCL6}, Variants{$ENDIF}
     {$IFDEF WIN32}
       {$IFNDEF NOGUI}
         ,Graphics, ComCtrls, DBGrids, Grids
       {$ELSE}
         , QExportGraphics
       {$ENDIF}
       {$IFDEF OLE_STREAM}, ActiveX, ComObj{$ENDIF}
     {$ENDIF}
     {$IFDEF LINUX}
       {$IFNDEF NOGUI}
         , QGraphics, QComCtrls, QDBGrids, QGrids
       {$ELSE}
         , QExportGraphics
       {$ENDIF}
     {$ENDIF};

type
  TxlsColor = (clrBlack,   clrBrown,       clrOliveGreen,  clrDarkGreen,
               clrDarkTeal,       clrDarkBlue,  clrIndigo,   clrGray80Percent,
               clrDarkRed, clrOrange,      clrDarkYellow,  clrGreen,
               clrTeal,           clrBlue,      clrBlueGray, clrGray50Percent,
               clrRed,     clrLightOrange, clrLime,        clrSeaGreen,
               clrAqua,           clrLightBlue, clrViolet,   clrGray40Percent,
               clrPink,    clrGold,        clrYellow,      clrBrightGreen,
               clrTurquoise,      clrSkyBlue,   clrPlum,     clrGray25Percent,
               clrRose,    clrTan,         clrLightYellow, clrLihtGreen,
               clrLightTurquoise, clrPaleBlue,  clrLavender, clrWhite,
               clrColor1, clrColor2, clrColor3, clrColor4,
               clrColor5, clrColor6, clrColor7, clrColor8,
               clrColor9, clrColor10, clrColor11, clrColor12,
               clrColor13, clrColor14, clrColor15, clrColor16);


  TxlsFontScript = (fscNone, fscSuperscript, fscSubscript);

  TxlsFontStyle  = (xfsBold, xfsItalic, xfsStrikeOut);

  TxlsFontStyles = set of TxlsFontStyle;

  TxlsFontUnderline = (fulNone, fulSingle, fulDouble,
    fulSingleAccounting, fulDoubleAccounting);

  TxlsHorizontalAlignment = (halGeneral, halLeft, halCenter, halRight, halFill);

  TxlsVerticalAlignment = (valTop, valCenter, valBottom, valJustify);

  TxlsBorderStyle = (bstNone, bstThin, bstMedium, bstDashed, bstDotted,
                     bstThick, bstDouble, bstHair, bstMediumDashed,
                     bstDashDot, bstMediumDashDot, bstDashDotDot,
                     bstMediumDashDotDot, bstSlantedDashDot);

  TxlsPattern = (ptNone, ptSolid, ptChess, ptWhiteSpots, ptBlackSpots,
                 ptBoldHorizontal, ptBoldVertical, ptBoldDiagRight,
                 ptBoldDiagLeft, ptBoldChess, ptRingMail, ptThinGorizontal,
                 ptThinVertical, ptThinDiagLeft, ptThinDiagRight, ptCells,
                 ptCrissCross, ptThinSpots, ptThinThinSpots);

  {TxlsNotePattern = (npt5Percents, npt10Percents, npt20Percents, npt25Percents,
                     npt30Percents, npt40Percents, npt50Percents, npt60Percents,
                     npt70Percents, npt75Percents, npt80Percents, npt90Percents,
                     nptLightDownwardDiagonal, nptLightUpwardDiagonal,
                     nptDarkDownwardDiagonal, nptDarkUpwardDiagonal,
                     nptWideDownwardDiagonal, nptWideUpwardDiagonal,
                     nptLightVertical, nptLightHorizontal, nptNarrowVertical,
                     nptNarrowHorizontal, nptDarkVertical, nptDarkHorizontal,
                     nptDashedDownwardDiagonal, nptDashedUpwardDiagonal,
                     nptDashedHorizontal, nptDashedVertical, nptSmallConfetti,
                     nptLargeConfetti, nptZigZag, nptWave, nptDiagonalBrick,
                     nptHorizontalBrick, nptWeave, nptPlaid, nptDivot,
                     nptDottedGrid, nptDottedDiamond, nptShingle, nptTrellis,
                     nptSphere, nptSmallGrid, nptLargeGrid,
                     nptSmallCheckerBoard, nptLargeCheckerBoard,
                     nptOutlinedDiamond, nptSolidDiamond);}

  TxlsNoteGradient = (ngrHorizontal, ngrVertical, ngrDiagonalUp,
    ngrDiagonalDown, ngrFromCorner, ngrFromCenter);

  TxlsNoteFillType = (nftSolid, nftGradient{, nftPattern});

  TxlsAggregate = (aggNone, aggSum, aggAvg, aggMin, aggMax);

  TxlsHyperlinkStyle = (hlsURL, hlsLocalFile{, hlsUNC, hlsCurrentWorkbook});

  TxlsPercent = 0..100;
  
  TxlsOrientation = (xrtNoRotation, xlrTopToBottom, xlrCounterClockWise,
    xlrClockWise);

  TxlsChartStyle = (xcsColumn, xcsColumn3d, xcsBar, xcsBar3d, xcsLine,
                    xcsLineMark, xcsLine3d, xcsPie, xcsPie3d, xcsArea,
                    xcsArea3d, xcsSurface, xcsSurface3d, xcsRadar,
                    xcsRadarArea);

  TxlsChartLegendPlacement = (clpBottom, clpCorner, clpTop, clpRight, clpLeft);

  TxlsBorders = class;
  TxlsFill = class;
  TxlsAlignment = class;

  TQExport3XLS = class;

  TxlsFont = class(TPersistent)
  private
    FSize: integer;
    FStyle: TxlsFontStyles;
    FColor: TxlsColor;
    FScript: TxlsFontScript;
    FUnderline: TxlsFontUnderline;
    FCharset: TFontCharset;
    FName: WideString;
    FFontIndex: word;
    function IsName: Boolean;
    procedure AssignToBinary(Font: TbiffFont);
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    procedure AssignTo(Dest: TPersistent); override;
    function IsEqual(Font: TxlsFont): boolean;
    procedure SetDefault;
  published
    property Size: integer read FSize write FSize default 10;
    property Style: TxlsFontStyles read FStyle write FStyle default [];
    property Color: TxlsColor read FColor write FColor default clrBlack;
    property Script: TxlsFontScript read FScript write FScript default fscNone;
    property Underline: TxlsFontUnderline read FUnderline
      write FUnderline default fulNone;
    property Charset: TFontCharset read FCharset write FCharset
      default {$IFDEF WIN32}1{$ENDIF}
              {$IFDEF LINUX}{$IFNDEF NOGUI}fcsAnyCharSet{$ELSE}1{$ENDIF}{$ENDIF};
    property Name: WideString read FName write FName stored IsName;
  end;

  TxlsFontList = class(TList)
  private
    function Get(Index: integer): TxlsFont;
    procedure Put(Index: integer; Value: TxlsFont);
  public
    destructor Destroy; override;
    function Add(Item: TxlsFont): integer;
    function FontIndexByFont(Font: TxlsFont): integer;
    function ListIndexByFont(Font: TxlsFont): integer;

    property Items[Index: integer]: TxlsFont read Get write Put; default;
  end;

  TxlsTextFormat = class
  private
    FFormatIndex: word;
    FFormatString: WideString;      
  public
    constructor Create;
    function IsEqual(TextFormat: TxlsTextFormat): boolean;

    property FormatIndex: word read FFormatIndex write FFormatIndex;
    property FormatString: WideString read FFormatString write FFormatString;
  end;

  TxlsTextFormatList = class(TList)
  private
    function Get(Index: integer): TxlsTextFormat;
    procedure Put(Index: integer; Value: TxlsTextFormat);
  public
    destructor Destroy; override;
    function Add(Item: TxlsTextFormat): integer;
    function FormatIndexByString(const FormatString: string): integer;
    function ListIndexByString(const FormatString: string): integer;

    property Items[Index: integer]: TxlsTextFormat read Get write Put; default;
  end;

  TxlsXFormat = class
  private
    FFormatIndex: word;
    FFont: TxlsFont;
    FTextFormat: TxlsTextFormat;
    FBorders: TxlsBorders;
    FFill: TxlsFill;
    FAlignment: TxlsAlignment;
    FWrap: boolean;
    procedure SetBorders(const Value: TxlsBorders);
    procedure SetFill(const Value: TxlsFill);
    procedure SetAlignment(const Value: TxlsAlignment);
    procedure AssignToBinary(XF: TbiffXF);
  public
    constructor Create(AFont: TxlsFont; ATextFormat: TxlsTextFormat);
    destructor Destroy; override;
    function IsEqual(XFormat: TxlsXFormat): boolean;

    property FormatIndex: word read FFormatIndex write FFormatIndex;
    property Font: TxlsFont read FFont write FFont;
    property TextFormat: TxlsTextFormat read FTextFormat write FTextFormat;
    property Borders: TxlsBorders read FBorders write SetBorders;
    property Fill: TxlsFill read FFill write SetFill;
    property Alignment: TxlsAlignment read FAlignment write SetAlignment;
    property Wrap: boolean read FWrap write FWrap default false;
  end;

  TxlsXFormatList = class(TList)
  private
    function Get(Index: integer): TxlsXFormat;
    procedure Put(Index: integer; Value: TxlsXFormat);
  public
    destructor Destroy; override;
    function Add(Item: TxlsXFormat): integer;
    function FormatIndexByFormat(XFormat: TxlsXFormat): integer;
    function ListIndexByFormatIndex(Index: word): integer;
    function FormatByFormatIndex(Index: word): TxlsXFormat;

    property Items[Index: integer]: TxlsXFormat read Get write Put; default;
  end;

  TxlsXFormatField = class
  private
    FSheetIndex: integer;
    FFieldName: string;
    FXFormat: TxlsXFormat;
  public
    property SheetIndex: integer read FSheetIndex write FSheetIndex;
    property FieldName: string read FFieldName write FFieldName;
    property XFormat: TxlsXFormat read FXFormat write FXFormat;
  end;

  TxlsXFormatFieldList = class(TList)
  private
    function Get(Index: integer): TxlsXFormatField;
    procedure Put(Index: integer; Value: TxlsXFormatField);
  public
    destructor Destroy; override;
    function Add(Item: TxlsXFormatField): integer;
    function FormatIndexByFieldName(SheetIndex: integer; const FieldName: string): integer;
    function ListIndexByFieldName(SheetIndex: integer; const FieldName: string): integer;

    property Items[Index: integer]: TxlsXFormatField read Get write Put; default;
  end;

  TxlsXFormatColRow = class
  private
    FSheetIndex: integer;
    FNumber: integer;
    FXFormat: TxlsXFormat;
  public
    property SheetIndex: integer read FSheetIndex write FSheetIndex;
    property Number: integer read FNumber write FNumber;
    property XFormat: TxlsXFormat read FXFormat write FXFormat;
  end;

  TxlsXFormatColRowList = class(TList)
  private
    function Get(Index: integer): TxlsXFormatColRow;
    procedure Put(Index: integer; Value: TxlsXFormatColRow);
  public
    destructor Destroy; override;
    function Add(Item: TxlsXFormatColRow): integer;
    function IndexByXF(XF: word): integer;
    function XFIndexByNumber(SheetIndex, Number: integer): word;

    property Items[Index: integer]: TxlsXFormatColRow read Get write Put; default;
  end;

  TxlsBorder = class(TPersistent)
  private
    FStyle: TxlsBorderStyle;
    FColor: TxlsColor;
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    function IsEqual(Border: TxlsBorder): boolean;
    procedure SetDefault;
  published
    property Style: TxlsBorderStyle read FStyle write FStyle default bstNone;
    property Color: TxlsColor read FColor write FColor default clrBlack;
  end;

  TxlsBorders = class(TPersistent)
  private
    FLeft: TxlsBorder;
    FRight: TxlsBorder;
    FTop: TxlsBorder;
    FBottom: TxlsBorder;
    FDiagDown: TxlsBorder;
    FDiagUp: TxlsBorder;
    procedure SetLeft(const Value: TxlsBorder);
    procedure SetRight(const Value: TxlsBorder);
    procedure SetTop(const Value: TxlsBorder);
    procedure SetBottom(const Value: TxlsBorder);
    procedure SetDiagDown(const Value: TxlsBorder);
    procedure SetDiagUp(const Value: TxlsBorder);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function IsEqual(Borders: TxlsBorders): boolean;
    procedure SetDefault;
  published
    property Left: TxlsBorder read FLeft write SetLeft;
    property Right: TxlsBorder read FRight write SetRight;
    property Top: TxlsBorder read FTop write SetTop;
    property Bottom: TxlsBorder read FBottom write SetBottom;
    property DiagDown: TxlsBorder read FDiagDown write SetDiagDown;
    property DiagUp: TxlsBorder read FDiagUp write SetDiagUp;
  end;

  TxlsFill = class(Tpersistent)
  private
    FBackground: TxlsColor;
    FPattern: TxlsPattern;
    FForeground: TxlsColor;
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    function IsEqual(Fill: TxlsFill): boolean;
    procedure SetDefault;
  published
    property Background: TxlsColor read FBackground write FBackground default clrWhite;
    property Pattern: TxlsPattern read FPattern write FPattern default ptNone;
    property Foreground: TxlsColor read FForeground write FForeground default clrBlack;
  end;

  TxlsAlignment = class(TPersistent)
  private
    FHorizontal: TxlsHorizontalAlignment;
    FVertical: TxlsVerticalAlignment;
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    function IsEqual(Alignment: TxlsAlignment): boolean;
    procedure SetDefault;
  published
    property Horizontal: TxlsHorizontalAlignment read FHorizontal write FHorizontal default halGeneral;
    property Vertical: TxlsVerticalAlignment read FVertical write FVertical default valBottom;
  end;

  TxlsItemType = (itFormat, itFieldFormat, itNoteFormat, itHyperlink,
    itNote, itChart, itSeries, itPicture, itImage, itGraphic, itCell,
    itMergedCells);

  TxlsCustomItem = class(TCollectionItem)
  private
    FTag: integer;
  protected
    function GetItemType: TxlsItemType; virtual; abstract;
  public
    constructor Create(Collection: TCollection); override;
    property ItemType: TxlsItemType read GetItemType;
    property Tag: integer read FTag write FTag;
  end;

  TxlsFormat = class(TxlsCustomItem)
  private
    FFont: TxlsFont;
    FBorders: TxlsBorders;
    FFill: TxlsFill;
    FAlignment: TxlsAlignment;
    FWrap: boolean;
    FFieldName: string;
    procedure SetFont(Value: TxlsFont);
    procedure SetBorders(const Value: TxlsBorders);
    procedure SetFill(const Value: TxlsFill);
    procedure SetAlignment(const Value: TxlsAlignment);
    function IsDefault: boolean;
  protected
    function GetItemType: TxlsItemType; override;
    function  GetDisplayName: string; override;
    procedure LoadFromTxlsXFormat(XFormat: TxlsXFormat);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function IsEqual(Format: TxlsFormat): boolean;
    procedure SetDefault; virtual;
    procedure SaveToIniFile(IniFile: TIniFile; const Section: string); virtual;
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string); virtual;
  published
    property Font: TxlsFont read FFont write SetFont;
    property Borders: TxlsBorders read FBorders write SetBorders;
    property Fill: TxlsFill read FFill write SetFill;
    property Alignment: TxlsAlignment read FAlignment write SetAlignment;
    property Wrap: boolean read FWrap write FWrap default false;
    property FieldName: string read FFieldName write FFieldName;
  end;

  TxlsFormats = class(TCollection)
  private
    FHolder: TPersistent;
  protected
    function GetOwner: TPersistent; override;
    function GetItem(Index: integer): TxlsFormat;
    procedure SetItem(Index: integer; Value: TxlsFormat);
  public
    constructor Create(Holder: TPersistent);
    function Add: TxlsFormat;
    function IsEqual(Formats: TxlsFormats): boolean;
    procedure SaveToIniFile(IniFile: TIniFile; const SectionPrefix: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const SectionPrefix: string); 

    property Holder: TPersistent read FHolder;
    property Items[Index: integer]: TxlsFormat read GetItem
      write SetItem; default;
  end;

  TxlsFieldFormat = class(TxlsFormat)
  private
    FWidth: integer;
    FAggregate: TxlsAggregate;
  protected
    function GetItemType: TxlsItemType; override;
    function  GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
    procedure SetDefault; override;
    procedure SaveToIniFile(IniFile: TIniFile; const Section: string); override;
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string); override;
  published
    property Width: integer read FWidth write FWidth default 0;
    property Aggregate: TxlsAggregate read FAggregate
      write FAggregate default aggNone;
  end;

  TxlsFieldFormats = class(TCollection)
  private
    FHolder: TPersistent;
  protected
    function GetOwner: TPersistent; override;
    function GetItem(Index: integer): TxlsFieldFormat;
    procedure SetItem(Index: integer; Value: TxlsFieldFormat);
  public
    constructor Create(Holder: TPersistent);
    function Add: TxlsFieldFormat;
    function IndexByName(const FieldName: string): integer;

    property Holder: TPersistent read FHolder;
    property Items[Index: integer]: TxlsFieldFormat read GetItem
      write SetItem; default;
  end;

  TxlsNoteFormat = class(TxlsCustomItem)
  private
    FAlignment: TxlsAlignment;
    FBackgroundColor: TColor;
    FForegroundColor: TColor;
    FFillType: TxlsNoteFillType;
    FFont: TxlsFont;
    FTransparency: TxlsPercent;
    FOrientation: TxlsOrientation;
    //FPattern: TxlsNotePattern;
    FGradient: TxlsNoteGradient;
    procedure SetAlignment(const Value: TxlsAlignment);
    procedure SetFont(const Value: TxlsFont);
  protected
    function GetItemType: TxlsItemType; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure SetDefault;
    procedure SaveToIniFile(IniFile: TIniFile; const Section: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string);
  published
    property Alignment: TxlsAlignment read FAlignment write SetAlignment;
    property BackgroundColor: TColor read FBackgroundColor
      write FBackgroundColor default $00E1FFFF;
    property ForegroundColor: TColor read FForegroundColor
      write FForegroundColor default $00E1FFFF;
    property FillType: TxlsNoteFillType read FFillType
      write FFillType default nftSolid;
    property Font: TxlsFont read FFont write SetFont;
    property Transparency: TxlsPercent read FTransparency
      write FTransparency default 0;
    property Orientation: TxlsOrientation read FOrientation
      write FOrientation default xrtNoRotation;
    //property Pattern: TxlsNotePattern read FPattern
      //write FPattern default npt5Percents;
    property Gradient: TxlsNoteGradient read FGradient
      write FGradient default ngrHorizontal;
  end;

  TxlsHyperlink = class(TxlsCustomItem)
  private
    FCol: word;
    FFormat: TxlsFormat;
    FHolder: TPersistent;
    FRow: word;
    FTarget: WideString;
    FTitle: WideString;
    FScreenTip: WideString;
    FStyle: TxlsHyperlinkStyle;
    function GetSize: integer;
    function GetShortTarget: string;
    procedure SetFormat(const Value: TxlsFormat);
    function IsValid: boolean;
  protected
    function GetItemType: TxlsItemType; override;
    function  GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure SaveToIniFile(IniFile: TIniFile; const Section: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string);

    property Size: integer read GetSize;
    property ShortTarget: string read GetShortTarget;
  published
    property Col: word read FCol
      write FCol default 0; // 1 based
    property Format: TxlsFormat read FFormat write SetFormat;
    property Row: word read FRow
      write FRow default 0; // 1 based
    property Style: TxlsHyperlinkStyle read FStyle
      write FStyle default hlsURL;
    property Target: WideString read FTarget write FTarget;
    property Title: WideString read FTitle write FTitle;
    property ScreenTip: WideString read FScreenTip write FScreenTip;
  end;

  TxlsHyperlinks = class(TCollection)
  private
    FHolder: TPersistent;
  protected
    function GetOwner: TPersistent; override;
    function GetItem(Index: integer): TxlsHyperlink;
    procedure SetItem(Index: integer; Value: TxlsHyperlink);
  public
    constructor Create(Holder: TPersistent);
    function Add: TxlsHyperlink;

    property Holder: TPersistent read FHolder;
    property Items[Index: integer]: TxlsHyperlink read GetItem
      write SetItem; default;
  end;

  TxlsNote = class(TxlsCustomItem)
  private
    FHolder: TPersistent;
    FRow: word;
    FCol: word;
    FLines: TStrings;
    FFormat: TxlsNoteFormat;
    procedure SetLines(const Value: TStrings);
    procedure SetFormat(const Value: TxlsNoteFormat);
    function GetAnchor: TMSO_Anchor;
    function IsValid: boolean;
  protected
    function GetItemType: TxlsItemType; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure SaveToIniFile(IniFile: TIniFile; const Section: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string);
  published
    property Row: word read FRow
      write FRow default 0; // 1 based
    property Col: word read FCol
      write FCol default 0; // 1 based
    property Lines: TStrings read FLines write SetLines;
    property Format: TxlsNoteFormat read FFormat write SetFormat;
  end;

  TxlsNotes = class(TCollection)
  private
    FHolder: TPersistent;
  protected
    function GetOwner: TPersistent; override;
    function GetItem(Index: integer): TxlsNote;
    procedure SetItem(Index: integer; Value: TxlsNote);
  public
    constructor Create(Holder: TPersistent);
    function Add: TxlsNote;

    property Holder: TPersistent read FHolder;
    property Items[Index: integer]: TxlsNote read GetItem
      write SetItem; default;
  end;

  TxlsDataRange = class(TPersistent)
  private
    FCol1: byte;
    FCol2: byte;
    FRow1: word;
    FRow2: word;
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    procedure SaveToIniFile(IniFile: TIniFile; const Section: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string);
  published
    property Col1: byte read FCol1 write FCol1 default 0;
    property Col2: byte read FCol2 write FCol2 default 0;
    property Row1: word read FRow1 write FRow1 default 0;
    property Row2: word read FRow2 write FRow2 default 0;
  end;

  TxlsRangeType = (rtColumn, rtCustom);

  TxlsChartSeries = class(TxlsCustomItem)
  private
    FColor: TxlsColor;
    FDataColumn: string;
    FDataRange: TxlsDataRange;
    FDataRangeType: TxlsRangeType;
    FTitle: WideString;
    procedure SetDataRange(const Value: TxlsDataRange);
  protected
    function GetItemType: TxlsItemType; override;
    function  GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure SaveToIniFile(IniFile: TIniFile; const Section: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string);
  published
    property Color: TxlsColor read FColor write FColor default clrAqua;
    property DataColumn: string read FDataColumn write FDataColumn;
    property DataRange: TxlsDataRange read FDataRange write SetDataRange;
    property DataRangeType: TxlsRangeType read FDataRangeType
      write FDataRangeType default rtColumn;
    property Title: WideString read FTitle write FTitle;
  end;

  TxlsChartSeriesList = class(TCollection)
  private
    FHolder: TPersistent;
  protected
    function GetOwner: TPersistent; override;
    function GetItem(Index: integer): TxlsChartSeries;
    procedure SetItem(Index: integer; Value: TxlsChartSeries);
  public
    constructor Create(Holder: TPersistent);
    function Add: TxlsChartSeries;

    property Holder: TPersistent read FHolder;
    property Items[Index: integer]: TxlsChartSeries read GetItem
      write SetItem; default;
  end;

  TxlsChartPositionType = (cptAuto, cptCustom);
  TxlsChartPlacement = (cpBottom, cpRight);

  TxlsChartAutoPosition = class(TPersistent)
  private
    FPlacement: TxlsChartPlacement;
    FHeight: integer;
    FLeft: integer;
    FTop: integer;
    FWidth: integer;
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    procedure SaveToIniFile(IniFile: TIniFile; const Section: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string);
  published
    property Placement: TxlsChartPlacement read FPlacement
      write FPlacement default cpBottom;
    property Height: integer read FHeight write FHeight default 10;
    property Left: integer read FLeft write FLeft default 0;
    property Top: integer read FTop write FTop default 0;
    property Width: integer read FWidth write FWidth default 5;
  end;

  TxlsChartCustomPosition = class(TPersistent)
  private
    FX1: byte;
    FX2: byte;
    FY1: word;
    FY2: word;
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    procedure SaveToIniFile(IniFile: TIniFile; const Section: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string);
  published
    property X1: byte read FX1 write FX1 default 0;
    property X2: byte read FX2 write FX2 default 0;
    property Y1: word read FY1 write FY1 default 0;
    property Y2: word read FY2 write FY2 default 0;
  end;

  TxlsChartPosition = class(TPersistent)
  private
    FAutoPosition: TxlsChartAutoPosition;
    FCustomPosition: TxlsChartCustomPosition;
    FPositionType: TxlsChartPositionType;
    procedure SetAutoPosition(const Value: TxlsChartAutoPosition);
    procedure SetCustomPosition(const Value: TxlsChartCustomPosition);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure SaveToIniFile(IniFile: TIniFile; const Section: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string);
  published
    property AutoPosition: TxlsChartAutoPosition read FAutoPosition
      write SetAutoPosition;
    property CustomPosition: TxlsChartCustomPosition read FCustomPosition
      write SetCustomPosition;
    property PositionType: TxlsChartPositionType read FPositionType
      write FPositionType default cptAuto;
  end;

  TxlsSheet = class;

  TxlsChart = class(TxlsCustomItem)
  private
    FAutoColor: boolean;
    FCategoryLabels: TxlsDataRange;
    FCategoryLabelsType: TxlsRangeType;
    FCategoryLabelsColumn: string;
    FLegendPlacement: TxlsChartLegendPlacement;
    FPosition: TxlsChartPosition;
    FSeries: TxlsChartSeriesList;
    FShowLegend: boolean;
    FStyle: TxlsChartStyle;
    FTitle: WideString;

    procedure SetCategoryLabels(const Value: TxlsDataRange);
    procedure SetPosition(const Value: TxlsChartPosition);
    procedure SetSeries(const Value: TxlsChartSeriesList);
    function GetAnchor: TMSO_Anchor;
    function GetSheet: TxlsSheet;
  protected
    function GetItemType: TxlsItemType; override;
    function  GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure SaveToIniFile(IniFile: TIniFile; const Section: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string);
    property Sheet: TxlsSheet read GetSheet;
  published
    property AutoColor: boolean read FAutoColor write FAutoColor default true;
    property CategoryLabels: TxlsDataRange read FCategoryLabels
      write SetCategoryLabels;
    property CategoryLabelsType: TxlsRangeType read FCategoryLabelsType
      write FCategoryLabelsType default rtColumn;
    property CategoryLabelsColumn: string read FCategoryLabelsColumn
      write FCategoryLabelsColumn;
    property LegendPlacement: TxlsChartLegendPlacement
      read FLegendPlacement write FLegendPlacement default clpRight;
    property Position: TxlsChartPosition read FPosition write SetPosition;
    property Series: TxlsChartSeriesList read FSeries
      write SetSeries;
    property ShowLegend: boolean read FShowLegend
      write FShowLegend default true;
    property Style: TxlsChartStyle read FStyle
      write FStyle default xcsColumn;
    property Title: WideString read FTitle write FTitle;
  end;

  TxlsCharts = class(TCollection)
  private
    FHolder: TPersistent;
  protected
    function GetOwner: TPersistent; override;
    function GetItem(Index: integer): TxlsChart;
    procedure SetItem(Index: integer; Value: TxlsChart);
  public
    constructor Create(Holder: TPersistent);
    function Add: TxlsChart;

    property Holder: TPersistent read FHolder;
    property Items[Index: integer]: TxlsChart read GetItem
      write SetItem; default;
  end;

  TxlsGraphicType = (gtUnknown, gtWMF, gtEMF, gtJPG, gtPNG, gtGIF, gtBMP,
    gtICO);

  TxlsGraphic = class(TxlsCustomItem)
  private
    FFileName: string;
    FHeight: integer;
    FStream: TMemoryStream;
    FWidth: integer;
    FGraphicType: TxlsGraphicType;

    procedure SetFileName(const Value: string);
    procedure SetStream(Value: TMemoryStream);
  protected
    function GetItemType: TxlsItemType; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function IsFileSource: boolean;

    property GraphicType: TxlsGraphicType read FGraphicType;
    property Height: integer read FHeight write FHeight;
    property Stream: TMemoryStream read FStream write SetStream;
    property Width: integer read FWIdth write FWidth;
  published
    property FileName: string read FFileName write SetFileName;
  end;

  TxlsPictures = class;

  TxlsPictureType = (ptUndefined, ptUndefined2, ptWMF, ptEMF, ptPICT, ptJPEG,
    ptPNG, ptDIB);

  TxlsPicture = class(TxlsGraphic)
  private
    FName: string;
    FPictures: TxlsPictures;
    FPictureType: TxlsPictureType;

    function CalcRefCount: integer;
    procedure GetMeasurements(var H, W: integer);
    procedure SetName(const Value: string);
  protected
    function GetItemType: TxlsItemType; override;
    function  GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
    procedure SaveToIniFile(IniFile: TIniFile; const Section: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string);

    property Pictures: TxlsPictures read FPictures;
    property PictureType: TxlsPictureType read FPictureType
      write FPictureType default ptUndefined;
  published
    property Name: string read FName write SetName;
  end;

  TxlsPictures = class(TCollection)
  private
    FHolder: TPersistent;
  protected
    function GetOwner: TPersistent; override;
    function GetItem(Index: integer): TxlsPicture;
    procedure SetItem(Index: integer; Value: TxlsPicture);
  public
    constructor Create(Holder: TPersistent);
    function Add: TxlsPicture;
    function Find(const Name: string; var Index: integer): boolean;

    property Holder: TPersistent read FHolder;
    property Items[Index: integer]: TxlsPicture read GetItem
      write SetItem; default;
  end;

  TxlsImages = class;

  TxlsZoom = 0..1000;

  TxlsImage = class(TxlsCustomItem)
  private
    FCol: word;
    FImages: TxlsImages;
    FPictureName: string;
    FQExportXLS: TQExport3XLS;
    FRow: word;
    FSheet: TxlsSheet;
    FTitle: WideString;
    FZoom: TxlsZoom;

    function GetPictureIndex: integer;
    function GetAnchor: TMSO_Anchor;
  protected
    function GetItemType: TxlsItemType; override;
    function  GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure SaveToIniFile(IniFile: TIniFile; const Section: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string);

    property Images: TxlsImages read FImages;
    property PictureIndex: integer read GetPictureIndex;
  published
    property Col: word read FCol write FCol default 0; // 1 - based
    property PictureName: string read FPictureName write FPictureName;
    property Row: word read FRow write FRow default 0; // 1 - based
    property Title: WideString read FTitle write FTitle;
    property Zoom: TxlsZoom read FZoom write FZoom default 100;
  end;

  TxlsImages = class(TCollection)
  private
    FHolder: TPersistent;
  protected
    function GetOwner: TPersistent; override;
    function GetItem(Index: integer): TxlsImage;
    procedure SetItem(Index: integer; Value: TxlsImage);
  public
    constructor Create(Holder: TPersistent);
    function Add: TxlsImage;
    function Find(const Title: string; var Index: integer): boolean;

    property Holder: TPersistent read FHolder;
    property Items[Index: integer]: TxlsImage read GetItem
      write SetItem; default;
  end;

  TxlsCells = class;

  TxlsCellType = (ctBoolean, ctDateTime, ctNumeric, ctString);

  TxlsCell = class(TxlsCustomItem)
  private
    FCellType: TxlsCellType;
    FCol: word;
    FDateTimeFormat: string;
    FFormat: TxlsFormat;
    FNumericFormat: string;
    FRow: word;
    FBooleanValue: boolean;
    FDateTimeValue: TDateTime;
    FNumericValue: double;
    FStringValue: string;

    function GetIsBoolean: boolean;
    function GetIsDateTime: boolean;
    function GetIsNumeric: boolean;
    function GetIsString: boolean;
    function GetValue: Variant;
    procedure SetFormat(Value: TxlsFormat);
    procedure SetValue(Value: Variant);
  private
    function IsCorrect: boolean;
    function IsCorrectValue(Value: Variant): boolean;
    procedure SetDefaultValue;
  protected
    function  GetDisplayName: string; override;
    function GetItemType: TxlsItemType; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure SaveToIniFile(IniFile: TIniFile; const Section: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string);

    property IsBoolean: boolean read GetIsBoolean;
    property IsDateTime: boolean read GetIsDateTime;
    property IsNumeric: boolean read GetIsNumeric;
    property IsString: boolean read GetIsString;
  published
    property CellType: TxlsCellType read FCellType
      write FCellType default ctString;
    property Col: word read FCol write FCol;
    property DateTimeFormat: string read FDateTimeFormat
      write FDateTimeFormat;
    property Format: TxlsFormat read FFormat write SetFormat;
    property NumericFormat: string read FNumericFormat
      write FNumericFormat;
    property Row: word read FRow write FRow;
    property Value: Variant read GetValue write SetValue;
  end;

  TxlsCells = class(TCollection)
  private
    FHolder: TPersistent;
  protected
    function GetOwner: TPersistent; override;
    function GetItem(Index: integer): TxlsCell;
    procedure SetItem(Index: integer; Value: TxlsCell);
  public
    constructor Create(Holder: TPersistent);
    function Add: TxlsCell;

    property Holder: TPersistent read FHolder;
    property Items[Index: integer]: TxlsCell read GetItem
      write SetItem; default;
  end;

  TxlsMergedCells = class(TxlsCustomItem)
  private
    FFirstCol: word;
    FFirstRow: word;
    FLastCol: word;
    FLastRow: word;
    function IsCorrect: boolean;
  protected
    function  GetDisplayName: string; override;
    function GetItemType: TxlsItemType; override;
  public
    constructor Create(Collection: Tcollection); override;
    procedure Assign(Source: TPersistent); override;
    procedure SaveToIniFile(IniFile: TIniFile; const Section: string);
    procedure LoadFromIniFile(IniFile: TIniFile; const Section: string);
  published
    property FirstCol: word read FFirstCol write FFirstCol;
    property FirstRow: word read FFirstRow write FFirstRow;
    property LastCol: word read FLastCol write FLastCol;
    property LastRow: word read FLastRow write FLastRow;
  end;

  TxlsMergedCellList = class(TCollection)
  private
    FHolder: TPersistent;
  protected
    function GetOwner: TPersistent; override;
    function GetItem(Index: integer): TxlsMergedCells;
    procedure SetItem(Index: integer; Value: TxlsMergedCells);
  public
    constructor Create(Holder: TPersistent);
    function Add: TxlsMergedCells;

    property Holder: TPersistent read FHolder;
    property Items[Index: integer]: TxlsMergedCells read GetItem
      write SetItem; default;
  end;

  TXLSOptions = class(TPersistent)
  private
    FPageFooter: WideString;
    FPageHeader: WideString;
    FSheetTitle: string;

    FHeaderFormat: TxlsFormat;
    FCaptionsFormat: TxlsFormat;
    FDataFormat: TxlsFormat;
    FAggregateFormat: TxlsFormat;
    FFooterFormat: TxlsFormat;
    FHyperlinkFormat: TxlsFormat;
    FNoteFormat: TxlsNoteFormat;

    procedure SetHeaderFormat(const Value: TxlsFormat);
    procedure SetCaptionsFormat(const Value: TxlsFormat);
    procedure SetDataFormat(const Value: TxlsFormat);
    procedure SetAggregateFormat(const Value: TxlsFormat);
    procedure SetFooterFormat(const Value: TxlsFormat);
    procedure SetHyperlinkFormat(const Value: TxlsFormat);
    procedure SetNoteFormat(const Value: TxlsNoteFormat);

    procedure SetSheetTitle(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property PageHeader: WideString read FPageHeader write FPageHeader;
    property PageFooter: WideString read FPageFooter write FPageFooter;
    property SheetTitle: string read FSheetTitle write SetSheetTitle;

    property HeaderFormat: TxlsFormat read FHeaderFormat
      write SetHeaderFormat;
    property CaptionsFormat: TxlsFormat read FCaptionsFormat
      write SetCaptionsFormat;
    property DataFormat: TxlsFormat read FDataFormat
      write SetDataFormat;
    property AggregateFormat: TxlsFormat read FAggregateFormat
      write SetAggregateFormat;
    property FooterFormat: TxlsFormat read FFooterFormat
      write SetFooterFormat;
    property HyperlinkFormat: TxlsFormat read FHyperlinkFormat
      write SetHyperlinkFormat;
    property NoteFormat: TxlsNoteFormat read FNoteFormat
      write SetNoteFormat;
  end;

  TQXLSWriter = class(TQExportWriter)
  private
  public
    {$IFNDEF OLE_STREAM}
    procedure StreamFinalAction;
    {$ENDIF}

  end;

  TxlsColumn = class
  private
    FName: string;
    FCol1: integer;
    FRow1: integer;
    FCol2: integer;
    FRow2: integer;
  public
    constructor Create(const Name: string);
    property Name: string read Fname write FName;
    property Col1: integer read FCol1 write FCol1;
    property Row1: integer read FRow1 write FRow1;
    property Col2: integer read FCol2 write FCol2;
    property Row2: integer read FRow2 write FRow2;
  end;

  TxlsColumnList = class(TList)
  private
    function Get(Index: integer): TxlsColumn;
    procedure Put(Index: integer; Value: TxlsColumn);
  public
    function Add(Item: TxlsColumn): integer;
    procedure Delete(Index: integer);
    procedure CheckCell(const ColName: string; Row, Col: integer);
    function IndexOf(const ColName: string): integer;
    procedure AssignColumnToDataRange(const ColName: string; DataRange: TxlsDataRange);

    property Items[Index: integer]: TxlsColumn read Get write Put; default;
  end;

  TxlsStripType = (ssNone, ssCol, ssRow);

  TxlsExportStage = (esNone, esHeader, esCaption, esData, esAggregate, esFooter);

  TxlsExportedRecordEvent = procedure(Sender: TObject; Sheet,
    RecNo: integer) of object;
  TxlsGetExportTextEvent = procedure(Sender: TObject; Sheet, ColNo: integer;
    var Text: WideString) of object;
  TxlsBeforeExportRowEvent = procedure(Sender: TObject; Sheet: integer;
    Row: TQExportRow; var Accept: boolean) of object;
  TGetHeaderFooterParamsEvent = procedure(Sender: TObject; Sheet, Col,
    Row: integer; Format: TxlsFormat; var S: WideString) of object;
  TGetCaptionParamsEvent = procedure(Sender: TObject; Sheet, Col: integer;
    Format: TxlsFormat; var Caption: string) of object;
  TGetDataParamsEvent = procedure(Sender: TObject; Sheet, Col, Row: integer;
    Format: TxlsFormat; var FormatText: string) of object;
  TGetAggregateParamsEvent = procedure(Sender: TObject; Sheet, Col: integer;
    Format: TxlsFormat; var FormatText, Value: string) of object;
  TxlsExportSheetEvent = procedure(Sender: TObject;
    SheetIndex: integer) of object;


  TxlsSheetEvent = procedure(Sheet: TxlsSheet) of object;

  TxlsSheet = class(TCollectionItem)
  private
    FQExportXLS: TQExport3XLS;
    FColumns: TQExportColumns;
    FExportRow: TQExportRow;
    FCurrentRow: integer;
    FRecordCounter: integer;
    FTotalCols: integer;
    FNeedCheckRowHeight: boolean;

    FAutoCalcColWidth: boolean;
    FTitle: WideString;
    FOptions: TXLSOptions;
    FFieldFormats: TxlsFieldFormats;
    FStripStyles: TxlsFormats;
    FStripType: TxlsStripType;
    FExportSource: TQExportSource;
    FDataSet: TDataSet;
    FCustomSource: TqeCustomSource;
    {$IFNDEF NOGUI}
    FListView: TListView;
    FDBGrid: TDBGrid;
    FStringGrid: TStringGrid;
    {$ENDIF}
    FExportedFields: TStrings;
    FHeaderRows: word;
    FStartDataCol: byte;
    FFooterRows: word;
    FHeader: TStrings;
    FCaptions: TStrings;
    FFooter: TStrings;
    FFormats: TQExportFormats;
    FUserFormats: TStrings;
    FColumnsWidth: TStrings;
    FHyperlinks: TxlsHyperlinks;
    FNotes: TxlsNotes;
    FCharts: TxlsCharts;
    FImages: TxlsImages;
    FCells: TxlsCells;
    FMergedCells: TxlsMergedCellList;
    FBackground: TxlsGraphic;

    FDefRowHeight: double;
    FDefColWidth: integer;


    FAllowCaptions: boolean;
    FGoToFirstRecord: boolean;
    FExportRecCount: integer;
    FSkipRecCount: integer;
    FCurrentRecordOnly: boolean;
    FOnlyVisibleFields: boolean;
    FAutoCalcStrType: boolean;
    FCaptionRow: integer;
    FExported: boolean;
    FTag: integer;

    FColumnList: TxlsColumnList;

    function GetStartDataRow: word;
    function GetWriter: TQXLSWriter;

    function IsTitle: boolean;
    procedure SetOptions(const Value: TXLSOptions);
    procedure SetFieldFormats(const Value: TxlsFieldFormats);
    procedure SetStripStyles(const Value: TxlsFormats);
    procedure SetExportedFields(const Value: TStrings);
    procedure SetHeader(const Value: TStrings);
    procedure SetCaptions(const Value: TStrings);
    procedure SetFooter(const Value: TStrings);
    procedure SetFormats(const Value: TQExportFormats);
    procedure SetUserFormats(const Value: TStrings);
    procedure SetColumnsWidth(const Value: TStrings);
    procedure SetHyperlinks(const Value: TxlsHyperlinks);
    procedure SetNotes(const Value: TxlsNotes);
    procedure SetCharts(const Value: TxlsCharts);
    procedure SetImages(const Value: TxlsImages);
    procedure SetCells(const Value: TxlsCells);
    procedure SetMergedCells(const Value: TxlsMergedCellList);
    procedure SetBackground(const Value: TxlsGraphic);

    function GetExportStage: TxlsExportStage;
    procedure SetExportStage(const Value: TxlsExportStage);

    function IsDefRowHeight: boolean;
  protected
    function GetDisplayName: string; override;

    function AddXF(TextFormat: string; Format: TxlsFormat): word;
    function GetXF(ColIndex: integer): integer;
    procedure AddColumnToFormatList(ColIndex: integer);
    procedure AddStylesToFormatList;
    procedure HeaderFooter(HeaderFooter: TStrings; Limit: word;
      Event: TGetHeaderFooterParamsEvent; Fmt: TxlsFormat);

    procedure InitExport;
    procedure DoHeader;
    procedure DoCaption;
    procedure DoBeforeData;
    procedure FillExportRow;
    procedure DoData;
    procedure DoAggregate;
    procedure DoFooter;

    property Columns: TQExportColumns read FColumns;
    property ExportRow: TQExportRow read FExportRow;
    property Writer: TQXLSWriter read GetWriter;
    property StartDataRow: word read GetStartDataRow;
    property CurrentRow: integer read FCurrentRow;
    property TotalCols: integer read FTotalCols;
    property ExportStage: TxlsExportStage read GetExportStage
      write SetExportStage;
    property RecordCounter: integer read FRecordCounter;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    procedure LoadFromQExportXLS;
    procedure SaveToQExportXLS;

    function AddBooleanCell(Col, Row: word; Value: boolean): TxlsCell;
    function AddDateTimeCell(Col, Row: word; DateTimeFormat: string;
      Value: TDateTime): TxlsCell;
    function AddNumericCell(Col, Row: word; NumericFormat: string;
      Value: double): TxlsCell;
    function AddStringCell(Col, Row: word; const Value: string): TxlsCell;
    function AddMergedCells(FirstRow, LastRow, FirstCol,
      LastCol: word): TxlsMergedCells;

    property QExportXLS: TQExport3XLS read FQExportXLS;
  published
    property AutoCalcColWidth: boolean read FAutoCalcColWidth
      write FAutoCalcColWidth default false;
    property Title: WideString read FTitle
      write FTitle stored IsTitle;
    property Options: TXLSOptions read FOptions
      write SetOptions;
    property FieldFormats: TxlsFieldFormats read FFieldFormats
      write SetFieldFormats;
    property StripStyles: TxlsFormats read FStripStyles
      write SetStripStyles;
    property StripType: TxlsStripType read FStripType
      write FStripType default ssNone;
    property Hyperlinks: TxlsHyperlinks read FHyperlinks
      write SetHyperlinks;
    property Notes: TxlsNotes read FNotes write SetNotes;
    property Charts: TxlsCharts read FCharts write SetCharts;
    property Images: TxlsImages read FImages write SetImages;
    property Cells: TxlsCells read FCells write SetCells;
    property MergedCells: TxlsMergedCellList read FMergedCells
      write SetMergedCells;
    property Background: TxlsGraphic read FBackground write SetBackground;

    property ExportSource: TQExportSource read FExportSource
      write FExportSource default esDataSet;
    property DataSet: TDataSet read FDataSet write FDataSet;
    property CustomSource: TqeCustomSource read FCustomSource
      write FCustomSource;
    {$IFNDEF NOGUI}
    property ListView: TListView read FListView write FListView;
    property DBGrid: TDBGrid read FDBGrid write FDBGrid;
    property StringGrid: TStringGrid read FStringGrid
      write FStringGrid;
    {$ENDIF}

    property HeaderRows: word read FHeaderRows write FHeaderRows default 0;
    property StartDataCol: byte read FStartDataCol
      write FStartDataCol default 0;
    property FooterRows: word read FFooterRows write FFooterRows default 0;

    property ExportedFields: TStrings read FExportedFields
      write SetExportedFields;

    property Header: TStrings read FHeader write SetHeader;
    property Captions: TStrings read FCaptions write SetCaptions;
    property Footer: TStrings read FFooter write SetFooter;
    property Formats: TQExportFormats read FFormats write SetFormats;
    property UserFormats: TStrings read FUserFormats write SetUserFormats;
    property ColumnsWidth: TStrings read FColumnsWidth write SetColumnsWidth;

    property DefRowHeight: double read FDefRowHeight
      write FDefRowHeight stored IsDefRowHeight;
    property DefColWidth: integer read FDefColWidth
      write FDefColWidth default DEF_COL_WIDTH;

    property AllowCaptions: boolean read FAllowCaptions
      write FAllowCaptions default true;
    property GoToFirstRecord: boolean read FGoToFirstRecord
      write FGoToFirstRecord default true;
    property ExportRecCount: integer read FExportRecCount
      write FExportRecCount default 0;
    property SkipRecCount: integer read FSkipRecCount
      write FSkipRecCount default 0;
    property CurrentRecordOnly: boolean read FCurrentRecordOnly
      write FCurrentRecordOnly default false;
    property OnlyVisibleFields: boolean read FOnlyVisibleFields
      write FOnlyVisibleFields default true;
    property AutoCalcStrType: boolean read FAutoCalcStrType
      write FAutoCalcStrType default false;
    property CaptionRow: integer read FCaptionRow
      write FCaptionRow default -1;
    property Exported: boolean read FExported
      write FExported default true;
    property Tag: integer read FTag write FTag default 0;
  end;

  TxlsSheets = class(TCollection)
  private
    FQExportXLS: TQExport3XLS;
  protected
    function GetOwner: TPersistent; override;
    function GetItem(Index: integer): TxlsSheet;
    procedure SetItem(Index: integer; Value: TxlsSheet);
  public
    constructor Create(QExportXLS: TQExport3XLS);
    function Add: TxlsSheet;

    property QExportXLS: TQExport3XLS read FQExportXLS;
    property Items[Index: integer]: TxlsSheet read GetItem
      write SetItem; default;
  end;

  TxlsBoundSheet = class
  private
    FIndex: integer;
    FTitle: WideString;
    FBOFPos: integer;
    FAddPos: integer;
    FDimensionPos: integer;
    FFirstRow: integer;
    FLastRow: integer;
    FFirstCol: integer;
    FLastCol: integer;
  public
    constructor Create;

    property Index: integer read FIndex write FIndex;
    property Title: WideString read FTitle write FTitle;
    property BOFPos: integer read FBOFPos write FBOFPos;
    property AddPos: integer read FAddPos write FAddPos;
    property FirstRow: integer read FFirstRow write FFirstRow;
    property LastRow: integer read FLastRow write FLastRow;
    property FirstCol: integer read FFirstCol write FFirstCol;
    property LastCol: integer read FLastCol write FLastCol;
    property DimensionPos: integer read FDimensionPos write FDimensionPos;
  end;

  TxlsBoundSheetList = class(TList)
  private
    function Get(Index: integer): TxlsBoundSheet;
    procedure Put(Index: integer; Value: TxlsBoundSheet);
  public
    function Add(Item: TxlsBoundSheet): integer;
    procedure CheckCell(SheetIndex, Row, Col: integer);
    procedure Delete(Index: integer);
    function IndexOfSheetIndex(SheetIndex: integer): integer;

    property Items[Index: integer]: TxlsBoundSheet read Get write Put; default;
  end;

  TExtendedColorIndex = 0..15;

  TQExport3XLS = class(TQExport3FormatText)
  private
    FTextFormatList: TxlsTextFormatList;
    FFontList: TxlsFontList;
    FXFormatList: TxlsXFormatList;
    FXFormatFieldList: TxlsXFormatFieldList;
    FXFormatColRowList: TxlsXFormatColRowList;

    FBoundSheetList: TxlsBoundSheetList;
    FSSTStrings: TsstStrings;

    FLastTextFormat: integer;
    FLastFormat: integer;
    FLastFont: integer;

    FGlobalsInset: integer;
    // here we store position of the result stream for writing some global
    // settings (fonts, xfs, styles, boundsheets, country, supbook,
    // externsheets, msodrawing, sst) later

    FColWidthList: TList; // for AutoCalcColWidth
    FColInfoPosition: integer; // for AutoCalcColWidth
    FRowHeightList: TStringList; //for Pictures

    FIStorage: IStorage;
    FIStream: IStream;
    FStream: TStream;
    FBuffer: PByteArray;

    procedure CreateLocalVariables;
    procedure FreeLocalVariables;

    procedure WriteGlobals;
    procedure WriteSheetStart(Sheet: TxlsSheet);
    procedure WriteSheetFinish(Sheet: TxlsSheet);
    procedure WriteGlobalInset;
    procedure WriteNotesChartsAndPictures(Sheet: TxlsSheet);
    procedure RecalculateColWidth(const Str: string; XF, ColIndex: integer);
    procedure CorrectColInfo;
    procedure CheckRowHeight(XF, RowIndex: integer);
  private
    FOptions: TXLSOptions;
    FFieldFormats: TxlsFieldFormats;
    FStripStyles: TxlsFormats;
    FStripType: TxlsStripType;
    FSheets: TxlsSheets;
    FExportStage: TxlsExportStage;
    FHeaderRows: word;
    FStartDataCol: byte;
    FFooterRows: word;
    FTotalCounter: integer;
    FHyperlinks: TxlsHyperlinks;
    FNotes: TxlsNotes;
    FCharts: TxlsCharts;
    FPictures: TxlsPictures;
    FImages: TxlsImages;
    FCells: TxlsCells;
    FMergedCells: TxlsMergedCellList;
    FBackground: TxlsGraphic;

    FOnAdvancedExportedRecord: TxlsExportedRecordEvent;
    FOnAdvancedGetExportText: TxlsGetExportTextEvent;
    FOnAdvancedBeforeExportRow: TxlsBeforeExportRowEvent;
    FOnGetHeaderParams: TGetHeaderFooterParamsEvent;
    FOnGetCaptionParams: TGetCaptionParamsEvent;
    FOnGetBeforeDataParams: TGetHeaderFooterParamsEvent;
    FOnGetDataParams: TGetDataParamsEvent;
    FOnGetAggregateParams: TGetAggregateParamsEvent;
    FOnGetFooterParams: TGetHeaderFooterParamsEvent;

    FOnBeforeExportSheet: TxlsExportSheetEvent;
    FOnAfterExportSheet: TxlsExportSheetEvent;

    procedure SetOptions(const Value: TXLSOptions);
    procedure SetFieldFormats(const Value: TxlsFieldFormats);
    procedure SetStripStyles(const Value: TxlsFormats);
    procedure SetSheets(const Value: TxlsSheets);
    procedure SetHyperlinks(const Value: TxlsHyperlinks);
    procedure SetNotes(const Value: TxlsNotes);
    procedure SetCharts(const Value: TxlsCharts);
    procedure SetPictures(const Value: TxlsPictures);
    procedure SetImages(const Value: TxlsImages);
    procedure SetCells(const Value: TxlsCells);
    procedure SetMergedCells(const Value: TxlsMergedCellList);
    procedure SetBackground(const Value: TxlsGraphic);
  private
    procedure WriteRecord(ID, Length: word);
    procedure WriteWordRecord(ID, Value: word);
    procedure WriteBOF(BOFType: word);
    procedure WriteWriteAccess;
    procedure WriteWindow1;
    procedure WriteEOF;
    procedure WriteDelta;
    procedure WriteGuts;
    procedure WriteDefColWidth(Width: word);
    procedure WriteDefRowHeight(Height: double);
    procedure WriteCatchword(ID: word; const Value: WideString);
    procedure WriteColInfo(SheetIndex: integer);
    procedure WriteLabelSST(Row, Col, XF: word; const Str: WideString);
    procedure WriteBoolErr(Row, Col, XF: word; Value: boolean);
    procedure WriteNumber(Row, Col, XF: word; Value: double);
    procedure WriteBlank(Row, Col, XF: word);
    procedure WriteAggregate(Row, Col, StartRow, FinishRow: word;
      AggregateType: TxlsAggregate; XF: word);
    procedure WriteMergedCells(MergedCells: TxlsMergedCellList);
    procedure WriteWindow2;
    procedure WriteDimensions(FirstRow, LastRow: integer; FirstCol,
      LastCol: word);
    procedure WriteSelection;
    procedure WriteHyperlink(Hyperlink: TxlsHyperlink);
    procedure WriteNoteObj(ObjectID: word);
    procedure WriteTXO(TextLength: word; NoteFormat: TxlsNoteFormat);
    procedure WriteContinue1(const NoteText: WideString);
    procedure WriteTXORUN(TextLength: word; Font: TxlsFont);
    procedure WriteChartObj(ObjectID: word);
    procedure WritePictureObj(ObjectID: word);
    procedure WriteNote(Note: TxlsNote; ObjectID: integer);
    procedure WriteXLSChart(SheetIndex: integer; Chart: TxlsChart);
    procedure WriteSetup;
    procedure WriteBackground(Background: TxlsGraphic);
    procedure WriteFBI(HeightApplied, Scale, FontIndex: word);
    procedure WriteChart;
    procedure WriteSCL;
    procedure WritePlotGrowth;
    procedure WriteFrame(AutoSize, AutoPos: boolean);
    procedure WriteLineFormat(Color: cardinal; Pattern, Weight, FormatFlags,
      ColorIndex: word);
    procedure WriteAreaFormat(FgColor, BgColor: cardinal; Pattern, FormatFlags,
      FgColorIndex, BgColorIndex: word);
    procedure WriteSeries;
    procedure WriteAI(LinkType: byte; SheetIndex: integer;
      DataRange: TxlsDataRange);
    procedure WriteSeriesText(const Str: string; const WStr: WideString;
      IsUnicode: boolean);
    procedure WriteDataFormat(Index: integer);
    procedure WriteSerToCRT;
    procedure WriteShtProps;
    procedure WriteDefaultText(ObjectID: word);
    procedure WriteText;
    procedure WritePos(IsLegend: boolean; X1, Y1, X2, Y2: cardinal);
    procedure WriteFontX(FontIndex: word);
    procedure WriteAxesUsed;
    procedure WriteAxisParent;
    procedure WriteAxis(AxisType: word);
    procedure WriteCatSerRange;
    procedure WriteAxcExt;
    procedure WriteTick;
    procedure WriteValueRange;
    procedure WriteAxisLineFormat;
    procedure WriteChartFormat(Style: TxlsChartStyle);
    procedure WriteBar(IsBar: boolean);
    procedure WriteLine;
    procedure WritePie;
    procedure WriteArea;
    procedure WriteSurface;
    procedure WriteRadar;
    procedure WriteRadarArea;
    procedure Write3d;
    procedure WriteLegend(Placement: byte);
    procedure WriteObjectLink;
    procedure WriteSIIndex(Index: word);
  protected
    function GetWriter: TQXLSWriter;
    function GetWriterClass: TQExportWriterClass; override;

    procedure DoExport;
  public
    ExtendedPalette: array[0..15] of integer;
  public
    constructor Create(AOwner: Tcomponent); override;
    destructor Destroy; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    //{$IFDEF OLE_STREAM}
    procedure Execute; override;
    //{$ENDIF}

    function AddBooleanCell(Col, Row: word; Value: boolean): TxlsCell;
    function AddDateTimeCell(Col, Row: word; DateTimeFormat: string;
      Value: TDateTime): TxlsCell;
    function AddNumericCell(Col, Row: word; NumericFormat: string;
      Value: double): TxlsCell;
    function AddStringCell(Col, Row: word; const Value: string): TxlsCell;
    function AddMergedCells(FirstRow, LastRow, FirstCol,
      LastCol: word): TxlsMergedCells;
    procedure DefineExtendedColor(Index: TExtendedColorIndex; Color: TColor);

    property ExportStage: TxlsExportStage read FExportStage;
    property TotalCounter: integer read FTotalCounter;
  published
    property ColumnsWidth;
    property AutoCalcColWidth default false;

    property Options: TXLSOptions read FOptions write SetOptions;

    property FieldFormats: TxlsFieldFormats read FFieldFormats
      write SetFieldFormats;
    property StripStyles: TxlsFormats read FStripStyles
      write SetStripStyles;
    property StripType: TxlsStripType read FStripType
      write FStripType default ssNone;
    property Hyperlinks: TxlsHyperlinks read FHyperlinks
      write SetHyperlinks;
    property Notes: TxlsNotes read FNotes write SetNotes;
    property Charts: TxlsCharts read FCharts write SetCharts;
    property Sheets: TxlsSheets read FSheets write SetSheets;
    property Pictures: TxlsPictures read FPictures write SetPictures;
    property Images: TxlsImages read FImages write SetImages;
    property Cells: TxlsCells read FCells write SetCells;
    property MergedCells: TxlsMergedCellList read FMergedCells
      write SetMergedCells;
    property Background: TxlsGraphic read FBackground write SetBackground;

    property HeaderRows: word read FHeaderRows write FHeaderRows default 0;
    property StartDataCol: byte read FStartDataCol
      write FStartDataCol default 0;
    property FooterRows: word read FFooterRows write FFooterRows default 0;

    property OnAdvancedExportedRecord: TxlsExportedRecordEvent
      read FOnAdvancedExportedRecord write FOnAdvancedExportedRecord;
    property OnAdvancedGetExportText: TxlsGetExportTextEvent
      read FOnAdvancedGetExportText write FOnAdvancedGetExportText;
    property OnAdvancedBeforeExportRow: TxlsBeforeExportRowEvent
      read FOnAdvancedBeforeExportRow write FOnAdvancedBeforeExportRow;

    property OnGetHeaderParams: TGetHeaderFooterParamsEvent read
      FOnGetHeaderParams write FOnGetHeaderParams;
    property OnGetCaptionParams: TGetCaptionParamsEvent read
      FOnGetCaptionParams write FOnGetCaptionParams;
    property OnGetBeforeDataParams: TGetHeaderFooterParamsEvent read
      FOnGetBeforeDataParams write FOnGetBeforeDataParams;
    property OnGetDataParams: TGetDataParamsEvent read
      FOnGetDataParams write FOnGetDataParams;
    property OnGetAggregateParams: TGetAggregateParamsEvent read
      FOnGetAggregateParams write FOnGetAggregateParams;
    property OnGetFooterParams: TGetHeaderFooterParamsEvent read
      FOnGetFooterParams write FOnGetFooterParams;

    property OnBeforeExportSheet: TxlsExportSheetEvent
      read FOnBeforeExportSheet write FOnBeforeExportSheet;
    property OnAfterExportSheet: TxlsExportSheetEvent
      read FOnAfterExportSheet write FOnAfterExportSheet;
  end;

  function XLSClr2Str(Color: TxlsColor): string;
  function Str2XLSClr(const S: string): TxlsColor;

implementation

uses QExport3Common, QExport3Types, QExport3XLSUtils, TypInfo,
  QExport3XLSConsts, Math
  {$IFDEF WIN32}, Windows, fuQExport3About, FileCtrl, QExport3StrIDs{$ENDIF}
  {$IFDEF LINUX}, VKCodes, QExport3Consts{$ENDIF};

{$IFDEF TRIAL}
{$IFDEF WIN32}
function IsIDERuning: Boolean;
begin
  Result := (FindWindow('TAppBuilder', nil) <> 0) or
            (FindWindow('TPropertyInspector', nil) <> 0) or
            (FindWindow('TAlignPalette', nil) <> 0);
end;
{$ENDIF}
{$ENDIF}

procedure CheckTrial;
begin
{$IFDEF TRIAL}
{$IFDEF WIN32}
  if not IsIDERuning then
    ShowAboutForm;
{$ENDIF}
{$ENDIF}
end;

function XLSClr2Str(Color: TxlsColor): string;
begin
  Result := ColorToString(XLS_STANDARD_PALETTE[Integer(Color)]);
end;

function Str2XLSClr(const S: string): TxlsColor;
var
  i: integer;
begin
  Result := clrBlack;
  for i := Low(XLS_STANDARD_PALETTE) to High(XLS_STANDARD_PALETTE) do
    if Integer(StringToColor(S)) = XLS_STANDARD_PALETTE[i] then begin
      Result := TxlsColor(i);
      Break;
    end;
end;

function PictureTypeByFileName(const FileName: string): TxlsPictureType;
var
  Ext: string;
begin
  Result := ptUndefined;

  Ext := ExtractFileExt(FileName);
  if Ext <> EmptyStr
    then Delete(Ext, 1, 1)
    else Exit;

  if AnsiUpperCase(Ext) = 'WMF' then
    Result := ptWMF
  else if AnsiUpperCase(Ext) = 'EMF' then
    Result := ptEMF
  else if (AnsiUpperCase(Ext) = 'JPG') or (AnsiUpperCase(Ext) = 'JPEG') then
    Result := ptJPEG
  else if (AnsiUpperCase(Ext) = 'PNG') or (AnsiUpperCase(Ext) = 'GIF') then
    Result := ptPNG
  else if AnsiUpperCase(Ext) = 'BMP' then
    Result := ptDIB;
end;

procedure SetDefaultToFont(Font: TFont);
begin
  Font .Style := [];
  Font.Color := clBlack;
  Font.CharSet := {$IFDEF WIN32}1{$ELSE}
    {$IFNDEF NOGUI}fcsAnyCharSet{$ELSE}1{$ENDIF}{$ENDIF};
  Font.Name := 'arial';
  Font.Size := 10;
end;

{ TxlsFont }

constructor TxlsFont.Create;
begin
  inherited;
  SetDefault;
end;

procedure TxlsFont.Assign(Source: TPersistent);
begin
  if Source is TxlsFont then begin
    Size := (Source as TxlsFont).Size;
    Style := (Source as TxlsFont).Style;
    Color := (Source as TxlsFont).Color;
    Script := (Source as TxlsFont).Script;
    Underline := (Source as TxlsFont).Underline;
    Charset := (Source as TxlsFont).Charset;
    Name := (Source as TxlsFont).Name;
    Exit;
  end;

  if Source is TFont then begin
    Size := (Source as TFont).Size;
    Style := [];
    Underline := fulNone;
    if fsBold in (Source as TFont).Style then Style := Style + [xfsBold];
    if fsItalic in (Source as TFont).Style then Style := Style + [xfsItalic];
    if fsStrikeOut in (Source as TFont).Style then Style := Style + [xfsStrikeOut];
    if fsUnderline in (Source as TFont).Style then Underline := fulSingle;
    case (Source as TFont).Color of
      clMaroon: Color := clrDarkRed;
      clGreen: Color := clrGreen;
      clOlive: Color := clrDarkYellow;
      clNavy: Color := clrDarkBlue;
      clPurple: Color := clrViolet;
      clTeal: Color := clrTeal;
      clGray: Color := clrGray50Percent;
      clSilver: Color := clrGray25Percent;
      clRed: Color := clrRed;
      clLime: Color := clrBrightGreen;
      clYellow: Color := clrYellow;
      clBlue: Color := clrBlue;
      clFuchsia: Color := clrPink;
      clAqua: Color := clrTurquoise;
      clWhite: Color := clrWhite;
      else Color := clrBlack;
    end;
    Script := fscNone;
    Charset := (Source as TFont).Charset;
    Name := (Source as TFont).Name;
    Exit;
  end;
  inherited;
end;

procedure TxlsFont.AssignTo(Dest: TPersistent);
begin
  if Dest is TFont then begin
    (Dest as TFont).Size := Size;
    (Dest as TFont).Style := [];
    if xfsBold in Style then
      (Dest as TFont).Style := (Dest as TFont).Style + [fsBold];
    if xfsItalic in Style then
      (Dest as TFont).Style := (Dest as TFont).Style + [fsItalic];
    if xfsStrikeOut in Style then
      (Dest as TFont).Style := (Dest as TFont).Style + [fsStrikeOut];
    if FUnderline <> fulNone then
      (Dest as TFont).Style := (Dest as TFont).Style + [fsUnderline];

    (Dest as TFont).Color := XLS_STANDARD_PALETTE[Integer(FColor)];

    (Dest as TFont).Charset := Charset;
    (Dest as TFont).Name := Name;

    Exit;
  end;
  inherited;
end;

function TxlsFont.IsEqual(Font: TxlsFont): boolean;
begin
  Result := false;
  if not Assigned(Font) then Exit;
  Result := (FSize = Font.Size) and
            (FStyle = Font.Style) and
            (FColor = Font.Color) and
            (FScript = Font.Script) and
            (FUnderline = Font.Underline) and
            (FCharset = Font.Charset) and
            (FName = Font.Name);
end;

procedure TxlsFont.SetDefault;
begin
  FStyle := [];
  FColor := clrBlack;
  FScript := fscNone;
  FUnderline := fulNone;
  FCharSet := {$IFDEF WIN32}1{$ELSE}{$IFNDEF NOGUI}fcsAnyCharSet{$ELSE}1{$ENDIF}{$ENDIF};
  FName := 'arial';
  FSize := 10;
  FFontIndex := 0;
end;

function TxlsFont.IsName: Boolean;
begin
  Result := AnsiCompareText('arial', FName) <> 0;
end;

procedure TxlsFont.AssignToBinary(Font: TbiffFont);
var
  Ln: integer;
begin
  Font.Clear;
  Font.Height := FSize * 20;
  if xfsItalic in FStyle then
    Font.Option := Font.Option + $0002;
  if xfsStrikeOut in FStyle then
    Font.Option := Font.Option + $0008;
  Font.PaletteIndex := COLOR_INDEX[Byte(FColor)];

  if xfsBold in FStyle
    then Font.Boldness := $2BC
    else Font.Boldness := $190;

  Font.Script := Byte(FScript);

  case FUnderline of
    fulSingle: Font.Underline := $01;
    fulDouble: Font.Underline := $02;
    fulSingleAccounting: Font.Underline := $21;
    fulDoubleAccounting: Font.Underline := $22;
    else PBIFF_FONT(Font.Data).Underline := $00;
  end;

  {$IFDEF WIN32}Font.Charset := Byte(FCharSet);{$ENDIF}
  {$IFDEF LINUX}Font.Charset := Byte(FCharSet);{$ENDIF}

  Ln := Length(FName);

  Font.NameLen := Ln;
  Font.NameOpt := 1;
  Font.Name := FName;
end;

{ TxlsFontList }

destructor TxlsFontList.Destroy;
var
  i: integer;
begin
  for i := Count - 1 downto 0 do Items[i].Free;
  inherited;
end;

function TxlsFontList.Add(Item: TxlsFont): integer;
begin
  Result := inherited Add(Item);
end;

function TxlsFontList.FontIndexByFont(Font: TxlsFont): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if Items[i].IsEqual(Font) then begin
      Result := Items[i].FFontIndex;
      Exit;
    end;
end;

function TxlsFontList.ListIndexByFont(Font: TxlsFont): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if Items[i].IsEqual(Font) then begin
      Result := i;
      Exit;
    end;
end;

function TxlsFontList.Get(Index: integer): TxlsFont;
begin
  Result := TxlsFont(inherited Get(Index));
end;

procedure TxlsFontList.Put(Index: integer; Value: TxlsFont);
begin
  inherited Put(Index, Value);
end;

{ TxlsTextFormat }

constructor TxlsTextFormat.Create;
begin
  inherited;
  FFormatIndex := 0;
  FFormatString := 'General';
end;

function TxlsTextFormat.IsEqual(TextFormat: TxlsTextFormat): boolean;
begin
  Result := false;
  if not Assigned(TextFormat) then Exit;
  Result := AnsiCompareStr(FormatString, TextFormat.FormatString) = 0;
end;

{ TxlsTextFormatList }

destructor TxlsTextFormatList.Destroy;
var
  i: integer;
begin
  for i := Count - 1 downto 0 do Items[i].Free;
  inherited;
end;

function TxlsTextFormatList.Add(Item: TxlsTextFormat): integer;
begin
  Result := inherited Add(Item);
end;

function TxlsTextFormatList.FormatIndexByString(const FormatString: string): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if AnsiCompareStr(Items[i].FFormatString, FormatString) = 0 then begin
      Result := Items[i].FFormatIndex;
      Exit;
    end;
end;

function TxlsTextFormatList.ListIndexByString(const FormatString: string): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if AnsiCompareStr(Items[i].FFormatString, FormatString) = 0 then begin
      Result := i;
      Exit;
    end;
end;

function TxlsTextFormatList.Get(Index: integer): TxlsTextFormat;
begin
  Result := TxlsTextFormat(inherited Get(Index));
end;

procedure TxlsTextFormatList.Put(Index: integer; Value: TxlsTextFormat);
begin
  inherited Put(Index, Value);
end;

{ TxlsXFormat }

constructor TxlsXFormat.Create(AFont: TxlsFont; ATextFormat: TxlsTextFormat);
begin
  inherited Create;
  FFont := AFont;
  FTextFormat := ATextFormat;
  FBorders := TxlsBorders.Create;
  FFill := TxlsFill.Create;
  FAlignment := TxlsAlignment.Create;
  FWrap := false;
end;

destructor TxlsXFormat.Destroy;
begin
  FBorders.Free;
  FFill.Free;
  FAlignment.Free;
  inherited;
end;

function TxlsXFormat.IsEqual(XFormat: TxlsXFormat): boolean;
begin
  Result := false;;
  if not Assigned(XFormat) then Exit;
  Result := ((not Assigned(TextFormat) and not Assigned(XFormat.TextFormat)) or
             Assigned(TextFormat) and TextFormat.IsEqual(XFormat.TextFormat)) and
            ((not Assigned(Font) and not Assigned(XFormat.Font)) or
             Assigned(Font) and Font.IsEqual(XFormat.Font)) and
            Borders.IsEqual(XFormat.Borders) and
            Fill.IsEqual(XFormat.Fill) and
            Alignment.IsEqual(XFormat.Alignment) and
            (Wrap = XFormat.Wrap);
end;

procedure TxlsXFormat.SetBorders(const Value: TxlsBorders);
begin
  FBorders.Assign(Value);
end;

procedure TxlsXFormat.SetFill(const Value: TxlsFill);
begin
  FFill.Assign(Value);
end;

procedure TxlsXFormat.SetAlignment(const Value: TxlsAlignment);
begin
  FAlignment.Assign(Value);
end;

procedure TxlsXFormat.AssignToBinary(XF: TbiffXF);
begin
  XF.Clear;
  Move(XF_DEFAULT[15], XF.Data^, SizeOf(TBIFF_XF));
  // color
  XF.Data3 := XF.Data3 or $4000;
  XF.Data7 := (XF.Data7 and not $007F) or COLOR_INDEX[Byte((Fill.Background))];
  XF.Data6 := $FC000000 and (Byte(Fill.Pattern) shl $1A);
  XF.Data7 := (XF.Data7 and not $3F80) or
    (COLOR_INDEX[Byte((Fill.Foreground))] shl $7);
  // font
  if Assigned(Self.Font) then begin
    XF.Data3 := XF.Data3 or $0800;
    XF.FontIndex := Self.Font.FFontIndex;
  end;
  // format
  if Assigned (Self.TextFormat) then
    XF.FormatIndex := Self.TextFormat.FormatIndex;
  //  borders
  if (Borders.Left.Style <> bstNone) or
     (Borders.Right.Style <> bstNone) or
     (Borders.Top.Style <> bstNone) or
     (Borders.Bottom.Style <> bstNone) or
     (Borders.DiagDown.Style <> bstNone) or
     (Borders.DiagUp.Style <> bstNone) then begin
    XF.Data3 := XF.Data3 or $2000;
    XF.Data4 := $0000;
    if Borders.Left.Style <> bstNone then begin
      XF.Data4 := XF.Data4 or ($000F and Word(Borders.Left.Style)); //$0001;
      XF.Data5 := XF.Data5 or ($007F and COLOR_INDEX[Byte(Borders.Left.Color)]);
    end;
    if Borders.Right.Style <> bstNone then begin
      XF.Data4 := XF.Data4 or ($00F0 and (Word(Borders.Right.Style) shl $4)); //$0010;
      XF.Data5 := XF.Data5 or ($3F80 and (COLOR_INDEX[Byte(Borders.Right.Color)] shl $7));
    end;
    if Borders.Top.Style <> bstNone then begin
      XF.Data4 := XF.Data4 or ($0F00 and (Word(Borders.Top.Style) shl $8)); //$0100;
      XF.Data6 := XF.Data6 or ($7F and COLOR_INDEX[Byte(Borders.Top.Color)]);
    end;
    if Borders.Bottom.Style <> bstNone then begin
      XF.Data4 := XF.Data4 or ($F000 and (Word(Borders.Bottom.Style) shl $C)); //$0100;
      XF.Data6 := XF.Data6 or ($3F80 and (COLOR_INDEX[Byte(Borders.Bottom.Color)] shl $7));
    end;

    if (Borders.DiagDown.Style <> bstNone) or
       (Borders.DiagUp.Style <> bstNone) then begin
      if Borders.DiagDown.Style <> bstNone then
        XF.Data5 := XF.Data5 or $4000;
      if Borders.DiagUp.Style <> bstNone then
        XF.Data5 := XF.Data5 or $8000;

      if Borders.DiagDown.Style <> bstNone then begin
        XF.Data6 := XF.Data6 or ($1E00000 and (Word(Borders.DiagDown.Style) shl $15));
        XF.Data6 := XF.Data6 or ($1FC000 and (COLOR_INDEX[Byte(Borders.DiagDown.Color)] shl $E))
      end
      else if Borders.DiagUp.Style <> bstNone then begin
        XF.Data6 := XF.Data6 or ($1E00000 and (Word(Borders.DiagUp.Style) shl $15));
        XF.Data6 := XF.Data6 or ($1FC000 and (COLOR_INDEX[Byte(Borders.DiagUp.Color)] shl $E))
      end;
    end
  end;
  XF.Data2 := 0;
  XF.Data3 := XF.Data3 or $1000;
  // horizontal alignment
  XF.Data2 := XF.Data2 or Byte(Alignment.Horizontal);
  // vertical alignment
  XF.Data2 := (XF.Data2 and $FF8F) or (Byte(Alignment.Vertical) shl $4);
  // wrap text
  XF.Data2 := XF.Data2 or ($0008 and (Byte(Wrap) shl $3));
end;

{ TxlsXFormatList }

destructor TxlsXFormatList.Destroy;
var
  i: integer;
begin
  for i := Count - 1 downto 0 do Items[i].Free;
  inherited;
end;

function TxlsXFormatList.Add(Item: TxlsXFormat): integer;
begin
  Result := inherited Add(Item);
end;

function TxlsXFormatList.FormatIndexByFormat(XFormat: TxlsXFormat): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if Items[i].IsEqual(XFormat) then begin
      Result := Items[i].FormatIndex;
      Exit;
    end;
end;

function TxlsXFormatList.ListIndexByFormatIndex(Index: word): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if Items[i].FormatIndex = Index then begin
      Result := i;
      Exit;
    end;
end;

function TxlsXFormatList.FormatByFormatIndex(Index: word): TxlsXFormat;
var
 i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
    if Items[i].FormatIndex = Index then begin
      Result := Items[i];
      Exit;
    end;
end;

function TxlsXFormatList.Get(Index: integer): TxlsXFormat;
begin
  Result := TxlsXFormat(inherited Get(Index));
end;

procedure TxlsXFormatList.Put(Index: integer; Value: TxlsXFormat);
begin
  inherited Put(Index, Value);
end;

{ TxlsXFormatFieldList }

destructor TxlsXFormatFieldList.Destroy;
var
  i: integer;
begin
  for i := Count - 1 downto 0 do Items[i].Free;
  inherited;
end;

function TxlsXFormatFieldList.Add(Item: TxlsXFormatField): integer;
begin
  Result := inherited Add(Item);
end;

function TxlsXFormatFieldList.FormatIndexByFieldName(SheetIndex: integer;
  const FieldName: string): integer;
var
  i: integer;
begin
  Result := DEFAULT_FORMAT;
  for i := 0 to Count - 1 do
    if (Items[i].SheetIndex = SheetIndex) and
       (AnsiCompareText(Items[i].FieldName, FieldName) = 0) then begin
      if Assigned(Items[i].XFormat) then  Result := Items[i].XFormat.FormatIndex;
      Exit;
    end;
end;

function TxlsXFormatFieldList.ListIndexByFieldName(SheetIndex: integer; const FieldName: string): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if (Items[i].SheetIndex = SheetIndex) and
       (AnsiCompareText(Items[i].FieldName, FieldName) = 0) then begin
      if Assigned(Items[i].XFormat) then  Result := i;
      Exit;
    end;
end;

function TxlsXFormatFieldList.Get(Index: integer): TxlsXFormatField;
begin
  Result := TxlsXFormatField(inherited Get(Index));
end;

procedure TxlsXFormatFieldList.Put(Index: integer; Value: TxlsXFormatField);
begin
  inherited Put(Index, Value);
end;

{ TxlsXFormatColRowList }

destructor TxlsXFormatColRowList.Destroy;
var
  i: integer;
begin
  for i := Count - 1 downto 0 do Items[i].Free;
  inherited;
end;

function TxlsXFormatColRowList.Add(Item: TxlsXFormatColRow): integer;
begin
  Result := inherited Add(Item);
end;

function TxlsXFormatColRowList.Get(Index: integer): TxlsXFormatColRow;
begin
  Result := TxlsXFormatColRow(inherited Get(Index));
end;

procedure TxlsXFormatColRowList.Put(Index: integer; Value: TxlsXFormatColRow);
begin
  inherited Put(Index, Value);
end;

function TxlsXFormatColRowList.IndexByXF(XF: word): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if Items[i].FXFormat.FFormatIndex = XF then begin
      Result := i;
      Exit;
    end;
end;

function TxlsXFormatColRowList.XFIndexByNumber(SheetIndex, Number: integer): word;
var
  i: integer;
begin
  Result := DEFAULT_FORMAT;
  for i := 0 to Count - 1  do
    if (Items[i].Number = Number) and
       (Items[i].SheetIndex = SheetIndex) then begin
      Result := Items[i].FXFormat.FormatIndex;
      Exit;
    end;
end;

{ TxlsBorder }

constructor TxlsBorder.Create;
begin
  inherited;
  SetDefault;
end;

procedure TxlsBorder.Assign(Source: TPersistent);
begin
  if Source is TxlsBorder then begin
    Style := (Source as TxlsBorder).Style;
    Color := (Source as TxlsBorder).Color;
    Exit;
  end;
  inherited;
end;

function TxlsBorder.IsEqual(Border: TxlsBorder): boolean;
begin
  Result := false;
  if not Assigned(Border) then Exit;
  Result := (Style = Border.Style) and
            (Color = Border.Color);
end;

procedure TxlsBorder.SetDefault;
begin
  FStyle := bstNone;
  FColor := clrBlack;
end;

{ TxlsBorders }

constructor TxlsBorders.Create;
begin
  inherited;
  FLeft := TxlsBorder.Create;
  FRight := TxlsBorder.Create;
  FTop := TxlsBorder.Create;
  FBottom := TxlsBorder.Create;
  FDiagDown := TxlsBorder.Create;
  FDiagUp := TxlsBorder.Create;
end;

destructor TxlsBorders.Destroy;
begin
  FLeft.Free;
  FRight.Free;
  FTop.Free;
  FBottom.Free;
  FDiagDown.Free;
  FDiagUp.Free;
  inherited;
end;

procedure TxlsBorders.Assign(Source: TPersistent);
begin
  if Source is TxlsBorders then begin
    Left := (Source as TxlsBorders).Left;
    Right := (Source as TxlsBorders).Right;
    Top := (Source as TxlsBorders).Top;
    Bottom := (Source as TxlsBorders).Bottom;
    DiagDown := (Source as TxlsBorders).DiagDown;
    DiagUp := (Source as TxlsBorders).DiagUp;
    Exit;
  end;
  inherited;
end;

function TxlsBorders.IsEqual(Borders: TxlsBorders): boolean;
begin
  Result := false;
  if not Assigned(Borders) then Exit;
  Result := Left.IsEqual(Borders.Left) and
            Right.IsEqual(Borders.Right) and
            Top.IsEqual(Borders.Top) and
            Bottom.IsEqual(Borders.Bottom) and
            DiagDown.IsEqual(Borders.DiagDown) and
            DiagUp.IsEqual(Borders.DiagUp);
end;

procedure TxlsBorders.SetDefault;
begin
  Left.SetDefault;
  Right.SetDefault;
  Top.SetDefault;
  Bottom.SetDefault;
  DiagDown.SetDefault;
  DiagUp.SetDefault;
end;

procedure TxlsBorders.SetLeft(const Value: TxlsBorder);
begin
  FLeft.Assign(Value);
end;

procedure TxlsBorders.SetRight(const Value: TxlsBorder);
begin
  FRight.Assign(Value);
end;

procedure TxlsBorders.SetTop(const Value: TxlsBorder);
begin
  FTop.Assign(Value);
end;

procedure TxlsBorders.SetBottom(const Value: TxlsBorder);
begin
  FBottom.Assign(Value);
end;

procedure TxlsBorders.SetDiagDown(const Value: TxlsBorder);
begin
  FDiagDown.Assign(Value);
end;

procedure TxlsBorders.SetDiagUp(const Value: TxlsBorder);
begin
  FDiagUp.Assign(Value);
end;

{ TxlsFill }

constructor TxlsFill.Create;
begin
  inherited;
  SetDefault;
end;

procedure TxlsFill.Assign(Source: TPersistent);
begin
  if Source is TxlsFill then begin
    Background := (Source as TxlsFill).Background;
    Pattern := (Source as TxlsFill).Pattern;
    Foreground := (Source as TxlsFill).Foreground;
    Exit;
  end;
  inherited;
end;

function TxlsFill.IsEqual(Fill: TxlsFill): boolean;
begin
  Result := False;
  if not Assigned(Fill) then Exit;
  Result := (Background = Fill.Background) and
            (Pattern = Fill.Pattern) and
            (Foreground = Fill.Foreground);
end;

procedure TxlsFill.SetDefault;
begin
  FBackground := clrWhite;
  FPattern := ptNone;
  FForeground := clrBlack;
end;

{ TxlsAlignment }

constructor TxlsAlignment.Create;
begin
  inherited;
  SetDefault;
end;

procedure TxlsAlignment.Assign(Source: TPersistent);
begin
  if Source is TxlsAlignment then begin
    Horizontal := (Source as TxlsAlignment).Horizontal;
    Vertical := (Source as TxlsAlignment).Vertical;
    Exit;
  end;
  inherited;
end;

function TxlsAlignment.IsEqual(Alignment: TxlsAlignment): boolean;
begin
  Result := false;
  if not Assigned(Alignment) then Exit;
  Result := (Horizontal = Alignment.Horizontal) and
            (Vertical = Alignment.Vertical);
end;

procedure TxlsAlignment.SetDefault;
begin
  FHorizontal := halGeneral;
  FVertical := valBottom;
end;

{ TxlsFormat }

{ TxlsCustomItem }

constructor TxlsCustomItem.Create(Collection: TCollection);
begin
  inherited;
  FTag := 0;
end;

constructor TxlsFormat.Create(Collection: TCollection);
begin
  inherited;
  FFont := TxlsFont.Create;
  FBorders := TxlsBorders.Create;
  FFill := TxlsFill.Create;
  FAlignment := TxlsAlignment.Create;
  FWrap := false;
end;

destructor TxlsFormat.Destroy;
begin
  FAlignment.Free;
  FFill.Free;
  FBorders.Free;
  FFont.Free;
  inherited;
end;

procedure TxlsFormat.Assign(Source: TPersistent);
begin
  if Source is TxlsFormat then begin
    Font := (Source as TxlsFormat).Font;
    Borders := (Source as TxlsFormat).Borders;
    Fill := (Source as TxlsFormat).Fill;
    Alignment := (Source as TxlsFormat).Alignment;
    Wrap := (Source as TxlsFormat).Wrap;
    Exit;
  end;
  inherited;
end;

function TxlsFormat.GetItemType: TxlsItemType;
begin
  Result := itFormat;
end;

function TxlsFormat.GetDisplayName: string;
begin
  Result := inherited GetDisplayName;
  if Assigned(Collection) and (Collection is TxlsFormats) and
    ((Collection as TxlsFormats).Holder is TQExport3XLS) then begin
      if (Collection as TxlsFormats) =
         ((Collection as TxlsFormats).Holder as TQExport3XLS).StripStyles then
        Result := 'StripStyle_' + IntToStr(Index);
  end;
end;

procedure TxlsFormat.SetFont(Value: TxlsFont);
begin
  if Assigned(Value) then FFont.Assign(Value);
end;

procedure TxlsFormat.SetBorders(const Value: TxlsBorders);
begin
  FBorders.Assign(Value);
end;

procedure TxlsFormat.SetFill(const Value: TxlsFill);
begin
  FFill.Assign(Value);
end;

procedure TxlsFormat.SetAlignment(const Value: TxlsAlignment);
begin
  FAlignment.Assign(Value);
end;

function TxlsFormat.IsDefault: boolean;
begin
  Result :=  (FFont.Size = 10) and
             (FFont.Style = []) and
             (FFont.Color = clrBlack) and
             (FFont.Script = fscNone) and
             (FFont.Underline = fulNone) and
             {$IFDEF WIN32}(FFont.CharSet = 1) and{$ENDIF}
             {$IFDEF LINUX}(FFont.CharSet = {$IFNDEF NOGUI}fcsAnyCharSet{$ELSE}1{$ENDIF}) and{$ENDIF}
             (FFont.Name = 'arial') and
             (FBorders.Left.Style = bstNone) and
             (FBorders.Right.Style = bstNone) and
             (FBorders.Top.Style = bstNone) and
             (FBorders.Bottom.Style = bstNone) and
             (FBorders.DiagDown.Style = bstNone) and
             (FBorders.DiagUp.Style = bstNone) and
             (FFill.Background = clrWhite) and
             (FFill.Pattern = ptNone) and
             (FFill.Foreground = clrWhite) and  // ???
             (FFill.Foreground = clrWhite) and  // ???
             (FAlignment. Horizontal = halGeneral) and
             (FAlignment.Vertical = valBottom) and
             (FWrap = false);
end;

function TxlsFormat.IsEqual(Format: TxlsFormat): boolean;
begin
  Result := false;;
  if not Assigned(Format) then Exit;
  Result := Font.IsEqual(Format.Font) and
            Borders.IsEqual(Format.Borders) and
            Fill.IsEqual(Format.Fill) and
            Alignment.IsEqual(Format.Alignment) and
            (Wrap = Format.Wrap);
end;

procedure TxlsFormat.SetDefault;
begin
  Font.SetDefault;
  Borders.SetDefault;
  Fill.SetDefault;
  Alignment.SetDefault;
  Wrap := false;
end;

procedure TxlsFormat.LoadFromTxlsXFormat(XFormat: TxlsXFormat);
begin
  Font := XFormat.Font;
  Borders := XFormat.Borders;
  Fill := XFormat.Fill;
  FWrap := XFormat.Wrap;
end;

procedure TxlsFormat.SaveToIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    WriteString(Section, S_XLS_FontName, Font.Name);
    WriteInteger(Section, S_XLS_FontSize, Font.Size);
    WriteString(Section, S_XLS_FontColor, XLSClr2Str(Font.Color));
    WriteBool(Section, S_XLS_FontBold, xfsBold in Font.Style);
    WriteBool(Section, S_XLS_FontItalic, xfsItalic in Font.Style);
    WriteBool(Section, S_XLS_FontStrikeOut, xfsStrikeOut in Font.Style);
    WriteInteger(Section, S_XLS_FontUnderline, Integer(Font.Underline));
    WriteInteger(Section, S_XLS_HorAlignment, Integer(Alignment.Horizontal));
    WriteInteger(Section, S_XLS_VertAlignment, Integer(Alignment.Vertical));
    WriteInteger(Section, S_XLS_BorderTop, Integer(Borders.Top.Style));
    WriteString(Section, S_XLS_BorderTopColor, XLSClr2Str(Borders.Top.Color));
    WriteInteger(Section, S_XLS_BorderBottom, Integer(Borders.Bottom.Style));
    WriteString(Section, S_XLS_BorderBottomColor, XLSClr2Str(Borders.Bottom.Color));
    WriteInteger(Section, S_XLS_BorderLeft, Integer(Borders.Left.Style));
    WriteString(Section, S_XLS_BorderLeftColor, XLSClr2Str(Borders.Left.Color));
    WriteInteger(Section, S_XLS_BorderRight, Integer(Borders.Right.Style));
    WriteString(Section, S_XLS_BorderRightColor, XLSClr2Str(Borders.Right.Color));
    WriteInteger(Section, S_XLS_FillPattern, Integer(Fill.Pattern));
    WriteString(Section, S_XLS_FillBackground, XLSClr2Str(Fill.Background));
    WriteString(Section, S_XLS_FillForeground, XLSClr2Str(Fill.Foreground));
  end;
end;

procedure TxlsFormat.LoadFromIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    Font.Name := ReadString(Section, S_XLS_FontName, 'arial');
    Font.Size := ReadInteger(Section, S_XLS_FontSize, 10);
    Font.Color := Str2XLSClr(ReadString(Section, S_XLS_FontColor,
      XLSClr2Str(clrBlack)));
    if ReadBool(Section, S_XLS_FontBold, false)
      then Font.Style := Font.Style + [xfsBold]
      else Font.Style := Font.Style - [xfsBold];
    if ReadBool(Section, S_XLS_FontItalic, false)
      then Font.Style := Font.Style + [xfsItalic]
      else Font.Style := Font.Style - [xfsItalic];
    if ReadBool(Section, S_XLS_FontStrikeOut, false)
      then Font.Style := Font.Style + [xfsStrikeOut]
      else Font.Style := Font.Style - [xfsStrikeOut];
    Font.Underline := TxlsFontUnderline(ReadInteger(Section,
      S_XLS_FontUnderline, 0));
    Alignment.Horizontal := TxlsHorizontalAlignment(ReadInteger(Section,
      S_XLS_HorAlignment, Integer(halGeneral)));
    Alignment.Vertical := TxlsVerticalAlignment(ReadInteger(Section,
      S_XLS_VertAlignment, Integer(valBottom)));
    Borders.Top.Style := TxlsBorderStyle(ReadInteger(Section,
      S_XLS_BorderTop, Integer(bstNone)));
    Borders.Top.Color := Str2XLSClr(ReadString(Section,
      S_XLS_BorderTopColor, XLSClr2Str(clrBlack)));
    Borders.Bottom.Style := TxlsBorderStyle(ReadInteger(Section,
      S_XLS_BorderBottom, Integer(bstNone)));
    Borders.Bottom.Color := Str2XLSClr(ReadString(Section,
      S_XLS_BorderBottomColor, XLSClr2Str(clrBlack)));
    Borders.Left.Style := TxlsBorderStyle(ReadInteger(Section,
      S_XLS_BorderLeft, Integer(bstNone)));
    Borders.Left.Color := Str2XLSClr(ReadString(Section,
      S_XLS_BorderLeftColor, XLSClr2Str(clrBlack)));
    Borders.Right.Style := TxlsBorderStyle(ReadInteger(Section,
      S_XLS_BorderRight, Integer(bstNone)));
    Borders.Right.Color := Str2XLSClr(ReadString(Section,
      S_XLS_BorderRightColor, XLSClr2Str(clrBlack)));
    Fill.Pattern := TxlsPattern(ReadInteger(Section,
      S_XLS_FillPattern, Integer(ptNone)));
    Fill.Background := Str2XLSClr(ReadString(Section,
      S_XLS_FillBackground, XLSClr2Str(clrWhite)));
    Fill.Foreground := Str2XLSClr(ReadString(Section,
      S_XLS_FillForeground, XLSClr2Str(clrBlack)));
  end;
end;

{ TxlsFormats }

constructor TxlsFormats.Create(Holder: TPersistent);
begin
  inherited Create(TxlsFormat);
  FHolder := Holder;
end;

function TxlsFormats.Add: TxlsFormat;
begin
  Result := TxlsFormat(inherited Add);
end;

function TxlsFormats.IsEqual(Formats: TxlsFormats): boolean;
var
  i: integer;
begin
  Result := Count = Formats.Count;
  if not Result then Exit;
  for i := 0 to Count - 1 do begin
    Result := Result and Items[i].IsEqual(Formats.Items[i]);
    if not Result then Break;
  end;
end;

procedure TxlsFormats.SaveToIniFile(IniFile: TIniFile;
  const SectionPrefix: string);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    Items[i].SaveToIniFile(IniFile, SectionPrefix + IntToStr(i)); 
end;

procedure TxlsFormats.LoadFromIniFile(IniFile: TIniFile;
  const SectionPrefix: string);
var
  List: TStringList;
  i: integer;
  Str: string;
begin
  BeginUpdate;
  try
    Clear;
    List := TStringList.Create;
    try
      IniFile.ReadSections(List);
      for i := 0 to List.Count - 1 do begin
        Str := Copy(List[i], 1, Length(SectionPrefix));
        if AnsiCompareText(Str, SectionPrefix) = 0 then
          Add.LoadFromIniFile(IniFile, List[i]);
      end;
    finally
      List.Free;
    end;
  finally
    EndUpdate;
  end;
end;

function TxlsFormats.GetOwner: TPersistent;
begin
  Result := FHolder;
end;

function TxlsFormats.GetItem(Index: integer): TxlsFormat;
begin
  Result := inherited GetItem(Index) as TxlsFormat;
end;

procedure TxlsFormats.SetItem(Index: integer; Value: TxlsFormat);
begin
  inherited SetItem(Index, Value);
end;

{ TxlsFieldFormat }

constructor TxlsFieldFormat.Create(Collection: TCollection);
begin
  inherited;
  FAggregate := aggNone;
  FWidth := 0;
end;

procedure TxlsFieldFormat.Assign(Source: TPersistent);
begin
  if Source is TxlsFieldFormat then begin
    FieldName := (Source as TxlsFieldFormat).FieldName;
    Aggregate := (Source as TxlsFieldFormat).Aggregate;
    Width := (Source as TxlsFieldFormat).Width;
  end;
  inherited;
end;

function TxlsFieldFormat.GetItemType: TxlsItemType;
begin
  Result := itFieldFormat;
end;

function TxlsFieldFormat.GetDisplayName: string;
begin
  Result := inherited GetDisplayName;
  if FFieldName <> EmptyStr then Result := FFieldName;
end;

procedure TxlsFieldFormat.SetDefault;
begin
  inherited;
  Aggregate := aggNone;
  Width := 0;
  FieldName := EmptyStr;
end;

procedure TxlsFieldFormat.SaveToIniFile(IniFile: TIniFile;
  const Section: string);
begin
  inherited;
  with IniFile do
    WriteInteger(Section, S_XLS_Aggregate, Integer(Aggregate));
end;

procedure TxlsFieldFormat.LoadFromIniFile(IniFile: TIniFile;
  const Section: string);
begin
  inherited;
  with IniFile do 
    Aggregate := TxlsAggregate(ReadInteger(Section,
      S_XLS_Aggregate, Integer(aggNone)));
end;

{ TxlsFieldFormats }

constructor TxlsFieldFormats.Create(Holder: TPersistent);
begin
  inherited Create(TxlsFieldFormat);
  FHolder := Holder
end;

function TxlsFieldFormats.Add: TxlsFieldFormat;
begin
  Result := TxlsFieldFormat(inherited Add);
end;

function TxlsFieldFormats.IndexByName(const FieldName: string): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if AnsiCompareText(FieldName, Items[i].FieldName) = 0 then begin
      Result := i;
      Exit;
    end;
end;

function TxlsFieldFormats.GetOwner: TPersistent;
begin
  Result := FHolder;
end;

function TxlsFieldFormats.GetItem(Index: integer): TxlsFieldFormat;
begin
  Result := inherited GetItem(Index) as TxlsFieldFormat;
end;

procedure TxlsFieldFormats.SetItem(Index: integer; Value: TxlsFieldFormat);
begin
  inherited SetItem(Index, Value);
end;

{ TxlsNoteFormat }

constructor TxlsNoteFormat.Create(Collection: TCollection);
begin
  inherited;
  FAlignment := TxlsAlignment.Create;
  FFont := TxlsFont.Create;
  SetDefault;
end;

destructor TxlsNoteFormat.Destroy;
begin
  FFont.Free;
  FAlignment.Free;
  inherited;
end;

procedure TxlsNoteFormat.Assign(Source: TPersistent);
begin
  if Source is TxlsNoteFormat then begin
    Alignment := (Source as TxlsNoteFormat).Alignment;
    BackgroundColor := (Source as TxlsNoteFormat).BackgroundColor;
    ForegroundColor := (Source as TxlsNoteFormat).ForegroundColor;
    FillType := (Source as TxlsNoteFormat).FillType;
    Font := (Source as TxlsNoteFormat).Font;
    Transparency := (Source as TxlsNoteFormat).Transparency;
    Orientation := (Source as TxlsNoteFormat).Orientation;
    //Pattern := (Source as TxlsNoteFormat).Pattern;
    Gradient := (Source as TxlsNoteFormat).Gradient;
    Exit;
  end;
  inherited;
end;

procedure TxlsNoteFormat.SetDefault;
begin
  FAlignment.Horizontal := halLeft;
  FAlignment.Vertical := valTop;
  FBackgroundColor := $00E1FFFF;
  FForegroundColor := $00E1FFFF;
  FFillType := nftSolid;
  FFont.Size := 8;
  FFont.Style := [xfsBold];
  FFont.Name := 'Tahoma';
  FTransparency := 0;
  FOrientation := xrtNoRotation;
  //FPattern := npt5Percents;
  FGradient := ngrHorizontal;
end;

procedure TxlsNoteFormat.SaveToIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    WriteString(Section, S_XLS_Note_FontName, FFont.Name);
    WriteInteger(Section, S_XLS_Note_FontSize, FFont.Size);
    WriteString(Section, S_XLS_Note_FontColor, XLSClr2Str(FFont.Color));
    WriteBool(Section, S_XLS_Note_FontBold, xfsBold in FFont.Style);
    WriteBool(Section, S_XLS_Note_FontItalic, xfsItalic in FFont.Style);
    WriteBool(Section, S_XLS_Note_FontStrikeOut, xfsStrikeOut in FFont.Style);
    WriteInteger(Section, S_XLS_Note_FontUnderline, Integer(FFont.Underline));
    WriteInteger(Section, S_XLS_Note_HorAlignment, Integer(FAlignment.Horizontal));
    WriteInteger(Section, S_XLS_Note_VertAlignment, Integer(FAlignment.Vertical));
    WriteInteger(Section, S_XLS_Note_BackgroundColor, FBackgroundColor);
    WriteInteger(Section, S_XLS_Note_ForegroundColor, FForegroundColor);
    WriteInteger(Section, S_XLS_Note_FillType, Integer(FFillType));
    WriteInteger(Section, S_XLS_Note_Transparency, FTransparency);
    WriteInteger(Section, S_XLS_Note_Orientation, Integer(FOrientation));
    WriteInteger(Section, S_XLS_Note_Gradient, Integer(FGradient));
  end;
end;

procedure TxlsNoteFormat.LoadFromIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    FFont.Name := ReadString(Section, S_XLS_Note_FontName, 'Tahoma');
    FFont.Size := ReadInteger(Section, S_XLS_Note_FontSize, 8);
    Font.Color := Str2XLSClr(ReadString(Section, S_XLS_Note_FontColor,
      XLSClr2Str(clrBlack)));
    if ReadBool(Section, S_XLS_Note_FontBold, true)
      then Font.Style := Font.Style + [xfsBold]
      else Font.Style := Font.Style - [xfsBold];
    if ReadBool(Section, S_XLS_Note_FontItalic, false)
      then Font.Style := Font.Style + [xfsItalic]
      else Font.Style := Font.Style - [xfsItalic];
    if ReadBool(Section, S_XLS_Note_FontStrikeOut, false)
      then Font.Style := Font.Style + [xfsStrikeOut]
      else Font.Style := Font.Style - [xfsStrikeOut];
    FFont.Underline := TxlsFontUnderline(ReadInteger(Section,
      S_XLS_Note_FontUnderline, 0));
    FAlignment.Horizontal := TxlsHorizontalAlignment(ReadInteger(Section,
      S_XLS_Note_HorAlignment, Integer(halLeft)));
    FAlignment.Vertical := TxlsVerticalAlignment(ReadInteger(Section,
      S_XLS_Note_VertAlignment, Integer(valTop)));
    FBackgroundColor := ReadInteger(Section, S_XLS_Note_BackgroundColor,
      $00E1FFFF);
    FForegroundColor := ReadInteger(Section, S_XLS_Note_ForegroundColor,
      $00E1FFFF);
    FFillType := TxlsNoteFillType(ReadInteger(Section, S_XLS_Note_FillType,
      Integer(nftSolid)));
    FTransparency := ReadInteger(Section, S_XLS_Note_Transparency, 0);
    FOrientation := TxlsOrientation(ReadInteger(Section,
      S_XLS_Note_Orientation, Integer(xrtNoRotation)));
    FGradient := TxlsNoteGradient(ReadInteger(Section, S_XLS_Note_Gradient,
      Integer(ngrHorizontal)));
  end;
end;

function TxlsNoteFormat.GetItemType: TxlsItemType;
begin
  Result := itNoteFormat;
end;

procedure TxlsNoteFormat.SetAlignment(const Value: TxlsAlignment);
begin
  FAlignment.Assign(Value);
end;

procedure TxlsNoteFormat.SetFont(const Value: TxlsFont);
begin
  FFont.Assign(Value);
end;

{ TxlsHyperlink }

constructor TxlsHyperlink.Create(Collection: TCollection);
var
  PropInfo: PPropInfo;
  Opt: TXLSOptions;
  HL: TxlsFormat;
begin
  inherited;
  if Assigned(Collection) and (Collection is TxlsHyperlinks) then
    FHolder := (Collection as TxlsHyperlinks).Holder;
  FStyle := hlsURL;
  FRow := 0;
  FCol := 0;
  FFormat := TxlsFormat.Create(nil);
  FScreenTip := EmptyStr;
  if Assigned(FHolder) then
  begin
    PropInfo := GetPropInfo(FHolder.ClassInfo, 'Options');
    if Assigned(PropInfo) then
    begin
      Opt := TXLSOptions(GetOrdProp(FHolder, PropInfo));
      if Assigned(Opt) then
        FFormat.Assign(Opt.HyperlinkFormat);
    end
    else begin
      PropInfo := GetPropInfo(FHolder.ClassInfo, 'HyperlinkFormat');
      if Assigned(PropInfo) then
      begin
        HL := TxlsFormat(GetOrdProp(FHolder, PropInfo));
        if Assigned(HL) then
          FFormat.Assign(HL);
      end
    end;
  end;
end;

destructor TxlsHyperlink.Destroy;
begin
  FFormat.Free;
  inherited;
end;

function TxlsHyperlink.GetItemType: TxlsItemType;
begin
  Result := itHyperlink;
end;

function TxlsHyperlink.GetDisplayName: string;
begin
  if FTitle <> EmptyStr
    then Result := FTitle
    else Result := inherited GetDisplayName;
end;

procedure TxlsHyperlink.Assign(Source: TPersistent);
begin
  if Source is TxlsHyperlink then begin
    Row := (Source as TxlsHyperlink).Row;
    Col := (Source as TxlsHyperlink).Col;
    Style := (Source as TxlsHyperlink).Style;
    Title := (Source as TxlsHyperlink).Title;
    Target := (Source as TxlsHyperlink).Target;
    Format := (Source as TxlsHyperlink).Format;
    ScreenTip := (Source as TxlsHyperlink).ScreenTip;
    Exit;
  end;
  inherited;
end;

procedure TxlsHyperlink.SaveToIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    WriteInteger(Section, S_XLS_Hyperlink_Col, FCol);
    WriteInteger(Section, S_XLS_Hyperlink_Row, FRow);
    WriteInteger(Section, S_XLS_Hyperlink_Style, Integer(FStyle));
    WriteString(Section, S_XLS_Hyperlink_Title, FTitle);
    WriteString(Section, S_XLS_Hyperlink_Target, FTarget);
    WriteString(Section, S_XLS_Hyperlink_ScreenTip, FScreenTip);
  end;
  FFormat.SaveToIniFile(IniFile, Section);
end;

procedure TxlsHyperlink.LoadFromIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    FCol := ReadInteger(Section, S_XLS_Hyperlink_Col, 0);
    FRow := ReadInteger(Section, S_XLS_Hyperlink_Row, 0);
    FStyle := TxlsHyperlinkStyle(ReadInteger(Section, S_XLS_Hyperlink_Style, 0));
    FTitle := ReadString(Section, S_XLS_Hyperlink_Title, EmptyStr);
    FTarget := ReadString(Section, S_XLS_Hyperlink_Target, EmptyStr);
    FScreenTip := ReadString(Section, S_XLS_Hyperlink_ScreenTip, EmptyStr);
  end;
  FFormat.LoadFromIniFile(IniFile, Section);
end;

function TxlsHyperlink.GetSize: integer;
begin
  Result :=  2 + {Index to first row}
             2 + {Index to last row}
             2 + {Index to first column}
             2 + {Index to last column}
            16 + {GUID of StdLink}
             4 + {Unknown value}
             4 + {Option flags}
             4 + {Character count of description text, including trailing
                  zero word}
            Length(Title) * 2 +
             2 {Null chars};
  case FStyle of
    hlsURL:
      Result := Result +
                16 + {GUID of URL Moniker}
                 4 + {Size of character array of the URL, including trailing
                      zero word (us). There are us/2-1 characters in the
                      following string.}
                Length(Target) * 2 +
                 2 {Null chars};
    hlsLocalFile:
      Result := Result +
                16 + {GUID of File Moniker}
                 2 + {Directory up-level count. Each leading “..\” in the file
                      link is deleted and increases this counter.}
                 4 + {Character count of the shortened file path and name,
                      including trailing zero byte}
                 Length(GetShortTarget) + {Character array of the shortened file
                                           path and name in 8.3-DOS-format. This
                                           field can be filled with a long file
                                           name too. No Unicode string header,
                                           always 8-bit characters, zeroterminated.}
                24 + {Unknown byte sequence}
                 4 + {Size of the following file link field including string
                      length field and additional data field}
                 4 + {Size of character array of the extended file path and
                      name (xl). There are xl/2 characters in the following
                      string.}
                 2 + {Unknown byte sequence}
                 Length(FTarget);

  end;
end;

{$IFDEF VCL3}
function ExtractShortPathName(const FileName: string): string;
var
  Buffer: array[0..MAX_PATH - 1] of Char;
begin
  SetString(Result, Buffer,
    GetShortPathName(PChar(FileName), Buffer, SizeOf(Buffer)));
end;
{$ENDIF}

function TxlsHyperlink.GetShortTarget: string;
begin
  Result := ExtractShortPathName(FTarget);
end;

procedure TxlsHyperlink.SetFormat(const Value: TxlsFormat);
begin
  FFormat.Assign(Value);
end;

function TxlsHyperlink.IsValid: boolean;
begin
  Result := (FCol > 0) and (FCol <= 256) and
            (FRow > 0) and (FTitle <> EmptyStr) and
            (FTarget <> EmptyStr);
end;

{ TxlsHyperlinks }

constructor TxlsHyperlinks.Create(Holder: TPersistent);
begin
  inherited Create(TxlsHyperlink);
  FHolder := Holder
end;

function TxlsHyperlinks.Add: TxlsHyperlink;
begin
  Result := TxlsHyperlink(inherited Add);
end;

function TxlsHyperlinks.GetOwner: TPersistent;
begin
  Result := FHolder;
end;

function TxlsHyperlinks.GetItem(Index: integer): TxlsHyperlink;
begin
  Result := inherited GetItem(Index) as TxlsHyperlink;
end;

procedure TxlsHyperlinks.SetItem(Index: integer; Value: TxlsHyperlink);
begin
  inherited SetItem(Index, Value);
end;

{ TxlsNote }

constructor TxlsNote.Create(Collection: TCollection);
var
  PropInfo: PPropInfo;
  Opt: TXLSOptions;
begin
  inherited;
  FCol := 0;
  FRow := 0;
  FLines := TStringList.Create;
  FFormat := TxlsNoteFormat.Create(nil);

  if Assigned(Collection) and (Collection is TxlsNotes) then
    FHolder := (Collection as TxlsNotes).Holder;
  if Assigned(FHolder) then begin
    PropInfo := GetPropInfo(FHolder.ClassInfo, 'Options');
    if Assigned(PropInfo) then begin
      Opt := TXLSOptions(GetOrdProp(FHolder, PropInfo));
      if Assigned(Opt) then FFormat.Assign(Opt.NoteFormat);
    end;
  end;

end;

destructor TxlsNote.Destroy;
begin
  FFormat.Free;
  FLines.Free;
  inherited;
end;

procedure TxlsNote.Assign(Source: TPersistent);
begin
  if Source is TxlsNote then begin
    Col := (Source as TxlsNote).Col;
    Row := (Source as TxlsNote).Row;
    Lines := (Source as TxlsNote).Lines;
    Format := (Source as TxlsNote).Format;
    Exit;
  end;
  inherited;
end;

procedure TxlsNote.SaveToIniFile(IniFile: TIniFile; const Section: string);
var
  i: integer;
begin
  with IniFile do begin
    WriteInteger(Section, S_XLS_Note_Col, FCol);
    WriteInteger(Section, S_XLS_Note_Row, FRow);
    for i := 0 to FLines.Count - 1 do
      WriteString(Section + '_' + S_XLS_Note_Lines,
        SysUtils.Format(S_Line + '%d', [i]), FLines[i]);
  end;
  FFormat.SaveToIniFile(IniFile, Section);
end;

procedure TxlsNote.LoadFromIniFile(IniFile: TIniFile; const Section: string);
var
  i: integer;
begin
  with IniFile do begin
    FCol := ReadInteger(Section, S_XLS_Note_Col, 0);
    FRow := ReadInteger(Section, S_XLS_Note_Row, 0);
    FLines.Clear;
    if IniFileSectionExists(IniFile, Section + '_' + S_XLS_Note_Lines) then begin
      ReadSection(Section + '_' + S_XLS_Note_Lines, FLines);
      for i := 0 to FLines.Count - 1 do
        FLines[i] := ReadString(Section + '_' + S_XLS_Note_Lines, FLines[i], EmptyStr);
    end;
  end;
  FFormat.LoadFromIniFile(IniFile, Section);
end;

function TxlsNote.GetItemType: TxlsItemType;
begin
  Result := itNote;
end;

procedure TxlsNote.SetLines(const Value: TStrings);
begin
  FLines.Assign(Value);
end;

procedure TxlsNote.SetFormat(const Value: TxlsNoteFormat);
begin
  FFormat.Assign(Value);
end;

function TxlsNote.GetAnchor: TMSO_Anchor;
begin
  if (FRow - 1) > 1
    then Result.Row1 := (FRow - 1) - 1
    else Result.Row1 := 0;
  Result.Col1 := (FCol - 1) + 1;
  Result.Row2 := Result.Row1 + 5;
  Result.Col2 := Result.Col1 + 2;

  Result.Col1Offset := 0;
  Result.Row1Offset := 0;
  Result.Col2Offset := 0;
  Result.Row2Offset := 0;
end;

function TxlsNote.IsValid: boolean;
begin
  Result := (FCol > 0) and (FCol < 256) and (FRow > 0) and
            (FLines.Text <> EmptyStr);   
end;

{ TxlsNotes }

constructor TxlsNotes.Create(Holder: TPersistent);
begin
  inherited Create(TxlsNote);
  FHolder := Holder
end;

function TxlsNotes.Add: TxlsNote;
begin
  Result := TxlsNote(inherited Add);
end;

function TxlsNotes.GetOwner: TPersistent;
begin
  Result := FHolder;
end;

function TxlsNotes.GetItem(Index: integer): TxlsNote;
begin
  Result := inherited GetItem(Index) as TxlsNote;
end;

procedure TxlsNotes.SetItem(Index: integer; Value: TxlsNote);
begin
  inherited SetItem(Index, Value);
end;

{ TxlsDataRange }

constructor TxlsDataRange.Create;
begin
  inherited;
  FCol1 := 0;
  FCol2 := 0;
  FRow1 := 0;
  FRow2 := 0;
end;

procedure TxlsDataRange.Assign(Source: TPersistent);
begin
  if Source is TxlsDataRange then begin
    Col1 := (Source as TxlsDataRange).Col1;
    Col2 := (Source as TxlsDataRange).Col2;
    Row1 := (Source as TxlsDataRange).Row1;
    Row2 := (Source as TxlsDataRange).Row2;
    Exit;
  end;
  inherited;
end;

procedure TxlsDataRange.SaveToIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    WriteInteger(Section, S_XLS_DataRange_Col1, FCol1);
    WriteInteger(Section, S_XLS_DataRange_Row1, FRow1);
    WriteInteger(Section, S_XLS_DataRange_Col2, FCol2);
    WriteInteger(Section, S_XLS_DataRange_Row2, FRow2);
  end;
end;

procedure TxlsDataRange.LoadFromIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    FCol1 := ReadInteger(Section, S_XLS_DataRange_Col1, 0);
    FRow1 := ReadInteger(Section, S_XLS_DataRange_Row1, 0);
    FCol2 := ReadInteger(Section, S_XLS_DataRange_Col2, 0);
    FRow2 := ReadInteger(Section, S_XLS_DataRange_Row2, 0);
  end;
end;

{ TxlsChartSeries }

constructor TxlsChartSeries.Create(Collection: TCollection);
begin
  inherited;
  FColor := clrAqua;
  FDataRange := TxlsDataRange.Create;
//  FTitle := Format('Series_%d', [Index]);
  FDataRangeType := rtColumn; 
end;

destructor TxlsChartSeries.Destroy;
begin
  FDataRange.Free;
  inherited;
end;

procedure TxlsChartSeries.Assign(Source: TPersistent);
begin
  if Source is TxlsChartSeries then begin
    DataColumn := (Source as TxlsChartSeries).DataColumn;
    Color := (Source as TxlsChartSeries).Color;
    DataRange := (Source as TxlsChartSeries).DataRange;
    DataRangeType := (Source as TxlsChartSeries).DataRangeType;
    Title := (Source as TxlsChartSeries).Title;
    Exit;
  end;
  inherited;
end;

procedure TxlsChartSeries.SaveToIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    WriteInteger(Section, S_XLS_Series_Color, Integer(FColor));
    WriteString(Section, S_XLS_Series_Title, FTitle);
    WriteString(Section, S_XLS_Series_DataColumn, FDataColumn);
    WriteInteger(Section, S_XLS_Series_DataRangeType, Integer(FDataRangeType));
  end;
  FDataRange.SaveToIniFile(IniFile, Section);
end;

procedure TxlsChartSeries.LoadFromIniFile(IniFile: TIniFile; 
  const Section: string);
begin
  with IniFile do begin
    FColor := TxlsColor(ReadInteger(Section, S_XLS_Series_Color,
      Integer(clrBlack)));
    FTitle := ReadString(Section, S_XLS_Series_Title, EmptyStr);
    FDataColumn := ReadString(Section, S_XLS_Series_DataColumn, EmptyStr);
    FDataRangeType := TxlsRangeType(ReadInteger(Section,
      S_XLS_Series_DataRangeType, Integer(rtColumn)));
  end;
  FDataRange.LoadFromIniFile(IniFile, Section);
end;

function TxlsChartSeries.GetItemType: TxlsItemType;
begin
  Result := itSeries;
end;

function TxlsChartSeries.GetDisplayName: string;
begin
  if FTitle <> EmptyStr
    then Result := FTitle
    else Result := inherited GetDisplayName;
end;

procedure TxlsChartSeries.SetDataRange(const Value: TxlsDataRange);
begin
  FDataRange.Assign(Value);
end;

{ TxlsChartSeriesList }

constructor TxlsChartSeriesList.Create(Holder: TPersistent);
begin
  inherited Create(TxlsChartSeries);
  FHolder := Holder
end;

function TxlsChartSeriesList.Add: TxlsChartSeries;
begin
  Result := TxlsChartSeries(inherited Add);
end;

function TxlsChartSeriesList.GetOwner: TPersistent;
begin
  Result := FHolder;
end;

function TxlsChartSeriesList.GetItem(Index: integer): TxlsChartSeries;
begin
  Result := inherited GetItem(Index) as TxlsChartSeries;
end;

procedure TxlsChartSeriesList.SetItem(Index: integer; Value: TxlsChartSeries);
begin
  inherited SetItem(Index, Value);
end;

{ TxlsChartAutoPosition }

constructor TxlsChartAutoPosition.Create;
begin
  inherited;
  FPlacement := cpBottom;
  FHeight := 10;
  FLeft := 0;
  FTop := 0;
  FWidth := 5;
end;

procedure TxlsChartAutoPosition.Assign(Source: TPersistent);
begin
  if Source is TxlsChartAutoPosition then begin
    Placement := (Source as TxlsChartAutoPosition).Placement;
    Height := (Source as TxlsChartAutoPosition).Height;
    Left := (Source as TxlsChartAutoPosition).Left;
    Top := (Source as TxlsChartAutoPosition).Top;
    Width := (Source as TxlsChartAutoPosition).Width;
    Exit;
  end;
  inherited;
end;

procedure TxlsChartAutoPosition.LoadFromIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    FPlacement := TxlsChartPlacement(ReadInteger(Section,
      S_XLS_ChartPlacement, Integer(cpBottom)));
    FHeight := ReadInteger(Section, S_XLS_ChartHeight, 10);
    FLeft := ReadInteger(Section, S_XLS_ChartLeft, 0);
    FTop := ReadInteger(Section, S_XLS_ChartTop, 0);
    FWidth := ReadInteger(Section, S_XLS_ChartWidth, 5);
  end;
end;

procedure TxlsChartAutoPosition.SaveToIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    WriteInteger(Section, S_XLS_ChartPlacement, Integer(FPlacement));
    WriteInteger(Section, S_XLS_ChartHeight, FHeight);
    WriteInteger(Section, S_XLS_ChartLeft, FLeft);
    WriteInteger(Section, S_XLS_ChartTop, FTop);
    WriteInteger(Section, S_XLS_ChartWidth, FWidth);
  end;
end;

{ TxlsChartCustomPosition }

constructor TxlsChartCustomPosition.Create;
begin
  inherited;
  FX1 := 0;
  FX2 := 0;
  FY1 := 0;
  FY2 := 0;
end;

procedure TxlsChartCustomPosition.Assign(Source: TPersistent);
begin
  if Source is TxlsChartCustomPosition then begin
    X1 := (Source as TxlsChartCustomPosition).X1;
    X2 := (Source as TxlsChartCustomPosition).X2;
    Y1 := (Source as TxlsChartCustomPosition).Y1;
    Y2 := (Source as TxlsChartCustomPosition).Y2;
    Exit;
  end;
  inherited;
end;

procedure TxlsChartCustomPosition.SaveToIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    WriteInteger(Section, S_XLS_ChartPosition_X1, FX1);
    WriteInteger(Section, S_XLS_ChartPosition_Y1, FY1);
    WriteInteger(Section, S_XLS_ChartPosition_X2, FX2);
    WriteInteger(Section, S_XLS_ChartPosition_Y2, FY2);
  end;
end;

procedure TxlsChartCustomPosition.LoadFromIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    FX1 := ReadInteger(Section, S_XLS_ChartPosition_X1, 0);
    FY1 := ReadInteger(Section, S_XLS_ChartPosition_Y1, 0);
    FX2 := ReadInteger(Section, S_XLS_ChartPosition_X2, 0);
    FY2 := ReadInteger(Section, S_XLS_ChartPosition_Y2, 0);
  end;
end;

{ TxlsChartPosition }

constructor TxlsChartPosition.Create;
begin
  inherited;
  FAutoPosition := TxlsChartAutoPosition.Create;
  FCustomPosition := TxlsChartCustomPosition.Create;
  FPositionType := cptAuto;
end;

destructor TxlsChartPosition.Destroy;
begin
  FCustomPosition.Free;
  FAutoPosition.Free;
  inherited;
end;

procedure TxlsChartPosition.Assign(Source: TPersistent);
begin
  if Source is TxlsChartPosition then begin
    AutoPosition := (Source as TxlsChartPosition).AutoPosition;
    CustomPosition := (Source as TxlsChartPosition).CustomPosition;
    PositionType := (Source as TxlsChartPosition).PositionType;
    Exit;
  end;
  inherited;
end;

procedure TxlsChartPosition.LoadFromIniFile(IniFile: TIniFile;
  const Section: string);
begin
  FAutoPosition.LoadFromIniFile(IniFile, Section);
  FCustomPosition.LoadFromIniFile(IniFile, Section);
  with IniFile do begin
    FPositionType := TxlsChartPositionType(ReadInteger(Section,
      S_XLS_ChartPositionType, Integer(cptAuto)));
  end;
end;

procedure TxlsChartPosition.SaveToIniFile(IniFile: TIniFile;
  const Section: string);
begin
  FAutoPosition.SaveToIniFile(IniFile, Section);
  FCustomPosition.SaveToIniFile(IniFile, Section);
  with IniFile do begin
    WriteInteger(Section, S_XLS_ChartPositionType, Integer(FPositionType));
  end;
end;

procedure TxlsChartPosition.SetAutoPosition(const Value: TxlsChartAutoPosition);
begin
  FAutoPosition.Assign(Value);
end;

procedure TxlsChartPosition.SetCustomPosition(
  const Value: TxlsChartCustomPosition);
begin
  CustomPosition.Assign(Value);
end;

{ TxlsChart }

constructor TxlsChart.Create(Collection: TCollection);
begin
  inherited;
  FAutoColor := true;
  FCategoryLabels := TxlsDataRange.Create;
  FCategoryLabelsType := rtColumn;
  FLegendPlacement := clpRight;
  FPosition := TxlsChartPosition.Create;
  FSeries := TxlsChartSeriesList.Create(Self);
  FShowLegend := true;
  FStyle := xcsColumn;
//  FTitle := Format('Chart_%d', [Index]);
end;

destructor TxlsChart.Destroy;
begin
  FCategoryLabels.Free;
  FPosition.Free;
  FSeries.Free;
  inherited;
end;

procedure TxlsChart.Assign(Source: TPersistent);
begin
  if Source is TxlsChart then begin
    AutoColor := (Source as TxlsChart).AutoColor;
    CategoryLabels := (Source as TxlsChart).CategoryLabels;
    CategoryLabelsType := (Source as TxlsChart).CategoryLabelsType;
    CategoryLabelsColumn := (Source as TxlsChart).CategoryLabelsColumn;
    LegendPlacement := (Source as TxlsChart).LegendPlacement;
    Position := (Source as TxlsChart).Position;
    Series := (Source as TxlsChart).Series;
    ShowLegend := (Source as TxlsChart).ShowLegend;
    Style := (Source as TxlsChart).Style;
    Title := (Source as TxlsChart).Title;
    Exit;
  end;
  inherited;
end;

procedure TxlsChart.SaveToIniFile(IniFile: TIniFile; const Section: string);
var
  i: integer;
begin
  with IniFile do begin
    WriteBool(Section, S_XLS_Chart_AutoColor, FAutoColor);
    WriteInteger(Section, S_XLS_Chart_LegendPlacement,
      Integer(FLegendPlacement));
    WriteBool(Section, S_XLS_Chart_ShowLegend, FShowLegend);
    WriteInteger(Section, S_XLS_Chart_Style, Integer(FStyle));
    WriteString(Section, S_XLS_Chart_Title, FTitle);
    WriteInteger(Section, S_XLS_Chart_CategoryLabelsType,
      Integer(FCategoryLabelsType));
    WriteString(Section, S_XLS_Chart_CategoryLabelsColumn,
      FCategoryLabelsColumn);
  end;
  FCategoryLabels.SaveToIniFile(IniFile, Section);
  FPosition.SaveToIniFile(IniFile, Section);
  for i := 0 to FSeries.Count - 1 do
    FSeries[i].SaveToIniFile(IniFile, Section + S_XLS_SERIES + IntToStr(i));
end;

procedure TxlsChart.LoadFromIniFile(IniFile: TIniFile; const Section: string);
var
  AStrings: TStringList;
  i: integer;
  Str, Str2: string;
  Ln: integer;
begin
  FSeries.Clear;
  with IniFile do begin
    FAutoColor := ReadBool(Section, S_XLS_Chart_AutoColor, true);
    FLegendPlacement := TxlsChartLegendPlacement(ReadInteger(Section,
      S_XLS_Chart_LegendPlacement, Integer(clpRight)));
    FShowLegend := ReadBool(Section, S_XLS_Chart_ShowLegend, true);
    FStyle := TxlsChartStyle(ReadInteger(Section, S_XLS_Chart_Style,
      Integer(xcsColumn)));
    FTitle := ReadString(Section, S_XLS_Chart_Title, EmptyStr);
    FCategoryLabelsType := TxlsRangeType(ReadInteger(Section,
      S_XLS_Chart_CategoryLabelsType, Integer(rtColumn)));
    FCategoryLabelsColumn := ReadString(Section,
      S_XLS_Chart_CategoryLabelsColumn, EmptyStr);

    AStrings := TStringList.Create;
    try
      ReadSections(AStrings);
      Str := Section + S_XLS_SERIES;
      Ln := Length(Str);
      for i := 0 to AStrings.Count - 1 do begin
        Str2 := Copy(AStrings[i], 1, Ln);
        if AnsiCompareText(Str, Str2) = 0 then
          FSeries.Add.LoadFromIniFile(IniFile, AStrings[i]);
      end;
    finally
      AStrings.Free;
    end;
  end;
  FCategoryLabels.LoadFromIniFile(IniFile, Section);
  FPosition.LoadFromIniFile(IniFile, Section);
end;

function TxlsChart.GetItemType: TxlsItemType;
begin
  Result := itChart;
end;

function TxlsChart.GetDisplayName: string;
begin
  if FTitle <> EmptyStr
    then Result := FTitle
    else Result := inherited GetDisplayName;
end;

procedure TxlsChart.SetCategoryLabels(const Value: TxlsDataRange);
begin
  FCategoryLabels.Assign(Value);
end;

procedure TxlsChart.SetPosition(const Value: TxlsChartPosition);
begin
  FPosition.Assign(Value);
end;

procedure TxlsChart.SetSeries(const Value: TxlsChartSeriesList);
begin
  FSeries.Assign(Value);
end;

function TxlsChart.GetAnchor: TMSO_Anchor;
var
  i: integer;
begin
  Result.Row1 := 0;
  Result.Col1 := 0;
  Result.Row2 := 0;
  Result.Col2 := 0;
  if Assigned(Sheet) then begin
    case FPosition.PositionType of
      cptAuto: begin
        if Assigned(Sheet.QExportXLS) then begin
          i := Sheet.QExportXLS.FBoundSheetList.IndexOfSheetIndex(Sheet.Index);
          if i > -1 then begin
            case FPosition.AutoPosition.Placement of
              cpBottom: begin
                Result.Row1 := MaximumInt(Sheet.QExportXLS.FBoundSheetList[i].LastRow + FPosition.AutoPosition.Top, 0) + 1;
                Result.Col1 := MaximumInt(Sheet.QExportXLS.FBoundSheetList[i].FirstCol + FPosition.AutoPosition.Left, 0);
                Result.Row2 := MaximumInt(Result.Row1 + FPosition.AutoPosition.Height, 0);
                Result.Col2 := MaximumInt(Result.Col1 + FPosition.AutoPosition.Width, 0);
              end;
              cpRight: begin
                Result.Row1 := MaximumInt(FPosition.AutoPosition.Top, 0);
                Result.Col1 := MaximumInt(Sheet.QExportXLS.FBoundSheetList[i].LastCol + FPosition.AutoPosition.Left, 0) + 1;
                Result.Row2 := MaximumInt(Result.Row1 + FPosition.AutoPosition.Height, 0);
                Result.Col2 := MaximumInt(Result.Col1 + FPosition.AutoPosition.Width, 0);
              end;
            end;
          end;
        end;
      end;
      cptCustom: begin
        Result.Row1 := FPosition.CustomPosition.Y1 - 1;
        Result.Col1 := FPosition.CustomPosition.X1 - 1;
        Result.Row2 := FPosition.CustomPosition.Y2 - 1;
        Result.Col2 := FPosition.CustomPosition.X2 - 1;
      end;
    end;
  end;

  Result.Col1Offset := 0;
  Result.Row1Offset := 0;
  Result.Col2Offset := 0;
  Result.Row2Offset := 0;
end;

function TxlsChart.GetSheet: TxlsSheet;
begin
  Result := nil;
  if Assigned(Collection) and (Collection is TxlsCharts) and
     Assigned((Collection as TxlsCharts).Holder) and
     ((Collection as TxlsCharts).Holder is TxlsSheet) then
    Result := (Collection as TxlsCharts).Holder as TxlsSheet;
end;

{ TxlsCharts }

constructor TxlsCharts.Create(Holder: TPersistent);
begin
  inherited Create(TxlsChart);
  FHolder := Holder;
end;

function TxlsCharts.Add: TxlsChart;
begin
  Result := TxlsChart(inherited Add);
end;

function TxlsCharts.GetOwner: TPersistent;
begin
  Result := FHolder;
end;

function TxlsCharts.GetItem(Index: integer): TxlsChart;
begin
  Result := inherited GetItem(Index) as TxlsChart;
end;

procedure TxlsCharts.SetItem(Index: integer; Value: TxlsChart);
begin
  inherited SetItem(Index, Value);
end;

{ TxlsGraphic }

constructor TxlsGraphic.Create(Collection: TCollection);
begin
  inherited;
  FFileName := EmptyStr;
  FHeight := 0;
  FStream := TMemoryStream.Create;
  FWidth := 0;
end;

destructor TxlsGraphic.Destroy;
begin
  FStream.Free;
  inherited;
end;

procedure TxlsGraphic.Assign(Source: TPersistent);
begin
  if Source is TxlsGraphic then begin
    FileName := (Source as TxlsGraphic).FileName;
    Height := (Source as TxlsGraphic).Height;
    Stream := (Source as TxlsGraphic).Stream;
    Width := (Source as TxlsGraphic).Width;
    Exit;
  end;
  inherited;
end;

function TxlsGraphic.IsFileSource: boolean;
begin
  Result := FStream.Size = 0;
end;

function TxlsGraphic.GetItemType: TxlsItemType;
begin
  Result := itGraphic;
end;

procedure TxlsGraphic.SetFileName(const Value: string);
var
  Ext: string;
begin
  if FFileName <> Value then begin
    FFileName := Value;

    Ext := AnsiUpperCase(Trim(ExtractFileExt(FFileName)));

    if (Ext <> EmptyStr) and (Ext[1] = '.') then
      Delete(Ext, 1, 1);

    if Ext = 'WMF' then
      FGraphicType := gtWMF
    else if Ext = 'EMF' then
      FGraphicType := gtEMF
    else if (Ext = 'JPG') or (Ext = 'JPEG') then
      FGraphicType := gtJPG
    else if Ext = 'PNG' then
      FGraphicType := gtPNG
    else if Ext = 'GIF' then
      FGraphicType := gtGIF
    else if (Ext = 'BMP') or (Ext = 'QBMP') then
      FGraphicType := gtBMP
    else if Ext = 'ICO' then
      FGraphicType := gtICO
    else FGraphicType := gtUnknown;
  end;
end;

procedure TxlsGraphic.SetStream(Value: TMemoryStream);
begin
  FStream.Size := 0;
  if Assigned(Value) then
    FStream.CopyFrom(Value, 0);
end;

{ TxlsPicture }

constructor TxlsPicture.Create(Collection: TCollection);
var
  i, j: integer;
begin
  inherited;
  if Assigned(Collection) and (Collection is TxlsPictures) then
    FPictures := Collection as TxlsPictures
  else FPictures := nil;

  i := 0; j := 0;

  if Assigned(FPictures) then
    while FPictures.Find(Format('Picture_%d', [i]), j) do
      Inc(i);

  FName := Format('Picture_%d', [i]);
  FPictureType := ptUndefined;
end;

procedure TxlsPicture.Assign(Source: TPersistent);
begin
  if Source is TxlsPicture then begin
    FileName := (Source as TxlsPicture).FileName;
    PictureType := (Source as TxlsPicture).PictureType;
    Exit;
  end;
  inherited;
end;

procedure TxlsPicture.LoadFromIniFile(IniFile: TIniFile;
  const Section: string);
begin
end;

procedure TxlsPicture.SaveToIniFile(IniFile: TIniFile;
  const Section: string);
begin
end;

function TxlsPicture.GetDisplayName: string;
begin
  if FName <> EmptyStr
    then Result := FName
    else Result := inherited GetDisplayName;
end;

function TxlsPicture.GetItemType: TxlsItemType;
begin
  Result := itPicture;
end;

function TxlsPicture.CalcRefCount: integer;
var
  QExportXLS: TQExport3XLS;
  i, j: integer;
begin
  Result := 0;
  if Assigned(FPictures) and Assigned(FPictures.Holder) and
     (FPictures.FHolder is TQExport3XLS) then begin
    QExportXLS := FPictures.FHolder as TQExport3XLS;
    for i := 0 to QExportXLS.Sheets.Count - 1 do
      for j := 0 to QExportXLS.Sheets[i].Images.Count -1 do
        if AnsiCompareText(FName, QExportXLS.Sheets[i].Images[j].PictureName) = 0 then
          Inc(Result);
  end;
end;

procedure TxlsPicture.GetMeasurements(var H, W: integer);
var
  IsNative: boolean;
  Pic: TPicture;
  FS: TFileStream;
begin
  if FStream.Size > 0 then begin
    H := FHeight;
    W := FWidth;
  end
  else begin
    H := 0; W := 0;
    if FileExists(FFileName) then begin

      IsNative := AnsiUpperCase(ExtractFileExt(FFileName)) <> '.GIF';

      if IsNative then begin
        Pic := TPicture.Create;
        try
          Pic.LoadFromFile(FFileName);
          H := Pic.Graphic.Height;
          W := Pic.Graphic.Width;
        finally
          Pic.Free;
        end;
      end
      else begin
        FS := TFileStream.Create(FFileName, fmOpenRead);
        try
          FS.Seek(6, soFromBeginning);
          FS.Read(W, SizeOf(Word));
          FS.Read(H, SizeOf(Word));
        finally
          FS.Free;
        end;
      end;
    end;
  end;
end;

procedure TxlsPicture.SetName(const Value: string);
var
  j: integer;
begin
  if FName <> Value then begin
    if Value = EmptyStr then
      raise Exception.Create('A picture name cannot be empty');
    j := 0;
    if Assigned(FPictures) and FPictures.Find(Value, j) then
      raise Exception.CreateFmt('A picture %s already exists', [Value]);
    FName := Value;
  end;
end;

{ TxlsPictures }

constructor TxlsPictures.Create(Holder: TPersistent);
begin
  inherited Create(TxlsPicture);
  FHolder := Holder;
end;

function TxlsPictures.Add: TxlsPicture;
begin
  Result := TxlsPicture(inherited Add);
end;

function TxlsPictures.Find(const Name: string; var Index: integer): boolean;
var
  i: integer;
begin
  Result := false;
  for i := 0 to Count - 1 do
    if AnsiCompareText(Items[i].Name, Name) = 0 then  begin
      Result := true;
      Index := i;
      Break;
    end;
end;

function TxlsPictures.GetOwner: TPersistent;
begin
  Result := FHolder;
end;

function TxlsPictures.GetItem(Index: integer): TxlsPicture;
begin
  Result := inherited GetItem(Index) as TxlsPicture;
end;

procedure TxlsPictures.SetItem(Index: integer; Value: TxlsPicture);
begin
  inherited SetItem(Index, Value);
end;

{ TxlsImage }

constructor TxlsImage.Create(Collection: TCollection);
var
  i, j: integer;
begin
  inherited;
  FCol := 0;
  FRow := 0;

  if Assigned(Collection) and (Collection is TxlsImages) then
    FImages := Collection as TxlsImages
  else FImages := nil;

  if Assigned(FImages) and Assigned(FImages.Holder) then begin
    if FImages.Holder is TxlsSheet then begin
      FSheet := FImages.Holder as TxlsSheet;
      FQExportXLS := FSheet.FQExportXLS;
    end
    else if FImages.Holder is TQExport3XLS then begin
      FSheet := nil;
      FQExportXLS := FImages.Holder as TQExport3XLS;
    end
    else begin
      FSheet := nil;
      FQExportXLS := nil;
    end;
  end
  else begin
    FSheet := nil;
    FQExportXLS := nil;
  end;

  i := 0; j := 0;
  if Assigned(FImages) then
    while FImages.Find(Format('Image_%d', [i]), j) do
      Inc(i);
  FTitle := Format('Image_%d', [i]);
  FZoom := 100;
end;

destructor TxlsImage.Destroy;
begin
  inherited;
end;

procedure TxlsImage.Assign(Source: TPersistent);
begin
  if Source is TxlsImage then begin
    Col := (Source as TxlsImage).Col;
    PictureName := (Source as TxlsImage).PictureName;
    Row := (Source as TxlsImage).Row;
    Title := (Source as TxlsImage).Title;
    Exit;
  end;
  inherited;
end;

procedure TxlsImage.SaveToIniFile(IniFile: TIniFile; const Section: string);
begin
end;

procedure TxlsImage.LoadFromIniFile(IniFile: TIniFile; const Section: string);
begin
end;

function TxlsImage.GetDisplayName: string;
begin
  if FTitle <> EmptyStr
    then Result := FTitle
    else Result := inherited GetDisplayName;
end;

function TxlsImage.GetItemType: TxlsItemType;
begin
  Result := itPicture;
end;

function TxlsImage.GetPictureIndex: integer;
var
  Pictures: TxlsPictures;
  Sheet: TxlsSheet;
begin
  Result := -1;
  if Assigned(FImages) and Assigned(FImages.Holder) then begin
    if FImages.Holder is TQExport3XLS then
      Pictures := (FImages.Holder as TQExport3XLS).Pictures
    else if FImages.Holder is TxlsSheet then begin
      Sheet := FImages.Holder as TxlsSheet;

      if Assigned(Sheet.QExportXLS)
        then Pictures := Sheet.QExportXLS.Pictures
        else Pictures := nil;
    end
    else Pictures := nil;

    if Assigned(Pictures) then begin
      if not Pictures.Find(FPictureName, Result) then
        Result := -1
      else Inc(Result);
    end;
  end;
end;

function TxlsImage.GetAnchor: TMSO_Anchor;
var
  Canvas: TCanvas;
  DC: HDC;
  C2, R2: integer;
  CW, CH: double;
  W, H: double;
  WI, HI: integer;
  Picture: TxlsPicture;
  j: integer;
begin
  if not (Assigned(FQExportXLS) and Assigned(FSheet)) then Exit;

  if not FQExportXLS.Pictures.Find(FPictureName, j) then Exit;

  Picture := FQExportXLS.Pictures[j];

  Result.Col1Offset := 0;
  Result.Row1Offset := 0;

  DC := CreateCompatibleDC(0);
  try
    Canvas := TCanvas.Create;
    try
      Canvas.Handle := DC;
      FQExportXLS.FFontList[0].AssignTo(Canvas.Font);

      WI := 0; HI := 0;
      Picture.GetMeasurements(HI, WI);
      H := HI; W := WI;
      H := Round(H * (FZoom / 100));
      W := Round(W * (FZoom / 100));

      C2 := FCol;
      repeat

        j := C2 - FSheet.StartDataCol;
        if (j >= 0) and (j <= FQExportXLS.FColWidthList.Count - 1) then
        begin
          SetDefaultToFont(Canvas.Font);
          CW := (Integer(FQExportXLS.FColWidthList[j]) + 1) *
            Canvas.TextWidth('0') + 1;
        end
        else CW := (FSheet.DefColWidth + 1) * Canvas.TextWidth('0') + 1;
        Inc(C2);
        W := W - CW;
      until (W < 0);
      if W < 0 then begin
        Dec(C2);
        Result.Col2Offset :=  Round((W + CW) * 1024 / CW);
      end;
      Result.Col1 := FCol;
      Result.Col2 := C2;

    R2 := FRow;
    H := H * 15;
    repeat
      if FQExportXLS.FRowHeightList.Find(IntToStr(R2), j) then
        CH := Integer(FQExportXLS.FRowHeightList.Objects[j])
      else CH := FSheet.DefRowHeight * 20;

      Inc(R2);
      H := H - CH;
    until (H < 0);
      if H < 0 then begin
        Dec(R2, 2);
        Result.Row2Offset := Round((H + CH) * 256 / CH);
      end;
      Result.Row1 := FRow;
      Result.Row2 := R2;
    finally
      Canvas.Free;
    end;
  finally
    DeleteDC(DC);
  end;
end;

{ TxlsImages }

constructor TxlsImages.Create(Holder: TPersistent);
begin
  inherited Create(TxlsImage);
  FHolder := Holder;
end;

function TxlsImages.Add: TxlsImage;
begin
  Result := TxlsImage(inherited Add);
end;

function TxlsImages.Find(const Title: string; var Index: integer): boolean;
var
  i: integer;
begin
  Result := false;
  for i := 0 to Count - 1 do
    if AnsiCompareText(Items[i].Title, Title) = 0 then begin
      Result := true;
      Index := i;
      Break;
    end;
end;

function TxlsImages.GetOwner: TPersistent;
begin
  Result := FHolder;
end;

function TxlsImages.GetItem(Index: integer): TxlsImage;
begin
  Result := inherited GetItem(Index) as TxlsImage;
end;

procedure TxlsImages.SetItem(Index: integer; Value: TxlsImage);
begin
  inherited SetItem(Index, Value);
end;

{ TxlsCell }

constructor TxlsCell.Create(Collection: TCollection);
begin
  inherited;
  FCellType := ctString;
  FCol := 0;
  FDateTimeFormat := SysUtils.Format('%s %s', [SysUtils.ShortDateFormat,
    SysUtils.LongTimeFormat]);
  FFormat := TxlsFormat.Create(nil);
  FNumericFormat := '###,###,#0.00';
  FRow := 0;

  FBooleanValue := false;
  FDateTimeValue := SysUtils.Date;
  FNumericValue := 0;
  FStringValue := EmptyStr;
end;

destructor TxlsCell.Destroy;
begin
  FFormat.Free;
  inherited;
end;

procedure TxlsCell.Assign(Source: TPersistent);
begin
  if Source is TxlsCell then begin
    FCellType := (Source as TxlsCell).FCellType;
    Col := (Source as TxlsCell).Col;
    DateTimeFormat := (Source as TxlsCell).DateTimeFormat;
    Format := (Source as TxlsCell).Format;
    NumericFormat := (Source as TxlsCell).NumericFormat;
    Row := (Source as TxlsCell).Row;
    Value := (Source as TxlsCell).Value;
    Exit;
  end;
  inherited;
end;

function TxlsCell.IsCorrect: boolean;
begin
  Result := (FCol > 0) and (FRow > 0);
//  if not Result then Exit;

//  Result := IsCorrectValue;
end;

function TxlsCell.IsCorrectValue(Value: Variant): boolean;

  function VarToBool(V: Variant): boolean;
  begin
    Result := V;
  end;

  function VarToNumeric(V: Variant): double;
  begin
    Result := V;
  end;

begin
  Result := true;
  try
    case FCellType of
      ctBoolean: VarToBool(Value);
      ctDateTime: VarToDateTime(Value);
      ctNumeric: VarToNumeric(Value);
      ctString: VarToStr(Value);
    end;
  except
    Result := false;
  end;
end;

procedure TxlsCell.SetDefaultValue;
begin
  case FCellType of
    ctBoolean: FBooleanValue := false;
    ctDateTime: FDateTimeValue := SysUtils.Now;
    ctNumeric: FNumericValue := 0;
    else FStringValue := EmptyStr;
  end;
end;

procedure TxlsCell.SaveToIniFile(IniFile: TIniFile; const Section: string);
var
  Year, Month, Day,
  Hour, Min, Sec, MSec: word;
begin
  with IniFile do begin
    WriteInteger(Section, S_XLS_Cell_CellType, Integer(FCellType));
    WriteInteger(Section, S_XLS_Cell_Col, FCol);
    WriteInteger(Section, S_XLS_Cell_Row, FRow);
    WriteString(Section, S_XLS_Cell_DateTimeFormat, FDateTimeFormat);
    WriteString(Section, S_XLS_Cell_NumericFormat, FNumericFormat);

    WriteBool(Section, S_XLS_Cell_BooleanValue, FBooleanValue);

    DecodeDate(FDateTimeValue, Year, Month, Day);
    DecodeTime(FDateTimeValue, Hour, Min, Sec, MSec);
    WriteInteger(Section, S_XLS_Cell_DateTimeValue_Year, Year);
    WriteInteger(Section, S_XLS_Cell_DateTimeValue_Month, Month);
    WriteInteger(Section, S_XLS_Cell_DateTimeValue_Day, Day);
    WriteInteger(Section, S_XLS_Cell_DateTimeValue_Hour, Hour);
    WriteInteger(Section, S_XLS_Cell_DateTimeValue_Min, Min);
    WriteInteger(Section, S_XLS_Cell_DateTimeValue_Sec, Sec);
    WriteInteger(Section, S_XLS_Cell_DateTimeValue_MSec, MSec);

    WriteString(Section, S_XLS_Cell_NumericValue_Separator,
      Char2Str(SysUtils.DecimalSeparator));
    WriteString(Section, S_XLS_Cell_NumericValue,
      FloatToStr(FNumericValue));

    WriteString(Section, S_XLS_Cell_StringValue, FStringValue);
  end;

  FFormat.SaveToIniFile(IniFile, Section);
end;

procedure TxlsCell.LoadFromIniFile(IniFile: TIniFile; const Section: string);
var
  Year, Month, Day,
  Hour, Min, Sec, MSec: word;
  Dt, Tm: TDateTime;
  C, CC: char;
begin
  with IniFile do begin
    FCellType := TxlsCellType(ReadInteger(Section, S_XLS_Cell_CellType,
      Integer(FCellType)));
    FCol := ReadInteger(Section, S_XLS_Cell_Col, FCol);
    FRow := ReadInteger(Section, S_XLS_Cell_Row, FRow);
    FDateTimeFormat := ReadString(Section, S_XLS_Cell_DateTimeFormat, FDateTimeFormat);
    FNumericFormat := ReadString(Section, S_XLS_Cell_NumericFormat, FNumericFormat);

    FBooleanValue := ReadBool(Section, S_XLS_Cell_BooleanValue, FBooleanValue);

    DecodeDate(FDateTimeValue, Year, Month, Day);
    DecodeTime(FDateTimeValue, Hour, Min, Sec, MSec);

    Year := ReadInteger(Section, S_XLS_Cell_DateTimeValue_Year, Year);
    Month := ReadInteger(Section, S_XLS_Cell_DateTimeValue_Month, Month);
    Day := ReadInteger(Section, S_XLS_Cell_DateTimeValue_Day, Day);
    Hour := ReadInteger(Section, S_XLS_Cell_DateTimeValue_Hour, Hour);
    Min := ReadInteger(Section, S_XLS_Cell_DateTimeValue_Min, Min);
    Sec := ReadInteger(Section, S_XLS_Cell_DateTimeValue_Sec, Sec);
    MSec := ReadInteger(Section, S_XLS_Cell_DateTimeValue_MSec, MSec);

    Dt := EncodeDate(Year, Month, Day);
    Tm := EncodeTime(Hour, Min, Sec, MSec);

    FDateTimeValue := Dt + Tm;

    C := SysUtils.DecimalSeparator;
    try
      CC := Str2Char(ReadString(Section, S_XLS_Cell_NumericValue_Separator,
        Char2Str(SysUtils.DecimalSeparator)));
      SysUtils.DecimalSeparator := CC;
      FNumericValue := StrToFloat(ReadString(Section, S_XLS_Cell_NumericValue,
        FloatToStr(FNumericValue)));
    finally
      SysUtils.DecimalSeparator := C;
    end;

    FStringValue := ReadString(Section, S_XLS_Cell_StringValue, FStringValue);
  end;
  FFormat.LoadFromIniFile(IniFile, Section);
end;

function TxlsCell.GetDisplayName: string;
begin
//  if (FCol > 0) and (FRow > 0)
    {then} Result := SysUtils.Format('Col: %d Row: %d ', [FCol, FRow])
    //else Result := inherited GetDisplayName;
end;

function TxlsCell.GetItemType: TxlsItemType;
begin
  Result :=  itCell;
end;

function TxlsCell.GetIsBoolean: boolean;
begin
  Result := FCellType = ctBoolean;
end;

function TxlsCell.GetIsDateTime: boolean;
begin
  Result := FCellType = ctDateTime;
end;

function TxlsCell.GetIsNumeric: boolean;
begin
  Result := FCellType = ctNumeric;
end;

function TxlsCell.GetIsString: boolean;
begin
  Result := FCellType = ctString;
end;

function TxlsCell.GetValue: Variant;
begin
  case FCellType of
    ctBoolean : Result := FBooleanValue;
    ctDateTime: Result := FDateTimeValue;
    ctNumeric : Result := FNumericValue;
    else Result := FStringValue;
  end;
end;

procedure TxlsCell.SetFormat(Value: TxlsFormat);
begin
  FFormat.Assign(Value);
end;

procedure TxlsCell.SetValue(Value: Variant);
begin
  if not IsCorrectValue(Value) then
    SetDefaultValue
  else
    case FCellType of
      ctBoolean : FBooleanValue := Boolean(Value);
      ctDateTime: FDateTimeValue := VarToDateTime(Value);
      ctNumeric : FNumericValue := Double(Value);
      else FStringValue := VarToStr(Value);
    end;
end;

{ TxlsCells }

constructor TxlsCells.Create(Holder: TPersistent);
begin
  inherited Create(TxlsCell);
  FHolder := Holder;
end;

function TxlsCells.Add: TxlsCell;
begin
  Result := inherited Add as TxlsCell;
end;

function TxlsCells.GetOwner: TPersistent;
begin
  Result := FHolder;
end;

function TxlsCells.GetItem(Index: integer): TxlsCell;
begin
  Result := inherited GetItem(Index) as TxlsCell;
end;

procedure TxlsCells.SetItem(Index: integer; Value: TxlsCell);
begin
  inherited SetItem(Index, Value);
end;

{ TxlsMergedCells }

constructor TxlsMergedCells.Create(Collection: Tcollection);
begin
  inherited;
  FFirstCol := 0;
  FFirstRow := 0;
  FLastCol := 0;
  FLastRow := 0;
end;

procedure TxlsMergedCells.Assign(Source: TPersistent);
begin
  if Source is TxlsMergedCells then begin
    FirstCol := (Source as TxlsMergedCells).FirstCol;
    FirstRow := (Source as TxlsMergedCells).FirstRow;
    LastCol := (Source as TxlsMergedCells).LastCol;
    LastRow := (Source as TxlsMergedCells).LastRow;
    Exit;
  end;
  inherited;
end;

procedure TxlsMergedCells.SaveToIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    WriteInteger(Section, S_XLS_MergedCell_FirstCol, FFirstCol);
    WriteInteger(Section, S_XLS_MergedCell_FirstRow, FFirstRow);
    WriteInteger(Section, S_XLS_MergedCell_LastCol, FLastCol);
    WriteInteger(Section, S_XLS_MergedCell_LastRow, FLastRow);
  end;
end;

procedure TxlsMergedCells.LoadFromIniFile(IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    FFirstCol := ReadInteger(Section, S_XLS_MergedCell_FirstCol, FFirstCol);
    FFirstRow := ReadInteger(Section, S_XLS_MergedCell_FirstRow, FFirstRow);
    FLastCol := ReadInteger(Section, S_XLS_MergedCell_LastCol, FLastCol);
    FLastRow := ReadInteger(Section, S_XLS_MergedCell_LastRow, FLastRow);
  end;
end;

function  TxlsMergedCells.GetDisplayName: string;
begin
  {if (FFirstCol > 0) and (FFirstRow > 0) and
     (FLastCol > 0) and (FLastRow > 0) then}
    Result := SysUtils.Format(
      'Merged Cells (%d, %d, %d, %d)', [FFirstCol, FFirstRow, FLastCol, FLastRow])
    //else Result := inherited GetDisplayName;
end;

function TxlsMergedCells.GetItemType: TxlsItemType;
begin
  Result := itMergedCells;
end;

function TxlsMergedCells.IsCorrect: boolean;
begin
  Result := (FFirstCol > 0) and (FFirstRow > 0) and (FLastCol > 0) and
    (FLastRow > 0);
end;

{ TxlsMergedCellList }

constructor TxlsMergedCellList.Create(Holder: TPersistent);
begin
  inherited Create(TxlsMergedCells);
  FHolder := Holder;
end;

function TxlsMergedCellList.Add: TxlsMergedCells;
begin
  Result := inherited Add as TxlsMergedCells;
end;

function TxlsMergedCellList.GetOwner: TPersistent;
begin
  Result := FHolder;
end;

function TxlsMergedCellList.GetItem(Index: integer): TxlsMergedCells;
begin
  Result := inherited GetItem(Index) as TxlsMergedCells;
end;

procedure TxlsMergedCellList.SetItem(Index: integer; Value: TxlsMergedCells);
begin
  inherited SetItem(Index, Value);
end;

{ TXLSOptions }

constructor TXLSOptions.Create;
begin
  inherited Create;
  FPageFooter := 'Page &P of &N';
  FHeaderFormat := TxlsFormat.Create(nil);
  FCaptionsFormat := TxlsFormat.Create(nil);
  SetDefaultXLSCaption(FCaptionsFormat);
  FDataFormat := TxlsFormat.Create(nil);
  FAggregateFormat := TxlsFormat.Create(nil);
  FFooterFormat := TxlsFormat.Create(nil);
  FHyperlinkFormat := TxlsFormat.Create(nil);
  FHyperlinkFormat.Font.Color := clrBlue;
  FHyperlinkFormat.Font.Underline := fulSingle;
  FNoteFormat := TxlsNoteFormat.Create(nil);
  FSheetTitle := 'Sheet 1';
end;

destructor TXLSOptions.Destroy;
begin
  FHeaderFormat.Free;
  FCaptionsFormat.Free;
  FDataFormat.Free;
  FAggregateFormat.Free;
  FFooterFormat.Free;
  FHyperlinkFormat.Free;
  FNoteFormat.Free;
  inherited Destroy;
end;

procedure TXLSOptions.Assign(Source: TPersistent);
begin
  if Source is TXLSOptions then begin
    HeaderFormat := (Source as TXLSOptions).HeaderFormat;
    CaptionsFormat := (Source as TXLSOptions).CaptionsFormat;
    DataFormat := (Source as TXLSOptions).DataFormat;
    AggregateFormat := (Source as TXLSOptions).AggregateFormat;
    FooterFormat := (Source as TXLSOptions).FooterFormat;
    HyperlinkFormat := (Source as TXLSOptions).HyperlinkFormat;
    NoteFormat := (Source as TXLSOptions).NoteFormat;
    Exit;
  end;
  inherited;
end;

procedure TXLSOptions.SetHeaderFormat(const Value: TxlsFormat);
begin
  FHeaderFormat.Assign(Value);
end;

procedure TXLSOptions.SetCaptionsFormat(const Value: TxlsFormat);
begin
  FCaptionsFormat.Assign(Value);
end;

procedure TXLSOptions.SetDataFormat(const Value: TxlsFormat);
begin
  FDataFormat.Assign(Value);
end;

procedure TXLSOptions.SetAggregateFormat(const Value: TxlsFormat);
begin
  FAggregateFormat.Assign(Value);
end;

procedure TXLSOptions.SetFooterFormat(const Value: TxlsFormat);
begin
  FFooterFormat.Assign(Value);
end;

procedure TXLSOptions.SetHyperlinkFormat(const Value: TxlsFormat);
begin
  FHyperlinkFormat.Assign(Value);
end;

procedure TXLSOptions.SetNoteFormat(const Value: TxlsNoteFormat);
begin
  FNoteFormat.Assign(Value);
end;

procedure TXLSOptions.SetSheetTitle(const Value: string);
begin
  if FSheetTitle <> Value then
    if Value <> EmptyStr
      then FSheetTitle := Value
      else FSheetTitle := 'Sheet1';
end;

{ TQXLSWrier }

{$IFNDEF OLE_STREAM}
procedure TQXLSWriter.StreamFinalAction;
var
  FileSize,
  DataBlockCount,
  XBATBlockCount, BATBlockCount, t: integer;
  Strm: TMemoryStream;

  procedure NormalizeStream(Chr: char);
  var
    N: integer;
  begin
    N := Stream.Size mod BLOCK_SIZE;
    if N > 0 then begin
      N := BLOCK_SIZE - N;
      FillChar(FBuffer^, N, Chr);
      Stream.Seek(0, soFromEnd);
      Stream.Write(FBuffer^, N);
    end;
  end;

  procedure WriteProperties;
  begin
    Stream.Seek(0, soFromEnd);
    // Root Entry
    FillChar(FBuffer^, SizeOf(TSTRM_PROPERTY), $00);

    PSTRM_PROPERTY(FBuffer).Name[0] := $52;
    PSTRM_PROPERTY(FBuffer).Name[2] := $6F;
    PSTRM_PROPERTY(FBuffer).Name[4] := $6F;
    PSTRM_PROPERTY(FBuffer).Name[6] := $74;
    PSTRM_PROPERTY(FBuffer).Name[8] := $20;
    PSTRM_PROPERTY(FBuffer).Name[10] := $45;
    PSTRM_PROPERTY(FBuffer).Name[12] := $6E;
    PSTRM_PROPERTY(FBuffer).Name[14] := $74;
    PSTRM_PROPERTY(FBuffer).Name[16] := $72;
    PSTRM_PROPERTY(FBuffer).Name[18] := $79;

    PSTRM_PROPERTY(FBuffer).NameLength := $0016;
    PSTRM_PROPERTY(FBuffer).PropType := $05;
    PSTRM_PROPERTY(FBuffer).NodeColor := $00;
    PSTRM_PROPERTY(FBuffer).PrevProp := -1;
    PSTRM_PROPERTY(FBuffer).NextProp := -1;
    PSTRM_PROPERTY(FBuffer).ChildProp := $0001;

    PSTRM_PROPERTY(FBuffer).StartBlock := -2;
    Stream.Write(FBuffer^, SizeOf(TSTRM_PROPERTY));

    // Workbook
    FillChar(FBuffer^, SizeOf(TSTRM_PROPERTY), $00);

    PSTRM_PROPERTY(FBuffer).Name[0] := $57;
    PSTRM_PROPERTY(FBuffer).Name[2] := $6F;
    PSTRM_PROPERTY(FBuffer).Name[4] := $72;
    PSTRM_PROPERTY(FBuffer).Name[6] := $6B;
    PSTRM_PROPERTY(FBuffer).Name[8] := $62;
    PSTRM_PROPERTY(FBuffer).Name[10] := $6F;
    PSTRM_PROPERTY(FBuffer).Name[12] := $6F;
    PSTRM_PROPERTY(FBuffer).Name[14] := $6B;

    PSTRM_PROPERTY(FBuffer).NameLength := $0012;
    PSTRM_PROPERTY(FBuffer).PropType := $02;
    PSTRM_PROPERTY(FBuffer).NodeColor := $01;
    PSTRM_PROPERTY(FBuffer).PrevProp := -1;
    PSTRM_PROPERTY(FBuffer).NextProp := -1;
    PSTRM_PROPERTY(FBuffer).ChildProp := -1;

    PSTRM_PROPERTY(FBuffer).StartBlock := $00;
    PSTRM_PROPERTY(FBuffer).Size := FileSize;
    Stream.Write(FBuffer^, SizeOf(TSTRM_PROPERTY));
  end;

  procedure WriteDepotBlock;
  var
    i, n: integer;
  begin
    DataBlockCount := Stream.Size div BLOCK_SIZE;
    if Stream.Size > DataBlockCount * BLOCK_SIZE then Inc(DataBlockCount);

    BATBlockCount := 1;

    while (BATBlockCount * DEPOT_CAPACITY) < DataBlockCount + 1 + BATBlockCount do
      Inc(BATBlockCount);

    XBATBlockCount := 0;

    while FIRST_XBAT + (XBATBlockCount) * DEPOT_CAPACITY < BATBlockCount do
      Inc(XBatBlockCount);

    for i := 0 to DataBlockCount - 1 do begin
      n := i + 1;
      Stream.Write(n, SizeOf(Integer));
    end;
    for i := 0 to BATBlockCount - 1 do begin
      n := -3;
      Stream.Write(n, SizeOf(Integer));
    end;
    for i := 0 to XBATBlockCount - 1 do begin
      n := -4;
      Stream.Write(n, SizeOf(Integer));
    end;
    n := -2;
    Stream.Write(n, SizeOf(Integer));
  end;

  procedure WriteHeaderBlock;
  var
    i: integer;
  begin
    FillChar(FBuffer^, BLOCK_SIZE, -1);
    PSTRM_HEADER(FBuffer).F01[0] := $D0;
    PSTRM_HEADER(FBuffer).F01[1] := $CF;
    PSTRM_HEADER(FBuffer).F01[2] := $11;
    PSTRM_HEADER(FBuffer).F01[3] := $E0;
    PSTRM_HEADER(FBuffer).F01[4] := $A1;
    PSTRM_HEADER(FBuffer).F01[5] := $B1;
    PSTRM_HEADER(FBuffer).F01[6] := $1A;
    PSTRM_HEADER(FBuffer).F01[7] := $E1;

    PSTRM_HEADER(FBuffer).F02 := $0000;
    PSTRM_HEADER(FBuffer).F03 := $0000;
    PSTRM_HEADER(FBuffer).F04 := $0000;
    PSTRM_HEADER(FBuffer).F05 := $0000;

    PSTRM_HEADER(FBuffer).F06 := $3E;
    PSTRM_HEADER(FBuffer).F07 := $03;
    PSTRM_HEADER(FBuffer).F08 := $FFFE;
    PSTRM_HEADER(FBuffer).F09 := $09;
    PSTRM_HEADER(FBuffer).F10 := $0006;

    PSTRM_HEADER(FBuffer).F11 := $0000;
    PSTRM_HEADER(FBuffer).F12 := $0000;

    PSTRM_HEADER(FBuffer).F13 := BATBlockCount;
    PSTRM_HEADER(FBuffer).F14 := DataBlockCount + BATBlockCount + XBATBlockCount;

    PSTRM_HEADER(FBuffer).F15 := $0000;
    PSTRM_HEADER(FBuffer).F16 := $1000;
    PSTRM_HEADER(FBuffer).F17 := -2;
    PSTRM_HEADER(FBuffer).F18 := $0001;
    if XBATBlockCount > 0
      then PSTRM_HEADER(FBuffer).F19 := DataBlockCount + BATBlockCount
      else PSTRM_HEADER(FBuffer).F19 := -2;
    PSTRM_HEADER(FBuffer).F20 := XBATBlockCount;

    for i := 0 to MinimumInt(BatBlockCount - 1, 108) do
      PSTRM_HEADER(FBuffer).F21[i] := DataBlockCount + i;

    Strm.Size := 0;
    Strm.CopyFrom(Stream, 0);
    Stream.Seek(BLOCK_SIZE, soFromBeginning);
    Stream.CopyFrom(Strm, 0);
    Stream.Seek(0, soFromBeginning);
    Stream.Write(FBuffer^, SizeOf(TSTRM_HEADER));
  end;

  procedure WriteXBAT;
  var
    i, t: integer;
  begin
    if XBATBlockCount > 0 then
      for i := 109 to BATBlockCount - 1 do begin
        t := DataBlockCount + i;
        Stream.Write(t, SizeOf(Integer));
      end;
  end;

begin
  FileSize := Stream.Size;
  Strm := TMemoryStream.Create;
  try
    NormalizeStream(#$00);
    while Stream.Size < 6144 do begin
      t := $0000;
      Stream.Write(t, SizeOf(Integer));
      NormalizeStream(#$00);
    end;
    FileSize := Stream.Size;
    WriteDepotBlock;
    NormalizeStream(#$FF);
    WriteXBAT;
    NormalizeStream(#$FF);
    WriteProperties;
    NormalizeStream(#$FF);
    WriteHeaderBlock;
  finally
    Strm.Free
  end;
end;
{$ENDIF}

{ TxlsSheet }

constructor TxlsSheet.Create(Collection: TCollection);
begin
  inherited;
  if Assigned(Collection) then begin
    FQExportXLS := TxlsSheets(Collection).QExportXLS;
    FTitle := Format('Sheet %d', [FQExportXLS.Sheets.Count]);
  end;
  FAutoCalcColWidth := false;
  FOptions := TXLSOptions.Create;
  FFieldFormats := TxlsFieldFormats.Create(Self);
  FStripStyles := TxlsFormats.Create(Self);
  FHyperlinks := TxlsHyperlinks.Create(Self);
  FNotes := TxlsNotes.Create(Self);
  FCharts := TxlsCharts.Create(Self);
  FImages := TxlsImages.Create(Self);
  FCells := TxlsCells.Create(Self);
  FMergedCells := TxlsMergedCellList.Create(Self);
  FBackground := TxlsGraphic.Create(nil);
  FStripType := ssNone;
  FExportSource := esDataSet;
  FExportedFields := TStringList.Create;
  FHeaderRows := 0;
  FStartDataCol := 0;
  FFooterRows := 0;
  FHeader := TStringList.Create;
  FCaptions := TStringList.Create;
  FFooter := TStringList.Create;
  FFormats := TQExportFormats.Create;
  FUserFormats := TStringList.Create;
  FColumnsWidth := TStringList.Create;
  if Assigned(Collection) then begin
    FColumns := TQExportColumns.Create(Self, QExportXLS.NormalString);
    FExportRow := TQExportRow.Create(Columns, FFormats, nil);
  end;
  FAllowCaptions := true;
  FGoToFirstRecord := true;
  FExportRecCount := 0;
  FSkipRecCount := 0;
  FCurrentRecordOnly := false;
  FOnlyVisibleFields := true;
  FAutoCalcStrType := false;
  FCaptionRow := -1;
  FExported := true;
  FTag := 0;

  FDefRowHeight := DEF_ROW_HEIGHT;
  FDefColWidth := DEF_COL_WIDTH;

  FColumnList := TxlsColumnList.Create;
end;

destructor TxlsSheet.Destroy;
begin
  FColumnList.Free;
  FOptions.Free;
  FFieldFormats.Free;
  FStripStyles.Free;
  FHyperlinks.Free;
  FNotes.Free;
  FCharts.Free;
  FImages.Free;
  FCells.Free;
  FMergedCells.Free;
  FBackground.Free;
  FExportedFields.Free;
  FHeader.Free;
  FCaptions.Free;
  FFooter.Free;
  FFormats.Free;
  FUserFormats.Free;
  FColumnsWidth.Free;
  if Assigned(FExportRow) then FExportRow.Free;
  if Assigned(FColumns) then FColumns.Free;
  inherited;
end;

procedure TxlsSheet.Assign(Source: TPersistent);
begin
  if Source is TxlsSheet then begin
    AutoCalcColWidth := (Source as TxlsSheet).AutoCalcColWidth;
    Title := (Source as TxlsSheet).Title;
    Options := (Source as TxlsSheet).Options;
    FieldFormats := (Source as TxlsSheet).FieldFormats;
    StripStyles := (Source as TxlsSheet).StripStyles;
    StripType := (Source as TxlsSheet).StripType;
    Hyperlinks := (Source as TxlsSheet).Hyperlinks;
    Notes := (Source as TxlsSheet).Notes;
    Charts := (Source as TxlsSheet).Charts;
    Images := (Source as TxlsSheet).Images;
    Cells := (Source as TxlsSheet).Cells;
    MergedCells := (Source as TxlsSheet).MergedCells;
    Background := (Source as TxlsSheet).Background;
    ExportSource := (Source as TxlsSheet).ExportSource;
    DataSet := (Source as TxlsSheet).DataSet;
    CustomSource := (Source as TxlsSheet).CustomSource;
    {$IFNDEF NOGUI}
    ListView := (Source as TxlsSheet).ListView;
    DBGrid := (Source as TxlsSheet).DBGrid;
    StringGrid := (Source as TxlsSheet).StringGrid;
    {$ENDIF}
    ExportedFields := (Source as TxlsSheet).ExportedFields;
    HeaderRows := (Source as TxlsSheet).HeaderRows;
    StartDataCol := (Source as TxlsSheet).StartDataCol;
    FooterRows := (Source as TxlsSheet).FooterRows;
    Header := (Source as TxlsSheet).Header;
    Captions := (Source as TxlsSheet).Captions;
    Footer := (Source as TxlsSheet).Footer;
    Formats := (Source as TxlsSheet).Formats;
    UserFormats := (Source as TxlsSheet).UserFormats;
    ColumnsWidth := (Source as TxlsSheet).ColumnsWidth;
    AllowCaptions := (Source as TxlsSheet).AllowCaptions;
    GoToFirstRecord := (Source as TxlsSheet).GoToFirstRecord;
    ExportRecCount := (Source as TxlsSheet).ExportRecCount;
    SkipRecCount := (Source as TxlsSheet).SkipRecCount;
    CurrentRecordOnly := (Source as TxlsSheet).CurrentRecordOnly;
    OnlyVisibleFields := (Source as TxlsSheet).OnlyVisibleFields;
    AutoCalcStrType := (Source as TxlsSheet).AutoCalcStrType;
    CaptionRow := (Source as TxlsSheet).CaptionRow;
    Exit;
  end;
  inherited;
end;

function TxlsSheet.GetDisplayName: string;
begin
  Result := inherited GetDisplayName;
  if FTitle <> EmptyStr then Result := FTitle;
end;

procedure TxlsSheet.LoadFromQExportXLS;
begin
  AutoCalcColWidth := QExportXLS.AutoCalcColWidth;
  Title := QExportXLS.Options.SheetTitle;
  Options := QExportXLS.Options;
  FieldFormats := QExportXLS.FieldFormats;
  StripType := QExportXLS.StripType;
  StripStyles := QExportXLS.StripStyles;
  Hyperlinks := QExportXLS.Hyperlinks;
  Notes := QExportXLS.Notes;
  Charts := QExportXLS.Charts;
  Images := QExportXLS.Images;
  Cells := QExportXLS.Cells;
  MergedCells := QExportXLS.MergedCells;
  Background := QExportXLS.Background;
  ExportSource := QExportXLS.ExportSource;
  DataSet := QExportXLS.DataSet;
  CustomSource := QExportXLS.CustomSource;
  {$IFNDEF NOGUI}
  ListView := QExportXLS.ListView;
  DBGrid := QExportXLS.DBGrid;
  StringGrid := QExportXLS.StringGrid;
  {$ENDIF}
  ExportedFields := QExportXLS.ExportedFields;
  HeaderRows := QExportXLS.HeaderRows;
  StartDataCol := QExportXLS.StartDataCol;
  FooterRows := QExportXLS.FooterRows;
  Header := QExportXLS.Header;
  Captions := QExportXLS.Captions;
  Footer := QExportXLS.Footer;
  Formats := QExportXLS.Formats;
  UserFormats := QExportXLS.UserFormats;
  ColumnsWidth := QExportXLS.ColumnsWidth;
  AllowCaptions := QExportXLS.AllowCaptions;
  GoToFirstRecord := QExportXLS.GoToFirstRecord;
  ExportRecCount := QExportXLS.ExportRecCount;
  SkipRecCount := QExportXLS.SkipRecCount;
  CurrentRecordOnly := QExportXLS.CurrentRecordOnly;
  OnlyVisibleFields := QExportXLS.OnlyVisibleFields;
  AutoCalcStrType := QExportXLS.AutoCalcStrType;
  CaptionRow := QExportXLS.CaptionRow;
end;

procedure TxlsSheet.SaveToQExportXLS;
begin
  QExportXLS.AutoCalcColWidth := AutoCalcColWidth;
  QExportXLS.Options.SheetTitle := Title;
  QExportXLS.Options := Options;
  QExportXLS.FieldFormats := FieldFormats;
  QExportXLS.StripType := StripType;
  QExportXLS.StripStyles := StripStyles;
  QExportXLS.Hyperlinks := Hyperlinks;
  QExportXLS.Notes := Notes;
  QExportXLS.Charts := Charts;
  QExportXLS.Images := Images;
  QExportXLS.Cells := Cells;
  QExportXLS.MergedCells := MergedCells;
  QExportXLS.Background := Background;
  QExportXLS.ExportSource := ExportSource;
  QExportXLS.DataSet := DataSet;
  QExportXLS.CustomSource := CustomSource;
  {$IFNDEF NOGUI}
  QExportXLS.ListView := ListView;
  QExportXLS.DBGrid := DBGrid;
  QExportXLS.StringGrid := StringGrid;
  {$ENDIF}
  QExportXLS.ExportedFields := ExportedFields;
  QExportXLS.HeaderRows := HeaderRows;
  QExportXLS.StartDataCol := StartDataCol;
  QExportXLS.FooterRows := FooterRows;
  QExportXLS.Header := Header;
  QExportXLS.Captions := Captions;
  QExportXLS.Footer := Footer;
  QExportXLS.Formats := Formats;
  QExportXLS.UserFormats := UserFormats;
  QExportXLS.ColumnsWidth := ColumnsWidth;
  QExportXLS.AllowCaptions := AllowCaptions;
  QExportXLS.GoToFirstRecord := GoToFirstRecord;
  QExportXLS.ExportRecCount := ExportRecCount;
  QExportXLS.SkipRecCount := SkipRecCount;
  QExportXLS.CurrentRecordOnly := CurrentRecordOnly;
  QExportXLS.OnlyVisibleFields := OnlyVisibleFields;
  QExportXLS.AutoCalcStrType := AutoCalcStrType;
  QExportXLS.CaptionRow := CaptionRow;
end;

function TxlsSheet.AddBooleanCell(Col, Row: word; Value: boolean): TxlsCell;
begin
  Result := FCells.Add;
  Result.CellType := ctBoolean;
  Result.Col := Col;
  Result.Row := Row;
  Result.Value := Value;
end;

function TxlsSheet.AddDateTimeCell(Col, Row: word; DateTimeFormat: string;
  Value: TDateTime): TxlsCell;
begin
  Result := FCells.Add;
  Result.CellType := ctDateTime;
  Result.Col := Col;
  Result.DateTimeFormat := DateTimeFormat;
  Result.Row := Row;
  Result.Value := Value;
end;

function TxlsSheet.AddNumericCell(Col, Row: word; NumericFormat: string;
  Value: double): TxlsCell;
begin
  Result := FCells.Add;
  Result.CellType := ctNumeric;
  Result.Col := Col;
  Result.NumericFormat := NumericFormat;
  Result.Row := Row;
  Result.Value := Value;
end;

function TxlsSheet.AddStringCell(Col, Row: word; const Value: string): TxlsCell;
begin
  Result := FCells.Add;
  Result.CellType := ctString;
  Result.Col := Col;
  Result.Row := Row;
  Result.Value := Value;
end;

function TxlsSheet.AddMergedCells(FirstRow, LastRow, FirstCol,
  LastCol: word): TxlsMergedCells;
begin
  Result := FMergedCells.Add;
  Result.FirstRow := FirstRow;
  Result.LastRow := LastRow;
  Result.FirstCol := FirstCol;
  Result.LastCol := LastCol;
end;

function TxlsSheet.GetWriter: TQXLSWriter;
begin
  Result := QExportXLS.GetWriter;
end;

function TxlsSheet.GetStartDataRow: word;
begin
  Result := 0;
  if Header.Count > 0 then begin
    Result := Header.Count;
    if (FHeaderRows > 0) and
       (FHeaderRows < Header.Count) then
      Result := FHeaderRows;
  end;
  Inc(Result, Integer(AllowCaptions));
end;

function TxlsSheet.IsTitle: boolean;
begin
  Result := Ftitle <> EmptyStr;
end;

procedure TxlsSheet.SetOptions(const Value: TXLSOptions);
begin
  FOptions.Assign(Value);
end;

procedure TxlsSheet.SetFieldFormats(const Value: TxlsFieldFormats);
begin
  FFieldFormats.Assign(Value);
end;

procedure TxlsSheet.SetStripStyles(const Value: TxlsFormats);
begin
  FStripStyles.Assign(Value);
end;

procedure TxlsSheet.SetHyperlinks(const Value: TxlsHyperlinks);
begin
  FHyperlinks.Assign(Value);
end;

procedure TxlsSheet.SetNotes(const Value: TxlsNotes);
begin
  FNotes.Assign(Value);
end;

procedure TxlsSheet.SetCharts(const Value: TxlsCharts);
begin
  FCharts.Assign(Value);
end;

procedure TxlsSheet.SetImages(const Value: TxlsImages);
begin
  FImages.Assign(Value);
end;

procedure TxlsSheet.SetCells(const Value: TxlsCells);
begin
  FCells.Assign(Value);
end;

procedure TxlsSheet.SetMergedCells(const Value: TxlsMergedCellList);
begin
  FMergedCells.Assign(Value);
end;

procedure TxlsSheet.SetBackground(const Value: TxlsGraphic);
begin
  FBackground.Assign(Value);
end;

procedure TxlsSheet.SetExportedFields(const Value: TStrings);
begin
  FExportedFields.Assign(Value);
end;

procedure TxlsSheet.SetHeader(const Value: TStrings);
begin
  FHeader.Assign(Value);
end;

procedure TxlsSheet.SetCaptions(const Value: TStrings);
begin
  FCaptions.Assign(Value);
end;

procedure TxlsSheet.SetFooter(const Value: TStrings);
begin
  FFooter.Assign(Value);
end;

procedure TxlsSheet.SetFormats(const Value: TQExportFormats);
begin
  FFormats.Assign(Value);
end;

procedure TxlsSheet.SetUserFormats(const Value: TStrings);
begin
  FUserFormats.Assign(Value);
end;

procedure TxlsSheet.SetColumnsWidth(const Value: TStrings);
begin
  FColumnsWidth.Assign(Value);
end;

function TxlsSheet.GetExportStage: TxlsExportStage;
begin
  Result := QExportXLS.ExportStage;
end;

procedure TxlsSheet.SetExportStage(const Value: TxlsExportStage);
begin
  if QExportXLS.FExportStage <> Value then
    QExportXLS.FExportStage := Value;
end;

function TxlsSheet.IsDefRowHeight: boolean;
begin
  Result := FDefRowHeight <> DEF_ROW_HEIGHT;
end;

function TxlsSheet.AddXF(TextFormat: string; Format: TxlsFormat): word;
var
  i, j: integer;
  TxtFmt: TxlsTextFormat;
  XFmt: TxlsXFormat;
  Fnt: TxlsFont;
begin
  Result := DEFAULT_FORMAT;

  if (TextFormat = DEFAULT_TEXT_FORMAT) and not Assigned(Format) then Exit;
  //if not Assigned(Format) then Exit;
  if TextFormat = EmptyStr then TextFormat := DEFAULT_TEXT_FORMAT;

  TxtFmt := nil;
  Fnt := nil;
  // text format
  if TextFormat <> DEFAULT_TEXT_FORMAT then
  begin
    TxtFmt := TxlsTextFormat.Create;
    TxtFmt.FormatString := TextFormat;
  end;
  // x format
  XFmt := TxlsXFormat.Create(nil, TxtFmt);

  if Assigned(Format) then
  begin
    if not Options.DataFormat.Font.IsEqual(Format.Font) then
    begin
      Fnt := TxlsFont.Create;
      Fnt.Assign(Format.Font);
    end;
    XFmt.Borders.Assign(Format.Borders);
    XFmt.Fill.Assign(Format.Fill);
    XFmt.Alignment.Assign(Format.Alignment);
    XFmt.Wrap := Format.Wrap;
  end;
  XFmt.Font := Fnt;

  i := QExportXLS.FXFormatList.FormatIndexByFormat(XFmt);

  if i = -1 then
  begin
    if Assigned(Fnt) then
    begin
      j := QExportXLS.FFontList.ListIndexByFont(Fnt);
      if j = -1 then
      begin
        Inc(QExportXLS.FLastFont);
        Fnt.FFontIndex := QExportXLS.FLastFont;
        QExportXLS.FFontList.Add(Fnt);
      end
      else begin
        Fnt.Free;
        XFmt.Font := QExportXLS.FFontList[j];
      end;
    end;
    if Assigned(TxtFmt) then
    begin
      j := QExportXLS.FTextFormatList.ListIndexByString(TxtFmt.FormatString);
      if j = -1 then begin
        Inc(QExportXLS.FLastTextFormat);
        TxtFmt.FormatIndex := QExportXLS.FLastTextFormat;
        QExportXLS.FTextFormatList.Add(TxtFmt);
      end
      else begin
        TxtFmt.Free;
        XFmt.TextFormat := QExportXLS.FTextFormatList[j];
      end;
    end;
    // writing XF
    Inc(QExportXLS.FLastFormat);
    Result := QExportXLS.FLastFormat;
    XFmt.FormatIndex := QExportXLS.FLastFormat;
    QExportXLS.FXFormatList.Add(XFmt);
  end
  else begin
    if Assigned(TxtFmt) then TxtFmt.Free;
    if Assigned(Fnt) then Fnt.Free;
    if Assigned(XFmt) then XFmt.Free;
    Result := i;
  end;
end;

function TxlsSheet.GetXF(ColIndex: integer): integer;
var
  F: TxlsFormat;
  tfmt, sName: string;
begin
  sName := Columns[ColIndex].Name;
  Result := QExportXLS.FXFormatFieldList.FormatIndexByFieldName(Index, sName);

  if (Result = DEFAULT_FORMAT) and (QExportXLS.FXFormatColRowList.Count > 0) then
    case FStripType of
      ssCol: Result := QExportXLS.FXFormatColRowList.XFIndexByNumber(Index, ColIndex);
      ssRow: Result := QExportXLS.FXFormatColRowList.XFIndexByNumber(Index,
        (RecordCounter mod FStripStyles.Count) * 1000 + ColIndex);
    end;

  if Assigned(QExportXLS.OnGetDataParams) then
  begin
    F := TxlsFormat.Create(nil);
    try
      if Result = DEFAULT_FORMAT then
      begin
        F.Assign(Options.DataFormat);
        tfmt := DEFAULT_TEXT_FORMAT;
      end
      else begin
        F.LoadFromTxlsXFormat(QExportXLS.FXFormatList.FormatByFormatIndex(Result));
        if Assigned(QExportXLS.FXFormatList.FormatByFormatIndex(Result).TextFormat) then
          tfmt := QExportXLS.FXFormatList.FormatByFormatIndex(Result).TextFormat.FormatString;
      end;
      if Assigned(QExportXLS.OnGetDataParams) then
        QExportXLS.OnGetDataParams(Self, Index, ColIndex + FStartDataCol,
          CurrentRow, F, tfmt);
      if tfmt = EmptyStr then
        tfmt := Columns[ColIndex].Format;
      Result := AddXF(tfmt, F);
    finally
      F.Free;
    end;
  end;
end;

procedure TxlsSheet.AddColumnToFormatList(ColIndex: integer);
var
  i: integer;
  fmt: word;
  s, sName: string;
  XFmtFld: TxlsXFormatField;
begin
  sName := Columns[ColIndex].Name;
  s := DEFAULT_TEXT_FORMAT;

  s := Columns[ColIndex].Format;

  // x format
  i := FieldFormats.IndexByName(sName);
  if i > -1 then
    fmt := AddXF(s, FieldFormats.Items[i])
  else
    fmt := AddXF(s, nil);

  if fmt = DEFAULT_FORMAT then Exit;

  i := QExportXLS.FXFormatFieldList.ListIndexByFieldName(Index, sName);
  if i = -1 then
  begin
    XFmtFld := TxlsXFormatField.Create;
    XFmtFld.FieldName := sName;
    XFmtFld.SheetIndex := Index;
    XFmtFld.XFormat := QExportXLS.FXFormatList[QExportXLS.FXFormatList.ListIndexByFormatIndex(fmt)];
    QExportXLS.FXFormatFieldList.Add(XFmtFld);
  end;
end;

procedure TxlsSheet.AddStylesToFormatList;
var
  i, N, j, k: integer;
  TxtFmt: string;
  Fmt: TxlsXFormatColRow;
  XF: word;
begin
  N := StripStyles.Count;
  if N = 0 then Exit;

  case FStripType of
    ssCol:
      for i := 0 to Columns.Count - 1 do begin
        TxtFmt := Columns[i].Format;
        XF := AddXF(TxtFmt, StripStyles[i mod N]);
        Fmt := TxlsXFormatColRow.Create;
        Fmt.Number := i;
        j := QExportXLS.FXFormatList.ListIndexByFormatIndex(XF);
        Fmt.XFormat := QExportXLS.FXFormatList[j];
        Fmt.FSheetIndex := Index;
        QExportXLS.FXFormatColRowList.Add(Fmt);
      end;
    ssRow:
      for i := 0 to StripStyles.Count - 1 do
        for j := 0 to Columns.Count - 1 do begin
          TxtFmt := Columns[j].Format;
          XF := AddXF(TxtFmt, StripStyles[i]);
          Fmt := TxlsXFormatColRow.Create;
          Fmt.Number := i * 1000 + j;
          k := QExportXLS.FXFormatList.ListIndexByFormatIndex(XF);
          Fmt.XFormat := QExportXLS.FXFormatList[k];
          Fmt.FSheetIndex := Index;
          QExportXLS.FXFormatColRowList.Add(Fmt);
        end;
  end;
end;

procedure TxlsSheet.HeaderFooter(HeaderFooter: TStrings; Limit: word;
  Event: TGetHeaderFooterParamsEvent; Fmt: TxlsFormat);
var
  Cnt, i: word;
  k, l, m, XF: integer;
  j: byte;
  T: string;
  S: WideString;
begin
   if Limit > 0 then Cnt := Limit
   else Cnt := HeaderFooter.Count;

   if Cnt = 0 then Exit;

   for i := 0 to Cnt - 1 do begin
     try T := HeaderFooter.Strings[i]; except T := EmptyStr; end;
     for j := 0 to High(Byte) do begin
       if (HeaderFooter.Count > 0) and (HeaderFooter.Count >= i + 1) then begin
         S := EmptyStr;
         if T <> EmptyStr then
           if Byte(T[Length(T)]) <> VK_TAB then T := T + Chr(VK_TAB);
           m := 1;
           l := 0;
           for k := 1 to Length(T) do begin
             if Byte(T[k]) = VK_TAB then begin
               if l = j then begin
                 S := Copy(T, m, k - m);
                 Break;
               end;
               Inc(l);
               m := k + 1;
             end;
           end;
         end
         else S := EmptyStr;

       if Assigned(Event) then Event(Self, Index, j, CurrentRow, Fmt, S);

       if S <> EmptyStr then begin
         XF := AddXF(DEFAULT_TEXT_FORMAT, Fmt);
         QExportXLS.FBoundSheetList.CheckCell(Index, CurrentRow, j);
         QExportXLS.WriteLabelSST(CurrentRow, j, XF, S);
         if FNeedCheckRowHeight then
           QExportXLS.CheckRowHeight(XF, CurrentRow);
         S := EmptyStr;
       end;
     end;
     Inc(FCurrentRow);
   end;
end;

procedure TxlsSheet.InitExport;
var
  i, j: integer;
begin
  FCurrentRow := 0;
  FTotalCols := 0;
  FRecordCounter := 0;

  Columns.Clear;
  Columns.Fill(false);

  FExportRow.Clear;
  FExportRow.Index.Clear;

  for i := 0 to Columns.Count - 1 do begin
    FExportRow.Add(Columns[i].Name, i);
    FExportRow.Index.AddObject(Columns[i].Name, TObject(i));
  end;
  FExportRow.Index.Sort;

  AddStylesToFormatList;
  if (StripType = ssNone) or (StripStyles.Count = 0) then
    for i := 0 to Columns.Count - 1 do
      AddColumnToFormatList(i);

  FNeedCheckRowHeight := false;
  for i := 0 to FImages.Count - 1 do
    if FQExportXLS.Pictures.Find(FImages[i].PictureName, j) then begin
      FNeedCheckRowHeight := true;
      Break;
    end;
end;

procedure TxlsSheet.DoHeader;
begin
  ExportStage := esHeader;
  HeaderFooter(Header, HeaderRows, QExportXLS.OnGetHeaderParams,
    Options.HeaderFormat);
end;

procedure TxlsSheet.DoCaption;
var
  i: integer;
  F: TxlsFormat;
  XF: word;
  Str: string;
begin
  ExportStage := esCaption;
  DoBeforeData;
  for i := 0 to Columns.Count - 1 do begin
    F := TxlsFormat.Create(nil);
    try
      F.Assign(Options.CaptionsFormat);
      Str := Columns[i].Caption;
      if Assigned(QExportXLS.OnGetCaptionParams) then
        QExportXLS.OnGetCaptionParams(Self, Index, i + StartDataCol, F, Str);
      if Str <> EmptyStr then begin
        if not F.IsDefault
          then XF := AddXF(DEFAULT_TEXT_FORMAT, F)
          else XF := DEFAULT_FORMAT;
        QExportXLS.FBoundSheetList.CheckCell(Index, CurrentRow, i + StartDataCol);
        QExportXLS.WriteLabelSST(CurrentRow, i + StartDataCol, XF, Str);
        if FAutoCalcColWidth then
          QExportXLS.RecalculateColWidth(Str, XF, i);
      end;
    finally
      F.Free;
    end;
  end;
  Inc(FCurrentRow, Integer(AllowCaptions));
end;

procedure TxlsSheet.DoBeforeData;
var
  i: integer;
  F: TxlsFormat;
  Str: WideString;
  XF: word;
begin
  if not Assigned(QExportXLS.OnGetBeforeDataParams) then Exit;
  for i := 0 to StartDataCol - 1 do begin
    F := TxlsFormat.Create(nil);
    try
      F.Assign(Options.DataFormat);
      Str := EmptyStr;
      QExportXLS.OnGetBeforeDataParams(Self, Index, i, CurrentRow, F, Str);
      if Str <> EmptyStr then begin
        XF := AddXF(DEFAULT_TEXT_FORMAT, F);
        QExportXLS.FBoundSheetList.CheckCell(Index, CurrentRow, i);
        QExportXLS.WriteLabelSST(CurrentRow, i, XF, Str);
      end;
    finally
      F.Free;
    end;
  end;
end;

procedure TxlsSheet.FillExportRow;
var
  i: integer;
  str: string;
begin
  for i := 0 to FColumns.Count - 1 do begin
    str := QExportGetColData(FExportSource, FDataSet, FCustomSource,
      {$IFNDEF NOGUI}FDBGrid, FListView, FStringGrid,{$ENDIF}
      FColumns, FFormats, QExportXLS.NormalString, i, FRecordCounter,
      FSkipRecCount, false);
    FExportRow.SetValue(Columns[i].Name, str);
  end;
end;

procedure TxlsSheet.DoData;
var
  i: integer;
  XF: word;
  Str: WideString;
  dbl: double;
  dt: TDateTime;
  bool: boolean;
begin
  DoBeforeData;

  // export
  ExportStage := esData;
  for i := 0 to ExportRow.Count - 1 do begin
    Str := ExportRow[i].Value; //???

    FColumnList.CheckCell(ExportRow[i].Name, CurrentRow, i + StartDataCol);

    if Assigned(QExportXLS.OnGetExportText) then
      QExportXLS.OnGetExportText(Self, i, Str);
    if Assigned(QExportXLS.OnAdvancedGetExportText) then
      QExportXLS.OnAdvancedGetExportText(Self, Index, i, Str);

    XF := GetXF(i);

    if Str = EmptyStr then begin
      QExportXLS.FBoundSheetList.CheckCell(Index, CurrentRow, i + StartDataCol);
      QExportXLS.WriteBlank(CurrentRow, i + StartDataCol, XF);
    end
    else begin
      if AnsiCompareStr(Str, Formats.NULLString) = 0 then begin
        QExportXLS.FBoundSheetList.CheckCell(Index, CurrentRow, i + StartDataCol);
        QExportXLS.WriteLabelSST(CurrentRow, i + StartDataCol, XF, Str);
      end
      else begin
        case Columns[i].ColType of
          ectBoolean: begin
            bool := AnsiCompareText(Str, Formats.BooleanTrue) = 0;
            QExportXLS.FBoundSheetList.CheckCell(Index, CurrentRow, i + StartDataCol);
            QExportXLS.WriteBoolErr(CurrentRow, i + StartDataCol, XF, bool);
          end;
          ectInteger,
          ectBigint,
          ectFloat,
          ectCurrency: begin
            try dbl := StrToFloat(Str); except dbl := 0; end;
            QExportXLS.FBoundSheetList.CheckCell(Index, CurrentRow, i + StartDataCol);
            QExportXLS.WriteNumber(CurrentRow, i + FStartDataCol, XF, dbl);
          end;
          ectDate,
          ectTime,
          ectDateTime: begin
            try dt := StrToDateTime(Str); except dt := 0; end;
            if dt > 1 then begin
              if dt <= 60 then begin
                QExportXLS.FBoundSheetList.CheckCell(Index, CurrentRow, i + StartDataCol);
                QExportXLS.WriteNumber(CurrentRow, i + StartDataCol, XF, dt - 1);
              end
              else begin
                QExportXLS.FBoundSheetList.CheckCell(Index, CurrentRow, i + StartDataCol);
                QExportXLS.WriteNumber(CurrentRow, i + StartDataCol, XF, dt);
              end
            end
            else begin
              Str := FormatDateTime(Columns[i].Format, dt);
              QExportXLS.FBoundSheetList.CheckCell(Index, CurrentRow, i + StartDataCol);
              QExportXLS.WriteLabelSST(CurrentRow, i + FStartDataCol, XF, Str);
            end;
          end;
          ectString: begin
            QExportXLS.FBoundSheetList.CheckCell(Index, CurrentRow, i + StartDataCol);
            QExportXLS.WriteLabelSST(CurrentRow, i + StartDataCol, XF, Str);
          end;
        end;
      end;
    end;
    if FAutoCalcColWidth then
      QExportXLS.RecalculateColWidth(Str, XF, i);
    if FNeedCheckRowHeight then
      QExportXLS.CheckRowHeight(XF, CurrentRow);
  end;
  Inc(FCurrentRow);
end;

procedure TxlsSheet.DoAggregate;
var
  i, j: integer;
  F: TxlsFormat;
  XF: word;
  Str, tfmt: string;
  NeedIncRow, AggregateExists: boolean;
begin
  AggregateExists := false;
  Columns.EmptyTags;
  for i := 0 to FieldFormats.Count - 1 do begin
    j := Columns.IndexOfName(FieldFormats[i].FieldName);
    if (j > -1) and (FieldFormats[i].Aggregate <> aggNone) then begin
      if not AggregateExists then AggregateExists := true;
      Columns[j].Tag := i + 1;
    end;
  end;

  if AggregateExists then begin
    ExportStage := esAggregate;

    NeedIncRow := false;
    for i := 0 to Columns.Count - 1 do
      if Columns[i].Tag <> 0 then begin
        F := TxlsFormat.Create(nil);
        try
          F.Assign(Options.AggregateFormat);
          tfmt := Columns[i].Format;
          if tfmt = EmptyStr then tfmt := DEFAULT_TEXT_FORMAT;
          Str := EmptyStr;
          if Assigned(QExportXLS.OnGetAggregateParams) then
              QExportXLS.OnGetAggregateParams(Self, Index, i, F, tfmt, Str);
          if tfmt = EmptyStr then tfmt := DEFAULT_TEXT_FORMAT;
          XF := DEFAULT_FORMAT;
          if (tfmt <> DEFAULT_TEXT_FORMAT) or not F.IsDefault then
            XF := AddXF(tfmt, F);
        finally
          F.Free;
        end;
        QExportXLS.FBoundSheetList.CheckCell(Index, CurrentRow, i + StartDataCol);
        QExportXLS.WriteAggregate(CurrentRow, i + StartDataCol, StartDataRow,
          CurrentRow - 1, FieldFormats[Columns[i].Tag - 1].Aggregate, XF);
        if FNeedCheckRowHeight then
          QExportXLS.CheckRowHeight(XF, CurrentRow);
        if not NeedIncRow then NeedIncRow := true;
      end
      else begin
        if Assigned(QExportXLS.OnGetAggregateParams) then begin
          F := TxlsFormat.Create(nil);
          try
            F.Assign(Options.AggregateFormat);
            tfmt := DEFAULT_TEXT_FORMAT;
            Str := EmptyStr;
            QExportXLS.OnGetAggregateParams(Self, Index, i, F, tfmt, Str);
            if Str <> EmptyStr then begin
              tfmt := DEFAULT_TEXT_FORMAT;
              XF := AddXF(tfmt, F);
              QExportXLS.FBoundSheetList.CheckCell(Index, CurrentRow, i + StartDataCol);
              QExportXLS.WriteLabelSST(CurrentRow, i + StartDataCol, XF, Str);
              if not NeedIncRow then NeedIncRow := true;
              if FAutoCalcColWidth then
                QExportXLS.RecalculateColWidth(Str, XF, i);
              if FNeedCheckRowHeight then
                QExportXLS.CheckRowHeight(XF, CurrentRow);
            end;
          finally
            F.Free;
          end;
        end;
      end;
    if NeedIncRow then Inc(FCurrentRow);
  end;
end;

procedure TxlsSheet.DoFooter;
begin
  ExportStage := esFooter;
  HeaderFooter(Footer, FooterRows, QExportXLS.OnGetFooterParams,
    Options.FooterFormat);
end;

{ TxlsSheets }

constructor TxlsSheets.Create(QExportXLS: TQExport3XLS);
begin
  inherited Create(TxlsSheet);
  FQExportXLS := QExportXLS;
end;

function TxlsSheets.GetOwner: TPersistent;
begin
  Result := FQExportXLS;
end;

function TxlsSheets.Add: TxlsSheet;
begin
  Result := TxlsSheet(inherited Add);
end;

function TxlsSheets.GetItem(Index: integer): TxlsSheet;
begin
  Result := inherited GetItem(Index) as TxlsSheet;
end;

procedure TxlsSheets.SetItem(Index: integer; Value: TxlsSheet);
begin
  inherited SetItem(Index, Value);
end;

{ TxlsBoundSheet }

constructor TxlsBoundSheet.Create;
begin
  inherited;
  FFirstRow := -1;
  FLastRow := -1;
  FFirstCol := -1;
  FLastCol := -1;
end;

{ TxlsBoundSheetList }

function TxlsBoundSheetList.Add(Item: TxlsBoundSheet): integer;
begin
  Result := inherited Add(Item);
end;

procedure TxlsBoundSheetList.CheckCell(SheetIndex, Row, Col: integer);
var
  N: integer;
begin
  N := IndexOfSheetIndex(SheetIndex);
  if N > -1 then begin
    if (Row < Items[N].FirstRow) or (Items[N].FirstRow = -1) then
      Items[N].FirstRow := Row;
    if (Row > Items[N].LastRow) or (Items[N].LastRow = -1) then
      Items[N].LastRow := Row;
    if (Col < Items[N].FirstCol) or (Items[N].FirstCol = -1) then
      Items[N].FirstCol := Col;
    if (Col > Items[N].LastCol) or (Items[N].LastCol = -1) then
      Items[N].LastCol := Col;
  end;
end;

procedure TxlsBoundSheetList.Delete(Index: integer);
begin
  TxlsBoundSheet(Items[Index]).Free;
  inherited;
end;

function TxlsBoundSheetList.Get(Index: integer): TxlsBoundSheet;
begin
  Result := TxlsBoundSheet(inherited Get(Index));
end;

function TxlsBoundSheetList.IndexOfSheetIndex(SheetIndex: integer): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if Items[i].Index = SheetIndex then begin
      Result := i;
      Break;
    end;
end;

procedure TxlsBoundSheetList.Put(Index: integer; Value: TxlsBoundSheet);
begin
  inherited Put(Index, Value);
end;

{ TxlsColumn }

constructor TxlsColumn.Create(const Name: string);
begin
  inherited Create;
  FName := Name;
  FCol1 := -1;
  FRow1 := -1;
  FCol2 := -1;
  FRow2 := -1;
end;

{ TxlsColumnList }

function TxlsColumnList.Add(Item: TxlsColumn): integer;
begin
  Result := inherited Add(Item);
end;

procedure TxlsColumnList.CheckCell(const ColName: string; Row, Col: integer);
var
  N: integer;
begin
  N := IndexOf(ColName);

  if N = -1 then
    N := Add(TxlsColumn.Create(ColName));
  if (Row < Items[N].Row1) or (Items[N].Row1 = -1) then
    Items[N].Row1 := Row;
  if (Row > Items[N].Row2) or (Items[N].Row2 = -1) then
    Items[N].Row2 := Row;
  if (Col < Items[N].Col1) or (Items[N].Col1 = -1) then
    Items[N].Col1 := Col;
  if (Col > Items[N].Col2) or (Items[N].Col2 = -1) then
    Items[N].Col2 := Col;
end;

procedure TxlsColumnList.AssignColumnToDataRange(const ColName: string;
  DataRange: TxlsDataRange);
var
  N: integer;
begin
  if not Assigned(DataRange) then Exit;
  N := IndexOf(ColName);
  if N = -1 then Exit;
  DataRange.Col1 := Items[N].Col1 + 1;
  DataRange.Row1 := Items[N].Row1 + 1;
  DataRange.Col2 := Items[N].Col2 + 1;
  DataRange.Row2 := Items[N].Row2 + 1;
end;

procedure TxlsColumnList.Delete(Index: integer);
begin
  TxlsColumn(Items[Index]).Free;
  inherited;
end;

function TxlsColumnList.Get(Index: integer): TxlsColumn;
begin
  Result := TxlsColumn(inherited Get(Index));
end;

procedure TxlsColumnList.Put(Index: integer; Value: TxlsColumn);
begin
  inherited Put(Index, Value);
end;

function TxlsColumnList.IndexOf(const ColName: string): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if AnsiCompareText(Items[i].Name, ColName) = 0 then begin
      Result := i;
      Break;
    end;
end;

{ TQExport3XLS }

constructor TQExport3XLS.Create(AOwner: TComponent);
var
  i: integer;
begin
  inherited;
  FOptions := TXLSOptions.Create;
  FFieldFormats := TxlsFieldFormats.Create(Self);
  FStripStyles := TxlsFormats.Create(Self);
  FStripType := ssNone;
  FHyperlinks := TxlsHyperlinks.Create(Self);
  FNotes := TxlsNotes.Create(Self);
  FCharts := TxlsCharts.Create(Self);
  FSheets := TxlsSheets.Create(Self);
  FPictures := TxlsPictures.Create(Self);
  FImages := TxlsImages.Create(Self);
  FCells := TxlsCells.Create(Self);
  FMergedCells := TxlsMergedCellList.Create(Self);
  FBackground := TxlsGraphic.Create(nil);
  FExportStage := esNone;
  FHeaderRows := 0;
  FStartDataCol := 0;
  FFooterRows := 0;
  AutoCalcColWidth := false;
  for i := 0 to 15 do
    ExtendedPalette[i] := XLS_STANDARD_PALETTE[i + 40];
end;

destructor TQExport3XLS.Destroy;
begin
  FOptions.Free;
  FFieldFormats.Free;
  FStripStyles.Free;
  FHyperlinks.Free;
  FNotes.Free;
  FCharts.Free;
  FSheets.Free;
  FPictures.Free;
  FImages.Free;
  FCells.Free;
  FMergedCells.Free;
  FBackground.Free;
  inherited;
end;

procedure TQExport3XLS.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  i: integer;
begin
  inherited;
  if Operation = opRemove then
    for i := 0 to FSheets.Count - 1 do
      if AComponent = FSheets[i].DataSet then FSheets[i].DataSet := nil
      else if AComponent = FSheets[i].CustomSource then
        FSheets[i].CustomSource := nil
      {$IFNDEF NOGUI}
      else if AComponent = FSheets[i].ListView then FSheets[i].ListView := nil
      else if AComponent = FSheets[i].DBGrid then FSheets[i].DBGrid := nil
      else if AComponent = FSheets[i].StringGrid then FSheets[i].StringGrid := nil;
      {$ENDIF}
end;


procedure TQExport3XLS.Execute;
var
  Dir: string;
  {$IFNDEF OLE_STREAM}
  FS: TFileStream;
  {$ENDIF}
begin
  CheckTrial;
  if FileName = EmptyStr then
    raise Exception.Create({$IFDEF WIN32}QExportLoadStr(QEM_FileNotPresent){$ENDIF}
                           {$IFDEF LINUX}QEM_FileNotPresent{$ENDIF});

  Dir := ExtractFileDir(FileName);
  if Dir = EmptyStr then Dir := ExtractFilePath(ParamStr(0));
  if not DirectoryExists(Dir) then begin
    ForceDirectories(Dir);
    if not DirectoryExists(Dir) then
      raise Exception.CreateFmt({$IFDEF WIN32}QExportLoadStr(QEM_DirNotFound){$ENDIF}
                                {$IFDEF LINUX}QEM_DirNotFound{$ENDIF}, [Dir]);
  end;

  {$IFDEF OLE_STREAM}
  CreateLocalVariables;
  try
    DoExport;
  finally
    FreeLocalVariables;
  end;

  {$ELSE}
  FS := TFileStream.Create(FileName, fmCreate);
  try
    FWriter := GetWriterClass.Create(Self, FS);
    try
      DoExport;
    finally
      FWriter.Free;
    end;
  finally
    FS.Free;
  end;
  {$ENDIF}
  ShowResult;
end;

function TQExport3XLS.AddBooleanCell(Col, Row: word; Value: boolean): TxlsCell;
begin
  Result := FCells.Add;
  Result.CellType := ctBoolean;
  Result.Col := Col;
  Result.Row := Row;
  Result.Value := Value;
end;

function TQExport3XLS.AddDateTimeCell(Col, Row: word; DateTimeFormat: string;
  Value: TDateTime): TxlsCell;
begin
  Result := FCells.Add;
  Result.CellType := ctDateTime;
  Result.DateTimeFormat := DateTimeFormat;
  Result.Col := Col;
  Result.Row := Row;
  Result.Value := Value;
end;

function TQExport3XLS.AddNumericCell(Col, Row: word; NumericFormat: string;
  Value: double): TxlsCell;
begin
  Result := FCells.Add;
  Result.CellType := ctNumeric;
  Result.NumericFormat := NumericFormat;
  Result.Col := Col;
  Result.Row := Row;
  Result.Value := Value;
end;

function TQExport3XLS.AddStringCell(Col, Row: word; const Value: string): TxlsCell;
begin
  Result := FCells.Add;
  Result.CellType := ctString;
  Result.Col := Col;
  Result.Row := Row;
  Result.Value := Value;
end;

function TQExport3XLS.AddMergedCells(FirstRow, LastRow, FirstCol,
  LastCol: word): TxlsMergedCells;
begin
  Result := FMergedCells.Add;
  Result.FirstRow := FirstRow;
  Result.LastRow := LastRow;
  Result.FirstCol := FirstCol;
  Result.LastCol := LastCol;
end;

procedure TQExport3XLS.DefineExtendedColor(Index: TExtendedColorIndex;
  Color: TColor);
begin
  ExtendedPalette[Index] := Color;
end;

function TQExport3XLS.GetWriter: TQXLSWriter;
begin
  Result := TQXLSWriter(inherited GetWriter);
end;

function TQExport3XLS.GetWriterClass: TQExportWriterClass;
begin
  Result := TQXLSWriter;
end;

procedure TQExport3XLS.DoExport;
var
  ExportedSheetCount, i, j: integer;
  NoSheets: boolean;
  Accept: boolean;
begin
  WriteGlobals;

  ExportedSheetCount := 0;
  for i := 0 to FSheets.Count - 1 do
  begin
    if FSheets[i].Exported then
      Inc(ExportedSheetCount);
  end;    

  NoSheets := (FSheets.Count = 0) or (ExportedSheetCount = 0);
  try
    if NoSheets then
      FSheets.Add.LoadFromQExportXLS;
    FTotalCounter := 0;

    for i := 0 to FSheets.Count - 1 do
    begin
      if not FSheets[i].Exported then
        Continue;
      try
        QExportCheckSource(FSheets[i].ExportSource, FSheets[i].DataSet,
          FSheets[i].CustomSource {$IFNDEF NOGUI}, FSheets[i].DBGrid,
          FSheets[i].ListView, FSheets[i].StringGrid{$ENDIF});
      except
        on E:Exception do
        begin
          raise Exception.CreateFmt({$IFDEF WIN32}QExportLoadStr(QEM_DefineSheetError){$ENDIF}
                                    {$IFDEF LINUX}QEM_DefineSheetError{$ENDIF}, [FSheets[i].Title, E.Message]);
        end;
      end;

    BeginExport;

      if not QExportIsActive(FSheets[i].ExportSource,
        FSheets[i].DataSet, FSheets[i].CustomSource
        {$IFNDEF NOGUI}, FSheets[i].DBGrid, FSheets[i].ListView,
        FSheets[i].StringGrid{$ENDIF})
      then raise Exception.CreateFmt({$IFDEF WIN32}QExportLoadStr(QEM_ExportSourceNotActive){$ENDIF}
                                     {$IFDEF LINUX}QEM_ExportSourceNotActive{$ENDIF},
                                     [QExportSourceAsString(FSheets[i].ExportSource)]);

      if (not ExportEmpty) and
         QExportIsEmpty(FSheets[i].ExportSource, FSheets[i].DataSet,
         FSheets[i].CustomSource {$IFNDEF NOGUI}, FSheets[i].DBGrid,
         FSheets[i].ListView, FSheets[i].StringGrid{$ENDIF})
      then raise Exception.CreateFmt({$IFDEF WIN32}QExportLoadStr(QEM_ExportSourceEmpty){$ENDIF}
                                     {$IFDEF LINUX}QEM_ExportSourceEmpty{$ENDIF},
                                     [QExportSourceAsString(FSheets[i].ExportSource)]);
    end;

    BeforeExport;
    if Aborted then
      Exit;
    //if Assigned(OnBeginExport) then OnBeginExport(Self);
    for i := 0 to Sheets.Count - 1 do
    begin
      with Sheets[i] do
      begin
        if not Exported then Continue;
        if Assigned(FOnBeforeExportSheet) then
          FOnBeforeExportSheet(Self, i);
        QExportDisableControls(FExportSource, FDataSet, FCustomSource
          {$IFNDEF NOGUI}, FDBGrid, FListView, FStringGrid{$ENDIF});
        try
          InitExport;
          Aborted := false;

          FColWidthList.Clear;
          for j := 0 to FColumns.Count - 1 do
            FColWidthList.Add(Pointer(FColumns[j].Width));

          {$IFNDEF NOGUI}
          case FExportSource of
            esListView: begin
              FSkipRecCount := MinimumInt(FSkipRecCount, FListView.Items.Count);
              if FExportRecCount > 0 then
                FExportRecCount := MinimumInt(FExportRecCount, FListView.Items.Count);
            end;
          end;
          {$ENDIF}

          FTotalCols := FColumns.Count + FStartDataCol;

          WriteSheetStart(Sheets[i]);
          DoHeader;
          if Aborted then Exit;

          if Aborted then Exit;
          if AllowCaptions then DoCaption;
          if Aborted then Exit;
          if GoToFirstRecord then
            QExportFirst(FExportSource, FDataSet, FCustomSource
              {$IFNDEF NOGUI}, FDBGrid, FListView, FStringGrid {$ENDIF});
          QExportSkip(FExportSource, FDataSet, FCustomSource,
          {$IFNDEF NOGUI}FDBGrid, FListView, FStringGrid,{$ENDIF} FSkipRecCount,
          OnSkippedRecord, Self, FRecordCounter);
          if Aborted then
            Exit;
          FRecordCounter := 0;

          while not QExportEof(FExportSource, FDataSet, FCustomSource,
            {$IFNDEF NOGUI}FDBGrid, FListView, FStringGrid,{$ENDIF}
            RecordCounter, FExportRecCount, FSkipRecCount) and
            ((FExportRecCount = 0) or
             (RecordCounter < FExportRecCount)) do
          begin
            if Aborted and not CanContinue then
              Break;
            FillExportRow;
            Accept := true;
            if Assigned(OnBeforeExportRow) then
              OnBeforeExportRow(Self, ExportRow, Accept);
            if Accept and Assigned(OnAdvancedBeforeExportRow) then
              OnAdvancedBeforeExportRow(Self, i, ExportRow, Accept);
            if Accept then
              DoData;
            if FCurrentRecordOnly then
              Break
            else begin
                QExportNext(FExportSource, FDataSet, FCustomSource,
                  {$IFNDEF NOGUI}FDBGrid, FListView, FStringGrid,{$ENDIF}
                  FRecordCounter);
                Inc(FTotalCounter);
                if Assigned(OnExportedRecord) then
                  OnExportedRecord(Self, FTotalCounter);
                if Assigned(FOnAdvancedExportedRecord) then
                  FOnAdvancedExportedRecord(Self, i, Sheets[i].FRecordCounter);
              end;
{$IFDEF WIN32}
              Sleep(0);
{$ENDIF}
          end;
          DoAggregate;
          if FAutoCalcColWidth then
            CorrectColInfo;
          DoFooter;
          WriteSheetFinish(Sheets[i]);
        finally
          QExportEnableControls(FExportSource, FDataSet, FCustomSource
            {$IFNDEF NOGUI}, FDBGrid, FListView, FStringGrid{$ENDIF});
        end;
        if Assigned(FOnAfterExportSheet) then
          FOnAfterExportSheet(Self, i);
      end;
    end;
    WriteGlobalInset;
    AfterExport;
    EndExport;
  finally
    if NoSheets then
      Sheets[Sheets.Count - 1].Free;
  end;
end;

procedure TQExport3XLS.SetOptions(const Value: TXLSOptions);
begin
  FOptions.Assign(Value);
end;

procedure TQExport3XLS.SetFieldFormats(const Value: TxlsFieldFormats);
begin
  FFieldFormats.Assign(Value);
end;

procedure TQExport3XLS.SetStripStyles(const Value: TxlsFormats);
begin
  FStripStyles.Assign(Value);
end;

procedure TQExport3XLS.SetHyperlinks(const Value: TxlsHyperlinks);
begin
  FHyperlinks.Assign(Value);
end;

procedure TQExport3XLS.SetNotes(const Value: TxlsNotes);
begin
  FNotes.Assign(Value);
end;

procedure TQExport3XLS.SetCharts(const Value: TxlsCharts);
begin
  FCharts.Assign(Value);
end;

procedure TQExport3XLS.SetSheets(const Value: TxlsSheets);
begin
  FSheets.Assign(Value);
end;

procedure TQExport3XLS.SetPictures(const Value: TxlsPictures);
begin
  FPictures.Assign(Value);
end;

procedure TQExport3XLS.SetImages(const Value: TxlsImages);
begin
  FImages.Assign(Value);
end;

procedure TQExport3XLS.SetCells(const Value: TxlsCells);
begin
  FCells.Assign(Value);
end;

procedure TQExport3XLS.SetMergedCells(const Value: TxlsMergedCellList);
begin
  FMergedCells.Assign(Value);
end;

procedure TQExport3XLS.SetBackground(const Value: TxlsGraphic);
begin
  FBackground.Assign(Value);
end;

procedure TQExport3XLS.CreateLocalVariables;
begin
  FTextFormatList := TxlsTextFormatList.Create;
  FFontList := TxlsFontList.Create;
  FXFormatList := TxlsXFormatList.Create;
  FXFormatFieldList := TxlsXFormatFieldList.Create;
  FXFormatColRowList := TxlsXFormatColRowList.Create;

  FBoundSheetList := TxlsBoundSheetList.Create;
  FSSTStrings := TsstStrings.Create;

  FLastTextFormat := $31;
  FLastFormat := DEFAULT_FORMAT;
  FLastFont := 4;

  FColWidthList := TList.Create; // for AutoCalcColWidht
  FRowHeightList := TSTringList.Create; //for Pictures

  FStream := CreateXLSStream(FileName, FIStorage, FIStream);
  GetMem(FBuffer, MAX_RECORD_DATA_SIZE);
end;

procedure TQExport3XLS.FreeLocalVariables;
begin
  FreeMem(FBuffer);
  if Assigned(FStream) then begin
    FStream.Free;
    FStream := nil;
  end;

  FIStream := nil;
  FIStorage := nil;

  if Assigned(FSSTStrings) then FSSTStrings.Free;
  if Assigned(FBoundSheetList) then FBoundSheetList.Free;
  if Assigned(FTextFormatList) then FTextFormatList.Free;
  if Assigned(FFontList) then FFontList.Free;
  if Assigned(FXFormatList) then FXFormatList.Free;
  if Assigned(FXFormatFieldList) then FXFormatFieldList.Free;
  if Assigned(FXFormatColRowList) then FXFormatColRowList.Free;

  if Assigned(FColWidthList) then begin
    FColWidthList.Free;
    FColWidthList := nil;
  end;
  if Assigned(FRowHeightList) then begin
    FRowHeightList.Free;
    FRowHeightList := nil;
  end;
end;

procedure TQExport3XLS.WriteGlobalInset;
var
  Sz, Ln, Ps, i, N, j: integer;
  xlsFont: TxlsFont;
  biffFont: TbiffFont;
  biffFormat: TbiffFormat;
  biffXF: TbiffXF;
  biffStyle: TbiffStyle;
  biffBoundSheet: TbiffBoundSheet;
  biffCountry: TbiffCountry;
  biffSupbook: TbiffSupbookInternal;
  biffExternSheet: TbiffExternSheet;
  biffMSODrawingGroup: TbiffMSODrawingGroup;
  XTI: TBIFF_XTI;
  DggContainer: TmsoContainer;
  BsoContainer: TmsoContainer;
  OPT: TmsoOPT;
  MemStream, SubStream: TMemoryStream;
  Buff: PByteArray;
  S: string;
  PT: TxlsPictureType;
  W: word;
begin
  // Dimensions
  j := FStream.Position;
  for i := 0 to FBoundSheetList.Count - 1 do begin
    if (FBoundSheetList[i].FirstRow > -1) and
       (FBoundSheetList[i].LastRow > -1)  and
       (FBoundSheetList[i].FirstCol > -1) and
       (FBoundSheetList[i].LastCol > -1) then begin
      FStream.Seek(FBoundSheetList[i].FDimensionPos + SizeOf(TBIFF_Header), soFromBeginning);
      FBoundSheetList[i].LastRow := FBoundSheetList[i].LastRow + 1;
      FBoundSheetList[i].LastCol := FBoundSheetList[i].LastCol + 1;
      FStream.Write(FBoundSheetList[i].FirstRow, SizeOf(Integer));
      FStream.Write(FBoundSheetList[i].LastRow, SizeOf(Integer));
      FStream.Write(FBoundSheetList[i].FirstCol, SizeOf(Word));
      FStream.Write(FBoundSheetList[i].LastCol, SizeOf(Word));
    end;
  end;
  FStream.Seek(j, soFromBeginning);

  MemStream := TMemoryStream.Create;
  try
   // default fonts
    xlsFont := TxlsFont.Create;
    try
      Ln := Length(xlsFont.Name);
      Sz := SizeOf(TBIFF_FONT) - 65536 + Ln * 2;
      GetMem(Buff, Sz);
      biffFont := TbiffFont.Create(nil, BIFF_FONT, Sz, Buff);
      try
        xlsFont.AssignToBinary(biffFont);
        for i := 1 to 4 do
          biffFont.Save(MemStream);
      finally
        biffFont.Free;
      end;
    finally
      xlsFont.Free;
    end;

    // user defined fonts
    for i := 0 to FFontList.Count - 1 do begin
      Ln := Length(FFontList[i].Name);
      Sz := SizeOf(TBIFF_FONT) - 65536 + Ln * 2;
      GetMem(Buff, Sz);
      biffFont := TbiffFont.Create(nil, BIFF_FONT, Sz, Buff);
      try
        FFontList[i].AssignToBinary(biffFont);
        biffFont.Save(MemStream);
      finally
        biffFont.Free;
      end;
    end;

    // formats
    for i := 0 to FTextFormatList.Count - 1 do begin
      Ln := Length(FTextFormatList[i].FormatString);
      S := EmptyStr;
      for j := 1 to Ln do
        S := S + FTextFormatList[i].FormatString[j];
      Ln := Length(S);
      Sz := 5 + Ln * 2;
      GetMem(Buff, Sz);
      biffFormat := TbiffFormat.Create(nil, BIFF_FORMAT, Sz, Buff);
      try
        biffFormat.ID := FTextFormatList[i].FormatIndex;
        biffFormat.FormatLen := Ln;
        biffFormat.FormatOpt := 1;
        biffFormat.Format := S;
        biffFormat.Save(MemStream);
      finally
        biffFormat.Free;
      end;
    end;


    // xfs
    Sz := SizeOf(TBIFF_XF);
    GetMem(Buff, Sz);
    biffXF := TBiffXF.Create(nil, BIFF_XF, Sz, Buff);
    try
      // default xfs
      for i := 0 to 15 do begin
        FillChar(Buff^, Sz, $0);
        PBIFF_XF(biffXF.Data)^ := XF_DEFAULT[i];
        biffXF.Save(MemStream);
      end;
      // user defined xfs
      for i := 0 to FXFormatList.Count - 1 do begin
        FillChar(Buff^, Sz, $0);
        FXFormatList[i].AssignToBinary(biffXF);
        biffXF.Save(MemStream);
      end;
    finally
      biffXF.Free;
    end;

    // styles
    Sz := SizeOf(TBIFF_STYLE);
    GetMem(Buff, Sz);
    biffStyle := TBiffStyle.Create(nil, BIFF_STYLE, Sz, Buff);
    try
      // default styles
      for i := 0 to 5 do begin
        FillChar(Buff^, Sz, $0);
        PBIFF_STYLE(biffStyle.Data)^ := STYLE_DEFAULT[i];
        biffStyle.Save(MemStream);
      end;
    finally
      biffStyle.Free;
    end;

    // palette
    Sz := 2 + 2 + 2 + 56 * 4;
    GetMem(Buff, Sz);
    try
      FillChar(Buff^, Sz, $0);
      N := 0;
      W := BIFF_PALETTE;
      Move(W, Buff[N], 2);
      Inc(N, 2);
      Ln := Sz - 4;
      Move(Ln, Buff[N], 2);
      Inc(N, 2);
      Ps := 56;
      Move(Ps, Buff[N], 2);
      Inc(N, 2);
      for i := 0 to 55 do begin
        if (i + 8 >= $18) and (i + 8 <= 27) then begin
          Move(ExtendedPalette[i + 8 - $18], Buff[N], SizeOf(Integer));
          Inc(N, SizeOf(Integer));
        end
        else begin
          for j := 0 to 55 do begin
            if COLOR_INDEX[j] = i + 8 then begin
              Move(XLS_STANDARD_PALETTE[j], Buff[N], SizeOf(Integer));
              Inc(N, SizeOf(Integer));
              Break;
            end;
          end;
        end;
      end;
      MemStream.Write(Buff^, Sz);
    finally
      FreeMem(Buff);
    end;

    // boundsheets
    for i := 0 to FBoundSheetList.Count - 1 do begin
      FBoundSheetList[i].AddPos := MemStream.Position;
      Ln := Length(FBoundSheetList[i].Title);
      Sz := SizeOf(TBIFF_BOUNDSHEET) - 65536 + Ln * 2;
      GetMem(Buff, Sz);
      biffBoundSheet := TbiffBoundSheet.Create(nil, BIFF_BOUNDSHEET, Sz, Buff);
      try
        biffBoundSheet.Clear;
        biffBoundSheet.BOFPos := 0;
        biffBoundSheet.Visibility := 0;
        biffBoundSheet.SheetType := 0;
        biffBoundSheet.NameLen := Ln;
        biffBoundSheet.NameOpt := 1;
        biffBoundSheet.Name := FBoundSheetList[i].Title;
        biffBoundSheet.Save(MemStream);
      finally
        biffBoundSheet.Free;
      end;
    end;

    // country
    Sz := SizeOf(TBIFF_COUNTRY);
    GetMem(Buff, Sz);
    biffCountry := TbiffCountry.Create(nil, BIFF_COUNTRY, Sz, Buff);
    try
      biffCountry.CountryDef := 1;
      biffCountry.CountryWinIni := 1;
      biffCountry.Save(MemStream);
    finally
      biffCountry.Free;
    end;

    N := 0; j := 0;

    // charts
    for i := 0 to Sheets.Count - 1 do begin
      Inc(N, Sheets[i].Charts.Count);
      Inc(j);
    end;

    if N > 0 then begin
      // supbook
      Sz := SizeOf(TBIFF_SUPBOOK_INTERNAL);
      GetMem(Buff, Sz);
      FillChar(Buff^, Sz, $0);
      biffSupbook := TbiffSupbookInternal.Create(nil, BIFF_SUPBOOK, Sz, Buff);
      try
        biffSupbook.SheetCount := Sheets.Count;
        biffSupbook.Save(MemStream);
      finally
        biffSupbook.Free;
      end;

      // externsheet
      Sz := 2 + j * SizeOf(TBIFF_XTI);
      GetMem(Buff, Sz);
      FillChar(Buff^, Sz, $0);
      biffExternSheet := TbiffExternSheet.Create(nil, BIFF_EXTERNSHEET, Sz, Buff);
      try
        biffExternSheet.RefCount := j;
        for i := 0 to j - 1 do begin
          Move(Buff^[2 + i * SizeOf(TBIFF_XTI)], XTI, SizeOf(TBIFF_XTI));
          XTI.Supbook := 0;
          XTI.FirstTab := i;
          XTI.LastTab := i;
          Move(XTI, Buff^[2 + i * SizeOf(TBIFF_XTI)], SizeOf(TBIFF_XTI));
        end;
        biffExternSheet.Save(MemStream);
      finally
        biffExternSheet.Free;
      end;
    end;

    // notes
    for i := 0 to Sheets.Count - 1 do
      Inc(N, Sheets[i].Notes.Count);

    // images
    for i := 0 to Sheets.Count - 1 do
      Inc(N, Sheets[i].Images.Count);

    if N > 0 then begin
      // msodrawing
      DggContainer := TmsoContainer.Create(MSO_DGGCONTAINER, $0F, $00);
      try
        OPT := TmsoOPT.Create($03,$03);
        try
          DggContainer.Children.Add(TmsoDgg.Create($00, $00, N));

          // pictures
          if FPictures.Count > 0 then begin
            BsoContainer := TmsoContainer.Create(MSO_BSTORECONTAINER, $0F, $02);
            for i := 0 to FPictures.Count - 1 do begin
              if FPictures[i].Stream.Size = 0 then begin
                PT := ptUndefined;
                if FileExists(FPictures[i].FileName) then
                  PT := PictureTypeByFileName(FPictures[i].FileName);

                if PT <> ptUndefined then begin
                  BsoContainer.Children.Add(
                    TmsoBSEData.Create($02, $05, FPictures[i].FileName, nil,
                      Integer(PT), FPictures[i].CalcRefCount));
                  BsoContainer.Children.Add(TmsoBLIPData.Create($00, $46A,
                    FPictures[i].FileName, nil, Integer(PT)));
                end;
              end
              else begin
              end;
            end;
            DggContainer.Children.Add(BsoContainer);
          end;

          //OPT.Values.Add(TmsoOPTData.Create($00BE, $08000008)); // Colour lineColor
          OPT.Values.Add(TmsoOPTData.Create($00BF, $00080008)); // bool fFitTextToShape
          OPT.Values.Add(TmsoOPTData.Create($0181, $08000009)); // Colour fillColor
          OPT.Values.Add(TmsoOPTData.Create($01C0, $08000040)); // Colour lineColor
          DggContainer.Children.Add(OPT);
          DggContainer.Children.Add(TmsoSplitMenuColors.Create($00, $04));

          Sz := DggContainer.Size;
          GetMem(Buff, Sz);
          Ps := 0;
          DggContainer.AssignToByteArray(Buff, Ps);


          biffMSODrawingGroup := TbiffMSODrawingGroup.CreateEx(nil,
            BIFF_MSODRAWINGGROUP, Sz, Buff);
          try
            biffMSODrawingGroup.Save(MemStream);
          finally
            biffMSODrawingGroup.Free;
          end;
        finally
          OPT.Free;
        end;
      finally
        DggContainer.Free;
      end;
    end;

    // sst
    FSSTStrings.Save(MemStream);

    // recalculating the boundsheet's bof position
    for i := 0 to FBoundSheetList.Count - 1 do begin
      MemStream.Seek(FBoundSheetList[i].AddPos + SizeOf(TBIFF_Header), soFromBeginning);
      Ps := FBoundSheetList[i].BOFPos + MemStream.Size;
      MemStream.Write(Ps , SizeOf(Integer));
    end;

    // saving to base stream
    SubStream := TMemoryStream.Create;
    try
      FStream.Seek(FGlobalsInset, soFromBeginning);
      SubStream.Position := 0;
      SubStream.CopyFrom(FStream, FStream.Size - FStream.Position);
      FStream.Seek(FGlobalsInset, soFromBeginning);
      MemStream.Position := 0;
      FStream.CopyFrom(MemStream, MemStream.Size);
      SubStream.Position := 0;
      FStream.CopyFrom(SubStream, SubStream.Size);
      FStream.Seek(0, soFromEnd);
    finally
      SubStream.Free;
    end;
  finally
    MemStream.Free;
  end;
end;

procedure TQExport3XLS.WriteRecord(ID, Length: word);
begin
  if FStream.Write(ID, SizeOf(ID)) <> SizeOf(ID) then
    raise Exception.Create(sCannotWrite);
  if FStream.Write(Length, SizeOf(Length)) <> SizeOf(Length) then
    raise Exception.Create(sCannotWrite);
  if Length > 0 then
    if FStream.Write(FBuffer^, Length) <> Length then
      raise Exception.Create(sCannotWrite);
end;

procedure TQExport3XLS.WriteWordRecord(ID, Value: word);
var
  Sz: word;
begin
  Sz := SizeOf(Word);
  Move(Value, FBuffer^, Sz);
  WriteRecord(ID, Sz);
end;

procedure TQExport3XLS.WriteBOF(BOFType: word);
var
  Sz: integer;
begin
  Sz := SizeOf(TBIFF_BOF);
  FillChar(FBuffer^, Sz, $0);
  PBIFF_BOF(FBuffer).Version      := $0600;
  PBIFF_BOF(FBuffer).DataType     := BOFType;
  PBIFF_BOF(FBuffer).BuildID      := $0DBB;
  PBIFF_BOF(FBuffer).BuildYear    := $07CC;
  PBIFF_BOF(FBuffer).HistoryFlags := $0;
  PBIFF_BOF(FBuffer).LowVersion   := $0206;
  WriteRecord(BIFF_BOF, Sz);
end;

procedure TQExport3XLS.WriteWriteAccess;
var
  str: string;
  Sz: integer;
begin
  Sz := 112;
  FillChar(FBuffer^, Sz, $20);
  FBuffer[0] := 1;
  FBuffer[1] := 0;
  FBuffer[2] := 0;
  str := Format('%s %s', [S_PRODUCT_NAME, S_VERSION]);
  Move(str[1], FBuffer[3], Length(str));
  WriteRecord(BIFF_WRITEACCESS, Sz);
end;

procedure TQExport3XLS.WriteWindow1;
var
  Sz: integer;
begin
  Sz := SizeOf(TBIFF_WINDOW1);
  FillChar(FBuffer^, Sz, $0);
  PBIFF_WINDOW1(FBuffer).Left         := $0078;
  PBIFF_WINDOW1(FBuffer).Top          := $0078;
  PBIFF_WINDOW1(FBuffer).Width        := $5D0c;
  PBIFF_WINDOW1(FBuffer).Height       := $3D68;
  PBIFF_WINDOW1(FBuffer).Options      := $0038;
  PBIFF_WINDOW1(FBuffer).ActiveSheet  := $0000;
  PBIFF_WINDOW1(FBuffer).FirstVisible := $0000;
  PBIFF_WINDOW1(FBuffer).SelectCount  := $0001;
  PBIFF_WINDOW1(FBuffer).TabWidth     := $0258;
  WriteRecord(BIFF_WINDOW1, Sz);
end;

procedure TQExport3XLS.WriteEOF;
begin
  WriteRecord(BIFF_EOF, 0);
end;

procedure TQExport3XLS.WriteDelta;
var
  Sz: integer;
  Delta: double;
begin
  Sz := SizeOf(Double);
  FillChar(FBuffer^, Sz, $0);
  Delta := 0.001;
  Move(Delta, FBuffer^, Sz);
  WriteRecord(BIFF_DELTA, Sz);
end;

procedure TQExport3XLS.WriteGuts;
var
  Sz: integer;
begin
  Sz := 8;
  FillChar(FBuffer^, Sz, $0);
  WriteRecord(BIFF_GUTS, Sz);
end;

procedure TQExport3XLS.WriteDefColWidth(Width: word);
var
  Sz: integer;
begin
  Sz := SizeOf(TBIFF_DEFCOLWIDTH);
  FillChar(FBuffer^, Sz, $0);
  PBIFF_DEFCOLWIDTH(FBuffer).Width := Width;
  WriteRecord(BIFF_DEFCOLWIDTH, Sz);
end;

procedure TQExport3XLS.WriteDefRowHeight(Height: double);
var
  Sz: integer;
begin
  Sz := SizeOf(TBIFF_DEFAULTROWHEIGHT);
  FillChar(FBuffer^, Sz, $0);
  PBIFF_DEFAULTROWHEIGHT(FBuffer).Options := $0000;
  PBIFF_DEFAULTROWHEIGHT(FBuffer).Height := Trunc(Height * 20);
  WriteRecord(BIFF_DEFAULTROWHEIGHT, Sz);
end;

procedure TQExport3XLS.WriteCatchword(ID: word; const Value: WideString);
var
  Sz, Ln: integer;
  Str: string;
begin
  Ln := Length(Value);
  if Ln > 0 then begin
    Sz := 3 + Ln;
    FillChar(FBuffer^, Sz, #0);
    FBuffer^[0] := Ln;
    FBuffer^[1] := 0;
    FBuffer^[2] := 0;
    Str := Value;
    Move(Str[1], FBuffer^[3], Ln);
  end
  else Sz := 0;
  WriteRecord(ID, Sz);
end;

procedure TQExport3XLS.WriteColInfo(SheetIndex: integer);
var
  i{, j}: integer;
  ColInfo: TxlsColInfo;
  ColInfoList: TxlsColInfoList;
  DC: HDC;
  Canvas: TCanvas;
  W: integer;
  Largura : Integer;
begin
  ColInfoList := TxlsColInfoList.Create(nil);
  try
    DC := CreateCompatibleDC(0);
    try
      Canvas := TCanvas.Create;
      try
        Canvas.Handle := DC;
        SetDefaultToFont(Canvas.Font);
        W := Canvas.TextWidth('0');
        for i := 0 to Sheets[SheetIndex].FColumns.Count - 1 do
        begin
          Largura := Round((Sheets[SheetIndex].FColumns[i].Width + 1 + 1 / W) * 256);
          { gato aki
            qdo o campo tem mais de 256 caracteres de comprimento o canvas nao pode
            ter mais que 50000.
           }
          if Largura > 50000 then
            Largura := 50000;
          ColInfo := TxlsColInfo.Create(i + Sheets[SheetIndex].StartDataCol,
            Largura,
            DEFAULT_FORMAT, 0);
          ColInfoList.Add(ColInfo);
        end;
      finally
        Canvas.Free;
      end;
    finally
      DeleteDC(DC);
    end;
    FColInfoPosition := FStream.Position;
    ColInfoList.Save(FStream);
  finally
    ColInfoList.Free;
  end;
end;

procedure TQExport3XLS.WriteLabelSST(Row, Col, XF: word; const Str: WideString);
var
  Sz: integer;
begin
  Sz := SizeOf(TBIFF_LABELSST);
  FillChar(FBuffer^, Sz, $0);
  PBIFF_LABELSST(FBuffer).Row := Row;
  PBIFF_LABELSST(FBuffer).Col := Col;
  PBIFF_LABELSST(FBuffer).XFIndex := XF;
  PBIFF_LABELSST(FBuffer).SSTIndex := FSSTStrings.AddString(Str);
  WriteRecord(BIFF_LABELSST, Sz);
end;

procedure TQExport3XLS.WriteBoolErr(Row, Col, XF: word; Value: boolean);
var
  Sz: integer;
begin
  Sz := SizeOf(TBIFF_BOOLERR);
  FillChar(FBuffer^, Sz, $0);
  PBIFF_BOOLERR(FBuffer).Row := Row;
  PBIFF_BOOLERR(FBuffer).Col := Col;
  PBIFF_BOOLERR(FBuffer).XFIndex := XF;
  PBIFF_BOOLERR(FBuffer).BoolErr := Byte(Value);
  WriteRecord(BIFF_BOOLERR, Sz);
end;

procedure TQExport3XLS.WriteNumber(Row, Col, XF: word; Value: double);
var
  Sz: integer;
begin
  Sz := SizeOf(TBIFF_NUMBER);
  FillChar(FBuffer^, Sz, $0);
  PBIFF_NUMBER(FBuffer).Row := Row;
  PBIFF_NUMBER(FBuffer).Col := Col;
  PBIFF_NUMBER(FBuffer).XFIndex := XF;
  PBIFF_NUMBER(FBuffer).Value := Value;
  WriteRecord(BIFF_NUMBER, Sz);
end;

procedure TQExport3XLS.WriteBlank(Row, Col, XF: word);
var
  Sz: integer;
begin
  Sz := SizeOf(TBIFF_BLANK);
  FillChar(FBuffer^, Sz, $0);
  PBIFF_BLANK(FBuffer).Row := Row;
  PBIFF_BLANK(FBuffer).Col := Col;
  PBIFF_BLANK(FBuffer).XF := XF;
  WriteRecord(BIFF_BLANK, Sz);
end;

procedure TQExport3XLS.WriteAggregate(Row, Col, StartRow, FinishRow: word;
  AggregateType: TxlsAggregate; XF: word);
var
  Sz: integer;
begin
  Sz := SizeOf(TBIFF_AGGREGATE);
  FillChar(FBuffer^, Sz, #0);
  PBIFF_AGGREGATE(FBuffer).Row := Row;
  PBIFF_AGGREGATE(FBuffer).Col := Col;
  PBIFF_AGGREGATE(FBuffer).Value := 0;
  PBIFF_AGGREGATE(FBuffer).Options := $0002;
  PBIFF_AGGREGATE(FBuffer).Reserved := 0;
  PBIFF_AGGREGATE(FBuffer).ParseLen := $0D;
  PBIFF_AGGREGATE(FBuffer).TokenID := $25;
  PBIFF_AGGREGATE(FBuffer).StartRow := StartRow;
  PBIFF_AGGREGATE(FBuffer).FinishRow := FinishRow;
  PBIFF_AGGREGATE(FBuffer).StartCol := Col;
  PBIFF_AGGREGATE(FBuffer).StartColFlag := $C0;
  PBIFF_AGGREGATE(FBuffer).FinishCol := Col;
  PBIFF_AGGREGATE(FBuffer).FinishColFlag := $C0;
  PBIFF_AGGREGATE(FBuffer).PtgFuncVarV := $42;
  PBIFF_AGGREGATE(FBuffer).Arguments := $01;
  case AggregateType of
    aggSum: PBIFF_AGGREGATE(FBuffer).InternalFunction := $04;
    aggAvg: PBIFF_AGGREGATE(FBuffer).InternalFunction := $05;
    aggMin: PBIFF_AGGREGATE(FBuffer).InternalFunction := $06;
    aggMax: PBIFF_AGGREGATE(FBuffer).InternalFunction := $07;
  end;
  PBIFF_AGGREGATE(FBuffer).XF := XF;
  WriteRecord(BIFF_FORMULA, Sz);
end;

procedure TQExport3XLS.WriteMergedCells(MergedCells: TxlsMergedCellList);
var
  Sz: integer;
  i, j, k: integer;
  V: integer;
begin
  k := 0;
  for i := 0 to MergedCells.Count - 1 do
    if MergedCells[i].IsCorrect then
      Inc(k);

  if k = 0 then Exit;

  Sz := 2 + SizeOf(TBIFF_CELL_RANGE) * MergedCells.Count;
  FillChar(FBuffer^, Sz, $0);
  j := 0;
  V := MergedCells.Count;
  Move(V, FBuffer[j], SizeOf(Word));
  Inc(j, 2);
  for i := 0 to MergedCells.Count - 1 do begin
    if not MergedCells[i].IsCorrect then Continue;
    V := MergedCells[i].FirstRow - 1;
    Move(V, FBuffer[j], SizeOf(Word));
    V := MergedCells[i].LastRow - 1;
    Move(V, FBuffer[j + 2], SizeOf(Word));
    V := MergedCells[i].FirstCol - 1;
    Move(V, FBuffer[j + 4], SizeOf(Word));
    V := MergedCells[i].LastCol - 1;
    Move(V, FBuffer[j + 6], SizeOf(Word));
    Inc(j, SizeOf(TBIFF_CELL_RANGE));
  end;
  WriteRecord(BIFF_MERGEDCELLS, Sz);
end;

procedure TQExport3XLS.WriteWindow2;
var
  Sz: integer;
begin
  Sz := SizeOf(TBIFF_WINDOW2);
  FillChar(FBuffer^, Sz, $0);
  PBIFF_WINDOW2(FBuffer).Options := $06B6;
  PBIFF_WINDOW2(FBuffer).Options := Word(TWordBits(PBIFF_WINDOW2(FBuffer).Options) + [b1, b2] - [b9]);
  PBIFF_WINDOW2(FBuffer).Options := Word(TWordBits(PBIFF_WINDOW2(FBuffer).Options) + [b9]); // selected
  PBIFF_WINDOW2(FBuffer).TopRow := 0;
  PBIFF_WINDOW2(FBuffer).LeftCol := 0;
  PBIFF_WINDOW2(FBuffer).GridLineColor := 0;
  PBIFF_WINDOW2(FBuffer).ZoomInPreview := 0;
  PBIFF_WINDOW2(FBuffer).ZoomInNormal := 0;
  PBIFF_WINDOW2(FBuffer).Reserved := 0;
  WriteRecord(BIFF_WINDOW2, Sz);
end;

procedure TQExport3XLS.WriteDimensions(FirstRow, LastRow: integer; FirstCol,
  LastCol: word);
var
  Sz: integer;
begin
  Sz := SizeOf(TBIFF_DIMENSIONS);
  FillChar(FBuffer^, Sz, #0);
  PBIFF_DIMENSIONS(FBuffer).FirstRow := FirstRow;
  PBIFF_DIMENSIONS(FBuffer).LastRow := LastRow;
  PBIFF_DIMENSIONS(FBuffer).FirstCol := FirstCol;
  PBIFF_DIMENSIONS(FBuffer).LastCol := LastCol;
  PBIFF_DIMENSIONS(FBuffer).Reserved := 0;
  WriteRecord(BIFF_DIMENSIONS, Sz);
end;

procedure TQExport3XLS.WriteSelection;
var
  Sz: integer;
begin
  Sz := SizeOf(TBIFF_SELECTION);
  FillChar(FBuffer^, Sz, $0);
  PBIFF_SELECTION(FBuffer).Pane := 3;
  PBIFF_SELECTION(FBuffer).ActiveRow := 0;
  PBIFF_SELECTION(FBuffer).ActiveCol := 0;
  PBIFF_SELECTION(FBuffer).ActiveRef := 0;
  PBIFF_SELECTION(FBuffer).Refs := 1;
  PBIFF_SELECTION(FBuffer).Row1 := 0;
  PBIFF_SELECTION(FBuffer).Row2 := 0;
  PBIFF_SELECTION(FBuffer).Col1 := 0;
  PBIFF_SELECTION(FBuffer).Col2 := 0;
  WriteRecord(BIFF_SELECTION, Sz);
end;

procedure TQExport3XLS.WriteHyperlink(Hyperlink: TxlsHyperlink);
var
  Sz, Ps, UnknownValue,
  OptionFlags, Ln, Ln1: integer;
  WS: WideString;
  Str: string;
begin
  Sz := Hyperlink.Size;
  FillChar(FBuffer^, Sz, $0);
  Ps := 0;
  // First row
  SetWord(FBuffer, Ps, Hyperlink.Row - 1);
  Inc(Ps, 2);
  // Last row
  SetWord(FBuffer, Ps, Hyperlink.Row - 1);
  Inc(Ps, 2);
  // First col
  SetWord(FBuffer, Ps, Hyperlink.Col - 1);
  Inc(Ps, 2);
  // Last col
  SetWord(FBuffer, Ps, Hyperlink.Col - 1);
  Inc(Ps, 2);
  // GUID D0 C9 EA 79 F9 BA CE 11 8C 82 00 AA 00 4B A9 0B
  Move(GUID_OF_STD_LINK[1], FBuffer[Ps], 16);
  Inc(Ps, 16);
  // Unknown value
  UnknownValue := $00000002;
  Move(UnknownValue, FBuffer[Ps], SizeOf(UnknownValue));
  Inc(Ps, 4);
  // Option Flags
  case Hyperlink.Style of
    hlsURL,
    hlsLocalFile: begin
      OptionFlags := $00000001 or $00000002 or $00000014;
      Move(OptionFlags, FBuffer[Ps], SizeOf(OptionFlags));
      Inc(Ps, 4);
    end;
  end;
  Ln := Length(Hyperlink.Title) + 1;
  Move(Ln, FBuffer[Ps], SizeOf(Ln));
  Inc(Ps, 4);
  WS := Hyperlink.Title + #0;
  Move(WS[1], FBuffer[Ps], Ln * 2);
  Inc(Ps, Ln * 2);

  case Hyperlink.Style of
    hlsURL: begin
      // GUID E0 C9 EA 79 F9 BA CE 11 8C 82 00 AA 00 4B A9 0B
      Move(GUID_OF_URL_MONIKER[1], FBuffer[Ps], 16);
      Inc(Ps, 16);
      Ln := Length(Hyperlink.Target) * 2 + 2;
      Move(Ln, FBuffer[Ps], SizeOf(Ln));
      Inc(Ps, 4);
      WS := Hyperlink.Target + #0;
      Move(WS[1], FBuffer[Ps], Ln);
    end;
    hlsLocalFile: begin
      // GUID 03 03 00 00 00 00 00 00 C0 00 00 00 00 00 00 46
      Move(GUID_OF_FILE_MONIKER[1], FBuffer[Ps], 16);
      Inc(Ps, 16);
      Ln := 0;
      Move(Ln, FBuffer[Ps], SizeOf(Byte));
      Inc(Ps, 2);
      Str := Hyperlink.ShortTarget + #0;
      Ln := Length(Str);
      Move(Ln, FBuffer[Ps], SizeOf(Ln));
      Inc(Ps, 4);
      Move(Str[1], FBuffer[Ps], Ln);
      // Unknown sequence
      Move(UNKNOWN_SEQUENCE1[1], FBuffer[Ps], 24);
      Inc(Ps, 24);

      WS := Hyperlink.Target;
      Ln := Length(WS);
      Ln1 := Ln + 6;
      Move(Ln1, FBuffer[Ps], SizeOf(Ln1));
      Inc(Ps, 4);
      Move(Ln, FBuffer[Ps], SizeOf(Ln));
      Inc(Ps, 4);
      Move(UNKNOWN_SEQUENCE2[1], FBuffer[Ps], 2);
      Inc(Ps, 2);
      Move(WS[1], FBuffer[Ps], Ln);
    end;
  end;

  WriteRecord(BIFF_HLINK, Sz);

  if Hyperlink.ScreenTip <> EmptyStr then begin
    Ps := 0;
    SetWord(FBuffer, Ps, BIFF_QUICKTIP);
    Inc(Ps, 2);
    // First row
    SetWord(FBuffer, Ps, Hyperlink.Row - 1);
    Inc(Ps, 2);
    // Last row
    SetWord(FBuffer, Ps, Hyperlink.Row - 1);
    Inc(Ps, 2);
    // First col
    SetWord(FBuffer, Ps, Hyperlink.Col - 1);
    Inc(Ps, 2);
    // Last col
    SetWord(FBuffer, Ps, Hyperlink.Col - 1);
    Inc(Ps, 2);
    Ln := (Length(Hyperlink.ScreenTip) + 1) * 2;
    WS := Hyperlink.ScreenTip + #0;
    Move(WS[1], FBuffer[Ps], Ln);
    Inc(Ps, Ln);
    WriteRecord(BIFF_QUICKTIP, Ps);
  end;
end;

procedure TQExport3XLS.WriteNotesChartsAndPictures(Sheet: TxlsSheet);

  procedure CheckTransparency(NoteFormat: TxlsNoteFormat; OPT: TmsoOPT);
  begin
    if NoteFormat.Transparency > 0 then
      OPT.Values.Add(TmsoOPTData.Create($182,
        $FD71 - (NoteFormat.Transparency - 1) * 656));
  end;

var
  xlsMSO: TxlsMSODrawing;
  SpContainer: TmsoContainer;
  OPT: TmsoOPT;
  i, j, k, l, t, Ln: integer;
  Str: string;
  WStr: WideString;
  ChartCount: integer;
  Notes: TxlsNotes;
  Charts: TxlsCharts;
  Images: TxlsImages;
begin
  Notes := Sheet.Notes;
  Charts := Sheet.Charts;
  Images := Sheet.Images;
  if (Notes.Count = 0) and (Charts.Count = 0) and (Images.Count = 0) then Exit;

  xlsMSO := TxlsMSODrawing.Create;
  try
    // Notes
    t := 0;
    for i := 0 to Notes.Count - 1 do begin
      if not Notes[i].IsValid then Continue;
      SpContainer := TmsoContainer.Create(MSO_SPCONTAINER, $0F, $00);
      SpContainer.AddSize := SizeOf(TMSO_Header);
      SpContainer.Children.Add(TmsoSp.Create($02, msosptTextBox, MSO_SPID + t, $0A00));
      OPT := TmsoOPT.Create($03,0);
      OPT.Values.Add(TmsoOPTData.Create($0080, t + 1)); // TXO
      if t = 90 then
        OPT.Values.Add(TmsoOPTData.Create($0085, $00000001));
      OPT.Values.Add(TmsoOPTData.Create($007D, $00000001));
      OPT.Values.Add(TmsoOPTData.Create($00BF, $00080008));
      OPT.Values.Add(TmsoOPTData.Create($0158, $00000000));
      case Notes[i].Format.FillType of
        nftSolid: begin
          OPT.Values.Add(TmsoOPTData.Create($0181, Notes[i].Format.ForegroundColor));
          CheckTransparency(Notes[i].Format, OPT);
        end;
        nftGradient:
          case Notes[i].Format.Gradient of
            ngrHorizontal: begin
              OPT.Values.Add(TmsoOPTData.Create($0180, $00000007));
              OPT.Values.Add(TmsoOPTData.Create($0181, Notes[i].Format.ForegroundColor));
              CheckTransparency(Notes[i].Format, OPT);
              OPT.Values.Add(TmsoOPTData.Create($0183, Notes[i].Format.BackgroundColor));
              OPT.Values.Add(TmsoOPTData.Create($018C, $00000064));
              OPT.Values.Add(TmsoOPTData.Create($0196, $009D0000));
            end;
            ngrVertical: begin
              OPT.Values.Add(TmsoOPTData.Create($0180, $00000007));
              OPT.Values.Add(TmsoOPTData.Create($0181, Notes[i].Format.ForegroundColor));
              CheckTransparency(Notes[i].Format, OPT);
              OPT.Values.Add(TmsoOPTData.Create($0183, Notes[i].Format.BackgroundColor));
              OPT.Values.Add(TmsoOPTData.Create($018B, $FFA60000));
              OPT.Values.Add(TmsoOPTData.Create($018C, $00000064));
              OPT.Values.Add(TmsoOPTData.Create($0196, $009D0000));
            end;
            ngrDiagonalUp: begin
              OPT.Values.Add(TmsoOPTData.Create($0180, $00000007));
              OPT.Values.Add(TmsoOPTData.Create($0181, Notes[i].Format.ForegroundColor));
              CheckTransparency(Notes[i].Format, OPT);
              OPT.Values.Add(TmsoOPTData.Create($0183, Notes[i].Format.BackgroundColor));
              OPT.Values.Add(TmsoOPTData.Create($018B, $FF790000));
              OPT.Values.Add(TmsoOPTData.Create($018C, $00000064));
              OPT.Values.Add(TmsoOPTData.Create($0196, $009D0000));
            end;
            ngrDiagonalDown: begin
              OPT.Values.Add(TmsoOPTData.Create($0180, $00000007));
              OPT.Values.Add(TmsoOPTData.Create($0181, Notes[i].Format.ForegroundColor));
              CheckTransparency(Notes[i].Format, OPT);
              OPT.Values.Add(TmsoOPTData.Create($0183, Notes[i].Format.BackgroundColor));
              OPT.Values.Add(TmsoOPTData.Create($018B, $FFD30000));
              OPT.Values.Add(TmsoOPTData.Create($018C, $00000064));
              OPT.Values.Add(TmsoOPTData.Create($0196, $009D0000));
            end;
            ngrFromCorner: begin
              OPT.Values.Add(TmsoOPTData.Create($0180, $00000005));
              OPT.Values.Add(TmsoOPTData.Create($0181, Notes[i].Format.ForegroundColor));
              CheckTransparency(Notes[i].Format, OPT);
              OPT.Values.Add(TmsoOPTData.Create($0183, Notes[i].Format.BackgroundColor));
              OPT.Values.Add(TmsoOPTData.Create($018B, $FFD30000));
              OPT.Values.Add(TmsoOPTData.Create($018C, $00000064));
              OPT.Values.Add(TmsoOPTData.Create($0196, $009D0000));
            end;
            ngrFromCenter: begin
              OPT.Values.Add(TmsoOPTData.Create($0180, $00000006));
              OPT.Values.Add(TmsoOPTData.Create($0181, Notes[i].Format.ForegroundColor));
              CheckTransparency(Notes[i].Format, OPT);
              OPT.Values.Add(TmsoOPTData.Create($0183, Notes[i].Format.BackgroundColor));
              OPT.Values.Add(TmsoOPTData.Create($018B, $FFD30000));
              OPT.Values.Add(TmsoOPTData.Create($018C, $00000064));
              OPT.Values.Add(TmsoOPTData.Create($018D, $00008000));
              OPT.Values.Add(TmsoOPTData.Create($018E, $00008000));
              OPT.Values.Add(TmsoOPTData.Create($018F, $00008000));
              OPT.Values.Add(TmsoOPTData.Create($0190, $00008000));
              OPT.Values.Add(TmsoOPTData.Create($0196, $009D0000));
            end;
          end;
        {nftPattern: begin
          OPT.Values.Add(TmsoOPTData.Create($0180, $00000001));
          OPT.Values.Add(TmsoOPTData.Create($0181, Notes[i].Format.ForegroundColor));
          OPT.Values.Add(TmsoOPTData.Create($0183, Notes[i].Format.BackgroundColor));
          OPT.Values.Add(TmsoOPTData.Create($4186, (Integer(Notes[i].Format.Pattern) mod 2) + 1));
          OPT.AddStrValue($C187, PATTERN_NAMES[Integer(Notes[i].Format.Pattern)]);
        end;}
      end;
      if Notes[i].Format.FillType in [nftSolid, nftGradient] then
        OPT.Values.Add(TmsoOPTData.Create($01BF, $00110010))
      else begin
        OPT.Values.Add(TmsoOPTData.Create($01BF, $00150014));
        OPT.Values.Add(TmsoOPTData.Create($01FF, $00080008));
      end;
      OPT.Values.Add(TmsoOPTData.Create($0201, $00000000));
      OPT.Values.Add(TmsoOPTData.Create($023F, $00030003));
      OPT.Values.Add(TmsoOPTData.Create($03BF, $000A0002));
      SpContainer.Children.Add(OPT);
      SpContainer.Children.Add(TmsoClientAnchor.Create($00, $00, $0003,
        Notes[i].GetAnchor));
      SpContainer.Children.Add(TmsoClientData.Create($00, $00));
      xlsMSO.Data.Add(SpContainer);
      xlsMSO.Data.Add(TmsoClientTextBox.Create($00, $00));

      Inc(t);
    end;

    // Images
    for i := 0 to Images.Count - 1 do begin
      SpContainer := TmsoContainer.Create(MSO_SPCONTAINER, $0F, $00);
      SpContainer.Children.Add(TmsoSP.Create($02, msosptPictureFrame,
        MSO_SPID + i, $0A00));
      OPT := TmsoOPT.Create($03, $04);
      OPT.Values.Add(TmsoOPTData.Create($007F, $800000)); // Lock aspect ratio unchecked
      OPT.Values.Add(TmsoOPTData.Create($4104, Images[i].GetPictureIndex));
      OPT.Values.Add(TmsoOPTData.CreateStr($C105, Images[i].Title));
      OPT.Values.Add(TmsoOPTData.Create($01BF, $10000));
      OPT.Values.Add(TmsoOPTData.Create($033F, $100000));
      OPT.Values.Add(TmsoOPTData.CreateStr($C380, Images[i].Title));
      OPT.Values.Add(TmsoOPTData.Create($03BF, $80000));
      SpContainer.Children.Add(OPT);
      SpContainer.Children.Add(TmsoClientAnchor.Create($00, $00, $0002,
        Images[i].GetAnchor));
      SpContainer.Children.Add(TmsoClientData.Create($00, $00));
      xlsMSO.Data.Add(SpContainer);
    end;

    ChartCount := 0;
    for i := 0 to Charts.Count - 1 do begin
      SpContainer := TmsoContainer.Create(MSO_SPCONTAINER, $0F, $00);
      SpContainer.Children.Add(TmsoSp.Create($02, msosptHostControl,
        MSO_SPID + ChartCount, $0A00));
      OPT := TmsoOPT.Create($03, $09);
      OPT.Values.Add(TmsoOPTData.Create($007F, $01040104));
      OPT.Values.Add(TmsoOPTData.Create($00BF, $00080008));
      OPT.Values.Add(TmsoOPTData.Create($0181, $0800004E));
      OPT.Values.Add(TmsoOPTData.Create($0183, $0800004D));
      OPT.Values.Add(TmsoOPTData.Create($01BF, $00100010));
      OPT.Values.Add(TmsoOPTData.Create($01C0, $0800004D));
      OPT.Values.Add(TmsoOPTData.Create($01FF, $00080008));
      OPT.Values.Add(TmsoOPTData.Create($023F, $00020000));
      OPT.Values.Add(TmsoOPTData.Create($03BF, $00080000));
      SpContainer.Children.Add(OPT);
      SpContainer.Children.Add(TmsoClientAnchor.Create($00, $00, $0000,
        Charts[i].GetAnchor));
      SpContainer.Children.Add(TmsoClientData.Create($00, $00));
      xlsMSO.Data.Add(SpContainer);
      Inc(ChartCount)
    end;

    j := 0;
    k := 1;
    for i := 0 to Notes.Count - 1 do begin
      if not Notes[i].IsValid then Continue;
      xlsMSO.Save(FStream, j);
      Inc(j);
      WriteNoteObj(k);
      Inc(k);
      xlsMso.Save(FStream, j);
      Inc(j);

      Str := Trim(Notes[i].Lines.Text);
      for l := Length(Str) downto 1 do
        if Ord(Str[l]) = $0D then Delete(Str, l, 1);
      Ln := Length(Str);
      WStr := Str;

      WriteTXO(Ln, Notes[i].Format);
      WriteContinue1(WStr);
      WriteTXORun(Ln, Notes[i].Format.Font);
    end;

    for i := 0 to Images.Count - 1 do begin

      xlsMSO.Save(FStream, j);
      Inc(j);

      WritePictureObj(k);
      Inc(k);
    end;

    // Charts
    for i := 0 to Charts.Count - 1 do begin
      xlsMso.Save(FStream, j);
      Inc(j);
      WriteChartObj(k);
      Inc(k);

      WriteXLSChart(Sheet.Index, Charts[i]);
    end;

  finally
    xlsMSO.Free;
  end;

  t := 0;
  for i := 0 to Notes.Count - 1 do begin
    if not Notes[i].IsValid then Continue;
    WriteNote(Notes[i], t + 1);
    Inc(t);
  end;
end;

procedure TQExport3XLS.RecalculateColWidth(const Str: string; XF,
  ColIndex: integer);
var
  Canvas: TCanvas;
  XFormat: TxlsXFormat;
  DC: HDC;
  W, WW: integer;
  D: double;
  L: integer;
begin
  DC := CreateCompatibleDC(0);
  try
  Canvas := TCanvas.Create;
    try
      Canvas.Handle := DC;
      if XF = DEFAULT_FORMAT then
        SetDefaultToFont(Canvas.Font)
      else begin
        XFormat := FXFormatList.FormatByFormatIndex(XF);
        if Assigned(XFormat) and Assigned(XFormat.Font) then begin
          XFormat.Font.AssignTo(Canvas.Font);
          Canvas.Font.Size := Canvas.Font.Size;
        end
        else SetDefaultToFont(Canvas.Font)
      end;
      W := Canvas.TextWidth(Str + 'I');
      SetDefaultToFont(Canvas.Font);
      WW := Canvas.TextWidth('0');
      D := W / WW;
      L := Trunc(D);
      if Frac(D) > 0 then
        Inc(L);
      if L > Integer(FColWidthList[ColIndex]) then
        FColWidthList[ColIndex] := Pointer(L);
    finally
      Canvas.Free;
    end;
  finally
    DeleteDC(DC);
  end;
end;

procedure TQExport3XLS.CorrectColInfo;
var
  P: integer;
  i: integer;
  W: word;
begin
  P := FStream.Position;
  FStream.Seek(FColInfoPosition, soFromBeginning);
  for i := 0 to FColWidthList.Count - 1 do begin
    FStream.Seek(8, soFromCurrent);
    W := Word(FColWidthList[i]) * 256;
    FStream.Write(W, SizeOf(Word));
    FStream.Seek(5, soFromCurrent);
  end;
  FStream.Seek(P, soFromBeginning);
end;

procedure TQExport3XLS.CheckRowHeight(XF, RowIndex: integer);
var
  j: integer;
  H, HH: integer;
  FXFormat: TxlsXFormat;
  DC: HDC;
  Canvas: TCanvas;
  OTM: TOutlineTextmetric;
begin
  if XF = DEFAULT_FORMAT then Exit;
  FXFormat := FXFormatList.FormatByFormatIndex(XF);
  if Assigned(FXFormat) and Assigned(FXFormat.Font) then begin
    if (AnsiCompareText(FXFormat.Font.Name, 'arial') = 0) and
       (FXFormat.Font.Size = 10) and (FXFormat.Font.Style = []) then Exit;

    DC := CreateCompatibleDC(0);
    try
      Canvas := TCanvas.Create;
      try
        Canvas.Handle := DC;
        FXFormat.Font.AssignTo(Canvas.Font);

        FillChar(OTM, SizeOf(OTM), #0);
        GetOutlineTextMetrics(Canvas.Handle, SizeOf(OTM), @OTM);
        H := OTM.otmTextMetrics.tmHeight -
             OTM.otmTextMetrics.tmInternalLeading -
             OTM.otmTextMetrics.tmDescent +
             Trunc(MaxValue([OTM.otmTextMetrics.tmInternalLeading,
                             OTM.otmTextMetrics.tmDescent])) * 2 +
             OTM.otmTextMetrics.tmExternalLeading + 1;
        H := H * 72 * 20 div OTM.otmTextMetrics.tmDigitizedAspectY;
      finally
      end;
    finally
      DeleteDC(DC);
    end;

    if FRowHeightList.Find(IntToStr(RowIndex), j) then begin
      HH := Integer(FRowHeightList.Objects[j]);
      if H > HH then
        FRowHeightList.Objects[j] := TObject(H);
    end
    else FRowHeightList.InsertObject(j, IntToStr(RowIndex), TObject(H));

  end;

end;

procedure TQExport3XLS.WriteNoteObj(ObjectID: word);
var
  Cmo: TOBJ_CMO;
  Header: TBIFF_Header;
begin
  Header.ID := BIFF_OBJ;
  Header.Length := SizeOf(TOBJ_CMO) + SizeOf(TBIFF_Header) * 3;
  FStream.Write(Header, SizeOf(TBIFF_Header));

  Header.ID := OBJ_CMO;
  Header.Length := SizeOf(TOBJ_CMO);
  FStream.Write(Header, SizeOf(TBIFF_Header));
  FillChar(Cmo, SizeOf(TOBJ_CMO), $0);
  Cmo.ObjectType  := $19;
  Cmo.ObjectID    := ObjectID;
  Cmo.OptionFlags := $0011;
  FStream.Write(Cmo, SizeOf(TOBJ_CMO));

  Header.ID := OBJ_NTS;
  Header.Length := $00;
  FStream.Write(Header, SizeOf(TBIFF_Header));

  Header.ID := OBJ_END;
  Header.Length := $00;
  FStream.Write(Header, SizeOf(TBIFF_Header));
end;

procedure TQExport3XLS.WriteTXO(TextLength: word; NoteFormat: TxlsNoteFormat);
var
  Sz: integer;
begin
  Sz := SizeOf(TBIFF_TXO);
  FillChar(FBuffer^, Sz, #0);

  PBIFF_TXO(FBuffer).Options := $0;
  case NoteFormat.Alignment.Horizontal of
    halGeneral,
    halLeft:  PBIFF_TXO(FBuffer).Options := (PBIFF_TXO(FBuffer).Options or ($01 shl $1) and $000E);
    halCenter: PBIFF_TXO(FBuffer).Options := (PBIFF_TXO(FBuffer).Options or ($02 shl $1) and $000E);
    halRight: PBIFF_TXO(FBuffer).Options := (PBIFF_TXO(FBuffer).Options or ($03 shl $1) and $000E);
    halFill: PBIFF_TXO(FBuffer).Options := (PBIFF_TXO(FBuffer).Options or ($04 shl $1) and $000E);
  end;

  case NoteFormat.Alignment.Vertical of
    valTop:  PBIFF_TXO(FBuffer).Options := (PBIFF_TXO(FBuffer).Options or ($01 shl $4) and $0070);
    valCenter: PBIFF_TXO(FBuffer).Options := (PBIFF_TXO(FBuffer).Options or ($02 shl $4) and $0070);
    valBottom: PBIFF_TXO(FBuffer).Options := (PBIFF_TXO(FBuffer).Options or ($03 shl $4) and $0070);
    valJustify: PBIFF_TXO(FBuffer).Options := (PBIFF_TXO(FBuffer).Options or ($04 shl $4) and $0070);
  end;

  PBIFF_TXO(FBuffer).Orientation := Word(NoteFormat.Orientation);
  PBIFF_TXO(FBuffer).TextLength := TextLength;
  PBIFF_TXO(FBuffer).FormatLength := SizeOf(TBIFF_TXORUN);

  WriteRecord(BIFF_TXO, Sz);
end;

procedure TQExport3XLS.WriteContinue1(const NoteText: WideString);
var
  Sz: integer;
begin
  Sz := Length(NoteText);
  FillChar(FBuffer^, Sz * 2, #0);
  FBuffer^[0] := 1;
  Move(NoteText[1], FBuffer^[1], Sz * 2);
  WriteRecord(BIFF_CONTINUE, Sz * 2 + 1);
end;

procedure TQExport3XLS.WriteTXORUN(TextLength: word; Font: TxlsFont);
var
  Sz: integer;
  FontIndex: integer;
  Fnt: TxlsFont;
begin
  Sz := SizeOf(TBIFF_TXORUN);
  FillChar(FBuffer^, Sz, #0);

  FontIndex := FFontList.ListIndexByFont(Font);
  if FontIndex = -1 then begin
    Fnt := TxlsFont.Create;
    Fnt.Assign(Font);
    FFontList.Add(Fnt);
    Inc(FLastFont);
    FontIndex := FLastFont;
  end
  else FontIndex := FontIndex + 5; 

  PBIFF_TXORUN(FBuffer).FontIndex1 := FontIndex;
  PBIFF_TXORUN(FBuffer).CharIndex2 := TextLength;
  WriteRecord(BIFF_CONTINUE, Sz);
end;

procedure TQExport3XLS.WriteChartObj(ObjectID: word);
var
  Cmo: TOBJ_CMO;
  Header: TBIFF_Header;
begin
  Header.ID := BIFF_OBJ;
  Header.Length := SizeOf(TOBJ_CMO) + SizeOf(TBIFF_Header) * 3;
  FStream.Write(Header, SizeOf(TBIFF_Header));

  Header.ID := OBJ_CMO;
  Header.Length := SizeOf(TOBJ_CMO);
  FStream.Write(Header, SizeOf(TBIFF_Header));
  FillChar(Cmo, SizeOf(TOBJ_CMO), $0);
  Cmo.ObjectType  := $05;
  Cmo.ObjectID    := ObjectID;
  Cmo.OptionFlags := $0011;
  FStream.Write(Cmo, SizeOf(TOBJ_CMO));

  Header.ID := OBJ_END;
  Header.Length := $00;
  FStream.Write(Header, SizeOf(TBIFF_Header));
end;

procedure TQExport3XLS.WritePictureObj(ObjectID: word);
var
  Cmo: TOBJ_CMO;
  Header: TBIFF_Header;
begin
  Header.ID := BIFF_OBJ;
  Header.Length := SizeOf(TOBJ_CMO) + SizeOf(TBIFF_Header) * 4;
  FStream.Write(Header, SizeOf(TBIFF_Header));

  Header.ID := OBJ_CMO;
  Header.Length := SizeOf(TOBJ_CMO);
  FStream.Write(Header, SizeOf(TBIFF_Header));
  FillChar(Cmo, SizeOf(TOBJ_CMO), $0);
  Cmo.ObjectType  := $08;
  Cmo.ObjectID    := ObjectID;
  Cmo.OptionFlags := $0011;
  FStream.Write(Cmo, SizeOf(TOBJ_CMO));

  Header.ID := OBJ_CF;
  Header.Length := $00;
  FStream.Write(Header, SizeOf(TBIFF_Header));
  Header.ID := OBJ_PIOGRBIT;
  Header.Length := $00;
  FStream.Write(Header, SizeOf(TBIFF_Header));
  Header.ID := OBJ_END;
  Header.Length := $00;
  FStream.Write(Header, SizeOf(TBIFF_Header));
end;

procedure TQExport3XLS.WriteNote(Note: TxlsNote; ObjectID: integer);
var
  Sz: integer;
begin
  Sz := SizeOf(TBIFF_NOTE);
  FillChar(FBuffer^, Sz, #0);

  PBIFF_NOTE(FBuffer).Col := Note.Col - 1;
  PBIFF_NOTE(FBuffer).Row := Note.Row - 1;
  PBIFF_NOTE(FBuffer).Options := 0;
  PBIFF_NOTE(FBuffer).ObjID := ObjectID;
  WriteRecord(BIFF_NOTE, Sz);
end;

procedure TQExport3XLS.WriteXLSChart(SheetIndex: integer; Chart: TxlsChart);
var
  i: integer;
  DR: TxlsDataRange;
begin
  WriteBOF(BIFF_BOF_CHART);

  WriteCatchword(BIFF_HEADER, EmptyStr);
  WriteCatchword(BIFF_FOOTER, EmptyStr);
  WriteWordRecord(BIFF_HCENTER, 0);
  WriteWordRecord(BIFF_VCENTER, 0);
  WriteSetup;
  WriteWordRecord($0033, 3);
  WriteFBI($00F0, $0000, $0005);
  WriteFBI($00C8, $0001, $0006);
  WriteFBI($00C8, $0000, $0007);
  WriteWordRecord(BIFF_PROTECT, 0);
  WriteWordRecord(CHART_UNITS, 0);
  WriteChart;
  WriteRecord(CHART_BEGIN, 0);
    WriteSCL;
    WritePlotGrowth;
    WriteFrame(false, true);
    WriteRecord(CHART_BEGIN, 0);
      WriteLineFormat($00000000, $0000, $FFFF, $0009, $004D);
      WriteAreaFormat($00FFFFFF, $00000000, $0001, $0001, $004E, $004D);
    WriteRecord(CHART_END, 0);
    // series
    for i := 0 to Chart.Series.Count - 1 do begin
      WriteSeries;
      WriteRecord(CHART_BEGIN, 0);
        WriteAI(0, -1, nil);
        if Chart.Series[i].Title <> EmptyStr then
          WriteSeriesText(EmptyStr, Chart.Series[i].Title, true);
        // data range
        case Chart.Series[i].DataRangeType of
          rtColumn: begin
            DR := TxlsDataRange.Create;
            try
              Sheets[SheetIndex].FColumnList.AssignColumnToDataRange(Chart.Series[i].DataColumn, DR);
              WriteAI(1, SheetIndex, DR);
            finally
              DR.Free;
            end;
          end;
          rtCustom: WriteAI(1, SheetIndex, Chart.Series[i].DataRange);
        end;
        // category labels
        case Chart.CategoryLabelsType of
          rtColumn: begin
            DR := TxlsDataRange.Create;
            try
              Sheets[SheetIndex].FColumnList.AssignColumnToDataRange(Chart.CategoryLabelsColumn, DR);
              WriteAI(2, SheetIndex, DR);;
            finally
              DR.Free;
            end;
          end;
          rtCustom: WriteAI(2, SheetIndex, Chart.CategoryLabels);
        end;

        WriteAI(3, -1, nil);
        WriteDataFormat(i);
        WriteRecord(CHART_BEGIN, 0);
          WriteWordRecord($105F, 0); //???
          if not Chart.AutoColor then begin
            WriteLineFormat($00000000, $0000, $0000, $0000, $0008);
            WriteAreaFormat($00A0A0A0, $00909090, $0001, $0000,
              COLOR_INDEX[Integer(Chart.Series[i].Color)], $0008);
          end;
        WriteRecord(CHART_END, 0);
        WriteSerToCRT;
      WriteRecord(CHART_END, 0);
    end;
    WriteShtProps;
    WriteDefaultText($0002);
    WriteText;
    WriteRecord(CHART_BEGIN, 0);
      WritePos(false, 0, 0, 0, 0);
      WriteFontX($0007);
      WriteAI(0, -1, nil);
    WriteRecord(CHART_END, 0);
    WriteDefaultText($0003);
    WriteText;
    WriteRecord(CHART_BEGIN, 0);
      WritePos(false, 0, 0, 0, 0);
      WriteFontX($0006);
      WriteAI(0, -1, nil);
    WriteRecord(CHART_END, 0);
    WriteAxesUsed;
    WriteAxisParent;
    WriteRecord(CHART_BEGIN, 0);
      WritePos(false, 129, 719, 2968, 3105);
      WriteAxis(0);
      WriteRecord(CHART_BEGIN, 0);
        WriteCatSerRange;
        WriteAxcExt;
        WriteTick;
      WriteRecord(CHART_END, 0);
      WriteAxis(1);
      WriteRecord(CHART_BEGIN, 0);
        WriteValueRange;
        WriteTick;
        WriteAxisLineFormat;
        WriteLineFormat($00000000, $0000, $FFFF, $0009, $004D);
      WriteRecord(CHART_END, 0);
      WriteRecord(CHART_PLOTAREA, 0);
      WriteFrame(true, true);
      WriteRecord(CHART_BEGIN, 0);
        WriteLineFormat($00808080, $0000, $0000, $0000, $0017);
        WriteAreaFormat($00C0C0C0, $00000000, $0001, $0000, $0016, $004F);
      WriteRecord(CHART_END, 0);
      WriteChartFormat(Chart.Style);
      WriteRecord(CHART_BEGIN, 0);
        case Chart.Style of
          xcsColumn,
          xcsColumn3d: WriteBar(false);
          xcsBar,
          xcsBar3d: WriteBar(true);
          xcsLine,
          xcsLine3d: WriteLine;
          xcsPie,
          xcsPie3d: WritePie;
          xcsArea,
          xcsArea3d: WriteArea;
          xcsSurface,
          xcsSurface3d: WriteSurface;
          xcsRadar: WriteRadar;
          xcsRadarArea: WriteRadarArea;
        end;
        if Chart.Style in [xcsColumn3d, xcsBar3d, xcsLine3d, xcsPie3d,
             xcsArea3d, xcsSurface3d] then
         Write3D;
        if Chart.ShowLegend then begin
          WriteLegend(Byte(Chart.LegendPlacement));
          WriteRecord(CHART_BEGIN, 0);
            WritePos(true, $0CA7, $079B, $0000, $0000);
            WriteText;
            WriteRecord(CHART_BEGIN, 0);
              WritePos(false, $0000, $0000, $0000, $0000);
              WriteAI(0, -1, nil);
            WriteRecord(CHART_END, 0);
          WriteRecord(CHART_END, 0);
        end;
      WriteRecord(CHART_END, 0);
    WriteRecord(CHART_END, 0);
    if Chart.Title <> EmptyStr then begin
      WriteText;
      WriteRecord(CHART_BEGIN, 0);
        WritePos(false, $0000, $0000, $0034, $0016);
        WriteFontX($0005);
        WriteAI(0, -1, nil);
        WriteSeriesText(EmptyStr, Chart.Title, true);
        WriteObjectLink;
      WriteRecord(CHART_END, 0);
    end;
  WriteRecord(CHART_END, 0);
  WriteDimensions($00000000, $0000000D, $0000, $0001);
  WriteSIIndex($0001);
  WriteSIIndex($0002);
  WriteSIIndex($0003);

  WriteEOF;
end;

procedure TQExport3XLS.WriteSetup;
var
  Sz: integer;
begin
  Sz := SizeOf(TBIFF_SETUP);
  FillChar(FBuffer^, Sz, #0);
  PBIFF_SETUP(FBuffer).PaperSize := $0000;
  PBIFF_SETUP(FBuffer).ScalingFactor := $0012;
  PBIFF_SETUP(FBuffer).StartingPageNumber := $0001;
  PBIFF_SETUP(FBuffer).FitToWidth := $0001;
  PBIFF_SETUP(FBuffer).FitToHeight := $0001;

  PBIFF_SETUP(FBuffer).OptionFlags := $0000;
  PBIFF_SETUP(FBuffer).OptionFlags := PBIFF_SETUP(FBuffer).OptionFlags or $0001; // Left To Right
  PBIFF_SETUP(FBuffer).OptionFlags := PBIFF_SETUP(FBuffer).OptionFlags or $0002; // Portrait
  PBIFF_SETUP(FBuffer).OptionFlags := PBIFF_SETUP(FBuffer).OptionFlags or $0008; // NoColor
  PBIFF_SETUP(FBuffer).OptionFlags := PBIFF_SETUP(FBuffer).OptionFlags or $0010; // Draft Quality
  PBIFF_SETUP(FBuffer).OptionFlags := PBIFF_SETUP(FBuffer).OptionFlags or $0020; // Notes

  PBIFF_SETUP(FBuffer).PrintResolution := $0000;
  PBIFF_SETUP(FBuffer).VerticalPrintResolution := $08A0;
  PBIFF_SETUP(FBuffer).HeaderMargin := 0;
  PBIFF_SETUP(FBuffer).FooterMargin := 0;
  PBIFF_SETUP(FBuffer).NumberOfCopies := 1;

  WriteRecord(BIFF_SETUP, Sz);
end;

procedure TQExport3XLS.WriteBackground(Background: TxlsGraphic);
var
  N: integer;
  H, W: integer;
  L, L1: integer;
  Sz, Ln, Tl: integer;
  WasEmpty: boolean;
  Picture: TPicture;
  Bitmap: Graphics.TBitmap;
begin
  WasEmpty := Background.Stream.Size = 0;

  if WasEmpty then begin
    if not ((Background.FileName <> EmptyStr) and
            (Background.GraphicType in [gtWMF, gtEMF, gtJPG, gtBMP, gtGIF,
              gtICO]) and
            FileExists(Background.FileName)) then Exit;
    Picture := TPicture.Create;
    try
      Picture.LoadFromFile(Background.FileName);
      H := Picture.Graphic.Height;
      W := Picture.Graphic.Width;
      Bitmap := Graphics.TBitmap.Create;
      try
        Bitmap.Height := H;
        Bitmap.Width := W;
        Bitmap.PixelFormat := pf24bit;
        Bitmap.Canvas.Draw(0, 0, Picture.Graphic);
        Bitmap.SaveToStream(Background.Stream);
      finally
        Bitmap.Free;
      end;
      Background.Stream.Seek(10, soFromBeginning);
      Background.Stream.Read(N, 4);
      L := Background.Stream.Size - N;
    finally
      Picture.Free;
    end;
  end
  else begin
    N := 0;
    H := Background.Height;
    W := Background.Width;
    L := Background.Stream.Size;
  end;

  Sz := SizeOf(TBIFF_BITMAP);
  Ln := Sz - 8;

  if L + Sz > 8220
    then L1 := 8220 - Sz
    else L1 := L;

  Inc(Ln, L);

  PBIFF_BITMAP(FBuffer).Unknown1 := $0009;
  PBIFF_BITMAP(FBuffer).Unknown2 := $0001;
  PBIFF_BITMAP(FBuffer).NextPartSize := Ln;
  PBIFF_BITMAP(FBuffer).Unknown3 := $000C;
  PBIFF_BITMAP(FBuffer).Unknown4 := $0000;
  PBIFF_BITMAP(FBuffer).Width := W;
  PBIFF_BITMAP(FBuffer).Height := H;
  PBIFF_BITMAP(FBuffer).PlaneCount := $0001;
  PBIFF_BITMAP(FBuffer).ColorDepth := $0018;

  Background.Stream.Seek(N, soFromBeginning);
  Background.Stream.Read(FBuffer[Sz], L1);
  WriteRecord(BIFF_BITMAP, L1 + Sz);


  Tl := L - L1;

  while Tl > 0 do begin
    if Tl > 8212 then
      N := 8212
    else N := Tl;
    Background.Stream.Read(FBuffer^, N);
    WriteRecord(BIFF_CONTINUE, N);

    Dec(Tl, N);
  end;

  if WasEmpty then
    Background.Stream.Size := 0;
end;

procedure TQExport3XLS.WriteFBI(HeightApplied, Scale, FontIndex: word);
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_FBI);
  FillChar(FBuffer^, Sz, #0);
  PCHART_FBI(FBuffer).Width := $1635;
  PCHART_FBI(FBuffer).Height := $111C;
  PCHART_FBI(FBuffer).HeightApplied := HeightApplied;
  PCHART_FBI(FBuffer).Scale := Scale;
  PCHART_FBI(FBuffer).FontIndex := 0;
  WriteRecord(CHART_FBI, Sz);
end;

procedure TQExport3XLS.WriteChart;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_CHART);
  FillChar(FBuffer^, Sz, #0);
  PCHART_CHART(FBuffer).Top := $0000F000;
  PCHART_CHART(FBuffer).Left := $00000000;
  PCHART_CHART(FBuffer).Width := $00EFFFE8;
  PCHART_CHART(FBuffer).Height := $00B27FD0;
  WriteRecord(CHART_CHART, Sz);
end;

procedure TQExport3XLS.WriteSCL;
var
  Sz: integer;
begin
  Sz := SizeOf(TBIFF_SCL);
  FillChar(FBuffer^, Sz, #0);
  PBIFF_SCL(FBuffer).Numerator := $0001;
  PBIFF_SCL(FBuffer).Denominator := $0001;
  WriteRecord(BIFF_SCL, Sz);
end;

procedure TQExport3XLS.WritePlotGrowth;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_PLOTGROWTH);
  FillChar(FBuffer^, Sz, #0);
  PCHART_PLOTGROWTH(FBuffer).Horizontal := $00010000;
  PCHART_PLOTGROWTH(FBuffer).Vertical := $00010000;
  WriteRecord(CHART_PLOTGROWTH, Sz);
end;

procedure TQExport3XLS.WriteFrame(AutoSize, AutoPos: boolean);
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_FRAME);
  FillChar(FBuffer^, Sz, #0);
  PCHART_FRAME(FBuffer).FrameType := $0000;
  PCHART_FRAME(FBuffer).Flags := $0000;
  if AutoSize then
    PCHART_FRAME(FBuffer).Flags := PCHART_FRAME(FBuffer).Flags + $0001;
  if AutoPos then
    PCHART_FRAME(FBuffer).Flags := PCHART_FRAME(FBuffer).Flags + $0002;
  WriteRecord(CHART_FRAME, Sz);
end;

procedure TQExport3XLS.WriteLineFormat(Color: cardinal; Pattern, Weight,
  FormatFlags, ColorIndex: word);
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_LINEFORMAT);
  FillChar(FBuffer^, Sz, #0);
  PCHART_LINEFORMAT(FBuffer).Color := Color;
  PCHART_LINEFORMAT(FBuffer).Pattern := Pattern;
  PCHART_LINEFORMAT(FBuffer).Weight := Weight;
  PCHART_LINEFORMAT(FBuffer).FormatFlags := FormatFlags;
  PCHART_LINEFORMAT(FBuffer).ColorIndex := ColorIndex;
  WriteRecord(CHART_LINEFORMAT, Sz);
end;

procedure TQExport3XLS.WriteAreaFormat(FgColor, BgColor: cardinal; Pattern,
  FormatFlags, FgColorIndex, BgColorIndex: word);
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_AREAFORMAT);
  FillChar(FBuffer^, Sz, #0);
  PCHART_AREAFORMAT(FBuffer).ForegroundColor := FgColor;
  PCHART_AREAFORMAT(FBuffer).BackgroundColor := BgColor;
  PCHART_AREAFORMAT(FBuffer).Pattern := Pattern;
  PCHART_AREAFORMAT(FBuffer).FormatFlags := FormatFlags;
  PCHART_AREAFORMAT(FBuffer).ForegroundColorIndex := FgColorIndex;
  PCHART_AREAFORMAT(FBuffer).BackgroundColorIndex := BgColorIndex;
  WriteRecord(CHART_AREAFORMAT, Sz);
end;

procedure TQExport3XLS.WriteSeries;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_SERIES);
  FillChar(FBuffer^, Sz, #0);
  PCHART_SERIES(FBuffer).CategoryType := $0001;
  PCHART_SERIES(FBuffer).ValueType := $0001;
  PCHART_SERIES(FBuffer).CategoryCount := $000D;
  PCHART_SERIES(FBuffer).ValueCount := $000D;
  PCHART_SERIES(FBuffer).BubbleType := $0001;
  PCHART_SERIES(FBuffer).BubbleCount := $0000;
  WriteRecord(CHART_SERIES, Sz);
end;

procedure TQExport3XLS.WriteAI(LinkType: byte; SheetIndex: integer;
  DataRange: TxlsDataRange);
var
  Sz: integer;
  Fml: TCHART_PTG_AREA3D;
begin
  Sz := SizeOf(TCHART_AI);

  if SheetIndex >= 0 then
    Sz := Sz + SizeOf(TCHART_PTG_AREA3D);

  FillChar(FBuffer^, Sz, #0);
  PCHART_AI(FBuffer).LinkType := LinkType;
  case PCHART_AI(FBuffer).LinkType of
    $00: PCHART_AI(FBuffer).ReferenceType := $01;
    $01: PCHART_AI(FBuffer).ReferenceType := $02;
    $02: PCHART_AI(FBuffer).ReferenceType := $02; //$00;
    $03: PCHART_AI(FBuffer).ReferenceType := $01;
  end;
  PCHART_AI(FBuffer).Flags := $0000;
  PCHART_AI(FBuffer).FormatIndex := $0000;

  if SheetIndex >= 0 then begin
    PCHART_AI(FBuffer).FormulaSize := SizeOf(TCHART_PTG_AREA3D);
    Fml.ID := $3B;
    Fml.PTG_AREA3D.Index := SheetIndex;
    Fml.PTG_AREA3D.Row1 := DataRange.Row1 - 1;
    Fml.PTG_AREA3D.Row2 := DataRange.Row2 - 1;
    Fml.PTG_AREA3D.Col1 := DataRange.Col1 - 1;
    Fml.PTG_AREA3D.Col2 := DataRange.Col2 - 1;

    Move(Fml, FBuffer[SizeOf(TCHART_AI)], SizeOf(TCHART_PTG_AREA3D));
  end
  else PCHART_AI(FBuffer).FormulaSize := 0;
  WriteRecord(CHART_AI, Sz);
end;

procedure TQExport3XLS.WriteSeriesText(const Str: string; const WStr: WideString;
  IsUnicode: boolean);
var
  Sz, Ln: integer;
begin
  if IsUnicode then begin
    Ln := Length(WStr);
    Sz := SizeOf(TCHART_SERIESTEXT) + Ln * 2 + 1;
  end
  else begin
    Ln := Length(Str);
    Sz := SizeOf(TCHART_SERIESTEXT) + Ln + 1;
  end;
  FillChar(FBuffer^, Sz, #0);
  PCHART_SERIESTEXT(FBuffer).TextID := $0000;
  PCHART_SERIESTEXT(FBuffer).Length := Ln;
  if IsUnicode then begin
    FBuffer[3] := $01;
    Move(WStr[1], FBuffer[4], Ln * 2);
  end
  else begin
    FBuffer[3] := $00;
    Move(Str[1], FBuffer[4], Ln);
  end;
  WriteRecord(CHART_SERIESTEXT, Sz);
end;

procedure TQExport3XLS.WriteDataFormat(Index: integer);
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_DATAFORMAT);
  FillChar(FBuffer^, Sz, #0);
  PCHART_DATAFORMAT(FBuffer).PointNumber := $FFFF;
  PCHART_DATAFORMAT(FBuffer).SeriesIndex := Index;
  PCHART_DATAFORMAT(FBuffer).SeriesNumber := Index;
  PCHART_DATAFORMAT(FBuffer).FormatFlags := $0000;
  WriteRecord(CHART_DATAFORMAT, Sz);
end;

procedure TQExport3XLS.WriteSerToCRT;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_SERTOCRT);
  FillChar(FBuffer^, Sz, #0);
  PCHART_SERTOCRT(FBuffer).ChartGroupIndex := $0000;
  WriteRecord(CHART_SERTOCRT, Sz);
end;

procedure TQExport3XLS.WriteShtProps;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_SHTPROPS);
  FillChar(FBuffer^, Sz, #0);
  PCHART_SHTPROPS(FBuffer).PropertyFlags := $000A;
  PCHART_SHTPROPS(FBuffer).EmptyAs := $00;
  PCHART_SHTPROPS(FBuffer).Unknown := $00;
  WriteRecord(CHART_SHTPROPS, Sz);
end;

procedure TQExport3XLS.WriteDefaultText(ObjectID: word);
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_DEFAULTTEXT);
  FillChar(FBuffer^, Sz, #0);
  PCHART_DEFAULTTEXT(FBuffer).ObjectID := ObjectID;
  WriteRecord(CHART_DEFAULTTEXT, Sz);
end;

procedure TQExport3XLS.WriteText;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_TEXT);
  FillChar(FBuffer^, Sz, #0);
  PCHART_TEXT(FBuffer).HorizontalAlignment := $02;
  PCHART_TEXT(FBuffer).VerticalAlignment := $02;
  PCHART_TEXT(FBuffer).BackgroundMode := $0001;
  PCHART_TEXT(FBuffer).Color := $00000000;

  PCHART_TEXT(FBuffer).Left := $0000066B;
  PCHART_TEXT(FBuffer).Top := $00000052;
  PCHART_TEXT(FBuffer).Width := $000002CA;
  PCHART_TEXT(FBuffer).Height := $0000018D;

  PCHART_TEXT(FBuffer).OptionFlags1 := $0081;
  PCHART_TEXT(FBuffer).ColorIndex := $004D;
  PCHART_TEXT(FBuffer).OptionFlags2 := $3D20;
  PCHART_TEXT(FBuffer).Rotation := $0000;
  WriteRecord(CHART_TEXT, Sz);
end;

procedure TQExport3XLS.WritePos(IsLegend: boolean; X1, Y1,
  X2, Y2: cardinal);
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_POS);
  FillChar(FBuffer^, Sz, #0);
  if IsLegend
    then PCHART_POS(FBuffer).TopLt := $0005
    else PCHART_POS(FBuffer).TopLt := $0002;
  PCHART_POS(FBuffer).BotRt := $0002;
  PCHART_POS(FBuffer).X1 := X1;
  PCHART_POS(FBuffer).Y1 := Y1;
  PCHART_POS(FBuffer).X2 := X2;
  PCHART_POS(FBuffer).Y2 := Y2;
  WriteRecord(CHART_POS, Sz);
end;

procedure TQExport3XLS.WriteFontX(FontIndex: word);
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_FONTX);
  FillChar(FBuffer^, Sz, #0);
  PCHART_FONTX(FBuffer).FontIndex := 0; // FontIndex
  WriteRecord(CHART_FONTX, Sz);
end;

procedure TQExport3XLS.WriteAxesUsed;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_AXESUSED);
  FillChar(FBuffer^, Sz, #0);
  PCHART_AXESUSED(FBuffer).AxesCount := $0001;
  WriteRecord(CHART_AXESUSED, Sz);
end;

procedure TQExport3XLS.WriteAxisParent;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_AXISPARENT);
  FillChar(FBuffer^, Sz, #0);
  PCHART_AXISPARENT(FBuffer).AxisIndex := $0000;
  PCHART_AXISPARENT(FBuffer).Top := $000001EA;
  PCHART_AXISPARENT(FBuffer).Left := $0000037F;
  PCHART_AXISPARENT(FBuffer).Width := $00000A2E;
  PCHART_AXISPARENT(FBuffer).Height := $00000998;
  WriteRecord(CHART_AXISPARENT, Sz);
end;

procedure TQExport3XLS.WriteAxis(AxisType: word);
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_AXIS);
  FillChar(FBuffer^, Sz, #0);
  PCHART_AXIS(FBuffer).AxisType := AxisType;
  WriteRecord(CHART_AXIS, Sz);
end;

procedure TQExport3XLS.WriteCatSerRange;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_CATSERRANGE);
  FillChar(FBuffer^, Sz, #0);
  PCHART_CATSERRANGE(FBuffer).CrossingPoint := $0001;
  PCHART_CATSERRANGE(FBuffer).FrequencyLabels := $0001;
  PCHART_CATSERRANGE(FBuffer).FrequencyMarks := $0001;
  PCHART_CATSERRANGE(FBuffer).FormatFlags := $0001;
  WriteRecord(CHART_CATSERRANGE, Sz);
end;

procedure TQExport3XLS.WriteAxcExt;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_AXCEXT);
  FillChar(FBuffer^, Sz, #0);
  PCHART_AXCEXT(FBuffer).MinCategory := $0000;
  PCHART_AXCEXT(FBuffer).MaxCategory := $0000;
  PCHART_AXCEXT(FBuffer).MajorValue := $0001;
  PCHART_AXCEXT(FBuffer).MajorUnits := $0000;
  PCHART_AXCEXT(FBuffer).MinorValue := $0001;
  PCHART_AXCEXT(FBuffer).MinorUnits := $0000;
  PCHART_AXCEXT(FBuffer).BaseUnit := $0000;
  PCHART_AXCEXT(FBuffer).CrossingPoint := $0000;
  PCHART_AXCEXT(FBuffer).OptionFlags := $00EF;
  WriteRecord(CHART_AXCEXT, Sz);
end;

procedure TQExport3XLS.WriteTick;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_TICK);
  FillChar(FBuffer^, Sz, #0);
  PCHART_TICK(FBuffer).MajorMarkType := $02;
  PCHART_TICK(FBuffer).MinorMarkType := $00;
  PCHART_TICK(FBuffer).LabelPosition := $03;
  PCHART_TICK(FBuffer).BackgroundMode := $01;
  PCHART_TICK(FBuffer).Color := $00000000;
  PCHART_TICK(FBuffer).DisplayFlags := $0023;
  PCHART_TICK(FBuffer).ColorIndex := $004D;
  WriteRecord(CHART_TICK, Sz);
end;

procedure TQExport3XLS.WriteValueRange;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_VALUERANGE);
  FillChar(FBuffer^, Sz, #0);
  PCHART_VALUERANGE(FBuffer).MinValue := 0;
  PCHART_VALUERANGE(FBuffer).MaxValue := 0;
  PCHART_VALUERANGE(FBuffer).MajorInc := 0;
  PCHART_VALUERANGE(FBuffer).MinorInc := 0;
  PCHART_VALUERANGE(FBuffer).AxisCrosses := $00;
  PCHART_VALUERANGE(FBuffer).FormatFlags := $001F;
  WriteRecord(CHART_VALUERANGE, Sz);
end;

procedure TQExport3XLS.WriteAxisLineFormat;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_AXISLINEFORMAT);
  FillChar(FBuffer^, Sz, #0);
  PCHART_AXISLINEFORMAT(FBuffer).LineID := $0001;
  WriteRecord(CHART_AXISLINEFORMAT, Sz);
end;

procedure TQExport3XLS.WriteChartFormat(Style: TxlsChartStyle);
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_CHARTFORMAT);
  FillChar(FBuffer^, Sz, #0);
  if Style in [xcsPie, xcsPie3d]
    then PCHART_CHARTFORMAT(FBuffer).FormatFlags := $0001
    else PCHART_CHARTFORMAT(FBuffer).FormatFlags := $0000;
  PCHART_CHARTFORMAT(FBuffer).DrawingOrder := $0000;
  WriteRecord(CHART_CHARTFORMAT, Sz);
end;

procedure TQExport3XLS.WriteBar(IsBar: boolean);
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_BAR);
  FillChar(FBuffer^, Sz, #0);
  PCHART_BAR(FBuffer).SpaceBars := $0000;
  PCHART_BAR(FBuffer).SpaceCategories := $0096;

  if IsBar
    then PCHART_BAR(FBuffer).FormatFlags := $0001
    else PCHART_BAR(FBuffer).FormatFlags := $0000;
  WriteRecord(CHART_BAR, Sz);
end;

procedure TQExport3XLS.WriteLine;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_LINE);
  FillChar(FBuffer^, Sz, #0);
  PCHART_LINE(FBuffer).FormatFlags := $0000;
  WriteRecord(CHART_LINE, Sz);
end;

procedure TQExport3XLS.WritePie;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_PIE);
  FillChar(FBuffer^, Sz, #0);
  PCHART_PIE(FBuffer).Angle := $0000;
  PCHART_PIE(FBuffer).Donut := $0000;
  PCHART_PIE(FBuffer).OptionFlags := $0001;
  WriteRecord(CHART_PIE, Sz);
end;

procedure TQExport3XLS.WriteArea;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_AREA);
  FillChar(FBuffer^, Sz, #0);
  PCHART_AREA(FBuffer).FormatFlags := $0000;
  WriteRecord(CHART_AREA, Sz);
end;

procedure TQExport3XLS.WriteSurface;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_SURFACE);
  FillChar(FBuffer^, Sz, #0);
  PCHART_SURFACE(FBuffer).OptionFlags := $0000;
  WriteRecord(CHART_SURFACE, Sz);
end;

procedure TQExport3XLS.WriteRadar;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_RADAR);
  FillChar(FBuffer^, Sz, #0);
  PCHART_RADAR(FBuffer).OptionFlags := $0000;
  WriteRecord(CHART_RADAR, Sz);
end;

procedure TQExport3XLS.WriteRadarArea;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_RADARAREA);
  FillChar(FBuffer^, Sz, #0);
  PCHART_RADARAREA(FBuffer).OptionFlags := $0000;
  WriteRecord(CHART_RADARAREA, Sz);
end;

procedure TQExport3XLS.Write3d;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_3D);
  FillChar(FBuffer^, Sz, #0);
  PCHART_3D(FBuffer).Rotation := $0014;
  PCHART_3D(FBuffer).Elevation := $000F;
  PCHART_3D(FBuffer).Distance := $001E;
  PCHART_3D(FBuffer).PlotHeight := $0064;
  PCHART_3D(FBuffer).Depth := $0064;
  PCHART_3D(FBuffer).Space := $0096;
  PCHART_3D(FBuffer).OptionFlags := $0015;
  WriteRecord(CHART_3D, Sz);
end;

procedure TQExport3XLS.WriteLegend(Placement: byte);
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_LEGEND);
  FillChar(FBuffer^, Sz, #0);
  PCHART_LEGEND(FBuffer).Top := $00000CA7;
  PCHART_LEGEND(FBuffer).Left := $0000079B;
  PCHART_LEGEND(FBuffer).Width := $000002C6;
  PCHART_LEGEND(FBuffer).Height := $0000014D;
  PCHART_LEGEND(FBuffer).LegendType := Placement;
  PCHART_LEGEND(FBuffer).Spacing := $01;
  PCHART_LEGEND(FBuffer).OptionFlags := $001F;
  WriteRecord(CHART_LEGEND, Sz);
end;

procedure TQExport3XLS.WriteObjectLink;
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_OBJECTLINK);
  FillChar(FBuffer^, Sz, #0);
  PCHART_OBJECTLINK(FBuffer).LinkedTo := $0001;
  PCHART_OBJECTLINK(FBuffer).SeriesIndex := $0000;
  PCHART_OBJECTLINK(FBuffer).DataIndex := $0000;
  WriteRecord(CHART_OBJECTLINK, Sz);
end;

procedure TQExport3XLS.WriteSIIndex(Index: word);
var
  Sz: integer;
begin
  Sz := SizeOf(TCHART_SIINDEX);
  FillChar(FBuffer^, Sz, #0);
  PCHART_SIINDEX(FBuffer).Index := Index;
  WriteRecord(CHART_SIINDEX, Sz);
end;

procedure TQExport3XLS.WriteGlobals;
begin
  WriteBOF(BIFF_BOF_GLOBALS);
  WriteWriteAccess;
  WriteWordRecord(BIFF_CODEPAGE, $04E4);
  WriteWordRecord(BIFF_DSF, $0);
  WriteWordRecord(BIFF_FNGROUPCOUNT, $000E);
  WriteWordRecord(BIFF_WINDOWPROTECT, $0);
  WriteWordRecord(BIFF_PROTECT, $0);
  WriteWordRecord(BIFF_PASSWORD, $0);
  WriteWordRecord(BIFF_PROT4REV, $0);
  WriteWordRecord(BIFF_PROT4REVPASS, $0);
  WriteWindow1;
  WriteWordRecord(BIFF_BACKUP, $0);
  WriteWordRecord(BIFF_HIDEOBJ, $0);
  WriteWordRecord(BIFF_1904, $0);
  WriteWordRecord(BIFF_PRECISION, $0001);
  WriteWordRecord(BIFF_REFRESHALL, $0);
  WriteWordRecord(BIFF_BOOKBOOL, $0);

  FGlobalsInset := FStream.Position;

  WriteEOF;
end;

procedure TQExport3XLS.WriteSheetStart(Sheet: TxlsSheet);
var
  BoundSheet: TxlsBoundSheet;
begin
  Sheet.FColumnList.Clear;
  
  BoundSheet := TxlsBoundSheet.Create;
  FBoundSheetList.Add(BoundSheet);

  BoundSheet.Index := Sheet.Index;
  BoundSheet.Title := Sheet.Title;
  BoundSheet.BOFPos := FStream.Position;

  WriteBOF(BIFF_BOF_WORKSHEET);
  WriteWordRecord(BIFF_CALCMODE, $0001);
  WriteWordRecord(BIFF_CALCCOUNT, $0064);
  WriteWordRecord(BIFF_REFMODE, $0001);
  WriteWordRecord(BIFF_ITERATION, $0000);
  WriteDelta;
  WriteWordRecord(BIFF_SAVERECALC, $0001);
  WriteWordRecord(BIFF_PRINTHEADERS, $0000);
  WriteWordRecord(BIFF_PRINTGRIDLINES, $0000);
  WriteWordRecord(BIFF_GRIDSET, $0001);
  WriteGuts;
  WriteDefColWidth(Sheet.DefColWidth);
  WriteDefRowHeight(Sheet.DefRowHeight);
  WriteWordRecord(BIFF_WSBOOL, $04C1);
  WriteCatchword(BIFF_HEADER, Sheet.Options.PageHeader);
  WriteCatchword(BIFF_FOOTER, Sheet.Options.PageFooter);
  WriteWordRecord(BIFF_HCENTER, $0000);
  WriteWordRecord(BIFF_VCENTER, $0000);
  WriteBackground(Sheet.Background);
  WriteColInfo(Sheet.Index);

  BoundSheet.DimensionPos := FStream.Position;
  WriteDimensions($00000000, $00000000, $0000, $0000);
end;

procedure TQExport3XLS.WriteSheetFinish(Sheet: TxlsSheet);
var
  i: integer;
  XF: integer;
  HL: TxlsHyperlink;
  Str: string;
begin
  // Cells
  for i := 0 to Sheet.Cells.Count - 1 do begin
    if not Sheet.Cells[i].IsCorrect then Continue;

    case Sheet.Cells[i].CellType of
      ctBoolean: begin
        XF := Sheet.AddXF(DEFAULT_TEXT_FORMAT, Sheet.Cells[i].Format);
        WriteBoolErr(Sheet.Cells[i].Row - 1, Sheet.Cells[i].Col - 1, XF,
          Sheet.Cells[i].Value);
        if Sheet.FNeedCheckRowHeight then
          CheckRowHeight(XF, Sheet.Cells[i].Row - 1);
      end;
      ctDateTime: begin
        XF := Sheet.AddXF(Sheet.Cells[i].DateTimeFormat, Sheet.Cells[i].Format);
        WriteNumber(Sheet.Cells[i].Row - 1, Sheet.Cells[i].Col - 1, XF,
          VarToDateTime(Sheet.Cells[i].Value));
        if Sheet.FNeedCheckRowHeight then
          CheckRowHeight(XF, Sheet.Cells[i].Row - 1);
      end;
      ctNumeric: begin
        XF := Sheet.AddXF(Sheet.Cells[i].NumericFormat, Sheet.Cells[i].Format);
        WriteNumber(Sheet.Cells[i].Row - 1, Sheet.Cells[i].Col - 1, XF,
          Sheet.Cells[i].Value);
        if Sheet.FNeedCheckRowHeight then
          CheckRowHeight(XF, Sheet.Cells[i].Row - 1);
      end;
      ctString: begin
        XF := Sheet.AddXF(DEFAULT_TEXT_FORMAT, Sheet.Cells[i].Format);
        Str := VarToStr(Sheet.Cells[i].Value);
        if Str = EmptyStr
          then WriteBlank(Sheet.Cells[i].Row - 1, Sheet.Cells[i].Col - 1, XF)
          else WriteLabelSST(Sheet.Cells[i].Row - 1, Sheet.Cells[i].Col - 1, XF, Str);
        if Sheet.FNeedCheckRowHeight then
          CheckRowHeight(XF, Sheet.Cells[i].Row - 1);
      end;
    end;
  end;

  // Merged Cells
  WriteMergedCells(Sheet.MergedCells);

  // Hyperlink Labels
  for i := 0 to Sheet.Hyperlinks.Count - 1 do begin
    HL := Sheet.Hyperlinks[i];
    if not HL.IsValid then Continue;
    XF := Sheet.AddXF(DEFAULT_TEXT_FORMAT, HL.Format);
    FBoundSheetList.CheckCell(Sheet.Index, HL.Row - 1, HL.Col - 1);
    WriteLabelSST(HL.Row - 1, HL.Col - 1, XF, HL.Title);
  end;
  WriteWindow2;
  WriteSelection;
  // Hyperlinks
  for i := 0 to Sheet.Hyperlinks.Count - 1 do begin
    HL := Sheet.Hyperlinks[i];
    if not HL.IsValid then Continue;
    WriteHyperlink(HL);
  end;

  // Notes, Charts and Pictures
  WriteNotesChartsAndPictures(Sheet);

  WriteEOF;
end;

end.
