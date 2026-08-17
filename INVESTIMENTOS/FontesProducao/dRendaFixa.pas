//******************************************************************************
// SOL        : 123412
// Kintana    : 628716
// Data       : 11/09/2009
// Responsável: Thiago Passos
// Descrição  : Correção da Inserção na OperRenFixxCurvas
//******************************************************************************
// SOL        : 39918
// Kintana    : 523459
// Data       : 10/08/2009
// Responsável: Thiago Passos
// Descrição  : Correção de Indices em dias Uteis
//********************************************************************************************************
// Data	     : 28/05/2008
// Codigo    : AL_33
// Pendência : 24716
// SOL       : 55534
// Função    : Implementação de melhorias para evitar o "Out of Memory"
//             Implementação de componente Regra persistente 
//********************************************************************************************************
// Data	     : 24/08/2007
// Codigo    : AL_32
// Pendência : 26084
// SOL       :
// Função    : Alteração na ordenação da query qryBuscaSaldosItems
//******************************************************************************
// Data	     : 14/03/2007
// Codigo    : AL_31
// Pendência : 25309
// SOL       : 58642
// Função    : Implementação de Flag para atualizar o Título no dia da Emissão.
//             Novo componente query: qryAtuEmiss
//******************************************************************************
// Data      : 16/05/2007
// Código    : AL_30
// Pendencia : 25336
// SOL       : 60074
// Desc      : Acerto na Busca de Saldos de Operações de Renda Fixa para trazer
//              os diversos Planos / Patrocinadoras
//             Colocado o TipoProc na qryBuscaSaldosHistPoup
//******************************************************************************
// Data      : 16/02/2007
// Código    : AL_29
// Pendencia : 22779
// SOL       : 43633
// Desc      : Implementação de mais de um TRC entre Planos , inclusão do parametro
//             IDHISTRENFIX na qryBuscaSaldosHist
//******************************************************************************
// Data      : 03/01/2007
// Código    : AL_28
// Pendencia : 23705
// SOL       : 40671
// Desc      : Acerto na qryMarcaInvRep que estava tratando errao o campo
//             QTDHISTRENFIX > 0 ao inves do SALDOQTDHISTRENFI > 0
//             Inclusao dos tipooper -166 e -167 na qryBuscaHistOper e
//******************************************************************************
// Data      : 27/11/2006
// Código    : AL_27
// Pendencia : 23861
// SOL       : 43516
// Desc      : Inclusão do Campo FLGUSAQTD na qryBuscaSaldosHist
//******************************************************************************
// Data      : 24/10/2006
// Código    : AL_26
// Pendencia : 23603
// SOL       : 47415
// Desc      : Ajuste na qryExisteOperacoes para trazer o Tipo de Movimento (TRC)
//******************************************************************************
// Data      : 14/09/2006
// Código    : AL_25
// Pendencia :
// SOL       :
// Desc      : Ajuste na qryBuscaTotalResgPoup para buscar os totais de TRC
//******************************************************************************
// Data      : 07/08/2006
// Código    : AL_24
// Pendencia : 23008
// SOL       :
// Desc      : Implementação de TRC Planos antes do registro de ATU
//             Colocado o iTipoProc = 2 na qryBuscaSaldosHistAux    .
//             Adaptado a qryBuscaTotalResgPoup para TRC
//******************************************************************************
// Data      : 03/07/2006
// Código    : AL_33
// Pendencia : 22658
// SOL       : 44185
// Desc      : Função para verificar a falta do Histórico quando do lançamento
//             de operações de Baixa. (qryExisteOperacoes)
//******************************************************************************
// Data      : 18/07/2006
// Código    : AL_32
// Pendencia : 22779
// SOL       :
// Desc      : Criada a qryBuscaOPETRC que busca os dados das operações de Transferência
//                para serem excluídas
//******************************************************************************
//Data	     : 26/05/2006
//Codigo     : AL_31
//Pendência  : 22480
//SOL        : 43633
//Função     : Alterações na Funcionalidade de Transferencia entre planos
//             qryBuscaHistOper, qryInsOperRenFix, qryInsHistRenFix, qryBuscaSaldosHist, qryBuscaHistRenFix,
//             qryBuscaSaldosOper, qryTempHistCalc
//******************************************************************************
//Data	     : 29/05/2006
//Codigo     : AL_30
//Pendência  :
//SOL        :
//Função     : Implementação do campo DATALIQUIDACAO na qryBuscaSaldosOper
//******************************************************************************
//Data	     : 17/05/2006
//Codigo     : AL_29
//Pendência  : 22361
//SOL        : 43223
//Função     : Ajuste na qryMarcadoReproc para ignorar operações de aplicação na data de abertura,
//               deixando estes investimentos para serem reprocessados no dia seguinte
//******************************************************************************
//Data	     : 15/03/2006
//Codigo     : AL_28
//Pendência  : 21650
//SOL        : 40682
//Função     : Implementação do Campo DATALIQUIDACAO na qrySelOperRenFix
//******************************************************************************
//Data	  :  20/02/2006
//Codigo  :  AL_27
//Função  :  Colocado um TRIM no campo CODITEMRENFIX da qryBuscaSaldosItems para retirar os espaços em branco,
//           e qryBuscaSaldosItemsAux, qryBuscaSaldosItemsOper, qryBuscaSaldosItemsOperPoup, qryBuscaSaldosItemsPoup
//******************************************************************************
//Data	  :  08/11/2005
//Codigo  :  AL_26
//Função  :  Inclusão do Campo CARENCIA na qryBuscaSaldosHistPoup
//******************************************************************************
//Data	  :  13/09/2005
//Codigo  :  AL_25
//Função  :  Alteração na query qryBuscaValorIOF para repactuação de títulos
//******************************************************************************
//Data	  :  02/09/2005
//Codigo  :  AL_24
//Função  :  Alteração na query qryMarcadoReproc para buscar a descrição do título
//******************************************************************************
//Data	  :  25/08/2005
//Codigo  :  AL_23
//Função  :  Implementação de filtro IDINVESTIMENTO na função BuscaOperacao
//******************************************************************************
//Data	  :  23/06/2005
//Codigo  :  AL_22
//Função  :  Implementacao da QryBuscaValorIOF e colocado um TO_DATE na qryMarcadoReproc e qryBuscaOPECotRenFix
//******************************************************************************
//Data	  :  08/06/2005
//Codigo  :  AL_21
//Função  :  Incluído o campo VLROPERACAO na qruBuscaPUFluxo
//******************************************************************************
//Data	  :  08/06/2005
//Codigo  :  AL_20
//Função  :  Ajuste na query qryBuscaSaldosResgF para desprezar operações de fluxo
//******************************************************************************
//Data	  :  24/05/2005
//Codigo  :  AL_19
//Função  :  Alterada a qryBuscaTotalResgPoup para trazer somente os resgates maiores que a data do
//           ultimo aniv
//******************************************************************************
//Data	  :  12/04/2005
//Codigo  :  AL_18
//Função  :  Melhoria na qryMarcadoReproc para trazer somente registro menores ou igual ao
//           último fechamento de RF (AND (DATAHISTRENFIX <= :DATAULTFECHRF))
//******************************************************************************
//Data	  :  07/04/2005
//Codigo  :  AL_18
//Função  :  Ajustes na qryBuscaSaldosHistPoup para equalizar com a BuscaSaldosHist
//******************************************************************************
//Data	  :  23/04/2005 e 28/03/2005
//Codigo  :  AL_17
//Função  :  Alterações para Calcular e Gravar o Vlr do Item e o Valor Acumulado do
//           Item na HISTRENFIXXITENS (qryInsHistRenFixXItens)
//           e qryBuscaSaldosItems E qryBuscaSaldosItemsAux
//******************************************************************************
//Data	         :  04/03/2005
//Função	 :  Incluído parametro IDITEMRENFIX na qryBuscaUltPUPagtoJur
//                  Incluído o campo DATAOPERACAO na qruBuscaPUFluxo
//                  Incluído a qry qryBuscaDtUltPUPagtoJur
//******************************************************************************
//Data	         :  23/02/2005
//Função	 :  Colocado parametro sOper na qryBuscaTotalResgPoup para acertar o somatório de resgates
//                  conforme o momento do processamento (Atualização (<) ou Operação (<=)
//******************************************************************************
//Data	         :  18/01/2005
//Função	 :  Alteração da qryBuscaTotalResgPoup para trazer <= a Data Final ao invés de só <
//******************************************************************************
//Data	         :  22/12/2004
//Função	 :  Nova query qryBuscaPUFluxo
//******************************************************************************
//Data	         :  08/12/2004
//Função	 :  incluído o parâmetro IDITEMRENFIX na qryBuscaPUPGJuros
//******************************************************************************
//Data	 	 :      06/07/2004
//Função	 :   *  Alteração na query qryBuscaSaldosHistAux
//               Incluido mais um tipo de Operação = 3 para buscar saldos já com as
//                 operações de fluxo para acertar os saldos em aplicações com mais
//                 de um fluxo por dia
//******************************************************************************
//Data	 	 :      24/06/2004
//Função	 :   *  Alteração na query qryMarcaInvRep
//               Ajuste para desmarcar investimentos com saldo zerado por resgate
//                 no dia, apesar de não marcar estes registros para reprocessamento,
//                 pode acontecer de o investimento estar marcado em data anterior
//******************************************************************************
//Data	 	 :      21/06/2004
//Função	 :   *  Alteração na query qrySelOperRenFix
//               Inclusão da tabela Investimento e do campo IDCLASSETIT
//******************************************************************************
//Data	 	 :      28/04/2004
//Função	 :   *  Criação das queries:
//                      MarcadoReproc - Verifica se uma aplicação está marcada para
//                                      reprocessamento, ou se existe alguma aplicação
//                                      marcada
//                      MarcaInvRep   - Marca uma aplicação para reprocessamento
//Motivo         :   *  Novo método de reprocessamento automático de renda fixa
//******************************************************************************
//Data	 	 :      22/04/2004
//Função	 :   *  Ajuste na query BuscaSaldosHist para buscar o Maior ID dentro
//                      da Maior Data de cada Aplicação
//******************************************************************************

