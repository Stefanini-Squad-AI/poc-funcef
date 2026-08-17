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

unit dxPSdxMVLnk;

interface

{$I dxPSVer.inc}

uses                                            
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Menus, Db, dxMasterView, dxMasterViewColumns, 
  dxPSCore, dxPSGlbl, dxPSMD;

type
  TdxMasterViewPaintOption = 
    (mvpoHeaders, mvpoFooters, mvpoPreview, mvpoGrid, mvpoPreviewGrid, 
     mvpoGroupFooterGrid, mvpoFlatCheckMarks, mvpoTransparentColumnGraphic, 
     mvpoGraphicAsText, mvpo3DEffects, mvpoSoft3D, mvpoCheckMarksAsText);
  TdxMasterViewPaintOptions = set of TdxMasterViewPaintOption;
  TdxMasterViewLinkCellType = 
    (mvctUnknown, mvctCell, mvctFooter, mvctHeader, mvctPreview);
  TdxMasterViewDrawMode = (mvdmStrict, mvdmOddEven, mvdmBorrowSource);
  
  PdxMasterViewLevel = ^TdxMasterViewLevel;
  PdxMasterViewColumn = ^TdxMasterViewColumn;
  PdxMasterViewNode = ^TdxMasterViewNode;
  
  TdxMVReportLinkCustomDrawCellEvent = procedure(Sender: TBasedxReportLink;
    ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; ANode: TdxMasterViewNode; 
    AColumn: TdxMasterViewColumn; var AText: string; var AColor: TColor; 
    AFont: TFont; var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
    var ADone: Boolean) of object;
    
  TdxMVReportLinkCustomDrawFooterCellEvent = procedure(Sender: TBasedxReportLink;
    ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; ANode: TdxMasterViewNode; 
    AColumn: TdxMasterViewColumn; var AText: string; var AColor: TColor; 
    AFont: TFont; var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
    var ADone: Boolean) of object;
    
  TdxMVReportLinkCustomDrawHeaderCellEvent = procedure(Sender: TBasedxReportLink;
    ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; AColumn: TdxMasterViewColumn; 
    var AText: string; var AColor: TColor; AFont: TFont; 
    var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
    var ASorted: TdxCellSortOrder; var ADone: Boolean) of object;
    
  TdxMVReportLinkCustomDrawPreviewCellEvent = procedure(Sender: TBasedxReportLink;
    ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; ANode: TdxMasterViewNode; 
    var AText: string; var AColor: TColor; AFont: TFont; 
    var ADone: Boolean) of object;

    
  TdxMasterViewReportLink = class(TBasedxReportLink)
  private
    FAutoNodesExpand: Boolean;
    FCaptionColor: TColor;
    FCaptionNodeFont: TFont;
    FDrawMode: TdxMasterViewDrawMode;
    FEvenColor: TColor;
    FEvenFont: TFont;
    FExtendedSelect: Boolean;
    FFixedTransparent: Boolean;
    FFooterColor: TColor;
    FFooterFont: TFont;
    FGridLineColor: TColor;
    FGroupNodeFont: TFont;
    FGroupNodeColor: TColor;
    FHeaderColor: TColor;
    FHeaderFont: TFont;
    FOddFont: TFont;
    FOnlySelected: Boolean;
    FOptions: TdxMasterViewPaintOptions;
    FPreviewColor: TColor;
    FPreviewFont: TFont;
    FPreviewLineCount: Integer;
    FSupportedCustomDraw: Boolean;
  
    FOnCustomDrawCell: TdxMVReportLinkCustomDrawCellEvent;
    FOnCustomDrawFooterCell: TdxMVReportLinkCustomDrawFooterCellEvent;
    FOnCustomDrawHeaderCell: TdxMVReportLinkCustomDrawHeaderCellEvent;
    FOnCustomDrawPreviewCell: TdxMVReportLinkCustomDrawPreviewCellEvent;

    FColumnPlaces: TList;
    FCustomDrawFontChanged: Boolean;
    FDelimitersCells: TList;
    FFontIndexes: TList;
    FFonts: TList;
    FIndent: Integer;
    FLevels: TList;
    FNodes: TList;
    FSaveFont: TFont;
    FSelectedNodes: TList;
    
    FFooterLineHeight: Integer;
    FGroupNodeHeight: Integer;
    FHeaderLineHeight: Integer;
    FLevelCaptionHeight: Integer;
    FLineHeight: Integer;
    FPreviewFullHeight: Integer;
    FPreviewLineHeight: Integer;
    
    function GetOddColor: TColor;
    function GetOptions: TdxMasterViewPaintOptions;   
    procedure SetAutoNodesExpand(Value: Boolean);
    procedure SetCaptionColor(Value: TColor);
    procedure SetCaptionNodeFont(Value: TFont);
    procedure SetDrawMode(Value: TdxMasterViewDrawMode);
    procedure SetEvenColor(Value: TColor);
    procedure SetEvenFont(Value: TFont);
    procedure SetExtendedSelect(Value: Boolean);
    procedure SetFixedTransparent(Value: Boolean);
    procedure SetFooterFont(Value: TFont);
    procedure SetGridLineColor(Value: TColor);
    procedure SetFooterColor(Value: TColor);
    procedure SetGroupNodeFont(Value: TFont);
    procedure SetGroupNodeColor(Value: TColor);
    procedure SetHeaderColor(Value: TColor);
    procedure SetHeaderFont(Value: TFont);
    function GetMasterView: TdxMasterView;
    procedure SetOddColor(Value: TColor);
    procedure SetOddFont(Value: TFont);
    procedure SetOnCustomDrawCell(Value: TdxMVReportLinkCustomDrawCellEvent);
    procedure SetOnCustomDrawFooterCell(Value: TdxMVReportLinkCustomDrawFooterCellEvent);
    procedure SetOnCustomDrawHeaderCell(Value: TdxMVReportLinkCustomDrawHeaderCellEvent);
    procedure SetOnCustomDrawPreviewCell(Value: TdxMVReportLinkCustomDrawPreviewCellEvent);
    procedure SetOnlySelected(Value: Boolean);
    procedure SetOptions(Value: TdxMasterViewPaintOptions);
    procedure SetPreviewColor(Value: TColor);
    procedure SetPreviewFont(Value: TFont);
    procedure SetPreviewLineCount(Value: Integer);
    procedure SetSupportCustomDraw(Value: Boolean);
    
    procedure AddNodes;
    procedure BuildSelectedNodeList;    
    procedure CalcFontIndexes(AReportCells: TdxReportCells);
    procedure CustomDrawFontChanged(Sender: TObject);
    procedure FreeColumnPlaces;
    procedure FreeFontIndexes;
    function GetCellCustomDrawInfo(AItem: TdxReportVisualItem; 
      ANode: PdxMasterViewNode; AColumn: PdxMasterViewColumn): TdxMasterViewLinkCellType;
    function IsExtendedSelect: Boolean;
    function IsExistSelectedNodes: Boolean;
    function IsSelectedNode(ANode: TdxMasterViewNode): Boolean;    
    procedure LoadColumnPlaces;
    procedure LoadFontIndexes(AReportCells: TdxReportCells);
    function NodeExpanded(ANode: TdxMasterViewNode): Boolean;    
    procedure PrepareData(Value: Boolean);
  protected
    FCaptionNodeFontIndex: Integer;
    FEvenFontIndex: Integer;
    FGroupNodeFontIndex: Integer;
    FFooterFontIndex: Integer;
    FHeaderFontIndex: Integer;
    FOddFontIndex: Integer;
    FPreviewFontIndex: Integer;

    procedure ConstructReport(AReportCells: TdxReportCells); override;
    function GetEmptyPagesCanExist: Boolean; override;
    procedure InternalRestoreDefaults; override;
    procedure InternalRestoreFromOriginal; override;    
    procedure MakeDelimiters(AReportCells: TdxReportCells; 
      AHorzDelimiters, AVertDelimiters: TList); override;
    procedure PrepareConstruct(AReportCells: TdxReportCells); virtual;
    procedure UnprepareConstruct(AReportCells: TdxReportCells); virtual;
    
    procedure AssignValues(ADataItem: TAbstractdxReportCellData;
      ANode: TdxMasterViewNode; AColumn: TdxMasterViewColumn; 
      ACellType: TdxMasterViewLinkCellType); virtual;
    function GetDataClass(ANode: TdxMasterViewNode; AColumn: TdxMasterViewColumn; 
      ACellType: TdxMasterViewLinkCellType): TdxReportCellDataClass; virtual;
    
   { custom draw support }
    procedure CustomDraw(AItem: TAbstractdxReportCellData; ACanvas: TCanvas;
      ABoundsRect, AClientRect: TRect; var ADone: Boolean); override;
    procedure DoCustomDrawCell(ACanvas: TCanvas; ABoundsRect, 
      AClientRect: TRect; ANode: TdxMasterViewNode; AColumn: TdxMasterViewColumn; 
      var AText: string; var AColor: TColor; AFont: TFont; 
      var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
      var ADone: Boolean); virtual;
    procedure DoCustomDrawFooterCell(ACanvas: TCanvas; ABoundsRect, 
      AClientRect: TRect; ANode: TdxMasterViewNode; AColumn: TdxMasterViewColumn; 
      var AText: string; var AColor: TColor; AFont: TFont; 
      var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY;  
      var ADone: Boolean); virtual;
    procedure DoCustomDrawHeaderCell(ACanvas: TCanvas; ABoundsRect, 
      AClientRect: TRect; AColumn: TdxMasterViewColumn; var AText: string; 
      var AColor: TColor; AFont: TFont; var ATextAlignX: TdxTextAlignX; 
      var ATextAlignY: TdxTextAlignY; var ASorted: TdxCellSortOrder; 
      var ADone: Boolean); virtual;
    procedure DoCustomDrawPreviewCell(ACanvas: TCanvas; ABoundsRect, 
      AClientRect: TRect; ANode: TdxMasterViewNode; var AText: string; 
      var AColor: TColor; AFont: TFont; var ADone: Boolean); virtual;
    function IsSupportedCustomDraw(Item: TAbstractdxReportCellData): Boolean; override;

    { options access }
    function AutoCalcPreviewLines: Boolean;
    function FlatCheckMarks: Boolean;
    function GraphicsAsText: Boolean;
    function OddEvenMode: Boolean;
    function ShowFooters(ANode: TdxMasterViewNode): Boolean;
    function ShowGrid(ANode: TdxMasterViewNode): Boolean;
    function ShowHeaders(ANode: TdxMasterViewNode): Boolean;
    function ShowPreview(ANode: TdxMasterViewNode): Boolean;
    function ShowPreviewGrid(ANode: TdxMasterViewNode): Boolean;    
    function ShowGroupFooterGrid: Boolean;    
    function TransparentColumnGraphics: Boolean;
    function Use3DEffects: Boolean;
    function UseSoft3D: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    
    property MasterView: TdxMasterView read GetMasterView;
  published
    property AutoNodesExpand: Boolean read FAutoNodesExpand write SetAutoNodesExpand
      default False;
    property CaptionColor: TColor read FCaptionColor write SetCaptionColor
      default clSilver;
    property CaptionNodeFont: TFont read FCaptionNodeFont write SetCaptionNodeFont;
    property Color;
    property DrawMode: TdxMasterViewDrawMode read FDrawMode write SetDrawMode
      default mvdmStrict;
    property EvenColor: TColor read FEvenColor write SetEvenColor
      default clWhite;
    property EvenFont: TFont read FEvenFont write SetEvenFont;
    property ExtendedSelect: Boolean read FExtendedSelect write SetExtendedSelect
      default True;
    property FixedTransparent: Boolean read FFixedTransparent write SetFixedTransparent
      default False;
    property Font;
    property FooterColor: TColor read FFooterColor write SetFooterColor
      default clSilver;
    property FooterFont: TFont read FFooterFont write SetFooterFont;
    property GridLineColor: TColor read FGridLineColor write SetGridLineColor
      default clBlack;
    property GroupNodeFont: TFont read FGroupNodeFont write SetGroupNodeFont;
    property GroupNodeColor: TColor read FGroupNodeColor write SetGroupNodeColor
      default clSilver;
    property HeaderColor: TColor read FHeaderColor write SetHeaderColor
      default clSilver;
    property HeaderFont: TFont read FHeaderFont write SetHeaderFont;
    property OddColor: TColor read GetOddColor write SetOddColor
      default clWhite;
    property OddFont: TFont read FOddFont write SetOddFont;
    property OnlySelected: Boolean read FOnlySelected write SetOnlySelected
      default False;
    property Options: TdxMasterViewPaintOptions read GetOptions write SetOptions
      default [mvpoHeaders, mvpoFooters, mvpoPreview, mvpoGrid, mvpoPreviewGrid, 
        mvpoGroupFooterGrid, mvpoFlatCheckMarks, mvpo3DEffects, mvpoSoft3D];
    property PreviewColor: TColor read FPreviewColor write SetPreviewColor
      default clWhite;
    property PreviewFont: TFont read FPreviewFont write SetPreviewFont;
    property PreviewLineCount: Integer read FPreviewLineCount write SetPreviewLineCount
      default -1;
    property ScaleFonts;
    property ShowEmptyPages;
    property SupportedCustomDraw: Boolean read FSupportedCustomDraw write SetSupportCustomDraw
      default False;
    property Transparent;
    property UseHorzDelimiters;
    property UseVertDelimiters;
  
    property OnCustomDrawCell: TdxMVReportLinkCustomDrawCellEvent
      read FOnCustomDrawCell write SetOnCustomDrawCell;
    property OnCustomDrawFooterCell: TdxMVReportLinkCustomDrawFooterCellEvent
      read FOnCustomDrawFooterCell write SetOnCustomDrawFooterCell;
    property OnCustomDrawHeaderCell: TdxMVReportLinkCustomDrawHeaderCellEvent
      read FOnCustomDrawHeaderCell write SetOnCustomDrawHeaderCell;
    property OnCustomDrawPreviewCell: TdxMVReportLinkCustomDrawPreviewCellEvent
      read FOnCustomDrawPreviewCell write SetOnCustomDrawPreviewCell;
  end;


  TdxMVReportLinkDesignWindow = class(TAbstractdxReportLinkDesignWindow)
    PageControl1: TPageControl;
    tshOptions: TTabSheet;
    Bevel5: TBevel;
    Bevel9: TBevel;
    Bevel11: TBevel;
    lblPreviewLineCount: TLabel;
    bvlPreviewLineCountHolder: TBevel;
    Image6: TImage;
    lblShow: TLabel;
    lblMiscellaneous: TLabel;
    Bevel16: TBevel;
    imgGrid: TImage;
    lblGrid: TLabel;
    chbxShowGrid: TCheckBox;
    chbxShowGroupFooterGrid: TCheckBox;
    chbxShowHeaders: TCheckBox;
    chbxShowFooters: TCheckBox;
    chbxShowPreview: TCheckBox;
    chbxFlatCheckMarks: TCheckBox;
    chbxAutoCalcPreviewLines: TCheckBox;
    tshColors: TTabSheet;
    Bevel2: TBevel;
    lblGridLineColor: TLabel;
    bvlGridLineColorHolder: TBevel;
    gbxFixedTransparent: TGroupBox;
    lblHeaderColor: TLabel;
    lblFooterColor: TLabel;
    bvlHeaderColorHolder: TBevel;
    bvlFooterColorHolder: TBevel;
    lblGroupNodeColor: TLabel;
    bvlGroupNodeColorHolder: TBevel;
    gbxTransparent: TGroupBox;
    lblColor: TLabel;
    bvlColorHolder: TBevel;
    lblPreviewColor: TLabel;
    bvlPreviewColorHolder: TBevel;
    lblEvenColor: TLabel;
    bvlEvenColorHolder: TBevel;
    chbxTransparent: TCheckBox;
    chbxFixedTransparent: TCheckBox;
    tshFonts: TTabSheet;
    Bevel3: TBevel;
    btnChangeFont: TButton;
    lbxFonts: TListBox;
    tshBeh: TTabSheet;
    Bevel6: TBevel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    Image3: TImage;
    Image4: TImage;
    lblSelection: TLabel;
    lblExpanding: TLabel;
    lblGraphics: TLabel;
    bvlGraphic: TBevel;
    imgGraphics: TImage;
    lbl3DEffects: TLabel;
    Image8: TImage;
    Bevel15: TBevel;
    chbxTransparentColumnGraphic: TCheckBox;
    chbxDisplayGraphicsAsText: TCheckBox;
    chbxOnlySelected: TCheckBox;
    chbxExtendedSelect: TCheckBox;
    chbxAutoNodesExpand: TCheckBox;
    chbxUse3DEffects: TCheckBox;
    chbxUseSoft3D: TCheckBox;
    pnlPreview: TPanel;
    lblPreview: TStaticText;
    Panel5: TPanel;
    FD: TFontDialog;
    pmChangeFont: TPopupMenu;
    miChangeFont: TMenuItem;
    lblLevelCaptionColor: TLabel;
    bvlCaptionColorHolder: TBevel;
    chbxShowPreviewGrid: TCheckBox;
    lblDrawMode: TLabel;
    cbxDrawMode: TComboBox;
    dxMVPreview: TdxMasterView;
    mvsCaptionStyle: TdxMasterViewStyle;
    mvsContentStyle: TdxMasterViewStyle;
    mvsFooterStyle: TdxMasterViewStyle;
    mvsGroupStyle: TdxMasterViewStyle;
    mvsHeaderStyle: TdxMasterViewStyle;
    mvsPreviewStyle: TdxMasterViewStyle;
    mvsAnotherContentStyle: TdxMasterViewStyle;
    chbxCheckMarksAsText: TCheckBox;
    procedure ShowClick(Sender: TObject);
    procedure chbxAutoNodesExpandClick(Sender: TObject);
    procedure chbxOnlySelectedClick(Sender: TObject);
    procedure chbxExtendedSelectClick(Sender: TObject);
    procedure chbxAutoCalcPreviewLinesClick(Sender: TObject);
    procedure chbxTransparentClick(Sender: TObject);
    procedure btnChangeFontClick(Sender: TObject);
    procedure lbxFontsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbxFontsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbxFontsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbxFontsClick(Sender: TObject);
    procedure cbxDrawModeChange(Sender: TObject);
    procedure pmChangeFontPopup(Sender: TObject);
    procedure lbxFontsDblClick(Sender: TObject);
  private
    FccbxColor: TCustomComboBox;
    FccbxEvenColor: TCustomComboBox;
    FccbxCaptionColor: TCustomComboBox;
    FccbxHeaderColor: TCustomComboBox;
    FccbxGroupNodeColor: TCustomComboBox;
    FccbxPreviewColor: TCustomComboBox;
    FccbxFooterColor: TCustomComboBox;
    FccbxGridLineColor: TCustomComboBox;
    FPreviewBox: TCustomControl;    
    FsePreviewLineCount: TCustomEdit;

    FMVDetailLevel: TdxMasterViewLevel;    
    FMVMasterLevel: TdxMasterViewLevel;
    FMVColumnAddress: TdxMasterViewColumn;
    FMVColumnName: TdxMasterViewColumn;
    FMVColumnCash: TdxMasterViewCheckColumn;
    FMVColumnCount: TdxMasterViewColumn;
    FMVColumnPrice: TdxMasterViewColumn;
    FdsDetail: TDataSource;    
    FdsMaster: TDataSource;
    FmdDetail: TdxEasyMemData;
    FmdMaster: TdxEasyMemData;
    
    FLastIndex: Integer;

    procedure ccbxColorChange(Sender: TObject);
    procedure CreateControls;
    procedure CreateDataSets;
    procedure DoChangeFont(Index: Integer);
    procedure dxMVPreviewGetContentStyle(Sender: TdxMasterViewLevel; 
      Node: TdxMasterViewNode; Column: TdxMasterViewColumn; 
      var NewStyle: TdxMasterViewStyle);
    function GetFontByIndex(AIndex: Integer): TFont;
    function GetFontInfoText(AIndex: Integer): string;
    function GetMasterViewReportLink: TdxMasterViewReportLink;
    function GetMaxWidth: Integer;
    procedure InitializeMasterView;
    function IsChangeFontEnabled: Boolean;
    function IsDisableIndex(AIndex: Integer): Boolean;    
    procedure LoadMemData;
    procedure pbxPreviewPaint(Sender: TObject);
    procedure PreviewLineCountChange(Sender: TObject);
    procedure CMDialogChar(var Msg: TCMDialogChar); message CM_DIALOGCHAR;
  protected
    procedure DoInitialize; override;
    procedure LoadStrings; override;
    procedure PaintPreview(ACanvas: TCanvas; R: TRect); override;
    procedure UpdateControlsState; override;
    procedure UpdatePreview; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;    
    property MasterViewReportLink: TdxMasterViewReportLink read GetMasterViewReportLink;
  end;

