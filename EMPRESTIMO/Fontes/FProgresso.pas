unit FProgresso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, fcLabel, Gauges;

type
  TfrmProgresso = class(TForm)
    Animacao: TAnimate;
    lblContador: TLabel;
    btnCancelar: TBitBtn;
    lblProgress: TfcLabel;
    Panel1: TPanel;
    Gauge: TGauge;

    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);


  private { Private declarations }

    FMax, FMin, FPos : Integer;
    bCancelou        : Boolean;
    bVisivel         : Boolean;
    bHabilitado      : Boolean;
    sLegenda         : String;

    procedure SetMax(const iMax: Integer);
    procedure SetMin(const iMin: Integer);
    procedure SetPos(const iPos: Integer);
    procedure SetHabilita(const Value: Boolean);
    procedure SetVisivel(const Value: Boolean);
    procedure SetLegenda(const Value: String);


  public { Public declarations }

    property Max: Integer read FMax write SetMax;
    property Min: Integer read FMin write SetMin;
    property Pos: Integer read FPos write SetPos;
    property Cancelou: Boolean read bCancelou;
    property Legenda : String  read sLegenda write SetLegenda;
    property BotaoHabilitado : Boolean read bHabilitado write SetHabilita;
    property BotaoVisivel : Boolean read bVisivel write SetVisivel;

  end;



var
  frmProgresso: TfrmProgresso;



implementation
{$R *.DFM}
uses
   UMensErro,  (* MsgDlg *)
   dEmptmo;    (* Temporiza *)




procedure TfrmProgresso.SetMax(const iMax: Integer);
begin
   if iMax <= 0 then begin
      Gauge.Visible        := False;
      FMax                 := 0;
   end else begin
      Gauge.Visible        := True;
      FMax                 := iMax;
   end;

   Gauge.MaxValue    := FMax;
end;



procedure TfrmProgresso.SetMin(const iMin: Integer);
begin
   Gauge.MinValue    := iMin;
   FMin              := iMin;
end;



procedure TfrmProgresso.SetPos(const iPos: Integer);
begin
   if (iPos >= FMin) and (iPos <= FMax) then begin
      Gauge.Progress       := iPos;
      FPos                 := iPos;
      lblContador.Caption  := FormatFloat('#0', FPos) + ' de ' + FormatFloat('#0', FMax);
   end;

   Application.ProcessMessages;
end;



procedure TfrmProgresso.FormShow(Sender: TObject);
begin
   Animacao.Active      := True;
   bCancelou            := False;

   Gauge.Progress       := FMin;

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

   if MsgDlg('Deseja realmente interromper a operação?','Empréstimo',
              mtConfirmation,[mbYes,mbNo],0) = mrYes then begin

      Repaint;
      bCancelou := True;

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
end;



end.
