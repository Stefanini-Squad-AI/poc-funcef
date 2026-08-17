unit wwDataInspector;
{
//
// Components : TwwDataInspector
//
// Copyright (c) 1999 by Woll2Woll Software
//
// 11/15/99 - Fix problem for active cell updating in detail query
// 11/18/99 - Make sure this is a valid row when resizing row
// 12/2/99 - Dbl-click should be passed to base class to handle, and
//           dbl-click in customcombo when it does not have focus originally
//           should still work.
// 1/21/2000-Check for nil pointer in SetEditText
// 1/28/2000 - Send to parent form, not parent
// 2/24/00 - Fire OnItemChanged event when exiting control
// 3/6/2000 - Flush changes when expanding
// 3/6/00 - Check for nil active control
// 3/11/00 - Clear modified for inplaceeditor
// 3/21/00 - Honor setting of text for cbsEllipsis combo style when it is bound
// 4/21/00 - Fix expand/collapse button click problem when cell font changed during painting
// 4/25/00 - Make sure Obj is not nil.  This can happen when reassigning the datasource. (PYW)
// 4/26/00 - Check for nil obj in GetField method
// 5/3/00 - Make sure obj.edittext is updated to inplaceeditor's value
//          This is only necessary because when a picture mask is assigned, the obj.edittext
//          is not updated for some reason
// 5/4/00   Unbound with custom control item was losing original text
// 6/23/00 - Handle needs to be created to avoid blank display in some cases
// 7/19/00 - RSW - Don't remove inplaceeditor painting if it has the focus
// 7/19/00 - Richedit paint problem when dragging dialog in front
// 7/20/00 - ovTabToVisibleOnly should use 2nd paramater, not first
// 8/1/00 - ValidateRect put back in to avoid flicker when expanding all
// 8/5/00 - Add method Flush contents to force cell to flush its changes
}

{$i wwIfDef.pas}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, db, dbtables, dbctrls, wwstr, stdctrls, wwcommon, wwdbedit, wwpict, wwsystem,
  wwdbdatetimepicker, wwdbcomb, wwdblook, wwdotdot, wwframe;

type
  TwwInspectorCollection = class;
  TwwDataInspector = class;
  TwwInspectorItem = class;

  TwwDataInspectorDataLink = class(TDataLink)
  private
    FObjectView: TwwDataInspector;
    FInUpdateData: Boolean;
    FModified: Boolean;
  protected
    procedure ActiveChanged; override;
    procedure LayoutChanged; override;
    procedure RecordChanged(Field: TField); override;
    procedure UpdateData; override;
    procedure DataSetChanged; override;

  public
    constructor Create(AObjectView: TwwDataInspector);
    procedure Modified;
    procedure Reset;
    property isFieldModified : boolean read FModified;
  end;

  TwwInspectorPickList = class(TPersistent)
  private
    FItems: TStrings;
    FMapped: boolean;
    FDisplayAsCheckbox: boolean;
    FStyle: TComboBoxStyle;
    FShowMatchText: boolean;
    FAllowClearKey: boolean;
    FButtonStyle: TwwComboButtonStyle;
    FButtonGlyph: TBitmap;
    FButtonWidth: integer;
    procedure SetItems(val: TStrings);
    procedure SetButtonGlyph(Value: TBitmap);
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Items: TStrings read FItems write SetItems;
    property MapList: boolean read FMapped write FMapped default false;
    property Style: TComboBoxStyle read FStyle write FStyle default stdctrls.csDropDown;
    property ShowMatchText: boolean read FShowMatchText write FShowMatchText default true;
    property AllowClearKey: boolean read FAllowClearKey write FAllowClearKey default false;
    property ButtonStyle : TwwComboButtonStyle read FButtonStyle write FButtonStyle default cbsDownArrow;
    property DisplayAsCheckbox : boolean read FDisplayAsCheckbox write FDisplayAsCheckbox default False;
    property ButtonGlyph : TBitmap read FButtonGlyph write SetButtonGlyph;
    property ButtonWidth : integer read FButtonWidth write FButtonWidth default 0;
  end;


  TwwInspectorItemOption = (iioAutoDateTimePicker, iioAutoLookupCombo);
  TwwInspectorItemOptions = set of TwwInspectorItemOption;
  TwwInspectorItemChanged = procedure (
    Sender: TwwDataInspector;
    Item: TwwInspectorItem; NewValue: string) of object;
  TwwInspectorItemNotifyEvent = procedure (
    Sender: TwwDataInspector;
    Item: TwwInspectorItem) of object;
  TwwInspectorNotifyEvent = procedure (Sender: TwwDataInspector) of object;


  TwwInspectorItem = class(TCollectionItem)
  private
    FEditText: string;
    FItems: TwwInspectorCollection;
    FReadOnly: boolean;
    FCustomControlName: TWinControl;
    FCustomControlAlwaysPaints: boolean;
    FCaption: string;
    FCellHeight: integer;
    FDataField: string;
    FDataLink: TFieldDataLink;
    FExpanded: boolean;
    FPickList: TwwInspectorPickList;
    FPicture: TwwDBPicture;
    FParentItem: TwwInspectorItem;
    FResizeable: boolean;
    FVisible: boolean;
    FTag: integer;
    FTagString: string;
    FOptions: TwwInspectorItemOptions;
    FTabStop: boolean;
    FItemChanged: TwwInspectorItemChanged;
    FWordWrap: boolean;
    FDisableDefaultEditor: boolean;

    FOnEditButtonClick: TwwInspectorItemNotifyEvent;
//    procedure ComboDropDownEvent(Sender: TObject);
//    OrigEditText: string;

    procedure SetItems(Value: TwwInspectorCollection);
    function GetDataSource: TDataSource;
    procedure SetDataSource(Value: TDataSource);
    function GetDataField: string;
    procedure SetDataField(const Value: string);
    procedure SetCaption(const Value: string);
    Function GetControl: TComponent;
    Function GetField: TField;
    procedure SetCellHeight(const Value: integer);
    function GetLevel: integer;
    procedure SetCustomControl(val: TWinControl);
    procedure SetVisible(val: boolean);
    procedure SetExpanded(val: boolean);
    function GetChecked: boolean;
    procedure SetChecked(val: boolean);
    function GetDataLink: TDataLink;
    function GetDisplayText: string;
    procedure SetDisplayText(val: string);

  protected
    ButtonPoint: TPoint; { 4/21/00 - Save buttonpt as if user changed font during
                         paint events, then buttonpt would not be consistent.  This
                         fixes problem where button click not being recognized. }
    property DataLink: TDataLink read GetDataLink;
    function HaveItems: boolean; virtual;
    Function GetDesigner: TControl;
    procedure DefineProperties(Filer: TFiler); override;
    procedure DoItemTextChanged; virtual;
    Function UseDefaultComboBox: boolean;
    Function GetMappedPaintText(StoredValue: string): string; virtual;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    Function HaveVisibleItem: boolean;
    function GetDisplayName: string; override;
    function GetNamePath: string; override;
    procedure Assign(Source: TPersistent); override;
    property Field: TField read GetField;
    property Control: TComponent read GetControl;
    property Level: integer read GetLevel;
    property ParentItem : TwwInspectorItem read FParentItem write FParentItem;
    function GetFirstChild(VisibleItemsOnly: boolean = True;
                           ExpandedOnly: boolean = False): TwwInspectorItem;
    function GetLastChild(VisibleItemsOnly: boolean = True;
                          ExpandedOnly: boolean = False): TwwInspectorItem;
    function GetPrior(VisibleItemsOnly: boolean = True;
                      ExpandedOnly: boolean = False): TwwInspectorItem;
    function GetNext(VisibleItemsOnly: boolean = True;
                     ExpandedOnly: boolean = False): TwwInspectorItem;
    function GetNextSibling(VisibleItemsOnly: boolean = True): TwwInspectorItem;
    function GetPriorSibling(VisibleItemsOnly: boolean = True): TwwInspectorItem;
    property Checked: boolean read GetChecked write SetChecked;
    property DisplayText: string read GetDisplayText write SetDisplayText;

  published
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DataField: string read GetDataField write SetDataField;
    property Caption: string read FCaption write SetCaption;
    property CellHeight: integer read FCellHeight write SetCellHeight default 0;
    property EditText: string read FEditText write FEditText; { Design-time settings only applicable if unbound item }

    property ReadOnly: boolean read FReadOnly write FReadOnly default false;
    property CustomControl: TWinControl read FCustomControlName write SetCustomControl;
    property CustomControlAlwaysPaints: boolean read FCustomControlAlwaysPaints write FCustomControlAlwaysPaints default True;
    property Expanded: boolean read FExpanded write SetExpanded default false;
    property PickList: TwwInspectorPickList read FPickList write FPickList;
    property Picture: TwwDBPicture read FPicture write FPicture;
    property Resizeable: boolean read FResizeable write FResizeable default false;
    property Items: TwwInspectorCollection read FItems write SetItems stored HaveItems;
    property Visible : boolean read FVisible write SetVisible default True;
    property Tag: integer read FTag write FTag default 0;
    property TagString: string read FTagString write FTagString;
    property TabStop: boolean read FTAbStop write FTabStop default True;
    property Options: TwwInspectorItemOptions read FOptions write FOptions default [iioAutoDateTimePicker];
    property WordWrap: boolean read FWordWrap write FWordWrap; { 12/11/99 - Removed default as it did not match constructor before }
    property DisableDefaultEditor: boolean read FDisableDefaultEditor write FDisableDefaultEditor default False;

    property OnItemChanged: TwwInspectorItemChanged read
       FItemChanged write FItemChanged;
    property OnEditButtonClick: TwwInspectorItemNotifyEvent read FOnEditButtonClick write FOnEditButtonClick;
  end;

  TwwInspectorCollection = class(TCollection)
  private
    FParentItem: TwwInspectorItem;
    function GetItem(Index: Integer): TwwInspectorItem;
    procedure SetItem(Index: Integer; Value: TwwInspectorItem);
  protected
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;
  public
    Control: TComponent;
    property ParentItem : TwwInspectorItem read FParentItem;

    constructor Create(Control: TComponent);
    destructor Destroy; override;
    function Add: TwwInspectorItem;
    function Insert(index: integer): TwwInspectorItem;
    procedure SaveToStream(s: TStream);
    procedure LoadFromStream(s: TStream);
    procedure SaveToFile(const FileName: string);
    procedure LoadFromFile(const FileName: string);
    property Items[Index: Integer]: TwwInspectorItem read GetItem write SetItem; default;
  end;

  TwwInspectorItemCallback = procedure(obj: TwwInspectorItem;
                           UserData: Pointer; var AContinue: boolean) of object;

  TwwDataInspectorOption = (ovColumnResize, ovRowResize,
     ovTabExits, {ovWordWrap, }
     ovEnterToTab, {ovAllowInsert, }ovHighlightActiveRow,
     ovCenterCaptionVert, {ovCenterCaptionHorz, }ovTabToVisibleOnly);
  TwwDataInspectorOptions = set of TwwDataInspectorOption;
  TwwDataInspectorLineStyle = (ovNoLines, ovDottedLine, ovLight3DLine, ovDark3DLine, ovButtonLine);

  TwwInspectorDrawDataCellEvent = procedure (
    Sender: TwwDataInspector;
    ObjItem: TwwInspectorItem;
    ASelected: boolean;
    ACellRect: TRect;
    var DefaultDrawing: boolean) of object;

  TwwInspectorDrawCaptionEvent = procedure (
    Sender: TwwDataInspector;
    ObjItem: TwwInspectorItem;
    ASelected: boolean;
    ACellRect: TRect;
    var ACaptionRect: TRect;
    var DefaultTextDrawing: boolean) of object;

  TwwDataInspectorEdit = class(TInplaceEdit)
    private
      FwwPicture: TwwDBPicture;
      FWordWrap: boolean;
      ParentGrid: TwwDataInspector;
      FUsePictureMask: boolean;

      procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
      procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
      procedure WMPaste(var Message: TMessage); message WM_PASTE;  {10/28/96 }
      procedure CMExit(var Message: TMessage); message CM_EXIT;

    protected
      procedure BoundsChanged; override;
      procedure KeyDown(var Key: Word; Shift: TShiftState); override;
      procedure CreateParams(var Params: TCreateParams); override;
      procedure KeyUp(var Key: Word; Shift: TShiftState); override;
      procedure KeyPress(var Key: Char); override;
      procedure SetWordWrap(val: boolean);
      procedure UpdateContents; override;
    public
      constructor wwCreate(AOwner: TComponent; dummy: integer); virtual;
      destructor Destroy; override;
      function IsValidPictureValue(s: string): boolean;
      Function HavePictureMask: boolean;

      property Picture: TwwDBPicture read FwwPicture write FwwPicture;
      property WordWrap: boolean read FWordWrap write SetWordWrap;
      property Color;
      property Font;
    end;

  TwwInspectorFieldChangedEvent =
      procedure (Sender: TwwDataInspector; Field: TField) of object;
  TwwInspectorCreateDTPEvent = procedure(Sender: TwwDataInspector;
       ADateTimePicker: TwwDBCustomDateTimePicker) of object;
  TwwInspectorCreateComboEvent = procedure(Sender: TwwDataInspector;
       Combo: TwwDBComboBox) of object;
  TwwInspectorBeforeSelectCellEvent = procedure (Sender: TwwDataInspector;
     ObjItem: TwwInspectorItem; var CanSelect: boolean) of object;
  TwwInspectorAfterSelectCellEvent = procedure (Sender: TwwDataInspector;
     ObjItem: TwwInspectorItem) of object;

  TwwInspectorCanExpandEvent = procedure (Sender: TwwDataInspector;
     ObjItem: TwwInspectorItem; var CanExpand: boolean) of object;
  TwwInspectorCanCollapseEvent = procedure (Sender: TwwDataInspector;
     ObjItem: TwwInspectorItem; var CanCollapse: boolean) of object;
  TwwInspectorExpandedEvent = procedure (Sender: TwwDataInspector;
     ObjItem: TwwInspectorItem) of object;
  TwwInspectorCollapsedEvent = procedure (Sender: TwwDataInspector;
     ObjItem: TwwInspectorItem) of object;

//  TwwDrawGrid = class(TCustomGrid)
//private
//  FOnDrawCell: TDrawCellEvent;
//  FOnTopLeftChanged: TNotifyEvent;
//  protected
//    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
//      AState: TGridDrawState); override;
//    procedure TopLeftChanged; override;
//    function IsActiveControl: Boolean;
//    procedure ChangeOrientation(RightToLeftOrientation: Boolean);
//    procedure Paint; override;
{  public
    procedure MouseToCell(X, Y: Integer; var ACol, ARow: Longint);
    property Canvas;
    property Col;
    property ColWidths;
    property EditorMode;
    property GridHeight;
    property GridWidth;
    property LeftCol;
    property Selection;
    property Row;
    property RowHeights;
    property TabStops;
    property TopRow;
    property RowCount;}
//  end;

  TwwInspectorTabSetFocusStyle = (itsPreserveActiveItem, itsResetActiveItem);
  TwwInspectorButtonOptions = class(TPersistent)
  private
     FExpandGlyph: TBitmap;
     FCollapseGlyph: TBitmap;
     Control: TWinControl;
     FTransparentGlyphs: boolean;
     procedure SetExpandGlyph(Value: TBitmap);
     procedure SetCollapseGlyph(Value: TBitmap);
  public
     constructor Create(AOwner: TComponent);
     destructor Destroy; override;
  published
     property ExpandGlyph: TBitmap read FExpandGlyph write SetExpandGlyph;
     property CollapseGlyph: TBitmap read FCollapseGlyph write SetCollapseGlyph;
     property TransparentGlyphs: Boolean read FTransparentGlyphs write FTransparentGlyphs default false;
  end;

  TwwInspectorPaintTextEvent = procedure (Sender: TwwDataInspector; Item: TwwInspectorItem; var PaintText: string) of object;
  TwwInspectorValidationError = procedure (Sender: TwwDataInspector;
     Item: TwwInspectorItem; var Msg: string; var DoDefault: boolean) of object;


  TwwDataInspector = class(TCustomGrid)
  private
//     FOnDrawCell: TDrawCellEvent;
     FOnDrawDataCell: TwwInspectorDrawDataCellEvent;
     FOnTopLeftChanged: TNotifyEvent;

     FOptions: TwwDataInspectorOptions;
     FDesigner: TControl;
     FItems: TwwInspectorCollection;

     FDataLink: TwwDataInspectorDataLink;
     FCaptionWidth: integer;
     FInactiveFocusColor: TColor;

     FEditText: string;
     FSizingIndex: integer;
     FSizingPos, FSizingOfs: Integer;
//     FWordWrap: Boolean;
     FOnCheckValue: TwwValidateEvent;
     FOnFieldChanged: TwwInspectorFieldChangedEvent;
     FOnItemChanged: TwwInspectorItemChanged;
     FReadOnly: boolean;
     FCaptionIndent: integer;
     FDateTimePicker: TwwDBCustomDateTimePicker;
     FCombo: TwwDBComboBox;
     FOnCreateDateTimePicker: TwwInspectorCreateDTPEvent;
     FOnCreateDefaultCombo: TwwInspectorCreateComboEvent;
     FPictureMaskFromDataSet: boolean;
     FDefaultRowHeight: integer;
     FCaptionFont: TFont;
     FLineStyleData: TwwDataInspectorLineStyle;
     FLineStyleCaption: TwwDataInspectorLineStyle;
     FDottedLineColor: TColor;
     FUpdateCount: Integer;
     InvalidateInEndUpdate: boolean;
     FButtonOptions: TwwInspectorButtonOptions;
     FSetFocusTabStyle : TwwInspectorTabSetFocusStyle;

     FOnDrawCaptionCell: TwwInspectorDrawCaptionEvent;
     FOnBeforePaint: TwwInspectorNotifyEvent;
     FOnGetEditMask: TGetEditEvent;
     FOnBeforeSelectCell: TwwInspectorBeforeSelectCellEvent;
     FOnAfterSelectCell: TwwInspectorAfterSelectCellEvent;
     FOnCanExpand: TwwInspectorCanExpandEvent;
     FOnCanCollapse: TwwInspectorCanCollapseEvent;
     FOnExpanded : TwwInspectorExpandedEvent;
     FOnCollapsed : TwwInspectorCollapsedEvent;
     FOnCalcDataPaintText: TwwInspectorPaintTextEvent;
     FOnValidationErrorUsingMask: TwwInspectorValidationError;

     TextIsSame: boolean;
//     SkipDisplayCustomControl: boolean;
     LastDefaultRowHeight: integer;
     SkipErase: boolean;
     CheckRowCount: boolean;

     FPaintCanvas: TCanvas;
     FPaintBitmap: TBitmap;
     UseTempCanvas: boolean;
     OldDesigning: boolean;
     ExtraPaintList: TList;
     LastActiveItem: TwwInspectorItem;

     FActiveItem, FTopItem: TwwInspectorItem;
     FMinRowHeight: integer;
     OldTopRow: integer;
     DoBeginUpdateInSelectCell: boolean;
     SelectCellUpdateRect: TRect;
     ChildDataChanged: boolean; // 2/10/2000 - Clear inplaceeditor if child datalink is changed.
//     DirtyCustomInfo: boolean;

     procedure SetDataSource(value : TDataSource);
     Function GetDataSource: TDataSource;
     procedure SetCaptionWidth(value: integer);
     procedure FieldChanged(Field: TField);

     procedure RecordChanged(Field: TField);
     procedure UpdateData;
     function GetPageHeight: integer;
     function InValidColSizingArea(x: integer): boolean;
     function GetDateTimePicker: TwwDBCustomDateTimePicker;

     procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
     procedure WMSize(var Message: TWMSize); message WM_SIZE;
     procedure WMSetFocus(var Msg: TWMSetFocus); message WM_SETFOCUS;
     procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
     procedure CMExit(var Message: TMessage); message CM_EXIT;
     procedure WMSetCursor(var Msg: TWMSetCursor); message WM_SETCURSOR;
     procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBkgnd;
     procedure WMChar(var Msg: TWMChar); message WM_CHAR;
     procedure WMPaint(var Message: TWMPaint); message WM_PAINT;

//     procedure SetSizingWidth(val: integer);
     Procedure GetActiveItemCallback(
       Item: TwwInspectorItem;
       UserData: Pointer; var AContinue: boolean);
     Procedure GetActiveRowsCallback(
       Item: TwwInspectorItem;
       UserData: Pointer; var AContinue: boolean);
     Procedure ApplySettingsCallback(
       Item: TwwInspectorItem;
       UserData: Pointer; var AContinue: boolean);
     Procedure LinkActiveCallback(
       Item: TwwInspectorItem;
       UserData: Pointer; var AContinue: boolean);
     Function GetActiveRows: integer;
     procedure SetCaptionIndent(val: integer);

     procedure SetItems(Value: TwwInspectorCollection);
     procedure SetOptions(Value: TwwDataInspectorOptions);
     procedure SetDefaultRowHeight(Value: integer);
     procedure SetCaptionFont(Value: TFont);
     procedure CaptionFontChanged(Sender: TObject);
     procedure ToggleCheckbox(obj: TwwInspectorItem);
     procedure SetLineStyleCaption(val: TwwDataInspectorLineStyle);
     procedure SetLineStyleData(val: TwwDataInspectorLineStyle);
     procedure SetUpdateState(Updating: Boolean);
     function isFocused: boolean;
     Procedure SetActiveItem(obj: TwwInspectorItem);
     function GetActiveItem: TwwInspectorItem;
     function GetCaptionColor: TColor;
     procedure SetCaptionColor(val: TColor);
     Function GetTopItem: TwwInspectorItem;
     procedure UpdateRowCount;
     procedure EditDataLinkDataChange(Sender: TObject);
     procedure EditDataLinkUpdateData(Sender: TObject);
     Function GetActiveEdit: TWinControl;
     procedure SetDottedLineColor(val: TColor);
  protected
    CurrentCustomEdit: TWinControl; //CustomEdit;
    CurrentCustomEditRow: integer;
    InTracking: boolean;
    FFocused: boolean;
    FastDesign: boolean;  { Need to test more with this as true }

