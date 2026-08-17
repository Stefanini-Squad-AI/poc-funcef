//---------------------------------------------------------------------------------------------------
//Pendência   : SOL 253577/17604 PPM 999484
//Responsável : Helio Lima Custodio
//Data        : 03/12/2015
//Descrição   : Correção da posição da janela.
//---------------------------------------------------------------------------------------------------
//Pendência   : SOL 156374 KINTANA 1248134
//Responsável : BRUNO AZEVEDO
//Data        : 06/05/2011
//Descrição   : No windows vista, a mensagem não era exibida. Modificado o "AutoSize" do component
//              "Animate1" para false.
//---------------------------------------------------------------------------------------------------
unit fAguarde;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmAguarde = class(TForm)
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
  end;                     

var
  frmAguarde: TfrmAguarde;

implementation

{$R *.DFM}

procedure TfrmAguarde.Mostra(msg:string);
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
            Left := StrToInt(FloatToStr(Int((Screen.Width - Width) / 2))); //Helio - SOL Nº 253577/17604 PPM Nº 999484
         end;
     end;
//     Invalidate;
     lblMensagem.Repaint;
end;

procedure TfrmAguarde.Apaga;
begin
     Visible := false;
     Width := 312;
     pbAguarde.Width := 244;
     lblMensagem.Caption := '';
     Screen.Cursor := crDefault;
end;

procedure TfrmAguarde.FormCreate(Sender: TObject);
begin
     Cursor := crHourGlass;
end;

procedure TfrmAguarde.SetMax(iMax:integer);
begin
  If frmAguarde <> nil Then
  Begin
     if iMax <= 0 then
     begin
          frmAguarde.pbAguarde.Visible := false;
          FMax := 0;
     end
     else
     begin
          frmAguarde.pbAguarde.Visible := true;
          FMax := iMax;
     end;

     frmAguarde.pbAguarde.Max := FMax;
  End;
end;

procedure TfrmAguarde.SetMin(iMin:integer);
begin
  If frmAguarde <> nil Then
  Begin
     frmAguarde.pbAguarde.Min := iMin;
     FMin := iMin;
  End;
end;

procedure TfrmAguarde.SetPos(iPos:integer);
begin
  If frmAguarde <> nil Then
  Begin
     if (iPos >= FMin) and (iPos <= FMax) then
     begin
          frmAguarde.pbAguarde.Position := iPos;
          FPos := iPos;
     end;
     Application.ProcessMessages;
  End;
end;
procedure TfrmAguarde.FormShow(Sender: TObject);
begin
     Animate1.Active := true;
end;

procedure TfrmAguarde.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Animate1.Active := false;

end;

procedure TfrmAguarde.FormResize(Sender: TObject);
begin
   Position := poScreenCenter;
   lblMensagem.Refresh;
   Invalidate;
end;

end.
