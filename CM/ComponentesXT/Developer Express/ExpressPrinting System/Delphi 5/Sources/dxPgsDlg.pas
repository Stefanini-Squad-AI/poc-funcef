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

unit dxPgsDlg;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Buttons, Menus, ToolWin, Registry,
{$IFDEF DELPHI4}ImgList, {$ENDIF}
  dxExtCtrls, dxPSESys, dxPSForm, dxBkgnd, dxPrevw, dxPSGlbl, dxfmClr,
  dxPrnPg, dxPrnDev;

type
  TdxPageSetupDlgButtonKind = (psbHelp, psbStyleOptions, psbPreview, psbPrint);
  TdxPageSetupDlgButtons = set of TdxPageSetupDlgButtonKind;
  TdxPageSetupDlgOption =
    (psoCenterOnPage, psoMargins, psoPageOrder, psoShading, psoStyleCaption,
    psoHFAutoText, psoHFBackground, psoHFFont, psoHFText, psoHFFunctions,
    psoHFMargins, psoHFReverse, psoHFVertAlignment);
  TdxPageSetupDlgOptions = set of TdxPageSetupDlgOption;
  TdxHFMode = (hfmThreeSections, hfmOneSection);

const
  psbAll = [Low(TdxPageSetupDlgButtonKind)..High(TdxPageSetupDlgButtonKind)];
  psbDefault = [psbStyleOptions, psbPreview, psbPrint];
  psoAll = [Low(TdxPageSetupDlgOption)..High(TdxPageSetupDlgOption)];
  psoDefaultOptionsEnabled = psoAll;
  psoDefaultOptionsVisible = psoAll;

