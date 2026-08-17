unit TXtraDev;

{
   TExtraDevices for Delphi
   Written by James Waler
   Copyright (c) 1998, 1999, 2000 by James Waler
   All rights reserved

   ***************************************************************
   THIS SOFTWARE IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
   EITHER EXPRESSED OR IMPLIED. THE USER ASSUMES THE ENTIRE RISK
   OF ANY DAMAGE CAUSED BY THIS SOFTWARE.

   IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR DAMAGE OF ANY
   KIND, LOSS OF DATA, LOSS OF PROFITS, BUSINESS INTERRUPTION OR
   OTHER PECUNIARY LOSS ARISING DIRECTLY OR INDIRECTLY.

   1.82 - 01/21/2001
   TIFF - Fixed pf24bit images
   TIFF - Made images 96 dpi
   PDF  - Corrected right-aligned text
   PDF  - Added fast compression option

   1.81 - 11/28/2000
   PDF - Improved right-aligned text
   PDF - Added right-aligned memos
   HTML - Fix for bottom line

   1.8 - 11/15/2000
   PDF - Right aligned single line labels work with all fonts
   RTF - Added stripping of EOPs
   ALL - Trim lines so that they do not hide other objects
   PDF - Fixed lines joins
   PDF - Fixed crosstab text
   PDF - RichText over multiple pages

   1.72 - 10/10/2000
   Fixed checkbox in RTF
   Added multiline support to RichText in PDF
   Added EOP stripping for RB 5.1 FT

   1.71 - 7/30/2000
   Fixed barcode crop in all devices

   1.7 - 5/10/2000
   PDF - Checkbox support
   PDF - Circle & Ellipse support
   PDF - Line style support
   PDF - ZLIB compression support for D5
   Added barcode support to HTML, CSS2, RTF, PDF & Graphic
   PDF - Improved memo rendering
   PDF - Added support for Italics & Bold
   XLS - First column center-aligned labels were fixed
   Added component for device control
   PDF - Fixed right-aligned label placement
   Graphic - Added multipage TIF support
   PDF - Added PlainText RichText support
   PDF - Added support for non-transparent text
   PDF - Added roundrect & roundsquare support
}

interface

uses
  Classes, Windows, Graphics, ExtCtrls, SysUtils, Forms, Controls, ppFilDev, Math, RichEdit,
  ppDevice, ppTypes, ppUtils, ppForms, ppDrwCmd, JPEG, Dialogs, Printers, ComCtrls, ppViewr,
  TXTIFF, TXParse, ppRichTx{$IFDEF VER130},ZLib{$ENDIF};

type
  TReportItemType = (riIgnore, riText, riImage, riLine, riShape, riRTF, riBarCode, riCheckBox);

  TImageCRC = class
    FileName: String;
    CRC: Cardinal;
  end;

  TReportBand = class(TList)
  end;

  TReportItem = class
    ItemType: TReportItemType;
    Row: Integer;
    Top: Integer;
    Left: Integer;
    Height: Integer;
    Width: Integer;
    AdjLeft: Integer;
    AdjHeight: Integer;
    AdjWidth: Integer;
    DrawCmd: TppDrawCommand;
    ZOrder: Integer;
  end;

  { TExtraDevice }

TExtraDevice = class(TppFileDevice)
  private
    Page: TppPage;
    FRow: Integer;
    FCol: Integer;
    FPageNo: Integer;
    FImageNo: Integer;
    MemStream: TMemoryStream;
    SeparateBands: Boolean;
    ConvertFonts: Boolean;
    ImageList: TList;
    CRCTable: array[0..255] of Cardinal;
    procedure GetDrawCommands(Page: TppPage; Cmds: TStringList);
    procedure Write(Buffer: String); virtual;
    procedure Stream(Buffer: String);
    procedure SavePageToFile(Page: TppPage);
    procedure CalcSize(Itm: TReportItem);
    procedure DrawLine(B: TCanvas; Lne: TppDrawLine; Bounds: TRect);
    procedure DrawShape(B: TCanvas; Shp: TppDrawShape; Bounds: TRect);
    procedure DrawCheckBox(B: TBitmap; Txt: TppDrawText; Bounds: TRect; AdjBitmap: Boolean; IgnoreAttr: Boolean);
    function  ImageIndex(J: TObject; FileName: String): Integer;
    function  CRC(MS: TMemoryStream): Cardinal;
    procedure InitCRCTable;
    function  WriteImage(B: TBitmap): String;
    procedure DrawImage(B: TBitmap; Img: TppDrawImage; Bounds: TRect; AdjBitmap: Boolean; IgnoreAttr: Boolean);
    procedure DrawRichText(B: TBitmap; DRT: TppDrawRichText; Bounds: TRect);
    procedure DrawBarCode(B: TCanvas; Bar: TppDrawBarCode; Bounds: TRect);
    function  ConvertFont(FontName: String): String;
  protected
    procedure ProcessBand(Band: TReportBand); virtual;
    procedure StartBand; virtual;
    procedure EndBand; virtual;
    procedure StartPage; virtual;
    procedure EndPage; virtual;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
    procedure EndJob; override;
    procedure StartJob; override;
    procedure ReceivePage(aPage: TppPage); override;
  end;

  { TWK1Device }

  TWK1Device = class(TExtraDevice)
  public
    procedure ProcessBand(Band: TReportBand); override;
    procedure StartJob; override;
    procedure EndJob; override;
    class function DeviceName: String; override;
    class function DefaultExt: String; override;
    class function DefaultExtFilter: String; override;
    class function DeviceDescription(aLanguageIndex: Longint): String; override;
  end;

  { TWQ1Device }

  TWQ1Device = class(TExtraDevice)
  public
    procedure StartJob; override;
    procedure EndJob; override;
    procedure ProcessBand(Band: TReportBand); override;
    class function DeviceName: String; override;
    class function DefaultExt: String; override;
    class function DefaultExtFilter: String; override;
    class function DeviceDescription(aLanguageIndex: Longint): String; override;
  end;

  { TXLSDevice }

  TXLSDevice = class(TExtraDevice)
    FontTbl: TStringList;
    FormatTbl: TStringList;
    XFTbl: TStringList;
  private
    procedure WriteFontTbl;
    procedure WriteFormatTbl;
    procedure WriteXFTbl;
    function FontIndex(Font: TFont): String;
    function FormatIndex(Format: String): String;
    function XFIndex(Txt: TppDrawText): String;
  public
    procedure StartJob; override;
    procedure EndJob; override;
    procedure ProcessBand(Band: TReportBand); override;
    class function DeviceName: String; override;
    class function DefaultExt: String; override;
    class function DefaultExtFilter: String; override;
    class function DeviceDescription(aLanguageIndex: Longint): String; override;
  end;

  { TGraphicDevice }

  TGraphicDevice = class(TExtraDevice)
  private
    Img: TBitmap;
    Tif: TTIFImage;
    Ext: String;
  protected
    procedure StartPage; override;
    procedure EndPage; override;
    procedure ProcessBand(Band: TReportBand); override;
  public
    procedure StartJob; override;
    procedure EndJob; override;
    class function DeviceName: String; override;
    class function DefaultExt: String; override;
    class function DefaultExtFilter: String; override;
    class function DeviceDescription(aLanguageIndex: Longint): String; override;
  end;

  { THTMLDevice }

  THTMLDevice = class(TExtraDevice)
  private
    DestStream: TFileStream;
    BaseFont: String;
    BaseSize: Integer;
    BandWidth: Integer;
    TopOffset: Integer;
    TotWidth: Integer;
  protected
    procedure StartBand; override;
    procedure EndBand; override;
    procedure StartPage; override;
    procedure EndPage; override;
    procedure Write(Buffer: String); override;
    procedure ProcessBand(Band: TReportBand); override;
  public
    procedure StartJob; override;
    procedure EndJob; override;
    class function DeviceName: String; override;
    class function DefaultExt: String; override;
    class function DefaultExtFilter: String; override;
    class function DeviceDescription(aLanguageIndex: Longint): String; override;
  end;

  { TCSS2Device }

  TCSS2Device = class(TExtraDevice)
  private
    DestStream: TFileStream;
  protected
    procedure StartBand; override;
    procedure EndBand; override;
    procedure StartPage; override;
    procedure EndPage; override;
    procedure Write(Buffer: String); override;
    procedure ProcessBand(Band: TReportBand); override;
  public
    procedure StartJob; override;
    procedure EndJob; override;
    class function DeviceName: String; override;
    class function DefaultExt: String; override;
    class function DefaultExtFilter: String; override;
    class function DeviceDescription(aLanguageIndex: Longint): String; override;
  end;

  { TRTFDevice }

  TRTFDevice = class(TExtraDevice)
  private
    BaseFont: String;
    BaseSize: Integer;
    TopOffset: Integer;
    TopMargin: Integer;
    BottomMargin: Integer;
    LeftMargin: Integer;
    RightMargin: Integer;
    FontTbl: TStringList;
    ColorTbl: TStringList;
  protected
    procedure StartBand; override;
    procedure EndBand; override;
    procedure StartPage; override;
    procedure EndPage; override;
    procedure ProcessBand(Band: TReportBand); override;
    procedure WriteFontTbl;
    procedure WriteColorTbl;
    function  FontIndex(Font: String): String;
    function  ColorIndex(Color: TColor): String;
  public
    procedure StartJob; override;
    procedure EndJob; override;
    class function DeviceName: String; override;
    class function DefaultExt: String; override;
    class function DefaultExtFilter: String; override;
    class function DeviceDescription(aLanguageIndex: Longint): String; override;
  end;

  { TPDFDevice }

  TPDFDevice = class(TExtraDevice)
  private
    FontTbl: TStringList;
    FontObj: TStringList;
    FontNme: TStringList;
    CrossRef: TStringList;
    ObjNo: Integer;
    RootObj: Integer;
    BodyObj: String;
    ProcObj: String;
    MaxKids: Integer;
    AnyImages: Boolean;
    InStream: Boolean;
    InImage: Boolean;
    StreamObj: String;
    PageList: TStringList;
    TotPages: Integer;
    StreamSize: Integer;
    PageHeight: Integer;
    PageWidth: Integer;
    FilePos: Integer;
    XRefPos: Integer;
    procedure AddRef(Obj: String);
    procedure WriteCrossRef;
    function  ImageObject(Itm: TReportItem): String;
    procedure WriteBMP(ImgObj: String; B: TBitmap; Mask: Boolean);
    procedure ASCII85(Source, Target: TStream);
    procedure EndStream;
    procedure StartStream;
   {$IFNDEF VER130}
    procedure RunLength(Source, Target: TStream);
    {$ENDIF}
    function  ArcTo(X1, Y1, X2, Y2, XRadius, YRadius: Extended): String;
    procedure RoundRect(Left, Top, Width, Height, XRad, YRad: Extended);
    function  TextWidth(Txt: TppDrawText; Value: String): Extended;
    function  ComputeStringWidth(Wth: array of Word; Txt: TppDrawText; Value: String): Extended;
  protected
    procedure StartBand; override;
    procedure EndBand; override;
    procedure StartPage; override;
    procedure EndPage; override;
    procedure ProcessBand(Band: TReportBand); override;
    procedure WriteFontTbl;
    function  FontIndex(Font: TFont): Integer;
    procedure Write(Buffer: String); override;
    function  NextObj: String;
    function  ParentObj(PageNo: Integer): String;
    function  FontFamily(Font: TFont): String;
  public
    procedure StartJob; override;
    procedure EndJob; override;
    class function DeviceName: String; override;
    class function DefaultExt: String; override;
    class function DefaultExtFilter: String; override;
    class function DeviceDescription(aLanguageIndex: Longint): String; override;
  end;

  { TExtraDeviceOptions }

  TExtraDeviceOptions = class
  private
    FVisible: Boolean;
    procedure SetVisible(Value: Boolean); virtual;
    function GetVisible: Boolean;
  public
    constructor Create; 
    property Visible: Boolean read GetVisible write SetVisible;
  end;

  THTMLDeviceOptions = class(TExtraDeviceOptions)
  private
    FPixelFormat: TPixelFormat;
    FBackLink: String;
    FForwardLink: String;
    FUseTextFile: Boolean;
    FZoomableImages: Boolean;
    FShowLinks: Boolean;
    procedure SetVisible(Value: Boolean); override;
  public
    constructor Create;
    destructor Destroy; override;
    property BackLink: String read FBackLink write FBackLink;
    property ForwardLink: String read FForwardLink write FForwardLink;
    property ShowLinks: Boolean read FShowLinks write FShowLinks;
    property UseTextFileName: Boolean read FUseTextFile write FUseTextFile;
    property ZoomableImages: Boolean read FZoomableImages write FZoomableImages;
    property PixelFormat: TPixelFormat read FPixelFormat write FPixelFormat;
  end;

  TCSS2DeviceOptions = class(TExtraDeviceOptions)
  private
    FPixelFormat: TPixelFormat;
    FBackLink: String;
    FForwardLink: String;
    FUseTextFile: Boolean;
    FZoomableImages: Boolean;
    FShowLinks: Boolean;
    procedure SetVisible(Value: Boolean); override;
  public
    constructor Create;
    destructor Destroy; override;
    property BackLink: String read FBackLink write FBackLink;
    property ForwardLink: String read FForwardLink write FForwardLink;
    property ShowLinks: Boolean read FShowLinks write FShowLinks;
    property UseTextFileName: Boolean read FUseTextFile write FUseTextFile;
    property ZoomableImages: Boolean read FZoomableImages write FZoomableImages;
    property PixelFormat: TPixelFormat read FPixelFormat write FPixelFormat;
  end;

  TRTFDeviceOptions = class(TExtraDeviceOptions)
    procedure SetVisible(Value: Boolean); override;
  end;

  TWK1DeviceOptions = class(TExtraDeviceOptions)
    procedure SetVisible(Value: Boolean); override;
  end;

  TWQ1DeviceOptions = class(TExtraDeviceOptions)
    procedure SetVisible(Value: Boolean); override;
  end;

  TXLSDeviceOptions = class(TExtraDeviceOptions)
    procedure SetVisible(Value: Boolean); override;
  end;

  TPDFDeviceOptions = class(TExtraDeviceOptions)
  private
    FCreator: String;
    FTitle: String;
    FAuthor: String;
    FKeywords: String;
    FSubject: String;
    FFastCompression: Boolean;
    FCompressImages: Boolean;
    FCompressStreams: Boolean;
    FScaleImages: Boolean;
    procedure SetVisible(Value: Boolean); override;
  public
    constructor Create;
    property Creator: String read FCreator write FCreator;
    property Title: String read FTitle write FTitle;
    property Author: String read FAuthor write FAuthor;
    property Keywords: String read FKeywords write FKeywords;
    property Subject: String read FSubject write FSubject;
    property FastCompression: Boolean read FFastCompression write FFastCompression;
    property CompressImages: Boolean read FCompressImages write FCompressImages;
    property CompressStreams: Boolean read FCompressStreams write FCompressStreams;
    property ScaleImages: Boolean read FScaleImages write FScaleImages;
  end;

  TGraphicDeviceOptions = class(TExtraDeviceOptions)
  private
    FPixelFormat: TPixelFormat;
    FUseTextFile: Boolean;
  private
    procedure SetVisible(Value: Boolean); override;
  public
    constructor Create;
    destructor Destroy; override;
    property PixelFormat: TPixelFormat read FPixelFormat write FPixelFormat;
    property UseTextFileName: Boolean read FUseTextFile write FUseTextFile;
  end;

  TExtraOptions = class
    FHTML: THTMLDeviceOptions;
    FCSS2: TCSS2DeviceOptions;
    FRTF: TRTFDeviceOptions;
    FLotus: TWK1DeviceOptions;
    FQuattro: TWQ1DeviceOptions;
    FExcel: TXLSDeviceOptions;
    FGraphic: TGraphicDeviceOptions;
    FPDF: TPDFDeviceOptions;
  public
    constructor Create;
    destructor Destroy; override;
    property HTML: THTMLDeviceOptions read FHTML write FHTML;
    property CSS2: TCSS2DeviceOptions read FCSS2 write FCSS2;
    property RTF: TRTFDeviceOptions read FRTF write FRTF;
    property Lotus: TWK1DeviceOptions read FLotus write FLotus;
    property Quattro: TWQ1DeviceOptions read FQuattro write FQuattro;
    property Excel: TXLSDeviceOptions read FExcel write FExcel;
    property Graphic: TGraphicDeviceOptions read FGraphic write FGraphic;
    property PDF: TPDFDeviceOptions read FPDF write FPDF;
  end;

function ExtraDevices: TExtraOptions;

implementation

const
  CRLF = #13 + #10;
  EOP = #36 + #182;

  HelvNorm: array[0..254] of Word = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,278,278,355,556,556,889,667,222,333,333,389,584,
  278,333,278,278,556,556,556,556,556,556,556,556,556,556,278,278,584,584,584,556,1015,667,667,722,722,667,611,778,
  722,278,500,667,556,833,722,778,667,778,722,667,611,722,667,944,667,667,611,278,278,278,469,556,222,556,556,500,556,
  556,278,556,556,222,222,500,222,833,556,556,556,556,333,500,278,556,500,722,500,500,500,334,260,334,584,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,333,556,556,167,556,556,556,556,191,333,556,333,333,500,500,0,556,
  556,556,278,0,537,350,222,333,333,556,1000,1000,0,611,0,333,333,333,333,333,333,333,333,0,333,333,0,333,333,333,1000,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,0,0,1000,0,370,0,0,0,0,556,778,1000,365,0,0,0,0,0,889,0,0,0,278,0,0,222,611,944,611,0,0,0);

  HelvBold: array[0..254] of Word = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,278,333,474,556,556,889,722,278,333,333,389,584,278,333,
  278,278,556,556,556,556,556,556,556,556,556,556,333,333,584,584,584,611,975,722,722,722,722,667,611,778,722,278,556,722,611,833,722,778,
  667,778,722,667,611,722,667,944,667,667,611,333,278,333,584,556,278,556,611,556,611,556,333,611,611,278,278,556,278,889,611,611,611,611,389,556,
  333,611,556,778,556,556,500,389,280,389,584,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,333,556,556,167,556,556,556,556,
  238,500,556,333,333,611,611,0,556,556,556,278,0,556,350,278,500,500,556,1000,1000,0,611,0,333,333,333,333,333,333,333,333,0,333,333,0,333,333,333,
  1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,370,0,0,0,0,611,778,1000,365,0,0,0,0,0,889,0,0,0,278,0,0,278,611,944,611,0,0,0);

  HelvBldI: array[0..254] of Word = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,278,333,474,556,556,889,722,278,333,333,389,584,278,
  333,278,278,556,556,556,556,556,556,556,556,556,556,333,333,584,584,584,611,975,722,722,722,722,667,611,778,722,278,556,722,611,833,722,778,667,778,722,
  667,611,722,667,944,667,667,611,333,278,333,584,556,278,556,611,556,611,556,333,611,611,278,278,556,278,889,611,611,611,611,389,556,333,611,556,778,556,
  556,500,389,280,389,584,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,333,556,556,167,556,556,556,556,238,500,556,333,333,611,611,
  0,556,556,556,278,0,556,350,278,500,500,556,1000,1000,0,611,0,333,333,333,333,333,333,333,333,0,333,333,0,333,333,333,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,1000,0,370,0,0,0,0,611,778,1000,365,0,0,0,0,0,889,0,0,0,278,0,0,278,611,944,611,0,0,0);

  HelvItal: array[0..254] of Word = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,278,278,355,556,556,889,667,222,333,333,389,584,278,333,
  278,278,556,556,556,556,556,556,556,556,556,556,278,278,584,584,584,556,1015,667,667,722,722,667,611,778,722,278,500,667,556,833,722,778,667,778,
  722,667,611,722,667,944,667,667,611,278,278,278,469,556,222,556,556,500,556,556,278,556,556,222,222,500,222,833,556,556,556,556,333,500,278,556,500,722,
  500,500,500,334,260,334,584,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,333,556,556,167,556,556,556,556,191,333,556,333,333,500,
  500,0,556,556,556,278,0,537,350,222,333,333,556,1000,1000,0,611,0,333,333,333,333,333,333,333,333,0,333,333,0,333,333,333,1000,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,1000,0,370,0,0,0,0,556,778,1000,365,0,0,0,0,0,889,0,0,0,278,0,0,222,611,944,611,0,0,0);

  TimeBold: array[0..254] of Word = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,250,333,555,500,500,1000,833,333,333,333,500,570,250,333,
  250,278,500,500,500,500,500,500,500,500,500,500,333,333,570,570,570,500,930,722,667,722,722,667,611,778,778,389,500,778,667,944,722,778,611,778,722,556,
  667,722,722,1000,722,722,667,333,278,333,581,500,333,500,556,444,556,444,333,500,556,278,333,556,278,833,556,500,556,556,444,389,333,556,500,722,500,500,
  444,394,220,394,520,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,333,500,500,167,500,500,500,500,278,500,500,333,333,556,556,0,500,
  500,500,250,0,540,350,333,500,500,500,1000,1000,0,500,0,333,333,333,333,333,333,333,333,0,333,333,0,333,333,333,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  1000,0,300,0,0,0,0,667,778,1000,330,0,0,0,0,0,722,0,0,0,278,0,0,278,500,722,556,0,0,0);

  TimeBldI: array[0..254] of Word = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,250,389,555,500,500,833,778,333,333,333,500,570,250,333,
  250,278,500,500,500,500,500,500,500,500,500,500,333,333,570,570,570,500,832,667,667,667,722,667,667,722,778,389,500,667,611,889,722,722,611,722,667,556,
  611,722,667,889,667,611,611,333,278,333,570,500,333,500,500,444,500,444,333,500,556,278,278,500,278,778,556,500,500,500,389,389,278,556,444,667,500,444,
  389,348,220,348,570,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,389,500,500,167,500,500,500,500,278,500,500,333,333,556,556,0,
  500,500,500,250,0,500,350,333,500,500,500,1000,1000,0,500,0,333,333,333,333,333,333,333,333,0,333,333,0,333,333,333,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,944,0,266,0,0,0,0,611,722,944,300,0,0,0,0,0,722,0,0,0,278,0,0,278,500,722,500,0,0,0);

  TimeItal: array[0..254] of Word = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,250,333,420,500,500,833,778,333,333,333,500,675,250,
  333,250,278,500,500,500,500,500,500,500,500,500,500,333,333,675,675,675,500,920,611,611,667,722,611,611,722,722,333,444,667,556,833,667,722,611,722,611,
  500,556,722,611,833,611,556,556,389,278,389,422,500,333,500,500,444,500,444,278,500,500,278,278,444,278,722,500,500,500,500,389,389,278,500,444,667,444,
  444,389,400,275,400,541,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,389,500,500,167,500,500,500,500,214,556,500,333,333,500,500,
  0,500,500,500,250,0,523,350,333,556,556,500,889,1000,0,500,0,333,333,333,333,333,333,333,333,0,333,333,0,333,333,333,889,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  889,0,276,0,0,0,0,556,722,944,310,0,0,0,0,0,667,0,0,0,278,0,0,278,500,667,500,0,0,0);

  TimeNorm: array[0..254] of Word = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,250,333,408,500,500,833,778,333,333,333,500,564,250,333,
  250,278,500,500,500,500,500,500,500,500,500,500,278,278,564,564,564,444,921,722,667,667,722,611,556,722,722,333,389,722,611,889,722,722,556,722,667,556,
  611,722,722,944,722,722,611,333,278,333,469,500,333,444,500,444,500,444,333,500,500,278,278,500,278,778,500,500,500,500,333,389,278,500,500,722,500,500,
  444,480,200,480,541,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,333,500,500,167,500,500,500,500,180,444,500,333,333,556,556,0,500,
  500,500,250,0,453,350,333,444,444,500,1000,1000,0,444,0,333,333,333,333,333,333,333,333,0,333,333,0,333,333,333,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,889,
  0,276,0,0,0,0,611,722,889,310,0,0,0,0,0,667,0,0,0,278,0,0,278,500,722,500,0,0,0);

  DingNorm: array[0..254] of Word = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,278,974,961,974,980,719,789,790,791,690,960,939,549,
  855,911,933,911,945,974,755,846,762,761,571,677,763,760,759,754,494,552,537,577,692,786,788,788,790,793,794,816,823,789,841,823,833,816,831,923,744,723,
  749,790,792,695,776,768,792,759,707,708,682,701,826,815,789,789,707,687,696,689,786,787,713,791,785,791,873,761,762,762,759,759,892,892,788,784,438,138,
  277,415,392,392,668,668,0,390,390,317,317,276,276,509,509,410,410,234,234,334,334,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,732,544,544,910,667,760,760,
  776,595,694,626,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,788,
  788,788,788,788,788,788,894,838,1016,458,748,924,748,918,927,928,928,834,873,828,924,924,917,930,931,463,883,836,836,867,867,696,696,874,0,874,760,946,
  771,865,771,888,967,888,831,873,927,970,918);

