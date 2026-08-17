unit DRelatoriosCFinan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, TeEngine, Series, DBChart, ExtCtrls, TeeProcs, Chart,
  ppChrtDB, ppChrt, ppStrtch, ppSubRpt, ppRegion, ppRichTx, ppMemo,
  uExtensoCM, ppVar, ppRelatv, ppDBPipe, ppModule, daDataModule;

type
  TdtmRelatoriosCFinan = class(TdtmReports)
    ppExtratoConta: TppBDEPipeline;
    dsExtratoConta: TwwDataSource;
    gryExtratoConta: TwwQuery;
    rpExtratoConta: TppReport;
    ppHeader: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppDetail: TppDetailBand;
    ppFooter: TppFooterBand;
    ppLine4: TppLine;
    ppLabel6: TppLabel;
    dbtDescricao: TppDBText;
    rpExtratoContaLine1: TppLine;
    lblData: TppLabel;
    lblDoc: TppLabel;
    lblHistorico: TppLabel;
    lblValor: TppLabel;
    lblSaldo: TppLabel;
    lblStatus: TppLabel;
    dbtData: TppDBText;
    dbtBordero: TppDBText;
    dbtHistorico: TppDBText;
    dbtValor: TppDBText;
    dbtStatus: TppDBText;
    rpExtratoContaLabel10: TppLabel;
    lbData: TppLabel;
    rpExtratoContaLabel11: TppLabel;
    lbStatus: TppLabel;
    rpExtratoContaGroup1: TppGroup;
    rpHeaderDescricao: TppGroupHeaderBand;
    rpFooterDescricao: TppGroupFooterBand;
    pplSaldo: TppBDEPipeline;         
    dsSaldo: TwwDataSource;
    grySaldo: TwwQuery;
    rpSaldo: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lbDataSaldo: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    rpSaldoLabel1: TppLabel;
    rpSaldoLabel2: TppLabel;
    rpSaldoLine1: TppLine;
    rpSaldoLabel3: TppLabel;
    rpSaldoLabel6: TppLabel;
    lbStatusSaldo: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppReport1DBText1: TppDBText;
    rpSaldoDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    pplSaldoHist: TppBDEPipeline;
    dsSaldoHist: TwwDataSource;
    grySaldoHist: TwwQuery;
    rpSaldoHist: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    lbDataSaldoHist: TppLabel;
    pplblEmpresa: TppLabel;
    rpSaldoHistLabel2: TppLabel;
    rpSaldoHistLabel1: TppLabel;
    rpSaldoHistLine1: TppLine;
    rpSaldoHistLabel3: TppLabel;
    rpSaldoHistLabel4: TppLabel;
    rpSaldoHistDBText1: TppDBText;
    rpSaldoHistLine2: TppLine;
    rpSaldoHistDBText3: TppDBText;
    rpSaldoHistDBText2: TppDBText;
    rpSaldoHistDBText4: TppDBText;
    ppLine6: TppLine;
    pplblSistema: TppLabel;
    lbStatusSaldoHist: TppLabel;
    pplCompRecPag: TppBDEPipeline;
    dsCompRecPag: TwwDataSource;
    gryCompRecPag: TwwQuery;
    rpCompRecPag: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLine5: TppLine;
    ppLabel11: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppLine7: TppLine;
    ppLabel12: TppLabel;
    rpCompRecPagDBTeeChart1: TppDBTeeChart;
    Series4: TPieSeries;
    Series5: TBarSeries;
    rpBalanceteLabel1: TppLabel;
    lbDataComposicao: TppLabel;
    rpCompRecPagLabel1: TppLabel;
    lbCentroRespos: TppLabel;
    lbAtividade: TppLabel;
    rpCompRecPagLabel4: TppLabel;
    lbTitulo: TppLabel;
    Series1: THorizBarSeries;
    rpSaldoDBCalc1: TppDBCalc;
    rpSaldoLabel4: TppLabel;
    pplLancamento: TppBDEPipeline;
    dsLancamento: TwwDataSource;
    qryLancamento: TwwQuery;
    rpLancamento: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    rpLancamentoLabel2: TppLabel;
    rpLancamentoLabel3: TppLabel;
    Label9: TppLabel;
    rpLancamentoDBText9: TppDBText;
    rpLancamentoDBCalc2: TppDBCalc;
    rpLancamentoLabel1: TppLabel;
    rpLancamentoLine1: TppLine;
    lblDataLancamento: TppLabel;
    rpLancamentoLabel4: TppLabel;
    rpLancamentoLabel5: TppLabel;
    rpLancamentoSummaryBand1: TppSummaryBand;
    rpLancamentoLabel6: TppLabel;
    rpLancamentoDBText1: TppDBText;
    rpLancamentoLabel8: TppLabel;
    rpLancamentoLabel10: TppLabel;
    rpLancamentoLabel11: TppLabel;
    rpLancamentoDBText2: TppDBText;
    rpLancamentoDBText4: TppDBText;
    rpLancamentoDBText5: TppDBText;
    rpLancamentoShape3: TppShape;
    rpLancamentoLabel14: TppLabel;
    rpLancamentoDBText10: TppDBText;
    rpLancamentoLabel9: TppLabel;
    rpLancamentoLabel13: TppLabel;
    rpLancamentoDBText3: TppDBText;
    rpLancamentoDBText7: TppDBText;
    rpLancamentoDBText11: TppDBText;
    rpLancamentoLabel15: TppLabel;
    rpLancamentoDBText6: TppDBText;
    rpLancamentoLabel7: TppLabel;
    rpLancamentoDBText8: TppDBText;
    rpLancamentoDBText12: TppDBText;
    rpLancamentoDBText13: TppDBText;
    rpLancamentoLabel12: TppLabel;
    rpLancamentoLabel16: TppLabel;
    rpLancamentoShape1: TppShape;
    rpExtratoContaLine3: TppLine;
    v: TFloatField;
    gryExtratoContaCODFINANC: TFloatField;
    gryExtratoContaBORDERO: TStringField;
    gryExtratoContaDATA: TDateTimeField;
    gryExtratoContaENTRADASAIDA: TStringField;
    gryExtratoContaHISTORICO: TStringField;
    gryExtratoContaSTATUS: TStringField;
    gryExtratoContaDESCRICAO: TStringField;
    gryExtratoContaVALOR: TFloatField;
    gryExtratoContaVALORENTRADA: TFloatField;
    gryExtratoContaVALORSAIDA: TFloatField;
    gryExtratoContaSALDOANTERIOR: TFloatField;
    gryExtratoContaSALDOREGISTRO: TFloatField;
    rpExtratoContaDBText2: TppDBText;
    rpExtratoContaDBText3: TppDBText;
    rpExtratoContaLabel1: TppLabel;
    rpExtratoContaDBCalc2: TppDBCalc;
    rpExtratoContaDBCalc3: TppDBCalc;
    updExtratoConta: TUpdateSQL;
    qryEmisTransf: TwwQuery;
    dsEmisTransf: TwwDataSource;
    pplEmisTransf: TppBDEPipeline;
    rpEmisTransf: TppReport;
    ppDetailBand5: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape2: TppShape;
    ppDBText13: TppDBText;
    ppLabel19: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    qryContabilidade: TwwQuery;
    dsContabilidade: TwwDataSource;
    pplContabilidade: TppBDEPipeline;
    rpContabilidade: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLabel33: TppLabel;
    ppLine9: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape4: TppShape;
    ppDBText26: TppDBText;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel45: TppLabel;
    updContabilidade: TUpdateSQL;
    rpContabilidadeDBCalc1: TppDBCalc;
    rpContabilidadeLabel1: TppLabel;
    rpContabilidadeDBText1: TppDBText;
    rpContabilidadeLine1: TppLine;
    rpContabilidadeLine2: TppLine;
    rpEmisTransfDBText1: TppDBText;
    rpEmisTransfLabel1: TppLabel;
    rpEmisTransfLabel2: TppLabel;
    rpEmisTransfLabel4: TppLabel;
    rpEmisTransfLabel5: TppLabel;
    rpEmisTransfShape1: TppShape;
    rpEmisTransfShape2: TppShape;
    rpEmisTransfShape4: TppShape;
    rpEmisTransfShape5: TppShape;
    rpEmisTransfDBText2: TppDBText;
    rpEmisTransfLabel3: TppLabel;
    rpEmisTransfLabel6: TppLabel;
    rpEmisTransfDBText3: TppDBText;
    rpEmisTransfLine2: TppLine;
    rpEmisTransfLabel7: TppLabel;
    rpEmisTransfDBText4: TppDBText;
    rpEmisTransfShape3: TppShape;
    rpEmisTransfShape6: TppShape;
    rpEmisTransfShape7: TppShape;
    rpEmisTransfShape8: TppShape;
    rpEmisTransfShape9: TppShape;
    rpEmisTransfShape10: TppShape;
    rpEmisTransfLabel8: TppLabel;
    rpEmisTransfLabel9: TppLabel;
    rpEmisTransfLabel10: TppLabel;
    rpEmisTransfLabel11: TppLabel;
    rpEmisTransfLabel12: TppLabel;
    rpEmisTransfLabel13: TppLabel;
    rpEmisTransfLine3: TppLine;
    rpEmisTransfLabel15: TppLabel;
    rpEmisTransfShape11: TppShape;
    rpEmisTransfLine1: TppLine;
    rpEmisTransfLabel14: TppLabel;
    rpEmisTransfLabel16: TppLabel;
    rpEmisTransfMemo1: TppMemo;
    rpEmisTransfDBMemo1: TppDBMemo;
    rpEmisTransfDBText5: TppDBText;
    rpEmisTransfDBText6: TppDBText;
    rpEmisTransfDBMemo2: TppDBMemo;
    rpContabilidadeSubReport1: TppSubReport;
    rpContabilidadeChildReport1DetailBand1: TppDetailBand;
    qryPrevisao: TwwQuery;
    dsPrevisao: TwwDataSource;
    pplPrevisao: TppBDEPipeline;
    rpContabilidadeChildReport1Label1: TppLabel;
    rpContabilidadeChildReport1Label2: TppLabel;
    rpContabilidadeChildReport1Label3: TppLabel;
    rpContabilidadeChildReport1Label4: TppLabel;
    rpContabilidadeChildReport1Label5: TppLabel;
    rpContabilidadeChildReport1Label6: TppLabel;
    rpContabilidadeChildReport1DBText1: TppDBText;
    rpContabilidadeChildReport1DBText2: TppDBText;
    rpContabilidadeChildReport1DBText3: TppDBText;
    rpContabilidadeChildReport1DBText4: TppDBText;
    rpContabilidadeChildReport1DBText5: TppDBText;
    rpContabilidadeChildReport1DBText6: TppDBText;
    rpContabilidadeChildReport1Shape1: TppShape;
    rpLancamentoSubReport1: TppSubReport;
    rpLancamentoChildReport1DetailBand1: TppDetailBand;
    rpLancamentoChildReport1Label1: TppLabel;
    rpLancamentoChildReport1Label2: TppLabel;
    rpLancamentoChildReport1DBText1: TppDBText;
    rpLancamentoChildReport1DBText2: TppDBText;
    rpLancamentoChildReport1Shape1: TppShape;
    rpLancamentoChildReport1Label3: TppLabel;
    rpLancamentoChildReport1Label4: TppLabel;
    rpLancamentoChildReport1DBText3: TppDBText;
    rpLancamentoChildReport1DBText4: TppDBText;
    rpLancamentoChildReport1Label5: TppLabel;
    rpLancamentoChildReport1Label6: TppLabel;
    rpLancamentoChildReport1DBText5: TppDBText;
    rpLancamentoChildReport1DBText6: TppDBText;
    rpLancamentoChildReport1Label7: TppLabel;
    rpLancamentoChildReport1Label8: TppLabel;
    rpLancamentoChildReport1DBText7: TppDBText;
    rpLancamentoChildReport1DBText8: TppDBText;
    rpLancamentoChildReport1DBText9: TppDBText;
    rpSaldoLabel5: TppLabel;
    rpSaldoDBText2: TppDBText;
    rpSaldoLabel7: TppLabel;
    rpSaldoDBText3: TppDBText;
    rpSaldoDBText4: TppDBText;
    rpSaldoDBCalc2: TppDBCalc;
    rpSaldoDBCalc3: TppDBCalc;
    rpSaldoSummaryBand1: TppSummaryBand;
    qryFluxoReaAna: TwwQuery;
    dsFluxoReaAna: TwwDataSource;
    pplFluxoReaAna: TppBDEPipeline;
    rpFluxoReaAna: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel7: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppFooterBand7: TppFooterBand;
    ppLine8: TppLine;
    ppLabel14: TppLabel;
    rpFluxoReaAnaLabel1: TppLabel;
    rpFluxoReaAnaDBText1: TppDBText;
    rpFluxoReaAnaDBText2: TppDBText;
    rpFluxoReaAnaLine1: TppLine;
    rpFluxoReaAnaLine2: TppLine;
    rpFluxoReaAnaLine3: TppLine;
    rpFluxoReaAnaLine4: TppLine;
    rpFluxoReaAnaLabel2: TppLabel;
    rpFluxoReaAnaDBText3: TppDBText;
    rpFluxoReaAnaDBText4: TppDBText;
    rpFluxoReaAnaDBText5: TppDBText;
    rpFluxoReaAnaDBText6: TppDBText;
    rpFluxoReaAnaDBText7: TppDBText;
    rpFluxoReaAnaDBText8: TppDBText;
    rpFluxoReaAnaDBText9: TppDBText;
    rpFluxoReaAnaLabel3: TppLabel;
    rpFluxoReaAnaLabel4: TppLabel;
    rpFluxoReaAnaLabel5: TppLabel;
    rpFluxoReaAnaLabel6: TppLabel;
    rpFluxoReaAnaLabel7: TppLabel;
    rpFluxoReaAnaLabel8: TppLabel;
    rpFluxoReaAnaDBCalc1: TppDBCalc;
    rpFluxoReaAnaDBCalc2: TppDBCalc;
    rpFluxoReaAnaLabel9: TppLabel;
    rpFluxoReaAnaLine5: TppLine;
    rpFluxoReaAnaLine7: TppLine;
    rpFluxoReaAnaLine6: TppLine;
    rpFluxoReaAnaSummaryBand1: TppSummaryBand;
    rpFluxoReaAnaLabel10: TppLabel;
    rpFluxoReaAnaDBCalc3: TppDBCalc;
    qryOrcxRea: TwwQuery;
    dsOrcxRea: TwwDataSource;
    pplOrcxRea: TppBDEPipeline;
    rpOrcxRea: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel10: TppLabel;
    ppLine10: TppLine;
    ppLabel13: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppFooterBand8: TppFooterBand;
    ppLine11: TppLine;
    ppLabel15: TppLabel;
    rpOrcxReaLine1: TppLine;
    rpOrcxReaLabel1: TppLabel;
    rpOrcxReaLabel2: TppLabel;
    rpOrcxReaLabel3: TppLabel;
    rpOrcxReaLabel4: TppLabel;
    rpOrcxReaLabel5: TppLabel;
    rpOrcxReaLabel6: TppLabel;
    rpOrcxReaLine2: TppLine;
    rpOrcxReaLine3: TppLine;
    rpOrcxReaDBText2: TppDBText;
    rpOrcxReaDBText3: TppDBText;
    rpOrcxReaDBText4: TppDBText;
    rpOrcxReaDBText5: TppDBText;
    rpOrcxReaDBText6: TppDBText;
    rpOrcxReaDBCalc1: TppDBCalc;
    rpOrcxReaDBCalc2: TppDBCalc;
    rpOrcxReaDBCalc3: TppDBCalc;
    rpOrcxReaDBText1: TppDBText;
    updOrcxRea: TUpdateSQL;
    rpOrcxReaDBText7: TppDBText;
    rpOrcxReaLabel7: TppLabel;
    rpOrcxReaSummaryBand1: TppSummaryBand;
    rpOrcxReaLabel8: TppLabel;
    rpOrcxReaDBCalc4: TppDBCalc;
    rpOrcxReaDBCalc5: TppDBCalc;
    rpOrcxReaDBCalc6: TppDBCalc;
    rpOrcxReaLine4: TppLine;
    rpOrcxReaLine5: TppLine;
    rpOrcxReaLine6: TppLine;
    rpOrcxReaLabel9: TppLabel;
    rpOrcxReaLabel10: TppLabel;
    rpOrcxReaDBText8: TppDBText;
    rpOrcxReaLabel11: TppLabel;
    rpOrcxReaLabel12: TppLabel;
    rpOrcxReaDBCalc10: TppDBCalc;
    rpOrcxReaDBCalc11: TppDBCalc;
    rpOrcxReaDBCalc7: TppDBCalc;
    rpOrcxReaDBCalc8: TppDBCalc;
    rpOrcxReaDBCalc9: TppDBCalc;
    rpOrcxReaDBCalc12: TppDBCalc;
    rpOrcxReaDBCalc13: TppDBCalc;
    rpOrcxReaDBCalc14: TppDBCalc;
    rpOrcxReaDBCalc15: TppDBCalc;
    rpOrcxReaLine7: TppLine;
    qryDispFinanc: TwwQuery;
    dsDispFinanc: TwwDataSource;
    pplDispFinanc: TppBDEPipeline;
    rpDispFinanc: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    ppLabel23: TppLabel;
    ppLabel27: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLine14: TppLine;
    ppLabel32: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    rpDispFinancLabel1: TppLabel;
    rpDispFinancLabel2: TppLabel;
    rpDispFinancDBText2: TppDBText;
    rpDispFinancLabel3: TppLabel;
    pplOrcxReaCR: TppBDEPipeline;
    rpOrcxReaCR: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel25: TppLabel;
    ppLine15: TppLine;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppDetailBand10: TppDetailBand;
    rpOrcxReaCRDBText4: TppDBText;
    rpOrcxReaCRDBText3: TppDBText;
    rpOrcxReaCRDBText5: TppDBText;
    rpOrcxReaCRDBText6: TppDBText;
    ppDBText23: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine18: TppLine;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    rpOrcxReaCRDBCalc7: TppDBCalc;
    rpOrcxReaCRDBCalc8: TppDBCalc;
    rpOrcxReaCRDBCalc9: TppDBCalc;
    ppLine19: TppLine;
    ppLine20: TppLine;
    rpOrcxReaCRLabel12: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLine21: TppLine;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel53: TppLabel;
    ppDBText24: TppDBText;
    rpOrcxReaCRLabel11: TppLabel;
    rpOrcxReaCRDBCalc4: TppDBCalc;
    rpOrcxReaCRDBCalc5: TppDBCalc;
    rpOrcxReaCRDBCalc6: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText25: TppDBText;
    ppLine22: TppLine;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLine23: TppLine;
    ppLabel55: TppLabel;
    ppDBText27: TppDBText;
    rpOrcxReaCRDBCalc1: TppDBCalc;
    rpOrcxReaCRDBCalc2: TppDBCalc;
    rpOrcxReaCRDBCalc3: TppDBCalc;
    rpOrcxReaCRLabel9: TppLabel;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    qryOrcxReaCR: TwwQuery;
    dsOrcxReaCR: TwwDataSource;
    updOrcxReaCR: TUpdateSQL;
    rpOrcxReaCRLabel1: TppLabel;
    rpOrcxReaCRDBText1: TppDBText;
    rpOrcxReaCRDBText2: TppDBText;
    rpOrcxReaCRLine1: TppLine;
    qryFluxoReaAnaOri: TwwQuery;
    Extenso: TExtensoCM;
    rpExtratoContaSummaryBand1: TppSummaryBand;
    gryExtratoContaSALDOTOTAL: TFloatField;
    rpExtratoContaDBText1: TppDBText;
    rpExtratoContaDBCalc1: TppDBCalc;
    rpExtratoContaDBCalc4: TppDBCalc;
    rpExtratoContaLine2: TppLine;
    rpExtratoContaLabel2: TppLabel;
    qryOrcxPrevisto: TwwQuery;
    dsOrcxPrevisto: TwwDataSource;
    ppOrcxPrevisto: TppBDEPipeline;
    rpOrcxPrevisto: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabelTituloRelatorio: TppLabel;
    ppLine24: TppLine;
    ppLabelEmpresa: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppDetailBand11: TppDetailBand;
    rpOrcxPrevistoDBText2: TppDBText;
    rpOrcxPrevistoDBText3: TppDBText;
    rpOrcxPrevistoDBText4: TppDBText;
    rpOrcxPrevistoDBText5: TppDBText;
    rpOrcxPrevistoDBText1: TppDBText;
    ppFooterBand11: TppFooterBand;
    ppLine27: TppLine;
    ppLabel62: TppLabel;
    ppSummaryBand3: TppSummaryBand;
    ppLabel63: TppLabel;
    rpOrcxPrevistoDBCalc4: TppDBCalc;
    rpOrcxPrevistoDBCalc5: TppDBCalc;
    rpOrcxPrevistoDBCalc6: TppDBCalc;
    ppLine28: TppLine;
    ppLine29: TppLine;
    rpOrcxPrevistoLabel12: TppLabel;
    rpOrcxPrevistoDBCalc15: TppDBCalc;
    rpOrcxPrevistoDBCalc14: TppDBCalc;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLine30: TppLine;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLabel65: TppLabel;
    ppDBText29: TppDBText;
    rpOrcxPrevistoLabel11: TppLabel;
    rpOrcxPrevistoDBCalc7: TppDBCalc;
    rpOrcxPrevistoDBCalc8: TppDBCalc;
    rpOrcxPrevistoDBCalc9: TppDBCalc;
    rpOrcxPrevistoDBCalc12: TppDBCalc;
    rpOrcxPrevistoDBCalc13: TppDBCalc;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    rpOrcxPrevistoDBText6: TppDBText;
    ppLine31: TppLine;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLine32: TppLine;
    rpOrcxPrevistoLabel7: TppLabel;
    rpOrcxPrevistoDBText7: TppDBText;
    rpOrcxPrevistoDBCalc1: TppDBCalc;
    rpOrcxPrevistoDBCalc2: TppDBCalc;
    rpOrcxPrevistoDBCalc3: TppDBCalc;
    rpOrcxPrevistoLabel9: TppLabel;
    rpOrcxPrevistoDBCalc10: TppDBCalc;
    rpOrcxPrevistoDBCalc11: TppDBCalc;
    updOrcxPrevisto: TUpdateSQL;
    rpDispFinancDBCalc1: TppDBCalc;
    qryObsDispFinanc: TQuery;
    rpDispFinancObs: TppLabel;
    ppCalc14: TppSystemVariable;
    ppCalc15: TppSystemVariable;
    ppCalc16: TppSystemVariable;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    ppCalc19: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    ppCalc13: TppSystemVariable;
    ppCalc7: TppSystemVariable;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    ppCalc11: TppSystemVariable;
    rpLancamentoCalc1: TppSystemVariable;
    rpLancamentoCalc2: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppConferDocRegular: TppBDEPipeline;
    dsConferDocRegular: TwwDataSource;
    qryConferDocRegular: TwwQuery;
    rpConferDocRegular: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppLabel52: TppLabel;
    ppLine33: TppLine;
    ppLabel54: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppFooterBand12: TppFooterBand;
    ppLine34: TppLine;
    ppLabel64: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup7: TppGroup;
    grpbIDRelaciona: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppGroup8: TppGroup;
    grpbFlgNI: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppLine35: TppLine;
    ppLabel66: TppLabel;
    dbtGrupo: TppDBText;
    ppLine37: TppLine;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppLine38: TppLine;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppDBText28: TppDBText;
    ppLabel70: TppLabel;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppLine39: TppLine;
    ppDBText30: TppDBText;
    ppLine40: TppLine;
    ppLabel71: TppLabel;
    lblTipoDoc: TppLabel;
    ppDBText31: TppDBText;
    procedure dtmRelatoriosCFinanCreate(Sender: TObject);
    procedure dtmRelatoriosCFinanDestroy(Sender: TObject);
    procedure rpEmisTransfMemo1Print(Sender: TObject);
    procedure rpLancamentoChildReport1Label8Print(Sender: TObject);
    procedure ppDetailBand8BeforeGenerate(Sender: TObject);
    procedure rpOrcxReaLabel9Print(Sender: TObject);
    procedure rpOrcxReaLabel11Print(Sender: TObject);
    procedure rpOrcxReaLabel12Print(Sender: TObject);
    procedure rpOrcxReaCRLabel9Print(Sender: TObject);
    procedure rpOrcxReaCRLabel11Print(Sender: TObject);
    procedure rpOrcxReaCRLabel12Print(Sender: TObject);
    procedure rpOrcxPrevistoLabel9Print(Sender: TObject);
    procedure rpOrcxPrevistoLabel11Print(Sender: TObject);
    procedure rpOrcxPrevistoLabel12Print(Sender: TObject);
    procedure rpDispFinancObsPrint(Sender: TObject);
    procedure grpbIDRelacionaAfterPrint(Sender: TObject);
    procedure grpbFlgNIAfterPrint(Sender: TObject);
    procedure ppDetailBand12AfterPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    aListaSaldo: Tstrings;
    sAuxIni, sAuxFim: String;
    function MostraParam(Form: string): boolean;override;
    function DifPercentual(VlrMaior,VlrMenor: String): Extended;
  end;

