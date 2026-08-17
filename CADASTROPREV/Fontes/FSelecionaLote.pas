// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.12.2004
// Rotina      : Nova Rotina  SelecionaLoteBeneficioAbertoFuncef
// Pendencia   : ----
// Alteração   : Rotina igual a anterior (selecionalotebeneficioaberto) porem
//               retorna mais um parametro : a data de pagamento do lote
//------------------------------------------------------------------------------

unit FSelecionaLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, Grids,
  Wwdbigrd, Wwdbgrid;

type
  TfrmSelecionaLote = class(TfrmOkCancelar)
    wwDBGrid1: TwwDBGrid;
    qryLotesAbertos: TwwQuery;
    dsLotesAbertos: TwwDataSource;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    iIdLoteSelecionado : longint;
    sAnoMesPagamento   : string;
  public
    { Public declarations }

  end;

var
  frmSelecionaLote: TfrmSelecionaLote;
  function SelecionaLoteBeneficioAbertoFuncef( var psAnoMesPagamento  : string;
                                         var piflgIncluiMesConc : integer;
                                         piIdFundacao : Integer ) : longint;
  function SelecionaLoteFolhaBeneficio ( var psAnoMesPagamento  : string;
                                         var piflgIncluiMesConc : integer;
                                         var psDataPagamento    : string;
                                         piIdFundacao : Integer ) : longint;

implementation

uses UMensErro;

{$R *.DFM}

function SelecionaLoteBeneficioAbertoFuncef( var psAnoMesPagamento : string;
                                       var piflgIncluiMesConc : integer;
                                       piIdFundacao : Integer) : longint;
begin
   frmSelecionaLote := TFrmSelecionaLote.Create(Application);
   with frmSelecionaLote do
   begin
      iIdLoteSelecionado := -1;
      sAnoMesPagamento   := '';
      qryLotesAbertos.Close;
      qryLotesAbertos.ParamByName('IDFUNDACAO').AsInteger := piIdFundacao;
      qryLotesAbertos.Open;
      if qryLotesAbertos.IsEmpty
      then begin
         MsgDlg('Não existe lote de concessão aberto no momento. Verifique.','Informação',mtInformation,[mbOk,mbHelp],0);
         Result := iIdLoteSelecionado;
         frmSelecionaLote.Free;
         Exit;
      end;
      ShowModal;
      psAnoMesPagamento := sAnoMesPagamento;

      piflgIncluiMesConc:=qryLotesAbertos.FieldByName('FLGINCLUIMESCONC').Asinteger;
      Result            := iIdLoteSelecionado;
   end;
   frmSelecionaLote.Free;
end; // SelecionaLoteBeneficioAbertoFuncef

function SelecionaLoteFolhaBeneficio ( var psAnoMesPagamento  : string;
                                       var piflgIncluiMesConc : integer;
                                       var psDataPagamento    : string;
                                       piIdFundacao : Integer) : longint;
begin
   frmSelecionaLote := TFrmSelecionaLote.Create(Application);
   with frmSelecionaLote do
   begin
      iIdLoteSelecionado := -1;
      sAnoMesPagamento   := '';
      qryLotesAbertos.Close;
      qryLotesAbertos.ParamByName('IDFUNDACAO').AsInteger := piIdFundacao;
      qryLotesAbertos.Open;
      if qryLotesAbertos.IsEmpty
      then begin
         MsgDlg('Não existe lote de concessão aberto no momento. Verifique.','Informação',mtInformation,[mbOk,mbHelp],0);
         Result := iIdLoteSelecionado;
         frmSelecionaLote.Free;
         Exit;
      end;
      ShowModal;
      psAnoMesPagamento  := sAnoMesPagamento;
      piflgIncluiMesConc := qryLotesAbertos.FieldByName('FLGINCLUIMESCONC').Asinteger;
      psDataPagamento    := qryLotesAbertos.FieldByName('DATAPAGAMENTO').AsString;
      Result             := iIdLoteSelecionado;
   end;
   frmSelecionaLote.Free;
end; // SelecionaLoteFolhaBeneficio


procedure TfrmSelecionaLote.bbtnConfirmarClick(Sender: TObject);
begin
  if MsgDlg('Confirma o Lote Nº '+qryLotesAbertos.FieldByName('IdLote').AsString+' '+
            'referente a '+#13+' "'+qryLotesAbertos.FieldByName('Descricao').AsString+'" ?',
            'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
  then Abort
  else begin
      iIdLoteSelecionado := qryLotesAbertos.FieldByName('IdLote').AsInteger;
      sAnoMesPagamento   := qryLotesAbertos.FieldByName('MesReferencia').AsString;
  end;

  inherited;

end;

procedure TfrmSelecionaLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;
// nao permitir fazer free
end;

end.
