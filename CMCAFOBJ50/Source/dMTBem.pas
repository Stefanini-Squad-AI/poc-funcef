unit dMTBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DCtrlObject_Padrao, uCmSqlParams;

type
  TdtmMTBem = class(TDtmCtrlObject_Padrao)
    sqlMovContabBem: TCMSqlParams;
    sqlSaldoContabBem: TCMSqlParams;
    sqlSldCtbBemxDep: TCMSqlParams;
    sqlMovTransf: TCMSqlParams;
    sqlRateioPatroxBem: TCMSqlParams;
    sqlBemxDep: TCMSqlParams;
    sqlFechamentoReavalxDep: TCMSqlParams;
    sqlFechamentoReavalxMoeda: TCMSqlParams;
    sqlFechamentoAcrescValorxDep: TCMSqlParams;     
    sqlFechamentoAcrescValorxMoeda: TCMSqlParams;
    sqlRemSaldoContabBem: TCMSqlParams;
    sqlRemSldCtbBemxDep: TCMSqlParams;
    sqlRemSaldoContabGrupo: TCMSqlParams;
    sqlRemSldCtbGrupoxDep: TCMSqlParams;
    sqlRemSaldoContabConj: TCMSqlParams;
    sqlRemSldCtbConjxDep: TCMSqlParams;
    sqlUpdSCBTransf: TCMSqlParams;
    sqlRCMovTransf: TCMSqlParams;
    sqlSCBTransf: TCMSqlParams;
    sqlRCInsSldCtbBemxDep: TCMSqlParams;
    sqlRCInsSaldoContabBem: TCMSqlParams;
    sqlRCMovContabBem: TCMSqlParams;
    sqlRCBemxDep: TCMSqlParams;
    sqlRCBemxMoeda: TCMSqlParams;
    sqlRCBem: TCMSqlParams;
    sqlRCMovAcrescxDep: TCMSqlParams;
    sqlRCMovAcrescimo: TCMSqlParams;
    sqlRCMovReavalxDep: TCMSqlParams;
    sqlRCMovReavaliacao: TCMSqlParams;
    sqlRCMovBemxDep: TCMSqlParams;
    sqlRCMovBem: TCMSqlParams;
    sqlAtuAcrescxDep: TCMSqlParams;
    sqlAtuAcrescimo: TCMSqlParams;
    sqlAtuReavalxDep: TCMSqlParams;
    sqlAtuReavaliacao: TCMSqlParams;
    sqlAtuBemxDep: TCMSqlParams;
    sqlAtuBem: TCMSqlParams;
    sqlSaldoContabilBem: TCMSqlParams;
    sqlAtualizaPlnCodigo: TCMSqlParams;
    sqlHistMovBem: TCMSqlParams;
    sqlBensPendentesxRateio: TCMSqlParams;
    sqlBensPendentesxDep: TCMSqlParams;
    sqlBensPendentes: TCMSqlParams;
    sqlTransfHistMovBem: TCMSqlParams;
    sqlRegDataRetSaidaTemp: TCMSqlParams;
    sqlSetaFlgSaidaTempBem: TCMSqlParams;
    sqlExecutaTermoSaidaTemp: TCMSqlParams;
    sqlRemItensInvBens: TCMSqlParams;
    sqlBensEscravos: TCMSqlParams;
    sqlInvInsPlaca: TCMSqlParams;
    sqlImportacaoResultado: TCMSqlParams;
    sqlBensNaLocalizacao: TCMSqlParams;
    sqlItensInvBens: TCMSqlParams;
    sqlSaldoContabilGrupo: TCMSqlParams;
    sqlCafObraRateio: TCMSqlParams;
    sqlBaixaAtuAcresc: TCMSqlParams;
    sqlBaixaAtuReaval: TCMSqlParams;
    sqlBaixaAtuBem: TCMSqlParams;
    sqlMovBaixaAcresc: TCMSqlParams;
    sqlMovBaixaReaval: TCMSqlParams;
    sqlMovBaixaBem: TCMSqlParams;
    sqlRegistraBemTotal: TCMSqlParams;
    sqlMovReavalBem: TCMSqlParams;
    sqlListaSelBaixaBens: TCMSqlParams;
    sqlProRataReavalxMoeda: TCMSqlParams;
    sqlProRataReavalxDep: TCMSqlParams;
    sqlProRataAcrescValorxMoeda: TCMSqlParams;
    sqlProRataAcrescValorxDep: TCMSqlParams;
    sqlExisteMovimentacao: TCMSqlParams;
    sqlVerificaContaxCC: TCMSqlParams;
    sqlNewDataUltFec: TCMSqlParams;
    sqlIniciaMTDep: TCMSqlParams;
    sqlIniciaMTMoeda: TCMSqlParams;
    sqlHMBReaval: TCMSqlParams;
    sqlRemHistMovBem: TCMSqlParams;
    sqlRemVlrHistMovBem: TCMSqlParams;
    sqlRemSldCtbxDep: TCMSqlParams;
    sqlRemSaldoContab: TCMSqlParams;
    sqlRCMovBemxMoeda2: TCMSqlParams;
    sqlRCMovBemxDep2: TCMSqlParams;
    sqlRCMovReavalxDep2: TCMSqlParams;
    sqlRCMovReavalxMoeda2: TCMSqlParams;
    sqlRCMovAcresxDep2: TCMSqlParams;
    sqlRCMovAcresxMoeda2: TCMSqlParams;
    sqlSaldoContabReavalA: TCMSqlParams;
    sqlSaldoContabBemA: TCMSqlParams;
    sqlRemHistMovBemFec: TCMSqlParams;
    sqlRemVlrHistMovBemFec: TCMSqlParams;
    sqlAux: TCMSqlParams;
    sqlParamCAFxContab: TCMSqlParams;
    sqlParamCAFxContab2: TCMSqlParams;
    sqlMontaContab: TCMSqlParams;
    sqlCorrGrupoBem: TCMSqlParams;
    sqlBensNoConjunto: TCMSqlParams;
    sqlListaSelReavalBens: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmMTBem: TdtmMTBem;

implementation

{$R *.DFM}

end.
