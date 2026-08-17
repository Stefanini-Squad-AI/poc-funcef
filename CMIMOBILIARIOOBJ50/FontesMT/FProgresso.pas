unit FProgresso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, fcLabel;

type
  TfrmProgresso = class(TForm)
    Animacao: TAnimate;
    ProgressBar: TProgressBar;
    lblContador: TLabel;
    btnCancelar: TBitBtn;
    lblProgress: TfcLabel;
    Temporizador: TTimer;
    procedure btnCancelarClick(Sender: TObject);
    // Espera i segundos sem fazer nada...
    procedure Temporiza(i: integer);
    procedure TemporizadorTimer(Sender: TObject);


  private
    FCancelou: boolean;
    bTempo: boolean;
    procedure SetCancelou(const Value: boolean); { Private declarations }

  public { Public declarations }
    property Cancelou: boolean read FCancelou write SetCancelou;

    procedure MostraFormProgresso(const sLegenda    : String;
                                  const bVisivel    : Boolean = True;
                                  const bHabilitado : Boolean = True;
                                  const bProgresso  : Boolean = True;
                                  const fMinimo     : Integer = 0;
                                  const fMaximo     : Integer = 0);
    procedure AndaFormProgresso  (const iPos: Integer;
                                  const iMax: integer = -1);
    procedure EscondeFormProgresso;


  end;


var
  frmProgresso: TfrmProgresso;



implementation

{$R *.DFM}
uses
   UMensErro;  (* MsgDlg *)


procedure TfrmProgresso.btnCancelarClick(Sender: TObject);
begin
   btnCancelar.Enabled := False;

   if MsgDlg('Deseja realmente interromper a operação?','Imobiliário',
              mtConfirmation,[mbYes,mbNo],0) = mrYes then begin

      Repaint;
      FCancelou := True;

      lblProgress.Caption   := 'Cancelando operação...';
      Repaint;
      Temporiza(1);

      Hide;

   end else begin
      btnCancelar.Enabled := True;
      Repaint;
   end;

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

procedure TfrmProgresso.TemporizadorTimer(Sender: TObject);
begin
   bTempo := True;
end;

procedure TfrmProgresso.MostraFormProgresso(const sLegenda : String;
                                            const bVisivel    : Boolean = True;
                                            const bHabilitado : Boolean = True;
                                            const bProgresso  : Boolean = True;
                                            const fMinimo     : Integer = 0;
                                            const fMaximo     : Integer = 0
                                           );
begin
   FCancelou := False;

   ProgressBar.Min := 0;
   ProgressBar.Max := 0;
   ProgressBar.Position := 0;
   ProgressBar.Visible := bProgresso;
   lblContador.Caption := FormatFloat('#0', 0) + ' de ' + FormatFloat('#0', 0);
   lblContador.Visible := bProgresso;
   btnCancelar.Visible := bVisivel;
   btnCancelar.Enabled := bHabilitado;
   lblProgress.Caption := sLegenda;
   if bProgresso then begin
     lblProgress.Top := 4;
     lblProgress.Font.Size := 8;
   end else begin
     lblProgress.Top := 26;
     lblProgress.Font.Size := 11;
   end;
   Show;
end;

procedure TfrmProgresso.AndaFormProgresso(const iPos: Integer; const iMax: integer);
begin
   lblContador.Caption  := FormatFloat('#0', iPos) + ' de ' + FormatFloat('#0', iMax);
   ProgressBar.Position := iPos;
   // necessário devido ao 3 camadas onde apenas no ctrlobject a informação max é obtida
   ProgressBar.Max := iMax;
   Application.ProcessMessages;
   Repaint;
end;

procedure TfrmProgresso.EscondeFormProgresso;
begin
   Hide;
end;

procedure TfrmProgresso.SetCancelou(const Value: boolean);
begin
  FCancelou := Value;
end;

end.


