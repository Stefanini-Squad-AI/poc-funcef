// Rotina     : QryExeDireito
// SOL        : 121533
// Kintana    : 589718
// Data       : 16/07/2009
// Responsável: Renan Cristiano
// Descrição  : Ajuste no relatório de Direitos de Exercicios para filtrar somente
//             Dividendos e Juros.
//******************************************************************************
// Rotina     : QryAnunRece, DsAnunRece, ppBDEAnunRece, ppRepAnunRece, QryAnunReceCon
//              DsAnunReceCon, ppBDEAnunReceCon, ppRepAnunReceCon
// SOL        : 120771
// Kintana    : 576015
// Data       : 13/07/2009
// Responsável: William M. Santos
// Descrição  : Implementação de um novo relatório referente a diferença do valor anunciado com o recebido.
//******************************************************************************
// Rotina     : QryBuscaCotacao
// SOL        : 92822
// Kintana    : 389089
// Data       : 11/08/2008
// Responsável: Ricardo Cristiano
// Descrição  : Instrução CGPC 025 que altera a precificação dos ativos de mercado a vista.
//******************************************************************************
// Data     : 14/11/2007
// Código   : AL_32
// Pendencia: 26870
// SOL      :
// Motivo   : Inclusão da descrição do Tipo de Operação no relatório de operações
//            de BM&F
//*****************************************************************************//
// Data      : 17/08/2007
// Código    : AL_32
// Pendência : 24957
// SOL       : 56201
// Motivo    : Implementação do Relatório Consolidado por Investimento
//             Alteração da QryExeDireito inclui os campos Descinvestimento e
//             descTipooperacao e IDOPERACAOINVEST.
//             Troquei o decode de IDCARTEIRAGERENC ao inves de null será 0 .
//             Acertei o Relatório de Exercício de Direito que estava errado
//******************************************************************************
// Data     : 18/04/2007
// Pendencia: 25073
// SOL      : 58176
// Código   : AL_31
// Motivo   : Alteração da definição do relatório. Mantido somente o lay-out
//******************************************************************************
// Data     : 16/03/2007
// Pendencia: 24758
// SOL      : 55789
// Código   : AL_30
// Motivo   : Implementaçao do campo DATAOPER(DATAEX) na qryExeDireito e no rela
//            torio
//******************************************************************************
// Data     : 01/11/2006
// Pendencia: 23666
// SOL      :
// Código   : AL_29
// Motivo   : Segregação de Planos - Rel Exercicio de Direito (qryExeDireito)
//******************************************************************************
// Data     : 11/05/2006
// Pendencia: 22967
// SOL      :
// Código   : AL_28
// Motivo   : Segregação de Carteiras
//            Retirada do RpConsCartRendVar para DataModule Próprio
//******************************************************************************
// Data     : 22/05/2006
// Pendencia: 21208
// SOL      : 39584
// Código   : AL_27
// Motivo   : Inclusão do campo Remuneração , Vlr da Operação e valor total no
//            Relatório de Exercicio de Direitos (qryExeDireito) e do Totalizador geral
//            para carteira normal e gerncial
//******************************************************************************
// Data     : 11/05/2006
// Pendencia: 21397
// SOL      : 33207
// Código   : AL_26
// Motivo   : Alteração na qryExeDireito para não mostrar operações de
//            Cancelamento de Provisão
//******************************************************************************
// Data      : 29/03/2006
// Pendência : 21266
// SOL       : 36904
// Código    : AL_25
// Motivo    : Retirada do relatório RPMapaCorret para o FDMRelMapaCorret
//******************************************************************************
// Data      : 24/01/2006
// Pendência : 21266
// SOL       : 36904
// Código    : AL_24
// Motivo    : Ajuste no layout do relatório de Movimentação por Corretora. Foi
//             incluido a data da operação.
//******************************************************************************
// Data      : 19/01/2006
// Pendência : 233367
// SOL       : 21140
// Código    : AL_23
// Motivo    : Acerton no DataSource do ppBdeMapaCorret que estava apontando para
//             frmConsMovCorretora.DsMapaCorret qdo o correto era frmConsMovCorretora.Ds
//             Acerto na paginação do relatório de Integracao Contábil
//             Descontinuação do Relatório Saldo do Investimentos (qrySaldoInv) (Coisa Antiga)
//******************************************************************************
// Data     : 31/10/2005
// Motivo   : Implementação no tratamento da Subscrição com Ações para não aparecer o valor
//            da operação
//******************************************************************************
// Data     : 19/10/2005
// Motivo   : Aumento de decimais dos campos QTDEOPERACAO e DIVPORACAO da qryExeDireito
//******************************************************************************
// Data     : 17/10/2005
// Motivo   : Implementação no tratamento da bonificação para não aparecer o valor
//            da operação e somente o destino
//******************************************************************************
// Data     : 29/09/2005
// Motivo   : Substituição do PU de Anuncio pelo Preço Unitário da Operação na qryExeDireito
//******************************************************************************
// Data     : 11/07/2005
// Motivo   : Implementação do tratamento na qryExeDireito, para buscar a origem
//            do direito de Recebimento de Subscrição por Anúncio de AGE.
//******************************************************************************
// Data     : 08/06/2005
// Motivo   : Retirado da qryConsCartRendVar no item VENDAS a natureza igual "R", essa
//            agora faz referencia a operação de Restituição
//******************************************************************************
// Data     : 24/05/2005
// Motivo   : Implementação do tratamento na qryExeDireito, para não buscar a origem
//            do direito de GRUPAMENTO.
//******************************************************************************
// Data     : 17/05/2005
// Motivo   : Round do PUCUSTO na qryConsCartRendVar com 8 decimais
//******************************************************************************
// Data     : 10/05/2005
// Motivo   : Inclusão do campo PUCUSTO na qryConsCartRendVar
//******************************************************************************
// Data     : 10/05/2005
// Motivo   : Implementação do campo FLGOPDIREITO para identificar oper. de direitos
//            na query QryDemoOpVd
//******************************************************************************
// Data     : 06/05/2005
// Motivo   : Implementação na qryExeDireito do tratamento de valor da remuneração
//            conforme a nova concepção do recebimento de Direitos
//******************************************************************************
// Data     : 13/04/2005
// Motivo   : Alteração no layout do relatório de exercicio de direitos(ppRepExeDireito) e
//            na ordenação da qryExeDireito
//******************************************************************************
// Data     : 16/03/2005
// Motivo   : Alteração no layout do relatório de exercicio de direitos(ppRepExeDireito)
//******************************************************************************
// Data     : 16/03/2005
// Motivo   : Alteração na ordenação da query qryExeDireito
//******************************************************************************
// Data     : 11/03/2005
// Motivo   : Alteracao do caption da coluna Variacao Mes para somente Variacao
//            no RpConsCartRendVar
//******************************************************************************
// Data     : 04/03/2005
//          : qryConsCartRendVar
// Motivo   : Implementação da datacotacao, para mostra certo.
//******************************************************************************
// Data     : 28/02/2005
// Motivo   : Melhora na query QryConciliacaoCustodiaFechto para incluir o campo IDINVESTIMENTO na
//            Concatenação da chave.
//******************************************************************************
// Data     : 25/01/2005
//          : qryExeDireito, ppRepExeDireito
// Motivo   : Ajuste para so trazer recebimento de direitos e mostrar todos os direitos
//            recebidos. Alterado o layout para grupar por data, e grupado tb por boleta,
//            identificando a composição por carteira da mesma.
//            Retirado a mascara do PU.
//******************************************************************************
// Data     : 22/12/2004
//          : qryExeDireito
// Motivo   : Implementação para trazer apenas AGE, sem anuncio
//******************************************************************************
// Data     : 09/11/2004
// AL_3
// Motivo   : Melhora na query qryConsCartRendVar
//******************************************************************************
// Data     : 18/08/2004
// AL_1
// Motivo   : Implementada na qryConsCartRendVar a consulta da cotação de cota,
//            buscando na tabela COTACAOINVEST
//******************************************************************************
// Data     : 13/08/2004
// AL_1
// Motivo   : Retirada do relatorio  RptContabil para o Form DmRelParamContab
//******************************************************************************

unit FDmRelatorio;

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ExtCtrls,
  TeeProcs, TeEngine, Chart, ppChrt, DBChart, ppChrtDB, ppVar, ppRelatv,
  ppDBPipe, myChkBox, ppModule, daDataModule, ppViewr, ppStrtch, ppSubRpt,
  ppRegion;

