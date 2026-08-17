unit DRptRelats;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE,Mask, ppMemo,
  ppStrtch, ppSubRpt, ppRichTx, CmEventosCadastro, ppVar, ppRelatv,
  ppDBPipe, ppModule, daDataModule, OleCtnrs, ExtCtrls;

type
    TdtmRptRelats = class(TdtmReports)
    bdeExtMov: TppBDEPipeline;
    dsExtMov: TwwDataSource;
    qryExtMov: TwwQuery;
    rptExtMov: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppCalc1: TppSystemVariable;
    ppLabel3: TppLabel;
    ppCalc2: TppSystemVariable;
    lbAlmox: TppLabel;
    rptExtMovLabel3: TppLabel;
    lbPeriodo: TppLabel;
    rptExtMovLabel24: TppLabel;
    rptExtMovLabel25: TppLabel;
    rptExtMovLine7: TppLine;
    rptExtMovLabel29: TppLabel;
    rptExtMovLabel30: TppLabel;
    rptExtMovLabel31: TppLabel;
    rptExtMovLabel33: TppLabel;
    rptExtMovLabel34: TppLabel;
    rptExtMovLabel35: TppLabel;
    rptExtMovLabel36: TppLabel;
    rptExtMovLabel37: TppLabel;
    rptExtMovLine8: TppLine;
    rptExtMovLine9: TppLine;
    rptExtMovLabel38: TppLabel;
    rptExtMovLine10: TppLine;
    rptExtMovLabel39: TppLabel;
    rptExtMovLine11: TppLine;
    rptExtMovLabel40: TppLabel;
    rptExtMovLabel42: TppLabel;
    rptExtMovLabel43: TppLabel;
    rptExtMovDBText1: TppDBText;
    rptExtMovDBText2: TppDBText;
    rptExtMovDBText3: TppDBText;
    rptExtMovDBText4: TppDBText;
    rptExtMovDBText5: TppDBText;
    rptExtMovDBText6: TppDBText;
    rptExtMovDBText8: TppDBText;
    rptExtMovDBText9: TppDBText;
    rptExtMovDBText10: TppDBText;
    rptExtMovDBText11: TppDBText;
    rptExtMovDBText12: TppDBText;
    rptExtMovDBText13: TppDBText;
    rptExtMovLabel1: TppLabel;
    rptExtMovShape1: TppShape;
    rptExtMovDBCalc1: TppDBCalc;
    rptExtMovDBCalc2: TppDBCalc;
    rptExtMovDBCalc3: TppDBCalc;
    rptExtMovDBCalc4: TppDBCalc;
    rptExtMovLabel2: TppLabel;
    rptExtMovDBText7: TppDBText;
    rptExtMovLabel4: TppLabel;
    rptExtMovDBText14: TppDBText;
    bdeInventFF: TppBDEPipeline;
    dsInventFF: TwwDataSource;
    qryInventFF: TwwQuery;
    rptInventFF: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppLabel5: TppLabel;
    DetInVentFF: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppCalc3: TppSystemVariable;
    ppLine3: TppLine;
    ppLabel6: TppLabel;
    ppCalc4: TppSystemVariable;
    LbAlmox2: TppLabel;
    rptInventFFLine1: TppLine;
    rptInventFFLabel3: TppLabel;
    rptInventFFLabel4: TppLabel;
    rptInventFFLabel5: TppLabel;
    rptInventFFLabel6: TppLabel;
    rptInventFFLabel7: TppLabel;
    rptInventFFLabel8: TppLabel;
    rptInventFFLabel10: TppLabel;
    rptInventFFDBText1: TppDBText;
    rptInventFFDBText2: TppDBText;
    rptInventFFDBText3: TppDBText;
    rptInventFFDBText4: TppDBText;
    rptInventFFDBText5: TppDBText;
    rptInventFFDBText6: TppDBText;
    rptInventFFDBText7: TppDBText;
    rptInventFFDBCalc1: TppDBCalc;
    rptInventFFLabel11: TppLabel;
    dbeResFinanCC: TppBDEPipeline;
    dsResFinanCC: TwwDataSource;
    qryResFinanCC: TwwQuery;
    rptResFinanCC: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppCalc5: TppSystemVariable;
    ppLine6: TppLine;
    ppLabel17: TppLabel;
    lbPer2: TppLabel;
    rptResFinanCCCalc1: TppSystemVariable;
    rptResFinanCCDBText1: TppDBText;
    rptResFinanCCShape1: TppShape;
    rptResFinanCCLabel2: TppLabel;
    rptResFinanCCLabel3: TppLabel;
    rptResFinanCCDBText2: TppDBText;
    rptResFinanCCLabel4: TppLabel;
    rptExtMovLabel5: TppLabel;
    rptExtMovDBText15: TppDBText;
    rptExtMovLabel6: TppLabel;
    rptExtMovDBText16: TppDBText;
    rptResFinanCCSummaryBand1: TppSummaryBand;
    rptResFinanCCShape2: TppShape;
    rptResFinanCCLabel1: TppLabel;
    rptResFinanCCLabel5: TppLabel;
    rptResFinanCCDBText3: TppDBText;
    rptResFinanCCLabel6: TppLabel;
    bdeRecon: TppBDEPipeline;
    dsRecon: TwwDataSource;
    qryRecon: TwwQuery;
    rptRecon: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel9: TppLabel;
    ppLine4: TppLine;
    ppLabel10: TppLabel;
    DetRecon: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppCalc6: TppSystemVariable;
    ppLine5: TppLine;
    ppLabel11: TppLabel;
    ppCalc7: TppSystemVariable;
    lbTituloAlmox: TppLabel;
    lbAlmox3: TppLabel;
    rptReconLine1: TppLine;
    rptReconDBText1: TppDBText;
    rptReconLabel2: TppLabel;
    rptReconLabel3: TppLabel;
    rptReconLabel4: TppLabel;
    rptReconLabel5: TppLabel;
    rptReconLabel6: TppLabel;
    rptReconLabel7: TppLabel;
    rptReconLabel8: TppLabel;
    rptReconLabel9: TppLabel;
    rptReconLabel10: TppLabel;
    rptReconLabel11: TppLabel;
    rptReconLabel12: TppLabel;
    rptReconLabel13: TppLabel;
    rptReconLabel14: TppLabel;
    rptReconLabel15: TppLabel;
    rptReconLabel17: TppLabel;
    rptReconLine2: TppLine;
    rptReconLine3: TppLine;
    rptReconLabel18: TppLabel;
    rptReconDBCalc8: TppDBCalc;
    rptReconDBCalc9: TppDBCalc;
    rptReconDBCalc10: TppDBCalc;
    rptReconDBCalc11: TppDBCalc;
    rptReconDBCalc12: TppDBCalc;
    rptReconDBCalc13: TppDBCalc;
    rptReconDBCalc14: TppDBCalc;
    rptReconSummaryBand1: TppSummaryBand;
    rptReconDBCalc15: TppDBCalc;
    rptReconDBCalc16: TppDBCalc;
    rptReconDBCalc17: TppDBCalc;
    rptReconDBCalc18: TppDBCalc;
    rptReconDBCalc19: TppDBCalc;
    rptReconDBCalc20: TppDBCalc;
    rptReconDBCalc21: TppDBCalc;
    rptReconLabel19: TppLabel;
    rptReconLine4: TppLine;
    rptReconLabel20: TppLabel;
    rptReconDBCalc24: TppDBCalc;
    lbper3: TppLabel;
    rptReconDBText4: TppDBText;
    rptReconLine5: TppLine;
    rptExtMovLabel7: TppLabel;
    rptExtMovDBText17: TppDBText;
    rptReconDBCalc22: TppDBCalc;
    rptReconDBText2: TppDBText;
    rptReconDBText3: TppDBText;
    rptReconDBText5: TppDBText;
    rptReconDBText6: TppDBText;
    rptReconDBText7: TppDBText;
    rptReconDBText8: TppDBText;
    rptReconDBText9: TppDBText;
    rptReconDBText10: TppDBText;
    rptReconDBText11: TppDBText;
    rptReconDBText12: TppDBText;
    rptReconLabel22: TppLabel;
    rptExtMovImage1: TppImage;
    rptExtMovLine1: TppLine;
    rptExtMovLine2: TppLine;
    bdePlanInvent: TppBDEPipeline;
    dsPlanInvent: TwwDataSource;
    qryPlanInvent: TwwQuery;
    rptPlanInvent: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel12: TppLabel;
    ppLine2: TppLine;
    ppLabel13: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppFooterBand5: TppFooterBand;
    ppCalc8: TppSystemVariable;
    ppLine7: TppLine;
    ppLabel14: TppLabel;
    ppCalc9: TppSystemVariable;
    rptPlanInventLine1: TppLine;
    rptPlanInventDBText1: TppDBText;
    rptPlanInventDBText2: TppDBText;
    rptPlanInventLabel1: TppLabel;
    rptPlanInventLabel2: TppLabel;
    rptPlanInventLabel3: TppLabel;
    rptPlanInventLabel4: TppLabel;
    rptPlanInventLabel5: TppLabel;
    rptPlanInventLine2: TppLine;
    rptPlanInventDBText3: TppDBText;
    rptPlanInventDBText4: TppDBText;
    rptPlanInventLine3: TppLine;
    rptPlanInventDBText5: TppDBText;
    rptPlanInventLabel6: TppLabel;
    bdeContInvent: TppBDEPipeline;
    dsContInvent: TwwDataSource;
    qryContInvent: TwwQuery;
    RptContInvent: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel15: TppLabel;
    ppLine8: TppLine;
    ppLabel16: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppCalc10: TppSystemVariable;
    ppLine10: TppLine;
    ppLabel18: TppLabel;
    ppCalc11: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLine11: TppLine;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLine12: TppLine;
    ppLabel24: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    RptContInventLabel1: TppLabel;
    RptContInventDBText1: TppDBText;
    RptContInventDBText2: TppDBText;
    RptContInventLabel2: TppLabel;
    RptContInventDBText3: TppDBText;
    RptContInventLabel3: TppLabel;
    RptContInventLabel4: TppLabel;
    RptContInventLabel5: TppLabel;
    RptContInventDBText4: TppDBText;
    RptContInventDBText5: TppDBText;
    RptContInventDBText6: TppDBText;
    bdeCustAnali: TppBDEPipeline;
    dsCustAnali: TwwDataSource;
    qryCustAnali: TwwQuery;
    RptCustAnali: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    LbPer5: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppFooterBand7: TppFooterBand;
    ppLabel28: TppLabel;
    ppCalc12: TppSystemVariable;
    ppLine9: TppLine;
    ppCalc13: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppShape1: TppShape;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText6: TppDBText;
    ppShape2: TppShape;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel34: TppLabel;
    ppDBText7: TppDBText;
    RptCustAnaliDBText1: TppDBText;
    RptCustAnaliDBText2: TppDBText;
    bdePlanInventGrp: TppBDEPipeline;
    dsPlanInventGrp: TwwDataSource;
    qryPlanInventGrp: TwwQuery;
    rptPlanInventGrp: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLine14: TppLine;
    ppDBText10: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppCalc14: TppSystemVariable;
    ppLine15: TppLine;
    ppLabel37: TppLabel;
    ppCalc15: TppSystemVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLine16: TppLine;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLine17: TppLine;
    ppLabel43: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    rptPlanInventGrpDBText1: TppDBText;
    rptPlanInventGrpDBText2: TppDBText;
    rptPlanInventGrpLine1: TppLine;
    rptReconDBText13: TppDBText;
    rptInventFFDBText8: TppDBText;
    rptReconDBText14: TppDBText;
    rptReconLabel23: TppLabel;
    rptReconLabel24: TppLabel;
    rptReconDBCalc1: TppDBCalc;
    rptPlanInventLabel7: TppLabel;
    LBAlmoxPI: TppLabel;
    bdeSugestComp: TppBDEPipeline;
    dsSugestComp: TwwDataSource;
    qrySugestComp: TwwQuery;
    RptSugestComp: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel44: TppLabel;
    ppLine13: TppLine;
    ppLabel45: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppFooterBand9: TppFooterBand;
    ppCalc16: TppSystemVariable;
    ppLine18: TppLine;
    ppLabel46: TppLabel;
    ppCalc17: TppSystemVariable;
    RptSugestCompLabel1: TppLabel;
    RptSugestCompDBText1: TppDBText;
    RptSugestCompLabel2: TppLabel;
    RptSugestCompLabel3: TppLabel;
    RptSugestCompDBText2: TppDBText;
    RptSugestCompDBText3: TppDBText;
    RptSugestCompLabel4: TppLabel;
    RptSugestCompLabel5: TppLabel;
    RptSugestCompDBText4: TppDBText;
    RptSugestCompLabel6: TppLabel;
    RptSugestCompLabel7: TppLabel;
    RptSugestCompDBText5: TppDBText;
    RptSugestCompLabel8: TppLabel;
    RptSugestCompLabel9: TppLabel;
    RptSugestCompDBText6: TppDBText;
    RptSugestCompLabel10: TppLabel;
    RptSugestCompLabel11: TppLabel;
    RptSugestCompDBText7: TppDBText;
    RptSugestCompLabel12: TppLabel;
    RptSugestCompLabel13: TppLabel;
    RptSugestCompLabel14: TppLabel;
    RptSugestCompLabel15: TppLabel;
    RptSugestCompDBText8: TppDBText;
    RptSugestCompLine1: TppLine;
    RptSugestCompDBText9: TppDBText;
    RptSugestCompLabel16: TppLabel;
    lblAlmoxInvent: TppLabel;
    RptContInventLine1: TppLine;
    RptContInventLabel6: TppLabel;
    RptContInventDBCalc4: TppDBCalc;
    RptSugestCompLabel17: TppLabel;
    RptSugestCompLabel18: TppLabel;
    RptSugestCompDBText10: TppDBText;
    rptInventFFSummaryBand1: TppSummaryBand;
    rptInventFFLabel2: TppLabel;
    rptInventFFDBCalc2: TppDBCalc;
    qryInventFFData: TwwQuery;
    dsInventFFData: TwwDataSource;
    bdeInventFFData: TppBDEPipeline;
    RptInventFFData: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel47: TppLabel;
    ppLine19: TppLine;
    ppLabel48: TppLabel;
    lbAlmox4: TppLabel;
    ppLine20: TppLine;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    DetInventDt: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppCalc18: TppSystemVariable;
    ppLine21: TppLine;
    ppCalc19: TppSystemVariable;
    ppLabel57: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppLabel58: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppGroup4: TppGroup;
    CabecInventDt: TppGroupHeaderBand;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    RodapeInventDt: TppGroupFooterBand;
    ppDBCalc4: TppDBCalc;
    ppLabel60: TppLabel;
    lbPer4: TppLabel;
    rptPlanInventGrpLabel1: TppLabel;
    lbAlmox5: TppLabel;
    bdeSolPrePronta: TppBDEPipeline;
    dsSolPrePronta: TwwDataSource;
    qrySolPrePronta: TwwQuery;
    RptSolPrePronta: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppLabel49: TppLabel;
    ppLabel61: TppLabel;
    ppDetailBand11: TppDetailBand;
    ppFooterBand11: TppFooterBand;
    ppCalc20: TppSystemVariable;
    ppLine23: TppLine;
    ppLabel62: TppLabel;
    ppCalc21: TppSystemVariable;
    RptSolPreProntaLine1: TppLine;
    RptSolPreProntaLabel2: TppLabel;
    RptSolPreProntaLine2: TppLine;
    RptSolPreProntaDBText1: TppDBText;
    RptSolPreProntaLine3: TppLine;
    RptSolPreProntaDBText2: TppDBText;
    RptSolPreProntaLabel3: TppLabel;
    RptSolPreProntaDBText3: TppDBText;
    RptSolPreProntaDBText4: TppDBText;
    RptSolPreProntaLine4: TppLine;
    RptSolPreProntaLabel4: TppLabel;
    RptSolPreProntaLine5: TppLine;
    RptSolPreProntaLabel5: TppLabel;
    RptSolPreProntaDBText5: TppDBText;
    RptSolPreProntaLabel6: TppLabel;
    RptSolPreProntaLabel7: TppLabel;
    RptSolPreProntaDBText6: TppDBText;
    RptSolPreProntaLabel8: TppLabel;
    RptSolPreProntaDBText7: TppDBText;
    RptSolPreProntaDBText8: TppDBText;
    RptSolPreProntaDBText9: TppDBText;
    RptSolPreProntaLabel1: TppLabel;
    RptSolPreProntaLabel9: TppLabel;
    RptSolPreProntaLabel10: TppLabel;
    RptSolPreProntaLine6: TppLine;
    RptSolPreProntaLine7: TppLine;
    RptSolPreProntaLine8: TppLine;
    RptSolPreProntaLine9: TppLine;
    RptSolPreProntaLabel11: TppLabel;
    RptSolPreProntaLabel12: TppLabel;
    RptSolPreProntaDBText10: TppDBText;
    RptSolPreProntaDBText11: TppDBText;
    RptSolPreProntaLabel13: TppLabel;
    RptSolPreProntaDBText12: TppDBText;
    qryCadSolPrePronta: TwwQuery;
    dsCadSolPrePronta: TwwDataSource;
    bdeCadSolPrePronta: TppBDEPipeline;
    RptCadSolPrePronta: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLabel27: TppLabel;
    ppLine22: TppLine;
    ppLabel63: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppFooterBand12: TppFooterBand;
    ppCalc22: TppSystemVariable;
    ppLine24: TppLine;
    ppLabel64: TppLabel;
    ppCalc23: TppSystemVariable;
    RptCadPreProntaDBText1: TppDBText;
    RptCadPreProntaLine1: TppLine;
    RptCadPreProntaDBText2: TppDBText;
    RptCadPreProntaDBText3: TppDBText;
    RptCadPreProntaDBText4: TppDBText;
    RptCadPreProntaDBText5: TppDBText;
    RptCadPreProntaDBText6: TppDBText;
    RptCadPreProntaDBText7: TppDBText;
    RptCadPreProntaLine2: TppLine;
    RptCadPreProntaLine3: TppLine;
    RptCadPreProntaLabel1: TppLabel;
    RptCadPreProntaLabel2: TppLabel;
    RptCadPreProntaLabel3: TppLabel;
    RptCadPreProntaLabel4: TppLabel;
    RptCadPreProntaDBText8: TppDBText;
    RptCadPreProntaDBText9: TppDBText;
    RptCadPreProntaLine4: TppLine;
    RodapeInventFF: TppGroupFooterBand;
    GrpInventFF: TppGroupHeaderBand;
    rptInventFFDBText9: TppDBText;
    Lin1: TppLine;
    rptInventFFLine2: TppLine;
    qryArtxConta: TwwQuery;
    dsArtxConta: TwwDataSource;
    bdeArtxConta: TppBDEPipeline;
    RptArtxConta: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    DetArtxConta: TppDetailBand;
    ppFooterBand14: TppFooterBand;
    ppCalc26: TppSystemVariable;
    ppLine28: TppLine;
    ppLabel70: TppLabel;
    ppCalc27: TppSystemVariable;
    RptArtxContaLine2: TppLine;
    RptArtxContaDBText1: TppDBText;
    RptArtxContaDBText2: TppDBText;
    RptArtxContaDBText3: TppDBText;
    RptArtxContaDBText4: TppDBText;
    RptArtxContaDBText5: TppDBText;
    RptArtxContaLabel1: TppLabel;
    RptArtxContaLabel2: TppLabel;
    RptArtxContaLabel3: TppLabel;
    RptArtxContaDBText6: TppDBText;
    CabecGrpArtxConta: TppGroupHeaderBand;
    qryCustContab: TwwQuery;
    dsCustContab: TwwDataSource;
    bdeCustContab: TppBDEPipeline;
    RptCustContab: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppLabel71: TppLabel;
    ppLine27: TppLine;
    ppLabel72: TppLabel;
    ppDetailBand13: TppDetailBand;
    ppFooterBand15: TppFooterBand;
    ppCalc28: TppSystemVariable;
    ppLine29: TppLine;
    ppLabel73: TppLabel;
    ppCalc29: TppSystemVariable;
    RptCustContabDBText1: TppDBText;
    RptCustContabLabel1: TppLabel;
    RptCustContabLine2: TppLine;
    RptCustContabLine3: TppLine;
    RptCustContabDBText2: TppDBText;
    RptCustContabLabel2: TppLabel;
    RptCustContabLabel3: TppLabel;
    RptCustContabDBText3: TppDBText;
    RptCustContabDBCalc1: TppDBCalc;
    RptCustContabLabel4: TppLabel;
    RptCustContabLabel5: TppLabel;
    RptCustContabLabel6: TppLabel;
    RptCustContabLabel7: TppLabel;
    RptCustContabLabel8: TppLabel;
    RptCustContabLabel9: TppLabel;
    RptCustContabLabel10: TppLabel;
    RptCustContabLabel11: TppLabel;
    RptCustContabLabel12: TppLabel;
    RptCustContabLabel13: TppLabel;
    RptCustContabDBCalc2: TppDBCalc;
    RptCustContabDBText5: TppDBText;
    RptCustContabDBText6: TppDBText;
    RptCustContabDBText7: TppDBText;
    RptCustContabDBText8: TppDBText;
    RptCustContabDBText9: TppDBText;
    RptCustContabDBText10: TppDBText;
    RptCustContabDBText11: TppDBText;
    RptCustContabDBText12: TppDBText;
    RptCustContabDBText13: TppDBText;
    RptCustContabDBText14: TppDBText;
    RptCustContabLine4: TppLine;
    RptCustContabLine5: TppLine;
    RptCustContabLine1: TppLine;
    lblPerCust: TppLabel;
    rptReconLabel16: TppLabel;
    rptReconLabel21: TppLabel;
    GrpRecon: TppGroupHeaderBand;
    RodapeRecon: TppGroupFooterBand;
    LblTotSaldoIni: TppDBCalc;
    LblTotRecForn: TppDBCalc;
    LblTotDevForn: TppDBCalc;
    LblTotBaiTrans: TppDBCalc;
    LblTotEntTrans: TppDBCalc;
    LblTotBaiEstrago: TppDBCalc;
    LblTotBaiAcerto: TppDBCalc;
    LblTotBaiCC: TppDBCalc;
    LblTotSaldoAtual: TppDBCalc;
    RptCustContabLabel14: TppLabel;
    RptCustContabLine6: TppLine;
    RptCustContabLine7: TppLine;
    qryReconSaldo: TwwQuery;
    dsReconSaldo: TwwDataSource;
    bdeReconSaldo: TppBDEPipeline;
    RptReconSaldo: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    lbAlmox6: TppLabel;
    lbPer6: TppLabel;
    ppLine30: TppLine;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLine31: TppLine;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppLabel99: TppLabel;
    ppDBText31: TppDBText;
    ppFooterBand16: TppFooterBand;
    ppCalc30: TppSystemVariable;
    ppLine32: TppLine;
    ppLabel100: TppLabel;
    ppCalc31: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppLabel101: TppLabel;
    ppLine33: TppLine;
    ppDBCalc12: TppDBCalc;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppDBText32: TppDBText;
    ppLine34: TppLine;
    ppDBText33: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLabel102: TppLabel;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    ppDBText34: TppDBText;
    ppDBCalc29: TppDBCalc;
    ppDBCalc30: TppDBCalc;
    LinInventDt: TppLine;
    lblTotInventDt: TppDBText;
    qryExtMovSint: TwwQuery;
    dsExtMovSint: TwwDataSource;
    bdeExtMovSint: TppBDEPipeline;
    RptExtMovSint: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppLabel59: TppLabel;
    ppLabel77: TppLabel;
    ppDetailBand10: TppDetailBand;
    ppFooterBand17: TppFooterBand;
    ppCalc32: TppSystemVariable;
    ppLine38: TppLine;
    ppLabel78: TppLabel;
    ppCalc33: TppSystemVariable;
    RptExtMovSintLine1: TppLine;
    RptExtMovSintLabel1: TppLabel;
    lbAlmox7: TppLabel;
    RptExtMovSintLine2: TppLine;
    RptExtMovSintDBText1: TppDBText;
    RptExtMovSintDBText2: TppDBText;
    RptExtMovSintDBText3: TppDBText;
    RptExtMovSintDBText4: TppDBText;
    RptExtMovSintLine3: TppLine;
    RptExtMovSintLabel2: TppLabel;
    RptExtMovSintLine4: TppLine;
    RptExtMovSintLabel3: TppLabel;
    RptExtMovSintLabel4: TppLabel;
    RptExtMovSintLabel5: TppLabel;
    RptExtMovSintDBCalc1: TppDBCalc;
    RptExtMovSintDBCalc2: TppDBCalc;
    RptExtMovSintDBCalc3: TppDBCalc;
    RptExtMovSintDBCalc4: TppDBCalc;
    RptExtMovSintSummaryBand1: TppSummaryBand;
    RptExtMovSintLine6: TppLine;
    RptExtMovSintDBCalc5: TppDBCalc;
    RptExtMovSintDBCalc6: TppDBCalc;
    RptExtMovSintLabel6: TppLabel;
    LbPer7: TppLabel;
    qryArtSemMov: TwwQuery;
    dsArtSemMov: TwwDataSource;
    dbeArtSemMov: TppBDEPipeline;
    RptArtSemMov: TppReport;
    ppHeaderBand18: TppHeaderBand;
    lbTit: TppLabel;
    ppLine37: TppLine;
    ppLabel104: TppLabel;
    ppDetailBand14: TppDetailBand;
    ppFooterBand18: TppFooterBand;
    ppCalc34: TppSystemVariable;
    ppLine39: TppLine;
    ppLabel105: TppLabel;
    ppCalc35: TppSystemVariable;
    RptArtSemMovLine1: TppLine;
    RptArtSemMovLabel1: TppLabel;
    lbAlmox8: TppLabel;
    RptArtSemMovLabel2: TppLabel;
    RptArtSemMovLabel3: TppLabel;
    RptArtSemMovLabel4: TppLabel;
    RptArtSemMovLabel5: TppLabel;
    RptArtSemMovDBText1: TppDBText;
    RptArtSemMovLine2: TppLine;
    RptArtSemMovDBText2: TppDBText;
    RptArtSemMovDBText3: TppDBText;
    RptArtSemMovDBText4: TppDBText;
    RptArtSemMovDBText5: TppDBText;
    RptArtSemMovDBText6: TppDBText;
    RptArtSemMovDBText7: TppDBText;
    RptArtSemMovLabel6: TppLabel;
    RptArtSemMovDBText8: TppDBText;
    RptInventFFDataLabel1: TppLabel;
    LbFiltro: TppLabel;
    qryPlanProd: TwwQuery;
    sdPlanProd: TwwDataSource;
    dbePlanProd: TppBDEPipeline;
    RptPlanProd: TppReport;
    ppHeaderBand19: TppHeaderBand;
    ppLabel103: TppLabel;
    ppLabel106: TppLabel;
    LbFiltro2: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppLine41: TppLine;
    ppDBText37: TppDBText;
    ppFooterBand19: TppFooterBand;
    ppCalc36: TppSystemVariable;
    ppLine42: TppLine;
    ppLabel109: TppLabel;
    ppCalc37: TppSystemVariable;
    ppLine43: TppLine;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppLine44: TppLine;
    ppLabel115: TppLabel;
    dsds: TppLabel;
    RptPlanProdDBText1: TppDBText;
    RptPlanProdLabel1: TppLabel;
    lbAlmox9: TppLabel;
    RptPlanProdDBText2: TppDBText;
    RptPlanProdLine1: TppLine;
    RptPlanProdLine2: TppLine;
    qryRecMercSint: TwwQuery;
    dsRecMercSint: TwwDataSource;
    bdeRecMercSint: TppBDEPipeline;
    RptRecMercSint: TppReport;
    ppHeaderBand20: TppHeaderBand;
    ppLabel107: TppLabel;
    ppLine40: TppLine;
    ppLabel108: TppLabel;
    ppDetailBand16: TppDetailBand;
    ppFooterBand20: TppFooterBand;
    ppCalc38: TppSystemVariable;
    ppLabel110: TppLabel;
    ppCalc39: TppSystemVariable;
    RptRecMercSintLine1: TppLine;
    lbPer8: TppLabel;
    RptRecMercSintLabel2: TppLabel;
    RptRecMercSintLabel3: TppLabel;
    RptRecMercSintLabel4: TppLabel;
    RptRecMercSintDBText1: TppDBText;
    RptRecMercSintDBText2: TppDBText;
    RptRecMercSintDBText3: TppDBText;
    RptRecMercSintLine2: TppLine;
    RptRecMercSintDBText4: TppDBText;
    RptRecMercSintLabel5: TppLabel;
    RptRecMercSintLabel6: TppLabel;
    RptRecMercSintDBText5: TppDBText;
    RptRecMercSintLabel7: TppLabel;
    RptRecMercSintDBText6: TppDBText;
    RptRecMercSintLine3: TppLine;
    RptRecMercSintDBCalc1: TppDBCalc;
    RptRecMercSintLabel8: TppLabel;
    RptRecMercSintDBText7: TppDBText;
    RptRecMercSintSummaryBand1: TppSummaryBand;
    RptRecMercSintLabel1: TppLabel;
    RptRecMercSintDBCalc2: TppDBCalc;
    RptRecMercSintLine4: TppLine;
    qryConsMed: TwwQuery;
    dsConsMed: TwwDataSource;
    bdeConsMed: TppBDEPipeline;
    RptConsMed: TppReport;
    ppHeaderBand21: TppHeaderBand;
    ppLabel111: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    LbFiltro3: TppLabel;
    ppLine45: TppLine;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLine46: TppLine;
    ppLabel123: TppLabel;
    LbAlmox10: TppLabel;
    ppDetailBand17: TppDetailBand;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppFooterBand21: TppFooterBand;
    ppCalc40: TppSystemVariable;
    ppLine48: TppLine;
    ppLabel125: TppLabel;
    ppCalc41: TppSystemVariable;
    ppGroup6: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppLine49: TppLine;
    ppGroupFooterBand4: TppGroupFooterBand;
    RptConsMedDBText1: TppDBText;
    LbPer9: TppLabel;
    RptConsMedLabel6: TppLabel;
    RptConsMedDBText2: TppDBText;
    RptConsMedDBText3: TppDBText;
    RptConsMedDBText4: TppDBText;
    RptConsMedDBText5: TppDBText;
    RptConsMedDBText6: TppDBText;
    RptConsMedDBText7: TppDBText;
    RptConsMedLabel11: TppLabel;
    RptConsMedLabel7: TppLabel;
    RptConsMedLabel1: TppLabel;
    RptConsMedLabel2: TppLabel;
    RptConsMedLabel3: TppLabel;
    RptConsMedLabel4: TppLabel;
    qryCustContabSint: TwwQuery;
    dsCustContabSint: TwwDataSource;
    bdeCustContabSint: TppBDEPipeline;
    RptCustContabSint: TppReport;
    ppHeaderBand22: TppHeaderBand;
    ppLabel118: TppLabel;
    ppLine47: TppLine;
    ppLabel121: TppLabel;
    ppLine50: TppLine;
    LbGrupo: TppLabel;
    LbCentCust3: TppLabel;
    ppLabel127: TppLabel;
    lbPer14: TppLabel;
    ppDetailBand18: TppDetailBand;
    ppDBText40: TppDBText;
    ppDBText44: TppDBText;
    ppDBText49: TppDBText;
    ppFooterBand22: TppFooterBand;
    ppCalc42: TppSystemVariable;
    ppLine53: TppLine;
    ppLabel133: TppLabel;
    ppCalc43: TppSystemVariable;
    ppGroup7: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppDBText51: TppDBText;
    ppLabel134: TppLabel;
    ppDBText52: TppDBText;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppLine56: TppLine;
    ppGroup8: TppGroup;
    CabecCustContabSint: TppGroupHeaderBand;
    ppDBText53: TppDBText;
    ppLabel137: TppLabel;
    ppLine57: TppLine;
    RodapeCustContabSint: TppGroupFooterBand;
    ppLabel138: TppLabel;
    ppDBText54: TppDBText;
    ppDBCalc14: TppDBCalc;
    ppLabel139: TppLabel;
    RptCustContabSintDBCalc1: TppDBCalc;
    RptArtxContaLabel4: TppLabel;
    RptArtxContaLabel5: TppLabel;
    RptArtxContaLine1: TppLine;
    RptArtxContaLine3: TppLine;
    qryInventFFHoje: TwwQuery;
    dsInventFFHoje: TwwDataSource;
    bdeInventFFHoje: TppBDEPipeline;
    RptInventFFHoje: TppReport;
    ppHeaderBand23: TppHeaderBand;
    ppLabel124: TppLabel;
    ppLine51: TppLine;
    ppLabel128: TppLabel;
    LbAlmox11: TppLabel;
    ppLine52: TppLine;
    ppLabel130: TppLabel;
    ppLabel132: TppLabel;
    ppLabel140: TppLabel;
    ppLabel141: TppLabel;
    ppLabel144: TppLabel;
    ppLabel146: TppLabel;
    lbFiltro4: TppLabel;
    DetInventF: TppDetailBand;
    ppDBText43: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppFooterBand23: TppFooterBand;
    ppCalc44: TppSystemVariable;
    ppLine58: TppLine;
    ppCalc45: TppSystemVariable;
    ppLabel148: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    ppGroup9: TppGroup;
    CabecInventF: TppGroupHeaderBand;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppLine59: TppLine;
    RodapeInventF: TppGroupFooterBand;
    LbPer10: TppLabel;
    qryNFxCustAgreg: TwwQuery;
    dsNFxCustAgreg: TwwDataSource;
    bdeNFxCustAgreg: TppBDEPipeline;
    RptNFxCustAgreg: TppReport;
    ppHeaderBand24: TppHeaderBand;
    ppLabel129: TppLabel;
    ppLine60: TppLine;
    ppLabel142: TppLabel;
    ppLine61: TppLine;
    LbPer11: TppLabel;
    ppLabel145: TppLabel;
    ppLabel147: TppLabel;
    ppLabel149: TppLabel;
    ppLabel151: TppLabel;
    DetNFxCustAgreg: TppDetailBand;
    ppDBText48: TppDBText;
    ppDBText50: TppDBText;
    ppDBText57: TppDBText;
    ppDBText59: TppDBText;
    ppFooterBand24: TppFooterBand;
    ppCalc46: TppSystemVariable;
    ppLabel152: TppLabel;
    ppCalc47: TppSystemVariable;
    ppLine62: TppLine;
    ppGroup10: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppDBText60: TppDBText;
    ppLabel154: TppLabel;
    ppGroupFooterBand8: TppGroupFooterBand;
    RptNFxCustAgregDBText1: TppDBText;
    RptNFxCustAgregDBText3: TppDBText;
    RptNFxCustAgregDBText4: TppDBText;
    RptNFxCustAgregDBText2: TppDBText;
    RptNFxCustAgregDBText5: TppDBText;
    RptNFxCustAgregLabel1: TppLabel;
    RptNFxCustAgregDBText6: TppDBText;
    RptNFxCustAgregLabel2: TppLabel;
    RptNFxCustAgregLabel3: TppLabel;
    RptNFxCustAgregLabel4: TppLabel;
    RptNFxCustAgregLabel5: TppLabel;
    RptNFxCustAgregLabel6: TppLabel;
    RptNFxCustAgregLine1: TppLine;
    BdeExtMovUC: TppBDEPipeline;
    dsExtMovUC: TwwDataSource;
    qryExtMovUC: TwwQuery;
    RptExtMovUC: TppReport;
    ppHeaderBand25: TppHeaderBand;
    ppLabel143: TppLabel;
    ppLabel150: TppLabel;
    ppLabel153: TppLabel;
    LbUnCusteio: TppLabel;
    LbPer12: TppLabel;
    ppDetailBand19: TppDetailBand;
    ppDBText58: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppFooterBand25: TppFooterBand;
    ppCalc48: TppSystemVariable;
    ppLabel157: TppLabel;
    ppCalc49: TppSystemVariable;
    ppLine63: TppLine;
    ppGroup11: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppLine64: TppLine;
    ppLabel158: TppLabel;
    ppLabel159: TppLabel;
    ppLine65: TppLine;
    ppLabel160: TppLabel;
    ppLabel161: TppLabel;
    ppLabel162: TppLabel;
    ppLabel163: TppLabel;
    ppLabel164: TppLabel;
    ppLabel165: TppLabel;
    ppLabel166: TppLabel;
    ppLabel167: TppLabel;
    ppLine66: TppLine;
    ppLine67: TppLine;
    ppLabel168: TppLabel;
    ppLine68: TppLine;
    ppLabel169: TppLabel;
    ppLabel170: TppLabel;
    ppLabel171: TppLabel;
    ppLabel172: TppLabel;
    ppLine69: TppLine;
    ppDBText72: TppDBText;
    ppLabel173: TppLabel;
    ppDBText73: TppDBText;
    ppLabel174: TppLabel;
    ppDBText74: TppDBText;
    ppLabel175: TppLabel;
    ppDBText75: TppDBText;
    ppLabel176: TppLabel;
    ppLabel177: TppLabel;
    ppDBText76: TppDBText;
    ppImage1: TppImage;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppShape3: TppShape;
    ppLabel178: TppLabel;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    RptExtMovUCLine1: TppLine;
    RptExtMovUCLine2: TppLine;
    RptExtMovUCLabel1: TppLabel;
    RptExtMovUCDBText1: TppDBText;
    RptExtMovUCDBText2: TppDBText;
    RptExtMovUCLabel2: TppLabel;
    RptExtMovUCLabel3: TppLabel;
    bdeConAlmoxContab: TppBDEPipeline;
    dsConAlmoxContab: TwwDataSource;
    qryConAlmoxContab: TwwQuery;
    RptConAlmoxContab: TppReport;
    ppHeaderBand26: TppHeaderBand;
    ppLabel155: TppLabel;
    ppLine70: TppLine;
    ppLabel156: TppLabel;
    ppDetailBand20: TppDetailBand;
    ppFooterBand26: TppFooterBand;
    ppCalc50: TppSystemVariable;
    ppLine71: TppLine;
    ppLabel179: TppLabel;
    ppCalc51: TppSystemVariable;
    RptConAlmoxContabLine1: TppLine;
    RptConAlmoxContabLine2: TppLine;
    RptConAlmoxContabLine3: TppLine;
    RptConAlmoxContabLine4: TppLine;
    RptConAlmoxContabLabel1: TppLabel;
    RptConAlmoxContabLabel2: TppLabel;
    RptConAlmoxContabLabel3: TppLabel;
    LbPer13: TppLabel;
    RptConAlmoxContabLabel5: TppLabel;
    RptConAlmoxContabLabel6: TppLabel;
    RptConAlmoxContabLabel7: TppLabel;
    RptConAlmoxContabLabel8: TppLabel;
    RptConAlmoxContabLabel9: TppLabel;
    RptConAlmoxContabLabel10: TppLabel;
    RptConAlmoxContabLabel11: TppLabel;
    LbConta: TppLabel;
    RptConAlmoxContabDBText1: TppDBText;
    RptConAlmoxContabLabel4: TppLabel;
    RptConAlmoxContabLabel12: TppLabel;
    LbDif: TppLabel;
    LbInteg: TppLabel;
    RptContInventLine2: TppLine;
    RptContInventDBText7: TppDBText;
    RptContInventDBText8: TppDBText;
    RptContInventLabel7: TppLabel;
    RptContInventDBCalc10: TppDBCalc;
    RptContInventDBCalc1: TppDBCalc;
    RptContInventDBCalc2: TppDBCalc;
    RptContInventDBCalc3: TppDBCalc;
    RptContInventDBCalc5: TppDBCalc;
    RptCustContabLabel15: TppLabel;
    LbCentCust: TppLabel;
    RptCustAnaliLabel1: TppLabel;
    RptCustAnaliDBText3: TppDBText;
    bdeResFinAnual: TppBDEPipeline;
    dsResFinAnual: TwwDataSource;
    qryResFinAnual: TwwQuery;
    RptResFinAnual: TppReport;
    ppHeaderBand27: TppHeaderBand;
    lbTitulo: TppLabel;
    ppLine72: TppLine;
    ppLabel181: TppLabel;
    ppDetailBand21: TppDetailBand;
    ppFooterBand27: TppFooterBand;
    ppCalc52: TppSystemVariable;
    ppLine73: TppLine;
    ppLabel182: TppLabel;
    ppCalc53: TppSystemVariable;
    updResFinAnual: TUpdateSQL;
    RptResFinAnualLine1: TppLine;
    RptResFinAnualLabel1: TppLabel;
    lbCentCust2: TppLabel;
    RptResFinAnualDBText1: TppDBText;
    RptResFinAnualDBText2: TppDBText;
    RptResFinAnualLine2: TppLine;
    RptResFinAnualDBText3: TppDBText;
    RptResFinAnualDBText4: TppDBText;
    RptResFinAnualLine3: TppLine;
    RptResFinAnualDBText5: TppDBText;
    RptResFinAnualDBText6: TppDBText;
    RptResFinAnualLabel3: TppLabel;
    RptResFinAnualLine4: TppLine;
    RptResFinAnualLabel4: TppLabel;
    RptResFinAnualLine5: TppLine;
    RptResFinAnualLabel5: TppLabel;
    RptResFinAnualLabel6: TppLabel;
    RptResFinAnualLine6: TppLine;
    RptResFinAnualLine8: TppLine;
    RptResFinAnualLabel7: TppLabel;
    RptResFinAnualLabel8: TppLabel;
    RptResFinAnualLine9: TppLine;
    RptResFinAnualLabel9: TppLabel;
    RptResFinAnualLine10: TppLine;
    RptResFinAnualLabel10: TppLabel;
    RptResFinAnualLine11: TppLine;
    RptResFinAnualLabel11: TppLabel;
    RptResFinAnualLine12: TppLine;
    RptResFinAnualLabel12: TppLabel;
    RptResFinAnualLine13: TppLine;
    RptResFinAnualLabel13: TppLabel;
    RptResFinAnualLine14: TppLine;
    RptResFinAnualLabel14: TppLabel;
    RptResFinAnualLine15: TppLine;
    RptResFinAnualLabel15: TppLabel;
    RptResFinAnualLine16: TppLine;
    RptResFinAnualLabel16: TppLabel;
    RptResFinAnualLine17: TppLine;
    RptResFinAnualLine7: TppLine;
    RptResFinAnualLabel17: TppLabel;
    RptResFinAnualLine18: TppLine;
    RptResFinAnualLabel18: TppLabel;
    RptResFinAnualLabel19: TppLabel;
    RptResFinAnualLine19: TppLine;
    RptResFinAnualDBText7: TppDBText;
    qryResFinAnualCODCENTROCUSTO: TStringField;
    qryResFinAnualCODGRUPOPROD: TStringField;
    qryResFinAnualDESCGRUPOPROD: TStringField;
    qryResFinAnualCODARTIGO: TStringField;
    qryResFinAnualDESCRICAO: TStringField;
    qryResFinAnualUNID: TStringField;
    qryResFinAnualVALJAN: TFloatField;
    qryResFinAnualVALFEV: TFloatField;
    qryResFinAnualVALMAR: TFloatField;
    qryResFinAnualVALABR: TFloatField;
    qryResFinAnualVALMAI: TFloatField;
    qryResFinAnualVALJUN: TFloatField;
    qryResFinAnualVALJUL: TFloatField;
    qryResFinAnualVALAGO: TFloatField;
    qryResFinAnualVALSEB: TFloatField;
    qryResFinAnualVALOUT: TFloatField;
    qryResFinAnualVALNOV: TFloatField;
    qryResFinAnualVALDEZ: TFloatField;
    qryResFinAnualVALTOT: TFloatField;
    qryResFinAnualQTDEJAN: TFloatField;
    qryResFinAnualQTDEFEV: TFloatField;
    qryResFinAnualQTDEMAR: TFloatField;
    qryResFinAnualQTDEABR: TFloatField;
    qryResFinAnualQTDEMAI: TFloatField;
    qryResFinAnualQTDEJUN: TFloatField;
    qryResFinAnualQTDEJUL: TFloatField;
    qryResFinAnualQTDEAGO: TFloatField;
    qryResFinAnualQTDESEB: TFloatField;
    qryResFinAnualQTDEOUT: TFloatField;
    qryResFinAnualQTDENOV: TFloatField;
    qryResFinAnualQTDEDEZ: TFloatField;
    qryResFinAnualQTDETOT: TFloatField;
    RptResFinAnualDBText8: TppDBText;
    RptResFinAnualDBText9: TppDBText;
    RptResFinAnualDBText10: TppDBText;
    RptResFinAnualDBText11: TppDBText;
    RptResFinAnualDBText12: TppDBText;
    RptResFinAnualDBText13: TppDBText;
    RptResFinAnualDBText14: TppDBText;
    RptResFinAnualDBText15: TppDBText;
    RptResFinAnualDBText16: TppDBText;
    RptResFinAnualDBText17: TppDBText;
    RptResFinAnualDBText18: TppDBText;
    RptResFinAnualDBText19: TppDBText;
    RptResFinAnualDBText20: TppDBText;
    RptResFinAnualDBText21: TppDBText;
    RptResFinAnualDBText22: TppDBText;
    RptResFinAnualDBText23: TppDBText;
    RptResFinAnualDBText24: TppDBText;
    RptResFinAnualDBText25: TppDBText;
    RptResFinAnualDBText26: TppDBText;
    RptResFinAnualDBText27: TppDBText;
    RptResFinAnualDBText28: TppDBText;
    RptResFinAnualDBText29: TppDBText;
    RptResFinAnualDBText30: TppDBText;
    RptResFinAnualDBText31: TppDBText;
    RptResFinAnualDBText32: TppDBText;
    RptResFinAnualDBText33: TppDBText;
    RptResFinAnualLine20: TppLine;
    RptResFinAnualLabel20: TppLabel;
    RptResFinAnualDBCalc1: TppDBCalc;
    RptResFinAnualDBCalc2: TppDBCalc;
    RptResFinAnualDBCalc3: TppDBCalc;
    RptResFinAnualDBCalc4: TppDBCalc;
    RptResFinAnualDBCalc5: TppDBCalc;
    RptResFinAnualDBCalc6: TppDBCalc;
    RptResFinAnualDBCalc7: TppDBCalc;
    RptResFinAnualDBCalc8: TppDBCalc;
    RptResFinAnualDBCalc9: TppDBCalc;
    RptResFinAnualDBCalc10: TppDBCalc;
    RptResFinAnualDBCalc11: TppDBCalc;
    RptResFinAnualDBCalc12: TppDBCalc;
    RptResFinAnualDBCalc13: TppDBCalc;
    RptResFinAnualLine21: TppLine;
    RptResFinAnualLine22: TppLine;
    RptResFinAnualLabel21: TppLabel;
    RptResFinAnualDBCalc14: TppDBCalc;
    RptResFinAnualDBCalc15: TppDBCalc;
    RptResFinAnualDBCalc16: TppDBCalc;
    RptResFinAnualDBCalc17: TppDBCalc;
    RptResFinAnualDBCalc18: TppDBCalc;
    RptResFinAnualDBCalc19: TppDBCalc;
    RptResFinAnualDBCalc20: TppDBCalc;
    RptResFinAnualDBCalc21: TppDBCalc;
    RptResFinAnualDBCalc22: TppDBCalc;
    RptResFinAnualDBCalc23: TppDBCalc;
    RptResFinAnualDBCalc24: TppDBCalc;
    RptResFinAnualDBCalc25: TppDBCalc;
    RptResFinAnualDBCalc26: TppDBCalc;
    RptResFinAnualSummaryBand1: TppSummaryBand;
    RptResFinAnualLine23: TppLine;
    RptResFinAnualLabel22: TppLabel;
    RptResFinAnualDBCalc27: TppDBCalc;
    RptResFinAnualDBCalc28: TppDBCalc;
    RptResFinAnualDBCalc29: TppDBCalc;
    RptResFinAnualDBCalc30: TppDBCalc;
    RptResFinAnualDBCalc31: TppDBCalc;
    RptResFinAnualDBCalc32: TppDBCalc;
    RptResFinAnualDBCalc33: TppDBCalc;
    RptResFinAnualDBCalc34: TppDBCalc;
    RptResFinAnualDBCalc35: TppDBCalc;
    RptResFinAnualDBCalc36: TppDBCalc;
    RptResFinAnualDBCalc37: TppDBCalc;
    RptResFinAnualDBCalc38: TppDBCalc;
    RptResFinAnualDBCalc39: TppDBCalc;
    rptResFinanCCDBText4: TppDBText;
    rptResFinanCCDBText5: TppDBText;
    rptResFinanCCDBText6: TppDBText;
    rptResFinanCCDBText7: TppDBText;
    RptResFinAnualLine24: TppLine;
    qryResFinAnualNOME: TStringField;
    RptResFinAnualLabel2: TppLabel;
    lbGrpProd: TppLabel;
    bdeSalEstMin: TppBDEPipeline;
    dsSalEstMin: TwwDataSource;
    qrySalEstMin: TwwQuery;
    RptSalEstMin: TppReport;
    ppHeaderBand28: TppHeaderBand;
    ppLabel122: TppLabel;
    ppLine74: TppLine;
    ppLabel126: TppLabel;
    ppDetailBand22: TppDetailBand;
    ppFooterBand28: TppFooterBand;
    ppCalc54: TppSystemVariable;
    ppLine75: TppLine;
    ppLabel131: TppLabel;
    ppCalc55: TppSystemVariable;
    RptSalEstMinLine1: TppLine;
    RptSalEstMinLabel1: TppLabel;
    RptSalEstMinLabel2: TppLabel;
    RptSalEstMinLabel4: TppLabel;
    RptSalEstMinLabel5: TppLabel;
    lbAlmox12: TppLabel;
    LbGrupo2: TppLabel;
    RptSalEstMinDBText1: TppDBText;
    RptSalEstMinDBText2: TppDBText;
    RptSalEstMinDBText3: TppDBText;
    RptSalEstMinLabel6: TppLabel;
    RptSalEstMinDBText5: TppDBText;
    RptSalEstMinLabel8: TppLabel;
    RptSalEstMinDBText4: TppDBText;
    RptCustAnaliDBCalc6: TppDBCalc;
    RptCustAnaliDBText4: TppDBText;
    RptCustAnaliDBText5: TppDBText;
    RptCustAnaliDBText6: TppDBText;
    RptCustAnaliDBText7: TppDBText;
    RptConAlmoxContabDBText2: TppDBText;
    RptConAlmoxContabDBText3: TppDBText;
    RptConAlmoxContabDBText4: TppDBText;
    RptConAlmoxContabDBText5: TppDBText;
    RptConAlmoxContabDBText6: TppDBText;
    RptConAlmoxContabDBText7: TppDBText;
    bdeReqCad: TppBDEPipeline;
    dsReqCad: TwwDataSource;
    qryReqCad: TwwQuery;
    RptReqCad: TppReport;
    ppHeaderBand29: TppHeaderBand;
    ppLabel180: TppLabel;
    ppLine76: TppLine;
    ppLabel183: TppLabel;
    ppLine77: TppLine;
    ppLabel184: TppLabel;
    ppLabel185: TppLabel;
    ppLabel186: TppLabel;
    ppLabel187: TppLabel;
    LbCCust: TppLabel;
    ppLabel190: TppLabel;
    ppDetailBand23: TppDetailBand;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppFooterBand29: TppFooterBand;
    ppCalc56: TppSystemVariable;
    ppLabel192: TppLabel;
    ppCalc57: TppSystemVariable;
    RptReqCadLabel1: TppLabel;
    RptReqCadLine1: TppLine;
    RptReqCadDBText1: TppDBText;
    RptReqCadLabel2: TppLabel;
    RptReqCadDBText2: TppDBText;
    LbPer15: TppLabel;
    RptReqCadLabel3: TppLabel;
    RptReqCadLabel4: TppLabel;
    RptReqCadDBText3: TppDBText;
    RptReqCadDBText4: TppDBText;
    RptReqCadLabel5: TppLabel;
    RptReqCadDBText5: TppDBText;
    RptReqCadLine2: TppLine;
    RptReqCadLabel6: TppLabel;
    RptReqCadDBCalc1: TppDBCalc;
    RptReqCadShape1: TppShape;
    RptReqCadLine3: TppLine;
    RptReqCadLine4: TppLine;
    RptReqCadLine5: TppLine;
    LbAssinatura1: TppLabel;
    LbAssinatura2: TppLabel;
    LbAssinatura3: TppLabel;
    LbAssinatura4: TppLabel;
    rptResFinanCCDBText8: TppDBText;
    RptExtMovSintDBText5: TppDBText;
    RptExtMovSintLabel7: TppLabel;
    RptExtMovSintLine5: TppLine;
    RptExtMovSintLabel8: TppLabel;
    RptExtMovSintLabel9: TppLabel;
    RptExtMovSintLabel10: TppLabel;
    RptExtMovSintDBCalc7: TppDBCalc;
    RptExtMovSintDBCalc8: TppDBCalc;
    RptConAlmoxContabSummaryBand1: TppSummaryBand;
    RptConAlmoxContabLabel13: TppLabel;
    RptConAlmoxContabDBCalc1: TppDBCalc;
    RptConAlmoxContabDBCalc2: TppDBCalc;
    RptConAlmoxContabDBCalc3: TppDBCalc;
    RptConAlmoxContabDBCalc4: TppDBCalc;
    RptConAlmoxContabDBCalc5: TppDBCalc;
    RptConAlmoxContabDBCalc6: TppDBCalc;
    bdeTotFinanc: TppBDEPipeline;
    dsTotFinanc: TwwDataSource;
    qryTotFinanc: TwwQuery;
    RptTotFinanc: TppReport;
    ppHeaderBand30: TppHeaderBand;
    ppLabel188: TppLabel;
    ppLine78: TppLine;
    ppLabel189: TppLabel;
    ppDetailBand24: TppDetailBand;
    ppFooterBand30: TppFooterBand;
    ppCalc58: TppSystemVariable;
    ppLine79: TppLine;
    ppLabel191: TppLabel;
    ppCalc59: TppSystemVariable;
    LbPer16: TppLabel;
    LbDisplay: TppLabel;
    LbUnCusteio2: TppLabel;
    RptTotFinancLabel2: TppLabel;
    RptTotFinancLine1: TppLine;
    RptTotFinancLabel3: TppLabel;
    RptTotFinancLine2: TppLine;
    RptTotFinancLabel4: TppLabel;
    RptTotFinancLabel5: TppLabel;
    RptTotFinancLabel6: TppLabel;
    RptTotFinancLabel7: TppLabel;
    RptTotFinancSummaryBand1: TppSummaryBand;
    RptTotFinancLabel8: TppLabel;
    RptTotFinancDBText1: TppDBText;
    RptTotFinancDBText2: TppDBText;
    RptTotFinancDBText3: TppDBText;
    RptTotFinancDBText4: TppDBText;
    RptTotFinancDBText5: TppDBText;
    RptTotFinancDBCalc1: TppDBCalc;
    RptTotFinancDBCalc2: TppDBCalc;
    RptTotFinancDBCalc3: TppDBCalc;
    RptTotFinancDBCalc4: TppDBCalc;
    rptPlanInventLabel8: TppLabel;
    rptPlanInventDBText6: TppDBText;
    rptPlanInventGrpLabel2: TppLabel;
    rptPlanInventGrpDBText3: TppDBText;
    RptPlanProdLabel2: TppLabel;
    RptPlanProdDBText3: TppDBText;
    bdeTermoInvent: TppBDEPipeline;
    dsTermoInvent: TwwDataSource;
    qryTermoInvent: TwwQuery;
    RptTermoInvent: TppReport;
    CabecTermoInvent: TppHeaderBand;
    ppLabel193: TppLabel;
    ppLine80: TppLine;
    ppLabel194: TppLabel;
    ppDetailBand25: TppDetailBand;
    ppFooterBand31: TppFooterBand;
    ppCalc60: TppSystemVariable;
    ppLine81: TppLine;
    ppLabel195: TppLabel;
    ppCalc61: TppSystemVariable;
    RptTermoInvetLabel1: TppLabel;
    RptTermoInvetLabel2: TppLabel;
    RptTermoInvetLabel3: TppLabel;
    RptTermoInvetLabel4: TppLabel;
    RptTermoInvetLabel5: TppLabel;
    RptTermoInvetDBText1: TppDBText;
    RptTermoInvetDBText2: TppDBText;
    RptTermoInvetDBText3: TppDBText;
    RptTermoInvetDBText4: TppDBText;
    RptTermoInvetDBText5: TppDBText;
    RptTermoInvetSummaryBand1: TppSummaryBand;
    RptTermoInvetLabel6: TppLabel;
    RptTermoInventTitleBand1: TppTitleBand;
    RptTermoInventChildReport1Label1: TppLabel;
    LbDataAbre: TppLabel;
    MemAbre: TppRichText;
    MemFecha: TppRichText;
    qryABCComp: TwwQuery;
    dsABCComp: TwwDataSource;
    BdeABCComp: TppBDEPipeline;
    RptABCComp: TppReport;
    ppHeaderBand31: TppHeaderBand;
    ppReport1Shape1: TppShape;
    ppLabel196: TppLabel;
    ppLabel197: TppLabel;
    ppLabel198: TppLabel;
    ppLabel199: TppLabel;
    ppLabel200: TppLabel;
    ppReport1Label7: TppLabel;
    ppReport1Label9: TppLabel;
    ppReport1DBText7: TppDBText;
    ppReport1Label5: TppLabel;
    rpABCLabel5: TppLabel;
    rpABCLabel7: TppLabel;
    LbGrupo3: TppLabel;
    ppDetailBand26: TppDetailBand;
    ppDBText81: TppDBText;
    ppReport1DBText9: TppDBText;
    ppReport1DBText10: TppDBText;
    ppDBText82: TppDBText;
    rpABCDBText1: TppDBText;
    rpABCDBText4: TppDBText;
    ppFooterBand32: TppFooterBand;
    ppCalc62: TppSystemVariable;
    ppCalc63: TppSystemVariable;
    ppCalc64: TppSystemVariable;
    ppLine82: TppLine;
    ppLabel201: TppLabel;
    rpABCSummaryBand1: TppSummaryBand;
    rpABCDBCalc4: TppDBCalc;
    rpABCDBCalc5: TppDBCalc;
    rpABCDBCalc6: TppDBCalc;
    rpABCLabel4: TppLabel;
    rpABCGroup2: TppGroup;
    rpABCGroupHeaderBand2: TppGroupHeaderBand;
    rpABCLine3: TppLine;
    rpABCLabel3: TppLabel;
    rpABCDBText3: TppDBText;
    rpABCGroupFooterBand2: TppGroupFooterBand;
    rpABCDBCalc1: TppDBCalc;
    rpABCLine1: TppLine;
    rpABCDBCalc2: TppDBCalc;
    rpABCDBCalc3: TppDBCalc;
    rpABCLabel1: TppLabel;
    rpABCDBText2: TppDBText;
    rpABCLabel2: TppLabel;
    rpABCLine2: TppLine;
    updABCComp: TUpdateSQL;
    qryABCCompGRUPO: TStringField;
    qryABCCompPERCACU: TFloatField;
    qryABCCompCODARTIGO: TStringField;
    qryABCCompDESCICAO: TStringField;
    qryABCCompCODMEDCUSTO: TStringField;
    qryABCCompSALDO: TFloatField;
    qryABCCompVALOR: TFloatField;
    qryABCCompPERC: TFloatField;
    qryABCCompVALORTOT: TFloatField;
    LbPer17: TppLabel;
    RptTotFinancLabel1: TppLabel;
    RptTotFinancDBText6: TppDBText;
    RptTotFinancDBCalc5: TppDBCalc;
    pplSoliComp: TppBDEPipeline;
    dsSoliComp: TwwDataSource;
    qrySoliComp: TwwQuery;
    qrySoliCompNUMSOLCOMPRA: TFloatField;
    qrySoliCompCODCENTROCUSTO: TStringField;
    qrySoliCompDATA: TDateTimeField;
    qrySoliCompIMPRESSO: TStringField;
    qrySoliCompCODARTIGO: TStringField;
    qrySoliCompQTDEPEDIDA: TFloatField;
    qrySoliCompCODMEDIDA: TStringField;
    qrySoliCompSALDOQTDE: TFloatField;
    qrySoliCompESTMAXIMO: TFloatField;
    qrySoliCompSALDO: TFloatField;
    qrySoliCompCODMEDCUSTO: TStringField;
    qrySoliCompCODPRODUTO: TStringField;
    qrySoliCompITEMESTOCAVEL: TStringField;
    qrySoliCompVALORUN: TFloatField;
    qrySoliCompVALORTOTAL: TFloatField;
    qrySoliCompIDPESSOA: TFloatField;
    ppSoliComp: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    lbStatus: TppLabel;
    rpSoliCompLabel7: TppLabel;
    ppDetailBand2: TppDetailBand;
    rpSoliCompDBText4: TppDBText;
    rpSoliCompDBText8: TppDBText;
    rpSoliCompDBText5: TppDBText;
    LbPerPreco: TppLabel;
    rpSoliCompDBText3: TppDBText;
    rpSoliCompDBText12: TppDBText;
    ppSoliCompDBText1: TppDBText;
    ppSoliCompDBText2: TppDBText;
    ppSoliCompDBText4: TppDBText;
    ppSoliCompDBText3: TppDBText;
    ppSoliCompDBText5: TppDBText;
    ppSoliCompDBText6: TppDBText;
    ppSoliCompDBText7: TppDBText;
    ppSoliCompDBText8: TppDBText;
    rpSoliCompDBText11: TppDBText;
    ppFooterBand13: TppFooterBand;
    ppCalc24: TppSystemVariable;
    ppLine25: TppLine;
    ppLabel67: TppLabel;
    ppCalc25: TppSystemVariable;
    rpSoliCompGroup1: TppGroup;
    rpSoliCompGroupHeaderBand1: TppGroupHeaderBand;
    rpSoliCompLine10: TppLine;
    rpSoliCompLabel1: TppLabel;
    rpSoliCompLabel2: TppLabel;
    LbNumSoliComp: TppDBText;
    rpSoliCompDBText2: TppDBText;
    rpSoliCompLabel8: TppLabel;
    rpSoliCompDBText7: TppDBText;
    rpSoliCompLine1: TppLine;
    rpSoliCompLabel9: TppLabel;
    rpSoliCompLine2: TppLine;
    rpSoliCompLabel11: TppLabel;
    rpSoliCompLabel12: TppLabel;
    rpSoliCompLabel13: TppLabel;
    rpSoliCompLabel14: TppLabel;
    rpSoliCompLabel5: TppLabel;
    rpSoliCompLabel17: TppLabel;
    rpSoliCompLabel20: TppLabel;
    rpSoliCompLine3: TppLine;
    rpSoliCompLine4: TppLine;
    rpSoliCompLine5: TppLine;
    rpSoliCompLabel19: TppLabel;
    rpSoliCompLabel22: TppLabel;
    rpSoliCompLabel23: TppLabel;
    rpSoliCompLine6: TppLine;
    rpSoliCompLabel24: TppLabel;
    rpSoliCompLine7: TppLine;
    rpSoliCompLabel25: TppLabel;
    rpSoliCompLabel26: TppLabel;
    ppSoliCompLabel1: TppLabel;
    rpSoliCompLabel31: TppLabel;
    ppSoliCompLabel2: TppLabel;
    rpSoliCompLabel27: TppLabel;
    ppSoliCompLabel3: TppLabel;
    rpSoliCompGroupFooterBand1: TppGroupFooterBand;
    rpSoliCompLine8: TppLine;
    ppReport2Label8: TppLabel;
    ppReport2Label10: TppLabel;
    ppReport2Label9: TppLabel;
    ppLine26: TppLine;
    rpSoliCompLine9: TppLine;
    Lb4Ult: TppLabel;
    rpSoliCompLine11: TppLine;
    rpSoliCompLabel10: TppLabel;
    rpSoliCompLabel35: TppLabel;
    rpSoliCompLabel34: TppLabel;
    rpSoliCompLabel36: TppLabel;
    rpSoliCompLabel38: TppLabel;
    rpSoliCompLabel39: TppLabel;
    rpSoliCompLabel40: TppLabel;
    rpSoliCompLabel41: TppLabel;
    rpSoliCompLabel37: TppLabel;
    rpSoliCompLine12: TppLine;
    rpSoliCompLine13: TppLine;
    rpSoliCompLine14: TppLine;
    rpSoliCompLine15: TppLine;
    rpSoliCompLine16: TppLine;
    rpSoliCompLine17: TppLine;
    rpSoliCompLine18: TppLine;
    rpSoliCompLine19: TppLine;
    rpSoliCompLine20: TppLine;
    rpSoliCompLine21: TppLine;
    rpSoliCompLine22: TppLine;
    rpSoliCompLine23: TppLine;
    rpSoliCompLine24: TppLine;
    rpSoliCompLine25: TppLine;
    rpSoliCompLine26: TppLine;
    rpSoliCompLine27: TppLine;
    rpSoliCompLine28: TppLine;
    rpSoliCompLine29: TppLine;
    rpSoliCompLine30: TppLine;
    rpSoliCompLine31: TppLine;
    rpSoliCompLabel33: TppLabel;
    rpSoliCompLabel45: TppLabel;
    rpSoliCompLabel47: TppLabel;
    rpSoliCompLabel43: TppLabel;
    rpSoliCompLine33: TppLine;
    rpSoliCompLine34: TppLine;
    rpSoliCompLine35: TppLine;
    rpSoliCompLine36: TppLine;
    LbFornA: TppLabel;
    LbFornB: TppLabel;
    LbFornC: TppLabel;
    LbFornD: TppLabel;
    LbTelA: TppLabel;
    LbTelB: TppLabel;
    LbTelC: TppLabel;
    LbTelD: TppLabel;
    qryUltComp: TwwQuery;
    qryUltCompDATA: TDateTimeField;
    qryUltCompCODARTIGO: TStringField;
    qryUltCompFORNECEDOR: TStringField;
    qryUltCompQTDE: TFloatField;
    qryUltCompUNID: TStringField;
    qryUltCompPRECO: TFloatField;
    qryUltCompPRAZO: TFloatField;
    qryUltCompPERIDO: TStringField;
    pplUltComp: TppBDEPipeline;
    dsUltComp: TwwDataSource;
    qryUltForn: TwwQuery;
    qryUltFornFORNECEDOR: TStringField;
    qryUltFornTELEFONE: TStringField;
    qryUltFornDATAOC: TDateTimeField;
    ppUltForn: TppBDEPipeline;
    dsUltForn: TwwDataSource;
    rptReconDBCalc2: TppDBCalc;
    RptCustAnaliLabel2: TppLabel;
    LbGrp: TppLabel;
    RptExtMovSintLabel11: TppLabel;
    RptExtMovSintDBText6: TppDBText;
    qrySoliCompOBSITEMSOLIC: TStringField;
    ppSoliCompDBMemo1: TppDBMemo;
    ppSoliCompLabel4: TppLabel;
    ppSoliCompDBCalc1: TppDBCalc;
    bdeLivroInvent: TppBDEPipeline;
    dsLivroInvent: TwwDataSource;
    qryLivroInvent: TwwQuery;
    RptLivroInvent: TppReport;
    ppHeaderBand32: TppHeaderBand;
    ppLabel202: TppLabel;
    ppLine83: TppLine;
    ppDetailBand27: TppDetailBand;
    ppFooterBand33: TppFooterBand;
    ppPagNo: TppSystemVariable;
    ppLine84: TppLine;
    ppLabel204: TppLabel;
    ppCalc66: TppSystemVariable;
    RptLivroInventLine1: TppLine;
    LbDataRep: TppLabel;
    RptLivroInventLabel2: TppLabel;
    RptLivroInventLabel3: TppLabel;
    RptLivroInventLabel4: TppLabel;
    RptLivroInventLabel5: TppLabel;
    RptLivroInventLine2: TppLine;
    RptLivroInventLine3: TppLine;
    RptLivroInventLine4: TppLine;
    RptLivroInventLine5: TppLine;
    RptLivroInventLabel6: TppLabel;
    RptLivroInventLabel7: TppLabel;
    RptLivroInventLabel8: TppLabel;
    RptLivroInventLine6: TppLine;
    RptLivroInventLabel9: TppLabel;
    lbAlmox14: TppLabel;
    RptLivroInventLabel11: TppLabel;
    RptLivroInventDBText1: TppDBText;
    LbGrp5: TppLabel;
    RptLivroInventDBText2: TppDBText;
    RptLivroInventDBText3: TppDBText;
    RptLivroInventDBText4: TppDBText;
    RptLivroInventDBText5: TppDBText;
    RptLivroInventDBText6: TppDBText;
    RptLivroInventDBText7: TppDBText;
    RptLivroInventDBText8: TppDBText;
    RptLivroInventSummaryBand1: TppSummaryBand;
    RptLivroInventLine7: TppLine;
    RptLivroInventLabel12: TppLabel;
    RptLivroInventDBCalc1: TppDBCalc;
    qrySoliCompCENTROCUSTO: TStringField;
    RptReqCadDBText6: TppDBText;
    RptRecMercSintLabel9: TppLabel;
    RptRecMercSintDBText8: TppDBText;
    RptSugestCompDBText11: TppDBText;
    RptABCCompDBText1: TppDBText;
    RptReqCadLabel7: TppLabel;
    RptReqCadDBText7: TppDBText;
    RptReqCadLabel8: TppLabel;
    RptReqCadDBText8: TppDBText;
    bdeGiroProd: TppBDEPipeline;
    dsGiroProd: TwwDataSource;
    qryGiroProd: TwwQuery;
    RptGiroProd: TppReport;
    ppHeaderBand33: TppHeaderBand;
    ppLabel203: TppLabel;
    ppLine85: TppLine;
    ppLabel205: TppLabel;
    ppDetailBand28: TppDetailBand;
    ppFooterBand34: TppFooterBand;
    ppLine86: TppLine;
    ppLabel206: TppLabel;
    RptGiroProdLine1: TppLine;
    RptGiroProdLabel1: TppLabel;
    RptGiroProdLabel2: TppLabel;
    RptGiroProdLabel3: TppLabel;
    RptGiroProdLabel4: TppLabel;
    RptGiroProdLabel5: TppLabel;
    RptGiroProdLabel6: TppLabel;
    RptGiroProdDBText1: TppDBText;
    RptGiroProdDBText2: TppDBText;
    RptGiroProdDBText3: TppDBText;
    RptGiroProdDBText4: TppDBText;
    RptGiroProdDBText5: TppDBText;
    RptGiroProdDBText6: TppDBText;
    RptGiroProdDBText7: TppDBText;
    LBPERIODO1: TppLabel;
    LBPERIODO2: TppLabel;
    LBPERIODO3: TppLabel;
    RptGiroProdLabel7: TppLabel;
    lbGrupo8: TppLabel;
    RptGiroProdLine2: TppLine;
    RptGiroProdDBText8: TppDBText;
    RptGiroProdDBText9: TppDBText;
    RptReqCadLabel9: TppLabel;
    RptReqCadDBText9: TppDBText;
    RptReqCadLabel10: TppLabel;
    RptReqCadDBText10: TppDBText;
    RptArtSemMovLabel7: TppLabel;
    RptArtSemMovDBText9: TppDBText;
    qrySoliCompCONSUMO: TFloatField;
    ppCalc67: TppSystemVariable;
    ppCalc68: TppSystemVariable;
    LbPagNo: TppLabel;
    ppLine87: TppLine;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppLabel207: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel208: TppLabel;
    bdeRecMercDesemb: TppBDEPipeline;
    dsRecMercDesemb: TwwDataSource;
    qryRecMercDesemb: TwwQuery;
    RptRecMercDesemb: TppReport;
    ppHeaderBand34: TppHeaderBand;
    ppLabel209: TppLabel;
    ppLine88: TppLine;
    ppLabel210: TppLabel;
    ppDetailBand29: TppDetailBand;
    ppFooterBand35: TppFooterBand;
    ppLine89: TppLine;
    ppLabel211: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel212: TppLabel;
    ppLabel213: TppLabel;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppLine90: TppLine;
    ppLabel214: TppLabel;
    ppDBCalc2: TppDBCalc;
    lbPer18: TppLabel;
    bdeReqLancSint: TppBDEPipeline;
    dsReqLancSint: TwwDataSource;
    qryReqLancSint: TwwQuery;
    RptReqLancSint: TppReport;
    ppHeaderBand35: TppHeaderBand;
    ppLabel215: TppLabel;
    ppLine91: TppLine;
    ppLabel216: TppLabel;
    ppDetailBand30: TppDetailBand;
    ppFooterBand36: TppFooterBand;
    ppLine92: TppLine;
    ppLabel217: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppGroup13: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppLine93: TppLine;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppLabel218: TppLabel;
    ppLabel219: TppLabel;
    ppLabel220: TppLabel;
    rpRequisicaoLabel13: TppLabel;
    LbTipo: TppLabel;
    rpExtratoContaLabel10: TppLabel;
    rpRequisicaoLabel10: TppLabel;
    lbData: TppLabel;
    lbAlmox13: TppLabel;
    ppLine94: TppLine;
    ppSummaryBand6: TppSummaryBand;
    ppLine95: TppLine;
    ppLabel222: TppLabel;
    ppDBCalc19: TppDBCalc;
    ppGroup14: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppDBCalc20: TppDBCalc;
    ppLine96: TppLine;
    ppLine97: TppLine;
    ppLabel221: TppLabel;
    ppDBText93: TppDBText;
    qrySoliCompDATAU: TDateTimeField;
    qrySoliCompFORNECEDOR: TStringField;
    qrySoliCompQTDE: TFloatField;
    qrySoliCompUNID: TStringField;
    qrySoliCompPRECO: TFloatField;
    qrySoliCompPRAZO: TFloatField;
    qrySoliCompPERIDO: TStringField;
    qrySoliCompPERCVAR: TFloatField;
    ppSummaryBand7: TppSummaryBand;
    ppLabel223: TppLabel;
    ppLine98: TppLine;
    ppDBCalc21: TppDBCalc;
    ppLabel224: TppLabel;
    ppLabel225: TppLabel;
    ppLine99: TppLine;
    ppLine100: TppLine;
    ppLabel226: TppLabel;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    bdeEtqProduto: TppBDEPipeline;
    dsEtqProduto: TwwDataSource;
    qryEtqProduto: TwwQuery;
    RptEtqProduto: TppReport;
    ppDetailBand31: TppDetailBand;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppDBText97: TppDBText;
    ppLabel227: TppLabel;
    ppLabel228: TppLabel;
    ppDBText98: TppDBText;
    ppLabel229: TppLabel;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppLabel230: TppLabel;
    bdeUltMovArt: TppBDEPipeline;
    dsUltMovArt: TwwDataSource;
    qryUltMovArt: TwwQuery;
    RptUltMovArt: TppReport;
    ppHeaderBand36: TppHeaderBand;
    ppLabel231: TppLabel;
    ppLine102: TppLine;
    ppLabel232: TppLabel;
    ppDetailBand32: TppDetailBand;
    ppFooterBand37: TppFooterBand;
    ppLine103: TppLine;
    ppLabel233: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLine104: TppLine;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppDBText109: TppDBText;
    ppLabel234: TppLabel;
    ppLabel235: TppLabel;
    ppLabel236: TppLabel;
    ppLabel237: TppLabel;
    ppLabel238: TppLabel;
    ppLabel239: TppLabel;
    ppLabel240: TppLabel;
    ppLabel241: TppLabel;
    lbGrupo4: TppLabel;
    lbAlmox15: TppLabel;
    lbData2: TppLabel;
    bdeAjustFinanc: TppBDEPipeline;
    dsAjustFinanc: TwwDataSource;
    qryAjustFinanc: TwwQuery;
    RptAjustFinanc: TppReport;
    ppHeaderBand37: TppHeaderBand;
    ppLabel242: TppLabel;
    ppLine105: TppLine;
    ppLabel243: TppLabel;
    ppDetailBand33: TppDetailBand;
    ppFooterBand38: TppFooterBand;
    ppLine106: TppLine;
    ppLabel244: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppGroup15: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppLine107: TppLine;
    ppDBText110: TppDBText;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    ppLabel245: TppLabel;
    ppLabel246: TppLabel;
    ppLine108: TppLine;
    ppDBText113: TppDBText;
    ppDBText114: TppDBText;
    ppLabel247: TppLabel;
    ppLabel248: TppLabel;
    ppDBText115: TppDBText;
    ppLabel249: TppLabel;
    ppDBText116: TppDBText;
    ppLabel250: TppLabel;
    ppDBText117: TppDBText;
    ppSummaryBand8: TppSummaryBand;
    ppLine109: TppLine;
    ppDBCalc31: TppDBCalc;
    ppDBCalc32: TppDBCalc;
    ppDBCalc33: TppDBCalc;
    ppDBCalc34: TppDBCalc;
    ppDBCalc35: TppDBCalc;
    ppLine110: TppLine;
    ppLabel251: TppLabel;
    ppDBCalc36: TppDBCalc;
    ppDBCalc37: TppDBCalc;
    ppDBCalc38: TppDBCalc;
    ppDBCalc39: TppDBCalc;
    ppDBCalc40: TppDBCalc;
    LbPer: TppLabel;
    ppLabel253: TppLabel;
    LbUnidCust: TppLabel;
    ppDBText118: TppDBText;
    bdeCurvaAltCustoMed: TppBDEPipeline;
    dsCurvaAltCustoMed: TwwDataSource;
    qryCurvaAltCustoMed: TwwQuery;
    RptCurvaAltCustoMed: TppReport;
    ppHeaderBand38: TppHeaderBand;
    ppLabel252: TppLabel;
    ppLine111: TppLine;
    ppLabel254: TppLabel;
    lbPer19: TppLabel;
    rpABCLabel6: TppLabel;
    lbAlmox16: TppLabel;
    ppLabel258: TppLabel;
    lbGrupo5: TppLabel;
    ppLine113: TppLine;
    ppLabel260: TppLabel;
    ppLabel261: TppLabel;
    ppLabel262: TppLabel;
    ppDetailBand34: TppDetailBand;
    ppFooterBand39: TppFooterBand;
    ppLine112: TppLine;
    ppLabel255: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppLabel263: TppLabel;
    ppLabel264: TppLabel;
    ppLabel265: TppLabel;
    ppLabel266: TppLabel;
    ppLabel267: TppLabel;
    ppLabel268: TppLabel;
    ppLabel269: TppLabel;
    ppDBText119: TppDBText;
    ppDBText120: TppDBText;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    ppDBText125: TppDBText;
    ppDBText126: TppDBText;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppGroup16: TppGroup;
    ppGroupHeaderBand13: TppGroupHeaderBand;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppDBText129: TppDBText;
    ppLine114: TppLine;
    ppLabel256: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppGroup17: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppGroupFooterBand14: TppGroupFooterBand;
    ppGroup18: TppGroup;
    ppGroupHeaderBand15: TppGroupHeaderBand;
    ppGroupFooterBand15: TppGroupFooterBand;
    ppLabel257: TppLabel;
    ppDBCalc41: TppDBCalc;
    ppLine115: TppLine;
    ppLine116: TppLine;
    ppLine117: TppLine;
    ppLabel259: TppLabel;
    ppLabel270: TppLabel;
    bdeNotaDifOC: TppBDEPipeline;
    dsNotaDifOC: TwwDataSource;
    qryNotaDifOC: TwwQuery;
    RptNotaDifOC: TppReport;
    ppHeaderBand39: TppHeaderBand;
    ppLabel271: TppLabel;
    ppLine118: TppLine;
    ppLabel272: TppLabel;
    ppDetailBand35: TppDetailBand;
    ppFooterBand40: TppFooterBand;
    ppLine119: TppLine;
    ppLabel273: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    LbPer20: TppLabel;
    ppLine120: TppLine;
    ppDBText130: TppDBText;
    ppGroup12: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppDBText131: TppDBText;
    ppLabel275: TppLabel;
    ppDBText132: TppDBText;
    ppDBText133: TppDBText;
    ppLabel276: TppLabel;
    ppLabel277: TppLabel;
    ppLabel278: TppLabel;
    ppLine121: TppLine;
    ppLine122: TppLine;
    ppLabel279: TppLabel;
    ppDBText134: TppDBText;
    ppLabel280: TppLabel;
    ppLabel281: TppLabel;
    ppDBText135: TppDBText;
    ppDBText136: TppDBText;
    ppLabel282: TppLabel;
    ppLabel283: TppLabel;
    ppLabel284: TppLabel;
    ppDBText137: TppDBText;
    ppDBText138: TppDBText;
    ppLine123: TppLine;
    ppLabel285: TppLabel;
    ppDBText139: TppDBText;
    ppLabel274: TppLabel;
    ppDBText140: TppDBText;
    ppLabel286: TppLabel;
    ppLabel287: TppLabel;
    ppDBText141: TppDBText;
    ppDBText142: TppDBText;
    ppDBText143: TppDBText;
    qrySoliCompPRODUTO: TStringField;
    ppGroup19: TppGroup;
    ppGroupHeaderBand16: TppGroupHeaderBand;
    ppGroupFooterBand16: TppGroupFooterBand;
    procedure DetInVentFFBeforePrint(Sender: TObject);
    procedure RodapeInventFFBeforePrint(Sender: TObject);
    procedure GrpInventFFBeforePrint(Sender: TObject);
    procedure DetReconBeforePrint(Sender: TObject);
    procedure RodapeReconBeforePrint(Sender: TObject);
    procedure GrpReconBeforePrint(Sender: TObject);
    procedure CabecInventDtBeforePrint(Sender: TObject);
    procedure RodapeInventDtBeforePrint(Sender: TObject);
    procedure DetInventDtBeforePrint(Sender: TObject);
    procedure DetInventFBeforePrint(Sender: TObject);
    procedure DetNFxCustAgregBeforePrint(Sender: TObject);
    procedure dtmRptRelatsDestroy(Sender: TObject);
    procedure CabecTermoInventBeforePrint(Sender: TObject);
    procedure Lb4UltPrint(Sender: TObject);
    procedure ppSoliCompPrintingComplete(Sender: TObject);
    procedure LbPagNoPrint(Sender: TObject);
    procedure ppDetailBand30BeforePrint(Sender: TObject);
    procedure RptSolPreProntaPrintingComplete(Sender: TObject);
    procedure RptReqCadPrintingComplete(Sender: TObject);
    procedure rpSoliCompGroupHeaderBand1BeforeGenerate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bConfirmaImpressao : Boolean;
    sNumSoli           : String;
    sCentro            : String;
    iPagNum            : Integer;
    bResumida          : Boolean;
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRptRelats: TdtmRptRelats;

