
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

unit dxfmDfnStl;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Menus, {$IFDEF DELPHI4}ImgList, {$ENDIF}
  dxPSESys, dxPSForm, dxPgsDlg;

type
  TdxfmDefinePrintStyles = class(TCustomdxPSForm)
    pmPrintStyles: TPopupMenu;
    miEdit: TMenuItem;
    miLine1: TMenuItem;
    miCopy: TMenuItem;
    miReset: TMenuItem;
    ilPrintStyles: TImageList;
    miClear: TMenuItem;
    btnEdit: TButton;
    btnCopy: TButton;
    btnReset: TButton;
    btnClose: TButton;
    btnHelp: TButton;
    lbxPrintStyles: TListBox;
    Bevel: TBevel;
    procedure EditClick(Sender: TObject);
    procedure CopyClick(Sender: TObject);
    procedure ResetClick(Sender: TObject);
    procedure pmPrintStylesPopup(Sender: TObject);
    procedure lbxPrintStylesClick(Sender: TObject);
    procedure lbxPrintStylesDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ClearClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FPrevClassStyle: DWORD;
    FPrevWindowProc: TWndMethod;
    FSubscriber: TdxEventSubscriber;
        
    FBtnDelCaptions: array[Boolean] of string;
    FBtnCopyCaptions: array[Boolean] of string;    
    FPreviewBtnClicked: Boolean;
    FPrintBtnClicked: Boolean;
    FStyleManager: TdxPrintStyleManager;

    procedure SetStyleManager(Value: TdxPrintStyleManager);
    
    procedure AddPrintStyle(AClonedIndex: Integer);
    procedure FillList;
    procedure FillRestSpace(DC: hDC);
    procedure ListBoxWndProc(var Message: TMessage);
    procedure LoadStrings;
    function MouseInGripRect(const Pt: TPoint): Boolean;
    procedure RestoreWndProc;
    procedure StartSetting;
    procedure StyleListChanged(Sender: TObject);
    procedure SubstWindowProc;    
    procedure UpdateControlsState;    
    
    procedure WMGetMinMaxInfo(var message: TWMGetMinMaxInfo); message WM_GETMINMAXINFO;
    procedure WMNCCreate(var message: TWMNCCreate); message WM_NCCREATE;
    procedure WMNCDestroy(var message: TWMNCCreate); message WM_NCDESTROY;
    procedure WMNCHitTest(var message: TWMNCHitTest); message WM_NCHITTEST;
    procedure CMDialogChar(var Msg: TCMDialogChar); message CM_DIALOGCHAR;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;    
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    
    function Execute: Boolean;

    property PreviewBtnClicked: Boolean read FPreviewBtnClicked;
    property PrintBtnClicked: Boolean read FPrintBtnClicked;
    property StyleManager: TdxPrintStyleManager read FStyleManager write SetStyleManager;
  end;

  PdxDefinePrintStylesDlgData = ^TdxDefinePrintStylesDlgData;
  TdxDefinePrintStylesDlgData = packed record
    StyleManager: TdxPrintStyleManager;
    HelpContext: THelpContext;
    Title: string;
    PreviewBtnClicked: Boolean;
    PrintBtnClicked: Boolean;
  end;

procedure dxDefinePrintStylesDlg(const AData: PdxDefinePrintStylesDlgData);

implementation

{$R *.DFM}

uses
  Registry, dxPSRes, dxPSEngn, dxPSEvnt, dxPSPopupMan, dxPSGlbl, dxPSUtl;

procedure dxDefinePrintStylesDlg(const AData: PdxDefinePrintStylesDlgData);
var
  Dialog: TdxfmDefinePrintStyles;
begin
  if AData^.StyleManager = nil then
  begin
    AData^.PreviewBtnClicked := False;
    AData^.PrintBtnClicked := False;
    Exit;
  end;
  Dialog := TdxfmDefinePrintStyles.Create(nil);
  try
    Dialog.StyleManager := AData^.StyleManager;
    Dialog.Caption := AData^.Title;
    if AData^.HelpContext <> 0 then 
      Dialog.HelpContext := AData^.HelpContext;
    Dialog.Execute;
    Dialog.StyleManager := nil;
    AData^.PreviewBtnClicked := Dialog.PreviewBtnClicked;
    AData^.PrintBtnClicked := Dialog.PrintBtnClicked;
  finally
    Dialog.Free;
  end;