type
  TDtmRelatorio = Class(TdtmReports)
    RptConsHistInvest: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppDetailBand13: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    RptConsHistInvestDBText1: TppDBText;
    RptConsHistInvestDBText2: TppDBText;
    RptConsHistInvestDBText3: TppDBText;
    RptConsHistInvestDBText4: TppDBText;
    RptConsHistInvestDBText5: TppDBText;
    RptConsHistInvestDBText7: TppDBText;
    RptConsHistInvestDBText9: TppDBText;
    RptConsHistInvestDBText11: TppDBText;
    RptConsHistInvestDBText12: TppDBText;
    ppFooterBand13: TppFooterBand;
    QryConsHistInvest: TwwQuery;
    QryConsHistInvestIDCARTEIRAINVEST: TFloatField;
    QryConsHistInvestDATAMOVCARTINV: TDateTimeField;
    QryConsHistInvestSALDOVLRINVCART: TFloatField;
    QryConsHistInvestSALDOQTDEINVCART: TFloatField;
    QryConsHistInvestIDINVESTIMENTO: TFloatField;
    QryConsHistInvestIDTIPOOPERACAO: TFloatField;
    QryConsHistInvestHISTMOVCARTINV: TStringField;
    QryConsHistInvestTIPMOVCARTINV: TStringField;
    QryConsHistInvestIDLOTE: TStringField;
    QryConsHistInvestDESCINVESTIMENTO: TStringField;
    QryConsHistInvestVLRMOVCARTINV: TFloatField;
    QryConsHistInvestCOTASMOVCARTINV: TFloatField;
    QryConsHistInvestSALDOCOTASCARTINV: TFloatField;
    QryConsHistInvestIDOPERACAOINVEST: TFloatField;
    QryConsHistInvestQTDEMOVINVCART: TFloatField;
    QryConsHistInvestMOVIMATU: TFloatField;
    QryConsHistInvestSALDOATU: TFloatField;
    QryConsHistInvestMOVIMCAR: TFloatField;
    QryConsHistInvestSALDOCAR: TFloatField;
    QryConsHistInvestMOVIMAQUI: TFloatField;
    QryConsHistInvestSALDOAQUI: TFloatField;
    QryConsHistInvestSALDOREND: TFloatField;
    QryConsHistInvestNATURMOVCARTINV: TStringField;
    DtsConsHistInvest: TwwDataSource;
    BdeConsHistInvest: TppBDEPipeline;
    LblInvestimento: TppLabel;
    updMapaOper: TUpdateSQL;
    RptMapaOper: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    RptResumoOperDBText2: TppDBText;
    RptResumoOperDBText4: TppDBText;
    RptResumoOperDBText6: TppDBText;
    RptResumoOperDBText7: TppDBText;
    RptResumoOperDBText8: TppDBText;
    RptResumoOperDBText9: TppDBText;
    RptResumoOperDBText3: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine7: TppLine;
    ppLabel12: TppLabel;
    RptResumoOperGroup1: TppGroup;
    RptResumoOperGroupHeaderBand1: TppGroupHeaderBand;
    RptResumoOperLabel13: TppLabel;
    RptResumoOperDBText1: TppDBText;
    RptResumoOperLine3: TppLine;
    RptResumoOperGroupFooterBand1: TppGroupFooterBand;
    RptResumoOperDBCalc4: TppDBCalc;
    RptResumoOperLine4: TppLine;
    RptResumoOperLabel14: TppLabel;
    bdeMapaOper: TppBDEPipeline;
    qryMapaOper: TwwQuery;
    DtsMapaOper: TwwDataSource;
    qryMapaOperDESCCARTINVEST: TStringField;
    qryMapaOperDESCTIPRENFIXA: TStringField;
    qryMapaOperIDLOTE: TStringField;
    qryMapaOperIDCARTEIRAINVEST: TFloatField;
    qryMapaOperIDINVESTIMENTO: TFloatField;
    qryMapaOperSALDOVLRINVCART: TFloatField;
    qryMapaOperDATAINICIAL: TDateTimeField;
    qryMapaOperVALAPLIC: TFloatField;
    qryMapaOperPU: TFloatField;
    qryMapaOperDESCINVESTIMENTO: TStringField;
    qryMapaOperSALDOQTDEINVCART: TFloatField;
    qryResumoOper2: TwwQuery;
    dsResumoOper2: TwwDataSource;
    bdeResumoOper2: TppBDEPipeline;
    RptResumoOper2: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine11: TppLine;
    ppLabel24: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel25: TppLabel;
    ppDBText17: TppDBText;
    ppLine12: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    RptResumoOperDBCalc1: TppDBCalc;
    ppDBCalc1: TppDBCalc;
    ppLine13: TppLine;
    ppLabel26: TppLabel;
    updResumoOper2: TUpdateSQL;
    QryFundos: TwwQuery;
    DtsFundos: TwwDataSource;
    BdeFundos: TppBDEPipeline;
    RptFundos: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine18: TppLine;
    ppLabel56: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel57: TppLabel;
    ppDBText27: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    QryFundosIDCONTRATOINVEST: TFloatField;
    QryFundosIDEMISSOR: TFloatField;
    QryFundosIDCORRETVALORES: TFloatField;
    QryFundosIDBOLSAVALORES: TFloatField;
    QryFundosIDTIPOCONTRINVEST: TFloatField;
    QryFundosIDINVESTIMENTO: TFloatField;
    QryFundosDESCINVESTIMENTO: TStringField;
    QryFundosSERIE: TStringField;
    QryFundosIDLOTE: TStringField;
    QryFundosDATACOMPRALOTE: TDateTimeField;
    QryFundosDATAVENCIM: TDateTimeField;
    QryFundosVLRCOMPRATITLOTE: TFloatField;
    QryFundosQTDETITLOTE: TFloatField;
    QryFundosSALDOTITLOTE: TFloatField;
    QryFundosVLRRESGATE: TFloatField;
    QryFundosPRECOVENCIM: TFloatField;
    QryFundosIDCARTLASTRO: TFloatField;
    QryFundosIDCARTAVISTA: TFloatField;
    QryFundosPRZVENC: TFloatField;
    QryFundosQTDECOMPRATITLOTE: TFloatField;
    QryFundosDATACARENCIA: TDateTimeField;
    QryFundosANIVERSARIO: TFloatField;
    QryFundosULTSALDOQTD: TFloatField;
    QryFundosULTSALDOVALOR: TFloatField;
    UpdtFundos: TUpdateSQL;
    RptFundosLine1: TppLine;
    qryIRRendaVar: TwwQuery;
    dsIRRendaVar: TwwDataSource;
    bdeIRRendaVar: TppBDEPipeline;
    RptIRRendaVar: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    updIRRendaVar: TUpdateSQL;
    qryIRRendaVarIDHISTCARTINV: TFloatField;
    qryIRRendaVarSIGLAEMISSOR: TStringField;
    qryIRRendaVarCODTIPOACAO: TStringField;
    qryIRRendaVarDATAMOVCARTINV: TDateTimeField;
    qryIRRendaVarQTDEMOVINVCART: TFloatField;
    qryIRRendaVarTOTALDESP: TFloatField;
    qryIRRendaVarVLRUNITVENDA: TFloatField;
    qryIRRendaVarLOTE: TFloatField;
    qryIRRendaVarLUCRO: TFloatField;
    qryIRRendaVarPREJUIZO: TFloatField;
    RptIRRendaVarLabel2: TppLabel;
    RptIRRendaVarLabel4: TppLabel;
    RptIRRendaVarLabel5: TppLabel;
    RptIRRendaVarLabel6: TppLabel;
    RptIRRendaVarDBText1: TppDBText;
    RptIRRendaVarDBText2: TppDBText;
    RptIRRendaVarDBText3: TppDBText;
    RptIRRendaVarDBText4: TppDBText;
    RptIRRendaVarDBText5: TppDBText;
    RptIRRendaVarDBText6: TppDBText;
    qryIRRendaVarVLRUNITCOMPRA: TFloatField;
    RptIRRendaVarDBText7: TppDBText;
    RptIRRendaVarDBText8: TppDBText;
    RptIRRendaVarDBText9: TppDBText;
    RptIRRendaVarDBText10: TppDBText;
    RptIRRendaVarDBText11: TppDBText;
    RptIRRendaVarSummaryBand1: TppSummaryBand;
    RptIRRendaVarDBCalc1: TppDBCalc;
    RptIRRendaVarLabel18: TppLabel;
    RptIRRendaVarDBCalc2: TppDBCalc;
    RptIRRendaVarDBCalc3: TppDBCalc;
    RptIRRendaVarDBCalc4: TppDBCalc;
    qryIRRendaVarIDCARTEIRAINVEST: TFloatField;
    qryIRRendaVarIDINVESTIMENTO: TFloatField;
    qryIRRendaVarIDLOTE: TStringField;
    qryIRRendaVarVLRMOVCARTINV: TFloatField;
    RptEvolImpostos: TppReport;
    ppHeaderBand20: TppHeaderBand;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    RptEvolImpostosppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppDBText21: TppDBText;
    RptEvolImpostosDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    RptEvolImpostosLabel82: TppLabel;
    RptEvolImpostosLabel2: TppLabel;
    RptEvolImpostosDBText1: TppDBText;
    RptEvolImpostosDBText3: TppDBText;
    RptEvolImpostosDBText4: TppDBText;
    RptEvolImpostosLabel4: TppLabel;
    RptEvolImpostosLabel5: TppLabel;
    ppDetailBand19: TppDetailBand;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    RptEvolImpostosDBText2: TppDBText;
    RptEvolImpostosDBText5: TppDBText;
    ppFooterBand19: TppFooterBand;
    ppLine40: TppLine;
    ppLabel83: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    qryEvolImpostos: TwwQuery;
    qryEvolImpostosIDCARTEIRAINVEST: TFloatField;
    qryEvolImpostosIDINVESTIMENTO: TFloatField;
    qryEvolImpostosDATAMOVCARTINV: TDateTimeField;
    qryEvolImpostosTIPMOVCARTINV: TStringField;
    m: TFloatField;
    qryEvolImpostosVLRVARIACAO: TFloatField;
    qryEvolImpostosSALDOIRPROV: TFloatField;
    qryEvolImpostosIDLOTE: TStringField;
    qryEvolImpostosVLRIR: TFloatField;
    qryEvolImpostosSALDOIOFPROV: TFloatField;
    qryEvolImpostosDESCCARTINVEST: TStringField;
    qryEvolImpostosDESCINVESTIMENTO: TStringField;
    qryEvolImpostosDATAEMTITRENFIX: TDateTimeField;
    qryEvolImpostosJUROSRENFIX: TFloatField;
    qryEvolImpostosINDEXRENFIX: TFloatField;
    qryEvolImpostosPERCINDEX: TFloatField;
    qryEvolImpostosINDEXRENFIX2: TFloatField;
    qryEvolImpostosPERCINDEX2: TFloatField;
    qryEvolImpostosDESCTIPRENFIXA: TStringField;
    qryEvolImpostosNOME: TStringField;
    qryEvolImpostosMOESIGLA1: TStringField;
    qryEvolImpostosMOESIGLA2: TStringField;
    qryEvolImpostosIRACUMMES: TFloatField;
    qryEvolImpostosPOSSUISALDO: TFloatField;
    qryEvolImpostosVLRIOF: TFloatField;
    qryEvolImpostosNATURMOVCARTINV: TStringField;
    qryEvolImpostosVLRMOVCARTINV: TFloatField;
    qryEvolImpostosHISTMOVCARTINV: TStringField;
    dsEvolImpostos: TwwDataSource;
    bdeEvolImpostos: TppBDEPipeline;
    updEvolImpostos: TUpdateSQL;
    RptEvolImpostosLabel7: TppLabel;
    RptEvolImpostosLabel8: TppLabel;
    RptEvolImpostosDBText6: TppDBText;
    qryEvolImpostosRENDIMENTO: TFloatField;
    qryEvolImpostosRENDACUMMES: TFloatField;
    ppLabel80: TppLabel;
    ppDBText39: TppDBText;
    qryEvolImpostosVLRCOMPRATITLOTE: TFloatField;
    RptEvolImpostosDBText7: TppDBText;
    RptIntegraFinContabil: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppShape1: TppShape;
    RptIntegraFinContabilLabel3: TppLabel;
    RptIntegraFinContabilLabel4: TppLabel;
    RptIntegraFinContabilLabel5: TppLabel;
    RptIntegraFinContabilLabel6: TppLabel;
    RptIntegraFinContabilLabel7: TppLabel;
    RptIntegraFinContabilLabel8: TppLabel;
    RptIntegraFinContabilLabel9: TppLabel;
    RptIntegraFinContabilLabel10: TppLabel;
    RptIntegraFinContabilLabel11: TppLabel;
    RptIntegraFinContabilLine3: TppLine;
    RptIntegraFinContabilLabel2: TppLabel;
    RptIntegraFinContabilLabel13: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppShape23: TppShape;
    RptIntegraFinContabilDBText3: TppDBText;
    RptIntegraFinContabilDBText4: TppDBText;
    RptIntegraFinContabilDBText5: TppDBText;
    RptIntegraFinContabilDBText6: TppDBText;
    RptIntegraFinContabilDBText7: TppDBText;
    RptIntegraFinContabilDBText8: TppDBText;
    RptIntegraFinContabilDBText9: TppDBText;
    RptIntegraFinContabilDBText10: TppDBText;
    RptIntegraFinContabilDBText11: TppDBText;
    RptIntegraFinContabilLabel14: TppLabel;
    RptIntegraFinContabilLabel15: TppLabel;
    ppFooterBand5: TppFooterBand;
    ppLine22: TppLine;
    ppLabel91: TppLabel;
    RptIntegraFinContabilGroup1: TppGroup;
    RptIntegraFinContabilGroupHeaderBand1: TppGroupHeaderBand;
    RptIntegraFinContabilGroupFooterBand1: TppGroupFooterBand;
    RptIntegraFinContabilGroup2: TppGroup;
    RptIntegraFinContabilGroupHeaderBand2: TppGroupHeaderBand;
    RptIntegraFinContabilDBText2: TppDBText;
    RptIntegraFinContabilLabel12: TppLabel;
    RptIntegraFinContabilLabel1: TppLabel;
    RptIntegraFinContabilDBText1: TppDBText;
    RptIntegraFinContabilLine1: TppLine;
    RptIntegraFinContabilLine2: TppLine;
    RptIntegraFinContabilGroupFooterBand2: TppGroupFooterBand;
    bdeIntegraFinContabil: TppBDEPipeline;
    updIntegraFinContabil: TUpdateSQL;
    qryIntegraFinContabil: TwwQuery;
    qryIntegraFinContabilTIPOINVESTIMENTO: TStringField;
    qryIntegraFinContabilOPERACAO: TStringField;
    qryIntegraFinContabilRUBRICA: TStringField;
    qryIntegraFinContabilTIPOTITULO: TStringField;
    qryIntegraFinContabilINVESTIMENTO: TStringField;
    qryIntegraFinContabilCARTEIRA: TStringField;
    qryIntegraFinContabilHISTORICO: TStringField;
    qryIntegraFinContabilTIPOLANCTO: TStringField;
    qryIntegraFinContabilTIPOOPERCONTABIL: TStringField;
    qryIntegraFinContabilCONTADEBITO: TStringField;
    qryIntegraFinContabilCONTACREDITO: TStringField;
    dsIntegraFinContabil: TwwDataSource;
    QryAux2: TwwQuery;
    QryAux1: TwwQuery;
    bdeEvolIRLit: TppBDEPipeline;
    dtsEvolIRLit: TwwDataSource;
    qryEvolIRLit: TwwQuery;
    RpEvolIRLit: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppDetailBand8: TppDetailBand;
    RpEvolIRLitDBText2: TppDBText;
    RpEvolIRLitDBText3: TppDBText;
    RpEvolIRLitDBText4: TppDBText;
    RpEvolIRLitDBText5: TppDBText;
    RpEvolIRLitDBText6: TppDBText;
    RpEvolIRLitDBText1: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine26: TppLine;
    ppLabel63: TppLabel;
    RpEvolIRLitGroup1: TppGroup;
    RpEvolIRLitGroupHeaderBand1: TppGroupHeaderBand;
    RpEvolIRLitGroupFooterBand1: TppGroupFooterBand;
    RpEvolIRLitDBCalc1: TppDBCalc;
    RpEvolIRLitDBCalc2: TppDBCalc;
    qryHistCotAcao: TwwQuery;
    dtsHistCotAcao: TwwDataSource;
    bdeHistCotAcao: TppBDEPipeline;
    RptHistCotAcao: TppReport;
    ppHeaderBand9: TppHeaderBand;
    RptHistCotAcaoLabel11: TppLabel;
    RptHistCotAcaoLabel12: TppLabel;
    RptHistCotAcaoLabel13: TppLabel;
    RptHistCotAcaoLabel14: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppFooterBand8: TppFooterBand;
    ppLine28: TppLine;
    ppLabel53: TppLabel;
    qryCompCartCust: TwwQuery;
    StringField1: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField4: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    StringField6: TStringField;
    FloatField18: TFloatField;
    qryCompCartCustDESCMOTBLOQ: TStringField;
    qryCompCartCustIDCUSTODIANTE: TFloatField;
    qryCompCartCustSGLCUSTODIANTE: TStringField;
    qryCompCartCustTOTLIBBLOQ: TFloatField;
    dtsCompCartCust: TwwDataSource;
    bdeCompCartCust: TppBDEPipeline;
    RptCompCartCust: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel89: TppLabel;
    ppLabel92: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppDBText4: TppDBText;
    ppDetailBand12: TppDetailBand;
    RptCompCartCustShape1: TppShape;
    ppDBText45: TppDBText;
    ppDBText41: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText32: TppDBText;
    ppDBText40: TppDBText;
    ppDBText42: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppLabel105: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppFooterBand11: TppFooterBand;
    ppLabel106: TppLabel;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    updCompCartCust: TUpdateSQL;
    RptCompCartCustLabel1: TppLabel;
    RptCompCartCustDBText1: TppDBText;
    ppLabel109: TppLabel;
    RptCompCartCustLine1: TppLine;
    qryCompCartCustVALMERCADO: TFloatField;
    RptCompCartCustDBCalc1: TppDBCalc;
    RptCompCartCustDBText2: TppDBText;
    RptCompCartCustDBCalc2: TppDBCalc;
    RptCompCartCustDBCalc3: TppDBCalc;
    RptCompCartCustDBCalc4: TppDBCalc;
    RptCompCartCustShape2: TppShape;
    RptCompCartCustLine2: TppLine;
    qryCompCartCustIDLOTE: TStringField;
    bdeOperBolsa: TppBDEPipeline;
    dtsOperBolsa: TwwDataSource;
    qryOperBolsa: TwwQuery;
    qryOperBolsaSGLCORRETVALORES: TStringField;
    qryOperBolsaDESCTIPOOPERACAO: TStringField;
    qryOperBolsaDESCMERCADO: TStringField;
    qryOperBolsaDESCINVESTIMENTO: TStringField;
    qryOperBolsaDATAOPERACAO: TDateTimeField;
    qryOperBolsaQTDEOPERACAO: TFloatField;
    qryOperBolsaPRECOUNITOPERACAO: TFloatField;
    qryOperBolsaVLROPERACAO: TFloatField;
    qryOperBolsaDATALIQOPER: TDateTimeField;
    qryOperBolsaQTDEPENDENTE: TFloatField;
    RpOperBolsa: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppLine33: TppLine;
    RpOperBolsaLabel2: TppLabel;
    RpOperBolsaDBText2: TppDBText;
    RpOperBolsaLabel3: TppLabel;
    RpOperBolsaLabel4: TppLabel;
    RpOperBolsaLabel5: TppLabel;
    RpOperBolsaLabel6: TppLabel;
    RpOperBolsaLabel7: TppLabel;
    RpOperBolsaLabel8: TppLabel;
    RpOperBolsaLine1: TppLine;
    ppLPeriodoOperPend: TppDBText;
    RpOperBolsaLabel1: TppLabel;
    ppDetailBand14: TppDetailBand;
    RpOperBolsaDBText1: TppDBText;
    RpOperBolsaDBText3: TppDBText;
    RpOperBolsaDBText4: TppDBText;
    RpOperBolsaDBText5: TppDBText;
    RpOperBolsaDBText6: TppDBText;
    RpOperBolsaDBText7: TppDBText;
    RpOperBolsaDBText8: TppDBText;
    RpOperBolsaDBText10: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine36: TppLine;
    ppLabel93: TppLabel;
    RpOperBolsaGroup1: TppGroup;
    RpOperBolsaGroupHeaderBand1: TppGroupHeaderBand;
    RpOperBolsaGroupFooterBand1: TppGroupFooterBand;
    RpOperBolsaLabel9: TppLabel;
    RpOperBolsaDBCalc1: TppDBCalc;
    RpOperBolsaDBCalc2: TppDBCalc;
    bdeOperRendaVar: TppBDEPipeline;
    dtsOperRendaVar: TwwDataSource;
    qryOperRendaVar: TwwQuery;
    qryOperRendaVarDATAOPERACAO: TDateTimeField;
    qryOperRendaVarDESCINVESTIMENTO: TStringField;
    qryOperRendaVarQTDEOPERACAO: TFloatField;
    qryOperRendaVarVLROPERACAO: TFloatField;
    qryOperRendaVarRESULTADO: TFloatField;
    qryOperRendaVarVLRIR: TFloatField;
    qryOperRendaVarCONTADOR: TFloatField;
    qryOperRendaVarVALCUSTO: TFloatField;
    RptOperRendaVar: TppReport;
    ppHeaderBand10: TppHeaderBand;
    RptOperRendaVarLabel8: TppLabel;
    RptOperRendaVarLabel10: TppLabel;
    RptOperRendaVarLabel16: TppLabel;
    RptOperRendaVarShape1: TppShape;
    RptOperRendaVarLine1: TppLine;
    ppLine29: TppLine;
    RptOperRendaVarLabel1: TppLabel;
    RptOperRendaVarLabel2: TppLabel;
    RptOperRendaVarLabel3: TppLabel;
    RptOperRendaVarLabel4: TppLabel;
    RptOperRendaVarLabel5: TppLabel;
    RptOperRendaVarLabel6: TppLabel;
    RptOperRendaVarLabel15: TppLabel;
    RptOperRendaVarLabel9: TppLabel;
    ppDetailBand10: TppDetailBand;
    RptOperRendaVarDBText1: TppDBText;
    RptOperRendaVarDBText3: TppDBText;
    RptOperRendaVarDBText4: TppDBText;
    RptOperRendaVarDBText5: TppDBText;
    RptOperRendaVarDBText6: TppDBText;
    RptOperRendaVarDBCalc8: TppDBCalc;
    RptOperRendaVarDBCalc7: TppDBCalc;
    RptOperRendaVarDBText7: TppDBText;
    RptOperRendaVarDBText2: TppDBText;
    LBTESTE: TppLabel;
    ppFooterBand9: TppFooterBand;
    ppLine30: TppLine;
    ppLabel58: TppLabel;
    RptOperRendaVarSummaryBand1: TppSummaryBand;
    RptOperRendaVarLabel14: TppLabel;
    RptOperRendaVarDBCalc11: TppDBCalc;
    RptOperRendaVarDBCalc12: TppDBCalc;
    RptOperRendaVarDBCalc13: TppDBCalc;
    RptOperRendaVarDBCalc14: TppDBCalc;
    RptOperRendaVarDBCalc17: TppDBCalc;
    RptOperRendaVarGroup1: TppGroup;
    RptOperRendaVarGroupHeaderBand1: TppGroupHeaderBand;
    RptOperRendaVarGroupFooterBand1: TppGroupFooterBand;
    RptOperRendaVarDBCalc4: TppDBCalc;
    RptOperRendaVarDBCalc5: TppDBCalc;
    RptOperRendaVarDBCalc6: TppDBCalc;
    RptOperRendaVarLabel13: TppLabel;
    RptOperRendaVarDBCalc10: TppDBCalc;
    RptOperRendaVarDBCalc16: TppDBCalc;
    RptOperRendaVarLabelDescInvest: TppLabel;
    RptOperRendaVarGroup2: TppGroup;
    RptOperRendaVarGroupHeaderBand2: TppGroupHeaderBand;
    RptOperRendaVarGroupFooterBand2: TppGroupFooterBand;
    RptOperRendaVarDBCalc1: TppDBCalc;
    RptOperRendaVarDBCalc2: TppDBCalc;
    RptOperRendaVarDBCalc3: TppDBCalc;
    RptOperRendaVarLabel12: TppLabel;
    RptOperRendaVarDBCalc9: TppDBCalc;
    RptOperRendaVarDBCalc15: TppDBCalc;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    ppCalc25: TppSystemVariable;
    ppCalc26: TppSystemVariable;
    ppCalc21: TppSystemVariable;
    ppCalc22: TppSystemVariable;
    ppCalc15: TppSystemVariable;
    ppCalc16: TppSystemVariable;
    ppCalc13: TppSystemVariable;
    ppCalc14: TppSystemVariable;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    ppCalc35: TppSystemVariable;
    ppCalc36: TppSystemVariable;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    RpConsMovBMF: TppReport;
    ppHeaderBand21: TppHeaderBand;
    ppShape6: TppShape;
    ppLine61: TppLine;
    ppLabel153: TppLabel;
    ppLabel155: TppLabel;
    ppLine62: TppLine;
    ppLabel158: TppLabel;
    ppLabel159: TppLabel;
    ppLabel160: TppLabel;
    ppLabel162: TppLabel;
    ppLabel154: TppLabel;
    ppDetailBand21: TppDetailBand;
    ppShape7: TppShape;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppFooterBand20: TppFooterBand;
    ppLine63: TppLine;
    ppSystemVariable5: TppSystemVariable;
    ppSummaryBand5: TppSummaryBand;
    ppLine64: TppLine;
    pplblTotalCorretora: TppLabel;
    ppLine65: TppLine;
    pplblTotalOperado: TppLabel;
    ppLine66: TppLine;
    ppTotalOperado: TppLabel;
    ppTotalCorretora: TppLabel;
    ppOperadoCV: TppLabel;
    ppCorretoraCV: TppLabel;
    ppBDEConsMovBMF: TppBDEPipeline;
    RpConsAjstBMF: TppReport;
    ppHeaderBand22: TppHeaderBand;
    ppShape8: TppShape;
    ppLine67: TppLine;
    ppLabel161: TppLabel;
    ppLabel163: TppLabel;
    ppLine68: TppLine;
    ppLabel168: TppLabel;
    ppLabel171: TppLabel;
    ppDetailBand22: TppDetailBand;
    ppShape9: TppShape;
    ppDBText79: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText85: TppDBText;
    ppFooterBand21: TppFooterBand;
    ppLine69: TppLine;
    ppSystemVariable7: TppSystemVariable;
    ppSummaryBand6: TppSummaryBand;
    ppLine70: TppLine;
    ppLabel174: TppLabel;
    ppLabel175: TppLabel;
    rTotalAjustesNeg: TppLabel;
    rTotalAjustesPos: TppLabel;
    ppPeriodoConsAjstBMF: TppBDEPipeline;
    ppLabel167: TppLabel;
    rTotalAjustes: TppLabel;
    ppLine71: TppLine;
    ppLabel164: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel165: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppLine72: TppLine;
    ppLabel166: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppLabel169: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    updOperDireito: TUpdateSQL;
    qryOperDireito: TwwQuery;
    qryOperDireitoSIGLAEMISSOR: TStringField;
    qryOperDireitoDATAAGE: TDateTimeField;
    qryOperDireitoDESCTIPOOPERACAO: TStringField;
    qryOperDireitoSTATUS: TStringField;
    qryOperDireitoOBSERVACAO: TMemoField;
    qryOperDireitoDESCINVESTIMENTO: TStringField;
    qryOperDireitoDESCCARTINVEST: TStringField;
    qryOperDireitoSGLCUSTODIANTE: TStringField;
    qryOperDireitoSIGLAMOTBLOQ: TStringField;
    qryOperDireitoIDLOTE: TStringField;
    qryOperDireitoDATAREFERENCIA: TDateTimeField;
    qryOperDireitoQTDE: TFloatField;
    qryOperDireitoQTDEDIREITO: TFloatField;
    qryOperDireitoVALOREXERCIDO: TFloatField;
    qryOperDireitoIDCARTEIRAINVEST: TFloatField;
    qryOperDireitoIDINVESTIMENTO: TFloatField;
    qryOperDireitoIDCUSTODIANTE: TFloatField;
    qryOperDireitoIDMOTIVOBLOQUEIO: TFloatField;
    qryOperDireitoIDTIPOOPERACAO: TFloatField;
    qryOperDireitoIDEMISSOR: TFloatField;
    qryOperDireitoIDOPERACAODIREITO: TFloatField;
    qryOperDireitoQTDELOTE: TFloatField;
    qryOperDireitoDATAEX: TDateTimeField;
    qryOperDireitoPU: TFloatField;
    qryOperDireitoDATACOM: TDateTimeField;
    dtsOperDireito: TwwDataSource;
    bdeOperDireito: TppBDEPipeline;
    RptOperDireito: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppDetailBand11: TppDetailBand;
    RptOperDireitoDBText2: TppDBText;
    RptOperDireitoDBText3: TppDBText;
    RptOperDireitoDBText4: TppDBText;
    RptOperDireitoDBText7: TppDBText;
    RptOperDireitoDBText8: TppDBText;
    RptOperDireitoDBText10: TppDBText;
    RptOperDireitoDBText11: TppDBText;
    RptOperDireitoDBText5: TppDBText;
    RptOperDireitoDBText9: TppDBText;
    RptOperDireitoDBText1: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine32: TppLine;
    ppLabel62: TppLabel;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    RptOperDireitoGroup1: TppGroup;
    RptOperDireitoGroupHeaderBand1: TppGroupHeaderBand;
    RptOperDireitoGroupFooterBand1: TppGroupFooterBand;
    RptOperDireitoGroup2: TppGroup;
    RptOperDireitoGroupHeaderBand2: TppGroupHeaderBand;
    RptOperDireitoGroupFooterBand2: TppGroupFooterBand;
    RptOperDireitoGroup3: TppGroup;
    RptOperDireitoGroupHeaderBand3: TppGroupHeaderBand;
    RptOperDireitoGroupFooterBand3: TppGroupFooterBand;
    RpAnuncioSubscricao: TppReport;
    ppHeaderBand23: TppHeaderBand;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppLabel172: TppLabel;
    ppShape12: TppShape;
    ppLabel173: TppLabel;
    ppShape13: TppShape;
    ppLine73: TppLine;
    ppLine74: TppLine;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLabel176: TppLabel;
    ppLabel177: TppLabel;
    ppShape14: TppShape;
    ppLine77: TppLine;
    ppLine78: TppLine;
    ppLine79: TppLine;
    ppLine80: TppLine;
    ppLabel178: TppLabel;
    ppLabel179: TppLabel;
    ppShape15: TppShape;
    ppLabel180: TppLabel;
    ppShape16: TppShape;
    ppLabel181: TppLabel;
    ppShape17: TppShape;
    ppLine81: TppLine;
    ppLine82: TppLine;
    ppLabel182: TppLabel;
    ppLabel183: TppLabel;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppLine83: TppLine;
    ppLabel184: TppLabel;
    ppLine84: TppLine;
    ppLine85: TppLine;
    ppLine86: TppLine;
    ppLine87: TppLine;
    ppLabel185: TppLabel;
    ppLabel186: TppLabel;
    ppLabel187: TppLabel;
    ppLabel188: TppLabel;
    ppLabel189: TppLabel;
    ppLabel190: TppLabel;
    ppLabel191: TppLabel;
    ppShape20: TppShape;
    ppLabel192: TppLabel;
    ppLabel193: TppLabel;
    ppLine88: TppLine;
    ppLabel194: TppLabel;
    ppLabel195: TppLabel;
    ppLabel196: TppLabel;
    ppLabel197: TppLabel;
    ppLabel198: TppLabel;
    ppShape21: TppShape;
    ppLabel199: TppLabel;
    ppDBText80: TppDBText;
    ppLabel200: TppLabel;
    ppDBText83: TppDBText;
    ppLabel201: TppLabel;
    ppLabel202: TppLabel;
    ppLabel203: TppLabel;
    ppDBText84: TppDBText;
    ppLabel204: TppLabel;
    ppDBText86: TppDBText;
    ppLabel205: TppLabel;
    ppDBText87: TppDBText;
    ppLine89: TppLine;
    ppLine90: TppLine;
    ppLine91: TppLine;
    pplTipoOrig: TppLabel;
    pplTipoDest: TppLabel;
    ppLBovBase: TppLabel;
    ppLTipoBase: TppLabel;
    ppLTipoSubs: TppLabel;
    ppLBovSubs: TppLabel;
    ppLQtdBase: TppLabel;
    ppLQtdSubs: TppLabel;
    pplTipoFinDes: TppLabel;
    pplFinDes: TppLabel;
    pplTotFinDes: TppLabel;
    pplEmpresa: TppLabel;
    ppLabel206: TppLabel;
    ppLabel207: TppLabel;
    ppDetailBand23: TppDetailBand;
    ppFooterBand22: TppFooterBand;
    ppLabel208: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppLine92: TppLine;
    ppSystemVariable11: TppSystemVariable;
    ppBDEAnuncioSubscricao: TppBDEPipeline;
    RpConciliacaoCustodia: TppReport;
    ppHeaderBand19: TppHeaderBand;
    ppShape4: TppShape;
    ppLabel139: TppLabel;
    ppLabel143: TppLabel;
    ppLabel150: TppLabel;
    ppLabel140: TppLabel;
    ppLabel141: TppLabel;
    ppLabel142: TppLabel;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    ppLine57: TppLine;
    ppLine58: TppLine;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppDetailBand20: TppDetailBand;
    ppShape5: TppShape;
    ppDBText66: TppDBText;
    ppDBText70: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText71: TppDBText;
    ppFooterBand18: TppFooterBand;
    ppLabel148: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLine59: TppLine;
    ppSummaryBand4: TppSummaryBand;
    ppLabel149: TppLabel;
    ppLine60: TppLine;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    QryConciliacaoCustodia: TwwQuery;
    QryConciliacaoCustodiaSTATUS: TStringField;
    QryConciliacaoCustodiaDESCINVESTIMENTO: TStringField;
    QryConciliacaoCustodiaCODISIN: TStringField;
    QryConciliacaoCustodiaQTDE: TFloatField;
    QryConciliacaoCustodiaQTDTITULOS: TFloatField;
    QryConciliacaoCustodiaQTDEDIVERGENTE: TFloatField;
    QryConciliacaoCustodiaOBSERVACAO: TStringField;
    QryConciliacaoCustodiaIDCARTEIRAINVEST: TFloatField;
    QryConciliacaoCustodiaIDINVESTIMENTO: TFloatField;
    QryConciliacaoCustodiaDESCCARTINVEST: TStringField;
    QryConciliacaoCustodiaIDLOTE: TStringField;
    QryConciliacaoCustodiaQTDELOTE: TFloatField;
    QryConciliacaoCustodiaIDCONCILIACUSTODIA: TFloatField;
    QryConciliacaoCustodiaTOTALQTDEDIVERGENTE: TFloatField;
    QryConciliacaoCustodiaTOTALQTDTITULOS: TFloatField;
    QryConciliacaoCustodiaTOTALQTDE: TFloatField;
    DsConciliacaoCustodia: TwwDataSource;
    UpdConciliacaoCustodia: TUpdateSQL;
    ppBDEConciliacaoCustodia: TppBDEPipeline;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppLabel227: TppLabel;
    ppLabel228: TppLabel;
    ppLabel229: TppLabel;
    ppDBText97: TppDBText;
    ppReport2: TppReport;
    ppHeaderBand25: TppHeaderBand;
    ppShape25: TppShape;
    ppLine99: TppLine;
    ppLabel232: TppLabel;
    ppLabel233: TppLabel;
    ppLine100: TppLine;
    ppLabel235: TppLabel;
    ppLabel236: TppLabel;
    ppLabel237: TppLabel;
    ppLabel238: TppLabel;
    ppLabel239: TppLabel;
    ppDetailBand25: TppDetailBand;
    ppShape26: TppShape;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppFooterBand24: TppFooterBand;
    ppLine101: TppLine;
    ppSystemVariable15: TppSystemVariable;
    ppLine102: TppLine;
    ppLabel240: TppLabel;
    ppSystemVariable16: TppSystemVariable;
    ppLabel241: TppLabel;
    ppSystemVariable17: TppSystemVariable;
    ppSummaryBand8: TppSummaryBand;
    ppLine103: TppLine;
    ppLabel242: TppLabel;
    ppLabel243: TppLabel;
    ppLabel244: TppLabel;
    ppLabel245: TppLabel;
    ppLabel246: TppLabel;
    ppLabel247: TppLabel;
    ppLine104: TppLine;
    ppBDEPipeline2: TppBDEPipeline;
    updGerCartCust: TUpdateSQL;
    qryGerCartCust: TwwQuery;
    qryGerCartCustIDCARTEIRAINVEST: TFloatField;
    qryGerCartCustIDINVESTIMENTO: TFloatField;
    qryGerCartCustDESCINVESTIMENTO: TStringField;
    qryGerCartCustIDEMISSOR: TFloatField;
    qryGerCartCustDESCCARTINVEST: TStringField;
    qryGerCartCustDESCSETOREMISSOR: TStringField;
    qryGerCartCustCODTIPOACAO: TStringField;
    qryGerCartCustSIGLAACAOBOLSA: TStringField;
    qryGerCartCustIDMOTIVOBLOQUEIO: TFloatField;
    qryGerCartCustSIGLAMOTBLOQ: TStringField;
    qryGerCartCustSALDOAQUI: TFloatField;
    qryGerCartCustSALDOATU: TFloatField;
    qryGerCartCustQTDTITLOTE: TFloatField;
    qryGerCartCustSALDOQTDEINVCART: TFloatField;
    qryGerCartCustSALDOCAR: TFloatField;
    qryGerCartCustCOTACAOAUX: TFloatField;
    qryGerCartCustCOTACAO: TFloatField;
    qryGerCartCustTOTCART: TFloatField;
    qryGerCartCustTOTACAOTIPO: TFloatField;
    qryGerCartCustTOTLIBERADO: TFloatField;
    qryGerCartCustTOTBLOQUEADO: TFloatField;
    qryGerCartCustVISIVEL: TFloatField;
    qryGerCartCustTOTACAO: TFloatField;
    dsGerCartCust: TwwDataSource;
    bdeGerCartCust: TppBDEPipeline;
    RptGerCartCust: TppReport;
    ppHeaderBand6: TppHeaderBand;
    RptGerCartCustLine4: TppLine;
    RptGerCartCustLine3: TppLine;
    RptGerCartCustLine2: TppLine;
    RptGerCartCustLine1: TppLine;
    ppLine14: TppLine;
    RptGerCarteiraLine1: TppLine;
    RptGerCarteiraLabel3: TppLabel;
    RptGerCarteiraLabel5: TppLabel;
    LblCusto: TppLabel;
    RptGerCarteiraLabel6: TppLabel;
    RptGerCarteiraLabel7: TppLabel;
    ppLabel29: TppLabel;
    RptGerCartCustLabel1: TppLabel;
    RptGerCartCustLabel2: TppLabel;
    RptGerCartCustLabel3: TppLabel;
    RptGerCartCustLabel4: TppLabel;
    RptGerCarteiraLabel9: TppLabel;
    RptGerCarteiraLabel10: TppLabel;
    RptGerCarteiraLabel11: TppLabel;
    RptGerCartCustLabel5: TppLabel;
    RptGerCartCustLabel6: TppLabel;
    RptGerCartCustLabel7: TppLabel;
    RptGerCartCustLabel8: TppLabel;
    RptGerCartCustLabel9: TppLabel;
    RptGerCarteiraLabel8: TppLabel;
    ppDetailBand6: TppDetailBand;
    RptGerCarteiraDBText3: TppDBText;
    RptGerCarteiraDBText4: TppDBText;
    LblSaldoCarr: TppDBText;
    RptGerCarteiraDBText5: TppDBText;
    RptGerCartCustDBText1: TppDBText;
    RptGerCartCustDBText2: TppDBText;
    RptGerCartCustDBText3: TppDBText;
    LblSaldoAqui: TppDBText;
    LblSaldoAtu: TppDBText;
    RptGerCartCustDBText5: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLabel30: TppLabel;
    ppLine15: TppLine;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    RptGerCarteiraLabel16: TppLabel;
    RptGerCarteiraLabel18: TppLabel;
    RptGerCarteiraLabel19: TppLabel;
    RptGerCartCustDBText4: TppDBText;
    RptGerCarteiraLabel17: TppLabel;
    RptGerCarteiraGroup1: TppGroup;
    RptGerCarteiraGroupHeaderBand1: TppGroupHeaderBand;
    RptGerCarteiraLabel12: TppLabel;
    RptGerCarteiraDBText1: TppDBText;
    RptGerCarteiraGroupFooterBand1: TppGroupFooterBand;
    RptGerCarteiraGroup2: TppGroup;
    RptGerCarteiraGroupHeaderBand2: TppGroupHeaderBand;
    RptGerCarteiraLabel13: TppLabel;
    RptGerCarteiraDBText2: TppDBText;
    RptGerCarteiraLine3: TppLine;
    RptGerCarteiraLine4: TppLine;
    RptGerCarteiraGroupFooterBand2: TppGroupFooterBand;
    RptGerCartCustLabel10: TppLabel;
    qryOperDireitoNUMDOCUMENTO: TStringField;
    BdeDemoOpVd: TppBDEPipeline;
    DsDemoOpVd: TwwDataSource;
    QryDemoOpVd: TwwQuery;
    QryDemoOpVdDESCINVESTIMENTO: TStringField;
    QryDemoOpVdDATAMOVCARTINV: TDateTimeField;
    QryDemoOpVdQTDEMOVINVCART: TFloatField;
    QryDemoOpVdVLRMOVCARTINV: TFloatField;
    QryDemoOpVdVALCUSTO: TFloatField;
    QryDemoOpVdTOTALDESPESAS: TFloatField;
    QryDemoOpVdRESULTADO: TFloatField;
    QryDemoOpVdVLRIR: TFloatField;
    QryDemoOpVdCONTADOR: TFloatField;
    QryDemoOpVdIDINVESTIMENTO: TFloatField;
    QryDemoOpVdIDTIPOOPERACAO: TFloatField;
    QryDemoOpVdIDMERCADO: TFloatField;
    QryDemoOpVdFLGTRATAIR: TStringField;
    QryDemoOpVdIDCARTEIRAINVEST: TFloatField;
    QryDemoOpVdDATAVENCOPER: TDateTimeField;
    RpDemoOpVd: TppReport;
    ppHeaderBand28: TppHeaderBand;
    ppLabel286: TppLabel;
    ppShape38: TppShape;
    ppLine145: TppLine;
    ppLine146: TppLine;
    ppLabel287: TppLabel;
    ppLabel288: TppLabel;
    ppLabel289: TppLabel;
    ppLabel290: TppLabel;
    ppLabel291: TppLabel;
    ppLabel292: TppLabel;
    ppLabel293: TppLabel;
    ppLabel302: TppLabel;
    ppDataIni: TppLabel;
    ppDataFim: TppLabel;
    ppDetailBand30: TppDetailBand;
    ppShape39: TppShape;
    ppDBText138: TppDBText;
    ppDBText139: TppDBText;
    ppDBText142: TppDBText;
    ppDBText144: TppDBText;
    ppContadorData: TppDBCalc;
    ppContadorAcao: TppDBCalc;
    ppDBText140: TppDBText;
    ppDBText141: TppDBText;
    ppFooterBand27: TppFooterBand;
    ppLine147: TppLine;
    ppLabel297: TppLabel;
    ppSystemVariable22: TppSystemVariable;
    ppSystemVariable23: TppSystemVariable;
    ppSummaryBand7: TppSummaryBand;
    ppLabel298: TppLabel;
    ppDBCalc41: TppDBCalc;
    ppDBCalc42: TppDBCalc;
    ppDBCalc43: TppDBCalc;
    ppDBCalc44: TppDBCalc;
    ppDBCalc45: TppDBCalc;
    ppDBCalc46: TppDBCalc;
    ppGroup13: TppGroup;
    ppRpDemoOpVdGroup1: TppGroupHeaderBand;
    ppDBText137: TppDBText;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppLabel296: TppLabel;
    ppDBCalc35: TppDBCalc;
    ppDBCalc36: TppDBCalc;
    ppDBCalc37: TppDBCalc;
    ppDBCalc38: TppDBCalc;
    ppDBCalc39: TppDBCalc;
    ppDBCalc40: TppDBCalc;
    ppGroup14: TppGroup;
    ppRpDemoOpVdGroup2: TppGroupHeaderBand;
    ppDBText143: TppDBText;
    ppGroupFooterBand14: TppGroupFooterBand;
    ppLabel294: TppLabel;
    ppDBCalc20: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppDBCalc31: TppDBCalc;
    ppDBCalc32: TppDBCalc;
    ppDBCalc33: TppDBCalc;
    ppDBCalc34: TppDBCalc;
    UpdDemoOpVd: TUpdateSQL;
    RptSaldoInv: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    edtCotacao: TppDBText;
    RptSaldoInvDBText1: TppDBText;
    RptSaldoInvDBText2: TppDBText;
    RptSaldoInvLabel4: TppLabel;
    ppFooterBand1: TppFooterBand;
    ppLine5: TppLine;
    ppLabel1: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    ppSystemVariable13: TppSystemVariable;
    RptSaldoInvSummaryBand1: TppSummaryBand;
    RptSaldoInvGroup1: TppGroup;
    RptSaldoInvGroupHeaderBand1: TppGroupHeaderBand;
    RptDemCustoCarteiraLabel2: TppLabel;
    RptSaldoInvDBText3: TppDBText;
    RptSaldoInvGroupFooterBand1: TppGroupFooterBand;
    LblValCont: TppDBCalc;
    LblAqui: TppDBCalc;
    RptSaldoInvLine2: TppLine;
    RptSaldoInvLabel2: TppLabel;
    qrySaldoInv: TwwQuery;
    qrySaldoInvDESCCARTINVEST: TStringField;
    qrySaldoInvDESCINVESTIMENTO: TStringField;
    qrySaldoInvIDLOTE: TStringField;
    qrySaldoInvDATAMOVCARTINV: TDateTimeField;
    qrySaldoInvIDHISTCARTINV: TFloatField;
    qrySaldoInvSALDOQTDEINVCART: TFloatField;
    qrySaldoInvVLRMOVCARTINV: TFloatField;
    qrySaldoInvIDINVESTIMENTO: TFloatField;
    qrySaldoInvIDCARTEIRAINVEST: TFloatField;
    qrySaldoInvSALDOAQUI: TFloatField;
    qrySaldoInvSALDOREND: TFloatField;
    qrySaldoInvSALDOCAR: TFloatField;
    qrySaldoInvQTDEMOVINVCART: TFloatField;
    qrySaldoInvSALDOATU: TFloatField;
    qrySaldoInvCOTACAO: TFloatField;
    qrySaldoInvSALDOVLRINVCART: TFloatField;
    qrySaldoInvIDCARTEIRAINVEST_1: TFloatField;
    qrySaldoInvQTDTITLOTE: TFloatField;
    qrySaldoInvSALDOLIBERADO: TFloatField;
    qrySaldoInvSALDOBLOQUEADO: TFloatField;
    qrySaldoInvNOME: TStringField;
    DtsSaldoInv: TwwDataSource;
    BdeSaldoInv: TppBDEPipeline;
    updSaldoInv: TUpdateSQL;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ppShape24: TppShape;
    RptHistCotAcaoDBText2: TppDBText;
    RptHistCotAcaoDBText3: TppDBText;
    RptHistCotAcaoDBText5: TppDBText;
    RptHistCotAcaoDBText6: TppDBText;
    RptHistCotAcaoDBText7: TppDBText;
    RptHistCotAcaoDBText8: TppDBText;
    RptHistCotAcaoDBText9: TppDBText;
    RptHistCotAcaoDBText10: TppDBText;
    //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
    ppDBText114: TppDBText;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppLCarteiraEx: TppLabel;
    ppLPeriodo: TppLabel;
    ppDbLogo: TppDBImage;
    ppLabel221: TppLabel;
    ppLabel225: TppLabel;
    ppLCarteiraReport: TppLabel;
    ppLabel249: TppLabel;
    ppDBImage5: TppDBImage;
    ppLPeriodoReport: TppLabel;
    ppLabel230: TppLabel;
    ppLabel231: TppLabel;
    ppLCarteiraOperMerFut: TppLabel;
    ppLabel248: TppLabel;
    ppDBImage6: TppDBImage;
    ppPeriodoConsMovBMF: TppLabel;
    ppLabel151: TppLabel;
    ppLabel152: TppLabel;
    ppCarteira: TppLabel;
    ppDBImage7: TppDBImage;
    ppLabel234: TppLabel;
    ppLabel254: TppLabel;
    RptOperRendaVarLabel11: TppLabel;
    ppDBImage8: TppDBImage;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel222: TppLabel;
    ppLabel255: TppLabel;
    ppDBImage9: TppDBImage;
    ppLabel170: TppLabel;
    ppLabel256: TppLabel;
    ppLCarteiraAjuMerFut: TppLabel;
    ppPeriodoAjusteBMF: TppLabel;
    ppDBImage10: TppDBImage;
    ppLabel156: TppLabel;
    ppLabel157: TppLabel;
    ppLCotacaoAcao: TppLabel;
    ppDBImage11: TppDBImage;
    ppShape29: TppShape;
    ppLine27: TppLine;
    RptHistCotAcaoLine1: TppLine;
    RptHistCotAcaoLabel3: TppLabel;
    RptHistCotAcaoLabel5: TppLabel;
    RptHistCotAcaoLabel6: TppLabel;
    RptHistCotAcaoLabel7: TppLabel;
    RptHistCotAcaoLabel8: TppLabel;
    RptHistCotAcaoLabel9: TppLabel;
    RptHistCotAcaoLabel10: TppLabel;
    ppLabel16: TppLabel;
    RptHistCotAcaoLabel2: TppLabel;
    ppLabel9: TppLabel;
    ppLabel48: TppLabel;
    ppLabel52: TppLabel;
    ppLabel82: TppLabel;
    ppDBImage12: TppDBImage;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLCarteiraIntContab: TppLabel;
    ppLabel260: TppLabel;
    ppDBImage13: TppDBImage;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLCarteiraCompGerCartAcoes: TppLabel;
    RptGerCarteiraLabel2: TppLabel;
    ppDBImage14: TppDBImage;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel71: TppLabel;
    ppDBImage15: TppDBImage;
    ppLabel104: TppLabel;
    ppLabel261: TppLabel;
    ppLCarteiraOperDir: TppLabel;
    ppLPeriodoOperDir: TppLabel;
    ppDBImage17: TppDBImage;
    ppShape30: TppShape;
    ppLine31: TppLine;
    RptOperDireitoLabel1: TppLabel;
    RptOperDireitoLabel2: TppLabel;
    RptOperDireitoLabel3: TppLabel;
    RptOperDireitoLabel4: TppLabel;
    RptOperDireitoLabel8: TppLabel;
    RptOperDireitoLine1: TppLine;
    RptOperDireitoLabel11: TppLabel;
    RptOperDireitoLabel9: TppLabel;
    RptOperDireitoLabel5: TppLabel;
    RptOperDireitoLabel6: TppLabel;
    RptOperDireitoLabel10: TppLabel;
    ppLine94: TppLine;
    ppLabel95: TppLabel;
    ppLabel280: TppLabel;
    ppDBImage19: TppDBImage;
    ppShape31: TppShape;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    RptEvolImpostosLabel9: TppLabel;
    RptEvolImpostosLabel3: TppLabel;
    ppLabel78: TppLabel;
    RptEvolImpostosLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel60: TppLabel;
    ppLCarteiraIrAplRendVar: TppLabel;
    ppDBImage20: TppDBImage;
    ppLabel42: TppLabel;
    ppShape32: TppShape;
    ppLine19: TppLine;
    RptIRRendaVarLine1: TppLine;
    RptIRRendaVarLabel7: TppLabel;
    Empresa: TppLabel;
    RptIRRendaVarLabel9: TppLabel;
    RptIRRendaVarLabel10: TppLabel;
    RptIRRendaVarLabel11: TppLabel;
    RptIRRendaVarLabel8: TppLabel;
    RptIRRendaVarLabel12: TppLabel;
    RptIRRendaVarLabel13: TppLabel;
    RptIRRendaVarLabel14: TppLabel;
    RptIRRendaVarLabel15: TppLabel;
    RptIRRendaVarLabel16: TppLabel;
    RptOperRendaVarLabelParam: TppLabel;
    ppLabel43: TppLabel;
    ppLabel79: TppLabel;
    ppLabel81: TppLabel;
    RptResumoOperDataRef: TppLabel;
    ppDBImage21: TppDBImage;
    ppShape33: TppShape;
    ppLine9: TppLine;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine10: TppLine;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel38: TppLabel;
    ppDBImage22: TppDBImage;
    ppShape34: TppShape;
    ppLine16: TppLine;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLine8: TppLine;
    ppLabel281: TppLabel;
    ppLabel282: TppLabel;
    LblCarteira: TppLabel;
    LblPeriodo: TppLabel;
    ppDBImage24: TppDBImage;
    ppShape35: TppShape;
    ppLabel34: TppLabel;
    ppLabel36: TppLabel;
    ppLine23: TppLine;
    RptConsHistInvestLabel1: TppLabel;
    L: TppLabel;
    RptConsHistInvestLabel2: TppLabel;
    RptConsHistInvestLabel3: TppLabel;
    RptConsHistInvestLabel4: TppLabel;
    RptConsHistInvestLabel6: TppLabel;
    RptConsHistInvestLine1: TppLine;
    LblLote: TppLabel;
    RptConsHistInvestLabel7: TppLabel;
    RptConsHistInvestLabel9: TppLabel;
    ppLine17: TppLine;
    ppLabel33: TppLabel;
    ppSystemVariable26: TppSystemVariable;
    ppSystemVariable27: TppSystemVariable;
    ppLabel10: TppLabel;
    ppLabel37: TppLabel;
    ppLabel283: TppLabel;
    RptMapaOperDataRef: TppLabel;
    ppDBImage25: TppDBImage;
    ppShape37: TppShape;
    ppLine6: TppLine;
    RptResumoOperLabel5: TppLabel;
    RptResumoOperLabel6: TppLabel;
    RptResumoOperLabel7: TppLabel;
    RptResumoOperLabel9: TppLabel;
    RptResumoOperLabel10: TppLabel;
    RptResumoOperLine2: TppLine;
    RptResumoOperLabel11: TppLabel;
    RptResumoOperLabel12: TppLabel;
    ppLabel4: TppLabel;
    ppLabel310: TppLabel;
    ppLabel311: TppLabel;
    LblPeriodoInv: TppLabel;
    ppDBImage26: TppDBImage;
    ppShape42: TppShape;
    RptSaldoInvLabel5: TppLabel;
    ppLine1: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel11: TppLabel;
    ppLine2: TppLine;
    RptSaldoInvLabel1: TppLabel;
    RptSaldoInvLabel3: TppLabel;
    ppLabel94: TppLabel;
    ppLabel134: TppLabel;
    ppLabel312: TppLabel;
    RpEvolIRLitLabel7: TppLabel;
    ppDBImage27: TppDBImage;
    ppShape43: TppShape;
    ppLine25: TppLine;
    RpEvolIRLitLabel1: TppLabel;
    RpEvolIRLitLabel2: TppLabel;
    RpEvolIRLitLabel3: TppLabel;
    RpEvolIRLitLabel4: TppLabel;
    RpEvolIRLitLabel5: TppLabel;
    RpEvolIRLitLabel6: TppLabel;
    RpEvolIRLitLine1: TppLine;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel138: TppLabel;
    ppLDataConcilia: TppLabel;
    ppDBImage28: TppDBImage;
    ppBDEPConciliacaoCustodiaFechto: TppBDEPipeline;
    ppRConciliacaoCustodiaFechto: TppReport;
    ppHeaderBand18: TppHeaderBand;
    ppLabel35: TppLabel;
    ppLine3: TppLine;
    ppLabel111: TppLabel;
    pplCarteiraFechto: TppLabel;
    ppLPeriodoFechto: TppLabel;
    ppDBImage1: TppDBImage;
    ppDetailBand18: TppDetailBand;
    ppFooterBand17: TppFooterBand;
    ppLine4: TppLine;
    ppLabel123: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    Panel4: TPanel;
    QryConciliacaoCustodiaFechto: TwwQuery;
    DsConciliacaoCustodiaFechto: TwwDataSource;
    ppShape2: TppShape;
    ppLine24: TppLine;
    ppLabel119: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppLabel127: TppLabel;
    ppShape3: TppShape;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;

    ppBDEExeDireito: TppBDEPipeline;
    dsExeDireito: TwwDataSource;
    qryExeDireito: TwwQuery;
    qryExeDireitoDATAOPERACAO: TDateTimeField;
    qryExeDireitoHISTORICO: TStringField;
    qryExeDireitoQTDEOPERACAO: TFloatField;
    qryExeDireitoVLROPERACAO: TFloatField;
    qryExeDireitoDIVPORACAO: TFloatField;
    qryExeDireitoDESCCARTINVEST: TStringField;
    qryExeDireitoNUMDOCUMENTO: TStringField;
    qryExeDireitoDATAEX: TDateTimeField;
    qryExeDireitoIDOPERACAODIREITO: TFloatField;
    qryExeDireitoIDCARTEIRAINVEST: TFloatField;
    qryExeDireitoVLRREMUNERACAO: TFloatField;
    qryExeDireitoVLRTOTOPERACAO: TFloatField;
    qryExeDireitoVLROPERPROP: TFloatField;
    qryExeDireitoVLROPERGERE: TFloatField;
    qryExeDireitoVLRREMUNPROP: TFloatField;
    qryExeDireitoVLRREMUNGERE: TFloatField;
    qryExeDireitoVLRTOTPROP: TFloatField;
    qryExeDireitoVLRTOTGERE: TFloatField;
    qryExeDireitoPLANPRVCONTABPATRO: TStringField;
    ppRepExeDireito: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppRepExeDireitoLabel4: TppLabel;
    ppDtaIni: TppLabel;
    ppDtaFim: TppLabel;
    ppLabel88: TppLabel;
    ppLabel90: TppLabel;
    ppLCarteiraExecDir: TppLabel;
    ppDBImage16: TppDBImage;
    ppRepExeDireitoShape1: TppShape;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    lblTotRecebido: TppLabel;
    ppLabel31: TppLabel;
    ppLabel122: TppLabel;
    ppLabel103: TppLabel;
    ppLabel114: TppLabel;
    ppLabel59: TppLabel;
    lblVrlRecebido: TppLabel;
    ppDetailBand17: TppDetailBand;
    ppRepExeDireitoShape2: TppShape;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    pdbTotRecebido: TppDBText;
    ppDBText10: TppDBText;
    ppDBText63: TppDBText;
    ppDBText54: TppDBText;
    ppDBText43: TppDBText;
    ppDBText64: TppDBText;
    ppdbVlrRecebido: TppDBText;
    ppFooterBand16: TppFooterBand;
    ppRepExeDireitoLabel3: TppLabel;
    ppRepExeDireitoCalc1: TppSystemVariable;
    ppRepExeDireitoCalc2: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc14: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppShape22: TppShape;
    ppDBText8: TppDBText;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppDBText58: TppDBText;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppLine54: TppLine;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppDBCalc7: TppDBCalc;
    ppLine49: TppLine;
    ppDBCalc10: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLabel61: TppLabel;
    qryExeDireitoDATAOPER: TDateTimeField;
    ppLabel32: TppLabel;
    ppDBText25: TppDBText;
    ppRepExeDireitoCon: TppReport;
    ppHeaderBand15: TppHeaderBand;
    lbla: TppLabel;
    lblDtaIniCon: TppLabel;
    lblDtaFimCon: TppLabel;
    ppLabel112: TppLabel;
    lblempresaCon: TppLabel;
    ppLabel117: TppLabel;
    ppDBImage2: TppDBImage;
    ppShape27: TppShape;
    ppLine44: TppLine;
    ppLabel118: TppLabel;
    ppLabel121: TppLabel;
    ppLabel126: TppLabel;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppLabel131: TppLabel;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppLabel135: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppShape28: TppShape;
    ppDBText44: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText57: TppDBText;
    ppDBText65: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppFooterBand14: TppFooterBand;
    ppLine45: TppLine;
    ppLabel136: TppLabel;
    ppSystemVariable14: TppSystemVariable;
    ppSystemVariable18: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc17: TppDBCalc;
    ppLabel209: TppLabel;
    ppDBCalc22: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    DsExeDireitoCon: TwwDataSource;
    pplRepExeDireitoCon: TppBDEPipeline;
    QryExeDireitoCon: TwwQuery;
    DateTimeField1: TDateTimeField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    StringField10: TStringField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    qryExeDireitoDESCINVESTIMENTO: TStringField;
    qryExeDireitoDESCTIPOOPERACAO: TStringField;
    QryExeDireitoConDESCINVESTIMENTO: TStringField;
    QryExeDireitoConDESCTIPOOPERACAO: TStringField;
    ppGroup12: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppDBText92: TppDBText;
    ppShape36: TppShape;
    ppDBText91: TppDBText;
    ppShape40: TppShape;
    ppLabel107: TppLabel;
    ppDBCalc16: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppLabel108: TppLabel;
    ppDBCalc25: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    ppLabel110: TppLabel;
    qryExeDireitoIDCARTEIRAGERENC: TFloatField;
    QryExeDireitoConIDCARTEIRAGERENC: TFloatField;
    ppShape41: TppShape;
    ppShape44: TppShape;
    ppShape45: TppShape;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppShape46: TppShape;
    ppShape47: TppShape;
    ppLine41: TppLine;
    ppLine37: TppLine;
    ppDBCalc11: TppDBCalc;
    ppGroup16: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppGroupFooterBand16: TppGroupFooterBand;
    qryExeDireitoIDOPERACAOINVEST: TFloatField;
    ppLabel102: TppLabel;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppLabel113: TppLabel;
    ppDBCalc29: TppDBCalc;
    ppDBCalc30: TppDBCalc;
    ppDBCalc47: TppDBCalc;
    ppLabel130: TppLabel;
    ppDBCalc48: TppDBCalc;
    ppDBCalc49: TppDBCalc;
    ppDBCalc50: TppDBCalc;
    ppDBCalc51: TppDBCalc;
    ppDBCalc52: TppDBCalc;
    ppDBCalc53: TppDBCalc;
    ppDBCalc54: TppDBCalc;
    ppDBCalc55: TppDBCalc;
    ppDBCalc56: TppDBCalc;
    ppLabel3: TppLabel;
    ppLabel120: TppLabel;
    ppLabel137: TppLabel;
    ppLabel210: TppLabel;
    ppLabel211: TppLabel;
    ppDBText93: TppDBText;
    //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
    ppDBText113: TppDBText;
    ppLine48: TppLine;
    Panel5: TPanel;
    QryAnunRece: TwwQuery;
    DsAnunRece: TwwDataSource;
    ppBDEAnunRece: TppBDEPipeline;
    ppRepAnunRece: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLabel212: TppLabel;
    ppDtaIniAR: TppLabel;
    ppDtaFimAR: TppLabel;
    ppLabel215: TppLabel;
    ppLabel216: TppLabel;
    ppDBImage3: TppDBImage;
    ppLabel218: TppLabel;
    ppLabel219: TppLabel;
    ppLabel223: TppLabel;
    ppLabel224: TppLabel;
    ppLabel250: TppLabel;
    ppLabel252: TppLabel;
    ppLabel253: TppLabel;
    ppDetailBand16: TppDetailBand;
    ppShape49: TppShape;
    ppDBText94: TppDBText;
    ppDBText105: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppDBText110: TppDBText;
    ppDBText112: TppDBText;
    ppDBText115: TppDBText;
    ppFooterBand15: TppFooterBand;
    ppLabel257: TppLabel;
    ppSystemVariable19: TppSystemVariable;
    ppSystemVariable20: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    ppShape50: TppShape;
    ppLabel258: TppLabel;
    ppGroup18: TppGroup;
    ppGroupHeaderBand16: TppGroupHeaderBand;
    ppDBText117: TppDBText;
    ppGroupFooterBand18: TppGroupFooterBand;
    ppGroup17: TppGroup;
    ppGroupHeaderBand15: TppGroupHeaderBand;
    ppGroupFooterBand17: TppGroupFooterBand;
    ppLine52: TppLine;
    ppGroup19: TppGroup;
    ppGroupHeaderBand17: TppGroupHeaderBand;
    ppGroupFooterBand19: TppGroupFooterBand;
    ppLine56: TppLine;
    ppLabel214: TppLabel;
    ppDBText106: TppDBText;
    ppShape48: TppShape;
    ppLabel213: TppLabel;
    QryAnunReceSTATUS: TStringField;
    QryAnunReceDESCINVESTIMENTO: TStringField;
    QryAnunReceDESCTIPOOPERACAO: TStringField;
    QryAnunRecePLANOPATRO: TStringField;
    QryAnunReceCARTEIRAINVESTIMENTO: TStringField;
    QryAnunReceANUNCIO: TFloatField;
    QryAnunReceRECEBIMENTO: TFloatField;
    QryAnunReceDIFERENCA: TFloatField;
    QryAnunReceDATABASE: TDateTimeField;
    QryAnunReceDATAEX: TDateTimeField;
    QryAnunReceIDCARTEIRAINVEST: TFloatField;
    QryAnunReceDESCRICAOINVESTIMENTO: TStringField;
    QryAnunReceBOLETA: TStringField;
    ppDBText109: TppDBText;
    ppLabel217: TppLabel;
    ppDBCalc60: TppDBCalc;
    ppDBCalc63: TppDBCalc;
    ppDBCalc59: TppDBCalc;
    QryAnunReceCon: TwwQuery;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    DateTimeField4: TDateTimeField;
    DateTimeField5: TDateTimeField;
    FloatField32: TFloatField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    StringField15: TStringField;
    StringField16: TStringField;
    FloatField37: TFloatField;
    StringField17: TStringField;
    DsAnunReceCon: TwwDataSource;
    ppBDEAnunReceCon: TppBDEPipeline;
    ppRepAnunReceCon: TppReport;
    ppHeaderBand24: TppHeaderBand;
    ppShape52: TppShape;
    ppLabel220: TppLabel;
    ppDtaIniARCon: TppLabel;
    ppDtaFimARCon: TppLabel;
    ppLabel259: TppLabel;
    ppLabel262: TppLabel;
    ppDBImage4: TppDBImage;
    ppLabel263: TppLabel;
    ppLabel264: TppLabel;
    ppLabel265: TppLabel;
    ppLabel266: TppLabel;
    ppLabel267: TppLabel;
    ppLabel268: TppLabel;
    ppLabel269: TppLabel;
    ppLabel270: TppLabel;
    ppDetailBand24: TppDetailBand;
    ppShape54: TppShape;
    ppDBText111: TppDBText;
    ppDBText116: TppDBText;
    ppDBText118: TppDBText;
    ppDBText119: TppDBText;
    ppDBText120: TppDBText;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppFooterBand23: TppFooterBand;
    ppLabel271: TppLabel;
    ppSystemVariable21: TppSystemVariable;
    ppSystemVariable24: TppSystemVariable;
    ppLine51: TppLine;
    ppSummaryBand9: TppSummaryBand;
    ppShape55: TppShape;
    ppLabel272: TppLabel;
    ppDBCalc66: TppDBCalc;
    ppGroup20: TppGroup;
    ppGroupHeaderBand18: TppGroupHeaderBand;
    ppDBText124: TppDBText;
    ppGroupFooterBand20: TppGroupFooterBand;
    ppLabel273: TppLabel;
    ppDBCalc71: TppDBCalc;
    ppGroup21: TppGroup;
    ppGroupHeaderBand19: TppGroupHeaderBand;
    ppGroupFooterBand21: TppGroupFooterBand;
    ppDBText125: TppDBText;
    QryAnunReceANUNIDTIPOOPERACAO: TFloatField;
    QryAnunReceRECIDTIPOOPERACAO: TFloatField;
    QryAnunReceConANUNIDTIPOOPERACAO: TFloatField;
    QryAnunReceConRECIDTIPOOPERACAO: TFloatField;
    QryAnunReceDATAOPERACAO: TDateTimeField;
    QryAnunReceSIGLATIPOOPER: TStringField;
    ppShape59: TppShape;
    ppShape53: TppShape;
    ppShape51: TppShape;
    QryAnunReceConDATAOPERACAO: TDateTimeField;
    QryAnunReceConSIGLATIPOOPER: TStringField;
    ppShape56: TppShape;
    ppLabel226: TppLabel;
    ppDBCalc57: TppDBCalc;
    ppDBText126: TppDBText;
    ppLabel251: TppLabel;
    ppGroup22: TppGroup;
    ppGroupHeaderBand20: TppGroupHeaderBand;
    ppGroupFooterBand22: TppGroupFooterBand;
    ppDBCalc58: TppDBCalc;
    ppLabel274: TppLabel;
    ppLine50: TppLine;
    ppGroup15: TppGroup;
    ppGroupHeaderBand13: TppGroupHeaderBand;
    ppGroupFooterBand15: TppGroupFooterBand;
    ppLine53: TppLine;
    ppLine55: TppLine;
    QryAnunReceDESCSEGMENTACAO: TStringField;
    qryExeDireitoIDSEGMENTACAO: TFloatField;
    qryExeDireitoDESCSEGMENTACAO: TStringField;
    ppGroup23: TppGroup;
    ppGroupHeaderBand21: TppGroupHeaderBand;
    ppGroupFooterBand23: TppGroupFooterBand;
    ppShape57: TppShape;
    ppDBText127: TppDBText;
    ppShape58: TppShape;
    ppDBCalc61: TppDBCalc;
    ppDBCalc62: TppDBCalc;
    ppDBCalc64: TppDBCalc;
    ppDBCalc65: TppDBCalc;
    ppDBCalc67: TppDBCalc;
    ppDBCalc68: TppDBCalc;
    ppLabel275: TppLabel;
    ppLabel276: TppLabel;
    QryExeDireitoConIDOPERACAOINVEST: TFloatField;
    QryExeDireitoConIDSEGMENTACAO: TFloatField;
    QryExeDireitoConDESCSEGMENTACAO: TStringField;
    ppGroup24: TppGroup;
    ppGroupHeaderBand22: TppGroupHeaderBand;
    ppGroupFooterBand24: TppGroupFooterBand;
    ppShape60: TppShape;
    ppDBText128: TppDBText;
    ppShape61: TppShape;
    ppLabel277: TppLabel;
    ppDBCalc69: TppDBCalc;
    ppDBCalc70: TppDBCalc;
    ppDBCalc72: TppDBCalc;
    ppLabel278: TppLabel;
    ppDBCalc73: TppDBCalc;
    ppDBCalc74: TppDBCalc;
    ppDBCalc75: TppDBCalc;
    QryAnunReceIDSEGMENTACAO: TFloatField;
    ppGroup25: TppGroup;
    ppGroupHeaderBand23: TppGroupHeaderBand;
    ppGroupFooterBand25: TppGroupFooterBand;
    ppShape62: TppShape;
    ppDBText129: TppDBText;
    ppShape63: TppShape;
    ppLabel279: TppLabel;
    ppDBCalc76: TppDBCalc;
    QryAnunReceConDESCSEGMENTACAO: TStringField;
    QryAnunReceConIDSEGMENTACAO: TFloatField;
    ppGroup26: TppGroup;
    ppGroupHeaderBand24: TppGroupHeaderBand;
    ppGroupFooterBand26: TppGroupFooterBand;
    ppDBText130: TppDBText;
    ppShape64: TppShape;
    QryConciliacaoCustodiaFechtoIDINVESTIMENTO: TFloatField;
    QryConciliacaoCustodiaFechtoDESCINVESTIMENTO: TStringField;
    QryConciliacaoCustodiaFechtoIDCARTEIRAINVEST: TFloatField;
    QryConciliacaoCustodiaFechtoDESCCARTINVEST: TStringField;
    QryConciliacaoCustodiaFechtoIDPLANPREVCTBPATR: TFloatField;
    QryConciliacaoCustodiaFechtoPLANPRVCONTABPATRO: TStringField;
    QryConciliacaoCustodiaFechtoCARTINVSLDQTD: TFloatField;
    QryConciliacaoCustodiaFechtoCUSTODIASLDQTD: TFloatField;
    QryConciliacaoCustodiaFechtoDIFERENCA: TFloatField;
    procedure RptSaldoInvBeforePrint(Sender: TObject);
    procedure RptSaldoInvSummaryBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand6BeforePrint(Sender: TObject);
    procedure RptGerCarteiraLabel16Print(Sender: TObject);
    procedure RptGerCarteiraLabel17Print(Sender: TObject);
    procedure RptGerCarteiraLabel18Print(Sender: TObject);
    procedure RptGerCarteiraLabel19Print(Sender: TObject);
    procedure RptMapaOperBeforePrint(Sender: TObject);
    procedure RptResumoOper2BeforePrint(Sender: TObject);
    procedure RptSaldoInvLabel4Print(Sender: TObject);
    procedure RptEvolImpostosBeforePrint(Sender: TObject);
    procedure RptIntegraFinContabilBeforePrint(Sender: TObject);
    procedure ppShape23Print(Sender: TObject);
    procedure RpEvolIRLitBeforePrint(Sender: TObject);
    procedure RptHistCotAcaoBeforePrint(Sender: TObject);
    procedure RptOperRendaVarBeforePrint(Sender: TObject);
    procedure RptOperRendaVarGroupFooterBand2BeforePrint(Sender: TObject);
    procedure RptOperRendaVarGroupFooterBand1BeforePrint(Sender: TObject);
    procedure RptOperDireitoBeforePrint(Sender: TObject);
    procedure RptGerCartCustBeforePrint(Sender: TObject);
    procedure RptCompCartCustBeforePrint(Sender: TObject);
    procedure ppDBText47Print(Sender: TObject);
    procedure ppLabel105Print(Sender: TObject);
    procedure ppLabel108Print(Sender: TObject);
    procedure ppLabel107Print(Sender: TObject);
    procedure RptCompCartCustShape1Print(Sender: TObject);
    procedure ppDBText41Print(Sender: TObject);
    procedure ppDetailBand12BeforePrint(Sender: TObject);
    procedure RptOperRendaVarLabel13Print(Sender: TObject);
    procedure ppHeaderBand10BeforePrint(Sender: TObject);
    procedure RptOperRendaVarLabelParamPrint(Sender: TObject);
    procedure ppRepExeDireitoShape2Print(Sender: TObject);
    procedure RptHistCotAcaoShape38Print(Sender: TObject);
    procedure RptHistCotAcaoGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure RpDemoOpVdBeforePrint(Sender: TObject);
    procedure ppShape39Print(Sender: TObject);
    procedure ppGroupFooterBand14BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand13BeforePrint(Sender: TObject);
    procedure ppShape24Print(Sender: TObject);
    procedure RptHistCotAcaoStartPage(Sender: TObject);
    procedure ppGroupFooterBand8BeforePrint(Sender: TObject);
    procedure ppRepExeDireitoConBeforePrint(Sender: TObject);
    procedure ppShape28Print(Sender: TObject);
    procedure ppGroupHeaderBand8BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand11BeforePrint(Sender: TObject);
  private
    { Private declarations }
    QTDLOTE, wcont : double;
    cCorZebra                : TColor;
    OperRendaVarQtdDatas     : Integer; { Operação Renda Variável }
    ValorMercado, ValorCusto : Extended;
    TotalMercado, TotalCusto : Extended;
    function StripChar(S : String; C : Char) : string;

  public
    { Public declarations }
    TotValMercado : Extended;
    DESCINVEST, DESCINVESTNEW : string;
    iTipoSaldo: integer;
    fTotVlrMercado : Double;
    function MostraParam(Form: String): boolean; OverRide;
  end;

