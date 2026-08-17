unit dRelAdminImobRentab;

interface
                                                                                            
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, Db, ppBands, ppClass, ppCtrls, ppStrtch, ppMemo, ppPrnabl,
  ppProd, ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB,
  ppDBBDE, ppVar, ppRelatv, ppDBPipe, ppRegion, uCMFileUtils;

const
   sFormato = '#,##0.00;(#,##0.00)';

type
  TdtmRelAdminImobRentab = class(TdtmReports)
    qryVlrCompraImovel: TwwQuery;
    qryContratoXImovel: TwwQuery;
    qryContratoXImovelIDCONTRATOIMOVEL: TFloatField;
    qryContratoXImovelIDIMOVEL: TFloatField;
    qryContratoXImovelFLGRATEIO: TFloatField;
    qryContratoXImovelCIMPERCENTRATEIO: TFloatField;
    qryContratoXImovelCIMDESCRICAO: TStringField;
    pplMapaRC: TppBDEPipeline;
    dsMapaRC: TwwDataSource;
    qryMapaRC: TwwQuery;
    rptMapaRC: TppReport;
    rptMapaRC_Cabecalho: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel3: TppLabel;
    updMapaRC: TUpdateSQL;
    qryMapaRCIDCONTRATOIMOVEL: TFloatField;
    qryMapaRCNUMERO_CONTRATO: TStringField;
    qryMapaRCNOME_CONTRATO: TStringField;
    qryMapaRCCONDATAINICIO: TDateTimeField;
    qryMapaRCCONDATAFIM: TDateTimeField;
    qryMapaRCIDLOCATARIO: TFloatField;
    qryMapaRCNF_LOCATARIO: TStringField;
    qryMapaRCRS_LOCATARIO: TStringField;
    qryMapaRCIDADMINIMOVEL: TFloatField;
    qryMapaRCNF_ADMINISTRADORA: TStringField;
    qryMapaRCRS_ADMINISTRADORA: TStringField;
    qryMapaRCVLR_ALUGUEL: TFloatField;
    qryMapaRCVLR_REMUNERA: TFloatField;
    qryMapaRCVLR_LIQUIDO: TFloatField;
    qryMapaRCCUSTO_CONTABIL_CONTRATO: TFloatField;
    qryMapaRCVLR_CORRIGIDO: TFloatField;
    qryMapaRCMINIMO_ATUARIAL: TFloatField;
    qryMapaRCIDMESTRE: TFloatField;
    qryMapaRCNOME_MESTRE: TStringField;
    qryMapaRCIMONUMERO: TStringField;
    qryMapaRCIMOCOMPLEMENTO: TStringField;
    qryMapaRCIMOBAIRRO: TStringField;
    qryMapaRCIMOCEP: TStringField;
    qryMapaRCEND_EXTENSO: TStringField;
    rptMapaRCLabel18: TppLabel;
    rptMapaRCLabel19: TppLabel;
    rptMapaRC_lblAdministradora: TppLabel;
    rptMapaRC_lblMesAluguel: TppLabel;
    rptMapaRCLabel31: TppLabel;
    rptMapaRC_lblDataContabil: TppLabel;
    rptMapaRCLine7: TppLine;
    rptMapaRCLabel20: TppLabel;
    rptMapaRCLabel30: TppLabel;
    rptMapaRCLabel32: TppLabel;
    rptMapaRCLabel33: TppLabel;
    rptMapaRCLabel34: TppLabel;
    rptMapaRCLabel35: TppLabel;
    rptMapaRCLabel36: TppLabel;
    rptMapaRCLine8: TppLine;
    rptMapaRCLine9: TppLine;
    rptMapaRCLabel37: TppLabel;
    rptMapaRCLabel38: TppLabel;
    rptMapaRCLabel39: TppLabel;
    rptMapaRCLabel40: TppLabel;
    rptMapaRCLabel41: TppLabel;
    rptMapaRCLabel42: TppLabel;
    rptMapaRCLine10: TppLine;
    rptMapaRCLabel43: TppLabel;
    rptMapaRCLabel44: TppLabel;
    rptMapaRCLabel45: TppLabel;
    rptMapaRCLabel46: TppLabel;
    rptMapaRCLabel47: TppLabel;
    rptMapaRCLabel48: TppLabel;
    rptMapaRCLabel49: TppLabel;
    rptMapaRC_LinhaTitulo: TppLine;
    rptMapaRCLabel50: TppLabel;
    rptMapaRCLabel51: TppLabel;
    rptMapaRCDBText11: TppDBText;
    rptMapaRCDBText12: TppDBText;
    rptMapaRC_Separador: TppLine;
    rptMapaRCDBMemo1: TppDBMemo;
    rptMapaRCDBMemo3: TppDBMemo;
    rptMapaRCDBMemo4: TppDBMemo;
    rptMapaRCLabel52: TppLabel;
    rptMapaRCDBText13: TppDBText;
    rptMapaRCDBText14: TppDBText;
    rptMapaRCDBText15: TppDBText;
    rptMapaRCDBText16: TppDBText;
    rptMapaRCDBText17: TppDBText;
    rptMapaRCDBText18: TppDBText;
    rptMapaRCDBText19: TppDBText;
    rptMapaRCDBText20: TppDBText;
    rptMapaRCDBText21: TppDBText;
    rptMapaRCDBText22: TppDBText;
    rptMapaRCDBText23: TppDBText;
    rptMapaRCLine13: TppLine;
    rptMapaRCLine14: TppLine;
    rptMapaRC_Sumario: TppSummaryBand;
    rptMapaRCLabel55: TppLabel;
    rptMapaRCLabel56: TppLabel;
    rptMapaRC_lblAtuarialProjetado: TppLabel;
    rptMapaRC_lblIndiceCorrecao: TppLabel;
    qryMapaRCALUGUELXCC: TFloatField;
    qryMapaRCALUGUELXVLR: TFloatField;
    qryMapaRCRECEITAXCC: TFloatField;
    qryMapaRCRECEITAXVLR: TFloatField;
    pplMapaRI: TppBDEPipeline;
    dsMapaRI: TwwDataSource;
    qryMapaRI: TwwQuery;
    rptMapaRI: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel29: TppLabel;
    rptMapaRI_lblMesCompetencia: TppLabel;
    rptMapaRI_lblDataContabil: TppLabel;
    ppLine7: TppLine;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLine10: TppLine;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    rptMapaRI_lblAtuarialProjetado: TppLabel;
    rptMapaRI_lblIndiceCorrecao: TppLabel;
    bndImovel: TppDetailBand;
    rptMapaRI_Separador: TppLine;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLabel66: TppLabel;
    ppLine12: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppLabel67: TppLabel;
    ppShape2: TppShape;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    rptMapaRI_LinhaTitulo: TppLine;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine14: TppLine;
    ppLabel70: TppLabel;
    ppShape3: TppShape;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    updMapaRI: TUpdateSQL;
    qryMapaRIIDIMOVEL: TFloatField;
    qryMapaRIIMONOME: TStringField;
    qryMapaRIIMOMATRICULA: TStringField;
    qryMapaRIIMOCODIGO: TStringField;
    qryMapaRIIDMESTRE: TFloatField;
    qryMapaRINOME_MESTRE: TStringField;
    qryMapaRIIMONUMERO: TStringField;
    qryMapaRIIMOCOMPLEMENTO: TStringField;
    qryMapaRIIMOBAIRRO: TStringField;
    qryMapaRIIMOCEP: TStringField;
    qryMapaRIVLR_LIQUIDO: TFloatField;
    qryMapaRICUSTO_CONTABIL: TFloatField;
    qryMapaRIVLR_CORRIGIDO: TFloatField;
    qryMapaRIMINIMO_ATUARIAL: TFloatField;
    qryMapaRIRECEITAXCC: TFloatField;
    qryMapaRIRECEITAXVLR: TFloatField;
    qryMapaRIREC_CONTRATUAL: TFloatField;
    qryMapaRIALUGUELXCC: TFloatField;
    qryMapaRIALUGUELXVLR: TFloatField;
    rptMapaRIDBText1: TppDBText;
    qryMapaRIEND_EXTENSO: TStringField;
    qryMapaRIVLR_ALUGUEL: TFloatField;
    qryDataAntiga: TwwQuery;
    qryDataAntigaMINIIMODATACOMPRA: TDateTimeField;
    qryAluguelImovel: TwwQuery;
    qryMapaRIOCUPACAO: TStringField;
    rptMapaRIDBText2: TppDBText;
    qryAluguelImovelALUGUEL: TFloatField;
    qryAluguelMestre: TwwQuery;
    pplMapaRM: TppBDEPipeline;
    dsMapaRM: TwwDataSource;
    qryMapaRM: TwwQuery;
    StringField12: TStringField;
    rptMapaRM: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    rptMapaRM_lblMesAluguel: TppLabel;
    rptMapaRM_lblDataContabil: TppLabel;
    rptMapaRM_LinhaTitulo: TppLine;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLine4: TppLine;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    rptMapaRm_lblAtuarialProjetado: TppLabel;
    rptMapaRM_lblIndiceCorrecao: TppLabel;
    ppDetailBand2: TppDetailBand;
    rptMapaRM_Separador: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel35: TppLabel;
    ppLine6: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLabel36: TppLabel;
    ppShape1: TppShape;
    ppDBCalc1: TppDBCalc;
    rptMapaRM_DBcalcAluguel: TppDBCalc;
    rptMapaRM_DBcalcReceita: TppDBCalc;
    rptMapaRM_DBcalcCustoContabil: TppDBCalc;
    rptMapaRM_DBcalcVlrCorrigido: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    updMapaRM: TUpdateSQL;
    qryMapaRMIDIMOVEL: TFloatField;
    qryMapaRMNOME_MESTRE: TStringField;
    qryMapaRMIMOMATRICULA: TStringField;
    qryMapaRMIMOCODIGO: TStringField;
    qryMapaRMVLR_LIQUIDO: TFloatField;
    qryMapaRMCUSTO_CONTABIL: TFloatField;
    qryMapaRMVLR_CORRIGIDO: TFloatField;
    qryMapaRMVLR_ALUGUEL: TFloatField;
    qryMapaRMMINIMO_ATUARIAL: TFloatField;
    qryMapaRMRECEITAXCC: TFloatField;
    qryMapaRMRECEITAXVLR: TFloatField;
    qryMapaRMREC_CONTRATUAL: TFloatField;
    qryMapaRMALUGUELXCC: TFloatField;
    qryMapaRMALUGUELXVLR: TFloatField;
    qryAluguelMestreALUGUEL_MESTRE: TFloatField;
    qryImovelXMestre: TwwQuery;
    qryImovelXMestreIDIMOVEL: TFloatField;
    rptMapaRMLine1: TppLine;
    qryVlrCompraImovelIDIMOVEL: TFloatField;
    rptMapaRC_FundoBandaDetalhe: TppShape;
    rptMapaRMShape1: TppShape;
    rptMapaRIShape1: TppShape;
    rptMapaRC_lblCalculoAtuarial: TppLabel;
    rptMapaRM_lblCalculoAtuarial: TppLabel;
    rptMapaRI_lblCalculoAtuarial: TppLabel;
    updMapaTaxa: TUpdateSQL;
    pplMapaTaxa: TppBDEPipeline;
    qryMapaTaxa: TwwQuery;
    dsMapaTaxa: TwwDataSource;
    qryMapaTaxa_ENDERECO_EXTENSO: TStringField;
    qryMapaTaxaIDIMOVEL: TFloatField;
    qryMapaTaxaNOME_IMOVEL: TStringField;
    qryMapaTaxaIDMESTRE: TFloatField;
    qryMapaTaxaNOME_MESTRE: TStringField;
    qryMapaTaxaIMONUMERO: TStringField;
    qryMapaTaxaIMOCOMPLEMENTO: TStringField;
    qryMapaTaxaIMOBAIRRO: TStringField;
    qryMapaTaxaIMOCEP: TStringField;
    qryMapaTaxaIMODATACOMPRA: TDateTimeField;
    qryMapaTaxaIMOVLRREAVAL: TFloatField;
    qryMapaTaxaIMOMOEDAREAVAL: TFloatField;
    qryMapaTaxaIMODATAREAVAL: TDateTimeField;
    qryMapaTaxaIMOVLRCOMPRA: TFloatField;
    qryMapaTaxaIMOMOEDACOMPRA: TFloatField;
    qryMapaTaxaULTIMO_ALUGUEL: TFloatField;
    qryMapaTaxaVLR_COMPRA_C: TFloatField;
    qryMapaTaxaFATOR_COMPRA_C: TFloatField;
    qryMapaTaxaVLR_REAVAL_C: TFloatField;
    qryMapaTaxaFATOR_REVAL_C: TFloatField;
    qryMapaTaxaTAXA_RENTAB: TFloatField;
    rptMapaTaxa: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppFooterBand5: TppFooterBand;
    ppLabel37: TppLabel;
    ppReport1Label1: TppLabel;
    ppReport1Label2: TppLabel;
    ppReport1Label3: TppLabel;
    ppReport1Line1: TppLine;
    ppReport1Label4: TppLabel;
    ppReport1Label5: TppLabel;
    ppReport1DBText1: TppDBText;
    ppReport1DBText2: TppDBText;
    rptMapaTaxa_LinhaTitulo: TppLine;
    ppReport1Label6: TppLabel;
    ppReport1Label7: TppLabel;
    ppReport1Label8: TppLabel;
    ppReport1Line3: TppLine;
    rptMapaTaxa_lblReavalia: TppLabel;
    ppReport1Label11: TppLabel;
    ppReport1Label12: TppLabel;
    ppReport1Label13: TppLabel;
    ppReport1Line4: TppLine;
    ppReport1Label14: TppLabel;
    ppReport1Label15: TppLabel;
    ppReport1Label17: TppLabel;
    ppReport1Label18: TppLabel;
    ppReport1Line5: TppLine;
    ppReport1Shape1: TppShape;
    ppReport1DBText3: TppDBText;
    ppReport1DBText4: TppDBText;
    ppReport1DBText5: TppDBText;
    ppReport1DBText6: TppDBText;
    ppReport1DBText7: TppDBText;
    rptMapaTaxa_lbldbDataReavalia: TppDBText;
    rptMapaTaxa_lbldbReavalia: TppDBText;
    ppReport1DBText10: TppDBText;
    ppReport1DBText11: TppDBText;
    ppReport1DBText12: TppDBText;
    ppReport1DBText13: TppDBText;
    ppReport1Line6: TppLine;
    ppReport1Line7: TppLine;
    rptMapaTaxa_lblIndiceCorrecao: TppLabel;
    rptMapaTaxaLabel1: TppLabel;
    rptMapaTaxaLabel2: TppLabel;
    rptMapaRM_lblTotAluguelXCC: TppLabel;
    rptMapaRM_lblTotReceitaXCC: TppLabel;
    rptMapaRM_lblTotAluguelXCorrigido: TppLabel;
    rptMapaRM_lblTotReceitaXCorrigido: TppLabel;
    rptMapaTaxaLabel3: TppLabel;
    rptMapaTaxa_lblDataCorrecao: TppLabel;
    rptMapaTaxaLabel5: TppLabel;
    rptMapaTaxa_lblAdministradora: TppLabel;
    qryMapaRIIMOLOGRADOURO: TStringField;
    qryMapaRCIMOLOGRADOURO: TStringField;
    qryMapaTaxaIMOLOGRADOURO: TStringField;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    qryMapaTaxaIMODATAMERCADO: TDateTimeField;
    qryMapaTaxaIMOVLRMERCADO: TFloatField;
    qryMapaTaxaIMOMOEDAMERCADO: TFloatField;
    ppLabel9: TppLabel;
    rptMapaRM_lblMesRecebto: TppLabel;
    ppLabel11: TppLabel;
    rptMapaRC_lblMesRecebto: TppLabel;
    rptMapaRC_QuebraContrato: TppGroupFooterBand;
    rptMapaRC_RegTotal: TppRegion;
    rptMapaRCLabel53: TppLabel;
    rptMapaRCShape2: TppShape;
    rptMapaRCDBCalc19: TppDBCalc;
    rptMapaRC_DBcalcTotAluguelC: TppDBCalc;
    rptMapaRC_DBcalcTotReceitaC: TppDBCalc;
    rptMapaRC_DBcalcTotCCC: TppDBCalc;
    rptMapaRC_DBcalcTotCorrigidoC: TppDBCalc;
    rptMapaRCDBCalc30: TppDBCalc;
    rptMapaRCDBCalc29: TppDBCalc;
    rptMapaRCDBCalc34: TppDBCalc;
    rptMapaRCDBCalc36: TppDBCalc;
    rptMapaRC_lblTotAluguelCXCC: TppLabel;
    rptMapaRC_lblTotReceitaCXCC: TppLabel;
    rptMapaRC_lblTotAluguelCXCorrigido: TppLabel;
    rptMapaRC_lblTotReceitaCXCorrigido: TppLabel;
    rptMapaRC_RegSumario: TppRegion;
    rptMapaRCLabel54: TppLabel;
    rptMapaRCShape3: TppShape;
    rptMapaRCDBCalc26: TppDBCalc;
    rptMapaRC_DBcalcTotAluguelGeral: TppDBCalc;
    rptMapaRC_DBcalcTotReceitaGeral: TppDBCalc;
    rptMapaRC_DBcalcTotCCGeral: TppDBCalc;
    rptMapaRC_DBcalcTotCorrigidoGeral: TppDBCalc;
    rptMapaRCDBCalc31: TppDBCalc;
    rptMapaRCDBCalc32: TppDBCalc;
    rptMapaRCDBCalc35: TppDBCalc;
    rptMapaRCDBCalc33: TppDBCalc;
    rptMapaRC_lblTotAluguelGeralXCC: TppLabel;
    rptMapaRC_lblTotReceitaGeralXCC: TppLabel;
    rptMapaRC_lblTotAluguelGeralXCorrigido: TppLabel;
    rptMapaRC_lblTotReceitaGeralXCorrigido: TppLabel;
    qryMapaTaxaDSC_CIDADE: TStringField;
    qryMapaTaxaDSC_UF: TStringField;
    qryMapaRCDSC_CIDADE: TStringField;
    qryMapaRCDSC_UF: TStringField;
    qryMapaRIDSC_CIDADE: TStringField;
    qryMapaRIDSC_UF: TStringField;
    pplMapaSeg: TppBDEPipeline;
    dsMapaSeg: TwwDataSource;
    qryMapaSeg: TwwQuery;
    rptMapaSeg: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    rptMapaSeg_lblMesAluguel: TppLabel;
    rptMapaSeg_lblDataContabil: TppLabel;
    ppLine1: TppLine;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel71: TppLabel;
    ppLine5: TppLine;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLine13: TppLine;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    rptMapaSeg_lblAtuarialProjetado: TppLabel;
    rptMapaSeg_lblIndiceCorrecao: TppLabel;
    rptMapaSeg_lblCalculoAtuarial: TppLabel;
    ppLabel88: TppLabel;
    rptMapaSeg_lblMesRecebto: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppLine15: TppLine;
    ppShape4: TppShape;
    ppDBText11: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLabel90: TppLabel;
    ppLine16: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    ppLabel91: TppLabel;
    ppShape5: TppShape;
    ppDBCalc2: TppDBCalc;
    rptMapaSeg_DBcalcAluguel: TppDBCalc;
    rptMapaSeg_DBcalcReceita: TppDBCalc;
    rptMapaSeg_DBcalcCustoContabil: TppDBCalc;
    rptMapaSeg_DBcalcVlrCorrigido: TppDBCalc;
    ppDBCalc29: TppDBCalc;
    ppDBCalc30: TppDBCalc;
    ppDBCalc31: TppDBCalc;
    ppDBCalc32: TppDBCalc;
    ppLine17: TppLine;
    rptMapaSeg_lblTotAluguelXCC: TppLabel;
    rptMapaSeg_lblTotReceitaXCC: TppLabel;
    rptMapaSeg_lblTotAluguelXCorrigido: TppLabel;
    rptMapaSeg_lblTotReceitaXCorrigido: TppLabel;
    updMapaSeg: TUpdateSQL;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppDBCalc33: TppDBCalc;
    ppDBCalc34: TppDBCalc;
    qryMapaSegCODTIPIMOVEL: TStringField;
    qryMapaSegDESCTIPOIMOVEL: TStringField;
    qryMapaSegVLR_RECEBIDO: TFloatField;
    qryMapaSegVLR_PAGO: TFloatField;
    qryMapaSegVLR_LIQUIDO: TFloatField;
    qryMapaSegCUSTO_CONTABIL: TFloatField;
    qryMapaSegVLR_CORRIGIDO: TFloatField;
    qryMapaSegVLR_ALUGUEL: TFloatField;
    qryMapaSegMINIMO_ATUARIAL: TFloatField;
    qryMapaSegRECEITAXCC: TFloatField;
    qryMapaSegRECEITAXVLR: TFloatField;
    qryMapaSegREC_CONTRATUAL: TFloatField;
    qryMapaSegALUGUELXCC: TFloatField;
    qryMapaSegALUGUELXVLR: TFloatField;
    ppLine11: TppLine;
    qryAluguelSegmento: TwwQuery;
    qryAluguelSegmentoALUGUEL_MESTRE: TFloatField;
    ppLabel40: TppLabel;
    qryMapaSegIDCARTEIRASPC: TFloatField;
    qryVlrCompraImovelVLRIMOVEL: TFloatField;
    qryVlrCompraImovelIMOVLRCOMPRA: TFloatField;
    qryVlrCompraImovelIMODATACOMPRA: TDateTimeField;
    qryVlrCompraImovelDATAREAVALIACAO: TDateTimeField;
    qryVlrCompraImovelIMOCODIGO: TStringField;
    qryVlrCompraImovelIMONOME: TStringField;
    qryVlrCompraImovelFLGATIVO: TFloatField;

    // procedimentos definidos
    function VlrAquisicaoImovel(iImovel, iIndiceCorrecao: integer; dDataCorrecao: TDateTime; bCorrigir: boolean): currency;

    // outros procedimentos
    procedure qryMapaRCCalcFields(DataSet: TDataSet);
    procedure qryMapaRICalcFields(DataSet: TDataSet);
    procedure bndImovelBeforePrint(Sender: TObject);
    procedure bndImovelBeforeGenerate(Sender: TObject);
    procedure rptMapaRC_SeparadorPrint(Sender: TObject);
    procedure rptMapaRC_FundoBandaDetalhePrint(Sender: TObject);
    procedure rptMapaRC_CabecalhoAfterPrint(Sender: TObject);
    procedure qryMapaTaxaCalcFields(DataSet: TDataSet);
    procedure dtmRelAdminImobRentabDestroy(Sender: TObject);
    procedure rptMapaRM_lblTotAluguelXCCPrint(Sender: TObject);
    procedure rptMapaRM_lblTotReceitaXCCPrint(Sender: TObject);
    procedure rptMapaRM_lblTotAluguelXCorrigidoPrint(Sender: TObject);
    procedure rptMapaRM_lblTotReceitaXCorrigidoPrint(Sender: TObject);
    procedure rptMapaRC_lblTotAluguelCXCCPrint(Sender: TObject);
    procedure rptMapaRC_lblTotReceitaCXCCPrint(Sender: TObject);
    procedure rptMapaRC_lblTotAluguelCXCorrigidoPrint(Sender: TObject);
    procedure rptMapaRC_lblTotReceitaCXCorrigidoPrint(Sender: TObject);
    procedure rptMapaRC_lblTotAluguelGeralXCCPrint(Sender: TObject);
    procedure rptMapaRC_lblTotReceitaGeralXCCPrint(Sender: TObject);
    procedure rptMapaRC_lblTotAluguelGeralXCorrigidoPrint(Sender: TObject);
    procedure rptMapaRC_lblTotReceitaGeralXCorrigidoPrint(Sender: TObject);
    procedure rptMapaSeg_lblTotAluguelXCCPrint(Sender: TObject);
    procedure rptMapaSeg_lblTotReceitaXCCPrint(Sender: TObject);
    procedure rptMapaSeg_lblTotAluguelXCorrigidoPrint(Sender: TObject);
    procedure rptMapaSeg_lblTotReceitaXCorrigidoPrint(Sender: TObject);



  private
    { Private declarations }

  public { Public declarations }
   bImprimeSoComValor      : boolean;
   bSeparador, bCorLinha   : boolean;
   CorLinha, CorAtual      : TColor;

  end;