implementation

{$R *.DFM}
Uses uDataBase,DBaseDados,uSiStema,
     FParamExtMov,     FParamInventFF,  FParamResFinanCC, FParamReconEst,
     FPARAMPLANINVENT, fParamContInvent,FParamCustAnali,
     FParamPlanInventGrp,FParamSugestComp,FParamInventFFData,
     FParamSolPrePronta, FParamCadSolPrePronta,FParamSoliComp,
     FParamArtxConta,FParamCustContab,FParamReconSaldo,
     FParamExtMovSint,fParamArtSemMov, FParamPlanProd,
     FParamRecMercSint,FParamConsMed,FParamCustContabSint,
     FParamInventFFHoje,FParamNFxCustAgreg,FParamExtMovUC,
     FParamConAlmoxContab,fParamResFinAnual,fParamSalEstMin,
     FParamReqCad,FParamTotFinanc,FParamTermoInvet,
     FParamABCComp, FParamLivroInvet,FParamGiroProd,
     FParamRecMercDesemb,FParamReqLancSint,fParamEtqProduto,
     FParamUltMovArt,fParamAjustFinanc,FParamCurvaAltCustoMed,
     FParamNotaDifOC;

Function TdtmRptRelats.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     if (UPPERCASE(Form) = 'FRMPARAMEXTMOV') then
          frm := TfrmParamExtMov.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMINVENTFF') then
          frm := TfrmParamInventFF.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMRESFINANCC') then
          frm := TfrmParamResFinanCC.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMRECON') then
          frm := TfrmParamReconEst.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMPLANINVENT') then
          frm := TfrmParamPlanInvent.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMPLANINVENTGRP') then
          frm := TfrmParamPlanInventGrp.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMCONTINVENT') then
          frm := TfrmParamContInvent.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMCUSTANALI') then
          frm := TfrmParamCustAnali.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMSUGESTCOMP') then
          frm := TfrmParamSugestComp.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMINVENTFFDATA') then
          frm := TfrmParamInventFFData.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMSOLPREPRONTA') then
          frm := TfrmParamSolPrePronta.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMCADSOLPREPRONTA') then
          frm := TFrmParamCadSolPrePronta.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMSOLICOMP') then
          frm := TFrmParamSoliComp.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMARTXCONTA') then
          frm := TFrmParamArtxConta.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMCUSTCONTAB') then
          frm := TFrmParamCustContab.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMRECONSALDO') then
          frm := TfrmParamReconSaldo.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMEXTMOVSINT') then
          frm := TfrmParamExtMovSint.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMARTSEMMOV') then
          frm := TfrmParamArtSemMov.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMPLANPROD') then
          frm := TfrmParamPlanProd.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMRECMERCSINT') then
          frm := TfrmParamRecMercSint.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMCONSMED') then
          frm := TfrmParamConsMed.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMCUSTCONTABSINT') then
          frm := TFrmParamCustContabSint.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMINVENTFFHOJE') then
          frm := TfrmParamInventFFHoje.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMNFXCUSTAGREG') then
          frm := TFrmParamNFxCustAgreg.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMEXTMOVUC') then
          frm := TfrmParamExtMovUC.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMCONALMOXCONTAB') then
          frm := TfrmParamConAlmoxContab.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMRESFINANUAL') then
          frm := TfrmParamResFinAnual.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMSALESTMIN') then
          frm := TfrmParamSalEstMin.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMREQCAD') then
          frm := TfrmParamReqCad.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMTOTFINANC') then
          frm := TFrmParamTotFinanc.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMTERMOINVENT') then
          frm := TFrmParamTermoInvent.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMABCCOMP') then
          frm := TFrmParamABCComp.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMLIVROINVENT') then
          frm := TFrmParamLivroInvet.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMGIROPROD') then
          frm := TFrmParamGiroProd.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMRECMERCDESEMB') then
          frm := TFrmParamRecMercDesemb.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMREQLANCSINT') then
          frm := TFrmParamReqLancSint.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMETQPRODUTO') then
          frm := TFrmParamEtqProduto.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMULTMOVART') then
          frm := TFrmParamUltMovArt.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMAJUSTFINANC') then
          frm := TfrmParamAjustFinanc.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMCURVAALTCUSTOMED') then
          frm := TFrmParamCurvaAltCustoMed.Create(Application)
     Else
     if (UPPERCASE(Form) = 'FRMPARAMNOTADIFOC') then
          frm := TFrmParamNotaDifOC.Create(Application)
     Else
        frm := nil;

     if frm = nil then
        Result := false
     else
     begin
        with frm do
          begin
             Result := (ShowModal = mrOk);
             free;
          End;
     End;
