unit DRelatGerencial;

interface
     
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt;

type
  TdtmRelatorioGerencial = class(TdtmReports)
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
    function  MostraParam(Form: string): boolean; Override;
    procedure ppHeaderBand2BeforeGenerate(Sender: TObject);
    procedure qryConsolidaMovResRealAfterOpen(DataSet: TDataSet);
    procedure qryConsolidaMovResCotasBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  dtmRelatorioGerencial: TdtmRelatorioGerencial;

  iTotTipo1     , iTotTipo2      : Double;
  // --------------------------------------
    sPagador      , sContrib       : String;
    bFaz          , bTempo         : Boolean;
    dTempo                         : TDateTime;

implementation

uses FParamRelGerencial, fParamRelGerencial02,
     fParamRelGerencial03, fParamRelGerencial04,
     fPRelConsolidaMovRes, uSistema, fAguarde, UAdmPrev;

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



function TdtmRelatorioGerencial.MostraParam(Form: string): boolean;
var frm : TForm;
begin
  if (UPPERCASE(Form)      = UpperCase('frmParamRelGerencial'))
  then frm := TfrmParamRelGerencial.Create(Application)
  Else if (UPPERCASE(Form)      = UpperCase('frmParamRelGerencial02'))
  then frm := TfrmParamRelGerencial02.Create(Application)
  Else if (UPPERCASE(Form)      = UpperCase('frmParamRelGerencial03'))
  then frm := TfrmParamRelGerencial03.Create(Application)
  Else if (UPPERCASE(Form)      = UpperCase('frmParamRelGerencial04'))
  then frm := TfrmParamRelGerencial04.Create(Application)
  Else if (UPPERCASE(Form)      = UpperCase('frmPRelConsolidaMovRes'))
  then frm := TfrmPRelConsolidaMovRes.Create(Application)
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

procedure TdtmRelatorioGerencial.ppHeaderBand2BeforeGenerate(
  Sender: TObject);
begin
  inherited;
  qryFundacao.Close;
  qryFundacao.ParamByName('PFUNDACAO').AsInteger := Sistema.IdEmpresa;
  qryFundacao.Open;
end;

procedure TdtmRelatorioGerencial.qryConsolidaMovResRealAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;

end;

procedure TdtmRelatorioGerencial.qryConsolidaMovResCotasBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;

end;

 end.


