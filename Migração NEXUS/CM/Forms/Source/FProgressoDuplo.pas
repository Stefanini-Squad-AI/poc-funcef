unit FProgressoDuplo;
(*******************************************************************************
Analista:  andre tavares
Data    : 03/08/2005
Solução : - para que o form fique modal, desabilta a sua tarefa enquanto
incrementa suas variáveis de progresso.

(*******************************************************************************
Analista: Alex Pereira
Data    : 10/02/2004
Solução : Correção da exibição do form, utilizando a atribuição de propriedadades
          no mostaformprogresso
          Colocando o nome do módulo como caption da janela
*******************************************************************************)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, fcLabel, Gauges, usistema;

type
   TfrmProgressoDuplo = class(TForm)
      Animacao: TAnimate;
      lblContador: TLabel;
      btnCancelar: TBitBtn;
      lblProgress: TfcLabel;
      Panel1: TPanel;
      Gauge: TGauge;
      lblContador2: TLabel;
      lblProgress2: TfcLabel;
      Panel2: TPanel;
      Gauge2: TGauge;
      Temporizador: TTimer;

      procedure FormShow(Sender: TObject);
      procedure FormHide(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure TemporizadorTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);


   private  // Private declarations

      FMax, FMin, FPos     : Integer;
      FMax2, FMin2, FPos2  : Integer;
      bCancelou            : Boolean;
      bVisivel             : Boolean;
      bHabilitado          : Boolean;
      sLegenda, sLegenda2  : String;
      bTempo               : Boolean;

      procedure SetMax(const iMax: Integer);
      procedure SetMax2(const iMax: Integer);
      procedure SetMin(const iMin: Integer);
      procedure SetMin2(const iMin: Integer);
      procedure SetPos(const iPos: Integer);
      procedure SetPos2(const iPos: Integer);

      procedure SetHabilita(const Value: Boolean);
      procedure SetVisivel(const Value: Boolean);
      procedure SetLegenda(const Value: String);
      procedure SetLegenda2(const Value: String);


   public   // Public declarations

      property Max              : Integer   read FMax         write SetMax;
      property Min              : Integer   read FMin         write SetMin;
      property Pos              : Integer   read FPos         write SetPos;

      property Max2             : Integer   read FMax2        write SetMax2;
      property Min2             : Integer   read FMin2        write SetMin2;
      property Pos2             : Integer   read FPos2        write SetPos2;

      property Cancelou         : Boolean   read bCancelou;

      property Legenda          : String    read sLegenda     write SetLegenda;
      property Legenda2         : String    read sLegenda2    write SetLegenda2;

      property BotaoHabilitado  : Boolean   read bHabilitado  write SetHabilita;
      property BotaoVisivel     : Boolean   read bVisivel     write SetVisivel;

      procedure Temporiza(i: integer);

      procedure MostraFormProgressoDuplo(const sLegenda    : String;
                                         const sLegenda2   : String;
                                         const fMinimo     : Integer;
                                         const fMinimo2    : Integer;
                                         const fMaximo     : Integer;
                                         const fMaximo2    : Integer;
                                         const bVisivel    : Boolean;
                                         const bHabilitado : Boolean
                                        );

      procedure AndaFormProgressoDuplo(const fPosicao, fPosicao2: Integer);

      procedure EscondeFormProgressoDuplo;


   end;



var
  frmProgressoDuplo: TfrmProgressoDuplo;



implementation
{$R *.DFM}
uses
   UMensErro;  // MsgDlg




procedure TfrmProgressoDuplo.SetMax(const iMax: Integer);
begin
   if iMax < 0 then
   begin
      FMax                 := 0;
      Gauge.Visible        := False;
      lblProgress.Visible  := False;
      lblContador.Visible  := False;
   end
   else
   begin
      FMax                 := iMax;
      Gauge.Visible        := True;
      lblProgress.Visible  := True;
      lblContador.Visible  := True;
   end;

   Gauge.MaxValue := FMax;
end;



procedure TfrmProgressoDuplo.SetMax2(const iMax: Integer);
begin
   if iMax < 0 then
   begin
      FMax2                   := 0;
      Gauge2.Visible          := False;
      lblProgress2.Visible    := False;
      lblContador2.Visible    := False;
   end
   else
   begin
      FMax2                   := iMax;
      Gauge2.Visible          := True;
      lblProgress2.Visible    := True;
      lblContador2.Visible    := True;
   end;

   Gauge2.MaxValue := FMax2;
end;



procedure TfrmProgressoDuplo.SetMin(const iMin: Integer);
begin
   Gauge.MinValue    := iMin;
   FMin              := iMin;
end;



procedure TfrmProgressoDuplo.SetMin2(const iMin: Integer);
begin
   Gauge2.MinValue   := iMin;
   FMin2             := iMin;
end;



procedure TfrmProgressoDuplo.SetPos(const iPos: Integer);
begin
   if iPos < 0 then
   begin
      Gauge.Visible           := False;
      lblProgress.Visible     := False;
      lblContador.Visible     := False;
   end
   else
   begin
      if (iPos >= FMin) and (iPos <= FMax) then
      begin
         Gauge.Visible        := True;
         lblProgress.Visible  := True;
         lblContador.Visible  := True;

         Gauge.Progress       := iPos;
         FPos                 := iPos;
         lblContador.Caption  := FormatFloat('#0', FPos) + ' de ' + FormatFloat('#0', FMax);
      end;
   end;

//   Repaint;
   Application.ProcessMessages;
end;



procedure TfrmProgressoDuplo.SetPos2(const iPos: Integer);
begin
   if iPos < 0 then
   begin
      Gauge2.Visible          := False;
      lblProgress2.Visible    := False;
      lblContador2.Visible    := False;
   end
   else
   begin
      if (iPos >= FMin2) and (iPos <= FMax2) then
      begin
         Gauge2.Visible       := True;
         lblProgress2.Visible := True;
         lblContador2.Visible := True;

         Gauge2.Progress      := iPos;
         FPos2                := iPos;
         lblContador2.Caption := FormatFloat('#0', FPos2) + ' de ' + FormatFloat('#0', FMax2);
      end;
   end;

//   Repaint;
   Application.ProcessMessages;
end;



procedure TfrmProgressoDuplo.FormShow(Sender: TObject);
begin
   Animacao.Active      := True;
   bCancelou            := False; 

   Gauge.Progress       := FMin;
   Gauge2.Progress      := FMin2;

   Repaint;
   Application.ProcessMessages;
end;



procedure TfrmProgressoDuplo.FormHide(Sender: TObject);
begin
   Animacao.Active      := False;

   lblProgress.Caption  := '';
   lblContador.Caption  := FormatFloat('00000', 0) + ' de ' + FormatFloat('00000', 0);

   lblProgress2.Caption := '';
   lblContador2.Caption := FormatFloat('00000', 0) + ' de ' + FormatFloat('00000', 0);

   btnCancelar.Enabled  := True;

   Repaint;
   Application.ProcessMessages;

end;



procedure TfrmProgressoDuplo.btnCancelarClick(Sender: TObject);
begin
   btnCancelar.Enabled := False;

   if MsgDlg('Deseja realmente interromper a operação?', Sistema.NomeModulo,
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;
      bCancelou := True;

      lblProgress.Caption   := 'Cancelando operação...';
      Repaint;
      Temporiza(1);

      Hide;
   end
   else
   begin
      btnCancelar.Enabled := True;
      Repaint;
   end;

   Application.ProcessMessages;
end;



procedure TfrmProgressoDuplo.SetHabilita(const Value: Boolean);
begin
   bHabilitado          := Value;
   btnCancelar.Enabled  := bHabilitado;

   Repaint;
end;



procedure TfrmProgressoDuplo.SetVisivel(const Value: Boolean);
begin
   bVisivel             := Value;
   btnCancelar.Visible  := bVisivel;

   Repaint;
end;



procedure TfrmProgressoDuplo.SetLegenda(const Value: String);
begin
   lblProgress.Caption  := Value;
   lblContador.Caption  := FormatFloat('#0', FPos) + ' de ' + FormatFloat('#0', FMax);

   Repaint;
end;



procedure TfrmProgressoDuplo.SetLegenda2(const Value: String);
begin
   lblProgress2.Caption := Value;
   lblContador2.Caption := FormatFloat('#0', 0) + ' de ' + FormatFloat('#0', FMax2);

   Repaint;
end;



procedure TfrmProgressoDuplo.Temporiza(i: integer);
begin
{
   frmProgressoDuplo.bTempo := False;

   Temporizador.Interval := i * 1000;
   Temporizador.Enabled  := True;

   repeat
      Application.ProcessMessages;
   until
      frmProgressoDuplo.bTempo;

   Temporizador.Enabled  := False;
}
end;



procedure TfrmProgressoDuplo.TemporizadorTimer(Sender: TObject);
begin
   bTempo := True;
end;



procedure TfrmProgressoDuplo.MostraFormProgressoDuplo(const sLegenda    : String;
                                                      const sLegenda2   : String;
                                                      const fMinimo     : Integer;
                                                      const fMinimo2    : Integer;
                                                      const fMaximo     : Integer;
                                                      const fMaximo2    : Integer;
                                                      const bVisivel    : Boolean;
                                                      const bHabilitado : Boolean
                                                     );
begin
//   with frmProgressoDuplo do
//   begin
      Min               := fMinimo;
      Min2              := fMinimo2;
      Max               := fMaximo;
      Max2              := fMaximo2;

      BotaoVisivel      := bVisivel;
      BotaoHabilitado   := bHabilitado;

      Legenda           := sLegenda;
      Legenda2          := sLegenda2;

      Show;
//   end;  // with frmProgressoDuplo
end;



procedure TfrmProgressoDuplo.AndaFormProgressoDuplo(const fPosicao, fPosicao2: Integer);
var WindowList: Pointer; // andre tavares - para que o form fique modal
begin
   // Desabilita todos os formulários com exceção de FrmProgress
   Application.ProcessMessages; // andre tavares - para que o form fique modal - para ser possível clicar no botao parar
   WindowList := DisableTaskWindows(frmProgressoDuplo.Handle); // andre tavares - para que o form fique modal
   try
     if not bCancelou then // andre tavares - retirei do formshow e coloquei aqui
       frmProgressoDuplo.Show; // andre tavares - para que o form fique modal
     // manipulação de variáveis de incremento
     frmProgressoDuplo.Pos  := fPosicao;
     frmProgressoDuplo.Pos2 := fPosicao2;

   finally
     // Reabilita todos os formulários
     EnableTaskWindows(WindowList);// andre tavares - para que o form fique modal
     Application.ProcessMessages;
   end;
end;



procedure TfrmProgressoDuplo.EscondeFormProgressoDuplo;
begin
   frmProgressoDuplo.Hide;
end;



procedure TfrmProgressoDuplo.FormCreate(Sender: TObject);
begin
  Caption := Sistema.NomeModulo;
end;

end.