End;


procedure TdtmRptRelats.DetInVentFFBeforePrint(Sender: TObject);
begin
  inherited;
  DetInVentFF.Visible := Not QryInventFF.FieldByName('CodArtigo').isNull;
end;

procedure TdtmRptRelats.RodapeInventFFBeforePrint(Sender: TObject);
begin
  inherited;
    RodapeInventFF.Visible := Not QryInventFF.FieldByName('CodArtigo').isNull;
end;

procedure TdtmRptRelats.GrpInventFFBeforePrint(Sender: TObject);
begin
  inherited;
  If QryInventFF.FieldByName('StatusGrupo').asString = 'A' Then
      Begin
         GrpInventFF.Visible := Not QryInventFF.FieldByName('CodArtigo').isNull;
         Lin1.Visible        := False;
      End
  Else
      Lin1.Visible := True;
end;

procedure TdtmRptRelats.DetReconBeforePrint(Sender: TObject);
begin
  inherited;
  If QryRecon.FieldByName('StatusGrupo').asString = 'S' Then
      Begin
         DetRecon.Visible := Not QryRecon.FieldByName('CodArtigo').isNull;
      End
  Else
     DetRecon.Visible := True;
end;

procedure TdtmRptRelats.RodapeReconBeforePrint(Sender: TObject);
begin
  inherited;
  If QryRecon.FieldByName('StatusGrupo').asString = 'S' Then
      Begin
         RodapeRecon.Visible := Not QryRecon.FieldByName('CodArtigo').isNull;
      End
  Else
     RodapeRecon.Visible := True;

