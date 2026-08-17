{ --------------------------------------------------------------------------------------------------
 N. Chamado....: WO34233
 Dt Alteração..: 18/03/2026
 Responsável...: Paulo Nobre
 Descrição.....: PROJETO CNPJ ALFANUMÉRICO
                 .(.DFM) - Ajustando o padrão da mascara atual do CNPJ para
                  a alfanumérica: 'AA.AAA.AAA/AAAA-99'.
----------------------------------------------------------------------------------------------------
}
unit DRelatIRRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppStrtch,
  ppMemo, ppVar, ppRelatv, ppDBPipe, jpeg;

type
  TdtmRelatIRRF = class(TdtmReports)
    qryDarf: TwwQuery;
    dsDarf: TwwDataSource;
    pplDarf: TppBDEPipeline;
    rpDarf: TppReport;
    ppDetailBand1: TppDetailBand;
    rpDarfShape1: TppShape;
    rpDarfShape2: TppShape;
    rpDarfImage1: TppImage;
    rpDarfLabel1: TppLabel;
    rpDarfLabel2: TppLabel;
    rpDarfLabel3: TppLabel;
    rpDarfLabel4: TppLabel;
    rpDarfShape3: TppShape;
    rpDarfLabel5: TppLabel;
    rpDarfLabel6: TppLabel;
    rpDarfShape4: TppShape;
    rpDarfLabel7: TppLabel;
    rpDarfLabel8: TppLabel;
    rpDarfShape5: TppShape;
    rpDarfLabel9: TppLabel;
    rpDarfMemo1: TppMemo;
    rpDarfShape6: TppShape;
    rpDarfShape7: TppShape;
    rpDarfLabel10: TppLabel;
    rpDarfLabel11: TppLabel;
    rpDarfShape8: TppShape;
    rpDarfLabel12: TppLabel;
    rpDarfLabel13: TppLabel;
    rpDarfShape9: TppShape;
    rpDarfShape10: TppShape;
    rpDarfLabel14: TppLabel;
    rpDarfLabel15: TppLabel;
    rpDarfShape11: TppShape;
    rpDarfLabel16: TppLabel;
    rpDarfLabel17: TppLabel;
    rpDarfShape13: TppShape;
    rpDarfShape12: TppShape;
    rpDarfShape14: TppShape;
    rpDarfShape15: TppShape;
    rpDarfLabel18: TppLabel;
    rpDarfLabel19: TppLabel;
    rpDarfShape16: TppShape;
    rpDarfShape17: TppShape;
    rpDarfLabel20: TppLabel;
    rpDarfLabel21: TppLabel;
    rpDarfShape18: TppShape;
    rpDarfShape19: TppShape;
    rpDarfLabel22: TppLabel;
    rpDarfLabel23: TppLabel;
    rpDarfShape20: TppShape;
    rpDarfShape21: TppShape;
    rpDarfLabel25: TppLabel;
    rpDarfShape22: TppShape;
    rpDarfShape23: TppShape;
    rpDarfLabel26: TppLabel;
    rpDarfLabel27: TppLabel;
    rpDarfLabel28: TppLabel;
    rpDarfLabel29: TppLabel;
    rpDarfMemo2: TppMemo;
    rpDarfDBText2: TppDBText;
    rpDarfDBText3: TppDBText;
    rpDarfDBText4: TppDBText;
    rpDarfDBText5: TppDBText;
    rpDarfDBText6: TppDBText;
    rpDarfDBText7: TppDBText;
    rpDarfDBText8: TppDBText;
    rpDarfDBText9: TppDBText;
    rpDarfDBText10: TppDBText;
    qryAux: TwwQuery;
    pplComRendRet: TppBDEPipeline;
    dsComRendRet: TwwDataSource;
    qryComRendRet: TwwQuery;
    pplRelatDirf: TppBDEPipeline;
    dsRelatDirf: TwwDataSource;
    qryRelatDirf: TwwQuery;
    rpRelatDirf: TppReport;
    ppDetailBand3: TppDetailBand;
    rpRelatDirfLabel1: TppLabel;
    rpRelatDirfLabel2: TppLabel;
    rpRelatDirfLabel3: TppLabel;
    rpRelatDirfLabel4: TppLabel;
    rpRelatDirfLabel5: TppLabel;
    rpRelatDirfLabel6: TppLabel;
    rpRelatDirfLabel7: TppLabel;
    rpRelatDirfLabel8: TppLabel;
    rpRelatDirfLabel9: TppLabel;
    rpRelatDirfLabel10: TppLabel;
    rpRelatDirfShape1: TppShape;
    rpRelatDirfShape2: TppShape;
    rpRelatDirfShape4: TppShape;
    rpRelatDirfLabel11: TppLabel;
    rpRelatDirfLabel12: TppLabel;
    rpRelatDirfLine1: TppLine;
    rpRelatDirfLine2: TppLine;
    rpRelatDirfLabel13: TppLabel;
    rpRelatDirfLabel14: TppLabel;
    rpRelatDirfLabel15: TppLabel;
    rpRelatDirfLine3: TppLine;
    rpRelatDirfLine4: TppLine;
    rpRelatDirfLine5: TppLine;
    rpRelatDirfLine6: TppLine;
    rpRelatDirfLine7: TppLine;
    rpRelatDirfLine8: TppLine;
    rpRelatDirfLabel18: TppLabel;
    rpRelatDirfShape3: TppShape;
    rpRelatDirfLabel19: TppLabel;
    rpRelatDirfLine9: TppLine;
    rpRelatDirfLine10: TppLine;
    rpRelatDirfLine11: TppLine;
    rpRelatDirfLabel23: TppLabel;
    rpRelatDirfLabel24: TppLabel;
    rpRelatDirfLabel25: TppLabel;
    rpRelatDirfLabel26: TppLabel;
    rpRelatDirfLabel27: TppLabel;
    rpRelatDirfLine21: TppLine;
    rpRelatDirfLabel20: TppLabel;
    rpRelatDirfLine12: TppLine;
    rpRelatDirfLine13: TppLine;
    rpRelatDirfLine14: TppLine;
    rpRelatDirfLabel21: TppLabel;
    rpRelatDirfLine15: TppLine;
    rpRelatDirfLabel22: TppLabel;
    rpRelatDirfLine16: TppLine;
    rpRelatDirfLine17: TppLine;
    rpRelatDirfLine18: TppLine;
    rpRelatDirfLabel28: TppLabel;
    rpRelatDirfLine19: TppLine;
    rpRelatDirfLabel29: TppLabel;
    rpRelatDirfLine20: TppLine;
    rpRelatDirfLine22: TppLine;
    rpRelatDirfLine23: TppLine;
    rpRelatDirfLabel30: TppLabel;
    rpRelatDirfLine24: TppLine;
    rpRelatDirfLabel31: TppLabel;
    rpRelatDirfLabel32: TppLabel;
    rpRelatDirfDBText1: TppDBText;
    rpRelatDirfDBText2: TppDBText;
    rpRelatDirfShape5: TppShape;
    rpRelatDirfShape6: TppShape;
    rpRelatDirfShape7: TppShape;
    rpRelatDirfShape8: TppShape;
    rpRelatDirfShape9: TppShape;
    pplComRenJuridica: TppBDEPipeline;
    dsComRenJuridica: TwwDataSource;
    qryComRenJuridica: TwwQuery;
    rpComRenJuridica: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppLabel6: TppLabel;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine6: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine9: TppLine;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLine21: TppLine;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLine22: TppLine;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppDBText2: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine29: TppLine;
    ppLabel44: TppLabel;
    ppLine30: TppLine;
    ppLabel45: TppLabel;
    rpComRenJuridicaLine1: TppLine;
    rpComRenJuridicaLabel1: TppLabel;
    ppShape9: TppShape;
    rpComRenJuridicaLine2: TppLine;
    rpComRenJuridicaLabel2: TppLabel;
    rpComRenJuridicaDBText1: TppDBText;
    rpComRenJuridicaShape1: TppShape;
    rpComRenJuridicaLine4: TppLine;
    rpComRenJuridicaLine5: TppLine;
    rpComRenJuridicaLine6: TppLine;
    rpComRenJuridicaLine8: TppLine;
    rpComRenJuridicaLine10: TppLine;
    rpComRenJuridicaLine12: TppLine;
    rpComRenJuridicaLine14: TppLine;
    rpComRenJuridicaLine3: TppLine;
    rpComRenJuridicaLine9: TppLine;
    rpComRenJuridicaLine13: TppLine;
    rpComRenJuridicaLine16: TppLine;
    rpComRenJuridicaLine18: TppLine;
    rpComRenJuridicaLine20: TppLine;
    rpComRenJuridicaLabel3: TppLabel;
    rpComRenJuridicaLabel4: TppLabel;
    rpComRenJuridicaLabel5: TppLabel;
    rpComRenJuridicaLabel6: TppLabel;
    rpComRenJuridicaLabel7: TppLabel;
    rpComRenJuridicaLabel8: TppLabel;
    rpComRenJuridicaLabel9: TppLabel;
    rpComRenJuridicaLabel10: TppLabel;
    rpComRenJuridicaLabel11: TppLabel;
    rpComRenJuridicaLabel12: TppLabel;
    rpComRenJuridicaLabel13: TppLabel;
    rpComRenJuridicaLabel14: TppLabel;
    rpComRenJuridicaLabel15: TppLabel;
    rpComRenJuridicaLabel16: TppLabel;
    rpComRenJuridicaLabel17: TppLabel;
    rpComRenJuridicaLabel18: TppLabel;
    rpComRenJuridicaLabel19: TppLabel;
    rpComRenJuridicaLine11: TppLine;
    rpComRenJuridicaLine17: TppLine;
    rpComRenJuridicaLine21: TppLine;
    rpComRenJuridicaLine7: TppLine;
    rpComRenJuridicaLine15: TppLine;
    rpComRenJuridicaLine19: TppLine;
    rpComRenJuridicaLine22: TppLine;
    rpComRenJuridicaDBText2: TppDBText;
    rpComRenJuridicaDBText3: TppDBText;
    rpComRenJuridicaDBText4: TppDBText;
    rpComRenJuridicaDBText5: TppDBText;
    rpComRenJuridicaDBText6: TppDBText;
    rpComRenJuridicaDBText7: TppDBText;
    rpComRenJuridicaDBText8: TppDBText;
    rpComRenJuridicaDBText9: TppDBText;
    rpComRenJuridicaDBText10: TppDBText;
    rpComRenJuridicaDBText11: TppDBText;
    rpComRenJuridicaDBText12: TppDBText;
    rpComRenJuridicaDBText13: TppDBText;
    rpComRenJuridicaDBText14: TppDBText;
    rpComRenJuridicaDBText15: TppDBText;
    rpComRenJuridicaDBText16: TppDBText;
    rpComRenJuridicaDBText17: TppDBText;
    rpComRenJuridicaDBText18: TppDBText;
    rpComRenJuridicaDBText19: TppDBText;
    rpComRenJuridicaDBText20: TppDBText;
    rpComRenJuridicaDBText21: TppDBText;
    rpComRenJuridicaDBText22: TppDBText;
    rpComRenJuridicaDBText23: TppDBText;
    rpComRenJuridicaDBText24: TppDBText;
    rpComRenJuridicaDBText25: TppDBText;
    rpComRenJuridicaDBText26: TppDBText;
    rpComRenJuridicaDBText27: TppDBText;
    rpComRenJuridicaDBText28: TppDBText;
    rpComRenJuridicaDBText29: TppDBText;
    rpComRenJuridicaDBText30: TppDBText;
    rpComRenJuridicaDBText31: TppDBText;
    rpComRenJuridicaDBText32: TppDBText;
    rpComRenJuridicaDBText33: TppDBText;
    rpComRenJuridicaDBText34: TppDBText;
    rpComRenJuridicaDBText35: TppDBText;
    rpComRenJuridicaDBText36: TppDBText;
    rpComRenJuridicaDBText37: TppDBText;
    rpComRenJuridicaDBText38: TppDBText;
    rpComRenJuridicaDBText39: TppDBText;
    rpComRenJuridicaDBText40: TppDBText;
    rpComRenJuridicaDBText41: TppDBText;
    rpComRenJuridicaDBText42: TppDBText;
    rpComRenJuridicaDBText43: TppDBText;
    rpComRenJuridicaDBText44: TppDBText;
    rpComRenJuridicaDBText45: TppDBText;
    rpComRenJuridicaDBText46: TppDBText;
    rpComRenJuridicaDBText47: TppDBText;
    rpComRenJuridicaDBText48: TppDBText;
    rpComRenJuridicaDBText49: TppDBText;
    rpComRenJuridicaLabel20: TppLabel;
    rpComRenJuridicaLabel21: TppLabel;
    rpComRenJuridicaImage1: TppImage;
    rpComRenJuridicaLabel22: TppLabel;
    rpComRendRet: TppReport;
    rpComRendRetHeaderBand1: TppHeaderBand;
    rpComRendRetShape1: TppShape;
    rpComRendRetLine1: TppLine;
    rpComRendRetLabel3: TppLabel;
    rpComRendRetLabel4: TppLabel;
    rpComRendRetLabel5: TppLabel;
    rpComRendRetLabel2: TppLabel;
    rpComRendRetLabel1: TppLabel;
    ppDetailBand2: TppDetailBand;
    rpComRendRetShape6: TppShape;
    rpComRendRetShape5: TppShape;
    rpComRendRetShape8: TppShape;
    rpComRendRetShape9: TppShape;
    rpComRendRetShape10: TppShape;
    rpComRendRetShape2: TppShape;
    rpComRendRetShape3: TppShape;
    rpComRendRetLabel6: TppLabel;
    rpComRendRetLabel7: TppLabel;
    rpComRendRetLine2: TppLine;
    rpComRendRetLine3: TppLine;
    rpComRendRetLabel8: TppLabel;
    rpComRendRetLine4: TppLine;
    rpComRendRetLabel9: TppLabel;
    rpComRendRetLine5: TppLine;
    rpComRendRetLabel10: TppLabel;
    rpComRendRetLine6: TppLine;
    rpComRendRetLabel11: TppLabel;
    rpComRendRetLine7: TppLine;
    rpComRendRetLabel12: TppLabel;
    rpComRendRetShape4: TppShape;
    rpComRendRetLabel13: TppLabel;
    rpComRendRetLabel14: TppLabel;
    rpComRendRetLine8: TppLine;
    rpComRendRetLabel15: TppLabel;
    rpComRendRetLine9: TppLine;
    rpComRendRetLine10: TppLine;
    rpComRendRetLabel16: TppLabel;
    rpComRendRetLabel17: TppLabel;
    rpComRendRetLabel18: TppLabel;
    rpComRendRetLabel19: TppLabel;
    rpComRendRetLabel20: TppLabel;
    rpComRendRetLabel21: TppLabel;
    rpComRendRetLabel22: TppLabel;
    rpComRendRetLabel23: TppLabel;
    rpComRendRetLabel24: TppLabel;
    rpComRendRetLabel25: TppLabel;
    rpComRendRetLabel26: TppLabel;
    rpComRendRetLine16: TppLine;
    rpComRendRetLabel28: TppLabel;
    rpComRendRetLine17: TppLine;
    rpComRendRetLabel27: TppLabel;
    rpComRendRetLine18: TppLine;
    rpComRendRetLine19: TppLine;
    rpComRendRetLine11: TppLine;
    rpComRendRetLine12: TppLine;
    rpComRendRetLine13: TppLine;
    rpComRendRetLabel38: TppLabel;
    rpComRendRetLabel47: TppLabel;
    rpComRendRetLabel48: TppLabel;
    rpComRendRetLabel49: TppLabel;
    rpComRendRetLabel50: TppLabel;
    rpComRendRetLine20: TppLine;
    rpComRendRetLine21: TppLine;
    rpComRendRetShape7: TppShape;
    rpComRendRetLabel51: TppLabel;
    rpComRendRetLabel52: TppLabel;
    rpComRendRetLabel56: TppLabel;
    rpComRendRetLine14: TppLine;
    rpComRendRetLabel60: TppLabel;
    rpComRendRetLabel66: TppLabel;
    rpComRendRetLabel67: TppLabel;
    rpComRendRetLine15: TppLine;
    rpComRendRetLabel68: TppLabel;
    rpComRendRetLabel69: TppLabel;
    rpComRendRetLine22: TppLine;
    rpComRendRetLabel70: TppLabel;
    rpComRendRetLabel72: TppLabel;
    rpComRendRetLine23: TppLine;
    rpComRendRetLine24: TppLine;
    rpComRendRetLine25: TppLine;
    rpComRendRetLine26: TppLine;
    rpComRendRetLine27: TppLine;
    rpComRendRetLine28: TppLine;
    rpComRendRetDBText1: TppDBText;
    rpComRendRetDBText2: TppDBText;
    rpComRendRetDBText6: TppDBText;
    rpComRendRetDBText7: TppDBText;
    rpComRendRetDBText8: TppDBText;
    rpComRendRetDBText9: TppDBText;
    rpComRendRetDBText10: TppDBText;
    rpComRendRetDBText11: TppDBText;
    rpComRendRetDBText12: TppDBText;
    rpComRendRetLine29: TppLine;
    rpComRendRetLabel29: TppLabel;
    rpComRendRetLine30: TppLine;
    rpComRendRetLabel31: TppLabel;
    rpComRendRetDBText17: TppDBText;
    rpComRendRetDBText20: TppDBText;
    rpComRendRetDBText21: TppDBText;
    rpComRendRetDBText22: TppDBText;
    rpComRendRetDBText23: TppDBText;
    rpComRendRetDBText24: TppDBText;
    rpComRendRetDBText25: TppDBText;
    rpComRendRetDBText26: TppDBText;
    rpComRendRetDBText27: TppDBText;
    rpComRendRetDBText28: TppDBText;
    rpComRendRetDBText19: TppDBText;
    rpComRendRetDBText3: TppDBText;
    rpComRendRetDBText4: TppDBText;
    rpComRendRetDBText5: TppDBText;
    rpComRendRetDBText13: TppDBText;
    rpComRendRetDBText14: TppDBText;
    rpComRenJuridicaDBText50: TppDBText;
    rpComRenJuridicaDBText51: TppDBText;
    rpComRenJuridicaDBText52: TppDBText;
    rpComRenJuridicaDBText53: TppDBText;
    rpComRendRetLine31: TppLine;
    rpComRendRetLine32: TppLine;
    rpComRendRetLine33: TppLine;
    rpComRendRetLine34: TppLine;
    rpComRendRetLine35: TppLine;
    rpComRendRetLine36: TppLine;
    rpComRendRetDBText15: TppDBText;
    rpComRendRetDBText16: TppDBText;
    rpComRendRetDBText18: TppDBText;
    rpComRendRetLine37: TppLine;
    rpComRendRetLine38: TppLine;
    rpComRendRetDBText29: TppDBText;
    rpComRendRetDBText30: TppDBText;
    rpComRendRetDBText31: TppDBText;
    rpDarfDBText11: TppDBText;
    rpDarfDBText12: TppDBText;
    rpDarfLabel41: TppLabel;
    qryDarfGerado: TwwQuery;
    dsDarfGerado: TwwDataSource;
    pplDarfGerado: TppBDEPipeline;
    rpDarfGerado: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine5: TppLine;
    ppLabel11: TppLabel;
    rpDarfEmiteDBText1: TppDBText;
    rpDarfEmiteLabel1: TppLabel;
    rpDarfEmiteLabel2: TppLabel;
    rpDarfEmiteLabel3: TppLabel;
    rpDarfEmiteLabel4: TppLabel;
    rpDarfEmiteLabel5: TppLabel;
    rpDarfEmiteLabel6: TppLabel;
    rpDarfEmiteLabel7: TppLabel;
    rpDarfEmiteDBText2: TppDBText;
    rpDarfEmiteDBText3: TppDBText;
    rpDarfEmiteLabel8: TppLabel;
    rpDarfEmiteDBText4: TppDBText;
    rpDarfEmiteDBText5: TppDBText;
    rpDarfEmiteLabel10: TppLabel;
    rpDarfEmiteDBText6: TppDBText;
    rpDarfEmiteLabel11: TppLabel;
    rpDarfEmiteLabel12: TppLabel;
    rpDarfEmiteLabel13: TppLabel;
    rpDarfEmiteLabel14: TppLabel;
    rpDarfEmiteDBText7: TppDBText;
    rpDarfEmiteDBText8: TppDBText;
    rpDarfEmiteDBText9: TppDBText;
    rpDarfEmiteDBText10: TppDBText;
    rpDarfEmiteLine1: TppLine;
    rpDarfEmiteLine2: TppLine;
    rpDarfEmiteDBText11: TppDBText;
    rpDarfEmiteDBText12: TppDBText;
    rpDarfEmiteDBText13: TppDBText;
    rpDarfEmiteDBText14: TppDBText;
    rpDarfEmiteLabel15: TppLabel;
    rpDarfEmiteDBText16: TppDBText;
    rpDarfGeradoDBCalc1: TppDBCalc;
    rpDarfGeradoDBCalc2: TppDBCalc;
    rpDarfGeradoLabel1: TppLabel;
    rpDarfGeradoLabel2: TppLabel;
    qryConfDIRF: TwwQuery;
    dsConfDIRF: TwwDataSource;
    pplConfDIRF: TppBDEPipeline;
    rpConfDIRF: TppReport;
    ppHeaderBand3: TppHeaderBand;
    rpRelatDirfLabel151: TppLabel;
    ppLine7: TppLine;
    ppLabel15: TppLabel;
    ppLabel19: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine8: TppLine;
    ppLabel26: TppLabel;
    rpConfDIRFDBText1: TppDBText;
    rpConfDIRFLabel2: TppLabel;
    rpConfDIRFDBText2: TppDBText;
    rpConfDIRFDBText3: TppDBText;
    rpConfDIRFDBText4: TppDBText;
    rpConfDIRFLine1: TppLine;
    rpConfDIRFLine2: TppLine;
    rpConfDIRFLabel1: TppLabel;
    rpConfDIRFLabel3: TppLabel;
    rpConfDIRFLabel4: TppLabel;
    rpConfDIRFLabel5: TppLabel;
    rpConfDIRFLabel6: TppLabel;
    rpConfDIRFLabel7: TppLabel;
    rpConfDIRFDBText6: TppDBText;
    rpConfDIRFDBText7: TppDBText;
    rpConfDIRFDBText8: TppDBText;
    rpConfDIRFLabel8: TppLabel;
    rpConfDIRFDBText9: TppDBText;
    rpConfDIRFDBText10: TppDBText;
    rpConfDIRFDBText11: TppDBText;
    rpConfDIRFLabel9: TppLabel;
    rpConfDIRFDBText12: TppDBText;
    rpConfDIRFDBText13: TppDBText;
    rpConfDIRFDBText14: TppDBText;
    rpConfDIRFLabel10: TppLabel;
    rpConfDIRFDBText15: TppDBText;
    rpConfDIRFDBText16: TppDBText;
    rpConfDIRFDBText17: TppDBText;
    rpConfDIRFLabel11: TppLabel;
    rpConfDIRFDBText18: TppDBText;
    rpConfDIRFDBText19: TppDBText;
    rpConfDIRFDBText20: TppDBText;
    rpConfDIRFLabel12: TppLabel;
    rpConfDIRFDBText21: TppDBText;
    rpConfDIRFDBText22: TppDBText;
    rpConfDIRFDBText23: TppDBText;
    rpConfDIRFLabel13: TppLabel;
    rpConfDIRFDBText24: TppDBText;
    rpConfDIRFDBText25: TppDBText;
    rpConfDIRFDBText26: TppDBText;
    rpConfDIRFLabel14: TppLabel;
    rpConfDIRFDBText27: TppDBText;
    rpConfDIRFDBText28: TppDBText;
    rpConfDIRFDBText29: TppDBText;
    rpConfDIRFLabel15: TppLabel;
    rpConfDIRFDBText30: TppDBText;
    rpConfDIRFDBText31: TppDBText;
    rpConfDIRFDBText32: TppDBText;
    rpConfDIRFLabel16: TppLabel;
    rpConfDIRFDBText33: TppDBText;
    rpConfDIRFDBText34: TppDBText;
    rpConfDIRFDBText35: TppDBText;
    rpConfDIRFLabel17: TppLabel;
    rpConfDIRFDBText36: TppDBText;
    rpConfDIRFDBText37: TppDBText;
    rpConfDIRFDBText38: TppDBText;
    rpConfDIRFLabel18: TppLabel;
    rpConfDIRFLabel19: TppLabel;
    rpConfDIRFLabel20: TppLabel;
    rpConfDIRFLabel21: TppLabel;
    rpConfDIRFLabel22: TppLabel;
    rpConfDIRFLabel23: TppLabel;
    rpConfDIRFLine3: TppLine;
    rpConfDIRFLine4: TppLine;
    rpConfDIRFLine5: TppLine;
    rpConfDIRFLine6: TppLine;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape8: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppImage1: TppImage;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppShape14: TppShape;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppShape15: TppShape;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppShape25: TppShape;
    ppShape26: TppShape;
    ppLabel52: TppLabel;
    ppMemo1: TppMemo;
    ppDBText3: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppMemo2: TppMemo;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppShape28: TppShape;
    ppShape27: TppShape;
    ppShape29: TppShape;
    ppMemo3: TppMemo;
    qryConfIRRFAna: TwwQuery;
    dsConfIRRFAna: TwwDataSource;
    pplConfIRRFAna: TppBDEPipeline;
    rpConfIRRFAna: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel59: TppLabel;
    ppLine10: TppLine;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppDBText18: TppDBText;
    ppDetailBand7: TppDetailBand;
    ppDBText19: TppDBText;
    ppDBText23: TppDBText;
    ppLine14: TppLine;
    ppFooterBand3: TppFooterBand;
    ppLabel84: TppLabel;
    ppLine15: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLine16: TppLine;
    ppLabel85: TppLabel;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLabel86: TppLabel;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppVariable1: TppVariable;
    qryConfIRRF: TwwQuery;
    dsConfIRRF: TwwDataSource;
    pplConfIRRF: TppBDEPipeline;
    rpConfIRRF: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel67: TppLabel;
    ppLine11: TppLine;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppSystemVariable3: TppSystemVariable;
    ppLabel75: TppLabel;
    ppLine12: TppLine;
    ppSystemVariable4: TppSystemVariable;
    ppVariable2: TppVariable;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppLine17: TppLine;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppLine13: TppLine;
    lblConfIRRFPeriodo: TppLabel;
    lblConfIRRFAnaPeriodo: TppLabel;
    rpRelatDirfLabel152: TppLabel;
    qryGPS: TwwQuery;
    dsGPS: TwwDataSource;
    ppGPS: TppBDEPipeline;
    rpGPS: TppReport;
    rpGPSDtlBnd: TppDetailBand;
    rpGPSShape1: TppShape;
    rpGPSShape2: TppShape;
    rpGPSShape4: TppShape;
    rpGPSShape5: TppShape;
    rpGPSShape3: TppShape;
    rpGPSShape6: TppShape;
    rpGPSLine2: TppLine;
    rpGPSLine3: TppLine;
    rpGPSLine1: TppLine;
    rpGPSLabel3: TppLabel;
    rpGPSLabel1: TppLabel;
    rpGPSLabel2: TppLabel;
    rpGPSLabel4: TppLabel;
    rpGPSLabel5: TppLabel;
    rpGPSLabel6: TppLabel;
    rpGPSLabel7: TppLabel;
    rpGPSLabel8: TppLabel;
    rpGPSLabel9: TppLabel;
    rpGPSLabel10: TppLabel;
    rpGPSLabel11: TppLabel;
    rpGPSLabel21: TppLabel;
    rpGPSLabel12: TppLabel;
    rpGPSLabel13: TppLabel;
    rpGPSLabel14: TppLabel;
    rpGPSLabel15: TppLabel;
    rpGPSLabel17: TppLabel;
    rpGPSLabel18: TppLabel;
    rpGPSLabel19: TppLabel;
    rpGPSLabel20: TppLabel;
    rpGPSDBText1: TppDBText;
    rpGPSImage1: TppImage;
    rpGPSDBText2: TppDBText;
    rpGPSDBText3: TppDBText;
    rpGPSDBText4: TppDBText;
    rpGPSLblMes1: TppLabel;
    rpGPSDBText6: TppDBText;
    rpGPSLbl7Valor1: TppLabel;
    rpGPSLbl71: TppLabel;
    rpGPSLbl81: TppLabel;
    rpGPSLbl8Valor1: TppLabel;
    rpGPSLblTerceiros1: TppLabel;
    rpGPSLblCodPag1: TppLabel;
    rpGPSDBText5: TppDBText;
    rpGPSLabel16: TppLabel;
    rpGPSShape7: TppShape;
    rpGPSShape8: TppShape;
    rpGPSShape10: TppShape;
    rpGPSShape11: TppShape;
    rpGPSShape9: TppShape;
    rpGPSShape12: TppShape;
    rpGPSLine5: TppLine;
    rpGPSLine6: TppLine;
    rpGPSLine4: TppLine;
    rpGPSLabel24: TppLabel;
    rpGPSLabel22: TppLabel;
    rpGPSLabel23: TppLabel;
    rpGPSLabel25: TppLabel;
    rpGPSLabel26: TppLabel;
    rpGPSLabel27: TppLabel;
    rpGPSLabel28: TppLabel;
    rpGPSLabel29: TppLabel;
    rpGPSLabel30: TppLabel;
    rpGPSLabel31: TppLabel;
    rpGPSLabel32: TppLabel;
    rpGPSLabel42: TppLabel;
    rpGPSLabel33: TppLabel;
    rpGPSLabel34: TppLabel;
    rpGPSLabel35: TppLabel;
    rpGPSLabel36: TppLabel;
    rpGPSLabel38: TppLabel;
    rpGPSLabel39: TppLabel;
    rpGPSLabel40: TppLabel;
    rpGPSLabel41: TppLabel;
    rpGPSDBText7: TppDBText;
    rpGPSImage2: TppImage;
    rpGPSLblMes2: TppLabel;
    rpGPSDBText12: TppDBText;
    rpGPSLbl7Valor2: TppLabel;
    rpGPSLbl72: TppLabel;
    rpGPSLbl82: TppLabel;
    rpGPSLbl8Valor2: TppLabel;
    rpGPSLblTerceiros2: TppLabel;
    rpGPSLblCodPag2: TppLabel;
    rpGPSLabel37: TppLabel;
    rpGPSSmryBnd: TppSummaryBand;
    rpGPSGrp: TppGroup;
    rpGPSGrpHdrBnd: TppGroupHeaderBand;
    rpGPSGrpFootBnd: TppGroupFooterBand;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    qryProcura: TwwQuery;
    ppDBText40: TppDBText;
    ppLabel14: TppLabel;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppLabel76: TppLabel;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText59: TppDBText;
    upGPS: TUpdateSQL;
    rpdarfJudicial: TppReport;
    ppDetailBand9: TppDetailBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppShape30: TppShape;
    ppShape31: TppShape;
    ppShape32: TppShape;
    ppImage2: TppImage;
    ppShape33: TppShape;
    ppShape34: TppShape;
    ppShape35: TppShape;
    ppShape36: TppShape;
    ppShape37: TppShape;
    ppShape38: TppShape;
    ppImage3: TppImage;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppShape39: TppShape;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppShape40: TppShape;
    ppShape41: TppShape;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppShape42: TppShape;
    ppShape43: TppShape;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppShape44: TppShape;
    ppShape45: TppShape;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppShape46: TppShape;
    ppShape47: TppShape;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppShape48: TppShape;
    ppShape49: TppShape;
    ppLabel97: TppLabel;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppShape50: TppShape;
    ppShape51: TppShape;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLine18: TppLine;
    ppLabel107: TppLabel;
    ppLine19: TppLine;
    ppLabel108: TppLabel;
    ppDBText72: TppDBText;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppShape52: TppShape;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppDBText75: TppDBText;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppDBText76: TppDBText;
    ppShape53: TppShape;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppDBText77: TppDBText;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppDBText78: TppDBText;
    ppLine20: TppLine;
    ppLabel120: TppLabel;
    ppImage4: TppImage;
    ppImage5: TppImage;
    ppImage6: TppImage;
    ppImage7: TppImage;
    ppImage8: TppImage;
    ppImage9: TppImage;
    ppImage10: TppImage;
    ppImage11: TppImage;
    ppImage12: TppImage;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    ppShape54: TppShape;
    ppShape55: TppShape;
    ppShape56: TppShape;
    ppImage13: TppImage;
    ppShape57: TppShape;
    ppShape58: TppShape;
    ppShape59: TppShape;
    ppShape60: TppShape;
    ppShape61: TppShape;
    ppShape62: TppShape;
    ppImage14: TppImage;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppShape63: TppShape;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppShape64: TppShape;
    ppShape65: TppShape;
    ppLabel131: TppLabel;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppShape66: TppShape;
    ppShape67: TppShape;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppShape68: TppShape;
    ppShape69: TppShape;
    ppLabel138: TppLabel;
    ppLabel139: TppLabel;
    ppShape70: TppShape;
    ppShape71: TppShape;
    ppLabel140: TppLabel;
    ppLabel141: TppLabel;
    ppShape72: TppShape;
    ppShape73: TppShape;
    ppLabel142: TppLabel;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppShape74: TppShape;
    ppShape75: TppShape;
    ppLabel143: TppLabel;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppLabel146: TppLabel;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppLabel149: TppLabel;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    ppLine23: TppLine;
    ppLabel152: TppLabel;
    ppLine24: TppLine;
    ppLabel153: TppLabel;
    ppDBText91: TppDBText;
    ppLabel154: TppLabel;
    ppLabel155: TppLabel;
    ppLabel156: TppLabel;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppShape76: TppShape;
    ppLabel157: TppLabel;
    ppLabel158: TppLabel;
    ppDBText94: TppDBText;
    ppLabel159: TppLabel;
    ppLabel160: TppLabel;
    ppDBText95: TppDBText;
    ppShape77: TppShape;
    ppLabel161: TppLabel;
    ppLabel162: TppLabel;
    ppDBText96: TppDBText;
    ppLabel163: TppLabel;
    ppLabel164: TppLabel;
    ppDBText97: TppDBText;
    ppLine25: TppLine;
    ppLabel165: TppLabel;
    ppImage15: TppImage;
    ppImage16: TppImage;
    ppImage17: TppImage;
    ppImage18: TppImage;
    ppImage19: TppImage;
    ppImage20: TppImage;
    ppImage21: TppImage;
    ppImage22: TppImage;
    ppImage23: TppImage;
    ppLabel166: TppLabel;
    ppLabel167: TppLabel;
    ppLabel168: TppLabel;
    ppLabel169: TppLabel;
    ppLabel170: TppLabel;
    ppLabel171: TppLabel;
    ppLabel172: TppLabel;
    ppLabel173: TppLabel;
    ppDBText98: TppDBText;
    ppLabel174: TppLabel;
    ppDBText99: TppDBText;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel175: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    procedure rpDarfPrintingComplete(Sender: TObject);
    procedure rpComRenJuridicaLabel20Print(Sender: TObject);
    procedure rpComRenJuridicaLabel21Print(Sender: TObject);
    procedure rpConfDIRFDBText4Print(Sender: TObject);
    procedure ppDBText32Print(Sender: TObject);
    procedure ppDBText23Print(Sender: TObject);
    procedure rpGPSPrintingComplete(Sender: TObject);
    function VerificaDocINSS(CodDocINSS : LongInt) : Boolean;
  private
    { Private declarations }
  public
    function MostraParam(Form: string): boolean; override;
    function cf( value : string):string;
    { Public declarations }
  end;

