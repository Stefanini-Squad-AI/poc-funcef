(*******************************************************************************
Analista:  andre tavares
Data    : 03/08/2005
Solução : - para que o form fique modal, desabilta a sua tarefa enquanto
incrementa suas variáveis de progresso.
********************************************************************************)
unit FProgresso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, fcLabel, Gauges, uSistema;

type
   TfrmProgresso = class(TForm)
      Animacao: TAnimate;
      lblContador: TLabel;
      btnCancelar: TBitBtn;
      lblProgress: TfcLabel;
      Panel1: TPanel;
      Gauge: TGauge;
      Temporizador: TTimer;

      procedure FormShow(Sender: TObject);
      procedure FormHide(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure TemporizadorTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);


   private  // Private declarations

      FMax, FMin, FPos  : Integer;
      FCancelou         : Boolean;
      bVisivel          : Boolean;
      bHabilitado       : Boolean;
      sLegenda          : String;
      bTempo            : Boolean;

      procedure SetMax(const Value: Integer);
      procedure SetMin(const Value: Integer);
      procedure SetPos(const Value: Integer);

      procedure SetHabilita(const Value: Boolean);
      procedure SetVisivel(const Value: Boolean);
      procedure SetLegenda(const Value: String);

      procedure SetCancelou(const Value: boolean);


   public   // Public declarations

      property Max               : Integer   read FMax         write SetMax;
      property Min               : Integer   read FMin         write SetMin;
      property Pos               : Integer   read FPos         write SetPos;

      property Cancelou          : Boolean   read FCancelou    write SetCancelou;

      property Legenda           : String    read sLegenda     write SetLegenda;
      property BotaoHabilitado   : Boolean   read bHabilitado  write SetHabilita;
      property BotaoVisivel      : Boolean   read bVisivel     write SetVisivel;

      procedure Temporiza(i: integer);

      procedure MostraFormProgresso(const sPLegenda    : String;
                                    const btVisivel    : Boolean = True;
                                    const btHabilitado : Boolean = True;
                                    const bProgresso  : Boolean = True;
                                    const fMinimo     : Integer = 0;
                                    const fMaximo     : Integer = 0
                                   );

      procedure AndaFormProgresso(const fPosicao: Integer;
                                  const fMaximo : Integer = -1
                                 );

      procedure EscondeFormProgresso;

   end;



var
  frmProgresso: TfrmProgresso;



implementation
{$R *.DFM}
uses
   UMensErro;  // MsgDlg




procedure TfrmProgresso.SetMax(const Value: Integer);
begin
   if Value <= 0 then
   begin
      Gauge.Visible        := False;
//      FMax                 := 0;
   end
   else
   begin
      Gauge.Visible        := True;
      FMax                 := Value;
   end;

   Gauge.MaxValue    := Value;
end;



procedure TfrmProgresso.SetMin(const Value: Integer);
begin
   Gauge.MinValue    := Value;
//   FMin              := iMin;
end;



procedure TfrmProgresso.SetPos(const Value: Integer);
begin
   if (Value >= FMin) and (Value <= FMax) then
   begin
      Gauge.Progress       := Value;
//      FPos                 := iPos;
      lblContador.Caption  := FormatFloat('#0', Value) + ' de ' + FormatFloat('#0', FMax);
   end;

   Application.ProcessMessages;
end;



procedure TfrmProgresso.FormShow(Sender: TObject);
begin
   Animacao.Active      := True;
   FCancelou            := False;

   Gauge.Progress       := FMin;

   Repaint;
   Application.ProcessMessages;
end;



procedure TfrmProgresso.FormHide(Sender: TObject);
begin
   Animacao.Active      := False;

   lblProgress.Caption  := '';
   lblContador.Caption  := FormatFloat('00000', 0) + ' de ' + FormatFloat('00000', 0);

   btnCancelar.Enabled  := True;

   Application.ProcessMessages;
end;



procedure TfrmProgresso.btnCancelarClick(Sender: TObject);
begin
   btnCancelar.Enabled := False;

   if MsgDlg('Deseja realmente interromper a operação?', Sistema.NomeModulo,
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;
      FCancelou := True;

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



procedure TfrmProgresso.SetHabilita(const Value: Boolean);
begin
   bHabilitado          := Value;
   btnCancelar.Enabled  := bHabilitado;

   Repaint;
end;



procedure TfrmProgresso.SetVisivel(const Value: Boolean);
begin
   bVisivel             := Value;
   btnCancelar.Visible  := bVisivel;

   Repaint;
end;



procedure TfrmProgresso.SetLegenda(const Value: String);
begin
   lblProgress.Caption  := Value;
   lblContador.Caption  := FormatFloat('#0', 0) + ' de ' + FormatFloat('#0', FMax);

   Repaint;
   Application.ProcessMessages;
end;



procedure TfrmProgresso.Temporiza(i: integer);
begin
   frmProgresso.bTempo := False;

   Temporizador.Interval := i * 1000;
   Temporizador.Enabled  := True;

   repeat
      Application.ProcessMessages;
   until
      frmProgresso.bTempo;

   Temporizador.Enabled  := False;
end;



procedure TfrmProgresso.MostraFormProgresso(const sPLegenda    : String;
                                            const btVisivel    : Boolean = True;
                                            const btHabilitado : Boolean = True;
                                            const bProgresso  : Boolean = True;
                                            const fMinimo     : Integer = 0;
                                            const fMaximo     : Integer = 0
                                           );
begin
//   with frmProgresso do
//   begin
      Min               := fMinimo;
      Max               := fMaximo;
      BotaoVisivel{ BotaoVisivel }     := btVisivel;
      BotaoHabilitado { BotaoHabilitado }  := btHabilitado;
      Legenda           := sPLegenda;
      frmProgresso.Show;
//   end;
end;



procedure TfrmProgresso.AndaFormProgresso(const fPosicao: Integer;
                                          const fMaximo : Integer = -1
                                         );
var WindowList: Pointer; // andre tavares - para que o form fique modal
begin
   Application.ProcessMessages; // andre tavares - para que o form fique modal - para ser possível clicar no botao parar
   WindowList := DisableTaskWindows(frmProgresso.Handle); // andre tavares - para que o form fique modal
   try

     if not FCancelou then
       frmProgresso.Show; // andre tavares - para que o form fique modal

     // manipulação de variáveis de incremento
     if fMaximo > 0 then
     begin
        frmProgresso.Max  := fMaximo;
     end;
     frmProgresso.Pos     := fPosicao;

   finally
     // Reabilita todos os formulários
     EnableTaskWindows(WindowList);// andre tavares - para que o form fique modal
     Application.ProcessMessages;
   end;
   
end;



procedure TfrmProgresso.EscondeFormProgresso;
begin
   frmProgresso.Hide;
end;



procedure TfrmProgresso.SetCancelou(const Value: boolean);
begin
  FCancelou := Value;
end;



procedure TfrmProgresso.TemporizadorTimer(Sender: TObject);
begin
   bTempo := True;
end;

procedure TfrmProgresso.FormCreate(Sender: TObject);
begin
  Caption := Sistema.NomeModulo;
end;

end.
