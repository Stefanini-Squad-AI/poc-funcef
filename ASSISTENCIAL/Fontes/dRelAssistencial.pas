unit dRelAssistencial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, URegra,
  ppStrtch, ppSubRpt, ppVar, ppRelatv, ppDBPipe, ppModule, raCodMod;

type
  TdtmRelAssistencial = class(TdtmReports)
    pplRelaMensPagMes: TppBDEPipeline;
    dsRelaMensPagMes: TwwDataSource;
    qryRelaMensPagMes: TwwQuery;
    rpRelaMensPagMes: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppCalc1: TppSystemVariable;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppCalc2: TppSystemVariable;
    rpRelaMensPagMesLabel1: TppLabel;
    rpRelaMensPagMesLabel2: TppLabel;
    rpRelaMensPagMesLabel4: TppLabel;
    rpRelaMensPagMesLabel5: TppLabel;
    rpRelaMensPagMesLabel6: TppLabel;
    rpRelaMensPagMesLabel7: TppLabel;
    rpRelaMensPagMesLabel8: TppLabel;
    rpRelaMensPagMesLine1: TppLine;
    rpRelaMensPagMesLabel9: TppLabel;
    rpRelaMensPagMesLabel10: TppLabel;
    rpRelaMensPagMesLabel11: TppLabel;
    rpRelaMensPagMesDBText1: TppDBText;
    rpRelaMensPagMesDBText2: TppDBText;
    rpRelaMensPagMesDBText3: TppDBText;
    rpRelaMensPagMesDBText4: TppDBText;
    rpRelaMensPagMesDBText5: TppDBText;
    rpRelaMensPagMesDBText6: TppDBText;
    rpRelaMensPagMesDBText7: TppDBText;
    rpRelaMensPagMesDBCalc1: TppDBCalc;
    rpRelaMensPagMesDBCalc2: TppDBCalc;
    rpRelaMensPagMesDBCalc3: TppDBCalc;
    qryRelaCalcContribAss: TwwQuery;
    dsRelaCalcContribAss: TwwDataSource;
    pplRelaCalcContribAss: TppBDEPipeline;
    rpRelaCalcContribAss: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel18: TppLabel;
    bndDetalheCalcContrib: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppCalc5: TppSystemVariable;
    ppLabel20: TppLabel;
    ppCalc6: TppSystemVariable;
    rpRelaCalcContribAssLabel4: TppLabel;
    dbValor: TppDBText;
    rpRelaCalcContribAssDBText7: TppDBText;
    rpRelaCalcContribAssDBText8: TppDBText;
    rpRelaCalcContribAssDBText2: TppDBText;
    rpRelaCalcContribAssLabel12: TppLabel;
    rpRelaCalcContribAssDBText10: TppDBText;
    rpRelaCalcContribAssLabel13: TppLabel;
    rpRelaCalcContribAssDBCalc2: TppDBCalc;
    rpRelaMensPagMesDBText8: TppDBText;
    rpRelaMensPagMesDBText9: TppDBText;
    rpRelaMensPagMesLabel3: TppLabel;
    rpRelaMensPagMesDBText10: TppDBText;
    rpRelaMensPagMesLine2: TppLine;
    qryRelaQuantBenefSit: TwwQuery;
    dsRelaQuantBenefSit: TwwDataSource;
    pplRelaQuantBenefSit: TppBDEPipeline;
    RptSegurados: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppCalc3: TppSystemVariable;
    ppLine4: TppLine;
    ppLabel6: TppLabel;
    ppCalc4: TppSystemVariable;
    rpRelaQuantBenefGrpDBText4: TppDBText;
    rpRelaQuantBenefGrpDBText3: TppDBText;
    rpRelaQuantBenefGrpDBText2: TppDBText;
    rpRelaQuantBenefGrpLabel3: TppLabel;
    rpRelaQuantBenefGrpDBCalc2: TppDBCalc;
    rpRelaQuantBenefGrpDBText1: TppDBText;
    lbmes: TppLabel;
    rpRelaQuantBenefGrpLabel4: TppLabel;
    rpRelaCalcContribAssDBText6: TppDBText;
    rpRelaCalcContribAssDBCalc4: TppDBCalc;
    rpRelaCalcContribAssLabel2: TppLabel;
    ppTabSaude: TppBDEPipeline;
    dsTabSaude: TwwDataSource;
    qryTabSaude: TwwQuery;
    rpTabSaude: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLine3: TppLine;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppCalc7: TppSystemVariable;
    ppLine5: TppLine;
    ppLabel9: TppLabel;
    ppCalc8: TppSystemVariable;
    rpTabSaudeDBText1: TppDBText;
    rpTabSaudeDBText2: TppDBText;
    rpTabSaudeLabel1: TppLabel;
    rpTabSaudeDBText3: TppDBText;
    rpTabSaudeLabel2: TppLabel;
    rpTabSaudeDBText4: TppDBText;
    rpTabSaudeLabel3: TppLabel;
    regraContrib: TRegra;
    ppQuantPlanoSaude: TppBDEPipeline;
    dsQuantPlanoSaude: TwwDataSource;
    qryQuantPlanoSaude: TwwQuery;
    rpQuantPlanoSaude: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel13: TppLabel;
    ppLine10: TppLine;
    ppLabel14: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppFooterBand6: TppFooterBand;
    ppCalc11: TppSystemVariable;
    ppLine11: TppLine;
    ppLabel15: TppLabel;
    ppCalc12: TppSystemVariable;
    rpQuantPlanoSaudeLabel1: TppLabel;
    rpQuantPlanoSaudeDBText1: TppDBText;
    rpQuantPlanoSaudeLine1: TppLine;
    rpQuantPlanoSaudeLabel2: TppLabel;
    rpQuantPlanoSaudeLabel3: TppLabel;
    rpQuantPlanoSaudeLabel4: TppLabel;
    rpQuantPlanoSaudeLabel5: TppLabel;
    rpQuantPlanoSaudeDBText2: TppDBText;
    rpQuantPlanoSaudeDBText3: TppDBText;
    rpQuantPlanoSaudeDBText4: TppDBText;
    rpQuantPlanoSaudeLine3: TppLine;
    rpQuantPlanoSaudeLabel6: TppLabel;
    rpQuantPlanoSaudeLabel7: TppLabel;
    rpQuantPlanoSaudeLabel9: TppLabel;
    rpQuantPlanoSaudeLine2: TppLine;
    rpQuantPlanoSaudeDBText5: TppDBText;
    rpQuantPlanoSaudeDBText6: TppDBText;
    rpQuantPlanoSaudeDBText7: TppDBText;
    rpQuantPlanoSaudeLabel10: TppLabel;
    rpQuantPlanoSaudeDBText8: TppDBText;
    rpQuantPlanoSaudeLabel11: TppLabel;
    QuantTotal: TppDBText;
    rpQuantPlanoSaudeDBText10: TppDBText;
    rpQuantPlanoSaudeLabel12: TppLabel;
    rpQuantPlanoSaudeLabel13: TppLabel;
    rpQuantPlanoSaudeDBText11: TppDBText;
    rpQuantPlanoSaudeLine4: TppLine;
    rpQuantPlanoSaudeLabel14: TppLabel;
    rpQuantPlanoSaudeSummaryBand1: TppSummaryBand;
    SomaTitSerpros: TppDBCalc;
    rpQuantPlanoSaudeLine5: TppLine;
    SomaDepSerpros: TppDBCalc;
    SomaTotSerpros: TppDBCalc;
    SomaTitSerpro: TppDBCalc;
    SomaDepSerpro: TppDBCalc;
    SomaTotSerpro: TppDBCalc;
    SomaAssistidos: TppDBCalc;
    SomaTotal: TppDBCalc;
    rpQuantPlanoSaudeDBCalc6: TppDBCalc;
    rpQuantPlanoSaudeDBCalc7: TppDBCalc;
    rpQuantPlanoSaudeLabel15: TppLabel;
    rpQuantPlanoSaudeLine6: TppLine;
    PercentTitSerpros: TppVariable;
    PercentDepSerpros: TppVariable;
    PercentTotSerpros: TppVariable;
    PercentTitSerpro: TppVariable;
    PercentTotSerpro: TppVariable;
    PercentDepSerpro: TppVariable;
    PercentGeral: TppVariable;
    PercentAssistidos: TppVariable;
    rpQuantPlanoSaudeLabel16: TppLabel;
    qryprodassistencial: TwwQuery;
    ppprodassistencial: TppBDEPipeline;
    dsprodassistencial: TwwDataSource;
    rpprodassistencial: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel16: TppLabel;
    ppLine12: TppLine;
    ppLabel17: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppFooterBand7: TppFooterBand;
    ppCalc13: TppSystemVariable;
    ppLine13: TppLine;
    ppLabel21: TppLabel;
    ppCalc14: TppSystemVariable;
    rpprodassistencialDBText1: TppDBText;
    rpprodassistencialLabel1: TppLabel;
    rpprodassistencialDBText2: TppDBText;
    rpprodassistencialLabel2: TppLabel;
    rpprodassistencialDBText3: TppDBText;
    rpprodassistencialLabel3: TppLabel;
    rpprodassistencialLine1: TppLine;
    qryprodassistencialsint: TwwQuery;
    ppassistencialsint: TppBDEPipeline;
    rpprodassistenciasint: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel22: TppLabel;
    ppLine14: TppLine;
    ppLabel23: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppFooterBand8: TppFooterBand;
    ppCalc15: TppSystemVariable;
    ppLine15: TppLine;
    ppLabel24: TppLabel;
    ppCalc16: TppSystemVariable;
    dsprodassistencialsint: TwwDataSource;
    rpprodassistenciasintLabel1: TppLabel;
    rpprodassistenciasintLabel2: TppLabel;
    rpprodassistenciasintDBText1: TppDBText;
    rpprodassistenciasintDBText2: TppDBText;
    ppPlanassAnalit: TppBDEPipeline;
    rpPlanassAnalit: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel25: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppFooterBand9: TppFooterBand;
    ppCalc17: TppSystemVariable;
    ppLine17: TppLine;
    ppLabel27: TppLabel;
    ppCalc18: TppSystemVariable;
    dsPlanassAnalit: TwwDataSource;
    qryPlanassAnalit: TwwQuery;
    rpPlanassAnalitLabel1: TppLabel;
    rpPlanassAnalitLabel2: TppLabel;
    rpPlanassAnalitLabel3: TppLabel;
    rpPlanassAnalitLabel4: TppLabel;
    rpPlanassAnalitDBText1: TppDBText;
    rpPlanassAnalitLine1: TppLine;
    rpPlanassAnalitDBText2: TppDBText;
    rpPlanassAnalitDBText3: TppDBText;
    rpPlanassAnalitDBText4: TppDBText;
    rpPlanassAnalitLine2: TppLine;
    ppplanassisint: TppBDEPipeline;
    rpplanasssint: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppDetailBand10: TppDetailBand;
    ppFooterBand10: TppFooterBand;
    ppCalc19: TppSystemVariable;
    ppLine18: TppLine;
    ppLabel30: TppLabel;
    ppCalc20: TppSystemVariable;
    dsplanasssint: TwwDataSource;
    qryplanasssint: TwwQuery;
    rpplanasssintLabel1: TppLabel;
    rpplanasssintLine1: TppLine;
    rpplanasssintDBText1: TppDBText;
    rpplanasssintLine2: TppLine;
    qryapurainscritos: TwwQuery;
    dsapurainscritos: TwwDataSource;
    ppapurainscritos: TppBDEPipeline;
    rpapurainscritos: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppLabel31: TppLabel;
    ppDetailBand11: TppDetailBand;
    insctit: TppDBText;
    exctit: TppDBText;
    inscdep: TppDBText;
    excdep: TppDBText;
    totalinc: TppDBText;
    totaldep: TppDBText;
    periodos: TppDBText;
    ppFooterBand11: TppFooterBand;
    ppCalc21: TppSystemVariable;
    ppLine16: TppLine;
    ppLabel32: TppLabel;
    ppCalc22: TppSystemVariable;
    rpapurainscritosGroup1: TppGroup;
    rpapurainscritosGroupHeaderBand1: TppGroupHeaderBand;
    rpapurainscritosLine2: TppLine;
    rpapurainscritosLabel1: TppLabel;
    rpapurainscritosDBText1: TppDBText;
    rpapurainscritosLabel3: TppLabel;
    rpapurainscritosLabel4: TppLabel;
    rpapurainscritosLabel5: TppLabel;
    rpapurainscritosLabel6: TppLabel;
    rpapurainscritosLabel7: TppLabel;
    rpapurainscritosLabel8: TppLabel;
    rpapurainscritosLabel9: TppLabel;
    rpapurainscritosLabel10: TppLabel;
    rpapurainscritosLabel2: TppLabel;
    rpapurainscritosLabel11: TppLabel;
    rpapurainscritosGroupFooterBand1: TppGroupFooterBand;
    qryempresa: TwwQuery;
    dsempresa: TwwDataSource;
    ppempresa: TppBDEPipeline;
    acumulado: TppLabel;
    rpapurainscritosLabel12: TppLabel;
    rpapurainscritosShape1: TppShape;
    rpapurainscritosShape3: TppShape;
    rpapurainscritosShape4: TppShape;
    rpapurainscritosDBText2: TppDBText;
    ppContrib: TppBDEPipeline;
    dsContrib: TwwDataSource;
    qryContrib: TwwQuery;
    rpContrib: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel10: TppLabel;
    ppLine8: TppLine;
    rpContribLabel1: TppLabel;
    rpContribLabel2: TppLabel;
    ppDetailBand5: TppDetailBand;
    rpContribDBText1: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppCalc9: TppSystemVariable;
    ppLine9: TppLine;
    ppLabel12: TppLabel;
    ppCalc10: TppSystemVariable;
    rpContribDBText2: TppDBText;
    ppdivergerecebimento: TppBDEPipeline;
    rpdivergerecebimento: TppReport;
    ppHeaderBand12: TppHeaderBand;
    Titulo: TppLabel;
    rpdivergerecebimentoLine7: TppLine;
    rpdivergerecebimentoLabel13: TppLabel;
    rpdivergerecebimentoDBText6: TppDBText;
    ppDetailBand12: TppDetailBand;
    rpdivergerecebimentoDBText9: TppDBText;
    rpdivergerecebimentoDBText10: TppDBText;
    rpdivergerecebimentoDBText13: TppDBText;
    rpdivergerecebimentoDBText14: TppDBText;
    rpdivergerecebimentoDBText15: TppDBText;
    rpdivergerecebimentoDBText16: TppDBText;
    rpdivergerecebimentoSubReport1: TppSubReport;
    rpdivergerecebimentoChildReport1: TppChildReport;
    rpdivergerecebimentoChildReport1TitleBand1: TppTitleBand;
    rpdivergerecebimentoChildReport1Label1: TppLabel;
    rpdivergerecebimentoChildReport1DetailBand1: TppDetailBand;
    rpdivergerecebimentoChildReport1DBText1: TppDBText;
    rpdivergerecebimentoChildReport1DBText2: TppDBText;
    rpdivergerecebimentoChildReport1SummaryBand1: TppSummaryBand;
    rpdivergerecebimentoChildReport1Label2: TppLabel;
    totalAlterador: TppDBCalc;
    rpdivergerecebimentoDBText17: TppDBText;
    rpdivergerecebimentoDBText18: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppCalc23: TppSystemVariable;
    ppLine20: TppLine;
    ppLabel35: TppLabel;
    ppCalc24: TppSystemVariable;
    rpdivergerecebimentoSummaryBand1: TppSummaryBand;
    rpdivergerecebimentoShape1: TppShape;
    rpdivergerecebimentoLabel1: TppLabel;
    rpdivergerecebimentoDBCalc7: TppDBCalc;
    rpdivergerecebimentoDBCalc8: TppDBCalc;
    rpdivergerecebimentoLabel17: TppLabel;
    rpdivergerecebimentoLabel18: TppLabel;
    rpdivergerecebimentoDBCalc12: TppDBCalc;
    rpdivergerecebimentoLabel19: TppLabel;
    Alteradores: TppLabel;
    totalt: TppLabel;
    rpdivergerecebimentoGroup1: TppGroup;
    rpdivergerecebimentoGroupHeaderBand1: TppGroupHeaderBand;
    rpdivergerecebimentoLabel2: TppLabel;
    rpdivergerecebimentoDBText8: TppDBText;
    rpdivergerecebimentoGroupFooterBand1: TppGroupFooterBand;
    rpdivergerecebimentoLabel16: TppLabel;
    rpdivergerecebimentoDBCalc5: TppDBCalc;
    rpdivergerecebimentoDBCalc6: TppDBCalc;
    rpdivergerecebimentoLine4: TppLine;
    rpdivergerecebimentoLine6: TppLine;
    rpdivergerecebimentoDBCalc11: TppDBCalc;
    rpdivergerecebimentoGroup2: TppGroup;
    rpdivergerecebimentoGroupHeaderBand2: TppGroupHeaderBand;
    rpdivergerecebimentoLabel3: TppLabel;
    rpdivergerecebimentoDBText7: TppDBText;
    rpdivergerecebimentoGroupFooterBand2: TppGroupFooterBand;
    rpdivergerecebimentoLabel15: TppLabel;
    rpdivergerecebimentoDBCalc3: TppDBCalc;
    rpdivergerecebimentoDBCalc4: TppDBCalc;
    rpdivergerecebimentoLine3: TppLine;
    rpdivergerecebimentoDBCalc10: TppDBCalc;
    rpdivergerecebimentoGroup3: TppGroup;
    rpdivergerecebimentoGroupHeaderBand3: TppGroupHeaderBand;
    rpdivergerecebimentoDBText11: TppDBText;
    rpdivergerecebimentoLabel5: TppLabel;
    rpdivergerecebimentoLabel6: TppLabel;
    rpdivergerecebimentoLabel7: TppLabel;
    rpdivergerecebimentoLabel8: TppLabel;
    rpdivergerecebimentoLabel9: TppLabel;
    rpdivergerecebimentoLabel10: TppLabel;
    rpdivergerecebimentoLabel11: TppLabel;
    rpdivergerecebimentoLabel12: TppLabel;
    rpdivergerecebimentoLine1: TppLine;
    rpdivergerecebimentoLine2: TppLine;
    rpdivergerecebimentoLabel21: TppLabel;
    rpdivergerecebimentoGroupFooterBand3: TppGroupFooterBand;
    rpdivergerecebimentoDBCalc1: TppDBCalc;
    rpdivergerecebimentoDBCalc2: TppDBCalc;
    rpdivergerecebimentoLabel14: TppLabel;
    rpdivergerecebimentoLine5: TppLine;
    rpdivergerecebimentoDBCalc9: TppDBCalc;
    qrydivergerecebimento: TwwQuery;
    dsdivergerecebimento: TwwDataSource;
    SubQueryAlterador: TwwQuery;
    dsSubQuery: TwwDataSource;
    ppSubQuery: TppBDEPipeline;
    ppHistFinanc: TppBDEPipeline;
    dsHistFinanc: TwwDataSource;
    qryHistFinanc: TwwQuery;
    rpHistFinanc: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppLabel33: TppLabel;
    ppLine19: TppLine;
    ppDetailBand13: TppDetailBand;
    ppFooterBand13: TppFooterBand;
    ppCalc25: TppSystemVariable;
    ppLine21: TppLine;
    ppLabel36: TppLabel;
    ppCalc26: TppSystemVariable;
    rpHistFinancLabel1: TppLabel;
    rpHistFinancDBText2: TppDBText;
    rpHistFinancLabel2: TppLabel;
    rpHistFinancDBText3: TppDBText;
    rpHistFinancLabel3: TppLabel;
    rpHistFinancDBText4: TppDBText;
    rpHistFinancLine1: TppLine;
    rpHistFinancDBText1: TppDBText;
    rpHistFinancLabel4: TppLabel;
    rpHistFinancDBText5: TppDBText;
    rpHistFinancLabel5: TppLabel;
    rpHistFinancDBText6: TppDBText;
    rpHistFinancLabel6: TppLabel;
    rpHistFinancDBText7: TppDBText;
    rpHistFinancLabel7: TppLabel;
    rpHistFinancDBText8: TppDBText;
    rpHistFinancLabel8: TppLabel;
    rpHistFinancDBText9: TppDBText;
    rpHistFinancLabel9: TppLabel;
    rpHistFinancDBText10: TppDBText;
    rpHistFinancLabel10: TppLabel;
    rpHistFinancDBText11: TppDBText;
    rpHistFinancLabel11: TppLabel;
    rpHistFinancDBText12: TppDBText;
    rpHistFinancLabel12: TppLabel;
    rpHistFinancDBText13: TppDBText;
    rpHistFinancLabel13: TppLabel;
    rpHistFinancDBText14: TppDBText;
    rpHistFinancLabel14: TppLabel;
    rpHistFinancLine2: TppLine;
    rpHistFinancLabel15: TppLabel;
    rpHistFinancLabel16: TppLabel;
    rpHistFinancLine3: TppLine;
    rpHistFinancLabel17: TppLabel;
    rpHistFinancLabel18: TppLabel;
    rpHistFinancDBText15: TppDBText;
    rpHistFinancDBText16: TppDBText;
    rpHistFinancLabel19: TppLabel;
    rpHistFinancLabel20: TppLabel;
    rpHistFinancDBText17: TppDBText;
    rpQuantPlanoSaudeLabel8: TppLabel;
    ppInadimplentes: TppBDEPipeline;
    dsInadimplentes: TwwDataSource;
    qryInadimplentes: TwwQuery;
    rpInadimplentes: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppLabel37: TppLabel;
    ppLine22: TppLine;
    ppDetailBand14: TppDetailBand;
    ppFooterBand14: TppFooterBand;
    ppCalc27: TppSystemVariable;
    ppLine23: TppLine;
    ppLabel39: TppLabel;
    ppCalc28: TppSystemVariable;
    rpInadimplentesDBText1: TppDBText;
    rpInadimplentesDBText2: TppDBText;
    rpInadimplentesDBText3: TppDBText;
    rpInadimplentesDBText4: TppDBText;
    rpInadimplentesDBText5: TppDBText;
    rpInadimplentesLabel1: TppLabel;
    rpInadimplentesLabel2: TppLabel;
    rpInadimplentesLabel3: TppLabel;
    rpInadimplentesLabel4: TppLabel;
    rpInadimplentesDBText6: TppDBText;
    rpInadimplentesLabel5: TppLabel;
    rpInadimplentesDBText7: TppDBText;
    rpInadimplentesLabel6: TppLabel;
    qryContribNOMECONTRIB: TStringField;
    qryContribVALORCONTRIB: TStringField;
    rpRelaCalcContribAssLabel5: TppLabel;
    rpRelaCalcContribAssLabel6: TppLabel;
    lblPatro: TppLabel;
    ppLine6: TppLine;
    rpRelaCalcContribAssDBText1: TppDBText;
    rpRelaCalcContribAssDBText3: TppDBText;
    rpRelaCalcContribAssLine3: TppLine;
    LineSomaPatro: TppLine;
    rpRelaCalcContribAssDBText9: TppDBText;
    rpRelaCalcContribAssLabel11: TppLabel;
    dbSomaValorPatro: TppDBCalc;
    dbValorDescontoPatro: TppDBCalc;
    qryRelTotalContrib: TwwQuery;
    dsRelTotalContrib: TwwDataSource;
    pplRelTotalContrib: TppBDEPipeline;
    rpRelTotalContrib: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppLabel40: TppLabel;
    ppLabel42: TppLabel;
    ppDBText1: TppDBText;
    bndDetalheTotalCalcContrib: TppDetailBand;
    RodapeRelTotalContrib: TppFooterBand;
    ppCalc29: TppSystemVariable;
    ppLabel43: TppLabel;
    ppCalc30: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    CabecalhoGruporpPATRORelTotalContrib: TppGroupFooterBand;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBText2: TppDBText;
    ppLabel46: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLabel47: TppLabel;
    rpRelaCalcContribAssGroup1: TppGroup;
    rpRelaCalcContribAssGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel48: TppLabel;
    rpRelaCalcContribAssGroupFooterBand1: TppGroupFooterBand;
    rpRelaCalcContribAssLine1: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel49: TppLabel;
    ppDBText5: TppDBText;
    ppLabel50: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppLabel51: TppLabel;
    dbValorPatroTotal: TppDBCalc;
    lblPatroTotal: TppLabel;
    qryRelDepenMaioridade: TwwQuery;
    dsRelDepenMaioridade: TwwDataSource;
    pplRelDepenMaioridade: TppBDEPipeline;
    rpRelDepenMaioridade: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLabel52: TppLabel;
    ppDetailBand16: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    RodapeDepenMaioridade: TppFooterBand;
    ppCalc31: TppSystemVariable;
    ppLabel56: TppLabel;
    ppCalc32: TppSystemVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText11: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel64: TppLabel;
    ppLine24: TppLine;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText19: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    lblGrupoMaioridade: TppLabel;
    rpRelDepenMaioridadeLabel1: TppLabel;
    lbDependencia: TppLabel;
    rpRelDepenMaioridadeLabel2: TppLabel;
    lbQtdTitular: TppLabel;
    lbQtdPatro: TppLabel;
    lblQtdTotal: TppLabel;
    qryRelGrauDependencia: TwwQuery;
    dsRelGrauDependencia: TwwDataSource;
    pplRelGrauDependencia: TppBDEPipeline;
    rpRelGrauDependencia: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppLabel54: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppDBText6: TppDBText;
    ppLabel57: TppLabel;
    ppFooterBand15: TppFooterBand;
    ppCalc33: TppSystemVariable;
    ppLabel59: TppLabel;
    ppCalc34: TppSystemVariable;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText13: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText18: TppDBText;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLine7: TppLine;
    ppLabel70: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    rpRelGrauDependenciaDBText1: TppDBText;
    rpRelaCalcContribAssLabel9: TppLabel;
    rpRelaCalcContribAssLabel3: TppLabel;
    rpRelaCalcContribAssDBText5: TppDBText;
    lbQtdTitularCalc: TppLabel;
    lblvlQtdDescontoPatro: TppLabel;
    lblQtdDescontoPatro: TppLabel;
    lblValorDescontoPatro: TppLabel;
    rpRelaCalcContribAssLine5: TppLine;
    dbValorPatro: TppDBText;
    HeaderGrupoPRODUTO: TppGroupHeaderBand;
    rpRelaCalcContribAssSummaryBand: TppSummaryBand;
    rpRelTotalContribSummaryBand: TppSummaryBand;
    rpRelDepenMaioridadeSummaryBand1: TppSummaryBand;
    rpRelGrauDependenciaSummaryBand: TppSummaryBand;
    rpRelaCalcContribAssDBText15: TppDBText;
    rpRelaCalcContribAssDBText11: TppDBText;
    rpRelaCalcContribAssDBText14: TppDBText;
    LblSalario: TppLabel;
    dbSalario: TppDBText;
    rpRelaCalcContribAssDBText4: TppDBText;
    rpRelaCalcContribAssLabel1: TppLabel;
    qryRelRubricaAss: TwwQuery;
    dsRelRubricaAss: TwwDataSource;
    pplRelRubricaAss: TppBDEPipeline;
    rpRelRubricaAss: TppReport;
    ppHeaderBand19: TppHeaderBand;
    ppLabel69: TppLabel;
    ppLine27: TppLine;
    ppDetailBand17: TppDetailBand;
    ppFooterBand17: TppFooterBand;
    ppCalc37: TppSystemVariable;
    ppLine28: TppLine;
    ppCalc38: TppSystemVariable;
    rpRelRubricaAssLabel2: TppLabel;
    rpRelRubricaAssLine1: TppLine;
    rpRelRubricaAssLine2: TppLine;
    rpRelRubricaAssLabel1: TppLabel;
    rpRelRubricaAssLabel3: TppLabel;
    rpRelRubricaAssLabel4: TppLabel;
    rpRelRubricaAssLabel5: TppLabel;
    rpRelRubricaAssLabel6: TppLabel;
    rpRelRubricaAssLabel7: TppLabel;
    rpRelRubricaAssLabel8: TppLabel;
    qryRelRubricaAssCODDEPTO: TStringField;
    qryRelRubricaAssCODREDUZIDO: TStringField;
    qryRelRubricaAssCODPROVDESC: TStringField;
    qryRelRubricaAssVALOR: TFloatField;
    qryRelRubricaAssVLRPATRO: TFloatField;
    qryRelRubricaAssINSCRICAONUMERO: TFloatField;
    qryRelRubricaAssNUMSEQUENCIA: TFloatField;
    qryRelRubricaAssDEPENDENTE: TStringField;
    qryRelRubricaAssTITULAR: TStringField;
    rpRelRubricaAssDBText1: TppDBText;
    rpRelRubricaAssDBText2: TppDBText;
    rpRelRubricaAssDBText3: TppDBText;
    rpRelRubricaAssDBText4: TppDBText;
    rpRelRubricaAssDBText5: TppDBText;
    rpRelRubricaAssDBText6: TppDBText;
    rpRelRubricaAssDBCalc1: TppDBCalc;
    rpRelRubricaAssDBCalc2: TppDBCalc;
    rpRelRubricaAssLine3: TppLine;
    rpRelRubricaAssLabel9: TppLabel;
    rpRelRubricaAssLabel10: TppLabel;
    rpRelRubricaAssCalc1: TppVariable;
    rpRelRubricaAssCalc2: TppVariable;
    rpRelRubricaAssLine4: TppLine;
    rpRelRubricaAssLine5: TppLine;
    rpRelRubricaAssCalc3: TppVariable;
    rpRelRubricaAssSummaryBand1: TppSummaryBand;
    rpRelRubricaAssDBCalc3: TppDBCalc;
    rpRelRubricaAssDBCalc4: TppDBCalc;
    rpRelRubricaAssLabel11: TppLabel;
    rpRelRubricaAssLabel12: TppLabel;
    rpRelRubricaAssCalc4: TppVariable;
    rpRelRubricaAssCalc5: TppVariable;
    rpRelRubricaAssLine6: TppLine;
    rpRelRubricaAssCalc6: TppVariable;
    rpRelRubricaAssLine7: TppLine;
    rpRelRubricaAssLabel13: TppLabel;
    rpRelRubricaAssLabel14: TppLabel;
    rpRelRubricaAssCalc7: TppVariable;
    rpRelRubricaAssCalc8: TppVariable;
    rpRelRubricaAssLabel15: TppLabel;
    rpRelRubricaAssLabel16: TppLabel;
    rpRelRubricaAssCalc9: TppVariable;
    rpRelRubricaAssCalc10: TppVariable;
    rpRelRubricaAssLabel17: TppLabel;
    rpRelRubricaAssLabel18: TppLabel;
    rpRelRubricaAssCalc11: TppVariable;
    rpRelRubricaAssCalc12: TppVariable;
    rpRelRubricaAssLabel20: TppLabel;
    qryRelConfFatura: TwwQuery;
    dsRelConfFatura: TwwDataSource;
    pplRelConfFatura: TppBDEPipeline;
    rpRelConfFatura: TppReport;
    ppHeaderBand18: TppHeaderBand;
    ppLabel58: TppLabel;
    ppLabel63: TppLabel;
    ppDBText7: TppDBText;
    ppDetailBand3: TppDetailBand;
    ppDBText12: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppFooterBand16: TppFooterBand;
    ppCalc35: TppSystemVariable;
    ppLabel71: TppLabel;
    ppCalc36: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppDBText25: TppDBText;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLine25: TppLine;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel77: TppLabel;
    ppDBText26: TppDBText;
    ppLabel78: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLabel79: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppLabel86: TppLabel;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppDBCalc6: TppDBCalc;
    ppLine26: TppLine;
    ppLine29: TppLine;
    ppDBCalc7: TppDBCalc;
    ppLine30: TppLine;
    qryRelBoletos: TwwQuery;
    dsRelBoletos: TwwDataSource;
    ppRelBoletos: TppBDEPipeline;
    rpRelBoletos: TppReport;
    qryRelBoletosINSCRICAONUMERO: TFloatField;
    qryRelBoletosCODDOCUMENTO: TFloatField;
    qryRelBoletosLOCAL: TStringField;
    qryRelBoletosNOME: TStringField;
    qryRelBoletosVALOR: TFloatField;
    qryRelBoletosCODPORTFORMA: TFloatField;
    qryRelBoletosDESCRICAO: TStringField;
    rpRelBoletosHeaderBand1: TppHeaderBand;
    rpRelBoletosDetailBand1: TppDetailBand;
    rpRelBoletosFooterBand1: TppFooterBand;
    rpRelBoletosLabel1: TppLabel;
    rpRelBoletosLabel2: TppLabel;
    rpRelBoletosLine1: TppLine;
    rpRelBoletosLine2: TppLine;
    rpRelBoletosLabel3: TppLabel;
    rpRelBoletosLabel4: TppLabel;
    rpRelBoletosLabel5: TppLabel;
    rpRelBoletosLabel6: TppLabel;
    rpRelBoletosLabel8: TppLabel;
    rplblPlano: TppLabel;
    rpRelBoletosDBText1: TppDBText;
    rpRelBoletosDBText2: TppDBText;
    rpRelBoletosDBText3: TppDBText;
    rpRelBoletosDBText4: TppDBText;
    rpRelBoletosDBText5: TppDBText;
    rpRelBoletosCalc1: TppSystemVariable;
    rpRelBoletosLine3: TppLine;
    rpRelBoletosCalc2: TppSystemVariable;
    rpRelBoletosLabel7: TppLabel;
    rpRelBoletosDBCalc1: TppDBCalc;
    rpRelBoletosLabel10: TppLabel;
    rpRelBoletosDBCalc2: TppDBCalc;
    rpRelBoletosLabel11: TppLabel;
    rpRelBoletosLine4: TppLine;
    rpRelBoletosSummaryBand1: TppSummaryBand;
    rpRelBoletosDBCalc3: TppDBCalc;
    rpRelBoletosLabel12: TppLabel;
    rpRelBoletosDBCalc4: TppDBCalc;
    rpRelBoletosLabel13: TppLabel;
    rpRelBoletosLine5: TppLine;
    rpRelBoletosLine6: TppLine;
    qryRelBenSaude: TwwQuery;
    dsRelBenSaude: TwwDataSource;
    ppRelBenSaude: TppBDEPipeline;
    rpRelBenSaude: TppReport;
    ppHeaderBand20: TppHeaderBand;
    ppLabel87: TppLabel;
    ppLabel89: TppLabel;
    ppDetailBand18: TppDetailBand;
    ppFooterBand18: TppFooterBand;
    ppCalc39: TppSystemVariable;
    ppLabel90: TppLabel;
    ppCalc40: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLine31: TppLine;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppDBText43: TppDBText;
    ppDBText49: TppDBText;
    rpRelBenSaudeLabel1: TppLabel;
    rpRelBenSaudeDBText1: TppDBText;
    rpRelBenSaudeLabel3: TppLabel;
    rpRelBenSaudeDBText2: TppDBText;
    ppDBText36: TppDBText;
    ppDBText40: TppDBText;
    rpRelBenSaudeLine1: TppLine;
    rpRelBenSaudeLabel2: TppLabel;
    rpRelBenSaudeLabel4: TppLabel;
    rpRelBenSaudeLabel5: TppLabel;
    rpRelBenSaudeLabel6: TppLabel;
    rpRelBenSaudeLabel7: TppLabel;
    rpRelBenSaudeCalc3: TppVariable;
    rpRelBenSaudeCalc4: TppVariable;
    rpRelBoletosDBText6: TppDBText;
    rpRelBoletosLabel14: TppLabel;
    qryRelBoletosNOSSONUMERO: TStringField;
    qryRelBenSaudeDEPENDENTE: TStringField;
    qryRelBenSaudeTITULAR: TStringField;
    qryRelBenSaudeRESPONSAVEL: TStringField;
    qryRelBenSaudeGRAU_DEPEN: TStringField;
    qryRelBenSaudePATROCINADORA: TStringField;
    qryRelBenSaudePRODUTO: TStringField;
    qryRelBenSaudeINSCRICAO: TFloatField;
    qryRelBenSaudeSITUACAO: TStringField;
    UpdCompEnvio: TUpdateSQL;
    qryCompEnvio: TwwQuery;
    dsCompEnvio: TwwDataSource;
    ppCompEnvio: TppBDEPipeline;
    rpCompEnvio: TppReport;
    ppHeaderBand21: TppHeaderBand;
    ppLabel88: TppLabel;
    ppLabel93: TppLabel;
    ppDetailBand19: TppDetailBand;
    ppFooterBand19: TppFooterBand;
    rpCompEnvioLabel95: TppLabel;
    ppSummaryBand3: TppSummaryBand;
    qryCompEnvioNUMDOC: TFloatField;
    qryCompEnvioCOD: TStringField;
    qryCompEnvioNOME: TStringField;
    qryCompEnvioDESCRICAO: TStringField;
    qryCompEnvioRUBRICA: TStringField;
    qryCompEnvioDATA: TDateTimeField;
    qryCompEnvioVALOR: TFloatField;
    qryCompEnvioMOTIVO: TStringField;
    qryCompEnvioINSCRICAONUMERO: TFloatField;
    qryCompEnvioNOSSONUMERO: TStringField;
    qryCompEnvioSITUACAO: TStringField;
    qryCompEnvioLOCAL: TStringField;
    rpCompEnvioLabel1: TppLabel;
    rpCompEnvioShape1: TppShape;
    rpCompEnvioLabel2: TppLabel;
    rpCompEnvioDBText1: TppDBText;
    rpCompEnvioDBText2: TppDBText;
    rpCompEnvioLabel3: TppLabel;
    rpCompEnvioLabel4: TppLabel;
    rpCompEnvioLabel5: TppLabel;
    rpCompEnvioLabel6: TppLabel;
    rpCompEnvioLabel7: TppLabel;
    rpCompEnvioLabel8: TppLabel;
    rpCompEnvioLabel9: TppLabel;
    rpCompEnvioLabel10: TppLabel;
    rpCompEnvioDBText3: TppDBText;
    rpCompEnvioDBText4: TppDBText;
    rpCompEnvioDBText5: TppDBText;
    rpCompEnvioDBText6: TppDBText;
    rpCompEnvioDBText7: TppDBText;
    rpCompEnvioDBText8: TppDBText;
    rpCompEnvioDBText9: TppDBText;
    rpCompEnvioDBText10: TppDBText;
    rpCompEnvioLine1: TppLine;
    rpCompEnvioLabel11: TppLabel;
    rpCompEnvioLabel12: TppLabel;
    rpCompEnvioLabel13: TppLabel;
    rpCompEnvioDBCalc1: TppDBCalc;
    rpCompEnvioDBCalc2: TppDBCalc;
    rpCompEnvioLine2: TppLine;
    rpCompEnvioLabel14: TppLabel;
    rpCompEnvioLabel15: TppLabel;
    rpCompEnviodrp: TppLabel;
    rpCompEnviovrp: TppLabel;
    rpCompEnvioLabel16: TppLabel;
    rpCompEnvioLabel17: TppLabel;
    rpCompEnvioddp: TppLabel;
    rpCompEnviovdp: TppLabel;
    rpCompEnvioLabel18: TppLabel;
    rpCompEnvioLabel19: TppLabel;
    rpCompEnviosdp: TppLabel;
    rpCompEnviovsp: TppLabel;
    rpCompEnvioLabel20: TppLabel;
    rpCompEnvioLabel21: TppLabel;
    rpCompEnvioLabel22: TppLabel;
    rpCompEnvioDBCalc3: TppDBCalc;
    rpCompEnvioDBCalc4: TppDBCalc;
    rpCompEnvioLine3: TppLine;
    rpCompEnvioLabel23: TppLabel;
    rpCompEnvioLabel24: TppLabel;
    rpCompEnviodrt: TppLabel;
    rpCompEnviovrt: TppLabel;
    rpCompEnvioLabel27: TppLabel;
    rpCompEnvioLabel28: TppLabel;
    rpCompEnvioddt: TppLabel;
    rpCompEnviovdt: TppLabel;
    rpCompEnvioLabel31: TppLabel;
    rpCompEnvioLabel32: TppLabel;
    rpCompEnviovst: TppLabel;
    rpCompEnviodst: TppLabel;
    rpRelBenSaudeCalc1: TppVariable;
    rpRelBenSaudeCalc2: TppVariable;
    ppCalc41: TppSystemVariable;
    ppCalc42: TppSystemVariable;
    rpBenefProvDBImage1: TppDBImage;
    rpBenefProvDBText10: TppDBText;
    rpBenefProvDBText12: TppDBText;
    rpBenefProvLabel2: TppLabel;
    rpBenefProvLabel3: TppLabel;
    rpBenefProvDBText11: TppDBText;
    ppFundacao: TppBDEPipeline;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    rptRecadastramentoDBImage1: TppDBImage;
    rptRecadastramentoDBText1: TppDBText;
    rptRecadastramentoDBText2: TppDBText;
    rptRecadastramentoDBText3: TppDBText;
    rptRecadastramentoDBText4: TppDBText;
    rptRecadastramentoDBText5: TppDBText;
    rptRecadastramentoDBText7: TppDBText;
    rptRecadastramentoDBText6: TppDBText;
    rptRecadastramentoLabel1: TppLabel;
    rptRecadastramentoDBText8: TppDBText;
    ppDBImage1: TppDBImage;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppLabel26: TppLabel;
    ppDBText44: TppDBText;
    ppDBImage2: TppDBImage;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppLabel53: TppLabel;
    ppDBText53: TppDBText;
    ppDBImage3: TppDBImage;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppLabel41: TppLabel;
    ppDBText61: TppDBText;
    ppDBImage4: TppDBImage;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppLabel5: TppLabel;
    ppDBText69: TppDBText;
    ppDBImage5: TppDBImage;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppLabel2: TppLabel;
    ppDBText77: TppDBText;
    ppDBImage6: TppDBImage;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppLabel55: TppLabel;
    ppDBText85: TppDBText;
    ppDBImage7: TppDBImage;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppLabel60: TppLabel;
    ppDBText93: TppDBText;
    ppDBImage8: TppDBImage;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppLabel94: TppLabel;
    ppDBText101: TppDBText;
    ppDBImage9: TppDBImage;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppLabel95: TppLabel;
    ppDBText109: TppDBText;
    ppDBImage10: TppDBImage;
    ppDBText110: TppDBText;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppDBText114: TppDBText;
    ppDBText115: TppDBText;
    ppDBText116: TppDBText;
    ppLabel96: TppLabel;
    ppDBText117: TppDBText;
    ppDBImage11: TppDBImage;
    ppDBText118: TppDBText;
    ppDBText119: TppDBText;
    ppDBText120: TppDBText;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    ppLabel34: TppLabel;
    ppDBText125: TppDBText;
    ppDBImage12: TppDBImage;
    ppDBText126: TppDBText;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppDBText129: TppDBText;
    ppDBText130: TppDBText;
    ppLabel38: TppLabel;
    ppDBText131: TppDBText;
    ppDBText132: TppDBText;
    ppDBText133: TppDBText;
    ppDBImage13: TppDBImage;
    ppDBText134: TppDBText;
    ppDBText135: TppDBText;
    ppDBText136: TppDBText;
    ppDBText137: TppDBText;
    ppDBText138: TppDBText;
    ppLabel97: TppLabel;
    ppDBText139: TppDBText;
    ppDBText140: TppDBText;
    ppDBText141: TppDBText;
    ppDBImage14: TppDBImage;
    ppDBText142: TppDBText;
    ppDBText143: TppDBText;
    ppDBText144: TppDBText;
    ppDBText145: TppDBText;
    ppLabel19: TppLabel;
    ppDBText146: TppDBText;
    ppDBText147: TppDBText;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
    ppDBImage15: TppDBImage;
    ppDBText150: TppDBText;
    ppDBText151: TppDBText;
    ppDBText152: TppDBText;
    ppDBText153: TppDBText;
    ppLabel11: TppLabel;
    ppDBText154: TppDBText;
    ppDBText155: TppDBText;
    ppDBText156: TppDBText;
    ppDBImage16: TppDBImage;
    ppDBText157: TppDBText;
    ppDBText158: TppDBText;
    ppDBText159: TppDBText;
    ppDBText160: TppDBText;
    ppLabel8: TppLabel;
    ppDBText161: TppDBText;
    ppDBText162: TppDBText;
    ppDBText163: TppDBText;
    ppDBText164: TppDBText;
    ppDBImage17: TppDBImage;
    ppDBText165: TppDBText;
    ppDBText166: TppDBText;
    ppDBText167: TppDBText;
    ppDBText168: TppDBText;
    ppLabel98: TppLabel;
    ppDBText169: TppDBText;
    ppDBText170: TppDBText;
    ppDBText171: TppDBText;
    ppDBText172: TppDBText;
    procedure rpRelaMensPagMesDBText7Print(Sender: TObject);
    procedure qryContribCalcFields(DataSet: TDataSet);
    procedure PercentTitSerprosPrint(Sender: TObject);
    procedure PercentDepSerprosPrint(Sender: TObject);
    procedure PercentTotSerprosPrint(Sender: TObject);
    procedure PercentTitSerproPrint(Sender: TObject);
    procedure PercentDepSerproPrint(Sender: TObject);
    procedure PercentTotSerproPrint(Sender: TObject);
    procedure PercentGeralPrint(Sender: TObject);
    procedure PercentAssistidosPrint(Sender: TObject);
    procedure qryapurainscritosBeforeOpen(DataSet: TDataSet);
    procedure ppDetailBand11BeforePrint(Sender: TObject);
    procedure rpapurainscritosGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure rpdivergerecebimentoChildReport1SummaryBand1AfterPrint(Sender: TObject);
    procedure rpdivergerecebimentoSummaryBand1BeforePrint(Sender: TObject);
    procedure bndDetalheCalcContribBeforePrint(Sender: TObject);
    procedure rpRelaCalcContribAssGroupHeaderBand3BeforePrint(
      Sender: TObject);
    procedure qryRelTotalContribBeforeOpen(DataSet: TDataSet);
    procedure lblPatroTotalPrint(Sender: TObject);
    procedure lblGrupoMaioridadePrint(Sender: TObject);
    procedure lbDependenciaPrint(Sender: TObject);