var
  dtmRelatIRRF: TdtmRelatIRRF;

implementation

{$R *.DFM}

Uses uMensErro,uDataBase, DBaseDados,USistema,uFuncaoGeral,FParamDarf,FCompRendReten,
  FParamRelatDirf, FParamRelatCompRendPessJurid,FParamRelatCompRendPessFisica,
  FRParamDarfGerado, FRParamConfIRRF, FRParamGPS;


  //corrige float
function TdtmRelatIRRF.cf( value : string):string;
var
tam : integer;
i : integer;
tempo : string;
begin
   i:= 0;
   if value = '' then value := '0';
   tempo := value;
   tam := length(value);
   while i <= tam do begin
      if (tempo[i]='.')then delete(tempo,i,1);
      inc(i);
   end;
   result := tempo;
end;

function TdtmRelatIRRF.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     if (UPPERCASE(Form) = 'FRMPARAMDARF') then
        frm := TfrmParamDarf.Create(Application)
     else if (UPPERCASE(Form) = 'FRMPARAMRELATCOMPRENDPESSFIS') then
        frm := TfrmParamRelatCompRendPessFis.Create(Application)
     else if (UPPERCASE(Form) = 'FRMPARAMRELATCOMPRENDPESSJUR') then
        frm := TfrmParamRelatCompRendPessJur.Create(Application)
     else if (UPPERCASE(Form) = 'FRMPARAMRELATDIRF') then
        frm := TfrmParamRelatDirf.Create(Application)
     else if (UPPERCASE(Form) = 'FRMRPARAMCONFIRRF') then
        frm := TfrmRParamConfIRRF.Create(Application)
     else if (UPPERCASE(Form) = 'FRMRPARAMCONFIRRFANA') then
        frm := TfrmRParamConfIRRF.Create(Application)
     else if (UPPERCASE(Form) = 'FRMRPARAMDARFGERADO') then
        frm := TfrmRParamDarfGerado.Create(Application)
     else if (UPPERCASE(Form) = 'FRMRPARAMGPS') then
        frm := TfrmRParamGPS.Create(Application)
     else
        frm := nil;

     if frm = nil then
        Result := false
     else
     begin
          with frm do
          begin
               Result := (ShowModal = mrOk);
               free;
          end;
     end;