end;

function MessageWarning(const message: string): Boolean;
begin
  MessageBeep(MB_ICONEXCLAMATION);
  Result := (IDOK = Application.MessageBox(PChar(message), PChar(Application.Title),
    MB_OKCANCEL or MB_ICONEXCLAMATION));
end;
  

{ TfmdxDefinePrintStyles }

constructor TdxfmDefinePrintStyles.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  HelpContext := dxhcDefinePrintStyleDlg;
 {$IFDEF DELPHI4}
  pmPrintStyles.Images := ilPrintStyles;
  miEdit.ImageIndex := 0;
  miCopy.ImageIndex := 1;
 {$ENDIF}
  FSubscriber := TdxStyleListChangedSubscriber.Create([TdxSMStyleListChangedEvent]);
  TdxStyleListChangedSubscriber(FSubscriber).OnStyleListChanged := StyleListChanged;
  SubstWindowProc;
  dxPSRegisterControlWithPopup(lbxPrintStyles);
  LoadStrings;
end;

destructor TdxfmDefinePrintStyles.Destroy;
begin
  dxPSUnregisterControlWithPopup(lbxPrintStyles);
  RestoreWndProc;
  FSubscriber.Free;
  inherited Destroy;
end;

procedure TdxfmDefinePrintStyles.StyleListChanged(Sender: TObject);
begin
  if Sender = StyleManager then 
  begin
    FillList;
    UpdateControlsState;
  end;  
end;

procedure TdxfmDefinePrintStyles.SubstWindowProc;
begin
  lbxPrintStyles.HandleNeeded;
  FPrevClassStyle := 
    SetClassLong(lbxPrintStyles.Handle, GCL_STYLE, 
      GetClassLong(lbxPrintStyles.Handle, GCL_STYLE) or CS_HREDRAW);  
  FPrevWindowProc := lbxPrintStyles.WindowProc;
  lbxPrintStyles.WindowProc := ListBoxWndProc;
end;

procedure TdxfmDefinePrintStyles.RestoreWndProc;
begin
  lbxPrintStyles.WindowProc := FPrevWindowProc;
  SetClassLong(lbxPrintStyles.Handle, GCL_STYLE, FPrevClassStyle);
end;

procedure TdxfmDefinePrintStyles.ListBoxWndProc(var Message: TMessage);
begin
  if (message.Msg = WM_ERASEBKGND) then 
  begin
    FillRestSpace(TWMEraseBkgnd(message).DC);
    message.Result := 1
  end  
  else 
    FPrevWindowProc(message);
end;

procedure TdxfmDefinePrintStyles.FillRestSpace(DC: hDC);
var
  R: TRect;                                      
begin
  with lbxPrintStyles do 
  begin
    Perform(LB_GETITEMRECT, Items.Count - 1, LPARAM(@R));
    if (R.Bottom < ClientHeight) then 
    begin
      R := Rect(0, R.Bottom, ClientWidth, ClientHeight);
      FillRect(DC, R, HBRUSH(COLOR_WINDOW + 1));
    end;  
  end;
end;

procedure TdxfmDefinePrintStyles.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    Style := Style or WS_THICKFRAME;
end;

procedure TdxfmDefinePrintStyles.CreateWnd;
begin
  inherited CreateWnd;
  SendMessage(Handle, WM_SETICON, 1, Icon.Handle);
end;

procedure TdxfmDefinePrintStyles.CMDialogChar(var Msg: TCMDialogChar);
begin
  inherited;
  if IsAccel(Msg.CharCode, sdxDefinePrintStylesTitle) then
  begin
    ActiveControl := lbxPrintStyles;
    Msg.Result := 1;
  end;  
end;

procedure TdxfmDefinePrintStyles.WMNCCreate(var Message: TWMNCCreate);
var
  SysMenu: HMENU;
  Info: TMenuItemInfo;
  S: array[0..31] of Char;
  ItemExist: Boolean;