var DtmRelatorio         : TDtmRelatorio;
    wIdPlano, wCartAtual, wCountFdo : Integer;
    //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
implementation
{$R *.DFM}

uses USistema, FpRelValorIndic, FpRelConsHistInvest,
     fParamResumoOper2,
     FParamGerCartCust, UOperacaoInvest, UOperComum, dOperComum, FParamListaFundos, FparamIRRendaVar,
     FParamEvolImpostos, FParamIntegraFinContabil, UBibliotecaInvest, FParamEvolIRLit, FParamHistCotAcao,
     FParamOperRendaVar, FParamOperDireito, FParamCompCartCust, FConsMovBMF,FFechaBoletaBMF,
     FConsMovRentabilidade, FConsRentabilidade,FConsMovCorretora;

function TDtmRelatorio.MostraParam(Form: string): boolean;
var frm : TForm;
begin
  frm := nil;
  if (UPPERCASE(Form) = 'FRMPRELCONSHISTINVEST') then
    frm := TFrmpRelConsHistInvest.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPRELVALORINDIC') then
    frm := TFrmpRelValorIndic.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMRESUMOOPER2') then
    frm := TFrmParamResumoOper2.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMRESUMOOPER2') then
    frm := TFrmParamResumoOper2.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMGERCARTCUST') then
    frm := TFrmParamGerCartCust.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMLISTAFUNDOS') then
    frm := TFrmParamListaFundos.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMIRRENDAVAR') then
    frm := TFrmParamIRRendaVar.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMEVOLIMPOSTOS') then
    frm := TfrmParamEvolImpostos.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMINTEGRAFINCONTABIL') then
    frm := TfrmParamIntegraFinContabil.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMEVOLIRLIT') then
    frm := TfrmParamEvolIRLit.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMHISTCOTACAO') then
    frm := TfrmParamHistCotAcao.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMOPERRENDAVAR') then
    frm := TfrmParamOperRendaVar.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMOPERDIREITO') then
    frm := TfrmParamOperDireito.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMCOMPCARTCUST') then
    frm := TfrmParamCompCartCust.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMOPERBOLSA') then
  else if (UPPERCASE(Form) = '') then begin
    Result := True;
    Exit;
  end else
    frm := nil;
  if frm = nil then
    Result := false
  else begin
    with frm do begin
      Result := (ShowModal = mrOk);
      free;
    end;
  end;
