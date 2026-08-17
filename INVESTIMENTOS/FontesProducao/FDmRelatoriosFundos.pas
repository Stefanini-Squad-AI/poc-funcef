//******************************************************************************
// Data      : 26/07/2007
// Código    : AL_6
// Pendencia : 24874
// Motivo    : Incluí os campos Rentabilidade Diária e Aplicação para RF (qryConsRentFundos)
//******************************************************************************
// Data      : 06/07/2007
// Código    : AL_5
// Pendencia : 25679
// Motivo    : Implementação da rentabilidade do início da aplicação no fundo
//******************************************************************************
// Data      : 12/06/2007
// Código    : AL_4
// Motivo    : Implementação para tratar todas as telas que tem referência a Amortização
//******************************************************************************
// Data      : 02/08/2006
// Código    : AL_3
// Pendencia : 22781
// Motivo    : Ajustes na query qryTransferencia para buscar a operação origem
//******************************************************************************
// Data      : 09/05/2006
// Código    : AL_2
// Motivo    : Ajustes na query qryAjuste e rptAjuste(Plano)
//******************************************************************************
// Data      : 18/04/2006
// Código    : AL_1
// Motivo    : Otimização da query qryConsRentFndAcoes para melhorar a performance.
//******************************************************************************

unit FDmRelatoriosFundos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppClass, ppPrnabl, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppStrtch,
  ppMemo, UBibliotecaInvest, UOperacaoInvest, ppRichTx, ppVar, ppRelatv,
  ppDBPipe, ppSubRpt, ppModule, raCodMod, ppRegion, TeEngine, Series,
  ExtCtrls, TeeProcs, Chart, ppChrtDP, ppChrt, TXComp, ppViewr, FPreview;