var
  dtmRelatoriosCFinan : TdtmRelatoriosCFinan;
  rSaldo: Real;

implementation

uses fParamExtratoConta, fParamSaldo, fParamSaldoHist,
     fParamCompRecPag, fParamLancamento, uSistema, fRParamFluxoAna,
     fParamRContab,fRParamTransf,fRParamReaxOrc,fRParamReaxOrcCR,
     fRParamDispFinanc, FRParamOrcxPrevisto, FParamConferDocReg;

{$R *.DFM}
function TdtmRelatoriosCFinan.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     if (UPPERCASE(Form) = 'FRMEXTRATOCONTA') then begin
        frm := TfrmExtratoConta.Create(Application);
        end
     else
     if (UPPERCASE(Form) = 'FRMRPARAMFLUXOANA') then begin
        frm := TfrmRParamFluxoAna.Create(Application);
        end
     else
     if (UPPERCASE(Form) = 'FRMSALDO') then begin
        frm := TfrmSaldo.Create(Application);
        end
     else
     if (UPPERCASE(Form) = 'FRMSALDOHIST') then begin
        frm := TfrmSaldoHist.Create(Application);
        end
     else
     if (UPPERCASE(Form) = 'FRMRPARAMDISPFINANC') then begin
        frm := TfrmRParamDispFinanc.Create(Application);
        end
     else
     if (UPPERCASE(Form) = 'FRMCOMPRECPAG') then begin
        frm := TfrmCompRecPag.Create(Application);
        end
     else
     if (UPPERCASE(Form) = 'FRMPARAMRCONTAB') then begin
        frm := TfrmParamRContab.Create(Application);
        end
     else
     if (UPPERCASE(Form) = 'FRMPARAMLANCAMENTO') then begin
        frm := TfrmParamLancamento.Create(Application);
        end
     else
     if (UPPERCASE(Form) = 'FRMRPARAMREAXORC') then begin
        frm := TfrmRParamReaxOrc.Create(Application);
        end
     else
     if (UPPERCASE(Form) = 'FRMRPARAMREAXORCCR') then begin
        frm := TfrmRParamReaxOrcCR.Create(Application);
        end
     else
     if (UPPERCASE(Form) = 'FRMRPARAMTRANSF') then begin
        frm := TfrmRParamTransf.Create(Application);
        end
     else                   
     if (UPPERCASE(Form) = 'FRMRPARAMORCXPREVISTO') then begin
        frm := TfrmRParamOrcxPrevisto.Create(Application);
        end
     else
     if (UPPERCASE(Form) = 'FRMPARAMCONFERDOCREG') then begin
        frm := TfrmParamConferDocReg.Create(Application);
        end
     else
        frm := nil;

     if frm = nil then
        Result := false
     else
     begin
          with frm do
          begin
             Result := (ShowModal = mrOk);
             free;
          end;
     end;
