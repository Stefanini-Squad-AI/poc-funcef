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

unit dxPSdxTLLnk;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  StdCtrls, ExtCtrls, ComCtrls, {$IFDEF DELPHI4}ImgList, {$ENDIF}
  dxTL, dxCntner, dxTLClms, dxPSGlbl, dxPSCore;

type
  TdxTreeListPaintOption = 
    (tlpoBands, tlpoHeaders, tlpoFooters, tlpoRowFooters, tlpoPreview, 
     tlpoPreviewGrid, tlpoGrid, tlpoFlatCheckMarks, tlpoImages,
     tlpoStateImages, tlpoTransparentColumnGraphic, tlpoGraphicAsText,
     tlpo3DEffects, tlpoSoft3D, tlpoRowFooterGrid, tlpoCheckMarksAsText);
  TdxTreeListPaintOptions = set of TdxTreeListPaintOption;
  
  TdxTreeListLinkCellType = 
    (tlctUnknown, tlstBand, tlstCell, tlstFooter, tlstGroupFooter, tlstHeader, tlstPreview);
    
  TdxTreeListDrawMode = (tldmStrict, tldmOddEven, tldmBorrowSource);
  
  PdxTreeListBand = ^TdxTreeListBand;
  PdxTreeListColumn = ^TdxTreeListColumn;
  PdxTreeListNode = ^TdxTreeListNode;
  
  TdxTLReportLinkCustomDrawBandCellEvent = procedure(Sender: TBasedxReportLink;
    ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; ABand: TdxTreeListBand;
    var AText: string; var AColor: TColor; AFont: TFont; 
    var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
    var ADone: Boolean) of object;
    
  TdxTLReportLinkCustomDrawCellEvent = procedure(Sender: TBasedxReportLink;
    ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; ANode: TdxTreeListNode;
    AColumn: TdxTreeListColumn; var AText: string; var AColor: TColor; 
    AFont: TFont; var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
    var ADone: Boolean) of object;
    
  TdxTLReportLinkCustomDrawFooterCellEvent = procedure(Sender: TBasedxReportLink;
    ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; ANode: TdxTreeListNode;
    AColumn: TdxTreeListColumn; var AText: string; var AColor: TColor; 
    AFont: TFont; var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
    var ADone: Boolean) of object;
    
  TdxTLReportLinkCustomDrawHeaderCellEvent = procedure(Sender: TBasedxReportLink;
    ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; AColumn: TdxTreeListColumn;
    var AText: string; var AColor: TColor; AFont: TFont; 
    var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
    var ASorted: TdxCellSortOrder; var ADone: Boolean) of object;
    
  TdxTLReportLinkCustomDrawPreviewCellEvent = procedure(Sender: TBasedxReportLink;
    ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; ANode: TdxTreeListNode; 
    var AText: string; var AColor, ATextColor: TColor; AFont: TFont; 
    var ADone: Boolean) of object;
    
  TdxTLReportLinkCustomDrawRowFooterCellEvent = procedure(Sender: TBasedxReportLink;
    ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; ANode: TdxTreeListNode;
    AColumn: TdxTreeListColumn; AFooterIndex: Integer; var AText: string; 
    var AColor: TColor; AFont: TFont; var ATextAlignX: TdxTextAlignX; 
    var ATextAlignY: TdxTextAlignY; var ADone: Boolean) of object;


  TCustomdxTreeListReportLink = class(TBasedxReportLink)
  private 
    FAutoNodesExpand: Boolean;
    FBandColor: TColor;
    FBandFont: TFont;
    FBandsOnEveryPage: Boolean;
    FDrawMode: TdxTreeListDrawMode;
    FEvenColor: TColor;
    FEvenFont: TFont;
    FExpandLevel: Integer;
    FExtendedSelect: Boolean;
    FFixedTransparent: Boolean;
    FFooterFont: TFont;
    FGraphicAsTextValue: string;
    FGridLineColor: TColor;
    FGroupNodeColor: TColor;
    FGroupNodeFont: TFont;
    FHeaderColor: TColor;
    FHeaderFont: TFont;
    FHorzDelimitByBands: Boolean;
    FOddFont: TFont;
    FOnlySelected: Boolean;
    FOptions: TdxTreeListPaintOptions;
    FPreviewColor: TColor;
    FPreviewFont: TFont;
    FPreviewLineCount: Integer;
    FRowFooterColor: TColor;
    FRowFooterFont: TFont;
    FSupportedCustomDraw: Boolean;

    FOnCustomDrawBandCell: TdxTLReportLinkCustomDrawBandCellEvent;
    FOnCustomDrawCell: TdxTLReportLinkCustomDrawCellEvent;
    FOnCustomDrawFooterCell: TdxTLReportLinkCustomDrawFooterCellEvent;
    FOnCustomDrawHeaderCell: TdxTLReportLinkCustomDrawHeaderCellEvent;
    FOnCustomDrawPreviewCell: TdxTLReportLinkCustomDrawPreviewCellEvent;
    FOnCustomDrawRowFooterCell: TdxTLReportLinkCustomDrawRowFooterCellEvent;
    
    FAbsoluteIndexes: TList;
    FColumnInfos: TList;
    FNodes: TList;

    FBandFontIndex: Integer;
    FBandHeight: Integer;
    FCustomDrawFontChanged: Boolean;
    FEvenFontIndex: Integer;
    FFooterPanelHeight: Integer;
    FFooterRowHeight: Integer;
    FGroupNodeFontIndex: Integer;
    FGroupRowHeight: Integer;
    FFooterFontIndex: Integer;
    FHeaderFontIndex: Integer;
    FHeaderRowHeight: Integer;
    FEvenHyperLinkFontIndex: Integer;
    FHyperLinkFontIndex: Integer;
    FOddHyperLinkFontIndex: Integer;
    FOddFontIndex: Integer;
    FNodeFooterRowHeight: Integer;
    FPaintStyle: TdxTreeListPaintStyle;
    FPreviewFontIndex: Integer;
    FPreviewHeight: Integer;
    FPreviewLineHeight: Integer;
    FRowFooterFontIndex: Integer;    
    FRowHeight: Integer;
    FFullWidth: Integer;
    FSaveFont: TFont;
    
    function GetCustomTreeList: TCustomdxTreeListControl;
    function GetExpandLevel: Integer;
    function GetExtendedColorManage: Boolean;
    function GetOddColor: TColor;
    function GetOptions: TdxTreeListPaintOptions;
    function GetUseColumnFont: Boolean;
    function IsGraphicAsTextValueStored: Boolean;
    procedure SetAutoNodesExpand(Value: Boolean);
    procedure SetBandFont(Value: TFont);
    procedure SetBandColor(Value: TColor);
    procedure SetBandsOnEveryPage(Value: Boolean);
    procedure SetDrawMode(Value: TdxTreeListDrawMode);
    procedure SetEvenColor(Value: TColor);
    procedure SetEvenFont(Value: TFont);
    procedure SetExpandLevel(Value: Integer);
    procedure SetExtendedColorManage(Value: Boolean);
    procedure SetExtendedSelect(Value: Boolean);
    procedure SetFixedTransparent(Value: Boolean);
    procedure SetFooterFont(Value: TFont);
    procedure SetGraphicAsTextValue(const Value: string);
    procedure SetGridLineColor(Value: TColor);
    procedure SetGroupNodeColor(Value: TColor);
    procedure SetGroupNodeFont(Value: TFont);
    procedure SetHeaderColor(Value: TColor);
    procedure SetHeaderFont(Value: TFont);
    procedure SetHorzDelimitByBands(Value: Boolean);
    procedure SetOddFont(Value: TFont);
    procedure SetOddColor(Value: TColor);
    procedure SetPreviewLineCount(Value: Integer);
    procedure SetOnCustomDrawBandCell(Value: TdxTLReportLinkCustomDrawBandCellEvent);
    procedure SetOnCustomDrawCell(Value: TdxTLReportLinkCustomDrawCellEvent);
    procedure SetOnCustomDrawFooterCell(Value: TdxTLReportLinkCustomDrawFooterCellEvent);
    procedure SetOnCustomDrawHeaderCell(Value: TdxTLReportLinkCustomDrawHeaderCellEvent);
    procedure SetOnCustomDrawPreviewCell(Value: TdxTLReportLinkCustomDrawPreviewCellEvent);
    procedure SetOnCustomDrawRowFooterCell(Value: TdxTLReportLinkCustomDrawRowFooterCellEvent);
    procedure SetOnlySelected(Value: Boolean);
    procedure SetOptions(Value: TdxTreeListPaintOptions);
    procedure SetPreviewColor(Value: TColor);
    procedure SetPreviewFont(Value: TFont);
    procedure SetRowFooterColor(Value: TColor);
    procedure SetRowFooterFont(Value: TFont);
    procedure SetSupportCustomDraw(Value: Boolean);
    procedure SetUseColumnFont(Value: Boolean);

    procedure AddNodes;
    procedure CalcAbsoluteIndexes;
    procedure CalcColumnInfos(AReportCells: TdxReportCells);
    procedure CalcFontIndexes(AReportCells: TdxReportCells);
    procedure FreeHeaderInfos;

    function CanDrawImages(ANode: TdxTreeListNode): Boolean;
    function CanDrawStateImages(ANode: TdxTreeListNode): Boolean;
    function CanUseOddEvenMode(ANode: TdxTreeListNode; ANodeIndex: Integer): Boolean;
    procedure CustomDrawFontChanged(Sender: TObject);
    function GetBandLeft(AVisibleIndex: Integer): Integer;
    function GetBandRect(AVisibleIndex: Integer): TRect;
    function GetBandRegionHeight: Integer;
    function GetBandWidth(AVisibleIndex: Integer): Integer;
    function GetCellColor(ANode: TdxTreeListNode; AColumnIndex, ANodeIndex: Integer): TColor;
    function GetCellCustomDrawInfo(AItem: TdxReportVisualItem; ANode: PdxTreeListNode; 
      AColumn: PdxTreeListColumn; ABand: PdxTreeListBand; 
      AFooterIndex: PInteger): TdxTreeListLinkCellType;
    function GetEvenNodeFontIndex(AColumn: TdxTreeListColumn): Integer;
    function GetOddEvenModeCellColor(ANodeIndex: Integer): TColor;
    function GetOddEvenModeFontIndex(AColumn: TdxTreeListColumn; ANodeIndex: Integer): Integer;
    function GetOddNodeFontIndex(AColumn: TdxTreeListColumn): Integer;
    function GetCellFontIndex(ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ANodeIndex: Integer): Integer;
    procedure GetCellRect(AAbsoluteIndex: Integer; ACellType: TdxTreeListLinkCellType; 
      var R: TRect);
    procedure GetColumnInfos(AAbsoluteIndex: Integer; ABandIndex, ARowIndex,
      AColIndex, ARowCount, AColCount: PInteger; AIsFirstColumn, AIsLastColumn: PBoolean);
    function GetLevelColor(ANode: TdxTreeListNode; ANodeIndex: Integer): TColor;
    function GetPreviewColor(ANodeIndex: Integer): TColor;
    function GetPreviewFontIndex(ANode: TdxTreeListNode; ANodeIndex: Integer): Integer;
    function GetTreeListWidth: Integer;
    function IsCellTransparent(ANode: TdxTreeListNode): Boolean;
    function IsLevelTransparent(ANode: TdxTreeListNode): Boolean;
    function IsExistSelectedNodes: Boolean;
    function IsExtendedSelect: Boolean;
    function IsHyperLinkColumnsExists: Boolean;
    function IsPreviewTransparent(ANode: TdxTreeListNode): Boolean;
    function IsSelectedNode(ANode: TdxTreeListNode): Boolean;
    function NeedGroupNodeFontIndex(ANode: TdxTreeListNode; AFontIndex: Integer): Boolean;
  protected
    FIndent: Integer;
    procedure ConstructReport(AReportCells: TdxReportCells); override;
    procedure InternalRestoreDefaults; override;
    procedure InternalRestoreFromOriginal; override;
    function IsDrawFootersOnEveryPage: Boolean; override;
    function IsDrawHeadersOnEveryPage: Boolean; override;
    procedure MakeDelimiters(AReportCells: TdxReportCells; 
      AHorzDelimiters, AVertDelimiters: TList); override;

    procedure AssignValues(ADataItem: TAbstractdxReportCellData;
      ANode: TdxTreeListNode; AColumn, AReferenceColumn: TdxTreeListColumn); virtual; abstract;
    function GetDataClass(AColumn: TdxTreeListColumn; 
      ANode: TdxTreeListNode): TdxReportCellDataClass; virtual;
    function GetGroupColumnIndex(ANode: TdxTreeListNode): Integer; virtual;
  {$IFDEF EXPRESSQUANTUMGRID3}  
    function GetReferenceColumn(AColumn: TdxTreeListColumn; 
      ANode: TdxTreeListNode): TdxTreeListColumn; virtual;
  {$ENDIF}    
    function IsGraphicColumn(AColumn: TdxTreeListColumn): Boolean; virtual;
    function IsHyperLinkColumn(AColumn: TdxTreeListColumn): Boolean; virtual;
    procedure PrepareConstruct(AReportCells: TdxReportCells); virtual;
    procedure UnprepareConstruct(AReportCells: TdxReportCells); virtual;
    
    { custom draw support }    
    procedure CustomDraw(AItem: TAbstractdxReportCellData; ACanvas: TCanvas;
      ABoundsRect, AClientRect: TRect; var ADone: Boolean); override;
    procedure DoCustomDrawBandCell(ACanvas: TCanvas; ABoundsRect, 
      AClientRect: TRect; ABand: TdxTreeListBand; var AText: string; 
      var AColor: TColor; AFont: TFont; var ATextAlignX: TdxTextAlignX; 
      var ATextAlignY: TdxTextAlignY; var ADone: Boolean); virtual;
    procedure DoCustomDrawCell(ACanvas: TCanvas; ABoundsRect, AClientRect: TRect;
      ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; var AText: string; 
      var AColor: TColor; AFont: TFont; var ATextAlignX: TdxTextAlignX; 
      var ATextAlignY: TdxTextAlignY; var ADone: Boolean); virtual;
    procedure DoCustomDrawFooterCell(ACanvas: TCanvas; ABoundsRect, 
      AClientRect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; 
      var AText: string;  var AColor: TColor; AFont: TFont; 
      var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
      var ADone: Boolean); virtual;
    procedure DoCustomDrawHeaderCell(ACanvas: TCanvas; ABoundsRect, 
      AClientRect: TRect; AColumn: TdxTreeListColumn; var AText: string; 
      var AColor: TColor; AFont: TFont; var ATextAlignX: TdxTextAlignX; 
      var ATextAlignY: TdxTextAlignY; var ASorted: TdxCellSortOrder; 
      var ADone: Boolean); virtual;
    procedure DoCustomDrawPreviewCell(ACanvas: TCanvas; ABoundsRect, 
      AClientRect: TRect; ANode: TdxTreeListNode; var AText: string; 
      var AColor: TColor; AFont: TFont; var ADone: Boolean); virtual;
    procedure DoCustomDrawRowFooterCell(ACanvas: TCanvas; ABoundsRect, 
      AClientRect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; 
      AFooterIndex: Integer; var AText: string; var AColor: TColor; AFont: TFont; 
      var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
      var ADone: Boolean); virtual;
    function IsSupportedCustomDraw(Item: TAbstractdxReportCellData): Boolean; override;

    { options access }
    function AutoCalcPreviewLines: Boolean;
    function CheckMarksAsText: Boolean;
    function FlatCheckMarks: Boolean;
    function GraphicsAsText: Boolean;
    function OddEvenMode: Boolean;
    function ShowBands: Boolean;
    function ShowFooters: Boolean;
    function ShowGrid: Boolean;
    function ShowHeaders: Boolean;
    function ShowImages: Boolean;
    function ShowPreview: Boolean;
    function ShowPreviewGrid: Boolean;
    function ShowRowFooterGrid: Boolean;
    function ShowRowFooters: Boolean;
    function ShowStateImages: Boolean;
    function TransparentColumnGraphics: Boolean;
    function Use3DEffects: Boolean;
    function UseSoft3D: Boolean;

    property CustomTreeList: TCustomdxTreeListControl read GetCustomTreeList;
    property OnCustomDrawBandCell: TdxTLReportLinkCustomDrawBandCellEvent
      read FOnCustomDrawBandCell write SetOnCustomDrawBandCell;
    property OnCustomDrawCell: TdxTLReportLinkCustomDrawCellEvent
      read FOnCustomDrawCell write SetOnCustomDrawCell;
    property OnCustomDrawFooterCell: TdxTLReportLinkCustomDrawFooterCellEvent
      read FOnCustomDrawFooterCell write SetOnCustomDrawFooterCell;
    property OnCustomDrawHeaderCell: TdxTLReportLinkCustomDrawHeaderCellEvent
      read FOnCustomDrawHeaderCell write SetOnCustomDrawHeaderCell;
    property OnCustomDrawPreviewCell: TdxTLReportLinkCustomDrawPreviewCellEvent
      read FOnCustomDrawPreviewCell write SetOnCustomDrawPreviewCell;
    property OnCustomDrawRowFooterCell: TdxTLReportLinkCustomDrawRowFooterCellEvent
      read FOnCustomDrawRowFooterCell write SetOnCustomDrawRowFooterCell;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    function IsDBGridLink: Boolean; virtual;
    function IsDBTreeListLink: Boolean; virtual;
    function IsTreeListLink: Boolean; virtual;
  published
    property AutoNodesExpand: Boolean read FAutoNodesExpand write SetAutoNodesExpand
      default False;
    property BandColor: TColor read FBandColor write SetBandColor
      default clSilver; {dxDefaultFixedColor}
    property BandFont: TFont read FBandFont write SetBandFont;
    property BandsOnEveryPage: Boolean read FBandsOnEveryPage write SetBandsOnEveryPage
      default True;
    property Color;
    property DrawMode: TdxTreeListDrawMode read FDrawMode write SetDrawMode
      default tldmStrict;
    property ExpandLevel: Integer read GetExpandLevel write SetExpandLevel
      default -1; {full expand}
   {obsolete - use instead: DrawMode = tldmBorrowSource}
    property ExtendedColorManage: Boolean read GetExtendedColorManage write SetExtendedColorManage
      default False;
    property ExtendedSelect: Boolean read FExtendedSelect write SetExtendedSelect
      default True;
    property EvenColor: TColor read FEvenColor write SetEvenColor
      default clWhite;
    property EvenFont: TFont read FEvenFont write SetEvenFont;
    property FixedTransparent: Boolean read FFixedTransparent write SetFixedTransparent
      default False;
    property Font;
    property FooterFont: TFont read FFooterFont write SetFooterFont;
    property GraphicAsTextValue: string read FGraphicAsTextValue write SetGraphicAsTextValue
      stored IsGraphicAsTextValueStored;
    property GridLineColor: TColor read FGridLineColor write SetGridLineColor
      default clBlack;
    property GroupNodeFont: TFont read FGroupNodeFont write SetGroupNodeFont;
    property GroupNodeColor: TColor read FGroupNodeColor write SetGroupNodeColor
      default clSilver;
    property HeaderColor: TColor read FHeaderColor write SetHeaderColor
      default clSilver;
    property HeaderFont: TFont read FHeaderFont write SetHeaderFont;
    property HorzDelimitByBands: Boolean read FHorzDelimitByBands write SetHorzDelimitByBands
      default False;
    property OddColor: TColor read GetOddColor write SetOddColor
      default clWhite;
    property OddFont: TFont read FOddFont write SetOddFont;
    property OnlySelected: Boolean read FOnlySelected write SetOnlySelected
      default False;
    property Options: TdxTreeListPaintOptions read GetOptions write SetOptions
      default [tlpoBands..tlpoStateImages, tlpoSoft3D, tlpoRowFooterGrid];
    property FootersOnEveryPage;
    property HeadersOnEveryPage default True;
    property PreviewColor: TColor read FPreviewColor write SetPreviewColor
      default clWhite;
    property PreviewFont: TFont read FPreviewFont write SetPreviewFont;
    property PreviewLineCount: Integer read FPreviewLineCount write SetPreviewLineCount
      default -1;
    property RowFooterColor: TColor read FRowFooterColor write SetRowFooterColor
      default clSilver;
    property RowFooterFont: TFont read FRowFooterFont write SetRowFooterFont;
    property ScaleFonts;
    property SupportedCustomDraw: Boolean read FSupportedCustomDraw write SetSupportCustomDraw
      default False;
    property Transparent;
    property UseHorzDelimiters;
    property UseVertDelimiters;
    { obsolete - use instead: DrawMode = tldmBorrowSource }
    property UseColumnFont: Boolean read GetUseColumnFont write SetUseColumnFont
      default False;
  end;

  TdxTreeListReportLink = class(TCustomdxTreeListReportLink)
  private
    function GetTreeList: TdxTreeList;
  protected
    procedure AssignValues(ADataItem: TAbstractdxReportCellData;
      ANode: TdxTreeListNode; AColumn, AReferenceColumn: TdxTreeListColumn); override;
    function GetDataClass(AColumn: TdxTreeListColumn; 
      ANode: TdxTreeListNode): TdxReportCellDataClass; override;
  public
    property TreeList: TdxTreeList read GetTreeList;
  published
    property OnCustomDrawBandCell;
    property OnCustomDrawCell;
    property OnCustomDrawFooterCell;
    property OnCustomDrawHeaderCell;
    property OnCustomDrawPreviewCell;
    property OnCustomDrawRowFooterCell;
  end;


  TdxTLReportLinkDesignWindow = class(TAbstractdxReportLinkDesignWindow)
    PageControl1: TPageControl;
    tshColors: TTabSheet;
    tshFonts: TTabSheet;
    pnlPreview: TPanel;
    lblPreview: TStaticText;
    Panel5: TPanel;
    Bevel2: TBevel;
    chbxTransparent: TCheckBox;
    chbxFixedTransparent: TCheckBox;
    gbxTransparent: TGroupBox;
    lblColor: TLabel;
    bvlColorHolder: TBevel;
    gbxFixedTransparent: TGroupBox;
    lblBandColor: TLabel;
    lblHeaderColor: TLabel;
    lblRowFooterColor: TLabel;
    bvlBandColorHolder: TBevel;
    bvlHeaderColorHolder: TBevel;
    bvlRowFooterColorHolder: TBevel;
    lblGridLineColor: TLabel;
    bvlGridLineColorHolder: TBevel;
    FD: TFontDialog;
    dxTLPreview: TdxTreeList;
    dxTLPreviewColumn1: TdxTreeListColumn;
    ilTLImages: TImageList;
    Bevel3: TBevel;
    btnChangeFont: TButton;
    lblGroupNodeColor: TLabel;
    bvlGroupNodeColorHolder: TBevel;
    lblPreviewColor: TLabel;
    bvlPreviewColorHolder: TBevel;
    dxTLPreviewColumn3: TdxTreeListCheckColumn;
    lbxFonts: TListBox;
    dxTLPreviewColumn4: TdxTreeListImageColumn;
    tshBeh: TTabSheet;
    lblEvenColor: TLabel;
    bvlEvenColorHolder: TBevel;
    tshOptions: TTabSheet;
    Bevel5: TBevel;
    Bevel9: TBevel;
    Bevel11: TBevel;
    chbxShowGrid: TCheckBox;
    chbxShowNodeGrid: TCheckBox;
    chbxShowGroupFooterGrid: TCheckBox;
    chbxShowBands: TCheckBox;
    chbxShowHeaders: TCheckBox;
    chbxShowFooters: TCheckBox;
    chbxShowPreview: TCheckBox;
    chbxShowGroupFooters: TCheckBox;
    chbxFlatCheckMarks: TCheckBox;
    chbxAutoCalcPreviewLines: TCheckBox;
    lblPreviewLineCount: TLabel;
    bvlPreviewLineCountHolder: TBevel;
    Image6: TImage;
    lblShow: TLabel;
    lblMiscellaneous: TLabel;
    chbxTransparentColumnGraphic: TCheckBox;
    chbxDisplayGraphicsAsText: TCheckBox;
    chbxShowStateImages: TCheckBox;
    chbxShowImages: TCheckBox;
    Bevel10: TBevel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    Image1: TImage;
    chbxBandsOnEveryPage: TCheckBox;
    chbxHeadersOnEveryPage: TCheckBox;
    chbxFootersOnEveryPage: TCheckBox;
    Image3: TImage;
    chbxOnlySelected: TCheckBox;
    chbxExtendedSelect: TCheckBox;
    chbxAutoNodesExpand: TCheckBox;
    Image4: TImage;
    lblExpandLevel: TLabel;
    bvlExpandLevelHolder: TBevel;
    lblSelection: TLabel;
    lblExpanding: TLabel;
    lblOnEveryPage: TLabel;
    lblGraphics: TLabel;
    bvlGraphic: TBevel;
    imgGraphics: TImage;
    lbl3DEffects: TLabel;
    Image8: TImage;
    Bevel15: TBevel;
    chbxUse3DEffects: TCheckBox;
    chbxUseSoft3D: TCheckBox;
    Bevel16: TBevel;
    bvlShowImages: TBevel;
    imgGrid: TImage;
    imgImages: TImage;
    cbxDrawMode: TComboBox;
    lblDrawMode: TLabel;
    pmChangeFont: TPopupMenu;
    miChangeFont: TMenuItem;
    lblGrid: TLabel;
    lblImages: TLabel;
    chbxCheckMarksAsText: TCheckBox;
    procedure FontClick(Sender: TObject);
    procedure chbxTransparentClick(Sender: TObject);
    procedure lblColorClick(Sender: TObject);
    procedure lblExpandLevelClick(Sender: TObject);
    procedure chbxOnlySelectedClick(Sender: TObject);
    procedure chbxExtendedSelectClick(Sender: TObject);
    procedure dxTLPreviewGetFooterCellText(Sender: TObject;
      ANode: TdxTreeListNode; AColumn, AFooterIndex: Integer;
      var AText: string);
    procedure dxTLPreviewGetPreviewText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: string);
    procedure dxTLPreviewIsExistFooterCell(Sender: TObject;
      AColumn: Integer; var AExist: Boolean);
    procedure dxTLPreviewIsExistRowFooterCell(Sender: TObject;
      ANode: TdxTreeListNode; AColumn, AFooterIndex: Integer;
      var AExist: Boolean);
    procedure dxTLPreviewIsLevelFooter(Sender: TObject; ALevel: Integer;
      var AExist: Boolean);
    procedure dxTLPreviewCustomDrawFooterNode(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; AFooterIndex: Integer; var AText: string;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure dxTLPreviewCustomDrawFooter(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; var AText: string; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure btnChangeFontClick(Sender: TObject);
    procedure FontsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dxTLPreviewCustomDrawPreviewCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      ASelected: Boolean; var AText: string; var AColor,
      ATextColor: TColor; AFont: TFont; var ADone: Boolean);
    procedure FontsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbxFontsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbxFontsClick(Sender: TObject);
    procedure dxTLPreviewColumn4CustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: string; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure chbxAutoNodesExpandClick(Sender: TObject);
    procedure chbxHeadersOnEveryPageClick(Sender: TObject);
    procedure chbxBandsOnEveryPageClick(Sender: TObject);
    procedure chbxFootersOnEveryPageClick(Sender: TObject);
    procedure dxTLPreviewCustomDrawColumnHeader(Sender: TObject;
      AColumn: TdxTreeListColumn; ACanvas: TCanvas; ARect: TRect;
      var AText: string; var AColor: TColor; AFont: TFont;
      var AAlignment: TAlignment; var ASorted: TdxTreeListColumnSort;
      var ADone: Boolean);
    procedure dxTLPreviewCustomDrawBand(Sender: TObject;
      ABand: TdxTreeListBand; ACanvas: TCanvas; ARect: TRect;
      var AText: string; var AColor: TColor; AFont: TFont;
      var AAlignment: TAlignment; var ADone: Boolean);
    procedure chbxAutoCalcPreviewLinesClick(Sender: TObject);
    procedure dxTLPreviewCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: string;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure dxTLPreviewGetPreviewLineCount(Sender: TObject;
      ANode: TdxTreeListNode; var LCount: Integer);
    procedure chbxShowClick(Sender: TObject);
    procedure cbxDrawModeChange(Sender: TObject);
    procedure lblDrawModeClick(Sender: TObject);
    procedure pmChangeFontPopup(Sender: TObject);
    procedure lbxFontsDblClick(Sender: TObject);
    procedure dxTLPreviewColumn3CustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  private
    ccbxColor: TCustomComboBox;
    ccbxEvenColor: TCustomComboBox;
    ccbxBandColor: TCustomComboBox;
    ccbxHeaderColor: TCustomComboBox;
    ccbxGroupNodeColor: TCustomComboBox;
    ccbxPreviewColor: TCustomComboBox;
    ccbxRowFooterColor: TCustomComboBox;
    ccbxGridLineColor: TCustomComboBox;
    seExpandLevel: TCustomEdit;
    sePreviewLineCount: TCustomEdit;
    FPreviewBox: TCustomControl;    

    procedure ccbxColorChange(Sender: TObject);
    procedure CreateControls;
    procedure DoChangeFont(AIndex: Integer);
    procedure ExpandLevelChange(Sender: TObject);
    procedure FillTreeListData;
    function GetFontByIndex(AIndex: Integer): TFont;
    function GetFontInfoText(AIndex: Integer): string;
    function GetMaxWidth: Integer;
    function GetNodeFont(ANode: TdxTreeListNode; ANodeIndex: Integer): TFont;
    function GetNodeIndex(ANode: TdxTreeListNode): Integer;
    function GetPreviewFont(ANode: TdxTreeListNode; ANodeIndex: Integer): TFont;    
    function GetTreeListReportLink: TCustomdxTreeListReportLink;
    function IsChangeFontEnabled: Boolean;
    function IsDisableIndex(AIndex: Integer): Boolean;    
    procedure pbxPreviewPaint(Sender: TObject);
    procedure PreviewLineCountChange(Sender: TObject);
    procedure SetColorByTag(ATag: Integer; AColor: TColor);
    procedure SetupPreview;
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
    property TreeListReportLink: TCustomdxTreeListReportLink read GetTreeListReportLink;
  end;

  TdxTreeListColumnMapperProc = function(AColumn: TdxTreeListColumn;
    AReportLink: TCustomdxTreeListReportLink; ANode: TdxTreeListNode): TdxReportCellDataClass;
    
  TdxTreeListAssignDataProc = procedure(AReportLink: TCustomdxTreeListReportLink;
    ADataItem: TAbstractdxReportCellData; TreeList: TCustomdxTreeList;
    ANode: TdxTreeListNode; AColumn, AReferenceColumn: TdxTreeListColumn);

function DefaultdxTreeListMapperProc(AColumn: TdxTreeListColumn;
  AReportLink: TCustomdxTreeListReportLink; ANode: TdxTreeListNode): TdxReportCellDataClass;
procedure DefaultdxTreeListAssignDataProc(AReportLink: TCustomdxTreeListReportLink;
  ADataItem: TAbstractdxReportCellData; TreeList: TCustomdxTreeList;
  ANode: TdxTreeListNode; AColumn, AReferenceColumn: TdxTreeListColumn);

var
  FdxTreeListAssignDataProc: TdxTreeListAssignDataProc = nil;
  FdxTreeListColumnMapperProc: TdxTreeListColumnMapperProc = nil;
  FPicture: TPicture;
  
const
  dxDefaultTreeListPaintOptions: TdxTreeListPaintOptions = 
    [tlpoBands, tlpoHeaders, tlpoFooters, tlpoRowFooters, tlpoPreview, 
     tlpoPreviewGrid, tlpoGrid, tlpoFlatCheckMarks, tlpoImages, tlpoStateImages, 
     tlpoSoft3D, tlpoRowFooterGrid];
  
implementation

{$R *.DFM}

uses
  MATH, dxExEdtr, dxPSPopupMan, dxExtCtrls, dxPSRes, dxPrnDev, dxPSUtl;

const
  dxSortOrder: array[TdxTreeListColumnSort] of TdxCellSortOrder = (csoNone, csoDown, csoUp);
  sdxPreviews: array[0..6] of string = 
    (sdxItem1Description, sdxItem2Description, sdxItem3Description, 
     sdxItem4Description, sdxItem5Description, sdxItem6Description, 
     sdxItem7Description);
    
type
  PdxColumnInfo = ^TdxColumnInfo;
  TdxColumnInfo = record
    BandIndex: Integer;
    ColIndex: Integer;
    ColCount: Integer;
    RowIndex: Integer;
    RowCount: Integer;
    ColumnLeft: Integer;
    ColumnRight: Integer;    
    CellTop: Integer;
    CellBottom: Integer;
    FooterTop: Integer;
    FooterBottom: Integer;
    HeaderTop: Integer;
    HeaderBottom: Integer;
    NodeFooterTop: Integer;
    NodeFooterBottom: Integer;
    IsFirstColumn: Boolean;
    IsLastColumn: Boolean;
    FontIndex: Integer;
  end;

  TdxTreeListAccess = class(TCustomdxTreeListControl);
  TdxTreeListGraphicColumnAccess = class(TdxTreeListGraphicColumn);
{$IFDEF EXPRESSQUANTUMGRID3}
  TdxTreeListWrapperColumnAccess = class(TdxTreeListWrapperColumn);
{$ENDIF}
  
function ExposeTreeList(ATreeList: TCustomdxTreeListControl): TdxTreeListAccess;
begin
  Result := TdxTreeListAccess(ATreeList);
end;

{ - generic text columns -
  TdxTreeListColumn, TdxTreeListMaskColumn, TdxTreeListButtonColumn,
  TdxTreeListDateColumn, TdxTreeListSpinColumn, TdxTreeListPickColumn,
  TdxTreeListCalcColumn, TdxTreeListHyperLinkColumn, TdxTreeListTimeColumn,
  TdxTreeListCurrencyColumn, TdxTreeListMemoColumn, TdxTreeListMRUColumn,
  TdxTreeListBlobColumn, TdxTreeListWrapperColumn, TdxTreeListPopupColumn }
         
function DefaultdxTreeListMapperProc(AColumn: TdxTreeListColumn;
  AReportLink: TCustomdxTreeListReportLink; ANode: TdxTreeListNode): TdxReportCellDataClass;
const
  CheckClasses: array[Boolean] of TdxReportCellDataClass = (TdxReportCellCheckImage, TdxReportCellString);
  ImageClasses: array[Boolean] of TdxReportCellDataClass = (TdxReportCellGraphic, TdxReportCellImage);  
 {$IFDEF EXPRESSQUANTUMGRID3}      
  GraphicClasses: array[Boolean] of TdxReportCellDataClass = (TdxReportCellString, TdxReportCellGraphic);    
 {$ENDIF}  
begin
  if AColumn is TdxTreeListCheckColumn then
    Result := CheckClasses[tlpoCheckMarksAsText in AReportLink.Options]
  else
    if AColumn is TdxTreeListImageColumn then
      Result := ImageClasses[TdxTreeListImageColumn(AColumn).ShowDescription]
    else  
     {$IFDEF EXPRESSQUANTUMGRID3}    
      Result := GraphicClasses[(AColumn is TdxTreeListGraphicColumn) and not (tlpoGraphicAsText in AReportLink.Options)];
     {$ELSE}
      Result := TdxReportCellString;
     {$ENDIF}           
end;

procedure DefaultdxTreeListAssignDataProc(AReportLink: TCustomdxTreeListReportLink;
  ADataItem: TAbstractdxReportCellData; TreeList: TCustomdxTreeList;
  ANode: TdxTreeListNode; AColumn, AReferenceColumn: TdxTreeListColumn);
var
  ATreeList: TdxTreeListAccess;
  S: string;
  AImageIndex, Stub: Integer;
  AState: TCheckBoxState;
  NullStyle: TdxShowNullFieldStyle;
  GraphicClass: TGraphicClass;
begin
  ATreeList := TdxTreeListAccess(TreeList);
  if ADataItem is TdxReportCellCheck then
    with TdxReportCellCheckImage(ADataItem) do
    begin
      S := ATreeList.GetNodeString(ANode, AColumn.Index);
      AState := TCheckBoxState(TdxTreeListCheckColumn(AReferenceColumn).GetCheckBoxState(S));
      NullStyle := TdxTreeListCheckColumn(AReferenceColumn).ShowNullFieldStyle;
      Enabled := not ((AState = cbGrayed) and (NullStyle > nsUnchecked));
      Checked := (AState = cbChecked) or 
        ((AState = cbGrayed) and (NullStyle = nsGrayedChecked));
      FlatBorder := AReportLink.FlatCheckMarks;
      if not TdxTreeListCheckColumn(AReferenceColumn).Glyph.Empty then 
        Image := TdxTreeListCheckColumn(AReferenceColumn).Glyph;
    end
  else if AReferenceColumn is TdxTreeListMemoColumn then
    with TdxReportCellString(ADataItem) do
    begin
      Text := ATreeList.GetDisplayValue(ANode, AColumn.Index);
      EndEllipsis := (aoDrawEndEllipsis in TreeList.Options);
      Multiline := True;
      TextAlignX := dxTextAlignX[ATreeList.GetCellAlignment(ANode, AColumn.Index)];
      TextAlignY := taTop;
    end
  else if ADataItem is TdxReportCellImage then
    with TdxReportCellImage(ADataItem) do
    begin
      S := ATreeList.GetDisplayValue(ANode, AColumn.Index);
      Text := AReferenceColumn.GetDisplayValue(ANode, S);
      EndEllipsis := True;
      Multiline := TdxTreeListImageColumn(AReferenceColumn).MultilineText;
      TextAlignX := dxTextAlignX[ATreeList.GetCellAlignment(ANode, {AReferenceColumn ?}AColumn.Index)];
      if Multiline then
        TextAlignY := dxMultilineTextAlignY[Multiline]
      else
        TextAlignY := dxTextAlignY[AReferenceColumn.VertAlignment];
      S := ATreeList.GetCellText(ANode, AColumn.Index);
      TdxTreeListImageColumn(AReferenceColumn).GetIndexes(S, AImageIndex, Stub);
      ImageList := TdxTreeListImageColumn(AReferenceColumn).Images;
      ImageIndex := AImageIndex;
      MakeSpaceForEmptyImage := True;
    end
  else if ADataItem is TdxReportCellGraphic then
    if AReferenceColumn is TdxTreeListGraphicColumn then
    begin
      GraphicClass := TdxTreeListGraphicColumnAccess(AReferenceColumn).GetGraphicClass(ANode);
      LoadPicture(FPicture, GraphicClass, ANode.Values[AColumn.Index]);
      if GraphicClass = nil then GraphicClass := TBitmap;
      with TdxReportCellGraphic(ADataItem) do
      begin
        Image := FPicture.Graphic;
        ImageTransparent := 
          (tlpoTransparentColumnGraphic in AReportLink.Options) or GraphicClass.InheritsFrom(TIcon);
        if not GraphicClass.InheritsFrom(TIcon) and TdxTreeListGraphicColumn(AReferenceColumn).Stretch then
          DrawMode := gdmStretchProportional
        else 
          if TdxTreeListGraphicColumn(AReferenceColumn).Center then 
            DrawMode := gdmCenter
          else  
            DrawMode := gdmNone;
      end
    end
    else // AColumn is TdxTreeListImageColumn
      with TdxReportCellGraphic(ADataItem) do
      begin
        ImageTransparent := True;
        ImageList := TdxTreeListImageColumn(AReferenceColumn).Images;
        S := ATreeList.GetCellText(ANode, AColumn.Index);
        TdxTreeListImageColumn(AReferenceColumn).GetIndexes(S, AImageIndex, Stub);
        ImageIndex := AImageIndex;
        DrawMode := gdmCenter;
      end
  else
    with TdxReportCellString(ADataItem) do
    begin
    {$IFDEF EXPRESSQUANTUMGRID3}
      if (AReferenceColumn is TdxTreeListGraphicColumn) then
      begin
        Text := AReportLink.GraphicAsTextValue;
        Multiline := False;
      end  
      else
    {$ENDIF}
      begin
        Text := ATreeList.GetDisplayValue(ANode, AColumn.Index);
        Multiline := ATreeList.GetRowLineCount(ANode, Stub) > 1; //AColumn.HeaderMaxLineCount = 0;
      end;
      EndEllipsis := ATreeList.IsDrawEndEllipsis;
      TextAlignX := dxTextAlignX[ATreeList.GetCellAlignment(ANode, {AReferenceColumn ?}AColumn.Index)];
      if Multiline then
        TextAlignY := dxMultilineTextAlignY[Multiline]
      else
        TextAlignY := dxTextAlignY[AReferenceColumn.VertAlignment];
    end;
end;


{ TCustomdxTreeListReportLink }

constructor TCustomdxTreeListReportLink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBandFont := TFont.Create;
  FEvenFont := TFont.Create;
  FFooterFont := TFont.Create;
  FGroupNodeFont := TFont.Create;
  FHeaderFont := TFont.Create;
  FOddFont := TFont.Create;
  FPreviewFont := TFont.Create;
  FRowFooterFont := TFont.Create;
  InternalRestoreDefaults;
  FBandFont.OnChange := FontChanged;
  FEvenFont.OnChange := FontChanged;
  FFooterFont.OnChange := FontChanged;
  FGroupNodeFont.OnChange := FontChanged;
  FHeaderFont.OnChange := FontChanged;
  FOddFont.OnChange := FontChanged;
  FPreviewFont.OnChange := FontChanged;
  FRowFooterFont.OnChange := FontChanged;
  LinkModified(False);
  FNodes := TList.Create;
  FSaveFont := TFont.Create;
  FSaveFont.OnChange := CustomDrawFontChanged;
end;

destructor TCustomdxTreeListReportLink.Destroy;
begin
  FSaveFont.Free;
  FNodes.Free;
  FRowFooterFont.Free;
  FPreviewFont.Free;
  FOddFont.Free;
  FHeaderFont.Free;
  FGroupNodeFont.Free;
  FFooterFont.Free;
  FEvenFont.Free;
  FBandFont.Free;
  inherited Destroy;
end;

procedure TCustomdxTreeListReportLink.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TCustomdxTreeListReportLink) then
  begin
    AutoNodesExpand := TCustomdxTreeListReportLink(Source).AutoNodesExpand;
    BandsOnEveryPage := TCustomdxTreeListReportLink(Source).BandsOnEveryPage;
    DrawMode := TCustomdxTreeListReportLink(Source).DrawMode;
    ExpandLevel := TCustomdxTreeListReportLink(Source).ExpandLevel;
    ExtendedSelect := TCustomdxTreeListReportLink(Source).ExtendedSelect;
    FixedTransparent := TCustomdxTreeListReportLink(Source).FixedTransparent;
    OnlySelected := TCustomdxTreeListReportLink(Source).OnlySelected;
    Options := TCustomdxTreeListReportLink(Source).Options;
    PreviewLineCount := TCustomdxTreeListReportLink(Source).PreviewLineCount;
    SupportedCustomDraw := TCustomdxTreeListReportLink(Source).SupportedCustomDraw;

    BandColor := TCustomdxTreeListReportLink(Source).BandColor;
    EvenColor := TCustomdxTreeListReportLink(Source).EvenColor;
    GroupNodeColor := TCustomdxTreeListReportLink(Source).GroupNodeColor;
    GridLineColor := TCustomdxTreeListReportLink(Source).GridLineColor;
    HeaderColor := TCustomdxTreeListReportLink(Source).HeaderColor;
    PreviewColor := TCustomdxTreeListReportLink(Source).PreviewColor;
    RowFooterColor := TCustomdxTreeListReportLink(Source).RowFooterColor;

    BandFont := TCustomdxTreeListReportLink(Source).BandFont;
    EvenFont := TCustomdxTreeListReportLink(Source).EvenFont;
    HeaderFont := TCustomdxTreeListReportLink(Source).HeaderFont;
    OddFont := TCustomdxTreeListReportLink(Source).OddFont;
    PreviewFont := TCustomdxTreeListReportLink(Source).PreviewFont;
    FooterFont := TCustomdxTreeListReportLink(Source).FooterFont;
    GroupNodeFont := TCustomdxTreeListReportLink(Source).GroupNodeFont;
    RowFooterFont := TCustomdxTreeListReportLink(Source).RowFooterFont;
  end;