end;


procedure TdtmRelatIRRF.rpDarfPrintingComplete(Sender: TObject);
begin
  inherited;
  qryDarf.First;
  While not qryDarf.EOF do
  Begin
     //Atualiza darf como impresso.
     Try
        StartTransacao;
        qryAux.Close;
        qryAux.SQL.Text:='UPDATE DARF SET FLGIMPRESSO = ''S'' '+
                         'WHERE IDDARF = '+qryDarf.FieldByName('IDDARF').AsString;
        qryAux.ExecSQL;
        CommitTransacao;
     Except
        RollBackTransacao;
        MsgDlg('Erro na Atualização do Darf como impresso','Erro',mtError,[mbOK],0);
        Raise;
     end;
     qryDarf.Next;
  end;

end;

procedure TdtmRelatIRRF.rpComRenJuridicaLabel20Print(Sender: TObject);
begin
   inherited;
   rpComRenJuridicaLabel20.Text := FormatFloat('#,##0.00',
   strtofloat(cf(rpComRenJuridicaDBText26.Text))+strtofloat(cf(rpComRenJuridicaDBText27.Text))+
   strtofloat(cf(rpComRenJuridicaDBText28.Text))+strtofloat(cf(rpComRenJuridicaDBText29.Text))+
   strtofloat(cf(rpComRenJuridicaDBText30.Text))+strtofloat(cf(rpComRenJuridicaDBText31.Text))+
   strtofloat(cf(rpComRenJuridicaDBText32.Text))+strtofloat(cf(rpComRenJuridicaDBText33.Text))+
   strtofloat(cf(rpComRenJuridicaDBText34.Text))+strtofloat(cf(rpComRenJuridicaDBText35.Text))+
   strtofloat(cf(rpComRenJuridicaDBText36.Text))+strtofloat(cf(rpComRenJuridicaDBText37.Text)));