const
  dxDefaultMasterViewPaintOptions: TdxMasterViewPaintOptions = 
    [mvpoHeaders, mvpoFooters, mvpoPreview, mvpoGrid, mvpoPreviewGrid, 
     mvpoGroupFooterGrid, mvpoFlatCheckMarks, mvpo3DEffects, mvpoSoft3D];
  
implementation

{$R *.DFM}

uses
  dxExtCtrls, dxPSRes, dxPSPopupMan, dxPrnDev, dxPSUtl;

type
  PColumnPlace = ^TColumnPlace;
  TColumnPlace = record
    Column: TdxMasterViewColumn;
    RowIndex, ColIndex, RowCount: Integer;
  end;

  TdxMasterViewColumnAccess = class(TdxMasterViewColumn);
  TdxMasterViewLevelAccess = class(TdxMasterViewLevel);
  TdxMasterViewNodeAccess = class(TdxMasterViewNode);
  TdxMasterViewCheckColumnAccess = class(TdxMasterViewCheckColumn);
  TdxMasterViewImageColumnAccess = class(TdxMasterViewImageColumn);
  TdxMasterViewGraphicColumnAccess = class(TdxMasterViewGraphicColumn);
    
function ExposeLevel(ALevel: TdxMasterViewLevel): TdxMasterViewLevelAccess;
begin
  Result := TdxMasterViewLevelAccess(ALevel);
end;

function ExposeNode(ANode: TdxMasterViewNode): TdxMasterViewNodeAccess;
begin
  Result := TdxMasterViewNodeAccess(ANode);
end;

function ExposeColumn(AColumn: TdxMasterViewColumn): TdxMasterViewColumnAccess;
begin
  Result := TdxMasterViewColumnAccess(AColumn);
end;


{ TdxMasterViewReportLink }

constructor TdxMasterViewReportLink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCaptionNodeFont := TFont.Create;
  FEvenFont := TFont.Create;
  FFooterFont := TFont.Create;
  FGroupNodeFont := TFont.Create;
  FHeaderFont := TFont.Create;
  FOddFont := TFont.Create;
  FPreviewFont := TFont.Create;
  InternalRestoreDefaults;
  FCaptionNodeFont.OnChange := FontChanged;
  FEvenFont.OnChange := FontChanged;
  FFooterFont.OnChange := FontChanged;
  FGroupNodeFont.OnChange := FontChanged;
  FHeaderFont.OnChange := FontChanged; 
  FOddFont.OnChange := FontChanged; 
  FPreviewFont.OnChange := FontChanged; 
  LinkModified(False);
  FNodes := TList.Create;
  FDelimitersCells := TList.Create;
  FSaveFont := TFont.Create;
  FSaveFont.OnChange := CustomDrawFontChanged;
end;

destructor TdxMasterViewReportLink.Destroy;
begin
  FSaveFont.Free;
  FDelimitersCells.Free;
  FNodes.Free;
  FPreviewFont.Free;
  FOddFont.Free;
  FHeaderFont.Free;
  FGroupNodeFont.Free;
  FFooterFont.Free;
  FEvenFont.Free;
  FCaptionNodeFont.Free;
  inherited Destroy;
end;

procedure TdxMasterViewReportLink.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TdxMasterViewReportLink) then
  begin
    AutoNodesExpand := TdxMasterViewReportLink(Source).AutoNodesExpand;
    DrawMode := TdxMasterViewReportLink(Source).DrawMode;
    ExtendedSelect := TdxMasterViewReportLink(Source).ExtendedSelect;
    FixedTransparent := TdxMasterViewReportLink(Source).FixedTransparent;
    OnlySelected := TdxMasterViewReportLink(Source).OnlySelected;
    Options := TdxMasterViewReportLink(Source).Options;
    PreviewLineCount := TdxMasterViewReportLink(Source).PreviewLineCount;
    SupportedCustomDraw := TdxMasterViewReportLink(Source).SupportedCustomDraw;

    EvenColor := TdxMasterViewReportLink(Source).EvenColor;
    GroupNodeColor := TdxMasterViewReportLink(Source).GroupNodeColor;
    GridLineColor := TdxMasterViewReportLink(Source).GridLineColor;
    HeaderColor := TdxMasterViewReportLink(Source).HeaderColor;
    PreviewColor := TdxMasterViewReportLink(Source).PreviewColor;
    FooterColor := TdxMasterViewReportLink(Source).FooterColor;

    CaptionNodeFont := TdxMasterViewReportLink(Source).CaptionNodeFont;
    EvenFont := TdxMasterViewReportLink(Source).EvenFont;
    HeaderFont := TdxMasterViewReportLink(Source).HeaderFont;
    OddFont := TdxMasterViewReportLink(Source).OddFont;
    PreviewFont := TdxMasterViewReportLink(Source).PreviewFont;
    FooterFont := TdxMasterViewReportLink(Source).FooterFont;
    GroupNodeFont := TdxMasterViewReportLink(Source).GroupNodeFont;
  end;
end;

function TdxMasterViewReportLink.GetMasterView: TdxMasterView;
begin
  Result := TdxMasterView(Component);
end;

procedure TdxMasterViewReportLink.CustomDrawFontChanged(Sender: TObject);
begin
  FCustomDrawFontChanged := True;
end;

function TdxMasterViewReportLink.GetCellCustomDrawInfo(AItem: TdxReportVisualItem;  
  ANode: PdxMasterViewNode; AColumn: PdxMasterViewColumn): TdxMasterViewLinkCellType;
var
  Parent: TdxReportCell;  
begin
  Result := mvctUnknown;
  try
    if AItem.Data <> 0 then 
    begin
      if TObject(AItem.Data) is TdxMasterViewColumn then
      begin
        Parent := AItem.Parent;
        if Parent <> nil then 
          if Parent.Data = 0 then
            Result := mvctHeader
          else 
            if TObject(Parent.Data) is TdxMasterViewNode then 
            begin
              Parent := Parent.Parent;
              if Parent <> nil then 
                if Parent = AItem.ReportCells.Cells then 
                  Result := mvctCell
                else  
                  Result := mvctFooter
            end;    
      end  
      else 
        if TObject(AItem.Data) is TdxMasterViewNode then  // Caption Node
          Result := mvctCell
    end      
    else
    begin
      Parent := AItem.Parent;
      if (Parent <> nil) and (Parent.Data <> 0) and 
        (TObject(Parent.Data) is TdxMasterViewNode) then 
        Result := mvctPreview;
    end;   
  except
    // eat exception if any Node or Column already deleted      
  end;  
    
  if Result <> mvctUnknown then 
  begin
    if (AColumn <> nil) and (Result <> mvctPreview) then 
      AColumn^ := TdxMasterViewColumn(AItem.Data);
    if (ANode <> nil) and (Result <> mvctHeader) then
      ANode^ := TdxMasterViewNode(AItem.Parent.Data);
  end;    
end;

procedure TdxMasterViewReportLink.CustomDraw(AItem: TAbstractdxReportCellData;
  ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; var ADone: Boolean);
var
  AColumn: TdxMasterViewColumn;
  ANode: TdxMasterViewNode;
  AColor: TColor;
  ASorted: TdxCellSortOrder;
  AText: string;
  ATextAlignX: TdxTextAlignX;
  ATextAlignY: TdxTextAlignY;
  ACellType: TdxMasterViewLinkCellType;
begin
  if AItem.Data = 0 then Exit;
  ACellType := GetCellCustomDrawInfo(AItem, @ANode, @AColumn);
  if ACellType = mvctUnknown then Exit;
  with TdxReportCellString(AItem) do
  begin
    ParentColor := False;
    AColor := ColorToRGB(Color);
    if Transparent then AColor := clNone;
    FSaveFont.Assign(Font);
    FCustomDrawFontChanged := False;
    AText := Text;
    if ACellType = mvctHeader then ASorted := SortOrder;
    if ACellType <> mvctPreview then 
    begin
      ATextAlignX := TextAlignX;
      ATextAlignY := TextAlignY;
    end;  
    case ACellType of 
      mvctCell:
        DoCustomDrawCell(ACanvas, ABoundsRect, AClientRect, ANode, AColumn, 
          AText, AColor, FSaveFont, ATextAlignX, ATextAlignY, ADone);
      mvctFooter:
        DoCustomDrawFooterCell(ACanvas, ABoundsRect, AClientRect, ANode, AColumn, 
          AText, AColor, FSaveFont, ATextAlignX, ATextAlignY, ADone);
      mvctHeader:
        DoCustomDrawHeaderCell(ACanvas, ABoundsRect, AClientRect, AColumn, AText, 
          AColor, FSaveFont, ATextAlignX, ATextAlignY, ASorted, ADone);
      mvctPreview:                                          
        DoCustomDrawPreviewCell(ACanvas, ABoundsRect, AClientRect, ANode, AText, 
          AColor, FSaveFont, ADone);
    end;
    if not ADone then
    begin
      if FCustomDrawFontChanged then
      begin 
        SelectObject(ACanvas.Handle, FSaveFont.Handle);
        SetTextColor(ACanvas.Handle, ColorToRGB(FSaveFont.Color));
        FontIndex := -1;
      end;  
      if AColor <> clNone then
      begin
        Color := AColor;
        Transparent := False;
      end;
      Text := AText;
      if ACellType = mvctHeader then SortOrder := ASorted;
      if ACellType <> mvctPreview then 
      begin
        TextAlignX := ATextAlignX;
        TextAlignY := ATextAlignY;
      end;  
    end;
  end;
end;

procedure TdxMasterViewReportLink.SetSupportCustomDraw(Value: Boolean);
begin
  if (FSupportedCustomDraw <> Value) then
  begin
    FSupportedCustomDraw := Value;
    LinkModified(True);
  end;
end;

function TdxMasterViewReportLink.IsSupportedCustomDraw(Item: TAbstractdxReportCellData): Boolean;
begin
  Result := SupportedCustomDraw;
  if Result and (Item <> nil) {and (Item.Data <> 0)} then
    case GetCellCustomDrawInfo(Item, nil, nil) of 
      mvctCell: 
        Result := Assigned(FOnCustomDrawCell);
      mvctFooter: 
        Result := Assigned(FOnCustomDrawFooterCell);
      mvctHeader:
        Result := Assigned(FOnCustomDrawHeaderCell);
      mvctPreview:
        Result := Assigned(FOnCustomDrawPreviewCell);
    else 
      Result := False;
    end;    
end;

procedure TdxMasterViewReportLink.DoCustomDrawCell(ACanvas: TCanvas; 
  ABoundsRect, AClientRect: TRect; ANode: TdxMasterViewNode; 
  AColumn: TdxMasterViewColumn; var AText: string; var AColor: TColor; 
  AFont: TFont; var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
  var ADone: Boolean);
begin
  if Assigned(FOnCustomDrawCell) then 
    FOnCustomDrawCell(Self, ACanvas, ABoundsRect, AClientRect, ANode, AColumn, 
      AText, AColor, AFont, ATextAlignX, ATextAlignY, ADone);
end;      
  
procedure TdxMasterViewReportLink.DoCustomDrawFooterCell(ACanvas: TCanvas; 
  ABoundsRect, AClientRect: TRect; ANode: TdxMasterViewNode; 
  AColumn: TdxMasterViewColumn; var AText: string; var AColor: TColor; 
  AFont: TFont; var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
  var ADone: Boolean);
begin
  if Assigned(FOnCustomDrawFooterCell) then 
    FOnCustomDrawFooterCell(Self, ACanvas, ABoundsRect, AClientRect, ANode, 
      AColumn, AText, AColor, AFont, ATextAlignX, ATextAlignY, ADone);
end;      
  
procedure TdxMasterViewReportLink.DoCustomDrawHeaderCell(ACanvas: TCanvas; 
  ABoundsRect, AClientRect: TRect; AColumn: TdxMasterViewColumn; 
  var AText: string; var AColor: TColor; AFont: TFont; 
  var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
  var ASorted: TdxCellSortOrder; var ADone: Boolean);
begin
  if Assigned(FOnCustomDrawHeaderCell) then 
    FOnCustomDrawHeaderCell(Self, ACanvas, ABoundsRect, AClientRect, AColumn, 
      AText, AColor, AFont, ATextAlignX, ATextAlignY, ASorted, ADone);