end;

function TCustomdxTreeListReportLink.IsDBTreeListLink: Boolean;
begin
  Result := False;
end;

function TCustomdxTreeListReportLink.IsDBGridLink: Boolean;
begin
  Result := False;
end;

function TCustomdxTreeListReportLink.IsTreeListLink: Boolean;
begin
  Result := True;
end;

function TCustomdxTreeListReportLink.GetCustomTreeList: TCustomdxTreeListControl;
begin
  Result := TCustomdxTreeListControl(Component);
end;

function TCustomdxTreeListReportLink.GetCellCustomDrawInfo(AItem: TdxReportVisualItem;  
  ANode: PdxTreeListNode; AColumn: PdxTreeListColumn; ABand: PdxTreeListBand; 
  AFooterIndex: PInteger): TdxTreeListLinkCellType;
begin
  Result := tlctUnknown;
  with AItem do 
  begin
    try
      if (Data <> 0) and (TObject(Data) is TClass) then 
        if (TObject(Data) is TdxTreeListBand) then 
          Result := tlstBand
        else 
          if (TObject(Data) is TdxTreeListColumn) then 
          begin
            if Assigned(Parent) then 
              if (Parent.Data = 0) then
                Result := tlstFooter
              else 
                if (TClass(Parent.Data) = TdxTreeListColumn) then 
                  Result := tlstHeader
                else 
                  if (TObject(Parent.Data) is TdxTreeListNode) then 
                    if Assigned(Parent.Parent) and (Parent.Parent.Data <> 0) then
                      Result := tlstGroupFooter
                    else  
                      Result := tlstCell
          end
          else 
            if (TObject(Data) is TdxTreeListNode) then 
              Result := tlstPreview;
    except
      // eat exception if any Node or Column already deleted
    end;  
      
    if Result <> tlctUnknown then 
    begin
      if (ABand <> nil) and (Result = tlstBand) then 
        ABand^ := TdxTreeListBand(Data);
      if (AColumn <> nil) and (Result in [tlstCell, tlstFooter, tlstHeader, tlstGroupFooter]) then 
        AColumn^ := TdxTreeListColumn(Data);
      if (ANode <> nil) and (Result in [tlstCell, tlstHeader, tlstPreview, tlstGroupFooter]) then
        ANode^ := TdxTreeListNode(Parent.Data);
      if (AFooterIndex <> nil) and (Result = tlstGroupFooter) then
        AFooterIndex^ := Parent.Parent.Data - 1;
    end;    
  end;    