var FOptions: TExtraOptions = Nil;

function Replace(cString, cSearch, cReplace: String): String;
var
  nSize, nPos, I, nOrig, nNext: Integer;
begin
  I      := 0;
  nPos   := 0;
  nSize  := Length(cReplace) - Length(cSearch);
  nOrig  := Length(cString);
  Result := cString;
  nNext  := Pos(cSearch, cString);

  while nNext > 0 do begin
    nPos := nPos + nNext;
    Delete(Result, nPos + (I * nSize), Length(cSearch));
    Insert(cReplace, Result, nPos + (I * nSize));
    Inc(I);
    nNext := Pos(cSearch, Copy(cString, nPos + 1, nOrig - nPos));
  end;
end;

function IndexOf(SL: TStringList; Value: String): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to SL.Count - 1 do begin
    if SL[I] = Value then begin
       Result := I;
       Break;
    end;
  end;
end;

function MaxInt(I1, I2: Integer): Integer;
begin
  if I1 > I2 then begin
     Result := I1;
  end else begin
     Result := I2;
  end;
end;

function LotWord(Value: Integer): String;
begin
  Result := CHR(Value mod 256) + CHR(Trunc(Value div 256));
end;

type
  IEEES = array[1..8] of byte;

function FloatToIEEE(Value: Double): String;
var
  T: IEEES;
  I: Integer;
begin
  T := IEEES(Value);
  Result := '';
  for I := 1 to 8 do begin
    Result := Result + Char(T[I]);
  end;
end;

function TextToFloat(Value: String): Double;
var
  I: Integer;
  T: String;
begin
  T := '';
  for I := 1 to Length(Value) do begin
    if Value[I] in ['0'..'9', DecimalSeparator, '-'] then begin
       T := T + Value[I];
    end;
  end;
  try
    Result := StrToFloat(T);
  except
    Result := 0;
  end;
end;

function TextToIEEE(Value: String): String;
begin
  Result := FloatToIEEE(TextToFloat(Value));
end;

function IncFile(FileName: String; Value: Integer; AddPath: Boolean): String;
var
  Base, Ext: String;
begin
  Ext  := ExtractFileExt(FileName);
  Base := ExtractFileName(FileName);
  Base := Copy(Base, 1, Length(Base) - Length(Ext));
  if AddPath then begin
     Result := ExtractFilePath(FileName) + Base + FormatFloat('0000', Value) + Ext;
  end else begin
     Result := Base + FormatFloat('0000', Value) + Ext;
  end;
end;

function ThousandthsToTwips(Value: Integer): Integer;
begin
  Result := Trunc((Value / 1000) * 0.0393701 * 1440);
end;

function ThousandthsToPoints(Value: Integer): Integer;
begin
  Result := Round((Value / 1000) * 0.0393701 * 72);
end;

function EThousandthsToPoints(Value: Integer): Extended;
begin
  Result := (Value / 1000) * 0.0393701 * 72;
end;

function PixelsToTwips(Value: Extended): Integer;
begin
  Result := Trunc((Value * (1 / 96)) * 1440);
end;

function PixelsToPoints(Value: Extended): Integer;
begin
  Result := Trunc((Value * (1 / 96)) * 72);
end;

function PointsToPixels(Value: Extended): Integer;
begin
  Result := Trunc((Value * (1 / 72)) * 96);
end;

function VertPixelsToThousandths(Value: Integer): Integer;
begin
  Result := Round(ppFromScreenPixels(Value, utMMThousandths, pprtVertical, Nil));
end;

function ThousandthsToHorzPixels(Value: Integer): Integer;
begin
  Result := ppToScreenPixels(Value, utMMThousandths, pprtHorizontal, Nil);
end;

function ThousandthsToVertPixels(Value: Integer): Integer;
begin
  Result := ppToScreenPixels(Value, utMMThousandths, pprtVertical, Nil);
end;

function RTFToString(RTF: TppDrawRichText): String;
var
  Buffer: String;
begin
  if RTF.StartCharPos = 0 then begin
     RTF.RichTextStream.Position := 0;
     SetLength(Buffer, RTF.RichTextStream.Size);
     RTF.RichTextStream.Read(Buffer[1], RTF.RichTextStream.Size);
     if Copy(Buffer, Length(Buffer) - 2, 2) = #13 + #10 then begin
        Buffer := Copy(Buffer, 1, Length(Buffer) - 2);
     end;
     Result := Trim(Buffer);
  end else begin
     Result := '';
  end;
end;

function RTFToPlainString(RTF: TppDrawRichText): String;
var
  RE: TRichEdit;
  N: Integer;
begin
  RE := TRichEdit.Create(Nil);
  RE.Parent := ppParentWnd;
  RTF.RichTextStream.Position := 0;
  RE.Width := ThousandthsToHorzPixels(RTF.Width);
  RE.Lines.LoadFromStream(RTF.RichTextStream);

  RE.SelStart := 0;
  RE.SelLength := RTF.StartCharPos;
  RE.ClearSelection;

  RE.SelectAll;
  N := RE.SelLength;
  RE.SelStart := RTF.EndCharPos + 1;
  RE.SelLength := N;
  RE.ClearSelection;

  Result := RE.Lines.Text;
  RE.Free;
end;

function ColorToHex(Value: TColor): String;
var
  Color: Integer;
begin
  Color := ColorToRGB(Value);
  Result := '#' + IntToHex(GetRValue(Color), 2) + IntToHex(GetGValue(Color), 2) + IntToHex(GetBValue(Color), 2)
end;

function ColorToStr(Value: TColor): String;
var
  Color: Integer;
begin
  Color  := ColorToRGB(Value);
  Result := FormatFloat('000', GetRValue(Color)) + FormatFloat('000', GetGValue(Color)) + FormatFloat('000', GetBValue(Color));
end;

function ColorToPDF(Value: TColor): String;
var
  Color: Integer;
begin
  Color  := ColorToRGB(Value);
  Result := FormatFloat('0.000', GetRValue(Color) / 255) + ' ' + FormatFloat('0.000', GetGValue(Color) / 255) + ' ' + FormatFloat('0.000', GetBValue(Color) / 255);
  Result := Replace(Result, DecimalSeparator, '.');
end;

function FmtFloat(Value: Extended): String;
begin
//  Result := FloatToStr(Value);
  Result := FormatFloat('#0.0#####', Value);
  Result := Replace(Result, DecimalSeparator, '.');
end;

function ZOrderSort(Item1, Item2: Pointer): Integer;
begin
  Result := 0;
  if TReportItem(Item1).ZOrder > TReportItem(Item2).ZOrder then begin
     Result := 1;
  end;
  if TReportItem(Item1).ZOrder < TReportItem(Item2).ZOrder then begin
     Result := -1;
  end;
  if TReportItem(Item1).ZOrder = TReportItem(Item2).ZOrder then begin
     Result := 0;
  end;
end;

function TextHeight(Font: TFont): Integer;
var
  DC: HDC;
  TM: TTextMetric;
  SaveFont: HFont;
begin
  DC := GetDC(0);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, TM);
  Result := TM.tmAscent + TM.tmDescent + TM.tmExternalLeading;
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  Result := PixelsToPoints(Result);
end;

function Occurs(Value, Sub: String): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 1 to Length(Value) do begin
    if Value[I] = Sub then begin
       Result := Result + 1;
    end;
  end;
end;

function HTMLEncode(Txt: String): String;
var
  I, N: Integer;
begin
  Result := Txt;
  Result := Replace(Result, '&', '&amp;');
  Result := Replace(Result, '<', '&lt;');
  Result := Replace(Result, '>', '&gt;');
  Result := Replace(Result, '"', '&quot;');
  Result := Replace(Result, 'ä', '&auml;');
  Result := Replace(Result, 'Ä', '&Auml;');
  Result := Replace(Result, 'ö', '&oml;');
  Result := Replace(Result, 'Ö', '&Oml;');
  Result := Replace(Result, 'ü', '&uuml;');
  Result := Replace(Result, 'Ü', '&Uuml;');

  N := Length(Result) - Length(TrimLeft(Result));
  Result := TrimLeft(Result);
  for I := 1 to N do begin
    Result := '&nbsp;' + Result;
  end;
end;

function BuildFont(Face: String; Col: TColor; Size: Integer): String;
begin
  Result := '';
  Result := Result + '<FONT';
  Result := Result + ' STYLE=' + CHR(34);
  Result := Result + ' font-family: ' + Face + ';';
  Result := Result + ' color: ' + ColorToHex(Col) + ';';
  Result := Result + ' font-size: ' + IntToStr(Size) + 'pt;';
  Result := Result + CHR(34) + '>';
end;

function RTF2HTML(RTFCmd: TppDrawRichText): String;
var
  BoldOn, UndOn, ItalicOn, FontOn: Boolean;
  RTF: TRTFParser;
  FontSize: Integer;
  FontFace: String;
  FontColor: TColor;
begin

  BoldOn    := False;
  UndOn     := False;
  ItalicOn  := False;
  FontOn    := False;
  FontSize  := 10;
  FontColor := clBlack;
  FontFace  := 'Arial';

  Result := '<DIV>';
  RTFCmd.RichTextStream.Position := 0;

  RTF := TRTFParser.Create(RTFCmd.RichTextStream);

  while RTF.Token <> rtEOF do begin
    case RTF.Token of
      rtText: begin
                if BoldOn then begin
                   Result := Result + '<B>';
                end;
                if UndOn then begin
                   Result := Result + '<U>';
                end;
                if ItalicOn then begin
                   Result := Result + '<I>';
                end;
                Result := Result + HTMLEncode(RTF.TokenString);
                if ItalicOn then begin
                   Result := Result + '</I>';
                end;
                if UndOn then begin
                   Result := Result + '</U>';
                end;
                if BoldOn then begin
                   Result := Result + '</B>';
                end;
              end;
      rtControl:  begin
                if RTF.TokenString = 'tab' then begin
                   Result := Result + HTMLEncode(StringOfChar(' ', 9));
                end;

                if RTF.TokenString = 'par' then begin
                   Result := Result + '<BR>' + CRLF;
                end;

                if RTF.TokenString = 'pard' then begin
                   Result := Result + '</DIV>';
                   Result := Result + '<DIV ALIGN=LEFT ' + Copy(BuildFont(FontFace, FontColor, FontSize), 6, 100);
                end;

                if RTF.TokenString = 'ql' then begin
                   Result := Result + '</DIV>';
                   Result := Result + '<DIV ALIGN=LEFT ' + Copy(BuildFont(FontFace, FontColor, FontSize), 6, 100);
                end;

                if RTF.TokenString = 'qr' then begin
                   Result := Result + '</DIV>';
                   Result := Result + '<DIV ALIGN=RIGHT ' + Copy(BuildFont(FontFace, FontColor, FontSize), 6, 100);
                end;

                if RTF.TokenString = 'qc' then begin
                   Result := Result + '</DIV>';
                   Result := Result + '<DIV ALIGN=CENTER ' + Copy(BuildFont(FontFace, FontColor, FontSize), 6, 100);
                end;

                if RTF.TokenString = 'f' then begin
                   if FontOn then begin
                      Result := Result + '</FONT>';
                   end;
                   FontOn := True;
                   FontFace := RTF.Font[RTF.TokenValue];
                   Result := Result + BuildFont(FontFace, FontColor, FontSize);
                end;

                if RTF.TokenString = 'cf' then begin
                   if FontOn then begin
                      Result := Result + '</FONT>';
                   end;
                   FontOn := True;
                   FontColor := RTF.Color[RTF.TokenValue];
                   Result := Result + BuildFont(FontFace, FontColor, FontSize);
                end;

                if RTF.TokenString = 'fs' then begin
                   if FontOn then begin
                      Result := Result + '</FONT>';
                   end;
                   FontOn := True;
                   FontSize := RTF.TokenValue div 2;
                   Result := Result + BuildFont(FontFace, FontColor, FontSize);
                end;

                if RTF.TokenString = 'b' then begin
                   if BoldOn and RTF.HasTokenValue and (RTF.TokenValue = 0) then begin
                      BoldOn := False;
                   end else begin
                      BoldOn := True;
                   end;
                end;

                if RTF.TokenString = 'ul' then begin
                   if UndOn and RTF.HasTokenValue and (RTF.TokenValue = 0) then begin
                      UndOn := False;
                   end else begin
                      UndOn := True;
                   end;
                end;

                if RTF.TokenString = 'i' then begin
                   if ItalicOn and RTF.HasTokenValue and (RTF.TokenValue = 0) then begin
                      ItalicOn := False;
                   end else begin
                      ItalicOn := True;
                   end;
                end;

                if RTF.TokenString = 'plain' then begin
                   BoldOn := False;
                   UndOn := False;
                   ItalicOn := False;
                   if FontOn then begin
                      FontOn := False;
                      Result := Result + '</FONT>';
                   end;
                end;

              end;
    end;
    RTF.NextToken;
  end;

  RTF.Free;

  if FontOn then begin
     Result := Result + '</FONT>';
  end;

  Result := Result + '</DIV>';

end;

{ TExtraDevice }

constructor TExtraDevice.Create(aOwner: TComponent);
begin
  inherited;
end;

destructor TExtraDevice.Destroy;
begin
  inherited;
end;

procedure TExtraDevice.StartJob;
begin
  inherited;
  MemStream := TMemoryStream.Create;
  SeparateBands := True;
  ConvertFonts := False;
  InitCRCTable;
  ImageList := TList.Create;

  FRow := 0;
  FCol := 0;
  FPageNo := 0;
  FImageNo := 0;
end;

procedure TExtraDevice.EndJob;
var
  I: Integer;
begin
  MemStream.Free;
  for I := 0 to ImageList.Count - 1 do begin
    TImageCRC(ImageList[I]).Free;
  end;
  ImageList.Free;
  inherited;
end;

procedure TExtraDevice.StartPage;
begin
  Inc(FPageNo);
end;

procedure TExtraDevice.EndPage;
begin
end;

procedure TExtraDevice.StartBand;
begin
  FCol := 0;
end;

procedure TExtraDevice.EndBand;
begin
  Inc(FRow);
end;

procedure TExtraDevice.ProcessBand(Band: TReportBand);
begin
end;

procedure TExtraDevice.ReceivePage(aPage: TppPage);
begin
  inherited;
  Page := aPage;

  {$IFDEF EXTRADEMO}
  if FPageNo > 0 then begin
     Exit;
  end;
  {$ENDIF}

  if IsRequestedPage then begin
     DisplayMessage(aPage);
     if not IsMessagePage then begin
        SavePageToFile(aPage);
     end;
  end;
end;

procedure TExtraDevice.Write(Buffer: String);
begin
  if Length(Buffer) > 0 then begin
     FileStream.Write(Buffer[1], Length(Buffer));
  end;   
end;

procedure TExtraDevice.Stream(Buffer: String);
begin
  if Length(Buffer) > 0 then begin
     MemStream.Write(Buffer[1], Length(Buffer));
  end;
end;

procedure TExtraDevice.GetDrawCommands(Page: TppPage; Cmds: TStringList);
var
  I, N, W, X, Y, Row, LastTop: Integer;
  DrawCmd: TppDrawCommand;
  Order: String;
  Itm: TReportItem;
  Txt: TppDrawText;