type
  TDmRelatoriosFundo = class(TdtmReports)
    qryConsRentFundos: TwwQuery;
    updConsFundos: TUpdateSQL;
    dsConsRentFundos: TwwDataSource;
    ppBdeConsRentFundos: TppBDEPipeline;
    rptConsRentFundos: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLineConsRentFnd2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDBConsRentFndBanco: TppDBText;
    ppDBConsRentFndFundo: TppDBText;
    ppDBConsRentFndFifFaq: TppDBText;
    ppDBConsRentFndExclusivo: TppDBText;
    lblConsRentFndBanco: TppLabel;
    lblConsRentFndFundo: TppLabel;
    lblConsRentFndFifFaq: TppLabel;
    lblConsRentFndExclusivo: TppLabel;
    lblConsRentFndAplicacao: TppLabel;
    ppDBConsRentFndAplicacao: TppDBText;
    lblConsRentFndSaldo: TppLabel;
    ppDBConsRentFndSaldoEm: TppDBText;
    lblConsRentFndPatrimonio: TppLabel;
    ppDBConsRentFndPatrimonio: TppDBText;
    ppDBConsRentFndPerPL: TppDBText;
    lblConsRentFndPercPL: TppLabel;
    ppDBConsRentFndRentAno: TppDBText;
    lblConsRentFndRentAno2: TppLabel;
    ppDBConsRentFndPerCDIAno: TppDBText;
    lblConsRentFndPercCDIAno2: TppLabel;
    ppDBConsRentFndRentMes: TppDBText;
    lblConsRentFndRentMes2: TppLabel;
    ppDBConsRentFndPerCDIMes: TppDBText;
    lblConsRentFndPercCDIMes2: TppLabel;
    ppDBConsRentFndResgate: TppDBText;
    lblConsRentFndResg: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    lblConsRentFndTotGerTit: TppLabel;
    lblConsRentFndTotGer: TppLabel;
    lblConsRentFndPercCDIAno1: TppLabel;
    lblConsRentFndPercCDIMes1: TppLabel;
    shpConsRentFndCab: TppShape;
    ppShape2: TppShape;
    ppBdeConsRentFundosTot: TppBDEPipeline;
    dsConsRentFundoTot: TwwDataSource;
    updConsRentFundoTot: TUpdateSQL;
    qryConsRentFundoTot: TwwQuery;
    ppSConsRentFndDet: TppShape;
    qryConsRentFundoTotBANCO: TStringField;
    qryConsRentFundoTotSALDO: TFloatField;
    qryConsRentFundoTotPERCENT: TFloatField;
    lblConsRentFndCategoria: TppLabel;
    ppDBConsRentFndCategoria: TppDBText;
    ppRConsRentFndBco: TppRegion;
    SRptConsRentFndBco: TppSubReport;
    ppChildReport2: TppChildReport;
    ppRConsRentFndCat: TppRegion;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    SRptConsRentFndCat: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppSConsRentFndSubCab: TppShape;
    lblConsRentFndSubBanco: TppLabel;
    lblConsRentFndSubSaldo: TppLabel;
    lblConsRentFndSubPercT: TppLabel;
    ppSConsRentFndSubDet: TppShape;
    ppDBConsRentFndSubBanco: TppDBText;
    ppDBConsRentFndSubSaldo: TppDBText;
    ppDBConsRentFndSubPerc: TppDBText;
    ppBdeConsRentFundosCat: TppBDEPipeline;
    dsConsRentFundoTotCat: TwwDataSource;
    qryConsRentFundoTotCat: TwwQuery;
    ppSConsRentFndSubCatCab: TppShape;
    lblConsRentFndSubCatCategT: TppLabel;
    lblConsRentFndSubCatSaldoT: TppLabel;
    lblConsRentFndSubCatPercT: TppLabel;
    ppSConsRentFndSubCat: TppShape;
    ppDBConsRentFndSubCatCateg: TppDBText;
    ppDBConsRentFndSubCatSaldo: TppDBText;
    ppDBConsRentFndSubCatPerc: TppDBText;
    qryConsRentFundoTotCatCATEGORIA: TStringField;
    qryConsRentFundoTotCatSALDO: TFloatField;
    qryConsRentFundoTotCatPERCENT: TFloatField;
    qryConsRentFundoTotCatNIVEL: TFloatField;
    lblConsRentFndRentAno1: TppLabel;
    lblConsRentFndRentMes1: TppLabel;
    lblConsRentFndSubCatPercD: TppLabel;
    lblConsRentFndSubPercD: TppLabel;
    ppDPTeeChart1: TppDPTeeChart;
    //AL_3
    chtConsRentGestor: TppDPTeeChart;
    qryConsRentFundosBANCO: TStringField;
    qryConsRentFundosFUNDO: TStringField;
    qryConsRentFundosCLASS: TStringField;
    qryConsRentFundosFIFFAQ: TStringField;
    qryConsRentFundosEXCLUSIVO: TStringField;
    qryConsRentFundosDATAAPLICACAO: TDateTimeField;
    qryConsRentFundosSALDOEM: TFloatField;
    qryConsRentFundosPATRIMONIO: TFloatField;
    qryConsRentFundosPERPL: TFloatField;
    qryConsRentFundosRENTANO: TFloatField;
    qryConsRentFundosPERCDIANO: TFloatField;
    qryConsRentFundosRENTMES: TFloatField;
    qryConsRentFundosPERCDIMES: TFloatField;
    qryConsRentFundosRESGATE: TStringField;
    qryConsRentFundosVAR: TFloatField;
    qryConsRentFundosIDFUNDOINVEST: TFloatField;
    qryConsRentFundosNIVEL: TFloatField;
    qryConsRentFundosCORCATEGFUNDO: TFloatField;
    qryConsRentFundoTotCatCORCATEGFUNDO: TFloatField;
    lblConsRentFndSubCatTitulo: TppLabel;
    ppLabel1: TppLabel;
    ppBDETransferencia: TppBDEPipeline;
    dsTransferencia: TwwDataSource;
    qryTransferencia: TwwQuery;
    rptTransferencia: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLine5: TppLine;
    ppLabel6: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    lblTransfDataCab: TppLabel;
    lblTransfValor: TppLabel;
    lblTransfQuant: TppLabel;
    lblTransfFundosCab: TppLabel;
    ppDBTransfDataOpe: TppDBText;
    ppDBTransfValor: TppDBText;
    ppDBTransfQuantidade: TppDBText;
    ppDBTransfFndOrigem: TppDBText;
    lblTransfFundosDetO: TppLabel;
    lblTransfFundosDetD: TppLabel;
    ppDBTransfFndDestino: TppDBText;
    lblTransfDataApli: TppLabel;
    ppDBTransfDatApliO: TppDBText;
    ppDBTransfDatApliD: TppDBText;
    lblTransfCotaApli: TppLabel;
    ppDBTransfCotApliO: TppDBText;
    ppDBTransfCotApliD: TppDBText;
    shpTransfCab: TppShape;
    shpTransfDet: TppShape;
    qryTransferenciaDATAOPERACAO: TDateTimeField;
    qryTransferenciaQTDOPERACAO: TFloatField;
    qryTransferenciaVLROPERACAO: TFloatField;
    qryTransferenciaVLRCOTA: TFloatField;
    qryTransferenciaIDOPERACAOFUNDO: TFloatField;
    qryTransferenciaFNDORIGEM: TStringField;
    qryTransferenciaDTAPLORIGEM: TDateTimeField;
    qryTransferenciaCOTAAPLORIGEM: TFloatField;
    qryTransferenciaFNDDESTINO: TStringField;
    qryTransferenciaDTAPLDESTINO: TDateTimeField;
    qryTransferenciaCOTAAPLDESTINO: TFloatField;
    qryTransferenciaDTMOVORIGEM: TDateTimeField;
    qryTransferenciaDTMOVDESTINO: TDateTimeField;
    qryTransferenciaPLANPRVCONTABPATRO: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    lblTransfPlanPrevCtbPatrTit: TppLabel;
    ppDBTransfPlanPrev: TppDBText;
    shpTransfPlnPrevCab: TppShape;
    ppBDEAjuste: TppBDEPipeline;
    dsAjuste: TwwDataSource;
    rptAjuste: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppShape1: TppShape;
    ppLine6: TppLine;
    lblAjusteCabDataOper: TppLabel;
    lblAjusteCabQuantidade: TppLabel;
    lblAjusteCabDataApli: TppLabel;
    lblAjusteDtInicio: TppLabel;
    bndAjusteDatalhe: TppDetailBand;
    ppShape3: TppShape;
    dbeAjusteDtOper: TppDBText;
    dbeAjusteQtdAjustada: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLabel21: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppLine7: TppLine;
    ppSystemVariable8: TppSystemVariable;
    lblAjustePeriodoA: TppLabel;
    lblAjusteDtFim: TppLabel;
    qryAjuste: TwwQuery;
    qryAjusteDESCTIPOFUNDOINV: TStringField;
    qryAjusteDESCFUNDOINVEST: TStringField;
    qryAjusteDATAAPLICACAO: TDateTimeField;
    qryAjusteDATAOPERACAO: TDateTimeField;
    qryAjusteQTDOPERACAO: TFloatField;
    qryAjusteSALDOQTDCOTAS: TFloatField;
    qryAjusteIDFUNDOINVEST: TFloatField;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderAjusteFundo: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    lblAjusteGrpTipoFundo: TppLabel;
    dbeAjusteTipoFuno: TppDBText;
    shpAjusteTipoFundo: TppShape;
    lblAjusteFundoInvest: TppLabel;
    dbeAjusteFundoInvest: TppDBText;
    dbeAjusteDtAplicacao: TppDBText;
    ppLabel11: TppLabel;
    dbeAjusteSaldoQtd: TppDBText;
    BDEConsRentFndAcoes: TppBDEPipeline;
    dsConsRentFndAcoes: TwwDataSource;
    qryConsRentFndAcoes: TwwQuery;
    rptConsRentFndAcoes: TppReport;
    ppHeaderBand5: TppHeaderBand;
    shpRentFNDAcoesCab: TppShape;
    lblConsRFAFundo: TppLabel;
    lblConsRFASaldo: TppLabel;
    lblConsRFAGestor: TppLabel;
    bndConsRFADetail: TppDetailBand;
    shpConsRentFNDAcoesDet: TppShape;
    dbeConsRFAFundo: TppDBText;
    dbeConsRFASaldo: TppDBText;
    dbeConsRFARentAno: TppDBText;
    dbeConsRFARentMes: TppDBText;
    dbeConsRFAGestor: TppDBText;
    dbeConsRFACategoria: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLabel35: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppLine8: TppLine;
    ppSystemVariable10: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    shpConsRFATotal: TppShape;
    lblConsRFATotalTit: TppLabel;
    lblConsRFATotal: TppLabel;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    grpConsRFARRodapeCLASS: TppGroupFooterBand;
    lblConsRFACategoria: TppLabel;
    shpConsRentFNDAcoesGrpClass: TppShape;
    lblConsRFARentFundoDia: TppLabel;
    dbeConsRFARentDia: TppDBText;
    qryConsRentFndAcoesBANCO: TStringField;
    qryConsRentFndAcoesFUNDO: TStringField;
    qryConsRentFndAcoesCLASS: TStringField;
    qryConsRentFndAcoesSALDOEM: TFloatField;
    qryConsRentFndAcoesRENTDIA: TFloatField;
    qryConsRentFndAcoesRENTMES: TFloatField;
    qryConsRentFndAcoesRENTANO: TFloatField;
    qryConsRentFndAcoesCORCATEGFUNDO: TFloatField;
    qryConsRentFndAcoesMOECODIGO: TFloatField;
    qryConsRentFndAcoesMOEDESC: TStringField;
    qryConsRentFndAcoesVARMOEDIA: TFloatField;
    qryConsRentFndAcoesVARMOEMES: TFloatField;
    qryConsRentFndAcoesVARMOEANO: TFloatField;
    dbeConsRFAMoeda: TppDBText;
    dbeConsRFARMoedaDia: TppDBText;
    dbeConsRFARMoedaMes: TppDBText;
    dbeConsRFARMoedaAno: TppDBText;
    dbeAjusteIdFundoinvest: TppDBText;
    qryConsRentFndAcoesPERCDIA: TFloatField;
    qryConsRentFndAcoesPERCMES: TFloatField;
    qryConsRentFndAcoesPERCANO: TFloatField;
    lblConsRFADifDia: TppLabel;
    lblConsRFARentDia: TppLabel;
    dbeConsRFADifDia: TppDBText;
    lblConsRFARentFundoMes: TppLabel;
    lblConsRFADifMes: TppLabel;
    lblConsRFARentMes: TppLabel;
    lblConsRFARentFundoAno: TppLabel;
    lblConsRFADifAno: TppLabel;
    lblConsRFARentAno: TppLabel;
    dbeConsRFADifMes: TppDBText;
    dbeConsRFADifAno: TppDBText;
    lblConsRFAPlanoPatr: TppLabel;
    lblConsRFARankingTit2: TppLabel;
    lblConsRFARanking: TppLabel;
    qryConsRentFndAcoesNIVEL: TFloatField;
    dbcConsRFATotalCat: TppDBCalc;
    lblConsRFATotalGeral: TppLabel;
    lblConsRFAMoeda: TppLabel;
    dbcConsRFARentDia: TppDBCalc;
    dbcConsRFARentMes: TppDBCalc;
    dbcConsRFARentAno: TppDBCalc;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    qryConsRentFndAcoesPERSALDOCAT: TFloatField;
    lblConsRFAPerCateg: TppLabel;
    dbeConsRFARPerCateg: TppDBText;
    dbcConsRFAPerCateg: TppDBCalc;
    qryConsRentFundosDATAINICIOFUNDO: TDateTimeField;
    rptVdAcoesCpFundos: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppDetailBand8: TppDetailBand;
    ppShape5: TppShape;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine12: TppLine;
    ppLabel25: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    ppSummaryBand7: TppSummaryBand;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLabel26: TppLabel;
    ppShape6: TppShape;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppBDEVdAcoesCpFundos: TppBDEPipeline;
    Panel8: TPanel;
    ppLabel34: TppLabel;
    ppLabel36: TppLabel;
    rptVdAcoesCpFundoslblFundo: TppLabel;
    rptVdAcoesCpFundoslblGestor: TppLabel;
    rptVdAcoesCpFundoslblCota: TppLabel;
    ppLabel40: TppLabel;
    rptVdAcoesCpFundoslblDtaCota: TppLabel;
    ppLabel33: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    rptVdAcoesCpFundoslblVlrAplicado: TppLabel;
    ppLabel46: TppLabel;
    rptVdAcoesCpFundoslblQuantidade: TppLabel;
    ppDBText8: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    rptVdAcoesCpFundoslblSumVlrOperado: TppLabel;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    Panel9: TPanel;
    ppBDEVdFundosCpAcoes: TppBDEPipeline;
    rptVdFundosCpAcoes: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppShape7: TppShape;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLabel39: TppLabel;
    ppLabel41: TppLabel;
    ppLabel45: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    rptVdFundosCpAcoeslblFundo: TppLabel;
    rptVdFundosCpAcoeslblGestor: TppLabel;
    rptVdFundosCpAcoeslblCota: TppLabel;
    ppLabel55: TppLabel;
    rptVdFundosCpAcoeslblDataCota: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    rptVdFundosCpAcoeslblVlrResgate: TppLabel;
    ppLabel60: TppLabel;
    rptVdFundosCpAcoeslblQuantidade: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppDetailBand9: TppDetailBand;
    ppShape8: TppShape;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLine24: TppLine;
    ppLabel64: TppLabel;
    ppSystemVariable15: TppSystemVariable;
    ppSystemVariable16: TppSystemVariable;
    ppSummaryBand8: TppSummaryBand;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLabel65: TppLabel;
    rptVdFundosCpAcoeslblSumVlr: TppLabel;
    ppLine27: TppLine;
    rptSaldoFundo: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppShape9: TppShape;
    ppLabel54: TppLabel;
    ppLabel56: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel71: TppLabel;
    ppLabel76: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppDetailBand10: TppDetailBand;
    shpSaldoFNDDet: TppShape;
    ppDBText24: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBCotaAtual: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBSaldoCotas: TppDBText;
    ppDBText33: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLabel82: TppLabel;
    ppSystemVariable17: TppSystemVariable;
    ppLine28: TppLine;
    ppSystemVariable18: TppSystemVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    shpCabFundo: TppShape;
    ppDBText34: TppDBText;
    ppLabel85: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    BDESaldoFundo: TppBDEPipeline;
    Panel10: TPanel;
    ppDBTotSaldoCotas: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppShape10: TppShape;
    rptPosFundo: TppReport;
    ppHeaderBand10: TppHeaderBand;
    shpPosFundosCab: TppShape;
    lblPosFundosCabFundo: TppLabel;
    lblPosFundosCabQtd: TppLabel;
    lblPosFundosTitFundo: TppLabel;
    ppDetailBand11: TppDetailBand;
    shpPosFundosDet: TppShape;
    srptPosFundo: TppSubReport;
    srptPosFundoDet: TppChildReport;
    ppTitleBand1: TppTitleBand;
    shpPosFundosDetCab: TppShape;
    lblPosFundosDetCabAplic: TppLabel;
    lblPosFundosDetCabQtd: TppLabel;
    lblPosFundosDetCabPos: TppLabel;
    linPosFundosDetCab: TppLine;
    ppDetailBand12: TppDetailBand;
    shpPosFundosDetDet: TppShape;
    DBPosFundosDetAplicacao: TppDBText;
    DBPosFundosDetQtd: TppDBText;
    DBPosFundosDetPos: TppDBText;
    ppSummaryBand9: TppSummaryBand;
    linPosFundosDetRdp: TppLine;
    DBPosFundosFundo: TppDBText;
    DBPosFundosQTD: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine32: TppLine;
    ppLabel95: TppLabel;
    ppSystemVariable19: TppSystemVariable;
    ppSystemVariable20: TppSystemVariable;
    pplPosFundo: TppBDEPipeline;
    pplPosFundoDet: TppBDEPipeline;
    dsPosFundo: TDataSource;
    dsPosFundoDet: TDataSource;
    qryPosFundo: TwwQuery;
    qryPosFundoDet: TwwQuery;
    Panel11: TPanel;
    qryPosFundoIDFUNDOINVEST: TFloatField;
    qryPosFundoDESCFUNDOINVEST: TStringField;
    qryPosFundoQTDTOTAL: TFloatField;
    qryPosFundoDetIDFUNDOINVEST: TFloatField;
    qryPosFundoDetIDINVESTIMENTO: TFloatField;
    qryPosFundoDetDATAREFERENCIA: TDateTimeField;
    qryPosFundoDetQTDATUAL: TFloatField;
    qryPosFundoDetDESCINVESTIMENTO: TStringField;
    ppRConsAmortizacaoCotas: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel9: TppLabel;
    ppLabel12: TppLabel;
    ppDBText7: TppDBText;
    ppDetailBand5: TppDetailBand;
    shpAmortCotasFnd: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine10: TppLine;
    ppLabel14: TppLabel;
    ppSystemVariable14: TppSystemVariable;
    ppSystemVariable13: TppSystemVariable;
    ppSummaryBand6: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLine9: TppLine;
    ppLine11: TppLine;
    ppLabel20: TppLabel;
    ppGroup8: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    //AL_4
    ppShape4: TppShape;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel22: TppLabel;
    ppLValorAmortizado: TppLabel;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppBDEPConsAmortizacaoCotas: TppBDEPipeline;
    LblPlanoRentAcoes: TppLabel;
    LblPlanoRentFdo: TppLabel;
    LblPlanoTransf: TppLabel;
    LblPlanoAjuste: TppLabel;
    LblPlanoAmort: TppLabel;
    LblPlanoPos: TppLabel;
    LblPlanoCpAc: TppLabel;
    LblPlanoVdAc: TppLabel;
    LblPlanoSaldo: TppLabel;
    Panel12: TPanel;
    pplEmpresa: TppBDEPipeline;
    pplEmpresappField1: TppField;
    pplEmpresappField2: TppField;
    pplEmpresappField3: TppField;
    pplEmpresappField4: TppField;
    pplEmpresappField5: TppField;
    pplEmpresappField6: TppField;
    pplEmpresappField7: TppField;
    dsEmpresa: TwwDataSource;
    qryEmpresa: TwwQuery;
    qryEmpresaIDPESSOA: TFloatField;
    qryEmpresaNOMEEMPRESA: TStringField;
    qryEmpresaRAZAOSOCIAL: TStringField;
    qryEmpresaLOGRADOURO: TStringField;
    qryEmpresaIDENDERECO: TFloatField;
    qryEmpresaCEP: TStringField;
    qryEmpresaIMAGEM: TBlobField;
    UpdSaldoTot: TUpdateSQL;
    ppLCarteira: TppLabel;
    ppLPeriodo: TppLabel;
    ppDbLogo: TppDBImage;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    lblConsRentFndDataRef: TppLabel;
    ppDBImage1: TppDBImage;
    ppLabel2: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppDBImage2: TppDBImage;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppDBImage3: TppDBImage;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel53: TppLabel;
    lblSaldosFNDDtRef: TppLabel;
    ppDBImage4: TppDBImage;
    ppLabel13: TppLabel;
    ppLabel52: TppLabel;
    ppLabel59: TppLabel;
    lblConsRFADtRef: TppLabel;
    ppDBImage5: TppDBImage;
    ppLabel5: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    lblTransfDataCabTxt: TppLabel;
    ppDBImage7: TppDBImage;
    ppLabel4: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppDBImage8: TppDBImage;
    ppLabel10: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    lblPosFundosTitDtRef: TppLabel;
    ppDBImage9: TppDBImage;
    ppDBImage6: TppDBImage;
    ppShape11: TppShape;
    ppLabel61: TppLabel;
    ppLine34: TppLine;
    ppLine33: TppLine;
    ppLine1: TppLine;
    lblPeriodo: TppLabel;
    qryConsRentFndAcoesSALDOTOT: TFloatField;
    qryConsRentFndAcoesIDFUNDOINVEST: TFloatField;
    qryConsRentFndAcoesIDTIPOFUNDOINVEST: TFloatField;
    //AL_4
    pplFundo: TppLabel;
    //AL_3
    qryConsRentFndAcoesVARMOEINIAPL: TFloatField;
    qryConsRentFndAcoesPERCINIAPL: TFloatField;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel69: TppLabel;
    ppDBText1: TppDBText;
    ppDBText25: TppDBText;
    ppDBText28: TppDBText;
    qryConsRentFndAcoesRENTINI: TFloatField;
    ppDBCalc5: TppDBCalc;
    ppLine2: TppLine;
    //AL_6
    qryConsRentFundosRENTDIA: TFloatField;
    qryConsRentFundosRENTAPLICA: TFloatField;
    ppLabel70: TppLabel;
    lblindicador: TppLabel;
    ppDBText31: TppDBText;
    ppLabel72: TppLabel;
    ppLabel86: TppLabel;
    ppDBText32: TppDBText;
    ppLabel81: TppLabel;
    ppLabel87: TppLabel;  // Fim AL_6
    procedure ppSConsRentFndCabPrint(Sender: TObject);
    procedure rptConsRentFundosStartPage(Sender: TObject);
    procedure ppsSaldoFundosDetPrint(Sender: TObject);
    procedure ppSConsRentFndSubDetPrint(Sender: TObject);
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure shpTransfDetPrint(Sender: TObject);
    procedure bndAjusteDatalheBeforePrint(Sender: TObject);
    procedure bndConsRFADetailBeforePrint(Sender: TObject);
    procedure lblConsRFARankingPrint(Sender: TObject);
    procedure grpConsRFARRodapeCLASSBeforePrint(Sender: TObject);
    procedure shpAmortCotasFndPrint(Sender: TObject);
    procedure rptConsRentFundosBeforePrint(Sender: TObject);
    procedure rptConsRentFndAcoesBeforePrint(Sender: TObject);
    procedure rptTransferenciaBeforePrint(Sender: TObject);
    procedure rptAjusteBeforePrint(Sender: TObject);
    procedure rptVdAcoesCpFundosBeforePrint(Sender: TObject);
    procedure rptVdFundosCpAcoesBeforePrint(Sender: TObject);
    procedure shpSaldoFNDDetPrint(Sender: TObject);
    procedure ppGroupHeaderBand3BeforePrint(Sender: TObject);
    procedure srptPosFundoPrint(Sender: TObject);
    procedure rptSaldoFundoBeforePrint(Sender: TObject);
    procedure rptPosFundoStartPage(Sender: TObject);
    procedure rptCarteiraFundoStartPage(Sender: TObject);

  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
    wTotSalEnquadramento, wTotQtdEnquadramento, wGanhoCapital:Double;
    VetSaldoDiaData  : Array[1..100] of TDate;
    VetSaldoDiaVlr   : Array[1..100] of Double;
    function MostraParam(Form: String): boolean; OverRide;
  end;

