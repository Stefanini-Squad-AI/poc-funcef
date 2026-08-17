
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************

// *****************************************************************************
//--------------------------------------------------------------------------------------------------
// Pendência   : SIG 28583
// Responsável : William Moreira da Silva
// Data        : 02/09/2016
// Descrição   : Alteração da query no qryFichaFunc, para modificar o estado civil do relatorio (.dfm)
//--------------------------------------------------------------------------------------------------
// Pendência   : SIG25102
// Responsável : Peterson Victor
// Data        : 13/07/2016
// Descrição   : Alteração da query no qryFichaFunc (.dfm)
//---------------------------------------------------------------------------------------------------
// Pendência   : SOL 193131 KINTANA 1886224
// Responsável : Higor Nayde
// Data        : 31/05/2013
// Descrição   :  Incluir campo denominado "Quantidade de dias" e exibi-lo na grid da funcionalidade
//---------------------------------------------------------------------------------------------------
// Autor(a)    :  Marcio Sanches Spinosa
// Data        :  26/09/2012
// Pendência   : SOL 155203 KINTANA 1200659
// Descricao   :  alteração no relatorio ficha funcional, adicionando advertencia 
// e/ou suspensão.
//------------------------------------------------------------------------------
// Autor(a)    :  Marcio Sanches Spinosa
// Data        :  07/08/2012
// Pendência   : SOL 155216 KINTANA 1200769
// Descricao   :  alteração no relatorio ficha funcional, retirando alguns campos
// conforme a EF e adicionando outros como dias ferias e dias abonos.
//------------------------------------------------------------------------------
// Autor(a)    : Helen V Bianchi
// Data        : 08/03/2012
// Pendência   : SOL 176106 KINTANA 1604729
// Descricao   : CrmRptCMBeforePrint - Caminho a ser salvo a Qry.txt
//------------------------------------------------------------------------------
// Autor(a)    : Marcos Luiz de Jesus
// Data        : 08/06/2010
// Pendência   : SOL 137345 KINTANA 829213
// Descricao   : Consertar o label no relatorio descrição Nacionalidade
//-
unit RFichaFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dReports, Db,
  ppCtrls, ppBands, ppClass, ppPrnabl, ppProd, ppReport, DBTables, Wwdatsrc, ppComm, ppCache,
  ppDB, ppDBBDE, ppStrtch, ppMemo, ppRichTx, ppSubRpt, ppEndUsr, ppVar, ppRelatv, ppDBPipe,
  ppBarCod, ppRegion, FCmReport, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlListTerceirosRH, Wwquery, ppModule, raCodMod,
  TXRB, ppParameter;