end;
  
procedure TdxMasterViewReportLink.DoCustomDrawPreviewCell(ACanvas: TCanvas; 
  ABoundsRect, AClientRect: TRect; ANode: TdxMasterViewNode; var AText: string; 
  var AColor: TColor; AFont: TFont; var ADone: Boolean);
begin
  if Assigned(FOnCustomDrawPreviewCell) then 
    FOnCustomDrawPreviewCell(Self, ACanvas, ABoundsRect, AClientRect, ANode, 
      AText, AColor, AFont, ADone);
end;
  
function TdxMasterViewReportLink.AutoCalcPreviewLines: Boolean;
begin
  Result := PreviewLineCount = -1;
end;

function TdxMasterViewReportLink.FlatCheckMarks: Boolean;
begin
  Result := mvpoFlatCheckMarks in Options;
end;

function TdxMasterViewReportLink.GraphicsAsText: Boolean;
begin
  Result := mvpoGraphicAsText in Options;
end;

function TdxMasterViewReportLink.ShowFooters(ANode: TdxMasterViewNode): Boolean;
begin
  if (DrawMode = mvdmBorrowSource) and (ANode <> nil) then
    Result := lovFooter in ANode.Level.OptionsView
  else
    Result := mvpoFooters in Options;
end;

function TdxMasterViewReportLink.ShowGrid(ANode: TdxMasterViewNode): Boolean;
begin
  if (DrawMode = mvdmBorrowSource) and (ANode <> nil) then
    Result := lovGrid in ANode.Level.OptionsView
  else
    Result := mvpoGrid in Options;
end;

function TdxMasterViewReportLink.ShowGroupFooterGrid: Boolean;
begin
  Result := mvpoGroupFooterGrid in Options;
end;

function TdxMasterViewReportLink.ShowHeaders(ANode: TdxMasterViewNode): Boolean;
begin
  if (DrawMode = mvdmBorrowSource) and (ANode <> nil) then
    Result := lovHeader in ANode.Level.OptionsView
  else
    Result := mvpoHeaders in Options;
end;

function TdxMasterViewReportLink.ShowPreviewGrid(ANode: TdxMasterViewNode): Boolean;
begin
  if (DrawMode = mvdmBorrowSource) and (ANode <> nil) then
    Result := lovGridWithPreview in ANode.Level.OptionsView
  else
    Result := mvpoPreviewGrid in Options;
end;

function TdxMasterViewReportLink.ShowPreview(ANode: TdxMasterViewNode): Boolean;
begin
  if (DrawMode = mvdmBorrowSource) and (ANode <> nil) then
    Result := lovPreview in ANode.Level.OptionsView
  else
    Result := mvpoPreview in Options;
end;

function TdxMasterViewReportLink.IsExtendedSelect: Boolean;
begin
  Result := IsExistSelectedNodes and ExtendedSelect;
end;

function TdxMasterViewReportLink.IsExistSelectedNodes: Boolean;
begin
  Result := OnlySelected and (MasterView.SelectedItemCount > 0);
end;

function TdxMasterViewReportLink.IsSelectedNode(ANode: TdxMasterViewNode): Boolean;

  function IsExistSelectedChild(ANode: TdxMasterViewNode): Boolean;
  var
    I, J: Integer;
  begin
    Result := False;
    with MasterView do 
      for I := 0 to ANode.Count - 1 do
      begin
        for J := 0 to SelectedItemCount - 1 do
        begin
          Result := (ANode[I] = SelectedItems[J]);
          if Result then Exit;
        end;
        if (ANode[I].Count > 0) then
        begin
          Result := IsExistSelectedChild(ANode[I]);
          if Result then Exit;
        end;
      end;
  end;

  function FindInOriginal(ANode: TdxMasterViewNode): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    with MasterView do 
      for I := 0 to SelectedItemCount - 1 do
      begin
        Result := ANode = SelectedItems[I];
        if Result then Exit;
      end;
  end;

  function FindInChildren(ANode: TdxMasterViewNode): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := 0 to ANode.Count - 1 do
    begin
      Result := FindInOriginal(ANode[I]);
      if Result then
        Break
      else 
        if ANode[I].Count > 0 then
          Result := FindInChildren(ANode[I]);
      if Result then Break;
    end;
  end;

  function FindInParent(ANode: TdxMasterViewNode): Boolean;
  begin
    Result := False;
    ANode := ANode.ParentNode;
    while Assigned(ANode) do
    begin
      Result := FindInOriginal(ANode);
      if Result then Break;
      ANode := ANode.ParentNode;
    end;
  end;

begin
  Result := FindInOriginal(ANode);
  if not Result and (ANode.Count > 0) then
    Result := FindInChildren(ANode);
  if not Result and not IsExtendedSelect then
    Result := FindInParent(ANode);
end;

function TdxMasterViewReportLink.TransparentColumnGraphics: Boolean;
begin
  Result := mvpoTransparentColumnGraphic in Options;
end;

function TdxMasterViewReportLink.OddEvenMode: Boolean;
begin
  Result := DrawMode = mvdmOddEven;
end;

function TdxMasterViewReportLink.Use3DEffects: Boolean;
begin
  Result := mvpo3DEffects in Options;
end;

function TdxMasterViewReportLink.UseSoft3D: Boolean;
begin
  Result := mvpoSoft3D in Options;
end;

procedure TdxMasterViewReportLink.SetExtendedSelect(Value: Boolean);
begin
  if FExtendedSelect <> Value then
  begin
    FExtendedSelect := Value;
    LinkModified(True);
  end;
end;

procedure TdxMasterViewReportLink.SetOnlySelected(Value: Boolean);
begin
  if FOnlySelected <> Value then
  begin
    FOnlySelected := Value;
//    if OnlySelected then FAutoNodesExpand := False;
    LinkModified(True);
  end;
end;

procedure TdxMasterViewReportLink.SetAutoNodesExpand(Value: Boolean);
begin
  if FAutoNodesExpand <> Value then
  begin
    FAutoNodesExpand := Value;
    //if AutoNodesExpand then FOnlySelected := False;
    LinkModified(True);
  end;
end;

procedure TdxMasterViewReportLink.SetDrawMode(Value: TdxMasterViewDrawMode);
begin
  if FDrawMode <> Value then
  begin
    FDrawMode := Value;
    LinkModified(True);
  end;
end;

function TdxMasterViewReportLink.GetOptions: TdxMasterViewPaintOptions;
begin
  Result := FOptions;
end;

procedure TdxMasterViewReportLink.SetOptions(Value: TdxMasterViewPaintOptions);
begin
  if FOptions <> Value then
  begin
    FOptions := Value;
    LinkModified(True);
  end;
end;

procedure TdxMasterViewReportLink.SetOddFont(Value: TFont);
begin
  FOddFont.Assign(Value);
end;

procedure TdxMasterViewReportLink.SetEvenFont(Value: TFont);
begin
  FEvenFont.Assign(Value);
end;

procedure TdxMasterViewReportLink.SetHeaderFont(Value: TFont);
begin
  FHeaderFont.Assign(Value);
end;

procedure TdxMasterViewReportLink.SetCaptionNodeFont(Value: TFont);
begin
  FCaptionNodeFont.Assign(Value);
end;

procedure TdxMasterViewReportLink.SetGroupNodeFont(Value: TFont);
begin
  FGroupNodeFont.Assign(Value);
end;

procedure TdxMasterViewReportLink.SetPreviewFont(Value: TFont);
begin
  FPreviewFont.Assign(Value);
end;

procedure TdxMasterViewReportLink.SetFooterFont(Value: TFont);
begin
  FFooterFont.Assign(Value);
end;

procedure TdxMasterViewReportLink.SetEvenColor(Value: TColor);
begin
  if FEvenColor <> Value then
  begin
    FEvenColor := Value;
    if OddEvenMode then LinkModified(True);
  end;
end;

function TdxMasterViewReportLink.GetOddColor: TColor;
begin
  Result := Color;
end;

procedure TdxMasterViewReportLink.SetOddColor(Value: TColor);
begin
  inherited Color := Value;
end;

procedure TdxMasterViewReportLink.SetGroupNodeColor(Value: TColor);
begin
  if FGroupNodeColor <> Value then
  begin
    FGroupNodeColor := Value;
    LinkModified(True);
  end;
end;

procedure TdxMasterViewReportLink.SetCaptionColor(Value: TColor);
begin
  if FCaptionColor <> Value then
  begin
    FCaptionColor := Value;
    LinkModified(True);
  end;
end;

procedure TdxMasterViewReportLink.SetGridLineColor(Value: TColor);
begin
  if FGridLineColor <> Value then
  begin
    FGridLineColor := Value;
    LinkModified(True);
  end;
end;

procedure TdxMasterViewReportLink.SetHeaderColor(Value: TColor);
begin
  if FHeaderColor <> Value then
  begin
    FHeaderColor := Value;
    LinkModified(True);
  end;
end;

procedure TdxMasterViewReportLink.SetPreviewColor(Value: TColor);
begin
  if FPreviewColor <> Value then
  begin
    FPreviewColor := Value;
    LinkModified(True);
  end;
end;

procedure TdxMasterViewReportLink.SetFooterColor(Value: TColor);
begin
  if FFooterColor <> Value then
  begin
    FFooterColor := Value;
    LinkModified(True);
  end;
end;

procedure TdxMasterViewReportLink.SetFixedTransparent(Value: Boolean);
begin
  if FFixedTransparent <> Value then
  begin
    FFixedTransparent := Value;
    LinkModified(True);
  end;
end;

procedure TdxMasterViewReportLink.SetPreviewLineCount(Value: Integer);
begin
  if FPreviewLineCount < -1 then FPreviewLineCount := -1;
  if FPreviewLineCount <> Value then
  begin
    FPreviewLineCount := Value;
    LinkModified(True);
  end;
end;

procedure TdxMasterViewReportLink.SetOnCustomDrawCell
  (Value: TdxMVReportLinkCustomDrawCellEvent);
begin
  if @FOnCustomDrawCell <> @Value then
  begin
    FOnCustomDrawCell := Value;
    LinkModified(True);
  end;
end;

procedure TdxMasterViewReportLink.SetOnCustomDrawFooterCell
  (Value: TdxMVReportLinkCustomDrawFooterCellEvent);
begin
  if @FOnCustomDrawFooterCell <> @Value then
  begin
    FOnCustomDrawFooterCell := Value;
    LinkModified(True);
  end;
end;

procedure TdxMasterViewReportLink.SetOnCustomDrawHeaderCell
  (Value: TdxMVReportLinkCustomDrawHeaderCellEvent);
begin
  if @FOnCustomDrawHeaderCell <> @Value then
  begin
    FOnCustomDrawHeaderCell := Value;
    LinkModified(True);
  end;
end;

procedure TdxMasterViewReportLink.SetOnCustomDrawPreviewCell
  (Value: TdxMVReportLinkCustomDrawPreviewCellEvent);
begin
  if @FOnCustomDrawPreviewCell <> @Value then
  begin
    FOnCustomDrawPreviewCell := Value;
    LinkModified(True);
  end;
end;

procedure TdxMasterViewReportLink.InternalRestoreFromOriginal;

  procedure XorOption(var AOptions: TdxMasterViewPaintOptions; 
    AItem: TdxMasterViewPaintOption; AValue: Boolean);
  begin
    if AValue then
      Include(AOptions, AItem)
    else
      Exclude(AOptions, AItem);
  end;

  procedure SetColorAndFont(AStyle: TdxMasterViewStyle; AFont: TFont; var AColor: TColor);
  begin
    if AStyle <> nil then 
    begin
      if svFont in AStyle.AssignedValues then AFont.Assign(AStyle.Font);
      if svColor in AStyle.AssignedValues then AColor := AStyle.Color;    
    end;  
  end;
  
var
  Level: TdxMasterViewLevel;  
begin
  inherited InternalRestoreFromOriginal;
  if (MasterView = nil) or (MasterView.Levels.Count = 0) then Exit;
  
  Level := MasterView.Levels[0];
  PreviewLineCount := Level.PreviewLineCount;
  FGridLineColor := Level.GridLinesColor;
  
  Font := MasterView.Font;

  SetColorAndFont(Level.ContentStyle, Font, FColor);
  SetColorAndFont(Level.HeaderStyle, HeaderFont, FHeaderColor);  
  SetColorAndFont(Level.PreviewStyle, PreviewFont, FPreviewColor);    
  SetColorAndFont(Level.GroupStyle, GroupNodeFont, FGroupNodeColor);      
  SetColorAndFont(Level.FooterStyle, FooterFont, FFooterColor);        
  SetColorAndFont(Level.CaptionStyle, CaptionNodeFont, FCaptionColor);          
  
  XorOption(FOptions, mvpoHeaders, lovHeader in Level.OptionsView);
  XorOption(FOptions, mvpoFooters, lovFooter in Level.OptionsView);
  XorOption(FOptions, mvpoPreview, lovPreview in Level.OptionsView);
  XorOption(FOptions, mvpoGrid, lovGrid in Level.OptionsView);      
  XorOption(FOptions, mvpoPreviewGrid, lovGridWithPreview in Level.OptionsView);        
end;

procedure TdxMasterViewReportLink.InternalRestoreDefaults;
begin
  inherited InternalRestoreDefaults;
  FAutoNodesExpand := False;
  DrawMode := mvdmStrict;
  FixedTransparent := False;
  FOnlySelected := False;
  Options := dxDefaultMasterViewPaintOptions;
  FPreviewLineCount := -1;
  FSupportedCustomDraw := False;

  FEvenColor := Color;
  FGridLineColor := dxDefaultGridLineColor;
  FGroupNodeColor := dxDefaultFixedColor;
  FCaptionColor := dxDefaultFixedColor;
  FHeaderColor := dxDefaultFixedColor;
  FFooterColor := dxDefaultFixedColor;
  FPreviewColor := Color;

  CaptionNodeFont := Font;
  EvenFont := Font;
  FooterFont := Font;  
  GroupNodeFont := Font;
  HeaderFont := Font;
  OddFont := Font;  
  PreviewFont := Font;

  FExtendedSelect := True;
end;

function TdxMasterViewReportLink.GetEmptyPagesCanExist: Boolean;
begin
  Result := True;
end;

procedure TdxMasterViewReportLink.MakeDelimiters(AReportCells: TdxReportCells; 
  AHorzDelimiters, AVertDelimiters: TList);

  procedure IterateChildrens(ACell: TdxReportCell);
  var
    I: Integer;
    Cell: TdxReportCell;
  begin
    for I := 0 to ACell.CellCount - 1 do
    begin
      Cell := ACell[I];
      AVertDelimiters.Add(Pointer(Cell.AbsoluteOrigin.Y));
      if Cell.HasChildren then IterateChildrens(Cell);
    end;
  end;

var
  I, J: Integer;
  Cell: TdxReportCell;
begin
  inherited MakeDelimiters(AReportCells, AHorzDelimiters, AVertDelimiters);
  if AReportCells.Cells.CellCount = 0 then Exit;

  // horizontally
  if UseHorzDelimiters then     
    for I := 0 to FDelimitersCells.Count - 1 do
    begin
      Cell := TdxReportCell(FDelimitersCells.List^[I]);
      for J := 0 to Cell.DataItemCount - 1 do 
        with Cell.DataItems[J] do 
        begin
          AHorzDelimiters.Add(Pointer(AbsoluteOrigin.X));
          AHorzDelimiters.Add(Pointer(AbsoluteOrigin.X + Width));
        end;  
    end;
  
  //vertically
  if UseVertDelimiters then   
    IterateChildrens(AReportCells.Cells);
end;

function TdxMasterViewReportLink.GetDataClass(ANode: TdxMasterViewNode; 
  AColumn: TdxMasterViewColumn; ACellType: TdxMasterViewLinkCellType): TdxReportCellDataClass;
const
  CheckClasses: array[Boolean] of TdxReportCellDataClass = (TdxReportCellCheckImage, TdxReportCellString);
  ImageClasses: array[Boolean] of TdxReportCellDataClass = (TdxReportCellGraphic, TdxReportCellImage);  
  GraphicClasses: array[Boolean] of TdxReportCellDataClass = (TdxReportCellString, TdxReportCellGraphic);    