var
  DmRelatoriosFundo : TDmRelatoriosFundo;
  wCountPlano       : Integer;
  wPlano            : String;

implementation

Uses Math, UDiasUteisInv,UDiasUteis, dOperacaoInvest, UFundoComum,
     FConsRentFundos, FConsRentFundoAcoes, FCadLancamentoFundo, FParamOperTransf,
     FCadAmortizacaoCotas, FCadLanctoFundoVdAcoes, FCadLanctoVdFundoCpAcoes,
  FCadAmortizacaoCotasAcoes;

{$R *.DFM}

function TDmRelatoriosFundo.MostraParam(Form: string): boolean;
var frm : TForm;
begin
  if (UPPERCASE(Form) = 'FRMPARAMOPERTRANSF') then
     frm := TfrmParamOperTransf.Create(Application)
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

procedure TDmRelatoriosFundo.ppSConsRentFndCabPrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   if TppShape(Sender).Name = 'ppSConsRentFndSubCat' then
   begin
      if qryConsRentFundoTotCat.FieldByName('CORCATEGFUNDO').IsNull then
         TppShape(Sender).Brush.Color := cCorZebra
      else
         TppShape(Sender).Brush.Color := qryConsRentFundoTotCat.FieldByName('CORCATEGFUNDO').AsInteger;
   end
   else if TppShape(Sender).Name = 'ppSConsRentFndDet' then
   begin
      if qryConsRentFundos.FieldByName('CORCATEGFUNDO').IsNull then
         TppShape(Sender).Brush.Color := cCorZebra
      else
         TppShape(Sender).Brush.Color := qryConsRentFundos.FieldByName('CORCATEGFUNDO').AsInteger;
   end;