end;

procedure TDtmRelatorio.RptSaldoInvBeforePrint(Sender: TObject);
begin
  inherited;
  wCartAtual:=QrySaldoInv.FieldByName('IDCARTEIRAINVEST').AsInteger;
  TotValMercado := 0;
end;

procedure TDtmRelatorio.RptSaldoInvSummaryBand1BeforePrint(Sender: TObject);
begin
  inherited;
  If wCartAtual <> QrySaldoInv.FieldByName('IDCARTEIRAINVEST').AsInteger Then Begin
    TotValMercado := 0;
    wCartAtual    := QrySaldoInv.FieldByName('IDCARTEIRAINVEST').AsInteger;
  End;
end;

procedure TDtmRelatorio.ppDetailBand6BeforePrint(Sender: TObject);
begin
  inherited;
  if qryGerCartCust.FieldByName('VISIVEL').AsInteger = 0 then begin
     RptGerCarteiraDBText3.Visible  := False;
     RptGerCartCustDBText1.Visible  := False;
     RptGerCarteiraDBText4.Visible  := False;
     if iTipoSaldo = 2 then LblSaldoAqui.Visible  := False;
     if iTipoSaldo = 1 then LblSaldoAtu.Visible   := False;
     if iTipoSaldo = 0 then LblSaldoCarr.Visible  := False;
     RptGerCarteiraDBText5.Visible  := False;
     RptGerCarteiraLabel16.Visible  := False;
     RptGerCarteiraLabel17.Visible  := False;
     RptGerCarteiraLabel18.Visible  := False;
     RptGerCarteiraLabel19.Visible  := False;
   end else begin
     RptGerCarteiraDBText3.Visible  := True;
     RptGerCartCustDBText1.Visible  := True;
     RptGerCarteiraDBText4.Visible  := True;
     if iTipoSaldo = 2 then LblSaldoAqui.Visible  := True;
     if iTipoSaldo = 1 then LblSaldoAtu.Visible   := True;
     if iTipoSaldo = 0 then LblSaldoCarr.Visible  := True;
     RptGerCarteiraDBText5.Visible  := True;
     RptGerCarteiraLabel16.Visible  := True;
     RptGerCarteiraLabel17.Visible  := True;
     RptGerCarteiraLabel18.Visible  := True;
     RptGerCarteiraLabel19.Visible  := True;
   end;