end;

procedure TdtmRelatoriosCFinan.dtmRelatoriosCFinanCreate(Sender: TObject);
begin
  inherited;
  aListaSaldo := TStringList.Create;
end;

procedure TdtmRelatoriosCFinan.dtmRelatoriosCFinanDestroy(Sender: TObject);
begin
  inherited;
  aListaSaldo.Free;
end;

procedure TdtmRelatoriosCFinan.rpEmisTransfMemo1Print(Sender: TObject);
begin
  inherited;
  Extenso.SetaIdiomaPadrao;
  Extenso.SetaMoedaPadrao;
  Extenso.Valor             := qryEmisTransf.FieldByName('VALORLANCFINAN').AsFloat;
  Extenso.CaracterAdicional := '* ';
  Extenso.CompletaExtenso   := true;
  Extenso.TamanhoLinha      := 500;
  Extenso.Escreve;
  rpEmisTransfMemo1.Lines.Text:= Extenso.LinhasExtenso.Linha1;
end;

procedure TdtmRelatoriosCFinan.rpLancamentoChildReport1Label8Print(
  Sender: TObject);
var rValor1,rValor2,rValor3 : Extended;
begin
  inherited;
  rValor1:=0;
  rValor2:=0;
  rValor3:=0;
  if trim(rpLancamentoChildReport1DBText7.GetText) <> '' then
     rValor1:=StrToFloat(rpLancamentoChildReport1DBText7.GetText);
  if trim(rpLancamentoChildReport1DBText9.GetText) <> '' then
     rValor2:=StrToFloat(rpLancamentoChildReport1DBText9.GetText);
  if trim(rpLancamentoChildReport1DBText8.GetText) <> '' then
     rValor3:=StrToFloat(rpLancamentoChildReport1DBText8.GetText);
  rpLancamentoChildReport1Label8.Caption:= FormatFloat('#,##0.00',(rValor1+rValor2-rValor3));
