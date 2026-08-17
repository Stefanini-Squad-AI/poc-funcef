unit DRelatBeneficios;
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
// Alteração  :
// Nº SIG.....: SIG58556
// Data.......: 20/11/2017
// Responsável: Luiz Carlos
// Descrição..: Segregacao contabil
//------------------------------------------------------------------------------
// Autor       : Fernando Santana
// Data        : 24/06/2010
// Pendencia   : SOL 137647 Kintana 833783
// Alteração   : Retirar a alterção do SOL 137647 Kintana 833783
//------------------------------------------------------------------------------
// Autor       : Fernando Santana
// Data        : 24/06/2010
// Pendencia   : SOL 137647 Kintana 833783
// Alteração   : Colocar o relatorio com paisagem e almetar os espaço estre as colunas
//               para gerar arq txt corretamente.
//------------------------------------------------------------------------------
// Autor       : Daniel Begnami
// Data        : 20/08/2009
// Pendencia   : SOL 122987 Kintana 610253
// Alteração   : O sistema não estava buscando os dados quando a pesquisa era
//               feita somente pela matricula.
//------------------------------------------------------------------------------
// Rotina      : qryGlosa
// Autor(a)    : André Pontes
// Data        : 26/09/2006
// Pendência   : 23328
// Alteração   : Alterações para exibir total da rubrica, independente do plano
//               (criado sub-select para totalizar por rubrica)
//------------------------------------------------------------------------------
// Rotina      : qryPAB
// Autor(a)    : André Pontes
// Data        : 26/09/2006
// Pendência   : 23328
// Alteração   : Alterações para exibir total da rubrica, independente do plano
//               (criado sub-select para totalizar por rubrica)
//------------------------------------------------------------------------------
// Rotina      : qryResultINSS
// Autor(a)    : André Pontes
// Data        : 22/09/2006 a 25/09/2006
// Pendência   : 23328
// Alteração   : Alterações para exibir total da rubrica, independente do plano
//               (criado sub-select para totalizar por rubrica)
//               A query do relatório não retorna registros por causa do filtro
//               FLGRUBCENTRAL = 1 (não há rubricas cadastradas com essa flg) 
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 10/08/2006
// Pendência   : 21449
// Alteração   : Indicação, no cabeçalho do relatórios, se o mesmo se refere ao
//               arquivo original ou se inclui entradas manuais
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 29/07/2005
// Alteração   : Nova lógica na QryValMantenedoras 
// Pendência   : 19848
// Data        : 10/05/2005
// Alteração   : Novo campo com plano previdenciário na QryExtrato
// Pendência   : 19171
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 17/11/2004
// Alteração   : DISTINCT na qryNLocalizados
// Pendência   : 17490
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 11/11/2004
// Alteração   : Alterar RUBRICAFUNCEF do extrato individual para RUBRICAINSS
// Pendência   : 18059
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 26.08.2004
// Alteração   : Colocar Active = False nas qrys qryFundacao e qryExtrIndiv
// Pendência   : 17481
//------------------------------------------------------------------------------
// Autor(a)    : Carlos Guedes
// Data        : 12/08/2003
// Alteração   : Criação do relatório que exibe todos os Dados Importados
// Pendência   : 14830
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppModule, raCodMod, ppEndUsr,
  DBClient, uCMClientDataSet, uCmSqlParams, Provider, ExtCtrls, ppParameter;