begin
  case ACellType of 
    mvctCell:
      if ANode.NodeType in [ntCaption, ntGroup] then
        Result := TdxReportCellString
      else
        if AColumn is TdxMasterViewCheckColumn then
          Result := CheckClasses[mvpoCheckMarksAsText in Options]
        else 
          if AColumn is TdxMasterViewImageColumn then
            Result := ImageClasses[TdxMasterViewImageColumn(AColumn).ShowDescription]
          else
            Result := GraphicClasses[(AColumn is TdxMasterViewGraphicColumn) and not (mvpoGraphicAsText in Options)];
    mvctFooter, 
    mvctPreview:
      Result := TdxReportCellString;
    mvctHeader:
      Result := TdxReportCellImage;
  else
    Result := TdxReportCellString;
  end;
end;

procedure TdxMasterViewReportLink.AssignValues(ADataItem: TAbstractdxReportCellData;
  ANode: TdxMasterViewNode; AColumn: TdxMasterViewColumn; ACellType: TdxMasterViewLinkCellType);
const
  dxSortOrder: array[TdxMasterViewSortOrder] of TdxCellSortOrder = (csoNone, csoUp, csoDown);  
var
  AState: TdxMVCheckState;
  ANullStyle: TdxMVShowNullFieldStyle;  
  AGraphicClass: TGraphicClass;
begin
  if ADataItem is TdxReportCellCheck then 
  begin
    with TdxMasterViewCheckColumnAccess(AColumn) do 
    begin
      AState := GetCheckState(ANode.Strings[Index]);
      ANullStyle := ShowNullFieldStyle;
    end;  
    with TdxReportCellCheck(ADataItem) do
    begin
      Enabled := not ((AState = csInactive) and (ANullStyle > nfsUnchecked));
      Checked := (AState = csChecked) or 
        ((AState = csInactive) and (ANullStyle = nfsGrayedChecked));
      FlatBorder := FlatCheckMarks;
    end;
  end 
  else if ADataItem is TdxReportCellImage then 
  begin
    with TdxReportCellImage(ADataItem) do
    begin
      if (ACellType = mvctCell) then     
      begin
        EndEllipsis := (movDrawEndEllipsis in MasterView.OptionsView);
        ImageIndex := TdxMasterViewImageColumnAccess(AColumn).GetItemIndex(ANode);
        ImageList := TdxMasterViewImageColumn(AColumn).Images;
        Multiline := AColumn.Multiline;
        if (ImageIndex > -1) and 
          (ImageIndex < TdxMasterViewImageColumn(AColumn).Items.Count) 
        then 
          Text := TdxMasterViewImageColumn(AColumn).Items.Descriptions[ImageIndex];
        TextAlignX := dxTextAlignX[AColumn.Alignment];
        MakeSpaceForEmptyImage := (ACellType = mvctCell);
      end
      else
      begin
        EndEllipsis := (movDrawEndEllipsis in MasterView.OptionsView);
        if not AColumn.HeaderGlyph.Empty then 
        begin
          Image := AColumn.HeaderGlyph;
          ImageLayout := dxImageLayout[AColumn.HeaderGlyphAlignment]
        end;
        Multiline := False;
        Text := AColumn.Caption;
        SortOrder := dxSortOrder[AColumn.SortOrder];
        TextAlignX := dxTextAlignX[AColumn.HeaderAlignment];
      end;  
      TextAlignY := dxMultilineTextAlignY[Multiline];
    end
  end
  else if ADataItem is TdxReportCellGraphic then 
  begin
    if AColumn is TdxMasterViewImageColumn then  {ShowDescription} 
      with TdxReportCellGraphic(ADataItem) do 
      begin
        DrawMode := gdmCenter;
        ImageIndex := TdxMasterViewImageColumnAccess(AColumn).GetItemIndex(ANode);
        ImageList := TdxMasterViewImageColumn(AColumn).Images;
      end  
    else
    begin
      AGraphicClass := TdxMasterViewGraphicColumnAccess(AColumn).GetGraphicClass(ANode);
      TdxMasterViewGraphicColumnAccess(AColumn).LoadPicture(AGraphicClass, 
        ANode.Values[AColumn.Index]);
      with TdxReportCellGraphic(ADataItem) do 
      begin
        Image := TdxMasterViewGraphicColumn(AColumn).Picture.Graphic;  
        ImageTransparent := TransparentColumnGraphics;
        if not Assigned(AGraphicClass) then AGraphicClass := TBitmap;
        if not AGraphicClass.InheritsFrom(TIcon) and TdxMasterViewGraphicColumn(AColumn).Stretch then
          DrawMode := gdmStretchProportional
        else
          DrawMode := gdmNone;
      end
    end  
  end 
  else if ADataItem is TdxReportCellString then
  begin
    with TdxReportCellString(ADataItem) do 
    begin 
      if (ACellType = mvctFooter) then
      begin
        Text := ExposeColumn(AColumn).GetFooterText(ANode);
        TextAlignX := dxTextAlignX[AColumn.FooterAlignment];        
      end  
      else
      begin
        if (AColumn is TdxMasterViewGraphicColumn) then
          Text := sdxGraphicAsTextValue
        else
        begin
          Multiline := AColumn.Multiline;
          if Multiline then 
            Text := ANode.Values[AColumn.Index]
          else
            Text := ANode.Strings[AColumn.Index];
        end;    
        TextAlignX := dxTextAlignX[AColumn.Alignment];
      end;  
      EndEllipsis := (movDrawEndEllipsis in MasterView.OptionsView);
      TextAlignY := dxMultilineTextAlignY[Multiline];
    end;  
  end  
end;      
  
procedure TdxMasterViewReportLink.PrepareData(Value: Boolean);
begin
  if Value and AutoNodesExpand then 
    MasterView.Items.LoadChildren(True);
end;
 
procedure TdxMasterViewReportLink.PrepareConstruct(AReportCells: TdxReportCells);
var
  DC: hDC;
  APrevFont: hDC;
  ASize: TSize;
begin
  DC := GetDC(0);
  APrevFont := SelectObject(DC, Font.Handle);

  GetTextExtentPoint32(DC, 'Wg', Length('Wg'), ASize);
  FLineHeight := ASize.cY + 6;

  SelectObject(DC, HeaderFont.Handle);
  GetTextExtentPoint32(DC, 'Wg', Length('Wg'), ASize);
  FHeaderLineHeight := ASize.cY + 6;

  SelectObject(DC, FooterFont.Handle);
  GetTextExtentPoint32(DC, 'Wg', Length('Wg'), ASize);
  FFooterLineHeight := ASize.cY + 6 + 2 * Byte(ShowGroupFooterGrid);

  SelectObject(DC, CaptionNodeFont.Handle);
  GetTextExtentPoint32(DC, 'Wg', Length('Wg'), ASize);
  FLevelCaptionHeight := ASize.cY + 6;

  SelectObject(DC, GroupNodeFont.Handle);
  GetTextExtentPoint32(DC, 'Wg', Length('Wg'), ASize);
  FGroupNodeHeight := ASize.cY + 6;

  SelectObject(DC, PreviewFont.Handle);
  GetTextExtentPoint32(DC, 'Wg', Length('Wg'), ASize);
  FPreviewLineHeight := ASize.cY + 2;
    
  SelectObject(DC, APrevFont);
  ReleaseDC(0, DC);

  FIndent := 20;
  PrepareData(True);
  CalcFontIndexes(AReportCells);
  LoadColumnPlaces;
  AddNodes;
  FDelimitersCells.Clear;
  if IsExistSelectedNodes then 
  begin
    FSelectedNodes := TList.Create;
    BuildSelectedNodeList;
  end;
end;    

procedure TdxMasterViewReportLink.UnprepareConstruct(AReportCells: TdxReportCells);
begin
  FSelectedNodes.Free;
  FreeFontIndexes;
  FreeColumnPlaces;
  PrepareData(False);
end;

procedure TdxMasterViewReportLink.CalcFontIndexes(AReportCells: TdxReportCells);
begin
  FCaptionNodeFontIndex := AddFontToPool(CaptionNodeFont);
  FEvenFontIndex := AddFontToPool(EvenFont);
  FGroupNodeFontIndex := AddFontToPool(GroupNodeFont);
  FFooterFontIndex := AddFontToPool(FooterFont);
  FHeaderFontIndex := AddFontToPool(HeaderFont);
  FOddFontIndex := AddFontToPool(OddFont);
  FPreviewFontIndex := AddFontToPool(PreviewFont);
  if DrawMode = mvdmBorrowSource then LoadFontIndexes(AReportCells);
end;

procedure TdxMasterViewReportLink.LoadFontIndexes(AReportCells: TdxReportCells);
var
  I, Index: Integer;
  F: TFont;
  Style: TdxMasterViewStyle;
begin
  FFonts := TList.Create;
  FFonts.Capacity := 1 + MasterView.StyleCount;  
  
  FFontIndexes := TList.Create;
  FFontIndexes.Capacity := 1 + MasterView.StyleCount;
    
  F := MasterView.Font;
  FFonts.Add(F);
  Index := AddFontToPool(F);
  FFontIndexes.Add(Pointer(Index));
  
  for I := 0 to MasterView.StyleCount - 1 do
  begin
    Style := MasterView.Styles[I];
    if svFont in Style.AssignedValues then 
    begin
      F := Style.Font;
      FFonts.Add(F);
      Index := AddFontToPool(F);
      FFontIndexes.Add(Pointer(Index));
    end;  
  end;  
end;

procedure TdxMasterViewReportLink.FreeFontIndexes;
begin
  if FFontIndexes <> nil then FFontIndexes.Free;
  FFontIndexes := nil;
  if FFonts <> nil then FFonts.Free;
  FFonts := nil;
end;

procedure TdxMasterViewReportLink.LoadColumnPlaces;
var
  I: Integer;
  List: TList;
  Level: TdxMasterViewLevelAccess;
begin
  FLevels := TList.Create;
  FLevels.Capacity := MasterView.AbsoluteLevelCount;
  FColumnPlaces := TList.Create;
  FColumnPlaces.Capacity := FLevels.Capacity;
  for I := 0 to MasterView.AbsoluteLevelCount - 1 do
  begin
    Level := ExposeLevel(MasterView.AbsoluteLevels[I]);
    FLevels.Add(Level);
    Level.SaveVisibleColumnsPlaces(List);
    FColumnPlaces.Add(List);    
  end;
end;  

procedure TdxMasterViewReportLink.FreeColumnPlaces;
var
  I: Integer;
  Level: TdxMasterViewLevelAccess;
  ColumnPlace: TList;
begin
  if (FColumnPlaces <> nil) then 
  begin
    for I := 0 to FColumnPlaces.Count - 1 do
    begin
      Level := FLevels.List^[I];
      ColumnPlace := FColumnPlaces.List^[I];
      Level.FreeVisibleColumnsPlaces(ColumnPlace);
    end;  
    FColumnPlaces.Free;
    FColumnPlaces := nil;
  end;    
  FLevels.Free; 
  FLevels := nil;
end;

function TdxMasterViewReportLink.NodeExpanded(ANode: TdxMasterViewNode): Boolean;
begin
  Result := ANode.Expanded or (AutoNodesExpand and ExposeNode(ANode).CanExpand);
end;

procedure TdxMasterViewReportLink.AddNodes;

  procedure AddNode(ANode: TdxMasterViewNode);
  var
    I: Integer;
    Node: TdxMasterViewNode;
  begin
    for I := 0 to ANode.Count - 1 do
    begin
      Node := ANode[I];
      if not IsExistSelectedNodes or IsSelectedNode(Node) then 
        FNodes.Add(Node);        
      if NodeExpanded(Node) then 
        AddNode(Node);
    end;
  end;
  
begin
  FNodes.Clear;
  if not AutoNodesExpand then 
    if OnlySelected then
      FNodes.Capacity := MasterView.SelectedItemCount
    else
      FNodes.Capacity := MasterView.AbsoluteItemCount;
  AddNode(MasterView.Items);
end;

function SortFunc(AItem1, AItem2: Pointer): Integer;
begin
  Result := Integer(TdxMasterViewNode(AItem1).ParentNode) - Integer(TdxMasterViewNode(AItem2).ParentNode);
  if Result = 0 then
    Result := TdxMasterViewNode(AItem1).Index - TdxMasterViewNode(AItem2).Index;
end;

procedure TdxMasterViewReportLink.BuildSelectedNodeList;
var
  I: Integer;
  Node, TestNode: TdxMasterViewNode;
begin
  for I := 0 to MasterView.SelectedItemCount - 1 do 
    FSelectedNodes.Add(MasterView.SelectedItems[I]);
  FSelectedNodes.Sort(SortFunc);
  Node := nil;
  for I := 0 to FSelectedNodes.Count - 1 do 
  begin
    TestNode := FSelectedNodes.List^[I];
    if (Node <> nil) and (TestNode.ParentNode = Node.ParentNode) then 
      FSelectedNodes[I] := nil
    else
      Node := TestNode;
  end;  
  FSelectedNodes.Pack;
end;

procedure TdxMasterViewReportLink.ConstructReport(AReportCells: TdxReportCells);

  function CalcPreviewHeight(const S: string; AWidth: Integer): Integer;
  const
    CalcFormat: UINT = 
     {DT_EDITCONTROL or }DT_LEFT or DT_WORDBREAK or DT_CALCRECT or DT_EXPANDTABS or DT_NOPREFIX;
  var
    DC: hDC;
    PrevFont: HFONT;
    R: TRect;
  begin
    R := Rect(0, 0, AWidth, 0);
    DC := GetDC(0);
    PrevFont := SelectObject(DC, PreviewFont.Handle);
    Result := 2 + Windows.DrawText(DC, PChar(S), Length(S), R, CalcFormat);
    SelectObject(DC, PrevFont);
    ReleaseDC(0, DC);
  end;

  function GetPreviewHeight(const S: string; AWidth: Integer): Integer;
  begin
    if AutoCalcPreviewLines then
      if (S <> '') then
        Result := CalcPreviewHeight(S, AWidth)
      else
        Result := 0
    else
      Result := PreviewLineCount * FPreviewLineHeight;
  end;

  function GetItemHeight(ANode: TdxMasterViewNode; ACellType: TdxMasterViewLinkCellType; 
    AFullHeight: Boolean; AWidth: Integer; APreviewHeight: PInteger): Integer;
  var
    ALineHeight: Integer;  
  begin
    case ANode.NodeType of
      ntData:
        begin
          case ACellType of
            mvctCell:
              ALineHeight := FLineHeight;
            mvctFooter:
              ALineHeight := FFooterLineHeight;
            mvctHeader:
              ALineHeight := FHeaderLineHeight;
          else
            ALineHeight := FLineHeight;
          end;
          if AFullHeight then 
            Result := ANode.Level.Layout.RowCount * ALineHeight
          else
            Result := ALineHeight;
          if (APreviewHeight <> nil) then
          begin
            APreviewHeight^ := GetPreviewHeight(ANode.PreviewText, 
              AWidth - ANode.Level.PreviewLeftIndent);
            if AFullHeight then Inc(Result, APreviewHeight^);
          end;
        end;
      ntCaption:  
        Result := FLevelCaptionHeight;
      ntGroup:
        Result := FGroupNodeHeight;
    else    
      Result := FLevelCaptionHeight;
    end;
  end;

  function IsGridExists(ANode: TdxMasterViewNode): Boolean;
  begin
    Result := ((ANode.PreviewText <> '') and (lovGridWithPreview in ANode.Level.OptionsView)) or 
      (lovGrid in ANode.Level.OptionsView)
  end;
  
  function GetLevelWidth(ALevel: TdxMasterViewLevel): Integer;
  var
    Decrease, Increase: Integer;
  begin
    Decrease := -2;
    Result := ALevel.Layout.VisibleWidth;
    repeat
      Increase := ALevel.GroupColumnCount;
      if lovCaption in ALevel.OptionsView then Inc(Increase);
      if ALevel.Parent <> MasterView.Levels then Inc(Increase);
      Inc(Result, FIndent * Increase);
