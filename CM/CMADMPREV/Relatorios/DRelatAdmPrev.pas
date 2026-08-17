// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//  Autor(a)   : Gleyber
//  Data       : 26/06/2007
//  Relatório  : rpPartDeb
//  Pendência  : 22570
//  Descrição  : - O mês referência e o mês cobrança passam a ficar na grade de informações.
//               - Retirado o mês cobrança do cabeçalho do relatório
//               - Retirado o mês cobrança do critério de agrupamento
//               - Mudada a ordenação por mês cobrança e mês referência.
//--------------------------------------------------------------------------------------------------
//  Autor      : André Pontes
//  Rotina     : Demonstrativo de Cálculo de Benefício (qryDemonsCalcBenef)
//  Data       : 10/11/2006
//  Pendencia  : 23086
//  Alteração  : Adicionados os campos de CPF e opção de tributação
// -------------------------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 21/07/2003
// Alteração   : Troca do campo DTINICIOINSC para INSCRICAODATA no relatório
//               "rpPartInscMes" na "Data de Inscrição"   - CM 21024
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : modificação de query
//  Data       : 04/05/2006
//  Pendencia  : 22153
//  Alteração  : Mudança de label de "Atrasada e não paga" para "Atrasada e já tratada".
// -------------------------------------------------------------------------------------------------
// Rotina    : rpDemonsCalcBenef / QryHistorico
// Autor(a)  : Augusto
// Data(a)   : 29/11/2005
// Pendencia : 20262
// Alteração : implementei no Demonstrativo de cálculo de beneficio, o historico de pagamentos  
// -----------------------------------------------------------------------------
// Rotina    : QryReservaPart
// Autor(a)  : Augusto
// Data(a)   : 03/11/2005
// Pendencia : 20441
// Alteração : Retirar constate que estava no lugar do parametro IDPLANOPREV
// -----------------------------------------------------------------------------
// Rotina    : ----
// Autor(a)  : Camille
// Data(a)   : 09.08.2004
// Pendencia : ----
// Alteração : Alteração no parametro para a chamada da busca salario
// -----------------------------------------------------------------------------
// Rotina    : ppDetailBand5BeforePrint
// Autor(a)  : Camille
// Data(a)   : 07/06/2004
// Pendencia : ----
// Alteração : Novo tratamento para aperecer Alteradores no relatório
//             Esconder totais de salario
// -----------------------------------------------------------------------------
// Rotina    : ppDetailBand5BeforePrint
// Autor(a)  : Camille
// Data      : 11.05.2004
// Pendencia : 16755
// Alteração : Preenchimento do campo salario de participacao
// -----------------------------------------------------------------------------
// Rotina    : ppDetailBand5BeforePrint
// Autor(a)  : Augusto
// Data      : 12/04/2004
// Alteração : Novo tratamento para aperecer Planilha no Relatorio
// -----------------------------------------------------------------------------
// Rotina    : RPBOLETAS
// Autor(a)  : Gleyber
// Data      : 17/11/2003
// Alteração : Inclusão de mais um grupo de ordenação (IDCONTRIBUICAO)
// -----------------------------------------------------------------------------
// Rotina    : qryCalculo
// Autor(a)  : Gleyber
// Data      : 28/04/2003
// Alteração : Alteração do decode no salario virtual (pendência 13731)
// -----------------------------------------------------------------------------
// Rotina    : rpRecPIDPIA
// Autor(a)  : Gleyber
// Data      : 08/07/2002
// Alteração : Acrescentei o campo SALMANTIDO no report
// -----------------------------------------------------------------------------
// Rotina    : rpResumoCobr
// Autor(a)  : Leo
// Data      : 04/07/2002:
// Alteração : troquei o group NOMECONTRIB por IDCONTRIBUICAO
// -----------------------------------------------------------------------------
{leocbs - 29042002 - alterei o rpResumoCobr tornando negativos os valores de devolução}
{leocbs - 07122001 - acrescentei o campo plnplanil da tabela planila}

{*******************************
 Lise - 28/11/2001
 Alteração qryBeneficio
                                                    
*******************************}

unit DRelatAdmPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppStrtch,
  ppRegion, ppSubRpt, ppMemo, ppVar, ppRelatv, ppDBPipe, ppModule,
  daDataModule, ppEndUsr, ppParameter;

