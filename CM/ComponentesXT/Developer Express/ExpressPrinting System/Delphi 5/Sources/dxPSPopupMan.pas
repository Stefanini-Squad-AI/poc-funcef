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

unit dxPSPopupMan;

interface

{$I dxPSVer.inc}

uses
  Classes, Controls, Windows, Menus;

type
  TdxPSPopupMenuBuilderClass = class of TAbstractdxPSPopupMenuBuilder;
  TAbstractdxPSPopupMenuBuilder = class
  protected
    function BuildPopup(const AControl: TControl;
      const APopupMenu: TPopupMenu): TComponent; virtual; abstract;
    class function CanShowPopup(const APopupMenu: TPopupMenu): Boolean; virtual; 
    procedure FreePopup(var APopupMenu: TComponent); virtual; abstract;
    procedure InvokePopup(const X, Y: Integer; const AControl: TControl;
      const APopupMenu: TComponent); virtual; abstract;
  public
    constructor Create; virtual;
  end;

  
  TdxStandardPSPopupMenuBuilder = class(TAbstractdxPSPopupMenuBuilder)
  protected
    function BuildPopup(const AControl: TControl; 
      const APopupMenu: TPopupMenu): TComponent; override;
    procedure FreePopup(var APopupMenu: TComponent); override;
    procedure InvokePopup(const X, Y: Integer; const AControl: TControl; 
      const APopupMenu: TComponent); override;
  end;
  
procedure dxPSRegisterControlWithPopup(AControl: TControl);
procedure dxPSUnregisterControlWithPopup(AControl: TControl);
procedure dxPSShowPopup(X, Y: Integer; AControl: TControl; APopupMenu: TPopupMenu);

procedure dxPSRegisterPopupMenuBuilderClass(APopupMenuBuilderClass: TdxPSPopupMenuBuilderClass);
procedure dxPSUnregisterPopupMenuBuilderClass(APopupMenuBuilderClass: TdxPSPopupMenuBuilderClass);
  
implementation

uses
  dxPSGlbl, Messages, Forms;

type  
  TdxPSPopupMenuManager = class(TComponent)
  private
    FControls: TList;
    FKbdHook: HHOOK;
    FMouseHook: HHOOK;
    
    procedure Add(AControl: TControl);
    procedure Clear;
    procedure Delete(AIndex: Integer);
    function IndexOf(AControl: TControl): Integer;
    function TryToShowPopup(AControl: TControl; Pt: TPoint): Boolean;
  protected  
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure ShowPopup(const X, Y: Integer; const AControl: TControl; 
      const APopupMenu: TPopupMenu);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure RegisterControl(AControl: TControl);
    procedure UnregisterControl(AControl: TControl);
  end;
 
var
  FPopupMenuManager: TdxPSPopupMenuManager = nil;
  FPopupMenuBuilderClasses: TList = nil;
  
function PopupMenuManager: TdxPSPopupMenuManager;
begin
  if FPopupMenuManager = nil then 
    FPopupMenuManager := TdxPSPopupMenuManager.Create(nil);
  Result := FPopupMenuManager;
end;

procedure dxPSRegisterControlWithPopup(AControl: TControl);
begin
  PopupMenuManager.RegisterControl(AControl);
end;

procedure dxPSUnregisterControlWithPopup(AControl: TControl);
begin
  if FPopupMenuManager <> nil then 
    PopupMenuManager.UnregisterControl(AControl);
end;

procedure dxPSShowPopup(X, Y: Integer; AControl: TControl; APopupMenu: TPopupMenu);
begin
  if FPopupMenuManager <> nil then
    PopupMenuManager.ShowPopup(X, Y, AControl, APopupMenu);
end;

function dxPSActivePopupMenuBuilderClass: TdxPSPopupMenuBuilderClass;
begin
  if (FPopupMenuBuilderClasses <> nil) and (FPopupMenuBuilderClasses.Count > 0) then
    Result := TdxPSPopupMenuBuilderClass(FPopupMenuBuilderClasses.Last)
  else  
    Result := TdxStandardPSPopupMenuBuilder;
end;

procedure dxPSRegisterPopupMenuBuilderClass(APopupMenuBuilderClass: TdxPSPopupMenuBuilderClass);
begin
  if FPopupMenuBuilderClasses = nil then FPopupMenuBuilderClasses := TList.Create;
  FPopupMenuBuilderClasses.Add(APopupMenuBuilderClass);
end;

