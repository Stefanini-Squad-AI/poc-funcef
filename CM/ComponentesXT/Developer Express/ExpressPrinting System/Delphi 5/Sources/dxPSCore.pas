{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressPrinting System(tm) COMPONENT SUITE                  }
{                                                                   }
{       Copyright (C) 1998-2001 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire coVisntents of this file is protected by U.S. and    }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES           }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE    }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS   }
{   LICENSED TO DISTRIBUTE THE EXPRESSPRINTINGSYSTEM AND            }
{   ALL ACCOMPANYING VCL CONTROLS AS PART OF AN                     }
{   EXECUTABLE PROGRAM ONLY.                                        }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                      }
{                                                                   }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}

unit dxPSCore;

interface

{$I dxPSVer.inc}

uses
  Windows, SysUtils, Classes, Controls, Messages, Graphics, Forms, StdCtrls,
  Menus, {$IFDEF DELPHI4}ImgList, {$ENDIF}
  dxPgsDlg, dxPSEngn, dxPSESys, dxBase, dxPSForm, dxWrap, dxBkgnd, dxPSGlbl,
  dxPrnPg, dxPrnDlg;

type
  EdxPrintEngine = class(Exception);

  EdxComponentPrinter = class(EdxPrintEngine);

  EdxReportLink = class(EdxPrintEngine);

  TCustomdxComponentPrinter = class;

  TdxReportItem = class;
  TdxReportItemClass = class of TdxReportItem;

  TdxReportCell = class;
  TdxReportCells = class;

  TAbstractdxReportCellData = class;
  TdxReportCellDataClass = class of TAbstractdxReportCellData;

  TAbstractdxReportLinkDesigner = class;
  TAbstractdxPreviewWindowDesigner = class;

  TBasedxReportLink = class;
  TdxReportLinkClass = class of TBasedxReportLink;

  TAbstractdxReportLinkDesignWindow = class;
  TdxReportLinkDesignWindowClass = class of TAbstractdxReportLinkDesignWindow;

  TBasedxPreviewWindow = class;
  TdxPreviewWindowClass = class of TBasedxPreviewWindow;


{ - Moved from here to the dxPSGlbl.pas

  TdxTextAlignX = (taLeft, taCenterX, taRight);
  TdxTextAlignY = (taTop, taCenterY, taBottom);
}


  TdxReportTitleMode = (tmNone, tmOnFirstPage, tmOnEveryTopPage);

  TdxReportTitle = class(TPersistent)
  private
    FAdjustOnReportScale: Boolean;
    FColor: TColor;
    FFont: TFont;
    FMode: TdxReportTitleMode;
    FReportLink: TBasedxReportLink;
    FText: string;
    FTextAlignX: TdxTextAlignX;
    FTextAlignY: TdxTextAlignY;
    FTransparent: Boolean;
    FUpdateCount: Integer;

    procedure SetAdjustOnReportScale(Value: Boolean);
    procedure SetColor(Value: TColor);
    procedure SetFont(Value: TFont);
    procedure SetMode(Value: TdxReportTitleMode);
    procedure SetText(const Value: string);
    procedure SetTextAlignX(Value: TdxTextAlignX);
    procedure SetTextAlignY(Value: TdxTextAlignY);
    procedure SetTransparent(Value: Boolean);

    procedure CalcRenderInfos;
    procedure FontChanged(Sender: TObject);
  protected
    procedure DoRestoreDefaults;
  public
    constructor Create(AReportLink: TBasedxReportLink);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    procedure BeginUpdate;
    procedure CancelUpdate;
    procedure EndUpdate;
    procedure RestoreDefaults;

    property ReportLink: TBasedxReportLink read FReportLink;
  published
    property AdjustOnReportScale: Boolean read FAdjustOnReportScale write SetAdjustOnReportScale default False;
    property Color: TColor read FColor write SetColor default clWhite;
    property Font: TFont read FFont write SetFont;
    property Mode: TdxReportTitleMode read FMode write SetMode default tmOnEveryTopPage;
    property Text: string read FText write SetText;
    property TextAlignX: TdxTextAlignX read FTextAlignX write SetTextAlignX default taCenterX;
    property TextAlignY: TdxTextAlignY read FTextAlignY write SetTextAlignY default taCenterY;
    property Transparent: Boolean read FTransparent write SetTransparent default True;
  end;


  TdxContinuedIndexPair = record
    StartIndex: Integer;
    EndIndex: Integer;
  end;

  TdxWindowScalePair = record
    Numerator: Integer;
    Denominator: Integer;
  end;

  PdxContinuedIndexes = ^TdxContinuedIndexes;
  TdxContinuedIndexes = array[0..MaxInt div SizeOf(TdxContinuedIndexPair) - 1] of TdxContinuedIndexPair;

  TdxPSReportRenderInfo = class;

  TdxPSPageRenderInfoClass = class of TdxPSPageRenderInfo;
  TdxPSPageRenderInfo = class
  private
    FRenderInfo: TdxPSReportRenderInfo;

    function GetFooterRect: TRect;
    function GetHeaderRect: TRect;
    function GetReportLink: TBasedxReportLink;
    function GetTitleRect: TRect;
  protected
    procedure CalcIndexPairs(APageIndex, AStartIndex: Integer); virtual;
    procedure CalcOffsets(APageIndex: Integer);
  public
    ContentRect: TRect;
    ContinuedIndexes: PdxContinuedIndexes;
    ContinuedIndexPairCount: Integer;
    DataOffset: TPoint;
    DetailRect: TRect;
    IsBottomPage: Boolean;
    IsEmptyPage: Boolean;
    IsFooterExists: Boolean;
    IsHeaderExists: Boolean;
    IsTopPage: Boolean;
    TitleOffset: TPoint;

    constructor Create(AReportRenderInfo: TdxPSReportRenderInfo); virtual;
    destructor Destroy; override;
    function IsDetailsExists: Boolean;

    property FooterRect: TRect read GetFooterRect;
    property HeaderRect: TRect read GetHeaderRect;
    property RenderInfo: TdxPSReportRenderInfo read FRenderInfo;
    property ReportLink: TBasedxReportLink read GetReportLink;
    property TitleRect: TRect read GetTitleRect;
  end;


  PdxPSPageRenderInfos = ^TdxPSPageRenderInfos;
  TdxPSPageRenderInfos = array[0..MaxInt div SizeOf(TdxPSPageRenderInfo) - 1] of TdxPSPageRenderInfo;

  TdxPSReportRenderInfoClass = class of TdxPSReportRenderInfo;
  TdxPSReportRenderInfo = class
  private
    FBaseContentFont: TFont;
    FGridLinesColor: TColor;
    FLockCounter: Integer;
    FReportLink: TBasedxReportLink;

    FXDelimiters: TList;
    FXPageDelimiters: TList;
    FYDelimiters: TList;
    FYPageDelimiters: TList;

    function GetLocked: Boolean;
    function GetNonEmptyPageCount: Integer;
    function GetPrinterPage: TdxPrinterPage;
    function GetReportCells: TdxReportCells;
    function GetScaleFactor: Integer;
    procedure GetStartIndex(APageIndex: Integer; var AStartIndex: Integer);
    procedure SetBaseContentFont(Value: TFont);
    function IsNonEmptyPage(const APageRect: TRect): Boolean;
  protected
    procedure CalcEmptyPages; virtual;
    procedure CalcHeaderAndFooterRects; virtual;
    procedure CalcPageColRowCount; virtual;
    function CalcPageContentHeight(APageIndex: Integer): Integer; virtual;
    function CalcPageContentWidth(APageIndex: Integer): Integer; virtual;
    procedure CalcPageCount; virtual;
    procedure CalcPageDelimiters; virtual;
    procedure CalcPageHeaderAndFooterRects; virtual;
    procedure CalcPageIndexPairs; virtual;
    procedure CalcPageRects(APageIndex: Integer); virtual;
    procedure CalcPageSizes; virtual;
    procedure CalcPagesRenderInfos; virtual;
    function CalcTitleHeight: Integer; virtual;
    procedure CalcTitleRect; virtual;
    procedure DoCalcRenderInfos; virtual;
    procedure FreeRenderInfos; virtual;
    function GetPageRenderInfoClass: TdxPSPageRenderInfoClass; virtual;
    function GetUnitsPerInch: Integer; virtual;
    function IsDrawPageTitleOnPage(AVirtualPageIndex, AColCount: Integer): Boolean; virtual;
    function IsTitleExists(APageIndex: Integer): Boolean;
    function LoMetricValueToInternalUnits(Value: Integer): Integer; virtual;
    procedure SetupPageRenderInfoFlags(APageIndex: Integer); virtual;

    procedure CalcPageRealAndVirtualIndexes(APageIndex: Integer;
      var AVirtualPageIndex, ARealPageIndex: Integer);
    function CanRenderPage(AVirtualPageIndex: Integer): Boolean;
    procedure EliminateDuplicatesAndSortDelimiters(AList: TList);
    procedure GetDelimiters;
    function LoMetricRectToInternalUnits(const R: TRect): TRect;
    function RealPageIndexToVirtualPageIndex(APageIndex: Integer;
      ATakeIntoAccountEmptyPages: Boolean): Integer;
    function VirtualPageIndexToRealPageIndex(APageIndex: Integer): Integer;
  public
    CanUseHFOnEveryPageMode: Boolean;
    EmptyPageCount: Integer;
    FooterRect: TRect;
    HeaderRect: TRect;
    PageColCount: Integer;
    PageFooterRect: TRect;
    PageHeaderRect: TRect;
    PageRenderInfos: PdxPSPageRenderInfos; // [0..VirtualPageCount - 1]
    PageRowCount: Integer;
    PageSize: TPoint;
    PaintSize: TPoint;
    TitleRect: TRect;
    WindowScalePair: TdxWindowScalePair;
    VirtualPageCount: Integer;
    constructor Create(AReportLink: TBasedxReportLink); virtual;
    destructor Destroy; override;
    procedure CalcRenderInfos;
    procedure Lock;
    procedure Unlock;

    property BaseContentFont: TFont read FBaseContentFont write SetBaseContentFont;
    property GridLinesColor: TColor read FGridLinesColor write FGridLinesColor;
    property Locked: Boolean read GetLocked;
    property NonEmptyPageCount: Integer read GetNonEmptyPageCount;
    property PrinterPage: TdxPrinterPage read GetPrinterPage;
    property ReportCells: TdxReportCells read GetReportCells;
    property ReportLink: TBasedxReportLink read FReportLink;
    property ScaleFactor: Integer read GetScaleFactor;
    property UnitsPerInch: Integer read GetUnitsPerInch;
  end;


  TdxCellCheckPos = (ccpLeft, ccpCenter, ccpRight);
  TdxCellEdgeKind = (cekInner, cekOuter);
  TdxCellEdgeMode = (cemSingle, cem3DEffects, cemShadow);
  TdxCellEdgeStyle = (cesNone, cesSunken, cesRaised);
  TdxCellSide = (csLeft, csTop, csRight, csBottom);
  TdxCellSides = set of TdxCellSide;
  TdxCellSortOrder = (csoNone, csoUp, csoDown);
  TdxCellShadowPos = (cspTopLeft, cspTopRight, cspBottomRight, cspBottomLeft);
  TdxGraphicDrawMode = (gdmNone, gdmCenter, gdmStretch, gdmStretchProportional);
  TdxImageLayout = (ilImageLeft, ilImageTop, ilImageRight, ilImageBottom, ilImageCenter);

  PFont = ^TFont;
{$IFNDEF DELPHI5}
  PColor = ^TColor;
{$ENDIF}

  TdxPSReportRenderer = class(TObject)
  private
    FCanvas: TCanvas;
    FDC: HDC;
    FPPI: Integer;
    FRenderingPageIndex: Integer; // virtual index
    FReportLink: TBasedxReportLink;
    FViewPortRect: TRect;
    FZoomFactor: Integer;

    FBorderBrush: HBRUSH;
    FBtnHighLightPen: HPEN;
    FBtnShadowPen: HPEN;
    FDrawBitmap: TBitmap;
    FHFStrings: TStrings;
    FPatternBrush: HBRUSH;

    FPrevMode: Integer;
    FPrevWindowExt: TSize;
    FPrevWindowOrg: TPoint;
    FPrevViewPortExt: TSize;
    FPrevViewPortOrg: TPoint;

    FSaveColor: TColor;
    FSaveFont: TFont;

    function GetPageRenderInfo: TdxPSPageRenderInfo;
    function CreatePatternBrush: HBRUSH;
  protected
    procedure CustomDrawReportItem(AItem: TAbstractdxReportCellData;
      var R: TRect; AClientRect: TRect; var ADone: Boolean);
    function GetRenderInfo: TdxPSReportRenderInfo; virtual;
    function GetUnitsPerInch: Integer; virtual;

    procedure PrepareCanvasForCustomDraw(AFont: PFont; AColor: PColor);
    procedure PrepareFonts;
    procedure PrepareGDIObjects; virtual;
    procedure PrepareLogicalCoordinates; virtual;
    procedure PrepareLogicalUnits; virtual;
    procedure PrepareRenderPage; virtual;
    procedure PrepareWindow; virtual;
    procedure PrepareViewPort; virtual;
    procedure RenderPageContent; virtual;
    procedure RenderPageContentPart(ACell: TdxReportCell;
      StartIndex, EndIndex: Integer; const OriginRect: TRect);
    procedure RenderEntirePage(ARealPageIndex: Integer); virtual;
    procedure RenderPageFooter(ARealPageIndex: Integer); virtual;
    procedure RenderPageHeader(ARealPageIndex: Integer); virtual;
    procedure RenderPageHeaderOrFooter(HF: TCustomdxPageObject;
      APageIndex: Integer; ARect: TRect); virtual;
    procedure RenderPageHeaderOrFooterContent(HF: TCustomdxPageObject;
      APageIndex: Integer; ARect: TRect; ATitleParts: TdxPageTitleParts;
      ADrawBackground: Boolean); virtual;
    procedure RenderPageHeaderOrFooterContentPart(ATitlePart: TdxPageTitlePart;
      AStrings: TStrings; ATextAlignY: TdxTextAlignY;
      ALineHeight, ADestWidth, ADestHeight: Integer; const ARect: TRect);
    procedure RenderPageTitleContent(const AText: string; ARect: TRect;
      ATextAlignX: TdxTextAlignX; ATextAlignY: TdxTextAlignY;
      AColor: TColor; AFont: TFont; ATransparent: Boolean); virtual;
    procedure RenderPageTitle; virtual;
    procedure RestoreMapMode; virtual;
    procedure SaveMapMode; virtual;
    procedure UnprepareCanvasForCustomDraw;
    procedure UnprepareGDIObjects; virtual;
    procedure UnprepareRenderPage; virtual;
  public
    constructor Create(AReportLink: TBasedxReportLink); virtual;
    destructor Destroy; override;

    function BrushNeeded(AColor: TColor): HBRUSH;
    procedure DrawCheckBox(DC: HDC; var R: TRect; AChecked, AEnabled, AFlatBorder: Boolean); virtual;
    procedure DrawEdge(DC: HDC; var R: TRect; AEdgeMode: TdxCellEdgeMode;
      AInnerEdge, AOuterEdge: TdxCellEdgeStyle; ASides: TdxCellSides); virtual;
    procedure DrawGraphic(DC: HDC; var R: TRect; const ClipRect: TRect;
      ImageList: {$IFDEF DELPHI4}TCustomImageList{$ELSE}TImageList{$ENDIF};
      ImageIndex: Integer; Graphic: TGraphic; GraphicTransparent, Transparent: Boolean;
      Color: TColor); virtual;
    procedure DrawText(DC: HDC; var R: TRect; AIndent: Integer; const Text: string;
      Font: TFont; BkColor: TColor; TextAlignX: TdxTextAlignX;
      TextAlignY: TdxTextAlignY; FillBackground, Multiline, EndEllipsis: Boolean); virtual;
    procedure DrawSortMark(DC: HDC; var R: TRect; SortOrder: TdxCellSortOrder; Mono: Boolean); virtual;
    procedure FillRect(DC: HDC; const R: TRect; AColor: TColor); virtual;
    procedure FillRgn(DC: HDC; Rgn: HRGN; AColor: TColor); virtual;
    procedure FrameRect(DC: HDC; const R: TRect; AColor: TColor); virtual;
    class function IntersectClipRect(DC: HDC; const R: TRect): HRGN; virtual;
    class procedure RestoreClipRgn(DC: HDC; var Rgn: HRGN); virtual;

    procedure RenderPage(ACanvas: TCanvas; const APageRect: TRect;
      AVirtualPageIndex, ARealPageIndex, AZoomFactor: Integer); virtual;

    property Canvas: TCanvas read FCanvas;
    property DC: HDC read FDC;
    property RenderInfo: TdxPSReportRenderInfo read GetRenderInfo;
    property PageRenderInfo: TdxPSPageRenderInfo read GetPageRenderInfo;
    property PPI: Integer read FPPI write FPPI; // PixelsPerInch for current DC
    property RenderingPageIndex: Integer read FRenderingPageIndex; // virtual
    property ReportLink: TBasedxReportLink read FReportLink;
    property UnitsPerInch: Integer read GetUnitsPerInch;
    property ViewPortRect: TRect read FViewPortRect;
    property ZoomFactor: Integer read FZoomFactor;
  end;

  TdxPSReportRendererClass = class of TdxPSReportRenderer;


  TdxPSBrushPoolItem = record
    Brush: HBRUSH;
    Color: TColor;
  end;

  PdxPSBrushPoolItems = ^TdxPSBrushPoolItems;
  TdxPSBrushPoolItems = array[0..MaxInt div SizeOf(TdxPSBrushPoolItem) - 1] of TdxPSBrushPoolItem;

  TdxPSReportBrushPool = class(TObject)
  private
    FCount: Integer;
    FItems: PdxPSBrushPoolItems;
    function GetBrushItem(Index: Integer): HBRUSH;
    function GetColorItem(Index: Integer): TColor;

    function CreateBrush(AColor: TColor): HBRUSH;
    procedure ReallocItems(NewCount: Integer);
  public
    destructor Destroy; override;

    function Add(AColor: TColor): Integer;
    function BrushNeeded(AColor: TColor): HBRUSH;
    procedure Clear;
    function IndexOf(AColor: TColor): Integer;

    property Brushes[Index: Integer]: HBRUSH read GetBrushItem; default;
    property Colors[Index: Integer]: TColor read GetColorItem;
    property Count: Integer read FCount;
  end;


  TdxPSFontPoolItem = record
    Font: TFont;
    OriginalSize: Integer;
  end;

  PdxPSFontPoolItems = ^TdxPSFontPoolItems;
  TdxPSFontPoolItems = array[0..MaxInt div SizeOf(TdxPSFontPoolItem) - 1] of TdxPSFontPoolItem;

  TdxPSReportFontPool = class(TObject)
  private
    FCount: Integer;
    FItems: PdxPSFontPoolItems;

    function GetFont(Index: Integer): TFont;

    function CreateFont(AFont: TFont): Integer;
    procedure PrepareFonts(UPI: Integer);
    procedure ReallocItems(NewCount: Integer);
  public
    destructor Destroy; override;

    function Add(AFont: TFont): Integer;
    procedure Clear;
    function IndexOf(AFont: TFont): Integer;

    property Count: Integer read FCount;
    property Fonts[Index: Integer]: TFont read GetFont; default;
  end;


  TdxAssignedFormatValue = (fvDate, fvTime, fvPageNumber);
  TdxAssignedFormatValues = set of TdxAssignedFormatValue;

  TdxCustomDrawReportLinkTitleEvent = procedure(Sender: TBasedxReportLink;
    ACanvas: TCanvas; ARect: TRect; ANom, ADenom: Integer;
    var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY;
    var AColor: TColor; AFont: TFont; var ADone: Boolean) of object;

  TdxCustomDrawReportLinkHFEvent = procedure(Sender: TObject;
    ACanvas: TCanvas; APageIndex: Integer; var ARect: TRect; ANom, ADenom: Integer;
    var ADefaultDrawText, ADefaultDrawBackground: Boolean) of object;

  TdxFilterStyleEvent = procedure(Sender: TBasedxReportLink;
    AStyle: TBasedxPrintStyle; var ASupported: Boolean) of object;

  TdxMeasureReportLinkTitleEvent = procedure(Sender: TBasedxReportLink;
    var AHeight: Integer) of object;


  TBasedxReportLink = class(TComponent)
  private
    FActive: Boolean;
    FAssignedFormatValues: TdxAssignedFormatValues;
    FComponent: TComponent;
    FComponentPrinter: TCustomdxComponentPrinter;
    FCurrentPage: Integer;
    FData: Pointer;
    FDateFormat: Integer;
    FDateTime: TDateTime;
    FDesignerCaption: string;
    FDesignerHelpContext: THelpContext;
    FFont: TFont;
    FFootersOnEveryPage: Boolean;
    FHeadersOnEveryPage: Boolean;
    FPageNumberFormat: TdxPageNumberFormat;
    FPrinterPage: TdxPrinterPage;
    FRebuildNeeded: Boolean;
    FRenderer: TdxPSReportRenderer;
    FRenderInfo: TdxPSReportRenderInfo;
    FReportHeight: Integer;
    FReportTitle: TdxReportTitle;
    FReportWidth: Integer;
    FScaleFonts: Boolean;
    FShowDesigner: Boolean;
    FShowEmptyPages: Boolean;
    FShowPageFooter: Boolean;
    FShowPageHeader: Boolean;
    FShrinkToPageWidth: Boolean;
    FStartPageIndex: Integer;
    FStyleManager: TdxPrintStyleManager;
    FSubscriber: TdxEventSubscriber;
    FTimeFormat: Integer;
    FTransparent: Boolean;
    FUseHorzDelimiters: Boolean;
    FUseVertDelimiters: Boolean;

    FBrushPool: TdxPSReportBrushPool;
    FFontPool: TdxPSReportFontPool;
    FPainting: Boolean;
    FPrepared: Boolean;
    FReportCells: TdxReportCells;
    FStreamedActive: Boolean;

    FOnChangeComponent: TNotifyEvent;
    FOnCustomDrawPageFooter: TdxCustomDrawReportLinkHFEvent;
    FOnCustomDrawPageHeader: TdxCustomDrawReportLinkHFEvent;
    FOnCustomDrawReportLinkTitle: TdxCustomDrawReportLinkTitleEvent;
    FOnDestroy: TNotifyEvent;
    FOnFilterStyle: TdxFilterStyleEvent;
    FOnMeasureReportLinkTitle: TdxMeasureReportLinkTitleEvent;

    function GetBrushPool: TdxPSReportBrushPool;
    function GetCurrentPrintStyle: TBasedxPrintStyle;
    function GetDateFormat: Integer;
    function GetDesignerClass: TdxReportLinkDesignWindowClass;
    function GetFontPool: TdxPSReportFontPool;
    function GetPageCount: Integer;
    function GetRealPrinterPage: TdxPrinterPage;
    function GetReportTitleMode: TdxReportTitleMode;
    function GetReportTitleText: string;
    function GetRenderer: TdxPSReportRenderer;
    function GetRenderInfo: TdxPSReportRenderInfo;
    function GetIsCurrentLink: Boolean;
    function GetIndex: Integer;
    function GetPageNumberFormat: TdxPageNumberFormat;
    function GetShrinkToPageWidth: Boolean;
    function GetTimeFormat: Integer;
    function GetVirtualPageCount: Integer;
    function GetVisiblePageCount: Integer;
    function IsDateFormatStored: Boolean;
    function IsDesignerCaptionStored: Boolean;
    function IsPageNumberFormatStored: Boolean;
    function IsTimeFormatStored: Boolean;
    procedure SetAssignedFormatValues(Value: TdxAssignedFormatValues);
    procedure SetComponentPrinter(Value: TCustomdxComponentPrinter);
    procedure SetCurrentPage(Value: Integer);
    procedure SetDateFormat(Value: Integer);
    procedure SetDateTime(const Value: TDateTime);
    procedure SetIndex(Value: Integer);
    procedure SetIsCurrentLink(Value: Boolean);
    procedure SetPageNumberFormat(Value: TdxPageNumberFormat);
    procedure SetPrinterPage(Value: TdxPrinterPage);
    procedure SetRealPrinterPage(Value: TdxPrinterPage);
    procedure SetReportTitle(Value: TdxReportTitle);
    procedure SetReportTitleMode(Value: TdxReportTitleMode);
    procedure SetReportTitleText(const Value: string);
    procedure SetShowEmptyPages(Value: Boolean);
    procedure SetShowPageFooter(Value: Boolean);
    procedure SetShowPageHeader(Value: Boolean);
    procedure SetShrinkToPageWidth(Value: Boolean);
    procedure SetStartPageIndex(Value: Integer);
    procedure SetStyleManager(Value: TdxPrintStyleManager);
    procedure SetTimeFormat(Value: Integer);
    procedure SetUseHorzDelimiters(Value: Boolean);
    procedure SetUseVertDelimiters(Value: Boolean);
    

    procedure DesignerUpdate(TheAll: Boolean);
    procedure DoApplyInDesigner;
    procedure DoCreateReport;
    procedure DoDestroyReport;
    function IsDesigning: Boolean;
    function IsLoading: Boolean;
    procedure PaintPage(ACanvas: TCanvas; const APageRect: TRect;
      APageIndex, AZoomFactor: Integer); //; ARenderer: TdxPSReportRenderer);
    function ValidateMargins: Boolean;
    procedure XorAssignedFormats(AItem: TdxAssignedFormatValue; AValue: Boolean);

    procedure DefineStylesClick(Sender: TObject);
    procedure StyleClick(Sender: TObject);
  protected
    FColor: TColor;
    FFontIndex: Integer;

    procedure AssignTo(Dest: TPersistent); override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure ReadState(Reader: TReader); override;
    procedure SetName(const NewName: TComponentName); override;
    procedure SetParentComponent(AParent: TComponent); override;

    procedure FontChanged(Sender: TObject);
    procedure LinkModified(Value: Boolean);

    function AddColorToPool(AColor: TColor): Integer;
    function AddFontToPool(AFont: TFont): Integer;
    procedure AddStandardDelimiters(AReportCells: TdxReportCells;
      AHorzDelimiters, AVertDelimiters: TList);
    function BrushNeeded(AColor: TColor): HBRUSH;
    procedure CalcRenderInfos;
    procedure ClearGDIPools;
    procedure ConvertRects;
    function GetRendererClass: TdxPSReportRendererClass;
    function IsEntirePageCustomDrawn: Boolean;
    function IsHeaderOrFooterCustomDrawn(AHFObject: TCustomdxPageObject): Boolean;
    function IsTitleCustomDrawn: Boolean;
    function NeedCalcEmptyPages: Boolean;
    function PageReady(APageIndex: Integer): Boolean; {obsolete: always returns True}
    procedure PrepareFonts(UPI: Integer);
    procedure PrepareLongOperation;
    procedure UnprepareLongOperation;

    { properties read/write virtual methods }
    function GetRealScaleFactor: Integer; virtual;
    procedure SetActive(Value: Boolean); virtual;
    procedure SetColor(Value: TColor); virtual;
    procedure SetComponent(Value: TComponent); virtual;
    procedure SetFont(Value: TFont); virtual;
    procedure SetTransparent(Value: Boolean); virtual;

    { basic virtual methods }
    procedure AfterPrinting; virtual;
    procedure BeforePrinting; virtual;
    procedure ConstructReport(AReportCells: TdxReportCells); virtual;
    procedure CustomDraw(AItem: TAbstractdxReportCellData; ACanvas: TCanvas;
      ABoundsRect, AClientRect: TRect; var ADone: Boolean); virtual;
    function DataProviderPresent: Boolean; virtual;
    function DoGetRendererClass: TdxPSReportRendererClass; virtual;
    function GetEmptyPagesCanExist: Boolean; virtual;
    function GetRenderInfoClass: TdxPSReportRenderInfoClass; virtual;
    function GetReportHeight: Integer; virtual;
    function GetReportWidth: Integer; virtual;
    procedure InternalRestoreDefaults; virtual;
    procedure InternalRestoreFromOriginal; virtual;
    function IsDrawFootersOnEveryPage: Boolean; virtual;
    function IsDrawHeadersOnEveryPage: Boolean; virtual;
    function IsSupportedCustomDraw(Item: TAbstractdxReportCellData): Boolean; virtual;
    procedure MakeDelimiters(AReportCells: TdxReportCells; AHorzDelimiters, AVertDelimiters: TList); virtual;
    procedure PageParamsChange(Sender: TdxPrinterPage; AStyle: TBasedxPrintStyle;
      AUpdateCodes: TdxPrinterPageUpdateCodes); virtual;
    function SupportsTitle: Boolean; virtual;

    procedure DoChangeComponent; dynamic;
    procedure DoCustomDrawEntirePage(ACanvas: TCanvas; R: TRect; ARealPageIndex: Integer); virtual;
    procedure DoCustomDrawPageHeaderOrFooter(AHFObject: TCustomdxPageObject;
      ACanvas: TCanvas; APageIndex: Integer; R: TRect;
      var ADefaultDrawText, ADefaultDrawBackground: Boolean); virtual;
    procedure DoCustomDrawPageTitle(ACanvas: TCanvas; R: TRect;
      var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY;
      var AColor: TColor; AFont: TFont; var ADone: Boolean); virtual;
    procedure DoDestroy; dynamic;
    procedure DoMeasureReportLinkTitle(var AHeight: Integer); virtual;
    procedure DoProgress(const PercentDone: Double); dynamic;
    function IsSupportedStyle(APrintStyle: TBasedxPrintStyle): Boolean; virtual;

    property BrushPool: TdxPSReportBrushPool read GetBrushPool;
    property Color: TColor read FColor write SetColor
      default clWhite;
    property Font: TFont read FFont write SetFont;
    property FontPool: TdxPSReportFontPool read GetFontPool;
    property FootersOnEveryPage: Boolean read FFootersOnEveryPage write FFootersOnEveryPage
      default False;
    property HeadersOnEveryPage: Boolean read FHeadersOnEveryPage write FHeadersOnEveryPage
      default False;
    property Renderer: TdxPSReportRenderer read GetRenderer;
    property RendererClass: TdxPSReportRendererClass read GetRendererClass;
    property RenderInfo: TdxPSReportRenderInfo read GetRenderInfo;
    property ScaleFonts: Boolean read FScaleFonts write FScaleFonts
      default True;
    property Transparent: Boolean read FTransparent write SetTransparent
      default True;
    property UseHorzDelimiters: Boolean read FUseHorzDelimiters write SetUseHorzDelimiters
      default True;
    property UseVertDelimiters: Boolean read FUseVertDelimiters write SetUseVertDelimiters
      default True;
    property VirtualPageCount: Integer read GetVirtualPageCount;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
   {$IFDEF DELPHI4}
    procedure BeforeDestruction; override;
   {$ENDIF}
    procedure DefaultHandler(var message); override;
    function GetParentComponent: TComponent; override;
    function HasParent: Boolean; override;

    procedure BuildPageSetupMenu(ARootItem: TComponent; AData: Pointer;
      AIncludeDefineItem: Boolean{$IFDEF DELPHI4} = True{$ENDIF});
    function CheckToDesign: Boolean;
    function DefaultDateFormat: Integer;
    function DefaultPageNumberFormat: TdxPageNumberFormat;
    function DefaultTimeFormat: Integer;
    procedure DefinePrintStylesDlg;
    function DesignerExists(AComponentClass: TComponentClass): Boolean; virtual;
    function DesignReport: Boolean;
    procedure DestroyReport; virtual;
    procedure GetFilteredStyles(AStrings: TStrings);
    procedure GetPageColRowCount(var APageColCount, APageRowCount: Integer); virtual;
    class procedure GetSupportedComponentList(AList: TList);
    function IsEmptyPage(AVirtualPageIndex: Integer): Boolean;
    function IsEmptyReport: Boolean; virtual;
    class function IsSupportedCompClass(AComponentClass: TComponentClass): Boolean;
    class function LinkClass: TdxReportLinkClass;
    function PageSetup: Boolean;
    function PageSetupEx(AActivePageIndex: Integer;
      APreviewBtnClicked, APrintBtnClicked: PBoolean): Boolean;
    procedure Preview(Modal: Boolean{$IFDEF DELPHI4} = True{$ENDIF});
    function Print(AShowDialog: Boolean; APrintDlgData: PdxPrintDlgData): Boolean;
    procedure PrintEx(APageNums: TdxPageNumbers; ACopies: Integer; ACollate: Boolean);
    procedure PrintPages(const APageIndexes: array of Integer);
    procedure PrintPagesEx(const APageIndexes: array of Integer;
      APageNums: TdxPageNumbers; ACopies: Integer; ACollate: Boolean);
    procedure RebuildReport; virtual;
    procedure RestoreDefaults; virtual;
    procedure RestoreFromOriginal; virtual;
    function ShowDateTimeFormatsDlg: Boolean;
    function ShowPageNumberFormatsDlg: Boolean;
    function ShowTitlePropertiesDlg: Boolean;
    function UsingShrinkToPageWidthMode: Boolean;

    procedure SaveToRegistry(const APath: string);
    procedure LoadFromRegistry(const APath: string);

    procedure DrawPageHeader(APageIndex: Integer; ARect: TRect;
      ATitleParts: TdxPageTitleParts; ADrawBackground: Boolean);
    procedure DrawPageFooter(APageIndex: Integer; ARect: TRect;
      ATitleParts: TdxPageTitleParts; ADrawBackground: Boolean);

    procedure DrawCheckBox(Canvas: TCanvas; var R: TRect; Checked, Enabled, FlatBorder: Boolean);
    procedure DrawEdge(Canvas: TCanvas; var R: TRect; EdgeMode: TdxCellEdgeMode;
      InnerEdge, OuterEdge: TdxCellEdgeStyle;
      Sides: TdxCellSides{$IFDEF DELPHI4} = [csLeft..csBottom]{$ENDIF});
    procedure DrawGraphic(Canvas: TCanvas; var R: TRect; const ClipRect: TRect;
      ImageList: {$IFDEF DELPHI4}TCustomImageList{$ELSE}TImageList{$ENDIF};
      ImageIndex: Integer; Graphic: TGraphic; GraphicTransparent,
      Transparent: Boolean; BkColor: TColor);
    procedure DrawSortMark(Canvas: TCanvas; var R: TRect;
      SortOrder: TdxCellSortOrder; Mono: Boolean);
    procedure DrawText(Canvas: TCanvas; var R: TRect; AIndent: Integer;
      const Text: string; Font: TFont; BkColor: TColor; TextAlignX: TdxTextAlignX;
      TextAlignY: TdxTextAlignY; FillBackground, Multiline, EndEllipsis: Boolean);

    { for internal use only }
    function VirtualPageIndexToRealPageIndex(APageIndex: Integer): Integer;
    function RealPageIndexToVirtualPageIndex(APageIndex: Integer;
      ATakeIntoAccountEmptyPages: Boolean): Integer;

    property ComponentPrinter: TCustomdxComponentPrinter read FComponentPrinter  write SetComponentPrinter;
    property CurrentPage: Integer read FCurrentPage write SetCurrentPage;
    property CurrentPrintStyle: TBasedxPrintStyle read GetCurrentPrintStyle;
    property Data: Pointer read FData write FData;
    property EmptyPagesCanExist: Boolean read GetEmptyPagesCanExist;
    property PageCount: Integer read GetPageCount;
    property RealPrinterPage: TdxPrinterPage read GetRealPrinterPage write SetRealPrinterPage;
    property RealScaleFactor: Integer read GetRealScaleFactor;
    property RebuildNeeded: Boolean read FRebuildNeeded;
    property ReportHeight: Integer read GetReportHeight;
    property ReportWidth: Integer read GetReportWidth;
    property ShowEmptyPages: Boolean read FShowEmptyPages write SetShowEmptyPages  default False;
    property VisiblePageCount: Integer read GetVisiblePageCount;
  published
    property Active: Boolean read FActive write SetActive default False;
    property Component: TComponent read FComponent write SetComponent;
    property DateFormat: Integer read GetDateFormat write SetDateFormat stored IsDateFormatStored default 0;
    property DateTime: TDateTime read FDateTime write SetDateTime;
    property DesignerCaption: string read FDesignerCaption write FDesignerCaption stored IsDesignerCaptionStored;
    property DesignerHelpContext: THelpContext read FDesignerHelpContext write FDesignerHelpContext;
    property Index: Integer read GetIndex write SetIndex stored False;
    property IsCurrentLink: Boolean read GetIsCurrentLink write SetIsCurrentLink stored False;
    property PageNumberFormat: TdxPageNumberFormat read GetPageNumberFormat write SetPageNumberFormat stored IsPageNumberFormatStored;
    property PrinterPage: TdxPrinterPage read FPrinterPage write SetPrinterPage;
    property ReportTitle: TdxReportTitle read FReportTitle write SetReportTitle;
    property ReportTitleMode: TdxReportTitleMode read GetReportTitleMode write SetReportTitleMode stored False default tmOnEveryTopPage;
    property ReportTitleText: string read GetReportTitleText write SetReportTitleText stored False;
    property ShowDesigner: Boolean read FShowDesigner write FShowDesigner stored False;
    property ShowPageFooter: Boolean read FShowPageFooter write SetShowPageFooter default True;
    property ShowPageHeader: Boolean read FShowPageHeader write SetShowPageHeader default True;
    property ShrinkToPageWidth: Boolean read GetShrinkToPageWidth write SetShrinkToPageWidth default False;
    property StartPageIndex: Integer read FStartPageIndex write SetStartPageIndex  default 1;
    property StyleManager: TdxPrintStyleManager read FStyleManager write SetStyleManager;
    property TimeFormat: Integer read GetTimeFormat write SetTimeFormat stored IsTimeFormatStored default 0;
    property AssignedFormatValues: TdxAssignedFormatValues read FAssignedFormatValues write SetAssignedFormatValues default [];

    property OnChangeComponent: TNotifyEvent read FOnChangeComponent write FOnChangeComponent;
    property OnCustomDrawPageFooter: TdxCustomDrawReportLinkHFEvent read FOnCustomDrawPageFooter write FOnCustomDrawPageFooter;
    property OnCustomDrawPageHeader: TdxCustomDrawReportLinkHFEvent read FOnCustomDrawPageHeader write FOnCustomDrawPageHeader;
    property OnCustomDrawReportLinkTitle: TdxCustomDrawReportLinkTitleEvent read FOnCustomDrawReportLinkTitle write FOnCustomDrawReportLinkTitle;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnFilterStyle: TdxFilterStyleEvent read FOnFilterStyle write FOnFilterStyle;
    property OnMeasureReportLinkTitle: TdxMeasureReportLinkTitleEvent read FOnMeasureReportLinkTitle write FOnMeasureReportLinkTitle;
  end;


  TAbstractdxReportLinkDesignWindow = class(TCustomdxPSForm)
  private
    FApplyed: Boolean;
    FAtLeastOneTimeApplyed: Boolean;
    FModified: Boolean;
    FReportLink: TBasedxReportLink;
    FUpdateControlsCount: Integer;

    function GetComponent: TComponent;
    function IsCaptionStored: Boolean;
    procedure SetAtLeastOneTimeApplyed(Value: Boolean);
    procedure SetModified(Value: Boolean); virtual;

    procedure ApplyClick(Sender: TObject);
    procedure RestoreDefaultsClick(Sender: TObject);
    procedure RestoreOriginalClick(Sender: TObject);
    procedure TitlePropertiesClick(Sender: TObject);

    procedure DoApply;
    function CanApply: Boolean;
    procedure CreateStdButtons;
    procedure Initialize;
    procedure RegroupStdButtons;
    procedure WMHelp(var message: TWMHelp); message WM_HELP;
  protected
    procedure CreateWnd; override;

    procedure DoInitialize; virtual;
    procedure LoadStrings; virtual;
    procedure PaintPreview(ACanvas: TCanvas; R: TRect); virtual;
    procedure UpdateControlsState; virtual;
    procedure UpdatePreview; virtual;

    property Applyed: Boolean read FApplyed write FApplyed;
    property AtLeastOneTimeApplyed: Boolean read FAtLeastOneTimeApplyed write SetAtLeastOneTimeApplyed;
    property Component: TComponent read GetComponent;
    property ReportLink: TBasedxReportLink read FReportLink write FReportLink;
    property UpdateControlsCount: Integer read FUpdateControlsCount;
  public
    constructor Create(AOwner: TComponent); override;

    procedure BeginUpdateControls; virtual;
    function LockControlsUpdate: Boolean;
    procedure EndUpdateControls; virtual;
    function Execute: Boolean;

    property Modified: Boolean read FModified write SetModified;
  published
    btnApply: TButton;
    btnCancel: TButton;
    btnHelp: TButton;
    btnOK: TButton;
    btnRestoreDefaults: TButton;
    btnRestoreOriginal: TButton;
    btnTitleProperties: TButton;
    property Caption stored IsCaptionStored;
  end;


  TdxPSPrintStyle = class(TBasedxPrintStyle)
  private
    FOnAfterGenerating: TNotifyEvent;
    FOnAfterPrinting: TNotifyEvent;
    FOnBeforeGenerating: TNotifyEvent;
    FOnBeforePrinting: TNotifyEvent;

    procedure AfterGenerating;
    procedure BeforeGenerating;
  protected
    procedure AddStdHFFunctions; virtual;
    procedure DoAfterGenerating; virtual;
    procedure DoAfterPrinting; override;
    procedure DoBeforeGenerating; virtual;
    procedure DoBeforePrinting; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property OnAfterGenerating: TNotifyEvent read FOnAfterGenerating write FOnAfterGenerating;
    property OnAfterPrinting: TNotifyEvent read FOnAfterPrinting write FOnAfterPrinting;
    property OnBeforeGenerating: TNotifyEvent read FOnBeforeGenerating write FOnBeforeGenerating;
    property OnBeforePrinting: TNotifyEvent read FOnBeforePrinting write FOnBeforePrinting;
  end;


  TdxPreviewEnableOption = (peoCanChangeMargins, peoHelp, peoPageBackground, 
    peoPageSetup, peoPreferences, peoPrint, peoReportDesign);
  TdxPreviewEnableOptions = set of TdxPreviewEnableOption;
  PdxPreviewEnableOptions = ^TdxPreviewEnableOptions;

  TdxPreviewVisibleOption = (pvoHelp, pvoPageBackground, pvoPageSetup, 
    pvoPreferences, pvoPrint, pvoReportDesign, pvoPrintStyles);
  TdxPreviewVisibleOptions = set of TdxPreviewVisibleOption;
  PdxPreviewVisibleOptions = ^TdxPreviewVisibleOptions;

  TBasedxPreviewWindow = class(TCustomdxPSForm)
  protected
    function GetActivePageIndex: Integer; virtual; abstract;
    function GetBackground: TdxBackground; virtual; abstract;
    function GetComponentPrinter: TCustomdxComponentPrinter; virtual; abstract;
    function GetPageCount: Integer; virtual; abstract;
    function GetPreviewEnableOptions: TdxPreviewEnableOptions; virtual; abstract;
    function GetPreviewVisibleOptions: TdxPreviewVisibleOptions; virtual; abstract;
    function GetSaveZoomPosition: Boolean; virtual; abstract;
    function GetVisiblePageSize: TPoint; virtual; abstract;
    function GetZoomFactor: Integer; virtual; abstract;

    procedure SetActivePageIndex(Value: Integer); virtual; abstract;
    procedure SetBackground(const Value: TdxBackground); virtual; abstract;
    procedure SetComponentPrinter(const Value: TCustomdxComponentPrinter); virtual; abstract;
    procedure SetPageCount(Value: Integer); virtual; abstract;
    procedure SetPreviewEnableOptions(const Value: TdxPreviewEnableOptions); virtual; abstract;
    procedure SetPreviewVisibleOptions(const Value: TdxPreviewVisibleOptions); virtual; abstract;
    procedure SetSaveZoomPosition(Value: Boolean); virtual; abstract;
    procedure SetZoomFactor(Value: Integer); virtual; abstract;

    procedure BeginUpdate; virtual;
    procedure CancelUpdate; virtual;
    procedure EndUpdate; virtual;
    function Locked: Boolean; virtual;
    procedure PaintPage(Sender: TObject; ACanvas: TCanvas; ARect: TRect; APageIndex: Integer); virtual;
  public
    destructor Destroy; override;

    procedure GoToFirstPage; virtual; abstract;
    procedure GoToLastPage; virtual; abstract;
    procedure GoToNextPage; virtual; abstract;
    procedure GoToPrevPage; virtual; abstract;

    procedure InitContent; virtual;
    procedure InvalidateContent; virtual;
    procedure InvalidatePage(APageIndex: Integer); virtual;
    procedure InvalidateAllPages; virtual;
    procedure InvalidatePagesContent; virtual;
    procedure InvalidatePagesHeaderContent; virtual;
    procedure InvalidatePagesFooterContent; virtual;
    procedure UpdateControls; virtual;

    property ActivePageIndex: Integer read GetActivePageIndex write SetActivePageIndex;
    property Background: TdxBackground read GetBackground write SetBackground;
    property EnableOptions: TdxPreviewEnableOptions read GetPreviewEnableOptions write SetPreviewEnableOptions;
    property PageCount: Integer read GetPageCount write SetPageCount;
    property SaveZoomPosition: Boolean read GetSaveZoomPosition write SetSaveZoomPosition;
    property VisibleOptions: TdxPreviewVisibleOptions read GetPreviewVisibleOptions write SetPreviewVisibleOptions;
    property VisiblePageSize: TPoint read GetVisiblePageSize;
    property ZoomFactor: Integer read GetZoomFactor write SetZoomFactor;
  end;


  TdxReportItem = class(TPersistent)
  private
    FData: Integer;
    FParent: TdxReportCell;

    function GetIndex: Integer;
    function GetReportCells: TdxReportCells; virtual;
    procedure SetIndex(Value: Integer);
    procedure SetParent(Value: TdxReportCell);

    procedure FixParentProps; virtual; abstract;
  protected
    function AsCell: TdxReportCell;
    class function IsCell: Boolean; virtual;
  public
    constructor Create(AParent: TdxReportCell); virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    function Clone(AParent: TdxReportCell): TdxReportItem;
    function GetNextSibling: TdxReportItem; //virtual; abstract; {$IFDEF DELPHI4} reintroduce; {$ENDIF}
    function GetPrevSibling: TdxReportItem; //virtual; abstract; {$IFDEF DELPHI4} reintroduce; {$ENDIF}
    function HasParent: Boolean;
    function IsFirstItem: Boolean;
    function IsLastItem: Boolean;
    class function ReportItemClass: TdxReportItemClass;

    property Data: Integer read FData write FData;
    property Index: Integer read GetIndex write SetIndex;
    property Parent: TdxReportCell read FParent write SetParent;
    property ReportCells: TdxReportCells read GetReportCells;
  end;


  TdxReportVisualItem = class(TdxReportItem)
  private
    FBoundsRect: TRect;
    FColor: TColor;
    FFontIndex: Integer;
    FFormat: Integer;

    function GetAbsoluteOrigin: TPoint;
    function GetAbsoluteRect: TRect;
    function GetCellSides: TdxCellSides;
    function GetClientRect: TRect;
    function GetColor: TColor;
    function GetEdgeMode: TdxCellEdgeMode;
    function GetEdgeBump: Boolean;
    function GetEdgeEtched: Boolean;
    function GetEdgeRaised: Boolean;
    function GetEdgeSunken: Boolean;
    function GetFont: TFont;
    function GetFontIndex: Integer;
    function GetHeight: Integer;
    function GetLeft: Integer;
    function GetInnerEdge: TdxCellEdgeStyle;
    function GetOrigin: TPoint;
    function GetOuterEdge: TdxCellEdgeStyle;
    function GetParentColor: Boolean;
    function GetRenderer: TdxPSReportRenderer;
    function GetTop: Integer;
    function GetTransparent: Boolean;
    function GetUsefulOrigin: TPoint;
    function GetUsefulRect: TRect;
    function GetWidth: Integer;
    procedure SetBoundsRect(const Value: TRect);
    procedure SetCellSides(Value: TdxCellSides);
    procedure SetColor(Value: TColor);
    procedure SetEdgeMode(Value: TdxCellEdgeMode);
    procedure SetEdgeBump(Value: Boolean);
    procedure SetEdgeEtched(Value: Boolean);
    procedure SetEdgeRaised(Value: Boolean);
    procedure SetEdgeSunken(Value: Boolean);
    procedure SetFontIndex(Value: Integer);
    procedure SetFormat(Value: Integer);
    procedure SetHeight(Value: Integer);
    procedure SetInnerEdge(Value: TdxCellEdgeStyle);
    procedure SetLeft(Value: Integer);
    procedure SetOrigin(const Value: TPoint);
    procedure SetOuterEdge(Value: TdxCellEdgeStyle);
    procedure SetParentColor(Value: Boolean);
    procedure SetTop(Value: Integer);
    procedure SetTransparent(Value: Boolean);
    procedure SetWidth(Value: Integer);

    function GetClientRectRelativeTo(const R: TRect): TRect;
    procedure FixParentProps; override;
  protected
    function Is3DEdge: Boolean;
    function IsEdgeDrawn: Boolean; virtual;

    property Format: Integer read FFormat write SetFormat;
    property Renderer: TdxPSReportRenderer read GetRenderer;
  public
    constructor Create(AParent: TdxReportCell); override;
    procedure Assign(Source: TPersistent); override;

    property AbsoluteOrigin: TPoint read GetAbsoluteOrigin;
    property AbsoluteRect: TRect read GetAbsoluteRect;
    property BoundsRect: TRect read FBoundsRect write SetBoundsRect;
    property CellSides: TdxCellSides read GetCellSides write SetCellSides; {csAll}
    property ClientRect: TRect read GetClientRect;
    property Color: TColor read GetColor write SetColor; {clWhite}
    property EdgeBump: Boolean read GetEdgeBump write SetEdgeBump; {RaiseOuter/SunkenInner}
    property EdgeMode: TdxCellEdgeMode read GetEdgeMode write SetEdgeMode; {cemSingle}
    property EdgeEtched: Boolean read GetEdgeEtched write SetEdgeEtched; {SunkenOuter/RaisedInner}
    property EdgeRaised: Boolean read GetEdgeRaised write SetEdgeRaised; {RaisedOuter/RaisedInner}
    property EdgeSunken: Boolean read GetEdgeSunken write SetEdgeSunken; {SunkenOuter/SunkenInner}
    property Font: TFont read GetFont;
    property FontIndex: Integer read GetFontIndex write SetFontIndex;
    property Height: Integer read GetHeight write SetHeight;
    property Left: Integer read GetLeft write SetLeft;
    property InnerEdge: TdxCellEdgeStyle read GetInnerEdge write SetInnerEdge; {cesNone}
    property Origin: TPoint read GetOrigin write SetOrigin;
    property OuterEdge: TdxCellEdgeStyle read GetOuterEdge write SetOuterEdge; {cesNone}
    property ParentColor: Boolean read GetParentColor write SetParentColor; {true}
    property Top: Integer read GetTop write SetTop;
    property Transparent: Boolean read GetTransparent write SetTransparent;
    property UsefulOrigin: TPoint read GetUsefulOrigin;
    property UsefulRect: TRect read GetUsefulRect;
    property Width: Integer read GetWidth write SetWidth;
  end;


  TdxReportCell = class(TdxReportVisualItem)
  private
    FCellList: TList;
    FDataList: TList;
    FReportCells: TdxReportCells;

    function GetAbsoluteIndex: Integer;
    function GetCellCount: Integer;
    function GetCells(index: Integer): TdxReportCell;
    function GetDataItemCount: Integer;
    function GetDataItems(index: Integer): TAbstractdxReportCellData;
    function GetLevel: Integer;
    function GetReportCells: TdxReportCells; override;

    procedure CellListNeeded;
    procedure CellListRelease;
    procedure DataListNeeded;
    procedure DataListRelease;
    procedure InsertCell(AItem: TdxReportCell);
    procedure InsertDataItem(AItem: TdxReportItem);
    procedure InsertItem(AItem: TdxReportItem);
    procedure MoveCell(ACurIndex, ANewIndex: Integer);
    procedure MoveDataItem(ACurIndex, ANewIndex: Integer);
    procedure MoveItem(AItem: TdxReportItem; ACurIndex, ANewIndex: Integer);
    procedure RemoveCell(AItem: TdxReportCell);
    procedure RemoveDataItem(AItem: TdxReportItem);
    procedure RemoveItem(AItem: TdxReportItem);
    procedure FixParentProps; override;
  protected
    procedure DrawContent(DC: HDC; DrawRect: TRect; const OriginRect: TRect);
    class function IsCell: Boolean; override;
  public
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    procedure AllocateSpaceForCells(ACapacity: Integer);
    procedure AllocateSpaceForDatas(ACapacity: Integer);
    function FirstCell: TdxReportCell;
    function HasChildren: Boolean;
    function LastCell: TdxReportCell;
    procedure AddFirst(AItem: TdxReportItem);
    procedure ClearCells;
    procedure ClearDataItems;
    procedure DeleteCell(Index: Integer);
    procedure DeleteDataItem(Index: Integer);
    function IndexOf(AItem: TdxReportItem): Integer;

    property AbsoluteIndex: Integer read GetAbsoluteIndex;
    property CellCount: Integer read GetCellCount;
    property Cells[index: Integer]: TdxReportCell read GetCells; default;
    property DataItemCount: Integer read GetDataItemCount;
    property DataItems[index: Integer]: TAbstractdxReportCellData read GetDataItems;
    property Level: Integer read GetLevel;
  end;


  TdxReportCells = class(TPersistent)
  private
    FBorderColor: TColor;
    FBorderWidth: Integer;
    FCells: TdxReportCell;
    FFooterCells: TdxReportCell;
    FHeaderCells: TdxReportCell;
    FReportLink: TBasedxReportLink;

    function GetBoundsRect: TRect;
    function GetCount: Integer;
    function GetFont: TFont;
    function GetFooterBoundsRect: TRect;
    function GetFooterCellCount: Integer;
    function GetFooterCells: TdxReportCell;
    function GetHeaderBoundsRect: TRect;
    function GetHeaderCellCount: Integer;
    function GetHeaderCells: TdxReportCell;
    function GetRenderer: TdxPSReportRenderer;
    procedure SetBorderColor(Value: TColor);

    procedure CreateFooterCells;
    procedure CreateHeaderCells;
  protected
    function GetItemFont(AItem: TdxReportVisualItem): TFont;
    property Renderer: TdxPSReportRenderer read GetRenderer;
  public
    constructor Create(AReportLink: TBasedxReportLink);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    procedure ClearItems;
    procedure DoProgress(const PercentDone: Double);

    property BorderColor: TColor read FBorderColor write SetBorderColor;
    property BorderWidth: Integer read FBorderWidth write FBorderWidth;
    property BoundsRect: TRect read GetBoundsRect;
    property Cells: TdxReportCell read FCells;
    property Count: Integer read GetCount;
    property Font: TFont read GetFont;
    property FooterBoundsRect: TRect read GetFooterBoundsRect;
    property FooterCellCount: Integer read GetFooterCellCount;
    property FooterCells: TdxReportCell read GetFooterCells;
    property HeaderBoundsRect: TRect read GetHeaderBoundsRect;
    property HeaderCellCount: Integer read GetHeaderCellCount;
    property HeaderCells: TdxReportCell read GetHeaderCells;
    property ReportLink: TBasedxReportLink read FReportLink;
  end;


  TAbstractdxReportCellData = class(TdxReportVisualItem)
  private
    function GetEndEllipsis: Boolean;
    function GetMultiline: Boolean;
    function GetSortOrder: TdxCellSortOrder;
    function GetTextAlignX: TdxTextAlignX;
    function GetTextAlignY: TdxTextAlignY;
    procedure SetEndEllipsis(Value: Boolean);
    procedure SetMultiline(Value: Boolean);
    procedure SetSortOrder(Value: TdxCellSortOrder);
    procedure SetTextAlignX(Value: TdxTextAlignX);
    procedure SetTextAlignY(Value: TdxTextAlignY);
  protected
    procedure DrawContent(DC: HDC; var R: TRect; AClientRect: TRect; var ADone: Boolean); virtual;
    function IsSupportedCustomDraw: Boolean;

    property EndEllipsis: Boolean read GetEndEllipsis write SetEndEllipsis default False;
    property Multiline: Boolean read GetMultiline write SetMultiline default False;
    property SortOrder: TdxCellSortOrder read GetSortOrder write SetSortOrder default csoNone;
    property TextAlignX: TdxTextAlignX read GetTextAlignX write SetTextAlignX default taLeft;
    property TextAlignY: TdxTextAlignY read GetTextAlignY write SetTextAlignY default taCenterY;
  public
    constructor Create(AParent: TdxReportCell); override;

    class function DataType: TdxReportCellDataClass;
  end;


  { cell types }

  TdxReportCellBox = class(TAbstractdxReportCellData)
  protected
    procedure DrawContent(DC: HDC; var R: TRect; AClientRect: TRect; var ADone: Boolean); override;
  end;


  TdxReportCellText = class(TAbstractdxReportCellData)
  private
    FIndent: Integer;
  protected
    procedure DrawContent(DC: HDC; var R: TRect; AClientRect: TRect; var ADone: Boolean); override;
    function GetText: string; virtual; abstract;
    procedure GetTextRect(var R: TRect); virtual;
    procedure SetText(const Value: string); virtual; abstract;

    property Indent: Integer read FIndent write FIndent;
  public
    procedure Assign(Source: TPersistent); override;

    property EndEllipsis;
    property Multiline;
    property SortOrder;
    property Text: string read GetText write SetText;
  end;


  TdxReportCellString = class(TdxReportCellText)
  private
    FText: string;
  protected
    function GetText: string; override;
    procedure SetText(const Value: string); override;
  public
    property Indent;
    property TextAlignX;
    property TextAlignY;
  end;


  TdxReportCellImageContainer = class(TdxReportCellString)
  protected
    procedure DrawContent(DC: HDC; var R: TRect; AClientRect: TRect; var ADone: Boolean); override;
    procedure DrawImage(DC: HDC; var R, FullR: TRect); virtual;
    procedure GetImageRects(var R, FullR: TRect); virtual;
    function IsImageDrawn(ForCalc: Boolean): Boolean; virtual;
  end;


  TdxReportCellCheck = class(TdxReportCellImageContainer)
  private
    function GetChecked: Boolean;
    function GetCheckPos: TdxCellCheckPos;
    function GetEnabled: Boolean;
    function GetFlatBorder: Boolean;
    function GetState: TCheckBoxState;
    procedure SetChecked(Value: Boolean);
    procedure SetCheckPos(Value: TdxCellCheckPos);
    procedure SetEnabled(Value: Boolean);
    procedure SetFlatBorder(Value: Boolean);
  protected
    procedure DrawCheck(DC: HDC; var R, FullR: TRect); virtual;
    procedure DrawImage(DC: HDC; var R, FullR: TRect); override;
    procedure GetImageRects(var R, FullR: TRect); override;
    procedure GetTextRect(var R: TRect); override;
    procedure SetText(const Value: string); override;
  public
    constructor Create(AParent: TdxReportCell); override;

    property Checked: Boolean read GetChecked write SetChecked default False;
    property CheckPos: TdxCellCheckPos read GetCheckPos write SetCheckPos default ccpCenter;
    property State: TCheckBoxState read GetState;
    property Enabled: Boolean read GetEnabled write SetEnabled default True;
    property FlatBorder: Boolean read GetFlatBorder write SetFlatBorder default True;
  end;


  TdxReportCellCheckImage = class(TdxReportCellCheck)
  private
    FImage: TBitmap;
    function GetImage: TBitmap;
    procedure SetImage(Value: TBitmap);
  protected
    procedure DrawCheck(DC: HDC; var R, FullR: TRect); override;
  public
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    property Image: TBitmap read GetImage write SetImage;
  end;


  TdxReportCellCustomImage = class(TdxReportCellImageContainer)
  private
    FImage: TGraphic;
    FImageIndex: Integer;
    FImageList: {$IFDEF DELPHI4}TCustomImageList{$ELSE}TImageList{$ENDIF};

    function GetImageTransparent: Boolean;
    procedure SetImage(Value: TGraphic);
    procedure SetImageTransparent(Value: Boolean);
  protected
    procedure GetImageSize(var W, H: Integer);
    function IsImageDrawn(ForCalc: Boolean): Boolean; override;
  public
    constructor Create(AParent: TdxReportCell); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    function CreateImage(AGraphicClass: TGraphicClass): TGraphic;

    property Image: TGraphic read FImage write SetImage;
    property ImageIndex: Integer read FImageIndex write FImageIndex;
    property ImageList: {$IFDEF DELPHI4}TCustomImageList{$ELSE}TImageList{$ENDIF} read FImageList write FImageList;
    property ImageTransparent: Boolean read GetImageTransparent write SetImageTransparent default True;
  end;


  TdxReportCellImage = class(TdxReportCellCustomImage)
  private
    FImageLayout: TdxImageLayout;
    function GetMakeSpaceForEmptyImage: Boolean;
    procedure SetMakeSpaceForEmptyImage(Value: Boolean);
  protected
    procedure DrawImage(DC: HDC; var R, FullR: TRect); override;
    procedure GetImageRects(var R, FullR: TRect); override;
    procedure GetTextRect(var R: TRect); override;
    function IsImageDrawn(ForCalc: Boolean): Boolean; override;
  public
    procedure Assign(Source: TPersistent); override;

    property ImageLayout: TdxImageLayout read FImageLayout write FImageLayout default ilImageLeft;
    property MakeSpaceForEmptyImage: Boolean read GetMakeSpaceForEmptyImage write SetMakeSpaceForEmptyImage default True;
  end;


  TdxReportCellGraphic = class(TdxReportCellCustomImage)
  private
    FDrawMode: TdxGraphicDrawMode;
  protected
    procedure DrawImage(DC: HDC; var R, FullR: TRect); override;
    procedure GetImageRects(var R, FullR: TRect); override;
    procedure GetTextRect(var R: TRect); override;
  public
    procedure Assign(Source: TPersistent); override;

    property DrawMode: TdxGraphicDrawMode read FDrawMode write FDrawMode default gdmNone;
  end;


  TdxPreviewOptions = class(TdxBaseObject)
  private
    FCaption: string;
    FComponentPrinter: TCustomdxComponentPrinter;
    FEnableOptions: TdxPreviewEnableOptions;
    FIcon: TIcon;
    FHelpContext: THelpContext;
    FOriginalIcon: Boolean;
    FRect: TRect;
    FSavePosition: Boolean;
    FSaveZoomPosition: Boolean;
    FWindowState: TWindowState;
    FVisibleOptions: TdxPreviewVisibleOptions;

    function GetHelpFile: string;
    function GetRegistryPath: string;
    function GetPosition(index: Integer): Integer;
    function IsCaptionStored: Boolean;
    function IsIconStored: Boolean;
    procedure SetCaption(const Value: string);
    procedure SetEnableOptions(Value: TdxPreviewEnableOptions);
    procedure SetHelpContext(Value: THelpContext);
    procedure SetHelpFile(const Value: string);
    procedure SetIcon(Value: TIcon);
    procedure SetPosition(Index: Integer; Value: Integer);
    procedure SetRegistryPath(const Value: string);
    procedure SetWindowState(Value: TWindowState);
    procedure SetVisibleOptions(Value: TdxPreviewVisibleOptions);

    function IsAvailablePreviewWindow: Boolean;
    function PreviewWindow: TBasedxPreviewWindow;
    procedure ReadData(Stream: TStream);
    procedure WriteData(Stream: TStream);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure AssignInternal(Source: TPersistent); override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure RestoreOriginalIcon;

    property ComponentPrinter: TCustomdxComponentPrinter read FComponentPrinter;
    property Rect: TRect read FRect write FRect;
  published
    property EnableOptions: TdxPreviewEnableOptions read FEnableOptions write SetEnableOptions
      default [peoCanChangeMargins, peoPageBackground, peoPageSetup, peoPreferences, peoPrint, peoReportDesign];
    property Caption: string read FCaption write SetCaption stored IsCaptionStored;
    property Height: Integer index 0 read GetPosition write SetPosition stored False;
    property HelpFile: string read GetHelpFile write SetHelpFile;
    property HelpContext: THelpContext read FHelpContext write SetHelpContext default 0;
    property Icon: TIcon read FIcon write SetIcon stored IsIconStored;
    property Left: Integer index 1 read GetPosition write SetPosition stored False;
    property RegistryPath: string read GetRegistryPath write SetRegistryPath;
    property SavePosition: Boolean read FSavePosition write FSavePosition stored False default True;
    property SaveZoomPosition: Boolean read FSaveZoomPosition write FSaveZoomPosition default True;
    property Top: Integer index 2 read GetPosition write SetPosition stored False;
    property Width: Integer index 3 read GetPosition write SetPosition stored False;
    property WindowState: TWindowState read FWindowState write SetWindowState default wsNormal;
    property VisibleOptions: TdxPreviewVisibleOptions read FVisibleOptions write SetVisibleOptions
      default [pvoPageSetup, pvoPageBackground, pvoPreferences, pvoPrint, pvoReportDesign, pvoPrintStyles];
  end;


  TdxBeforeDesignReportEvent = procedure(Sender: TObject; AReportLink: TBasedxReportLink;
    ADesignWindow: TAbstractdxReportLinkDesignWindow) of object;
  
  TdxCustomDrawPageEvent = procedure(Sender: TObject; AReportLink: TBasedxReportLink;
    ACanvas: TCanvas; APageIndex: Integer; ARect: TRect; ANom, ADenom: Integer) of object;
    
  TdxCustomDrawReportTitleEvent = procedure(Sender: TObject; AReportLink: TBasedxReportLink;
    ACanvas: TCanvas; ARect: TRect; ANom, ADenom: Integer;
    var TextAlignX: TdxTextAlignX; var TextAlignY: TdxTextAlignY;
    var AColor: TColor; AFont: TFont; var ADone: Boolean) of object;
    
  TdxCustomDrawPageHFEvent = procedure(Sender: TObject; AReportLink: TBasedxReportLink;
    ACanvas: TCanvas; APageIndex: Integer; var ARect: TRect; ANom, ADenom: Integer;
    var ADefaultDrawText, ADefaultDrawBackground: Boolean) of object;

  TdxDesignReportEvent = procedure(Sender: TObject; AReportLink: TBasedxReportLink;
    var ADone: Boolean) of object;

  TdxGenerateReportProgressEvent = procedure(Sender: TObject;
    AReportLink: TBasedxReportLink; APercentDone: Double {mask : '##0.00'}) of object;

  TdxGetPrintTitleEvent = procedure(Sender: TObject; AReportLink: TBasedxReportLink;
    var ATitle: string) of object;

  TdxMeasureReportTitleEvent = procedure(Sender: TObject; AReportLink: TBasedxReportLink;
    var AHeight: Integer) of object;

  TdxNewPageEvent = procedure(Sender: TObject; AReportLink: TBasedxReportLink;
    APageIndex: Integer) of object;

  TdxPageParamsChangedEvent = procedure(Sender: TdxPrinterPage;
    APrintStyle: TBasedxPrintStyle; AUpdateCodes: TdxPrinterPageUpdateCodes) of object;

  TdxPageSetupEvent = procedure(Sender: TObject; AReportLink: TBasedxReportLink;
    ADone: Boolean) of object;

  TdxPreviewEvent = procedure(Sender: TObject; AReportLink: TBasedxReportLink) of object;

  TdxPrintDeviceProblemEvent = procedure(Sender: TObject; var ADone: Boolean) of object;

  TdxReportLinkNotifyEvent = procedure(Sender: TObject; AReportLink: TBasedxReportLink) of object;

  TdxStartPrintEvent = procedure(Sender: TObject; AReportLink: TBasedxReportLink;
    APageCount: Integer) of object;

  TdxCPOption = (cpoAutoRebuildBeforePreview, cpoAutoRebuildBeforePrint,
    cpoGenerateReportProgressEvent, cpoShowHourGlass);
  TdxCPOptions = set of TdxCPOption;
  TdxCPState = (cpsBuilding, cpsDesigning, cpsPreviewing, cpsPrinting, 
    cpsPrintDialog, cpsPageSetupDialog, cpsDefineStylesDialog);
  TdxCPStates = set of TdxCPState;
  TdxPSBuildStage = (bsStart, bsProgress, bsEnd);
  TdxPSPrintStage = (psStart, psProgress, psEnd);


  TCustomdxComponentPrinter = class(TComponent)
  private
    FAbortPrinting: Boolean;
    FAutoUpdateDateTime: Boolean;
    FCurrentLink: TBasedxReportLink;
    FDateFormat: Integer;
    FBeepAfterLongOperations: Boolean;
    FLinkList: TList;
    FLongOperationTime: Integer;
    FOptions: TdxCPOptions;
    FPageNumberFormat: TdxPageNumberFormat;
    FPreviewOptions: TdxPreviewOptions;
    FPreviewWindow: TBasedxPreviewWindow;
    FPreviewWindowDesigner: TAbstractdxPreviewWindowDesigner;
    FPrintFileList: TStrings;
    FPrintTitle: string;
    FReportLinkDesigner: TAbstractdxReportLinkDesigner;
    FState: TdxCPStates;
    FTimeFormat: Integer;

    FOnAddReportLink: TdxReportLinkNotifyEvent;
    FOnAfterPreview: TdxPreviewEvent;
    FOnBeforeDesignReport: TdxBeforeDesignReportEvent;
    FOnBeforePreview: TdxPreviewEvent;
    FOnChangeComponent: TdxReportLinkNotifyEvent;
    FOnChangeCurrentLink: TNotifyEvent;
    FOnCustomDrawPage: TdxCustomDrawPageEvent;
    FOnCustomDrawPageFooter: TdxCustomDrawPageHFEvent;
    FOnCustomDrawPageHeader: TdxCustomDrawPageHFEvent;
    FOnCustomDrawReportTitle: TdxCustomDrawReportTitleEvent;
    FOnDeleteReportLink: TdxReportLinkNotifyEvent;
    FOnDesignReport: TdxDesignReportEvent;
    FOnEndGenerateReport: TdxReportLinkNotifyEvent;
    FOnEndPrint: TdxReportLinkNotifyEvent;
    FOnGenerateReportProgress: TdxGenerateReportProgressEvent;
    FOnGetPrintTitle: TdxGetPrintTitleEvent;
    FOnMeasureReportTitle: TdxMeasureReportTitleEvent;
    FOnNewPage: TdxNewPageEvent;
    FOnPageSetup: TdxPageSetupEvent;
    FOnPrintDeviceBusy: TdxPrintDeviceProblemEvent;
    FOnPrintDeviceError: TdxPrintDeviceProblemEvent;
    FOnStartGenerateReport: TdxReportLinkNotifyEvent;
    FOnStartPrint: TdxStartPrintEvent;

    EndTime, StartTime: DWORD;
    FLongOperationCounter: Integer;
    FModalPreview: Boolean;
    FPrintAll: Boolean;
    FSaveCollate: Boolean;
    FSaveCopies: Integer;
    FSaveCursor: TCursor;
    FSavePageIndex: Integer;
    FSavePrintToFile: Boolean;
    FWindowHandle: hWnd;

    function GetCurrentLinkIndex: Integer;
    function GetLinkCount: Integer;
    function GetReportLink(index: Integer): TBasedxReportLink;
    procedure SetAbortPrinting(Value: Boolean);
    procedure SetAutoUpdateDateTime(Value: Boolean);
    procedure SetCurrentLink(Value: TBasedxReportLink);
    procedure SetCurrentLinkIndex(Value: Integer);
    procedure SetDateFormat(Value: Integer);
    procedure SetLongOperationTime(Value: Integer);
    procedure SetPageNumberFormat(Value: TdxPageNumberFormat);
    procedure SetPreviewAttr(PreviewWindow: TBasedxPreviewWindow);
    procedure SetPreviewOptions(Value: TdxPreviewOptions);
    procedure SetPrintFileList(Value: TStrings);
    procedure SetReportLink(index: Integer; Value: TBasedxReportLink);
    procedure SetTimeFormat(Value: Integer);

    function BeginPrintPages(const Source: string; var APageIndexes: Variant): Pointer;
    procedure EndPrintPages(var APageIndexes: Variant);
    function CreatePreviewWindow(AReportLink: TBasedxReportLink): TBasedxPreviewWindow;
    procedure DestroyPreviewWindow;
    function PrintDialog(AReportLink: TBasedxReportLink;
      PrintDlgData: PdxPrintDlgData): Boolean;
    procedure PrnDlgPageSetup(Sender: TObject; var ADone: Boolean;
      APreviewBtnClicked, APrintBtnClicked: PBoolean);

    procedure RaiseBuildEvent(AReportLink: TBasedxReportLink;
      const APercentCompleted: Double; AStage: TdxPSBuildStage);
    procedure RaisePrintEvent(AReportLink: TBasedxReportLink;
      APageIndex, APageCount: Integer; AStage: TdxPSPrintStage);

    function CheckLink(Value: TBasedxReportLink): TBasedxReportLink;
    function CreateLink(ALinkClass: TdxReportLinkClass;
      AComponent: TComponent; AOwner: TComponent): TBasedxReportLink;
    procedure InsertLink(Value: TBasedxReportLink);
    procedure MoveLink(ACurIndex, ANewIndex: Integer);
    procedure RemoveLink(Value: TBasedxReportLink);
    procedure ResyncCurrentLink(AIndex: Integer);

    procedure DesignerModified;
    procedure DesignerUpdate(AItem: TBasedxReportLink);
    function IsDesigning: Boolean;
    function IsDestroying: Boolean;
    function IsLoading: Boolean;
    class function IsSupportedCompClass(AComponent: TComponent): Boolean;

    procedure WndProc(var message: TMessage);
    procedure ShowExistingPreviewWindow;
  protected
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure SetChildOrder(Child: TComponent; Order: Integer); override;
    procedure SetName(const NewName: TComponentName); override;

    procedure DoAddReportLink(AReportLink: TBasedxReportLink); dynamic;
    procedure DoAfterPreview(AReportLink: TBasedxReportLink); dynamic;
    procedure DoBeforeDesignReport(AReportLink: TBasedxReportLink; 
      ADesignWindow: TAbstractdxReportLinkDesignWindow); dynamic;
    procedure DoBeforePreview(AReportLink: TBasedxReportLink); dynamic;
    procedure DoChangeComponent(AReportLink: TBasedxReportLink); dynamic;
    procedure DoChangeCurrentLink; dynamic;
    procedure DoCustomDrawEntirePage(AReportLink: TBasedxReportLink; ACanvas: TCanvas;
      APageIndex: Integer; ARect: TRect; ANom, ADenom: Integer); virtual;
    procedure DoCustomDrawPageHeaderOrFooter(AReportLink: TBasedxReportLink;
      AHFObject: TCustomdxPageObject; ACanvas: TCanvas; APageIndex: Integer;
      R: TRect; var ADefaultDrawText, ADefaultDrawBackground: Boolean); virtual;
    procedure DoCustomDrawReportTitle(AReportLink: TBasedxReportLink; ACanvas: TCanvas;
      ARect: TRect; var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY;
      var AColor: TColor; AFont: TFont; var ADone: Boolean); virtual;
    procedure DoDeleteReportLink(AReportLink: TBasedxReportLink); dynamic;
    procedure DoDesignReport(AReportLink: TBasedxReportLink; ADone: Boolean); dynamic;
    procedure DoEndPrint(AReportLink: TBasedxReportLink); dynamic;
    procedure DoMeasureReportTitle(AReportLink: TBasedxReportLink; var AHeight: Integer); virtual;
    procedure DoNewPage(AReportLink: TBasedxReportLink; APageIndex: Integer); dynamic;
    procedure DoPageSetup(AReportLink: TBasedxReportLink; ADone: Boolean); dynamic;
    procedure DoPrintDeviceBusy; dynamic;
    procedure DoPrintDeviceError; dynamic;
    procedure DoProgress(AReportLink: TBasedxReportLink; const PercentDone: Double); dynamic;
    procedure DoStartPrint(AReportLink: TBasedxReportLink; FullPageCount: Integer); dynamic;
    procedure DoStartUpdateReport(AReportLink: TBasedxReportLink); dynamic;
    procedure DoEndUpdateReport(AReportLink: TBasedxReportLink); dynamic;
    function GetPrintTitle(AReportLink: TBasedxReportLink): string; dynamic;
    procedure StdProcessPrintDeviceBusy; virtual;
    procedure StdProcessPrintDeviceError; virtual;

    function IsForegroundPreviewWindow: Boolean;
    function IsGenerateReportProgressEvent: Boolean;
    function IsRebuildBeforePreview: Boolean;
    function IsRebuildBeforePrint: Boolean;
    function IsShowHourGlass: Boolean;

    procedure FormatChanged;
    procedure PreparePageSetup;
    procedure PrepareBuildReport(AReportLink: TBasedxReportLink);
    procedure PrepareLongOperation;
    procedure PreparePrintDevice;
    procedure PrepareReport(AReportLink: TBasedxReportLink);
    procedure PrintPage(AReportLink: TBasedxReportLink; APageIndex: Integer); virtual;
    procedure UnprepareBuildReport(AReportLink: TBasedxReportLink);
    procedure UnprepareLongOperation;
    procedure UnpreparePageSetup;
    procedure UnpreparePrintDevice;
    procedure UnprepareReport(AReportLink: TBasedxReportLink);

    property OnAfterPreview: TdxPreviewEvent read FOnAfterPreview  write FOnAfterPreview;
    property OnBeforeDesignReport: TdxBeforeDesignReportEvent read FOnBeforeDesignReport write FOnBeforeDesignReport;
    property OnBeforePreview: TdxPreviewEvent read FOnBeforePreview  write FOnBeforePreview;
    property OnChangeComponent: TdxReportLinkNotifyEvent read FOnChangeComponent write FOnChangeComponent;
    property OnChangeCurrentLink: TNotifyEvent read FOnChangeCurrentLink  write FOnChangeCurrentLink;
    property OnCustomDrawPageHeader: TdxCustomDrawPageHFEvent read FOnCustomDrawPageHeader write FOnCustomDrawPageHeader;
    property OnCustomDrawPageFooter: TdxCustomDrawPageHFEvent read FOnCustomDrawPageFooter write FOnCustomDrawPageFooter;
    property OnCustomDrawReportTitle: TdxCustomDrawReportTitleEvent read FOnCustomDrawReportTitle write FOnCustomDrawReportTitle;
    property OnDesignReport: TdxDesignReportEvent read FOnDesignReport write FOnDesignReport;
    property OnMeasureReportTitle: TdxMeasureReportTitleEvent read FOnMeasureReportTitle write FOnMeasureReportTitle;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function AddEmptyLink(ALinkClass: TdxReportLinkClass): TBasedxReportLink;
    function AddEmptyLinkEx(ALinkClass: TdxReportLinkClass; AOwner: TComponent): TBasedxReportLink;
    function AddLink(AComponent: TComponent): TBasedxReportLink;
    function AddLinkEx(AComponent: TComponent; AOwner: TComponent): TBasedxReportLink;
    procedure AssignReportLinks(Source: TCustomdxComponentPrinter);
    procedure DeleteAllLinks;
    procedure DeleteLink(AIndex: Integer);
    function FindLinkByComponent(Value: TComponent): TBasedxReportLink;
    class function GetNewLinkName(AReportLink: TBasedxReportLink): string;
    function IndexOfLink(AReportLink: TBasedxReportLink): Integer; {$IFDEF DELPHI4} overload; {$ENDIF}
   {$IFDEF DELPHI4}
    function IndexOfLink(const AName: string): Integer; overload;
   {$ENDIF}
    function IndexOfLinkByName(const AName: string): Integer;
    function LinkByName(const AName: string): TBasedxReportLink;

    function DesignerExists(AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF}): Boolean;
    function DesignReport(AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF}): Boolean;
    procedure DestroyReport(AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
    procedure DrawPageFooter(AReportLink: TBasedxReportLink; APageIndex: Integer;
      ARect: TRect; ATitleParts: TdxPageTitleParts; ADrawBackground: Boolean);
    procedure DrawPageHeader(AReportLink: TBasedxReportLink; APageIndex: Integer;
      ARect: TRect; ATitleParts: TdxPageTitleParts; ADrawBackground: Boolean);
    procedure GetPageColRowCount(var ACol, ARow: Integer;
      AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
    function GetPageCount(AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF}): Integer;
    function PageSetup(AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF}): Boolean;
    function PageSetupEx(AActivePageIndex: Integer; APreviewBtnClicked, APrintBtnClicked: PBoolean;
      AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF}): Boolean;
    procedure PaintPage(ACanvas: TCanvas; APageIndex: Integer; const APageRect, AContentRect: TRect;
      AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
    procedure Preview(AModal: Boolean{$IFDEF DELPHI4} = True{$ENDIF};
      AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
    function PreviewExists: Boolean;
    function Print(AShowDialog: Boolean; APrintDlgData: PdxPrintDlgData;
      AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF}): Boolean;
    procedure PrintEx(APageNums: TdxPageNumbers; ACopies: Integer;
      ACollate: Boolean; AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
    procedure PrintPages(const APageIndexes: array of Integer;
      AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
    procedure PrintPagesEx(const APageIndexes: array of Integer;
      APageNums: TdxPageNumbers; ACopies: Integer;
      ACollate: Boolean; AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
    procedure RebuildReport(AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});

    property AbortPrinting: Boolean read FAbortPrinting write SetAbortPrinting;
    property AutoUpdateDateTime: Boolean read FAutoUpdateDateTime write SetAutoUpdateDateTime default True;
    property BeepAfterLongOperations: Boolean read FBeepAfterLongOperations write FBeepAfterLongOperations default True;
    property CurrentLink: TBasedxReportLink read FCurrentLink write SetCurrentLink;
    property CurrentLinkIndex: Integer read GetCurrentLinkIndex write SetCurrentLinkIndex;
    property DateFormat: Integer read FDateFormat write SetDateFormat default 0;
    property LinkCount: Integer read GetLinkCount;
    property LongOperationTime: Integer read FLongOperationTime write SetLongOperationTime default 5000; {ms}
    property Options: TdxCPOptions read FOptions write FOptions
      default [Low(TdxCPOption)..High(TdxCPOption)]; {dxDefaultCPOptions}
    property PageNumberFormat: TdxPageNumberFormat read FPageNumberFormat write SetPageNumberFormat  default pnfNumeral;
    property PreviewOptions: TdxPreviewOptions read FPreviewOptions write SetPreviewOptions;
    property PreviewWindow: TBasedxPreviewWindow read FPreviewWindow;
    property PrintFileList: TStrings read FPrintFileList write SetPrintFileList;
    property PrintTitle: string read FPrintTitle write FPrintTitle;
    property ReportLink[Index: Integer]: TBasedxReportLink read GetReportLink write SetReportLink;
    property State: TdxCPStates read FState;  
    property TimeFormat: Integer read FTimeFormat write SetTimeFormat default 0;

    property PreviewWindowDesigner: TAbstractdxPreviewWindowDesigner read FPreviewWindowDesigner;
    property ReportLinkDesigner: TAbstractdxReportLinkDesigner read FReportLinkDesigner;

    property OnAddReportLink: TdxReportLinkNotifyEvent read FOnAddReportLink write FOnAddReportLink;
    property OnCustomDrawPage: TdxCustomDrawPageEvent read FOnCustomDrawPage write FOnCustomDrawPage;
    property OnDeleteReportLink: TdxReportLinkNotifyEvent read FOnDeleteReportLink write FOnDeleteReportLink;
    property OnEndGenerateReport: TdxReportLinkNotifyEvent read FOnEndGenerateReport write FOnEndGenerateReport;
    property OnEndPrint: TdxReportLinkNotifyEvent read FOnEndPrint write FOnEndPrint;
    property OnGenerateReportProgress: TdxGenerateReportProgressEvent read FOnGenerateReportProgress write FOnGenerateReportProgress;
    property OnGetPrintTitle: TdxGetPrintTitleEvent read FOnGetPrintTitle write FOnGetPrintTitle;
    property OnNewPage: TdxNewPageEvent read FOnNewPage write FOnNewPage;
    property OnPageSetup: TdxPageSetupEvent read FOnPageSetup write FOnPageSetup;
    property OnPrintDeviceBusy: TdxPrintDeviceProblemEvent read FOnPrintDeviceBusy write FOnPrintDeviceBusy;
    property OnPrintDeviceError: TdxPrintDeviceProblemEvent read FOnPrintDeviceError write FOnPrintDeviceError;
    property OnStartGenerateReport: TdxReportLinkNotifyEvent read FOnStartGenerateReport write FOnStartGenerateReport;
    property OnStartPrint: TdxStartPrintEvent read FOnStartPrint write FOnStartPrint;
  end;


  TdxEnumPagesAsImagesProc = procedure(AComponentPrinter: TCustomdxComponentPrinter;
    AReportLink: TBasedxReportLink; AIndex, APageIndex: Integer;
    const AGraphic: TGraphic; AData: Pointer; var AContinue: Boolean) of object;

  TdxExportProgressEvent = procedure(Sender: TCustomdxComponentPrinter;
    AReportLink: TBasedxReportLink; APageCount, AIndex, APageIndex: Integer;
    AData: Pointer) of object;

  TdxExportPrepareGraphicEvent = procedure(Sender: TCustomdxComponentPrinter;
    AReportLink: TBasedxReportLink; const AGraphic: TGraphic;
    AData: Pointer) of object;

  TdxExportGetPageFileNameEvent = procedure(Sender: TCustomdxComponentPrinter;
    AIndex, APageIndex: Integer; var AFileName: string) of object;

  TdxComponentPrinter = class(TCustomdxComponentPrinter)
  private
    FOverWriteAll: Boolean;
    FOverWriteExistingFiles: Boolean;
    FOverWriteFile: Boolean;

    FOnExportGetPageFileName: TdxExportGetPageFileNameEvent;
    FOnExportPrepareGraphic: TdxExportPrepareGraphicEvent;
    FOnExportProgress: TdxExportProgressEvent;

    procedure WritePageAsImageToDisk(AComponentPrinter: TCustomdxComponentPrinter;
      AReportLink: TBasedxReportLink; AIndex, APageIndex: Integer;
      const AGraphic: TGraphic; AData: Pointer; var AContinue: Boolean);
  protected
    procedure Loaded; override;
    procedure GetDefaultExportPageFileName(AIndex, APageIndex: Integer; var AFileName: string); dynamic;
    procedure GetExportPageFileName(AIndex, APageIndex: Integer; var AFileName: string); dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure LoadFromRegistry(const APath: string);
    procedure SaveToRegistry(const APath: string);

    procedure EnumPagesAsImages(const APageIndexes: array of Integer;
      AGraphicClass: TGraphicClass; ADrawBackground: Boolean;
      ACallBackProc: TdxEnumPagesAsImagesProc; ACallBackData, AProgressData,
      APrepareData: Pointer; AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
    procedure SavePagesAsImagesToDisk(const APageIndexes: array of Integer;
      AGraphicClass: TGraphicClass; ADrawBackground: Boolean; const AFileMask: string;
      AProgressData, APrepareData: Pointer;
      AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});

    property ReportLink; default;
  published
    property AutoUpdateDateTime;
    property BeepAfterLongOperations;
    property CurrentLink;
    property DateFormat;
    property LongOperationTime;
    property Options;
    property OverWriteExistingFiles: Boolean read FOverWriteExistingFiles write FOverWriteExistingFiles default False;
    property PageNumberFormat;
    property PreviewOptions;
    property PrintTitle;
    property TimeFormat;

    property OnAfterPreview;
    property OnBeforeDesignReport;
    property OnBeforePreview;
    property OnChangeComponent;
    property OnChangeCurrentLink;
    property OnCustomDrawPage;
    property OnCustomDrawPageFooter;
    property OnCustomDrawPageHeader;
    property OnCustomDrawReportTitle;
    property OnDeleteReportLink;
    property OnDesignReport;
    property OnGetPrintTitle;
    property OnEndGenerateReport;
    property OnEndPrint;
    property OnExportGetPageFileName: TdxExportGetPageFileNameEvent read FOnExportGetPageFileName write FOnExportGetPageFileName;
    property OnExportPrepareGraphic: TdxExportPrepareGraphicEvent read FOnExportPrepareGraphic write FOnExportPrepareGraphic;
    property OnExportProgress: TdxExportProgressEvent read FOnExportProgress write FOnExportProgress;
    property OnGenerateReportProgress;
    property OnMeasureReportTitle;
    property OnNewPage;
    property OnPageSetup;
    property OnPrintDeviceBusy;
    property OnPrintDeviceError;
    property OnStartGenerateReport;
    property OnStartPrint;
  end;


  TAbstractdxPreviewWindowDesigner = class(TObject)
  private
    FComponentPrinter: TCustomdxComponentPrinter;
  protected
    procedure Activate; virtual; abstract;
    procedure Modified; virtual; abstract;
  public
    constructor Create(AComponentPrinter: TCustomdxComponentPrinter);
    destructor Destroy; override;

    property ComponentPrinter: TCustomdxComponentPrinter read FComponentPrinter;
  end;


  TAbstractdxReportLinkDesigner = class(TObject)
  private
    FComponentPrinter: TCustomdxComponentPrinter;
  protected
    procedure Modified; virtual; abstract;
    procedure Update(Item: TBasedxReportLink); virtual; abstract;
  public
    constructor Create(AComponentPrinter: TCustomdxComponentPrinter);
    destructor Destroy; override;
    
    procedure BeginUpdate; virtual; abstract;
    procedure CancelUpdate; virtual; abstract;   
    procedure EndUpdate; virtual; abstract;

    property ComponentPrinter: TCustomdxComponentPrinter read FComponentPrinter;
  end;


{ = ========================================================================== }
{ Routine for fast PrintPreview and(or) Printing the individual component      }
{                                                                              }
{ For the correct work of this routine you must add units with links           }
{ that supported a AComponent into the uses section of the current unit        }
{ = ========================================================================== }

function dxPrintComponent(AComponent: TComponent;
  APrintPreview: Boolean{$IFDEF DELPHI4} = True{$ENDIF};
  APrintDialog: Boolean{$IFDEF DELPHI4} = False{$ENDIF};
  const AReportTitle: string{$IFDEF DELPHI4} = ''{$ENDIF};
  const APrintTitle: string{$IFDEF DELPHI4} = ''{$ENDIF}): Boolean;

{ Enum Pages as Images routines }
procedure dxPSEnumReportPages(AComponentPrinter: TdxComponentPrinter;
  AReportLink: TBasedxReportLink; const APageIndexes: array of Integer;
  AGraphicClass: TGraphicClass; AExportBackground: Boolean;
  ACallBackProc: TdxEnumPagesAsImagesProc; ACallBackData: Pointer;
  AProgressProc: TdxExportProgressEvent; AProgressData: Pointer;
  APrepareGraphicProc: TdxExportPrepareGraphicEvent; APrepareData: Pointer);

{ ReportLinks registration routines }
procedure dxPSRegisterReportLink(ALinkClass: TdxReportLinkClass;
  AComponentClass: TComponentClass; ADesignerClass: TdxReportLinkDesignWindowClass);
procedure dxPSUnregisterReportLink(ALinkClass: TdxReportLinkClass;
  AComponentClass: TComponentClass; ADesignerClass: TdxReportLinkDesignWindowClass);
procedure dxPSUnregisterReportLinks(const ALinkClasses: array of TdxReportLinkClass);
procedure dxPSUnregisterReportComponents(const AComponentClasses: array of TComponentClass);
procedure dxPSGetActiveReportLinksList(List: TList);
procedure dxPSGetReportLinksList(List: TList);
procedure dxPSGetSupportedComponentsList(List: TList);
procedure dxPSGetLinkSupportedComponentsList(ALinkClass: TdxReportLinkClass; List: TList);
function dxPSIsSupportedCompClass(AComponentClass: TComponentClass): Boolean;
function dxPSDesignerClassByCompClass(AComponentClass: TComponentClass): TdxReportLinkDesignWindowClass;
function dxPSDesignerClassByLinkClass(ALinkClass: TdxReportLinkClass): TdxReportLinkDesignWindowClass;
function dxPSLinkClassByCompClass(AComponentClass: TComponentClass): TdxReportLinkClass;

{ Preview Window registration routines }
procedure dxPSRegisterPreviewWindow(APreviewWindowClass: TdxPreviewWindowClass);
procedure dxPSUnregisterPreviewWindow(APreviewWindowClass: TdxPreviewWindowClass{$IFDEF DELPHI4} = nil{$ENDIF});

{ Units convertation routines }
function OnePixel: Integer;
function PixelsNumerator: Integer;
function PixelsDenominator: Integer;

const
  csAll = [csLeft..csBottom];
  dxAlignment: array[TdxTextAlignX] of TAlignment = (taLeftJustify, taCenter, taRightJustify);
  dxDrawTextEndEllipsis: array[Boolean] of UINT = (0, DT_END_ELLIPSIS);
  dxDrawTextMultiline: array[Boolean] of UINT = (DT_SINGLELINE, DT_WORDBREAK);
  dxDrawTextTextAlignX: array[TdxTextAlignX] of UINT = (DT_LEFT, DT_CENTER, DT_RIGHT);
  dxDrawTextTextAlignY: array[TdxTextAlignY] of UINT = (DT_TOP, DT_VCENTER, DT_BOTTOM);
  dxImageLayout: array[TAlignment] of TdxImageLayout = (ilImageLeft, ilImageRight, ilImageCenter);
  dxMultilineTextAlignY: array[Boolean] of TdxTextAlignY = (taCenterY, taTop);
  dxTextAlignX: array[TAlignment] of TdxTextAlignX = (taLeft, taRight, taCenterX);
  dxTextAlignY: array[TTextLayout] of TdxTextAlignY = (taTop, taCenterY, taBottom);

  dxDefaultCPOptions =
    [cpoAutoRebuildBeforePreview, cpoAutoRebuildBeforePrint, cpoGenerateReportProgressEvent, cpoShowHourGlass];
  dxDefaultPreviewEnableOptions =
    [peoCanChangeMargins, peoPageBackground, peoPageSetup, peoPreferences, peoPrint, peoReportDesign];
  dxDefaultPreviewVisibleOptions =
    [pvoPageBackground, pvoPageSetup, pvoPreferences, pvoPrint, pvoReportDesign, pvoPrintStyles];
  dxDefaultColor = clWhite;
  dxDefaultFixedColor = clSilver;
  dxDefaultGridLineColor = clBlack;
  dxDefaultCellSizes = csAll;
  dxDefaultCheckFlatBorder = True;
  dxDefaultCheckPos = ccpCenter;
  dxDefaultEndEllipsis = False;
  dxDefaultFixedTransparent = False;
  dxDefaultFont: array[0..LF_FACESIZE - 1] of Char = 'Times New Roman';
  dxDefaultMultiline = False;
  dxDefaultSortOrder = csoNone;
  dxDefaultTextAlignX = taLeft;
  dxDefaultTextAlignY = taCenterY;
  dxDefaultTransparent = True;
  dxDefaultReportTitleFontSize = 14;
  dxTextSpace = 2;

  FSortMarkRgnSize = 16;
  FSortMarkWidth = 8;
  FSortMarkHeight = 7;

implementation

uses
 {$IFDEF DELPHI6}Variants, {$ENDIF} TypInfo, Registry, Dialogs, Consts, CommCtrl,
  dxPSImgs, dxPSRes, dxfmDTFmt, dxfmPNFmt, dxfmChFN, dxPSUtl, dxPrnDev, dxPSEvnt,
  dxPSfmTtl, dxPSPgsMnuBld, dxPSPrVwStd;

function OffsetWindowOrgEx(DC: HDC; X, Y: Integer; P: PPoint): BOOL;
  stdcall; external gdi32 name 'OffsetWindowOrgEx';

type
  TGraphicAccess = class(TGraphic);
  TGraphicClassAccess = class of TGraphicAccess;

  PdxPreviewWindowRegItem = ^TdxPreviewWindowRegItem;
  TdxPreviewWindowRegItem = record
    PreviewWindowClass: TdxPreviewWindowClass;
  end;

  PdxReportLinkRegItem = ^TdxReportLinkRegItem;
  TdxReportLinkRegItem = record
    ComponentClass: TComponentClass;
    DesignerClass: TdxReportLinkDesignWindowClass;
    LinkClass: TdxReportLinkClass;
  end;

  PIntArray = ^TIntArray;
  TIntArray = array[0..0] of Integer;

const
  FLinkList: TList = nil;
  FPreviewWindowList: TList = nil;

  sdxFilePort = 'FILE:';
  sdxPrintDlgFilesRegistryPath = '\PrintDialogFiles';
  sdxReportLinksRegistryPath = '\ReportLinks';
  sdxAssignedDateFormat = 'OwnDateFormat';
  sdxAssignedTimeFormat = 'OwnTimeFormat';
  sdxAssignedPageNumberFormat = 'OwnPageNumberFormat';
  sdxAutoUpdateDateTime = 'AutoUpdateDateTime';
  sdxDateFormat = 'DateFormat';
  sdxPageNumberFormat = 'PageNumberFormat';
  sdxStartPageIndex = 'StartPageIndex';
  sdxTimeFormat = 'TimeFormat';

  FPtPerInch = 72;

var
  FUnitsPerInch: Integer = 9600;

  FHalfLineWidth: Integer;
  FLineWidth: Integer;
  FPixelsDenominator: Integer;
  FPixelsNumerator: Integer;
  FUnitsPerPixel: Integer;

function OnePixel: Integer;
begin
  Result := FPixelsNumerator div FPixelsDenominator;
  if Result = 0 then Result := 1;
end;

function PixelsNumerator: Integer;
begin
  Result := FPixelsNumerator;
end;

function PixelsDenominator: Integer;
begin
  Result := FPixelsDenominator;
end;


{ ReportLinks registration routines }

function FindLinkRegItem(ALinkClass: TdxReportLinkClass; AComponentClass: TComponentClass;
  ADesignerClass: TdxReportLinkDesignWindowClass): Integer;
var
  RegItem: PdxReportLinkRegItem;
begin
  Result := -1;
  if FLinkList = nil then Exit;
  for Result := 0 to FLinkList.Count - 1 do
  begin
    RegItem := FLinkList.List^[Result];
    with RegItem^ do
      if (ComponentClass = AComponentClass) and
        (DesignerClass = ADesignerClass) and (LinkClass = ALinkClass) then
        Exit;
  end;
  Result := -1;
end;

procedure dxPSRegisterReportLink(ALinkClass: TdxReportLinkClass; AComponentClass: TComponentClass;
  ADesignerClass: TdxReportLinkDesignWindowClass);
var
  RegItem: PdxReportLinkRegItem;
begin
  if (ALinkClass = nil) or (AComponentClass = nil) then
    Exit;
  if FindLinkRegItem(ALinkClass, AComponentClass, ADesignerClass) <> -1 then
    Exit;
  New(RegItem);
  with RegItem^ do
  begin
    ComponentClass := AComponentClass;
    DesignerClass := ADesignerClass;
    LinkClass := ALinkClass;
  end;
  if FLinkList = nil then
    FLinkList := TList.Create;
  FLinkList.Insert(0, RegItem);
  if GetClass(ALinkClass.ClassName) = nil then
    RegisterClass(ALinkClass);
end;

procedure dxPSUnregisterReportLinks(const ALinkClasses: array of TdxReportLinkClass);
var
  I, J: Integer;
  RegItem: PdxReportLinkRegItem;
begin
  if FLinkList = nil then
    Exit;
  for I := FLinkList.Count - 1 downto 0 do
  begin
    RegItem := FLinkList.List^[I];
    for J := Low(ALinkClasses) to High(ALinkClasses) do
      if ALinkClasses[J] = RegItem^.LinkClass then
      begin
        Dispose(PdxReportLinkRegItem(RegItem));
        FLinkList.Delete(I);
      end;
  end;
  for I := Low(ALinkClasses) to High(ALinkClasses) do
    UnregisterClass(ALinkClasses[I]);
end;

procedure dxPSUnregisterReportComponents(const AComponentClasses: array of TComponentClass);
var
  I, J: Integer;
  RegItem: PdxReportLinkRegItem;
begin
  if FLinkList = nil then
    Exit;
  for I := FLinkList.Count - 1 downto 0 do
  begin
    RegItem := FLinkList.List^[I];
    for J := Low(AComponentClasses) to High(AComponentClasses) do
      if AComponentClasses[J] = RegItem^.ComponentClass then
      begin
        Dispose(PdxReportLinkRegItem(RegItem));
        FLinkList.Delete(J);
      end;
  end;
end;

procedure dxPSUnregisterReportLink(ALinkClass: TdxReportLinkClass;
  AComponentClass: TComponentClass; ADesignerClass: TdxReportLinkDesignWindowClass);
var
  Index: Integer;
begin
  Index := FindLinkRegItem(ALinkClass, AComponentClass, ADesignerClass);
  if Index <> -1 then
  begin
    Dispose(PdxReportLinkRegItem(FLinkList.List[Index]));
    FLinkList.Delete(Index);
  end;
end;

procedure dxPSUnregisterAllReportLinks;
var
  RegItem: PdxReportLinkRegItem;
begin
  if FLinkList = nil then
    Exit;
  while FLinkList.Count > 0 do
  begin
    RegItem := FLinkList.Last;
    with RegItem^ do
      dxPSUnRegisterReportLink(LinkClass, ComponentClass, DesignerClass);
  end;
  FLinkList.Free;
  FLinkList := nil;
end;

function dxPSLinkClassByCompClass(AComponentClass: TComponentClass): TdxReportLinkClass;
var
  I: Integer;
  RegItem: PdxReportLinkRegItem;
begin
  Result := nil;
  if (FLinkList = nil) or (AComponentClass = nil) then
    Exit;
  for I := 0 to FLinkList.Count - 1 do
  begin
    RegItem := FLinkList.List^[I];
    with RegItem^ do
      if AComponentClass.InheritsFrom(ComponentClass) then
      //if (RegItem^.ComponentClass = AComponentClass) then
      begin
        Result := LinkClass;
        if AComponentClass = ComponentClass then Exit;
      end;
  end;
end;

function dxPSDesignerClassByCompClass(AComponentClass: TComponentClass): TdxReportLinkDesignWindowClass;
var
  LinkClass: TdxReportLinkClass;
begin
  LinkClass := dxPSLinkClassByCompClass(AComponentClass);
  Result := dxPSDesignerClassByLinkClass(LinkClass);
end;

function dxPSDesignerClassByLinkClass(ALinkClass: TdxReportLinkClass): TdxReportLinkDesignWindowClass;
var
  I: Integer;
  RegItem: PdxReportLinkRegItem;
begin
  Result := nil;
  if (FLinkList = nil) or (ALinkClass = nil) then
    Exit;
  for I := 0 to FLinkList.Count - 1 do
  begin
    RegItem := FLinkList.List^[I];
    with RegItem^ do
      if LinkClass = ALinkClass then
      begin
        Result := DesignerClass;
        Exit;
      end;
  end;
end;

function dxPSIsSupportedCompClass(AComponentClass: TComponentClass): Boolean;
begin
  Result := dxPSLinkClassByCompClass(AComponentClass) <> nil;
end;

procedure dxPSGetActiveReportLinksList(List: TList);
var
  BufferList: TList;
  I: Integer;
  RegItem: PdxReportLinkRegItem;
  ComponentClass: TComponentClass;
  LinkClass: TdxReportLinkClass;
begin
  if FLinkList = nil then 
    Exit;
  BufferList := TList.Create;
  try
    for I := 0 to FLinkList.Count - 1 do
    begin
      RegItem := FLinkList.List^[I];
      ComponentClass := RegItem^.ComponentClass;
      LinkClass := RegItem^.LinkClass;
      if BufferList.IndexOf(ComponentClass) = -1 then
      begin
        if List.IndexOf(LinkClass) = -1 then List.Add(LinkClass);
        BufferList.Add(ComponentClass);
      end;
    end;
  finally
    BufferList.Free;
  end;
end;

procedure dxPSGetReportLinksList(List: TList);
var
  I: Integer;
  LinkClass: TdxReportLinkClass;
begin
  if FLinkList = nil then
    Exit;
  for I := 0 to FLinkList.Count - 1 do
  begin
    LinkClass := PdxReportLinkRegItem(FLinkList.List[I])^.LinkClass;
    if List.IndexOf(LinkClass) = -1 then
      List.Add(LinkClass);
  end;
end;

procedure dxPSGetSupportedComponentsList(List: TList);
var
  I: Integer;
  ComponentClass: TComponentClass;
begin
  if FLinkList = nil then
    Exit;
  for I := 0 to FLinkList.Count - 1 do
  begin
    ComponentClass := PdxReportLinkRegItem(FLinkList.List[I])^.ComponentClass;
    if List.IndexOf(ComponentClass) = -1 then
      List.Add(ComponentClass);
  end;
end;

procedure dxPSGetLinkSupportedComponentsList(ALinkClass: TdxReportLinkClass; List: TList);
var
  I: Integer;
  ComponentClass: TComponentClass;
  RegItem: PdxReportLinkRegItem;
begin
  if FLinkList = nil then
    Exit;
  for I := 0 to FLinkList.Count - 1 do
  begin
    RegItem := FLinkList.List^[I];
    if ALinkClass = RegItem^.LinkClass then
    begin
      ComponentClass := RegItem^.ComponentClass;
      if List.IndexOf(ComponentClass) = -1 then
        List.Add(ComponentClass);
    end;
  end;
end;


{ Preview window registration }

function GetPreviewClass: TdxPreviewWindowClass;
begin
  Result := nil;
  if (FPreviewWindowList = nil) or (FPreviewWindowList.Count = 0) then
    Exit;
  Result := PdxPreviewWindowRegItem(FPreviewWindowList.Last)^.PreviewWindowClass;
end;

procedure dxPSRegisterPreviewWindow(APreviewWindowClass: TdxPreviewWindowClass);
var
  RegItem: PdxPreviewWindowRegItem;
begin
  New(RegItem);
  RegItem^.PreviewWindowClass := APreviewWindowClass;
  if FPreviewWindowList = nil then
    FPreviewWindowList := TList.Create;
  FPreviewWindowList.Add(RegItem);
end;

procedure dxPSUnregisterPreviewWindow(APreviewWindowClass: TdxPreviewWindowClass{$IFDEF DELPHI4} = nil{$ENDIF});
var
  Index: Integer;
begin
  if FPreviewWindowList = nil then
    Exit;
  if APreviewWindowClass = nil then
    Index := FPreviewWindowList.Count - 1
  else
    Index := FPreviewWindowList.IndexOf(APreviewWindowClass);
  if Index = -1 then
    Exit;

  Dispose(PdxPreviewWindowRegItem(FPreviewWindowList.List^[Index]));
  FPreviewWindowList.Delete(Index);
  if FPreviewWindowList.Count = 0 then
  begin
    FPreviewWindowList.Free;
    FPreviewWindowList := nil
  end;
end;

procedure dxPSUnregisterAllPreviewWindows;
begin
  while FPreviewWindowList <> nil do dxPSUnregisterPreviewWindow(nil);
end;

function dxPrintComponent(AComponent: TComponent;
  APrintPreview: Boolean{$IFDEF DELPHI4} = True{$ENDIF};
  APrintDialog: Boolean{$IFDEF DELPHI4} = False{$ENDIF};
  const AReportTitle: string{$IFDEF DELPHI4} = ''{$ENDIF};
  const APrintTitle: string{$IFDEF DELPHI4} = ''{$ENDIF}): Boolean;
var
  L: TBasedxReportLink;
begin
  try
    with TdxComponentPrinter.Create(nil) do
    try
      PrintTitle := APrintTitle;
      L := AddLink(AComponent);
      Result := Assigned(L);
      if Result then
      try
        L.ReportTitleText := AReportTitle;
        if APrintPreview then
          L.Preview(True)
        else
          L.Print(APrintDialog, nil);
      finally
        L.Free;
      end
    finally
      Free;
    end;
  except
    Result := False;
  end;
end;


{ TdxPSPrintStyle }

constructor TdxPSPrintStyle.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  StyleCaption := sdxStandardStyle;
  StyleGlyph.LoadFromResourceID(hInstance, DXCP_BMPSTANDARDSTYLE);
  AddStdHFFunctions;
end;

procedure TdxPSPrintStyle.AddStdHFFunctions;
var
  Index: Integer;
begin
  if dxHFFunctionLibrary = nil then Exit;
  with PrinterPage.PageFooter do
  begin
    Index := dxHFFunctionLibrary.IndexOfByClass(TdxHFPageNumberFunction);
    if Index > -1 then
      CenterTitle.Text := dxHFFunctionLibrary[Index].TemplateString;
    Index := dxHFFunctionLibrary.IndexOfByClass(TdxHFDateFunction);
    if Index > -1 then
      RightTitle.Text := dxHFFunctionLibrary[Index].TemplateString;
  end;
end;

procedure TdxPSPrintStyle.BeforeGenerating;
begin
  DoBeforeGenerating;
end;

procedure TdxPSPrintStyle.AfterGenerating;
begin
  DoAfterGenerating;
end;

procedure TdxPSPrintStyle.DoBeforeGenerating;
begin
  if Assigned(FOnBeforeGenerating) then FOnBeforeGenerating(Self);
end;

procedure TdxPSPrintStyle.DoBeforePrinting;
begin
  if Assigned(FOnBeforePrinting) then FOnBeforePrinting(Self);
end;

procedure TdxPSPrintStyle.DoAfterGenerating;
begin
  if Assigned(FOnAfterGenerating) then FOnAfterGenerating(Self);
end;

procedure TdxPSPrintStyle.DoAfterPrinting;
begin
  if Assigned(FOnAfterPrinting) then FOnAfterPrinting(Self);
end;


{ TdxReportTitle }

constructor TdxReportTitle.Create(AReportLink: TBasedxReportLink);
begin
  inherited Create;
  FReportLink := AReportLink;
  FFont := TFont.Create;
  DoRestoreDefaults;
  FFont.OnChange := FontChanged;
end;

destructor TdxReportTitle.Destroy;
begin
  FFont.Free;
  inherited Destroy;
end;

procedure TdxReportTitle.Assign(Source: TPersistent);
begin
  if Source is TdxReportTitle then
  begin
    BeginUpdate;
    try
      AdjustOnReportScale := TdxReportTitle(Source).AdjustOnReportScale;
      Color := TdxReportTitle(Source).Color;
      Font := TdxReportTitle(Source).Font;
      Mode := TdxReportTitle(Source).Mode;
      Text := TdxReportTitle(Source).Text;
      TextAlignX := TdxReportTitle(Source).TextAlignX;
      TextAlignY := TdxReportTitle(Source).TextAlignY;
      Transparent := TdxReportTitle(Source).Transparent;
    finally
      EndUpdate;
    end;
  end
  else
    inherited Assign(Source);
end;

procedure TdxReportTitle.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TdxReportTitle.CancelUpdate;
begin
  if FUpdateCount <> 0 then Dec(FUpdateCount);
end;

procedure TdxReportTitle.EndUpdate;
begin
  if FUpdateCount <> 0 then
  begin
    Dec(FUpdateCount);
    CalcRenderInfos;
  end;
end;

procedure TdxReportTitle.RestoreDefaults;
begin
  BeginUpdate;
  try
    DoRestoreDefaults;
  finally
    EndUpdate;
  end;
end;

procedure TdxReportTitle.DoRestoreDefaults;
begin
  FAdjustOnReportScale := False;
  FColor := clWhite;
  FFont.Name := dxDefaultFont;
  FFont.Size := dxDefaultReportTitleFontSize;
  FFont.Style := [fsBold];
  FMode := tmOnEveryTopPage;
  FTextAlignX := taCenterX;
  FTextAlignY := taCenterY;
  FTransparent := True;
end;

procedure TdxReportTitle.SetAdjustOnReportScale(Value: Boolean);
begin
  if FAdjustOnReportScale <> Value then
  begin
    FAdjustOnReportScale := Value;
    CalcRenderInfos;
  end;
end;

procedure TdxReportTitle.SetColor(Value: TColor);
begin
  FColor := Value;
end;

procedure TdxReportTitle.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TdxReportTitle.SetMode(Value: TdxReportTitleMode);
begin
  if FMode <> Value then
  begin
    FMode := Value;
    CalcRenderInfos;
  end;
end;

procedure TdxReportTitle.SetText(const Value: string);
begin
  if AnsiCompareText(FText, Value) <> 0 then
  begin
    FText := Value;
    CalcRenderInfos;
  end;
end;

procedure TdxReportTitle.SetTextAlignX(Value: TdxTextAlignX);
begin
  FTextAlignX := Value;
end;

procedure TdxReportTitle.SetTextAlignY(Value: TdxTextAlignY);
begin
  FTextAlignY := Value;
end;

procedure TdxReportTitle.SetTransparent(Value: Boolean);
begin
  FTransparent := Value;
end;

procedure TdxReportTitle.CalcRenderInfos;
begin
  if (FUpdateCount = 0) and (ReportLink <> nil) then
    FReportLink.CalcRenderInfos;
end;

procedure TdxReportTitle.FontChanged(Sender: TObject);
begin
  CalcRenderInfos;
end;

{ TdxReportLinkPrinterPage }

type
  TdxReportLinkPrinterPage = class(TdxPrinterPage)
  private
    FReportLink: TBasedxReportLink;
  protected
    function GetOwner: TPersistent; override;
    procedure PageParamsChange(AUpdateCodes: TdxPrinterPageUpdateCodes); override;
  end;

function TdxReportLinkPrinterPage.GetOwner: TPersistent;
begin
  Result := FReportLink;
end;

procedure TdxReportLinkPrinterPage.PageParamsChange(AUpdateCodes: TdxPrinterPageUpdateCodes);
begin
  inherited PageParamsChange(AUpdateCodes);
  if UpdateCount = 0 then
    FReportLink.PageParamsChange(Self, nil, AUpdateCodes);
end;


{ TdxPSPageRenderInfo }

constructor TdxPSPageRenderInfo.Create(AReportRenderInfo: TdxPSReportRenderInfo);
begin
  inherited Create;
  FRenderInfo := AReportRenderInfo;
end;

destructor TdxPSPageRenderInfo.Destroy;
begin
  ReallocMem(ContinuedIndexes, 0);
  inherited Destroy;
end;

function TdxPSPageRenderInfo.IsDetailsExists: Boolean;
begin
  Result := not IsRectEmpty(DetailRect);
end;

procedure TdxPSPageRenderInfo.CalcIndexPairs(APageIndex, AStartIndex: Integer);
var
  I, StartIndex, EndIndex, TopSide, CellCount: Integer;
  R, R2: TRect;
  Intersected: Boolean;
  DataExists: Boolean;
begin
  CellCount := ReportLink.FReportCells.Count;
  DataExists := CellCount > 0;

  if DataExists then
    if RenderInfo.EmptyPageCount > 0 then
    begin
      EndIndex := AStartIndex - 1;
      ContinuedIndexPairCount := 0;
      TopSide := DetailRect.Top;
      while (TopSide < DetailRect.Bottom) and (EndIndex < CellCount) do
      begin
        Inc(ContinuedIndexPairCount);
        StartIndex := EndIndex + 1;
        repeat
          R := ReportLink.FReportCells.Cells[StartIndex].GetAbsoluteRect;
          Intersected := IntersectRect(R2, R, DetailRect);
          Inc(StartIndex);
        until (StartIndex = CellCount) or Intersected;
        Dec(StartIndex);
        EndIndex := StartIndex;
        repeat
          R := ReportLink.FReportCells.Cells[EndIndex].GetAbsoluteRect;
          Intersected := IntersectRect(R2, R, DetailRect);
          Inc(EndIndex);
        until (EndIndex = CellCount) or not Intersected;
        Dec(EndIndex);
        if EndIndex <> CellCount - 1 then
          Dec(EndIndex);
        if EndIndex < StartIndex then
          EndIndex := StartIndex;
        TopSide := R.Bottom;
      end
    end
    else
      ContinuedIndexPairCount := 1;

  DataExists := ContinuedIndexPairCount > 0;

  if DataExists then
  begin
    ReallocMem(ContinuedIndexes, ContinuedIndexPairCount * SizeOf(TdxContinuedIndexPair));
    EndIndex := AStartIndex - 1;
    for I := 0 to ContinuedIndexPairCount - 1 do
    begin
      StartIndex := EndIndex + 1;
      repeat
        R := ReportLink.FReportCells.Cells[StartIndex].GetAbsoluteRect;
        Intersected := IntersectRect(R2, R, DetailRect);
        Inc(StartIndex);
      until (StartIndex = CellCount) or Intersected;
      Dec(StartIndex);
      EndIndex := StartIndex;
      // fix 2.1
      Intersected := True;
      while (EndIndex < CellCount) and Intersected do
      begin
        R := ReportLink.FReportCells.Cells[EndIndex].GetAbsoluteRect;
        Intersected := IntersectRect(R2, R, DetailRect);
        Inc(EndIndex);
      end;
      {
      repeat
        R := ReportLink.FReportCells.Cells[EndIndex].GetAbsoluteRect;
        Intersected := IntersectRect(R2, R, DetailRect);
        Inc(EndIndex);
      until (EndIndex = CellCount - 1) or not Intersected;
      }
      Dec(EndIndex, 1 + Byte(EndIndex <> CellCount));
      if EndIndex < StartIndex then
        EndIndex := StartIndex;

      ContinuedIndexes^[I].StartIndex := StartIndex;
      ContinuedIndexes^[I].EndIndex := EndIndex;
    end;
  end
  else
    FillChar(DetailRect, SizeOf(TRect), 0);
end;

procedure TdxPSPageRenderInfo.CalcOffsets(APageIndex: Integer);
var
  FullRect: TRect;
  MarginsOffset: TPoint;
  DataSize, PaintSize: Integer;
begin
  FullRect := ContentRect;
  OffsetRect(FullRect, -FullRect.Left, -FullRect.Top);
  FullRect := ScaleRect(FullRect, RenderInfo.ScaleFactor, 100, RenderInfo.ScaleFactor, 100);

  MarginsOffset := RenderInfo.PrinterPage.MarginsLoMetric.TopLeft;

  // horz.
  DataOffset.X := RenderInfo.LoMetricValueToInternalUnits(MarginsOffset.X);
  if RenderInfo.IsDrawPageTitleOnPage(APageIndex, RenderInfo.PageColCount) then
    TitleOffset.X := DataOffset.X;
  if RenderInfo.PrinterPage.CenterOnPageH then
  begin
    DataSize := FullRect.Right - FullRect.Left;
    PaintSize := RenderInfo.PaintSize.X;
    if DataSize < RenderInfo.PaintSize.X then
      Inc(DataOffset.X, MulDiv((PaintSize - DataSize) div 2, 100, RenderInfo.ScaleFactor));
  end;

  // vert.
  DataOffset.Y := RenderInfo.LoMetricValueToInternalUnits(MarginsOffset.Y);
  if RenderInfo.IsDrawPageTitleOnPage(APageIndex, RenderInfo.PageColCount) then
  begin
    TitleOffset.Y := DataOffset.Y;
    Inc(DataOffset.Y, RenderInfo.TitleRect.Bottom - RenderInfo.TitleRect.Top);
  end;
  if RenderInfo.PrinterPage.CenterOnPageV then
  begin
    DataSize := FullRect.Bottom - FullRect.Top;
    PaintSize := RenderInfo.PaintSize.Y;
    if RenderInfo.IsDrawPageTitleOnPage(APageIndex, RenderInfo.PageColCount) then
      Dec(PaintSize, RenderInfo.TitleRect.Bottom - RenderInfo.TitleRect.Top);
    if DataSize < PaintSize then
      Inc(DataOffset.Y, MulDiv((PaintSize - DataSize) div 2, 100, RenderInfo.ScaleFactor));
  end;
end;

function TdxPSPageRenderInfo.GetFooterRect: TRect;
begin
  Result := RenderInfo.FooterRect;
end;

function TdxPSPageRenderInfo.GetHeaderRect: TRect;
begin
  Result := RenderInfo.HeaderRect;
end;

function TdxPSPageRenderInfo.GetReportLink: TBasedxReportLink;
begin
  Result := RenderInfo.ReportLink;
end;

function TdxPSPageRenderInfo.GetTitleRect: TRect;
begin
  Result := RenderInfo.TitleRect;
end;


{ TdxPSReportRenderInfo }

constructor TdxPSReportRenderInfo.Create(AReportLink: TBasedxReportLink);
begin
  inherited Create;
  FReportLink := AReportLink;
  //UnitsPerMM := FUnitsPerMM;
  FXDelimiters := TList.Create;
  FYDelimiters := TList.Create;
  FXPageDelimiters := TList.Create;
  FYPageDelimiters := TList.Create;
  FBaseContentFont := TFont.Create;
end;

destructor TdxPSReportRenderInfo.Destroy;
begin
  FreeRenderInfos;
  FBaseContentFont.Free;
  FYPageDelimiters.Free;
  FXPageDelimiters.Free;
  FYDelimiters.Free;
  FXDelimiters.Free;
  inherited Destroy;
end;

procedure TdxPSReportRenderInfo.DoCalcRenderInfos;
begin
  if ReportCells <> nil then
  begin
    GridLinesColor := ReportCells.BorderColor;
    BaseContentFont := ReportCells.Font;
  end;

  CalcPageSizes;
  CalcTitleRect;
  CalcHeaderAndFooterRects;
  CalcPageDelimiters;
  CalcPageColRowCount;
  CalcPageCount;
  CalcPageHeaderAndFooterRects;
  CalcPagesRenderInfos;
  if ReportLink.NeedCalcEmptyPages then CalcEmptyPages;
  CalcPageIndexPairs;
end;

procedure TdxPSReportRenderInfo.CalcRenderInfos;
begin
  if Locked then Exit;
  Lock;
  try
    FreeRenderInfos;
    DoCalcRenderInfos;
  finally
    Unlock;
  end;
end;

procedure TdxPSReportRenderInfo.CalcEmptyPages;
var
  I: Integer;
begin
  for I := 0 to VirtualPageCount - 1 do
    with PageRenderInfos^[I] do
    begin
      IsEmptyPage := not IsNonEmptyPage(DetailRect);
      if IsEmptyPage then Inc(EmptyPageCount);
    end;
end;

procedure TdxPSReportRenderInfo.CalcHeaderAndFooterRects;
begin
  with ReportLink do
    if FReportCells <> nil then
    begin
      if IsDrawFootersOnEveryPage then FooterRect := FReportCells.FooterBoundsRect;
      if IsDrawHeadersOnEveryPage then HeaderRect := FReportCells.HeaderBoundsRect;
    end;
end;

procedure TdxPSReportRenderInfo.CalcPageColRowCount;
begin
  PageColCount := FXPageDelimiters.Count - 1;
  PageRowCount := FYPageDelimiters.Count - 1;
  if PageColCount < 0 then PageColCount := 0;
  if PageRowCount < 0 then PageRowCount := 0;
  if (PageColCount = 0) and (PageRowCount = 0) and (ReportLink.FReportCells <> nil) and
    (ReportLink.FReportCells.HeaderCellCount > 0) and
    (ReportLink.FReportCells.FooterCellCount > 0) then
  begin
    PageColCount := 1;
    PageRowCount := 1;
  end;
end;

function TdxPSReportRenderInfo.CalcPageContentHeight(APageIndex: Integer): Integer;
var
  HeaderH, FooterH, TitleH: Integer;
begin
  Result := PaintSize.Y;
  HeaderH := MulDiv(HeaderRect.Bottom - HeaderRect.Top, ScaleFactor, 100);
  FooterH := MulDiv(FooterRect.Bottom - FooterRect.Top, ScaleFactor, 100);
  TitleH := 0;
  if IsDrawPageTitleOnPage(APageIndex, FXPageDelimiters.Count - 1) then
    TitleH := MulDiv(TitleRect.Bottom - TitleRect.Top, ScaleFactor, 100);

  if APageIndex = 0 then
    CanUseHFOnEveryPageMode := Result > HeaderH + FooterH + TitleH;

  if Result < HeaderH + FooterH + TitleH then
    FooterH := 0;
  if (Result < HeaderH + TitleH) and (APageIndex > FXPageDelimiters.Count - 1) then
    HeaderH := 0;

  Dec(Result, HeaderH + FooterH + TitleH);
//  if Result < 0 then Result := 0;
end;

function TdxPSReportRenderInfo.CalcPageContentWidth(APageIndex: Integer): Integer;
begin
  Result := PaintSize.X;
end;

procedure TdxPSReportRenderInfo.CalcPageCount;
begin
  VirtualPageCount := PageColCount * PageRowCount;
  ReallocMem(PageRenderInfos, VirtualPageCount * SizeOf(TdxPSPageRenderInfo));
end;

procedure TdxPSReportRenderInfo.CalcPageDelimiters;
var
  I, PageIndex, Offset, PageContentWidth, PagePaintHeight, CurDelimiter: Integer;
begin
  // Horz.
  I := 0;
  PageIndex := 0;
  CurDelimiter := 0;

  FXPageDelimiters.Add(nil);
  while I < FXDelimiters.Count do
  begin
    PageContentWidth := CalcPageContentWidth(PageIndex);
    Offset := Integer(FXPageDelimiters.List^[PageIndex]);
    while (I < FXDelimiters.Count) and
      (MulDiv(Integer(FXDelimiters.List^[I]) - Offset, ScaleFactor, 100) <= PageContentWidth) do
      Inc(I);
    if I < FXDelimiters.Count then
    begin
      Dec(I);
      CurDelimiter := Integer(FXDelimiters.List^[I]);
      if Offset - CurDelimiter >= 0 then
        CurDelimiter := Offset + MulDiv(PageContentWidth, 100, ScaleFactor);
      FXPageDelimiters.Add(Pointer(CurDelimiter));
      Inc(PageIndex);
    end;
  end;

  with FXPageDelimiters do
  begin
    I := Integer(List^[Count - 1]);
    if I <> ReportLink.ReportWidth then
    begin
      Inc(I, ReportLink.ReportWidth);
      if Count > 1 then
        Dec(I, CurDelimiter);
      Add(Pointer(I));
    end;
    if Count = 1 then
      Clear;
  end;

  // Vert.
  I := 0;
  PageIndex := 0;
  FYPageDelimiters.Add(nil);
  while I < FYDelimiters.Count do
  begin
    PagePaintHeight := CalcPageContentHeight(PageIndex);
    if PagePaintHeight <= 0 then
    begin
      FYPageDelimiters.Add(nil);
      Inc(PageIndex);
      Continue;
    end;
    Offset := Integer(FYPageDelimiters.List^[PageIndex]);
    while (I < FYDelimiters.Count) and
      (MulDiv(Integer(FYDelimiters.List^[I]) - Offset, ScaleFactor, 100) <= PagePaintHeight) do
      Inc(I);
    if I < FYDelimiters.Count then
    begin
      Dec(I);
      CurDelimiter := Integer(FYDelimiters.List^[I]);
      if Offset - CurDelimiter >= 0 then
        CurDelimiter := Offset + MulDiv(PagePaintHeight, 100, ScaleFactor);
      FYPageDelimiters.Add(Pointer(CurDelimiter));
      Inc(PageIndex);
    end;
  end;

  with FYPageDelimiters do
  begin
    I := Integer(List^[Count - 1]);
    if I <> ReportLink.ReportHeight then
    begin
      Inc(I, ReportLink.ReportHeight);
      if Count > 1 then
        Dec(I, CurDelimiter);
      Add(Pointer(I));
    end;
    if Count = 1 then
      Clear;
  end;
end;

procedure TdxPSReportRenderInfo.CalcPageHeaderAndFooterRects;
begin
  if ReportLink.ShowPageHeader then
    PageHeaderRect := LoMetricRectToInternalUnits(PrinterPage.HeaderRectLoMetric);
  if ReportLink.ShowPageFooter then
    PageFooterRect := LoMetricRectToInternalUnits(PrinterPage.FooterRectLoMetric);
end;

procedure TdxPSReportRenderInfo.GetStartIndex(APageIndex: Integer; var AStartIndex: Integer);
const
  OldRowIndex: Integer = 0;
var
  RowIndex: Integer;
begin
  RowIndex := APageIndex div PageColCount;
  if APageIndex = 0 then
    OldRowIndex := RowIndex;
  if OldRowIndex <> RowIndex then
  begin
    if APageIndex > 0 then
      with PageRenderInfos^[APageIndex - 1] do
        if ContinuedIndexPairCount <> 0 then
          AStartIndex := ContinuedIndexes^[ContinuedIndexPairCount - 1].EndIndex;
    OldRowIndex := RowIndex;
  end;
  AStartIndex := 0;
end;

procedure TdxPSReportRenderInfo.CalcPageIndexPairs;
var
  StartIndex, I: Integer;
begin
  if (ReportLink.FReportCells = nil) or (ReportLink.FReportCells.Count = 0) then
    Exit;

  StartIndex := 0;
  for I := 0 to VirtualPageCount - 1 do
  begin
    if EmptyPageCount = 0 then
      GetStartIndex(I, StartIndex);
    PageRenderInfos[I].CalcIndexPairs(I, StartIndex);
  end;
end;

procedure TdxPSReportRenderInfo.CalcPageSizes;
begin
  with PrinterPage.RealPageSizeLoMetric do
  begin
    PageSize.X := MulDiv(X, UnitsPerInch, 254);
    PageSize.Y := MulDiv(Y, UnitsPerInch, 254);
  end;
  WindowScalePair.Numerator := 100;
  WindowScalePair.Denominator := ScaleFactor;
  with PrinterPage.PaintRectLoMetric do
  begin
    PaintSize.X := MulDiv(Right - Left, UnitsPerInch, 254);
    PaintSize.Y := MulDiv(Bottom - Top, UnitsPerInch, 254);
  end;
end;

procedure TdxPSReportRenderInfo.CalcPagesRenderInfos;
var
  I: Integer;
  PageRenderInfoClass: TdxPSPageRenderInfoClass;
begin
  if PageColCount = 0 then
    Exit;
  PageRenderInfoClass := GetPageRenderInfoClass;
  if PageRenderInfoClass = nil then
    Exit;

  for I := 0 to VirtualPageCount - 1 do
  begin
    PageRenderInfos^[I] := PageRenderInfoClass.Create(Self);
    SetupPageRenderInfoFlags(I);
    CalcPageRects(I);
    PageRenderInfos^[I].CalcOffsets(I);
  end;
end;

procedure TdxPSReportRenderInfo.CalcPageRects(APageIndex: Integer);
var
  ColIndex, RowIndex, PaintSize: Integer;
begin
  ColIndex := APageIndex mod PageColCount;
  RowIndex := APageIndex div PageColCount;
  with PageRenderInfos^[APageIndex] do
  begin
    DetailRect :=
      Rect(Integer(FXPageDelimiters.List^[ColIndex]),
      Integer(FYPageDelimiters.List^[RowIndex]),
      Integer(FXPageDelimiters.List^[ColIndex + 1]),
      Integer(FYPageDelimiters.List^[RowIndex + 1]));
    ContentRect := DetailRect;
    Inc(ContentRect.Bottom, HeaderRect.Bottom - HeaderRect.Top);
    Inc(ContentRect.Bottom, FooterRect.Bottom - FooterRect.Top);

    PaintSize := MulDiv(Self.PaintSize.Y, 100, ScaleFactor);
    if IsDrawPageTitleOnPage(APageIndex, PageColCount) then
      Dec(PaintSize, TitleRect.Bottom - TitleRect.Top);

    if ContentRect.Bottom - ContentRect.Top > PaintSize then
      ContentRect.Bottom := ContentRect.Top + PaintSize;
  end;
end;

procedure TdxPSReportRenderInfo.SetupPageRenderInfoFlags(APageIndex: Integer);
begin
  with PageRenderInfos^[APageIndex] do
  begin
    IsTopPage := APageIndex < PageColCount;
    IsBottomPage := APageIndex >= VirtualPageCount - PageColCount;

    IsFooterExists := not IsRectEmpty(FooterRect) and (CanUseHFOnEveryPageMode or IsBottomPage);
    IsHeaderExists := not IsRectEmpty(HeaderRect) and (CanUseHFOnEveryPageMode or IsTopPage);
  end;
end;

function TdxPSReportRenderInfo.CalcTitleHeight: Integer;
const
  CalcFormat: UINT = DT_CALCRECT or DT_EDITCONTROL or DT_WORDBREAK;
var
  L: Integer;
  PrevFontHeight: Integer;
  DC: HDC;
  F: TFont;
  PrevFont: HFONT;
  R: TRect;
begin
  Result := 0;
  L := Length(ReportLink.ReportTitleText);
  if L > 0 then
  begin
    PrevFontHeight := 0;
    F := ReportLink.ReportTitle.Font;

    if ReportLink.ReportTitle.AdjustOnReportScale then
    begin
      PrevFontHeight := F.Height;
      F.Height := MulDiv(PrevFontHeight, ScaleFactor, 100);
    end;

    DC := GetDC(0);
    PrevFont := SelectObject(DC, F.Handle);
    R := PrinterPage.PaintRectPixels;
    OffsetRect(R, -R.Left, -R.Top);
    Result := 4 + DrawText(DC, PChar(ReportLink.ReportTitleText), L, R,
      CalcFormat or dxDrawTextTextAlignY[ReportLink.ReportTitle.TextAlignY]);
    SelectObject(DC, PrevFont);
    ReleaseDC(0, DC);

    if ReportLink.ReportTitle.AdjustOnReportScale then
      F.Height := PrevFontHeight;
  end;

  ReportLink.DoMeasureReportLinkTitle(Result);

  with PrinterPage.PaintRectPixels do
    L := Bottom - Top;
  if Result > L div 2 then Result := L div 2;
  if Result < 0 then Result := 0;
end;

procedure TdxPSReportRenderInfo.CalcTitleRect;
begin
  if ReportLink.ReportTitleMode = tmNone then Exit;
  TitleRect.Right :=
    MulDiv(PaintSize.X, 100, ScaleFactor);
  TitleRect.Bottom :=
    MulDiv(CalcTitleHeight, 100 * PixelsNumerator, ScaleFactor * PixelsDenominator);
end;

procedure TdxPSReportRenderInfo.CalcPageRealAndVirtualIndexes(APageIndex: Integer;
  var AVirtualPageIndex, ARealPageIndex: Integer);
begin
  AVirtualPageIndex := RealPageIndexToVirtualPageIndex(APageIndex, False);
  ARealPageIndex := VirtualPageIndexToRealPageIndex(APageIndex);
end;

function TdxPSReportRenderInfo.CanRenderPage(AVirtualPageIndex: Integer): Boolean;
begin
  Result := not (ReportLink.ShowEmptyPages and PageRenderInfos^[AVirtualPageIndex].IsEmptyPage);
end;

procedure TdxPSReportRenderInfo.FreeRenderInfos;
var
  I: Integer;
begin
  for I := 0 to VirtualPageCount - 1 do
    TObject(PageRenderInfos^[I]).Free;
  ReallocMem(PageRenderInfos, 0);

  CanUseHFOnEveryPageMode := True;
  EmptyPageCount := 0;
  FillChar(FooterRect, SizeOf(TRect), 0);
  FillChar(HeaderRect, SizeOf(TRect), 0);
  PageColCount := 0;
  VirtualPageCount := 0;
  FillChar(PageFooterRect, SizeOf(TRect), 0);
  FillChar(PageHeaderRect, SizeOf(TRect), 0);
  PageRowCount := 0;
  FillChar(PageSize, SizeOf(TPoint), 0);
  FillChar(PaintSize, SizeOf(TPoint), 0);
  FillChar(TitleRect, SizeOf(TPoint), 0);

  WindowScalePair.Numerator := 100;
  WindowScalePair.Denominator := 100;

  FXPageDelimiters.Clear;
  FYPageDelimiters.Clear;
end;

function TdxPSReportRenderInfo.RealPageIndexToVirtualPageIndex(APageIndex: Integer;
  ATakeIntoAccountEmptyPages: Boolean): Integer;
var
  I: Integer;
begin
  Result := APageIndex;
  if (EmptyPageCount > 0) and (not ReportLink.ShowEmptyPages or ATakeIntoAccountEmptyPages) then
  begin
    I := 0;
    while (I < VirtualPageCount) and (I <> Result) do
    begin
      if PageRenderInfos^[I].IsEmptyPage then Inc(Result);
      Inc(I);
    end;
    while (Result < VirtualPageCount) and PageRenderInfos^[Result].IsEmptyPage do
      Inc(Result);
    if Result = VirtualPageCount then Dec(Result);
  end;
end;

function TdxPSReportRenderInfo.VirtualPageIndexToRealPageIndex(APageIndex: Integer): Integer;
var
  I: Integer;
begin
  Result := APageIndex;
  if (EmptyPageCount = 0) or not ReportLink.ShowEmptyPages then Exit;
  for I := 0 to APageIndex do
    if PageRenderInfos^[I].IsEmptyPage then Dec(Result);
end;

function TdxPSReportRenderInfo.GetNonEmptyPageCount: Integer;
begin
  Result := VirtualPageCount - EmptyPageCount;
end;

function TdxPSReportRenderInfo.GetPrinterPage: TdxPrinterPage;
begin
  Result := ReportLink.RealPrinterPage;
end;

function TdxPSReportRenderInfo.GetReportCells: TdxReportCells;
begin
  Result := ReportLink.FReportCells;
end;

function TdxPSReportRenderInfo.GetScaleFactor: Integer;
begin
  Result := ReportLink.RealScaleFactor;
end;

function CompareProc(Item1, Item2: Pointer): Integer;
begin
  Result := Integer(Item1) - Integer(Item2);
end;

procedure TdxPSReportRenderInfo.EliminateDuplicatesAndSortDelimiters(AList: TList);
var
  Duplicates: TList;
  I: Integer;
  V: Pointer;
begin
  Duplicates := TList.Create;
  try
    for I := 0 to AList.Count - 1 do
    begin
      V := AList.List^[I];
      if Duplicates.IndexOf(V) = -1 then Duplicates.Add(V);
    end;
    Duplicates.Sort(CompareProc);
    AList.Clear;
    AList.Count := Duplicates.Count;
    V := AList.List;
    Move(Duplicates.List^, V^, Duplicates.Count * SizeOf(Pointer));
  finally
    Duplicates.Free;
  end;
end;

procedure TdxPSReportRenderInfo.GetDelimiters;
begin
  FXDelimiters.Clear;
  FYDelimiters.Clear;
  with ReportLink do
  begin
    AddStandardDelimiters(FReportCells, FXDelimiters, FYDelimiters);
    if UseHorzDelimiters or UseVertDelimiters then 
      MakeDelimiters(FReportCells, FXDelimiters, FYDelimiters);
  end;
  EliminateDuplicatesAndSortDelimiters(FXDelimiters);
  EliminateDuplicatesAndSortDelimiters(FYDelimiters);
end;

function TdxPSReportRenderInfo.GetPageRenderInfoClass: TdxPSPageRenderInfoClass;
begin
  Result := TdxPSPageRenderInfo;
end;

function TdxPSReportRenderInfo.GetUnitsPerInch: Integer;
begin
  Result := FUnitsPerInch;
end;

procedure TdxPSReportRenderInfo.SetBaseContentFont(Value: TFont);
begin
  FBaseContentFont.Assign(Value);
end;

function TdxPSReportRenderInfo.IsDrawPageTitleOnPage(AVirtualPageIndex, AColCount: Integer): Boolean;
begin
  case ReportLink.ReportTitleMode of
    tmNone:
      Result := False;
    tmOnFirstPage:
      Result := AVirtualPageIndex = 0;
  else {tmOnEveryTopPage}
    Result := AVirtualPageIndex < AColCount;
  end;
end;

function TdxPSReportRenderInfo.IsNonEmptyPage(const APageRect: TRect): Boolean;
var
  I: Integer;
  R: TRect;
begin
  Result := False;
  if ReportLink.FReportCells = nil then Exit;
  with ReportLink do
  begin
    I := 0;
    while not Result and (I < FReportCells.Count) do
    begin
      R := FReportCells.Cells[I].GetAbsoluteRect;
      Result := IntersectRect(R, R, APageRect);
      Inc(I);
    end;
  end;
end;

function TdxPSReportRenderInfo.IsTitleExists(APageIndex: Integer): Boolean;
begin
  Result := not IsRectEmpty(TitleRect) and IsDrawPageTitleOnPage(APageIndex, PageColCount);
end;

function TdxPSReportRenderInfo.LoMetricValueToInternalUnits(Value: Integer): Integer;
begin
  Result := MulDiv(Value, 100 * UnitsPerInch, 254 * ScaleFactor);
end;

function TdxPSReportRenderInfo.LoMetricRectToInternalUnits(const R: TRect): TRect;
begin
  with Result do
  begin
    Left := LoMetricValueToInternalUnits(R.Left);
    Top := LoMetricValueToInternalUnits(R.Top);
    Right := LoMetricValueToInternalUnits(R.Right);
    Bottom := LoMetricValueToInternalUnits(R.Bottom);
  end;
end;

function TdxPSReportRenderInfo.GetLocked: Boolean;
begin
  Result := FLockCounter <> 0;
end;

procedure TdxPSReportRenderInfo.Lock;
begin
  Inc(FLockCounter);
end;

procedure TdxPSReportRenderInfo.Unlock;
begin
  if FLockCounter <> 0 then Dec(FLockCounter);
end;

{ TdxPSReportRenderer }

constructor TdxPSReportRenderer.Create(AReportLink: TBasedxReportLink);
begin
  inherited Create;
  FReportLink := AReportLink;
  FDrawBitmap := TBitmap.Create;
  FHFStrings := TStringList.Create;
  FPatternBrush := CreatePatternBrush;
  FSaveFont := TFont.Create;
end;

destructor TdxPSReportRenderer.Destroy;
begin
  FSaveFont.Free;
  DeleteObject(FPatternBrush);
  FHFStrings.Free;
  FDrawBitmap.Free;
  inherited Destroy;
end;

function TdxPSReportRenderer.CreatePatternBrush: HBRUSH;
var
  Bmp: HBITMAP;
  DC: HDC;
  X, Y: Integer;
  PatternColors: array[Boolean] of COLORREF;
begin
  PatternColors[False] := GetSysColor(COLOR_BTNSHADOW);
  PatternColors[True] := GetSysColor(COLOR_WINDOW);
  DC := CreateCompatibleDC(0);
  try
    Bmp := SelectObject(DC, CreateBitmap(4, 4, 1, 16, nil));
    try
      for X := 0 to 3 do
        for Y := 0 to 3 do
          SetPixel(DC, X, Y, PatternColors[Odd(X) = Odd(Y)]);
      Bmp := SelectObject(DC, Bmp);
      Result := Windows.CreatePatternBrush(Bmp);
    finally
      DeleteObject(Bmp);
    end;
  finally
    DeleteDC(DC);
  end;
end;

procedure TdxPSReportRenderer.CustomDrawReportItem(AItem: TAbstractdxReportCellData;
  var R: TRect; AClientRect: TRect; var ADone: Boolean);
var
  Rgn: HRGN;
begin
  Rgn := IntersectClipRect(DC, R);
  ReportLink.CustomDraw(AItem, Canvas, R, AClientRect, ADone);
  RestoreClipRgn(DC, Rgn);
end;

function TdxPSReportRenderer.BrushNeeded(AColor: TColor): HBRUSH;
begin
  Result := ReportLink.BrushNeeded(AColor);
end;

procedure TdxPSReportRenderer.RenderPageTitleContent(const AText: string; ARect: TRect;
  ATextAlignX: TdxTextAlignX; ATextAlignY: TdxTextAlignY; AColor: TColor; AFont: TFont;
  ATransparent: Boolean);
var
  PrevFontSize, UPI: Integer;
  Rgn: HRGN;
  Done: Boolean;
begin
  PrevFontSize := AFont.Size;
  UPI := UnitsPerInch;
  if not ReportLink.ReportTitle.AdjustOnReportScale then
    UPI := MulDiv(UPI, 100, ReportLink.RealScaleFactor);
  AFont.Size := MulDiv(PrevFontSize, UPI, Screen.PixelsPerInch); //PPI);

  Rgn := IntersectClipRect(DC, ARect);
  try
    Done := False;
    if ReportLink.IsTitleCustomDrawn then
    begin
      PrepareCanvasForCustomDraw(@AFont, @AColor);
      ReportLink.DoCustomDrawPageTitle(Canvas, ARect, ATextAlignX, ATextAlignY, AColor, AFont, Done);
      SetBkMode(DC, Windows.TRANSPARENT);
    end;

    if not Done then
      DrawText(DC, ARect, 0, AText, AFont, AColor, ATextAlignX, ATextAlignY, not ATransparent, True, False);

    if ReportLink.IsTitleCustomDrawn then UnprepareCanvasForCustomDraw;
  finally
    RestoreClipRgn(DC, Rgn);
  end;
  AFont.Size := PrevFontSize;
end;

procedure TdxPSReportRenderer.DrawCheckBox(DC: HDC; var R: TRect;
  AChecked, AEnabled, AFlatBorder: Boolean);
const
  Enabled: array[Boolean] of UINT = (DFCS_BUTTON3STATE or DFCS_INACTIVE, 0);
  Checked: array[Boolean] of UINT = (0, DFCS_CHECKED);
  FlatBorder: array[Boolean] of UINT = (0, DFCS_FLAT);
begin
  DrawFrameControl(DC, R, DFC_BUTTON,
    DFCS_TRANSPARENT or Enabled[AEnabled] or Checked[AChecked] or FlatBorder[AFlatBorder]);
end;

procedure TdxPSReportRenderer.DrawEdge(DC: HDC; var R: TRect; AEdgeMode: TdxCellEdgeMode;
  AInnerEdge, AOuterEdge: TdxCellEdgeStyle; ASides: TdxCellSides);

  procedure DrawFrame(DC: HDC; var R: TRect; TLBrush, BRBrush: HBRUSH;
    Sides: TdxCellSides; PixelSize: Integer);
  begin
    if csRight in Sides then
    begin
      Windows.FillRect(DC, Rect(R.Right - PixelSize, R.Top, R.Right, R.Bottom), BRBrush);
      Dec(R.Right, PixelSize);
    end;
    if csBottom in Sides then
    begin
      Windows.FillRect(DC, Rect(R.Left, R.Bottom - PixelSize, R.Right, R.Bottom), BRBrush);
      Dec(R.Bottom, PixelSize);
    end;
    if csLeft in Sides then
    begin
      Windows.FillRect(DC, Rect(R.Left, R.Top, R.Left + PixelSize, R.Bottom), TLBrush);
      Inc(R.Left, PixelSize);
    end;
    if csTop in Sides then
    begin
      Windows.FillRect(DC, Rect(R.Left, R.Top, R.Right, R.Top + PixelSize), TLBrush);
      Inc(R.Top, PixelSize);
    end;
  end;

var
  TLBrush, BRBrush: HBRUSH;
begin
  case AEdgeMode of
    cemSingle:
      DrawFrame(DC, R, FBorderBrush, FBorderBrush, ASides, FLineWidth);
    cem3DEffects:
      begin
        if AOuterEdge > cesNone then
        begin
          if AOuterEdge = cesSunken then
          begin
              //TLBrush := GetSysColorBrush(COLOR_BTNSHADOW);
            TLBrush := HBRUSH(COLOR_WINDOWTEXT + 1);
            BRBrush := HBRUSH(COLOR_BTNHIGHLIGHT + 1);
          end
          else
          begin
            TLBrush := HBRUSH(COLOR_BTNFACE + 1);
            BRBrush := HBRUSH(COLOR_WINDOWTEXT + 1);
          end;
          DrawFrame(DC, R, TLBrush, BRBrush, ASides, FLineWidth);
        end;

        if AInnerEdge > cesNone then
        begin
          if AInnerEdge = cesSunken then
          begin
            if AOuterEdge = cesSunken then
              TLBrush := HBRUSH(COLOR_BTNSHADOW + 1)
            else
              TLBrush := HBRUSH(COLOR_WINDOWTEXT + 1);
            BRBrush := HBRUSH(COLOR_BTNFACE + 1);
          end
          else
          begin
            TLBrush := HBRUSH(COLOR_BTNHIGHLIGHT + 1);
            if AOuterEdge = cesRaised then
              BRBrush := HBRUSH(COLOR_BTNSHADOW + 1)
            else
              BRBrush := HBRUSH(COLOR_WINDOWTEXT + 1);
          end;
          DrawFrame(DC, R, TLBrush, BRBrush, ASides, FLineWidth);
        end;
      end;
    cemShadow:
      DrawFrame(DC, R, FBorderBrush, FBorderBrush, ASides, FLineWidth);
  end;
end;

procedure TdxPSReportRenderer.DrawGraphic(DC: HDC; var R: TRect; const ClipRect: TRect;
  ImageList: {$IFDEF DELPHI4}TCustomImageList{$ELSE}TImageList{$ENDIF};
  ImageIndex: Integer; Graphic: TGraphic; GraphicTransparent, Transparent: Boolean;
  Color: TColor);
const
  MaskColor = $00101010;
var
  G: TGraphic;
  Rgn, Rgn2, RestRgn: hRgn;
  Br: HBRUSH;
  SaveTransparent: Boolean;
begin
  if (ImageList <> nil) or (Graphic is TIcon) then
  begin
    with FDrawBitmap do
      if ImageList <> nil then
      begin
        Handle := 0;
        Width := ImageList.Width;
        Height := ImageList.Height;
        if ImageList.Masked then
        begin
          Br := CreateSolidBrush(MaskColor);
          Windows.FillRect(Canvas.Handle, Rect(0, 0, Width, Height), Br);
          DeleteObject(Br);
        end;
        ImageList.Draw(Canvas, 0, 0, ImageIndex);
      end
      else
      begin
        Width := Graphic.Width;
        Height := Graphic.Height;
        Canvas.Draw(0, 0, Graphic);
      end;
    G := FDrawBitmap;
  end
  else
    G := Graphic;

  if G.Empty then Exit;
  SaveTransparent := G.Transparent;
  if GraphicTransparent and not (G is TIcon) then
    G.Transparent := True;

  Rgn := 0;
  if (R.Right - R.Left > ClipRect.Right - ClipRect.Left) or
    (R.Bottom - R.Top > ClipRect.Bottom - ClipRect.Top) then
    Rgn := IntersectClipRect(DC, ClipRect);

  if not Transparent then
    if GraphicTransparent then
      FillRect(DC, ClipRect, Color)
    else
    begin
      RestRgn := CreateRectRgnIndirect(ClipRect);
      Rgn2 := CreateRectRgnIndirect(R);
      if CombineRgn(RestRgn, RestRgn, Rgn2, RGN_DIFF) > NULLREGION then
        FillRgn(DC, RestRgn, Color);
      DeleteObject(Rgn2);
      DeleteObject(RestRgn);
    end;

  FCanvas.StretchDraw(R, G);
  if Rgn <> 0 then RestoreClipRgn(DC, Rgn);

  if GraphicTransparent and not (G is TIcon) then
    G.Transparent := SaveTransparent;
end;

procedure TdxPSReportRenderer.DrawSortMark(DC: HDC; var R: TRect;
  SortOrder: TdxCellSortOrder; Mono: Boolean);
var
  W, H: Integer;
  Pen: HPEN;
  Points: array[0..2] of TPoint;
begin
  W := MulDiv(FSortMarkWidth, PixelsNumerator, PixelsDenominator);
  H := MulDiv(FSortMarkHeight, PixelsNumerator, PixelsDenominator);
  with R do
  begin
    R := Bounds(Left + (Right - Left - W) div 2, Top + (Bottom - Top - H) div 2, W, H - 1);
    if (SortOrder = csoDown) then
    begin
      Pen := SelectObject(DC, FBtnShadowPen);
      Points[0] := Point(Right - FUnitsPerPixel, Top);
      Points[1] := Point(Left, Top);
      Points[2] := Point(Left + W div 2 - FUnitsPerPixel, Bottom);
      Polyline(DC, Points, 3);
      Points[0] := Point(Left + FUnitsPerPixel, Top + FUnitsPerPixel div 2);
      Points[1] := Point(Left + W div 2 - FUnitsPerPixel, Bottom - FUnitsPerPixel);
      Polyline(DC, Points, 2);
      if not Mono then SelectObject(DC, FBtnHighLightPen);
      Points[0] := Point(Right - FUnitsPerPixel, Top + FUnitsPerPixel div 2);
      Points[1] := Point(Left + W div 2, Bottom);
      Polyline(DC, Points, 2);
      Points[0] := Point(Right - 2 * FUnitsPerPixel, Top + FUnitsPerPixel div 2);
      Points[1] := Point(Left + W div 2, Bottom - FUnitsPerPixel);
      Polyline(DC, Points, 2);
    end
    else
    begin
      Pen := SelectObject(DC, FBtnShadowPen);
      Points[0] := Point(Left, Bottom);
      Points[1] := Point(Left + W div 2 - FUnitsPerPixel, Top);
      Polyline(DC, Points, 2);
      Points[0] := Point(Left + FUnitsPerPixel, Bottom - FUnitsPerPixel);
      Points[1] := Point(Left + W div 2, Top);
      Polyline(DC, Points, 2);
      if not Mono then SelectObject(DC, FBtnHighLightPen);
      Points[0] := Point(Left + FUnitsPerPixel, Bottom - Byte(not Mono) * FUnitsPerPixel div 2);
      Points[1] := Point(Right - FUnitsPerPixel, Bottom - Byte(not Mono) * FUnitsPerPixel div 2);
      Points[2] := Point(Right - W div 2 - FUnitsPerPixel, Top);
      Polyline(DC, Points, 3);
      Points[0] := Point(Right - FUnitsPerPixel, Bottom - FUnitsPerPixel);
      Points[1] := Point(Right - W div 2, Top);
      Polyline(DC, Points, 2);
    end;
    SelectObject(DC, Pen);
  end;
end;

procedure TdxPSReportRenderer.DrawText(DC: HDC; var R: TRect; AIndent: Integer;
  const Text: string; Font: TFont; BkColor: TColor; TextAlignX: TdxTextAlignX;
  TextAlignY: TdxTextAlignY; FillBackground, Multiline, EndEllipsis: Boolean);
const
  dxMinVisibleFontSize = 4;
  dxEndEllipsis: array[Boolean] of UINT = (0, DT_END_ELLIPSIS);
  dxMultiline: array[Boolean] of UINT = (DT_SINGLELINE, DT_WORDBREAK or DT_EXPANDTABS);
  dxTextAlignY: array[Boolean, TdxTextAlignY] of UINT =
  ((DT_TOP, DT_VCENTER, DT_BOTTOM), (DT_TOP, DT_TOP, DT_TOP));
  dxNoClip: array[Boolean] of UINT = (0, DT_NOCLIP);
  dxOpaque: array[Boolean] of UINT = (0, ETO_OPAQUE);
  dxCliped: array[Boolean] of UINT = (ETO_CLIPPED, 0);
  uDrawFormat: UINT = DT_NOPREFIX {or DT_EDITCONTROL} or DT_EXPANDTABS;
  uCalcFormat: UINT = DT_CALCRECT or DT_TOP or DT_WORDBREAK;
var
  PrevFont: HFONT;
  PrevFontColor, PrevBkColor: COLORREF;
  PrevBkMode: Integer;
  Size: TSize;
  SaveR: TRect;
  LineCount, I, X, Y: Integer;
  TextSpace: Integer;
  B: HBRUSH;
begin
  TextSpace := MulDiv(dxTextSpace, PixelsNumerator, PixelsDenominator);
  AIndent := MulDiv(AIndent, PixelsNumerator, PixelsDenominator);
  PrevBkColor := 0;
  PrevBkMode := 0;
  PrevFont := 0;
  PrevFontColor := 0;
  if Font <> nil then
  begin
    PrevFont := SelectObject(DC, Font.Handle);
    PrevFontColor := SetTextColor(DC, ColorToRGB(Font.Color));
  end;
  GetTextExtentPoint32(DC, PChar(Text), Length(Text), Size);
  if Multiline or EndEllipsis or not FillBackground then
    PrevBkMode := SetBkMode(DC, Windows.TRANSPARENT);
  if Multiline or EndEllipsis then
  begin
    if FillBackground then
      FillRect(DC, R, BkColor);
    InflateRect(R, -TextSpace, 0);
    Inc(R.Left, AIndent);
    if Multiline then
      InflateRect(R, 0, -TextSpace);
    Y := 0;
    if Multiline and (TextAlignY > taTop) then
    begin
      SaveR := R;
      Y := Windows.DrawText(DC, PChar(Text), Length(Text), R, uDrawFormat or uCalcFormat);
      if Y > SaveR.Bottom - SaveR.Top then
        Y := SaveR.Bottom - SaveR.Top;
      with SaveR do
        R := Bounds(Left, Top + (Bottom - Top - Y) div (1 + Byte(TextAlignY = taCenterY)), Right - Left, Y);
    end;
    if Size.cY <= dxMinVisibleFontSize * FUnitsPerPixel then {Draw pattern line instead text }
    begin
      if (Font <> nil) and (fsBold in Font.Style) then
        B := HBRUSH(COLOR_BTNSHADOW + 1)
      else
        B := FPatternBrush;
      if Multiline then
      begin
        if TextAlignY = taTop then
          Y := R.Bottom - R.Top;
        LineCount := Y div (Size.cY + 2 * OnePixel);
        for I := 0 to LineCount - 1 do
          Windows.FillRect(DC, Rect(R.Left, R.Top + I * Size.cY + OnePixel,
            Min(R.Left + Size.cX, R.Right - TextSpace),
            Min(R.Top + (I + 1) * Size.cY, R.Bottom - OnePixel)), B);
      end
      else
        Windows.FillRect(DC, Rect(R.Left, R.Top, Min(R.Left + Size.cX, R.Right - TextSpace),
          Min(R.Top + Size.cY, R.Bottom - OnePixel)), B);
    end
    else
      Windows.DrawText(DC, PChar(Text), Length(Text), R,
        uDrawFormat or dxMultiline[Multiline] or dxEndEllipsis[EndEllipsis] or
        dxNoClip[(AIndent + TextSpace + Size.cX <= R.Right - R.Left) and (Y <= R.Bottom - R.Top) { not MultiLine}] or
        dxDrawTextTextAlignX[TextAlignX] or dxTextAlignY[Multiline, TextAlignY]);
  end
  else
  begin
    with R do
    begin
      case TextAlignX of
        taLeft:
          X := Left + TextSpace + AIndent;
        taCenterX:
          X := Left + (Right - Left - AIndent - Size.cX) div 2;
      else {taRight}
        X := Right - Size.cX - TextSpace;
      end;
      if X < Left + TextSpace + AIndent then X := Left + TextSpace + AIndent;
      if X + Size.cX > Right - TextSpace then
      begin
        Dec(Right, TextSpace);
        if FillBackground then
          FillRect(DC, Rect(Right, Top, Right + TextSpace, Bottom), BkColor);
      end;
      case TextAlignY of
        taTop:
          Y := Top + TextSpace;
        taCenterY:
          Y := Top + (Bottom - Top - Size.cY) div 2;
      else {taBottom}
        Y := Bottom - Size.cY - TextSpace;
      end;
      if Y < Top + TextSpace div 2 then Y := Top + TextSpace div 2;
      if Y + Size.cY > Bottom - TextSpace div 2 then
      begin
        Dec(Bottom, TextSpace div 2);
        if FillBackground then
          FillRect(DC, Rect(Left, Bottom, Right, Bottom + TextSpace), BkColor);
      end;
    end;
    if Size.cY <= dxMinVisibleFontSize * FUnitsPerPixel then { Paint pattern line instead a Text }
    begin
      if FillBackground then FillRect(DC, R, BkColor);
      if (Font <> nil) and (fsBold in Font.Style) then
        B := HBRUSH(COLOR_BTNSHADOW + 1)
      else
        B := FPatternBrush;
      Windows.FillRect(DC, Rect(X, Y, Min(X + Size.cX, R.Right - TextSpace), Min(Y + Size.cY, R.Bottom - OnePixel)), B);
    end
    else
    begin
      if FillBackground then
        PrevBkColor := SetBkColor(DC, ColorToRGB(BkColor));
      ExtTextOut(DC, X, Y, dxCliped[(AIndent + TextSpace + Size.cX <= R.Right - R.Left) and
        (Size.cY <= R.Bottom - R.Top)] or dxOpaque[FillBackground], @R, PChar(Text), Length(Text), nil);
      if FillBackground then
        SetBkColor(DC, PrevBkColor);
    end;
  end;
  if Multiline or EndEllipsis or not FillBackground then
    SetBkMode(DC, PrevBkMode);
  if Font <> nil then
  begin
    SetTextColor(DC, PrevFontColor);
    SelectObject(DC, PrevFont);
  end;
end;

procedure TdxPSReportRenderer.FillRect(DC: HDC; const R: TRect; AColor: TColor);
begin
  Windows.FillRect(DC, R, BrushNeeded(AColor));
end;

procedure TdxPSReportRenderer.FillRgn(DC: HDC; Rgn: HRGN; AColor: TColor);
begin
  Windows.FillRgn(DC, Rgn, BrushNeeded(AColor));
end;

procedure TdxPSReportRenderer.FrameRect(DC: HDC; const R: TRect; AColor: TColor);
begin
  Windows.FrameRect(DC, R, BrushNeeded(AColor));
end;

class function TdxPSReportRenderer.IntersectClipRect(DC: HDC; const R: TRect): HRGN;
begin
  Result := CreateRectRgn(0, 0, 0, 0);
  if GetClipRgn(DC, Result) <> 1 then
  begin
    DeleteObject(Result);
    Result := 0;
  end;
  with R do
    Windows.IntersectClipRect(DC, Left, Top, Right, Bottom);
end;

class procedure TdxPSReportRenderer.RestoreClipRgn(DC: HDC; var Rgn: HRGN);
begin
  SelectClipRgn(DC, Rgn);
  if Rgn <> 0 then DeleteObject(Rgn);
  Rgn := 0;
end;

procedure TdxPSReportRenderer.RenderPage(ACanvas: TCanvas; const APageRect: TRect;
  AVirtualPageIndex, ARealPageIndex, AZoomFactor: Integer);
begin
  FCanvas := ACanvas;
  FDC := FCanvas.Handle;
  FPPI := GetDeviceCaps(DC, LOGPIXELSX);
  FViewPortRect := APageRect;
  FZoomFactor := AZoomFactor;
  FRenderingPageIndex := AVirtualPageIndex;

  PrepareRenderPage;
  try
    RenderPageHeader(ARealPageIndex);
    RenderPageFooter(ARealPageIndex);
    if RenderInfo.IsTitleExists(ARealPageIndex) then
      RenderPageTitle;
    RenderPageContent;
  finally
    UnprepareRenderPage;
  end;
  RenderEntirePage(ARealPageIndex);
end;

procedure TdxPSReportRenderer.RenderEntirePage(ARealPageIndex: Integer);
var
  Rgn: HRGN;
begin
  if not ReportLink.IsEntirePageCustomDrawn then Exit;
  Rgn := IntersectClipRect(DC, ViewPortRect);
  try
    ReportLink.DoCustomDrawEntirePage(Canvas, ViewPortRect, ARealPageIndex);
  finally
    RestoreClipRgn(DC, Rgn);
  end;
end;

procedure TdxPSReportRenderer.RenderPageFooter(ARealPageIndex: Integer);
var
  R: TRect;
begin
  R := RenderInfo.PageFooterRect;
  if not IsRectEmpty(R) and IsPrinterDC(DC) or RectVisible(DC, R) then
    RenderPageHeaderOrFooter(ReportLink.RealPrinterPage.PageFooter, ARealPageIndex, R);
end;

procedure TdxPSReportRenderer.RenderPageHeader(ARealPageIndex: Integer);
var
  R: TRect;
begin
  R := RenderInfo.PageHeaderRect;
  if not IsRectEmpty(R) and IsPrinterDC(DC) or RectVisible(DC, R) then
    RenderPageHeaderOrFooter(ReportLink.RealPrinterPage.PageHeader, ARealPageIndex, R);
end;

procedure TdxPSReportRenderer.RenderPageHeaderOrFooter(HF: TCustomdxPageObject;
  APageIndex: Integer; ARect: TRect);
const
  TitleParts: array[Boolean] of TdxPageTitleParts = ([], [tpLeft..tpRight]);
var
  PrevFontHeight: Integer;
  Rgn: HRGN;
  DefaultDrawText, DefaultDrawBackground: Boolean;
  PrevFont: HFONT;
  PrevFontColor: COLORREF;
begin
  PrevFontHeight := HF.Font.Height;
  HF.Font.Height := -MulDiv(HF.Font.Size, MulDiv(UnitsPerInch, 100, ReportLink.RealScaleFactor), FPtPerInch);

  SetBkMode(DC, TRANSPARENT);

  Rgn := IntersectClipRect(DC, ARect);
  try
    DefaultDrawText := True;
    DefaultDrawBackground := True;

    PrevFont := SelectObject(DC, HF.Font.Handle);
    PrevFontColor := SetTextColor(DC, ColorToRGB(HF.Font.Color));

    if ReportLink.IsHeaderOrFooterCustomDrawn(HF) then
    begin
      //PrepareCanvasForCustomDraw(@HF.Font, nil);
      ReportLink.DoCustomDrawPageHeaderOrFooter(HF, Canvas, APageIndex, ARect, DefaultDrawText, DefaultDrawBackground);
      SetBkMode(DC, TRANSPARENT);
    end;

    if DefaultDrawText or DefaultDrawBackground then
      RenderPageHeaderOrFooterContent(HF, APageIndex, ARect, TitleParts[DefaultDrawText], DefaultDrawBackground);

    //if ReportLink.IsHeaderOrFooterCustomDrawn(HF) then UnprepareCanvasForCustomDraw;

    SetTextColor(DC, PrevFontColor);
    SelectObject(DC, PrevFont);
  finally
    RestoreClipRgn(DC, Rgn);
  end;
  HF.Font.Height := PrevFontHeight;
end;

procedure TdxPSReportRenderer.RenderPageHeaderOrFooterContentPart(ATitlePart: TdxPageTitlePart;
  AStrings: TStrings; ATextAlignY: TdxTextAlignY; ALineHeight, ADestWidth, ADestHeight: Integer;
  const ARect: TRect);
const
  uFormat = DT_SINGLELINE or DT_VCENTER or DT_NOCLIP or DT_EDITCONTROL;
var
  FullHeight: Integer;
  R: TRect;
  I: Integer;
  S: string;
  TextSize: TSize;
begin
  if ATextAlignY = taTop then
    FullHeight := ARect.Top
  else
  begin
    FullHeight := AStrings.Count * ALineHeight;
    if ATextAlignY = taCenterY then
      FullHeight := ARect.Top + (ADestHeight - FullHeight) div 2
    else {taBottom}
      FullHeight := ARect.Top + ADestHeight - FullHeight;
  end;
  if FullHeight < ARect.Top then
    FullHeight := ARect.Top;
  R := Rect(ARect.Left, FullHeight, ARect.Right, FullHeight + ALineHeight);

  for I := 0 to AStrings.Count - 1 do
  begin
    S := AStrings[I];
    if S <> '' then
    begin
      GetTextExtentPoint32(DC, PChar(S), Length(S), TextSize);
      if ADestWidth > TextSize.cX then
        case ATitlePart of
          tpLeft:
            R.Right := R.Left + TextSize.cX;
          tpCenter:
            begin
              R.Left := ARect.Left + (ADestWidth - TextSize.cX) div 2;
              R.Right := R.Left + TextSize.cX;
            end;
          tpRight:
            R.Left := R.Right - TextSize.cX;
        end;
      if RectVisible(DC, R) then
      begin
        Windows.DrawText(DC, PChar(S), Length(S), R, uFormat or DT_LEFT);
        with R do
          ExcludeClipRect(DC, Left, Top, Right, Bottom);
      end;
      R.Right := ARect.Right;
    end;
    OffsetRect(R, 0, ALineHeight);
  end;
end;

procedure TdxPSReportRenderer.RenderPageHeaderOrFooterContent(HF: TCustomdxPageObject;
  APageIndex: Integer; ARect: TRect; ATitleParts: TdxPageTitleParts; ADrawBackground: Boolean);
var
  TextSize: TSize;
  LineHeight, DestWidth, DestHeight: Integer;
  TextAlignY: TdxTextAlignY;
begin
  if ADrawBackground then
    HF.Background.PaintEx(Canvas, ARect, PixelsNumerator, PixelsDenominator);

  if ATitleParts = [] then
    Exit;
  GetTextExtentPoint32(DC, 'Hg', 2, TextSize);
  LineHeight := TextSize.cY;
  DestWidth := ARect.Right - ARect.Left;
  DestHeight := ARect.Bottom - ARect.Top;

  if tpLeft in ATitleParts then
  begin
    if ReportLink.RealPrinterPage.ReverseTitlesOnEvenPages and Odd(APageIndex) then
    begin
      FHFStrings.Text := dxProcessHFString(HF.RightTitle.Text);
      TextAlignY := HF.TextAlignY[tpRight];
    end
    else
    begin
      FHFStrings.Text := dxProcessHFString(HF.LeftTitle.Text);
      TextAlignY := HF.TextAlignY[tpLeft];
    end;
    RenderPageHeaderOrFooterContentPart(tpLeft, FHFStrings, TextAlignY,
      LineHeight, DestWidth, DestHeight, ARect);
  end;

  if tpRight in ATitleParts then
  begin
    if ReportLink.RealPrinterPage.ReverseTitlesOnEvenPages and Odd(APageIndex) then
    begin
      FHFStrings.Text := dxProcessHFString(HF.LeftTitle.Text);
      TextAlignY := HF.TextAlignY[tpLeft];
    end
    else
    begin
      FHFStrings.Text := dxProcessHFString(HF.RightTitle.Text);
      TextAlignY := HF.TextAlignY[tpRight];
    end;
    RenderPageHeaderOrFooterContentPart(tpRight, FHFStrings, TextAlignY,
      LineHeight, DestWidth, DestHeight, ARect);
  end;

  if tpCenter in ATitleParts then
  begin
    FHFStrings.Text := dxProcessHFString(HF.CenterTitle.Text);
    TextAlignY := HF.TextAlignY[tpCenter];
    RenderPageHeaderOrFooterContentPart(tpCenter, FHFStrings, TextAlignY,
      LineHeight, DestWidth, DestHeight, ARect);
  end;
end;

procedure TdxPSReportRenderer.RenderPageTitle;
var
  R: TRect;
begin
  R := RenderInfo.TitleRect;
  OffsetWindowOrgEx(DC, -PageRenderInfo.TitleOffset.X, -PageRenderInfo.TitleOffset.Y, nil);
  if RectVisible(DC, R) then
    with ReportLink.ReportTitle do
      RenderPageTitleContent(Text, R, TextAlignX, TextAlignY, Color, Font, Transparent);
  OffsetWindowOrgEx(DC, PageRenderInfo.TitleOffset.X, PageRenderInfo.TitleOffset.Y, nil);
end;

procedure TdxPSReportRenderer.RenderPageContent;
var
  R: TRect;
  Rgn: HRGN;
  PrevFont: HFONT;
  PrevFontColor: COLORREF;
  I, H, StartIndex, EndIndex: Integer;
begin
  OffsetWindowOrgEx(DC, -PageRenderInfo.DataOffset.X, -PageRenderInfo.DataOffset.Y, nil);
  R := PageRenderInfo.ContentRect;
  OffsetRect(R, -R.Left, -R.Top);
  InflateRect(R, 0 {FHalfLineWidth}, FHalfLineWidth);
  Dec(R.Left, FHalfLineWidth);
  Rgn := IntersectClipRect(DC, R);

  SetBkMode(DC, Windows.TRANSPARENT);
  with RenderInfo.BaseContentFont do
  begin
    PrevFont := SelectObject(DC, Handle);
    PrevFontColor := SetTextColor(DC, ColorToRGB(Color));
  end;

  with PageRenderInfo do
  begin
    if IsHeaderExists then
    begin
      R := HeaderRect;
      OffsetRect(R, DetailRect.Left, 0);
      with RenderInfo.ReportCells do
        RenderPageContentPart(HeaderCells, 0, HeaderCells.CellCount - 1, R);
      with HeaderRect do
        ExcludeClipRect(DC, Left, Top, Right - Left, Bottom - Top);
      OffsetWindowOrgEx(DC, 0, -(HeaderRect.Bottom - HeaderRect.Top), nil);
    end;

    if IsDetailsExists then
    begin
      EndIndex := 0;
      for I := 0 to ContinuedIndexPairCount - 1 do
      begin
        StartIndex := ContinuedIndexes^[I].StartIndex;
        EndIndex := ContinuedIndexes^[I].EndIndex;
        RenderPageContentPart(RenderInfo.ReportCells.Cells, StartIndex, EndIndex, DetailRect);
      end;
      if IsBottomPage then
        H := RenderInfo.ReportCells.Cells[EndIndex].BoundsRect.Bottom
      else
        H := DetailRect.Bottom;
      Dec(H, DetailRect.Top);
      OffsetWindowOrgEx(DC, 0, -H, nil);
    end;

    if IsFooterExists then
    begin
      R := FooterRect;
      OffsetRect(R, DetailRect.Left, 0);
      with RenderInfo.ReportCells do
        RenderPageContentPart(FooterCells, 0, FooterCells.CellCount - 1, R);
    end;
  end;
  RestoreClipRgn(DC, Rgn);
  SetBkMode(DC, Windows.OPAQUE);
  SetTextColor(DC, PrevFontColor);
  SelectObject(DC, PrevFont);
end;

procedure TdxPSReportRenderer.RenderPageContentPart(ACell: TdxReportCell;
  StartIndex, EndIndex: Integer; const OriginRect: TRect);
var
  I: Integer;
  R: TRect;
begin
  for I := StartIndex to EndIndex do
    with ACell[I] do
    begin
      R := GetUsefulRect;
      {transform it into the coordinate space of page}
      OffsetRect(R, -OriginRect.Left, -OriginRect.Top);
      if RectVisible(DC, R) then
      begin
        if (R.Left <> 0) or (R.Top <> 0) then
          OffsetWindowOrgEx(DC, -R.Left, -R.Top, nil);
        DrawContent(DC, Rect(0, 0, R.Right - R.Left, R.Bottom - R.Top), OriginRect);
        if (R.Left <> 0) or (R.Top <> 0) then
          OffsetWindowOrgEx(DC, R.Left, R.Top, nil);
      end;
    end;
end;

function TdxPSReportRenderer.GetRenderInfo: TdxPSReportRenderInfo;
begin
  Result := FReportLink.RenderInfo;
end;

function TdxPSReportRenderer.GetUnitsPerInch: Integer;
begin
  Result := RenderInfo.UnitsPerInch;
end;

function TdxPSReportRenderer.GetPageRenderInfo: TdxPSPageRenderInfo;
begin
  Result := RenderInfo.PageRenderInfos^[RenderingPageIndex];
end;

procedure TdxPSReportRenderer.PrepareCanvasForCustomDraw(AFont: PFont; AColor: PColor);
begin
  FSaveFont.Assign(Canvas.Font);
  if AFont <> nil then
    Canvas.Font := AFont^;
  FSaveColor := Canvas.Brush.Color;
  if AColor <> nil then
    Canvas.Brush.Color := AColor^;
end;

procedure TdxPSReportRenderer.UnprepareCanvasForCustomDraw;
begin
  Canvas.Brush.Color := FSaveColor;
  Canvas.Font := FSaveFont;
end;

procedure TdxPSReportRenderer.PrepareFonts;
var
  UPI: Integer;
begin
  UPI := RenderInfo.UnitsPerInch;
  if not ReportLink.ScaleFonts and (ReportLink.RealScaleFactor <> 100) then
    UPI := MulDiv(UPI, 100, ReportLink.RealScaleFactor);
  ReportLink.PrepareFonts(UPI);
end;

procedure TdxPSReportRenderer.PrepareGDIObjects;
begin
  FBtnHighLightPen := CreatePen(PS_SOLID, 0, GetSysColor(COLOR_BTNHIGHLIGHT));
  FBtnShadowPen := CreatePen(PS_SOLID, 0, GetSysColor(COLOR_BTNSHADOW));
  FBorderBrush := CreateSolidBrush(ColorToRGB(RenderInfo.GridLinesColor));
end;

procedure TdxPSReportRenderer.PrepareLogicalCoordinates;
begin
  SetMapMode(DC, MM_ISOTROPIC);
  PrepareWindow;
  PrepareViewPort;
//  MoveToEx(DC, 0, 0, nil);
end;

procedure TdxPSReportRenderer.PrepareLogicalUnits;
var
  R: TRect;
  UnitsPerPt: Integer;
begin
  R := Rect(0, 0, 1, 1);
  DPToLP(DC, R, 2);
  FUnitsPerPixel := R.Right - R.Left;
  if Odd(FUnitsPerPixel) then Dec(FUnitsPerPixel);
  if FUnitsPerPixel = 0 then FUnitsPerPixel := 1;

  //FLineWidth := Point(MulDiv(FUnitsPerPt, 3, 4), MulDiv(FUnitsPerPt, 3, 4));
  //UnitsPerPt := MulDiv(RenderInfo.UnitsPerMM, 254, 10 * FPtPerInch);

  UnitsPerPt := MulDiv(FUnitsPerPixel, PPI, FPtPerInch);

  if IsPrinterDC(DC) then
    FLineWidth := UnitsPerPt div 2
  else
  begin
    FLineWidth := FUnitsPerPixel;
    if ZoomFactor > 100 then
      FLineWidth := FLineWidth * (ZoomFactor div 100);
  end;

  FHalfLineWidth := FLineWidth div 2;
  FPixelsNumerator := RenderInfo.UnitsPerInch;
end;

procedure TdxPSReportRenderer.PrepareRenderPage;
begin
  RenderInfo.Lock;
  SaveMapMode;
  PrepareLogicalCoordinates;
  PrepareLogicalUnits;
  PrepareFonts;
  PrepareGDIObjects;
end;

procedure TdxPSReportRenderer.PrepareWindow;
begin
  with RenderInfo do
  begin
    SetWindowExtEx(DC, PageSize.X, PageSize.Y, nil);
    ScaleWindowExtEx(DC, WindowScalePair.Numerator, WindowScalePair.Denominator,
      WindowScalePair.Numerator, WindowScalePair.Denominator, nil);
  end;
end;

procedure TdxPSReportRenderer.PrepareViewPort;
begin
  with ViewPortRect do
  begin
    SetViewPortExtEx(DC, Right - Left, Bottom - Top, nil);
    SetViewPortOrgEx(DC, Left, Top, nil);
  end;
end;

procedure TdxPSReportRenderer.RestoreMapMode;
begin
  SetMapMode(DC, FPrevMode);
  SetWindowExtEx(DC, FPrevWindowExt.cX, FPrevWindowExt.cY, nil);
  SetViewPortOrgEx(DC, FPrevViewPortOrg.X, FPrevViewPortOrg.Y, nil);
  SetViewPortExtEx(DC, FPrevViewPortExt.cX, FPrevViewPortExt.cY, nil);
  SetWindowOrgEx(DC, FPrevWindowOrg.X, FPrevWindowOrg.Y, nil);
end;

procedure TdxPSReportRenderer.SaveMapMode;
begin
  FPrevMode := GetMapMode(DC);
  GetWindowExtEx(DC, FPrevWindowExt);
  GetWindowOrgEx(DC, FPrevWindowOrg);
  GetViewPortExtEx(DC, FPrevViewPortExt);
  GetViewPortOrgEx(DC, FPrevViewPortOrg);
end;

procedure TdxPSReportRenderer.UnprepareGDIObjects;
begin
  DeleteObject(FBorderBrush);
  DeleteObject(FBtnShadowPen);
  DeleteObject(FBtnHighLightPen);
end;

procedure TdxPSReportRenderer.UnprepareRenderPage;
begin
  UnprepareGDIObjects;
  RestoreMapMode;
  RenderInfo.Unlock;
end;


{ TBasedxReportLink }

constructor TBasedxReportLink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FActive := False;
  FAssignedFormatValues := [];
  FColor := dxDefaultColor; {clWhite}
  FCurrentPage := 1;
  FDateFormat := 0;
  FDesignerCaption := sdxReportDesignerCaption;
  FFont := TFont.Create;
  FFont.OnChange := FontChanged;
  FFont.Name := dxDefaultFont; {Times New Roman}
  FFootersOnEveryPage := False;
  FHeadersOnEveryPage := False;
  FPageNumberFormat := pnfNumeral;
  FPrinterPage := TdxReportLinkPrinterPage.Create;
  TdxReportLinkPrinterPage(FPrinterPage).FReportLink := Self;
  FReportTitle := TdxReportTitle.Create(Self);
  FScaleFonts := True;
  FStreamedActive := False;
  FShrinkToPageWidth := False;
  FShowEmptyPages := False;
  FShowPageFooter := True;
  FShowPageHeader := True;
  FSubscriber := TdxPageParamsChangedSubscriber.Create([TdxSMPageParamsChangedEvent]);
  TdxPageParamsChangedSubscriber(FSubscriber).OnPageParamsChanged := PageParamsChange;
  FStartPageIndex := 1;
  FTimeFormat := 0;
  FTransparent := True;
  FUseHorzDelimiters := True;
  FUseVertDelimiters := True;  
end;

destructor TBasedxReportLink.Destroy;
begin
//  if not IsDesigning and (dxPSEngine.RealRegistryPath <> '') then
//    SaveToRegistry(dxPSEngine.RealRegistryPath + sdxReportLinksRegistryPath + '\' + Name);
 {$IFNDEF DELPHI4}
  DoDestroy;
 {$ENDIF}
 {$IFNDEF DELPHI5}
  Destroying;
 {$ENDIF}
  ComponentPrinter := nil;
  Component := nil;
  DoDestroyReport; {2.0}
  if FRenderer <> nil then FRenderer.Free;
  if FRenderInfo <> nil then FRenderInfo.Free;
  FSubscriber.Free;
  FReportTitle.Free;
  FReportTitle := nil;
  FPrinterPage.Free;
  FPrinterPage := nil;
  if FFontPool <> nil then FFontPool.Free;
  FFont.Free;
  FFont := nil;
  if FBrushPool <> nil then FBrushPool.Free;
  inherited Destroy;
end;

{$IFDEF DELPHI4}

procedure TBasedxReportLink.BeforeDestruction;
begin
  inherited BeforeDestruction;
  DoDestroy;
end;
{$ENDIF}

procedure TBasedxReportLink.SetName(const NewName: TComponentName);
begin
  inherited SetName(NewName);
  DesignerUpdate(False);
end;

procedure TBasedxReportLink.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
    if AComponent = Component then
      Component := nil
    else
      if AComponent = StyleManager then
        StyleManager := nil;
end;

procedure TBasedxReportLink.Loaded;
begin
  inherited Loaded;
//  if not IsDesigning and (dxPSEngine.RealRegistryPath <> '') then
//    LoadFromRegistry(dxPSEngine.RealRegistryPath + sdxReportLinksRegistryPath + '\' + Name);
end;

procedure TBasedxReportLink.Assign(Source: TPersistent);
begin
  if Source is TBasedxReportLink then
  begin
    Color := TBasedxReportLink(Source).Color;
    DateFormat := TBasedxReportLink(Source).DateFormat;
    Font := TBasedxReportLink(Source).Font;
    FootersOnEveryPage := TBasedxReportLink(Source).FootersOnEveryPage;
    HeadersOnEveryPage := TBasedxReportLink(Source).HeadersOnEveryPage;
    PageNumberFormat := TBasedxReportLink(Source).PageNumberFormat;
    RealPrinterPage := TBasedxReportLink(Source).RealPrinterPage;
    ReportTitle := TBasedxReportLink(Source).ReportTitle;
    ScaleFonts := TBasedxReportLink(Source).ScaleFonts;
    ShowEmptyPages := TBasedxReportLink(Source).ShowEmptyPages;
    ShowPageFooter := TBasedxReportLink(Source).ShowPageFooter;
    ShowPageHeader := TBasedxReportLink(Source).ShowPageHeader;
    ShrinkToPageWidth := TBasedxReportLink(Source).ShrinkToPageWidth;
    TimeFormat := TBasedxReportLink(Source).TimeFormat;
    Transparent := TBasedxReportLink(Source).Transparent;
  end
  else
    if Source is TBasedxPrintStyle then
      PrinterPage := TBasedxPrintStyle(Source).PrinterPage
    else
      inherited Assign(Source)
end;

procedure TBasedxReportLink.AssignTo(Dest: TPersistent);
begin
  if Dest is TBasedxPrintStyle then
    TBasedxPrintStyle(Dest).PrinterPage := PrinterPage
  else
    inherited AssignTo(Dest);
end;

procedure TBasedxReportLink.DefaultHandler(var message);
begin
  inherited DefaultHandler(message);
  TdxReportLinkPrinterPage(PrinterPage).UpdateMeasurementUnits;
end;

procedure TBasedxReportLink.SetParentComponent(AParent: TComponent);
begin
  inherited SetParentComponent(AParent);
  if not IsLoading then
    ComponentPrinter := AParent as TCustomdxComponentPrinter;
end;

function TBasedxReportLink.GetParentComponent: TComponent;
begin
  Result := ComponentPrinter;
end;

function TBasedxReportLink.HasParent: Boolean;
begin
  Result := ComponentPrinter <> nil;
end;

procedure TBasedxReportLink.ReadState(Reader: TReader);
begin
  inherited ReadState(Reader);
  if Reader.Parent is TCustomdxComponentPrinter then
    ComponentPrinter := Reader.Parent as TCustomdxComponentPrinter;
end;

function TBasedxReportLink.IsDesigning: Boolean;
begin
  Result := csDesigning in ComponentState;
end;

procedure TBasedxReportLink.BeforePrinting;
begin
  if CurrentPrintStyle <> nil then
    CurrentPrintStyle.BeforePrinting;
end;

procedure TBasedxReportLink.AfterPrinting;
begin
  if CurrentPrintStyle <> nil then
    CurrentPrintStyle.AfterPrinting;
end;

procedure TBasedxReportLink.DesignerUpdate(TheAll: Boolean);
begin
  if ComponentPrinter <> nil then
    if TheAll then
      ComponentPrinter.DesignerUpdate(nil)
    else
      ComponentPrinter.DesignerUpdate(Self);
end;

procedure TBasedxReportLink.DoApplyInDesigner;
begin
  RebuildReport;
end;

function TBasedxReportLink.IsLoading: Boolean;
begin
  Result := csLoading in ComponentState;
end;

function TBasedxReportLink.GetRealPrinterPage: TdxPrinterPage;
var
  Style: TBasedxPrintStyle;
begin
  Style := CurrentPrintStyle;
  if Style <> nil then
    Result := Style.PrinterPage
  else
    Result := FPrinterPage;
end;

procedure TBasedxReportLink.SetRealPrinterPage(Value: TdxPrinterPage);
begin
  RealPrinterPage.Assign(Value);
end;

function TBasedxReportLink.GetRealScaleFactor: Integer;
var
  PaintW {, PaintH}: Integer;
begin
  with RealPrinterPage do
    if ScaleMode = smAdjust then
      Result := ScaleFactor
    else
    begin
      //PaintW := 1 * MulDiv(PaintRectLoMetric.Right - PaintRectLoMetric.Left, UnitsPerMM, 10);
      PaintW := 1 * MulDiv(PaintRectLoMetric.Right - PaintRectLoMetric.Left, FUnitsPerInch, 254);
//      PaintW := FitToPagesByWide * MulDiv(R.Right - R.Left, UnitsPerMM, 10);
//      PaintH := FitToPagesByTall * MulDiv(R.Bottom - R.Top, UnitsPerMM, 10);
      Result := MulDiv(PaintW, 100, ReportWidth) - 1;
//      Result := Trunc(PaintW * 100 / ReportWidth);   //TODO: look
      {
      if (ReportWidth / ReportHeight >  PaintW / PaintH) then
        Result := MulDiv(PaintW, 100, ReportWidth) - 1
      else
        Result := MulDiv(PaintH, 100, ReportHeight) - 1;
      }
    end;
end;

function TBasedxReportLink.GetReportWidth: Integer;
begin
  Result := FReportWidth;
end;

procedure TBasedxReportLink.DefineStylesClick(Sender: TObject);
begin
  DefinePrintStylesDlg;
end;

procedure TBasedxReportLink.StyleClick(Sender: TObject);
var
  PreviewBtnClicked, PrintBtnClicked: Boolean;
  PrevCurrentStyle, Style: TBasedxPrintStyle;
begin
  if StyleManager = nil then Exit;
  
  try
    Style := dxPSActivePageSetupMenuBuilderClass.ExtractPrintStyleFromObj(Sender);
  except
    Style := nil;
    Application.HandleException(Self);
  end;
  if Style = nil then Exit;

  PrevCurrentStyle := StyleManager.CurrentStyle;
  StyleManager.CurrentStyle := Style;
  if (ComponentPrinter <> nil) and not ComponentPrinter.IsForegroundPreviewWindow then 
  begin
    PreviewBtnClicked := False;
    PrintBtnClicked := False;
    if not PageSetupEx(0, @PreviewBtnClicked, @PrintBtnClicked) then
      StyleManager.CurrentStyle := PrevCurrentStyle;
    if PrintBtnClicked then
      Print(True, nil)
    else
      if PreviewBtnClicked then Preview(True);
  end;
end;

procedure TBasedxReportLink.BuildPageSetupMenu(ARootItem: TComponent;
  AData: Pointer; AIncludeDefineItem: Boolean{$IFDEF DELPHI4} = True{$ENDIF});
var
  MenuBuilder: TAbstractdxPSPageSetupMenuBuilder;
  Styles: TStringList;
begin
  if StyleManager = nil then Exit;
  MenuBuilder := dxPSActivePageSetupMenuBuilderClass.Create;
  try
    try
      Styles := TStringList.Create;
      try
        GetFilteredStyles(Styles);
        MenuBuilder.BuildPageSetupMenu(ARootItem, AData, AIncludeDefineItem,
          Styles, CurrentPrintStyle, StyleClick, DefineStylesClick);
      finally
        Styles.Free;
      end;
    except
      Application.HandleException(Self);
    end;
  finally
    MenuBuilder.Free;
  end;
end;

procedure TBasedxReportLink.SetCurrentPage(Value: Integer);
begin
  if Value < 1 then Value := 1;
  if Value > PageCount then Value := PageCount;
  FCurrentPage := Value;
end;

procedure TBasedxReportLink.DoCustomDrawEntirePage(ACanvas: TCanvas; R: TRect;
  ARealPageIndex: Integer);
var
  Nom: Integer;
begin
  with ComponentPrinter do
  begin
    Nom := 100;
    if PreviewExists then Nom := PreviewWindow.ZoomFactor;
    DoCustomDrawEntirePage(Self, ACanvas, ARealPageIndex, R, Nom, 100);
  end;
end;

procedure TBasedxReportLink.DoCustomDrawPageHeaderOrFooter(AHFObject: TCustomdxPageObject;
  ACanvas: TCanvas; APageIndex: Integer; R: TRect;
  var ADefaultDrawText, ADefaultDrawBackground: Boolean);
begin
  ComponentPrinter.DoCustomDrawPageHeaderOrFooter(Self, AHFObject, ACanvas,
    APageIndex, R, ADefaultDrawText, ADefaultDrawBackground);

  if ADefaultDrawText or ADefaultDrawBackground then
    if AHFObject is TdxPageHeader then
    begin
      if Assigned(FOnCustomDrawPageHeader) then
        FOnCustomDrawPageHeader(Self, ACanvas, APageIndex, R,
          PixelsNumerator, PixelsDenominator, ADefaultDrawText, ADefaultDrawBackground)
    end
    else
      if Assigned(FOnCustomDrawPageFooter) then
        FOnCustomDrawPageFooter(Self, ACanvas, APageIndex, R,
          PixelsNumerator, PixelsDenominator, ADefaultDrawText, ADefaultDrawBackground);
end;

procedure TBasedxReportLink.DoCustomDrawPageTitle(ACanvas: TCanvas; R: TRect;
  var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY;
  var AColor: TColor; AFont: TFont; var ADone: Boolean);
begin
  ComponentPrinter.DoCustomDrawReportTitle(Self, ACanvas, R, ATextAlignX, ATextAlignY,
    AColor, AFont, ADone);
  if not ADone and Assigned(FOnCustomDrawReportLinkTitle) then
    FOnCustomDrawReportLinkTitle(Self, ACanvas, R, PixelsNumerator,
      PixelsDenominator, ATextAlignX, ATextAlignY, AColor, AFont, ADone);
end;

procedure TBasedxReportLink.PaintPage(ACanvas: TCanvas; const APageRect: TRect;
  APageIndex, AZoomFactor: Integer); //; ARenderer: TdxPSReportRenderer);
var
  VirtualPageIndex, RealPageIndex: Integer;
begin
  RenderInfo.CalcPageRealAndVirtualIndexes(APageIndex, VirtualPageIndex, RealPageIndex);
  if not RenderInfo.CanRenderPage(VirtualPageIndex) then Exit;

  if dxHFFormatObject <> nil then
    dxHFFormatObject.CurrentPage := RealPageIndex + 1;

  FPainting := True;
  try
    Renderer.RenderPage(ACanvas, APageRect, VirtualPageIndex, RealPageIndex, AZoomFactor);
  finally
    FPainting := False;
  end;
end;

function TBasedxReportLink.IsEntirePageCustomDrawn: Boolean;
begin
  Result := Assigned(ComponentPrinter.FOnCustomDrawPage);
end;

function TBasedxReportLink.IsHeaderOrFooterCustomDrawn(AHFObject: TCustomdxPageObject): Boolean;
begin
  if AHFObject is TdxPageHeader then
    Result := Assigned(ComponentPrinter.FOnCustomDrawPageHeader) or Assigned(FOnCustomDrawPageHeader)
  else
    Result := Assigned(ComponentPrinter.FOnCustomDrawPageFooter) or Assigned(FOnCustomDrawPageFooter);
end;

function TBasedxReportLink.IsTitleCustomDrawn: Boolean;
begin
  Result :=
    Assigned(ComponentPrinter.FOnCustomDrawReportTitle) or
    Assigned(FOnCustomDrawReportLinkTitle);
end;

function TBasedxReportLink.PageSetup: Boolean;
var
  PreviewBtnClicked, PrintBtnClicked: Boolean;
begin
  PreviewBtnClicked := False;
  PrintBtnClicked := False;
  Result := PageSetupEx(0, @PreviewBtnClicked, @PrintBtnClicked);
  if PreviewBtnClicked then
    Preview(True)
  else
    if PrintBtnClicked then
      Result := Print(True, nil);
end;

function TBasedxReportLink.PageSetupEx(AActivePageIndex: Integer;
  APreviewBtnClicked, APrintBtnClicked: PBoolean): Boolean;
var
  PrintStyle: TBasedxPrintStyle;
  PrintStyleExists: Boolean;
begin
  PrintStyle := CurrentPrintStyle;
  PrintStyleExists := PrintStyle <> nil;
  if not PrintStyleExists then PrintStyle := TdxPSPrintStyle.Create(nil);
  try
    if not PrintStyleExists then PrintStyle.Assign(Self);

    if ComponentPrinter <> nil then
      ComponentPrinter.PreparePageSetup;
    if not DataProviderPresent then
    begin
      APreviewBtnClicked := nil;
      APrintBtnClicked := nil;
    end;
    Result :=
      PrintStyle.PageSetupEx(AActivePageIndex, APreviewBtnClicked, APrintBtnClicked);
    if ComponentPrinter <> nil then
      ComponentPrinter.UnpreparePageSetup;

    if Result and not PrintStyleExists then
      Self.Assign(PrintStyle);

    if ComponentPrinter <> nil then ComponentPrinter.DoPageSetup(Self, Result);
  finally
    if not PrintStyleExists then PrintStyle.Free;
  end;
end;

function TBasedxReportLink.IsSupportedStyle(APrintStyle: TBasedxPrintStyle): Boolean;
begin
  Result := True;
  if Assigned(FOnFilterStyle) then
  begin
    FOnFilterStyle(Self, APrintStyle, Result);
    if not Result and (APrintStyle = CurrentPrintStyle) then
      Result := True;
  end;
end;

procedure TBasedxReportLink.GetFilteredStyles(AStrings: TStrings);
var
  I: Integer;
  Style: TBasedxPrintStyle;
begin
  if StyleManager <> nil then
    for I := 0 to StyleManager.Count - 1 do
    begin
      Style := StyleManager.Styles[I];
      if IsSupportedStyle(Style) then
        AStrings.AddObject(Style.StyleCaption, Style);
    end;
end;

procedure TBasedxReportLink.Preview(Modal: Boolean{$IFDEF DELPHI4} = True{$ENDIF});
begin
  if ComponentPrinter <> nil then
  begin
    ComponentPrinter.CurrentLink := Self;
    ComponentPrinter.Preview(Modal, Self);
  end;
end;

function TBasedxReportLink.Print(AShowDialog: Boolean; APrintDlgData: PdxPrintDlgData): Boolean;
begin
  if ComponentPrinter <> nil then
  begin
    ComponentPrinter.CurrentLink := Self;
    Result := ComponentPrinter.Print(AShowDialog, APrintDlgData, Self);
  end
  else
    Result := False;
end;

procedure TBasedxReportLink.PrintEx(APageNums: TdxPageNumbers;
  ACopies: Integer; ACollate: Boolean);
begin
  if ComponentPrinter <> nil then
  begin
    ComponentPrinter.CurrentLink := Self;
    ComponentPrinter.PrintEx(APageNums, ACopies, ACollate, Self);
  end;
end;

procedure TBasedxReportLink.PrintPages(const APageIndexes: array of Integer);
begin
  if ComponentPrinter <> nil then
  begin
    ComponentPrinter.CurrentLink := Self;
    ComponentPrinter.PrintPages(APageIndexes, Self);
  end;
end;

procedure TBasedxReportLink.PrintPagesEx(const APageIndexes: array of Integer;
  APageNums: TdxPageNumbers; ACopies: Integer; ACollate: Boolean);
begin
  if ComponentPrinter <> nil then
  begin
    ComponentPrinter.CurrentLink := Self;
    ComponentPrinter.PrintPagesEx(APageIndexes, APageNums, ACopies, ACollate, Self);
  end;
end;

procedure TBasedxReportLink.DoMeasureReportLinkTitle(var AHeight: Integer);
begin
  if ComponentPrinter <> nil then
    ComponentPrinter.DoMeasureReportTitle(Self, AHeight);
  if Assigned(FOnMeasureReportLinkTitle) then
    FOnMeasureReportLinkTitle(Self, AHeight);
end;

procedure TBasedxReportLink.GetPageColRowCount(var APageColCount, APageRowCount: Integer);
begin
  APageColCount := RenderInfo.PageColCount;
  APageRowCount := RenderInfo.PageRowCount;
end;

function TBasedxReportLink.GetPageCount: Integer;
begin
  Result := RenderInfo.NonEmptyPageCount;
  if IsCurrentLink and (dxHFFormatObject <> nil) then
    dxHFFormatObject.TotalPages := Result;
end;

function TBasedxReportLink.GetVirtualPageCount: Integer;
begin
  Result := RenderInfo.VirtualPageCount;
end;

function TBasedxReportLink.GetVisiblePageCount: Integer;
begin
  if ShowEmptyPages then
    Result := VirtualPageCount
  else
    Result := PageCount;
end;

function TBasedxReportLink.GetEmptyPagesCanExist: Boolean;
begin
  Result := False;
end;

function TBasedxReportLink.VirtualPageIndexToRealPageIndex(APageIndex: Integer): Integer;
begin
  Result := RenderInfo.VirtualPageIndexToRealPageIndex(APageIndex)
end;

function TBasedxReportLink.RealPageIndexToVirtualPageIndex(APageIndex: Integer;
  ATakeIntoAccountEmptyPages: Boolean): Integer;
begin
  Result := RenderInfo.RealPageIndexToVirtualPageIndex(APageIndex, ATakeIntoAccountEmptyPages);
end;

function TBasedxReportLink.NeedCalcEmptyPages: Boolean;
begin
  Result := EmptyPagesCanExist and not UsingShrinkToPageWidthMode;
end;

function TBasedxReportLink.PageReady(APageIndex: Integer): Boolean;
begin
  Result := True;
end;

procedure TBasedxReportLink.PrepareFonts(UPI: Integer);
begin
  if FFontPool <> nil then FontPool.PrepareFonts(UPI);
end;

procedure TBasedxReportLink.PrepareLongOperation;
begin
  if ComponentPrinter <> nil then ComponentPrinter.PrepareLongOperation;
end;

procedure TBasedxReportLink.UnprepareLongOperation;
begin
  if ComponentPrinter <> nil then ComponentPrinter.UnprepareLongOperation;
end;

procedure TBasedxReportLink.SetActive(Value: Boolean);
begin
  if (csReading in ComponentState) and Value then
    FStreamedActive := Value
  else
    if FActive <> Value then
    begin
      FActive := Value;
      if FActive then
      begin
        if DataProviderPresent then
        try
          if ComponentPrinter <> nil then ComponentPrinter.PrepareBuildReport(Self);
          try
            DoCreateReport;
            FRebuildNeeded := False;
          finally
            if ComponentPrinter <> nil then ComponentPrinter.UnprepareBuildReport(Self);
          end;
        except
          on E: Exception do
          begin
            FActive := False;
            DoDestroyReport;
            if IsDesigning then
              ShowException(E, ExceptAddr)
            else
              raise;
          end;
        end
        else
        begin
          FActive := False;
          raise EdxReportLink.Create(sdxMissingComponent);
        end
      end
      else
        DoDestroyReport;
    end;
end;

procedure TBasedxReportLink.RebuildReport;
begin
  Active := False;
  Active := True;
end;

function TBasedxReportLink.IsEmptyPage(AVirtualPageIndex: Integer): Boolean;
begin
  if (AVirtualPageIndex > -1) and (AVirtualPageIndex < RenderInfo.VirtualPageCount) then
    Result := RenderInfo.PageRenderInfos^[AVirtualPageIndex].IsEmptyPage
  else
    Result := True;
end;

function TBasedxReportLink.IsEmptyReport: Boolean;
begin
  Result := (FRenderInfo = nil) or (RenderInfo.NonEmptyPageCount = 0);
end;

procedure TBasedxReportLink.DestroyReport;
begin
  Active := False;
end;

procedure TBasedxReportLink.DoCreateReport;
begin
  if CurrentPrintStyle is TdxPSPrintStyle then
    TdxPSPrintStyle(CurrentPrintStyle).BeforeGenerating;
  try
    PrepareLongOperation;
    try
      FReportCells := TdxReportCells.Create(Self);
      ConstructReport(FReportCells);
  {!} FPixelsNumerator := RenderInfo.UnitsPerInch;
      ConvertRects;
      with FReportCells.BoundsRect do
      begin
  {2.0} FReportWidth := Right - Left; // + 1;
  {2.0} FReportHeight := Bottom - Top; // + 1;
      end;

      RenderInfo.GetDelimiters;
      CalcRenderInfos;

      if (ComponentPrinter = nil) or ComponentPrinter.AutoUpdateDateTime then
        DateTime := Now;
    finally
      UnprepareLongOperation;
    end;
  finally
    if CurrentPrintStyle is TdxPSPrintStyle then
      TdxPSPrintStyle(CurrentPrintStyle).AfterGenerating;
  end;
end;

procedure TBasedxReportLink.ConvertRects;

  procedure PrepareRect(var R: TRect; ANum, ADenom: Integer);
  begin
    with R do
    begin
      Left := MulDiv(Left, ANum, ADenom);
      Right := MulDiv(Right, ANum, ADenom);
      Top := MulDiv(Top, ANum, ADenom);
      Bottom := MulDiv(Bottom, ANum, ADenom);
    end;
  end;

  procedure Iterate(Cell: TdxReportCell);
  var
    I: Integer;
  begin
    with Cell do
    begin
      for I := 0 to DataItemCount - 1 do
        PrepareRect(DataItems[I].FBoundsRect, PixelsNumerator, PixelsDenominator);
      PrepareRect(FBoundsRect, PixelsNumerator, PixelsDenominator);
      for I := 0 to CellCount - 1 do
        Iterate(Cells[I]);
    end;
  end;

begin
  with FReportCells do
  begin
    Iterate(Cells);
    if FHeaderCells <> nil then Iterate(HeaderCells);
    if FFooterCells <> nil then Iterate(FooterCells);
  end;
end;

procedure TBasedxReportLink.DoDestroyReport;
begin
  PrepareLongOperation;
  try
    if FReportCells <> nil then FReportCells.Free;
    FReportCells := nil;
    FReportWidth := 0;
    FReportHeight := 0;
    RenderInfo.FreeRenderInfos;
  finally
    UnprepareLongOperation;
  end;
end;

procedure TBasedxReportLink.SetComponent(Value: TComponent);
begin
  if csReading in ComponentState then
    FComponent := Value
  else
    if FComponent <> Value then
    begin
      if (ComponentPrinter <> nil) and ComponentPrinter.PreviewExists then
        ComponentPrinter.DestroyPreviewWindow;
      if Value <> nil then
      begin
        if IsSupportedCompClass(TComponentClass(Value.ClassType)) then
        begin
          FComponent := Value;
  //{2.0}   if not IsLoading then RestoreFromOriginal;
          if Active or FStreamedActive then
          try
            if FStreamedActive then FStreamedActive := False;
            RebuildReport;
            if not IsLoading and (ComponentPrinter <> nil) and not ComponentPrinter.AutoUpdateDateTime then
              DateTime := Now;
            LinkModified(False);
          except
            on E: Exception do
            begin
              FComponent := nil;
              if IsDesigning then
                ShowException(E, ExceptAddr)
              else
                raise;
            end;
          end;
          Value.FreeNotification(Self);
        end
        else
          if not IsDesigning then
            raise EdxReportLink.CreateFmt(sdxComponentNotSupportedByLink, [Value.ClassName]);
      end
      else
      begin
        Active := False;
        FComponent := nil;
      end;
      if [csDestroying, csLoading] * ComponentState = [] then
      begin
        DoChangeComponent;
        if ComponentPrinter <> nil then ComponentPrinter.DoChangeComponent(Self);
        DesignerUpdate(False);
      end;
    end;
end;

procedure TBasedxReportLink.SetShowPageFooter(Value: Boolean);
begin
  if FShowPageFooter <> Value then
  begin
    FShowPageFooter := Value;
    CalcRenderInfos;
  end;
end;

procedure TBasedxReportLink.SetShowPageHeader(Value: Boolean);
begin
  if FShowPageHeader <> Value then
  begin
    FShowPageHeader := Value;
    CalcRenderInfos;
  end;
end;

function TBasedxReportLink.GetShrinkToPageWidth: Boolean;
begin
  with RealPrinterPage do
    Result := ScaleMode = smFit; // and (FitToPagesByTall = 1) and (FitToPagesByWide = 1);
end;

procedure TBasedxReportLink.SetShrinkToPageWidth(Value: Boolean);
begin
  if ShrinkToPageWidth <> Value then
  begin
    FShrinkToPageWidth := Value;
    PrepareLongOperation;
    try
      with RealPrinterPage do
      begin
        BeginUpdate;
        try
          if Value then
          begin
            FitToPagesByTall := 1;
            FitToPagesByWide := 1;
          end;
          ScaleMode := TdxScaleMode(Value);
        finally
          EndUpdate;
        end;
      end;
    finally
      UnprepareLongOperation;
    end;
  end;
end;

function TBasedxReportLink.UsingShrinkToPageWidthMode: Boolean;
begin
  Result := RealPrinterPage.ScaleMode = smFit;
end;

procedure TBasedxReportLink.DrawPageHeader(APageIndex: Integer; ARect: TRect;
  ATitleParts: TdxPageTitleParts; ADrawBackground: Boolean);
begin
  if FPainting then
    Renderer.RenderPageHeaderOrFooterContent(RealPrinterPage.PageHeader,
      APageIndex, ARect, ATitleParts, ADrawBackground);
end;

procedure TBasedxReportLink.DrawPageFooter(APageIndex: Integer; ARect: TRect;
  ATitleParts: TdxPageTitleParts; ADrawBackground: Boolean);
begin
  if FPainting then
    Renderer.RenderPageHeaderOrFooterContent(RealPrinterPage.PageFooter,
      APageIndex, ARect, ATitleParts, ADrawBackground);
end;

procedure TBasedxReportLink.DrawCheckBox(Canvas: TCanvas;
  var R: TRect; Checked, Enabled, FlatBorder: Boolean);
begin
  if FPainting then
    Renderer.DrawCheckBox(Canvas.Handle, R, Checked, Enabled, FlatBorder);
end;

procedure TBasedxReportLink.DrawEdge(Canvas: TCanvas; var R: TRect;
  EdgeMode: TdxCellEdgeMode; InnerEdge, OuterEdge: TdxCellEdgeStyle;
  Sides: TdxCellSides{$IFDEF DELPHI4} = [csLeft..csBottom]{$ENDIF});
begin
  if FPainting then
    Renderer.DrawEdge(Canvas.Handle, R, EdgeMode, InnerEdge, OuterEdge, Sides);
end;

procedure TBasedxReportLink.DrawGraphic(Canvas: TCanvas; var R: TRect;
  const ClipRect: TRect; ImageList: {$IFDEF DELPHI4}TCustomImageList{$ELSE}TImageList{$ENDIF};
  ImageIndex: Integer; Graphic: TGraphic; GraphicTransparent, Transparent: Boolean;
  BkColor: TColor);
begin
  if FPainting then
    Renderer.DrawGraphic(Canvas.Handle, R, ClipRect, ImageList, ImageIndex,
      Graphic, GraphicTransparent, Transparent, BkColor);
end;

procedure TBasedxReportLink.DrawSortMark(Canvas: TCanvas; var R: TRect;
  SortOrder: TdxCellSortOrder; Mono: Boolean);
begin
  if FPainting and (SortOrder <> csoNone) then
    Renderer.DrawSortMark(Canvas.Handle, R, SortOrder, Mono);
end;

procedure TBasedxReportLink.DrawText(Canvas: TCanvas; var R: TRect; AIndent: Integer;
  const Text: string; Font: TFont; BkColor: TColor; TextAlignX: TdxTextAlignX;
  TextAlignY: TdxTextAlignY; FillBackground, Multiline, EndEllipsis: Boolean);
begin
  if FPainting then
    Renderer.DrawText(Canvas.Handle, R, AIndent, Text, Font, BkColor,
      TextAlignX, TextAlignY, FillBackground, Multiline, EndEllipsis);
end;

procedure TBasedxReportLink.SetShowEmptyPages(Value: Boolean);
begin
  if FShowEmptyPages <> Value then
  begin
    FShowEmptyPages := Value;
    if EmptyPagesCanExist then CalcRenderInfos;
  end;
end;

procedure TBasedxReportLink.SetDateTime(const Value: TDateTime);
begin
  if FDateTime <> Value then
  begin
    FDateTime := Value;
    if IsCurrentLink and (dxHFFormatObject <> nil) then
      dxHFFormatObject.DateTime := DateTime;
  end;
end;

function TBasedxReportLink.GetDateFormat: Integer;
begin
  if not (fvDate in FAssignedFormatValues) and (ComponentPrinter <> nil) then
    Result := ComponentPrinter.DateFormat
  else
    Result := FDateFormat;
end;

function TBasedxReportLink.GetTimeFormat: Integer;
begin
  if not (fvTime in FAssignedFormatValues) and (ComponentPrinter <> nil) then
    Result := ComponentPrinter.TimeFormat
  else
    Result := FTimeFormat;
end;

function TBasedxReportLink.GetPageNumberFormat: TdxPageNumberFormat;
begin
  if not (fvPageNumber in FAssignedFormatValues) and (ComponentPrinter <> nil) then
    Result := ComponentPrinter.PageNumberFormat
  else
    Result := FPageNumberFormat;
end;

function TBasedxReportLink.DefaultDateFormat: Integer;
begin
  if not (fvDate in FAssignedFormatValues) and (ComponentPrinter <> nil) then
    Result := ComponentPrinter.DateFormat
  else
    Result := 0;
end;

function TBasedxReportLink.DefaultTimeFormat: Integer;
begin
  if not (fvTime in FAssignedFormatValues) and (ComponentPrinter <> nil) then
    Result := ComponentPrinter.TimeFormat
  else
    Result := 0;
end;

function TBasedxReportLink.DefaultPageNumberFormat: TdxPageNumberFormat;
begin
  if not (fvPageNumber in FAssignedFormatValues) and (ComponentPrinter <> nil) then
    Result := ComponentPrinter.PageNumberFormat
  else
    Result := pnfNumeral;
end;

function TBasedxReportLink.IsDateFormatStored: Boolean;
begin
  Result := fvDate in FAssignedFormatValues;
end;

function TBasedxReportLink.IsTimeFormatStored: Boolean;
begin
  Result := fvTime in FAssignedFormatValues;
end;

function TBasedxReportLink.IsPageNumberFormatStored: Boolean;
begin
  Result := fvPageNumber in FAssignedFormatValues;
end;

procedure TBasedxReportLink.XorAssignedFormats(AItem: TdxAssignedFormatValue; AValue: Boolean);
begin
  if AValue then
    Include(FAssignedFormatValues, AItem)
  else
    Exclude(FAssignedFormatValues, AItem);
end;

function TBasedxReportLink.ValidateMargins: Boolean;
begin
  Result := RealPrinterPage.ValidateMargins;
  if not Result then
    Result := MessageQuestion(sdxOutsideMarginsMessage);
end;

procedure TBasedxReportLink.SetDateFormat(Value: Integer);
begin
  if Value < 0 then
    Value := 0;
  if Value > dxPgsDlg.DateFormats.Count - 1 then
    Value := dxPgsDlg.DateFormats.Count - 1;
  if FDateFormat <> Value then
  begin
    FDateFormat := Value;
    XorAssignedFormats(fvDate, FDateFormat <> DefaultDateFormat);
    if IsCurrentLink and (dxHFFormatObject <> nil) then
      dxHFFormatObject.DateFormat := dxPgsDlg.DateFormats[FDateFormat];
  end;
end;

procedure TBasedxReportLink.SetTimeFormat(Value: Integer);
begin
  if Value < 0 then
    Value := 0;
  if Value > dxPgsDlg.TimeFormats.Count - 1 then
    Value := dxPgsDlg.TimeFormats.Count - 1;
  if FTimeFormat <> Value then
  begin
    FTimeFormat := Value;
    XorAssignedFormats(fvTime, FTimeFormat <> DefaultTimeFormat);
    if IsCurrentLink and (dxHFFormatObject <> nil) then
      dxHFFormatObject.TimeFormat := dxPgsDlg.TimeFormats[FTimeFormat];
  end;
end;

procedure TBasedxReportLink.SetPageNumberFormat(Value: TdxPageNumberFormat);
begin
  if FPageNumberFormat <> Value then
  begin
    FPageNumberFormat := Value;
    XorAssignedFormats(fvPageNumber, FPageNumberFormat <> DefaultPageNumberFormat);
    if IsCurrentLink and (dxHFFormatObject <> nil) then
      dxHFFormatObject.PageNumberFormat := FPageNumberFormat;
  end;
end;

procedure TBasedxReportLink.SetAssignedFormatValues(Value: TdxAssignedFormatValues);
begin
  if DateFormat = DefaultDateFormat then
    Exclude(Value, fvDate);
  if TimeFormat = DefaultTimeFormat then
    Exclude(Value, fvTime);
  if PageNumberFormat = DefaultPageNumberFormat then
    Exclude(Value, fvPageNumber);
  if FAssignedFormatValues <> Value then
  begin
    FAssignedFormatValues := Value;
    if ComponentPrinter <> nil then
      ComponentPrinter.DesignerModified;
  end;
end;

function TBasedxReportLink.GetBrushPool: TdxPSReportBrushPool;
begin
  if FBrushPool = nil then FBrushPool := TdxPSReportBrushPool.Create;
  Result := FBrushPool;
end;

function TBasedxReportLink.GetCurrentPrintStyle: TBasedxPrintStyle;
begin
  if StyleManager <> nil then
    Result := StyleManager.CurrentStyle
  else
    Result := nil;
end;

function TBasedxReportLink.GetFontPool: TdxPSReportFontPool;
begin
  if FFontPool = nil then FFontPool := TdxPSReportFontPool.Create;
  Result := FFontPool;
end;

procedure TBasedxReportLink.PageParamsChange(Sender: TdxPrinterPage;
  AStyle: TBasedxPrintStyle; AUpdateCodes: TdxPrinterPageUpdateCodes);
const
  ImportantUpdateCodes: TdxPrinterPageUpdateCodes =
    [ucMarginLeft, ucMarginTop, ucMarginRight, ucMarginBottom, ucScale];
begin
  if (RealPrinterPage = Sender) and IsCurrentLink and (ImportantUpdateCodes * AUpdateCodes <> []) then
  begin
    CalcRenderInfos;
    if (ComponentPrinter <> nil) and (cpsPreviewing in ComponentPrinter.State) then
    begin  
      ComponentPrinter.PreviewWindow.InitContent;
      ComponentPrinter.PreviewWindow.UpdateControls;
    end;  
  end;  
end;

function TBasedxReportLink.SupportsTitle: Boolean;
begin
  Result := True;
end;

function TBasedxReportLink.AddColorToPool(AColor: TColor): Integer;
begin
  Result := BrushPool.Add(AColor);
end;

function TBasedxReportLink.AddFontToPool(AFont: TFont): Integer;
begin
  Result := FontPool.Add(AFont);
end;

procedure TBasedxReportLink.AddStandardDelimiters(AReportCells: TdxReportCells;
  AHorzDelimiters, AVertDelimiters: TList);
begin  
  AHorzDelimiters.Add(nil);
  AHorzDelimiters.Add(Pointer(ReportWidth));
  AVertDelimiters.Add(nil);
  AVertDelimiters.Add(Pointer(ReportHeight));
end;

procedure TBasedxReportLink.CalcRenderInfos;
begin
  if DataProviderPresent then
  begin
    PrepareLongOperation;
    try
      RenderInfo.CalcRenderInfos;
    finally
      UnprepareLongOperation;
    end;
  end;
end;

procedure TBasedxReportLink.ClearGDIPools;
begin
  if FBrushPool <> nil then BrushPool.Clear;
  if FFontPool <> nil then FontPool.Clear;
end;

function TBasedxReportLink.BrushNeeded(AColor: TColor): HBRUSH;
begin
  Result := BrushPool.BrushNeeded(AColor);
end;

function TBasedxReportLink.GetRenderer: TdxPSReportRenderer;
begin
  if FRenderer = nil then FRenderer := RendererClass.Create(Self);
  Result := FRenderer;
end;

function TBasedxReportLink.GetRendererClass: TdxPSReportRendererClass;
begin
  Result := DoGetRendererClass;
  if Result = nil then Result := TdxPSReportRenderer;
end;

function TBasedxReportLink.GetRenderInfoClass: TdxPSReportRenderInfoClass;
begin
  Result := TdxPSReportRenderInfo;
end;

function TBasedxReportLink.GetRenderInfo: TdxPSReportRenderInfo;
begin
  if FRenderInfo = nil then FRenderInfo := GetRenderInfoClass.Create(Self);
  Result := FRenderInfo;
end;

procedure TBasedxReportLink.SetStyleManager(Value: TdxPrintStyleManager);
begin
  if FStyleManager <> Value then
  begin
    FStyleManager := Value;
    if Value <> nil then
      Value.FreeNotification(Self);
    PageParamsChange(RealPrinterPage, CurrentPrintStyle, ucAll);
  end;
end;

function TBasedxReportLink.GetReportHeight: Integer;
begin
  Result := FReportHeight;
end;

procedure TBasedxReportLink.SetPrinterPage(Value: TdxPrinterPage);
begin
  PrinterPage.Assign(Value);
end;

function TBasedxReportLink.GetReportTitleMode: TdxReportTitleMode;
begin
  Result := ReportTitle.Mode;
end;

function TBasedxReportLink.GetReportTitleText: string;
begin
  Result := ReportTitle.Text;
end;

procedure TBasedxReportLink.SetReportTitleMode(Value: TdxReportTitleMode);
begin
  ReportTitle.Mode := Value;
end;

procedure TBasedxReportLink.SetReportTitleText(const Value: string);
begin
  ReportTitle.Text := Value;
end;

procedure TBasedxReportLink.SetReportTitle(Value: TdxReportTitle);
begin
  FReportTitle.Assign(Value);
end;

procedure TBasedxReportLink.SetComponentPrinter(Value: TCustomdxComponentPrinter);
begin
  if FComponentPrinter <> Value then
  begin
    if FComponentPrinter <> nil then FComponentPrinter.RemoveLink(Self);
    if Value <> nil then Value.InsertLink(Self);
  end;
end;

procedure TBasedxReportLink.FontChanged(Sender: TObject);
begin
  LinkModified(True);
end;

function TBasedxReportLink.IsDesignerCaptionStored: Boolean;
begin
  Result := AnsiCompareStr(sdxReportDesignerCaption, FDesignerCaption) <> 0;
end;

function TBasedxReportLink.GetIndex: Integer;
begin
  if ComponentPrinter <> nil then
    Result := ComponentPrinter.IndexOfLink(Self)
  else
    Result := -1;
end;

function TBasedxReportLink.GetIsCurrentLink: Boolean;
begin
  Result := (ComponentPrinter <> nil) and (ComponentPrinter.CurrentLink = Self);
end;

procedure TBasedxReportLink.SetIsCurrentLink(Value: Boolean);
begin
  if Value then
    if not (csReading in ComponentState) and (ComponentPrinter <> nil) then
      ComponentPrinter.CurrentLink := Self;
end;

procedure TBasedxReportLink.SetIndex(Value: Integer);
var
  CurIndex: Integer;
begin
  if ComponentPrinter = nil then Exit;
  if Value < 0 then Value := 0;
  if Value > ComponentPrinter.LinkCount - 1 then
    Value := ComponentPrinter.LinkCount - 1;
  CurIndex := GetIndex;
  if CurIndex <> Value then
    ComponentPrinter.MoveLink(CurIndex, Value);
end;

procedure TBasedxReportLink.RestoreFromOriginal;
begin
  if Component <> nil then InternalRestoreFromOriginal;
end;

type
  TControlAccess = class(TControl);

procedure TBasedxReportLink.InternalRestoreFromOriginal;
begin
  if Component is TControl then
  begin
    Color := TControlAccess(Component).Color;
    Font := TControlAccess(Component).Font;
  end;
end;

procedure TBasedxReportLink.RestoreDefaults;
begin
  InternalRestoreDefaults;
end;

procedure TBasedxReportLink.InternalRestoreDefaults;
begin
  Transparent := True;
  Color := dxDefaultColor; {clWhite}
  with Font do
  begin
    Name := dxDefaultFont; {Times New Roman}
    Style := [];
    Pitch := fpDefault;
    Size := 8;
    CharSet := DEFAULT_CHARSET;
  end;
  FootersOnEveryPage := False;
  HeadersOnEveryPage := False;
end;

procedure TBasedxReportLink.LinkModified(Value: Boolean);
begin
  FRebuildNeeded := Value;
end;

procedure TBasedxReportLink.SetColor(Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    LinkModified(True);
  end;
end;

procedure TBasedxReportLink.SetFont(Value: TFont);
begin
  if Value <> FFont then FFont.Assign(Value);
end;

procedure TBasedxReportLink.SetTransparent(Value: Boolean);
begin
  if FTransparent <> Value then
  begin
    FTransparent := Value;
    LinkModified(True);
  end;
end;

procedure TBasedxReportLink.SetUseHorzDelimiters(Value: Boolean);
begin
  if FUseHorzDelimiters <> Value then
  begin
    FUseHorzDelimiters := Value;
    LinkModified(True);
  end;
end;

procedure TBasedxReportLink.SetUseVertDelimiters(Value: Boolean);
begin
  if FUseVertDelimiters <> Value then
  begin
    FUseVertDelimiters := Value;
    LinkModified(True);
  end;
end;

procedure TBasedxReportLink.SetStartPageIndex(Value: Integer);
begin
  if Value < 1 then 
    Value := 1;
  FStartPageIndex := Value;
  if dxHFFormatObject <> nil then
    dxHFFormatObject.StartPageIndex := Value;
end;

procedure TBasedxReportLink.DoDestroy;
begin
  if Assigned(FOnDestroy) then FOnDestroy(Self);
end;

procedure TBasedxReportLink.DoChangeComponent;
begin
  if Assigned(FOnChangeComponent) then FOnChangeComponent(Self);
end;

procedure TBasedxReportLink.DoProgress(const PercentDone: Double);
begin
  if ComponentPrinter <> nil then
    ComponentPrinter.DoProgress(Self, PercentDone)
end;

function TBasedxReportLink.CheckToDesign: Boolean;
begin
  Result := GetDesignerClass <> nil;
end;

function TBasedxReportLink.DesignReport: Boolean;
var
  DesignWindowClass: TdxReportLinkDesignWindowClass;
  DesignWindow: TAbstractdxReportLinkDesignWindow;
  SaveLink: TBasedxReportLink;
begin
  Result := False;
  DesignWindowClass := GetDesignerClass;
  if DesignWindowClass = nil then 
    Exit;
  DesignWindow := DesignWindowClass.Create(nil);
  try
    DesignWindow.ReportLink := Self;
    if ComponentPrinter <> nil then 
      ComponentPrinter.DoBeforeDesignReport(Self, DesignWindow);
    SaveLink := LinkClass.Create(nil);
    try
      SaveLink.Assign(Self);
      Result := DesignWindow.Execute;
      if ComponentPrinter <> nil then 
        ComponentPrinter.DoDesignReport(Self, Result);
      if not Result and not DesignWindow.Applyed then
        Assign(SaveLink);
    finally
      SaveLink.Free;
    end;
  finally
    DesignWindow.Free;
  end;
end;

function TBasedxReportLink.GetDesignerClass: TdxReportLinkDesignWindowClass;
begin
  if Component <> nil then
    Result := dxPSDesignerClassByCompClass(TComponentClass(Component.ClassType))
  else
    Result := dxPSDesignerClassByLinkClass(LinkClass);
end;

function TBasedxReportLink.DataProviderPresent: Boolean;
begin
  Result := Component <> nil;
end;

function TBasedxReportLink.DoGetRendererClass: TdxPSReportRendererClass;
begin
  Result := TdxPSReportRenderer;
end;

function TBasedxReportLink.IsDrawFootersOnEveryPage: Boolean;
begin
  Result := FootersOnEveryPage;
end;

function TBasedxReportLink.IsDrawHeadersOnEveryPage: Boolean;
begin
  Result := HeadersOnEveryPage;
end;

procedure TBasedxReportLink.ConstructReport(AReportCells: TdxReportCells);
begin
  ClearGDIPools;
  AddFontToPool(Font);
  AddColorToPool(Color);
end;

procedure TBasedxReportLink.MakeDelimiters(AReportCells: TdxReportCells;
  AHorzDelimiters, AVertDelimiters: TList);
begin
end;

procedure TBasedxReportLink.CustomDraw(AItem: TAbstractdxReportCellData; ACanvas: TCanvas;
  ABoundsRect, AClientRect: TRect; var ADone: Boolean);
begin
end;

function TBasedxReportLink.IsSupportedCustomDraw(Item: TAbstractdxReportCellData): Boolean;
begin
  Result := False;
end;

class function TBasedxReportLink.LinkClass: TdxReportLinkClass;
begin
  Result := TdxReportLinkClass(GetTypeData(ClassInfo)^.ClassType);
end;

class function TBasedxReportLink.IsSupportedCompClass(AComponentClass: TComponentClass): Boolean;
begin
  Result := dxPSIsSupportedCompClass(AComponentClass) and
    (dxPSLinkClassByCompClass(AComponentClass) = LinkClass);
end;

procedure TBasedxReportLink.DefinePrintStylesDlg;
var
  PreviewBtnClicked, PrintBtnClicked: Boolean;
begin  
  if StyleManager <> nil then 
  begin
    if ComponentPrinter <> nil then Include(ComponentPrinter.FState, cpsDefineStylesDialog);
    try
      StyleManager.DefinePrintStylesDlg(@PreviewBtnClicked, @PrintBtnClicked);
    finally
      if ComponentPrinter <> nil then Exclude(ComponentPrinter.FState, cpsDefineStylesDialog);  
    end;
    
    if PrintBtnClicked then
      Print(True, nil)
    else
      if PreviewBtnClicked then Preview(True);
  end;
end;

function TBasedxReportLink.DesignerExists(AComponentClass: TComponentClass): Boolean;
begin
  Result := GetDesignerClass <> nil;
end;

class procedure TBasedxReportLink.GetSupportedComponentList(AList: TList);
begin
  dxPSGetLinkSupportedComponentsList(LinkClass, AList);
end;

function TBasedxReportLink.ShowDateTimeFormatsDlg: Boolean;
var
  Data: TdxDateTimeFormatDlgData;
begin
  FillChar(Data, SizeOf(TdxDateTimeFormatDlgData), 0);
  with Data do
  begin
    DateFormats := dxPgsDlg.DateFormats;
    TimeFormats := dxPgsDlg.TimeFormats;
    DateFormatIndex := DateFormat;
    TimeFormatIndex := TimeFormat;
    if ComponentPrinter <> nil then
      AutoUpdateDateTime := ComponentPrinter.AutoUpdateDateTime;
    ShowAsDefaultButton := True;
  end;
  Result := dxShowDateTimeFormatDlg(@Data);
  if Result then
  begin
    if ComponentPrinter <> nil then
    begin
      ComponentPrinter.AutoUpdateDateTime := Data.AutoUpdateDateTime;
      if Data.SetDateTimeFormatAsDefault then
      begin
        ComponentPrinter.DateFormat := Data.DateFormatIndex;
        ComponentPrinter.TimeFormat := Data.TimeFormatIndex;
      end;
    end;
    DateFormat := Data.DateFormatIndex;
    TimeFormat := Data.TimeFormatIndex;
  end;
end;

function TBasedxReportLink.ShowPageNumberFormatsDlg: Boolean;
var
  Data: TdxPageNumberFormatDlgData;
begin
  FillChar(Data, SizeOf(TdxPageNumberFormatDlgData), 0);
  with Data do
  begin
    PageNumberFormats := dxPgsDlg.PageNumberFormats;
    PageNumberFormat := Self.PageNumberFormat;
    StartPageIndex := Self.StartPageIndex;
    ShowAsDefaultButton := True;
  end;
  Result := dxShowPageNumberFormatDlg(@Data);
  if Result then
  begin
    if (ComponentPrinter <> nil) and Data.SetPageNumberFormatAsDefault then
      ComponentPrinter.PageNumberFormat := Data.PageNumberFormat;
    PageNumberFormat := Data.PageNumberFormat;
  end;
end;

function TBasedxReportLink.ShowTitlePropertiesDlg: Boolean;
var
  Data: TdxReportTitlePropertiesDlgData;
begin
  Result := False;
  if not SupportsTitle then Exit;
  FillChar(Data, SizeOf(TdxReportTitlePropertiesDlgData), 0);
  Data.ReportTitle := TdxReportTitle.Create(nil);
  Data.ReportTitle.Assign(ReportTitle);

  Result := dxShowReportTitlePropertiesDlg(@Data);
  if Result then
  begin
    ReportTitle := Data.ReportTitle;
    Data.ReportTitle.Free;
  end;
end;

procedure TBasedxReportLink.LoadFromRegistry(const APath: string);
var
  AssignedFormat: Boolean;
begin
  if APath = '' then Exit;
  with TRegistry.Create do
  try
    if OpenKey(APath, False) then
    try
      AssignedFormat :=
        ValueExists(sdxAssignedDateFormat) and ReadBool(sdxAssignedDateFormat);
      if AssignedFormat and ValueExists(sdxDateFormat) then
        DateFormat := ReadInteger(sdxDateFormat);

      AssignedFormat :=
        ValueExists(sdxAssignedTimeFormat) and ReadBool(sdxAssignedTimeFormat);
      if AssignedFormat and ValueExists(sdxTimeFormat) then
        TimeFormat := ReadInteger(sdxTimeFormat);

      AssignedFormat :=
        ValueExists(sdxAssignedPageNumberFormat) and ReadBool(sdxAssignedPageNumberFormat);
      if AssignedFormat and ValueExists(sdxPageNumberFormat) then
        PageNumberFormat := TdxPageNumberFormat(ReadInteger(sdxPageNumberFormat));

      if ValueExists(sdxStartPageIndex) then
        StartPageIndex := ReadInteger(sdxStartPageIndex);
    except
      on ERegistryException do
      else
        raise;
    end;
  finally
    Free;
  end;
end;

procedure TBasedxReportLink.SaveToRegistry(const APath: string);
begin
  if APath = '' then Exit;
  with TRegistry.Create do
  try
    if OpenKey(APath, True) then
    try
      WriteBool(sdxAssignedDateFormat, fvDate in AssignedFormatValues);
      if fvDate in AssignedFormatValues then
        WriteInteger(sdxDateFormat, DateFormat);

      WriteBool(sdxAssignedTimeFormat, fvTime in AssignedFormatValues);
      if fvTime in AssignedFormatValues then
        WriteInteger(sdxTimeFormat, TimeFormat);

      WriteBool(sdxAssignedPageNumberFormat, fvPageNumber in AssignedFormatValues);
      if fvPageNumber in AssignedFormatValues then
        WriteInteger(sdxPageNumberFormat, Integer(PageNumberFormat));

      WriteInteger(sdxStartPageIndex, StartPageIndex);
    except
      on ERegistryException do
      else
        raise;
    end;
  finally
    Free;
  end;
end;


{ TAbstractdxReportLinkDesignWindow }

constructor TAbstractdxReportLinkDesignWindow.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Caption := sdxReportDesignerCaption;
  CreateStdButtons;
  LoadStrings;
end;

procedure TAbstractdxReportLinkDesignWindow.CreateWnd;
begin
  inherited CreateWnd;
  if Icon.Handle = 0 then
    Icon.Handle := LoadIconFromBitmapRes(DXCP_BMPREPORTDESIGNER);
//    Icon.Handle := LoadIcon(HInstance, PChar(DXCP_ICONDESIGNER));
  SendMessage(Handle, WM_SETICON, 1, Icon.Handle);
end;

procedure TAbstractdxReportLinkDesignWindow.CreateStdButtons;
const
  btnWidth = 75;
  btnLargeWidth = 100;
  btnHeight = 23;
  btnOffsetX = 4;
  btnOffsetY = 6;
var
  R: TRect;
  AWidth, ALargeWidth, AHeight, AOffsetX, AOffsetY: Integer;
begin
  AWidth := MulDiv(btnWidth, Screen.PixelsPerInch, 96);
  ALargeWidth := MulDiv(btnLargeWidth, Screen.PixelsPerInch, 96);
  AHeight := MulDiv(btnHeight, Screen.PixelsPerInch, 96);
  AOffsetX := MulDiv(btnOffsetX, Screen.PixelsPerInch, 96);
  AOffsetY := MulDiv(btnOffsetY, Screen.PixelsPerInch, 96);

  btnHelp := TButton.Create(Self);
  try
    btnHelp.Name := sdxHelpButtonName;
  except
  end;
  btnHelp.Parent := Self;
  R := Bounds(ClientWidth - AOffsetX - AWidth, ClientHeight - AOffsetY - AHeight, AWidth, AHeight);
  btnHelp.BoundsRect := R;

  btnApply := TButton.Create(Self);
  btnApply.Parent := Self;
  btnApply.TabOrder := btnHelp.TabOrder - 1;
  R := Bounds(btnHelp.Left - AOffsetX - AWidth, ClientHeight - AOffsetY - AHeight, AWidth, AHeight);
  btnApply.BoundsRect := R;
  btnApply.OnClick := ApplyClick;

  btnCancel := TButton.Create(Self);
  btnCancel.Parent := Self;
  btnCancel.Cancel := True;
  btnCancel.ModalResult := mrCancel;
  btnCancel.TabOrder := btnApply.TabOrder - 1;
  R := Bounds(btnApply.Left - AOffsetX - AWidth, ClientHeight - AOffsetY - AHeight, AWidth, AHeight);
  btnCancel.BoundsRect := R;

  btnOK := TButton.Create(Self);
  btnOK.Parent := Self;
  btnOK.Default := True;
  btnOK.ModalResult := mrOK;
  btnOK.TabOrder := btnCancel.TabOrder - 1;
  R := Bounds(btnCancel.Left - AOffsetX - AWidth, ClientHeight - AOffsetY - AHeight, AWidth, AHeight);
  btnOK.BoundsRect := R;

  btnRestoreOriginal := TButton.Create(Self);
  btnRestoreOriginal.Parent := Self;
  btnRestoreOriginal.TabOrder := btnOK.TabOrder - 1;
  R := Bounds(AOffsetX, ClientHeight - AOffsetY - AHeight, ALargeWidth, AHeight);
  btnRestoreOriginal.BoundsRect := R;
  btnRestoreOriginal.OnClick := RestoreOriginalClick;

  btnRestoreDefaults := TButton.Create(Self);
  btnRestoreDefaults.Parent := Self;
  btnRestoreDefaults.TabOrder := btnRestoreOriginal.TabOrder - 1;
  R := Bounds(btnRestoreOriginal.BoundsRect.Right + AOffsetX, ClientHeight - AOffsetY - AHeight, ALargeWidth, AHeight);
  btnRestoreDefaults.BoundsRect := R;
  btnRestoreDefaults.OnClick := RestoreDefaultsClick;

  btnTitleProperties := TButton.Create(Self);
  btnTitleProperties.Parent := Self;
  R := Bounds(AOffsetX, ClientHeight - AOffsetY - AHeight, ALargeWidth, AHeight);
  btnTitleProperties.BoundsRect := R;
  btnTitleProperties.OnClick := TitlePropertiesClick;
end;

procedure TAbstractdxReportLinkDesignWindow.LoadStrings;
begin
  btnOK.Caption := sdxBtnOK;
  btnCancel.Caption := sdxBtnCancel;
  btnApply.Caption := sdxBtnApply;
  btnHelp.Caption := sdxBtnHelp;
  btnRestoreDefaults.Caption := sdxBtnRestoreDefaults;
  btnRestoreOriginal.Caption := sdxBtnRestoreOriginal;
  btnTitleProperties.Caption := sdxBtnTitleProperties;
end;

procedure TAbstractdxReportLinkDesignWindow.RestoreOriginalClick(Sender: TObject);
begin
  BeginUpdateControls;
  try
    if ReportLink <> nil then ReportLink.RestoreFromOriginal;
    Initialize;
  finally
    EndUpdateControls;
  end;
  Modified := True;
end;

procedure TAbstractdxReportLinkDesignWindow.RestoreDefaultsClick(Sender: TObject);
begin
  BeginUpdateControls;
  try
    if ReportLink <> nil then ReportLink.RestoreDefaults;
    DoInitialize;
  finally
    EndUpdateControls;
  end;
  Modified := True;
end;

procedure TAbstractdxReportLinkDesignWindow.TitlePropertiesClick(Sender: TObject);
begin
  if (ReportLink <> nil) and ReportLink.ShowTitlePropertiesDlg then
    DoApply;
end;

procedure TAbstractdxReportLinkDesignWindow.ApplyClick(Sender: TObject);
begin
  DoApply;
end;

procedure TAbstractdxReportLinkDesignWindow.RegroupStdButtons;
var
  StartTabOrder: Integer;
begin
  if HelpContext <> 0 then
    BorderIcons := BorderIcons + [biHelp]
  else
  begin
    btnOK.BoundsRect := btnCancel.BoundsRect;
    btnCancel.BoundsRect := btnApply.BoundsRect;
    btnApply.BoundsRect := btnHelp.BoundsRect;
    btnHelp.Visible := False;
  end;
  btnRestoreOriginal.Visible := ReportLink.IsDesigning;
  btnRestoreDefaults.Visible := ReportLink.IsDesigning;
  btnTitleProperties.Visible := not ReportLink.IsDesigning;
  if ReportLink.IsDesigning then
  begin
    btnRestoreOriginal.TabOrder := 0;
    btnRestoreDefaults.TabOrder := 1;
  end
  else
    btnTitleProperties.TabOrder := 0;
  StartTabOrder := 1 + Byte(ReportLink.IsDesigning);
  btnOk.TabOrder := StartTabOrder;
  btnCancel.TabOrder := StartTabOrder + 1;
  btnApply.TabOrder := StartTabOrder + 2;
  btnHelp.TabOrder := StartTabOrder + 3;
end;

procedure TAbstractdxReportLinkDesignWindow.Initialize;
begin
  BeginUpdateControls;
  try
    if Component <> nil then
      Caption := Format(sdxReportDesignerCaption + ' : ' + '%s', [Component.Name]);
    if (ReportLink <> nil) and not ReportLink.IsDesigning then
      Caption := ReportLink.DesignerCaption;
    if ReportLink.DesignerHelpContext <> 0 then
      HelpContext := ReportLink.DesignerHelpContext;
    RegroupStdButtons;
    DoInitialize;
  finally
    UpdateControlsState;
    EndUpdateControls;
  end;
end;

procedure TAbstractdxReportLinkDesignWindow.DoInitialize;
begin
end;

procedure TAbstractdxReportLinkDesignWindow.UpdatePreview;
begin
end;

procedure TAbstractdxReportLinkDesignWindow.WMHelp(var message: TWMHelp);
var
  Control: TWinControl;
  ContextID: Integer;
begin
  if (csDesigning in ComponentState) then
    inherited
  else
  begin
    ContextID := 0;
    with Message.HelpInfo^ do
      if iContextType = HELPINFO_WINDOW then
      begin
        Control := FindControl(hItemHandle);
        if Control = nil then Exit;
        Control := GetParentForm(Control);
        if Control = nil then Exit;
        ContextID := Control.HelpContext;
      end;
    if (ContextID <> 0) then Application.HelpContext(ContextID);
  end;
end;

function TAbstractdxReportLinkDesignWindow.Execute: Boolean;
begin
  Initialize;
  Result := (ReportLink <> nil) and (ShowModal = mrOK) and Modified and not Applyed;
end;

function TAbstractdxReportLinkDesignWindow.CanApply: Boolean;
begin
  Result := (ReportLink.Component <> nil) and (ReportLink.ComponentPrinter <> nil) and
    (cpsPreviewing in ReportLink.ComponentPrinter.State) and Modified and not Applyed;
end;

procedure TAbstractdxReportLinkDesignWindow.DoApply;
begin
  try
    ReportLink.DoApplyInDesigner;
  except
    Application.HandleException(Self);
    ModalResult := mrCancel;
    raise;
  end;
  AtLeastOneTimeApplyed := True;
  Applyed := True;
  UpdateControlsState;
end;

procedure TAbstractdxReportLinkDesignWindow.BeginUpdateControls;
begin
  Inc(FUpdateControlsCount);
end;

procedure TAbstractdxReportLinkDesignWindow.EndUpdateControls;
begin
  if FUpdateControlsCount > 0 then
  begin
    Dec(FUpdateControlsCount);
    if FUpdateControlsCount = 0 then UpdatePreview;
  end;
end;

function TAbstractdxReportLinkDesignWindow.LockControlsUpdate: Boolean;
begin
  Result := FUpdateControlsCount > 0;
end;

procedure TAbstractdxReportLinkDesignWindow.UpdateControlsState;
begin
  btnApply.Enabled := CanApply;
//  btnOK.Enabled := Modified;
  btnRestoreOriginal.Enabled := (ReportLink <> nil) and (ReportLink.Component <> nil);
end;

procedure TAbstractdxReportLinkDesignWindow.PaintPreview(ACanvas: TCanvas; R: TRect);
begin
end;

function TAbstractdxReportLinkDesignWindow.GetComponent: TComponent;
begin
  if ReportLink <> nil then
    Result := ReportLink.Component
  else
    Result := nil;
end;

function TAbstractdxReportLinkDesignWindow.IsCaptionStored: Boolean;
begin
  Result := AnsiCompareStr(Caption, sdxReportDesignerCaption) <> 0;
end;

procedure TAbstractdxReportLinkDesignWindow.SetModified(Value: Boolean);
begin
  FModified := Value;
  if Modified and Applyed then Applyed := False;
  UpdateControlsState;
end;

procedure TAbstractdxReportLinkDesignWindow.SetAtLeastOneTimeApplyed(Value: Boolean);
begin
  if FAtLeastOneTimeApplyed <> Value then
  begin
    if Value then
      btnCancel.Caption := sdxBtnClose
    else
      btnCancel.Caption := sdxBtnCancel;
    FAtLeastOneTimeApplyed := Value;
  end;
end;


{ TdxReportItem }

constructor TdxReportItem.Create(AParent: TdxReportCell);
begin
  inherited Create;
  Parent := AParent;
end;

destructor TdxReportItem.Destroy;
begin
  SetParent(nil);
  inherited Destroy;
end;

procedure TdxReportItem.Assign(Source: TPersistent);
begin
  if Source is TdxReportItem then
    Data := TdxReportItem(Source).Data
  else
    inherited Assign(Source);
end;

class function TdxReportItem.ReportItemClass: TdxReportItemClass;
begin
  Result := TdxReportItemClass(GetTypeData(ClassInfo)^.ClassType);
end;

class function TdxReportItem.IsCell: Boolean;
begin
  Result := False;
end;

function TdxReportItem.AsCell: TdxReportCell;
begin
  if IsCell then
    Result := TdxReportCell(Self)
  else
    Result := nil;
end;

function TdxReportItem.Clone(AParent: TdxReportCell): TdxReportItem;
begin
  Result := ReportItemClass.Create(AParent);
  try
    Result.Assign(Self);
  except
    Result.Free;
    raise;
  end;
end;

function TdxReportItem.HasParent: Boolean;
begin
  Result := Parent <> nil;
end;

procedure TdxReportItem.SetParent(Value: TdxReportCell);
begin
  if Parent <> Value then
  begin
    if Parent <> nil then Parent.RemoveItem(Self);
    if Value <> nil then Value.InsertItem(Self);
  end;
end;

function TdxReportItem.IsFirstItem: Boolean;
begin
  Result := GetPrevSibling = nil;
end;

function TdxReportItem.IsLastItem: Boolean;
begin
  Result := GetNextSibling = nil;
end;

function TdxReportItem.GetPrevSibling: TdxReportItem;
var
  Index: Integer;
begin
  Result := nil;
  if not HasParent then Exit;
  Index := Parent.IndexOf(Self);
  if Index < 1 then Exit;
  //Result := Parent.GetPrevItem(Self, Index)
  if IsCell then
    Result := Parent.FCellList[Index - 1]
  else
    Result := Parent.FDataList[Index - 1]
end;

function TdxReportItem.GetNextSibling: TdxReportItem;
var
  Index: Integer;
begin
  Result := nil;
  if not HasParent then Exit;
  Index := Parent.IndexOf(Self);
  //Result := Parent.GetNextItem(Self, Index)
  if IsCell then
  begin
    if Index < Parent.CellCount - 1 then
      Result := Parent.FCellList[Index + 1];
  end
  else
    if Index < Parent.DataItemCount - 1 then
      Result := Parent.FDataList[Index + 1];
end;

function TdxReportItem.GetIndex: Integer;
begin
  if Parent <> nil then
    Result := Parent.IndexOf(Self)
  else
    Result := -1;
end;

procedure TdxReportItem.SetIndex(Value: Integer);
var
  CurIndex: Integer;
begin
  if Parent = nil then Exit;

  if Value < 0 then Value := 0;
  if IsCell then
  begin
    if Value > Parent.CellCount - 1 then
      Value := Parent.CellCount - 1
  end
  else
    if Value > Parent.DataItemCount - 1 then
      Value := Parent.DataItemCount - 1;
  CurIndex := GetIndex;
  if CurIndex <> Value then
    Parent.MoveItem(Self, CurIndex, Value);
end;

function TdxReportItem.GetReportCells: TdxReportCells;
begin
  if Parent <> nil then
    Result := Parent.ReportCells
  else
    Result := nil;
end;


{ TdxReportVisualItem }

constructor TdxReportVisualItem.Create(AParent: TdxReportCell);
begin
  CellSides := dxDefaultCellSizes; {csAll}
  Color := dxDefaultColor; {clWhite}
  EdgeMode := cemSingle;
  InnerEdge := cesNone;
  OuterEdge := cesNone;
  ParentColor := True;
  Transparent := dxDefaultTransparent; {true}
  inherited Create(AParent);
end;

procedure TdxReportVisualItem.FixParentProps;
begin
  if (Parent <> nil) then
    if ParentColor then
    begin
      SetColor(Parent.Color);
      ParentColor := True;
    end;
end;

procedure TdxReportVisualItem.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TdxReportVisualItem) then
  begin
    ParentColor := False;
    BoundsRect := TdxReportVisualItem(Source).BoundsRect;
    Color := TdxReportVisualItem(Source).Color;
    FontIndex := TdxReportVisualItem(Source).FontIndex;
    Format := TdxReportVisualItem(Source).Format;
    ParentColor := False;
  end;
end;

function TdxReportVisualItem.GetCellSides: TdxCellSides;
begin
  Result := TdxCellSides(Byte(Format and dxFormatRect));
end;

function TdxReportVisualItem.GetEdgeMode: TdxCellEdgeMode;
begin
  Result := TdxCellEdgeMode(Integer((Format and dxFormatEdgeMode3DEffects) shr $10) +
    Integer((Format and dxFormatEdgeModeShadow) shr $10));
end;

function TdxReportVisualItem.GetInnerEdge: TdxCellEdgeStyle;
begin
  Result := TdxCellEdgeStyle(Integer((Format and dxFormatInnerEdgeSunken) shr $12) +
    Integer((Format and dxFormatInnerEdgeRaised) shr $12));
end;

function TdxReportVisualItem.GetOuterEdge: TdxCellEdgeStyle;
begin
  Result := TdxCellEdgeStyle(Integer((Format and dxFormatOuterEdgeSunken) shr $14) +
    Integer((Format and dxFormatOuterEdgeRaised) shr $14));
end;

function TdxReportVisualItem.GetEdgeBump: Boolean;
begin
  Result := (InnerEdge = cesSunken) and (OuterEdge = cesRaised);
end;

function TdxReportVisualItem.GetEdgeEtched: Boolean;
begin
  Result := (InnerEdge = cesRaised) and (OuterEdge = cesSunken);
end;

function TdxReportVisualItem.GetEdgeRaised: Boolean;
begin
  Result := (InnerEdge = cesRaised) and (OuterEdge = cesRaised);
end;

function TdxReportVisualItem.GetEdgeSunken: Boolean;
begin
  Result := (InnerEdge = cesSunken) and (OuterEdge = cesSunken);
end;

function TdxReportVisualItem.GetRenderer: TdxPSReportRenderer;
begin
  Result := ReportCells.Renderer;
end;

function TdxReportVisualItem.GetParentColor: Boolean;
begin
  Result := (Format and dxFormatParentColor) = dxFormatParentColor;
end;

function TdxReportVisualItem.GetTransparent: Boolean;
begin
  Result := (Format and dxFormatTransparent) = dxFormatTransparent;
end;

procedure TdxReportVisualItem.SetEdgeMode(Value: TdxCellEdgeMode);
begin
  Format := Format and not dxFormatEdgeMode or (Byte(Value) shl $10);
end;

procedure TdxReportVisualItem.SetInnerEdge(Value: TdxCellEdgeStyle);
begin
  Format := Format and not dxFormatInnerEdge or (Byte(Value) shl $12);
end;

procedure TdxReportVisualItem.SetOuterEdge(Value: TdxCellEdgeStyle);
begin
  Format := Format and not dxFormatOuterEdge or (Byte(Value) shl $14);
end;

procedure TdxReportVisualItem.SetEdgeBump(Value: Boolean);
begin
  InnerEdge := cesSunken;
  OuterEdge := cesRaised;
end;

procedure TdxReportVisualItem.SetEdgeEtched(Value: Boolean);
begin
  InnerEdge := cesRaised;
  OuterEdge := cesSunken;
end;

procedure TdxReportVisualItem.SetEdgeRaised(Value: Boolean);
begin
  InnerEdge := cesRaised;
  OuterEdge := cesRaised;
end;

procedure TdxReportVisualItem.SetEdgeSunken(Value: Boolean);
begin
  InnerEdge := cesSunken;
  OuterEdge := cesSunken;
end;

function TdxReportVisualItem.GetFont: TFont;
begin
  if (FontIndex <> -1) and (ReportCells <> nil) then
    Result := ReportCells.GetItemFont(Self)
  else
    Result := nil;
end;

function TdxReportVisualItem.GetFontIndex: Integer;
begin
  Result := FFontIndex;
end;

procedure TdxReportVisualItem.SetFontIndex(Value: Integer);
begin
  if Value < -1 then Value := -1;
  FFontIndex := Value;
end;

procedure TdxReportVisualItem.SetFormat(Value: Integer);
begin
  FFormat := Value;
  if ParentColor and (Parent <> nil) then
    FColor := Parent.Color;
end;

function TdxReportVisualItem.GetColor: TColor;
begin
  if ParentColor and (Parent <> nil) then
    Result := Parent.Color
  else
    Result := FColor;
end;

procedure TdxReportVisualItem.SetColor(Value: TColor);
begin
  if (FColor <> Value) then
  begin
    FColor := Value;
    SetParentColor(False);
  end;
end;

procedure TdxReportVisualItem.SetParentColor(Value: Boolean);
const
  dxParentColor: array[Boolean] of Integer = (0, dxFormatParentColor);
begin
  if (ParentColor <> Value) then
    Format := Format and not dxFormatParentColor or dxParentColor[Value];
end;

procedure TdxReportVisualItem.SetTransparent(Value: Boolean);
const
  dxTransparent: array[Boolean] of Integer = (0, dxFormatTransparent);
begin
  Format := Format and not dxFormatTransparent or dxTransparent[Value];
end;

procedure TdxReportVisualItem.SetCellSides(Value: TdxCellSides);
begin
  if (CellSides <> Value) then
    Format := Format and not dxFormatRect or Byte(Value);
end;

function TdxReportVisualItem.IsEdgeDrawn: Boolean;
begin
  Result := Boolean(Byte(CellSides)) and ((EdgeMode = cemSingle) or
    ((EdgeMode = cem3DEffects) and ((InnerEdge > cesNone) or (OuterEdge > cesNone))));
end;

function TdxReportVisualItem.GetClientRect: TRect;
begin
  Result := GetClientRectRelativeTo(GetUsefulRect);
end;

function TdxReportVisualItem.GetClientRectRelativeTo(const R: TRect): TRect;
begin
  Result := R;
  with Result do
    case EdgeMode of
      cemSingle:
        begin
          if csLeft in CellSides then Inc(Left, FLineWidth);
          if csTop in CellSides then Inc(Top, FLineWidth);
          if csRight in CellSides then Dec(Right, FLineWidth);
          if csBottom in CellSides then Dec(Bottom, FLineWidth);
        end;
      cem3DEffects:
        begin
          if csLeft in CellSides then
            Inc(Left, FLineWidth * (Byte(InnerEdge > cesNone) + Byte(OuterEdge > cesNone)));
          if csTop in CellSides then
            Inc(Top, FLineWidth * (Byte(InnerEdge > cesNone) + Byte(OuterEdge > cesNone)));
          if csRight in CellSides then
            Dec(Right, FLineWidth * (Byte(InnerEdge > cesNone) + Byte(OuterEdge > cesNone)));
          if csBottom in CellSides then
            Dec(Bottom, FLineWidth * (Byte(InnerEdge > cesNone) + Byte(OuterEdge > cesNone)));
        end;
      cemShadow:
        begin
          if csLeft in CellSides then Inc(Left, FLineWidth);
          if csTop in CellSides then Inc(Top, FLineWidth);
          if csRight in CellSides then Dec(Right, FLineWidth);
          if csBottom in CellSides then Dec(Bottom, FLineWidth);
        end;
    end;
end;

procedure TdxReportVisualItem.SetBoundsRect(const Value: TRect);
begin
  FBoundsRect := Value;
end;

procedure TdxReportVisualItem.SetLeft(Value: Integer);
begin
//  FBoundsRect.Left := Value;
  OffsetRect(FBoundsRect, Value - FBoundsRect.Left, 0);
end;

procedure TdxReportVisualItem.SetTop(Value: Integer);
begin
//  FBoundsRect.Top := Value;
  OffsetRect(FBoundsRect, 0, Value - FBoundsRect.Top);
end;

function TdxReportVisualItem.GetWidth: Integer;
begin
  Result := BoundsRect.Right - BoundsRect.Left;
end;

procedure TdxReportVisualItem.SetWidth(Value: Integer);
begin
  FBoundsRect.Right := BoundsRect.Left + Value;
end;

function TdxReportVisualItem.GetLeft: Integer;
begin
  Result := BoundsRect.Left;
end;

function TdxReportVisualItem.GetTop: Integer;
begin
  Result := FBoundsRect.Top;
end;

function TdxReportVisualItem.GetHeight: Integer;
begin
  Result := BoundsRect.Bottom - BoundsRect.Top;
end;

procedure TdxReportVisualItem.SetHeight(Value: Integer);
begin
  FBoundsRect.Bottom := FBoundsRect.Top + Value;
end;

function TdxReportVisualItem.GetUsefulOrigin: TPoint;
begin
  Result := UsefulRect.TopLeft;
end;

function TdxReportVisualItem.GetOrigin: TPoint;
begin
  Result := BoundsRect.TopLeft;
end;

procedure TdxReportVisualItem.SetOrigin(const Value: TPoint);
begin
  FBoundsRect.TopLeft := Value;
end;

function TdxReportVisualItem.GetAbsoluteOrigin: TPoint;
var
  Item: TdxReportVisualItem;
  Origin: TPoint;
begin
  FillChar(Result, SizeOf(TPoint), 0);
  Item := Self;
  while (Item <> nil) do
  begin
    Origin := Item.GetOrigin;
    Inc(Result.X, Origin.X);
    Inc(Result.Y, Origin.Y);
    Item := Item.Parent;
  end;
end;

function TdxReportVisualItem.GetAbsoluteRect: TRect;
begin
  with Result do
  begin
    TopLeft := AbsoluteOrigin;
    Right := Left + Width;
    Bottom := Top + Height;
  end;
end;

function TdxReportVisualItem.GetUsefulRect: TRect;
begin
  Result := BoundsRect;
  InflateRect(Result, FHalfLineWidth, FHalfLineWidth);
end;

function TdxReportVisualItem.Is3DEdge: Boolean;
begin
  Result := (EdgeMode = cem3DEffects) and ((InnerEdge > cesNone) or (OuterEdge > cesNone));
end;


{  TdxReportCell }

destructor TdxReportCell.Destroy;
begin
  SetParent(nil);
  ClearDataItems;
  ClearCells;
  inherited Destroy;
end;

procedure TdxReportCell.Assign(Source: TPersistent);

  procedure AssignLevel(ADestCell, ASrcCell: TdxReportCell);
  var
    I: Integer;
    ACell: TdxReportCell;
  begin
    if ASrcCell.DataItemCount > 0 then
    begin
      DataListNeeded;
      for I := 0 to ASrcCell.DataItemCount - 1 do
        ASrcCell.DataItems[I].Clone(ADestCell);
    end;
    if ASrcCell.CellCount > 0 then
    begin
      CellListNeeded;
      for I := 0 to ASrcCell.CellCount - 1 do
      begin
        ACell := TdxReportCell.Create(ADestCell);
        with ACell do
          inherited Assign(ASrcCell.Cells[I]);
        AssignLevel(ACell, ASrcCell.Cells[I]);
      end;
    end;
  end;

begin
  if (Source is TdxReportCell) and (Source <> Self) then
  begin
    ClearDataItems;
    ClearCells;
    inherited Assign(Source);
    AssignLevel(Self, TdxReportCell(Source));
  end
  else
    inherited Assign(Source);
end;

procedure TdxReportCell.FixParentProps;
var
  I: Integer;
begin
  inherited FixParentProps;
  for I := 0 to CellCount - 1 do
    Cells[I].FixParentProps;
  for I := 0 to DataItemCount - 1 do
    DataItems[I].FixParentProps;
end;

procedure TdxReportCell.InsertCell(AItem: TdxReportCell);
begin
  CellListNeeded;
  FCellList.Add(AItem);
  AItem.FReportCells := FReportCells;
end;

procedure TdxReportCell.InsertDataItem(AItem: TdxReportItem);
begin
  DataListNeeded;
  FDataList.Add(AItem);
end;

procedure TdxReportCell.InsertItem(AItem: TdxReportItem);
begin
  if AItem.IsCell then
    InsertCell(AItem.AsCell)
  else
    InsertDataItem(AItem);
  AItem.FParent := Self;
  AItem.FixParentProps;
end;

procedure TdxReportCell.MoveCell(ACurIndex, ANewIndex: Integer);
begin
  FCellList.Move(ACurIndex, ANewIndex);
end;

procedure TdxReportCell.MoveDataItem(ACurIndex, ANewIndex: Integer);
begin
  FDataList.Move(ACurIndex, ANewIndex);
end;

procedure TdxReportCell.MoveItem(AItem: TdxReportItem; ACurIndex, ANewIndex: Integer);
begin
  if AItem.IsCell then
    MoveCell(ACurIndex, ANewIndex)
  else
    MoveDataItem(ACurIndex, ANewIndex);
end;

procedure TdxReportCell.RemoveCell(AItem: TdxReportCell);
begin
  if FCellList <> nil then
  begin
    FCellList.Remove(AItem);
    CellListRelease;
  end
end;

procedure TdxReportCell.RemoveDataItem(AItem: TdxReportItem);
begin
  if FDataList <> nil then
  begin
    FDataList.Remove(AItem);
    DataListRelease;
  end;
end;

procedure TdxReportCell.RemoveItem(AItem: TdxReportItem);
begin
  if AItem.IsCell then
    RemoveCell(AItem.AsCell)
  else
    RemoveDataItem(AItem);
  AItem.FParent := nil;
end;

function TdxReportCell.GetAbsoluteIndex: Integer;
var
  Cell: TdxReportCell;
begin
  Cell := Self;
  Result := 0;
  while Cell <> nil do
  begin
    Inc(Result, Cell.Index);
    Cell := Cell.Parent;
  end;
end;

function TdxReportCell.GetLevel: Integer;
var
  Cell: TdxReportCell;
begin
  Result := 0;
  Cell := Parent;
  while Cell <> nil do
  begin
    Inc(Result);
    Cell := Cell.Parent;
  end;
end;

procedure TdxReportCell.AllocateSpaceForCells(ACapacity: Integer);
begin
  CellListNeeded;
  if ACapacity > FCellList.Capacity then FCellList.Capacity := ACapacity;
end;

procedure TdxReportCell.AllocateSpaceForDatas(ACapacity: Integer);
begin
  DataListNeeded;
  if ACapacity > FDataList.Capacity then FDataList.Capacity := ACapacity;
end;

function TdxReportCell.GetReportCells: TdxReportCells;
begin
  Result := FReportCells;
end;

procedure TdxReportCell.CellListNeeded;
begin
  if FCellList = nil then FCellList := TList.Create;
end;

procedure TdxReportCell.CellListRelease;
begin
  if (FCellList <> nil) and (FCellList.Count = 0) then
  begin
    FCellList.Free;
    FCellList := nil;
  end;
end;

procedure TdxReportCell.DataListNeeded;
begin
  if FDataList = nil then FDataList := TList.Create;
end;

procedure TdxReportCell.DataListRelease;
begin
  if (FDataList <> nil) and (FDataList.Count = 0) then
  begin
    FDataList.Free;
    FDataList := nil;
  end;
end;

procedure TdxReportCell.ClearCells;
begin
  if FCellList <> nil then
  begin
    while CellCount > 0 do Cells[CellCount - 1].Free;
    CellListRelease;
  end;
end;

procedure TdxReportCell.ClearDataItems;
begin
  if FDataList <> nil then
  begin
    while DataItemCount > 0 do DataItems[DataItemCount - 1].Free;
    DataListRelease;
  end;
end;

function TdxReportCell.GetCells(Index: Integer): TdxReportCell;
begin
  Result := TdxReportCell(FCellList[Index]);
end;

function TdxReportCell.GetCellCount: Integer;
begin
  if FCellList <> nil then
    Result := FCellList.Count
  else
    Result := 0;
end;

function TdxReportCell.GetDataItems(Index: Integer): TAbstractdxReportCellData;
begin
  Result := TAbstractdxReportCellData(FDataList[Index]);
end;

function TdxReportCell.GetDataItemCount: Integer;
begin
  if FDataList <> nil then
    Result := FDataList.Count
  else
    Result := 0;
end;

function TdxReportCell.IndexOf(AItem: TdxReportItem): Integer;
begin
  Result := -1;
  if AItem.IsCell then
  begin
    if FCellList <> nil then
      Result := FCellList.IndexOf(AItem)
  end
  else
    if FDataList <> nil then
      Result := FDataList.IndexOf(AItem);
end;

class function TdxReportCell.IsCell: Boolean;
begin
  Result := True;
end;

procedure TdxReportCell.AddFirst(AItem: TdxReportItem);
begin
  AItem.Parent := Self;
  if AItem.IsCell then
    FCellList.Move(FCellList.Count - 1, 0)
  else
    FDataList.Move(FDataList.Count - 1, 0);
end;

procedure TdxReportCell.DeleteCell(Index: Integer);
var
  ACell: TdxReportCell;
begin
  ACell := Cells[Index];
  ACell.Parent := nil;
end;

procedure TdxReportCell.DeleteDataItem(Index: Integer);
var
  ADataItem: TAbstractdxReportCellData;
begin
  ADataItem := DataItems[Index];
  ADataItem.Parent := nil;
end;

function TdxReportCell.LastCell: TdxReportCell;
begin
  if CellCount > 0 then
    Result := TdxReportCell(FCellList.List^[CellCount - 1])
  else
    Result := nil;
end;

function TdxReportCell.FirstCell: TdxReportCell;
begin
  if CellCount > 0 then
    Result := TdxReportCell(FCellList.List^[0])
  else
    Result := nil;
end;

function TdxReportCell.HasChildren: Boolean;
begin
  Result := CellCount > 0;
end;

procedure TdxReportCell.DrawContent(DC: HDC; DrawRect: TRect; const OriginRect: TRect);

  procedure DrawItems;
  var
    I: Integer;
    R, R2: TRect;
    Done: Boolean;
    SaveItem: TAbstractdxReportCellData;
    F: TFont;
    C: TColor;
  begin
    for I := DataItemCount - 1 downto 0 do
      with DataItems[I] do
      begin
        R := GetUsefulRect; //}BoundsRect;
        if RectVisible(DC, R) and IntersectRect(R2, GetAbsoluteRect, OriginRect) then
        begin
          SaveItem := nil;
          if IsSupportedCustomDraw then
          begin
            SaveItem := TAbstractdxReportCellData(Clone(nil));
            F := Font;
            C := Color;
            Renderer.PrepareCanvasForCustomDraw(@F, @C);
          end;
          try
            Done := False;
            DrawContent(DC, R, GetClientRectRelativeTo(R), Done);
          finally
            if IsSupportedCustomDraw then
            begin
              if FontIndex = -1 then
                with ReportCells.GetItemFont(SaveItem) do
                begin
                  SelectObject(DC, Handle);
                  SetTextColor(DC, ColorToRGB(Color));
                end;
              Assign(SaveItem);
              SaveItem.Free;
              Renderer.UnprepareCanvasForCustomDraw;
            end;
          end;
        end;
      end;
  end;
var
  I: Integer;
  R: TRect;
  Rgn: HRGN;
begin
  if IsEdgeDrawn then
    Renderer.DrawEdge(DC, DrawRect, EdgeMode, InnerEdge, OuterEdge, CellSides);
  if not Transparent then
    Renderer.FillRect(DC, DrawRect, Color);
  Rgn := TdxPSReportRenderer.IntersectClipRect(DC, DrawRect);
  for I := 0 to CellCount - 1 do
    with Cells[I] do
    begin
      DrawRect := GetUsefulRect;
      if RectVisible(DC, DrawRect) and IntersectRect(R, GetAbsoluteRect, OriginRect) then
        with BoundsRect do
        begin
          if (Left <> 0) or (Top <> 0) then OffsetWindowOrgEx(DC, -Left, -Top, nil);
          OffsetRect(DrawRect, -Left, -Top);
          DrawContent(DC, DrawRect, OriginRect);
          if (Left <> 0) or (Top <> 0) then OffsetWindowOrgEx(DC, Left, Top, nil);
        end;
    end;
  if DataItemCount > 0 then DrawItems;
  TdxPSReportRenderer.RestoreClipRgn(DC, Rgn);
end;


{ TdxPSReportBrushPool }

destructor TdxPSReportBrushPool.Destroy;
begin
  Clear;
  inherited Destroy;
end;

function TdxPSReportBrushPool.CreateBrush(AColor: TColor): HBRUSH;
begin
  Result := FCount;
  ReallocItems(FCount + 1);
  with FItems^[FCount - 1] do
  begin
    Color := ColorToRGB(AColor);
    Brush := CreateSolidBrush(AColor);
  end;
end;

procedure TdxPSReportBrushPool.ReallocItems(NewCount: Integer);
begin
  FCount := NewCount;
  ReallocMem(FItems, FCount * SizeOf(TdxPSBrushPoolItem));
end;

function TdxPSReportBrushPool.GetBrushItem(Index: Integer): HBRUSH;
begin
  Result := FItems^[Index].Brush;
end;

function TdxPSReportBrushPool.GetColorItem(Index: Integer): TColor;
begin
  Result := FItems^[Index].Color;
end;

function TdxPSReportBrushPool.Add(AColor: TColor): Integer;
var
  Index: Integer;
begin
  AColor := ColorToRGB(AColor);
  Index := IndexOf(AColor);
  if Index = -1 then
  begin
    CreateBrush(AColor);
    Index := Count - 1;
  end;
  Result := Index;
end;

procedure TdxPSReportBrushPool.Clear;
var
  I: Integer;
begin
  for I := 0 to FCount - 1 do
    DeleteObject(Brushes[I]);
  ReallocItems(0);
end;

function TdxPSReportBrushPool.BrushNeeded(AColor: TColor): HBRUSH;
begin
  Result := Brushes[Add(AColor)];
end;

function TdxPSReportBrushPool.IndexOf(AColor: TColor): Integer;
begin
  for Result := 0 to FCount - 1 do
    if FItems^[Result].Color = AColor then Exit;
  Result := -1;
end;


{ TdxPSReportFontPool }

destructor TdxPSReportFontPool.Destroy;
begin
  Clear;
  inherited Destroy;
end;

procedure TdxPSReportFontPool.ReallocItems(NewCount: Integer);
begin
  FCount := NewCount;
  ReallocMem(FItems, FCount * SizeOf(TdxPSFontPoolItem));
end;

function TdxPSReportFontPool.GetFont(Index: Integer): TFont;
begin
  Result := FItems^[Index].Font;
end;

function TdxPSReportFontPool.Add(AFont: TFont): Integer;
var
  Index: Integer;
begin
  Index := IndexOf(AFont);
  if Index = -1 then Index := CreateFont(AFont);
  Result := Index;
end;

procedure TdxPSReportFontPool.Clear;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do Fonts[I].Free;
  ReallocItems(0);
end;

function TdxPSReportFontPool.CreateFont(AFont: TFont): Integer;
begin
  Result := Count;
  ReallocItems(FCount + 1);
  with FItems^[FCount - 1] do
  begin
    Font := TFont.Create;
    Font.Assign(AFont);
    OriginalSize := Font.Size;
  end;
end;

function TdxPSReportFontPool.IndexOf(AFont: TFont): Integer;
begin
  for Result := 0 to Count - 1 do
    if Fonts[Result] = AFont then Exit;
  Result := -1;
end;

procedure TdxPSReportFontPool.PrepareFonts(UPI: Integer);
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    with FItems^[I] do
      Font.Height := -MulDiv(OriginalSize, UPI, FPtPerInch);
end;


{ TdxReportCells }

constructor TdxReportCells.Create(AReportLink: TBasedxReportLink);
begin
  inherited Create;
  FReportLink := AReportLink;
  BorderColor := dxDefaultGridLineColor;
  BorderWidth := 1;
  FCells := TdxReportCell.Create(nil);
  FCells.FReportCells := Self;
  FCells.Color := dxDefaultColor;
end;

destructor TdxReportCells.Destroy;
begin
  FCells.Free;
  if FFooterCells <> nil then FFooterCells.Free;
  if FHeaderCells <> nil then FHeaderCells.Free;
  inherited Destroy;
end;

procedure TdxReportCells.Assign(Source: TPersistent);
begin
  if Source is TdxReportCells then
  begin
    BorderColor := TdxReportCells(Source).BorderColor;
    BorderWidth := TdxReportCells(Source).BorderWidth;
    Cells.Assign(TdxReportCells(Source).Cells);
    if TdxReportCells(Source).FHeaderCells <> nil then
      HeaderCells.Assign(TdxReportCells(Source).HeaderCells);
    if TdxReportCells(Source).FFooterCells <> nil then
      FooterCells.Assign(TdxReportCells(Source).FooterCells);
  end
  else
    inherited Assign(Source);
end;

function TdxReportCells.GetItemFont(AItem: TdxReportVisualItem): TFont;
begin
  Result := ReportLink.FontPool[AItem.FontIndex];
end;

procedure TdxReportCells.DoProgress(const PercentDone: Double);
begin
  if ReportLink <> nil then ReportLink.DoProgress(PercentDone);
//  Application.ProcessMessages;
end;

procedure TdxReportCells.ClearItems;
begin
  FCells.ClearCells;
  FCells.ClearDataItems;
end;

procedure TdxReportCells.SetBorderColor(Value: TColor);
begin
  FBorderColor := ColorToRGB(Value);
end;

function TdxReportCells.GetBoundsRect: TRect;
begin
  Result := Cells.BoundsRect;
end;

function TdxReportCells.GetCount: Integer;
begin
  Result := Cells.CellCount;
end;

function TdxReportCells.GetFooterCells: TdxReportCell;
begin
  if FFooterCells = nil then CreateFooterCells;
  Result := FFooterCells;
end;

function TdxReportCells.GetHeaderCells: TdxReportCell;
begin
  if FHeaderCells = nil then CreateHeaderCells;
  Result := FHeaderCells;
end;

function TdxReportCells.GetRenderer: TdxPSReportRenderer;
begin
  Result := ReportLink.Renderer;
end;

procedure TdxReportCells.CreateFooterCells;
begin
  FFooterCells := TdxReportCell.Create(nil);
  FFooterCells.FReportCells := Self;
  FFooterCells.Color := dxDefaultFixedColor;
end;

procedure TdxReportCells.CreateHeaderCells;
begin
  FHeaderCells := TdxReportCell.Create(nil);
  FHeaderCells.FReportCells := Self;
  FHeaderCells.Color := dxDefaultFixedColor;
end;

function TdxReportCells.GetFont: TFont;
begin
  Result := Cells.Font;
end;

function TdxReportCells.GetFooterBoundsRect: TRect;
begin
  if FFooterCells <> nil then
    Result := FFooterCells.BoundsRect
  else
    FillChar(Result, SizeOf(TRect), 0);
end;

function TdxReportCells.GetHeaderBoundsRect: TRect;
begin
  if FHeaderCells <> nil then
    Result := FHeaderCells.BoundsRect
  else
    FillChar(Result, SizeOf(TRect), 0);
end;

function TdxReportCells.GetFooterCellCount: Integer;
begin
  if FFooterCells <> nil then
    Result := FFooterCells.CellCount
  else
    Result := 0;
end;

function TdxReportCells.GetHeaderCellCount: Integer;
begin
  if FHeaderCells <> nil then
    Result := FHeaderCells.CellCount
  else
    Result := 0;
end;


{ TAbstractdxReportCellData }

constructor TAbstractdxReportCellData.Create(AParent: TdxReportCell);
begin
  inherited Create(AParent);
  EndEllipsis := dxDefaultEndEllipsis; {False}
  Multiline := dxDefaultMultiline; {False}
  SortOrder := dxDefaultSortOrder; {False}
  TextAlignX := dxDefaultTextAlignX; {taLeft}
  TextAlignY := dxDefaultTextAlignY; {taTop}
end;

procedure TAbstractdxReportCellData.DrawContent(DC: HDC; var R: TRect;
  AClientRect: TRect; var ADone: Boolean);
begin
  if IsSupportedCustomDraw then
    Renderer.CustomDrawReportItem(Self, R, AClientRect, ADone);
  if not ADone and IsEdgeDrawn then
    Renderer.DrawEdge(DC, R, EdgeMode, InnerEdge, OuterEdge, CellSides);
end;

class function TAbstractdxReportCellData.DataType: TdxReportCellDataClass;
begin
  Result := TdxReportCellDataClass(GetTypeData(ClassInfo)^.ClassType);
end;

function TAbstractdxReportCellData.GetSortOrder: TdxCellSortOrder;
begin
  Result := TdxCellSortOrder(Integer((Format and dxFormatSortUp) shr $16) +
    Integer((Format and dxFormatSortDown) shr $16));
end;

function TAbstractdxReportCellData.GetEndEllipsis: Boolean;
begin
  Result := (Format and dxFormatEndEllipsis) = dxFormatEndEllipsis;
end;

function TAbstractdxReportCellData.GetMultiline: Boolean;
begin
  Result := (Format and dxFormatMultiline) = dxFormatMultiline;
end;

function TAbstractdxReportCellData.GetTextAlignX: TdxTextAlignX;
begin
  Result := TdxTextAlignX(((Format and dxFormatTextAlignXRight) shr $4) - 1);
end;

function TAbstractdxReportCellData.GetTextAlignY: TdxTextAlignY;
begin
  Result := TdxTextAlignY(((Format and dxFormatTextAlignYBottom) shr $6) - 1);
end;

procedure TAbstractdxReportCellData.SetSortOrder(Value: TdxCellSortOrder);
begin
  Format := Format and not dxFormatSortOrder or (Byte(Value) shl $16);
end;

procedure TAbstractdxReportCellData.SetMultiline(Value: Boolean);
const
  dxMultiline: array[Boolean] of Integer = (0, dxFormatMultiline);
begin
  Format := Format and not dxFormatMultiline or dxMultiline[Value]
end;

procedure TAbstractdxReportCellData.SetEndEllipsis(Value: Boolean);
const
  dxEndEllipsis: array[Boolean] of Integer = (0, dxFormatEndEllipsis);
begin
  Format := Format and not dxFormatEndEllipsis or dxEndEllipsis[Value];
end;

procedure TAbstractdxReportCellData.SetTextAlignX(Value: TdxTextAlignX);
begin
  Format := Format and not dxFormatTextAlignXRight or ((Byte(Value) + 1) shl $4);
end;

procedure TAbstractdxReportCellData.SetTextAlignY(Value: TdxTextAlignY);
begin
  Format := Format and not dxFormatTextAlignYBottom or ((Byte(Value) + 1) shl $6);
end;

function TAbstractdxReportCellData.IsSupportedCustomDraw: Boolean;
begin
  with GetReportCells do
    Result := Assigned(ReportLink) and ReportLink.IsSupportedCustomDraw(Self);
end;

{ TdxReportCellBox }

procedure TdxReportCellBox.DrawContent(DC: HDC; var R: TRect; AClientRect: TRect;
  var ADone: Boolean);
begin
  inherited DrawContent(DC, R, AClientRect, ADone);
  if not ADone and not Transparent then
    Renderer.FillRect(DC, ClientRect, Color);
end;

{ TdxReportCellText }

procedure TdxReportCellText.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TdxReportCellText) then
  begin
    SetText(TdxReportCellText(Source).GetText);
    Indent := TdxReportCellText(Source).Indent;
  end;
end;

procedure TdxReportCellText.GetTextRect(var R: TRect);
begin
  R := GetClientRect;
  if SortOrder > csoNone then
    Dec(R.Right, MulDiv(FSortMarkRgnSize, PixelsNumerator, PixelsDenominator));
end;

procedure TdxReportCellText.DrawContent(DC: HDC; var R: TRect; AClientRect: TRect;
  var ADone: Boolean);
var
  S: string;
begin
  inherited DrawContent(DC, R, AClientRect, ADone);
  if ADone then Exit;
  GetTextRect(R);
  if not IsRectEmpty(R) then
  begin
    S := GetText;
    if S <> '' then
      Renderer.DrawText(DC, R, Indent, S, Font, Color, TextAlignX, TextAlignY,
        not Transparent, Multiline, EndEllipsis)
    else
      if not Transparent then
        Renderer.FillRect(DC, R, Color);
  end;
  if SortOrder > csoNone then
  begin
    R := GetClientRect;
    R.Left := R.Right - MulDiv(FSortMarkRgnSize, PixelsNumerator, PixelsDenominator);
    if not Transparent then
      Renderer.FillRect(DC, R, Color);
    Renderer.DrawSortMark(DC, R, SortOrder, not Is3DEdge);
  end;
end;


{ TdxReportCellString }

function TdxReportCellString.GetText: string;
begin
  Result := FText;
end;

procedure TdxReportCellString.SetText(const Value: string);
begin
  FText := Value;
end;


{ TdxReportCellImageContainer }

procedure TdxReportCellImageContainer.DrawContent(DC: HDC; var R: TRect;
  AClientRect: TRect; var ADone: Boolean);
var
  FullR: TRect;
begin
  inherited DrawContent(DC, R, AClientRect, ADone);
  if not ADone then
  begin
    GetImageRects(R, FullR);
    if not IsRectEmpty(FullR) then
      if IsImageDrawn(False) then
        DrawImage(DC, R, FullR)
      else
        if not Transparent then
          Renderer.FillRect(DC, FullR, Color);
  end;
end;

procedure TdxReportCellImageContainer.DrawImage(DC: HDC; var R, FullR: TRect);
begin
end;

procedure TdxReportCellImageContainer.GetImageRects(var R, FullR: TRect);
begin
  FillChar(R, SizeOf(TRect), 0);
  FillChar(FullR, SizeOf(TRect), 0);
end;

function TdxReportCellImageContainer.IsImageDrawn(ForCalc: Boolean): Boolean;
begin
  Result := True;
end;


{ TdxCheckImage }

constructor TdxReportCellCheck.Create(AParent: TdxReportCell);
begin
  inherited Create(AParent);
  Checked := False;
  CheckPos := dxDefaultCheckPos;
  Enabled := True;
  FlatBorder := dxDefaultCheckFlatBorder;
end;

procedure TdxReportCellCheck.GetTextRect(var R: TRect);
begin
  if CheckPos = ccpCenter then
    FillChar(R, SizeOf(TRect), 0)
  else
  begin
    inherited GetTextRect(R);
    if CheckPos = ccpLeft then
      Inc(R.Left, MulDiv(CheckWidth + 1, PixelsNumerator, PixelsDenominator))
    else
      Dec(R.Right, MulDiv(CheckWidth + 1, PixelsNumerator, PixelsDenominator))
  end;
end;

procedure TdxReportCellCheck.GetImageRects(var R, FullR: TRect);
var
  W, H: Integer;
begin
  FullR := GetClientRect;
  W := MulDiv(CheckWidth, PixelsNumerator, PixelsDenominator);
  H := MulDiv(CheckHeight, PixelsNumerator, PixelsDenominator);
  with FullR do
    case CheckPos of
      ccpCenter:
        R := Bounds(Left + (Width - W) div 2, Top + (Height - H) div 2, W, H);
      ccpLeft:
        begin
          Right := Left + FUnitsPerPixel + W + FUnitsPerPixel;
          R := Bounds(Left + FUnitsPerPixel, Top + (Height - H) div 2, W, H);
        end;
    else {ccpRight}
      begin
        Left := Right - FUnitsPerPixel + W + FUnitsPerPixel;
        R := Bounds(Right - W - FUnitsPerPixel, Top + (Height - H) div 2, W, H);
      end;
    end;
end;

procedure TdxReportCellCheck.DrawCheck(DC: HDC; var R, FullR: TRect);
begin
  Renderer.DrawCheckBox(DC, R, Checked, Enabled, FlatBorder);
end;

procedure TdxReportCellCheck.DrawImage(DC: HDC; var R, FullR: TRect);
begin
  if not Transparent then
    Renderer.FillRect(DC, FullR, Color);
  DrawCheck(DC, R, FullR);
end;

function TdxReportCellCheck.GetState: TCheckBoxState;
begin
  if Enabled then
    Result := TCheckBoxState(Checked)
  else
    Result := cbGrayed;
end;

function TdxReportCellCheck.GetChecked: Boolean;
begin
  Result := (Format and dxFormatCheckChecked) = dxFormatCheckChecked;
end;

procedure TdxReportCellCheck.SetChecked(Value: Boolean);
const
  dxCheckChecked: array[Boolean] of Integer = (0, dxFormatCheckChecked);
begin
  Format := Format and not dxFormatCheckChecked or dxCheckChecked[Value];
end;

function TdxReportCellCheck.GetEnabled: Boolean;
begin
  Result := (Format and dxFormatCheckEnabled) = dxFormatCheckEnabled;
end;

procedure TdxReportCellCheck.SetEnabled(Value: Boolean);
const
  dxCheckEnabled: array[Boolean] of Integer = (0, dxFormatCheckEnabled);
begin
  Format := Format and not dxFormatCheckEnabled or dxCheckEnabled[Value];
end;

function TdxReportCellCheck.GetFlatBorder: Boolean;
begin
  Result := (Format and dxFormatFlatCheckMarks) = dxFormatFlatCheckMarks;
end;

procedure TdxReportCellCheck.SetFlatBorder(Value: Boolean);
const
  dxFlat: array[Boolean] of Integer = (0, dxFormatFlatCheckMarks);
begin
  Format := Format and not dxFormatFlatCheckMarks or dxFlat[Value];
end;

function TdxReportCellCheck.GetCheckPos: TdxCellCheckPos;
begin
  Result := TdxCellCheckPos(Integer((Format and dxFormatCheckPosCenter) shr $1A) +
    Integer((Format and dxFormatCheckPosRight) shr $1A));
end;

procedure TdxReportCellCheck.SetCheckPos(Value: TdxCellCheckPos);
begin
  if (Length(Text) > 0) and (Value = ccpCenter) then SetText('');
  Format := Format and not dxFormatCheckPos or (Byte(Value) shl $1A);
end;

procedure TdxReportCellCheck.SetText(const Value: string);
begin
  inherited SetText(Value);
  if (Length(Value) > 0) and (CheckPos = ccpCenter) then
    CheckPos := ccpLeft;
end;


{ TdxReportCellCheckImage }

destructor TdxReportCellCheckImage.Destroy;
begin
  if FImage <> nil then FImage.Free;
  inherited Destroy;
end;

procedure TdxReportCellCheckImage.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if Source is TdxReportCellCheckImage then
    SetImage(TdxReportCellCheckImage(Source).FImage);
end;

function TdxReportCellCheckImage.GetImage: TBitmap;
begin
  if FImage = nil then FImage := TBitmap.Create;
  Result := FImage;
end;

procedure TdxReportCellCheckImage.SetImage(Value: TBitmap);
begin
  if (FImage <> nil) xor (Value <> nil) then
    if Value <> nil then
      Image.Assign(Value)
    else
    begin
      FImage.Free;
      FImage := nil;
    end;
end;

//cbUnchecked, cbChecked, cbGrayed

procedure TdxReportCellCheckImage.DrawCheck(DC: HDC; var R, FullR: TRect);
const
  ImageIndexes: array[TCheckBoxState] of Integer = (0, 1, 2);
begin
  if not Image.Empty then
  begin
    with Renderer.FDrawBitmap do
    begin
      Handle := 0;
      Width := Image.Height;
      Height := Image.Height;
      Canvas.CopyRect(Rect(0, 0, Width, Height), Image.Canvas,
        Bounds(Width * ImageIndexes[State], 0, Width, Height));
    end;
    Renderer.DrawGraphic(DC, R, FullR, nil, 0, Renderer.FDrawBitmap, True, Transparent, Color);
  end
  else
    inherited DrawCheck(DC, R, FullR);
end;


{ TdxReportCellCustomImage }

constructor TdxReportCellCustomImage.Create(AParent: TdxReportCell);
begin
  inherited Create(AParent);
  ImageTransparent := True;
  FImageIndex := -1;
end;

destructor TdxReportCellCustomImage.Destroy;
begin
  if FImage <> nil then FImage.Free;
  inherited Destroy;
end;

procedure TdxReportCellCustomImage.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if Source is TdxReportCellCustomImage then
    SetImage(TdxReportCellCustomImage(Source).FImage);
end;

function TdxReportCellCustomImage.CreateImage(AGraphicClass: TGraphicClass): TGraphic;
begin
  if (FImage = nil) or not (FImage is AGraphicClass) then
  begin
    if FImage <> nil then FImage.Free;
    FImage := TGraphicClassAccess(AGraphicClass).Create;
  end;
  Result := FImage;
end;

procedure TdxReportCellCustomImage.SetImage(Value: TGraphic);
begin
  if (Value <> nil) xor (FImage <> nil) then
    if (Value <> nil) then
    begin
      CreateImage(TGraphicClassAccess(Value.ClassType)).Assign(Value);
      if Image is TBitmap then
      begin
        TBitmap(Image).Dormant;
        TBitmap(Image).FreeImage;
      end;
      if Width = 0 then Width := Image.Width;
      if Height = 0 then Height := Image.Height;
    end
    else
      if FImage <> nil then
      begin
        FImage.Free;
        FImage := nil;
      end;
end;

function TdxReportCellCustomImage.GetImageTransparent: Boolean;
begin
  Result := (Format and dxFormatImageTransparent) = dxFormatImageTransparent;
end;

procedure TdxReportCellCustomImage.SetImageTransparent(Value: Boolean);
const
  dxImageTransparent: array[Boolean] of Integer = (0, dxFormatImageTransparent);
begin
  Format := Format and not dxFormatImageTransparent or dxImageTransparent[Value];
end;

procedure TdxReportCellCustomImage.GetImageSize(var W, H: Integer);
begin
  if FImage <> nil then
  begin
    W := Image.Width;
    H := Image.Height;
  end
  else
    if ImageList <> nil then
    begin
      W := ImageList.Width;
      H := ImageList.Height;
    end
    else
    begin
      W := 0;
      H := 0;
    end;
  W := MulDiv(W, PixelsNumerator, PixelsDenominator);
  H := MulDiv(H, PixelsNumerator, PixelsDenominator);
end;

function TdxReportCellCustomImage.IsImageDrawn(ForCalc: Boolean): Boolean;
begin
  Result := (FImage <> nil) or (ImageList <> nil);
  if Result and (ImageList <> nil) and not ForCalc then
    Result := (ImageIndex > -1) and (ImageIndex < ImageList.Count);
end;


{ TdxReportCellImage }

procedure TdxReportCellImage.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TdxReportCellImage) then
    ImageLayout := TdxReportCellImage(Source).ImageLayout;
end;

function TdxReportCellImage.GetMakeSpaceForEmptyImage: Boolean;
begin
  Result := (Format and dxFormatMakeSpaceForEmptyImage) = dxFormatMakeSpaceForEmptyImage;
end;

procedure TdxReportCellImage.SetMakeSpaceForEmptyImage(Value: Boolean);
const
  dxMakeSpaceForEmptyImage: array[Boolean] of Integer = (0, dxFormatMakeSpaceForEmptyImage);
begin
  Format := Format and not dxFormatMakeSpaceForEmptyImage or dxMakeSpaceForEmptyImage[Value];
end;

function TdxReportCellImage.IsImageDrawn(ForCalc: Boolean): Boolean;
begin
  Result := inherited IsImageDrawn(ForCalc);
//  if ForCalc then
//    Result := Result or MakeSpaceForEmptyImage;
end;

procedure TdxReportCellImage.GetImageRects(var R, FullR: TRect);
var
  W, H: Integer;
begin
  if not IsImageDrawn(True) then
    inherited GetImageRects(R, FullR)
  else
  begin
    GetImageSize(W, H);
    FullR := GetClientRect;
    R := FullR;
    case FImageLayout of
      ilImageLeft:
        begin
          R := Bounds(R.Left + FUnitsPerPixel, R.Top + (R.Bottom - R.Top - H) div 2, W, H);
          FullR.Right := FullR.Left + W + 2 * FUnitsPerPixel;
        end;
      ilImageTop:
        begin
          R := Bounds(R.Left + (R.Right - R.Left - W) div 2, R.Top + FUnitsPerPixel, W, H);
          FullR.Bottom := FullR.Top + H + 2 * FUnitsPerPixel;
        end;
      ilImageRight:
        begin
          R := Bounds(R.Left - W - FUnitsPerPixel, R.Top + (R.Bottom - R.Top - H) div 2, W, H);
          FullR.Left := FullR.Right - W - 2 * FUnitsPerPixel;
        end;
      ilImageBottom:
        begin
          R := Bounds(R.Left + (R.Right - R.Left - W) div 2, R.Bottom - H - FUnitsPerPixel, W, H);
          FullR.Top := FullR.Bottom - H - 2 * FUnitsPerPixel;
        end;
      ilImageCenter:
        begin
          R := Bounds(R.Left + (R.Right - R.Left - W) div 2, R.Top + (R.Bottom - R.Top - H) div 2, W, H);
          FullR := R;
        end;
    end;
  end;
end;

procedure TdxReportCellImage.GetTextRect(var R: TRect);
var
  W, H: Integer;
begin
  inherited GetTextRect(R);
  if not IsImageDrawn(True) then Exit;

  GetImageSize(W, H);
  case FImageLayout of
    ilImageLeft:
      Inc(R.Left, W + 2 * FUnitsPerPixel);
    ilImageTop:
      Inc(R.Top, H + 2 * FUnitsPerPixel);
    ilImageRight:
      Dec(R.Right, W + 2 * FUnitsPerPixel);
    ilImageBottom:
      Dec(R.Bottom, H + 2 * FUnitsPerPixel);
    ilImageCenter: ;
  end;
end;

procedure TdxReportCellImage.DrawImage(DC: HDC; var R, FullR: TRect);
begin
  Renderer.DrawGraphic(DC, R, FullR, ImageList, ImageIndex, FImage,
    ImageTransparent, Transparent, Color);
end;


{ TdxReportCellGraphic }

procedure TdxReportCellGraphic.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TdxReportCellGraphic) then
    DrawMode := TdxReportCellGraphic(Source).DrawMode;
end;

procedure TdxReportCellGraphic.GetImageRects(var R, FullR: TRect);
var
  W, H, cW, cH: Integer;
begin
  FullR := GetClientRect;
  R := FullR;
  GetImageSize(W, H);
  if (W = 0) or (H = 0) then Exit;
  with R do
    case DrawMode of
      gdmNone:
        begin
          Right := Left + W;
          Bottom := Top + H;
        end;
      gdmCenter:
        R := Bounds(Left + (Right - Left - W) div 2, Top + (Bottom - Top - H) div 2, W, H);
      gdmStretch: ;
    else {gdmStretchProportional}
      begin
        cW := Right - Left;
        cH := Bottom - Top;
        if (W / H > cW / cH) then
        begin
          Right := Left + cW;
          Bottom := Top + MulDiv(cW, H, W);
        end
        else
        begin
          Bottom := Top + cH;
          Right := Left + MulDiv(cH, W, H);
        end;
      end;
    end;
end;

procedure TdxReportCellGraphic.GetTextRect(var R: TRect);
begin
  R := Rect(0, 0, 0, 0);
end;

procedure TdxReportCellGraphic.DrawImage(DC: HDC; var R, FullR: TRect);
begin
  Renderer.DrawGraphic(DC, R, FullR, ImageList, ImageIndex, FImage, ImageTransparent, Transparent, Color);
end;


{ TdxPreviewOptions }

constructor TdxPreviewOptions.Create;
begin
  inherited Create;
  FCaption := sdxPrintPreview;
  FEnableOptions := dxDefaultPreviewEnableOptions;
  FIcon := TIcon.Create;
  RestoreOriginalIcon;
  FRect := GetDeskTopWorkArea;
  FSavePosition := True;
  FSaveZoomPosition := True;
  FWindowState := wsNormal;
  FVisibleOptions := dxDefaultPreviewVisibleOptions;
end;

destructor TdxPreviewOptions.Destroy;
begin
  FIcon.Free;
  inherited Destroy;
end;

procedure TdxPreviewOptions.AssignInternal(Source: TPersistent);
var
  Src: TdxPreviewOptions absolute Source;
begin
  Caption := Src.Caption;
  EnableOptions := Src.EnableOptions;
  HelpContext := Src.HelpContext;
  HelpFile := Src.HelpFile;
  Icon := Src.Icon;
  Rect := Src.Rect;
  SavePosition := Src.SavePosition;
  SaveZoomPosition := Src.SaveZoomPosition;
  WindowState := Src.WindowState;
  VisibleOptions := Src.VisibleOptions;
end;

procedure TdxPreviewOptions.RestoreOriginalIcon;
begin
  FIcon.Handle := LoadIconFromBitmapRes(DXCP_BMPPREVIEW);
  FOriginalIcon := True;
end;

procedure TdxPreviewOptions.WriteData(Stream: TStream);
begin
  Stream.WriteBuffer(FRect, SizeOf(TRect));
end;

procedure TdxPreviewOptions.ReadData(Stream: TStream);
begin
  Stream.ReadBuffer(FRect, SizeOf(TRect));
end;

procedure TdxPreviewOptions.DefineProperties(Filer: TFiler);
  function IsPositionStored: Boolean;
  begin
    Result := not EqualRect(Rect, GetDeskTopWorkArea);
  end;
begin
  inherited DefineProperties(Filer);
  Filer.DefineBinaryProperty('PreviewBoundsRect', ReadData, WriteData, IsPositionStored);
end;

procedure TdxPreviewOptions.SetIcon(Value: TIcon);
begin
  if FIcon <> Value then
  begin
    FIcon.Assign(Value);
    FOriginalIcon := False;
  end;
end;

function TdxPreviewOptions.IsIconStored: Boolean;
begin
  Result := not FOriginalIcon;
end;

function TdxPreviewOptions.IsCaptionStored: Boolean;
begin
  Result := (AnsiCompareStr(FCaption, sdxPrintPreview) <> 0);
end;

function TdxPreviewOptions.GetPosition(Index: Integer): Integer;
begin
  case Index of
    0: Result := FRect.Bottom - FRect.Top;
    1: Result := FRect.Left;
    2: Result := FRect.Top;
  else {3}
    Result := FRect.Right - FRect.Left;
  end;
end;

procedure TdxPreviewOptions.SetPosition(Index: Integer; Value: Integer);
begin
  case Index of
    0: FRect.Bottom := FRect.Top + Value;
    1: FRect.Left := Value;
    2: FRect.Top := Value;
  else {3}
    FRect.Right := FRect.Left + Value;
  end;
end;

function TdxPreviewOptions.IsAvailablePreviewWindow: Boolean;
begin
  Result := Assigned(FComponentPrinter) and not FComponentPrinter.IsDesigning and
    FComponentPrinter.PreviewExists;
end;

function TdxPreviewOptions.PreviewWindow: TBasedxPreviewWindow;
begin
  Result := FComponentPrinter.PreviewWindow;
end;

function TdxPreviewOptions.GetHelpFile: string;
begin
  Result := dxPSEngine.HelpFile;
end;

function TdxPreviewOptions.GetRegistryPath: string;
begin
  Result := dxPSEngine.RealRegistryPath;
end;

procedure TdxPreviewOptions.SetEnableOptions(Value: TdxPreviewEnableOptions);
begin
  if FEnableOptions <> Value then
  begin
    FEnableOptions := Value;
    if IsAvailablePreviewWindow then
      PreviewWindow.SetPreviewEnableOptions(FEnableOptions);
  end;
end;

procedure TdxPreviewOptions.SetVisibleOptions(Value: TdxPreviewVisibleOptions);
begin
  if FVisibleOptions <> Value then
  begin
    FVisibleOptions := Value;
    if IsAvailablePreviewWindow then
      PreviewWindow.SetPreviewVisibleOptions(FVisibleOptions);
  end;
end;

procedure TdxPreviewOptions.SetCaption(const Value: string);
begin
  FCaption := Value;
  if IsAvailablePreviewWindow then PreviewWindow.Caption := FCaption;
end;

procedure TdxPreviewOptions.SetHelpFile(const Value: string);
begin
  dxPSEngine.HelpFile := Value;
  if IsAvailablePreviewWindow then PreviewWindow.HelpFile := Value;
end;

procedure TdxPreviewOptions.SetHelpContext(Value: THelpContext);
begin
  FHelpContext := Value;
  if IsAvailablePreviewWindow then PreviewWindow.HelpContext := FHelpContext;
end;

procedure TdxPreviewOptions.SetWindowState(Value: TWindowState);
begin
  FWindowState := Value;
  if IsAvailablePreviewWindow then PreviewWindow.WindowState := FWindowState;
end;

procedure TdxPreviewOptions.SetRegistryPath(const Value: string);
begin
  dxPSEngine.RegistryPath := Value;
end;


{ TCustomdxComponentPrinter }

constructor TCustomdxComponentPrinter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAutoUpdateDateTime := True;
  FBeepAfterLongOperations := True;
  FCurrentLink := nil;
  FDateFormat := 0;
  FLongOperationTime := 5000;
  FPageNumberFormat := pnfNumeral;
  FReportLinkDesigner := nil;
  FPreviewWindowDesigner := nil;
  FPrintTitle := '';
  FState := [];
  FPreviewOptions := TdxPreviewOptions.Create;
  FPreviewOptions.FComponentPrinter := Self;
  FPrintFileList := TStringList.Create;
  FOptions := dxDefaultCPOptions;
  FLinkList := TList.Create;
  FSaveCopies := 1;
  FSaveCollate := False;
  FTimeFormat := 0;
  FWindowHandle := {$IFDEF DELPHI6}Classes.{$ENDIF}AllocatehWnd(WndProc);
end;

destructor TCustomdxComponentPrinter.Destroy;
begin
{$IFNDEF DELPHI5}
  Destroying;
{$ENDIF}
  if IsWindow(FWindowHandle) then
{$IFDEF DELPHI6}Classes.{$ENDIF}DeallocatehWnd(FWindowHandle);
  FPrintFileList.Free;
  FPreviewWindowDesigner.Free;
  FReportLinkDesigner.Free;
  if not IsDesigning then
    DestroyPreviewWindow;
  FPreviewOptions.Free;
  DeleteAllLinks;
  FLinkList.Free;
  inherited Destroy;
end;

procedure TCustomdxComponentPrinter.WndProc(var message: TMessage);
var
  I: Integer;
begin
  with Message do
    case Msg of
      WM_SETTINGCHANGE:
//        if (PChar(message.lParam) = 'devices') then
        begin
          RereadDefaultPrinterPage;
          for I := 0 to LinkCount - 1 do
            ReportLink[I].DefaultHandler(message);
          DesignerModified;
        end;
    end;
end;

procedure TCustomdxComponentPrinter.GetChildren(Proc: TGetChildProc;
  Root: TComponent);
var
  I: Integer;
  AReportLink: TBasedxReportLink;
begin
  for I := 0 to LinkCount - 1 do
  begin
    AReportLink := ReportLink[I];
    if Root = AReportLink.Owner then
      Proc(AReportLink);
  end;
end;

procedure TCustomdxComponentPrinter.SetChildOrder(Child: TComponent; Order: Integer);
begin
  inherited SetChildOrder(Child, Order);
  if FLinkList.IndexOf(Child) > -1 then
    (Child as TBasedxReportLink).Index := Order;
end;

procedure TCustomdxComponentPrinter.DesignerUpdate(AItem: TBasedxReportLink);
begin
  if ReportLinkDesigner <> nil then
    ReportLinkDesigner.Update(AItem);
end;

procedure TCustomdxComponentPrinter.DesignerModified;
begin
  if ReportLinkDesigner <> nil then
    ReportLinkDesigner.Modified;
end;

procedure TCustomdxComponentPrinter.SetName(const NewName: TComponentName);
var
  AName: string;
  OldName: string;
  P, I: Integer;
  Link: TBasedxReportLink;
begin
  OldName := Name;
  inherited SetName(NewName);
  if IsDesigning and (LinkCount > 0) then
  try
    if ReportLinkDesigner <> nil then
      ReportLinkDesigner.BeginUpdate;
    try
      for I := 0 to LinkCount - 1 do
      begin
        Link := ReportLink[I];
        P := Pos(OldName, Link.Name);
        if (P = 0) then
          AName := Name + Link.Name
        else
          AName := Copy(Link.Name, 1, P - 1) + Name +
            Copy(Link.Name, P + Length(OldName), Length(Link.Name) - P - Length(OldName) + 1);
        Link.Name := AName;
      end;
    finally
      if ReportLinkDesigner <> nil then
        ReportLinkDesigner.EndUpdate;
    end;
  except
    on EComponentError do ; {Ignore rename errors }
  end;
end;

function TCustomdxComponentPrinter.IsDesigning: Boolean;
begin
  Result := csDesigning in ComponentState;
end;

function TCustomdxComponentPrinter.IsLoading: Boolean;
begin
  Result := csLoading in ComponentState;
end;

function TCustomdxComponentPrinter.IsDestroying: Boolean;
begin
  Result := csDestroying in ComponentState;
end;

procedure TCustomdxComponentPrinter.SetLongOperationTime(Value: Integer);
begin
  if Value < 0 then Value := 0;
  if FLongOperationTime <> Value then FLongOperationTime := Value;
end;

procedure TCustomdxComponentPrinter.SetPreviewOptions(Value: TdxPreviewOptions);
begin
  FPreviewOptions.Assign(Value);
end;

function TCustomdxComponentPrinter.IsForegroundPreviewWindow: Boolean;
begin
  Result := (cpsPreviewing in State) and (PreviewWindow <> nil) and 
    (GetForegroundWindow = PreviewWindow.Handle);
end;

function TCustomdxComponentPrinter.IsGenerateReportProgressEvent: Boolean;
begin
  Result := not IsDesigning and not IsLoading and (cpoGenerateReportProgressEvent in Options);
end;

function TCustomdxComponentPrinter.IsRebuildBeforePrint: Boolean;
begin
  Result := IsDesigning or (cpoAutoRebuildBeforePrint in Options) or
    ((CurrentLink <> nil) and CurrentLink.RebuildNeeded);
end;

function TCustomdxComponentPrinter.IsRebuildBeforePreview: Boolean;
begin
  Result := IsDesigning or (cpoAutoRebuildBeforePreview in Options) or
    ((CurrentLink <> nil) and CurrentLink.RebuildNeeded);
end;

function TCustomdxComponentPrinter.IsShowHourGlass: Boolean;
begin
  Result := cpoShowHourGlass in Options;
end;

function TCustomdxComponentPrinter.GetReportLink(index: Integer): TBasedxReportLink;
begin
  Result := TBasedxReportLink(FLinkList.Items[index]);
end;

procedure TCustomdxComponentPrinter.SetReportLink(Index: Integer; Value: TBasedxReportLink);
begin
  ReportLink[Index].Assign(Value);
end;

procedure TCustomdxComponentPrinter.SetAbortPrinting(Value: Boolean);
begin
  FAbortPrinting := True;
end;

function TCustomdxComponentPrinter.GetCurrentLinkIndex: Integer;
begin
  if CurrentLink <> nil then
    Result := CurrentLink.Index
  else
    Result := -1;
end;

procedure TCustomdxComponentPrinter.SetCurrentLinkIndex(Value: Integer);
begin
  if Value < 0 then 
    Value := 0;
  if Value > LinkCount - 1 then 
    Value := LinkCount - 1;
  if Value > -1 then 
    CurrentLink := ReportLink[Value];
end;

procedure TCustomdxComponentPrinter.SetCurrentLink(Value: TBasedxReportLink);
begin
  if (CurrentLink <> Value) and (IndexOfLink(Value) > -1) then
  begin
    if PreviewExists then DestroyPreviewWindow;
    FCurrentLink := Value;
    DoChangeCurrentLink;
    FormatChanged;
    DesignerUpdate(Value);//nil);
  end;
end;

procedure TCustomdxComponentPrinter.SetPrintFileList(Value: TStrings);
begin
  FPrintFileList.Assign(Value);
end;

procedure TCustomdxComponentPrinter.FormatChanged;
begin
  if dxHFFormatObject = nil then Exit;
  dxHFFormatObject.DateFormat := dxPgsDlg.DateFormats[CurrentLink.DateFormat];
  dxHFFormatObject.DateTime := CurrentLink.DateTime;
  dxHFFormatObject.PageNumberFormat := CurrentLink.PageNumberFormat;
  dxHFFormatObject.StartPageIndex := CurrentLink.StartPageIndex;
  dxHFFormatObject.TimeFormat := dxPgsDlg.TimeFormats[CurrentLink.TimeFormat];
end;

function TCustomdxComponentPrinter.GetLinkCount: Integer;
begin
  Result := FLinkList.Count
end;

procedure TCustomdxComponentPrinter.ResyncCurrentLink(AIndex: Integer);
begin
  if AIndex > LinkCount - 1 then
    AIndex := LinkCount - 1;
  if AIndex < 0 then
  begin
    FCurrentLink := nil;
    DoChangeCurrentLink;
  end
  else
    CurrentLink := ReportLink[AIndex];
end;

procedure TCustomdxComponentPrinter.MoveLink(ACurIndex, ANewIndex: Integer);
begin
  FLinkList.Move(ACurIndex, ANewIndex);
  DesignerUpdate(nil);
end;

procedure TCustomdxComponentPrinter.RemoveLink(Value: TBasedxReportLink);
var
  Index: Integer;
begin
  if not IsDestroying and (FCurrentLink = Value) then
  begin
    if PreviewExists then DestroyPreviewWindow;
    Index := Value.Index;
  end
  else
    Index := -1;
  FLinkList.Remove(Value);
  Value.FComponentPrinter := nil;
  if Index <> -1 then 
    ResyncCurrentLink(Index);
  DoDeleteReportLink(Value);
end;

procedure TCustomdxComponentPrinter.InsertLink(Value: TBasedxReportLink);
begin
  FLinkList.Add(Value);
  Value.FComponentPrinter := Self;
  if LinkCount = 1 then Value.IsCurrentLink := True;
  DoAddReportLink(Value);
end;

procedure TCustomdxComponentPrinter.AssignReportLinks(Source: TCustomdxComponentPrinter);
var
  I: Integer;
  AReportLink: TBasedxReportLink;
  ASaveOwner: TComponent;
begin
  if LinkCount > 0 then
    ASaveOwner := ReportLink[0].Owner
  else
    ASaveOwner := Self.Owner;
  DeleteAllLinks;
  if Source <> nil then
    for I := 0 to Source.LinkCount - 1 do
    begin
      AReportLink := Source.ReportLink[I];
      with AddEmptyLinkEx(AReportLink.LinkClass, ASaveOwner) do
      begin
        Component := AReportLink.Component;
        Assign(AReportLink);
      end;
    end;
end;

class function TCustomdxComponentPrinter.GetNewLinkName(AReportLink: TBasedxReportLink): string;
begin
  Result := 'Link%d';
end;

function TCustomdxComponentPrinter.CreateLink(ALinkClass: TdxReportLinkClass;
  AComponent: TComponent; AOwner: TComponent): TBasedxReportLink;
var
  LinkClass: TdxReportLinkClass;
begin
  Result := nil;
  LinkClass := ALinkClass;
  if AComponent <> nil then
    if IsSupportedCompClass(AComponent) then
      LinkClass := dxPSLinkClassByCompClass(TComponentClass(AComponent.ClassType))
    else
      if IsDesigning then
        raise EdxComponentPrinter.Create(sdxComponentNotSupported);

  if LinkClass = nil then 
    Exit;
  Result := LinkClass.Create(AOwner);
  if AComponent <> nil then
    Result.Component := AComponent;
  Result.SetComponentPrinter(Self);
end;

function TCustomdxComponentPrinter.AddEmptyLink(ALinkClass: TdxReportLinkClass): TBasedxReportLink;
begin
  Result := AddEmptyLinkEx(ALinkClass, Self.Owner);
end;

function TCustomdxComponentPrinter.AddEmptyLinkEx(ALinkClass: TdxReportLinkClass;
  AOwner: TComponent): TBasedxReportLink;
begin
  Result := CreateLink(ALinkClass, nil, AOwner);
end;

function TCustomdxComponentPrinter.AddLink(AComponent: TComponent): TBasedxReportLink;
begin
  Result := AddLinkEx(AComponent, Self.Owner);
end;

function TCustomdxComponentPrinter.AddLinkEx(AComponent: TComponent;
  AOwner: TComponent): TBasedxReportLink;
begin
  Result := CreateLink(nil, AComponent, AOwner);
end;

procedure TCustomdxComponentPrinter.DeleteLink(AIndex: Integer);
var
  Link: TBasedxReportLink;
begin
  if (AIndex > -1) and (AIndex < LinkCount) then
  begin
    Link := ReportLink[AIndex];
    Link.Free;
  end;
end;

procedure TCustomdxComponentPrinter.DeleteAllLinks;
begin
  while LinkCount > 0 do DeleteLink(LinkCount - 1);
end;

function TCustomdxComponentPrinter.LinkByName(const AName: string): TBasedxReportLink;
var
  I: Integer;
begin
  for I := 0 to LinkCount - 1 do
  begin
    Result := ReportLink[I];
    if CompareText(Result.Name, AName) = 0 then Exit;
  end;
  Result := nil;
end;

function TCustomdxComponentPrinter.FindLinkByComponent(Value: TComponent): TBasedxReportLink;
var
  I: Integer;
begin
  if (Value <> nil) then
    for I := 0 to LinkCount - 1 do
    begin
      Result := ReportLink[I];
      if (Result.Component = Value) then Exit;
    end;
  Result := nil;
end;

function TCustomdxComponentPrinter.IndexOfLink(AReportLink: TBasedxReportLink): Integer;
begin
  Result := FLinkList.IndexOf(AReportLink);
end;

{$IFDEF DELPHI4}

function TCustomdxComponentPrinter.IndexOfLink(const AName: string): Integer;
begin
  Result := IndexOfLinkByName(AName);
end;
{$ENDIF}

function TCustomdxComponentPrinter.IndexOfLinkByName(const AName: string): Integer;
begin
  Result := IndexOfLink(LinkByName(AName));
end;

class function TCustomdxComponentPrinter.IsSupportedCompClass(AComponent: TComponent): Boolean;
begin
  Result := dxPSIsSupportedCompClass(TComponentClass(AComponent.ClassType));
end;

function TCustomdxComponentPrinter.CheckLink(Value: TBasedxReportLink): TBasedxReportLink;
begin
  if Assigned(Value) then CurrentLink := Value;
  Result := CurrentLink;
end;

procedure TCustomdxComponentPrinter.DestroyReport(
  AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
begin
  AReportLink := CheckLink(AReportLink);
  if Assigned(AReportLink) then AReportLink.DestroyReport;
end;

procedure TCustomdxComponentPrinter.PreparePageSetup;
begin
  Include(FState, cpsPageSetupDialog);
end;

procedure TCustomdxComponentPrinter.UnpreparePageSetup;
begin
  Exclude(FState, cpsPageSetupDialog);
end;

procedure TCustomdxComponentPrinter.PrepareBuildReport(AReportLink: TBasedxReportLink);
begin
  Include(FState, cpsBuilding);
  if PreviewExists then
    FSavePageIndex := PreviewWindow.ActivePageIndex
  else
    FSavePageIndex := 0;
  DoStartUpdateReport(AReportLink);
end;

procedure TCustomdxComponentPrinter.UnprepareBuildReport(AReportLink: TBasedxReportLink);
begin
  DoEndUpdateReport(AReportLink);
  Exclude(FState, cpsBuilding);
  if PreviewExists then
    if PreviewWindow.PageCount <> AReportLink.PageCount then
    begin
      PreviewWindow.PageCount := AReportLink.PageCount;
      PreviewWindow.ActivePageIndex := FSavePageIndex;
    end
    else
      PreviewWindow.InvalidateContent;
end;

procedure TCustomdxComponentPrinter.PrepareLongOperation;
begin
  if IsDestroying then Exit;
  if FLongOperationCounter = 0 then
  begin
    StartTime := 0;
    if BeepAfterLongOperations then
      StartTime := GetTickCount
    else
      StartTime := 0;
    if IsShowHourGlass then
    begin
      FSaveCursor := Screen.Cursor;
      Screen.Cursor := crHourGlass;
    end;
  end;
  Inc(FLongOperationCounter);
end;

procedure TCustomdxComponentPrinter.UnprepareLongOperation;
begin
  if IsDestroying then Exit;
  if FLongOperationCounter <> 0 then
  begin
    Dec(FLongOperationCounter);
    if FLongOperationCounter = 0 then
    begin
      if IsShowHourGlass then Screen.Cursor := FSaveCursor;
      if BeepAfterLongOperations then
      begin
        EndTime := GetTickCount;
        if EndTime - StartTime > DWORD(LongOperationTime) then Beep;
      end;
    end;
  end;
end;

procedure TCustomdxComponentPrinter.RebuildReport(
  AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
begin
  AReportLink := CheckLink(AReportLink);
  if Assigned(AReportLink) then AReportLink.RebuildReport;
end;

procedure TCustomdxComponentPrinter.DoCustomDrawEntirePage(AReportLink: TBasedxReportLink;
  ACanvas: TCanvas; APageIndex: Integer; ARect: TRect; ANom, ADenom: Integer);
begin
  if Assigned(FOnCustomDrawPage) then
    FOnCustomDrawPage(Self, AReportLink, ACanvas, APageIndex, ARect, ANom, ADenom);
end;

procedure TCustomdxComponentPrinter.RaisePrintEvent(AReportLink: TBasedxReportLink;
  APageIndex, APageCount: Integer; AStage: TdxPSPrintStage);
var
  Event: TdxEvent;
begin
  Event := TdxPSPrintEvent.Create(Self, AReportLink, APageIndex, APageCount, AStage);
  dxPSProcessEvent(Event);
end;

procedure TCustomdxComponentPrinter.DoNewPage(AReportLink: TBasedxReportLink;
  APageIndex: Integer);
begin
  AReportLink := CheckLink(AReportLink);
  if (AReportLink <> nil) then
  begin
    if Assigned(FOnNewPage) then FOnNewPage(Self, AReportLink, APageIndex);
    RaisePrintEvent(AReportLink, APageIndex, 0, psProgress);
  end;
end;

procedure TCustomdxComponentPrinter.DoEndPrint(AReportLink: TBasedxReportLink);
begin
  AReportLink := CheckLink(AReportLink);
  if (AReportLink <> nil) then
  begin
    if Assigned(FOnEndPrint) then FOnEndPrint(Self, AReportLink);
    RaisePrintEvent(AReportLink, 0, 0, psEnd);
  end;
  FAbortPrinting := False;
end;

procedure TCustomdxComponentPrinter.DoStartPrint(AReportLink: TBasedxReportLink;
  FullPageCount: Integer);
begin
  AReportLink := CheckLink(AReportLink);
  if (AReportLink <> nil) then
  begin
    if Assigned(FOnStartPrint) then FOnStartPrint(Self, AReportLink, FullPageCount);
    RaisePrintEvent(AReportLink, 0, FullPageCount, psStart);
  end;
end;

procedure TCustomdxComponentPrinter.DoAddReportLink(AReportLink: TBasedxReportLink);
begin
  if not IsLoading then
    if Assigned(FOnAddReportLink) then FOnAddReportLink(Self, AReportLink);
end;

procedure TCustomdxComponentPrinter.DoAfterPreview(AReportLink: TBasedxReportLink);
begin
  if Assigned(FOnAfterPreview) then FOnAfterPreview(Self, AReportLink);
end;

procedure TCustomdxComponentPrinter.DoBeforeDesignReport(AReportLink: TBasedxReportLink;
  ADesignWindow: TAbstractdxReportLinkDesignWindow);
begin
  if Assigned(FOnBeforeDesignReport) then FOnBeforeDesignReport(Self, AReportLink, ADesignWindow);
end;

procedure TCustomdxComponentPrinter.DoBeforePreview(AReportLink: TBasedxReportLink);
begin
  if (PreviewWindow <> nil) and Assigned(FOnBeforePreview) then 
    FOnBeforePreview(Self, AReportLink);
end;

procedure TCustomdxComponentPrinter.DoChangeComponent(AReportLink: TBasedxReportLink);
begin
  if not IsLoading and Assigned(FOnChangeComponent) then
    FOnChangeComponent(Self, AReportLink);
end;

procedure TCustomdxComponentPrinter.DoChangeCurrentLink;
begin
  if not IsLoading and not IsDestroying and Assigned(FOnChangeCurrentLink) then 
    FOnChangeCurrentLink(Self);
end;

procedure TCustomdxComponentPrinter.DoDeleteReportLink(AReportLink: TBasedxReportLink);
begin
  if not IsLoading and Assigned(FOnDeleteReportLink) then 
    FOnDeleteReportLink(Self, AReportLink);
end;

procedure TCustomdxComponentPrinter.DoMeasureReportTitle(AReportLink: TBasedxReportLink;
  var AHeight: Integer);
begin
  if Assigned(FOnMeasureReportTitle) then
    FOnMeasureReportTitle(Self, AReportLink, AHeight);
end;

procedure TCustomdxComponentPrinter.DoDesignReport(AReportLink: TBasedxReportLink;
  ADone: Boolean);
begin
  if Assigned(FOnDesignReport) then FOnDesignReport(Self, AReportLink, ADone);
  if ADone and (AReportLink.Component <> nil) then
    RebuildReport(AReportLink);
end;

procedure TCustomdxComponentPrinter.DoPrintDeviceBusy;
var
  Done: Boolean;
begin
  Done := False;
  if Assigned(FOnPrintDeviceBusy) then FOnPrintDeviceBusy(Self, Done);
  if not Done then StdProcessPrintDeviceBusy;
end;

procedure TCustomdxComponentPrinter.StdProcessPrintDeviceBusy;
begin
  MessageError(sdxPrintDeviceIsBusy);
end;

procedure TCustomdxComponentPrinter.DoPrintDeviceError;
var
  Done: Boolean;
begin
  Done := False;
  if Assigned(FOnPrintDeviceError) then FOnPrintDeviceError(Self, Done);
  if not Done then StdProcessPrintDeviceError;
end;

procedure TCustomdxComponentPrinter.StdProcessPrintDeviceError;
begin
  MessageError(sdxPrintDeviceError);
end;

procedure TCustomdxComponentPrinter.DoPageSetup(AReportLink: TBasedxReportLink;
  ADone: Boolean);
begin
  if Assigned(FOnPageSetup) then FOnPageSetup(Self, AReportLink, ADone);
end;

procedure TCustomdxComponentPrinter.RaiseBuildEvent(AReportLink: TBasedxReportLink;
  const APercentCompleted: Double; AStage: TdxPSBuildStage);
var
  Event: TdxEvent;
begin
  Event := TdxPSBuildEvent.Create(Self, AReportLink, APercentCompleted, AStage);
  dxPSProcessEvent(Event)
end;

procedure TCustomdxComponentPrinter.DoProgress(AReportLink: TBasedxReportLink;
  const PercentDone: Double);
begin
  if IsGenerateReportProgressEvent then
    if Assigned(FOnGenerateReportProgress) then FOnGenerateReportProgress(Self, AReportLink, PercentDone);
  RaiseBuildEvent(AReportLink, PercentDone, bsProgress);
end;

procedure TCustomdxComponentPrinter.DoStartUpdateReport(AReportLink: TBasedxReportLink);
begin
  if IsGenerateReportProgressEvent then
    if Assigned(FOnStartGenerateReport) then FOnStartGenerateReport(Self, AReportLink);
  RaiseBuildEvent(AReportLink, 0, bsStart);
end;

procedure TCustomdxComponentPrinter.DoEndUpdateReport(AReportLink: TBasedxReportLink);
begin
  if IsGenerateReportProgressEvent then
    if Assigned(FOnEndGenerateReport) then FOnEndGenerateReport(Self, AReportLink);
  RaiseBuildEvent(AReportLink, 0, bsEnd);
end;

function TCustomdxComponentPrinter.GetPrintTitle(AReportLink: TBasedxReportLink): string;
begin
  Result := FPrintTitle;
  if Assigned(FOnGetPrintTitle) then
  begin
    AReportLink := CheckLink(AReportLink);
    if AReportLink <> nil then FOnGetPrintTitle(Self, AReportLink, Result);
  end;
end;

function TCustomdxComponentPrinter.PreviewExists: Boolean;
begin
  Result := PreviewWindow <> nil;
end;

procedure TCustomdxComponentPrinter.SetPreviewAttr(PreviewWindow: TBasedxPreviewWindow);
begin
  with PreviewWindow do
  begin
    if not IsDesigning then
    begin
      EnableOptions := PreviewOptions.EnableOptions;
      VisibleOptions := PreviewOptions.VisibleOptions;
      HelpContext := PreviewOptions.HelpContext;
      HelpFile := PreviewOptions.HelpFile;
    end;
    Caption := PreviewOptions.Caption;
    Icon := PreviewOptions.Icon;
    SaveZoomPosition := PreviewOptions.SaveZoomPosition;
  end;
end;

function TCustomdxComponentPrinter.CreatePreviewWindow(
  AReportLink: TBasedxReportLink): TBasedxPreviewWindow;
var
  PreviewClass: TdxPreviewWindowClass;
begin
  Result := nil;
  PreviewClass := GetPreviewClass;
  if PreviewClass <> nil then
  try
    Result := PreviewClass.Create(nil);
    with Result do
    begin
      BeginUpdate;
      try
        SetComponentPrinter(Self);
        SetPreviewAttr(Result);
      finally
        EndUpdate;
      end;
    end;
  except
    if Result <> nil then Result.Free;
    raise;
  end
  else
    raise EdxComponentPrinter.Create(sdxPreviewNotRegistered);
end;

procedure TCustomdxComponentPrinter.ShowExistingPreviewWindow;
const
  Flags: array[Boolean] of UINT = (SW_SHOW, SW_RESTORE or SW_SHOWNORMAL);
var
  WindowPlacement: TWindowPlacement;
  Wnd: THandle;
begin
  WindowPlacement.Length := SizeOf(WindowPlacement);
  Wnd := PreviewWindow.Handle;
  GetWindowPlacement(Wnd, @WindowPlacement);
  ShowWindow(Wnd, Flags[WindowPlacement.ShowCmd = SW_SHOWMINIMIZED]);
  SetForegroundWindow(Wnd);
end;

procedure TCustomdxComponentPrinter.Preview(AModal: Boolean{$IFDEF DELPHI4} = True{$ENDIF};
  AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
begin
  AReportLink := CheckLink(AReportLink);
  if AReportLink = nil then Exit;
  
  if PreviewExists then
    ShowExistingPreviewWindow
  else
  begin
    if (AReportLink.Component <> nil) and (IsDesigning or IsRebuildBeforePreview) then
    begin
      RebuildReport(AReportLink);
      DesignerModified;
    end
    else
      if AutoUpdateDateTime then
        AReportLink.DateTime := Now;

    FPreviewWindow := CreatePreviewWindow(AReportLink);
    Include(FState, cpsPreviewing);
    DoBeforePreview(AReportLink);
    FModalPreview := AModal;
    if AModal then
    try
      FPreviewWindow.ShowModal;
    finally
      DoAfterPreview(AReportLink);
      FPreviewWindow.Free;
      FPreviewWindow := nil;
    end
    else
      FPreviewWindow.Show;
  end;
end;

procedure TCustomdxComponentPrinter.DestroyPreviewWindow;
begin
  if cpsPrinting in State then
    AbortPrinting := True;
  if FPreviewWindow <> nil then
    FPreviewWindow.Free;
  FPreviewWindow := nil;
end;

procedure TCustomdxComponentPrinter.PaintPage(ACanvas: TCanvas;
  APageIndex: Integer; const APageRect, AContentRect: TRect;
  AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
var
  ZoomFactor: Integer;
begin
  AReportLink := CheckLink(AReportLink);
  if AReportLink = nil then
    Exit;

  ZoomFactor := 100;
  if (PreviewWindow <> nil) and IsDisplayDC(ACanvas.Handle) then
    ZoomFactor := PreviewWindow.ZoomFactor;

  AReportLink.PaintPage(ACanvas, APageRect, APageIndex, ZoomFactor);
end;

procedure TCustomdxComponentPrinter.DrawPageHeader(AReportLink: TBasedxReportLink;
  APageIndex: Integer; ARect: TRect;
  ATitleParts: TdxPageTitleParts; ADrawBackground: Boolean);
begin
  AReportLink.DrawPageHeader(APageIndex, ARect, ATitleParts, ADrawBackground);
end;

procedure TCustomdxComponentPrinter.DrawPageFooter(AReportLink: TBasedxReportLink;
  APageIndex: Integer; ARect: TRect;
  ATitleParts: TdxPageTitleParts; ADrawBackground: Boolean);
begin
  AReportLink.DrawPageFooter(APageIndex, ARect, ATitleParts, ADrawBackground);
end;

procedure TCustomdxComponentPrinter.DoCustomDrawReportTitle(AReportLink: TBasedxReportLink;
  ACanvas: TCanvas; ARect: TRect; var ATextAlignX: TdxTextAlignX;
  var ATextAlignY: TdxTextAlignY; var AColor: TColor; AFont: TFont;
  var ADone: Boolean);
begin
  if Assigned(FOnCustomDrawReportTitle) then
    FOnCustomDrawReportTitle(Self, AReportLink, ACanvas, ARect, PixelsNumerator,
      PixelsDenominator, ATextAlignX, ATextAlignY, AColor, AFont, ADone);
end;

procedure TCustomdxComponentPrinter.DoCustomDrawPageHeaderOrFooter(AReportLink: TBasedxReportLink;
  AHFObject: TCustomdxPageObject; ACanvas: TCanvas; APageIndex: Integer;
  R: TRect; var ADefaultDrawText, ADefaultDrawBackground: Boolean);
begin
  if AHFObject is TdxPageHeader then
  begin
    if Assigned(FOnCustomDrawPageHeader) then
      FOnCustomDrawPageHeader(Self, AReportLink, ACanvas, APageIndex, R,
        PixelsNumerator, PixelsDenominator, ADefaultDrawText, ADefaultDrawBackground)
  end
  else
    if Assigned(FOnCustomDrawPageFooter) then
      FOnCustomDrawPageFooter(Self, AReportLink, ACanvas, APageIndex, R,
        PixelsNumerator, PixelsDenominator, ADefaultDrawText, ADefaultDrawBackground);
end;

procedure TCustomdxComponentPrinter.PrintPage(AReportLink: TBasedxReportLink;
  APageIndex: Integer);
var
  R: TRect;
begin
  if FAbortPrinting then Exit;
  AReportLink := CheckLink(AReportLink);
  if AReportLink = nil then Exit;

  with dxPrintDevice do
    R := Rect(-PhysOffsetX, -PhysOffsetY, PageWidth + PhysOffsetX, PageHeight + PhysOffsetY);

  with AReportLink.RealPrinterPage.Background do
  begin
    if (Mode = bmNone) or ((Mode = bmPicture) and (PictureMode in [ppmCenter, ppmProportional])) then
      FillRect(dxPrintDevice.Canvas.Handle, R, GetStockObject(WHITE_BRUSH));
    PaintEx(dxPrintDevice.Canvas, R, PixelsNumerator, PixelsDenominator);
  end;

  PaintPage(dxPrintDevice.Canvas, APageIndex, R, R, AReportLink);
end;

procedure TCustomdxComponentPrinter.PrintPages(const APageIndexes: array of Integer;
  AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
begin
  PrintPagesEx(APageIndexes, pnAll, 1, False, AReportLink);
end;

procedure TCustomdxComponentPrinter.PrintPagesEx(const APageIndexes: array of Integer;
  APageNums: TdxPageNumbers; ACopies: Integer; ACollate: Boolean;
  AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
var
  Index, PageIndex, CopyIndex: Integer;
  CurrentPage, FullPageCount, ColCount, RowCount: Integer;
  V: Variant;
  AIndexes: PIntArray;
  RecombineData: Boolean;

  function IsAllPages: Boolean;
  var
    P: PIntArray;
    V: Variant;
    I: Integer;
  begin
    Result := FPrintAll;
    if Result then Exit;
    P := BeginPrintPages('1-' + IntToStr(AReportLink.PageCount), V);
    if P <> nil then
    try
      for I := Low(APageIndexes) to High(APageIndexes) do
{$IFOPT R+}{$DEFINE PREVRANGECHECK}{$R-}{$ENDIF}
        if P^[I] <> APageIndexes[I] then
{$IFDEF SAVERANGECHECK}{$UNDEF PREVRANGECHECK}{$R+}{$ENDIF}
        begin
          Result := False;
          Exit;
        end;
    finally
      EndPrintPages(V);
    end;
    Result := True;
  end;

  procedure RecombinePageIndexes(Recombine: Boolean);
  var
    I, J, K: Integer;
  begin
    if Recombine then
    begin
      K := 0;
      for I := 0 to ColCount - 1 do
        for J := 0 to RowCount - 1 do
        begin
{$IFOPT R+}{$DEFINE PREVRANGECHECK}{$R-}{$ENDIF}
          AIndexes^[K] := APageIndexes[I + J * ColCount];
{$IFDEF SAVERANGECHECK}{$UNDEF PREVRANGECHECK}{$R+}{$ENDIF}
          Inc(K);
        end;
    end
    else
      Move(APageIndexes, AIndexes^, (High(APageIndexes) - Low(APageIndexes) + 1) * SizeOf(Integer));
  end;

  function AllowPrintPage(AIndex, APageIndex: Integer): Boolean;
  begin
    Result := not ((APageIndex < 0) or
      (APageIndex > AReportLink.PageCount - 1) or
      ((APageNums = pnEven) and not Odd(AIndex)) or
      ((APageNums = pnOdd) and Odd(AIndex)));
  end;

  procedure ProcessPrintPage(var ACurrentPage: Integer; APageIndex: Integer);
  begin
    if ACurrentPage > 0 then
    begin
      DoNewPage(AReportLink, ACurrentPage);
      dxPrintDevice.NewPage;
    end;
    if Application.Terminated then
      AbortPrinting := True;
    if not AbortPrinting then
      PrintPage(AReportLink, APageIndex);
    Inc(ACurrentPage);
  end;

begin
  AReportLink := CheckLink(AReportLink);
  if (AReportLink = nil) or not AReportLink.DataProviderPresent then Exit;
  dxInitPrintDevice(True);
  if dxPrintDevice.Printing then
  begin
    DoPrintDeviceBusy;
    Exit;
  end;
  if not AReportLink.ValidateMargins then Exit;

  if ACopies < 1 then ACopies := 1;
  FullPageCount := ACopies * (High(APageIndexes) - Low(APageIndexes) + 1);
  if APageNums <> pnAll then
  begin
    if (APageNums = pnOdd) and Odd(FullPageCount) then Inc(FullPageCount);
    FullPageCount := FullPageCount div 2;
  end;

  V := varArrayCreate([Low(APageIndexes), High(APageIndexes)], varInteger);
  AIndexes := varArrayLock(V);
  try
    RecombineData := AReportLink.RealPrinterPage.PageOrder = poDownThenOver;
    if RecombineData then
    begin
      AReportLink.GetPageColRowCount(ColCount, RowCount);
      RecombineData := (ColCount <> 1) and (RowCount <> 1) and IsAllPages;
    end;
    RecombinePageIndexes(RecombineData);
    AReportLink.BeforePrinting;
    try
      try
        Include(FState, cpsPrinting);
        PrepareReport(AReportLink);
        try
          PreparePrintDevice;
          try
            dxPrintDevice.Title := GetPrintTitle(AReportLink);
            if dxPrintDevice.BeginDoc > 0 then
            try
              DoStartPrint(AReportLink, FullPageCount);
              if not ACollate and (ACopies > 1) then
              begin
                CurrentPage := 0;
                for Index := Low(APageIndexes) to High(APageIndexes) do
                begin
                  PageIndex := AIndexes^[Index] - 1;
                  if not AllowPrintPage(Index, PageIndex) then Continue;
                  for CopyIndex := 1 to ACopies do
                  begin
                    ProcessPrintPage(CurrentPage, PageIndex);
                    if AbortPrinting then
                      Break;
                  end;
                  if AbortPrinting then
                    Break;
                end;
              end
              else
              begin
                CurrentPage := 0;
                for CopyIndex := 1 to ACopies do
                begin
                  for Index := Low(APageIndexes) to High(APageIndexes) do
                  begin
                    PageIndex := AIndexes^[Index] - 1;
                    if not AllowPrintPage(Index, PageIndex) then Continue;
                    ProcessPrintPage(CurrentPage, PageIndex);
                    if AbortPrinting then
                      Break;
                  end;
                  if AbortPrinting then
                    Break;
                end;
              end;
            finally
              if dxPrintDevice.Printing then
                if AbortPrinting then
                  dxPrintDevice.Abort
                else
                  dxPrintDevice.EndDoc;
              DoEndPrint(AReportLink);
            end
            else
              if (dxPrintDevice.CurrentPort = nil) or
                (StrComp(dxPrintDevice.CurrentPort, sdxFilePort) <> 0) then
                DoPrintDeviceError;
          finally
            UnpreparePrintDevice;
          end;
        finally
          Exclude(FState, cpsPrinting);
          UnprepareReport(AReportLink);
        end;
      except
        if dxPrintDevice.Printing then
        try
          dxPrintDevice.Abort;
        except
          Application.HandleException(Self);
        end;
        DoPrintDeviceError;
      end;
    finally
      AReportLink.AfterPrinting;
    end;
  finally
    varArrayUnlock(V);
  end;
end;

{$HINTS OFF}

function TCustomdxComponentPrinter.Print(AShowDialog: Boolean;
  APrintDlgData: PdxPrintDlgData;
  AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF}): Boolean;

{ DELPHI COMPILER BUG ???
  if eliminate a stub local variable and AReportLink = nil then
  AReportLink parameter into the PrintEx procedure will be "NIL" too.

  !!!  don't remove declaration of the stub variable !!! }

var
  Stub: Integer;
begin
  AReportLink := CheckLink(AReportLink);
  if AReportLink <> nil then
  begin
    PrepareReport(AReportLink);
    if AShowDialog then
      Result := PrintDialog(AReportLink, APrintDlgData)
    else
    begin
      PrintEx(pnAll, 1, False, AReportLink);
      Result := True;
    end;
  end
  else
    Result := False;
end;
{$HINTS ON}

procedure TCustomdxComponentPrinter.PrepareReport(AReportLink: TBasedxReportLink);
begin
  if AReportLink.FPrepared then Exit;
  if AReportLink.DataProviderPresent then
  begin
    if not PreviewExists and (IsDesigning or IsRebuildBeforePrint) then
    begin
      RebuildReport(AReportLink);
      DesignerModified;
    end
    else
      if AutoUpdateDateTime then AReportLink.DateTime := Now;
    AReportLink.FPrepared := True;
  end
  else
    AReportLink.FPrepared := False;
end;

procedure TCustomdxComponentPrinter.UnprepareReport(AReportLink: TBasedxReportLink);
begin
  AReportLink.FPrepared := False;
end;

function TCustomdxComponentPrinter.BeginPrintPages(const Source: string;
  var APageIndexes: Variant): Pointer;
begin
  APageIndexes := MakePageIndexes(Source);
  if VarIsArray(APageIndexes) then
    Result := VarArrayLock(APageIndexes)
  else
    Result := nil;
end;

procedure TCustomdxComponentPrinter.EndPrintPages(var APageIndexes: Variant);
begin
  VarArrayUnlock(APageIndexes);
end;

procedure TCustomdxComponentPrinter.PrintEx(APageNums: TdxPageNumbers;
  ACopies: Integer; ACollate: Boolean;
  AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
var
  APageIndexes: Variant;
  P: PIntArray;
  Count: Integer;
begin
  AReportLink := CheckLink(AReportLink);
  if AReportLink <> nil then
  begin
    PrepareReport(AReportLink);
    if AReportLink.PageCount > 0 then
    begin
      P := BeginPrintPages('1-' + Trim(IntToStr(AReportLink.PageCount)), APageIndexes);
      if Assigned(P) then
      try
        FPrintAll := True;
        with TVarData(APageIndexes).VArray^.Bounds[0] do
          Count := LowBound + ElementCount;
        PrintPagesEx(Slice(P^, Count), APageNums, ACopies, ACollate, AReportLink);
      finally
        FPrintAll := False;
        EndPrintPages(APageIndexes);
      end;
    end;
  end;
end;

procedure TCustomdxComponentPrinter.PreparePrintDevice;
begin
  if dxPrintDevice.Copies > 1 then
  begin
    FSaveCopies := dxPrintDevice.Copies;
    dxPrintDevice.Copies := 1;
  end;
  if dxPrintDevice.Collate then
  begin
    FSaveCollate := dxPrintDevice.Collate;
    dxPrintDevice.Collate := False;
  end;
  CurrentLink.RealPrinterPage.ApplyToPrintDevice;
end;

procedure TCustomdxComponentPrinter.UnpreparePrintDevice;
begin
  if FSaveCopies > 1 then
    dxPrintDevice.Copies := FSaveCopies;
  FSaveCopies := 1;
  if FSaveCollate then
    dxPrintDevice.Collate := FSaveCollate;
  FSaveCollate := False;
end;

procedure TCustomdxComponentPrinter.PrnDlgPageSetup(Sender: TObject;
  var ADone: Boolean; APreviewBtnClicked, APrintBtnClicked: PBoolean);
begin
  ADone := (CurrentLink <> nil) and
    PageSetupEx(0, APreviewBtnClicked, APrintBtnClicked, CurrentLink);
  if (ADone or APreviewBtnClicked^) and PreviewExists then
  begin
    CurrentLink.CalcRenderInfos;
    with PreviewWindow do
    begin
      InitContent;
      InvalidateContent;
      UpdateControls;
    end;
  end;
end;

function TCustomdxComponentPrinter.PrintDialog(AReportLink: TBasedxReportLink;
  PrintDlgData: PdxPrintDlgData): Boolean;

  procedure SetupPrintDialog(APrintDlgData: PdxPrintDlgData);
  const
    BtnEnabledOn: TdxPrintDlgButtons = [pdbPreview, pdbPageSetup, pdbHelp];
    BtnVisibleOn: TdxPrintDlgButtons = [pdbPreview, pdbPageSetup, pdbHelp];
    OptEnabledOn: TdxPrintDlgOptions = [pdoCurrentPage];
    OptVisibleOn: TdxPrintDlgOptions = [pdoCurrentPage];
  begin
    with APrintDlgData^ do
    begin
      IsCheckUserInput := True;

      DialogData^.PageCount := CurrentLink.PageCount;
      DialogData^.MinRange := 1;
      DialogData^.MaxRange := CurrentLink.PageCount;
      if CurrentLink.PageCount = 0 then
        DialogData^.MinRange := 0;
      DialogData^.PrintToFile := FSavePrintToFile;
      DialogData^.FileList := TStringList.Create;
      DialogData^.FileList.Assign(PrintFileList);
      if not IsDesigning and (not (cpsPreviewing in State) or (pvoPrintStyles in PreviewOptions.VisibleOptions)) then
        DialogData^.StyleManager := CurrentLink.StyleManager;

      Events^.OnPageSetup := PrnDlgPageSetup;

      Title := sdxPrintDialogCaption;
      OptionsEnabled := pdoDefaultOptionsEnabled + OptEnabledOn;
      OptionsVisible := pdoDefaultOptionsVisible + OptVisibleOn;
      ButtonsEnabled := pdbDefault + BtnEnabledOn;
      ButtonsVisible := pdbDefault + BtnVisibleOn;
      if cpsPreviewing in State then
        ButtonsVisible := ButtonsVisible - [pdbPreview];
    end;
  end;

var
  APrintDlgData: PdxPrintDlgData;
  ADialogData: TdxPrintDialogData;
  AEvents: TdxPrintDlgEvents;
  APageIndexes: Variant;
  APreviewBtnClicked: Boolean;
  P: PIntArray;
  List: TStrings;
  C: Integer;
begin
  Include(FState, cpsPrintDialog);
  try
    if PrintDlgData = nil then
      APrintDlgData := AllocMem(SizeOf(TdxPrintDlgData))
    else
      APrintDlgData := nil;

    try
      if PrintDlgData = nil then
      begin
        FillChar(ADialogData, SizeOf(TdxPrintDialogData), 0);
        FillChar(AEvents, SizeOf(TdxPrintDlgEvents), 0);
        if Assigned(APrintDlgData) then
        begin
          APrintDlgData^.DialogData := @ADialogData;
          APrintDlgData^.Events := @AEvents;
        end;
      end
      else
        APrintDlgData := PrintDlgData;

      if PrintDlgData = nil then
        SetupPrintDialog(APrintDlgData);

      Result := dxPrintDialog(APrintDlgData);

      APreviewBtnClicked := APrintDlgData.PreviewBtnClicked;
      if Result then
      begin
        FSavePrintToFile := APrintDlgData^.DialogData^.PrintToFile;
        PrintFileList := APrintDlgData^.DialogData^.FileList;
        if not APreviewBtnClicked then
          with APrintDlgData^.DialogData^ do
          begin
            if PrintToFile then
              dxPrintDevice.FileName := FileName;
            FPrintAll := (PageRanges = prAll);
            if PageRanges = prAll then
              PrintEx(PageNums, Copies, Collate, AReportLink)
            else {prCurrent, prRange}
            begin
              if PageRanges = prCurrent then
                Pages := IntToStr(AReportLink.CurrentPage);
              P := BeginPrintPages(Pages, APageIndexes);
              if P <> nil then
              try
                with TVarData(APageIndexes).VArray^.Bounds[0] do
                  C := LowBound + ElementCount;
                PrintPagesEx(Slice(P^, C), PageNums, Copies, Collate, AReportLink);
              finally
                EndPrintPages(APageIndexes);
              end;
            end;
          end;
      end;
    finally
      if PrintDlgData = nil then
      begin
        Finalize(APrintDlgData^.Title);
        List := APrintDlgData^.DialogData.FileList;
        if List <> nil then List.Free;
        FreeMem(APrintDlgData, SizeOf(TdxPrintDlgData));
      end;
    end;
  finally
    FPrintAll := False;
    Exclude(FState, cpsPrintDialog);
  end;
  if APreviewBtnClicked then
    Preview(True, AReportLink);
end;

function TCustomdxComponentPrinter.PageSetup(AReportLink: TBasedxReportLink): Boolean;
begin
  AReportLink := CheckLink(AReportLink);
  Result := (AReportLink <> nil) and AReportLink.PageSetup;
end;

function TCustomdxComponentPrinter.PageSetupEx(AActivePageIndex: Integer;
  APreviewBtnClicked, APrintBtnClicked: PBoolean;
  AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF}): Boolean;
begin
  AReportLink := CheckLink(AReportLink);
  Result := (AReportLink <> nil) and
    AReportLink.PageSetupEx(AActivePageIndex, APreviewBtnClicked, APrintBtnClicked);
end;

function TCustomdxComponentPrinter.DesignReport(AReportLink: TBasedxReportLink): Boolean;
begin
  AReportLink := CheckLink(AReportLink);
  if AReportLink <> nil then
  begin
    Include(FState, cpsDesigning);
    try
      Result := AReportLink.DesignReport;
    finally
      Exclude(FState, cpsDesigning);
    end
  end
  else
    Result := False;
end;

procedure TCustomdxComponentPrinter.GetPageColRowCount(var ACol, ARow: Integer;
  AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
begin
  AReportLink := CheckLink(AReportLink);
  if Assigned(AReportLink) then
    AReportLink.GetPageColRowCount(ACol, ARow)
  else
  begin
    ACol := 0;
    ARow := 0;
  end;
end;

function TCustomdxComponentPrinter.GetPageCount(
  AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF}): Integer;
begin
  AReportLink := CheckLink(AReportLink);
  if AReportLink <> nil then
    Result := AReportLink.PageCount
  else
    Result := 0;
end;

function TCustomdxComponentPrinter.DesignerExists(
  AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF}): Boolean;
begin
  AReportLink := CheckLink(AReportLink);
  Result := (AReportLink <> nil) and (AReportLink.GetDesignerClass <> nil);
  {Result := (AReportLink <> nil) and (AReportLink.Component <> nil) and
    AReportLink.DesignerExists(TComponentClass(AReportLink.Component.ClassType));}
end;

procedure TCustomdxComponentPrinter.SetAutoUpdateDateTime(Value: Boolean);
begin
  if FAutoUpdateDateTime <> Value then
    FAutoUpdateDateTime := Value;
end;

procedure TCustomdxComponentPrinter.SetDateFormat(Value: Integer);
begin
  if Value < 0 then Value := 0;
  if Value > dxPgsDlg.DateFormats.Count - 1 then
    Value := dxPgsDlg.DateFormats.Count - 1;
  if FDateFormat <> Value then
    FDateFormat := Value;
end;

procedure TCustomdxComponentPrinter.SetPageNumberFormat(Value: TdxPageNumberFormat);
begin
  if FPageNumberFormat <> Value then
    FPageNumberFormat := Value;
end;

procedure TCustomdxComponentPrinter.SetTimeFormat(Value: Integer);
begin
  if Value < 0 then Value := 0;
  if Value > dxPgsDlg.TimeFormats.Count - 1 then
    Value := dxPgsDlg.TimeFormats.Count - 1;
  if FTimeFormat <> Value then
    FTimeFormat := Value;
end;

{ TdxComponentPrinter }

constructor TdxComponentPrinter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOverWriteExistingFiles := False;
end;

destructor TdxComponentPrinter.Destroy;
begin
  if not IsDesigning then
    SaveToRegistry(dxPSEngine.RealRegistryPath);
  inherited Destroy;
end;

procedure TdxComponentPrinter.Loaded;
begin
  inherited Loaded;
  if (LinkCount > 0) and (CurrentLink = nil) then
    CurrentLink := ReportLink[0];
  if not IsDesigning then
    LoadFromRegistry(dxPSEngine.RealRegistryPath);
end;

procedure TdxComponentPrinter.SaveToRegistry(const APath: string);

  procedure SaveFormats(ARegistry: TRegistry; const APath: string);
  begin
    with ARegistry do
      if OpenKey(APath, True) then
      try
        try
          WriteBool(sdxAutoUpdateDateTime, AutoUpdateDateTime);
          WriteInteger(sdxDateFormat, DateFormat);
          WriteInteger(sdxTimeFormat, TimeFormat);
          WriteInteger(sdxPageNumberFormat, Integer(PageNumberFormat));
        except
          on ERegistryException do
          else
            raise;
        end;
      finally
        CloseKey;
      end;
  end;

  procedure SaveFileList(ARegistry: TRegistry; const APath: string);
  var
    I: Integer;
  begin
    with ARegistry do
    try
      if KeyExists(APath) then DeleteKey(APath);
      if OpenKey(APath, True) then
      try
        for I := 0 to FPrintFileList.Count - 1 do
          WriteString('File' + IntToStr(I), FPrintFileList[I]);
      finally
        CloseKey;
      end;
    except
      on ERegistryException do
      else
        raise;
    end;
  end;

var
  Registry: TRegistry;
begin
  if APath = '' then Exit;
  Registry := TRegistry.Create;
  try
    SaveFormats(Registry, APath);
    SaveFileList(Registry, APath + sdxPrintDlgFilesRegistryPath);
  finally
    Registry.Free;
  end;
end;

procedure TdxComponentPrinter.LoadFromRegistry(const APath: string);

  procedure LoadFormats(ARegistry: TRegistry; const APath: string);
  begin
    with ARegistry do
      if OpenKey(APath, False) then
      try
        try
          if ValueExists(sdxAutoUpdateDateTime) then
            AutoUpdateDateTime := ReadBool(sdxAutoUpdateDateTime);
          if ValueExists(sdxDateFormat) then
            DateFormat := ReadInteger(sdxDateFormat);
          if ValueExists(sdxTimeFormat) then
            TimeFormat := ReadInteger(sdxTimeFormat);
          if ValueExists(sdxPageNumberFormat) then
            PageNumberFormat := TdxPageNumberFormat(ReadInteger(sdxPageNumberFormat));
        except
          on ERegistryException do
          else
            raise;
        end;
      finally
        CloseKey;
      end;
  end;

  procedure LoadFileList(ARegistry: TRegistry; const APath: string);
  var
    Strings: TStringList;
    I: Integer;
  begin
    with ARegistry do
      if OpenKey(APath, False) then
      try
        try
          Strings := TStringList.Create;
          try
            GetValueNames(Strings);
            for I := 0 to Strings.Count - 1 do
              FPrintFileList.Add(ReadString(Strings[I]));
          finally
            Strings.Free;
          end;
        except
          on ERegistryException do
          else
            raise;
        end;
      finally
        CloseKey;
      end;
  end;

var
  Registry: TRegistry;
begin
  if APath = '' then Exit;
  Registry := TRegistry.Create;
  try
    LoadFormats(Registry, APath);
    LoadFileList(Registry, APath + sdxPrintDlgFilesRegistryPath);
  finally
    Registry.Free;
  end;
end;

procedure TdxComponentPrinter.GetDefaultExportPageFileName(AIndex,
  APageIndex: Integer; var AFileName: string);
begin
  AFileName := Format(AFileName, [APageIndex]);
end;

procedure TdxComponentPrinter.GetExportPageFileName(AIndex, APageIndex: Integer;
  var AFileName: string);
begin
  if Assigned(FOnExportGetPageFileName) then
    FOnExportGetPageFileName(Self, AIndex, APageIndex, AFileName)
  else
    GetDefaultExportPageFileName(AIndex, APageIndex, AFileName);
end;

procedure TdxComponentPrinter.EnumPagesAsImages(const APageIndexes: array of Integer;
  AGraphicClass: TGraphicClass; ADrawBackground: Boolean;
  ACallBackProc: TdxEnumPagesAsImagesProc;
  ACallBackData, AProgressData, APrepareData: Pointer;
  AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
begin
  AReportLink := CheckLink(AReportLink);
  if AReportLink = nil then Exit;
  dxPSEnumReportPages(Self, AReportLink, APageIndexes, AGraphicClass, ADrawBackground,
    ACallBackProc, ACallBackData, OnExportProgress, AProgressData,
    OnExportPrepareGraphic, APrepareData);
end;

procedure TdxComponentPrinter.WritePageAsImageToDisk(AComponentPrinter: TCustomdxComponentPrinter;
  AReportLink: TBasedxReportLink; AIndex, APageIndex: Integer; const AGraphic: TGraphic;
  AData: Pointer; var AContinue: Boolean);
const
  Buttons: TMsgDlgButtons = [mbYes, mbYesToAll, mbNo, mbCancel {, mbHelp}];
var
  FileName: string;
  MessageResult: Word;
  MessageText: string;
begin
  if AData = nil then Exit;
  FileName := string(AData);
  GetExportPageFileName(AIndex, APageIndex, FileName);
  if not ValidateFileName(FileName) then Exit;

  FOverWriteFile := True;
  if FileExists(FileName) and not OverWriteExistingFiles and not FOverWriteAll then
  begin
    FOverWriteFile := False;
    Beep;
    MessageText := Format(sdxConfirmOverWrite, [FileName]);
    MessageResult := MessageDlg(MessageText, mtWarning, Buttons, 0);
    case MessageResult of
      mrYes:
        FOverWriteFile := True;
      mrYesToAll:
        begin
          FOverWriteFile := True;
          FOverWriteAll := True;
        end;
      mrNo:
        begin
          AContinue := dxShowChooseFileNameDlg(FileName);
          if AContinue then FOverWriteFile := True;
        end;
      mrCancel:
        AContinue := False;
    end;
  end;
  if FOverWriteFile then AGraphic.SaveToFile(FileName);
end;

procedure TdxComponentPrinter.SavePagesAsImagesToDisk(const APageIndexes: array of Integer;
  AGraphicClass: TGraphicClass; ADrawBackground: Boolean; const AFileMask: string;
  AProgressData, APrepareData: Pointer;
  AReportLink: TBasedxReportLink{$IFDEF DELPHI4} = nil{$ENDIF});
begin
  FOverWriteAll := False;
  PrepareLongOperation;
  try
    EnumPagesAsImages(APageIndexes, AGraphicClass, ADrawBackground,
      WritePageAsImageToDisk, Pointer(AFileMask), AProgressData, APrepareData,
      AReportLink);
  finally
    FOverWriteAll := False;
    UnprepareLongOperation;
  end;
end;


{ TAbstractdxPreviewWindowDesigner }

constructor TAbstractdxPreviewWindowDesigner.Create(AComponentPrinter: TCustomdxComponentPrinter);
begin
  inherited Create;
  FComponentPrinter := AComponentPrinter;
  if FComponentPrinter <> nil then
    FComponentPrinter.FPreviewWindowDesigner := Self;
end;

destructor TAbstractdxPreviewWindowDesigner.Destroy;
begin
  if FComponentPrinter <> nil then
    FComponentPrinter.FPreviewWindowDesigner := nil;
  inherited Destroy;
end;


{ TAbstractdxReportLinkDesigner }

constructor TAbstractdxReportLinkDesigner.Create(AComponentPrinter: TCustomdxComponentPrinter);
begin
  inherited Create;
  FComponentPrinter := AComponentPrinter;
  if FComponentPrinter <> nil then
    FComponentPrinter.FReportLinkDesigner := Self;
end;

destructor TAbstractdxReportLinkDesigner.Destroy;
begin
  if FComponentPrinter <> nil then
    FComponentPrinter.FReportLinkDesigner := nil;
  inherited Destroy;
end;


{ TBasedxPreviewWindow }

destructor TBasedxPreviewWindow.Destroy;
var
  ComponentPrinter: TCustomdxComponentPrinter;
begin
  ComponentPrinter := GetComponentPrinter;
  if ComponentPrinter <> nil then
  begin
    if not ComponentPrinter.FModalPreview then 
      ComponentPrinter.DoAfterPreview(ComponentPrinter.CurrentLink);
    Exclude(ComponentPrinter.FState, cpsPreviewing);
    ComponentPrinter.FPreviewWindow := nil;
  end;
  inherited Destroy;
end;

procedure TBasedxPreviewWindow.PaintPage(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; APageIndex: Integer);
begin
  GetComponentPrinter.PaintPage(ACanvas, APageIndex, ARect, ARect, nil);
end;

procedure TBasedxPreviewWindow.BeginUpdate;
begin
end;

procedure TBasedxPreviewWindow.CancelUpdate;
begin
end;

procedure TBasedxPreviewWindow.EndUpdate;
begin
end;

function TBasedxPreviewWindow.Locked: Boolean;
begin
  Result := False;
end;

procedure TBasedxPreviewWindow.InvalidateContent;
begin
end;

procedure TBasedxPreviewWindow.InvalidatePage(APageIndex: Integer);
begin
end;

procedure TBasedxPreviewWindow.InvalidateAllPages;
begin
end;

procedure TBasedxPreviewWindow.InvalidatePagesContent;
begin
end;

procedure TBasedxPreviewWindow.InvalidatePagesHeaderContent;
begin
end;

procedure TBasedxPreviewWindow.InvalidatePagesFooterContent;
begin
end;

procedure TBasedxPreviewWindow.InitContent;
begin
end;

procedure TBasedxPreviewWindow.UpdateControls;
var
  CP: TCustomdxComponentPrinter;
begin
  CP := GetComponentPrinter;
  if (CP <> nil) and (CP.PreviewWindowDesigner <> nil) then
    CP.PreviewWindowDesigner.Modified;
end;

procedure dxPSEnumReportPages(AComponentPrinter: TdxComponentPrinter;
  AReportLink: TBasedxReportLink; const APageIndexes: array of Integer;
  AGraphicClass: TGraphicClass; AExportBackground: Boolean;
  ACallBackProc: TdxEnumPagesAsImagesProc; ACallBackData: Pointer;
  AProgressProc: TdxExportProgressEvent; AProgressData: Pointer;
  APrepareGraphicProc: TdxExportPrepareGraphicEvent; APrepareData: Pointer);
var
  G, G2: TGraphic;
  Canvas: TCanvas;
  I, AIndex, Max, Min, C: Integer;
  R: TRect;
  IsBitmap, IsMetafile, AContinue: Boolean;
  P: PIntArray;
  V: Variant;

  function PreparePageIndexes: Boolean;
  var
    I: Integer;
  begin
    V := varArrayCreate([Min, Max], varInteger);
    Result := varIsArray(V);
    if Result then
    begin
      P := varArrayLock(V);
     {$IFOPT R+}{$DEFINE PREVRANGECHECK}{$R-}{$ENDIF}
      for I := Min to Max do
        if (Low(APageIndexes) = High(APageIndexes)) and (APageIndexes[0] = -1) then
          P^[I] := I
        else
          P^[I] := APageIndexes[I];
      {$IFDEF SAVERANGECHECK}{$UNDEF PREVRANGECHECK}{$R+}{$ENDIF}
    end;
  end;

  procedure UnpreparePageIndexes;
  begin
    varArrayUnlock(V);
  end;

begin
  if (AComponentPrinter = nil) or (AReportLink = nil) and (@ACallBackProc = nil) then Exit;

  IsBitmap := (AGraphicClass <> nil) and AGraphicClass.InheritsFrom(TBitmap);
  IsMetafile := (AGraphicClass <> nil) and AGraphicClass.InheritsFrom(TMetafile);
  if IsMetafile then
    G := TMetafile.Create
  else
    G := TBitmap.Create;
  try
    with AReportLink.RealPrinterPage.PageSizePixels do
    begin
      G.Width := X;
      G.Height := Y;
    end;
    R := Rect(0, 0, G.Width, G.Height);
    if (Low(APageIndexes) = High(APageIndexes)) and (APageIndexes[0] = -1) then
    begin
      Max := AReportLink.PageCount - 1;
      Min := 0;
    end
    else
    begin
      Max := High(APageIndexes);
      Min := Low(APageIndexes);
    end;

    if PreparePageIndexes then
    try
      C := 0;
      if Assigned(AProgressProc) then C := Max - Min + 1;
      AContinue := True;
      for I := Min to Max do
      begin
        if IsMetafile then
          Canvas := TMetafileCanvas.Create(TMetafile(G), 0)
        else
        begin
          Canvas := TBitmap(G).Canvas;
          Canvas.Handle := 0; //Refresh;
        end;
        try
          FillRect(Canvas.Handle, R, GetStockObject(WHITE_BRUSH));
          if AExportBackground then
            AReportLink.RealPrinterPage.Background.Paint(Canvas, R);
          AIndex := P^[I];
          if (AIndex > -1) and (AIndex < AReportLink.PageCount) then
            AComponentPrinter.PaintPage(Canvas, AIndex, R, R, AReportLink);
        finally
          if IsMetafile then Canvas.Free;
        end;

        if not IsBitmap and not IsMetafile then
          G2 := TGraphicClassAccess(AGraphicClass).Create
        else
          G2 := G;
        try
          if not IsBitmap and not IsMetafile then G2.Assign(G);
          if Assigned(APrepareGraphicProc) then
            APrepareGraphicProc(AComponentPrinter, AReportLink, G2, APrepareData);
          ACallBackProc(AComponentPrinter, AReportLink, I, AIndex, G2,
            ACallBackData, AContinue);
        finally
          if not IsBitmap and not IsMetafile then G2.Free;
        end;

        if not AContinue then Break;

        if Assigned(AProgressProc) then
          AProgressProc(AComponentPrinter, AReportLink, C, I, AIndex, AProgressData);
      end;
    finally
      UnPreparePageIndexes;
    end;
  finally
    G.Free;
  end;
end;

initialization
  if IsWin95 then FUnitsPerInch := 960;
  FPixelsNumerator := FUnitsPerInch;
  FPixelsDenominator := Screen.PixelsPerInch;
  
  dxPSRegisterPrintStyle(TdxPSPrintStyle, nil);
  dxDefaultPrintStyleClass := TdxPSPrintStyle;

finalization
  dxPSUnregisterPrintStyle(TdxPSPrintStyle, nil);
  dxPSUnregisterAllReportLinks;
  dxPSUnregisterAllPreviewWindows;

end.