end;

procedure TDtmRelatorio.RptGerCarteiraLabel16Print(Sender: TObject);
begin
  inherited;
    if qryGerCartCust.FieldByName('QTDTITLOTE').AsFloat = 0 then
       QtdLote := 1
    else
       QtdLote := qryGerCartCust.FieldByName('QTDTITLOTE').AsFloat;

    RptGerCarteiraLabel16.Text :=   FormatFloat('###,###,##0.00', (qryGerCartCust.FieldByName('COTACAO').AsFloat
                                   * qryGerCartCust.FieldByName('SALDOQTDEINVCART').AsFloat)
                                   /QtdLote);

end;

procedure TDtmRelatorio.RptGerCarteiraLabel17Print(Sender: TObject);
begin
  inherited;
  if qryGerCartCust.FieldByName('TOTCART').AsFloat <> 0 then
     RptGerCarteiraLabel17.Text:= FormatFloat('###,###,##0.00', ((
                                    qryGerCartCust.FieldByName('COTACAOAUX').AsFloat
                                  * qryGerCartCust.FieldByName('SALDOQTDEINVCART').AsFloat
                                  / qryGerCartCust.FieldByName('TOTCART').AsFloat)*100))
  else
     RptGerCarteiraLabel17.Text := '0,00';

end;