//    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
//      AState: TGridDrawState); override;
//    procedure TopLeftChanged; override;
    function IsActiveControl: Boolean;
    procedure ChangeOrientation(RightToLeftOrientation: Boolean);
    procedure InheritedPaint;
    procedure FirstTimePaint; virtual;
//    procedure Paint; override;

    procedure SetDesigner(Value: TControl); virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function CreateDateTimePicker: TwwDBCustomDateTimePicker; virtual;
    function CreateDefaultCombo: TwwDBComboBox; virtual;
    procedure DoCreateDateTimePicker(ADateTimePicker: TwwDBCustomDateTimePicker); virtual;
    procedure DoCreateDefaultCombo(ACombo: TwwDBComboBox); virtual;
    procedure LinkActive(Value: Boolean); virtual;
    function CanEditModify: Boolean; override;
    procedure DoFieldChanged(Field: TField); virtual;
    procedure DoItemChanged(Item: TwwInspectorItem; NewValue: string); virtual;

    function CreateEditor: TInplaceEdit; override;
    procedure DoExit; override;
    procedure TopLeftChanged; override;
    function CanEditShow: Boolean; override;
    procedure DrawCell(ACol, ARow: Integer; ARect: TRect; AState: TGridDrawState); override;
    property DataLink: TwwDataInspectorDataLink read FDataLink;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
         X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
         X, Y: Integer); override;
    procedure CalcSizingState(X, Y: Integer; var State: TGridState;
      var Index: Longint; var SizingPos, SizingOfs: Integer;
      var FixedInfo: TGridDrawInfo); override;
    procedure UpdateDataColumnWidth; virtual;
    procedure CreateParams(var Params: TCreateParams); override;
    function GetEditText(ACol, ARow: Longint): string; override;
    function GetEditMask(ACol, ARow: Longint): string; override;
    procedure SetEditText(ACol, ARow: Longint; const Value: string); override;
    procedure Loaded; override;
//    procedure GetFieldInfo(ARow: integer;
//        var FieldInfo: TwwObjectFieldInfo); virtual;
    function AcquireFocus: Boolean; virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Paint; override;
    procedure SetFocusCell(ACol, ARow: integer); virtual;
    function SelectCell(ACol, ARow: Longint): Boolean; override;
    procedure DataChanged; virtual;
    function GetField(ARow: integer): TField;
    function UseDefaultEditor: boolean; virtual;
    function UseCheckbox(ARow: integer): boolean; virtual;
    function ButtonPt(ARect: TRect; Obj: TwwInspectorItem): TPoint; virtual;
    function CheckboxRect(ARect: TRect; Obj: TwwInspectorItem): TRect; virtual;
    procedure DrawSizingLine(const DrawInfo: TGridDrawInfo);
    procedure RowHeightsChanged; override;
    procedure DoDrawDataCell(ObjItem: TwwInspectorItem;
       ASelected: boolean;
       ACellRect: TRect;
       var DefaultDrawing: boolean); virtual;
    procedure DoDrawCaptionCell(ObjItem: TwwInspectorItem;
       ASelected: boolean;
       ACellRect: TRect;
       var ACaptionRect: TRect;
       var DefaultTextDrawing: boolean); virtual;
     Function GetCanvas: TCanvas; virtual;
     Function IsDefaultDateTimePicker(Obj: TwwInspectorItem): boolean;
     Function IsDefaultLookupCombo(Obj: TwwInspectorItem): boolean;
     procedure DoCollapse(ObjItem: TwwInspectorItem); virtual;
     procedure DoExpand(ObjItem: TwwInspectorItem); virtual;
    procedure Click; override;
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    procedure DoCalcDataPaintText(item: TwwInspectorItem; var PaintText: string); virtual;
//    procedure PictureValidateError;
    procedure ValidationErrorUsingMask(Item: TwwInspectorItem); virtual;
    property InactiveFocusColor: TColor read FInactiveFocusColor write FInactiveFocusColor default clNone;
    property TopItem: TwwInspectorItem read GetTopItem; { Currently not implemented so leave as protected }

  public
//     property Canvas;
     property Col;
     property ColWidths;
     property EditorMode;
     property GridHeight;
     property GridWidth;
     property LeftCol;
     property Selection;
     property Row;
     property RowHeights;
     property TabStops;
     property TopRow;
     property RowCount;
     property ActiveEdit: TWinControl read GetActiveEdit;

     property DefaultDateTimePicker: TwwDBCustomDateTimePicker read GetDateTimePicker;
     property DefaultCombo: TwwDBComboBox read FCombo;
     property Canvas: TCanvas read GetCanvas;

     procedure MouseToCell(X, Y: Integer; var ACol, ARow: Longint);
     function MouseToItem(X, Y: Integer): TwwInspectorItem;
     function RefreshActiveItem: TwwInspectorItem;
     procedure BeginUpdate;
     procedure EndUpdate(Repaint: boolean = false);
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
     procedure ApplySettings;
     procedure RefreshItem(Item: TwwInspectorItem); virtual;
//     procedure Click; override;
     Function GetRowByItem(AItem: TwwInspectorItem): integer; virtual;
     procedure IterateItems(CallBack: TwwInspectorItemCallback;
                 ExpandedOnly: boolean; UserData: Pointer);
     procedure InvalidateRow(ARow: integer);
//     procedure RefreshCustomControl;
     Function GetItemByFieldName(AFieldName: string): TwwInspectorItem;
     Function GetItemByRow(ARow: integer; Optimize: boolean = True): TwwInspectorItem; virtual;
     Function GetItemByCaption(ACaption: string): TwwInspectorItem;
     Function GetItemByTagString(ATagString: string): TwwInspectorItem;
     Function HaveVisibleItem: boolean;
     function GetFirstChild(VisibleItemsOnly: boolean = True): TwwInspectorItem;
     procedure FlushContents; // 8/5/00 New method
     property Designer: TControl read FDesigner write SetDesigner;
     property ActiveRows: integer read GetActiveRows;
     property InplaceEditor;
     property ActiveItem: TwwInspectorItem read GetActiveItem write SetActiveItem;
//     property DefaultDrawing;
     { Perhaps publish later, but this event seems unncessary as the OnItemChanged event can do the job }
     property OnFieldChanged: TwwInspectorFieldChangedEvent read FOnFieldChanged write FOnFieldChanged;

  published
     property Align;
     property Anchors;
     property BiDiMode;
     property BorderStyle;
     property Color default clBtnFace;
     property Constraints;
     property Ctl3D;
//     property DefaultDrawing;
     property DragCursor;
     property DragKind;
     property DragMode;
     property Enabled;
     property CaptionColor : TColor read GetCaptionColor write SetCaptionColor default clBtnFace;
//     property FixedColor;
     property Font;
     property ParentBiDiMode;
     property ParentColor;
     property ParentCtl3D;
     property ParentFont;
     property ParentShowHint;
     property PopupMenu;
     property ScrollBars default ssVertical;
     property ShowHint;
     property TabOrder;
     property TabStop;
     property PictureMaskFromDataSet: boolean read FPictureMaskFromDataSet write FPictureMaskFromDataSet;
     property DataSource: TDataSource read GetDataSource write SetDataSource;
     property Items: TwwInspectorCollection read FItems write SetItems;
     property DefaultRowHeight: integer read FDefaultRowHeight write SetDefaultRowHeight default 0;
     property CaptionWidth: integer read FCaptionWidth write SetCaptionWidth;
//     property WordWrap : boolean read FWordWrap write FWordWrap;
     property Options: TwwDataInspectorOptions read FOptions write SetOptions;
     property CaptionFont: TFont read FCaptionFont write SetCaptionFont;
     property LineStyleCaption: TwwDataInspectorLineStyle read FLineStyleCaption write SetLineStyleCaption default ovDark3DLine;
     property LineStyleData: TwwDataInspectorLineStyle read FLineStyleData write SetLineStyleData default ovDark3DLine;
     property DottedLineColor: TColor read FDottedLineColor write SetDottedLineColor default clBtnShadow;
//     property InactiveFocusColor: TColor read FInactiveFocusColor write FInactiveFocusColor default clNone;
     property ButtonOptions: TwwInspectorButtonOptions read FButtonOptions write FButtonOptions;
     property ReadOnly: Boolean read FReadOnly write FReadOnly default False;
     property CaptionIndent: integer read FCaptionIndent write SetCaptionIndent default 12;
     property SetFocusTabStyle : TwwInspectorTabSetFocusStyle read FSetFocusTabStyle write FSetFocusTabStyle default itsPreserveActiveItem;
     property Visible;

     property OnClick;
     property OnDblClick;
     property OnDragDrop;
     property OnDragOver;
     property OnDrawDataCell: TwwInspectorDrawDataCellEvent read FOnDrawDataCell write FOnDrawDataCell;
     property OnEndDock;
     property OnEndDrag;
     property OnEnter;
     property OnExit;
     property OnKeyDown;
     property OnKeyPress;
     property OnKeyUp;
     property OnMouseDown;
     property OnMouseMove;
     property OnMouseUp;
     property OnMouseWheelDown;
     property OnMouseWheelUp;
     property OnBeforeSelectCell: TwwInspectorBeforeSelectCellEvent read FOnBeforeSelectCell write FOnBeforeSelectCell;
     property OnAfterSelectCell: TwwInspectorAfterSelectCellEvent read FOnAfterSelectCell write FOnAfterSelectCell;
     property OnStartDock;
     property OnStartDrag;
     property OnTopLeftChanged: TNotifyEvent read FOnTopLeftChanged write FOnTopLeftChanged;

     property OnCreateDateTimePicker: TwwInspectorCreateDTPEvent
             read FOnCreateDateTimePicker write FOnCreateDateTimePicker;
     property OnCreateDefaultCombo: TwwInspectorCreateComboEvent
             read FOnCreateDefaultCombo write FOnCreateDefaultCombo;
     property OnDrawCaptionCell: TwwInspectorDrawCaptionEvent
        read FOnDrawCaptionCell write FOnDrawCaptionCell;
     property OnBeforePaint : TwwInspectorNotifyEvent read FOnBeforePaint write FOnBeforePaint;
     property OnCanExpand: TwwInspectorCanExpandEvent read FOnCanExpand write FOnCanExpand;
     property OnCanCollapse: TwwInspectorCanCollapseEvent read FOnCanCollapse write FOnCanCollapse;
     property OnExpanded : TwwInspectorExpandedEvent read FOnExpanded write FOnExpanded;
     property OnCollapsed : TwwInspectorCollapsedEvent read FOnCollapsed write FOnCollapsed;
//     property OnCheckValue: TwwValidateEvent read FOnCheckValue write FOnCheckValue;
     property OnItemChanged: TwwInspectorItemChanged read FOnItemChanged write FOnItemChanged;
//     property OnGetEditMask: TGetEditEvent read FOnGetEditMask write FOnGetEditMask;
     property OnCalcDataPaintText: TwwInspectorPaintTextEvent read FOnCalcDataPaintText write FOnCalcDataPaintText;
     property OnValidationErrorUsingMask: TwwInspectorValidationError
               read FOnValidationErrorUsingMask
               write FOnValidationErrorUsingMask;
  end;

 { 12/15/99 - Support dbl-click }
 TwwInspectorComboBox = class(TwwDBComboBox)
   private
     Inspector: TwwDataInspector;
   protected
     FClickTime: integer;
     procedure CloseUp(Accept: boolean); override;
     procedure DblClick; override;
     procedure WndProc(var Message: TMessage); override;
   public
     procedure DropDown; override;
     constructor Create(AOwner: TComponent); override;
 end;

procedure Register;

implementation

uses consts;


  procedure TwwInspectorComboBox.WndProc(var Message: TMessage);
  begin
    case Message.Msg of
      WM_LBUTTONDOWN:
        begin
          if UINT(GetMessageTime - FClickTime) < GetDoubleClickTime then
           Message.Msg := WM_LBUTTONDBLCLK;
          FClickTime := 0;
        end;
    end;
    inherited WndProc(Message);
  end;

 procedure TwwInspectorComboBox.DblClick;
 begin
   inherited;
   Inspector.DblClick;
 end;

 constructor TwwInspectorComboBox.Create(AOwner: TComponent);
 begin
    inherited Create(AOwner);
    TabStop:= false;
    Inspector:= AOwner as TwwDataInspector;
 end;

 procedure TwwInspectorComboBox.CloseUp(Accept: boolean);
 var WasDroppedDown: boolean;
     OldEditText: string;
 begin
     WasDroppedDown:= IsDroppedDown;
     if Inspector.ActiveItem<>nil then
        OldEditText:= Inspector.ActiveItem.EditText
     else OldEditText:= '';
     inherited CloseUp(Accept);
     if Accept and WasDroppedDown then begin
       if Inspector.ActiveItem=nil then exit;
       Inspector.ActiveItem.editText:= GetComboValue(Text);
       if OldEditText<>Inspector.ActiveItem.EditText then
         Inspector.ActiveItem.DoItemTextChanged;
     end
 end;

procedure TwwInspectorComboBox.DropDown;
begin
   with Inspector.ActiveItem do begin
     if Assigned(FOnEditButtonClick) then
     begin
       FOnEditButtonClick(Inspector, Inspector.ActiveItem);
       if Inspector.CurrentCustomEdit is TwwDBComboBox then begin
         if (TwwDBComboBox(Inspector.CurrentCustomEdit).buttonStyle=cbsellipsis) then
         begin
            if Inspector.CanEditModify then begin { 3/21/00 - Check text property for cbsEllipsis style }
               EditText:= TwwDBComboBox(Inspector.CurrentCustomEdit).value;
               Inspector.FEditText:=EditText;
            end
         end
         else
            EditText:= TwwDBComboBox(Inspector.CurrentCustomEdit).value;
       end
     end
     else inherited DropDown;
   end
end;

procedure TwwDataInspectorDataLink.DataSetChanged;
begin
  FObjectView.DataChanged;
  FModified := False;
end;

procedure TwwDataInspectorDataLink.Modified;
begin
  FModified := True;
end;

procedure TwwDataInspectorDataLink.Reset;
begin
  if FModified then begin
     RecordChanged(nil);
     FObjectView.InvalidateEditor;
  end
  else exit;
{  else begin
     if ((DataSource.DataSet.State = dsEdit) or (DataSource.DataSet.State = dsInsert)) and
	 dataSet.modified then
     begin
	 if MessageDlg(wwInternational.UserMessages.wwDBGridDiscardChanges,
		    mtConfirmation, [mbYes,mbNo], 0)<>mrYes then exit;
     end;
     Dataset.Cancel;
  end}
end;

procedure TwwDataInspectorDataLink.UpdateData;
begin
  FInUpdateData := True;
  try
    if FModified then FObjectView.UpdateData;
    FModified := False;
  finally
    FInUpdateData := False;
  end;
end;

constructor TwwDataInspectorDataLink.Create(AObjectView: TwwDataInspector);
begin
  inherited Create;
  FObjectView:= AObjectView;
  VisualControl:= true;
end;

procedure TwwDataInspectorDataLink.RecordChanged(Field: TField);
begin
  if (Field = nil) or not FInUpdateData then
  begin
    FObjectView.RecordChanged(Field);
    FModified := False;
  end;

  if (Field<>Nil) and (Dataset.State in [dsEdit, dsInsert]) then
  begin
     FObjectView.FieldChanged(Field);
     FObjectView.TextIsSame:= True;
  end
end;

procedure TwwDataInspectorDataLink.LayoutChanged;
begin
  { 11/15/99 - Fixes problem for active cell updating in detail query }
  FObjectView.InvalidateEditor;
  FObjectView.invalidate;
//  FRecordViewPanel.LinkActive(Active);
end;

procedure TwwDataInspectorDataLink.ActiveChanged;
begin
   FObjectView.LinkActive(Active);
end;


{ TDrawGrid }

Function TwwDataInspector.MouseToItem(X, Y: Integer): TwwInspectorItem;
var ACol, ARow: integer;
begin
   MouseToCell(X, Y, ACol, ARow);
   result:= GetItemByRow(ARow);
end;

procedure TwwDataInspector.MouseToCell(X, Y: Integer; var ACol, ARow: Longint);
var
  Coord: TGridCoord;
begin
  Coord := MouseCoord(X, Y);
  ACol := Coord.X;
  ARow := Coord.Y;
end;


Function GetCenterPoint(ARect: TRect): TPoint;
var r: TRect;
begin
   r:= ARect;
   result.y:= r.Top + (wwRectHeight(r)) div 2;
   result.x:= r.Left + (wwRectWidth(r)) div 2;
end;

constructor TwwDataInspector.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  SetFocusTabStyle := itsPreserveActiveItem;
  Color:= clBtnFace;
  ScrollBars:= ssVertical;
  FLineStyleData:= ovDark3DLine;
  FlineStyleCaption:= ovDark3DLine;
  FPaintBitmap:= TBitmap.create;
  FPaintCanvas:= FPaintBitmap.Canvas;
  FSaveCellExtents:= false;

  FDottedLineColor:= clBtnShadow;
  FDataLink:= TwwDataInspectorDataLink.create(self);
  FItems:= TwwInspectorCollection.Create(self);
//  FSelected:= TStringList.create;
//  FControlType:= TStringList.create;
  FixedCols:= 0;
  FCaptionIndent:= 12;
  ColCount:= 2;
  RowCount:= 1;
  FixedRows:= 0;
  FCaptionWidth:= 100;

  inherited Options := [goColSizing,
     goTabs, goEditing, goAlwaysShowEditor];
  Options:= [ovColumnResize, ovRowResize, ovHighlightActiveRow,
             ovCenterCaptionVert, ovEnterToTab];

  DefaultDrawing := False;

  FCaptionFont := TFont.Create;
  FCaptionFont.OnChange := CaptionFontChanged;
  FInactiveFocusColor:= clNone;
  ExtraPaintList:= TList.create;
  FButtonOptions:= TwwInspectorButtonOptions.create(self);

end;

destructor TwwDataInspector.Destroy;
begin
  if Designer <> nil then Designer.Free;
  ExtraPaintList.Free;
  FDesigner:= nil;
  FItems.Free;

  FCaptionFont.Free;
  FCaptionFont:= Nil;

  FDataLink.free;
  FDataLink:= nil;
  FPaintBitmap.Free;
  FButtonOptions.Free;

  inherited;
end;

procedure TwwDataInspector.SetItems(Value: TwwInspectorCollection);
begin
  FItems.Assign(Value);
//  RowCount:= ActiveRows;
end;

procedure TwwDataInspector.SetDataSource(value : TDataSource);
begin
   FDataLink.dataSource:= value;
end;

Function TwwDataInspector.GetDataSource: TDataSource;
begin
   Result:= FdataLink.dataSource as TDataSource;
end;


Function TwwDataInspector.GetRowByItem(AItem: TwwInspectorItem): integer;
var curIndex, i: integer;
    found: boolean;
  function Scan(Item: TwwInspectorItem): boolean;
  var i: Integer;
  begin
     Result:= True;
     if Item=AItem then exit;
     inc(curIndex);
     if Item.Expanded then
     begin
        for i:= 0 to Item.Items.Count-1 do
           if Item.Items[i].visible and Scan(Item.Items[i]) then begin
              result:= True;
              exit;
           end
     end;
     result:=False;
  end;
begin
   curIndex:= 0;
   found:= false;
   for i:= 0 to Items.count-1 do
      if Items[i].visible and Scan(Items[i]) then begin
         found:= True;
         break;
      end    ;
   if not found then curIndex:= -1;
   Result:= curIndex;
end;

Procedure TwwDataInspector.GetActiveRowsCallback(Item: TwwInspectorItem; UserData: Pointer; var AContinue: boolean);
begin
   if Item.visible then
      PInteger(UserData)^:= PInteger(UserData)^+1;
end;

Procedure TwwDataInspector.GetActiveItemCallback(Item: TwwInspectorItem; UserData: Pointer; var AContinue: boolean);
begin
   if Item.visible then
   begin
      if PInteger(UserData)^=Row then begin
         AContinue:= false;
         FActiveItem:= Item;
      end
      else PInteger(UserData)^:= PInteger(UserData)^+1;
   end
end;

Function TwwDataInspector.GetActiveRows: integer;
var ActiveRowCount: integer;
begin
   ActiveRowCount:= 0;
   IterateItems(GetActiveRowsCallBack, True, @ActiveRowCount);
   Result:= ActiveRowCount;
end;

Function TwwDataInspector.RefreshActiveItem: TwwInspectorItem;
var ActiveRowCount: integer;
begin
   if FastDesign then
   begin
      ActiveRowCount:= 0;
      IterateItems(GetActiveItemCallBack, True, @ActiveRowCount);
      Result:= FActiveItem;
   end
   else result:= ActiveItem;
end;

function TwwDataInspector.GetFirstChild(VisibleItemsOnly: boolean = True): TwwInspectorItem;
var i: integer;
begin
   result:= nil;

   for i:= 0 to Items.count-1 do begin
      if (not VisibleItemsOnly) or TwwInspectorItem(Items[i]).visible then begin
         result:= TwwInspectorItem(Items[i]);
         break;
      end
   end;
end;

Function TwwDataInspector.GetTopItem: TwwInspectorItem;
begin
  if FTopItem=nil then
  begin
     FTopItem:= GetFirstChild;
  end;

  if not FastDesign then
  begin
     FTopItem:= GetItemByRow(TopRow);
  end;

  result:= FTopItem;
end;

