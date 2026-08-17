{******************************************************************************

                        Sistema - Contas a Receber

 ******************************************************************************

 N. SIG.............: 118992 e 118993
 Data da Alteração..: 17/09/2021
 Responsável........: Everson Cunha
 Descrição..........: Inclusão do campo Cod. Dossiê
--------------------------------------------------------------------------------
 Data      : 12/03/2018
 Autor     : Everson Luiz Pereira da Cunha
 SIG       : SIG TIBERO
 Descrição : Melhoria em adequação ao TIBERO.
             Inserir alias nas tabelas e campos.
             Retirar INDEX, +rule, etc
 ------------------------------------------------------------------------------

  N. Sol..........: 199900
  N. Kintana......: 1924689
  Data............: 31/01/2013
  Responsável.....: Edilaine
  Descrição.......: SqlAutPagDocAlt
 ------------------------------------------------------------------------------
  N. Sol..........: 178983
  N. Kintana......: 1656753
  Data............: 20/07/2012
  Responsável.....: Douglas.Siqueira
  Descrição.......: criação do relatório Aviso de Recebimento - AR
 ------------------------------------------------------------------------------
  }

unit dRelatGerencial_AR;

interface
     
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppParameter, ppRegion,
  uCMClientDataSet, uCmSqlParams, DBClient, ppModule, raCodMod, ppMemo,
  uCmRptManager, TXComp, TXRB, CmParamReport,uCtrlRelatoriosCAPCAR,uCtrlDocumento,Math,Mask;