//    procedure bndDetalheTotalCalcContribBeforePrint(Sender: TObject);
    procedure rpRelTotalContribBeforePrint(Sender: TObject);
    procedure lbQtdTitularPrint(Sender: TObject);
    procedure lbQtdPatroPrint(Sender: TObject);
    procedure lblQtdTotalPrint(Sender: TObject);
    procedure qryRelGrauDependenciaBeforeOpen(DataSet: TDataSet);
    procedure rpRelaCalcContribAssBeforePrint(Sender: TObject);
    procedure HeaderGrupoPRODUTOBeforePrint(Sender: TObject);
    procedure lblQtdTotalCalcPrint(Sender: TObject);
    procedure rpRelaCalcContribAssSummaryBandBeforePrint(Sender: TObject);
    procedure rpRelTotalContribSummaryBandBeforePrint(Sender: TObject);
    procedure rpRelDepenMaioridadeSummaryBand1BeforePrint(Sender: TObject);
    procedure rpRelGrauDependenciaSummaryBandBeforePrint(Sender: TObject);
    procedure rpRelRubricaAssGroupHeaderBand2BeforePrint(Sender: TObject);
    procedure rpRelRubricaAssCalc2Calc(Sender: TObject);
    procedure ppDetailBand17AfterPrint(Sender: TObject);
    procedure rpRelRubricaAssGroupHeaderBand4BeforePrint(Sender: TObject);
    procedure ppDetailBand17BeforePrint(Sender: TObject);
    procedure rpRelRubricaAssGroupFooterBand2BeforePrint(Sender: TObject);
    procedure rpRelRubricaAssCalc5Calc(Sender: TObject);
    procedure qryRelRubricaAssBeforeOpen(DataSet: TDataSet);
    procedure rpRelRubricaAssSummaryBand1BeforeGenerate(Sender: TObject);
    procedure rpRelRubricaAssGroupFooterBand5BeforePrint(Sender: TObject);
    procedure rpRelBoletosGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure rpRelBoletosSummaryBand1BeforePrint(Sender: TObject);
    procedure qryRelBoletosBeforeOpen(DataSet: TDataSet);
    procedure ppGroupHeaderBand9BeforePrint(Sender: TObject);
    procedure ppDetailBand18BeforePrint(Sender: TObject);
    procedure rpRelBenSaudeGroupFooterBand2BeforePrint(Sender: TObject);
    procedure rpRelBenSaudeCalc3Calc(Sender: TObject);
    procedure rpRelBenSaudeCalc4Calc(Sender: TObject);
    procedure rpRelBenSaudeBeforePrint(Sender: TObject);
    procedure rpCompEnvioBeforePrint(Sender: TObject);
    procedure ppDetailBand19BeforePrint(Sender: TObject);
    procedure rpCompEnvioGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppSummaryBand3BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppDBTextTitularPrint(Sender: TObject);
  private
    { Private declarations }
    FGrauDependencia          : String;
    CEmp, CDep, GEmp, GDep,
    CtaESaude, CtaEDental,
    CtaDSaude, CtaDDental     : Integer;
    TEmp, TPat,
    VlrSaude, VlrDental       : Real;
    Liga                      : Boolean;
    vTitCP, vTitCG,
    vDepCP, vDepCG            : Integer;
    vDrp, vDrt,
    vDdp, vDdt,
    vDsp, vDst                : Integer;
    vVrp, vVrt,
    vVdp, vVdt,
    vVsp, vVst                : Real;
  public
    { Public declarations }
    vUltimo                   : Integer;
    property GrauDependencia: string read FGrauDependencia write FGraudependencia;
    function MostraParam(Form: string): boolean; OverRide;
  end;