end;

procedure TDmRelatoriosFundo.rptConsRentFundosStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   ppSConsRentFndDet.Brush.Color := clWhite;
end;

procedure TDmRelatoriosFundo.ppsSaldoFundosDetPrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;
   TppShape(Sender).Brush.Color := cCorZebra;
end;

procedure TDmRelatoriosFundo.ppSConsRentFndSubDetPrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;
   TppShape(Sender).Brush.Color := cCorZebra;
end;

procedure TDmRelatoriosFundo.ppGroupHeaderBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  shpTransfPlnPrevCab.Width :=  lblTransfPlanPrevCtbPatrTit.Width + ppDBTransfPlanPrev.Width;
end;

procedure TDmRelatoriosFundo.shpTransfDetPrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;
   TppShape(Sender).Brush.Color := cCorZebra;
end;

procedure TDmRelatoriosFundo.bndAjusteDatalheBeforePrint(Sender: TObject);
begin
  inherited;
  dbeAjusteQtdAjustada.DisplayFormat := MontaMascaraDecQtd(StrToInt(dbeAjusteIdFundoinvest.GetText));
  dbeAjusteSaldoQtd.DisplayFormat := dbeAjusteQtdAjustada.DisplayFormat;
end;

procedure TDmRelatoriosFundo.bndConsRFADetailBeforePrint(Sender: TObject);
begin
  inherited;
  if (not qryConsRentFndAcoesCORCATEGFUNDO.IsNull) and
          (qryConsRentFndAcoesCORCATEGFUNDO.AsInteger <> 0) then
  begin
     dbeConsRFAGestor.Font.Color := qryConsRentFndAcoesCORCATEGFUNDO.AsInteger;
     dbeConsRFAFundo.Font.Color := qryConsRentFndAcoesCORCATEGFUNDO.AsInteger;
     dbeConsRFASaldo.Font.Color := qryConsRentFndAcoesCORCATEGFUNDO.AsInteger;
     dbeConsRFARentDia.Font.Color := qryConsRentFndAcoesCORCATEGFUNDO.AsInteger;
     dbeConsRFADifDia.Font.Color := qryConsRentFndAcoesCORCATEGFUNDO.AsInteger;
     dbeConsRFARentMes.Font.Color := qryConsRentFndAcoesCORCATEGFUNDO.AsInteger;
     dbeConsRFADifMes.Font.Color := qryConsRentFndAcoesCORCATEGFUNDO.AsInteger;
     dbeConsRFARentAno.Font.Color := qryConsRentFndAcoesCORCATEGFUNDO.AsInteger;
     dbeConsRFADifAno.Font.Color := qryConsRentFndAcoesCORCATEGFUNDO.AsInteger;
     dbeConsRFARPerCateg.Font.Color := qryConsRentFndAcoesCORCATEGFUNDO.AsInteger;
  end
  else
  begin
     dbeConsRFAGestor.Font.Color := clBlack;
     dbeConsRFAFundo.Font.Color := clBlack;
     dbeConsRFASaldo.Font.Color := clBlack;
     dbeConsRFARentDia.Font.Color := clBlack;
     dbeConsRFADifDia.Font.Color := clBlack;
     dbeConsRFARentMes.Font.Color := clBlack;
     dbeConsRFADifMes.Font.Color := clBlack;
     dbeConsRFARentAno.Font.Color := clBlack;
     dbeConsRFADifAno.Font.Color := clBlack;
     dbeConsRFARPerCateg.Font.Color := clBlack;
  end;