begin
  SysMenu := GetSystemMenu(Handle, False);
  Info.cbSize := SizeOf(Info) {$IFDEF DELPHI4}- SizeOf(HBITMAP){$ENDIF};
  Info.fMask := MIIM_ID or MIIM_TYPE;
  Info.dwTypeData := @S[0];
  Info.cch := 32;
  ItemExist := GetMenuItemInfo(SysMenu, SC_SIZE, False, Info);
  inherited;
  if ItemExist then
    InsertMenuItem(SysMenu, 0, True, Info);
end;

procedure TdxfmDefinePrintStyles.WMNCDestroy(var message: TWMNCCreate);
begin
  GetSystemMenu(Handle, True);
  inherited;
end;

procedure TdxfmDefinePrintStyles.WMNCHitTest(var message: TWMNCHitTest);
begin
  inherited;
  if MouseInGripRect(ScreenToClient(SmallPointToPoint(message.Pos))) then 
    message.Result := HTBOTTOMRIGHT
end;

function TdxfmDefinePrintStyles.MouseInGripRect(const Pt: TPoint): Boolean;
var
  GripSize: Integer;
  GripRect: TRect;
begin
  GripSize := GetSystemMetrics(SM_CXVSCROLL);
  GripRect := Bounds(ClientWidth - GripSize, ClientHeight - GripSize, GripSize, GripSize);
  Result := PtInRect(GripRect, Pt);
end;

procedure TdxfmDefinePrintStyles.WMGetMinMaxInfo(var message: TWMGetMinMaxInfo);
begin
  inherited;
  message.MinMaxInfo^.ptMinTrackSize := Point(290, 220);
end;

procedure TdxfmDefinePrintStyles.FillList;
var
  SaveIndex, I: Integer;
  Style: TBasedxPrintStyle;
begin
  if FStyleManager <> nil then
  begin
    SaveIndex := lbxPrintStyles.ItemIndex;
    lbxPrintStyles.Items.BeginUpdate;
    try
      lbxPrintStyles.Items.Clear;
      for I := 0 to FStyleManager.Count - 1 do
      begin
        Style := FStyleManager[I];
        lbxPrintStyles.Items.AddObject(Style.StyleCaption, Style);
      end;
    finally
      lbxPrintStyles.Items.EndUpdate;
    end;
    if lbxPrintStyles.Items.Count > 0 then
    begin
      if SaveIndex > lbxPrintStyles.Items.Count - 1 then 
        SaveIndex := lbxPrintStyles.Items.Count - 1;
      if SaveIndex = -1 then  
        SaveIndex := FStyleManager.CurrentStyleIndex;
      lbxPrintStyles.ItemIndex := SaveIndex;
      lbxPrintStylesClick(lbxPrintStyles);
    end;  
  end;
end;

procedure TdxfmDefinePrintStyles.FormResize(Sender: TObject);
const 
  dX = 7;
  dY = 5;
var
  i: Integer;
  Rgn, Rgn2: HRGN;
  W, H: Integer;
begin
  with ClientRect do 
  begin
    W := Right - Left;
    H := Bottom - Top;
  end;
  with lbxPrintStyles do
    SetBounds(0, Bevel.Height, W - btnEdit.Width - 2 * dX, H - Bevel.Height);
  with btnEdit do   
    SetBounds(lbxPrintStyles.Width + dX, Bevel.Height, Width, Height);
  with btnCopy do   
    SetBounds(lbxPrintStyles.Width + dX, btnEdit.Top + btnEdit.Height + dY, Width, Height);
  with btnReset do   
    SetBounds(lbxPrintStyles.Width + dX, btnCopy.Top + btnCopy.Height + dY, Width, Height);

  if btnHelp.Visible then
  begin
    with btnHelp do 
      SetBounds(lbxPrintStyles.Width + dX, H - Height - GetSystemMetrics(SM_CXVSCROLL), Width, Height);
    with btnClose do 
      SetBounds(lbxPrintStyles.Width + dX, btnHelp.Top - Height - dY, Width, Height);
  end
  else
    with btnClose do 
      SetBounds(lbxPrintStyles.Width + dX, H - Height - GetSystemMetrics(SM_CXVSCROLL), Width, Height);

  Rgn := CreateRectRgnIndirect(ClientRect);
  for i := 0 to ControlCount - 1 do
  begin
    Rgn2 := CreateRectRgnIndirect(Controls[i].ClientRect);
    CombineRgn(Rgn, Rgn, Rgn2, RGN_DIFF);
    DeleteObject(Rgn2);
  end;  
  InvalidateRgn(Handle, Rgn, True);  
  DeleteObject(Rgn);