Function TwwDataInspector.GetItemByRow(ARow: integer; Optimize: boolean = True): TwwInspectorItem;
var curIndex: integer;
    RetObjItem: TwwInspectorItem;
    i: integer;

  function Scan(Item: TwwInspectorItem): boolean;
  var i: Integer;
  begin
     if not Item.visible then begin
        Result:= False;
        exit;
     end;

     Result:= True;

     inc(curIndex);
     if curIndex=ARow then
     begin
        RetObjItem:= Item;
        exit;
     end;
     if Item.Expanded then
     begin
        for i:= 0 to Item.Items.Count-1 do
           if Scan(Item.Items[i]) then break;
     end;
     result:=False;
  end;

begin
   if Optimize and FastDesign then
   begin
      if ARow=Row then begin
         result:= ActiveItem;
         exit;
      end
      else if (ARow>=TopRow) and (ARow<=TopRow+100) then
      begin
         retObjItem:= TopItem;
         if retObjItem<>nil then begin
            for i:= 1 to ARow-TopRow do
               retObjItem:= retObjItem.GetNext(True);
         end;
         result:= retObjItem;
         exit;
      end
   end;

   if Row<0 then begin
      result:= nil;
      exit;
   end;

   curIndex:= -1;
   retObjItem:= nil;
   for i:= 0 to Items.count-1 do
      if Scan(Items[i]) then break;
   result:= retObjItem;
end;

Function TwwDataInspector.GetItemByCaption(ACaption: string): TwwInspectorItem;
var
    curItem: TwwInspectorItem;
begin
    result:= nil;
    curItem:= GetFirstChild(False);
    ACaption:= AnsiUppercase(ACaption);

    while curItem<>nil do
    begin
       if AnsiUppercase(curItem.caption) = ACaption then
       begin
          result:= curItem;
          break;
       end;
       curItem:= curItem.GetNext(False);
    end;
end;

Function TwwDataInspector.GetItemByTagString(ATagString: string): TwwInspectorItem;
var
    curItem: TwwInspectorItem;
begin
    result:= nil;
    curItem:= GetFirstChild(False);
    ATagString:= AnsiUppercase(ATagString);

    while curItem<>nil do
    begin
       if AnsiUppercase(curItem.tagstring) = ATagString then
       begin
          result:= curItem;
          break;
       end;
       curItem:= curItem.GetNext(False);
    end;
end;

Function TwwDataInspector.GetItemByFieldName(AFieldName: string): TwwInspectorItem;
var
    curItem: TwwInspectorItem;
begin
    result:= nil;
    curItem:= GetFirstChild(False);
    AFieldName:= AnsiUppercase(AFieldName);

    while curItem<>nil do
    begin
       if AnsiUppercase(curItem.datafield) = AFieldName then
       begin
          result:= curItem;
          break;
       end;
       curItem:= curItem.GetNext(False);
    end;
end;

function TwwDataInspector.ButtonPt(ARect: TRect; Obj: TwwInspectorItem): TPoint;
var pt: TPoint;
    MinY: integer;
    tempHeight: integer;
begin
   if Obj=nil then exit;

   if ovCenterCaptionVert in Options then
   begin
      MinY:= (Canvas.TextHeight('Y')+2) div 2;
      pt.y:= ARect.Top + wwMax(MinY, (ARect.Bottom-ARect.Top-2) div 2);
   end
   else begin

      tempHeight:= Canvas.TextHeight('Y')+2;
      if (not obj.Expanded) and (ButtonOptions.ExpandGlyph.Handle<>0) then
         tempHeight:= wwMax(ButtonOptions.ExpandGlyph.Height, tempHeight)
      else if (Obj.Expanded) and (ButtonOptions.CollapseGlyph.Handle<>0) then
         tempHeight:= wwMax(ButtonOptions.CollapseGlyph.Height, tempHeight);

      pt.y:= ARect.Top + (TempHeight) div 2;
   end;
   pt.x:= ARect.Left +(Obj.Level)*CaptionIndent + (CaptionIndent div 2) +1;
   result:= pt;
end;

function TwwDataInspector.CheckboxRect(ARect: TRect; Obj: TwwInspectorItem): TRect;
var cp: TPoint;
    offset: integer;
begin
   cp:= GetCenterPoint(ARect);
   Offset:= 5;
   Result:= Rect(ARect.Left + 3, cp.y-offset-2, ARect.Left+3*offset+5, cp.y+offset+1);
end;

procedure TwwDataInspector.DoDrawCaptionCell(ObjItem: TwwInspectorItem;
       ASelected: boolean;
       ACellRect: TRect;
       var ACaptionRect: TRect;
       var DefaultTextDrawing: boolean);
begin
   if Assigned(FOnDrawCaptionCell) then
       FOnDrawCaptionCell(self, ObjItem, ASelected, ACellRect, ACaptionRect,
       DefaultTextDrawing);
end;

procedure TwwDataInspector.DoDrawDataCell(ObjItem: TwwInspectorItem;
       ASelected: boolean;
       ACellRect: TRect;
       var DefaultDrawing: boolean);
begin
   if Assigned(FOnDrawCaptionCell) then
       FOnDrawDataCell(self, ObjItem, ASelected, ACellRect,
       DefaultDrawing);
end;

function TwwDataInspector.isFocused: boolean;
begin
   result:= (Screen.ActiveControl=self) or { 3/6/00 - Check for nil active control}
            (Assigned(Screen.ActiveControl) and (Screen.ActiveControl.parent=self))
end;

Function TwwDataInspector.IsDefaultDateTimePicker(Obj: TwwInspectorItem): boolean;
begin
   result:= (iioAutoDateTimePicker in obj.Options) and
            (obj.Field is TDateTimeField)
end;

Function TwwDataInspector.IsDefaultLookupCombo(Obj: TwwInspectorItem): boolean;
begin
   result:= (iioAutoLookupCombo in obj.Options) and (obj.Field<>nil) and
            (obj.Field.Lookup)
end;

function TwwInspectorItem.GetChecked: boolean;
var value: string;
begin
   if field=nil then value:=EditText
   else value:= field.text;
   result:= (picklist.items.count>0) and (Value = picklist.items[0]);
end;

procedure TwwInspectorItem.SetChecked(val: boolean);
begin
   if picklist.items.count<2 then exit;

   if field<>nil then
   begin
      if not TwwDataInspector(Control).CanEditModify then exit;
      if val then
         field.text:= picklist.items[0]
      else
         field.text:= picklist.items[1];
      EditText:= field.text;
   end
   else begin
      if val then
         EditText:= picklist.items[0]
      else
         EditText:= picklist.items[1]
   end;

end;

procedure TwwDataInspector.DoCalcDataPaintText(item: TwwInspectorItem; var PaintText: string);
begin
   if Assigned(FOnCalcDataPaintText) then
      FOnCalcDataPaintText(self, Item, PaintText);
end;

{procedure TwwInspectorItem.ComboDropDownEvent(Sender: TObject);
var inspector: TwwDataInspector;
begin
   if Assigned(FOnEditButtonClick) then begin
      inspector:= Control as TwwDataInspector;
      FOnEditButtonClick(Inspector, self);
      if Inspector.CurrentCustomEdit is TwwDBComboBox then
         EditText:= TwwDBComboBox(Inspector.CurrentCustomEdit).value;
   end
end;
}

Function TwwInspectorItem.UseDefaultComboBox: boolean;
begin
   result:= not (PickList.DisplayAsCheckbox) and
            (PickList.Items.Count>0) or Assigned(FOnEditButtonClick)
end;

function TwwInspectorItem.GetDisplayText: string;
begin
   result:= GetMappedPaintText(EditText);
end;

procedure TwwInspectorItem.SetDisplayText(val: string);
var i, curpos: integer;
    DisplayVal, StoredVal, OrigEditText: string;
