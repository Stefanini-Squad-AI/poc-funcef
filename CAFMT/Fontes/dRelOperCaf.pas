unit dRelOperCaf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, Db,
  DBTables, Wwquery, Wwdatsrc,
  ExtCtrls, 
  Mask, ppMemo, ppCtrls, ppBands, ppVar, ppStrtch, ppClass, ppDB, ppPrnabl,
  ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE;

type
  TdtmRelOperCaf = class(TdtmReports)
    updMovPatGrp: TUpdateSQL;
    qryMovPatGrp: TwwQuery;
    dsMovPatGrp: TwwDataSource;
    ppMovPatGrp: TppBDEPipeline;
    rpMovPatGrp: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel69: TppLabel;
    ppLine19: TppLine;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    pplbldata1: TppLabel;
    rbLabel80: TppLabel;
    ppDetailBand10: TppDetailBand;
    rbdbeClasse: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText54: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine20: TppLine;
    ppLabel81: TppLabel;
    rpMovPatGrpLine1: TppLine;
    rbLabel82: TppLabel;
    rpMovPatGrpLabel1: TppLabel;
    qryTermo: TwwQuery;
    dsTermo: TwwDataSource;
    ppTermo: TppBDEPipeline;
    rpTermo: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDetailBand11: TppDetailBand;
    ppFooterBand11: TppFooterBand;
    ppLine22: TppLine;
    ppLabel79: TppLabel;
    rpTermoLabel1: TppLabel;
    rpTermoLabel2: TppLabel;
    rpTextodoTermo: TppMemo;
    rpTermoLine1: TppLine;
    rpTermoLabel4: TppLabel;
    rpTermoLabel5: TppLabel;
    rpTermoLine2: TppLine;
    rpTermoDBText1: TppDBText;
    rpTermoDBText3: TppDBText;
    rpTermoLabel3: TppLabel;
    rpTermoDBText2: TppDBText;
    rpTermoDBText4: TppDBText;
    rpTermoDBText5: TppDBText;
    rpTermoLabel6: TppLabel;
    rpTermoLabel7: TppLabel;
    rpTermoLine3: TppLine;
    rpTermoLine4: TppLine;
    rpTermoLine5: TppLine;
    ppMovBem: TppBDEPipeline;
    dsMovBem: TwwDataSource;
    qryMovBem: TwwQuery;
    rpMovBem: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLabel24: TppLabel;
    ppLine33: TppLine;
    ppLabel38: TppLabel;
    ppDetailBand16: TppDetailBand;
    ppFooterBand16: TppFooterBand;
    ppLine34: TppLine;
    ppLabel39: TppLabel;
    qryMovBemPLACA: TFloatField;
    qryMovBemIDBEM: TFloatField;
    qryMovBemDESCBEM: TStringField;
    qryMovBemCLASSE: TStringField;
    qryMovBemDATAMOVIMENTACAO: TDateTimeField;
    qryMovBemDESCTIPOMOVIMENTACAO: TStringField;
    qryMovBemVALOFI: TFloatField;
    rpMovBemLabel1: TppLabel;
    rpMovBemDBText1: TppDBText;
    rpMovBemLine2: TppLine;
    rpMovBemDBText4: TppDBText;
    rpMovBemDBText5: TppDBText;
    rpMovBemDBText6: TppDBText;
    rpMovBemLabel6: TppLabel;
    rpMovBemLabel7: TppLabel;
    rpMovBemLabel8: TppLabel;
    rpMovBemLabel9: TppLabel;
    ppInvPat: TppBDEPipeline;
    dsInvPat: TwwDataSource;
    qryInvPat: TwwQuery;
    rpInvPat: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppDetailBand17: TppDetailBand;
    ppFooterBand17: TppFooterBand;
    ppLine36: TppLine;
    ppLabel42: TppLabel;
    ppLine35: TppLine;
    rpInvPatLabel1: TppLabel;
    rpInvPatLabel2: TppLabel;
    rpInvPatDBText1: TppDBText;
    rpInvPatDBText2: TppDBText;
    rpInvPatLabel3: TppLabel;
    rpInvPatLabel4: TppLabel;
    rpInvPatLabel5: TppLabel;
    rpInvPatLabel6: TppLabel;
    rpInvPatDBText3: TppDBText;
    rpInvPatDBText4: TppDBText;
    rpInvPatDBText5: TppDBText;
    rpInvPatShape1: TppShape;
    rpInvPatShape2: TppShape;
    rpInvPatShape3: TppShape;
    rpInvPatLabel7: TppLabel;
    rpInvPatLabel8: TppLabel;
    rpInvPatLabel9: TppLabel;
    qryTermoDESCLOCAL: TStringField;
    qryTermoNOMERESP: TStringField;
    qryTermoDESCTIPOAREA: TStringField;
    qryTermoPLACA: TFloatField;
    qryTermoDESBEM: TStringField;
    qryMovPatGrpCLASSE: TStringField;
    qryMovPatGrpDESCGRUPO: TStringField;
    qryMovPatGrpS_A: TStringField;
    qryMovPatGrpSLDANT: TFloatField;
    qryMovPatGrpDEBITOS: TFloatField;
    qryMovPatGrpCREDITOS: TFloatField;
    qryMovPatGrpSLDATU: TFloatField;
    qryMovBemDESCGRUPO: TStringField;
    dsSelBxBens: TwwDataSource;
    ppSelBxBens: TppBDEPipeline;
    qryInvPatDESCLOCAL: TStringField;
    qryInvPatNOMERESP: TStringField;
    qryInvPatDESCCLASSE: TStringField;
    qryInvPatPLACA: TFloatField;
    qryInvPatDESBEM: TStringField;
    ppConsCafContab: TppBDEPipeline;
    dsConsCafContab: TwwDataSource;
    qryConsCafContab: TwwQuery;
    rpConsCafContab: TppReport;
    ppHeaderBand26: TppHeaderBand;
    ppLabel155: TppLabel;
    ppLabel156: TppLabel;
    RptConAlmoxContabLine1: TppLine;
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
    ppDetailBand20: TppDetailBand;
    RptConAlmoxContabDBText2: TppDBText;
    RptConAlmoxContabDBText3: TppDBText;
    RptConAlmoxContabDBText4: TppDBText;
    RptConAlmoxContabDBText5: TppDBText;
    RptConAlmoxContabDBText6: TppDBText;
    RptConAlmoxContabDBText7: TppDBText;
    ppFooterBand26: TppFooterBand;
    ppLine71: TppLine;
    ppLabel179: TppLabel;
    RptConAlmoxContabSummaryBand1: TppSummaryBand;
    RptConAlmoxContabLabel13: TppLabel;
    RptConAlmoxContabDBCalc1: TppDBCalc;
    RptConAlmoxContabDBCalc2: TppDBCalc;
    RptConAlmoxContabDBCalc3: TppDBCalc;
    RptConAlmoxContabDBCalc4: TppDBCalc;
    RptConAlmoxContabDBCalc5: TppDBCalc;
    RptConAlmoxContabDBCalc6: TppDBCalc;
    qryConsCafContabDATA: TDateTimeField;
    qryConsCafContabCONTACONTABIL: TStringField;
    qryConsCafContabCENTROCUSTO: TStringField;
    qryConsCafContabVLCONTABDEB: TFloatField;
    qryConsCafContabVLCONTABCRE: TFloatField;
    qryConsCafContabVLCAFDEB: TFloatField;
    qryConsCafContabVLCAFCRE: TFloatField;
    updConsCafContab: TUpdateSQL;
    ppLine70: TppLine;
    rpConsCafContabDBText1: TppDBText;
    rpConsCafContabLabel1: TppLabel;
    rpConsCafContabLabel2: TppLabel;
    rpConsCafContabDBText2: TppDBText;
    rpConsCafContabDBText3: TppDBText;
    qryConsCafContabDIFVALDEB: TFloatField;
    qryConsCafContabDIFVALCRE: TFloatField;
    rpConsCafContabLine1: TppLine;
    rpConsCafContabLine2: TppLine;
    rpConsCafContabLine3: TppLine;
    qryAutSaiMat: TwwQuery;
    dsAutSaiMat: TwwDataSource;
    ppAutSaiMat: TppBDEPipeline;
    rpAutSaiMat: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel3: TppLabel;
    ppLine5: TppLine;
    ppLabel8: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText2: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLabel12: TppLabel;
    qryAutSaiMatPLACA: TFloatField;
    qryAutSaiMatDESBEM: TStringField;
    qryAutSaiMatIDBEM: TFloatField;
    qryAutSaiMatSTPTERMO: TFloatField;
    qryAutSaiMatSTPDATA: TDateTimeField;
    qryAutSaiMatDESCTIPSAITEMP: TStringField;
    qryAutSaiMatDESCDESTINO: TStringField;
    qryAutSaiMatENDERECO: TStringField;
    qryAutSaiMatNOMERESPSAIDA: TStringField;
    qryAutSaiMatSTPOBSERVACOES: TStringField;
    rpAutSaiMatLabel1: TppLabel;
    rpAutSaiMatLabel2: TppLabel;
    rpAutSaiMatLine2: TppLine;
    qryAutSaiMatPUBAUTOR: TStringField;
    qryAutSaiMatPUBEDITORA: TStringField;
    qryAutSaiMatPUBANO: TFloatField;
    rpAutSaiMatLabel3: TppLabel;
    rpAutSaiMatDBText1: TppDBText;
    rpAutSaiMatLabel4: TppLabel;
    rpAutSaiMatDBText2: TppDBText;
    rpAutSaiMatLabel5: TppLabel;
    rpAutSaiMatDBText3: TppDBText;
    rpAutSaiMatLabel6: TppLabel;
    rpAutSaiMatDBText4: TppDBText;
    rpAutSaiMatLabel7: TppLabel;
    rpAutSaiMatDBText5: TppDBText;
    rpAutSaiMatLabel8: TppLabel;
    rpAutSaiMatDBText6: TppDBText;
    rpAutSaiMatLabel9: TppLabel;
    rpAutSaiMatDBText7: TppDBText;
    rpAutSaiMatLine3: TppLine;
    rpAutSaiMatLine4: TppLine;
    rpAutSaiMatLine5: TppLine;
    rpAutSaiMatLine6: TppLine;
    rpAutSaiMatLine7: TppLine;
    rpAutSaiMatLabel10: TppLabel;
    rpAutSaiMatLabel12: TppLabel;
    rpAutSaiMatLine8: TppLine;
    rpAutSaiMatLabel13: TppLabel;
    rpAutSaiMatLabel15: TppLabel;
    rpAutSaiMatLabel16: TppLabel;
    rpAutSaiMatLabel17: TppLabel;
    rpAutSaiMatLabel18: TppLabel;
    rpAutSaiMatLabel19: TppLabel;
    rpAutSaiMatLabel21: TppLabel;
    rpAutSaiMatLine9: TppLine;
    rpAutSaiMatLine10: TppLine;
    rpAutSaiMatLine1: TppLine;
    rpAutSaiMatLine11: TppLine;
    rpAutSaiMatLabel11: TppLabel;
    rpAutSaiMatLabel14: TppLabel;
    rpAutSaiMatLine12: TppLine;
    rpAutSaiMatLabel20: TppLabel;
    rpAutSaiMatLine13: TppLine;
    qryGuiaTransfBem: TwwQuery;
    dsGuiaTransfBem: TwwDataSource;
    ppGuiaTransfBem: TppBDEPipeline;
    rpGuiaTransfBem: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel13: TppLabel;
    ppLine6: TppLine;
    ppLabel15: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText9: TppDBText;
    ppLine7: TppLine;
    ppFooterBand4: TppFooterBand;
    ppLabel16: TppLabel;
    ppLine8: TppLine;
    rpGuiaTransfBemDBMemo1: TppDBMemo;
    rpGuiaTransfBemDBText1: TppDBText;
    rpGuiaTransfBemDBCalc3: TppDBCalc;
    rpGuiaTransfBemMemo1: TppMemo;
    rpGuiaTransfBemLine1: TppLine;
    rpGuiaTransfBemLine2: TppLine;
    rpGuiaTransfBemLine3: TppLine;
    rpGuiaTransfBemLine4: TppLine;
    rpGuiaTransfBemLine5: TppLine;
    rpGuiaTransfBemLine6: TppLine;
    rpGuiaTransfBemMemo2: TppMemo;
    rpGuiaTransfBemLabel1: TppLabel;
    rpGuiaTransfBemLabel2: TppLabel;
    rpGuiaTransfBemLabel3: TppLabel;
    rpGuiaTransfBemLine7: TppLine;
    rpGuiaTransfBemLabel4: TppLabel;
    rpGuiaTransfBemLabel5: TppLabel;
    rpGuiaTransfBemLabel6: TppLabel;
    rpGuiaTransfBemDBCalc1: TppDBCalc;
    rpGuiaTransfBemLine8: TppLine;
    rpGuiaTransfBemLabel7: TppLabel;
    rpGuiaTransfBemLabel8: TppLabel;
    rpGuiaTransfBemLabel9: TppLabel;
    rpGuiaTransfBemLabel10: TppLabel;
    rpGuiaTransfBemLabel11: TppLabel;
    rpGuiaTransfBemLabel12: TppLabel;
    rpGuiaTransfBemLabel13: TppLabel;
    rpGuiaTransfBemLabel14: TppLabel;
    rpGuiaTransfBemLabel15: TppLabel;
    rpGuiaTransfBemDBText2: TppDBText;
    rpGuiaTransfBemDBText3: TppDBText;
    rpGuiaTransfBemDBText4: TppDBText;
    rpGuiaTransfBemDBText5: TppDBText;
    rpGuiaTransfBemDBText6: TppDBText;
    rpGuiaTransfBemDBText7: TppDBText;
    rpGuiaTransfBemDBText8: TppDBText;
    rpGuiaTransfBemLabel16: TppLabel;
    rpGuiaTransfBemLabel17: TppLabel;
    rpGuiaTransfBemDBText9: TppDBText;
    rpGuiaTransfBemDBText10: TppDBText;
    qryGuiaTransfBemTERMOCONJGRUPO: TStringField;
    qryGuiaTransfBemSBXTERMO: TFloatField;
    qryGuiaTransfBemSBXDATA: TDateTimeField;
    qryGuiaTransfBemSBXDTAEXECUTADO: TDateTimeField;
    qryGuiaTransfBemNOMELOCORIG: TStringField;
    qryGuiaTransfBemENDELOCORIG: TStringField;
    qryGuiaTransfBemNOMERSPORIG: TStringField;
    qryGuiaTransfBemNOMELOCDEST: TStringField;
    qryGuiaTransfBemENDELOCDEST: TStringField;
    qryGuiaTransfBemNOMERSPDEST: TStringField;
    qryGuiaTransfBemPLACA: TFloatField;
    qryGuiaTransfBemDESBEM: TStringField;
    qryGuiaTransfBemVALORG: TFloatField;
    rpGuiaTransfBemLine9: TppLine;
    rpGuiaTransfBemLabel18: TppLabel;
    rpGuiaTransfBemLabel19: TppLabel;
    rpGuiaTransfBemLabel20: TppLabel;
    rpGuiaTransfBemLabel21: TppLabel;
    rpGuiaTransfBemLabel22: TppLabel;
    rpGuiaTransfBemLine10: TppLine;
    rpGuiaTransfBemLine11: TppLine;
    rpRelGuiaTransf: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel32: TppLabel;
    ppLine11: TppLine;
    ppLabel33: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppFooterBand5: TppFooterBand;
    ppLine12: TppLine;
    ppLabel34: TppLabel;
    ppRelGuiaTransf: TppBDEPipeline;
    dsRelGuiaTransf: TwwDataSource;
    qryRelGuiaTransf: TwwQuery;
    dsResLevInv: TwwDataSource;
    ppResLevInv: TppBDEPipeline;
    rpResLevInv: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel35: TppLabel;
    ppLine21: TppLine;
    ppLabel36: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppFooterBand6: TppFooterBand;
    ppLine23: TppLine;
    ppLabel37: TppLabel;
    qrySelBxBens: TwwQuery;
    rpSelBxBens: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel14: TppLabel;
    rpSelBxBensLabel1: TppLabel;
    rpSelBxBensLabel2: TppLabel;
    rpSelBxBensLabel3: TppLabel;
    rpSelBxBensLabel4: TppLabel;
    rpSelBxBensLine1: TppLine;
    rpSelBxBensLine2: TppLine;
    rpSelBxBensLabel5: TppLabel;
    rpSelBxBensLabel6: TppLabel;
    rpSelBxBensLabel7: TppLabel;
    rpSelBxBensLabel8: TppLabel;
    rpSelBxBensDBText1: TppDBText;
    rpSelBxBensDBText2: TppDBText;
    rpSelBxBensDBText3: TppDBText;
    rpSelBxBensLabel9: TppLabel;
    rpSelBxBensLabel10: TppLabel;
    rpSelBxBensDBText4: TppDBText;
    rpSelBxBensDBText5: TppDBText;
    rpSelBxBensDBText6: TppDBText;
    rpSelBxBensDBCalc1: TppDBCalc;
    rpSelBxBensDBText7: TppDBText;
    rpSelBxBensDBText9: TppDBText;
    rpSelBxBensDBMemo1: TppDBMemo;
    rpSelBxBensLabel11: TppLabel;
    rpSelBxBensDBCalc2: TppDBCalc;
    rpSelBxBensLine3: TppLine;
    rpSelBxBensLine4: TppLine;
    ppMovAnaPer: TppBDEPipeline;
    dsMovAnaPer: TwwDataSource;
    qryMovAnaPer: TwwQuery;
    rpMovAnaPer: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppLabel95: TppLabel;
    ppLine31: TppLine;
    ppLabel96: TppLabel;
    ppDetailBand14: TppDetailBand;
    ppFooterBand14: TppFooterBand;
    ppLine32: TppLine;
    ppLabel97: TppLabel;
    updSelBxBens: TUpdateSQL;
    updMovAnaPer: TUpdateSQL;
    qrySelBxBensSBXTERMO: TFloatField;
    qrySelBxBensIDSELBAIXA: TFloatField;
    qrySelBxBensSBXPROCESSO: TStringField;
    qrySelBxBensSBXDATA: TDateTimeField;
    qrySelBxBensNOMERESP: TStringField;
    qrySelBxBensNOMEDEST: TStringField;
    qrySelBxBensPLACA: TFloatField;
    qrySelBxBensIDBEM: TFloatField;
    qrySelBxBensIDPESSOA: TFloatField;
    qrySelBxBensDESCBEM: TStringField;
    qrySelBxBensVALAQUIS: TFloatField;
    qrySelBxBensVALCTB: TFloatField;
    qrySelBxBensSBXFLGEXECUTADO: TFloatField;
    qrySelBxBensSBXDTAEXECUTADO: TDateTimeField;
    rpMovAnaPerLabel1: TppLabel;
    rpMovAnaPerLabel2: TppLabel;
    rpMovAnaPerLabel3: TppLabel;
    rpMovAnaPerLabel4: TppLabel;
    rpMovAnaPerLabel5: TppLabel;
    rpMovAnaPerLabel6: TppLabel;
    rpMovAnaPerLabel7: TppLabel;
    rpMovAnaPerDBCalc1: TppDBCalc;
    rpMovAnaPerDBText1: TppDBText;
    rpMovAnaPerDBText2: TppDBText;
    rpMovAnaPerDBText3: TppDBText;
    rpMovAnaPerDBText4: TppDBText;
    rpMovAnaPerDBText5: TppDBText;
    rpMovAnaPerDBMemo1: TppDBMemo;
    rpMovAnaPerLine1: TppLine;
    rpMovAnaPerLabel8: TppLabel;
    rpMovAnaPerDBText6: TppDBText;
    rpMovAnaPerLine2: TppLine;
    rpMovAnaPerLabel9: TppLabel;
    rpMovAnaPerDBCalc2: TppDBCalc;
    rpMovAnaPerSummaryBand1: TppSummaryBand;
    rpMovAnaPerLabel10: TppLabel;
    rpMovAnaPerLine3: TppLine;
    rpMovAnaPerDBCalc3: TppDBCalc;
    rpMovAnaPerLine4: TppLine;
    qryParamContab: TwwQuery;
    dsParamContab: TwwDataSource;
    ppParamContab: TppBDEPipeline;
    rpParamContab: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLine4: TppLine;
    ppLabel9: TppLabel;
    updParamContab: TUpdateSQL;
    rpParamContabLabel1: TppLabel;
    rpParamContabLabel2: TppLabel;
    rpParamContabLabel3: TppLabel;
    rpParamContabLabel4: TppLabel;
    rpParamContabLine1: TppLine;
    rpParamContabDBText1: TppDBText;
    rpParamContabDBMemo1: TppDBMemo;
    rpParamContabDBMemo2: TppDBMemo;
    rpParamContabDBMemo3: TppDBMemo;
    rpParamContabDBMemo4: TppDBMemo;
    rpParamContabLabel5: TppLabel;
    qryParamContabPLACA: TFloatField;
    qryParamContabGRUPOCONTABIL: TStringField;
    qryParamContabCCUSTO: TStringField;
    qryParamContabSUBCONTA: TStringField;
    qryParamContabDESBEM: TStringField;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    ppCalc23: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppCalc5: TppSystemVariable;
    rpAutSaiMatDesBem: TppVariable;
    ppCalc50: TppSystemVariable;
    ppCalc51: TppSystemVariable;
    ppCalc33: TppSystemVariable;
    ppCalc34: TppSystemVariable;
    ppCalc31: TppSystemVariable;
    ppCalc32: TppSystemVariable;
    ppCalc21: TppSystemVariable;
    ppCalc22: TppSystemVariable;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    ppDBText1: TppDBText;
    qryMovBemVALCTB: TFloatField;
    ppLine9: TppLine;
    ppLabel11: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    lblSelecao: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLine10: TppLine;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    qryResLevInv: TwwQuery;
    qrySelBensCustom: TwwQuery;
    dsSelBensCustom: TwwDataSource;
    ppSelBensCustom: TppBDEPipeline;
    rpSelBensCustom: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel19: TppLabel;
    ppLine13: TppLine;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLine15: TppLine;
    ppDetailBand7: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppFooterBand7: TppFooterBand;
    ppLine14: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel31: TppLabel;
    qrySelBensCustomPLACA: TFloatField;
    qrySelBensCustomDESBEM: TStringField;
    qrySelBensCustomDATAULTDEP: TDateTimeField;
    qrySelBensCustomDATAINICIODEP: TDateTimeField;
    qrySelBensCustomIDNOTA: TStringField;
    qrySelBensCustomCOMPLNOTA: TStringField;
    qrySelBensCustomNUMSERIE: TStringField;
    qrySelBensCustomREGISTRO: TStringField;
    qrySelBensCustomCONTROLE: TStringField;
    qrySelBensCustomTAXADEP: TFloatField;
    qrySelBensCustomDESCCCUSTO: TStringField;
    qrySelBensCustomDESCLOCAL: TStringField;
    qrySelBensCustomNOMERESP: TStringField;
    qrySelBensCustomDESCGRUPO: TStringField;
    qrySelBensCustomDESCCONJUNTO: TStringField;
    qrySelBensCustomDTAINCLUSAO: TDateTimeField;
    qrySelBensCustomVALHISTORICO: TFloatField;
    qrySelBensCustomNOMEFORN: TStringField;
    qrySelBensCustomIDOPCIONAL: TStringField;
    qrySelBensCustomDESCCLASSE: TStringField;
    qrySelBensCustomDESCSITUACAO: TStringField;
    qrySelBensCustomVALORG0: TFloatField;
    qrySelBensCustomCMBEM0: TFloatField;
    qrySelBensCustomDEPLANC0: TFloatField;
    qrySelBensCustomCMDEP0: TFloatField;
    qrySelBensCustomVALCTB0: TFloatField;
    qryMovAnaPer2: TwwQuery;
    qryMovAnaPer2PROCESSOAQUIS: TStringField;
    qryMovAnaPer2DESCLOCAL: TStringField;
    qryMovAnaPer2PLACA: TFloatField;
    qryMovAnaPer2IDNOTA: TStringField;
    qryMovAnaPer2VALOFI: TFloatField;
    qryMovAnaPer2DESCBEM: TStringField;
    qryMovAnaPer2IDBEM: TFloatField;
    qryMovAnaPer2IDPESSOA: TFloatField;
    qryMovAnaPer2DATAMOVIMENTACAO: TDateTimeField;
    qryMovAnaPer2IDTIPOMOVIMENTACAO: TFloatField;
    dsMovAnaPer2: TwwDataSource;
    ppMovAnaPer2: TppBDEPipeline;
    ppMovAnaPer2ppField1: TppField;
    ppMovAnaPer2ppField2: TppField;
    ppMovAnaPer2ppField3: TppField;
    ppMovAnaPer2ppField4: TppField;
    ppMovAnaPer2ppField5: TppField;
    ppMovAnaPer2ppField6: TppField;
    ppMovAnaPer2ppField7: TppField;
    ppMovAnaPer2ppField8: TppField;
    ppMovAnaPer2ppField9: TppField;
    ppMovAnaPer2ppField10: TppField;
    rpMovAnaPer2: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppDBCalc1: TppDBCalc;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppFooterBand8: TppFooterBand;
    ppLine16: TppLine;
    ppLabel45: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel46: TppLabel;
    ppLine17: TppLine;
    ppDBCalc2: TppDBCalc;
    ppLine18: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLabel54: TppLabel;
    ppDBText20: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine26: TppLine;
    ppLabel55: TppLabel;
    ppDBCalc3: TppDBCalc;
    qryResLevInvIDINVENTARIOBENS: TFloatField;
    qryResLevInvDATAINILEVANT: TDateTimeField;
    qryResLevInvDATAFIMLEVANT: TDateTimeField;
    qryResLevInvDESCFLGPLACA: TStringField;
    qryResLevInvDESCCONJUNTO_DE: TStringField;
    qryResLevInvDESCLOCAL_DE: TStringField;
    qryResLevInvNOMERESP_DE: TStringField;
    qryResLevInvDESCCONJUNTO_PARA: TStringField;
    qryResLevInvDESCLOCAL_PARA: TStringField;
    qryResLevInvNOMERESP_PARA: TStringField;
    qryResLevInvDESCFLGSITFISICA: TStringField;
    qryResLevInvDESBEM: TStringField;
    qryResLevInvIIBPLACA: TFloatField;
    ppCafObras: TppBDEPipeline;
    dsCafObras: TwwDataSource;
    qryCafObras: TwwQuery;
    rpCafObras: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLine27: TppLine;
    ppLabel61: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel58: TppLabel;
    ppDBText23: TppDBText;
    ppLabel59: TppLabel;
    ppDBText24: TppDBText;
    ppLabel60: TppLabel;
    ppDBText25: TppDBText;
    ppLabel62: TppLabel;
    ppDBText26: TppDBText;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLine28: TppLine;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel80: TppLabel;
    ppLine29: TppLine;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppLine30: TppLine;
    ppDBText31: TppDBText;
    dsTransfPatGrp: TwwDataSource;
    qryTransfPatGrp: TwwQuery;
    updTransfPatGrp: TUpdateSQL;
    qryTransfPatGrpCLASSE: TStringField;
    qryTransfPatGrpDESCGRUPO: TStringField;
    qryTransfPatGrpS_A: TStringField;
    qryTransfPatGrpENTRADAS: TFloatField;
    qryTransfPatGrpSAIDAS: TFloatField;
    qryTransfPatGrpSALDO: TFloatField;
    rpTransfPatGrp: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLine37: TppLine;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLine38: TppLine;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine39: TppLine;
    ppLabel98: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppTransfPatGrp: TppBDEPipeline;
    ppLabel82: TppLabel;
    ppLabel87: TppLabel;
    qryTransfPatGrpA: TwwQuery;
    dsTransfPatGrpA: TwwDataSource;
    ppTransfPatGrpA: TppBDEPipeline;
    rpTransfPatGrpA: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppLine40: TppLine;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLine41: TppLine;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppDetailBand13: TppDetailBand;
    ppDBText34: TppDBText;
    ppDBText39: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppFooterBand13: TppFooterBand;
    ppLine42: TppLine;
    ppLabel112: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    qryTransfPatGrpACODGRUPO: TStringField;
    qryTransfPatGrpACODGRUPOANT: TStringField;
    qryTransfPatGrpAPLACA: TFloatField;
    qryTransfPatGrpAVALORG: TFloatField;
    qryTransfPatGrpADESBEM: TStringField;
    qryTransfPatGrpANOMEGRUPO: TStringField;
    qryTransfPatGrpANOMEGRUPOANT: TStringField;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    qryTransfPatGrpADATAMOVIMENTACAO: TDateTimeField;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppDBText40: TppDBText;
    ppDBText43: TppDBText;
    ppLabel104: TppLabel;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppLabel105: TppLabel;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppDBCalc5: TppDBCalc;
    ppLabel113: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppLine46: TppLine;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    rpMovBemLabel2: TppLabel;
    rpMovBemCalc1: TppVariable;
    rpMovBemDBText2: TppDBText;
    rpMovBemLabel5: TppLabel;
    ppLabel10: TppLabel;
    rpMovBemLabel4: TppLabel;
    rpMovBemLabel3: TppLabel;
    rpMovBemLine1: TppLine;
    qrySelBensCustomIDBEM: TFloatField;
    qrySelBensCustomIDPESSOA: TFloatField;
    ppSummaryBand2: TppSummaryBand;
    ppLine45: TppLine;
    ppDBCalc7: TppDBCalc;
    ppLabel120: TppLabel;
    ppLine47: TppLine;
    ppLabel121: TppLabel;
    qryCafObrasIDCAFOBRA: TFloatField;
    qryCafObrasIDPESSOA: TFloatField;
    qryCafObrasIDMODULO: TFloatField;
    qryCafObrasDESCCAFOBRA: TStringField;
    qryCafObrasDTAINICIOOBRA: TDateTimeField;
    qryCafObrasDTAENCERRAOBRA: TDateTimeField;
    qryCafObrasFLGOBRA: TFloatField;
    qryCafObrasDESCOBRATIPOETAPA: TStringField;
    qryCafObrasDTALANCAMENTO: TDateTimeField;
    qryCafObrasVALOFI: TFloatField;
    qryCafObrasDTANOTA: TDateTimeField;
    qryCafObrasNUMNOTA: TStringField;
    qryCafObrasCOMPLNOTA: TStringField;
    qryCafObrasIDGRUPO: TFloatField;
    qryCafObrasCODSUBCONTA: TFloatField;
    qryCafObrasUNIDNEGOC: TFloatField;
    qryCafObrasDESCGRUPO: TStringField;
    qryCafObrasDESCATIVPROJ: TStringField;
    qryCafObrasNOMESUBCONTA: TStringField;
    qryMovAnaPerDESCLOCAL: TStringField;
    qryMovAnaPerPLACA: TFloatField;
    qryMovAnaPerCODGRUPO: TStringField;
    qryMovAnaPerVALOFI: TFloatField;
    qryMovAnaPerVALCTB: TFloatField;
    qryMovAnaPerNOMEFORNEC: TStringField;
    qryMovAnaPerNOMEDESTIN: TStringField;
    qryMovAnaPerDESCLOCALANT: TStringField;
    qryMovAnaPerDESCBEM: TStringField;
    qryMovAnaPerIDBEM: TFloatField;
    qryMovAnaPerIDPESSOA: TFloatField;
    qryMovAnaPerDATAMOVIMENTACAO: TDateTimeField;
    qryMovAnaPerIDTIPOMOVIMENTACAO: TFloatField;
    procedure rpMovBemCalc1Print(Sender: TObject);
    procedure LblSistemaPrint(Sender: TObject);
    procedure rbdbeClassePrint(Sender: TObject);
    procedure rpAutSaiMatDesBemPrint(Sender: TObject);
    procedure rpSelBxBensDBCalc1GroupBreak(Sender: TObject);
    procedure ppLabel64Print(Sender: TObject);
    procedure ppDetailBand13BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand4BeforePrint(Sender: TObject);
  private
    { Private declarations }
    sGrupoAtual, sGrupoAnt : String;
    //procedure LblEmpresaPrint(Sender: TObject);
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; Override;
  end;