var
  dtmRelAssistencial: TdtmRelAssistencial;
  acumulando, acumulandoOld : integer;
  Totalizador : double;
  Titular, TitularPatro: string;
  QtdTitular, QtdPatro, QtdTotal : Integer;
  bFim : Boolean;

implementation

{$R *.DFM}

Uses FParamRelaMensPagMes, FParamRelaCalcContribAss, FParamRelaQuantBenefSit,
     FParamRelQuantPlanoSaude, FParamRelTotalContrib, FParamRelDepenMaioridade,
     fParamRelGrauDependencia, FAguarde, FParamRelRubricaAss, FParamRelBoletos,
     FParamRelCompEnvio,FParamRelIncBenef;

function TdtmRelAssistencial.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     if trim(form) = '' then
     begin
       result := true;
       exit;
     end;
     if (AnsiUpperCase(Form) = 'FRMPARAMRELINCBENEF') then (* Segurados e Beneficiários *)
        frm := TfrmParamIncBenef.Create(Application)


     else if (AnsiUpperCase(Form) = 'FRMPARAMRELAMENSPAGMES') then
        frm := TfrmParamRelaMensPagMes.Create(Application)
     else if (AnsiUpperCase(Form) = 'FRMPARAMRELACALCCONTRIBASS') then
        frm := TfrmParamRelaCalcContribAss.Create(Application)
     else if (AnsiUpperCase(Form) = 'FRMPARAMRELAQUANTBENEFSIT') then
        frm := TfrmParamRelaQuantBenefSit.Create(Application)
     else if (AnsiUpperCase(Form) = 'FRMQUANTBENEFPLANOSAUDE') then
        frm := TfrmQuantBenefPlanoSaude.Create(Application)
     else if (AnsiUpperCase(Form) = 'FRMPARAMRELACALCCONTRIBASS') then
        frm := TfrmParamRelaCalcContribAss.Create(Application)
     else if (AnsiUpperCase(Form) = 'FRMPARAMRELTOTALCONTRIB') then
        frm := TfrmParamRelTotalContrib.Create(Application)
     else if (AnsiUpperCase(Form) = 'FRMPARAMRELDEPENMAIORIDADE') then
        frm := TfrmParamRelDepenMaioridade.Create(Application)
     else if (AnsiUpperCase(Form) = 'FRMPARAMRELRUBRICAASS') then
        frm := TFrmParamRelRubricaAss.Create(Application)
     else if (AnsiUpperCase(Form) = 'FRMPARAMRELGRAUDEPENDENCIA') then
        frm := TfrmParamRelGrauDependencia.Create(Application)
     else if (AnsiUpperCase(Form) = 'FRMPARAMRELBOLETOS') then
        frm := TFrmParamRelBoletos.Create(Application)
     else if (AnsiUpperCase(Form) = 'FRMPARAMRELCOMPENVIO') then
        frm := TFrmParamRelCompEnvio.Create(Application)
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