type
  TdtmRelatBeneficios = class(TdtmReports)
    rpBenefConcAdiant: TppReport;
    qryBenefConcAdiant: TwwQuery;
    dsBenefConcAdiant: TwwDataSource;
    pplBenefConcAdiant: TppBDEPipeline;
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    rpBenefAdiantPgtoIntegral: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel18: TppLabel;
    ppLine1: TppLine;
    ppDBImage1: TppDBImage;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLabel19: TppLabel;
    ppDBText18: TppDBText;
    ppLabel20: TppLabel;
    pplMesReferenciaPgtoInt: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel22: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel23: TppLabel;
    ppDBText26: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel24: TppLabel;
    ppDBCalc10: TppDBCalc;
    ppLabel25: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLabel26: TppLabel;
    ppDBText27: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLabel27: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppLabel28: TppLabel;
    ppDBCalc14: TppDBCalc;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppLabel29: TppLabel;
    ppDBText28: TppDBText;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLabel38: TppLabel;
    ppDBCalc16: TppDBCalc;
    ppLabel39: TppLabel;
    ppDBCalc18: TppDBCalc;
    qryBenefAdiantPgtoIntegral: TwwQuery;
    dsBenefAdiantPgtoIntegral: TwwDataSource;
    pplBenefAdiantPgtoIntegral: TppBDEPipeline;
    rpParticipSituacao: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel21: TppLabel;
    ppLine4: TppLine;
    ppDBImage2: TppDBImage;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppLabel40: TppLabel;
    ppDBText36: TppDBText;
    ppLabel41: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText37: TppDBText;
    ppDBText43: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine5: TppLine;
    ppLabel43: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppLabel44: TppLabel;
    ppDBText44: TppDBText;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppLabel46: TppLabel;
    ppDBCalc21: TppDBCalc;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppLabel49: TppLabel;
    ppDBCalc24: TppDBCalc;
    qryParticipSituacao: TwwQuery;
    dsParticipSituacao: TwwDataSource;
    pplParticipSituacao: TppBDEPipeline;
    ppLabelparticipSituacao: TppLabel;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    rpBoletasDBImage1: TppDBImage;
    rpBoletasDBText1: TppDBText;
    rpBoletasDBText2: TppDBText;
    rpBoletasDBText31: TppDBText;
    rpBoletasDBText32: TppDBText;
    rpBoletasDBText33: TppDBText;
    rpBoletasDBText34: TppDBText;
    rpBoletasDBText35: TppDBText;
    rpBoletasLabel24: TppLabel;
    rpBoletasDBText36: TppDBText;
    ppLabelMesRef: TppLabel;
    ppLabelmesreferencia: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine14: TppLine;
    ppLabel32: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel42: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel12: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLabel16: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel11: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLabel15: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel13: TppLabel;
    ppLabel17: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel10: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel14: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppSummaryBand2: TppSummaryBand;
    ppLabel45: TppLabel;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppLabel48: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel53: TppLabel;
    ppDBText38: TppDBText;
    ppDBText40: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppLabel54: TppLabel;
    ppDBCalc27: TppDBCalc;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppLabel47: TppLabel;
    ppDBText45: TppDBText;
    ppLabel52: TppLabel;
    ppDBText39: TppDBText;
    ppLabel55: TppLabel;
    ppDBCalc28: TppDBCalc;
    ppDBCalcBenef: TppDBCalc;
    ppDBBenef: TppDBCalc;
    ppDBPlano: TppDBCalc;
    ppDBPatro: TppDBCalc;
    ppDBTotal: TppDBCalc;
    ppDBCalcPlano: TppDBCalc;
    ppDBCalcPatro: TppDBCalc;
    ppDBCalcTotal: TppDBCalc;
    ppConcINSSRegiao: TppBDEPipeline;
    dsConcINSSRegiao: TwwDataSource;
    qryConcINSSRegiao: TwwQuery;
    rpConcINSSRegiao: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppLine7: TppLine;
    ppLabel58: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppDBImage3: TppDBImage;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppLabel56: TppLabel;
    ppDBText51: TppDBText;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppLabel57: TppLabel;
    ppDBText52: TppDBText;
    ppLabel59: TppLabel;
    ppDBText53: TppDBText;
    ppLabel60: TppLabel;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLabel64: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppLabel65: TppLabel;
    ShapeDet: TppShape;
    ppLine6: TppLine;
    ppConsPartINSS: TppBDEPipeline;
    dsConsPartINSS: TwwDataSource;
    qryConsPartINSS: TwwQuery;
    rpConsPartINSS: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppDBImage4: TppDBImage;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppLabel66: TppLabel;
    ppDBText65: TppDBText;
    ppLabel67: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppShape1: TppShape;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine10: TppLine;
    ppLabel68: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLine12: TppLine;
    ppDsgnINSS: TppDesigner;
    lblMatricula: TppLabel;
    lblParticipante: TppLabel;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppDBCalc12: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppLabel75: TppLabel;
    ppLine11: TppLine;
    ppLine13: TppLine;
    ppLabel76: TppLabel;
    lblNumBenef: TppLabel;
    ppLabel77: TppLabel;
    lblMant: TppLabel;
    lblOrgaoMant: TppLabel;
    ppLabel79: TppLabel;
    ppLabel78: TppLabel;
    ppDBText70: TppDBText;
    ppLabel80: TppLabel;
    lblEspecie: TppLabel;
    ppResultINSS: TppBDEPipeline;
    dsResultINSS: TwwDataSource;
    qryResultINSS: TwwQuery;
    rpResultINSS: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppDBImage5: TppDBImage;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppLabel81: TppLabel;
    ppDBText78: TppDBText;
    ppLabel82: TppLabel;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppDetailBand6: TppDetailBand;
    ppShape2: TppShape;
    ppDBText79: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine17: TppLine;
    ppLabel100: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    ppDsgnResultINSS: TppDesigner;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppDBText84: TppDBText;
    ppProvProvisionados: TppBDEPipeline;
    dsProvProvisionados: TwwDataSource;
    qryProvProvisionados: TwwQuery;
    rpProvProvisionados: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppDBImage6: TppDBImage;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    ppLabel89: TppLabel;
    ppDBText92: TppDBText;
    ppLabel90: TppLabel;
    ppLine18: TppLine;
    ppDetailBand7: TppDetailBand;
    ppFooterBand7: TppFooterBand;
    ppLine20: TppLine;
    ppLabel97: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppSystemVariable14: TppSystemVariable;
    ppDsgnProvProvisionados: TppDesigner;
    ppGroup12: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppGroup13: TppGroup;
    ppGroupHeaderBand13: TppGroupHeaderBand;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppDBText95: TppDBText;
    ppLabel96: TppLabel;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppLine19: TppLine;
    ppDBCalc19: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppDBCalc29: TppDBCalc;
    ppLabel98: TppLabel;
    ppDBCalc30: TppDBCalc;
    ppDBCalc31: TppDBCalc;
    ppDBCalc32: TppDBCalc;
    ppLabel99: TppLabel;
    ppShape3: TppShape;
    ppShape4: TppShape;
    banda1: TppShape;
    ppLabel101: TppLabel;
    lblMesReferencia: TppLabel;
    qryProvResumoSigla: TwwQuery;
    dsProvResumoSigla: TwwDataSource;
    ppProvResumoSigla: TppBDEPipeline;
    ppSubRelProviResumoSigla: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand8: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLine22: TppLine;
    Banda2: TppShape;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppDBText109: TppDBText;
    ppDBText110: TppDBText;
    ppDBCalc33: TppDBCalc;
    ppDBCalc34: TppDBCalc;
    ppDBCalc35: TppDBCalc;
    ppSummaryBand5: TppSummaryBand;
    ppGroup14: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppGroupFooterBand14: TppGroupFooterBand;
    ppLabel102: TppLabel;
    ppShape6: TppShape;
    ppLabel103: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel114: TppLabel;
    ppLabel111: TppLabel;
    lblMesRefResumo: TppLabel;
    ppDadosImport: TppBDEPipeline;
    dsDadosImport: TwwDataSource;
    qryDadosImport: TwwQuery;
    rbDadosImport: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppDBImage7: TppDBImage;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppLabel112: TppLabel;
    ppDBText106: TppDBText;
    ppLabel113: TppLabel;
    ppLine21: TppLine;
    ppDetailBand9: TppDetailBand;
    ppFooterBand8: TppFooterBand;
    ppLine23: TppLine;
    ppLabel115: TppLabel;
    ppSystemVariable15: TppSystemVariable;
    ppSystemVariable16: TppSystemVariable;
    ppSummaryBand6: TppSummaryBand;
    ppdsnDadosImport: TppDesigner;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLine24: TppLine;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppDBText114: TppDBText;
    ppDBText115: TppDBText;
    ppDBText116: TppDBText;
    ppGroup16: TppGroup;
    ppGroupHeaderBand16: TppGroupHeaderBand;
    ppGroupFooterBand16: TppGroupFooterBand;
    ppLine25: TppLine;
    ppLabel122: TppLabel;
    ppDBCalc36: TppDBCalc;
    ppDBCalc37: TppDBCalc;
    Banda3: TppShape;
    ppLabel123: TppLabel;
    lblMesReferencia2: TppLabel;
    ppLine26: TppLine;
    ppLabel124: TppLabel;
    ppDBCalc38: TppDBCalc;
    ppDBCalc39: TppDBCalc;
    ppLabel125: TppLabel;
    ppDBText117: TppDBText;
    ppLabel126: TppLabel;
    ppDBText118: TppDBText;
    ppLabel127: TppLabel;
    ppDBText119: TppDBText;
    ppGroup15: TppGroup;
    ppGroupHeaderBand15: TppGroupHeaderBand;
    ppGroupFooterBand15: TppGroupFooterBand;
    ppLabel86: TppLabel;
    ppDBText80: TppDBText;
    ppLine27: TppLine;
    ppLabel128: TppLabel;
    ppDBText120: TppDBText;
    ppSummaryBand7: TppSummaryBand;
    ppDBCalc40: TppDBCalc;
    ppDBCalc41: TppDBCalc;
    ppDBCalc42: TppDBCalc;
    ppLabel129: TppLabel;
    ppLine28: TppLine;
    ppPAB: TppBDEPipeline;
    dsPAB: TwwDataSource;
    qryPAB: TwwQuery;
    ppdsnPAB: TppDesigner;
    rpPAB: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppDBImage8: TppDBImage;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    ppDBText125: TppDBText;
    ppDBText126: TppDBText;
    ppDBText127: TppDBText;
    ppLabel130: TppLabel;
    ppDBText128: TppDBText;
    ppLabel131: TppLabel;
    ppLine29: TppLine;
    ppDetailBand10: TppDetailBand;
    ppShape5: TppShape;
    ppDBText129: TppDBText;
    ppDBText131: TppDBText;
    ppDBText132: TppDBText;
    ppDBText133: TppDBText;
    ppDBText134: TppDBText;
    ppDBText135: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLine30: TppLine;
    ppLabel132: TppLabel;
    ppSystemVariable17: TppSystemVariable;
    ppSystemVariable18: TppSystemVariable;
    ppSummaryBand8: TppSummaryBand;
    ppDBCalc44: TppDBCalc;
    ppLabel133: TppLabel;
    ppLine31: TppLine;
    ppGroup17: TppGroup;
    ppGroupHeaderBand17: TppGroupHeaderBand;
    ppLine32: TppLine;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLabel138: TppLabel;
    ppLabel140: TppLabel;
    ppLabel142: TppLabel;
    ppDBText138: TppDBText;
    ppGroupFooterBand17: TppGroupFooterBand;
    ppLine33: TppLine;
    ppLabel139: TppLabel;
    ppDBText130: TppDBText;
    ppLabel141: TppLabel;
    ppDBCalc43: TppDBCalc;
    ppLine34: TppLine;
    ppGlosa: TppBDEPipeline;
    dsGlosa: TwwDataSource;
    qryGlosa: TwwQuery;
    ppdsnGlosa: TppDesigner;
    rpGlosa: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppDBImage9: TppDBImage;
    ppDBText136: TppDBText;
    ppDBText137: TppDBText;
    ppDBText139: TppDBText;
    ppDBText140: TppDBText;
    ppDBText141: TppDBText;
    ppDBText142: TppDBText;
    ppDBText143: TppDBText;
    ppLabel143: TppLabel;
    ppDBText144: TppDBText;
    ppLabel144: TppLabel;
    ppLine35: TppLine;
    ppDetailBand11: TppDetailBand;
    ppShape7: TppShape;
    ppDBText145: TppDBText;
    ppDBText146: TppDBText;
    ppDBText147: TppDBText;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
    ppDBText150: TppDBText;
    ppDBText151: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine36: TppLine;
    ppLabel145: TppLabel;
    ppSystemVariable19: TppSystemVariable;
    ppSystemVariable20: TppSystemVariable;
    ppSummaryBand9: TppSummaryBand;
    ppDBCalc45: TppDBCalc;
    ppLabel146: TppLabel;
    ppLine37: TppLine;
    ppGroup18: TppGroup;
    ppGroupHeaderBand18: TppGroupHeaderBand;
    ppLine38: TppLine;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppLabel149: TppLabel;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    ppLabel152: TppLabel;
    ppLabel153: TppLabel;
    ppDBText152: TppDBText;
    ppLabel154: TppLabel;
    ppGroupFooterBand18: TppGroupFooterBand;
    ppLine39: TppLine;
    ppLabel155: TppLabel;
    ppDBCalc46: TppDBCalc;
    ppLine40: TppLine;
    ppNLocalizados: TppBDEPipeline;
    dsNLocalizados: TwwDataSource;
    qryNLocalizados: TwwQuery;
    ppdsnNLocalizados: TppDesigner;
    rpNLocalizados: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppDBImage10: TppDBImage;
    ppDBText153: TppDBText;
    ppDBText154: TppDBText;
    ppDBText155: TppDBText;
    ppDBText156: TppDBText;
    ppDBText157: TppDBText;
    ppDBText158: TppDBText;
    ppDBText159: TppDBText;
    ppLabel156: TppLabel;
    ppDBText160: TppDBText;
    ppLabel157: TppLabel;
    ppLine41: TppLine;
    ppDetailBand12: TppDetailBand;
    ppShape8: TppShape;
    ppDBText162: TppDBText;
    ppDBText163: TppDBText;
    ppDBText165: TppDBText;
    ppDBText166: TppDBText;
    ppFooterBand11: TppFooterBand;
    ppLine42: TppLine;
    ppLabel158: TppLabel;
    ppSystemVariable21: TppSystemVariable;
    ppSystemVariable22: TppSystemVariable;
    ppEspecie: TppBDEPipeline;
    dsEspecie: TwwDataSource;
    qryEspecie: TwwQuery;
    ppdsnEspecie: TppDesigner;
    rpEspecie: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppDBImage11: TppDBImage;
    ppDBText169: TppDBText;
    ppDBText170: TppDBText;
    ppDBText171: TppDBText;
    ppDBText172: TppDBText;
    ppDBText173: TppDBText;
    ppDBText174: TppDBText;
    ppDBText175: TppDBText;
    ppLabel169: TppLabel;
    ppDBText176: TppDBText;
    ppLabel170: TppLabel;
    ppLine47: TppLine;
    ppDetailBand13: TppDetailBand;
    ppShape9: TppShape;
    ppDBText177: TppDBText;
    ppDBText178: TppDBText;
    ppDBText179: TppDBText;
    ppDBText180: TppDBText;
    ppDBText181: TppDBText;
    ppDBText182: TppDBText;
    ppDBText183: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine48: TppLine;
    ppLabel171: TppLabel;
    ppSystemVariable23: TppSystemVariable;
    ppSystemVariable24: TppSystemVariable;
    ppSummaryBand11: TppSummaryBand;
    ppDBCalc49: TppDBCalc;
    ppLabel172: TppLabel;
    ppLine49: TppLine;
    ppGroup20: TppGroup;
    ppGroupHeaderBand20: TppGroupHeaderBand;
    ppLine50: TppLine;
    ppLabel173: TppLabel;
    ppLabel174: TppLabel;
    ppLabel175: TppLabel;
    ppLabel176: TppLabel;
    ppLabel177: TppLabel;
    ppLabel178: TppLabel;
    ppLabel179: TppLabel;
    ppDBText184: TppDBText;
    ppLabel180: TppLabel;
    ppGroupFooterBand20: TppGroupFooterBand;
    ppLine51: TppLine;
    ppLabel181: TppLabel;
    ppDBCalc50: TppDBCalc;
    ppLine52: TppLine;
    lblTituloEspecie: TppLabel;
    ppRubrica: TppBDEPipeline;
    dsRubrica: TwwDataSource;
    qryRubrica: TwwQuery;
    ppdsnRubrica: TppDesigner;
    rpRubrica: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppDBImage12: TppDBImage;
    ppDBText185: TppDBText;
    ppDBText186: TppDBText;
    ppDBText187: TppDBText;
    ppDBText188: TppDBText;
    ppDBText189: TppDBText;
    ppDBText190: TppDBText;
    ppDBText191: TppDBText;
    ppLabel182: TppLabel;
    ppDBText192: TppDBText;
    ppLabel183: TppLabel;
    ppLine53: TppLine;
    lblTituloRubrica: TppLabel;
    ppDetailBand14: TppDetailBand;
    ppShape10: TppShape;
    ppDBText194: TppDBText;
    ppDBText195: TppDBText;
    ppDBText197: TppDBText;
    ppDBText198: TppDBText;
    ppFooterBand13: TppFooterBand;
    ppLine54: TppLine;
    ppLabel185: TppLabel;
    ppSystemVariable25: TppSystemVariable;
    ppSummaryBand12: TppSummaryBand;
    ppLabel186: TppLabel;
    ppLine55: TppLine;
    ppGroup21: TppGroup;
    ppGroupHeaderBand21: TppGroupHeaderBand;
    ppLine56: TppLine;
    ppLabel187: TppLabel;
    ppLabel188: TppLabel;
    ppLabel190: TppLabel;
    ppLabel191: TppLabel;
    ppLabel193: TppLabel;
    ppDBText200: TppDBText;
    ppGroupFooterBand21: TppGroupFooterBand;
    ppLine57: TppLine;
    ppLabel195: TppLabel;
    ppLine58: TppLine;
    ppDBCalc53: TppDBCalc;
    ppDBCalc54: TppDBCalc;
    ppDBCalc55: TppDBCalc;
    ppLabel184: TppLabel;
    ppLabel160: TppLabel;
    ppLabel161: TppLabel;
    ppLabel162: TppLabel;
    ppLabel163: TppLabel;
    ppLine44: TppLine;
    ppLabel159: TppLabel;
    lblMesRefRub: TppLabel;
    ppLabel164: TppLabel;
    lblMesRefEpecie: TppLabel;
    ppLabel165: TppLabel;
    lblMesRefNIden: TppLabel;
    ppLabel166: TppLabel;
    lblMesRefGlosa: TppLabel;
    ppLabel167: TppLabel;
    lblMesRefPAB: TppLabel;
    ppLabel168: TppLabel;
    lblMesRefResult: TppLabel;
    ppLabel189: TppLabel;
    ppLabel192: TppLabel;
    ppDBText161: TppDBText;
    ppDBText164: TppDBText;
    ppDBCalc47: TppDBCalc;
    ppDBCalc48: TppDBCalc;
    ppValorMant: TppBDEPipeline;
    dsValorMant: TwwDataSource;
    qryValorMant: TwwQuery;
    ppdsnValorMant: TppDesigner;
    rbValorMant: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppDBImage13: TppDBImage;
    ppDBText167: TppDBText;
    ppDBText168: TppDBText;
    ppDBText193: TppDBText;
    ppDBText196: TppDBText;
    ppDBText199: TppDBText;
    ppDBText201: TppDBText;
    ppDBText202: TppDBText;
    ppLabel194: TppLabel;
    ppDBText203: TppDBText;
    rptValorMant_lblTitulo: TppLabel;
    ppLine43: TppLine;
    ppDetailBand15: TppDetailBand;
    ppFooterBand14: TppFooterBand;
    ppLine45: TppLine;
    ppLabel198: TppLabel;
    ppSystemVariable26: TppSystemVariable;
    ppSummaryBand10: TppSummaryBand;
    ppGroup19: TppGroup;
    ppGroupHeaderBand19: TppGroupHeaderBand;
    ppLine59: TppLine;
    ppLabel205: TppLabel;
    lblMesRefVlrMant: TppLabel;
    ppGroupFooterBand19: TppGroupFooterBand;
    ppLine60: TppLine;
    ppLabel199: TppLabel;
    ppLabel200: TppLabel;
    ppDBText204: TppDBText;
    ppDBText205: TppDBText;
    ppDBText206: TppDBText;
    ppGroup22: TppGroup;
    ppGroupHeaderBand22: TppGroupHeaderBand;
    ppGroupFooterBand22: TppGroupFooterBand;
    ppDBCalc51: TppDBCalc;
    ppLabel202: TppLabel;
    ppLabel203: TppLabel;
    ppLabel204: TppLabel;
    ppLabel207: TppLabel;
    ppLabel208: TppLabel;
    ppLabel209: TppLabel;
    ppDBText207: TppDBText;
    ppDBText208: TppDBText;
    ppDBText209: TppDBText;
    ppDBText210: TppDBText;
    ppDBText211: TppDBText;
    ppDBCalc52: TppDBCalc;
    ppDBCalc56: TppDBCalc;
    ppDBCalc57: TppDBCalc;
    ppDBCalc58: TppDBCalc;
    ppDBCalc59: TppDBCalc;
    BandaVM: TppShape;
    ppLine46: TppLine;
    ppShape11: TppShape;
    ppLabel201: TppLabel;
    ppDBCalc60: TppDBCalc;
    ppDBCalc61: TppDBCalc;
    ppDBCalc62: TppDBCalc;
    ppDBCalc63: TppDBCalc;
    ppDBCalc64: TppDBCalc;
    ppDBCalc65: TppDBCalc;
    ppShape12: TppShape;
    ppLine61: TppLine;
    ppShape13: TppShape;
    ppListaExcecoes: TppBDEPipeline;
    dsListaExcecoes: TwwDataSource;
    qryListaExcecoes: TwwQuery;
    ppdsnListaExcecoes: TppDesigner;
    rpListaExcecoes: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppShape14: TppShape;
    ppDBImage14: TppDBImage;
    ppDBText212: TppDBText;
    ppDBText213: TppDBText;
    ppDBText214: TppDBText;
    ppDBText215: TppDBText;
    ppDBText216: TppDBText;
    ppDBText217: TppDBText;
    ppDBText218: TppDBText;
    ppLabel206: TppLabel;
    ppDBText219: TppDBText;
    ppLabel210: TppLabel;
    ppLine62: TppLine;
    ppLabel211: TppLabel;
    lblTituloListaExcecoes: TppLabel;
    ppDetailBand16: TppDetailBand;
    ppFooterBand15: TppFooterBand;
    ppLine63: TppLine;
    ppLabel213: TppLabel;
    ppSystemVariable27: TppSystemVariable;
    ppSummaryBand13: TppSummaryBand;
    ppLabel212: TppLabel;
    ppLabel214: TppLabel;
    ppLine64: TppLine;
    ppDBText220: TppDBText;
    ppDBText221: TppDBText;
    ppLabel215: TppLabel;
    ppDBText222: TppDBText;
    ppDBCalc66: TppDBCalc;
    ppDBCalc67: TppDBCalc;
    ppShape15: TppShape;
    ppLabel216: TppLabel;
    ppDBCalc68: TppDBCalc;
    ppDBCalc69: TppDBCalc;
    ppLine65: TppLine;
    ppDBCalc70: TppDBCalc;
    ppLabel217: TppLabel;
    ppLabel218: TppLabel;
    ppLine66: TppLine;
    ppListagemRubricas: TppBDEPipeline;
    dsListagemRubricas: TwwDataSource;
    qryListagemRubricas: TwwQuery;
    dsnppListagemRubricas: TppDesigner;
    rpListagemRubricas: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppShape16: TppShape;
    ppDBImage15: TppDBImage;
    ppDBText223: TppDBText;
    ppDBText224: TppDBText;
    ppDBText225: TppDBText;
    ppDBText226: TppDBText;
    ppDBText227: TppDBText;
    ppDBText228: TppDBText;
    ppDBText229: TppDBText;
    ppLabel197: TppLabel;
    ppDBText230: TppDBText;
    ppLabel219: TppLabel;
    ppLine67: TppLine;
    ppLabel220: TppLabel;
    lblMesAnoListagemRubricas: TppLabel;
    ppLabel222: TppLabel;
    ppLabel223: TppLabel;
    ppLine68: TppLine;
    ppDetailBand17: TppDetailBand;
    ppFooterBand16: TppFooterBand;
    ppLine69: TppLine;
    ppLabel224: TppLabel;
    ppSystemVariable28: TppSystemVariable;
    ppSummaryBand14: TppSummaryBand;
    ppDBCalc71: TppDBCalc;
    ppLabel225: TppLabel;
    ppLine70: TppLine;
    ppDBText231: TppDBText;
    ppDBText232: TppDBText;
    ppSubListagemRubricas: TppBDEPipeline;
    dsSubListagemRubricas: TwwDataSource;
    qrySubListagemRubricas: TwwQuery;
    ppLine72: TppLine;
    ppGroup24: TppGroup;
    ppGroupHeaderBand24: TppGroupHeaderBand;
    ppGroupFooterBand24: TppGroupFooterBand;
    ppLabel221: TppLabel;
    ppDBText236: TppDBText;
    ppDBCalc72: TppDBCalc;
    qryDifReembINSS: TwwQuery;
    dsDifReembINSS: TwwDataSource;
    ppDifReembINSS: TppBDEPipeline;
    pprDifReembINSS: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppShape17: TppShape;
    ppDBImage16: TppDBImage;
    ppDBText233: TppDBText;
    ppDBText234: TppDBText;
    ppDBText235: TppDBText;
    ppDBText237: TppDBText;
    ppDBText238: TppDBText;
    ppDBText239: TppDBText;
    ppDBText240: TppDBText;
    ppLabel226: TppLabel;
    ppDBText241: TppDBText;
    ppLabel227: TppLabel;
    ppLine71: TppLine;
    ppLabel228: TppLabel;
    pplMesCobranca: TppLabel;
    ppDetailBand18: TppDetailBand;
    ppShape18: TppShape;
    ppFooterBand17: TppFooterBand;
    ppLine73: TppLine;
    ppLabel230: TppLabel;
    ppSystemVariable29: TppSystemVariable;
    ppSummaryBand15: TppSummaryBand;
    ppShape19: TppShape;
    ppLine74: TppLine;
    ppdDifReembINSS: TppDesigner;
    ppGroup26: TppGroup;
    ppGroupHeaderBand26: TppGroupHeaderBand;
    ppGroupFooterBand26: TppGroupFooterBand;
    ppLabel234: TppLabel;
    ppDBText250: TppDBText;
    ppLabel235: TppLabel;
    ppDBText242: TppDBText;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLabel236: TppLabel;
    ppDBText243: TppDBText;
    ppDBText244: TppDBText;
    ppDBText245: TppDBText;
    ppDBText246: TppDBText;
    ppDBText247: TppDBText;
    ppDBText248: TppDBText;
    ppDBText249: TppDBText;
    ppDBText251: TppDBText;
    ppLabel237: TppLabel;
    ppLabel238: TppLabel;
    ppLabel239: TppLabel;
    ppLabel240: TppLabel;
    ppLabel241: TppLabel;
    ppLabel242: TppLabel;
    ppLabel243: TppLabel;
    ppDBCalc74: TppDBCalc;
    ppDBCalc75: TppDBCalc;
    updDifReembINSS: TUpdateSQL;
    ppSystemVariable30: TppSystemVariable;
    updExtrIndiv: TUpdateSQL;
    qryExtrIndiv: TwwQuery;
    dsExtrIndiv: TwwDataSource;
    ppExtrIndiv: TppBDEPipeline;
    pprExtrIndiv: TppReport;
    ppHeaderBand18: TppHeaderBand;
    ppDBImage17: TppDBImage;
    ppDBText252: TppDBText;
    ppDBText253: TppDBText;
    ppDBText254: TppDBText;
    ppDBText255: TppDBText;
    ppDBText256: TppDBText;
    ppDBText257: TppDBText;
    ppDBText258: TppDBText;
    ppLabel229: TppLabel;
    ppDBText259: TppDBText;
    ppLabel231: TppLabel;
    ppLine77: TppLine;
    ppDetailBand19: TppDetailBand;
    ppShape21: TppShape;
    ppDBText260: TppDBText;
    ppDBText261: TppDBText;
    ppDBText262: TppDBText;
    ppDBText263: TppDBText;
    ppDBText264: TppDBText;
    ppDBText265: TppDBText;
    ppDBText266: TppDBText;
    ppDBText267: TppDBText;
    ppFooterBand18: TppFooterBand;
    ppLine78: TppLine;
    ppLabel244: TppLabel;
    ppSystemVariable31: TppSystemVariable;
    ppSummaryBand16: TppSummaryBand;
    ppShape22: TppShape;
    ppLine79: TppLine;
    ppLabel246: TppLabel;
    ppLine81: TppLine;
    ppLabel247: TppLabel;
    ppLabel249: TppLabel;
    ppLabel250: TppLabel;
    ppLabel251: TppLabel;
    ppLabel252: TppLabel;
    ppLabel253: TppLabel;
    ppLabel254: TppLabel;
    ppdExtrIndiv: TppDesigner;
    ppLabel232: TppLabel;
    ppLabel233: TppLabel;
    ppDBText269: TppDBText;
    ppDBText270: TppDBText;
    ppLabel245: TppLabel;
    ppDBText273: TppDBText;
    ppSystemVariable32: TppSystemVariable;
    ppLabel248: TppLabel;
    lblTotalFuncef: TppLabel;
    lblTotalReemb: TppLabel;
    lblDiferenca: TppLabel;
    ppDBCalc76: TppDBCalc;
    ppLabel255: TppLabel;
    ppLabel256: TppLabel;
    ppDBCalc77: TppDBCalc;
    ppLine80: TppLine;
    ppShape20: TppShape;
    ppLabel257: TppLabel;
    ppLabel258: TppLabel;
    ppLabel259: TppLabel;
    ppDBText268: TppDBText;
    ppDBText271: TppDBText;
    ppLabel260: TppLabel;
    ppDBText272: TppDBText;
    ppLabel261: TppLabel;
    ppDBText274: TppDBText;
    ppShape23: TppShape;
    ppLabel262: TppLabel;
    ppDBText275: TppDBText;
    ppDBText276: TppDBText;
    ppDBCalc73: TppDBCalc;
    CMSqlDifReemb: TCMSqlParams;
    cdsDifReemb: TCMClientDataSet;
    ppLabel263: TppLabel;
    ppDBText277: TppDBText;
    ppdINSSFBSINT: TppDesigner;
    ppINSSFBSINT: TppReport;
    ppHeaderBand19: TppHeaderBand;
    ppDBImage18: TppDBImage;
    ppDBText278: TppDBText;
    ppDBText279: TppDBText;
    ppDBText280: TppDBText;
    ppDBText281: TppDBText;
    ppDBText282: TppDBText;
    ppDBText283: TppDBText;
    ppDBText284: TppDBText;
    ppLabel264: TppLabel;
    ppDBText285: TppDBText;
    ppLabel265: TppLabel;
    ppLine82: TppLine;
    ppDetailBand20: TppDetailBand;
    ppShape25: TppShape;
    ppFooterBand19: TppFooterBand;
    ppLine83: TppLine;
    ppLabel268: TppLabel;
    ppSystemVariable33: TppSystemVariable;
    ppSystemVariable34: TppSystemVariable;
    ppSummaryBand17: TppSummaryBand;
    ppShape26: TppShape;
    ppLine84: TppLine;
    ppDBCalc78: TppDBCalc;
    ppDBCalc79: TppDBCalc;
    ppDBCalc80: TppDBCalc;
    ppGroup23: TppGroup;
    ppGroupHeaderBand23: TppGroupHeaderBand;
    ppLabel269: TppLabel;
    ppDBText297: TppDBText;
    ppLabel270: TppLabel;
    ppLine85: TppLine;
    ppLine86: TppLine;
    ppLabel271: TppLabel;
    ppLabel272: TppLabel;
    ppLabel273: TppLabel;
    ppLabel274: TppLabel;
    ppLabel277: TppLabel;
    ppLabel278: TppLabel;
    ppGroupFooterBand23: TppGroupFooterBand;
    ppbdeINSSFBSINT: TppBDEPipeline;
    dsINSSFBSINT: TwwDataSource;
    qryINSSFBSINT: TwwQuery;
    updINSSFBSINT: TUpdateSQL;
    cmsqlINSSFBSINT: TCMSqlParams;
    CMdsINSSFBSINT: TCMClientDataSet;
    ppGroup25: TppGroup;
    ppGroupHeaderBand25: TppGroupHeaderBand;
    ppGroupFooterBand25: TppGroupFooterBand;
    ppDBText298: TppDBText;
    ppDBText299: TppDBText;
    ppDBText300: TppDBText;
    ppDBText301: TppDBText;
    ppDBText308: TppDBText;
    ppDBCalc81: TppDBCalc;
    ppDBCalc82: TppDBCalc;
    qryResultINSSENTIDADE: TStringField;
    qryResultINSSNUMPROCINSS: TStringField;
    qryResultINSSCODBENEFICIO: TStringField;
    qryResultINSSMATRICULA: TStringField;
    qryResultINSSNOME: TStringField;
    qryResultINSSCODPROVDESC: TStringField;
    qryResultINSSRUBRICAINSS: TFloatField;
    qryResultINSSVALORINSS: TFloatField;
    qryResultINSSVALORMANT: TFloatField;
    qryResultINSSDIFERENCA: TFloatField;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    ppLabel196: TppLabel;
    ppLabel266: TppLabel;
    ppLabel267: TppLabel;
    lblGlosa: TppLabel;
    ppLabel275: TppLabel;
    ppDBText286: TppDBText;
    function  MostraParam(Form: string): boolean; Override;
    procedure ppDBCalcBenefPrint(Sender: TObject);
    procedure ppDBCalcPlanoPrint(Sender: TObject);
    procedure ppDBCalcPatroPrint(Sender: TObject);
    procedure ppDBCalcTotalPrint(Sender: TObject);
    procedure ppDBBenefPrint(Sender: TObject);
    procedure ppDBPlanoPrint(Sender: TObject);
    procedure ppDBPatroPrint(Sender: TObject);
    procedure ppDBTotalPrint(Sender: TObject);
    procedure ppDetailBand4AfterPrint(Sender: TObject);
    procedure ppDetailBand7AfterPrint(Sender: TObject);
    procedure ppDetailBand9AfterPrint(Sender: TObject);
    procedure ppDetailBand8AfterPrint(Sender: TObject);
    procedure ppDetailBand18AfterPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelatBeneficios: TdtmRelatBeneficios;