end;

procedure TCustomdxTreeListReportLink.CustomDrawFontChanged(Sender: TObject);
begin
  FCustomDrawFontChanged := True;
end;

procedure TCustomdxTreeListReportLink.CustomDraw(AItem: TAbstractdxReportCellData;
  ACanvas: TCanvas; ABoundsRect, AClientRect: TRect; var ADone: Boolean);
var
  ABand: TdxTreeListBand;
  AColumn: TdxTreeListColumn;
  ANode: TdxTreeListNode;
  AFooterIndex: Integer;
  AColor: TColor;
  ASorted: TdxCellSortOrder;
  AText: string;
  ATextAlignX: TdxTextAlignX;
  ATextAlignY: TdxTextAlignY;
  AType: TdxTreeListLinkCellType;
begin
  if (AItem.Data = 0) then Exit;
  AType := GetCellCustomDrawInfo(AItem, @ANode, @AColumn, @ABand, @AFooterIndex);
  if (AType = tlctUnknown) then Exit;
  with TdxReportCellString(AItem) do
  begin
    ParentColor := False;
    AColor := ColorToRGB(Color);
    if Transparent then AColor := clNone;
    FSaveFont.Assign(Font);
    FCustomDrawFontChanged := False;
    AText := Text;
    if AType = tlstHeader then ASorted := SortOrder;
    if AType <> tlstPreview then 
    begin
      ATextAlignX := TextAlignX;
      ATextAlignY := TextAlignY;
    end;  
    case AType of 
      tlstBand:
        DoCustomDrawBandCell(ACanvas, ABoundsRect, AClientRect, ABand, AText,
          AColor, FSaveFont, ATextAlignX, ATextAlignY, ADone);
      tlstCell:
        DoCustomDrawCell(ACanvas, ABoundsRect, AClientRect, ANode, AColumn, AText,
          AColor, FSaveFont, ATextAlignX, ATextAlignY, ADone);
      tlstFooter:
        DoCustomDrawFooterCell(ACanvas, ABoundsRect, AClientRect, ANode, AColumn,
          AText, AColor, FSaveFont, ATextAlignX, ATextAlignY, ADone);
      tlstGroupFooter:
        DoCustomDrawRowFooterCell(ACanvas, ABoundsRect, AClientRect, ANode, AColumn, 
          AFooterIndex, AText, AColor, FSaveFont, ATextAlignX, ATextAlignY, ADone);
      tlstHeader:
        DoCustomDrawHeaderCell(ACanvas, ABoundsRect, AClientRect, AColumn, AText,
          AColor, FSaveFont, ATextAlignX, ATextAlignY, ASorted, ADone);
      tlstPreview:                                          
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
      if AType = tlstHeader then SortOrder := ASorted;
      if AType <> tlstPreview then 
      begin
        TextAlignX := ATextAlignX;
        TextAlignY := ATextAlignY;
      end;  
    end;
  end;
end;

procedure TCustomdxTreeListReportLink.SetSupportCustomDraw(Value: Boolean);
begin
  if FSupportedCustomDraw <> Value then
  begin
    FSupportedCustomDraw := Value;
    LinkModified(True);
  end;
end;

function TCustomdxTreeListReportLink.IsSupportedCustomDraw(Item: TAbstractdxReportCellData): Boolean;
begin
  Result := SupportedCustomDraw;
  if Result and (Item <> nil) and (Item.Data <> 0) then
    case GetCellCustomDrawInfo(Item, nil, nil, nil, nil) of
      tlstBand:
        Result := Assigned(FOnCustomDrawBandCell);
      tlstCell:
        Result := Assigned(FOnCustomDrawCell);
      tlstFooter:
        Result := Assigned(FOnCustomDrawFooterCell);
      tlstGroupFooter: 
        Result := Assigned(FOnCustomDrawRowFooterCell);
      tlstHeader:
        Result := Assigned(FOnCustomDrawHeaderCell);
      tlstPreview: 
        Result := Assigned(FOnCustomDrawPreviewCell);
    end;    
end;

function TCustomdxTreeListReportLink.TransparentColumnGraphics: Boolean;
begin
  Result := (tlpoTransparentColumnGraphic in Options);
end;

function TCustomdxTreeListReportLink.IsDrawFootersOnEveryPage: Boolean;
begin
  Result := FootersOnEveryPage and ShowFooters and (CustomTreeList.Count > 0);
end;

function TCustomdxTreeListReportLink.IsDrawHeadersOnEveryPage: Boolean;
begin
  Result := BandsOnEveryPage and 
    (ShowBands or (HeadersOnEveryPage and ShowHeaders)) and (CustomTreeList.Count > 0);
end;

function TCustomdxTreeListReportLink.IsGraphicColumn(AColumn: TdxTreeListColumn): Boolean;
begin
  Result := AColumn is TdxTreeListGraphicColumn;
end;

function TCustomdxTreeListReportLink.IsHyperLinkColumn(AColumn: TdxTreeListColumn): Boolean;
begin
  Result := AColumn is TdxTreeListHyperLinkColumn;
end;

function TCustomdxTreeListReportLink.IsHyperLinkColumnsExists: Boolean;    
var
  I, AbsoluteIndex: Integer;
begin
  with FAbsoluteIndexes do
    for I := 0 to Count - 1 do 
    begin
      AbsoluteIndex := Integer(List^[I]);
      if IsHyperLinkColumn(CustomTreeList.Columns[AbsoluteIndex]) then
      begin
        Result := True;
        Exit;
      end;  
    end;   
  Result := False;   
end;

function TCustomdxTreeListReportLink.GetExpandLevel: Integer;
begin
  if IsDBGridLink or IsDBTreeListLink then
    Result := -1
  else
    Result := FExpandLevel;
end;

procedure TCustomdxTreeListReportLink.InternalRestoreFromOriginal;
  procedure XorOption(var AOptions: TdxTreeListPaintOptions; AItem: TdxTreeListPaintOption; AValue: Boolean);
  begin
    if AValue then
      Include(AOptions, AItem)
    else
      Exclude(AOptions, AItem);
  end;

begin
  inherited InternalRestoreFromOriginal;

  with ExposeTreeList(CustomTreeList) do 
  begin
    PreviewLineCount := PreviewLines;
    if aoAutoCalcPreviewLines in OptionsEx then 
      PreviewLineCount := -1;

    Self.BandFont := BandFont;
    Self.Font := Font;
    Self.HeaderFont := HeaderFont;
    Self.PreviewFont := PreviewFont;
    Self.GroupNodeFont := Font;
    Self.GroupNodeFont.Color := GroupNodeTextColor;
    Self.FooterFont := Font;
    Self.RowFooterFont := FooterFont;

    FBandColor := BandColor;
    FGroupNodeColor := GroupNodeColor;
    FGridLineColor := GetGridColor(Color);
    FHeaderColor := HeaderColor;
    FRowFooterColor := RowFooterColor;
    
    XorOption(FOptions, tlpoBands, ShowBands);
    XorOption(FOptions, tlpoHeaders, ShowHeader);
    XorOption(FOptions, tlpoFooters, ShowFooter);  
    XorOption(FOptions, tlpoRowFooters, ShowRowFooter);    
    XorOption(FOptions, tlpoGrid, ShowGrid);
    XorOption(FOptions, tlpoPreviewGrid, ShowPreviewGrid);
    XorOption(FOptions, tlpoPreview, aoPreview in CustomTreeList.Options);  
    XorOption(FOptions, tlpoImages, Images <> nil);    
    XorOption(FOptions, tlpoStateImages, StateImages <> nil);        
    XorOption(FOptions, tlpo3DEffects, LookAndFeel in [lfStandard, lfFlat]);            
    XorOption(FOptions, tlpoSoft3D, LookAndFeel = lfFlat);
  end;  
end;

procedure TCustomdxTreeListReportLink.InternalRestoreDefaults;
begin
  inherited InternalRestoreDefaults;
  FAutoNodesExpand := False;
  BandsOnEveryPage := True;
  DrawMode := tldmStrict;
  FixedTransparent := False;
  FOnlySelected := False;
  FGraphicAsTextValue := sdxGraphicAsTextValue;
  HeadersOnEveryPage := True;
  Options := dxDefaultTreeListPaintOptions;
  FPreviewLineCount := -1;
  FSupportedCustomDraw := False;

  FBandColor := dxDefaultFixedColor;
  FEvenColor := Color;
  FGridLineColor := dxDefaultGridLineColor;
  FGroupNodeColor := dxDefaultFixedColor;
  FHeaderColor := dxDefaultFixedColor;
  FRowFooterColor := dxDefaultFixedColor;
  FPreviewColor := Color;

  BandFont := Font;
  EvenFont := Font;
  FooterFont := Font;  
  GroupNodeFont := Font;
  HeaderFont := Font;
  OddFont := Font;  
  PreviewFont := Font;
  RowFooterFont := FooterFont;

  FExpandLevel := -1;
  FExtendedSelect := True;
end;

function TCustomdxTreeListReportLink.AutoCalcPreviewLines: Boolean;
begin
  Result := PreviewLineCount = -1;
end;

function TCustomdxTreeListReportLink.CheckMarksAsText: Boolean;
begin
  Result := tlpoCheckMarksAsText in Options;
end;

function TCustomdxTreeListReportLink.FlatCheckMarks: Boolean;
begin
  Result := tlpoFlatCheckMarks in Options;
end;

function TCustomdxTreeListReportLink.ShowBands: Boolean;
begin
  Result := tlpoBands in Options;
end;

function TCustomdxTreeListReportLink.GraphicsAsText: Boolean;
begin
  Result := (tlpoGraphicAsText in Options);
end;

function TCustomdxTreeListReportLink.ShowGrid: Boolean;
begin
  Result := ((DrawMode < tldmBorrowSource) and (tlpoGrid in Options)) or 
    ((DrawMode = tldmBorrowSource) and 
    ((CustomTreeList = nil) or ExposeTreeList(CustomTreeList).ShowGrid));
end;

function TCustomdxTreeListReportLink.ShowHeaders: Boolean;
begin
  Result := tlpoHeaders in Options;
end;

function TCustomdxTreeListReportLink.ShowFooters: Boolean;
begin
  Result := tlpoFooters in Options;
end;

function TCustomdxTreeListReportLink.ShowPreview: Boolean;
begin
  Result := tlpoPreview in Options;
end;

function TCustomdxTreeListReportLink.ShowPreviewGrid: Boolean;
begin
  Result := ((DrawMode < tldmBorrowSource) and (tlpoPreviewGrid in Options)) or 
    ((DrawMode = tldmBorrowSource) and 
     ((CustomTreeList = nil) or ExposeTreeList(CustomTreeList).ShowPreviewGrid));
end;

function TCustomdxTreeListReportLink.ShowRowFooterGrid: Boolean;
begin
  Result := tlpoRowFooterGrid in Options;
end;

function TCustomdxTreeListReportLink.IsExtendedSelect: Boolean;
begin
  Result := IsExistSelectedNodes and ExtendedSelect;
end;

function TCustomdxTreeListReportLink.IsExistSelectedNodes: Boolean;
begin
  Result := OnlySelected and (ExposeTreeList(CustomTreeList).SelectedCount > 0);
end;

function TCustomdxTreeListReportLink.ShowRowFooters: Boolean;
begin
  Result := tlpoRowFooters in Options;
end;

function TCustomdxTreeListReportLink.ShowImages: Boolean;
begin
  Result := tlpoImages in Options;
end;

function TCustomdxTreeListReportLink.ShowStateImages: Boolean;
begin
  Result := tlpoStateImages in Options;
end;

function TCustomdxTreeListReportLink.CanDrawImages(ANode: TdxTreeListNode): Boolean;
begin
  with ExposeTreeList(CustomTreeList) do
    Result := ShowImages and Assigned(Images) and
      (ANode.ImageIndex > -1) and (ANode.ImageIndex < Images.Count);
end;

function TCustomdxTreeListReportLink.CanDrawStateImages(ANode: TdxTreeListNode): Boolean;
begin
  with ExposeTreeList(CustomTreeList) do 
    Result := ShowStateImages and Assigned(StateImages) and
      (ANode.StateIndex > -1) and (ANode.StateIndex < StateImages.Count);
end;

function TCustomdxTreeListReportLink.OddEvenMode: Boolean;
begin
  Result := DrawMode = tldmOddEven;
end;

function TCustomdxTreeListReportLink.Use3DEffects: Boolean;
begin
  Result := tlpo3DEffects in Options;
end;

function TCustomdxTreeListReportLink.UseSoft3D: Boolean;
begin
  Result := tlpoSoft3D in Options;
end;

procedure TCustomdxTreeListReportLink.SetExtendedSelect(Value: Boolean);
begin
  if FExtendedSelect <> Value then
  begin
    FExtendedSelect := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxTreeListReportLink.SetOnlySelected(Value: Boolean);
begin
  if FOnlySelected <> Value then
  begin
    FOnlySelected := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxTreeListReportLink.SetAutoNodesExpand(Value: Boolean);
begin
  if FAutoNodesExpand <> Value then
  begin
    FAutoNodesExpand := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxTreeListReportLink.SetDrawMode(Value: TdxTreeListDrawMode);
begin
  if FDrawMode <> Value then
  begin
    FDrawMode := Value;
    LinkModified(True);
  end;
end;

function TCustomdxTreeListReportLink.GetOptions: TdxTreeListPaintOptions;
begin
  Result := FOptions;
end;

procedure TCustomdxTreeListReportLink.SetOptions(Value: TdxTreeListPaintOptions);
begin
  if FOptions <> Value then
  begin
    FOptions := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxTreeListReportLink.SetBandsOnEveryPage(Value: Boolean);
begin
  if FBandsOnEveryPage <> Value then
  begin
    FBandsOnEveryPage := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxTreeListReportLink.SetBandFont(Value: TFont);
begin
  FBandFont.Assign(Value);
end;

procedure TCustomdxTreeListReportLink.SetOddFont(Value: TFont);
begin
  FOddFont.Assign(Value);
end;

procedure TCustomdxTreeListReportLink.SetEvenFont(Value: TFont);
begin
  FEvenFont.Assign(Value);
end;

procedure TCustomdxTreeListReportLink.SetHeaderFont(Value: TFont);
begin
  FHeaderFont.Assign(Value);
end;

procedure TCustomdxTreeListReportLink.SetGroupNodeFont(Value: TFont);
begin
  FGroupNodeFont.Assign(Value);
end;

procedure TCustomdxTreeListReportLink.SetPreviewFont(Value: TFont);
begin
  FPreviewFont.Assign(Value);
end;

procedure TCustomdxTreeListReportLink.SetFooterFont(Value: TFont);
begin
  FFooterFont.Assign(Value);
end;

procedure TCustomdxTreeListReportLink.SetRowFooterFont(Value: TFont);
begin
  FRowFooterFont.Assign(Value);
end;

procedure TCustomdxTreeListReportLink.SetBandColor(Value: TColor);
begin
  if FBandColor <> Value then
  begin
    FBandColor := Value;
    if tlpoBands in Options then 
      LinkModified(True);
  end;
end;

procedure TCustomdxTreeListReportLink.SetEvenColor(Value: TColor);
begin
  if FEvenColor <> Value then
  begin
    FEvenColor := Value;
    if OddEvenMode then 
      LinkModified(True);
  end;
end;

function TCustomdxTreeListReportLink.GetOddColor: TColor;
begin
  Result := Color;
end;

procedure TCustomdxTreeListReportLink.SetOddColor(Value: TColor);
begin
  inherited Color := Value;
end;

procedure TCustomdxTreeListReportLink.SetGroupNodeColor(Value: TColor);
begin
  if FGroupNodeColor <> Value then
  begin
    FGroupNodeColor := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxTreeListReportLink.SetGridLineColor(Value: TColor);
begin
  if FGridLineColor <> Value then
  begin
    FGridLineColor := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxTreeListReportLink.SetHeaderColor(Value: TColor);
begin
  if FHeaderColor <> Value then
  begin
    FHeaderColor := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxTreeListReportLink.SetPreviewColor(Value: TColor);
begin
  if FPreviewColor <> Value then
  begin
    FPreviewColor := Value;
    if tlpoPreview in Options then 
      LinkModified(True);
  end;
end;

procedure TCustomdxTreeListReportLink.SetRowFooterColor(Value: TColor);
begin
  if FRowFooterColor <> Value then
  begin
    FRowFooterColor := Value;
    if tlpoRowFooters in Options then 
      LinkModified(True);
  end;
end;

procedure TCustomdxTreeListReportLink.SetHorzDelimitByBands(Value: Boolean);
begin
  if FHorzDelimitByBands <> Value then
  begin
    FHorzDelimitByBands := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxTreeListReportLink.SetFixedTransparent(Value: Boolean);
begin
  if FFixedTransparent <> Value then
  begin
    FFixedTransparent := Value;
    LinkModified(True);
  end;
end;

procedure TCustomdxTreeListReportLink.SetExpandLevel(Value: Integer);
begin
  if Value < -1 then 
    Value := -1;
  if FExpandLevel <> Value then
  begin
    FExpandLevel := Value;
    if AutoNodesExpand then 
      LinkModified(True);
  end;
end;

function TCustomdxTreeListReportLink.GetExtendedColorManage: Boolean;
begin
  Result := DrawMode = tldmBorrowSource;
end;

procedure TCustomdxTreeListReportLink.SetExtendedColorManage(Value: Boolean);
begin
  DrawMode := tldmBorrowSource;
end;

function TCustomdxTreeListReportLink.GetUseColumnFont: Boolean;
begin
  Result := DrawMode = tldmBorrowSource;
end;

procedure TCustomdxTreeListReportLink.SetUseColumnFont(Value: Boolean);
begin
  DrawMode := tldmBorrowSource;
end;

procedure TCustomdxTreeListReportLink.SetPreviewLineCount(Value: Integer);
begin
  if Value < -1 then 
    Value := -1;
  if FPreviewLineCount <> Value then
  begin
    FPreviewLineCount := Value;
    if tlpoPreview in Options then 
      LinkModified(True);
  end;
end;

procedure TCustomdxTreeListReportLink.SetOnCustomDrawBandCell
  (Value: TdxTLReportLinkCustomDrawBandCellEvent);
begin
  if @FOnCustomDrawBandCell <> @Value then
  begin
    FOnCustomDrawBandCell := Value;
    if IsSupportedCustomDraw(nil) then 
      LinkModified(True);    
  end;
end;

procedure TCustomdxTreeListReportLink.SetOnCustomDrawCell
  (Value: TdxTLReportLinkCustomDrawCellEvent);
begin
  if @FOnCustomDrawCell <> @Value then
  begin
    FOnCustomDrawCell := Value;
    if IsSupportedCustomDraw(nil) then 
      LinkModified(True);    
  end;
end;

procedure TCustomdxTreeListReportLink.SetOnCustomDrawFooterCell
  (Value: TdxTLReportLinkCustomDrawFooterCellEvent);
begin
  if @FOnCustomDrawFooterCell <> @Value then
  begin
    FOnCustomDrawFooterCell := Value;
    if IsSupportedCustomDraw(nil) then 
      LinkModified(True);
  end;
end;

procedure TCustomdxTreeListReportLink.SetOnCustomDrawHeaderCell
  (Value: TdxTLReportLinkCustomDrawHeaderCellEvent);
begin
  if @FOnCustomDrawHeaderCell <> @Value then
  begin
    FOnCustomDrawHeaderCell := Value;
    if IsSupportedCustomDraw(nil) then 
      LinkModified(True);
  end;
end;

procedure TCustomdxTreeListReportLink.SetOnCustomDrawPreviewCell
  (Value: TdxTLReportLinkCustomDrawPreviewCellEvent);
begin
  if @FOnCustomDrawPreviewCell <> @Value then
  begin
    FOnCustomDrawPreviewCell := Value;
    if IsSupportedCustomDraw(nil) then  
      LinkModified(True);    
  end;
end;

procedure TCustomdxTreeListReportLink.SetOnCustomDrawRowFooterCell
  (Value: TdxTLReportLinkCustomDrawRowFooterCellEvent);