//      if not (lovGrid in ALevel.Parent.OptionsView) then Dec(Result);
      Inc(Decrease);
      ALevel := ALevel.Parent;
    until ALevel = MasterView.Levels;
    
    if Decrease > 0 then 
      Dec(Result, Decrease)
    else 
      Inc(Result, Decrease);
  end;
  
  function CanShowPreviewGrid(ANode: TdxMasterViewNode): Boolean;
  begin
    Result := ShowGrid(ANode) and ShowPreviewGrid(ANode);
  end;

  function CanShowGroupFooterGrid(ANode: TdxMasterViewNode): Boolean;
  begin
    Result := ShowGrid(ANode) and ShowGroupFooterGrid;
  end;
  
  function GetDataItemSides(ANode: TdxMasterViewNode; AColumnPlace: PColumnPlace;
    ACellType: TdxMasterViewLinkCellType): TdxCellSides;
  begin
    Result := [];
    case ACellType of
      mvctCell:
        case ANode.NodeType of
          ntData:
            if CanShowPreviewGrid(ANode) then
            begin
              Result := csAll;
              if AColumnPlace^.ColIndex = 0 then Result := Result - [csLeft];
            end
            else
            begin
              if ANode.Level.Layout.IsColumnLast(AColumnPlace^.Column) or (ANode.Level.ViewMode = vmVertical) then
                Result := Result + [csRight];
              if ShowGrid(ANode) then
              begin
                if AColumnPlace^.RowIndex = 0 then
                  Result := Result + [csTop];
                if (not ShowPreview(ANode) or (FPreviewLineCount = 0) or (ANode.Level.ViewMode = vmVertical)) and 
  //                (ANode.Count > 0) and 
                  ((AColumnPlace^.RowIndex + AColumnPlace^.RowCount) = ANode.Level.Layout.RowCount) then
                  Result := Result + [csBottom];
              end;    
            end;
          ntGroup,
          ntCaption:  
            if CanShowPreviewGrid(ANode) then Result := csAll - [csLeft];
        end;   
            
      mvctPreview:
        begin
          Result := [csRight];
          if ShowGrid(nil) then
          begin
            Result := Result + [csBottom];  
            if ShowPreviewGrid(ANode) then Result := Result + [csTop];  
          end;  
        end;  
          
      mvctHeader:
        Result := csAll;
        
      mvctFooter:
        if CanShowGroupFooterGrid(ANode) then Result := csAll;
    end;
  end;
  
  function GetParentLevelsSeparatorWidth(ALevel: TdxMasterViewLevel): Integer;
  begin
    Result := 0;
    while (ALevel <> nil) do
    begin
      Inc(Result, ALevel.LevelSeparatorWidth);
      ALevel := ALevel.Parent;
    end;
  end;

  function GetDataItemRect(ANode: TdxMasterViewNode; AColumnPlace: PColumnPlace;
    ACell: TdxReportCell; ACellType: TdxMasterViewLinkCellType): TRect;
  var 
    AColumn: TdxMasterViewColumnAccess;
    ALineHeight, ANodeLevelIndex, ColIndex: Integer;
    Layout: TdxMasterViewLayout;
  begin   
    AColumn := nil;
    ColIndex := 0;
    if (AColumnPlace <> nil) then 
    begin
      AColumn := ExposeColumn(AColumnPlace^.Column);
      ColIndex := AColumnPlace^.ColIndex;
    end;  
    ANodeLevelIndex := ExposeNode(ANode).GetLevelIndex;
    ALineHeight := GetItemHeight(ANode, ACellType, False, 0, nil);
    Result := Rect(0, 0, 0, 0);
    with Result do
    begin
      if (AColumn <> nil) then
      begin
        Left := AColumn.Offset + MasterView.LeftPos - GetParentLevelsSeparatorWidth(ANode.Level.Parent);
        Inc(Left, ANodeLevelIndex);
        if not IsGridExists(ANode) then Inc(Left);
        if (ACellType = mvctCell) and (ANode.NodeType = ntData) and 
          (ANode.Level.ViewMode = vmHorizontal) and (ColIndex = 0) and 
          ExposeNode(ANode).HasExpandButton then 
          Inc(Left, FIndent);
        Top := AColumnPlace^.RowIndex * ALineHeight;
        Bottom := Top + AColumnPlace^.RowCount * ALineHeight;
        if (ANode.Level.ViewMode = vmHorizontal) then 
        begin
          Right := Left + AColumn.VisibleWidth;
          if (ACellType = mvctCell) and (ANode.NodeType = ntData) and 
            ExposeNode(ANode).HasExpandButton and (ColIndex = 0) then 
            Dec(Right, FIndent);
          if AColumn.Level.Layout.IsColumnLast(AColumn) then  
            Right := ACell.BoundsRect.Right;
        end  
        else
        begin
          Layout := ANode.Level.Layout;
          if (ACellType in [mvctCell, mvctFooter]) then 
          begin
            if ShowHeaders(ANode) then 
              Inc(Left, Layout.HeaderWidths[ColIndex]);
            Right := Left + Layout.ContentWidths[ColIndex];
            if not ShowHeaders(ANode) then 
              Inc(Right, Layout.HeaderWidths[ColIndex]);
          end
          else
            Right := Left + Layout.HeaderWidths[ColIndex];
        end     
      end          
      else
      begin
        Right := Left + GetLevelWidth(ANode.Level);
        Bottom := Top + ACell.Height;
      end;  
      if (ANode.NodeType > ntData) then 
        Inc(Left, FIndent * (ANodeLevelIndex + 1));
    end;   
    if (ACellType = mvctFooter) then 
    begin 
      OffsetRect(Result, -ACell.Left, 0);
      InflateRect(Result, -2, -2);
      if Use3DEffects then OffsetRect(Result, 0, -1);
    end;
    if Use3DEffects and (ACellType in [mvctFooter, mvctHeader]) then 
    begin
      Inc(Result.Left);
      Inc(Result.Top);
    end;
  end;
     
  function GetPreviewRect(ANode: TdxMasterViewNode; ACell: TdxReportCell): TRect;
  begin
    with Result do
    begin
      Left := FIndent * ExposeNode(ANode).GetLevelIndex;
      if (ANode.NodeType = ntData) and ExposeNode(ANode).HasExpandButton then 
        Inc(Left, FIndent);
      Top := ACell.Height - FPreviewFullHeight;
      Right := ACell.Width;
      Bottom := ACell.Height;
    end;
  end;
  
  function GetNodeFontIndex(ANode: TdxMasterViewNode; AIsOdd, ADirect: Boolean): Integer;
  begin
    case ANode.NodeType of
      ntData:
        if ADirect then 
          Result := FFontIndex
        else
          if AIsOdd then 
            Result := FOddFontIndex
          else
            Result := FEvenFontIndex;
      ntCaption:
        Result := FCaptionNodeFontIndex;
    else {ntGroup}
      Result := FGroupNodeFontIndex;
    end;
  end;

  function GetFontIndex(AFont: TFont): Integer;
  var
    I: Integer;
  begin
    I := FFonts.IndexOf(AFont);
    if I > -1 then 
      Result := Integer(FFontIndexes.List^[I])
    else
      Result := FFontIndex;
  end;
  
  function GetCellFontIndex(ANode: TdxMasterViewNode; AColumn: TdxMasterViewColumn; 
     ACellType: TdxMasterViewLinkCellType; AIsOdd: Boolean): Integer;
  begin
    case ACellType of 
      mvctCell,
      mvctPreview:
        case DrawMode of
          mvdmStrict:
            if ACellType = mvctPreview then 
              Result := FPreviewFontIndex
            else 
              Result := GetNodeFontIndex(ANode, AIsOdd, True);
          mvdmOddEven:
            if ACellType = mvctPreview then 
              Result := FPreviewFontIndex
            else 
              Result := GetNodeFontIndex(ANode, AIsOdd, False);
        else {mvdmBorrowSource}
          if ACellType = mvctPreview then         
            Result := GetFontIndex(ExposeLevel(ANode.Level).PreviewFont)
          else 
            if AColumn <> nil then 
              Result := GetFontIndex(ExposeColumn(AColumn).ContentFont)
            else 
              case ANode.NodeType of
                ntData:
                  Result := GetFontIndex(ExposeLevel(ANode.Level).ContentFont);
                ntCaption:
                  Result := GetFontIndex(ExposeLevel(ANode.Level).CaptionFont);
              else {ntGroup}
                Result := GetFontIndex(ExposeLevel(ANode.Level).GroupFont);
              end;
        end;   
      mvctHeader:
        if DrawMode < mvdmBorrowSource then 
          Result := FHeaderFontIndex
        else
          if AColumn <> nil then 
            Result := GetFontIndex(ExposeColumn(AColumn).HeaderFont)
          else  
            Result := GetFontIndex(ExposeLevel(ANode.Level).HeaderFont);
      mvctFooter:
        if DrawMode < mvdmBorrowSource then       
          Result := FFooterFontIndex
        else
          if AColumn <> nil then 
            Result := GetFontIndex(ExposeColumn(AColumn).FooterFont)
          else 
            Result := GetFontIndex(ExposeLevel(ANode.Level).FooterFont);
    else
      Result := 0;        
    end;   
  end;

  function GetNodeColor(ANode: TdxMasterViewNode; AIsOdd, ADirect: Boolean): TColor;
  begin
    case ANode.NodeType of
      ntData:
        if ADirect then 
          Result := Color
        else
          if AIsOdd then 
            Result := OddColor
          else
            Result := EvenColor;
      ntCaption:
        Result := CaptionColor;
    else {ntGroup}
      Result := GroupNodeColor;
    end;
  end;
  
  function GetCellColor(ANode: TdxMasterViewNode; AColumn: TdxMasterViewColumn; 
     ACellType: TdxMasterViewLinkCellType; AIsOdd: Boolean): TColor;
  var 
    IsOdd: Boolean;
  begin
    case ACellType of 
      mvctCell,
      mvctPreview:
        case DrawMode of
          mvdmStrict:
            if ACellType = mvctPreview then 
              Result := PreviewColor
            else 
              Result := GetNodeColor(ANode, AIsOdd, True);
          mvdmOddEven:
            {
            if (ACellType = mvctPreview) then 
              Result := PreviewColor
            else 
            }
              Result := GetNodeColor(ANode, AIsOdd, False);
        else {mvdmBorrowSource}
          begin
            IsOdd := Odd(ANode.Index) and (ANode.NodeType = ntData);          
            if (ACellType = mvctPreview) then         
              if IsOdd then 
              begin
                Result := ExposeLevel(ANode.Level).PreviewAnotherColor;
                if (Result = clNone) then 
                  Result := ExposeLevel(ANode.Level).PreviewColor;
              end
              else
                Result := ExposeLevel(ANode.Level).PreviewColor
            else 
              if (AColumn <> nil) then 
                if IsOdd then 
                begin
                  Result := ExposeColumn(AColumn).ContentAnotherColor;
                  if (Result = clNone) then 
                    Result := ExposeLevel(ANode.Level).ContentColor;
                end
                else
                  Result := ExposeColumn(AColumn).ContentColor
              else 
                case ANode.NodeType of
                  ntData:
                    if IsOdd then 
                    begin
                      Result := ExposeLevel(ANode.Level).ContentAnotherColor;
                      if (Result = clNone) then 
                        Result := ExposeLevel(ANode.Level).ContentColor;
                    end
                    else
                      Result := ExposeLevel(ANode.Level).ContentColor;                  
                  ntCaption:
                     Result := ExposeLevel(ANode.Level).CaptionColor;
                else {ntGroup}
                  Result := ExposeLevel(ANode.Level).GroupColor;
                end;
          end;
        end;   
      mvctHeader:
        if DrawMode < mvdmBorrowSource then 
          Result := HeaderColor
        else 
          if Assigned(AColumn) then 
            Result := ExposeColumn(AColumn).HeaderColor
          else  
            Result := ExposeLevel(ANode.Level).HeaderColor;
      mvctFooter:
        if DrawMode < mvdmBorrowSource then       
          Result := FooterColor
        else  
          if Assigned(AColumn) then 
            Result := ExposeColumn(AColumn).FooterColor
          else 
            Result := ExposeLevel(ANode.Level).FooterColor;          
    else
      Result := Color;        
    end;   
    Result := ColorToRGB(Result);  
  end;

  function IsCellTransparent(ANode: TdxMasterViewNode; AColumn: TdxMasterViewColumn; 
     ACellType: TdxMasterViewLinkCellType; AIsOdd: Boolean): Boolean;
  begin
    if DrawMode < mvdmBorrowSource then                 
      if (ANode.NodeType = ntData) and (ACellType in [mvctCell, mvctPreview]) then 
        Result := Transparent
      else
        Result := FixedTransparent
    else
      Result := ColorToRGB(GetCellColor(ANode, AColumn, ACellType, AIsOdd)) = ColorToRGB(Color);
  end;

  function FirstInSelection(ANode: TdxMasterViewNode): Boolean;
  begin
    Result := FSelectedNodes.IndexOf(ANode) <> -1;
  end;

  function CanDrawHeaders(ANode: TdxMasterViewNode): Boolean;
  begin
    with ANode do   
      Result := ShowHeaders(ANode) and (NodeType = ntData) and (ANode.Level.ViewMode = vmHorizontal) and
        (
         (([lohForFirstNode, lohForFirstVisibleNode] * Level.OptionsHeader <> []) and 
          (IsFirstInLevel or (IsExistSelectedNodes and FirstInSelection(ANode)))
         ) 
         or
         (([lohAfterExpandedNode] * Level.OptionsHeader <> []) and 
          (IsFirstInLevel or NodeExpanded(ParentNode[Index - 1])))
        );
  end;
  
  function CanDrawFooters(ANode: TdxMasterViewNode): Boolean;
  begin
    with ExposeNode(ANode) do 
      Result := ShowFooters(ANode) and (NodeType in [ntData, ntCaption]) and IsLastInLevel and
        (not Expanded and (not AutoNodesExpand or not CanExpand));        
  end;
  
  function GetNodeFooterCount(ANode: TdxMasterViewNode): Integer;
  var
    FooterSize, EndLevelCount, EndLevelData, I: Integer;

    function HasFooter(AParentIndex: Integer): Boolean;
    var
      Level: TdxMasterViewLevelAccess;
    begin
      Result := (FooterSize <> 0) and ((AParentIndex <> 0) or (ANode.NodeType = ntData));
      if Result and (AParentIndex <> -1) then
      begin
        Level := ExposeLevel(ANode.Level);
        with ExposeLevel(Level.Parents[AParentIndex]) do
          Result := ShowFooter and (AParentIndex < EndLevelCount);
      end;    
    end;
      
  begin
    ExposeNode(ANode).EndLevel(FooterSize, EndLevelCount, EndLevelData);
    Result := 0;
    for I := 0 to EndLevelCount - 1 do
      if HasFooter(I) then Inc(Result);
  end;

  function GetIndentCellSides(ANode: TdxMasterViewNode; 
    ACellType: TdxMasterViewLinkCellType; ALevelIndex, ACurrentIndex: Integer): TdxCellSides;
  var
    ParentNode: TdxMasterViewNode;
  begin
    Result := [];          
    if ShowGrid(nil) then 
    begin  
      Result := [csLeft];
      if (ACurrentIndex < ALevelIndex) or (ANode.NodeType = ntData) then 
        Result := Result + [csRight];
        
      if (ACellType = mvctCell) and (ACurrentIndex = ALevelIndex) and 
        (ANode.NodeType in [ntCaption, ntGroup]) then 
        Result := Result + [csTop];
        
      ParentNode := ANode.ParentNodes[ALevelIndex - ACurrentIndex - Byte(ANode.NodeType <> ntData)];          
      if ACellType = mvctCell then
      begin
        if not NodeExpanded(ParentNode) then 
          if ANode.NodeType = ntData then
          begin
            if ParentNode.IsLast and (not CanDrawFooters(ANode) or (GetNodeFooterCount(ANode) = 0)) then
              Result := Result + [csBottom]
          end
          else    
            if (ACurrentIndex = ALevelIndex) or ParentNode.IsLast then
              Result := Result + [csBottom]
      end      
      else      
        if (ACellType = mvctFooter) and (ACurrentIndex = ALevelIndex) and ANode.Level.IsLast then
          Result := Result + [csBottom];
    end        
    else 
      if ACurrentIndex = 0 then Result := [csLeft];
  end;
  
  function DrawIndent(ANode: TdxMasterViewNode; ACell: TdxReportCell; 
    ACellType: TdxMasterViewLinkCellType; AIsOdd: Boolean): Integer;
  var
    I, L, LevelIndex: Integer;
    IsOdd: Boolean;
    PrevSibl: TdxReportItem;
    ParentNode: TdxMasterViewNode;
    Box: TdxReportCellBox;
  begin
    LevelIndex := ExposeNode(ANode).GetLevelIndex;
    if ANode.NodeType = ntData then Dec(LevelIndex);
    for I := 0 to LevelIndex do
    begin
      Box := TdxReportCellBox.Create(ACell);
      with Box do 
      begin
        L := 0;
        PrevSibl := GetPrevSibling;
        if (PrevSibl <> nil) then 
          L := TdxReportVisualItem(PrevSibl).BoundsRect.Right;
        BoundsRect := 
          Rect(L, 0, L + FIndent, ACell.Height);
        ParentNode := 
          ANode.ParentNodes[LevelIndex - I + Byte(ANode.NodeType = ntData)];
        IsOdd := 
          Odd(ParentNode.Index) and (ParentNode.NodeType = ntData);
        Transparent := 
          IsCellTransparent(ParentNode, nil, mvctCell, IsOdd);
        if not Transparent then 
          Color := GetCellColor(ParentNode, nil, mvctCell, IsOdd);
        CellSides := 
          GetIndentCellSides(ANode, ACellType, LevelIndex, I);
      end;
    end;
      
    if (ACellType = mvctCell) and (ANode.NodeType = ntData) and 
      (ExposeNode(ANode).HasExpandButton or NodeExpanded(ANode)) then 
    begin
      Box := TdxReportCellBox.Create(ACell);
      with Box do 
      begin
        L := 0;
        PrevSibl := GetPrevSibling;
        if (PrevSibl <> nil) then 
          L := TdxReportVisualItem(PrevSibl).BoundsRect.Right;
        BoundsRect := 
          Rect(L, 0, L + FIndent, ACell.Height);
        CellSides := [csLeft];
        if ShowGrid(ANode) then 
        begin   
          CellSides := CellSides + [csTop];        
          if {ANode.IsLast or }not NodeExpanded(ANode) then
            CellSides := CellSides + [csBottom];        
        end;    
        Transparent := IsCellTransparent(ANode, nil, mvctCell, AIsOdd);
        if not Transparent then 
          Color := GetCellColor(ANode, nil, mvctCell, AIsOdd);
      end;
    end;
      
    Result := FIndent * (LevelIndex + Byte(ANode.NodeType = ntData));
  end;

  procedure Setup3DEffects(AItem: TdxReportVisualItem; ACellType: TdxMasterViewLinkCellType);
  begin
    with AItem do
    begin
      EdgeMode := TdxCellEdgeMode(Use3DEffects);
      if (EdgeMode = cem3DEffects) then
        case ACellType of
          mvctFooter:
            if (AItem is TdxReportCell) then 
            begin
              InnerEdge := cesRaised;
              if not UseSoft3D then OuterEdge := cesRaised;
            end
            else 
              OuterEdge := cesSunken;
          mvctHeader:
            begin
              InnerEdge := cesRaised;
              if not UseSoft3D then OuterEdge := cesRaised;
            end
        end;
    end;  
  end;
  
  procedure ProcessCells(ANode: TdxMasterViewNode; AParent: TdxReportCell; 
    ACellType: TdxMasterViewLinkCellType; AIsOdd: Boolean);
  var
    I, L, ACellHeight: Integer;
    R: TRect;
    ADataClass: TdxReportCellDataClass;
    ADataItem: TAbstractdxReportCellData;
    ACell: TdxReportCell;
    APrevSibl: TdxReportItem;
    AColumn, AGroupColumn: TdxMasterViewColumn;
    AColumnPlaces: TList;
    AColumnPlace: PColumnPlace;
  begin
    if ShowPreview(ANode) and (ACellType = mvctCell) and (ANode.NodeType = ntData) then
    begin
      L := GetLevelWidth(ANode.Level);
      ACellHeight := GetItemHeight(ANode, ACellType, True, L, @FPreviewFullHeight);
    end  
    else
    begin
      ACellHeight := GetItemHeight(ANode, ACellType, True, 0, nil);
      FPreviewFullHeight := 0;
    end;

    ACell := TdxReportCell.Create(AParent);
    with ACell do
    begin
      BoundsRect := Rect(0, 0, GetLevelWidth(ANode.Level), ACellHeight);
      APrevSibl := GetPrevSibling;
      if Assigned(APrevSibl) then
        Top := TdxReportCell(APrevSibl).BoundsRect.Bottom;
      CellSides := [csLeft, csRight];
      if (ANode = FNodes.List^[0]) then
        CellSides := CellSides + [csTop];
      Transparent := True;
      if IsSupportedCustomDraw(nil) and 
        ((ACellType <> mvctHeader) or (ANode.Level.ViewMode = vmVertical)) 
      then
        Data := Integer(ANode);
    end;
    
    L := DrawIndent(ANode, ACell, ACellType, AIsOdd);
    
    if (ACellType = mvctFooter) then 
    begin
      ACell := TdxReportCell.Create(ACell);
      with ACell do
      begin
        R := Rect(L, 0, Parent.BoundsRect.Right, ACellHeight);
        if Use3DEffects then 
        begin
          Inc(R.Left);
          Inc(R.Top);          
        end;
        BoundsRect := R;
        APrevSibl := GetPrevSibling;
        if Assigned(APrevSibl) then
          Top := TdxReportCell(APrevSibl).BoundsRect.Bottom;
        CellSides := csAll;
        Transparent := FixedTransparent;
        if not Transparent then 
          Color := GetCellColor(ANode, nil, mvctFooter, False);
        if Use3DEffects then 
          Setup3DEffects(ACell, ACellType);  
        if IsSupportedCustomDraw(nil) then 
          Data := Integer(ANode);
      end;
    end;
    
    case ANode.NodeType of
      ntData:
        begin                          
          if (ACellType = mvctHeader) or (ANode.Level.ViewMode = vmVertical) or 
            (not ShowHeaders(ANode) and ANode.IsFirstinLevel) then 
            FDelimitersCells.Add(ACell);
            
          AColumnPlaces := FColumnPlaces.List^[FLevels.IndexOf(ANode.Level)];
          
          for I := 0 to AColumnPlaces.Count - 1 do 
          begin
            AColumnPlace := AColumnPlaces.List^[I];
            AColumn := AColumnPlace^.Column;
            if (ACellType = mvctFooter) and (AColumn.SummaryType = dxMasterView.stNone) then 
              Continue;
            ADataClass := GetDataClass(ANode, AColumn, ACellType);
            if ADataClass = nil then Continue;
            
            ADataItem := ADataClass.Create(ACell);
            AssignValues(ADataItem, ANode, AColumn, ACellType);
            ADataItem.CellSides := 
              GetDataItemSides(ANode, AColumnPlace, ACellType);
            ADataItem.BoundsRect := 
              GetDataItemRect(ANode, AColumnPlace, ACell, ACellType);
            ADataItem.Transparent := 
              IsCellTransparent(ANode, AColumn, ACellType, AIsOdd);
            if not ADataItem.Transparent then
              ADataItem.Color := GetCellColor(ANode, AColumn, ACellType, AIsOdd);
            ADataItem.FontIndex := 
               GetCellFontIndex(ANode, AColumn, ACellType, AIsOdd);
            if Use3DEffects and (ACellType in [mvctFooter, mvctHeader]) then
              Setup3DEffects(ADataItem, ACellType);
            if IsSupportedCustomDraw(nil) then 
              ADataItem.Data := Integer(AColumn);
              
            if (ANode.Level.ViewMode = vmVertical) and (ACellType <> mvctFooter) and ShowHeaders(ANode) then 
            begin
              ADataClass := GetDataClass(ANode, AColumn, mvctHeader);
              ADataItem := ADataClass.Create(ACell);
              with ADataItem do 
              begin
                AssignValues(ADataItem, ANode, AColumn, mvctHeader);
                CellSides := 
                  GetDataItemSides(ANode, AColumnPlace, mvctHeader);
                BoundsRect := 
                  GetDataItemRect(ANode, AColumnPlace, ACell, mvctHeader);
                Transparent := 
                  IsCellTransparent(ANode, nil, mvctHeader, AIsOdd);
                if not Transparent then
                  Color := GetCellColor(ANode, AColumn, mvctHeader, AIsOdd);
                FontIndex := 
                  GetCellFontIndex(ANode, AColumn, mvctHeader, AIsOdd);
                if Use3DEffects then 
                  Setup3DEffects(ADataItem, mvctHeader);  
                if IsSupportedCustomDraw(nil) then 
                  Data := Integer(AColumn);
              end;   
            end;  
          end; 
          if ShowPreview(ANode) and (FPreviewFullHeight > 0) then 
          begin
            ADataItem := TdxReportCellString.Create(ACell);
            with TdxReportCellString(ADataItem) do 
            begin
              Text := ANode.PreviewText;
              Indent := ANode.Level.PreviewLeftIndent;
              Multiline := True;
              CellSides := 
                GetDataItemSides(ANode, nil, mvctPreview);
              BoundsRect := 
                GetPreviewRect(ANode, ACell);
              Transparent := 
                IsCellTransparent(ANode, nil, mvctPreview, AIsOdd);
              if not Transparent then 
                Color := GetCellColor(ANode, nil, mvctPreview, AIsOdd);
              FontIndex := 
                GetCellFontIndex(ANode, nil, mvctPreview, AIsOdd);
            end;  
          end;
        end;
      ntCaption:
        begin
          ADataItem := TdxReportCellString.Create(ACell);
          with TdxReportCellString(ADataItem) do
          begin
            Text := ANode.Level.Caption;
            CellSides := 
              GetDataItemSides(ANode, nil, ACellType);
            BoundsRect := 
              GetDataItemRect(ANode, nil, ACell, mvctCell);
            Transparent := 
              IsCellTransparent(ANode, nil, ACellType, AIsOdd);
            if not Transparent then
              Color := GetCellColor(ANode, nil, ACellType, AIsOdd);
            FontIndex := 
              GetCellFontIndex(ANode, nil, ACellType, AIsOdd);
            if IsSupportedCustomDraw(nil) then 
              Data := Integer(ANode);
          end;  
        end;
      ntGroup:    
        begin
          ADataItem := TdxReportCellString.Create(ACell);
          with TdxReportCellString(ADataItem) do 
          begin
            AGroupColumn := ANode.Level.GroupColumns[ANode.GroupIndex];
            Text := AGroupColumn.Caption + ' : ' + 
               ExposeColumn(AGroupColumn).GetGroupDisplayText(ANode);
            CellSides := 
              GetDataItemSides(ANode, nil, ACellType);
            BoundsRect := 
              GetDataItemRect(ANode, nil, ACell, mvctCell);
            Transparent := 
              IsCellTransparent(ANode, nil, ACellType, AIsOdd);
            if not Transparent then
              Color := GetCellColor(ANode, nil, ACellType, AIsOdd);
            FontIndex := 
              GetCellFontIndex(ANode, nil, ACellType, AIsOdd);
            if IsSupportedCustomDraw(nil) then 
              Data := Integer(AGroupColumn);
          end;
        end;
    end;   
  end;
  
  procedure IterateNodes;
  var
    I, J, FooterCount: Integer;
    Node, FooterNode: TdxMasterViewNode;
    IsOdd: Boolean;
  begin
    for I := 0 to FNodes.Count - 1 do
    begin
      Node := TdxMasterViewNode(FNodes.List^[I]);
      IsOdd := not (Odd(Node.Index) and (Node.NodeType = ntData));
      
      if CanDrawHeaders(Node) then 
        ProcessCells(Node, AReportCells.Cells, mvctHeader, IsOdd);
        
      ProcessCells(Node, AReportCells.Cells, mvctCell, IsOdd);
      
      if CanDrawFooters(Node) then
      begin
        FooterCount := GetNodeFooterCount(Node);
        if FooterCount > 0 then 
        begin
          FooterNode := Node;
          if FooterNode.NodeType = ntCaption then
            FooterNode := FooterNode.ParentNodeWithData;        
          J := 0;
          while J < FooterCount do 
          begin
            if lovFooter in FooterNode.Level.OptionsView then 
            begin
              ProcessCells(FooterNode, AReportCells.Cells, mvctFooter, True);
              Inc(J);
            end;  
            FooterNode := FooterNode.ParentNodeWithData;
          end;  
        end;   
      end;  
      AReportCells.DoProgress(MulDiv(I, 100, FNodes.Count));        
    end;
  end;
  