end;

procedure TdtmRptRelats.GrpReconBeforePrint(Sender: TObject);
begin
  inherited;
  If QryRecon.FieldByName('StatusGrupo').asString = 'S' Then
      Begin
          LblTotSaldoIni.Visible   := True;
          LblTotRecForn.Visible    := True;
          LblTotDevForn.Visible    := True;
          LblTotBaiTrans.Visible   := True;
          LblTotEntTrans.Visible   := True;
          LblTotBaiEstrago.Visible := True;
          LblTotBaiAcerto.Visible  := True;
          LblTotBaiCC.Visible      := True;
          LblTotSaldoAtual.Visible := True;
      End
  Else
      Begin
          LblTotSaldoIni.Visible   := False;
          LblTotRecForn.Visible    := False;
          LblTotDevForn.Visible    := False;
          LblTotBaiTrans.Visible   := False;
          LblTotEntTrans.Visible   := False;
          LblTotBaiEstrago.Visible := False;
          LblTotBaiAcerto.Visible  := False;
          LblTotBaiCC.Visible      := False;
          LblTotSaldoAtual.Visible := False;
      End;
end;

procedure TdtmRptRelats.CabecInventDtBeforePrint(Sender: TObject);
begin
  inherited;
  If QryInventFFData.FieldByName('StatusGrupo').asString = 'S' Then
      lblTotInventDt.Visible := True
  Else
     lblTotInventDt.Visible := False;

