unit FCMEspera;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmCMEspera = class(TForm)
    lblMensagem: TLabel;
    Progress: TProgressBar;
    Animacao: TAnimate;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);

  private { Private declarations }
    FMax, FMin, FPos : integer;
    procedure SetMax(iMax:integer);
    procedure SetMin(iMin:integer);
    procedure SetPos(iPos:integer);

  published { Published declarations }
     Property Max : integer read FMax write SetMax;
     Property Min : integer read FMin write SetMin;
     Property Pos : integer read FPos write SetPos;

  public { Public declarations }
    procedure Config(sTitulo, sTexto: string; bProgress: boolean);
    procedure Mostra;
    procedure Esconde;

  end;



var
  frmCMEspera: TfrmCMEspera;



implementation
{$R *.DFM}


procedure TfrmCMEspera.Config(sTitulo, sTexto: string; bProgress: boolean);
begin
   Caption := sTitulo;
   if sTitulo = '' then Caption := 'Aguarde';

   lblMensagem.Caption := sTexto;
   if sTexto = '' then lblMensagem.Caption := 'Aguarde...';

   if Progress.Width < lblMensagem.Width then Progress.Width := lblMensagem.Width;

   if bProgress then begin
      Progress.Visible  := True;
      lblMensagem.Top   := 14;
      Width             := Progress.Width + 85;
   end else begin
      Progress.Visible  := False;
      lblMensagem.Top   := 20;
      Width             := lblMensagem.Width + 85;
   end;

   Left := (Application.MainForm.Width div 2) - (Width div 2);
end;



procedure TfrmCMEspera.Mostra;
begin
   Visible := True;
end;



procedure TfrmCMEspera.Esconde;
begin
   Visible := False;
end;



procedure TfrmCMEspera.SetMax(iMax:integer);
begin
   if iMax <= 0 then begin
      Progress.Visible := False;
      FMax := 0;
   end else begin
      Progress.Visible := True;
      FMax := iMax;
   end;

   Progress.Max := FMax;
end;



procedure TfrmCMEspera.SetMin(iMin:integer);
begin
   Progress.Min := iMin;
   FMin := iMin;
end;



procedure TfrmCMEspera.SetPos(iPos:integer);
begin
   if (iPos >= FMin) and (iPos <= FMax) then begin
      Progress.Position := iPos;
      FPos := iPos;
   end;
end;



procedure TfrmCMEspera.FormShow(Sender: TObject);
begin
   Animacao.Active := True;
end;



procedure TfrmCMEspera.FormHide(Sender: TObject);
begin
   Animacao.Active := False;
end;



end.