var
  dtmRelOperCaf: TdtmRelOperCaf;

implementation

{$R *.DFM}

uses uMensErro, dBaseDados,  uSistema, fParamMovPatGrp, fParamTermo, fParamMovBem,
     fParamInvPat, fParamSelBxBens, fParamConsCafContab, fParamAutSaiMat,
     fParamGuiaTransfBem, fParamMovAnaPer, fParamContab, fParamResLevInv,
     fParamCadBemCustom, fParamMovAnaPer2, fParamCafObra,
     fParamTransfPatGrp, fParamTransfPatGrpA {fParamRelGuiaTransf};

function TdtmRelOperCaf.MostraParam(Form: string) : boolean;
var
   frm       : TForm;
   bTemParam : Boolean;

begin
   bTemParam := True;
   //-------------------------------------------------------------------------------------
   if (UPPERCASE(Form) = 'FRMPARAMMOVPATGRP') then
      frm := TfrmParamMovPatGrp.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMMOVANAPER') then
      frm := TfrmParamMovAnaPer.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMTERMO') then
      frm := TfrmParamTermo.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMINVPAT') then
      frm := TfrmParamInvPat.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMMOVBEM') then
      frm := TfrmParamMovBem.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMSELBXBENS') then
      frm := TfrmParamSelBxBens.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMCONSCAFCONTAB') then
      frm := TfrmParamConsCafContab.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMAUTSAIMAT') then
      frm := TfrmParamAutSaiMat.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMGUIATRANSFBEM') then
      frm := TfrmParamGuiaTransfBem.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMCONTAB') then
      frm := TfrmParamContab.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMRESLEVINV') then
      frm := TfrmParamResLevInv.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMCADBENSCUSTOM') then
      frm := TfrmParamCadBensCustom.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMCAFOBRA') then
      frm := TfrmParamCafObra.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMMOVANAPER2') then
      frm := TfrmParamMovAnaPer2.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMTRANSFPATGRP') then
      frm := TfrmParamTransfPatGrp.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMTRANSFPATGRPA') then
      frm := TfrmParamTransfPatGrpA.Create(Application)
   {else
   if (UPPERCASE(Form) = 'FRMPARAMRELGUIATRANSF') then
      frm := TfrmParamRelGuiaTransf.Create(Application)}
   else
      frm := nil;
   //-------------------------------------------------------------------------------------
   if frm = nil then
   begin
      Result := not bTemParam;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   with frm do
   begin
      Result := (ShowModal = mrOk);
      free;
   end;
