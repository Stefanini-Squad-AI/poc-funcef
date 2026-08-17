// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748 KINTANA 821023
//Responsável : MARCIO DENILSON
//Data        : 25/01/2011
//Descrição   : Desenvolvimento inicial da tela
//--------------------------------------------------------------------------------

unit FSelecionaLoteEF;

interface

uses                 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, Grids,
  Wwdbigrd, Wwdbgrid;

type
  TfrmSelecionaLoteEF = class(TfrmOkCancelar)
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
   class function SelecionaLoteFolhaBeneficio ( var psAnoMesPagamento  : string;
                                                var psDataPagamento    : string) : longint;
  end;

var
  frmSelecionaLoteEF: TfrmSelecionaLoteEF;

implementation

uses UMensErro;

{$R *.DFM}

class function TfrmSelecionaLoteEF.SelecionaLoteFolhaBeneficio ( var psAnoMesPagamento  : string; var psDataPagamento    : string) : longint;
begin
   frmSelecionaLoteEF := TFrmSelecionaLoteEF.Create(Application);
   with frmSelecionaLoteEF do
   begin
      iIdLoteSelecionado := -1;
      sAnoMesPagamento   := '';
      qryLotesAbertos.Close;
//      qryLotesAbertos.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
      qryLotesAbertos.Open;
      if qryLotesAbertos.IsEmpty
      then begin
         MsgDlg('Não existe lote de concessão aberto no momento. Verifique.','Informação',mtInformation,[mbOk,mbHelp],0);
         Result := iIdLoteSelecionado;
         frmSelecionaLoteEF.Free;
         Exit;
      end;
      ShowModal;
      psAnoMesPagamento  := sAnoMesPagamento;
      psDataPagamento    := qryLotesAbertos.FieldByName('DATAPAGAMENTO').AsString;
      Result             := iIdLoteSelecionado;
   end;
   frmSelecionaLoteEF.Free;
end; // SelecionaLoteFolhaBeneficio


procedure TfrmSelecionaLoteEF.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmSelecionaLoteEF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;
// nao permitir fazer free
end;

end.
