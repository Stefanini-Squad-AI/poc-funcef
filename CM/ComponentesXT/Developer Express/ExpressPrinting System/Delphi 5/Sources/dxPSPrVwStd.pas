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

unit dxPSPrVwStd;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ComCtrls, StdCtrls, ExtCtrls, ToolWin, Menus, {$IFDEF DELPHI4}ImgList, {$ENDIF}
  dxExtCtrls, dxPrevw, dxPSPrvw;

type
  TdxfmStdPreview = class(TCustomdxPSPreviewWindow)
    ToolBar: TToolBar;
    tbPrint: TToolButton;
    tbPrintDialog: TToolButton;
    tbPageSetup: TToolButton;
    tbSeparator2: TToolButton;
    tbPercent100: TToolButton;
    tbPageWidth: TToolButton;
    tbOnePage: TToolButton;
    tbTwoPage: TToolButton;
    tbFourPage: TToolButton;
    pnlZoomCbx: TPanel;
    tbGotoFirstPage: TToolButton;
    tbGotoPrevPage: TToolButton;
    tbGotoNextPage: TToolButton;
    tbGotoLastPage: TToolButton;
    pnlCurrentPage: TPanel;
    tbHelp: TToolButton;
    pmToolBar: TPopupMenu;
    pmiFlatBtns: TMenuItem;
    pmiLargeBtns: TMenuItem;
    MainMenu1: TMainMenu;
    miFilePageSetup: TMenuItem;
    miFilePrint: TMenuItem;
    miFilePreferences: TMenuItem;
    miLine1: TMenuItem;
    miFileExit: TMenuItem;
    miView: TMenuItem;
    miViewMargins: TMenuItem;
    miLine4: TMenuItem;
    miViewFlatTBtns: TMenuItem;
    miViewLargeTBtns: TMenuItem;
    miViewZoom: TMenuItem;
    miZoomPercent100: TMenuItem;
    miLine6: TMenuItem;
    miZoomPageWidth: TMenuItem;
    miZoomWholePage: TMenuItem;
    miZoomTwoPages: TMenuItem;
    miZoomFourPages: TMenuItem;
    miGoToPage: TMenuItem;
    miGoToFirstPage: TMenuItem;
    miGoToPrevPage: TMenuItem;
    miLine8: TMenuItem;
    miGoToNextPage: TMenuItem;
    miGoToLastPage: TMenuItem;
    miFileDesign: TMenuItem;
    miFile: TMenuItem;
    miFormatPageBackground: TMenuItem;
    miHelp: TMenuItem;
    miHelpTopics: TMenuItem;
    tbClose: TToolButton;
    tbSeparator8: TToolButton;
    tbPageBackground: TToolButton;
    tbSeparator3: TToolButton;
    miLine5: TMenuItem;
    miViewToolBar: TMenuItem;
    miViewMarginBar: TMenuItem;
    miViewStatusBar: TMenuItem;
    tbReportDesigner: TToolButton;
    tbSeparator1: TToolButton;
    tbWidenToSourceWidth: TToolButton;
    miLine7: TMenuItem;
    miZoomWidenToSourceWidth: TMenuItem;
    tbSeparator4: TToolButton;
    tbSeparator5: TToolButton;
    pmPreview: TPopupMenu;
    pmiZoomPercent100: TMenuItem;
    miLine10: TMenuItem;
    pmiZoomPageWidth: TMenuItem;
    pmiZoomWholePage: TMenuItem;
    pmiZoomTwoPages: TMenuItem;
    pmiZoomFourPages: TMenuItem;
    pmiZoomWidenToSourceWidth: TMenuItem;
    miLine9: TMenuItem;
    miLine11: TMenuItem;
    pmiGoToFirstPage: TMenuItem;
    pmiGoToPrevPage: TMenuItem;
    pmiGoToNextPage: TMenuItem;
    pmiGoToLastPage: TMenuItem;
    tbMultiplePages: TToolButton;
    miLine20: TMenuItem;
    miZoomSetup: TMenuItem;
    tbShrinkToPageWidth: TToolButton;
    pmiReportShrinkToPageWidth: TMenuItem;
    miFormatShrinkToPageWidth: TMenuItem;
    miLine12: TMenuItem;
    pmiReportDesign: TMenuItem;
    pmiZoom: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ilToolBarSmall: TImageList;
    ilToolBarSmallDisabled: TImageList;
    ilToolBarLarge: TImageList;
    ilToolBarLargeDisabled: TImageList;
    ilStub: TImageList;
    miLine2: TMenuItem;
    miLine3: TMenuItem;
    miFormat: TMenuItem;
    miLine13: TMenuItem;
    miFormatDateTime: TMenuItem;
    N4: TMenuItem;
    miFormatPageNumbering: TMenuItem;
    N5: TMenuItem;
    miEdit: TMenuItem;
    miEditFind: TMenuItem;
    miEditFindNext: TMenuItem;
    N6: TMenuItem;
    miEditReplace: TMenuItem;
    miFormatAutoText: TMenuItem;
    miViewPageHeaders: TMenuItem;
    miViewPageFooters: TMenuItem;
    N1: TMenuItem;
    pmiPageSetup: TMenuItem;
    N2: TMenuItem;
    miHelpAbout: TMenuItem;
    N3: TMenuItem;
    miFormatShowHideEmptyPages: TMenuItem;
    pmPrintStyles: TPopupMenu;
    miFilePrintStyles: TMenuItem;
    pmiFilePrintStyles: TMenuItem;
    procedure pmiFlatBtnsClick(Sender: TObject);
    procedure pmiLargeBtnsClick(Sender: TObject);
    procedure PageSetupClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure ZoomClick(Sender: TObject);
    procedure GoToPageClick(Sender: TObject);
    procedure CloseClick(Sender: TObject);
    procedure cbxPredefinedZoomClick(Sender: TObject);
    procedure cbxPredefinedZoomCloseUp(Sender: TObject; AAccept: Boolean);
    procedure cbxPredefinedZoomExit(Sender: TObject);
    procedure cbxPredefinedZoomKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure seActivePageExit(Sender: TObject);
    procedure seKeyPress(Sender: TObject; var Key: Char);
    procedure seActivePageButtonClick(Sender: TObject;
      ButtonType: TdxButtonType; Button: TUDBtnType);
    procedure DesignClick(Sender: TObject);
    procedure PageBackgroundClick(Sender: TObject);
    procedure pnlZoomCbxResize(Sender: TObject);
    procedure pnlCurrentPageResize(Sender: TObject);
    procedure OptionsClick(Sender: TObject);
    procedure miViewMarginsClick(Sender: TObject);
    procedure HelpClick(Sender: TObject);
    procedure miViewMarginBarClick(Sender: TObject);
    procedure miViewStatusBarClick(Sender: TObject);
    procedure pmToolBarPopup(Sender: TObject);
    procedure pmPreviewPopup(Sender: TObject);
    procedure tbMultiplePagesClick(Sender: TObject);
    procedure miZoomSetupClick(Sender: TObject);
    procedure ShrinkToPageWidthClick(Sender: TObject);
    procedure miFormatDateTimeClick(Sender: TObject);
    procedure miFormatPageNumberingClick(Sender: TObject);
    procedure miViewPageHeadersClick(Sender: TObject);
    procedure miViewPageFootersClick(Sender: TObject);
    procedure miFormatShowHideEmptyPagesClick(Sender: TObject);
    procedure pmPrintStylesPopup(Sender: TObject);
  private
    FcbxPredefinedZoom: TCustomEdit;
    FseActivePage: TCustomEdit;

    FFlatCtrls: Boolean;
    FLargeBtns: Boolean;

    procedure SetFlatCtrls(Value: Boolean);
    procedure SetLargeBtns(Value: Boolean);

    procedure ArrangeToolBarCtrls;
    procedure AssignToolBarImages;
    function CalcWindowPos(Sender: TObject): TPoint;
    procedure CheckItem(AParent: TMenuItem);
    procedure LoadPropertiesFromRegistry(const APath: string);
    procedure SavePropertiesToRegistry(const APath: string);
    procedure SetupFlatCtrls;
    procedure WMInitMenu(var Message: TWMInitMenu); message WM_INITMENU;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

    procedure CreateControls; override;
    procedure DoAfterPrintReport(AShowDialog: Boolean); override;
    procedure DoPreviewZoomFactorChanged(APreview: TdxPreview); override;
    procedure DoPreviewZoomModeChanged(APreview: TdxPreview); override;
    procedure LoadStrings; override;
    procedure StyleListChanged(Sender: TObject); override;
  public
    procedure AfterConstruction; override;

    procedure InitContent; override;
    procedure LoadFromRegistry(const APath: string); override;
    procedure SaveToRegistry(const APath: string); override;
    procedure UpdateControls; override;

    property FlatCtrls: Boolean read FFlatCtrls write SetFlatCtrls;
    property LargeBtns: Boolean read FLargeBtns write SetLargeBtns;
  end;

implementation

{$R *.DFM}

uses
  Registry, CommCtrl, MATH,
  dxPSGlbl, dxPSEngn, dxPSCore, dxPgsDlg, dxPSRes, dxPSImgs, dxPSUtl, dxPrnDev;

const
  ToolBarHeight: array[Boolean] of Integer = {$IFNDEF DELPHI4}(34, 50){$ELSE}(38, 54){$ENDIF};
  ToolBtnSize: array[Boolean] of TSize = ((cx: 25; cy: 24), (cx: 40; cy: 40));