unit dRendaFixa;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, Wwquery, Wwdatsrc, URegra;

type
  TDMRendaFixa = class(TDataModule)
    qryInsOperRenFix: TwwQuery;
    qryInsOperRenFixXCurvas: TwwQuery;
    qryInsHistRenFixXItens: TwwQuery;
    qryInsHistRenFix: TwwQuery;
    qryUpdHistRenFix: TwwQuery;
    qrySelItemXOpeXInv: TwwQuery;
    qryUpdOperRenFixXCurvas: TwwQuery;
    qrySelOperRenFixXCurvas: TwwQuery;
    qryBuscaSaldosHist: TwwQuery;
    qryBuscaSaldosItems: TwwQuery;
    qryBuscaSaldosOper: TwwQuery;
    qryBuscaSaldosItemsOper: TwwQuery;
    qryBuscaSaldosItemsXCurvas: TwwQuery;
    qryAux: TwwQuery;
    qrySelOperRenFix: TwwQuery;
    qrySelOperRenFixItens: TwwQuery;
    qryProcuraResgatesNoDia: TwwQuery;
    qryBuscaHistRenFix: TwwQuery;
    qryUpdFinanceiroHist: TwwQuery;
    qryPadrLancRF: TwwQuery;
    qryInvestimento: TwwQuery;
    qryUpdParamInvest: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    FloatField3: TFloatField;
    updTempItensCalc: TUpdateSQL;
    qryTempItensCalc: TwwQuery;
    qryTempHistCalc: TwwQuery;
    updTempHistCalc: TUpdateSQL;
    qryBuscaSaldosHistAux: TwwQuery;
    qryBuscaSaldosHistPoup: TwwQuery;
    qryBuscaSaldosItemsPoup: TwwQuery;
    qryBuscaSaldosOperPoup: TwwQuery;
    qryBuscaSaldosItemsOperPoup: TwwQuery;
    qryBuscaSaldosItemsXCurvasPoup: TwwQuery;
    qryBuscaFluxoPagtoJuros: TwwQuery;
    QryLanctoDocum: TwwQuery;
    QryLotexDocum: TwwQuery;
    QryRecbtoPagto: TwwQuery;
    QryDocumento: TwwQuery;
    QryLancamento: TwwQuery;
    QryPlanilha: TwwQuery;
    QryIrLitigio: TwwQuery;
    QryRateioDocum: TwwQuery;
    qryCurvaContabil: TwwQuery;
    qryBuscaFluxoIncorpJuros: TwwQuery;
    qryBuscaFluxoAmortPrinc: TwwQuery;
    qryBuscaPUPGJuros: TwwQuery;
    qryBuscaCotRenFix: TwwQuery;
    qryBuscaHistOper: TwwQuery;
    qryUpdOperRenFix: TwwQuery;
    qryBuscaSaldosItemsAux: TwwQuery;
    qryBuscaUltPUPagtoJur: TwwQuery;
    qryBuscaFluxoProvPerda: TwwQuery;
    qryBuscaRendRET: TwwQuery;
    qryBuscaSaldosResgF: TwwQuery;
    qryAux2: TwwQuery;
    qryBuscaLucroPrejOper: TwwQuery;
    qryBuscaTotalResgPoup: TwwQuery;
    qryUpdLucroPrej: TwwQuery;
    qryBuscaFluxo: TwwQuery;
    qryNumBoleta: TwwQuery;
    qryBuscaFluxosNoDia: TwwQuery;
    qryBuscaOPECotRenFix: TwwQuery;
    qryBuscaATUCotRenFix: TwwQuery;
    qryBuscasSldQtdHist: TwwQuery;
    qryMarcadoReproc: TQuery;
    qryMarcaInvRep: TQuery;
    qruBuscaPUFluxo: TwwQuery;
    qryBuscaDtUltPUPagtoJur: TwwQuery;
    //AL_22 Ini
    QryBuscaValorIOF: TwwQuery;
    qryExisteOperacoes: TwwQuery;
    qryBuscaOPETRC: TwwQuery;
    qryOperTRCDia: TwwQuery;
    qryAtuEmiss: TwwQuery;
    Regra: TRegra;
    qryBuscaSaldosItemsIDHISTRENFIX: TFloatField;
    qryBuscaSaldosItemsIDCURVARENFIX: TFloatField;
    qryBuscaSaldosItemsIDITEMRENFIX: TFloatField;
    qryBuscaSaldosItemsPUITEM: TFloatField;
    qryBuscaSaldosItemsPUACUITEM: TFloatField;
    qryBuscaSaldosItemsIDREGRACALCULO: TFloatField;
    qryBuscaSaldosItemsCODITEMRENFIX: TStringField;
    qryBuscaSaldosItemsIDREGRA: TFloatField;
    qryBuscaSaldosItemsFLGMOEDA: TStringField;
    qryBuscaSaldosItemsFLGDESTACADO: TStringField;
    qryBuscaSaldosItemsFLGCENTRALIZADO: TStringField;
    qryBuscaSaldosItemsSEQCALCULO: TFloatField;
    qryBuscaSaldosItemsDESCITEMRENFIX: TStringField;
    qryBuscaSaldosItemsTIPOITEM: TStringField;
    qryBuscaSaldosItemsVLRITEM: TFloatField;
    qryBuscaSaldosItemsVLRACUITEM: TFloatField;
    procedure qryBuscaSaldosHistAfterScroll(DataSet: TDataSet);
    procedure qryBuscaSaldosItemsAfterScroll(DataSet: TDataSet);
    procedure qryBuscaSaldosItemsAfterOpen(DataSet: TDataSet);
    procedure qrySelOperRenFixAfterOpen(DataSet: TDataSet);
    procedure qryBuscaSaldosHistPoupAfterScroll(DataSet: TDataSet);
    procedure qryBuscaSaldosItemsPoupAfterOpen(DataSet: TDataSet);
    procedure qryBuscaSaldosItemsPoupAfterScroll(DataSet: TDataSet);
    procedure qryBuscaSaldosHistAuxAfterOpen(DataSet: TDataSet);
    //AL_33
    procedure qryPadrLancRFAfterOpen(DataSet: TDataSet);
  private
    //AL_33
    FPadrLancRFRecNo: Integer;
    FBuscaSaldosItensRecNo: Integer;
    procedure SetBuscaSaldosItensRecNo(const Value: Integer);
    procedure SetPadrLancRFRecNo(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }

    //AL_33
    property BuscaSaldosItensRecNo: Integer read FBuscaSaldosItensRecNo write SetBuscaSaldosItensRecNo;
    property PadrLancRFRecNo: Integer read FPadrLancRFRecNo write SetPadrLancRFRecNo;

  end;