end;

procedure TDmRelatoriosFundo.lblConsRFARankingPrint(Sender: TObject);
begin
  TppLabel(Sender).Caption := IntToStr(StrToInt(TppLabel(Sender).Caption)+1);
  inherited;
end;

procedure TDmRelatoriosFundo.grpConsRFARRodapeCLASSBeforePrint(
  Sender: TObject);
begin
  inherited;
  lblConsRFARanking.Caption := '0';
  if (not qryConsRentFndAcoesCORCATEGFUNDO.IsNull) and
          (qryConsRentFndAcoesCORCATEGFUNDO.AsInteger <> 0) then
  begin
     lblConsRFATotalGeral.Font.Color := qryConsRentFndAcoesCORCATEGFUNDO.AsInteger;
     dbcConsRFATotalCat.Font.Color := qryConsRentFndAcoesCORCATEGFUNDO.AsInteger;
     dbcConsRFARentDia.Font.Color := qryConsRentFndAcoesCORCATEGFUNDO.AsInteger;
     dbcConsRFARentMes.Font.Color := qryConsRentFndAcoesCORCATEGFUNDO.AsInteger;
     dbcConsRFARentAno.Font.Color := qryConsRentFndAcoesCORCATEGFUNDO.AsInteger;
     dbcConsRFAPerCateg.Font.Color := qryConsRentFndAcoesCORCATEGFUNDO.AsInteger;
  end
  else
  begin
     lblConsRFATotalGeral.Font.Color := clBlack;
     dbcConsRFATotalCat.Font.Color := clBlack;
     dbcConsRFARentDia.Font.Color := clBlack;
     dbcConsRFARentMes.Font.Color := clBlack;
     dbcConsRFARentAno.Font.Color := clBlack;
     dbcConsRFAPerCateg.Font.Color := clBlack;
  end;