var dtmRelAdminImobRentab: TdtmRelAdminImobRentab;


implementation

{$R *.DFM}

uses uSistema, uFuncoesImob, uDiasInUteis, uAtivoFixo, uIntegraBack;


function TdtmRelAdminImobRentab.VlrAquisicaoImovel(iImovel, iIndiceCorrecao: integer; dDataCorrecao: TDateTime; bCorrigir: boolean): currency;
var
   iMoedaCompra                  : integer;
   fVlrOMCompra, fVlrCompra      : extended;
   dDataCompra, dDataIniCorrecao : TDateTime;
   sCompra : String;
begin
   sCompra := '';
   with dtmRelAdminImobRentab.qryVlrCompraImovel do begin
      LimpaParametros(dtmRelAdminImobRentab.qryVlrCompraImovel);
      ParamByName('IMOVEL').AsInteger      := iImovel;
      ParamByName('DATALIMITE').AsDateTime := dDataCorrecao; // Daniel Simões - 22138 - 28/04/2006
      Open;
 // Daniel Simões - 22138 - 28/04/2006
      if (FieldByName('VLRIMOVEL').AsFloat>0) then begin
        fVlrCompra  := FieldByName('VLRIMOVEL').AsFloat;
        dDataCompra := FieldByName('DATAREAVALIACAO').AsDateTime;
      end else begin
        fVlrCompra  := FieldByName('IMOVLRCOMPRA').AsFloat;
        dDataCompra := FieldByName('IMODATACOMPRA').AsDateTime;

        sCompra := sCompra + 'ID: ' + IntToStr(iImovel) + '  Ativo: ' + FieldByName('FLGATIVO').AsString  +
                             '  Cod: ' + FieldByName('IMOCODIGO').AsString + ' - ' +
                             FieldByName('IMONOME').AsString + '    ' + FieldByName('IMOVLRCOMPRA').AsString + '   '+#13;


        CMDebugToFile(sCompra, 'RENTABILIDADE.TXT');
      end;
 // Daniel Simões - 22138 - 28/04/2006
   end;

   Result := fVlrCompra;

   if fVlrCompra <> 0 then begin
      if bCorrigir then begin
         dDataIniCorrecao  := DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(dDataCompra), DiasInUteis.ExtraiMes(dDataCompra)) + 1;
         Result := fVlrCompra * FuncoesImob.CalculaFatorCorrecao(iIndiceCorrecao, dDataIniCorrecao, dDataCorrecao, True);
      end;
   end;