end;

procedure TdxfmDefinePrintStyles.FormPaint(Sender: TObject);
var
  V: Integer;
  R: TRect;  
  DC: hDC;
  S: string;
begin
  DC := Canvas.Handle;
  FillRect(DC, ClientRect, HBRUSH(COLOR_BTNFACE + 1));  
  SetBkMode(DC, TRANSPARENT);
  R := Rect(5, 0, ClientWidth, Bevel.Height);
  S := sdxDefinePrintStylesTitle;
  DrawText(DC, PChar(S), Length(S), R, DT_SINGLELINE or DT_LEFT or DT_VCENTER);
  V := GetSystemMetrics(SM_CXVSCROLL);
  R := ClientRect;
  R := Rect(R.Right - V, R.Bottom - V, R.Right, R.Bottom);
  DrawFrameControl(DC, R, DFC_SCROLL, DFCS_SCROLLSIZEGRIP); 
end;

procedure TdxfmDefinePrintStyles.FormShow(Sender: TObject);
begin
  FormResize(nil);
end;

procedure TdxfmDefinePrintStyles.SetStyleManager(Value: TdxPrintStyleManager);
begin
  if FStyleManager <> Value then
  begin
    FStyleManager := Value;
    if FStyleManager <> nil then
    begin
      Caption := Value.Title;
      if Value.HelpContext <> 0 then HelpContext := Value.HelpContext;
    end;
  end;
end;

procedure TdxfmDefinePrintStyles.LoadStrings;
begin
  Caption := sdxDefinePrintStylesCaption;
  btnEdit.Caption := sdxBtnEdit;
  btnCopy.Caption := sdxBtnCopy;
  FBtnDelCaptions[False] := sdxBtnDelete;
  FBtnDelCaptions[True] := sdxBtnReset;
  FBtnCopyCaptions[False] := sdxBtnNew;
  FBtnCopyCaptions[True] := sdxBtnCopy;
  btnClose.Caption := sdxBtnClose;
  btnHelp.Caption := sdxBtnHelp;
  miEdit.Caption := sdxBtnEdit;
  miCopy.Caption := sdxBtnCopy;
  miClear.Caption := sdxClear;
end;

procedure TdxfmDefinePrintStyles.StartSetting;
begin
  TdxStyleListChangedSubscriber(FSubscriber).StyleListChanged(StyleManager);
  btnHelp.Visible := HelpContext <> 0;
  if btnHelp.Visible then 
    BorderIcons := BorderIcons + [biHelp];
  if not btnHelp.Visible then
    btnClose.BoundsRect := btnHelp.BoundsRect;
  ActiveControl := lbxPrintStyles;
  UpdateControlsState;
end;

function TdxfmDefinePrintStyles.Execute: Boolean;
begin
  StartSetting;
  ShowModal;
  Result := True;
  if (StyleManager <> nil) and (lbxPrintStyles.ItemIndex <> -1) then 
    StyleManager.CurrentStyleIndex := lbxPrintStyles.ItemIndex;
end;

procedure TdxfmDefinePrintStyles.EditClick(Sender: TObject);
var
  AStyle: TBasedxPrintStyle;
begin
  with lbxPrintStyles do
    AStyle := TBasedxPrintStyle(Items.Objects[ItemIndex]);
  if AStyle.PageSetupEx(0, @FPreviewBtnClicked, @FPrintBtnClicked) then 
    StyleListChanged(StyleManager); 
  if PreviewBtnClicked or PrintBtnClicked then
    ModalResult := mrOK;
end;

procedure TdxfmDefinePrintStyles.AddPrintStyle(AClonedIndex: Integer);
var
  Style: TBasedxPrintStyle;
  Result: Boolean;