end;

procedure TdtmRelatoriosCFinan.ppDetailBand8BeforeGenerate(
  Sender: TObject);
begin
  inherited;
  rpOrcxReaDBText1.Font.Style := [];
  rpOrcxReaDBText2.Font.Style := [];
  rpOrcxReaDBText3.Font.Style := [];
  rpOrcxReaDBText4.Font.Style := [];
  rpOrcxReaDBText5.Font.Style := [];
  rpOrcxReaDBText1.Left       := 11906;
  If qryOrcxRea.FieldByName('ANASINT').AsString = 'S' then begin
     rpOrcxReaDBText1.Font.Style:= [fsbold];
     rpOrcxReaDBText2.Font.Style:= [fsbold];
     rpOrcxReaDBText3.Font.Style:= [fsbold];
     rpOrcxReaDBText4.Font.Style:= [fsbold];
     rpOrcxReaDBText5.Font.Style:= [fsbold];
     rpOrcxReaDBText1.Left := 1588;
  end;
end;

procedure TdtmRelatoriosCFinan.rpOrcxReaLabel9Print(Sender: TObject);
begin
  inherited;
  rpOrcxReaLabel9.Caption:= FormatFloat('#,##0.00',DifPercentual(rpOrcxReaDBCalc10.GetText,
                                                                 rpOrcxReaDBCalc11.GetText));