end;



procedure TdtmRelAdminImobRentab.qryMapaRCCalcFields(DataSet: TDataSet);
var sEndExtenso : string;
begin
   sEndExtenso := '';
   if not(qryMapaRCIMOLOGRADOURO.IsNULL) then begin
      sEndExtenso := qryMapaRCIMOLOGRADOURO.AsString + ' ';
      if not(qryMapaRCIMONUMERO.IsNULL)      then sEndExtenso := sEndExtenso + qryMapaRCIMONUMERO.asString + ' - ';
      if not(qryMapaRCIMOCOMPLEMENTO.IsNULL) then sEndExtenso := sEndExtenso + qryMapaRCIMOCOMPLEMENTO.asString + ' - ';
      if not(qryMapaRCIMOBAIRRO.IsNULL)      then sEndExtenso := sEndExtenso + qryMapaRCIMOBAIRRO.asString + ' - ';
      if not(qryMapaRCDSC_CIDADE.IsNULL)     then sEndExtenso := sEndExtenso + qryMapaRCDSC_CIDADE.asString + ' - ';
      if not(qryMapaRCDSC_UF.IsNULL)         then sEndExtenso := sEndExtenso + qryMapaRCDSC_UF.asString;
      if not(qryMapaRCIMOCEP.IsNULL)         then sEndExtenso := sEndExtenso + ' - CEP ' + qryMapaRCIMOCEP.asString;
   end;
   qryMapaRCEND_EXTENSO.AsString := sEndExtenso;
