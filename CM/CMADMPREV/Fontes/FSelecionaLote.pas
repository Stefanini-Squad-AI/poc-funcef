// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : edilaine
// SIG.........: 35577
// Data        : 21/12/2016
// Rotina      : Nova Rotina  SelecionaLoteNormal
// Alteração   : Ajustes para Equacionamento - Tratamento de divergencia com recebimento
//               no proximo beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 07.12.2004
// Rotina      : Nova Rotina  SelecionaLoteFolhaBeneficio
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
  function SelecionaLoteBeneficioAberto( var psAnoMesPagamento  : string;
                                         var piflgIncluiMesConc : integer) : longint;
  function SelecionaLoteFolhaBeneficio ( var psAnoMesPagamento  : string;
                                         var piflgIncluiMesConc : integer;
                                         var psDataPagamento    : string) : longint;

  function SelecionaLoteNormal ( var psAnoMesPagamento  : string;
                                 var psDataPagamento    : string) : longint;     // edilaine - SIG35577

implementation

uses UMensErro, UAdmPrev;

{$R *.DFM}

function SelecionaLoteBeneficioAberto( var psAnoMesPagamento : string;
     var piflgIncluiMesConc : integer) : longint;
begin
   frmSelecionaLote := TFrmSelecionaLote.Create(Application);
   with frmSelecionaLote do
   begin
      iIdLoteSelecionado := -1;
      sAnoMesPagamento   := '';
      qryLotesAbertos.Close;
      qryLotesAbertos.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
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
end; // SelecionaLoteBeneficioAberto

function SelecionaLoteFolhaBeneficio ( var psAnoMesPagamento  : string;
                                       var piflgIncluiMesConc : integer;
                                       var psDataPagamento    : string) : longint;
begin
   frmSelecionaLote := TFrmSelecionaLote.Create(Application);
   with frmSelecionaLote do
   begin
      iIdLoteSelecionado := -1;
      sAnoMesPagamento   := '';
      qryLotesAbertos.Close;
      qryLotesAbertos.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
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

// edilaine - SIG35577 inicio
function SelecionaLoteNormal( var psAnoMesPagamento  : string;
                              var psDataPagamento    : string) : longint;
begin
   frmSelecionaLote := TFrmSelecionaLote.Create(Application);
   with frmSelecionaLote do
   begin
      iIdLoteSelecionado := -1;
      sAnoMesPagamento   := '';
      qryLotesAbertos.Close;
      qryLotesAbertos.SQL.Clear;
      qryLotesAbertos.SQL.Add('SELECT C.IDLOTE, C.DESCRICAO, C.MESREFERENCIA, 0 AS FECHALOTE,  ');
      qryLotesAbertos.SQL.Add('       NVL(C.FLGINCLUIMESCONC,1) FLGINCLUIMESCONC, DATAPAGAMENTO');
      qryLotesAbertos.SQL.Add('  FROM CTRLINTERFACE C');
      qryLotesAbertos.SQL.Add(' WHERE C.TIPO = ''B'' ');
      qryLotesAbertos.SQL.Add('   AND C.FLGRESGATEPARCELADO = 0 ');
      qryLotesAbertos.SQL.Add('   AND FLGTIPOFOLHA = 0          ');
      qryLotesAbertos.SQL.Add('   AND FLGCONCESSAO = 0          ');
      qryLotesAbertos.SQL.Add('   AND FLGIDATMP = 0             ');
      qryLotesAbertos.SQL.Add(' ORDER BY C.MESREFERENCIA DESC, C.IDLOTE DESC, C.DESCRICAO ');
      qryLotesAbertos.Open;
      if qryLotesAbertos.IsEmpty
      then begin
         MsgDlg('Não existe lote aberto no momento. Verifique.','Informação',mtInformation,[mbOk,mbHelp],0);
         Result := iIdLoteSelecionado;
         frmSelecionaLote.Free;
         Exit;
      end;
      ShowModal;
      psAnoMesPagamento  := sAnoMesPagamento;
      psDataPagamento    := qryLotesAbertos.FieldByName('DATAPAGAMENTO').AsString;
      Result             := iIdLoteSelecionado;
   end;
   frmSelecionaLote.Free;
end; // SelecionaLoteNormal
// edilaine - SIG35577 fim


end.