begin
  if @FOnCustomDrawRowFooterCell <> @Value then
  begin
    FOnCustomDrawRowFooterCell := Value;
    if IsSupportedCustomDraw(nil) then 
      LinkModified(True);    
  end;
end;

function TCustomdxTreeListReportLink.GetGroupColumnIndex(
  ANode: TdxTreeListNode): Integer;
begin
  Result := 0;
end;

function TCustomdxTreeListReportLink.GetDataClass(AColumn: TdxTreeListColumn; 
  ANode: TdxTreeListNode): TdxReportCellDataClass;
begin
  Result := nil;
end;

function TCustomdxTreeListReportLink.IsGraphicAsTextValueStored: Boolean;
begin
  Result := AnsiCompareText(GraphicAsTextValue, sdxGraphicAsTextValue) <> 0;
end;

procedure TCustomdxTreeListReportLink.SetGraphicAsTextValue(const Value: string);
begin
  if AnsiCompareStr(FGraphicAsTextValue, Value) <> 0 then
  begin
    FGraphicAsTextValue := Value;
    if tlpoGraphicAsText in Options then 
      LinkModified(True);
  end;
end;

{$IFDEF EXPRESSQUANTUMGRID3}  
function TCustomdxTreeListReportLink.GetReferenceColumn(AColumn: TdxTreeListColumn; 
  ANode: TdxTreeListNode): TdxTreeListColumn;
begin         
  if AColumn is TdxTreeListWrapperColumn then 
  begin
    Result := TdxTreeListWrapperColumnAccess(AColumn).ReferenceColumn(ANode);
    if Result = nil then 
      Result := AColumn;
  end
  else
    Result := AColumn;
end;
{$ENDIF}    

procedure TCustomdxTreeListReportLink.PrepareConstruct(AReportCells: TdxReportCells);
var
  DC: hDC;
  PrevFont: hDC;
  Size: TSize;
begin
  FPaintStyle := ExposeTreeList(CustomTreeList).PaintStyle;
  DC := GetDC(0);

  PrevFont := SelectObject(DC, Font.Handle);

  GetTextExtentPoint32(DC, 'Wg', Length('Wg'), Size);
  FRowHeight := Size.cY + 6;
  if FRowHeight < CustomTreeList.RowHeight then
    FRowHeight := CustomTreeList.RowHeight;

  SelectObject(DC, HeaderFont.Handle);
  GetTextExtentPoint32(DC, 'Wg', Length('Wg'), Size);
  FHeaderRowHeight := Size.cY + 6;
  if FHeaderRowHeight < CustomTreeList.HeaderRowHeight then
    FHeaderRowHeight := CustomTreeList.HeaderRowHeight;

  SelectObject(DC, FooterFont.Handle);
  GetTextExtentPoint32(DC, 'Wg', Length('Wg'), Size);
  FFooterRowHeight := Size.cY + 6 + 2 * Byte(ShowRowFooterGrid);
  if FFooterRowHeight < CustomTreeList.FooterRowHeight then
    FFooterRowHeight := CustomTreeList.FooterRowHeight;
  FFooterPanelHeight := FFooterRowHeight * 
    ExposeTreeList(CustomTreeList).GetHeaderMaxRowCount + Byte(Use3DEffects);

  SelectObject(DC, GroupNodeFont.Handle);
  GetTextExtentPoint32(DC, 'Wg', Length('Wg'), Size);
  FGroupRowHeight := Size.cY + 6;
  if (FGroupRowHeight < CustomTreeList.RowHeight) then
    FGroupRowHeight := CustomTreeList.RowHeight;

  SelectObject(DC, RowFooterFont.Handle);
  GetTextExtentPoint32(DC, 'Wg', Length('Wg'), Size);
  FNodeFooterRowHeight := Size.cY + 6;
  if FNodeFooterRowHeight < CustomTreeList.FooterRowHeight then
    FNodeFooterRowHeight := CustomTreeList.FooterRowHeight;

  SelectObject(DC, BandFont.Handle);
  GetTextExtentPoint32(DC, 'Wg', Length('Wg'), Size);
  FBandHeight := Size.cY + 10;
  if FBandHeight < CustomTreeList.BandPanelHeight then
    FBandHeight := CustomTreeList.BandPanelHeight;

  SelectObject(DC, PreviewFont.Handle);
  GetTextExtentPoint32(DC, 'Wg', Length('Wg'), Size);
  FPreviewLineHeight := Size.cY + 2;
  if FPreviewLineHeight < CustomTreeList.DescTextHeight then
    FPreviewLineHeight := CustomTreeList.DescTextHeight;

  SelectObject(DC, PrevFont);
  ReleaseDC(0, DC);

  FIndent := ExposeTreeList(CustomTreeList).Indent;
  FFullWidth := GetTreeListWidth;

  FAbsoluteIndexes := TList.Create;
  CalcAbsoluteIndexes;
  CalcColumnInfos(AReportCells);
  CalcFontIndexes(AReportCells);
  AddNodes;
end;

procedure TCustomdxTreeListReportLink.UnprepareConstruct(AReportCells: TdxReportCells);
begin
  FreeHeaderInfos;
  FAbsoluteIndexes.Free;
  FAbsoluteIndexes := nil;
end;

function TCustomdxTreeListReportLink.GetBandRegionHeight: Integer;
begin
  Result := Byte(ShowBands) * Self.FBandHeight
end;

function TCustomdxTreeListReportLink.GetBandRect(AVisibleIndex: Integer): TRect;
begin
  with Result do
  begin
    Left := GetBandLeft(AVisibleIndex);
    Top := 0;
    Right := Left + GetBandWidth(AVisibleIndex);
    Bottom := Top + GetBandRegionHeight;
    Inc(Left, Byte(Use3DEffects));
    Inc(Top, Byte(Use3DEffects));
  end;
end;

function TCustomdxTreeListReportLink.GetTreeListWidth: Integer;
begin
  Result := GetBandRect(ExposeTreeList(CustomTreeList).GetBandCount - 1).Right;
end;

procedure TCustomdxTreeListReportLink.ConstructReport(AReportCells: TdxReportCells);
var
  ATreeList: TdxTreeListAccess;
  
  function GetHeaderRegionHeight: Integer;
  begin
    Result := Byte(ShowHeaders) * ATreeList.GetHeaderMaxRowCount * FHeaderRowHeight;
  end;

  function IsNodeImagesExists(ANode: TdxTreeListNode): Boolean;
  begin
    Result := CanDrawImages(ANode) or CanDrawStateImages(ANode);
  end;

  function GetColumnFont(AIndex: Integer): TFont;
  begin
    Result := ATreeList.GetColumnFont(AIndex);
  end;

  function GetTextIndent(ANode: TdxTreeListNode): Integer;
  begin
    Result := ANode.Level * (FIndent + 1);
    if (FPaintStyle = psOutLook) and (ANode.Count > 0) then 
      Inc(Result, FIndent);
    if CanDrawStateImages(ANode) then Inc(Result, ATreeList.StateImages.Width);
    if CanDrawImages(ANode) then Inc(Result, ATreeList.Images.Width);
  end;

  function GetDataItemSides(ANode: TdxTreeListNode; AAbsoluteIndex: Integer): TdxCellSides;
  var
    RowIndex: Integer;
    IsFirstColumn, IsLastColumn: Boolean;
  begin
    Result := [];
    GetColumnInfos(AAbsoluteIndex, nil, @RowIndex, nil, nil, nil, @IsFirstColumn, @IsLastColumn);
    if ShowGrid then
    begin
      if (RowIndex = 0) or (ShowPreviewGrid) then {!}//} or (ANode = FNodes.List^[0])) then
        Include(Result, csTop);
      if ShowPreviewGrid then
        Include(Result, csBottom);
      if ShowPreviewGrid or IsLastColumn then
        Include(Result, csRight);
      if IsFirstColumn then
      begin
        if ExposeTreeList(CustomTreeList).IsRowGroup(ANode) or not IsNodeImagesExists(ANode) then 
          Include(Result, csLeft)
      end  
      else 
        if ShowPreviewGrid then Include(Result, csLeft)
    end
    else 
    begin
      if (ANode = FNodes.List^[0]) and (RowIndex = 0) then
        Include(Result, csTop);
      if IsLastColumn then
        Include(Result, csRight);      
    end;    
  end;

const
  dxCalcFormat: UINT = 
    {DT_EDITCONTROL or }DT_LEFT or DT_WORDBREAK or DT_CALCRECT or DT_EXPANDTABS or DT_NOPREFIX;

  function CalcRowAutoHeight(DC: hDC; ANode: TdxTreeListNode; APreviewHeight: Integer): Integer;
  var
    PrevFont: HFONT;
    I, AbsoluteIndex, V: Integer;
    Column, ReferenceColumn: TdxTreeListColumn;    
    R: TRect;
    S: string;
  begin
    Result := 0;
    PrevFont := SelectObject(DC, Font.Handle);
    for I := 0 to FAbsoluteIndexes.Count - 1 do
    begin
      AbsoluteIndex := Integer(FAbsoluteIndexes.List[I]);
      Column := ATreeList.Columns[AbsoluteIndex];
    {$IFDEF EXPRESSQUANTUMGRID3}
      ReferenceColumn := GetReferenceColumn(Column, ANode);
    {$ELSE}      
      ReferenceColumn := Column;
    {$ENDIF}
      if IsGraphicColumn(ReferenceColumn) then 
        V := ATreeList.GetRowHeight(ANode, FRowHeight, True) - APreviewHeight
      else
      begin  
        if UseColumnFont and ATreeList.IsExistColumnFont(AbsoluteIndex) then
          SelectObject(DC, ATreeList.GetColumnFont(AbsoluteIndex).Handle);
        S := ATreeList.GetDisplayValue(ANode, AbsoluteIndex);
        if S <> '' then
        begin
          R := Rect(0, 0, -2 * dxTextSpace + ATreeList.GetHeaderBoundsWidth(AbsoluteIndex), 0);
          if R.Right < R.Left then 
            R.Right := R.Left;
          V := Windows.DrawText(DC, PChar(S), Length(S), R, dxCalcFormat);
        end
        else
          V := FRowHeight;
      end;    
      if V > Result then 
        Result := V;
    end;
    SelectObject(DC, PrevFont);
    Inc(Result, 2 * dxTextSpace);
  end;

  function CalcPreviewHeight(DC: hDC; const S: string; AWidth: Integer): Integer;
  var
    PrevFont: HFONT;
    R: TRect;
  begin
    R := Rect(0, 0, -2 * dxTextSpace + AWidth, 0);
    if R.Right < R.Left then 
      R.Right := R.Left;
    PrevFont := SelectObject(DC, PreviewFont.Handle);
    Result := 2 * dxTextSpace + Windows.DrawText(DC, PChar(S), Length(S), R, dxCalcFormat);
    SelectObject(DC, PrevFont);
  end;

  function GetPreviewHeight(DC: hDC; ANode: TdxTreeListNode; AWidth: Integer): Integer;
  var
    S: string;
  begin
    if AutoCalcPreviewLines then
    begin
      S := ATreeList.GetPreviewText(ANode);
      if S <> '' then
        Result := CalcPreviewHeight(DC, S, AWidth - ATreeList.IndentDesc)
      else
        Result := 0;
    end
    else
      Result := PreviewLineCount * FPreviewLineHeight;
  end;

  function GetNodeHeight(ANode: TdxTreeListNode; AWidth: Integer; 
    APreviewHeight: PInteger): Integer;
  var
    NeedAllocateDC: Boolean;
    DC: HDC;
    V: Integer;
  begin
    with ExposeTreeList(CustomTreeList) do
      if IsRowGroup(ANode) then
        if FRowHeight < FGroupRowHeight then
          Result := FGroupRowHeight
        else
          Result := FRowHeight
      else
      begin
        NeedAllocateDC := 
          ((aoPreview in CustomTreeList.Options) and AutoCalcPreviewLines) or
          (IsRowAutoHeight and (GetHeaderMaxRowCount = 1));
        DC := 0;
        if NeedAllocateDC then DC := GetDC(0);
        try
          if (aoPreview in CustomTreeList.Options) then 
            V := GetPreviewHeight(DC, ANode, AWidth)
          else
            V := 0;  
          
          if IsRowAutoHeight and (GetHeaderMaxRowCount = 1) then
            Result := CalcRowAutoHeight(DC, ANode, V)
          else
            Result := GetHeaderMaxRowCount * FRowHeight;
        finally
          if NeedAllocateDC then ReleaseDC(0, DC);          
        end;  
        
        if (APreviewHeight <> nil) and ShowPreview then
        begin
          APreviewHeight^ := V;
          Inc(Result, V);
        end;
      end
  end;

  function GetCellHeight(ANode: TdxTreeListNode; AAbsoluteIndex: PInteger;
    ACellType: TdxTreeListLinkCellType; AParent: TdxReportCell): Integer;
  var
    BandIndex, RowIndex, ColIndex: Integer;
    UseParentHeight: Boolean;
  begin
    if AParent <> nil then
    begin
      UseParentHeight := ATreeList.IsRowAutoHeight and (ATreeList.GetHeaderMaxRowCount = 1);
      if UseParentHeight and (ACellType = tlstCell) then
        UseParentHeight := UseParentHeight or ATreeList.IsRowGroup(ANode); // and (GetPreviewLineCount(ANode) = 0)
    end
    else
      UseParentHeight := False;
      
    if UseParentHeight then 
      Result := AParent.Height - FPreviewHeight
    else
    begin
      if AAbsoluteIndex <> nil then
      begin
        GetColumnInfos(AAbsoluteIndex^, @BandIndex, @RowIndex, @ColIndex, nil, nil, nil, nil);
        Result := ATreeList.GetHeaderLineCount(ATreeList.GetVisibleBandIndex(BandIndex), RowIndex, ColIndex);
      end
      else
        Result := ATreeList.GetHeaderMaxRowCount;
        
      case ACellType of
        tlstCell: 
          Result := Result * FRowHeight;
        tlstFooter: 
          Result := Result * FFooterRowHeight + 3;
        tlstGroupFooter: 
          Result := Result * FNodeFooterRowHeight + 3;
        tlstHeader: 
          Result := Result * FHeaderRowHeight;
      end;
    end;
  end;

  function GetDataItemRect(ANode: TdxTreeListNode; AAbsoluteIndex: Integer; 
    AParent: TdxReportCell): TRect;
  var 
    IsFirstColumn, IsLastColumn: Boolean;
  begin
    GetCellRect(AAbsoluteIndex, tlstCell, Result);
    if ExposeTreeList(CustomTreeList).IsRowAutoHeight and 
      (ExposeTreeList(CustomTreeList).GetHeaderMaxRowCount = 1) 
    then        
      Result.Bottom := AParent.Height - FPreviewHeight;
    GetColumnInfos(AAbsoluteIndex, nil, nil, nil, nil, nil,  @IsFirstColumn, @IsLastColumn);
    if IsLastColumn then 
      Result.Right := FFullWidth;      
    if IsFirstColumn then 
      Result.Left := GetTextIndent(ANode);
  end;

 { Bands }
  procedure InsertBandItem(AVisibleIndex: Integer; AParent: TdxReportCell);
  var
    DataItem: TAbstractdxReportCellData;
  begin
    DataItem := TdxReportCellString.Create(AParent);
    with TdxReportCellString(DataItem) do
    begin
      FontIndex := FBandFontIndex;
      Text := ATreeList.GetBandText(AVisibleIndex);
      Multiline := True;
      EndEllipsis := False;
      CellSides := csAll;
      Transparent := True;
      TextAlignX := dxTextAlignX[ATreeList.GetBandAlignment(AVisibleIndex)];
      TextAlignY := taTop;
      EdgeMode := TdxCellEdgeMode(Use3DEffects);
      if EdgeMode = cem3DEffects then
      begin
        InnerEdge := cesRaised;
        if not UseSoft3D then OuterEdge := cesRaised;
      end;
      BoundsRect := GetBandRect(AVisibleIndex);
      if IsSupportedCustomDraw(nil) then
        Data := Integer(ATreeList.Bands[AVisibleIndex]);
    end;
  end;

  procedure InsertBands;
  var
    CellParent, Cell: TdxReportCell;
    I: Integer;
  begin
    if BandsOnEveryPage and (CustomTreeList.Count > 0) then
      CellParent := AReportCells.HeaderCells
    else  
      CellParent := AReportCells.Cells;
    Cell := TdxReportCell.Create(CellParent);
    with Cell do
    begin
      CellSides := csAll;
      Transparent := FixedTransparent;
      if not Transparent then Color := BandColor;
      BoundsRect := Rect(0, 0, FFullWidth, GetBandRegionHeight);
    end;
    for I := 0 to ExposeTreeList(CustomTreeList).GetBandCount - 1 do
      InsertBandItem(I, Cell);
  end;

  { Headers }
  function GetHeaderRect(AAbsoluteIndex: Integer; AParent: TdxReportCell): TRect;
  begin
    GetCellRect(AAbsoluteIndex, tlstHeader, Result);  
    Inc(Result.Left, Byte(Use3DEffects));
    Inc(Result.Top, Byte(Use3DEffects));
  end;

  procedure InsertHeaderItem(AAbsoluteIndex: Integer; AParent: TdxReportCell);
  var                         
    IsMultilined: Boolean;
    DataItem: TdxReportCellImage;
  begin
    IsMultilined := True;//ATreeList.Columns[AAbsoluteIndex].HeaderMaxLineCount = 0;
    DataItem := TdxReportCellImage.Create(AParent);
    with DataItem do
    begin
      FontIndex := FHeaderFontIndex;
      Transparent := True;
      CellSides := csAll;
      BoundsRect := GetHeaderRect(AAbsoluteIndex, AParent);
      Text := ATreeList.GetHeaderText(AAbsoluteIndex);
      EndEllipsis := not IsMultilined;
      Multiline := IsMultilined;
      TextAlignX := dxTextAlignX[ATreeList.GetHeaderAlignment(AAbsoluteIndex)];
      TextAlignY := dxMultilineTextAlignY[Multiline];
      SortOrder := dxSortOrder[ATreeList.GetHeaderSorted(AAbsoluteIndex)];
      MakeSpaceForEmptyImage := False;
      EdgeMode := TdxCellEdgeMode(Use3DEffects);
      if EdgeMode = cem3DEffects then
      begin
        InnerEdge := cesRaised;
        if not UseSoft3D then OuterEdge := cesRaised;
      end;
      if ATreeList.IsExistHeaderGlyph(AAbsoluteIndex) then
        Image := ATreeList.GetHeaderGlyph(AAbsoluteIndex);
      if IsSupportedCustomDraw(nil) then
        Data := Integer(ATreeList.Columns[AAbsoluteIndex]);
    end;
  end;

  procedure InsertHeaders;
  var
    CellParent, Cell: TdxReportCell;
    PrevSibl: TdxReportItem;
    I: Integer;
  begin
    if BandsOnEveryPage and HeadersOnEveryPage and (CustomTreeList.Count > 0) then
      CellParent := AReportCells.HeaderCells
    else
      CellParent := AReportCells.Cells;
    Cell := TdxReportCell.Create(CellParent);
    with Cell do
    begin
      CellSides := csAll;
      Transparent := FixedTransparent;
      if not Transparent then Color := HeaderColor;
      BoundsRect := Bounds(GetBandLeft(0), 0, FFullWidth, GetHeaderRegionHeight);
      PrevSibl := GetPrevSibling;
      if PrevSibl <> nil then 
        Top := TdxReportVisualItem(PrevSibl).BoundsRect.Bottom;
      if IsSupportedCustomDraw(nil) then
        Data := Integer(TdxTreeListColumn);
    end;
    for I := 0 to FAbsoluteIndexes.Count - 1 do
      InsertHeaderItem(Integer(FAbsoluteIndexes.List^[I]), Cell);
  end;

  { Footers }
  function GetFooterRect(AAbsoluteIndex: Integer; AParent: TdxReportCell): TRect;
  var 
    IsFirstColumn, IsLastColumn: Boolean;
  begin
    GetCellRect(AAbsoluteIndex, tlstFooter, Result);
    InflateRect(Result, -2, -3);
    with Result do 
    begin
      if not Use3DEffects then Inc(Right);
      if Use3DEffects then Dec(Left);      
      GetColumnInfos(AAbsoluteIndex, nil, nil, nil, nil, nil, @IsFirstColumn, @IsLastColumn);
      if IsLastColumn then Dec(Right, 2);
      if IsFirstColumn then Inc(Left, 2 + Byte(Use3DEffects));
    end;  
  end;

  procedure InsertFooterItem(AAbsoluteIndex: Integer; AParent: TdxReportCell);
  var
    DataItem: TAbstractdxReportCellData;
  begin
    DataItem := TdxReportCellString.Create(AParent);
    with TdxReportCellString(DataItem) do
    begin
      FontIndex := FFooterFontIndex;
      Text := ATreeList.GetFooterCellText(nil, AAbsoluteIndex, -1);
      Transparent := True;
      BoundsRect := GetFooterRect(AAbsoluteIndex, AParent);
      EdgeMode := TdxCellEdgeMode(Use3DEffects);
      if EdgeMode = cem3DEffects then OuterEdge := cesSunken;
      CellSides := csAll;
      TextAlignX := dxTextAlignX[ATreeList.GetFooterCellAlignment(nil, AAbsoluteIndex, -1)];
      TextAlignY := taCenterY;
      if IsSupportedCustomDraw(nil) then
        Data := Integer(ATreeList.Columns[AAbsoluteIndex]);
    end;
  end;

  procedure InsertFooters;
  var
    CellParent, Cell: TdxReportCell;
    R: TRect;
    PrevSibl: TdxReportItem;
    I, AbsoluteIndex: Integer;    
  begin
    if FootersOnEveryPage and (ATreeList.Count > 0) then
      CellParent := AReportCells.FooterCells
    else
      CellParent := AReportCells.Cells;
    Cell := TdxReportCell.Create(CellParent);
    with Cell do
    begin
      CellSides := csAll;
      Transparent := FixedTransparent;
      if not Transparent then Color := HeaderColor;
      EdgeMode := TdxCellEdgeMode(Use3DEffects);
      if EdgeMode = cem3DEffects then
      begin
        InnerEdge := cesRaised;
        if not UseSoft3D then OuterEdge := cesRaised;
      end;
      I := GetCellHeight(nil, nil, tlstFooter, nil);
      BoundsRect := Rect(Byte(Use3DEffects), 0, FFullWidth, I);
      PrevSibl := GetPrevSibling;
      if PrevSibl <> nil then
        Top := TdxReportCell(PrevSibl).BoundsRect.Bottom;
      Top := Top + Byte(Use3DEffects);
    end;
    if Use3DEffects then
      with TdxReportCell.Create(CellParent) do
      begin
        R := Cell.BoundsRect;
        InflateRect(R, 1, 1);
        Dec(R.Bottom);
        BoundsRect := R;
        CellSides := [csLeft, csTop];
        Transparent := True;
      end;
    for I := 0 to FAbsoluteIndexes.Count - 1 do
    begin
      AbsoluteIndex := Integer(FAbsoluteIndexes.List^[I]);
      if ATreeList.IsExistFooterCell(AbsoluteIndex) then
        InsertFooterItem(AbsoluteIndex, Cell);
    end;
  end;

  procedure InsertStub;
  var
    Last: TdxReportCell;
  begin
    Last := AReportCells.Cells.LastCell;
    if Last <> nil then
      with TdxReportCell.Create(AReportCells.Cells) do
      begin
        BoundsRect := Bounds(0, Last.BoundsRect.Bottom, FFullWidth, 1);
        CellSides := [csTop];
        Transparent := True;
      end;
  end;

  { RowFooters }
  function GetRowFooterCount(Node: TdxTreeListNode): Integer;
  var
    ANode: TdxTreeListNode;
  begin
    Result := 0;
    if (Node = nil) or (Node.Count <> 0) or not Node.IsLast then Exit;