end;

procedure TDmRelatoriosFundo.shpAmortCotasFndPrint(Sender: TObject);
begin
  inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;
end;

procedure TDmRelatoriosFundo.rptConsRentFundosBeforePrint(Sender: TObject);
begin
  inherited;
    LblPlanoRentFdo.Caption := sPlanPrevCtbPatro;
end;

procedure TDmRelatoriosFundo.rptConsRentFndAcoesBeforePrint(
  Sender: TObject);
begin
  inherited;
    LblPlanoRentAcoes.Caption := sPlanPrevCtbPatro;
end;

procedure TDmRelatoriosFundo.rptTransferenciaBeforePrint(Sender: TObject);
begin
  inherited;
    LblPlanoTransf.Caption := sPlanPrevCtbPatro;
end;

procedure TDmRelatoriosFundo.rptAjusteBeforePrint(Sender: TObject);
begin
  inherited;
    LblPlanoAjuste.Caption := sPlanPrevCtbPatro;
end;

procedure TDmRelatoriosFundo.rptVdAcoesCpFundosBeforePrint(
  Sender: TObject);
begin
  inherited;
    LblPlanoVdAc.Caption := sPlanPrevCtbPatro;
    lblPeriodo.Caption   := frmCadLanctoFundoVdAcoes.dbDtaTransf.Text;