type
  TdtmRelatorioGerencial_AR = class(TdtmReports)
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    ppGerencial: TppBDEPipeline;
    dsGerencial: TwwDataSource;
    qryGerencial: TwwQuery;
    rpGerencial: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
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
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine3: TppLine;
    ppGererencial01: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    qryGerencial01: TwwQuery;
    dsGerencial01: TwwDataSource;
    ppGerencial01: TppBDEPipeline;
    ppLabel5: TppLabel;
    ppLine4: TppLine;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText10: TppDBText;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppDBText16: TppDBText;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLabel27: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppDBText17: TppDBText;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel30: TppLabel;
    ppDBText18: TppDBText;
    ppLabel31: TppLabel;
    qryGerencial02: TwwQuery;
    dsGerencial02: TwwDataSource;
    plGerencial02: TppBDEPipeline;
    rpGerencial02: TppReport;
    ppDetailBand3: TppDetailBand;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape5: TppShape;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    rpGerencial02DBText3: TppDBText;
    rpGerencial02DBText6: TppDBText;
    rpGerencial02DBText17: TppDBText;
    rpGerencial02Shape2: TppShape;
    rpGerencial02DBText1: TppDBText;
    rpGerencial02DBText4: TppDBText;
    rpGerencial02DBText5: TppDBText;
    rpGerencial02DBText16: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel32: TppLabel;
    ppLine14: TppLine;
    rpGerencial02SummaryBand1: TppSummaryBand;
    Ger02Sub01: TppSubReport;
    rpGerencial02ChildReport1: TppChildReport;
    rpGerencial02ChildReport1TitleBand1: TppTitleBand;
    rpGerencial02ChildReport1DBText1: TppDBText;
    rpGerencial02ChildReport1DBText2: TppDBText;
    rpGerencial02ChildReport1DBText3: TppDBText;
    rpGerencial02ChildReport1DBImage1: TppDBImage;
    rpGerencial02ChildReport1DBText4: TppDBText;
    rpGerencial02ChildReport1DBText5: TppDBText;
    rpGerencial02ChildReport1Label1: TppLabel;
    rpGerencial02ChildReport1Label2: TppLabel;
    rpGerencial02ChildReport1DBText6: TppDBText;
    lbVRS: TppLabel;
    rpGerencial02ChildReport1Label3: TppLabel;
    rpGerencial02ChildReport1Label12: TppLabel;
    lbPlano02: TppLabel;
    rpGerencial02ChildReport1DetailBand1: TppDetailBand;
    rpGerencial02ChildReport1Shape6: TppShape;
    rpGerencial02ChildReport1Shape7: TppShape;
    rpGerencial02ChildReport1Shape8: TppShape;
    rpGerencial02ChildReport1Shape9: TppShape;
    rpGerencial02ChildReport1Shape10: TppShape;
    rpGerencial02ChildReport1DBText8: TppDBText;
    rpGerencial02ChildReport1DBText9: TppDBText;
    rpGerencial02ChildReport1DBText10: TppDBText;
    dtRelatTipo: TppLabel;
    dtRelatGeral: TppLabel;
    rpGerencial02ChildReport1SummaryBand1: TppSummaryBand;
    rpGerencial02ChildReport1Label11: TppLabel;
    rpGerencial02ChildReport1DBCalc2: TppDBCalc;
    rpGerencial02ChildReport1Group1: TppGroup;
    rpGerencial02ChildReport1GroupHeaderBand1: TppGroupHeaderBand;
    rpGerencial02ChildReport1Shape1: TppShape;
    rpGerencial02ChildReport1Label4: TppLabel;
    rpGerencial02ChildReport1Shape2: TppShape;
    rpGerencial02ChildReport1Label5: TppLabel;
    rpGerencial02ChildReport1Label6: TppLabel;
    rpGerencial02ChildReport1Shape3: TppShape;
    rpGerencial02ChildReport1Label7: TppLabel;
    rpGerencial02ChildReport1Label8: TppLabel;
    rpGerencial02ChildReport1DBText7: TppDBText;
    rpGerencial02ChildReport1Shape4: TppShape;
    rpGerencial02ChildReport1Label10: TppLabel;
    rpGerencial02ChildReport1Label13: TppLabel;
    rpGerencial02ChildReport1GroupFooterBand1: TppGroupFooterBand;
    rpGerencial02ChildReport1Shape12: TppShape;
    rpGerencial02ChildReport1Shape13: TppShape;
    rpGerencial02ChildReport1Shape14: TppShape;
    rpGerencial02ChildReport1Shape15: TppShape;
    rpGerencial02ChildReport1Label9: TppLabel;
    rpGerencial02ChildReport1DBCalc1: TppDBCalc;
    Ger02Sub02: TppSubReport;
    rpGerencial02ChildReport2: TppChildReport;
    rpGerencial02TitleBand1: TppTitleBand;
    rpGerencial02DBText7: TppDBText;
    rpGerencial02DBText8: TppDBText;
    rpGerencial02DBText9: TppDBText;
    rpGerencial02DBImage1: TppDBImage;
    rpGerencial02DBText10: TppDBText;
    rpGerencial02DBText11: TppDBText;
    rpGerencial02Label16: TppLabel;
    rpGerencial02Label17: TppLabel;
    rpGerencial02DBText12: TppDBText;
    rpGerencial02Label20: TppLabel;
    lbPlano03: TppLabel;
    rpGerencial02Shape13: TppShape;
    rpGerencial02Label25: TppLabel;
    rpGerencial02Shape14: TppShape;
    rpGerencial02Label26: TppLabel;
    rpGerencial02Label27: TppLabel;
    rpGerencial02Shape15: TppShape;
    rpGerencial02Label28: TppLabel;
    rpGerencial02Label29: TppLabel;
    rpGerencial02ChildReport2Label1: TppLabel;
    rpGerencial02DetailBand1: TppDetailBand;
    rpGerencial02Shape8: TppShape;
    rpGerencial02Shape9: TppShape;
    rpGerencial02Shape10: TppShape;
    rpGerencial02Shape11: TppShape;
    rpGerencial02DBText13: TppDBText;
    rpGerencial02DBText14: TppDBText;
    rpGerencial02DBText15: TppDBText;
    dtRelatTipo02: TppLabel;
    rpGerencial02SummaryBand2: TppSummaryBand;
    rpGerencial02Shape17: TppShape;
    rpGerencial02Shape18: TppShape;
    rpGerencial02Shape19: TppShape;
    rpGerencial02Label32: TppLabel;
    rpGerencial02DBCalc9: TppDBCalc;
    rpGerencial02Group1: TppGroup;
    rpGerencial02GroupHeaderBand1: TppGroupHeaderBand;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBImage3: TppDBImage;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppDBText43: TppDBText;
    rpGerencial02Label15: TppLabel;
    lbPlano01: TppLabel;
    rpGerencial02GroupFooterBand1: TppGroupFooterBand;
    rpGerencial02Shape3: TppShape;
    rpGerencial02Shape4: TppShape;
    rpGerencial02Label14: TppLabel;
    rpGerencial02DBCalc2: TppDBCalc;
    rpGerencial02Shape5: TppShape;
    rpGerencial02DBCalc4: TppDBCalc;
    rpGerencial02Shape7: TppShape;
    rpGerencial02DBCalc3: TppDBCalc;
    rpGerencial02DBCalc7: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    rpGerencial02Shape1: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape12: TppShape;
    rpGerencial02Label1: TppLabel;
    rpGerencial02Label8: TppLabel;
    rpGerencial02Label9: TppLabel;
    rpGerencial02Label10: TppLabel;
    rpGerencial02DBText2: TppDBText;
    rpGerencial02Label2: TppLabel;
    rpGerencial02Label3: TppLabel;
    rpGerencial02Label4: TppLabel;
    rpGerencial02Label5: TppLabel;
    rpGerencial02Label6: TppLabel;
    rpGerencial02Label7: TppLabel;
    rpGerencial02Label11: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppShape15: TppShape;
    ppShape14: TppShape;
    ppLabel74: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppShape17: TppShape;
    rpGerencial02DBCalc6: TppDBCalc;
    rpGerencial02Shape6: TppShape;
    rpGerencial02DBCalc1: TppDBCalc;
    rpGerencial02DBCalc5: TppDBCalc;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    qryGerencial04: TwwQuery;
    dsGerencial04: TwwDataSource;
    plGerencial04: TppBDEPipeline;
    rpGerencial04: TppReport;
    rpGerencial04HeaderBand1: TppHeaderBand;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBImage2: TppDBImage;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    lbPatro05: TppLabel;
    lbMoeda01: TppLabel;
    rpGerencial04Label2: TppLabel;
    ppLabel35: TppLabel;
    lbPlano05: TppLabel;
    ppShape61: TppShape;
    ppLabel36: TppLabel;
    ppShape62: TppShape;
    ppLabel37: TppLabel;
    ppShape64: TppShape;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    rpGerencila04Label1: TppLabel;
    rpGerencila04Label2: TppLabel;
    rpGerencila04Label3: TppLabel;
    rpGerencial04Label1: TppLabel;
    rpGerencial04Label3: TppLabel;
    lbMesRef: TppLabel;
    lbCotacao: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppShape23: TppShape;
    ppShape21: TppShape;
    rpGerencial04Shape1: TppShape;
    rpGerencial04Shape2: TppShape;
    rpGerencial04DBText1: TppDBText;
    rpGerencial04DBText2: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLabel40: TppLabel;
    ppLine15: TppLine;
    ppSummaryBand2: TppSummaryBand;
    Rel10: TppSubReport;
    rpGerencila04ChildReport1: TppChildReport;
    rpGerencila04ChildReport1HeaderBand1: TppHeaderBand;
    rpGerencila04ChildReport1DBText1: TppDBText;
    rpGerencila04ChildReport1DBText2: TppDBText;
    rpGerencila04ChildReport1DBText3: TppDBText;
    rpGerencila04ChildReport1DBText4: TppDBText;
    rpGerencila04ChildReport1DBText5: TppDBText;
    lb10: TppLabel;
    rpGerencila04ChildReport1DBImage1: TppDBImage;
    rpGerencila04ChildReport1Label2: TppLabel;
    rpGerencila04ChildReport1Label3: TppLabel;
    lbPlano04: TppLabel;
    rpGerencila04ChildReport1Shape1: TppShape;
    rpGerencila04ChildReport1Label5: TppLabel;
    rpGerencila04ChildReport1Shape2: TppShape;
    rpGerencila04ChildReport1Label6: TppLabel;
    lbPatro04: TppLabel;
    rpGerencila04ChildReport1Label10: TppLabel;
    rpGerencila04ChildReport1Label7: TppLabel;
    rpGerencila04ChildReport1DetailBand1: TppDetailBand;
    rpGerencila04ChildReport1Line1: TppLine;
    rpGerencila04ChildReport1Line2: TppLine;
    rpGerencila04ChildReport1Line3: TppLine;
    rpGerencila04ChildReport1DBText6: TppDBText;
    rpGerencila04ChildReport1DBText7: TppDBText;
    rpGerencila04ChildReport1DBText8: TppDBText;
    rpGerencila04ChildReport1DBText9: TppDBText;
    rpGerencila04ChildReport1SummaryBand1: TppSummaryBand;
    Rel10_01: TppSubReport;
    rpGerencila04ChildReport1ChildReport1: TppChildReport;
    rpGerencila04ChildReport1ChildReport1TitleBand1: TppTitleBand;
    rpGerencila04ChildReport1ChildReport1Shape3: TppShape;
    rpGerencila04ChildReport1ChildReport1DetailBand1: TppDetailBand;
    rpGerencila04ChildReport1ChildReport1DBText1: TppDBText;
    rpGerencila04ChildReport1ChildReport1Line1: TppLine;
    rpGerencila04ChildReport1ChildReport1Line2: TppLine;
    rpGerencila04ChildReport1ChildReport1Line3: TppLine;
    rpGerencila04ChildReport1ChildReport1SummaryBand1: TppSummaryBand;
    rpGerencila04ChildReport1Shape3: TppShape;
    rpGerencila04ChildReport1Shape4: TppShape;
    rpGerencila04ChildReport1Label8: TppLabel;
    rpGerencila04ChildReport1DBCalc1: TppDBCalc;
    rpGerencila04ChildReport1DBCalc2: TppDBCalc;
    rpGerencila04ChildReport1DBCalc3: TppDBCalc;
    rpGerencial04Group1: TppGroup;
    rpGerencial04GroupHeaderBand1: TppGroupHeaderBand;
    rpGerencial04GroupFooterBand1: TppGroupFooterBand;
    ppShape68: TppShape;
    ppShape69: TppShape;
    ppShape71: TppShape;
    ppLabel41: TppLabel;
    ppDBCalc8: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    qryGerencial03: TwwQuery;
    dsGerencial03: TwwDataSource;
    plGerencial03: TppBDEPipeline;
    rpGerencial03: TppReport;
    ppDetailBand5: TppDetailBand;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape13: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    rpGerencial03Shape2: TppShape;
    rpGerencial03Shape4: TppShape;
    rpGerencial03DBText1: TppDBText;
    rpGerencial03DBText2: TppDBText;
    rpGerencial03DBText3: TppDBText;
    rpGerencial03DBText4: TppDBText;
    rpGerencial03DBText5: TppDBText;
    rpGerencial03DBText6: TppDBText;
    rpGerencial03DBText7: TppDBText;
    rpGerencial03Shape8: TppShape;
    rpGerencial03DBText9: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLabel42: TppLabel;
    ppLine16: TppLine;
    ppSummaryBand3: TppSummaryBand;
    rpGer03Sub01: TppSubReport;
    rpGerencial03ChildReport1: TppChildReport;
    rpGerencial03ChildReport1DetailBand1: TppDetailBand;
    rpGerencial03ChildReport1Shape8: TppShape;
    rpGerencial03ChildReport1Shape9: TppShape;
    rpGerencial03ChildReport1Shape10: TppShape;
    rpGerencial03ChildReport1Shape11: TppShape;
    rpGerencial03ChildReport1Shape12: TppShape;
    rpGerencial03ChildReport1DBText7: TppDBText;
    rpGerencial03ChildReport1DBText8: TppDBText;
    rpGerencial03ChildReport1DBText10: TppDBText;
    rpGerencial03ChildReport1DBText11: TppDBText;
    rpGerencial03ChildReport1DBText12: TppDBText;
    rpGerencial03ChildReport1Shape13: TppShape;
    rpGerencial03ChildReport1DBText13: TppDBText;
    rpGerencial03ChildReport1Shape14: TppShape;
    rpGerencial03ChildReport1Shape15: TppShape;
    rpGerencial03ChildReport1DBText9: TppDBText;
    rpGerencial03ChildReport1Shape17: TppShape;
    rpGerencial03ChildReport1DBText14: TppDBText;
    rpGerencial03ChildReport1FooterBand1: TppFooterBand;
    rpGerencial03ChildReport1Label1: TppLabel;
    rpGerencial03ChildReport1Line1: TppLine;
    rpGerencial03ChildReport1Group1: TppGroup;
    rpGerencial03ChildReport1GroupHeaderBand1: TppGroupHeaderBand;
    rpGerencial03ChildReport1Shape7: TppShape;
    rpGerencial03ChildReport1DBText1: TppDBText;
    rpGerencial03ChildReport1DBText2: TppDBText;
    rpGerencial03ChildReport1DBText3: TppDBText;
    rpGerencial03ChildReport1DBImage1: TppDBImage;
    rpGerencial03ChildReport1DBText4: TppDBText;
    rpGerencial03ChildReport1DBText5: TppDBText;
    lbRel08: TppLabel;
    rpGerencial03ChildReport1Label2: TppLabel;
    rpGerencial03ChildReport1Label3: TppLabel;
    lGer03Plano02: TppLabel;
    lbPatro02: TppLabel;
    rpGerencial03ChildReport1Label12: TppLabel;
    rpGerencial03ChildReport1DBText6: TppDBText;
    rpGerencial03ChildReport1Shape1: TppShape;
    rpGerencial03ChildReport1Label5: TppLabel;
    rpGerencial03ChildReport1Shape2: TppShape;
    rpGerencial03ChildReport1Label6: TppLabel;
    rpGerencial03ChildReport1Shape3: TppShape;
    lbGer03Reg02: TppLabel;
    rpGerencial03ChildReport1Shape4: TppShape;
    lbGer03Reg03: TppLabel;
    rpGerencial03ChildReport1Shape5: TppShape;
    lbGer03Reg04: TppLabel;
    rpGerencial03ChildReport1Shape6: TppShape;
    lbGer03Reg05: TppLabel;
    lbGer03Reg06: TppLabel;
    rpGerencial03ChildReport1Shape16: TppShape;
    rpGerencial03ChildReport1Label7: TppLabel;
    rpGerencial03ChildReport1Label8: TppLabel;
    rpGerencial03ChildReport1DBText15: TppDBText;
    rpGerencial03ChildReport1GroupFooterBand1: TppGroupFooterBand;
    rpGerencial03ChildReport1Shape39: TppShape;
    rpGerencial03ChildReport1Shape33: TppShape;
    rpGerencial03ChildReport1Shape27: TppShape;
    rpGerencial03ChildReport1Shape23: TppShape;
    rpGerencial03ChildReport1Shape41: TppShape;
    rpGerencial03ChildReport1Shape40: TppShape;
    rpGerencial03ChildReport1Shape18: TppShape;
    rpGerencial03ChildReport1Shape24: TppShape;
    rpGerencial03ChildReport1Shape25: TppShape;
    rpGerencial03ChildReport1Shape26: TppShape;
    rpGerencial03ChildReport1Label4: TppLabel;
    rpGerencial03ChildReport1Shape28: TppShape;
    rpGerencial03ChildReport1Shape29: TppShape;
    rpGerencial03ChildReport1DBCalc1: TppDBCalc;
    rpGerencial03ChildReport1DBCalc2: TppDBCalc;
    rpGerencial03ChildReport1DBCalc3: TppDBCalc;
    rpGerencial03ChildReport1DBCalc4: TppDBCalc;
    rpGerencial03ChildReport1DBCalc5: TppDBCalc;
    rpGerencial03ChildReport1DBCalc6: TppDBCalc;
    rpGerencial03ChildReport1DBCalc7: TppDBCalc;
    rpGerencial03ChildReport1Shape19: TppShape;
    rpGerencial03ChildReport1Shape20: TppShape;
    lbTot02Receita01: TppLabel;
    rpGerencial03ChildReport1Shape21: TppShape;
    rpGerencial03ChildReport1Shape22: TppShape;
    rpGerencial03ChildReport1Shape30: TppShape;
    rpGerencial03ChildReport1Shape31: TppShape;
    rpGerencial03ChildReport1Shape32: TppShape;
    lbTot02Receita02: TppLabel;
    lbTot02Receita04: TppLabel;
    lbTot02Receita03: TppLabel;
    lbTot02Receita05: TppLabel;
    lbTot02Receita06: TppLabel;
    rpGerencial03ChildReport1Shape34: TppShape;
    lbPart02Contrib01: TppLabel;
    rpGerencial03ChildReport1Shape35: TppShape;
    rpGerencial03ChildReport1Shape36: TppShape;
    rpGerencial03ChildReport1Shape37: TppShape;
    rpGerencial03ChildReport1Shape38: TppShape;
    lbPart02Contrib04: TppLabel;
    lbPart02Contrib03: TppLabel;
    lbPart02Contrib05: TppLabel;
    lbPart02Contrib06: TppLabel;
    rpGerencial03ChildReport1Label21: TppLabel;
    lbPart02Contrib02: TppLabel;
    rpGerencial03ChildReport1Label23: TppLabel;
    rpGerencial03ChildReport1Label24: TppLabel;
    DbTotalGeral2: TppDBText;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBImage4: TppDBImage;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    lbRel07: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    lbGer03Plano01: TppLabel;
    ppShape50: TppShape;
    ppLabel45: TppLabel;
    rpGerencial03Shape1: TppShape;
    lbReg01: TppLabel;
    rpGerencial03Shape3: TppShape;
    lbReg02: TppLabel;
    ppShape51: TppShape;
    lbReg03: TppLabel;
    ppShape52: TppShape;
    lbReg04: TppLabel;
    ppShape53: TppShape;
    lbReg05: TppLabel;
    ppShape49: TppShape;
    lbReg06: TppLabel;
    lbPatro01: TppLabel;
    rpGerencial03Label1: TppLabel;
    dbPagador: TppDBText;
    rpGerencial03Shape7: TppShape;
    rpGerencial03Label2: TppLabel;
    rpGerencial03Label4: TppLabel;
    rpGerencial03DBText10: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    rpGerencial03ChildReport2Shape2: TppShape;
    rpGerencial03Shape10: TppShape;
    rpGerencial03Label3: TppLabel;
    rpGerencial03Shape11: TppShape;
    lbTotReceita01: TppLabel;
    ppShape46: TppShape;
    ppShape47: TppShape;
    ppShape44: TppShape;
    ppShape45: TppShape;
    ppLabel46: TppLabel;
    ppShape48: TppShape;
    rpGerencial03Shape5: TppShape;
    rpGerencial03Shape6: TppShape;
    rpGerencial03DBCalc1: TppDBCalc;
    rpGerencial03DBCalc2: TppDBCalc;
    rpGerencial03DBCalc3: TppDBCalc;
    rpGerencial03DBCalc4: TppDBCalc;
    rpGerencial03DBCalc5: TppDBCalc;
    rpGerencial03DBCalc6: TppDBCalc;
    rpGerencial03Shape9: TppShape;
    rpGerencial03Shape12: TppShape;
    rpGerencial03Shape13: TppShape;
    rpGerencial03Shape14: TppShape;
    rpGerencial03Shape15: TppShape;
    rpGerencial03Shape16: TppShape;
    rpGerencial03Shape17: TppShape;
    lbTotReceita02: TppLabel;
    lbTotReceita04: TppLabel;
    lbTotReceita03: TppLabel;
    lbTotReceita05: TppLabel;
    lbTotReceita06: TppLabel;
    rpGerencial03DBCalc7: TppDBCalc;
    rpGerencial03ChildReport2Shape1: TppShape;
    lbPartContrib01: TppLabel;
    rpGerencial03ChildReport2Shape8: TppShape;
    rpGerencial03ChildReport2Shape3: TppShape;
    rpGerencial03ChildReport2Shape4: TppShape;
    rpGerencial03ChildReport2Shape5: TppShape;
    rpGerencial03ChildReport2Shape6: TppShape;
    rpGerencial03ChildReport2Shape7: TppShape;
    lbPartContrib04: TppLabel;
    lbPartContrib03: TppLabel;
    lbPartContrib05: TppLabel;
    lbPartContrib06: TppLabel;
    rpGerencial03ChildReport2Label8: TppLabel;
    rpGerencial03ChildReport2Label7: TppLabel;
    lbPartContrib02: TppLabel;
    dbTotalGeral: TppDBText;
    rpGerencial03ChildReport1Calc1: TppSystemVariable;
    rpGerencial03ChildReport1Calc2: TppSystemVariable;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    QryGer02Sub01: TwwQuery;
    dsGer02Sub01: TwwDataSource;
    plGer02Sub01: TppBDEPipeline;
    qryGer02Sub02: TwwQuery;
    dsGer02Sub02: TwwDataSource;
    plGer02Sub02: TppBDEPipeline;
    qryRegional: TwwQuery;
    qryGer03Sub01: TwwQuery;
    dsGer03Sub01: TwwDataSource;
    plGer03Sub01: TppBDEPipeline;
    pdtSQLGer03Sub01: TUpdateSQL;
    ppConsolidaMovResCotas: TppBDEPipeline;
    dsConsolidaMovResCotas: TwwDataSource;
    qryConsolidaMovResCotas: TwwQuery;
    rpConsolidaMovRes: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel47: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppFooterBand5: TppFooterBand;
    ppLine18: TppLine;
    ppLabel51: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppDBText29: TppDBText;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText37: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppLabel59: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppConsolidaMovResReal: TppBDEPipeline;
    dsConsolidaMovResReal: TwwDataSource;
    qryConsolidaMovResReal: TwwQuery;
    ppLabel60: TppLabel;
    ppDBText47: TppDBText;
    ppSubReport1: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand7: TppDetailBand;
    ppLabel62: TppLabel;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBImage5: TppDBImage;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppLabel61: TppLabel;
    ppDBText71: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppHeaderBand3: TppHeaderBand;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppDBText72: TppDBText;
    ppLabel79: TppLabel;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    updConsolidaMovResCotas: TUpdateSQL;
    updConsolidaMovResReal: TUpdateSQL;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppLabel82: TppLabel;
    ppDBText78: TppDBText;
    ppLabel83: TppLabel;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppLabel84: TppLabel;
    ppDBText81: TppDBText;
    ppShape4: TppShape;
    ppShape6: TppShape;
    ppShape11: TppShape;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppLabel63: TppLabel;
    ppDBText48: TppDBText;
    ppLabel64: TppLabel;
    ppDBText49: TppDBText;
    ppShape16: TppShape;
    ppLabel65: TppLabel;
    ppDBText82: TppDBText;
    ppLabel66: TppLabel;
    ppDBText83: TppDBText;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel70: TppLabel;
    ppLabel73: TppLabel;
    ppLabel80: TppLabel;
    ppLabel85: TppLabel;
    ppDBText84: TppDBText;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppShape22: TppShape;
    ppLabel69: TppLabel;
    ppDBText85: TppDBText;
    ppLabel88: TppLabel;
    ppDBText86: TppDBText;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppShape24: TppShape;
    ppFooterBand6: TppFooterBand;
    ppDBImage1: TppDBImage;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppLabel48: TppLabel;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    updGerencial3: TUpdateSQL;
    updGerencial2: TUpdateSQL;
    updGerencial4: TUpdateSQL;
    ppDbeRelatorioEtiqueta: TppBDEPipeline;
    qryRelatorioEtiqueta: TwwQuery;
    dsRelatorioEtiqueta: TwwDataSource;
    ppRelatorioEtiqueta: TppReport;
    rpEtiquetasColHdrBnd: TppColumnHeaderBand;
    ppDetalheRelatorioEtiqueta: TppDetailBand;
    rpEtiquetasDBText1: TppDBText;
    rpEtiquetasDBText2: TppDBText;
    rpEtiquetasDBText3: TppDBText;
    rpEtiquetasDBCampo3: TppDBText;
    rpEtiquetasDBText5: TppDBText;
    rpEtiquetasDBText6: TppDBText;
    ppDBText63: TppDBText;
    rpEtiquetaslblFuncao: TppLabel;
    rpEtiquetasColFootBnd: TppColumnFooterBand;
    rpEtiquetasSmryBnd: TppSummaryBand;
    ppDBText77: TppDBText;
    CmpRptCM: TCmParamReport;
    DevRptCM: TExtraOptions;
    CrmRptCM: TCmRptManager;
    Dsautpagdoc: TwwDataSource;
    Ppautpagdoc: TppBDEPipeline;
    PpautpagdocppField1: TppField;
    PpautpagdocppField2: TppField;
    PpautpagdocppField3: TppField;
    PpautpagdocppField4: TppField;
    PpautpagdocppField5: TppField;
    PpautpagdocppField6: TppField;
    PpautpagdocppField7: TppField;
    PpautpagdocppField8: TppField;
    PpautpagdocppField9: TppField;
    PpautpagdocppField10: TppField;
    PpautpagdocppField11: TppField;
    PpautpagdocppField12: TppField;
    PpautpagdocppField13: TppField;
    PpautpagdocppField14: TppField;
    PpautpagdocppField15: TppField;
    PpautpagdocppField16: TppField;
    PpautpagdocppField17: TppField;
    PpautpagdocppField18: TppField;
    PpautpagdocppField19: TppField;
    PpautpagdocppField20: TppField;
    PpautpagdocppField21: TppField;
    PpautpagdocppField22: TppField;
    PpautpagdocppField23: TppField;
    PpautpagdocppField24: TppField;
    PpautpagdocppField25: TppField;
    PpautpagdocppField26: TppField;
    PpautpagdocppField27: TppField;
    PpautpagdocppField28: TppField;
    PpautpagdocppField29: TppField;
    PpautpagdocppField30: TppField;
    PpautpagdocppField31: TppField;
    PpautpagdocppField32: TppField;
    PpautpagdocppField33: TppField;
    PpautpagdocppField34: TppField;
    PpautpagdocppField35: TppField;
    PpautpagdocppField36: TppField;
    PpautpagdocppField37: TppField;
    PpautpagdocppField38: TppField;
    PpautpagdocppField39: TppField;
    PpautpagdocppField40: TppField;
    PpautpagdocppField41: TppField;
    PpautpagdocppField42: TppField;
    PpautpagdocppField43: TppField;
    PpautpagdocppField44: TppField;
    PpautpagdocppField45: TppField;
    PpautpagdocppField46: TppField;
    PpautpagdocppField47: TppField;
    PpautpagdocppField48: TppField;
    rptautpagdoc: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppDetailBand16: TppDetailBand;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppFooterBand11: TppFooterBand;
    ppLabel75: TppLabel;
    ppCalc21: TppSystemVariable;
    ppCalc22: TppSystemVariable;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppLine27: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLabel81: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppLine34: TppLine;
    ppLabel92: TppLabel;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppLine38: TppLine;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel110: TppLabel;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppLine17: TppLine;
    ppLabel95: TppLabel;
    ppDBText106: TppDBText;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppRegion2: TppRegion;
    ppLabel130: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppRegion4: TppRegion;
    ppLabel131: TppLabel;
    ppDBText107: TppDBText;
    ppRegion5: TppRegion;
    ppRegion1: TppRegion;
    ppLabel118: TppLabel;
    ppLine46: TppLine;
    ppLabel120: TppLabel;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLabel129: TppLabel;
    ppLabel96: TppLabel;
    ppLine19: TppLine;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppCalc29: TppSystemVariable;
    ppLabel125: TppLabel;
    ppLabel127: TppLabel;
    ppDBText108: TppDBText;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppGroup12: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppGroup14: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppGroupFooterBand14: TppGroupFooterBand;
    ppParameterList1: TppParameterList;
    CdsDemGestAutPag: TClientDataSet;
    CdsDemGestAutPagNUMFATURA: TFloatField;
    CdsDemGestAutPagCODDOCUMENTO: TFloatField;
    CdsDemGestAutPagNUMAPGR: TFloatField;
    CdsDemGestAutPagREFERENCIA: TStringField;
    CdsDemGestAutPagNODOCUMENTO: TFloatField;
    CdsDemGestAutPagCOMPLDOCUMENTO: TStringField;
    CdsDemGestAutPagDATAVENCTO: TDateTimeField;
    CdsDemGestAutPagNUMDOCUMENTO: TStringField;
    CdsDemGestAutPagVALOR: TFloatField;
    CdsDemGestAutPagVALOROUTRAMOEDA: TFloatField;
    CdsDemGestAutPagRAZAOSOCIAL: TStringField;
    CdsDemGestAutPagDESCRICAO: TStringField;
    CdsDemGestAutPagVALORRATEIO: TFloatField;
    CdsDemGestAutPagDESCTDR: TStringField;
    CdsDemGestAutPagNOMEAP: TStringField;
    CdsDemGestAutPagNOMECR: TStringField;
    CdsDemGestAutPagNOMECC: TStringField;
    CdsDemGestAutPagOBS: TMemoField;
    CdsDemGestAutPagNUMBANCO: TStringField;
    CdsDemGestAutPagNUMAGENCIA: TStringField;
    CdsDemGestAutPagCONTACORRENTE: TStringField;
    CdsDemGestAutPagFLGDOCBANCARIO: TStringField;
    CdsDemGestAutPagVLACRE: TFloatField;
    CdsDemGestAutPagVLDEC: TFloatField;
    CdsDemGestAutPagVLIMP: TFloatField;
    CdsDemGestAutPagVLLIQ: TFloatField;
    CdsDemGestAutPagTRGUSERINCLUSAO: TStringField;
    CdsDemGestAutPagNOMEUSUARIO: TStringField;
    CdsDemGestAutPagTRGDTINCLUSAO: TDateTimeField;
    CdsDemGestAutPagTOTVALORBRUTO: TFloatField;
    CdsDemGestAutPagTOTVALORDEDUCOES: TFloatField;
    CdsDemGestAutPagTOTVALORACRESCIMO: TFloatField;
    CdsDemGestAutPagTOTVALORIMPOSTO: TFloatField;
    CdsDemGestAutPagTOTVALORAPAGAR: TFloatField;
    CdsDemGestAutPagSUMVALORBRUTO: TFloatField;
    CdsDemGestAutPagSUMVALORDEDUCOES: TFloatField;
    CdsDemGestAutPagSUMVALORACRESCIMO: TFloatField;
    CdsDemGestAutPagSUMVALORIMPOSTO: TFloatField;
    CdsDemGestAutPagSUMVALORAPAGAR: TFloatField;
    CdsDemGestAutPagNUMIMOVEL: TStringField;
    CdsDemGestAutPagNOMEPATRO: TStringField;
    CdsDemGestAutPagDESCPLANO: TStringField;
    CdsDemGestAutPagDESCPROGRAMA: TStringField;
    CdsDemGestAutPagDATAEMISSAO: TDateTimeField;
    CdsDemGestAutPagDATAPROGRAMADA: TDateTimeField;
    CdsDemGestAutPagIDFORCLI: TFloatField;
    CdsDemGestAutPagVALOLANCTOLIQ: TFloatField;
    CdsDemGestAutPagSUMVALOLANCTOLIQ: TFloatField;
    SqlAutPagDoc: TCMSqlParams;
    CdsAutPagDoc: TCMClientDataSet;
    SqlDemGestAutPag: TCMSqlParams;
    SqlNomeUsuario: TCMSqlParams;
    CdsNomeUsuario: TCMClientDataSet;
    CdsBuscaContaDocForn: TCMClientDataSet;
    SqlBuscaContaDocForn: TCMSqlParams;
    CdsBuscaContaDoc: TCMClientDataSet;
    SqlBuscaContaDoc: TCMSqlParams;
    CdsAlteraParcOrigem: TCMClientDataSet;
    SqlAlteraParcOrigem: TCMSqlParams;
    CdsAutPagDocAlt: TCMClientDataSet;
    SqlAutPagDocAlt: TCMSqlParams;
    SqlDocumFilhosAP: TCMSqlParams;
    DsDocumFilhoAP: TwwDataSource;
    SqlDocumFilhoAR: TCMSqlParams;
    DsDocumFilhoAR: TwwDataSource;
    dsCdsDemGestAutPag1: TClientDataSet;
    dsCdsDemGestAutPag1NUMFATURA: TFloatField;
    dsCdsDemGestAutPag1CODDOCUMENTO: TFloatField;
    dsCdsDemGestAutPag1NUMAPGR: TFloatField;
    dsCdsDemGestAutPag1REFERENCIA: TStringField;
    dsCdsDemGestAutPag1NODOCUMENTO: TFloatField;
    dsCdsDemGestAutPag1COMPLDOCUMENTO: TStringField;
    dsCdsDemGestAutPag1DATAVENCTO: TDateTimeField;
    dsCdsDemGestAutPag1NUMDOCUMENTO: TStringField;
    dsCdsDemGestAutPag1VALOR: TFloatField;
    dsCdsDemGestAutPag1VALOROUTRAMOEDA: TFloatField;
    dsCdsDemGestAutPag1RAZAOSOCIAL: TStringField;
    dsCdsDemGestAutPag1DESCRICAO: TStringField;
    dsCdsDemGestAutPag1VALORRATEIO: TFloatField;
    dsCdsDemGestAutPag1DESCTDR: TStringField;
    dsCdsDemGestAutPag1NOMEAP: TStringField;
    dsCdsDemGestAutPag1NOMECR: TStringField;
    dsCdsDemGestAutPag1NOMECC: TStringField;
    dsCdsDemGestAutPag1OBS: TMemoField;
    dsCdsDemGestAutPag1NUMBANCO: TStringField;
    dsCdsDemGestAutPag1NUMAGENCIA: TStringField;
    dsCdsDemGestAutPag1CONTACORRENTE: TStringField;
    dsCdsDemGestAutPag1FLGDOCBANCARIO: TStringField;
    dsCdsDemGestAutPag1VLACRE: TFloatField;
    dsCdsDemGestAutPag1VLDEC: TFloatField;
    dsCdsDemGestAutPag1VLIMP: TFloatField;
    dsCdsDemGestAutPag1VLLIQ: TFloatField;
    dsCdsDemGestAutPag1TRGUSERINCLUSAO: TStringField;
    dsCdsDemGestAutPag1NOMEUSUARIO: TStringField;
    dsCdsDemGestAutPag1TRGDTINCLUSAO: TDateTimeField;
    dsCdsDemGestAutPag1TOTVALORBRUTO: TFloatField;
    dsCdsDemGestAutPag1TOTVALORDEDUCOES: TFloatField;
    dsCdsDemGestAutPag1TOTVALORACRESCIMO: TFloatField;
    dsCdsDemGestAutPag1TOTVALORIMPOSTO: TFloatField;
    dsCdsDemGestAutPag1TOTVALORAPAGAR: TFloatField;
    dsCdsDemGestAutPag1SUMVALORBRUTO: TFloatField;
    dsCdsDemGestAutPag1SUMVALORDEDUCOES: TFloatField;
    dsCdsDemGestAutPag1SUMVALORACRESCIMO: TFloatField;
    dsCdsDemGestAutPag1SUMVALORIMPOSTO: TFloatField;
    dsCdsDemGestAutPag1SUMVALORAPAGAR: TFloatField;
    dsCdsDemGestAutPag1NUMIMOVEL: TStringField;
    dsCdsDemGestAutPag1NOMEPATRO: TStringField;
    dsCdsDemGestAutPag1DESCPLANO: TStringField;
    dsCdsDemGestAutPag1DESCPROGRAMA: TStringField;
    dsCdsDemGestAutPag1DATAEMISSAO: TDateTimeField;
    dsCdsDemGestAutPag1DATAPROGRAMADA: TDateTimeField;
    dsCdsDemGestAutPag1IDFORCLI: TFloatField;
    dsCdsDemGestAutPag1VALOLANCTOLIQ: TFloatField;
    dsCdsDemGestAutPag1SUMVALOLANCTOLIQ: TFloatField;
    raCodeModule1: TraCodeModule;
    CdsDemGestAutPagDATALANCTO: TDateField;
    PpautpagdocppField49: TppField;
    CdsDemGestAutPagCODDOSSIE: TStringField;
    ppPpautpagdocppField50: TppField;
    function  MostraParam(Form: string): boolean; Override;
    function  Arredonda(pNumero : double; pCasas : byte) : double;
    procedure ppHeaderBand2BeforeGenerate(Sender: TObject);
    Procedure BuscaContaDoc(CodDocumento: Real);    
    Procedure GravaBancoAg;

    procedure qryConsolidaMovResRealAfterOpen(DataSet: TDataSet);
    procedure qryConsolidaMovResCotasBeforeOpen(DataSet: TDataSet);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure montaregistro;
    procedure FormCreate(Sender: TObject);
  private
    sBanco, sAgencia, sAgenciaFormat, sNomeagencia, sNumeroFormat, sNomeBanco,
      sNumero, sDescTipo, sTipo, sMascaraAgencia, sMascaraConta, oldDoc: String;
    Id: double;
    rVLDEC, rVLACRE, rVLIMP, rVLLIQ: real;
    CtrlRelatoriosCAPCAR: TCtrlRelatoriosCAPCAR;
    Documento: TCtrlDocumento;
    { Private declarations }

  public
  V0,V1,V2,V3:STRING;
  cont:integer;
    { Public declarations }
  end;

