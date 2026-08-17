unit dRelAdminImobContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppStrtch,
  ppMemo, ppVar, ppRelatv, ppDBPipe, ppModule, daDataModule;

type
  TdtmRelAdminImobContab = class(TdtmReports)
    qryCCImovelAnal: TwwQuery;
    dsCCImovelAnal: TwwDataSource;
    pplCCImovelAnal: TppBDEPipeline;
    rptCCImovelAnal: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    rptCustoContabilLabel2: TppLabel;
    ppDetailBand5: TppDetailBand;
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
    ppLine5: TppLine;
    rptCustoContabilDBMemo1: TppDBMemo;
    rptCustoContabilDBText7: TppDBText;
    rptCustoContabilDBText9: TppDBText;
    rptCustoContabilDBText11: TppDBText;
    rptCustoContabilDBText3: TppDBText;
    rptCustoContabilDBText15: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine7: TppLine;
    ppLabel25: TppLabel;
    rptCustoContabilSummaryBand1: TppSummaryBand;
    rptCustoContabilShape2: TppShape;
    rptCustoContabilDBCalc17: TppDBCalc;
    rptCustoContabilDBCalc18: TppDBCalc;
    rptCustoContabilDBCalc19: TppDBCalc;
    rptCustoContabilDBCalc20: TppDBCalc;
    rptCustoContabilDBCalc21: TppDBCalc;
    rptCustoContabilDBCalc22: TppDBCalc;
    rptCustoContabilDBCalc23: TppDBCalc;
    rptCustoContabilDBCalc24: TppDBCalc;
    rptCustoContabilLabel16: TppLabel;
    rptCustoContabilLine4: TppLine;
    rptCustoContabilGroup2: TppGroup;
    rptCustoContabilGroupHeaderBand2: TppGroupHeaderBand;
    rptCustoContabilLine2: TppLine;
    rptCustoContabilLabel7: TppLabel;
    rptCustoContabilDBText1: TppDBText;
    rptCustoContabilGroupFooterBand2: TppGroupFooterBand;
    rptCustoContabilShape1: TppShape;
    rptCustoContabilDBCalc2: TppDBCalc;
    rptCustoContabilDBCalc3: TppDBCalc;
    rptCustoContabilDBCalc5: TppDBCalc;
    rptCustoContabilDBCalc6: TppDBCalc;
    rptCustoContabilDBCalc12: TppDBCalc;
    rptCustoContabilDBCalc13: TppDBCalc;
    rptCustoContabilDBCalc14: TppDBCalc;
    rptCustoContabilDBCalc16: TppDBCalc;
    rptCustoContabilLabel8: TppLabel;
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
    rptCustoContabilLabel14: TppLabel;
    rptCustoContabilLabel15: TppLabel;
    rptCustoContabilGroupFooterBand3: TppGroupFooterBand;
    rptCustoContabilDBCalc1: TppDBCalc;
    rptCustoContabilDBCalc4: TppDBCalc;
    rptCustoContabilDBCalc7: TppDBCalc;
    rptCustoContabilDBCalc8: TppDBCalc;
    rptCustoContabilDBCalc9: TppDBCalc;
    rptCustoContabilDBCalc10: TppDBCalc;
    rptCustoContabilDBCalc11: TppDBCalc;
    rptCustoContabilDBCalc15: TppDBCalc;
    rptCustoContabilLabel13: TppLabel;
    qryCCMestreAnal: TwwQuery;
    dsCCMestreAnal: TwwDataSource;
    pplCCMestreAnal: TppBDEPipeline;
    rptCCMestreAnal: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppDetailBand10: TppDetailBand;
    ppLabel74: TppLabel;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppLabel75: TppLabel;
    ppLine21: TppLine;
    ppDBMemo12: TppDBMemo;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    rptCustoContabilMestreDBText1: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine22: TppLine;
    ppLabel76: TppLabel;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppLine23: TppLine;
    ppLabel77: TppLabel;
    ppDBText43: TppDBText;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppShape4: TppShape;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppLabel78: TppLabel;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppLine24: TppLine;
    ppDBText44: TppDBText;
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
    ppLine25: TppLine;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppLabel96: TppLabel;
    qryCCMestreSint: TwwQuery;
    qryCCMestreSint_GRUPO: TStringField;
    dsCCMestreSint: TwwDataSource;
    pplCCMestreSint: TppBDEPipeline;
    rptCCMestreSint: TppReport;
    ppHeaderBand20: TppHeaderBand;
    ppLabel188: TppLabel;
    ppLabel189: TppLabel;
    ppLabel195: TppLabel;
    ppDetailBand20: TppDetailBand;
    ppDBText79: TppDBText;
    ppLine63: TppLine;
    ppDBMemo25: TppDBMemo;
    ppDBText80: TppDBText;
    ppDBText82: TppDBText;
    ppFooterBand20: TppFooterBand;
    ppLine65: TppLine;
    ppLabel196: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppShape11: TppShape;
    ppDBCalc39: TppDBCalc;
    ppDBCalc40: TppDBCalc;
    ppLabel198: TppLabel;
    ppLine66: TppLine;
    rptCCMestreSintGroup1: TppGroup;
    rptCCMestreSintGroupHeaderBand1: TppGroupHeaderBand;
    ppLine67: TppLine;
    ppLabel199: TppLabel;
    ppDBText83: TppDBText;
    ppLabel200: TppLabel;
    ppLabel201: TppLabel;
    ppLabel203: TppLabel;
    ppLabel204: TppLabel;
    ppLine68: TppLine;
    ppLabel205: TppLabel;
    rptCCMestreSintGroupFooterBand1: TppGroupFooterBand;
    ppShape12: TppShape;
    ppDBCalc41: TppDBCalc;
    ppDBCalc42: TppDBCalc;
    ppLabel206: TppLabel;
    ppLine69: TppLine;
    qryCCImovelSint: TwwQuery;
    dsCCImovelSint: TwwDataSource;
    pplCCImovelSint: TppBDEPipeline;
    rptCCImovelSint: TppReport;
    ppHeaderBand18: TppHeaderBand;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    ppReport1Label2: TppLabel;
    ppDetailBand14: TppDetailBand;
    rptCCImovelSintDBText4: TppDBText;
    rptCCImovelSintDBText9: TppDBText;
    rptCCImovelSintDBText10: TppDBText;
    rptCCImovelSintDBText11: TppDBText;
    rptCCImovelSintDBText12: TppDBText;
    rptCCImovelSintDBText8: TppDBText;
    rptCCImovelSintLine5: TppLine;
    ppFooterBand18: TppFooterBand;
    ppLabel132: TppLabel;
    rptCCImovelSintLine7: TppLine;
    rptCCImovelSintGroup1: TppGroup;
    rptCCImovelSintGroupHeaderBand1: TppGroupHeaderBand;
    rptCCImovelSintDBText13: TppDBText;
    rptCCImovelSintDBText14: TppDBText;
    rptCCImovelSintDBText15: TppDBText;
    rptCCImovelSintDBText16: TppDBText;
    rptCCImovelSintLine1: TppLine;
    rptCCImovelSintLabel9: TppLabel;
    rptCCImovelSintLabel10: TppLabel;
    rptCCImovelSintLine4: TppLine;
    rptCCImovelSintLabel11: TppLabel;
    rptCCImovelSintLabel12: TppLabel;
    rptCCImovelSintLabel13: TppLabel;
    rptCCImovelSintLabel14: TppLabel;
    rptCCImovelSintLabel15: TppLabel;
    rptCCImovelSintLabel16: TppLabel;
    rptCCImovelSintLabel17: TppLabel;
    rptCCImovelSintLabel8: TppLabel;
    rptCCImovelSintGroupFooterBand1: TppGroupFooterBand;
    rptCCImovelSintShape1: TppShape;
    rptCCImovelSintLabel18: TppLabel;
    rptCCImovelSintLine3: TppLine;
    rptCCImovelSintDBCalc1: TppDBCalc;
    rptCCImovelSint_lblDataContabil: TppLabel;
    rptCCImovelAnal_lblDataContabil: TppLabel;
    rptCCMestreAnal_lblDataContabil: TppLabel;
    rptCCMestreSint_lblDataContabil: TppLabel;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    ppCalc38: TppSystemVariable;
    ppCalc39: TppSystemVariable;
    ppCalc32: TppSystemVariable;
    ppCalc33: TppSystemVariable;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    qryCCImovelSint_GRUPO: TStringField;
    qryCCMestreSintIDIMOVEL: TFloatField;
    qryCCMestreSintNOME_MESTRE: TStringField;
    qryCCMestreSintNOME_IMOVEL: TStringField;
    qryCCMestreSintIMOVEL_EXTENSO: TStringField;
    qryCCMestreSintIDBEM: TFloatField;
    qryCCMestreSintPLACA: TFloatField;
    qryCCMestreSintDESBEM: TStringField;
    qryCCMestreSintIXBGRUPO: TStringField;
    qryCCMestreSintIMOCODIGO: TStringField;
    qryCCMestreSintIMOMATRICULA: TStringField;
    qryCCMestreSintCODTIPIMOVEL: TStringField;
    qryCCMestreSintDESCTIPOIMOVEL: TStringField;
    qryCCMestreSintFLGATIVO: TFloatField;
    qryCCMestreSintSTATUS_IMOVEL: TStringField;
    qryCCMestreSintFLGSTATUSOCUPACAO: TStringField;
    qryCCMestreSintIMOAREA: TFloatField;
    qryCCMestreSintIMOAREAGERENCIAL: TFloatField;
    qryCCMestreSintIMOFRACAOIDEAL: TFloatField;
    qryCCMestreSintIMOPERCENTRATEIO: TFloatField;
    qryCCMestreSintIMOMOEDACOMPRA: TFloatField;
    qryCCMestreSintIMOVLRCOMPRA: TFloatField;
    qryCCMestreSintIMODATACOMPRA: TDateTimeField;
    qryCCMestreSintMOEDA_COMPRA: TStringField;
    qryCCMestreSintIMOMOEDAREAVAL: TFloatField;
    qryCCMestreSintIMOVLRREAVAL: TFloatField;
    qryCCMestreSintIMODATAREAVAL: TDateTimeField;
    qryCCMestreSintMOEDA_REAVAL: TStringField;
    qryCCMestreSintIMOMOEDAMERCADO: TFloatField;
    qryCCMestreSintIMOVLRMERCADO: TFloatField;
    qryCCMestreSintIMODATAMERCADO: TDateTimeField;
    qryCCMestreSintMOEDA_MERCADO: TStringField;
    qryCCMestreSintCONTROLE: TStringField;
    qryCCMestreSintBAIXATOTAL: TStringField;
    qryCCMestreSintDTAINCLUSAO: TDateTimeField;
    qryCCMestreSintFLGDEPREC: TFloatField;
    qryCCMestreSintDATAULTDEP: TDateTimeField;
    qryCCMestreSintDATAINICIODEP: TDateTimeField;
    qryCCMestreSintTAXADEP: TFloatField;
    qryCCMestreSintIDGRUPO: TFloatField;
    qryCCMestreSintIDCLASSEBEM: TFloatField;
    qryCCMestreSintVALHISTORICO: TFloatField;
    qryCCMestreSintNOMEFORN: TStringField;
    qryCCMestreSintCODGRUPO: TStringField;
    qryCCMestreSintDESCGRUPO: TStringField;
    qryCCMestreSintTIPOGRUPO: TStringField;
    qryCCMestreSintCODCENTROCUSTO: TStringField;
    qryCCMestreSintDESCCCUSTO: TStringField;
    qryCCMestreSintTIPOCCUSTO: TStringField;
    qryCCMestreSintCODCLASSEBEM: TStringField;
    qryCCMestreSintDESCCLASSEBEM: TStringField;
    qryCCMestreSintTIPOCLASSEBEM: TStringField;
    qryCCMestreSintDESCCONJUNTO: TStringField;
    qryCCMestreSintDESCLOCAL: TStringField;
    qryCCMestreSintNOMERESP: TStringField;
    qryCCMestreSintCMBEM: TFloatField;
    qryCCMestreSintDEPLANC: TFloatField;
    qryCCMestreSintCMDEP: TFloatField;
    qryCCMestreSintVALORGREAV: TFloatField;
    qryCCMestreSintCMBEMREAV: TFloatField;
    qryCCMestreSintDEPLANCREAV: TFloatField;
    qryCCMestreSintCMDEPREAV: TFloatField;
    qryCCMestreSintVALORGULTREAV: TFloatField;
    qryCCMestreSintCMBEMULTREAV: TFloatField;
    qryCCMestreSintDEPLANCULTREAV: TFloatField;
    qryCCMestreSintCMDEPULTREAV: TFloatField;
    qryCCMestreSintSUMVALCTB: TFloatField;
    qryCCMestreSintSUMVALCTBIMOB: TFloatField;
    qryCCMestreSintVALORG: TFloatField;
    qryCCImovelSintIDIMOVEL: TFloatField;
    qryCCImovelSintNOME_MESTRE: TStringField;
    qryCCImovelSintNOME_IMOVEL: TStringField;
    qryCCImovelSintIMOVEL_EXTENSO: TStringField;
    qryCCImovelSintIDBEM: TFloatField;
    qryCCImovelSintPLACA: TFloatField;
    qryCCImovelSintDESBEM: TStringField;
    qryCCImovelSintIXBGRUPO: TStringField;
    qryCCImovelSintIMOCODIGO: TStringField;
    qryCCImovelSintIMOMATRICULA: TStringField;
    qryCCImovelSintCODTIPIMOVEL: TStringField;
    qryCCImovelSintDESCTIPOIMOVEL: TStringField;
    qryCCImovelSintFLGATIVO: TFloatField;
    qryCCImovelSintSTATUS_IMOVEL: TStringField;
    qryCCImovelSintFLGSTATUSOCUPACAO: TStringField;
    qryCCImovelSintIMOAREA: TFloatField;
    qryCCImovelSintIMOAREAGERENCIAL: TFloatField;
    qryCCImovelSintIMOFRACAOIDEAL: TFloatField;
    qryCCImovelSintIMOPERCENTRATEIO: TFloatField;
    qryCCImovelSintIMOMOEDACOMPRA: TFloatField;
    qryCCImovelSintIMOVLRCOMPRA: TFloatField;
    qryCCImovelSintIMODATACOMPRA: TDateTimeField;
    qryCCImovelSintMOEDA_COMPRA: TStringField;
    qryCCImovelSintIMOMOEDAREAVAL: TFloatField;
    qryCCImovelSintIMOVLRREAVAL: TFloatField;
    qryCCImovelSintIMODATAREAVAL: TDateTimeField;
    qryCCImovelSintMOEDA_REAVAL: TStringField;
    qryCCImovelSintIMOMOEDAMERCADO: TFloatField;
    qryCCImovelSintIMOVLRMERCADO: TFloatField;
    qryCCImovelSintIMODATAMERCADO: TDateTimeField;
    qryCCImovelSintMOEDA_MERCADO: TStringField;
    qryCCImovelSintCONTROLE: TStringField;
    qryCCImovelSintBAIXATOTAL: TStringField;
    qryCCImovelSintDTAINCLUSAO: TDateTimeField;
    qryCCImovelSintFLGDEPREC: TFloatField;
    qryCCImovelSintDATAULTDEP: TDateTimeField;
    qryCCImovelSintDATAINICIODEP: TDateTimeField;
    qryCCImovelSintTAXADEP: TFloatField;
    qryCCImovelSintIDGRUPO: TFloatField;
    qryCCImovelSintIDCLASSEBEM: TFloatField;
    qryCCImovelSintVALHISTORICO: TFloatField;
    qryCCImovelSintNOMEFORN: TStringField;
    qryCCImovelSintCODGRUPO: TStringField;
    qryCCImovelSintDESCGRUPO: TStringField;
    qryCCImovelSintTIPOGRUPO: TStringField;
    qryCCImovelSintCODCENTROCUSTO: TStringField;
    qryCCImovelSintDESCCCUSTO: TStringField;
    qryCCImovelSintTIPOCCUSTO: TStringField;
    qryCCImovelSintCODCLASSEBEM: TStringField;
    qryCCImovelSintDESCCLASSEBEM: TStringField;
    qryCCImovelSintTIPOCLASSEBEM: TStringField;
    qryCCImovelSintDESCCONJUNTO: TStringField;
    qryCCImovelSintDESCLOCAL: TStringField;
    qryCCImovelSintNOMERESP: TStringField;
    qryCCImovelSintCMBEM: TFloatField;
    qryCCImovelSintVALORG: TFloatField;
    qryCCImovelSintDEPLANC: TFloatField;
    qryCCImovelSintCMDEP: TFloatField;
    qryCCImovelSintVALORGREAV: TFloatField;
    qryCCImovelSintCMBEMREAV: TFloatField;
    qryCCImovelSintDEPLANCREAV: TFloatField;
    qryCCImovelSintCMDEPREAV: TFloatField;
    qryCCImovelSintVALORGULTREAV: TFloatField;
    qryCCImovelSintCMBEMULTREAV: TFloatField;
    qryCCImovelSintDEPLANCULTREAV: TFloatField;
    qryCCImovelSintCMDEPULTREAV: TFloatField;
    qryCCImovelSintSUMVALCTB: TFloatField;
    qryCCImovelSintSUMVALCTBIMOB: TFloatField;
    qryCCImovelAnal_GRUPO: TStringField;
    qryCCMestreAnal_GRUPO: TStringField;
    qryCCMestreAnalIDIMOVEL: TFloatField;
    qryCCMestreAnalNOME_MESTRE: TStringField;
    qryCCMestreAnalNOME_IMOVEL: TStringField;
    qryCCMestreAnalIMOVEL_EXTENSO: TStringField;
    qryCCMestreAnalIDBEM: TFloatField;
    qryCCMestreAnalPLACA: TFloatField;
    qryCCMestreAnalDESBEM: TStringField;
    qryCCMestreAnalIXBGRUPO: TStringField;
    qryCCMestreAnalIMOCODIGO: TStringField;
    qryCCMestreAnalIMOMATRICULA: TStringField;
    qryCCMestreAnalCODTIPIMOVEL: TStringField;
    qryCCMestreAnalDESCTIPOIMOVEL: TStringField;
    qryCCMestreAnalFLGATIVO: TFloatField;
    qryCCMestreAnalSTATUS_IMOVEL: TStringField;
    qryCCMestreAnalFLGSTATUSOCUPACAO: TStringField;
    qryCCMestreAnalIMOAREA: TFloatField;
    qryCCMestreAnalIMOAREAGERENCIAL: TFloatField;
    qryCCMestreAnalIMOFRACAOIDEAL: TFloatField;
    qryCCMestreAnalIMOPERCENTRATEIO: TFloatField;
    qryCCMestreAnalIMOMOEDACOMPRA: TFloatField;
    qryCCMestreAnalIMOVLRCOMPRA: TFloatField;
    qryCCMestreAnalIMODATACOMPRA: TDateTimeField;
    qryCCMestreAnalMOEDA_COMPRA: TStringField;
    qryCCMestreAnalIMOMOEDAREAVAL: TFloatField;
    qryCCMestreAnalIMOVLRREAVAL: TFloatField;
    qryCCMestreAnalIMODATAREAVAL: TDateTimeField;
    qryCCMestreAnalMOEDA_REAVAL: TStringField;
    qryCCMestreAnalIMOMOEDAMERCADO: TFloatField;
    qryCCMestreAnalIMOVLRMERCADO: TFloatField;
    qryCCMestreAnalIMODATAMERCADO: TDateTimeField;
    qryCCMestreAnalMOEDA_MERCADO: TStringField;
    qryCCMestreAnalCONTROLE: TStringField;
    qryCCMestreAnalBAIXATOTAL: TStringField;
    qryCCMestreAnalDTAINCLUSAO: TDateTimeField;
    qryCCMestreAnalFLGDEPREC: TFloatField;
    qryCCMestreAnalDATAULTDEP: TDateTimeField;
    qryCCMestreAnalDATAINICIODEP: TDateTimeField;
    qryCCMestreAnalTAXADEP: TFloatField;
    qryCCMestreAnalIDGRUPO: TFloatField;
    qryCCMestreAnalIDCLASSEBEM: TFloatField;
    qryCCMestreAnalVALHISTORICO: TFloatField;
    qryCCMestreAnalNOMEFORN: TStringField;
    qryCCMestreAnalCODGRUPO: TStringField;
    qryCCMestreAnalDESCGRUPO: TStringField;
    qryCCMestreAnalTIPOGRUPO: TStringField;
    qryCCMestreAnalCODCENTROCUSTO: TStringField;
    qryCCMestreAnalDESCCCUSTO: TStringField;
    qryCCMestreAnalTIPOCCUSTO: TStringField;
    qryCCMestreAnalCODCLASSEBEM: TStringField;
    qryCCMestreAnalDESCCLASSEBEM: TStringField;
    qryCCMestreAnalTIPOCLASSEBEM: TStringField;
    qryCCMestreAnalDESCCONJUNTO: TStringField;
    qryCCMestreAnalDESCLOCAL: TStringField;
    qryCCMestreAnalNOMERESP: TStringField;
    qryCCMestreAnalCMBEM: TFloatField;
    qryCCMestreAnalVALORG: TFloatField;
    qryCCMestreAnalDEPLANC: TFloatField;
    qryCCMestreAnalCMDEP: TFloatField;
    qryCCMestreAnalVALORG0: TFloatField;
    qryCCMestreAnalVALREAVACUM0: TFloatField;
    qryCCMestreAnalCMBEMATU0: TFloatField;
    qryCCMestreAnalCMBEMACUM0: TFloatField;
    qryCCMestreAnalDEPLANCATU0: TFloatField;
    qryCCMestreAnalDEPLANCACUM0: TFloatField;
    qryCCMestreAnalCMDEPLANCACUM0: TFloatField;
    qryCCMestreAnalVALCTB0: TFloatField;
    qryCCMestreAnalVALULTREAVACUM1: TFloatField;
    qryCCMestreAnalVALULTCMREAVATU: TFloatField;
    qryCCMestreAnalVALULTCMREAVACUM1: TFloatField;
    qryCCMestreAnalVALULTDEPREAVATU: TFloatField;
    qryCCMestreAnalVALULTDEPREAVACUM1: TFloatField;
    qryCCMestreAnalVALULTCMDEPREAVACUM1: TFloatField;
    qryCCMestreAnalVALCTB1: TFloatField;
    qryCCMestreAnalSUMPARCREAV: TFloatField;
    qryCCMestreAnalSUMCMBEMATU: TFloatField;
    qryCCMestreAnalSUMCMBEMACUM: TFloatField;
    qryCCMestreAnalSUMDEPATU: TFloatField;
    qryCCMestreAnalSUMDEPACUM: TFloatField;
    qryCCMestreAnalSUMCMDEPACUM: TFloatField;
    qryCCMestreAnalVALORGREAV: TFloatField;
    qryCCMestreAnalCMBEMREAV: TFloatField;
    qryCCMestreAnalDEPLANCREAV: TFloatField;
    qryCCMestreAnalCMDEPREAV: TFloatField;
    qryCCMestreAnalVALORGULTREAV: TFloatField;
    qryCCMestreAnalCMBEMULTREAV: TFloatField;
    qryCCMestreAnalDEPLANCULTREAV: TFloatField;
    qryCCMestreAnalCMDEPULTREAV: TFloatField;
    qryCCMestreAnalSUMVALCTB: TFloatField;
    qryCCMestreAnalSUMVALCTBIMOB: TFloatField;

    procedure qryCCImovelAnalCalcFields(DataSet: TDataSet);
    procedure qryCCImovelSintCalcFields(DataSet: TDataSet);
    procedure qryCCMestreAnalCalcFields(DataSet: TDataSet);
    procedure qryCCMestreSintCalcFields(DataSet: TDataSet);

  private { Private declarations }
    function MostraParam(Form: string): boolean; override;

  public { Public declarations }

  end;



