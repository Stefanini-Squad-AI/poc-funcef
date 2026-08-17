// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      :
// Autor(a)    : Leo
// Data        : 24/04/2003
// Alteração   : correção na leitura do parâmetro da regra de valor máximo de rateio
// -----------------------------------------------------------------------------

unit FLerRegraContribReserva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, MAHlpBtn, Buttons, TB97, ExtCtrls, wwdblook, Db,
  DBTables, Wwquery, Wwdatsrc, IvDictio, IvMulti, IvEMulti, TB97Tlbr;

type
  TfrmLerRegraContribReserva = class(TfrmOkCancelar)
    qryRegra: TwwQuery;
    lbl4: TLabel;
    dblkpcmbRegraCalculoReserva: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    lblPlano: TLabel;
    gpConcessao: TGroupBox;
    edPercentual: TEdit;
    Label1: TLabel;
    lblReserva: TLabel;
    lblContribuicao: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblkpcmbValorRateio: TwwDBLookupCombo;
    qryRegra2: TwwQuery;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
   {Private declarations}
   bConfirmou  : boolean;
   iIdRegra, iIdRegraValorMaxRateio    : longint;
   sPercentual : string;
  public
   {Public declarations}
  end;

var
  frmLerRegraContribReserva: TfrmLerRegraContribReserva;

  function  LerRegraContribReserva( psNomePlano, psNomeReserva, psNomeContrib : string;
                                  var psPercentual : string;
                                  var piIdRegra, piIdRegraValorMaxRateio    : longint) : boolean;


implementation

uses UMensErro; 

{$R *.DFM}

function  LerRegraContribReserva( psNomePlano, psNomeReserva, psNomeContrib : string;
                                  var psPercentual : string;
                                  var piIdRegra, piIdRegraValorMaxRateio    : longint) : boolean;
begin
   Result := False;
   frmLerRegraContribReserva := TfrmLerRegraContribReserva.Create(Application);
   with frmLerRegraContribReserva do
   begin
      lblPlano.Caption        := 'Plano '     + psNomePlano;
      lblReserva.Caption      := 'Reserva '   + psNomeReserva;
      lblContribuicao.Caption := 'Contribuição ' + psNomeContrib;
      iIdRegra                := piIdregra;
      iIdRegraValorMaxRateio  := piIdRegraValorMaxRateio;
      sPercentual             := psPercentual;
      bConfirmou              := False;

      ShowModal;

      if bConfirmou
      then begin
         psPercentual := Trim(edPercentual.Text);
         if Trim(dblkpcmbRegraCalculoReserva.Text) <> ''
         then piIdRegra    := qryRegra.FieldByName('IdRegra').AsInteger
         else piIdRegra    := -1;

         if Trim(dblkpcmbValorRateio.Text) <> ''
         then piIdRegraValorMaxRateio    := qryRegra2.FieldByName('IdRegra').AsInteger
         else piIdRegraValorMaxRateio    := -1;

         Result := True;
      end;
   end;

   frmLerRegraContribReserva.Free;
end; // LerRegraContribReserva

procedure TfrmLerRegraContribReserva.FormActivate(Sender: TObject);
begin
  inherited;
  qryRegra.Close;
  qryRegra.Open;
  qryRegra2.Close;
  qryRegra2.Open;

  if iIdRegra > 0
  then begin
     qryRegra.Locate('IDREGRA', iIdRegra, [loCaseInsensitive, loPartialKey]);
     dblkpcmbRegraCalculoReserva.Text := qryRegra.FieldByName('NOMEREGRA').AsString;
     dblkpcmbRegraCalculoReserva.PerformSearch;
  end
  else dblkpcmbRegraCalculoReserva.Text := '';

  if iIdRegraValorMaxRateio > 0
  then begin
     qryRegra2.Locate('IDREGRA', iIdRegraValorMaxRateio, [loCaseInsensitive, loPartialKey]);
     dblkpcmbValorRateio.Text := qryRegra2.FieldByName('NOMEREGRA').AsString;
     dblkpcmbValorRateio.PerformSearch;
  end
  else dblkpcmbValorRateio.Text := '';

  edPercentual.Text := sPercentual;
  edPercentual.SetFocus;
end;

procedure TfrmLerRegraContribReserva.bbtnConfirmarClick(Sender: TObject);
begin
//  inherited;
  if Trim(edPercentual.Text) = '' then edPercentual.Text := '0';
  ModalResult := mrOk;
  bConfirmou  := True;
  Close;
end;

procedure TfrmLerRegraContribReserva.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
  bConfirmou  := False;
end;

procedure TfrmLerRegraContribReserva.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
  bConfirmou  := False;
end;

procedure TfrmLerRegraContribReserva.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited; // não executar cafree 

end;


end.