implementation

uses FParamRelBenefConcAdiant,FParamRelBenefAdiantPgtoIntegral,
        FParamRelParticipSituacao, fParamConcINSSRegiao ;

{$R *.DFM}

function TdtmRelatBeneficios.MostraParam(Form: string): boolean;
var frm : TForm;
begin
  if (UPPERCASE(Form)      = UpperCase('frmParamRelBenefConcAdiant'))
  then frm := TfrmParamRelBenefConcAdiant.Create(Application)
  else if (UPPERCASE(Form) = UpperCase('FrmParamRelBenefPgtoIntegral'))
  then frm := TFrmParamRelBenefPgtoIntegral.Create(Application)
  else if (UPPERCASE(Form) = UpperCase('FrmParamRelParticipSituacao'))
  then frm := TFrmParamRelParticipSituacao.Create(Application)
  else if (UPPERCASE(Form) = UpperCase('FrmParamConcINSSRegiao'))
  then frm := TfrmParamConcINSSRegiao.Create(Application)

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
end;

procedure TdtmRelatBeneficios.ppDBCalcBenefPrint(Sender: TObject);
begin
  inherited;
  If qryBenefConcAdiant.IsEmpty Then
    ppDBCalcBenef.Value := '0';
end;

procedure TdtmRelatBeneficios.ppDBCalcPlanoPrint(Sender: TObject);
begin
  inherited;
  If qryBenefConcAdiant.IsEmpty Then
    ppDBCalcPlano.Value := '0';