//    if (Node <> nil) and (Node.Count = 0) and Node.IsLast then
    ANode := Node.Parent;
    while (Node <> nil) and Node.IsLast do
    begin
      if ExposeTreeList(CustomTreeList).IsLevelFooter(ANode.Level) then 
        Inc(Result);
      Node := ANode;
      ANode := ANode.Parent;
    end
  end;

  function GetRowFooterItemIndent(ANode: TdxTreeListNode): Integer;
  begin
    Result := ANode.Level * (FIndent + 1);
    if CanDrawStateImages(ANode) then
      Inc(Result, ATreeList.StateImages.Width)
    else 
      if CanDrawImages(ANode) then 
        Inc(Result, ATreeList.Images.Width);
  end;

  function GetRowFooterRect(ANode: TdxTreeListNode; AAbsoluteIndex: Integer; 
     AParent: TdxReportCell): TRect;
  var 
    IsFirstColumn, IsLastColumn: Boolean;
  begin
    GetCellRect(AAbsoluteIndex, tlstGroupFooter, Result);
    OffsetRect(Result, -(ANode.Level - Byte(FPaintStyle = psStandard)) * (FIndent + 1), 0);
    GetColumnInfos(AAbsoluteIndex, nil, nil, nil, nil, nil, @IsFirstColumn, @IsLastColumn);
    if IsFirstColumn then 
      Inc(Result.Left, GetRowFooterItemIndent(ANode) + 1);
    InflateRect(Result, -2, -3);
    Inc(Result.Right);
    if IsLastColumn then Dec(Result.Right, 2);
  end;
  
  procedure InsertRowFooterItem(ANode, AFooterNode: TdxTreeListNode; 
    AAbsoluteIndex: Integer; AFooterIndex: Integer; AParent: TdxReportCell);
  var
    DataItem: TAbstractdxReportCellData;
  begin
    DataItem := TdxReportCellString.Create(AParent);
    with TdxReportCellString(DataItem) do
    begin
      FontIndex := FRowFooterFontIndex;
      Text := ATreeList.GetFooterCellText(AFooterNode, AAbsoluteIndex, AFooterIndex);
      Transparent := True;
      CellSides := [];
      if ShowGrid and ShowRowFooterGrid then
        CellSides := csAll;
      BoundsRect := GetRowFooterRect(ANode, AAbsoluteIndex, AParent);
      TextAlignX := dxTextAlignX[ATreeList.GetFooterCellAlignment(AFooterNode, 
         AAbsoluteIndex, AFooterIndex)];
      TextAlignY := taCenterY;
      EdgeMode := TdxCellEdgeMode(Use3DEffects);
      if EdgeMode = cem3DEffects then OuterEdge := cesSunken;
      if IsSupportedCustomDraw(nil) then
        Data := Integer(CustomTreeList.Columns[AAbsoluteIndex]);
    end;
  end;

  procedure InsertRowFooters(ANode, AFooterNode: TdxTreeListNode; 
     AParent: TdxReportCell; AFooterIndex: Integer);
  var
    I, J, AAbsoluteIndex, ALevel, RowFooterHeight: Integer;
    ACell: TdxReportCell;
    APrevSibl: TdxReportItem;
    ADataItem: TAbstractdxReportCellData;
    Node: TdxTreeListNode;
  begin
    ALevel := ANode.Level - 1 - Byte(FPaintStyle = psStandard);
    RowFooterHeight := GetCellHeight(ANode, nil, tlstGroupFooter, nil);
    ACell := TdxReportCell.Create(AParent);
    with ACell do
    begin
      Transparent := True;//(ALevel > -1) or FixedTransparent;
      if not Transparent then Color := RowFooterColor;
      CellSides := [csLeft, csRight];
      if not Transparent and ShowGrid then
        CellSides := CellSides + [csTop, csBottom];
      BoundsRect := Rect(0, 0, FFullWidth, RowFooterHeight);
      APrevSibl := GetPrevSibling;
      if Assigned(APrevSibl) then
        Top := TdxReportCell(APrevSibl).BoundsRect.Bottom;
      if IsSupportedCustomDraw(nil) then
        Data := 1 + AFooterIndex;
    end;

    ADataItem := nil;
    Node := AFooterNode;
    for I := 0 to ALevel do
    begin
      ADataItem := TdxReportCellBox.Create(ACell);
      with ADataItem do
      begin
        BoundsRect := Rect(0, 0, FIndent + 1, RowFooterHeight);
        APrevSibl := GetPrevSibling;
        if Assigned(APrevSibl) then
          Left := TdxReportVisualItem(APrevSibl).BoundsRect.Right;
        CellSides := [];
        if ShowGrid then
        begin
          CellSides := CellSides + [csLeft, csRight];
          if I = ALevel then CellSides := CellSides + [csBottom];
        end  
        else 
          if I = 0 then
            CellSides := CellSides + [csLeft];
        Node := AFooterNode;
        for J := AFooterNode.Level - 1 downto I + Byte(FPaintStyle = psStandard) do
          Node := Node.Parent;
        Transparent := IsLevelTransparent(Node);
        if OddEvenMode and (FPaintStyle = psStandard) then 
          Transparent := FixedTransparent;
        if not Transparent then 
          Color := GetLevelColor(Node, -1);
      end;
    end;
    ACell := TdxReportCell.Create(ACell);
    with ACell do
    begin
      CellSides := [csRight];
      if ShowGrid then
        CellSides := CellSides + [csLeft, csTop, csBottom];
      Transparent := FixedTransparent;
      if not Transparent then 
 {2.0}  if DrawMode = tldmBorrowSource then 
          Color := GetLevelColor(Node, -1)
        else
          Color := RowFooterColor;
      I := 0;
      if Assigned(ADataItem) then 
        I := ADataItem.BoundsRect.Right;
      BoundsRect := Rect(I, 0, FFullWidth, RowFooterHeight);               
      if IsSupportedCustomDraw(nil) then 
        Data := Integer(AFooterNode);
    end;
    
    for I := 0 to FAbsoluteIndexes.Count - 1 do
    begin
      AAbsoluteIndex := Integer(FAbsoluteIndexes.List^[I]);
      if ATreeList.IsExistRowFooterCell(AFooterNode, AAbsoluteIndex, AFooterIndex) then
        InsertRowFooterItem(ANode, AFooterNode, AAbsoluteIndex, AFooterIndex, ACell);
    end;
  end;
  
{Preview}
  function GetPreviewCellSides(ANode: TdxTreeListNode): TdxCellSides;
  begin
    Result := [csRight];
    if ShowGrid then
    begin
      Include(Result, csBottom);
      if (FPaintStyle = psOutlook) and not IsNodeImagesExists(ANode) then
        Include(Result, csLeft);
      if ShowPreviewGrid then
        Include(Result, csTop);
    end;
  end;  

{Nodes}
  function IsLastNodeEx(Node, ANode: TdxTreeListNode): Boolean;
  begin
    repeat
      Result := ANode.IsLast;      
      ANode := ANode.Parent;
    until not Result or (ANode = nil) or (ANode = Node);
  end;
  
  procedure ProcessCells(ANode: TdxTreeListNode; AParent: TdxReportCell; ANodeIndex: Integer);
  var
    I, J, AAbsoluteIndex, ACellHeight, ALevel: Integer;
    ADataClass: TdxReportCellDataClass;
    ADataItem: TAbstractdxReportCellData;
    ACell: TdxReportCell;
    APrevSibl: TdxReportItem;
    Node: TdxTreeListNode;
    Column, ReferenceColumn: TdxTreeListColumn;
  begin
    if not ATreeList.IsRowGroup(ANode) and ShowPreview then
      ACellHeight := GetNodeHeight(ANode, FFullWidth - GetTextIndent(ANode), @FPreviewHeight)
    else
    begin
      ACellHeight := GetNodeHeight(ANode, 0, nil);
      FPreviewHeight := 0;
    end;

    ACell := TdxReportCell.Create(AParent);
    with ACell do
    begin
      BoundsRect := Rect(0, 0, FFullWidth, ACellHeight);
      APrevSibl := GetPrevSibling;
      if Assigned(APrevSibl) then
        Top := TdxReportCell(APrevSibl).BoundsRect.Bottom;
      CellSides := [csLeft, csRight];
      if (ANode = FNodes.List^[0]) then
        CellSides := CellSides + [csTop];
      Transparent := IsLevelTransparent(ANode);
      if not Transparent then 
        Color := GetLevelColor(ANode, ANodeIndex);
      if IsSupportedCustomDraw(nil) then
        Data := Integer(ANode);
    end;

    if (FPaintStyle = psStandard) then
      ALevel := ANode.Level - 1
    else
      ALevel := ANode.Level - Byte(ANode.Count = 0);

    for I := 0 to ALevel do
    begin
      Node := ANode;
      for J := ANode.Level - 1 downto I + Byte(FPaintStyle = psStandard) do
        Node := Node.Parent;
      ADataItem := TdxReportCellBox.Create(ACell);
      with ADataItem do
      begin
        BoundsRect := Bounds(0, 0, FIndent + 1, ACellHeight);
        APrevSibl := GetPrevSibling;
        if Assigned(APrevSibl) then
          Left := TdxReportVisualItem(APrevSibl).BoundsRect.Right;
        CellSides := [];
        if ShowGrid then
        begin
          CellSides := CellSides + [csLeft];
          if (ANode.Parent = nil) then 
            CellSides := CellSides + [csTop];
          {last box must has a right side border}
          if (ANode.Count = 0) or not ((FPaintStyle = psOutlook) and (I = ALevel)) then
            CellSides := CellSides + [csRight];
          if (FPaintStyle = psStandard) then
          begin
            if (I = ALevel) then
            begin
              CellSides := CellSides + [csTop];
              if (ANode.Count = 0) then CellSides := CellSides + [csBottom];
            end;
          end
          else {psOutlook}
            if (I = ALevel) and (ANode.Count > 0) then
              CellSides := CellSides + [csTop];
          if ((ANode.Count = 0) or (not ANode.Expanded and not AutoNodesExpand)) and 
            (not ShowRowFooters or (ATreeList.GetRowFooterCount(ANode) = 0)) and
            IsLastNodeEx(Node, ANode) then 
            CellSides := CellSides + [csBottom];
        end
        else
        begin
          if (I = 0) then  CellSides := CellSides + [csLeft];
          if (ANode = FNodes.List^[0]) then  CellSides := CellSides + [csTop];
          if (ANode = FNodes.Last) then CellSides := CellSides + [csBottom];
        end;
        Transparent := IsLevelTransparent(Node);
        if not Transparent then 
          Color := GetLevelColor(Node, ANodeIndex);
      end;
    end;

    if IsTreeListLink or IsDBTreeListLink then
    begin
{state images}
      if CanDrawStateImages(ANode) then
      begin
        ADataItem := TdxReportCellGraphic.Create(ACell);
        with TdxReportCellGraphic(ADataItem) do
        begin
          CellSides := [];
          if ShowPreviewGrid and ShowGrid then 
            CellSides := [csTop, csBottom];
          DrawMode := gdmCenter;
          Transparent := True;
          if OddEvenMode and not Self.Transparent and 
            (FPaintStyle = psOutlook) and (ANode.Count = 0) then 
          begin
            Transparent := False;
            if Odd(ANodeIndex) then
              Color := OddColor 
            else
              Color := EvenColor;
          end;
          ImageList := ATreeList.StateImages;
          ImageIndex := ANode.StateIndex;
          BoundsRect := Bounds(0, 0, ImageList.Width, Parent.Height);
          APrevSibl := GetPrevSibling;
          if Assigned(APrevSibl) then
            Left := TdxReportCell(APrevSibl).BoundsRect.Right;
        end;
      end;

{images}
      if CanDrawImages(ANode) then
      begin
        ADataItem := TdxReportCellGraphic.Create(ACell);
        with TdxReportCellGraphic(ADataItem) do
        begin
          CellSides := [];
          if ShowPreviewGrid and ShowGrid then 
            CellSides := [csTop, csBottom];
          DrawMode := gdmCenter;
          Transparent := True;
          if OddEvenMode and not Self.Transparent and 
            (FPaintStyle = psOutlook) and (ANode.Count = 0) then 
          begin
            Transparent := False;
            if Odd(ANodeIndex) then
              Color := OddColor
            else
              Color := EvenColor;
          end;
          ImageList := ATreeList.Images;
          ImageIndex := ANode.ImageIndex;
          BoundsRect := Bounds(0, 0, ImageList.Width, Parent.Height);
          APrevSibl := GetPrevSibling;
          if Assigned(APrevSibl) then
            Left := TdxReportCell(APrevSibl).BoundsRect.Right;
        end;
      end;
    end;

    if not ATreeList.IsRowGroup(ANode) then
      for I := 0 to FAbsoluteIndexes.Count - 1 do
      begin
        AAbsoluteIndex := Integer(FAbsoluteIndexes.List^[I]);
        Column := ATreeList.Columns[AAbsoluteIndex];
      {$IFDEF EXPRESSQUANTUMGRID3}  
        ReferenceColumn := GetReferenceColumn(Column, ANode);  
      {$ELSE}
        ReferenceColumn := Column;
      {$ENDIF}    
        ADataClass := GetDataClass(ReferenceColumn, ANode);
        if (ADataClass <> nil) then
        begin
          ADataItem := ADataClass.Create(ACell);
          AssignValues(ADataItem, ANode, Column, ReferenceColumn);
          with ADataItem do 
          begin
            CellSides := GetDataItemSides(ANode, AAbsoluteIndex);
            BoundsRect := GetDataItemRect(ANode, AAbsoluteIndex, ACell);
            Transparent := IsCellTransparent(ANode);
            if not Transparent then
              Color := GetCellColor(ANode, AAbsoluteIndex, ANodeIndex);
            FontIndex := GetCellFontIndex(ANode, Column, ANodeIndex);
            if IsSupportedCustomDraw(nil) then
              Data := Integer(Column);
          end;    
        end;
      end
    else
    begin
      ADataItem := TdxReportCellString.Create(ACell);
      with TdxReportCellString(ADataItem) do
      begin
        Column := ATreeList.Columns[GetGroupColumnIndex(ANode)];
        Text := ATreeList.GetNodeString(ANode, Column.Index);
        TextAlignY := taCenterY;
        Transparent := IsCellTransparent(ANode);
        if not Transparent then 
          Color := GetCellColor(ANode, 0, -1);
        FontIndex := FGroupNodeFontIndex;
        BoundsRect := Rect(GetTextIndent(ANode), 0, FFullWidth, ACellHeight);
        CellSides := [];
        if ShowGrid then 
          CellSides := [csTop..csBottom];
        if IsSupportedCustomDraw(nil) then 
          Data := Integer(Column);
      end;
    end;

{preview}
    if not ATreeList.IsRowGroup(ANode) and ShowPreview and (FPreviewHeight <> 0) then
    begin
      ADataItem := TdxReportCellString.Create(ACell);
      with TdxReportCellString(ADataItem) do
      begin
        CellSides := GetPreviewCellSides(ANode);
        Multiline := True;
        Text := ATreeList.GetPreviewText(ANode);
        TextAlignY := dxMultilineTextAlignY[Multiline];
        Transparent := IsPreviewTransparent(ANode);
        if not Transparent then 
          Color := GetPreviewColor(ANodeIndex);
        FontIndex := GetPreviewFontIndex(ANode, ANodeIndex);
        Indent := ATreeList.IndentDesc;
        BoundsRect := 
          Rect(GetTextIndent(ANode), ACellHeight - FPreviewHeight, FFullWidth, ACellHeight);
        if IsSupportedCustomDraw(nil) then
          ADataItem.Data := Integer(ANode);
      end;
    end;

{row footers}
    if ShowRowFooters and ANode.IsLast and (ANode.Count = 0) then
    begin
      Node := ANode;
      for I := 0 to ATreeList.GetRowFooterCount(ANode) - 1 do
      begin
        InsertRowFooters(Node, ANode, AParent, I);
        Node := Node.Parent;
      end;
    end;
  end;

  procedure IterateNodes;
  var
    I, M: Integer;
    Node: TdxTreeListNode;
  begin
    M := 0;
    for I := 0 to FNodes.Count - 1 do
    begin
      Inc(M);
      Node := TdxTreeListNode(FNodes.List^[I]);
      if ATreeList.IsRowGroup(Node) or ((ATreeList.PaintStyle = psOutlook) and (Node.Count > 0)) then 
        M := 0;
      ProcessCells(Node, AReportCells.Cells, M);
      AReportCells.DoProgress(MulDiv(I, 100, FNodes.Count));        
    end;
  end;

begin
  if Component = nil then Exit;
  inherited ConstructReport(AReportCells);
  PrepareConstruct(AReportCells);
  try
    if (FAbsoluteIndexes.Count > 0) then
    begin
      ATreeList := ExposeTreeList(CustomTreeList);
      AReportCells.BorderColor := ColorToRGB(GridLineColor);
      with AReportCells.Cells do
      begin
        Color := dxDefaultColor;
        CellSides := [];
        Transparent := True;
        FontIndex := 0;
      end;
      if IsDrawHeadersOnEveryPage then
        with AReportCells.HeaderCells do
        begin
          Color := dxDefaultFixedColor;
          CellSides := [];
          Transparent := False;
          FontIndex := FHeaderFontIndex;
        end;
      if IsDrawFootersOnEveryPage then
        with AReportCells.FooterCells do
        begin
          Color := dxDefaultFixedColor;
          CellSides := [];
          Transparent := False;
          FontIndex := FFooterFontIndex;
        end;

      if ShowBands then InsertBands;
      if ShowHeaders then InsertHeaders;
      if (FNodes <> nil) and (FNodes.Count > 0) then IterateNodes;
      if ShowFooters then
        InsertFooters
      else
        InsertStub;

      with AReportCells do
      begin
        if (Cells.CellCount > 0) then
          Cells.BoundsRect := Rect(0, 0, FFullWidth, Cells.LastCell.BoundsRect.Bottom);
        if IsDrawHeadersOnEveryPage and (HeaderCells.CellCount > 0) then
          HeaderCells.BoundsRect := Rect(0, 0, FFullWidth, HeaderCells.LastCell.BoundsRect.Bottom);
        if IsDrawFootersOnEveryPage and (FooterCells.CellCount > 0) then
          FooterCells.BoundsRect := Rect(0, 0, FFullWidth, FooterCells.LastCell.BoundsRect.Bottom);
      end;
    end;
  finally
    UnprepareConstruct(AReportCells);
  end;
end;

function TCustomdxTreeListReportLink.GetBandLeft(AVisibleIndex: Integer): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to AVisibleIndex - 1 do
    Inc(Result, GetBandWidth(I));
end;

function TCustomdxTreeListReportLink.GetBandWidth(AVisibleIndex: Integer): Integer;
begin
  Result := ExposeTreeList(CustomTreeList).GetBandWidth(AVisibleIndex);
  if (AVisibleIndex = 0) then
    Inc(Result, ExposeTreeList(CustomTreeList).GetIndentWidth);
end;

function TCustomdxTreeListReportLink.GetPreviewColor(ANodeIndex: Integer): TColor;
begin
  case DrawMode of
    tldmStrict:
      Result := PreviewColor;
    tldmOddEven:
      if Odd(ANodeIndex) then
        Result := OddColor
      else
        Result := EvenColor
  else
    Result := PreviewColor;    
  end;
end;

function TCustomdxTreeListReportLink.CanUseOddEvenMode(ANode: TdxTreeListNode; 
  ANodeIndex: Integer): Boolean;
begin
  Result := (DrawMode = tldmOddEven) and (ANodeIndex <> -1) and 
    ((FPaintStyle <> psOutlook) or (ANode.Count = 0))
end;

function TCustomdxTreeListReportLink.GetOddEvenModeCellColor(ANodeIndex: Integer): TColor;
begin
  if Odd(ANodeIndex) then
    Result := OddColor
  else
    Result := EvenColor;
end;

function TCustomdxTreeListReportLink.GetCellColor(ANode: TdxTreeListNode;
  AColumnIndex: Integer; ANodeIndex: Integer): TColor;
begin
  if CanUseOddEvenMode(ANode, ANodeIndex) then
    Result := GetOddEvenModeCellColor(ANodeIndex)
  else 
    if DrawMode = tldmBorrowSource then
      if (FPaintStyle = psOutlook) and (ANode.Count > 0) then
      begin
        Result := GroupNodeColor;
        ExposeTreeList(CustomTreeList).DoGetLevelColor(ANode.Level, Result);
      end
      else
      begin
        Result := ExposeTreeList(CustomTreeList).GetColumnColor(AColumnIndex);
        if (Result = ExposeTreeList(CustomTreeList).Color) then 
          Result := Color;
      end  
    else
      if (FPaintStyle = psOutlook) and (ANode.Count > 0) then 
        Result := GroupNodeColor
      else 
        Result := Color;
