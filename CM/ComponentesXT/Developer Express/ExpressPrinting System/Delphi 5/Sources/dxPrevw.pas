{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressPrinting System(tm) COMPONENT SUITE                  }
{                                                                   }
{       Copyright (C) 1998-2001 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire contents of this file is protected by U.S. and       }
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

unit dxPreVw;

interface

{$I dxPSVer.inc}

uses
  Classes, Controls, Messages, Windows, Graphics,
  Forms, StdCtrls, SysUtils, {$IFDEF DELPHI4} FlatSB, {$ENDIF}
  dxWrap, dxBkgnd, dxPSUtl, dxPSGlbl;

type
  TWMPostPaint = record
    Msg: Cardinal;
    PageIndex: Integer;
    Rect: PRect;
    Result: Longint;
  end;
  
  TCMHintHide = TWMNoParams;
  
  TdxPreviewMarginType = (pmLeft, pmTop, pmRight, pmBottom, pmGutter, pmHeader, pmFooter);

const
  dxPreviewIndent1 = 4;
  dxPreviewIndent2 = 9;
  dxPreviewIndent = dxPreviewIndent1 + dxPreviewIndent2;
  dxPreviewDragHintOffset = 5;
  dxPreviewMarginSelectDelta = 3;
  dxPreviewMinZoomFactor = 10;
  dxPreviewScrollStep = 30;
  dxPreviewShowHintTime = 500;
  dxPreviewMinUsefulSize: TPoint = (X: 500; Y: 500);
  dxPreviewMinHeaderFooterSize = 127;
  dxDefaultMarginValues: array[TdxPreviewMarginType] of Integer =
    (254, 254, 254, 254, 0, 127, 127);

