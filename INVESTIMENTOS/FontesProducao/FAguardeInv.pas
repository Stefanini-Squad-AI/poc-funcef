unit fAguardeInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmAguardeInv = class(TForm)
    lblMensagem: TLabel;
    pbAguarde: TProgressBar;
    Animate1: TAnimate;
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
    procedure Incrementa(iPasso: Integer = 1);
  end;

var
  frmAguardeInv: TfrmAguardeInv;

implementation

{$R *.DFM}

procedure TfrmAguardeInv.Mostra(msg:string);
var iAjuste: Integer;
begin
     Screen.Cursor := crHourGlass;
     Visible := true;
     if msg='' then
        lblMensagem.caption := 'Aguarde'
     else begin
         lblMensagem.caption := msg;
         if lblMensagem.Width > pbAguarde.Width then begin
            iAjuste := (lblMensagem.Width - pbAguarde.Width);
            Width := Width + iAjuste;
            pbAguarde.Width := pbAguarde.Width + iAjuste;
            Left := StrToInt(FloatToStr(Int((802 - Width) / 2)));
            Height := (80 + (lblMensagem.Height - 16));
            pbAguarde.Top := (30 + (lblMensagem.Height - 16));
         end;
     end;
     lblMensagem.Repaint;
end;

procedure TfrmAguardeInv.Apaga;
begin
     Visible := false;
     frmAguardeInv.Width := 312;
     pbAguarde.Width := 244;
     lblMensagem.Caption := '';
     Screen.Cursor := crDefault;
end;

procedure TfrmAguardeInv.FormCreate(Sender: TObject);
begin
     Cursor := crHourGlass;

end;

procedure TfrmAguardeInv.SetMax(iMax:integer);
begin
     if iMax <= 0 then
     begin
          pbAguarde.Visible := false;
          FMax := 0;
     end
     else
     begin
          pbAguarde.Visible := true;
          FMax := iMax;
     end;
     pbAguarde.Max := FMax;
end;

procedure TfrmAguardeInv.SetMin(iMin:integer);
begin
     pbAguarde.Min := iMin;
     FMin := iMin;
end;

procedure TfrmAguardeInv.SetPos(iPos:integer);
begin
     if (iPos >= FMin) and (iPos <= FMax) then
     begin
          pbAguarde.Position := iPos;
          FPos := iPos;
     end;
     Application.ProcessMessages;
end;
procedure TfrmAguardeInv.FormShow(Sender: TObject);
begin
     Animate1.Active := true;
end;

procedure TfrmAguardeInv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Animate1.Active := false;

end;

procedure TfrmAguardeInv.FormResize(Sender: TObject);
begin
   Position := poScreenCenter;
   lblMensagem.Refresh;
   Invalidate;
end;

procedure TfrmAguardeInv.Incrementa(iPasso: Integer = 1);
begin
   frmAguardeInv.Pos := frmAguardeInv.Pos + iPasso;
end;

end.