end;



procedure TdtmRelAdminImobRentab.qryMapaRICalcFields(DataSet: TDataSet);
var sEndExtenso : string;
begin
   sEndExtenso := '';
   if not(qryMapaRIIMOLOGRADOURO.IsNULL) then begin
      sEndExtenso := qryMapaRIIMOLOGRADOURO.AsString + ' ';
      if not(qryMapaRIIMONUMERO.IsNULL)      then sEndExtenso := sEndExtenso + qryMapaRIIMONUMERO.asString + ' - ';
      if not(qryMapaRIIMOCOMPLEMENTO.IsNULL) then sEndExtenso := sEndExtenso + qryMapaRIIMOCOMPLEMENTO.asString + ' - ';
      if not(qryMapaRIIMOBAIRRO.IsNULL)      then sEndExtenso := sEndExtenso + qryMapaRIIMOBAIRRO.asString + ' - ';
      if not(qryMapaRIDSC_CIDADE.IsNULL)     then sEndExtenso := sEndExtenso + qryMapaRIDSC_CIDADE.asString + ' - ';
      if not(qryMapaRIDSC_UF.IsNULL)         then sEndExtenso := sEndExtenso + qryMapaRIDSC_UF.asString;
      if not(qryMapaRIIMOCEP.IsNULL)         then sEndExtenso := sEndExtenso + ' - CEP ' + qryMapaRIIMOCEP.asString;
   end;
   qryMapaRIEND_EXTENSO.AsString := sEndExtenso;