type
  TCustomdxPreview = class;
  TAbstractdxPreviewMarginDesigner = class;
  TdxPreviewMargins = class;

  TdxPreviewPage = class(TObject)
  private
    FBounds: TRect;
    FPreview: TCustomdxPreview;
    function GetPartVisible : Boolean;
    function GetVisible : Boolean;
    procedure SetBounds(const Value: TRect);
  public
    constructor Create(APreview: TCustomdxPreview);

    property Bounds: TRect read FBounds write SetBounds;
    property PartVisible : Boolean read GetPartVisible;
    property Visible : Boolean read GetVisible;
  end;


  TdxPreviewMargin = class(TPersistent)
  private
    FDraggingPos: Integer;
    FEnabled: Boolean;
    FMargins: TdxPreviewMargins;
    FMarginType: TdxPreviewMarginType;
    FMaxValue: Integer;
    FMinValue: Integer;
    FScreenBitmap: HBITMAP;
    FValue: Integer;
    FVisible: Boolean;
    
    function GetBounds: TRect;
    function GetDisplayText: string;
    function GetDragging: Boolean;
    function GetDraggingValue: Integer;
    function GetMarginTypeName: string;
    function GetMaxPos: Integer;
    function GetMinPos: Integer;
    function GetPageBounds: TRect;
    function GetPreview: TCustomdxPreview;
    function GetRealMaxValue: Integer;
    function GetRealMinValue: Integer;
    function GetSelectableBounds: TRect;
    function GetVisibleValue: Integer;
    function IsValueStored: Boolean;
    procedure SetDraggingPos(Value: Integer);
    procedure SetEnabled(Value: Boolean);
    procedure SetMarginType(Value: TdxPreviewMarginType);
    procedure SetMaxValue(Value: Integer);
    procedure SetMinValue(Value: Integer);
    procedure SetValue(Value: Integer);
    procedure SetVisible(Value: Boolean);

    procedure ReadData(Stream: TStream);
    procedure WriteData(Stream: TStream);
  protected
    function GetOwner: TPersistent; override;
    
    procedure AfterDrag;
    procedure BeforeDrag;
    procedure Changed(HardRefresh: Boolean);
    function CheckValue(Value: Integer): Integer;
    procedure Draw(DC: hDC);
    procedure Invalidate;
    procedure InvertMargin(DC: hDC);
    function IsForward: Boolean;
    function IsVertical: Boolean;
    function PosFromValue(Value: Integer): Integer;
    function ValueFromPos(Pos: Integer): Integer;
    
    property Bounds: TRect read GetBounds;
    property DraggingPos: Integer read FDraggingPos write SetDraggingPos;
    property MaxPos: Integer read GetMaxPos;
    property MaxValue: Integer read FMaxValue write SetMaxValue; // LOMETRIC
    property MinPos: Integer read GetMinPos;
    property PageBounds: TRect read GetPageBounds;
    property Preview: TCustomdxPreview read GetPreview;
    property RealMaxValue: Integer read GetRealMaxValue;
    property RealMinValue: Integer read GetRealMinValue;
    property SelectableBounds: TRect read GetSelectableBounds;
  public
    constructor Create(AMargins: TdxPreviewMargins);
    procedure Assign(Source: TPersistent); override;
    function GetNamePath: string; override;
    
    property DisplayText: string read GetDisplayText;
    property Dragging: Boolean read GetDragging;
    property DraggingValue: Integer read GetDraggingValue;
    property Margins: TdxPreviewMargins read FMargins;
    property MarginType: TdxPreviewMarginType read FMarginType;
    property MarginTypeName: string read GetMarginTypeName;
    property VisibleValue: Integer read GetVisibleValue; // pixels
  published
    property Enabled: Boolean read FEnabled write SetEnabled
      default True;
    property MinValue: Integer read FMinValue write SetMinValue // LOMETRIC
      default 0;
    property Value: Integer read FValue write SetValue // LOMETRIC
      stored IsValueStored;
    property Visible: Boolean read FVisible write SetVisible
      default True;
  end;


  TdxPreviewMargins = class(TPersistent)
  private
    FList: TList;
    FPreview: TCustomdxPreview;
    
    function GetMargin(Index: TdxPreviewMarginType): TdxPreviewMargin;
    function GetMarginByName(const Name: string): TdxPreviewMargin;
    procedure SetMargin(Index: TdxPreviewMarginType; Value: TdxPreviewMargin);
    procedure SetMarginByName(const Name: string; Value: TdxPreviewMargin);
    
    function Add: TdxPreviewMargin;
    procedure Clear;
    
    procedure ReadData(Stream: TStream);
    procedure WriteData(Stream: TStream);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure Update(Item: TPersistent);
  public
    constructor Create(APreview: TCustomdxPreview);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    
    property Margins[Index: TdxPreviewMarginType]: TdxPreviewMargin read GetMargin 
       write SetMargin; default;
    property MarginByName[const Name: string]: TdxPreviewMargin read GetMarginByName 
       write SetMarginByName;
  end;


  TdxPreviewPageBackground = class(TdxBackground)
  private
    FBitmap: TBitmap;
    FPreview: TCustomdxPreview;
  protected  
    procedure DoApply; override;
    procedure DoChange(AChangeWhats: TdxBackgroundParams); override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Paint(ACanvas: TCanvas; const Rect: TRect); override;
    
    property Preview: TCustomdxPreview read FPreview;
    property OnApply;
  end;

  
  TdxPreviewHitTest = (phtNoWhere, phtPage, phtLeftMargin, phtTopMargin,
    phtRightMargin, phtBottomMargin, phtGutterMargin, phtHeaderMargin, phtFooterMargin);
  TdxPreviewHitTests = set of TdxPreviewHitTest;
  
  TdxPreviewOptionBehavior = 
    (pobAllowDragMargins, pobHotTrack, pobKeyNavigation, pobStoreInRegistry, pobThumbTracking);
  TdxPreviewOptionsBehavior = set of TdxPreviewOptionBehavior;
  
  TdxPreviewOptionHint = (pohShowForMargins, pohShowOnDrag, pohShowOnScroll);
  TdxPreviewOptionsHint = set of TdxPreviewOptionHint;
  
  TdxPreviewOptionStore = (posZoom);
  TdxPreviewOptionsStore = set of TdxPreviewOptionStore;
  
  TdxPreviewOptionView = 
    (povAutoHideScrollBars, povDefaultDrawPageBackground, povMargins, povPageSelection);
  TdxPreviewOptionsView = set of TdxPreviewOptionView;
  
  TdxPreviewOptionZoom = (pozZoomOnClick, pozZoomOnMouseRoll);
  TdxPreviewOptionsZoom = set of TdxPreviewOptionZoom;
  
  TdxPreviewDragStage = (pdsAfter, pdsBefore, pdsDrag);
  TdxPreviewLookAndFeel = (plfStandard, plfFlat, plfUltraFlat);
  TdxPreviewMeasurementUnits = 
     (pmuDefault, pmuInches, pmuMillimeters, pmuCentimeters, pmuPoints, pmuPicas);
  TdxPreviewPaperOrientation = (ppoPortrait, ppoLandscape);
  TdxPreviewScrollDirection = (psdLeft, psdUp, psdRight, psdDown);
  TdxPreviewZoomMode = (pzmNone, pzmPageWidth, pzmPages);
      
  TdxDrawPageContentEvent = procedure(Sender: TObject; ACanvas: TCanvas;
    ARect: TRect; APageIndex: Integer) of object;
    
  TdxGetPageNumberHintEvent = procedure(Sender: TObject; 
    AStartPage, AEndPage: Integer; var AHintString: string) of object;
    
  TdxCanShowMarginHintEvent = procedure(Sender: TObject; 
    var ACanShowHint: Boolean) of object;
    
  TdxMarginEvent = procedure(Sender: TObject; AMargin: TdxPreviewMargin) of object;
  
  TdxPreviewPageEvent = procedure(Sender: TObject; APageIndex: Integer) of object;
  
  TdxPageBackgroundDrawEvent = procedure(Sender: TObject; ACanvas: TCanvas;
    const ARect: TRect; APageIndex: Integer) of object;
    
  TdxSelectingPageEvent = procedure(Sender: TObject; APagePage: Integer;
    var ACanSelect: Boolean) of object;

    
  TCustomdxPreview = class(TCustomControl)
  private
    FBorderStyle: TBorderStyle;
    FDraggingMargin: TdxPreviewMargin;
    FIndent: Integer;
    FLeftPos: Integer;
    FLookAndFeel: TdxPreviewLookAndFeel;
    FMarginColor: TColor;
    FMarginDesigner: TAbstractdxPreviewMarginDesigner;
    FMargins: TdxPreviewMargins;
    FMaxZoomFactor: Integer;
    FMeasurementUnits: TdxPreviewMeasurementUnits;
    FMinFooterSize: Integer;
    FMinHeaderSize: Integer;
    FMinUsefulSize: TPoint;
    FMinZoomFactor: Integer;
    FOptionsBehavior: TdxPreviewOptionsBehavior;
    FOptionsHint: TdxPreviewOptionsHint;
    FOptionsStore: TdxPreviewOptionsStore;
    FOptionsView: TdxPreviewOptionsView;
    FOptionsZoom: TdxPreviewOptionsZoom;
    FOrientation: TdxPreviewPaperOrientation;
    FOriginalPageSize: TdxPointWrapper;
    FPageBackground: TdxBackground;
    FPageSize: TPoint;
    FPageXCount: Integer;
    FPageYCount: Integer;
    FRealOriginalPageSize: TPoint;
    FRegistryPath: string;
    FScrollBars: TScrollStyle;
  {$IFDEF DELPHI4}
    FScrollBarStyle: TScrollBarStyle;
  {$ENDIF}    
    FSelPageIndex: Integer;
    FTopPos: Integer;
    FUpdateCount: Integer;
    FZoomed: Boolean;
    FZoomFactor: Integer;
    FZoomMode: TdxPreviewZoomMode;
    FZoomStep: Integer;

    FBeforeDragPos: Integer;
    FDC: hDC;
    FDragOffset: Integer;
    FHideHintTimer: UINT;
    FHintWindow: TCustomControl;
    FIsTimerExpired: Boolean;
    FLastMousePos: TPoint;
    FMarginPen: HPEN;
    FPages: TList;
    FPageNumberHintWindow: TCustomControl;
    FPageStack: TList;
    FShowHintTimer: UINT;
    FUnzoomedFactor: Integer;
    FUnzoomedMode: TdxPreviewZoomMode;
    FZoomedFixed: Boolean;
    FZooming: Boolean;
    FZoomModeFixed: Boolean;
    
    FOnAfterDragMargin: TdxMarginEvent;
    FOnBeforeDragMargin: TdxMarginEvent;
    FOnCalcPageCount: TNotifyEvent;
    FOnDrawPageBackground: TdxPageBackgroundDrawEvent;
    FOnDragMargin: TdxMarginEvent;
    FOnDrawPageContent: TdxDrawPageContentEvent;
    FOnGetPageNumberHint: TdxGetPageNumberHintEvent;
    FOnCanShowMarginHint: TdxCanShowMarginHintEvent;
    FOnChangePageCount: TNotifyEvent;
    FOnMarginChanged: TdxMarginEvent;
    FOnPostDrawPageContent: TdxDrawPageContentEvent;
  {$IFNDEF DELPHI4}
    FOnResize: TNotifyEvent;
  {$ENDIF}
    FOnSelectedPageChanged: TdxPreviewPageEvent;
    FOnSelectedPageChanging: TdxPreviewPageEvent;
    FOnSelectingPage: TdxSelectingPageEvent;
    FOnZoomFactorChanged: TNotifyEvent;
    FOnZoomModeChanged: TNotifyEvent;

    function GetAllRowCount: Integer;
    function GetColCount: Integer;
    function GetPage(index: Integer): TdxPreviewPage;
    function GetPageCount: Integer;
    function GetRowCount: Integer;
    function GetSelPageCol: Integer;
    function GetSelPageRow: Integer;
    function GetVirtualHeight: Integer;
    function GetVirtualWidth: Integer;
    function GetVisiblePageSize: TPoint;
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetLeftPos(Value: Integer);
    procedure SetLookAndFeel(Value: TdxPreviewLookAndFeel);
    procedure SetMarginColor(Value: TColor);
    procedure SetMargins(Value: TdxPreviewMargins);
    procedure SetMaxZoomFactor(Value: Integer);
    procedure SetMinZoomFactor(Value: Integer);
    procedure SetMinFooterSize(Value: Integer);
    procedure SetMinHeaderSize(Value: Integer);
    procedure SetMinUsefulSize(const Value: TPoint);
    procedure SetOnCalcPageCount(Value: TNotifyEvent);
    procedure SetOptionsBehavior(Value:  TdxPreviewOptionsBehavior);
    procedure SetOptionsHint(Value:  TdxPreviewOptionsHint);
    procedure SetOptionsStore(Value: TdxPreviewOptionsStore);
    procedure SetOptionsView(Value: TdxPreviewOptionsView);
    procedure SetOptionsZoom(Value: TdxPreviewOptionsZoom);
    procedure SetOrientation(Value: TdxPreviewPaperOrientation);
    procedure SetOriginalPageSize(Value: TdxPointWrapper);
    procedure SetPageBackground(Value: TdxBackground);
    procedure SetPageCount(Value: Integer);
    procedure SetPageXCount(Value: Integer);
    procedure SetPageYCount(Value: Integer);
    procedure SetScrollBars(Value: TScrollStyle);
  {$IFDEF DELPHI4}
    procedure SetScrollBarStyle(const Value: TScrollBarStyle);
  {$ENDIF}
    procedure SetSelPageIndex(Value: Integer);
    procedure SetTopPos(Value: Integer);
    procedure SetZoomed(Value: Boolean);
    procedure SetZoomFactor(Value: Integer);
    procedure SetZoomMode(Value: TdxPreviewZoomMode);
    procedure SetZoomStep(Value: Integer);
  {$IFDEF DELPHI4}
    procedure AdjustBkColor;     
  {$ENDIF}  
    procedure AdjustOrientation;
    procedure AdjustPagesBounds;    
    procedure DrawNoPages;
    procedure DrawPages;
    procedure DrawPagesContent;
  {$IFDEF DELPHI4}
    function GetUltraFlatBkColor: TColor;
  {$ENDIF}  
    procedure PageParametersChanging(Sender: TObject; Coords: TdxPointCoords;
      var Values: array of Integer);
    procedure PageParametersChanged(Sender: TObject; Coords: TdxPointCoords);
    procedure ResyncSelPageIndex;
   
    function CanAnyScrolling: Boolean;
    function CanHorzScrolling: Boolean;
    function CanPageScrolling(Direction: TdxPreviewScrollDirection): Boolean;
    function CanVertScrolling: Boolean;
    function CanHorzScrollBarBeVisible: Boolean;
    function CanVertScrollBarBeVisible: Boolean;
    function DoublePassUpdateScrollBars: Boolean;
    function GetScrollInfo(BarFlag: Integer; var ScrollInfo: TScrollInfo): BOOL;
    procedure ScrollPage(Direction: TdxPreviewScrollDirection);
    function SetScrollInfo(BarFlag: Integer; const ScrollInfo: TScrollInfo; Redraw: BOOL): Integer;
    procedure UpdateScrollBars;

    procedure CancelDragMargin;
    function CanChangeMargins: Boolean;    
    procedure ClearLastMousePos;
    procedure RecreateMarginPen;
        
    procedure ActivateHint(Margin: TdxPreviewMargin);
    procedure CreateHint;
    procedure DestroyHideHintTimer;
    procedure DestroyHint;
    procedure DestroyPageNumberHint;
    procedure DestroyShowHintTimer;
    procedure ResetHintTimer(X, Y: Integer);
    procedure StartHintTimer;
    procedure UpdatePageNumberHint;
    
    procedure DesignerModified;            
    function IsDesigning: Boolean; 
        
    procedure WMCaptureChanged(var message: TMessage); message WM_CAPTURECHANGED;
    procedure WMDestroy(var message: TWMDestroy); message WM_DESTROY;
    procedure WMGetDlgCode(var message: TMessage); message WM_GETDLGCODE;
    procedure WMEraseBkgnd(var message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMHScroll(var message: TWMHScroll); message WM_HSCROLL;
    procedure WMKillFocus(var message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMLButtonDblClk(var message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMRButtonUp(var message: TMessage); message WM_RBUTTONUP;
    procedure WMMouseActivate(var message: TWMMouseActivate); message WM_MOUSEACTIVATE;
    procedure WMMouseWheel(var Message: TWMMouse); message WM_MOUSEWHEEL;
    procedure WMNCCalcSize(var message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCDestroy(var message: TMessage); message WM_NCDESTROY;
    procedure WMNCHitTest(var message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCPaint(var message: TWMNCPaint); message WM_NCPAINT;
    procedure WMSetCursor(var Message: TWMSetCursor); message WM_SETCURSOR;
    procedure WMSize(var message: TWMSize); message WM_SIZE;
    procedure WMVScroll(var message: TWMVScroll); message WM_VSCROLL;
    procedure CMCancelMode(var message: TCMCancelMode); message CM_CANCELMODE;
    procedure CMCtl3DChanged(var message: TMessage); message CM_CTL3DCHANGED;
    procedure CMDesignHitTest(var message: TCMDesignHitTest); message CM_DESIGNHITTEST;
    procedure CMHintShow(var message: TCMHintShow); message CM_HINTSHOW;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
  protected
  {$IFDEF DELPHI4}
    procedure AdjustSize; override;    
  {$ENDIF}
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
  {$IFDEF DELPHI4} 
    procedure CreateWnd; override;
  {$ENDIF}    
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Loaded; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
  {$IFNDEF DELPHI4}
    procedure Resize; dynamic;
  {$ENDIF}
    procedure WndProc(var message: TMessage); override;
    
    procedure AddPage;
    function CheckLeftPos(Value: Integer): Integer;
    procedure CheckMargins;
    function CheckTopPos(Value: Integer): Integer;
    procedure CheckZoomFactor;
    procedure DoScrolling;

    function CanSelectPage(APageIndex: Integer): Boolean; dynamic;
    procedure DoAfterDragMargin(Margin: TdxPreviewMargin); dynamic;
    procedure DoBeforeDragMargin(Margin: TdxPreviewMargin); dynamic;
    procedure DoCalcPageCount; dynamic;
    procedure DoChangePageCount; dynamic;
    procedure DoCustomDrawPageContent(R: TRect; APageIndex: Integer); virtual;
    procedure DoDragMargin(Margin: TdxPreviewMargin); virtual;
    procedure DoMarginChanged(Margin: TdxPreviewMargin); dynamic;
    procedure DoZoomFactorChanged; virtual;
    procedure DoZoomModeChanged; virtual;
    procedure DoSelectedPageChanging; dynamic;
    procedure DoSelectedPageChanged; dynamic;
    function GetCanShowMarginHint: Boolean; virtual;
    function GetPageNumberHint: string; virtual;

    procedure DrawMargins(DC: hDC);
    procedure DrawPageBackground(const R: TRect; APageIndex: Integer); virtual;
    procedure DrawPageBorder(DC: hDC; const ARect: TRect; APageIndex: Integer); virtual;
    function GetPageSiteRect(const APageRect: TRect): TRect;
    procedure InvalidateMargins;
    procedure InvalidatePageBorder(APageIndex: Integer);
    
  {$IFDEF DELPHI4}
    property ScrollBarStyle: TScrollBarStyle read FScrollBarStyle write SetScrollBarStyle 
      default ssRegular;
  {$ENDIF}      
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure BeginUpdate;
    procedure CancelUpdate;    
    procedure EndUpdate;
    
    procedure CalcPagesBounds(ATopPos, VWidth, VHeight: Integer);
    function GetHitInfoAt(const X, Y: Integer): TdxPreviewHitTests;
    function GetInnerMeasurementUnits: TdxPreviewMeasurementUnits;
    procedure GetPartVisiblePageRanges(StartIndex, EndIndex: PInteger);
    procedure GetVisiblePageRanges(StartIndex, EndIndex: PInteger);
    procedure HideAllHints;
    
    procedure InvalidatePage(APageIndex: Integer);    
    procedure InvalidatePages;
    procedure InvalidatePagesContent;
    procedure InvalidatePagesFooter;
    procedure InvalidatePagesHeader;
    
    procedure MakeVisible(PageIndex: Integer);
    function MarginFromPoint(const P: TPoint): TdxPreviewMargin;
    function MarginValueToString(Value: Integer): string;    
    function PageIndexFromPoint(const P: TPoint): Integer;
    function PageSizeToString: string;    
    procedure RestoreDefaultMargins;
    procedure SelectFirstPage;
    procedure SelectLastPage;
    procedure SelectNextPage;
    procedure SelectPrevPage;
    procedure SetPageXYCount(XCount, YCount: Integer);
    procedure ZoomIn;
    procedure ZoomOut;

    procedure LoadFromRegistry(const ARegistryPath: string);
    procedure SaveToRegistry(const ARegistryPath: string);
    
    property AllRowCount: Integer read GetAllRowCount;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle
      default bsSingle;
    property ColCount: Integer read GetColCount;
    property DraggingMargin: TdxPreviewMargin read FDraggingMargin;
    property Indent: Integer read FIndent;
    property LeftPos: Integer read FLeftPos write SetLeftPos;
    property LookAndFeel: TdxPreviewLookAndFeel read FLookAndFeel write SetLookAndFeel
      default plfStandard;
    property MarginDesigner: TAbstractdxPreviewMarginDesigner read FMarginDesigner; {accesible only in designtime}
    property MarginColor: TColor read FMarginColor write SetMarginColor
      default clWindowText;
    property Margins: TdxPreviewMargins read FMargins write SetMargins;
    property MaxZoomFactor: Integer read FMaxZoomFactor write SetMaxZoomFactor
      default 500;
    property MeasurementUnits: TdxPreviewMeasurementUnits read FMeasurementUnits
      write FMeasurementUnits default pmuDefault;
    property MinFooterSize: Integer read FMinFooterSize write SetMinFooterSize
      default dxPreviewMinHeaderFooterSize;
    property MinHeaderSize: Integer read FMinHeaderSize write SetMinHeaderSize
      default dxPreviewMinHeaderFooterSize;
    property MinUsefulSize: TPoint read FMinUsefulSize write SetMinUsefulSize;
    property MinZoomFactor: Integer read FMinZoomFactor write SetMinZoomFactor
      default 10;
    property OptionsBehavior: TdxPreviewOptionsBehavior read FOptionsBehavior write SetOptionsBehavior
      default [pobAllowDragMargins, pobKeyNavigation, pobThumbTracking];
    property OptionsHint: TdxPreviewOptionsHint read FOptionsHint write SetOptionsHint
      default [pohShowForMargins, pohShowOnDrag, pohShowOnScroll];
    property OptionsStore: TdxPreviewOptionsStore read FOptionsStore write SetOptionsStore
      default [posZoom];
    property OptionsView: TdxPreviewOptionsView read FOptionsView write SetOptionsView
      default [povAutoHideScrollBars, povDefaultDrawPageBackground, povMargins, povPageSelection];
    property OptionsZoom: TdxPreviewOptionsZoom read FOptionsZoom write SetOptionsZoom
      default [pozZoomOnClick];
    property Orientation: TdxPreviewPaperOrientation read FOrientation write SetOrientation
      default ppoPortrait;
    property OriginalPageSize: TdxPointWrapper read FOriginalPageSize write SetOriginalPageSize; // in tenths of a mm
    property PageBackground: TdxBackground read FPageBackground write SetPageBackground;
    property PageCount: Integer read GetPageCount write SetPageCount;
    property Pages[Index: Integer]: TdxPreviewPage read GetPage;
    property PageSize: TPoint read FPageSize; // in pixels = 100% zoom
    property PageXCount: Integer read FPageXCount write SetPageXCount
      default 1;
    property PageYCount: Integer read FPageYCount write SetPageYCount
      default 1;
    property RealOriginalPageSize: TPoint read FRealOriginalPageSize; // in tenths of a mm with Orientation
    property RegistryPath: string read FRegistryPath write FRegistryPath;
    property RowCount: Integer read GetRowCount;
    property ScrollBars: TScrollStyle read FScrollBars write SetScrollBars
      default ssBoth;
    property SelPageCol: Integer read GetSelPageCol;
    property SelPageIndex: Integer read FSelPageIndex write SetSelPageIndex;
    property SelPageRow: Integer read GetSelPageRow;
    property TopPos: Integer read FTopPos write SetTopPos;
    property VirtualHeight: Integer read GetVirtualHeight;
    property VirtualWidth: Integer read GetVirtualWidth;
    property VisiblePageSize: TPoint read GetVisiblePageSize;
    property Zoomed: Boolean read FZoomed write SetZoomed;
    property ZoomFactor: Integer read FZoomFactor write SetZoomFactor
      stored True default 100;
    property ZoomMode: TdxPreviewZoomMode read FZoomMode write SetZoomMode
      default pzmNone; //Pages;
    property ZoomStep: Integer read FZoomStep write SetZoomStep
      default 10;

    property OnAfterDragMargin: TdxMarginEvent read FOnAfterDragMargin 
      write FOnAfterDragMargin;
    property OnBeforeDragMargin: TdxMarginEvent read FOnBeforeDragMargin 
      write FOnBeforeDragMargin;
    property OnCalcPageCount: TNotifyEvent read FOnCalcPageCount 
      write SetOnCalcPageCount;
    property OnDrawPageBackground: TdxPageBackgroundDrawEvent read FOnDrawPageBackground
      write FOnDrawPageBackground;
    property OnDragMargin: TdxMarginEvent read FOnDragMargin
      write FOnDragMargin;
    property OnDrawPageContent: TdxDrawPageContentEvent read FOnDrawPageContent
      write FOnDrawPageContent;
    property OnGetPageNumberHint: TdxGetPageNumberHintEvent read FOnGetPageNumberHint
      write FOnGetPageNumberHint;
    property OnCanShowMarginHint: TdxCanShowMarginHintEvent read FOnCanShowMarginHint
      write FOnCanShowMarginHint;
    property OnChangePageCount: TNotifyEvent read FOnChangePageCount write FOnChangePageCount;
    property OnMarginChanged: TdxMarginEvent read FOnMarginChanged
      write FOnMarginChanged;
    property OnPostDrawPageContent: TdxDrawPageContentEvent read FOnPostDrawPageContent
      write FOnPostDrawPageContent;
  {$IFNDEF DELPHI4}
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
  {$ENDIF}
    property OnSelectedPageChanged: TdxPreviewPageEvent read FOnSelectedPageChanged
      write FOnSelectedPageChanged;
    property OnSelectedPageChanging: TdxPreviewPageEvent read FOnSelectedPageChanging
      write FOnSelectedPageChanging;
    property OnSelectingPage: TdxSelectingPageEvent read FOnSelectingPage 
      write FOnSelectingPage;
    property OnZoomFactorChanged: TNotifyEvent read FOnZoomFactorChanged
      write FOnZoomFactorChanged;
    property OnZoomModeChanged: TNotifyEvent read FOnZoomModeChanged
      write FOnZoomModeChanged;
  end;

  TdxPreview = class(TCustomdxPreview)
  published
    property Align;
  {$IFDEF DELPHI4}
    property Anchors;
  {$ENDIF}
    property BorderStyle;
    property Color default clBtnShadow;
  {$IFDEF DELPHI4}
    property Constraints;
  {$ENDIF}
    property Ctl3D;
    property DragMode;
    property Enabled;
    property LookAndFeel;
    property MarginColor;
    property Margins;
    property MaxZoomFactor;
    property MeasurementUnits;
    property MinFooterSize;
    property MinHeaderSize;
    property MinZoomFactor;
    property OptionsBehavior;
    property OptionsHint;
    property OptionsStore;
    property OptionsView;
    property OptionsZoom;
    property Orientation;
    property OriginalPageSize;
    property PageBackground;
    property PageXCount;
    property PageYCount;
    property ParentColor default False;
    property ParentCtl3D;
    property ParentShowHint;
    property PopupMenu;
    property ScrollBars;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property ZoomFactor;
    property ZoomMode;
    property ZoomStep;

    property OnAfterDragMargin;
    property OnBeforeDragMargin;
    property OnCalcPageCount;
  {$IFDEF DELPHI4}
    property OnCanResize;
    property OnConstrainedResize;
  {$ENDIF}
  {$IFDEF DELPHI5}
    property OnContextPopup;
  {$ENDIF}
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragMargin;
    property OnDragOver;
    property OnDrawPageBackground;
    property OnDrawPageContent;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetPageNumberHint;
    property OnCanShowMarginHint;
    property OnMarginChanged;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnSelectedPageChanged;
    property OnSelectedPageChanging;
    property OnSelectingPage;
    property OnStartDrag;
    property OnZoomFactorChanged;
    property OnZoomModeChanged;
  end;


  TAbstractdxPreviewMarginDesigner = class
  private
    FPreview: TCustomdxPreview;
  protected
    procedure Activate; virtual; abstract;
    procedure ActivateEx(AMargin: TdxPreviewMargin); virtual; abstract;
    procedure Modified; virtual; abstract;
  public
    constructor Create(APreview: TCustomdxPreview);
    destructor Destroy; override;
    property Preview: TCustomdxPreview read FPreview;
  end;

const
  phtMargins: TdxPreviewHitTests = [phtLeftMargin, phtTopMargin, phtRightMargin, 
    phtBottomMargin, phtHeaderMargin, phtFooterMargin, phtGutterMargin];
  phtHorzMargins: TdxPreviewHitTests = [phtTopMargin, phtBottomMargin, phtHeaderMargin];
  phtVertMargins: TdxPreviewHitTests = [phtLeftMargin, phtRightMargin, phtGutterMargin];
{$IFDEF DELPHI4}      
  dxScrollBarStyles: array[TdxPreviewLookAndFeel] of TScrollBarStyle = 
    (ssRegular, ssFlat, ssHotTrack);
{$ENDIF}  

type
  TdxGetParentFormProc = function(Control: TControl): TCustomForm;
  
var  
  GetParentFormProc: TdxGetParentFormProc;
  
implementation

uses
  Math, TypInfo, Registry, {$IFDEF DELPHI4} CommCtrl, {$ENDIF}
  dxPSRes, dxPSImgs;

function GetParentForm(Control: TControl): TCustomForm;
begin
  if Assigned(GetParentFormProc) then 
    Result := GetParentFormProc(Control)
  else
    Result := Forms.GetParentForm(Control);
end;

type
  TFloat = Extended;

const
  NullDraggingPos = -Maxint;
  dxShowHintTimerID = 1;
  dxHideHintTimerID = 2;
  dxUpdatePageBoundsTimerID = 3;
  dxPreviewHideHintTime = 500;
  dxPreviewLongHideHintTime = 10000;
  
var
  A4_LOMETRIC: TPoint = (X: 2100; Y: 2970);
  FLongShowHintTime: DWORD;
    
  crdxPreviewHorzResize: TCursor;
  crdxPreviewVertResize: TCursor;
  crdxPreviewZoomIn: TCursor;
  crdxPreviewZoomOut: TCursor;
  crdxPreviewFullScroll: TCursor;
  crdxPreviewHorzScroll: TCursor;
  crdxPreviewVertScroll: TCursor;
  crdxPreviewUpScroll: TCursor;
  crdxPreviewRightScroll: TCursor;
  crdxPreviewDownScroll: TCursor;
  crdxPreviewLeftScroll: TCursor;
  crdxPreviewTopLeftScroll: TCursor;
  crdxPreviewBottomLeftScroll: TCursor;
  crdxPreviewTopRightLeftScroll: TCursor;
  crdxPreviewBottomRightScroll: TCursor;

{$IFDEF DELPHI6}
  {$IFDEF MSWINDOWS}
    {$WARN SYMBOL_PLATFORM OFF}	
  {$ENDIF}
{$ENDIF}

function GetDefaultMeasurementUnits: TdxPreviewMeasurementUnits;
begin
  if GetLocaleChar(LOCALE_USER_DEFAULT, LOCALE_IMEASURE, '0') = '0' then
    Result := pmuMillimeters
  else
    Result := pmuInches;
end;

{$IFDEF DELPHI6}
  {$IFDEF MSWINDOWS}
    {$WARN SYMBOL_PLATFORM ON}	
  {$ENDIF}
{$ENDIF}

function LoMetricToPixels(const Value: TPoint): TPoint;
var
  DC: hDC;
begin
  DC := GetDC(0);
  try
    Result.X := MulDiv(Value.X, GetDeviceCaps(DC, LOGPIXELSX), 254);
    Result.Y := MulDiv(Value.Y, GetDeviceCaps(DC, LOGPIXELSY), 254);
    //Result.X := MulDiv(Value.X, GetDeviceCaps(DC, HORZRES), 10 * GetDeviceCaps(DC, HORZSIZE));
    //Result.Y := MulDiv(Value.Y, GetDeviceCaps(DC, VERTRES), 10 * GetDeviceCaps(DC, VERTSIZE));  
  finally
    ReleaseDC(0, DC);
  end;
end;

function LoMetricToPixelsX(Value: Integer): Integer;
var
  DC: hDC;
begin
  DC := GetDC(0);
  try
    Result := MulDiv(Value, GetDeviceCaps(DC, LOGPIXELSX), 254);
    //Result := MulDiv(Value, GetDeviceCaps(DC, HORZRES), 10 * GetDeviceCaps(DC, HORZSIZE));
  finally
    ReleaseDC(0, DC);
  end;
end;

function PixelsToLoMetricX(Value: Integer): Integer;
var
  DC: hDC;
begin
  DC := GetDC(0);
  try
    Result := MulDiv(Value, 254, GetDeviceCaps(DC, LOGPIXELSX));
  finally
    ReleaseDC(0, DC);
  end;
end;

function LoMetricToAnother(Units: TdxPreviewMeasurementUnits; Value: Integer): tFloat;
var
  AUnits: TdxPreviewMeasurementUnits;
begin
  if (Units = pmuDefault) then
    AUnits := GetDefaultMeasurementUnits
  else
    AUnits := Units;
  case AUnits of
    pmuInches:
      Result := Value / 254;
    pmuMillimeters:
      Result := Value / 10;
    pmuCentimeters:
      Result := Value / 100;
    pmuPoints:
      Result := Value * 72 / 254;
  else { pmuPicas}
      Result := Value * 6 / 254;
  end;
end;

function Min(const V1, V2: Integer): Integer;
begin
  if V1 < V2 then
    Result := V1
  else
    Result := V2;
end;

function Max(const V1, V2: Integer): Integer;
begin
  if V1 > V2 then
    Result := V1
  else
    Result := V2;
end;

function MinMax(const V, V1, V2: Integer): Integer;
begin
  if (V2 >= V1) then
  begin
    if (V < V1) then
      Result := V1
    else if (V > V2) then
      Result := V2
    else
      Result := V;
  end
  else
    Result := V2;
end;

function DefineCursor(Instance: THandle; ResID: Integer): TCursor;
var
  Handle: HCURSOR;
begin
  Result := crDefault;
  Handle := LoadCursor(Instance, PChar(ResID));
  if (Handle > 0) then
  begin
    for Result := 100 to High(TCursor) do
      if (Screen.Cursors[Result] = Screen.Cursors[crDefault]) then
      begin
        Screen.Cursors[Result] := Handle;
        Exit;
      end;
    DestroyCursor(Handle);
    raise EOutOfResources.Create(sdxOutOfResources);
  end;
end;

type
  TdxPreviewHintWindow = class(TCustomControl)
  private
    FirstPos: TPoint;
    procedure WMEraseBkgnd(var message: TWMEraseBkgnd); message WM_ERASEBKGND;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ActivateHint(P: TPoint; const AHint: string; Margin: TdxPreviewMargin);
  end;

constructor TdxPreviewHintWindow.Create(AOwner: TComponent);
var
  NonClientMetrics: TNonClientMetrics;
begin
  inherited;
  NonClientMetrics.cbSize := SizeOf(NonClientMetrics);
  if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @NonClientMetrics, 0) then
    Canvas.Font.Handle := CreateFontIndirect(NonClientMetrics.lfStatusFont)
  else
    Canvas.Font.Size := 8;
end;

procedure TdxPreviewHintWindow.WMEraseBkgnd(var message: TWMEraseBkgnd);
begin
  message.Result := 1;
end;

procedure TdxPreviewHintWindow.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := WS_POPUP or WS_DISABLED;
    WindowClass.Style := WindowClass.Style or CS_SAVEBITS;
    ExStyle := WS_EX_TOOLWINDOW;
  end;
end;

procedure TdxPreviewHintWindow.Paint;
var
  R: TRect;
  DC: hDC;
begin
  Windows.GetClientRect(Handle, R);
  DC := Canvas.Handle;
  DrawEdge(DC, R, BDR_RAISEDOUTER, BF_RECT or BF_ADJUST);
  SetTextColor(DC, GetSysColor(COLOR_INFOTEXT));
  SetBkColor(DC, GetSysColor(COLOR_INFOBK));
  ExtTextOut(DC, R.Left + 2, R.Top + 2, ETO_OPAQUE, @R, PChar(Caption), Length(Caption), nil);
end;

procedure TdxPreviewHintWindow.ActivateHint(P: TPoint; const AHint: string;
  Margin: TdxPreviewMargin);
var
  R: TRect;
  AWidth, AHeight: Integer;
begin
  Application.CancelHint;
  Caption := AHint;

  R := Rect(0, 0, Screen.Width, 0);
  DrawText(Canvas.Handle, PChar(AHint), -1, R, DT_CALCRECT or DT_LEFT or DT_NOPREFIX);
  Inc(R.Right, 2 * (1 + 2));
  Inc(R.Bottom, 2 * (1 + 2));
  AWidth := R.Right;
  AHeight := R.Bottom;
  if IsWindowVisible(Handle) then
  begin
    if AWidth < Width then AWidth := Width;
    if AHeight < Height then AHeight := Height;
  end
  else
    FirstPos := P;

  if Assigned(Margin) then
  begin
    if Margin.IsForward then
      if Margin.IsVertical then
        OffsetRect(R, -(dxPreviewDragHintOffset + AWidth), dxPreviewDragHintOffset)
      else
        OffsetRect(R, dxPreviewDragHintOffset, -(dxPreviewDragHintOffset + AHeight))
    else
      OffsetRect(R, dxPreviewDragHintOffset, dxPreviewDragHintOffset);
  end
  else {scroll bar hint}
    OffsetRect(R, -(GetSystemMetrics(SM_CXVSCROLL) + AWidth), 0);

  OffsetRect(R, FirstPos.X, FirstPos.Y);

  with R do
  begin
    if Right > Screen.Width then
      OffsetRect(R, Screen.Width - Right, 0);
    if Bottom > Screen.Height then
      OffsetRect(R, 0, Screen.Height - Bottom);
    if Left < 0 then OffsetRect(R, -Left, 0);
    if Top < 0 then OffsetRect(R, 0, -Top);
  end;

  if IsWindowVisible(Handle) then
    if (Width <> AWidth) or (Height <> AHeight) then
      ShowWindow(Handle, SW_HIDE)
    else
    begin
      InvalidateRect(Handle, nil, False);
      UpdateWindow(Handle);
    end;
  
  if not IsWindowVisible(Handle) then
    SetWindowPos(Handle, HWND_TOPMOST, R.Left, R.Top, AWidth, AHeight,
      SWP_SHOWWINDOW or SWP_NOACTIVATE);
end;


{ TdxPreviewPageBackground }

constructor TdxPreviewPageBackground.Create;
begin
  inherited Create;
  FBitmap := TBitmap.Create;
end;

destructor TdxPreviewPageBackground.Destroy;
begin
  FBitmap.Free;
  inherited Destroy;
end;

procedure TdxPreviewPageBackground.Paint(ACanvas: TCanvas; const Rect: TRect);
begin
  if (Mode = bmPicture) and (PictureMode = ppmCenter) and (Preview.ZoomFactor <> 100) then
  begin
    FBitmap.Width := MulDiv(Picture.Width, Preview.ZoomFactor, 100);
    FBitmap.Height := MulDiv(Picture.Height, Preview.ZoomFactor, 100);
    FBitmap.Canvas.StretchDraw(Classes.Rect(0, 0, FBitmap.Width, FBitmap.Height), Picture);
    DrawPicture(FBitmap, ACanvas, Rect, PictureMode, 1, 1);
  end
  else
    inherited Paint(ACanvas, Rect);
end;

procedure TdxPreviewPageBackground.DoApply;
begin
  inherited DoApply;
  if (FPreview <> nil) and (FPreview.FUpdateCount = 0) then 
  begin
    FPreview.InvalidatePages;    
    FPreview.DesignerModified;
  end;  
end;

procedure TdxPreviewPageBackground.DoChange(AChangeWhats: TdxBackgroundParams);
begin
  inherited DoChange(AChangeWhats);
  if (UpdateCount = 0) and NeedRepaint and (FPreview <> nil) and (FPreview.FUpdateCount = 0) then
    FPreview.InvalidatePages;
end;


{ TdxPreviewPage }

constructor TdxPreviewPage.Create(APreview: TCustomdxPreview);
begin
  inherited Create;
  FPreview := APreview;
end;

function TdxPreviewPage.GetPartVisible : Boolean;
var
  R : TRect;
begin
  Result := IntersectRect(R, Bounds, FPreview.ClientRect);
end;

function TdxPreviewPage.GetVisible : Boolean;
var
  R : TRect;
begin
  Result := IntersectRect(R, Bounds, FPreview.ClientRect) and EqualRect(R, Bounds);
end;

procedure TdxPreviewPage.SetBounds(const Value: TRect);
begin
  FBounds := Value;
end;


{ TdxPreviewMargin }

constructor TdxPreviewMargin.Create(AMargins: TdxPreviewMargins);
begin
  inherited Create;
  FMargins := AMargins;
  FDraggingPos := NullDraggingPos;
  FEnabled := True;
  FMaxValue := -1;
  FMinValue := 0;
  FValue := 0;
  FVisible := True;
  if Assigned(FMargins) then
    SetMarginType(TdxPreviewMarginType(FMargins.FList.Count));
end;

procedure TdxPreviewMargin.Assign(Source: TPersistent);
var
  Src: TdxPreviewMargin absolute Source;
begin
  if (Source is TdxPreviewMargin) then
  begin
    FEnabled := Src.Enabled;
    FMaxValue := Src.MaxValue;
    FMinValue := Src.MinValue;
    FValue := Src.Value;
    FVisible := Src.Visible;
  end
  else
    inherited Assign(Source);
end;

procedure TdxPreviewMargin.Changed(HardRefresh: Boolean);
begin
  if Assigned(FMargins) then
    if HardRefresh then
      FMargins.Update(nil)
    else
      FMargins.Update(Self)
end;

function TdxPreviewMargin.GetOwner: TPersistent;
begin
  if Assigned(FMargins) then
    Result := FMargins.FPreview
  else
    Result := nil;
end;

function TdxPreviewMargin.GetNamePath: string;
begin
  if Assigned(FMargins) then
    Result := Format('%s[%s]', [FMargins.GetNamePath, 
      GetEnumName(TypeInfo(TdxPreviewMarginType), Integer(FMarginType))])
  else
    Result := ClassName;
end;

type
  TdxMarginInfo = packed record
    MaxValue: Integer;
    MinValue: Integer;
    Value: Integer;
    Enabled: Boolean;
    Visible: Boolean;
  end;

procedure TdxPreviewMargin.ReadData(Stream: TStream);
var
  MarginInfo: TdxMarginInfo;
begin
  FillChar(MarginInfo, SizeOf(TdxMarginInfo), 0);
  Stream.ReadBuffer(MarginInfo, SizeOf(TdxMarginInfo));
  FMaxValue := MarginInfo.MaxValue;
  FMinValue := MarginInfo.MinValue;
  FValue := MarginInfo.Value;
  FEnabled := MarginInfo.Enabled;
  FVisible := MarginInfo.Visible;
end;

procedure TdxPreviewMargin.WriteData(Stream: TStream);
var
  MarginInfo: TdxMarginInfo;
begin
  FillChar(MarginInfo, SizeOf(TdxMarginInfo), 0);
  MarginInfo.MaxValue := MaxValue;
  MarginInfo.MinValue := MinValue;
  MarginInfo.Value := Value;
  MarginInfo.Enabled := Enabled;
  MarginInfo.Visible := Visible;
  Stream.WriteBuffer(MarginInfo, SizeOf(TdxMarginInfo));
end;

procedure TdxPreviewMargin.SetMarginType(Value: TdxPreviewMarginType);
begin
  FMarginType := Value;
  FValue := dxDefaultMarginValues[FMarginType];
end;

function TdxPreviewMargin.GetBounds: TRect;
var
  APos: Integer;
begin
  Result := PageBounds;
  with Result do
  begin
    if Dragging and (FDraggingPos <> NullDraggingPos) then
      APos := FDraggingPos
    else
      APos := PosFromValue(FValue);
    if IsVertical then
    begin
      Left := APos;
      Right := APos;
    end
    else
    begin
      Top := APos;
      Bottom := APos;
    end;
  end;
end;

function TdxPreviewMargin.GetMarginTypeName: string;
begin
  case MarginType of
    pmLeft: Result := sdxLeftMargin;
    pmTop: Result := sdxTopMargin;
    pmRight: Result := sdxRightMargin;
    pmBottom: Result := sdxBottomMargin;
    pmGutter: Result := sdxGutterMargin;
    pmHeader: Result := sdxHeaderMargin;
  else {pmFooter} Result := sdxFooterMargin;
  end;
end;

function TdxPreviewMargin.GetDisplayText: string;
begin
  Result := GetMarginTypeName + ': ';
  if Assigned(Preview) then
    if Dragging then
      Result := Result + Preview.MarginValueToString(DraggingValue)
    else
      Result := Result + Preview.MarginValueToString(Value);
end;

function TdxPreviewMargin.GetDragging: Boolean;
begin
  Result := Assigned(Preview) and (Preview.DraggingMargin = Self);
end;

function TdxPreviewMargin.GetDraggingValue: Integer;
begin
  if FDraggingPos = NullDraggingPos then
    Result := -1
  else
    Result := ValueFromPos(FDraggingPos);
end;

function TdxPreviewMargin.GetMaxPos: Integer;
begin
  if IsForward then
    Result := PosFromValue(RealMaxValue)
  else
    Result := PosFromValue(RealMinValue);
end;

function TdxPreviewMargin.GetMinPos: Integer;
begin
  if IsForward then
    Result := PosFromValue(RealMinValue)
  else
    Result := PosFromValue(RealMaxValue);
end;

function TdxPreviewMargin.GetPageBounds: TRect;
begin
  if Assigned(Preview) then
    with Preview do
      if (SelPageIndex = -1) then
        if (PageCount > 0) then 
          Result := Pages[0].Bounds
        else
          Result := Rect(0, 0, 0, 0)
      else
        Result := Pages[SelPageIndex].Bounds
  else
    Result := Rect(0, 0, 0, 0);
end;

function TdxPreviewMargin.GetPreview: TCustomdxPreview;
begin
  if (FMargins <> nil) then
    Result := FMargins.FPreview
  else
    Result := nil;
end;

function TdxPreviewMargin.GetRealMaxValue: Integer;
begin
  if (Preview <> nil) and Preview.CanChangeMargins then
  begin
    with Preview do
      case FMarginType of
        pmLeft:
          Result := Max(RealMinValue, RealOriginalPageSize.X -
            (Margins[pmGutter].Value + MinUsefulSize.X + Margins[pmRight].Value));
        pmTop:
          Result := RealOriginalPageSize.Y - (MinUsefulSize.Y +
            MaxIntValue([Margins[pmBottom].Value, Margins[pmBottom].MinValue,
            MinFooterSize + Margins[pmFooter].MinValue]));
        pmRight:
          Result := Max(RealMinValue, RealOriginalPageSize.X -
            (Margins[pmGutter].Value + Margins[pmLeft].Value + MinUsefulSize.X));
        pmBottom:
          Result := RealOriginalPageSize.Y - (MinUsefulSize.Y +
            MaxIntValue([Margins[pmTop].Value, Margins[pmTop].MinValue,
            Margins[pmHeader].MinValue + MinHeaderSize]));
        pmGutter:
          Result := RealOriginalPageSize.X -
            (Margins[pmLeft].Value + MinUsefulSize.X + Margins[pmRight].Value);
        pmHeader:
          Result := RealOriginalPageSize.Y -
            (MinHeaderSize + MinUsefulSize.Y + Margins[pmBottom].Value);
      else  {pmFooter}
        Result := RealOriginalPageSize.Y -
           (Margins[pmTop].Value + MinUsefulSize.Y + MinFooterSize);
      end;
    if (FMaxValue <> -1) and (Result > FMaxValue) then  Result := FMaxValue;
  end
  else
    Result := FMaxValue;
  //  if Result < RealMinValue then Result := RealMinValue;  <- RealMaxValue is using in RealMinValue
end;

function TdxPreviewMargin.GetRealMinValue: Integer;
begin
  if (Preview <> nil) and Preview.CanChangeMargins then
  begin
    with Preview do
      case FMarginType of
        pmTop:
          Result := Min(Margins[pmHeader].Value + MinHeaderSize, RealMaxValue);
        pmBottom:
          Result := Min(Margins[pmFooter].Value + MinFooterSize, RealMaxValue);
      else
        Result := MinValue;
      end;
    if Result < MinValue then Result := MinValue;
  end
  else
    Result := MinValue;
end;

function TdxPreviewMargin.GetSelectableBounds: TRect;
begin
  Result := Bounds;
  if IsVertical then
    InflateRect(Result, dxPreviewMarginSelectDelta, 0)
  else
    InflateRect(Result, 0, dxPreviewMarginSelectDelta);
end;

function TdxPreviewMargin.GetVisibleValue: Integer;
begin
  Result := MulDiv(LoMetricToPixelsX(Value), Preview.ZoomFactor, 100);
end;

function TdxPreviewMargin.IsValueStored: Boolean;
begin
  Result := Value <> dxDefaultMarginValues[MarginType];
end;

procedure TdxPreviewMargin.SetDraggingPos(Value: Integer);
var
  DC, BitmapDC: hDC;
begin
  if Value <> NullDraggingPos then
  begin
    if Value < MinPos then Value := MinPos;
    if Value > MaxPos then Value := MaxPos;
  end;
  if FDraggingPos <> Value then
  begin
    DC := GetDC(Preview.Handle);
    BitmapDC := CreateCompatibleDC(DC);
    FScreenBitmap := SelectObject(BitmapDC, FScreenBitmap);
    if FDraggingPos <> NullDraggingPos then
      // restore screen image
      with PageBounds do
        if IsVertical then
          BitBlt(DC, FDraggingPos, Top, 1, Bottom - Top, BitmapDC, 0, 0, SRCCOPY)
        else
          BitBlt(DC, Left, FDraggingPos, Right - Left, 1, BitmapDC, 0, 0, SRCCOPY);
    FDraggingPos := Value;
    if FDraggingPos <> NullDraggingPos then
    begin
      Preview.ActivateHint(Self);
      // save screen image
      with PageBounds do
        if IsVertical then
          BitBlt(BitmapDC, 0, 0, 1, Bottom - Top, DC, FDraggingPos, Top, SRCCOPY)
        else
          BitBlt(BitmapDC, 0, 0, Right - Left, 1, DC, Left, FDraggingPos, SRCCOPY);
      Draw(DC);
    end;
    FScreenBitmap := SelectObject(BitmapDC, FScreenBitmap);
    DeleteDC(BitmapDC);
    ReleaseDC(Preview.Handle, DC);
    if FDraggingPos <> NullDraggingPos then Preview.DoDragMargin(Self);
  end
end;

procedure TdxPreviewMargin.SetMaxValue(Value: Integer);
begin
  if Value < -1 then Value := -1;
  if FMaxValue <> Value then
  begin
    FMaxValue := Value;
    if MaxValue <> -1 then
    begin
      if MaxValue < MinValue then MinValue := MaxValue;
      if FValue > MaxValue then Self.Value := MaxValue;
    end;
  end;
end;

procedure TdxPreviewMargin.SetMinValue(Value: Integer);
var
  MinV: Integer; 
begin
  if (Value < 0) then Value := 0;
  if FMinValue <> Value then
  begin
    if (Margins <> nil) and (Preview <> nil) and Preview.CanChangeMargins then
    begin
      case MarginType of
        pmLeft:
          MinV := Preview.RealOriginalPageSize.X - 
            (Margins[pmRight].Value + Preview.MinUsefulSize.X + Margins[pmGutter].Value);
        pmRight:
          MinV := Preview.RealOriginalPageSize.X - 
            (Margins[pmLeft].Value + Preview.MinUsefulSize.X + Margins[pmGutter].Value);
        pmTop:
          MinV := Preview.RealOriginalPageSize.Y - 
            (Margins[pmBottom].Value + Preview.MinUsefulSize.Y);
        pmBottom:
          MinV := Preview.RealOriginalPageSize.Y - 
            (Margins[pmTop].Value + Preview.MinUsefulSize.Y);
        pmGutter:
          MinV := Preview.RealOriginalPageSize.X - 
            (Margins[pmRight].Value + Preview.MinUsefulSize.X + Margins[pmLeft].Value);
        pmHeader:
          MinV := Preview.RealOriginalPageSize.Y - 
            (Margins[pmBottom].Value + Preview.MinUsefulSize.Y + Preview.MinHeaderSize);
        pmFooter:
          MinV := Preview.RealOriginalPageSize.Y - 
            (Margins[pmTop].Value + Preview.MinUsefulSize.Y + Preview.MinFooterSize);
      else MinV := 0;
      end;
      if (Value > MinV) then Value := MinV;
    end;
    FMinValue := Value;
    if (MaxValue <> -1) and (MinValue > MaxValue) then MaxValue := MinValue;
    if( FValue < MinValue) then Self.Value := MinValue;
  end;
end;

procedure TdxPreviewMargin.SetValue(Value: Integer);
//var
//  HardRefresh: Boolean;
begin
  Value := CheckValue(Value);
  if FValue <> Value then
  begin
    FValue := Value;
    if (Preview <> nil) and Preview.CanChangeMargins then
    begin
      with Preview do
      begin
        //HardRefresh := False;
        DoMarginChanged(Self);
        case FMarginType of
          pmHeader:
            if Margins[pmTop].Value - FValue < MinHeaderSize then
            begin
              //HardRefresh := True;
              Margins[pmTop].Value := FValue + MinHeaderSize;
            end;
          pmFooter:
            if Margins[pmBottom].Value - FValue < MinFooterSize then
            begin
              //HardRefresh := True;
              Margins[pmBottom].Value := FValue + MinFooterSize;
            end;
        end;
      end;
      Changed(True);
    end;
  end;
end;

procedure TdxPreviewMargin.SetEnabled(Value: Boolean);
begin
  if FEnabled <> Value then
  begin
    FEnabled := Value;
    Changed(False);
  end;
end;

procedure TdxPreviewMargin.SetVisible(Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    Changed(False);
  end;
end;

procedure TdxPreviewMargin.AfterDrag;
var
  DC: hDC;
begin
  Preview.DestroyHint;
  DeleteObject(FScreenBitmap);
  DC := GetDC(Preview.Handle);
  InvertMargin(DC);
  ReleaseDC(Preview.Handle, DC);
  Preview.DoAfterDragMargin(Self);
end;

procedure TdxPreviewMargin.BeforeDrag;
var
  DC: hDC;
begin
  Preview.DoBeforeDragMargin(Self);
  DC := GetDC(Preview.Handle);
  InvertMargin(DC);
  with PageBounds do
    if IsVertical then
      FScreenBitmap := CreateCompatibleBitmap(DC, 1, Bottom - Top)
    else
      FScreenBitmap := CreateCompatibleBitmap(DC, Right - Left, 1);
  ReleaseDC(Preview.Handle, DC);
  with Preview do
    if (pohShowOnDrag in OptionsHint) then
      CreateHint
    else
      DestroyHint;
end;

function TdxPreviewMargin.CheckValue(Value: Integer): Integer;
begin
  Result := Value;
  if Result < RealMinValue then Result := RealMinValue;
  if Result > RealMaxValue then Result := RealMaxValue;
end;

procedure TdxPreviewMargin.Draw(DC: hDC);
var
  R: TRect;
  Pen: HPEN;
begin
  R := Bounds;
  Pen := SelectObject(DC, Preview.FMarginPen);
  SetBkMode(DC, Windows.TRANSPARENT);
  with R do
    if IsVertical then
    begin
      MoveToEx(DC, Left, Top, nil);
      LineTo(DC, Left, Bottom);
    end
    else
    begin
      MoveToEx(DC, Left, Top, nil);
      LineTo(DC, Right, Top);
    end;
  SetBkMode(DC, Windows.OPAQUE);
  SelectObject(DC, Pen);
end;

procedure TdxPreviewMargin.Invalidate;
var
  R: TRect;
begin
  if Preview.HandleAllocated then
  begin
    R := Bounds;
    if IsVertical then
      Inc(R.Right)
    else
      Inc(R.Bottom);
    if Preview.HandleAllocated then InvalidateRect(Preview.Handle, @R, False);
  end;
end;

procedure TdxPreviewMargin.InvertMargin(DC: hDC);
begin
  with Bounds do
    BitBlt(DC, Left, Top,
      Right - Left + Byte(IsVertical), Bottom - Top + Byte(not IsVertical),
      0, 0, 0, DSTINVERT);
end;

function TdxPreviewMargin.IsForward: Boolean;
begin
  Result := FMarginType in [pmLeft, pmTop, pmGutter, pmHeader];
end;

function TdxPreviewMargin.IsVertical: Boolean;
begin
  Result := FMarginType in [pmLeft, pmRight, pmGutter];
end;

function TdxPreviewMargin.PosFromValue(Value: Integer): Integer;
begin
  if FMarginType = pmLeft then
    Inc(Value, Preview.Margins[pmGutter].Value);
  Result := MulDiv(LoMetricToPixelsX(Value), Preview.ZoomFactor, 100);
  with PageBounds do
    case FMarginType of
      pmLeft, pmGutter:
        Result := Left + Result;
      pmTop, pmHeader:
        Result := Top + Result;
      pmRight:
        Result := Right - 1 - Result;
      pmBottom, pmFooter:
        Result := Bottom - 1 - Result;
    end;
end;

function TdxPreviewMargin.ValueFromPos(Pos: Integer): Integer;
begin
  if Pos = MinPos then
    if IsForward then
      Result := RealMinValue
    else
      Result := RealMaxValue
  else if Pos = MaxPos then
    if IsForward then
      Result := RealMaxValue
    else
      Result := RealMinValue
  else if Pos = PosFromValue(FValue) then
    Result := FValue
  else
  begin
    with PageBounds do
      case FMarginType of
        pmLeft, pmGutter:
          Result := Pos - Left;
        pmTop, pmHeader:
          Result := Pos - Top;
        pmRight:
          Result := Right - 1 - Pos;
        pmBottom, pmFooter:
          Result := Bottom - 1 - Pos;
      else
        Result := 0;
      end;
    Result := PixelsToLoMetricX(MulDiv(Result, 100, Preview.ZoomFactor));
    if FMarginType = pmLeft then
      Dec(Result, Preview.Margins[pmGutter].Value);
    CheckValue(Result);
  end;
end;


{ TdxPreviewMargins }

constructor TdxPreviewMargins.Create(APreview: TCustomdxPreview);
var
  I: TdxPreviewMarginType;
begin
  inherited Create;
  FPreview := APreview;
  FList := TList.Create;
  for I := Low(TdxPreviewMarginType) to High(TdxPreviewMarginType) do Add;
end;

destructor TdxPreviewMargins.Destroy;
begin
  Clear;
  FList.Free;
  inherited Destroy;
end;

procedure TdxPreviewMargins.Assign(Source: TPersistent);
var
  I: TdxPreviewMarginType;
begin
  if not Assigned(Source) or (Source is TdxPreviewMargins) then
  begin
    Clear;
    if Assigned(Source) then 
      for I := Low(TdxPreviewMarginType) to High(TdxPreviewMarginType) do
        Add.Assign(TdxPreviewMargins(Source)[I]);
    Update(nil);
  end
  else
    inherited Assign(Source);
end;

function TdxPreviewMargins.Add: TdxPreviewMargin;
begin
  Result := TdxPreviewMargin.Create(Self);
  FList.Add(Result);
end;

procedure TdxPreviewMargins.Clear;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do
    TObject(FList.List^[I]).Free;
  FList.Clear;
end;

function TdxPreviewMargins.GetMarginByName(const Name: string): TdxPreviewMargin;
begin
  if (AnsiCompareText(Name, sdxLeftMargin) = 0) then
    Result := GetMargin(pmLeft)
  else if (AnsiCompareText(Name, sdxTopMargin) = 0) then
    Result := GetMargin(pmTop)
  else if (AnsiCompareText(Name, sdxRightMargin) = 0) then
    Result := GetMargin(pmRight)
  else if (AnsiCompareText(Name, sdxBottomMargin) = 0) then
    Result := GetMargin(pmBottom)
  else if (AnsiCompareText(Name, sdxGutterMargin) = 0) then
    Result := GetMargin(pmGutter)
  else if (AnsiCompareText(Name, sdxHeaderMargin) = 0) then
    Result := GetMargin(pmHeader)
  else if (AnsiCompareText(Name, sdxFooterMargin) = 0) then
    Result := GetMargin(pmFooter)
  else
    Result := nil;
end;

procedure TdxPreviewMargins.SetMarginByName(const Name: string; Value: TdxPreviewMargin);
begin
  if (AnsiCompareText(Name, sdxLeftMargin) = 0) then
    SetMargin(pmLeft, Value)
  else if (AnsiCompareText(Name, sdxTopMargin) = 0) then
    SetMargin(pmTop, Value)
  else if (AnsiCompareText(Name, sdxRightMargin) = 0) then
    SetMargin(pmRight, Value)
  else if (AnsiCompareText(Name, sdxBottomMargin) = 0) then
    SetMargin(pmBottom, Value)
  else if (AnsiCompareText(Name, sdxGutterMargin) = 0) then
    SetMargin(pmGutter, Value)
  else if (AnsiCompareText(Name, sdxHeaderMargin) = 0) then
    SetMargin(pmHeader, Value)
  else if (AnsiCompareText(Name, sdxFooterMargin) = 0) then
    SetMargin(pmFooter, Value);
end;

function TdxPreviewMargins.GetMargin(Index: TdxPreviewMarginType): TdxPreviewMargin;
begin
  Result := TdxPreviewMargin(FList[Integer(Index)]);
end;

procedure TdxPreviewMargins.SetMargin(Index: TdxPreviewMarginType; Value: TdxPreviewMargin);
begin
  Margins[Index].Assign(Value);
end;

procedure TdxPreviewMargins.ReadData(Stream: TStream);
var
  I: TdxPreviewMarginType;
begin
  for I := Low(TdxPreviewMarginType) to High(TdxPreviewMarginType) do
    Margins[I].ReadData(Stream);
end;

procedure TdxPreviewMargins.WriteData(Stream: TStream);
var
  I: TdxPreviewMarginType;
begin
  for I := Low(TdxPreviewMarginType) to High(TdxPreviewMarginType) do
    Margins[I].WriteData(Stream);
end;

procedure TdxPreviewMargins.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineBinaryProperty('Margins', ReadData, WriteData, True);
end;

procedure TdxPreviewMargins.Update(Item: TPersistent);
begin
  if Assigned(FPreview) and (FPreview.FUpdateCount = 0) then
    if Assigned(Item) then
      TdxPreviewMargin(Item).Invalidate
    else
      FPreview.Invalidate;
end;


{ TCustomdxPreview }

constructor TCustomdxPreview.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls, csCaptureMouse];
  Color := clBtnShadow;
  ParentColor := False;

  FOptionsBehavior := [pobAllowDragMargins, pobKeyNavigation, pobThumbTracking];
  FOptionsHint := [pohShowForMargins, pohShowOnDrag, pohShowOnScroll];
  FOptionsStore := [posZoom];
  FOptionsView := [povAutoHideScrollBars, povDefaultDrawPageBackground, povMargins, povPageSelection];
  FOptionsZoom := [pozZoomOnClick];
  
  FBorderStyle := bsSingle;
  FPageBackground := TdxPreviewPageBackground.Create;
  TdxPreviewPageBackground(FPageBackground).FPreview := Self;
  MarginColor := clWindowText;
  FIsTimerExpired := False;
  FScrollBars := ssBoth;

  ClearLastMousePos;
  FMargins := TdxPreviewMargins.Create(Self);

  FMaxZoomFactor := 500;
  FMinFooterSize := dxPreviewMinHeaderFooterSize;
  FMinHeaderSize := dxPreviewMinHeaderFooterSize;
  FMinUsefulSize := dxPreviewMinUsefulSize;
  FMinZoomFactor := 5;

  FOriginalPageSize := TdxPointWrapper.Create(0, 0);
  FOriginalPageSize.OnChanging := PageParametersChanging;
  FOriginalPageSize.OnChanged := PageParametersChanged;
  FOriginalPageSize.Point := A4_LOMETRIC;

  FLookAndFeel := plfStandard;
  FPages := TList.Create;
  FPageXCount := 1;
  FPageYCount := 1;
  FSelPageIndex := -1;
  FScrollBars := ssBoth;
{$IFDEF DELPHI4}
  FScrollBarStyle := ssRegular;
{$ENDIF}      
  FUnzoomedFactor := 50;
  ZoomFactor := 100;
  ZoomMode := pzmNone;
  FZoomStep := 10;
  Height := 460;
  Width := 320;

  if IsDesigning then
  begin
    PageCount := 1;
    SelPageIndex := 0;
  end;
  FPageStack := TList.Create;
end;

destructor TCustomdxPreview.Destroy;
begin
  if not IsDesigning and (pobStoreInRegistry in OptionsBehavior) and (RegistryPath <> '') then
  try
    SaveToRegistry(RegistryPath);
  except
  end;
{$IFNDEF DELPHI5}  
  Destroying;
{$ENDIF}  
  DestroyPageNumberHint;
  DestroyHint;
  if FMarginDesigner <> nil then FMarginDesigner.Free;
  if FMarginPen <> 0 then DeleteObject(FMarginPen);
  FPageStack.Free;
  OriginalPageSize.Free;
  FPageBackground.Free;
  PageCount := 0;
  FPages.Free;
  FMargins.Free;
  inherited Destroy;
end;

procedure TCustomdxPreview.Loaded;
begin
  inherited;
  DoCalcPageCount;
  if not IsDesigning and (pobStoreInRegistry in OptionsBehavior) and (RegistryPath <> '') then
    LoadFromRegistry(RegistryPath);
end;


procedure TCustomdxPreview.DesignerModified;
var
  Designer: {$IFNDEF DELPHI4}TDesigner {$ELSE}IDesignerNotify {$ENDIF};
begin
  if IsDesigning then
  begin
    Designer := GetParentForm(Self).Designer;
    if Designer <> nil then Designer.Modified;
  end;
end;

function TCustomdxPreview.IsDesigning: Boolean; 
begin
  Result := csDesigning in ComponentState;
end;

procedure TCustomdxPreview.WndProc(var message: TMessage);
begin
  if (message.Msg = WM_MOUSEMOVE) and (DraggingMargin <> nil) then
    inherited WndProc(message)
  else  
    if not IsDesigning and 
      ((message.Msg = WM_LBUTTONDOWN) or (message.Msg = WM_LBUTTONDBLCLK)) and 
      not Dragging and (DragMode = dmAutomatic) and 
      (not IsControlMouseMsg(TWMMouse(message)) and 
      (not (pozZoomOnClick in OptionsZoom) or (PageIndexFromPoint(SmallPointToPoint(TWMMouse(message).Pos)) = -1))) then
    begin
      ControlState := ControlState + [csLButtonDown];
      Dispatch(Message);
    end
    else
      inherited WndProc(Message);
end;

const  // not localize;
  sdxOptionsBehavior = 'OptionsBehavior';
  sdxOptionsHint = 'OptionHint';
  sdxOptionsView = 'OptionView';
  sdxOptionsZoom = 'OptionZoom';
  sdxZoomFactor = 'ZoomFactor';
  sdxZoomStep = 'ZoomStep';
  sdxZoomMode = 'ZoomMode';
  sdxPageXCount = 'PageXCount';
  sdxPageYCount = 'PageYCount';  
  sdxMarginColor = 'MarginColor';
  sdxMeasurementUnits = 'MeasurementUnits';
  sdxOrientation = 'Orientation';

procedure TCustomdxPreview.SaveToRegistry(const ARegistryPath: string);
begin
  with TRegistry.Create do 
  try
    if OpenKey(ARegistryPath, True) then 
    try
      WriteInteger(sdxOptionsHint, Integer(Byte(OptionsHint)));
      WriteInteger(sdxOptionsView, Integer(Byte(OptionsView)));
      WriteInteger(sdxOptionsZoom, Integer(Byte(OptionsZoom)));
      WriteInteger(sdxZoomStep, ZoomStep);
      WriteInteger(sdxMarginColor, Integer(MarginColor));
      WriteInteger(sdxMeasurementUnits, Integer(MeasurementUnits));
      WriteInteger(sdxOrientation, Integer(Orientation));
      if posZoom in OptionsStore then 
      begin
        WriteInteger(sdxZoomFactor, ZoomFactor);
        WriteInteger(sdxZoomMode, Integer(ZoomMode));
        if ZoomMode = pzmPages then 
        begin
          WriteInteger(sdxPageXCount, PageXCount);
          WriteInteger(sdxPageYCount, PageYCount);          
        end;
      end;
    except  
      on ERegistryException do 
      else
        raise;
    end;  
  finally
    Free;
  end;
end;

procedure TCustomdxPreview.LoadFromRegistry(const ARegistryPath: string);
begin
  with TRegistry.Create do 
  try
    if OpenKey(ARegistryPath, True) then 
    try
      if ValueExists(sdxOptionsHint) then
        OptionsHint := TdxPreviewOptionsHint(Byte(ReadInteger(sdxOptionsHint)));
      if ValueExists(sdxOptionsView) then
        OptionsView := TdxPreviewOptionsView(Byte(ReadInteger(sdxOptionsView)));
      if ValueExists(sdxOptionsZoom) then
        OptionsZoom := TdxPreviewOptionsZoom(Byte(ReadInteger(sdxOptionsZoom)));
      if ValueExists(sdxZoomStep) then
        ZoomStep := ReadInteger(sdxZoomStep);
      if ValueExists(sdxMarginColor) then
        MarginColor := TColor(ReadInteger(sdxMarginColor));
      if ValueExists(sdxMeasurementUnits) then
        MeasurementUnits := TdxPreviewMeasurementUnits(ReadInteger(sdxMeasurementUnits));
      if ValueExists(sdxOrientation) then
        Orientation := TdxPreviewPaperOrientation(ReadInteger(sdxOrientation));
      if posZoom in OptionsStore then 
      begin
        if ValueExists(sdxZoomFactor) then
          ZoomFactor := ReadInteger(sdxZoomFactor);
        if ValueExists(sdxZoomMode) then
          ZoomMode := TdxPreviewZoomMode(ReadInteger(sdxZoomMode));
        if ZoomMode = pzmPages then 
        begin 
          if ValueExists(sdxPageXCount) then
            PageXCount := ReadInteger(sdxPageXCount);
          if ValueExists(sdxPageYCount) then
            PageYCount := ReadInteger(sdxPageYCount);
        end;    
      end;  
    except    
      on ERegistryException do 
      else
        raise;
    end;  
  finally
    Free;
  end;
end;

function TCustomdxPreview.GetAllRowCount: Integer;
begin
  Result := ColCount;
  Result := PageCount div Result + Byte(PageCount mod Result > 0);
end;

function TCustomdxPreview.GetColCount: Integer;
begin
  if FZoomMode = pzmPageWidth then
    Result := 1
  else
  begin
    if FZoomMode = pzmNone then
      Result := (ClientWidth - Indent) div (VisiblePageSize.X + Indent)
    else
      Result := 
        (MulDiv(ClientWidth, 100, FZoomFactor) - dxPreviewIndent) div (PageSize.X + dxPreviewIndent);
    if Result > PageCount then Result := PageCount;
    if Result < 1 then Result := 1;
    if (FZoomMode = pzmPages) and (Result > FPageXCount) then
      Result := FPageXCount;
  end;
end;

procedure TCustomdxPreview.SetLookAndFeel(Value: TdxPreviewLookAndFeel);
begin
  if LookAndFeel <> Value then 
  begin
    FLookAndFeel := Value;
  {$IFDEF DELPHI4}
    ScrollBarStyle := dxScrollBarStyles[Value];
    AdjustBkColor;  
  {$ENDIF}
    RecreateWnd;
  end;
end;

procedure TCustomdxPreview.SetOptionsBehavior(Value: TdxPreviewOptionsBehavior);
var
  What: TdxPreviewOptionsBehavior;
  I: TdxPreviewMarginType;  
begin
  What := FOptionsBehavior + Value - FOptionsBehavior * Value;
  if What <> [] then 
  begin
    FOptionsBehavior := Value;
    if pobAllowDragMargins in What then
      for I := Low(I) to High(I) do
        Margins[I].Enabled := pobAllowDragMargins in Value;
  end;
end;

procedure TCustomdxPreview.SetOptionsHint(Value: TdxPreviewOptionsHint);
var
  What: TdxPreviewOptionsHint;
begin
  What := FOptionsHint + Value - FOptionsHint * Value;
  if What <> [] then 
    FOptionsHint := Value;
end;

procedure TCustomdxPreview.SetOptionsStore(Value: TdxPreviewOptionsStore);
var
  What: TdxPreviewOptionsStore;
begin
  What := FOptionsStore + Value - FOptionsStore * Value;
  if What <> [] then 
    FOptionsStore := Value;
end;

procedure TCustomdxPreview.SetOptionsView(Value: TdxPreviewOptionsView);
var 
  What: TdxPreviewOptionsView;
  I: TdxPreviewMarginType;
begin
  What := FOptionsView + Value - FOptionsView * Value;
  if What <> [] then 
  begin
    FOptionsView := Value;
    if HandleAllocated then 
      if [povDefaultDrawPageBackground, povPageSelection] * What <> [] then     
        InvalidatePages
      else 
        if povAutoHideScrollBars in What then 
          RecreateWnd;
    if povMargins in What then 
      for I := Low(I) to High(I) do
        Margins[I].Visible := povMargins in Value;
  end;
end;

procedure TCustomdxPreview.SetOptionsZoom(Value: TdxPreviewOptionsZoom);
var 
  What: TdxPreviewOptionsZoom;
begin
  What := FOptionsZoom + Value - FOptionsZoom * Value;
  if What <> [] then 
    FOptionsZoom := Value;
end;

procedure TCustomdxPreview.SetMarginColor(Value: TColor);
begin
  if FMarginColor <> Value then 
  begin
    FMarginColor := Value;
    RecreateMarginPen;
    if HandleAllocated then InvalidateMargins;
  end;
end;

procedure TCustomdxPreview.RecreateMarginPen;
begin
  if (FMarginPen <> 0) then DeleteObject(FMarginPen);
  FMarginPen := CreatePen(PS_DOT, 1, ColorToRGB(FMarginColor));  
end;

procedure TCustomdxPreview.SetBorderStyle(Value: TBorderStyle);
begin
  if (FBorderStyle <> Value) then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

function TCustomdxPreview.GetPage(index: Integer): TdxPreviewPage;
begin
  Result := TdxPreviewPage(FPages[index]);
end;

function TCustomdxPreview.GetPageCount: Integer;
begin
  Result := FPages.Count;
end;

function TCustomdxPreview.GetSelPageRow: Integer;
begin
  Result := SelPageIndex div ColCount;
end;

function TCustomdxPreview.GetSelPageCol: Integer;
begin
  Result := SelPageIndex - SelPageRow * ColCount;
end;

function TCustomdxPreview.GetRowCount: Integer;
begin
  if FZoomMode = pzmPageWidth then
    Result := 1
  else
  begin
    Result := (MulDiv(ClientHeight, 100, FZoomFactor) - dxPreviewIndent) div
      (PageSize.Y + dxPreviewIndent);
    if Result < 1 then Result := 1;
    if (FZoomMode = pzmPages) and (Result > FPageYCount) then
      Result := FPageYCount;
  end;
end;

function TCustomdxPreview.GetVirtualHeight: Integer;
begin
  {  Result := MulDiv(dxPreviewIndent + AllRowCount * (PageSize.Y + dxPreviewIndent),
    FZoomFactor, 100);}
  Result := Indent + AllRowCount * (VisiblePageSize.Y + Indent);
end;

function TCustomdxPreview.GetVirtualWidth: Integer;
begin
  if (PageCount = 0) or (ZoomMode = pzmPageWidth) then
    Result := ClientWidth
  else
    Result := Indent + ColCount * (VisiblePageSize.X + Indent);    
end;

procedure TCustomdxPreview.SetMinFooterSize(Value: Integer);
begin
  if Value < 0 then 
    Value := 0;
  if FMinFooterSize <> Value then
  begin
    Value := Min(Value, RealOriginalPageSize.Y - MinUsefulSize.Y - MinHeaderSize -
      Margins[pmFooter].Value - Margins[pmHeader].Value);
    FMinFooterSize := Value;
    Margins[pmBottom].Value := Max(Margins[pmBottom].Value, Margins[pmFooter].Value + Value);
  end;
end;

procedure TCustomdxPreview.SetMinHeaderSize(Value: Integer);
begin
  if Value < 0 then 
    Value := 0;
  if FMinHeaderSize <> Value then
  begin
    Value := Min(Value, RealOriginalPageSize.Y - MinUsefulSize.Y - MinFooterSize -
      Margins[pmFooter].Value - Margins[pmHeader].Value);
    FMinHeaderSize := Value;
    Margins[pmTop].Value := Max(Margins[pmTop].Value, Margins[pmHeader].Value + Value);
  end;
end;

procedure TCustomdxPreview.SetMinUsefulSize(const Value: TPoint);
begin
  FMinUsefulSize.X := MinMax(Value.X, 0, 
    RealOriginalPageSize.X - Margins[pmLeft].Value - Margins[pmGutter].Value - Margins[pmRight].Value);
  FMinUsefulSize.Y := MinMax(Value.Y, 0,
    RealOriginalPageSize.Y - Margins[pmTop].Value - Margins[pmBottom].Value);
end;

function TCustomdxPreview.GetVisiblePageSize: TPoint;
begin
  Result.X := MulDiv(FPageSize.X, FZoomFactor, 100);
  Result.Y := MulDiv(FPageSize.Y, FZoomFactor, 100);
end;

procedure TCustomdxPreview.SetMargins(Value: TdxPreviewMargins);
begin
  FMargins.Assign(Value);
  if FUpdateCount = 0 then Invalidate;
end;

procedure TCustomdxPreview.SetLeftPos(Value: Integer);
begin
  Value := CheckLeftPos(Value);
  if FLeftPos <> Value then
  begin
    if not FZooming then
      ScrollWindowEx(Handle, FLeftPos - Value, 0, nil, nil, 0, nil, SW_INVALIDATE);
    FLeftPos := Value;
    if HandleAllocated then UpdateScrollBars;
  end;
end;

procedure TCustomdxPreview.SetMaxZoomFactor(Value: Integer);
begin
  if Value < FMinZoomFactor then 
    Value := FMinZoomFactor;
  if FMaxZoomFactor <> Value then
  begin
    FMaxZoomFactor := Value;
    if ZoomFactor > FMaxZoomFactor then 
      ZoomFactor := FMaxZoomFactor;
  end;
end;

procedure TCustomdxPreview.SetMinZoomFactor(Value: Integer);
begin
  if Value < dxPreviewMinZoomFactor then 
    Value := dxPreviewMinZoomFactor;
  if Value > FMaxZoomFactor then 
    Value := FMaxZoomFactor;
  if FMinZoomFactor <> Value then
  begin
    FMinZoomFactor := Value;
    if ZoomFactor < FMinZoomFactor then 
      ZoomFactor := FMinZoomFactor;
  end;
end;

procedure TCustomdxPreview.SetOnCalcPageCount(Value: TNotifyEvent);
begin
  FOnCalcPageCount := Value;
  if Assigned(FOnCalcPageCount) and ([csReading, csLoading] * ComponentState = []) then
  begin
    DoCalcPageCount;
    if HandleAllocated then Invalidate;
  end;
end;

procedure TCustomdxPreview.SetOrientation(Value: TdxPreviewPaperOrientation);
begin
  if FOrientation <> Value then
  begin
    FOrientation := Value;
    AdjustOrientation;
  end;
end;

{$IFDEF DELPHI4}
function TCustomdxPreview.GetUltraFlatBkColor: TColor;
begin
  Result := ColorToRGB(clBtnShadow);
  with TRGBQuad(Result) do 
  begin
    Inc(rgbRed, (255 - rgbRed) div 4);
    Inc(rgbGreen, (255 - rgbGreen) div 4);
    Inc(rgbBlue, (255 - rgbBlue) div 4);
  end;
end;
{$ENDIF}

{$IFDEF DELPHI4}
procedure TCustomdxPreview.AdjustBkColor; 
begin
  case LookAndFeel of  
    plfStandard, plfFlat:
      if Color = GetUltraFlatBkColor then 
        Color := clBtnShadow;
    plfUltraFlat: 
      if Color = clBtnShadow then 
        Color := GetUltraFlatBkColor;
  end;                        
end;
{$ENDIF}  
  
procedure TCustomdxPreview.AdjustOrientation;
var
  Temp, Temp1: Integer;
begin
  BeginUpdate;
  try
    if FOrientation = ppoLandscape then
    begin
      Temp := Margins[pmLeft].Value;
      Margins[pmLeft].Value := Margins[pmBottom].Value;
      Temp1 := Margins[pmTop].Value;
      Margins[pmTop].Value := Temp;
      Temp := Margins[pmRight].Value;
      Margins[pmRight].Value := Temp1;
      Margins[pmBottom].Value := Temp;
    end
    else
    begin
      Temp := Margins[pmBottom].Value;
      Margins[pmBottom].Value := Margins[pmLeft].Value;
      Temp1 := Margins[pmRight].Value;
      Margins[pmRight].Value := Temp;
      Temp := Margins[pmTop].Value;
      Margins[pmTop].Value := Temp1;
      Margins[pmLeft].Value := Temp;
    end;
    PageParametersChanged(FOriginalPageSize, [pcX, pcY]);
    CheckMargins;
  finally
    EndUpdate;
    CheckZoomFactor;
  end;
end;

procedure TCustomdxPreview.PageParametersChanging(Sender: TObject;
  Coords: TdxPointCoords; var Values: array of Integer);
begin
  if (pcX in Coords) and (PPoint(@Values)^.X < MinUsefulSize.X) then
    PPoint(@Values)^.X := MinUsefulSize.X;
  if (pcY in Coords) and (PPoint(@Values)^.Y < MinUsefulSize.Y) then
    PPoint(@Values)^.Y := MinUsefulSize.Y;
end;

procedure TCustomdxPreview.PageParametersChanged(Sender: TObject; Coords: TdxPointCoords);
var
  Temp: Integer;
begin
  FRealOriginalPageSize := OriginalPageSize.Point;
  if FOrientation = ppoLandscape then
    with RealOriginalPageSize do
    begin
      Temp := Y;
      Y := X;
      X := Temp;
    end;
  FPageSize := LoMetricToPixels(FRealOriginalPageSize);
  CheckMargins;
  CheckZoomFactor;
end;

procedure TCustomdxPreview.SetOriginalPageSize(Value: TdxPointWrapper);
begin
  if Value <> nil then OriginalPageSize.Assign(Value);
end;

procedure TCustomdxPreview.SetPageBackground(Value: TdxBackground);
begin
  FPageBackground.Assign(Value);
end;

procedure TCustomdxPreview.AddPage;
begin
  FPages.Add(TdxPreviewPage.Create(Self));
end;
  
procedure TCustomdxPreview.SetPageCount(Value: Integer);
var
  I: Integer;
begin
  if Value < 0 then Value := 0;
  if PageCount <> Value then
  begin
    if Value < PageCount then
    begin
      for I := Value to FPages.Count - 1 do
        TdxPreviewPage(FPages[I]).Free;
      FPages.Count := Value;
    end
    else
      for I := PageCount to Value - 1 do
        AddPage;
    // check SelPageIndex
    if not (csDestroying in ComponentState) then 
    begin
      ResyncSelPageIndex;
      CheckZoomFactor;
    end;
  end;
end;

procedure TCustomdxPreview.ResyncSelPageIndex;
var
  Value: Integer;
begin
  Value := SelPageIndex;
  while (Value > -1) and not CanSelectPage(Value) do Dec(Value);
  if Value = -1 then  
  begin
    Value := 0;
    while (Value < PageCount) and not CanSelectPage(Value) do Inc(Value);
  end;
  if Value = PageCount then Value := -1;
  SelPageIndex := Value;
end;

procedure TCustomdxPreview.SetPageXCount(Value: Integer);
begin
  if Value < 1 then Value := 1;
  if FPageXCount <> Value then
  begin
    FPageXCount := Value;
    ZoomMode := pzmPages;
    CheckZoomFactor;
  end;
end;

procedure TCustomdxPreview.SetPageYCount(Value: Integer);
begin
  if Value < 1 then Value := 1;
  if FPageYCount <> Value then
  begin
    FPageYCount := Value;
    ZoomMode := pzmPages;
    CheckZoomFactor;
  end;
end;

procedure TCustomdxPreview.DoSelectedPageChanging;
begin
  if Assigned(FOnSelectedPageChanging) then 
    FOnSelectedPageChanging(Self, FSelPageIndex);
end;

procedure TCustomdxPreview.DoSelectedPageChanged;
begin
  if Assigned(FOnSelectedPageChanged) then 
    FOnSelectedPageChanged(Self, FSelPageIndex);
end;

procedure TCustomdxPreview.SetSelPageIndex(Value: Integer);
begin
  if Value < -1 then Value := -1;
  if Value > PageCount - 1 then Value := PageCount - 1;
  if FSelPageIndex <> Value then
    if (Value = -1) or CanSelectPage(Value) then 
    begin
      DoSelectedPageChanging;
      if (FSelPageIndex < GetPageCount) then
      begin
        if (FSelPageIndex <> -1) then
        begin
          InvalidatePageBorder(FSelPageIndex);
          InvalidateMargins;
        end;
      end;
      FSelPageIndex := Value;
      if (FSelPageIndex <> -1) then
      begin
        InvalidatePageBorder(FSelPageIndex);
        InvalidateMargins;
        MakeVisible(FSelPageIndex);
      end;
      DoSelectedPageChanged;
    end;
end;

procedure TCustomdxPreview.SetTopPos(Value: Integer);
begin
  Value := CheckTopPos(Value);
  if FTopPos <> Value then
  begin
    if not FZooming then   
      ScrollWindowEx(Handle, 0, FTopPos - Value, nil, nil, 0, nil, SW_INVALIDATE);
    FTopPos := Value;
    if HandleAllocated then UpdateScrollBars;
  end;
end;

procedure TCustomdxPreview.SetZoomed(Value: Boolean);
begin
  FZoomedFixed := True;
  if not FZoomed and Value then
  begin
    FZoomed := True;
    FUnzoomedFactor := ZoomFactor;
    FUnzoomedMode := ZoomMode;
    ZoomFactor := 100;
  end
  else if FZoomed then
    if ZoomFactor = 100 then
    begin
      FZoomed := False;
      ZoomMode := FUnzoomedMode;
      ZoomFactor := FUnzoomedFactor;
    end
    else
      ZoomFactor := 100;
  FZoomedFixed := False;
  UpdateWindow(Handle);
end;

procedure TCustomdxPreview.SetZoomStep(Value: Integer);
begin
  if (Value < 1) then Value := 1;
  if (FZoomStep <> Value) then FZoomStep := Value;
end;

procedure TCustomdxPreview.ZoomIn;
begin
  ZoomFactor := ZoomFactor + FZoomStep;
end;

procedure TCustomdxPreview.ZoomOut;
begin
  ZoomFactor := ZoomFactor - FZoomStep;
end;

procedure TCustomdxPreview.SetZoomFactor(Value: Integer);
begin
  if Value < FMinZoomFactor then Value := FMinZoomFactor;
  if Value > FMaxZoomFactor then Value := FMaxZoomFactor;
  if FZoomFactor <> Value then
  begin
    FZoomFactor := Value;
    if not FZoomModeFixed then FZoomMode := pzmNone;
    if not FZoomedFixed then FZoomed := FZoomFactor >= 100;
    //    FIndent := dxPreviewIndent1 + MulDiv(dxPreviewIndent2, FZoomFactor, 100);
    FIndent := dxPreviewIndent1 + dxPreviewIndent2 * FZoomFactor div 100;
    if FZoomMode = pzmNone then
    begin
      FZooming := True;
      try
        CheckZoomFactor;
      finally
        FZooming := False;
      end;  
    end
    else 
      if (FUpdateCount = 0) then Invalidate;
    DoZoomFactorChanged;
  end;
end;

procedure TCustomdxPreview.SetZoomMode(Value: TdxPreviewZoomMode);
begin
  if FZoomMode <> Value then
  begin
    FZoomMode := Value;
    CheckZoomFactor;
    DoZoomModeChanged;
  end;
end;

procedure TCustomdxPreview.CreateHint;
begin
  if FHintWindow = nil then
    FHintWindow := TdxPreviewHintWindow.Create(nil);
end;
                                      
procedure TCustomdxPreview.DestroyHint;
begin
  if FHintWindow <> nil then
  begin
    FHintWindow.Free;
    FHintWindow := nil;
  end;
end;

procedure TCustomdxPreview.ActivateHint(Margin: TdxPreviewMargin);
var
  P: TPoint;
begin
  if FHintWindow = nil then Exit;
  GetCursorPos(P);
  Windows.ScreenToClient(Handle, P);
  with Margin do
  begin
    if IsVertical then
      if Dragging then
        P.X := DraggingPos
      else
        P.X := Bounds.Left
    else if Dragging then
      P.Y := DraggingPos
    else
      P.Y := Bounds.Top;
    Windows.ClientToScreen(Handle, P);
    TdxPreviewHintWindow(FHintWindow).ActivateHint(P, DisplayText, Margin);
  end;
end;

procedure dxPreviewHideHintTimerProc(Wnd: hWnd; Msg: UINT; idEvent: UINT; Time: DWORD); stdcall;
var
  Preview: TCustomdxPreview;
begin
  Preview := TCustomdxPreview(FindControl(Wnd));
  if not GetParentForm(Preview).Active or (Time - FLongShowHintTime > dxPreviewLongHideHintTime) then
  begin
    Preview.DestroyHint;
    Preview.DestroyHideHintTimer;
  end;
end;

procedure dxPreviewShowHintTimerProc(Wnd: hWnd; Msg: UINT; idEvent: UINT; Time: DWORD); stdcall;
var
  Pt: TPoint;
  AMargin: TdxPreviewMargin;
begin
  with TCustomdxPreview(FindControl(Wnd)) do
  begin
    DestroyShowHintTimer;
    GetCursorPos(Pt);
    MapWindowPoints(0, Wnd, Pt, 1);
    AMargin := MarginFromPoint(Pt);
    if (AMargin <> nil) and (not AMargin.Dragging or (pohShowOnDrag in OptionsHint)) then
    begin
      CreateHint;
      ActivateHint(AMargin);
      FLongShowHintTime := GetTickCount;
      FHideHintTimer := 
        SetTimer(Wnd, dxHideHintTimerID, dxPreviewHideHintTime, @dxPreviewHideHintTimerProc);
    end;
  end;
end;

procedure TCustomdxPreview.StartHintTimer;
begin
  FShowHintTimer := 
    SetTimer(Handle, dxShowHintTimerID, dxPreviewShowHintTime, @dxPreviewShowHintTimerProc);
end;

procedure TCustomdxPreview.DestroyShowHintTimer;
begin
  if (FShowHintTimer <> 0) then
  begin
    KillTimer(Handle, dxShowHintTimerID);
    FShowHintTimer := 0;
  end
  else
    DestroyHint;
end;

procedure TCustomdxPreview.DestroyHideHintTimer;
begin
  if (FHideHintTimer <> 0) then
  begin
    KillTimer(Handle, dxHideHintTimerID);
    FHideHintTimer := 0;
  end;
end;

procedure TCustomdxPreview.HideAllHints;
begin
  DestroyShowHintTimer;
  DestroyHideHintTimer;
end;

procedure TCustomdxPreview.ClearLastMousePos;
begin
  FLastMousePos := Point(Maxint, Maxint);
end;

procedure TCustomdxPreview.CMDesignHitTest(var message: TCMDesignHitTest);
var
  HitInfo: TdxPreviewHitTests;
begin
  HitInfo := GetHitInfoAt(message.XPos, message.YPos);
  message.Result := Integer((DraggingMargin <> nil) or (HitInfo * phtMargins <> []));
end;

procedure TCustomdxPreview.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  if (MarginColor and $80000000 = $80000000) then 
  begin
    RecreateMarginPen;
    InvalidateMargins;
  end;  
end;

procedure TCustomdxPreview.CMCtl3DChanged(var Message: TMessage);
begin
  inherited;
  if (FBorderStyle = bsSingle) and (LookAndFeel = plfStandard) then 
    RecreateWnd;
end;

procedure TCustomdxPreview.CMHintShow(var message: TCMHintShow);
begin
  inherited;
  message.Result := Integer((PageIndexFromPoint(message.HintInfo^.CursorPos) > -1) and 
    (DraggingMargin <> nil));
end;

procedure TCustomdxPreview.WMCaptureChanged(var message: TMessage);
begin
  CancelDragMargin;
  DestroyPageNumberHint;
  inherited;
end;

procedure TCustomdxPreview.WMGetDlgCode(var message: TMessage);
const 
  Arrows: array[Boolean] of LongInt = (0, DLGC_WANTARROWS);
  AllKeys: array[Boolean] of LongInt = (0, DLGC_WANTALLKEYS);
begin
  inherited;
  message.Result := message.Result or 
    AllKeys[DraggingMargin <> nil] or Arrows[pobKeyNavigation in OptionsBehavior];
end;

procedure TCustomdxPreview.WMEraseBkgnd(var message: TWMEraseBkgnd);
begin
  message.Result := 1;
end;

procedure TCustomdxPreview.WMHScroll(var message: TWMHScroll);
begin
  inherited;
  case message.ScrollCode of
    SB_LINEUP:
      LeftPos := LeftPos - dxPreviewScrollStep;
    SB_LINEDOWN:
      LeftPos := LeftPos + dxPreviewScrollStep;
    SB_PAGEUP:
      LeftPos := LeftPos - ClientWidth;
    SB_PAGEDOWN:
      LeftPos := LeftPos + ClientWidth;
    SB_THUMBTRACK:
      if (pobThumbTracking in OptionsBehavior) then LeftPos := message.Pos;
    SB_THUMBPOSITION:
      if not (pobThumbTracking in OptionsBehavior) then
      begin
        LeftPos := message.Pos;
        UpdateWindow(Handle);
      end;
  end;
end;

procedure TCustomdxPreview.WMKillFocus(var message: TWMKillFocus);
begin
  ClearLastMousePos;
  HideAllHints;
  inherited;
end;

procedure TCustomdxPreview.WMRButtonUp(var message: TMessage);
begin
  if ((PopupMenu <> nil) and PopupMenu.AutoPopup) or IsDesigning then
    HideAllHints;
  inherited;
end;

procedure TCustomdxPreview.CMCancelMode(var message: TCMCancelMode);
begin
  HideAllHints;
  inherited;
end;

procedure TCustomdxPreview.WMLButtonDblClk(var message: TWMLButtonDblClk);
var
  AMargin: TdxPreviewMargin;
begin
  if IsDesigning and Assigned(MarginDesigner) then
  begin
    AMargin := MarginFromPoint(SmallPointToPoint(message.Pos));
    if Assigned(AMargin) then MarginDesigner.ActivateEx(AMargin);
  end;
  inherited;
end;

procedure TCustomdxPreview.WMMouseActivate(var message: TWMMouseActivate);
var
  Pt: TPoint;
  Control: TWinControl;
begin
  inherited;
  if not IsDesigning then
  begin
    Control := FindControl(GetFocus);
    if (Control = nil) or (GetParentForm(Control) <> GetParentForm(Self)) then
    begin
      GetCursorPos(Pt);
      if (PageIndexFromPoint(ScreenToClient(Pt)) > -1) {and not Assigned(MarginFromPoint(APt)) } then
        message.Result := MA_ACTIVATEANDEAT;
    end;
    if Enabled then SetFocus;
  end;
end;

procedure TCustomdxPreview.WMNCDestroy(var message: TMessage);
begin
  HideAllHints;
  inherited;
end;

procedure TCustomdxPreview.WMNCHitTest(var message: TWMNCHitTest);
begin
  DefaultHandler(message);
end;

procedure TCustomdxPreview.WMNCCalcSize(var message: TWMNCCalcSize);
begin
  inherited;
  if (LookAndFeel <> plfStandard) and (BorderStyle <> bsNone) then
    InflateRect(message.CalcSize_Params^.rgrc[0], -1, -1);
end;

procedure TCustomdxPreview.WMNCPaint(var message: TWMNCPaint);
const 
  Flat: array[Boolean] of UINT = (0, BF_FLAT);
var
  DC: hDC;
  R: TRect;
  AStyle: DWORD;
begin
  inherited;
  if (LookAndFeel <> plfStandard) and (BorderStyle <> bsNone) then
  begin
    GetWindowRect(Handle, R);
    OffsetRect(R, -R.Left, -R.Top);
    DC := GetWindowDC(Handle);
    DrawEdge(DC, R, BDR_SUNKENOUTER, BF_RECT or Flat[LookAndFeel = plfUltraFlat]);
    AStyle := GetWindowLong(Handle, GWL_STYLE);
    if (AStyle and WS_HSCROLL <> 0) and (AStyle and WS_VSCROLL <> 0) then
    begin
      InflateRect(R, -1, -1);
      with R do
        R := Rect(Right - GetSystemMetrics(SM_CXVSCROLL), 
          Bottom - GetSystemMetrics(SM_CYHSCROLL), Right, Bottom);
      FillRect(DC, R, HBRUSH(COLOR_BTNFACE + 1));
    end;
    ReleaseDC(Handle, DC)
  end;
end;

procedure TCustomdxPreview.WMMouseWheel(var Message: TWMMouse);

  function ProcessAsZoom: Boolean;
  begin
    Result := (pozZoomOnMouseRoll in OptionsZoom) or (GetKeyState(VK_CONTROL) < 0);
  end;
  
begin
  inherited;
  if DraggingMargin <> nil then
    Perform(WM_LBUTTONUP, message.Keys, TMessage(message).lParam);
  HideAllHints;
{$IFOPT R+}{$R-}{$DEFINE SAVERANGECHECK}{$ENDIF}
  if SmallInt(HIWORD(Message.Keys)) > 0 then
  begin
    if ProcessAsZoom then 
      ZoomIn
    else 
      if CanVertScrolling then 
        SendMessage(Handle, WM_VSCROLL, SB_LINEUP, 0);
  end
  else 
    if ProcessAsZoom then
      ZoomOut
    else 
      if CanVertScrolling then 
        SendMessage(Handle, WM_VSCROLL, SB_LINEDOWN, 0);
{$IFDEF SAVERANGECHECK}{$R+}{$UNDEF SAVERANGECHECK}{$ENDIF}
end;

procedure TCustomdxPreview.WMSetCursor(var Message: TWMSetCursor);
var
  ACursor: HCURSOR;
  AMargin: TdxPreviewMargin;
  AHitInfo: TdxPreviewHitTests;
  Pt: TPoint;
begin
  ACursor := 0;
  if message.HitTest = HTCLIENT then
  begin
    AMargin := DraggingMargin;
    if (AMargin = nil) and GetParentForm(Self).Active then
    begin
      GetCursorPos(Pt);
      Pt := ScreenToClient(Pt);
      AHitInfo := GetHitInfoAt(Pt.X, Pt.Y);
      if (phtPage in AHitInfo) then
        if (phtMargins * AHitInfo <> []) then
        begin
          AMargin := MarginFromPoint(Pt);
          if AMargin.Enabled then
            if AMargin.IsVertical then
              ACursor := Screen.Cursors[crdxPreviewHorzResize]
            else
              ACursor := Screen.Cursors[crdxPreviewVertResize];
        end
        else 
          if not IsDesigning then
            if (PageIndexFromPoint(Pt) = SelPageIndex) and (pozZoomOnClick in OptionsZoom) then
              if Zoomed then
                ACursor := Screen.Cursors[crdxPreviewZoomOut]
              else
                ACursor := Screen.Cursors[crdxPreviewZoomIn];
    end;
  end;
  if (ACursor <> 0) then
    SetCursor(ACursor)
  else
    inherited;
end;

procedure TCustomdxPreview.WMSize(var message: TWMSize);
begin
  inherited;
{$IFNDEF DELPHI4}
  Resize;
{$ENDIF}
  CheckZoomFactor;
end;

procedure TCustomdxPreview.WMVScroll(var message: TWMVScroll);

  function GetScrollTrackPos: Integer;
  var
    ScrollInfo: TScrollInfo;
  begin
    with ScrollInfo do
    begin
      cbSize := SizeOf(ScrollInfo);
      fMask := SIF_TRACKPOS;
    end;
    GetScrollInfo(SB_VERT, ScrollInfo);
    Result := ScrollInfo.nTrackPos;
  end;
  
var
  ATrackPos: Integer;
begin
  inherited;
  case message.ScrollCode of
    SB_LINEUP:
      TopPos := TopPos - dxPreviewScrollStep;
    SB_LINEDOWN:
      TopPos := TopPos + dxPreviewScrollStep;
    SB_PAGEUP:
      TopPos := TopPos - ClientHeight;
    SB_PAGEDOWN:
      TopPos := TopPos + ClientHeight;
    SB_THUMBTRACK:
      begin
        ATrackPos := GetScrollTrackPos;
        DestroyShowHintTimer;
        if (pobThumbTracking in OptionsBehavior) then 
          TopPos := ATrackPos;
        if (pohShowOnScroll in OptionsHint) and (AllRowCount > 1) then
        begin
          CalcPagesBounds(ATrackPos, VirtualWidth, VirtualHeight);
          UpdatePageNumberHint;
        end;
      end;
    SB_THUMBPOSITION:
      if not (pobThumbTracking in OptionsBehavior) then
      begin
        TopPos := GetScrollTrackPos;;
        UpdateWindow(Handle);
      end;
    SB_ENDSCROLL:
      DestroyPageNumberHint;
  end;
end;

procedure TCustomdxPreview.CancelDragMargin;
begin
  if DraggingMargin = nil then Exit;
  DraggingMargin.DraggingPos := NullDraggingPos;
  DraggingMargin.AfterDrag;
  FDraggingMargin := nil;
  ClearLastMousePos;
end;

function TCustomdxPreview.GetHitInfoAt(const X, Y: Integer): TdxPreviewHitTests;
var
  Margin: TdxPreviewMargin;
  Pt: TPoint;
begin
  Result := [];
  Pt := Point(X, Y);
  if not PtInRect(ClientRect, Pt) then 
    Exit;
  if PageIndexFromPoint(Pt) > -1 then
  begin
    Result := [phtPage];
    Margin := MarginFromPoint(Pt);
    if Margin <> nil then
      Result := Result + [TdxPreviewHitTest(Integer(Margin.MarginType) + Integer(phtLeftMargin))]
  end
  else
    Result := [phtNoWhere];
end;

procedure TCustomdxPreview.GetVisiblePageRanges(StartIndex, EndIndex: PInteger);
var
  R, CR: TRect;
  I: Integer;
begin
  if (PageCount = 0) or ((StartIndex = nil) and (EndIndex = nil)) then 
    Exit;
  CR := ClientRect;
  I := 0;
  while (I < PageCount) and not (IntersectRect(R, Pages[I].Bounds, CR) and EqualRect(R, Pages[I].Bounds)) do
    Inc(I);
    
  if StartIndex <> nil then     
    if I = PageCount then 
      StartIndex^:= -1
    else 
      StartIndex^:= I;

  if EndIndex <> nil then 
    if I = PageCount then 
      EndIndex^:= -1
    else 
    begin
      while (I < PageCount) and IntersectRect(R, Pages[I].Bounds, CR) and EqualRect(R, Pages[I].Bounds) do 
        Inc(I);
      EndIndex^ := I - 1;
    end;
end;

procedure TCustomdxPreview.GetPartVisiblePageRanges(StartIndex, EndIndex: PInteger);
var
  R, CR: TRect;
  I: Integer;
begin
  if (PageCount = 0) or ((StartIndex = nil) and (EndIndex = nil)) then 
    Exit;
  Windows.GetClientRect(Handle, CR);  
  I := 0;
  while (I < PageCount) and not IntersectRect(R, Pages[I].Bounds, CR) do 
    Inc(I);
  if StartIndex <> nil then StartIndex^:= I;
  if EndIndex <> nil then 
  begin
    while (I < PageCount) and IntersectRect(R, Pages[I].Bounds, CR) do 
      Inc(I);
    EndIndex^ := I - 1;
  end;  
end;

function TCustomdxPreview.GetPageNumberHint: string;
var
  StartPage, EndPage: Integer;
begin
  Result := DropAmpersand(sdxPage) + ':  ';
  GetPartVisiblePageRanges(@StartPage, @EndPage);
  Result := Result + IntToStr(StartPage + 1);
  if (StartPage <> EndPage) then 
    Result := Result + ' - ' + IntToStr(EndPage + 1);
  if Assigned(FOnGetPageNumberHint) then
    FOnGetPageNumberHint(Self, StartPage, EndPage, Result);
end;

procedure TCustomdxPreview.UpdatePageNumberHint;
var
  Pt: TPoint;
begin
  if (FPageNumberHintWindow = nil) then
    FPageNumberHintWindow := TdxPreviewHintWindow.Create(nil);
  GetCursorPos(Pt);
  TdxPreviewHintWindow(FPageNumberHintWindow).ActivateHint(Pt, GetPageNumberHint, nil);
end;

procedure TCustomdxPreview.DestroyPageNumberHint;
begin
  if (FPageNumberHintWindow <> nil) then FPageNumberHintWindow.Free;
  FPageNumberHintWindow := nil;
end;

{$IFDEF DELPHI4}
procedure TCustomdxPreview.AdjustSize;
begin
end;
{$ENDIF}

{$IFNDEF DELPHI4}
procedure TCustomdxPreview.Resize;
begin
  if Assigned(FOnResize) then FOnResize(Self);
end;
{$ENDIF}

procedure TCustomdxPreview.CreateWindowHandle(const Params: TCreateParams);
begin
  inherited CreateWindowHandle(Params);
  if HandleAllocated then FDC := GetDC(Handle);
end;

{$IFDEF DELPHI4} 
procedure TCustomdxPreview.CreateWnd;
const
  Styles: array[TScrollBarStyle] of Integer = (FSB_REGULAR_MODE, FSB_ENCARTA_MODE, FSB_FLAT_MODE);
begin
  inherited CreateWnd;
  if not SysLocale.MiddleEast then
    InitializeFlatSB(Handle);
  FlatSB_SetScrollProp(Handle, WSB_PROP_HSTYLE, Styles[ScrollBarStyle], True);
  FlatSB_SetScrollProp(Handle, WSB_PROP_VSTYLE, Styles[ScrollBarStyle], True);
end;
{$ENDIF}    

procedure TCustomdxPreview.WMDestroy(var message: TWMDestroy);
begin
  if (FDC <> 0) and HandleAllocated then 
    ReleaseDC(Handle, FDC);
  FDC := 0;
  inherited;
end;
                    
procedure TCustomdxPreview.CreateParams(var Params: TCreateParams);
const
  CS_ON = CS_OWNDC;
  CS_OFF = CS_HREDRAW or CS_VREDRAW;
begin
  inherited CreateParams(Params);
  with Params do 
  begin
    if FScrollBars in [ssVertical, ssBoth] then 
      Style := Style or WS_VSCROLL;
    if FScrollBars in [ssHorizontal, ssBoth] then 
      Style := Style or WS_HSCROLL;    
    WindowClass.Style := WindowClass.Style + CS_ON - CS_OFF;
    if (FBorderStyle = bsSingle) and (LookAndFeel = plfStandard) then
      if NewStyleControls and Ctl3D then
      begin
        Style := Style and not WS_BORDER;
        ExStyle := ExStyle or WS_EX_CLIENTEDGE;
      end
      else
        Style := Style or WS_BORDER;
  end;      
end;

function TCustomdxPreview.GetScrollInfo(BarFlag: Integer; var ScrollInfo: TScrollInfo): BOOL;
begin
{$IFDEF DELPHI4}
  Result := FlatSB_GetScrollInfo(Handle, BarFlag, ScrollInfo);
{$ELSE}
  Result := Windows.GetScrollInfo(Handle, BarFlag, ScrollInfo);
{$ENDIF}
end;

function TCustomdxPreview.SetScrollInfo(BarFlag: Integer; const ScrollInfo: TScrollInfo; Redraw: BOOL): Integer;
begin
{$IFDEF DELPHI4}
  Result := FlatSB_SetScrollInfo(Handle, BarFlag, ScrollInfo, Redraw);
{$ELSE}
  Result := Windows.SetScrollInfo(Handle, BarFlag, ScrollInfo, Redraw);
{$ENDIF}
end;

{$IFDEF DELPHI4}
procedure TCustomdxPreview.SetScrollBarStyle(const Value: TScrollBarStyle);
begin
  if Value <> FScrollBarStyle then
  begin
    FScrollBarStyle := Value;
    RecreateWnd;
  end;
end;
{$ENDIF}

function TCustomdxPreview.CanChangeMargins: Boolean;
begin
  Result := [csReading, csLoading] * ComponentState = [];
end;

procedure TCustomdxPreview.ScrollPage(Direction: TdxPreviewScrollDirection);
const
  cMsg: array[TdxPreviewScrollDirection] of Cardinal = 
    (WM_HSCROLL, WM_VSCROLL, WM_HSCROLL, WM_VSCROLL);
  cScrollCode: array[TdxPreviewScrollDirection] of Smallint = 
    (SB_LINELEFT, SB_LINEUP, SB_LINERIGHT, SB_LINEDOWN);
  cBar: array[TdxPreviewScrollDirection] of Integer = 
    (SB_HORZ, SB_VERT, SB_HORZ, SB_VERT);
var
  message: TMessage;
begin
  FillChar(message, SizeOf(TMessage), 0);
  message.Msg := cMsg[Direction];
  TWMScroll(message).ScrollCode := cScrollCode[Direction];
  TWMScroll(message).Pos := GetScrollPos(Handle, cBar[Direction]);
  Dispatch(message);
end;

procedure TCustomdxPreview.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      if (SelPageIndex > -1) and (DraggingMargin = nil) then
      begin
        HideAllHints;
        Zoomed := not Zoomed;
      end;
      
    VK_ADD:
      if (SelPageIndex > -1) and (DraggingMargin = nil) then
      begin
        HideAllHints;
        if GetKeyState(VK_CONTROL) < 0 then 
          ZoomIn
        else   
          if not Zoomed then 
            Zoomed := True;
      end;
      
    VK_SUBTRACT:
      if (SelPageIndex > -1) and (DraggingMargin = nil) then
      begin
        HideAllHints;
        if GetKeyState(VK_CONTROL) < 0 then 
          ZoomOut
        else  
          if Zoomed then 
            Zoomed := False;
      end;
      
    VK_MENU:
      if DraggingMargin = nil then 
        HideAllHints;
        
    VK_APPS:
      if (PopupMenu <> nil) or IsDesigning then 
        HideAllHints;
        
    VK_ESCAPE:
      if GetCapture = Handle then 
      begin 
        ReleaseCapture;
        Key := 0;
      end;  
      
    VK_PRIOR:
      if not (ssCtrl in Shift) then
        SelectPrevPage
      else  
        if CanPageScrolling(psdUp) then
        begin
          ScrollPage(psdUp);
          ScrollPage(psdUp);
        end;

    VK_NEXT:
      if not (ssCtrl in Shift) then
        SelectNextPage
      else  
        if CanPageScrolling(psdDown) then
        begin
          ScrollPage(psdDown);
          ScrollPage(psdDown);
        end;
        
    VK_END:
      SelectLastPage;
      
    VK_HOME:
      SelectFirstPage;
      
    VK_LEFT:
      if (ssCtrl in Shift) or (ColCount = 1) then
      begin
        if CanPageScrolling(psdLeft) then 
          ScrollPage(psdLeft)
      end
      else 
        if SelPageCol > 0 then 
          SelectPrevPage;
          
    VK_UP:
      if (ssCtrl in Shift) or (ColCount = 1) then
        if CanPageScrolling(psdUp) then 
          ScrollPage(psdUp)
        else
      else 
        if SelPageRow > 0 then 
          SelPageIndex := SelPageIndex - ColCount;
          
    VK_RIGHT:
      if (ssCtrl in Shift) or (ColCount = 1) then
        if CanPageScrolling(psdRight) then 
          ScrollPage(psdRight)
        else  
      else 
        if SelPageCol < ColCount - 1 then 
          SelectNextPage;
          
    VK_DOWN:
      if (ssCtrl in Shift) or (ColCount = 1) then
        if CanPageScrolling(psdDown) then 
          ScrollPage(psdDown)
        else
      else 
        if SelPageRow < Ceil(PageCount / ColCount) - 1 then
          SelPageIndex := SelPageIndex + ColCount;
  end;
  inherited KeyDown(Key, Shift);
end;

procedure TCustomdxPreview.DoScrolling;
type
  TdxPreviewScrollDirection = 
    (dirNone, dirLeft, dirTop, dirRight, dirBottom, dirTopLeft, dirTopRight, dirBottomRight, dirBottomLeft);
const
  ScrollTimeStep = 20;
  ScrollValueStep = 5;
  MaxSpeed = 12;
  KeyDelta = 10;
var
  BreakOnMouseUp: Boolean;
  AllowHorScrolling, AllowVerScrolling: Boolean;
  P, PrevP: TPoint;
  AnchorPos: TPoint;
  AnchorSize: Integer;
  AnchorWnd: HWND;
  Direction: TdxPreviewScrollDirection;
  Speed: Integer;
  TimerHits: Integer;
  Timer: UINT;
  CaptureWnd: HWND;
  Msg: TMsg;
  Form : TCustomForm;
  
  function CreateScrollingAnchorWnd: HWND;
  var
    B: TBitmap;
    W, H: Integer;
    Rgn: HRGN;
    DC: HDC;

    function GetResourceBitmapID: Integer;
    begin
      if AllowHorScrolling and AllowVerScrolling then
        Result := DXCP_PREVIEWFULLSCROLLBITMAP
      else if AllowHorScrolling then
        Result := DXCP_PREVIEWHORZSCROLLBITMAP
      else
        Result := DXCP_PREVIEWVERTSCROLLBITMAP;
    end;

  begin
    B := TBitmap.Create;
    try
      B.LoadFromResourceID(HInstance, GetResourceBitmapID);

      W := B.Width;
      H := B.Height;
      AnchorSize := W;
      with AnchorPos do
        Result := CreateWindow('STATIC', nil, WS_POPUP,
          X - W div 2, Y - H div 2 - 2, W, H, Handle, 0, HInstance, nil);
      Rgn := CreateEllipticRgn(0, 0, W + 1, H + 1);
      SetWindowRgn(Result, Rgn, True);
      SetWindowPos(Result, 0, 0, 0, 0, 0,
        SWP_NOZORDER or SWP_NOMOVE or SWP_NOSIZE or SWP_SHOWWINDOW or SWP_NOACTIVATE);

      DC := GetWindowDC(Result);
      BitBlt(DC, 0, 0, W, H, B.Canvas.Handle, 0, 0, SRCCOPY);
      Rgn := CreateEllipticRgn(0, 0, W + 1, H + 1);
      FrameRgn(DC, Rgn, GetSysColorBrush(COLOR_WINDOWTEXT), 1, 1);
      DeleteObject(Rgn);
      ReleaseDC(Result, DC);
    finally
      B.Free;
    end;  
  end;

  procedure CalcDirectionAndSpeed(const P: TPoint);
  var
    DeltaX, DeltaY, SpeedValueX, SpeedValueY: Integer;
    Angle, Angle2: Double;
    
    function GetNeutralZone: TRect;
    begin
      with AnchorPos do
        Result := Bounds(X - AnchorSize div 2, Y - AnchorSize div 2, AnchorSize, AnchorSize);
      if not AllowHorScrolling then
      begin
        Result.Left := 0;
        Result.Right := Screen.Width;
      end;
      if not AllowVerScrolling then
      begin
        Result.Top := 0;
        Result.Bottom := Screen.Height;
      end;
    end;

  begin
    Direction := dirNone;
    if PtInRect(GetNeutralZone, P) then
    begin
      Direction := dirNone;
      Speed := 0;
      Exit;
    end
    else
    begin
      BreakOnMouseUp := True;
      DeltaX := P.X - AnchorPos.X;
      DeltaY := P.Y - AnchorPos.Y;
      SpeedValueX := Abs(DeltaX) - AnchorSize div 2;
      SpeedValueY := Abs(DeltaY) - AnchorSize div 2;
      if SpeedValueY > SpeedValueX then 
        SpeedValueX := SpeedValueY;
      Speed := 1 + SpeedValueX div ScrollValueStep;
      if Speed > MaxSpeed then 
        Speed := MaxSpeed;
      Angle2 := ArcSin(0.5 * AnchorSize/SQRT(DeltaX * DeltaX + DeltaY * DeltaY));
      Angle := ArcTan2(Abs(DeltaY), Abs(DeltaX));
      if DeltaX <= 0 then 
        if DeltaY > 0 then 
          Angle := Angle + Pi
        else
          Angle := Pi - Angle
      else 
        if DeltaY > 0 then
          Angle := 2 * Pi - Angle;
        
      if (Angle <= Angle2) or (Angle >= 2 * Pi - Angle2) then
        Direction := dirRight
      else 
        if (Angle > Angle2) and (Angle < 0.5 * Pi - Angle2) then
          if not AllowHorScrolling then 
            Direction := dirTop
          else 
            if not AllowVerScrolling then 
              Direction := dirRight
            else  
              Direction := dirTopRight
        else 
          if (Angle >= 0.5 * Pi - Angle2) and (Angle <= 0.5 * Pi + Angle2) then
            Direction := dirTop
          else 
            if (Angle > 0.5 * Pi + Angle2) and (Angle < Pi - Angle2) then
              if not AllowHorScrolling then 
                Direction := dirTop
              else 
                if not AllowVerScrolling then 
                  Direction := dirLeft
                else  
                  Direction := dirTopLeft
            else 
              if (Angle >= Pi - Angle2) and (Angle <= Pi + Angle2) then
                Direction := dirLeft
              else 
                if (Angle > Pi + Angle2) and (Angle < 1.5 * Pi - Angle2) then
                  if not AllowHorScrolling then 
                    Direction := dirBottom
                  else 
                    if not AllowVerScrolling then 
                      Direction := dirLeft
                    else  
                      Direction := dirBottomLeft
                else 
                  if (Angle >= 1.5 * Pi - Angle2) and (Angle <= 1.5 * Pi + Angle2) then
                    Direction := dirBottom
                  else 
                    if (Angle > 1.5 * Pi + Angle2) and (Angle < 2 * Pi - Angle2) then
                      if not AllowHorScrolling then 
                        Direction := dirBottom
                      else 
                        if not AllowVerScrolling then 
                          Direction := dirRight
                        else  
                          Direction := dirBottomRight
                    else  
                      Direction := dirNone;
    end;
  end;

  procedure SetMouseCursor;
  var
    Cursor: TCursor;
  begin
    case Direction of
      dirLeft:
        Cursor := crdxPreviewLeftScroll;
      dirTop:
        Cursor := crdxPreviewUpScroll;
      dirRight:
        Cursor := crdxPreviewRightScroll;
      dirBottom:
        Cursor := crdxPreviewDownScroll;
      dirTopLeft:
        Cursor := crdxPreviewTopLeftScroll;
      dirTopRight:
        Cursor := crdxPreviewTopRightLeftScroll;
      dirBottomRight:
        Cursor := crdxPreviewBottomRightScroll;
      dirBottomLeft:
        Cursor := crdxPreviewBottomLeftScroll;
    else
      if AllowHorScrolling and AllowVerScrolling then
        Cursor := crdxPreviewFullScroll
      else if AllowHorScrolling then
        Cursor := crdxPreviewHorzScroll
      else
        Cursor := crdxPreviewVertScroll;
    end;
    SetCursor(Screen.Cursors[Cursor]);
  end;
  
  procedure Scroll(Direction: TdxPreviewScrollDirection);
  const 
    Scrolls: array[Boolean] of Longint = (WM_HSCROLL, WM_VSCROLL);
    Flags: array[Boolean] of WPARAM = (SB_LINEUP, SB_LINEDOWN);
  begin
    if (Direction > dirNone) then
      if (Direction < dirTopLeft) then 
        SendMessage(Handle, Scrolls[Direction in [dirTop, dirBottom]], 
          Flags[Direction in [dirRight, dirBottom]], 0)
      else {dirTopLeft..dirBottomLeft}
      begin
        SendMessage(Handle, WM_HSCROLL, 
          Flags[Direction in [dirTopRight, dirBottomRight]], 0);
        SendMessage(Handle, WM_VSCROLL, 
          Flags[Direction in [dirBottomRight, dirBottomLeft]], 0);            
      end;
  end;

begin
  BreakOnMouseUp := False;
  AllowHorScrolling := CanHorzScrolling;
  AllowVerScrolling := CanVertScrolling;
  GetCursorPos(PrevP);
  AnchorPos := PrevP;
  AnchorWnd := CreateScrollingAnchorWnd;
  Direction := dirNone;
  SetMouseCursor;
  Speed := 1;
  TimerHits := 0;
  Timer := SetTimer(0, 0, ScrollTimeStep, nil);

  CaptureWnd := Handle;
  SetCapture(CaptureWnd);
  try
    while GetCapture = CaptureWnd do
    begin
      case Integer(GetMessage(Msg, 0, 0, 0)) of
       -1: Break;
        0:
          begin
            PostQuitMessage(Msg.wParam);
            Break;
          end;
      end;
      case Msg.message of
        WM_KEYDOWN, WM_KEYUP:
          case Msg.wParam of
            VK_ESCAPE, VK_MENU, VK_APPS: 
              Break;
            VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_PRIOR, VK_END, VK_NEXT:
              begin
                GetCursorPos(P);
                if Msg.wParam in [VK_UP, VK_HOME, VK_PRIOR] then Dec(P.Y, KeyDelta);
                if Msg.wParam in [VK_DOWN, VK_END, VK_NEXT] then Inc(P.Y, KeyDelta);
                if Msg.wParam in [VK_LEFT, VK_HOME, VK_END] then Dec(P.X, KeyDelta);
                if Msg.wParam in [VK_RIGHT, VK_PRIOR, VK_NEXT] then Inc(P.X, KeyDelta);
                SetCursorPos(P.X, P.Y);
              end;  
           end;   
        WM_MOUSEMOVE:
          begin
            P := SmallPointToPoint(TSmallPoint(Msg.lParam));
            Windows.ClientToScreen(Msg.hwnd, P);
            if (P.X <> PrevP.X) or (P.Y <> PrevP.Y) then
            begin
              CalcDirectionAndSpeed(P);
              SetMouseCursor;
              PrevP := P;
            end;
          end;
        WM_MBUTTONUP:
          if BreakOnMouseUp then Break;
        WM_TIMER:
          if UINT(Msg.wParam) = Timer then
          begin
            Inc(TimerHits);
            if TimerHits mod (MaxSpeed - Speed + 1) = 0 then 
              Scroll(Direction);
          end;
        WM_SYSCOMMAND:
          if Msg.wParam = SC_CLOSE then 
            Break;
      else
        if (Msg.message = WM_PAINT) and (Msg.hwnd = AnchorWnd) then
        begin
          ValidateRect(AnchorWnd, nil);
          Continue;
        end;
        if (Msg.message >= WM_MOUSEFIRST) and (Msg.message <= WM_MOUSELAST) then 
          Break;
        TranslateMessage(Msg);
        DispatchMessage(Msg);
      end;
    end;
  finally
    if GetCapture = CaptureWnd then 
      ReleaseCapture;
    KillTimer(0, Timer);
    DestroyWindow(AnchorWnd);
    if (Msg.Message = WM_SYSCOMMAND) and (Msg.wParam = SC_CLOSE) then 
    begin
      Form := GetParentForm(Self);
      if Assigned(Form) then 
        PostMessage(Form.Handle, WM_SYSCOMMAND, SC_CLOSE, 0);
    end;  
  end;
end;

procedure TCustomdxPreview.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  PageIndex, OldPageIndex: Integer;
  Margin: TdxPreviewMargin;
  R: TRect;
begin
  if Button = mbLeft then
  begin
    PageIndex := PageIndexFromPoint(Point(X, Y));
    if PageIndex <> -1 then
      if SelPageIndex = PageIndex then
      begin
        Margin := MarginFromPoint(Point(X, Y));
        if Margin = nil then
          if pozZoomOnClick in OptionsZoom then
            Zoomed := not Zoomed
          else
        else
        begin
          if (pobAllowDragMargins in OptionsBehavior) and Margin.Enabled and not (ssDouble in Shift) then
          begin
            Margin.BeforeDrag;
            R := Margin.Bounds;
            FDraggingMargin := Margin;
            if Margin.IsVertical then
            begin
              FBeforeDragPos := X;
              FDragOffset := X - R.Left;
            end
            else
            begin
              FBeforeDragPos := Y;
              FDragOffset := Y - R.Top;
            end;
            Margin.DraggingPos := FBeforeDragPos - FDragOffset;
            SetCapture(Handle);
          end;
        end;
      end
      else 
      begin
        OldPageIndex := SelPageIndex;
        SelPageIndex := PageIndex;
        if OldPageIndex <> SelPageIndex then ResetHintTimer(X, Y);
      end;
  end
  else 
    if DraggingMargin <> nil then ReleaseCapture;

  if (Button = mbMiddle) and (DraggingMargin = nil) and CanAnyScrolling then
    DoScrolling;

  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TCustomdxPreview.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Pos: Integer;
  APageIndex: Integer;
begin
  inherited;
  if (FLastMousePos.X <> X) or (FLastMousePos.Y <> Y) then
  begin
    FLastMousePos := Point(X, Y);
    if (FDraggingMargin = nil) then
    begin
      ResetHintTimer(X, Y);
      if (pobHotTrack in OptionsBehavior) and GetParentForm(Self).Active then
      begin
        APageIndex := PageIndexFromPoint(Point(X, Y));
        if (APageIndex <> -1) then SelPageIndex := APageIndex;
      end;
    end
    else
    begin
      if DraggingMargin.IsVertical then
        Pos := X
      else
        Pos := Y;
      DraggingMargin.DraggingPos := Pos - FDragOffset;
    end;
  end;
end;

procedure TCustomdxPreview.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Margin: TdxPreviewMargin;
  Pos: Integer;
begin
  inherited;
  if (Button = mbLeft) and (DraggingMargin <> nil) then
  begin
    Margin := DraggingMargin;
//    ReleaseCapture;
    with Margin do
    begin
      if IsVertical then
        Pos := X
      else
        Pos := Y;
      if FBeforeDragPos <> Pos then
        Value := ValueFromPos(Pos - FDragOffset);
    end;
    ReleaseCapture;
  end;
end;

function TCustomdxPreview.CanSelectPage(APageIndex: Integer): Boolean;
begin
  Result := True;
  if Assigned(FOnSelectingPage) then FOnSelectingPage(Self, APageIndex, Result);
end;

procedure TCustomdxPreview.DrawPageBackground(const R: TRect; APageIndex: Integer);
begin
  if Assigned(FOnDrawPageBackground) then 
    FOnDrawPageBackground(Self, Canvas, R, APageIndex)
  else 
    if (povDefaultDrawPageBackground in OptionsView) then 
      if (FPageBackground.Mode = bmNone) then 
        FillRect(FDC, R, HBRUSH(COLOR_WINDOW + 1))
      else
      begin
        if ((FPageBackground.Mode = bmPicture) and 
          (FPageBackground.PictureMode in [ppmCenter, ppmProportional])) 
        then
          FillRect(FDC, R, HBRUSH(COLOR_WINDOW + 1));
        FPageBackground.Paint(Canvas, R);
      end;
end;

procedure TCustomdxPreview.InvalidatePagesHeader;
var
  StartIndex, EndIndex, I: Integer;
  R, CR: TRect;
begin
  if not HandleAllocated or (PageCount = 0) then Exit;
  GetPartVisiblePageRanges(@StartIndex, @EndIndex);
  if StartIndex < 0 then Exit;
  CR := ClientRect;
  for I := StartIndex to EndIndex do
  begin
    with Pages[I].Bounds do
      R := Rect(Left + Margins[pmLeft].VisibleValue,
                Top + Margins[pmHeader].VisibleValue,
                Right - Margins[pmRight].VisibleValue,
                Top + Margins[pmTop].VisibleValue);
      if IntersectRect(R, R, CR) then
        InvalidateRect(Handle, @R, False);
  end;
end;

procedure TCustomdxPreview.InvalidatePagesFooter;
var
  StartIndex, EndIndex, I: Integer;
  R, CR: TRect;
begin
  if not HandleAllocated or (PageCount = 0) then Exit;
  GetPartVisiblePageRanges(@StartIndex, @EndIndex);
  if StartIndex < 0 then Exit;
  CR := ClientRect;
  for I := StartIndex to EndIndex do
  begin
    with Pages[I].Bounds do
      R := Rect(Left + Margins[pmLeft].VisibleValue,
                Bottom - Margins[pmBottom].VisibleValue,
                Right - Margins[pmRight].VisibleValue,
                Bottom - Margins[pmFooter].VisibleValue);
    if IntersectRect(R, R, CR) then
      InvalidateRect(Handle, @R, False);
  end;
end;

procedure TCustomdxPreview.InvalidatePage(APageIndex: Integer);    
var
  R: TRect;
begin
  if (APageIndex > -1) and (APageIndex < PageCount) and HandleAllocated and
    IntersectRect(R, Pages[APageIndex].Bounds, ClientRect) then
    InvalidateRect(Handle, @Pages[APageIndex].Bounds, False);
end;

procedure TCustomdxPreview.InvalidatePages;
var
  StartIndex, EndIndex, I: Integer;
begin
  if not HandleAllocated or (PageCount = 0) then Exit;
  GetPartVisiblePageRanges(@StartIndex, @EndIndex);
  if StartIndex < 0 then Exit;
  for I := StartIndex to EndIndex do
    InvalidateRect(Handle, @Pages[I].Bounds, False);
end;

procedure TCustomdxPreview.InvalidatePagesContent;
var
  StartIndex, EndIndex, I: Integer;
  R: TRect;
begin
  if not HandleAllocated or (PageCount = 0) then Exit;
  GetPartVisiblePageRanges(@StartIndex, @EndIndex);
  if StartIndex < 0 then Exit;
  for I := StartIndex to EndIndex do
  begin
    with Pages[I].Bounds do
      R := Rect(Left + Margins[pmLeft].VisibleValue, 
                Top + Margins[pmTop].VisibleValue,
                Right - Margins[pmRight].VisibleValue, 
                Bottom - Margins[pmBottom].VisibleValue);
    InvalidateRect(Handle, @R, False);
  end;
end;

procedure TCustomdxPreview.DrawNoPages;
var
  R: TRect;
begin
  R := ClientRect;
  FillRect(FDC, R, Brush.Handle);
  SetBkMode(FDC, TRANSPARENT);
  DrawText(FDC, PChar(sdxNoPages), Length(sdxNoPages), R, DT_SINGLELINE or DT_CENTER or DT_VCENTER);
end;

procedure TCustomdxPreview.DrawPages;
var
  I, J, H, PageIndex: Integer;
  Page: TdxPreviewPage;
  R: TRect;
  Rgn, RestRgn: HRGN;

  procedure ExcludePageRect(const R: TRect);
  begin
    Rgn := CreateRectRgnIndirect(R);
    CombineRgn(RestRgn, RestRgn, Rgn, RGN_DIFF);
    DeleteObject(Rgn);
  end;  
  
begin
  H := ClientHeight;
  GetClipBox(FDC, R);
  RestRgn := CreateRectRgnIndirect(R);
//  GetPartVisiblePageRanges(StartIndex, EndIndex);
  for J := 0 to AllRowCount - 1 do
    for I := 0 to ColCount - 1 do
    begin
      PageIndex := J * ColCount + I;
      if PageIndex > PageCount - 1 then Break;
      Page := Pages[PageIndex];
      R := GetPageSiteRect(Page.Bounds);
      if (R.Bottom > 0) and (R.Top < H) and RectVisible(FDC, R) then
      begin
        ExcludePageRect(R);
        R := Page.Bounds;
        if RectVisible(FDC, R) then
        begin
          FPageStack.Add(Pointer(PageIndex));
          DrawPageBackground(R, PageIndex);
        end;
        DrawPageBorder(FDC, R, PageIndex);
      end;
    end;
  if GetRgnBox(RestRgn, R) <> NULLREGION then FillRgn(FDC, RestRgn, Brush.Handle);
  DeleteObject(RestRgn);
end;

procedure TCustomdxPreview.DrawPagesContent;
var
  I, PageIndex: Integer;
  R: TRect;
begin
  for I := 0 to FPageStack.Count - 1 do
  begin
    PageIndex := Integer(FPageStack.List^[I]);
    R := Pages[PageIndex].Bounds;
    DoCustomDrawPageContent(R, PageIndex);
    if (povMargins in OptionsView) and (PageIndex = SelPageIndex) then 
      DrawMargins(FDC);
  end;
end;

procedure TCustomdxPreview.AdjustPagesBounds;
begin
  if povAutoHideScrollBars in OptionsView then 
  begin
    CalcPagesBounds(TopPos, VirtualWidth + GetSystemMetrics(SM_CXVSCROLL), 
      VirtualHeight + GetSystemMetrics(SM_CXHSCROLL));
    if (VirtualWidth > ClientWidth) or (VirtualHeight > ClientHeight) then 
      CalcPagesBounds(TopPos, VirtualWidth, VirtualHeight);
  end
  else
    CalcPagesBounds(TopPos, VirtualWidth, VirtualHeight);
end;

{.$DEFINE DEBUG_PREVIEW}

procedure TCustomdxPreview.Paint;
{$IFDEF DEBUG_PREVIEW}  
var
  T: DWORD;
{$ENDIF}  
begin
{$IFDEF DEBUG_PREVIEW}    
  T := GetTickCount;
{$ENDIF}

  FPageStack.Clear;
  AdjustPagesBounds;  
  DrawPages;
  DrawPagesContent;
  if PageCount = 0 then 
    DrawNoPages;
//  UpdateScrollBars;
    
{$IFDEF DEBUG_PREVIEW}    
  //Application.MainForm.Caption := Format('%d', [GetTickCount - T]);
  GetParentForm(Self).Caption := Format('%d', [GetTickCount - T]);
{$ENDIF}
end;

function TCustomdxPreview.CanHorzScrollBarBeVisible: Boolean;
begin
  Result := ScrollBars in [ssBoth, ssHorizontal];
end;

function TCustomdxPreview.CanVertScrollBarBeVisible: Boolean;
begin
  Result := ScrollBars in [ssBoth, ssVertical];
end;

function TCustomdxPreview.CanAnyScrolling: Boolean;
begin
  Result := CanHorzScrolling or CanVertScrolling;
end;

function TCustomdxPreview.CanHorzScrolling: Boolean;
begin
  Result := (ZoomMode <> pzmPageWidth) and 
    (ClientWidth < VirtualWidth - Byte(ZoomMode = pzmPages) * Indent);
end;

function TCustomdxPreview.CanVertScrolling: Boolean;
begin
  Result := ClientHeight < VirtualHeight - Byte(ZoomMode = pzmPages) * Indent;
end;

function TCustomdxPreview.CanPageScrolling(Direction: TdxPreviewScrollDirection): Boolean;
begin
  Result := ((ZoomMode <> pzmPages) or (PageCount <> 1)) and 
    ((Direction in [psdLeft, psdRight]) and CanHorzScrolling) or 
    ((Direction in [psdUp, psdDown]) and CanVertScrolling);
end;

procedure TCustomdxPreview.UpdateScrollBars;
const
  DisableNoScroll: array[Boolean] of UINT = (SIF_DISABLENOSCROLL, 0);
var  
  ScrollInfo: TScrollInfo;
  
  procedure UpdateHorzScrollBar;
  begin
    with ScrollInfo do
    begin
      cbSize := SizeOf(ScrollInfo);
      fMask := SIF_ALL or DisableNoScroll[povAutoHideScrollBars in OptionsView];
      nMin := 0;
      nMax := VirtualWidth - Byte(ZoomMode = pzmPages) * Indent - 1;
      nPage := ClientWidth;
      nPos := LeftPos;
    end;
    SetScrollInfo(SB_HORZ, ScrollInfo, True);
  end;
  
  procedure UpdateVertScrollBar;
  begin
    with ScrollInfo do
    begin
      cbSize := SizeOf(ScrollInfo);
      fMask := SIF_ALL or DisableNoScroll[povAutoHideScrollBars in OptionsView];
      nMin := 0;
      nMax := VirtualHeight - Byte(ZoomMode = pzmPages) * Indent - 1;
      nPage := ClientHeight;
      nPos := TopPos;
    end;
    SetScrollInfo(SB_VERT, ScrollInfo, True);
  end;
  
begin
  if CanHorzScrollBarBeVisible then UpdateHorzScrollBar;
  if CanVertScrollBarBeVisible then UpdateVertScrollBar;
  if DoublePassUpdateScrollBars then 
  begin
    UpdateHorzScrollBar;
    UpdateVertScrollBar;  
  end;
end;
  
function TCustomdxPreview.DoublePassUpdateScrollBars: Boolean;
begin
  Result := (povAutoHideScrollBars in OptionsView) and 
    CanHorzScrollBarBeVisible and CanVertScrollBarBeVisible;
end;
  
procedure TCustomdxPreview.CalcPagesBounds(ATopPos, VWidth, VHeight: Integer);
var
  R: TRect;
  APageSize: TPoint;
  AWidth, AHeight, LeftOffset, TopOffset, I, J, PageIndex: Integer;
begin
  APageSize := VisiblePageSize;
  AWidth := VWidth;
  AHeight := VHeight;
  
  R := ClientRect;
  if AWidth > R.Right - R.Left then
    LeftOffset := Indent
  else
    LeftOffset := (R.Right - (AWidth - 2 * Indent)) div 2;
  if AHeight > R.Bottom - R.Top then
    TopOffset := Indent
  else
    TopOffset := (R.Bottom - (AHeight - 2 * Indent)) div 2;

  if ZoomFactor = MinZoomFactor then
  begin
    if LeftOffset < Indent then LeftOffset := Indent;
    if TopOffset < Indent then TopOffset := Indent;
  end;

//  Inc(TopOffset, Indent);
  for J := 0 to AllRowCount - 1 do
    for I := 0 to ColCount - 1 do
    begin
      PageIndex := J * ColCount + I;
      if PageIndex > PageCount - 1 then Break;
      with R, APageSize do
      begin
        Left := -LeftPos + LeftOffset + I * (X + Indent);
        Top := -ATopPos + TopOffset + J * (Y + Indent);
        Right := Left + X;
        Bottom := Top + Y;
      end;
      Pages[PageIndex].Bounds := R;
    end;
end;

function TCustomdxPreview.CheckLeftPos(Value: Integer): Integer;
begin
  Result := Value;
  if Result > VirtualWidth - ClientWidth then
    Result := VirtualWidth - ClientWidth;
  if Result < 0 then Result := 0;
end;

procedure TCustomdxPreview.CheckMargins;
var
  I: TdxPreviewMarginType;
begin
  for I := Low(I) to High(I) do
    with Margins[I] do
      Value := Value; // for checking value
end;

function TCustomdxPreview.CheckTopPos(Value: Integer): Integer;
begin
  Result := Value;
  if Result > VirtualHeight - ClientHeight then
    Result := VirtualHeight - ClientHeight;
  if Result < 0 then Result := 0;
end;

procedure TCustomdxPreview.CheckZoomFactor;
var
  PageIndex, FirstPageIndex, I, ZoomFactorX, ZoomFactorY: Integer;
  
  function CalcZoomFactor(Size, PageSize: Integer): Integer;
  begin
    Result := MulDiv(Size - dxPreviewIndent1 * (1 + I), 100, 
      dxPreviewIndent2 + I * (PageSize + dxPreviewIndent2));
  end;

begin
  if not HandleAllocated then Exit;
  GetVisiblePageRanges(@FirstPageIndex, nil);
  if (FirstPageIndex = 0) then GetPartVisiblePageRanges(@FirstPageIndex, nil);
  if (SelPageIndex <> -1) and Pages[SelPageIndex].PartVisible then
    PageIndex := SelPageIndex
  else
    PageIndex := FirstPageIndex;

  FZoomModeFixed := True;
  try
    case ZoomMode of
      pzmPageWidth:
        ZoomFactor := MulDiv(ClientWidth, 100, PageSize.X + 2 * dxPreviewIndent);
      pzmPages:
        begin
          ZoomFactorX := MinZoomFactor;
          for I := FPageXCount downto 1 do
          begin
            ZoomFactorX := CalcZoomFactor(ClientWidth, PageSize.X);
            if ZoomFactorX >= MinZoomFactor then Break;
          end;
          if ZoomFactorX < MinZoomFactor then ZoomFactorX := MinZoomFactor;
// calc Y zoom factor
          ZoomFactorY := MinZoomFactor;
          for I := FPageYCount downto 1 do
          begin
            ZoomFactorY := CalcZoomFactor(ClientHeight, PageSize.Y);
            if ZoomFactorY >= MinZoomFactor then Break;
          end;
          if ZoomFactorY < MinZoomFactor then ZoomFactorY := MinZoomFactor;
// select the smallest zoom factor
          if ZoomFactorX < ZoomFactorY then
            ZoomFactor := ZoomFactorX
          else
            ZoomFactor := ZoomFactorY;
        end;
    end;
  finally
    FZoomModeFixed := False;
    UpdateScrollBars;
    LeftPos := LeftPos;
    TopPos := TopPos;
    MakeVisible(FirstPageIndex);
    if FirstPageIndex <> PageIndex then MakeVisible(PageIndex);
    if FUpdateCount = 0 then Invalidate;
  end;
end;

procedure TCustomdxPreview.DoAfterDragMargin(Margin: TdxPreviewMargin);
begin
  if Assigned(FOnAfterDragMargin) then FOnAfterDragMargin(Self, Margin);
end;

procedure TCustomdxPreview.DoBeforeDragMargin(Margin: TdxPreviewMargin);
begin
  if Assigned(FOnBeforeDragMargin) then FOnBeforeDragMargin(Self, Margin);
end;

procedure TCustomdxPreview.DoCalcPageCount;
begin
  if FUpdateCount > 0 then Exit;
  if Assigned(FOnCalcPageCount) then FOnCalcPageCount(Self);
end;

procedure TCustomdxPreview.DoChangePageCount;
begin
  if Assigned(FOnChangePageCount) then FOnChangePageCount(Self);
end;

procedure TCustomdxPreview.DoDragMargin(Margin: TdxPreviewMargin);
begin
  if Assigned(FOnDragMargin) then FOnDragMargin(Self, Margin);
end;

procedure TCustomdxPreview.DoMarginChanged(Margin: TdxPreviewMargin);
begin
  if Assigned(FOnMarginChanged) then FOnMarginChanged(Self, Margin);
  if (Margin.MarginType in [pmLeft..pmGutter]) then DoCalcPageCount; //!?
end;

procedure TCustomdxPreview.DoZoomFactorChanged;
begin
  if Assigned(FOnZoomFactorChanged) then FOnZoomFactorChanged(Self);
end;

procedure TCustomdxPreview.DoZoomModeChanged;
begin
  if Assigned(FOnZoomModeChanged) then FOnZoomModeChanged(Self);
end;

procedure TCustomdxPreview.DrawMargins(DC: hDC);
var
  I: TdxPreviewMarginType;
begin
  for I := Low(I) to High(I) do
    with Margins[I] do
      if Visible then Draw(DC);
end;

procedure TCustomdxPreview.DrawPageBorder(DC: hDC; const ARect: TRect; APageIndex: Integer);
var
  R, SiteRect: TRect;
  BrushColor: COLORREF;
  SiteBrush: HBRUSH;
begin
  R := ARect;
  SiteRect := GetPageSiteRect(ARect);
  InflateRect(R, 1, 1);
  if (povPageSelection in OptionsView) and (APageIndex = SelPageIndex) then
    BrushColor := COLOR_HIGHLIGHT
  else
    BrushColor := COLOR_WINDOWTEXT;   
  FrameRect(DC, R, GetSysColorBrush(BrushColor));
  if (povPageSelection in OptionsView) and (APageIndex = SelPageIndex) then
  begin
    InflateRect(R, 1, 1);
    FrameRect(DC, R, GetSysColorBrush(BrushColor));
  end;
  
  SiteBrush := CreateSolidBrush(ColorToRGB(Color));
  with SiteRect do
  begin
    FillRect(DC, Rect(Left, Top, Right, R.Top), SiteBrush);
    FillRect(DC, Rect(Left, R.Top, R.Left, Bottom), SiteBrush);
  end;
  OffsetRect(R, 2, 2);
  with R do
  begin
    FillRect(DC, Rect(Left - 2, Bottom - 2, Left, Bottom), SiteBrush);
    FillRect(DC, Rect(Left, Bottom - 2, Right, Bottom), HBRUSH(COLOR_WINDOWTEXT + 1));
    FillRect(DC, Rect(Right - 2, Top - 2, Right, Top), SiteBrush);
    FillRect(DC, Rect(Right - 2, Top, Right, Bottom - 2), HBRUSH(COLOR_WINDOWTEXT + 1));
  end;
  with SiteRect do
  begin
    FillRect(DC, Rect(R.Left - 2, R.Bottom, Right, Bottom), SiteBrush);
    FillRect(DC, Rect(R.Right, R.Top - 2, Right, R.Bottom), SiteBrush);
  end;
  DeleteObject(SiteBrush);
end;

procedure TCustomdxPreview.DoCustomDrawPageContent(R: TRect; APageIndex: Integer);
begin
  if Assigned(FOnDrawPageContent) then FOnDrawPageContent(Self, Canvas, R, APageIndex);
end;

function TCustomdxPreview.GetPageSiteRect(const APageRect: TRect): TRect;
begin
  Result := APageRect;
  with Result do
  begin
    Dec(Left, 2);
    Dec(Top, 2);
    Inc(Right, Indent - 2);
    Inc(Bottom, Indent - 2);
  end;
end;

procedure TCustomdxPreview.InvalidateMargins;
var
  I: TdxPreviewMarginType;
begin
  if (povMargins in OptionsView) then
    for I := Low(I) to High(I) do
      Margins[I].Invalidate;
end;

procedure TCustomdxPreview.InvalidatePageBorder(APageIndex: Integer);
var
  R1, R2: TRect;
  Rgn1, Rgn2: hRgn;
begin
  if not HandleAllocated or (APageIndex < 0) or (APageIndex > PageCount - 1) then Exit;
  R2 := Pages[APageIndex].Bounds;
  R1 := GetPageSiteRect(R2);
  Rgn1 := CreateRectRgnIndirect(R1);
  Rgn2 := CreateRectRgnIndirect(R2);
  CombineRgn(Rgn1, Rgn1, Rgn2, RGN_DIFF);
  DeleteObject(Rgn2);
  InvalidateRgn(Handle, Rgn1, False);
  DeleteObject(Rgn1);
end;

function TCustomdxPreview.GetCanShowMarginHint: Boolean;
begin
  Result := True;
  if Assigned(FOnCanShowMarginHint) then FOnCanShowMarginHint(Self, Result);
end;

procedure TCustomdxPreview.ResetHintTimer(X, Y: Integer);
begin
  if IsDesigning then Exit;
  DestroyShowHintTimer;
  if (pohShowForMargins in OptionsHint) and GetParentForm(Self).Active and
    (PageIndexFromPoint(Point(X, Y)) = SelPageIndex) then
  begin
    if (GetHitInfoAt(X, Y) * phtMargins <> []) and GetCanShowMarginHint then
      StartHintTimer;
  end;
end;

procedure TCustomdxPreview.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TCustomdxPreview.CancelUpdate;
begin
  if FUpdateCount <> 0 then Dec(FUpdateCount);
end;

procedure TCustomdxPreview.EndUpdate;
begin
  if FUpdateCount <> 0 then
  begin
    Dec(FUpdateCount);
    if (FUpdateCount = 0) and not (csLoading in ComponentState) then
    begin
      DoCalcPageCount;
      Invalidate;
    end;
  end;
end;

function TCustomdxPreview.GetInnerMeasurementUnits: TdxPreviewMeasurementUnits;
begin
  if MeasurementUnits = pmuDefault then
    Result := GetDefaultMeasurementUnits
  else
    Result := MeasurementUnits;
end;

procedure TCustomdxPreview.MakeVisible(PageIndex: Integer);
var
  R: TRect;
  DeltaX, DeltaY: Integer;
begin
  if not HandleAllocated or (PageIndex < 0) or (PageIndex > PageCount - 1) then Exit;
  CalcPagesBounds(TopPos, VirtualWidth, VirtualHeight);
  R := GetPageSiteRect(Pages[PageIndex].Bounds);
  DeltaX := 0;
  DeltaY := 0;
  if R.Right > ClientWidth then DeltaX := R.Right - ClientWidth;
  if R.Left - DeltaX < 0 then DeltaX := R.Left;
  if R.Bottom > ClientHeight then DeltaY := R.Bottom - ClientHeight;
  if R.Top - DeltaY < 0 then DeltaY := R.Top;
  LeftPos := LeftPos + DeltaX;
  TopPos := TopPos + DeltaY;
  CalcPagesBounds(TopPos, VirtualWidth, VirtualHeight);
end;

function TCustomdxPreview.MarginFromPoint(const P: TPoint): TdxPreviewMargin;
var
  I: TdxPreviewMarginType;
begin
  Result := nil;
  if (SelPageIndex <> -1) then 
    for I := High(I) downto Low(I) do
      with Margins[I] do
        if Visible and Enabled and PtInRect(SelectableBounds, P) then
        begin
          Result := Margins[I];
          if (I = pmGutter) then
            with Margins[pmLeft] do
              if Visible and Enabled and PtInRect(SelectableBounds, P) then
              begin
                Result := Margins[pmLeft];
                Break;
              end
              else
          else
            Break;
        end;
end;

procedure TCustomdxPreview.RestoreDefaultMargins;
var
  I: TdxPreviewMarginType;
begin
  for I := Low(TdxPreviewMarginType) to High(TdxPreviewMarginType) do
    with Margins[I] do
    begin
      FEnabled := True;
      FMaxValue := -1;
      FMinValue := 0;
      FVisible := True;
      FValue := dxDefaultMarginValues[FMarginType];
    end;
  if (FUpdateCount = 0) then Invalidate;
end;

function TCustomdxPreview.PageIndexFromPoint(const P: TPoint): Integer;
var
  CR, R: TRect;
begin
  Windows.GetClientRect(Handle, CR);
  for Result := 0 to PageCount - 1 do
    if IntersectRect(R, GetPageSiteRect(Pages[Result].Bounds), CR) and
      PtInRect(R, P) then Exit;
  Result := -1;
end;

procedure TCustomdxPreview.SelectFirstPage;
var
  I: Integer;
  OldSelPageIndex: Integer;
begin
  I := 0;
  OldSelPageIndex := SelPageIndex;
  repeat
    SelPageIndex := I;    
    Inc(I);
  until (SelPageIndex + I = PageCount + 1) or (SelPageIndex <> OldSelPageIndex);
end;

procedure TCustomdxPreview.SelectLastPage;
var
  I: Integer;
  OldSelPageIndex: Integer;
begin
  I := 1;
  OldSelPageIndex := SelPageIndex;
  repeat
    SelPageIndex := PageCount - I;    
    Inc(I);
  until (I = -1) or (SelPageIndex <> OldSelPageIndex);
end;

procedure TCustomdxPreview.SelectNextPage;
var
  I: Integer;
  OldSelPageIndex: Integer;
begin
  I := 1;
  OldSelPageIndex := SelPageIndex;
  repeat
    SelPageIndex := SelPageIndex + I;    
    Inc(I);
  until (SelPageIndex + I = PageCount + 1) or (SelPageIndex <> OldSelPageIndex);
end;

procedure TCustomdxPreview.SelectPrevPage;
var
  I: Integer;
  OldSelPageIndex: Integer;
begin
  if (SelPageIndex > 0) then 
  begin
    I := 1;
    OldSelPageIndex := SelPageIndex;
    repeat
      SelPageIndex := SelPageIndex - I;    
      Inc(I);
    until (SelPageIndex - I = -2) or (SelPageIndex <> OldSelPageIndex);
  end;  
end;

procedure TCustomdxPreview.SetPageXYCount(XCount, YCount: Integer);
begin
  BeginUpdate;
  try
    PageXCount := XCount;
    PageYCount := YCount;
  finally
    EndUpdate;
  end;
end;

function TCustomdxPreview.MarginValueToString(Value: Integer): string;
var
  DisplayValue: TFloat;
  Mask: string;
begin
  DisplayValue := LoMetricToAnother(FMeasurementUnits, Value);
  case GetInnerMeasurementUnits of
    pmuInches:
      Result := sdxUnitsInches;
    pmuMillimeters:
      Result := sdxUnitsMillimeters;
    pmuCentimeters:
      Result := sdxUnitsCentimeters;
    pmuPoints:
      Result := sdxUnitsPoints;
    pmuPicas:
      Result := sdxUnitsPicas;
  end;
  Mask := '########0.#';
  if GetInnerMeasurementUnits in [pmuInches, pmuCentimeters, pmuPicas] then
    Mask := Mask + '#';
  Result := FormatFloat(Mask, DisplayValue) + ' ' + Result;
end;

function TCustomdxPreview.PageSizeToString: string;
var
  PageWidth, PageHeight: Double;
  Mask: string;
begin
  case GetInnerMeasurementUnits of
    pmuInches:
      Result := sdxUnitsInches;
    pmuMillimeters:
      Result := sdxUnitsMillimeters;
    pmuCentimeters:
      Result := sdxUnitsCentimeters;
    pmuPoints:
      Result := sdxUnitsPoints;
    pmuPicas:
      Result := sdxUnitsPicas;
  end;
  
  Mask := '########0.#';
  if GetInnerMeasurementUnits in [pmuInches, pmuCentimeters, pmuPicas] then
    Mask := Mask + '#';
  PageWidth := LoMetricToAnother(FMeasurementUnits, OriginalPageSize.X);
  PageHeight := LoMetricToAnother(FMeasurementUnits, OriginalPageSize.Y);
    
  Result := FormatFloat(Mask, PageWidth) + ' ' + Result + ' x ' +  
    FormatFloat(Mask, PageHeight) + ' ' + Result;
end;

procedure TCustomdxPreview.SetScrollBars(Value: TScrollStyle);
begin
  if (FScrollBars <> Value) then
  begin
    FScrollBars := Value;
    RecreateWnd;
  end;
end;

{ TAbstractdxPreviewMarginDesigner }

constructor TAbstractdxPreviewMarginDesigner.Create(APreview: TCustomdxPreview);
begin
  inherited Create;
  FPreview := APreview;
  if FPreview <> nil then FPreview.FMarginDesigner := Self;
end;

destructor TAbstractdxPreviewMarginDesigner.Destroy;
begin
  if FPreview <> nil then FPreview.FMarginDesigner := nil;
  inherited Destroy;
end;

initialization
  crdxPreviewHorzResize := DefineCursor(hInstance, DXCP_PREVIEWHORIZONTALRESIZECURSOR);
  crdxPreviewVertResize := DefineCursor(hInstance, DXCP_PREVIEWVERTICALRESIZECURSOR);
  crdxPreviewZoomIn := DefineCursor(hInstance, DXCP_PREVIEWZOOMINCURSOR);
  crdxPreviewZoomOut := DefineCursor(hInstance, DXCP_PREVIEWZOOMOUTCURSOR);
  crdxPreviewFullScroll := DefineCursor(hInstance, DXCP_PREVIEWFULLSCROLLCURSOR);
  crdxPreviewHorzScroll := DefineCursor(hInstance, DXCP_PREVIEWHORZSCROLLCURSOR);
  crdxPreviewVertScroll := DefineCursor(hInstance, DXCP_PREVIEWVERTSCROLLCURSOR);
  crdxPreviewUpScroll := DefineCursor(hInstance, DXCP_PREVIEWUPSCROLLCURSOR);
  crdxPreviewRightScroll := DefineCursor(hInstance, DXCP_PREVIEWRIGHTSCROLLCURSOR);
  crdxPreviewDownScroll := DefineCursor(hInstance, DXCP_PREVIEWDOWNSCROLLCURSOR);
  crdxPreviewLeftScroll := DefineCursor(hInstance, DXCP_PREVIEWLEFTSCROLLCURSOR);
  crdxPreviewTopLeftScroll := DefineCursor(hInstance, DXCP_PREVIEWTOPLEFTSCROLLCURSOR);
  crdxPreviewBottomLeftScroll := DefineCursor(hInstance, DXCP_PREVIEWBOTTOMLEFTSCROLLCURSOR);
  crdxPreviewTopRightLeftScroll := DefineCursor(hInstance, DXCP_PREVIEWTOPRIGHTSCROLLCURSOR);
  crdxPreviewBottomRightScroll := DefineCursor(hInstance, DXCP_PREVIEWBOTTOMRIGHTSCROLLCURSOR);      
  
{$IFDEF DELPHI4}  
finalization
  DestroyCursor(Screen.Cursors[crdxPreviewBottomRightScroll]);
  DestroyCursor(Screen.Cursors[crdxPreviewTopRightLeftScroll]);  
  DestroyCursor(Screen.Cursors[crdxPreviewBottomLeftScroll]);  
  DestroyCursor(Screen.Cursors[crdxPreviewTopLeftScroll]);  
  DestroyCursor(Screen.Cursors[crdxPreviewLeftScroll]);  
  DestroyCursor(Screen.Cursors[crdxPreviewDownScroll]);  
  DestroyCursor(Screen.Cursors[crdxPreviewRightScroll]);  
  DestroyCursor(Screen.Cursors[crdxPreviewUpScroll]);  
  DestroyCursor(Screen.Cursors[crdxPreviewVertScroll]);  
  DestroyCursor(Screen.Cursors[crdxPreviewHorzScroll]);  
  DestroyCursor(Screen.Cursors[crdxPreviewFullScroll]);
  DestroyCursor(Screen.Cursors[crdxPreviewZoomOut]);
  DestroyCursor(Screen.Cursors[crdxPreviewZoomIn]);
  DestroyCursor(Screen.Cursors[crdxPreviewVertResize]);
  DestroyCursor(Screen.Cursors[crdxPreviewHorzResize]);
{$ENDIF}
  
end.