begin
   OrigEditText:= EditText;

   if (not PickList.MapList) then begin
     EditText:= val;
     if EditText<>OrigEditText then DoItemTextChanged;
     exit
   end;

   for i:= 0 to PickList.Items.count-1 do begin
      curpos:= 1;
      DisplayVal:= strGetToken(PickList.Items[i], #9, curPos);
      StoredVal:= strGetToken(PickList.Items[i], #9, curPos);
      if wwEqualStr(DisplayVal, val) then begin
         editText:= StoredVal;
         break;
      end
   end;

   { If active control then update the control as well }
   if (Control is TwwDataInspector) then
      with (Control as TwwDataInspector) do
      begin
         if ActiveItem=self then
         begin
            if CurrentCustomEdit<>nil then
               TEdit(CurrentCustomEdit).Text:= val
            else if UseDefaultEditor and (InplaceEditor<>nil) then
               InplaceEditor.text:= val;
         end
      end;

   if EditText<>OrigEditText then DoItemTextChanged;

end;

Function TwwInspectorItem.GetMappedPaintText(StoredValue: string): string;
var i, curpos: Integer;
    DisplayVal : string;
begin
   result:= '';

{   if Field=nil then
      StoredValue:= EditText
   else StoredValue:= Field.asString;
}
   if not PickList.MapList then begin
     result:= StoredValue;
     exit;
   end;

   for i:= 0 to PickList.Items.count-1 do begin
      curpos:= 1;
      DisplayVal:= strGetToken(PickList.Items[i], #9, curPos);
      if strGetToken(PickList.Items[i], #9, curPos)=StoredValue then
      begin
         result:= DisplayVal;
         break;
      end
   end;
end;

procedure TwwDataInspector.DrawCell(ACol, ARow: Integer;
  ARect: TRect; AState: TGridDrawState);
var
   obj: TwwInspectorItem;
   customEdit: TWinControl;
   FoundCustomEdit: boolean;
   DrawTextRect, TitleRect: TRect;
   TextHeight: integer;
   Flags: integer;
   DefaultDrawing, DefaultTextDrawing: boolean;
   LookupCombo: TwwDBLookupCombo;
//   DrawTitleRect: TRect;
   PaintText: string;
   StoredValue: string;

  function ControlRect: TRect;
  begin
     result:= ARect;
     result.Left:= result.Left +1;
     result.Bottom:= result.Bottom -1;
  end;

  function sameRect(rect1, rect2: TRect): boolean;
  begin
     result:=
      (rect1.left = rect2.left) and
      (rect1.right = rect2.right) and
      (rect1.top = rect2.top) and
      (rect1.bottom = rect2.bottom);
  end;

  procedure InitCustomEdit(customEdit: TWinControl);
  begin
      if customEdit.parent<>self then
      begin
          customEdit.parent:= self;
          // 6/23/00 - Handle needs to be created to avoid blank display in some cases
          customEdit.HandleNeeded;
      end;

      if (obj.datafield<>wwGetControlDataField(customEdit)) or
         (obj.datasource<>wwGetControlDataSource(customEdit)) then
      begin
         wwSetControlDataField(customEdit, '');
         if (obj.DataSource<>nil) and (obj.DataField='') then
         begin
           wwSetControlDataSource(customEdit, nil);
         end
         else begin
           wwSetControlDataSource(customEdit, obj.DataSource);
           wwSetControlDataField(customEdit, obj.DataField);
         end;

         { Select all after painting }
         if not (customedit is TCustomMemo) then
            PostMessage(CustomEdit.Handle, EM_SETSEL, 0, -1);
      end;

      TEdit(CustomEdit).ctl3d:= False;
      if TEdit(CustomEdit).ParentFont then
         TEdit(CustomEdit).font:= self.font;
      TEdit(CustomEdit).TabStop:= false;
      if (CustomEdit is TCustomEdit) and (TEdit(CustomEdit).BorderStyle<> bsNone) then
         TEdit(CustomEdit).BorderStyle:= bsNone;

      { 11/3/99 - Update picture mask property of TwwDBCustomEdit }
      if (CustomEdit is TwwDBCustomEdit) then begin
         TwwDBCustomEdit(CustomEdit).Picture.Assign(obj.Picture);
         TwwDBCustomEdit(CustomEdit).Picture.PictureMaskFromDataSet:= False;
      end;

  end;

  procedure PaintInactiveCustomControl;
  begin
     CustomEdit:= obj.CustomControl;
     InitCustomEdit(CustomEdit);

     if (obj.datafield='') or (obj.datasource=nil) then
     begin
        CustomEdit.HandleNeeded;
        TEdit(CustomEdit).Text:= obj.EditText;
     end;

     customEdit.BoundsRect:= ControlRect;

     if (customEdit is TCustomMemo) then
     begin
        ExtraPaintList.Add(obj);
     end
     else begin
        try
          SetBkMode(Canvas.Handle, TRANSPARENT);
          customEdit.PaintTo(Canvas.Handle, ARect.Left, ARect.Top);
        finally
          SetBkMode(Canvas.Handle, OPAQUE);
        end;
     end;

  end;

   procedure PaintCheckbox;
   const MaxCheckboxSize = 6;
        ItemChecked: array[Boolean] of Integer = (0, DFCS_CHECKED);
   var
      value: string;
   begin
      if obj.field=nil then value:=obj.EditText
      else value:= obj.field.text;

      DrawFrameControl(Canvas.Handle, CheckboxRect(ARect, obj),
             DFC_BUTTON, {Grayed[Node.Grayed] or }
             DFCS_BUTTONCHECK or ItemChecked[value=obj.picklist.items[0]]);
   end;

   procedure PaintButton;
   var pt: TPoint;
       offset: integer;
       OrigColor: TColor;
       buttonsize: integer;
       buttonoffset: integer;
       src, dest: TRect;
   begin
      pt:= ButtonPt(ARect, obj);
      obj.ButtonPoint:= pt;

      if not obj.expanded then
      begin
         with ButtonOptions.ExpandGlyph do
         begin
            if Handle<>0 then
            begin
               src:= Rect(0, 0, Width, Height);
               src.bottom:= wwMin(Height, ARect.Bottom-ARect.Top-1);
               dest.left:= pt.x - (Width div 2);
               if ovCenterCaptionVert in Options then
                  dest.top:= pt.y - ((Height-1) div 2)
               else
                  dest.top:= pt.y - (Height div 2);
               dest.right:= dest.left + src.right;
               dest.bottom:= dest.top + src.bottom;
               if ButtonOptions.TransparentGlyphs then begin
                  TransparentMode := tmAuto;
                  Transparent:= True;
                  self.Canvas.Draw(dest.left, dest.top,ButtonOptions.ExpandGlyph);
               end
               else self.Canvas.CopyRect(dest, Canvas, src);
               exit;
            end
         end
      end
      else begin
         with ButtonOptions.CollapseGlyph do
         begin
            if Handle<>0 then
            begin
               src:= Rect(0, 0, Width, Height);
               src.bottom:= wwMin(Height, ARect.Bottom-ARect.Top-1);
               dest.left:= pt.x - (Width div 2);
               if ovCenterCaptionVert in Options then
                  dest.top:= pt.y - ((Height-1) div 2)
               else
                  dest.top:= pt.y - (Height div 2);
               dest.right:= dest.left + src.right;
               dest.bottom:= dest.top + src.bottom;

               if ButtonOptions.TransparentGlyphs then begin
                  TransparentMode := tmAuto;
                  Transparent:= True;
                  self.Canvas.Draw(dest.left, dest.top,ButtonOptions.CollapseGlyph);
               end
               else self.Canvas.CopyRect(dest, Canvas, src);

               exit;
            end
         end
      end;

      buttonsize:= 5;
      buttonoffset:= 0;
      OrigColor:= Canvas.Brush.Color;
      Offset:= 2;
//      pt:= ButtonPt(ARect, obj);
      Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect(pt.x-(buttonsize-2), pt.y-(buttonsize-1)+buttonoffset,
                        pt.x+buttonsize-2, pt.y+buttonsize-1+ buttonoffset));
      Canvas.Pen.Color := clBlack;
      Canvas.Rectangle(pt.x-buttonsize, pt.y-(buttonsize-1)+ buttonoffset,
                   pt.x+buttonsize-1, pt.y+buttonsize+ buttonoffset);
      Canvas.Pen.Color := clBlack;
      if not obj.expanded then
         Canvas.Polyline([Point(pt.x-1, pt.y-Offset+ buttonoffset),
                          Point(pt.x-1, pt.y+Offset+1+buttonoffset)]);
      Canvas.Polyline([Point(pt.x-Offset-1, pt.y+buttonoffset),
                             Point(pt.x+Offset, pt.y+buttonoffset)]);
      Canvas.Brush.Color:= OrigColor;
   end;

   Function GetTitleRect: TRect;
   var TitleRect: TRect;
   begin
      TitleRect:= Rect(ARect.Left + (Obj.Level+1) * CaptionIndent, ARect.Top + 1,
                          ARect.Right, ARect.Bottom);
      result:= TitleRect;
   end;

  function DefaultDrawCell(obj: TwwInspectorItem): boolean;
  var
    Hold: Integer;
    DefaultDrawing: boolean;
  begin
    DefaultDrawing:= True;
    if Assigned(FOnDrawDataCell) then
    begin
      if UseRightToLeftAlignment then
      begin
        ARect.Left := ClientWidth - ARect.Left;
        ARect.Right := ClientWidth - ARect.Right;
        Hold := ARect.Left;
        ARect.Left := ARect.Right;
        ARect.Right := Hold;
        ChangeOrientation(False);
      end;
      ARect.Bottom:= ARect.Bottom - 1;
      FOnDrawDataCell(Self, Obj, ARow=Row, ARect, DefaultDrawing);
      ARect.Bottom:= ARect.Bottom + 1;
      if UseRightToLeftAlignment then ChangeOrientation(True);
    end;

    result:= DefaultDrawing;
  end;

begin
    if UseTempCanvas then begin
//       if (ACol=1) and (not UseCheckbox(ARow)) then exit { Paint caption area only }
    end
    else begin
       if (ACol=0) or UseCheckbox(ARow) then exit; { Paint data area only }
    end;

   Obj:= GetItemByRow(ARow);

   if Obj=nil then exit;

   try with Obj do begin
      if ACol=0 then begin
         if (InactiveFocusColor=clNone) or (ARow<>Row) or IsFocused then
            Canvas.Brush.Color:= FixedColor
         else
            Canvas.Brush.Color:= InactiveFocusColor;
         Canvas.Font.Assign(FCaptionFont);

         try
           TitleRect:= GetTitleRect;

           SetBkMode(Canvas.Handle, TRANSPARENT);
           Flags:= DT_LEFT or DT_END_ELLIPSIS{ or DT_WORDBREAK};
           TextHeight:=
              DrawText(Canvas.Handle, PChar(obj.Caption), length(obj.Caption), TitleRect, Flags or DT_CALCRECT);
           TitleRect:= GetTitleRect;
           if ovCenterCaptionVert in self.Options then begin
              TitleRect.Top:= TitleRect.Top +
                           ((TitleRect.bottom-TitleRect.Top) - (TextHeight+2)) div 2;
           end;

//           DrawTitleRect:= ARect;
//           if (obj.Items.Count>0) then
//              PaintButton;

           SetBkMode(Canvas.Handle, TRANSPARENT); { could be reset by PaintButton }
           DefaultTextDrawing:= True;
           ARect.Bottom:= ARect.Bottom - 1;
           ARect.Right:= ARect.Right - 1;
           DoDrawCaptionCell(obj, (ARow=Row), ARect, TitleRect,
              DefaultTextDrawing);
           ARect.Bottom:= ARect.Bottom + 1;
           ARect.Right:= ARect.Right + 1;

           if DefaultTextDrawing then begin
              DrawText(Canvas.Handle, PChar(obj.Caption), length(obj.Caption), TitleRect, Flags);
               if obj.HaveVisibleItem then PaintButton;
//!              if (obj.Items.Count>0) then PaintButton;
           end
         finally
           SetBkMode(Canvas.Handle, OPAQUE);
         end

      end
      else begin
         Canvas.Font.Assign(self.Font);
         if (InactiveFocusColor=clNone) or (ARow<>Row) or Focused then
            Canvas.Brush.Color:= Color
         else
            Canvas.Brush.Color:= InactiveFocusColor;
         if (Color<>clNone) and (ARow=Row) and OldDesigning then Canvas.FillRect(ARect);

         if (field<>nil) then PaintText:= Field.DisplayText
         else PaintText:= obj.EditText;
         DefaultDrawing:= DefaultDrawCell(Obj);

         if DefaultDrawing then
         begin
            DoCalcDataPaintText(obj, PaintText);

            if (obj.CustomControl<>nil) and (obj.CustomControlAlwaysPaints) then
            begin
               if (Screen.ActiveControl<>obj.CustomControl) and
                  ((Row<>ARow) or (not focused)) and (FGridState<>gsRowSizing) then
               begin
                  PaintInactiveCustomControl;
                  exit;
               end
            end
            else if (Field is TBlobField) and (TBlobField(Field).blobType=ftMemo) then
            begin
               SetBkMode(Canvas.Handle, TRANSPARENT);
               try
                  Flags:= DT_LEFT or DT_END_ELLIPSIS or DT_NOPREFIX;
                  if obj.WordWrap then Flags:= Flags or DT_WORDBREAK;
                  DrawTextRect:= ARect;
                  DrawTextRect.Left:= ARect.Left + 2;
                  DrawTextRect.Top:= ARect.Top + 1;
                  DrawText(Canvas.Handle, PChar(Field.asString), length(Field.asString),
                        DrawTextRect, Flags);
               finally
                  SetBkMode(Canvas.Handle, OPAQUE);
               end
            end
            else if (obj.PickList.items.count>0) and (obj.PickList.DisplayAsCheckbox) then begin
               PaintCheckbox;
            end
            else if obj.UseDefaultComboBox then
            begin
               SetBkMode(Canvas.Handle, TRANSPARENT);
               try
                  if Field=nil then StoredValue:= EditText
                  else StoredValue:= Field.asString;

                  Canvas.TextOut(ARect.Left + 2, ARect.Top + 1, obj.GetMappedPaintText(StoredValue))
               finally
                  SetBkMode(Canvas.Handle, OPAQUE);
               end
            end
            else begin
               SetBkMode(Canvas.Handle, TRANSPARENT);
               try
                  Flags:= DT_LEFT or DT_END_ELLIPSIS or DT_NOPREFIX;
                  if obj.WordWrap then Flags:= Flags or DT_WORDBREAK;
                  DrawTextRect:= ARect;
                  DrawTextRect.Left:= ARect.Left + 2;
                  DrawTextRect.Top:= ARect.Top + 1;
                  DrawText(Canvas.Handle, PChar(PaintText), length(PaintText),
                        DrawTextRect, Flags);
               finally
                  SetBkMode(Canvas.Handle, OPAQUE);
               end
            end;
         end
      end
   end;
   if (ACol=1) and (ARow=Row) and (not (csDesigning in ComponentState)) and
       (Focused or
       (Assigned(Screen.ActiveControl) and { 3/6/00 - Check for nil active control }
       (Screen.ActiveControl.parent=self))) then
   begin
//      DirtyCustomInfo:= False;
      FoundCustomEdit:= False;
      if obj.CustomControl<>nil then
      begin
         customEdit:= obj.CustomControl;
         FoundCustomEdit:= True;
      end
      else if (obj.UseDefaultComboBox) then begin
         FoundCustomEdit:= True;
         if FCombo=Nil then
         begin
            FCombo:= CreateDefaultCombo;
            FCombo.Parent:= self;
            FCombo.font:= self.font;
            FCombo.visible:= False;
            (FCombo as TwwInspectorComboBox).FClickTime := GetMessageTime; { 12/2/99 - Support dbl-click}
         end;
         customEdit:= FCombo;
         FCombo.Items.assign(obj.PickList.Items);
         FCombo.MapList:= obj.PickList.MapList;
         FCombo.ShowMatchText:= obj.PickList.ShowMatchText;
         FCombo.Style:= obj.PickList.Style;
         FCombo.ButtonStyle:= obj.PickList.ButtonStyle;
         FCombo.AllowClearKey:= obj.PickList.AllowClearKey;
         FCombo.ButtonGlyph.Handle:= 0;
         FCombo.ButtonGlyph.Assign(obj.PickList.ButtonGlyph);
         FCombo.ButtonWidth:= obj.PickList.ButtonWidth;
//         FCombo.OnDropDown:= obj.ComboDropDownEvent;
         if (obj.DataSource=nil) or (obj.DataField='') then
           FCombo.Value:= obj.EditText;
      end
      else if IsDefaultLookupCombo(obj) then begin
         FoundCustomEdit:= True;
         if obj.CustomControl=nil then
         begin
            LookupCombo:= TwwDBLookupCombo.create(self);
            obj.CustomControl:= LookupCombo;
         end
         else if obj.CustomControl is TwwDBLookupCombo then
            LookupCombo:= TwwDBLookupCombo(obj.CustomControl)
         else exit;

         LookupCombo.font:= self.font;
         LookupCombo.visible:= False;
         LookupCombo.parent:= self;
         LookupCombo.LookupTable:= obj.field.LookupDataSet;
         LookupCombo.Selected.Add(
            obj.field.LookupResultField + #9 +
            inttostr(obj.field.displaywidth) + #9 +
            obj.field.DisplayLabel);
         LookupCombo.ShowMatchText:= True;
         LookupCombo.LookupField:= obj.Field.LookupKeyFields;
         LookupCombo.tabStop:= false;
         customEdit:= LookupCombo;
//             DoCreateLookupCombo(LookupCombo);
      end
      else if IsDefaultDateTimePicker(obj) then begin
         FoundCustomEdit:= True;
         if FDateTimePicker=Nil then
         begin
             FDateTimePicker:= CreateDateTimePicker;
             FDateTimePicker.visible:= False;
             FDateTimePicker.font:= self.font;
             FDateTimePicker.TabStop:= false;

             DoCreateDateTimePicker(FDateTimePicker);
         end;
         customEdit:= FDateTimePicker;
         FDateTimePicker.ShowButton:= not (obj.Field is TTimeField);
      end;

      if FoundCustomEdit then begin
         if not sameRect(customEdit.BoundsRect, ControlRect) then
         begin
            customEdit.BoundsRect:= ControlRect;
         end;
         InitCustomEdit(customEdit);
         customEdit.BoundsRect:= ControlRect;
         wwSetReadOnly(CustomEdit, obj.ReadOnly or self.ReadOnly);

         { 5/4/00 - Unbound with custom control item was losing original text when changing rows }
         if CurrentCustomEdit<>Customedit then begin
            if not obj.CustomControlAlwaysPaints then begin
              if (obj.datafield='') or (obj.datasource=nil) then
              begin
                CustomEdit.HandleNeeded;
                TEdit(CustomEdit).Text:= obj.DisplayText;
              end
           end;
           CurrentCustomEditRow:= ARow;
         end;

         CurrentCustomEdit:= CustomEdit;
      end;

   end
   finally
   end

end;

function TwwDataInspector.GetEditText(ACol, ARow: Longint): string;
var Obj: TwwInspectorItem;
begin
   obj:= GetItemByRow(ARow);
   if obj=nil then exit;

   if obj.Field=nil then begin
      result:= obj.EditText;
      exit;
   end;
   if (obj.Field is TBlobField) and (TBlobField(obj.Field).BlobType=ftMemo) then
   begin
      result:= obj.Field.asString;
   end
   else begin
      result:= obj.Field.text;
   end;
//   obj.OrigEditText:= result;
//   obj.EditText:= result;
   FEditText:= Result;
end;

procedure TwwDataInspector.SetEditText(ACol, ARow: Longint; const Value: string);
var Obj: TwwInspectorItem;
begin
   obj:= GetItemByRow(ARow);
   if obj<>nil then obj.EditText:= Value; { 1/21/2000-Check for nil pointer in SetEditText}
   FEditText := Value;
end;

procedure TwwDataInspector.UpdateDataColumnWidth;
var NewColWidth1: integer;
begin
   if VisibleRowCount>RowCount then
     NewColWidth1:= ClientWidth - ColWidths[0] -
                    GetSystemMetrics(SM_CXHThumb) - (ColCount-2)
   else
     NewColWidth1:= ClientWidth - ColWidths[0] - (ColCount-2);

   ColWidths[1]:= NewColWidth1;
end;

procedure TwwDataInspector.UpdateRowCount;
var numRows: integer;
begin
   if not (csLoading in ComponentState) and CheckRowCount then
   begin
      numRows:= GetActiveRows;
      if (RowCount<>NumRows) and (NumRows>0) then
      begin
        RowCount:= NumRows;
      end;
      CheckRowCount:= False;
   end;
end;

procedure TwwDataInspector.RefreshItem(Item: TwwInspectorItem);
var curRow: integer;
//    numRows: integer;
begin
   if csLoading in ComponentState then exit;
   if Items.UpdateCount>0 then exit;

{   if not (csLoading in ComponentState) and CheckRowCount then
   begin
      numRows:= GetActiveRows;
      if (RowCount<>NumRows) and (NumRows>0) then
        RowCount:= NumRows;
      CheckRowCount:= False;
   end;
}
   if Item=nil then exit;
   curRow:= GetRowByItem(Item);
   if (curRow>=0) then begin
      if Item.CellHeight=0 then RowHeights[curRow]:= inherited DefaultRowHeight
      else RowHeights[curRow]:= Item.CellHeight;
   end
end;

Procedure TwwDataInspector.ApplySettingsCallback(Item: TwwInspectorItem; UserData: Pointer; var AContinue: boolean);
var currentRow: PInteger;
begin
   currentRow:= PInteger(UserData);
   if Item.CustomControl<>nil then
   begin
//      Item.CustomControl.visible:= False;
      TEdit(Item.CustomControl).ControlStyle:=
           TEdit(Item.CustomControl).ControlStyle + [csNoDesignVisible];
   end;
   if not Item.visible then exit;

   if Item.CellHeight>0 then
      RowHeights[CurrentRow^]:= Item.CellHeight
   else RowHeights[CurrentRow^]:= inherited DefaultRowHeight;
   CurrentRow^:= CurrentRow^ + 1;
end;

procedure TwwDataInspector.ApplySettings;
var i: Integer;
    Item: TwwInspectorItem;
    curRow: integer;
    numRows: integer;
begin
   if csLoading in ComponentState then exit;

   BeginUpdate;

   Canvas.Font.Assign(self.Font);

   FMinRowHeight:= Canvas.TextHeight('0')+3;
   if DefaultRowHeight=0 then begin
      if FMinRowHeight<>inherited DefaultRowHeight then
         inherited DefaultRowHeight:= FMinRowHeight;
   end;

   if (Items.Count=0) and (Datasource<>nil) and (DataSource.DataSet<>nil) and
       DataLink.Active then with DataSource.DataSet do
   begin
      for i:=0 to FieldCount-1 do
      begin
         Item:= TwwInspectorItem.create(Items);
         Item.Caption:= Fields[i].DisplayLabel;
         Item.CustomControl:= nil;
         Item.ReadOnly:= Fields[i].ReadOnly;
         Item.CellHeight:= 0;
         Item.Expanded:= False;
         Item.DataField:= Fields[i].FieldName;
      end
   end;


   if not (csLoading in ComponentState) then
   begin
      numRows:= GetActiveRows;
      if (RowCount<>NumRows) and (NumRows>0) then
        RowCount:= NumRows;
   end;

//   RowCount:= ActiveRows;

   CurRow:= 0;
   IterateItems(ApplySettingsCallback, True, @CurRow);

   FixedRows:= 0;
   UpdateDataColumnWidth;
   Col:= 1;

//   { Create controls }
//   DateTimePicker:= TwwDBDateTimePicker.create(self);
//   Update; { Complete erase background }
   EndUpdate(True);

   { Collapse on checkbox causes inplaceeditor to not become visible even though it should }
   if UseDefaultEditor then ShowEditor;

end;

procedure TwwDataInspector.SetCaptionWidth(value: integer);
var NewWidth: integer;
begin
   NewWidth:= wwMax(10, wwMin(value, ClientWidth-20));
   if NewWidth<>FCaptionWidth then begin
      ColWidths[0]:= wwMax(10, wwMin(value, ClientWidth-20));
      FCaptionWidth:= ColWidths[0];
      invalidate;
   end
end;

function TwwDataInspector.AcquireFocus: Boolean;
begin
  Result := True;
  if CanFocus and not (csDesigning in ComponentState) then
  begin
    SetFocus;
//    if InplaceEditor<>nil then
//       TEdit(InplaceEditor).Font.Color:= clWindowText; { Change later to be based on property FocusTextColor }
    Result := Focused or (InplaceEditor <> nil) and InplaceEditor.Focused;
  end;
end;

function TwwDataInspector.UseCheckbox(ARow: integer): boolean;
var
  obj: TwwInspectorItem;
begin
   obj:= GetItemByRow(ARow);
   if obj=nil then
   begin
      result:= false;
      exit;
   end;
   result:= (obj.CustomControl=nil) and
            not IsDefaultDateTimePicker(obj) and
           (obj.PickList.items.count>0) and
           (obj.PickList.DisplayAsCheckbox)
end;

function TwwDataInspector.UseDefaultEditor: boolean;
var
    obj: TwwInspectorItem;
begin
   obj:= GetItemByRow(Row);
   if (obj=nil) or (obj.DisableDefaultEditor) then
   begin
      result:= false;
      exit;
   end;

   result:=
      not
       ((obj.CustomControl<>nil) or
        IsDefaultDateTimePicker(obj) or
        (obj.PickList.items.count>0) or
        obj.UseDefaultComboBox or
        ((obj.Field<>nil) and IsDefaultLookupCombo(obj)))
end;


procedure TwwInspectorItem.DoItemTextChanged;
begin
//   if EditText<>OrigEditText then
//   begin
      if Assigned(FItemChanged) then
         FItemChanged((Control as TwwDataInspector), self, EditText);
      (Control as TwwDataInspector).DoItemChanged(self, EditText);
//      OrigEditText:= EditText;
//   end;
end;

Function TwwDataInspector.GetActiveEdit: TWinControl;
begin
   result:= nil;

   if CurrentCustomEdit<>nil then result:= CurrentCustomEdit
   else if not UseCheckbox(Row) then begin
      if not ActiveItem.DisableDefaultEditor then
         result:= InplaceEditor
   end

end;

procedure TwwDataInspector.SetFocusCell(ACol, ARow: integer);
var OldRow: integer;
    obj: TwwInspectorItem;
    PrevTopRow: integer;
    CurrentUpdateCount: integer;
begin
   if (ACol=Col) and (ARow=Row) then exit;
   if ARow<>Row then TwwDataInspectorDataLink(FDatalink).UpdateData;

   OldRow:= Row;
   PrevTopRow:= TopRow;

   obj:= GetItemByRow(OldRow);

{   if (obj<>nil) and (obj.CustomControl<>nil) then
   begin
       obj.EditText:= TEdit(CurrentCustomEdit).Text;
   end;
}
   if (obj<>nil) and (CurrentCustomEdit<>nil) then
   begin
       if CurrentCustomedit is TwwDBComboBox then
         obj.EditText:= TwwDBComboBox(CurrentCustomEdit).Value
       else
         obj.EditText:= TEdit(CurrentCustomEdit).Text;
   end;

   if CurrentCustomEdit<>nil then
   begin
      if TEdit(CurrentCustomEdit).modified then
         obj.DoItemTextChanged;
   end
   else begin
    { Check for checkbox }
       if (InplaceEditor<>nil) and Inplaceeditor.modified then
       begin
           { 5/3/00 - Make sure obj.edittext is updated to inplaceeditor's value }
           { This is only necessary because when a picture mask is assigned, the obj.edittext
             is not updated for some reason }
           if inplaceeditor.text<>obj.edittext then
              obj.edittext:=InplaceEditor.text;

           obj.DoItemTextChanged;
           InplaceEditor.modified:= false; { 3/11/00 - Clear modified }
       end
   end;

//   UpdateRect:= FPaintCanvas.ClipRect;
//   windows.GetUpdateRect(Handle, UpdateRect, false);
//   BeginUpdate;
   CurrentUpdateCount:= FUpdateCount;
   try
     DoBeginUpdateInSelectCell:= True; { Do BeginUpdate after BeforeSelect event }
     MoveColRow(ACol, ARow, True, True);
   finally
     if FUpdateCount>CurrentUpdateCount then EndUpdate;
   end;

   if (CurrentCustomEditRow<>ARow) and (CurrentCustomEdit<>nil) then
   begin
      CurrentCustomEdit.visible:= False;
      CurrentCustomEdit:= nil;
      CurrentCustomEditRow:= -1;
   end;

   if useDefaultEditor then ShowEditor
   else HideEditor;

   if PrevTopRow<>TopRow then
   begin
      invalidate;
   end
   else begin
      InvalidateRect(Handle, @SelectCellUpdateRect, False);
      InvalidateRow(OldRow);
      InvalidateRow(ARow);
   end;
end;

function TwwDataInspector.SelectCell(ACol, ARow: Longint): Boolean;
var obj: TwwInspectorItem;
begin
   Result := True;
   obj:= GetItemByRow(ARow);

   if Assigned(FOnBeforeSelectCell) then begin
      FOnBeforeSelectCell(Self, Obj, Result);
   end;

   if DoBeginUpdateInSelectCell then
   begin
      Windows.GetUpdateRect(Handle, SelectCellUpdateRect, false);
      BeginUpdate;
      DoBeginUpdateInSelectCell:= False;
   end;

   if result then begin
      if ACol=0 then begin
         result:= False;
         exit;
      end;
      if (CurrentCustomEditRow<>ARow) and (CurrentCustomEdit<>nil) then
      begin
         SkipErase:= True;
         { 9/29/99 - Need to move focus to inspector since custom edit is not visible }
         if CurrentCustomEdit.visible then SetFocus;
         CurrentCustomEdit.visible:= False;
         SkipErase:= False;
         CurrentCustomEdit:= nil;
         CurrentCustomEditRow:= -1;
      end;

      { Initialize edit text values when it receives focus }
      if obj<>nil then
         obj.EditText:= GetEditText(1, ARow);
//      obj.OrigEditText:= Obj.EditText;

      InvalidateRow(Row);
      InvalidateRow(ARow);

      if (ARow<>Row) and FastDesign then
         FActiveItem:= GetItemByRow(ARow);

   end;

end;

procedure TwwDataInspector.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var DrawInfo: TGridDrawInfo;
  NewSize: Integer;

  function ResizeLine(const AxisInfo: TGridAxisDrawInfo): Integer;
  var
    I: Integer;
  begin
    with AxisInfo do
    begin
      Result := FixedBoundary;
      for I := FirstGridCell to FSizingIndex - 1 do
        Inc(Result, GetExtent(I) + EffectiveLineWidth);
      Result := FSizingPos - Result;
    end;
  end;

begin
  CalcDrawInfo(DrawInfo);
  if FGridState=gsColSizing then try
     if UseRightToLeftAlignment then
        FSizingPos := ClientWidth - FSizingPos;
     NewSize := ResizeLine(DrawInfo.Horz);
     if NewSize > 1 then
     begin
        CaptionWidth:= NewSize;
        UpdateDataColumnWidth;
        UpdateDesigner;
     end;
     if Assigned(OnMouseUp) then OnMouseUp(self, Button, Shift, X,Y);
  finally
    FGridState := gsNormal;
  end
  else if FGridState=gsRowSizing then
  begin
     inherited;
     if CurrentCustomEdit<>nil then
     begin
        CurrentCustomEdit.SetFocus;
//        TEdit(CurrentCustomEdit).Font.Color:= clBlack; { Change later to be based on property FocusTextColor }
     end;

     RowHeights[FSizingIndex]:= wwMax(RowHeights[FSizingIndex], FMinRowHeight);
     if GetItemByRow(FSizingIndex)<>nil then { 11/18/99 - Make sure this is a valid row }
        GetItemByRow(FSizingIndex).CellHeight:= RowHeights[FSizingIndex];
     invalidateRow(FSizingIndex);
  end
  else if FGridState in [gsSelecting, gsColMoving, gsRowMoving] then inherited;
end;

procedure TwwDataInspector.DrawSizingLine(const DrawInfo: TGridDrawInfo);
var
  OldPen: TPen;
begin
  OldPen := TPen.Create;
  try
    with Canvas, DrawInfo do
    begin
      OldPen.Assign(Pen);
      Pen.Style := psDot;
      Pen.Mode := pmXor;
      Pen.Width := 1;
      try
        if FGridState = gsRowSizing then
        begin
          MoveTo(0, FSizingPos);
          LineTo(Horz.GridBoundary, FSizingPos);
        end
        else
        begin
          MoveTo(FSizingPos, 0);
          LineTo(FSizingPos, Vert.GridBoundary);
        end;
      finally
        Pen := OldPen;
      end;
    end;
  finally
    OldPen.Free;
  end;
end;

procedure TwwDataInspector.DoCollapse(ObjItem: TwwInspectorItem);
var AllowCollapse: boolean;
begin
   AllowCollapse:= True;
   if Assigned(FOnCanCollapse) then FOnCanCollapse(self, ObjItem, AllowCollapse);
   if AllowCollapse then begin
      ObjItem.expanded:= False;
      if not (csLoading in ComponentState) then
      begin
         if Assigned(FOnCollapsed) then FOnCollapsed(self, ObjItem)
      end
   end
end;

procedure TwwDataInspector.DoExpand(ObjItem: TwwInspectorItem);
var AllowExpand: boolean;
begin
   AllowExpand:= True;
   if Assigned(FOnCanExpand) then FOnCanExpand(self, ObjItem, AllowExpand);
   if AllowExpand then begin
      ObjItem.expanded:= True;
      if not (csLoading in ComponentState) then
      begin
         if Assigned(FOnExpanded) then FOnExpanded(self, ObjItem)
      end
   end;

end;


procedure TwwDataInspector.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  DrawInfo: TGridDrawInfo;
  Cell: TGridCoord;
  obj: TwwInspectorItem;
  r: TRect;
  pt: TPoint;
//  OldRow: integer;
begin
  Cell := MouseCoord(X, Y);

  { Don't set focus if clicking on first column of active row }
  if (not IsFocused) or (Cell.X <>0) or (Cell.Y<>Row) and isFocused then
     if not AcquireFocus then Exit;

  if (Cell.X < 0) and (Cell.Y < 0) or (ssDouble in Shift) then  { 12/2/99 - Dbl-click should be passed to base class to handle}
  begin
    inherited MouseDown(Button, Shift, X, Y);
    Exit;
  end;

 { 12/2/99 - Support dbl-click}
   if DefaultCombo <> nil then (DefaultCombo as TwwInspectorComboBox).FClickTime := GetMessageTime;

  obj:= GetItemByRow(Cell.Y);
  if (Cell.X=0) and (obj<>nil) then begin
//     pt:= ButtonPt(CellRect(Cell.X, Cell.Y), obj);
     pt:= obj.ButtonPoint;
     if (obj.Items.Count>0) and
        (((abs(x-pt.x)<=4) and (abs(y-pt.y)<=4)) or (ssDouble in Shift)) then
     begin
//       OldRow:= Row;
       SetFocusCell(Col, GetRowByItem(obj)); { 3/6/2000 - Flush changes when expanding }
//       Row:= GetRowByItem(obj);  { Must set row before updating obj.expanded as otherwise
//                             error when flusing edit contents}
       if UseDefaultEditor then ShowEditor else HideEditor;
       if obj.Expanded then DoCollapse(obj)
       else DoExpand(obj);

//       obj.Expanded:= not obj.Expanded;
//       ApplySettings;

       if Assigned(OnMouseDown) then OnMouseDown(Self, Button, Shift, X, Y);
       exit;
     end
  end;

  if ((Cell.X=0) or (Cell.x=1)) and
     (not Sizing(X,Y) or not InValidColSizingArea(x)) then begin
     if Assigned(OnMouseDown) then OnMouseDown(Self, Button, Shift, X, Y);
     SetFocusCell(1, Cell.Y);
     r:= CheckboxRect(CellRect(1, Row), obj);
     InflateRect(r, 1, 1);
     if (Cell.x=1) and UseCheckbox(Cell.y) and
        PtInRect(r, Point(x,y)) then
     begin
        ToggleCheckbox(obj);
        InvalidateCell(1, Cell.Y);
     end;
     exit;
  end;

  { Flush data }
  CalcDrawInfo(DrawInfo);
  CalcSizingState(X, Y, FGridState, FSizingIndex, FSizingPos, FSizingOfs,
      DrawInfo);
  if (FGridState = gsColSizing) or (FGridState = gsRowSizing) then
     FDataLink.UpdateData;

  inherited;

  if (FGridState = gsColSizing) or (FGridState = gsRowSizing) then
  begin
    CalcDrawInfo(DrawInfo);
    { Check grid sizing }
    CalcSizingState(X, Y, FGridState, FSizingIndex, FSizingPos, FSizingOfs,
      DrawInfo);

    if FGridState=gsColSizing then
    begin
       if not InValidColSizingArea(X) then FGridState:= gsNormal;
       DrawSizingLine(DrawInfo);  { Undo sizing line }
    end
  end;
end;


procedure TwwDataInspector.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  DrawInfo: TGridDrawInfo;
  NewSize: integer;
  OldCaptionWidth: integer;

  function ResizeLine(const AxisInfo: TGridAxisDrawInfo): Integer;
  var
    I: Integer;
  begin
    with AxisInfo do
    begin
      Result := FixedBoundary;
      for I := FirstGridCell to FSizingIndex - 1 do
        Inc(Result, GetExtent(I) + EffectiveLineWidth);
      Result := FSizingPos - Result;
    end;
  end;

begin
  CalcDrawInfo(DrawInfo);
  case FGridState of
    gsSelecting, gsColMoving, gsRowMoving:;

    gsRowSizing: ;

    gsColSizing:
      begin
        NewSize := ResizeLine(DrawInfo.Horz);
        if (NewSize > 1) then
        begin
          OldCaptionWidth:= CaptionWidth;
          CaptionWidth:= NewSize;
          if CaptionWidth<>OldCaptionWidth then
          begin
             UpdateDataColumnWidth;
             UpdateDesigner;
          end
        end;
        FSizingPos := X + FSizingOfs;
        exit;
      end;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TwwDataInspector.CalcSizingState(X, Y: Integer; var State: TGridState;
  var Index: Longint; var SizingPos, SizingOfs: Integer;
  var FixedInfo: TGridDrawInfo);

  procedure CalcAxisState(const AxisInfo: TGridAxisDrawInfo; Pos: Integer;
    NewState: TGridState);
  var
    I, Line, Back, Range: Integer;
    tolerance: integer;
    obj: TwwInspectorItem;
  begin
    if NewState=gsColSizing then tolerance:= 7
    else tolerance:= 5;

    if UseRightToLeftAlignment then
      Pos := ClientWidth - Pos;
    with AxisInfo do
    begin
      Line := FixedBoundary;
      Range := EffectiveLineWidth;
      Back := 0;
      if Range < tolerance then
      begin
        Range := tolerance;
        Back := (Range - EffectiveLineWidth) shr 1;
      end;

      for I := FirstGridCell to GridCellCount - 1 do
      begin
        Inc(Line, GetExtent(I));
        if Line > GridBoundary then Break;
        if (Pos >= Line - Back) and (Pos <= Line - Back + Range) then
        begin
          if NewState=gsRowSizing then
          begin
            obj:= GetItemByRow(i);
            if (obj<>nil) and not obj.Resizeable then exit;
          end;

          State := NewState;
          SizingPos := Line;
          SizingOfs := Line - Pos;
          Index := I;
          Exit;
        end;
        Inc(Line, EffectiveLineWidth);
      end;
      if (GridBoundary = GridExtent) and (Pos >= GridExtent - Back)
        and (Pos <= GridExtent) then
      begin
        if NewState=gsRowSizing then
        begin
          obj:= GetItemByRow(i);
          if (obj<>nil) and not obj.Resizeable then exit;
        end;
        State := NewState;
        SizingPos := GridExtent;
        SizingOfs := GridExtent - Pos;
        Index := LastFullVisibleCell + 1;
      end;
    end;
  end;

  function XOutsideHorzFixedBoundary: Boolean;
  begin
    with FixedInfo do
      if not UseRightToLeftAlignment then
        Result := X > Horz.FixedBoundary
      else
        Result := X < ClientWidth - Horz.FixedBoundary;
  end;

  function XOutsideOrEqualHorzFixedBoundary: Boolean;
  begin
    with FixedInfo do
      if not UseRightToLeftAlignment then
        Result := X >= Horz.FixedBoundary
      else
        Result := X <= ClientWidth - Horz.FixedBoundary;
  end;


var
  EffectiveOptions: TGridOptions;
begin
  State := gsNormal;
  Index := -1;
  EffectiveOptions := inherited Options;
  if csDesigning in ComponentState then
    EffectiveOptions := EffectiveOptions + DesignOptionsBoost;
  if [goColSizing, goRowSizing] * EffectiveOptions <> [] then
    with FixedInfo do
    begin
      Vert.GridExtent := ClientHeight;
      Horz.GridExtent := ClientWidth;
      if (goColSizing in EffectiveOptions) then
      begin
        CalcAxisState(Horz, X, gsColSizing);
      end;

      if (State<>gsColSizing) and (goRowSizing in EffectiveOptions) then
      begin
        if X>ColWidths[0] then exit;
        CalcAxisState(Vert, Y, gsRowSizing);
      end;
    end;
end;

function TwwDataInspector.GetPageHeight: integer;
var DrawInfo: TGridDrawInfo;
    PageHeight: integer;
begin
  CalcDrawInfo(DrawInfo);
  PageHeight := (DrawInfo.Vert.LastFullVisibleCell+1) - TopRow;
  if PageHeight < 1 then PageHeight := 1;
  result:= PageHeight;
end;

procedure TwwDataInspector.KeyDown(var Key: Word; Shift: TShiftState);
  procedure SetCustomControlFocus;
  begin
    if CurrentCustomEdit<>nil then
       CurrentCustomEdit.SetFocus;
  end;
var obj: TwwInspectorItem;
    ParentForm: TCustomForm;
begin
   if Assigned(OnKeyDown) then OnKeyDown(Self, Key, Shift);

   if (ovEnterToTab in Options) and (Key=VK_RETURN) then Key:= 9;

   case key of
      vk_left: begin
           obj:= GetItemByRow(Row);
           if ((obj.readonly) or (ssCtrl in Shift)) and
              (obj.Items.count>0) and obj.expanded then begin
              DoCollapse(obj);
              key:= 0;
           end;
        end;
      vk_right: begin
           obj:= GetItemByRow(Row);
           if ((obj.readonly) or (ssCtrl in Shift)) and
               (obj.Items.count>0) and (not obj.expanded) then begin
              DoExpand(obj);
              key:= 0;
           end;
        end;
   end;

   if ssCtrl in Shift then
   begin
     case key of
      vk_home:
       begin
          SetFocusCell(Col,0);
       end;
      vk_end:
       begin
          SetFocusCell(Col, RowCount-1);
       end;
     end;
   end
   else begin
     case key of
      vk_Next:
        begin
          SetFocusCell(Col, wwMin(RowCount-1, Row + GetPageHeight));
        end;

      vk_Prior:
        begin
          SetFocusCell(Col, wwMax(0, Row - GetPageHeight));
        end;

      vk_Up:
       begin
          if Row>0 then SetFocusCell(Col, Row - 1)
       end;

      vk_Down:
       begin
          if Row<RowCount-1 then SetFocusCell(Col, Row+1)
       end;

      vk_tab:
       begin
         if ssShift in Shift then
         begin
            obj:= GetItemByRow(Row);
            if obj<>nil then repeat { 7/20/00 - ovTabToVisibleOnly should use 2nd paramater, not first }
                obj:= obj.GetPrior(True, (ovTabToVisibleOnly in Options))
            until (obj=nil) or (obj.tabStop=True);
            if obj<>nil then ActiveItem:= obj
            else begin
                { 1/28/2000 - Send to parent form, not parent }
                ParentForm := GetParentForm(Self);
                if Assigned(ParentForm) then
                   ParentForm.Perform(wm_nextdlgctl, 1, 0);
            end
         end
         else begin
            obj:= GetItemByRow(Row);
            if obj<>nil then repeat { 7/20/00 - ovTabToVisibleOnly should use 2nd paramater, not first }
                obj:= obj.GetNext(True, (ovTabToVisibleOnly in Options))
            until (obj=nil) or (obj.tabStop=True);
            if obj<>nil then ActiveItem:= obj
            else begin
                { 1/28/2000 - Send to parent form, not parent }
                ParentForm := GetParentForm(Self);
                if Assigned(ParentForm) then
                   ParentForm.Perform(wm_nextdlgctl, 0, 0);
            end;
         end
       end;

      13: begin
          if CurrentCustomEdit<>nil then begin
            if CurrentCustomEdit is TCustomEdit then
            begin
               with TEdit(CurrentCustomEdit) do
//                  if (selstart=0) and (selLength>=length(text)-2) then
//                     selStart:= length(Text)
//                  else
                     SelectAll;
            end;
          end
       end;

      VK_ESCAPE:
       begin
          TwwDataInspectorDataLink(FDatalink).Reset;
          { Highlight entire inplaceedit upon escape }
          if (InplaceEditor<>nil) and (InplaceEditor.visible) then
             InplaceEditor.SelectAll;

       end;
     end
   end;

   SetCustomControlFocus;//   inherited;
end;



Function TwwDataInspector.GetCanvas: TCanvas;
begin
   if UseTempCanvas then
      result:= FPaintCanvas
   else
      result:= inherited Canvas;
end;

Function TwwDataInspector.HaveVisibleItem: boolean;
var i: integer;
begin
   result:= False;

   for i:= 0 to Items.count-1 do begin
      if TwwInspectorItem(Items[i]).visible then begin
         result:= true;
         break;
      end
   end;
end;

Function TwwInspectorItem.HaveVisibleItem: boolean;
var i: integer;
begin
   result:= False;

   for i:= 0 to Items.count-1 do begin
      if TwwInspectorItem(Items[i]).visible then begin
         result:= true;
         break;
      end
   end;
end;

procedure TwwDataInspector.Paint;
var RowPixel: integer;
    CurRow: integer;
    DrawInfo: TGridDrawInfo;
    EditRect: TRect;
    Col1UnderlineWidth: integer;
    UpdateRect: TRect;
    TempRect: TRect;
    obj: TwwInspectorItem;

    function IsCaptionLinesVisible: boolean;
    begin
       result:= (ovHighlightActiveRow in Options) and FFocused
    end;

    procedure DottedDataLine;
    begin
       if FFocused and (CurRow=Row+1) then
       begin
       end
       else begin
          Canvas.Pen.Color:= DottedLineColor;
          wwDottedLine(Canvas,
             Point(ColWidths[0], RowPixel-1),
             Point(ColWidths[0]+ColWidths[1], RowPixel-1));
       end;
    end;

    procedure DottedCaptionLine;
    begin
       Canvas.Pen.Color:= DottedLineColor;
       if IsCaptionLinesVisible and (curRow=Row+1) then exit; { Don't draw dotted line for top of next row }

       wwDottedLine(Canvas,
          Point(0, RowPixel-1),
          Point(ColWidths[0], RowPixel-1));
    end;

    procedure LightDataLine;
    begin
       if FFocused and (CurRow=Row+1) then
       begin
       end
       else if FFocused and (CurRow=Row) then
       begin
          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(ColWidths[0], RowPixel-1);
          Canvas.LineTo(ColWidths[0]+ColWidths[1], RowPixel-1);
{~~~~}          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(ColWidths[0]-1, RowPixel);
          Canvas.LineTo(ColWidths[0]+ColWidths[1], RowPixel);
       end
       else begin
          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(ColWidths[0], RowPixel-1);
          Canvas.LineTo(ColWidths[0]+ColWidths[1], RowPixel-1);
          Canvas.Pen.Color:= clBtnHighlight;
          Canvas.MoveTo(ColWidths[0], RowPixel);
          Canvas.LineTo(ColWidths[0]+ColWidths[1], RowPixel);
       end
    end;

    procedure DarkDataLine;
    begin
       if FFocused and (CurRow=Row+1) then
       begin
       end
       else if FFocused and (CurRow=Row) then
       begin
          Canvas.Pen.Color:= clBlack;
          Canvas.MoveTo(ColWidths[0], RowPixel-1);
          Canvas.LineTo(ColWidths[0]+ColWidths[1], RowPixel-1);

{~~~~}          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(ColWidths[0]-1, RowPixel);
          Canvas.LineTo(ColWidths[0]+ColWidths[1], RowPixel);
       end
       else begin
          Canvas.Pen.Color:= clBlack;
          Canvas.MoveTo(ColWidths[0], RowPixel-1);
          Canvas.LineTo(ColWidths[0]+ColWidths[1], RowPixel-1);
          Canvas.Pen.Color:= clBtnHighlight;
          Canvas.MoveTo(ColWidths[0], RowPixel);
          Canvas.LineTo(ColWidths[0]+ColWidths[1], RowPixel);
       end
    end;

    procedure ButtonDataLine;
    begin
       if FFocused and (CurRow=Row+1) then
       begin
       end
       else if FFocused and (CurRow=Row) then
       begin
          Canvas.Pen.Color:= clBlack;
          Canvas.MoveTo(ColWidths[0], RowPixel-1);
          Canvas.LineTo(ColWidths[0]+ColWidths[1], RowPixel-1);
          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(ColWidths[0], RowPixel-2);
          Canvas.LineTo(ColWidths[0]+ColWidths[1], RowPixel-2);
          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(ColWidths[0], RowPixel);
          Canvas.LineTo(ColWidths[0]+ColWidths[1], RowPixel);
       end
       else begin
          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(ColWidths[0], RowPixel-2);
          Canvas.LineTo(ColWidths[0]+ColWidths[1], RowPixel-2);

          Canvas.Pen.Color:= clBlack;
          Canvas.MoveTo(ColWidths[0], RowPixel-1);
          Canvas.LineTo(ColWidths[0]+ColWidths[1], RowPixel-1);

          Canvas.Pen.Color:= clBtnHighlight;
          Canvas.MoveTo(ColWidths[0], RowPixel);
          Canvas.LineTo(ColWidths[0]+ColWidths[1], RowPixel);
        end
    end;

    procedure LightCaptionLine;
    begin
       if IsCaptionLinesVisible and (CurRow=Row+1) then
       begin
       end
       else if IsCaptionLinesVisible and (CurRow=Row) then
       begin
          Canvas.Pen.Color:= clBlack;
          Canvas.MoveTo(0, RowPixel-1);
          Canvas.LineTo(ColWidths[0]-1, RowPixel-1);
          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(0, RowPixel);
          Canvas.LineTo(ColWidths[0]-1, RowPixel);
          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(0, RowPixel);
          Canvas.LineTo(0, RowPixel+RowHeights[row]);
       end
       else begin
          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(0, RowPixel-1);
          Canvas.LineTo(ColWidths[0]-1, RowPixel-1);
          Canvas.Pen.Color:= clBtnHighlight;
          Canvas.MoveTo(0, RowPixel);
          Canvas.LineTo(ColWidths[0], RowPixel);
       end;

    end;

    procedure DarkCaptionLine;
    begin
       if IsCaptionLinesVisible and (CurRow=Row+1) then
       begin
       end
       else if IsCaptionLinesVisible and (CurRow=Row) then
       begin
          Canvas.Pen.Color:= clBlack;
          Canvas.MoveTo(0, RowPixel-1);
          Canvas.LineTo(ColWidths[0]-1, RowPixel-1);
          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(0, RowPixel);
          Canvas.LineTo(ColWidths[0]-1, RowPixel);
          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(0, RowPixel);
          Canvas.LineTo(0, RowPixel+RowHeights[row]);
       end
       else begin
          Canvas.Pen.Color:= clBlack;
          Canvas.MoveTo(0, RowPixel-1);
          Canvas.LineTo(ColWidths[0]-1, RowPixel-1);
          Canvas.Pen.Color:= clBtnHighlight;
          Canvas.MoveTo(0, RowPixel);
          Canvas.LineTo(ColWidths[0], RowPixel);
       end;
    end;

    procedure ButtonCaptionLine;
    begin
       if IsCaptionLinesVisible and (CurRow=Row+1) then
       begin
       end
       else if IsCaptionLinesVisible and (CurRow=Row) then
       begin
          Canvas.Pen.Color:= clBlack;
          Canvas.MoveTo(0, RowPixel-1);
          Canvas.LineTo(ColWidths[0]-1, RowPixel-1);
          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(0, RowPixel-2);
          Canvas.LineTo(ColWidths[0]-1, RowPixel-2);
          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(0, RowPixel);
          Canvas.LineTo(ColWidths[0]-1, RowPixel);
       end
       else begin
          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(0, RowPixel-2);
          Canvas.LineTo(ColWidths[0]-1, RowPixel-2);
          Canvas.Pen.Color:= clBlack;
          Canvas.MoveTo(0, RowPixel-1);
          Canvas.LineTo(ColWidths[0]-1, RowPixel-1);
          Canvas.Pen.Color:= clBtnHighlight;
          Canvas.MoveTo(0, RowPixel);
          Canvas.LineTo(ColWidths[0], RowPixel);
       end;
    end;

   procedure EndPainting;
   var r, sourceRect: TRect;
       PaintClipRect: TRect;
       tempRect: TRect;
   begin
     if (inherited Canvas = Canvas) then exit;
     r := ClientRect;

     OffsetRect(r, 1, 0);
     (inherited Canvas).CopyMode:= cmSrcCopy;

     PaintClipRect:= FPaintCanvas.ClipRect;
     if PaintClipRect.Right>ClientRect.Right then
     begin
        PaintClipRect.Right:= ClientRect.Right;
     end;
     if UpdateRect.Bottom>ClientRect.Bottom then
     begin
        UpdateRect.Bottom:= ClientRect.Bottom;
     end;

     if (UpdateRect.Top=0) and (UpdateRect.Bottom=0) and
        (UpdateRect.Left=0) and (UpdateRect.Right=0) then
        UpdateRect:= PaintClipRect;
     SourceRect:= Rect(0,UpdateRect.Top,
        PaintClipRect.Right, UpdateRect.Bottom );
     { Remove painting of currently edited cell }
     if not (csDesigning in ComponentState) and (FFocused) and (HaveVisibleItem) then
     begin
       TempRect:= CellRect(1,Row);
       TempRect.Left:= TempRect.Left + 1; { Used to be +2, but richedit gray line would show after resizing }

       if CurrentCustomEdit<>nil then
       begin
         SendMessage(currentcustomedit.handle,
           em_getrect, 0, Integer(@editrect));
//        TempRect.Right:= EditRect.Right; { Bad form combos, perhaps should just do for richedit |
       end;

       { 7/19/00 - RSW - Don't remove inplaceeditor painting if it has the focus}
       if (ActiveEdit<>nil) and (ActiveEdit<>InplaceEditor) and (not UseCheckbox(Row)) then
//       if (ActiveEdit<>nil) and (not UseCheckbox(Row)) then
           FPaintCanvas.CopyRect(tempRect,
              inherited Canvas, tempRect);
     end;

//     TempRect.Bottom:= TempRect.Bottom -1;

{     inherited Canvas.CopyRect(
        Rect(0,UpdateRect.Top,
        PaintClipRect.Right, UpdateRect.Bottom),
        FPaintCanvas, SourceRect);
}
     SourceRect:= Rect(0, 0, ClientRect.Right, ClientRect.Bottom);
     inherited Canvas.CopyRect(SourceRect, FPaintCanvas, SourceRect);
   end;

   { Paint custom controls that do not support temporary canvas }
   procedure ExtraPaint;
   var ARect: TRect;
       exStyle, origStyle: longint;
       obj: TwwInspectorItem;
       i: integer;
   begin
     for i:= 0 to ExtraPaintList.count-1 do begin
        obj:= TwwInspectorItem(ExtraPaintList[i]);
        OrigStyle:= Windows.GetWindowLong(obj.customControl.handle, GWL_EXSTYLE);

        { 7/19/00 - Richedit paint problem when dragging dialog in front }
        if (GetRowByItem(obj) = Row) and (FFocused) then
           exStyle:= OrigStyle
        else
           exStyle:= OrigStyle or WS_EX_TRANSPARENT;
        Windows.SetWindowLong(obj.customControl.handle, GWL_EXSTYLE, exStyle);
        SetBkMode(Canvas.Handle, TRANSPARENT);
        ARect:= CellRect(1, GetRowByItem(obj));

        try
          obj.customControl.PaintTo(Canvas.Handle, ARect.Left, ARect.Top);
        finally
          SetBkMode(Canvas.Handle, OPAQUE);
        end;

        Windows.SetWindowLong(obj.customControl.handle, GWL_EXSTYLE, OrigStyle);
        ValidateRect(Handle, @ARect); // 8/1/00 - Put this line back in to avoid flicker when
                                      // expanding all
     end
   end;


begin

   if not IsFocused then
   begin
      HideEditor;  { Make sure inplaceeditor is not visible when inspector doesn't have focus }
   end;

   OldDesigning:= csDesigning in ComponentState;
//   if OldDesigning then SetDesigning(False);

   UseTempCanvas:= True;
   ExtraPaintList.clear;

   GetUpdateRect(Handle, UpdateRect, False);
   FPaintBitmap.Width := ClientWidth;
   FPaintBitmap.Height:= ClientHeight;
   if FixedColor=clNone then
      Canvas.Brush.Color:= clWindow
   else
      Canvas.Brush.Color:= FixedColor;
   TempRect:= ClientRect;
   TempRect.Right:= ColWidths[0];
   Canvas.FillRect(TempRect);

   if Color=clNone then
      Canvas.Brush.Color:= clWindow
   else
      Canvas.Brush.Color:= Color;
   TempRect:= ClientRect;
   TempRect.Left:= ColWidths[0];
   Canvas.FillRect(TempRect);

   try

     if Assigned(FOnBeforePaint) then
     begin
        FOnBeforePaint(self);
     end;
     if CheckRowCount then FirstTimePaint;
     UpdateRowCount;
//     RefreshItem(nil);   { Updates rowcount based on current items }

//   Update;  { Allow custom controls to finish painting so that lines are drawn on top of them.

     CalcDrawInfo(DrawInfo);

     RowPixel:= 0;
     for CurRow:= TopRow to RowCount do
     begin
        case LineStyleCaption of
          ovDottedLine : DottedCaptionLine;
          ovLight3DLine: LightCaptionLine;
          ovDark3DLine: DarkCaptionLine;
          ovButtonLine : ButtonCaptionLine;
        end;

        if CurRow>=TopRow then
        begin
          case LineStyleData of
            ovDottedLine : DottedDataLine;
            ovLight3DLine: LightDataLine;
            ovDark3DLine: DarkDataLine;
            ovButtonLine: ButtonDataLine;
          end;
        end;

        if (LineStyleData = ovButtonLine) and
           (CurRow <> Row){ and (CurRow <> Row+1)} and
           (CurRow<RowCount) then begin
          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(ColWidths[0]-2, RowPixel);
          Canvas.LineTo(ColWidths[0]-2, RowPixel+RowHeights[CurRow]);
          Canvas.Pen.Color:= clBtnHighlight;
          Canvas.MoveTo(0, RowPixel);
          Canvas.LineTo(0, RowPixel+RowHeights[CurRow]);
          Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(ColWidths[0]+ColWidths[1]-1, RowPixel);
          Canvas.LineTo(ColWidths[0]+ColWidths[1]-1, RowPixel+RowHeights[CurRow]);
        end
        else if (LineStyleData = ovButtonLine) and
           (CurRow = Row) and (CurRow<RowCount) then begin
          if not IsCaptionLinesVisible then begin
            Canvas.Pen.Color:= clBtnShadow;
            Canvas.MoveTo(ColWidths[0], RowPixel);
            Canvas.LineTo(ColWidths[0], RowPixel+RowHeights[CurRow]);
            Canvas.MoveTo(ColWidths[0]-2, RowPixel);
            Canvas.LineTo(ColWidths[0]-2, RowPixel+RowHeights[CurRow]);
          end;

          if not IsCaptionLinesVisible then
            Canvas.Pen.Color:= clBtnHighlight
          else Canvas.Pen.Color:= clBtnShadow;
          Canvas.MoveTo(0, RowPixel);
          Canvas.LineTo(0, RowPixel+RowHeights[CurRow]);

          if BorderStyle = bsNone then begin
             Canvas.Pen.Color:= clBtnHighlight;
             Canvas.MoveTo(ColWidths[0]+ColWidths[1]-1, RowPixel);
             Canvas.LineTo(ColWidths[0]+ColWidths[1]-1, RowPixel+RowHeights[CurRow]);
          end;
        end;

        if curRow<RowCount then inc(RowPixel, RowHeights[CurRow]);
        if RowPixel>DrawInfo.Vert.GridBoundary then break;
     end;

     { Draw separater line }
     if LineStyleData= ovButtonLine then Canvas.Pen.Color:= clBlack
     else Canvas.Pen.Color:= clBtnShadow;
     Canvas.MoveTo(ColWidths[0]-1, 0);
     Canvas.LineTo(ColWidths[0]-1, RowPixel);

     if LineStyleData<>ovButtonLine then begin
        Canvas.Pen.Color:= clBtnHighlight;
        Canvas.MoveTo(ColWidths[0], 0);
        Canvas.LineTo(ColWidths[0], RowPixel);
     end;

     InheritedPaint;
     EndPainting;


     UseTempCanvas:= False;

     ExtraPaint;

     if useDefaultEditor and (inplaceeditor<>nil) then begin
        inplaceeditor.invalidate;
        inplaceeditor.update;
        ValidateRect(Handle, nil);
     end
     else begin
        if CurrentCustomEdit<>nil then begin
           if not CurrentCustomEdit.visible then
           begin
              CurrentCustomEdit.visible:= true;
              TEdit(CurrentCustomEdit).modified:= false;
           end;
           if IsActiveControl then { 10/11/99 - Only set focus if this is the active control }
             CurrentCustomEdit.setfocus;
//           if not (CurrentCustomEdit is TCustomMemo) then
//              TEdit(CurrentCustomEdit).Font.Color:= clBlack; { !! Change later to be based on propertyFocusTextColor }
           CurrentCustomEdit.update; { Finish before line painting at end of paint routine}
           HideEditor;
        end;
     end;

     { Draw active row in 3D depressed}
//     if not (ovHighlightActiveRow in Options) then exit;

     RowPixel:= CellRect(0, Row).top;
     if FFocused then begin
        Canvas.Pen.Color:= clBlack;
        if IsCaptionLinesVisible then
           Canvas.MoveTo(0, RowPixel-1)
        else
           Canvas.MoveTo(ColWidths[0]+1, RowPixel-1);
        Canvas.LineTo(ColWidths[0]+ColWidths[1], RowPixel-1);
     end;

     Col1UnderlineWidth:= ColWidths[1];
     if (CurrentCustomEdit<>nil) and
        ((Screen.ActiveControl=currentcustomedit) or
         (Screen.ActiveControl=self)) then
     begin
        SendMessage(currentcustomedit.handle,
           em_getrect, 0, Integer(@editrect));
        if currentcustomedit is TCustomMemo then
           Col1UnderlineWidth:= 1 + currentcustomedit.ClientWidth
        else
//           Col1UnderlineWidth:= 2 + EditRect.Right;
           Col1UnderlineWidth:= 2 + currentcustomedit.width; { Underline entire line }
     end;

     { Draw caption highlight line for active row }
     if FFocused then
     begin
       RowPixel:= CellRect(0, Row).Bottom;
       if (ovHighlightActiveRow in Options) then
          Canvas.MoveTo(0, RowPixel-1)
       else
          Canvas.MoveTo(ColWidths[0], RowPixel-1);

       if ColorToRGB(CaptionColor)=ColorToRGB(clBtnHighlight) then
          Canvas.Pen.Color:= clBlack
       else Canvas.Pen.Color:= clBtnHighlight;
       Canvas.LineTo(ColWidths[0], RowPixel-1);

       if (LineStyleCaption in [ovLight3DLine, ovDark3dLine, ovButtonLine]) or
          (not Focused or useCheckbox(Row) or not useDefaultEditor) then
       begin
          if ColorToRGB(Color)=ColorToRGB(clBtnHighlight) then
             Canvas.Pen.Color:= clBlack
          else Canvas.Pen.Color:= clBtnHighlight;
          Canvas.LineTo(ColWidths[0]+Col1UnderlineWidth, RowPixel-1);
       end;

(*
       if LineStyleCaption in [ovDottedLine, ovNoLines] then
       begin
         if not Focused or useCheckbox(Row)) then begin
            if ColorToRGB(Color)=ColorToRGB(clBtnHighlight) then
               Canvas.Pen.Color:= clBlack;
            else Canvas.Pen.Color:= clBtnHighlight
            Canvas.LineTo(ColWidths[0]+Col1UnderlineWidth, RowPixel-1);
         end
       end
       else if LineStyleCaption in [ovLight3DLine, ovDark3dLine, ovButtonLine] then
       begin
          Canvas.LineTo(ColWidths[0]+Col1UnderlineWidth, RowPixel-1)
       end;
*)
       if ColorToRGB(Color)=ColorToRGB(clBtnHighlight) then { if dotted line was overwritten by custom control }
       begin
          CurRow:= Row;
          case LineStyleData of
            ovDottedLine : DottedDataLine;
            ovLight3DLine: LightDataLine;
            ovDark3DLine: DarkDataLine;
            ovButtonLine: ButtonDataLine;
          end;
       end;
(*       if ColorToRGB(CaptionColor)=ColorToRGB(clBtnHighlight) then { if dotted line was overwritten by custom control }
       begin
          CurRow:= Row;
          case LineStyleData of
            ovDottedLine : DottedCaptionLine;
            ovLight3DLine: LightCaptionLine;
            ovDark3DLine: DarkCaptionLine;
            ovButtonLine: ButtonCaptionLine;
          end;
       end;
*)
     end;

     obj:= ActiveItem;
     if obj<>LastActiveItem then
     begin
        LastActiveItem:= obj;
        if Assigned(FOnAfterSelectCell) then begin
           FOnAfterSelectCell(Self, Obj);
        end;
     end;

   finally
     UseTempCanvas:= False;
   end;

end;

function TwwDataInspector.CanEditShow: Boolean;
//var
//   customEdit: TCustomEdit;
//   obj: TwwInspectorItem;
begin
  Result := inherited CanEditShow;
  if Result then
  begin
//     obj:= GetItemByRow(Row);
     result:= UseDefaultEditor;
//     result:= (Obj<>nil) and (obj.CustomControl=nil) and not (obj.Field is TDateTimeField)
  end;

end;

procedure TwwDataInspector.TopLeftChanged;
var NextItem: TwwInspectorItem;
    i: integer;
begin
  inherited;
  if Assigned(FOnTopLeftChanged) then FOnTopLeftChanged(Self);

  if CurrentCustomEdit<>nil then
  begin
     { Set focus to objectview so that it won't go to some other control }
     if Screen.activecontrol=CurrentCustomEdit then SetFocus;
     CurrentCustomEdit.Hide;
     CurrentCustomEdit:= nil;
  end;

  if not FastDesign then exit;

  if FTopItem=nil then
  begin
     FTopItem:= GetFirstChild;
     if FTopItem=nil then exit;
  end;

  if (TopRow>OldTopRow) then
  begin
     if (TopRow-OldTopRow<100) then begin
        for i:= 1 to TopRow-OldTopRow do
        begin
           NextItem:= FTopItem.GetNext(True);
           if NextItem<>nil then FTopItem:=NextItem
           else break;
        end
     end
     else FTopItem:= GetItemByRow(TopRow, False);
  end
  else begin
     if (OldTopRow-TopRow<100) then
     begin
        for i:= 1 to OldTopRow-TopRow do
        begin
           NextItem:= FTopItem.GetPrior(True);
           if NextItem<>nil then FTopItem:=NextItem
           else break;
        end;
     end
     else FTopItem:= GetItemByRow(TopRow, False)
  end;

  OldTopRow:= TopRow;
end;

procedure TwwDataInspector.DoExit;
begin
   if CurrentCustomEdit<>nil then
   begin
      CurrentCustomEdit.hide;
      CurrentCustomEdit:= nil;
   end;
   HideEditor;
   inherited doExit;
end;

function TwwDataInspector.CreateEditor: TInplaceEdit;
begin
  Result := TwwDataInspectorEdit.wwCreate(Self, 0);
end;

constructor TwwDataInspectorEdit.wwCreate(AOwner: TComponent; dummy: integer);
begin
  Create(AOwner);
  FwwPicture:= TwwDBPicture.create(self);
  ParentGrid:= Owner as TwwDataInspector;
  FWordWrap:= False;
//  FWordWrap:= TwwDataInspector(ParentGrid).WordWrap;
  {$ifdef wwDelphi3Up}
  ImeMode := ParentGrid.ImeMode;
  ImeName := ParentGrid.ImeName;
  {$endif}
end;

destructor TwwDataInspectorEdit.Destroy;
begin
  FwwPicture.Free;
  inherited Destroy;
end;

{ Convert cr to tab }
procedure TwwDataInspectorEdit.KeyDown(var Key: Word; Shift: TShiftState);
  procedure SendToParent;
  begin
     ParentGrid.setFocus;
     ParentGrid.KeyDown(Key, Shift);
     Key := 0;
     Update;
  end;

  procedure SendToObjectView;
  begin
//    ParentGrid.setFocus;
     ParentGrid.KeyDown(Key, Shift);
  end;

  procedure ParentEvent;
  var
    GridKeyDown: TKeyEvent;
  begin
    GridKeyDown := ParentGrid.OnKeyDown;
    if Assigned(GridKeyDown) then GridKeyDown(ParentGrid, Key, Shift);
  end;

  function Ctrl: Boolean;
  begin
    Result := ssCtrl in Shift;
  end;


begin
  case Key of
    VK_RETURN:
	 if ovEnterToTab in ParentGrid.Options then
	 begin
	    SendToParent;
	 end;
    VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT, VK_ESCAPE: SendToParent;
    VK_INSERT:
      if Shift = [] then SendToParent
      else if (Shift = [ssShift]) and not ParentGrid.CanEditModify then Key := 0;
    VK_LEFT: SendToObjectView;
    VK_RIGHT:  SendToObjectView;
//    VK_LEFT: if Ctrl then SendToParent;
//    VK_RIGHT: if Ctrl then SendToParent;
    VK_HOME: if Ctrl then SendToParent;
    VK_END: if Ctrl then SendToParent;
    VK_F2:
      begin
        ParentEvent;
        if Key = VK_F2 then
        begin
          Deselect;
          Exit;
        end;
      end;
    VK_TAB: if not (ssAlt in Shift) then SendToParent;
  end;
  if (Key = VK_DELETE) and not ParentGrid.CanEditModify then Key := 0;
  if Key <> 0 then
  begin
    ParentEvent;
    if Assigned(OnKeyDown) then OnKeyDown(Self, Key, Shift);
  end;
end;

procedure TwwDataInspectorEdit.BoundsChanged;
var
  R: TRect;
begin
  { Inplaceeditor is one pixel too tall, so shrink it }
  SetWindowPos(Handle, HWND_TOP, Left, Top, Width, Height-1,
        SWP_SHOWWINDOW or SWP_NOREDRAW);
        
  R := Rect(2, 1, Width - 2, Height);
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@R));
  SendMessage(Handle, EM_SCROLLCARET, 0, 0);
end;

procedure TwwDataInspectorEdit.KeyUp(var Key: Word; Shift: TShiftState);
begin
   if (ovEnterToTab in ParentGrid.Options)and (Key=VK_RETURN) then Key:= 9;
   inherited KeyUp(Key, Shift);
   if (Key= VK_DELETE) then
   begin
      if Assigned(parentGrid.FOnCheckValue) then
	 IsValidPictureValue(Text);
   end
end;

procedure TwwDataInspectorEdit.KeyPress(var Key: Char);
var pict: TwwPictureValidator;
    s: string;
    res: TwwPicResult;
    padlength, OldSelStart, Oldlen, OldSelLen: integer;
    DisplayTextIsInvalid, skipInvalidValueTest: boolean;

   Function NewText: string;
   var curStr : string;
   begin
      curStr:= Text;
      if (ord(key)=vk_back) then begin
	 if (length(curstr)>=1) then
	    delete(curstr, selStart, 1);
	 result:= curStr;
      end
      else
	 result:= copy(curStr, 1, selStart+1-1) +
	       char(Key) + copy(curStr, selStart + 1 + length(SelText), 32767);
   end;


begin
  if (ovEnterToTab in ParentGrid.Options) and (ord(Key)=VK_RETURN) then Key:= #9;
  inherited KeyPress(Key);

  if HavePictureMask then begin
     if (ord(Key) = VK_BACK) then
     begin
       if Assigned(parentGrid.FOnCheckValue) then IsValidPictureValue(NewText);
       exit;
     end;
     if (ord(key)<VK_SPACE) then exit;

     s:= NewText;
     if (Maxlength>0) and (length(s)>MaxLength) and (length(s)>length(Text)) then exit; { Limit to maxlength }

     pict:= TwwPictureValidator.create(FwwPicture.PictureMask, FwwPicture.AutoFill);
     res:= Pict.picture(s, FwwPicture.AutoFill);
     DisplayTextIsInvalid:= False;
     SkipInvalidValueTest:= False;

     oldSelStart:= SelStart;
     oldLen:= length(Text);
     oldSelLen:= SelLength;

     case res of
       prError: begin
	     { If at end of list }
	     if (selStart + length(selText) >= length(Text)) then begin
		key:= char(0);
		MessageBeep(0);
               SkipInvalidValueTest:= True; { 2/4/98 - Rely upon previous call }
	     end
	     else DisplayTextIsInvalid:= True;
	 end;

       prIncomplete: begin
	    padLength := length(s) - length(text);
	    text:= s;
	    (Owner as TwwDataInspector).FEditText:= Text;
	    if (oldSelLen=oldLen) then selStart:= length(s)
	    else selStart:= OldSelStart + padLength;
	    key:= char(0);
	    DisplayTextIsInvalid:= True;
	    end;

       prComplete: begin
            {11/21/96 - Workaround for Delphi 2 bug in scrolling in unbordered control}
             text:= s;
             (Owner as TwwDataInspector).FEditText:= s;
             if (oldSelLen=oldLen) then selStart:= length(s)
             else if (length(s)>oldlen) then
                selStart:= oldSelStart + (length(s)-oldlen) {Move caret to the right}
             else selStart:= oldSelStart + 1;  { 11/26/96 }
             selLength:= 0;  { 8/12/97 }
             key:= char(0);
             modified:= true; { 11/3/99 - Allow inspector item change event to fire }
	 end;

     end;
     pict.Free;

     if (not SkipInvalidValueTest) and
        Assigned(parentGrid.FOnCheckValue) then
	parentGrid.FOnCheckValue(self, not DisplayTextIsInvalid);

  end;
end;

{ Allow paste to change text - 10/29/96 }
procedure TwwDataInspectorEdit.WMPaste(var Message: TMessage);
begin
  inherited;
  if not ParentGrid.CanEditModify then exit;
end;

procedure TwwDataInspectorEdit.SetWordWrap(val: boolean);
begin
   FWordWrap:= val;
   RecreateWnd;
end;

procedure TwwDataInspectorEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style and not (ES_AUTOVSCROLL or ES_WANTRETURN);
  if (BorderStyle = bsNone) or WordWrap then Params.Style:= Params.Style or ES_MULTILINE;
  if WordWrap then Params.Style := (Params.Style or ES_AUTOVSCROLL) and not ES_AUTOHSCROLL;
end;

function TwwDataInspectorEdit.IsValidPictureValue(s: string): boolean;
var pict: TwwPictureValidator;
    res: TwwPicResult;
begin
   if s='' then
      result:= True
   else if not HavePictureMask then
      result:= True
   else begin
      pict:= TwwPictureValidator.create(FwwPicture.PictureMask, FwwPicture.AutoFill);;
      res:= Pict.picture(s, False);
      result := res = prComplete;
      pict.Free;
   end;
   if Assigned(parentGrid.FOnCheckValue) then
      parentGrid.FOnCheckValue(self, result);
end;

procedure TwwDataInspectorEdit.UpdateContents;
var obj: TwwInspectorItem;
    ARect: TRect;
begin
   inherited;
   obj:= ParentGrid.GetItemByRow(ParentGrid.Row);
   if obj=nil then exit;  //4/25/2000 PYW Make sure Obj is not nil.  This can happen when reassigning the datasource.
   ReadOnly:= obj.ReadOnly;
   ARect:= ParentGrid.CellRect(ParentGrid.Row, 1);
   FWordWrap:= (obj.WordWrap) or
               (obj.field is TBlobField) {and
               (not wwIsSingleLineEdit(ParentGrid.Canvas.Handle, ARect, 0))};
   RecreateWnd;
end;

procedure TwwDataInspectorEdit.WMSetFocus(var Message: TWMSetFocus);
var tempMask: string;
    tempAutoFill: boolean;
    obj: TwwInspectorItem;
begin
  inherited;
  with ParentGrid do begin
     obj:= GetItemByRow(Row);

     if parentGrid.PictureMaskFromDataSet and (obj.Field<>nil) then begin
        if (parentGrid.datasource=nil) or (parentGrid.datasource.dataset=nil) then exit;
        wwPictureByField(Datasource.dataset, obj.Field.FieldName, True,
    		      tempMask, tempAutoFill, FUsePictureMask);
        FwwPicture.PictureMask:= tempMask;
        FwwPicture.AutoFill:=tempAutoFill;
        FwwPicture.AllowInvalidExit:= False;
        IsValidPictureValue(obj.Field.text)
     end
     else TwwDataInspectorEdit(InplaceEditor).Picture.Assign(obj.Picture);
  end;

//  if ReadOnly then HideCaret(Handle)

end;


Function TwwDataInspectorEdit.HavePictureMask: boolean;
begin
   result:=
//     FUsePictureMask and
     (FwwPicture.PictureMask<>'')
end;

procedure TwwDataInspectorEdit.CMFontChanged(var Message: TMessage);
var
  Loc: TRect;
begin
  inherited;
  Loc.Bottom :=ClientHeight;
  Loc.Right := ClientWidth-1;
  if BorderStyle = bsNone then begin
     Loc.Top := 2;
     Loc.Left := 2;
  end
  else begin
     Loc.Top := 0;
     Loc.Left := 0;
  end;
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@Loc));  { Use 2 pixel border on top and left }
end;

procedure TwwDataInspector.ValidationErrorUsingMask(Item: TwwInspectorItem);
var msg: string;
    doDefault: boolean;
begin
  msg:= Format(SMaskEditErr, ['']);
  DoDefault:= True;
  if Assigned(FOnValidationErrorUsingMask) then
     FOnValidationErrorUsingMask(self, Item, msg, doDefault);
  if doDefault then
  begin
     MessageBeep(0);
     raise EInvalidOperation.create(msg);
  end
end;

procedure TwwDataInspector.UpdateData;
var NewDate, NewTime: TDateTime;
    obj: TwwInspectorItem;
    editor: TwwDataInspectorEdit;
begin
  obj:= GetItemByRow(Row);

  if (InplaceEditor <> nil) then
  begin
     editor:= TwwDataInspectorEdit(InplaceEditor);
     if (editor.HavePictureMask) and
        (FDataLink as TwwDataInspectorDataLink).isFieldModified and
        (not editor.IsValidPictureValue(editor.Text)) and
        (not editor.Picture.AllowInvalidExit) then
     begin
         ValidationErrorUsingMask(obj);
         exit;
     end
  end;

  if obj.Field<>nil then begin
     { Handle 2 digit year logic }
     TextIsSame:= (obj.Field.Text = FEditText);

     if (obj.Field is TBlobField) and (obj.Field.DataType=ftMemo) then
     begin
        obj.Field.asString:= FEditText;
     end
     else if (obj.Field is TDateTimeField) and
        wwStrToDate(FEditText) then
     begin
        { Uses 1950 as Epoch Date for 2 digt years }
        if wwScanDate(FEditText, NewDate) then { 10/12/98 - Avoid converting 4 digit years}
        begin
           NewTime:= Frac(StrToDateTime(FEditText));
           TDateTimeField(obj.Field).asDateTime:= NewDate + NewTime;
        end;
     end
     else
        obj.Field.Text := FEditText;

     if not TextIsSame then
        FieldChanged(obj.Field);
  end
end;

procedure TwwDataInspector.FieldChanged(Field: TField);
var i: integer;
    obj: TwwInspectorItem;
begin
  DoFieldChanged(Field);
  for i:= TopRow to TopRow + VisibleRowCount-1 do
  begin
     obj:= GetItemByRow(i);
     if (obj<>nil) and (Field<>nil) and (obj.Field=Field) then
        InvalidateRow(i);
  end;
end;

procedure TwwDataInspector.DoItemChanged(Item: TwwInspectorItem; NewValue: string);
begin
  if Assigned(FOnItemChanged) then
     FOnItemChanged(self, Item, NewValue);
end;

procedure TwwDataInspector.DoFieldChanged(Field: TField);
begin
  if Assigned(FOnFieldChanged) then
     FOnFieldChanged(self, Field);
end;

procedure TwwDataInspector.RecordChanged(Field: TField);
var
  R: TRect;
//  obj: TwwInspectorItem;
begin
  if not HandleAllocated then Exit;

//  obj:= GetItemByRow(Row);

  R:= CellRect(1, Row);
  InvalidateRect(Handle, @R, False);
(* // Calling InvalidateEditor would cause the text to all get selected when going into edit mode
  if ((Field = nil) or ((obj.Field<>nil) and (obj.Field = Field)) and
    (obj.Field.Text <> FEditText)) then
  begin
    InvalidateEditor;
    { This code would cause the text to go to the end of instead of replacing the highlighted text }
    { Perhaps should make this a property instead to enable this behavior }
//    if InplaceEditor <> nil then InplaceEditor.Deselect;
  end;
*)
end;

procedure TwwDataInspector.DataChanged;
begin
  if not HandleAllocated then Exit;

  { 2/10/00 }
  if activeitem<>nil then
     if (activeitem.datasource=datasource) or ChildDataChanged then
       InvalidateEditor;

  ValidateRect(Handle, nil);
  Invalidate;
end;

function TwwDataInspector.GetField(ARow: integer): TField;
var obj: TwwInspectorItem;
begin
  obj:= GetItemByRow(Row); { 4/26/00 - Check for nil obj }
  if obj=nil then result:=nil
  else result:= obj.Field;
end;

function TwwDataInspector.CanEditModify: Boolean;
var obj: TwwInspectorItem;
    DoEdit: boolean;
begin
  Result := False;
  obj:= GetItemByRow(Row);

  if FDataLink.DataSet=nil then
//  if obj.DataLink.DataSet=nil then
  begin
     Result:=  (not ReadOnly) and (not obj.ReadOnly) and (RowCount>0);
     exit;
  end;

  { Don't allow insert/edit if no records and ovallowinsert is false }
  if (datasource<>nil) and (datasource.dataset<>nil) and
     Datasource.dataset.BOF and datasource.dataset.EOF and
     (datasource.state = dsBrowse) {and not (ovAllowInsert in Options) }then
  begin
     exit;
  end;

  DoEdit:=  not ReadOnly and
            FDatalink.Active and not FDatalink.Readonly and
            (RowCount > 0) and (not obj.ReadOnly);


  if obj.Field<>nil then begin
     DoEdit:= DoEdit and
       ((obj.Field.CanModify) or (not obj.Field.ReadOnly));
  end;

  if DoEdit then
  begin
{     FDatalink.Edit;
     Result := FDatalink.Editing;
     if Result then TwwDataInspectorDataLink(FDatalink).Modified;
}
     if FDataLink <> obj.DataLink then  { Related table need to go into edit mode }
     begin
        obj.Datalink.Edit;
        Result := obj.Datalink.Editing;
        if Result then TFieldDataLink(obj.DataLink).Modified;
        if Result then TwwDataInspectorDataLink(FDatalink).Modified;
     end
     else begin
        FDatalink.Edit;
        Result := FDatalink.Editing;
        if Result then TwwDataInspectorDataLink(FDatalink).Modified;
     end;

  end;
end;

procedure TwwDataInspector.WMVScroll(var Message: TWMVScroll);
var    i: Integer;
    SpecialHide: boolean;
    PrevTopRow: integer;
begin
   PrevTopRow:= TopRow;
   BeginUpdate;
//   SendMessage(Handle, WM_SETREDRAW, 0, 0);

   case Message.ScrollCode of
     SB_THUMBTRACK:
       begin
          InTracking:= True;
          TabStop:= False;
       end;

     SB_ENDSCROLL:
       begin
          if InTracking then
          begin
//             ModifyScrollBar(SB_VERT, Message.ScrollCode, Message.Pos, True);
             inherited;
             TabStop:= True;
             InTracking:= False;
             EndUpdate;
             invalidateRow(Row); {otherwise caret does not seem to show }
             exit;
          end;
       end;

   end;

  if csDesigning in ComponentState then
  begin
    SpecialHide:= False;
    for i:= 0 to Items.Count-1 do
    begin
       if Items[i].CustomControl<>nil then
       begin
          if Items[i].CustomControl.visible then
          begin
             SpecialHide:= True;
             Items[i].CustomControl.visible:= False;
             Items[i].CustomControl.Update;
          end
       end;
    end;
    if SpecialHide then begin
       invalidate;
       Update;
    end
  end;
  tabstop:= false;
 // ModifyScrollBar(SB_VERT, Message.ScrollCode, Message.Pos, True);
  inherited;
  tabstop:= true;

   EndUpdate;
   if PrevTopRow<>TopRow then
   begin
      if useDefaultEditor then ShowEditor
      else HideEditor;
      invalidate;
      Update;  { So that if scrollbar is dragged quickly causing multiple scrolling
                 operations, the control does not omit painting any area.  This can
                 happen since wm_setreddraw loses the area that is not valid.
                 Alternatively, we could save the cliprect and restore it.  }
   end

end;


function TwwDataInspector.GetEditMask(ACol, ARow: Longint): string;
var Field: TField;
begin
  Result := '';
  if FDatalink.Active then
     Field:= GetField(ARow)
  else Field:= nil;
  if Assigned(Field) then Result := Field.EditMask;
  if Assigned(FOnGetEditMask) then FOnGetEditMask(Self, ACol, ARow, Result);
end;

Procedure TwwDataInspector.LinkActiveCallback(Item: TwwInspectorItem; UserData: Pointer; var AContinue: boolean);
begin
   if Item.CustomControl<>nil then
   begin
      Item.CustomControl.visible:= false;
      wwSetControlDataField(Item.CustomControl, '');
   end
end;

procedure TwwDataInspector.LinkActive(Value: Boolean);
begin
  if (DefaultDateTimePicker<>Nil) then begin
     wwSetControlDataField(FDateTimePicker, ''); {8/5/98 }
  end;
  if (FCombo<>Nil) then begin
     wwSetControlDataField(FCombo, ''); {8/5/98 }
  end;
  if not Value then HideEditor;
  IterateItems(LinkActiveCallback, False, nil);
  CurrentCustomEdit:= nil;

  if InplaceEditor<>nil then TwwDataInspectorEdit(InplaceEditor).UpdateContents;
  ApplySettings;
end;

procedure TwwDataInspector.DoCreateDefaultCombo(ACombo: TwwDBComboBox);
begin
   if Assigned(FOnCreateDefaultCombo) then
      FOnCreateDefaultCombo(self, FCombo);
end;

procedure TwwDataInspector.DoCreateDateTimePicker(ADateTimePicker: TwwDBCustomDateTimePicker);
begin
   if Assigned(FOnCreateDateTimePicker) then
      FOnCreateDateTimePicker(self, FDateTimePicker);
end;

function TwwDataInspector.CreateDateTimePicker: TwwDBCustomDateTimePicker;
begin
   result:= TwwDBDateTimePicker.create(self);
end;


function TwwDataInspector.CreateDefaultCombo: TwwDBComboBox;
begin
   result:= TwwInspectorComboBox.create(self);
end;

function TwwDataInspector.GetDateTimePicker: TwwDBCustomDateTimePicker;
begin
   if FDateTimePicker=nil then
   begin
      FDateTimePicker:= CreateDateTimePicker;
      DoCreateDateTimePicker(FDateTimePicker);
   end;
   Result:= FDateTimePicker;
end;

procedure TwwDataInspector.WMSize(var Message: TWMSize);
begin
  inherited;
  UpdateDataColumnWidth;
end;

procedure TwwDataInspector.Notification(AComponent: TComponent;
  Operation: TOperation);
var i: integer;

  procedure ClearCustomControl(Item: TwwInspectorItem);
  var i: Integer;
  begin
     if Item.CustomControl=AComponent then
        Item.CustomControl:= nil;
     for i:= 0 to Item.Items.Count-1 do
        ClearCustomControl(Item.Items[i]);
  end;

begin
  inherited Notification(AComponent, Operation);
  if csDestroying in ComponentState then exit;
  if (Operation = opRemove) then
  begin
     for i:= 0 to Items.count-1 do
        ClearCustomControl(Items[i]);
  end
end;

procedure TwwDataInspector.SetDesigner(Value: TControl);
begin
  FDesigner := Value;
end;

procedure TwwDataInspector.SetCaptionIndent(val: integer);
begin
   if FCaptionIndent<>val then
   begin
      FCaptionIndent:= val;
      invalidate;
   end;
end;

procedure TwwDataInspector.WMSetFocus(var Msg: TWMSetFocus);
begin
  inherited;
  if not UseDefaultEditor then begin
      HideEditor
  end
  else begin
     if Col=0 then Col:= 1;
     ShowEditor;
     InplaceEditor.SelectAll;
  end;

//  invalidate; { Takes care of problem of notepad in front }
end;

procedure TwwDataInspector.Click;
//var obj: TwwInspectorItem;
begin
   inherited;

   { 11/2/99 - Editor is being shown but it shouldn't be, so hide it }
   if (not useDefaultEditor) and
      ((inplaceEditor<>nil) and inplaceEditor.focused) then
      HideEditor;

{   obj:= GetItemByRow(Row);
   if obj=nil then exit;
   if InplaceEditor=nil then exit;}
end;

procedure TwwDataInspector.IterateItems(
    CallBack: TwwInspectorItemCallback;
    ExpandedOnly: boolean; UserData: Pointer);
var i: Integer;
    continue: boolean;
  procedure Scan(Item: TwwInspectorItem);
  var i: Integer;
  begin
     CallBack(Item, UserData, continue);
     if not continue then exit;

     if not ExpandedOnly or (Item.Expanded and Item.Visible) then
     begin
        for i:= 0 to Item.Items.Count-1 do
           Scan(Item.Items[i]);
     end;
  end;
begin
   continue:= true;
   for i:= 0 to Items.count-1 do
   begin
      Scan(Items[i]);
      if not continue then exit;
   end
end;

procedure TwwDataInspector.SetOptions(Value: TwwDataInspectorOptions);
const
  LayoutOptions = [{ovWordWrap, }ovHighlightActiveRow,
                   ovCenterCaptionVert{, ovCenterCaptionHorz}];
var
  NewGridOptions: TGridOptions;
  ChangedOptions: TwwDataInspectorOptions;
begin
  if FOptions <> Value then
  begin
    NewGridOptions := [goEditing, goAlwaysShowEditor, goThumbTracking];
    if ovRowResize in Value then
      NewGridOptions := NewGridOptions + [goRowSizing];
    if ovColumnResize in Value then
      NewGridOptions := NewGridOptions + [goColSizing, goColMoving];
    if not (ovTabExits in Value) then Include(NewGridOptions, goTabs);
    inherited Options := NewGridOptions;
    ChangedOptions := (FOptions + Value) - (FOptions * Value);
{    if (ovWordWrap in Value) <> (ovWordWrap in FOptions) then
    begin
       if (InplaceEditor<>Nil) then
	  (InplaceEditor as TwwDataInspectorEdit).WordWrap:= (ovWordWrap in Value);
    end;}
    FOptions := Value;
    if ChangedOptions * LayoutOptions <> [] then invalidate; //LayoutChanged;
  end;


end;

procedure TwwDataInspector.RowHeightsChanged;
begin
  inherited;
  if LastDefaultRowHeight<>inherited DefaultRowHeight then
  begin
     ApplySettings;
  end;
  LastDefaultRowHeight:= inherited DefaultRowHeight;
end;

procedure TwwDataInspector.SetDefaultRowHeight(Value: integer);
begin
   FDefaultRowHeight:= Value;
   if FDefaultRowHeight=0 then begin
      ApplySettings;
   end
   else begin
      inherited DefaultRowHeight:= DefaultRowHeight;
   end
end;

procedure TwwDataInspector.SetCaptionFont(Value: TFont);
begin
  FCaptionFont.Assign(Value);
  Invalidate;
end;

procedure TwwDataInspector.CaptionFontChanged(Sender: TObject);
begin
  Invalidate;
end;

procedure TwwDataInspector.InvalidateRow(ARow: integer);
var
  InvalidRect: TRect;
begin
  if not HandleAllocated then Exit;
  InvalidRect:= BoxRect(0, ARow, 1, ARow);
  InvalidRect.Top:= InvalidRect.Top -2;
  InvalidRect.Bottom:= InvalidRect.Bottom + 1;
  Windows.InvalidateRect(Handle, @InvalidRect, False);
end;

procedure TwwDataInspectorEdit.CMExit(var Message: TMessage);
begin
{   try
     ParentGrid.FDataLink.UpdateData;
   except
     SetFocus;
     raise;
   end;
}
   inherited;
//   ParentGrid.invalidateRow(ParentGrid.Row);
end;

procedure TwwDataInspector.FlushContents;
var obj: TwwInspectorItem;
begin
      obj:= GetItemByRow(Row);
      if obj<>nil then begin
         if CurrentCustomEdit<>nil then
         begin
            if CurrentCustomedit is TwwDBComboBox then
               obj.EditText:= TwwDBComboBox(CurrentCustomEdit).Value
            else
               obj.EditText:= TEdit(CurrentCustomEdit).Text;

            if TEdit(CurrentCustomEdit).modified then
               obj.DoItemTextChanged;
         end
         else begin
            if (InplaceEditor<>nil) and Inplaceeditor.modified then
            begin
                obj.DoItemTextChanged;
                InplaceEditor.modified:= false; { 3/11/00 - Clear modified }
            end
         end;
      end;
      FDataLink.UpdateData;
end;

procedure TwwDataInspector.CMExit(var Message: TMessage);
//var obj: TwwInspectorItem;
begin
   try
      FlushContents;
   except
     SetFocus;
     raise;
   end;

   inherited;

   FFocused:= False;
   invalidateRow(Row);
end;

function TwwDataInspector.InValidColSizingArea(x: integer): boolean;
begin
   result:= (X<=ColWidths[0]+3);
end;

procedure TwwDataInspector.WMSetCursor(var Msg: TWMSetCursor);
var
  DrawInfo: TGridDrawInfo;
  State: TGridState;
  Index: Longint;
  Pos, Ofs: Integer;
//  Cur: HCURSOR;
begin
//  Cur := 0;
  with Msg do
  begin
    if HitTest = HTCLIENT then
    begin
      if FGridState = gsNormal then
      begin
        CalcDrawInfo(DrawInfo);
        CalcSizingState(self.HitTest.X, self.HitTest.Y, State, Index, Pos, Ofs,
          DrawInfo);
      end else State := FGridState;

      if State = gsColSizing then
      begin
        if not InValidColSizingArea(self.HitTest.X) then
        begin
           exit;
        end
      end
    end;
  end;
  inherited;

end;

procedure TwwDataInspector.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  if True or SkipErase then begin
     Message.result:= 1;
     exit;
  end
  else inherited;
end;

procedure TwwDataInspector.ToggleCheckbox(obj: TwwInspectorItem);
begin
   if obj.field<>nil then
   begin
      if not CanEditModify then exit;
      if obj.field.text=obj.picklist.items[0] then
         obj.field.text:= obj.picklist.items[1]
      else
         obj.field.text:= obj.picklist.items[0];
      obj.EditText:= obj.field.text;


   end
   else begin
      if obj.EditText=obj.picklist.items[0] then
         obj.EditText:= obj.picklist.items[1]
      else
         obj.EditText:= obj.picklist.items[0]
   end;

   obj.DoItemTextChanged;
//   if Assigned(obj.FItemChanged) then
//      obj.FItemChanged(self, obj, obj.EditText);
end;

procedure TwwDataInspector.WMChar(var Msg: TWMChar);
var obj: TwwInspectorItem;
begin
  if UseCheckbox(Row) then begin
     if (goEditing in inherited Options) and
        (Char(Msg.CharCode) = #32) then
     begin
        Obj:= GetItemByRow(Row);
        ToggleCheckbox(obj);
        InvalidateCell(1, Row);
     end
  end;
//  inherited;
end;

procedure TwwDataInspector.WMPaint(var Message: TWMPaint);
begin
  inherited;
end;

procedure TwwDataInspector.SetLineStyleCaption(val: TwwDataInspectorLineStyle);
begin
   FLineStyleCaption:= val;
   invalidate;
end;

procedure TwwDataInspector.SetDottedLineColor(val: TColor);
begin
   FDottedLineColor:= val;
   invalidate;
end;

procedure TwwDataInspector.SetLineStyleData(val: TwwDataInspectorLineStyle);
begin
   FLineStyleData:= val;
   invalidate;
end;

{ TCustomGrid }
function PointInGridRect(Col, Row: Longint; const Rect: TGridRect): Boolean;
begin
  Result := (Col >= Rect.Left) and (Col <= Rect.Right) and (Row >= Rect.Top)
    and (Row <= Rect.Bottom);
end;


procedure TwwDataInspector.InheritedPaint;
type
  PIntArray = ^TIntArray;
  TIntArray = array[0..MaxCustomExtents] of Integer;
var
  DrawInfo: TGridDrawInfo;
  Sel: TGridRect;
  UpdateRect: TRect;
  FColOffset: integer;

  procedure DrawCells(ACol, ARow: Longint; StartX, StartY, StopX, StopY: Integer;
    Color: TColor; IncludeDrawState: TGridDrawState);
  var
    CurCol, CurRow: Longint;
    Where: TRect;
    DrawState: TGridDrawState;
//    Focused: Boolean;
  begin
    CurRow := ARow;
    Where.Top := StartY;
    while (Where.Top < StopY) and (CurRow < RowCount) do
    begin
      CurCol := ACol;
      Where.Left := StartX;
      Where.Bottom := Where.Top + RowHeights[CurRow];
      while (Where.Left < StopX) and (CurCol < ColCount) do
      begin
        Where.Right := Where.Left + ColWidths[CurCol];
        if (Where.Right > Where.Left) and RectVisible(Canvas.Handle, Where) then
        begin
          DrawState := IncludeDrawState;
//          Focused := IsActiveControl;
          if FFocused and (CurRow = Row) {and (CurCol = Col) } then
            Include(DrawState, gdFocused);
          if PointInGridRect(CurCol, CurRow, Sel) then
            Include(DrawState, gdSelected);
          if not ((gdFocused in DrawState) and (CurCol=Col)) or
            not (goEditing in inherited Options) or
            not EditorMode or (csDesigning in ComponentState) then
          begin
            DrawCell(CurCol, CurRow, Where, DrawState);
          end;
        end;
        Where.Left := Where.Right + DrawInfo.Horz.EffectiveLineWidth;
        Inc(CurCol);
      end;
      Where.Top := Where.Bottom + DrawInfo.Vert.EffectiveLineWidth;
      Inc(CurRow);
    end;
  end;

begin
  if UseRightToLeftAlignment then ChangeOrientation(True);

  UpdateRect := Canvas.ClipRect;
  CalcDrawInfo(DrawInfo);
  with DrawInfo do
  begin
    { Draw the cells in the four areas }
    Sel := Selection;

    FColOffset:= 0;
    DrawCells(0, 0, 0, 0, Horz.FixedBoundary, Vert.FixedBoundary, FixedColor,
      [gdFixed]);
    DrawCells(LeftCol, 0, Horz.FixedBoundary - FColOffset, 0, Horz.GridBoundary,  //!! clip
      Vert.FixedBoundary, FixedColor, [gdFixed]);
    DrawCells(0, TopRow, 0, Vert.FixedBoundary, Horz.FixedBoundary,
      Vert.GridBoundary, FixedColor, [gdFixed]);
    DrawCells(LeftCol, TopRow, Horz.FixedBoundary - FColOffset,                   //!! clip
      Vert.FixedBoundary, Horz.GridBoundary, Vert.GridBoundary, Color, []);

  end;

  if UseRightToLeftAlignment then ChangeOrientation(False);
end;

function TwwDataInspector.IsActiveControl: Boolean;
var
  H: Hwnd;
  ParentForm: TCustomForm;
begin
  Result := False;
  ParentForm := GetParentForm(Self);
  if Assigned(ParentForm) then
  begin
    if (ParentForm.ActiveControl = Self) then
      Result := True
  end
  else
  begin
    H := GetFocus;
    while IsWindow(H) and (Result = False) do
    begin
      if H = WindowHandle then
        Result := True
      else
        H := GetParent(H);
    end;
  end;
end;

procedure TwwDataInspector.ChangeOrientation(RightToLeftOrientation: Boolean);
var
  Org: TPoint;
  Ext: TPoint;
begin
  if RightToLeftOrientation then
  begin
    Org := Point(ClientWidth,0);
    Ext := Point(-1,1);
    SetMapMode(Canvas.Handle, mm_Anisotropic);
    SetWindowOrgEx(Canvas.Handle, Org.X, Org.Y, nil);
    SetViewportExtEx(Canvas.Handle, ClientWidth, ClientHeight, nil);
    SetWindowExtEx(Canvas.Handle, Ext.X*ClientWidth, Ext.Y*ClientHeight, nil);
  end
  else
  begin
    Org := Point(0,0);
    Ext := Point(1,1);
    SetMapMode(Canvas.Handle, mm_Anisotropic);
    SetWindowOrgEx(Canvas.Handle, Org.X, Org.Y, nil);
    SetViewportExtEx(Canvas.Handle, ClientWidth, ClientHeight, nil);
    SetWindowExtEx(Canvas.Handle, Ext.X*ClientWidth, Ext.Y*ClientHeight, nil);
  end;
end;

procedure TwwDataInspector.BeginUpdate;
begin
  if not Showing then exit;
  if FUpdateCount = 0 then SetUpdateState(True);
  Inc(FUpdateCount);
end;

procedure TwwDataInspector.SetUpdateState(Updating: Boolean);
begin
  SendMessage(Handle, WM_SETREDRAW, Ord(not Updating), 0);
end;

procedure TwwDataInspector.EndUpdate(Repaint: boolean = False);
begin
  if not Showing then exit;
  if Repaint then InvalidateInEndUpdate:= True;

  if FUpdateCount>0 then Dec(FUpdateCount);
  if FUpdateCount = 0 then begin
     SetUpdateState(False);
     if InvalidateInEndUpdate then Invalidate;
     InvalidateInEndUpdate:= False;
  end
end;

{Function TwwDataInspector.ItemByFieldName(AFieldName: string): TwwInspectorItem;
begin
   result:= nil;
end;
}

procedure TwwInspectorButtonOptions.SetExpandGlyph(Value: TBitmap);
begin
  FExpandGlyph.Assign(Value);
  Control.Invalidate;
end;

procedure TwwInspectorButtonOptions.SetCollapseGlyph(Value: TBitmap);
begin
  FCollapseGlyph.Assign(Value);
  Control.Invalidate;
end;


constructor TwwInspectorButtonOptions.Create(AOwner: TComponent);
begin
   FExpandGlyph:= TBitmap.create;
   FCollapseGlyph:= TBitmap.create;
   Control:= AOwner as TWinControl;
end;

destructor TwwInspectorButtonOptions.Destroy;
begin
  FExpandGlyph.Free;
  FCollapseGlyph.Free;
  inherited Destroy;
end;

procedure TwwDataInspector.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    { Remove horizontal scrollbar }
    if ScrollBars in [ssHorizontal, ssBoth] then Style := Style and not WS_HSCROLL;
  end;
end;

Procedure TwwDataInspector.SetActiveItem(obj: TwwInspectorItem);
var temprow: integer;
    parentobj: TwwInspectorItem;
    SomethingExpanded: boolean;
begin
   FActiveItem:= obj;

   if obj=nil then exit
   else begin
     { Need to expand parents if necessary }
     parentobj:= obj.parentItem;
     SomethingExpanded:=false;
     while parentobj<>nil do begin
        // 8/1/00 - Otherwise shift-tab causes vertical scrollbar to disappear.
        if (not parentobj.expanded) and (not SomethingExpanded) then begin
           Beginupdate;
           SomethingExpanded:=true;
        end;
        parentobj.expanded:= true;
        parentobj:= parentobj.parentItem;
     end;

     temprow:=GetRowByItem(obj);
     if temprow>=0 then begin
        SetFocusCell(Col, TempRow)
     end;
     if SomethingExpanded then Endupdate;
   end
end;

Function TwwDataInspector.GetActiveItem: TwwInspectorItem;
begin
   if FastDesign then begin
      result:= FActiveItem;
      if result=nil then result:= GetItemByRow(Row, False);
   end
   else
      result:= GetItemByRow(Row, False);
end;

procedure TwwDataInspector.Loaded;
begin
  inherited;
  ApplySettings;
end;

function TwwDataInspector.GetCaptionColor: TColor;
begin
   result:= FixedColor;
end;

procedure TwwDataInspector.SetCaptionColor(val: TColor);
begin
   FixedColor:= val;
end;

constructor TwwInspectorPickList.Create;
begin
   inherited;
   FItems:= TStringList.create;
   FShowMatchText:= True;
   FButtonStyle:= cbsDownArrow;
   FButtonGlyph := TBitmap.Create;
end;

destructor TwwInspectorPickList.Destroy;
begin
   FItems.Free;
   FButtonGlyph.Free;
   inherited Destroy;
end;

procedure TwwInspectorPickList.SetItems(val: TStrings);
begin
   FItems.assign(val);
end;

procedure TwwInspectorPickList.SetButtonGlyph(Value: TBitmap);
begin
  FButtonGlyph.Assign(Value);
end;

procedure TwwInspectorPickList.AssignTo(Dest: TPersistent);
begin
  with Dest as TwwInspectorPickList do
  begin
    Items.Assign(self.Items);
    MapList:= self.MapList;
    DisplayAsCheckbox:= self.DisplayAsCheckbox;
    Style:= self.Style;
    ShowMatchText:= self.ShowMatchText;
    AllowClearKey:= self.AllowClearKey;
    ButtonStyle:= self.ButtonStyle;
    ButtonGlyph.Assign(self.ButtonGlyph);
    ButtonWidth:= self.ButtonWidth;
  end;
end;

function TwwInspectorItem.HaveItems: boolean;
begin
   result:= FItems.count>0;
end;

type
  TwwInspectorFieldDataLink = class(TFieldDataLink)
  protected
    procedure DataSetChanged; override;
  public
    InspectorItem: TwwInspectorItem;
  end;

procedure TwwInspectorFieldDataLink.DataSetChanged;
begin
   inherited;

   { 2/10/2000 - Updates inplaceeditor for this row - Only do if this is the active item}
   if (InspectorItem.Control is TwwDataInspector) then begin
      if InspectorItem = (InspectorItem.Control as TwwDataInspector).ActiveItem then
      begin
         with (InspectorItem.Control as TwwDataInspector) do
         begin
            ChildDataChanged:= True;
            Datalink.DataSetChanged;
            ChildDataChanged:= False;
         end
      end
   end

end;

constructor TwwInspectorItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FWordWrap:= False; {12/11/99 - Default of true was wrong }
  FCustomControlAlwaysPaints:= True;
  FItems:= TwwInspectorCollection.Create(TwwInspectorCollection(Collection).Control);
  FItems.FParentItem:= self;
  FParentItem:= TwwInspectorCollection(Collection).ParentItem;
  FPickList:= TwwInspectorPickList.create;
  FPicture:= TwwDBPicture.create(nil);
  FVisible:= True;
  FResizeable:= false;
  FOptions:= [iioAutoDateTimePicker];
   FTabStop:= True;

  FDataLink := TwwInspectorFieldDataLink.Create;
  TwwInspectorFieldDataLink(FDataLink).InspectorItem:= self;
  FDataLink.Control:= TwwInspectorCollection(Collection).Control;
  if Control is TwwDataInspector then begin
     FDataLink.onDataChange:= (FDataLink.Control as TwwDataInspector).EditDataLinkDataChange;
     FDataLink.onUpdateData:= (FDataLink.Control as TwwDataInspector).EditDataLinkUpdateData;
     TwwDataInspector(Control).CheckRowCount:= True;
  end;
end;

procedure TwwDataInspector.EditDataLinkDataChange(Sender: TObject);
begin
//   TwwDataInspectorDataLink(FDatalink).DataSetChanged;
   invalidate;
end;

procedure TwwDataInspector.EditDataLinkUpdateData(Sender: TObject);
begin
   TwwDataInspectorDataLink(FDatalink).UpdateData;
end;

destructor TwwInspectorItem.Destroy;
begin
   FItems.Free;
   FPickList.Free;
   FPicture.Free;
{   if UseDefaultLookupComboBox then
   begin
      if (CustomControl is TwwDBLookupCombo) and (CustomControl<>nil) then
      begin
         CustomControl.Free;
         CustomControl:= nil;
      end
   end;
}
   if not (csDestroying in Control.ComponentState) and
     (Control is TwwDataInspector) then
   begin
     TwwDataInspector(Control).CheckRowCount:= True;
     TwwDataInspector(Control).Invalidate;
   end;
   FDataLink.Free;
   FDataLink := nil;
   inherited Destroy;
end;

function TwwInspectorItem.GetLevel: integer;
var level: integer;
    tempParent: TwwInspectorItem;
begin
   tempParent:= ParentItem;
   level:= 0;
   while tempParent<>nil do
   begin
       tempParent:= tempParent.ParentItem;
       level:= level + 1;
   end;

   result:= level;

end;

procedure TwwInspectorItem.SetCustomControl(val: TWinControl);
begin
   if (FCustomControlName<>val) then
   begin
      if (val=nil) then
      begin
         FCustomControlName.ControlStyle:=
            FCustomControlName.ControlStyle - [csNoDesignVisible];
         FCustomControlname.parent:= GetParentForm(FCustomControlName);
      end
      else begin
         val.ControlStyle:=
            val.ControlStyle + [csNoDesignVisible];
         val.visible:= false; { 9/27/99 }
      end;

      FCustomControlName:= val;
   end;
   if (TwwInspectorCollection(Collection).UpdateCount=0) and
     (Control is TwwDataInspector) then
   begin
     TwwDataInspector(Control).Update;
     TwwDataInspector(Control).Invalidate; //RefreshItem(self);
     TwwDataInspector(Control).Update;
   end
end;

Function TwwInspectorItem.GetField: TField;
begin
   if (DataSource<>nil) and (DataSource.dataset<>nil) then
      result:= DataSource.DataSet.FindField(DataField)
   else result:= nil;
end;

Function TwwInspectorItem.GetControl: TComponent;
begin
   Result:= TwwInspectorCollection(Collection).Control;
end;

procedure TwwInspectorItem.SetCellHeight(const Value: integer);
begin
   if FCellHeight<>Value then
   begin
     FCellHeight:= Value;
     if Control is TwwDataInspector then
        TwwDataInspector(Control).RefreshItem(self)
   end
end;

procedure TwwInspectorItem.SetVisible(val: boolean);
begin
   if FVisible<>val then
   begin
      FVisible:= val;
      if Control is TwwDataInspector then
        TwwDataInspector(Control).ApplySettings
   end
end;

procedure TwwInspectorItem.SetExpanded(val: boolean);
var inspector: TwwDataInspector;
begin
   if FExpanded<>val then
   begin
      FExpanded:= val;
      if Control is TwwDataInspector then
      begin
        inspector:= TwwDataInspector(Control);
        Inspector.ApplySettings;
      end
   end
end;

procedure TwwInspectorItem.SetCaption(const Value: string);
begin
   FCaption:= Value;
   if GetDesigner<>nil then begin
      GetDesigner.Update;
      if Control is TwwDataInspector then
         TWinControl(Control).Invalidate;
   end
end;

function TwwInspectorItem.GetDataLink: TDataLink;
begin
  result:= FDataLink;
  if (FDataLink<>Nil) and (FDataLink.DataSource=nil) then begin
     if Control is TwwDataInspector then
        result:= TwwDataInspector(Control).DataLink
  end;
end;

function TwwInspectorItem.GetDataSource: TDataSource;
begin
  result := nil;
  if (FDataLink<>Nil) then
     Result := FDataLink.DataSource;
  if result=nil then begin
     if Control is TwwDataInspector then
        result:= TwwDataInspector(Control).DataSource;
  end
end;

procedure TwwInspectorItem.SetDataSource(Value: TDataSource);
begin
   if Control is TwwDataInspector then
   begin
      if Value<>TwwDataInspector(Control).DataSource then
         FDataLink.DataSource := Value
      else
         FDataLink.DataSource:= nil;
   end
   else
      FDataLink.DataSource:= Value;
end;

function TwwInspectorItem.GetDataField: string;
begin
   if FDataLink.DataSource<>nil then
      Result := FDataLink.FieldName
   else
      Result:= FDataField
end;

procedure TwwInspectorItem.SetDataField(const Value: string);
begin
//  if not (csDesigning in ComponentState) then
//    ResetMaxLength(Self);
//   if FDataLink.DataSource<>nil then
      FDataLink.FieldName := Value;
//   else
      FDataField:= Value
end;


procedure TwwInspectorItem.Assign(Source: TPersistent);
begin
  if Source is TwwInspectorItem then
  begin
    EditText:= TwwInspectorItem(Source).EditText;
    Caption:= TwwInspectorItem(Source).Caption;
    CellHeight:= TwwInspectorItem(Source).CellHeight;
    ReadOnly:= TwwInspectorItem(Source).ReadOnly;
    CustomControl:= TwwInspectorItem(Source).CustomControl;
    DataField:= TwwInspectorItem(Source).DataField;
    Resizeable:= TwwInspectorItem(Source).Resizeable;
    Visible:= TwwInspectorItem(Source).visible;
    Tag:= TwwInspectorItem(Source).tag;
    TagString:= TwwInspectorItem(Source).TagString;
    Expanded:= TwwInspectorItem(Source).Expanded;
    if TwwInspectorItem(Source).Items.count>0 then
       Items.Assign(TwwInspectorItem(Source).Items);
    PickList.assign(TwwInspectorItem(Source).PickList);
    Exit;
  end;
  inherited Assign(Source);
end;

function TwwInspectorItem.GetNamePath: string;
var tempName: string;
    tempItem: TwwInspectorItem;
begin
   result:= inherited GetNamePath;
   tempName:= '';
   tempItem:= self;
   repeat
     tempName:= 'Items[' + inttostr(tempItem.index)+ ']' + tempName;
     tempItem:= tempItem.parentItem;
   until tempItem=nil;
   tempName:= Control.name + '.' + tempName;
   result:= tempName;
end;

function TwwInspectorItem.GetDisplayName: string;
var TempText: string;
begin
  if Caption = '' then TempText:= '<InspectorItem>'
  else TempText:= Caption;
  Result := inttostr(Index) + ' - ' + TempText;
end;

function TwwInspectorItem.GetPrior(
      VisibleItemsOnly: boolean = True;
      ExpandedOnly: boolean = False): TwwInspectorItem;
var NextItem, LastChild: TwwInspectorItem;
begin
   nextItem:= GetPriorSibling(VisibleItemsOnly);
   if nextItem<>nil then
   begin
      lastChild:= nextItem.GetLastChild(VisibleItemsOnly, ExpandedOnly);
      if lastChild=nil then result:= nextItem
      else result:= lastChild;
      exit;
   end;

   Result:= ParentItem;
end;

function TwwInspectorItem.GetFirstChild(
   VisibleItemsOnly: boolean = True;
   ExpandedOnly: boolean = False): TwwInspectorItem;
var i: integer;
begin
   result:= nil;
   if ExpandedOnly and (not expanded) then exit;

   for i:= 0 to Items.count-1 do begin
      if (not visibleItemsOnly) or TwwInspectorItem(Items[i]).visible then begin
         result:= TwwInspectorItem(Items[i]);
         break;
      end
   end;
end;

function TwwInspectorItem.GetLastChild(
   VisibleItemsOnly: boolean = True;
   ExpandedOnly: boolean = False): TwwInspectorItem;
var i: integer;
begin
   result:= nil;
   if ExpandedOnly and (not expanded) then exit;

   for i:= Items.count-1 downto 0 do begin
      if (not visibleItemsOnly) or TwwInspectorItem(Items[i]).visible then begin
         result:= TwwInspectorItem(Items[i]);
         break;
      end
   end;
end;

function TwwInspectorItem.GetNext(
      VisibleItemsOnly: boolean = True;
      ExpandedOnly: boolean = False): TwwInspectorItem;
var NextItem, CurItem: TwwInspectorItem;
begin
   nextItem:= GetFirstChild(VisibleItemsOnly, ExpandedOnly);

   if nextItem<>nil then
   begin
      result:= nextItem;
      exit;
   end;

   nextItem:= GetNextSibling(VisibleItemsOnly);
   curItem:= self;

   while (nextItem = nil) and (curItem<>nil) do
   begin
       curItem:= curItem.ParentItem;
       if curItem<>nil then nextItem:= curItem.GetNextSibling(VisibleItemsOnly)
   end;
   Result := nextItem;
end;

function TwwInspectorItem.GetNextSibling(VisibleItemsOnly: boolean = True): TwwInspectorItem;
var i: integer;
begin
   result:= nil;
   for i:= index+1 to Collection.count-1 do begin
      if (not VisibleItemsOnly) or TwwInspectorItem(Collection.Items[i]).visible then begin
         result:= TwwInspectorItem(collection.Items[i]);
         break;
      end
   end;
end;

function TwwInspectorItem.GetPriorSibling(VisibleItemsOnly: boolean = True): TwwInspectorItem;
var i: Integer;
begin
   result:= nil;
   for i:= index-1 downto 0 do begin
      if (not VisibleItemsOnly) or TwwInspectorItem(Collection.Items[i]).visible then begin
         result:= TwwInspectorItem(collection.Items[i]);
         break;
      end
   end;
end;

constructor TwwInspectorCollection.Create(Control: TComponent);
begin
  inherited Create(TwwInspectorItem);
  self.Control:= Control;
end;

destructor TwwInspectorCollection.Destroy;
begin
   inherited Destroy;
end;

function TwwInspectorCollection.Insert(index: integer): TwwInspectorItem;
begin
  Result := TwwInspectorItem(inherited Insert(index));
end;

function TwwInspectorCollection.Add: TwwInspectorItem;
begin
  Result := TwwInspectorItem(inherited Add);
end;

function TwwInspectorCollection.GetItem(Index: Integer): TwwInspectorItem;
begin
  Result := TwwInspectorItem(inherited GetItem(Index));
end;

function TwwInspectorCollection.GetOwner: TPersistent;
begin
  Result := Control;
end;

procedure TwwInspectorCollection.SetItem(Index: Integer; Value: TwwInspectorItem);
begin
  inherited SetItem(Index, Value);
end;

procedure TwwInspectorCollection.Update(Item: TCollectionItem);
begin
end;

procedure TwwInspectorItem.SetItems(Value: TwwInspectorCollection);
begin
  FItems.Assign(Value);
end;

Function TwwInspectorItem.GetDesigner: TControl;
begin
   result:= nil;
   if Control is TwwDataInspector then
      result:= TwwDataInspector(TwwInspectorCollection(Collection).Control).Designer;
end;

procedure TwwInspectorItem.DefineProperties(Filer: TFiler);
begin
//  Filer.DefineProperty('ItemsTest', ReadItems, WriteItems, HaveItems);
  inherited DefineProperties(Filer);
end;
{
procedure TwwDataInspector.Click;
begin
   inherited Click;
end;
}
procedure TwwDataInspector.CMEnter(var Message: TCMEnter);
begin
  inherited;
  FFocused:= True;
  if SetFocusTabStyle = itsResetActiveItem then begin
     Row:= 0;
  end;
  InvalidateRow(Row);
end;

type
  TwwCollectionStreamComponent=class(Tcomponent)
  private
     FItems: TwwInspectorCollection;
  public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
  published
     property Items: TwwInspectorCollection read FItems write FItems;
  end;

  constructor TwwCollectionStreamComponent.create(AOwner: TComponent);
  begin
     inherited Create(AOwner);
     FItems:= TwwInspectorCollection.create(self);
  end;

  destructor TwwCollectionStreamComponent.Destroy;
  begin
     FItems.Free;
     inherited Destroy;
  end;

procedure TwwInspectorCollection.SaveToStream(s: TStream);
var tempC: TwwCollectionStreamComponent;
begin
  tempC:= TwwCollectionStreamComponent.create(Control);
  with tempC do begin
     Items.assign((Control as TwwDataInspector).Items);
     s.WriteComponent(tempC);
     free;
  end;
end;

procedure TwwInspectorCollection.LoadFromStream(s: TStream);
var tempC: TwwCollectionStreamComponent;
begin
  tempC:= TwwCollectionStreamComponent.create(Control);
  with tempC do begin
     s.ReadComponent(tempC);
     (Control as TwwDataInspector).Items.assign(items);
     free;
  end;
end;

procedure TwwInspectorCollection.SaveToFile(const FileName: string);
var Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TwwInspectorCollection.LoadFromFile(const FileName: string);
var Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead);
  try
    LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

function TwwDataInspector.DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
   SendMessage(Handle, wm_vscroll, sb_linedown, 0);
   result:= true;
end;

function TwwDataInspector.DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  SendMessage(Handle, wm_vscroll, sb_lineup, 0);
  result := True;
end;

procedure TwwDataInspector.FirstTimePaint;
begin
end;


{procedure TwwDataInspector.RefreshCustomControl;
begin
   DirtyCustomInfo:= True;
   Invalidate;
end;
}
procedure Register;
begin
  RegisterComponents('IP Controls', [TwwDataInspector]);
end;

end.