procedure TDtmRelatorio.RptGerCarteiraLabel18Print(Sender: TObject);
begin
  inherited;
  if qryGerCartCust.FieldByName('TOTACAOTIPO').AsFloat <> 0 then
     RptGerCarteiraLabel18.Text:= FormatFloat('###,###,##0.00', ((qryGerCartCust.FieldByName('SALDOQTDEINVCART').AsFloat
                                  / qryGerCartCust.FieldByName('TOTACAOTIPO').AsFloat)*100))
  else
     RptGerCarteiraLabel18.Text:= '';
end;

procedure TDtmRelatorio.RptGerCarteiraLabel19Print(Sender: TObject);
begin
  inherited;
  if qryGerCartCust.FieldByName('TOTACAO').AsFloat <> 0 then
     RptGerCarteiraLabel19.Text:= FormatFloat('###,###,##0.00', ((qryGerCartCust.FieldByName('SALDOQTDEINVCART').AsFloat
                                  / qryGerCartCust.FieldByName('TOTACAO').AsFloat)*100))
  else
     RptGerCarteiraLabel19.Text:= '';
end;

procedure TDtmRelatorio.RptMapaOperBeforePrint(Sender: TObject);
begin
  inherited;
  ppLabel10.Caption := Sistema.NomeEmpresa;