end;  

function TCustomdxTreeListReportLink.IsPreviewTransparent(ANode: TdxTreeListNode): Boolean;
begin
  if (FPaintStyle = psStandard) or (ANode.Count = 0) then
    Result := Transparent
  else
    Result := True;
end;

function TCustomdxTreeListReportLink.IsCellTransparent(ANode: TdxTreeListNode): Boolean; 
begin
  if (FPaintStyle = psStandard) or (ANode.Count = 0) then
    Result := Transparent
  else
    Result := FixedTransparent;
end;

function TCustomdxTreeListReportLink.GetLevelColor(ANode: TdxTreeListNode; 
  ANodeIndex: Integer): TColor;
begin
  if FPaintStyle = psStandard then
    case DrawMode of
      tldmStrict:
        Result := Color;
      tldmOddEven:
        if (ANodeIndex = -1) then
          Result := RowFooterColor
        else
          if Odd(ANodeIndex) then
            Result := OddColor
          else
            Result := EvenColor;
    else {tldmBorrowSource}
      Result := ExposeTreeList(CustomTreeList).Color
    end    
  else {psOutlook}
  begin
    if ANode.Count = 0 then 
      Result := ColorToRGB(Color)
    else
      Result := ColorToRGB(GroupNodeColor);
    if (DrawMode = tldmBorrowSource) and (ANode.Count <> 0) then 
      ExposeTreeList(CustomTreeList).DoGetLevelColor(ANode.Level, Result)
  end;
end;

function TCustomdxTreeListReportLink.IsLevelTransparent(ANode: TdxTreeListNode): Boolean;
begin
  if (FPaintStyle = psStandard) or (ANode.Count = 0) then
    Result := Transparent
  else
    Result := FixedTransparent;
end;

function TCustomdxTreeListReportLink.GetOddNodeFontIndex(AColumn: TdxTreeListColumn): Integer;
begin
  if IsHyperLinkColumn(AColumn) then 
    Result := FOddHyperLinkFontIndex
  else
    Result := FOddFontIndex;
end;

function TCustomdxTreeListReportLink.GetEvenNodeFontIndex(AColumn: TdxTreeListColumn): Integer;
begin
  if IsHyperLinkColumn(AColumn) then 
    Result := FEvenHyperLinkFontIndex
  else
    Result := FEvenFontIndex;
end;

function TCustomdxTreeListReportLink.GetOddEvenModeFontIndex(AColumn: TdxTreeListColumn; 
  ANodeIndex: Integer): Integer;
begin
  if Odd(ANodeIndex) then
    Result := GetOddNodeFontIndex(AColumn)
  else
    Result := GetEvenNodeFontIndex(AColumn);
end;

function TCustomdxTreeListReportLink.NeedGroupNodeFontIndex(ANode: TdxTreeListNode; 
  AFontIndex: Integer): Boolean;
begin
  Result := (AFontIndex = FFontIndex) and ((FPaintStyle = psOutLook) and (ANode.Count > 0));
end;

function TCustomdxTreeListReportLink.GetCellFontIndex(ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ANodeIndex: Integer): Integer;
begin
  if CanUseOddEvenMode(ANode, ANodeIndex) then
    Result := GetOddEvenModeFontIndex(AColumn, ANodeIndex)
  else  
    if ExposeTreeList(CustomTreeList).IsRowGroup(ANode) then 
      Result := FGroupNodeFontIndex
    else  
      if (DrawMode = tldmBorrowSource) then 
      begin
        Result := PdxColumnInfo(FColumnInfos.List^[AColumn.Index]).FontIndex;
        if NeedGroupNodeFontIndex(ANode, Result) then 
          Result := FGroupNodeFontIndex;
      end
      else
        if IsHyperLinkColumn(AColumn) then 
          Result := FHyperLinkFontIndex
        else
          Result := FFontIndex;
end;      

function TCustomdxTreeListReportLink.GetPreviewFontIndex(ANode: TdxTreeListNode;
  ANodeIndex: Integer): Integer;
begin  
  if CanUseOddEvenMode(ANode, ANodeIndex) then
    if Odd(ANodeIndex) then
      Result := FOddFontIndex
    else
      Result := FEvenFontIndex
  else  
    Result := FPreviewFontIndex;    
end;      

function TCustomdxTreeListReportLink.IsSelectedNode(ANode: TdxTreeListNode): Boolean;

  function IsExistSelectedChild(ANode: TdxTreeListNode): Boolean;
  var
    I, J: Integer;
  begin
    Result := False;
    with ExposeTreeList(CustomTreeList) do 
      for I := 0 to ANode.Count - 1 do
      begin
        for J := 0 to SelectedCount - 1 do
        begin
          Result := (ANode[I] = SelectedNodes[J]);
          if Result then Exit;
        end;
        if (ANode[I].Count > 0) then
        begin
          Result := IsExistSelectedChild(ANode[I]);
          if Result then Exit;
        end;
      end;
  end;

  function FindInOriginal(ANode: TdxTreeListNode): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    with ExposeTreeList(CustomTreeList) do 
      for I := 0 to SelectedCount - 1 do
      begin
        Result := (ANode = SelectedNodes[I]);
        if Result then Exit;
      end;
  end;

  function FindInChildren(ANode: TdxTreeListNode): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := 0 to ANode.Count - 1 do
    begin
      Result := FindInOriginal(ANode[I]);
      if Result then
        Break
      else if (ANode[I].Count > 0) then
        Result := FindInChildren(ANode[I]);
      if Result then Break;
    end;
  end;

  function FindInParent(ANode: TdxTreeListNode): Boolean;
  begin
    Result := False;
    ANode := ANode.Parent;
    while Assigned(ANode) do
    begin
      Result := FindInOriginal(ANode);
      //if not Result then Result := FindInChildren(ANode);
      if Result then Break;
      ANode := ANode.Parent;
    end;
  end;

begin
  Result := FindInOriginal(ANode);
  if not Result and (ANode.Count > 0) then
    Result := FindInChildren(ANode);
  if not Result and not IsExtendedSelect then
    Result := FindInParent(ANode);
end;

procedure TCustomdxTreeListReportLink.AddNodes;

  procedure AddNode(ANode: TdxTreeListNode);
  var
    I: Integer;
    Node: TdxTreeListNode;
    ExpLevel: Integer;
  begin
    FNodes.Add(ANode);
    if ANode.Expanded or AutoNodesExpand then
      for I := 0 to ANode.Count - 1 do
      begin
        Node := ANode[I];
        if not IsExistSelectedNodes then
        begin
          ExpLevel := GetExpandLevel;
          if (ExpLevel = -1) or (ExpLevel >= Node.Level) then
            AddNode(Node);
        end  
        else 
          if IsSelectedNode(Node) then
            AddNode(Node);
      end;
  end;
  
var
  I: Integer;
  Node: TdxTreeListNode;
begin
  FNodes.Clear;
  if CustomTreeList.Count > 0 then
  begin
    if not AutoNodesExpand then 
      if OnlySelected then                                             
        FNodes.Capacity := ExposeTreeList(CustomTreeList).SelectedCount
      else  
        FNodes.Capacity := ExposeTreeList(CustomTreeList).GetAbsoluteCount;
    for I := 0 to CustomTreeList.Count - 1 do
    begin
      Node := CustomTreeList.Items[I];
      if not IsExistSelectedNodes or IsSelectedNode(Node) then
        AddNode(Node);
    end;
  end;  
end;

procedure TCustomdxTreeListReportLink.CalcColumnInfos(AReportCells: TdxReportCells);
type
  PIntArray = ^TIntArray;
  TIntArray = array[0..0] of Integer;
var
  ATreeList: TdxTreeListAccess;
  I, J, LineCount, HeaderWidth, AbsoluteIndex: Integer;
  HeaderInfo: PdxColumnInfo;
  F: TFont;
  HyperLinkColumn: Boolean;
begin
  if FAbsoluteIndexes.Count = 0 then Exit;
  
  ATreeList := ExposeTreeList(CustomTreeList);

  FColumnInfos := TList.Create;
  
{$IFOPT R+}{$DEFINE PREVRANGECHECK}{$R-}{$ENDIF}
  FColumnInfos.Count := 
    1 + MATH.MaxIntValue(Slice(PIntArray(FAbsoluteIndexes.List)^, FAbsoluteIndexes.Count));
{$IFDEF SAVERANGECHECK}{$UNDEF PREVRANGECHECK}{$R+}{$ENDIF}

  F := TFont.Create;
  try
    with FAbsoluteIndexes do
      for I := 0 to Count - 1 do
      begin
        AbsoluteIndex := Integer(List^[I]);
        New(HeaderInfo);
        with HeaderInfo^ do
        begin
          HyperLinkColumn := IsHyperLinkColumn(ATreeList.Columns[AbsoluteIndex]);
          if UseColumnFont and (ATreeList.IsExistColumnFont(AbsoluteIndex) or HyperLinkColumn) then 
          begin
            F.Assign(ATreeList.GetColumnFont(AbsoluteIndex));
            if HyperLinkColumn then
            begin
              //F.Color := clBlue; // TODO: HyperLinkColumn Font Color
              F.Style := [fsUnderline];
            end;  
            FontIndex := AddFontToPool(F);
          end    
          else
            FontIndex := FFontIndex;
          
          BandIndex := ATreeList.GetVisibleBandIndex(ATreeList.GetHeaderBandIndex(AbsoluteIndex));
          RowIndex := ATreeList.GetHeaderRowIndex(AbsoluteIndex);
          RowCount := ATreeList.GetHeaderRowCount(BandIndex);
          ColIndex := ATreeList.GetHeaderColIndex(AbsoluteIndex);
          ColCount := ATreeList.GetHeaderColCount(BandIndex, RowIndex);
              
          ColumnLeft := GetBandLeft(BandIndex);
          for J := 0 to ColIndex - 1 do
          begin 
            HeaderWidth := ATreeList.GetHeaderBoundsWidth(ATreeList.GetHeaderAbsoluteIndex(BandIndex, RowIndex, J));
            Inc(ColumnLeft, HeaderWidth);
          end;    
          ColumnRight := ColumnLeft + ATreeList.GetHeaderBoundsWidth(AbsoluteIndex);
          CellTop := 0;
          FooterTop := 0;
          HeaderTop := 0;
          NodeFooterTop := 0;
          for J := 0 to RowIndex - 1 do
          begin
            LineCount := ATreeList.GetHeaderLineCount(BandIndex, J, ColIndex);
            Inc(CellTop,  LineCount * FRowHeight);
            Inc(FooterTop, LineCount * FFooterRowHeight);
            Inc(HeaderTop, LineCount * FHeaderRowHeight);
            Inc(NodeFooterTop, LineCount * FNodeFooterRowHeight);
          end;
          LineCount := ATreeList.GetHeaderLineCount(BandIndex, RowIndex, ColIndex);
          CellBottom := CellTop + LineCount * FRowHeight;
          FooterBottom :=  FooterTop + LineCount * FFooterRowHeight + 3;
          HeaderBottom := HeaderTop + LineCount * FHeaderRowHeight;
          NodeFooterBottom := NodeFooterTop + LineCount * FNodeFooterRowHeight + 3;
          IsFirstColumn := (BandIndex = 0) and (ColIndex = 0);
          IsLastColumn := 
            (BandIndex = ATreeList.GetBandCount - 1) and (ColIndex = ColCount - 1);
        end;
        FColumnInfos.List^[AbsoluteIndex] := HeaderInfo;
      end;
  finally
    F.Free;
  end;  
end;

procedure TCustomdxTreeListReportLink.FreeHeaderInfos;
var
  I: Integer;
begin
  if FColumnInfos = nil then 
    Exit;
  with FColumnInfos do
    for I := 0 to Count - 1 do
      if List^[I] <> nil then 
        Dispose(PdxColumnInfo(List^[I]));
  FColumnInfos.Free;
  FColumnInfos := nil;
end;

procedure TCustomdxTreeListReportLink.CalcFontIndexes(AReportCells: TdxReportCells);
var
  F: TFont;
begin
  if FAbsoluteIndexes.Count = 0 then Exit;

  FBandFontIndex := AddFontToPool(BandFont);
  FEvenFontIndex := AddFontToPool(EvenFont);
  FGroupNodeFontIndex := AddFontToPool(GroupNodeFont);
  FFooterFontIndex := AddFontToPool(FooterFont);
  FHeaderFontIndex := AddFontToPool(HeaderFont);
  FOddFontIndex := AddFontToPool(OddFont);
  FPreviewFontIndex := AddFontToPool(PreviewFont);
  FRowFooterFontIndex := AddFontToPool(RowFooterFont);
  if IsHyperLinkColumnsExists then 
  begin
    F := TFont.Create;
    try
      F.Assign(Self.Font);
      F.Style := F.Style + [fsUnderline];
      FHyperLinkFontIndex := AddFontToPool(F);
      if (DrawMode = tldmOddEven) then 
      begin
        F.Assign(Self.OddFont);
        F.Style := F.Style + [fsUnderline];
        FOddHyperLinkFontIndex := AddFontToPool(F);
        F.Assign(Self.EvenFont);
        F.Style := F.Style + [fsUnderline];
        FEvenHyperLinkFontIndex := AddFontToPool(F);
      end;
    finally
      F.Free;
    end;  
  end;  
end;

procedure TCustomdxTreeListReportLink.GetColumnInfos(AAbsoluteIndex: Integer;
  ABandIndex, ARowIndex, AColIndex, ARowCount, AColCount: PInteger; 
  AIsFirstColumn, AIsLastColumn: PBoolean);
begin
  with PdxColumnInfo(FColumnInfos.List[AAbsoluteIndex])^ do
  begin
    if (ABandIndex <> nil) then ABandIndex^ := BandIndex;
    if (AColIndex <> nil) then AColIndex^ := ColIndex;
    if (AColCount <> nil) then AColCount^ := ColCount;
    if (ARowIndex <> nil) then ARowIndex^ := RowIndex;
    if (ARowCount <> nil) then ARowCount^ := RowCount;
    if (AIsFirstColumn <> nil) then AIsFirstColumn^ := IsFirstColumn;
    if (AIsLastColumn <> nil) then AIsLastColumn^ := IsLastColumn;    
  end;
end;

procedure TCustomdxTreeListReportLink.GetCellRect(AAbsoluteIndex: Integer; 
    ACellType: TdxTreeListLinkCellType; var R: TRect);
begin
  with PdxColumnInfo(FColumnInfos.List[AAbsoluteIndex])^ do
  begin
    R.Left := ColumnLeft;
    R.Right := ColumnRight;
    case ACellType of 
      tlstCell: 
        begin
          R.Top := CellTop;
          R.Bottom := CellBottom;
        end;
      tlstFooter:
        begin
          R.Top := FooterTop;
          R.Bottom := FooterBottom;
        end;
      tlstGroupFooter:
        begin
          R.Top := NodeFooterTop;
          R.Bottom := NodeFooterBottom;
        end;
      tlstHeader:
        begin
          R.Top := HeaderTop;
          R.Bottom := HeaderBottom;
        end;
    else
      R.Top := 0;
      R.Bottom := 0;
    end;
  end;  
end;

procedure TCustomdxTreeListReportLink.CalcAbsoluteIndexes;
var
  I, J, K, Ind: Integer;
begin
  with ExposeTreeList(CustomTreeList) do
    for I := 0 to GetBandCount - 1 do
      for J := 0 to GetHeaderRowCount(I) - 1 do
        for K := 0 to GetHeaderColCount(I, J) - 1 do
        begin
          Ind := GetHeaderAbsoluteIndex(I, J, K);
          FAbsoluteIndexes.Add(Pointer(Ind));
        end;  
end;