var
  I, Width, Height: Integer;
  Cell: TdxReportCell;
begin
  if Component = nil then Exit;
  inherited ConstructReport(AReportCells);
  
  PrepareConstruct(AReportCells);
  try
    AReportCells.BorderColor := GridLineColor;
    with AReportCells.Cells do
    begin
      Color := dxDefaultColor;
      CellSides := [];
      Transparent := True;
      FontIndex := 0;
    end;
    
    if FNodes.Count > 0 then IterateNodes;
    
    Width := 0;
    for I := 0 to AReportCells.Cells.CellCount - 1 do
    begin
      Cell := AReportCells.Cells[I];
      if (Cell.Width > Width) then Width := Cell.Width;
    end;  
    Height := 0;
    Cell := AReportCells.Cells.LastCell;
    if (Cell <> nil) then Height := Cell.BoundsRect.Bottom;
    AReportCells.Cells.BoundsRect := Rect(0, 0, Width, Height);
    
  finally
    UnprepareConstruct(AReportCells);
  end;
end;


{ TdxMVReportLinkDesignWindow }

constructor TdxMVReportLinkDesignWindow.Create(AOwner: TComponent);
begin
  HelpContext := dxhcMasterViewReportLinkDesigner;
  inherited Create(AOwner);
  CreateControls;
  
  LoadMemData;
  PageControl1.ActivePage := PageControl1.Pages[0];
  FLastIndex := -1;
  dxPSRegisterControlWithPopup(lbxFonts);
end;

destructor TdxMVReportLinkDesignWindow.Destroy;
begin
  dxPSUnregisterControlWithPopup(lbxFonts);
  inherited Destroy;
end;

const
  sdxOrderNo = 'OrderNo';
  sdxName = 'Name';
  sdxCount = 'Count';
  sdxCompany = 'Company';
  sdxAddress = 'Address';
  sdxPrice = 'Price';
  sdxCash = 'Cash';

procedure TdxMVReportLinkDesignWindow.CreateDataSets;

  procedure AddField(AFieldClass: TFieldClass; ADataSet: TDataSet; 
    const AFieldName: string; ASize: Integer; ARequired: Boolean);
  begin
    with AFieldClass.Create(Self) do 
    begin
      FieldName := AFieldName;
      DataSet := ADataSet;
      Size := ASize;
      Required := ARequired;
    end;  
  end;
  
begin
  FmdMaster := TdxEasyMemData.Create(Self);
  AddField(TIntegerField, FmdMaster, sdxOrderNo, 0, True);
  AddField(TStringField, FmdMaster, sdxName, 30, False);  
  AddField(TStringField, FmdMaster, sdxCompany, 30, False);
  AddField(TStringField, FmdMaster, sdxAddress, 50, False);
  
  FmdDetail := TdxEasyMemData.Create(Self);
  AddField(TIntegerField, FmdDetail, sdxOrderNo, 0, True);
  AddField(TIntegerField, FmdDetail, sdxCount, 0, False);  
  AddField(TCurrencyField, FmdDetail, sdxPrice, 0, False);    
  AddField(TBooleanField, FmdDetail, sdxCash, 0, False);      
  
  FmdMaster.Open;  
  FmdMaster.InsertRecord([1, sdxName1, sdxCompany1, sdxAddress1]);
  FmdMaster.InsertRecord([2, sdxName2, sdxCompany2, sdxAddress2]);

  FmdDetail.Open;
  FmdDetail.InsertRecord([1, 100,   9.00, True]);
  FmdDetail.InsertRecord([1, 120,  19.00, False]);
  FmdDetail.InsertRecord([2, 110,  21.00, True]);
  FmdDetail.InsertRecord([2,  90, 100.00, True]);                  
  FmdDetail.InsertRecord([2, 140, 111.00, False]);
  FmdDetail.InsertRecord([2, 100, 112.00, False]);  
  
  FdsMaster := TDataSource.Create(Self);
  FdsMaster.DataSet := FmdMaster;
  
  FdsDetail := TDataSource.Create(Self);  
  FdsDetail.DataSet := FmdDetail;
end;

procedure TdxMVReportLinkDesignWindow.InitializeMasterView;

  function CreateColumn(ALevel: TdxMasterViewLevel; AColumnClass: TdxMasterViewColumnClass; 
    const AFieldName: string; const ACaption: string; AMinWidth: Integer): TdxMasterViewColumn;
  begin
    Result := ALevel.CreateColumn(AColumnClass);
    with Result do
    begin
      FieldName := AFieldName;
      MinWidth := AMinWidth;
      Caption := ACaption;
    end;
  end;

  function CreateLevel(AParent: TdxMasterViewLevel; ADataSource: TDataSource): TdxMasterViewLevel;
  begin
    Result := AParent.Add;
    with Result do 
    begin
      CaptionStyle := mvsCaptionStyle;    
      ContentStyle := mvsContentStyle;
      FooterStyle := mvsFooterStyle;    
      GroupStyle := mvsGroupStyle;
      HeaderStyle := mvsHeaderStyle;
      PreviewStyle := mvsPreviewStyle;
      
      OnGetContentStyle := dxMVPreviewGetContentStyle;
      OnGetPreviewStyle := dxMVPreviewGetContentStyle;
      
      DataSource := ADataSource;
      ID := sdxOrderNo;
    end;  
  end;
  
