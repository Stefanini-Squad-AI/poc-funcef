// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 09/10/2003
//  Descrição  : alterações no nome da última coluna e forma de cálculo
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 02/10/2003
//  Descrição  : alterações gerais na chamada e no relatório de extrato de reservas
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 10/04/2003
//  Descrição  : Relatório de opções de parcelamento
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 23/12/2002
//  Descrição  : Relatório de Extrato de Reserva Geral
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 03.12.2002
//  Descrição  : relatório de parcelamento (rpParcelamento)
//------------------------------------------------------------------------------
//  Autor      : Carlos Gleyber Macedo de Mesquita
//  Data       : 09.05.2002
//  Descrição  : Alterada largura da última coluna do relatório de
//               EXTRATO DE RESERVA INDIVIDUAL
//------------------------------------------------------------------------------
unit DRelatorios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwdatsrc, DBTables, Wwquery, ppProd, ppClass, ppReport, ppComm,
  ppCache, ppDB, ppDBBDE, ppCtrls, ppPrnabl, ppBands, ppDBJIT, ppStrtch,
  ppRegion, ppVar, ppRelatv, ppDBPipe, dReports, ppMemo, ppModule, raCodMod;

type
  TDtmRelatorios = class(TdtmReports)
    ppReportMovAnt: TppReport;
    qryMovAnt: TwwQuery;
    dsMov: TwwDataSource;
    ppReportMovLabel2: TppLabel;
    ppReportMovLine1: TppLine;
    ppReportMovLabel4: TppLabel;
    ppReportMovLabel5: TppLabel;
    ppReportMovLabel6: TppLabel;
    ppReportMovDBText1: TppDBText;
    ppReportMovDBText2: TppDBText;
    ppReportMovDBText3: TppDBText;
    ppReportMovDBText4: TppDBText;
    ppReportMovDBText5: TppDBText;
    ppReportMovLabel8: TppLabel;
    ppReportMovLine2: TppLine;
    ppReportMovDBText6: TppDBText;
    ppReportMovLabel3: TppLabel;
    ppReportMovLabel9: TppLabel;
    ppReportMovLabel10: TppLabel;
    ppReportMovLabel11: TppLabel;
    ppReportMovLabel12: TppLabel;
    ppReportMovLabel13: TppLabel;
    ppReportMovLabel14: TppLabel;
    ppReportMovLabel15: TppLabel;
    ppRpLblEmpresa: TppLabel;
    ppReportMovDBCalc7: TppDBCalc;
    ppReportMovLine4: TppLine;
    ppReportMovLabel16: TppLabel;
    ppBDEPipelineMovPart: TppBDEPipeline;
    ppReportMovPart: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppValorCotas: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel3: TppLabel;
    ppLine2: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel4: TppLabel;
    ppDBText10: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel6: TppLabel;
    ppDBText11: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel7: TppLabel;
    ppDBText12: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    qryMovPartAnt: TwwQuery;
    dsMovPart: TwwDataSource;
    ppReportMovPartDBText1: TppDBText;
    ppReportMovPartLabel1: TppLabel;
    ppReportMovPartLabel2: TppLabel;
    ppReportMovPartLabel3: TppLabel;
    ppReportMovPartDBText2: TppDBText;
    ppReportMovPartDBText3: TppDBText;
    ppReportMovPartLabel4: TppLabel;
    ppReportMovLabel19: TppLabel;
    ppRpLblDataIni: TppLabel;
    ppRpLblDataFin: TppLabel;
    ppReportMovLabel22: TppLabel;
    cotasantPart: TppDBText;
    cotasantrealPart: TppDBText;
    ppReportMovPartDBText7: TppDBText;
    qryinconsis: TwwQuery;
    ppBDEPipelineInconsis: TppBDEPipeline;
    dsinconsis: TwwDataSource;
    ppRpInconsis: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel18: TppLabel;
    ppLabelemp: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLabel25: TppLabel;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText14: TppDBText;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel29: TppLabel;
    ppRpLblDatainconsisIni: TppLabel;
    ppRpLblDatainconsisfim: TppLabel;
    ppLabel32: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLabel34: TppLabel;
    ppDBText17: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppLabel35: TppLabel;
    ppDBText18: TppDBText;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppRpInconsisLine1: TppLine;
    ppRpInconsisLine2: TppLine;
    ppRpInconsisLabel1: TppLabel;
    ppRpInconsisDBText1: TppDBText;
    ppRpInconsisLine3: TppLine;
    qryinconsiscol: TwwQuery;
    ppBDEPipelineInconsisCol: TppBDEPipeline;
    dsinconsiscol: TwwDataSource;
    ppRptCol: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLine3: TppLine;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppLabel21: TppLabel;
    ppLine5: TppLine;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel33: TppLabel;
    ppLabel36: TppLabel;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppLabel37: TppLabel;
    ppDBText8: TppDBText;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppGroup9: TppGroup;
    ppLabel38: TppLabel;
    ppDBText9: TppDBText;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppLabel39: TppLabel;
    ppDBText13: TppDBText;
    ppGroupFooterBand10: TppGroupFooterBand;
    qryMovPartAntIDHISTRESERVA: TFloatField;
    qryMovPartAntIDEVENTOGERADOR: TFloatField;
    qryMovPartAntIDPLANOPREV: TFloatField;
    qryMovPartAntIDCONTRIBUICAO: TFloatField;
    qryMovPartAntIDBENEFICIO: TFloatField;
    qryMovPartAntIDTIPORESERVA: TFloatField;
    qryMovPartAntIDPESSJUR: TFloatField;
    qryMovPartAntIDPESSOA: TFloatField;
    qryMovPartAntDATAMOV: TDateTimeField;
    qryMovPartAntVLRREAL: TFloatField;
    qryMovPartAntSALDOREAL: TFloatField;
    qryMovPartAntVLRCOTAS: TFloatField;
    qryMovPartAntSALDOCOTAS: TFloatField;
    qryMovPartAntBENEFICIO: TStringField;
    qryMovPartAntRESERVA: TStringField;
    qryMovPartAntPLANPREV: TStringField;
    qryMovPartAntPESSOA: TStringField;
    qryMovPartAntPESSJUR: TStringField;
    qryMovPartAntCONTRIBUICAO: TStringField;
    qryMovPartAntEVENTO: TStringField;
    qryMovPartAntFLGENTRADA: TStringField;
    qryMovPartAntINSCRICAONUMERO: TFloatField;
    qryMovPartAntMATRICULA: TStringField;
    qryMovPartAntGERADOR: TStringField;
    qryMovPartAntENTRADA: TFloatField;
    qryMovPartAntINDICEREAJUSTE: TFloatField;
    ppReportMovPartDBText8: TppDBText;
    qryMovPartAntVLRREALSAIDA: TFloatField;
    qryMovPartAntVLRREALENT: TFloatField;
    qryMovPartAntCOTASSAIDA: TFloatField;
    qryMovPartAntCOTASENT: TFloatField;
    qryMovPartAntVLRREALANT: TFloatField;
    qryMovPartAntVLRCOTASANT: TFloatField;
    ppReportPartInconsis: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel5: TppLabeL;
    ppLabel22: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText19: TppDBText;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLabel43: TppLabel;
    ppLine7: TppLine;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppDBText23: TppDBText;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLabel47: TppLabel;
    ppRpLblDataPartIncIni: TppLabel;
    ppRpLblDataPartInFim: TppLabel;
    ppLabel50: TppLabel;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppLabel51: TppLabel;
    ppDBText26: TppDBText;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppGroup12: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppLabel52: TppLabel;
    ppDBText27: TppDBText;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppGroup13: TppGroup;
    ppGroupHeaderBand13: TppGroupHeaderBand;
    ppLabel53: TppLabel;
    ppDBText28: TppDBText;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppDBText29: TppDBText;
    ppLabel62: TppLabel;
    ppDBText30: TppDBText;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLine8: TppLine;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    qryMovPartAntVLRREALCALC: TFloatField;
    qryMovPartAntVLRCOTASCALC: TFloatField;
    ppBDEPipelineSaldoContas: TppBDEPipeline;
    qrySaldoContas: TwwQuery;
    dsSaldoContas: TwwDataSource;
    qryTransferenciaCotas: TwwQuery;
    ppReportTransferenciaCotas: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppReportTransferenciaCotasLabel1: TppLabel;
    ppReportTransferenciaCotasLabel2: TppLabel;
    ppReportTransferenciaCotasLine8: TppLine;
    ppDetailBand5: TppDetailBand;
    ppReportTransferenciaCotasDBText3: TppDBText;
    ppReportTransferenciaCotasDBText4: TppDBText;
    ppReportTransferenciaCotasDBText5: TppDBText;
    ppReportTransferenciaCotasDBText6: TppDBText;
    ppReportTransferenciaCotasDBText7: TppDBText;
    ppReportTransferenciaCotasDBText8: TppDBText;
    ppReportTransferenciaCotasDBText10: TppDBText;
    ppReportTransferenciaCotasDBText11: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppReportTransferenciaCotasLabel14: TppLabel;
    ppReportTransferenciaCotasLine7: TppLine;
    ppReportTransferenciaCotasGroup1: TppGroup;
    ppReportTransferenciaCotasGroupHeaderBand1: TppGroupHeaderBand;
    ppReportTransferenciaCotasDBText1: TppDBText;
    ppReportTransferenciaCotasLabel3: TppLabel;
    ppReportTransferenciaCotasLine1: TppLine;
    ppReportTransferenciaCotasGroupFooterBand1: TppGroupFooterBand;
    ppReportTransferenciaCotasLine5: TppLine;
    ppReportTransferenciaCotasLabel13: TppLabel;
    ppReportTransferenciaCotasDBCalc2: TppDBCalc;
    ppReportTransferenciaCotasGroup2: TppGroup;
    ppReportTransferenciaCotasGroupHeaderBand2: TppGroupHeaderBand;
    ppReportTransferenciaCotasDBText2: TppDBText;
    ppReportTransferenciaCotasLabel4: TppLabel;
    ppReportTransferenciaCotasLine2: TppLine;
    ppReportTransferenciaCotasLabel5: TppLabel;
    ppReportTransferenciaCotasLabel6: TppLabel;
    ppReportTransferenciaCotasLabel7: TppLabel;
    ppReportTransferenciaCotasLabel8: TppLabel;
    ppReportTransferenciaCotasLabel9: TppLabel;
    ppReportTransferenciaCotasLabel10: TppLabel;
    ppReportTransferenciaCotasLabel11: TppLabel;
    ppReportTransferenciaCotasLine3: TppLine;
    ppReportTransferenciaCotasGroupFooterBand2: TppGroupFooterBand;
    ppReportTransferenciaCotasLabel12: TppLabel;
    ppReportTransferenciaCotasDBCalc1: TppDBCalc;
    ppReportTransferenciaCotasLine4: TppLine;
    ppReportTransferenciaCotasLine6: TppLine;
    ppBDEPipelineTransferenciaCotas: TppBDEPipeline;
    dsTransferenciaCotas: TwwDataSource;
    ppReportSaldoContas: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppReportSaldoContasLine9: TppLine;
    ppDetailBand6: TppDetailBand;
    ppReportSaldoContasDBText4: TppDBText;
    ppReportSaldoContasDBText6: TppDBText;
    ppReportSaldoContasDBText7: TppDBText;
    ppReportSaldoContasDBText8: TppDBText;
    ppReportSaldoContasDBText9: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLabel72: TppLabel;
    ppLine9: TppLine;
    ppReportSaldoContasGroup1: TppGroup;
    ppReportSaldoContasGroupHeaderBand1: TppGroupHeaderBand;
    ppReportSaldoContasLine1: TppLine;
    ppReportSaldoContasLabel1: TppLabel;
    ppReportSaldoContasDBText1: TppDBText;
    ppReportSaldoContasLabel13: TppLabel;
    ppReportSaldoContasDBText10: TppDBText;
    ppReportSaldoContasGroupFooterBand1: TppGroupFooterBand;
    ppReportSaldoContasGroup2: TppGroup;
    ppReportSaldoContasGroupHeaderBand2: TppGroupHeaderBand;
    ppReportSaldoContasLine2: TppLine;
    ppReportSaldoContasLabel2: TppLabel;
    ppReportSaldoContasDBText2: TppDBText;
    ppReportSaldoContasLabel14: TppLabel;
    ppReportSaldoContasDBText11: TppDBText;
    ppReportSaldoContasGroupFooterBand2: TppGroupFooterBand;
    ppReportSaldoContasLabel12: TppLabel;
    ppReportSaldoContasLine8: TppLine;
    ppReportSaldoContasDBCalc3: TppDBCalc;
    ppReportSaldoContasDBCalc6: TppDBCalc;
    ppReportSaldoContasGroup3: TppGroup;
    ppReportSaldoContasGroupHeaderBand3: TppGroupHeaderBand;
    ppReportSaldoContasLine3: TppLine;
    ppReportSaldoContasLabel3: TppLabel;
    ppReportSaldoContasDBText3: TppDBText;
    ppReportSaldoContasGroupFooterBand3: TppGroupFooterBand;
    ppReportSaldoContasLabel11: TppLabel;
    ppReportSaldoContasLine7: TppLine;
    ppReportSaldoContasDBCalc2: TppDBCalc;
    ppReportSaldoContasDBCalc5: TppDBCalc;
    ppReportSaldoContasGroup4: TppGroup;
    ppReportSaldoContasGroupHeaderBand4: TppGroupHeaderBand;
    ppReportSaldoContasLabel7: TppLabel;
    ppReportSaldoContasLabel8: TppLabel;
    ppReportSaldoContasLabel9: TppLabel;
    ppReportSaldoContasLabel4: TppLabel;
    ppReportSaldoContasLabel6: TppLabel;
    ppReportSaldoContasLabel5: TppLabel;
    ppReportSaldoContasDBText5: TppDBText;
    ppReportSaldoContasLine4: TppLine;
    ppReportSaldoContasLine5: TppLine;
    ppReportSaldoContasGroupFooterBand4: TppGroupFooterBand;
    ppReportSaldoContasLabel10: TppLabel;
    ppReportSaldoContasLine6: TppLine;
    ppReportSaldoContasDBCalc1: TppDBCalc;
    ppReportSaldoContasDBCalc4: TppDBCalc;
    ppBDEPipelineSaldoSituacao: TppBDEPipeline;
    qrySaldoSituacao: TwwQuery;
    dsSaldoSituacao: TwwDataSource;
    ppReportSaldoSituacao: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppReportSaldoSituacaoLine2: TppLine;
    ppDetailBand7: TppDetailBand;
    ppReportSaldoSituacaoDBText1: TppDBText;
    ppReportSaldoSituacaoDBText2: TppDBText;
    ppReportSaldoSituacaoDBText3: TppDBText;
    ppReportSaldoSituacaoDBText4: TppDBText;
    ppReportSaldoSituacaoDBText5: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLabel75: TppLabel;
    ppLine10: TppLine;
    ppGroup14: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppLine11: TppLine;
    ppLabel76: TppLabel;
    ppDBText33: TppDBText;
    ppReportSaldoSituacaoLabel6: TppLabel;
    ppReportSaldoSituacaoDBText6: TppDBText;
    ppGroupFooterBand14: TppGroupFooterBand;
    ppGroup15: TppGroup;
    ppGroupHeaderBand15: TppGroupHeaderBand;
    ppLine12: TppLine;
    ppLabel77: TppLabel;
    ppDBText34: TppDBText;
    ppReportSaldoSituacaoLabel7: TppLabel;
    ppReportSaldoSituacaoDBText7: TppDBText;
    ppGroupFooterBand15: TppGroupFooterBand;
    ppLabel78: TppLabel;
    ppLine13: TppLine;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppGroup16: TppGroup;
    ppGroupHeaderBand16: TppGroupHeaderBand;
    ppLine14: TppLine;
    ppLabel79: TppLabel;
    ppDBText35: TppDBText;
    ppReportSaldoSituacaoLine1: TppLine;
    ppReportSaldoSituacaoLabel1: TppLabel;
    ppReportSaldoSituacaoLabel2: TppLabel;
    ppReportSaldoSituacaoLabel3: TppLabel;
    ppReportSaldoSituacaoLabel4: TppLabel;
    ppReportSaldoSituacaoLabel5: TppLabel;
    ppGroupFooterBand16: TppGroupFooterBand;
    ppLabel80: TppLabel;
    ppLine15: TppLine;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    qryRetiradaCotas: TwwQuery;
    ppReportRetiradaCotas: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLine20: TppLine;
    ppDetailBand8: TppDetailBand;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppReportRetiradaCotasDBText1: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLabel83: TppLabel;
    ppLine22: TppLine;
    ppGroup17: TppGroup;
    ppGroupHeaderBand17: TppGroupHeaderBand;
    ppDBText40: TppDBText;
    ppLabel84: TppLabel;
    ppLine23: TppLine;
    ppReportRetiradaCotasLabel2: TppLabel;
    ppReportRetiradaCotasLabel3: TppLabel;
    ppGroupFooterBand17: TppGroupFooterBand;
    ppLine24: TppLine;
    ppLabel85: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppGroup18: TppGroup;
    ppGroupHeaderBand18: TppGroupHeaderBand;
    ppDBText41: TppDBText;
    ppLabel86: TppLabel;
    ppLine25: TppLine;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLine26: TppLine;
    ppReportRetiradaCotasLabel1: TppLabel;
    ppGroupFooterBand18: TppGroupFooterBand;
    ppLabel91: TppLabel;
    ppDBCalc12: TppDBCalc;
    ppLine27: TppLine;
    ppReportRetiradaCotasLine1: TppLine;
    ppBDEPipelineRetiradaCotas: TppBDEPipeline;
    dsRetiradaCotas: TwwDataSource;
    qryFichaBeneficio: TwwQuery;
    ppReportFichaBeneficio: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLine28: TppLine;
    ppDetailBand9: TppDetailBand;
    ppReportFichaBeneficioDBText4: TppDBText;
    ppReportFichaBeneficioDBText5: TppDBText;
    ppReportFichaBeneficioDBText6: TppDBText;
    ppReportFichaBeneficioDBText7: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLabel94: TppLabel;
    ppLine29: TppLine;
    ppReportFichaBeneficioGroup1: TppGroup;
    ppReportFichaBeneficioGroupHeaderBand1: TppGroupHeaderBand;
    ppReportFichaBeneficioLabel1: TppLabel;
    ppReportFichaBeneficioDBText1: TppDBText;
    ppReportFichaBeneficioLine1: TppLine;
    ppReportFichaBeneficioGroupFooterBand1: TppGroupFooterBand;
    ppReportFichaBeneficioGroup2: TppGroup;
    ppReportFichaBeneficioGroupHeaderBand2: TppGroupHeaderBand;
    ppReportFichaBeneficioLabel2: TppLabel;
    ppReportFichaBeneficioDBText2: TppDBText;
    ppReportFichaBeneficioLine2: TppLine;
    ppReportFichaBeneficioGroupFooterBand2: TppGroupFooterBand;
    ppReportFichaBeneficioGroup3: TppGroup;
    ppReportFichaBeneficioGroupHeaderBand3: TppGroupHeaderBand;
    ppReportFichaBeneficioLabel3: TppLabel;
    ppReportFichaBeneficioDBText3: TppDBText;
    ppReportFichaBeneficioLine3: TppLine;
    ppReportFichaBeneficioLine4: TppLine;
    ppReportFichaBeneficioLabel4: TppLabel;
    ppReportFichaBeneficioLabel5: TppLabel;
    ppReportFichaBeneficioLabel6: TppLabel;
    ppReportFichaBeneficioGroupFooterBand3: TppGroupFooterBand;
    ppReportFichaBeneficioLine5: TppLine;
    ppReportFichaBeneficioLabel7: TppLabel;
    ppReportFichaBeneficioDBCalc1: TppDBCalc;
    ppBDEPipelineFichaBeneficio: TppBDEPipeline;
    dsFichaBeneficio: TwwDataSource;
    ppBDEPipelineSaldoContas1: TppBDEPipeline;
    qrySaldoContas1: TwwQuery;
    dsSaldoContas1: TwwDataSource;
    ppReportSaldoContas1: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppReportSaldoContas1Line1: TppLine;
    ppDetailBand10: TppDetailBand;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLabel97: TppLabel;
    ppLine16: TppLine;
    ppGroup19: TppGroup;
    ppGroupHeaderBand19: TppGroupHeaderBand;
    ppLine17: TppLine;
    ppLabel98: TppLabel;
    ppDBText47: TppDBText;
    ppLabel99: TppLabel;
    ppDBText48: TppDBText;
    ppGroupFooterBand19: TppGroupFooterBand;
    ppGroup20: TppGroup;
    ppGroupHeaderBand20: TppGroupHeaderBand;
    ppLine18: TppLine;
    ppLabel100: TppLabel;
    ppDBText49: TppDBText;
    ppLabel101: TppLabel;
    ppDBText50: TppDBText;
    ppGroupFooterBand20: TppGroupFooterBand;
    ppLabel102: TppLabel;
    ppLine19: TppLine;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppGroup21: TppGroup;
    ppGroupHeaderBand21: TppGroupHeaderBand;
    ppLine21: TppLine;
    ppLabel103: TppLabel;
    ppDBText51: TppDBText;
    ppGroupFooterBand21: TppGroupFooterBand;
    ppLabel104: TppLabel;
    ppLine30: TppLine;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppGroup22: TppGroup;
    ppGroupHeaderBand22: TppGroupHeaderBand;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppDBText52: TppDBText;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppGroupFooterBand22: TppGroupFooterBand;
    ppLabel111: TppLabel;
    ppLine33: TppLine;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppReportMovPartDBText11: TppDBText;
    qryMovPartAntMOESIGLA: TStringField;
    qryMovPartAntSIGLAEMP: TStringField;
    ppReportMovPartDBText12: TppDBText;
    ppReportPartInconsisDBText1: TppDBText;
    ppReportPartInconsisDBText2: TppDBText;
    ppReportPartInconsisDBText3: TppDBText;
    ppReportPartInconsisDBText4: TppDBText;
    ppReportPartInconsisDBText5: TppDBText;
    ppReportPartInconsisDBText6: TppDBText;
    qryMovPartAntSEQPROPOSTA: TFloatField;
    ppBDERelBeneficios: TppBDEPipeline;
    dsRelBeneficios: TwwDataSource;
    qryRelBeneficios: TwwQuery;
    ppRepRelBeneficios: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppLabel13: TppLabel;
    ppLine34: TppLine;
    ppLabel61: TppLabel;
    ppDetailBand11: TppDetailBand;
    ppFooterBand11: TppFooterBand;
    ppLine35: TppLine;
    ppLabel63: TppLabel;
    ppRepRelBeneficiosLabel1: TppLabel;
    ppRepRelBeneficiosLabel2: TppLabel;
    ppRepRelBeneficiosLabel3: TppLabel;
    ppRepRelBeneficiosLabel4: TppLabel;
    ppRepRelBeneficiosLabel5: TppLabel;
    ppRepRelBeneficiosLabel6: TppLabel;
    ppRepRelBeneficiosLabel7: TppLabel;
    ppRepRelBeneficiosLabel8: TppLabel;
    ppRepRelBeneficiosLabel9: TppLabel;
    ppRepRelBeneficiosLabel10: TppLabel;
    ppRepRelBeneficiosLabel11: TppLabel;
    ppRepRelBeneficiosLabel12: TppLabel;
    ppRepRelBeneficiosLabel13: TppLabel;
    ppRepRelBeneficiosLabel14: TppLabel;
    ppRepRelBeneficiosLabel15: TppLabel;
    ppRepRelBeneficiosLabel16: TppLabel;
    ppRepRelBeneficiosDBText1: TppDBText;
    ppRepRelBeneficiosDBText2: TppDBText;
    ppRepRelBeneficiosDBText3: TppDBText;
    ppRepRelBeneficiosDBText4: TppDBText;
    ppRepRelBeneficiosDBText5: TppDBText;
    ppRepRelBeneficiosDBText6: TppDBText;
    ppRepRelBeneficiosDBText7: TppDBText;
    ppRepRelBeneficiosDBText8: TppDBText;
    ppRepRelBeneficiosLine1: TppLine;
    ppRepRelBeneficiosDBText9: TppDBText;
    ppRepRelBeneficiosDBText10: TppDBText;
    ppRepRelBeneficiosDBText11: TppDBText;
    ppRepRelBeneficiosDBText12: TppDBText;
    ppRepRelBeneficiosDBText13: TppDBText;
    ppRepRelBeneficiosLine2: TppLine;
    ppRepRelBeneficiosLabel17: TppLabel;
    ppRepRelBeneficiosLabel18: TppLabel;
    ppRepRelBeneficiosLabel19: TppLabel;
    ppRepRelBeneficiosLabel20: TppLabel;
    ppRepRelBeneficiosLabel21: TppLabel;
    ppRepRelBeneficiosLabel22: TppLabel;
    ppRepRelBeneficiosDBText14: TppDBText;
    ppRepRelBeneficiosDBText15: TppDBText;
    ppRepRelBeneficiosDBText16: TppDBText;
    ppRepRelBeneficiosDBText17: TppDBText;
    ppRepRelBeneficiosDBText18: TppDBText;
    ppRepRelBeneficiosDBText19: TppDBText;
    ppRepRelBeneficiosDBText20: TppDBText;
    ppRepRelBeneficiosDBText21: TppDBText;
    ppRepRelBeneficiosDBText22: TppDBText;
    ppRepRelBeneficiosLine3: TppLine;
    ppRepRelBeneficiosLabel23: TppLabel;
    ppRepRelBeneficiosLabel24: TppLabel;
    ppRepRelBeneficiosLabel25: TppLabel;
    ppRepRelBeneficiosLabel26: TppLabel;
    ppRepRelBeneficiosDBText23: TppDBText;
    ppRepRelBeneficiosDBText24: TppDBText;
    ppRepRelBeneficiosDBText25: TppDBText;
    ppRepRelBeneficiosDBText26: TppDBText;
    ppRepRelBeneficiosLabel27: TppLabel;
    ppRepRelBeneficiosLabel28: TppLabel;
    ppRepRelBeneficiosLabel29: TppLabel;
    ppRepRelBeneficiosLabel30: TppLabel;
    ppRepRelBeneficiosLabel31: TppLabel;
    ppRepRelBeneficiosLabel33: TppLabel;
    ppRepRelBeneficiosLabel34: TppLabel;
    ppRepRelBeneficiosLabel35: TppLabel;
    ppRepRelBeneficiosLabel36: TppLabel;
    ppRepRelBeneficiosLabel37: TppLabel;
    ppRepRelBeneficiosLabel39: TppLabel;
    ppRepRelBeneficiosLabel40: TppLabel;
    ppRepRelBeneficiosDBText27: TppDBText;
    ppRepRelBeneficiosLabel41: TppLabel;
    ppRepRelBeneficiosLabel42: TppLabel;
    ppRepRelBeneficiosLabel43: TppLabel;
    ppRepRelBeneficiosLine4: TppLine;
    ppRepRelBeneficiosRegion1: TppRegion;
    ppRepRelBeneficiosRegion2: TppRegion;
    ppRepRelBeneficiosLabel32: TppLabel;
    ppRepRelBeneficiosDBText28: TppDBText;
    ppRepRelBeneficiosDBText29: TppDBText;
    ppRepRelBeneficiosDBText30: TppDBText;
    ppRepRelBeneficiosDBText31: TppDBText;
    ppRepRelBeneficiosDBText32: TppDBText;
    ppRepRelBeneficiosDBText33: TppDBText;
    ppRepRelBeneficiosDBText34: TppDBText;
    ppRepRelBeneficiosDBText35: TppDBText;
    ppRepRelBeneficiosDBText36: TppDBText;
    ppRepRelBeneficiosDBText37: TppDBText;
    ppRepRelBeneficiosDBText38: TppDBText;
    ppRepRelBeneficiosLabel38: TppLabel;
    ppRepRelBeneficiosLabel44: TppLabel;
    ppRepRelBeneficiosLabel45: TppLabel;
    ppRepRelBeneficiosLabel46: TppLabel;
    ppRepRelBeneficiosLabel47: TppLabel;
    ppRepRelBeneficiosLabel48: TppLabel;
    ppRepRelBeneficiosLabel49: TppLabel;
    ppRepRelBeneficiosLabel50: TppLabel;
    ppRepRelBeneficiosLabel51: TppLabel;
    ppRepRelBeneficiosDBText39: TppDBText;
    ppRepRelBeneficiosDBText40: TppDBText;
    ppRepRelBeneficiosDBText41: TppDBText;
    ppRepRelBeneficiosDBText42: TppDBText;
    ppRepRelBeneficiosDBText43: TppDBText;
    ppRepRelBeneficiosDBText44: TppDBText;
    ppRepRelBeneficiosLine5: TppLine;
    ppReportPartInconsisLabel1: TppLabel;
    ppReportMovPartDBText17: TppDBText;
    ppReportMovPartLabel5: TppLabel;
    qryMovPartAntVALORINDICE: TFloatField;
    ppReportPartInconsisDBText7: TppDBText;
    ppReportMovPartLabel8: TppLabel;
    ppReportMovPartDBText18: TppDBText;
    qryMovPartAntMESREFERENCIA: TStringField;
    qryMovPartAntDATAALIMENTACAO: TDateTimeField;
    qryMovPartAntIDESTAB: TFloatField;
    qryMovPartAntNOME: TStringField;
    ppReportMovPartLabel9: TppLabel;
    ppReportMovPartDBText19: TppDBText;
    qryMovAntIDHISTRESERVA: TFloatField;
    qryMovAntIDEVENTOGERADOR: TFloatField;
    qryMovAntIDPLANOPREV: TFloatField;
    qryMovAntIDCONTRIBUICAO: TFloatField;
    qryMovAntIDBENEFICIO: TFloatField;
    qryMovAntIDTIPORESERVA: TFloatField;
    qryMovAntIDPESSJUR: TFloatField;
    qryMovAntIDPESSOA: TFloatField;
    qryMovAntDATAMOV: TDateTimeField;
    qryMovAntVLRREAL: TFloatField;
    qryMovAntVLRCOTAS: TFloatField;
    qryMovAntSALDOREAL: TFloatField;
    qryMovAntSALDOCOTAS: TFloatField;
    qryMovAntBENEFICIO: TStringField;
    qryMovAntRESERVA: TStringField;
    qryMovAntPLANPREV: TStringField;
    qryMovAntPESSOA: TStringField;
    qryMovAntPESSJUR: TStringField;
    qryMovAntCONTRIBUICAO: TStringField;
    qryMovAntEVENTO: TStringField;
    qryMovAntVLRREALSAIDA: TFloatField;
    qryMovAntVLRREALENT: TFloatField;
    qryMovAntCOTASSAIDA: TFloatField;
    qryMovAntCOTASENT: TFloatField;
    qryMovAntVLRREALANT: TFloatField;
    qryMovAntVLRCOTASANT: TFloatField;
    qryMovAntFLGENTRADA: TStringField;
    qryMovAntENTRADA: TFloatField;
    qryMovAntINSCRICAONUMERO: TFloatField;
    qryMovAntMATRICULA: TStringField;
    qryMovAntINDICEREAJUSTE: TFloatField;
    qryMovAntSEQPROPOSTA: TFloatField;
    qryMovAntVALORINDICE: TFloatField;
    qryMovAntMESREFERENCIA: TStringField;
    qryMovAntDATAALIMENTACAO: TDateTimeField;
    qryMovAntIDESTAB: TFloatField;
    qryMovAntNOME: TStringField;
    ppReportMovLabel17: TppLabel;
    ppReportMovDBText13: TppDBText;
    ppReportMovDBCalc5: TppDBCalc;
    ppReportMovDBCalc6: TppDBCalc;
    ppReportMovDBCalc9: TppDBCalc;
    ppReportMovDBCalc10: TppDBCalc;
    ppReportMovDBText7: TppDBText;
    ppReportMovLabel1: TppLabel;
    ppReportMovLabel7: TppLabel;
    ppReportMovLabel18: TppLabel;
    ppReportMovDBText8: TppDBText;
    pplblSaldoTotalMoeda: TppLabel;
    ppReportMovLine3: TppLine;
    ppReportMovPartLine1: TppLine;
    CotasAntReal: TppLabel;
    CotasAnt: TppLabel;
    qryMovPartAntFLGPROCEDENCIA: TFloatField;
    ppReportMovPartLabel6: TppLabel;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    ppCalc21: TppSystemVariable;
    ppCalc22: TppSystemVariable;
    ppCalc15: TppSystemVariable;
    ppCalc16: TppSystemVariable;
    ppReportRetiradaCotasCalc1: TppSystemVariable;
    ppCalc23: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    ppReportRetiradaCotasCalc2: TppSystemVariable;
    ppReportRetiradaCotasCalc3: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    ppCalc13: TppSystemVariable;
    ppCalc14: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    ppCalc11: TppSystemVariable;
    ppReportSaldoContasCalc1: TppSystemVariable;
    ppReportTransferenciaCotasCalc1: TppSystemVariable;
    ppReportTransferenciaCotasCalc2: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    ppCalc9: TppSystemVariable;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppCalc7: TppSystemVariable;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppRpInconsisCalc1: TppSystemVariable;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    ppReportMovCalc1: TppSystemVariable;
    ppReportMovCalc2: TppSystemVariable;
    qryMov: TwwQuery;
    qryMovPart: TwwQuery;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    DateTimeField3: TDateTimeField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    FloatField35: TFloatField;
    FloatField36: TFloatField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    FloatField37: TFloatField;
    StringField20: TStringField;
    StringField21: TStringField;
    FloatField38: TFloatField;
    FloatField39: TFloatField;
    FloatField40: TFloatField;
    FloatField41: TFloatField;
    FloatField42: TFloatField;
    FloatField43: TFloatField;
    FloatField44: TFloatField;
    FloatField45: TFloatField;
    FloatField46: TFloatField;
    FloatField47: TFloatField;
    StringField22: TStringField;
    StringField23: TStringField;
    FloatField48: TFloatField;
    FloatField49: TFloatField;
    StringField24: TStringField;
    DateTimeField4: TDateTimeField;
    FloatField50: TFloatField;
    StringField25: TStringField;
    FloatField51: TFloatField;
    qryDocAbertos: TwwQuery;
    dsDocAbertos: TwwDataSource;
    rppDocAbertos: TppBDEPipeline;
    rppDocAbertosppField1: TppField;
    rppDocAbertosppField2: TppField;
    rppDocAbertosppField3: TppField;
    rppDocAbertosppField4: TppField;
    rppDocAbertosppField5: TppField;
    rppDocAbertosppField6: TppField;
    rppDocAbertosppField7: TppField;
    rppDocAbertosppField8: TppField;
    rppDocAbertosppField9: TppField;
    rppDocAbertosppField10: TppField;
    ppDocAbertos: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLine39: TppLine;
    ppLabel17: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppDBText94: TppDBText;
    ppDBText98: TppDBText;
    ppDBText100: TppDBText;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppSummaryBand5: TppSummaryBand;
    ppLabel66: TppLabel;
    ppDBCalc8: TppDBCalc;
    ppGroup23: TppGroup;
    ppGroupHeaderBand23: TppGroupHeaderBand;
    ppLabel67: TppLabel;
    ppDBText113: TppDBText;
    ppLine40: TppLine;
    ppGroupFooterBand23: TppGroupFooterBand;
    ppLabel68: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppGroup24: TppGroup;
    ppGroupHeaderBand24: TppGroupHeaderBand;
    ppDBText114: TppDBText;
    ppDBText115: TppDBText;
    ppLabel69: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppGroupFooterBand24: TppGroupFooterBand;
    ppLabel118: TppLabel;
    ppDBCalc19: TppDBCalc;
    ppLine41: TppLine;
    pplblMovReservaPeriodo: TppLabel;
    ppFechaInterfaceAmPrev: TppBDEPipeline;
    rpFechaInterfaceAmPrev: TppReport;
    ppHeaderBand13: TppHeaderBand;
    lblTitulo: TppLabel;
    rpResumoCobrDBImage1: TppDBImage;
    rpResumoCobrDBText1: TppDBText;
    rpResumoCobrDBText2: TppDBText;
    rpResumoCobrDBText3: TppDBText;
    rpResumoCobrDBText10: TppDBText;
    rpResumoCobrDBText11: TppDBText;
    rpResumoCobrDBText12: TppDBText;
    rpResumoCobrDBText13: TppDBText;
    rpResumoCobrDBText14: TppDBText;
    rpResumoCobrLabel10: TppLabel;
    ppDetailBand13: TppDetailBand;
    rpResumoCobrDBText5: TppDBText;
    rpResumoCobrDBText6: TppDBText;
    rpResumoCobrDBText7: TppDBText;
    ppFooterBand13: TppFooterBand;
    ppLine4: TppLine;
    ppLabel119: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    rpResumoCobrGroup2: TppGroup;
    rpResumoCobrGroupHeaderBand2: TppGroupHeaderBand;
    rpResumoCobrGroupFooterBand2: TppGroupFooterBand;
    rpResumoCobrGroup1: TppGroup;
    rpResumoCobrGroupHeaderBand1: TppGroupHeaderBand;
    rpResumoCobrLabel2: TppLabel;
    rpResumoCobrLabel3: TppLabel;
    rpResumoCobrLabel12: TppLabel;
    rpResumoCobrDBText15: TppDBText;
    rpResumoCobrLine2: TppLine;
    rpResumoCobrLabel1: TppLabel;
    rpResumoCobrDBText4: TppDBText;
    rpResumoCobrLine5: TppLine;
    rpResumoCobrGroupFooterBand1: TppGroupFooterBand;
    rpResumoCobrLabel6: TppLabel;
    rpResumoCobrLine4: TppLine;
    rpResumoCobrGroup3: TppGroup;
    rpResumoCobrGroupHeaderBand3: TppGroupHeaderBand;
    rpResumoCobrGroupFooterBand3: TppGroupFooterBand;
    rpResumoCobrLabel7: TppLabel;
    rpEsperadoSubTot: TppDBCalc;
    rpRecebidoSubTot: TppDBCalc;
    rpResumoCobrLine1: TppLine;
    qryFechaInterfaceAmPrev: TwwQuery;
    dsFechaInterfaceAmPrev: TwwDataSource;
    ppDBText53: TppDBText;
    ppDBCalc20: TppDBCalc;
    rpResumoCobrLine3: TppLine;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    qryFundacao: TwwQuery;
    dsDifInterfaceAdmprev: TwwDataSource;
    ppDifInterfaceAdmprev: TppBDEPipeline;
    qryDifInterfaceAdmprev: TwwQuery;
    rpDifInterfaceAdmprev: TppReport;
    ppHeaderBand14: TppHeaderBand;
    lblTituloDif: TppLabel;
    ppDBImage1: TppDBImage;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppLabel123: TppLabel;
    ppDetailBand14: TppDetailBand;
    ppDBText62: TppDBText;
    ppDBText64: TppDBText;
    ppFooterBand14: TppFooterBand;
    ppLine36: TppLine;
    ppLabel124: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppGroup25: TppGroup;
    ppGroupHeaderBand25: TppGroupHeaderBand;
    ppGroupFooterBand25: TppGroupFooterBand;
    ppGroup26: TppGroup;
    ppGroupHeaderBand26: TppGroupHeaderBand;
    ppLabel127: TppLabel;
    ppDBText66: TppDBText;
    ppLine37: TppLine;
    ppLabel128: TppLabel;
    ppDBText67: TppDBText;
    ppLine38: TppLine;
    ppGroupFooterBand26: TppGroupFooterBand;
    ppLabel131: TppLabel;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppDBCalc26: TppDBCalc;
    ppGroup27: TppGroup;
    ppGroupHeaderBand27: TppGroupHeaderBand;
    ppGroupFooterBand27: TppGroupFooterBand;
    ppLabel132: TppLabel;
    ppLine44: TppLine;
    ppDBCalc29: TppDBCalc;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppLabel126: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppLabel125: TppLabel;
    ppDBText63: TppDBText;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppDBText65: TppDBText;
    ppDBText70: TppDBText;
    qryParcelamento: TwwQuery;
    qryParcelamentoIDPESSOA: TFloatField;
    qryParcelamentoIDTITULAR: TFloatField;
    qryParcelamentoIDPESSJUR: TFloatField;
    qryParcelamentoIDPLANOPREV: TFloatField;
    qryParcelamentoSEQPROPOSTA: TFloatField;
    qryParcelamentoNOME: TStringField;
    qryParcelamentoNOMEPATRO: TStringField;
    qryParcelamentoNOMEPLANO: TStringField;
    qryParcelamentoDATANASC: TDateTimeField;
    qryParcelamentoDATAMORTE: TDateTimeField;
    qryParcelamentoMATRICULA: TStringField;
    qryParcelamentoDATAADMISSAO: TDateTimeField;
    qryParcelamentoDATADEMISSAO: TDateTimeField;
    qryParcelamentoTEMPOSERVANTERIOR: TFloatField;
    qryParcelamentoTEMPONAOCREDITADO: TFloatField;
    qryParcelamentoTEMPOSITESPECIAL: TFloatField;
    qryParcelamentoNIVEL: TStringField;
    qryParcelamentoIDSITFUNC: TFloatField;
    qryParcelamentoTEMPOSERVTOTAL: TFloatField;
    qryParcelamentoTEMPOSERVTOTMES: TFloatField;
    qryParcelamentoTEMPOSERVTOTDIA: TFloatField;
    qryParcelamentoINSCRICAONUMERO: TFloatField;
    qryParcelamentoINSCRICAODATA: TDateTimeField;
    qryParcelamentoFLGDEVEEMPRESTIMO: TFloatField;
    qryParcelamentoFLGDEVEASSISTENC: TFloatField;
    qryParcelamentoFLGDEVEPREVIDENC: TFloatField;
    qryParcelamentoIDSITPART: TFloatField;
    qryParcelamentoIDSITPLANOPREV: TFloatField;
    qryParcelamentoSALMANTIDO: TFloatField;
    qryParcelamentoNOMESITPART: TStringField;
    qryParcelamentoNOMESITFUNC: TStringField;
    qryParcelamentoNOMESITPLANO: TStringField;
    qryParcelamentoFLGINTERNO: TStringField;
    qryParcelamentoIDRUBSALMANUT: TFloatField;
    qryParcelamentoIDRUBSALMANUTPARC: TFloatField;
    qryParcelamentoIDRUBSALPARTICIP: TFloatField;
    qryParcelamentoSALPARTICIPACAO: TFloatField;
    qryParcelamentoIDREGRAVLRDIVIDA: TFloatField;
    qryParcelamentoIDREGRASDODEVEDOR: TFloatField;
    qryParcelamentoIDREGRASALPARCELA: TFloatField;
    qryParcelamentoIDREGRAOPPARCELAS: TFloatField;
    qryParcelamentoIDREGRAAMORTIZA: TFloatField;
    qryParcelamentoVALORDIVIDA: TFloatField;
    dsParcelamento: TwwDataSource;
    ppParcelamento: TppBDEPipeline;
    rpParcelamento: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppDBText71: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBImage8: TppDBImage;
    ppDBText72: TppDBText;
    ppDBText99: TppDBText;
    ppLabel122: TppLabel;
    ppLine46: TppLine;
    ppDetCritCadAnalitico: TppDetailBand;
    ppLabel135: TppLabel;
    ppLabel137: TppLabel;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppLabel138: TppLabel;
    ppDBText75: TppDBText;
    ppLabel139: TppLabel;
    rchopcoes: TppMemo;
    ppLine47: TppLine;
    ppFooterBand16: TppFooterBand;
    ppSystemVariable17: TppSystemVariable;
    ppLabel136: TppLabel;
    ppLine45: TppLine;
    ppSystemVariable18: TppSystemVariable;
    ppSummaryBand6: TppSummaryBand;
    ppReportMov: TppReport;
    qryMovIDHISTRESERVA: TFloatField;
    qryMovIDEVENTOGERADOR: TFloatField;
    qryMovIDPLANOPREV: TFloatField;
    qryMovIDCONTRIBUICAO: TFloatField;
    qryMovIDBENEFICIO: TFloatField;
    qryMovIDTIPORESERVA: TFloatField;
    qryMovIDPESSJUR: TFloatField;
    qryMovIDPESSOA: TFloatField;
    qryMovDATAMOV: TDateTimeField;
    qryMovVLRREAL: TFloatField;
    qryMovSALDOREAL: TFloatField;
    qryMovVLRCOTAS: TFloatField;
    qryMovSALDOCOTAS: TFloatField;
    qryMovVLRREALSAIDA: TFloatField;
    qryMovVLRREALENT: TFloatField;
    qryMovCOTASSAIDA: TFloatField;
    qryMovCOTASENT: TFloatField;
    qryMovVLRREALANT: TFloatField;
    qryMovVLRCOTASANT: TFloatField;
    qryMovBENEFICIO: TStringField;
    qryMovRESERVA: TStringField;
    qryMovPLANPREV: TStringField;
    qryMovPESSOA: TStringField;
    qryMovPESSJUR: TStringField;
    qryMovCONTRIBUICAO: TStringField;
    qryMovEVENTO: TStringField;
    qryMovFLGENTRADA: TStringField;
    qryMovENTRADA: TFloatField;
    qryMovINSCRICAONUMERO: TFloatField;
    qryMovMATRICULA: TStringField;
    qryMovINDICEREAJUSTE: TFloatField;
    qryMovMOESIGLA: TStringField;
    qryMovSIGLAEMP: TStringField;
    qryMovSEQPROPOSTA: TFloatField;
    qryMovVALORINDICE: TFloatField;
    qryMovFLGPROCEDENCIA: TFloatField;
    qryMovMESREFERENCIA: TStringField;
    qryMovDATAALIMENTACAO: TDateTimeField;
    qryMovIDESTAB: TFloatField;
    qryMovNOME: TStringField;
    ppHeaderBand15: TppHeaderBand;
    ppLine48: TppLine;
    ppLabel140: TppLabel;
    ppLabel141: TppLabel;
    ppLabel142: TppLabel;
    ppLabel143: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppFooterBand15: TppFooterBand;
    ppLabel144: TppLabel;
    ppLine49: TppLine;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppGroup29: TppGroup;
    ppGroupHeaderBand29: TppGroupHeaderBand;
    ppLabel148: TppLabel;
    ppDBText88: TppDBText;
    ppLabel149: TppLabel;
    ppDBText89: TppDBText;
    ppGroupFooterBand29: TppGroupFooterBand;
    ppGroup30: TppGroup;
    ppGroupHeaderBand30: TppGroupHeaderBand;
    ppLabel150: TppLabel;
    ppDBText90: TppDBText;
    ppGroupFooterBand30: TppGroupFooterBand;
    ppGroup31: TppGroup;
    ppGroupHeaderBand31: TppGroupHeaderBand;
    ppLabel151: TppLabel;
    ppDBText91: TppDBText;
    ppLabel152: TppLabel;
    ppLabel153: TppLabel;
    ppLabel154: TppLabel;
    ppLabel155: TppLabel;
    ppLabel156: TppLabel;
    ppLabel157: TppLabel;
    ppLabel158: TppLabel;
    ppDBText92: TppDBText;
    ppLabel159: TppLabel;
    ppDBText93: TppDBText;
    ppDBText97: TppDBText;
    ppDBText101: TppDBText;
    ppLabel160: TppLabel;
    ppLabel161: TppLabel;
    ppLabel162: TppLabel;
    ppGroupFooterBand31: TppGroupFooterBand;
    ppLine50: TppLine;
    qryMovPartMODOATUALIZA: TStringField;
    qryMovPartFLGMODATUALIZACAO: TFloatField;
    ppGroup28: TppGroup;
    ppGroupHeaderBand28: TppGroupHeaderBand;
    ppGroupFooterBand28: TppGroupFooterBand;
    ppDBText85: TppDBText;
    ppLabel145: TppLabel;
    ppShape1: TppShape;
    qryMovPartNOMETIPOINDICE: TStringField;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppShape2: TppShape;
    wwQuery1: TwwQuery;
    lblSaldoHoje: TppLabel;
    qryCotacao: TwwQuery;
    qryaux: TwwQuery;
    qryMovPartVLRSDCOTASDATA: TFloatField;
    qryMovPartVLRSDCOTASHOJE: TFloatField;
    ppDBText104: TppDBText;
    qryMovPartVLRSDCOTAS: TFloatField;
    ppSaldoCotas: TppDBText;
    procedure DtmRelatoriosCreate(Sender: TObject);
    procedure DtmRelatoriosDestroy(Sender: TObject);
    procedure qryMovAntCalcFields(DataSet: TDataSet);
    procedure qryMovAntBeforeOpen(DataSet: TDataSet);
    procedure ppReportMovAntBeforePrint(Sender: TObject);
    procedure ppReportMovPartBeforePrint(Sender: TObject);
    procedure qryMovPartAntCalcFields(DataSet: TDataSet);
    procedure qryMovPartAntAfterScroll(DataSet: TDataSet);
    procedure qryMovPartAntBeforeOpen(DataSet: TDataSet);
    procedure ppReportMovPartAfterPrint(Sender: TObject);
    procedure ppReportMovPartEndPage(Sender: TObject);
    procedure ppHeaderBand1AfterPrint(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure ppBDEPipelineMovPartNext(Sender: TObject);
    procedure dsMovPartDataChange(Sender: TObject; Field: TField);
    procedure ppReportMovAntAfterPrint(Sender: TObject);
    procedure ppRpInconsisBeforePrint(Sender: TObject);
    procedure ppReportPartInconsisBeforePrint(Sender: TObject);
    procedure ppDBText7Print(Sender: TObject);
    procedure ppDBText19Print(Sender: TObject);
    procedure ppGroupFooterBand13BeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppValorCotasPrint(Sender: TObject);
    procedure ppDBText5Print(Sender: TObject);
    procedure ppReportTransferenciaCotasBeforePrint(Sender: TObject);
    procedure ppReportSaldoContasBeforePrint(Sender: TObject);
    procedure ppReportSaldoSituacaoBeforePrint(Sender: TObject);
    procedure ppReportRetiradaCotasBeforePrint(Sender: TObject);
    procedure ppReportMovGroupHeaderBand3BeforePrint(Sender: TObject);
    procedure ppReportMovGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppReportMovBeforePrint(Sender: TObject);
    procedure qryMovCalcFields(DataSet: TDataSet);
    procedure qryMovAfterScroll(DataSet: TDataSet);
    procedure rpParcelamentoBeforePrint(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    sOpcoes: TStringList;
    sDataCota : String;
    sidplanoprev, sidpessjur, sidpessoa , sidtiporeserva, sidhistreserva : String;

    function MostraParam(Form: string): boolean; override;

  end;

var
  DtmRelatorios: TDtmRelatorios;
  dValorAcumulado, dValorAcumuladoCotas : double;
  dValorCotas ,dValorReal, dValorTotalCotas, dValorTotalReal : double;
  Primeiro : boolean;
  Linhas, registros, iaux, iContCamposVirtuais : Integer;
  slblvalant,
  slblvalpos,
  slblcotasant,
  slblcotaspos : String;
  Imprimiu, Fim : boolean;


implementation

uses UAutorizacao, USistema, FParamRelMovReserva, FPRelFechaInterfAdmPrev,
  FDifInterfaceAdmPrev, fParamRelMovReservaGeral, FParamRelOpParcelamento,
  UMovReserva;


{$R *.DFM}

procedure TDtmRelatorios.DtmRelatoriosCreate(Sender: TObject);
begin
//qrymov.open;
//Imprimiu := true;

end;

procedure TDtmRelatorios.DtmRelatoriosDestroy(Sender: TObject);
begin
qrymov.close;
qrymovpart.close;
qryinconsis.close;
qryinconsiscol.close;
end;

procedure TDtmRelatorios.qryMovAntCalcFields(DataSet: TDataSet);
begin

if qrymov.fieldbyname('IDEVENTOGERADOR').AsString <> '' then
qrymov.fieldbyname('GERADOR').AsString := ''+qrymov.fieldbyname('EVENTO').AsString
else if qrymov.fieldbyname('IDBENEFICIO').AsString <> '' then
qrymov.fieldbyname('GERADOR').AsString := ''+qrymov.fieldbyname('BENEFICIO').AsString
else if qrymov.fieldbyname('IDCONTRIBUICAO').AsString <> '' then
qrymov.fieldbyname('GERADOR').AsString := ''+qrymov.fieldbyname('CONTRIBUICAO').AsString
else
qrymov.fieldbyname('GERADOR').AsString := 'Atualização Monetária ';


end;

procedure TDtmRelatorios.qryMovAntBeforeOpen(DataSet: TDataSet);
begin
end;

procedure TDtmRelatorios.ppReportMovAntBeforePrint(Sender: TObject);
begin
try
    ppRpLblEmpresa.caption := Sistema.nomeempresa;


except
end;

end;

procedure TDtmRelatorios.ppReportMovPartBeforePrint(Sender: TObject);
begin
try
    ppLabel2.caption := Sistema.nomeempresa;
    dValorAcumulado := 0;
    dValorAcumuladoCotas := 0;
    Linhas := 0;
    Fim := false;
    iaux := 0;

    if trim(sDataCota)  = '' then
      lblSaldoHoje.caption   :=  'Saldo  [Moeda] ' + FormatDateTime('dd/mm/yyyy', Date) 
    else
      lblSaldoHoje.caption :=  'Saldo  [Moeda] ' + sDataCota;
except
end;

end;

procedure TDtmRelatorios.qryMovPartAntCalcFields(DataSet: TDataSet);
var sIndice, sIndiceCotacao : String;
begin

   sIndiceCotacao := '';

   try sIndiceCotacao := qrycotacao.fieldbyname('MOECODIGO').AsString except end;

   sIndice := qryMovPart.fieldbyname('INDICEREAJUSTE').AsString;


   if (sIndiceCotacao <> sIndice ) and ( trim(sIndice) <> '')   then
   begin

      qryCotacao.close;

      if trim(sDataCota) =''
      then begin// Pega ultima Data de Cotação
         qryCotacao.SQL.clear;
         qryCotacao.SQL.Add(' SELECT COT.COTDATA, COT.COTVALOR, MOEDA.MOESIGLA, COT.MOECODIGO ' +
                            ' FROM   COTACAOMOEDA COT , MOEDA ' +
                            ' WHERE  COT.MOECODIGO = ' + sIndice +  ' AND ' +
                            '        MOEDA.MOECODIGO = COT.MOECODIGO AND '+
                            '        COT.COTDATA IN ' +
                            '       (SELECT MAX(COTDATA) FROM COTACAOMOEDA WHERE ' +
                            '               MOECODIGO = ' + sIndice + ')');
      end
      else
      begin // Pega Data de Cotação com a data digitada
         VerifIndiceHist(qryaux , sIndice,
                         qryMovPart.FieldByName('IDPLANOPREV').AsString,
                         qryMovPart.FieldByName('IDTIPORESERVA').AsString,
                         sDataCota );

         qryCotacao.SQL.clear;
         qryCotacao.SQL.Add(' SELECT COT.COTDATA, COT.COTVALOR,  MOEDA.MOESIGLA, COT.MOECODIGO ' +
                            ' FROM   COTACAOMOEDA COT, MOEDA ' +
                            ' WHERE  COT.MOECODIGO = ' + sIndice + ' AND ' +
                            '        MOEDA.MOECODIGO = COT.MOECODIGO AND '+
                            '        COT.COTDATA IN ' +
                            '       (SELECT COTDATA FROM COTACAOMOEDA ' +
                            '        WHERE MOECODIGO = ' + sIndice + ' AND ' +
                            '              COTDATA <= To_Date(''' + Trim(sDataCota) + ''',''dd/MM/yyyy'')) ' +
                            ' ORDER BY COT.COTDATA DESC ');
      end;

      qryCotacao.open;
   end;


   if qryMovPart.FieldByName('FlgProcedencia').AsInteger = 0
   then begin
      if qrymovpart.fieldbyname('IDEVENTOGERADOR').AsString <> ''
      then qrymovpart.fieldbyname('GERADOR').AsString := ''+qrymovpart.fieldbyname('EVENTO').AsString
      else if qrymovpart.fieldbyname('IDBENEFICIO').AsString <> ''
           then qrymovpart.fieldbyname('GERADOR').AsString             := ''+qrymovpart.fieldbyname('BENEFICIO').AsString
           else if qrymovpart.fieldbyname('IDCONTRIBUICAO').AsString <> ''
                then qrymovpart.fieldbyname('GERADOR').AsString := ''+qrymovpart.fieldbyname('CONTRIBUICAO').AsString
                else if (qrymovpart.fieldbyname('IDBENEFICIO').AsString = '') and
                        (qrymovpart.fieldbyname('IDEVENTOGERADOR').AsString = '') and
                        (qrymovpart.fieldbyname('IDCONTRIBUICAO').AsString = '') and
                        (qrymovpart.fieldbyname('VLRCOTAS').AsFloat <= 0 )
                     then qrymovpart.fieldbyname('GERADOR').AsString := 'Atualização Monetária '
                     else if (qrymovpart.fieldbyname('IDBENEFICIO').AsString = '') and
                             (qrymovpart.fieldbyname('IDEVENTOGERADOR').AsString = '') and
                             (qrymovpart.fieldbyname('IDCONTRIBUICAO').AsString = '') and
                             (qrymovpart.fieldbyname('VLRCOTAS').AsFloat > 0 )
                          then qrymovpart.fieldbyname('GERADOR').AsString := 'Excedente Financeiro ';
   end
   else if qryMovPart.FieldByName('FlgProcedencia').AsInteger = 1
        then qrymovpart.fieldbyname('GERADOR').AsString := 'Alimentação  ';


   if qrymovpart.fieldbyname('ENTRADA').AsInteger = 1 then
   begin
      qrymovpart.fieldbyname('VLRREALCALC').AsFloat := qrymovpart.fieldbyname('VLRREAL').AsFloat;
      qrymovpart.fieldbyname('VLRCOTASCALC').AsFloat := qrymovpart.fieldbyname('VLRCOTAS').AsFloat;
   end
   else
   begin
      qrymovpart.fieldbyname('VLRREALCALC').AsFloat := 0-qrymovpart.fieldbyname('VLRREAL').AsFloat;
      qrymovpart.fieldbyname('VLRCOTASCALC').AsFloat := 0-qrymovpart.fieldbyname('VLRCOTAS').AsFloat;
   end;

   qrymovpart.fieldbyname('VLRSDREALHOJE').AsFloat := qrymovpart.fieldbyname('VLRCOTASCALC').AsFloat * qrycotacao.fieldbyname('COTVALOR').AsFloat;

end;

procedure TDtmRelatorios.qryMovPartAntAfterScroll(DataSet: TDataSet);
begin

if qrymovpart.EOF then
begin
   dValorAcumulado := 0;
   dValorAcumuladoCotas := 0;
end;
end;





procedure TDtmRelatorios.qryMovPartAntBeforeOpen(DataSet: TDataSet);
begin
  Primeiro := True;
end;

procedure TDtmRelatorios.ppReportMovPartAfterPrint(Sender: TObject);
begin

end;

procedure TDtmRelatorios.ppReportMovPartEndPage(Sender: TObject);
begin
end;

procedure TDtmRelatorios.ppHeaderBand1AfterPrint(Sender: TObject);
begin
   iAux := 0;
end;

procedure TDtmRelatorios.ppHeaderBand1BeforePrint(Sender: TObject);
begin
//
end;

procedure TDtmRelatorios.ppBDEPipelineMovPartNext(Sender: TObject);
begin


end;

procedure TDtmRelatorios.dsMovPartDataChange(Sender: TObject;
  Field: TField);
begin
 end;

procedure TDtmRelatorios.ppReportMovAntAfterPrint(Sender: TObject);
begin
try
 
except end;
end;

procedure TDtmRelatorios.ppRpInconsisBeforePrint(Sender: TObject);
begin

end;


procedure TDtmRelatorios.ppReportPartInconsisBeforePrint(Sender: TObject);
begin

end;

procedure TDtmRelatorios.ppDBText7Print(Sender: TObject);
begin
end;

procedure TDtmRelatorios.ppDBText19Print(Sender: TObject);
begin
end;

procedure TDtmRelatorios.ppGroupFooterBand13BeforePrint(Sender: TObject);
begin
   ppLabel70.Text := floattostr(ppDBCalc3.Value - ppDBCalc1.Value);
   ppLabel71.Text := floattostr(ppDBCalc4.Value - ppDBCalc2.Value);
end;

procedure TDtmRelatorios.ppDetailBand1BeforePrint(Sender: TObject);
begin

end;

procedure TDtmRelatorios.ppValorCotasPrint(Sender: TObject);
begin
  if qrymovpart.fieldbyname('flgentrada').AsString = 'Saída' then
  ppValorCotas.Color := clRed;
end;

procedure TDtmRelatorios.ppDBText5Print(Sender: TObject);
begin
  if qrymovpart.fieldbyname('flgentrada').AsString = 'Saída' then
  ppDBText5.Color := clRed;

end;

procedure TDtmRelatorios.ppReportTransferenciaCotasBeforePrint(
  Sender: TObject);
begin
  qryTransferenciaCotas.Close;
  qryTransferenciaCotas.Open;
end;

procedure TDtmRelatorios.ppReportSaldoContasBeforePrint(Sender: TObject);
begin
  qrySaldoContas.Close;
  qrySaldoContas.Open;
end;

procedure TDtmRelatorios.ppReportSaldoSituacaoBeforePrint(Sender: TObject);
begin
  qrySaldoSituacao.Close;
  qrySaldoSituacao.Open;
end;

procedure TDtmRelatorios.ppReportRetiradaCotasBeforePrint(Sender: TObject);
begin
  qryRetiradaCotas.Open;
  qryRetiradaCotas.Close;
end;

function TDtmRelatorios.MostraParam(Form: string): boolean;
var frm : TForm;
begin
   //************************
  if (UPPERCASE(Form) = 'FORMGERAL')
  then frm := TfrmParamRelMovReservaGeral.Create(Application)
   else if (UPPERCASE(Form) = 'FORMINDIVIDUAL')
   then frm := TfrmParamRelMovReserva .Create(Application)
   else if (UPPERCASE(Form) = 'FRMPRELFECHAINTERFADMPREV')
   then frm := TfrmPRelFechaInterfAdmPrev .Create(Application)
   else if (UPPERCASE(Form) = 'FRMDIFINTERFACEADMPREV')
   then frm := TFrmDifInterfaceAdmPrev .Create(Application)
   else if (UPPERCASE(Form) = 'FRMPARAMRELOPPARCELAMENTO')
   then frm := TfrmParamRelOpParcelamento.Create(Application)
   else frm := nil;

   if frm = nil
   then Result := false
   else begin
      with frm do
      begin
         Result := (ShowModal = mrOk);
         Free;
      end;
   end;


end; // MostraParam

procedure TDtmRelatorios.ppReportMovGroupHeaderBand3BeforePrint(
  Sender: TObject);
begin

end;

procedure TDtmRelatorios.ppReportMovGroupFooterBand1BeforePrint(
  Sender: TObject);
begin
  pplblSaldoTotalMoeda.Text := FloattoStr((StrtoFloat(ppReportMovDBCalc7.Text) * StrtoFloat(ppReportMovDBText7.Text)));
end;

procedure TDtmRelatorios.ppReportMovBeforePrint(Sender: TObject);
begin
  inherited;
  try
    ppLabel141.caption := Sistema.nomeempresa;
  except
  end;
end;

procedure TDtmRelatorios.qryMovCalcFields(DataSet: TDataSet);
begin
  inherited;
if qrymov.FieldByName('FlgProcedencia').AsInteger = 0
then begin
   if qrymov.fieldbyname('IDEVENTOGERADOR').AsString <> ''
   then qrymov.fieldbyname('GERADOR').AsString := ''+qrymov.fieldbyname('EVENTO').AsString
   else if qrymov.fieldbyname('IDBENEFICIO').AsString <> ''
        then qrymov.fieldbyname('GERADOR').AsString             := ''+qrymov.fieldbyname('BENEFICIO').AsString
        else if qrymov.fieldbyname('IDCONTRIBUICAO').AsString <> ''
             then qrymov.fieldbyname('GERADOR').AsString := ''+qrymov.fieldbyname('CONTRIBUICAO').AsString
             else if (qrymov.fieldbyname('IDBENEFICIO').AsString = '') and
                     (qrymov.fieldbyname('IDEVENTOGERADOR').AsString = '') and
                     (qrymov.fieldbyname('IDCONTRIBUICAO').AsString = '') and
                     (qrymov.fieldbyname('VLRCOTAS').AsFloat <= 0 )
                  then qrymov.fieldbyname('GERADOR').AsString := 'Atualização Monetária '
                  else if (qrymov.fieldbyname('IDBENEFICIO').AsString = '') and
                          (qrymov.fieldbyname('IDEVENTOGERADOR').AsString = '') and
                          (qrymov.fieldbyname('IDCONTRIBUICAO').AsString = '') and
                          (qrymov.fieldbyname('VLRCOTAS').AsFloat > 0 )
                       then qrymov.fieldbyname('GERADOR').AsString := 'Excedente Financeiro ';
end
else if qrymov.FieldByName('FlgProcedencia').AsInteger = 1
     then qrymov.fieldbyname('GERADOR').AsString := 'Alimentação Manual';


if qrymov.fieldbyname('ENTRADA').AsInteger = 1 then
begin
   qrymov.fieldbyname('VLRREALCALC').AsFloat := qrymov.fieldbyname('VLRREAL').AsFloat;
   qrymov.fieldbyname('VLRCOTASCALC').AsFloat := qrymov.fieldbyname('VLRCOTAS').AsFloat;
end
else
begin
   qrymov.fieldbyname('VLRREALCALC').AsFloat := 0-qrymov.fieldbyname('VLRREAL').AsFloat;
   qrymov.fieldbyname('VLRCOTASCALC').AsFloat := 0-qrymov.fieldbyname('VLRCOTAS').AsFloat;
end;

end;

procedure TDtmRelatorios.qryMovAfterScroll(DataSet: TDataSet);
begin
  inherited;
if qrymov.EOF then
begin
   dValorAcumulado := 0;
   dValorAcumuladoCotas := 0;
end;

end;

procedure TDtmRelatorios.rpParcelamentoBeforePrint(Sender: TObject);
begin
  inherited;
  rchopcoes.text := dtmRelatorios.sOpcoes.Text;
end;

end.
