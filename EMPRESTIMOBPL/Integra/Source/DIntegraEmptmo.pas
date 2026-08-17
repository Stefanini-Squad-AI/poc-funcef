unit DIntegraEmptmo;

// Alterações:


{
--------------------------------------------------------------------------------
Pendência   : SOL 253185 Kintana 771995
Responsável : Wylliam Leite da Silva / William Moreira da Silva
Data        : 07/05/2015
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO
              (Retirada dos Index *Hint na query: qryBuscaItemCentralizador)
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
--------------------------------------------------------------------------------------------------
//Pendência   : SOL 169010 KINTANA 1495798
//Responsável : MARCIO SANCHES SPINOSA
//Data        : 21/05/2012
//Descrição   : Atualiza a CtrlInterface dependendo do valor da folha resgate,
// criação do UpdateCtrlInterface.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 122042 KINTANA 594314
Responsável : Renato Visoni
Data        : 17/07/2009
Descrição   : Alteração na qryPlanoPrevOrigemFUNCEF,
        AND    IDSITPLANOPREV = 25 --alterar para "IN (25,27,28,29)"
--------------------------------------------------------------------------------
Pendência   : SOL 122042 KINTANA 594314
Responsável : Ádler Teodoro de Souza
Data        : 17/07/2009
Descrição   : Alteração nas queries qryUpdateDocumento, qryUpdateFlgEnvio e
também na função MontaUpdateCAPCAR retirando FLGSOLICITACAO = NULL.
--------------------------------------------------------------------------------
Rotina    : qryPlanoPrevOrigemFUNCEF
Data      : 19/04/2007
Autor     : Alberto
Pendência : 25114
Descrição : Query alterada para atender a solicitação da pendência original 23311:
            As concessões realizadas para os participantes ativos que estiverem no
            NOVO PLANO e possuírem o plano REG/REPLAN SALDADO no cadastro, devem
            ficar com o plano previdenciário NOVO PLANO e plano contábil REG/REPLAN
            SALDADO
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, DBTables, Wwquery, Wwdatsrc;

type
   TdtmIntegraEmptmo = class(TDataModule)
      qryRemarcaEnvio: TwwQuery;
      qryExcluiTMPDESC: TwwQuery;
      qryDocumentosExclusao: TwwQuery;
      qryDocumentosExclusaoCODDOCUMENTO: TFloatField;
      qryExcluiFinanceiro: TwwQuery;
      qryUpdateDocumento: TwwQuery;
      qryUpdateFlgEnvio: TwwQuery;
      qryUpdatePlanilha: TwwQuery;
      qryUpdateEstornoContabil: TwwQuery;
      qryUpdateAbonoContabil: TwwQuery;
      qryBuscaPatro: TwwQuery;
      qryBuscaPlano: TwwQuery;
      qryBuscaPatroNOME: TStringField;
      qryBuscaPlanoNOME: TStringField;
      qryPlanilhasLote: TwwQuery;
      qryPlanilhasLotePLNCODIGO: TFloatField;
      qryPlanilhasLotePLNDATDIA: TDateTimeField;
      qryDesfazPlanilhaPorHist: TwwQuery;
      qryPlanilhasLoteIDHISTMOVEMPTMO: TFloatField;
      qryExcluiLanctoDocum: TwwQuery;
      qryExcluiRateioDocum: TwwQuery;
      qryExcluiLotexDocum: TwwQuery;
      qryExcluiDocumento: TwwQuery;
      qryExcluiLancContab: TwwQuery;
      qryExcluiPlanilha: TwwQuery;
      qryUpdateVlrPlanilha: TwwQuery;
      qryDesfazPlanilhaPorPlanilha: TwwQuery;
      qryExcluiRecbtoPagto: TwwQuery;
      qryUpdateCCHist: TwwQuery;
      qryInsertTmpDesc: TwwQuery;
      qryInsertCtrlInterface: TwwQuery;
      qryVerificaBaixaEvento: TwwQuery;
      qryVerificaBaixaEventoQUANT: TFloatField;
      qryVerificaEnvioEvento: TwwQuery;
      qryVerificaEnvioEventoQUANT: TFloatField;
      qryUpdateTmpDesc: TwwQuery;
      qryDeleteTMPDESCporTmp: TwwQuery;
      qryLimpaIDTmpDescPorHist: TwwQuery;
      qryUpdateDocConciliado: TwwQuery;
      qryLimpaIDTmpDescPorTmp: TwwQuery;
      qryBuscaItemCentralizador: TwwQuery;
      qryBuscaItemCentralizadorIDHISTMOVEMPTMO: TFloatField;
      qryVerificaExclusaoTmpDesc: TwwQuery;
      qryVerificaExclusaoTmpDescIDDESCONTO: TFloatField;
      qryVerificaExclusaoTmpDescSITENVIO: TStringField;
      qryUpdateCCHistGrupo: TwwQuery;
      qryUpdateAbonoContabilGrupo: TwwQuery;
      qryUpdateEstornoContabilGrupo: TwwQuery;
      qryUpdatePlanilhaGrupo: TwwQuery;
      qryBenefBFCiario: TwwQuery;
      qryBenefBFCiarioIDPESSOA: TFloatField;
      qryBenefBFCiarioIDTITULAR: TFloatField;
      qryBenefBFCiarioIDPLANOORIGEM: TFloatField;
      qryBenefBFCiarioIDPLANOPREV: TFloatField;
      qryBenefBFCiarioIDPLANPREVCONTAB: TFloatField;
      qryHistMovXDocum: TwwQuery;
      qryBaixaDoc: TwwQuery;
      qryExcluiContaBaixa: TwwQuery;
      qryPlanilha: TwwQuery;
      qryPlanilhaPLNDATDIA: TDateTimeField;
      qryPlanilhaPLNCODIGO: TFloatField;
      qryPlanilhaPLNPLANIL: TFloatField;
      qryPlanilhaTOTAL_CONTRATOS: TFloatField;
      qryPlanilhaEFETIVADA: TStringField;
      qryPlanilhaPLNEFETIVADO: TStringField;
      qryPlanilhaPERNUMERO: TFloatField;
      qryPlanilhaPEREXERCICIO: TFloatField;
      qryPlanilhaIDMODULO: TFloatField;
      qryPlanilhaIDPESSOA: TFloatField;
      dtsPlanilha: TwwDataSource;
      qryDesfazPlanilhaEstornoPorPlanilha: TwwQuery;
      qryExcluiDocumentoHist: TwwQuery;
      qryDataCredito: TwwQuery;
      qryContratoQuitado: TwwQuery;
      qryDataCreditoDATACREDITO: TDateTimeField;
      qryContratoQuitadoIDCONTRATOEMPTMO: TFloatField;
    qryValorBaixadoDoc: TwwQuery;
    qryValorBaixadoDocVALOR_BAIXADO: TFloatField;
    qryUltDataBaixaDoc: TwwQuery;
    qryUltDataBaixaDocDATA_BAIXA: TDateTimeField;
    qryUltDataLancDoc: TwwQuery;
    qryUltDataLancDocDATA_BAIXA: TDateTimeField;
    qryVlrBaixadoTmpDesc: TwwQuery;
    qryVlrBaixadoTmpDescIDTMPDESC: TFloatField;
    qryVlrBaixadoTmpDescMESCOBRANCA: TStringField;
    qryVlrBaixadoTmpDescMESREFERENCIA: TStringField;
    qryVlrBaixadoTmpDescFLGDESCFOLHA: TStringField;
    qryVlrBaixadoTmpDescSITENVIO: TStringField;
    qryVlrBaixadoTmpDescIDDESCONTO: TFloatField;
    qryVlrBaixadoTmpDescORDEM: TFloatField;
    qryVlrBaixadoTmpDescIDHISTMOVEMPTMO: TFloatField;
    qryVlrBaixadoTmpDescVALOR: TFloatField;
    qryVlrBaixadoTmpDescVALORRECEBIDO: TFloatField;
    qryVlrBaixadoTmpDescDATARECEBIMENTO: TDateTimeField;
    qryVlrBaixadoTmpDescIDLOTE: TFloatField;
    qryVlrBaixadoTmpDescLOTEPREVIA: TFloatField;
    qryItensContabilizados: TwwQuery;
    qryPlanoPrevOrigemFUNCEF: TwwQuery;
    qryPlanoPrevOrigemFUNCEFIDPLANOPREV: TFloatField;
    qryBuscaMenorContratoPorTipo: TwwQuery;
    qryBuscaPlanoContabil: TwwQuery;
    qryBuscaPlanoContabilIDPLANOPREV: TFloatField;
    qryBuscaPlanoContabilIDPLANPREVC: TFloatField;
    qryBuscaPlanoContabilPLANO_PREV: TStringField;
    qryBuscaPlanoContabilENTIDADE_CONTABIL: TStringField;
    qryBuscaPlanoPrev: TwwQuery;
    qryBuscaPlanoPrevIDPLANOPREV: TFloatField;
    qryBuscaPlanoPrevIDPLANPREVC: TFloatField;
    qryBuscaPlanoPrevPLANO_PREV: TStringField;
    qryBuscaPlanoPrevENTIDADE_CONTABIL: TStringField;
    qryUpdateCtrlInterface: TwwQuery;
    wwQuery1: TwwQuery;
    FloatField1: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField2: TFloatField;


   private // Private declarations


   public // Public declarations


   end;



var
  dtmIntegraEmptmo: TdtmIntegraEmptmo;



implementation
{$R *.DFM}



end.