end;

procedure TDtmRelatorio.RptResumoOper2BeforePrint(Sender: TObject);
begin
  inherited;
  ppLabel14.Caption := Sistema.NomeEmpresa;
end;

procedure TDtmRelatorio.RptSaldoInvLabel4Print(Sender: TObject);
begin
  inherited;
  if DtmRelatorio.RptSaldoInvLabel5.Caption = 'Papel' then
      RptSaldoInvLabel4.Text:=
         QrySaldoInv.FieldByName('DESCINVESTIMENTO').AsString
  Else
      RptSaldoInvLabel4.Text:=
         QrySaldoInv.FieldByName('NOME').AsString;
end;

procedure TDtmRelatorio.RptEvolImpostosBeforePrint(Sender: TObject);
begin
  inherited;
  if qryEvolImpostosMOESIGLA1.Value = '' then
  begin
     RptEvolImpostosDBText1.Visible := False;
     RptEvolImpostosLabel7.Visible := False;
     RptEvolImpostosDBText3.Visible := False;
     RptEvolImpostosLabel2.Visible := False;
  end;
  if qryEvolImpostosMOESIGLA2.Value = '' then
  begin
     RptEvolImpostosDBText25.Visible := False;
     RptEvolImpostosLabel8.Visible := False;
     RptEvolImpostosDBText4.Visible := False;
     RptEvolImpostosppLabel71.Visible := False;
  end;
  ppLabel60.Caption := Sistema.NomeEmpresa;