{ --- predefined zooms ----
  '500%, 200%, 150%, 100%, 75%, 50%, 25%, 10%,
  "Page Width", "Whole Page", "Two Pages", "Four Pages", "Widen To Source Width' }

  dxPredefinedZoomValueCount = 8;
  dxFullZoomValueCount = 13;
  ItemIndexes: array[0..dxFullZoomValueCount - 1] of Integer =
    (-1, -1, -1, 5, -1, -1, -1, -1, 6, 7, 8, 9, 11);

var
  ToolBarImages: array[0..1, Boolean] of TImageList;

type
  TdxZoomFactorComboEdit = class;

  PPopupItem = ^TPopupItem;
  TPopupItem = record
    Enabled: Boolean;
    ImageIndex: Integer;
  end;

  TdxPopupBox = class(TCustomListBox)
  private
    function GetEdit: TdxZoomFactorComboEdit;
    function GetTextColor(Index: Integer; State: TOwnerDrawState): TColor;

{$IFDEF DELPHI5}
    procedure WMContextMenu(var message: TWMContextMenu); message WM_CONTEXTMENU;
{$ENDIF}
    procedure WMLButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMNCCalcSize(var message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var message: TMessage); message WM_NCPAINT;
    procedure WMRButtonUp(var message: TWMRButtonUp); message WM_RBUTTONUP;
    procedure CMHintShow(var Message: TMessage); message CM_HINTSHOW;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure WndProc(var message: TMessage); override;

    property Edit: TdxZoomFactorComboEdit read GetEdit;
  public
    constructor Create(AOwner: TComponent); override;
  end;


  TdxCloseUpEvent = procedure(Sender: TObject; AAccept: Boolean) of object;

  TdxZoomFactorComboEdit = class(TCustomEdit)
  private
    FBorderWidth: Integer;
    FButtonWidth: Integer;
    FDisabledImages: TImageList;
    FDisabledImagesChangeLink: TChangeLink;
    FDropDownCount: Integer;
    FDroppedDown: Boolean;
    FFlat: Boolean;
    FImages: TImageList;
    FImagesChangeLink: TChangeLink;
    FItemIndex: Integer;
    FItemList: TList;
    FItems: TStrings;
    FLockChanges: Boolean;
    FMouseInPickButton: Boolean;
    FMousePressed: Boolean;
    FPopupBox: TCustomListBox;
    FSaveColor: TColor;
    FSaveText: string;

    FOnCloseUp: TdxCloseUpEvent;
    FOnDropDown: TNotifyEvent;

    function GetImageIndex(Index: Integer): Integer;
    function GetItemEnabled(Index: Integer): Boolean;
    procedure SetDisabledImages(Value: TImageList);
    procedure SetDropDownCount(Value: Integer);
    procedure SetDroppedDown(Value: Boolean);
    procedure SetFlat(Value: Boolean);
    procedure SetImages(Value: TImageList);
    procedure SetImageIndex(Index: Integer; Value: Integer);
    procedure SetItemEnabled(Index: Integer; Value: Boolean);
    procedure SetItemIndex(Value: Integer);
    procedure SetItems(Value: TStrings);

    procedure CloseUp(Accept: Boolean);
    procedure DropDown;
    procedure InvalidateNC;
    procedure MakeZoomItems;
    function GetMouseInPickButton(const PT: TPoint): Boolean;
    procedure DrawButton;

    procedure CMCancelMode(var message: TCMCancelMode); message CM_CANCELMODE;
    procedure CMEnabledChanged(var message: TWMNoParams); message CM_ENABLEDCHANGED;
    procedure CMHintShow(var message: TCMHintShow); message CM_HINTSHOW;
{$IFDEF DELPHI5}
    procedure WMContextMenu(var message: TWMContextMenu); message WM_CONTEXTMENU;
{$ENDIF}
    procedure WMCaptureChanged(var message: TMessage); message WM_CAPTURECHANGED;
    procedure WMKillFocus(var message: TMessage); message WM_KILLFOCUS;
    procedure WMMouseMove(var message: TWMMouseMove); message WM_MOUSEMOVE;
    procedure WMNCCalcSize(var message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCHitTest(var message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCLButtonDown(var message: TWMNCLButtonDown); message WM_NCLBUTTONDOWN;
    procedure WMNCLButtonUp(var message: TWMNCLButtonDown); message WM_NCLBUTTONUP;
    procedure WMNCPaint(var message: TMessage); message WM_NCPAINT;
    procedure WMRButtonUp(var message: TWMRButtonUp); message WM_RBUTTONUP;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure DoEnter; override;
    procedure Change; override;
    procedure KeyPress(var Key: Char); override;
    procedure WndProc(var message: TMessage); override;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;

    property DroppedDown: Boolean read FDroppedDown write SetDroppedDown;
    property ItemEnabled[Index: Integer]: Boolean read GetItemEnabled write SetItemEnabled;
    property ImageIndexes[Index: Integer]: Integer read GetImageIndex write SetImageIndex;
  published
    property DisabledImages: TImageList read FDisabledImages write SetDisabledImages;
    property DropDownCount: Integer read FDropDownCount write SetDropDownCount
    default 8;
    property Flat: Boolean read FFlat write SetFlat
    default False;
    property Images: TImageList read FImages write SetImages;
    property ItemIndex: Integer read FItemIndex write SetItemIndex;
    property Items: TStrings read FItems write SetItems;

    property OnClick;
    property OnCloseUp: TdxCloseUpEvent read FOnCloseUp write FOnCloseUp;
    property OnDropDown: TNotifyEvent read FOnDropDown write FOnDropDown;
  end;


function MakeDisabledBitmap(ASource: TBitmap): TBitmap;
const
  ROP_DSPDxax: DWORD = $00E20746;
  OUTLINE_COLOR: TColor = clBlack;
  BACK_COLOR: TColor = clBtnFace;
  HIGHLIGHT_COLOR: TColor = clBtnHighlight;
  SHADOW_COLOR: TColor = clBtnShadow;
  DRAW_HIGHLIGHT: Boolean = True;
var
  AMonoBmp: TBitmap;
  ARect: TRect;
begin
  ARect := Rect(0, 0, ASource.Width, ASource.Height);
  Result := TBitmap.Create;
  try
    Result.Width := ASource.Width;
    Result.Height := ASource.Height;
    AMonoBmp := TBitmap.Create;
    try
      with AMonoBmp do
      begin
        Width := ASource.Width;
        Height := ASource.Height;
        Canvas.CopyRect(ARect, ASource.Canvas, ARect);
{$IFDEF DELPHI3}
        HandleType := bmDDB;
{$ENDIF}
        Canvas.Brush.Color := OUTLINE_COLOR;
        if Monochrome then
        begin
          Canvas.Font.Color := clWhite;
          Monochrome := False;
          Canvas.Brush.Color := clWhite;
        end;
        Monochrome := True;
      end;
      with Result.Canvas do
      begin
        Brush.Color := BACK_COLOR;
        FillRect(ARect);
        if DRAW_HIGHLIGHT then
        begin
          Brush.Color := HIGHLIGHT_COLOR;
          SetTextColor(Handle, clBlack);
          SetBkColor(Handle, clWhite);
          BitBlt(Handle, 1, 1, ARect.Right - ARect.Left, ARect.Bottom - ARect.Top,
            AMonoBmp.Canvas.Handle, 0, 0, ROP_DSPDxax);
        end;
        Brush.Color := SHADOW_COLOR;
        SetTextColor(Handle, clBlack);
        SetBkColor(Handle, clWhite);
        BitBlt(Handle, 0, 0, ARect.Right - ARect.Left, ARect.Bottom - ARect.Top,
          AMonoBmp.Canvas.Handle, 0, 0, ROP_DSPDxax);
      end;
    finally
      AMonoBmp.Free;
    end;
  except
    Result.Free;
    raise;
  end;
end;


{ TdxPopupBox }

constructor TdxPopupBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Style := lbOwnerDrawVariable;
  ControlStyle := ControlStyle - [csCaptureMouse];
end;

function TdxPopupBox.GetEdit: TdxZoomFactorComboEdit;
begin
  Result := TdxZoomFactorComboEdit(Owner)
end;

procedure TdxPopupBox.WMLButtonDown(var Msg: TWMLButtonDown);
var
  Index: Integer;
begin
  Index := ItemAtPos(SmallPointToPoint(Msg.Pos), True);
  if (Index > -1) and Edit.ItemEnabled[Index] then
    inherited;
end;

procedure TdxPopupBox.WMNCCalcSize(var message: TWMNCCalcSize);
begin
  InflateRect(TWMNCCalcSize(message).CalcSize_Params^.rgrc[0], -2, -2);
end;

procedure TdxPopupBox.WMNCPaint(var message: TMessage);
var
  R: TRect;
  DC: HDC;
begin
  GetWindowRect(Handle, R);
  OffsetRect(R, -R.Left, -R.Top);
  DC := GetWindowDC(Handle);
  DrawEdge(DC, R, EDGE_RAISED, BF_ADJUST or BF_RECT);
  ReleaseDC(Handle, DC);
end;

{$IFDEF DELPHI5}

procedure TdxPopupBox.WMContextMenu(var message: TWMContextMenu);
begin
  DefaultHandler(message);
end;
{$ENDIF}

procedure TdxPopupBox.WMRButtonUp(var message: TWMRButtonUp);
begin
  DefaultHandler(message);
end;

procedure TdxPopupBox.CMHintShow(var Message: TMessage);
begin
  message.Result := 1;
end;

procedure TdxPopupBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_BORDER or LBS_OWNERDRAWFIXED and not LBS_WANTKEYBOARDINPUT;
    ExStyle := WS_EX_TOOLWINDOW or WS_EX_TOPMOST;
    WindowClass.Style := CS_SAVEBITS;
  end;
end;

procedure TdxPopupBox.CreateWnd;
begin
  inherited CreateWnd;
  Windows.SetParent(Handle, 0);
  CallWindowProc(DefWndProc, Handle, WM_SETFOCUS, 0, 0);
  Items := Edit.Items;
end;

procedure TdxPopupBox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  Accept: Boolean;
  Pt: TPoint;
begin
  inherited MouseUp(Button, Shift, X, Y);
  if Button = mbLeft then
  begin
    Pt := Point(X, Y);
    Accept :=
      PtInRect(Rect(0, 0, Width, Height), Pt) and Edit.ItemEnabled[ItemAtPos(Pt, True)];
    Edit.CloseUp(Accept);
  end;
end;

procedure TdxPopupBox.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Index: Integer;
begin
  inherited MouseMove(Shift, X, Y);
  Index := ItemAtPos(Point(X, Y), True);
  if (Index > -1) and Edit.ItemEnabled[Index] then
    ItemIndex := Index;
end;

procedure TdxPopupBox.CNCommand(var Message: TWMCommand);
begin
  inherited;
  if (message.NotifyCode = CBN_SELCHANGE) and Edit.ItemEnabled[ItemIndex] then
  begin
    Edit.FLockChanges := True;
    try
      Edit.Text := Items[ItemIndex];
    finally
      Edit.FLockChanges := False;
    end;
  end;
end;

procedure TdxPopupBox.WndProc(var message: TMessage);
begin
  if (message.Msg = LB_SETCURSEL) and ((message.wParam = -1) or not Edit.ItemEnabled[message.wParam]) then
    Exit
  else
    inherited WndProc(message);
end;

function TdxPopupBox.GetTextColor(Index: Integer; State: TOwnerDrawState): TColor;
begin
  if Edit.ItemEnabled[Index] then
    if odSelected in State then
      Result := clHighlightText
    else
      Result := clWindowText
  else
    Result := clGrayText;
end;

procedure TdxPopupBox.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState);
const
  TextColor: array[Boolean] of TColor = (clWindowText, clHighlightText);
var
  bmp1, bmp2: TBitmap;
  SrcR, DstR: TRect;
  S: string;
begin
  Canvas.FillRect(Rect);
  SetBkMode(Canvas.Handle, Transparent);
  with Edit do
    if (Images <> nil) and (ImageIndexes[Index] > -1) then
      if ItemEnabled[Index] then
        Images.Draw(Canvas, Rect.Left + 1, Rect.Top + 1, ImageIndexes[Index])
      else
        if DisabledImages <> nil then
          DisabledImages.Draw(Canvas, Rect.Left + 1, Rect.Top + 1, ImageIndexes[Index])
        else
        begin
          Bmp1 := TBitmap.Create;
          try
            Images.GetBitmap(ImageIndexes[Index], Bmp1);
            Bmp2 := MakeDisabledBitmap(Bmp1);
            try
              SrcR := Bounds(0, 0, Bmp1.Width, Bmp1.Height);
              DstR := Bounds(Rect.Left + 1, Rect.Top + 1, Bmp1.Width, Bmp1.Height);
              Canvas.BrushCopy(DstR, Bmp1, SrcR, Bmp1.Canvas.Pixels[0, 0]);
            finally
              Bmp2.Free;
            end;
          finally
            Bmp1.Free;
          end;
        end;

  Canvas.Font.Color := GetTextColor(Index, State);
  if Edit.Images <> nil then
    Inc(Rect.Left, Edit.Images.Width + 5);

  S := Items[Index];
  DrawText(Canvas.Handle, PChar(S), Length(S), Rect,
    DT_LEFT or DT_VCENTER or DT_SINGLELINE or DT_NOPREFIX);
end;


type
  TdxComboEditStrings = class(TStringList)
  private
    FComboEdit: TdxZoomFactorComboEdit;
  protected
    procedure SetUpdateState(Updating: Boolean); override;
  public
    constructor Create(AComboEdit: TdxZoomFactorComboEdit);

    function Add(const S: string): Integer; override;
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    procedure Insert(Index: Integer; const S: string); override;
  end;

constructor TdxComboEditStrings.Create(AComboEdit: TdxZoomFactorComboEdit);
begin
  inherited Create;
  FComboEdit := AComboEdit;
end;

function TdxComboEditStrings.Add(const S: string): Integer;
var
  PopupItem: PPopupItem;
begin
  inherited Add(S);
  New(PopupItem);
  PopupItem^.ImageIndex := -1;
  PopupItem^.Enabled := True;
  Result := FComboEdit.FItemList.Add(PopupItem);
end;

procedure TdxComboEditStrings.Insert(Index: Integer; const S: string);
var
  PopupItem: PPopupItem;
begin
  inherited Insert(Index, S);
  New(PopupItem);
  PopupItem^.ImageIndex := -1;
  PopupItem^.Enabled := True;
  FComboEdit.FItemList.Insert(Index, PopupItem);
end;

procedure TdxComboEditStrings.Delete(Index: Integer);
begin
  Dispose(PPopupItem(FComboEdit.FItemList[Index]));
  FComboEdit.FItemList.Delete(Index);
  inherited Delete(Index);
end;

procedure TdxComboEditStrings.Clear;
var
  I: Integer;
begin
  with FComboEdit do
  begin
    for I := 0 to FItemList.Count - 1 do
      Dispose(PPopupItem(FItemList[I]));
    FItemList.Clear;
  end;
  inherited Clear;
end;

procedure TdxComboEditStrings.SetUpdateState(Updating: Boolean);
begin
  SendMessage(FComboEdit.Handle, WM_SETREDRAW, Ord(not Updating), 0);
  if not Updating then FComboEdit.Refresh;
end;


{ TdxZoomFactorComboEdit }

constructor TdxZoomFactorComboEdit.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  FBorderWidth := 2;
  FDropDownCount := 8;
  FItemIndex := -1;

  FDisabledImagesChangeLink := TChangeLink.Create;
  FImagesChangeLink := TChangeLink.Create;

  FItemList := TList.Create;
  FItems := TdxComboEditStrings.Create(Self);
  MakeZoomItems;

  FFlat := True;
  ControlStyle := ControlStyle - [csSetCaption, csFramed];
  Ctl3D := False;
  BorderStyle := Forms.bsNone;
  Parent := Owner as TWinControl;
  FButtonWidth := GetSystemMetrics(SM_CXVSCROLL);
  FMouseInPickButton := False;
  FMousePressed := False;

  FPopupBox := TdxPopupBox.Create(Self);
  FPopupBox.Parent := Self;
  FPopupBox.Visible := False;
  TdxPopupBox(FPopupBox).IntegralHeight := False;
end;

destructor TdxZoomFactorComboEdit.Destroy;
begin
  FItems.Clear;
  FItems.Free;
  FItemList.Clear;
  FItemList.Free;
  FDisabledImagesChangeLink.Free;
  FImagesChangeLink.Free;
  FPopupBox.Free;
  inherited Destroy;
end;

procedure TdxZoomFactorComboEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or WS_CLIPCHILDREN;
end;

procedure TdxZoomFactorComboEdit.DoEnter;
begin
  FSaveText := Text;
  inherited DoEnter;
end;

procedure TdxZoomFactorComboEdit.Change;
begin
  if FLockChanges then Exit;
  inherited Change;
end;

procedure TdxZoomFactorComboEdit.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if (Key = Char(VK_RETURN)) or (Key = Char(VK_ESCAPE)) then Key := #0;
end;

function TdxZoomFactorComboEdit.GetImageIndex(Index: Integer): Integer;
begin
  Result := PPopupItem(FItemList[Index])^.ImageIndex;
end;

procedure TdxZoomFactorComboEdit.SetImageIndex(Index: Integer; Value: Integer);
begin
  PPopupItem(FItemList[Index])^.ImageIndex := Value;
end;

function TdxZoomFactorComboEdit.GetItemEnabled(Index: Integer): Boolean;
begin
  Result := PPopupItem(FItemList[Index])^.Enabled;
end;

procedure TdxZoomFactorComboEdit.SetItemEnabled(Index: Integer; Value: Boolean);
begin
  PPopupItem(FItemList[Index])^.Enabled := Value;
end;

procedure TdxZoomFactorComboEdit.SetDisabledImages(Value: TImageList);
begin
  if DisabledImages <> nil then
    DisabledImages.UnRegisterChanges(FDisabledImagesChangeLink);
  FDisabledImages := Value;
  if Value <> nil then
  begin
    DisabledImages.RegisterChanges(FDisabledImagesChangeLink);
    Value.FreeNotification(Self);
  end;
end;

procedure TdxZoomFactorComboEdit.SetImages(Value: TImageList);
begin
  if Images <> nil then
    Images.UnRegisterChanges(FImagesChangeLink);
  FImages := Value;
  if Value <> nil then
  begin
    Images.RegisterChanges(FImagesChangeLink);
    Value.FreeNotification(Self);
    TdxPopupBox(FPopupBox).ItemHeight := FImages.Height + 2;
  end;
end;

procedure TdxZoomFactorComboEdit.MakeZoomItems;
begin
  with FItems do
  begin
    Add('500%');
    Add('200%');
    Add('150%');
    Add('100%');
    Add('75%');
    Add('50%');
    Add('25%');
    Add('10%');
    Add(sdxPageWidth);
    Add(sdxWholePage);
    Add(sdxTwoPages);
    Add(sdxFourPages);
    Add(sdxWidenToSourceWidth);
  end;
end;

procedure TdxZoomFactorComboEdit.SetFlat(Value: Boolean);
begin
  if (FFlat <> Value) then
  begin
    FFlat := Value;
    Ctl3D := not FFlat;
    if FFlat then
      BorderStyle := bsNone
    else
      BorderStyle := bsSingle;
  end;
end;

{$IFDEF DELPHI5}

procedure TdxZoomFactorComboEdit.WMContextMenu(var message: TWMContextMenu);
begin
  if DroppedDown then
    DefaultHandler(message)
  else
    inherited;
end;
{$ENDIF}

procedure TdxZoomFactorComboEdit.WMRButtonUp(var message: TWMRButtonUp);
begin
  if DroppedDown then
    DefaultHandler(message)
  else
    inherited;
end;

procedure TdxZoomFactorComboEdit.CloseUp(Accept: Boolean);
begin
  if FPopupBox.Visible then
  begin
    FDroppedDown := False;
    if (GetCapture <> 0) then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
    SetWindowPos(FPopupBox.Handle, 0, 0, 0, 0, 0,
      SWP_NOZORDER or SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);
    if Accept and (FPopupBox.ItemIndex <> -1) then
      Text := FPopupBox.Items.Strings[FPopupBox.ItemIndex];
    FPopupBox.Visible := False;

    if Assigned(FOnCloseUp) then FOnCloseUp(Self, Accept);
    if Accept then Click;

    Invalidate;
    InvalidateNC;
  end
  else
    InvalidateNC;
end;

procedure TdxZoomFactorComboEdit.SetItemIndex(Value: Integer);
begin
  if (Value < -1) then Value := -1;
  if (Value > Items.Count - 1) then Value := Items.Count - 1;
  if not (FItemIndex = Value) then
  begin
    FItemIndex := Value;
    if (FItemIndex > -1) then
      Text := Items[FItemIndex]
    else
      Text := '';
  end;
end;

procedure TdxZoomFactorComboEdit.SetItems(Value: TStrings);
begin
  FItems.Assign(Value);
end;

procedure TdxZoomFactorComboEdit.SetDroppedDown(Value: Boolean);
begin
  if (FDroppedDown <> Value) then
  begin
    FDroppedDown := Value;
    if DroppedDown then
      DropDown
    else
      CloseUp(False);
  end;
end;

procedure TdxZoomFactorComboEdit.SetDropDownCount(Value: Integer);
begin
  if (Value < 1) then Value := 1;
  if not (FDropDownCount = Value) then FDropDownCount := Value;
end;

procedure TdxZoomFactorComboEdit.DropDown;
var
  P: TPoint;
begin
  if Assigned(FPopupBox) and (not FPopupBox.Visible) then
  begin
    FDroppedDown := True;
    SelectAll;

    FPopupBox.Width := Width;
    FPopupBox.Height := DropDownCount * TdxPopupBox(FPopupBox).ItemHeight + 4;
    TdxPopupBox(FPopupBox).Color := Color;
    TdxPopupBox(FPopupBox).Font := Font;
    FPopupBox.ItemIndex := FPopupBox.Items.IndexOf(Text);

    P := Parent.ClientToScreen(Point(Left, Top));
    Inc(P.Y, Height);
    if ((P.Y + FPopupBox.Height) > Screen.Height) then
      if ((P.Y - FPopupBox.Height - Height) > 0) then
        Dec(P.Y, FPopupBox.Height + Height)
      else
        P.Y := 0;

    if (P.X < 0) then
      P.X := 0
    else if (P.X + FPopupBox.Width > Screen.Width) then
      P.X := Screen.Width - FPopupBox.Width;

    SetWindowPos(FPopupBox.Handle, HWND_TOP, P.X, P.Y, 0, 0,
      SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);
    FPopupBox.Visible := True;
    Invalidate;
    Windows.SetFocus(Handle);
    if Assigned(FOnDropDown) then FOnDropDown(Self);
  end;
end;

procedure TdxZoomFactorComboEdit.CMCancelMode(var message: TCMCancelMode);
begin
  if (message.Sender <> Self) and (message.Sender <> FPopupBox) then
    CloseUp(False);
end;

procedure DrawBorder(Control: TWinControl; AFlat: Boolean);
var
  DC: hDC;
  R: TRect;
  Pt: TPoint;
  InControl: Boolean;
  Color: COLORREF;
begin
  DC := GetWindowDC(Control.Handle);
  try
    GetWindowRect(Control.Handle, R);
    if not AFlat then
    begin
      OffsetRect(R, -R.Left, -R.Top);
      DrawEdge(DC, R, EDGE_SUNKEN, BF_RECT);
    end
    else
    begin
      GetCursorPos(Pt);
      InControl := PtInRect(R, Pt);
      OffsetRect(R, -R.Left, -R.Top);
      if ((csDesigning in Control.ComponentState) and Control.Enabled) or
        (not (csDesigning in Control.ComponentState) and (Control.Focused or
        (GetParentForm(Control).Active and InControl))) then
      begin
        DrawEdge(DC, R, BDR_SUNKENOUTER, BF_RECT or BF_ADJUST);
        FrameRect(DC, R, GetSysColorBrush(COLOR_BTNFACE));
      end
      else
      begin
        FrameRect(DC, R, GetSysColorBrush(COLOR_BTNFACE));
        InflateRect(R, -1, -1);
        if Control.Enabled then
          Color := COLOR_WINDOW
        else
          Color := COLOR_BTNHIGHLIGHT;
        FrameRect(DC, R, GetSysColorBrush(Color));
      end;
    end;
  finally
    ReleaseDC(Control.Handle, DC);
  end;
end;

procedure TdxZoomFactorComboEdit.WndProc(var message: TMessage);

  procedure ProcessDropDownKeys(var Key: Word; Shift: TShiftState);
  begin
    if (((Key = VK_UP) or (Key = VK_DOWN)) and (ssAlt in Shift)) or
      ((Key = VK_F4) and not (ssAlt in Shift)) then
    begin
      if DroppedDown then
        CloseUp(False)
      else
        DropDown;
      Key := 0;
    end;

    if (Key = VK_RETURN) and not (ssAlt in Shift) and DroppedDown then
    begin
      CloseUp(True);
      Key := 0;
    end;

    if (Key = VK_ESCAPE) and not (ssAlt in Shift) then
    begin
      if DroppedDown then
        CloseUp(False)
      else
        Text := FSaveText;
      Key := 0;
    end;
  end;

begin
  case message.Msg of
    WM_KEYDOWN,
      WM_SYSKEYDOWN,
      WM_CHAR:
      with TWMKey(message) do
      begin
        ProcessDropDownKeys(CharCode, KeyDataToShiftState(KeyData));
        if CharCode = 0 then Exit;
        if ((CharCode = VK_UP) or (CharCode = VK_DOWN)) and FPopupBox.Visible then
        begin
          with TMessage(message) do
            SendMessage(FPopupBox.Handle, Msg, wParam, lParam);
          Exit;
        end;
      end;

    CM_ENABLEDCHANGED,
      CM_MOUSEENTER,
      CM_MOUSELEAVE,
      WM_SETFOCUS,
      WM_KILLFOCUS:
      if Flat then DrawBorder(Self, Flat);
  end;
  inherited WndProc(message)
end;

procedure TdxZoomFactorComboEdit.WMNCCalcSize(var message: TWMNCCalcSize);
begin
  with TWMNCCalcSize(message).CalcSize_Params^ do
  begin
    InflateRect(rgrc[0], -FBorderWidth, -FBorderWidth);
    Dec(rgrc[0].Right, FButtonWidth);
  end;
end;

procedure TdxZoomFactorComboEdit.WMNCPaint(var message: TMessage);
begin
  DrawBorder(Self, Flat);
  DrawButton;
end;

procedure TdxZoomFactorComboEdit.WMCaptureChanged(var message: TMessage);
begin
  inherited;
  FMousePressed := False;
end;

procedure TdxZoomFactorComboEdit.WMKillFocus(var message: TMessage);
begin
  inherited;
  FMousePressed := False;
  CloseUp(False);
end;

procedure TdxZoomFactorComboEdit.CMEnabledChanged(var message: TWMNoParams);
begin
  inherited;
  if Enabled then
    Color := FSaveColor
  else
  begin
    FSaveColor := Color;
    Color := clBtnFace;
  end;
  InvalidateNC;
end;

procedure TdxZoomFactorComboEdit.CMHintShow(var message: TCMHintShow);
begin
  message.Result := Integer(DroppedDown);
end;

function TdxZoomFactorComboEdit.GetMouseInPickButton(const Pt: TPoint): Boolean;
begin
  Result := PtInRect(Rect(Width - FButtonWidth - 2, 3 - Byte(not Flat),
    Width - 3 + Byte(not Flat), Height - 3 + Byte(not Flat)), Pt);
end;

procedure TdxZoomFactorComboEdit.WMMouseMove(var message: TWMMouseMove);
begin
  inherited;
  if not FMouseInPickButton then
    Perform(WM_NCLBUTTONUP, 0, TMessage(message).LPARAM);
end;

procedure TdxZoomFactorComboEdit.WMNCHitTest(var message: TWMNCHitTest);
var
  R: TRect;
begin
  inherited;
  Windows.GetWindowRect(Handle, R);
  FMouseInPickButton := GetMouseInPickButton(Point(message.Pos.X - R.Left, message.Pos.Y - R.Top));
  if FMouseInPickButton then
    message.Result := HTBORDER
  else
    Perform(WM_NCLBUTTONUP, 0, TMessage(message).lParam);
end;

procedure TdxZoomFactorComboEdit.WMNCLButtonDown(var message: TWMNCLButtonDown);
begin
  inherited;
  if FMouseInPickButton then
  begin
    FMousePressed := True;
    InvalidateNC;
    if FMouseInPickButton then DroppedDown := not FPopupBox.Visible;
  end;
end;

procedure TdxZoomFactorComboEdit.WMNCLButtonUp(var message: TWMNCLButtonDown);
begin
  inherited;
  if FMousePressed then
  begin
    FMousePressed := False;
    InvalidateNC;
  end;
end;

procedure TdxZoomFactorComboEdit.InvalidateNC;
begin
  SetWindowPos(Handle, 0, 0, 0, 0, 0,
    SWP_FRAMECHANGED or SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER);
end;

procedure TdxZoomFactorComboEdit.DrawButton;
const
  Pusheds: array[Boolean] of UINT = (0, DFCS_PUSHED);
  Activities: array[Boolean] of UINT = (DFCS_INACTIVE, 0);
  FlatStyles: array[Boolean] of UINT = (BDR_RAISEDOUTER, BDR_SUNKENINNER);
  InnerEdge: array[Boolean] of UINT = (BDR_RAISEDINNER, 0);
  OuterEdge: array[Boolean] of UINT = (0, BDR_SUNKENOUTER);
var
  DC: HDC;
  R: TRect;
  Downed: Boolean;
  Edge: UINT;
begin
  DC := GetWindowDC(Handle);
  try
    R := BoundsRect;
    OffsetRect(R, -R.Left, -R.Top);
    InflateRect(R, -FBorderWidth, -FBorderWidth);
    R.Left := R.Right - FButtonWidth;
    Downed := (FMousePressed and FMouseInPickButton) or FDroppedDown;
    DrawFrameControl(DC, R, DFC_SCROLL,
      DFCS_FLAT or DFCS_SCROLLCOMBOBOX or Pusheds[Downed] or Activities[Enabled]);
    Edge := OuterEdge[Downed] or InnerEdge[Downed];
    if not Flat then
      Edge := Edge or FlatStyles[Downed];
    DrawEdge(DC, R, Edge, BF_RECT);
    with R do
      ExcludeClipRect(DC, Left, Top, Right, Bottom);
  finally
    ReleaseDC(Handle, DC);
  end;
end;


{ utility routines }

function StrPercentSign(const S: string): string;
begin
  if S[Length(S)] <> '%' then
    Result := S + '%'
  else
    Result := S;
end;


{ TdxfmStdPreview }

procedure TdxfmStdPreview.AfterConstruction;
begin
  FFlatCtrls := True;
  FLargeBtns := False;
  inherited AfterConstruction;
  ToolBar.HandleNeeded;
  ToolBar.Realign;
end;

procedure TdxfmStdPreview.CreateControls;
begin
  inherited CreateControls;

  FcbxPredefinedZoom := TdxZoomFactorComboEdit.Create(pnlZoomCbx);
  with TdxZoomFactorComboEdit(FcbxPredefinedZoom) do
  begin
    Width := pnlZoomCbx.Width - TdxZoomFactorComboEdit(FcbxPredefinedZoom).Left;
    DropDownCount := PredefinedZooms.Count;
    OnClick := cbxPredefinedZoomClick;
    OnCloseUp := cbxPredefinedZoomCloseUp;
    OnExit := cbxPredefinedZoomExit;
    OnKeyDown := cbxPredefinedZoomKeyDown;
  end;

  FseActivePage := TdxPSSpinEdit.Create(Self);
  with TdxPSSpinEdit(FseActivePage) do
  begin
    FseActivePage.Parent := pnlCurrentPage;
    Width := pnlCurrentPage.Width - TdxPSSpinEdit(FseActivePage).Left;
    //MaxValue := Preview.PageCount;
    Value := 1;
    OnKeyPress := seKeyPress;
    OnButtonClick := seActivePageButtonClick;
    OnExit := seActivePageExit;
  end;

  ToolBarImages[0, False] := ilToolBarSmall;
  ToolBarImages[0, True] := ilToolBarLarge;
  ToolBarImages[1, False] := ilToolBarSmallDisabled;
  ToolBarImages[1, True] := ilToolBarLargeDisabled;
  ArrangeToolBarCtrls;
  AssignToolBarImages;
  SetupFlatCtrls;

  Preview.PopupMenu := pmPreview;

{$IFDEF DELPHI4}
  pmToolBar.OwnerDraw := True;
  pmToolBar.Images := ilToolBarSmall;

  pmPrintStyles.OwnerDraw := True;
  pmPrintStyles.Images := ilToolBarSmall;
  
  Menu.Images := ilToolBarSmall;
  pmPreview.Images := ilToolBarSmall;

  //miFileExit.ImageIndex := 17;

  miFileDesign.ImageIndex := 0;
  miFilePrint.ImageIndex := 2;
  miFilePageSetup.ImageIndex := 3;
  miFormatPageBackground.ImageIndex := 4;
  miFormatShrinkToPageWidth.ImageIndex := 12;

  miZoomPercent100.ImageIndex := 5;
  miZoomPageWidth.ImageIndex := 6;
  miZoomWholePage.ImageIndex := 7;
  miZoomTwoPages.ImageIndex := 8;
  miZoomFourPages.ImageIndex := 9;
  miZoomWidenToSourceWidth.ImageIndex := 11;

  miGoToFirstPage.ImageIndex := 13;
  miGoToPrevPage.ImageIndex := 14;
  miGoToNextPage.ImageIndex := 15;
  miGoToLastPage.ImageIndex := 16;
  miHelpTopics.ImageIndex := 17;
  miHelpTopics.ImageIndex := 17;

  pmiReportDesign.ImageIndex := 0;
  pmiPageSetup.ImageIndex := 3;
  pmiReportShrinkToPageWidth.ImageIndex := 12;

  pmiZoomPercent100.ImageIndex := 5;
  pmiZoomPageWidth.ImageIndex := 6;
  pmiZoomWholePage.ImageIndex := 7;
  pmiZoomTwoPages.ImageIndex := 8;
  pmiZoomFourPages.ImageIndex := 9;
  pmiZoomWidenToSourceWidth.ImageIndex := 11;

  pmiGoToFirstPage.ImageIndex := 13;
  pmiGoToPrevPage.ImageIndex := 14;
  pmiGoToNextPage.ImageIndex := 15;
  pmiGoToLastPage.ImageIndex := 16;
{$ENDIF}
end;

procedure TdxfmStdPreview.LoadStrings;

  procedure SetHint(AButton: TControl; const AHint: string);
  var
    S: string;
  begin
    S := AButton.Hint;
    AButton.Hint := AHint;
    if Length(S) > 0 then
      AButton.Hint := AButton.Hint + ' (' + S + ')';
  end;

begin
  inherited LoadStrings;
  { menus }
  miFile.Caption := sdxMenuFile;
  miFileDesign.Caption := sdxMenuFileDesign;
  miFilePrint.Caption := sdxMenuFilePrint;
  miFilePageSetup.Caption := sdxMenuFilePageSetup;
  miFilePrintStyles.Caption := sdxMenuPrintStyles;
  pmiFilePrintStyles.Caption := sdxMenuPrintStyles;
  
  miFilePreferences.Caption := sdxMenuToolsOptions;
  miFileExit.Caption := sdxMenuFileExit;

  miEdit.Caption := sdxMenuEdit;
  miEditFind.Caption := sdxMenuEditFind;
  miEditFindNext.Caption := sdxMenuEditFindNext;
  miEditReplace.Caption := sdxMenuEditReplace;

  miView.Caption := sdxMenuView;
  miViewMargins.Caption := sdxMenuViewMargins;
  miViewLargeTBtns.Caption := sdxMenuViewLargeToolBarButtons;
  miViewFlatTBtns.Caption := sdxMenuViewFlatToolBarButtons;
  miViewMarginBar.Caption := sdxMenuViewMarginsStatusBar;
  miViewStatusBar.Caption := sdxMenuViewPagesStatusBar;

  miViewZoom.Caption := sdxMenuZoom;
  miZoomPercent100.Caption := sdxMenuZoomPercent100;
  miZoomPageWidth.Caption := sdxMenuZoomPageWidth;
  miZoomWholePage.Caption := sdxMenuZoomWholePage;
  miZoomTwoPages.Caption := sdxMenuZoomTwoPages;
  miZoomFourPages.Caption := sdxMenuZoomFourPages;
  miZoomWidenToSourceWidth.Caption := sdxMenuZoomWidenToSourceWidth;
  miZoomSetup.Caption := sdxMenuZoomSetup;
  miViewPageHeaders.Caption := sdxMenuViewPagesHeaders;
  miViewPageFooters.Caption := sdxMenuViewPagesFooters;
  {
  miViewSwitchToLeftPart.Caption := sdxMenuViewSwitchToLeftPart;
  miViewSwitchToRightPart.Caption := sdxMenuViewSwitchToRightPart;
  miViewSwitchToCenterPart.Caption := sdxMenuViewSwitchToCenterPart;
  miViewHFSwitchHeaderFooter.Caption := sdxMenuViewHFSwitchHeaderFooter;
  miViewHFClose.Caption := sdxMenuViewHFClose;
  }

  miFormat.Caption := sdxMenuFormat;
//  miFormatHeaderAndFooter.Caption := sdxMenuFormatHeaderAndFooter;
  miFormatShowHideEmptyPages.Caption := sdxMenuShowEmptyPages;
  miFormatDateTime.Caption := sdxMenuFormatDateTime;
  miFormatPageNumbering.Caption := sdxMenuFormatPageNumbering;
  miFormatPageBackground.Caption := sdxMenuFormatPageBackground;
  miFormatShrinkToPageWidth.Caption := sdxMenuFormatShrinkToPage;

  miGotoPage.Caption := sdxMenuGotoPage;
  miGotoFirstPage.Caption := sdxMenuGotoPageFirst;
  miGotoPrevPage.Caption := sdxMenuGotoPagePrev;
  miGotoNextPage.Caption := sdxMenuGotoPageNext;
  miGotoLastPage.Caption := sdxMenuGotoPageLast;

  miHelp.Caption := sdxMenuHelp;
  miHelpTopics.Caption := sdxMenuHelpTopics;
  miHelpAbout.Caption := sdxMenuHelpAbout;

  pmiReportDesign.Caption := sdxMenuFileDesign;
  pmiPageSetup.Caption := sdxMenuFilePageSetup;
  pmiReportShrinkToPageWidth.Caption := sdxMenuFormatShrinkToPage;
  pmiZoom.Caption := sdxMenuZoom;
  pmiZoomPercent100.Caption := sdxMenuZoomPercent100;
  pmiZoomPageWidth.Caption := sdxMenuZoomPageWidth;
  pmiZoomWholePage.Caption := sdxMenuZoomWholePage;
  pmiZoomTwoPages.Caption := sdxMenuZoomTwoPages;
  pmiZoomFourPages.Caption := sdxMenuZoomFourPages;
  pmiZoomWidenToSourceWidth.Caption := sdxMenuZoomWidenToSourceWidth;

  pmiGotoFirstPage.Caption := sdxMenuGotoPageFirst;
  pmiGotoPrevPage.Caption := sdxMenuGotoPagePrev;
  pmiGotoNextPage.Caption := sdxMenuGotoPageNext;
  pmiGotoLastPage.Caption := sdxMenuGotoPageLast;

  { popup menus }
  pmiFlatBtns.Caption := sdxMenuViewFlatToolBarButtons;
  pmiLargeBtns.Caption := sdxMenuViewLargeToolBarButtons;

  { toolbar hints }
  SetHint(tbReportDesigner, sdxHintFileDesign);
  tbPrint.Hint := sdxHintFilePrint + GetCurrentPrinterAsHint;

  SetHint(tbPrintDialog, sdxHintFilePrintDialog);
  SetHint(tbPageSetup, sdxHintFilePageSetup);
  SetHint(tbPageBackground, sdxHintFormatPageBackground);
  SetHint(tbShrinkToPageWidth, sdxHintFormatShrinkToPage);

  SetHint(FcbxPredefinedZoom, sdxHintViewZoom);
  SetHint(tbPercent100, sdxHintZoomPercent100);
  SetHint(tbPageWidth, sdxHintZoomPageWidth);
  SetHint(tbOnePage, sdxHintZoomWholePage);
  SetHint(tbTwoPage, sdxHintZoomTwoPages);
  SetHint(tbFourPage, sdxHintZoomFourPages);
  SetHint(tbMultiplePages, sdxHintZoomMultiplyPages);
  SetHint(tbWidenToSourceWidth, sdxHintZoomWidenToSourceWidth);
  SetHint(tbGotoFirstPage, sdxHintGotoPageFirst);

  SetHint(tbGotoFirstPage, sdxHintGotoPageFirst);
  SetHint(tbGotoPrevPage, sdxHintGotoPagePrev);
  SetHint(tbGotoNextPage, sdxHintGotoPageNext);
  SetHint(tbGotoLastPage, sdxHintGotoPageLast);
  SetHint(FseActivePage, sdxHintActivePage);

  SetHint(tbHelp, sdxHintHelpTopics);
  SetHint(tbClose, sdxHintFileExit);
end;

procedure TdxfmStdPreview.StyleListChanged(Sender: TObject);
begin
  with ComponentPrinter.CurrentLink do
    if Sender = StyleManager then 
    begin
      BuildPageSetupMenu(pmPrintStyles.Items, nil, True);     
      BuildPageSetupMenu(miFilePrintStyles, nil, True);
      BuildPageSetupMenu(pmiFilePrintStyles, nil, True);
    end;  
end;

procedure TdxfmStdPreview.InitContent;
begin
  inherited InitContent;
  if ComponentPrinter <> nil then
    TdxPSSpinEdit(FseActivePage).MaxValue := ComponentPrinter.CurrentLink.PageCount;
  FcbxPredefinedZoom.Text := IntToStr(ZoomFactor) + '%';
end;

function TdxfmStdPreview.CalcWindowPos(Sender: TObject): TPoint;
var
  R: TRect;
begin
  if Sender is TToolButton then
  begin
    R := TToolButton(Sender).BoundsRect;
    MapWindowPoints(ToolBar.Handle, 0, R, 2);
    Result.X := R.Left;
    Result.Y := R.Bottom;
  end
  else
    Result := Preview.ClientOrigin;
end;

procedure TdxfmStdPreview.CheckItem(AParent: TMenuItem);
var
  Style: TBasedxPrintStyle;
  I: Integer;
  Item: TMenuItem;
begin
  if CanPrintStyle then 
  begin
    Style := ComponentPrinter.CurrentLink.StyleManager.CurrentStyle;
    for I := 0 to AParent.Count - 1 do 
    begin
      Item := AParent[I];
      if Item.Tag = Integer(Style) then 
      begin
        Item.Checked := True;
        Exit;
      end;
    end;  
  end;  
end;

procedure TdxfmStdPreview.DoAfterPrintReport(AShowDialog: Boolean);
begin
  if AShowDialog then
    tbPrint.Hint := sdxHintFilePrint + GetCurrentPrinterAsHint;
end;

procedure TdxfmStdPreview.DoPreviewZoomFactorChanged(APreview: TdxPreview);
begin
  FcbxPredefinedZoom.Text := StrPercentSign(IntToStr(ZoomFactor));
  //FPreview.ZoomMode := pzmNone;
end;

procedure TdxfmStdPreview.DoPreviewZoomModeChanged(APreview: TdxPreview);
begin
  FcbxPredefinedZoom.Text := StrPercentSign(IntToStr(ZoomFactor));
end;

procedure TdxfmStdPreview.SetFlatCtrls(Value: Boolean);
begin
  if FFlatCtrls <> Value then
  begin
    FFlatCtrls := Value;
    SetupFlatCtrls;
    if not Locked then UpdateControls;
  end;
end;

procedure TdxfmStdPreview.SetLargeBtns(Value: Boolean);
begin
  if FLargeBtns <> Value then
  begin
    FLargeBtns := Value;
    AssignToolBarImages;
    ArrangeToolBarCtrls;
    if not Locked then UpdateControls;
  end;
end;

procedure TdxfmStdPreview.AssignToolBarImages;
var
  I: Integer;
begin
  with ToolBar do
  begin
    Images := ToolBarImages[0, FLargeBtns];
    DisabledImages := ToolBarImages[1, FLargeBtns];
  end;
  with TdxZoomFactorComboEdit(FcbxPredefinedZoom) do
  begin
    Images := ToolBarImages[0, FLargeBtns];
    DisabledImages := ToolBarImages[1, FLargeBtns];
    for I := 0 to Items.Count - 1 do
      ImageIndexes[I] := ItemIndexes[I];
  end;
end;

procedure TdxfmStdPreview.ArrangeToolBarCtrls;
const
  Widths: array[Boolean] of Integer = (140, 160);
begin
  with ToolBar do
  begin
    Height := ToolBarHeight[FLargeBtns];
    ButtonWidth := ToolBtnSize[FLargeBtns].cx;
    ButtonHeight := ToolBtnSize[FLargeBtns].cy;
  end;
  pnlZoomCbx.Width := Widths[LargeBtns];
  TdxZoomFactorComboEdit(FcbxPredefinedZoom).Width := pnlZoomCbx.Width;
  TdxZoomFactorComboEdit(FcbxPredefinedZoom).Perform(CM_RECREATEWND, 0, 0);
end;

procedure TdxfmStdPreview.SetupFlatCtrls;

  procedure SetSub(AControl: TControl);
  var
    I: Integer;
  begin
    if AControl is TWinControl then
      with TWinControl(AControl) do
        if ControlCount > 0 then
          for I := 0 to ControlCount - 1 do
          begin
            SetProperty(Controls[I], 'Flat', FFlatCtrls);
            SetSub(Controls[I]);
          end;
  end;

begin
  ToolBar.Flat := FFlatCtrls;
  SetSub(ToolBar);
end;

procedure TdxfmStdPreview.WMInitMenu(var Message: TWMInitMenu);
begin
  inherited;
  CheckItem(miFilePrintStyles);
end;

procedure TdxfmStdPreview.miViewMarginsClick(Sender: TObject);
begin
  if Locked then Exit;
  ShowPageMargins := not ShowPageMargins;
end;

procedure TdxfmStdPreview.pmiFlatBtnsClick(Sender: TObject);
begin
  if Locked then Exit;
  FlatCtrls := not FlatCtrls;
end;

procedure TdxfmStdPreview.pmiLargeBtnsClick(Sender: TObject);
begin
  if Locked then Exit;
  LargeBtns := not LargeBtns;
  if Assigned(Preview) then Preview.Invalidate;
end;

procedure TdxfmStdPreview.miViewMarginBarClick(Sender: TObject);
begin
  if Locked then Exit;
  ShowMarginBar := not ShowMarginBar;
end;

procedure TdxfmStdPreview.miViewStatusBarClick(Sender: TObject);
begin
  if Locked then Exit;
  ShowStatusBar := not ShowStatusBar;
end;

procedure TdxfmStdPreview.DesignClick(Sender: TObject);
begin
  tbReportDesigner.Down := True;
  try
    DoDesignReport;
  finally
    tbReportDesigner.Down := False;
  end;
end;

procedure TdxfmStdPreview.PageBackgroundClick(Sender: TObject);
begin
  tbPageBackground.Down := True;
  try
    DoShowPageBackgroundDlg(CalcWindowPos(Sender));
  finally
    tbPageBackground.Down := False;
  end;
end;

procedure TdxfmStdPreview.pnlZoomCbxResize(Sender: TObject);
begin
  with TPanel(Sender) do
    FcbxPredefinedZoom.Top := (Height - FcbxPredefinedZoom.Height) div 2;
end;

procedure TdxfmStdPreview.pnlCurrentPageResize(Sender: TObject);
begin
  with TPanel(Sender) do
    FseActivePage.Top := (Height - FseActivePage.Height) div 2;
end;

procedure TdxfmStdPreview.PrintClick(Sender: TObject);
const
  BtnClicked: Boolean = False;
begin
  if BtnClicked then Exit;
  BtnClicked := True;
  try
    tbPrintDialog.Down := True;
    try
      DoPrintReport(Boolean(TComponent(Sender).Tag));
    finally
      tbPrintDialog.Down := False;
    end;
  finally
    BtnClicked := False;
  end;
end;

procedure TdxfmStdPreview.PageSetupClick(Sender: TObject);
const
  BtnClicked: Boolean = False;
begin
  if BtnClicked then Exit;
  BtnClicked := True;
  try
    tbPageSetup.Down := True;
    try
      DoPageSetupReport(0);
    finally
      tbPageSetup.Down := False;
    end;
  finally
    BtnClicked := False;
  end;
end;

procedure TdxfmStdPreview.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if (Key = Ord('Z')) and (ssAlt in Shift) and FcbxPredefinedZoom.CanFocus then
    ActiveControl := FcbxPredefinedZoom;
  if (Key = Ord('A')) and (ssAlt in Shift) and FseActivePage.CanFocus then
    ActiveControl := FseActivePage;
end;

procedure TdxfmStdPreview.ZoomClick(Sender: TObject);
var
  PageXCount, PageYCount: Integer;
  ZoomMode: TdxPreviewZoomMode;
begin
  case TComponent(Sender).Tag of
    0: ZoomMode := pzmNone;
    1: ZoomMode := pzmPageWidth;
  else
    ZoomMode := pzmPages;
  end;
  PageXCount := 1;
  PageYCount := 1;
  if ZoomMode = pzmPages then
    case TComponent(Sender).Tag of
      3: PageXCount := 2;
      4: begin
          PageXCount := 2;
          PageYCount := 2;
        end;
      5: ComponentPrinter.CurrentLink.GetPageColRowCount(PageXCount, PageYCount);
    end;
  DoSetupZoomFactor(100, PageXCount, PageYCount, ZoomMode);
end;

procedure TdxfmStdPreview.ShrinkToPageWidthClick(Sender: TObject);
begin
  if Locked then Exit;
  if ComponentPrinter <> nil then
    with ComponentPrinter.CurrentLink do
    begin
      ShrinkToPageWidth := not ShrinkToPageWidth;
      DoShrinkToPageWidth(ShrinkToPageWidth);
    end;
end;

procedure TdxfmStdPreview.miFormatShowHideEmptyPagesClick(Sender: TObject);
begin
  if Locked then Exit;
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  DoShowEmptyPages(TMenuItem(Sender).Checked);
end;

procedure TdxfmStdPreview.miZoomSetupClick(Sender: TObject);
begin
  DoShowZoomDlg;
end;

procedure TdxfmStdPreview.tbMultiplePagesClick(Sender: TObject);
var
  Origin: TPoint;
  YShift: Integer;
begin
  Origin := TToolButton(Sender).ClientOrigin;
  YShift := TToolButton(Sender).Height;

  tbMultiplePages.Down := True;
  try
    DoShowMultiplySelectPagesDlg(ilStub, 1, Origin, YShift);
  finally
    tbMultiplePages.Down := False;
  end;
end;

procedure TdxfmStdPreview.GoToPageClick(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    0: GoToFirstPage;
    1: GoToPrevPage;
    2: GoToNextPage;
    3: GoToLastPage;
  end;
end;

procedure TdxfmStdPreview.CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TdxfmStdPreview.HelpClick(Sender: TObject);
begin
  DoInvokeHelp;
end;

procedure TdxfmStdPreview.UpdateControls;
const
  ButtonStyles: array[Boolean] of TToolButtonStyle = (tbsButton, tbsDropDown);
var
  APagesExists: Boolean;
  PrevStyle: TToolButtonStyle;
begin
  if Locked then Exit;
  inherited UpdateControls;
  APagesExists := (FPreview.PageCount > 0);
  BeginUpdate;
  try
    {toolbar enabled}
    tbReportDesigner.Enabled := CanDesign;
    tbPrint.Enabled := CanPrint;
    tbPrintDialog.Enabled := CanPrintDialog;
    tbPageSetup.Enabled := CanPageSetup;
    PrevStyle := tbPageSetup.Style;
    tbPageSetup.Style := ButtonStyles[CanPrintStyle];
    if PrevStyle <> tbPageSetup.Style then 
      if tbPageSetup.Style = tbsButton then 
      begin
        tbPageSetup.Width := ToolBtnSize[LargeBtns].cx;
        SendMessage(ToolBar.Handle, CM_RECREATEWND, 0, 0);
        tbPageSetup.DropdownMenu := nil;
      end
      else
        tbPageSetup.DropdownMenu := pmPrintStyles;
      
    tbClose.Enabled := not IsPrinting;

    tbPageBackground.Enabled := IsEnabled(peoPageBackground) and not IsPrinting;
    tbShrinkToPageWidth.Enabled := APagesExists and not IsPrinting;

    tbPercent100.Enabled := APagesExists;
    tbPageWidth.Enabled := APagesExists;
    tbOnePage.Enabled := APagesExists;
    tbTwoPage.Enabled := (Preview.PageCount > 1);
    tbFourPage.Enabled := (Preview.PageCount > 3);
    tbMultiplePages.Enabled := APagesExists;
    tbWidenToSourceWidth.Enabled := APagesExists and not IsPrinting;
    if ComponentPrinter <> nil then
      tbShrinkToPageWidth.Down := ComponentPrinter.CurrentLink.ShrinkToPageWidth;

    with TdxZoomFactorComboEdit(FcbxPredefinedZoom) do
    begin
      Enabled := APagesExists;
      ItemEnabled[Items.Count - 3] := (Preview.PageCount > 1);
      ItemEnabled[Items.Count - 2] := (Preview.PageCount > 3);
    end;

    tbGoToFirstPage.Enabled := APagesExists and not (Preview.SelPageIndex = 0);
    tbGoToPrevPage.Enabled := APagesExists and not (Preview.SelPageIndex = 0);
    tbGoToNextPage.Enabled := APagesExists and not (Preview.SelPageIndex = Preview.PageCount - 1);
    tbGoToLastPage.Enabled := APagesExists and not (Preview.SelPageIndex = Preview.PageCount - 1);
    FseActivePage.Enabled := (Preview.PageCount > 1);

    tbHelp.Enabled := IsEnabled(peoHelp);

    { menus enabled}
    miFileDesign.Enabled := tbReportDesigner.Enabled;
    miFilePrint.Enabled := tbPrint.Enabled;
    miFilePageSetup.Enabled := tbPageSetup.Enabled;
    miFilePrintStyles.Enabled := tbPageSetup.Enabled;
    miFilePreferences.Enabled := IsEnabled(peoPreferences);
    miFileExit.Enabled := tbClose.Enabled;

    if miFileDesign.Enabled and (ComponentPrinter <> nil) then
      miFileDesign.Enabled :=
        IsEnabled(peoReportDesign) and APagesExists and ComponentPrinter.CurrentLink.CheckToDesign;

    miFormatPageBackground.Enabled := tbPageBackground.Enabled;
    miFormatShowHideEmptyPages.Enabled := APagesExists and not IsBuilding and not IsPrinting;
    if (ComponentPrinter <> nil) then
    begin
      miFormatShowHideEmptyPages.Visible := ComponentPrinter.CurrentLink.EmptyPagesCanExist;
      miFormatShowHideEmptyPages.Checked := ComponentPrinter.CurrentLink.ShowEmptyPages;
    end;
    miFormatShrinkToPageWidth.Enabled := tbShrinkToPageWidth.Enabled;
    miFormatShrinkToPageWidth.Checked := tbShrinkToPageWidth.Down;

    miViewMargins.Checked := ShowPageMargins;
    miViewStatusBar.Checked := ShowStatusBar;
    miViewMarginBar.Checked := ShowMarginBar;
    miViewPageHeaders.Enabled := APagesExists and not IsBuilding and not IsPrinting;
    miViewPageFooters.Enabled := APagesExists and not IsBuilding and not IsPrinting;
    if (ComponentPrinter <> nil) then
    begin
      miViewPageHeaders.Checked := ComponentPrinter.CurrentLink.ShowPageHeader;
      miViewPageFooters.Checked := ComponentPrinter.CurrentLink.ShowPageFooter;
    end;

    miViewZoom.Enabled := APagesExists;
    if miViewZoom.Enabled then
    begin
      miZoomPageWidth.Enabled := tbPageWidth.Enabled;
      miZoomPercent100.Enabled := tbPercent100.Enabled;
      miZoomWholePage.Enabled := tbOnePage.Enabled;
      miZoomTwoPages.Enabled := tbTwoPage.Enabled;
      miZoomFourPages.Enabled := tbFourPage.Enabled;
      miZoomWidenToSourceWidth.Enabled := tbWidenToSourceWidth.Enabled;
    end;

    miGoToPage.Enabled := APagesExists;
    miGotoFirstPage.Enabled := tbGotoFirstPage.Enabled;
    miGotoPrevPage.Enabled := tbGotoPrevPage.Enabled;
    miGotoNextPage.Enabled := tbGotoNextPage.Enabled;
    miGotoLastPage.Enabled := tbGotoLastPage.Enabled;

    miHelp.Enabled := tbHelp.Enabled;

    if ToolBar.Visible then
    begin
      tbReportDesigner.Visible := IsVisible(pvoReportDesign);
      tbSeparator1.Visible := tbReportDesigner.Visible;

      tbPrint.Visible := IsVisible(pvoPrint);
      tbPrintDialog.Visible := IsVisible(pvoPrint);
      tbPageSetup.Visible := IsVisible(pvoPageSetup);
      tbSeparator2.Visible := (IsVisible(pvoPrint) or IsVisible(pvoPageSetup));

      tbPageBackground.Visible := IsVisible(pvoPageBackground);
      tbSeparator3.Visible := IsVisible(pvoPageBackground);

      tbHelp.Visible := IsVisible(pvoHelp);
      //tbSeparator8.Visible := tbHelp.Visible;
    end;

    { menus visibility }
    miFilePreferences.Visible := IsVisible(pvoPreferences);
    miLine1.Visible := miFilePreferences.Visible;

    miFileDesign.Visible := IsVisible(pvoReportDesign);
    miLine2.Visible := miFileDesign.Visible;
    miFilePrint.Visible := tbPrint.Visible;
    miFilePageSetup.Visible := tbPageSetup.Visible;
    miFilePrintStyles.Visible := CanPrintStyle;
    miFormatPageBackground.Visible := tbPageBackground.Visible;
    miLine3.Visible := (miFilePrint.Visible or miFilePageSetup.Visible or miFilePrintStyles.Visible);
    miLine13.Visible := miFormatPageBackground.Visible;

    miViewMargins.checked := (povMargins in Preview.OptionsView);
    miHelp.Visible := IsVisible(pvoHelp);

    pmiFlatBtns.checked := FFlatCtrls; {popup}
    pmiLargeBtns.checked := FLargeBtns; {popup}
    miViewFlatTBtns.checked := FFlatCtrls;
    miViewLargeTBtns.checked := FLargeBtns;

    if ToolBar.Visible then
      with TdxPSSpinEdit(FseActivePage) do
        if Enabled then
        begin
          MinValue := 1;
          if (ComponentPrinter <> nil) then
          begin
            MaxValue := ComponentPrinter.CurrentLink.PageCount;
            Value := ComponentPrinter.CurrentLink.VirtualPageIndexToRealPageIndex(FPreview.SelPageIndex) + 1;
          end
        end
        else
          AsInteger := -1;

  finally
    CancelUpdate;
  end;
  ToolBar.Update;
end;

procedure TdxfmStdPreview.cbxPredefinedZoomClick(Sender: TObject);
begin
  SetZoomFactorByText(FcbxPredefinedZoom.Text);
  UpdateControls;
  FcbxPredefinedZoom.Text := StrPercentSign(IntToStr(ZoomFactor));
end;

procedure TdxfmStdPreview.cbxPredefinedZoomCloseUp(Sender: TObject; AAccept: Boolean);
begin
  Windows.SetFocus(Preview.Handle);
end;

procedure TdxfmStdPreview.cbxPredefinedZoomExit(Sender: TObject);
begin
  cbxPredefinedZoomClick(nil);
end;

procedure TdxfmStdPreview.cbxPredefinedZoomKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_ESCAPE) then
    Windows.SetFocus(Preview.Handle);
end;

procedure TdxfmStdPreview.seActivePageExit(Sender: TObject);
begin
  if Locked then Exit;
  DoActivePageChanged(TdxPSSpinEdit(FseActivePage).AsInteger - 1);
end;

procedure TdxfmStdPreview.seKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(VK_RETURN) then seActivePageExit(Sender);
end;

procedure TdxfmStdPreview.seActivePageButtonClick(Sender: TObject;
  ButtonType: TdxButtonType; Button: TUDBtnType);
begin
  case Button of
    btNext:
      GoToNextPage;
    btPrev:
      GoToPrevPage;
  end;
end;

procedure TdxfmStdPreview.OptionsClick(Sender: TObject);
begin
  DoShowOptionsDlg;
end;

procedure TdxfmStdPreview.SaveToRegistry(const APath: string);
begin
  inherited SaveToRegistry(APath);
  SavePropertiesToRegistry(APath)
end;

procedure TdxfmStdPreview.LoadFromRegistry(const APath: string);
begin
  inherited LoadFromRegistry(APath);
  LoadPropertiesFromRegistry(APath);
end;

const
  sdxFlatCtrls = 'FlatCtrls';
  sdxLargeBtns = 'LargeBtns';

procedure TdxfmStdPreview.SavePropertiesToRegistry(const APath: string);

  procedure DoStore(const ARegistryPath: string);
  begin
    with TRegistry.Create do
    try
      if OpenKey(ARegistryPath, True) then
      try
        WriteBool(sdxFlatCtrls, FlatCtrls);
        WriteBool(sdxLargeBtns, LargeBtns);
      except
        on ERegistryException do
        else
          raise;
      end;
    finally
      Free;
    end;
  end;

begin
  DoStore(APath);
  if IsDesignTime and (dxPSEngine.RegistryPath <> '') then
    DoStore(dxPSEngine.RegistryPath);
end;

procedure TdxfmStdPreview.LoadPropertiesFromRegistry(const APath: string);
var
  Registry: TRegistry;
begin
  Registry := TRegistry.Create;
  with Registry do
  try
    if OpenKey(APath, False) then
    try
      if ValueExists(sdxFlatCtrls) then 
        FlatCtrls := ReadBool(sdxFlatCtrls);
      if ValueExists(sdxLargeBtns) then 
        LargeBtns := ReadBool(sdxLargeBtns);
    except
      on ERegistryException do
      else
        raise;
    end;
  finally
    Free;
  end;
end;

procedure TdxfmStdPreview.pmToolBarPopup(Sender: TObject);
begin
  pmiFlatBtns.Checked := FlatCtrls;
  pmiLargeBtns.Checked := LargeBtns;
end;

procedure TdxfmStdPreview.pmPreviewPopup(Sender: TObject);
begin
  pmiReportDesign.Enabled := miFileDesign.Enabled;
  pmiReportDesign.Visible := miFileDesign.Visible;
  pmiPageSetup.Enabled := miFilePageSetup.Enabled;
  pmiPageSetup.Visible := miFilePageSetup.Visible;
  pmiFilePrintStyles.Visible := CanPrintStyle;
  CheckItem(pmiFilePrintStyles);
  miLine11.Visible := pmiReportDesign.Visible;
  pmiReportShrinkToPageWidth.Checked := miFormatShrinkToPageWidth.Checked;
  pmiReportShrinkToPageWidth.Enabled := miFormatShrinkToPageWidth.Enabled;
  pmiZoomPercent100.Enabled := miZoomPercent100.Enabled;
  pmiZoomPageWidth.Enabled := miZoomPageWidth.Enabled;
  pmiZoomWholePage.Enabled := miZoomWholePage.Enabled;
  pmiZoomTwoPages.Enabled := miZoomTwoPages.Enabled;
  pmiZoomFourPages.Enabled := miZoomFourPages.Enabled;
  pmiZoomWidenToSourceWidth.Enabled := miZoomWidenToSourceWidth.Enabled;
  pmiGotoFirstPage.Enabled := miGotoFirstPage.Enabled;
  pmiGotoPrevPage.Enabled := miGotoPrevPage.Enabled;
  pmiGotoNextPage.Enabled := miGotoNextPage.Enabled;
  pmiGotoLastPage.Enabled := miGotoLastPage.Enabled;
end;

procedure TdxfmStdPreview.pmPrintStylesPopup(Sender: TObject);
begin
  CheckItem(TPopupMenu(Sender).Items);
end;

procedure TdxfmStdPreview.miFormatDateTimeClick(Sender: TObject);
begin
  DoShowFormatDateTimeDlg;
end;

procedure TdxfmStdPreview.miFormatPageNumberingClick(Sender: TObject);
begin
  DoShowFormatPageNumbersDlg;
end;

procedure TdxfmStdPreview.miViewPageHeadersClick(Sender: TObject);
begin
  if Locked then Exit;
  with TMenuItem(Sender) do
  begin
    Checked := not Checked;
    DoShowPageHeaders(Checked);
  end;
end;

procedure TdxfmStdPreview.miViewPageFootersClick(Sender: TObject);
begin
  if Locked then Exit;
  with TMenuItem(Sender) do
  begin
    Checked := not Checked;
    DoShowPageFooters(Checked);
  end;
end;

initialization
  dxPSRegisterPreviewWindow(TdxfmStdPreview);

finalization
  dxPSUnregisterPreviewWindow(nil);

end.