var
  DMRendaFixa: TDMRendaFixa;

implementation

{$R *.DFM}

procedure TDMRendaFixa.qryBuscaSaldosHistAfterScroll(DataSet: TDataSet);
begin
    qryBuscaSaldosItems.Close;
    qryBuscaSaldosItems.ParamByName('IDHISTRENFIX').AsInteger :=
                     DataSet.FieldByName('IDHISTRENFIX').AsInteger;
    qryBuscaSaldosItems.Open;

    qryBuscaSaldosOper.Close;
    qryBuscaSaldosOper.ParamByName('IDOPERRENFIX').AsInteger :=
                     DataSet.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
    qryBuscaSaldosOper.Open;

    qryBuscaSaldosItemsOper.Close;
    qryBuscaSaldosItemsOper.ParamByName('IDOPERRENFIX').AsInteger :=
                     DataSet.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
    qryBuscaSaldosItemsOper.Open;
end;

procedure TDMRendaFixa.qryBuscaSaldosItemsAfterScroll(DataSet: TDataSet);
begin
    qryBuscaSaldosItemsXCurvas.Close;
    qryBuscaSaldosItemsXCurvas.ParamByName('IDCURVARENFIX').AsInteger :=
                         DataSet.FieldByName('IDCURVARENFIX').AsInteger;
    qryBuscaSaldosItemsXCurvas.ParamByName('IDITEMRENFIX').AsInteger :=
                         DataSet.FieldByName('IDITEMRENFIX').AsInteger;
    qryBuscaSaldosItemsXCurvas.Open;