var
  dtmRelatorioGerencial_AR: TdtmRelatorioGerencial_AR;

  iTotTipo1     , iTotTipo2      : Double;
  // --------------------------------------
    sPagador      , sContrib       : String;
    bFaz          , bTempo         : Boolean;
    dTempo                         : TDateTime;


implementation

{uses FParamRelGerencial, fParamRelGerencial02,
     fParamRelGerencial03, fParamRelGerencial04,
     fPRelConsolidaMovRes, uSistema, fAguarde, UAdmPrev,
  fRelEtiquetasAutoPatroc,FRelAutPag1;}

Uses dBaseDados, uString, uSistema, FRelAutPag1;
  

{$R *.DFM}

{
// DOCUMENTACAO DOS RELATORIOS GERENCIAIS

   1. Distribuição da Frequencia dos Participantes e Nao Participantes e
      Informacoes Cadastrais segundo as regionais.

      Quebra  : Patrocinadora x Plano

      Colunas : Regionais
                Participantes Ativos
                Participante Mantidos
                Total de Participantes
                Nao Participantes
                Adesao
                Salario de Participacao
                Participacao na Massa
                Sal. Particip. Nao Participante
                Media Etaria - Participantes
                Media Etaria - Nao Participantes
                Media Tempo Contribuicao - Ativos
                Media Tempo Contribuicao - Mantidos
                Media Tempo Contribuicao - Total
                Total de Beneficios
}