type
  TRptFichaFunc = class(TFrmCmReport)
    rpFichaFunc: TppReport;
    ppFichaFunc: TppBDEPipeline;
    dsFichaFunc: TwwDataSource;
    ppIMG: TppBDEPipeline;
    dsIMG: TwwDataSource;
    ppFichaFunc1: TppBDEPipeline;
    dsFichaFunc1: TwwDataSource;
    ppFichaFunc2: TppBDEPipeline;
    dsFichaFunc2: TwwDataSource;
    ppFichaFunc3: TppBDEPipeline;
    dsFichaFunc3: TwwDataSource;
    ppFichaFunc4: TppBDEPipeline;
    dsFichaFunc4: TwwDataSource;
    ppFichaFunc5: TppBDEPipeline;
    dsFichaFunc5: TwwDataSource;
    ppFichaFunc6: TppBDEPipeline;
    dsFichaFunc6: TwwDataSource;
    ppFichaFunc7: TppBDEPipeline;
    dsFichaFunc7: TwwDataSource;
    ppFichaFunc8: TppBDEPipeline;
    dsFichaFunc8: TwwDataSource;
    ppFichaFunc9: TppBDEPipeline;
    dsFichaFunc9: TwwDataSource;
    ppFichaFunc10: TppBDEPipeline;
    dsFichaFunc10: TwwDataSource;
    ppFichaFunc11: TppBDEPipeline;
    dsFichaFunc11: TwwDataSource;
    ppFichaFunc12: TppBDEPipeline;
    dsFichaFunc12: TwwDataSource;
    CdsIMG: TCMClientDataSet;
    qryFichaFunc: TwwQuery;
    qryFichaFunc1: TwwQuery;
    qryFichaFunc2: TwwQuery;
    qryFichaFunc3: TwwQuery;
    qryFichaFunc4: TwwQuery;
    qryFichaFunc5: TwwQuery;
    qryFichaFunc6: TwwQuery;
    qryFichaFunc7: TwwQuery;
    qryFichaFunc9: TwwQuery;
    qryFichaFunc10: TwwQuery;
    qryFichaFunc11: TwwQuery;
    qryFichaFunc12: TwwQuery;
    qryFichaFunc8: TwwQuery;
    ppFichaFunc13: TppBDEPipeline;
    dsFichaFunc13: TwwDataSource;
    qryFichaFunc13: TwwQuery;
    ppFichaFunc14: TppBDEPipeline;
    dsFichaFunc14: TwwDataSource;
    qryFichaFunc14: TwwQuery;
    qryFichaFunc14IDADVERTSUSP: TFloatField;
    qryFichaFunc14IDPESSOA: TFloatField;
    qryFichaFunc14TIPO: TStringField;
    qryFichaFunc14DATAATO: TDateTimeField;
    qryFichaFunc14DATAADVSUSP: TDateTimeField;
    qryFichaFunc14MOTIVO: TMemoField;
    ppFichaFunc14ppField7: TppField;
    rpFichaFuncHdrBnd: TppHeaderBand;
    rpFichaFuncLbl1: TppLabel;
    rpFichaFuncDBTxt1: TppDBText;
    rpFichaFuncLine1: TppLine;
    ppLabel9: TppLabel;
    ppDBText7: TppDBText;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel11: TppLabel;
    rpFichaFuncDbCNPJ: TppDBText;
    ppLabel12: TppLabel;
    ppDBText18: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppLabel23: TppLabel;
    ppLabel72: TppLabel;
    ppDBText59: TppDBText;
    rpFichaFuncDtlBnd: TppDetailBand;
    rpFichaFuncLabel4: TppLabel;
    rpFichaFuncLabel1: TppLabel;
    rpFichaFuncLabel2: TppLabel;
    rpFichaFuncLabel3: TppLabel;
    rpFichaFuncLabel6: TppLabel;
    rpFichaFuncLabel7: TppLabel;
    rpFichaFuncDBText1: TppDBText;
    rpFichaFuncDBText2: TppDBText;
    rpFichaFuncDBText3: TppDBText;
    rpFichaFuncDBText4: TppDBText;
    rpFichaFuncDBText5: TppDBText;
    rpFichaFuncDBText6: TppDBText;
    rpFichaFuncDBText7: TppDBText;
    rpFichaFuncDBText8: TppDBText;
    rpFichaFuncDBText10: TppDBText;
    rpFichaFuncDBText11: TppDBText;
    rpFichaFuncDBText12: TppDBText;
    rpFichaFuncDBText14: TppDBText;
    rpFichaFuncDBText15: TppDBText;
    rpFichaFuncDBText16: TppDBText;
    rpFichaFuncDBText17: TppDBText;
    rpFichaFuncLbl5: TppLabel;
    rpFichaFuncDBTxt6: TppDBText;
    rpFichaFuncLbl10: TppLabel;
    rpFichaFuncDBTxt11: TppDBText;
    rpFichaFuncLbl6: TppLabel;
    rpFichaFuncDBTxt7: TppDBText;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppLine2: TppLine;
    ppLabel24: TppLabel;
    ppDBText28: TppDBText;
    ppLabel25: TppLabel;
    ppDBText29: TppDBText;
    ppLine3: TppLine;
    ppRegiaoDemitido: TppRegion;
    ppLabel26: TppLabel;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppLabel31: TppLabel;
    ppLabel33: TppLabel;
    ppLabel29: TppLabel;
    ppDBText32: TppDBText;
    ppRegiaoDescCargo: TppRegion;
    ppLabel41: TppLabel;
    rpFichaFuncDbDescCargo: TppDBMemo;
    rpFichaFuncLblNivel: TppLabel;
    rpFichaFuncDbNivel: TppDBText;
    rpFichaFuncFootBnd: TppFooterBand;
    ppLabel27: TppLabel;
    ppLine4: TppLine;
    ppLabel28: TppLabel;
    ppLine5: TppLine;
    rpFichaFuncSmryBnd: TppSummaryBand;
    rpFichaFuncGroup1: TppGroup;
    rpFichaFuncGrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncLbl2: TppLabel;
    rpFichaFuncDBTxt2: TppDBText;
    rpFichaFuncDBTxt3: TppDBText;
    rpFichaFuncDBTxt4: TppDBText;
    rpFichaFuncDBTxt5: TppDBText;
    rpFichaFuncLbl3: TppLabel;
    rpFichaFuncLbl4: TppLabel;
    rpFichaFuncLbl8: TppLabel;
    rpFichaFuncLbl9: TppLabel;
    rpFichaFuncDBTxt9: TppDBText;
    rpFichaFuncDBTxt10: TppDBText;
    rpFichaFuncLine2: TppLine;
    rpFichaFuncLabel5: TppLabel;
    rpFichaFuncDBText9: TppDBText;
    rpFichaFuncLabel8: TppLabel;
    rpFichaFuncDBText13: TppDBText;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppDBText5: TppDBText;
    ppRegiaoEstrangeiro: TppRegion;
    ppLabel13: TppLabel;
    ppDBText17: TppDBText;
    ppDBText20: TppDBText;
    ppLabel15: TppLabel;
    ppDBText21: TppDBText;
    ppLabel16: TppLabel;
    ppDBText22: TppDBText;
    ppLabel17: TppLabel;
    ppDBText23: TppDBText;
    ppLabel19: TppLabel;
    ppDBText25: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBText26: TppDBText;
    ppLabel22: TppLabel;
    rpFichaFuncGrpFootBnd: TppGroupFooterBand;
    rpFichaFuncSubReport1: TppSubReport;
    rpFichaFuncCR1: TppChildReport;
    rpFichaFuncSubReport1DtlBnd: TppDetailBand;
    rpFichaFuncSubReport1DBTxt1: TppDBText;
    rpFichaFuncSubReport1DBTxt2: TppDBText;
    rpFichaFuncSubReport1DBTxt3: TppDBText;
    rpFichaFuncSubReport1DBTxt4: TppDBText;
    rpFichaFuncSubReport1DBTxt5: TppDBText;
    rpFichaFuncGrp1: TppGroup;
    rpFichaFuncSubReport1GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport1Lbl1: TppLabel;
    rpFichaFuncSubReport1Lbl2: TppLabel;
    rpFichaFuncSubReport1Lbl3: TppLabel;
    rpFichaFuncSubReport1Lbl4: TppLabel;
    rpFichaFuncSubReport1Lbl5: TppLabel;
    ppLabel68: TppLabel;
    rpFichaFuncSubReport1GrpFootBnd: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    rpFichaFuncSubReport2: TppSubReport;
    rpFichaFuncCR2: TppChildReport;
    rpFichaFuncSubReport2DtlBnd: TppDetailBand;
    rpFichaFuncSubReport2DBTxt1: TppDBText;
    rpFichaFuncSubReportDBTxt2: TppDBText;
    rpFichaFuncSubReport2DBTxt3: TppDBText;
    rpFichaFuncSubReport2DBTxt4: TppDBText;
    rpFichaFuncSubReport2DBTxt5: TppDBText;
    rpFichaFuncSubReport2DBTxt6: TppDBText;
    rpFichaFuncGrp2: TppGroup;
    rpFichaFuncSubReport2GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport2Lbl1: TppLabel;
    rpFichaFuncSubReport2Lbl2: TppLabel;
    rpFichaFuncSubReport2Lbl3: TppLabel;
    rpFichaFuncSubReport2Lbl4: TppLabel;
    rpFichaFuncSubReport2Lbl5: TppLabel;
    ppLabel67: TppLabel;
    rpFichaFuncSubReport2GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncSubReport3: TppSubReport;
    rpFichaFuncCR3: TppChildReport;
    rpFichaFuncSubReport3DtlBnd: TppDetailBand;
    rpFichaFuncSubReport3DBTxt1: TppDBText;
    rpFichaFuncSubReport3DBTxt2: TppDBText;
    rpFichaFuncSubReport3DBTxt3: TppDBText;
    rpFichaFuncSubReport3DBTxt4: TppDBText;
    rpFichaFuncGrp3: TppGroup;
    rpFichaFuncSubReport3GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport3Lbl1: TppLabel;
    rpFichaFuncSubReport3Lbl2: TppLabel;
    rpFichaFuncSubReport3Lbl3: TppLabel;
    rpFichaFuncSubReport3Lbl4: TppLabel;
    ppLabel66: TppLabel;
    rpFichaFuncSubReport3GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncSubReport4: TppSubReport;
    rpFichaFuncCR4: TppChildReport;
    rpFichaFuncSubReport4DtlBnd: TppDetailBand;
    rpFichaFuncSubReportDBText1: TppDBText;
    rpFichaFuncSubReportDBText2: TppDBText;
    rpFichaFuncSubReportDBText3: TppDBText;
    rpFichaFuncGrp4: TppGroup;
    rpFichaFuncSubReport4GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport4Lbl1: TppLabel;
    rpFichaFuncSubReport4Lbl2: TppLabel;
    rpFichaFuncSubReport4Lbl3: TppLabel;
    ppLabel65: TppLabel;
    rpFichaFuncSubReport4GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncSubReport5: TppSubReport;
    rpFichaFuncCR5: TppChildReport;
    rpFichaFuncSubReport5DtlBnd: TppDetailBand;
    rpFichaFuncSubReport5DBTxt1: TppDBText;
    rpFichaFuncSubReport5DBTxt2: TppDBText;
    rpFichaFuncSubReport5DBTxt3: TppDBText;
    rpFichaFuncSubReport5DBMemo1: TppDBMemo;
    rpFichaFuncSubReport5DBTxt4: TppDBText;
    rpFichaFuncGrp5: TppGroup;
    rpFichaFuncSubReport5GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport5Lbl1: TppLabel;
    rpFichaFuncSubReport5Lbl2: TppLabel;
    rpFichaFuncSubReport5Lbl3: TppLabel;
    rpFichaFuncSubReport5Lbl4: TppLabel;
    ppLabel64: TppLabel;
    rpFichaFuncSubReport5GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncSubReport6: TppSubReport;
    rpFichaFuncCR6: TppChildReport;
    rpFichaFuncSubReport6DtlBnd: TppDetailBand;
    rpFichaFuncSubReport6DBTxt1: TppDBText;
    rpFichaFuncSubReport6DBTxt2: TppDBText;
    rpFichaFuncSubReport6DBMemo1: TppDBMemo;
    ppDBText57: TppDBText;
    rpFichaFuncGrp6: TppGroup;
    rpFichaFuncSubReport6GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport6Lbl1: TppLabel;
    rpFichaFuncSubReport6Lbl2: TppLabel;
    ppLabel63: TppLabel;
    ppLabel70: TppLabel;
    rpFichaFuncSubReport6GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncSubReport7: TppSubReport;
    rpFichaFuncCR7: TppChildReport;
    rpFichaFuncSubReport7DtlBnd: TppDetailBand;
    rpFichaFuncSubReport7DBTxt1: TppDBText;
    rpFichaFuncSubReport7DBTxt2: TppDBText;
    rpFichaFuncSubReport7DBTxt3: TppDBText;
    rpFichaFuncSubReport7DBTxt4: TppDBText;
    rpFichaFuncSubReport7DBTxt5: TppDBText;
    ppDBText60: TppDBText;
    rpFichaFuncGrp7: TppGroup;
    rpFichaFuncSubReport7GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport7Lbl1: TppLabel;
    rpFichaFuncSubReport7Lbl2: TppLabel;
    rpFichaFuncSubReport7Lbl3: TppLabel;
    rpFichaFuncSubReport7Lbl4: TppLabel;
    rpFichaFuncSubReport7Lbl5: TppLabel;
    ppLabel62: TppLabel;
    ppLabel73: TppLabel;
    rpFichaFuncSubReport7FootBnd: TppGroupFooterBand;
    rpFichaFuncSubReport8: TppSubReport;
    rpFichaFuncCR8: TppChildReport;
    rpFichaFuncSubReport8DtlBnd: TppDetailBand;
    rpFichaFuncSubReport8DBTxt1: TppDBText;
    rpFichaFuncSubReport8DBTxt2: TppDBText;
    rpFichaFuncSubReport8DBTxt3: TppDBText;
    rpFichaFuncSubReport8Lbl5: TppLabel;
    rpFichaFuncGrp8: TppGroup;
    rpFichaFuncSubReport8GrpHdrBnd: TppGroupHeaderBand;
    rpFichaFuncSubReport8Lbl1: TppLabel;
    rpFichaFuncSubReport8Lbl2: TppLabel;
    rpFichaFuncSubReport8Lbl3: TppLabel;
    rpFichaFuncSubReport8Lbl4: TppLabel;
    ppLabel61: TppLabel;
    rpFichaFuncSubReport8GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncSubReport9: TppSubReport;
    rpFichaFuncCR9: TppChildReport;
    rpFichaFuncSubReport9DtlBnd: TppDetailBand;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText36: TppDBText;
    ppDBText58: TppDBText;
    rpFichaFuncGrp9: TppGroup;
    rpFichaFuncSubReport9GrpHdrBnd: TppGroupHeaderBand;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    ppLabel34: TppLabel;
    ppLabel60: TppLabel;
    ppLabel35: TppLabel;
    ppLabel71: TppLabel;
    rpFichaFuncSubReport9GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncSubReport10: TppSubReport;
    rpFichaFuncCR10: TppChildReport;
    rpFichaFuncSubReport10DtlBnd: TppDetailBand;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText51: TppDBText;
    rpFichaFuncGrp10: TppGroup;
    rpFichaFuncSubReport10GrpHdrBnd: TppGroupHeaderBand;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel50: TppLabel;
    ppLabel59: TppLabel;
    rpFichaFuncSubReport10GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncSubReport11: TppSubReport;
    rpFichaFuncCR11: TppChildReport;
    rpFichaFuncSubReport11DtlBnd: TppDetailBand;
    ppDBText41: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    rpFichaFuncGrp11: TppGroup;
    rpFichaFuncSubReport11GrpHdrBnd: TppGroupHeaderBand;
    ppLabel40: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel58: TppLabel;
    rpFichaFuncSubReport11GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncSubReport12: TppSubReport;
    rpFichaFuncCR12: TppChildReport;
    rpFichaFuncSubReport12DtlBnd: TppDetailBand;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    rpFichaFuncGrp12: TppGroup;
    rpFichaFuncSubReport12GrpHdrBnd: TppGroupHeaderBand;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel57: TppLabel;
    rpFichaFuncSubReport12GrpFootBnd: TppGroupFooterBand;
    rpFichaFuncSubReport13: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    ppLabel14: TppLabel;
    ppLabel18: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText11: TppDBText;
    ppDBText19: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLabel44: TppLabel;
    ppDBText24: TppDBText;
    ppLabel48: TppLabel;
    ppDBText27: TppDBText;
    ppLabel49: TppLabel;
    ppDBText42: TppDBText;
    ppLabel51: TppLabel;
    ppDBText45: TppDBText;
    ppLabel52: TppLabel;
    ppDBText52: TppDBText;
    ppLabel53: TppLabel;
    ppDBText53: TppDBText;
    ppLabel54: TppLabel;
    ppDBText54: TppDBText;
    ppLabel55: TppLabel;
    ppDBText55: TppDBText;
    ppLabel56: TppLabel;
    ppDBText56: TppDBText;
    ppLine6: TppLine;
    ppLabel69: TppLabel;
    rpFichaFuncSubReport14: TppSubReport;
    rpFichaFuncCR14: TppChildReport;
    rpFichaFuncSubReport14DtlBnd: TppDetailBand;
    ppDBText62: TppDBText;
    ppDBText61: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppGroup2: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    raCodeModule2: TraCodeModule;
    qryFichaFuncEMPRESA: TStringField;
    qryFichaFuncIMAGEM: TBlobField;
    qryFichaFuncNOME: TStringField;
    qryFichaFuncIDIMAGEM: TFloatField;
    qryFichaFuncIDPESSOA: TFloatField;
    qryFichaFuncNIVELINDIV1: TFloatField;
    qryFichaFuncCNPJ: TStringField;
    qryFichaFuncCNAE: TStringField;
    qryFichaFuncMATRICULA: TStringField;
    qryFichaFuncNACIONALIDADE: TStringField;
    qryFichaFuncNATURALIDADE: TStringField;
    qryFichaFuncDATANASC: TDateTimeField;
    qryFichaFuncNOMEPAI: TStringField;
    qryFichaFuncNOMEMAE: TStringField;
    qryFichaFuncSITUACAO: TStringField;
    qryFichaFuncTIPOSIT: TStringField;
    qryFichaFuncDATAOPCAOFGTS: TDateTimeField;
    qryFichaFuncDATAADMISSAO: TStringField;
    qryFichaFuncDATADEMISSAO: TStringField;
    qryFichaFuncDATADEMISSAOFLAG: TDateTimeField;
    qryFichaFuncMOTIVODESLIG: TStringField;
    qryFichaFuncANOCHEGADA: TDateTimeField;
    qryFichaFuncIDESTRANGEIRO: TFloatField;
    qryFichaFuncNATURALIZADO: TStringField;
    qryFichaFuncCASADOBRASILEIRO: TStringField;
    qryFichaFuncFILHOSBRASILEIROS: TStringField;
    qryFichaFuncDECRETONATURALIZACAO: TFloatField;
    qryFichaFuncMOD19NUMERO: TFloatField;
    qryFichaFuncMOD19REGISTRO: TFloatField;
    qryFichaFuncSEXO: TStringField;
    qryFichaFuncESTCIVIL: TStringField;
    qryFichaFuncVINCULO: TStringField;
    qryFichaFuncLOGRAJ: TStringField;
    qryFichaFuncBAIRROJ: TStringField;
    qryFichaFuncCEPJ: TStringField;
    qryFichaFuncNUMEROJ: TStringField;
    qryFichaFuncCIDADEJ: TStringField;
    qryFichaFuncUFJ: TStringField;
    qryFichaFuncCOMPLEJ: TStringField;
    qryFichaFuncLOGRADOURO: TStringField;
    qryFichaFuncBAIRRO: TStringField;
    qryFichaFuncCEP: TStringField;
    qryFichaFuncNUMERO: TStringField;
    qryFichaFuncCIDADE: TStringField;
    qryFichaFuncCODESTADO: TStringField;
    qryFichaFuncCOMPLEMENTO: TStringField;
    qryFichaFuncESTAB: TStringField;
    qryFichaFuncCARGO: TStringField;
    qryFichaFuncDESCRCARGO: TStringField;
    qryFichaFuncPROFISSAO: TStringField;
    qryFichaFuncC_CUSTO: TStringField;
    qryFichaFuncSALARIOATUAL: TFloatField;
    qryFichaFuncTIPOPAGAMENTO: TStringField;
    qryFichaFuncGRINSTR: TStringField;
    qryFichaFuncDDI: TStringField;
    qryFichaFuncDDD: TStringField;
    qryFichaFuncTELEFONE: TStringField;
    qryFichaFuncJORNADAMENSAL: TFloatField;
    qryFichaFuncNOMEHORARIO: TStringField;
    ppDBImage1: TppDBImage;
