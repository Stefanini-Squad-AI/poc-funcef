// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Rotina...........: GerarDadosRelat0
//Nº SIG...........: 50204
//Data da Alteração: 07/07/2017
//Responsável......: Andre Imakawa
//Descrição........: Não deve ser verificado se o mês é 12, pois pode existir
//                   situações onde não ocorra registro nesse mês. Porem o ano
//                   pode ser maior que 5(Relatorio trabalha com grid de 5 anos).
//------------------------------------------------------------------------------
// Autor(a)    :  Marcio Sanches Spinosa
// Data        :  30/05/2012
// Pendência   :  SOL 179099 KINTANA 1653659
// Descricao   :  Ajuste nos valores zerados, para que de vez aparecer em branco
//                aparecer com '---'.
//------------------------------------------------------------------------------
// Autor(a)    :  Arnaldo Vicente Scarin
// Data        :  05/04/2010
// Pendência   :  SOL 133213 KINTANA 774606
// Descricao   :  Correção do Join da Tabela PAIS, que gerava erro quando o
//                campo IDPais, na tabela PessoaFisica não estava preenchido.
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RRelSalContribINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dReports, ppVar,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, DBTables, Wwdatsrc,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo, ppSubRpt, DBClient,
  Provider, FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, uCMClientDataSet,
  TXRB, ppModule, raCodMod, ppParameter;