end;

procedure TDMRendaFixa.qryBuscaSaldosItemsAfterOpen(DataSet: TDataSet);
begin
    qryBuscaSaldosItemsXCurvas.Close;
    qryBuscaSaldosItemsXCurvas.ParamByName('IDCURVARENFIX').AsInteger :=
                         DataSet.FieldByName('IDCURVARENFIX').AsInteger;
    qryBuscaSaldosItemsXCurvas.ParamByName('IDITEMRENFIX').AsInteger :=
                         DataSet.FieldByName('IDITEMRENFIX').AsInteger;
    qryBuscaSaldosItemsXCurvas.Open;
    //AL_33
    BuscaSaldosItensRecNo := DataSet.RecordCount;
end;

procedure TDMRendaFixa.qrySelOperRenFixAfterOpen(DataSet: TDataSet);
begin
   //AL_33
   qrySelOperRenFixItens.Close;
   qrySelOperRenFixItens.ParamByName('IDOPERRENFIX').AsInteger :=
                         qrySelOperRenFix.FieldByName('IDOPERRENFIX').AsInteger;
   qrySelOperRenFixItens.Open;
end;

procedure TDMRendaFixa.qryBuscaSaldosHistPoupAfterScroll(DataSet: TDataSet);
begin
    qryBuscaSaldosItemsPoup.Close;
    qryBuscaSaldosItemsPoup.ParamByName('IDHISTRENFIX').AsInteger :=
                     DataSet.FieldByName('IDHISTRENFIX').AsInteger;
    qryBuscaSaldosItemsPoup.Open;

    qryBuscaSaldosOperPoup.Close;
    qryBuscaSaldosOperPoup.ParamByName('IDOPERRENFIX').AsInteger :=
                     DataSet.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
    qryBuscaSaldosOperPoup.Open;

    qryBuscaSaldosItemsOperPoup.Close;
    qryBuscaSaldosItemsOperPoup.ParamByName('IDOPERRENFIX').AsInteger :=
                     DataSet.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
    qryBuscaSaldosItemsOperPoup.Open;