//
end;

procedure TdtmRelatIRRF.rpComRenJuridicaLabel21Print(Sender: TObject);
begin
   inherited;
   rpComRenJuridicaLabel21.Text := FormatFloat('#,##0.00',
   strtofloat(cf(rpComRenJuridicaDBText38.Text))+strtofloat(cf(rpComRenJuridicaDBText39.Text))+
   strtofloat(cf(rpComRenJuridicaDBText40.Text))+strtofloat(cf(rpComRenJuridicaDBText41.Text))+
   strtofloat(cf(rpComRenJuridicaDBText42.Text))+strtofloat(cf(rpComRenJuridicaDBText43.Text))+
   strtofloat(cf(rpComRenJuridicaDBText44.Text))+strtofloat(cf(rpComRenJuridicaDBText45.Text))+
   strtofloat(cf(rpComRenJuridicaDBText46.Text))+strtofloat(cf(rpComRenJuridicaDBText47.Text))+
   strtofloat(cf(rpComRenJuridicaDBText48.Text))+strtofloat(cf(rpComRenJuridicaDBText49.Text)));
//
//
end;


procedure TdtmRelatIRRF.rpConfDIRFDBText4Print(Sender: TObject);
begin
  inherited;
  if qryConfDIRF.FieldByName('TIPO').AsString = 'F' then begin
     rpConfDIRFDBText4.DisplayFormat := '999.999.999-99;0;';
  end else begin
     rpConfDIRFDBText4.DisplayFormat := 'AA.AAA.AAA/AAAA-99;0;';        // Paulo Nobre - WO34233
  end;