end;

procedure TdtmRptRelats.RodapeInventDtBeforePrint(Sender: TObject);
begin
  inherited;
  If QryInventFFData.FieldByName('StatusGrupo').asString = 'S' Then
     RodapeInventDt.Visible := Not QryInventFFData.FieldByName('CodArtigo').isNull
  Else
     RodapeInventDt.Visible := True;


end;

procedure TdtmRptRelats.DetInventDtBeforePrint(Sender: TObject);
begin
  inherited;
 If QryInventFFData.FieldByName('StatusGrupo').asString = 'S' Then
    DetInventDt.Visible := Not QryInventFFData.FieldByName('CodArtigo').isNull
 Else
    DetInventDt.Visible := True;
end;

procedure TdtmRptRelats.DetInventFBeforePrint(Sender: TObject);
begin
  inherited;
 If QryInventFFHoje.FieldByName('StatusGrupo').asString = 'S' Then
    DetInventF.Visible := Not QryInventFFHoje.FieldByName('CodArtigo').isNull
 Else
    DetInventF.Visible := True;
end;

procedure TdtmRptRelats.DetNFxCustAgregBeforePrint(Sender: TObject);
begin
  inherited;
 If QryNFxCustAgreg.FieldByName('TIPO').IsNull Then
    DetNFxCustAgreg.Visible := False
 Else
    DetNFxCustAgreg.Visible := True;