type
  TDoc = array[1..4] of record
    ID: LongInt;
    Mascara: string;
  end;

  TRptRelSalContribINSS = class(TFrmCmReport)
    rpRelSalContrib: TppReport;
    rpRelSalContribHdrBnd: TppHeaderBand;
    rpRelSalContribImage: TppImage;
    rpRelSalContribLbl1: TppLabel;
    rpRelSalContribLbl2: TppLabel;
    rpRelSalContribLbl3: TppLabel;
    rpRelSalContribShape1: TppShape;
    rpRelSalContribLine4: TppLine;
    rpRelSalContribLine1: TppLine;
    rpRelSalContribLine2: TppLine;
    rpRelSalContribLine3: TppLine;
    rpRelSalContribLine5: TppLine;
    rpRelSalContribLine6: TppLine;
    rpRelSalContribLbl4: TppLabel;
    rpRelSalContribLbl5: TppLabel;
    rpRelSalContribLbl6: TppLabel;
    rpRelSalContribLbl7: TppLabel;
    rpRelSalContribLbl8: TppLabel;
    rpRelSalContribLbl9: TppLabel;
    rpRelSalContribLbl10: TppLabel;
    rpRelSalContribLbl11: TppLabel;
    rpRelSalContribLbl12: TppLabel;
    rpRelSalContribLbl13: TppLabel;
    rpRelSalContribDBTxt1: TppDBText;
    rpRelSalContribDBTxt3: TppDBText;
    rpRelSalContribDBTxt5: TppDBText;
    rpRelSalContribDBTxt7: TppDBText;
    rpRelSalContribDBTxt8: TppDBText;
    rpRelSalContribDBTxt9: TppDBText;
    rpRelSalContribDBTxt2: TppDBText;
    rpRelSalContribDBTxt10: TppDBText;
    rpRelSalContribDBTxt6: TppDBText;
    rpRelSalContribDtlBnd: TppDetailBand;
    rpRelSalContribShape2: TppShape;
    rpRelSalContribLine7: TppLine;
    rpRelSalContribLine8: TppLine;
    rpRelSalContribLine9: TppLine;
    rpRelSalContribLine10: TppLine;
    rpRelSalContribLine11: TppLine;
    rpRelSalContribLine12: TppLine;
    rpRelSalContribLine13: TppLine;
    rpRelSalContribLine14: TppLine;
    rpRelSalContribLine15: TppLine;
    rpRelSalContribLine16: TppLine;
    rpRelSalContribLine17: TppLine;
    rpRelSalContribLine18: TppLine;
    rpRelSalContribLine19: TppLine;
    rpRelSalContribLine20: TppLine;
    rpRelSalContribLine21: TppLine;
    rpRelSalContribLine22: TppLine;
    rpRelSalContribLine23: TppLine;
    rpRelSalContribLine24: TppLine;
    rpRelSalContribLine25: TppLine;
    rpRelSalContribLine26: TppLine;
    rpRelSalContribLine27: TppLine;
    rpRelSalContribLine28: TppLine;
    rpRelSalContribLine29: TppLine;
    rpRelSalContribLbl14: TppLabel;
    rpRelSalContribLbl17: TppLabel;
    rpRelSalContribLbl18: TppLabel;
    rpRelSalContribLbl20: TppLabel;
    rpRelSalContribLbl21: TppLabel;
    rpRelSalContribLbl23: TppLabel;
    rpRelSalContribLbl24: TppLabel;
    rpRelSalContribLbl26: TppLabel;
    rpRelSalContribLbl27: TppLabel;
    rpRelSalContribLbl16: TppLabel;
    rpRelSalContribLbl29: TppLabel;
    rpRelSalContribLbl19: TppLabel;
    rpRelSalContribLbl22: TppLabel;
    rpRelSalContribLbl25: TppLabel;
    rpRelSalContribLbl28: TppLabel;
    rpRelSalContribLbl30: TppLabel;
    rpRelSalContribLbl31: TppLabel;
    rpRelSalContribLbl32: TppLabel;
    rpRelSalContribLbl33: TppLabel;
    rpRelSalContribLbl34: TppLabel;
    rpRelSalContribLbl35: TppLabel;
    rpRelSalContribLbl36: TppLabel;
    rpRelSalContribLbl37: TppLabel;
    rpRelSalContribLbl38: TppLabel;
    rpRelSalContribLbl39: TppLabel;
    rpRelSalContribLbl40: TppLabel;
    rpRelSalContribLbl41: TppLabel;
    rpRelSalContribLbl42: TppLabel;
    rpRelSalContribShape3: TppShape;
    rpRelSalContribShape4: TppShape;
    rpRelSalContribShape5: TppShape;
    rpRelSalContribShape6: TppShape;
    rpRelSalContribShape7: TppShape;
    rpRelSalContribLbl15: TppLabel;
    rpRelSalContribLine30: TppLine;
    rpRelSalContribDBTxt13: TppDBText;
    rpRelSalContribDBTxt12: TppDBText;
    rpRelSalContribDBTxt15: TppDBText;
    rpRelSalContribDBTxt14: TppDBText;
    rpRelSalContribDBTxt17: TppDBText;
    rpRelSalContribDBTxt16: TppDBText;
    rpRelSalContribDBTxt19: TppDBText;
    rpRelSalContribDBTxt18: TppDBText;
    rpRelSalContribDBTxt21: TppDBText;
    rpRelSalContribDBTxt20: TppDBText;
    rpRelSalContribDBTxt23: TppDBText;
    rpRelSalContribDBTxt22: TppDBText;
    rpRelSalContribDBTxt11: TppDBText;
    rpRelSalContribDBTxt38: TppDBText;
    rpRelSalContribDBTxt39: TppDBText;
    rpRelSalContribDBTxt40: TppDBText;
    rpRelSalContribDBTxt41: TppDBText;
    rpRelSalContribDBTxt42: TppDBText;
    rpRelSalContribDBTxt43: TppDBText;
    rpRelSalContribDBTxt44: TppDBText;
    rpRelSalContribDBTxt45: TppDBText;
    rpRelSalContribDBTxt46: TppDBText;
    rpRelSalContribDBTxt47: TppDBText;
    rpRelSalContribDBTxt48: TppDBText;
    rpRelSalContribDBTxt49: TppDBText;
    rpRelSalContribDBTxt37: TppDBText;
    rpRelSalContribDBTxt64: TppDBText;
    rpRelSalContribDBTxt65: TppDBText;
    rpRelSalContribDBTxt66: TppDBText;
    rpRelSalContribDBTxt67: TppDBText;
    rpRelSalContribDBTxt68: TppDBText;
    rpRelSalContribDBTxt69: TppDBText;
    rpRelSalContribDBTxt70: TppDBText;
    rpRelSalContribDBTxt71: TppDBText;
    rpRelSalContribDBTxt72: TppDBText;
    rpRelSalContribDBTxt76: TppDBText;
    rpRelSalContribDBTxt77: TppDBText;
    rpRelSalContribDBTxt78: TppDBText;
    rpRelSalContribDBTxt63: TppDBText;
    rpRelSalContribDBTxt92: TppDBText;
    rpRelSalContribDBTxt93: TppDBText;
    rpRelSalContribDBTxt94: TppDBText;
    rpRelSalContribDBTxt95: TppDBText;
    rpRelSalContribDBTxt96: TppDBText;
    rpRelSalContribDBTxt97: TppDBText;
    rpRelSalContribDBTxt98: TppDBText;
    rpRelSalContribDBTxt99: TppDBText;
    rpRelSalContribDBTxt100: TppDBText;
    rpRelSalContribDBTxt101: TppDBText;
    rpRelSalContribDBTxt102: TppDBText;
    rpRelSalContribDBTxt103: TppDBText;
    rpRelSalContribDBTxt104: TppDBText;
    rpRelSalContribDBTxt118: TppDBText;
    rpRelSalContribDBTxt119: TppDBText;
    rpRelSalContribDBTxt120: TppDBText;
    rpRelSalContribDBTxt121: TppDBText;
    rpRelSalContribDBTxt122: TppDBText;
    rpRelSalContribDBTxt123: TppDBText;
    rpRelSalContribDBTxt124: TppDBText;
    rpRelSalContribDBTxt125: TppDBText;
    rpRelSalContribDBTxt126: TppDBText;
    rpRelSalContribDBTxt127: TppDBText;
    rpRelSalContribDBTxt128: TppDBText;
    rpRelSalContribDBTxt129: TppDBText;
    rpRelSalContribDBTxt130: TppDBText;
    rpRelSalContribDBTxt24: TppDBText;
    rpRelSalContribDBTxt50: TppDBText;
    rpRelSalContribDBTxt79: TppDBText;
    rpRelSalContribDBTxt105: TppDBText;
    rpRelSalContribDBTxt131: TppDBText;
    rpRelSalContribDBTxt25: TppDBText;
    rpRelSalContribDBTxt26: TppDBText;
    rpRelSalContribDBTxt27: TppDBText;
    rpRelSalContribDBTxt28: TppDBText;
    rpRelSalContribDBTxt29: TppDBText;
    rpRelSalContribDBTxt30: TppDBText;
    rpRelSalContribDBTxt31: TppDBText;
    rpRelSalContribDBTxt32: TppDBText;
    rpRelSalContribDBTxt33: TppDBText;
    rpRelSalContribDBTxt34: TppDBText;
    rpRelSalContribDBTxt35: TppDBText;
    rpRelSalContribDBTxt36: TppDBText;
    rpRelSalContribDBTxt51: TppDBText;
    rpRelSalContribDBTxt52: TppDBText;
    rpRelSalContribDBTxt53: TppDBText;
    rpRelSalContribDBTxt54: TppDBText;
    rpRelSalContribDBTxt55: TppDBText;
    rpRelSalContribDBTxt56: TppDBText;
    rpRelSalContribDBTxt57: TppDBText;
    rpRelSalContribDBTxt58: TppDBText;
    rpRelSalContribDBTxt59: TppDBText;
    rpRelSalContribDBTxt60: TppDBText;
    rpRelSalContribDBTxt61: TppDBText;
    rpRelSalContribDBTxt62: TppDBText;
    rpRelSalContribDBTxt106: TppDBText;
    rpRelSalContribDBTxt107: TppDBText;
    rpRelSalContribDBTxt108: TppDBText;
    rpRelSalContribDBTxt109: TppDBText;
    rpRelSalContribDBTxt110: TppDBText;
    rpRelSalContribDBTxt111: TppDBText;
    rpRelSalContribDBTxt112: TppDBText;
    rpRelSalContribDBTxt113: TppDBText;
    rpRelSalContribDBTxt114: TppDBText;
    rpRelSalContribDBTxt115: TppDBText;
    rpRelSalContribDBTxt116: TppDBText;
    rpRelSalContribDBTxt117: TppDBText;
    rpRelSalContribDBTxt91: TppDBText;
    rpRelSalContribDBTxt90: TppDBText;
    rpRelSalContribDBTxt89: TppDBText;
    rpRelSalContribDBTxt88: TppDBText;
    rpRelSalContribDBTxt87: TppDBText;
    rpRelSalContribDBTxt86: TppDBText;
    rpRelSalContribDBTxt85: TppDBText;
    rpRelSalContribDBTxt84: TppDBText;
    rpRelSalContribDBTxt83: TppDBText;
    rpRelSalContribDBTxt82: TppDBText;
    rpRelSalContribDBTxt81: TppDBText;
    rpRelSalContribDBTxt80: TppDBText;
    rpRelSalContribDBTxt132: TppDBText;
    rpRelSalContribDBTxt133: TppDBText;
    rpRelSalContribDBTxt134: TppDBText;
    rpRelSalContribDBTxt135: TppDBText;
    rpRelSalContribDBTxt136: TppDBText;
    rpRelSalContribDBTxt137: TppDBText;
    rpRelSalContribDBTxt138: TppDBText;
    rpRelSalContribDBTxt139: TppDBText;
    rpRelSalContribDBTxt140: TppDBText;
    rpRelSalContribDBTxt141: TppDBText;
    rpRelSalContribDBTxt142: TppDBText;
    rpRelSalContribDBTxt143: TppDBText;
    rpRelSalContribFootBnd: TppFooterBand;
    rpRelSalContribSmryBnd: TppSummaryBand;
    rpRelSalContribSubRep1: TppSubReport;
    rpRelSalContribChildRep1: TppChildReport;
    rpRelSalContribSubRep1Shape1: TppShape;
    rpRelSalContribSubRep1Line1: TppLine;
    rpRelSalContribSubRep1Lbl2: TppLabel;
    rpRelSalContribSubRep1Lbl3: TppLabel;
    rpRelSalContribSubRep1Lbl1: TppLabel;
    rpRelSalContribSubRep1Line2: TppLine;
    rpRelSalContribSubRep1Lbl4: TppLabel;
    rpRelSalContribSubRep1DtlBnd: TppDetailBand;
    rpRelSalContribSubRep1Line7: TppLine;
    rpRelSalContribSubRep1Line4: TppLine;
    rpRelSalContribSubRep1Line5: TppLine;
    rpRelSalContribSubRep1DBTxt1: TppDBText;
    rpRelSalContribSubRep1DBTxt2: TppDBText;
    rpRelSalContribSubRep1DBTxt3: TppDBText;
    rpRelSalContribSubRep1Line3: TppLine;
    rpRelSalContribSubRep1Line6: TppLine;
    rpRelSalContribSubRep1SmryBnd: TppSummaryBand;
    rpRelSalContribSubRep1Line8: TppLine;
    rpRelSalContribSubRep1Lbl5: TppLabel;
    rpRelSalContribSubRep1Lbl6: TppLabel;
    rpRelSalContribSubRep1Line9: TppLine;
    ppRelSalContrib: TppBDEPipeline;
    dsRelSalContrib: TwwDataSource;
    ppRelSalContrib1: TppBDEPipeline;
    dsRelSalContrib1: TwwDataSource;
    ppRelSalContrib2: TppBDEPipeline;
    dsRelSalContrib2: TwwDataSource;
    rpRelSalContribLine31: TppLine;
    rpRelSalContribLbl43: TppLabel;
    rpRelSalContribLbl44: TppLabel;
    rpRelSalContribLine32: TppLine;
    rpRelSalContribSubRep2: TppSubReport;
    ppChildReport1: TppChildReport;
    ppShape1: TppShape;
    ppLine6: TppLine;
    rpRelSalContribSubRep2Lbl2: TppLabel;
    rpRelSalContribSubRep2Lbl1: TppLabel;
    rpRelSalContribSubRep2DtlBnd: TppDetailBand;
    ppLine9: TppLine;
    ppDBText1: TppDBText;
    ppLine12: TppLine;
    ppLine13: TppLine;
    rpRelSalContribSubRep2SmryBnd: TppSummaryBand;
    ppLine14: TppLine;
    rpRelSalContribSubRep2Lbl5: TppLabel;
    rpRelSalContribSubRep2Lbl6: TppLabel;
    ppLine15: TppLine;
    ppLabel3: TppLabel;
    ppLine21: TppLine;
    ppDBText4: TppDBText;
    ppDBText39: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBText50: TppDBText;
    ppDBCalc11: TppDBCalc;
    ppDBText54: TppDBText;
    ppDBCalc12: TppDBCalc;
    ppDBText55: TppDBText;
    ppDBCalc13: TppDBCalc;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLine7: TppLine;
    ppLine11: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    rpRelSalContribSubRep2Grp1: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine8: TppLine;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppDBText53: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel23: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    rpRelSalContribSubRep1Image: TppImage;
    rpRelSalContribSubRep1Lbl7: TppLabel;
    rpRelSalContribSubRep1Lbl8: TppLabel;
    rpRelSalContribSubRep2Image: TppImage;
    rpRelSalContribSubRep2Lbl7: TppLabel;
    rpRelSalContribSubRep2Lbl8: TppLabel;
    rpRelSalContribLblLOCAL_DATA1: TppLabel;
    rpRelSalContribSubRep1LblLOCAL_DATA: TppLabel;
    rpRelSalContribSubRep2LblLOCAL_DATA: TppLabel;
    rpRelSalContribSubRep1HdrBnd: TppHeaderBand;
    rpRelSalContribSubRep2HdrBnd: TppHeaderBand;
    ppRelSalContrib3: TppBDEPipeline;
    dsRelSalContrib3: TwwDataSource;
    rpRelSalContribSubRep3: TppSubReport;
    ppChildReport2: TppChildReport;
    rpRelSalContribSubRep3HdrBnd: TppDetailBand;
    rpRelSalContribSubRep3Img1: TppImage;
    rpRelSalContribSubRep3Lbl1: TppLabel;
    rpRelSalContribSubRep3Lbl2: TppLabel;
    rpRelSalContribSubRep3Shape3: TppShape;
    rpRelSalContribSubRep3Line1: TppLine;
    rpRelSalContribSubRep3Lbl5: TppLabel;
    rpRelSalContribSubRep3DBTxt1: TppDBText;
    rpRelSalContribSubRep3Lbl3: TppLabel;
    rpRelSalContribSubRep3Shape1: TppShape;
    rpRelSalContribSubRep3Shape2: TppShape;
    rpRelSalContribSubRep3Lbl4: TppLabel;
    rpRelSalContribSubRep3Line2: TppLine;
    rpRelSalContribSubRep3Line5: TppLine;
    rpRelSalContribSubRep3Line4: TppLine;
    rpRelSalContribSubRep3Line6: TppLine;
    rpRelSalContribSubRep3Line8: TppLine;
    rpRelSalContribSubRep3Line3: TppLine;
    rpRelSalContribSubRep3Lbl6: TppLabel;
    rpRelSalContribSubRep3Lbl7: TppLabel;
    rpRelSalContribSubRep3Lbl8: TppLabel;
    rpRelSalContribSubRep3Lbl9: TppLabel;
    rpRelSalContribSubRep3Lbl11: TppLabel;
    rpRelSalContribSubRep3Lbl12: TppLabel;
    rpRelSalContribSubRep3Line7: TppLine;
    rpRelSalContribSubRep3Lbl13: TppLabel;
    rpRelSalContribSubRep3Lbl14: TppLabel;
    rpRelSalContribSubRep3Lbl15: TppLabel;
    rpRelSalContribSubRep3DBTxt2: TppDBText;
    rpRelSalContribSubRep3DBTxt3: TppDBText;
    rpRelSalContribSubRep3DBTxt4: TppDBText;
    rpRelSalContribSubRep3DBTxt5: TppDBText;
    rpRelSalContribSubRep3DBTxt7: TppDBText;
    rpRelSalContribSubRep3DBTxt8: TppDBText;
    rpRelSalContribSubRep3DBTxt9: TppDBText;
    rpRelSalContribSubRep3DBTxt10: TppDBText;
    rpRelSalContribSubRep3DBTxt11: TppDBText;
    rpRelSalContribSubRep3Lbl16: TppLabel;
    rpRelSalContribSubRep3Lbl21: TppLabel;
    rpRelSalContribSubRep3Lbl17: TppLabel;
    rpRelSalContribSubRep3Mem1: TppMemo;
    rpRelSalContribSubRep3Lbl18: TppLabel;
    rpRelSalContribSubRep3Lbl19: TppLabel;
    rpRelSalContribSubRep3Lbl20: TppLabel;
    rpRelSalContribSubRep3DBTxt12: TppDBText;
    rpRelSalContribSubRep3DBTxt13: TppDBText;
    rpRelSalContribSubRep3DBTxt14: TppDBText;
    rpRelSalContribSubRep3DBTxt15: TppDBText;
    rpRelSalContribSubRep3Lbl22: TppLabel;
    rpRelSalContribSubRep3Lbl23: TppLabel;
    rpRelSalContribSubRep3Lbl24: TppLabel;
    rpRelSalContribSubRep3Lbl25: TppLabel;
    rpRelSalContribSubRep3DBTxt16: TppDBText;
    rpRelSalContribSubRep3DBTxt17: TppDBText;
    rpRelSalContribSubRep3Lbl26: TppLabel;
    rpRelSalContribSubRep3Lbl27: TppLabel;
    rpRelSalContribSubRep3Lbl28: TppLabel;
    rpRelSalContribSubRep3Lbl29: TppLabel;
    rpRelSalContribSubRep3Lbl30: TppLabel;
    rpRelSalContribSubRep3Lbl31: TppLabel;
    rpRelSalContribSubRep3Lbl32: TppLabel;
    rpRelSalContribSubRep3DBTxt18: TppDBText;
    rpRelSalContribSubRep3Shape4: TppShape;
    rpRelSalContribSubRep3Line9: TppLine;
    rpRelSalContribSubRep3Line10: TppLine;
    rpRelSalContribSubRep3Line13: TppLine;
    rpRelSalContribSubRep3Lbl36: TppLabel;
    rpRelSalContribSubRep3Lbl37: TppLabel;
    rpRelSalContribSubRep3Lbl38: TppLabel;
    rpRelSalContribSubRep3Lbl39: TppLabel;
    rpRelSalContribSubRep3Shape5: TppShape;
    rpRelSalContribSubRep3Line11: TppLine;
    rpRelSalContribSubRep3Shape6: TppShape;
    rpRelSalContribSubRep3Line12: TppLine;
    rpRelSalContribSubRep3Lbl40: TppLabel;
    rpRelSalContribSubRep3Lbl42: TppLabel;
    rpRelSalContribSubRep3Lbl43: TppLabel;
    rpRelSalContribSubRep3Lbl41: TppLabel;
    rpRelSalContribSubRep3Lbl44: TppLabel;
    rpRelSalContribSubRep3Lbl10: TppLabel;
    rpRelSalContribSubRep3DBTxt6: TppDBText;
    rpRelSalContribSubRep3Shape7: TppShape;
    rpRelSalContribSubRep3Lbl45: TppLabel;
    rpRelSalContribSubRep3Img2: TppImage;
    rpRelSalContribSubRep3Img3: TppImage;
    rpRelSalContribSubRep3DBTxt23: TppDBText;
    rpRelSalContribSubRep3DBTxt19: TppDBText;
    rpRelSalContribSubRep3DBTxt20: TppDBText;
    rpRelSalContribSubRep3DBTxt21: TppDBText;
    rpRelSalContribSubRep3DBTxt22: TppDBText;
    rpRelSalContribSubRep3Lbl33: TppLabel;
    rpRelSalContribSubRep3Lbl34: TppLabel;
    rpRelSalContribSubRep3Lbl35: TppLabel;
    rpRelSalContribSubRep3Lbl46: TppLabel;
    rpRelSalContribSubRep3Lbl47: TppLabel;
    rpRelSalContribSubRep4: TppSubReport;
    ppChildReport3: TppChildReport;
    rpRelSalContribSubRep4DtlBnd: TppDetailBand;
    rpRelSalContribSubRep4Shape1: TppShape;
    rpRelSalContribSubRep4Line1: TppLine;
    rpRelSalContribSubRep4Lbl3: TppLabel;
    rpRelSalContribSubRep4DBTxt1: TppDBText;
    rpRelSalContribSubRep4Lbl1: TppLabel;
    rpRelSalContribSubRep4Shape2: TppShape;
    rpRelSalContribSubRep4Shape3: TppShape;
    rpRelSalContribSubRep4Lbl2: TppLabel;
    rpRelSalContribSubRep4Line2: TppLine;
    rpRelSalContribSubRep4Line5: TppLine;
    rpRelSalContribSubRep4Line3: TppLine;
    rpRelSalContribSubRep4Line4: TppLine;
    ppLine53: TppLine;
    rpRelSalContribSubRep4Lbl4: TppLabel;
    rpRelSalContribSubRep4Lbl5: TppLabel;
    rpRelSalContribSubRep4Lbl6: TppLabel;
    rpRelSalContribSubRep4Lbl7: TppLabel;
    rpRelSalContribSubRep4Lbl9: TppLabel;
    rpRelSalContribSubRep4DBTxt2: TppDBText;
    rpRelSalContribSubRep4DBTxt3: TppDBText;
    rpRelSalContribSubRep4Lbl8: TppLabel;
    rpRelSalContribSubRep4Line6: TppLine;
    rpRelSalContribSubRep4Lbl16: TppLabel;
    rpRelSalContribSubRep4Line8: TppLine;
    rpRelSalContribSubRep4Shape12: TppShape;
    rpRelSalContribSubRep4Lbl18: TppLabel;
    rpRelSalContribSubRep4Img1: TppImage;
    rpRelSalContribSubRep4DBTxt6: TppDBText;
    rpRelSalContribSubRep4Lbl11: TppLabel;
    rpRelSalContribSubRep4Lbl13: TppLabel;
    rpRelSalContribSubRep4Lbl12: TppLabel;
    rpRelSalContribSubRep4DBTxt5: TppDBText;
    rpRelSalContribSubRep4Memo1: TppMemo;
    rpRelSalContribSubRep4Line7: TppLine;
    rpRelSalContribSubRep4Lbl17: TppLabel;
    rpRelSalContribSubRep4Lbl10: TppLabel;
    rpRelSalContribSubRep4Shape4: TppShape;
    rpRelSalContribSubRep4Lbl14: TppLabel;
    rpRelSalContribSubRep4Lbl15: TppLabel;
    ppLine57: TppLine;
    ppLine60: TppLine;
    rpRelSalContribSubRep4Shape5: TppShape;
    rpRelSalContribSubRep4Shape6: TppShape;
    rpRelSalContribSubRep4Shape7: TppShape;
    rpRelSalContribSubRep4Shape8: TppShape;
    rpRelSalContribSubRep4Shape9: TppShape;
    rpRelSalContribSubRep4Shape10: TppShape;
    rpRelSalContribSubRep4LblPreNome1: TppLabel;
    rpRelSalContribSubRep4LblPreNome2: TppLabel;
    rpRelSalContribSubRep4LblPreNome3: TppLabel;
    rpRelSalContribSubRep4LblPreNome4: TppLabel;
    rpRelSalContribSubRep4LblPreNome5: TppLabel;
    rpRelSalContribSubRep4LblPreNome6: TppLabel;
    rpRelSalContribSubRep4LblPreNome7: TppLabel;
    rpRelSalContribSubRep4LblDataNasc1: TppLabel;
    rpRelSalContribSubRep4LblDataNasc2: TppLabel;
    rpRelSalContribSubRep4LblDataNasc3: TppLabel;
    rpRelSalContribSubRep4LblDataNasc4: TppLabel;
    rpRelSalContribSubRep4LblDataNasc5: TppLabel;
    rpRelSalContribSubRep4LblDataNasc6: TppLabel;
    rpRelSalContribSubRep4LblDataNasc7: TppLabel;
    rpRelSalContribSubRep4Shape11: TppShape;
    ppTitleBand1: TppTitleBand;
    rpRelSalContribSubRep4LblUltDiaTrab: TppLabel;
    CdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    CdsRelSalContrib: TCMClientDataSet;
    sqlRelSalContrib: TCMSqlParams;
    CdsRelSalContrib1: TCMClientDataSet;
    CdsRelSalContrib2: TCMClientDataSet;
    CdsRelSalContrib3: TCMClientDataSet;
    sqlRelSalContrib2: TCMSqlParams;
    sqlRelSalContrib3: TCMSqlParams;
    sqlRelSalContrib1: TCMSqlParams;
    ppParameterList1: TppParameterList;
    raCodeModule1: TraCodeModule;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpRelSalContribSmryBndAfterPrint(Sender: TObject);
  private
    Doc: TDoc;
    rValorMes: real;
    sDataPorExtenso, sMesAtual, sCodRub, sMesIni, sMesFin: string;
    iNumAno : Integer;

    procedure ConfigRelat;
    procedure GerarDadosRelat;
    procedure GerarDadosRelat0;
    procedure GerarDadosRelat1;
    procedure GerarDadosRelat2;
    procedure GerarDadosRelat3;
    procedure GerarDadosRelat4;
    //Marcio Sanches Spinosa SOL 179099 KINTANA 1653659 - Inicio
    function PadRight(aStr: string; aSize: Integer; aCh: String = ' '): string;
    //Marcio Sanches Spinosa SOL 179099 KINTANA 1653659 - Fim
  end;