//    ppDBText60: TppDBText;
    procedure rpFichaFuncSmryBndAfterPrint(Sender: TObject);
    procedure rpFichaFuncGrpHdrBndBeforePrint(Sender: TObject);
    procedure rpFichaFuncSubReport8DtlBndBeforePrint(Sender: TObject);
    procedure rpFichaFuncSubReport1DBTxt2Print(Sender: TObject);
    procedure rpFichaFuncSubReport3DtlBndBeforePrint(Sender: TObject);
    procedure rpFichaFuncSubReport5DtlBndBeforePrint(Sender: TObject);
    procedure rpFichaFuncSubReport6DtlBndBeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qryFichaFuncAfterScroll(DataSet: TDataSet);
    procedure rpFichaFuncGrpFootBndBeforePrint(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    procedure SelFoto(IdImagem: double);
    procedure SelDados(IdPessoa: double);
  end;

var
  RptFichaFunc: TRptFichaFunc;

implementation

uses uSistema, uCtrlPadroes, fAguarde, dCds, uFuncoesUteisRH, uCtrlUsoGeralRH,
     uModulo;

{$R *.DFM}

procedure TRptFichaFunc.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);
end;

procedure TRptFichaFunc.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TRptFichaFunc.CrmRptCMBeforePrint(Sender: TObject);
var
  c: byte;
  SubReport: TppSubReport;
  sFileName, sNewFile: String;
  ST1                           : TStream;
  BM1                           : TBitmap;