end;

procedure TDmRelatoriosFundo.rptVdFundosCpAcoesBeforePrint(
  Sender: TObject);
begin
  inherited;
    LblPlanoCpAc.Caption := sPlanPrevCtbPatro;
end;

procedure TDmRelatoriosFundo.shpSaldoFNDDetPrint(Sender: TObject);
begin
   inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;
end;

procedure TDmRelatoriosFundo.ppGroupHeaderBand3BeforePrint(
  Sender: TObject);
begin
  inherited;
  // Buscar a mascara
  ppDBSaldoCotas.DisplayFormat := frmCadLancamentoFundo.QrySaldoFundoSALDOQTDCOTAS.DisplayFormat;
  ppDBTotSaldoCotas.DisplayFormat := frmCadLancamentoFundo.QrySaldoFundoSALDOQTDCOTAS.DisplayFormat;
  ppDBCotaAtual.DisplayFormat := frmCadLancamentoFundo.QrySaldoFundoVLRCOTAAPLICACAO.DisplayFormat;
end;

procedure TDmRelatoriosFundo.srptPosFundoPrint(Sender: TObject);
begin
  inherited;
  qryPosFundoDet.Filter := 'IDFUNDOINVEST = ' + qryPosFundo.FieldByName('IDFUNDOINVEST').AsString;
end;

procedure TDmRelatoriosFundo.rptSaldoFundoBeforePrint(Sender: TObject);
begin
  inherited;
    LblPlanoSaldo.Caption := sPlanPrevCtbPatro;
end;

procedure TDmRelatoriosFundo.rptPosFundoStartPage(Sender: TObject);
begin
  inherited;
  cCorZebra := $00E3E3E3;
end;

procedure TDmRelatoriosFundo.rptCarteiraFundoStartPage(Sender: TObject);
begin
  inherited;
  cCorZebra := $00E3E3E3;
end;

Initialization

Finalization

end.