type
  TdxPrintStyleManager = class;
  TBasedxPrintStyle = class;
  TdxPrintStyleClass = class of TBasedxPrintStyle;
  TAbstractdxPrintStyleOptionsDialog = class;
  TdxPrintStyleOptionsDialogClass = class of TAbstractdxPrintStyleOptionsDialog;
  TAbstractdxStyleManagerDesigner = class;
  TdxPageSetupDialog = class;

  PWinControl = ^TWinControl;
  TdxPrintStyleState = (pssCopy);
  TdxPrintStyleStates = set of TdxPrintStyleState;

  TdxFilterPaperEvent = procedure(Sender: TBasedxPrintStyle;
    const APaper: TdxPaperInfo; var AIsSupported: Boolean) of object;

  TBasedxPrintStyle = class(TComponent)
  private
    FAllowChangeHFText: Boolean;
    FAllowChangeMargins: Boolean;
    FAllowChangeOrientation: Boolean;
    FAllowChangePaper: Boolean;
    FAllowChangeScale: Boolean;
    FAllowCustomPaperSizes: Boolean;
    FBuiltIn: Boolean;
    FData: Pointer;
    FDescription: string;
    FImageIndex: Integer;
    FPrinterPage: TdxPrinterPage;
    FShowPageSetupDlg: Boolean;
    FState: TdxPrintStyleStates;
    FStyleCaption: string;
    FStyleGlyph: TBitmap;
    FStyleManager: TdxPrintStyleManager;

    FOnDestroy: TNotifyEvent;
    FOnFilterPaper: TdxFilterPaperEvent;

    function GetIndex: Integer;
    function GetIsCurrentStyle: Boolean;
    procedure SetBuiltIn(Value: Boolean);
    procedure SetImageIndex(Value: Integer);
    procedure SetIndex(Value: Integer);
    procedure SetIsCurrentStyle(Value: Boolean);
    procedure SetPrinterPage(Value: TdxPrinterPage);
    procedure SetStyleCaption(const Value: string);
    procedure SetStyleGlyph(Value: TBitmap);
    procedure SetStyleManager(Value: TdxPrintStyleManager);

    procedure DesignerUpdate(TheAll: Boolean);
    function IsDesigning: Boolean;
    function IsLoading: Boolean;
    procedure ReadData(Reader: TReader);
    procedure WriteData(Writer: TWriter);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadState(Reader: TReader); override;
    procedure SetName(const NewName: TComponentName); override;
    procedure SetParentComponent(AParent: TComponent); override;

    function GetAllowChangeHFText: Boolean; virtual;
    function GetAllowChangeMargins: Boolean; virtual;
    function GetAllowChangeOrientation: Boolean; virtual;
    function GetAllowChangePaper: Boolean; virtual;
    function GetAllowChangeScale: Boolean; virtual;
    function GetAllowCustomPaperSizes: Boolean; virtual;
    procedure SetAllowChangeHFText(Value: Boolean); virtual;
    procedure SetAllowChangeMargins(Value: Boolean); virtual;
    procedure SetAllowChangeOrientation(Value: Boolean); virtual;
    procedure SetAllowChangePaper(Value: Boolean); virtual;
    procedure SetAllowChangeScale(Value: Boolean); virtual;
    procedure SetAllowCustomPaperSizes(Value: Boolean); virtual;

    procedure DoAfterPrinting; dynamic;
    procedure DoBeforePrinting; dynamic;
    procedure DoDestroy; dynamic;
    function IsSupportedPaper(const APaper: TdxPaperInfo): Boolean; dynamic;
    procedure PageParamsChange(AUpdateCodes: TdxPrinterPageUpdateCodes); dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
   {$IFDEF DELPHI4}
    procedure BeforeDestruction; override;
   {$ENDIF}
    procedure Assign(Source: TPersistent); override;
    procedure DefaultHandler(var Message); override;
    function GetParentComponent: TComponent; override;
    function HasParent: Boolean; override;

    class function OptionsDialogClass: TdxPrintStyleOptionsDialogClass;
    class function OptionsDialogExists: Boolean;
    class function StyleClass: TdxPrintStyleClass;

    procedure AfterPrinting;
    procedure BeforePrinting;

    procedure GetFilteredPapers(AStrings: TStrings);
    function PageSetup: Boolean; {$IFDEF DELPHI4} overload; {$ENDIF}
   {$IFDEF DELPHI4}
    function PageSetup(AActivePageIndex: Integer;
      APreviewBtnClicked, APrintBtnClicked: PBoolean): Boolean; overload;
   {$ENDIF}
    function PageSetupEx(AActivePageIndex: Integer;
      APreviewBtnClicked, APrintBtnClicked: PBoolean): Boolean;
    procedure RestoreDefaults; virtual;
    function SetupOptions: Boolean;

    property BuiltIn: Boolean read FBuiltIn write SetBuiltIn;
    property Data: Pointer read FData write FData;
    property State: TdxPrintStyleStates read FState;
    property StyleManager: TdxPrintStyleManager read FStyleManager write SetStyleManager;
  published
    property AllowChangeHFText: Boolean read GetAllowChangeHFText write SetAllowChangeHFText  
      default True;
    property AllowChangeMargins: Boolean read GetAllowChangeMargins write SetAllowChangeMargins  
      default True;
    property AllowChangeOrientation: Boolean read GetAllowChangeOrientation write SetAllowChangeOrientation
      default True;
    property AllowChangePaper: Boolean read GetAllowChangePaper write SetAllowChangePaper
      default True;
    property AllowChangeScale: Boolean read GetAllowChangeScale write SetAllowChangeScale
      default True;
    property AllowCustomPaperSizes: Boolean read GetAllowCustomPaperSizes write SetAllowCustomPaperSizes
      default True;
    property Description: string read FDescription write FDescription;
    property ImageIndex: Integer read FImageIndex write SetImageIndex;
    property Index: Integer read GetIndex write SetIndex
      stored False;
    property IsCurrentStyle: Boolean read GetIsCurrentStyle write SetIsCurrentStyle
      default False;
    property PrinterPage: TdxPrinterPage read FPrinterPage write SetPrinterPage;
    property ShowPageSetupDlg: Boolean read FShowPageSetupDlg write FShowPageSetupDlg
      stored False;
    property StyleCaption: string read FStyleCaption write SetStyleCaption;
    property StyleGlyph: TBitmap read FStyleGlyph write SetStyleGlyph; {32 x 32}

    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnFilterPaper: TdxFilterPaperEvent read FOnFilterPaper write FOnFilterPaper;
  end;


  TdxPrintStyleManager = class(TComponent)
  private
    FAlreadySaved: Boolean;
    FAutoSave: Boolean;
    FCloneStyleCaptionPrefix: string;
    FCurrentStyle: TBasedxPrintStyle;
    FDesigner: TAbstractdxStyleManagerDesigner;
    FHelpContext: THelpContext;
    FImages: TImageList;
    FInternalStreaming: Boolean;
    FPageSetupDialog: TdxPageSetupDialog;
    FPreviewBtnClicked: Boolean;
    FPrintBtnClicked: Boolean;
    FStorageName: string;
    FStyleList: TList;
    FTitle: string;
    FVersion: Integer;
    FUpdateCount: Integer;
    FWindowHandle: hWnd;

    FOnChangeCurrentStyle: TNotifyEvent;
    FOnStyleListChanged: TNotifyEvent;

    function GetCount: Integer;
    function GetCurrentStyleIndex: Integer;
    function GetStyle(Index: Integer): TBasedxPrintStyle;
    function IsCloneStyleCaptionPrefixStored: Boolean;
    function IsTitleStored: Boolean;
    procedure SetCurrentStyle(Value: TBasedxPrintStyle);
    procedure SetCurrentStyleIndex(Value: Integer);
    procedure SetImages(Value: TImageList);
    procedure SetNewStyleCaption(AStyle: TBasedxPrintStyle; AIndex: Integer);
    procedure SetPageSetupDialog(Value: TdxPageSetupDialog);
    procedure SetStyle(Index: Integer; Value: TBasedxPrintStyle);

    function AllowAutoSave: Boolean;
    procedure DesignerModified;
    procedure DesignerUpdate(AStyle: TBasedxPrintStyle);
    function IsDesigning: Boolean;
    function IsDestroying: Boolean;
    function IsLoading: Boolean;
    procedure InsertStyle(Value: TBasedxPrintStyle);
    procedure MoveStyle(ACurIndex, ANewIndex: Integer);
    procedure RemoveStyle(Value: TBasedxPrintStyle);
    procedure ResyncCurrentStyle(AIndex: Integer);

    procedure WndProc(var Message: TMessage);
  protected
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetChildOrder(Child: TComponent; Order: Integer); override;
    procedure SetName(const NewName: TComponentName); override;

    procedure ChangeCurrentStyle; dynamic;
    procedure PageParamsChange(APrintStyle: TBasedxPrintStyle;
      AUpdateCodes: TdxPrinterPageUpdateCodes); dynamic;
    procedure StyleListChanged; dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function AddStyle(AStyleClass: TdxPrintStyleClass): TBasedxPrintStyle;
    function AddStyleEx(AStyleClass: TdxPrintStyleClass; AOwner: TComponent): TBasedxPrintStyle;
    procedure AssignStyles(Source: TdxPrintStyleManager);
    procedure Clear;
    procedure Delete(Index: Integer);
    procedure DeleteNonBuiltIns;
    function IndexOfStyle(Value: TBasedxPrintStyle): Integer;
    function NonBuiltInsExists: Boolean;
    function StyleByCaption(const ACaption: string): TBasedxPrintStyle;
    function StyleByName(const AName: string): TBasedxPrintStyle;

    function BeginClone(AIndex: Integer): TBasedxPrintStyle;
    procedure EndClone(AStyle: TBasedxPrintStyle);

    procedure BeginUpdate;
    procedure EndUpdate;

    procedure DefinePrintStylesDlg(APreviewBtnClicked, APrintBtnClicked: PBoolean);
    procedure RestoreDefaults;

    procedure LoadFromFile(const AName: string);
    procedure LoadFromStream(AStream: TStream);
    procedure SaveToFile(const AName: string);
    procedure SaveToStream(AStream: TStream);

    property Count: Integer read GetCount;
    property CurrentStyleIndex: Integer read GetCurrentStyleIndex write SetCurrentStyleIndex;
    property Designer: TAbstractdxStyleManagerDesigner read FDesigner; {accessible only in DesignTime}
    property PreviewBtnClicked: Boolean read FPreviewBtnClicked;
    property PrintBtnClicked: Boolean read FPrintBtnClicked;
    property Styles[Index: Integer]: TBasedxPrintStyle read GetStyle write SetStyle; default;
    property UpdateCount: Integer read FUpdateCount;
  published
    property AutoSave: Boolean read FAutoSave write FAutoSave
      default False;
    property CloneStyleCaptionPrefix: string read FCloneStyleCaptionPrefix write FCloneStyleCaptionPrefix
      stored IsCloneStyleCaptionPrefixStored;
    property CurrentStyle: TBasedxPrintStyle read FCurrentStyle write SetCurrentStyle;
    property HelpContext: THelpContext read FHelpContext write FHelpContext;
    property Images: TImageList read FImages write SetImages;
    property PageSetupDialog: TdxPageSetupDialog read FPageSetupDialog write SetPageSetupDialog;
    property StorageName: string read FStorageName write FStorageName;
    property Title: string read FTitle write FTitle
      stored IsTitleStored;
    property Version: Integer read FVersion write FVersion;

    property OnChangeCurrentStyle: TNotifyEvent read FOnChangeCurrentStyle write FOnChangeCurrentStyle;
    property OnStyleListChanged: TNotifyEvent read FOnStyleListChanged write FOnStyleListChanged;
  end;


  TAbstractdxStyleManagerDesigner = class
  private
    FStyleManager: TdxPrintStyleManager;
  protected
    procedure Modified; virtual; abstract;
    procedure Update(AItem: TBasedxPrintStyle); virtual; abstract;
  public
    constructor Create(AStyleManager: TdxPrintStyleManager);
    destructor Destroy; override;

    procedure BeginUpdate; virtual; abstract;
    procedure CancelUpdate; virtual; abstract;
    procedure EndUpdate; virtual; abstract;

    property StyleManager: TdxPrintStyleManager read FStyleManager;
  end;

  TAbstractdxPrintStyleOptionsDialog = class(TForm)
  private
    FModified: Boolean;
    FPrintStyle: TBasedxPrintStyle;

    function GetPrintStyle(AStyleClass: TdxPrintStyleClass): TBasedxPrintStyle;
    procedure SetPrintStyle(Value: TBasedxPrintStyle);
  protected
    procedure CheckModified;
    function GetModified: Boolean; virtual;
    procedure Initialize; virtual;
    procedure UpdateControlsState; virtual;
    procedure SaveOptions; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean;

    property Modified: Boolean read GetModified;
    property PrintStyle: TBasedxPrintStyle read FPrintStyle;
  end;


  { TdxPageSetupDialog }

  TdxCustomDrawPreviewEvent = procedure(APrintStyle: TBasedxPrintStyle;
    ACanvas: TCanvas; APageRect, AContentRect, AHeaderRect, AFooterRect: TRect) of object;

  PdxPageSetupDlgEvents = ^TdxPageSetupDlgEvents;
  TdxPageSetupDlgEvents = packed record
    OnClose: TNotifyEvent;
    OnCustomDrawPreview: TdxCustomDrawPreviewEvent;
    OnShow: TNotifyEvent;
  end;

  PdxPageSetupDlgData = ^TdxPageSetupDlgData;
  TdxPageSetupDlgData = packed record
    PrintStyle: TBasedxPrintStyle;
    ActivePageIndex: Integer;
    Title: string;
    HelpContext: THelpContext;
    HFMode: TdxHFMode;
    ButtonsEnabled: TdxPageSetupDlgButtons;
    ButtonsVisible: TdxPageSetupDlgButtons;
    OptionsEnabled: TdxPageSetupDlgOptions;
    OptionsVisible: TdxPageSetupDlgOptions;
    Events: PdxPageSetupDlgEvents;
    PreviewBtnClicked: Boolean;
    PrintBtnClicked: Boolean;
    iReserved: Integer;
  end;

  TdxPageSetupDialog = class(TComponent)
  private
    FActivePageIndex: Integer;
    FButtonsEnabled: TdxPageSetupDlgButtons;
    FButtonsVisible: TdxPageSetupDlgButtons;
    FHFMode: TdxHFMode;
    FHelpContext: THelpContext;
    FOptionsEnabled: TdxPageSetupDlgOptions;
    FOptionsVisible: TdxPageSetupDlgOptions;
    FPreviewBtnClicked: Boolean;
    FPrintBtnClicked: Boolean;
    FPrintStyle: TBasedxPrintStyle;
    FTitle: string;

    FOnClose: TNotifyEvent;
    FOnCustomDrawPreview: TdxCustomDrawPreviewEvent;
    FOnShow: TNotifyEvent;

    function IsTitleStored: Boolean;
    procedure SetPrintStyle(Value: TBasedxPrintStyle);
    procedure SetTitle(const Value: string);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;

    function Execute: Boolean;
    function RealTitle: string;

    property PreviewBtnClicked: Boolean read FPreviewBtnClicked;
    property PrintBtnClicked: Boolean read FPrintBtnClicked;
  published
    property ActivePageIndex: Integer read FActivePageIndex write FActivePageIndex;
    property ButtonsEnabled: TdxPageSetupDlgButtons read FButtonsEnabled write FButtonsEnabled
      default [psbStyleOptions, psbPreview, psbPrint]; {psbDefault}
    property OptionsEnabled: TdxPageSetupDlgOptions read FOptionsEnabled write FOptionsEnabled
      default [Low(TdxPageSetupDlgOption)..High(TdxPageSetupDlgOption)]; {psoDefaultOptionsEnabled}
    property HFMode: TdxHFMode read FHFMode write FHFMode
      default hfmThreeSections;
    property HelpContext: THelpContext read FHelpContext write FHelpContext;
    property PrintStyle: TBasedxPrintStyle read FPrintStyle write SetPrintStyle;
    property Title: string read FTitle write SetTitle
      stored IsTitleStored;
    property ButtonsVisible: TdxPageSetupDlgButtons read FButtonsVisible write FButtonsVisible
      default [psbStyleOptions, psbPreview, psbPrint]; {psbDefault}
    property OptionsVisible: TdxPageSetupDlgOptions read FOptionsVisible write FOptionsVisible
      default psoDefaultOptionsVisible;

    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnCustomDrawPreview: TdxCustomDrawPreviewEvent
      read FOnCustomDrawPreview write FOnCustomDrawPreview;
    property OnShow: TNotifyEvent read FOnShow write FOnShow;
  end;

  TdxfmPageSetupDialog = class(TCustomdxPSForm)
    pnlStyleName: TPanel;
    lblStyleName: TLabel;
    edStyleName: TEdit;
    ilPageOrder: TImageList;
    fdHeaderFooter: TFontDialog;
    ilPaperTypes: TImageList;
    btnOptions: TButton;
    pmAutoText: TPopupMenu;
    miAutoPage: TMenuItem;
    miAutoUserPageDate: TMenuItem;
    miAutoConfidentialPageDate: TMenuItem;
    miAutoCreatedBy: TMenuItem;
    miAutoCreatedOn: TMenuItem;
    miAutoLastPrinted: TMenuItem;
    pnlButtons: TPanel;
    btnPrintPreview: TButton;
    btnPrint: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    btnHelp: TButton;
    Panel4: TPanel;
    pgctrlMain: TPageControl;
    tshPage: TTabSheet;
    Panel5: TPanel;
    gbxPaper: TGroupBox;
    lblPaperType: TLabel;
    lblPaperDimension: TLabel;
    lblPaperSource: TLabel;
    lblPaperWidth: TLabel;
    lblPaperHeight: TLabel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    bvlPaperWidthHolder: TBevel;
    bvlPaperHeightHolder: TBevel;
    lbxPaperType: TListBox;
    cbxPaperSource: TComboBox;
    Panel1: TPanel;
    gbxOrientation: TGroupBox;
    bvlOrientationHolder: TBevel;
    rBtnLandscape: TRadioButton;
    rBtnPortrait: TRadioButton;
    gbxPrintOrder: TGroupBox;
    pbxPageOrder: TPaintBox;
    rbtnOverThenDown: TRadioButton;
    rbtnDownThenOver: TRadioButton;
    gbxShading: TGroupBox;
    chbxShading: TCheckBox;
    tshMargins: TTabSheet;
    pnlInMargins: TPanel;
    lblPreview: TLabel;
    Bevel12: TBevel;
    bvlPreviewHolder: TBevel;
    Panel14: TPanel;
    gbxMargins: TGroupBox;
    pnlMargins: TPanel;
    lblMarginTop: TLabel;
    lblMarginBottom: TLabel;
    lblMarginLeft: TLabel;
    lblMarginRight: TLabel;
    bvlMarginTopHolder: TBevel;
    bvlMarginBottomHolder: TBevel;
    bvlMarginLeftHolder: TBevel;
    bvlMarginRightHolder: TBevel;
    pnlHFMargins: TPanel;
    lblMarginHeader: TLabel;
    lblMarginFooter: TLabel;
    bvlMarginHeaderHolder: TBevel;
    bvlMarginFooterHolder: TBevel;
    pnlCenterOnPage: TPanel;
    lblCenterOnPage: TLabel;
    Bevel1: TBevel;
    chbxCenterHorz: TCheckBox;
    chbxCenterVert: TCheckBox;
    tshHeaderFooter: TTabSheet;
    Panel7: TPanel;
    pnlBottom: TPanel;
    pnlHFOpt: TPanel;
    gbxFunctions: TGroupBox;
    pnlToolBar: TPanel;
    tbPredefined: TToolBar;
    pnlVertAlignment: TPanel;
    gbxVertAlignment: TGroupBox;
    tbTAVert: TToolBar;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    pnlHeader: TPanel;
    pnlHeaderMemos: TPanel;
    memHeaderLeft: TMemo;
    memHeaderCenter: TMemo;
    memHeaderRight: TMemo;
    pnlHeaderFont: TPanel;
    btnHeaderFont: TButton;
    edHeaderFontInfo: TEdit;
    btnHeaderBackground: TBitBtn;
    pnlHeaderTitle: TPanel;
    lblHeader: TLabel;
    Bevel2: TBevel;
    pnlFooter: TPanel;
    pnlFooterTitle: TPanel;
    lblFooter: TLabel;
    Bevel3: TBevel;
    pnlFooterFont: TPanel;
    btnFooterFont: TButton;
    edFooterFontInfo: TEdit;
    btnFooterBackGround: TBitBtn;
    pnlFooterMemos: TPanel;
    memFooterLeft: TMemo;
    memFooterCenter: TMemo;
    memFooterRight: TMemo;
    pnlReverse: TPanel;
    chbxReverseOnEvenPages: TCheckBox;
    tshScaling: TTabSheet;
    Panel2: TPanel;
    bvlAdjustToHolder: TBevel;
    bvlFitToPageHolder: TBevel;
    lblPagesWideBy: TLabel;
    lblPercentOfNormalSize: TLabel;
    bvlFitToPageTallHolder: TBevel;
    lblTall: TLabel;
    rbtnAdjustTo: TRadioButton;
    rbtnFitTo: TRadioButton;
    bvlMarginsWarningHolder: TBevel;
    Panel3: TPanel;
    btnFix: TButton;
    btnRestoreOriginalMargins: TButton;
    procedure btnHFFontClick(Sender: TObject);
    procedure SpecialInsertClick(Sender: TObject);
    procedure pgctrlMainChange(Sender: TObject);
    procedure BackgroundClick(Sender: TObject);
    procedure VertTextAlignClick(Sender: TObject);
    procedure memHeaderLeftChange(Sender: TObject);
    procedure chbxReverseOnEvenPagesClick(Sender: TObject);
    procedure btnPrintPreviewClick(Sender: TObject);
    procedure lblMarginTopClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure lblPaperSourceClick(Sender: TObject);
    procedure pbxPageOrderPaint(Sender: TObject);
    procedure PageOrderClick(Sender: TObject);
    procedure pbxPageOrderDblClick(Sender: TObject);
    procedure CenterOnPageClick(Sender: TObject);
    procedure OrientationClick(Sender: TObject);
    procedure cbxPaperSourceChange(Sender: TObject);
    procedure lbxPaperTypeClick(Sender: TObject);
    procedure ScalingClick(Sender: TObject);
    procedure cbxPaperSourceDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbxPaperTypeDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MemoChange(Sender: TObject);
    procedure MemoEnter(Sender: TObject);
    procedure MemoExit(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure sbtnAutoTextClick(Sender: TObject);
    procedure AutoTextClick(Sender: TObject);
    procedure edStyleNameChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edStyleNameExit(Sender: TObject);
    procedure chbxShadingClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrlMainChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btnRestoreOriginalMarginsClick(Sender: TObject);
    procedure btnFixClick(Sender: TObject);
    procedure OrientationDblClick(Sender: TObject);
  private
    FbaMarginsWarning: TdxPSBitmapAnimator;
    FbmpMarginsWarning: TBitmap;
    FControlsUpdating: Boolean;
    FilPredefined: TImageList;
    FFooterBkGndGlyph: TBitmap;
    FHeaderBkGndGlyph: TBitmap;
    FHFFunctionList: TStringList;
    FModified: Boolean;
    FMarginsChanged: Boolean;
    FMarginsChanging: Boolean;
    FMarginsInvalid: Boolean;
    FMarginsOutside: Boolean;
    FOrientationPreview: TdxPreview;
    FPaperSizeLocked: Boolean;
    FPreview: TdxPreview;
    FPreviewBtnClicked: Boolean;
    FPrintBtnClicked: Boolean;
    FPrintStyle: TBasedxPrintStyle;
    FSavePrintStyle: TBasedxPrintStyle;
    FStyleManager: TdxPrintStyleManager;

    FOnClose: TNotifyEvent;
    FOnCustomDrawPreview: TdxCustomDrawPreviewEvent;
    FOnShow: TNotifyEvent;

    procedure AdjustToExit(Sender: TObject);
    procedure ChangeBkgndGlyph(AGlyph: TBitmap; ABackground: TdxBackground);
    procedure FitToPageChange(Sender: TObject);
    procedure FitToPageExit(Sender: TObject);
    procedure FitToPageTallExit(Sender: TObject);
    procedure MarginButtonClick(Sender: TObject; ButtonType: TdxButtonType;
      Button: TUDBtnType);
    procedure MarginChange(Sender: TObject);
    procedure MarginExit(Sender: TObject);
    procedure OrientationPreviewCalcPageCount(Sender: TObject);
    procedure PaperHeightButtonClick(Sender: TObject; ButtonType: TdxButtonType;
      Button: TUDBtnType);
    procedure PaperHeightExit(Sender: TObject);
    procedure PaperWidthButtonClick(Sender: TObject; ButtonType: TdxButtonType;
      Button: TUDBtnType);
    procedure PaperWidthExit(Sender: TObject);
    procedure PaperWidthChange(Sender: TObject);
    procedure PaperHeightChange(Sender: TObject);
    procedure PrepareMarginsWarningBitmap(const S: string);
    procedure PreviewCalcPageCount(Sender: TObject);
    procedure PreviewDrawPageContent(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; APageIndex: Integer);
    procedure PreviewAfterDragMargin(Sender: TObject; Margin: TdxPreviewMargin);
    procedure ScaleChanged(Sender: TObject);

    procedure CheckModified;
    procedure CreateControls;
    procedure EnabledMemoAttr(AEnabled: Boolean);
    function FindControlPageIndex(AControl: TWinControl): Integer;
    procedure FixupMargins;
    procedure FixupMarginsOutside;
    function GetEditColor(Value: Boolean): TColor;
    function GetPage: TdxPrinterPage;
    procedure LoadStrings;
    procedure RestoreOriginalMargins;
    procedure SaveMargins;
    procedure SaveUserInput;
    procedure SetMarginsInvalid(Value: Boolean);
    procedure SetMarginsOutside(Value: Boolean);
    procedure SetupDialog(const APageSetupDlgData: TdxPageSetupDlgData);
    procedure ShowWarningHint(AValue, APairValue: Boolean; const AHint, APairHint: string);
    procedure StartSetting;
    procedure TrySetActiveControl(AControl: TWinControl);
    procedure UpdateControlsState;
    procedure UpdateMarginsBounds;
    procedure UpdateMarginsEdits;
    procedure UpdatePageInfos;
    procedure UpdatePreviewMargin(AValue: Extended; AMarginType: TdxPreviewMarginType);
    procedure UpdatePreviewMargins;
    function ValidateMargins(AInvalidMargin: PWinControl): Boolean;
    function ValidateMarginsOutside(AInvalidMargin: PWinControl): Boolean;
    function ValidateStyleCaption: Boolean;
    function ValidateUserInput(var Control: TWinControl): Boolean;

    procedure CMDialogChar(var message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;

    property MarginsInvalid: Boolean read FMarginsInvalid write SetMarginsInvalid;
    property MarginsOutside: Boolean read FMarginsOutside write SetMarginsOutside;
  protected
    procedure CreateWnd; override;
    procedure DoHide; override;
    procedure DoShow; override;
  public
    FseAdjustTo: TdxPSSpinEdit;
    FseFitToPage: TdxPSSpinEdit;
    FseFitToPageTall: TdxPSSpinEdit;
    FseMarginBottom: TdxPSSpinEdit;
    FseMarginFooter: TdxPSSpinEdit;
    FseMarginHeader: TdxPSSpinEdit;
    FseMarginLeft: TdxPSSpinEdit;
    FseMarginRight: TdxPSSpinEdit;
    FseMarginTop: TdxPSSpinEdit;
    FsePaperHeight: TdxPSSpinEdit;
    FsePaperWidth: TdxPSSpinEdit;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function Execute: Boolean;
    procedure SetPrintStyle(Value: TBasedxPrintStyle);

    property Modified: Boolean read FModified;
    property Page: TdxPrinterPage read GetPage;
    property PreviewBtnClicked: Boolean read FPreviewBtnClicked;
    property PrintBtnClicked: Boolean read FPrintBtnClicked;
    property PrintStyle: TBasedxPrintStyle read FPrintStyle;

    property OnCustomDrawPreview: TdxCustomDrawPreviewEvent read FOnCustomDrawPreview write FOnCustomDrawPreview;
  end;


  TdxHFFunctionFormatObjectClass = class of TdxHFFunctionFormatObject;
  TdxHFFunctionFormatObject = class(TObject)
  private
    FCurrentPage: Integer;
    FDateFormat: string;
    FDateTime: TDateTime;
    FMachineName: string;
    FPageNumberFormat: TdxPageNumberFormat;
    FStartPageIndex: Integer;
    FTimeFormat: string;
    FTotalPages: Integer;
    FUserName: string;
  public
    constructor Create;

    property CurrentPage: Integer read FCurrentPage write FCurrentPage;
    property DateFormat: string read FDateFormat write FDateFormat;
    property DateTime: TDateTime read FDateTime write FDateTime;
    property MachineName: string read FMachineName write FMachineName;
    property PageNumberFormat: TdxPageNumberFormat read FPageNumberFormat write FPageNumberFormat;
    property StartPageIndex: Integer read FStartPageIndex write FStartPageIndex;
    property TimeFormat: string read FTimeFormat write FTimeFormat;
    property TotalPages: Integer read FTotalPages write FTotalPages;
    property UserName: string read FUserName write FUserName;
  end;


  TdxHFFunctionCategoryClass = class of TdxHFFunctionUnknownCategory;
  TdxHFFunctionUnknownCategory = class end;
  TdxHFFunctionDateTimeCategory = class(TdxHFFunctionUnknownCategory);
  TdxHFFunctionPagesCategory = class(TdxHFFunctionUnknownCategory);
  TdxHFFunctionAuthenticationCategory = class(TdxHFFunctionUnknownCategory);


  TdxHFConvertFunction = function(const Source: string; const AFormatObject: TdxHFFunctionFormatObject): string;

  TdxHFFunctionClass = class of TdxHFFunction;
  TdxHFFunction = class(TPersistent)
  private
    FGlyph: TBitmap;
    FHint: string;
    FTemplateString: string;
    procedure SetGlyph(Value: Graphics.TBitmap);
    procedure SetTemplateString(const Value: string);
  protected
    function ConvertFunc(const Source: string;
      const FormatObject: TdxHFFunctionFormatObject): string; virtual;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    function DoProcess(const Source: string;
      const AFormatObject: TdxHFFunctionFormatObject): string; virtual;
    class function FunctionClass: TdxHFFunctionClass;
    class function GetCategory: TdxHFFunctionCategoryClass; virtual;
    class function GetName: string; virtual;

    property Glyph: TBitmap read FGlyph write SetGlyph;
    property Hint: string read FHint write FHint;
    property TemplateString: string read FTemplateString write SetTemplateString;
  end;

  TdxHFPagesFunctions = class(TdxHFFunction)
  public
    class function GetCategory: TdxHFFunctionCategoryClass; override;
  end;

  TdxHFPageNumberFunction = class(TdxHFPagesFunctions)
  protected
    function ConvertFunc(const Source: string;
      const FormatObject: TdxHFFunctionFormatObject): string; override;
  public
    constructor Create; override;
    class function GetName: string; override;
  end;

  TdxHFTotalPagesFunction = class(TdxHFPagesFunctions)
  protected
    function ConvertFunc(const Source: string;
      const FormatObject: TdxHFFunctionFormatObject): string; override;
  public
    constructor Create; override;
    class function GetName: string; override;
  end;

  TdxHFPageOfPagesFunction = class(TdxHFPagesFunctions)
  protected
    function ConvertFunc(const Source: string;
      const FormatObject: TdxHFFunctionFormatObject): string; override;
  public
    constructor Create; override;
    class function GetName: string; override;
  end;

  TdxHFAuthenticationFunctions = class(TdxHFFunction)
  public
    class function GetCategory: TdxHFFunctionCategoryClass; override;
  end;

  TdxHFMachineNameFunction = class(TdxHFAuthenticationFunctions)
  protected
    function ConvertFunc(const Source: string;
      const FormatObject: TdxHFFunctionFormatObject): string; override;
  public
    constructor Create; override;
    class function GetName: string; override;
  end;

  TdxHFUserNameFunction = class(TdxHFAuthenticationFunctions)
  protected
    function ConvertFunc(const Source: string;
      const FormatObject: TdxHFFunctionFormatObject): string; override;
  public
    constructor Create; override;
    class function GetName: string; override;
  end;

  TdxHFDateTimeFunctions = class(TdxHFFunction)
  public
    class function GetCategory: TdxHFFunctionCategoryClass; override;
  end;

  TdxHFDateTimeFunction = class(TdxHFDateTimeFunctions)
  protected
    function ConvertFunc(const Source: string;
      const FormatObject: TdxHFFunctionFormatObject): string; override;
  public
    constructor Create; override;
    class function GetName: string; override;
  end;

  TdxHFDateFunction = class(TdxHFDateTimeFunctions)
  protected
    function ConvertFunc(const Source: string;
      const FormatObject: TdxHFFunctionFormatObject): string; override;
  public
    constructor Create; override;
    class function GetName: string; override;
  end;

  TdxHFTimeFunction = class(TdxHFDateTimeFunctions)
  protected
    function ConvertFunc(const Source: string;
      const FormatObject: TdxHFFunctionFormatObject): string; override;
  public
    constructor Create; override;
    class function GetName: string; override;
  end;

  TdxHFFunctionLibrary = class;

  TdxHFFunctionEnumProc = procedure(Sender: TdxHFFunctionLibrary;
    const AHFFunction: TdxHFFunction) of object;

  TdxHFFunctionLibraryClass = class of TdxHFFunctionLibrary;
  TdxHFFunctionLibrary = class(TPersistent)
  private
    FList: TStringList;
    function GetCount: Integer;
    function GetFunction(Index: Integer): TdxHFFunction;
    procedure SetFunction(Index: Integer; Value: TdxHFFunction);
  protected
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    function Add(AFunctionClass: TdxHFFunctionClass): TdxHFFunction;
    procedure Clear;
    procedure Delete(AIndex: Integer);
    procedure Enumerate(Proc: TdxHFFunctionEnumProc); virtual;
    procedure GetFunctions(AStrings: TStrings);
    procedure GetFunctionsByCategory(ACategory: TdxHFFunctionCategoryClass; AStrings: TStrings);
    function IndexOf(const ATemplateString: string): Integer;
    function IndexOfByName(const AFunctionName: string): Integer;
    function IndexOfByClass(AFunctionClass: TdxHFFunctionClass): Integer;
    function ProcessString(const Source: string;
      const FormatObject: TdxHFFunctionFormatObject): string; virtual;

    property Count: Integer read GetCount;
    property Funcs[Index: Integer]: TdxHFFunction read GetFunction write SetFunction; default;
  end;


// TODO: add methods for standard functions: DateTimeFunction, PageNumberFunction and so on.

  TdxStandardHFFunctionLibrary = class(TdxHFFunctionLibrary)
  public
    constructor Create; override;

    function HFDateFunction: TdxHFDateFunction; virtual;
    function HFTimeFunction: TdxHFTimeFunction; virtual;
  end;

function dxProcessHFString(const Source: string): string;
procedure dxGetHFFunctionsList(AStrings: TStrings);
procedure dxGetHFFunctionsListByCategory(ACategory: TdxHFFunctionCategoryClass; AStrings: TStrings);

type
  TdxGetDateTimeFormatsProc = procedure(AStrings: TStrings);

var
  dxGetDateFormatsProc: TdxGetDateTimeFormatsProc = nil;
  dxGetTimeFormatsProc: TdxGetDateTimeFormatsProc = nil;

function DateFormats: TStrings;
function PageNumberFormats: TStrings;
function TimeFormats: TStrings;
procedure RefreshDateFormats;
procedure RefreshTimeFormats;
function GetFormatedDate(const DateTime: TDateTime; const Format: string): string;
procedure GetFormatedDateStrings(const DateTime: TDateTime; DateFormats, FormatedStrings: TStrings);
function GetFormatedTime(const DateTime: TDateTime; const Format: string): string;
procedure GetFormatedTimeStrings(const DateTime: TDateTime; TimeFormats, FormatedStrings: TStrings);

type
  PdxPrintStyleRegItem = ^TdxPrintStyleRegItem;
  TdxPrintStyleRegItem = record
    PrintStyleClass: TdxPrintStyleClass;
    PrintStyleOptionsDialogClass: TdxPrintStyleOptionsDialogClass;
  end;

procedure dxPSRegisterPrintStyle(AStyleClass: TdxPrintStyleClass;
  AOptionsDialogClass: TdxPrintStyleOptionsDialogClass);
procedure dxPSUnregisterPrintStyle(AStyleClass: TdxPrintStyleClass;
  AOptionsDialogClass: TdxPrintStyleOptionsDialogClass);
function dxPSGetPrintStyleOptDlgClass(AStyleClass: TdxPrintStyleClass):
  TdxPrintStyleOptionsDialogClass;
procedure dxPSGetRegisteredPrintStylesList(AStrings: TStrings);

procedure DrawStyleItem(AStyle: TBasedxPrintStyle; AListBox: TListBox;
  Index: Integer; State: TOwnerDrawState; Rect: TRect; AMultiline, ABoldedCurrent: Boolean);
procedure DefaultDrawPagePreview(APrintStyle: TBasedxPrintStyle; ACanvas: TCanvas;
  APageRect, AContentRect, AHeaderRect, AFooterRect: TRect);

function dxPageSetupDialog(const APageSetupDlgData: PdxPageSetupDlgData): Boolean;
function dxPrintStyleOptionsDialog(APrintStyle: TBasedxPrintStyle): Boolean;

const
  dxMaxStyleCaption = 31;
  dxFunctionDelimiters: array[Boolean] of Char = ('[', ']');
  dxHFFunctionLibrary: TdxHFFunctionLibrary = nil;
  dxHFFormatObject: TdxHFFunctionFormatObject = nil;
  dxDefaultPrintStyleClass: TdxPrintStyleClass = nil;

implementation

{$R *.DFM}

uses
  TypInfo, CommCtrl, Consts,
  dxPSRes, dxPSEngn, dxPSEvnt, dxfmMnPg, dxPSUtl, dxPSImgs, dxfmDfnStl;

const
  FPrintStyleList: TList = nil;
  FDateFormats: TStrings = nil;
  FPageNumberFormats: TStrings = nil;
  FTimeFormats: TStrings = nil;

function dxPageSetupDialog(const APageSetupDlgData: PdxPageSetupDlgData): Boolean;
var
  Dialog: TdxfmPageSetupDialog;
begin
  Result := False;
  if (APageSetupDlgData = nil) or (APageSetupDlgData^.PrintStyle = nil) then Exit;
  Dialog := TdxfmPageSetupDialog.Create(nil);
  try
    Dialog.SetupDialog(APageSetupDlgData^);
    Result := Dialog.Execute;
    if Result then
    begin
      if Dialog.Modified then
        APageSetupDlgData^.PrintStyle.Assign(Dialog.FPrintStyle);
      if Dialog.PreviewBtnClicked or Dialog.PrintBtnClicked then
        APageSetupDlgData^.PrintStyle.IsCurrentStyle := True;
    end;
    APageSetupDlgData^.ActivePageIndex := Dialog.pgctrlMain.ActivePage.PageIndex;
    APageSetupDlgData^.PreviewBtnClicked := Dialog.PreviewBtnClicked;
    APageSetupDlgData^.PrintBtnClicked := Dialog.PrintBtnClicked;
  finally
    Dialog.Free;
  end;
end;

function dxPSIndexOfPrintStyleItem(AStyleClass: TdxPrintStyleClass;
  AOptionsDialogClass: TdxPrintStyleOptionsDialogClass): Integer;
var
  RegItem: PdxPrintStyleRegItem;
begin
  Result := -1;
  if FPrintStyleList = nil then 
    Exit;
  for Result := 0 to FPrintStyleList.Count - 1 do
  begin
    RegItem := FPrintStyleList.List^[Result];
    with RegItem^ do
      if (AStyleClass = PrintStyleClass) and (AOptionsDialogClass = PrintStyleOptionsDialogClass) then
        Exit;
  end;
  Result := -1;
end;

procedure dxPSRegisterPrintStyle(AStyleClass: TdxPrintStyleClass;
  AOptionsDialogClass: TdxPrintStyleOptionsDialogClass);
var
  RegItem: PdxPrintStyleRegItem;
begin
  if dxPSIndexOfPrintStyleItem(AStyleClass, AOptionsDialogClass) <> -1 then 
    Exit;
  New(RegItem);
  with RegItem^ do
  begin
    PrintStyleClass := AStyleClass;
    PrintStyleOptionsDialogClass := AOptionsDialogClass;
  end;
  if FPrintStyleList = nil then FPrintStyleList := TList.Create;
  FPrintStyleList.Add(RegItem);
  RegisterClass(AStyleClass);
end;

procedure dxPSUnregisterPrintStyle(AStyleClass: TdxPrintStyleClass;
  AOptionsDialogClass: TdxPrintStyleOptionsDialogClass);
var
  Index: Integer;
begin
  Index := dxPSIndexOfPrintStyleItem(AStyleClass, AOptionsDialogClass);
  if Index <> -1 then
  begin
    Dispose(PdxPrintStyleRegItem(FPrintStyleList.List^[Index]));
    FPrintStyleList.Delete(Index);
    UnregisterClass(AStyleClass);
  end;
end;

procedure dxPSUnregisterAllPrintStyles;
var
  RegItem: PdxPrintStyleRegItem;
begin
  if FPrintStyleList = nil then 
    Exit;
  while FPrintStyleList.Count > 0 do
  begin
    RegItem := FPrintStyleList.Last;
    with RegItem^ do
      dxPSUnregisterPrintStyle(PrintStyleClass, PrintStyleOptionsDialogClass);
  end;
  FPrintStyleList.Free;
  FPrintStyleList := nil;
end;

function dxPSGetPrintStyleOptDlgClass(AStyleClass: TdxPrintStyleClass):
TdxPrintStyleOptionsDialogClass;
var
  I: Integer;
  RegItem: PdxPrintStyleRegItem;
begin
  Result := nil;
  if FPrintStyleList = nil then 
    Exit;
  for I := FPrintStyleList.Count - 1 downto 0 do
  begin
    RegItem := FPrintStyleList.List^[I];
    with RegItem^ do
      if PrintStyleClass = AStyleClass then
      begin
        Result := PrintStyleOptionsDialogClass;
        Exit;
      end;
  end;
  Result := nil;
end;

procedure dxPSGetRegisteredPrintStylesList(AStrings: TStrings);
var
  I: Integer;
  RegItem: PdxPrintStyleRegItem;
begin
  if FPrintStyleList = nil then  
    Exit;
  for I := 0 to FPrintStyleList.Count - 1 do
  begin
    RegItem := FPrintStyleList.List^[I];
    AStrings.AddObject(RegItem^.PrintStyleClass.ClassName, TObject(RegItem));
  end;
end;

{ utility routines }

function MarginsMessageDlg(const message: string): TModalResult;
var
  Form: TForm;
  B: TComponent;
begin
  Form := CreateMessageDialog(message, mtWarning, mbYesNoCancel);
  try
    B := Form.FindComponent(DropAmpersand(SMsgDlgYes));
    if B is TButton then
      with TButton(B) do
      begin
        Form.Width := Form.Width + 3 * Width div 2;
        Width := 3 * Width div 2;
        Caption := sdxBtnFix;
      end;
      
    B := Form.FindComponent(DropAmpersand(SMsgDlgNo));
    if B is TButton then
      with TButton(B) do
      begin
        Left := Left + Width div 2;
        Width := 3 * Width div 2;
        Caption := sdxBtnRestoreOriginal;
      end;
      
    B := Form.FindComponent(DropAmpersand(SMsgDlgCancel));
    if B is TButton then
      with TButton(B) do
      begin
        Left := Left + Width;
        Width := 3 * Width div 2;
        Caption := sdxBtnClose;
      end;
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

function MarginsOutsideMessageDlg(const message: string): TModalResult;
var
  Form: TForm;
  B: TComponent;
begin
  Form := CreateMessageDialog(message, mtWarning, [mbYes, mbIgnore]);
  try
    B := Form.FindComponent(DropAmpersand(SMsgDlgYes));
    if B is TButton then
      TButton(B).Caption := sdxBtnFix;
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;


{ TdxPageSetupDialog }

constructor TdxPageSetupDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FActivePageIndex := 0;
  FButtonsEnabled := psbDefault;
  FOptionsEnabled := psoDefaultOptionsEnabled;
  FHFMode := hfmThreeSections;
  FHelpContext := 0;
  FPreviewBtnClicked := False;
  FPrintBtnClicked := False;
  FPrintStyle := nil;
  FTitle := sdxPageSetupCaption;
  FButtonsVisible := psbDefault;
  FOptionsVisible := psoDefaultOptionsVisible;
end;

procedure TdxPageSetupDialog.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (AComponent = PrintStyle) and (Operation = opRemove) then
    PrintStyle := nil;
end;

function TdxPageSetupDialog.Execute: Boolean;
var
  APageSetupDlgData: TdxPageSetupDlgData;
  APageSetupDlgEvents: TdxPageSetupDlgEvents;
begin
  if PrintStyle = nil then
  begin
    Result := False;
    Exit;
  end;
  FillChar(APageSetupDlgData, SizeOf(TdxPageSetupDlgData), 0);
  FillChar(APageSetupDlgEvents, SizeOf(TdxPageSetupDlgEvents), 0);
  with APageSetupDlgEvents do
  begin
    OnClose := Self.OnClose;
    OnCustomDrawPreview := Self.OnCustomDrawPreview;
    OnShow := Self.OnShow;
  end;
  APageSetupDlgData.Events := @APageSetupDlgEvents;
  APageSetupDlgData.PrintStyle := Self.PrintStyle;
  APageSetupDlgData.HelpContext := Self.HelpContext;
  APageSetupDlgData.Title := Self.RealTitle;
  APageSetupDlgData.ActivePageIndex := ActivePageIndex;

{
  if (csDesigning in ComponentState) then
  begin
    APageSetupDlgData.ButtonsEnabled := psbDefault;
    APageSetupDlgData.ButtonsVisible := psbDefault;
    APageSetupDlgData.OptionsEnabled := psoDefaultOptionsEnabled;
    APageSetupDlgData.OptionsVisible := psoDefaultOptionsVisible;
  end
  else
}
  begin
    APageSetupDlgData.ButtonsEnabled := ButtonsEnabled;
    APageSetupDlgData.ButtonsVisible := ButtonsVisible;
    if not PrintStyle.OptionsDialogExists then
      APageSetupDlgData.ButtonsVisible := APageSetupDlgData.ButtonsVisible - [psbStyleOptions];
    APageSetupDlgData.OptionsEnabled := OptionsEnabled;
    APageSetupDlgData.OptionsVisible := OptionsVisible;
  end;
  APageSetupDlgData.HFMode := HFMode;

  Result := dxPageSetupDialog(@APageSetupDlgData);
  FPreviewBtnClicked := APageSetupDlgData.PreviewBtnClicked;
  FPrintBtnClicked := APageSetupDlgData.PrintBtnClicked;
end;

function TdxPageSetupDialog.RealTitle: string;
begin
  Result := Title;
  if PrintStyle.StyleManager <> nil then
  begin
    if PrintStyle <> nil then
      Result := Result + ': ' + PrintStyle.StyleCaption;
    if Result[Length(Result) - 1] = ':' then
      Delete(Result, Length(Result) - 1, 1);
  end;
end;

procedure TdxPageSetupDialog.SetPrintStyle(Value: TBasedxPrintStyle);
begin
  if FPrintStyle <> Value then
  begin
    FPrintStyle := Value;
    if Value <> nil then Value.FreeNotification(Self);
  end;
end;

procedure TdxPageSetupDialog.SetTitle(const Value: string);
begin
  FTitle := Value;
end;

function TdxPageSetupDialog.IsTitleStored: Boolean;
begin
  Result := AnsiCompareStr(Title, sdxPageSetupCaption) <> 0;
end;


{  TfmdxPageSetup }

constructor TdxfmPageSetupDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  HelpContext := dxPSGlbl.dxhcPageSetupDlg;
  FPreviewBtnClicked := False;
  FPrintBtnClicked := False;
  FFooterBkGndGlyph := TBitmap.Create;
  FFooterBkGndGlyph.Width := 50;
  FFooterBkGndGlyph.Height := (btnHeaderBackGround.Height - 10);
  FHeaderBkGndGlyph := TBitmap.Create;
  FHeaderBkGndGlyph.Width := 50;
  FHeaderBkGndGlyph.Height := (btnFooterBackGround.Height - 10);
  FHFFunctionList := TStringList.Create;
  dxGetHFFunctionsList(FHFFunctionList);
  FbmpMarginsWarning := TBitmap.Create;
  CreateControls;
  LoadStrings;
end;

destructor TdxfmPageSetupDialog.Destroy;
begin
  FbmpMarginsWarning.Free;
  if FHFFunctionList <> nil then FHFFunctionList.Free;
  if FFooterBkGndGlyph <> nil then FFooterBkGndGlyph.Free;
  if FHeaderBkGndGlyph <> nil then FHeaderBkGndGlyph.Free;
  if FPrintStyle <> nil then FPrintStyle.Free;
  inherited Destroy;
end;

procedure TdxfmPageSetupDialog.CreateWnd;
begin
  inherited CreateWnd;
  if Icon.Handle = 0 then
    Icon.Handle := LoadIconFromBitmapRes(DXCP_BMPPAGESETUP);
  SendMessage(Handle, WM_SETICON, 1, Icon.Handle);
end;

procedure TdxfmPageSetupDialog.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  if pgctrlMain.ActivePage = tshMargins then FPreview.Invalidate;
end;

procedure TdxfmPageSetupDialog.DoHide;
begin
  if Assigned(FOnClose) then FOnClose(Self);
  inherited;
end;

procedure TdxfmPageSetupDialog.DoShow;
begin
  inherited;
  if Assigned(FOnShow) then FOnShow(Self);
end;

procedure TdxfmPageSetupDialog.SetPrintStyle(Value: TBasedxPrintStyle);
begin
  if FPrintStyle <> nil then
  begin
    FPrintStyle.Free;
    FPrintStyle := nil;
  end;
  if Value <> nil then
  begin
    FSavePrintStyle := Value;
    FPrintStyle := Value.StyleClass.Create(nil);
    FPrintStyle.Assign(Value);
//    MarginsOutside := not ValidateMarginsOutside(nil);
  end;
end;

function TdxfmPageSetupDialog.GetEditColor(Value: Boolean): TColor;
begin
  if Value then
    Result := clBtnFace
  else
    Result := clWindow;
end;

procedure TdxfmPageSetupDialog.SetupDialog(const APageSetupDlgData: TdxPageSetupDlgData);
var
  W2, I, C: Integer;
begin
  FControlsUpdating := True;

  // very important because TabVisible don't works properly without this line
  pgctrlMain.HandleNeeded;

  SetPrintStyle(APageSetupDlgData.PrintStyle);
  FStyleManager := FSavePrintStyle.StyleManager;

  Caption := APageSetupDlgData.Title;
  HelpContext := APageSetupDlgData.HelpContext;

  FOnShow := APageSetupDlgData.Events^.OnShow;
  FOnClose := APageSetupDlgData.Events^.OnClose;
  OnCustomDrawPreview := APageSetupDlgData.Events^.OnCustomDrawPreview;

  btnOptions.Enabled := psbStyleOptions in APageSetupDlgData.ButtonsEnabled;
  btnPrintPreview.Enabled := psbPreview in APageSetupDlgData.ButtonsEnabled;
  btnPrint.Enabled := psbPrint in APageSetupDlgData.ButtonsEnabled;
  btnOptions.Visible := psbStyleOptions in APageSetupDlgData.ButtonsVisible;
  btnPrintPreview.Visible := psbPreview in APageSetupDlgData.ButtonsVisible;
  btnPrint.Visible := psbPrint in APageSetupDlgData.ButtonsVisible;
  if not btnPrint.Visible and btnPrintPreview.Visible then
    btnPrintPreview.BoundsRect := btnPrint.BoundsRect;

  pnlStyleName.Visible := psoStyleCaption in APageSetupDlgData.OptionsVisible;
  if not pnlStyleName.Visible then
    Self.Height := Self.Height - pnlStyleName.Height;

  rBtnPortrait.Checked := PrintStyle.PrinterPage.Orientation = poPortrait;
  rBtnLandscape.Checked := PrintStyle.PrinterPage.Orientation = poLandscape;

  gbxPrintOrder.Visible := psoPageOrder in APageSetupDlgData.OptionsVisible;
  gbxShading.Visible := psoShading in APageSetupDlgData.OptionsVisible;

  gbxMargins.Visible := psoMargins in APageSetupDlgData.OptionsVisible;
  if psoMargins in APageSetupDlgData.OptionsVisible then
    FPreview.OptionsView := FPreview.OptionsView + [povMargins]
  else
    FPreview.OptionsView := FPreview.OptionsView - [povMargins];

  pnlHFMargins.Visible :=
    gbxMargins.Visible and (psoHFMargins in APageSetupDlgData.OptionsVisible);
  if povMargins in FPreview.OptionsView then
  begin
    FPreview.Margins[pmHeader].Visible := pnlHFMargins.Visible;
    FPreview.Margins[pmFooter].Visible := pnlHFMargins.Visible;
  end;
  if not pnlHFMargins.Visible and gbxMargins.Visible then
    gbxMargins.Height := gbxMargins.Height - pnlHFMargins.Height;

  pnlCenterOnPage.Visible := psoCenterOnPage in APageSetupDlgData.OptionsVisible;
  tshMargins.TabVisible := gbxMargins.Visible or pnlCenterOnPage.Visible;

  btnHeaderFont.Visible := psoHFFont in APageSetupDlgData.OptionsVisible;
  edHeaderFontInfo.Visible := psoHFFont in APageSetupDlgData.OptionsVisible;
  btnHeaderBackground.Visible := psoHFBackground in APageSetupDlgData.OptionsVisible;
  if btnHeaderBackground.Visible and not btnHeaderFont.Visible then
  begin
    btnHeaderBackground.Left := btnHeaderFont.Left;
    btnHeaderBackground.Top := btnHeaderFont.Top;
  end;
  pnlHeaderFont.Visible := btnHeaderFont.Visible or btnHeaderBackGround.Visible;
  pnlHeaderMemos.Visible := (psoHFText in APageSetupDlgData.OptionsVisible);
  if not pnlHeaderMemos.Visible then
    pnlHeader.Height := pnlHeader.Height - pnlHeaderMemos.Height;
  if pnlHeaderMemos.Visible and (APageSetupDlgData.HFMode = hfmOneSection) then
  begin
    memHeaderCenter.Visible := False;
    memHeaderRight.Visible := False;
  end;
  pnlHeader.Visible := pnlHeaderFont.Visible or pnlHeaderMemos.Visible;

  btnFooterFont.Visible := (psoHFFont in APageSetupDlgData.OptionsVisible);
  edFooterFontInfo.Visible := (psoHFFont in APageSetupDlgData.OptionsVisible);
  btnFooterBackground.Visible := (psoHFBackground in APageSetupDlgData.OptionsVisible);
  if btnFooterBackground.Visible and not btnFooterFont.Visible then
  begin
    btnFooterBackground.Left := btnFooterFont.Left;
    btnFooterBackground.Top := btnFooterFont.Top;
  end;

  pnlFooterFont.Visible := btnHeaderFont.Visible or btnHeaderBackGround.Visible;

  pnlFooterMemos.Visible := (psoHFText in APageSetupDlgData.OptionsVisible);
  if not pnlFooterMemos.Visible then
    pnlFooter.Height := pnlFooter.Height - pnlFooterMemos.Height;

  if pnlFooterMemos.Visible and (APageSetupDlgData.HFMode = hfmOneSection) then
  begin
    memFooterCenter.Visible := False;
    memFooterRight.Visible := False;
  end;
  pnlFooter.Visible := pnlFooterFont.Visible or pnlFooterMemos.Visible;

  pnlToolBar.Visible := (psoHFFunctions in APageSetupDlgData.OptionsVisible);
//  pnlAutoText.Visible := (psoHFAutoText in APageSetupDlgData.OptionsVisible);
  gbxFunctions.Visible := pnlToolBar.Visible; // or pnlAutoText.Visible;
  pnlVertAlignment.Visible := (psoHFVertAlignment in APageSetupDlgData.OptionsVisible);
  pnlHFOpt.Visible := gbxFunctions.Visible or pnlVertAlignment.Visible;
  pnlReverse.Visible := (psoHFReverse in APageSetupDlgData.OptionsVisible);

  tshHeaderFooter.TabVisible :=
    pnlHeader.Visible or pnlFooter.Visible or pnlHFOpt.Visible or pnlReverse.Visible;
  tshScaling.TabVisible := PrintStyle.AllowChangeScale;

  if pnlStyleName.Visible then
  begin
    pnlStyleName.Enabled :=
      not FSavePrintStyle.BuiltIn; // or (csDesigning in FSavePrintStyle.ComponentState);
    edStyleName.ReadOnly := not pnlStyleName.Enabled;
    edStyleName.TabStop := not edStyleName.ReadOnly;
    edStyleName.Color := GetEditColor(edStyleName.ReadOnly);
    edStyleName.MaxLength := dxMaxStyleCaption;
  end;

  lbxPaperType.Enabled := PrintStyle.AllowChangePaper;
  lbxPaperType.Color := GetEditColor(not lbxPaperType.Enabled);

  rBtnPortrait.Enabled := PrintStyle.AllowChangeOrientation;
  rBtnLandscape.Enabled := PrintStyle.AllowChangeOrientation;

  if gbxPrintOrder.Visible then
  begin
    gbxPrintOrder.Enabled := (psoPageOrder in APageSetupDlgData.OptionsEnabled);
    rbtnDownThenOver.Enabled := gbxPrintOrder.Enabled;
    rbtnOverThenDown.Enabled := gbxPrintOrder.Enabled;
  end;
  if gbxShading.Visible then
  begin
    gbxShading.Enabled := (psoShading in APageSetupDlgData.OptionsEnabled);
    chbxShading.Enabled := gbxShading.Enabled;
  end;

  if gbxMargins.Visible then
  begin
    gbxMargins.Enabled :=
      PrintStyle.AllowChangeMargins and (psoMargins in APageSetupDlgData.OptionsEnabled);

    for I := 0 to pnlMargins.ControlCount - 1 do
      if pnlMargins.Controls[I] is TLabel then
        pnlMargins.Controls[I].Enabled := gbxMargins.Enabled
      else
        if (pnlMargins.Controls[I] is TdxPSSpinEdit) then
          with TdxPSSpinEdit(pnlMargins.Controls[I]) do
          begin
            ReadOnly := not gbxMargins.Enabled;
            TabStop := not ReadOnly;
            Color := GetEditColor(ReadOnly);
          end;
  end;

  if gbxMargins.Enabled then
    FPreview.OptionsBehavior := FPreview.OptionsBehavior + [pobAllowDragMargins]
  else
    FPreview.OptionsBehavior := FPreview.OptionsBehavior - [pobAllowDragMargins];

  if pnlHFMargins.Visible then
  begin
    pnlHFMargins.Enabled :=
      gbxMargins.Enabled and (psoHFMargins in APageSetupDlgData.OptionsEnabled);

    for I := 0 to pnlHFMargins.ControlCount - 1 do
      if (pnlHFMargins.Controls[I] is TLabel) then
        pnlHFMargins.Controls[I].Enabled := pnlHFMargins.Enabled
      else
        if (pnlHFMargins.Controls[I] is TdxPSSpinEdit) then
          with TdxPSSpinEdit(pnlHFMargins.Controls[I]) do
          begin
            ReadOnly := not pnlHFMargins.Enabled;
            TabStop := not ReadOnly;
            Color := GetEditColor(ReadOnly);
          end;
  end;
  FPreview.Margins[pmHeader].Enabled := pnlHFMargins.Enabled;
  FPreview.Margins[pmFooter].Enabled := pnlHFMargins.Enabled;

  if pnlCenterOnPage.Visible then
  begin
    pnlCenterOnPage.Enabled := (psoCenterOnPage in APageSetupDlgData.OptionsEnabled);
    for I := 0 to pnlCenterOnPage.ControlCount - 1 do
      pnlCenterOnPage.Controls[I].Enabled := pnlCenterOnPage.Enabled;
  end;

  if btnHeaderFont.Visible then
    btnHeaderFont.Enabled := (psoHFFont in APageSetupDlgData.OptionsEnabled);
  if btnHeaderBackground.Visible then
    btnHeaderBackground.Enabled := (psoHFBackground in APageSetupDlgData.OptionsEnabled);

  if pnlHeaderMemos.Visible then
  begin
    pnlHeaderMemos.Enabled :=
      PrintStyle.AllowChangeHFText and (psoHFText in APageSetupDlgData.OptionsEnabled);
    memHeaderLeft.ReadOnly := not pnlHeaderMemos.Enabled;
    memHeaderLeft.TabStop := not memHeaderLeft.ReadOnly;
    memHeaderLeft.Color := GetEditColor(memHeaderLeft.ReadOnly);
    memHeaderCenter.ReadOnly := not pnlHeaderMemos.Enabled;
    memHeaderCenter.TabStop := not memHeaderCenter.ReadOnly;
    memHeaderCenter.Color := GetEditColor(memHeaderCenter.ReadOnly);
    memHeaderRight.ReadOnly := not pnlHeaderMemos.Enabled;
    memHeaderRight.TabStop := not memHeaderRight.ReadOnly;
    memHeaderRight.Color := GetEditColor(memHeaderRight.ReadOnly);
  end;

  if btnFooterFont.Visible then
    btnFooterFont.Enabled := (psoHFFont in APageSetupDlgData.OptionsEnabled);
  if btnFooterBackground.Visible then
    btnFooterBackground.Enabled := (psoHFBackground in APageSetupDlgData.OptionsEnabled);
  if pnlFooterMemos.Visible then
  begin
    pnlFooterMemos.Enabled := PrintStyle.AllowChangeHFText and
      (psoHFText in APageSetupDlgData.OptionsEnabled);
    memFooterLeft.ReadOnly := not pnlFooterMemos.Enabled;
    memFooterLeft.TabStop := not memFooterLeft.ReadOnly;
    memFooterLeft.Color := GetEditColor(memFooterLeft.ReadOnly);
    memFooterCenter.ReadOnly := not pnlFooterMemos.Enabled;
    memFooterCenter.TabStop := not memFooterCenter.ReadOnly;
    memFooterCenter.Color := GetEditColor(memFooterCenter.ReadOnly);
    memFooterRight.ReadOnly := not pnlFooterMemos.Enabled;
    memFooterRight.TabStop := not memFooterRight.ReadOnly;
    memFooterRight.Color := GetEditColor(memFooterRight.ReadOnly);
  end;

  if pnlToolBar.Visible then
  begin
    pnlToolBar.Enabled := (psoHFFunctions in APageSetupDlgData.OptionsEnabled);
    with tbPredefined do
    begin
      while (ButtonCount > 0) do
        Buttons[0].Free;
      if (FHFFunctionList.Count > 0) then
      begin
        FilPredefined := TImageList.Create(Self);
        FilPredefined.AllocBy := FHFFunctionList.Count;
        for I := 0 to FHFFunctionList.Count - 1 do
          with TdxHFFunction(FHFFunctionList.Objects[I]) do
            if Assigned(Glyph) and not Glyph.Empty then
              FilPredefined.AddMasked(Glyph, Glyph.Canvas.Pixels[0, Glyph.Height - 1]);
        Images := FilPredefined;
        W2 := ButtonWidth * FHFFunctionList.Count + 4;
        if (W2 > Parent.Width - 4) then
        begin
          W2 := Parent.Width - 4;
          C := (W2 - 4) div ButtonWidth;
          W2 := C * ButtonWidth + 4;
        end
        else
          C := FHFFunctionList.Count;
        Width := W2;
        Left := (Parent.Width - Width) div 2;
        for I := 0 to C - 1 do
          with TToolButton.Create(Self) do
          begin
            Parent := tbPredefined;
            Tag := I;
            ImageIndex := Tag;
            Hint := TdxHFFunction(FHFFunctionList.Objects[I]).Hint;
            OnClick := SpecialInsertClick;
          end;
      end
      else
        Visible := False;
      Parent.Visible := Visible;
    end;
  end;

{ if pnlMacroses.Visible then
    pnlMacroses.Enabled := (psoHFMacroses in APageSetupDlgData.OptionsEnabled);
}

  if pnlVertAlignment.Visible then
    pnlVertAlignment.Enabled := (psoHFVertAlignment in APageSetupDlgData.OptionsEnabled);

  if pnlReverse.Visible then
    chbxReverseOnEvenPages.Enabled := (psoHFReverse in APageSetupDlgData.OptionsEnabled);

  if tshScaling.TabVisible then
  begin
    rbtnAdjustTo.Enabled := tshScaling.Enabled;
    rbtnFitTo.Enabled := tshScaling.Enabled;
    rbtnFitTo.Enabled := tshScaling.Enabled;
    lblPercentOfNormalSize.Enabled := tshScaling.Enabled;
    lblPagesWideBy.Enabled := tshScaling.Enabled;
    lblTall.Enabled := tshScaling.Enabled;
    FseFitToPage.Enabled := tshScaling.Enabled;
    FseAdjustTo.Enabled := tshScaling.Enabled;

    rbtnAdjustTo.Checked := PrintStyle.PrinterPage.ScaleMode = smAdjust;
    rbtnFitTo.Checked := PrintStyle.PrinterPage.ScaleMode = smFit;
    TdxPSSpinEdit(FseAdjustTo).AsInteger := PrintStyle.PrinterPage.ScaleFactor;
    TdxPSSpinEdit(FseFitToPage).AsInteger := PrintStyle.PrinterPage.FitToPagesByWide;
    TdxPSSpinEdit(FseFitToPage).AsInteger := PrintStyle.PrinterPage.FitToPagesByTall;
  end;

  case Page.GetInnerMeasurementUnits of
    muInches:
      begin
        FsePaperWidth.LegendText := sdxUnitsInches;
        FsePaperHeight.LegendText := sdxUnitsInches;
        FseMarginTop.LegendText := sdxUnitsInches;
        FseMarginLeft.LegendText := sdxUnitsInches;
        FseMarginRight.LegendText := sdxUnitsInches;
        FseMarginBottom.LegendText := sdxUnitsInches;
        FseMarginHeader.LegendText := sdxUnitsInches;
        FseMarginFooter.LegendText := sdxUnitsInches;
        if Page.Orientation = poPortrait then
        begin
          FsePaperWidth.MinValue := dxPrintDevice.MinExtentX / 254;
          FsePaperWidth.MaxValue := dxPrintDevice.MaxExtentX / 254;
          FsePaperHeight.MinValue := dxPrintDevice.MinExtentY / 254;
          FsePaperHeight.MaxValue := dxPrintDevice.MaxExtentY / 254;
        end
        else {dxpoLandscape}
        begin
          FsePaperWidth.MinValue := dxPrintDevice.MinExtentY / 254;
          FsePaperWidth.MaxValue := dxPrintDevice.MaxExtentY / 254;
          FsePaperHeight.MinValue := dxPrintDevice.MinExtentX / 254;
          FsePaperHeight.MaxValue := dxPrintDevice.MaxExtentX / 254;
        end;
      end;

    muMillimeters:
      begin
        FsePaperWidth.LegendText := sdxUnitsMillimeters;
        FsePaperHeight.LegendText := sdxUnitsMillimeters;
        FseMarginTop.LegendText := sdxUnitsMillimeters;
        FseMarginLeft.LegendText := sdxUnitsMillimeters;
        FseMarginRight.LegendText := sdxUnitsMillimeters;
        FseMarginBottom.LegendText := sdxUnitsMillimeters;
        FseMarginHeader.LegendText := sdxUnitsMillimeters;
        FseMarginFooter.LegendText := sdxUnitsMillimeters;
        if Page.Orientation = poPortrait then
        begin
          FsePaperWidth.MinValue := dxPrintDevice.MinExtentX / 10;
          FsePaperWidth.MaxValue := dxPrintDevice.MaxExtentX / 10;
          FsePaperHeight.MinValue := dxPrintDevice.MinExtentY / 10;
          FsePaperHeight.MaxValue := dxPrintDevice.MaxExtentY / 10;
        end
        else
        begin
          FsePaperWidth.MinValue := dxPrintDevice.MinExtentY / 10;
          FsePaperWidth.MaxValue := dxPrintDevice.MaxExtentY / 10;
          FsePaperHeight.MinValue := dxPrintDevice.MinExtentX / 10;
          FsePaperHeight.MaxValue := dxPrintDevice.MaxExtentX / 10;
        end;
      end;
  end;

  FsePaperWidth.ReadOnly := not PrintStyle.AllowCustomPaperSizes;
  FsePaperWidth.TabStop := not FsePaperWidth.ReadOnly;
  FsePaperWidth.Color := GetEditColor(FsePaperWidth.ReadOnly);
  FsePaperHeight.ReadOnly := not PrintStyle.AllowCustomPaperSizes;
  FsePaperHeight.TabStop := not FsePaperHeight.ReadOnly;
  FsePaperHeight.Color := GetEditColor(FsePaperHeight.ReadOnly);

  with pgctrlMain do
  begin
    I := APageSetupDlgData.ActivePageIndex;
    if I < 0 then I := 0;
    if I > PageCount - 1 then I := PageCount - 1;
    if not Pages[I].TabVisible then I := 0;
    ActivePage := Pages[I];
  end;

  FControlsUpdating := False;

  if pssCopy in FSavePrintStyle.State then CheckModified;
end;

procedure TdxfmPageSetupDialog.ChangeBkgndGlyph(AGlyph: TBitmap; ABackground: TdxBackground);
var
  DC: hDC;
  R: TRect;
  PrevColor: COLORREF;
  PrevFontColor: COLORREF;
  PrevFont: HFONT;
  s: string;
  Brush: HBRUSH;
begin
  DC := AGlyph.Canvas.Handle;
  PrevFont := SelectObject(DC, Font.Handle);
  PrevFontColor := SetTextColor(DC, ColorToRGB(Font.Color));
  R := Rect(0, 0, AGlyph.Width, AGlyph.Height);
  FrameRect(DC, R, GetSysColorBrush(COLOR_BTNFACE));
  InflateRect(R, -1, -1);
  case ABackground.Mode of
    bmNone:
      begin
        PrevColor := SetBkColor(DC, GetSysColor(COLOR_BTNFACE));
        S := '[' + DropAmpersand(sdxBtnNoFill) + ']';
        ExtTextOut(DC, 1, 1, ETO_OPAQUE, @R, PChar(S), Length(S), nil);
        SetBkColor(DC, PrevColor);
      end;

    bmBrush:
      begin
        FrameRect(DC, R, GetSysColorBrush(COLOR_BTNSHADOW));
        InflateRect(R, -1, -1);
        PrevColor := SetBkColor(DC, ColorToRGB(ABackground.BkColor));
        Brush := CreateSolidBrush(ColorToRGB(ABackground.Brush.Color));
        FillRect(DC, R, Brush);
        DeleteObject(Brush);
        SetBkColor(DC, PrevColor);
      end;

    bmBrushBitmap:
      begin
        FrameRect(DC, R, GetSysColorBrush(COLOR_BTNSHADOW));
        InflateRect(R, -1, -1);
        Brush := CreatePatternBrush(TBitmap(ABackground.Picture).Handle);
        FillRect(DC, R, Brush);
        DeleteObject(Brush);
      end;

    bmPicture:
      begin
        PrevColor := SetBkColor(DC, GetSysColor(COLOR_BTNFACE));
        S := '(' + DropAmpersand(sdxPicture) + ')';
        ExtTextOut(DC, 1, 1, ETO_OPAQUE, @R, PChar(S), Length(S), nil);
        SetBkColor(DC, PrevColor);
      end;
  end;
  SetTextColor(DC, PrevFontColor);
  SelectObject(DC, PrevFont);
end;

procedure TdxfmPageSetupDialog.CreateControls;
begin
  FseAdjustTo := TdxPSSpinEdit.Create(Self);
  with FseAdjustTo do
  begin
    Parent := tshScaling;
    BoundsRect := bvlAdjustToHolder.BoundsRect;
    Increment := 1;
    PageIncrement := 10;
    MinValue := 10;
    MaxValue := 500;
    TabOrder := rbtnAdjustTo.TabOrder + 1;
    OnChange := ScaleChanged;
    OnExit := AdjustToExit;
  end;
  FseFitToPage := TdxPSSpinEdit.Create(Self);
  with FseFitToPage do
  begin
    Parent := tshScaling;
    BoundsRect := bvlFitToPageHolder.BoundsRect;
    Increment := 1;
    PageIncrement := 10;
    MinValue := 1;
    MaxValue := 100;
    TabOrder := rbtnFitTo.TabOrder + 1;
    OnChange := FitToPageChange;
    OnExit := FitToPageExit;
  end;
  lblPagesWideBy.FocusControl := FseFitToPage;
  FseFitToPageTall := TdxPSSpinEdit.Create(Self);
  with FseFitToPageTall do
  begin
    Parent := tshScaling;
    BoundsRect := bvlFitToPageTallHolder.BoundsRect;
    Increment := 1;
    PageIncrement := 10;
    MinValue := 1;
    MaxValue := 100;
    TabOrder := rbtnFitTo.TabOrder + 2;
    OnChange := FitToPageChange;
    OnExit := FitToPageTallExit;
  end;
  lblTall.FocusControl := FseFitToPageTall;

  FsePaperWidth := TdxPSSpinEdit.Create(Self);
  with FsePaperWidth do
  begin
    Parent := gbxPaper;
    BoundsRect := bvlPaperWidthHolder.BoundsRect;
    ValueType := svtFloat;
    Decimal := 2;
    Increment := 0.1;
    PageIncrement := 1.0;
    TabOrder := lbxPaperType.TabOrder + 1;
    OnButtonClick := PaperWidthButtonClick;
    OnChange := PaperWidthChange;
    OnExit := PaperWidthExit;
    lblPaperWidth.FocusControl := FsePaperWidth;
  end;
  FsePaperHeight := TdxPSSpinEdit.Create(Self);
  with FsePaperHeight do
  begin
    Parent := gbxPaper;
    BoundsRect := bvlPaperHeightHolder.BoundsRect;
    LegendText := FsePaperWidth.LegendText;
    ValueType := svtFloat;
    Decimal := 2;
    Increment := 0.1;
    PageIncrement := 1.0;
    TabOrder := lbxPaperType.TabOrder + 2;
    OnButtonClick := PaperHeightButtonClick;
    OnChange := PaperHeightChange;
    OnExit := PaperHeightExit;
    lblPaperHeight.FocusControl := FsePaperHeight;
  end;

  FseMarginTop := TdxPSSpinEdit.Create(Self);
  with FseMarginTop do
  begin
    Parent := pnlMargins;
    BoundsRect := bvlMarginTopHolder.BoundsRect;
    LegendText := FsePaperHeight.LegendText;
    ValueType := svtFloat;
    Decimal := 2;
    Increment := 0.1;
    PageIncrement := 1;
    Tag := 1;
    OnButtonClick := MarginButtonClick;
    OnChange := MarginChange;
    OnExit := MarginExit;
    lblMarginTop.FocusControl := FseMarginTop;
  end;
  FseMarginBottom := TdxPSSpinEdit.Create(Self);
  with FseMarginBottom do
  begin
    Parent := pnlMargins;
    BoundsRect := bvlMarginBottomHolder.BoundsRect;
    LegendText := FsePaperHeight.LegendText;
    ValueType := svtFloat;
    Decimal := 2;
    Increment := 0.1;
    PageIncrement := 1;
    Tag := 3;
    OnButtonClick := MarginButtonClick;
    OnChange := MarginChange;
    OnExit := MarginExit;
    lblMarginBottom.FocusControl := FseMarginBottom;
  end;
  FseMarginLeft := TdxPSSpinEdit.Create(Self);
  with FseMarginLeft do
  begin
    Parent := pnlMargins;
    BoundsRect := bvlMarginLeftHolder.BoundsRect;
    LegendText := FsePaperHeight.LegendText;
    ValueType := svtFloat;
    Decimal := 2;
    Increment := 0.1;
    PageIncrement := 1;
    Tag := 0;
    OnButtonClick := MarginButtonClick;
    OnChange := MarginChange;
    OnExit := MarginExit;
    lblMarginLeft.FocusControl := FseMarginLeft;
  end;
  FseMarginRight := TdxPSSpinEdit.Create(Self);
  with FseMarginRight do
  begin
    Parent := pnlMargins;
    BoundsRect := bvlMarginRightHolder.BoundsRect;
    LegendText := FsePaperHeight.LegendText;
    ValueType := svtFloat;
    Decimal := 2;
    Increment := 0.1;
    Tag := 2;
    OnButtonClick := MarginButtonClick;
    OnChange := MarginChange;
    OnExit := MarginExit;
    lblMarginRight.FocusControl := FseMarginRight;
  end;
  FseMarginHeader := TdxPSSpinEdit.Create(Self);
  with FseMarginHeader do
  begin
    Parent := pnlHFMargins;
    BoundsRect := bvlMarginHeaderHolder.BoundsRect;
    LegendText := FsePaperHeight.LegendText;
    ValueType := svtFloat;
    Decimal := 2;
    Increment := 0.1;
    PageIncrement := 1;
    Tag := 5;
    OnButtonClick := MarginButtonClick;
    OnChange := MarginChange;
    OnExit := MarginExit;
    lblMarginHeader.FocusControl := FseMarginHeader;
  end;
  FseMarginFooter := TdxPSSpinEdit.Create(Self);
  with FseMarginFooter do
  begin
    Parent := pnlHFMargins;
    BoundsRect := bvlMarginFooterHolder.BoundsRect;
    LegendText := FsePaperHeight.LegendText;
    ValueType := svtFloat;
    Decimal := 2;
    Increment := 0.1;
    Tag := 6;
    OnButtonClick := MarginButtonClick;
    OnChange := MarginChange;
    OnExit := MarginExit;
    lblMarginFooter.FocusControl := FseMarginFooter;
  end;

  FOrientationPreview := TdxPreview.Create(Self);
  with FOrientationPreview do
  begin
    Parent := gbxOrientation;
    Enabled := False;
    BoundsRect := bvlOrientationHolder.BoundsRect;
    Color := clBtnFace;
    ZoomMode := pzmPages;
    PageXCount := 1;
    ScrollBars := ssNone;
    OptionsHint := OptionsHint - [pohShowForMargins, pohShowOnDrag];
    OptionsView := OptionsView - [povPageSelection, povMargins];
    LookAndFeel := plfFlat;
    OptionsZoom := OptionsZoom - [pozZoomOnClick];
    MinHeaderSize := 0;
    MinFooterSize := 0;
    Margins[pmFooter].Value := 0;
    Margins[pmBottom].Value := 0;
    Margins[pmLeft].Value := 0;
    Margins[pmHeader].Value := 0;
    Margins[pmTop].Value := 0;
    Margins[pmRight].Value := 0;
    MinUsefulSize := Point(0, 0);
    BorderStyle := bsNone;
    OnCalcPageCount := OrientationPreviewCalcPageCount;
  end;

  FPreview := TdxPreview.Create(Self);
  with FPreview do
  begin
    Parent := pnlInMargins;
    BoundsRect := bvlPreviewHolder.BoundsRect;
    OptionsZoom := OptionsZoom - [pozZoomOnClick];
    OptionsView := OptionsView - [povPageSelection];
    MinHeaderSize := 0;
    MinFooterSize := 0;
    Margins[pmGutter].Visible := False;
    ScrollBars := ssNone;
    ZoomMode := pzmPages;
    OnCalcPageCount := PreviewCalcPageCount;
    OnDrawPageContent := PreviewDrawPageContent;
    OnAfterDragMargin := PreviewAfterDragMargin;
  end;

  FbaMarginsWarning := TdxPSBitmapAnimator.Create(Self);
  with FbaMarginsWarning do
  begin
    Parent := Panel14;
    BoundsRect := bvlMarginsWarningHolder.BoundsRect;
    Visible := True;
  end;
end;

procedure TdxfmPageSetupDialog.LoadStrings;
begin
  btnOK.Caption := sdxBtnOK;
  btnCancel.Caption := sdxBtnCancel;
  btnHelp.Caption := sdxBtnHelp;
  btnPrint.Caption := sdxBtnPrint;
  btnPrintPreview.Caption := sdxBtnPrintPreview;
  btnOptions.Caption := sdxBtnOptions;

  lblStyleName.Caption := sdxStyleName;

  tshPage.Caption := sdxPage;
  tshMargins.Caption := sdxMargins;
  tshHeaderFooter.Caption := sdxHeaderFooter;
  tshScaling.Caption := sdxScaling;

  gbxPaper.Caption := sdxPaper;
  lblPaperType.Caption := sdxPaperType;
  lblPaperDimension.Caption := sdxPaperDimension;
  lblPaperWidth.Caption := sdxPaperWidth;
  lblPaperHeight.Caption := sdxPaperHeight;
  lblPaperSource.Caption := sdxPaperSource;

  gbxOrientation.Caption := sdxOrientation;
  rBtnPortrait.Caption := sdxPortrait;
  rBtnLandscape.Caption := sdxLandscape;
  gbxPrintOrder.Caption := sdxPrintOrder;
  rbtnDownThenOver.Caption := sdxDownThenOver;
  rbtnOverThenDown.Caption := sdxOverThenDown;
  gbxShading.Caption := sdxShading;
  chbxShading.Caption := sdxPrintUsingGrayShading;

  lblMarginTop.Caption := sdxTop;
  lblMarginLeft.Caption := sdxLeft;
  lblMarginRight.Caption := sdxRight;
  lblMarginBottom.Caption := sdxBottom;
  lblMarginHeader.Caption := sdxHeader2;
  lblMarginFooter.Caption := sdxFooter2;
  btnFix.Caption := sdxBtnFix;
  btnRestoreOriginalMargins.Caption := sdxBtnRestoreOriginal;

  lblCenterOnPage.Caption := sdxCenterOnPage;
  chbxCenterHorz.Caption := sdxHorizontally;
  chbxCenterVert.Caption := sdxVertically;

  lblPreview.Caption := DropAmpersand(sdxPreview);

  lblHeader.Caption := sdxHeader;
  btnHeaderFont.Caption := sdxBtnHeaderFont;
  btnHeaderBackground.Caption := sdxBtnHeaderBackground;
  lblFooter.Caption := sdxFooter;
  btnFooterFont.Caption := sdxBtnFooterFont;
  btnFooterBackground.Caption := sdxBtnFooterBackground;

  gbxVertAlignment.Caption := sdxVertAlignment;
  chbxReverseOnEvenPages.Caption := sdxReverseOnEvenPages;

  rbtnAdjustTo.Caption := sdxAdjustTo;
  rbtnFitTo.Caption := sdxFitTo;
  lblPercentOfNormalSize.Caption := sdxPercentOfNormalSize;
  lblPagesWideBy.Caption := sdxPagesWideBy;
  lblTall.Caption := sdxTall;
end;

procedure TdxfmPageSetupDialog.PaperWidthExit(Sender: TObject);
begin
  UpdatePageInfos;
end;

procedure TdxfmPageSetupDialog.PaperWidthChange(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  CheckModified;
end;

procedure TdxfmPageSetupDialog.PaperHeightButtonClick(Sender: TObject;
  ButtonType: TdxButtonType; Button: TUDBtnType);
begin
  UpdatePageInfos;
end;

procedure TdxfmPageSetupDialog.PaperWidthButtonClick(Sender: TObject;
  ButtonType: TdxButtonType; Button: TUDBtnType);
begin
  UpdatePageInfos;
end;

procedure TdxfmPageSetupDialog.PaperHeightExit(Sender: TObject);
begin
  UpdatePageInfos;
end;

procedure TdxfmPageSetupDialog.UpdatePageInfos;
var
  I: Integer;
begin
  Page.RealPageSize := Point(Round(1000 * FsePaperWidth.Value), Round(1000 * FsePaperHeight.Value));
  FPreview.OriginalPageSize.Point := Page.PageSizeLoMetric;
  FOrientationPreview.OriginalPageSize.Point := Page.PageSizeLoMetric;
  UpdateMarginsBounds;
  FPaperSizeLocked := True;
  try
    with lbxPaperType do
      for I := 0 to Items.Count - 1 do
        if TdxPaperInfo(Items.Objects[I]).DMPaper = Page.DMPaper then
        begin
          ItemIndex := I;
          Break;
        end;
  finally
    FPaperSizeLocked := False;
  end;
end;

procedure TdxfmPageSetupDialog.PaperHeightChange(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  CheckModified;
end;

procedure TdxfmPageSetupDialog.AdjustToExit(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  rbtnAdjustTo.Checked := True;
  PrintStyle.PrinterPage.ScaleFactor := fseAdjustTo.AsInteger;
end;

procedure TdxfmPageSetupDialog.ScaleChanged(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  rbtnAdjustTo.Checked := True;
  ActiveControl := TWinControl(Sender);
  CheckModified;
end;

procedure TdxfmPageSetupDialog.FitToPageChange(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  rbtnFitTo.Checked := True;
  ActiveControl := TWinControl(Sender);
  CheckModified;
end;

procedure TdxfmPageSetupDialog.FitToPageExit(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  PrintStyle.PrinterPage.FitToPagesByWide := FseFitToPage.AsInteger;
end;

procedure TdxfmPageSetupDialog.FitToPageTallExit(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  PrintStyle.PrinterPage.FitToPagesByTall := FseFitToPageTall.AsInteger;
end;

procedure TdxfmPageSetupDialog.UpdateControlsState;
begin
  FControlsUpdating := True;
  try
//    btnOK.Enabled := FModified;
    btnPrintPreview.Enabled := True;
    btnPrint.Enabled := True;
    btnOptions.Enabled := PrintStyle.OptionsDialogExists;
    btnFix.Enabled := MarginsOutside or MarginsInvalid;
    btnRestoreOriginalMargins.Enabled := gbxMargins.Enabled and FMarginsChanged;
  finally
    FControlsUpdating := False;
  end
end;

procedure TdxfmPageSetupDialog.CheckModified;
begin
  if not FModified then FModified := True;
  UpdateControlsState;
end;

function TdxfmPageSetupDialog.GetPage: TdxPrinterPage;
begin
  if PrintStyle <> nil then
    Result := PrintStyle.PrinterPage
  else
    Result := nil
end;

procedure TdxfmPageSetupDialog.StartSetting;

  procedure SetupPapers;
  var
    I: Integer;
  begin
    lbxPaperType.Items.BeginUpdate;
    try
      lbxPaperType.Clear;
      PrintStyle.GetFilteredPapers(lbxPaperType.Items);
      if lbxPaperType.Items.Count > 0 then
      begin
        if not PrintStyle.AllowCustomPaperSizes then
          for I := lbxPaperType.Items.Count - 1 downto 0 do
          // if (Pos('Custom', TdxPaperInfo(lbxPaperType.Items.Objects[I]).Name) <> 0) then
            if TdxPaperInfo(lbxPaperType.Items.Objects[I]).DMPaper >= DMPAPER_USER then
              lbxPaperType.Items.Delete(I);

        for I := 0 to lbxPaperType.Items.Count - 1 do
          if PrintStyle.PrinterPage.DMPaper = TdxPaperInfo(lbxPaperType.Items.Objects[I]).DMPaper then
          begin
            lbxPaperType.ItemIndex := I;
            Break;
          end;

        if lbxPaperType.ItemIndex = -1 then
          if not PrintStyle.AllowCustomPaperSizes then
            lbxPaperType.ItemIndex := 0
          else
          begin
            I := 0;
            //TdxPaperInfo(lbxPaperType.Items.Objects[I]).DMPaper < DMPAPER_USER
            while (I < lbxPaperType.Items.Count) and (Pos('Custom', lbxPaperType.Items[I]) = 0) do
              Inc(I);
            if (I < lbxPaperType.Items.Count) then
              lbxPaperType.ItemIndex := I
            else
              lbxPaperType.ItemIndex := 0;
          end;
      end;
    finally
      lbxPaperType.Items.EndUpdate;
    end;
    if lbxPaperType.Enabled then
      lbxPaperType.Enabled := lbxPaperType.Items.Count > 0;
  end;

  procedure SetupBins;
  var
    I: Integer;
  begin
    with cbxPaperSource do
    begin
      Items.BeginUpdate;
      try
        Items.Clear;
        if dxPrintDevice.Bins <> nil then
          Items := dxPrintDevice.Bins;
        Enabled := Items.Count > 0;
        if Enabled then
        begin
          I := Items.IndexOfObject(TObject(Page.PaperSource));
          if I <> -1 then
            ItemIndex := I
          else
            ItemIndex := 0;
        end;
      finally
        Items.EndUpdate;
      end;
    end;
  end;

begin
  FControlsUpdating := True;
  try
    SetupPapers;
    if lbxPaperType.Items.Count > 0 then lbxPaperTypeClick(lbxPaperType);
    SetupBins;
    ChangeBkgndGlyph(FHeaderBkgndGlyph, Page.PageHeader.Background);
    btnHeaderBackGround.Glyph := FHeaderBkgndGlyph;
    ChangeBkgndGlyph(FFooterBkgndGlyph, Page.PageFooter.Background);
    btnFooterBackGround.Glyph := FFooterBkgndGlyph;
    edStyleName.Text := System.Copy(FSavePrintStyle.StyleCaption, 1, edStyleName.MaxLength);

    chbxShading.Checked := PrintStyle.PrinterPage.GrayShading;

    EnabledMemoAttr(False);
    UpdateMarginsEdits;
    with Page do
    begin
      FPreview.MeasurementUnits := TdxPreviewMeasurementUnits(MeasurementUnits);
      FPreview.MinUsefulSize := Point(MinPrintableAreaLoMetric, MinPrintableAreaLoMetric);
      FPreview.Orientation := TdxPreviewPaperOrientation(Orientation);
      FPreview.Margins[pmHeader].Value := HeaderLoMetric;
      FPreview.Margins[pmFooter].Value := FooterLoMetric;
      with MarginsLoMetric do
      begin
        FPreview.Margins[pmLeft].Value := Left;
        FPreview.Margins[pmTop].Value := Top;
        FPreview.Margins[pmRight].Value := Right;
        FPreview.Margins[pmBottom].Value := Bottom;
      end;
      FOrientationPreview.MeasurementUnits := TdxPreviewMeasurementUnits(MeasurementUnits);
      FOrientationPreview.Orientation := TdxPreviewPaperOrientation(Orientation);

      chbxCenterHorz.Checked := PrintStyle.PrinterPage.CenterOnPageH;
      chbxCenterVert.Checked := PrintStyle.PrinterPage.CenterOnPageV;
      rbtnDownThenOver.Checked := (PrintStyle.PrinterPage.PageOrder = poDownThenOver);
      rbtnOverThenDown.Checked := (PrintStyle.PrinterPage.PageOrder = poOverThenDown);

      memHeaderLeft.Lines := PageHeader.LeftTitle;
      memHeaderCenter.Lines := PageHeader.CenterTitle;
      memHeaderRight.Lines := PageHeader.RightTitle;
      memFooterLeft.Lines := PageFooter.LeftTitle;
      memFooterCenter.Lines := PageFooter.CenterTitle;
      memFooterRight.Lines := PageFooter.RightTitle;
      FontInfoToText(PageHeader.Font, edHeaderFontInfo);
      FontInfoToText(PageFooter.Font, edFooterFontInfo);

      rbtnAdjustTo.Checked := ScaleMode = smAdjust;
      rbtnFitTo.Checked := ScaleMode = smFit;
      TdxPSSpinEdit(FseAdjustTo).AsInteger := ScaleFactor;
      TdxPSSpinEdit(FseFitToPage).AsInteger := FitToPagesByWide;
      TdxPSSpinEdit(FseFitToPageTall).AsInteger := FitToPagesByTall;
      chbxReverseOnEvenPages.Checked := ReverseTitlesOnEvenPages;
    end;
    btnHelp.Visible := (HelpContext <> 0);
    if (HelpContext = 0) then
    begin
      btnOK.BoundsRect := btnCancel.BoundsRect;
      btnCancel.BoundsRect := btnHelp.BoundsRect;
    end;
  finally
    FControlsUpdating := False;
    UpdateControlsState;
  end;

  if (FStyleManager <> nil) and edStyleName.CanFocus then
    ActiveControl := edStyleName
  else
    if pgctrlMain.ActivePage.PageIndex = 0 then
    begin
      if lbxPaperType.CanFocus then ActiveControl := lbxPaperType
    end
    else
      if pgctrlMain.ActivePage.PageIndex = 1 then
        if FseMarginTop.CanFocus and not FseMarginTop.ReadOnly then
          ActiveControl := FseMarginTop;
end;

procedure TdxfmPageSetupDialog.UpdateMarginsBounds;
var
  APrevValue: Boolean;
begin
  APrevValue := FControlsUpdating;
  if not APrevValue then FControlsUpdating := True;
  try
    with Page do
    begin
      FseMarginHeader.MinValue := MinMargins.Top / 1000;
      FseMarginHeader.MaxValue := (RealPageSize.Y - MinPrintableArea - MinMargins.Bottom) / 1000;
      FseMarginFooter.MinValue := MinMargins.Bottom / 1000;
      FseMarginFooter.MaxValue := (RealPageSize.Y - MinPrintableArea - MinMargins.Top) / 1000;
      FseMarginTop.MinValue := MinMargins.Top / 1000;
      FseMarginTop.MaxValue := (RealPageSize.Y - MinPrintableArea - MinMargins.Bottom) / 1000;
      FseMarginBottom.MinValue := MinMargins.Bottom / 1000;
      FseMarginBottom.MaxValue := (RealPageSize.Y - MinPrintableArea - MinMargins.Top) / 1000;
      FseMarginLeft.MinValue := MinMargins.Left / 1000;
      FseMarginLeft.MaxValue := (RealPageSize.X - MinPrintableArea - MinMargins.Right) / 1000;
      FseMarginRight.MinValue := MinMargins.Right / 1000;
      FseMarginRight.MaxValue := (RealPageSize.X - MinPrintableArea - MinMargins.Left) / 1000;
    end;
  finally
    if not APrevValue then FControlsUpdating := False;
  end;
end;

function TdxfmPageSetupDialog.Execute: Boolean;
begin
  Result := False;
  if PrintStyle = nil then Exit;
  StartSetting;
  Result := ShowModal = mrOk;// and FModified;
end;

procedure TdxfmPageSetupDialog.CMDialogChar(var message: TCMDialogChar);
var
  I: Integer;
begin
  inherited;
  with pgctrlMain do
    for I := 0 to PageCount - 1 do
      if IsAccel(message.CharCode, Pages[I].Caption) then
      begin
        message.Result := 1;
        ActivePage := Pages[I];
        Exit;
      end;
end;

const
  uFormat: array[Boolean] of UINT = (DT_WORDBREAK, DT_SINGLELINE or DT_VCENTER);
  CalcFormat = DT_CALCRECT or DT_SINGLELINE or DT_NOPREFIX or DT_CENTER or DT_VCENTER;

procedure TdxfmPageSetupDialog.PrepareMarginsWarningBitmap(const S: string);
var
  R, R2: TRect;
  DC: hDC;
  FrameColor, InteriorColor, TextColor: COLORREF;
begin
  FrameColor := {COLOR_WINDOWTEXT{} COLOR_BTNSHADOW;
  InteriorColor := {COLOR_BTNSHADOW{} COLOR_INFOBK;
  TextColor := {COLOR_WINDOW{} COLOR_INFOTEXT;
  R := Rect(0, 0, bvlMarginsWarningHolder.Width, bvlMarginsWarningHolder.Height);
  FbmpMarginsWarning.Width := R.Right - R.Left;
  FbmpMarginsWarning.Height := R.Bottom - R.Top;
  DC := FbmpMarginsWarning.Canvas.Handle;
  FrameRect(DC, R, GetSysColorBrush(FrameColor));
  InflateRect(R, -1, -1);
  FillRect(DC, R, HBRUSH(InteriorColor + 1));
  ilPaperTypes.Draw(FbmpMarginsWarning.Canvas, 2,
    R.Top + (R.Bottom - R.Top - ilPaperTypes.Height) div 2, 7);
  InflateRect(R, -1, -1);
  R.Left := 2 + R.Left + ilPaperTypes.Width + 2;
  SetBkMode(DC, TRANSPARENT);
  SetTextColor(DC, GetSysColor(TextColor));
  R2 := R;
  DrawText(DC, PChar(S), Length(S), R, CalcFormat);
  DrawText(DC, PChar(S), Length(S), R2,
    DT_NOPREFIX or DT_CENTER or uFormat[(R.Right - R.Left) < (R2.Right - R2.Left)]);
  FbaMarginsWarning.Bitmap := FbmpMarginsWarning;
end;

procedure TdxfmPageSetupDialog.SetMarginsInvalid(Value: Boolean);
begin
  if (FMarginsInvalid <> Value) then
  begin
    FMarginsInvalid := Value;
    ShowWarningHint(MarginsInvalid, MarginsOutside, sdxInvalidMargins, sdxOutsideMargins);
    FPreview.InvalidatePages;
  end;
end;

procedure TdxfmPageSetupDialog.SetMarginsOutside(Value: Boolean);
begin
  if (FMarginsOutside <> Value) then
  begin
    FMarginsOutside := Value;
    ShowWarningHint(MarginsOutside, MarginsInvalid, sdxOutsideMargins, sdxInvalidMargins);
  end;
end;

procedure TdxfmPageSetupDialog.ShowWarningHint(AValue, APairValue: Boolean;
  const AHint, APairHint: string);
begin
  if AValue then
  begin
    PrepareMarginsWarningBitmap(AHint);
    if FbaMarginsWarning.State then
      FbaMarginsWarning.Invalidate
    else
    begin
      if (ActiveControl <> btnOK) and (ActiveControl <> btnCancel) and
        (ActiveControl <> pgctrlMain)
        then
        Beep;
      FbaMarginsWarning.State := True;
    end;
  end
  else
    if APairValue then
    begin
      PrepareMarginsWarningBitmap(APairHint);
      if FbaMarginsWarning.State then
      begin
        Beep;
        FbaMarginsWarning.Invalidate
      end
      else
        FbaMarginsWarning.State := True
    end
    else
      FbaMarginsWarning.State := False;
end;

procedure TdxfmPageSetupDialog.MarginExit(Sender: TObject);
begin
  if FMarginsChanging then Exit;
  FMarginsChanging := True;
  try
    MarginsInvalid := not ValidateMargins(nil);
    MarginsOutside := not ValidateMarginsOutside(nil);
    if not MarginsInvalid then UpdatePreviewMargins;
  finally
    FMarginsChanging := False;
  end;
  UpdateControlsState;
end;

procedure TdxfmPageSetupDialog.MarginButtonClick(Sender: TObject;
  ButtonType: TdxButtonType; Button: TUDBtnType);
begin
  MarginExit(Sender);
  CheckModified;
end;

procedure TdxfmPageSetupDialog.MarginChange(Sender: TObject);
begin
  if FControlsUpdating or FMarginsChanging then Exit;
  FMarginsChanged := True;
  CheckModified;
end;

procedure TdxfmPageSetupDialog.btnHFFontClick(Sender: TObject);
var
  FontDlg: TFontDialog;
  T: Integer;
begin
  FontDlg := TFontDialog.Create(Self);
  try
    if dxInitPrintDevice(False) then
      FontDlg.Device := fdPrinter
    else
      FontDlg.Device := fdScreen;
    FontDlg.Options := FontDlg.Options + [fdScalableOnly];
    T := TComponent(Sender).Tag;
    if T = 0 then
      FontDlg.Font := Page.PageHeader.Font
    else
      FontDlg.Font := Page.PageFooter.Font;
    if FontDlg.Execute then
    begin
      if T = 0 then
      begin
        Page.PageHeader.Font := FontDlg.Font;
        FontInfoToText(Page.PageHeader.Font, edHeaderFontInfo);
      end
      else
      begin
        Page.PageFooter.Font := FontDlg.Font;
        FontInfoToText(Page.PageFooter.Font, edFooterFontInfo);
      end;
      CheckModified;
    end;
  finally
    FontDlg.Free;
  end;
end;

procedure TdxfmPageSetupDialog.SpecialInsertClick(Sender: TObject);
begin
  if (ActiveControl is TCustomMemo) then
  begin
    with TCustomMemo(ActiveControl) do
      SelText := FHFFunctionList[TComponent(Sender).Tag];
    CheckModified;
  end;
end;

procedure TdxfmPageSetupDialog.MemoExit(Sender: TObject);
begin
  if not (ActiveControl is TCustomMemo) then
    EnabledMemoAttr(False);
  with TCustomMemo(Sender) do
    if (Tag < 3) then
      Page.PageHeader.Titles[TdxPageTitlePart(Tag)].Text := Text
    else
      Page.PageFooter.Titles[TdxPageTitlePart(Tag - 3)].Text := Text;
end;

procedure TdxfmPageSetupDialog.MemoEnter(Sender: TObject);
begin
  EnabledMemoAttr(True);
  with TCustomMemo(Sender) do
    if Tag < 3 then
      tbTAVert.Buttons[Integer(Page.PageHeader.TextAlignY[TdxPageTitlePart(Tag)])].Down := True
    else
      tbTAVert.Buttons[Integer(Page.PageFooter.TextAlignY[TdxPageTitlePart(Tag - 3)])].Down := True;
end;

procedure TdxfmPageSetupDialog.pgctrlMainChange(Sender: TObject);
begin
  EnabledMemoAttr(False);
end;

procedure TdxfmPageSetupDialog.EnabledMemoAttr(AEnabled: Boolean);
var
  I: Integer;
begin
  tbPredefined.Enabled := AEnabled;
  for I := 0 to tbPredefined.ButtonCount - 1 do
    tbPredefined.Buttons[I].Enabled := AEnabled;
  tbTAVert.Enabled := AEnabled;
  for I := 0 to tbTAVert.ButtonCount - 1 do
    tbTAVert.Buttons[I].Enabled := AEnabled;
end;

procedure TdxfmPageSetupDialog.BackgroundClick(Sender: TObject);
var
  Pt: TPoint;
  T: Integer;
  ABackground: TdxBackground;
  AParams: TdxBackgroundDlgData;
begin
  Pt := TWinControl(Sender).ClientOrigin;
  Inc(Pt.Y, TWinControl(Sender).Height);
  FillChar(AParams, SizeOf(TdxBackgroundDlgData), 0);
  with AParams do
  begin
    BorderStyle := bsNone;
    NoBtnCaption := sdxBtnNoFill;
    ShowFillEffects := True;
    ShowMoreColors := True;
  end;
  T := TComponent(Sender).Tag;
  if T = 0 then
    ABackground := Page.PageHeader.Background
  else
    ABackground := Page.PageFooter.Background;
  if dxChooseBackgroundDlg(ABackground, Pt, @AParams) then
  begin
    if T = 0 then
    begin
      ChangeBkgndGlyph(FHeaderBkgndGlyph, ABackground);
      TBitBtn(Sender).Glyph := FHeaderBkgndGlyph;
    end
    else
    begin
      ChangeBkgndGlyph(FFooterBkgndGlyph, ABackground);
      TBitBtn(Sender).Glyph := FFooterBkgndGlyph;
    end;
    CheckModified;
  end;
end;

procedure TdxfmPageSetupDialog.VertTextAlignClick(Sender: TObject);
var
  AControl: TCustomMemo;
begin
  if (ActiveControl is TCustomMemo) then
  begin
    AControl := TCustomMemo(ActiveControl);
    if (AControl.Tag < 3) {Header} then
      Page.PageHeader.TextAlignY[TdxPageTitlePart(AControl.Tag)] :=
        TdxTextAlignY(TToolButton(Sender).Tag)
    else {footer}
      Page.PageFooter.TextAlignY[TdxPageTitlePart(AControl.Tag - 3)] :=
        TdxTextAlignY(TToolButton(Sender).Tag);
    CheckModified;
  end;
end;

procedure TdxfmPageSetupDialog.memHeaderLeftChange(Sender: TObject);
begin
  CheckModified;
  TWinControl(Sender).Invalidate;
end;

procedure TdxfmPageSetupDialog.chbxReverseOnEvenPagesClick(Sender: TObject);
begin
  if FControlsUpdating then exit;
  PrintStyle.PrinterPage.ReverseTitlesOnEvenPages := TCheckBox(Sender).Checked;
  CheckModified;
end;

procedure TdxfmPageSetupDialog.btnPrintPreviewClick(Sender: TObject);
begin
  FModified := True;
  FPreviewBtnClicked := True;
  ModalResult := mrOK
end;

procedure TdxfmPageSetupDialog.btnPrintClick(Sender: TObject);
begin
  FModified := True;
  FPrintBtnClicked := True;
  ModalResult := mrOK;
end;

procedure TdxfmPageSetupDialog.OrientationPreviewCalcPageCount(Sender: TObject);
begin
  TdxPreview(Sender).PageCount := 1;
end;

procedure TdxfmPageSetupDialog.PreviewCalcPageCount(Sender: TObject);
begin
  TdxPreview(Sender).PageCount := 1;
end;

procedure TdxfmPageSetupDialog.PreviewDrawPageContent(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; APageIndex: Integer);
var
  AContentRect, AFooterRect, AHeaderRect: TRect;
begin
  with TdxPreview(Sender) do
  begin
    AContentRect := Rect(ARect.Left + Margins[pmLeft].VisibleValue,
      ARect.Top + Margins[pmTop].VisibleValue,
      ARect.Right - Margins[pmRight].VisibleValue,
      ARect.Bottom - Margins[pmBottom].VisibleValue);
    AFooterRect := Rect(ARect.Left + Margins[pmLeft].VisibleValue,
      ARect.Bottom - Margins[pmFooter].VisibleValue,
      ARect.Right - Margins[pmRight].VisibleValue,
      ARect.Bottom - Margins[pmBottom].VisibleValue);
    AHeaderRect := Rect(ARect.Left + Margins[pmLeft].VisibleValue,
      ARect.Top + Margins[pmHeader].VisibleValue,
      ARect.Right - Margins[pmRight].VisibleValue,
      ARect.Top + Margins[pmTop].VisibleValue);

    if ValidateMargins(nil) then
      OptionsView := OptionsView + [povMargins]
    else
      OptionsView := OptionsView - [povMargins];

    if (povMargins in OptionsView) then
    begin
      Margins[pmGutter].Visible := False;
      if Assigned(FOnCustomDrawPreview) then
        FOnCustomDrawPreview(PrintStyle, ACanvas, ARect, AContentRect, AHeaderRect, AFooterRect)
      else
        DefaultDrawPagePreview(PrintStyle, ACanvas, ARect, AContentRect, AHeaderRect, AFooterRect);
    end;
  end;
end;

procedure TdxfmPageSetupDialog.PreviewAfterDragMargin(Sender: TObject;
  Margin: TdxPreviewMargin);
var
  V: Extended;
begin
  case Page.GetInnerMeasurementUnits of
    muInches: V := Margin.Value / 254;
    muMillimeters: V := Margin.Value / 10;
  else
    V := 0;
  end;
  if (Margin.MarginType in [pmHeader, pmFooter]) then
    FMarginsChanging := True;
  try
    case Margin.MarginType of
      pmLeft:
        begin
          FseMarginLeft.Value := V;
          MarginExit(FseMarginLeft);
        end;
      pmTop:
        begin
          FseMarginTop.Value := V;
          MarginExit(FseMarginTop);
        end;
      pmRight:
        begin
          FseMarginRight.Value := V;
          MarginExit(FseMarginRight);
        end;
      pmBottom:
        begin
          FseMarginBottom.Value := V;
          MarginExit(FseMarginBottom);
        end;
      pmHeader:
        begin
          FseMarginHeader.Value := V;
          if (FseMarginTop.Value < FseMarginHeader.Value) then
            FseMarginTop.Value := FseMarginHeader.Value;
          FMarginsChanged := True;
        end;
      pmFooter:
        begin
          FseMarginFooter.Value := V;
          if (FseMarginBottom.Value < FseMarginFooter.Value) then
            FseMarginBottom.Value := FseMarginFooter.Value;
          FMarginsChanged := True;
        end;
    end;
  finally
    if (Margin.MarginType in [pmHeader, pmFooter]) then
    begin
      FMarginsChanging := False;
      if (Margin.MarginType = pmHeader) then
        MarginExit(FseMarginHeader)
      else
        MarginExit(FseMarginBottom);
    end;
  end;
end;

procedure TdxfmPageSetupDialog.lblMarginTopClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
end;

procedure TdxfmPageSetupDialog.lblPaperSourceClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  TComboBox(ActiveControl).DroppedDown := True;
end;

procedure TdxfmPageSetupDialog.pbxPageOrderPaint(Sender: TObject);
const
  uStyles: array[Boolean] of UINT = (ILD_BLEND50 or ILD_BLEND, ILD_NORMAL);
begin
  ImageList_DrawEx(ilPageOrder.Handle, Integer(not rbtnDownThenOver.Checked),
    TPaintBox(Sender).Canvas.Handle, 0, 0, 0, 0, CLR_NONE, CLR_NONE,
    uStyles[gbxPrintOrder.Enabled]);
end;

procedure TdxfmPageSetupDialog.PageOrderClick(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  PrintStyle.PrinterPage.PageOrder := TdxPageOrder(TRadioButton(Sender).Tag);
  pbxPageOrder.Invalidate;
  CheckModified;
end;

procedure TdxfmPageSetupDialog.pbxPageOrderDblClick(Sender: TObject);
begin
  rbtnDownThenOver.Checked := not rbtnDownThenOver.Checked;
  rbtnOverThenDown.Checked := not rbtnDownThenOver.Checked;
end;

procedure TdxfmPageSetupDialog.chbxShadingClick(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  PrintStyle.PrinterPage.GrayShading := TCheckBox(Sender).Checked;
  CheckModified;
end;

procedure TdxfmPageSetupDialog.CenterOnPageClick(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  with TCheckBox(Sender) do
    if (Tag = 0) then
      PrintStyle.PrinterPage.CenterOnPageH := Checked
    else
      PrintStyle.PrinterPage.CenterOnPageV := Checked;
  CheckModified;
  FPreview.InvalidatePages;
end;

procedure TdxfmPageSetupDialog.OrientationClick(Sender: TObject);
var
  T: Integer;
  V, W, H: Extended;
begin
  if FControlsUpdating then Exit;
  T := TComponent(Sender).Tag;
  FPreview.Orientation := TdxPreviewPaperOrientation(T);
  FOrientationPreview.Orientation := TdxPreviewPaperOrientation(T);
  SaveMargins;
  Page.Orientation := TdxPrinterOrientation(T);

  W := FsePaperWidth.Value;
  H := FsePaperHeight.Value;
  V := FsePaperWidth.MaxValue;
  FsePaperWidth.MaxValue := FsePaperHeight.MaxValue;
  FsePaperHeight.MaxValue := V;
  V := FsePaperWidth.MinValue;
  FsePaperWidth.MinValue := FsePaperHeight.MinValue;
  FsePaperHeight.MinValue := V;
  FsePaperWidth.Value := H;
  FsePaperHeight.Value := W;

  UpdateMarginsEdits;
  CheckModified;
end;

procedure TdxfmPageSetupDialog.OrientationDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TdxfmPageSetupDialog.UpdateMarginsEdits;
begin
  UpdateMarginsBounds;
  with Page do
  begin
    FseMarginHeader.Value := Header / 1000;
    FseMarginFooter.Value := Footer / 1000;
    FseMarginTop.Value := Margins.Top / 1000;
    FseMarginBottom.Value := Margins.Bottom / 1000;
    FseMarginLeft.Value := Margins.Left / 1000;
    FseMarginRight.Value := Margins.Right / 1000;
  end;
  if not FControlsUpdating then
  begin
    MarginExit(FseMarginHeader);
    MarginExit(FseMarginFooter);
    MarginExit(FseMarginTop);
    MarginExit(FseMarginBottom);
    MarginExit(FseMarginLeft);
    MarginExit(FseMarginRight);
  end;
end;

procedure TdxfmPageSetupDialog.cbxPaperSourceChange(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  with TComboBox(Sender) do
    Page.PaperSource := Integer(Items.Objects[ItemIndex]);
  CheckModified;
end;

procedure TdxfmPageSetupDialog.lbxPaperTypeClick(Sender: TObject);
var
  P: TPoint;
  Ind: Integer;
begin
  if FPaperSizeLocked then Exit;
  Ind := TListBox(Sender).ItemIndex;
  with TdxPaperInfo(TListBox(Sender).Items.Objects[Ind]) do
    P := Point(Width, Height);
  FPreview.OriginalPageSize.Point := P;
  FOrientationPreview.OriginalPageSize.Point := P;
  Page.DMPaper := TdxPaperInfo(dxPrintDevice.Papers.Objects[Ind]).DMPaper;
  FsePaperWidth.Value := Page.RealPageSize.X / 1000;
  FsePaperHeight.Value := Page.RealPageSize.Y / 1000;
  UpdateMarginsBounds;
  if not FControlsUpdating then CheckModified;
end;

procedure TdxfmPageSetupDialog.ScalingClick(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  case TComponent(Sender).Tag of
    0:
      begin
        PrintStyle.PrinterPage.ScaleMode := smAdjust;
        ActiveControl := FseAdjustTo;
      end;
    1:
      begin
        PrintStyle.PrinterPage.ScaleMode := smFit;
        if FseFitToPage.Enabled then
          ActiveControl := FseFitToPage
        else if FseFitToPageTall.Enabled then
          ActiveControl := FseFitToPageTall;
      end;
  end;
  CheckModified;
end;

procedure TdxfmPageSetupDialog.MemoChange(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  CheckModified;
end;

procedure TdxfmPageSetupDialog.cbxPaperSourceDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with TComboBox(Control) do
  begin
    Canvas.FillRect(Rect);
    InflateRect(Rect, -2, -1);
    ilPaperTypes.Draw(Canvas, Rect.Left, Rect.Top,
      2 + Integer(dxPrintDevice.IsAutoSelectBin(Index)));
    Inc(Rect.Left, ilPaperTypes.Width + 2);
    DrawText(Canvas.Handle, PChar(Items[Index]), Length(Items[Index]), Rect,
      DT_SINGLELINE or DT_LEFT or DT_VCENTER);
  end;
end;

procedure TdxfmPageSetupDialog.lbxPaperTypeDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
const
  uStyles: array[Boolean] of UINT = (ILD_BLEND50 or ILD_BLEND, ILD_NORMAL);
var
  DC: hDC;
  APrevColor: COLORREF;
begin
  with TListBox(Control) do
  begin
    DC := Canvas.Handle;
    FillRect(DC, Rect, Canvas.Brush.Handle);
    InflateRect(Rect, -2, -1);
    ImageList_DrawEx(ilPaperTypes.Handle, Integer(dxPrintDevice.IsEnvelopePaper(Index)),
      DC, Rect.Left, Rect.Top, 0, 0, CLR_NONE, CLR_NONE, uStyles[Enabled]);
    Inc(Rect.Left, ilPaperTypes.Width + 2);
    if not Enabled then
      APrevColor := SetTextColor(DC, GetSysColor(COLOR_GRAYTEXT))
    else
      APrevColor := 0;
    DrawText(DC, PChar(Items[Index]), Length(Items[Index]), Rect,
      DT_SINGLELINE or DT_LEFT or DT_VCENTER);
    if not Enabled then SetTextColor(DC, APrevColor);
  end;
end;

procedure TdxfmPageSetupDialog.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) and (Shift = []) and (ActiveControl is TCustomMemo) then
    ModalResult := mrCancel;
end;

procedure TdxfmPageSetupDialog.btnOptionsClick(Sender: TObject);
begin
  if PrintStyle.SetupOptions then
    CheckModified;
end;

procedure TdxfmPageSetupDialog.sbtnAutoTextClick(Sender: TObject);
begin
  with TControl(Sender).ClientOrigin do
    pmAutoText.Popup(X, Y + TControl(Sender).Height);
end;

procedure TdxfmPageSetupDialog.AutoTextClick(Sender: TObject);
begin
  {}
end;

procedure TdxfmPageSetupDialog.edStyleNameChange(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  CheckModified;
end;

procedure TdxfmPageSetupDialog.edStyleNameExit(Sender: TObject);
var
  StyleManager: TdxPrintStyleManager;
begin
  if edStyleName.Enabled then
  begin
    PrintStyle.StyleCaption := edStyleName.Text;
    StyleManager := FSavePrintStyle.StyleManager;
    if (StyleManager <> nil) and (StyleManager.PageSetupDialog <> nil) then
      Caption := StyleManager.PageSetupDialog.RealTitle
    else
      Caption := sdxPageSetupCaption + ': ' + PrintStyle.StyleCaption;
  end;
end;

function TdxfmPageSetupDialog.ValidateStyleCaption: Boolean;
var
  S: string;
  I: Integer;
  AStyle: TBasedxPrintStyle;
begin
  Result := True;
  if (FStyleManager <> nil) and not edStyleName.ReadOnly then
  begin
    S := edStyleName.Text;
    for I := 0 to FStyleManager.Count - 1 do
    begin
      AStyle := FStyleManager[I];
      if (AStyle <> FSavePrintStyle) and (AnsiCompareStr(AStyle.StyleCaption, S) = 0) then
      begin
        Result := False;
        Exit;
      end;
    end;
  end;
end;

function TdxfmPageSetupDialog.ValidateUserInput(var Control: TWinControl): Boolean;
var
  IsFixupMarginsOutside: Boolean;
begin
  Control := nil;
  Result := ValidateStyleCaption;
  if not Result then
  begin
    MessageWarning(Format(sdxInvalideStyleCaption, [edStyleName.Text]));
    Control := edStyleName;
  end
  else
  begin
    IsFixupMarginsOutside := False;
    if not ValidateMarginsOutside(nil) then
    begin
      Result := True;
      Beep;
      IsFixupMarginsOutside := MarginsOutsideMessageDlg(sdxOutsideMarginsMessage2) = mrYes;
      if IsFixupMarginsOutside then FixupMarginsOutside;
    end;
    if not IsFixupMarginsOutside then
    begin
      Result := ValidateMargins(@Control);
      if not Result then
      begin
        Beep;
        Result := True;
        case MarginsMessageDlg(sdxInvalidMarginsMessage) of
          mrYes:
            FixupMargins;
          mrNo:
            RestoreOriginalMargins;
        end;
      end;
    end;
  end;
end;

procedure TdxfmPageSetupDialog.SaveUserInput;
begin
  SaveMargins;
end;

procedure TdxfmPageSetupDialog.SaveMargins;
begin
  Page.BeginUpdate;
  try
    Page.Header := Round(FseMarginHeader.Value * 1000);
    Page.Footer := Round(FseMarginFooter.Value * 1000);
    Page.Margins.Left := Round(FseMarginLeft.Value * 1000);
    Page.Margins.Top := Round(FseMarginTop.Value * 1000);
    Page.Margins.Right := Round(FseMarginRight.Value * 1000);
    Page.Margins.Bottom := Round(FseMarginBottom.Value * 1000);
  finally
    Page.EndUpdate;
  end;
end;

function TdxfmPageSetupDialog.ValidateMarginsOutside(AInvalidMargin: PWinControl): Boolean;
var
  MinX, MinY: Extended;
begin
  if dxInitPrintDevice(False) and (dxPrintDevice.Printers.Count > 0) then
  begin
    MinX := dxPrintDevice.PhysOffsetX / GetDeviceCaps(dxPrintDevice.Handle, LOGPIXELSX);
    MinY := dxPrintDevice.PhysOffsetY / GetDeviceCaps(dxPrintDevice.Handle, LOGPIXELSX);
    case Page.GetInnerMeasurementUnits of
      muInches: ;
      muMillimeters:
        begin
          MinX := 25.4 * MinX;
          MinY := 25.4 * MinY;
        end;
    end;
  end
  else
  begin
    MinX := 0;
    MinY := 0;
  end;
  Result := FseMarginHeader.Value >= MinY;
  if Result then
    Result := FseMarginFooter.Value >= MinY
  else
  begin
    if AInvalidMargin <> nil then AInvalidMargin^ := FseMarginHeader;
    Exit;
  end;
  if Result then
    Result := FseMarginLeft.Value >= MinX
  else
  begin
    if AInvalidMargin <> nil then AInvalidMargin^ := FseMarginFooter;
    Exit;
  end;
  if Result then
    Result := FseMarginRight.Value >= MinX
  else
  begin
    if AInvalidMargin <> nil then AInvalidMargin^ := FseMarginLeft;
    Exit;
  end;
  if AInvalidMargin <> nil then
    if Result then
      AInvalidMargin^ := nil
    else
      AInvalidMargin^ := FseMarginRight;
end;

function TdxfmPageSetupDialog.ValidateMargins(AInvalidMargin: PWinControl): Boolean;
var
  Min, Max, APageSizeX, APageSizeY, AMinPrintableArea: Extended;
begin
  with Page do
  begin
    APageSizeX := RealPageSize.X / 1000;
    APageSizeY := RealPageSize.Y / 1000;
    AMinPrintableArea := MinPrintableArea / 1000;
   {header}
    Min := 0;
    Max := APageSizeY - AMinPrintableArea;
    Result := (FseMarginHeader.Value >= Min) and (FseMarginHeader.Value <= Max);
    if Result then
    begin
   {footer}
      Min := 0;
      Max := APageSizeY - AMinPrintableArea - FseMarginHeader.Value;
      Result := (FseMarginFooter.Value >= Min) and (FseMarginFooter.Value <= Max);
    end
    else
    begin
      if AInvalidMargin <> nil then AInvalidMargin^ := FseMarginHeader;
      Exit;
    end;
   {top}
    if Result then
    begin
      Min := FseMarginHeader.Value;
      Max := APageSizeY - AMinPrintableArea - FseMarginBottom.Value;
      Result := (FseMarginTop.Value >= Min) and (FseMarginTop.Value <= Max);
    end
    else
    begin
      if AInvalidMargin <> nil then AInvalidMargin^ := FseMarginFooter;
      Exit;
    end;
    if Result then
    begin
   {bottom}
      Min := FseMarginFooter.Value;
      Max := APageSizeY - AMinPrintableArea - FseMarginTop.Value;
      Result := (FseMarginBottom.Value >= Min) and (FseMarginBottom.Value <= Max);
    end
    else
    begin
      if AInvalidMargin <> nil then AInvalidMargin^ := FseMarginTop;
      Exit;
    end;
    if Result then
    begin
{left}
      Min := 0;
      Max := APageSizeX - AMinPrintableArea;
      Result := (FseMarginLeft.Value >= Min) and (FseMarginLeft.Value <= Max);
    end
    else
    begin
      if AInvalidMargin <> nil then AInvalidMargin^ := FseMarginBottom;
      Exit;
    end;
    if Result then
    begin
{right}
      Min := 0;
      Max := APageSizeX - AMinPrintableArea - FseMarginLeft.Value;
      Result := (FseMarginRight.Value >= Min) and (FseMarginRight.Value <= Max);
    end
    else
    begin
      if AInvalidMargin <> nil then AInvalidMargin^ := FseMarginLeft;
      Exit;
    end;
    if AInvalidMargin <> nil then
      if Result then
        AInvalidMargin^ := nil
      else
        AInvalidMargin^ := FseMarginRight;
  end;
end;

procedure TdxfmPageSetupDialog.UpdatePreviewMargins;
begin
  UpdatePreviewMargin(FseMarginHeader.Value, pmHeader);
  UpdatePreviewMargin(FseMarginTop.Value, pmTop);
  UpdatePreviewMargin(FseMarginFooter.Value, pmFooter);
  UpdatePreviewMargin(FseMarginBottom.Value, pmBottom);
  UpdatePreviewMargin(FseMarginLeft.Value, pmLeft);
  UpdatePreviewMargin(FseMarginRight.Value, pmRight);
end;

procedure TdxfmPageSetupDialog.UpdatePreviewMargin(AValue: Extended;
  AMarginType: TdxPreviewMarginType);
var
  V: Integer;
begin
  V := Round(AValue * 1000);
  case Page.GetInnerMeasurementUnits of
    muInches:
      V := MulDiv(V, 254, 1000);
    muMillimeters:
      V := V div 100;
  end;
  FPreview.Margins[AMarginType].Value := V;
end;

procedure TdxfmPageSetupDialog.FixupMarginsOutside;
var
  AMinLeft, AMinRight, AMinTop, AMinBottom: Integer;
begin
  Page.GetRealMinMargins(AMinLeft, AMinRight, AMinTop, AMinBottom);
  FMarginsChanging := True;
  try
    if FseMarginTop.Value < AMinTop / 1000 then
    begin
      FseMarginTop.Value := AMinTop / 1000;
      UpdatePreviewMargin(AMinTop / 1000, pmTop);
    end;
    if FseMarginHeader.Value < AMinTop / 1000 then
    begin
      FseMarginHeader.Value := AMinTop / 1000;
      UpdatePreviewMargin(AMinTop / 1000, pmHeader);
    end;
    if FseMarginBottom.Value < AMinBottom / 1000 then
    begin
      FseMarginBottom.Value := AMinBottom / 1000;
      UpdatePreviewMargin(AMinBottom / 1000, pmBottom);
    end;
    if FseMarginFooter.Value < AMinBottom / 1000 then
    begin
      FseMarginFooter.Value := AMinBottom / 1000;
      UpdatePreviewMargin(AMinBottom / 1000, pmFooter);
    end;
    if FseMarginLeft.Value < AMinLeft / 1000 then
    begin
      FseMarginLeft.Value := AMinLeft / 1000;
      UpdatePreviewMargin(AMinLeft / 1000, pmLeft);
    end;
    if FseMarginRight.Value < AMinRight / 1000 then
    begin
      FseMarginRight.Value := AMinRight / 1000;
      UpdatePreviewMargin(AMinRight / 1000, pmRight);
    end;
  finally
    FMarginsChanging := False;
  end;
  MarginsOutside := False;
  MarginsInvalid := False;
  CheckModified;
end;

procedure TdxfmPageSetupDialog.FixupMargins;

  function MinMax(const Value, Min, Max: Double): Double;
  begin
    if Value < Min then
      Result := Min
    else if Value > Max then
      Result := Max
    else
      Result := Value;
  end;

var
  V: Double;
  AMinLeft, AMinRight, AMinTop, AMinBottom: Integer;
begin
  Page.GetRealMinMargins(AMinLeft, AMinRight, AMinTop, AMinBottom);
  FMarginsChanging := True;
  try
    V := (Page.RealPageSize.Y - Page.MinPrintableArea - AMinBottom) / 1000;
    FseMarginHeader.Value := MinMax(FseMarginHeader.Value, AMinTop / 1000, V);
    V := (Page.RealPageSize.Y - Page.MinPrintableArea - 1000 * FseMarginHeader.Value) / 1000;
    FseMarginFooter.Value := MinMax(FseMarginFooter.Value, AMinBottom / 1000, V);
    V := (Page.RealPageSize.Y - Page.MinPrintableArea - 1000 * FseMarginFooter.Value) / 1000;
    FseMarginTop.Value := MinMax(FseMarginTop.Value, FseMarginHeader.Value, V);
    V := (Page.RealPageSize.Y - Page.MinPrintableArea - 1000 * FseMarginTop.Value) / 1000;
    FseMarginBottom.Value := MinMax(FseMarginBottom.Value, FseMarginFooter.Value, V);

    V := (Page.RealPageSize.X - Page.MinPrintableArea - AMinRight) / 1000;
    FseMarginLeft.Value := MinMax(FseMarginLeft.Value, AMinLeft / 1000, V);
    V := (Page.RealPageSize.X - Page.MinPrintableArea - 1000 * FseMarginLeft.Value) / 1000;
    FseMarginRight.Value := MinMax(FseMarginRight.Value, AMinRight / 1000, V);

    UpdatePreviewMargin(0, pmFooter);
    UpdatePreviewMargin(0, pmBottom);
    UpdatePreviewMargin(0, pmRight);
    UpdatePreviewMargin(FseMarginTop.Value, pmTop);
    UpdatePreviewMargin(FseMarginHeader.Value, pmHeader);
    UpdatePreviewMargin(FseMarginBottom.Value, pmBottom);
    UpdatePreviewMargin(FseMarginFooter.Value, pmFooter);
    UpdatePreviewMargin(FseMarginLeft.Value, pmLeft);
    UpdatePreviewMargin(FseMarginRight.Value, pmRight);
  finally
    FMarginsChanging := False;
  end;

  MarginsInvalid := False;
  CheckModified;
end;

procedure TdxfmPageSetupDialog.RestoreOriginalMargins;
begin
  FMarginsChanging := True;
  try
    with FSavePrintStyle.PrinterPage do
    begin
      FseMarginHeader.Value := Footer / 1000;
      FPreview.Margins[pmHeader].Value := HeaderLoMetric;
      FseMarginFooter.Value := Footer / 1000;
      FPreview.Margins[pmFooter].Value := FooterLoMetric;
      FseMarginLeft.Value := Margins.Left / 1000;
      FPreview.Margins[pmLeft].Value := MarginsLoMetric.Left;
      FseMarginTop.Value := Margins.Top / 1000;
      FPreview.Margins[pmTop].Value := MarginsLoMetric.Top;
      FseMarginRight.Value := Margins.Right / 1000;
      FPreview.Margins[pmRight].Value := MarginsLoMetric.Right;
      FseMarginBottom.Value := Margins.Bottom / 1000;
      FPreview.Margins[pmBottom].Value := MarginsLoMetric.Bottom;
    end;
  finally
    FMarginsChanging := False;
  end;
  MarginsOutside := False;
  MarginsInvalid := False;
  CheckModified;
end;

function TdxfmPageSetupDialog.FindControlPageIndex(AControl: TWinControl): Integer;
begin
  for Result := 0 to pgctrlMain.PageCount - 1 do
    if pgctrlMain.Pages[Result].ContainsControl(AControl) then Exit;
  Result := -1;
end;

procedure TdxfmPageSetupDialog.TrySetActiveControl(AControl: TWinControl);
var
  PageIndex: Integer;
begin
  PageIndex := FindControlPageIndex(AControl);
  if PageIndex = -1 then Exit;
  //if pgctrlMain.Pages[PageIndex].CanFocus then
  begin
    pgctrlMain.ActivePage := pgctrlMain.Pages[PageIndex];
    if AControl.CanFocus then ActiveControl := AControl;
  end;
end;

procedure TdxfmPageSetupDialog.pgctrlMainChanging(Sender: TObject;
  var AllowChange: Boolean);
var
  AInvalidMargin: TWinControl;
begin
  if TPageControl(Sender).ActivePage.PageIndex = 1 then
  begin
    AllowChange := ValidateMargins(@AInvalidMargin);
    if not AllowChange then
    begin
      Beep;
      case MarginsMessageDlg(sdxInvalidMarginsMessage) of
        mrYes:
          FixupMargins;
        mrNo:
          RestoreOriginalMargins;
      end;
      ActiveControl := AInvalidMargin;
    end;
  end;
end;

procedure TdxfmPageSetupDialog.btnRestoreOriginalMarginsClick(
  Sender: TObject);
begin
  RestoreOriginalMargins;
end;

procedure TdxfmPageSetupDialog.btnFixClick(Sender: TObject);
begin
  if MarginsOutside then
    FixupMarginsOutside
  else if MarginsInvalid then
    FixupMargins;
end;

procedure TdxfmPageSetupDialog.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  Control: TWinControl;
begin
  if FPreview.DraggingMargin <> nil then
    CanClose := False
  else
    if ModalResult = mrOK then
    begin
      Control := nil;
      CanClose := ValidateUserInput(Control);
      if not CanClose then
      begin
        FPrintBtnClicked := False;
        FPreviewBtnClicked := False;
        TrySetActiveControl(Control);
      end
      else
        SaveUserInput;
    end;
end;

procedure TdxfmPageSetupDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (ModalResult = mrOK) and (ActiveControl is TdxPSSpinEdit) then
    TdxPSSpinEdit(ActiveControl).Perform(CM_EXIT, 0, 0);
end;


type
  TdxPrintStylePrinterPage = class(TdxPrinterPage)
  private
    FPrintStyle: TBasedxPrintStyle;
  protected
    function GetOwner: TPersistent; override;
    procedure PageParamsChange(AUpdateCodes: TdxPrinterPageUpdateCodes); override;
  end;

function TdxPrintStylePrinterPage.GetOwner: TPersistent;
begin
  Result := FPrintStyle;
end;

procedure TdxPrintStylePrinterPage.PageParamsChange(AUpdateCodes: TdxPrinterPageUpdateCodes);
begin
  inherited PageParamsChange(AUpdateCodes);
  if (UpdateCount = 0) and FPrintStyle.IsCurrentStyle then
    FPrintStyle.PageParamsChange(AUpdateCodes);
end;


{ TBasedxPrintStyle }

constructor TBasedxPrintStyle.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAllowChangeHFText := True;
  FAllowChangeMargins := True;
  FAllowChangeOrientation := True;
  FAllowChangePaper := True;
  FAllowChangeScale := True;
  FAllowCustomPaperSizes := True;
  FImageIndex := -1;
  FBuiltIn := IsDesigning;
  FPrinterPage := TdxPrintStylePrinterPage.Create;
  TdxPrintStylePrinterPage(FPrinterPage).FPrintStyle := Self;
  FStyleGlyph := TBitmap.Create;
end;

destructor TBasedxPrintStyle.Destroy;
begin
  try
    if (StyleManager <> nil) and StyleManager.AllowAutoSave then
    try
      StyleManager.SaveToFile(StyleManager.StorageName);
    finally
      StyleManager.FAlreadySaved := True;
    end;
  finally
{$IFNDEF DELPHI4}
    DoDestroy;
{$ENDIF}
{$IFNDEF DELPHI5}
    Destroying;
{$ENDIF}
    SetStyleManager(nil);
    FPrinterPage.Free;
    FPrinterPage := nil;
    FStyleGlyph.Free;
    FStyleGlyph := nil;
    inherited Destroy;
  end;
end;

{$IFDEF DELPHI4}

procedure TBasedxPrintStyle.BeforeDestruction;
begin
  DoDestroy;
end;
{$ENDIF}

procedure TBasedxPrintStyle.Assign(Source: TPersistent);
begin
  if Source is TBasedxPrintStyle then
  begin
    AllowChangeHFText := TBasedxPrintStyle(Source).AllowChangeHFText;
    AllowChangeMargins := TBasedxPrintStyle(Source).AllowChangeMargins;
    AllowChangeOrientation := TBasedxPrintStyle(Source).AllowChangeOrientation;
    AllowChangePaper := TBasedxPrintStyle(Source).AllowChangePaper;
    AllowChangeScale := TBasedxPrintStyle(Source).AllowChangeScale;
    AllowCustomPaperSizes := TBasedxPrintStyle(Source).AllowCustomPaperSizes;
    Description := TBasedxPrintStyle(Source).Description;
    ImageIndex := TBasedxPrintStyle(Source).ImageIndex;
    PrinterPage := TBasedxPrintStyle(Source).PrinterPage;
    StyleGlyph := TBasedxPrintStyle(Source).StyleGlyph;
    StyleCaption := TBasedxPrintStyle(Source).StyleCaption;
  end
  else
    inherited Assign(Source);
end;

procedure TBasedxPrintStyle.DefaultHandler(var Message);
begin
  inherited DefaultHandler(Message);
  TdxPrintStylePrinterPage(PrinterPage).UpdateMeasurementUnits;
end;

function TBasedxPrintStyle.GetParentComponent: TComponent;
begin
  Result := StyleManager;
end;

function TBasedxPrintStyle.HasParent: Boolean;
begin
  Result := StyleManager <> nil;
end;

procedure TBasedxPrintStyle.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('BuiltInStyle', ReadData, WriteData, True);
end;

procedure TBasedxPrintStyle.ReadState(Reader: TReader);
begin
  inherited ReadState(Reader);
  if Reader.Parent is TdxPrintStyleManager then
    StyleManager := Reader.Parent as TdxPrintStyleManager;
end;

procedure TBasedxPrintStyle.SetName(const NewName: TComponentName);
begin
  inherited SetName(NewName);
  DesignerUpdate(False);
end;

procedure TBasedxPrintStyle.SetParentComponent(AParent: TComponent);
begin
  inherited SetParentComponent(AParent);
  if not IsLoading then
    StyleManager := AParent as TdxPrintStyleManager;
end;

class function TBasedxPrintStyle.OptionsDialogClass: TdxPrintStyleOptionsDialogClass;
begin
  Result := dxPSGetPrintStyleOptDlgClass(StyleClass);
end;

class function TBasedxPrintStyle.OptionsDialogExists: Boolean;
begin
  Result := OptionsDialogClass <> nil;
end;

class function TBasedxPrintStyle.StyleClass: TdxPrintStyleClass;
begin
  Result := TdxPrintStyleClass(GetTypeData(ClassInfo)^.ClassType);
end;

procedure TBasedxPrintStyle.AfterPrinting;
begin
  DoAfterPrinting;
end;

procedure TBasedxPrintStyle.BeforePrinting;
begin
  DoBeforePrinting;
end;

procedure TBasedxPrintStyle.GetFilteredPapers(AStrings: TStrings);
var
  Papers: TStrings;
  I: Integer;
  Paper: TdxPaperInfo;
begin
  if AStrings = nil then
    Exit;
  AStrings.BeginUpdate;
  try
    Papers := dxPrintDevice.Papers;
    if Papers = nil then
      Exit;
    for I := 0 to Papers.Count - 1 do
    begin
      Paper := TdxPaperInfo(Papers.Objects[I]);
      if IsSupportedPaper(Paper) then
        AStrings.AddObject(Paper.Name, Paper);
      if Paper.DMPaper = DMPAPER_USER then
      begin
        Paper.Width := PrinterPage.PageSizeLoMetric.X;
        Paper.Height := PrinterPage.PageSizeLoMetric.Y;
      end;
    end;
  finally
    AStrings.EndUpdate;
  end;
end;

function TBasedxPrintStyle.PageSetup: Boolean;
begin
  Result := PageSetupEx(0, nil, nil);
end;

{$IFDEF DELPHI4}

function TBasedxPrintStyle.PageSetup(AActivePageIndex: Integer;
  APreviewBtnClicked, APrintBtnClicked: PBoolean): Boolean;
begin
  Result := PageSetupEx(AActivePageIndex, APreviewBtnClicked, APrintBtnClicked);
end;
{$ENDIF}

function TBasedxPrintStyle.PageSetupEx(AActivePageIndex: Integer;
  APreviewBtnClicked, APrintBtnClicked: PBoolean): Boolean;
var
  Dialog: TdxPageSetupDialog;
  PgsDialogExists: Boolean;
  PrevStyle: TBasedxPrintStyle;
begin
  Dialog := nil;
  if StyleManager <> nil then
    Dialog := StyleManager.PageSetupDialog;
  PgsDialogExists := Dialog <> nil;
  if not PgsDialogExists then
    Dialog := TdxPageSetupDialog.Create(nil);

  with Dialog do
  try
    PrevStyle := PrintStyle;
    PrintStyle := Self;
    ActivePageIndex := AActivePageIndex;
    if APreviewBtnClicked = nil then
      ButtonsVisible := ButtonsVisible - [psbPreview];
    if APrintBtnClicked = nil then
      ButtonsVisible := ButtonsVisible - [psbPrint];
    if StyleManager = nil then
      OptionsVisible := OptionsVisible - [psoStyleCaption];

    Result := Execute;

    if APreviewBtnClicked <> nil then APreviewBtnClicked^ := PreviewBtnClicked;
    if APrintBtnClicked <> nil then APrintBtnClicked^ := PrintBtnClicked;
    PrintStyle := PrevStyle;
  finally
    if not PgsDialogExists then Dialog.Free;
  end;
end;

procedure TBasedxPrintStyle.RestoreDefaults;
begin
  PrinterPage.RestoreDefaults;
end;

function TBasedxPrintStyle.SetupOptions: Boolean;
begin
  Result := dxPrintStyleOptionsDialog(Self);
end;

function TBasedxPrintStyle.GetAllowChangeHFText: Boolean;
begin
  Result := FAllowChangeHFText;
end;

function TBasedxPrintStyle.GetAllowChangeMargins: Boolean;
begin
  Result := FAllowChangeMargins;
end;

function TBasedxPrintStyle.GetAllowChangePaper: Boolean;
begin
  Result := FAllowChangePaper;
end;

function TBasedxPrintStyle.GetAllowChangeScale: Boolean;
begin
  Result := FAllowChangeScale;
end;

procedure TBasedxPrintStyle.SetAllowChangeHFText(Value: Boolean);
begin
  FAllowChangeHFText := Value;
end;

function TBasedxPrintStyle.GetAllowChangeOrientation: Boolean;
begin
  Result := FAllowChangeOrientation;
end;

function TBasedxPrintStyle.GetAllowCustomPaperSizes: Boolean;
begin
  Result := FAllowCustomPaperSizes;
end;

procedure TBasedxPrintStyle.SetAllowChangeMargins(Value: Boolean);
begin
  FAllowChangeMargins := Value;
end;

procedure TBasedxPrintStyle.SetAllowChangeOrientation(Value: Boolean);
begin
  FAllowChangeOrientation := Value;
end;

procedure TBasedxPrintStyle.SetAllowChangePaper(Value: Boolean);
begin
  FAllowChangePaper := Value;
end;

procedure TBasedxPrintStyle.SetAllowChangeScale(Value: Boolean);
begin
  FAllowChangeScale := Value;
end;

procedure TBasedxPrintStyle.SetAllowCustomPaperSizes(Value: Boolean);
begin
  FAllowCustomPaperSizes := Value;
end;

procedure TBasedxPrintStyle.DoAfterPrinting;
begin
end;

procedure TBasedxPrintStyle.DoBeforePrinting;
begin
end;

procedure TBasedxPrintStyle.DoDestroy;
begin
  if Assigned(FOnDestroy) then FOnDestroy(Self);
end;

function TBasedxPrintStyle.IsSupportedPaper(const APaper: TdxPaperInfo): Boolean;
begin
  Result := True;
  if Assigned(FOnFilterPaper) then
  begin
    FOnFilterPaper(Self, APaper, Result);
    if not Result and (APaper.DMPaper = PrinterPage.DMPaper) then
      Result := True;
  end;
end;

procedure TBasedxPrintStyle.PageParamsChange(AUpdateCodes: TdxPrinterPageUpdateCodes);
begin
  if StyleManager <> nil then
    StyleManager.PageParamsChange(Self, AUpdateCodes);
end;

function TBasedxPrintStyle.GetIndex: Integer;
begin
  if FStyleManager <> nil then
    Result := FStyleManager.IndexOfStyle(Self)
  else
    Result := -1;
end;

function TBasedxPrintStyle.GetIsCurrentStyle: Boolean;
begin
  Result := (StyleManager <> nil) and (StyleManager.CurrentStyle = Self);
end;

procedure TBasedxPrintStyle.SetBuiltIn(Value: Boolean);
begin
  if FBuiltIn <> Value then
  begin
    //if not IsDesigning and (Owner <> nil) and (Owner.FieldAddress(Name) <> nil) then
    //  Exit;
    FBuiltIn := Value;
  end;
end;

procedure TBasedxPrintStyle.SetImageIndex(Value: Integer);
begin
  if FImageIndex <> Value then
  begin
    FImageIndex := Value;
    if (StyleManager <> nil) and (StyleManager.Images <> nil) then
      DesignerUpdate(False);
  end;
end;

procedure TBasedxPrintStyle.SetIndex(Value: Integer);
var
  CurIndex: Integer;
begin
  if FStyleManager = nil then Exit;
  if Value < 0 then Value := 0;
  if Value > StyleManager.Count - 1 then
    Value := StyleManager.Count - 1;
  CurIndex := GetIndex;
  if CurIndex <> Value then
    StyleManager.MoveStyle(CurIndex, Value);
end;

procedure TBasedxPrintStyle.SetIsCurrentStyle(Value: Boolean);
begin
  if Value then
    if not (csReading in ComponentState) and (StyleManager <> nil) then
      StyleManager.CurrentStyle := Self;
end;

procedure TBasedxPrintStyle.SetPrinterPage(Value: TdxPrinterPage);
begin
  FPrinterPage.Assign(Value);
end;

procedure TBasedxPrintStyle.SetStyleCaption(const Value: string);
begin
  if AnsiCompareStr(FStyleCaption, Value) <> 0 then
    FStyleCaption := Value;
end;

procedure TBasedxPrintStyle.SetStyleGlyph(Value: TBitmap);
begin
  FStyleGlyph.Assign(Value);
end;

procedure TBasedxPrintStyle.SetStyleManager(Value: TdxPrintStyleManager);
begin
  if FStyleManager <> Value then
  begin
    if FStyleManager <> nil then
      FStyleManager.RemoveStyle(Self);
    if Value <> nil then
      Value.InsertStyle(Self);
  end;
end;

procedure TBasedxPrintStyle.DesignerUpdate(TheAll: Boolean);
begin
  if StyleManager <> nil then
    if TheAll then
      StyleManager.DesignerUpdate(nil)
    else
      StyleManager.DesignerUpdate(Self);
end;

function TBasedxPrintStyle.IsDesigning: Boolean;
begin
  Result := csDesigning in ComponentState;
end;

function TBasedxPrintStyle.IsLoading: Boolean;
begin
  Result := csLoading in ComponentState;
end;

procedure TBasedxPrintStyle.ReadData(Reader: TReader);
begin
  FBuiltIn := Reader.ReadBoolean;
end;

procedure TBasedxPrintStyle.WriteData(Writer: TWriter);
begin
  Writer.WriteBoolean(FBuiltIn);
end;


{ TdxPrintStyleManager }

constructor TdxPrintStyleManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAutoSave := False;
  FStyleList := TList.Create;
  FHelpContext := 0;
  FPreviewBtnClicked := False;
  FPrintBtnClicked := False;
  FTitle := sdxDefinePrintStylesCaption;
  FCloneStyleCaptionPrefix := sdxCloneStyleCaptionPrefix;
  FStorageName := '';
  FWindowHandle := {$IFDEF DELPHI6}Classes.{$ENDIF}AllocatehWnd(WndProc);
  FAlreadySaved := False;
end;

destructor TdxPrintStyleManager.Destroy;
begin
  try
    if AllowAutoSave then
    try
      SaveToFile(StorageName);
    finally
      FAlreadySaved := True;
    end;
  finally
   {$IFNDEF DELPHI5}
    Destroying;
   {$ENDIF}
    if IsWindow(FWindowHandle) then
     {$IFDEF DELPHI6}Classes.{$ENDIF}DeallocateHWnd(FWindowHandle);
    if FDesigner <> nil then
      FDesigner.Free;
    Clear;
    FStyleList.Free;
    inherited Destroy;
  end;
end;

procedure TdxPrintStyleManager.Loaded;
begin
  inherited Loaded;
  if not FInternalStreaming and not IsDesigning and AutoSave then
    LoadFromFile(StorageName);
end;

procedure TdxPrintStyleManager.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
    if AComponent = Images then
      Images := nil
    else
      if AComponent = PageSetupDialog then
        PageSetupDialog := nil;
end;

procedure TdxPrintStyleManager.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: integer;
  Style: TBasedxPrintStyle;
begin
  for I := 0 to Count - 1 do
  begin
    Style := Styles[I];
    if (Root = Style.Owner) or (FInternalStreaming and (Root = Style.StyleManager)) then
      Proc(Style);
  end;
end;

procedure TdxPrintStyleManager.SetChildOrder(Child: TComponent; Order: Integer);
begin
  inherited SetChildOrder(Child, Order);
  if FStyleList.IndexOf(Child) > -1 then
    (Child as TBasedxPrintStyle).Index := Order;
end;

procedure TdxPrintStyleManager.WndProc(var message: TMessage);
var
  I: Integer;
begin
  case Message.Msg of
    WM_SETTINGCHANGE:
//        if (PChar(message.lParam) = 'devices') then
      begin
        RereadDefaultPrinterPage;
        for I := 0 to Count - 1 do
          Styles[I].DefaultHandler(message);
        DesignerModified;
      end;

    WMPS_PRINTSTYLELISTCHANGED:
      begin
        StyleListChanged;
        ChangeCurrentStyle;
      end;
  end;
end;

function TdxPrintStyleManager.IsDesigning: Boolean;
begin
  Result := csDesigning in ComponentState;
end;

function TdxPrintStyleManager.IsDestroying: Boolean;
begin
  Result := csDestroying in ComponentState;
end;

function TdxPrintStyleManager.IsLoading: Boolean;
begin
  Result := csLoading in ComponentState;
end;

function TdxPrintStyleManager.AllowAutoSave: Boolean;
begin
  Result := AutoSave and not IsDesigning and IsDestroying and not FAlreadySaved;
end;

procedure TdxPrintStyleManager.DesignerUpdate(AStyle: TBasedxPrintStyle);
begin
  if IsDesigning and (Designer <> nil) then
    Designer.Update(AStyle);
end;

procedure TdxPrintStyleManager.DesignerModified;
begin
  if IsDesigning and (Designer <> nil) then
    Designer.Modified;
end;

procedure TdxPrintStyleManager.SetName(const NewName: TComponentName);
var
  OldName, ItemName, AName: string;
  P, I: Integer;
begin
  OldName := Name;
  inherited SetName(NewName);
  if IsDesigning and (Count > 0) then
  try
    if Designer <> nil then Designer.BeginUpdate;
    try
      for I := 0 to Count - 1 do
      begin
        ItemName := Styles[I].Name;
        P := Pos(OldName, ItemName);
        if P = 0 then
          AName := Name + ItemName
        else
          AName := Copy(ItemName, 1, P - 1) + Name +
            Copy(ItemName, P + Length(OldName), Length(ItemName) - P - Length(OldName) + 1);
        Styles[I].Name := AName;
      end;
    finally
      if Designer <> nil then Designer.EndUpdate;
    end;
  except
    on EComponentError do ; {Ignore rename errors }
  end;
end;

procedure TdxPrintStyleManager.SetPageSetupDialog(Value: TdxPageSetupDialog);
begin
  if FPageSetupDialog <> Value then
  begin
    FPageSetupDialog := Value;
    if Value <> nil then Value.FreeNotification(Self);
  end;
end;

function TdxPrintStyleManager.GetStyle(Index: Integer): TBasedxPrintStyle;
begin
  Result := TBasedxPrintStyle(FStyleList[Index]);
end;

procedure TdxPrintStyleManager.SetStyle(Index: Integer; Value: TBasedxPrintStyle);
begin
  Styles[Index].Assign(Value);
end;

procedure TdxPrintStyleManager.SetImages(Value: TImageList);
begin
  if FImages <> Value then
  begin
    FImages := Value;
    if FImages <> nil then
      FImages.FreeNotification(Self);
    DesignerUpdate(nil);
  end;
end;

procedure TdxPrintStyleManager.AssignStyles(Source: TdxPrintStyleManager);
var
  I: Integer;
  Style: TBasedxPrintStyle;
begin
  BeginUpdate;
  try
    Clear;
    Images := Source.Images;
    for I := 0 to Source.Count - 1 do
    begin
      Style := Source[I];
      with AddStyle(Style.StyleClass) do
        Assign(Style);
    end;
  finally
    EndUpdate;
  end;
end;

function TdxPrintStyleManager.IndexOfStyle(Value: TBasedxPrintStyle): Integer;
begin
  Result := FStyleList.IndexOf(Value);
end;

function TdxPrintStyleManager.StyleByCaption(const ACaption: string): TBasedxPrintStyle;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    if AnsiCompareText(ACaption, Styles[I].StyleCaption) = 0 then
    begin
      Result := Styles[I];
      Exit;
    end;
  Result := nil;
end;

function TdxPrintStyleManager.StyleByName(const AName: string): TBasedxPrintStyle;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
  begin
    Result := Styles[I];
    if CompareText(AName, Result.Name) = 0 then Exit;
  end;
  Result := nil;
end;

procedure TdxPrintStyleManager.Delete(Index: Integer);
var
  Style: TBasedxPrintStyle;
begin
  if (Index > -1) and (Index < Count) then
  begin
    Style := Styles[Index];
    Style.Free;
  end;
end;

procedure TdxPrintStyleManager.Clear;
begin
  BeginUpdate;
  try
    while Count > 0 do Delete(Count - 1);
  finally
    EndUpdate;
  end;
end;

function TdxPrintStyleManager.NonBuiltInsExists: Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to Count - 1 do
    if not Styles[I].BuiltIn then Exit;
  Result := False;
end;

procedure TdxPrintStyleManager.DeleteNonBuiltIns;
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := Count - 1 downto 0 do
      if not Styles[I].BuiltIn then Delete(I);
  finally
    EndUpdate;
  end;
end;

function TdxPrintStyleManager.BeginClone(AIndex: Integer): TBasedxPrintStyle;
var
  StyleClass: TdxPrintStyleClass;
begin
  Result := nil;
  if (AIndex < -1) or (AIndex > Count - 1) then Exit;
  if AIndex = -1 then
    StyleClass := dxDefaultPrintStyleClass
  else
    StyleClass := Styles[AIndex].StyleClass;
  if StyleClass = nil then Exit;
  BeginUpdate;
  Result := AddStyle(StyleClass);
  Result.Index := AIndex + 1;
  Include(Result.FState, pssCopy);
  if AIndex > -1 then
  begin
    Result.Assign(Styles[AIndex]);
    SetNewStyleCaption(Result, AIndex);
  end;
end;

procedure TdxPrintStyleManager.EndClone(AStyle: TBasedxPrintStyle);
begin
//  CurrentStyle := AStyle;
  EndUpdate;
  Exclude(AStyle.FState, pssCopy);
end;

procedure TdxPrintStyleManager.SetNewStyleCaption(AStyle: TBasedxPrintStyle;
  AIndex: Integer);

  function CheckName(const Source: string): Boolean;
  var
    I: Integer;
  begin
    for I := 0 to Count - 1 do
      if Styles[I] <> AStyle then
      begin
        Result := AnsiCompareStr(Source, Styles[I].StyleCaption) <> 0;
        if not Result then Exit;
      end;
    Result := True;
  end;

const
  MaskCount = 4;
  Mask: array[0..MaskCount - 1] of string = ('(%d) ', '(%d)', '%d ', '%d');
var
  S, S2: string;
  OkName: Boolean;
  I, K: Integer;
begin
  OkName := False;
  if not OkName then
  begin
    S := CloneStyleCaptionPrefix + Styles[AIndex].StyleCaption;
    for K := 0 to MaskCount - 1 do
    begin
      I := Pos(Mask[K], S);
      if (I > 0) then
      begin
        System.Delete(S, I, Length(Mask[K]));
        Break;
      end;
    end;
    if Length(S) > dxMaxStyleCaption then SetLength(S, dxMaxStyleCaption);
    OkName := CheckName(S);
    if not OkName then
    begin
      S2 := CloneStyleCaptionPrefix + Styles[AIndex].StyleCaption;
      if (Length(S2) > dxMaxStyleCaption) then SetLength(S2, dxMaxStyleCaption);
      I := 2;
      while not OkName and (I < MaxInt) do
      begin
        try
          S := Format(S2, [I]);
        except
          S := S2;
        end;
        if Length(S) > dxMaxStyleCaption then SetLength(S, dxMaxStyleCaption);
        if AnsiCompareStr(S, S2) = 0 then
        begin
          AStyle.StyleCaption := S;
          Exit;
        end;
        OkName := CheckName(S);
        Inc(I);
      end;
    end;
  end;
  if OkName then AStyle.StyleCaption := S;
end;

function TdxPrintStyleManager.AddStyle(AStyleClass: TdxPrintStyleClass): TBasedxPrintStyle;
begin
  Result := AddStyleEx(AStyleClass, Self.Owner);
end;

function TdxPrintStyleManager.AddStyleEx(AStyleClass: TdxPrintStyleClass;
  AOwner: TComponent): TBasedxPrintStyle;
begin
  Result := nil;
  if AStyleClass = nil then 
    Exit;
  Result := AStyleClass.Create(AOwner);
  Result.StyleManager := Self;
end;

procedure TdxPrintStyleManager.ResyncCurrentStyle(AIndex: Integer);
begin
  if AIndex > Count - 1 then 
    AIndex := Count - 1;
  if AIndex < 0 then
  begin
    FCurrentStyle := nil;
    ChangeCurrentStyle;
  end
  else
    CurrentStyle := Styles[AIndex];
end;

procedure TdxPrintStyleManager.InsertStyle(Value: TBasedxPrintStyle);
begin
  FStyleList.Add(Value);
  Value.FStyleManager := Self;
  if Count = 1 then 
    CurrentStyle := Value;
  StyleListChanged;
end;

procedure TdxPrintStyleManager.MoveStyle(ACurIndex, ANewIndex: Integer);
begin
  FStyleList.Move(ACurIndex, ANewIndex);
  DesignerUpdate(nil);
end;

procedure TdxPrintStyleManager.RemoveStyle(Value: TBasedxPrintStyle);
var
  Index: Integer;
begin
  if FCurrentStyle = Value then
    Index := Value.Index
  else
    Index := -1;
  FStyleList.Remove(Value);
  Value.FStyleManager := nil;
  if Index <> -1 then
    ResyncCurrentStyle(Index);
  StyleListChanged;
end;

function TdxPrintStyleManager.GetCount: Integer;
begin
  Result := FStyleList.Count;
end;

procedure TdxPrintStyleManager.RestoreDefaults;
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := 0 to Count - 1 do
      Styles[I].RestoreDefaults;
  finally
    EndUpdate;
  end;
end;

procedure TdxPrintStyleManager.LoadFromFile(const AName: string);
var
  AStream: TFileStream;
begin
  if (AName <> '') and FileExists(AName) then
  begin
    AStream := TFileStream.Create(AName, fmOpenRead or fmShareDenyWrite);
    try
      LoadFromStream(AStream);
    finally
      AStream.Free;
    end;
  end;
end;

procedure TdxPrintStyleManager.LoadFromStream(AStream: TStream);
var
  Version: Integer;
  M: TMemoryStream;
  I: Integer;
  Style: TBasedxPrintStyle;
  CurrentStyleIndex: Integer;
begin
  AStream.ReadBuffer(Version, SizeOf(Integer));
  if Version <> Self.Version then Exit;
  Version := Self.Version;
  BeginUpdate;
  try
    M := TMemoryStream.Create;
    try
      FInternalStreaming := True;
      try
        M.WriteComponent(Self);
        Clear;
        try
          AStream.ReadBuffer(CurrentStyleIndex, SizeOf(Integer));
          AStream.ReadComponent(Self);
          Self.CurrentStyleIndex := CurrentStyleIndex;
        except
          Clear;
          M.Position := 0;
          M.ReadComponent(Self);
          Application.HandleException(Self);
        end;
      finally
        Loaded;
        for I := 0 to Count - 1 do
        begin
          Style := Styles[I];
          RemoveComponent(Style);
          Owner.InsertComponent(Style);
          Style.Loaded;
        end;
        FInternalStreaming := False;
      end;
    finally
      M.Free;
    end;
  finally
    Self.Version := Version;
    EndUpdate;
  end;
end;

procedure TdxPrintStyleManager.SaveToFile(const AName: string);
var
  AStream: TFileStream;
begin
  if ValidateFileName(AName) then
  begin
    AStream := TFileStream.Create(AName, fmCreate or fmShareDenyWrite);
    try
      SaveToStream(AStream);
    finally
      AStream.Free;
    end;
  end;
end;

procedure TdxPrintStyleManager.SaveToStream(AStream: TStream);
var
  ACurrentStyleIndex: Integer;
begin
  FInternalStreaming := True;
  try
    AStream.WriteBuffer(Version, SizeOf(Integer));
    ACurrentStyleIndex := CurrentStyleIndex;
    AStream.WriteBuffer(ACurrentStyleIndex, SizeOf(Integer));
    AStream.WriteComponent(Self);
  finally
    FInternalStreaming := False;
  end;
end;

procedure TdxPrintStyleManager.ChangeCurrentStyle;
begin
  if (FUpdateCount = 0) and not IsLoading and not IsDestroying then
    if Assigned(FOnChangeCurrentStyle) then FOnChangeCurrentStyle(Self);
end;

procedure TdxPrintStyleManager.StyleListChanged;
var
  Event: TdxEvent;
begin
  if (FUpdateCount = 0) and not IsLoading and not IsDestroying then
  begin
    if Assigned(FOnStyleListChanged) then FOnStyleListChanged(Self);
    Event := TdxSMStyleListChangedEvent.Create(Self);
    dxPSProcessEvent(Event);
  end;
end;

procedure TdxPrintStyleManager.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TdxPrintStyleManager.EndUpdate;
begin
  if FUpdateCount <> 0 then
  begin
    Dec(FUpdateCount);
    if FUpdateCount = 0 then
    begin
      StyleListChanged;
      ChangeCurrentStyle;
    end;
  end;
end;

function TdxPrintStyleManager.IsCloneStyleCaptionPrefixStored: Boolean;
begin
  Result := AnsiCompareStr(CloneStyleCaptionPrefix, sdxCloneStyleCaptionPrefix) <> 0;
end;

function TdxPrintStyleManager.IsTitleStored: Boolean;
begin
  Result := AnsiCompareStr(FTitle, sdxDefinePrintStylesCaption) <> 0;
end;

procedure TdxPrintStyleManager.PageParamsChange(APrintStyle: TBasedxPrintStyle;
  AUpdateCodes: TdxPrinterPageUpdateCodes);
var
  Event: TdxEvent;
begin
  Event := TdxSMPageParamsChangedEvent.Create(Self, APrintStyle, AUpdateCodes);
  dxPSProcessEvent(Event);
end;

procedure TdxPrintStyleManager.SetCurrentStyle(Value: TBasedxPrintStyle);
begin
  if (FCurrentStyle <> Value) and (IndexOfStyle(Value) <> -1) then
  begin
    FCurrentStyle := Value;
    PageParamsChange(Value, ucAll);
    ChangeCurrentStyle;
    DesignerUpdate(Value)//nil);
  end;
end;

function TdxPrintStyleManager.GetCurrentStyleIndex: Integer;
begin
  if CurrentStyle <> nil then
    Result := CurrentStyle.Index
  else
    Result := -1;
end;

procedure TdxPrintStyleManager.SetCurrentStyleIndex(Value: Integer);
begin
  if Value < 0 then
    Value := 0;
  if Value > Count - 1 then
    Value := Count - 1;
  if Value <> CurrentStyleIndex then
    CurrentStyle := Styles[Value];
end;

procedure TdxPrintStyleManager.DefinePrintStylesDlg(APreviewBtnClicked,
  APrintBtnClicked: PBoolean);
var
  Data: TdxDefinePrintStylesDlgData;
begin
  FillChar(Data, SizeOf(TdxDefinePrintStylesDlgData), 0);
  Data.StyleManager := Self;
  Data.Title := Title;
  Data.HelpContext := HelpContext;
  dxDefinePrintStylesDlg(@Data);

  if APreviewBtnClicked <> nil then APreviewBtnClicked^ := Data.PreviewBtnClicked;
  if APrintBtnClicked <> nil then APrintBtnClicked^ := Data.PrintBtnClicked;
    
  PostMessage(FWindowHandle, WMPS_PRINTSTYLELISTCHANGED, 0, 0);
end;


{ TAbstractdxStyleManagerDesigner }

constructor TAbstractdxStyleManagerDesigner.Create(AStyleManager: TdxPrintStyleManager);
begin
  inherited Create;
  FStyleManager := AStyleManager;
  if FStyleManager <> nil then FStyleManager.FDesigner := Self;
end;

destructor TAbstractdxStyleManagerDesigner.Destroy;
begin
  if FStyleManager <> nil then FStyleManager.FDesigner := nil;
  inherited Destroy;
end;


{ TAbstractdxPrintStyleOptionsDialog }

constructor TAbstractdxPrintStyleOptionsDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FModified := False;
end;

destructor TAbstractdxPrintStyleOptionsDialog.Destroy;
begin
  if Assigned(FPrintStyle) then FPrintStyle.Free;
  inherited Destroy;
end;

procedure TAbstractdxPrintStyleOptionsDialog.SaveOptions;
begin
  {desc realization}
end;

function TAbstractdxPrintStyleOptionsDialog.Execute: Boolean;
begin
  Result := (ShowModal = mrOK) and FModified;
  if Result then SaveOptions;
end;

function TAbstractdxPrintStyleOptionsDialog.GetModified: Boolean;
begin
  Result := FModified;
end;

procedure TAbstractdxPrintStyleOptionsDialog.CheckModified;
begin
  FModified := True;
  UpdateControlsState;
end;

procedure TAbstractdxPrintStyleOptionsDialog.Initialize;
begin
end;

procedure TAbstractdxPrintStyleOptionsDialog.UpdateControlsState;
begin
end;

function TAbstractdxPrintStyleOptionsDialog.GetPrintStyle(
  AStyleClass: TdxPrintStyleClass): TBasedxPrintStyle;
begin
  if FPrintStyle <> nil then
  begin
    FPrintStyle.Free;
    FPrintStyle := nil;
  end;
  if AStyleClass <> nil then
    FPrintStyle := AStyleClass.Create(nil);
  Result := FPrintStyle;
end;

procedure TAbstractdxPrintStyleOptionsDialog.SetPrintStyle(Value: TBasedxPrintStyle);
begin
  if Value <> nil then
    GetPrintStyle(Value.StyleClass).Assign(Value);
end;

function dxPrintStyleOptionsDialog(APrintStyle: TBasedxPrintStyle): Boolean;
var
  DialogClass: TdxPrintStyleOptionsDialogClass;
  Dialog: TAbstractdxPrintStyleOptionsDialog;
begin
  Result := False;
  if APrintStyle = nil then Exit;
  DialogClass := dxPSGetPrintStyleOptDlgClass(APrintStyle.StyleClass);
  if DialogClass = nil then Exit;
  Dialog := DialogClass.Create(nil);
  try
    Dialog.SetPrintStyle(APrintStyle);
    Result := Dialog.Execute;
    if Result then
      APrintStyle.Assign(Dialog.PrintStyle);
  finally
    Dialog.Free;
  end;
end;

procedure DrawStyleItem(AStyle: TBasedxPrintStyle; AListBox: TListBox;
  Index: Integer; State: TOwnerDrawState; Rect: TRect;
  AMultiline, ABoldedCurrent: Boolean);
const
  MaskColor = $00101010;
  uFormat: array[Boolean] of UINT =
  (DT_LEFT or DT_WORDBREAK, DT_LEFT or DT_SINGLELINE or DT_VCENTER);
var
  b: TBitmap;
  S: string;
  R: TRect;
  DC: hDC;
  ABrush: HBRUSH;
  IsImagesDrawn: Boolean;
begin
  with AListBox do
  begin
    DC := Canvas.Handle;
    IsImagesDrawn := (AStyle.StyleManager <> nil) and
      (AStyle.StyleManager.Images <> nil) and (AStyle.ImageIndex > -1) and
      (AStyle.ImageIndex < AStyle.StyleManager.Images.Count);
    b := nil;
    if IsImagesDrawn then b := TBitmap.Create;
    try
      if IsImagesDrawn then
      begin
        b.Width := AStyle.StyleManager.Images.Width;
        b.Height := AStyle.StyleManager.Images.Height;
        b.Canvas.Brush.Color := MaskColor;
        R := Classes.Rect(0, 0, b.Width, b.Height);
        b.Canvas.FillRect(R);
        AStyle.StyleManager.Images.Draw(b.Canvas, 0, 0, AStyle.ImageIndex);
        OffsetRect(R, Rect.Left + (dxStyleGlyphSize.X - b.Width) div 2,
          Rect.Top + (dxStyleGlyphSize.Y - b.Height) div 2);
      end
      else 
        if (AStyle.StyleGlyph <> nil) and not AStyle.StyleGlyph.Empty then
        begin
          R := Bounds(Rect.Left + 1, Rect.Top + 1, dxStyleGlyphSize.X, dxStyleGlyphSize.Y);
          b := AStyle.StyleGlyph;
        end;
      if IsImagesDrawn or ((AStyle.StyleGlyph <> nil) and not AStyle.StyleGlyph.Empty) then
      begin
        if odSelected in State then
          ABrush := GetSysColorBrush(COLOR_HIGHLIGHT)
        else
          ABrush := GetSysColorBrush(COLOR_WINDOW);
        TransparentDraw(DC, ABrush, R, b);
        with R do
          ExcludeClipRect(Canvas.Handle, Left, Top, Right, Bottom);
      end;
    finally
      if IsImagesDrawn then b.Free;
    end;
    Canvas.FillRect(Rect);
    Inc(Rect.Left, dxStyleGlyphSize.X + 4);
    SetBkMode(DC, TRANSPARENT);
    if ABoldedCurrent and AStyle.IsCurrentStyle then
      Canvas.Font.Style := Canvas.Font.Style + [fsBold];
    SelectObject(DC, Canvas.Font.Handle);
    S := Items[Index];
    if AMultiline then
    begin
      R := Rect;
      DrawText(DC, PChar(S), Length(S), Rect, DT_LEFT or DT_SINGLELINE or DT_CALCRECT);
      DrawText(DC, PChar(S), Length(S), R, uFormat[(Rect.Right - Rect.Left) <= (R.Right - R.Left)]);
    end
    else
      DrawText(DC, PChar(S), Length(S), Rect, uFormat[True]);
    if ABoldedCurrent and AStyle.IsCurrentStyle then
      Canvas.Font.Style := Canvas.Font.Style - [fsBold];
  end;
end;

procedure DefaultDrawPagePreview(APrintStyle: TBasedxPrintStyle; ACanvas: TCanvas;
  APageRect, AContentRect, AHeaderRect, AFooterRect: TRect);
const
  xCell = 15;
  yCell = 7;
var
  R, R2: TRect;
  I, xCount, yCount: Integer;
  DC: hDC;
  Brush: HBRUSH;
begin
  Brush := GetSysColorBrush(COLOR_BTNFACE {COLOR_BTNSHADOW} {COLOR_BTNHIGHLIGHT});
  R := AContentRect;
  xCount := (R.Right - R.Left - 1) div xCell;
  yCount := (R.Bottom - R.Top - 1) div yCell;
  R.Right := R.Left + xCount * xCell;
  R.Bottom := R.Top + yCount * yCell;
  if APrintStyle.PrinterPage.CenterOnPageH then
    OffsetRect(R, ((AContentRect.Right - AContentRect.Left) - (R.Right - R.Left)) div 2, 0);
  if APrintStyle.PrinterPage.CenterOnPageV then
    OffsetRect(R, 0, ((AContentRect.Bottom - AContentRect.Top) - (R.Bottom - R.Top)) div 2);
  DC := ACanvas.Handle;
  {vert}
  for I := 0 to xCount do
  begin
    R2 := Rect(R.Left + I * xCell, R.Top, R.Left + I * xCell + 1, R.Bottom);
    if RectVisible(DC, R2) then FillRect(DC, R2, Brush);
  end;
  {horz}
  for I := 0 to yCount do
  begin
    R2 := Rect(R.Left, R.Top + I * yCell, R.Right + 1, R.Top + I * yCell + 1);
    if RectVisible(DC, R2) then FillRect(DC, R2, Brush);
  end;
end;

{ Header & footer parser functions }

function dxProcessHFString(const Source: string): string;
begin
  if dxHFFunctionLibrary <> nil then
    Result := dxHFFunctionLibrary.ProcessString(Source, dxHFFormatObject)
  else
    Result := Source;
end;

procedure dxGetHFFunctionsList(AStrings: TStrings);
begin
  if dxHFFunctionLibrary <> nil then
    dxHFFunctionLibrary.GetFunctions(AStrings);
end;

procedure dxGetHFFunctionsListByCategory(ACategory: TdxHFFunctionCategoryClass; AStrings: TStrings);
begin
  if dxHFFunctionLibrary <> nil then
    dxHFFunctionLibrary.GetFunctionsByCategory(ACategory, AStrings);
end;


{ TdxHFFunctionFormatObject }

constructor TdxHFFunctionFormatObject.Create;
var
  Buffer: array[Byte] of Char;
  C: DWORD;
begin
  C := 255;
  GetUserName(Buffer, C);
  SetString(FUserName, Buffer, C - 1);
  C := 255;
  GetComputerName(Buffer, C);
  SetString(FMachineName, Buffer, C);
end;


{ TdxHFFunction }

constructor TdxHFFunction.Create;
begin
  inherited Create;
  FGlyph := TBitmap.Create;
end;

destructor TdxHFFunction.Destroy;
begin
  FGlyph.Free;
  inherited Destroy;
end;

procedure TdxHFFunction.Assign(Source: TPersistent);
begin
  if (Source is TdxHFFunction) then
  begin
    TemplateString := TdxHFFunction(Source).TemplateString;
    Hint := TdxHFFunction(Source).Hint;
    Glyph := TdxHFFunction(Source).Glyph;
  end
  else
    inherited Assign(Source);
end;

class function TdxHFFunction.FunctionClass: TdxHFFunctionClass;
begin
  Result := TdxHFFunctionClass(GetTypeData(ClassInfo)^.ClassType);
end;

function TdxHFFunction.DoProcess(const Source: string;
  const AFormatObject: TdxHFFunctionFormatObject): string;
begin
  if AFormatObject <> nil then
    Result := ConvertFunc(Source, AFormatObject)
  else
    Result := Source;
end;

procedure TdxHFFunction.SetTemplateString(const Value: string);
begin
  FTemplateString := Value;
  if Length(FTemplateString) > 0 then
  begin
    if FTemplateString[1] <> dxFunctionDelimiters[False] then
      FTemplateString := dxFunctionDelimiters[False] + FTemplateString;
    if FTemplateString[Length(FTemplateString)] <> dxFunctionDelimiters[True] then
      FTemplateString := FTemplateString + dxFunctionDelimiters[True];
  end;
end;

procedure TdxHFFunction.SetGlyph(Value: Graphics.TBitmap);
begin
  FGlyph.Assign(Value);
end;

class function TdxHFFunction.GetName: string;
begin
  Result := sdxHFFunctionNameUnknown;
end;

class function TdxHFFunction.GetCategory: TdxHFFunctionCategoryClass;
begin
  Result := TdxHFFunctionUnknownCategory;
end;

function TdxHFFunction.ConvertFunc(const Source: string;
  const FormatObject: TdxHFFunctionFormatObject): string;
begin
  Result := Source;
end;


{ TdxHFPagesFunctions }

class function TdxHFPagesFunctions.GetCategory: TdxHFFunctionCategoryClass;
begin
  Result := TdxHFFunctionPagesCategory;
end;


{ TdxHFPageNumberFunction }

constructor TdxHFPageNumberFunction.Create;
begin
  inherited Create;
  Glyph.LoadFromResourceID(hInstance, DXCP_BMPPAGENUMBER);
  TemplateString := sdxHFFunctionTemplatePageNumber;
  Hint := sdxHFFunctionHintPageNumber;
end;

function TdxHFPageNumberFunction.ConvertFunc(const Source: string;
  const FormatObject: TdxHFFunctionFormatObject): string;
begin
  with FormatObject do
    case PageNumberFormat of
      pnfNumeral:
        Result := IntToStr(StartPageIndex + CurrentPage - 1);
      pnfChars:
        Result := Int2Chars(StartPageIndex + CurrentPage - 1, False);
      pnfUpperChars:
        Result := Int2Chars(StartPageIndex + CurrentPage - 1, True);
      pnfRoman:
        Result := Int2Roman(StartPageIndex + CurrentPage - 1, False);
    else {pnfUpperRoman}
      Result := Int2Roman(StartPageIndex + CurrentPage - 1, True);
    end
end;

class function TdxHFPageNumberFunction.GetName: string;
begin
  Result := sdxHFFunctionNamePageNumber;
end;


{ TdxHFTotalPagesFunction }

constructor TdxHFTotalPagesFunction.Create;
begin
  inherited Create;
  Glyph.LoadFromResourceID(hInstance, DXCP_BMPTOTALPAGES);
  TemplateString := sdxHFFunctionTemplateTotalPages;
  Hint := sdxHFFunctionHintTotalPages;
end;

function TdxHFTotalPagesFunction.ConvertFunc(const Source: string;
  const FormatObject: TdxHFFunctionFormatObject): string;
begin
  with FormatObject do
    case PageNumberFormat of
      pnfNumeral:
        Result := IntToStr(StartPageIndex + TotalPages - 1);
      pnfChars:
        Result := Int2Chars(StartPageIndex + TotalPages - 1, False);
      pnfUpperChars:
        Result := Int2Chars(StartPageIndex + TotalPages - 1, True);
      pnfRoman:
        Result := Int2Roman(StartPageIndex + TotalPages - 1, False);
    else {pnfUpperRoman}
      Result := Int2Roman(StartPageIndex + TotalPages - 1, True);
    end
end;

class function TdxHFTotalPagesFunction.GetName: string;
begin
  Result := sdxHFFunctionNameTotalPages;
end;


{ TdxHFPageOfPagesFunction }

constructor TdxHFPageOfPagesFunction.Create;
begin
  inherited Create;
  Glyph.LoadFromResourceID(hInstance, DXCP_BMPPAGENUMBEROFPAGES);
  TemplateString := sdxHFFunctionTemplatePageOfPages;
  Hint := sdxHFFunctionHintPageOfPages;
end;

function TdxHFPageOfPagesFunction.ConvertFunc(const Source: string;
  const FormatObject: TdxHFFunctionFormatObject): string;
begin
  with FormatObject do
    case PageNumberFormat of
      pnfNumeral:
        Result := IntToStr(FCurrentPage + FStartPageIndex - 1) + ' ' +
          sdxOf + ' ' + IntToStr(FTotalPages + FStartPageIndex - 1);
      pnfChars:
        Result := Int2Chars(FCurrentPage + FStartPageIndex - 1, False) + ' ' +
          sdxOf + ' ' + Int2Chars(FTotalPages + FStartPageIndex - 1, False);
      pnfUpperChars:
        Result := Int2Chars(FCurrentPage + FStartPageIndex - 1, True) + ' ' +
          sdxOf + ' ' + Int2Chars(FTotalPages + FStartPageIndex - 1, True);
      pnfRoman:
        Result := Int2Roman(FCurrentPage + FStartPageIndex - 1, False) + ' ' +
          sdxOf + ' ' + Int2Roman(FTotalPages + FStartPageIndex, False);
    else {pnfUpperRoman}
      Result := Int2Roman(FCurrentPage + FStartPageIndex - 1, True) + ' ' +
        sdxOf + ' ' + Int2Roman(FTotalPages + FStartPageIndex - 1, True);
    end
end;

class function TdxHFPageOfPagesFunction.GetName: string;
begin
  Result := sdxHFFunctionNamePageOfPages;
end;


{ TdxHFAuthenticationFunctions }

class function TdxHFAuthenticationFunctions.GetCategory: TdxHFFunctionCategoryClass;
begin
  Result := TdxHFFunctionAuthenticationCategory;
end;


{ TdxHFMachineNameFunction }

constructor TdxHFMachineNameFunction.Create;
begin
  inherited Create;
  Glyph.LoadFromResourceID(hInstance, DXCP_BMPMACHINENAME);
  TemplateString := sdxHFFunctionTemplateMachineName;
  Hint := sdxHFFunctionHintMachineName;
end;

function TdxHFMachineNameFunction.ConvertFunc(const Source: string;
  const FormatObject: TdxHFFunctionFormatObject): string;
begin
  Result := FormatObject.MachineName
end;

class function TdxHFMachineNameFunction.GetName: string;
begin
  Result := sdxHFFunctionNameMachineName;
end;


{ TdxHFMachineNameFunction }

constructor TdxHFUserNameFunction.Create;
begin
  inherited Create;
  Glyph.LoadFromResourceID(hInstance, DXCP_BMPUSERNAME);
  TemplateString := sdxHFFunctionTemplateUserName;
  Hint := sdxHFFunctionHintUserName;
end;

function TdxHFUserNameFunction.ConvertFunc(const Source: string;
  const FormatObject: TdxHFFunctionFormatObject): string;
begin
  Result := FormatObject.UserName
end;

class function TdxHFUserNameFunction.GetName: string;
begin
  Result := sdxHFFunctionNameUserName;
end;


{ TdxHFDateTimeFunctions }

class function TdxHFDateTimeFunctions.GetCategory: TdxHFFunctionCategoryClass;
begin
  Result := TdxHFFunctionDateTimeCategory;
end;


{ TdxHFDateTimeFunction }

constructor TdxHFDateTimeFunction.Create;
begin
  inherited Create;
  Glyph.LoadFromResourceID(hInstance, DXCP_BMPDATETIME);
  TemplateString := sdxHFFunctionTemplateDateTime;
  Hint := sdxHFFunctionHintDateTime;
end;

function TdxHFDateTimeFunction.ConvertFunc(const Source: string;
  const FormatObject: TdxHFFunctionFormatObject): string;
begin
  with FormatObject do
    Result := GetFormatedDate(DateTime, DateFormat) + ' ' +
      GetFormatedTime(DateTime, TimeFormat)
end;

class function TdxHFDateTimeFunction.GetName: string;
begin
  Result := sdxHFFunctionNameDateTime;
end;


{ TdxHFDateFunction }

constructor TdxHFDateFunction.Create;
begin
  inherited Create;
  Glyph.LoadFromResourceID(hInstance, DXCP_BMPDATE);
  TemplateString := sdxHFFunctionTemplateDate;
  Hint := sdxHFFunctionHintDate;
end;

function TdxHFDateFunction.ConvertFunc(const Source: string;
  const FormatObject: TdxHFFunctionFormatObject): string;
begin
  with FormatObject do
    Result := GetFormatedDate(DateTime, DateFormat)
end;

class function TdxHFDateFunction.GetName: string;
begin
  Result := sdxHFFunctionNameDate;
end;


{ TdxHFDateFunction }

constructor TdxHFTimeFunction.Create;
begin
  inherited Create;
  Glyph.LoadFromResourceID(hInstance, DXCP_BMPTIME);
  TemplateString := sdxHFFunctionTemplateTime;
  Hint := sdxHFFunctionHintTime;
end;

function TdxHFTimeFunction.ConvertFunc(const Source: string;
  const FormatObject: TdxHFFunctionFormatObject): string;
begin
  with FormatObject do
    Result := GetFormatedTime(DateTime, TimeFormat)
end;

class function TdxHFTimeFunction.GetName: string;
begin
  Result := sdxHFFunctionNameTime;
end;


{ TdxHFFunctionLibrary }

constructor TdxHFFunctionLibrary.Create;
begin
  inherited Create;
  FList := TStringList.Create;
end;

destructor TdxHFFunctionLibrary.Destroy;
begin
  Clear;
  FList.Free;
  inherited Destroy;
end;

procedure TdxHFFunctionLibrary.Assign(Source: TPersistent);
var
  I: Integer;
begin
  if (Source is TdxHFFunctionLibrary) then
  begin
    Clear;
    for I := 0 to TdxHFFunctionLibrary(Source).Count - 1 do
      Add(TdxHFFunctionLibrary(Source).Funcs[I].FunctionClass);
  end
  else
    inherited Assign(Source);
end;

procedure TdxHFFunctionLibrary.GetFunctions(AStrings: TStrings);
var
  I: Integer;
  AFunction: TdxHFFunction;
begin
  AStrings.BeginUpdate;
  try
    for I := 0 to Count - 1 do
    begin
      AFunction := Funcs[I];
      AStrings.AddObject(AFunction.TemplateString, AFunction);
    end;
  finally
    AStrings.EndUpdate;
  end;
end;

procedure TdxHFFunctionLibrary.GetFunctionsByCategory(ACategory: TdxHFFunctionCategoryClass;
  AStrings: TStrings);
var
  I: Integer;
  AFunction: TdxHFFunction;
begin
  AStrings.BeginUpdate;
  try
    for I := 0 to Count - 1 do
    begin
      AFunction := Funcs[I];
      if AFunction.GetCategory = ACategory then
        AStrings.AddObject(AFunction.TemplateString, AFunction);
    end;
  finally
    AStrings.EndUpdate;
  end;
end;

procedure TdxHFFunctionLibrary.Enumerate(Proc: TdxHFFunctionEnumProc);
var
  I: Integer;
begin
  if Assigned(Proc) then
    for I := 0 to Count - 1 do
      Proc(Self, Funcs[I]);
end;

function TdxHFFunctionLibrary.ProcessString(const Source: string;
  const FormatObject: TdxHFFunctionFormatObject): string;
var
  I, J, Left, Right: Integer;
  S: string;
begin
  Result := Source;
  if Length(Result) = 0 then Exit;
  I := 1;
  while I <= Length(Result) do
  begin
    while (I <= Length(Result)) and (Result[I] <> dxFunctionDelimiters[False]) do
      Inc(I);
    if I < Length(Result) then
      Left := I
    else
      Left := 0;
    if Left = 0 then Break;
    while (I <= Length(Result)) and (Result[I] <> dxFunctionDelimiters[True]) do
      Inc(I);
    if I <= Length(Result) then
      Right := I
    else
      Right := 0;
    if Right = 0 then Break;
    if Right - Left > 1 then
    begin
      S := System.Copy(Result, Left {+1}, Right - Left + 1 {-1});
      J := IndexOf(S);
      if (J <> -1) then
      begin
        System.Delete(Result, Left, Right - Left + 1);
        S := Funcs[J].DoProcess(S, FormatObject);
        if (S <> '') then
          System.Insert(' ' + S + ' ', Result, Left);
        I := Left + Length(S) + 2 {left and right spaces};
      end;
    end;
  end;
end;

function TdxHFFunctionLibrary.Add(AFunctionClass: TdxHFFunctionClass): TdxHFFunction;
begin
  Result := AFunctionClass.Create;
  FList.AddObject(Result.TemplateString, Result);
end;

procedure TdxHFFunctionLibrary.Clear;
begin
  while Count > 0 do Delete(Count - 1);
end;

procedure TdxHFFunctionLibrary.Delete(AIndex: Integer);
begin
  FList.Objects[AIndex].Free;
  FList.Delete(AIndex);
end;

function TdxHFFunctionLibrary.IndexOf(const ATemplateString: string): Integer;
begin
  Result := FList.IndexOf(ATemplateString);
end;

function TdxHFFunctionLibrary.IndexOfByName(const AFunctionName: string): Integer;
begin
  for Result := 0 to Count - 1 do
    if (AnsiCompareText(Funcs[Result].GetName, AFunctionName) = 0) then Exit;
  Result := -1;
end;

function TdxHFFunctionLibrary.IndexOfByClass(AFunctionClass: TdxHFFunctionClass): Integer;
begin
  for Result := 0 to Count - 1 do
    if Funcs[Result].FunctionClass = AFunctionClass then Exit;
//    if Assigned(AFunctionClass) and AFunctionClass.InheritsFrom(Funcs[Result].FunctionClass) then Exit;
  Result := -1;
end;

function TdxHFFunctionLibrary.GetFunction(Index: Integer): TdxHFFunction;
begin
  Result := TdxHFFunction(FList.Objects[Index]);
end;

procedure TdxHFFunctionLibrary.SetFunction(Index: Integer; Value: TdxHFFunction);
begin
  Funcs[Index].Assign(Value);
end;

function TdxHFFunctionLibrary.GetCount: Integer;
begin
  Result := FList.Count;
end;


{ TdxStdHFFunctionLibrary }

constructor TdxStandardHFFunctionLibrary.Create;
begin
  inherited Create;
  Add(TdxHFPageNumberFunction);
  Add(TdxHFTotalPagesFunction);
  Add(TdxHFPageOfPagesFunction);
  Add(TdxHFDateTimeFunction);
  Add(TdxHFDateFunction);
  Add(TdxHFTimeFunction);
  Add(TdxHFUserNameFunction);
  Add(TdxHFMachineNameFunction);
end;

function TdxStandardHFFunctionLibrary.HFDateFunction: TdxHFDateFunction;
var
  Index: Integer;
begin
  Index := IndexOfByClass(TdxHFDateFunction);
  if Index <> -1 then
    Result := Funcs[Index] as TdxHFDateFunction
  else
    Result := nil;
end;

function TdxStandardHFFunctionLibrary.HFTimeFunction: TdxHFTimeFunction;
var
  Index: Integer;
begin
  Index := IndexOfByClass(TdxHFTimeFunction);
  if Index <> -1 then
    Result := Funcs[Index] as TdxHFTimeFunction
  else
    Result := nil;
end;

{functions}

function DateFormats: TStrings;
begin
  if FDateFormats = nil then
  begin
    FDateFormats := TStringList.Create;
    if Assigned(dxGetDateFormatsProc) then dxGetDateFormatsProc(FDateFormats);
  end;
  Result := FDateFormats;
end;

function TimeFormats: TStrings;
begin
  if FTimeFormats = nil then
  begin
    FTimeFormats := TStringList.Create;
    if Assigned(dxGetTimeFormatsProc) then dxGetTimeFormatsProc(FTimeFormats);
  end;
  Result := FTimeFormats;
end;

procedure RefreshDateFormats;
begin
  if FDateFormats <> nil then FDateFormats.Free;
  FDateFormats := nil;
end;

procedure RefreshTimeFormats;
begin
  if FTimeFormats <> nil then FTimeFormats.Free;
  FTimeFormats := nil;
end;

procedure DeleteLeadingGarbage(var Source: string);
begin
  while (Length(Source) > 0) and (Source[1] in ['.', ',', ' ']) do
    Delete(Source, 1, 1);
end;

function ExtractLongMonthFormat(ExcludeDelimiters: Boolean): string;
const
  ValidChars: array[Boolean] of string = (' M:\.,/', ' M:\');
var
  I: Integer;
  Ch: char;
begin
  Result := '';
  for I := 1 to Length(LongDateFormat) do
  begin
    Ch := LongDateFormat[I];
    if Pos(Ch, ValidChars[ExcludeDelimiters]) <> 0 then
      Result := Result + Ch;
  end;
  Result := Trim(Result);
  DeleteLeadingGarbage(Result);
end;

function ReduceLongDayFormat: string;
var
  P: Integer;
begin
  Result := LongDateFormat;
  repeat
    P := Pos('dddd', Result);
    if P <> 0 then Delete(Result, P, 4);
  until P = 0;
  Result := Trim(Result);
  DeleteLeadingGarbage(Result);
end;

procedure dxGetDateFormats(AStrings: TStrings);
var
  P: Integer;
  S, S2: string;
begin
  AStrings.BeginUpdate;
  try
{1} AStrings.Add(ShortDateFormat);

    S := Trim(LongDateFormat);
    if Pos('dddd', S) = 0 then S := 'dddd, ' + S;
{2} AStrings.Add(S);

    S := ReduceLongDayFormat;
{3} AStrings.Add(S);

    S := ShortDateFormat;
    P := Pos('yyyy', S);
    if P <> 0 then
      System.Delete(S, P, 2)
    else
    begin
      P := Pos('yy', S);
      if P <> 0 then System.Insert('yy', S, P);
    end;
    S2 := S;
{4} AStrings.Add(S);
{5} AStrings.Add('yyyy-MM-dd');
{6} AStrings.Add('d-MMM-yy');

    S := ShortDateFormat;
    if DateSeparator <> '/' then
      S := ReplaceSubStr(S, DateSeparator, '/')
    else
      S := ReplaceSubStr(S, DateSeparator, '.');
{7} AStrings.Add(S);
{8} AStrings.Add(ExtractLongMonthFormat(False) + ' yyyy');
{9} AStrings.Add('d MMMM yyyy');
{10} AStrings.Add(ExtractLongMonthFormat(True) + ' yy');
{11} AStrings.Add('MMM-yy');
  finally
    AStrings.EndUpdate;
  end;
end;

{$IFDEF DELPHI6}
  {$IFDEF MSWINDOWS}
    {$WARN SYMBOL_PLATFORM OFF}	
  {$ENDIF}
{$ENDIF}

procedure dxGetTimeFormats(AStrings: TStrings);
var
  HourFormat: string;
begin
  if StrToIntDef(GetLocaleStr(GetThreadLocale, LOCALE_ITLZERO, '0'), 0) = 0 then
    HourFormat := 'h'
  else
    HourFormat := 'hh';
  with AStrings do
  begin
    BeginUpdate;
    try
      Add(HourFormat + ':mm tt');
      Add(HourFormat + ':mm:ss tt');
      Add(UpperCase(HourFormat) + ':mm');
      Add(UpperCase(HourFormat) + ':mm:ss');
    finally
      EndUpdate;
    end;
  end;
end;

{$IFDEF DELPHI6}
  {$IFDEF MSWINDOWS}
    {$WARN SYMBOL_PLATFORM ON}	
  {$ENDIF}
{$ENDIF}

function PageNumberFormats: TStrings;
begin
  if (FPageNumberFormats = nil) then
  begin
    FPageNumberFormats := TStringList.Create;
    FPageNumberFormats.Add('1, 2, 3, 4, 5, ...');
    FPageNumberFormats.Add('a, b, c, d, e, ...');
    FPageNumberFormats.Add('A, B, C, D, E, ...');
    FPageNumberFormats.Add('i, ii, iii, iv, v, ...');
    FPageNumberFormats.Add('I, II, III, IV, V, ...');
  end;
  Result := FPageNumberFormats;
end;

function _GetFormatedDate(const SystemTime: TSystemTime; Format: PChar;
  L: Integer): string;
begin
  SetLength(Result, L);
  SetLength(Result, GetDateFormat(0, 0, @SystemTime, Format, PChar(Result), L) - 1);
end;

function _GetFormatedTime(const SystemTime: TSystemTime; Format: PChar;
  L: Integer): string;
begin
  SetLength(Result, L);
  SetLength(Result, GetTimeFormat(0, 0, @SystemTime, Format, PChar(Result), L) - 1);
end;

function GetFormatedDate(const DateTime: TDateTime; const Format: string): string;
const
  L = 100;
var
  SystemTime: TSystemTime;
begin
  DateTimeToSystemTime(DateTime, SystemTime);
  Result := _GetFormatedDate(SystemTime, PChar(Format), L);
end;

function GetFormatedTime(const DateTime: TDateTime; const Format: string): string;
const
  L = 100;
var
  SystemTime: TSystemTime;
begin
  DateTimeToSystemTime(DateTime, SystemTime);
  Result := _GetFormatedTime(SystemTime, PChar(Format), L);
end;

procedure GetFormatedDateStrings(const DateTime: TDateTime; DateFormats,
  FormatedStrings: TStrings);
var
  I: Integer;
begin
  with FormatedStrings do
  begin
    BeginUpdate;
    try
      for I := 0 to DateFormats.Count - 1 do
        Add(GetFormatedDate(DateTime, DateFormats[I]));
    finally
      EndUpdate;
    end;
  end;
end;

procedure GetFormatedTimeStrings(const DateTime: TDateTime; TimeFormats,
  FormatedStrings: TStrings);
var
  I: Integer;
begin
  with FormatedStrings do
  begin
    BeginUpdate;
    try
      for I := 0 to TimeFormats.Count - 1 do
        Add(GetFormatedTime(DateTime, TimeFormats[I]));
    finally
      EndUpdate;
    end;
  end;
end;

var
  FHFFunctionLibrary: TdxHFFunctionLibrary;
  FHFFormatObject: TdxHFFunctionFormatObject;

initialization
  dxGetDateFormatsProc := dxGetDateFormats;
  dxGetTimeFormatsProc := dxGetTimeFormats;

  FHFFunctionLibrary := TdxStandardHFFunctionLibrary.Create;
  dxHFFunctionLibrary := FHFFunctionLibrary;

  FHFFormatObject := TdxHFFunctionFormatObject.Create;
  dxHFFormatObject := FHFFormatObject;

  dxPSRegisterPrintStyle(TBasedxPrintStyle, nil);

  if dxDefaultPrintStyleClass = nil then
    dxDefaultPrintStyleClass := TBasedxPrintStyle;

finalization
  dxPSUnregisterAllPrintStyles;

  if dxHFFormatObject = FHFFormatObject then dxHFFormatObject := nil;
  if FHFFormatObject <> nil then FHFFormatObject.Free;
  if dxHFFunctionLibrary = FHFFunctionLibrary then dxHFFunctionLibrary := nil;
  if FHFFunctionLibrary <> nil then FHFFunctionLibrary.Free;
  if FDateFormats <> nil then FDateFormats.Free;
  if FPageNumberFormats <> nil then FPageNumberFormats.Free;
  if FTimeFormats <> nil then FTimeFormats.Free;

end.