procedure TdtmRelAssistencial.rpRelaMensPagMesDBText7Print(Sender: TObject);
begin
  inherited;
  if qryRelaMensPagMes.FieldByName('diferenca').AsFloat < 0 then
     rpRelaMensPagMesDBText7.Font.Style := ([fsItalic])
  else
     rpRelaMensPagMesDBText7.Font.Style := ([]);

end;

procedure TdtmRelAssistencial.qryContribCalcFields(DataSet: TDataSet);
begin
  inherited;
  (*with qryContrib do
  begin
    close;
    SQL.Add ('select nome, ''PRP'' as tipodependp '+
             'from planass '+
             'where nome like ''Plano Dental Basico%''');
    open;
  end;

  with regraContrib do
  begin
    rulename := '15180';
    execute;
    qryContrib.FieldByName('valorContrib').asString := result;
  end;
  *)
end;

procedure TdtmRelAssistencial.PercentTitSerprosPrint(Sender: TObject);
var
  Aux : Real;
  S : String;
begin
  inherited;
  Aux := SomaTitSerpros.Value / SomaTotSerpros.Value * 100;
  Str (Aux:10:2, S);
  PercentTitSerpros.AsString := Trim(S) + '%';
end;

procedure TdtmRelAssistencial.PercentDepSerprosPrint(Sender: TObject);
var
  Aux : Real;
  S : String;
