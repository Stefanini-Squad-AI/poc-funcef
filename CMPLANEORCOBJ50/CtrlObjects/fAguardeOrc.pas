unit fAguardeOrc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmAguardeOrc = class(TForm)
    pbAguarde: TProgressBar;
    Animate1: TAnimate;
    lblMensagem: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    FMax, FMin, FPos : integer;
    procedure SetMax(iMax:integer);
    procedure SetMin(iMin:integer);
    procedure SetPos(iPos:integer);
  published
     Property Max : integer read FMax write SetMax;
     Property Min : integer read FMin write SetMin;
     Property Pos : integer read FPos write SetPos;
  public
    { Public declarations }
    procedure Mostra(msg:string);
    procedure Apaga;
  end;                     

var
  frmAguardeOrc: TfrmAguardeOrc;

implementation

{$R *.DFM}

procedure TfrmAguardeOrc.Mostra(msg:string);

begin
     Screen.Cursor := crHourGlass;
     Visible := true;
     if msg='' then
        lblMensagem.caption := 'Aguarde'
     else begin
        lblMensagem.caption := msg;
     end;
     lblMensagem.Repaint;
end;

procedure TfrmAguardeOrc.Apaga;
begin
     Visible := false;
     lblMensagem.Caption := '';
     Screen.Cursor := crDefault;
end;

procedure TfrmAguardeOrc.FormCreate(Sender: TObject);
begin
     Cursor := crHourGlass;
end;

procedure TfrmAguardeOrc.SetMax(iMax:integer);
begin
  If frmAguardeOrc <> nil Then
  Begin
     if iMax <= 0 then
     begin
          frmAguardeOrc.pbAguarde.Visible := false;
          FMax := 0;
     end
     else
     begin
          frmAguardeOrc.pbAguarde.Visible := true;
          FMax := iMax;
     end;

     frmAguardeOrc.pbAguarde.Max := FMax;
  End;
end;

procedure TfrmAguardeOrc.SetMin(iMin:integer);
begin
  If frmAguardeOrc <> nil Then
  Begin
     frmAguardeOrc.pbAguarde.Min := iMin;
     FMin := iMin;
  End;
end;

procedure TfrmAguardeOrc.SetPos(iPos:integer);
begin
  If frmAguardeOrc <> nil Then
  Begin
     if (iPos >= FMin) and (iPos <= FMax) then
     begin
          frmAguardeOrc.pbAguarde.Position := iPos;
          FPos := iPos;
     end;
     Application.ProcessMessages;
  End;
end;
procedure TfrmAguardeOrc.FormShow(Sender: TObject);
begin
     Animate1.Active := true;
end;

procedure TfrmAguardeOrc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Animate1.Active := false;

end;

procedure TfrmAguardeOrc.FormResize(Sender: TObject);
begin
   Position := poScreenCenter;
   lblMensagem.Refresh;
   Invalidate;
end;

end.