begin
  inherited;
  rpFichaFuncFootBnd.Visible := (CmpRptCM.ParamByName('IncluirRodape').asBoolean);

  rpFichaFuncDbNivel.Visible := (Modulo.IdContraCheque = FUNCEF);
  rpFichaFuncLblNivel.Visible := (Modulo.IdContraCheque = FUNCEF);

  if (CmpRptCM.ParamByName('ImprimirAvalHay').asBoolean) then
  begin
    qryFichaFunc13.SQL[47] := '   WHERE  (H.MES       = ' + QuotedStr(CmpRptCM.ParamByName('MesRef').asString) + ') AND';
    qryFichaFunc13.SQL[48] := '       (H.CODPROVDESC IN (' + CmpRptCM.ParamByName('ListaIdRubrica').asString + ')) AND';
  end;

  // Máscara do CNPJ
  with (dmCds.sql) do
  begin
    SQL.Clear;
    SQL.Add('SELECT TDP.MASCARA');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE (TDO.SIGLADOCUMENTO = ''CNPJ:'') AND');
    SQL.Add('      (TDO.IDDOCUMENTO    = TDP.IDDOCUMENTO)');
    Open;
  end;

  if (Trim(dmCds.Cds.FieldByName('MASCARA').asString) <> '') then
    rpFichaFuncDbCNPJ.DisplayFormat := dmCds.Cds.FieldByName('MASCARA').asString+';0;_';

  with (qryFichaFunc.SQL) do
  begin
    Clear;
    Add('SELECT');
    // Dados da Empresa
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  IMA.IMAGEM, ');//MARCIO SANCHES SPINOSA SOL 155216 KINTANA - 1200769
    // Dados do Empregado
    Add('  RTRIM(PF.NOME) AS NOME,');
    Add('  PF.IDIMAGEM, PF.IDPESSOA, F.NIVELINDIV1,');
    Add('  PJ.NUMDOCUMENTO AS CNPJ, TO_CHAR(FIL.IDCATCNAE)||''-''||TO_CHAR(FIL.IDITEMCNAE) AS CNAE,');
    Add('  F.MATRICULA, PAIS.NOMENACIONALIDADE AS NACIONALIDADE,');
    Add('  TRIM(CIDADES.NOME) || ''-'' || PEFIS.CODESTADO AS NATURALIDADE,');
    Add('  PEFIS.DATANASC, PEFIS.NOMEPAI, PEFIS.NOMEMAE,');
    Add('  RTRIM(ST.DESCRICAO) AS SITUACAO, ST.TIPOSIT, F.DATAOPCAOFGTS,');
    Add('  TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'') AS DATAADMISSAO,');
    Add('  TO_CHAR(F.DATADESLIGAMENTO,''DD/MM/YYYY'') AS DATADEMISSAO,');
    Add('  DECODE(ST.TIPOSIT, ''D'', DATADESLIGAMENTO, NULL) AS DATADEMISSAOFLAG,'); //MARCIO SANCHES SPINOSA SOL 155216 KINTANA - 1200769
    Add('  MO.DESCRICAO AS MOTIVODESLIG,');
    Add('  EST.ANOCHEGADA, EST.IDPESSOA AS IDESTRANGEIRO,');
    Add('  DECODE(NVL(EST.FLGNATURALIZADO,0),0,''Não'',''Sim'') AS NATURALIZADO,');
    Add('  DECODE(NVL(EST.FLGCASADOBRASILEIRO,0),0,''Não'',''Sim'') AS CASADOBRASILEIRO,');
    Add('  DECODE(NVL(EST.FLGFILHOSBRASILEIROS,0),0,''Não'',''Sim'') AS FILHOSBRASILEIROS,');
    Add('  EST.DECRETONATURALIZACAO, EST.MOD19NUMERO, EST.MOD19REGISTRO,');
    Add('  DECODE(PEFIS.SEXO,''F'',''Feminino'',''M'',''Masculino'','''') AS SEXO,');
    Add('  DECODE(PEFIS.ESTCIVIL,''S'',''Solteir'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''C'',''Casad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    //William Moreira da Silva - SIG 28583
    Add('    ''D'',''Divorciad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''J'',''Divorciad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o'') || '' Judicialmente'',');
    //Add('    ''D'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    //Add('    ''J'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o'') || '' Judicialmente'',');
    //William Moreira da Silva - SIG 28583
    Add('    ''E'',''Desquitad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''V'',''Viúv'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''O'',''Outro'') AS ESTCIVIL,');
    Add('  DECODE(F.TIPOCONTRATO, ''E'',''Efetivo'', ''S'',''Efetivo Especial'',');
    Add('    ''T'',''Temporário'', ''G'',''Estagiário'', ''3'',''Terceiro'',');
    Add('    ''P'',''Proprietário'', ''A'',''Autônomo'', ''Indefinido'') ||');
    Add('    DECODE(F.DATAFIMCONTRATO,NULL,'''','' (Até '' ||');
    Add('    TO_CHAR(F.DATAFIMCONTRATO,''DD/MM/YYYY'')) AS VINCULO,');
    Add('  EJ.LOGRADOURO AS LOGRAJ, EJ.BAIRRO AS BAIRROJ, EJ.CEP AS CEPJ, EJ.NUMERO AS NUMEROJ,');
    Add('  CJ.NOME AS CIDADEJ,EJ.CODESTADO AS UFJ, EJ.COMPLEMENTO AS COMPLEJ,');
    Add('  E.LOGRADOURO, E.BAIRRO, E.CEP, E.NUMERO, CI.NOME AS CIDADE,');
    Add('  E.CODESTADO, E.COMPLEMENTO, PJ.NOME AS ESTAB, C.TITULO AS CARGO,');

    if (CmpRptCM.ParamByName('ImprimirCargoAlternativo').asBoolean) then
      Add('  C.DESCRICAO AS DESCRCARGO,')
    else
      Add('  ('' '') AS DESCRCARGO,');

    Add('  PR.DESCRICAO AS PROFISSAO, CC.NOME AS C_CUSTO, NVL(F.SALARIOATUAL,0) AS SALARIOATUAL,');
    Add('  DECODE(F.TIPOPAGAMENTO, NULL,'''',');
    Add('    ''('' || DECODE(F.TIPOPAGAMENTO, ''H'',''Horista'', ''D'',''Diarista'',');
    Add('    ''M'', ''Mensalista'', ''T'',''Tarefa'') || '')'') AS TIPOPAGAMENTO,');
    Add('  GR.DESCRICAO AS GRINSTR,');
    Add('  DECODE(RTRIM(TELEFONE.DDI),NULL,'''',''(''||RTRIM(TELEFONE.DDI)||'')'') AS DDI,');
    Add('  DECODE(RTRIM(TELEFONE.DDD),NULL,'''',''(''||RTRIM(TELEFONE.DDD)||'')'') AS DDD,');
    Add('  RTRIM(TELEFONE.NUMERO) AS TELEFONE, HT.JORNADAMENSAL, HT.NOMEHORARIO ');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E, ENDPESS EJ, FUNCIONARIO F,');
    Add('  SITFUNC ST, FILIALPESSOA FIL, CIDADES CI, CIDADES, CIDADES CJ, CARGO C,');
    Add('  PROFISS PR, CENTCUST CC, GRINSTR GR, IMAGENS IMA, PAIS, ESTRANGEIRO EST, HORATRAB HT, MOTIVO MO,');
    // -------------------------------------------------------------------- //
    // Telefone
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.DDI, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) END');
    Add('   WHERE');
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE');
    // -------------------------------------------------------------------- //
    Add('WHERE');

    // Funcionário selecionado
    if (CmpRptCM.ParamByName('ListaIdPessoa').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdPessoa').asString) > 0) then
        Add('  (F.IDPESSOA          IN (' +CmpRptCM.ParamByName('ListaIdPessoa').asString+ ')) AND')
      else
        Add('  (F.IDPESSOA           = ' +CmpRptCM.ParamByName('ListaIdPessoa').asString+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      begin
        if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (F.CODCENTROCUSTO    IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO     = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;
    end;

    Add('  (PF.IDPESSOA          = PEFIS.IDPESSOA) AND');
    Add('  (PF.IDPESSOA          = F.IDPESSOA) AND');
    Add('  (ST.IDSITFUNC         = F.IDSITFUNC) AND');
    Add('  (F.IDESTAB            = PJ.IDPESSOA) AND');
    Add('  (F.IDESTAB            = FIL.IDFILIALPESSOA) AND');
    Add('  (F.IDMOTIVODESLIGRAIS = MO.IDMOTIVO(+)) AND');
    Add('  (PF.IDPESSOA          = EST.IDPESSOA(+)) AND');
    Add('  (PEFIS.IDPAIS         = PAIS.IDPAIS(+)) AND');
    Add('  (PEFIS.IDCIDADES      = CIDADES.IDCIDADES(+)) AND');

    if (CmpRptCM.ParamByName('ImprimirCargoAlternativo').asBoolean) then
      Add(' (DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO) = C.IDCARGO(+)) AND')
    else
      Add('  (F.IDCARGO           = C.IDCARGO(+)) AND');

    Add('  (F.IDHORARIO         = HT.IDHORARIO(+)) AND');
    Add('  (PEFIS.IDPROFISS     = PR.IDPROFISS(+)) AND');
    Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO(+)) AND');
    Add('  (F.IDEMPRESA         = CC.IDEMPRESA(+)) AND');
    Add('  (PEFIS.IDGRINSTR     = GR.IDGRINSTR(+)) AND');
    Add('  (PJ.IDPESSOA         = EJ.IDPESSOA(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL   = EJ.IDENDERECO(+)) AND');
    Add('  (EJ.IDCIDADES        = CJ.IDCIDADES(+)) AND');
    Add('  (PF.IDPESSOA         = E.IDPESSOA(+)) AND');
    Add('  (PF.IDENDRESIDENCIAL = E.IDENDERECO(+)) AND');
    Add('  (E.IDCIDADES         = CI.IDCIDADES(+)) AND');
    Add('  (PF.IDIMAGEM         = IMA.IDIMAGEM(+)) AND');//MARCIO SANCHES SPINOSA SOL 155216 KINTANA - 1200769
    Add('  (PF.IDENDRESIDENCIAL = TELEFONE.IDENDERECO(+))');
    Add('ORDER BY NOME');

    //Helen - SOL 176106 KTN - 1604729
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');

  end;

  for c:=1 to 14 do
  begin
    SubReport := TppSubReport(Self.FindComponent('rpFichaFuncSubReport'+IntToStr(c)));
    SubReport.Visible := CmpRptCM.ParamValues[c].asBoolean;
    if (SubReport.Visible) then
      SubReport.DataPipeline := TppBDEPipeLine(Self.FindComponent('ppFichaFunc'+IntToStr(c)))
    else
      SubReport.DataPipeline := nil;
  end;
  ppRegiaoDescCargo.Visible := CmpRptCM.ParamByName('ImprimirDescCargo').asBoolean;

  qryFichaFunc.Open;

  frmAguarde.Max := qryFichaFunc.RecordCount;
  frmAguarde.Min := 0;

//  SelFoto(-1); //MARCIO SANCHES SPINOSA SOL 155216 KINTANA - 1200769
  SelFoto(qryFichaFunc.FieldByName('IDIMAGEM').asFloat);
  SelDados(-1);
end;

procedure TRptFichaFunc.qryFichaFuncAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptFichaFunc.rpFichaFuncGrpHdrBndBeforePrint(Sender: TObject);
begin
  if not(qryFichaFunc.IsEmpty) then
  begin

//    SelFoto(qryFichaFunc.FieldByName('IDIMAGEM').asFloat);//MARCIO SANCHES SPINOSA SOL 155216 KINTANA - 1200769

    ppRegiaoEstrangeiro.Visible := (qryFichaFunc.FieldByName('IDESTRANGEIRO').asString <> '');
    ppRegiaoDemitido.Visible := (qryFichaFunc.FieldByName('TIPOSIT').asString = 'D');
    ppRegiaoDescCargo.Visible := (qryFichaFunc.FieldByName('DESCRCARGO').Value <> '');

    if (ppRegiaoDemitido.Visible) then
      ppRegiaoDescCargo.Top := 206
    else
      ppRegiaoDescCargo.Top := 164;
  end;

end;

procedure TRptFichaFunc.rpFichaFuncGrpFootBndBeforePrint(Sender: TObject);
begin
  //SelDados(qryFichaFunc.FieldByName('IDPESSOA').asFloat);
end;

procedure TRptFichaFunc.rpFichaFuncSubReport1DBTxt2Print(Sender: TObject);
begin
  if (Trim(qryFichaFunc1.FieldByName('MASCARA').asString) <> '') then
    rpFichaFuncSubReport1DBTxt2.DisplayFormat := qryFichaFunc1.FieldByName('MASCARA').asString + ';0'
  else
    rpFichaFuncSubReport1DBTxt2.DisplayFormat := '';
end;

procedure TRptFichaFunc.rpFichaFuncSubReport3DtlBndBeforePrint(Sender: TObject);
begin
//MARCIO SANCHES SPINOSA SOL 155216 KINTANA - 1200769
//  rpFichaFuncSubReport3LblAVALTEOR.Caption := 'N/A';
//  rpFichaFuncSubReport3LblAVALPRAT.Caption := 'N/A';
//  rpFichaFuncSubReport3LblRESULT.Caption := 'N/A';
//
//  if (qryFichaFunc3.FieldByName('FLGAVALTEOR').asInteger = 1) then
//    rpFichaFuncSubReport3LblAVALTEOR.Caption := qryFichaFunc3.FieldByName('AVALTEOR').asString;
//
//  if (qryFichaFunc3.FieldByName('FLGAVALPRAT').asInteger = 1) then
//    rpFichaFuncSubReport3LblAVALPRAT.Caption := qryFichaFunc3.FieldByName('AVALPRAT').asString;
//MARCIO SANCHES SPINOSA SOL 155216 KINTANA - 1200769
  if ((qryFichaFunc3.FieldByName('TEMAVAL').asInteger = 1) and
      (qryFichaFunc3.FieldByName('FLGAVALTEOR').asInteger = 1) or
      (qryFichaFunc3.FieldByName('TEMAVPR').asInteger = 1) and
      (qryFichaFunc3.FieldByName('FLGAVALPRAT').asInteger = 1)) then
  begin
//MARCIO SANCHES SPINOSA SOL 155216 KINTANA - 1200769
//    if ((qryFichaFunc3.FieldByName('TEMAVAL').asInteger = 1) and
//        (qryFichaFunc3.FieldByName('FLGAVALTEOR').asInteger = 1) and
//        (qryFichaFunc3.FieldByName('AVALIACAO').asFloat >
//         qryFichaFunc3.FieldByName('AVALTEOR').asFloat)) or
//       ((qryFichaFunc3.FieldByName('TEMAVPR').asInteger = 1) and
//        (qryFichaFunc3.FieldByName('FLGAVALPRAT').asInteger = 1) and
//        (qryFichaFunc3.FieldByName('AVALPRAT').asFloat >
//         qryFichaFunc3.FieldByName('AVALPRAT').asFloat)) then
//      rpFichaFuncSubReport3LblRESULT.Caption := 'Reprovad'
//    else
//      rpFichaFuncSubReport3LblRESULT.Caption := 'Aprovad';

//    if (qryFichaFunc.FieldByName('SEXO').asString = 'Masculino') then
//      rpFichaFuncSubReport3LblRESULT.Caption := rpFichaFuncSubReport3LblRESULT.Caption + 'o'
//    else
//      rpFichaFuncSubReport3LblRESULT.Caption := rpFichaFuncSubReport3LblRESULT.Caption + 'a';

  end;

//  if (CmpRptCM.ParamByName('ImprimirOBS').asBoolean) and
//     (qryFichaFunc3.FieldByName('OBSERVACAO').Value <> '') then
//    rpFichaFuncSubReport3DBMemo1.Visible := true
//  else
//    rpFichaFuncSubReport3DBMemo1.Visible := false;
//MARCIO SANCHES SPINOSA SOL 155216 KINTANA - 1200769
end;

procedure TRptFichaFunc.rpFichaFuncSubReport5DtlBndBeforePrint(Sender: TObject);
begin
  if (CmpRptCM.ParamByName('ImprimirOBS').asBoolean) and
     (qryFichaFunc5.FieldByName('COMENT').Value <> '') then
    rpFichaFuncSubReport5DBMemo1.Visible := true
  else
    rpFichaFuncSubReport5DBMemo1.Visible := false;
end;

procedure TRptFichaFunc.rpFichaFuncSubReport6DtlBndBeforePrint(Sender: TObject);
begin
  if (CmpRptCM.ParamByName('ImprimirOBS').asBoolean) and
     (qryFichaFunc6.FieldByName('OBSERVACAO').Value <> '') then
    rpFichaFuncSubReport6DBMemo1.Visible := true
  else
    rpFichaFuncSubReport6DBMemo1.Visible := false;
end;

procedure TRptFichaFunc.rpFichaFuncSubReport8DtlBndBeforePrint(Sender: TObject);
var
  dbValCalc1: double;
  sRegRegra, sRegPessoa: string;
begin
  if (qryFichaFunc8.FieldByName('VALORRUBRICA').IsNull) then
    dbValCalc1 := 0
  else
    dbValCalc1 := qryFichaFunc8.FieldByName('VALORRUBRICA').asFloat;

  if not(qryFichaFunc8.FieldByName('IdRegraCalculo').IsNull) then
  begin
    sRegRegra := qryFichaFunc8.FieldByName('IdRegraCalculo').asString;
    sRegPessoa := qryFichaFunc.FieldByName('IDPESSOA').asString;
//    CalcBenef(sRegRegra, sRegPessoa, dbValCalc1);
  end;

  if (dbValCalc1 > 0) then
    rpFichaFuncSubReport8Lbl5.Caption := FloatToStrF(dbValCalc1, ffFixed, 10, 2)
  else
    rpFichaFuncSubReport8Lbl5.Caption := '';
end;

procedure TRptFichaFunc.rpFichaFuncSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptFichaFunc.SelFoto(IdImagem: double);
begin
  CdsIMG.Data := CtrlListTerceirosRH.ListImagem(IdImagem);
end;

procedure TRptFichaFunc.SelDados(IdPessoa: double);
{var
  c: byte;
  SqlParams: TCMSqlParams;}
begin
  {for c:=1 to 12 do
  begin
    if (CmpRptCM.ParamValues[c].asBoolean) then
    begin
      if (c = 1) then
        qryFichaFunc1.Data := CtrlListTerceirosRH.ListDocPessoa(IdPessoa)
      else
      begin
        SqlParams := TCMSqlParams(Self.FindComponent('sqlFichaFunc'+IntToStr(c)));
        SqlParams.Prepare;
        SqlParams.ParamByName('IDPESSOA').asFloat := IdPessoa;
        SqlParams.Open;
      end;
    end;
  end;}
end;

end.