Procedure TdtmRelatorioGerencial_AR.BuscaContaDoc(CodDocumento: Real);
Begin
  If CdsBuscaContaDoc.Active Then
    CdsBuscaContaDoc.Close;
  SqlBuscaContaDoc.Prepare;
  SqlBuscaContaDoc.Params[0].AsFloat := CodDocumento;
  SqlBuscaContaDoc.Open;
  If Not CdsBuscaContaDoc.IsEmpty Then
  Begin
    Id := CdsBuscaContaDoc.FieldByName('IDCBANCARIA').AsFloat;
    sBanco := CdsBuscaContaDoc.FieldByName('NUMBANCO').AsString;
    sNomeBanco := CdsBuscaContaDoc.FieldByName('NOMEBANCO').AsString;
    sAgencia := CdsBuscaContaDoc.FieldByName('NUMAGENCIA').AsString;
    sNomeagencia := CdsBuscaContaDoc.FieldByName('NOMEAGENCIA').AsString;
    sNumero := CdsBuscaContaDoc.FieldByName('CONTACORRENTE').AsString;
    sDescTipo := CdsBuscaContaDoc.FieldByName('DESCTIPOCONTA').AsString;
    sTipo := CdsBuscaContaDoc.FieldByName('TIPOCONTA').AsString;
    If CdsBuscaContaDoc.FieldByName('MASCARACC').IsNull Then
    Begin
      sMascaraConta := '';
      sNumeroFormat := sNumero;
    End
    Else
    Begin
      sMascaraConta := CdsBuscaContaDoc.FieldByName('MASCARACC').AsString + ';0; ';
      sNumeroFormat := FormatMasktext(sMascaraConta, sNumero);
    End;
    If CdsBuscaContaDoc.FieldByName('MASCARACC').IsNull Then
    Begin
      sMascaraAgencia := '';
      sAgenciaFormat := sAgencia;
    End
    Else
    Begin
      sMascaraAgencia := CdsBuscaContaDoc.FieldByName('MASCARAAGENCIA').AsString + ';0; ';
      sAgenciaFormat := FormatMasktext(sMascaraAgencia, sAgencia);
    End;
  End
  Else
  Begin
    If CdsBuscaContaDocForn.Active Then
      CdsBuscaContaDocForn.Close;

    SqlBuscaContaDocForn.Prepare;
    SqlBuscaContaDocForn.Params[0].AsFloat := CodDocumento;
    SqlBuscaContaDocForn.Open;
    If Not CdsBuscaContaDocForn.IsEmpty Then
    Begin
      Id := CdsBuscaContaDocForn.FieldByName('IDCBANCARIA').AsFloat;
      sBanco := CdsBuscaContaDocForn.FieldByName('NUMBANCO').AsString;
      sNomeBanco := CdsBuscaContaDocForn.FieldByName('NOMEBANCO').AsString;
      sAgencia := CdsBuscaContaDocForn.FieldByName('NUMAGENCIA').AsString;
      sNomeagencia := CdsBuscaContaDocForn.FieldByName('NOMEAGENCIA').AsString;
      sNumero := CdsBuscaContaDocForn.FieldByName('CONTACORRENTE').AsString;
      sDescTipo := CdsBuscaContaDocForn.FieldByName('DESCTIPOCONTA').AsString;
      sTipo := CdsBuscaContaDocForn.FieldByName('TIPOCONTA').AsString;

      If CdsBuscaContaDocForn.FieldByName('MASCARACC').IsNull Then
      Begin
        sMascaraConta := '';
        sNumeroFormat := sNumero;
      End
      Else
      Begin
        sMascaraConta := CdsBuscaContaDocForn.FieldByName('MASCARACC').AsString + ';0; ';
        sNumeroFormat := FormatMasktext(sMascaraConta, sNumero);
      End;

      If CdsBuscaContaDocForn.FieldByName('MASCARAAGENCIA').IsNull Then
      Begin
        sMascaraAgencia := '';
        sAgenciaFormat := sAgencia;
      End
      Else
      Begin
        sMascaraAgencia := CdsBuscaContaDocForn.FieldByName('MASCARAAGENCIA').AsString + ';0; ';
        sAgenciaFormat := FormatMasktext(sMascaraAgencia, sAgencia);
      End;
    End
    Else
    Begin
      Id := -1;
      sBanco := '';
      sNomeBanco := '';
      sAgencia := '';
      sNomeagencia := '';
      sNumero := '';
      sDescTipo := '';
      sTipo := '0';
      sMascaraConta := '';
      sMascaraAgencia := '';
      sAgenciaFormat := '';
      sNumeroFormat := '';
    End;
  End;
End;

Procedure TdtmRelatorioGerencial_AR.GravaBancoAg;
Begin
  If Not CdsAutPagDoc.FieldByName('TRGUSERINCLUSAO').IsNull Then
  Begin
    If CdsNomeUsuario.Active Then
      CdsNomeUsuario.Close;
    SqlNomeUsuario.Prepare;
    SqlNomeUsuario.Params[0].AsFloat := StrToFloat(Copy(CdsAutPagDoc.FieldByName('TRGUSERINCLUSAO').AsString, 3,
      Length(CdsAutPagDoc.FieldByName('TRGUSERINCLUSAO').AsString)));
    SqlNomeUsuario.Open;
    CdsAutPagDoc.FieldByName('NOMEUSUARIO').AsString := CdsNomeUsuario.Fields[0].AsString;
  End
  Else
    CdsAutPagDoc.FieldByName('NOMEUSUARIO').AsString := '';

  If (CdsAutPagDoc.AutoCalcFields) And
    (CdsAutPagDoc.FieldByName('FLGDOCBANCARIO').AsString = 'S') Then
  Begin
    BuscaContaDoc(CdsAutPagDoc.FieldByName('CODDOCUMENTO').AsFloat);
    CdsAutPagDoc.FieldByName('NUMBANCO').AsString := sBanco;
    CdsAutPagDoc.FieldByName('NUMAGENCIA').AsString := sAgenciaFormat;
    CdsAutPagDoc.FieldByName('CONTACORRENTE').AsString := sNumeroFormat;
  End;
End;
function TdtmRelatorioGerencial_AR.Arredonda(pNumero : double;pCasas : byte) : double;
 var p: double;
     s: string;
begin
  p := pNumero * Power( 10, pCasas);
  s := floattostr(p);
  if pos(DecimalSeparator, s) <> 0 then
    p := round( p );
  p := p / Power( 10, pCasas );
  result:=p;
end;

procedure TdtmRelatorioGerencial_AR.montaregistro;
var
  rSaldo: real;
  iNumApGr: Integer;
  Doc: String;