end;



procedure TdtmRelAdminImobRentab.bndImovelBeforePrint(Sender: TObject);
begin
   inherited;
   if bImprimeSoComValor then begin
      if (
         ( (qryMapaRIVLR_LIQUIDO.IsNull) or (qryMapaRIVLR_LIQUIDO.asFloat = 0) ) and
         ( (qryMapaRIVLR_ALUGUEL.IsNull) or (qryMapaRIVLR_ALUGUEL.asFloat = 0) ) and
         ( (qryMapaRIVLR_LIQUIDO.IsNull) or (qryMapaRIVLR_LIQUIDO.asFloat = 0) )
         ) then
      begin
         bndImovel.Visible := False;
      end else begin
         bndImovel.Visible := True;
      end;
   end else begin
      bndImovel.Visible := True;
   end;
end;



procedure TdtmRelAdminImobRentab.bndImovelBeforeGenerate(Sender: TObject);
begin
   inherited;
   if bImprimeSoComValor then begin
      if (
         ( (qryMapaRIVLR_LIQUIDO.IsNull) or (qryMapaRIVLR_LIQUIDO.asFloat = 0) ) and
         ( (qryMapaRIVLR_ALUGUEL.IsNull) or (qryMapaRIVLR_ALUGUEL.asFloat = 0) ) and
         ( (qryMapaRIVLR_LIQUIDO.IsNull) or (qryMapaRIVLR_LIQUIDO.asFloat = 0) )
         ) then
      begin
         bndImovel.Visible := False;
      end else begin
         bndImovel.Visible := True;
      end;
   end else begin
      bndImovel.Visible := True;
   end;
