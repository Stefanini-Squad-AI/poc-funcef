unit ColorCheckListBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, StdCtrls, Graphics, ExtCtrls, CheckLst;

type
  TColorCheckListBox = class(TCheckListBox)
  private
    FBuffer: string;
    FTimer: TTimer;
  protected
    procedure KeyPress(var Key: char); override;
    procedure OnEnterCheckList(Sender: TObject);
    procedure OnExitCheckList(Sender: TObject);
    procedure OnTimerCheckList(Sender: TObject);
    procedure OnDrawItemCheckList(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure OnClickCheckCheckList(Sender: TObject);
    procedure OnKeyDownCheckList(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

procedure Register;

implementation

{$R *.DCR}

const
  CL_AMARELO_CLARO = $00C0FFFF;

constructor TColorCheckListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTimer := TTimer.Create(Self);

  Style := lbOwnerDrawFixed;
  FBuffer := '';
  OnEnter := OnEnterCheckList;
  OnExit := OnExitCheckList;
  OnClickCheck := OnClickCheckCheckList;
  OnDrawItem := OnDrawItemCheckList;
  OnKeyDown := OnKeyDownCheckList;
  FTimer.OnTimer := OnTimerCheckList;
  FTimer.Interval := 450;
end;

destructor TColorCheckListBox.Destroy;
begin
  FTimer.Free;
  inherited;
end;

procedure TColorCheckListBox.OnEnterCheckList(Sender: TObject);
begin
  FTimer.Enabled := true;
end;

procedure TColorCheckListBox.OnExitCheckList(Sender: TObject);
begin
  FTimer.Enabled := false;
end;

procedure TColorCheckListBox.KeyPress(var Key: char);
begin
  inherited;
  FTimer.Enabled := false;
  FBuffer := FBuffer + Key;
  Key := #0;
  FTimer.Enabled := true;
end;

procedure TColorCheckListBox.OnTimerCheckList(Sender: TObject);
var
  c, iPos: integer;
  sPesquisa: string;
begin
  if (FBuffer <> '') then
  begin
    sPesquisa := FBuffer;
    for c:=0 to length(sPesquisa) do
    begin
      iPos := SendMessage(Handle, LB_SELECTSTRING, -1, LongInt(PChar(sPesquisa)));
      if (iPos = LB_ERR) then
      begin
        if (sPesquisa <> '') then
          sPesquisa := copy(sPesquisa,1,length(sPesquisa)-1);
      end
      else
        break;
    end;      
    FBuffer := '';
  end;
end;

procedure TColorCheckListBox.OnDrawItemCheckList(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (TColorCheckListBox(Control).Canvas) do
  begin
    if (TColorCheckListBox(Control).Checked[Index]) then
      if (odSelected in State) then
      begin
        Brush.Color := clTeal;
        Font.Color := clWhite;
      end
      else
      begin
        Brush.Color := CL_AMARELO_CLARO;
        Font.Color := clBlack;
      end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TColorCheckListBox(Control).Items[Index]);
  end;
end;

procedure TColorCheckListBox.OnClickCheckCheckList(Sender: TObject);
var
  Rect: TRect;
begin
  Rect := TCustomListBox(Sender).ItemRect(TCustomListBox(Sender).ItemIndex);
  InvalidateRect(TCustomListBox(Sender).Handle, @Rect, false);
end;

procedure TColorCheckListBox.OnKeyDownCheckList(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    OnClickCheckCheckList(Sender);
end;

procedure Register;
begin
  RegisterComponents('RH', [TColorCheckListBox]);
end;

end.