begin
  inherited;
  Aux := SomaDepSerpros.Value / SomaTotSerpros.Value * 100;
  Str (Aux:10:2, S);
  PercentDepSerpros.AsString := Trim(S) + '%';
end;

procedure TdtmRelAssistencial.PercentTotSerprosPrint(Sender: TObject);
var
  Aux : Real;
  S : String;
begin
  inherited;
  Aux := SomaTotSerpros.Value / SomaTotal.Value * 100;
  Str (Aux:10:2, S);
  PercentTotSerpros.AsString := Trim(S) + '%';
end;

procedure TdtmRelAssistencial.PercentTitSerproPrint(Sender: TObject);
var
  Aux : Real;
  S : String;
begin
  inherited;
  Aux := SomaTitSerpro.Value / SomaTotSerpro.Value * 100;
  Str (Aux:10:2, S);
  PercentTitSerpro.AsString := Trim(S) + '%';
end;

procedure TdtmRelAssistencial.PercentDepSerproPrint(Sender: TObject);
var
  Aux : Real;
  S : String;
begin
  inherited;
  Aux := SomaDepSerpro.Value / SomaTotSerpro.Value * 100;
  Str (Aux:10:2, S);
  PercentDepSerpro.AsString := Trim(S) + '%';
end;

procedure TdtmRelAssistencial.PercentTotSerproPrint(Sender: TObject);
var
  Aux : Real;
  S : String;