end;

procedure TdtmRelOperCaf.LblSistemaPrint(Sender: TObject);
begin
   //Impressão do Nome do Módulo + Versão no Rodapé do Relatório
   (Sender as TppLabel).Caption := Sistema.NomeAplicativo + ' - ' + Sistema.Versao;
end;

//procedure TdtmRelOperCaf.LblEmpresaPrint(Sender: TObject);
//begin
//  inherited;
//  //Impressão do Nome da Empresa No Cabeçalho do Relatório
//end;

procedure TdtmRelOperCaf.rpMovBemCalc1Print(Sender: TObject);
begin
   inherited;
   rpMovBemCalc1.Text := qryMovBemPLACA.AsString;
end;
//========================================================================================
procedure TdtmRelOperCaf.rbdbeClassePrint(Sender: TObject);
begin
   inherited;
   if qryMovPatGrpS_A.AsString = 'S' then
   begin
      rbdbeClasse.Font.Style := [fsBold];
      ppDbText48.Font.Style  := [fsBold];
      ppDbText54.Font.Style  := [fsBold];
      ppDbText49.Font.Style  := [fsBold];
      ppDbText50.Font.Style  := [fsBold];
      ppDbText51.Font.Style  := [fsBold];
      ppDbText52.Font.Style  := [fsBold];
   end else
   begin
      rbdbeClasse.Font.Style := [];
      ppDbText48.Font.Style  := [];
      ppDbText54.Font.Style  := [];
      ppDbText49.Font.Style  := [];
      ppDbText50.Font.Style  := [];
      ppDbText51.Font.Style  := [];
      ppDbText52.Font.Style  := [];
   end;
