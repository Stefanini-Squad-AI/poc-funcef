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

unit dxExtCtrls;

interface

{$I dxPSVer.inc}

uses
  Windows, Classes, Graphics, Controls, StdCtrls, ExtCtrls, ComCtrls, Messages;

type
  TdxSpinValueType = (svtInteger, svtFloat);
  TdxButtonType = (btLine, btPage);
  TdxScrollMouseSensetivity = (msLow, msMedium, msHigh);
  TdxSpinButtonClickEvent = procedure(Sender: TObject; ButtonType: TdxButtonType;
    Button: TUDBtnType) of object;

  TdxPSSpinEdit = class(TCustomEdit)
  private
    FAlignment: TAlignment;
    FArrowKeys: Boolean;
    FCheckBounds: Boolean;
    FDecimal: Byte;
    FDefaultValue: Extended;
    FEditorEnabled: Boolean;
    FFlat: Boolean;
    FIncrButtonWidth: Integer;
    FIncrement: Extended;
    FLastGoodValue: Extended;
    FLegendText: string;
    FLockChange: Boolean;
    FMaxValue: Extended;
    FMinValue: Extended;
    FMouseInControl: Boolean;
    FPageIncrButtonWidth: Integer;
    FPageIncrement: Extended;
    FPageUpDown: TCustomUpDown;
    FSaveValue: Extended;
    FScrollMouseSens: TdxScrollMouseSensetivity;
    FUpDown: TCustomUpDown;
    FUsePageIncr: Boolean;
    FValueType: TdxSpinValueType;

    FOnButtonClick: TdxSpinButtonClickEvent;
    function GetAsInteger: Longint;
    function GetButtonWidth: Integer;
    function GetLegendText: string;
    function GetMinHeight: Integer;
    function IsDefaultValueStored: Boolean;
    function IsIncrButtonWidthStored: Boolean;
    function IsIncrementStored: Boolean;
    function IsMaxStored: Boolean;
    function IsMinStored: Boolean;
    function IsPageIncrButtonWidthStored: Boolean;
    function IsPageIncrementStored: Boolean;
    function IsValueStored: Boolean;
    procedure SetAlignment(Value: TAlignment);
    procedure SetAsInteger(NewValue: Longint);
    procedure SetCheckBounds(Value: Boolean);
    procedure SetDecimal(NewValue: Byte);
    procedure SetDefaultValue(NewDefaultValue: Extended);
    procedure SetFlat(Value: Boolean);
    procedure SetIncrButtonWidth(Value: Integer);
    procedure SetLegendText(const Value: string);
    procedure SetMaxValue(Value: Extended);
    procedure SetMinValue(Value: Extended);
    procedure SetPageIncrButtonWidth(Value: Integer);
    procedure SetScrollMouseSens(Value: TdxScrollMouseSensetivity);
    procedure SetUsePageIncr(Value: Boolean);
    procedure SetValueType(NewType: TdxSpinValueType);
    procedure GetTextHeight(var SysHeight, Height: Integer);
    procedure PageUpDownClick(Sender: TObject; Button: TUDBtnType);
    procedure RecreateButton;
    procedure ResizeButtons;
    procedure SetEditRect;
    procedure UpDownClick(Sender: TObject; Button: TUDBtnType);
    procedure WMContextMenu(var message: TMessage); message WM_CONTEXTMENU;
    procedure WMCut(var message: TWMCut); message WM_CUT;
    procedure WMKillFocus(var message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMMouseWheel(var message: TWMMouse); message WM_MOUSEWHEEL;
    procedure WMNCCalcSize(var message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var message: TMessage); message WM_NCPAINT;
    procedure WMPaste(var message: TWMPaste); message WM_PASTE;
{$IFNDEF DELPHI5}
    procedure WMRButtonUp(var message: TWMMouse); message WM_RBUTTONUP;
{$ENDIF}
    procedure WMSetFocus(var message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMSize(var message: TWMSize); message WM_SIZE;
{$IFDEF DELPHI4}
    procedure CMBiDiModeChanged(var message: TMessage); message CM_BIDIMODECHANGED;
{$ENDIF}
    procedure CMEnabledChanged(var message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMEnter(var message: TMessage); message CM_ENTER;
    procedure CMExit(var message: TCMExit); message CM_EXIT;
    procedure CMFontChanged(var message: TMessage); message CM_FONTCHANGED;
    procedure CMMouseEnter(var message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var message: TMessage); message CM_MOUSELEAVE;
  protected
    procedure Change; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;

    function CheckValue(NewValue: Extended): Extended;
    procedure DoButtonClick(ButtonType: TdxButtonType; Button: TUDBtnType);
    function GetValue: Extended; virtual;
    function GetValueText: string; virtual;
    function IsValidChar(Key: Char): Boolean; virtual;
    procedure SetValue(NewValue: Extended); virtual;
    procedure SpecialKeyClick(Key: Word; Shift: TShiftState; Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;

    property AsInteger: Longint read GetAsInteger write SetAsInteger;
    property Text;
  published
    property Alignment: TAlignment read FAlignment write SetAlignment
      default taLeftJustify;
    property ArrowKeys: Boolean read FArrowKeys write FArrowKeys
      default True;
    property CheckBounds: Boolean read FCheckBounds write SetCheckBounds
      default True;
    property UsePageIncr: Boolean read FUsePageIncr write SetUsePageIncr
      default False;
    property PageIncrement: Extended read FPageIncrement write FPageIncrement
      stored IsPageIncrementStored;
    property IncrButtonWidth: Integer read FIncrButtonWidth write SetIncrButtonWidth
      stored IsIncrButtonWidthStored;
    property PageIncrButtonWidth: Integer read FPageIncrButtonWidth write SetPageIncrButtonWidth
      stored IsPageIncrButtonWidthStored;
    property ScrollMouseSens: TdxScrollMouseSensetivity read FScrollMouseSens write SetScrollMouseSens
      default msMedium;
    property DefaultValue: Extended read FDefaultValue write SetDefaultValue
      stored IsDefaultValueStored;
    property Decimal: Byte read FDecimal write SetDecimal
      default 2;
    property EditorEnabled: Boolean read FEditorEnabled write FEditorEnabled
      default True;
    property Flat: Boolean read FFlat write SetFlat
      default False;
    property Increment: Extended read FIncrement write FIncrement
      stored IsIncrementStored;
    property LegendText: string read GetLegendText write SetLegendText;
    property MaxValue: Extended read FMaxValue write SetMaxValue
      stored IsMaxStored;
    property MinValue: Extended read FMinValue write SetMinValue
      stored IsMinStored;
    property ValueType: TdxSpinValueType read FValueType write SetValueType
      default svtInteger;
    property Value: Extended read GetValue write SetValue
      stored IsValueStored;

    property AutoSelect;
    property AutoSize;
    property Color;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
{$IFDEF DELPHI4}
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
{$ENDIF}
    property ImeMode;
    property ImeName;
    property MaxLength;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnButtonClick: TdxSpinButtonClickEvent read FOnButtonClick write FOnButtonClick;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF DELPHI4}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
  end;


  TdxColorType = (ctPure, ctSystem);
  TdxColorTypes = set of TdxColorType;
  TdxColorKind = (ckNormal, ckAuto, ckCustom);
  
  TdxSelectColorProc = function(var AColor: TColor): Boolean of object;
  TdxGetSelectColorProcEvent = procedure(Sender: TObject;
    var SelectColorProc: TdxSelectColorProc) of object;
  TdxOnGetColorNameEvent = procedure(Sender: TObject; Index: Integer;
    AColor: TColor; AKind: TdxColorKind; var AName: string) of object;

  TdxPSColorCombo = class(TCustomComboBox)
  private
    FAutoColor: TColor;
    FAutoColorText: string;
    FColorTypes: TdxColorTypes;
    FCustomColorText: string;
    FEndEllipsis: Boolean;
    FSelEndOk: Boolean;
    FShowAutoColor: Boolean;
    FShowColorName: Boolean;
    FShowCustomColor: Boolean;

    FOnGetColorName: TdxOnGetColorNameEvent;
    FOnGetSelectColorProc: TdxGetSelectColorProcEvent;
    
    function GetColorTypes: TdxColorTypes;
    function GetColorValue: TColor;
    function IsAutoColorTextStored: Boolean;
    function IsCustomColorTextStored: Boolean;
    procedure SetShowCustomColor(Value: Boolean);
    procedure SetAutoColor(Value: TColor);
    procedure SetAutoColorText(const Value: string);
    procedure SetColorTypes(Value: TdxColorTypes);
    procedure SetColorValue(Value: TColor);
    procedure SetCustomColorText(const Value: string);
    procedure SetEndEllipsis(Value: Boolean);
    procedure SetShowColorName(Value: Boolean);
    procedure SetShowAutoColor(Value: Boolean);
    function FindRGB(AColor: TColor): Integer;
    procedure ResetItemHeight;
    procedure SelectCustomColor;
    function StandardSelectColorProc(var AColor: TColor): Boolean;
{$IFDEF DELPHI4}
    procedure CMBiDiModeChanged(var message: TMessage); message CM_BIDIMODECHANGED;
{$ENDIF}
    procedure CMEnabledChanged(var message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMFontChanged(var message: TMessage); message CM_FONTCHANGED;
    procedure CMRecreateWnd(var message: TMessage); message CM_RECREATEWND;
    procedure CNCommand(var message: TWMCommand); message CN_COMMAND;
  protected
    procedure Click; override;
    procedure CreateWnd; override;
    procedure DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    
    function GetColorName(Index: Integer): string; virtual;
    procedure FillColorList;
    function SelectColorProc: TdxSelectColorProc; dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    property ColorName[Index: Integer]: string read GetColorName;
  published
    property AutoColor: TColor read FAutoColor write SetAutoColor
      default clWindowText;
    property AutoColorText: string read FAutoColorText write SetAutoColorText
      stored IsAutoColorTextStored;
    property Color;
    property ColorTypes: TdxColorTypes read GetColorTypes write SetColorTypes
      default [ctPure, ctSystem];
    property ColorValue: TColor read GetColorValue write SetColorValue
      default clBlack;
    property CustomColorText: string read FCustomColorText write SetCustomColorText
      stored IsCustomColorTextStored;
    property Ctl3D;
    property DragMode;
    property DragCursor;
    property DropDownCount;
    property Enabled;
    property EndEllipsis: Boolean read FEndEllipsis write SetEndEllipsis
      default False;
    property Font;
    property ImeMode;
    property ImeName;
{$IFDEF DELPHI4}
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
{$ENDIF}
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowAutoColor: Boolean read FShowAutoColor write SetShowAutoColor
      default False;
    property ShowColorName: Boolean read FShowColorName write SetShowColorName
      default True;
    property ShowCustomColor: Boolean read FShowCustomColor write SetShowCustomColor
      default True;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDropDown;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetColorName: TdxOnGetColorNameEvent read FOnGetColorName
      write FOnGetColorName;
    property OnGetSelectColorProc: TdxGetSelectColorProcEvent read FOnGetSelectColorProc
      write FOnGetSelectColorProc;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnStartDrag;
{$IFDEF DELPHI4}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
  end;


  TdxGetBrushStyleNameEvent = procedure(Sender: TObject; Index: Integer;
    AStyle: TBrushStyle; var AName: string) of object;

  TdxPSBrushStyleCombo = class(TCustomComboBox)
  private
    FBrushColor: TColor;
    FEndEllipsis: Boolean;
    FShowStyleName: Boolean;

    FOnGetBrushStyleName: TdxGetBrushStyleNameEvent;
    function GetStyleValue: TBrushStyle;
    procedure SetBrushColor(Value: TColor);
    procedure SetEndEllipsis(Value: Boolean);
    procedure SetShowStyleName(Value: Boolean);
    procedure SetStyleValue(Value: TBrushStyle);
    procedure FillStyleList;
    procedure ResetItemHeight;
{$IFDEF DELPHI4}
    procedure CMBiDiModeChanged(var message: TMessage); message CM_BIDIMODECHANGED;
{$ENDIF}
    procedure CMEnabledChanged(var message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMFontChanged(var message: TMessage); message CM_FONTCHANGED;
    procedure CMRecreateWnd(var message: TMessage); message CM_RECREATEWND;
  protected
    procedure CreateWnd; override;
    procedure DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    function GetStyleName(Index: Integer): string; virtual;
    property Sorted;
  public
    constructor Create(AOwner: TComponent); override;

    property StyleName[Index: Integer]: string read GetStyleName;
  published
    property BrushColor: TColor read FBrushColor write SetBrushColor
      default clWindowText;
    property BrushStyle: TBrushStyle read GetStyleValue write SetStyleValue
      default bsSolid;
    property Color;
    property Ctl3D;
    property DragMode;
    property DragCursor;
    property Enabled;
    property EndEllipsis: Boolean read FEndEllipsis write SetEndEllipsis
      default False;
    property Font;
    property ImeMode;
    property ImeName;
{$IFDEF DELPHI4}
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
{$ENDIF}
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property ShowStyleName: Boolean read FShowStyleName write SetShowStyleName
      default False;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDropDown;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetBrushStyleName: TdxGetBrushStyleNameEvent read FOnGetBrushStyleName
      write FOnGetBrushStyleName;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnStartDrag;
{$IFDEF DELPHI4}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
  end;

  
{ TdxPSPaintPanel }

{$IFDEF BCB}
  {$IFDEF CBUILDER4}
    {$DEFINE CANDEFINE_DOUBLEBUFFERED}
  {$ENDIF}
{$ELSE}
  {$DEFINE CANDEFINE_DOUBLEBUFFERED}
{$ENDIF}

  TdxEdgeBorder = (ebLeft, ebTop, ebRight, ebBottom);
  TdxEdgeBorders = set of TdxEdgeBorder;
  TdxEdgeStyle = (esNone, esRaised, esSunken);

  TdxPSPaintPanel = class(TCustomPanel)
  private
    FEdgeBorders: TdxEdgeBorders;
    FEdgeInner: TdxEdgeStyle;
    FEdgeOuter: TdxEdgeStyle;

    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    FOnPaint: TNotifyEvent;
    
    function GetEdgeBorders: TdxEdgeBorders;
    procedure SetEdgeBorders(Value: TdxEdgeBorders);
    procedure SetEdgeInner(Value: TdxEdgeStyle);
    procedure SetEdgeOuter(Value: TdxEdgeStyle);

{$IFNDEF DELPHI4}
    procedure WMEraseBkgnd(var message: TWMEraseBkgnd); message WM_ERASEBKGND;
{$ENDIF}    
    procedure WMNCCalcSize(var message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var message: TWMNCPaint); message WM_NCPAINT;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMMouseEnter(var message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var message: TMessage); message CM_MOUSELEAVE;
    procedure CMTextChanged(var message: TMessage); message CM_TEXTCHANGED;
  protected
    procedure Paint; override;
    procedure DoPaint; dynamic;
    procedure DoMouseEnter; dynamic;
    procedure DoMouseLeave; dynamic;
  public
    constructor Create(AOwner: TComponent); override;

    property Canvas;
  published
{$IFDEF CANDEFINE_DOUBLEBUFFERED}  
    property DoubleBuffered{$IFNDEF DELPHI4}: Boolean read FDoubleBuffered write FDoubleBuffered {$ENDIF}
       default True;
{$ENDIF}       
    property EdgeBorders: TdxEdgeBorders read GetEdgeBorders write SetEdgeBorders
      default [ebLeft, ebTop, ebRight, ebBottom];
    property EdgeInner: TdxEdgeStyle read FEdgeInner write SetEdgeInner
      default esRaised;
    property EdgeOuter: TdxEdgeStyle read FEdgeOuter write SetEdgeOuter
      default esSunken;
    property Align;
{$IFDEF DELPHI4}
    property Anchors;
    property Constraints;
    property DragKind;
{$ENDIF}
    property DragCursor;
    property DragMode;
    property Enabled;
    property Ctl3D;
    property ParentColor;
    property ParentCtl3D;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
    property OnClick;
{$IFDEF DELPHI4}
    property OnCanResize;
    property OnConstrainedResize;
{$ENDIF}
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDrag;
{$IFDEF DELPHI4}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

  
  TdxPSBitmapAnimator = class(TGraphicControl)
  private
    FAnimationSpeed: Integer;
    FAnimationStepCount: Integer;    
    FBitmap: TBitmap;
    FState: Boolean;
    procedure SetBitmap(Value: TBitmap);
    procedure SetState(Value: Boolean);
    procedure BitmapChanged(Sender: TObject);    
  protected
    procedure Paint; override;
    procedure Animate(AState: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property AnimationSpeed: Integer read FAnimationSpeed write FAnimationSpeed {ms}
      default 10;
    property AnimationStepCount: Integer read FAnimationStepCount write FAnimationStepCount
      default 10;
    property Bitmap: TBitmap read FBitmap write SetBitmap;
    property State: Boolean read FState write SetState
      default False;
  end;
  
{$IFNDEF DELPHI6}  
const
  clCream = TColor($A6CAF0);
  clMoneyGreen = TColor($C0DCC0);
  clSkyBlue = TColor($FFFBF0);
  clMedGray = TColor($A4A0A0);
{$ENDIF}

const 
  dxCustomColorRegPath: string = '';

procedure GetCustomColors(AStrings: TStrings);  
procedure dxRestoreCustomColors(const ARegPath: string); 
procedure dxSaveCustomColors(const ARegPath: string);  
 
implementation

uses
  Forms, CommCtrl, SysUtils, Dialogs, Registry, 
  dxExtCtrlsStrs;

const
  MinIncrButtonWidth = 9;
  CScrollMouseSensetivity: array[TdxScrollMouseSensetivity] of Integer = (10, 5, 1);

var
  FColorDialog: TColorDialog;  
  
procedure GetCustomColors(AStrings: TStrings);
var
  i: Integer;
begin
  AStrings.BeginUpdate;
  try
    for i := 0 to FColorDialog.CustomColors.Count - 1 do
      AStrings.Add(FColorDialog.CustomColors[i]);
  finally
    AStrings.EndUpdate;
  end;
end;

procedure dxSaveCustomColors(const ARegPath: string);  
var
  Registry: TRegistry;
  i, P: Integer;
  S: string;
begin
  Registry := TRegistry.Create;
  try
    if Registry.KeyExists(ARegPath) then Registry.DeleteKey(ARegPath);
    if Registry.OpenKey(ARegPath, True) then 
      for i := 0 to FColorDialog.CustomColors.Count - 1 do 
      begin
        S := FColorDialog.CustomColors[I];
        P := Pos('=', S);
        if (P <> 0) then
        begin
          S := Copy(S, 1, P - 1);
          try
            Registry.WriteString(S, FColorDialog.CustomColors.Values[S]);
          except
            on ERegistryException do
            else
              raise;
          end;  
        end;
      end;      
  finally
    Registry.Free;
  end;
end;

procedure dxRestoreCustomColors(const ARegPath: string);  
var
  Registry: TRegistry;
  i: Integer;
  S: string;
  AStrings: TStringList;
begin
  Registry := TRegistry.Create;
  try
    if Registry.OpenKey(ARegPath, False) then
    begin
      FColorDialog.CustomColors.Clear;
      AStrings := TStringList.Create;
      try
        Registry.GetValueNames(AStrings);
        for i := 0 to AStrings.Count - 1 do
        begin
          S := AStrings[i];
          if Registry.ValueExists(S) then
          try
            S := S + '=' + Registry.ReadString(S);
          except
            on ERegistryException do 
              Continue
            else
              raise;
          end;
          FColorDialog.CustomColors.Add(S);
        end;
      finally
        AStrings.Free;
      end;
    end; 
  finally
    Registry.Free;
  end;
end;

  
type
  TdxUpDown = class(TCustomUpDown)
  private
    FLockChange: Boolean;
    FMouseSensetivity: TdxScrollMouseSensetivity;
    FPrevMousePos: TSmallPoint;
    
    procedure CancelScroll;    
    function MouseInSplitRegion(Pt: TSmallPoint): Boolean;
    procedure ScrollMessage(var message: TWMVScroll);
    
    procedure WMCaptureChanged(var message: TMessage); message WM_CAPTURECHANGED;
    procedure WMHScroll(var message: TWMHScroll); message CN_HSCROLL;
    procedure WMLButtonDown(var message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMMouseMove(var message: TWMMouseMove); message WM_MOUSEMOVE;
{$IFNDEF DELPHI5}
    procedure WMRButtonUp(var message: TWMRButtonUp); message WM_RBUTTONUP;
{$ENDIF}
    procedure WMVScroll(var message: TWMVScroll); message CN_VSCROLL;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    
    property MouseSensetivity: TdxScrollMouseSensetivity read FMouseSensetivity 
      write FMouseSensetivity default msMedium;
    property PopupMenu;
    property OnClick;
  end;


constructor TdxUpDown.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Orientation := udVertical;
  Min := -1;
  Max := 1;
  Position := 0;
  FMouseSensetivity := msMedium;
end;

function TdxUpDown.MouseInSplitRegion(Pt: TSmallPoint): Boolean;
const
  Delta = 2;
begin
  Result := (Pt.Y > (Height div 2) - Delta) and
            (Pt.Y < (Height div 2) + Delta);
end;

procedure TdxUpDown.WMLButtonDown(var message: TWMLButtonDown);
begin
  if MouseInSplitRegion(message.Pos) then
  begin
    FPrevMousePos := message.Pos;
    SetCapture(Handle);
  end
  else
    inherited;
end;

procedure TdxUpDown.WMLButtonUp(var message: TWMLButtonUp);
begin
  inherited;
  if (GetCapture = Handle) then ReleaseCapture;
end;

{$IFNDEF DELPHI5}

procedure TdxUpDown.WMRButtonUp(var message: TWMMouse);
begin
  inherited;
  if not (csNoStdEvents in ControlStyle) then
    with message do
      MouseUp(mbRight, KeysToShiftState(Keys), XPos, YPos);
end;
{$ENDIF}

procedure TdxUpDown.WMCaptureChanged(var message: TMessage);
begin
  CancelScroll;  
end;

procedure TdxUpDown.WMMouseMove(var message: TWMMouseMove);
const
  Cursors: array[Boolean] of TCursor = (crDefault, crVSplit);
  UDBtnType: array [Boolean] of TUDBtnType = (btNext, btPrev);
var
  Pt: TSmallPoint;
begin
  Pt := message.Pos;
  if GetCapture = Handle then
  begin
    if (Abs(FPrevMousePos.Y - Pt.Y) >= CScrollMouseSensetivity[FMouseSensetivity]) then
    begin
      Click(UDBtnType[Pt.Y > FPrevMousePos.Y]);
      SendMessage(Handle, UDM_SETPOS, 0, 0);
      FPrevMousePos := Pt;
    end;
  end
  else
  begin
    Cursor := Cursors[MouseInSplitRegion(Pt)];
    inherited;
  end;
end;

procedure TdxUpDown.CancelScroll;
begin
  SetCursor(Screen.Cursors[crDefault]);
end;

procedure TdxUpDown.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if (GetCapture = Handle) and (Key = VK_ESCAPE) then CancelScroll;
  inherited KeyDown(Key, Shift);
end;

procedure TdxUpDown.ScrollMessage(var message: TWMVScroll);
const
  UDBtnType: array [Boolean] of TUDBtnType = (btNext, btPrev);
begin
  if not FLockChange then
  begin
    FLockChange := True;
    try
      case message.ScrollCode of
        SB_THUMBPOSITION:
          Click(UDBtnType[message.Pos < 0]);
        SB_LINEUP:
          Click(btNext);
        SB_LINEDOWN:
          Click(btPrev);
      end;
      if HandleAllocated then SendMessage(Handle, UDM_SETPOS, 0, 0);
    finally
      FLockChange := False;
    end;
  end;
end;

procedure TdxUpDown.WMHScroll(var message: TWMHScroll);
begin
  ScrollMessage(TWMVScroll(message));
end;

procedure TdxUpDown.WMVScroll(var message: TWMVScroll);
begin
  ScrollMessage(message);
end;

procedure DrawBorder(Control: TWinControl);
var
  DC: hDC;
  R: TRect;
  Pt: TPoint;
  MouseInControl: Boolean;
  DrawSunken: Boolean;
  FocusControl: TWinControl;
begin
  DC := GetWindowDC(Control.Handle);

  GetWindowRect(Control.Handle, R);
  GetCursorPos(Pt);
  MouseInControl := PtInRect(R, Pt);
  OffsetRect(R, -R.Left, -R.Top);
  if Control.Enabled then
  begin
    if csDesigning in Control.ComponentState then
      DrawSunken := True
    else 
      if Control.Focused then
        DrawSunken := True
      else 
        if GetParentForm(Control).Active and MouseInControl then
        begin
          FocusControl := FindControl(GetFocus);
          if FocusControl <> nil then
            DrawSunken := not (FocusControl is Control.ClassType)
          else
            DrawSunken := True;
        end
        else
          DrawSunken := False;
            
    if DrawSunken then
      DrawEdge(DC, R, BDR_SUNKENOUTER, BF_RECT)
    else
      FrameRect(DC, R, GetSysColorBrush(COLOR_BTNFACE));
        
    InflateRect(R, -1, -1);
    FrameRect(DC, R, GetSysColorBrush(COLOR_BTNFACE));
  end
  else
  begin
    FrameRect(DC, R, GetSysColorBrush(COLOR_BTNFACE));
    InflateRect(R, -1, -1);
    FrameRect(DC, R, GetSysColorBrush(COLOR_BTNHIGHLIGHT));
  end;

  ReleaseDC(Control.Handle, DC);
end;


{ TdxPSSpinEdit }

constructor TdxPSSpinEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Text := '0';
  FDefaultValue := 0;
  FFlat := False;
  Height := 22;
  Width := 65;
  FIncrement := 1.0;
  FPageIncrement := 10.0;
  FCheckBounds := True;
  FDecimal := 2;
  FEditorEnabled := True;
  FUsePageIncr := False;
  FIncrButtonWidth := GetSystemMetrics(SM_CXVSCROLL);
  FPageIncrButtonWidth := FIncrButtonWidth;
  FScrollMouseSens := msMedium;
  FArrowKeys := True;
  FLegendText := '';
  FLastGoodValue := 0.0;
  RecreateButton;
end;

procedure TdxPSSpinEdit.RecreateButton;
begin
  FUpDown.Free;
  FUpDown := nil;
  FPageUpDown.Free;
  FPageUpDown := nil;
  if FUsePageIncr then
  begin
    FPageUpDown := TdxUpDown.Create(Self);
    with TdxUpDown(FPageUpDown) do
    begin
      Visible := True;
      SetBounds(0, 0, FPageIncrButtonWidth, Self.Height);
{$IFDEF DELPHI4}
      if (BiDiMode = bdRightToLeft) then
        Align := alLeft
      else
{$ENDIF}
        Align := alRight;
      Parent := Self;
      MouseSensetivity := Self.ScrollMouseSens;
      OnClick := PageUpDownClick;
      PopupMenu := Self.PopupMenu;
    end;
  end;
  FUpDown := TdxUpDown.Create(Self);
  with TdxUpDown(FUpDown) do
  begin
    Visible := True;
    SetBounds(0, 0, FIncrButtonWidth, Self.Height);
{$IFDEF DELPHI4}
    if (BiDiMode = bdRightToLeft) then
      Align := alLeft
    else
{$ENDIF}
      Align := alRight;
    Parent := Self;
    MouseSensetivity := Self.ScrollMouseSens;
    OnClick := UpDownClick;
    PopupMenu := Self.PopupMenu;
  end;
end;

procedure TdxPSSpinEdit.UpDownClick(Sender: TObject; Button: TUDBtnType);
const
  Keys: array[TUDBtnType] of UINT = (VK_UP, VK_DOWN);
begin
  if TabStop and CanFocus then SetFocus;
  SpecialKeyClick(Keys[Button], [], Sender);
end;

procedure TdxPSSpinEdit.PageUpDownClick(Sender: TObject; Button: TUDBtnType);
const
  Keys: array[TUDBtnType] of UINT = (VK_PRIOR, VK_NEXT);
begin
  if TabStop and CanFocus then SetFocus;
  SpecialKeyClick(Keys[Button], [], Sender);
end;

function TdxPSSpinEdit.GetButtonWidth: Integer;
begin
  Result := 0;
  if FUpDown <> nil then Result := FUpDown.Width;
  if FPageUpDown <> nil then Result := Result + FPageUpDown.Width;
end;

procedure TdxPSSpinEdit.ResizeButtons;
begin
  if FUpDown <> nil then
  begin
    FUpDown.Width := FIncrButtonWidth;
{$IFDEF DELPHI4}
    if (BiDiMode = bdRightToLeft) then
      FUpDown.Align := alLeft
    else
{$ENDIF}
      FUpDown.Align := alRight;
  end;
  if FPageUpDown <> nil then
  begin
    FPageUpDown.Width := FPageIncrButtonWidth;
{$IFDEF DELPHI4}
    if (BiDiMode = bdRightToLeft) then
      FPageUpDown.Align := alLeft
    else
{$ENDIF}
      FPageUpDown.Align := alRight;
  end;
end;

procedure TdxPSSpinEdit.KeyDown(var Key: Word; Shift: TShiftState);
var
  IsProcessKey: Boolean;
begin
  inherited KeyDown(Key, Shift);
  IsProcessKey := 
    Key in [VK_PRIOR, VK_NEXT, VK_UP, VK_DOWN, VK_END, VK_HOME, VK_ESCAPE, VK_DELETE];
  if IsProcessKey then 
    case Key of
      VK_PRIOR, VK_NEXT, VK_UP, VK_DOWN:
        if ArrowKeys then
        begin
          SpecialKeyClick(Key, Shift, Self);
          Key := 0;        
        end;
      VK_END:
        if (ssCtrl in Shift) then 
        begin 
          Value := MaxValue;
          Key := 0;
        end;  
      VK_HOME:
        if (ssCtrl in Shift) then 
        begin 
          Value := MinValue;
          Key := 0;
        end;  
      VK_DELETE:
        if not EditorEnabled then 
        begin
          MessageBeep(0);           
          Key := 0;           
        end;
      VK_ESCAPE:
        begin
        end;
    end;
end;

procedure TdxPSSpinEdit.Change;
begin
  if not FLockChange then 
    inherited;
end;

procedure TdxPSSpinEdit.KeyPress(var Key: Char);
begin
  if not EditorEnabled or not IsValidChar(Key) then
  begin
    Key := #0;
    MessageBeep(0);
  end;
  if Key <> #0 then
  begin
    inherited;
    if Key = Char(VK_RETURN) then
    begin
      if AutoSelect then 
        SelectAll;
      Value := Value;
    end;
    if Key in [Char(VK_RETURN), Char(VK_ESCAPE)] then
    begin
      GetParentForm(Self).Perform(CM_DIALOGKEY, Byte(Key), 0);
      if Key = Char(VK_RETURN) then 
        Key := #0;
    end;
  end;
end;

function TdxPSSpinEdit.IsValidChar(Key: Char): Boolean;
var
  ValidChars: set of Char;
begin
  ValidChars := ['+', '-', '0'..'9'];
  if ValueType = svtFloat then
    ValidChars := ValidChars + [DecimalSeparator];
  Result := (Key in ValidChars) or (Key < #32) or (System.Pos(Key, LegendText) > 0);
  if not FEditorEnabled and Result and ((Key >= #32) or
    (Key = Char(VK_BACK)) or (Key = Char(VK_DELETE))) then 
    Result := False;
end;

procedure TdxPSSpinEdit.CreateParams(var Params: TCreateParams);
const
{$IFDEF DELPHI4}
  Alignments: array[Boolean, TAlignment] of DWORD =
    ((ES_LEFT, ES_RIGHT, ES_CENTER), (ES_RIGHT, ES_LEFT, ES_CENTER));
{$ELSE}
  Alignments: array[TAlignment] of Longint = (ES_LEFT, ES_RIGHT, ES_CENTER);
{$ENDIF}
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or ES_MULTILINE or WS_CLIPCHILDREN or
{$IFDEF DELPHI4}
  Alignments[UseRightToLeftAlignment, FAlignment];
{$ELSE}
  Alignments[FAlignment];
{$ENDIF}
end;

procedure TdxPSSpinEdit.CreateWnd;
begin
  inherited CreateWnd;
  SetEditRect;
end;

procedure TdxPSSpinEdit.SetEditRect;
var
  R: TRect;
begin
{$IFDEF DELPHI4}
  if (BiDiMode = bdRightToLeft) then
    R := Rect(GetButtonWidth + 1, 0, ClientWidth - 1, ClientHeight + 1)
  else
{$ENDIF}
    R := Rect(0, 0, ClientWidth - GetButtonWidth - 2, ClientHeight + 1);
  SendMessage(Handle, EM_SETRECTNP, 0, Longint(@R));
end;

procedure TdxPSSpinEdit.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    RecreateWnd;
  end;
end;

procedure TdxPSSpinEdit.WMSize(var message: TWMSize);
var
  MinHeight: Integer;
begin
  inherited;
  MinHeight := GetMinHeight;
  if Height < MinHeight then
    Height := MinHeight
  else
  begin
    ResizeButtons;
    SetEditRect;
  end;
end;

procedure TdxPSSpinEdit.GetTextHeight(var SysHeight, Height: Integer);
var
  DC: hDC;
  SaveFont: hFont;
  SysMetrics, Metrics: TTextMetric;
begin
  DC := GetDC(0);
  GetTextMetrics(DC, SysMetrics);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  SysHeight := SysMetrics.tmHeight;
  Height := Metrics.tmHeight;
end;

function TdxPSSpinEdit.GetMinHeight: Integer;
var
  i, H: Integer;
begin
  GetTextHeight(i, H);
  if i > H then i := H;
  Result := H + GetSystemMetrics(SM_CYBORDER) * 4 + 1;
end;

procedure TdxPSSpinEdit.SpecialKeyClick(Key: Word; Shift: TShiftState; Sender: TObject);
var
  OldText: string;
begin
  if ReadOnly then 
    MessageBeep(0)
  else
  begin
    FLockChange := True;
    try
      OldText := inherited Text;
      case Key of
        VK_PRIOR:
          begin
            Value := Value + FPageIncrement;
            DoButtonClick(btPage, btPrev);
          end;
        VK_NEXT:
          begin
            Value := Value - FPageIncrement;
            DoButtonClick(btPage, btNext);
          end;
        VK_UP:
          if (ssCtrl in Shift) then
          begin
            Value := Value + FPageIncrement;
            DoButtonClick(btPage, btNext);
          end
          else
          begin
            Value := Value + FIncrement;
            DoButtonClick(btLine, btNext);
          end;
        VK_DOWN:
          if (ssCtrl in Shift) then
          begin
            Value := Value - FPageIncrement;
            DoButtonClick(btPage, btPrev);
          end
          else
          begin
            Value := Value - FIncrement;
            DoButtonClick(btLine, btPrev);
          end;
      end;
    finally
      FLockChange := False;
    end;
    if AnsiCompareText(inherited Text, OldText) <> 0 then
    begin
      Modified := True;
      Change;
    end;
  end;
end;

{$IFDEF DELPHI4}

procedure TdxPSSpinEdit.CMBiDiModeChanged(var message: TMessage);
begin
  inherited;
  ResizeButtons;
  SetEditRect;
  Invalidate;
end;
{$ENDIF}

procedure TdxPSSpinEdit.CMMouseEnter(var message: TMessage);
begin
  inherited;
  FMouseInControl := True;
  if Flat then DrawBorder(Self);
end;

procedure TdxPSSpinEdit.CMMouseLeave(var message: TMessage);
begin
  inherited;
  FMouseInControl := False;
  if Flat then DrawBorder(Self);
end;

procedure TdxPSSpinEdit.CMFontChanged(var message: TMessage);
begin
  inherited;
  ResizeButtons;
  SetEditRect;
end;

procedure TdxPSSpinEdit.CMEnabledChanged(var message: TMessage);
begin
  inherited;
  if Assigned(FUpDown) then
    FUpDown.Enabled := Enabled;
  if Assigned(FPageUpDown) then
    FPageUpDown.Enabled := Enabled;
  if FFlat then DrawBorder(Self);
end;

{$IFNDEF DELPHI5}

procedure TdxPSSpinEdit.WMRButtonUp(var message: TWMMouse);
var
  R: TRect;
  Pt: TPoint;
begin
  if (PopupMenu <> nil) and PopupMenu.AutoPopup then
  begin
    R := FUpDown.ClientRect;
    if FUsePageIncr then
      UnionRect(R, R, FPageUpDown.ClientRect);
    Pt := ScreenToClient(SmallPointToPoint(message.Pos));
    if PtInRect(R, Pt) then Exit;
  end;
  inherited;
end;
{$ENDIF}

procedure TdxPSSpinEdit.WMContextMenu(var message: TMessage);
begin
  if (message.wParam = Longint(Handle)) then inherited;
end;

procedure TdxPSSpinEdit.WMSetFocus(var message: TWMSetFocus);
begin
  inherited;
  if Flat then DrawBorder(Self);
end;

procedure TdxPSSpinEdit.WMKillFocus(var message: TWMKillFocus);
begin
  inherited;
  if Flat then DrawBorder(Self);
end;

procedure TdxPSSpinEdit.WMMouseWheel(var message: TWMMouse);
const
  lParam: array[Boolean] of SmallInt = (SB_LINEDOWN, SB_LINEUP);
var
  ScrollMsg: TWMScroll;
  UD: TCustomUpDown;
begin
  inherited;
  FillChar(ScrollMsg, SizeOf(TMessage), 0);
  ScrollMsg.Msg := WM_VSCROLL;
  ScrollMsg.ScrollCode := lParam[SmallInt(HIWORD(Message.Keys)) > 0];
  if GetKeyState(VK_CONTROL) < 0 then
    UD := FPageUpDown
  else
    UD := FUpDown;
  TdxUpDown(UD).ScrollMessage(ScrollMsg);
end;

procedure TdxPSSpinEdit.WMNCCalcSize(var message: TWMNCCalcSize);
begin
  inherited;
  //if Flat then InflateRect(message.CalcSize_Params.rgrc[0], -1, -1);
end;

procedure TdxPSSpinEdit.WMNCPaint(var message: TMessage);
begin
  inherited;
  if Flat then DrawBorder(Self);
end;

procedure TdxPSSpinEdit.WMPaste(var message: TWMPaste);
begin
  if not FEditorEnabled or ReadOnly then Exit;
  inherited;
end;

procedure TdxPSSpinEdit.WMCut(var message: TWMCut);
begin
  if not FEditorEnabled or ReadOnly then Exit;
  inherited;
end;

procedure TdxPSSpinEdit.CMEnter(var message: TMessage);
begin
  if AutoSelect and not (csLButtonDown in ControlState) then SelectAll;
  FSaveValue := Value;
  inherited;
end;

procedure TdxPSSpinEdit.CMExit(var message: TCMExit);
begin
//  if ( CheckValue(Value) <> Value ) then SetValue(Value)
//  else
  Value := Value;
  inherited;
end;

function TdxPSSpinEdit.GetValueText: string;
var
  P: Integer;
begin
  if (LegendText = '') then
    Result := Text
  else
  begin
    P := Pos(LegendText, Text);
    if (P > 0) then
      Result := System.Copy(Text, 1, P - 1)
    else
      Result := Text;
  end;
end;

function TdxPSSpinEdit.GetValue: Extended;
begin
  try
    if (ValueType = svtFloat) then
      Result := StrToFloat(GetValueText)
    else
      Result := StrToInt(GetValueText);
    {  Because of this ->  StrToFloat(',7') = 0,7   }
    Result := CheckValue(Result);
  except
    if (ValueType = svtFloat) then
      Result := FDefaultValue
    else
      Result := Trunc(FDefaultValue);
  end;
end;

procedure TdxPSSpinEdit.SetLegendText(const Value: string);
var
  T: Extended;
begin
  if (CompareStr(Value, FLegendText) <> 0) then
  begin
    T := Self.Value;
    FLegendText := Value;
    Self.Value := T;
  end;
end;

function TdxPSSpinEdit.GetLegendText: string;
begin
  if (FLegendText = '') then
    Result := FLegendText
  else if (FLegendText[1] = ' ') then
    Result := FLegendText
  else
    Result := ' ' + FLegendText;
end;

procedure TdxPSSpinEdit.SetValue(NewValue: Extended);
begin
  if (ValueType = svtFloat) then
    Text := FloatToStrF(CheckValue(NewValue), ffFixed, 15, FDecimal) + LegendText
  else
    Text := IntToStr(Round(CheckValue(NewValue))) + LegendText;
end;

function TdxPSSpinEdit.CheckValue(NewValue: Extended): Extended;
begin
  Result := NewValue;
  if CheckBounds then
//  if (FMinValue <> 0) or (FMaxValue <> FMinValue) then
    if NewValue < FMinValue then
      Result := FMinValue
    else if NewValue > FMaxValue then
      Result := FMaxValue;
end;

procedure TdxPSSpinEdit.SetDefaultValue(NewDefaultValue: Extended);
begin
  if (FDefaultValue <> NewDefaultValue) then
    FDefaultValue := CheckValue(NewDefaultValue);
end;

function TdxPSSpinEdit.GetAsInteger: Longint;
begin
  Result := Trunc(GetValue);
end;

procedure TdxPSSpinEdit.SetAsInteger(NewValue: Longint);
begin
  SetValue(NewValue);
end;

procedure TdxPSSpinEdit.SetValueType(NewType: TdxSpinValueType);
begin
  if (FValueType <> NewType) then
  begin
    FValueType := NewType;
    Value := GetValue;
    if FValueType = svtInteger then
    begin
      FIncrement := Round(FIncrement);
      if FIncrement = 0 then FIncrement := 1;
      FPageIncrement := Round(FPageIncrement);
      if FPageIncrement = 0 then FPageIncrement := 1;
    end;
  end;
end;

procedure TdxPSSpinEdit.SetFlat(Value: Boolean);
begin
  if (FFlat <> Value) then
  begin
    FFlat := Value;
    RecreateWnd;
  end;
end;

procedure TdxPSSpinEdit.SetUsePageIncr(Value: Boolean);
begin
  if (FUsePageIncr <> Value) then
  begin
    FUsePageIncr := Value;
    RecreateButton;
    ResizeButtons;
    SetEditRect;
  end;
end;

procedure TdxPSSpinEdit.SetIncrButtonWidth(Value: Integer);
begin
  if (Value < MinIncrButtonWidth) then Value := MinIncrButtonWidth;
  if (FIncrButtonWidth <> Value) then
  begin
    FIncrButtonWidth := Value;
    ResizeButtons;
    SetEditRect;
  end;
end;

procedure TdxPSSpinEdit.SetPageIncrButtonWidth(Value: Integer);
begin
  if (Value < MinIncrButtonWidth) then Value := MinIncrButtonWidth;
  if not (FPageIncrButtonWidth = Value) then
  begin
    FPageIncrButtonWidth := Value;
    ResizeButtons;
    SetEditRect;
  end;
end;

function TdxPSSpinEdit.IsIncrButtonWidthStored: Boolean;
begin
  Result := FUpDown.Width <> GetSystemMetrics(SM_CXVSCROLL);
end;

function TdxPSSpinEdit.IsPageIncrButtonWidthStored: Boolean;
begin
  Result := Assigned(FPageUpDown) and (FPageUpDown.Width <> GetSystemMetrics(SM_CXVSCROLL));
end;

function TdxPSSpinEdit.IsIncrementStored: Boolean;
begin
  Result := FIncrement <> 1.0;
end;

function TdxPSSpinEdit.IsPageIncrementStored: Boolean;
begin
  Result := FPageIncrement <> 10.0;
end;

function TdxPSSpinEdit.IsMaxStored: Boolean;
begin
  Result := (MaxValue <> 0.0);
end;

function TdxPSSpinEdit.IsMinStored: Boolean;
begin
  Result := (MinValue <> 0.0);
end;

function TdxPSSpinEdit.IsValueStored: Boolean;
begin
  Result := (GetValue <> 0.0);
end;

function TdxPSSpinEdit.IsDefaultValueStored: Boolean;
begin
  Result := (FDefaultValue <> 0.0);
end;

procedure TdxPSSpinEdit.SetMaxValue(Value: Extended);
begin
  if (FMaxValue <> Value) then
  begin
    FMaxValue := Value;
    CheckValue(Self.Value);
  end;
end;

procedure TdxPSSpinEdit.SetMinValue(Value: Extended);
begin
  if (FMinValue <> Value) then
  begin
    FMinValue := Value;
    Self.Value := Self.Value;
  end;
end;

procedure TdxPSSpinEdit.SetCheckBounds(Value: Boolean);
begin
  if (FCheckBounds <> Value) then
  begin
    FCheckBounds := Value;
    Self.Value := Self.Value;
  end;
end;

procedure TdxPSSpinEdit.SetDecimal(NewValue: Byte);
begin
  if FDecimal <> NewValue then
  begin
    FDecimal := NewValue;
    Self.Value := Self.Value;
  end;
end;

procedure TdxPSSpinEdit.SetScrollMouseSens(Value: TdxScrollMouseSensetivity);
begin
  if (FScrollMouseSens <> Value) then
  begin
    FScrollMouseSens := Value;
    TdxUpDown(FUpDown).MouseSensetivity := Value;
    if Assigned(FPageUpDown) then TdxUpDown(FPageUpDown).MouseSensetivity := Value;
  end;
end;

procedure TdxPSSpinEdit.DoButtonClick(ButtonType: TdxButtonType; Button: TUDBtnType);
begin
  if Assigned(FOnButtonClick) then FOnButtonClick(Self, ButtonType, Button);
end;


{ TdxPSColorCombo  }

const
  PureColors: array[0..19] of TColor =
    (clBlack, clOlive, clTeal, clGreen, clMoneyGreen, clLime, clNavy, clBlue,
    clAqua, clSkyBlue, clGray, clMedGray, clSilver, clMaroon, clPurple, clFuchsia, clRed,
    clCream, clYellow, clWhite);

  SysColors: array[0..24] of TColor =
    (clScrollBar, clBackground, clActiveCaption, clInactiveCaption, clMenu,
    clWindow, clWindowFrame, clMenuText, clWindowText, clCaptionText, clActiveBorder,
    clInactiveBorder, clAppWorkSpace, clHighlight, clHighlightText, clBtnFace,
    clBtnShadow, clGrayText, clBtnText, clInactiveCaptionText, clBtnHighlight,
    cl3DDkShadow, cl3DLight, clInfoText, clInfoBk);

constructor TdxPSColorCombo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Style := csOwnerDrawFixed;
  FColorTypes := [ctPure, ctSystem];
  FShowColorName := True;
  FShowCustomColor := True;
  FAutoColor := clWindowText;
  FAutoColorText := sdxAutoColorText;
  FCustomColorText := sdxCustomColorText;
  FShowAutoColor := False;
  FEndEllipsis := False;
end;

{$IFDEF DELPHI4}
procedure TdxPSColorCombo.CMBiDiModeChanged(var message: TMessage);
begin
  inherited;
  Invalidate;
end;
{$ENDIF}

procedure TdxPSColorCombo.Click;
begin
  if ShowCustomColor and (ItemIndex = Items.Count - 1) then SelectCustomColor;
  inherited Click;
end;

function TdxPSColorCombo.StandardSelectColorProc(var AColor: TColor): Boolean;
begin
  FColorDialog.Color := AColor;
  Result := FColorDialog.Execute;
  if Result then
    AColor := FColorDialog.Color;
end;

function TdxPSColorCombo.SelectColorProc: TdxSelectColorProc;
begin
  Result := nil;
  if Assigned(FOnGetSelectColorProc) then
  begin
    FOnGetSelectColorProc(Self, Result);
    if @Result = nil then
      Result := StandardSelectColorProc
  end
  else
    Result := StandardSelectColorProc;
end;

procedure TdxPSColorCombo.SelectCustomColor;
var
  C: TColor;
  Ind: Integer;
  Proc: TdxSelectColorProc;
begin
  C := TColor(Items.Objects[ItemIndex]);
  Proc := SelectColorProc();
  if Assigned(Proc) then
    if Proc(C) then
    begin
      Ind := Items.IndexOfObject(TObject(C));
      if (Ind = ItemIndex) then Exit;
      if (Ind > -1) then 
        ItemIndex := Ind
      else
      begin
        Items.Objects[ItemIndex] := TObject(C);
        Repaint;
      end;
    end
    else
      ColorValue := C;
end;

procedure TdxPSColorCombo.CreateWnd;
begin
  inherited CreateWnd;
  FillColorList;
end;

procedure TdxPSColorCombo.SetShowCustomColor(Value: Boolean);
begin
  if (FShowCustomColor <> Value) then
  begin
    FShowCustomColor := Value;
    RecreateWnd;
  end;
end;

procedure TdxPSColorCombo.SetAutoColor(Value: TColor);
begin
  if (FAutoColor <> Value) then
  begin
    FAutoColor := Value;
    if ShowAutoColor and (ItemIndex = 0) then Invalidate;
  end;
end;

procedure TdxPSColorCombo.SetAutoColorText(const Value: string);
begin
  if (CompareStr(FAutoColorText, Value) <> 0) then
  begin
    FAutoColorText := Value;
    if ShowAutoColor then RecreateWnd;//and (ItemIndex = 0) then Invalidate;
  end;
end;

procedure TdxPSColorCombo.SetEndEllipsis(Value: Boolean);
begin
  if (FEndEllipsis <> Value) then
  begin
    FEndEllipsis := Value;
    Invalidate;
  end;
end;

procedure TdxPSColorCombo.SetCustomColorText(const Value: string);
begin
  if (CompareStr(FCustomColorText, Value) <> 0) then
  begin
    FCustomColorText := Value;
    if ShowCustomColor then RecreateWnd;//and (ItemIndex = 0) then Invalidate;
  end;
end;

procedure TdxPSColorCombo.SetShowAutoColor(Value: Boolean);
begin
  if (FShowAutoColor <> Value) then
  begin
    FShowAutoColor := Value;
    RecreateWnd;
  end;
end;

function TdxPSColorCombo.GetColorName(Index: Integer): string;
var
  Kind: TdxColorKind;
begin
  Result := Items[Index];
  if Assigned(FOnGetColorName) then
  begin
    if (ShowAutoColor and (Index = 0)) then
      Kind := ckAuto
    else 
      if (ShowCustomColor and (Index = Items.Count - 1)) then
        Kind := ckCustom
      else
        Kind := ckNormal;
    FOnGetColorName(Self, Index, TColor(Items.Objects[Index]), Kind, Result);
  end;
end;

procedure TdxPSColorCombo.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState);
const
  ColorWidth = 22;
  Format = DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX;
  EndEllipsis: array[Boolean] of UINT = (0, DT_END_ELLIPSIS);
var
  ColorRect, TxtRect: TRect;
  PrevColor: TColor;
  PrevMode: Integer;
  S: string;
begin
  Canvas.FillRect(Rect);
  InflateRect(Rect, -2, -2);
  ColorRect := Rect;
  TxtRect := Rect;
  if FShowColorName or ((ShowAutoColor and (Index = 0)) or
    (ShowCustomColor and (Index = Items.Count - 1))) then
  begin
{$IFDEF DELPHI4}
    if (BiDiMode = bdRightToLeft) then
      ColorRect.Left := ColorRect.Right - ColorWidth
    else
{$ENDIF}
      ColorRect.Right := ColorRect.Left + ColorWidth;

    SubtractRect(TxtRect, Rect, ColorRect);
{$IFDEF DELPHI4}
    if (BiDiMode = bdRightToLeft) then
      Dec(TxtRect.Right, 6);
{$ENDIF}
    Inc(TxtRect.Left, 6);
  end; // else if ( Index = Items.Count - 1 ) then
  //  SetRectEmpty(AColorRect);

  with Canvas do
  begin
    Pen.Color := clBtnShadow;
    PrevColor := Brush.Color;
    if ShowAutoColor and (Index = 0) then
    begin
      Brush.Color := AutoColor;
      Brush.Style := bsSolid;
    end
    else 
      if not ShowAutoColor or (TColor(Items.Objects[Index]) <> clNone) then
      begin
        Brush.Color := TColor(Items.Objects[index]);
        Brush.Style := bsSolid;
      end
      else
        Brush.Style := bsClear;
        
    if not IsRectEmpty(ColorRect) then
      with ColorRect do
        Rectangle(Left, Top, Right, Bottom);
    Brush.Color := PrevColor;

    PrevMode := SetBkMode(Handle, Transparent);
    if not Enabled then
      PrevColor := SetTextColor(Handle, ColorToRGB(clInactiveCaptionText));
      
    if FShowColorName or ((ShowAutoColor and (Index = 0)) or
      (ShowCustomColor and (Index = Items.Count - 1))) then
    begin
      S := GetColorName(Index);
      DrawText(Canvas.Handle, PChar(S), Length(S), TxtRect, Format or EndEllipsis[Self.EndEllipsis]);
    end;
    
    if not Enabled then
      SetTextColor(Handle, ColorToRGB(PrevColor));
    SetBkMode(Handle, PrevMode);
  end;
end;

procedure TdxPSColorCombo.CNCommand(var message: TWMCommand);
begin
  case message.NotifyCode of
    CBN_SELCHANGE:
      begin
        Text := Items[ItemIndex];
        //if not DroppedDown then Click;
        Change;
        Exit;
      end;
    CBN_CLOSEUP:
      if FSelEndOk then Click;
    CBN_DROPDOWN: 
      FSelEndOk := True;
    CBN_SELENDCANCEL: 
      FSelEndOk := False;
  end;
  inherited;
end;

procedure TdxPSColorCombo.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if not DroppedDown and ShowCustomColor and (Key = vk_RETURN) and
    (ItemIndex = Items.Count - 1) then 
    Click;
  inherited;
end;

procedure TdxPSColorCombo.CMRecreateWnd(var message: TMessage);
var
  ASaveValue: TColor;
  Ind: Integer;
begin
  ASaveValue := ColorValue;
  inherited;
  Ind := FindRGB(ASaveValue);
  if Ind > -1 then ItemIndex := Ind;
end;

function TdxPSColorCombo.FindRGB(AColor: TColor): Integer;

  function IsSysColor(Color: TColor): Boolean;
  begin
    Result := (Color and $80000000 = $80000000);
  end;
  
var
  C: TColor;
begin
  if IsSysColor(AColor) then
    AColor := ColorToRGB(GetSysColor(AColor))
  else
    AColor := ColorToRGB(AColor);
  for Result := 0 to Items.Count - 1 do
  begin
    C := TColor(Items.Objects[Result]);
    if IsSysColor(C) then
      C := ColorToRGB(GetSysColor(C))
    else
      C := ColorToRGB(C);
    if CompareMem(@AColor, @C, SizeOf(COLORREF)) then Exit;
  end;
  Result := -1;
end;

procedure TdxPSColorCombo.CMFontChanged(var message: TMessage);
begin
  inherited;
  ResetItemHeight;
end;

procedure TdxPSColorCombo.CMEnabledChanged(var message: TMessage);
begin
  inherited;
  if csDesigning in ComponentState then Invalidate;
end;

procedure TdxPSColorCombo.ResetItemHeight;
var
  H: Integer;
begin
  H := -MulDiv(Font.Height, 15, 10);
  if H < 10 then H := 10;
  ItemHeight := H;
end;

procedure TdxPSColorCombo.FillColorList;
begin
  with Items do
  begin
    BeginUpdate;
    try
      Clear;
      if ShowAutoColor then AddObject(AutoColorText, TObject(AutoColor));
      if ctPure in FColorTypes then
      begin
        AddObject(sdxPureColorBlack, TObject(PureColors[0]));
        AddObject(sdxPureColorOlive, TObject(PureColors[1]));        
        AddObject(sdxPureColorTeal, TObject(PureColors[2]));
        AddObject(sdxPureColorGreen, TObject(PureColors[3]));
        AddObject(sdxPureColorMoneyGreen, TObject(PureColors[4]));
        AddObject(sdxPureColorLime, TObject(PureColors[5]));
        AddObject(sdxPureColorNavy, TObject(PureColors[6]));
        AddObject(sdxPureColorBlue, TObject(PureColors[7]));
        AddObject(sdxPureColorAqua, TObject(PureColors[8]));
        AddObject(sdxPureColorSkyBlue, TObject(PureColors[9]));
        AddObject(sdxPureColorGray, TObject(PureColors[10]));
        AddObject(sdxPureColorMedGray, TObject(PureColors[11]));
        AddObject(sdxPureColorSilver, TObject(PureColors[12]));
        AddObject(sdxPureColorMaroon, TObject(PureColors[13]));
        AddObject(sdxPureColorPurple, TObject(PureColors[14]));
        AddObject(sdxPureColorFuchsia, TObject(PureColors[15]));
        AddObject(sdxPureColorRed, TObject(PureColors[16]));
        AddObject(sdxPureColorCream, TObject(PureColors[17]));
        AddObject(sdxPureColorYellow, TObject(PureColors[18]));
        AddObject(sdxPureColorWhite, TObject(PureColors[19]));
      end;
      if ctSystem in FColorTypes then
      begin
        AddObject(sdxSysColorScrollBar, TObject(SysColors[0]));
        AddObject(sdxSysColorBackground, TObject(SysColors[1]));
        AddObject(sdxSysColorActiveCaption, TObject(SysColors[2]));
        AddObject(sdxSysColorInactiveCaption, TObject(SysColors[3]));
        AddObject(sdxSysColorMenu, TObject(SysColors[4]));
        AddObject(sdxSysColorWindow, TObject(SysColors[5]));
        AddObject(sdxSysColorWindowFrame, TObject(SysColors[6]));
        AddObject(sdxSysColorMenuText, TObject(SysColors[7]));
        AddObject(sdxSysColorWindowText, TObject(SysColors[8]));
        AddObject(sdxSysColorCaptionText, TObject(SysColors[9]));
        AddObject(sdxSysColorActiveBorder, TObject(SysColors[10]));
        AddObject(sdxSysColorInactiveBorder, TObject(SysColors[11]));
        AddObject(sdxSysColorAppWorkSpace, TObject(SysColors[12]));
        AddObject(sdxSysColorHighLight, TObject(SysColors[13]));
        AddObject(sdxSysColorHighLighText, TObject(SysColors[14]));
        AddObject(sdxSysColorBtnFace, TObject(SysColors[15]));
        AddObject(sdxSysColorBtnShadow, TObject(SysColors[16]));
        AddObject(sdxSysColorGrayText, TObject(SysColors[17]));
        AddObject(sdxSysColorBtnText, TObject(SysColors[18]));
        AddObject(sdxSysColorInactiveCaptionText, TObject(SysColors[19]));
        AddObject(sdxSysColorBtnHighligh, TObject(SysColors[20]));
        AddObject(sdxSysColor3DDkShadow, TObject(SysColors[21]));
        AddObject(sdxSysColor3DLight, TObject(SysColors[22]));
        AddObject(sdxSysColorInfoText, TObject(SysColors[23]));
        AddObject(sdxSysColorInfoBk, TObject(SysColors[24]));
      end;    
      if ShowCustomColor then AddObject(CustomColorText, TObject(clNone));
      ItemIndex := 0;
    finally
      EndUpdate;
    end;
  end;  
end;

function TdxPSColorCombo.GetColorValue: TColor;
begin
  Result := TColor(Items.Objects[ItemIndex]);
end;

function TdxPSColorCombo.IsAutoColorTextStored: Boolean;
begin
  Result := AnsiCompareStr(sdxAutoColorText, AutoColorText) <> 0;
end;

function TdxPSColorCombo.IsCustomColorTextStored: Boolean;
begin
  Result := AnsiCompareStr(sdxCustomColorText, CustomColorText) <> 0;
end;

procedure TdxPSColorCombo.SetColorValue(Value: TColor);
var
  Index: Integer;
begin
  Index := Items.IndexOfObject(TObject(Value));
  if Index > -1 then 
    ItemIndex := Index
  else 
    if ShowCustomColor then
    begin
      Items.Objects[Items.Count - 1] := TObject(Value);
      ItemIndex := Items.Count - 1;
      Repaint;
    end;
end;

function TdxPSColorCombo.GetColorTypes: TdxColorTypes;
begin
  Result := FColorTypes;
end;

procedure TdxPSColorCombo.SetColorTypes(Value: TdxColorTypes);
begin
  if Value <> FColorTypes then
  begin
    if Value = [] then Value := [ctPure];
    FColorTypes := Value;
    RecreateWnd;
  end;
end;

procedure TdxPSColorCombo.SetShowColorName(Value: Boolean);
begin
  if Value <> FShowColorName then
  begin
    FShowColorName := Value;
    Repaint;
  end;
end;


{ TdxPSBrushStyleCombo }

constructor TdxPSBrushStyleCombo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ItemHeight := 22;
  Height := 22;
  FEndEllipsis := False;
  FShowStyleName := False;
  FBrushColor := clWindowText;
  Style := csOwnerDrawFixed;
end;

{$IFDEF DELPHI4}

procedure TdxPSBrushStyleCombo.CMBiDiModeChanged(var message: TMessage);
begin
  inherited;
  Invalidate;
end;
{$ENDIF}

procedure TdxPSBrushStyleCombo.CreateWnd;
begin
  inherited CreateWnd;
  FillStyleList;
  ItemIndex := 0;
end;

procedure TdxPSBrushStyleCombo.CMFontChanged(var message: TMessage);
begin
  inherited;
  ResetItemHeight;
end;

procedure TdxPSBrushStyleCombo.CMRecreateWnd(var message: TMessage);
var
  SaveStyle: TBrushStyle;
begin
  SaveStyle := BrushStyle;
  inherited;
  BrushStyle := SaveStyle;
end;

procedure TdxPSBrushStyleCombo.CMEnabledChanged(var message: TMessage);
begin
  inherited;
  if csDesigning in ComponentState then Invalidate;
end;

function TdxPSBrushStyleCombo.GetStyleName(Index: Integer): string;
begin
  Result := Items[Index];
  if Assigned(FOnGetBrushStyleName) then
    FOnGetBrushStyleName(Self, Index, TBrushStyle(Items.Objects[Index]), Result);
end;

procedure TdxPSBrushStyleCombo.SetStyleValue(Value: TBrushStyle);
begin
  ItemIndex := Items.IndexOfObject(TObject(Value));
end;

function TdxPSBrushStyleCombo.GetStyleValue: TBrushStyle;
begin
  if ItemIndex > -1 then
    Result := TBrushStyle(Items.Objects[ItemIndex])
  else
    Result := bsSolid;
end;

procedure TdxPSBrushStyleCombo.SetBrushColor(Value: TColor);
begin
  if FBrushColor <> Value then
  begin
    FBrushColor := Value;
    Invalidate;
  end;
end;

procedure TdxPSBrushStyleCombo.SetShowStyleName(Value: Boolean);
begin
  if FShowStyleName <> Value then
  begin
    FShowStyleName := Value;
    Invalidate;
  end;
end;

procedure TdxPSBrushStyleCombo.SetEndEllipsis(Value: Boolean);
begin
  if FEndEllipsis <> Value then
  begin
    FEndEllipsis := Value;
    Invalidate;
  end;
end;

procedure TdxPSBrushStyleCombo.ResetItemHeight;
var
  H: Integer;
begin
  H := -MulDiv(Font.Height, 12, 10);
  if H < 22 then H := 22;
  ItemHeight := H;
end;

procedure TdxPSBrushStyleCombo.DrawItem(Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
const
  Format = DT_SINGLELINE or DT_LEFT or DT_VCENTER;
  cEndEllipsis: array[Boolean] of UINT = (0, DT_END_ELLIPSIS);
var
  APrevMode: Integer;
  APrevStyle: TBrushStyle;
  APrevColor: TColor;
  ABrushRect: TRect;
  ATextRect: TRect;
  AText: string;
begin
  Canvas.FillRect(Rect);
  InflateRect(Rect, -2, -2);
  ABrushRect := Rect;
  ATextRect := Rect;
  with Canvas do
  begin
    APrevMode := SetBkMode(Handle, Transparent);

    if FShowStyleName then
    begin
{$IFDEF DELPHI4}
      if BiDiMode = bdRightToLeft then
        ABrushRect.Left := ABrushRect.Right - (Rect.Right - Rect.Left) div 2
      else
{$ENDIF}
        ABrushRect.Right := ABrushRect.Left + (Rect.Right - Rect.Left) div 2;

      SubtractRect(ATextRect, Rect, ABrushRect);
{$IFDEF DELPHI4}
      if BiDiMode = bdRightToLeft then
        Dec(ATextRect.Right, 6);
{$ENDIF}
      Inc(ATextRect.Left, 6);
    end;

    Pen.Color := clBtnShadow;
    APrevStyle := Brush.Style;
    Brush.Style := TBrushStyle(Items.Objects[index]);
    APrevColor := Brush.Color;
    if Index = 1 then //BrushStyle = bsClear
      Brush.Color := clWindow
    else 
      if BrushColor = clWindow then
        if Index > 1 then //BrushStyle > bsClear
          Brush.Color := clBlack
        else
          Brush.Color := BrushColor
      else
        Brush.Color := BrushColor;

    with ABrushRect do
      Windows.Rectangle(Handle, Left, Top, Right, Bottom);
    Brush.Style := APrevStyle;
    Brush.Color := APrevColor;
    if FShowStyleName then
    begin
      SetBkMode(Handle, TRANSPARENT);    
      if not Enabled then
        APrevColor := SetTextColor(Handle, ColorToRGB(clInactiveCaptionText));
      AText := StyleName[Index];
      DrawText(Handle, PChar(AText), Length(AText), ATextRect, Format or cEndEllipsis[EndEllipsis]);
      if not Enabled then
        SetTextColor(Handle, ColorToRGB(APrevColor));
    end;
    SetBkMode(Handle, APrevMode);
  end;
end;

procedure TdxPSBrushStyleCombo.FillStyleList;
begin
  with Items do 
  begin
    BeginUpdate;
    try
      Clear;
      AddObject(sdxBrushStyleSolid, TObject(bsSolid));
      AddObject(sdxBrushStyleClear, TObject(bsClear));
      AddObject(sdxBrushStyleHorizontal, TObject(bsHorizontal));
      AddObject(sdxBrushStyleVertical, TObject(bsVertical));
      AddObject(sdxBrushStyleFDiagonal, TObject(bsFDiagonal));
      AddObject(sdxBrushStyleBDiagonal, TObject(bsBDiagonal));
      AddObject(sdxBrushStyleCross, TObject(bsCross));
      AddObject(sdxBrushStyleDiagCross, TObject(bsDiagCross));
    finally
      EndUpdate;
    end;
  end;  
end;


{ TdxPSPaintPanel }

constructor TdxPSPaintPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEdgeBorders := [ebLeft, ebTop, ebRight, ebBottom];
  FEdgeInner := esRaised;
  FEdgeOuter := esSunken;
  FDoubleBuffered := True;
end;

procedure TdxPSPaintPanel.Paint;
begin
  DoPaint;
end;

procedure TdxPSPaintPanel.DoMouseEnter;
begin
  if Assigned(FOnMouseEnter) then FOnMouseEnter(Self)
end;

procedure TdxPSPaintPanel.DoMouseLeave;
begin
  if Assigned(FOnMouseLeave) then FOnMouseLeave(Self)
end;

procedure TdxPSPaintPanel.DoPaint;
begin
  if Assigned(FOnPaint) then FOnPaint(Self)
end;

function TdxPSPaintPanel.GetEdgeBorders: TdxEdgeBorders;
begin
  Result := FEdgeBorders;
end;

procedure TdxPSPaintPanel.SetEdgeBorders(Value: TdxEdgeBorders);
begin
  if FEdgeBorders <> Value then
  begin
    FEdgeBorders := Value;
    if (FEdgeOuter <> esNone) and (FEdgeInner <> esNone) then 
      RecreateWnd;
  end;
end;

procedure TdxPSPaintPanel.SetEdgeInner(Value: TdxEdgeStyle);
begin
  if FEdgeInner <> Value then
  begin
    FEdgeInner := Value;
    RecreateWnd;
  end;
end;

procedure TdxPSPaintPanel.SetEdgeOuter(Value: TdxEdgeStyle);
begin
  if FEdgeOuter <> Value then
  begin
    FEdgeOuter := Value;
    RecreateWnd;
  end;
end;

{$IFNDEF DELPHI4}
procedure TdxPSPaintPanel.WMEraseBkgnd(var message: TWMEraseBkgnd);
begin
  message.Result := 1;
end;
{$ENDIF}

procedure TdxPSPaintPanel.WMNCCalcSize(var message: TWMNCCalcSize);
var
  EdgeSize: Integer;
begin
  with Message.CalcSize_Params^ do
  begin
    if Ctl3D then
      EdgeSize := Integer(EdgeInner > esNone) + Integer(EdgeOuter > esNone)
    else
      EdgeSize := 1;
    with rgrc[0] do
    begin
      if ebLeft in FEdgeBorders then Inc(Left, EdgeSize);
      if ebTop in FEdgeBorders then Inc(Top, EdgeSize);
      if ebRight in FEdgeBorders then Dec(Right, EdgeSize);
      if ebBottom in FEdgeBorders then Dec(Bottom, EdgeSize);
    end;
  end;
  inherited;
end;

procedure TdxPSPaintPanel.WMNCPaint(var message: TWMNCPaint);
const
  InnerStyles: array[TdxEdgeStyle] of Integer = (0, BDR_RAISEDINNER, BDR_SUNKENINNER);
  OuterStyles: array[TdxEdgeStyle] of Integer = (0, BDR_RAISEDOUTER, BDR_SUNKENOUTER);
  Ctl3DStyles: array[Boolean] of Integer = (BF_MONO, 0);
var
  R: TRect;
  DC: HDC;
begin
  GetWindowRect(Handle, R);
  OffsetRect(R, -R.Left, -R.Top);
  DC := GetWindowDC(Handle);
  try
    DrawEdge(DC, R, InnerStyles[FEdgeInner] or OuterStyles[FEdgeOuter],
      Byte(FEdgeBorders) or Ctl3DStyles[Ctl3D] { or BF_ADJUST});
  finally
    ReleaseDC(Handle, DC);
  end;
end;

procedure TdxPSPaintPanel.CMCtl3DChanged(var Message: TMessage);
begin
  inherited;
  if (FEdgeBorders <> []) then RecreateWnd;
end;

procedure TdxPSPaintPanel.CMTextChanged(var message: TMessage);
begin
end;

procedure TdxPSPaintPanel.CMMouseEnter(var message: TMessage);
begin
  inherited;
  DoMouseEnter;
end;

procedure TdxPSPaintPanel.CMMouseLeave(var message: TMessage);
begin
  inherited;
  DoMouseLeave;
end;


{ TdxPSBitmapAnimator }

constructor TdxPSBitmapAnimator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAnimationSpeed := 10;
  FAnimationStepCount := 10;
  FBitmap := TBitmap.Create;
  FBitmap.OnChange := BitmapChanged;
  FState := False;
end;

destructor TdxPSBitmapAnimator.Destroy;
begin
  FBitmap.Free;
  inherited Destroy;
end;

procedure TdxPSBitmapAnimator.BitmapChanged(Sender: TObject);
begin
  SetBounds(Left, Top, FBitmap.Width, FBitmap.Height);
end;

procedure TdxPSBitmapAnimator.SetBitmap(Value: TBitmap);
begin
  FBitmap.Assign(Value);
end;

procedure TdxPSBitmapAnimator.Paint;
begin
  if State and not Bitmap.Empty then
    Canvas.Draw(0, 0, Bitmap);
end;

procedure TdxPSBitmapAnimator.SetState(Value: Boolean);
begin
  if (FState <> Value) then 
  begin
    FState := Value;
    if not Bitmap.Empty then Animate(FState);
  end;  
end;

procedure TdxPSBitmapAnimator.Animate(AState: Boolean);
var
  T: DWORD;
  H, W, V, i, dY: Integer;
  DC: hDC;
begin
  DC := Canvas.Handle;
  with ClientRect do 
  begin
    W := Right - Left;
    H := Bottom - Top;
  end;
  dY := H div AnimationStepCount + Byte((H mod AnimationStepCount) <> 0);
  T := GetTickCount;  
  for i := 1 to AnimationStepCount do 
  begin
    while (GetTickCount - T) < DWORD(FAnimationSpeed) do ;
    T := GetTickCount;
    if AState then 
    begin
      V := H - i * dY;
      if (V < 0) then V := 0;
      Canvas.Draw(0, V, Bitmap);
    end  
    else
    begin
      V := i * dY;
      if (V >= H) then V := H;
      FillRect(DC, Bounds(0, V - dY, W, dY), HBRUSH(COLOR_BTNFACE + 1));
      Canvas.Draw(0, V, Bitmap);
    end;  
  end;
  if (Bitmap.Width < W) then
    FillRect(DC, Rect(Bitmap.Width, 0, W, H), HBRUSH(COLOR_BTNFACE + 1));      
end;

initialization
  FColorDialog := TColorDialog.Create(nil);
  
finalization
  if (dxCustomColorRegPath <> '') then dxSaveCustomColors(dxCustomColorRegPath);
  FColorDialog.Free;
   
end.