end;

procedure TdtmRelatoriosCFinan.rpOrcxReaLabel11Print(Sender: TObject);
begin
  inherited;
  rpOrcxReaLabel11.Caption:= FormatFloat('#,##0.00',DifPercentual(rpOrcxReaDBCalc12.GetText,
                                                                  rpOrcxReaDBCalc13.GetText));
end;

procedure TdtmRelatoriosCFinan.rpOrcxReaLabel12Print(Sender: TObject);
begin
  inherited;
  rpOrcxReaLabel12.Caption:= FormatFloat('#,##0.00',DifPercentual(rpOrcxReaDBCalc14.GetText,
                                                                  rpOrcxReaDBCalc15.GetText));
end;

procedure TdtmRelatoriosCFinan.rpOrcxReaCRLabel9Print(Sender: TObject);
begin
  inherited;
  rpOrcxReaCRLabel9.Caption:= FormatFloat('#,##0.00',DifPercentual(ppDBCalc14.GetText,
                                                                   ppDBCalc15.GetText));
end;

procedure TdtmRelatoriosCFinan.rpOrcxReaCRLabel11Print(Sender: TObject);
begin
  inherited;
  rpOrcxReaCRLabel11.Caption:= FormatFloat('#,##0.00',DifPercentual(ppDBCalc9.GetText,
                                                                    ppDBCalc10.GetText));
