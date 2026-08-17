{Taskbar Icon VCL - Derek Stutsman (dereks@metronet.com)
 This component is freeware, enjoy it!

 Version 1.0 for Delphi32}


unit TaskIcon;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,ShellAPI;

const WM_TASKICON = WM_USER+0; {Change this if used by something else!}

type
  String64 = String[64];
  TTaskIcon = class(TWinControl)
  private
    {Field variables}
    tnid    : TNOTIFYICONDATA;
    fActive : boolean;
    fIcon : TIcon;
    fToolTip : string64;
    fTaskIconID : UINT;
    fOnClick     : TNotifyEvent;
    fOnDblClick  : TNotifyEvent;
    fOnRightClick : TMouseEvent;
    function MakeIcon(sender : TObject) : boolean;
    function KillIcon(sender : TObject) : boolean;
    function ChangeIcon(Sender : TObject) : boolean;
    procedure SetActive(Value : boolean);
    procedure SetIcon(Value : TIcon);
    procedure SetToolTip(Value : String64);
    procedure SetTaskIconID(Value : UINT);
    procedure WMTASKICON(var msg : TMessage); message WM_TASKICON;
  protected
  public
    constructor create(aOwner : TComponent); override;
    destructor destroy; override;
  published
    property Active : boolean read fActive write SetActive;
    property Icon : TIcon read fIcon write SetIcon;
    property ToolTip : string64 read fTooltip write SetToolTip;
    property TaskIconID : UINT read fTaskIconID write SetTaskIconID;
    property OnClick     : TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick  : TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnRightClick : TMouseEvent  read FOnRightClick write FonRightClick;
  end;

implementation

{$R Taskicon.res}

procedure TTaskIcon.SetActive(Value : boolean);
begin
  if value <> fActive then
    begin
      if Value = true then
        begin
          if MakeIcon(self) then fActive := true
        end
      else
        begin
          if KillIcon(self) then FActive := false;
        end;
    end;
end;

procedure TTaskIcon.SetIcon(Value : Ticon);
begin
  if Value <> fIcon then
    begin
      fIcon.Assign(value);
      if fActive = true then CHangeIcon(Self);
    end;
end;

procedure TTaskIcon.SetTaskIconID(Value : UINT);
begin
  if Value <> fTaskIconID then
    begin
      fTaskIconID := value;
      if fActive = true then ChangeIcon(Self);
    end;
end;

procedure TTaskIcon.SetToolTip(Value : string64);
begin
  if Value <> fToolTip then
    begin
      fToolTip := value;
      if fActive = true then CHangeIcon(Self);
    end;
end;

constructor TTaskIcon.create(aOwner : Tcomponent);
begin
  inherited create(aOwner);
  FIcon := TIcon.Create;
end;

destructor TTaskIcon.destroy;
begin
  if fActive = true then SetActive(False);
  FIcon.Free;
  inherited destroy;
end;

function TTaskIcon.MakeIcon(sender : TObject) : boolean;
begin
  with tnid do
    begin
      cbSize := sizeof(TNOTIFYICONDATA);
      wnd := handle;
      uID := fTaskIconID;
      uFlags := NIF_MESSAGE+NIF_ICON+NIF_TIP;
      hIcon := fIcon.Handle;
      StrPCopy(szTip,fToolTip);
      uCallbackMessage := WM_TASKICON;
      result := Shell_NotifyIcon(NIM_ADD,@tnid);
    end;
end;

function TTaskIcon.KillIcon(sender : Tobject) : boolean;
begin
  result := Shell_NotifyIcon(NIM_DELETE,@tnid);
end;

function TTaskIcon.ChangeIcon(sender : TObject) : boolean;
var tnid : TNOTIFYICONDATA;
begin
  with tnid do
    begin
      cbSize := sizeof(TNOTIFYICONDATA);
      wnd := handle;
      uID := fTaskIconID;
      uFlags := NIF_MESSAGE+NIF_ICON+NIF_TIP;
      hIcon := fIcon.Handle;
      StrPCopy(szTip,fToolTip);
      uCallbackMessage := WM_TASKICON;
      result := Shell_NotifyIcon(NIM_MODIFY,@tnid);
    end;
end;

procedure TTaskIcon.WMTASKICON(var msg : TMessage);
var MouseCo: Tpoint;
begin
  if msg.wParam = FTaskIconID then
    case msg.lParam of
      WM_LBUTTONDBLCLK   : if assigned (FOnDblClick) then FOnDblClick(self);
      WM_LBUTTONUP       : if assigned(FOnClick)then FOnClick(self);
      WM_RBUTTONUP       : if assigned (FOnRightClick)then
                           begin
                             GetCursorPos(MouseCo);
                             FOnRightClick(self,mbRight,[],MouseCo.x,MouseCo.y);
                           end;
    end;
end;

end.