begin
  inherited;
  Aux := SomaTotSerpro.Value / SomaTotal.Value * 100;
  Str (Aux:10:2, S);
  PercentTotSerpro.AsString := Trim(S) + '%';
end;

procedure TdtmRelAssistencial.PercentGeralPrint(Sender: TObject);
var
  Aux : Real;
  S : String;
begin
  inherited;
  Aux := qryQuantPlanoSaude.FieldByName('GERAL').AsFloat
       / qryQuantPlanoSaude.FieldByName('TOTALGERAL').AsFloat * 100;
  Str (Aux:10:2, S);
  PercentGeral.AsString := Trim(S) + '%';
end;

procedure TdtmRelAssistencial.PercentAssistidosPrint(Sender: TObject);
var
  Aux : Real;
  S : String;
begin
  inherited;
  Aux := SomaAssistidos.Value / SomaTotal.Value * 100;
  Str (Aux:10:2, S);
  PercentAssistidos.AsString := Trim(S) + '%';
end;

procedure TdtmRelAssistencial.qryapurainscritosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
   qryempresa.Open;
end;

procedure TdtmRelAssistencial.ppDetailBand11BeforePrint(Sender: TObject);
var
  tot : integer;
begin
  inherited;
    tot := qryapurainscritos.fieldbyname('TOTALINC').asinteger - qryapurainscritos.fieldbyname('TOTALDEP').asinteger;
    acumulandoOld := acumulando;
    acumulando := acumulando + tot;
    if acumulandoOld <> acumulando then
      acumulado.caption := inttostr(acumulando)
    else
      acumulado.caption := ' ';
end;


procedure TdtmRelAssistencial.rpapurainscritosGroupHeaderBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  //  acumulando:=StrToInt(rpapurainscritosDBText2.Text);
  acumulando := qryapurainscritos.fieldbyname('TOTALINIC').asinteger;
  acumulandoOld := -1;
end;

procedure TdtmRelAssistencial.rpdivergerecebimentoChildReport1SummaryBand1AfterPrint
          (Sender: TObject);
begin
  inherited;
  totalizador := totalizador + TotalAlterador.Value;
end;

procedure TdtmRelAssistencial.rpdivergerecebimentoSummaryBand1BeforePrint
          (Sender: TObject);
begin
  inherited;
    if (qrydivergerecebimento.fieldbyname('SITRECEBIMENTO').AsString = '4') then
    begin
       alteradores.Visible := true;
       TotAlt.visible := true;
       TotAlt.Caption := '$' + FormatFloat('###,##0.00', totalizador);
    end
    else
    begin
       alteradores.visible := false;
       ToTalt.visible := false;
    end;
end;

procedure TdtmRelAssistencial.rpRelaCalcContribAssGroupHeaderBand3BeforePrint(
  Sender: TObject);
