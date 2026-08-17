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

unit dxPSfmLnkAdde;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Registry,
  StdCtrls, ComCtrls, {$IFDEF DELPHI4}ImgList, {$ENDIF}
  dxPSCore, dxPSForm;

type
  TdxfmAddEmptyReportLink = class(TCustomdxPSForm)
    btnOK: TButton;
    btnCancel: TButton;
    btnHelp: TButton;
    gbxReportLinks: TGroupBox;
    lvLinks: TListView;
    ImageList1: TImageList;
    procedure btnHelpClick(Sender: TObject);
    procedure lvLinksDblClick(Sender: TObject);
    procedure lvLinksColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvLinksCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    FPrevColumnIndex: Integer;
    FSortOrder: array[0..1] of Boolean;

    function Execute: TdxReportLinkClass;
    procedure FillListView;
    procedure SetColumnSortImage(Index: Integer; ACurrent, ASort: Boolean);
    procedure SortColumn(Column: TListColumn);
    
    procedure WMGetMinMaxInfo(var message: TWMGetMinMaxInfo); message WM_GETMINMAXINFO;
    procedure WMNCCreate(var message: TWMNCCreate); message WM_NCCREATE;
    procedure WMNCDestroy(var message: TWMNCCreate); message WM_NCDESTROY;
    procedure WMNCHitTest(var message: TWMNCHitTest); message WM_NCHITTEST;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

function dxSelectReportLink: TdxReportLinkClass;

implementation

{$R *.DFM}

uses
  Dialogs, CommCtrl,
  dxPSGlbl, dxPSUtl;

var
  IsComCtrlVersion470: Boolean;

{$IFNDEF DELPHI4}
const
  LVM_GETHEADER = LVM_FIRST + 31;
  HDM_SETIMAGELIST = HDM_FIRST + 8;

  HDI_IMAGE = $0020;
  HDF_BITMAP_ON_RIGHT = $1000;
  HDF_IMAGE = $0800;

type
  PHDItem = ^THDItem;
  THDItem = packed record
    Mask: Cardinal;
    cxy: Integer;
    pszText: PAnsiChar;
    hbm: HBITMAP;
    cchTextMax: Integer;
    fmt: Integer;
    lParam: LPARAM;
    iImage: Integer;
    iOrder: Integer;
  end;

function ListView_GetHeader(hwnd: HWND): HWND;
begin
  Result := SendMessage(hwnd, LVM_GETHEADER, 0, 0);
end;

function Header_GetItem(Header: HWnd; Index: Integer; var Item: THDItem): Bool;
begin
  Result := Bool(SendMessage(Header, HDM_GETITEM, Index, Longint(@Item)));
end;

function Header_SetItem(Header: HWnd; Index: Integer; const Item: THDItem): Bool;
begin
  Result := Bool(SendMessage(Header, HDM_SETITEM, Index, Longint(@Item)));
end;

function Header_SetImageList(hwnd: HWND; himl: HIMAGELIST): HIMAGELIST;
begin
  Result := SendMessage(hwnd, HDM_SETIMAGELIST, 0, LPARAM(himl));
end;

{$ENDIF}

function dxSelectReportLink: TdxReportLinkClass;
begin
  with TdxfmAddEmptyReportLink.Create(nil) do
  try
    Result := Execute
  finally
    Free;
  end;
end;


{ TfmAddEmptyReportLink }

constructor TdxfmAddEmptyReportLink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  HelpContext := dxPSGlbl.dxhcAddEmptyLinkDlg;
  btnHelp.Visible := (HelpContext <> 0);
  if HelpContext = 0 then
  begin
    btnOK.BoundsRect := btnCancel.BoundsRect;
    btnCancel.BoundsRect := btnHelp.BoundsRect;
  end;
  FPrevColumnIndex := -1;
  FillListView;
  with lvLinks do
  begin
    btnOK.Enabled := Items.Count > 0;
    if Items.Count > 0 then
    begin
      Selected := Items[0];
      ItemFocused := Selected;
    end;
  end;
end;

