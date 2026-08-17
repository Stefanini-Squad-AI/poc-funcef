unit dRelBalCaf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports,  Db,
  DBTables, Wwquery, Wwdatsrc,
  ExtCtrls,
  daDataModule, ppVar, ppStrtch, ppMemo, ppBands, ppClass, ppCtrls, ppDB,
  ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE;

type
  TdtmRelBalCaf = class(TdtmReports)
    qryBalPatBem: TwwQuery;
    dsBalPatBem: TwwDataSource;
    ppBalPatBem: TppBDEPipeline;
    rpBalPatBem: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel60: TppLabel;
    ppLine13: TppLine;
    ppLabel61: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppFooterBand7: TppFooterBand;
    ppLine14: TppLine;
    ppLabel62: TppLabel;
    rpBemResumLabel2: TppLabel;
    rpBemResumLabel3: TppLabel;
    rpBemResumLabel4: TppLabel;
    rpBemResumLabel5: TppLabel;
    rpBemResumLabel6: TppLabel;
    rpBemResumLabel7: TppLabel;
    rpBemResumLabel8: TppLabel;
    rpBemResumLabel9: TppLabel;
    rpBemResumLabel10: TppLabel;
    rpBemResumLabel11: TppLabel;
    rpBemResumLabel12: TppLabel;
    rpBemResumDBText2: TppDBText;
    rpBemResumDBText3: TppDBText;
    rpBemResumDBText4: TppDBText;
    rpBemResumDBText5: TppDBText;
    rpBemResumDBText6: TppDBText;
    rpBemResumDBText7: TppDBText;
    rpBemResumDBText8: TppDBText;
    rpBemResumDBText9: TppDBText;
    rpBemResumDBText10: TppDBText;
    rpBemResumDBText11: TppDBText;
    rpBemResumDBText12: TppDBText;
    rpBemResumLine1: TppLine;
    rpBemResumLabel13: TppLabel;
    rpBemResumDBText13: TppDBText;
    rpBemResumLabel1: TppLabel;
    rpBemResumDBText1: TppDBText;
    rpBemResumLine2: TppLine;
    rpBemResumDBCalc1: TppDBCalc;
    rpBemResumDBCalc2: TppDBCalc;
    rpBemResumDBCalc3: TppDBCalc;
    rpBemResumDBCalc4: TppDBCalc;
    rpBemResumDBCalc5: TppDBCalc;
    rpBemResumDBCalc6: TppDBCalc;
    rpBemResumLabel14: TppLabel;
    rpBemResumLabel15: TppLabel;
    rpBemResumLabel16: TppLabel;
    rpBemResumLabel17: TppLabel;
    rpBemResumLabel18: TppLabel;
    rpBemResumLabel19: TppLabel;
    rpBemResumLine3: TppLine;
    rpBemResumSummaryBand1: TppSummaryBand;
    rpBemResumLabel20: TppLabel;
    rpBemResumLabel21: TppLabel;
    rpBemResumLabel22: TppLabel;
    rpBemResumLabel23: TppLabel;
    rpBemResumDBCalc7: TppDBCalc;
    rpBemResumDBCalc8: TppDBCalc;
    rpBemResumDBCalc9: TppDBCalc;
    rpBemResumLabel24: TppLabel;
    rpBemResumLabel25: TppLabel;
    rpBemResumLabel26: TppLabel;
    rpBemResumDBCalc10: TppDBCalc;
    rpBemResumDBCalc11: TppDBCalc;
    rpBemResumDBCalc12: TppDBCalc;
    rpBemResumLine4: TppLine;
    rpBemResumLabel27: TppLabel;
    rpBemResumLabel28: TppLabel;
    qryBalPatGrp: TwwQuery;
    dsBalPatGrp: TwwDataSource;
    ppBalPatGrp: TppBDEPipeline;
    rpBalPatGrp: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel66: TppLabel;
    ppLine17: TppLine;
    ppLabel67: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppFooterBand9: TppFooterBand;
    ppLine18: TppLine;
    ppLabel68: TppLabel;
    updBalPatGrp: TUpdateSQL;
    rpBalPatGrpLabel1: TppLabel;
    rpBalPatGrpLabel2: TppLabel;
    rpBalPatGrpLabel3: TppLabel;
    rpBalPatGrpLabel4: TppLabel;
    rpBalPatGrpLabel5: TppLabel;
    rpBalPatGrpLabel6: TppLabel;
    rpBalPatGrpLabel7: TppLabel;
    rpBalPatGrpLabel8: TppLabel;
    rpBalPatGrpDBText1: TppDBText;
    rpBalPatGrpDBText2: TppDBText;
    rpBalPatGrpDBText3: TppDBText;
    rpBalPatGrpDBText4: TppDBText;
    rpBalPatGrpDBText5: TppDBText;
    rpBalPatGrpDBText6: TppDBText;
    rpBalPatGrpDBText7: TppDBText;
    rpBalPatGrpDBText8: TppDBText;
    rpBalPatGrpLabel9: TppLabel;
    rpBalPatGrpLabel10: TppLabel;
    qryBalPatGrpIDGRUPO: TFloatField;
    qryBalPatGrpCLASSE: TStringField;
    qryBalPatGrpDESCGRUPO: TStringField;
    qryBalPatGrpS_A: TStringField;
    qryBalPatGrpVALORG: TFloatField;
    qryBalPatGrpCMBEM: TFloatField;
    qryBalPatGrpDEPLANC: TFloatField;
    qryBalPatGrpCMDEP: TFloatField;
    qryBalPatGrpVALCTB: TFloatField;
    rpBalPatBemLabel1: TppLabel;
    rpBalPatBemDBText1: TppDBText;
    rpBalPatBemLabel2: TppLabel;
    rpBalPatBemLabel3: TppLabel;
    rpBalPatBemLabel4: TppLabel;
    rpBalPatBemDBText2: TppDBText;
    rpBalPatBemLabel5: TppLabel;
    rpBalPatBemDBText3: TppDBText;
    rpBalPatBemDBText4: TppDBText;
    updBalPatCC: TUpdateSQL;
    qryBalPatCC: TwwQuery;
    dsBalPatCC: TwwDataSource;
    ppBalPatCC: TppBDEPipeline;
    rpBalPatCC: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLabel17: TppLabel;
    ppLine9: TppLine;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine10: TppLine;
    ppLabel31: TppLabel;
    qryBalPatCCCODCENTROCUSTO: TStringField;
    qryBalPatCCDESCCCUSTO: TStringField;
    qryBalPatCCS_A: TStringField;
    qryBalPatCCVALORG: TFloatField;
    qryBalPatCCCMBEM: TFloatField;
    qryBalPatCCDEPLANC: TFloatField;
    qryBalPatCCCMDEP: TFloatField;
    qryBalPatCCVALCTB: TFloatField;
    rpBemImovel2: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppDetailBand13: TppDetailBand;
    ppLabel47: TppLabel;
    ppDBText1: TppDBText;
    ppDBText8: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppLabel48: TppLabel;
    ppLine24: TppLine;
    ppDBMemo1: TppDBMemo;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppFooterBand13: TppFooterBand;
    ppLine25: TppLine;
    ppLabel49: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLine26: TppLine;
    ppLabel50: TppLabel;
    ppDBText32: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine27: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLabel51: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLine28: TppLine;
    ppDBText33: TppDBText;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel85: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLine29: TppLine;
    ppLabel93: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine30: TppLine;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppLabel94: TppLabel;
    ppBemImovel2: TppBDEPipeline;
    dsBemImovel2: TwwDataSource;
    qryBemImovel2: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField3: TFloatField;
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
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    StringField1: TStringField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    qryBemImovel2IDOPCIONAL: TStringField;
    rpBemImovel2Label1: TppLabel;
    rpBemImovel2DBText1: TppDBText;
    rpBemImovel2Line1: TppLine;
    rpBemImovel2Label2: TppLabel;
    rpBemImovel2DBCalc1: TppDBCalc;
    rpBemImovel2DBCalc2: TppDBCalc;
    rpBemImovel2DBCalc3: TppDBCalc;
    rpBemImovel2DBCalc4: TppDBCalc;
    rpBemImovel2DBCalc5: TppDBCalc;
    rpBemImovel2DBCalc6: TppDBCalc;
    rpBemImovel2DBCalc7: TppDBCalc;
    rpBemImovel2DBCalc8: TppDBCalc;
    rpBemImovel2Line2: TppLine;
    qryBalPatGrpDEPMES: TFloatField;
    rpBalPatGrpDBText9: TppDBText;
    rpBalPatGrpLabel11: TppLabel;
    qryBalPatCCDEPMES: TFloatField;
    ppDBText13: TppDBText;
    rpBalPatCCDBText1: TppDBText;
    rpBalPatCCLabel1: TppLabel;
    qrySldCtbImoveis: TwwQuery;
    dsSldCtbImoveis: TwwDataSource;
    ppSldCtbImoveis: TppBDEPipeline;
    rpSldCtbImoveis: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppLabel98: TppLabel;
    ppLine37: TppLine;
    ppLabel99: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppFooterBand15: TppFooterBand;
    ppLine38: TppLine;
    ppLabel100: TppLabel;
    rpSldCtbImoveisLabel1: TppLabel;
    rpSldCtbImoveisLabel2: TppLabel;
    rpSldCtbImoveisLabel3: TppLabel;
    rpSldCtbImoveisLabel4: TppLabel;
    rpSldCtbImoveisLabel5: TppLabel;
    rpSldCtbImoveisLabel6: TppLabel;
    rpSldCtbImoveisLabel8: TppLabel;
    rpSldCtbImoveisLabel9: TppLabel;
    rpSldCtbImoveisLabel10: TppLabel;
    rpSldCtbImoveisLine1: TppLine;
    rpSldCtbImoveisDBText1: TppDBText;
    rpSldCtbImoveisLine2: TppLine;
    rpSldCtbImoveisDBText2: TppDBText;
    rpSldCtbImoveisLine3: TppLine;
    rpSldCtbImoveisDBText3: TppDBText;
    rpSldCtbImoveisDBText4: TppDBText;
    rpSldCtbImoveisDBText5: TppDBText;
    rpSldCtbImoveisDBText7: TppDBText;
    rpSldCtbImoveisDBText8: TppDBText;
    rpSldCtbImoveisDBText9: TppDBText;
    rpSldCtbImoveisDBCalc1: TppDBCalc;
    rpSldCtbImoveisDBCalc2: TppDBCalc;
    rpSldCtbImoveisDBCalc3: TppDBCalc;
    rpSldCtbImoveisDBCalc4: TppDBCalc;
    rpSldCtbImoveisDBCalc5: TppDBCalc;
    rpSldCtbImoveisDBCalc6: TppDBCalc;
    rpSldCtbImoveisDBCalc7: TppDBCalc;
    rpSldCtbImoveisDBCalc8: TppDBCalc;
    rpSldCtbImoveisDBCalc9: TppDBCalc;
    rpSldCtbImoveisDBCalc10: TppDBCalc;
    rpSldCtbImoveisLine4: TppLine;
    rpSldCtbImoveisLine5: TppLine;
    rpSldCtbImoveisLine6: TppLine;
    rpSldCtbImoveisLabel7: TppLabel;
    rpSldCtbImoveisLabel11: TppLabel;
    rpBalPatGrpLabel12: TppLabel;
    rpSldCtbImoveisLabel12: TppLabel;
    rpSldCtbImoveisDBText6: TppDBText;
    rpSldCtbImoveisDBCalc11: TppDBCalc;
    rpSldCtbImoveisDBCalc12: TppDBCalc;
    rpSldCtbImoveisLabel13: TppLabel;
    rpSldCtbImoveisDBText10: TppDBText;
    rpSldCtbImoveisDBCalc13: TppDBCalc;
    rpSldCtbImoveisDBCalc14: TppDBCalc;
    rpSldCtbImoveisLabel14: TppLabel;
    rpSldCtbImoveisLabel15: TppLabel;
    rpSldCtbImoveisLabel16: TppLabel;
    ppCalc29: TppSystemVariable;
    ppCalc30: TppSystemVariable;
    ppCalc25: TppSystemVariable;
    ppCalc26: TppSystemVariable;
    ppCalc7: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    ppCalc13: TppSystemVariable;
    ppCalc14: TppSystemVariable;
    rpSldCtbImoMestre: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine2: TppLine;
    ppLabel24: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText9: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine5: TppLine;
    ppLabel36: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText41: TppDBText;
    ppLine11: TppLine;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    ppLine12: TppLine;
    ppLabel38: TppLabel;
    ppDBCalc29: TppDBCalc;
    ppDBCalc30: TppDBCalc;
    ppSldCtbImoMestre: TppBDEPipeline;
    dsSldCtbImoMestre: TwwDataSource;
    qrySldCtbImoMestre: TwwQuery;
    ppDBText40: TppDBText;
    ppDBText44: TppDBText;
    rpBemImovel: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    rptCustoContabilLabel2: TppLabel;
    lblDataMov: TppLabel;
    ppDetailBand8: TppDetailBand;
    rptCustoContabilLabel34: TppLabel;
    rptCustoContabilDBText4: TppDBText;
    rptCustoContabilDBText5: TppDBText;
    rptCustoContabilDBText8: TppDBText;
    rptCustoContabilDBText10: TppDBText;
    rptCustoContabilDBText12: TppDBText;
    rptCustoContabilDBText13: TppDBText;
    rptCustoContabilDBText14: TppDBText;
    rptCustoContabilDBText16: TppDBText;
    rptCustoContabilDBText17: TppDBText;
    rptCustoContabilDBText18: TppDBText;
    rptCustoContabilDBText19: TppDBText;
    rptCustoContabilLabel6: TppLabel;
    ppLine15: TppLine;
    rptCustoContabilDBMemo1: TppDBMemo;
    rptCustoContabilDBText7: TppDBText;
    rptCustoContabilDBText9: TppDBText;
    rptCustoContabilDBText11: TppDBText;
    rptCustoContabilDBText3: TppDBText;
    rpBemImovelDBText1: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLine16: TppLine;
    ppLabel65: TppLabel;
    ppCalc15: TppSystemVariable;
    ppCalc16: TppSystemVariable;
    rptCustoContabilGroup2: TppGroup;
    rptCustoContabilGroupHeaderBand2: TppGroupHeaderBand;
    rptCustoContabilLine2: TppLine;
    rptCustoContabilLabel7: TppLabel;
    rptCustoContabilDBText1: TppDBText;
    rptCustoContabilGroupFooterBand2: TppGroupFooterBand;
    rptCustoContabilLine4: TppLine;
    rptCustoContabilDBCalc2: TppDBCalc;
    rptCustoContabilDBCalc3: TppDBCalc;
    rptCustoContabilDBCalc5: TppDBCalc;
    rptCustoContabilDBCalc6: TppDBCalc;
    rptCustoContabilDBCalc12: TppDBCalc;
    rptCustoContabilDBCalc13: TppDBCalc;
    rptCustoContabilDBCalc14: TppDBCalc;
    rptCustoContabilDBCalc16: TppDBCalc;
    rpBemImovelLabel3: TppLabel;
    rptCustoContabilGroup3: TppGroup;
    rptCustoContabilGroupHeaderBand3: TppGroupHeaderBand;
    rptCustoContabilLine3: TppLine;
    rptCustoContabilDBText2: TppDBText;
    rptCustoContabilLabel1: TppLabel;
    rptCustoContabilLabel3: TppLabel;
    rptCustoContabilLabel4: TppLabel;
    rptCustoContabilLabel5: TppLabel;
    rptCustoContabilLabel9: TppLabel;
    rptCustoContabilLabel10: TppLabel;
    rptCustoContabilLabel11: TppLabel;
    rptCustoContabilLabel12: TppLabel;
    rptCustoContabilLabel21: TppLabel;
    rptCustoContabilLabel22: TppLabel;
    rptCustoContabilLabel23: TppLabel;
    rptCustoContabilLabel24: TppLabel;
    rptCustoContabilLabel25: TppLabel;
    rptCustoContabilLabel26: TppLabel;
    rptCustoContabilLabel27: TppLabel;
    rptCustoContabilLine1: TppLine;
    rpBemImovelLabel1: TppLabel;
    rptCustoContabilGroupFooterBand3: TppGroupFooterBand;
    rptCustoContabilLine5: TppLine;
    rptCustoContabilDBCalc1: TppDBCalc;
    rptCustoContabilDBCalc4: TppDBCalc;
    rptCustoContabilDBCalc7: TppDBCalc;
    rptCustoContabilDBCalc8: TppDBCalc;
    rptCustoContabilDBCalc9: TppDBCalc;
    rptCustoContabilDBCalc10: TppDBCalc;
    rptCustoContabilDBCalc11: TppDBCalc;
    rptCustoContabilDBCalc15: TppDBCalc;
    rpBemImovelLabel2: TppLabel;
    ppBemImovel: TppBDEPipeline;
    dsBemImovel: TwwDataSource;
    qryBemImovel: TwwQuery;
    qryBemImovelIDBEM: TFloatField;
    qryBemImovelTAXADEP: TFloatField;
    qryBemImovelDATAULTDEP: TDateTimeField;
    qryBemImovelPLACA: TFloatField;
    qryBemImovelVALORG0: TFloatField;
    qryBemImovelVALREAVACUM0: TFloatField;
    qryBemImovelCMBEMATU0: TFloatField;
    qryBemImovelCMBEMACUM0: TFloatField;
    qryBemImovelDEPLANCATU0: TFloatField;
    qryBemImovelDEPLANCACUM0: TFloatField;
    qryBemImovelCMDEPLANCACUM0: TFloatField;
    qryBemImovelVALCTB0: TFloatField;
    qryBemImovelVALULTREAVACUM1: TFloatField;
    qryBemImovelVALULTCMREAVATU: TFloatField;
    qryBemImovelVALULTCMREAVACUM1: TFloatField;
    qryBemImovelVALULTDEPREAVATU: TFloatField;
    qryBemImovelVALULTDEPREAVACUM1: TFloatField;
    qryBemImovelVALULTCMDEPREAVACUM1: TFloatField;
    qryBemImovelVALCTB1: TFloatField;
    qryBemImovelSUMPARCREAV: TFloatField;
    qryBemImovelSUMCMBEMATU: TFloatField;
    qryBemImovelSUMCMBEMACUM: TFloatField;
    qryBemImovelSUMDEPATU: TFloatField;
    qryBemImovelSUMDEPACUM: TFloatField;
    qryBemImovelSUMCMDEPACUM: TFloatField;
    qryBemImovelSUMVALCTB: TFloatField;
    qryBemImovelDESBEM: TStringField;
    qryBemImovelDESCCONJUNTO: TStringField;
    qryBemImovelDESCGRUPO: TStringField;
    qryBemImovelIDGRUPO: TFloatField;
    qryBemImovelIDCONJUNTO: TFloatField;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText46: TppDBText;
    qrySldCtbImoMestreNOME: TStringField;
    qrySldCtbImoMestreDESCGRUPO: TStringField;
    qrySldCtbImoMestreCUSTOCORR0: TFloatField;
    qrySldCtbImoMestreDEPBEMACUM0: TFloatField;
    qrySldCtbImoMestreDEPBEMATU0: TFloatField;
    qrySldCtbImoMestreTAXADEP: TFloatField;
    qrySldCtbImoMestreCUSTOREAV0: TFloatField;
    qrySldCtbImoMestreDEPREAVACUM0: TFloatField;
    qrySldCtbImoMestreDEPREAVATU0: TFloatField;
    qrySldCtbImoMestreTAXADEPREAV: TFloatField;
    qrySldCtbImoMestreVALCTB0: TFloatField;
    qrySldCtbImoveisIDIMOVELMESTRE: TFloatField;
    qrySldCtbImoveisIDGRUPO: TFloatField;
    qrySldCtbImoveisDESCGRUPO: TStringField;
    qrySldCtbImoveisNOME: TStringField;
    qrySldCtbImoveisIMONOME: TStringField;
    qrySldCtbImoveisCUSTOCORR0: TFloatField;
    qrySldCtbImoveisDEPBEMACUM0: TFloatField;
    qrySldCtbImoveisDEPBEMATU0: TFloatField;
    qrySldCtbImoveisTAXADEP: TFloatField;
    qrySldCtbImoveisCUSTOREAV0: TFloatField;
    qrySldCtbImoveisDEPREAVACUM0: TFloatField;
    qrySldCtbImoveisDEPREAVATU0: TFloatField;
    qrySldCtbImoveisTAXADEPREAV: TFloatField;
    qrySldCtbImoveisVALCTB0: TFloatField;
    updBalPatGrpbx: TUpdateSQL;
    qryBalPatGrpBx: TwwQuery;
    FloatField29: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    dsBalPatGrpBx: TwwDataSource;
    ppBalPatGrpBx: TppBDEPipeline;
    rpBalPatGrpBx: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel37: TppLabel;
    ppLine6: TppLine;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel77: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText45: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine7: TppLine;
    ppLabel79: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLine8: TppLine;
    rpBalPatGrpAnal2: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel76: TppLabel;
    ppLine20: TppLine;
    ppLabel81: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel101: TppLabel;
    ppLabel108: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText106: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine21: TppLine;
    ppLabel109: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppSoma11: TppVariable;
    ppLabel110: TppLabel;
    ppLine22: TppLine;
    ppSoma12: TppVariable;
    ppSoma13: TppVariable;
    ppBalPatGrpAnal2: TppBDEPipeline;
    dsBalPatGrpAnal2: TwwDataSource;
    qryBalPatGrpAnal2: TwwQuery;
    updBalPatGrpAnal2: TUpdateSQL;
    ppLabel102: TppLabel;
    ppDBText107: TppDBText;
    ppLabel103: TppLabel;
    ppDBText105: TppDBText;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    qryBalPatGrpAnal2CODHIERARQ: TStringField;
    qryBalPatGrpAnal2DESCRICAO: TStringField;
    qryBalPatGrpAnal2S_A: TStringField;
    qryBalPatGrpAnal2PLACONTA: TStringField;
    qryBalPatGrpAnal2QUANT: TFloatField;
    qryBalPatGrpAnal2VALORG: TFloatField;
    qryBalPatGrpAnal2CMBEM: TFloatField;
    qryBalPatGrpAnal2DEPLANC: TFloatField;
    qryBalPatGrpAnal2CMDEP: TFloatField;
    qryBalPatGrpAnal2VALCTB: TFloatField;
    rpBalPatClas: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel19: TppLabel;
    ppLabel78: TppLabel;
    ppLabel80: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    rpBalPatClasLabelData: TppLabel;
    rpBalPatClasLabel1: TppLabel;
    ppDetailBand2: TppDetailBand;
    rpBalPatClasDBText1: TppDBText;
    rpBalPatClasDBText2: TppDBText;
    rpBalPatClasDBText5: TppDBText;
    rpBalPatClasDBText7: TppDBText;
    rpBalPatClasDBText8: TppDBText;
    rpBalPatClasDBText9: TppDBText;
    rpBalPatClasDBText3: TppDBText;
    rpBalPatClasDBText6: TppDBText;
    rpBalPatClasDBText4: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine4: TppLine;
    ppLabel86: TppLabel;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppSoma1: TppVariable;
    ppLabel75: TppLabel;
    ppLine19: TppLine;
    ppSoma2: TppVariable;
    ppSoma3: TppVariable;
    ppSoma4: TppVariable;
    ppSoma5: TppVariable;
    ppSoma6: TppVariable;
    ppBalPatClas: TppBDEPipeline;
    ppBalPatClasppField1: TppField;
    ppBalPatClasppField2: TppField;
    ppBalPatClasppField3: TppField;
    ppBalPatClasppField4: TppField;
    ppBalPatClasppField5: TppField;
    ppBalPatClasppField6: TppField;
    ppBalPatClasppField7: TppField;
    ppBalPatClasppField8: TppField;
    ppBalPatClasppField9: TppField;
    dsBalPatClas: TwwDataSource;
    qryBalPatClas: TwwQuery;
    qryBalPatClasCODHIERARQ: TStringField;
    qryBalPatClasDESCRICAO: TStringField;
    qryBalPatClasS_A: TStringField;
    qryBalPatClasQUANT: TFloatField;
    qryBalPatClasVALORG: TFloatField;
    qryBalPatClasCMBEM: TFloatField;
    qryBalPatClasDEPLANC: TFloatField;
    qryBalPatClasCMDEP: TFloatField;
    qryBalPatClasVALCTB: TFloatField;
    updBalPatClas: TUpdateSQL;
    ppDBText3: TppDBText;
    ppLabel106: TppLabel;
    ppDBText4: TppDBText;
    ppLabel107: TppLabel;
    ppDBText5: TppDBText;
    qryBalPatGrpQUANT: TFloatField;
    ppLabel111: TppLabel;
    ppDBText6: TppDBText;
    ppLabel112: TppLabel;
    ppDBText7: TppDBText;
    procedure lblDataMovPrint(Sender: TObject);
    procedure LblSistemaPrint(Sender: TObject);
    procedure rpBalPatGrpDBText1Print(Sender: TObject);
    procedure ppDBText10Print(Sender: TObject);
    procedure ppDetailBand2AfterPrint(Sender: TObject);
    procedure rpBalPatClasBeforePrint(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure ppDetailBand4AfterPrint(Sender: TObject);
    procedure ppDetailBand4BeforePrint(Sender: TObject);
    procedure rpBalPatGrpAnal2BeforePrint(Sender: TObject);
  private
    { Private declarations }
    //procedure LblEmpresaPrint(Sender: TObject);
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; Override;
    function strmasktofloat(sNum : String) : Extended;
  end;

var
  dtmRelBalCaf: TdtmRelBalCaf;

implementation

{$R *.DFM}

uses uMensErro, dBaseDados,  uSistema, uAtivoFixo, fParamBemImovel, fParamBalPatGrp,
     fParamBalPatBem, fParamBalPatClas, fParamBalPatCC, fParamBemImovel2,
     fParamSldCtbImovel,fParamSldCtbImoMestre,fParamBalPatGrpBx,fParamBalPatGrpAnal2;

function TdtmRelBalCaf.MostraParam(Form: string) : boolean;
var
   frm       : TForm;
   bTemParam : Boolean;

begin
   bTemParam := True;
   //-------------------------------------------------------------------------------------
   if (UPPERCASE(Form) = 'FRMPARAMBEMIMOVEL') then
      frm := TfrmParamBemImovel.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMBEMIMOVEL2') then
      frm := TfrmParamBemImovel2.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMBALPATBEM') then
      frm := TfrmParamBalPatBem.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMBALPATGRP') then
      frm := TfrmParamBalPatGrp.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMBALPATCLAS') then
      frm := TfrmParamBalPatClas.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMBALPATCC') then
      frm := TfrmParamBalPatCC.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMSLDCTBIMOVEL') then
      frm := TfrmParamSldCtbImovel.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMSLDCTBIMOMESTRE') then
      frm := TfrmParamSldCtbImoMestre.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMBALPATGRPBX') then
      frm := TfrmParamBalPatGrpBx.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMBALPATGRPANAL2') then
      frm := TfrmParamBalPatGrpAnal2.Create(Application)
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

procedure TdtmRelBalCaf.LblSistemaPrint(Sender: TObject);
begin
  //Impressão do Nome do Módulo + Versão no Rodapé do Relatório
 (Sender as TppLabel).Caption := Sistema.NomeAplicativo + ' - ' + Sistema.Versao;
end;

//procedure TdtmRelOperCaf.LblEmpresaPrint(Sender: TObject);
//begin
//  inherited;
//  //Impressão do Nome da Empresa No Cabeçalho do Relatório
//end;

procedure TdtmRelBalCaf.lblDataMovPrint(Sender: TObject);
begin
   inherited;
   lblDataMov.Text := datetostr(qryBemImovel.ParamByName('PDATASLD').AsDateTime);
end;

procedure TdtmRelBalCaf.rpBalPatGrpDBText1Print(Sender: TObject);
begin
   inherited;
   if qryBalPatGrpS_A.AsString = 'S' then
   begin
      rpBalPatGrpDBText1.Font.Style := [fsBold];
      rpBalPatGrpDBText2.Font.Style := [fsBold];
      rpBalPatGrpDBText3.Font.Style := [fsBold];
      rpBalPatGrpDBText4.Font.Style := [fsBold];
      rpBalPatGrpDBText5.Font.Style := [fsBold];
      rpBalPatGrpDBText6.Font.Style := [fsBold];
      rpBalPatGrpDBText7.Font.Style := [fsBold];
      rpBalPatGrpDBText8.Font.Style := [fsBold];
   end else
   begin
      rpBalPatGrpDBText1.Font.Style := [];
      rpBalPatGrpDBText2.Font.Style := [];
      rpBalPatGrpDBText3.Font.Style := [];
      rpBalPatGrpDBText4.Font.Style := [];
      rpBalPatGrpDBText5.Font.Style := [];
      rpBalPatGrpDBText6.Font.Style := [];
      rpBalPatGrpDBText7.Font.Style := [];
      rpBalPatGrpDBText8.Font.Style := [];
   end;
end;
//========================================================================================
procedure TdtmRelBalCaf.ppDBText10Print(Sender: TObject);
begin
   inherited;
   if (qryBalPatCCS_A.AsString = 'S') then
   begin
      ppDBText10.Font.Style := [fsBold];
      ppDBText11.Font.Style := [fsBold];
      ppDBText12.Font.Style := [fsBold];
      ppDBText13.Font.Style := [fsBold];
      ppDBText14.Font.Style := [fsBold];
      ppDBText15.Font.Style := [fsBold];
      ppDBText16.Font.Style := [fsBold];
      ppDBText17.Font.Style := [fsBold];
   end else
   begin
      ppDBText10.Font.Style := [];
      ppDBText11.Font.Style := [];
      ppDBText12.Font.Style := [];
      ppDBText13.Font.Style := [];
      ppDBText14.Font.Style := [];
      ppDBText15.Font.Style := [];
      ppDBText16.Font.Style := [];
      ppDBText17.Font.Style := [];
   end;
end;

function TdtmRelBalCaf.StrMaskToFloat(sNum : String) : Extended;
var
   iPos    : Integer;
   sAux, sResult : String;
begin
   sAux := sNum;
   if sAux = '' then sAux := '0';
   //-------------------------------------------------------------------------------------
   try
      sResult := '';
      iPos := 1;
      while iPos <= length(sAux) do
      begin
         if (sAux[iPos] = '0') or (sAux[iPos] = '1') or (sAux[iPos] = '2') or
            (sAux[iPos] = '3') or (sAux[iPos] = '4') or (sAux[iPos] = '5') or
            (sAux[iPos] = '6') or (sAux[iPos] = '7') or (sAux[iPos] = '8') or
            (sAux[iPos] = '9') or (sAux[iPos] = ',') then
            sResult := sResult + sAux[iPos];
         iPos := iPos + 1;
      end;
      result := strtofloat(sResult);
   except
      showmessage(sNum + ',' + sAux + ',' + sResult);
      result := 0.00;
   end;
end;

procedure TdtmRelBalCaf.rpBalPatClasBeforePrint(Sender: TObject);
begin
   inherited;
   ppSoma1.Value := 0;
   ppSoma2.Value := 0;
   ppSoma3.Value := 0;
   ppSoma4.Value := 0;
   ppSoma5.Value := 0;
   ppSoma6.Value := 0;
end;

procedure TdtmRelBalCaf.ppDetailBand2AfterPrint(Sender: TObject);
begin
   inherited;
   if qryBalPatClas.FieldByName('S_A').AsString = 'A' then
   begin
      ppSoma1.Value := ppSoma1.Value + qryBalPatClas.FieldByName('QUANT').AsInteger;
      ppSoma2.Value := AtivoFixo.ConvNum(ppSoma2.Value + qryBalPatClas.FieldByName('VALORG').AsCurrency);
      ppSoma3.Value := AtivoFixo.ConvNum(ppSoma3.Value + qryBalPatClas.FieldByName('CMBEM').AsCurrency);
      ppSoma4.Value := AtivoFixo.ConvNum(ppSoma4.Value + qryBalPatClas.FieldByName('DEPLANC').AsCurrency);
      ppSoma5.Value := AtivoFixo.ConvNum(ppSoma5.Value + qryBalPatClas.FieldByName('CMDEP').AsCurrency);
      ppSoma6.Value := AtivoFixo.ConvNum(ppSoma6.Value + qryBalPatClas.FieldByName('VALCTB').AsCurrency);
   end;
end;

procedure TdtmRelBalCaf.ppDetailBand2BeforePrint(Sender: TObject);
begin
   inherited;
   if qryBalPatClas.FieldByName('S_A').AsString = 'S' then
   begin
      rpBalPatClasDBText1.Font.Style := [fsBold];
      rpBalPatClasDBText2.Font.Style := [fsBold];
      rpBalPatClasDBText3.Font.Style := [fsBold];
      rpBalPatClasDBText4.Font.Style := [fsBold];
      rpBalPatClasDBText5.Font.Style := [fsBold];
      rpBalPatClasDBText6.Font.Style := [fsBold];
      rpBalPatClasDBText7.Font.Style := [fsBold];
      rpBalPatClasDBText8.Font.Style := [fsBold];
      rpBalPatClasDBText9.Font.Style := [fsBold];
   end else
   if qryBalPatClas.FieldByName('S_A').AsString = 'A' then
   begin
      rpBalPatClasDBText1.Font.Style := [];
      rpBalPatClasDBText2.Font.Style := [];
      rpBalPatClasDBText3.Font.Style := [];
      rpBalPatClasDBText4.Font.Style := [];
      rpBalPatClasDBText5.Font.Style := [];
      rpBalPatClasDBText6.Font.Style := [];
      rpBalPatClasDBText7.Font.Style := [];
      rpBalPatClasDBText8.Font.Style := [];
      rpBalPatClasDBText9.Font.Style := [];
   end else
   if qryBalPatClas.FieldByName('S_A').AsString = '' then
   begin
      rpBalPatClasDBText1.Font.Style := [fsItalic];
      rpBalPatClasDBText2.Font.Style := [fsItalic];
      rpBalPatClasDBText3.Font.Style := [fsItalic];
      rpBalPatClasDBText4.Font.Style := [fsItalic];
      rpBalPatClasDBText5.Font.Style := [fsItalic];
      rpBalPatClasDBText6.Font.Style := [fsItalic];
      rpBalPatClasDBText7.Font.Style := [fsItalic];
      rpBalPatClasDBText8.Font.Style := [fsItalic];
      rpBalPatClasDBText9.Font.Style := [fsItalic];
   end;
end;

procedure TdtmRelBalCaf.rpBalPatGrpAnal2BeforePrint(Sender: TObject);
begin
   inherited;
   ppSoma11.Value := 0;
   ppSoma12.Value := 0;
   ppSoma13.Value := 0;
end;

procedure TdtmRelBalCaf.ppDetailBand4AfterPrint(Sender: TObject);
begin
   inherited;
   if qryBalPatGrpAnal2.FieldByName('S_A').AsString = 'A' then
   begin
      ppSoma11.Value := ppSoma11.Value + qryBalPatGrpAnal2.FieldByName('QUANT').AsInteger;
      ppSoma12.Value := AtivoFixo.ConvNum(ppSoma12.Value + qryBalPatGrpAnal2.FieldByName('VALORG').AsCurrency);
      ppSoma13.Value := AtivoFixo.ConvNum(ppSoma13.Value + qryBalPatGrpAnal2.FieldByName('VALCTB').AsCurrency);
   end;
end;

procedure TdtmRelBalCaf.ppDetailBand4BeforePrint(Sender: TObject);
begin
   inherited;
   if qryBalPatGrpAnal2.FieldByName('S_A').AsString = 'S' then
   begin
      ppDBText101.Font.Style := [fsBold];
      ppDBText102.Font.Style := [fsBold];
      ppDBText103.Font.Style := [fsBold];
      ppDBText104.Font.Style := [fsBold];
      ppDBText105.Font.Style := [fsBold];
      ppDBText106.Font.Style := [fsBold];
   end else
   if qryBalPatGrpAnal2.FieldByName('S_A').AsString = 'A' then
   begin
      ppDBText101.Font.Style := [];
      ppDBText102.Font.Style := [];
      ppDBText103.Font.Style := [];
      ppDBText104.Font.Style := [];
      ppDBText105.Font.Style := [];
      ppDBText106.Font.Style := [];
   end else
   if qryBalPatGrpAnal2.FieldByName('S_A').AsString = '' then
   begin
      ppDBText101.Font.Style := [fsItalic];
      ppDBText102.Font.Style := [fsItalic];
      ppDBText103.Font.Style := [fsItalic];
      ppDBText104.Font.Style := [fsItalic];
      ppDBText105.Font.Style := [fsItalic];
      ppDBText106.Font.Style := [fsItalic];
   end;
end;

end.