begin
  inherited;
//  titular := qryRelaCalcContribAssTITULAR.Value;
end;

procedure TdtmRelAssistencial.lblGrupoMaioridadePrint(Sender: TObject);
begin
  inherited;
  if qryRelDepenMaioridade.FieldByName('GRUPO').AsString = 'G1' then
    lblGrupoMaioridade.Text := 'Maiores de 21 anos e Menores de 24'
  else lblGrupoMaioridade.Text := 'Maiores de 24 anos';
end;

procedure TdtmRelAssistencial.lblPatroTotalPrint(Sender: TObject);
begin
  inherited;
{  if (qryRelTotalContrib.FieldByName('IDPESSJUR').AsInteger  = 99) or
     (qryRelTotalContrib.FieldByName('IDPLANASS').AsInteger = 17) or
     (qryRelTotalContrib.FieldByName('IDPLANASS').AsInteger = 22) then begin
    lbQtdPatro.Visible        := False;
    lblPatroTotal.Visible     := False;
    dbValorPatroTotal.Visible := False;
  end
  else begin
    lbQtdPatro.Visible        := True;
    lblPatroTotal.Visible     := True;
    dbValorPatroTotal.Visible := True;
  end;}
end;

procedure TdtmRelAssistencial.lbDependenciaPrint(Sender: TObject);
begin
  inherited;
  (* utiliza o Grau de Dependência escolhido pelo usuário passado
     na unit FParamRelDepenMaioridade *)
  lbDependencia.Text := '( '+ FGrauDependencia + ' )';
end;

procedure TdtmRelAssistencial.qryRelTotalContribBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Repaint;
  frmAguarde.SetFocus;
end;

procedure TdtmRelAssistencial.qryRelGrauDependenciaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Repaint;
  frmAguarde.SetFocus;
end;

procedure TdtmRelAssistencial.qryRelBoletosBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Repaint;
  frmAguarde.SetFocus;
end;

procedure TdtmRelAssistencial.qryRelRubricaAssBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  CEmp        := 0;
  CDep        := 0;
  GEmp        := 0;
  GDep        := 0;
  CtaESaude   := 0;
  CtaEDental  := 0;
  CtaDSaude   := 0;
  CtaDDental  := 0;
  TEmp        := 0;
  TPat        := 0;
  VlrSaude    := 0;
  VlrDental   := 0;
  Liga        := False;
  frmAguarde.Repaint;
  frmAguarde.SetFocus;
end;

procedure TdtmRelAssistencial.rpRelTotalContribBeforePrint(Sender: TObject);
begin
  inherited;
  bFim := False;
  QtdTitular := 0;
  QtdPatro   := 0;
  QtdTotal   := 0;
  Titular      := '';
  TitularPatro := '';
end;

procedure TdtmRelAssistencial.rpRelaCalcContribAssBeforePrint(Sender: TObject);
begin
  inherited;
  bFim := False;
  QtdTitular := 0;
  QtdPatro   := 0;
  QtdTotal   := 0;
  Titular      := '';
  TitularPatro := '';
end;

procedure TdtmRelAssistencial.HeaderGrupoPRODUTOBeforePrint(Sender: TObject);
{var bVisivel, bVisivelTotalPatro : boolean;}
begin
  inherited;
  if (qryRelaCalcContribAss.FieldByName('PRODUTO').AsString = 'Seguro de Vida') then begin
    LblSalario.Visible := True;
    dbSalario.Visible  := True;
  end
  else begin
    LblSalario.Visible := False;
    dbSalario.Visible  := False;
  end;

{  bVisivel           := False;
  bVisivelTotalPatro := False;
  if Pos('Folha',qryRelaCalcContribAss.FieldByName('PAG').AsString) > 0 then begin
  (* É Folha de Pagamento ou Folha de Benefício *)
    bVisivelTotalPatro := True;
    if (qryRelaCalcContribAss.FieldByName('PRODUTO').AsString = 'Plano Dental') OR
       (qryRelaCalcContribAss.FieldByName('PRODUTO').AsString = 'Plano Saúde')  then
      bVisivel := True
    else bVisivel := False;
  end
  (* É Cobrança Bancária ou Carnê *)
  else begin
    bVisivel           := False;
    bVisivelTotalPatro := False;
  end;


  (* Verifica se deve imprimir os labels ou não *)
  if bVisivel then begin
    (* banda DETALHE *)
    lblPatro.Visible         := True;
    dbValorPatro.Visible     := True;
    LineSomaPatro.Visible    := True;
    dbSomaValorPatro.Visible := True;
    (* banda rodapé do grupo INSCRIÇÃO *)
    lblQtdDescontoPatro.Visible   := True;
    lblvlQtdDescontoPatro.Visible := True;
    lblValorDescontoPatro.Visible := True;
    dbValorDescontoPatro.Visible  := True;
  end
  else begin
    lblPatro.Visible              := False;
    dbValorPatro.Visible          := False;
    LineSomaPatro.Visible         := False;
    dbSomaValorPatro.Visible      := False;
    lblQtdDescontoPatro.Visible   := False;
    lblvlQtdDescontoPatro.Visible := False;
    lblValorDescontoPatro.Visible := False;
    dbValorDescontoPatro.Visible  := False;
  end;(* if Pos *)
  (* Verifica se deve imprimir os labels do Total da Patrocinadora ou não *)
  if bVisivelTotalPatro then begin
    (* banda rodapé do grupo PAG *)
    lblTotalPatro.Visible := True;
    dbTotalPatro.Visible  := True;
  end
  else begin
    lblTotalPatro.Visible         := False;
    dbTotalPatro.Visible          := False;
  end;  }
end;

procedure TdtmRelAssistencial.bndDetalheCalcContribBeforePrint(Sender: TObject);
begin
  inherited;
  if qryRelaCalcContribAss.FieldByName('VALOR').AsFloat > 0 then begin
    if qryRelaCalcContribAss.FieldByName('TITULAR').AsString <> Titular then begin
      Titular :=  qryRelaCalcContribAss.FieldByName('TITULAR').AsString;
      QtdTitular := QtdTitular + 1;
    end;
  end;
  if qryRelaCalcContribAss.FieldByName('VLRPATRO').AsFloat > 0 then begin
    if qryRelaCalcContribAss.FieldByName('TITULAR').AsString <> TitularPatro then begin
      TitularPatro :=  qryRelaCalcContribAss.FieldByName('TITULAR').AsString;
      QtdPatro   := QtdPatro + 1;
    end;
  end;
end;

(*
procedure TdtmRelAssistencial.bndDetalheTotalCalcContribBeforePrint(Sender: TObject);
begin
  inherited;
  if qryRelTotalContrib.FieldByName('VALOR').AsFloat > 0 then begin
    if qryRelTotalContrib.FieldByName('TITULAR').AsString <> Titular then begin
      Titular :=  qryRelTotalContrib.FieldByName('TITULAR').AsString;
      QtdTitular := QtdTitular + 1;
    end;
  end;
  if qryRelTotalContrib.FieldByName('VLRPATRO').AsFloat > 0 then begin
    if qryRelTotalContrib.FieldByName('TITULAR').AsString <> TitularPatro then begin
      TitularPatro :=  qryRelTotalContrib.FieldByName('TITULAR').AsString;
      QtdPatro   := QtdPatro + 1;
    end;
  end;
end;

*)
procedure TdtmRelAssistencial.lbQtdTitularPrint(Sender: TObject);
begin
  inherited;
  if not bFim then begin
    lbQtdTitular.Text     := IntToStr(QtdTitular);
    lbQtdTitularCalc.Text := IntToStr(QtdTitular);
    QtdTotal := QtdTotal + QtdTitular;
    QtdTitular := 0;
    Titular    := '';
  end;
end;

procedure TdtmRelAssistencial.lbQtdPatroPrint(Sender: TObject);
begin
  inherited;
  if not bFim then begin
    lbQtdPatro.Text            := IntToStr(QtdPatro);
    lblvlQtdDescontoPatro.Text := IntToStr(QtdPatro);
    QtdTotal := QtdTotal + QtdPatro;
    QtdPatro     := 0;
    TitularPatro := '';
  end;
end;

procedure TdtmRelAssistencial.lblQtdTotalPrint(Sender: TObject);
begin
  inherited;
  lblQtdTotal.Text := IntToStr(QtdTotal);
  QtdTotal := 0;
end;

procedure TdtmRelAssistencial.lblQtdTotalCalcPrint(Sender: TObject);
begin
  inherited;
{  if not bFim then begin
    lblQtdTotalCalc.Text := IntToStr(QtdTotal);
    QtdTotal := 0;
  end;}
end;

procedure TdtmRelAssistencial.rpRelaCalcContribAssSummaryBandBeforePrint(Sender: TObject);
begin
  inherited;
  bFim := True;
  frmAguarde.Apaga;
end;

procedure TdtmRelAssistencial.rpRelTotalContribSummaryBandBeforePrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelAssistencial.rpRelDepenMaioridadeSummaryBand1BeforePrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelAssistencial.rpRelGrauDependenciaSummaryBandBeforePrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelAssistencial.rpRelRubricaAssGroupHeaderBand2BeforePrint(
  Sender: TObject);
begin
  inherited;
  rpRelRubricaAssLabel8.Caption:='Lotação: '+qryRelRubricaAssCODDEPTO.AsString+
                                 '/'+qryRelRubricaAssCODREDUZIDO.AsString;
end;

procedure TdtmRelAssistencial.rpRelRubricaAssCalc2Calc(Sender: TObject);
begin
  inherited;
  rpRelRubricaAssCalc2.AsFloat:=rpRelRubricaAssDBCalc1.Value+rpRelRubricaAssDBCalc2.Value;
end;

procedure TdtmRelAssistencial.ppDetailBand17AfterPrint(Sender: TObject);
begin
  inherited;
  rpRelRubricaAssDBText3.Visible:=False;