end;

procedure TdtmRelatBeneficios.ppDBCalcPatroPrint(Sender: TObject);
begin
  inherited;
  If qryBenefConcAdiant.IsEmpty Then
    ppDBCalcPatro.Value := '0';
end;

procedure TdtmRelatBeneficios.ppDBCalcTotalPrint(Sender: TObject);
begin
  inherited;
  If qryBenefConcAdiant.IsEmpty Then
    ppDBCalcTotal.Value := '0';
end;

procedure TdtmRelatBeneficios.ppDBBenefPrint(Sender: TObject);
begin
  inherited;
  If qryBenefAdiantPgtoIntegral.IsEmpty then
    ppDBBenef.Value := '0';
end;

procedure TdtmRelatBeneficios.ppDBPlanoPrint(Sender: TObject);
begin
  inherited;
  If qryBenefAdiantPgtoIntegral.IsEmpty then
    ppDBPlano.Value := '0';
end;

procedure TdtmRelatBeneficios.ppDBPatroPrint(Sender: TObject);
begin
  inherited;
  If qryBenefAdiantPgtoIntegral.IsEmpty then
    ppDBPatro.Value := '0';
end;

procedure TdtmRelatBeneficios.ppDBTotalPrint(Sender: TObject);
begin
  inherited;
  If qryBenefAdiantPgtoIntegral.IsEmpty then
    ppDBTotal.Value := '0';