end;

procedure TdtmRptRelats.dtmRptRelatsDestroy(Sender: TObject);
begin
  inherited;
  if QryResFinAnual.Active Then
    Begin
      If QryResFinAnual.UpdatesPending Then
         QryResFinAnual.CancelUpdates;
      QryResFinAnual.Close;
    End;
End;

procedure TdtmRptRelats.CabecTermoInventBeforePrint(Sender: TObject);
begin
  inherited;
  If RptTermoInvent.PageNo = RptTermoInvent.PageCount Then
     CabecTermoInvent.Visible := False
  Else
     CabecTermoInvent.Visible := True;
end; 

procedure TdtmRptRelats.Lb4UltPrint(Sender: TObject);
Var
   x : LongInt;
begin
  inherited;
  LbFornA.Caption := '';
  LbTelA.Caption  := '';
  LbFornB.Caption := '';
  LbTelB.Caption  := '';
  LbFornC.Caption := '';
  LbTelC.Caption  := '';
  LbFornD.Caption := '';
  LbTelD.Caption  := '';
  If qryUltForn.Active Then
     Begin
        x := 0;     
        qryUltForn.First;
        While Not qryUltForn.Eof Do
          Begin
              Inc(x);
              Case x Of
                 1 : Begin
                        LbFornA.Caption := qryUltFornFORNECEDOR.AsString;
                        LbTelA.Caption  := qryUltFornTELEFONE.AsString;
                     End;
                 2 : Begin
                        LbFornB.Caption := qryUltFornFORNECEDOR.AsString;
                        LbTelB.Caption  := qryUltFornTELEFONE.AsString;
                     End;
                 3 : Begin
                        LbFornC.Caption := qryUltFornFORNECEDOR.AsString;
                        LbTelC.Caption  := qryUltFornTELEFONE.AsString;
                     End;
                 4 : Begin
                        LbFornD.Caption := qryUltFornFORNECEDOR.AsString;
                        LbTelD.Caption  := qryUltFornTELEFONE.AsString;
                     End;
              End;
              qryUltForn.Next;
          End;
     End;