end;
//========================================================================================
procedure TdtmRelOperCaf.rpAutSaiMatDesBemPrint(Sender: TObject);
begin
   inherited;
   rpAutSaiMatDesBem.Text := trim(qryAutSaiMatDESBEM.AsString);
   //-------------------------------------------------------------------------------------
   if not (qryAutSaiMatPUBAUTOR.IsNull) then
      rpAutSaiMatDesBem.Text := rpAutSaiMatDesBem.Text + ' Autor : ' + trim(qryAutSaiMatPUBAUTOR.AsString);
   //-------------------------------------------------------------------------------------
   if not (qryAutSaiMatPUBEDITORA.IsNull) then
      rpAutSaiMatDesBem.Text := rpAutSaiMatDesBem.Text + ' Editora : ' + trim(qryAutSaiMatPUBEDITORA.AsString);
   //-------------------------------------------------------------------------------------
   if not (qryAutSaiMatPUBANO.IsNull) then
      rpAutSaiMatDesBem.Text := rpAutSaiMatDesBem.Text + ' Ano de Publicação : ' + trim(qryAutSaiMatPUBANO.AsString);
end;

procedure TdtmRelOperCaf.rpSelBxBensDBCalc1GroupBreak(Sender: TObject);
begin
   inherited;
   rpSelBxBensDBCalc1.Value := 0;
end;

procedure TdtmRelOperCaf.ppLabel64Print(Sender: TObject);
begin
   inherited;
   if qryCafObras.FieldByName('FLGOBRA').AsInteger = 1 then
      ppLabel64.Caption := 'Encerrado em ' + qryCafObras.FieldByName('DTAENCERRAOBRA').AsString
   else
      ppLabel64.Caption := 'Em Aberto';
end;

procedure TdtmRelOperCaf.ppDetailBand13BeforePrint(Sender: TObject);
begin
   inherited;
   sGrupoAtual := Trim(FormatMaskText(ppDBText40.DisplayFormat,qryTransfPatGrpA.FieldByName('CODGRUPO').AsString));
   sGrupoAnt   := Trim(FormatMaskText(ppDBText40.DisplayFormat,qryTransfPatGrpA.FieldByName('CODGRUPOANT').AsString));
end;

procedure TdtmRelOperCaf.ppGroupFooterBand4BeforePrint(Sender: TObject);
begin
   inherited;
   ppLabel114.Caption := sGrupoAnt;
   ppLabel115.Caption := sGrupoAtual;
   ppLabel117.Caption := sGrupoAtual;
end;

end.