begin
  Result := False;
  Style := StyleManager.BeginClone(AClonedIndex);
  if Style = nil then Exit;
  
  try
    Result := Style.PageSetupEx(0, @FPreviewBtnClicked, @FPrintBtnClicked);
    if Result or FPreviewBtnClicked or FPrintBtnClicked then
    begin
      lbxPrintStyles.Items.AddObject(Style.StyleCaption, Style);
      lbxPrintStyles.ItemIndex := lbxPrintStyles.Items.Count - 1;
    end;
  finally
    StyleManager.EndClone(Style);
    if not Result then Style.Free;
  end;
  
  if PreviewBtnClicked or PrintBtnClicked then
    ModalResult := mrOK
  else 
    if lbxPrintStyles.ItemIndex <> -1 then 
      lbxPrintStylesClick(lbxPrintStyles);
end;

procedure TdxfmDefinePrintStyles.CopyClick(Sender: TObject);
begin
  AddPrintStyle(lbxPrintStyles.ItemIndex);
end;

procedure TdxfmDefinePrintStyles.ResetClick(Sender: TObject);
var
  Style: TBasedxPrintStyle;
  S: string;
begin
  Style := TBasedxPrintStyle(lbxPrintStyles.Items.Objects[lbxPrintStyles.ItemIndex]);
  if not Style.BuiltIn then
  begin
    S := Format(sdxDefinePrintStylesWarningDelete, [Style.StyleCaption]);
    if MessageWarning(S) then Style.Free;
  end
  else
    Style.RestoreDefaults;
  UpdateControlsState;  
end;

procedure TdxfmDefinePrintStyles.pmPrintStylesPopup(Sender: TObject);
var
  Ind: Integer;
begin
  with lbxPrintStyles do
  begin
    Ind := ItemIndex;
    miEdit.Enabled := Ind > -1;
    miReset.Enabled := Ind > -1;
    miClear.Enabled := StyleManager.NonBuiltInsExists;
        
    if Ind > -1 then 
      miReset.Caption := FBtnDelCaptions[TBasedxPrintStyle(Items.Objects[Ind]).BuiltIn];

    miCopy.Caption := FBtnCopyCaptions[Items.Count > 0];          
  end;
end;

procedure TdxfmDefinePrintStyles.lbxPrintStylesClick(Sender: TObject);
var
  PrintStyle: TBasedxPrintStyle;
begin
  with TListBox(Sender) do
  begin
    PrintStyle := StyleManager[ItemIndex];
    btnReset.Caption := FBtnDelCaptions[PrintStyle.BuiltIn];
    miReset.Caption := btnReset.Caption;
    if PrintStyle.BuiltIn then
    begin
      miReset.ShortCut := TShortCut(0);
     {$IFDEF DELPHI4}
      miReset.ImageIndex := -1;
     {$ENDIF}
    end
    else
    begin
      miReset.ShortCut := ShortCut(VK_DELETE, []);
     {$IFDEF DELPHI4}
      miReset.ImageIndex := 2;
     {$ENDIF}
    end;
    UpdateControlsState;
  end;
end;

procedure TdxfmDefinePrintStyles.lbxPrintStylesDrawItem(
  Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
begin
  DrawStyleItem(TBasedxPrintStyle(lbxPrintStyles.Items.Objects[Index]), 
    TListBox(Control), Index, State, Rect, True, False);
  if Index = lbxPrintStyles.Items.Count - 1 then 
    FillRestSpace(lbxPrintStyles.Canvas.Handle);
end;

procedure TdxfmDefinePrintStyles.UpdateControlsState;
var
  Index: Integer;
begin
  Index := lbxPrintStyles.ItemIndex;
  btnEdit.Enabled := (Index > -1);  
  btnReset.Enabled := (Index > -1);
  btnCopy.Caption := FBtnCopyCaptions[lbxPrintStyles.Items.Count > 0];    

{$IFDEF DELPHI4}
  if lbxPrintStyles.Items.Count > 0 then 
    miCopy.ImageIndex := 1
  else
    miCopy.ImageIndex := 3;
{$ENDIF}
end;

procedure TdxfmDefinePrintStyles.ClearClick(Sender: TObject);
begin
  if MessageWarning(sdxDefinePrintStylesWarningClear) then
    StyleManager.DeleteNonBuiltIns;
end;

end.