var
  dtmRelAdminImobContab: TdtmRelAdminImobContab;



implementation
{$R *.DFM}
uses
   uSistema, uDiasInUteis, uAtivoFixo, uIntegraBack, uFuncoesImob,
   CRelCCImovelAnal, CRelCCImovelSint, CRelCCMestreAnal, CRelCCMestreSint, uCAF;




function TdtmRelAdminImobContab.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios
   if (LowerCase(Form) = 'cfgrelccimovelanal') then begin
      frm := TcfgRelCCImovelAnal.Create(Application);
   end else if (LowerCase(Form) = 'cfgrelccimovelsint') then begin
      frm := TcfgRelCCImovelSint.Create(Application);
   end else if (LowerCase(Form) = 'cfgrelccmestreanal') then begin
      frm := TcfgRelCCMestreAnal.Create(Application);
   end else if (LowerCase(Form) = 'cfgrelccmestresint') then begin
      frm := TcfgRelCCMestreSint.Create(Application);

   end else begin
      frm := nil;
   end;

   if frm = nil then begin
      Result := False;
      Exit;
   end;

   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;



procedure TdtmRelAdminImobContab.qryCCImovelAnalCalcFields(DataSet: TDataSet);
begin
   inherited;
   qryCCImovelAnal.FieldByName('_GRUPO').asString := CAF.GrupoExtenso(qryCCImovelAnal.FieldByName('IXBGRUPO').asString);
end;



procedure TdtmRelAdminImobContab.qryCCImovelSintCalcFields(DataSet: TDataSet);
begin
   inherited;
   qryCCImovelSint.FieldByName('_GRUPO').asString := CAF.GrupoExtenso(qryCCImovelSint.FieldByName('IXBGRUPO').asString);
end;



procedure TdtmRelAdminImobContab.qryCCMestreAnalCalcFields(DataSet: TDataSet);
begin
   inherited;
   qryCCMestreAnal.FieldByName('_GRUPO').asString := CAF.GrupoExtenso(qryCCMestreAnal.FieldByName('IXBGRUPO').asString);
end;



procedure TdtmRelAdminImobContab.qryCCMestreSintCalcFields(DataSet: TDataSet);
begin
   inherited;
   qryCCMestreSint.FieldByName('_GRUPO').asString := CAF.GrupoExtenso(qryCCMestreSint.FieldByName('IXBGRUPO').asString);
end;

end.