end;

procedure TdtmRelatIRRF.ppDBText32Print(Sender: TObject);
begin
  inherited;
  if qryConfIRRF.FieldByName('TIPO').AsString = 'F' then begin
     ppDBText32.DisplayFormat := '999.999.999-99;0;';
  end else begin
     ppDBText32.DisplayFormat := 'AA.AAA.AAA/AAAA-99;0;';              // Paulo Nobre - WO34233
  end;
end;

procedure TdtmRelatIRRF.ppDBText23Print(Sender: TObject);
begin
  inherited;
  if qryConfIRRFAna.FieldByName('TIPO').AsString = 'F' then begin
     ppDBText23.DisplayFormat := '999.999.999-99;0;';
  end else begin
     ppDBText23.DisplayFormat := 'AA.AAA.AAA/AAAA-99;0;';             // Paulo Nobre - WO34233
  end;

end;

procedure TdtmRelatIRRF.rpGPSPrintingComplete(Sender: TObject);
begin
  inherited;
  qryGPS.First;
  While not qryGPS.EOF do begin
     //Atualiza darf como impresso.
     Try //se o documento existe em docinss eu atualizo se não eu eu inclu-o
        if VerificaDocINSS(qryGPS.FieldByName('CODDOCUMENTO').AsInteger) then
           Begin
             StartTransacao;
             qryAux.Close;
             qryAux.SQL.Clear;
             qryAux.SQL.Append('UPDATE DOCINSS SET CODIGOPGTO = :PCODIGOPGTO,');
             qryAux.SQL.Append('                   COMPETENCIA = :PCOMPETENCIA,');
             qryAux.SQL.Append('                   FLGIMPRESSO = ''S''');
             qryAux.ParamByName('PCODIGOPGTO').AsString := rpGPSLblCodPag1.caption;
             qryAux.ParamByName('PCOMPETENCIA').AsString := rpGPSLblMes1.caption;
             qryAux.ExecSQL;
             CommitTransacao;
           end
        else
           Begin
             StartTransacao;
             qryAux.Close;
             qryAux.SQL.Clear;
             qryAux.SQL.Add('INSERT INTO DOCINSS(CODDOCINSS, CODIGOPGTO, COMPETENCIA, FLGIMPRESSO) VALUES( ');
             qryAux.SQL.Add(qryGPS.FieldByName('CODDOCUMENTO').AsString+',');
             qryAux.SQL.Add(''''+rpGPSLblCodPag1.caption+''',');
             qryAux.SQL.Add(''''+rpGPSLblMes1.caption+''', ''S'')');
             qryAux.ExecSQL;
             CommitTransacao;
           end;
     Except
        RollBackTransacao;
        MsgDlg('Erro na Atualização do Darf como impresso','Erro',mtError,[mbOK],0);
        Raise;
     end;
     qryGPS.Next;
  end;

end;

function TdtmRelatIRRF.VerificaDocINSS(CodDocINSS: Integer): Boolean;
begin
  with qryProcura do
    Begin
      sql.Clear;
      sql.Append('SELECT COUNT(*) AS TOTAL');
      sql.Append('  FROM DOCINSS');
      sql.Append(' WHERE CODDOCINSS = :PCODDOCINSS');
      ParamByName('PCODDOCINSS').AsInteger := CodDocINSS;
      open;
      Result := FieldByName('TOTAL').AsInteger > 0;
    end;
end;

end.