procedure TdxfmAddEmptyReportLink.CreateWnd;
var
  Header: HWND;
begin
  inherited CreateWnd;
  SendMessage(Handle, WM_SETICON, 1, Icon.Handle);
  if IsComCtrlVersion470 then 
  begin 
    lvLinks.HandleNeeded;
    Header := ListView_GetHeader(lvLinks.Handle);
    if IsWindow(Header) then 
      Header_SetImageList(Header, ImageList1.Handle);
  end;  
  FormResize(nil);
end;

procedure TdxfmAddEmptyReportLink.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    Style := Style or WS_THICKFRAME;
end;

procedure TdxfmAddEmptyReportLink.WMGetMinMaxInfo(var message: TWMGetMinMaxInfo);
begin
  inherited;
  message.MinMaxInfo^.ptMinTrackSize := Point(425, 310);
end;

procedure TdxfmAddEmptyReportLink.WMNCCreate(var Message: TWMNCCreate);
var
  SysMenu: HMENU;
  Info: TMenuItemInfo;
  S: array[0..31] of Char;
  ItemExist: Boolean;
begin
  SysMenu := GetSystemMenu(Handle, False);
  Info.cbSize := SizeOf(Info){$IFDEF DELPHI4} - SizeOf(HBITMAP){$ENDIF};
  Info.fMask := MIIM_ID or MIIM_TYPE;
  Info.dwTypeData := @S[0];
  Info.cch := 32;
  ItemExist := GetMenuItemInfo(SysMenu, SC_SIZE, False, Info);
  inherited;
  if ItemExist then
    InsertMenuItem(SysMenu, 0, True, Info);
end;

procedure TdxfmAddEmptyReportLink.WMNCDestroy(var message: TWMNCCreate);
begin
  GetSystemMenu(Handle, True);
  inherited;
end;

procedure TdxfmAddEmptyReportLink.WMNCHitTest(var message: TWMNCHitTest);
var
  Pt: TPoint;
  R: TRect;
begin
  inherited;
  Pt := ScreenToClient(SmallPointToPoint(message.Pos));
  R := Rect(ClientWidth - GetSystemMetrics(SM_CYHSCROLL),
    ClientHeight - GetSystemMetrics(SM_CYHSCROLL), ClientWidth, ClientHeight);
  if PtInRect(R, Pt) then
    message.Result := HTBOTTOMRIGHT
end;

procedure TdxfmAddEmptyReportLink.FillListView;
var
  I, J: Integer;
  S: string;
  LinkList: TList;
  ComponentList: TList;
  LinkClass: TdxReportLinkClass;
begin
  LinkList := TList.Create;
  try
    ComponentList := TList.Create;
    try
      dxPSGetActiveReportLinksList(LinkList);
      for I := 0 to LinkList.Count - 1 do
      begin
        ComponentList.Clear;
        LinkClass := TdxReportLinkClass(LinkList[I]);
        with lvLinks.Items.Add do
        begin
          Caption := LinkClass.ClassName;
          ImageIndex := -1;
          StateIndex := -1;
          Data := LinkClass;
          LinkClass.GetSupportedComponentList(ComponentList);
          if ComponentList.Count > 0 then
          begin
            S := '';
            for J := 0 to ComponentList.Count - 1 do
            begin
              if S <> '' then S := S + ', ';
              S := S + TComponentClass(ComponentList[J]).ClassName;
            end;
            SubItems.Add(S);
          end;
        end;
      end;
    finally
      ComponentList.Free;
    end;
  finally
    LinkList.Free;
  end;
end;

function TdxfmAddEmptyReportLink.Execute: TdxReportLinkClass;
begin
  if (ShowModal = mrOK) and (lvLinks.Selected <> nil) then
    Result := TdxReportLinkClass(lvLinks.Selected.Data)
  else
    Result := nil;
end;

procedure TdxfmAddEmptyReportLink.btnHelpClick(Sender: TObject);
begin
  if HelpContext <> 0 then Application.HelpContext(HelpContext);
end;