begin
  CdsAutPagDoc.Edit;
  Doc := CdsAutPagDoc.FieldByName( 'CODDOCUMENTO' ).AsString;

  if OldDoc <> CdsAutPagDoc.FieldByName( 'CODDOCUMENTO' ).AsString Then
  begin

    OldDoc := CdsAutPagDoc.FieldByName( 'CODDOCUMENTO' ).AsString;
    if CdsAutPagDoc.FieldByName( 'NUMAPGR' ).IsNull Then
    begin

      // Ricardo Alves SOL: 98935 Kintana: 428807
      // gera o número da AP e armazena em iNumApGr
      if not CtrlRelatoriosCAPCAR.SetSEQAPGR(
        StrToInt( OldDoc ), CdsAutPagDoc.FieldByName( 'NUMFATURA' ).AsString,
        iNumApGr ) then
        Abort;

      CdsAutPagDoc.FieldByName( 'NUMAPGR' ).AsInteger := iNumApGr;
    end
    else
      doc := CdsAutPagDoc.FieldByName( 'CodDocumento' ).AsString;

    CdsAutPagDocAlt.Close;
    CdsAlteraParcOrigem.Close;
    Documento.Saldo.CalculaSaldo( StrToInt( Doc ) );
    rSaldo := Arredonda( Documento.Saldo.Valor, 2 );

    if not CdsAutPagDoc.FieldByName( 'NUMFATURA' ).IsNull then
    begin
      SqlAlteraParcOrigem.Prepare;
      SqlAlteraParcOrigem.Params[ 0 ].AsFloat := StrToInt( Doc );
      SqlAlteraParcOrigem.Params[ 1 ].AsFloat :=
        CdsAutPagDoc.FieldByName( 'NUMFATURA' ).AsFloat;
      SqlAlteraParcOrigem.Open;
      CdsAutPagDoc.FieldByName( 'valor' ).AsFloat :=
        Arredonda( ( CdsAutPagDoc.FieldByName( 'valor' ).AsFloat +
        CdsAlteraParcOrigem.FieldByName( 'valdecr' ).AsFloat +
        CdsAlteraParcOrigem.FieldByName( 'valimp' ).AsFloat -
        CdsAlteraParcOrigem.FieldByName( 'valacre' ).AsFloat ),
        2
        );
      CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat :=
        Arredonda( CdsAlteraParcOrigem.FieldByName( 'valdecr' ).AsFloat, 2 );
      CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat :=
        Arredonda( CdsAlteraParcOrigem.FieldByName( 'valacre' ).AsFloat, 2 );
      CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat :=
        Arredonda( CdsAlteraParcOrigem.FieldByName( 'valimp' ).AsFloat, 2 );
      CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat := rSaldo;
    end;

    SqlAutPagDocAlt.Prepare;
    SqlAutPagDocAlt.Params[ 0 ].AsFloat := StrToInt( Doc );
    SqlAutPagDocAlt.Open;

    if CdsAutPagDoc.FieldByName( 'NumFatura' ).IsNull then
    begin
      CdsAutPagDoc.FieldByName( 'Valor' ).AsFloat :=
        Arredonda( ( CdsAutPagDoc.fieldbyname( 'Valor' ).AsFloat ), 2 );
      CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat := rSaldo;
    end;

    CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat :=
      Arredonda( ( CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat +
      CdsAutPagDocAlt.FieldByName( 'valdecr' ).AsFloat ), 2 );
    CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat :=
      Arredonda( ( CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat +
      CdsAutPagDocAlt.FieldByName( 'valacre' ).AsFloat ), 2 );
    CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat :=
      Arredonda( ( CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat +
      CdsAutPagDocAlt.FieldByName( 'valimp' ).AsFloat ), 2 );

    if strtofloat( Format( '%17.2f', [
      CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat ] ) ) = 0 Then
    begin
      CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat :=
        Arredonda( ( CdsAutPagDoc.FieldByName( 'valor' ).AsFloat +
        CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat -
        CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat -
        CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat ),
        2
        );
    end;

    rVLDEC  := Arredonda( CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat, 2 );
    rVLACRE := Arredonda( CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat, 2 );
    rVLIMP  := Arredonda( CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat, 2 );
    rVLLIQ  := Arredonda( CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat, 2);
  end
  else
  begin
    CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat  := rVLDEC;
    CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat := rVLACRE;
    CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat  := rVLIMP;
    CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat  := rVLLIQ;
  end;
  GravaBancoAg;
  CdsAutPagDoc.post;
end;
function TdtmRelatorioGerencial_AR.MostraParam(Form: string): boolean;
var frm : TForm;
begin


     if (UPPERCASE(Form) = 'FRMRELAUTPAG1') then
        begin
        frm := TFrmRelAutPag1.Create(Application);
{        V0:=FrmRelAutPag1.Doc;
        v1:=FrmRelAutPag1.dblcCentroRespon.LookupValue;
        v2:=FrmRelAutPag1.DateEdit1.text;
        v3:=IntToStr(FrmRelAutPag1.RadioGroup1.itemindex);   }
        end
     else

        frm := nil;

     if frm = nil then
        Result := false
     else begin
            with frm do begin
               Result := (ShowModal = mrOk);
               free;
            end;
     end;

 { if (UPPERCASE(Form)      = UpperCase('frmParamRelGerencial'))
  then frm := TfrmParamRelGerencial.Create(Application)
  Else if (UPPERCASE(Form)      = UpperCase('frmParamRelGerencial02'))
  then frm := TfrmParamRelGerencial02.Create(Application)
  Else if (UPPERCASE(Form)      = UpperCase('frmParamRelGerencial03'))
  then frm := TfrmParamRelGerencial03.Create(Application)
  Else if (UPPERCASE(Form)      = UpperCase('frmParamRelGerencial04'))
  then frm := TfrmParamRelGerencial04.Create(Application)
  Else if (UPPERCASE(Form)      = UpperCase('frmPRelConsolidaMovRes'))
  then frm := TfrmPRelConsolidaMovRes.Create(Application)
  //Marcio Sanches Spinosa SOL 172882 KINTANA 1601494 - Inicio
  Else if (UPPERCASE(Form)      = UpperCase('frmRelEtiquetasAutoPatroc'))
  then frm := TfrmRelEtiquetasAutoPatroc.Create(Application)
  //Marcio Sanches Spinosa SOL 172882 KINTANA 1601494 - Fim
  else frm := nil;

  if frm = nil
  then Result := false
  else begin
     with frm do
     begin
        Result := (ShowModal = mrOk);
        Free;
     end;
   end;          }
end;

procedure TdtmRelatorioGerencial_AR.ppHeaderBand2BeforeGenerate(
  Sender: TObject);
begin
  inherited;
  qryFundacao.Close;
  qryFundacao.ParamByName('PFUNDACAO').AsInteger := Sistema.IdEmpresa;
  qryFundacao.Open;
end;

procedure TdtmRelatorioGerencial_AR.qryConsolidaMovResRealAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
//  frmAguarde.Apaga;

end;

procedure TdtmRelatorioGerencial_AR.qryConsolidaMovResCotasBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
//  frmAguarde.Mostra('Aguarde... Montando Relatório.');
//  frmAguarde.Repaint;

end;

 procedure TdtmRelatorioGerencial_AR.CrmRptCMBeforePrint(Sender: TObject);
var
 x: integer;

Begin
  Inherited;

if cont = 1 then
begin
cont:=0;
{        V0:=Frm.Doc;
        v1:=FrmRelAutPag1.dblcCentroRespon.LookupValue;
        v2:=FrmRelAutPag1.DateEdit1.text;
        v3:=IntToStr(FrmRelAutPag1.RadioGroup1.itemindex);}

  With SqlAutPagDoc Do
  Begin
    SQL.Clear;