end;

procedure TdtmRelatBeneficios.ppDetailBand4AfterPrint(Sender: TObject);
begin
  inherited;
  If (ppDetailBand4.Count mod 2 ) = 0 Then
    ShapeDet.Brush.Color := clSilver
  Else ShapeDet.Brush.Color := clwhite;
end;

procedure TdtmRelatBeneficios.ppDetailBand7AfterPrint(Sender: TObject);
begin
  inherited;
  If (ppDetailBand7.Count mod 2 ) = 0 Then
    Banda1.Brush.Color := clSilver
  Else Banda1.Brush.Color := clwhite;

end;
procedure TdtmRelatBeneficios.ppDetailBand9AfterPrint(Sender: TObject);
begin
  inherited;
  If (ppDetailBand9.Count mod 2 ) = 0 Then
    Banda3.Brush.Color := clSilver
  Else Banda3.Brush.Color := clwhite;

end;

procedure TdtmRelatBeneficios.ppDetailBand8AfterPrint(Sender: TObject);
begin
  inherited;
  If (ppDetailBand8.Count mod 2 ) = 0 Then
    Banda2.Brush.Color := clSilver
  Else Banda2.Brush.Color := clwhite;
end;

procedure TdtmRelatBeneficios.ppDetailBand18AfterPrint(Sender: TObject);
begin
  inherited;
  If (ppDetailBand18.Count mod 2 ) = 0 Then
    ppShape18.Brush.Color := clSilver
  Else ppShape18.Brush.Color := clwhite;
end;



end.