procedure TdxfmAddEmptyReportLink.lvLinksDblClick(Sender: TObject);
begin
  if lvLinks.Selected <> nil then ModalResult := mrOk;
end;

procedure TdxfmAddEmptyReportLink.lvLinksColumnClick(Sender: TObject; Column: TListColumn);
begin
  SortColumn(Column);
end;

procedure TdxfmAddEmptyReportLink.SortColumn(Column: TListColumn);
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if (FPrevColumnIndex > -1) and IsComCtrlVersion470 then
      SetColumnSortImage(FPrevColumnIndex, False, False);
    FPrevColumnIndex := Column.Index;
    if IsComCtrlVersion470 then
      SetColumnSortImage(FPrevColumnIndex, True, not FSortOrder[FPrevColumnIndex]);
    lvLinks.CustomSort(nil, FPrevColumnIndex);
    FSortOrder[FPrevColumnIndex] := not FSortOrder[FPrevColumnIndex];
    //FSortedColumn := Column;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TdxfmAddEmptyReportLink.lvLinksCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  S1, S2: string;
begin
  if (Data <> -1) and (Item1.SubItems.Count > 0) and (Item2.SubItems.Count > 0) then
  begin
    if Data = 0 then
    begin
      S1 := Item1.Caption;
      S2 := Item2.Caption;
    end
    else
    begin
      S1 := Item1.SubItems[Data - 1];
      S2 := Item2.SubItems[Data - 1];
    end;
    Compare := AnsiCompareText(S1, S2);
    if (Compare <> 0) and not FSortOrder[Data] then
      Compare := -Compare;
  end;
end;

procedure TdxfmAddEmptyReportLink.SetColumnSortImage(Index: Integer; ACurrent, ASort: boolean);
var
  HDItem: THDItem;
  Header: HWND;
begin
  if not IsComCtrlVersion470 then Exit;
  
  Header := ListView_GetHeader(lvLinks.Handle);
  if not IsWindow(Header) then Exit;
  
  Header_SetImageList(Header, ImageList1.Handle);
  HDItem.Mask := HDI_FORMAT or HDI_IMAGE;
  Header_GetItem(Header, Index, HDItem);
  HDItem.fmt := HDItem.fmt or HDF_BITMAP_ON_RIGHT or HDF_IMAGE;
  HDItem.iImage := Byte(ACurrent) * (1 + Integer(ASort));
  Header_SetItem(Header, Index, HDItem);
end;

procedure TdxfmAddEmptyReportLink.FormPaint(Sender: TObject);
begin
  DrawSizeGrip(Canvas.Handle, ClientRect);
end;

procedure TdxfmAddEmptyReportLink.FormResize(Sender: TObject);
var
  i: Integer;
  Rgn, Rgn2: HRGN;
begin
  gbxReportLinks.Width := ClientWidth - 2 * gbxReportLinks.Left;
  gbxReportLinks.Height := ClientHeight - gbxReportLinks.Top - btnCancel.Height - 6 - 8;
  lvLinks.HandleNeeded;
  lvLinks.Width := gbxReportLinks.ClientWidth - 2 * lvLinks.Left;
  lvLinks.Height := gbxReportLinks.ClientHeight - lvLinks.Top - 6;

  if btnHelp.Visible then
  begin
    btnHelp.Left := ClientWidth - btnHelp.Width - GetSystemMetrics(SM_CXVSCROLL);
    btnHelp.Top := ClientHeight - btnHelp.Height - 6;
    btnCancel.Left := btnHelp.Left - btnCancel.Width - 4;
  end
  else
    btnCancel.Left := ClientWidth - btnCancel.Width - GetSystemMetrics(SM_CXVSCROLL);
  btnCancel.Top := ClientRect.Bottom - btnCancel.Height - 6;

  btnOK.Left := btnCancel.Left - btnOK.Width - 4;
  btnOK.Top := ClientRect.Bottom - btnOK.Height - 6;

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

initialization
  IsComCtrlVersion470 := GetComCtlVersion >= ComCtlVersionIE4;

end.