end;

procedure TdtmRelAssistencial.rpRelRubricaAssGroupHeaderBand4BeforePrint(
  Sender: TObject);
begin
  inherited;
  rpRelRubricaAssDBText3.Visible:=True;
  If qryRelRubricaAssNUMSEQUENCIA.AsInteger = 0
   Then CEmp := CEmp + 1
   Else CDep := CDep + 1;
end;

procedure TdtmRelAssistencial.ppDetailBand17BeforePrint(Sender: TObject);
begin
  inherited;
  If qryRelRubricaAssVALOR.AsCurrency > 0
   Then TEmp := TEmp+qryRelRubricaAssVALOR.AsCurrency
   Else TPat := TPat+qryRelRubricaAssVLRPATRO.AsCurrency;
  If not Liga Then
   Begin
    Case qryRelRubricaAssCODPROVDESC.AsInteger of
     512,620 : Begin
                VlrSaude:=VlrSaude+qryRelRubricaAssVLRPATRO.AsCurrency;
                If qryRelRubricaAssNUMSEQUENCIA.AsInteger = 0
                 Then CtaESaude:=CtaESaude+1
                 Else CtaDSaude:=CtaDSaude+1;
               End;

     500,732 : Begin
                VlrDental:=VlrDental+qryRelRubricaAssVLRPATRO.AsCurrency;
                If qryRelRubricaAssNUMSEQUENCIA.AsInteger = 0
                 Then CtaEDental:=CtaEDental+1
                 Else CtaDDental:=CtaDDental+1;
               End;
    End;
   End;
end;

procedure TdtmRelAssistencial.rpRelRubricaAssGroupFooterBand2BeforePrint(
  Sender: TObject);
begin
  inherited;
  rpRelRubricaAssCalc1.AsInteger:=CEmp;
  rpRelRubricaAssCalc3.AsInteger:=CDep;
  If not Liga Then
   Begin
    GEmp:=GEmp+CEmp;
    GDep:=GDep+CDep;
   End;
  If qryRelRubricaAss.EOF Then Liga:=True;
  CEmp:=0;
  CDep:=0;
end;

procedure TdtmRelAssistencial.rpRelRubricaAssCalc5Calc(Sender: TObject);
begin
  inherited;
  rpRelRubricaAssCalc5.AsFloat:=rpRelRubricaAssDBCalc4.Value+rpRelRubricaAssDBCalc3.Value;
end;


procedure TdtmRelAssistencial.rpRelRubricaAssSummaryBand1BeforeGenerate(
  Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelAssistencial.rpRelRubricaAssGroupFooterBand5BeforePrint(
  Sender: TObject);
begin
  inherited;
  rpRelRubricaAssCalc4.AsInteger:=GEmp;
  rpRelRubricaAssCalc6.AsInteger:=GDep;
  rpRelRubricaAssCalc5.AsFloat:=rpRelRubricaAssDBCalc3.Value+rpRelRubricaAssDBCalc4.Value;
  rpRelRubricaAssCalc7.AsInteger:=CtaESaude;
  rpRelRubricaAssCalc8.AsInteger:=CtaEDental;
  rpRelRubricaAssCalc9.AsInteger:=CtaDSaude;
  rpRelRubricaAssCalc10.AsInteger:=CtaDDental;
  rpRelRubricaAssCalc11.AsFloat:=VlrSaude;
  rpRelRubricaAssCalc12.AsFloat:=VlrDental;
end;

procedure TdtmRelAssistencial.rpRelBoletosGroupHeaderBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  Case qryRelBoletosCODPORTFORMA.AsInteger Of
   337 : rplblPlano.Caption:='Rubrica: Assistência Médica Hospitalar';
   355 : rplblPlano.Caption:='Rubrica: Assistência Odontológica';
   375 : rplblPlano.Caption:='Rubrica: Assistência Funeral';
   376 : rplblPlano.Caption:='Rubrica: Seguro de Vida';
  End;
end;

procedure TdtmRelAssistencial.rpRelBoletosSummaryBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelAssistencial.ppGroupHeaderBand9BeforePrint(
  Sender: TObject);
begin
  inherited;
  vTitCP:=vTitCP+1;
end;

procedure TdtmRelAssistencial.ppDetailBand18BeforePrint(Sender: TObject);
begin
  inherited;
  If qryRelBenSaudeDEPENDENTE.AsString <> qryRelBenSaudeTITULAR.AsString
   Then vDepCP:=vDepCP+1;
end;

procedure TdtmRelAssistencial.rpRelBenSaudeGroupFooterBand2BeforePrint(
  Sender: TObject);
begin
  inherited;
  If Not Liga Then
   Begin
    vTitCG:=vTitCG+vTitCP;
    vDepCG:=vDepCG+vDepCP;
    rpRelBenSaudeCalc1.Text:=IntToStr(vTitCP);
    rpRelBenSaudeCalc2.Text:=IntToStr(vDepCP);
    vTitCP:=0;
    vDepCP:=0;
   End;
  If qryRelBenSaude.EOF Then Liga:=True;
end;

procedure TdtmRelAssistencial.rpRelBenSaudeCalc3Calc(Sender: TObject);
begin
  inherited;
  rpRelBenSaudeCalc3.AsInteger:=vTitCG;
end;

procedure TdtmRelAssistencial.rpRelBenSaudeCalc4Calc(Sender: TObject);
begin
  inherited;
  rpRelBenSaudeCalc4.AsInteger:=vDepCG;
end;

procedure TdtmRelAssistencial.rpRelBenSaudeBeforePrint(Sender: TObject);
begin
  inherited;
  vTitCP := 0;
  vTitCG := 0;
  vDepCP := 0;
  vDepCG := 0;
  Liga   := False;
 // ppLabelNomeSistema.Caption:='Assistencial';{Sistema.NomeAplicativo;}
end;

procedure TdtmRelAssistencial.rpCompEnvioBeforePrint(Sender: TObject);
begin
  inherited;
  vDrp:=0;
  vDrt:=0;
  vDdp:=0;
  vDdt:=0;
  vDsp:=0;
  vVst:=0;
  vVrp:=0;
  vVrt:=0;
  vVdp:=0;
  vVdt:=0;
  vVsp:=0;
  vVst:=0;
  Liga:=False;
end;

procedure TdtmRelAssistencial.ppDetailBand19BeforePrint(Sender: TObject);
begin
  inherited;
  (* Acumuladores parciais para registros débitados *)
  If qryCompEnvioMOTIVO.AsString='Débito efetuado' Then
   Begin
    vDdp:=vDdp+1;
    vVdp:=vVdp+qryCompEnvioVALOR.AsCurrency;
   End;
  (* Acumuladores parciais para registros sem retorno *)
  If qryCompEnvioMOTIVO.AsString='** ENVIADO SEM RETORNO **' Then
   Begin
    vDsp:=vDsp+1;
    vVsp:=vVsp+qryCompEnvioVALOR.AsCurrency;
   End;
  (* Acumuladores parciais para registros rejeitados *)
  If (qryCompEnvioMOTIVO.AsString<>'Débito efetuado') and
     (qryCompEnvioMOTIVO.AsString<>'** ENVIADO SEM RETORNO **') Then
   Begin
    vDrp:=vDrp+1;
    vVrp:=vVrp+qryCompEnvioVALOR.AsCurrency;
   End;
end;

procedure TdtmRelAssistencial.rpCompEnvioGroupFooterBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  If Not Liga Then
   Begin
// Imprime no caption dos labels o valor dos acumuladores parciais
    rpCompEnviodrp.Caption:=FloatToStr(vDrp);
    rpCompEnviovrp.Caption:=FloatToStrF(vVrp,ffCurrency,15,2);
    rpCompEnvioddp.Caption:=FloatToStr(vDdp);
    rpCompEnviovdp.Caption:=FloatToStrF(vVdp,ffCurrency,15,2);
    rpCompEnviosdp.Caption:=FloatToStr(vDsp);
    rpCompEnviovsp.Caption:=FloatToStrF(vVsp,ffCurrency,15,2);
// Acumula os valores parciais nos totais
    vDrt:=vDrt+VDrp;
    vVrt:=vVrt+vVrp;
    vDdt:=vDdt+vDdp;
    vVdt:=vVdt+vVdp;
    vDst:=vDst+vDsp;
    vVst:=vVst+vVsp;
// Zera acumuladores parciais
    VDrp:=0;
    vVrp:=0;
    vDdp:=0;
    vVdp:=0;
    vDsp:=0;
    vVsp:=0;
// Imprime no caption dos labels o valor dos acumuladores totais
    rpCompEnviodrt.Caption:=FloatToStr(vDrt);
    rpCompEnviovrt.Caption:=FloatToStrF(vVrt,ffCurrency,15,2);
    rpCompEnvioddt.Caption:=FloatToStr(vDdt);
    rpCompEnviovdt.Caption:=FloatToStrF(vVdt,ffCurrency,15,2);
    rpCompEnviodst.Caption:=FloatToStr(vDst);
    rpCompEnviovst.Caption:=FloatToStrF(vVst,ffCurrency,15,2);
   End;
  If vUltimo = qryCompEnvioNUMDOC.AsInteger Then Liga:=True;
end;

procedure TdtmRelAssistencial.ppSummaryBand3BeforePrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelAssistencial.FormCreate(Sender: TObject);
begin
  inherited;
  //qryFundacao.ParamByName('idFundacao').Value:=1;//iIdFundacao;
  qryFundacao.Open;
end;

procedure TdtmRelAssistencial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryFundacao.Close;
end;

procedure TdtmRelAssistencial.ppDBTextTitularPrint(Sender: TObject);
begin
  inherited;
  
  //Inc(ppVarTotalPatro,1);
  //Inc(ppVariableTotalTitulares,1)
end;

end.