end;

procedure TDMRendaFixa.qryBuscaSaldosItemsPoupAfterOpen(DataSet: TDataSet);
begin
    qryBuscaSaldosItemsXCurvasPoup.Close;
    qryBuscaSaldosItemsXCurvasPoup.ParamByName('IDCURVARENFIX').AsInteger :=
                         DataSet.FieldByName('IDCURVARENFIX').AsInteger;
    qryBuscaSaldosItemsXCurvasPoup.ParamByName('IDITEMRENFIX').AsInteger :=
                         DataSet.FieldByName('IDITEMRENFIX').AsInteger;
    qryBuscaSaldosItemsXCurvasPoup.Open;
end;

procedure TDMRendaFixa.qryBuscaSaldosItemsPoupAfterScroll(DataSet: TDataSet);
begin
    qryBuscaSaldosItemsXCurvasPoup.Close;
    qryBuscaSaldosItemsXCurvasPoup.ParamByName('IDCURVARENFIX').AsInteger :=
                         DataSet.FieldByName('IDCURVARENFIX').AsInteger;
    qryBuscaSaldosItemsXCurvasPoup.ParamByName('IDITEMRENFIX').AsInteger :=
                         DataSet.FieldByName('IDITEMRENFIX').AsInteger;
    qryBuscaSaldosItemsXCurvasPoup.Open;
end;

procedure TDMRendaFixa.qryBuscaSaldosHistAuxAfterOpen(DataSet: TDataSet);
begin
    qryBuscaSaldosItemsAux.Close;
    qryBuscaSaldosItemsAux.ParamByName('IDHISTRENFIX').AsInteger :=
                     DataSet.FieldByName('IDHISTRENFIX').AsInteger;
    qryBuscaSaldosItemsAux.Open;
end;

procedure TDMRendaFixa.SetBuscaSaldosItensRecNo(const Value: Integer);
begin
  FBuscaSaldosItensRecNo := Value;
end;

procedure TDMRendaFixa.SetPadrLancRFRecNo(const Value: Integer);
begin
  FPadrLancRFRecNo := Value;
end;

procedure TDMRendaFixa.qryPadrLancRFAfterOpen(DataSet: TDataSet);
begin
   PadrLancRFRecNo := DataSet.RecordCount;
end;

end.