procedure dxPSUnregisterPopupMenuBuilderClass(APopupMenuBuilderClass: TdxPSPopupMenuBuilderClass);
begin
  if FPopupMenuBuilderClasses = nil then Exit;
  FPopupMenuBuilderClasses.Remove(APopupMenuBuilderClass);
  if FPopupMenuBuilderClasses.Count = 0 then 
  begin
    FPopupMenuBuilderClasses.Free;
    FPopupMenuBuilderClasses := nil;
  end;  
end;

procedure dxPSUnregisterAllPopupMenuBuilderClasses;
begin
  while FPopupMenuBuilderClasses <> nil do 
    dxPSUnregisterPopupMenuBuilderClass(FPopupMenuBuilderClasses.Last);
end;

type
  TControlHack = class(TControl);
{$IFDEF DELPHI5}  
  TPopupMenuHack = class(TPopupMenu);  
{$ENDIF}    

{$IFDEF DELPHI5}
procedure EatWMContextMenu(Wnd: HWND);
var
  Msg: TMsg;
begin
  PeekMessage(Msg, Wnd, WM_CONTEXTMENU, WM_CONTEXTMENU, PM_REMOVE);
end;
{$ENDIF}

function dxPSPopupManKbdHook(Code: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;

  {
  procedure DefaultHandler(AControl: TControl; AMsg: Cardinal; ACharCode: Word; AKeyData: LongInt);
  var
    Message: TWMKey;
  begin
    FillChar(Message, SizeOf(TMessage), 0);
    with Message do
    begin
      Msg := AMsg;
      CharCode := ACharCode;
      KeyData := AKeyData;
    end;  
    AControl.DefaultHandler(Message);
  end;  
  }
  
  function IsProcessKey(AKey, AKeyData: Longint; AKeyPressed: Boolean): Boolean;
  begin
    Result := 
      ((AKey = VK_F10) and (GetAsyncKeyState(VK_SHIFT) < 0)) or 
      ((AKey = VK_APPS) and ((AKeyData shr 29) and 1 <> 1));
  end;

{$IFNDEF DELPHI4}
  function IsEatKey(AKey, AKeyData: Longint; AKeyPressed: Boolean): Boolean;
  begin
    Result := ((AKey = VK_APPS) and {alt}((AKeyData shr 29) and 1 <> 1) and AKeyPressed);
  end;
{$ENDIF}
  
 function GetVCLControl(Wnd: HWND): TWinControl;
 begin
   repeat
     Result := FindControl(Wnd);
     if Result <> nil then Exit;
     Wnd := GetParent(Wnd);
   until Wnd = 0;
 end;
  
const 
  KbdMessages: array[Boolean] of Cardinal = (WM_KEYUP, WM_KEYDOWN);
var
  KeyPressed: Boolean;
  Wnd: HWND;
  Control: TWinControl;
  R: LRESULT;
begin
  Result := 0;
  KeyPressed := (lParam shr 31) and 1 <> 1;
  if (Code >= 0) and IsProcessKey(wParam, lParam, KeyPressed) then 
  begin 
    Wnd := GetFocus;
    Control := GetVCLControl(Wnd);
    if Control <> nil then 
    begin          
      if FPopupMenuManager.IndexOf(Control) > -1 then 
      begin
        //DefaultHandler(Control, KbdMessages[KeyPressed], wParam, lParam);
      {$IFDEF DELPHI5}
        EatWMContextMenu(Wnd);
      {$ENDIF}
      {$IFNDEF DELPHI4}
        if not IsEatKey(wParam, lParam, KeyPressed) then
      {$ENDIF}
          FPopupMenuManager.TryToShowPopup(Control, Control.ClientToScreen(Point(0, 0)));
        Result := 1;
      end;
    end;  
  end;  
  R := CallNextHookEx(FPopupMenuManager.FKbdHook, Code, wParam, lParam);
  if Result = 0 then Result := R;
end;

function dxPSPopupManMouseHook(Code: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;

  procedure DefaultHandler(AControl: TWinControl; const Pt: TPoint);
  var
    Message: TWMMouse;
  begin
    FillChar(Message, SizeOf(TMessage), 0);
    with Message do
    begin
      Msg := WM_RBUTTONUP;
      Pos := PointToSmallPoint(Pt);
      Keys := MK_RBUTTON;
      if GetAsyncKeyState(VK_CONTROL) < 0 then Keys := Keys or MK_CONTROL;
      if GetAsyncKeyState(VK_MBUTTON) < 0 then Keys := Keys or MK_MBUTTON;  
      if GetAsyncKeyState(VK_SHIFT) < 0 then Keys := Keys or MK_SHIFT;
    end;  
    AControl.DefaultHandler(Message);
  end;
  
  function FindControl(Wnd: HWND; const Pt: TPoint): TControl;

    function IsRegisteredControl(AControl: TControl; const Pt: TPoint): Boolean;
    begin
      Result := PtInRect(AControl.ClientRect, AControl.ScreenToClient(Pt)) and
        (FPopupMenuManager.IndexOf(AControl) > -1);
    end;

    function FindInChildren(AControl: TWinControl; const Pt: TPoint): TControl;
    var
      I: Integer;
    begin
      for I := 0 to AControl.ControlCount - 1 do 
      begin
        Result := AControl.Controls[I];
        if IsRegisteredControl(Result, Pt) then Exit;
      end;
      Result := nil;
    end;
  
    function FindInParents(AControl: TWinControl; const Pt: TPoint): TWinControl;
    begin
      Result := AControl;
      while Result <> nil do
      begin
        if IsRegisteredControl(Result, Pt) then Exit;
        Result := Result.Parent;
      end;
    end;
    
  var 
    TargetControl: TWinControl;  
  begin
    Result := nil;
    TargetControl := Controls.FindControl(Wnd);
    if TargetControl = nil then Exit;
    Result := FindInChildren(TargetControl, Pt);
    if Result = nil then 
    begin
      Result := TargetControl;    
      if FPopupMenuManager.IndexOf(Result) > -1 then Exit;
      Result := FindInParents(TargetControl, Pt);
    end;
  end;
  
var
  Control: TControl;
  R: LRESULT;
begin
  Result := 0;
  if (Code >= 0) and (wParam = WM_RBUTTONUP) then
    with PMouseHookStruct(lParam)^ do 
    begin    
      Control := FindControl(HWND, Pt);
      if Control <> nil then 
      begin
        if Control is TWinControl then 
          DefaultHandler(TWinControl(Control), Pt);
      {$IFDEF DELPHI5}
        EatWMContextMenu(HWND);
      {$ENDIF}
        FPopupMenuManager.TryToShowPopup(Control, Pt);
        Result := 1;
      end;  
    end;
  R := CallNextHookEx(FPopupMenuManager.FMouseHook, Code, wParam, lParam);
  if Result = 0 then Result := R;
end;
      

{ TdxPSPopupMenuManager }

constructor TdxPSPopupMenuManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FControls := TList.Create; 
  FKbdHook := SetWindowsHookEx(WH_KEYBOARD, dxPSPopupManKbdHook, 0, GetCurrentThreadId);
  FMouseHook := SetWindowsHookEx(WH_MOUSE, dxPSPopupManMouseHook, 0, GetCurrentThreadId);
end;
    
destructor TdxPSPopupMenuManager.Destroy;
begin
  if FMouseHook <> 0 then UnhookWindowsHookEx(FMouseHook);  
  if FKbdHook <> 0 then UnhookWindowsHookEx(FKbdHook);
  Clear;
  FControls.Free;
  inherited Destroy;
end;

procedure TdxPSPopupMenuManager.Notification(AComponent: TComponent; AOperation: TOperation);
begin
  inherited Notification(AComponent, AOperation);
  if (AOperation = opRemove) and (AComponent is TControl) then
    UnregisterControl(TControl(AComponent));
end;

procedure TdxPSPopupMenuManager.RegisterControl(AControl: TControl);
begin
  if IndexOf(AControl) = -1 then 
  begin 
    Add(AControl);
    AControl.FreeNotification(Self);
  end;
end;    

procedure TdxPSPopupMenuManager.UnregisterControl(AControl: TControl);
var
  Ind: Integer;
begin
  Ind := IndexOf(AControl);
  if Ind <> -1 then Delete(Ind);
end;    

procedure TdxPSPopupMenuManager.ShowPopup(const X, Y: Integer; const AControl: TControl; 
  const APopupMenu: TPopupMenu);
var
  PopupMenu: TComponent;
  PopupMenuBuilder: TAbstractdxPSPopupMenuBuilder;
begin
  PopupMenuBuilder := dxPSActivePopupMenuBuilderClass.Create;
  try
    PopupMenu := PopupMenuBuilder.BuildPopup(AControl, APopupMenu);
    if PopupMenu <> nil then
    try
      try
        PopupMenuBuilder.InvokePopup(X, Y, AControl, PopupMenu);
      except
        Application.HandleException(Self);
      end;  
    finally
      PopupMenuBuilder.FreePopup(PopupMenu);
    end;  
  finally
    PopupMenuBuilder.Free;
  end;  
end;

procedure TdxPSPopupMenuManager.Add(AControl: TControl);
begin
  FControls.Add(AControl);
end;
    
procedure TdxPSPopupMenuManager.Clear;
begin
  while FControls.Count > 0 do Delete(FControls.Count - 1);
end;
    
procedure TdxPSPopupMenuManager.Delete(AIndex: Integer);
begin
  FControls.Delete(AIndex);
end;

function TdxPSPopupMenuManager.IndexOf(AControl: TControl): Integer;
begin
  Result := FControls.IndexOf(AControl);
end;

function TdxPSPopupMenuManager.TryToShowPopup(AControl: TControl; Pt: TPoint): Boolean;

  function GetPopupMenu(var AControl: TControl): TPopupMenu;
  begin
    if AControl <> nil then 
    begin
      Result := TControlHack(AControl).PopupMenu;
      while (Result = nil) and (AControl.Parent <> nil) do 
      begin
        AControl := AControl.Parent;
        Result := TControlHack(AControl).PopupMenu;
      end;
    end
    else
      Result := nil;
  end;
  
{$IFDEF DELPHI5}
  function IsHandledPopup(AControl: TControl; const Pt: TPoint): Boolean;
  begin
    Result := False;
    TControlHack(AControl).DoContextPopup(Pt, Result);
  end;
{$ENDIF}

  procedure DoPopup(APopupMenu: TPopupMenu);
  begin
  {$IFDEF DELPHI5}
    TPopupMenuHack(APopupMenu).DoPopup(APopupMenu);  
  {$ELSE}
    if Assigned(APopupMenu.OnPopup) then APopupMenu.OnPopup(APopupMenu);
  {$ENDIF}
  end;
  
  procedure DoBeforeShowPopup(AControl: TControl);
  begin
    TControlHack(AControl).SendCancelMode(nil);
    DoPopup(TControlHack(AControl).PopupMenu);
  end;

  function CheckPopupMenu(AControl: TControl; const Pt: TPoint): TPopupMenu;
  begin
    Result := GetPopupMenu(AControl);
    if (Result <> nil) and not Result.AutoPopup then 
      Result := nil;
      
    if (Result <> nil) and 
      (Pt.X >= 0) and not PtInRect(AControl.ClientRect, AControl.ScreenToClient(Pt)) then
      Result := nil;
  end;
  
var 
  PopupMenu: TPopupMenu; 
begin
  PopupMenu := CheckPopupMenu(AControl, Pt);
  Result := (PopupMenu <> nil) and dxPSActivePopupMenuBuilderClass.CanShowPopup(PopupMenu);
  if not Result then Exit;
{$IFDEF DELPHI5}
  if IsHandledPopup(AControl, Pt) then Exit;
{$ENDIF}
  Result := True;
  DoBeforeShowPopup(AControl);
  if Pt.X < 0 then 
    Pt := AControl.ClientToScreen(Point(0, 0));
  FPopupMenuManager.ShowPopup(Pt.X, Pt.Y, AControl, PopupMenu);
end;


{ TAbstractdxPSPopupMenuBuilder }      

constructor TAbstractdxPSPopupMenuBuilder.Create;
begin
  inherited Create;
end;

class function TAbstractdxPSPopupMenuBuilder.CanShowPopup(const APopupMenu: TPopupMenu): Boolean;
begin
  Result := True;
end;


{ TdxStandardPSPopupMenuBuilder }
                                                 
function TdxStandardPSPopupMenuBuilder.BuildPopup(const AControl: TControl; 
  const APopupMenu: TPopupMenu): TComponent;
begin
  Result := APopupMenu;
  TPopupMenu(Result).PopupComponent := AControl;
end;
  
procedure TdxStandardPSPopupMenuBuilder.FreePopup(var APopupMenu: TComponent);
begin
end;

procedure TdxStandardPSPopupMenuBuilder.InvokePopup(const X, Y: Integer; 
  const AControl: TControl; const APopupMenu: TComponent);
begin
  TPopupMenu(APopupMenu).Popup(X, Y);
end;

initialization
    
finalization
  dxPSUnregisterAllPopupMenuBuilderClasses;
  if FPopupMenuManager <> nil then FPopupMenuManager.Free;
  
end.