type
  TdtmRelatAdmPrev = class(TdtmReports)
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    qryBenefProv: TwwQuery;
    dsBenefProv: TwwDataSource;
    ppBenefProv: TppBDEPipeline;
    rpBenefProv: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    rpBenefProvDBText10: TppDBText;
    rpBenefProvLine2: TppLine;
    rpBenefProvLabel6: TppLabel;
    rpBenefProvLabel8: TppLabel;
    rpBenefProvLabel9: TppLabel;
    rpBenefProvLabel10: TppLabel;
    rpBenefProvLabel7: TppLabel;
    rpBenefProvLabel2: TppLabel;
    rpBenefProvLabel3: TppLabel;
    rpBenefProvDBText11: TppDBText;
    rpBenefProvDBText12: TppDBText;
    rpBenefProvDBImage1: TppDBImage;
    ppDetailBand2: TppDetailBand;
    rpBenefProvDBText1: TppDBText;
    rpBenefProvDBText3: TppDBText;
    rpBenefProvDBText4: TppDBText;
    rpBenefProvDBText7: TppDBText;
    rpBenefProvDBText8: TppDBText;
    rpBenefProvLabel1: TppLabel;
    ppFooterBand2: TppFooterBand;
    ppCalc1: TppSystemVariable;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppCalc2: TppSystemVariable;
    rpBenefProvGroup1: TppGroup;
    rpBenefProvGroupHeaderBand1: TppGroupHeaderBand;
    rpBenefProvShape1: TppShape;
    rpBenefProvDBText9: TppDBText;
    rpBenefProvGroupFooterBand1: TppGroupFooterBand;
    rpBenefProvGroup2: TppGroup;
    rpBenefProvGroupHeaderBand2: TppGroupHeaderBand;
    rpBenefProvDBText6: TppDBText;
    rpBenefProvGroupFooterBand2: TppGroupFooterBand;
    rpBenefProvGroup3: TppGroup;
    rpBenefProvGroupHeaderBand3: TppGroupHeaderBand;
    rpBenefProvDBText5: TppDBText;
    rpBenefProvGroupFooterBand3: TppGroupFooterBand;
    rpBenefProvGroup4: TppGroup;
    rpBenefProvGroupHeaderBand4: TppGroupHeaderBand;
    rpBenefProvLine1: TppLine;
    rpBenefProvDBText2: TppDBText;
    rpBenefProvGroupFooterBand4: TppGroupFooterBand;
    qryParticipante: TwwQuery;
    dsContribPart: TwwDataSource;
    ppContribPart: TppBDEPipeline;
    rpContribPart: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLine3: TppLine;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppCalc5: TppSystemVariable;
    ppLine5: TppLine;
    ppLabel6: TppLabel;
    ppCalc6: TppSystemVariable;
    rpContribPartDBImage1: TppDBImage;
    rpContribPartDBText1: TppDBText;
    rpContribPartDBText2: TppDBText;
    rpContribPartLabel1: TppLabel;
    rpContribPartLabel2: TppLabel;
    rpContribPartDBText3: TppDBText;
    pplRecadastramento: TppBDEPipeline;
    dsRecadastramento: TwwDataSource;
    qryRecadastramento: TwwQuery;
    qryRecadastramentoIdentidade: TStringField;
    qryRecadastramentoOrgao: TStringField;
    qryRecadastramentoCpfFormatado: TStringField;
    rptRecadastramento: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel14: TppLabel;
    CCContratoLinha1: TppLine;
    ppLabel22: TppLabel;
    rptRedadastramentoLabel1: TppLabel;
    rptRedadastramentoLabel2: TppLabel;
    rptRedadastramentoLabel3: TppLabel;
    rptRedadastramentoLabel5: TppLabel;
    rptRedadastramentoLabel8: TppLabel;
    rptRedadastramentoLabel9: TppLabel;
    rptRedadastramentoLabel10: TppLabel;
    rptRedadastramentoLabel11: TppLabel;
    rptRedadastramentoLabel12: TppLabel;
    rptRedadastramentoLabel13: TppLabel;
    rptRedadastramentoLabel14: TppLabel;
    rptRedadastramentoLabel15: TppLabel;
    rptRedadastramentoLabel17: TppLabel;
    rptRedadastramentoLabel18: TppLabel;
    rptRedadastramentoLabel4: TppLabel;
    rptRedadastramentoLabel6: TppLabel;
    ppDetailBand6: TppDetailBand;
    rptRedadastramentoDBText1: TppDBText;
    rptRedadastramentoDBText2: TppDBText;
    rptRedadastramentoSeparador: TppLine;
    rptRedadastramentoDBText4: TppDBText;
    rptRedadastramentoDBText5: TppDBText;
    rptRedadastramentoDBText6: TppDBText;
    rptRedadastramentoDBText7: TppDBText;
    rptRedadastramentoDBText8: TppDBText;
    rptRedadastramentoDBText3: TppDBText;
    rptRedadastramentoDBText10: TppDBText;
    rptRedadastramentoLabel7: TppLabel;
    rptRedadastramentoDBText9: TppDBText;
    rptRedadastramentoDBText11: TppDBText;
    rptRedadastramentoDBText12: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppCalc9: TppSystemVariable;
    CCContratoLinha4: TppLine;
    ppLabel21: TppLabel;
    ppCalc10: TppSystemVariable;
    rptRecadastramentoSummaryBand1: TppSummaryBand;
    ppShape1: TppShape;
    rptRedadastramentoDBCalc1: TppDBCalc;
    rptRedadastramentoLabel16: TppLabel;
    qryDoc: TwwQuery;
    qryDocIDDOCUMENTO: TFloatField;
    qryDocORGAO: TStringField;
    qryDocDATAEMISSAO: TDateTimeField;
    qryDocUF: TStringField;
    qryDocIDPESSOA: TFloatField;
    qryDocNUMDOCUMENTO: TStringField;
    qryPdvGeral: TwwQuery;
    qryPdvGeralNOMEREG: TStringField;
    qryPdvGeralNOMEPES: TStringField;
    qryPdvGeralMATRICULA: TStringField;
    qryPdvGeralIDCARGOEXT: TFloatField;
    qryPdvGeralVALORBASE1: TFloatField;
    qryPdvGeralVALORBASE2: TFloatField;
    qryPdvGeralDATANASC: TDateTimeField;
    qryPdvGeralTAXA: TFloatField;
    qryPdvGeralFATORJ: TFloatField;
    qryPdvGeralIDPESSJUR: TFloatField;
    qryPdvGeralIDPESSOA: TFloatField;
    qryPdvGeralTOTPART: TFloatField;
    dsPdvGeral: TwwDataSource;
    ppPdvGeral: TppBDEPipeline;
    rpPdvGeral: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLine8: TppLine;
    ppDBImage1: TppDBImage;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    lblMesRefPDVGeral: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    rpPdvGeralDBText2: TppDBText;
    rpPdvGeralDBText3: TppDBText;
    rpPdvGeralDBText4: TppDBText;
    rpPdvGeralDBText7: TppDBText;
    Apose: TppDBText;
    lblTaxa: TppLabel;
    lblJoia: TppLabel;
    ppFooterBand7: TppFooterBand;
    ppCalc11: TppSystemVariable;
    ppLine9: TppLine;
    ppLabel11: TppLabel;
    ppCalc12: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel12: TppLabel;
    ppLabel16: TppLabel;
    ppLine10: TppLine;
    Niv: TppLabel;
    rpPdvGeralLabel1: TppLabel;
    rpPdvGeralLabel2: TppLabel;
    rpPdvGeralLabel3: TppLabel;
    rpPdvGeralLabel4: TppLabel;
    rpPdvGeralLabel5: TppLabel;
    rpPdvGeralLabel6: TppLabel;
    rpPdvGeralLabel7: TppLabel;
    rpPdvGeralLabel8: TppLabel;
    rpPdvGeralLabel9: TppLabel;
    rpPdvGeralLabel11: TppLabel;
    rpPdvGeralLabel13: TppLabel;
    rpPdvGeralLabel14: TppLabel;
    rpPdvGeralLabel15: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine12: TppLine;
    rpPdvGeralLabel10: TppLabel;
    qryAux: TwwQuery;
    qryPaPdvTpCob: TwwQuery;
    qryPaPdvTpCobNOMEREG: TStringField;
    qryPaPdvTpCobNOMEPES: TStringField;
    qryPaPdvTpCobMATRICULA: TStringField;
    qryPaPdvTpCobTOTPART: TFloatField;
    qryPaPdvTpCobIDPESSJUR: TFloatField;
    qryPaPdvTpCobIDPESSOA: TFloatField;
    qryPaPdvTpCobIDPLANOPREV: TFloatField;
    qryPaPdvTpCobSEQPROPOSTA: TFloatField;
    qryPaPdvTpCobMESREFERENCIA: TStringField;
    qryPaPdvTpCobNOMECONT1: TStringField;
    qryPaPdvTpCobNOMECONT2: TStringField;
    qryPaPdvTpCobNOMECONT3: TStringField;
    qryPaPdvTpCobNOMECONTO: TStringField;
    qryPaPdvTpCobVALOR1: TCurrencyField;
    qryPaPdvTpCobVALOR2: TCurrencyField;
    qryPaPdvTpCobVALOR3: TCurrencyField;
    qryPaPdvTpCobVALORO: TCurrencyField;
    qryPaPdvTpCobSUMVALOR: TCurrencyField;
    qryPaPdvTpCobIDMOTIVO: TFloatField;
    qryPaPdvTpCobDATAINICIOFUND: TDateTimeField;
    dsPaPdvTpCob: TwwDataSource;
    ppPaPdvTpCob: TppBDEPipeline;
    rpPaPdvTpCob: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel17: TppLabel;
    ppLine11: TppLine;
    ppDBImage2: TppDBImage;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDBText8: TppDBText;
    ppLabel23: TppLabel;
    rpPaPdvTpCoblblTpCobra: TppLabel;
    rpPaPdvTpCoblblTpCobra2: TppLabel;
    rpPaPdvTpCoblblMesRef: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    rpPaPdvTpCobLabel1: TppLabel;
    rpPaPdvTpCobDBText5: TppDBText;
    rpPaPdvTpCobDBText6: TppDBText;
    rpPaPdvTpCobDBText7: TppDBText;
    rpPaPdvTpCobDBText8: TppDBText;
    rpPaPdvTpCobDBText9: TppDBText;
    rpPaPdvTpCobDBText10: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppCalc13: TppSystemVariable;
    ppLine13: TppLine;
    ppLabel28: TppLabel;
    ppCalc14: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLine14: TppLine;
    ppLabel31: TppLabel;
    ppLabel34: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppDBText22: TppDBText;
    rpPaPdvTpCobDBText1: TppDBText;
    rpPaPdvTpCobDBText2: TppDBText;
    rpPaPdvTpCobDBText3: TppDBText;
    rpPaPdvTpCobDBText4: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine15: TppLine;
    ppLabel46: TppLabel;
    ppDBCalc1: TppDBCalc;
    rpPaPdvTpCobDBCalc1: TppDBCalc;
    rpPaPdvTpCobDBCalc2: TppDBCalc;
    rpPaPdvTpCobDBCalc3: TppDBCalc;
    rpPaPdvTpCobDBCalc4: TppDBCalc;
    rpPaPdvTpCobDBCalc5: TppDBCalc;
    rpContribPartLabel3: TppLabel;
    rpContribPartLabel4: TppLabel;
    rpContribPartDBText4: TppDBText;
    rpContribPartLabel5: TppLabel;
    rpContribPartLabel6: TppLabel;
    rpContribPartLabel8: TppLabel;
    rpContribPartLabel9: TppLabel;
    rpContribPartLabel10: TppLabel;
    rpContribPartLabel11: TppLabel;
    rpContribPartLabel12: TppLabel;
    rpContribPartLabel13: TppLabel;
    rpContribPartLabel14: TppLabel;
    rpContribPartLabel15: TppLabel;
    rpContribPartLabel16: TppLabel;
    rpContribPartLabel17: TppLabel;
    rpContribPartDBText5: TppDBText;
    rpContribPartDBText6: TppDBText;
    rpContribPartDBText7: TppDBText;
    rpContribPartDBText8: TppDBText;
    rpContribPartDBText9: TppDBText;
    rpContribPartDBText10: TppDBText;
    rpContribPartDBText11: TppDBText;
    rpContribPartDBText12: TppDBText;
    qryRelBeneficios: TwwQuery;
    dsRelBeneficios: TwwDataSource;
    ppBDERelBeneficios: TppBDEPipeline;
    ppRepRelBeneficios: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppRegion3: TppRegion;
    ppLabel13: TppLabel;
    ppLabel63: TppLabel;
    ppLabel105: TppLabel;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppLabel106: TppLabel;
    ppLine27: TppLine;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppLine29: TppLine;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    ppDetailBand11: TppDetailBand;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    ppDBText116: TppDBText;
    ppDBText117: TppDBText;
    ppDBText118: TppDBText;
    ppOpcoesBenef: TppRegion;
    ppDBText119: TppDBText;
    ppDBText120: TppDBText;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    ppFooterBand11: TppFooterBand;
    ppCalc19: TppSystemVariable;
    ppLine31: TppLine;
    ppLabel130: TppLabel;
    ppCalc20: TppSystemVariable;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    lblNumeroProc: TppLabel;
    ppLabel159: TppLabel;
    ppLabel160: TppLabel;
    ppLabel161: TppLabel;
    ppDBText126: TppDBText;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppReport1DBText1: TppDBText;
    ppReport1Label3: TppLabel;
    ppReport1Label4: TppLabel;
    ppReport1Label5: TppLabel;
    ppReport1Label8: TppLabel;
    ppReport1Label9: TppLabel;
    ppReport1Label10: TppLabel;
    ppReport1Label11: TppLabel;
    ppReport1Label12: TppLabel;
    ppReport1Region1: TppRegion;
    ppReport1Label2: TppLabel;
    ppDBText105: TppDBText;
    ppReport1Label6: TppLabel;
    ppDBText109: TppDBText;
    ppReport1Label7: TppLabel;
    ppDBText110: TppDBText;
    ppDBText113: TppDBText;
    ppReport1Label1: TppLabel;
    ppReport1Region2: TppRegion;
    ppReport1Label13: TppLabel;
    ppReport1DBText2: TppDBText;
    ppReport1Label14: TppLabel;
    ppReport1Label15: TppLabel;
    ppReport1Label16: TppLabel;
    ppReport1Label17: TppLabel;
    ppReport1Label18: TppLabel;
    ppReport1Label19: TppLabel;
    ppReport1Line1: TppLine;
    ppReport1Line2: TppLine;
    ppReport1DBText3: TppDBText;
    ppReport1DBText4: TppDBText;
    ppReport1DBText5: TppDBText;
    ppReport1DBText6: TppDBText;
    ppReport1DBText7: TppDBText;
    ppReport1DBText8: TppDBText;
    ppReport1Label20: TppLabel;
    ppReport1Label21: TppLabel;
    ppRepRelBeneficiosDBText1: TppDBText;
    ppRepRelBeneficiosLabel1: TppLabel;
    rpRelBenefDif: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel27: TppLabel;
    ppLine16: TppLine;
    ppLabel33: TppLabel;
    ppLabel35: TppLabel;
    ppLabel37: TppLabel;
    ppLabel41: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLine17: TppLine;
    ppDBText27: TppDBText;
    ppDBText29: TppDBText;
    ppDBText34: TppDBText;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppDBImage3: TppDBImage;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppDBText45: TppDBText;
    rpRelBenefDifLabel1: TppLabel;
    rpRelBenefDifDBText1: TppDBText;
    rpRelBenefDifLabel2: TppLabel;
    rpRelBenefDifDBText2: TppDBText;
    rpRelBenefDifDBText3: TppDBText;
    rpRelBenefDifLabel3: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppDBText61: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText46: TppDBText;
    rpRelBenefDifLabel16: TppLabel;
    ppDBText53: TppDBText;
    rpRelBenefDifLabel17: TppLabel;
    rpRelBenefDifLabel18: TppLabel;
    rpRelBenefDifLabel4: TppLabel;
    rpRelBenefDifDBText4: TppDBText;
    ppDetailBand9: TppDetailBand;
    ppDBText49: TppDBText;
    rpRelBenefDifDBText5: TppDBText;
    rpRelBenefDifDBText6: TppDBText;
    rpRelBenefDifDBText7: TppDBText;
    rpRelBenefDifDBText9: TppDBText;
    rpRelBenefDifDBText10: TppDBText;
    rpRelBenefDifDBText11: TppDBText;
    rpRelBenefDifDBText12: TppDBText;
    rpRelBenefDifDBText8: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppCalc15: TppSystemVariable;
    ppLabel62: TppLabel;
    ppCalc16: TppSystemVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    rpRelBenefDifLabel13: TppLabel;
    rpRelBenefDifLabel12: TppLabel;
    rpRelBenefDifLabel15: TppLabel;
    rpRelBenefDifLabel11: TppLabel;
    rpRelBenefDifLabel10: TppLabel;
    rpRelBenefDifLabel9: TppLabel;
    rpRelBenefDifLabel14: TppLabel;
    rpRelBenefDifLabel8: TppLabel;
    rpRelBenefDifLabel7: TppLabel;
    rpRelBenefDifLabel6: TppLabel;
    rpRelBenefDifLabel5: TppLabel;
    rpRelBenefDifLine1: TppLine;
    ppGroupFooterBand3: TppGroupFooterBand;
    rpRelBenefDifDBCalc1: TppDBCalc;
    rpRelBenefDifDBCalc2: TppDBCalc;
    rpRelBenefDifDBCalc3: TppDBCalc;
    rpRelBenefDifDBCalc5: TppDBCalc;
    rpRelBenefDifDBCalc4: TppDBCalc;
    rpRelBenefDifDBCalc6: TppDBCalc;
    rpRelBenefDifDBCalc7: TppDBCalc;
    ppLine21: TppLine;
    rpRelBenefDifDBCalc8: TppDBCalc;
    ppRelBenefDif: TppBDEPipeline;
    dsRelBenefDif: TwwDataSource;
    qryRelBenefDif: TwwQuery;
    qryRelBenefDifNOME: TStringField;
    qryRelBenefDifNOMEPATROCINADORA: TStringField;
    qryRelBenefDifNOMEPLANO: TStringField;
    qryRelBenefDifMATRICULA: TStringField;
    qryRelBenefDifINSCRICAODATA: TDateTimeField;
    qryRelBenefDifINSCRICAONUMERO: TFloatField;
    qryRelBenefDifDTINICIOINSC: TDateTimeField;
    qryRelBenefDifSALAUXDOENCA: TFloatField;
    qryRelBenefDifNOMEBENEFICIARIO: TStringField;
    qryRelBenefDifNOMESITPART: TStringField;
    qryRelBenefDifNOMEBENEFICIO: TStringField;
    qryRelBenefDifNOMEEVENTO: TStringField;
    qryRelBenefDifDTEVENTO: TDateTimeField;
    qryRelBenefDifNUMEROPROCESSO: TFloatField;
    qryRelBenefDifDATAREQUERIMENTO: TDateTimeField;
    qryRelBenefDifDATAINICIO: TDateTimeField;
    qryRelBenefDifDATAFINAL: TDateTimeField;
    qryRelBenefDifDATAINICIOFUND: TDateTimeField;
    qryRelBenefDifMESREFERENCIA: TStringField;
    qryRelBenefDifVALESPC: TFloatField;
    qryRelBenefDifVALRECC: TFloatField;
    qryRelBenefDifFLGTIPO: TStringField;
    qryRelBenefDifVALCALCB: TFloatField;
    qryRelBenefDifVALPAGB: TFloatField;
    qryRelBenefDifVALOR: TFloatField;
    qryRelBenefDifDATAHOJE: TDateTimeField;
    qryRelBenefDifALTERACONT: TFloatField;
    qryRelBenefDifDIFBENEF: TCurrencyField;
    qryRelBenefDifDIFCONT: TCurrencyField;
    ppRepRelBeneficiosTitleBand1: TppTitleBand;
    rpPdvGeralDBText8: TppDBText;
    rpPdvGeralDBText9: TppDBText;
    rpPdvGeralDBText10: TppDBText;
    rpPdvGeralDBText11: TppDBText;
    rpPdvGeralDBText12: TppDBText;
    qryPdvGeralNOMEBENEF: TStringField;
    rpPdvGeralDBCalc1: TppDBCalc;
    qryPdvGeralMESREFERENCIA: TStringField;
    rpPdvGeralDBText13: TppDBText;
    qryCertTemp: TwwQuery;
    updQryCert: TUpdateSQL;
    qryParticipManut: TwwQuery;
    dsParticipManut: TwwDataSource;
    ppParticipManut: TppBDEPipeline;
    rpParticipManut: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel26: TppLabel;
    ppLine23: TppLine;
    ppReport1Label28: TppLabel;
    ppReport1Label29: TppLabel;
    ppReport1Label31: TppLabel;
    ppReport1Label22: TppLabel;
    ppReport1Label24: TppLabel;
    ppReport1Label25: TppLabel;
    pplblTituloColuna4: TppLabel;
    ppReport1Label27: TppLabel;
    rpParticipManutLine1: TppLine;
    rpParticipManutLabel1: TppLabel;
    rpParticipManutLabel2: TppLabel;
    rpParticipManutLabel3: TppLabel;
    pplblMesAno: TppLabel;
    pplblTipoCobranca: TppLabel;
    rpParticipManutLabel5: TppLabel;
    ppDetBandParticipManut: TppDetailBand;
    ppReport1DBText9: TppDBText;
    ppReport1DBText10: TppDBText;
    rpParticipManutDBText6: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppCalc21: TppSystemVariable;
    ppLine24: TppLine;
    ppLabel36: TppLabel;
    ppCalc22: TppSystemVariable;
    rpParticipManutSummaryBand1: TppSummaryBand;
    rpParticipManutLabel4: TppLabel;
    qryHstContribPartp: TwwQuery;
    ppRelCadastrais: TppBDEPipeline;
    dsRelCadastrais: TwwDataSource;
    qryRelCadastrais: TwwQuery;
    rpRelCadastrais: TppReport;
    ppHeaderBand14: TppHeaderBand;
    pplblTituloRel: TppLabel;
    ppLine25: TppLine;
    pplblColuna01: TppLabel;
    pplblColuna02: TppLabel;
    ppDetailBand14: TppDetailBand;
    ppdbtColuna01: TppDBText;
    ppdbtColuna02: TppDBText;
    ppFooterBand13: TppFooterBand;
    ppCalc23: TppSystemVariable;
    ppLine26: TppLine;
    ppLabel40: TppLabel;
    ppCalc24: TppSystemVariable;
    rpParticipManutDBText7: TppDBText;
    rpParticipManutDBImage1: TppDBImage;
    rpParticipManutDBText8: TppDBText;
    rpParticipManutDBText9: TppDBText;
    rpParticipManutDBText10: TppDBText;
    rpParticipManutDBText11: TppDBText;
    rpParticipManutDBText12: TppDBText;
    rpParticipManutDBText13: TppDBText;
    rpParticipManutDBText14: TppDBText;
    rpParticipManutLabel7: TppLabel;
    rpParticipManutDBText15: TppDBText;
    lblSalManut: TppLabel;
    lblContribPart: TppLabel;
    lblContribPatro: TppLabel;
    lblJoiaManut: TppLabel;
    lblOutras: TppLabel;
    lblTotalContrib: TppLabel;
    rpParticipManutDBCalc7: TppDBCalc;
    rpParticipManutLabel6: TppLabel;
    lblTotalPart: TppLabel;
    lblTotalPatro: TppLabel;
    lblTotalJoia: TppLabel;
    lblTotalOutras: TppLabel;
    lblTotalTotal: TppLabel;
    qryPdvGeralDATAEVENTO: TDateTimeField;
    rpPdvGeralDBText14: TppDBText;
    qryPdvGeralDATAVOLTA: TDateTimeField;
    rpPdvGeralDBText15: TppDBText;
    lblPasNivel: TppLabel;
    lblPasCargo: TppLabel;
    qryDemonsCalcBenef: TwwQuery;
    dsDemonsCalcBenef: TwwDataSource;
    ppDemonsCalcBenef: TppBDEPipeline;
    rpDemonsCalcBenef: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppLabel9: TppLabel;
    ppLine28: TppLine;
    ppDetailBand10: TppDetailBand;
    ppFooterBand10: TppFooterBand;
    ppCalc25: TppSystemVariable;
    ppLine30: TppLine;
    ppLabel18: TppLabel;
    ppCalc26: TppSystemVariable;
    rpDemonsCalcBenefDBImage1: TppDBImage;
    rpDemonsCalcBenefDBText1: TppDBText;
    rpDemonsCalcBenefDBText2: TppDBText;
    rpDemonsCalcBenefDBText3: TppDBText;
    rpDemonsCalcBenefDBText4: TppDBText;
    rpDemonsCalcBenefDBText5: TppDBText;
    rpDemonsCalcBenefDBText6: TppDBText;
    rpDemonsCalcBenefDBText7: TppDBText;
    rpDemonsCalcBenefLabel1: TppLabel;
    rpDemonsCalcBenefDBText8: TppDBText;
    rpDemonsCalcBenefLabel2: TppLabel;
    rpDemonsCalcBenefLabel3: TppLabel;
    rpDemonsCalcBenefLabel4: TppLabel;
    rpDemonsCalcBenefLabel5: TppLabel;
    rpDemonsCalcBenefLabel6: TppLabel;
    rpDemonsCalcBenefLabel7: TppLabel;
    rpDemonsCalcBenefLabel8: TppLabel;
    rpDemonsCalcBenefLabel9: TppLabel;
    rpDemonsCalcBenefLabel10: TppLabel;
    rpDemonsCalcBenefLabel11: TppLabel;
    rpDemonsCalcBenefLabel15: TppLabel;
    rpDemonsCalcBenefDBText9: TppDBText;
    rpDemonsCalcBenefDBText10: TppDBText;
    rpDemonsCalcBenefDBText11: TppDBText;
    rpDemonsCalcBenefDBText12: TppDBText;
    rpDemonsCalcBenefDBText13: TppDBText;
    rpDemonsCalcBenefDBText14: TppDBText;
    rpDemonsCalcBenefDBText15: TppDBText;
    rpDemonsCalcBenefDBText16: TppDBText;
    rpDemonsCalcBenefDBText17: TppDBText;
    rpDemonsCalcBenefDBText18: TppDBText;
    rpDemonsCalcBenefDBText20: TppDBText;
    rpDemonsCalcBenefLine1: TppLine;
    qryBeneficioAnterior: TwwQuery;
    qryBeneficioAnteriorDATAINICIO: TDateTimeField;
    qryBeneficioAnteriorDATAFINAL: TDateTimeField;
    qryBeneficioAnteriorVALORATUAL: TFloatField;
    qryBeneficioAnteriorBENEFICIO: TStringField;
    qryBeneficioAnteriorNUMEROPROCESSO: TFloatField;
    dsBeneficioAnterior: TwwDataSource;
    ppBeneficioAnterior: TppBDEPipeline;
    rpDemonsCalcBenefLabel16: TppLabel;
    rpDemonsCalcBenefLabel17: TppLabel;
    rpDemonsCalcBenefLabel18: TppLabel;
    rpDemonsCalcBenefLabel19: TppLabel;
    rpDemonsCalcBenefDBText23: TppDBText;
    rpDemonsCalcBenefDBText24: TppDBText;
    rpDemonsCalcBenefDBText26: TppDBText;
    rpDemonsCalcBenefLabel20: TppLabel;
    rpDemonsCalcBenefDBText27: TppDBText;
    rpDemonsCalcBenefLabel21: TppLabel;
    rpDemonsCalcBenefLabel22: TppLabel;
    rpDemonsCalcBenefLabel23: TppLabel;
    rpDemonsCalcBenefLabel24: TppLabel;
    rpDemonsCalcBenefLabel25: TppLabel;
    rpDemonsCalcBenefLabel26: TppLabel;
    rpDemonsCalcBenefDBText34: TppDBText;
    rpDemonsCalcBenefDBText35: TppDBText;
    rpDemonsCalcBenefDBText36: TppDBText;
    rpDemonsCalcBenefDBText37: TppDBText;
    rpDemonsCalcBenefDBText39: TppDBText;
    qryDetCalculo: TwwQuery;
    dsDetCalculo: TwwDataSource;
    ppDetCalculo: TppBDEPipeline;
    qryCalculo: TwwQuery;
    dsCalculo: TwwDataSource;
    ppCalculo: TppBDEPipeline;
    qryReservaPart: TwwQuery;
    dsReservaPart: TwwDataSource;
    ppReservaPart: TppBDEPipeline;
    rpDemonsCalcBenefMemoCalc: TppSubReport;
    rpDemonsCalcBenefChildReport1: TppChildReport;
    rpDemonsCalcBenefChildReport1TitleBand1: TppTitleBand;
    rpDemonsCalcBenefChildReport1DetailBand1: TppDetailBand;
    rpDemonsCalcBenefChildReport1DBText1: TppDBText;
    rpDemonsCalcBenefChildReport1DBText2: TppDBText;
    rpDemonsCalcBenefChildReport1SummaryBand1: TppSummaryBand;
    rpDemonsCalcBenefDBText25: TppDBText;
    rpDemonsCalcBenefLabel42: TppLabel;
    rpDemonsCalcBenefDBText42: TppDBText;
    dsDependentes: TwwDataSource;
    qryDependentes: TwwQuery;
    ppDependentes: TppBDEPipeline;
    ppRegionaisPdv2: TppBDEPipeline;
    dsRegionaisPdv2: TwwDataSource;
    qryRegionaisPdv2: TwwQuery;
    rpRegionaisPdv2: TppReport;
    ppHeaderBand16: TppHeaderBand;
    rpRegionaisPdv2DBImage1: TppDBImage;
    rpRegionaisPdv2DBText1: TppDBText;
    rpRegionaisPdv2DBText2: TppDBText;
    rpRegionaisPdv2DBText3: TppDBText;
    rpRegionaisPdv2DBText4: TppDBText;
    rpRegionaisPdv2DBText5: TppDBText;
    rpRegionaisPdv2DBText6: TppDBText;
    rpRegionaisPdv2DBText7: TppDBText;
    rpRegionaisPdv2Label1: TppLabel;
    rpRegionaisPdv2DBText8: TppDBText;
    rpRegionaisPdv2Label2: TppLabel;
    rpRegionaisPdv2Line1: TppLine;
    rpRegionaisPdv2lblPatro: TppLabel;
    rpRegionaisPdv2Line2: TppLine;
    rpRegionaisPdv2Label4: TppLabel;
    rpRegionaisPdv2Label5: TppLabel;
    rpRegionaisPdv2Label6: TppLabel;
    rpRegionaisPdv2Label7: TppLabel;
    rpRegionaisPdv2Label8: TppLabel;
    rpRegionaisPdv2Label9: TppLabel;
    ppDetailBand1: TppDetailBand;
    rpRegionaisPdv2DBText9: TppDBText;
    rpRegionaisPdv2DBText10: TppDBText;
    rpRegionaisPdv2DBText11: TppDBText;
    rpRegionaisPdv2DBText12: TppDBText;
    ppFooterBand15: TppFooterBand;
    ppCalc27: TppSystemVariable;
    ppLine33: TppLine;
    ppLabel10: TppLabel;
    ppCalc28: TppSystemVariable;
    rpRegionaisPdv2SummaryBand1: TppSummaryBand;
    rpRegionaisPdv2Label10: TppLabel;
    rpRegionaisPdv2DBText13: TppDBText;
    rpRegionaisPdv2DBText14: TppDBText;
    rpRegionaisPdv2DBText15: TppDBText;
    rpRegionaisPdv2Line3: TppLine;
    ppRegionaisPdv: TppBDEPipeline;
    dsRegionaisPdv: TwwDataSource;
    qryRegionaisPdv: TwwQuery;
    rpRegionaisPdv: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppDBImage6: TppDBImage;
    ppDBText9: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppLabel32: TppLabel;
    ppDBText60: TppDBText;
    ppLabel70: TppLabel;
    ppLine32: TppLine;
    ppLine34: TppLine;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    rpRegionaisPdvLabel1: TppLabel;
    rpRegionaisPdvLabel2: TppLabel;
    rpRegionaisPdvLabel3: TppLabel;
    rpRegionaisPdvLabel4: TppLabel;
    rpRegionaisPdvLabel5: TppLabel;
    ppDetailBand16: TppDetailBand;
    ppDBText62: TppDBText;
    rpRegionaisPdvDBText1: TppDBText;
    rpRegionaisPdvDBText2: TppDBText;
    rpRegionaisPdvDBText3: TppDBText;
    rpRegionaisPdvDBText5: TppDBText;
    rpRegionaisPdvDBText4: TppDBText;
    ppFooterBand16: TppFooterBand;
    ppCalc29: TppSystemVariable;
    ppLine35: TppLine;
    ppLabel77: TppLabel;
    ppCalc30: TppSystemVariable;
    rpRegionaisPdvSummaryBand1: TppSummaryBand;
    rpRegionaisPdvLine1: TppLine;
    rpRegionaisPdvDBCalc1: TppDBCalc;
    rpRegionaisPdvDBCalc2: TppDBCalc;
    rpRegionaisPdvDBCalc3: TppDBCalc;
    rpRegionaisPdvDBCalc4: TppDBCalc;
    rpRegionaisPdvDBCalc5: TppDBCalc;
    ppLabel78: TppLabel;
    qryEncPIDPIA: TwwQuery;
    dsEncPIDPIA: TwwDataSource;
    ppEncPIDPIA: TppBDEPipeline;
    rpEncPIDPIA: TppReport;
    ppHeaderBand19: TppHeaderBand;
    TitRelat: TppLabel;
    rpEncPIDPIADBImage1: TppDBImage;
    rpEncPIDPIADBText1: TppDBText;
    rpEncPIDPIADBText2: TppDBText;
    rpEncPIDPIADBText3: TppDBText;
    rpEncPIDPIADBText4: TppDBText;
    rpEncPIDPIADBText5: TppDBText;
    rpEncPIDPIADBText6: TppDBText;
    rpEncPIDPIADBText7: TppDBText;
    rpEncPIDPIALabel1: TppLabel;
    rpEncPIDPIADBText8: TppDBText;
    ppDetailBand18: TppDetailBand;
    SalarioPIDPIA: TppLabel;
    rpEncPIDPIADBText15: TppDBText;
    rpEncPIDPIADBText13: TppDBText;
    rpEncPIDPIADBText14: TppDBText;
    nomePIDPIA: TppLabel;
    MatPIDPIA: TppLabel;
    ppFooterBand17: TppFooterBand;
    ppCalc31: TppSystemVariable;
    ppLine38: TppLine;
    ppLabel79: TppLabel;
    ppCalc33: TppSystemVariable;
    rpEncPIDPIAGroup1: TppGroup;
    rpEncPIDPIAGroupHeaderBand1: TppGroupHeaderBand;
    rpEncPIDPIADBText10: TppDBText;
    rpEncPIDPIALabel2: TppLabel;
    rpEncPIDPIALabel5: TppLabel;
    rpEncPIDPIALabel6: TppLabel;
    rpEncPIDPIALabel7: TppLabel;
    rpEncPIDPIADBText9: TppDBText;
    rpEncPIDPIALabel3: TppLabel;
    rpEncPIDPIALabel4: TppLabel;
    rpEncPIDPIALabel8: TppLabel;
    rpEncPIDPIALabel9: TppLabel;
    rpEncPIDPIALabel10: TppLabel;
    ppLine37: TppLine;
    rpEncPIDPIALine1: TppLine;
    rpEncPIDPIAGroupFooterBand1: TppGroupFooterBand;
    qryPartDeb: TwwQuery;
    dsPartDeb: TwwDataSource;
    ppPartDeb: TppBDEPipeline;
    rpPartDeb: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel80: TppLabel;
    ppLine36: TppLine;
    rpPartDebDBImage1: TppDBImage;
    rpPartDebDBText9: TppDBText;
    rpPartDebDBText12: TppDBText;
    rpPartDebDBText13: TppDBText;
    rpPartDebDBText14: TppDBText;
    rpPartDebLabel13: TppLabel;
    rpPartDebDBText15: TppDBText;
    rpPartDebDBText16: TppDBText;
    rpPartDebDBText17: TppDBText;
    rpPartDebDBText18: TppDBText;
    ppDetailBand17: TppDetailBand;
    rpPartDebDBText19: TppDBText;
    rpPartDeblblSalario: TppLabel;
    rpPartDebDBText20: TppDBText;
    rpPartDebDBText21: TppDBText;
    ppFooterBand18: TppFooterBand;
    ppLine39: TppLine;
    ppCalc32: TppSystemVariable;
    rpPartDebCalc2: TppSystemVariable;
    rpPartDebLabel7: TppLabel;
    rpPartDebCalc1: TppSystemVariable;
    rpPartDebGroup2: TppGroup;
    rpPartDebGroupHeaderBand2: TppGroupHeaderBand;
    rpPartDebLabel3: TppLabel;
    rpPartDebLabel4: TppLabel;
    Matricula: TppLabel;
    Nome: TppLabel;
    rpPartDebLabel8: TppLabel;
    rpPartDebLine1: TppLine;
    rpPartDebLabel9: TppLabel;
    rpPartDebLabel10: TppLabel;
    rpPartDebLabel11: TppLabel;
    rpPartDebDBText4: TppDBText;
    rpPartDebDBText3: TppDBText;
    rpPartDebLabel1: TppLabel;
    rpPartDebDBText1: TppDBText;
    rpPartDebLabel2: TppLabel;
    rpPartDebDBText2: TppDBText;
    rpPartDebGroupFooterBand2: TppGroupFooterBand;
    qryPartInscMes: TwwQuery;
    dsPartInscMes: TwwDataSource;
    ppPartInscMes: TppBDEPipeline;
    rpPartInscMes: TppReport;
    ppHeaderBand18: TppHeaderBand;
    ppLabel81: TppLabel;
    rpPartInscMesDBImage1: TppDBImage;
    rpPartInscMesDBText1: TppDBText;
    rpPartInscMesDBText2: TppDBText;
    rpPartInscMesDBText3: TppDBText;
    rpPartInscMesDBText4: TppDBText;
    rpPartInscMesLabel1: TppLabel;
    rpPartInscMesDBText5: TppDBText;
    rpPartInscMesDBText6: TppDBText;
    rpPartInscMesDBText7: TppDBText;
    rpPartInscMesDBText8: TppDBText;
    ppDetailBand19: TppDetailBand;
    rpPartInscMesLabel10: TppLabel;
    rpPartInscMesDBText17: TppDBText;
    rpPartInscMesDBText18: TppDBText;
    rpPartInscMesDBText19: TppDBText;
    rpPartInscMesDBText20: TppDBText;
    rpPartInscMesDBText21: TppDBText;
    rpPartInscMesDBText22: TppDBText;
    rpPartInscMesDBText16: TppDBText;
    ppFooterBand19: TppFooterBand;
    ppCalc34: TppSystemVariable;
    ppLine40: TppLine;
    ppLabel82: TppLabel;
    ppCalc35: TppSystemVariable;
    rpPartInscMesGroup1: TppGroup;
    rpPartInscMesGroupHeaderBand1: TppGroupHeaderBand;
    rpPartInscMesDBText9: TppDBText;
    rpPartInscMesDBText10: TppDBText;
    rpPartInscMesLabel2: TppLabel;
    rpPartInscMesLabel3: TppLabel;
    ppLine41: TppLine;
    rpPartInscMesLabel4: TppLabel;
    rpPartInscMesLabel5: TppLabel;
    rpPartInscMesLabel6: TppLabel;
    rpPartInscMesLabel8: TppLabel;
    rpPartInscMesLine1: TppLine;
    rpPartInscMesLabel7: TppLabel;
    rpPartInscMesLabel9: TppLabel;
    rpPartInscMesLabel11: TppLabel;
    mes: TppLabel;
    rpPartInscMesGroupFooterBand1: TppGroupFooterBand;
    rpPartInscMesGroup2: TppGroup;
    rpPartInscMesGroupHeaderBand2: TppGroupHeaderBand;
    rpPartInscMesDBText11: TppDBText;
    rpPartInscMesDBText12: TppDBText;
    rpPartInscMesDBText15: TppDBText;
    rpPartInscMesDBText14: TppDBText;
    rpPartInscMesDBText13: TppDBText;
    rpPartInscMesGroupFooterBand2: TppGroupFooterBand;
    qryRecPIDPIA: TwwQuery;
    dsRecPIDPIA: TwwDataSource;
    ppRecPIDPIA: TppBDEPipeline;
    rpRecPIDPIA: TppReport;
    ppHeaderBand20: TppHeaderBand;
    ppLabel83: TppLabel;
    rpRecPIDPIADBImage1: TppDBImage;
    rpRecPIDPIADBText1: TppDBText;
    rpRecPIDPIADBText2: TppDBText;
    rpRecPIDPIADBText3: TppDBText;
    rpRecPIDPIADBText4: TppDBText;
    rpRecPIDPIALabel1: TppLabel;
    rpRecPIDPIADBText5: TppDBText;
    rpRecPIDPIADBText6: TppDBText;
    rpRecPIDPIADBText7: TppDBText;
    rpRecPIDPIADBText8: TppDBText;
    rpRecPIDPIALine3: TppLine;
    ppDetailBand20: TppDetailBand;
    rpRecPIDPIADBText11: TppDBText;
    rpRecPIDPIADBText10: TppDBText;
    rpRecPIDPIADBText12: TppDBText;
    ppFooterBand20: TppFooterBand;
    ppCalc36: TppSystemVariable;
    ppLine42: TppLine;
    ppLabel84: TppLabel;
    ppCalc37: TppSystemVariable;
    rpRecPIDPIAGroup1: TppGroup;
    rpRecPIDPIAGroupHeaderBand1: TppGroupHeaderBand;
    rpRecPIDPIADBText14: TppDBText;
    rpRecPIDPIALabel7: TppLabel;
    lbmes: TppLabel;
    rpRecPIDPIALabel2: TppLabel;
    rpRecPIDPIALabel6: TppLabel;
    rpRecPIDPIALabel3: TppLabel;
    rpRecPIDPIALabel4: TppLabel;
    rpRecPIDPIALabel5: TppLabel;
    rpRecPIDPIALabel8: TppLabel;
    rpRecPIDPIALine2: TppLine;
    rpRecPIDPIAGroupFooterBand1: TppGroupFooterBand;
    qryResumoCobr: TwwQuery;
    dsResumoCobr: TwwDataSource;
    ppResumoCobr: TppBDEPipeline;
    rpResumoCobr: TppReport;
    ppHeaderBand3: TppHeaderBand;
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
    ppDetailBand3: TppDetailBand;
    rpResumoCobrDBText5: TppDBText;
    rpResumoCobrDBText6: TppDBText;
    rpResumoCobrDBText7: TppDBText;
    rpResumoCobrDBText8: TppDBText;
    rpDiferenca: TppLabel;
    rpResumoCobrDBText9: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppCalc3: TppSystemVariable;
    ppLine4: TppLine;
    ppLabel5: TppLabel;
    ppCalc4: TppSystemVariable;
    rpResumoCobrGroup2: TppGroup;
    rpResumoCobrGroupHeaderBand2: TppGroupHeaderBand;
    rpResumoCobrGroupFooterBand2: TppGroupFooterBand;
    rpResumoCobrGroup1: TppGroup;
    rpResumoCobrGroupHeaderBand1: TppGroupHeaderBand;
    rpResumoCobrLabel2: TppLabel;
    rpResumoCobrLabel9: TppLabel;
    rpResumoCobrLabel3: TppLabel;
    rpResumoCobrLabel4: TppLabel;
    rpResumoCobrLabel8: TppLabel;
    rpResumoCobrLabel5: TppLabel;
    rpResumoCobrLabel11: TppLabel;
    lblTotalSalPart: TppLabel;
    rpResumoCobrLabel12: TppLabel;
    rpResumoCobrDBText15: TppDBText;
    rpResumoCobrLine2: TppLine;
    rpResumoCobrLabel1: TppLabel;
    rpResumoCobrDBText4: TppDBText;
    rpResumoCobrLine5: TppLine;
    rpResumoCobrGroupFooterBand1: TppGroupFooterBand;
    rpResumoCobrLabel6: TppLabel;
    rpResumoCobrDBCalc2: TppDBCalc;
    rpEsperadoTot: TppDBCalc;
    rpRecebidoTot: TppDBCalc;
    rpResumoCobrLine3: TppLine;
    rpResumoCobrLine4: TppLine;
    rpResumoCobrGroup3: TppGroup;
    rpResumoCobrGroupHeaderBand3: TppGroupHeaderBand;
    rpResumoCobrGroupFooterBand3: TppGroupFooterBand;
    rpResumoCobrLabel7: TppLabel;
    rpResumoCobrDBCalc1: TppDBCalc;
    rpEsperadoSubTot: TppDBCalc;
    rpRecebidoSubTot: TppDBCalc;
    rpResumoCobrLine1: TppLine;
    rpDivergContrib: TppReport;
    rpDivergSubTitulo: TppTitleBand;
    lblTitDivergContrib: TppLabel;
    ppLine45: TppLine;
    ppDBImage7: TppDBImage;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppLabel89: TppLabel;
    ppDBText72: TppDBText;
    ppHeaderBand22: TppHeaderBand;
    ppDetailBand22: TppDetailBand;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText78: TppDBText;
    ppDBText114: TppDBText;
    ppFooterBand22: TppFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppDBText115: TppDBText;
    ppLabel94: TppLabel;
    ppLabel96: TppLabel;
    ppDBText129: TppDBText;
    ppLabel97: TppLabel;
    ppDBText130: TppDBText;
    ppLabel98: TppLabel;
    ppDBText131: TppDBText;
    ppLabel101: TppLabel;
    ppDBText134: TppDBText;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel131: TppLabel;
    ppLabel133: TppLabel;
    ppLabel135: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDivergContrib: TppBDEPipeline;
    dsDivergContrib: TwwDataSource;
    qryDivergContrib: TwwQuery;
    rpDivergContribCalc1: TppSystemVariable;
    rpDivergContribLine1: TppLine;
    rpDivergContribLabel1: TppLabel;
    rpDivergContribCalc2: TppSystemVariable;
    rpDivergContribSummaryBand1: TppSummaryBand;
    rpDivergContribSubResumo: TppSubReport;
    rpDivergContribChildReport1TitleBand1: TppTitleBand;
    rpDivergContribChildReport1DetailBand1: TppDetailBand;
    rpDivergContribChildReport1SummaryBand1: TppSummaryBand;
    lblQuadroResumido: TppLabel;
    ppDivergResumo: TppBDEPipeline;
    dsDivergResumo: TwwDataSource;
    qryDivergResumo: TwwQuery;
    rpDivergContribChildReport1Line1: TppLine;
    rpDivergContribChildReport1Line2: TppLine;
    rpDivergContribChildReport1Label2: TppLabel;
    rpDivergContribChildReport1Label3: TppLabel;
    rpDivergContribChildReport1Label4: TppLabel;
    rpDivergContribChildReport1Label5: TppLabel;
    rpDivergContribChildReport1Label6: TppLabel;
    rpDivergContribChildReport1DBText1: TppDBText;
    rpDivergContribChildReport1DBText2: TppDBText;
    rpDivergContribChildReport1DBText3: TppDBText;
    rpDivergContribChildReport1DBText4: TppDBText;
    rpDivergContribChildReport1DBText6: TppDBText;
    rpDivergContribChildReport1Line3: TppLine;
    rpDivergContribChildReport1Line4: TppLine;
    rpDivergContribChildReport1Line5: TppLine;
    rpDivergContribChildReport1Line6: TppLine;
    rpDivergContribChildReport1Line7: TppLine;
    ppBDEPpSuplAntecipada: TppBDEPipeline;
    ppRptSuplAntecipada: TppReport;
    ppRptSuplAntecipadaHeaderBand1: TppHeaderBand;
    ppRptSuplAntecipadaLabel1: TppLabel;
    ppRptSuplAntecipadaLabel2: TppLabel;
    ppRptSuplAntecipadaDBText1: TppDBText;
    ppRptSuplAntecipadaLine1: TppLine;
    ppRptSuplAntecipadaDetailBand1: TppDetailBand;
    ppRptSuplAntecipadaMemo1: TppMemo;
    ppRptSuplAntecipadaFooterBand1: TppFooterBand;
    ppRptSuplAntecipadaLabel3: TppLabel;
    ppRptSuplAntecipadaLabel4: TppLabel;
    ppRptSuplAntecipadaLabel5: TppLabel;
    ppRptSuplAntecipadaLabel6: TppLabel;
    ppRptSuplAntecipadaLabel7: TppLabel;
    qrysuplantecipada: TwwQuery;
    dssuplantecipada: TwwDataSource;
    rpDivergContribLabel2: TppLabel;
    rpDivergContribDBText1: TppDBText;
    rpDivergContribLabel3: TppLabel;
    rpDivergContribLabel4: TppLabel;
    rpDivergContribDBText2: TppDBText;
    rpDivergContribDBText3: TppDBText;
    rpDivergContribLabel6: TppLabel;
    rpDivergContribDBText5: TppDBText;
    rpDivergContribChildReport1Label8: TppLabel;
    rpDivergContribChildReport1DBText8: TppDBText;
    rpDivergContribChildReport1Line8: TppLine;
    ppSubRelReserva: TppSubReport;
    ppReserva: TppBDEPipeline;
    dsReserva: TwwDataSource;
    qryReserva: TwwQuery;
    ppRepRelBeneficiosChildReport1TitleBand1: TppTitleBand;
    ppRepRelBeneficiosChildReport1DetailBand1: TppDetailBand;
    ppRepRelBeneficiosChildReport1SummaryBand1: TppSummaryBand;
    ppRepRelBeneficiosChildReport1Label1: TppLabel;
    ppRepRelBeneficiosChildReport1Label2: TppLabel;
    ppRepRelBeneficiosChildReport1Label3: TppLabel;
    ppRepRelBeneficiosChildReport1Label4: TppLabel;
    ppRepRelBeneficiosChildReport1Label5: TppLabel;
    ppRepRelBeneficiosChildReport1Label6: TppLabel;
    ppRepRelBeneficiosChildReport1DBText1: TppDBText;
    ppRepRelBeneficiosChildReport1DBText2: TppDBText;
    ppRepRelBeneficiosChildReport1DBText3: TppDBText;
    ppRepRelBeneficiosChildReport1DBText4: TppDBText;
    ppRepRelBeneficiosChildReport1DBText5: TppDBText;
    ppRepRelBeneficiosChildReport1DBCalc1: TppDBCalc;
    ppRepRelBeneficiosChildReport1Label7: TppLabel;
    ppRepRelBeneficiosChildReport1Line1: TppLine;
    qryListaBeneficio: TwwQuery;
    dsListaBeneficio: TwwDataSource;
    ppListaBeneficio: TppBDEPipeline;
    rpListaBeneficio: TppReport;
    ppHeaderBand21: TppHeaderBand;
    lblListaBenefTitulo: TppLabel;
    rpListaBenefDetalhe: TppDetailBand;
    ppFooterBand21: TppFooterBand;
    ppCalc38: TppSystemVariable;
    ppLine44: TppLine;
    ppLabel87: TppLabel;
    ppCalc39: TppSystemVariable;
    rpListaBenefMesDBImage1: TppDBImage;
    rpListaBenefMesDBText1: TppDBText;
    rpListaBenefMesDBText2: TppDBText;
    rpListaBenefMesLabel1: TppLabel;
    rpListaBenefMesLabel2: TppLabel;
    rpListaBenefMesDBText3: TppDBText;
    rpListaBenefMesLabel3: TppLabel;
    rpListaBenefMesLabel4: TppLabel;
    rpListaBenefMesDBText4: TppDBText;
    rpListaBenefMesDBText5: TppDBText;
    lblListaBenefIndice: TppLabel;
    lblListaBenefPlano: TppLabel;
    lblListaBenefDataPrev: TppLabel;
    rpListaBenefMesLabel8: TppLabel;
    rpListaBenefMesLabel9: TppLabel;
    rpListaBenefMesLabel11: TppLabel;
    rpListaBenefMesLabel12: TppLabel;
    rpListaBenefMesLabel13: TppLabel;
    rpListaBenefMesLabel16: TppLabel;
    rpListaBenefMesLabel17: TppLabel;
    rpListaBenefMesLabel18: TppLabel;
    rpListaBenefMesLabel19: TppLabel;
    rpListaBenefMesLabel20: TppLabel;
    rpListaBenefMesLabel21: TppLabel;
    rpListaBenefMesLabel22: TppLabel;
    rpListaBenefMesLabel23: TppLabel;
    rpListaBenefMesLabel24: TppLabel;
    rpListaBenefMesLabel25: TppLabel;
    rpListaBenefMesLabel26: TppLabel;
    rpListaBenefMesLabel27: TppLabel;
    rpListaBenefMesLabel28: TppLabel;
    rpListaBenefMesLine1: TppLine;
    rpListaBenefMesLine2: TppLine;
    rpListaBenefMesLine3: TppLine;
    rpListaBenefMesDBText6: TppDBText;
    rpListaBenefMesDBText7: TppDBText;
    rpListaBenefMesDBText9: TppDBText;
    lblCotaDeslig: TppLabel;
    lblCota: TppLabel;
    lblResReal: TppLabel;
    rpListaBenefMesDBText8: TppDBText;
    lblEmp: TppLabel;
    lblContPrev: TppLabel;
    lblContAssist: TppLabel;
    lblBenefLiq: TppLabel;
    rpListaBenefMesLabel37: TppLabel;
    lblTotLiq: TppLabel;
    rpListaBenefCabecalho: TppGroupHeaderBand;
    rpListaBenefMesDBText10: TppDBText;
    rpListaBenefRodape: TppGroupFooterBand;
    qryMovBenef: TwwQuery;
    dsMovBenef: TwwDataSource;
    ppMovBenef: TppBDEPipeline;
    ppRelBenefSubLog: TppSubReport;
    ppRepRelBeneficiosChildReport2TitleBand1: TppTitleBand;
    ppRepRelBeneficiosChildReport2DetailBand1: TppDetailBand;
    ppRepRelBeneficiosChildReport2SummaryBand1: TppSummaryBand;
    ppRepRelBeneficiosChildReport2Line1: TppLine;
    ppRepRelBeneficiosChildReport2DBText1: TppDBText;
    ppRepRelBeneficiosChildReport2DBText2: TppDBText;
    ppRepRelBeneficiosChildReport2DBText3: TppDBText;
    ppRepRelBeneficiosChildReport2Label2: TppLabel;
    ppRepRelBeneficiosChildReport2Label3: TppLabel;
    ppRepRelBeneficiosChildReport2Label4: TppLabel;
    ppRepRelBeneficiosChildReport2Line3: TppLine;
    ppRepRelBeneficiosChildReport2Shape1: TppShape;
    ppRepRelBeneficiosChildReport2Label1: TppLabel;
    ppRepRelBeneficiosDBImage1: TppDBImage;
    ppRepRelBeneficiosDBText2: TppDBText;
    ppRepRelBeneficiosDBText3: TppDBText;
    ppRepRelBeneficiosDBText4: TppDBText;
    ppRepRelBeneficiosDBText5: TppDBText;
    ppRepRelBeneficiosLabel2: TppLabel;
    ppRepRelBeneficiosDBText6: TppDBText;
    ppRepRelBeneficiosDBText7: TppDBText;
    ppRepRelBeneficiosDBText8: TppDBText;
    ppRepRelBeneficiosDBText9: TppDBText;
    rpHstContribReg: TppReport;
    ppTitleBand2: TppTitleBand;
    ppLabel85: TppLabel;
    ppLine43: TppLine;
    ppDBImage8: TppDBImage;
    ppDBText77: TppDBText;
    ppDBText125: TppDBText;
    ppDBText135: TppDBText;
    ppDBText136: TppDBText;
    ppDBText137: TppDBText;
    ppDBText138: TppDBText;
    ppDBText139: TppDBText;
    ppLabel86: TppLabel;
    ppDBText140: TppDBText;
    ppHeaderBand23: TppHeaderBand;
    rpHstContribRegLabel1: TppLabel;
    rpHstContribRegLabel2: TppLabel;
    rpHstContribRegLabel4: TppLabel;
    rpHstContribRegLabel5: TppLabel;
    rpHstContribRegLabel6: TppLabel;
    rpHstContribRegLabel7: TppLabel;
    rpHstContribRegLabel8: TppLabel;
    rpHstContribRegLabel10: TppLabel;
    rpHstContribRegLabel3: TppLabel;
    rpHstContribRegLabel9: TppLabel;
    ppDetailBand21: TppDetailBand;
    rpHstContribRegDBText2: TppDBText;
    rpHstContribRegDBText3: TppDBText;
    rpHstContribRegDBText4: TppDBText;
    rpHstContribRegDBText5: TppDBText;
    rpHstContribRegDBText6: TppDBText;
    rpHstContribRegDBText7: TppDBText;
    rpHstContribRegDBText1: TppDBText;
    rpHstContribRegDBText8: TppDBText;
    rpHstContribRegDBText9: TppDBText;
    ppFooterBand23: TppFooterBand;
    ppCalc40: TppSystemVariable;
    ppLine46: TppLine;
    ppLabel88: TppLabel;
    ppCalc41: TppSystemVariable;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    rpHstContribRegLabel11: TppLabel;
    rpHstContribRegDBText10: TppDBText;
    ppGroupFooterBand6: TppGroupFooterBand;
    rpHstContribRegGroup1: TppGroup;
    rpHstContribRegGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText149: TppDBText;
    rpHstContribRegGroupFooterBand1: TppGroupFooterBand;
    ppHstContribReg: TppBDEPipeline;
    dsHstContribReg: TwwDataSource;
    qryHstContribReg: TwwQuery;
    qryHstContribRegSin: TwwQuery;
    ppHstContribRegSin: TppBDEPipeline;
    dsHstContribRegSin: TwwDataSource;
    rpHstContribRegSin: TppReport;
    ppTitleBand4: TppTitleBand;
    ppLabel147: TppLabel;
    ppLine51: TppLine;
    ppDBImage10: TppDBImage;
    ppDBText160: TppDBText;
    ppDBText161: TppDBText;
    ppDBText162: TppDBText;
    ppDBText163: TppDBText;
    ppDBText164: TppDBText;
    ppDBText165: TppDBText;
    ppDBText166: TppDBText;
    ppLabel148: TppLabel;
    ppDBText167: TppDBText;
    ppHeaderBand24: TppHeaderBand;
    ppLabel149: TppLabel;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    ppLabel152: TppLabel;
    ppLabel153: TppLabel;
    ppLabel154: TppLabel;
    ppLabel155: TppLabel;
    ppLabel156: TppLabel;
    ppLabel157: TppLabel;
    ppLabel158: TppLabel;
    ppDetailBand24: TppDetailBand;
    ppFooterBand24: TppFooterBand;
    ppCalc42: TppSystemVariable;
    ppLine52: TppLine;
    ppLabel162: TppLabel;
    ppCalc43: TppSystemVariable;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppLabel163: TppLabel;
    ppDBText177: TppDBText;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppDBText178: TppDBText;
    ppGroupFooterBand10: TppGroupFooterBand;
    rpHstContribRegSinGroup1: TppGroup;
    rpHstContribRegSinGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText168: TppDBText;
    ppDBText169: TppDBText;
    ppDBText170: TppDBText;
    ppDBText173: TppDBText;
    ppDBText174: TppDBText;
    ppDBText175: TppDBText;
    rpHstContribRegSinDBText1: TppDBText;
    rpHstContribRegSinDBText3: TppDBText;
    rpHstContribRegSinDBText2: TppDBText;
    rpHstContribRegSinGroupFooterBand1: TppGroupFooterBand;
    qryCartaInadimpl: TwwQuery;
    dsCartaInadimpl: TwwDataSource;
    ppCartaInadimpl: TppBDEPipeline;
    rpCartaInadimpl: TppReport;
    ppHeaderBand26: TppHeaderBand;
    ppLabel93: TppLabel;
    ppLine53: TppLine;
    ppDetailBand25: TppDetailBand;
    ppFooterBand26: TppFooterBand;
    ppCalc46: TppSystemVariable;
    ppLine54: TppLine;
    ppLabel129: TppLabel;
    ppCalc47: TppSystemVariable;
    rpCartaInadimplDBImage1: TppDBImage;
    rpCartaInadimplLabel1: TppLabel;
    rpCartaInadimplDBText1: TppDBText;
    rpCartaInadimplDBText2: TppDBText;
    rpCartaInadimplDBText3: TppDBText;
    rpCartaInadimplDBText4: TppDBText;
    rpCartaInadimplDBText5: TppDBText;
    rpCartaInadimplDBText6: TppDBText;
    rpCartaInadimplDBText7: TppDBText;
    rpCartaInadimplDBText8: TppDBText;
    rpCartaInadimplLabel2: TppLabel;
    rpCartaInadimplDBText9: TppDBText;
    rpCartaInadimplLabel3: TppLabel;
    rpCartaInadimplDBText10: TppDBText;
    rpCartaInadimplLabel4: TppLabel;
    rpCartaInadimplDBText11: TppDBText;
    rpCartaInadimplLabel5: TppLabel;
    rpCartaInadimplDBText12: TppDBText;
    rpCartaInadimplLabel6: TppLabel;
    rpCartaInadimplDBText13: TppDBText;
    rpCartaInadimplLabel7: TppLabel;
    rpCartaInadimplLabel8: TppLabel;
    rpCartaInadimplLabel9: TppLabel;
    rpCartaInadimplLblData: TppLabel;
    rpCartaInadimplLabel11: TppLabel;
    rpCartaInadimplDBText15: TppDBText;
    rpDiferencaSubTot: TppLabel;
    rpDiferencaTot: TppLabel;
    rpRecPIDPIADBText9: TppDBText;
    rpRecPIDPIADBText13: TppDBText;
    rptRecadastramentoDBImage1: TppDBImage;
    rptRecadastramentoDBText1: TppDBText;
    rptRecadastramentoDBText2: TppDBText;
    rptRecadastramentoDBText3: TppDBText;
    rptRecadastramentoDBText4: TppDBText;
    rptRecadastramentoDBText5: TppDBText;
    rptRecadastramentoDBText6: TppDBText;
    rptRecadastramentoDBText7: TppDBText;
    rptRecadastramentoLabel1: TppLabel;
    rptRecadastramentoDBText8: TppDBText;
    qryRecadastramentoNUMPROCINSS: TStringField;
    qryRecadastramentoIDPESSOA: TFloatField;
    qryRecadastramentoNUMCARTARECAD: TStringField;
    qryRecadastramentoDATAEMISSAORECAD: TDateTimeField;
    qryRecadastramentoDATALIMITERECAD: TDateTimeField;
    qryRecadastramentoDATARECEBRECAD: TDateTimeField;
    qryRecadastramentoFLGSTATUS: TStringField;
    qryRecadastramentoBANCOINSS: TStringField;
    qryRecadastramentoMESRECIBOINSS: TFloatField;
    qryRecadastramentoANORECIBOINSS: TFloatField;
    qryRecadastramentoBENEFICIO: TStringField;
    qryRecadastramentoNOME: TStringField;
    qryRecadastramentoCPF: TStringField;
    qryRecadastramentoMATRICULA: TStringField;
    rpDemonsCalcBenefSalarios: TppSubReport;
    rpDemonsCalcBenefChildReport3: TppChildReport;
    rpDemonsCalcBenefChildReport3HeaderBand1: TppHeaderBand;
    rpDemonsCalcBenefChildReport3DetailBand1: TppDetailBand;
    rpDemonsCalcBenefChildReport3DBText1: TppDBText;
    rpDemonsCalcBenefChildReport3DBText2: TppDBText;
    rpDemonsCalcBenefChildReport3DBText3: TppDBText;
    rpDemonsCalcBenefChildReport3DBText4: TppDBText;
    rpDemonsCalcBenefChildReport3DBText5: TppDBText;
    rpDemonsCalcBenefChildReport3DBText6: TppDBText;
    rpDemonsCalcBenefChildReport3DBText7: TppDBText;
    rpDemonsCalcBenefChildReport3DBText8: TppDBText;
    rpDemonsCalcBenefChildReport3Group1: TppGroup;
    rpDemonsCalcBenefChildReport3GroupHeaderBand1: TppGroupHeaderBand;
    rpDemonsCalcBenefLabel27: TppLabel;
    rpDemonsCalcBenefLabel29: TppLabel;
    rpDemonsCalcBenefLabel28: TppLabel;
    rpDemonsCalcBenefLabel30: TppLabel;
    rpDemonsCalcBenefLabel31: TppLabel;
    rpDemonsCalcBenefLabel40: TppLabel;
    rpDemonsCalcBenefDBText40: TppDBText;
    rpDemonsCalcBenefLabel32: TppLabel;
    rpDemonsCalcBenefLabel33: TppLabel;
    rpDemonsCalcBenefLabel34: TppLabel;
    rpDemonsCalcBenefLabel35: TppLabel;
    rpDemonsCalcBenefLabel36: TppLabel;
    rpDemonsCalcBenefLabel37: TppLabel;
    rpDemonsCalcBenefLabel38: TppLabel;
    rpDemonsCalcBenefLabel39: TppLabel;
    rpDemonsCalcBenefChildReport3Line3: TppLine;
    rpDemonsCalcBenefChildReport3Label3: TppLabel;
    rpDemonsCalcBenefChildReport3GroupFooterBand1: TppGroupFooterBand;
    rpDemonsCalcBenefChildReport3Label1: TppLabel;
    rpDemonsCalcBenefChildReport3Line1: TppLine;
    rpDemonsCalcBenefChildReport3Line2: TppLine;
    rpDemonsCalcBenefChildReport3DBCalc1: TppDBCalc;
    rpDemonsCalcBenefChildReport3DBCalc2: TppDBCalc;
    rpDemonsCalcBenefChildReport3DBCalc3: TppDBCalc;
    rpDemonsCalcBenefChildReport3Label2: TppLabel;
    rpDemonsCalcBenefChildReport3DBCalc4: TppDBCalc;
    rpDemonsCalcBenefChildReport3DBCalc5: TppDBCalc;
    rpDemonsCalcBenefChildReport3DBCalc6: TppDBCalc;
    rpDemonsCalcBenefChildReport3DBCalc7: TppDBCalc;
    rpDemonsCalcBenefChildReport3Label4: TppLabel;
    rpDemonsCalcBenefChildReport3Label5: TppLabel;
    rpDemonsCalcBenefChildReport3DBCalc8: TppDBCalc;
    ppRepRelBeneficiosDBText10: TppDBText;
    rpCartaInadimplLabel10: TppLabel;
    rpCartaInadimplLine1: TppLine;
    rpCartaInadimplLabel12: TppLabel;
    qryCancelInadimpl: TwwQuery;
    dsCancelInadimpl: TwwDataSource;
    ppCancelInadimpl: TppBDEPipeline;
    rpCancelInadimpl: TppReport;
    ppHeaderBand27: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLine55: TppLine;
    ppDBImage5: TppDBImage;
    ppLabel15: TppLabel;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText141: TppDBText;
    ppDBText142: TppDBText;
    ppDBText143: TppDBText;
    ppDBText144: TppDBText;
    ppDBText145: TppDBText;
    ppDetailBand26: TppDetailBand;
    ppLabel128: TppLabel;
    ppDBText146: TppDBText;
    ppLabel136: TppLabel;
    ppDBText147: TppDBText;
    ppLabel138: TppLabel;
    ppDBText148: TppDBText;
    ppLabel139: TppLabel;
    ppDBText150: TppDBText;
    ppLabel140: TppLabel;
    ppDBText151: TppDBText;
    ppLabel141: TppLabel;
    ppLabel142: TppLabel;
    ppLabel143: TppLabel;
    ppCancelInadimpllblData: TppLabel;
    ppLabel145: TppLabel;
    ppDBText152: TppDBText;
    ppLine56: TppLine;
    ppLabel164: TppLabel;
    ppFooterBand27: TppFooterBand;
    ppCalc48: TppSystemVariable;
    ppLine57: TppLine;
    ppLabel165: TppLabel;
    ppCalc49: TppSystemVariable;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    rpCancelInadimplLabel1: TppLabel;
    qryPdvGeralNIVEL: TStringField;
    rpRegionaisPdvDBText6: TppDBText;
    rpPartInscMesLabel12: TppLabel;
    rpPartInscMesDBText23: TppDBText;
    rpPartInscMesLabel13: TppLabel;
    rpPartInscMesDBText24: TppDBText;
    rpPartInscMesLabel14: TppLabel;
    rpPartInscMesDBText25: TppDBText;
    rpPartInscMesLabel15: TppLabel;
    rpPartInscMesDBText26: TppDBText;
    rpPartInscMesDBText27: TppDBText;
    rpPartDebDBText5: TppDBText;
    rpPartDebDBText6: TppDBText;
    rpPartDebLabel6: TppLabel;
    rpPartDebDBCalc1: TppDBCalc;
    rpPartDebLine2: TppLine;
    qryPdvGeralNOMEPARTICIP: TStringField;
    qryPdvGeralEVENTOGERADOR: TStringField;
    rpPdvGeralDBText5: TppDBText;
    rpPdvGeralLabel12: TppLabel;
    rpPdvGeralLine1: TppLine;
    dsCAlter: TwwDataSource;
    rpCAlter: TppReport;
    rpCAlterHeaderBand1: TppHeaderBand;
    rpCAlterDBImage1: TppDBImage;
    rpCAlterDBText1: TppDBText;
    rpCAlterDBText2: TppDBText;
    rpCAlterDBText3: TppDBText;
    rpCAlterDBText6: TppDBText;
    rpCAlterLabel1: TppLabel;
    rpCAlterDBText7: TppDBText;
    rpCAlterDBText8: TppDBText;
    rpCAlterDBText11: TppDBText;
    rpCAlterDBText12: TppDBText;
    rpCAlterLabel2: TppLabel;
    rpCAlterLabel12: TppLabel;
    rpCAlterlbldtInicial: TppLabel;
    rpCAlterLabel13: TppLabel;
    rpCAlterlbldtFinal: TppLabel;
    ppDetailBand27: TppDetailBand;
    rpCAlterlblCampo: TppLabel;
    rpCAlterlblVlrAnterior: TppLabel;
    rpCAlterlblVlrAtual: TppLabel;
    rpCAlterDBText10: TppDBText;
    rpCAlterDBText5: TppDBText;
    rpCAlterDBText9: TppDBText;
    ppFooterBand28: TppFooterBand;
    ppCalc50: TppSystemVariable;
    ppLine58: TppLine;
    ppLabel71: TppLabel;
    ppCalc51: TppSystemVariable;
    rpCAlterGroup1: TppGroup;
    rpCAlterGroupHeaderBand1: TppGroupHeaderBand;
    rpCAlterLabel3: TppLabel;
    rpCAlterLabel4: TppLabel;
    rpCAlterLabel5: TppLabel;
    rpCAlterLabel7: TppLabel;
    rpCAlterLabel8: TppLabel;
    rpCAlterLabel9: TppLabel;
    rpCAlterLabel10: TppLabel;
    rpCAlterLabel11: TppLabel;
    rpCAlterLine2: TppLine;
    rpCAlterLabel15: TppLabel;
    rpCAlterDBText4: TppDBText;
    rpCAlterGroupFooterBand1: TppGroupFooterBand;
    rpCAlterGroup2: TppGroup;
    rpCAlterGroupHeaderBand2: TppGroupHeaderBand;
    rpCAlterDBText13: TppDBText;
    rpCAlterDBText14: TppDBText;
    rpCAlterGroupFooterBand2: TppGroupFooterBand;
    ppCAlter: TppBDEPipeline;
    qryCAlter: TwwQuery;
    rpHstContrib: TppReport;
    rpHstContribTitleBand1: TppTitleBand;
    ppLabel24: TppLabel;
    ppLine18: TppLine;
    rpHstContribDBImage1: TppDBImage;
    rpHstContribDBText1: TppDBText;
    rpHstContribDBText2: TppDBText;
    rpHstContribDBText3: TppDBText;
    rpHstContribDBText21: TppDBText;
    rpHstContribDBText22: TppDBText;
    rpHstContribDBText23: TppDBText;
    rpHstContribDBText24: TppDBText;
    rpHstContribLabel1: TppLabel;
    rpHstContribDBText25: TppDBText;
    ppHeaderBand12: TppHeaderBand;
    ppDetailBand12: TppDetailBand;
    rpHstContribDBText6: TppDBText;
    rpHstContribDBText14: TppDBText;
    rpHstContribDBText15: TppDBText;
    rpHstContribDBText17: TppDBText;
    rpHstContribDBText18: TppDBText;
    rpHstContribDBText19: TppDBText;
    rpHstContribDBText20: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppCalc17: TppSystemVariable;
    ppLine22: TppLine;
    ppLabel25: TppLabel;
    ppCalc18: TppSystemVariable;
    rpHstContribGroup1: TppGroup;
    rpHstContribGroupHeaderBand1: TppGroupHeaderBand;
    rpHstContribDBText4: TppDBText;
    rpHstContribLabel3: TppLabel;
    rpHstContribLabel4: TppLabel;
    rpHstContribDBText7: TppDBText;
    rpHstContribLabel5: TppLabel;
    rpHstContribDBText8: TppDBText;
    rpHstContribLabel6: TppLabel;
    rpHstContribDBText9: TppDBText;
    rpHstContribLabel7: TppLabel;
    rpHstContribDBText10: TppDBText;
    rpHstContribLabel8: TppLabel;
    rpHstContribDBText11: TppDBText;
    rpHstContribLabel9: TppLabel;
    rpHstContribDBText12: TppDBText;
    rpHstContribLabel10: TppLabel;
    rpHstContribDBText13: TppDBText;
    rpHstContribLabel12: TppLabel;
    rpHstContribLabel13: TppLabel;
    rpHstContribLabel14: TppLabel;
    rpHstContribLabel17: TppLabel;
    rpHstContribLabel18: TppLabel;
    rpHstContribLabel16: TppLabel;
    rpHstContribLine1: TppLine;
    rpHstContribLine2: TppLine;
    rpHstContribLabel19: TppLabel;
    rpHstContribGroupFooterBand1: TppGroupFooterBand;
    rpHstContribGroup2: TppGroup;
    rpHstContribGroupHeaderBand2: TppGroupHeaderBand;
    rpHstContriblblSalario: TppLabel;
    rpHstContribDBText5: TppDBText;
    rpHstContribLabel11: TppLabel;
    rpHstContribLabel20: TppLabel;
    rpHstContribGroupFooterBand2: TppGroupFooterBand;
    rpHstContribLine3: TppLine;
    rpHstContribLabel2: TppLabel;
    rpHstContribDBCalc1: TppDBCalc;
    rpHstContribDBCalc2: TppDBCalc;
    ppHstContrib: TppBDEPipeline;
    dsHstContrib: TwwDataSource;
    qryHstContrib: TwwQuery;
    rpDemonsCalcBenefShape1: TppShape;
    rpDemonsCalcBenefLabel43: TppLabel;
    rpDemonsCalcBenefShape2: TppShape;
    rpDemonsCalcBenefLabel44: TppLabel;
    rpDemonsCalcBenefShape3: TppShape;
    rpDemonsCalcBenefShape4: TppShape;
    rpDemonsCalcBenefLabel45: TppLabel;
    rpDemonsCalcBenefLabel46: TppLabel;
    rpDemonsCalcBenefShape5: TppShape;
    rpDemonsCalcBenefShape6: TppShape;
    rpDemonsCalcBenefLabel47: TppLabel;
    rpDemonsCalcBenefLabel48: TppLabel;
    lblDivergSalario: TppLabel;
    rpDivergContribLine2: TppLine;
    rpDivergContribDBCalc1: TppDBCalc;
    rpDivergContribDBCalc2: TppDBCalc;
    rpDivergContribLine3: TppLine;
    rpDivergContribLabel5: TppLabel;
    rpDemonsCalcBenefLine2: TppLine;
    rpDemonsCalcBenefDBText28: TppDBText;
    rpDemonsCalcBenefLabel13: TppLabel;
    rpDemonsCalcBenefLabel14: TppLabel;
    rpDemonsCalcBenefDBText30: TppDBText;
    rpDemonsCalcBenefDBText32: TppDBText;
    rpDemonsCalcBenefDBText44: TppDBText;
    rpDemonsCalcBenefLabel12: TppLabel;
    rpDemonsCalcBeneflblOpcoesBenef: TppLabel;
    rpRecPIDPIALabel9: TppLabel;
    rpRecPIDPIADBText15: TppDBText;
    rpRecPIDPIALabel10: TppLabel;
    rpRecPIDPIADBCalc1: TppDBCalc;
    rpRecPIDPIALabel11: TppLabel;
    rpRecPIDPIADBCalc2: TppDBCalc;
    pplDivergFinanINSS: TppBDEPipeline;
    dsDivergFinanINSS: TwwDataSource;
    qryDivergFinanINSS: TwwQuery;
    rpDivergFinanINSS: TppReport;
    ppHeaderBand28: TppHeaderBand;
    ppLabel99: TppLabel;
    lblTitRelatorio: TppLabel;
    rpDivergFinanINSSLabel1: TppLabel;
    rpDivergFinanINSSLabel2: TppLabel;
    rpDivergFinanINSSLabel3: TppLabel;
    rpDivergFinanINSSLabel4: TppLabel;
    rpDivergFinanINSSLabel5: TppLabel;
    rpDivergFinanINSSLabel6: TppLabel;
    ppLine47: TppLine;
    rpDivergFinanINSSDBText7: TppDBText;
    rpDivergFinanINSSLabel7: TppLabel;
    rpDivergFinanINSSDBText8: TppDBText;
    ppDetailBand28: TppDetailBand;
    rpDivergFinanINSSDBText2: TppDBText;
    rpDivergFinanINSSDBText1: TppDBText;
    rpDivergFinanINSSDBText3: TppDBText;
    rpDivergFinanINSSDBText4: TppDBText;
    rpDivergFinanINSSDBText5: TppDBText;
    rpDivergFinanINSSDBText6: TppDBText;
    ppFooterBand29: TppFooterBand;
    ppCalc52: TppSystemVariable;
    ppLine48: TppLine;
    ppLabel132: TppLabel;
    ppCalc53: TppSystemVariable;
    rpDemonsCalcBenefChildReport4Line1: TppLine;
    ppLabel38: TppLabel;
    rpDemonsCalcBenefDependentes: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand15: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel39: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
    ppDBText13: TppDBText;
    ppDBText16: TppDBText;
    rpDemonsCalcBenefReserva: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppDetailBand30: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppDBText17: TppDBText;
    ppLabel52: TppLabel;
    ppDBText20: TppDBText;
    ppLabel53: TppLabel;
    ppLine49: TppLine;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppDBText21: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppCert: TppBDEPipeline;
    ppCertppField1: TppField;
    ppCertppField2: TppField;
    ppCertppField3: TppField;
    ppCertppField4: TppField;
    ppCertppField5: TppField;
    ppCertppField6: TppField;
    ppCertppField7: TppField;
    ppCertppField8: TppField;
    ppCertppField9: TppField;
    ppCertppField10: TppField;
    ppCertppField11: TppField;
    ppCertppField12: TppField;
    ppCertppField13: TppField;
    ppCertppField14: TppField;
    ppCertppField15: TppField;
    ppCertppField16: TppField;
    ppCertppField17: TppField;
    ppCertppField18: TppField;
    ppCertppField19: TppField;
    ppCertppField20: TppField;
    ppCertppField21: TppField;
    ppCertppField22: TppField;
    ppCertppField23: TppField;
    ppCertppField24: TppField;
    dsCert: TwwDataSource;
    qryCert: TwwQuery;
    qryCertINSCRICAONUMERO1: TStringField;
    qryCertDIAINSC1: TStringField;
    qryCertMESINSC1: TStringField;
    qryCertANOINSC1: TStringField;
    qryCertNOME1: TStringField;
    qryCertPLANO1: TStringField;
    qryCertINSCRICAONUMERO2: TStringField;
    qryCertDIAINSC2: TStringField;
    qryCertMESINSC2: TStringField;
    qryCertANOINSC2: TStringField;
    qryCertNOME2: TStringField;
    qryCertPLANO2: TStringField;
    qryCertINSCRICAONUMERO3: TStringField;
    qryCertDIAINSC3: TStringField;
    qryCertMESINSC3: TStringField;
    qryCertANOINSC3: TStringField;
    qryCertNOME3: TStringField;
    qryCertPLANO3: TStringField;
    qryCertINSCRICAONUMERO4: TStringField;
    qryCertDIAINSC4: TStringField;
    qryCertMESINSC4: TStringField;
    qryCertANOINSC4: TStringField;
    qryCertNOME4: TStringField;
    qryCertPLANO4: TStringField;
    rpCert: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppDetailBand13: TppDetailBand;
    ppDBText26: TppDBText;
    ppLabel51: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel64: TppLabel;
    ppDBText28: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppLabel69: TppLabel;
    ppLabel95: TppLabel;
    ppLabel100: TppLabel;
    ppLabel134: TppLabel;
    ppDBText42: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppLabel137: TppLabel;
    ppLabel144: TppLabel;
    ppLabel146: TppLabel;
    ppLabel166: TppLabel;
    ppDBText76: TppDBText;
    ppDBText104: TppDBText;
    ppDBText132: TppDBText;
    ppDBText133: TppDBText;
    ppDBText153: TppDBText;
    ppLabel167: TppLabel;
    ppDBText154: TppDBText;
    ppLabel169: TppLabel;
    ppDBText156: TppDBText;
    ppLabel170: TppLabel;
    ppDBText157: TppDBText;
    ppLabel171: TppLabel;
    ppDBCalc4: TppDBCalc;
    rpResumoEsperadoPatro: TppDBCalc;
    rpResumoRecebidoPatro: TppDBCalc;
    rpDiferencaTotPatro: TppLabel;
    ppLabel172: TppLabel;
    ppLabel173: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppSummaryBand2: TppSummaryBand;
    ppShape2: TppShape;
    ppLabel174: TppLabel;
    ppDBText158: TppDBText;
    DsgnCM: TppDesigner;
    ppDBText159: TppDBText;
    ppLabel176: TppLabel;
    ppDBCalc8: TppDBCalc;
    qryBoletas: TwwQuery;
    dsBoletas: TwwDataSource;
    ppBoletas: TppBDEPipeline;
    ppBoletasppField1: TppField;
    ppBoletasppField2: TppField;
    ppBoletasppField3: TppField;
    ppBoletasppField4: TppField;
    ppBoletasppField5: TppField;
    ppBoletasppField6: TppField;
    ppBoletasppField7: TppField;
    ppBoletasppField8: TppField;
    ppBoletasppField9: TppField;
    ppBoletasppField10: TppField;
    ppBoletasppField11: TppField;
    ppBoletasppField12: TppField;
    ppBoletasppField13: TppField;
    ppBoletasppField14: TppField;
    ppBoletasppField15: TppField;
    ppBoletasppField16: TppField;
    ppBoletasppField17: TppField;
    ppBoletasppField18: TppField;
    ppBoletasppField19: TppField;
    ppBoletasppField20: TppField;
    ppBoletasppField21: TppField;
    ppBoletasppField22: TppField;
    ppBoletasppField23: TppField;
    ppBoletasppField24: TppField;
    ppBoletasppField25: TppField;
    ppBoletasppField26: TppField;
    ppBoletasppField27: TppField;
    ppBoletasppField28: TppField;
    ppBoletasppField29: TppField;
    ppBoletasppField30: TppField;
    ppBoletasppField31: TppField;
    ppBoletasppField32: TppField;
    ppBoletasppField33: TppField;
    ppBoletasppField34: TppField;
    ppBoletasppField35: TppField;
    ppBoletasppField36: TppField;
    ppBoletasppField37: TppField;
    ppBoletasppField38: TppField;
    ppBoletasppField39: TppField;
    ppBoletasppField40: TppField;
    ppBoletasppField41: TppField;
    ppBoletasppField42: TppField;
    ppBoletasppField43: TppField;
    ppBoletasppField44: TppField;
    ppBoletasppField45: TppField;
    rpBoletas: TppReport;
    ppHeaderBand5: TppHeaderBand;
    pplblRelBoletasTitulo: TppLabel;
    ppLine6: TppLine;
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
    ppDetailBand5: TppDetailBand;
    rpBoletasDBText6: TppDBText;
    rpBoletasDBText7: TppDBText;
    rpBoletasDBText8: TppDBText;
    rpBoletasDBText11: TppDBText;
    rpBoletasDBText12: TppDBText;
    rpBoletasDBText13: TppDBText;
    rpBoletasDBText29: TppDBText;
    rpBoletasDBText30: TppDBText;
    rpBoletasDBText14: TppDBText;
    rpBoletasDBText15: TppDBText;
    rpBoletasDBText10: TppDBText;
    rpBoletasDBText18: TppDBText;
    rpBoletasDBText19: TppDBText;
    rpBoletasDBText40: TppDBText;
    rpBoletasDBText9: TppDBText;
    ppDBText155: TppDBText;
    LbSalaMesRef: TppLabel;
    LbPlanilha: TppLabel;
    ppFooterBand5: TppFooterBand;
    ppLine7: TppLine;
    ppLabel8: TppLabel;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    rpBoletasGroup3: TppGroup;
    rpBoletasGroupHeaderBand3: TppGroupHeaderBand;
    rpBoletasLabel4: TppLabel;
    rpBoletasDBText16: TppDBText;
    rpBoletasLabel28: TppLabel;
    rpBoletasDBText37: TppDBText;
    rpBoletasGroupFooterBand3: TppGroupFooterBand;
    rpBoletasShape1: TppShape;
    rpBoletasLabel25: TppLabel;
    rpBoletasLabel26: TppLabel;
    rpBoletasLabel27: TppLabel;
    rpBoletasDBCalc3: TppDBCalc;
    rpBoletasDBCalc5: TppDBCalc;
    ppLabel177: TppLabel;
    pplTotalSalRefPatro: TppLabel;
    ppGroup12: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    rpBoletasLabel5: TppLabel;
    rpBoletasDBText17: TppDBText;
    ppGroupFooterBand12: TppGroupFooterBand;
    pplTotalSalRef: TppLabel;
    rpBoletasGroup1: TppGroup;
    rpBoletasGroupHeaderBand1: TppGroupHeaderBand;
    rpBoletasLabel2: TppLabel;
    rpBoletasLabel3: TppLabel;
    rpBoletasDBText4: TppDBText;
    rpBoletasDBText5: TppDBText;
    rpBoletasLine1: TppLine;
    rpBoletasDBText20: TppDBText;
    rpBoletasDBText21: TppDBText;
    rpBoletasDBText22: TppDBText;
    rpBoletasDBText23: TppDBText;
    rpBoletasDBText24: TppDBText;
    rpBoletasDBText25: TppDBText;
    rpBoletasLabel19: TppLabel;
    rpBoletasLabel20: TppLabel;
    rpBoletasLabel21: TppLabel;
    rpBoletasDBText26: TppDBText;
    rpBoletasDBText27: TppDBText;
    rpBoletasDBText28: TppDBText;
    rpBoletasLabel29: TppLabel;
    rpBoletasDBText38: TppDBText;
    rpBoletasLabel30: TppLabel;
    rpBoletasDBText39: TppDBText;
    rpBoletasLine6: TppLine;
    rpBoletasLabel6: TppLabel;
    rpBoletasLabel7: TppLabel;
    rpBoletasLabel8: TppLabel;
    rpBoletasLabel9: TppLabel;
    rpBoletasLabel10: TppLabel;
    rpBoletasLabel11: TppLabel;
    rpBoletasLabel13: TppLabel;
    rpBoletasLabel17: TppLabel;
    rpBoletasLabel22: TppLabel;
    rpBoletasLabel23: TppLabel;
    rpBoletasLabel14: TppLabel;
    rpBoletasLine5: TppLine;
    rpBoletasLabel1: TppLabel;
    rpBoletasDBText3: TppDBText;
    rplblSalario: TppLabel;
    rpBoletasLabel15: TppLabel;
    rpBoletasLabel18: TppLabel;
    rpBoletasLabel12: TppLabel;
    rpBoletasLabel31: TppLabel;
    rpBoletasLabel32: TppLabel;
    ppLabel168: TppLabel;
    ppLabel175: TppLabel;
    rpBoletasGroupFooterBand1: TppGroupFooterBand;
    rpBoletasLabel16: TppLabel;
    rpBoletasDBCalc1: TppDBCalc;
    rpBoletasLine2: TppLine;
    rpBoletasDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppGroup13: TppGroup;
    ppGroupHeaderBand13: TppGroupHeaderBand;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppSubRptHistorico: TppSubReport;
    ppChildReport2: TppChildReport;
    ppHistorico: TppBDEPipeline;
    DsHistorico: TwwDataSource;
    QryHistorico: TwwQuery;
    ppTitleBand1: TppTitleBand;
    ppDetailBand23: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppLabel178: TppLabel;
    ppDBText171: TppDBText; 
    ppLine50: TppLine;
    ppLine59: TppLine;
    ppLabel179: TppLabel;
    ppLabel180: TppLabel;
    ppDBText172: TppDBText;
    ppLabel181: TppLabel;
    ppDBText176: TppDBText;
    ppDBText179: TppDBText;
    ppLabel182: TppLabel;
    ppLabel183: TppLabel;
    ppDBText180: TppDBText;
    ppLabel184: TppLabel;
    ppDBText181: TppDBText;
    ppDBText182: TppDBText;
    ppDBText183: TppDBText;
    ppDBText184: TppDBText;
    ppDBText185: TppDBText;
    ppDBText186: TppDBText;
    ppDBText187: TppDBText;
    ppLabel185: TppLabel;
    ppDBText188: TppDBText;
    ppLabel186: TppLabel;
    ppDBText189: TppDBText;
    daDataModule1: TdaDataModule;
    ppDBText190: TppDBText;
    ppLabel187: TppLabel;
    procedure qryRecadastramentoCalcFields(DataSet: TDataSet);
    procedure rptRedadastramentoSeparadorPrint(Sender: TObject);
    procedure ppDetailBand7BeforePrint(Sender: TObject);
    procedure ppDetailBand8BeforePrint(Sender: TObject);
    procedure qryPaPdvTpCobCalcFields(DataSet: TDataSet);
    procedure qryRelBenefDifCalcFields(DataSet: TDataSet);
    procedure ppDetailBand3BeforePrint(Sender: TObject);
    procedure ppReport1GroupHeaderBand1BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand5BeforePrint(Sender: TObject);
    procedure lblCampo1Col1Linha1Print(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure rpResumoCobrGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure ppDetBandParticipManutBeforePrint(Sender: TObject);
    procedure rpParticipManutGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure rpParticipManutGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppRptSuplAntecipadaBeforePrint(Sender: TObject);
    procedure ppDetailBand22BeforePrint(Sender: TObject);
    procedure rpListaBenefCabecalhoBeforePrint(Sender: TObject);
    procedure rpListaBenefDetalheBeforePrint(Sender: TObject);
    procedure rpListaBenefRodapeBeforePrint(Sender: TObject);
    procedure ppDetailBand25BeforePrint(Sender: TObject);
    procedure rpResumoCobrGroupFooterBand3BeforePrint(Sender: TObject);
    procedure rpResumoCobrGroupFooterBand1BeforePrint(Sender: TObject);
    procedure rpHstContribGroupHeaderBand2BeforePrint(Sender: TObject);
    procedure rpBoletasGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand17BeforePrint(Sender: TObject);
    procedure ppDetailBand27BeforePrint(Sender: TObject);
    procedure rpDemonsCalcBenefGroupHeaderBand2BeforePrint(
      Sender: TObject);
    procedure ppDetailBand26BeforePrint(Sender: TObject);
    procedure rpResumoCobrGroupFooterBand2BeforePrint(Sender: TObject);
    procedure ppDetailBand5BeforePrint(Sender: TObject);
    procedure rpBoletasBeforePrint(Sender: TObject);
    procedure ppGroupFooterBand12BeforePrint(Sender: TObject);
    procedure rpBoletasShape1Print(Sender: TObject);
    procedure qryPartCedidoBeforeOpen(DataSet: TDataSet);
    procedure rpBoletasGroupFooterBand1AfterPrint(Sender: TObject);
  private
    { Private declarations }
    // Variaveis para o relatorio - Relação de Participantes em Manutencao de Salário
    rTotalContribPart,
    rTotalContribPatro,
    rTotalJoia,
    rTotalOutras,
    rTotalTotal : double;

    // Variaveis para o relatorio - Lista de Beneficios
    rTotAlteradores, rTotalBenefLiq, rTotalEsperado, rTotalRecebido, 
    rTotPatroEsperado, rTotPatroRecebido : double;

    procedure PreencheVariaveisCertificado;
  public
    { Public declarations }
    bSeparador, bLinhaFina, bJaImprimiuMes : boolean;
    // Variável para totalizar salario referencia
    dTotalSalRef, dTotalSalRefPatro : Double;
    sAnoMesRef : String;

    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatAdmPrev: TdtmRelatAdmPrev;

implementation                                                
                      
uses FParamRelBeneficios, FParamRelCert,     USistema, UAdmPrev, FPRelBenefProv,
     FPRelResumoCobr,     FParamRelBoletas,  DAPrev,   UParticipante,FpRelQuadroPdv,
     FParamRelRecPIDPIA,  FParamRelPartInscMes, FParamRelPartDeb, FParamRelEncPIDPIA,
     CRelRecadastramento, FParamRelPdvGeral, FParamRelPartManutTpCob,FpRelRegionaisPdv2,
     FRelBenefDif,        UFuncoesUteis, FParamRelHstContrib,
     FParamRelParticipManutencao, FParamRelCadastrais, FPRelDemosBenef,
     FPRelDivergContrib, FParamSuplAntecipada, {UExtenso,} UMovReserva,
     FPRelListaBeneficio, FParamRelHstContribReg, FParamRelOcor,
     FParamRelCAlter, FPRelDivergFinancINSS, FParamRelCertificadoPre,
     udataBase;

{$R *.DFM}

function TdtmRelatAdmPrev.MostraParam(Form: string): boolean;
var frm : TForm;
begin
   if (UPPERCASE(Form) = 'FRMPARAMRELBENEFICIOS') // Processo de Beneficios para Participante
   then frm := TFrmParamRelBeneficios.Create(Application)
   else if (UPPERCASE(Form) = 'FRMPRELBENEFPROV') // Relação de Benefícios Provisórios
   then frm := TfrmPRelBenefProv.Create(Application)
   else if (UPPERCASE(Form) = 'FRMPARAMRELBOLETAS') // Relação de cOBRANCAS BANCARIAS
   then frm := TfrmParamRelBOLETAS.Create(Application)
   else if (UPPERCASE(Form) = 'FRMPRELRESUMOCOBR') // Resumo de Cobrança de Contribuição
   then frm := TfrmPRelResumoCobr.Create(Application)
   else if (UpperCase(Form) = 'CFGRELRECADASTRAMENTO')  // criação dos forms de configuração de Relatórios
   then frm := TcfgRelRecadastramento.Create(Application)
   else if (UPPERCASE(Form) = 'FRMPARAMRELPDVGERAL') // Relaçao de Cadastramento de Manu. Pdv
   then frm := TfrmParamRelPdvGeral.Create(Application)
   else if (UPPERCASE(Form) = 'FRMPARAMRELPARTMANUTTPCOB') // Particip. em Pdv por Tp Cobranca
   then frm := TfrmParamRelPartManutTpCob.Create(Application)
   else if (UPPERCASE(Form) = 'FRMRELBENEFDIF')      // RELATORIO DE DIFERNCAS
   then frm := TfrmRelBenefDif.Create(Application)
   else if (UPPERCASE(Form) = 'FRMPARAMRELHSTCONTRIB')      // RELATORIO DE DIFERNCAS
   then frm := TfrmParamRelHstContrib.Create(Application)
   else if (UPPERCASE(Form)='FRMPARAMRELPARTICIPMANUTENCAO')    // Participantes em manutenção de salário
   then frm := TfrmParamRelParticipManutencao.Create(Application)
   else if (UPPERCASE(Form)='FRMPARAMRELCADASTRAIS')    // Relatórios cadastrais diversos
   then frm := TfrmParamRelCadastrais.Create(Application)
   else if (UPPERCASE(Form)='FRMPARAMRELPDVREG2')    // Valores Pagos por regionais
   then frm := TfrmParamRelPdvReg2.Create(Application)
   else if (UPPERCASE(Form)='FRMPARAMRELPDVREG')    // Quadro de Valores Cobrados por Regionais
   then frm := TfrmParamRelPdvReg.Create(Application)
   else if (UPPERCASE(Form)='FRMPRELDEMOSBENEF')    // Demonstrativo de Calculo de Beneficio
   then frm := TfrmPRelDemosBenef.Create(Application)
   else if (UPPERCASE(Form)='FRMPARAMRELENCPIDPIA')    // Encerramento de PID/PIA
   then frm := TfrmParamRelEncPIDPIA.Create(Application)
   else if (UPPERCASE(Form)='FRMPARAMRELPARTDEB')    // Participantes em Débito
   then frm := TfrmParamRelPartDeb.Create(Application)
   else if (UPPERCASE(Form)='FRMPARAMRELPARTINSCMES')    // Participantes Inscritos no Mês
   then frm := TfrmParamRelPartInscMes.Create(Application)
   else if (UPPERCASE(Form)='FRMPARAMRELRECPIDPIA')    // Recebimentos Mantidos Incentivo PID/PIA
   then frm := TfrmParamRelRecPIDPIA.Create(Application)
   else if (UPPERCASE(Form)='FRMPRELDIVERGCONTRIB')    // Relatorio Mensal de Divergencia de Contribuicao
   then frm := TfrmPRelDivergContrib.Create(Application)
   else if (UPPERCASE(Form) = 'FRMPARAMSUPLANTECIPADA')
   then frm := TFrmParamSuplAntecipada.Create(Application)
   else if (UPPERCASE(Form) = 'FRMPRELLISTABENEFICIO')
   then frm := TfrmPRelListaBeneficio .Create(Application)
   else if (UPPERCASE(Form) = 'FRMPARAMRELHSTCONTRIBREG')
   then frm := TfrmParamRelHstContribReg .Create(Application)
   else if (UPPERCASE(Form) = 'FRMPARAMRELOCOR')
   then frm := TfrmParamRelOcor .Create(Application)
   else if (UPPERCASE(Form) = 'FRMPARAMRELCALTER')  // Relatório de Contas Alteradas
   then frm := TfrmParamRelCAlter .Create(Application)
   else if (UPPERCASE(Form) = 'FRMDIVERGFINANINSS') //
   then frm := TfrmDivergFinanINSS .Create(Application)
   else if (UPPERCASE(Form) = 'FRMPARAMRELCERTIFICADOPRE')
   then frm := TfrmParamRelCertificadoPre .Create(Application)

   else if (UPPERCASE(Form) = 'NOT') // cguedes
   then begin
     Result := true;
     Exit;
   End
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

procedure TdtmRelatAdmPrev.qryRecadastramentoCalcFields(DataSet: TDataSet);
var
   sCPF: string;
begin
   with qryDoc do begin
      Close;
      ParamByName('BFCIARIO').asInteger := qryRecadastramento.FieldByName('IDPESSOA').asInteger;
      Open;

      qryRecadastramento.FieldByName('Identidade').asString := qryDoc.FieldByName('NUMDOCUMENTO').asString;
      qryRecadastramento.FieldByName('Orgao').asString := qryDoc.FieldByName('ORGAO').asString;

      Close;
   end;

   sCPF := qryRecadastramento.FieldByName('CPF').asString;
   qryRecadastramento.FieldByName('CpfFormatado').asString := copy(sCPF, 1, 3) + '.' + copy(sCPF, 4, 3) + '.' + copy(sCPF, 7, 3) + '-' + copy(sCPF, 11, 2);

end;

procedure TdtmRelatAdmPrev.rptRedadastramentoSeparadorPrint(
  Sender: TObject);
begin
  inherited;
  rptRedadastramentoSeparador.Visible := bSeparador;
end;

// === Eventos do Relatorio rpPDVGeral
procedure TdtmRelatAdmPrev.ppDetailBand7BeforePrint(Sender: TObject);
var sTaxaContrib, sTaxaJoia : string;
    iNumOrdem               : integer;

    iIdTabelaNivel,
    iIdTabelaCargo : longint; // PROVISORIO
    sCargo,
    sMesPassivo,
    sValorPassivo  : string;  // PROVISORIO
begin
  inherited;
  // Taxas e Joia
  sTaxaContrib := '';
  sTaxaJoia    := '';
  with qryAux do
  begin
     Close;
     Sql.Clear;
     Sql.Add(' select cpp.valorbase1, cpp.valorbase2, cpp.datafinal, cpp.datainicio '+
             ' from   contribprevpartp  cpp, contprev cp '+
             ' where  cpp.idpessjur   =   '+qryPdvGeral.FieldByName('idpessjur').AsString+
             ' and    cpp.idpessoa    =   '+qryPdvGeral.FieldByName('idpessoa').AsString+
             ' and    cpp.flgcobra    = 1 '+
             ' and    cpp.valorbase1 is not null '+
             ' and    cpp.idplanoprev    = cp.idplanoprev '+
             ' and    cpp.idcontribuicao = cp.idcontribuicao '+
             ' order  by cp.ordemcalculo ');
      Open;

      iNumOrdem := 0;
      while not (Eof) do
      begin
         inc(iNumOrdem);
         if iNumOrdem = 1
         then sTaxaContrib := FieldByName('ValorBase1').AsString
         else if iNumOrdem = 2
              then sTaxaJoia := FieldByName('ValorBase1').AsString;
         Next;
      end;

      lblTaxa.Text := FormatFloat('#0.00000',StrToFloat(ClienteNumero(sTaxaContrib)));
      lblJoia.Text := FormatFloat('#0.00000',StrToFloat(ClienteNumero(sTaxaJoia)));
  end;

  // Buscar passivo do nivel e passivo do cargo
  // Estes campos deverão vir da estrutura de historico funcional x cargos x faixas

  // PROVISORIO - Mas como esta estrutura ainda nao está fechada e precisamos
  // PROVISORIO - do relatório pronto, o código a seguir será feito para funcionar
  // PROVISORIO - apenas na REFER até que a estrutura seja fechada e implementada
  if qryPdvGeral.FieldByName('IdPessjur').AsInteger = 2
  then begin
     iIdTabelaNivel := 88;// SALARIAL02
     iIdTabelaCargo := 89;
  end
  else if qryPdvGeral.FieldByName('IdPessjur').AsInteger = 3
  then begin
     iIdTabelaNivel := 21;// SALARIAL03
     iIdTabelaCargo := 31;
  end
  else if qryPdvGeral.FieldByName('IdPessjur').AsInteger = 4
  then begin
     iIdTabelaNivel := 20;// SALARIAL04
     iIdTabelaCargo := 32;
  end
  else if qryPdvGeral.FieldByName('IdPessjur').AsInteger = 1111568
  then begin
     iIdTabelaNivel := 83;// SALARIAL05
     iIdTabelaCargo := 85;
  end
  else if qryPdvGeral.FieldByName('IdPessjur').AsInteger = 111
  then begin
     iIdTabelaNivel := 86;// SALARIAL06
     iIdTabelaCargo := 84;
  end
  else begin
     iIdTabelaNivel := 25;// SALARIAL01
     iIdTabelaCargo := 26;
  end;


  with qryAux do
  begin
     sMesPassivo := qryPdvGeral.FieldByName('MesReferencia').AsString;

  {
   select c3 
from longvaltabgener
where (idtabela = 86)
and   (c1 = (select max(c1) from longvaltabgener
             where idtabela = 86 and c1 <= '1999/10'
             and c2 = '227')
      )
and   (c2 = '227')
  }
     // Buscar passivo do nivel
     Close;
     SQL.Clear;
     SQL.Add( ' select c3 '+
              ' from longvaltabgener '+
              ' where (idtabela = '+IntToStr(iIdTabelaNivel)+')'+
              ' and   (c1 = (select max(c1) from longvaltabgener '+
              '              where  idtabela = '+IntToStr(iIdTabelaNivel)+' and '+
              '                     c1 <= '''+sMesPassivo+''' and '+
              '                     c2 = '''+qryPdvGeral.FieldByName('Nivel').AsString+''') )'+
              ' and   (c2 = '''+qryPdvGeral.FieldByName('Nivel').AsString+''')');
     Open;
     if not IsEmpty
     then lblPasNivel.Text := FormatFloat('#0.00',StrToFloat(ClienteNumero(FieldByName('c3').AsString)))
     else lblPasNivel.Text := '';

     // Buscar passivo do cargo
     if qryPdvGeral.FieldByName('IdCargoExt').AsInteger <= 9
     then sCargo := '0'+qryPdvGeral.FieldByName('IdCargoExt').AsString
     else sCargo := qryPdvGeral.FieldByName('IdCargoExt').AsString;
     Close;
     SQL.Clear;
     SQL.Add( ' select c3 '+
              ' from longvaltabgener '+
              ' where (idtabela = '+IntToStr(iIdTabelaCargo)+')'+
              ' and   (c1 = (select max(c1) from longvaltabgener '+
              '              where  idtabela = '+IntToStr(iIdTabelaCargo)+' and '+
              '                     c1 <= '''+sMesPassivo+''' and '+
              '                     c2 = '''+sCargo+''') )'+
              ' and   (c2 = '''+sCargo+''')');
     Open;
     if not IsEmpty
     then lblPasCargo.Text := FormatFloat('#0.00',StrToFloat(ClienteNumero(FieldByName('c3').AsString)))
     else lblPasCargo.Text := '';
  end; // with
end;

procedure TdtmRelatAdmPrev.ppDetailBand8BeforePrint(Sender: TObject);
var sMsgErro, salario : string;
begin
  inherited;
  salario := '0'; 
  rpPaPdvTpCobLabel1.Caption := FormatFloat('#0.00',StrToFloat(ClienteNumero(BuscaSalario( qryPaPdvTpCob.FieldByName('idpessjur').AsInteger,
                                              qryPaPdvTpCob.FieldByName('idplanoprev').AsInteger,
                                              qryPaPdvTpCob.FieldByName('idpessoa').AsInteger,
                                              qryPaPdvTpCob.FieldByName('mesreferencia').AsString,
                                              'MA', salario, sMsgErro, qryAux))));
end;

procedure TdtmRelatAdmPrev.qryPaPdvTpCobCalcFields(DataSet: TDataSet);
var iCont : Integer;
begin
  inherited;

  with qryAux do
  begin
     Close;
     Sql.Clear;
     Sql.Add(' select c.nomeresum, h.valoresperado, c.nome '+
             ' from   hstcontribprev   h, '+
             '        contprev         cp,'+
             '        contribuicao     c, '+
             '        contribprevpartp cpp'+
             ' where  h.idpessjur      = '+qryPaPdvTpCob.FieldByName('idpessjur').AsString+
             ' and    h.idplanoprev    = '+qryPaPdvTpCob.FieldByName('idplanoprev').AsString+
             ' and    h.idpessoa       = '+qryPaPdvTpCob.FieldByName('idpessoa').AsString+
             ' and    h.seqproposta    = '+qryPaPdvTpCob.FieldByName('seqproposta').AsString+
             ' and    h.idmotivo       = '+qryPaPdvTpCob.FieldByName('idmotivo').AsString+
             ' and    h.mesreferencia  = '+''''+qryPaPdvTpCob.FieldByName('MESREFERENCIA').AsString+''''+
             ' and    h.idplanoprev    = cp.idplanoprev     '+
             ' and    h.idcontribuicao = cp.idcontribuicao  '+
             ' and    cp.flgnaoexigerec= 1                  '+
             ' and    cp.idcontribuicao= c.idcontribuicao   '+
             ' and    h.idpessjur      = cpp.idpessjur      '+
             ' and    h.idplanoprev    = cpp.idplanoprev    '+
             ' and    h.idpessoa       = cpp.idpessoa       '+
             ' and    h.seqproposta    = cpp.seqproposta    '+
             ' and    h.idcontribuicao = cpp.idcontribuicao '+
             ' and    cpp.flgcobra     = 1 '+
             ' order  by ordemcalculo  ');
     qryAux.Open;
     iCont := 0;

     while not (qryAux.Eof) do
     begin
        Inc(iCont);
        if iCont <= 3 then
        begin
           qryPaPdvTpCob.FieldByName('NOMECONT'+IntToStr(iCont)).AsString := qryAux.FieldByName('NOMERESUM').AsString;
           qryPaPdvTpCob.FieldByName('VALOR'+IntToStr(iCont)).AsString    := qryAux.FieldByName('VALORESPERADO').AsString;
        end
        else
           begin
              qryPaPdvTpCob.FieldByName('NOMECONTO').AsString := 'Outras';
              qryPaPdvTpCob.FieldByName('VALORO').AsFloat     := qryPaPdvTpCob.FieldByName('VALORO').AsFloat +
                                                                 qryAux.FieldByName('VALORESPERADO').AsFloat;
           end;

        qryPaPdvTpCob.FieldByName('SUMVALOR').AsFloat := qryPaPdvTpCob.FieldByName('SUMVALOR').AsFloat+
                                                         qryAux.FieldByName('VALORESPERADO').AsFloat;
        qryAux.Next;
     end;
  end;
end;

procedure TdtmRelatAdmPrev.qryRelBenefDifCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryRelBenefDif.FieldByName('difcont').AsFloat :=
                (qryRelBenefDif.FieldByName('valespc').AsFloat -
                 qryRelBenefDif.FieldByName('valrecc').AsFloat);

  qryRelBenefDif.FieldByName('difbenef').AsFloat :=
                (qryRelBenefDif.FieldByName('valcalcb').AsFloat -
                 qryRelBenefDif.FieldByName('valpagb').AsFloat);


end;

procedure TdtmRelatAdmPrev.ppDetailBand3BeforePrint(Sender: TObject);
var rDiferenca : double;
begin
  inherited;
  // Resumo de cobranca
  rDiferenca := StrToFloat(ClienteNumero(qryResumoCobr.FieldByName('ValorRecebido').AsString)) -
                StrToFloat(ClienteNumero(qryResumoCobr.FieldByName('ValorEsperado').AsString));
  rpDiferenca.Text := FormatFloat('#0.00',rDiferenca);
end;

procedure TdtmRelatAdmPrev.rpResumoCobrGroupFooterBand3BeforePrint(
  Sender: TObject);
var rDiferencaSubTot : double;  
begin
  inherited;
  rDiferencaSubTot := StrToFloat(ClienteNumero(rpRecebidoSubTot.Text)) -
                      StrToFloat(ClienteNumero(rpEsperadoSubTot.Text));
  rpDiferencaSubTot.Text := FormatFloat('#0.00',rDiferencaSubTot);
end;

procedure TdtmRelatAdmPrev.rpResumoCobrGroupFooterBand1BeforePrint(
  Sender: TObject);
var rDiferencaTot : double;
begin
  inherited;
  rDiferencaTot := StrToFloat(ClienteNumero(rpRecebidoTot.Text)) -
                   StrToFloat(ClienteNumero(rpEsperadoTot.Text));
  rpDiferencaTot.Text := FormatFloat('#0.00',rDiferencaTot);
end;

procedure TdtmRelatAdmPrev.ppReport1GroupHeaderBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  if   (qryRelBeneficios.FieldByName('NumOpcoes').AsString = '') or
       (qryRelBeneficios.FieldByName('NumOpcoes').AsInteger <= 0) or
     ( (Trim(qryRelBeneficios.FieldByName('ValorBase1').AsString) = '') or
       (Trim(qryRelBeneficios.FieldByName('ValorBase1').AsString) = '0') ) and
     ( (Trim(qryRelBeneficios.FieldByName('ValorBase2').AsString) = '') or
       (Trim(qryRelBeneficios.FieldByName('ValorBase2').AsString) = '0') ) and
     ( (Trim(qryRelBeneficios.FieldByName('ValorBase3').AsString) = '') or
       (Trim(qryRelBeneficios.FieldByName('ValorBase3').AsString) = '0') )
  then ppOpcoesBenef.Visible := False
  else ppOpcoesBenef.Visible := True;

end;

procedure TdtmRelatAdmPrev.ppGroupHeaderBand5BeforePrint(Sender: TObject);
begin
  inherited;
  lblNumeroProc.Caption := 'Dados do  Processo de Benefício - Processo Nº '+qryRelBeneficios.FieldByName('NumeroProcesso').AsString;
end;

// ***  MÉTODOS DO RELATÓRIO "CERTIFICADO DE INSCRICAO PRE-IMPRESSO ***
// Obs:  Configuraçao de Página para o certificado:
// Retrato/  Largura: 14,8854/  Altura: 5,5

//             Certificamos que
// _____________________________________________________ = 36
// é filiado deste fundo multipatrocinador inscrito no
// _______________________________, sob o no. __________ = 24 / 6
// em ______ de ___________________ de _________         = 5 / 13 / 6

procedure TdtmRelatAdmPrev.PreencheVariaveisCertificado;
begin
end;

procedure TdtmRelatAdmPrev.lblCampo1Col1Linha1Print(Sender: TObject);
begin
  inherited;

end;
// ***  FIM DOS MÉTODOS DO RELATÓRIO "CERTIFICADO DE INSCRICAO PRE-IMPRESSO ***

// Certificado - dados de inscricao
procedure TdtmRelatAdmPrev.ppDetailBand1BeforePrint(Sender: TObject);
var Visivel : boolean;
begin
  inherited;

end;

procedure TdtmRelatAdmPrev.rpResumoCobrGroupHeaderBand1BeforePrint(
  Sender: TObject);
var sAnoMesRubrica,
    sNomeIdRubrica : string;
begin
  inherited;

  if Copy(qryResumoCobr.FieldByName('MesReferencia').AsString,6,2) = '13'
  then begin
     sNomeIdRubrica := 'IDRUBDECTERC';
     sAnoMesRubrica := 'MESREFERENCIA';
  end
  else begin
     sNomeIdRubrica := 'IDRUBSALPARTICIP';
     sAnoMesRubrica := 'MESCOBRANCA';
  end;


  // preencher total salario part
  with dtmAPrev.qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT HST.VALORACUMULADO '+
             ' FROM   HSTRUBRICAXPESS HST, PATRO PT, RUBRICAXPESS RP '+
             ' WHERE  (PT.IDPESSOA       = '+qryResumoCobr.FieldByName('IdPessJur').AsString+')'+
             ' AND    (HST.IDPESSOA      = '+qryResumoCobr.FieldByName('IdPessJur').AsString+')'+
             ' AND    (HST.IDPLANOPREV   = '+qryResumoCobr.FieldByName('IdPlanoPrev').AsString+')'+
             ' AND    (HST.MESREFERENCIA = '''+qryResumoCobr.FieldByName('ANOMESTELA').AsString+''') '+
             ' AND    (RP.IDPESSOA       = PT.IDPESSOA)          '+
             ' AND    (RP.IDRUBRICA      = PT.'+sNomeIdRubrica+')'+
             ' AND    (HST.IDRUBRICA     = RP.IDRUBRICA)       ');
     Open;
     if IsEmpty
     then lblTotalSalPart.Caption := '0,00'
     else lblTotalSalPart.Caption := FormatFloat('###,###,###,##0.00',FieldByName('ValorAcumulado').AsFloat);
     Close;
  end;
end;

procedure TdtmRelatAdmPrev.ppDetBandParticipManutBeforePrint(
  Sender: TObject);
var sSalario, sSalManut, sMsgErro : string;
    iContContrib : word;
    rSubTotalOutras,
    rSubTotalContrib : double;
begin
  inherited;
  // Preencher salario de participacao
  sSalario  := '0';
  sSalManut := BuscaSalario( qryParticipManut.FieldByName('IdPessJur').AsInteger,
                             qryParticipManut.FieldByName('IdPlanoPrev').AsInteger,
                             qryParticipManut.FieldByName('IdPessoa').AsInteger,
                             qryParticipManut.FieldByName('MESREFERENCIA').AsString,
                             qryParticipManut.FieldByName('FlgInterno').AsString,
                             sSalario, sMsgErro,dtmAPrev.qryAux);
  lblSalManut.Caption := FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalManut)));

  // Preencher contribuicoes - colunas 1,2,3 e 4
  qryHstContribPartp.Close;
  qryHstContribPartp.ParamByName('IdPessJur').AsInteger    := qryParticipManut.FieldByName('IdPessJur').AsInteger;
  qryHstContribPartp.ParamByName('IdPessoa').AsInteger     := qryParticipManut.FieldByName('IdPessoa').AsInteger;
  qryHstContribPartp.ParamByName('FlgDevolucao').AsInteger := qryParticipManut.FieldByName('FlgDevolucao').AsInteger;
  qryHstContribPartp.ParamByName('MesReferencia').AsString := qryParticipManut.FieldByName('MESREFERENCIA').AsString;
  qryHstContribpartp.Open;

  iContContrib  := 0;
  rTotalOutras  := 0;
  rSubTotalContrib := 0;
  lblContribPart.Caption  := '0.00';
  lblContribPatro.Caption := '0.00';
  lblJoiaManut.Caption         := '0.00';
  lblOutras.Caption       := '0.00';
  lblTotalContrib.Caption := '0.00';
  while not qryHstContribPartP.Eof do
  begin
     inc(iContContrib);
     rSubTotalContrib := rSubTotalContrib + qryHstContribPartP.FieldByname('ValorEsperado').AsFloat;
     case iContContrib of
          1 : begin
                 lblContribPart.Caption := FormatFloat('#0.00',qryHstContribPartP.FieldByname('ValorEsperado').AsFloat);
                 rTotalContribPart      := rTotalContribPart + qryHstContribPartP.FieldByname('ValorEsperado').AsFloat;
              end;
          2 : begin
                 lblContribPatro.Caption := FormatFloat('#0.00',qryHstContribPartP.FieldByname('ValorEsperado').AsFloat);
                 rTotalContribPatro      := rTotalContribPatro + qryHstContribPartP.FieldByname('ValorEsperado').AsFloat
              end;
          3 : begin
                 lblJoiaManut.Caption := FormatFloat('#0.00',qryHstContribPartP.FieldByname('ValorEsperado').AsFloat);
                 rTotalJoia         := rTotalJoia + qryHstContribPartP.FieldByname('ValorEsperado').AsFloat;
              end;
     else
        rSubTotalOutras := rSubTotalOutras + qryHstContribPartP.FieldByname('ValorEsperado').AsFloat;
        rTotalOutras    := rTotalOutras + rSubTotalOutras;
     end; // case
     qryHstContribPartP.Next;
  end;
  lblOutras.Caption       := FormatFloat('#0.00',rTotalOutras);
  lblTotalContrib.Caption := FormatFloat('#0.00',rSubTotalContrib);
  rTotalTotal             := rTotalTotal + rSubTotalContrib;
end;

procedure TdtmRelatAdmPrev.rpParticipManutGroupHeaderBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  // Zerar totais por regional
  rTotalContribPart  := 0;
  rTotalContribPatro := 0;
  rTotalJoia         := 0;
  rTotalOutras       := 0;
  rTotalTotal        := 0;
end;

procedure TdtmRelatAdmPrev.rpParticipManutGroupFooterBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  // Preencher totais
  lblTotalPart.Caption   := FormatFloat('#0.00',rTotalContribPart);
  lblTotalPatro.Caption  := FormatFloat('#0.00',rTotalContribPatro);
  lblTotalJoia.Caption   := FormatFloat('#0.00',rTotalJoia);
  lblTotalOutras.Caption := FormatFloat('#0.00',rTotalOutras);
  lblTotalTotal.Caption  := FormatFloat('#0.00',rTotalTotal);
end;

// ***************************************************************************************
// MÉTODOS DO RELATÓRIO : DEMONSTRATIVO DE CALCULO DE BENEFICIO
// ***************************************************************************************
procedure TdtmRelatAdmPrev.ppRptSuplAntecipadaBeforePrint(Sender: TObject);
var snome, spatro, sfator, svalor, smat, ssigla,
    sFundacao,
    sTextoTotal,
    sLinha   : String;
    i, iPos, iTam  : integer;
begin

   snome  := qrysuplantecipada.fieldbyname('NOME').AsString;
   spatro := qrysuplantecipada.fieldbyname('PESSJUR').AsString;
   smat   := qrysuplantecipada.fieldbyname('MATRICULA').AsString;
   sfator := qrysuplantecipada.fieldbyname('VALORBASE1').AsString;
   svalor := qrysuplantecipada.fieldbyname('VALORBASE2').AsString;

   sFundacao := qrysuplantecipada.fieldbyname('NOMEFUNDACAO').AsString;

   qryaux.close;
   qryaux.sql.text := ' SELECT MOEDA.MOESIGLA '+
                      ' FROM MOEDA, PARAMGLOBAL '+
                      ' WHERE MOEDA.MOECODIGO = PARAMGLOBAL.MOEDACORRENTE '+
                      ' AND  PARAMGLOBAL.IDPESSOA = '+inttostr(sistema.IdEmpresa)+'';
   qryaux.open;

   if not qryaux.isempty then
   ssigla := qryaux.fieldbyname('MOESIGLA').AsString;

   with ppRptSuplAntecipadaMemo1.Lines do
   begin
      Clear;
      Add('');
      Add('             Por este instrumento particular de TERMO DE OPÇÃO, eu '+trim(snome)+',');
      Add('     Matrícula n.'+trim(smat)+', na qualidade de participante da '+trim(sFundacao)+', deixo expressa minha ');
      Add('     OPÇÃO  pelo benefício supletivo antecipado da aposentadoria com : ');
      Add('');
      Add('');
      Add('     (   )   BENEFÍCIO REDUZIDO, estando ciente de que :');
      Add('');
      Add('         a) ao benefício supletivo será aplicado o  fator  redutor  estimado '+trim(sfator)+', calculado');
      Add('            atuarialmente;');
      Add('');
      Add('         b) o abono referido nos parágrafos únicos dos artigos 19 e 21 do Regulamento Básico do Plano de ');
      Add('            Benefício Definido '+Trim(sFundacao)+', a que terei direito, também sujeitar-se-a a aplicação ');
      Add('            de idêntico fator redutor estimado;');
      Add('');
      Add('         c) o referido fator não será alterado em função do aumento da idade;');
      Add('');
      Add('         d) o fator redutor estimado provisoriamente para o benefício supletivo      antecipado,');
      Add('            deverá ser revisado, quando da apresentação da carta concessória, se o valor atribuído');
      Add('            pelo INSS a aposentadoria, for diferente do utilizado no cálculo provisório, observada');
      Add('            a restrição constante na alínea ''c'';');
      Add('');
      Add('         e) deverá ser ainda, revisado o benefício supletivo provisório, se ocorrerem modificações');
      Add('            das informações constantes do cadastro da '+trim(sFundacao)+', desde que, devidamente');
      Add('            comprovadas;');
      Add('');
      Add('         f) o participante deverá apresentar a Carta Concessória do INSS, no prazo de 90 (noventa)');
      Add('            dias, a contar da data do início do benefício supletivo antecipado, sob pena de suspensão');
      Add('            da suplementação, com a conseqüente restituição dos valores recebidos.');
      Add('');
      Add('');
      Add('');
      Add('     (   )   BENEFÍCIO NÃO REDUZIDO, obrigando-me a efetuar previamente, o');
      Add('             recolhimento, a '+sFundacao+', do fundo no valor de '+trim(ssigla)+
                        ' '+FormatFloat('#0.00	',StrToFloat(ClienteNumero(Trim(sValor))))+'');
      Add('             atuarialmente calculado, compensatório da antecipação da aposentadoria');
      Add('             após o que terei direito ao benefício supletivo integral.');
      Add('');
      Add('');
      Add('');
      Add('             Declaro ainda, que fui cientificado do valor do pecúlio denominado ''RESERVA DE');
      Add('     POUPANÇA''  e do valor da minha contribuição, caso optasse pela manutenção do');
      Add('     salário-de-participação até completar a idade mínima exigida para ter direito a suplementação');
      Add('     integral da aposentadoria sem recolhimento do fundo acima referido.');
   end;
end;

procedure TdtmRelatAdmPrev.ppDetailBand22BeforePrint(Sender: TObject);
var sSalario , sMsgErro: string;
begin
  inherited;
  // Tratamento de Divergencia
  sSalario  := '0';
  sSalario  := BuscaSalario( qryDivergContrib.FieldByName('IdPessJur').AsInteger,
                             qryDivergContrib.FieldByName('IdPlanoPrev').AsInteger,
                             qryDivergContrib.FieldByName('IdPessoa').AsInteger,
                             qryDivergContrib.FieldByName('MESREFERENCIA').AsString,
                             qryDivergContrib.FieldByName('FlgInterno').AsString,
                             sSalario, sMsgErro,dtmAPrev.qryAux);
  lblDivergSalario.Caption := FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalario)));

  
end;

procedure TdtmRelatAdmPrev.rpListaBenefCabecalhoBeforePrint(
  Sender: TObject);
begin
  inherited;
  rTotalBenefLiq := 0;
end;

procedure TdtmRelatAdmPrev.rpListaBenefDetalheBeforePrint(Sender: TObject);
var rValorLiquido : double;
begin
  inherited;
  // Montar labels com informacoes que nao estao na query
  if Trim(qryListaBeneficio.FieldByName('DtEvento').AsString) <> ''
  then lblCotaDeslig.Caption := FormatFloat('###,###,###,##0.0000000',
                                       VoltaValorCotacao(dtmAPrev.qry,
                                       qryListaBeneficio.FieldByName('IndiceReajBenef').AsString,'','',
                                       qryListaBeneficio.FieldByName('DtEvento').AsString))
  else lblCotaDeslig.Caption := '';

  if Trim(qryListaBeneficio.FieldByName('DataInicioFund').AsString) <> ''
  then lblCota.Caption := FormatFloat('###,###,###,##0.00000',
                                       VoltaValorCotacao(dtmAPrev.qry,
                                       qryListaBeneficio.FieldByName('IndiceReajBenef').AsString,'','',
                                       qryListaBeneficio.FieldByName('DataInicioFund').AsString))
  else lblCota.Caption := '';

  lblResReal.Caption := FormatFloat('###,###,###,##0.00000',
                             StrToFloat(ClienteNumero(CalcReservaPart(qryListaBeneficio.FieldbyName('IdPessJur').AsInteger,
                                                qryListaBeneficio.FieldbyName('IdPlanoPrev').AsInteger,
                                                qryListaBeneficio.FieldbyName('IdTitular').AsInteger,
                                                -1,
                                                qryListaBeneficio.FieldbyName('SeqProposta').AsInteger,
                                                qryListaBeneficio.FieldByName('DtEvento').AsString,
                                                qryListaBeneficio.FieldByName('DataInicioFund').AsString,
                                                '', '', 
                                                qryListaBeneficio.FieldByName('IdBeneficio').AsString,
                                                dtmAPrev.qryAux))));
  // Provisorio. Fazer funçoes para calcular
  lblEmp.Caption := '0,00';
  lblContPrev.Caption := '0,00';
  lblContAssist.Caption := '0,00';

  rValorLiquido := qryListaBeneficio.FieldByName('ValorAtual').AsFloat
                  - StrToFloat(ClienteNumero(lblEmp.Caption))
                  - StrToFloat(ClienteNumero(lblContPrev.Caption))
                  - StrToFloat(ClienteNumero(lblContAssist.Caption));

  lblBenefLiq.Caption := FormatFloat('###,###,###,##0.00',rValorLiquido);
  rTotalBenefLiq := rTotalBenefLiq + rValorLiquido;

end;

procedure TdtmRelatAdmPrev.rpListaBenefRodapeBeforePrint(Sender: TObject);
begin
  inherited;
  lblTotLiq.Caption := FormatFloat('###,###,###,##0.00',rTotalBenefLiq);

end;

procedure TdtmRelatAdmPrev.ppDetailBand25BeforePrint(Sender: TObject);
var iDia, iMes, iAno : word;
begin
  inherited;
  DecodeDate(date, iano, iMes, iDia);
  rpCartaInadimplLblData.Caption := qryFundacao.FieldByName('Cidade').AsString+', '+IntToStr(iDia)+' de '+FormatDateTime('mmmmm', date)+' de '+
                                    IntToStr(iAno);
end;



procedure TdtmRelatAdmPrev.rpHstContribGroupHeaderBand2BeforePrint(
  Sender: TObject);
var sMsgErro,
    sValorSalario : string;
    dValorSalario : double;
begin
  inherited;
  // Verificar situacao do participante no mes do evento. Se ele teve mais de uma
  // situacao no mes, somar rubricas de salário
  dValorSalario := 0;
  sValorSalario := '0';

  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT SP.FLGINTERNO FROM EVENTOSPREV EP, SITPART SP '+
             ' WHERE  EP.IDPESSJUR   = '+ IntToStr(qryHstContrib.FieldByName('IdPessJur').AsInteger)+
             ' AND    EP.IDPLANOPREV = '+ IntToStr(qryHstContrib.FieldByName('IdPlanoPrev').AsInteger)+
             ' AND    EP.IDPESSOA    = '+ IntToStr(qryHstContrib.FieldByName('IdPessoa').AsInteger)+
             ' AND    EP.SEQPROPOSTA = '+ IntToStr(qryHstContrib.FieldByName('SeqProposta').AsInteger)+
             ' AND    TO_CHAR(EP.DATAEVENTO, ''YYYY/MM'') <= '''+qryHstContrib.FieldByName('MesReferencia').AsString+''''+
             ' AND    ((TO_CHAR(EP.DATAVOLTA,''YYYY/MM'') >= '''+qryHstContrib.FieldByName('MesReferencia').AsString+''') OR '+
             '         (EP.DATAVOLTA IS NULL AND TO_CHAR(EP.DATAEVENTO, ''YYYY/MM'') = '''+qryHstContrib.FieldByName('MesReferencia').AsString+''') '+
             '        ) '+
             ' AND    EP.IDSITPARTNOVO = SP.IDSITPART '+
             ' ORDER BY EP.DATAEVENTO DESC ');
     Open;

     if not IsEmpty
     then begin
        First;
        while not Eof do
        begin
            dValorSalario := dValorSalario +
                             StrToFloat(ClienteNumero(BuscaSalario( qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                                                    qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                                                    qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                                                    qryHstContrib.FieldByName('MesReferencia').AsString,
                                                                    FieldByName('FlgInterno').AsString,
                                                                    sValorSalario,
                                                                    sMsgErro,
                                                                    dtmAPrev.qryAux)));
            Next;
        end; // while
     end  // then- if not IsEmpty
     else begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT SP.FLGINTERNO FROM PARTPREVPLAN PP, SITPART SP '+
                ' WHERE  PP.IDPESSJUR   = '+ IntToStr(qryHstContrib.FieldByName('IdPessJur').AsInteger)+
                ' AND    PP.IDPLANOPREV = '+ IntToStr(qryHstContrib.FieldByName('IdPlanoPrev').AsInteger)+
                ' AND    PP.IDPESSOA    = '+ IntToStr(qryHstContrib.FieldByName('IdPessoa').AsInteger)+
                ' AND    PP.SEQPROPOSTA = '+ IntToStr(qryHstContrib.FieldByName('SeqProposta').AsInteger)+
                ' AND    PP.IDSITPART   = SP.IDSITPART ');
        Open;

        dValorSalario := StrToFloat(ClienteNumero(BuscaSalario( qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                                                qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                                                qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                                                qryHstContrib.FieldByName('MesReferencia').AsString,
                                                                FieldByName('FlgInterno').AsString,
                                                                sValorSalario,
                                                                sMsgErro,
                                                                dtmAPrev.qryAux)));


     end; // else - if not IsEmpty
  end; // with

  sValorSalario := FloatToStr(dValorSalario);

  rpHstContriblblSalario.Caption := FormatFloat('0.00',StrToFloat(ClienteNumero(sValorSalario)));

end;

procedure TdtmRelatAdmPrev.rpBoletasGroupHeaderBand1BeforePrint(
  Sender: TObject);
var sSalario, sSalarioEncontrado, sMsgErro : string;
begin
  inherited;
  if (qryBoletas.FieldByName('FlgInterno').AsString = 'MA') or
     (qryBoletas.FieldByName('FlgInterno').AsString = 'MP')
  then sSalario := OraNumero(qryBoletas.FieldByName('SalMantido').AsString)
  else sSalario := OraNumero(qryBoletas.FieldByName('SalParticipacao').AsString);

  sSalarioEncontrado := BuscaSalario( qryBoletas.FieldByName('IdPessJur').AsInteger,
                                      qryBoletas.FieldByName('IdPlanoPrev').AsInteger,
                                     qryBoletas.FieldByName('IdPessoa').AsInteger,
                                     qryBoletas.FieldByName('MesReferencia').AsString,
                                     qryBoletas.FieldByName('FlgInterno').AsString,
                                     sSalario,
                                     sMsgErro,
                                     dtmAPrev.qry);
  rplblSalario.Caption := FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioEncontrado)));
  sAnoMesRef := '';
end;

procedure TdtmRelatAdmPrev.ppDetailBand17BeforePrint(Sender: TObject);
var sSalario, sMsgErro : string;
begin
  inherited;
  sSalario  := '0';
  if (qryPartDeb.FieldByName('FlgInterno').AsString = 'MA') or (qryPartDeb.FieldByName('FlgInterno').AsString = 'MP')
  then sSalario  := OraNumero(qryPartDeb.FieldByName('SalMantido').AsString)
  else sSalario  := OraNumero(qryPartDeb.FieldByName('SalParticipacao').AsString);

  sSalario  := BuscaSalario( qryPartDeb.FieldByName('IdPessJur').AsInteger,
                             qryPartDeb.FieldByName('IdPlanoPrev').AsInteger,
                             qryPartDeb.FieldByName('IdPessoa').AsInteger,
                             qryPartDeb.FieldByName('MESREFERENCIA').AsString,
                             qryPartDeb.FieldByName('FlgInterno').AsString,
                             sSalario,
                             sMsgErro,dtmAPrev.qryAux);

  rpPartDeblblSalario.Caption := FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalario)));
end;

procedure TdtmRelatAdmPrev.ppDetailBand27BeforePrint(Sender: TObject);
begin
  inherited;
  rpCAlterlblCampo.Caption       := '';
  rpCAlterlblVlrAnterior.Caption := '';
  rpCAlterlblVlrAtual.Caption    := '';

  if Trim(UpperCase(qryCAlter.FieldByName('NOMECAMPO').AsString)) = 'CONTACORRENTE' then
  begin
    rpCAlterlblCampo.Caption       := 'Conta Corrente';
    rpCAlterlblVlrAnterior.Caption := qryCAlter.FieldByName('VALORANTERIOR').AsString;
    rpCAlterlblVlrAtual.Caption    := qryCAlter.FieldByName('VALORATUAL').AsString;
  end
  else if Trim(UpperCase(qryCAlter.FieldByName('NOMECAMPO').AsString)) = 'TIPOCONTA' then
  begin
    rpCAlterlblCampo.Caption       := 'Tipo Conta';
    Case qryCAlter.FieldByName('VALORANTERIOR').AsInteger of
      1: rpCAlterlblVlrAnterior.Caption := 'Conta Corrente';
      2: rpCAlterlblVlrAnterior.Caption := 'Poupança';
      3: rpCAlterlblVlrAnterior.Caption := 'Conta Salário';
    end;

    if qryCAlter.FieldByName('VALORATUAL').AsString <> '' then
    begin
      Case qryCAlter.FieldByName('VALORATUAL').AsInteger of
        1: rpCAlterlblVlrAtual.Caption := 'Conta Corrente';
        2: rpCAlterlblVlrAtual.Caption := 'Poupança';
        3: rpCAlterlblVlrAtual.Caption := 'Conta Salário';
      end;
    end;
  end
  else if Trim(UpperCase(qryCAlter.FieldByName('NOMECAMPO').AsString)) = 'FLGCONTACONJUNTA' then
  begin
    rpCAlterlblCampo.Caption       := 'Conta Conjunta ?';
    if qryCAlter.FieldByName('VALORANTERIOR').AsString = 'N' then
       rpCAlterlblVlrAnterior.Caption := 'Não'
    else
       rpCAlterlblVlrAnterior.Caption := 'Sim';

    if qryCAlter.FieldByName('VALORATUAL').AsString <> '' then
    begin
      if qryCAlter.FieldByName('VALORATUAL').AsString = 'N' then
         rpCAlterlblVlrAtual.Caption := 'Não'
      else
         rpCAlterlblVlrAtual.Caption := 'Sim';
    end;
  end
  else if Trim(UpperCase(qryCAlter.FieldByName('NOMECAMPO').AsString)) = 'FLGCONTAPREF' then
  begin
    rpCAlterlblCampo.Caption       := 'Conta Preferencial ?';
    if qryCAlter.FieldByName('VALORANTERIOR').AsString = '0' then
       rpCAlterlblVlrAnterior.Caption := 'Não'
    else
       rpCAlterlblVlrAnterior.Caption := 'Sim';

    if qryCAlter.FieldByName('VALORATUAL').AsString <> '' then
    begin
      if qryCAlter.FieldByName('VALORATUAL').AsString = '0' then
         rpCAlterlblVlrAtual.Caption := 'Não'
      else
         rpCAlterlblVlrAtual.Caption := 'Sim';
    end;
  end

  else if Trim(UpperCase(qryCAlter.FieldByName('NOMECAMPO').AsString)) = 'IDAGENCIA' then
  begin
    rpCAlterlblCampo.Caption       := 'Banco/Agência';
    With qryAux do
    begin
      Close;
      SQL.Clear;
      Sql.Add('SELECT PB.NOME BANCO, PA.NOME AGENCIA ');
      Sql.Add('FROM PESSOA PA, PESSOA PB, AGENCIABANCARIA AG, BANCO B ');
      Sql.Add('WHERE AG.IDPESSOA = '+qryCAlter.FieldByName('VALORANTERIOR').AsString+'');
      Sql.Add('AND PA.IDPESSOA = AG.IDPESSOA');
      Sql.Add('AND AG.IDBANCO = B.IDPESSOA');
      Sql.Add('AND PB.IDPESSOA = B.IDPESSOA');
      Open;
      rpCAlterlblVlrAnterior.Caption := Copy(FieldByName('BANCO').AsString,1,20)+'/'+Copy(FieldByName('AGENCIA').AsString,1,20);
    end;

    if qryCAlter.FieldByName('VALORATUAL').AsString <> '' then
    begin
      With qryAux do
      begin
        Close;
        SQL.Clear;
        Sql.Add('SELECT PB.NOME BANCO, PA.NOME AGENCIA ');
        Sql.Add('FROM PESSOA PA, PESSOA PB, AGENCIABANCARIA AG, BANCO B ');
        Sql.Add('WHERE AG.IDPESSOA = '+qryCAlter.FieldByName('VALORATUAL').AsString+'');
        Sql.Add('AND PA.IDPESSOA = AG.IDPESSOA');
        Sql.Add('AND AG.IDBANCO = B.IDPESSOA');
        Sql.Add('AND PB.IDPESSOA = B.IDPESSOA');
        Open;
        rpCAlterlblVlrAtual.Caption := Copy(FieldByName('BANCO').AsString,1,20)+'/'+Copy(FieldByName('AGENCIA').AsString,1,20);
      end;
    end;
  end;

end;

procedure TdtmRelatAdmPrev.rpDemonsCalcBenefGroupHeaderBand2BeforePrint(
  Sender: TObject);
var sDescOpcoes : string;
begin
  inherited;
  sDescOpcoes := '';
  if qryDemonsCalcBenef.FieldByName('NomeValorBase1').AsString <> ''
  then begin
     sDescOpcoes := sDescOpcoes + qryDemonsCalcBenef.FieldByName('NomeValorBase1').AsString+
                                ' : '+qryDemonsCalcBenef.FieldByName('ValorBase1').AsString;
  end;

  if qryDemonsCalcBenef.FieldByName('NomeValorBase2').AsString <> ''
  then begin
     if Trim(sDescOpcoes) <> '' then sDescOpcoes := sDescOpcoes + ' - ';
     sDescOpcoes := sDescOpcoes + qryDemonsCalcBenef.FieldByName('NomeValorBase2').AsString+
                                ' : '+qryDemonsCalcBenef.FieldByName('ValorBase2').AsString;
  end;

  if qryDemonsCalcBenef.FieldByName('NomeValorBase3').AsString <> ''
  then begin
     if Trim(sDescOpcoes) <> '' then sDescOpcoes := sDescOpcoes + ' - ';
     sDescOpcoes := sDescOpcoes + qryDemonsCalcBenef.FieldByName('NomeValorBase3').AsString+
                                ' : '+qryDemonsCalcBenef.FieldByName('ValorBase3').AsString;
  end;

  if Trim(sDescOpcoes) <> ''
  then rpDemonsCalcBeneflblOpcoesBenef.Caption := ' '
  else rpDemonsCalcBeneflblOpcoesBenef.Caption := '< Não cadastrada > ';
end;

procedure TdtmRelatAdmPrev.ppDetailBand26BeforePrint(Sender: TObject);
var iDia, iMes, iAno : word;
begin
  inherited;
  DecodeDate(date, iano, iMes, iDia);
  ppCancelInadimplLblData.Caption := qryFundacao.FieldByName('Cidade').AsString+', '+IntToStr(iDia)+' de '+FormatDateTime('mmmmm', date)+' de '+ IntToStr(iAno);
end;

procedure TdtmRelatAdmPrev.rpResumoCobrGroupFooterBand2BeforePrint(
  Sender: TObject);
var rDiferencaTot : double;
begin
  inherited;
  rDiferencaTot := StrToFloat(ClienteNumero(rpResumoRecebidoPatro.Text)) -
                   StrToFloat(ClienteNumero(rpResumoEsperadoPatro.Text));
  rpDiferencaTotPatro.Text := FormatFloat('#0.00',rDiferencaTot);
end;

procedure TdtmRelatAdmPrev.ppDetailBand5BeforePrint(Sender: TObject);
Var
  sSQL, sSalarioEncontrado, sSalario, sMsgErro : String;
begin
  inherited;


  sSalario  := '0';
  sSalarioEncontrado := BuscaSalario( qryBoletas.FieldByName('IdPessJur').AsInteger,
                                      qryBoletas.FieldByName('IdPlanoPrev').AsInteger,
                                      qryBoletas.FieldByName('IdPessoa').AsInteger,
                                      qryBoletas.FieldByName('MesReferencia').AsString,
                                      qryBoletas.FieldByName('FlgInterno').AsString,
                                      sSalario,
                                      sMsgErro,
                                      dtmAPrev.qry);

  LbSalaMesRef.Caption := FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioEncontrado)));


end;

procedure TdtmRelatAdmPrev.rpBoletasBeforePrint(Sender: TObject);
begin
  inherited;
  dTotalSalRef := 0;
  dTotalSalRefPatro := 0;
  bJaImprimiuMes := False;

  rTotAlteradores := 0;
  rTotalEsperado  := 0;
  rTotalRecebido  := 0;
end;

procedure TdtmRelatAdmPrev.ppGroupFooterBand12BeforePrint(Sender: TObject);
begin
  inherited;
  pplTotalSalRef.Caption := 'Total Salário de Partcipação do '+Trim(qryBoletas.FieldByName('NomePlano').AsString)+':  '+
                            FormatFloat('#0.00',dTotalSalRef);

  dTotalSalRef := 0;
end;

procedure TdtmRelatAdmPrev.rpBoletasShape1Print(Sender: TObject);
begin
  inherited;
  pplTotalSalRefPatro.Caption := FormatFloat('###,####,###0.00',dTotalSalRefPatro);

  dTotalSalRefPatro := 0;
end;

procedure TdtmRelatAdmPrev.qryPartCedidoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryFundacao.Close;
  qryFundacao.ParamByName('PFUNDACAO').AsInteger := Sistema.IdEmpresa;
  qryFundacao.Open;
end;

procedure TdtmRelatAdmPrev.rpBoletasGroupFooterBand1AfterPrint(
  Sender: TObject);
begin
  inherited;
  rTotAlteradores := 0;
  rTotalEsperado  := 0;
  rTotalRecebido  := 0;
end;


end.