begin
  FMVMasterLevel := CreateLevel(dxMVPreview.Levels, FdsMaster);
  with FMVMasterLevel do 
  begin
    OptionsView := FMVMasterLevel.OptionsView  + [lovPreview];
    PreviewFieldName := sdxAddress;
  end;  
  FMVColumnName := CreateColumn(FMVMasterLevel, TdxMasterViewColumn, sdxName, sdxNameCaption, 80);
  FMVColumnAddress := CreateColumn(FMVMasterLevel, TdxMasterViewColumn, sdxCompany, sdxCompanyCaption, 154);

  FMVDetailLevel := CreateLevel(FMVMasterLevel, FdsDetail);  
  with FMVDetailLevel do 
  begin
    DetailKey := sdxOrderNo;  
    MasterKey := sdxOrderNo;    
  end; 
  FMVColumnCount := CreateColumn(FMVDetailLevel, TdxMasterViewColumn, sdxCount, 
    sdxCountCaption, 83);
  with FMVColumnCount do 
  begin
    SummaryType := stAverage;
    SummaryFieldName := sdxCount;
  end;
  FMVColumnPrice := CreateColumn(FMVDetailLevel, TdxMasterViewColumn, sdxPrice, 
    sdxPriceCaption, 100);
  with FMVColumnPrice do 
  begin
    SummaryType := stAverage;
    SummaryFieldName := sdxPrice;
  end;
  
  FMVColumnCash := TdxMasterViewCheckColumn(CreateColumn(FMVDetailLevel, 
    TdxMasterViewCheckColumn, sdxCash, sdxCashCaption, 50));
  with FMVColumnCash do 
  begin
    ValueChecked := 'True';
    ValueUnchecked := 'False';
  end;
end;

procedure TdxMVReportLinkDesignWindow.LoadMemData;
begin
  CreateDataSets;
  InitializeMasterView;
  dxMVPreview.ApplyBestFit(nil, nil);
end;

{
  dxMVMasterLevelName.Width := 80;
  dxMVMasterLevelOrderNo.Width := 50;
  dxMVMasterLevelAddress.Width := 104;
  
  dxMVDetailLevelOrderNo.Width := 50;
  dxMVDetailLevelCount.Width := 83;
  dxMVDetailLevelPrice.Width := 100;
}

procedure TdxMVReportLinkDesignWindow.pbxPreviewPaint(Sender: TObject);
begin    
  with TdxPSPaintPanel(Sender) do 
    PaintPreview(Canvas, ClientRect);
end;

procedure FrameRectColor(DC: hDC; const R: TRect; AColor: TColor);
var
  Brush: HBRUSH;
begin
  Brush := CreateSolidBrush(ColorToRGB(AColor));
  FrameRect(DC, R, Brush);
  DeleteObject(Brush);
end;

procedure TdxMVReportLinkDesignWindow.PaintPreview(ACanvas: TCanvas; R: TRect);
var
  DC: hDC;
  dX, dY: Integer;
begin
  DC := ACanvas.Handle;
  FillRect(DC, R, HBRUSH(COLOR_WINDOW + 1));
  dX := (R.Right - R.Left - dxMVPreview.Width) div 2;
  dY := (R.Bottom - R.Top - dxMVPreview.Height) div 2;
  InflateRect(R, -dX, -dY);
  OffsetRect(R, 1, 2);
  dxMVPreview.PaintTo(DC, R.Left, R.Top);
  
  Dec(R.Right, 2);
  Dec(R.Bottom, 4);
  
  with MasterViewReportLink do 
  begin
    if not ShowGrid(nil) then 
      Dec(R.Bottom, 4 + dxMVPreview.AbsoluteItemCount)
    else  
      if not ShowPreviewGrid(nil) then Dec(R.Bottom, 2);
        
    if not ShowHeaders(nil) then Dec(R.Bottom, 3 * 26 + (3 - 1));
    if not ShowFooters(nil) then Dec(R.Bottom, 2 * 22);
    if not ShowPreview(nil) then 
      Dec(R.Bottom, 2 * 18 - 2 * Byte(not ShowPreviewGrid(nil)) - 5 * Byte(not ShowGrid(nil)));
  end;  
  FrameRectColor(DC, R, MasterViewReportLink.GridLineColor);
end;

procedure TdxMVReportLinkDesignWindow.CreateControls;

  function CreateColorCombo(AParent: TWinControl; const ABoundsRect: TRect; 
    ATag: Integer; AAutoColor: TColor; ALabel: TLabel): TdxPSColorCombo;
  begin
    Result := TdxPSColorCombo.Create(Self);
    with TdxPSColorCombo(Result) do
    begin
      BoundsRect := ABoundsRect;
      Tag := ATag;
      Parent := AParent;
      ColorTypes := [ctPure];
      ShowColorName := True;
      ShowAutoColor := True;
      AutoColor := AAutoColor;
      OnChange := ccbxColorChange;
    end;
    ALabel.FocusControl := Result;
  end;

var
  R: TRect;
begin
  FccbxColor := 
    CreateColorCombo(gbxTransparent, bvlColorHolder.BoundsRect, 0, dxDefaultColor, lblColor);
  FccbxEvenColor := 
    CreateColorCombo(gbxTransparent, bvlEvenColorHolder.BoundsRect, 1, dxDefaultColor, lblEvenColor);
  FccbxPreviewColor := 
    CreateColorCombo(gbxTransparent, bvlPreviewColorHolder.BoundsRect, 2, dxDefaultColor, lblPreviewColor);
    
  FccbxCaptionColor := 
    CreateColorCombo(gbxFixedTransparent, bvlCaptionColorHolder.BoundsRect, 3, dxDefaultFixedColor, lblLevelCaptionColor);
  FccbxHeaderColor := 
    CreateColorCombo(gbxFixedTransparent, bvlHeaderColorHolder.BoundsRect, 5, dxDefaultFixedColor, lblHeaderColor);
  FccbxFooterColor := 
    CreateColorCombo(gbxFixedTransparent, bvlFooterColorHolder.BoundsRect, 6, dxDefaultFixedColor, lblFooterColor);
  FccbxGroupNodeColor := 
    CreateColorCombo(gbxFixedTransparent, bvlGroupNodeColorHolder.BoundsRect, 4, dxDefaultFixedColor, lblGroupNodeColor);

  FccbxGridLineColor := 
    CreateColorCombo(tshColors, bvlGridLineColorHolder.BoundsRect, 7, dxDefaultGridLineColor, lblGridLineColor);
  FccbxGridLineColor.TabOrder := FccbxGridLineColor.Parent.ControlCount - 1;


  FsePreviewLineCount := TdxPSSpinEdit.Create(Self);
  with TdxPSSpinEdit(FsePreviewLineCount) do
  begin
    BoundsRect := bvlPreviewLineCountHolder.BoundsRect;
    MinValue := 0;
    MaxValue := 100;
    Flat := False;
    Parent := tshOptions;
    TabOrder := chbxAutoCalcPreviewLines.TabOrder + 1;
    OnChange := PreviewLineCountChange;
  end;
  lblPreviewLineCount.FocusControl := FsePreviewLineCount;

  FPreviewBox := TdxPSPaintPanel.Create(Self);
  with TdxPSPaintPanel(FPreviewBox) do
  begin
    Parent := pnlPreview;
    R := pnlPreview.BoundsRect;
    OffsetRect(R, -R.Left, -R.Top);
    InflateRect(R, -1, -1);
    BoundsRect := R;
    EdgeInner := esNone;
    EdgeOuter := esNone;
    OnPaint := pbxPreviewPaint;
  end;
  
  with lbxFonts do
  begin
    Canvas.Font := Font;
    ItemHeight := 1 + lbxFonts.Canvas.TextHeight('Wg') + 2;
    Height := 4{border} + GetSystemMetrics(SM_CYHSCROLL) + Items.Count * ItemHeight;
  end;  
  btnChangeFont.Top := lbxFonts.Top + lbxFonts.Height + 6;
end;

procedure TdxMVReportLinkDesignWindow.LoadStrings;
begin
  inherited LoadStrings;
  tshOptions.Caption := sdxOptions;
  tshFonts.Caption := sdxFonts;
  tshColors.Caption := sdxColors;
  lblPreview.Caption := DropAmpersand(sdxPreview);
  tshBeh.Caption := sdxBehaviors;
  
  lblShow.Caption := sdxShow;
  
  chbxShowHeaders.Caption := sdxHeaders;
  chbxShowFooters.Caption := sdxFooters;
  chbxShowPreview.Caption := sdxPreview;
  chbxAutoCalcPreviewLines.Caption := sdxAutoCalcPreviewLineCount;
  lblPreviewLineCount.Caption := sdxPreviewLineCount;

  lblGrid.Caption := DropAmpersand(sdxGrid);
  chbxShowGrid.Caption := sdxGrid;
  chbxShowPreviewGrid.Caption := sdxNodesGrid;  
  chbxShowGroupFooterGrid.Caption := sdxGroupFooterGrid;
  
  lblMiscellaneous.Caption := sdxMiscellaneous;
  chbxFlatCheckMarks.Caption := sdxFlatCheckMarks;
  chbxCheckMarksAsText.Caption := sdxCheckMarksAsText;
  
  lblDrawMode.Caption := sdxDrawMode;
  cbxDrawMode.Items.BeginUpdate;
  try
    cbxDrawMode.Items.Clear;
    cbxDrawMode.Items.Add(sdxDrawModeStrict);
    cbxDrawMode.Items.Add(sdxDrawModeOddEven);
    cbxDrawMode.Items.Add(sdxDrawModeBorrow);
  finally
    cbxDrawMode.Items.EndUpdate;
  end;
  
  chbxTransparent.Caption := sdxTransparent;

  lblColor.Caption := sdxColor;
  lblEvenColor.Caption := sdxEvenColor;
  lblPreviewColor.Caption := sdxPreviewColor;

  chbxFixedTransparent.Caption := sdxFixedTransparent;
  lblLevelCaptionColor.Caption := sdxLevelCaptionColor;
  lblHeaderColor.Caption := sdxHeaderColor;
  lblFooterColor.Caption := sdxFooterColor;
  lblGroupNodeColor.Caption := sdxGroupNodeColor;
  lblGridLineColor.Caption := sdxGridLinesColor;

  lbxFonts.Items.BeginUpdate;
  try
    lbxFonts.Items.Clear;
    lbxFonts.Items.Add(sdxFont);
    lbxFonts.Items.Add(sdxOddFont);
    lbxFonts.Items.Add(sdxEvenFont);
    lbxFonts.Items.Add(sdxCaptionNodeFont);    
    lbxFonts.Items.Add(sdxGroupNodeFont);
    lbxFonts.Items.Add(sdxFooterFont);       
    lbxFonts.Items.Add(sdxHeaderFont);
    lbxFonts.Items.Add(sdxPreviewFont);
  finally
    lbxFonts.Items.EndUpdate;
  end;

  btnChangeFont.Caption := sdxBtnChangeFont;
  miChangeFont.Caption := sdxBtnChangeFont;
  
  chbxAutoNodesExpand.Caption := sdxAutoNodesExpand;
  chbxOnlySelected.Caption := sdxOnlySelected;
  chbxExtendedSelect.Caption := sdxExtendedSelect;

  lblSelection.Caption := sdxSelection;
  lblExpanding.Caption := sdxNodeExpanding;
  lbl3DEffects.Caption := sdx3DEffects;
  lblGraphics.Caption := sdxGraphics;
  
  chbxUse3DEffects.Caption := sdxUse3DEffects;
  chbxUseSoft3D.Caption := sdxSoft3D;
  
  chbxTransparentColumnGraphic.Caption := sdxTransparentColumnGraphics;
  chbxDisplayGraphicsAsText.Caption := sdxDisplayGraphicsAsText;
end;

procedure TdxMVReportLinkDesignWindow.CMDialogChar(var Msg: TCMDialogChar);
var
  I: Integer;
begin
  inherited;
  with PageControl1 do
    for I := 0 to PageCount - 1 do
      if IsAccel(Msg.CharCode, Pages[I].Caption) then
      begin
        Msg.Result := 1;
        ActivePage := Pages[I];
        Exit;
      end;
end;

procedure TdxMVReportLinkDesignWindow.UpdateControlsState;
begin
  inherited UpdateControlsState;

  if MasterViewReportLink.OddEvenMode then
    lblColor.Caption := sdxOddColor
  else  
    lblColor.Caption := sdxColor;
    
  chbxOnlySelected.Checked := MasterViewReportLink.OnlySelected;
  chbxExtendedSelect.Enabled := chbxOnlySelected.Checked;
  
  chbxAutoNodesExpand.Checked := MasterViewReportLink.AutoNodesExpand;
  
  chbxAutoCalcPreviewLines.Enabled := MasterViewReportLink.ShowPreview(nil);
  FsePreviewLineCount.Enabled := MasterViewReportLink.ShowPreview(nil) and 
    not MasterViewReportLink.AutoCalcPreviewLines;
  lblPreviewLineCount.Enabled := FsePreviewLineCount.Enabled;
  
  chbxShowPreviewGrid.Enabled := chbxShowGrid.Checked;  
  chbxShowGroupFooterGrid.Enabled := chbxShowGrid.Checked;
  
  chbxUseSoft3D.Enabled := chbxUse3DEffects.Checked;
  
  FccbxColor.Enabled := not chbxTransparent.Checked;
  lblColor.Enabled := FccbxColor.Enabled;
  FccbxEvenColor.Enabled := not chbxTransparent.Checked and 
    MasterViewReportLink.OddEvenMode;
  lblEvenColor.Enabled := FccbxEvenColor.Enabled;
  FccbxPreviewColor.Enabled := not chbxTransparent.Checked and 
    not MasterViewReportLink.OddEvenMode;
  lblPreviewColor.Enabled := FccbxPreviewColor.Enabled;

  FccbxCaptionColor.Enabled := not chbxFixedTransparent.Checked;
  lblLevelCaptionColor.Enabled := FccbxCaptionColor.Enabled;
  FccbxGroupNodeColor.Enabled := not chbxFixedTransparent.Checked;
  lblGroupNodeColor.Enabled := FccbxGroupNodeColor.Enabled;
  FccbxHeaderColor.Enabled := not chbxFixedTransparent.Checked;
  lblHeaderColor.Enabled := FccbxHeaderColor.Enabled;
  FccbxFooterColor.Enabled := not chbxFixedTransparent.Checked;
  lblFooterColor.Enabled := FccbxFooterColor.Enabled;
  
  btnChangeFont.Enabled := IsChangeFontEnabled;
  lbxFonts.Perform(LB_SETHORIZONTALEXTENT, GetMaxWidth, 0);
end;

function TdxMVReportLinkDesignWindow.IsChangeFontEnabled: Boolean;
var
  I: Integer;
begin
  if MasterViewReportLink.OddEvenMode then 
    Result := (lbxFonts.SelCount > 0)
  else  
  begin
    Result := True;  
    for I := 0 to lbxFonts.Items.Count - 1 do 
      if lbxFonts.Selected[I] and not (I in [1, 2]) then Exit;
    Result := False;
  end;
end;

function TdxMVReportLinkDesignWindow.IsDisableIndex(AIndex: Integer): Boolean;
begin
  Result := (not MasterViewReportLink.OddEvenMode) and (AIndex in [1, 2]);
end;