end;

procedure TDtmRelatorio.RptIntegraFinContabilBeforePrint(Sender: TObject);
begin
  inherited;
  ppLabel45.Caption := Sistema.NomeEmpresa;
  QryAux1.SQL.Clear;
  QryAux1.SQL.Text := 'SELECT MASCARA,PARAMCONTAB.PLANO '+
                      'FROM  PLANO, PARAMCONTAB '+
                      'WHERE PARAMCONTAB.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+
                      'AND  PLANO.PLANO=PARAMCONTAB.PLANO';
  QryAux1.Open;
  RptIntegraFinContabilDBText10.DisplayFormat :=
                               QryAux1.FieldByName('MASCARA').AsString + ';0; ';
  RptIntegraFinContabilDBText11.DisplayFormat :=
                               QryAux1.FieldByName('MASCARA').AsString + ';0; ';
  wIdPlano := QryAux1.FieldByName('PLANO').AsInteger;
end;

procedure TDtmRelatorio.ppShape23Print(Sender: TObject);
begin
  inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;
end;

procedure TDtmRelatorio.RpEvolIRLitBeforePrint(Sender: TObject);
begin
  inherited;
  ppLabel47.Caption := Sistema.NomeEmpresa;
end;

procedure TDtmRelatorio.RptHistCotAcaoBeforePrint(Sender: TObject);
begin
  inherited;
  ppLabel52.Caption := Sistema.NomeEmpresa;
end;

procedure TDtmRelatorio.RptOperRendaVarBeforePrint(Sender: TObject);
begin
  inherited;
   ppLabel55.Caption := Sistema.NomeEmpresa;
   OperRendaVarQtdDatas := 0;
end;

procedure TDtmRelatorio.RptOperRendaVarGroupFooterBand2BeforePrint(
  Sender: TObject);
Var
  I : Integer;
begin
  inherited;
  For I := 0 To Pred(RptOperRendaVarGroupFooterBand2.ObjectCount) Do
     If RptOperRendaVarGroupFooterBand2.Objects[I] is TppCustomText then
        TppCustomText(RptOperRendaVarGroupFooterBand2.Objects[I]).Visible := (RptOperRendaVarDBCalc8.Value <> 1);
  Inc(OperRendaVarQtdDatas)
end;

procedure TDtmRelatorio.RptOperRendaVarGroupFooterBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  if RptOperRendaVarLabel9.Caption = '0' Then
  Begin
     RptOperRendaVarGroupFooterBand1.Visible := ((RptOperRendaVarDBCalc7.Value <> 1) And (OperRendaVarQtdDatas > 1));
     OperRendaVarQtdDatas := 0;
  End
end;

procedure TDtmRelatorio.RptOperDireitoBeforePrint(Sender: TObject);
begin
  inherited;
  ppLabel62.Caption := Sistema.NomeEmpresa;
end;

procedure TDtmRelatorio.RptGerCartCustBeforePrint(Sender: TObject);
begin
  inherited;
  ValorMercado := 0;
  ppLabel28.Caption := Sistema.NomeEmpresa;  
end;

procedure TDtmRelatorio.RptCompCartCustBeforePrint(Sender: TObject);
begin
  inherited;
  ValorMercado := 0;
  ValorCusto   := 0;
  TotalCusto   := 0;
  TotalMercado := 0;
  ppLabel67.Caption := Sistema.NomeEmpresa;
end;

procedure TDtmRelatorio.ppDBText47Print(Sender: TObject);
begin
  inherited;
  if (Sender is TppDBText) then
    if TppDBText(Sender).Visible then
      TotalCusto :=  TotalCusto + StrToFloat(StripChar(TppDBText(Sender).Text, '.'));
end;

Function TDtmRelatorio.StripChar(S : String; C : Char) : String;
Var
  I : Integer;
begin
  Result := '';
  For I := 1 To Length(S) Do
    If S[I] <> C Then
       result := result + S[I];
end;

procedure TDtmRelatorio.ppLabel105Print(Sender: TObject);
begin
  inherited;
  if qryCompCartCust.FieldByName('TOTCART').AsFloat <> 0 then
     ppLabel105.Text:= FormatFloat('###,###,##0.00', ((
                                    qryCompCartCust.FieldByName('COTACAOAUX').AsFloat
                                  * qryCompCartCust.FieldByName('SALDOQTDEINVCART').AsFloat
                                  / qryCompCartCust.FieldByName('TOTCART').AsFloat)))
  else
     ppLabel105.Text := '0,00';
end;

procedure TDtmRelatorio.ppLabel108Print(Sender:  TObject);
begin
  inherited;
   TotalMercado       := 0;
end;

procedure TDtmRelatorio.ppLabel107Print(Sender: TObject);
begin
  inherited;
  TotalCusto          := 0;
end;

procedure TDtmRelatorio.RptCompCartCustShape1Print(Sender: TObject);
begin
  inherited;
  RptCompCartCustShape1.Brush.Color := RptCompCartCustShape1.Brush.Color xor ($00E3E3E3 xor clWhite);
end;

procedure TDtmRelatorio.ppDBText41Print(Sender: TObject);
begin
  inherited;
  if (Sender is TppDBText) then
    if TppDBText(Sender).Visible then
      TotalCusto :=  TotalCusto + StrToFloat(StripChar(TppDBText(Sender).Text, '.'));
end;

procedure TDtmRelatorio.ppDetailBand12BeforePrint(Sender: TObject);
begin
  inherited;
   ppDBText46.Visible  := (iTipoSaldo = 2);
   ppDBText47.Visible  := (iTipoSaldo = 1);
   ppDBText41.Visible  := (iTipoSaldo = 0);

   RptCompCartCustDBCalc3.Visible  := (iTipoSaldo = 2);
   RptCompCartCustDBCalc4.Visible  := (iTipoSaldo = 1);
   RptCompCartCustDBCalc1.Visible  := (iTipoSaldo = 0);

   ppDetailBand11.Visible := (ppDBText40.Text <> FormatFloat(ppDBText40.DisplayFormat, 0));
end;

procedure TDtmRelatorio.RptOperRendaVarLabel13Print(Sender: TObject);
begin
  inherited;
  if RptOperRendaVarLabel9.Caption = '1' Then
     RptOperRendaVarLabel13.Text := qryOperRendaVar.FieldByName('DATAOPERACAO').AsString
  Else
     RptOperRendaVarLabel13.Text := 'Total da Data';
end;

procedure TDtmRelatorio.ppHeaderBand10BeforePrint(Sender: TObject);
begin
  inherited;
  if RptOperRendaVarLabel9.Caption = '1' Then
     RptOperRendaVarLabel2.Visible := False;
end;

procedure TDtmRelatorio.RptOperRendaVarLabelParamPrint(Sender: TObject);
begin
  inherited;
  if RptOperRendaVarLabel9.Caption = '0' Then
     RptOperRendaVarLabelParam.Text := 'Analítico'
  Else
     RptOperRendaVarLabelParam.Text := 'Sintético';
end;

procedure TDtmRelatorio.ppRepExeDireitoShape2Print(Sender: TObject);
begin
  inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;
     // AL_32
     wcont := wcont + 1;// Fim AL_32
end;

procedure TDtmRelatorio.RptHistCotAcaoShape38Print(Sender: TObject);
begin
  inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;

end;

procedure TDtmRelatorio.RptHistCotAcaoGroupHeaderBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  cCorZebra := $00E3E3E3;
end;

procedure TDtmRelatorio.RpDemoOpVdBeforePrint(Sender: TObject);
begin
  inherited;
    OperRendaVarQtdDatas := 0;
end;

procedure TDtmRelatorio.ppShape39Print(Sender: TObject);
begin
  inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;

end;

procedure TDtmRelatorio.ppGroupFooterBand14BeforePrint(Sender: TObject);
Var
  I : Integer;
begin
  inherited;
  For I := 0 To Pred(ppGroupFooterBand14.ObjectCount) Do
     If ppGroupFooterBand14.Objects[I] is TppCustomText then
        TppCustomText(ppGroupFooterBand14.Objects[I]).Visible := (ppContadorAcao.Value <> 1);
  Inc(OperRendaVarQtdDatas);

  If ppContadorAcao.Value > 1 Then
     ppGroupFooterBand14.Visible := True
  Else
     ppGroupFooterBand14.Visible := False;
end;

procedure TDtmRelatorio.ppGroupFooterBand13BeforePrint(Sender: TObject);
begin
  inherited;
   ppGroupFooterBand13.Visible := ((ppContadorData.Value <> 1) And (OperRendaVarQtdDatas > 1));
   OperRendaVarQtdDatas := 0;
end;

procedure TDtmRelatorio.ppShape24Print(Sender: TObject);
begin
  inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;
   //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
end;

procedure TDtmRelatorio.RptHistCotAcaoStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   ppShape24.Brush.Color := $00E3E3E3;
end;

procedure TDtmRelatorio.ppGroupFooterBand8BeforePrint(Sender: TObject);
begin
  inherited;
   if wcont > 1 then
      ppGroupFooterBand8.Visible := true
   else
      ppGroupFooterBand8.Visible := false; // Fim AL_32
end;

//AL_32
procedure TDtmRelatorio.ppRepExeDireitoConBeforePrint(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   ppShape28.Brush.Color := clWhite;
   wcont := 0;
end;

procedure TDtmRelatorio.ppShape28Print(Sender: TObject);
begin
  inherited;
  if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;
   TppShape(Sender).Brush.Color := cCorZebra;
end;

// AL_32
procedure TDtmRelatorio.ppGroupHeaderBand8BeforePrint(Sender: TObject);
begin
  inherited;
  wcont := 0;
end;

//AL_32
procedure TDtmRelatorio.ppGroupFooterBand11BeforePrint(Sender: TObject);
begin
  inherited;
end;

//AL_32
Initialization

Finalization

end.