end;



procedure TdtmRelAdminImobRentab.rptMapaRC_SeparadorPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelAdminImobRentab.rptMapaRC_FundoBandaDetalhePrint(Sender: TObject);
begin
   inherited;
   if bCorLinha then begin
      if CorAtual = clWhite then begin
         CorAtual := CorLinha;
      end else begin
         CorAtual := clWhite;
      end;
   end else begin
      CorAtual := clWhite;
   end;
   (Sender as TppShape).Brush.Color := CorAtual;
end;



procedure TdtmRelAdminImobRentab.rptMapaRC_CabecalhoAfterPrint(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



procedure TdtmRelAdminImobRentab.qryMapaTaxaCalcFields(DataSet: TDataSet);
var sEndExtenso : string;
begin
   sEndExtenso := '';
   if not(qryMapaTaxaIMOLOGRADOURO.IsNULL) then begin
      sEndExtenso := qryMapaTaxaIMOLOGRADOURO.AsString + ' ';
      if not(qryMapaTaxaIMONUMERO.IsNULL)      then sEndExtenso := sEndExtenso + qryMapaTaxaIMONUMERO.asString + ' - ';
      if not(qryMapaTaxaIMOCOMPLEMENTO.IsNULL) then sEndExtenso := sEndExtenso + qryMapaTaxaIMOCOMPLEMENTO.asString + ' - ';
      if not(qryMapaTaxaIMOBAIRRO.IsNULL)      then sEndExtenso := sEndExtenso + qryMapaTaxaIMOBAIRRO.asString + ' - ';
      if not(qryMapaTaxaDSC_CIDADE.IsNULL)     then sEndExtenso := sEndExtenso + qryMapaTaxaDSC_CIDADE.asString + ' - ';
      if not(qryMapaTaxaDSC_UF.IsNULL)         then sEndExtenso := sEndExtenso + qryMapaTaxaDSC_UF.asString;
      if not(qryMapaTaxaIMOCEP.IsNULL)         then sEndExtenso := sEndExtenso + ' - CEP ' + qryMapaTaxaIMOCEP.asString;
   end;
   qryMapaTaxa_ENDERECO_EXTENSO.AsString := sEndExtenso;
end;



procedure TdtmRelAdminImobRentab.dtmRelAdminImobRentabDestroy(Sender: TObject);
var  i : integer;
begin
   inherited;
   for i := 0 to (ComponentCount - 1) do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin

         // se houver updates pendentes, devem ser cancelados
         if (
            (TwwQuery(Components[i]).CachedUpdates) and
            (TwwQuery(Components[i]).UpdateObject <> nil) and
            (TwwQuery(Components[i]).Active) and
            (TwwQuery(Components[i]).UpdatesPending)
            ) then
         begin
            TwwQuery(Components[i]).CancelUpdates;
         end;
         TwwQuery(Components[i]).Close;
         TwwQuery(Components[i]).UnPrepare;
      end;
   end;
end;



procedure TdtmRelAdminImobRentab.rptMapaRM_lblTotAluguelXCCPrint(Sender: TObject);
var fResultado : double;
begin
   inherited;
   // substitui a média calculada pelo relatório por cálculo baseado nos totais
   if rptMapaRM_DBcalcCustoContabil.Value <> 0 then
        fResultado := rptMapaRM_DBcalcAluguel.Value / rptMapaRM_DBcalcCustoContabil.Value * 100
   else fResultado := 0;
   rptMapaRM_lblTotAluguelXCC.Caption := FormatFloat(sFormato, fResultado);
end;



procedure TdtmRelAdminImobRentab.rptMapaRM_lblTotReceitaXCCPrint(Sender: TObject);
var fResultado : double;
begin
   inherited;
   // substitui a média calculada pelo relatório por cálculo baseado nos totais
   if rptMapaRM_DBcalcCustoContabil.Value <> 0 then
        fResultado := rptMapaRM_DBcalcReceita.Value / rptMapaRM_DBcalcCustoContabil.Value * 100
   else fResultado := 0;
   rptMapaRM_lblTotReceitaXCC.Caption := FormatFloat(sFormato, fResultado);
end;



procedure TdtmRelAdminImobRentab.rptMapaRM_lblTotAluguelXCorrigidoPrint(Sender: TObject);
var fResultado : double;
begin
   inherited;
   // substitui a média calculada pelo relatório por cálculo baseado nos totais
   if rptMapaRM_DBcalcVlrCorrigido.Value <> 0 then
        fResultado := rptMapaRM_DBcalcAluguel.Value / rptMapaRM_DBcalcVlrCorrigido.Value * 100
   else fResultado := 0;
   rptMapaRM_lblTotAluguelXCorrigido.Caption := FormatFloat(sFormato, fResultado);
end;



procedure TdtmRelAdminImobRentab.rptMapaRM_lblTotReceitaXCorrigidoPrint(Sender: TObject);
var fResultado : double;
begin
   inherited;
   // substitui a média calculada pelo relatório por cálculo baseado nos totais
   if rptMapaRM_DBcalcVlrCorrigido.Value <> 0 then
        fResultado := rptMapaRM_DBcalcReceita.Value / rptMapaRM_DBcalcVlrCorrigido.Value * 100
   else fResultado := 0;
   rptMapaRM_lblTotReceitaXCorrigido.Caption := FormatFloat(sFormato, fResultado);
end;


procedure TdtmRelAdminImobRentab.rptMapaRC_lblTotAluguelCXCCPrint(Sender: TObject);
var fResultado : double;
begin
   inherited;
   // substitui a média calculada pelo relatório por cálculo baseado nos totais
   if rptMapaRC_DBcalcTotCCC.Value <> 0 then
        fResultado := rptMapaRC_DBcalcTotAluguelC.Value / rptMapaRC_DBcalcTotCCC.Value * 100
   else fResultado := 0;
   rptMapaRC_lblTotAluguelCXCC.Caption := FormatFloat(sFormato, fResultado);
end;


procedure TdtmRelAdminImobRentab.rptMapaRC_lblTotReceitaCXCCPrint(Sender: TObject);
var fResultado : double;
begin
   inherited;
   // substitui a média calculada pelo relatório por cálculo baseado nos totais
   if rptMapaRC_DBcalcTotCCC.Value <> 0 then
        fResultado := rptMapaRC_DBcalcTotReceitaC.Value / rptMapaRC_DBcalcTotCCC.Value * 100
   else fResultado := 0;
   rptMapaRC_lblTotReceitaCXCC.Caption := FormatFloat(sFormato, fResultado);
end;


procedure TdtmRelAdminImobRentab.rptMapaRC_lblTotAluguelCXCorrigidoPrint(Sender: TObject);
var fResultado : double;
begin
   inherited;
   // substitui a média calculada pelo relatório por cálculo baseado nos totais
   if rptMapaRC_DBcalcTotCorrigidoC.Value <> 0 then
        fResultado := rptMapaRC_DBcalcTotAluguelC.Value / rptMapaRC_DBcalcTotCorrigidoC.Value * 100
   else fResultado := 0;
   rptMapaRC_lblTotAluguelCXCorrigido.Caption := FormatFloat(sFormato, fResultado);
end;



procedure TdtmRelAdminImobRentab.rptMapaRC_lblTotReceitaCXCorrigidoPrint(Sender: TObject);
var fResultado : double;
begin
   inherited;
   // substitui a média calculada pelo relatório por cálculo baseado nos totais
   if rptMapaRC_DBcalcTotCorrigidoC.Value <> 0 then
        fResultado := rptMapaRC_DBcalcTotReceitaC.Value / rptMapaRC_DBcalcTotCorrigidoC.Value * 100
   else fResultado := 0;
   rptMapaRC_lblTotReceitaCXCorrigido.Caption := FormatFloat(sFormato, fResultado);
end;



procedure TdtmRelAdminImobRentab.rptMapaRC_lblTotAluguelGeralXCCPrint(Sender: TObject);
var fResultado : double;
begin
   inherited;
   // substitui a média calculada pelo relatório por cálculo baseado nos totais
   if rptMapaRC_DBcalcTotCCGeral.Value <> 0 then
        fResultado := rptMapaRC_DBcalcTotAluguelGeral.Value / rptMapaRC_DBcalcTotCCGeral.Value * 100
   else fResultado := 0;
   rptMapaRC_lblTotAluguelGeralXCC.Caption := FormatFloat(sFormato, fResultado);
end;


procedure TdtmRelAdminImobRentab.rptMapaRC_lblTotReceitaGeralXCCPrint(Sender: TObject);
var fResultado : double;
begin
   inherited;
   // substitui a média calculada pelo relatório por cálculo baseado nos totais
   if rptMapaRC_DBcalcTotCCGeral.Value <> 0 then
        fResultado := rptMapaRC_DBcalcTotReceitaGeral.Value / rptMapaRC_DBcalcTotCCGeral.Value * 100
   else fResultado := 0;
   rptMapaRC_lblTotReceitaGeralXCC.Caption := FormatFloat(sFormato, fResultado);
end;


procedure TdtmRelAdminImobRentab.rptMapaRC_lblTotAluguelGeralXCorrigidoPrint(Sender: TObject);
var fResultado : double;
begin
   inherited;
   // substitui a média calculada pelo relatório por cálculo baseado nos totais
   if rptMapaRC_DBcalcTotCorrigidoGeral.Value <> 0 then
        fResultado := rptMapaRC_DBcalcTotAluguelGeral.Value / rptMapaRC_DBcalcTotCorrigidoGeral.Value * 100
   else fResultado := 0;
   rptMapaRC_lblTotAluguelGeralXCorrigido.Caption := FormatFloat(sFormato, fResultado);
end;


procedure TdtmRelAdminImobRentab.rptMapaRC_lblTotReceitaGeralXCorrigidoPrint(Sender: TObject);
var fResultado : double;
begin
   inherited;
   // substitui a média calculada pelo relatório por cálculo baseado nos totais
   if rptMapaRC_DBcalcTotCorrigidoGeral.Value <> 0 then
        fResultado := rptMapaRC_DBcalcTotReceitaGeral.Value / rptMapaRC_DBcalcTotCorrigidoGeral.Value * 100
   else fResultado := 0;
   rptMapaRC_lblTotReceitaGeralXCorrigido.Caption := FormatFloat(sFormato, fResultado);
end;


procedure TdtmRelAdminImobRentab.rptMapaSeg_lblTotAluguelXCCPrint(Sender: TObject);
var fResultado : double;
begin
   inherited;
   // substitui a média calculada pelo relatório por cálculo baseado nos totais
   if rptMapaSeg_DBcalcCustoContabil.Value <> 0 then
        fResultado := rptMapaSeg_DBcalcAluguel.Value / rptMapaSeg_DBcalcCustoContabil.Value * 100
   else fResultado := 0;
   rptMapaSeg_lblTotAluguelXCC.Caption := FormatFloat(sFormato, fResultado);
end;

procedure TdtmRelAdminImobRentab.rptMapaSeg_lblTotReceitaXCCPrint(Sender: TObject);
var fResultado : double;
begin
   inherited;
   // substitui a média calculada pelo relatório por cálculo baseado nos totais
   if rptMapaSeg_DBcalcCustoContabil.Value <> 0 then
        fResultado := rptMapaSeg_DBcalcReceita.Value / rptMapaSeg_DBcalcCustoContabil.Value * 100
   else fResultado := 0;
   rptMapaSeg_lblTotReceitaXCC.Caption := FormatFloat(sFormato, fResultado);
end;

procedure TdtmRelAdminImobRentab.rptMapaSeg_lblTotAluguelXCorrigidoPrint(Sender: TObject);
var fResultado : double;
begin
   inherited;
   // substitui a média calculada pelo relatório por cálculo baseado nos totais
   if rptMapaSeg_DBcalcVlrCorrigido.Value <> 0 then
        fResultado := rptMapaSeg_DBcalcAluguel.Value / rptMapaSeg_DBcalcVlrCorrigido.Value * 100
   else fResultado := 0;
   rptMapaSeg_lblTotAluguelXCorrigido.Caption := FormatFloat(sFormato, fResultado);
end;

procedure TdtmRelAdminImobRentab.rptMapaSeg_lblTotReceitaXCorrigidoPrint(Sender: TObject);
var fResultado : double;
begin
   inherited;
   // substitui a média calculada pelo relatório por cálculo baseado nos totais
   if rptMapaSeg_DBcalcVlrCorrigido.Value <> 0 then
        fResultado := rptMapaSeg_DBcalcReceita.Value / rptMapaSeg_DBcalcVlrCorrigido.Value * 100
   else fResultado := 0;
   rptMapaSeg_lblTotReceitaXCorrigido.Caption := FormatFloat(sFormato, fResultado);
end;

end.