procedure TdxMVReportLinkDesignWindow.DoInitialize;
begin
  inherited DoInitialize;
  with MasterViewReportLink do 
  begin
    chbxShowHeaders.Checked := ShowHeaders(nil);
    chbxShowFooters.Checked := ShowFooters(nil);    
    chbxShowPreview.Checked := ShowPreview(nil);
    chbxAutoCalcPreviewLines.Checked := AutoCalcPreviewLines;
    TdxPSSpinEdit(FsePreviewLineCount).Enabled := ShowPreview(nil) and not AutoCalcPreviewLines;
    TdxPSSpinEdit(FsePreviewLineCount).MinValue := -Byte(AutoCalcPreviewLines);
    TdxPSSpinEdit(FsePreviewLineCount).Value := PreviewLineCount;
    
    chbxShowGrid.Checked := ShowGrid(nil);
    chbxShowPreviewGrid.Checked := ShowPreviewGrid(nil);
    chbxShowGroupFooterGrid.Checked := ShowGroupFooterGrid;    

    chbxFlatCheckMarks.Checked := FlatCheckMarks;
    
    if OddEvenMode then lblColor.Caption := sdxOddColor;

    chbxTransparent.Checked := Transparent;
    chbxFixedTransparent.Checked := FixedTransparent;
    cbxDrawMode.ItemIndex := Integer(DrawMode);
        
    TdxPSColorCombo(FccbxColor).ColorValue := ColorToRGB(MasterViewReportLink.Color);
    TdxPSColorCombo(FccbxEvenColor).ColorValue := ColorToRGB(EvenColor);
    TdxPSColorCombo(FccbxPreviewColor).ColorValue := ColorToRGB(PreviewColor);
    TdxPSColorCombo(FccbxCaptionColor).ColorValue := ColorToRGB(CaptionColor);    
    TdxPSColorCombo(FccbxFooterColor).ColorValue := ColorToRGB(FooterColor);        
    TdxPSColorCombo(FccbxGridLineColor).ColorValue := ColorToRGB(GridLineColor);
    TdxPSColorCombo(FccbxGroupNodeColor).ColorValue := ColorToRGB(GroupNodeColor);
    TdxPSColorCombo(FccbxHeaderColor).ColorValue := ColorToRGB(HeaderColor);

    chbxOnlySelected.Checked := OnlySelected;
    chbxExtendedSelect.Checked := ExtendedSelect;
    
    chbxUse3DEffects.Checked := Use3DEffects;
    chbxUseSoft3D.Checked := UseSoft3D;    
   
    chbxTransparentColumnGraphic.Checked := TransparentColumnGraphics;
    chbxDisplayGraphicsAsText.Checked := GraphicsAsText;
  end;
  dxMVPreview.FullExpand;
  UpdatePreview;
  lbxFonts.Invalidate;
end;

procedure TdxMVReportLinkDesignWindow.PreviewLineCountChange(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  MasterViewReportLink.PreviewLineCount := TdxPSSpinEdit(Sender).AsInteger;
  Modified := True;
end;

procedure TdxMVReportLinkDesignWindow.UpdatePreview;

  procedure XorOption(var AOptions: TdxMasterViewLevelOptionsView;
    AElement: TdxMasterViewLevelOptionView; Value: Boolean);
  begin
    if Value then 
      AOptions := AOptions + [AElement]
    else 
      AOptions := AOptions - [AElement];
  end;  
  
var
  I: Integer;
  OV:  TdxMasterViewLevelOptionsView;
begin
  inherited UpdatePreview;
  OV := FMVMasterLevel.OptionsView;
  with MasterViewReportLink do 
  begin
    XorOption(OV, lovHeader, ShowHeaders(nil));
    XorOption(OV, lovPreview, ShowPreview(nil));
    XorOption(OV, lovGrid, ShowGrid(nil));
    XorOption(OV, lovGridWithPreview, ShowPreviewGrid(nil));
  end;
  FMVMasterLevel.OptionsView := OV;
  
  FMVColumnCash.Border3D := not MasterViewReportLink.FlatCheckMarks;
 
  OV := FMVDetailLevel.OptionsView;
  with MasterViewReportLink do 
  begin
    XorOption(OV, lovHeader, ShowHeaders(nil));
    XorOption(OV, lovFooter, ShowFooters(nil));
    XorOption(OV, lovGrid, ShowGrid(nil));
    XorOption(OV, lovGridWithPreview, ShowPreviewGrid(nil));
  end;
  FMVDetailLevel.OptionsView := OV;
    
  FMVMasterLevel.GridLinesColor := MasterViewReportLink.GridLineColor;
  FMVDetailLevel.GridLinesColor := FMVMasterLevel.GridLinesColor;
    
  with MasterViewReportLink do 
  begin
    if FixedTransparent then
    begin
      mvsCaptionStyle.Color := clWindow;      
      mvsHeaderStyle.Color := clWindow;
      mvsFooterStyle.Color := clWindow;
      mvsGroupStyle.Color := clWindow;
    end
    else
    begin
      mvsCaptionStyle.Color := CaptionColor;          
      mvsHeaderStyle.Color := HeaderColor;
      mvsFooterStyle.Color := FooterColor;
      mvsGroupStyle.Color := GroupNodeColor;
    end;
    
    if Transparent then
    begin
      mvsContentStyle.Color := clWindow;
      mvsContentStyle.AnotherColor := clWindow;        
      mvsPreviewStyle.Color := clWindow;
      mvsPreviewStyle.AnotherColor := clWindow;        
    end
    else
    begin
      if (DrawMode = mvdmOddEven) then             
      begin
        mvsContentStyle.Color := OddColor;
        mvsContentStyle.AnotherColor := OddColor;
        mvsPreviewStyle.Color := OddColor;
        mvsPreviewStyle.AnotherColor := EvenColor;
      end  
      else 
      begin
        mvsContentStyle.Color := Color;
        mvsContentStyle.AnotherColor := Color;
        mvsPreviewStyle.Color := PreviewColor;
        mvsPreviewStyle.AnotherColor := PreviewColor;
      end;  
    end;
    
    with mvsPreviewStyle do 
      AssignedValues := AssignedValues + [svAnotherColor];
      
    if (DrawMode = mvdmOddEven) then
    begin
      mvsAnotherContentStyle.Color := EvenColor;
      mvsAnotherContentStyle.Font := EvenFont;
    end;
    
    mvsCaptionStyle.Font := CaptionNodeFont;
    mvsHeaderStyle.Font := HeaderFont;
    mvsFooterStyle.Font := FooterFont;
    mvsGroupStyle.Font := GroupNodeFont;
    
    if (DrawMode = mvdmOddEven) then
    begin
      mvsContentStyle.Font := OddFont;
      mvsPreviewStyle.Font := OddFont;
    end  
    else
    begin  
      mvsContentStyle.Font := Font;
      mvsPreviewStyle.Font := PreviewFont;
    end;
    
    for I := 0 to dxMVPreview.StyleCount - 1 do
      dxMVPreview.Styles[I].Font.Size := dxMVPreview.Font.Size;
  end;
  FPreviewBox.HandleNeeded;
  FPreviewBox.Invalidate;
end;

function TdxMVReportLinkDesignWindow.GetMasterViewReportLink: TdxMasterViewReportLink;
begin
  Result := TdxMasterViewReportLink(ReportLink);
end;

procedure TdxMVReportLinkDesignWindow.ShowClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  if Assigned(Sender) then 
  begin
    with MasterViewReportLink do 
      if TCheckBox(Sender).Checked then
        Options := Options + [TdxMasterViewPaintOption(TCheckBox(Sender).Tag)]
      else
        Options := Options - [TdxMasterViewPaintOption(TCheckBox(Sender).Tag)];
    Modified := True;
  end;  
  UpdatePreview;
end;

procedure TdxMVReportLinkDesignWindow.cbxDrawModeChange(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  MasterViewReportLink.DrawMode := TdxMasterViewDrawMode(TComboBox(Sender).ItemIndex);
  Modified := True;
  UpdatePreview;
end;

procedure TdxMVReportLinkDesignWindow.chbxAutoNodesExpandClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  MasterViewReportLink.AutoNodesExpand := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxMVReportLinkDesignWindow.chbxOnlySelectedClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  MasterViewReportLink.OnlySelected := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxMVReportLinkDesignWindow.chbxExtendedSelectClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  MasterViewReportLink.ExtendedSelect := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxMVReportLinkDesignWindow.chbxAutoCalcPreviewLinesClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  MasterViewReportLink.PreviewLineCount := -Byte(TCheckBox(Sender).Checked);
  TdxPSSpinEdit(FsePreviewLineCount).MinValue := -Byte(MasterViewReportLink.AutoCalcPreviewLines);
  TdxPSSpinEdit(FsePreviewLineCount).Value := -Byte(MasterViewReportLink.AutoCalcPreviewLines);
  Modified := True;
end;

procedure TdxMVReportLinkDesignWindow.chbxTransparentClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  case TCheckBox(Sender).Tag of
    0: MasterViewReportLink.Transparent := TCheckBox(Sender).Checked;
    1: MasterViewReportLink.FixedTransparent := TCheckBox(Sender).Checked;
  end;
  UpdatePreview;
  Modified := True;
end;

procedure TdxMVReportLinkDesignWindow.ccbxColorChange(Sender: TObject);
var
  AColor: TColor;
begin
  if LockControlsUpdate then Exit;
  AColor := TdxPSColorCombo(Sender).ColorValue;
  case TdxPSColorCombo(Sender).Tag of
    0: MasterViewReportLink.Color := AColor;
    1: MasterViewReportLink.EvenColor := AColor;
    2: MasterViewReportLink.PreviewColor := AColor;
    3: MasterViewReportLink.CaptionColor := AColor;
    4: MasterViewReportLink.GroupNodeColor := AColor;
    5: MasterViewReportLink.HeaderColor := AColor;    
    6: MasterViewReportLink.FooterColor := AColor;    
    7: MasterViewReportLink.GridLineColor := AColor;
  end;
  UpdatePreview;
  Modified := True;
end;

procedure TdxMVReportLinkDesignWindow.btnChangeFontClick(Sender: TObject);
begin
  DoChangeFont(lbxFonts.ItemIndex);
end;

procedure TdxMVReportLinkDesignWindow.lbxFontsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  W: Integer;
  S: string;
  AIndex: Integer;
begin
  AIndex := lbxFonts.ItemAtPos(Point(X, Y), True);
  if (AIndex = -1) or (AIndex = FLastIndex  ) then Exit;
  lbxFonts.Hint := '';
  Application.CancelHint;
  S := GetFontInfoText(AIndex);
  W := lbxFonts.Canvas.TextWidth(S);
  if (W > lbxFonts.Width - lbxFonts.Canvas.TextWidth(lbxFonts.Items[AIndex])) then
  begin
    lbxFonts.Hint := S;
    FLastIndex := AIndex;
  end;
end;

procedure TdxMVReportLinkDesignWindow.lbxFontsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  ItemIndex: Integer;  
begin
  if (MasterViewReportLink.DrawMode <> mvdmOddEven) and (Key in [VK_UP, VK_DOWN]) then 
  begin
    ItemIndex := TListBox(Sender).ItemIndex;
    case Key of
      VK_UP: 
        if IsDisableIndex(ItemIndex - 1) then 
          while IsDisableIndex(ItemIndex - 1) do Dec(ItemIndex);
      VK_DOWN:
        if IsDisableIndex(ItemIndex + 1) then 
          while IsDisableIndex(ItemIndex + 1) do Inc(ItemIndex);
    end;
    TListBox(Sender).ItemIndex := ItemIndex;
  end;  
  if (Key = VK_RETURN) and (ssCtrl in Shift) then
    btnChangeFont.Click;
end;

procedure TdxMVReportLinkDesignWindow.lbxFontsDrawItem(
  Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);

  function GetMaxLength: Integer;
  var
    V, I: Integer;
  begin
    Result := 0;
    with TListBox(Control) do
      for I := 0 to Items.Count - 1 do
      begin
        V := Canvas.TextWidth(Items[I]);
        if (V > Result) then Result := V;
      end;
    Inc(Result, 8);
  end;

  function GetFontColor(AIndex: Integer): TColor;
  begin
    if IsDisableIndex(AIndex) then
      Result := ColorToRGB(clBtnFace)
    else 
      Result := ColorToRGB(clWindowText);//GetFontByIndex(AIndex).Color;
  end;
  
const
  FirstEntries: Boolean = True;
  MaxLength: Integer = 0;
var
  R: TRect;
  BrushColor, FontColor: TColor;
  S: string;
begin
  if FirstEntries then
  begin
    MaxLength := GetMaxLength;
    FirstEntries := False;
  end;
  
  with TListBox(Control) do
  begin
    BrushColor := Canvas.Brush.Color;
    if IsDisableIndex(Index) then
      Canvas.Brush.Color := ColorToRGB(clWindow);
    with Rect do 
      R := Classes.Rect(Left, Top, Left + MaxLength, Bottom);
    FontColor := Canvas.Font.Color;
    if not (odSelected in State) or IsDisableIndex(Index) then 
      Canvas.Font.Color := GetFontColor(Index);
    Canvas.TextRect(R, R.Left + 2, R.Top + 2, Items[Index]);
    R.Left := R.Right;
    Inc(R.Right);
    Canvas.Brush.Color := ColorToRGB(clBtnShadow);
    Canvas.FrameRect(R);
    if IsDisableIndex(Index) then    
      Canvas.Brush.Color := ColorToRGB(clWindow)
    else
      Canvas.Brush.Color := BrushColor;
    R.Left := R.Right;
    R.Right := Rect.Right;
    S := GetFontInfoText(Index);
    Canvas.TextRect(R, R.Left + 2, R.Top + 2, S);
    if not (odSelected in State) or IsDisableIndex(Index) then 
      Canvas.Font.Color := FontColor;
    if (odFocused in State) and IsDisableIndex(Index) then 
      Canvas.DrawFocusRect(Rect);    
    Canvas.Brush.Color := BrushColor;
  end  
end;

function TdxMVReportLinkDesignWindow.GetFontInfoText(AIndex: Integer): string;
begin
  Result := FormatFontInfo(GetFontByIndex(AIndex));
end;

function TdxMVReportLinkDesignWindow.GetMaxWidth: Integer;
var
  I, L, W: Integer;
begin
  with lbxFonts do
  begin
    W := Canvas.TextWidth(Items[0] + 'X');
    for I := 1 to Items.Count - 1 do
    begin
      L := Canvas.TextWidth(Items[I] + 'X');
      if (L > W) then W := L;
    end;
    Result := W;
    W := Canvas.TextWidth(GetFontInfoText(0) + 'X');
    for I := 1 to Items.Count - 1 do
    begin
      L := Canvas.TextWidth(GetFontInfoText(I) + 'X');
      if (L > W) then W := L;
    end;
  end;
  Inc(Result, W + 2 + 8 + 3);
end;
    
procedure TdxMVReportLinkDesignWindow.lbxFontsClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  UpdateControlsState;
end;

procedure TdxMVReportLinkDesignWindow.pmChangeFontPopup(Sender: TObject);
begin
  miChangeFont.Enabled := btnChangeFont.Enabled;
end;

procedure TdxMVReportLinkDesignWindow.lbxFontsDblClick(Sender: TObject);
begin
  if btnChangeFont.Enabled then btnChangeFont.Click;
end;

function TdxMVReportLinkDesignWindow.GetFontByIndex(AIndex: Integer): TFont;
begin
  with MasterViewReportLink do 
    case AIndex of
      0: Result := Font;
      1: Result := OddFont;    
      2: Result := EvenFont;
      3: Result := CaptionNodeFont;    
      4: Result := GroupNodeFont;
      5: Result := FooterFont;
      6: Result := HeaderFont;
    else  
      Result := MasterViewReportLink.PreviewFont;
    end;
end;

procedure TdxMVReportLinkDesignWindow.DoChangeFont(Index: Integer);
var
  I: Integer;
begin
  FD.Font := GetFontByIndex(Index);
  if dxPrintDevice.Printers.Count > 0 then
    FD.Device := fdPrinter
  else
    FD.Device := fdScreen;
  if FD.Execute then
  begin  
    with lbxFonts do 
    begin
      for I := 0 to Items.Count - 1 do
        if Selected[I] then GetFontByIndex(I).Assign(FD.Font);
    end;     
    lbxFonts.Refresh;
    UpdatePreview;
    Modified := True;
  end;
end;

procedure TdxMVReportLinkDesignWindow.dxMVPreviewGetContentStyle(
  Sender: TdxMasterViewLevel; Node: TdxMasterViewNode;
  Column: TdxMasterViewColumn; var NewStyle: TdxMasterViewStyle);
begin
  if (MasterViewReportLink.DrawMode = mvdmOddEven) and not MasterViewReportLink.Transparent and
    Odd(Node.Index) then
    NewStyle := mvsAnotherContentStyle;
end;

initialization
  dxPSRegisterReportLink(TdxMasterViewReportLink, TdxMasterView, TdxMVReportLinkDesignWindow);

finalization
  dxPSUnRegisterReportLink(TdxMasterViewReportLink, TdxMasterView, TdxMVReportLinkDesignWindow);

end.