end;

procedure TdtmRelatoriosCFinan.rpOrcxReaCRLabel12Print(Sender: TObject);
begin
  inherited;
  rpOrcxReaCRLabel12.Caption:= FormatFloat('#,##0.00',DifPercentual(ppDBCalc5.GetText,
                                                                    ppDBCalc4.GetText));
end;

procedure TdtmRelatoriosCFinan.rpOrcxPrevistoLabel9Print(Sender: TObject);
begin
  inherited;
  rpOrcxPrevistoLabel9.Caption:= FormatFloat('#,##0.00',DifPercentual(rpOrcxPrevistoDBCalc10.GetText,
                                                                      rpOrcxPrevistoDBCalc11.GetText));
end;

procedure TdtmRelatoriosCFinan.rpOrcxPrevistoLabel11Print(Sender: TObject);
begin
  inherited;
  rpOrcxPrevistoLabel11.Caption:= FormatFloat('#,##0.00',DifPercentual(rpOrcxPrevistoDBCalc12.GetText,
                                                                       rpOrcxPrevistoDBCalc13.GetText));
end;

procedure TdtmRelatoriosCFinan.rpOrcxPrevistoLabel12Print(Sender: TObject);
begin
  inherited;
  rpOrcxPrevistoLabel12.Caption:= FormatFloat('#,##0.00',DifPercentual(rpOrcxPrevistoDBCalc14.GetText,
                                                                       rpOrcxPrevistoDBCalc15.GetText));