begin
  N := Page.DrawCommandCount;

  for I := 0 to N - 1 do begin
    DrawCmd := Page.DrawCommands[I];
    Order := '';

    Itm := TReportItem.Create;
    Itm.ItemType := riIgnore;
    Itm.DrawCmd  := DrawCmd;
    Itm.Top      := DrawCmd.Top;
    Itm.Left     := DrawCmd.Left;
    Itm.Width    := DrawCmd.Width;
    Itm.Height   := DrawCmd.Height;
    Itm.ZOrder   := I;

    if DrawCmd is TppDrawLine then begin
       if TppDrawLine(DrawCmd).Pen.Style <> psClear then begin
          Itm.ItemType := riLine;
          if TppDrawLine(DrawCmd).LineStyle = lsSingle then begin
             X := 1;
          end else begin
             X := 2;
          end;
          W := VertPixelsToThousandths(Trunc(TppDrawLine(DrawCmd).Pen.Width));
          case TppDrawLine(DrawCmd).LinePosition of
            lpTop:    begin
                        Itm.Height := X * (W + 3);
                      end;
            lpBottom: begin
                        Y := X * (W + 3);
                        Itm.Top := Itm.Top + Itm.Height - Y;
                        Itm.Height := Y;
                      end;
            lpLeft:   begin
                        Itm.Width := X * (W + 3);
                      end;
            lpRight:  begin
                        Y := X * (W + 3);
                        Itm.Left := Itm.Left + Itm.Width - Y;
                        Itm.Width := Y;
                        Itm.AdjWidth := Itm.Width;
                      end;
          end;
       end;
    end;

    if DrawCmd is TppDrawText then begin
       Txt := TppDrawText(Itm.DrawCmd);
       Itm.ItemType := riText;
       if (UpperCase(Txt.Font.Name) = 'WINGDINGS') and (Length(Txt.Text) = 1) then begin
          if (Txt.Text[1] in [#168, #254, #252, #251, #253]) then begin
             Itm.ItemType := riCheckBox;
          end;
       end;
       TppDrawText(Itm.DrawCmd).Font.Size := Abs(TppDrawText(Itm.DrawCmd).Font.Size);
       if ConvertFonts then begin
          TppDrawText(Itm.DrawCmd).Font.Name := ConvertFont(TppDrawText(Itm.DrawCmd).Font.Name);
       end;
    end;

    if DrawCmd is TppDrawRichText then begin
       Itm.ItemType := riRTF;
    end;

    if DrawCmd is TppDrawImage then begin
       Itm.ItemType := riImage;
    end;

    if DrawCmd is TppDrawShape then begin
       if (TppDrawShape(DrawCmd).Pen.Style <> psClear) or (TppDrawShape(DrawCmd).Brush.Style <> bsClear) then begin
          Itm.ItemType := riShape;
       end;
    end;

    if DrawCmd is TppDrawBarCode then begin
       Itm.ItemType := riBarCode;
    end;

    CalcSize(Itm);

    Order := FormatFloat('00000000', Itm.Top) + FormatFloat('00000000', Itm.Left);

    Cmds.AddObject(Order, Itm);
  end;

  Cmds.Sort;
  Row := 0;
  I   := 0;

  while I < Cmds.Count do begin

    Itm := TReportItem(Cmds.Objects[I]);
    LastTop := Itm.Top + 2000;

    while LastTop > Itm.Top do begin
      Itm.Row := Row;
      Cmds[I] := FormatFloat('00000000', Itm.Row) + FormatFloat('00000000', Itm.Left);
      Inc(I);

      if I >= Cmds.Count then begin
         Break;
      end else begin
         Itm := TReportItem(Cmds.Objects[I]);
      end;
    end;

    Inc(Row);
  end;

  Cmds.Sort;

end;

procedure TExtraDevice.CalcSize(Itm: TReportItem);
var
  Bmp: TBitmap;
  Cmd: TppDrawText;
  Right, Center, Left, Width, Height: Integer;
begin
  Itm.AdjLeft   := Itm.Left;
  Itm.AdjWidth  := Itm.Width;
  Itm.AdjHeight := Itm.Height;

  if Itm.DrawCmd is TppDrawText then begin
     Left   := Itm.Left;
     Width  := Itm.Width;
     Height := Itm.Height;
     Center := Itm.Left + Itm.Width div 2;
     Right  := Itm.Left + Itm.Width;
     Cmd := TppDrawText(Itm.DrawCmd);

     Bmp := TBitmap.Create;
     Bmp.Canvas.Font := Cmd.Font;

     if Cmd.IsMemo then begin
     end else begin
        Width  := Bmp.Canvas.TextWidth(Cmd.Text);
        Width  := Trunc(ppFromScreenPixels(Width, utMMThousandths, pprtHorizontal, Nil));
        Height := Bmp.Canvas.TextHeight(Cmd.Text);
        Height := Trunc(ppFromScreenPixels(Height, utMMThousandths, pprtVertical, Nil));
     end;
     if Cmd.TextAlignment = taRightJustified then begin
        Left := Right - Width;
     end;
     if Cmd.TextAlignment = taCentered then begin
        Left := Center - Width div 2;
     end;

     Bmp.Free;

     if Cmd.AutoSize = True then begin
        Itm.Left   := Left;
        Itm.Width  := Width;
        Itm.Height := Height;
     end;
     Itm.AdjLeft   := Left;
     Itm.AdjWidth  := Width;
     Itm.AdjHeight := Height;
  end;
end;

function TExtraDevice.ConvertFont(FontName: String): String;
begin
  Result := 'Times New Roman';

  if Pos('COURIER', UpperCase(FontName)) <> 0 then begin
     Result := 'Courier';
  end;

  if Pos('ARIAL', UpperCase(FontName)) <> 0 then begin
     Result := 'Arial';
  end;

  if Pos('WINGDINGS', UpperCase(FontName)) <> 0 then begin
     Result := 'Wingdings';
  end;

  if Pos('TIMES', UpperCase(FontName)) <> 0 then begin
     Result := 'Times New Roman';
  end;
end;

procedure TExtraDevice.SavePageToFile(Page: TppPage);
var
  I: Integer;
  Cmds: TStringList;
  RptItem: TReportItem;
  LastRow: Integer;
  Band: TReportBand;
begin

  Cmds := TStringList.Create;
  GetDrawCommands(Page, Cmds);

  if Cmds.Count = 0 then begin
     Cmds.Free;
     Exit;
  end;

  StartPage;

  // Process Commands

  I := 0;

  while I < Cmds.Count do begin

    RptItem := TReportItem(Cmds.Objects[I]);
    LastRow := RptItem.Row;

    StartBand;

    Band := TReportBand.Create;

    while (not SeparateBands) or (LastRow = RptItem.Row) do begin
      Band.Add(RptItem);
      Inc(I);

      if I >= Cmds.Count then begin
         Break;
      end else begin
         RptItem := TReportItem(Cmds.Objects[I]);
      end;
    end;

    ProcessBand(Band);
    Band.Free;

    EndBand;

  end;

  EndPage;

  for I := 0 to Cmds.Count - 1 do begin
    TReportItem(Cmds.Objects[I]).Free;
  end;

  Cmds.Free;

end;

procedure TExtraDevice.DrawLine(B: TCanvas; Lne: TppDrawLine; Bounds: TRect);
var
  Width, Height, N, L, H, X, XOffset, YOffset: Integer;
begin

  Width  := Bounds.Right - Bounds.Left;
  Height := Bounds.Bottom - Bounds.Top;
  B.Pen.Assign(Lne.Pen);
  B.Pen.Width := 1;

  X := PointsToPixels(Lne.Weight);
  if X = 0 then begin
     X := 1;
  end;

  if Lne.LineStyle = lsSingle then begin
     N := 1;
  end else begin
     N := 2;
  end;

  XOffset := Bounds.Left;
  YOffset := Bounds.Top;

  for L := 0 to N - 1 do begin

    for H := 0 to X - 1 do begin

      if Lne.LinePosition = lpTop then begin
         B.MoveTo(XOffset, YOffset + H + (L * X * 2));
         B.LineTo(XOffset + Width, YOffset + H + (L * X * 2));
      end;

      if Lne.LinePosition = lpBottom then begin
         B.MoveTo(XOffset, YOffset + (Height - 1) - H - (L * X * 2));
         B.LineTo(XOffset + Width, YOffset + (Height - 1) - H - (L * X * 2));
      end;

      if Lne.LinePosition = lpLeft then begin
         B.MoveTo(XOffset + H + (L * X * 2), YOffset);
         B.LineTo(XOffset + H + (L * X * 2), YOffset + Height);
      end;

      if Lne.LinePosition = lpRight then begin
         B.MoveTo(XOffset + Width - H - (L * X * 2) - 1, YOffset);
         B.LineTo(XOffset + Width - H - (L * X * 2) - 1, YOffset + Height);
      end;

    end;

  end;

end;

procedure TExtraDevice.DrawShape(B: TCanvas; Shp: TppDrawShape; Bounds: TRect);
var
  Top, Left, Width, Height, XCR, YCR: Integer;
begin

//  Removed 4/9/00
//  if Shp.Pen.Width <> 1 then begin
//     InflateRect(Bounds, -Shp.Pen.Width, -Shp.Pen.Width);
//  end;

  Width  := Bounds.Right - Bounds.Left;
  Height := Bounds.Bottom - Bounds.Top;

  B.Brush.Assign(Shp.Brush);
  B.Pen.Assign(Shp.Pen);

  if Shp.ShapeType in [stCircle] then begin
     if Width > Height then begin
        Left := Bounds.Left + (Width - Height) div 2;
        B.Ellipse(Left, Bounds.Top, Left + Height, Bounds.Bottom);
     end else begin
        Top := Bounds.Top + (Height - Width) div 2;
        B.Ellipse(Bounds.Left, Top, Bounds.Right, Top + Width);
     end;
  end;

  if Shp.ShapeType in [stEllipse] then begin
     B.Ellipse(Bounds.Left, Bounds.Top, Bounds.Right, Bounds.Bottom);
  end;

  if Shp.ShapeType in [stSquare] then begin
     if Width > Height then begin
        Left := Bounds.Left + (Width - Height) div 2;
        B.Rectangle(Left, Bounds.Top, Left + Height, Bounds.Bottom);
     end else begin
        Top := Bounds.Top + (Height - Width) div 2;
        B.Rectangle(Bounds.Left, Top, Bounds.Right, Top + Width);
     end;
  end;

  if Shp.ShapeType in [stRectangle] then begin
     B.Rectangle(Bounds.Left, Bounds.Top, Bounds.Right, Bounds.Bottom);
  end;

  if Shp.ShapeType in [stRoundSquare] then begin
     XCR := ppToScreenPixels(Shp.XCornerRound, utMMThousandths, pprtHorizontal, Nil);
     YCR := ppToScreenPixels(Shp.YCornerRound, utMMThousandths, pprtVertical, Nil);
     if Width > Height then begin
        Left := Bounds.Left + (Width - Height) div 2;
        B.RoundRect(Left, Bounds.Top, Left + Height, Bounds.Bottom, XCR, YCR);
     end else begin
        Top := Bounds.Top + (Height - Width) div 2;
        B.RoundRect(Bounds.Left, Top, Bounds.Right, Top + Width, XCR, YCR);
     end;
  end;

  if Shp.ShapeType in [stRoundRect] then begin
     XCR := ppToScreenPixels(Shp.XCornerRound, utMMThousandths, pprtHorizontal, Nil);
     YCR := ppToScreenPixels(Shp.YCornerRound, utMMThousandths, pprtVertical, Nil);
     B.RoundRect(Bounds.Left, Bounds.Top, Bounds.Right, Bounds.Bottom, XCR, YCR);
  end;

end;

procedure TExtraDevice.DrawBarCode(B: TCanvas; Bar: TppDrawBarCode; Bounds: TRect);
var
  T: TBitmap;
  P: TPoint;
begin

  T := TBitmap.Create;

  Bar.CalcBarCodeSize(T.Canvas);

  if Bar.Orientation in [orLeftToRight, orRightToLeft] then begin
     T.Width  := Bar.PortraitWidth;
     T.Height := Bar.PortraitHeight;
  end else begin
     T.Width  := Bar.PortraitHeight;
     T.Height := Bar.PortraitWidth;
  end;

  P := Point(Screen.PixelsPerInch, Screen.PixelsPerInch);
  T.Canvas.Pen.Color := clBlack;

  Bar.DrawBarCode(T.Canvas, 0, 0, P, True);
  B.StretchDraw(Bounds, T);
  T.Free;

end;

procedure TExtraDevice.DrawRichText(B: TBitmap; DRT: TppDrawRichText; Bounds: TRect);
var
  MF: TMetaFile;
  MC: TMetaFileCanvas;
  Width, Height: Integer;
  CharRange: TCharRange;
  DC: hDC;
  R: TRect;
  RE: TCustomRichEdit;
begin

  RE := ppGetRichEditClass.Create(ppParentWnd);
  RE.Parent := ppParentWnd;

  DRT.RichTextStream.Position := 0;
  ppGetRichEditLines(RE).LoadFromStream(DRT.RichTextStream);

  CharRange.cpMin := DRT.StartCharPos;
  CharRange.cpMax := DRT.EndCharPos;

  DC := GetDC(0);

  Width  := Bounds.Right - Bounds.Left;
  Height := Bounds.Bottom - Bounds.Top;

  R := Rect(0, 0, Width, Height);

  MF := TMetaFile.Create;
  MF.Width  := Width;
  MF.Height := Height;

  MC := TMetaFileCanvas.Create(MF, DC);

  if not DRT.Transparent then begin
     MC.Brush.Style := bsSolid;
     MC.Brush.Color := DRT.Color;
     MC.FillRect(Bounds);
  end;

  ppGetRTFEngine(RE).DrawRichText(MC.Handle, DC, R, CharRange);

  MC.Free;
  ReleaseDC(0, DC);

  B.Canvas.StretchDraw(Bounds, MF);

  MF.Free;
  RE.Free;

end;

procedure TExtraDevice.DrawImage(B: TBitmap; Img: TppDrawImage; Bounds: TRect; AdjBitmap: Boolean; IgnoreAttr: Boolean);
var
  Scale: Extended;
  R: TRect;
  W: TBitmap;
  Width, Height: Integer;
begin

  Width  := Bounds.Right - Bounds.Left;
  Height := Bounds.Bottom - Bounds.Top;

  W := TBitmap.Create;
  W.Width  := Width;
  W.Height := Height;
  W.PixelFormat := B.PixelFormat;

  if not IgnoreAttr then begin
     if Img.Stretch and Img.MaintainAspectRatio then begin
        R := Rect(0, 0, Width, Height);
        Scale := ppCalcAspectRatio(Img.Picture.Width, Img.Picture.Height, Width, Height);
        if Img.Center then begin
           R.Left := R.Left + ((Width  - Trunc(Img.Picture.Width  * Scale)) div 2);
           R.Top  := R.Top  + ((Height - Trunc(Img.Picture.Height * Scale)) div 2);
        end;
        R.Right  := R.Left + Trunc(Img.Picture.Width  * Scale);
        R.Bottom := R.Top  + Trunc(Img.Picture.Height * Scale);
     end else if Img.Stretch then begin
        R := Rect(0, 0, Width, Height);
     end else if Img.Center then begin
        R := Rect((Width - Img.Picture.Width) div 2, (Height - Img.Picture.Height) div 2, Img.Picture.Width, Img.Picture.Height)
     end else begin
        R := Rect(0, 0, Img.Picture.Width, Img.Picture.Height);
     end;
  end else begin
     R := Rect(0, 0, Img.Picture.Width, Img.Picture.Height);
  end;

  if AdjBitmap then begin
     B.Width  := Width;
     B.Height := Height;
     B.PixelFormat := W.PixelFormat;

     if Img.Picture.Graphic is TMetaFile then begin
        B.Palette := Img.Picture.MetaFile.Palette;
     end;
     if Img.Picture.Graphic is TBitmap then begin
        B.Palette := Img.Picture.Bitmap.Palette;
     end;
  end;

  W.Canvas.StretchDraw(R, Img.Picture.Graphic);
  B.Canvas.CopyMode := cmSrcCopy;
  B.Canvas.CopyRect(Bounds, W.Canvas, Rect(0, 0, Width, Height));

  W.Free;

end;

procedure TExtraDevice.DrawCheckBox(B: TBitmap; Txt: TppDrawText; Bounds: TRect; AdjBitmap: Boolean; IgnoreAttr: Boolean);
var
  Width, Height: Integer;
begin
  B.Canvas.Font := Txt.Font;
  B.Canvas.Font.Size := B.Canvas.Font.Size - Trunc(B.Canvas.Font.Size * 0.10);
  Width  := Bounds.Right - Bounds.Left;
  Height := Bounds.Bottom - Bounds.Top;

  if AdjBitmap then begin
     B.Width  := Width;
     B.Height := Height;
     B.PixelFormat := pf24bit;
  end;

  B.Canvas.TextOut(0, 1, Txt.Text);
end;

function TExtraDevice.WriteImage(B: TBitmap): String;
var
  N: Integer;
  J: TJPEGImage;
begin
  Result := 'IMG' + FormatFloat('0000', FImageNo) + '.JPG';

  J := TJPEGImage.Create;
  J.Assign(B);

  N := ImageIndex(J, Result);

  if N = -1 then begin
     Inc(FImageNo);
     try
       J.SaveToFile(ExtractFilePath(FileName) + Result);
     except
       raise EPrintError.Create('File Error: ' + Result);
     end;
  end else begin
     Result := TImageCRC(ImageList[N]).FileName;
  end;
  J.Free;
end;

function TExtraDevice.ImageIndex(J: TObject; FileName: String): Integer;
var
  MS: TMemoryStream;
  I: Integer;
  N: Cardinal;
  T: TImageCRC;
begin
  MS := TMemoryStream.Create;
  if J is TJPEGImage then begin
     (J as TJPEGImage).SaveToStream(MS);
  end else begin
     (J as TBitmap).SaveToStream(MS);
  end;
  Result := -1;
  N := CRC(MS);
  for I := 0 to ImageList.Count - 1 do begin
    if TImageCRC(ImageList[I]).CRC = N then begin
       Result := I;
       Break;
    end;
  end;

  if Result = -1 then begin
     T := TImageCRC.Create;
     T.FileName := FileName;
     T.CRC := N;
     ImageList.Add(T);
  end;

  MS.Free;
end;

procedure TExtraDevice.InitCRCTable;
var
  I, J: Integer;
begin
  for I := 0 to 255 do begin
    CRCTable[I] := I;
    for J := 0 to 7 do begin
      if Odd(CRCTable[I]) then begin
         CRCTable[I] := CRCTable[I] shr 1;
         CRCTable[I] := CRCTable[I] xor $EDB88320;
      end else begin
         CRCTable[I] := CRCTable[I] shr 1;
      end;
    end;
  end;
end;

function TExtraDevice.CRC(MS: TMemoryStream): Cardinal;
var
  I, J: Integer;
  B: String;
begin
  Result := 0;
  MS.Position := 0;
  B := ' ';
  for I := 0 to MS.Size - 1 do begin
    MS.Read(B[1], 1);
    J := (Ord(B[1]) xor Result) and $000000FF;
    Result := (Result shr 8) xor CRCTable[J];
  end;
  Result := not Result;
end;

{ WK1 Device }

class function TWK1Device.DeviceName: String;
begin
  Result := 'LotusFile';
end;

class function TWK1Device.DefaultExt: String;
begin
  Result := 'WK1';
end;

class function TWK1Device.DefaultExtFilter: String;
begin
  Result := '123 files|*.WK1|All files|*.*';
end;

class function TWK1Device.DeviceDescription(aLanguageIndex: Longint): String;
begin
  Result := 'Lotus File';
end;

procedure TWK1Device.StartJob;
begin
  inherited;
  Write(CHR(0) + CHR(0) + CHR(2) + CHR(0) + CHR(6) + CHR(4));
end;

procedure TWK1Device.EndJob;
begin
  Write(CHR(1) + CHR(0) + CHR(0) + CHR(0));
  inherited;
end;

procedure TWK1Device.ProcessBand(Band: TReportBand);
var
  Text: String;
  I, LastCol, Col: Integer;
  Itm: TReportItem;
  Txt: TppDrawText;
begin
  inherited;

  LastCol := -1;

  for I := 0 to Band.Count - 1 do begin

    Itm := TReportItem(Band[I]);

    if Itm.ItemType = riText then begin
       Txt := TppDrawText(Itm.DrawCmd);
       Col := Trunc(Itm.Left / 16934);
       if Col <= LastCol then begin
          Col := LastCol + 1;
       end;
       LastCol := Col;
       if Txt.DataType in [dtCurrency, dtDouble, dtExtended, dtInteger, dtLongInt, dtSingle] then begin
          Write(LotWord(14) + LotWord(13) + CHR(128 + 2) + LotWord(Col) + LotWord(FRow) + TextToIEEE(Txt.Text));
       end else begin
          if Txt.IsMemo then begin
             Text := Replace(Copy(Txt.WrappedText.Text, 1, 255), #13, ' ');
             Text := Replace(Text, EOP, '');
          end else begin
             Text := Replace(Txt.Text, #13 + #10, ' ');;
          end;
          Write(LotWord(15) + LotWord(Length(Text) + 7) + CHR(255) + LotWord(Col) + LotWord(FRow) + #39 + Text + CHR(0));
       end;
    end;

    if Itm.ItemType = riRTF then begin
       Col := Trunc(Itm.Left / 16934);
       if Col <= LastCol then begin
          Col := LastCol + 1;
       end;
       LastCol := Col;
       Text := RTFToPlainString(TppDrawRichText(Itm.DrawCmd));
       Text := Replace(Copy(Text, 1, 255), #13 + #10, ' ');
       Text := Replace(Text, EOP, '');
       Write(LotWord(15) + LotWord(Length(Text) + 7) + CHR(255) + LotWord(Col) + LotWord(FRow) + #39 + Text + CHR(0));
    end;

  end;
end;

{ WQ1 Device }

class function TWQ1Device.DeviceName: String;
begin
  Result := 'QuattroFile';
end;

class function TWQ1Device.DefaultExt: String;
begin
  Result := 'WQ1';
end;

class function TWQ1Device.DefaultExtFilter: String;
begin
  Result := 'Quattro files|*.WQ1|All files|*.*';
end;

class function TWQ1Device.DeviceDescription(aLanguageIndex: Longint): String;
begin
  Result := 'Quattro File';
end;

procedure TWQ1Device.StartJob;
begin
  inherited;
  Write(CHR(0) + CHR(0) + CHR(2) + CHR(0) + CHR(32) + CHR(81));
end;

procedure TWQ1Device.EndJob;
begin
  Write(CHR(1) + CHR(0) + CHR(0) + CHR(0));
  inherited;
end;

procedure TWQ1Device.ProcessBand(Band: TReportBand);
var
  Text: String;
  I, LastCol, Col: Integer;
  Itm: TReportItem;
  Txt: TppDrawText;
begin
  inherited;

  LastCol := -1;

  for I := 0 to Band.Count - 1 do begin

    Itm := TReportItem(Band[I]);

    if Itm.ItemType = riText then begin
       Col := Trunc(Itm.Left / 16934);
       if Col <= LastCol then begin
          Col := LastCol + 1;
       end;
       LastCol := Col;
       Txt := TppDrawText(Itm.DrawCmd);
       if Txt.DataType in [dtCurrency, dtDouble, dtExtended, dtInteger, dtLongInt, dtSingle] then begin
          Write(LotWord(14) + LotWord(13) + CHR(128 + 2) + LotWord(Col) + LotWord(FRow) + TextToIEEE(Txt.Text));
       end else begin
          if Txt.IsMemo then begin
             Text := Replace(Copy(Txt.WrappedText.Text, 1, 255), #13, ' ');
             Text := Replace(Text, EOP, '');
          end else begin
             Text := Replace(Txt.Text, #13 + #10, ' ');
          end;
          Write(LotWord(15) + LotWord(Length(Text) + 7) + CHR(255) + LotWord(Col) + LotWord(FRow) + #39 + CHR(Length(Text)) + Text);
       end;
    end;

    if Itm.ItemType = riRTF then begin
       Col := Trunc(Itm.Left / 16934);
       if Col <= LastCol then begin
          Col := LastCol + 1;
       end;
       LastCol := Col;
       Text := RTFToPlainString(TppDrawRichText(Itm.DrawCmd));
       Text := Replace(Copy(Text, 1, 255), #13 + #10, ' ');
       Text := Replace(Text, EOP, '');
       Write(LotWord(15) + LotWord(Length(Text) + 7) + CHR(255) + LotWord(Col) + LotWord(FRow) + #39 + CHR(Length(Text)) + Text);
    end;

  end;
end;

{ XLS Device }

class function TXLSDevice.DeviceName: String;
begin
  Result := 'ExcelFile';
end;

class function TXLSDevice.DefaultExt: String;
begin
  Result := 'XLS';
end;

class function TXLSDevice.DefaultExtFilter: String;
begin
  Result := 'Excel files|*.XLS|All files|*.*';
end;

class function TXLSDevice.DeviceDescription(aLanguageIndex: Longint): String;
begin
  Result := 'Excel File';
end;

function TXLSDevice.FontIndex(Font: TFont): String;
var
  I, S: Integer;
  FontStr: String;
begin
  S := 0;
  if fsBold in Font.Style then begin
     S := S + 1;
  end;
  if fsItalic in Font.Style then begin
     S := S + 2;
  end;
  if fsUnderline in Font.Style then begin
     S := S + 4;
  end;
  if fsStrikeOut in Font.Style then begin
     S := S + 8;
  end;

  FontStr := LotWord(Font.Size * 20) + LotWord(S) + LotWord(0) + CHR(Length(Font.Name)) + Font.Name;

  I := IndexOf(FontTbl, FontStr);
  if I = -1 then begin
     FontTbl.Add(FontStr);
     I := FontTbl.Count - 1;
  end;
  if I > 3 then begin
     Inc(I);
  end;
  Result := CHR(I);
end;

function TXLSDevice.FormatIndex(Format: String): String;
var
  I: Integer;
  FormatStr: String;
begin
  FormatStr := Format;
  I := IndexOf(FormatTbl, FormatStr);
  if I = -1 then begin
     FormatTbl.Add(FormatStr);
     I := FormatTbl.Count - 1;
  end;
  Result := CHR(I);
end;

function TXLSDevice.XFIndex(Txt: TppDrawText): String;
var
  I, Options: Integer;
  XFStr: String;
begin
  XFStr := FontIndex(Txt.Font);
  XFStr := XFStr + FormatIndex('General');
  XFStr := XFStr + CHR($00) + CHR($00);    // XF Index

  Options := 0;

  case Txt.TextAlignment of
    taLeftJustified: Options := 1;
    taCentered: Options := 2;
    taRightJustified: Options := 3;
  end;

//  if Wrap then begin
//     Options := Options + 8;
//  end;

  XFStr := XFStr + LotWord(Options);

  XFStr := XFStr + LotWord(0);     // Color & Fill
  XFStr := XFStr + LotWord(0);     // Frame
  XFStr := XFStr + LotWord(0);     // Frame Type

  I := IndexOf(XFTbl, XFStr);
  if I = -1 then begin
     XFTbl.Add(XFStr);
     I := XFTbl.Count - 1;
  end;
  Result := LotWord(I + 20);   // 20 Standard + Custom
end;

procedure TXLSDevice.WriteFontTbl;
var
  I: Integer;
begin
  for I := 0 to FontTbl.Count - 1 do begin
    Write(CHR($31) + CHR($02) + LotWord(Length(FontTbl[I])) + FontTbl[I]);
  end;
end;

procedure TXLSDevice.WriteFormatTbl;
var
  I: Integer;
begin
  for I := 0 to FormatTbl.Count - 1 do begin
    Write(CHR($1E) + CHR($00) + LotWord(1 + Length(FormatTbl[I])) + CHR(Length(FormatTbl[I])) + FormatTbl[I]);
  end;
end;

procedure TXLSDevice.WriteXFTbl;
var
  I: Integer;
begin
  { 14 General Style Formats }

  for I := 1 to 2 do begin
    Write(CHR($43) + CHR($04) + CHR($0C) + CHR($00) + CHR($01) + CHR($00) + CHR($F5) + CHR($FF) + CHR($20) + CHR($F4) + CHR($00) + CHR($CE) + CHR($00) + CHR($00) + CHR($00) + CHR($00));
  end;
  for I := 1 to 2 do begin
    Write(CHR($43) + CHR($04) + CHR($0C) + CHR($00) + CHR($02) + CHR($00) + CHR($F5) + CHR($FF) + CHR($20) + CHR($F4) + CHR($00) + CHR($CE) + CHR($00) + CHR($00) + CHR($00) + CHR($00));
  end;
  for I := 1 to 10 do begin
    Write(CHR($43) + CHR($04) + CHR($0C) + CHR($00) + CHR($00) + CHR($00) + CHR($F5) + CHR($FF) + CHR($20) + CHR($F4) + CHR($00) + CHR($CE) + CHR($00) + CHR($00) + CHR($00) + CHR($00));
  end;

  { Default Style Format }

  Write(CHR($43) + CHR($04) + CHR($0C) + CHR($00) + CHR($00) + CHR($00) + CHR($01) + CHR($00) + CHR($20) + CHR($00) + CHR($00) + CHR($CE) + CHR($00) + CHR($00) + CHR($00) + CHR($00));

  { Additional Style Formats }

  Write(CHR($43) + CHR($04) + CHR($0C) + CHR($00) + CHR($05) + CHR($21) + CHR($F5) + CHR($FF) + CHR($20) + CHR($F8) + CHR($00) + CHR($CE) + CHR($00) + CHR($00) + CHR($00) + CHR($00));
  Write(CHR($43) + CHR($04) + CHR($0C) + CHR($00) + CHR($05) + CHR($1F) + CHR($F5) + CHR($FF) + CHR($20) + CHR($F8) + CHR($00) + CHR($CE) + CHR($00) + CHR($00) + CHR($00) + CHR($00));
  Write(CHR($43) + CHR($04) + CHR($0C) + CHR($00) + CHR($05) + CHR($20) + CHR($F5) + CHR($FF) + CHR($20) + CHR($F8) + CHR($00) + CHR($CE) + CHR($00) + CHR($00) + CHR($00) + CHR($00));
  Write(CHR($43) + CHR($04) + CHR($0C) + CHR($00) + CHR($05) + CHR($1E) + CHR($F5) + CHR($FF) + CHR($20) + CHR($F8) + CHR($00) + CHR($CE) + CHR($00) + CHR($00) + CHR($00) + CHR($00));
  Write(CHR($43) + CHR($04) + CHR($0C) + CHR($00) + CHR($05) + CHR($0D) + CHR($F5) + CHR($FF) + CHR($20) + CHR($F8) + CHR($00) + CHR($CE) + CHR($00) + CHR($00) + CHR($00) + CHR($00));

  for I := 0 to XFTbl.Count - 1 do begin
    Write(CHR($43) + CHR($04) + LotWord(12) + XFTbl[I]);
  end;

  { Additional Style Formats }

  Write(CHR($93) + CHR($02) + CHR($04) + CHR($00) + CHR($10) + CHR($80) + CHR($03) + CHR($FF));
  Write(CHR($93) + CHR($02) + CHR($04) + CHR($00) + CHR($11) + CHR($80) + CHR($06) + CHR($FF));
  Write(CHR($93) + CHR($02) + CHR($04) + CHR($00) + CHR($12) + CHR($80) + CHR($04) + CHR($FF));
  Write(CHR($93) + CHR($02) + CHR($04) + CHR($00) + CHR($13) + CHR($80) + CHR($07) + CHR($FF));
  Write(CHR($93) + CHR($02) + CHR($04) + CHR($00) + CHR($00) + CHR($80) + CHR($00) + CHR($FF));
  Write(CHR($93) + CHR($02) + CHR($04) + CHR($00) + CHR($14) + CHR($80) + CHR($05) + CHR($FF));
end;

procedure TXLSDevice.StartJob;
var
  T: TFont;
begin
  inherited;

  FontTbl   := TStringList.Create;
  FormatTbl := TStringList.Create;
  XFTbl     := TStringList.Create;

  T := TFont.Create;
  T.Name := 'Arial';
  T.Size := 10;
  FontIndex(T);
  T.Style := T.Style + [fsBold];
  FontIndex(T);
  T.Style := T.Style + [fsItalic];
  FontIndex(T);
  T.Style := T.Style + [fsUnderline];
  FontIndex(T);
  T.Style := T.Style + [fsStrikeOut];
  FontIndex(T);

  T.Free;
  FormatIndex('General');
end;

procedure TXLSDevice.EndJob;
begin
  Write(CHR(9) + CHR(4) + CHR(6) + CHR(0) + CHR(0) + CHR(0) + CHR(16) + CHR(0) + CHR(0) + CHR(0));

// BIFF 8 Header
//  Write(CHR(9) + CHR(8) + CHR(16) + CHR(0) + CHR(6) + CHR(0) + CHR(16) + CHR(0) + CHR(0) + CHR(0) + CHR(0) + CHR(0) + CHR(0) + CHR(0) + CHR(0) + CHR(0) + CHR(0) + CHR(0) + CHR(0) + CHR(0));

  WriteFormatTbl;
  WriteFontTbl;
  WriteXFTbl;

  MemStream.SaveToStream(FileStream);

  Write(CHR(10) + CHR(0) + CHR(0) + CHR(0));

  FontTbl.Free;
  FormatTbl.Free;
  XFTbl.Free;

  inherited;
end;

procedure TXLSDevice.ProcessBand(Band: TReportBand);
var
  Text: String;
  I, LastCol, Col: Integer;
  Itm: TReportItem;
  Txt: TppDrawText;
begin
  inherited;

  LastCol := -1;

  for I := 0 to Band.Count - 1 do begin

    Itm := TReportItem(Band[I]);

    if Itm.ItemType = riText then begin
       Txt := TppDrawText(Itm.DrawCmd);
       Col := Trunc(Itm.Left / 16934);
       if Col <= LastCol then begin
          Col := LastCol + 1;
       end;
       LastCol := Col;
       if Txt.DataType in [dtCurrency, dtDouble, dtExtended, dtInteger, dtLongInt, dtSingle] then begin
          if Trim(Txt.Text) <> '' then begin
             Stream(CHR(3) + CHR(2) + LotWord(14) + LotWord(FRow) + LotWord(Col) + XFIndex(Txt) + TextToIEEE(Txt.Text));
          end;
       end else begin
          if Txt.IsMemo then begin
             Text := Replace(Copy(Txt.WrappedText.Text, 1, 255), #13 + #10, ' ');
             Text := Replace(Text, EOP, '');
          end else begin
             Text := Replace(Txt.Text, #13 + #10, ' ');;
          end;
          if Col = 0 then begin
             if Txt.TextAlignment = taCentered then begin
                Txt.TextAlignment := taLeftJustified;
             end;
          end;
          Stream(CHR(4) + CHR(2) + LotWord(Length(Text) + 8) + LotWord(FRow) + LotWord(Col) + XFIndex(Txt) + LotWord(Length(Text)) + Text);
       end;
    end;

    if Itm.ItemType = riRTF then begin
       Col := Trunc(Itm.Left / 16934);
       if Col <= LastCol then begin
          Col := LastCol + 1;
       end;
       LastCol := Col;
       Text := RTFToPlainString(TppDrawRichText(Itm.DrawCmd));
       Text := Replace(Copy(Text, 1, 255), #13 + #10, ' ');
       Text := Replace(Text, EOP, '');
       Stream(CHR(4) + CHR(2) + LotWord(Length(Text) + 8) + LotWord(FRow) + LotWord(Col) + LotWord(15) + LotWord(Length(Text)) + Text);
    end;

  end;

end;

{ Graphic Device }

class function TGraphicDevice.DeviceName: String;
begin
  Result := 'GraphicFile';
end;

class function TGraphicDevice.DefaultExt: String;
begin
  Result := 'BMP';
end;

class function TGraphicDevice.DefaultExtFilter: String;
begin
  Result := 'BMP files|*.BMP|JPEG files|*.JPG|TIFF files|*.TIF';
end;

class function TGraphicDevice.DeviceDescription(aLanguageIndex: Longint): String;
begin
  Result := 'Graphic File';
end;

procedure TGraphicDevice.StartJob;
begin
  inherited;
  SeparateBands := False;

  Ext := UpperCase(ExtractFileExt(FileName));

  if (Ext = '.TIF') or (Ext = '.TIFF') then begin
     TIF := TTIFImage.Create(FileStream)
  end;
end;

procedure TGraphicDevice.EndJob;
var
  ZapFile: Boolean;
begin
  if (Ext = '.TIF') or (Ext = '.TIFF') then begin
      TIF.Free;
  end;
  ZapFile := (FileStream.Size = 0);
  inherited;
  if ZapFile then begin
     DeleteFile(FileName);
  end;
end;

procedure TGraphicDevice.StartPage;
begin
  inherited;
  Img := TBitmap.Create;
  Img.Width  := ppToScreenPixels(Page.PageDef.mmWidth, utMMThousandths, pprtHorizontal, Nil);
  Img.Height := ppToScreenPixels(Page.PageDef.mmHeight, utMMThousandths, pprtVertical, Nil);
  Img.PixelFormat := ExtraDevices.Graphic.PixelFormat;
end;

procedure TGraphicDevice.EndPage;
var
  DestFile: String;
  Jpg: TJPEGImage;
begin

  if ExtraDevices.Graphic.UseTextFileName then begin
     DestFile := IncFile(FileName, FPageNo, True);
  end else begin
     DestFile := ExtractFilePath(FileName) + 'IMG' + FormatFloat('0000', FPageNo) + Ext;
  end;

  if Ext = '.BMP' then begin
     try
       Img.SaveToFile(DestFile);
     except
       raise EPrintError.Create('File Error: ' + DestFile);
     end;
  end;

  if (Ext = '.JPG') or (Ext = '.JPEG') then begin
     Jpg := TJPEGImage.Create;
     Jpg.Assign(Img);
     try
       Jpg.SaveToFile(DestFile);
     except
       raise EPrintError.Create('File Error: ' + DestFile);
     end;
     Jpg.Free;
  end;

  if (Ext = '.TIF') or (Ext = '.TIFF') then begin
     TIF.Add(Img);
  end;

  Img.Free;
  inherited;
end;

procedure TGraphicDevice.ProcessBand(Band: TReportBand);
var
  I, Top, Width, Height, Left: Integer;
  Text: String;
  Fmt: Word;
  DestRect: TRect;
  Txt: TppDrawText;
  Itm: TReportItem;
begin
  inherited;

  Band.Sort(ZOrderSort);

  for I := 0 to Band.Count - 1 do begin

    Itm := TReportItem(Band[I]);

    Left   := ppToScreenPixels(Itm.Left, utMMThousandths, pprtHorizontal, Nil);
    Width  := ppToScreenPixels(Itm.Width, utMMThousandths, pprtHorizontal, Nil);
    Top    := ppToScreenPixels(Itm.Top, utMMThousandths, pprtVertical, Nil);
    Height := ppToScreenPixels(Itm.Height, utMMThousandths, pprtVertical, Nil);

    DestRect := Rect(Left, Top, Left + Width, Top + Height);

    //
    // Process Images
    //

    if Itm.ItemType = riImage then begin
       DrawImage(Img, TppDrawImage(Itm.DrawCmd), Rect(Left, Top, Left + Width, Top + Height), False, False);
    end;

    //
    // Process RichText
    //

    if Itm.ItemType = riRTF then begin
       DrawRichText(Img, TppDrawRichText(Itm.DrawCmd), Rect(Left, Top, Left + Width, Top + Height));
    end;

    //
    // Process Shapes
    //

    if Itm.ItemType = riShape then begin
       DrawShape(Img.Canvas, TppDrawShape(Itm.DrawCmd), Rect(Left, Top, Left + Width, Top + Height));
    end;

    //
    // Process BarCodes
    //

    if Itm.ItemType = riBarCode then begin
       DrawBarCode(Img.Canvas, TppDrawBarCode(Itm.DrawCmd), Rect(Left, Top, Left + Width, Top + Height));
    end;

    //
    // Process Lines
    //

    if Itm.ItemType = riLine then begin
       DrawLine(Img.Canvas, TppDrawLine(Itm.DrawCmd), Rect(Left, Top, Left + Width, Top + Height));
    end;

    //
    // Process Text
    //

    if Itm.ItemType in [riText, riCheckBox] then begin

       Txt := TppDrawText(Itm.DrawCmd);

       Fmt := DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX;
       Img.Canvas.Font.Assign(Txt.Font);

       if (Txt.Color <> clWhite) and (Txt.Transparent = False) then begin
          Img.Canvas.Brush.Color := Txt.Color;
          Img.Canvas.Brush.Style := bsSolid;
       end;

       if Txt.TextAlignment = taRightJustified then begin
          Fmt := Fmt or DT_RIGHT;
       end;

       if Txt.TextAlignment = taCentered then begin
          Fmt := Fmt or DT_CENTER;
       end;

       if Txt.IsMemo or (Txt.WordWrap = True) then begin
          Text := Replace(Txt.WrappedText.Text, EOP, '');
       end else begin
          Text := Txt.Text;
          Fmt := Fmt or DT_SINGLELINE;
       end;

       DrawText(Img.Canvas.Handle, PChar(Text), Length(Text), DestRect, Fmt);
       Img.Canvas.Brush.Style := bsClear;

    end;

  end;

end;

{ HTML Device }

class function THTMLDevice.DeviceName: String;
begin
  Result := 'HTMLFile';
end;

class function THTMLDevice.DefaultExt: String;
begin
  Result := 'HTM';
end;

class function THTMLDevice.DefaultExtFilter: String;
begin
  Result := 'HTML files|*.HTM|All files|*.*';
end;

class function THTMLDevice.DeviceDescription(aLanguageIndex: Longint): String;
begin
  Result := 'HTML File';
end;

procedure THTMLDevice.Write(Buffer: String);
begin
  if Length(Buffer) > 0 then begin
     DestStream.Write(Buffer[1], Length(Buffer));
  end;
end;

procedure THTMLDevice.StartJob;
begin
  inherited;
  BaseFont := 'Arial';
  BaseSize := 10;
end;

procedure THTMLDevice.EndJob;
var
  ZapFile: Boolean;
begin
  ZapFile := (FileStream.Size = 0);
  inherited;
  if ZapFile then begin
     DeleteFile(FileName);
  end;
end;

procedure THTMLDevice.StartPage;
var
  DestFile: String;
begin
  inherited;
  TopOffset := 0;

  if ExtraDevices.HTML.UseTextFileName then begin
     DestFile := IncFile(FileName, FPageNo, True);
  end else begin
     DestFile := ExtractFilePath(FileName) + 'RPT' + FormatFloat('0000', FPageNo) + '.HTM';
  end;

  try
    DestStream := TFileStream.Create(DestFile, fmCreate or fmOpenReadWrite or fmShareExclusive);
  except
    raise EPrintError.Create('File Error: ' + DestFile);
  end;

  Write('<HTML>' + CRLF);
  Write('<TITLE>' + Page.DocumentName + '</TITLE>' + CRLF);
  Write('<HEAD>' + CRLF);
  Write('<STYLE TYPE="text/css">' + CRLF);
  Write('<!--' + CRLF);
  Write('  TD { font-size: 10pt; font-family: sans-serif }' + CRLF);
  Write('-->' + CRLF);
  Write('</STYLE>' + CRLF);
  Write('</HEAD>' + CRLF);

  Write('<BODY LEFTMARGIN=0 TOPMARGIN=0>' + CRLF);
end;

procedure THTMLDevice.EndPage;
var
  LastFile, NextFile: String;
begin
  if ExtraDevices.HTML.ShowLinks then begin
     if FPageNo > 1 then begin
        if ExtraDevices.HTML.UseTextFileName then begin
           LastFile := IncFile(FileName, FPageNo - 1, False);
        end else begin
           LastFile := 'RPT' + FormatFloat('0000', FPageNo - 1) + '.HTM';
        end;
        if not Page.LastPage then begin
           if ExtraDevices.HTML.UseTextFileName then begin
              NextFile := IncFile(FileName, FPageNo + 1, False);
           end else begin
              NextFile := 'RPT' + FormatFloat('0000', FPageNo + 1) + '.HTM';
           end;
           Write('<H1><B><P ALIGN=CENTER><A HREF="' + LastFile + '">' + ExtraDevices.HTML.BackLink + '</A> <A HREF="' + NextFile + '">' + ExtraDevices.HTML.ForwardLink + '</A></B></H1>');
        end else begin
           Write('<H1><B><P ALIGN=CENTER><A HREF="' + LastFile + '">' + ExtraDevices.HTML.BackLink + '</A></B></H1>');
        end;
     end else begin
        if not Page.LastPage then begin
           if ExtraDevices.HTML.UseTextFileName then begin
              NextFile := IncFile(FileName, FPageNo + 1, False);
           end else begin
              NextFile := 'RPT' + FormatFloat('0000', FPageNo + 1) + '.HTM';
           end;
           Write('<H1><B><P ALIGN=CENTER><A HREF="' + NextFile + '">' + ExtraDevices.HTML.ForwardLink + '</A></B></H1>');
        end;
     end;
  end;

  Write('</BODY>' + CRLF);
  Write('</HTML>' + CRLF);
  DestStream.Free;
  inherited;
end;

procedure THTMLDevice.StartBand;
begin
  inherited;
  TotWidth  := 0;
  BandWidth := ppToScreenPixels(Page.PageDef.mmWidth, utMMThousandths, pprtHorizontal, Nil);
  Write('<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=' + IntToStr(BandWidth) + '>' + CRLF);
end;

procedure THTMLDevice.EndBand;
begin
  if (BandWidth - TotWidth) > 0 then begin
     Write('<TD WIDTH=' + IntToStr(BandWidth - TotWidth) + '></TD>');
  end;
  Write(CRLF + '</TABLE>' + CRLF);
  inherited;
end;

procedure THTMLDevice.ProcessBand(Band: TReportBand);
var
  Buffer, ImgFile, ZoomImg, Tmp: String;
  I, Top, Width, Height, Left, LeftOffset: Integer;
  DoFont: Boolean;
  Txt: TppDrawText;
  Itm: TReportItem;
  B, Z: TBitmap;
begin
  inherited;

  LeftOffset := 0;

  for I := 0 to Band.Count - 1 do begin

    Itm := TReportItem(Band[I]);

    Buffer := '';
    DoFont := False;

    Left   := ppToScreenPixels(Itm.Left, utMMThousandths, pprtHorizontal, Nil);
    Width  := ppToScreenPixels(Itm.Width, utMMThousandths, pprtHorizontal, Nil);
    Top    := ppToScreenPixels(Itm.Top, utMMThousandths, pprtVertical, Nil);
    Height := ppToScreenPixels(Itm.Height, utMMThousandths, pprtVertical, Nil);

    if Top >= TopOffset then begin
       if Top - TopOffset > 0 then begin
          Write('<TR><TD HEIGHT=' + IntToStr(Top - TopOffset) + '></TD>' + CRLF);
       end;
       Buffer := '<TR VALIGN=TOP>';
       TopOffset := Top + Height;
    end;

    if (Top + Height) > TopOffset then begin
       TopOffset := Top + Height;
    end;

    if Itm.ItemType in [riLine, riImage, riText, riShape, riRTF, riBarCode] then begin
       Buffer   := Buffer + '<TD WIDTH=' + IntToStr(Left - LeftOffset) + '></TD>';
       TotWidth := TotWidth + (Left - LeftOffset);

       Buffer   := Buffer + '<TD WIDTH=' + IntToStr(Width) + ' HEIGHT=' + IntToStr(Height);
       TotWidth := TotWidth + Width;
    end;

    //
    // Process Lines
    //

    if Itm.ItemType = riLine then begin
       B := TBitmap.Create;
       B.Width  := Width;
       B.Height := Height;
       B.PixelFormat := ExtraDevices.HTML.PixelFormat;
       DrawLine(B.Canvas, TppDrawLine(Itm.DrawCmd), Rect(0, 0, Width, Height));
       ImgFile := WriteImage(B);
       B.Free;
       Buffer  := Buffer + '><IMG SRC="' + ImgFile + '" WIDTH="' + IntToStr(Width) + '" HEIGHT="' + IntToStr(Height) + '" BORDER="0">';
    end;

    //
    // Process BarCodes
    //

    if Itm.ItemType = riBarCode then begin
       B := TBitmap.Create;
       B.Width  := Width;
       B.Height := Height;
       B.PixelFormat := ExtraDevices.HTML.PixelFormat;
       DrawBarCode(B.Canvas, TppDrawBarCode(Itm.DrawCmd), Rect(0, 0, Width, Height));
       ImgFile := WriteImage(B);
       B.Free;
       Buffer  := Buffer + '><IMG SRC="' + ImgFile + '" WIDTH="' + IntToStr(Width) + '" HEIGHT="' + IntToStr(Height) + '" BORDER="0">';
    end;

    //
    // Process Shapes
    //

    if Itm.ItemType = riShape then begin
       B := TBitmap.Create;
       B.Width  := Width;
       B.Height := Height;
       B.PixelFormat := ExtraDevices.HTML.PixelFormat;
       DrawShape(B.Canvas, TppDrawShape(Itm.DrawCmd), Rect(0, 0, Width, Height));
       ImgFile := WriteImage(B);
       B.Free;
       Buffer  := Buffer + '><IMG SRC="' + ImgFile + '" WIDTH="' + IntToStr(Width) + '" HEIGHT="' + IntToStr(Height) + '" BORDER="0">';
    end;

    //
    // Process RichText
    //

    if Itm.ItemType = riRTF then begin
       Buffer := Buffer + '>' + RTF2HTML(TppDrawRichText(Itm.DrawCmd));
    end;

    //
    // Process Images
    //

    if Itm.ItemType = riImage then begin
       B := TBitmap.Create;
       B.PixelFormat := ExtraDevices.HTML.PixelFormat;
       DrawImage(B, TppDrawImage(Itm.DrawCmd), Rect(0, 0, Width, Height), True, False);
       ImgFile := WriteImage(B);
       Buffer := Buffer + '>';
       if ExtraDevices.HTML.ZoomableImages then begin
          Z := TBitmap.Create;
          Z.PixelFormat := ExtraDevices.HTML.PixelFormat;
          DrawImage(Z, TppDrawImage(Itm.DrawCmd), Rect(0, 0, TppDrawImage(Itm.DrawCmd).Picture.Width, TppDrawImage(Itm.DrawCmd).Picture.Height), True, True);
          ZoomImg := WriteImage(Z);
          Buffer := Buffer + '<A HREF="' + ZoomImg + '">';
          Z.Free;
       end;
       Buffer  := Buffer + '<IMG SRC="' + ImgFile + '" WIDTH="' + IntToStr(B.Width) + '" HEIGHT="' + IntToStr(B.Height) + '" BORDER="0">';
       if ExtraDevices.HTML.ZoomableImages then begin
          Buffer := Buffer + '</A>';
       end;
       B.Free;
    end;

    //
    // Process Text
    //

    if Itm.ItemType = riText then begin

       Txt := TppDrawText(Itm.DrawCmd);

       if (Txt.Color <> clWhite) and (Txt.Transparent = False) then begin
          Buffer := Buffer + ' BGCOLOR= ' + ColorToHex(Txt.Color);
       end;

       if Txt.TextAlignment = taRightJustified then begin
          Buffer := Buffer + ' ALIGN=RIGHT'
       end;

       if Txt.TextAlignment = taCentered then begin
          Buffer := Buffer + ' ALIGN=CENTER'
       end;

       if Txt.Font.Name <> BaseFont then begin
          DoFont := True;
       end;

       if Txt.Font.Color <> clBlack then begin
          DoFont := True;
       end;

       if Txt.Font.Size <> BaseSize then begin
          DoFont := True;
       end;

       if fsItalic in Txt.Font.Style then begin
          DoFont := True;
       end;

       if fsBold in Txt.Font.Style then begin
          DoFont := True;
       end;

       if fsUnderline in Txt.Font.Style then begin
          DoFont := True;
       end;

       if DoFont then begin
          Buffer := Buffer + ' STYLE="';
          Buffer := Buffer + 'font-size: ' + IntToStr(Txt.Font.Size) + 'pt;';
          Buffer := Buffer + ' font-family: ' + Txt.Font.Name + ';';
          Buffer := Buffer + ' color: ' + ColorToHex(Txt.Font.Color) + ';';
          if fsItalic in Txt.Font.Style then begin
             Buffer := Buffer + ' font-style: italic;';
          end;
          if fsBold in Txt.Font.Style then begin
             Buffer := Buffer + ' font-weight: bold;';
          end;
          if fsUnderline in Txt.Font.Style then begin
             Buffer := Buffer + ' text-decoration: underline;';
          end;
          Buffer := Buffer + '"';
       end;

       Buffer := Buffer + '>';

       if Txt.IsMemo or (Txt.WordWrap = True) then begin
          Tmp := HTMLEncode(Txt.WrappedText.Text);
          Tmp := Replace(Tmp, #13, '<BR>');
          Tmp := Replace(Tmp, EOP, '');
          Buffer := Buffer + Tmp;
       end else begin
          Buffer := Buffer + HTMLEncode(Txt.Text);
       end;

    end;

    if Itm.ItemType in [riLine, riImage, riText, riShape, riRTF, riBarCode] then begin
       Buffer := Buffer + '</TD>';
       Write(Buffer);
       LeftOffset := Left + Width;
    end;

  end;

end;

{ CSS2 Device }

class function TCSS2Device.DeviceName: String;
begin
  Result := 'HTMLLayerFile';
end;

class function TCSS2Device.DefaultExt: String;
begin
  Result := 'HTM';
end;

class function TCSS2Device.DefaultExtFilter: String;
begin
  Result := 'HTML files|*.HTM|All files|*.*';
end;

class function TCSS2Device.DeviceDescription(aLanguageIndex: Longint): String;
begin
  Result := 'CSS2 File';
end;

procedure TCSS2Device.Write(Buffer: String);
begin
  if Length(Buffer) > 0 then begin
     DestStream.Write(Buffer[1], Length(Buffer));
  end;   
end;

procedure TCSS2Device.StartJob;
begin
  inherited;
end;

procedure TCSS2Device.EndJob;
var
  ZapFile: Boolean;
begin
  ZapFile := (FileStream.Size = 0);
  inherited;
  if ZapFile then begin
     DeleteFile(FileName);
  end;
end;

procedure TCSS2Device.StartPage;
var
  DestFile: String;
  Width, Height: Integer;
begin
  inherited;

  if ExtraDevices.CSS2.UseTextFileName then begin
     DestFile := IncFile(FileName, FPageNo, True);
  end else begin
     DestFile := ExtractFilePath(FileName) + 'RPT' + FormatFloat('0000', FPageNo) + '.HTM';
  end;

  try
    DestStream := TFileStream.Create(DestFile, fmCreate or fmOpenReadWrite or fmShareExclusive);
  except
    raise EPrintError.Create('File Error: ' + DestFile);
  end;

  Write('<HTML>' + CRLF);
  Write('<TITLE>' + Page.DocumentName + '</TITLE>' + CRLF);
  Write('<BODY LEFTMARGIN=0 TOPMARGIN=0>' + CRLF);

  Width  := ppToScreenPixels(Page.PageDef.mmWidth, utMMThousandths, pprtHorizontal, Nil);
  Height := ppToScreenPixels(Page.PageDef.mmHeight, utMMThousandths, pprtVertical, Nil);

  Write('<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=' + IntToStr(Width) + '>' + CRLF);
  Write('<TR><TD HEIGHT=' + IntToStr(Height) + '>');
end;

procedure TCSS2Device.EndPage;
var
  LastFile, NextFile: String;
begin
  Write('</TD></TABLE>' + CRLF);

  if ExtraDevices.CSS2.ShowLinks then begin
     if FPageNo > 1 then begin
        if ExtraDevices.CSS2.UseTextFileName then begin
           LastFile := IncFile(FileName, FPageNo - 1, False);
        end else begin
           LastFile := 'RPT' + FormatFloat('0000', FPageNo - 1) + '.HTM';
        end;
        if not Page.LastPage then begin
           if ExtraDevices.CSS2.UseTextFileName then begin
              NextFile := IncFile(FileName, FPageNo + 1, False);
           end else begin
              NextFile := 'RPT' + FormatFloat('0000', FPageNo + 1) + '.HTM';
           end;
           Write('<H1><B><P ALIGN=CENTER><A HREF="' + LastFile + '">' + ExtraDevices.CSS2.BackLink + '</A> <A HREF="' + NextFile + '">' + ExtraDevices.CSS2.ForwardLink + '</A></B></H1>');
        end else begin
           Write('<H1><B><P ALIGN=CENTER><A HREF="' + LastFile + '">' + ExtraDevices.CSS2.BackLink + '</A></B></H1>');
        end;
     end else begin
        if not Page.LastPage then begin
           if ExtraDevices.CSS2.UseTextFileName then begin
              NextFile := IncFile(FileName, FPageNo + 1, False);
           end else begin
              NextFile := 'RPT' + FormatFloat('0000', FPageNo + 1) + '.HTM';
           end;
           Write('<H1><B><P ALIGN=CENTER><A HREF="' + NextFile + '">' + ExtraDevices.CSS2.ForwardLink + '</A></B></H1>');
        end;
     end;
  end;

  Write('</BODY>' + CRLF);
  Write('</HTML>' + CRLF);
  DestStream.Free;
  inherited;
end;

procedure TCSS2Device.StartBand;
begin
  inherited;
end;

procedure TCSS2Device.EndBand;
begin
  inherited;
end;

procedure TCSS2Device.ProcessBand(Band: TReportBand);
var
  Buffer, ImgFile, ZoomImg, Tmp: String;
  I, Top, Width, Height, Left: Integer;
  Txt: TppDrawText;
  Itm: TReportItem;
  B, Z: TBitmap;
begin
  inherited;

  Band.Sort(ZOrderSort);

  for I := 0 to Band.Count - 1 do begin

    Itm := TReportItem(Band[I]);

    Buffer := '';

    Left   := ppToScreenPixels(Itm.Left, utMMThousandths, pprtHorizontal, Nil);
    Width  := ppToScreenPixels(Itm.Width, utMMThousandths, pprtHorizontal, Nil);
    Top    := ppToScreenPixels(Itm.Top, utMMThousandths, pprtVertical, Nil);
    Height := ppToScreenPixels(Itm.Height, utMMThousandths, pprtVertical, Nil);

    if Itm.ItemType in [riImage, riText, riLine, riShape, riRTF, riBarCode] then begin
       Buffer := Buffer + '<DIV STYLE="position: absolute;';
       Buffer := Buffer + 'left: ' + IntToStr(Left) + 'px;';
       Buffer := Buffer + 'top: ' + IntToStr(Top) + 'px;';
       Buffer := Buffer + 'width: ' + IntToStr(Width) + 'px;';
       Buffer := Buffer + 'height: ' + IntToStr(Height) + 'px;';
       Buffer := Buffer + 'z-index: ' + IntToStr(Itm.ZOrder) + ';';
    end;

    //
    // Process RichText
    //

    if Itm.ItemType = riRTF then begin
       Buffer := Buffer + '">' + RTF2HTML(TppDrawRichText(Itm.DrawCmd));
    end;

    //
    // Process Lines
    //

    if Itm.ItemType = riLine then begin
       B := TBitmap.Create;
       B.Width  := Width;
       B.Height := Height;
       B.PixelFormat := ExtraDevices.CSS2.PixelFormat;
       DrawLine(B.Canvas, TppDrawLine(Itm.DrawCmd), Rect(0, 0, Width, Height));
       ImgFile := WriteImage(B);
       B.Free;
       Buffer  := Buffer + '"><IMG SRC="' + ImgFile + '" WIDTH="' + IntToStr(Width) + '" HEIGHT="' + IntToStr(Height) + '" BORDER="0">';
    end;

    //
    // Process BarCodes
    //

    if Itm.ItemType = riBarCode then begin
       B := TBitmap.Create;
       B.Width  := Width;
       B.Height := Height;
       B.PixelFormat := ExtraDevices.CSS2.PixelFormat;
       DrawBarCode(B.Canvas, TppDrawBarCode(Itm.DrawCmd), Rect(0, 0, Width, Height));
       ImgFile := WriteImage(B);
       B.Free;
       Buffer  := Buffer + '><IMG SRC="' + ImgFile + '" WIDTH="' + IntToStr(Width) + '" HEIGHT="' + IntToStr(Height) + '" BORDER="0">';
    end;

    //
    // Process Shapes
    //

    if Itm.ItemType = riShape then begin
       B := TBitmap.Create;
       B.Width  := Width;
       B.Height := Height;
       B.PixelFormat := ExtraDevices.CSS2.PixelFormat;
       DrawShape(B.Canvas, TppDrawShape(Itm.DrawCmd), Rect(0, 0, Width, Height));
       ImgFile := WriteImage(B);
       B.Free;
       Buffer  := Buffer + '"><IMG SRC="' + ImgFile + '" WIDTH="' + IntToStr(Width) + '" HEIGHT="' + IntToStr(Height) + '" BORDER="0">';
    end;

    //
    // Process Images
    //

    if Itm.ItemType = riImage then begin
       B := TBitmap.Create;
       B.PixelFormat := ExtraDevices.CSS2.PixelFormat;
       DrawImage(B, TppDrawImage(Itm.DrawCmd), Rect(0, 0, Width, Height), True, False);
       ImgFile := WriteImage(B);
       Buffer := Buffer + '">';
       if ExtraDevices.CSS2.ZoomableImages then begin
          Z := TBitmap.Create;
          Z.PixelFormat := ExtraDevices.CSS2.PixelFormat;
          DrawImage(Z, TppDrawImage(Itm.DrawCmd), Rect(0, 0, TppDrawImage(Itm.DrawCmd).Picture.Width, TppDrawImage(Itm.DrawCmd).Picture.Height), True, True);
          ZoomImg := WriteImage(Z);
          Buffer := Buffer + '<A HREF="' + ZoomImg + '">';
          Z.Free;
       end;
       Buffer  := Buffer + '<IMG SRC="' + ImgFile + '" WIDTH="' + IntToStr(B.Width) + '" HEIGHT="' + IntToStr(B.Height) + '" BORDER="0">';
       if ExtraDevices.CSS2.ZoomableImages then begin
          Buffer := Buffer + '</A>';
       end;
       B.Free;
     end;

    //
    // Process Text
    //

    if Itm.ItemType = riText then begin

       Txt := TppDrawText(Itm.DrawCmd);

       if (Txt.Transparent = False) then begin
          Buffer := Buffer + 'background-color: ' + ColorToHex(Txt.Color) + ';';
       end;

       if (Txt.AutoSize = False) then begin
          Buffer := Buffer + 'clip: rect(0,' + IntToStr(Width) + ',' + IntToStr(Height) + ',0);';
          if Txt.IsMemo or (Txt.WordWrap = True) then begin
             Buffer := Buffer + 'line-height: ' + IntToStr(Abs(Txt.Font.Height)) + 'px;';
          end;   
       end;

       if Txt.TextAlignment = taRightJustified then begin
          Buffer := Buffer + 'text-align: right;';
       end;

       if Txt.TextAlignment = taCentered then begin
          Buffer := Buffer + 'text-align: center;';
       end;

       Buffer := Buffer + 'font-size: ' + IntToStr(Txt.Font.Size) + 'pt;';
       Buffer := Buffer + 'font-family: ' + Txt.Font.Name + ';';
       Buffer := Buffer + 'color: ' + ColorToHex(Txt.Font.Color) + ';';

       if fsItalic in Txt.Font.Style then begin
          Buffer := Buffer + 'font-style: italic;';
       end;

       if fsBold in Txt.Font.Style then begin
          Buffer := Buffer + 'font-weight: bold;';
       end;

       if fsUnderline in Txt.Font.Style then begin
          Buffer := Buffer + 'text-decoration: underline;';
       end;

       Buffer := Buffer + '">';

       if Txt.IsMemo or (Txt.WordWrap = True) then begin
          Tmp := HTMLEncode(Txt.WrappedText.Text);
          Tmp := Replace(Tmp, #13, '<BR>');
          Tmp := Replace(Tmp, EOP, '');
          Buffer := Buffer + Tmp;
       end else begin
          Buffer := Buffer + HTMLEncode(Txt.Text);
       end;

    end;

    if Itm.ItemType in [riImage, riText, riLine, riShape, riRTF, riBarCode] then begin
       Buffer := Buffer + '</DIV>' + CRLF;
       Write(Buffer);
    end;

  end;

end;

{ RTF Device }

class function TRTFDevice.DeviceName: String;
begin
  Result := 'RTFFile';
end;

class function TRTFDevice.DefaultExt: String;
begin
  Result := 'RTF';
end;

class function TRTFDevice.DefaultExtFilter: String;
begin
  Result := 'RTF files|*.RTF|All files|*.*';
end;

class function TRTFDevice.DeviceDescription(aLanguageIndex: Longint): String;
begin
  Result := 'RTF File';
end;

procedure TRTFDevice.StartJob;
begin
  inherited;

  FontTbl  := TStringList.Create;
  ColorTbl := TStringList.Create;

  BaseFont := 'Times New Roman';
  BaseSize := 12;

  FontIndex(BaseFont);
  ColorIndex(clBlack);

  Write('{\rtf1\ansi\ansicpg1252\deff0\deftab720');
end;

procedure TRTFDevice.WriteFontTbl;
var
  I: Integer;
  X: String;
begin
  Write('{\fonttbl');
  for I := 0 to FontTbl.Count - 1 do begin
    X := FontTbl[I];
    Write('{\f' + IntToStr(I) + '\fnil ' + X + ';}');
  end;
  Write('}');
end;

procedure TRTFDevice.WriteColorTbl;
var
  I: Integer;
  X: String;
begin
  Write('{\colortbl;');
  for I := 0 to ColorTbl.Count - 1 do begin
    X := ColorTbl[I];
    Write('\red' + Copy(X, 1, 3) + '\green' + Copy(X, 4, 3) + '\blue' + Copy(X, 7, 3) + ';');
  end;
  Write('}');
end;

procedure TRTFDevice.EndJob;
var
  W, H: Integer;
begin
  WriteFontTbl;
  WriteColorTbl;

  W := ThousandthsToTwips(Page.PageDef.mmWidth);
  H := ThousandthsToTwips(Page.PageDef.mmHeight);

  if W <> 12240 then begin
     Write('\paperw' + IntToStr(W));
  end;
  if H <> 15840 then begin
     Write('\paperh' + IntToStr(H));
  end;

  Write('\margl' + IntToStr(LeftMargin) + '\margr' + IntToStr(RightMargin) + '\margt' + IntToStr(TopMargin) + '\margb' + IntToStr(BottomMargin) + CRLF);

  if Page.PrinterSetup.Orientation = poLandscape then begin
     Write('\landscape');
  end;
  MemStream.SaveToStream(FileStream);
  Write('}' + CRLF);

  FontTbl.Free;
  ColorTbl.Free;

  inherited;
end;

procedure TRTFDevice.StartBand;
begin
  inherited;
end;

procedure TRTFDevice.EndBand;
begin
  inherited;
end;

procedure TRTFDevice.StartPage;
begin
  inherited;
  TopMargin    := ThousandthsToTwips(Page.PageDef.mmMarginTop);
  LeftMargin   := ThousandthsToTwips(Page.PageDef.mmMarginLeft);
  RightMargin  := ThousandthsToTwips(Page.PageDef.mmMarginRight);
  BottomMargin := ThousandthsToTwips(Page.PageDef.mmMarginBottom);

  TopOffset := TopMargin;
end;

procedure TRTFDevice.EndPage;
begin
  Stream('\pard ');
  {$IFNDEF EXTRADEMO}
  if not Page.LastPage then begin
     Stream('\page ' + CRLF);
  end;
  {$ENDIF}
  inherited;
end;

function TRTFDevice.FontIndex(Font: String): String;
var
  I: Integer;
  FontStr: String;
begin
  FontStr := Font;
  I := FontTbl.IndexOf(FontStr);
  if I = -1 then begin
     FontTbl.Add(FontStr);
     I := FontTbl.Count - 1;
  end;
  Result := IntToStr(I);
end;

function TRTFDevice.ColorIndex(Color: TColor): String;
var
  I: Integer;
  ColorStr: String;
begin
  ColorStr := ColorToStr(Color);
  I := ColorTbl.IndexOf(ColorStr);
  if I = -1 then begin
     ColorTbl.Add(ColorStr);
     I := ColorTbl.Count - 1;
  end;
  Result := IntToStr(I + 1);
end;

procedure TRTFDevice.ProcessBand(Band: TReportBand);
var
  Buffer: String;
  Txt: TppDrawText;
  Lne: TppDrawLine;
  Shp: TppDrawShape;
  MaxHeight, MaxLines, I, J, Top, Width, Height, Left, TabPos, LastTab: Integer;
  XSize, YSize, FirstTab: Integer;
  DoFont: Boolean;
  Itm: TReportItem;
  Bmp: TBitmap;
  MS: TMemoryStream;
  MF: TMetaFile;
  MC: TMetaFileCanvas;
  Tabs: String;
  Text: String;
begin
  inherited;

  MaxHeight := 0;
  MaxLines  := 1;
  Top := -1;

  for I := 0 to Band.Count - 1 do begin
    Itm := TReportItem(Band[I]);
    if Itm.ItemType in [riText, riRTF, riCheckBox] then begin
       if Top = -1 then begin
          Top := ThousandthsToTwips(Itm.Top);
       end;
       Height := ThousandthsToTwips(Itm.Height);
       if Itm.ItemType in [riText] then begin
          Txt := TppDrawText(Itm.DrawCmd);
          if Txt.IsMemo or (Txt.WordWrap = True) then begin
             if Txt.WrappedText.Count > MaxLines then begin
                MaxLines := Txt.WrappedText.Count;
             end;
          end;
       end;
       if Height > MaxHeight then begin
          MaxHeight := Height;
       end;
    end;
  end;

  if Top >= TopOffset then begin
     if Top - TopOffset > 0 then begin
        Stream('\pard\sl-' + IntToStr(Top - TopOffset) + '\par ' + CRLF);
     end;
     TopOffset := Top + MaxHeight;
  end;

  Tabs := '';
  FirstTab := Band.Count + 1;

  { Compute Tabs for all Text in Band }

  LastTab := 0;

  for I := 0 to Band.Count - 1 do begin
    Itm := TReportItem(Band[I]);

    if Itm.ItemType in [riText, riCheckBox] then begin
       Left  := ThousandthsToTwips(Itm.Left) - LeftMargin; // {1.1}
       Width := ThousandthsToTwips(Itm.Width);
       if (Left > 0) or (TppDrawText(Itm.DrawCmd).TextAlignment <> taLeftJustified) then begin
          if FirstTab = Band.Count + 1 then begin
             FirstTab := I;
          end;
          case TppDrawText(Itm.DrawCmd).TextAlignment of
            taRightJustified: begin
                              TabPos := MaxInt(LastTab + 28, Left + Width);
                              Tabs := Tabs + '\tqr\tx' + IntToStr(TabPos);
                            end;
            taCentered:       begin
                              TabPos := MaxInt(LastTab + 28, Left + (Width div 2));
                              Tabs := Tabs + '\tqc\tx' + IntToStr(TabPos);
                            end;
            else            begin
//                              if TppDrawText(Itm.DrawCmd).Text = StringOfChar('.', Length(TppDrawText(Itm.DrawCmd).Text)) then begin
//                                 TabPos := MaxInt(LastTab + 28, Left + Width);
//                                 Tabs := Tabs + '\tldot' + IntToStr(TabPos);
//                              end else begin
                                 TabPos := MaxInt(LastTab + 28, Left);
                                 Tabs := Tabs + '\tx' + IntToStr(TabPos);
//                              end;
                            end;
          end;
          LastTab := TabPos;
       end;
    end;
  end;

  if MaxHeight > 0 then begin
     Stream('\sl-' + IntToStr(MaxHeight div MaxLines));
  end;

  for I := 0 to Band.Count - 1 do begin

    Itm := TReportItem(Band[I]);

    Buffer := '';

    //
    // Process RichEdit
    //

    if Itm.ItemType = riRTF then begin
       Buffer := '{\*\do\dobxpage\dobypage\dodhgt8192\dptxbx';
       Buffer := Buffer + '{\dptxbxtext\pard\plain ';

       Buffer := Buffer + RTFToString(TppDrawRichText(Itm.DrawCmd));

       Buffer := Buffer + '\dpx' + IntToStr(ThousandthsToTwips(Itm.Left));
       Buffer := Buffer + '\dpy' + IntToStr(ThousandthsToTwips(Itm.Top));
       Buffer := Buffer + '\dpxsize' + IntToStr(ThousandthsToTwips(Itm.Width));
       Buffer := Buffer + '\dpysize' + IntToStr(ThousandthsToTwips(Itm.Height));
       Buffer := Buffer + '\dplinehollow';
       Buffer := Buffer + '\dplinecor0\dplinecog0\dplinecob0';
       Buffer := Buffer + '\dplinew0';
       Buffer := Buffer + '\dpfillfgcr0\dpfillfgcg0\dpfillfgcb0';
       Buffer := Buffer + '\dpfillbgcr0\dpfillbgcg0\dpfillbgcb0';
       Buffer := Buffer + '\dpfillpat0';
       Buffer := Buffer + '}}' + CRLF;
    end;

    //
    // Process Images & BarCodes
    //

    if Itm.ItemType in [riImage, riBarCode] then begin

       Buffer := Buffer + '{\*\do\dobxpage\dobypage\dodhgt8192\dptxbx';
       Buffer := Buffer + '{\dptxbxtext\pard\plain ';

       //
       // Transfer bitmap to metafile then to stream
       //

       Bmp := TBitmap.Create;
       MS := TMemoryStream.Create;
       if Itm.ItemType = riImage then begin
          DrawImage(Bmp, TppDrawImage(Itm.DrawCmd), Rect(0, 0, ThousandthsToHorzPixels(Itm.Width), ThousandthsToVertPixels(Itm.Height)), True, False);
       end else begin
          Bmp.Width  := ThousandthsToHorzPixels(Itm.Width);
          Bmp.Height := ThousandthsToVertPixels(Itm.Height);
          DrawBarCode(Bmp.Canvas, TppDrawBarCode(Itm.DrawCmd), Rect(0, 0, Bmp.Width, Bmp.Height));
       end;
       MF := TMetaFile.Create;
       MF.Width  := Bmp.Width;
       MF.Height := Bmp.Height;;
       MF.Enhanced := False;
       MC := TMetaFileCanvas.Create(MF, 0);
       MC.Draw(0, 0, Bmp);
       MC.Free;
       MF.SaveToStream(MS);
       Bmp.Free;

       Buffer := Buffer + '{\pict\wmetafile8';
       Buffer := Buffer + '\picw' + IntToStr(MF.MMWidth);
       Buffer := Buffer + '\pich' + IntToStr(MF.MMHeight);
       Buffer := Buffer + '\picwgoal' + IntToStr(ThousandthsToTwips(MF.MMWidth * 1000));
       Buffer := Buffer + '\pichgoal' + IntToStr(ThousandthsToTwips(MF.MMHeight * 1000));

       Buffer := Buffer + CRLF;

       MF.Free;

       MS.Position := 22;
       Buffer := Buffer + '\bin' + IntToStr(MS.Size - 22) + ' ';
       Stream(Buffer);
       Buffer := '';
       MemStream.CopyFrom(MS, MS.Size - 22);
       MS.Free;
       Buffer := Buffer + '}' + CRLF;
       Buffer := Buffer + ' \par }' + CRLF;
       Buffer := Buffer + '\dpx' + IntToStr(ThousandthsToTwips(Itm.Left));
       Buffer := Buffer + '\dpy' + IntToStr(ThousandthsToTwips(Itm.Top));
       Buffer := Buffer + '\dpxsize' + IntToStr(ThousandthsToTwips(Itm.Width));
       Buffer := Buffer + '\dpysize' + IntToStr(ThousandthsToTwips(Itm.Height));
       Buffer := Buffer + '\dplinehollow';
       Buffer := Buffer + '\dplinecor0\dplinecog0\dplinecob0';
       Buffer := Buffer + '\dplinew0';
       Buffer := Buffer + '\dpfillfgcr0\dpfillfgcg0\dpfillfgcb0';
       Buffer := Buffer + '\dpfillbgcr0\dpfillbgcg0\dpfillbgcb0';
       Buffer := Buffer + '\dpfillpat0';
       Buffer := Buffer + '}' + CRLF;
    end;

    //
    // Process Shapes
    //

    if Itm.ItemType = riShape then begin
       Shp := TppDrawShape(Itm.DrawCmd);
       Buffer := Buffer + '{\do\dobxpage\dobypage\dodhgt' + IntToStr(Itm.ZOrder);

       if Shp.ShapeType in [stCircle, stEllipse] then begin
          Buffer := Buffer + '\dpellipse';
       end;

       if Shp.ShapeType in [stSquare, stRoundSquare, stRectangle, stRoundRect] then begin
          Buffer := Buffer + '\dprect';
       end;

       if Shp.ShapeType in [stRoundSquare, stRoundRect] then begin
          Buffer := Buffer + '\dproundr';
       end;

       Buffer := Buffer + '\dpx' + IntToStr(ThousandthsToTwips(Itm.Left));
       Buffer := Buffer + '\dpy' + IntToStr(ThousandthsToTwips(Itm.Top));
       Buffer := Buffer + '\dpptx' + IntToStr(ThousandthsToTwips(Itm.Width));
       Buffer := Buffer + '\dppty' + IntToStr(ThousandthsToTwips(Itm.Height));

       Buffer := Buffer + '\dpxsize' + IntToStr(ThousandthsToTwips(Itm.Width));
       Buffer := Buffer + '\dpysize' + IntToStr(ThousandthsToTwips(Itm.Height));

       Buffer := Buffer + '\dplinesolid';
       Buffer := Buffer + '\dplinecor' + Copy(ColorToStr(Shp.Pen.Color), 1, 3);
       Buffer := Buffer + '\dplinecog' + Copy(ColorToStr(Shp.Pen.Color), 4, 3);
       Buffer := Buffer + '\dplinecob' + Copy(ColorToStr(Shp.Pen.Color), 7, 3);

       if (Shp.Brush.Style <> bsClear) then begin
          Buffer := Buffer + '\dpfillbgcr' + Copy(ColorToStr(Shp.Brush.Color), 1, 3);
          Buffer := Buffer + '\dpfillbgcg' + Copy(ColorToStr(Shp.Brush.Color), 4, 3);
          Buffer := Buffer + '\dpfillbgcb' + Copy(ColorToStr(Shp.Brush.Color), 7, 3);
          Buffer := Buffer + '\dpfillpat1';
       end else begin
          Buffer := Buffer + '\dpfillpat0';
       end;

       Buffer := Buffer + '\dplinew' + IntToStr(PixelsToTwips(Shp.Pen.Width));
       Buffer := Buffer + '}';
       Buffer := Buffer + CRLF;
    end;

    //
    // Process Lines
    //

    if Itm.ItemType = riLine then begin
       Lne := TppDrawLine(Itm.DrawCmd);
       Buffer := Buffer + '{\do\dobxpage\dobypage\dodhgt12288\dpline';
       XSize  := 0;
       YSize  := 0;

       if Lne.LinePosition = lpTop then begin
          Buffer := Buffer + '\dpx' + IntToStr(ThousandthsToTwips(Itm.Left));
          Buffer := Buffer + '\dpy' + IntToStr(ThousandthsToTwips(Itm.Top));
          Buffer := Buffer + '\dpptx' + IntToStr(ThousandthsToTwips(Itm.Width));
          Buffer := Buffer + '\dppty0';
          XSize  := Itm.Width;
          YSize  := 0;
       end;

       if Lne.LinePosition = lpBottom then begin
          Buffer := Buffer + '\dpx' + IntToStr(ThousandthsToTwips(Itm.Left));
          Buffer := Buffer + '\dpy' + IntToStr(ThousandthsToTwips(Itm.Top + Itm.Height));
          Buffer := Buffer + '\dpptx' + IntToStr(ThousandthsToTwips(Itm.Width));
          Buffer := Buffer + '\dppty0';
          XSize  := Itm.Width;
          YSize  := 0;
       end;

       if Lne.LinePosition = lpLeft then begin
          Buffer := Buffer + '\dpx' + IntToStr(ThousandthsToTwips(Itm.Left) + 15);
          Buffer := Buffer + '\dpy' + IntToStr(ThousandthsToTwips(Itm.Top));
          Buffer := Buffer + '\dpptx0';
          Buffer := Buffer + '\dppty' + IntToStr(ThousandthsToTwips(Itm.Height));
          XSize  := 0;
          YSize  := Itm.Height;
       end;

       if Lne.LinePosition = lpRight then begin
          Buffer := Buffer + '\dpx' + IntToStr(ThousandthsToTwips(Itm.Left + Itm.Width) - 15);
          Buffer := Buffer + '\dpy' + IntToStr(ThousandthsToTwips(Itm.Top));
          Buffer := Buffer + '\dpptx0';
          Buffer := Buffer + '\dppty' + IntToStr(ThousandthsToTwips(Itm.Height));
          XSize  := 0;
          YSize  := Itm.Height;
       end;

       Buffer := Buffer + '\dpxsize' + IntToStr(ThousandthsToTwips(XSize));
       Buffer := Buffer + '\dpysize' + IntToStr(ThousandthsToTwips(YSize));

       Buffer := Buffer + '\dplinesolid';
       Buffer := Buffer + '\dplinecor' + Copy(ColorToStr(Lne.Pen.Color), 1, 3);
       Buffer := Buffer + '\dplinecog' + Copy(ColorToStr(Lne.Pen.Color), 4, 3);
       Buffer := Buffer + '\dplinecob' + Copy(ColorToStr(Lne.Pen.Color), 7, 3);
       Buffer := Buffer + '\dplinew' + IntToStr(PixelsToTwips(Lne.Weight));
       Buffer := Buffer + '}';
       Buffer := Buffer + CRLF;

       if Lne.LineStyle = lsDouble then begin
          Buffer := Buffer + '{\do\dobxpage\dobypage\dodhgt12289\dpline';
          XSize  := 0;
          YSize  := 0;

          if Lne.LinePosition = lpTop then begin
             Buffer := Buffer + '\dpx' + IntToStr(ThousandthsToTwips(Itm.Left));
             Buffer := Buffer + '\dpy' + IntToStr(ThousandthsToTwips(Itm.Top) + 35);
             Buffer := Buffer + '\dpptx' + IntToStr(ThousandthsToTwips(Itm.Width));
             Buffer := Buffer + '\dppty0';
             XSize  := Itm.Width;
             YSize  := 0;
          end;

          if Lne.LinePosition = lpBottom then begin
             Buffer := Buffer + '\dpx' + IntToStr(ThousandthsToTwips(Itm.Left));
             Buffer := Buffer + '\dpy' + IntToStr(ThousandthsToTwips(Itm.Top + Itm.Height) - 35);
             Buffer := Buffer + '\dpptx' + IntToStr(ThousandthsToTwips(Itm.Width));
             Buffer := Buffer + '\dppty0';
             XSize  := Itm.Width;
             YSize  := 0;
          end;

          if Lne.LinePosition = lpLeft then begin
             Buffer := Buffer + '\dpx' + IntToStr(ThousandthsToTwips(Itm.Left) + 35 + 15);
             Buffer := Buffer + '\dpy' + IntToStr(ThousandthsToTwips(Itm.Top));
             Buffer := Buffer + '\dpptx0';
             Buffer := Buffer + '\dppty' + IntToStr(ThousandthsToTwips(Itm.Height));
             XSize  := 0;
             YSize  := Itm.Height;
          end;

          if Lne.LinePosition = lpRight then begin
             Buffer := Buffer + '\dpx' + IntToStr(ThousandthsToTwips(Itm.Left + Itm.Width) - 35 - 15);
             Buffer := Buffer + '\dpy' + IntToStr(ThousandthsToTwips(Itm.Top));
             Buffer := Buffer + '\dpptx0';
             Buffer := Buffer + '\dppty' + IntToStr(ThousandthsToTwips(Itm.Height));
             XSize  := 0;
             YSize  := Itm.Height;
          end;

          Buffer := Buffer + '\dpxsize' + IntToStr(ThousandthsToTwips(XSize));
          Buffer := Buffer + '\dpysize' + IntToStr(ThousandthsToTwips(YSize));

          Buffer := Buffer + '\dplinesolid';
          Buffer := Buffer + '\dplinecor' + Copy(ColorToStr(Lne.Pen.Color), 1, 3);
          Buffer := Buffer + '\dplinecog' + Copy(ColorToStr(Lne.Pen.Color), 4, 3);
          Buffer := Buffer + '\dplinecob' + Copy(ColorToStr(Lne.Pen.Color), 7, 3);
          Buffer := Buffer + '\dplinew' + IntToStr(PixelsToTwips(Lne.Weight));
          Buffer := Buffer + '}';
          Buffer := Buffer + CRLF;
       end;

    end;

    Stream(Buffer);

  end;

  { Loop Through All Text Items }

  for J := 0 to MaxLines - 1 do begin

    Stream(Tabs);

    for I := 0 to Band.Count - 1 do begin

      Itm := TReportItem(Band[I]);

      Buffer := '';
      DoFont := False;

      //
      // Process Text
      //

      if Itm.ItemType in [riText, riCheckBox] then begin

         if I >= FirstTab then begin
            Buffer := Buffer + '\tab ';
         end;

         Txt := TppDrawText(Itm.DrawCmd);

         if Txt.Font.Name <> BaseFont then begin
            Buffer := Buffer + '\f' + FontIndex(Txt.Font.Name) + ' ';
            DoFont := True;
         end;

         if (Txt.Color <> clWhite) and (Txt.Transparent = False) then begin
            Buffer := Buffer + '\cb' + ColorIndex(Txt.Color) + ' ';
            DoFont := True;
         end;

//         if (Txt.Font.Color <> clBlack) and (Txt.Font.Color <> clWhite) then begin
         if (Txt.Font.Color <> clBlack) then begin
            Buffer := Buffer + '\cf' + ColorIndex(Txt.Font.Color) + ' ';
            DoFont := True;
         end;

         if Txt.Font.Size <> BaseSize then begin
            Buffer := Buffer + '\fs' + IntToStr(Txt.Font.Size * 2) + ' ';
            DoFont := True;
         end;

         if fsItalic in Txt.Font.Style then begin
            Buffer := Buffer + '\i ';
            DoFont := True;
         end;

         if fsBold in Txt.Font.Style then begin
            Buffer := Buffer + '\b ';
            DoFont := True;
         end;

         if fsUnderline in Txt.Font.Style then begin
            Buffer := Buffer + '\ul ';
            DoFont := True;
         end;

         Text := '';

         if Txt.IsMemo or (Txt.WordWrap = True) then begin
            if J < Txt.WrappedText.Count then begin
               Text := Txt.WrappedText[J]
            end;
         end else begin
            if J = 0 then begin
               Text := Txt.Text;
            end;
         end;

         Text := Replace(Text, '\', '\\');
         Text := Replace(Text, '{', '\{');
         Text := Replace(Text, '}', '\}');
         Text := Replace(Text, EOP, '');

//         if Txt.Text <> StringOfChar('.', Length(Txt.Text)) then begin
         Buffer := Buffer + Text;
//         end;

         if DoFont then begin
            Buffer := Buffer + '\plain ';
         end;

      end;

      Stream(Buffer);

    end;

    if MaxHeight > 0 then begin
       Stream('\par ');
    end;

  end;

  if MaxHeight > 0 then begin
     Stream('\pard ' + CRLF);
  end;

end;

{ PDF Device }

class function TPDFDevice.DeviceName: String;
begin
  Result := 'PDFFile';
end;

class function TPDFDevice.DefaultExt: String;
begin
  Result := 'PDF';
end;

class function TPDFDevice.DefaultExtFilter: String;
begin
  Result := 'PDF files|*.PDF|All files|*.*';
end;

class function TPDFDevice.DeviceDescription(aLanguageIndex: Longint): String;
begin
  Result := 'PDF File';
end;

function TPDFDevice.NextObj: String;
begin
  Result := IntToStr(ObjNo);
  Inc(ObjNo);
end;

procedure TPDFDevice.AddRef(Obj: String);
begin
  CrossRef.Add(FormatFloat('000000', StrToInt(Obj)) + ' ' + FormatFloat('0000000000', FilePos));
end;

function TPDFDevice.ParentObj(PageNo: Integer): String;
begin
  Result := IntToStr(RootObj + (PageNo div MaxKids));
end;

function TPDFDevice.FontFamily(Font: TFont): String;
begin
  Result := 'Times-Roman';

  if Pos('COURIER', UpperCase(Font.Name)) <> 0 then begin
     if fsBold in Font.Style then begin
        if fsItalic in Font.Style then begin
           Result := 'Courier-BoldOblique';
        end else begin
           Result := 'Courier-Bold';
        end;
     end else if fsItalic in Font.Style then begin
        Result := 'Courier-Oblique';
     end else begin
        Result := 'Courier';
     end;
  end;

  if Pos('ARIAL', UpperCase(Font.Name)) <> 0 then begin
     if fsBold in Font.Style then begin
        if fsItalic in Font.Style then begin
           Result := 'Helvetica-BoldOblique';
        end else begin
           Result := 'Helvetica-Bold';
        end;
     end else if fsItalic in Font.Style then begin
        Result := 'Helvetica-Oblique';
     end else begin
        Result := 'Helvetica';
     end;
  end;

  if Pos('WINGDINGS', UpperCase(Font.Name)) <> 0 then begin
     Result := 'ZapfDingbats';
  end;

  if (Pos('TIMES', UpperCase(Font.Name)) <> 0) or (Result = 'Times-Roman') then begin
     if fsBold in Font.Style then begin
        if fsItalic in Font.Style then begin
           Result := 'Times-BoldItalic';
        end else begin
           Result := 'Times-Bold';
        end;
     end else if fsItalic in Font.Style then begin
        Result := 'Times-Italic';
     end else begin
        Result := 'Times-Roman';
     end;
  end;

end;

procedure TPDFDevice.Write(Buffer: String);
begin
  if InStream then begin
     if InImage = False then begin
        Buffer := Buffer + #13 + #10;
     end;
     if Length(Buffer) > 0 then begin
        MemStream.Write(Buffer[1], Length(Buffer));
     end;
  end else begin
     inherited Write(Buffer + #13 + #10);
     StreamSize := StreamSize + Length(Buffer) + 2;
     FilePos := FilePos + Length(Buffer) + 2;
  end;
end;

procedure TPDFDevice.StartJob;
begin
  inherited;

  PageList := TStringList.Create;
  FontTbl  := TStringList.Create;
  FontObj  := TStringList.Create;
  FontNme  := TStringList.Create;
  CrossRef := TStringList.Create;
  ConvertFonts := True;

  SeparateBands := False;

  ObjNo    := 4;
  MaxKids  := 10;
  FilePos  := 0;
  TotPages := 0;

  Write('%PDF-1.2');

  AddRef('1');

  Write('1 0 obj');
  Write('<< /Type /Catalog ');
  Write('/Pages 3 0 R >> ');
  Write('endobj');
end;

procedure TPDFDevice.EndJob;
var
  I: Integer;
  Obj, Buffer: String;
begin

  WriteFontTbl;

  AddRef('2');

  Write('2 0 obj');
  Write('<< /Creator (' + ExtraDevices.PDF.Creator + ')');
  Write('/CreationDate (D:' + FormatDateTime('yyyymmdd', Date()) + ')');
  Write('/Title (' + ExtraDevices.PDF.Title + ')');
  Write('/Author (' + ExtraDevices.PDF.Author + ')');
  Write('/Producer (TExtraDevices)');
  Write('/Keywords (' + ExtraDevices.PDF.Keywords + ')');
  Write('/Subject (' + ExtraDevices.PDF.Subject + ') >>');
  Write('endobj');

  AddRef('3');

  // Main Pages Root

  Write('3 0 obj');
  Write('<< /Type /Pages ');
  Buffer := '/Kids [ ';
  for I := 0 to PageList.Count - 1 do begin
    Buffer := Buffer + Trim(Copy(PageList[I], 1, 6)) + ' 0 R ';
  end;
  Buffer := Buffer + ' ] ';
  Write(Buffer);
  Write('/Count ' + IntToStr(TotPages) + ' >> ');
  Write('endobj');

  for I := 0 to PageList.Count - 1 do begin
    Obj := Trim(Copy(PageList[I], 1, 6));
    AddRef(Obj);
    Write(Obj + ' 0 obj');
    Write('<< /Type /Pages ');
    Write('/Kids [ ' + Copy(PageList[I], 7, Length(PageList[I]) - 7) + ' ] ');
    Write('/Count ' + IntToStr(Occurs(PageList[I], 'R')) + ' ');
    Write('/Parent 3 0 R >> ');
    Write('endobj');
  end;

  WriteCrossRef;

  Write('trailer');
  Write('<< /Root 1 0 R ');
  Write('/Info 2 0 R ');
  Write('/Size ' + IntToStr(CrossRef.Count + 1) + ' >> ');
  Write('startxref');
  Write(IntToStr(XRefPos));
  inherited Write('%%EOF');

  PageList.Free;
  FontTbl.Free;
  FontObj.Free;
  FontNme.Free;
  CrossRef.Free;

  inherited;
end;

procedure TPDFDevice.WriteFontTbl;
var
  I: Integer;
begin
  for I := 0 to FontTbl.Count - 1 do begin
    AddRef(FontObj[I]);
    Write(FontObj[I] + ' 0 obj');
    Write('<< /Type /Font ');
//    Write('/Subtype /TrueType ');
    Write('/Subtype /Type1 ');
    Write('/Name /F' + IntToStr(I) + ' ');
    Write('/BaseFont /' + FontTbl[I] + ' ');
    if FontTbl[I] = 'ZapfDingbats' then begin
       Write('/Encoding /StandardEncoding >>');
    end else begin
       Write('/Encoding /WinAnsiEncoding >>');
    end;
    Write('endobj');
  end;
end;

procedure TPDFDevice.WriteCrossRef;
var
  I: Integer;
begin
  XRefPos := FilePos;

  CrossRef.Sort;

  Write('xref');
  Write('0 ' + IntToStr(CrossRef.Count + 1));
  Write('0000000000 65535 f');
  for I := 0 to CrossRef.Count - 1 do begin
    Write(Copy(CrossRef[I], 8, 10) + ' 00000 n');
  end;
end;

procedure TPDFDevice.StartBand;
begin
  inherited;
end;

procedure TPDFDevice.EndBand;
begin
  inherited;
end;

procedure TPDFDevice.StartStream;
begin
  InStream := True;
  InImage := False;
  StreamSize := 0;
end;

procedure TPDFDevice.EndStream;
var
  OutStream, TS: TMemoryStream;
  {$IFDEF VER130}
  CS: TCompressionStream;
  {$ENDIF}
  B: String;
  N: Integer;
begin
  InStream := False;
  OutStream := TMemoryStream.Create;
  MemStream.Position := 0;

  if ExtraDevices.PDF.CompressStreams or InImage then begin
     {$IFDEF VER130}
     TS := TMemoryStream.Create;
     if ExtraDevices.PDF.FastCompression = True then begin
        CS := TCompressionStream.Create(clFastest, TS);
     end else begin
        CS := TCompressionStream.Create(clMax, TS);
     end;
     CS.CopyFrom(MemStream, 0);
     CS.Free;
     TS.Position := 0;
     ASCII85(TS, OutStream);
     TS.Free;
     {$ELSE}
     if InImage then begin
        TS := TMemoryStream.Create;
        RunLength(MemStream, TS);
        ASCII85(TS, OutStream);
        TS.Free;
     end else begin
        ASCII85(MemStream, OutStream);
     end;
     {$ENDIF}

     OutStream.Position := 0;
     B := StringOfChar(' ', 80);
     while OutStream.Position < OutStream.Size do begin
       N := 80;
       if N > (OutStream.Size - OutStream.Position) then begin
          N := (OutStream.Size - OutStream.Position);
       end;
       OutStream.Read(B[1], N);
       Write(Copy(B, 1, N));
     end;

  end else begin
     MemStream.SaveToStream(OutStream);
     OutStream.Position := 0;
     SetLength(B, OutStream.Size);
     OutStream.Read(B[1], OutStream.Size);
     Write(Copy(B, 1, OutStream.Size));
  end;

  MemStream.Clear;
  OutStream.Free;
end;

procedure TPDFDevice.StartPage;
var
  PageObj: String;
begin
  inherited;

  PageHeight := ThousandthsToPoints(Page.PageDef.mmHeight);
  PageWidth  := ThousandthsToPoints(Page.PageDef.mmWidth);

  if TotPages mod MaxKids = 0 then begin
     PageList.Add(Copy(NextObj() + '      ', 1, 6) + ' ');
  end;
  TotPages := TotPages + 1;

  PageObj  := NextObj();
  PageList[PageList.Count - 1] := PageList[PageList.Count - 1] + PageObj + ' 0 R ';

  AddRef(PageObj);
  Write(PageObj + ' 0 obj');
  Write('<< /Type /Page ');
  Write('/Parent ' + Trim(Copy(PageList[PageList.Count - 1], 1, 6)) + ' 0 R ');
end;

procedure TPDFDevice.EndPage;
var
  StreamLen: String;
begin
  inherited;

  EndStream;
  StreamLen := IntToStr(StreamSize - 1);
  Write('endstream');
  Write('endobj');
  AddRef(StreamObj);
  Write(StreamObj + ' 0 obj');
  Write(StreamLen);
  Write('endobj');

  AddRef(ProcObj);
  Write(ProcObj + ' 0 obj');
  if AnyImages then begin
     Write('[ /PDF /Text /ImageC ] ');
  end else begin
     Write('[ /PDF /Text ] ');
  end;
  Write('endobj');
end;

function TPDFDevice.ImageObject(Itm: TReportItem): String;
var
  B: TBitmap;
  N: Integer;
  Mask: Boolean;
begin
  B := TBitmap.Create;
  B.PixelFormat := pf24Bit;
  Mask := False;

  if Itm.ItemType = riImage then begin
     if ExtraDevices.PDF.ScaleImages then begin
        DrawImage(B, TppDrawImage(Itm.DrawCmd), Rect(0, 0, ThousandthsToHorzPixels(Itm.Width), ThousandthsToVertPixels(Itm.Height)), True, False);
     end else begin
        DrawImage(B, TppDrawImage(Itm.DrawCmd), Rect(0, 0, TppDrawImage(Itm.DrawCmd).Picture.Width, TppDrawImage(Itm.DrawCmd).Picture.Height), True, False);
     end;
  end;

  if Itm.ItemType = riCheckBox then begin
     Mask := True;
     DrawCheckBox(B, TppDrawText(Itm.DrawCmd), Rect(0, 0, ThousandthsToHorzPixels(Itm.Width), ThousandthsToVertPixels(Itm.Height)), True, False);
     B.PixelFormat := pf1Bit;
  end;

  if Itm.ItemType = riBarCode then begin
     B.Canvas.Pen.Color := clBlack;
     B.Canvas.Brush.Style := bsClear;
     B.Width  := ThousandthsToHorzPixels(Itm.Width);
     B.Height := ThousandthsToVertPixels(Itm.Height);
     DrawBarCode(B.Canvas, TppDrawBarCode(Itm.DrawCmd), Rect(0, 0, B.Width, B.Height));
  end;

  N := ImageIndex(B, '');

  if N = -1 then begin
     Result := NextObj();
     TImageCRC(ImageList[ImageList.Count - 1]).FileName := Result;
     WriteBMP(Result, B, Mask);
  end else begin
     Result := TImageCRC(ImageList[N]).FileName;
  end;
  B.Free;
end;

{$IFNDEF VER130}
procedure TPDFDevice.RunLength(Source, Target: TStream);
var
  Buffer, C, LastOut, LastBuf: String;
  LastCnt: Integer;
begin

  C := ' ';
  Buffer := '';
  LastOut := '';
  LastCnt := 0;
  Source.Position := 0;
  Target.Position := 0;

  while Source.Position < Source.Size do begin

    Source.Read(C[1], 1);

    if (C = LastOut) and (LastCnt <= 127) then begin
       if Length(LastBuf) > 0 then begin
          Buffer := Buffer + CHR(Length(LastBuf) - 1) + LastBuf;
          LastBuf := '';
       end;
       Inc(LastCnt);
    end else begin
       if LastCnt = 0 then begin
       end else if LastCnt > 1 then begin
          Buffer := Buffer + CHR(257 - LastCnt) + LastOut;
       end else begin
          LastBuf := LastBuf + LastOut;
          if Length(LastBuf) >= 128 then begin
             Buffer := Buffer + CHR(Length(LastBuf) - 1) + LastBuf;
             LastBuf := '';
          end;
       end;
       LastCnt := 1;
       LastOut := C;
    end;

    if Length(Buffer) > 0 then begin
       Target.Write(Buffer[1], Length(Buffer));
    end;
    Buffer := '';

  end;

  if Length(LastBuf) > 0 then begin
     Buffer := Buffer + CHR(Length(LastBuf) - 1) + LastBuf;
  end;

  if LastCnt = 1 then begin
     Buffer := Buffer + CHR(0) + LastOut;
  end;

  if LastCnt > 1 then begin
     Buffer := Buffer + CHR(257 - LastCnt) + LastOut;
  end;

  Buffer := Buffer + CHR(128) + '>';
  Target.Write(Buffer[1], Length(Buffer));

  Source.Position := 0;
  Target.Position := 0;
end;
{$ENDIF}

procedure TPDFDevice.ASCII85(Source, Target: TStream);
var
  Bytes: Integer;
  I: Integer;
  Total: Cardinal;
  InBuffer: array[0..3] of Byte;
  OutBuffer: array[0..4] of Byte;
begin

  Source.Position := 0;
  Target.Position := 0;

  while Source.Position < Source.Size do begin

    for I := 0 to High(InBuffer) do begin
      InBuffer[I] := 0;
    end;

    for I := 0 to High(OutBuffer) do begin
      OutBuffer[I] := 0;
    end;

    Bytes := Source.Read(InBuffer, 4);

    Total := 0;
    for I := 0 to High(InBuffer) do begin
      Total := Total + (InBuffer[I] * Trunc(IntPower(256, 3 - I)));
    end;

    if (Total = 0) and (Bytes = 4) then begin
       OutBuffer[0] := 122;
       Target.Write(OutBuffer, 1);
    end else begin
       for I := 0 to High(OutBuffer) do begin
         OutBuffer[I] := Trunc(Total / IntPower(85, 4 - I));
         Total := Total - (OutBuffer[I] * Trunc(IntPower(85, 4 - I)));
         OutBuffer[I] := OutBuffer[I] + 33;
       end;

       Target.Write(OutBuffer, Bytes + 1);

    end;

  end;

  OutBuffer[0] := Ord('~');
  OutBuffer[1] := Ord('>');
  Target.Write(OutBuffer, 2);

  Source.Position := 0;
  Target.Position := 0;

end;

procedure TPDFDevice.WriteBMP(ImgObj: String; B: TBitmap; Mask: Boolean);
var
  Buffer, LenObj, StreamLen: String;
  I, J, K, X, Y: Integer;
  Line: PByteArray;
begin
  LenObj := NextObj();
  AddRef(ImgObj);

  Write(ImgObj + ' 0 obj');
  Write('<< /Type /XObject /Subtype /Image');
  Write('/Name /Im' + ImgObj);
  Write('/Width ' + IntToStr(B.Width) + ' /Height ' + IntToStr(B.Height));
  if Mask then begin
     Write('/ImageMask true');
     Write('/BitsPerComponent 1');
     Write('/Decode [0 1]');
     Write('/Interpolate true');
  end else begin
     Write('/BitsPerComponent 8');
     Write('/ColorSpace /DeviceRGB');
  end;

  {$IFDEF VER130}
  Write('/Filter [ /ASCII85Decode /FlateDecode ]');
  {$ELSE}
  Write('/Filter [ /ASCII85Decode /RunLengthDecode ]');
  {$ENDIF}

  Write('/Length ' + LenObj + ' 0 R >> ');
  Write('stream');
  StartStream;
  InImage := True;

  X := B.Height;

  if Mask then begin
     Y := Ceil(B.Width / 8);
  end else begin
     Y := B.Width;
  end;

  for I := 0 to X - 1 do begin

    Line := PByteArray(B.ScanLine[I]);

    for J := 0 to Y - 1 do begin
      if Mask then begin
         Buffer := Buffer + CHR(Line[J]);
      end else begin
         K := J * 3;
         Buffer := Buffer + CHR(Line[K + 2]);
         Buffer := Buffer + CHR(Line[K + 1]);
         Buffer := Buffer + CHR(Line[K + 0]);
      end;

      Write(Buffer);
      Buffer := '';
    end;

  end;

  Write(Buffer);

  EndStream;
  StreamLen := IntToStr(StreamSize);
  Write('endstream');
  Write('endobj');

  AddRef(LenObj);
  Write(LenObj + ' 0 obj');
  Write(StreamLen);
  Write('endobj');
end;

function TPDFDevice.FontIndex(Font: TFont): Integer;
var
  I: Integer;
  FontStr: String;
begin
  FontStr := FontFamily(Font);
  I := FontTbl.IndexOf(FontStr);
  if I = -1 then begin
     FontTbl.Add(FontStr);
     FontObj.Add(NextObj());
     FontNme.Add(Font.Name);
     I := FontTbl.Count - 1;
  end;
  Result := I;
end;

procedure TPDFDevice.RoundRect(Left, Top, Width, Height, XRad, YRad: Extended);
begin
  // Top
  Write(FmtFloat(Left + XRad) + ' ' + FmtFloat(Top) + ' m');
  Write(FmtFloat(Left + Width - XRad) + ' ' + FmtFloat(Top) + ' l');
  Write(ArcTo(Left + Width - XRad, Top, Left + Width, Top - YRad, XRad, YRad));
  // Right
  Write(FmtFloat(Left + Width) + ' ' + FmtFloat(Top - Height + YRad) + ' l');
  Write(ArcTo(Left + Width, Top - Height + YRad, Left + Width - XRad, Top - Height, XRad, YRad));
  // Bottom
  Write(FmtFloat(Left + XRad) + ' ' + FmtFloat(Top - Height) + ' l');
  Write(ArcTo(Left + XRad, Top - Height, Left, Top - Height + YRad, XRad, YRad));
  // Left
  Write(FmtFloat(Left) + ' ' + FmtFloat(Top - YRad) + ' l');
  Write(ArcTo(Left, Top - YRad, Left + XRad, Top, XRad, YRad));
end;

function TPDFDevice.ArcTo(X1, Y1, X2, Y2, XRadius, YRadius: Extended): String;
var
  C: array[1..6] of Extended;
  I: Integer;
  W, Y: Extended;
begin
  Result := '';
  C[5] := X2;
  C[6] := Y2;
  W := XRadius * 0.5523;
  Y := YRadius * 0.5523;

  if X2 > X1 then begin
     if Y2 > Y1 then begin
        C[1] := X1;
        C[2] := Y1 + Y;
        C[3] := X2 - W;
        C[4] := Y2;
     end else begin
        C[1] := X1 + W;
        C[2] := Y1;
        C[3] := X2;
        C[4] := Y2 + Y;
     end;
  end else begin
     if Y2 > Y1 then begin
        C[1] := X1 - W;
        C[2] := Y1;
        C[3] := X2;
        C[4] := Y2 - Y;
     end else begin
        C[1] := X1;
        C[2] := Y1 - Y;
        C[3] := X2 + W;
        C[4] := Y2;
     end;
  end;

  for I := 1 to 6 do begin
    Result := Result + FormatFloat('###0.000', C[I]) + ' ';
  end;

  Result := Replace(Result, DecimalSeparator, '.');
  Result := Result + 'c';
end;

function TPDFDevice.TextWidth(Txt: TppDrawText; Value: String): Extended;
begin
  Result := 0;

  if Txt.Font.Name = 'Arial' then begin
     if (fsBold in Txt.Font.Style) and (fsItalic in Txt.Font.Style) then begin
        Result := ComputeStringWidth(HelvBldI, Txt, Value);
     end else if (fsBold in Txt.Font.Style) then begin
        Result := ComputeStringWidth(HelvBold, Txt, Value);
     end else if (fsItalic in Txt.Font.Style) then begin
        Result := ComputeStringWidth(HelvItal, Txt, Value);
     end else begin
        Result := ComputeStringWidth(HelvNorm, Txt, Value);
     end;
  end;

  if Txt.Font.Name = 'Times New Roman' then begin
     if (fsBold in Txt.Font.Style) and (fsItalic in Txt.Font.Style) then begin
        Result := ComputeStringWidth(TimeBldI, Txt, Value);
     end else if (fsBold in Txt.Font.Style) then begin
        Result := ComputeStringWidth(TimeBold, Txt, Value);
     end else if (fsItalic in Txt.Font.Style) then begin
        Result := ComputeStringWidth(TimeItal, Txt, Value);
     end else begin
        Result := ComputeStringWidth(TimeNorm, Txt, Value);
     end;
  end;

  if Txt.Font.Name = 'Courier' then begin
     Result := Length(Txt.Text) * (ABS(Txt.Font.Size) * 600) / 1000;
  end;

  if Txt.Font.Name = 'WingDings' then begin
     Result := ComputeStringWidth(DingNorm, Txt, Value);
  end;
end;

function TPDFDevice.ComputeStringWidth(Wth: array of Word; Txt: TppDrawText; Value: String): Extended;
var
  I: Integer;
begin
  Result := 0;
  for I := 1 to Length(Value) do begin
    Result := Result + (ABS(Txt.Font.Size) * Wth[Ord(Value[I])]) / 1000;
  end;
end;

procedure TPDFDevice.ProcessBand(Band: TReportBand);
var
  I, L, N, Left, Top, Width, Height, TrueTop: Integer;
  Weight, TopMargin, CurImg, NewHeight: Integer;
  XRadius, YRadius, XOffset, YOffset, ELeft, ETop, EWidth, EHeight, ETrueTop, ETrueLeft, ELast: Extended;
  Itm: TReportItem;
  Txt: TppDrawText;
  Lne: TppDrawLine;
  Shp: TppDrawShape;
  ImgObj, WT: TStringList;
  Buffer, ResObj: String;
  Font: TFont;
  B: TBitmap;
  J: Integer;
  X, Y: Extended;
  EStop: Extended;
  BuffOut: String;
begin
  inherited;

  BodyObj   := NextObj();
  StreamObj := NextObj();
  ProcObj   := NextObj();
  ResObj    := NextObj();

  Band.Sort(ZOrderSort);

  //
  // Find all fonts on page
  //

  for I := 0 to Band.Count - 1 do begin
    Itm := TReportItem(Band[I]);
    if Itm.ItemType = riText then begin
       FontIndex(TppDrawText(Itm.DrawCmd).Font);
    end;
    if Itm.ItemType = riRTF then begin
       Font := TFont.Create;
       Font.Name := 'Arial';
       FontIndex(Font);
       Font.Free;
    end;
  end;

  Write('/MediaBox [0 0 ' + IntToStr(PageWidth) + ' ' + IntToStr(PageHeight) + '] ');

  Write('/Resources ' + ResObj + ' 0 R');
  Write('/Contents ' + BodyObj + ' 0 R >> ');
  Write('endobj');

  //
  // Create all images
  //

  AnyImages := False;
  ImgObj := TStringList.Create;

  for I := 0 to Band.Count - 1 do begin
    Itm := TReportItem(Band[I]);
    if Itm.ItemType in [riImage, riBarCode, riCheckBox] then begin
       AnyImages := True;
       ImgObj.Add(ImageObject(Itm));
    end;
  end;

  AddRef(ResObj);

  Write(ResObj + ' 0 obj');

  Write('<<');
  if FontObj.Count > 0 then begin
     Buffer := '/Font << ';
     for I := 0 to FontObj.Count - 1 do begin
       Buffer := Buffer + '/F' + IntToStr(I) + ' ' + FontObj[I] + ' 0 R ';
     end;
     Write(Buffer + '>>');
  end;

  if ImgObj.Count > 0 then begin
     Buffer := '/XObject << ';
     for I := 0 to ImgObj.Count - 1 do begin
       Buffer := Buffer + '/Im' + ImgObj[I] + ' ' + ImgObj[I] + ' 0 R ';
     end;
     Write(Buffer + '>>');
  end;

  Write('/ProcSet ' + ProcObj + ' 0 R');
  Write('>>');

  Write('endobj');

  AddRef(BodyObj);

  Write(BodyObj + ' 0 obj');
  if ExtraDevices.PDF.CompressStreams then begin
     {$IFDEF VER130}
     Write('<< /Length ' + StreamObj + ' 0 R /Filter [ /ASCII85Decode /FlateDecode ] >> ');
     {$ELSE}
     Write('<< /Length ' + StreamObj + ' 0 R /Filter /ASCII85Decode >> ');
     {$ENDIF}
  end else begin
     Write('<< /Length ' + StreamObj + ' 0 R >> ');
  end;

  Write('stream');
  StartStream;

  CurImg := 0;

  TopMargin := 0;

  for I := 0 to Band.Count - 1 do begin

    Itm := TReportItem(Band[I]);

    Left    := ThousandthsToPoints(Itm.Left);
    Width   := ThousandthsToPoints(Itm.Width);
    Height  := ThousandthsToPoints(Itm.Height);
    Top     := PageHeight - ThousandthsToPoints(Itm.Top) - TopMargin;

    ELeft   := EThousandthsToPoints(Itm.Left);
    EWidth  := EThousandthsToPoints(Itm.Width);
    EHeight := EThousandthsToPoints(Itm.Height);
    ETop    := PageHeight - EThousandthsToPoints(Itm.Top) - TopMargin;

    // Process images & barcodes

    if Itm.ItemType in [riImage, riBarCode, riCheckBox] then begin
       Write('q');
       Write(ColorToPDF(clBlack) + ' RG');
       Write(IntToStr(Width) + ' 0 0 ' + IntToStr(Height) + ' ' + IntToStr(Left) + ' ' + IntToStr(Top - Height) + ' cm');
       Write('/Im' + ImgObj[CurImg] + ' Do');
       Write('Q');
       CurImg := CurImg + 1;
    end;

    // Process shapes

    if Itm.ItemType = riShape then begin

       Shp := TppDrawShape(Itm.DrawCmd);

       Write('q');

       if Shp.Pen.Width <> 1 then begin
          Write(IntToStr(PixelsToPoints(Shp.Pen.Width)) + ' w');
       end;

       if Shp.Pen.Color <> clBlack then begin
          Write(ColorToPDF(Shp.Pen.Color) + ' RG');
       end;

       case Shp.Pen.Style of
         psDash: Write('[ 10 4 ] 0 d');
         psDashDot: Write('[ 8 3 2 3 ] 0 d');
         psDashDotDot: Write('[ 7 3 2 2 2 3 ] 0 d');
         psDot: Write('[ 2 2 ] 0 d');
         psClear: Write(ColorToPDF(clWhite) + ' RG');
       end;

       if Shp.Brush.Color <> clBlack then begin
          Write(ColorToPDF(Shp.Brush.Color) + ' rg');
       end;

       if Shp.ShapeType in [stCircle, stEllipse] then begin
          XRadius := Width / 2;
          YRadius := Height / 2;
          Write(FmtFloat(Left + XRadius) + ' ' + FmtFloat(Top) + ' m');
          Write(ArcTo(Left + XRadius, Top, Left + Width, Top - YRadius, XRadius, YRadius));
          Write(ArcTo(Left + Width, Top - YRadius, Left + XRadius, Top - Height, XRadius, YRadius));
          Write(ArcTo(Left + XRadius, Top - Height, Left, Top - YRadius, XRadius, YRadius));
          Write(ArcTo(Left, Top - YRadius, Left + XRadius, Top, XRadius, YRadius));
       end;

       if Shp.ShapeType in [stSquare] then begin
          if EWidth > EHeight then begin
             ELeft := ELeft + (EWidth - EHeight) / 2;
             Write(FmtFloat(ELeft) + ' ' + FmtFloat(ETop - EHeight) + ' ' + FmtFloat(EWidth) + ' ' + FmtFloat(EHeight) + ' re');
          end else begin
             ETop := ETop + (EHeight - EWidth) / 2;
             Write(FmtFloat(ELeft) + ' ' + FmtFloat(ETop - EHeight) + ' ' + FmtFloat(EWidth) + ' ' + FmtFloat(EHeight) + ' re');
          end;
       end;

       if Shp.ShapeType in [stRoundSquare] then begin
          if EWidth > EHeight then begin
             ELeft := ELeft + (EWidth - EHeight) / 2;
          end else begin
             ETop := ETop + (EHeight - EWidth) / 2;
          end;
          RoundRect(ELeft, ETop, EWidth, EHeight, ThousandthsToPoints(Shp.XCornerRound) div 2, ThousandthsToPoints(Shp.YCornerRound) div 2);
       end;

       if Shp.ShapeType in [stRoundRect] then begin
          RoundRect(ELeft, ETop, EWidth, EHeight, ThousandthsToPoints(Shp.XCornerRound) div 2, ThousandthsToPoints(Shp.YCornerRound) div 2);
       end;

       if Shp.ShapeType in [stRectangle] then begin
          Write(FmtFloat(ELeft) + ' ' + FmtFloat(ETop - EHeight) + ' ' + FmtFloat(EWidth) + ' ' + FmtFloat(EHeight) + ' re');
       end;

       if Shp.Pen.Style = psSolid then begin
          if Shp.Brush.Style = bsSolid then begin
             Write('B');
          end else begin
             Write('S');
          end;
       end else begin
          if Shp.Brush.Style = bsSolid then begin
             Write('f');
          end else begin
             Write('n');
          end;
       end;

       Write('Q');

    end;

    // Process lines

    if Itm.ItemType = riLine then begin

       ELeft   := EThousandthsToPoints(Itm.Left);
       EWidth  := EThousandthsToPoints(Itm.Width);
       EHeight := EThousandthsToPoints(Itm.Height);
       ETop    := PageHeight - EThousandthsToPoints(Itm.Top) - TopMargin;

       Write('q');

       Lne := TppDrawLine(Itm.DrawCmd);

       if Lne.LineStyle = lsSingle then begin
          N := 1;
       end else begin
          N := 2;
       end;

       XOffset := ELeft;
       YOffset := ETop;
       Weight  := Trunc(PixelsToPoints(Lne.Weight));

       Write(IntToStr(Weight) + ' w');

       case Lne.Pen.Style of
         psDash: Write('[ 10 4 ] 0 d');
         psDashDot: Write('[ 8 3 2 3 ] 0 d');
         psDashDotDot: Write('[ 7 3 2 2 2 3 ] 0 d');
         psDot: Write('[ 2 2 ] 0 d');
         psClear: Write(ColorToPDF(clWhite) + ' RG');
       end;

       if Lne.Pen.Color <> clBlack then begin
          Write(ColorToPDF(Lne.Pen.Color) + ' RG');
       end;

       for L := 1 to N do begin

         if Lne.LinePosition = lpTop then begin
            Write(FmtFloat(XOffset) + ' ' + FmtFloat(YOffset) + ' m');
            Write(FmtFloat(XOffset + EWidth) + ' ' + FmtFloat(YOffset) + ' l');
            YOffset := YOffset - (Weight + 3);
         end;

         if Lne.LinePosition = lpBottom then begin
            Write(FmtFloat(XOffset) + ' ' + FmtFloat(YOffset - EHeight + 0.70) + ' m');
            Write(FmtFloat(XOffset + EWidth) + ' ' + FmtFloat(YOffset - EHeight + 0.70) + ' l');
            YOffset := YOffset + (Weight + 3);
         end;

         if Lne.LinePosition = lpLeft then begin
            Write(FmtFloat(XOffset) + ' ' + FmtFloat(YOffset) + ' m');
            Write(FmtFloat(XOffset) + ' ' + FmtFloat(YOffset - EHeight) + ' l');
            XOffset := XOffset + (Weight + 3);
         end;

         if Lne.LinePosition = lpRight then begin
            Write(FmtFloat(XOffset + EWidth) + ' ' + FmtFloat(YOffset) + ' m');
            Write(FmtFloat(XOffset + EWidth) + ' ' + FmtFloat(YOffset - EHeight) + ' l');
            XOffset := XOffset - (Weight + 3);
         end;

         Write('S');

       end;

       Write('Q');

    end;

    //
    // Process RichText (as plain text for now)
    //

    if Itm.ItemType = riRTF then begin

       Font := TFont.Create;
       Font.Name := 'Arial';
       Font.Size := 9;

       Left   := ThousandthsToPoints(Itm.AdjLeft);
       Top    := PageHeight - ThousandthsToPoints(Itm.Top) - TopMargin - 12;

       Buffer := RTFToPlainString(TppDrawRichText(Itm.DrawCmd));

       Buffer := Replace(Buffer, '\', '\\');
       Buffer := Replace(Buffer, '(', '\(');
       Buffer := Replace(Buffer, ')', '\)');
       Buffer := Replace(Buffer, #13, ') Tj T* (');
       Buffer := Replace(Buffer, #10, '');

       Write('BT');

       Write('/F' + IntToStr(FontIndex(Font)) + ' ' + IntToStr(Font.Size) + ' Tf');
       Write(IntToStr(TextHeight(Font)) + ' TL');
       Write(IntToStr(Left) + ' ' + IntToStr(Top + 2) + ' Td (' + Buffer + ') Tj ');

       Write('ET');

       Font.Free;

    end;

    //
    // Process Text
    //

    if Itm.ItemType = riText then begin

       ELeft   := EThousandthsToPoints(Itm.AdjLeft);
       EHeight := EThousandthsToPoints(Itm.Height);
       EWidth  := EThousandthsToPoints(Itm.Width);

       Txt := TppDrawText(Itm.DrawCmd);

//  Removed 11/1/2000 For crosstab support
//       if Txt.IsMemo or Txt.WordWrap then begin
//          Top := PageHeight - ThousandthsToPoints(Itm.Top) - TopMargin - (Txt.Font.Size + 2);
//       end else begin
//          Top := PageHeight - ThousandthsToPoints(Itm.Top) - TopMargin - Height;
//       end;

       ETop := PageHeight - EThousandthsToPoints(Itm.Top) - TopMargin - (Txt.Font.Size + 2);

       if Txt.IsMemo or Txt.WordWrap then begin
          Buffer := Replace(Txt.WrappedText.Text, EOP, '');
          if Pos(#13, Buffer) <> 0 then begin
             ELeft := EThousandthsToPoints(Itm.Left);   // Use true left in case or wordwrapped labels
//             if Txt.Font.Size < 0 then begin
//                Txt.Font.Size := Txt.Font.Size + 2;
//             end else begin
//                Txt.Font.Size := Txt.Font.Size - 2;
//             end;
          end;
       end else begin
          Buffer := Txt.Text;
       end;

       if Txt.Transparent = False then begin
          ETrueTop := PageHeight - EThousandthsToPoints(Itm.Top) - TopMargin - EHeight;
          Write('q');
          Write(ColorToPDF(Txt.Color) + ' rg');
          Write(FmtFloat(EThousandthsToPoints(Itm.Left)) + ' ' + FmtFloat(ETrueTop) + ' ' + FmtFloat(EWidth + 2) + ' ' + FmtFloat(EHeight) + ' re');
          Write('f');
          Write('Q');
          Write(ColorToPDF(clBlack) + ' rg');
       end;

       if Txt.AutoSize = False then begin
          ETrueTop  := PageHeight - EThousandthsToPoints(Itm.Top) - TopMargin;
          ETrueLeft := EThousandthsToPoints(Itm.Left);
          Write('q');
          Write(FmtFloat(ETrueLeft) + ' ' + FmtFloat(ETrueTop) + ' m');
          Write(FmtFloat(ETrueLeft + EWidth) + ' ' + FmtFloat(ETrueTop) + ' l');
          Write(FmtFloat(ETrueLeft + EWidth) + ' ' + FmtFloat(ETrueTop - EHeight - 5) + ' l');
          Write(FmtFloat(ETrueLeft) + ' ' + FmtFloat(ETrueTop - EHeight - 5) + ' l');
          Write(FmtFloat(ETrueLeft) + ' ' + FmtFloat(ETrueTop) + ' l');
          Write('W');
          Write('n');
       end;

       Write('BT');

       if Txt.Font.Color <> clBlack then begin
          Write(ColorToPDF(Txt.Font.Color) + ' rg');
       end;

       Write('/F' + IntToStr(FontIndex(Txt.Font)) + ' ' + IntToStr(Txt.Font.Size) + ' Tf');
       Write(IntToStr(TextHeight(Txt.Font) - 1 + ThousandthsToPoints(Txt.Leading)) + ' TL');

       Y := TextHeight(Txt.Font) - 1 + ThousandthsToPoints(Txt.Leading);

       if Txt.TextAlignment = taRightJustified then begin
          ELeft := EThousandthsToPoints(Itm.Left);
          EStop := ELeft + EWidth;
          WT := TStringList.Create;
          WT.Text := Buffer;
          ELast := EStop;
          Write(FmtFloat(EStop) + ' ' + FmtFloat(ETop + 2) + ' Td ');

          for J := 0 to WT.Count - 1 do begin
            Buffer := WT[J];
            ELeft  := TextWidth(Txt, Buffer);
            Buffer := Replace(Buffer, '\', '\\');
            Buffer := Replace(Buffer, '(', '\(');
            Buffer := Replace(Buffer, ')', '\)');
            Write(FmtFloat(EStop - ELast - ELeft) + ' ' + FmtFloat(0) + ' Td (' + Buffer + ') Tj T*');
            ELast  := EStop - ELeft;
          end;
          WT.Free;
       end else begin
          Buffer := Replace(Buffer, #10, '');
          Buffer := Replace(Buffer, '\', '\\');
          Buffer := Replace(Buffer, '(', '\(');
          Buffer := Replace(Buffer, ')', '\)');
          Buffer := Replace(Buffer, #13, ') Tj T* (');

          Write(FmtFloat(ELeft) + ' ' + FmtFloat(ETop + 2) + ' Td (' + Buffer + ') Tj ');
       end;

       if Txt.Font.Color <> clBlack then begin
          Write(ColorToPDF(clBlack) + ' rg');
       end;

       Write('ET');

       if fsUnderline in Txt.Font.Style then begin
          Write('1 w');
          if Txt.Font.Color <> clBlack then begin
             Write(ColorToPDF(Txt.Font.Color) + ' RG');
          end;
          Write(FmtFloat(ELeft) + ' ' + FmtFloat(ETop) + ' m');
          Write(FmtFloat(ELeft + ThousandthsToPoints(Itm.AdjWidth) + 1) + ' ' + FmtFloat(ETop) + ' l');
          if Txt.Font.Color <> clBlack then begin
             Write(ColorToPDF(clBlack) + ' RG');
          end;
          Write('S');
       end;

       if Txt.AutoSize = False then begin
          Write('Q');
       end;

    end;

  end;

  ImgObj.Free;

end;

function ExtraDevices: TExtraOptions;
begin
  if FOptions = Nil then begin
     FOptions := TExtraOptions.Create;
  end;
  Result := FOptions;
end;

{ TExtraDeviceOptions }

procedure TExtraDeviceOptions.SetVisible(Value: Boolean);
begin
  if FVisible <> Value then begin
     FVisible := Value;
  end;
end;

function TExtraDeviceOptions.GetVisible: Boolean;
begin
  Result := FVisible;
end;

constructor TExtraDeviceOptions.Create;
begin
  FVisible := True;
end;

{ THTMLDeviceOptions }

constructor THTMLDeviceOptions.Create;
begin
  inherited;
  FShowLinks   := True;
  FBackLink    := '&lt&lt';
  FForwardLink := '&gt&gt';
  FPixelFormat := pf8bit;
end;

destructor THTMLDeviceOptions.Destroy;
begin
end;

procedure THTMLDeviceOptions.SetVisible(Value: Boolean);
begin
  inherited;
  if Value then begin
     ppRegisterDevice(THTMLDevice);
  end else begin
     ppUnRegisterDevice(THTMLDevice);
  end;
end;

{ TGraphicDeviceOptions }

constructor TGraphicDeviceOptions.Create;
begin
  inherited;
  FPixelFormat := pf8bit;
end;

destructor TGraphicDeviceOptions.Destroy;
begin
end;

procedure TGraphicDeviceOptions.SetVisible(Value: Boolean);
begin
  inherited;
  if Value then begin
     ppRegisterDevice(TGraphicDevice);
  end else begin
     ppUnRegisterDevice(TGraphicDevice);
  end;
end;

{ TCSS2DeviceOptions }

constructor TCSS2DeviceOptions.Create;
begin
  inherited;
  FShowLinks   := True;
  FBackLink    := '&lt&lt';
  FForwardLink := '&gt&gt';
  FPixelFormat := pf8bit;
end;

destructor TCSS2DeviceOptions.Destroy;
begin
end;

procedure TCSS2DeviceOptions.SetVisible(Value: Boolean);
begin
  inherited;
  if Value then begin
     ppRegisterDevice(TCSS2Device);
  end else begin
     ppUnRegisterDevice(TCSS2Device);
  end;
end;

{ TPDFDeviceOptions }

constructor TPDFDeviceOptions.Create;
begin
  inherited;
  FAuthor   := 'TExtraDevices';
  FTitle    := '';
  FCreator  := 'TExtraDevices';
  FKeywords := '';
  FSubject  := '';
  FFastCompression := False;
  FCompressImages := True;
  FCompressStreams := True;
  FScaleImages := True;
end;

procedure TPDFDeviceOptions.SetVisible(Value: Boolean);
begin
  inherited;
  if Value then begin
     ppRegisterDevice(TPDFDevice);
  end else begin
     ppUnRegisterDevice(TPDFDevice);
  end;
end;

{ TXLSDeviceOptions }

procedure TXLSDeviceOptions.SetVisible(Value: Boolean);
begin
  inherited;
  if Value then begin
     ppRegisterDevice(TXLSDevice);
  end else begin
     ppUnRegisterDevice(TXLSDevice);
  end;
end;

{ TWQ1DeviceOptions }

procedure TWQ1DeviceOptions.SetVisible(Value: Boolean);
begin
  inherited;
  if Value then begin
     ppRegisterDevice(TWQ1Device);
  end else begin
     ppUnRegisterDevice(TWQ1Device);
  end;
end;

{ TRTFDeviceOptions }

procedure TRTFDeviceOptions.SetVisible(Value: Boolean);
begin
  inherited;
  if Value then begin
     ppRegisterDevice(TRTFDevice);
  end else begin
     ppUnRegisterDevice(TRTFDevice);
  end;
end;

{ TWK1DeviceOptions }

procedure TWK1DeviceOptions.SetVisible(Value: Boolean);
begin
  inherited;
  if Value then begin
     ppRegisterDevice(TWK1Device);
  end else begin
     ppUnRegisterDevice(TWK1Device);
  end;
end;

{ TExtraOptions }

constructor TExtraOptions.Create;
begin
  inherited;
  FHTML    := THTMLDeviceOptions.Create;
  FCSS2    := TCSS2DeviceOptions.Create;
  FRTF     := TRTFDeviceOptions.Create;
  FPDF     := TPDFDeviceOptions.Create;
  FLotus   := TWK1DeviceOptions.Create;
  FExcel   := TXLSDeviceOptions.Create;
  FQuattro := TWQ1DeviceOptions.Create;
  FGraphic := TGraphicDeviceOptions.Create;
end;

destructor TExtraOptions.Destroy;
begin
  FHTML.Free;
  FCSS2.Free;
  FRTF.Free;
  FPDF.Free;
  FLotus.Free;
  FExcel.Free;
  FQuattro.Free;
  FGraphic.Free;
  inherited;
end;

initialization
  ppRegisterDevice(TWK1Device);
  ppRegisterDevice(TWQ1Device);
  ppRegisterDevice(TXLSDevice);
  ppRegisterDevice(TGraphicDevice);
  ppRegisterDevice(THTMLDevice);
  ppRegisterDevice(TCSS2Device);
  ppRegisterDevice(TRTFDevice);
  ppRegisterDevice(TPDFDevice);

finalization
  ppUnRegisterDevice(TWK1Device);
  ppUnRegisterDevice(TWQ1Device);
  ppUnRegisterDevice(TXLSDevice);
  ppUnRegisterDevice(TGraphicDevice);
  ppUnRegisterDevice(THTMLDevice);
  ppUnRegisterDevice(TCSS2Device);
  ppUnRegisterDevice(TRTFDevice);
  ppUnRegisterDevice(TPDFDevice);
  FOptions.Free;

end.