procedure TCustomdxTreeListReportLink.MakeDelimiters(AReportCells: TdxReportCells;
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
      if Cell.HasChildren then 
        IterateChildrens(Cell);
    end;
  end;

var
  ATreeList: TdxTreeListAccess;
  I: Integer;
  ACell: TdxReportCell;
begin
  inherited MakeDelimiters(AReportCells, AHorzDelimiters, AVertDelimiters);

  ATreeList := ExposeTreeList(CustomTreeList);
  
  if (AReportCells.Cells.CellCount > 0) or 
    (IsDrawHeadersOnEveryPage and (AReportCells.HeaderCells.CellCount > 0)) or
    (IsDrawFootersOnEveryPage and (AReportCells.FooterCells.CellCount > 0)) then
  begin
    {horz.}  
    if UseHorzDelimiters then 
    begin
      if ShowBands and HorzDelimitByBands then
        if BandsOnEveryPage and (CustomTreeList.Count > 0) then
          ACell := AReportCells.HeaderCells[0]
        else
          ACell := AReportCells.Cells[0]
      else 
        if ShowHeaders then
          if BandsOnEveryPage and HeadersOnEveryPage and (CustomTreeList.Count > 0) then
            ACell := AReportCells.HeaderCells[Byte(ShowBands)]
          else
            ACell := AReportCells.Cells[Byte(ShowBands)]
      else 
        if ShowBands then
          ACell := AReportCells.Cells[Byte(not BandsOnEveryPage)]
        else 
          if (AReportCells.Cells.CellCount > 0) then
            ACell := AReportCells.Cells[0]
        else
          ACell := nil;

      if ACell <> nil then
        if not ShowBands and not ShowHeaders and (CustomTreeList.Count > 0) and 
          (AReportCells.Cells.CellCount > 0) and
           ATreeList.IsRowGroup(TdxTreeListNode(FNodes.List[0])) then
        begin
          I := 0;
          while (I < FNodes.Count) and ATreeList.IsRowGroup(TdxTreeListNode(FNodes.List[I])) do
            Inc(I);
          if I < FNodes.Count then
            ACell := ACell.Parent.Cells[I]
          else
            ACell := nil;
        end;

      if Assigned(ACell) then
        for I := 0 to ACell.DataItemCount - 1 do
          with ACell.DataItems[I] do
          begin
            AHorzDelimiters.Add(Pointer(AbsoluteOrigin.X));
            AHorzDelimiters.Add(Pointer(AbsoluteOrigin.X + Width));
          end;
    end;
    
    {vert.}
    if UseVertDelimiters then 
    begin
      if AReportCells.Cells.CellCount > 0 then
        IterateChildrens(AReportCells.Cells);
      //if (IsDrawHeadersOnEveryPage and (AReportCells.HeaderCells.CellCount > 0)) then
      if not IsDrawHeadersOnEveryPage then
        IterateChildrens(AReportCells.HeaderCells);
      //if (IsDrawFootersOnEveryPage and (AReportCells.FooterCells.CellCount > 0)) then
      if not IsDrawFootersOnEveryPage then    
        IterateChildrens(AReportCells.FooterCells);
    end;    
  end
  else
  begin
    AHorzDelimiters.Add(Pointer(1));
    AVertDelimiters.Add(Pointer(1));
  end;
end;

procedure TCustomdxTreeListReportLink.DoCustomDrawBandCell(ACanvas: TCanvas;
  ABoundsRect, AClientRect: TRect; ABand: TdxTreeListBand; var AText: string; 
  var AColor: TColor; AFont: TFont; var ATextAlignX: TdxTextAlignX; 
  var ATextAlignY: TdxTextAlignY; var ADone: Boolean);
begin
  if Assigned(FOnCustomDrawBandCell) then
    FOnCustomDrawBandCell(Self, ACanvas, ABoundsRect, AClientRect, ABand, AText,
      AColor, AFont, ATextAlignX, ATextAlignY, ADone);
end;

procedure TCustomdxTreeListReportLink.DoCustomDrawCell(ACanvas: TCanvas;
  ABoundsRect, AClientRect: TRect; ANode: TdxTreeListNode; 
  AColumn: TdxTreeListColumn; var AText: string; var AColor: TColor; 
  AFont: TFont; var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
  var ADone: Boolean);
begin
  if Assigned(FOnCustomDrawCell) then
    FOnCustomDrawCell(Self, ACanvas, ABoundsRect, AClientRect, ANode, AColumn, 
      AText, AColor, AFont, ATextAlignX, ATextAlignY, ADone);
end;

procedure TCustomdxTreeListReportLink.DoCustomDrawFooterCell(ACanvas: TCanvas;
  ABoundsRect, AClientRect: TRect; ANode: TdxTreeListNode; 
  AColumn: TdxTreeListColumn; var AText: string; var AColor: TColor; 
  AFont: TFont; var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY; 
  var ADone: Boolean);
begin
  if Assigned(FOnCustomDrawFooterCell) then
    FOnCustomDrawFooterCell(Self, ACanvas, ABoundsRect, AClientRect, ANode, 
      AColumn, AText, AColor, AFont, ATextAlignX, ATextAlignY, ADone);
end;

procedure TCustomdxTreeListReportLink.DoCustomDrawHeaderCell(ACanvas: TCanvas;
  ABoundsRect, AClientRect: TRect; AColumn: TdxTreeListColumn; var AText: string;
  var AColor: TColor; AFont: TFont; var ATextAlignX: TdxTextAlignX;
  var ATextAlignY: TdxTextAlignY; var ASorted: TdxCellSortOrder; 
  var ADone: Boolean);
begin
  if Assigned(FOnCustomDrawHeaderCell) then
    FOnCustomDrawHeaderCell(Self, ACanvas, ABoundsRect, AClientRect, AColumn,
      AText, AColor, AFont, ATextAlignX, ATextAlignY, ASorted, ADone);
end;

procedure TCustomdxTreeListReportLink.DoCustomDrawPreviewCell(ACanvas: TCanvas;
  ABoundsRect, AClientRect: TRect; ANode: TdxTreeListNode; var AText: string;
  var AColor: TColor; AFont: TFont; var ADone: Boolean);
var
  ATextColor, C: TColor;  
begin
  if Assigned(FOnCustomDrawPreviewCell) then
  begin
    ATextColor := AFont.Color;
    C := ATextColor;
    FOnCustomDrawPreviewCell(Self, ACanvas, ABoundsRect, AClientRect, ANode, AText,
      AColor, ATextColor, AFont, ADone);
    if (C <> ATextColor) then AFont.Color := ATextColor;
  end;    
end;

procedure TCustomdxTreeListReportLink.DoCustomDrawRowFooterCell(ACanvas: TCanvas;
  ABoundsRect, AClientRect: TRect; ANode: TdxTreeListNode; 
  AColumn: TdxTreeListColumn; AFooterIndex: Integer; var AText: string; 
  var AColor: TColor; AFont: TFont; var ATextAlignX: TdxTextAlignX; 
  var ATextAlignY: TdxTextAlignY; var ADone: Boolean);
begin
  if Assigned(FOnCustomDrawRowFooterCell) then
    FOnCustomDrawRowFooterCell(Self, ACanvas, ABoundsRect, AClientRect, ANode,
      AColumn, AFooterIndex, AText, AColor, AFont, ATextAlignX, ATextAlignY, ADone);
end;


{ TdxTreeListReportLink }

procedure TdxTreeListReportLink.AssignValues(ADataItem: TAbstractdxReportCellData;
  ANode: TdxTreeListNode; AColumn, AReferenceColumn: TdxTreeListColumn);
begin
  if Assigned(FdxTreeListAssignDataProc) then
    FdxTreeListAssignDataProc(Self, ADataItem, TreeList, ANode, AColumn, AReferenceColumn);
end;

function TdxTreeListReportLink.GetDataClass(AColumn: TdxTreeListColumn; 
  ANode: TdxTreeListNode): TdxReportCellDataClass;
begin
  if Assigned(FdxTreeListColumnMapperProc) then
    Result := FdxTreeListColumnMapperProc(AColumn, Self, ANode)
  else
    Result := nil;
end;

function TdxTreeListReportLink.GetTreeList: TdxTreeList;
begin
  Result := TdxTreeList(Component)
end;


{ TdxTLReportLinkDesignWindow }

constructor TdxTLReportLinkDesignWindow.Create(AOwner: TComponent);
begin
  HelpContext := dxhcTreeListReportLinkDesigner;
  inherited Create(AOwner);
  CreateControls;
  FillTreeListData;
  PageControl1.ActivePage := PageControl1.Pages[0];
  dxPSRegisterControlWithPopup(lbxFonts);
end;

destructor TdxTLReportLinkDesignWindow.Destroy;
begin
  dxPSUnregisterControlWithPopup(lbxFonts);
  inherited Destroy;
end;

procedure TdxTLReportLinkDesignWindow.FillTreeListData;
  procedure AddNodeData(ANode: TdxTreeListNode; const AText1, AText2, AText3: string; 
    AValue: Integer; AData: Integer);
  begin
    ANode.Strings[0] := AText1;
    ANode.Strings[1] := AText2;
    ANode.Strings[2] := AText3;  
    ANode.Values[2] := IntToStr(AValue);
    ANode.Data := Pointer(AData);
  end;  
  
var
  Node: TdxTreeListNode;
begin
  dxTLPreview.Bands[0].Caption := sdxTLBand;
  dxTLPreview.Columns[0].Caption := sdxTLColumnName;
  dxTLPreview.Columns[1].Caption := sdxTLColumnAxisymmetric;
  dxTLPreview.Columns[2].Caption := sdxTLColumnItemShape;
  
  dxTLPreview.ClearNodes;
  Node := dxTLPreview.Add;
  AddNodeData(Node, sdxRegular, 'True', sdxItemShapeAsText, -1, 0);
  AddNodeData(Node.AddChild, sdxItem1Name, 'True', sdxItemShapeAsText, 2, 1);
  AddNodeData(Node.AddChild, sdxItem2Name, 'True', sdxItemShapeAsText, 3, 2);
  AddNodeData(Node.AddChild, sdxItem3Name, 'True', sdxItemShapeAsText, 4, 3);
  AddNodeData(Node.AddChild, sdxItem4Name, 'False', sdxItemShapeAsText, 6, 4);
    
  Node := dxTLPreview.Add;
  AddNodeData(Node, sdxIrregular, 'False', sdxItemShapeAsText, -1, 5);  
  AddNodeData(Node.AddChild, sdxItem5Name, 'False', sdxItemShapeAsText, 5, 6);
end;

function TdxTLReportLinkDesignWindow.GetTreeListReportLink: TCustomdxTreeListReportLink;
begin
  Result := TCustomdxTreeListReportLink(ReportLink);
end;

procedure TdxTLReportLinkDesignWindow.pbxPreviewPaint(Sender: TObject);
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

procedure FillRectColor(DC: hDC; const R: TRect; AColor: TColor);
var
  Brush: HBRUSH;
begin
  Brush := CreateSolidBrush(ColorToRGB(AColor));
  FillRect(DC, R, Brush);
  DeleteObject(Brush);
end;

procedure TdxTLReportLinkDesignWindow.PaintPreview(ACanvas: TCanvas; R: TRect);
var
  DC: hDC;
  dX, dY: Integer;
  R2: TRect;
  DrawInfo: TdxGridDrawInfo;
begin
  DC := ACanvas.Handle;
  FillRect(DC, R, HBRUSH(COLOR_WINDOW + 1));
  dX := (R.Right - R.Left - dxTLPreview.Width) div 2;
  dY := (R.Bottom - R.Top - dxTLPreview.Height) div 2;
  InflateRect(R, -dX, -dY);
  dxTLPreview.PaintTo(DC, R.Left, R.Top);

  dxTLPreview.CalcDrawInfo(DrawInfo);
  try
    R2 := DrawInfo.EmptyRectBottom;
    if not IsRectEmpty(R2) then 
    begin
      OffsetRect(R2, R.Left, R.Top);
      FillRectColor(DC, R2, clWindow);
    end;  
  finally
    dxTLPreview.FreeDrawInfo(DrawInfo);
  end;
  
  Dec(R.Left);
  if not TreeListReportLink.Use3DEffects and TreeListReportLink.ShowBands then 
    Dec(R.Top);
  FrameRectColor(DC, R, TreeListReportLink.GridLineColor);
end;

procedure TdxTLReportLinkDesignWindow.SetupPreview;
begin
  if ReportLink.Component <> nil then
    with dxTLPreview do
    begin
      if TreeListReportLink.IsDBGridLink then
      begin
        Images := nil;
        StateImages := nil;
        ShowButtons := True;
      end;
      ShowLines := False;
      PaintStyle := TreeListReportLink.FPaintStyle;
      FullExpand;
    end;
end;

procedure TdxTLReportLinkDesignWindow.CreateControls;

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
  ccbxColor := 
    CreateColorCombo(gbxTransparent, bvlColorHolder.BoundsRect, 0, dxDefaultColor, lblColor);
  ccbxEvenColor := 
    CreateColorCombo(gbxTransparent, bvlEvenColorHolder.BoundsRect, 1, dxDefaultColor, lblEvenColor);
  ccbxPreviewColor := 
    CreateColorCombo(gbxTransparent, bvlPreviewColorHolder.BoundsRect, 2, dxDefaultColor, lblPreviewColor);
  ccbxBandColor := 
    CreateColorCombo(gbxFixedTransparent, bvlBandColorHolder.BoundsRect, 3, dxDefaultFixedColor, lblBandColor);
  
  ccbxHeaderColor := 
    CreateColorCombo(gbxFixedTransparent, bvlHeaderColorHolder.BoundsRect, 5, dxDefaultFixedColor, lblHeaderColor);
  ccbxGroupNodeColor := 
    CreateColorCombo(gbxFixedTransparent, bvlGroupNodeColorHolder.BoundsRect, 4, dxDefaultFixedColor, lblGroupNodeColor);
  ccbxRowFooterColor := 
    CreateColorCombo(gbxFixedTransparent, bvlRowFooterColorHolder.BoundsRect, 6, dxDefaultFixedColor, lblRowFooterColor);

  ccbxGridLineColor := 
    CreateColorCombo(tshColors, bvlGridLineColorHolder.BoundsRect, 7, dxDefaultGridLineColor, lblGridLineColor);
  ccbxGridLineColor.TabOrder := ccbxGridLineColor.Parent.ControlCount - 1;

  seExpandLevel := TdxPSSpinEdit.Create(Self);
  with TdxPSSpinEdit(seExpandLevel) do
  begin
    BoundsRect := bvlExpandLevelHolder.BoundsRect;
    MinValue := -1;
    MaxValue := 100;
    Flat := False;
    Parent := tshBeh;
    TabOrder := chbxAutoNodesExpand.TabOrder + 1;
    OnChange := ExpandLevelChange;
  end;
  lblExpandLevel.FocusControl := seExpandLevel;

  sePreviewLineCount := TdxPSSpinEdit.Create(Self);
  with TdxPSSpinEdit(sePreviewLineCount) do
  begin
    BoundsRect := bvlPreviewLineCountHolder.BoundsRect;
    MinValue := 0;
    MaxValue := 100;
    Flat := False;
    Parent := tshOptions;
    TabOrder := chbxAutoCalcPreviewLines.TabOrder + 1;
    OnChange := PreviewLineCountChange;
  end;
  lblPreviewLineCount.FocusControl := sePreviewLineCount;

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

procedure TdxTLReportLinkDesignWindow.LoadStrings;
begin
  inherited LoadStrings;
  tshOptions.Caption := sdxOptions;
  tshFonts.Caption := sdxFonts;
  tshColors.Caption := sdxColors;
  lblPreview.Caption := DropAmpersand(sdxPreview);
  tshBeh.Caption := sdxBehaviors;
  
  lblShow.Caption := sdxShow;
  chbxBandsOnEveryPage.Caption := sdxBandsOnEveryPage;
  chbxHeadersOnEveryPage.Caption := sdxHeadersOnEveryPage;
  chbxFootersOnEveryPage.Caption := sdxFootersOnEveryPage;
  chbxAutoNodesExpand.Caption := sdxAutoNodesExpand;
  chbxOnlySelected.Caption := sdxOnlySelected;
  chbxExtendedSelect.Caption := sdxExtendedSelect;
  lblExpandLevel.Caption := sdxExpandLevel;

  chbxTransparent.Caption := sdxTransparent;
  chbxFixedTransparent.Caption := sdxFixedTransparent;

  lblColor.Caption := sdxColor;
  lblEvenColor.Caption := sdxEvenColor;
  lblPreviewColor.Caption := sdxPreviewColor;
  
  lblBandColor.Caption := sdxBandColor;
  lblHeaderColor.Caption := sdxHeaderColor;
  lblRowFooterColor.Caption := sdxGroupFooterColor;
  lblGroupNodeColor.Caption := sdxGroupNodeColor;
  lblGridLineColor.Caption := sdxGridLinesColor;

  lbxFonts.Items.BeginUpdate;
  try
    lbxFonts.Items.Clear;
    lbxFonts.Items.Add(sdxBandFont);
    lbxFonts.Items.Add(sdxFont);
    lbxFonts.Items.Add(sdxOddFont);
    lbxFonts.Items.Add(sdxEvenFont);
    lbxFonts.Items.Add(sdxGroupNodeFont);
    lbxFonts.Items.Add(sdxFooterFont);       
    lbxFonts.Items.Add(sdxHeaderFont);
    lbxFonts.Items.Add(sdxPreviewFont);
    lbxFonts.Items.Add(sdxGroupFooterFont);
  finally
    lbxFonts.Items.EndUpdate;
  end;

  btnChangeFont.Caption := sdxBtnChangeFont;
  miChangeFont.Caption := sdxBtnChangeFont;
  
  chbxShowBands.Caption := sdxBands;
  chbxShowHeaders.Caption := sdxHeaders;
  chbxShowFooters.Caption := sdxFooters;
  chbxShowGroupFooters.Caption := sdxGroupFooters;
  chbxShowPreview.Caption := sdxPreview;
  chbxAutoCalcPreviewLines.Caption := sdxAutoCalcPreviewLineCount;
  lblPreviewLineCount.Caption := sdxPreviewLineCount;
  
  lblGrid.Caption := DropAmpersand(sdxGrid);
  chbxShowGrid.Caption := sdxGrid;
  chbxShowNodeGrid.Caption := sdxNodesGrid;
  chbxShowGroupFooterGrid.Caption := sdxGroupFooterGrid;

  lblImages.Caption := DropAmpersand(sdxImages);
  chbxShowImages.Caption := sdxImages;
  chbxShowStateImages.Caption := sdxStateImages;
  
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
 
  lblOnEveryPage.Caption := sdxOnEveryPage;
  lblSelection.Caption := sdxSelection;
  lblExpanding.Caption := sdxNodeExpanding;
  lbl3DEffects.Caption := sdx3DEffects;
  lblGraphics.Caption := sdxGraphics;
  
  chbxUse3DEffects.Caption := sdxUse3DEffects;
  chbxUseSoft3D.Caption := sdxSoft3D;
  
  chbxTransparentColumnGraphic.Caption := sdxTransparentColumnGraphics;
  chbxDisplayGraphicsAsText.Caption := sdxDisplayGraphicsAsText;
end;

procedure TdxTLReportLinkDesignWindow.CMDialogChar(var Msg: TCMDialogChar);
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

procedure TdxTLReportLinkDesignWindow.UpdateControlsState;
begin
  inherited UpdateControlsState;

  if TreeListReportLink.OddEvenMode then
    lblColor.Caption := sdxOddColor
  else  
    lblColor.Caption := sdxColor;
    
  chbxBandsOnEveryPage.Checked := TreeListReportLink.BandsOnEveryPage;
  chbxHeadersOnEveryPage.Enabled := chbxBandsOnEveryPage.Checked;
  chbxHeadersOnEveryPage.Checked := TreeListReportLink.HeadersOnEveryPage;
  chbxFootersOnEveryPage.Checked := TreeListReportLink.FootersOnEveryPage;

  chbxOnlySelected.Checked := TreeListReportLink.OnlySelected;
  chbxAutoNodesExpand.Checked := TreeListReportLink.AutoNodesExpand;

  chbxExtendedSelect.Enabled := chbxOnlySelected.Checked;
  seExpandLevel.Visible := TreeListReportLink.IsTreeListLink;
  lblExpandLevel.Visible := seExpandLevel.Visible;
  if seExpandLevel.Visible then
  begin
    seExpandLevel.Enabled := chbxAutoNodesExpand.Checked and not chbxOnlySelected.Checked;
    lblExpandLevel.Enabled := seExpandLevel.Enabled;
  end;

  lblImages.Visible := not TreeListReportLink.IsDBGridLink;
//  imgImages.Visible := not TreeListReportLink.IsDBGridLink;
  bvlShowImages.Visible := not TreeListReportLink.IsDBGridLink;
  chbxShowStateImages.Visible := not TreeListReportLink.IsDBGridLink;
  chbxShowImages.Visible := not TreeListReportLink.IsDBGridLink;  
  
  chbxAutoCalcPreviewLines.Enabled := TreeListReportLink.ShowPreview;
  sePreviewLineCount.Enabled := TreeListReportLink.ShowPreview and 
    not TreeListReportLink.AutoCalcPreviewLines;
  lblPreviewLineCount.Enabled := sePreviewLineCount.Enabled;
  
  chbxShowNodeGrid.Enabled := chbxShowGrid.Checked;
  chbxShowGroupFooterGrid.Enabled := chbxShowGrid.Checked;
  
  chbxUseSoft3D.Enabled := chbxUse3DEffects.Checked;
  
  ccbxColor.Enabled := not chbxTransparent.Checked;
  lblColor.Enabled := ccbxColor.Enabled;
  ccbxEvenColor.Enabled := not chbxTransparent.Checked and 
    TreeListReportLink.OddEvenMode;
  lblEvenColor.Enabled := ccbxEvenColor.Enabled;
  ccbxPreviewColor.Enabled := not chbxTransparent.Checked and 
    not TreeListReportLink.OddEvenMode;
  lblPreviewColor.Enabled := ccbxPreviewColor.Enabled;

  ccbxBandColor.Enabled := not chbxFixedTransparent.Checked;
  lblBandColor.Enabled := ccbxBandColor.Enabled;
  ccbxGroupNodeColor.Enabled := not chbxFixedTransparent.Checked;
  lblGroupNodeColor.Enabled := ccbxGroupNodeColor.Enabled;

  ccbxHeaderColor.Enabled := not chbxFixedTransparent.Checked;
  lblHeaderColor.Enabled := ccbxHeaderColor.Enabled;
  ccbxRowFooterColor.Enabled := not chbxFixedTransparent.Checked;
  lblRowFooterColor.Enabled := ccbxRowFooterColor.Enabled;
  
  if TreeListReportLink.Use3DEffects then
    dxTLPreview.LookAndFeel := TdxLookAndFeel(TreeListReportLink.UseSoft3D)
  else
    dxTLPreview.LookAndFeel := lfFlat;
  dxTLPreview.HandleNeeded;
  btnChangeFont.Enabled := IsChangeFontEnabled;
  lbxFonts.Perform(LB_SETHORIZONTALEXTENT, GetMaxWidth, 0);
end;

function TdxTLReportLinkDesignWindow.IsChangeFontEnabled: Boolean;
var
  I: Integer;
begin
  if TreeListReportLink.OddEvenMode then 
    Result := (lbxFonts.SelCount > 0)
  else  
  begin
    Result := True;  
    for I := 0 to lbxFonts.Items.Count - 1 do 
      if lbxFonts.Selected[I] and not (I in [2, 3]) then Exit;
    Result := False;
  end;
end;

function TdxTLReportLinkDesignWindow.IsDisableIndex(AIndex: Integer): Boolean;
begin
  Result := (not TreeListReportLink.OddEvenMode) and (AIndex in [2, 3]);
end;

procedure TdxTLReportLinkDesignWindow.DoInitialize;
begin
  inherited DoInitialize;
  with TreeListReportLink do 
  begin
    chbxShowBands.Checked := ShowBands;
    chbxShowHeaders.Checked := ShowHeaders;
    chbxShowFooters.Checked := ShowFooters;    
    chbxShowGroupFooters.Checked := ShowRowFooters;        
    chbxShowPreview.Checked := ShowPreview;
    chbxAutoCalcPreviewLines.Checked := AutoCalcPreviewLines;
    TdxPSSpinEdit(sePreviewLineCount).Enabled := ShowPreview and not AutoCalcPreviewLines;
    TdxPSSpinEdit(sePreviewLineCount).MinValue := -Byte(AutoCalcPreviewLines);
    TdxPSSpinEdit(sePreviewLineCount).Value := PreviewLineCount;
    
    chbxShowGrid.Checked := ShowGrid;
    chbxShowNodeGrid.Checked := ShowPreviewGrid;
    chbxShowGroupFooterGrid.Checked := ShowRowFooterGrid;    

    chbxShowImages.Checked := ShowImages;
    chbxShowStateImages.Checked := ShowStateImages;    

    chbxFlatCheckMarks.Checked := FlatCheckMarks;
    cbxDrawMode.ItemIndex := Integer(DrawMode);
    
    if OddEvenMode then
      lblColor.Caption := sdxOddColor;

    chbxTransparent.Checked := Transparent;
    chbxFixedTransparent.Checked := FixedTransparent;
    
    TdxPSColorCombo(ccbxColor).ColorValue := ColorToRGB(TreeListReportLink.Color);
    TdxPSColorCombo(ccbxEvenColor).ColorValue := ColorToRGB(EvenColor);
    TdxPSColorCombo(ccbxPreviewColor).ColorValue := ColorToRGB(PreviewColor);
    TdxPSColorCombo(ccbxBandColor).ColorValue := ColorToRGB(BandColor);
    TdxPSColorCombo(ccbxHeaderColor).ColorValue := ColorToRGB(HeaderColor);
    TdxPSColorCombo(ccbxGridLineColor).ColorValue := ColorToRGB(GridLineColor);
    TdxPSColorCombo(ccbxGroupNodeColor).ColorValue := ColorToRGB(GroupNodeColor);
    TdxPSColorCombo(ccbxRowFooterColor).ColorValue := ColorToRGB(RowFooterColor);

    TdxPSSpinEdit(seExpandLevel).Enabled := not chbxOnlySelected.Checked;
    TdxPSSpinEdit(seExpandLevel).Value := ExpandLevel;
    
    chbxOnlySelected.Checked := OnlySelected;
    chbxExtendedSelect.Checked := ExtendedSelect;
    
    chbxUse3DEffects.Checked := Use3DEffects;
    chbxUseSoft3D.Checked := UseSoft3D;    
   
    chbxTransparentColumnGraphic.Checked := TransparentColumnGraphics;
    chbxDisplayGraphicsAsText.Checked := GraphicsAsText;
    
{$IFNDEF EXPRESSQUANTUMGRID3}  
    bvlGraphic.Visible := TreeListReportLink.IsDBGridLink;
    lblGraphics.Visible := bvlGraphic.Visible;
    imgGraphics.Visible := bvlGraphic.Visible;  
    chbxTransparentColumnGraphic.Visible := bvlGraphic.Visible;  
    chbxDisplayGraphicsAsText.Visible := bvlGraphic.Visible;  
{$ENDIF}    
  end;  
  SetupPreview;
  UpdatePreview;
  lbxFonts.Invalidate;
end;

procedure TdxTLReportLinkDesignWindow.ExpandLevelChange(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  TreeListReportLink.ExpandLevel := TdxPSSpinEdit(Sender).AsInteger;
  Modified := True;
end;

procedure TdxTLReportLinkDesignWindow.PreviewLineCountChange(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  TreeListReportLink.PreviewLineCount := TdxPSSpinEdit(Sender).AsInteger;
  Modified := True;
end;

procedure TdxTLReportLinkDesignWindow.UpdatePreview;
var
  R: TRect;
begin
  inherited UpdatePreview;
  R := dxTLPreview.BoundsRect;
  InflateRect(R, 1, 1);
  Dec(R.Right);
  if TreeListReportLink.Use3DEffects and not TreeListReportLink.UseSoft3D then 
    Dec(R.Bottom); 
    
  dxTLPreview.BeginUpdate;
  try
    if TreeListReportLink.FixedTransparent then
    begin
      dxTLPreview.BandColor := clWindow;
      dxTLPreview.HeaderColor := clWindow;
      dxTLPreview.RowFooterColor := clWindow;
      dxTLPreview.GroupNodeColor := clWindow;
    end
    else
    begin
      dxTLPreview.BandColor := TreeListReportLink.BandColor;
      dxTLPreview.GroupNodeColor := TreeListReportLink.GroupNodeColor;
      dxTLPreview.HeaderColor := TreeListReportLink.HeaderColor;
      dxTLPreview.RowFooterColor := TreeListReportLink.RowFooterColor;
    end;
    if TreeListReportLink.Transparent then
      dxTLPreview.Color := clWindow
    else
      dxTLPreview.Color := TreeListReportLink.Color;
    dxTLPreview.GridLineColor := TreeListReportLink.GridLineColor;
    
    dxTLPreview.BandFont := TreeListReportLink.BandFont;
    dxTLPreview.BandFont.Size := 8;
    dxTLPreview.HeaderFont := TreeListReportLink.HeaderFont;
    dxTLPreview.HeaderFont.Size := 8;    
    dxTLPreview.Font := TreeListReportLink.Font;
    dxTLPreview.Font.Size := 8;        
    dxTLPreview.PreviewFont := TreeListReportLink.PreviewFont;
    dxTLPreview.PreviewFont.Size := 8;
    
    dxTLPreview.ShowGrid := TreeListReportLink.ShowGrid;
    dxTLPreview.ShowPreviewGrid := TreeListReportLink.ShowPreviewGrid;
    dxTLPreview.ShowBands := TreeListReportLink.ShowBands;
    dxTLPreview.ShowHeader := TreeListReportLink.ShowHeaders;
    dxTLPreview.ShowFooter := TreeListReportLink.ShowFooters;
    dxTLPreview.ShowRowFooter := TreeListReportLink.ShowRowFooters;
    
    if TreeListReportLink.ShowPreview then
      dxTLPreview.Options := dxTLPreview.Options + [aoPreview]
    else
      dxTLPreview.Options := dxTLPreview.Options - [aoPreview];
      
    if tlpoImages in TreeListReportLink.Options then
      dxTLPreview.Images := ilTLImages
    else
      dxTLPreview.Images := nil;
      
    if tlpoStateImages in TreeListReportLink.Options then
      dxTLPreview.StateImages := ilTLImages
    else
      dxTLPreview.StateImages := nil;
      
    dxTLPreviewColumn3.Border3D := not TreeListReportLink.FlatCheckMarks;
  finally
    dxTLPreview.EndUpdate;
  end;
  FPreviewBox.Invalidate;
end;

procedure TdxTLReportLinkDesignWindow.SetColorByTag(ATag: Integer; AColor: TColor);
begin
  with TreeListReportLink do 
    case ATag of
      0: Color := AColor;
      1: EvenColor := AColor;
      2: PreviewColor := AColor;
      3: BandColor := AColor;
      4: GroupNodeColor := AColor;
      5: HeaderColor := AColor;
      6: RowFooterColor := AColor;
    else  
      GridLineColor := AColor;
    end;
end;

procedure TdxTLReportLinkDesignWindow.ccbxColorChange(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  with TdxPSColorCombo(Sender) do 
    SetColorByTag(Tag, ColorValue);
  UpdatePreview;
  Modified := True;
end;

procedure TdxTLReportLinkDesignWindow.FontClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  if (TreeListReportLink.OddEvenMode or (lbxFonts.ItemIndex <> 2)) then
    DoChangeFont(lbxFonts.ItemIndex);
end;

procedure TdxTLReportLinkDesignWindow.DoChangeFont(AIndex: Integer);
var
  I: Integer;
begin
  FD.Font := GetFontByIndex(AIndex);
  if dxPrintDevice.Printers.Count > 0 then
    FD.Device := fdPrinter
  else
    FD.Device := fdScreen;
  if FD.Execute then
  begin
    for I := 0 to lbxFonts.Items.Count - 1 do
      if lbxFonts.Selected[I] then GetFontByIndex(I).Assign(FD.Font);
    lbxFonts.Refresh;
    UpdatePreview;
    Modified := True;
  end;
end;

procedure TdxTLReportLinkDesignWindow.btnChangeFontClick(Sender: TObject);
begin
  if (lbxFonts.SelCount > 0) then DoChangeFont(lbxFonts.ItemIndex);
end;

procedure TdxTLReportLinkDesignWindow.pmChangeFontPopup(Sender: TObject);
begin
  miChangeFont.Enabled := btnChangeFont.Enabled;
end;

procedure TdxTLReportLinkDesignWindow.chbxTransparentClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  case TCheckBox(Sender).Tag of
    0: TreeListReportLink.Transparent := TCheckBox(Sender).checked;
    1: TreeListReportLink.FixedTransparent := TCheckBox(Sender).checked;
  end;
  UpdatePreview;
  Modified := True;
end;

procedure TdxTLReportLinkDesignWindow.chbxHeadersOnEveryPageClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  TreeListReportLink.HeadersOnEveryPage := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxTLReportLinkDesignWindow.chbxBandsOnEveryPageClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  TreeListReportLink.BandsOnEveryPage := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxTLReportLinkDesignWindow.chbxFootersOnEveryPageClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  TreeListReportLink.FootersOnEveryPage := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxTLReportLinkDesignWindow.chbxAutoNodesExpandClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  TreeListReportLink.AutoNodesExpand := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxTLReportLinkDesignWindow.chbxOnlySelectedClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  TreeListReportLink.OnlySelected := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxTLReportLinkDesignWindow.chbxExtendedSelectClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  TreeListReportLink.ExtendedSelect := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxTLReportLinkDesignWindow.lblColorClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  TCustomComboBox(ActiveControl).DroppedDown := True;
end;

procedure TdxTLReportLinkDesignWindow.lblExpandLevelClick(Sender: TObject);
begin
  if Assigned(TLabel(Sender).FocusControl) then
    ActiveControl := TLabel(Sender).FocusControl;
end;

procedure TdxTLReportLinkDesignWindow.dxTLPreviewGetFooterCellText(
  Sender: TObject; ANode: TdxTreeListNode; AColumn, AFooterIndex: Integer;
  var AText: string);
begin
  if AFooterIndex = -1 then
    AText := Format(sdxCountIs, [6])
  else
    AText := Format(sdxCountIs, [ANode.Parent.Count]);
end;

procedure TdxTLReportLinkDesignWindow.dxTLPreviewGetPreviewText(
  Sender: TObject; ANode: TdxTreeListNode; var AText: string);
begin
  AText := sdxPreviews[Integer(ANode.Data)];
end;

procedure TdxTLReportLinkDesignWindow.dxTLPreviewIsExistFooterCell(
  Sender: TObject; AColumn: Integer; var AExist: Boolean);
begin
  AExist := AColumn = 0;
end;

procedure TdxTLReportLinkDesignWindow.dxTLPreviewIsExistRowFooterCell(
  Sender: TObject; ANode: TdxTreeListNode; AColumn, AFooterIndex: Integer;
  var AExist: Boolean);
begin
  AExist := AColumn = 0;
end;

procedure TdxTLReportLinkDesignWindow.dxTLPreviewIsLevelFooter(Sender: TObject;
  ALevel: Integer; var AExist: Boolean);
begin
  AExist := True;
end;

procedure TdxTLReportLinkDesignWindow.FontsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
const
  FLastIndex: Integer = -1;
var
  W: Integer;
  S: string;
  AIndex: Integer;
begin
  AIndex := lbxFonts.ItemAtPos(Point(X, Y), True);
  if (AIndex = -1) or (AIndex = FLastIndex) then Exit;
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

procedure TdxTLReportLinkDesignWindow.FontsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  ItemIndex: Integer;  
begin
  if (TreeListReportLink.DrawMode <> tldmOddEven) and (Key in [VK_UP, VK_DOWN]) then 
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

function TdxTLReportLinkDesignWindow.GetFontByIndex(AIndex: Integer): TFont;
begin
  with TreeListReportLink do 
    case AIndex of
      0: Result := BandFont;
      1: Result := Font;
      2: Result := OddFont;    
      3: Result := EvenFont;
      4: Result := GroupNodeFont;
      5: Result := FooterFont;
      6: Result := HeaderFont;
      7: Result := PreviewFont;
    else  
      Result := RowFooterFont;
    end;
end;

procedure TdxTLReportLinkDesignWindow.lbxFontsDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);

  function GetMaxLength: Integer;
  var
    I, V: Integer;
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
  FirstEnteries: Boolean = True;
  MaxLength: Integer = 0;
var
  R: TRect;
  BrushColor, FontColor: TColor;
  S: string;
begin
  if FirstEnteries then
  begin
    MaxLength := GetMaxLength;
    FirstEnteries := False;
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

function TdxTLReportLinkDesignWindow.GetFontInfoText(AIndex: Integer): string;
begin
  Result := FormatFontInfo(GetFontByIndex(AIndex));  
end;

function TdxTLReportLinkDesignWindow.GetMaxWidth: Integer;
var
  I, L, L2, W, W2: Integer;
begin
  with lbxFonts do
  begin
    W := Canvas.TextWidth(Items[0] + 'X');
    for I := 1 to Items.Count - 1 do
    begin
      L := Canvas.TextWidth(Items[I] + 'X');
      if (L > W) then W := L;
    end;
    W2 := Canvas.TextWidth(GetFontInfoText(0) + 'X');
    for I := 1 to Items.Count - 1 do
    begin
      L2 := Canvas.TextWidth(GetFontInfoText(I) + 'X');
      if (L2 > W2) then W2 := L2;
    end;
  end;
  Result := W + W2 + 2 + 8 + 3;
end;

procedure TdxTLReportLinkDesignWindow.lbxFontsClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  UpdateControlsState;
end;

procedure TdxTLReportLinkDesignWindow.lbxFontsDblClick(Sender: TObject);
begin
  if btnChangeFont.Enabled then btnChangeFont.Click;
end;

function TdxTLReportLinkDesignWindow.GetNodeIndex(ANode: TdxTreeListNode): Integer;
begin
  if TdxTreeListAccess(ANode.Owner).PaintStyle = psOutlook then
    if ANode.Count > 0 then
      Result := -1
    else
      Result := ANode.Index
  else
    Result := ANode.AbsoluteIndex;
  Inc(Result);
end;

function TdxTLReportLinkDesignWindow.GetNodeFont(ANode: TdxTreeListNode; 
  ANodeIndex: Integer): TFont;
var  
  ATreeList: TdxTreeListAccess;
begin
  ATreeList := TdxTreeListAccess(ANode.Owner);
  with TreeListReportLink do 
    if ATreeList.IsRowGroup(ANode) or ((FPaintStyle = psOutLook) and (ANode.Count > 0)) then 
      Result := GroupNodeFont
    else 
      if (DrawMode = tldmOddEven) and ((ATreeList.PaintStyle = psStandard) or (ANode.Count = 0)) then
        if Odd(ANodeIndex) then 
          Result := OddFont
        else
          Result := EvenFont
      else
        Result := Font;
end;

function TdxTLReportLinkDesignWindow.GetPreviewFont(ANode: TdxTreeListNode; 
  ANodeIndex: Integer): TFont;
var  
  ATreeList: TdxTreeListAccess;
begin
  ATreeList := TdxTreeListAccess(ANode.Owner);
  with TreeListReportLink do 
    if (DrawMode = tldmOddEven) and ((ATreeList.PaintStyle = psStandard) or (ANode.Count = 0)) then
      if Odd(ANodeIndex) then 
        Result := OddFont
      else
        Result := EvenFont
    else
      Result := PreviewFont;
end;

procedure TdxTLReportLinkDesignWindow.dxTLPreviewCustomDrawPreviewCell(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  ASelected: Boolean; var AText: string; var AColor, ATextColor: TColor;
  AFont: TFont; var ADone: Boolean);
var
  AIndex: Integer;
begin
  with TreeListReportLink do 
  begin
    AIndex := GetNodeIndex(ANode);
    if not IsPreviewTransparent(ANode) then
      AColor := GetPreviewColor(AIndex);
    AFont.Assign(GetPreviewFont(ANode, AIndex));
    AFont.Size := 8;
    ATextColor := AFont.Color;
  end;   
end;

procedure TdxTLReportLinkDesignWindow.dxTLPreviewCustomDrawCell(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: string; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  AIndex: Integer;
begin
  AIndex := GetNodeIndex(ANode);
  with TreeListReportLink do 
  begin
    if not IsCellTransparent(ANode) then 
      AColor := GetCellColor(ANode, AColumn.Index, AIndex);
    AFont.Assign(GetNodeFont(ANode, AIndex));
    AFont.Size := 8;
  end;    
end;

procedure TdxTLReportLinkDesignWindow.dxTLPreviewColumn4CustomDrawCell(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: string; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  W, H, Index: Integer;
  S: string;
begin
  Index := ANode.Values[AColumn.Index];
  if TreeListReportLink.GraphicsAsText then
  begin
    SetBkColor(ACanvas.Handle, ColorToRGB(AColor));
    if Index <> -1 then
      S := TreeListReportLink.GraphicAsTextValue
    else  
      S := '';
    ACanvas.TextRect(ARect, ARect.Left + 2, ARect.Top + 1, S);
  end    
  else
  begin
    FillRectColor(ACanvas.Handle, ARect, AColor);
    W := TdxTreeListImageColumn(AColumn).Images.Width;
    H := TdxTreeListImageColumn(AColumn).Images.Height;
    ARect := 
      Bounds(ARect.Left + ((ARect.Right - ARect.Left) - W) div 2, ARect.Top + 1, W, H);
    if Index <> -1 then 
      TdxTreeListImageColumn(AColumn).Images.Draw(ACanvas, ARect.Left, ARect.Top, Index);
  end;
  ADone := True;
end;

const
  TextAlign: array[TAlignment] of UINT = (DT_LEFT, DT_RIGHT, DT_CENTER);

procedure TdxTLReportLinkDesignWindow.dxTLPreviewColumn3CustomDrawCell(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: string; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  DC: HDC;  
begin
  if TreeListReportLink.CheckMarksAsText then
  begin
    DC := ACanvas.Handle;
    FillRectColor(DC, ARect, AColor);
    SetBkMode(DC, Windows.TRANSPARENT);
    DrawText(DC, PChar(AText), Length(AText), ARect, DT_SINGLELINE or TextAlign[taCenter]);
    SetBkMode(DC, Windows.OPAQUE);    
    ADone := True;
  end;  
end;

procedure TdxTLReportLinkDesignWindow.dxTLPreviewCustomDrawColumnHeader(
  Sender: TObject; AColumn: TdxTreeListColumn; ACanvas: TCanvas;
  ARect: TRect; var AText: string; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ASorted: TdxTreeListColumnSort;
  var ADone: Boolean);
var
  DC: HDC;
begin
  if not TreeListReportLink.Use3DEffects then
  begin
    DC := ACanvas.Handle;
    FillRectColor(DC, ARect, AColor);
    if not TdxTreeList(Sender).ShowBands then
      FillRectColor(DC, Rect(ARect.Left, ARect.Top, ARect.Right, ARect.Top + 1), 
        TreeListReportLink.GridLineColor);
    FillRectColor(DC, Rect(ARect.Left, ARect.Bottom - 1, ARect.Right, ARect.Bottom), 
      TreeListReportLink.GridLineColor);
    FillRectColor(DC, Rect(ARect.Right - 1, ARect.Top, ARect.Right, ARect.Bottom), 
      TreeListReportLink.GridLineColor);

    if TdxTreeList(Sender).ShowBands then
      FillRectColor(DC, Rect(ARect.Left + 1, ARect.Top, ARect.Right - 1, ARect.Top + 1), 
        TreeListReportLink.HeaderColor);
    if AColumn.Index > 0 then
      FillRect(DC, Rect(ARect.Left, ARect.Top, ARect.Left + 1, ARect.Bottom), 
        TreeListReportLink.HeaderColor);

    InflateRect(ARect, -1, -1);
    if AColumn.Index = 0 then Dec(ARect.Left);
    FillRectColor(DC, ARect, AColor);
    Inc(ARect.Top);
    Inc(ARect.Left, 2 + Byte(AColumn.Index = 0));
    SetBkMode(DC, Windows.TRANSPARENT);
    DrawText(DC, PChar(AText), Length(AText), ARect, DT_SINGLELINE or TextAlign[AAlignment]);
    ADone := True;
  end;
end;

procedure TdxTLReportLinkDesignWindow.dxTLPreviewCustomDrawBand(
  Sender: TObject; ABand: TdxTreeListBand; ACanvas: TCanvas; ARect: TRect;
  var AText: string; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  DC: HDC;
begin
  DC := ACanvas.Handle;
  if not TreeListReportLink.Use3DEffects then
  begin
    with ARect do
    begin
      FillRectColor(DC, Rect(Left, Bottom - 1, Right, Bottom), TreeListReportLink.GridLineColor);
      FillRectColor(DC, Rect(Right - 1, Top, Right, Bottom), TreeListReportLink.GridLineColor);
    end;
    Dec(ARect.Bottom);
    Dec(ARect.Right);
    FillRectColor(DC, ARect, AColor);
    Inc(ARect.Top);
    SetBkMode(DC, TRANSPARENT);
    DrawText(DC, PChar(AText), Length(AText), ARect, DT_SINGLELINE or TextAlign[AAlignment]);
    ADone := True;
  end;
end;

procedure TdxTLReportLinkDesignWindow.dxTLPreviewCustomDrawFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; var AText: string; var AColor: TColor;
  AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
var
  DC: HDC;
  DrawInfo: TdxGridDrawInfo;
begin
  if not TreeListReportLink.Use3DEffects then
  begin
    DC := ACanvas.Handle;
    InflateRect(ARect, 1, 1);
    FrameRectColor(DC, ARect, TreeListReportLink.GridLineColor);

    if AColumn.Index = 0 then
    begin
      TdxTreeList(Sender).CalcDrawInfo(DrawInfo);
      try
        with DrawInfo.FooterRect do
          FrameRectColor(DC, Rect(Left, Top - 1, Right, Top), TreeListReportLink.GridLineColor);
        InflateRect(DrawInfo.FooterRect, -1, -1);
        FrameRectColor(DC, DrawInfo.FooterRect, AColor);
      finally
        TdxTreeList(Sender).FreeDrawInfo(DrawInfo);
      end;
    end;
    
    InflateRect(ARect, -1, -1);
    FillRectColor(DC, ARect, AColor);
    Inc(ARect.Top);
    Inc(ARect.Left, 2);
    SetBkMode(DC, Windows.TRANSPARENT);
    SelectObject(DC, TreeListReportLink.FooterFont.Handle);
    SetTextColor(DC, ColorToRGB(TreeListReportLink.FooterFont.Color));
    DrawText(DC, PChar(AText), Length(AText), ARect, DT_SINGLELINE or TextAlign[AAlignment]);
    ADone := True;
  end
  else
  begin
    AFont.Assign(TreeListReportLink.FooterFont);
    AFont.Size := 8;
  end;
end;

procedure TdxTLReportLinkDesignWindow.dxTLPreviewCustomDrawFooterNode(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; AFooterIndex: Integer; var AText: string;
  var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
  var ADone: Boolean);
var
  DC: HDC;
begin
  AFont.Assign(TreeListReportLink.RowFooterFont);
  AFont.Size := 8;
  if TreeListReportLink.FixedTransparent then
    AColor := clWindow
  else
    AColor := TreeListReportLink.RowFooterColor;
  DC := ACanvas.Handle;
  InflateRect(ARect, 1, 1);
  if TreeListReportLink.ShowGrid and TreeListReportLink.ShowRowFooterGrid then
    if TreeListReportLink.Use3DEffects then
      DrawEdge(DC, ARect, BDR_SUNKENOUTER, BF_RECT or BF_ADJUST)
    else
      FrameRectColor(DC, ARect, TreeListReportLink.GridLineColor)
  else
    FrameRectColor(DC, ARect, AColor);
  InflateRect(ARect, -1, -1);
  FillRectColor(DC, ARect, AColor);
  Inc(ARect.Top);
  Inc(ARect.Left, 2);
  SetBkMode(DC, Windows.TRANSPARENT);
  DrawText(DC, PChar(AText), Length(AText), ARect, DT_SINGLELINE or TextAlign[AAlignment]);
  ADone := True;
end;

procedure TdxTLReportLinkDesignWindow.dxTLPreviewGetPreviewLineCount(
  Sender: TObject; ANode: TdxTreeListNode; var LCount: Integer);
begin
  if TreeListReportLink <> nil then
    if TreeListReportLink.IsDBGridLink and (ANode.Count > 0) then
      LCount := 0;
end;

procedure TdxTLReportLinkDesignWindow.chbxShowClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  with TreeListReportLink do 
    if TCheckBox(Sender).Checked then
      Options := Options + [TdxTreeListPaintOption(TCheckBox(Sender).Tag)]
    else
      Options := Options - [TdxTreeListPaintOption(TCheckBox(Sender).Tag)];
  Modified := True;
  UpdatePreview;
end;

procedure TdxTLReportLinkDesignWindow.chbxAutoCalcPreviewLinesClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  TreeListReportLink.PreviewLineCount := -Byte(TCheckBox(Sender).Checked);
  TdxPSSpinEdit(sePreviewLineCount).MinValue := -Byte(TreeListReportLink.AutoCalcPreviewLines);
  TdxPSSpinEdit(sePreviewLineCount).Value := -Byte(TreeListReportLink.AutoCalcPreviewLines);
  Modified := True;
end;

procedure TdxTLReportLinkDesignWindow.cbxDrawModeChange(Sender: TObject);
begin
  if LockControlsUpdate then Exit;  
  TreeListReportLink.DrawMode := TdxTreeListDrawMode(TComboBox(Sender).ItemIndex);
  Modified := True;
  UpdatePreview;
end;

procedure TdxTLReportLinkDesignWindow.lblDrawModeClick(Sender: TObject);
begin
  if TLabel(Sender).FocusControl <> nil then
  begin
    ActiveControl := TLabel(Sender).FocusControl;
    if ActiveControl is TComboBox then 
      TComboBox(ActiveControl).DroppedDown := True;
  end;  
end;

initialization
  if not Assigned(FdxTreeListAssignDataProc) then 
    FdxTreeListAssignDataProc := DefaultdxTreeListAssignDataProc;
  if not Assigned(FdxTreeListColumnMapperProc) then     
    FdxTreeListColumnMapperProc := DefaultdxTreeListMapperProc;
    
  dxPSRegisterReportLink(TdxTreeListReportLink, TdxTreeList, TdxTLReportLinkDesignWindow);
  FPicture := TPicture.Create;
  
finalization
  FPicture.Free;
  dxPSUnregisterReportLink(TdxTreeListReportLink, TdxTreeList, TdxTLReportLinkDesignWindow);

end.