var
  RptRelSalContribINSS: TRptRelSalContribINSS;

implementation

uses uSistema, fAguarde, uCtrlFuncoesRH, dCds;

{$R *.DFM}

procedure TRptRelSalContribINSS.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  // Calculo o mês inicial e final
  if (CmpRptCM.ParamByName('LimitadoPorData').asBoolean) then
  begin
    sMesIni := CmpRptCM.ParamByName('Ano').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('Mes').asInteger);
    sMesFin := '';
  end
  else
  begin
    with (dmCds.sql.SQL) do
    begin
      Clear;
      Add('SELECT MAX(MES) ULT_MES');
      Add('FROM   HISTRUBSAL');
      Add('WHERE (IDPESSOA = ' +CmpRptCM.ParamByName('IdFunc').asString+ ')');
    end;
    dmCds.sql.Open;
    sMesIni := FU.IncDataAM(dmCds.Cds.FieldByName('ULT_MES').asString,
      - CmpRptCM.ParamByName('QuantMeses').asInteger);
    sMesFin := dmCds.Cds.FieldByName('ULT_MES').asString;
  end;

  // Máscaras dos Documentos
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT DECODE(TDP.MASCARA,NULL,'' '',RTRIM(TDP.MASCARA)) AS MASCARA,');
    Add('       TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO');
    Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    Add('WHERE ((TDO.SIGLADOCUMENTO = ''CTPS:'') OR');
    Add('       (TDO.SIGLADOCUMENTO = ''INSS:'') OR');
    Add('       (TDO.SIGLADOCUMENTO = ''CPF:'') OR');
    Add('       (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'') OR');
    Add('       (TDO.SIGLADOCUMENTO = ''CGC:'') OR');
    Add('       (TDO.SIGLADOCUMENTO = ''CNPJ:'')) AND');
    Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
  end;
  dmCds.sql.Open;

  while not(dmCds.Cds.EOF) do
  begin
    if (dmCds.Cds.FieldByName('SIGLADOCUMENTO').asString = 'CGC:') or
       (dmCds.Cds.FieldByName('SIGLADOCUMENTO').asString = 'CNPJ:') then
    begin
      Doc[1].ID := dmCds.Cds.FieldByName('IDDOCUMENTO').asInteger;
      Doc[1].Mascara := dmCds.Cds.FieldByName('MASCARA').asString;
    end
    else
    if (dmCds.Cds.FieldByName('SIGLADOCUMENTO').asString = 'CTPS:') or
       (dmCds.Cds.FieldByName('SIGLADOCUMENTO').asString = 'INSS:') then
    begin
      Doc[2].ID := dmCds.Cds.FieldByName('IDDOCUMENTO').asInteger;
      Doc[2].Mascara := dmCds.Cds.FieldByName('MASCARA').asString;
    end
    else
    if (dmCds.Cds.FieldByName('SIGLADOCUMENTO').asString = 'CPF:') then
    begin
      Doc[3].ID := dmCds.Cds.FieldByName('IDDOCUMENTO').asInteger;
      Doc[3].Mascara := dmCds.Cds.FieldByName('MASCARA').asString;
    end
    else
    if (dmCds.Cds.FieldByName('SIGLADOCUMENTO').asString = 'PIS/PASEP:') then
    begin
      Doc[4].ID := dmCds.Cds.FieldByName('IDDOCUMENTO').asInteger;
      Doc[4].Mascara := dmCds.Cds.FieldByName('MASCARA').asString;
    end;
    dmCds.Cds.Next;
  end;

  // Monto Query Principal
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    // Dados do Estabelecimento
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  DECODE(RTRIM(PJ.NUMDOCUMENTO),NULL,NULL,RTRIM(PJ.NUMDOCUMENTO)) AS CNPJ,');
    Add('  RTRIM(E1.LOGRADOURO)||'', ''||E1.NUMERO||');
    Add('    DECODE(RTRIM(E1.COMPLEMENTO),NULL,NULL,'' - ''||RTRIM(E1.COMPLEMENTO||'' - ''))||');
    Add('    RTRIM(E1.BAIRRO)||'' - ''||RTRIM(CI.NOME)||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E1.CEP,1,5))||''-''||RTRIM(SUBSTR(E1.CEP,6,3)||');
    Add('    DECODE(ES.CODESTADO,NULL,NULL,'' - ''||ES.CODESTADO)) AS ENDERECO,');
    Add('  RTRIM(CI.NOME) AS CIDADE,');
    // Dados do Empregado
    Add('  UPPER(RTRIM(PF.NOME)) AS EMPREGADO,');
    Add('  RTRIM(E2.LOGRADOURO)||'', ''||E2.NUMERO||'' ''||RTRIM(E2.BAIRRO) AS EMPREGADO_END,');
    Add('  RTRIM(SUBSTR(E2.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E2.CEP,6,3)) AS EMPREGADO_CEP,');
    Add('  DOC_INCRICAO.NUM AS INCRICAO,');
    Add('  DOC_CPF.NUM AS CPF,');
    Add('  DOC_PIS.NUM AS PIS,');
    Add('  PEFIS.DATANASC,');
    Add('  PEFIS.SEXO,');
    Add('  PAIS.NOMENACIONALIDADE,');
    Add('  PEFIS.NUMDEPIRRF,');
    Add('  PEFIS.ESTCIVIL,');
    Add('  F.TIPOCONTRATO,');
    Add('  F.DATAADMISSAO,');
    Add('  DECODE(ST.TIPOSIT,''D'',F.DATADESLIGAMENTO,'''') AS DATADESLIGAMENTO,');
    Add('  MO.DESCRICAO AS MOTIVO');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E1, ENDPESS E2, FUNCIONARIO F,');
    Add('  MOTIVO MO, ESTADO ES, CIDADES CI, SITFUNC ST, PAIS,');
    // -------------------------------------------------------------------- //
    // Matrícula INSS
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDPESSOA    = ' +CmpRptCM.ParamByName('IdFunc').asString+ ') AND');
    Add('         (IDDOCUMENTO = ' +IntToStr(Doc[2].ID)+ ')) DOC_INCRICAO,');
    // -------------------------------------------------------------------- //
    // CPF
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDPESSOA    = ' +CmpRptCM.ParamByName('IdFunc').asString+ ') AND');
    Add('         (IDDOCUMENTO = ' +IntToStr(Doc[3].ID)+ ')) DOC_CPF,');
    // -------------------------------------------------------------------- //
    // PIS
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDPESSOA    = ' +CmpRptCM.ParamByName('IdFunc').asString+ ') AND');
    Add('         (IDDOCUMENTO = ' +IntToStr(Doc[4].ID)+ ')) DOC_PIS');
    // -------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA         = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND');
    Add('  (F.IDPESSOA          = ' +CmpRptCM.ParamByName('IdFunc').asString+ ') AND');
    Add('  (F.IDSITFUNC         = ST.IDSITFUNC) AND');
    Add('  (PJ.IDPESSOA         = E1.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL   = E1.IDENDERECO) AND');
    Add('  (E1.IDCIDADES        = CI.IDCIDADES) AND');
    Add('  (CI.IDESTADO         = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA         = F.IDESTAB) AND');
    Add('  (F.IDPESSOA          = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA          = PEFIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA          = DOC_CPF.IDPESSOA) AND');
    Add('  (F.IDPESSOA          = DOC_PIS.IDPESSOA) AND');
    Add('  (PF.IDPESSOA         = E2.IDPESSOA) AND');
    Add('  (PF.IDENDRESIDENCIAL = E2.IDENDERECO) AND');
    // Alterado por Arnaldo Vicente Scarin, em 05/04/2010 - SOL 133213 KTN 774606
    // Correção do Join da Tabela PAIS, que gerava erro quando o campo IDPais,
    // na tabela PessoaFisica não estava preenchido.
    Add('  (NVL(PEFIS.IDPAIS,1) = PAIS.IDPAIS) AND');
    Add('  (F.IDMOTIVODESLIGGERENCIAL = MO.IDMOTIVO(+)) AND');
    Add('  (F.IDPESSOA          = DOC_INCRICAO.IDPESSOA(+))');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monto Query de Salário Parte Fixa
  with (sqlAux.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  0 AS SAL_PARTE_FIXA,');
    Add('  TO_CHAR(RECOLHIM.DATAFIMGRPS,''DD/MM/YYYY'') AS RECOLHIMENTO,');

    if (CmpRptCM.ParamByName('SelRubricaPorIncid').asBoolean) then
    begin
      Add('  RP2.CODPROVDESC AS COD_RUBRICA,');
      Add('  RP2.DESCRPROVDESC AS NOM_RUBRICA,');
      Add('  RXR.FLGACAOINCIDE AS TIPO_INCID,');
    end
    else
    begin
      Add('  RP.CODPROVDESC AS COD_RUBRICA,');
      Add('  RP.DESCRPROVDESC AS NOM_RUBRICA,');
      Add('  PD.FLGDESCONTO AS TIPO_INCID,');
    end;

    Add('  SUBSTR(H.MES,1,4) AS ANO,');
    Add('  H.MES,');
    Add('  CAST(H.VALORPROVENTO AS VARCHAR2(14)) AS VALORPROVENTO ');
    Add('FROM');

    if (CmpRptCM.ParamByName('SelRubricaPorIncid').asBoolean) then
      Add('  HISTRUBSAL H, RUBRICAXPESS RP,RUBRICAXPESS RP2, RUBXRUB RXR, PROVDESC PD,')
    else
      Add('  HISTRUBSAL H, RUBRICAXPESS RP, PROVDESC PD,');
    // -------------------------------------------------------------------- //
    // Data do Recolhimento da Contribuição
    Add('  (SELECT TO_CHAR(ADD_MONTHS(DATAVENCGRPS,-1),''YYYY'') || ''/'' ||');
    Add('          TO_CHAR(ADD_MONTHS(DATAVENCGRPS,-1),''MM'') AS MES,');
    Add('          DATAFIMGRPS');
    Add('   FROM   GUIAGRPS) RECOLHIM');
    // -------------------------------------------------------------------- //
    Add('WHERE');

    if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
      Add('  (RP.CODPROVDESC IN ('+CmpRptCM.ParamByName('ListaIdRubrica').asString+')) AND')
    else
      Add('  (RP.CODPROVDESC  = '+CmpRptCM.ParamByName('ListaIdRubrica').asString+') AND');
      
    if (CmpRptCM.ParamByName('ListaTipoFolha').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaTipoFolha').asString) > 0) then
        Add('  (H.IDMOTIVO       IN (' +CmpRptCM.ParamByName('ListaTipoFolha').asString+ ')) AND')
      else
        Add('  (H.IDMOTIVO        = ' +CmpRptCM.ParamByName('ListaTipoFolha').asString+ ') AND');
    end;

    Add('  (H.IDPESSOA      = ' +CmpRptCM.ParamByName('IdFunc').asString+ ') AND');

    if (CmpRptCM.ParamByName('SelRubricaPorIncid').asBoolean) then
    begin
      Add('  (RP.IDRUBRICA    = RXR.IDRUBSECUND) AND');
      Add('  (RXR.IDRUBPRINC  = RP2.IDRUBRICA) AND');
      Add('  (RXR.IDRUBPRINC  = PD.IDPROVENTO) AND');
      Add('  (RP2.CODPROVDESC = H.CODPROVDESC) AND');
      Add('  (RXR.IDRUBPRINC  = H.IDRUBRICA) AND');
    end
    else
    begin
      Add('  (RP.IDRUBRICA    = PD.IDPROVENTO) AND');
      Add('  (RP.CODPROVDESC  = H.CODPROVDESC) AND');
    end;

    Add('  (H.MES          >= '+QuotedStr(sMesIni)+') AND');

    if not(CmpRptCM.ParamByName('LimitadoPorData').asBoolean) then
      Add('  (H.MES          <= ' +QuotedStr(sMesFin)+ ') AND');

    Add('  (H.MES           = RECOLHIM.MES(+))');
    Add('UNION');
    Add('SELECT');
    Add('  1 AS SAL_PARTE_FIXA,');
    Add('  ('' '') AS RECOLHIMENTO,');
    Add('  ' +QuotedStr(CmpRptCM.ParamByName('IdRubricaSalParteFixa').asString)+ ' AS COD_RUBRICA,');
    Add('  ''Salário (Parte Fixa)'' AS NOM_RUBRICA,');
    Add('  PD.FLGDESCONTO AS TIPO_INCID,');
    Add('  SUBSTR(H.MES,1,4) AS ANO,');
    Add('  H.MES,');
    Add('  CAST(H.VALORPROVENTO AS VARCHAR2(14)) AS VALORPROVENTO ');
    Add('FROM');
    Add('  HISTRUBSAL H, RUBRICAXPESS RP, PROVDESC PD');
    Add('WHERE');
    Add('  (RP.CODPROVDESC = ' +QuotedStr(CmpRptCM.ParamByName('IdRubricaSalParteFixa').asString)+ ') AND');
    Add('  (H.IDPESSOA     = ' +CmpRptCM.ParamByName('IdFunc').asString+ ') AND');
    Add('  (H.MES         >= ' +QuotedStr(sMesIni)+ ') AND');

    if not(CmpRptCM.ParamByName('LimitadoPorData').asBoolean) then
      Add('  (H.MES         <= ' +QuotedStr(sMesFin)+ ') AND');

    if (CmpRptCM.ParamByName('ListaTipoFolha').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaTipoFolha').asString) > 0) then
        Add('  (H.IDMOTIVO       IN (' +CmpRptCM.ParamByName('ListaTipoFolha').asString+ ')) AND')
      else
        Add('  (H.IDMOTIVO        = ' +CmpRptCM.ParamByName('ListaTipoFolha').asString+ ') AND');
    end;

    Add('  (RP.IDRUBRICA   = PD.IDPROVENTO) AND');
    Add('  (RP.CODPROVDESC = H.CODPROVDESC)');
    Add('ORDER BY');
    Add('  MES');
    //SaveToFile('c:\qry1.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry1.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  GerarDadosRelat;
  ConfigRelat;
end;

procedure TRptRelSalContribINSS.rpRelSalContribSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptRelSalContribINSS.GerarDadosRelat;
begin
  dmCds.sql.Open;
  CdsAux.IndexName := '';
  sqlAux.Open;

  if not(CdsAux.IsEmpty) then
  begin
    sDataPorExtenso := dmCds.Cds.FieldByName('CIDADE').asString +'  '+
      Copy(DateToStr(Date),1,2) +', '+ FU.MesExtensoAno(Copy(DateToStr(Date),7,4)+'/'+
      Copy(DateToStr(Date),4,2));

    frmAguarde.Min := 0;
    frmAguarde.Max := CdsAux.RecordCount * 2;

    // Relação dos Salários de Contribuição
    GerarDadosRelat0;
    // Aumentos Salariais
    GerarDadosRelat1;
    // Discriminação das Parcelas do Salário-Contribuição
    GerarDadosRelat2;

    // Requerimento de Benefício por Incapacidade
    if (CmpRptCM.ParamByName('ImprimirRelReqBenefIncap').asBoolean) then
    begin
      rpRelSalContribSubRep3.DataPipeline := ppRelSalContrib3;
      rpRelSalContribSubRep3.Visible := true;
      GerarDadosRelat3;
    end
    else
    begin
      rpRelSalContribSubRep3.DataPipeline := nil;
      rpRelSalContribSubRep3.Visible := false;
      sqlRelSalContrib3.Open;
    end;

    // Atestado de Afastamento do Trabalho
    if (CmpRptCM.ParamByName('ImprimirRelAtestAfastTrab').asBoolean) then
    begin
      rpRelSalContribSubRep4.DataPipeline := ppRelSalContrib;
      rpRelSalContribSubRep4.Visible := true;
      GerarDadosRelat4;
    end
    else
    begin
      rpRelSalContribSubRep4.DataPipeline := nil;
      rpRelSalContribSubRep4.Visible := false;
    end;

    CdsRelSalContrib.First;
    CdsRelSalContrib2.First;
  end;
end;

procedure TRptRelSalContribINSS.GerarDadosRelat0;
var
  iMesAtual,  iAnoAtual: integer;
begin
  sqlRelSalContrib.Open;
  repeat
    CdsRelSalContrib.Insert;
    // Dados do Estabelecimento
    CdsRelSalContrib.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
    CdsRelSalContrib.FieldByName('CNPJ').asString := dmCds.Cds.FieldByName('CNPJ').asString;
    CdsRelSalContrib.FieldByName('ENDERECO').asString := dmCds.Cds.FieldByName('ENDERECO').asString;
    // Dados do Empregado
    CdsRelSalContrib.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
    CdsRelSalContrib.FieldByName('INCRICAO').asString := dmCds.Cds.FieldByName('INCRICAO').asString;
    CdsRelSalContrib.FieldByName('CPF').asString := dmCds.Cds.FieldByName('CPF').asString;
    CdsRelSalContrib.FieldByName('PIS').asString := dmCds.Cds.FieldByName('PIS').asString;
    CdsRelSalContrib.FieldByName('DATAADMISSAO').asString := dmCds.Cds.FieldByName('DATAADMISSAO').asString;
    CdsRelSalContrib.FieldByName('DATADESLIGAMENTO').asString := dmCds.Cds.FieldByName('DATADESLIGAMENTO').asString;
    CdsRelSalContrib.FieldByName('MOTIVO').asString := dmCds.Cds.FieldByName('MOTIVO').asString;

    // LOOP para todas as contribuições do empregado
    iAnoAtual := FU.StrInt(Copy(CdsAux.FieldByName('MES').asString,1,4));
    iNumAno := 1;
    repeat
      rValorMes := 0;
      sMesAtual := CdsAux.FieldByName('MES').asString;
      iMesAtual := FU.StrInt(Copy(sMesAtual,6,2));
      CdsRelSalContrib.FieldByName('RECOLHIMENTO_' +IntToStr(iMesAtual) +'_'+
        IntToStr(iNumAno)).asString := CdsAux.FieldByName('RECOLHIMENTO').asString;

      repeat
        if (CdsAux.FieldByName('SAL_PARTE_FIXA').asInteger = 0) then
          if (CdsAux.FieldByName('TIPO_INCID').asInteger = 1) then
            rValorMes := rValorMes - CdsAux.FieldByName('VALORPROVENTO').asFloat
          else
            rValorMes := rValorMes + CdsAux.FieldByName('VALORPROVENTO').asFloat;

        frmAguarde.Pos := frmAguarde.Pos+1;
        CdsAux.Next;
      until (CdsAux.EOF) or (CdsAux.FieldByName('MES').asString <> sMesAtual);

      CdsRelSalContrib.FieldByName('ANO_' +IntToStr(iNumAno)).asInteger := iAnoAtual;
      //Marcio Sanches Spinosa SOL 179099 KINTANA 1653659 - Inicio
      CdsRelSalContrib.FieldByName('VAL_' +IntToStr(iMesAtual) +'_'+
        IntToStr(iNumAno)).AsString := FormatCurr('###,##0.00', (Abs(rValorMes)));
      //Marcio Sanches Spinosa SOL 179099 KINTANA 1653659 - Fim
      CdsRelSalContrib.FieldByName('TOTAL_ANO_' +IntToStr(iNumAno)).asFloat :=
        CdsRelSalContrib.FieldByName('TOTAL_ANO_' +IntToStr(iNumAno)).asFloat + Abs(rValorMes);

      if (iAnoAtual <> FU.StrInt(Copy(CdsAux.FieldByName('MES').asString,1,4))) then
      begin
        iAnoAtual := FU.StrInt(Copy(CdsAux.FieldByName('MES').asString,1,4));
        Inc(iNumAno);
      end;
    //until (CdsAux.EOF) or ((iMesAtual = 12) and (iNumAno = 6)); // Andre Imakawa - SIG 50204
    until (CdsAux.EOF) or (iNumAno = 6);                          // Andre Imakawa - SIG 50204
  until (CdsAux.EOF);
  CdsRelSalContrib.Post;
end;

procedure TRptRelSalContribINSS.GerarDadosRelat1;
var
  sDataIni, sDataFin: string;
begin
  // Data inicial e final para a seleção dos aumentos salariais
  sDataIni := '01/'+ Copy(sMesIni,6,2) +'/'+ Copy(sMesIni,1,4);
  sDataFin := IntToStr(FU.TrazUltDiaMes(FU.StrInt(Copy(sMesFin,6,2)), FU.StrInt(Copy(sMesFin,1,4)))) +
    '/'+ Copy(sMesFin,6,2) +'/'+ Copy(sMesFin,1,4);

  with (sqlRelSalContrib1) do
  begin
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  TO_CHAR(EF.DATAALTERFUNC,''MM/YYYY'') AS MESANO,');
    SQL.Add('  ''     '' || MO.DESCRICAO AS MOTIVO,');
    SQL.Add('  EF.PERC_REAJ');
    SQL.Add('FROM');
    SQL.Add('  EVOLFUNC EF, MOTIVO MO');
    SQL.Add('WHERE');
    SQL.Add('  (EF.IDPESSOA       = ' +CmpRptCM.ParamByName('IdFunc').asString+ ') AND');
    SQL.Add('  (EF.DATAALTERFUNC >= TO_DATE(' +QuotedStr(sDataIni)+ ',''DD/MM/YYYY'')) AND');

    if not(CmpRptCM.ParamByName('LimitadoPorData').asBoolean) then
      SQL.Add('  (EF.DATAALTERFUNC <= TO_DATE(' +QuotedStr(sDataFin)+ ',''DD/MM/YYYY'')) AND');

    SQL.Add('  (EF.PERC_REAJ      > 0) AND');
    SQL.Add('  (EF.IDMOTIVO       = MO.IDMOTIVO)');
    SQL.Add('ORDER BY');
    SQL.Add('  EF.DATAALTERFUNC');
    //SQL.SaveToFile('c:\qry2.txt');
    SQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry2.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    Open;
  end;
end;

procedure TRptRelSalContribINSS.GerarDadosRelat2;
var
  c: byte;
  sMes, sAno: string;
  rValorSalParteFixa: real;
begin
  CdsAux.IndexName := 'CdsAuxIndex';
  CdsAux.First;

  sqlRelSalContrib2.Open;
  repeat
    sCodRub := CdsAux.FieldByName('COD_RUBRICA').asString;
    // LOOP para cada Rubrica do Empregado
    repeat
      sAno := Copy(CdsAux.FieldByName('MES').asString,1,4);

      CdsRelSalContrib2.Insert;
      CdsRelSalContrib2.FieldByName('RUBRICA').asString := CdsAux.FieldByName('NOM_RUBRICA').asString;
      CdsRelSalContrib2.FieldByName('ANO').asString := sAno;

      // Zero todos os Valores para a visualização dos ZEROS no Relatório
      for c:=1 to 12 do
      begin
        CdsRelSalContrib2.FieldByName('VAL_ABS_'+FU.PoeZero(c)).asFloat := 0;
        CdsRelSalContrib2.FieldByName('VAL_'+FU.PoeZero(c)).asFloat := 0;
      end;

      // LOOP a Rubrica Atual no mesmo Ano
      repeat
        rValorMes := 0;
        rValorSalParteFixa := 0;
        sMes := Copy(CdsAux.FieldByName('MES').asString,6,2);
        // LOOP de Somatório das Rubricas que compõe Atual no mesmo Ano
        repeat
          if (CdsAux.FieldByName('SAL_PARTE_FIXA').asInteger = 1) then
            rValorSalParteFixa := CdsAux.FieldByName('VALORPROVENTO').asFloat
          else
          if (CdsAux.FieldByName('TIPO_INCID').asInteger = 1) then
            rValorMes := rValorMes - CdsAux.FieldByName('VALORPROVENTO').asFloat
          else
            rValorMes := rValorMes + CdsAux.FieldByName('VALORPROVENTO').asFloat;

          frmAguarde.Pos := frmAguarde.Pos+1;
          CdsAux.Next;
        until (CdsAux.FieldByName('MES').asString <> sAno+'/'+sMes) or (CdsAux.EOF) or
              (CdsAux.FieldByName('COD_RUBRICA').asString <> sCodRub);

        CdsRelSalContrib2.FieldByName('VAL_ABS_'+sMes).asFloat := Abs(rValorMes + rValorSalParteFixa);
        CdsRelSalContrib2.FieldByName('VAL_'+sMes).asFloat := rValorMes;
      until (CdsAux.EOF) or (CdsAux.FieldByName('ANO').asString <> sAno) or
            (CdsAux.FieldByName('COD_RUBRICA').asString <> sCodRub);

      CdsRelSalContrib2.Post;
    until (CdsAux.EOF) or (CdsAux.FieldByName('COD_RUBRICA').asString <> sCodRub);
  until (CdsAux.EOF);
end;

procedure TRptRelSalContribINSS.GerarDadosRelat3;
begin
  sqlRelSalContrib3.Open;

  CdsRelSalContrib3.Insert;
  CdsRelSalContrib3.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
  CdsRelSalContrib3.FieldByName('DATANASC').asString := dmCds.Cds.FieldByName('DATANASC').asString;
  CdsRelSalContrib3.FieldByName('ENDERECO').asString := dmCds.Cds.FieldByName('EMPREGADO_END').asString;
  CdsRelSalContrib3.FieldByName('CEP').asString := dmCds.Cds.FieldByName('EMPREGADO_CEP').asString;

  if (dmCds.Cds.FieldByName('SEXO').asString = 'F') then
    CdsRelSalContrib3.FieldByName('FEMININO').asString := 'X'
  else
    CdsRelSalContrib3.FieldByName('MASCULINO').asString := 'X';

  CdsRelSalContrib3.FieldByName('NACIONALIDADE').asString := dmCds.Cds.FieldByName('NOMENACIONALIDADE').asString;
  CdsRelSalContrib3.FieldByName('INCRICAO').asString := dmCds.Cds.FieldByName('INCRICAO').asString;
  CdsRelSalContrib3.FieldByName('PIS').asString := dmCds.Cds.FieldByName('PIS').asString;
  CdsRelSalContrib3.FieldByName('CPF').asString := dmCds.Cds.FieldByName('CPF').asString;
  CdsRelSalContrib3.FieldByName('NUMDEPIRRF').asString := FU.PoeZero(dmCds.Cds.FieldByName('NUMDEPIRRF').asInteger);

  if (dmCds.Cds.FieldByName('ESTCIVIL').asString = 'S') then
    CdsRelSalContrib3.FieldByName('SOLTEIRO').asString := 'X'
  else
  if (dmCds.Cds.FieldByName('ESTCIVIL').asString = 'C') then
    CdsRelSalContrib3.FieldByName('CASADO').asString := 'X'
  else
  if (dmCds.Cds.FieldByName('ESTCIVIL').asString = 'V') then
    CdsRelSalContrib3.FieldByName('VIUVO').asString := 'X'
  else
  if (dmCds.Cds.FieldByName('ESTCIVIL').asString = 'D') or
     (dmCds.Cds.FieldByName('ESTCIVIL').asString = 'J') or
     (dmCds.Cds.FieldByName('ESTCIVIL').asString = 'E') then
    CdsRelSalContrib3.FieldByName('DESQUITADO_DIVORCIADO').asString := 'X';

  if (dmCds.Cds.FieldByName('TIPOCONTRATO').asString = 'E') or
     (dmCds.Cds.FieldByName('TIPOCONTRATO').asString = 'S') then
    CdsRelSalContrib3.FieldByName('SIT_EMPREGADO').asString := 'X'
  else
  if (dmCds.Cds.FieldByName('TIPOCONTRATO').asString = 'P') then
    CdsRelSalContrib3.FieldByName('SIT_EMPRESARIO').asString := 'X'
  else
  if (dmCds.Cds.FieldByName('TIPOCONTRATO').asString = 'A') then
    CdsRelSalContrib3.FieldByName('SIT_AUTONOMO').asString := 'X';

  if (CmpRptCM.ParamByName('PessoaGozaBenef').asBoolean) then
    CdsRelSalContrib3.FieldByName('POSSUI_BENEF').asString := 'X'
  else
    CdsRelSalContrib3.FieldByName('NAO_POSSUI_BENEF').asString := 'X';

  if (CmpRptCM.ParamByName('PessoaPossuiOutraAtiv').asBoolean) then
    CdsRelSalContrib3.FieldByName('POSSUI_VINC').asString := 'X'
  else
    CdsRelSalContrib3.FieldByName('NAO_POSSUI_VINC').asString := 'X';

  CdsRelSalContrib3.FieldByName('LOCAL_DATA').asString :=
    dmCds.Cds.FieldByName('CIDADE').asString +'  '+
    IntToStr(FU.ExtraiDia(Date)) + ', '+ FU.MesExtensoAno(FU.RetornaAnoMes(Date));

  CdsRelSalContrib3.Post;
end;

procedure TRptRelSalContribINSS.GerarDadosRelat4;
var
  c: byte;
  sPreNome, sListaPreNome, sDataNasc, sListaDataNasc: string;
begin
  sListaPreNome := CmpRptCM.ParamByName('ListaPreNomeFilhos').asString;
  sListaDataNasc := CmpRptCM.ParamByName('ListaDataNascFilhos').asString;

  c := 1;
  while (sListaPreNome <> '') do
  begin
    FU.ExtraiString(sListaPreNome, sPreNome, ',');
    TppLabel(Self.FindComponent('rpRelSalContribSubRep4LblPreNome'+
      IntToStr(c))).Caption := sPreNome;
    Inc(c);
  end;

  c := 1;
  while (sListaDataNasc <> '') do
  begin
    FU.ExtraiString(sListaDataNasc, sDataNasc, ',');
    TppLabel(Self.FindComponent('rpRelSalContribSubRep4LblDataNasc'+
      IntToStr(c))).Caption := sDataNasc;
    Inc(c);
  end;
end;

procedure TRptRelSalContribINSS.ConfigRelat;
var
  iMesAtual, iNumAno, iAnoAtual, i, j, k : integer;
begin
  rpRelSalContribLblLOCAL_DATA1.Caption := sDataPorExtenso;
  rpRelSalContribSubRep1LblLOCAL_DATA.Caption := sDataPorExtenso;
  rpRelSalContribSubRep2LblLOCAL_DATA.Caption := sDataPorExtenso;
  if (CmpRptCM.ParamByName('UltimoDiaTrab').asDateTime = 0) then
    rpRelSalContribSubRep4LblUltDiaTrab.Caption := ''
  else
    rpRelSalContribSubRep4LblUltDiaTrab.Caption := CmpRptCM.ParamByName('UltimoDiaTrab').asString;

  if (Trim(Doc[1].Mascara) = '') then
  begin
    rpRelSalContribDBTxt2.DisplayFormat := '';
    rpRelSalContribSubRep4DBTxt2.DisplayFormat := '';
  end
  else
  begin
    rpRelSalContribDBTxt2.DisplayFormat := Doc[1].Mascara + ';0;_';
    rpRelSalContribSubRep4DBTxt2.DisplayFormat := Doc[1].Mascara + ';0;_';
  end;

  if (Trim(Doc[2].Mascara) = '') then
    rpRelSalContribDBTxt7.DisplayFormat := ''
  else
    rpRelSalContribDBTxt7.DisplayFormat := Doc[2].Mascara + ';0;_';

  if (Trim(Doc[3].Mascara) = '') then
    rpRelSalContribDBTxt6.DisplayFormat := ''
  else
    rpRelSalContribDBTxt6.DisplayFormat := Doc[3].Mascara + ';0;_';

  if (Trim(Doc[4].Mascara) = '') then
    rpRelSalContribDBTxt10.DisplayFormat := ''
  else
    rpRelSalContribDBTxt10.DisplayFormat := Doc[4].Mascara + ';0;_';

 //Marcio Sanches Spinosa SOL 179099 KINTANA 1653659 - Inicio
  CdsRelSalContrib.First;
  while not CdsRelSalContrib.Eof do
  begin
  for i := 1 to 5 do
   for j := 1 to 12 do
    begin
        if (CdsRelSalContrib.FieldByName('VAL_'+ IntToStr(j) + '_' + IntToStr(i)).AsString = EmptyStr) then
        begin
          CdsRelSalContrib.Edit;
          // O ultimo caracter adicionado depois do +, foi feito com ALT+255 dentro da string, para que possa manter o campo centralizado
          CdsRelSalContrib.FieldByName('VAL_'+ IntToStr(j) + '_' + IntToStr(i)).AsString := PadRight('---', 19, ' ') + ' ';
        end;

        if (CdsRelSalContrib.FieldByName('RECOLHIMENTO_'+ IntToStr(j) + '_' + IntToStr(i)).AsString = EmptyStr) then
        begin
         if not (CdsRelSalContrib.State in [dsEdit]) then
            CdsRelSalContrib.Edit;
          CdsRelSalContrib.FieldByName('RECOLHIMENTO_'+ IntToStr(j) + '_' + IntToStr(i)).AsString := '---';
        end;

        if (CdsRelSalContrib.State in [dsEdit]) then
          CdsRelSalContrib.Post;

    end;
    CdsRelSalContrib.Next;
  end;

  for i :=0 to ComponentCount - 1 do
  begin
    if (Components[i] is TppDBText) then
      if (Pos('VAL_', TppDBText(Components[i]).DataField) > 0) or (
         Pos('RECOLHIMENTO_', TppDBText(Components[i]).DataField) > 0) then
        TppDBText(Components[i]).DisplayFormat := '';
  end;
  //Marcio Sanches Spinosa SOL 179099 KINTANA 1653659 - Fim

end;
//Marcio Sanches Spinosa SOL 179099 KINTANA 1653659 - Inicio
function TRptRelSalContribINSS.PadRight(aStr: string; aSize: Integer; aCh: String = ' '): string;
begin
 while Length(aStr) < aSize do
   aStr :=  aStr + aCh;

 Result := aStr;
end;
//Marcio Sanches Spinosa SOL 179099 KINTANA 1653659 - Fim
end.