end;

function TdtmRelatoriosCFinan.DifPercentual(VlrMaior,VlrMenor: String): Extended;
var rVlrMenor,rVlrMaior : Extended;
begin
   rVlrMenor:=0;
   rVlrMaior:=0;
   Result:=0;
   if Trim(VlrMenor)<>'' then rVlrMenor:=StrToFloat(VlrMenor);
   if Trim(VlrMaior)<>'' then rVlrMaior:=StrToFloat(VlrMaior);
   if rVlrMaior<>0 then Result:=(((rVlrMaior - rVlrMenor)/rVlrMaior)*100);
end;

procedure TdtmRelatoriosCFinan.rpDispFinancObsPrint(Sender: TObject);
begin
  //inherited;
   qryObsDispFinanc.Close;
   qryObsDispFinanc.ParamByName('CodDocumento').Value:=qryDispFinanc.FieldByName('CODDOCUMENTO').Value;
   qryObsDispFinanc.Open;
   rpDispFinancObs.Text:=qryObsDispFinanc.FieldByName('OBS').Value;
   qryObsDispFinanc.Close;
end;

//-----------------------------------
// Início Métodos do ConferDocRegular
//-----------------------------------

procedure TdtmRelatoriosCFinan.grpbIDRelacionaAfterPrint(
  Sender: TObject);
begin
   grpbFlgNI.Visible:=False;
end;

procedure TdtmRelatoriosCFinan.grpbFlgNIAfterPrint(Sender: TObject);
begin
   grpbFlgNI.Visible:=True;

   if qryConferDocRegular.FieldByName('FLGNI').AsString='I' then
      lblTipoDoc.Caption:='Regularizados'
   else
      lblTipoDoc.Caption:='Relacionados';

   lblTipoDoc.Visible:=True;
end;

procedure TdtmRelatoriosCFinan.ppDetailBand12AfterPrint(Sender: TObject);
begin
   lblTipoDoc.Visible:=False;
end;

//--------------------------------
// Fim Métodos do ConferDocRegular
//--------------------------------



end.