//    SQL.Add('SELECT /*+ RULE */ NUMFATURA, CODDOCUMENTO, NUMAPGR, REFERENCIA, NODOCUMENTO,  ');  //Everson TIBERO
    SQL.Add('SELECT NUMFATURA, CODDOCUMENTO, NUMAPGR, REFERENCIA, NODOCUMENTO,  ');  //Everson TIBERO
    SQL.Add('  CODDOSSIE,                                                       '); //Everson Cunha - SIG118992 e 118993
    SQL.Add('  COMPLDOCUMENTO, DATAVENCTO, DATAEMISSAO,DATALANCTO, DATAPROGRAMADA, NUMDOCUMENTO,       ');
    SQL.Add('  round(VALOR,2) as valor, round(VALOROUTRAMOEDA,2) as VALOROUTRAMOEDA, RAZAOSOCIAL, DESCRICAO, round(VALORRATEIO,2) as VALORRATEIO, ');
    SQL.Add('  DESCTDR, NOMEAP, NOMECR, NOMECC, OBS, FLGDOCBANCARIO, round(VLACRE,2) as VLACRE,                ');
    SQL.Add('  round(VLDEC,2) AS VLDEC, round(VLIMP,2) as VLIMP, round(VLLIQ,2) as VLLIQ, TRGUSERINCLUSAO,                                        ');
    SQL.Add('  TO_DATE(TO_CHAR(TRGDTINCLUSAO,''DD/MM/YYYY''),''DD/MM/YYYY'') AS TRGDTINCLUSAO,  ');
    SQL.Add('  (0) AS TOTVALORBRUTO, (0) AS TOTVALORDEDUCOES, (0) AS TOTVALORACRESCIMO,     ');
    SQL.Add('  (0) AS TOTVALORIMPOSTO, (0) AS TOTVALORAPAGAR, (0) AS SUMVALORBRUTO,         ');
    SQL.Add('  (0) AS SUMVALORDEDUCOES, (0) AS SUMVALORACRESCIMO, (0) AS SUMVALORIMPOSTO,   ');
    SQL.Add('  (0) AS SUMVALORAPAGAR, NUMIMOVEL, NOMEPATRO, DESCPLANO, DESCPROGRAMA,        ');
    SQL.Add('  IDFORCLI, (0) AS VALOLANCTOLIQ, (0) AS SUMVALOLANCTOLIQ,                     ');
    SQL.Add('  ''                    '' AS NOMEUSUARIO,                                     ');
    SQL.Add('  ''                    '' AS NUMBANCO,                                        ');
    SQL.Add('  ''                    '' AS NUMAGENCIA,                                      ');
    SQL.Add('  ''                    '' AS CONTACORRENTE,                                   ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('  NOMEPATROORIGEM, DESCPLANOORIGEM                                             ');
    // Fim Ricardo

    SQL.Add('FROM                                                                           ');
    SQL.Add('  (SELECT D.NUMFATURA, D.CODDOCUMENTO, D.NUMAPGR, D.REFERENCIA,                ');
    //SQL.Add('          D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAVENCTO, D.DATAEMISSAO,L.DATALANCTO,        ');     //Everson Cunha - SIG118992 e 118993
    SQL.Add('          D.NODOCUMENTO, D.CODDOSSIE, D.COMPLDOCUMENTO, D.DATAVENCTO, D.DATAEMISSAO,L.DATALANCTO, '); //Everson Cunha - SIG118992 e 118993
    SQL.Add('          D.DATAPROGRAMADA, P.NUMDOCUMENTO,                                    ');
    SQL.Add('          decode(d.recpag, ''P'', decode(l.debcre,''C'',round(L.VALOR,2) ,round(l.valor,2)*-1),   ');
    SQL.Add('             decode(l.debcre, ''D'', round(L.VALOR,2), round(l.valor,2) * -1)) as valor, ');
    SQL.Add('          decode(d.recpag,''P'',decode(l.debcre,''C'',round(L.VALOROUTRAMOEDA,2),       ');
    SQL.Add('             round(L.VALOROUTRAMOEDA,2)*-1),                                            ');
    SQL.Add('             decode(l.debcre,''D'',round(L.VALOROUTRAMOEDA,2),round(L.VALOROUTRAMOEDA,2)*-1 )    ');
    SQL.Add('                ) valoroutramoeda,                                          ');
    SQL.Add('          P.RAZAOSOCIAL, F.DESCRICAO, round(SUM(round(RD.VALOR,2)),2) AS VALORRATEIO,            ');
    SQL.Add('          TDR.DESCRICAO AS DESCTDR, AP.NOME AS NOMEAP, CR.NOME AS NOMECR,      ');

    //Marcus Oliveira P. 26056 09/08/2007
    SQL.Add('          (CC.NOME) AS NOMECC,              ');

    SQL.Add('          D.OBS, F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO, (0) AS VLACRE,         ');
    SQL.Add('         (0) AS VLDEC, (0) AS VLIMP, (0) AS VLLIQ, D.TRGUSERINCLUSAO,          ');
    SQL.Add('         D.TRGDTINCLUSAO, RD.NUMIMOVEL, PATRO.NOME AS NOMEPATRO,               ');
    SQL.Add('         PLANO.NOME AS DESCPLANO, PROGRAMA.DESCPROGRAMA, D.IDFORCLI,           ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('          PATROO.NOME AS NOMEPATROORIGEM, PLANOO.NOME AS DESCPLANOORIGEM       ');
    // fim Ricardo

    SQL.Add('   FROM PESSOA P, PESSOA PATRO, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM RD,    ');
    SQL.Add('        FORMARECPAG F, TIPORECEBDESEMB TDR, CENTCUST CC, UNIDNEGOCIO AP,       ');
    //início - André Tavares - pendência 16330 - 30/04/2004
    SQL.Add('        CENTRESPON CR, PLANPREVCONTABIL PLANO, PROGRAMA , tipodocrecpag tpd    ');
    //fim - André Tavares - pendência 16330 - 30/04/2004

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('        , PLANPREVCONTABIL PLANOO, PESSOA PATROO                                 ');
    // fim Ricardo

    SQL.Add('   WHERE                                                                       ');
    SQL.Add('-- #ADF1                                                                       ');
    SQL.Add('-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA             ');

    //início - André Tavares - pendência 16330 - 30/04/2004
    SQL.Add(' d.CODTIPDOC = tpd.CODTIPDOC and ');
    SQL.Add('  ((tpd.FLGIMPRIMEAP IS NULL) OR (tpd.FLGIMPRIMEAP = ''S'')) and ' );
    //fim    - André Tavares - pendência 16330 - 30/04/2004

    If ( V1<>'') Or ( V2<>'') Then
//    If (Not DtmRptAutPag1.CmpRptCM.ParamValues[1].IsNull) Or (Not DtmRptAutPag1.CmpRptCM.ParamValues[2].IsNull) Then
    Begin
      Case StrToInt(V3) Of
//      Case StrToInt(V3) Of
        0: SQL.Add('   (d.numapgr is not null) and ');
        1: SQL.Add('   (d.numapgr is  null) and ');
      End;
      If (V1<>'') Then
        SQL.Add('   rtrim(RD.CODCENTRORESPON) = ' + #39 + Espaco(V1, 10) + #39 + ' and ');
      If (V2<>'') Then
        SQL.Add('   to_char(d.TRGDTINCLUSAO,''dd/mm/yyyy'') = ' + #39 + V2 + #39 + ' and ');
    End
    Else
      SQL.Add('   d.coddocumento = ' + V0 + '  and ');
    SQL.Add('        D.CODTIPDOC IN                                                         ');
    SQL.Add('    (SELECT CODTIPDOC                                                          ');
    SQL.Add('     FROM TIPODOCRECPAG A                                                      ');
    SQL.Add('     WHERE A.RECPAG = :RECPAG AND                                              ');
    SQL.Add('           NOT EXISTS(SELECT *                                                 ');
    SQL.Add('                      FROM USUARIOXTPDOCTO B                                   ');
    SQL.Add('                      WHERE RECPAG= :RECPAG AND                                ');
    SQL.Add('                            B.IDUSUARIO = :IDUSUARIO                           ');
    SQL.Add('                      )                                                        ');
    SQL.Add('     UNION                                                                     ');
    SQL.Add('     SELECT CODTIPDOC                                                          ');
    SQL.Add('     FROM TIPODOCRECPAG A                                                      ');
    SQL.Add('     WHERE A.RECPAG = :RECPAG AND                                              ');
    SQL.Add('           EXISTS (SELECT *                                                    ');
    SQL.Add('                   FROM USUARIOXTPDOCTO B                                      ');
    SQL.Add('                   WHERE RECPAG = :RECPAG AND                                  ');
    SQL.Add('                         A.CODTIPDOC = B.CODTIPDOC AND                         ');
    SQL.Add('                         B.IDUSUARIO = :IDUSUARIO                              ');
    SQL.Add('                  )                                                            ');
    SQL.Add('     ) AND                                                                     ');
    SQL.Add('      (d.numfatura is null) and                                                ');
    SQL.Add('      (L.ESTORNO IS NULL) AND                                                  ');
    SQL.Add('      (D.RECPAG = :RECPAG) AND                                                 ');
    SQL.Add('      (D.IDPESSOA =  :IDPESSOA) AND                                            ');
    SQL.Add('      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                                    ');
    SQL.Add('      (D.OPERACAO = L.OPERACAO) AND                                            ');
    SQL.Add('      (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND                                   ');
    SQL.Add('      (P.IDPESSOA = D.IDFORCLI) AND                                            ');
    SQL.Add('      (D.CODFORMA = F.CODFORMA(+)) AND                                         ');
    SQL.Add('      (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND                           ');
    SQL.Add('      (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND                                     ');
    SQL.Add('      (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND                              ');
    SQL.Add('      (TDR.RECPAG(+) = RD.RECPAG) AND                                          ');
    SQL.Add('      (TDR.IDPESSOA(+) = RD.IDPESSOA) AND                                      ');
    SQL.Add('      (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND                                     ');
    SQL.Add('      (AP.IDPESSOA(+) = RD.IDPESSOA) AND                                       ');
    SQL.Add('      (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND                         ');
    SQL.Add('      (CR.IDPESSOA(+) = RD.IDPESSOA) AND                                       ');
    SQL.Add('      (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND                              ');
    SQL.Add('      (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND                             ');
    SQL.Add('      (PATRO.IDPESSOA(+) = RD.IDPATRO)                                         ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('      AND (PLANOO.IDPLANOPREV(+) = RD.IDPLANOORIGEM)                           ');
    SQL.Add('      AND (PATROO.IDPESSOA(+) = RD.IDPATROORIGEM)                              ');
    // fim Ricardo
    //William M. Santos - Ini
    SQL.Add('      AND NOT EXISTS (SELECT 1                                                 ');
    SQL.Add('                        FROM DOCUMXDOCUM DXD                                   ');
    SQL.Add('                       WHERE D.CODDOCUMENTO = DXD.IDDOCUMENTO)                 ');
    //William M. Santos - Fim
    SQL.Add('    GROUP BY L.VALOR, D.NUMFATURA, D.CODDOCUMENTO, D.NUMAPGR,                  ');
    //SQL.Add('             D.REFERENCIA, D.NODOCUMENTO, D.COMPLDOCUMENTO,                    '); //Everson Cunha - SIG118992 e 118993
    SQL.Add('             D.REFERENCIA, D.NODOCUMENTO, D.CODDOSSIE, D.COMPLDOCUMENTO,         '); //Everson Cunha - SIG118992 e 118993
    SQL.Add('             D.DATAVENCTO, D.DATAEMISSAO,L.DATALANCTO, D.DATAPROGRAMADA,                    ');
    SQL.Add('             P.NUMDOCUMENTO, d.recpag, l.debcre, L.VALOROUTRAMOEDA,            ');
    SQL.Add('             P.RAZAOSOCIAL, F.DESCRICAO, TDR.DESCRICAO, AP.NOME,               ');
    SQL.Add('             CR.NOME, CC.NOME, D.OBS, F.FLGDADOSBANCARIOS, D.TRGUSERINCLUSAO,  ');
    SQL.Add('             D.TRGDTINCLUSAO, RD.NUMIMOVEL, PATRO.NOME, PLANO.NOME,            ');
    SQL.Add('             PROGRAMA.DESCPROGRAMA, D.IDFORCLI                                 ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('             , PATROO.NOME, PLANOO.NOME                                          ');
    // fim Ricardo

    SQL.Add('    UNION                                                                      ');
    SQL.Add('    SELECT Q1.NUMFATURA, Q1.CODDOCUMENTO, Q1.NUMAPGR, Q1.REFERENCIA,           ');
    //SQL.Add('           Q1.NODOCUMENTO, Q1.COMPLDOCUMENTO, Q1.DATAVENCTO,                   '); //Everson Cunha - SIG118992 e 118993
    SQL.Add('           Q1.NODOCUMENTO, Q1.CODDOSSIE, Q1.COMPLDOCUMENTO, Q1.DATAVENCTO,       '); //Everson Cunha - SIG118992 e 118993
    SQL.Add('           Q1.DATAEMISSAO,Q1.DATALANCTO, Q1.DATAPROGRAMADA, Q1.NUMDOCUMENTO, round(Q1.VALOR,2) AS VALOR,       ');
    SQL.Add('           Q1.VALOROUTRAMOEDA, Q1.RAZAOSOCIAL, Q1.DESCRICAO,                   ');
    SQL.Add('           round(SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)),2) AS VALORRATEIO,              ');
    SQL.Add('           Q2.DESCTDR, Q2.NOMEAP, Q2.NOMECR, Q2.NOMECC, Q1.OBS,                ');
    SQL.Add('           Q1.FLGDOCBANCARIO, (0) AS VLACRE, (0) AS VLDEC, (0) AS VLIMP,       ');
    SQL.Add('           (0) AS VLLIQ, Q1.TRGUSERINCLUSAO, Q1.TRGDTINCLUSAO,                 ');
    SQL.Add('           Q2.NUMIMOVEL, Q2.NOMEPATRO, Q2.DESCPLANO, Q2.DESCPROGRAMA,          ');
    SQL.Add('           Q1.IDFORCLI                                                         ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('           , Q2.NOMEPATROORIGEM, Q2.DESCPLANOORIGEM                            ');
    // fim Ricardo

    SQL.Add('    FROM                                                                       ');
    SQL.Add('        (SELECT DOC.NUMFATURA, DOC.CODDOCUMENTO, DOC.NUMAPGR, DOC.REFERENCIA,  ');
    //SQL.Add('            DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO, DOC.DATAVENCTO,               '); //Everson Cunha - SIG118992 e 118993
    SQL.Add('            DOC.NODOCUMENTO, DOC.CODDOSSIE, DOC.COMPLDOCUMENTO, DOC.DATAVENCTO,  '); //Everson Cunha - SIG118992 e 118993
    SQL.Add('            DOC.DATAEMISSAO,LAN.DATALANCTO, DOC.DATAPROGRAMADA, P.NUMDOCUMENTO,               ');
    SQL.Add('            decode(doc.recpag,''P'',decode(lan.debcre,''C'',                   ');
    SQL.Add('              round(Lan.VALOR,2),round(lan.valor,2)*-1),                                         ');
    SQL.Add('              decode(lan.debcre,''D'',round(Lan.VALOR,2),round(lan.valor,2)*-1)) as valor,       ');
    SQL.Add('            decode(doc.recpag,''P'',decode(lan.debcre,''C'',Lan.VALOROUTRAMOEDA,');
    SQL.Add('                Lan.VALOROUTRAMOEDA*-1),decode(lan.debcre,''D'',               ');
    SQL.Add('                Lan.VALOROUTRAMOEDA,                                           ');
    SQL.Add('                Lan.VALOROUTRAMOEDA*-1)) as valoroutramoeda,                   ');
    SQL.Add('            P.RAZAOSOCIAL, F.DESCRICAO, DOC.OBS,                               ');
    SQL.Add('            F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO, (0) AS VLACRE, (0) AS VLDEC,');
    SQL.Add('            (0) AS VLIMP, (0) AS VLLIQ, DOC.TRGUSERINCLUSAO,                   ');
    SQL.Add('            DOC.TRGDTINCLUSAO, DOC.IDFORCLI                                    ');
    SQL.Add('          FROM PESSOA P, DOCUMENTO DOC, LANCTODOCUM LAN, FORMARECPAG F         ');
    SQL.Add('          WHERE                                                                ');
    SQL.Add('-- #ADF2                                                                       ');
    SQL.Add('-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA             ');
    If (V1<>'') Or (V2<>'') Then
    Begin
      If (V2<>'') Then
        SQL.Add('   to_char(doc.TRGDTINCLUSAO,''dd/mm/yyyy'') = ' + #39 + V2 + #39 + ' and ');
      Case StrToInt(V3) Of
        0: SQL.Add('   (doc.numapgr is not null) and ');
        1: SQL.Add('   (doc.numapgr is null) and ');
      End;
    End
    Else
      SQL.Add('   doc.coddocumento = ' + V0 + ' and ');
    SQL.Add('            DOC.CODTIPDOC IN                                                   ');
    SQL.Add('            (SELECT CODTIPDOC                                                  ');
    SQL.Add('              FROM TIPODOCRECPAG A                                             ');
    SQL.Add('              WHERE A.RECPAG = :RECPAG AND                                     ');
    SQL.Add('                NOT EXISTS(SELECT *                                            ');
    SQL.Add('                           FROM USUARIOXTPDOCTO B                              ');
    SQL.Add('                           WHERE RECPAG = :RECPAG AND                          ');
    SQL.Add('                                 B.IDUSUARIO = :IDUSUARIO)                     ');
    SQL.Add('UNION                                                                          ');
    SQL.Add('             SELECT CODTIPDOC                                                  ');
    SQL.Add('             FROM TIPODOCRECPAG A                                              ');
    SQL.Add('             WHERE A.RECPAG = :RECPAG AND                                      ');
    SQL.Add('                   EXISTS(SELECT *                                             ');
    SQL.Add('                          FROM USUARIOXTPDOCTO B                               ');
    SQL.Add('                          WHERE RECPAG = :RECPAG AND                           ');
    SQL.Add('                                A.CODTIPDOC = B.CODTIPDOC AND                  ');
    SQL.Add('                                B.IDUSUARIO = :IDUSUARIO)                      ');
    SQL.Add('            ) AND                                                              ');
    SQL.Add('            (LAN.ESTORNO IS NULL) AND                                          ');
    SQL.Add('            (DOC.RECPAG = :RECPAG) AND                                         ');
    SQL.Add('            (DOC.IDPESSOA = :IDPESSOA) AND                                     ');
    SQL.Add('            (P.IDPESSOA = DOC.IDFORCLI)AND                                     ');
    SQL.Add('            (DOC.CODFORMA = F.CODFORMA(+)) AND                                 ');
    SQL.Add('            (RTRIM(LAN.OPERACAO) IN (''3'',''13'')) AND                        ');
    SQL.Add('            (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)                              ');
    //William M. Santos - Ini
    SQL.Add('              AND NOT EXISTS (SELECT 1                                         ');
    SQL.Add('                        FROM DOCUMXDOCUM DXD                                   ');
    SQL.Add('                       WHERE DOC.CODDOCUMENTO = DXD.IDDOCUMENTO)                 ');
    //William M. Santos - Fim

    SQL.Add('        ) Q1,                                                                  ');
    SQL.Add('        (SELECT D.NUMFATURA,(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',      ');
    SQL.Add('                  round(Rd.VALOR,2), round(Rd.VALOR,2) * -1),                                    ');
    SQL.Add('                DECODE(L.DEBCRE, ''D'', round(Rd.VALOR,2), round(Rd.VALOR,2) * -1))) as valor,   ');
    SQL.Add('            TDR.DESCRICAO AS DESCTDR,                                          ');
    SQL.Add('            AP.NOME AS NOMEAP,                                                 ');
    SQL.Add('            CR.NOME AS NOMECR,                                                 ');
    SQL.Add('            (CC.NOME) AS NOMECC,            ');
    SQL.Add('            RD.NUMIMOVEL,PATRO.NOME AS NOMEPATRO,                              ');
    SQL.Add('            PLANO.NOME AS DESCPLANO,                                           ');
    SQL.Add('            PROGRAMA.DESCPROGRAMA                                              ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('            , PATROO.NOME AS NOMEPATROORIGEM, PLANOO.NOME AS DESCPLANOORIGEM   ');
    // fim Ricardo

    SQL.Add('          FROM PESSOA PATRO, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM RD,       ');
    SQL.Add('            TIPORECEBDESEMB TDR, CENTCUST CC, UNIDNEGOCIO AP, CENTRESPON CR,   ');
    SQL.Add('            PLANPREVCONTABIL PLANO, PROGRAMA                                   ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('            , PLANPREVCONTABIL PLANOO, PESSOA PATROO                           ');
    // fim Ricardo

    SQL.Add('          WHERE                                                                ');
    SQL.Add('-- #ADF3                                                                       ');
    SQL.Add('-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA             ');
    If (V1<>'') Then
      SQL.Add('   rtrim(RD.CODCENTRORESPON) = ' + #39 + Espaco(V1, 10) + #39 + ' and ');
    SQL.Add('            (D.RECPAG = :RECPAG) AND                                           ');
    SQL.Add('            d.coddocumento=l.coddocumento and                                  ');
    SQL.Add('            l.operacao=d.operacao and                                          ');
    SQL.Add('            (D.IDPESSOA =  :IDPESSOA) AND                                      ');
    SQL.Add('            (D.NUMFATURA IS NOT NULL) AND                                      ');
    SQL.Add('            (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND                     ');
    SQL.Add('            (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND                               ');
    SQL.Add('            (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND                             ');
    SQL.Add('            (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND                        ');
    SQL.Add('            (TDR.RECPAG(+) = RD.RECPAG) AND                                    ');
    SQL.Add('            (TDR.IDPESSOA(+) = RD.IDPESSOA) AND                                ');
    SQL.Add('            (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND                               ');
    SQL.Add('            (AP.IDPESSOA(+) = RD.IDPESSOA) AND                                 ');
    SQL.Add('            (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND                   ');
    SQL.Add('            (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND                        ');
    SQL.Add('            (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND                       ');
    SQL.Add('            (PATRO.IDPESSOA(+) = RD.IDPATRO) AND                               ');
    SQL.Add('            (CR.IDPESSOA(+) = RD.IDPESSOA)                                     ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('            AND (PLANOO.IDPLANOPREV(+) = RD.IDPLANOORIGEM)                     ');
    sql.Add('            AND (PATROO.IDPESSOA(+) = RD.IDPATROORIGEM)                        ');
    // fim Ricardo

    //William M. Santos - Ini
    SQL.Add('            AND NOT EXISTS (SELECT 1                                           ');
    SQL.Add('                      FROM DOCUMXDOCUM DXD                                     ');
    SQL.Add('                     WHERE D.CODDOCUMENTO = DXD.IDDOCUMENTO)                   ');
    //William M. Santos - Fim


    SQL.Add('        ) Q2,                                                                  ');
    SQL.Add('        (SELECT D.NUMFATURA, sum(decode(d.recpag, ''P'', decode(l.debcre,      ');
    SQL.Add('                  ''C'', round(L.VALOR,2), round(l.valor,2)*-1), decode(l.debcre, ''D'', round(L.VALOR,2),');
    SQL.Add('                  round(l.valor,2)*-1))) as valor                                       ');
    SQL.Add('          FROM DOCUMENTO D, LANCTODOCUM L                                      ');
    SQL.Add('          WHERE (L.ESTORNO IS NULL) AND                                        ');
    SQL.Add('            (D.RECPAG= :RECPAG) AND                                            ');
    SQL.Add('            (D.IDPESSOA = :IDPESSOA) AND                                       ');
    SQL.Add('            (RTRIM(L.OPERACAO) IN (''1'',''11'')) AND                          ');
    SQL.Add('            (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                              ');
    SQL.Add('            (D.OPERACAO = L.OPERACAO) AND                                      ');
    SQL.Add('            (D.NUMFATURA IS NOT NULL)                                          ');

    //William M. Santos - Ini
    SQL.Add('            AND NOT EXISTS (SELECT 1                                           ');
    SQL.Add('                      FROM DOCUMXDOCUM DXD                                     ');
    SQL.Add('                     WHERE D.CODDOCUMENTO = DXD.IDDOCUMENTO)                   ');
    //William M. Santos - Fim


    SQL.Add('          GROUP BY D.NUMFATURA                                                 ');
    SQL.Add('        ) Q3                                                                   ');
    SQL.Add('      WHERE                                                                    ');
    SQL.Add('        (Q1.NUMFATURA = Q2.NUMFATURA) AND                                      ');
    SQL.Add('        (Q3.NUMFATURA = Q2.NUMFATURA)                                          ');
    SQL.Add('      GROUP BY                                                                 ');
    SQL.Add('        Q1.NUMFATURA, Q1.CODDOCUMENTO, Q1.NUMAPGR, Q1.REFERENCIA,              ');
    //SQL.Add('        Q1.NODOCUMENTO, Q1.COMPLDOCUMENTO, Q1.DATAVENCTO, Q1.DATAEMISSAO,Q1.DATALANCTO,      ');        //Everson Cunha - SIG118992 e 118993
    SQL.Add('        Q1.NODOCUMENTO, Q1.CODDOSSIE, Q1.COMPLDOCUMENTO, Q1.DATAVENCTO, Q1.DATAEMISSAO,Q1.DATALANCTO, '); //Everson Cunha - SIG118992 e 118993
    SQL.Add('        Q1.DATAPROGRAMADA, Q1.NUMDOCUMENTO, Q1.VALOR, Q1.VALOROUTRAMOEDA,      ');
    SQL.Add('        Q1.RAZAOSOCIAL, Q1.DESCRICAO, Q2.DESCTDR, Q2.NOMEAP, Q2.NOMECR,        ');
    SQL.Add('        Q2.NOMECC, Q1.OBS, Q1.FLGDOCBANCARIO, Q1.TRGUSERINCLUSAO,              ');
    SQL.Add('        Q1.TRGDTINCLUSAO, Q2.NUMIMOVEL, Q2.NOMEPATRO, Q2.DESCPLANO,            ');
    SQL.Add('        Q2.DESCPROGRAMA,Q1.IDFORCLI                                            ');

    // Ricardo A. SOL 122623 KTN 603580
    SQL.Add('        , Q2.DESCPLANOORIGEM, Q2.NOMEPATROORIGEM)                                ');
    // fim Ricardo

    sql.Add(' ORDER BY CODDOCUMENTO, DESCPLANO                                              ');
    Prepare;
    Parambyname('RECPAG').AsString := 'R';//Douglas.Siqueira
//    Parambyname('RECPAG').AsString := ParamIntegra.RecPag;
//    Parambyname('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
//    Parambyname('IDUSUARIO').AsFloat := CrmRptCM.IdUsuario;
    Parambyname('IDPESSOA').AsFloat :=  (Sistema.IdEmpresa);
    Parambyname('IDUSUARIO').AsFloat :=  (Sistema.IdEmpresa);

    Open;

    //William M. Santos - 26/01/2010 - Ini
    //Query para trazer os documentos filhos referentes a Contas a Pagar
  {  With SqlDocumFilhosAP Do
    begin
      SQL.Clear;
      SQL.Add('SELECT R.CODDOCUMENTO, DF.NODOCUMENTO as CAPDOCUMENTO,                                                       ');
      SQL.Add('       R.CODTIPRECDES,                                                       ');
      SQL.Add('       R.RECPAG,                                                             ');
      SQL.Add('       R.IDPESSOA,                                                           ');
      SQL.Add('       R.IDRESERVAORCAMEN,                                                   ');
      SQL.Add('       R.CODCENTRORESPON,                                                    ');
      SQL.Add('       C.CODEXTERNO AS CODEXTERNOCR,                                         ');
      SQL.Add('       R.UNIDNEGOC,                                                          ');
      SQL.Add('       R.MOECODIGO,                                                          ');
      SQL.Add('       R.VALOR,                                                              ');
      SQL.Add('       R.VALOROUTRAMOEDA,                                                    ');
      SQL.Add('       t.PLACONTACREDITO,                                                    ');
      SQL.Add('       R.IDUSUARIOINCLUSAO,                                                  ');
      SQL.Add('       U.NOME,                                                               ');
      SQL.Add('       C.NOME,                                                               ');
      SQL.Add('       R.CODCENTROCUSTO,                                                     ');
      SQL.Add('       CC.CODEXTERNO as CODEXTERNOCC,                                        ');
      SQL.Add('       R.IDRATEIODOCUM,                                                      ');
      SQL.Add('       T.DESCRICAO,                                                          ');
      SQL.Add('       I.MOESIGLA,                                                           ');
      SQL.Add('       CC.NOME AS NOMECENTROCUSTO,                                           ');
      SQL.Add('       R.PLANO,                                                              ');
      SQL.Add('       R.IDPATRO,                                                            ');
      SQL.Add('       R.IDPROGRAMA,                                                         ');
      SQL.Add('       PROGRAMA.FLGTIPOPROGRAMA,                                             ');
      SQL.Add('       R.NUMIMOVEL,                                                          ');
      SQL.Add('       PATRO.NOME AS NOMEPATRO,                                              ');
      SQL.Add('       PLANO.NOME AS DESCPLANO,                                              ');
      SQL.Add('       PROGRAMA.DESCPROGRAMA,                                                ');
      SQL.Add('       T.HITCODHIST,                                                         ');
      SQL.Add('       R.IDPLANOPREV,                                                        ');
      SQL.Add('       RESERVAORCAMEN.NUMRESERVA,                                            ');
      SQL.Add('       T.FLGOBRIGARESERVA,                                                   ');
      SQL.Add('       RESERVAORCAMEN.NUMRESERVA AS NUMRESERVAOLD,                           ');
      SQL.Add('       R.VALOR AS VALORRESERVAOLD,                                           ');
      SQL.Add('       R.VLRRESORCAMEN,                                                      ');
      SQL.Add('       -1 AS IDSEGREGACRITER,                                                ');
      SQL.Add('       0 AS CODSUBCONTA,                                                     ');
      SQL.Add('       0 AS CODSUBCONTAPASS,                                                 ');
      SQL.Add('       IDPLANOVIRTUAL,                                                       ');
      SQL.Add('       IDSEGREGACONTR,                                                       ');
      SQL.Add('       T.FLGOBRQTDECOTAS,                                                    ');
      SQL.Add('       R.IDPATROORIGEM,                                                      ');
      SQL.Add('       R.IDPLANOORIGEM,                                                      ');
      SQL.Add('       PATROORIGEM.NOME AS NOMEPATROORIGEM,                                  ');
      SQL.Add('       PLANOORIGEM.NOME AS DESCPLANOORIGEM                                   ');
      SQL.Add('  FROM RATEIODOCUM R,                                                        ');
      SQL.Add('       UNIDNEGOCIO U,                                                        ');
      SQL.Add('       CENTRESPON C,                                                         ');
      SQL.Add('       TIPORECEBDESEMB T,                                                    ');
      SQL.Add('       MOEDA I,                                                              ');
      SQL.Add('       CENTCUST CC,                                                          ');
      SQL.Add('       PESSOA PATRO,                                                         ');
      SQL.Add('       PLANPREVCONTABIL PLANO,                                               ');
      SQL.Add('       PROGRAMA,                                                             ');
      SQL.Add('       RESERVAORCAMEN,                                                       ');
      SQL.Add('       PESSOA PATROORIGEM,                                                   ');
      SQL.Add('       PLANPREVCONTABIL PLANOORIGEM,                                         ');
      SQL.Add('       DOCUMENTO DOC,                                                        ');
      SQL.Add('       DOCUMXDOCUM DXD, DOCUMENTO DF                                                       ');

      SQL.Add('WHERE (DOC.CODDOCUMENTO = ' + V0 + ')          ');

      SQL.Add('      AND (T.CODTIPRECDES = R.CODTIPRECDES)  AND (DF.CODDOCUMENTO = R.CODDOCUMENTO)                                   ');
      SQL.Add('      AND (T.RECPAG = R.RECPAG)                                              ');
      SQL.Add('      AND (T.IDPESSOA = R.IDPESSOA)                                          ');
      SQL.Add('      AND (U.UNIDNEGOC = R.UNIDNEGOC)                                        ');
      SQL.Add('      AND (U.IDPESSOA = R.IDPESSOA)                                          ');
      SQL.Add('      AND (I.MOECODIGO(+) = R.MOECODIGO)                                     ');
      SQL.Add('      AND (C.CODCENTRORESPON(+) = R.CODCENTRORESPON)                         ');
      SQL.Add('      AND (CC.IDEMPRESA(+) = R.IDPESSOA)                                     ');
      SQL.Add('      AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))                          ');
      SQL.Add('      AND (C.IDPESSOA(+) = R.IDPESSOA)                                       ');
      SQL.Add('      AND (PLANO.IDPLANOPREV(+) = R.IDPLANOPREV)                             ');
      SQL.Add('      AND (PROGRAMA.IDPROGRAMA(+) = R.IDPROGRAMA)                            ');
      SQL.Add('      AND (PATRO.IDPESSOA(+) = R.IDPATRO)                                    ');
      SQL.Add('      AND (RESERVAORCAMEN.IDRESERVAORCAMEN(+) = R.IDRESERVAORCAMEN)          ');
      SQL.Add('      AND (PLANOORIGEM.IDPLANOPREV(+) = R.IDPLANOORIGEM)                     ');
      SQL.Add('      AND (PATROORIGEM.IDPESSOA(+) = R.IDPATROORIGEM)                        ');

      SQL.Add('      AND DXD.IDDOCUMENTOPAI = DOC.CODDOCUMENTO                              ');
      SQL.Add('      AND DXD.IDDOCUMENTO = R.CODDOCUMENTO                                   ');
      SQL.Add('      AND R.RECPAG = ''R''                                                   ');///TROQUEI PARA TESTE
//      SQL.Add('      AND R.RECPAG = ''P''                                                   ');

      if not CdsAutPagDoc.IsEmpty  then
      begin
        Prepare;
        Open;
      end;
    end;


    //Query para trazer os documentos filhos referentes a Contas a Receber
{    With SqlDocumFilhoAR Do
    begin
      SQL.Clear;
      SQL.Add('SELECT R.CODDOCUMENTO,DF.NODOCUMENTO as CARDOCUMENTO,                         ');
      SQL.Add('       R.CODTIPRECDES,                                                       ');
      SQL.Add('       R.RECPAG,                                                             ');
      SQL.Add('       R.IDPESSOA,                                                           ');
      SQL.Add('       R.IDRESERVAORCAMEN,                                                   ');
      SQL.Add('       R.CODCENTRORESPON,                                                    ');
      SQL.Add('       C.CODEXTERNO AS CODEXTERNOCR,                                         ');
      SQL.Add('       R.UNIDNEGOC,                                                          ');
      SQL.Add('       R.MOECODIGO,                                                          ');
      SQL.Add('       R.VALOR,                                                              ');
      SQL.Add('       R.VALOROUTRAMOEDA,                                                    ');
      SQL.Add('       t.PLACONTACREDITO,                                                    ');
      SQL.Add('       R.IDUSUARIOINCLUSAO,                                                  ');
      SQL.Add('       U.NOME,                                                               ');
      SQL.Add('       C.NOME,                                                               ');
      SQL.Add('       R.CODCENTROCUSTO,                                                     ');
      SQL.Add('       CC.CODEXTERNO as CODEXTERNOCC,                                        ');
      SQL.Add('       R.IDRATEIODOCUM,                                                      ');
      SQL.Add('       T.DESCRICAO,                                                          ');
      SQL.Add('       I.MOESIGLA,                                                           ');
      SQL.Add('       CC.NOME AS NOMECENTROCUSTO,                                           ');
      SQL.Add('       R.PLANO,                                                              ');
      SQL.Add('       R.IDPATRO,                                                            ');
      SQL.Add('       R.IDPROGRAMA,                                                         ');
      SQL.Add('       PROGRAMA.FLGTIPOPROGRAMA,                                             ');
      SQL.Add('       R.NUMIMOVEL,                                                          ');
      SQL.Add('       PATRO.NOME AS NOMEPATRO,                                              ');
      SQL.Add('       PLANO.NOME AS DESCPLANO,                                              ');
      SQL.Add('       PROGRAMA.DESCPROGRAMA,                                                ');
      SQL.Add('       T.HITCODHIST,                                                         ');
      SQL.Add('       R.IDPLANOPREV,                                                        ');
      SQL.Add('       RESERVAORCAMEN.NUMRESERVA,                                            ');
      SQL.Add('       T.FLGOBRIGARESERVA,                                                   ');
      SQL.Add('       RESERVAORCAMEN.NUMRESERVA AS NUMRESERVAOLD,                           ');
      SQL.Add('       R.VALOR AS VALORRESERVAOLD,                                           ');
      SQL.Add('       R.VLRRESORCAMEN,                                                      ');
      SQL.Add('       -1 AS IDSEGREGACRITER,                                                ');
      SQL.Add('       0 AS CODSUBCONTA,                                                     ');
      SQL.Add('       0 AS CODSUBCONTAPASS,                                                 ');
      SQL.Add('       IDPLANOVIRTUAL,                                                       ');
      SQL.Add('       IDSEGREGACONTR,                                                       ');
      SQL.Add('       T.FLGOBRQTDECOTAS,                                                    ');
      SQL.Add('       R.IDPATROORIGEM,                                                      ');
      SQL.Add('       R.IDPLANOORIGEM,                                                      ');
      SQL.Add('       PATROORIGEM.NOME AS NOMEPATROORIGEM,                                  ');
      SQL.Add('       PLANOORIGEM.NOME AS DESCPLANOORIGEM                                   ');
      SQL.Add('  FROM RATEIODOCUM R,                                                        ');
      SQL.Add('       UNIDNEGOCIO U,                                                        ');
      SQL.Add('       CENTRESPON C,                                                         ');
      SQL.Add('       TIPORECEBDESEMB T,                                                    ');
      SQL.Add('       MOEDA I,                                                              ');
      SQL.Add('       CENTCUST CC,                                                          ');
      SQL.Add('       PESSOA PATRO,                                                         ');
      SQL.Add('       PLANPREVCONTABIL PLANO,                                               ');
      SQL.Add('       PROGRAMA,                                                             ');
      SQL.Add('       RESERVAORCAMEN,                                                       ');
      SQL.Add('       PESSOA PATROORIGEM,                                                   ');
      SQL.Add('       PLANPREVCONTABIL PLANOORIGEM,                                         ');
      SQL.Add('       DOCUMENTO DOC,                                                        ');
      SQL.Add('       DOCUMXDOCUM DXD, DOCUMENTO DF                                                       ');

      SQL.Add('WHERE (DOC.CODDOCUMENTO = ' + V0 + ')          ');

      SQL.Add('      AND (T.CODTIPRECDES = R.CODTIPRECDES)  AND (DF.CODDOCUMENTO = R.CODDOCUMENTO)                                   ');
      SQL.Add('      AND (T.RECPAG = R.RECPAG)                                              ');
      SQL.Add('      AND (T.IDPESSOA = R.IDPESSOA)                                          ');
      SQL.Add('      AND (U.UNIDNEGOC = R.UNIDNEGOC)                                        ');
      SQL.Add('      AND (U.IDPESSOA = R.IDPESSOA)                                          ');
      SQL.Add('      AND (I.MOECODIGO(+) = R.MOECODIGO)                                     ');
      SQL.Add('      AND (C.CODCENTRORESPON(+) = R.CODCENTRORESPON)                         ');
      SQL.Add('      AND (CC.IDEMPRESA(+) = R.IDPESSOA)                                     ');
      SQL.Add('      AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))                          ');
      SQL.Add('      AND (C.IDPESSOA(+) = R.IDPESSOA)                                       ');
      SQL.Add('      AND (PLANO.IDPLANOPREV(+) = R.IDPLANOPREV)                             ');
      SQL.Add('      AND (PROGRAMA.IDPROGRAMA(+) = R.IDPROGRAMA)                            ');
      SQL.Add('      AND (PATRO.IDPESSOA(+) = R.IDPATRO)                                    ');
      SQL.Add('      AND (RESERVAORCAMEN.IDRESERVAORCAMEN(+) = R.IDRESERVAORCAMEN)          ');
      SQL.Add('      AND (PLANOORIGEM.IDPLANOPREV(+) = R.IDPLANOORIGEM)                     ');
      SQL.Add('      AND (PATROORIGEM.IDPESSOA(+) = R.IDPATROORIGEM)                        ');

      SQL.Add('      AND DXD.IDDOCUMENTOPAI = DOC.CODDOCUMENTO                              ');
      SQL.Add('      AND DXD.IDDOCUMENTO = R.CODDOCUMENTO                                   ');
      SQL.Add('      AND R.RECPAG = ''R''                                                   ');

      if not CdsAutPagDoc.IsEmpty  then
      begin
        Prepare;
        Open;
      end;
    end;     }
    //William M. Santos - 26/01/2010 - Fim
  End;
  OldDoc := '';
  SqlDemGestAutPag.Open;
  While Not CdsAutPagDoc.Eof Do
  Begin
    MontaRegistro;

    CdsDemGestAutPag.Append;
    For X := 0 To CdsAutPagDoc.FieldCount - 1 Do
    Begin
      If CdsDemGestAutPag.FindField(CdsAutPagDoc.Fields[x].FieldName) <> Nil Then
        Case CdsAutPagDoc.FieldByName(CdsAutPagDoc.Fields[x].FieldName).DataType Of
          ftBoolean:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsBoolean := CdsAutPagDoc.Fields[x].AsBoolean;
          ftSmallint, ftInteger, ftWord, ftBytes:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsInteger := CdsAutPagDoc.Fields[x].AsInteger;
          ftFloat, ftCurrency:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsFloat := CdsAutPagDoc.Fields[x].AsFloat;
          ftString:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsString := CdsAutPagDoc.Fields[x].AsString;
          ftDate, ftTime, ftDateTime:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsDateTime := CdsAutPagDoc.Fields[x].AsDateTime;
        Else
          CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).Value := CdsAutPagDoc.Fields[x].Value;
        End;
    End;
    CdsDemGestAutPag.Post;
    CdsAutPagDoc.Next;
  End;
end;
end;

procedure TdtmRelatorioGerencial_AR.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRelatoriosCAPCAR := TCtrlRelatoriosCAPCAR.Create;
  CtrlRelatoriosCAPCAR.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  Documento := TCtrlDocumento.Create;
  Documento.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
end;

end.