end;

procedure TdtmRptRelats.ppSoliCompPrintingComplete(Sender: TObject);
begin
  inherited;
  Try
      StartTransacao;
      qrySoliComp.First;
      While Not qrySoliComp.EOF Do
         Begin
            If Not ExecutarQuery(DtmBaseDados.qry,'UPDATE SOLICOMP SET IMPRESSO = ''T'' WHERE (NUMSOLCOMPRA = '+IntToStr(qrySoliCompNUMSOLCOMPRA.asInteger)+') ') Then
               Abort;
            qrySoliComp.Next;
         End;
      CommitTransacao;
  Except
      RollBackTransacao;
  End;
end;

procedure TdtmRptRelats.LbPagNoPrint(Sender: TObject);
begin
  inherited;
  LbPagNo.Caption := IntToStr( IPagNum - 1 + StrToInt(ppPagNo.Text)); 
end;

procedure TdtmRptRelats.ppDetailBand30BeforePrint(Sender: TObject);
begin
  inherited;
   If qryReqlancSint.FieldByName('STATUSGRUPO').AsString = 'S' Then
      ppDetailBand30.Visible := False
   Else
      ppDetailBand30.Visible := True;
end;
procedure TdtmRptRelats.RptSolPreProntaPrintingComplete(Sender: TObject);
begin
  inherited;
  Try
     StartTransacao;
     qrySolPrePronta.First;
     While Not qrySolPrePronta.EOF Do
        Begin
           If Not ExecutarQuery(DtmBaseDados.qry,'UPDATE SOLICOMP SET IMPRESSO = ''T'' WHERE (NUMSOLCOMPRA = '+IntToStr(qrySolPrePronta.FieldByName('NUMSOLCOMPRA').asInteger)+') ') Then
              Abort;
           qrySolPrePronta.Next;
        End;
     CommitTransacao;
  Except
     RollBackTransacao;
  End;
end;

procedure TdtmRptRelats.RptReqCadPrintingComplete(Sender: TObject);
begin
  inherited;
  Try
    StartTransacao;
    qryReqCad.First;
    While Not qryReqCad.EOF Do
       Begin
          If Not ExecutarQuery(DtmBaseDados.qry,'UPDATE REQMAT SET IMPRESSO = ''T'' WHERE (NUMREQUISICAO = '+IntToStr(qryReqCad.FieldByName('NUMREQUISICAO').asInteger)+') ') Then
             Abort;
          qryReqCad.Next;
       End;
    CommitTransacao;
  Except
      RollBackTransacao;
      Raise;
  End;
end;

procedure TdtmRptRelats.rpSoliCompGroupHeaderBand1BeforeGenerate(
  Sender: TObject);
begin
  inherited;
  if not bResumida then
     Begin  
        qryUltForn.Close;
        qryUltForn.ParamByName('NUMSOLCOMPRA').AsInteger := qrySoliComp.FieldByName('NUMSOLCOMPRA').AsInteger;
        qryUltForn.ParamByName('IDPESSOA').AsInteger     := Sistema.idEmpresa;
        qryUltForn.Open;
     end
  Else
     qryUltForn.Close;
end;

end.
