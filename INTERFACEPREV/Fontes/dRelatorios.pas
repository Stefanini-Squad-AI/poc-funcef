unit dRelatorios;

// Alterações:
{---------------------------------------------------------------------------------------------------
Rotina      :
Pendência   :
Autor(a)    :
Data        :
Alteração   :
----------------------------------------------------------------------------------------------------
Rotina      : - (qryEstatisticaSPC)
Pendência   : 26370
Autor(a)    : André Pontes
Data        : 23/10/2007
Alteração   : alteração da query para exibir todos os códigos, mesmo que zerados, com retirada da
              cláusula
              HAVING
              SUM(E.TOTANTERIOR) + SUM(E.TOTCONCEDIDO) + SUM(E.TOTCANCELADO) <> 0
----------------------------------------------------------------------------------------------------
Rotina      : rpInterfCadAnalitico
Pendência   : 19809
Autor(a)    : Leo
Data        : 04/08/2004
Alteração   : mudança no relatório rpInterfCadAnalitico para inclusão da situação funcional
----------------------------------------------------------------------------------------------------
Rotina      :
Autor(a)    : Leo
Data        : 09/02/2004
Alteração   : acerto geral do relatório para SPC
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows , Messages, SysUtils, Classes, Graphics, Controls, Forms   , Dialogs,
  dReports, ppCtrls , ppBands , ppClass, ppPrnabl, ppProd  , ppReport, Db     ,
  DBTables, Wwquery , Wwdatsrc, ppComm , ppCache , ppDB    , ppDBBDE,
  ppStrtch, ppSubRpt, ppVar, ppRelatv, ppDBPipe, ppModule, daDataModule,
  ExtCtrls;

type
  TdtmRelatorios = class(TdtmReports)
    qryAUX2                          : TwwQuery;
    dsAUX2                           : TwwDataSource;
    qryResRubRec                     : TwwQuery;
    dsResRubRec                      : TwwDataSource;
    ppResRubRec                      : TppBDEPipeline;
    rpResRubRec                      : TppReport;
    ppHeaderBand1                    : TppHeaderBand;
    ppLabel1                         : TppLabel;
    ppLine1                          : TppLine;
    ppLabel2                         : TppLabel;
    ppDetailBand1                    : TppDetailBand;
    ppFooterBand1                    : TppFooterBand;
    ppLine2                          : TppLine;
    ppLabel3                         : TppLabel;
    rpResRubRecLabel1                : TppLabel;
    rpResRubRecDBText1               : TppDBText;
    rpResRubRecLabel2                : TppLabel;
    rpResRubRecDBText2               : TppDBText;
    rpResRubRecLabel3                : TppLabel;
    rpResRubRecDBText3               : TppDBText;
    rpResRubRecLabel4                : TppLabel;
    rpResRubRecDBText4               : TppDBText;
    rpResRubRecLabel5                : TppLabel;
    rpResRubRecLabel6                : TppLabel;
    rpResRubRecLabel7                : TppLabel;
    rpResRubRecLabel8                : TppLabel;
    rpResRubRecLine1                 : TppLine;
    rpResRubRecDBText5               : TppDBText;
    rpResRubRecDBText6               : TppDBText;
    rpResRubRecDBText7               : TppDBText;
    rpResRubRecDBText8               : TppDBText;
    qryResRubRecNOME                 : TStringField;
    qryResRubRecFLGTPRUBRICA         : TStringField;
    qryResRubRecFLGATRASODEVOL       : TStringField;
    qryResRubRecFLGDESCONTO          : TStringField;
    qryResRubRecIDRUBRICA            : TFloatField;
    qryResRubRecDESCRPROVDESC        : TStringField;
    qryResRubRecQTDE                 : TFloatField;
    qryResRubRecTOTAL                : TFloatField;
    lblDescTip                       : TppLabel;
    lblDescInc                       : TppLabel;
    lblTotSituacao                   : TppLabel;
    lblDescSit                       : TppLabel;
    lblTotTipo                       : TppLabel;
    lblTotIncidencia                 : TppDBCalc;
    rpResRubRecLabel9                : TppLabel;
    lblMes                           : TppLabel;
    rpResRubRecLine2                 : TppLine;
    qryEvSalPart                     : TwwQuery;
    dsEvSalPart                      : TwwDataSource;
    ppEvSalPart                      : TppBDEPipeline;
    rpEvSalPart                      : TppReport;
    ppHeaderBand2                    : TppHeaderBand;
    ppLabel4                         : TppLabel;
    ppLine3                          : TppLine;
    ppLabel5                         : TppLabel;
    ppDetailBand2                    : TppDetailBand;
    ppFooterBand2                    : TppFooterBand;
    ppLine4                          : TppLine;
    ppLabel6                         : TppLabel;
    rpEvSalPartLabel1                : TppLabel;
    rpEvSalPartDBText1               : TppDBText;
    rpEvSalPartLabel2                : TppLabel;
    lblMesCob                        : TppLabel;
    rpEvSalPartLabel4                : TppLabel;
    rpEvSalPartLine1                 : TppLine;
    rpEvSalPartLine2                 : TppLine;
    rpEvSalPartDBText2               : TppDBText;
    rpEvSalPartDBText4               : TppDBText;
    rpEvSalPartDBText5               : TppDBText;
    rpEvSalPartDBText6               : TppDBText;
    rpEvSalPartDBText7               : TppDBText;
    rpEvSalPartDBText8               : TppDBText;
    rpEvSalPartDBText9               : TppDBText;
    rpEvSalPartDBText10              : TppDBText;
    rpEvSalPartDBText11              : TppDBText;
    rpEvSalPartDBText12              : TppDBText;
    rpEvSalPartDBText13              : TppDBText;
    rpEvSalPartDBText26              : TppDBText;
    rpEvSalPartDBText3               : TppDBText;
    lblMes11                         : TppLabel;
    lblMes10                         : TppLabel;
    lblMes09                         : TppLabel;
    lblMes08                         : TppLabel;
    lblMes07                         : TppLabel;
    lblMes06                         : TppLabel;
    lblMes05                         : TppLabel;
    lblMes04                         : TppLabel;
    lblMes03                         : TppLabel;
    lblMes02                         : TppLabel;
    lblMes01                         : TppLabel;
    lblMesInf                        : TppLabel;
    qryResEnvio                      : TwwQuery;
    dsResEnvio                       : TwwDataSource;
    ppResEnvio                       : TppBDEPipeline;
    rpResEnvio                       : TppReport;
    ppHeaderBand3                    : TppHeaderBand;
    ppLabel7                         : TppLabel;
    ppLine5                          : TppLine;
    ppLabel8                         : TppLabel;
    ppDetailBand3                    : TppDetailBand;
    ppFooterBand3                    : TppFooterBand;
    ppLine6                          : TppLine;
    ppLabel9                         : TppLabel;
    qryResRecebimento                : TwwQuery;
    dsResRecebimento                 : TwwDataSource;
    ppResRecebimento                 : TppBDEPipeline;
    rpResRecebimento                 : TppReport;
    ppHeaderBand4                    : TppHeaderBand;
    ppLabel10                        : TppLabel;
    ppLine7                          : TppLine;
    ppLabel11                        : TppLabel;
    ppDetailBand4                    : TppDetailBand;
    ppFooterBand4                    : TppFooterBand;
    ppLine8                          : TppLine;
    ppLabel12                        : TppLabel;
    rpResEnvioLabel1                 : TppLabel;
    rpResEnvioLabel2                 : TppLabel;
    rpResEnvioLabel3                 : TppLabel;
    lblMesCobranca                   : TppLabel;
    rpResEnvioLine1                  : TppLine;
    rpResEnvioLine2                  : TppLine;
    rpResEnvioLabel7                 : TppLabel;
    rpResEnvioLabel8                 : TppLabel;
    rpResEnvioLabel9                 : TppLabel;
    lblDescTipoEnvio                 : TppLabel;
    rpResEnvioLabel5                 : TppLabel;
    rpResEnvioLabel11                : TppLabel;
    rpResEnvioLine3                  : TppLine;
    rpResEnvioDBText5                : TppDBText;
    rpResEnvioDBText6                : TppDBText;
    rpResEnvioDBCalc3                : TppDBCalc;
    rpResEnvioDBCalc2                : TppDBCalc;
    rpResEnvioShape1                 : TppShape;
    rpResEnvioLine4                  : TppLine;
    rpResEnvioDBCalc1                : TppDBCalc;
    rpResEnvioDBText1                : TppDBText;
    rpResEnvioDBText2                : TppDBText;
    rpResEnvioDBText3                : TppDBText;
    rpResEnvioDBText4                : TppDBText;
    QryGeral: TwwQuery;
    dsGeral: TwwDataSource;
    plGeral: TppBDEPipeline;
    rpGeral: TppReport;
    ppHeaderBand5                    : TppHeaderBand;
    ppDetailBand5                    : TppDetailBand;
    ppFooterBand5                    : TppFooterBand;
    ppLine12                         : TppLine;
    ppLabel25                        : TppLabel;
    qryFundacao                      : TwwQuery;
    dsFundacao                       : TwwDataSource;
    ppFundacao                       : TppBDEPipeline;
    rpTotalizadorDBText1             : TppDBText;
    rpTotalizadorDBText2             : TppDBText;
    rpTotalizadorDBText3             : TppDBText;
    rpTotalizadorDBImage1            : TppDBImage;
    rpTotalizadorDBText4             : TppDBText;
    rpTotalizadorDBText5             : TppDBText;
    rpTotalizadorLabel1              : TppLabel;
    rpTotalizadorLabel2              : TppLabel;
    rpTotalizadorDBText6             : TppDBText;
    rpTotalizadorDBText7             : TppDBText;
    rpTotalizadorLabel3              : TppLabel;
    rpTotalizadorLine1               : TppLine;
    rpTotalizadorLabel4              : TppLabel;
    rpTotalizadorLabel5              : TppLabel;
    rpTotalizadorLabel6              : TppLabel;
    rpTotalizadorDBText8             : TppDBText;
    rpTotalizadorDBText9             : TppDBText;
    rpTotalizadorDBText10            : TppDBText;
    rpTotalizadorDBText11            : TppDBText;
    rpTotalizadorDBText12            : TppDBText;
    rpTotalizadorLine2               : TppLine;
    rpTotalizadorLabel10             : TppLabel;
    rpTotalizadorDBCalc1             : TppDBCalc;
    rpTotalizadorDBCalc2             : TppDBCalc;
    rpTotalizadorLabel11             : TppLabel;
    rpTotalizadorLine3               : TppLine;
    rpTotalizadorLabel12             : TppLabel;
    rpTotalizadorDBCalc3             : TppDBCalc;
    rpTotalizadorLabel13             : TppLabel;
    rpTotalizadorDBCalc4             : TppDBCalc;
    qryTotalizador01: TwwQuery;
    dsTotalizador01: TwwDataSource;
    plTotalizador01: TppBDEPipeline;
    qryTotalizador02: TwwQuery;
    dsTotalizador02: TwwDataSource;
    plTotalizador02: TppBDEPipeline;
    rpGeralSummaryBand1: TppSummaryBand;
    SubRelatorio01: TppSubReport;
    SubRelatorio02: TppSubReport;
    rpGeralChildReport2: TppChildReport;
    rpGeralChildReport1DetailBand1: TppDetailBand;
    rpGeralChildReport1HeaderBand1: TppHeaderBand;
    rpGeralChildReport1FooterBand1: TppFooterBand;
    rpGeralChildReport1Label1: TppLabel;
    rpGeralChildReport1Line1: TppLine;
    rpGeralChildReport2Label1: TppLabel;
    rpGeralChildReport2Line1: TppLine;
    rpGeralChildReport1DBText1: TppDBText;
    rpGeralChildReport1DBText2: TppDBText;
    rpGeralChildReport1DBText3: TppDBText;
    rpGeralChildReport1DBImage1: TppDBImage;
    rpGeralChildReport1DBText4: TppDBText;
    rpGeralChildReport1DBText5: TppDBText;
    rpGeralChildReport2DBText1: TppDBText;
    rpGeralChildReport2DBText2: TppDBText;
    rpGeralChildReport2DBText3: TppDBText;
    rpGeralChildReport2DBImage1: TppDBImage;
    rpGeralChildReport2DBText4: TppDBText;
    rpGeralChildReport2DBText5: TppDBText;
    rpGeralChildReport1Label2: TppLabel;
    rpGeralChildReport2Label2: TppLabel;
    rpGeralChildReport1Line2: TppLine;
    rpGeralChildReport1Label3: TppLabel;
    rpGeralChildReport1Label4: TppLabel;
    rpGeralChildReport1Label5: TppLabel;
    rpGeralChildReport1DBText6: TppDBText;
    rpGeralChildReport1Label6: TppLabel;
    rpGeralChildReport1Label7: TppLabel;
    rpGeralChildReport1DBText7: TppDBText;
    rpGeralChildReport1DBText8: TppDBText;
    rpGeralChildReport1DBText9: TppDBText;
    rpGeralChildReport1DBText10: TppDBText;
    rpGeralChildReport1DBText11: TppDBText;
    rpGeralChildReport1Line3: TppLine;
    rpGeralChildReport1Label8: TppLabel;
    rpGeralChildReport2Line2: TppLine;
    rpGeralChildReport2Label3: TppLabel;
    rpGeralChildReport2Label4: TppLabel;
    rpGeralChildReport2Label5: TppLabel;
    rpGeralChildReport2DBText6: TppDBText;
    rpGeralChildReport2Label6: TppLabel;
    rpGeralChildReport2Label7: TppLabel;
    rpGeralChildReport2DBText7: TppDBText;
    rpGeralChildReport2DBText8: TppDBText;
    rpGeralChildReport2DBText9: TppDBText;
    rpGeralChildReport2DBText10: TppDBText;
    rpGeralChildReport2Line3: TppLine;
    rpGeralChildReport2Label8: TppLabel;
    rpGeralChildReport2DBText11: TppDBText;
    rpCriticasCcp: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel13: TppLabel;
    ppLine9: TppLine;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    pplblMes: TppLabel;
    ppLabel18: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    pplblPatro: TppLabel;
    pplblOco: TppLabel;
    rpCriticasCcpLabel1: TppLabel;
    ppDBText5: TppDBText;
    rpCriticasCcpLabel2: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText6: TppDBText;
    rpCriticasCcpDBText1: TppDBText;
    rpCriticasCcpDBText2: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine13: TppLine;
    ppLabel26: TppLabel;
    ppCriticasCcp: TppBDEPipeline;
    dsCriticasCcp: TwwDataSource;
    rpGeralChildReport2Calc1: TppSystemVariable;
    rpGeralChildReport2Calc2: TppSystemVariable;
    rpGeralChildReport1Calc1: TppSystemVariable;
    rpGeralChildReport1Calc2: TppSystemVariable;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    ppEnvioArqPatroSint: TppBDEPipeline;
    dsEnvioArqPatroSint: TwwDataSource;
    qryEnvioArqPatroSint: TwwQuery;
    rpEnvioArqPatroSint: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppDetailBand8: TppDetailBand;
    ppFooterBand8: TppFooterBand;
    ppLine17: TppLine;
    ppLabel27: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppEnvioArqPatroAnal: TppBDEPipeline;
    dsEnvioArqPatroAnal: TwwDataSource;
    qryEnvioArqPatroAnal: TwwQuery;
    rpEnvioArqPatroAnal: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLine14: TppLine;
    ppDetailBand7: TppDetailBand;
    ppFooterBand7: TppFooterBand;
    ppLine15: TppLine;
    ppLabel20: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel28: TppLabel;
    ppDBText1: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel29: TppLabel;
    ppDBText2: TppDBText;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel31: TppLabel;
    ppDBText4: TppDBText;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLabel32: TppLabel;
    ppDBText7: TppDBText;
    ppLabel33: TppLabel;
    ppDBText8: TppDBText;
    ppLabel34: TppLabel;
    ppDBText9: TppDBText;
    ppLabel35: TppLabel;
    ppDBText10: TppDBText;
    ppDBText3: TppDBText;
    ppLabel30: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppLabel36: TppLabel;
    ppDBText11: TppDBText;
    ppLabel37: TppLabel;
    ppDBText12: TppDBText;
    ppLabel38: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppDBText15: TppDBText;
    ppDBImage1: TppDBImage;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBImage2: TppDBImage;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLabel24: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;
    ppLabel23: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppLabel41: TppLabel;
    ppDBCalc5: TppDBCalc;
    qryEnvioArqPatroAnalIDPESSJUR: TFloatField;
    qryEnvioArqPatroAnalNOME: TStringField;
    qryEnvioArqPatroAnalIDPLANOPREV: TFloatField;
    qryEnvioArqPatroAnalNOME_1: TStringField;
    qryEnvioArqPatroAnalIDPROVENTO: TFloatField;
    qryEnvioArqPatroAnalDESCRPROVDESC: TStringField;
    qryEnvioArqPatroAnalIDPESSOA: TFloatField;
    qryEnvioArqPatroAnalNOME_2: TStringField;
    qryEnvioArqPatroAnalNOMEMODULO: TStringField;
    qryEnvioArqPatroAnalMATRICULA: TStringField;
    qryEnvioArqPatroAnalINSCRICAONUMERO: TFloatField;
    qryEnvioArqPatroAnalVALOR: TFloatField;
    qryEnvioArqPatroSintIDPESSJUR: TFloatField;
    qryEnvioArqPatroSintNOME: TStringField;
    qryEnvioArqPatroSintIDPLANOPREV: TFloatField;
    qryEnvioArqPatroSintNOME_1: TStringField;
    qryEnvioArqPatroSintNOMEMODULO: TStringField;
    qryEnvioArqPatroSintIDPROVENTO: TFloatField;
    qryEnvioArqPatroSintDESCRPROVDESC: TStringField;
    qryEnvioArqPatroSintVALOR: TFloatField;
    LbMesReferencia: TppLabel;
    LbMesReferenciaSint: TppLabel;
    rpHistContribAnalit: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel46: TppLabel;
    ppLine16: TppLine;
    ppDBImage3: TppDBImage;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppLabel47: TppLabel;
    ppDBText33: TppDBText;
    rpHistContribAnaliticoLabel1: TppLabel;
    rpHistContribAnaliticoDBText1: TppDBText;
    ppDetailBand10: TppDetailBand;
    rpHistContribAnaliticoDBText4: TppDBText;
    rpHistContribAnaliticoDBText5: TppDBText;
    rpHistContribAnaliticoDBText6: TppDBText;
    rpHistContribAnaliticoDBText7: TppDBText;
    rpHistContribAnaliticoDBText8: TppDBText;
    rpHistContribAnaliticoDBText10: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine21: TppLine;
    ppLabel48: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    rpHistContribAnaliticoGroup1: TppGroup;
    rpHistContribAnaliticoGroupHeaderBand1: TppGroupHeaderBand;
    rpHistContribAnaliticoLabel2: TppLabel;
    rpHistContribAnaliticoLabel3: TppLabel;
    rpHistContribAnaliticoDBText2: TppDBText;
    rpHistContribAnaliticoDBText3: TppDBText;
    rpHistContribAnaliticoLine1: TppLine;
    rpHistContribAnaliticoLabel4: TppLabel;
    rpHistContribAnaliticoLabel5: TppLabel;
    rpHistContribAnaliticoLabel6: TppLabel;
    rpHistContribAnaliticoLabel7: TppLabel;
    rpHistContribAnaliticoLabel8: TppLabel;
    rpHistContribAnaliticoLabel9: TppLabel;
    rpHistContribAnaliticoLine2: TppLine;
    rpHistContribAnaliticoGroupFooterBand1: TppGroupFooterBand;
    rpHistContribAnaliticoDBCalc1: TppDBCalc;
    rpHistContribAnaliticoDBCalc2: TppDBCalc;
    rpHistContribAnaliticoLabel11: TppLabel;
    ppHistContribAnalit: TppBDEPipeline;
    dsHistContribAnalit: TwwDataSource;
    qryHistContribAnalit: TwwQuery;
    ppReport1: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppLabel49: TppLabel;
    ppLine22: TppLine;
    ppDBImage4: TppDBImage;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppLabel50: TppLabel;
    ppDBText41: TppDBText;
    ppLabel51: TppLabel;
    ppDBText42: TppDBText;
    ppDetailBand11: TppDetailBand;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    rpHistContribAnaliticoDBText9: TppDBText;
    ppDBText48: TppDBText;
    ppFooterBand11: TppFooterBand;
    ppLine23: TppLine;
    ppLabel52: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppLine24: TppLine;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    rpHistContribAnaliticoLabel10: TppLabel;
    ppLine25: TppLine;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppDBText51: TppDBText;
    ppDBCalc8: TppDBCalc;
    qryRubricasReceb: TwwQuery;
    dsRubricasReceb: TwwDataSource;
    ppRubricasReceb: TppBDEPipeline;
    rpRubricasReceb: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLabel74: TppLabel;
    ppLine26: TppLine;
    ppDBImage5: TppDBImage;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppLabel75: TppLabel;
    ppDBText59: TppDBText;
    ppLabel76: TppLabel;
    ppDBText60: TppDBText;
    ppDetailBand12: TppDetailBand;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText65: TppDBText;
    ppDBText67: TppDBText;
    ppDBText64: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine27: TppLine;
    ppLabel77: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppGroup13: TppGroup;
    ppGroupHeaderBand13: TppGroupHeaderBand;
    ppLabel78: TppLabel;
    ppDBText68: TppDBText;
    ppLine28: TppLine;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppGroup14: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppLine29: TppLine;
    ppLabel82: TppLabel;
    ppLabel86: TppLabel;
    ppLabel84: TppLabel;
    ppGroupFooterBand14: TppGroupFooterBand;
    rpLayOutReceb: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppLabel79: TppLabel;
    ppLine30: TppLine;
    ppLabel80: TppLabel;
    ppDetailBand13: TppDetailBand;
    ppFooterBand13: TppFooterBand;
    ppLine32: TppLine;
    ppLabel81: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    qryLayOutReceb: TwwQuery;
    dsLayOutReceb: TwwDataSource;
    ppLayOutReceb: TppBDEPipeline;
    qryEstatisticaSPC: TwwQuery;
    dsEstatisticaSPC: TwwDataSource;
    ppEstatisticaSPC: TppBDEPipeline;
    rpEstatisticaSPC: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppDBText66: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBImage6: TppDBImage;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppLabel83: TppLabel;
    ppDetEstatisticaSPC: TppDetailBand;
    ppFooterBand14: TppFooterBand;
    ppLabel85: TppLabel;
    ppLine33: TppLine;
    ppSystemVariable13: TppSystemVariable;
    ppSystemVariable14: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    ppLabel87: TppLabel;
    ppDBText73: TppDBText;
    ppDBText76: TppDBText;
    lblDescEstSPC: TppLabel;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    qryInterfCadSintetico: TwwQuery;
    dsInterfCadSintetico: TwwDataSource;
    ppInterfCadSintetico: TppBDEPipeline;
    rpInterfCadSintetico: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBImage7: TppDBImage;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppDBText91: TppDBText;
    pDetBandInterfCadSintetico: TppDetailBand;
    ppFooterBand15: TppFooterBand;
    ppSystemVariable15: TppSystemVariable;
    ppLabel107: TppLabel;
    ppLine34: TppLine;
    ppSystemVariable16: TppSystemVariable;
    ppSummaryBand5: TppSummaryBand;
    ppGroup17: TppGroup;
    ppGroupHeaderBand17: TppGroupHeaderBand;
    ppShape4: TppShape;
    ppGroupFooterBand17: TppGroupFooterBand;
    ppDBText97: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppLabel106: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppShapeInterfCadSintetico: TppShape;
    ppLabel109: TppLabel;
    ppDBCalc10: TppDBCalc;
    ppShape5: TppShape;
    qryInterfCadAnalitico: TwwQuery;
    dsInterfCadAnalitico: TwwDataSource;
    ppInterfCadAnalitico: TppBDEPipeline;
    rpInterfCadAnalitico: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBImage8: TppDBImage;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppLabel108: TppLabel;
    ppLabel110: TppLabel;
    ppDBText100: TppDBText;
    ppDetCritCadAnalitico: TppDetailBand;
    ppFooterBand16: TppFooterBand;
    ppSystemVariable17: TppSystemVariable;
    ppLabel111: TppLabel;
    ppLine37: TppLine;
    ppSystemVariable18: TppSystemVariable;
    ppSummaryBand6: TppSummaryBand;
    ppShape6: TppShape;
    ppLabel112: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppGroup18: TppGroup;
    ppGroupHeaderBand18: TppGroupHeaderBand;
    ppShape7: TppShape;
    ppDBText103: TppDBText;
    ppGroupFooterBand18: TppGroupFooterBand;
    ppLabel113: TppLabel;
    ppDBCalc12: TppDBCalc;
    ppGroup19: TppGroup;
    ppGroupHeaderBand19: TppGroupHeaderBand;
    ppGroupFooterBand19: TppGroupFooterBand;
    ppShapeInterfCadAnalitico: TppShape;
    ppDBText101: TppDBText;
    ppShape8: TppShape;
    ppDBText102: TppDBText;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppDBText109: TppDBText;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppDBText110: TppDBText;
    ppLabel122: TppLabel;
    ppDBText111: TppDBText;
    qryEnvioArqPatroAnalQUANTIDADE: TFloatField;
    ppShape3: TppShape;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppLabel125: TppLabel;
    ppDBCalc15: TppDBCalc;
    ppLabel126: TppLabel;
    ppDBCalc16: TppDBCalc;
    ppLabel127: TppLabel;
    ppDBCalc17: TppDBCalc;
    ppLabel128: TppLabel;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppDBText112: TppDBText;
    qryEnvioArqPatroSintQUANTIDADE: TFloatField;
    ppLabel132: TppLabel;
    ppDBCalc20: TppDBCalc;
    ppLabel131: TppLabel;
    ppDBCalc21: TppDBCalc;
    ppLabel133: TppLabel;
    ppDBCalc22: TppDBCalc;
    ppLabel134: TppLabel;
    ppDBCalc23: TppDBCalc;
    ppLabel135: TppLabel;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppDBCalc26: TppDBCalc;
    ppLabel138: TppLabel;
    ppDBCalc27: TppDBCalc;
    qryRubricasNEncontradas: TwwQuery;
    dsyRubricasNEncontradas: TwwDataSource;
    ppRubricasNEncontradas: TppBDEPipeline;
    rpRubricasNEncontradas: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppLabel139: TppLabel;
    ppLine38: TppLine;
    ppDBImage9: TppDBImage;
    ppDBText113: TppDBText;
    ppDBText114: TppDBText;
    ppDBText115: TppDBText;
    ppDBText116: TppDBText;
    ppDBText117: TppDBText;
    ppDBText118: TppDBText;
    ppDBText119: TppDBText;
    ppLabel140: TppLabel;
    ppDBText120: TppDBText;
    ppLabel141: TppLabel;
    ppDBText121: TppDBText;
    ppDetailBand14: TppDetailBand;
    ppDBText123: TppDBText;
    ppDBText125: TppDBText;
    ppFooterBand17: TppFooterBand;
    ppLine39: TppLine;
    ppLabel142: TppLabel;
    ppSystemVariable19: TppSystemVariable;
    ppSystemVariable20: TppSystemVariable;
    ppGroup20: TppGroup;
    ppGroupHeaderBand20: TppGroupHeaderBand;
    ppLabel143: TppLabel;
    ppDBText126: TppDBText;
    ppLine40: TppLine;
    ppGroupFooterBand20: TppGroupFooterBand;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppDBCalc29: TppDBCalc;
    ppGroup21: TppGroup;
    ppGroupHeaderBand21: TppGroupHeaderBand;
    ppLabel146: TppLabel;
    ppLabel148: TppLabel;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppGroupFooterBand21: TppGroupFooterBand;
    ppDBCalc28: TppDBCalc;
    ppLabel149: TppLabel;
    ppDBCalc30: TppDBCalc;
    ppLabel150: TppLabel;
    ppDBCalc31: TppDBCalc;
    ppLabel151: TppLabel;
    ppDBText129: TppDBText;
    ppLabel152: TppLabel;
    ppLine41: TppLine;
    ppLabel147: TppLabel;
    qryResumoRubricas: TwwQuery;
    dsResumoRubricas: TwwDataSource;
    ppResumoRubricas: TppBDEPipeline;
    rpResumoRubricas: TppReport;
    ppHeaderBand18: TppHeaderBand;
    lblTitulo: TppLabel;
    ppLine43: TppLine;
    ppDBImage10: TppDBImage;
    ppDBText122: TppDBText;
    ppDBText124: TppDBText;
    ppDBText130: TppDBText;
    ppDBText131: TppDBText;
    ppDBText132: TppDBText;
    ppDBText133: TppDBText;
    ppDBText134: TppDBText;
    ppLabel154: TppLabel;
    ppDBText135: TppDBText;
    ppDetailBand15: TppDetailBand;
    ppDBText137: TppDBText;
    ppDBText139: TppDBText;
    ppDBText140: TppDBText;
    ppFooterBand18: TppFooterBand;
    ppLine44: TppLine;
    ppLabel156: TppLabel;
    ppSystemVariable21: TppSystemVariable;
    ppSystemVariable22: TppSystemVariable;
    ppGroup22: TppGroup;
    ppGroupHeaderBand22: TppGroupHeaderBand;
    ppGroupFooterBand22: TppGroupFooterBand;
    ppGroup23: TppGroup;
    ppGroupHeaderBand23: TppGroupHeaderBand;
    ppGroupFooterBand23: TppGroupFooterBand;
    ppDBText141: TppDBText;
    ppDBText142: TppDBText;
    ppLabel153: TppLabel;
    ppLabel155: TppLabel;
    ppLabel157: TppLabel;
    ppLine45: TppLine;
    ppLabel159: TppLabel;
    ppLabel160: TppLabel;
    ppDBCalc32: TppDBCalc;
    ppLabel161: TppLabel;
    ppDBCalc33: TppDBCalc;
    ppGroup24: TppGroup;
    ppGroupHeaderBand24: TppGroupHeaderBand;
    ppGroupFooterBand24: TppGroupFooterBand;
    ppLabel162: TppLabel;
    ppLine51: TppLine;
    ppLabel163: TppLabel;
    ppDBText138: TppDBText;
    ppLabel158: TppLabel;
    ppDBText136: TppDBText;
    ppShape9: TppShape;
    ppDBCalc34: TppDBCalc;
    qryErrosInterface: TwwQuery;
    dsErrosInterface: TwwDataSource;
    ppErrosInterface: TppBDEPipeline;
    rpErrosInterface: TppReport;
    ppHeaderBand19: TppHeaderBand;
    lbltitulocriticas: TppLabel;
    ppLine46: TppLine;
    ppDBImage11: TppDBImage;
    ppDBText143: TppDBText;
    ppDBText144: TppDBText;
    ppDBText145: TppDBText;
    ppDBText146: TppDBText;
    ppDBText147: TppDBText;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
    ppLabel165: TppLabel;
    ppDBText150: TppDBText;
    ppDetailBand16: TppDetailBand;
    ppFooterBand19: TppFooterBand;
    ppLine47: TppLine;
    ppLabel166: TppLabel;
    ppSystemVariable23: TppSystemVariable;
    ppSystemVariable24: TppSystemVariable;
    ppGroup25: TppGroup;
    ppGroupHeaderBand25: TppGroupHeaderBand;
    ppGroupFooterBand25: TppGroupFooterBand;
    ppLabel167: TppLabel;
    ppGroup26: TppGroup;
    ppGroupHeaderBand26: TppGroupHeaderBand;
    ppShape10: TppShape;
    ppGroupFooterBand26: TppGroupFooterBand;
    ppLabel170: TppLabel;
    ppDBCalc36: TppDBCalc;
    ppLabel168: TppLabel;
    ppDBText151: TppDBText;
    ppDBText152: TppDBText;
    ppDBText153: TppDBText;
    ppDBText156: TppDBText;
    ppDBText154: TppDBText;
    ppDBText157: TppDBText;
    ppLabel171: TppLabel;
    ppGroup27: TppGroup;
    ppGroupHeaderBand27: TppGroupHeaderBand;
    ppGroupFooterBand27: TppGroupFooterBand;
    ppLabel164: TppLabel;
    ppLabel169: TppLabel;
    ppLabel172: TppLabel;
    ppLabel173: TppLabel;
    ppDBText155: TppDBText;
    ppLabel174: TppLabel;
    ppLabel175: TppLabel;
    ppDBCalc37: TppDBCalc;
    ppLabel176: TppLabel;
    ppDBCalc38: TppDBCalc;
    ppDBCalc35: TppDBCalc;
    ppLabel177: TppLabel;
    ppDBCalc39: TppDBCalc;
    ppLabel178: TppLabel;
    ppDBCalc40: TppDBCalc;
    ppLine48: TppLine;
    qryResImp: TwwQuery;
    dsResImp: TwwDataSource;
    pplResImp: TppBDEPipeline;
    rpResImp: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppDBText158: TppDBText;
    ppDBText159: TppDBText;
    ppDBText160: TppDBText;
    ppDBText161: TppDBText;
    ppDBText162: TppDBText;
    ppLabel63: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLine49: TppLine;
    ppDBImage12: TppDBImage;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppDBText163: TppDBText;
    ppDBText164: TppDBText;
    ppDBText166: TppDBText;
    ppDBText167: TppDBText;
    ppDBText165: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppSystemVariable25: TppSystemVariable;
    ppLabel64: TppLabel;
    ppLine31: TppLine;
    ppSystemVariable26: TppSystemVariable;
    ppSummaryBand7: TppSummaryBand;
    ppLabel193: TppLabel;
    ppLabel194: TppLabel;
    ppDBCalc44: TppDBCalc;
    ppDBCalc41: TppDBCalc;
    ppLine50: TppLine;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLine35: TppLine;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    Bevel1: TBevel;
    qryEstatisticaSPC_ant: TwwQuery;
    procedure ppLabel63Print(Sender: TObject);
    procedure ppLabel65Print(Sender: TObject);
    procedure rpResRubRecGroupFooterBand3BeforePrint(Sender: TObject);
    procedure rpResRubRecGroupFooterBand2BeforePrint(Sender: TObject);
    procedure rpResRubRecGroupFooterBand3AfterPrint(Sender: TObject);
    procedure rpResRubRecGroupFooterBand4BeforePrint(Sender: TObject);
    procedure lblTotSituacaoPrint(Sender: TObject);
    procedure lblTotTipoPrint(Sender: TObject);
    procedure rpResRubRecGroupFooterBand4AfterPrint(Sender: TObject);
    procedure rpResRubRecGroupHeaderBand4BeforePrint(Sender: TObject);
    procedure qryResRubRecAfterOpen(DataSet: TDataSet);
    procedure rpResRubRecGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure QryGeralBeforeOpen(DataSet: TDataSet);
    procedure QryGeralAfterClose(DataSet: TDataSet);
    procedure rpCriticasCcpStartPage(Sender: TObject);
    procedure qryEnvioArqPatroAnalBeforeOpen(DataSet: TDataSet);
    procedure qryEnvioArqPatroSintBeforeOpen(DataSet: TDataSet);
    procedure ppDetEstatisticaSPCBeforePrint(Sender: TObject);
    procedure pDetBandInterfCadSinteticoBeforePrint(Sender: TObject);
    procedure ppDetCritCadAnaliticoBeforePrint(Sender: TObject);

  private
    { Private declarations }
    function RetornaNomeParticipante(CHAVE: string; CHAVEVALOR: string;
    Cod_Patrocinadora: Integer; Cod_Plano: Integer): string;
  public
    { Public declarations }
    iQueryRel : Integer;
    cTipoRelCriticaCadastral : char;
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatorios                                                                 : TdtmRelatorios;
  dProv, dDesc,  dNormal, dAtraso, dDevol, dGeral, dPrev, dEmp, dAss,
  dSal , dPlano, dPatro                                                         :double;
  sNome, sPlano, sPatro , sTpDesc, sTipoRubrica, sSituacao                      : String;
implementation

uses USistema     , FPrincipal       ,  FParamRelResRubRec,
     UFuncoesUteis, FParamRelResEnvio, FParamRelResRecebimento, FParamRelEvSalPart,
     UAdmPrev, FConsCriticasCcp1, DAPrev, FParamRelInterfaceEnvio,
     FPRelTmpContribAnalit, FPRelRubReceb, FParamRelEstSPC,
     FPRelCriticaCadSintet, FPRelResumoRubricas, FParamRelResImp;

{$R *.DFM}

//---------- FUNCÃO USADA P/ INTEGRAÇÃO RELATÓRIOS CADASTRADOS NO SAD ----------
//---------- E SUAS TELAS DE PARÂMETROS
function TdtmRelatorios.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     if (UPPERCASE(Form) = 'FORMANALITICO')
     then begin
        Try
          Application.CreateForm(TFrmParamRelInterfaceEnvio,FrmParamRelInterfaceEnvio);
          FrmParamRelInterfaceEnvio.rdgrpind.ItemIndex := 0;
          Result := (FrmParamRelInterfaceEnvio.ShowModal = MrOk);
        Finally
          FrmParamRelInterfaceEnvio.Free;
        End;
        exit;
     end
     else if (UPPERCASE(Form) = 'FORMSINTETICO')
     then begin
        Try
          Application.CreateForm(TFrmParamRelInterfaceEnvio,FrmParamRelInterfaceEnvio);
          FrmParamRelInterfaceEnvio.rdgrpind.ItemIndex := 1;
          Result := (FrmParamRelInterfaceEnvio.ShowModal = MrOk);
        Finally
          FrmParamRelInterfaceEnvio.Free;
        End;
        exit;
     end
     else if UPPERCASE(Form)= 'FRMPRELCRITICACADSINTET'
     then begin
          cTipoRelCriticaCadastral := 'S';
          frm := TfrmPRelCriticaCadSintet.Create(Application)
     end
     else if UPPERCASE(Form)= 'FRMPRELCRITICACADANALIT'
     then begin
          cTipoRelCriticaCadastral := 'A';
          frm := TfrmPRelCriticaCadSintet.Create(Application)
     end
     else if UPPERCASE(Form)= 'FRMPARAMRELRESRUBREC'      then frm := TfrmParamRelResRubRec.Create(Application)
     else if UPPERCASE(Form)= 'FRMPARAMRELEVSALPART'      then frm := TfrmParamRelEvSalPart.Create(Application)
     else if UPPERCASE(Form)= 'FRMPARAMRELRESENVIO'       then frm := TfrmParamRelResEnvio.Create(Application)
     else if UPPERCASE(Form)= 'FRMPARAMRELRESRECEBIMENTO' then frm := TfrmParamRelResRecebimento.Create(Application)
     else if UPPERCASE(Form)= 'FRMPRELTMPCONTRIBANALIT'   then frm := TfrmPRelTmpContribAnalit.Create(Application)
     else if UPPERCASE(Form)= 'FRMPARAMRELESTSPC'         then frm := TfrmParamRelEstSPC.Create(Application)
     else if UPPERCASE(Form)= 'FRMPRELCRITICACADSINTET'   then frm := TfrmPRelCriticaCadSintet.Create(Application)
     else if UPPERCASE(Form)= 'FRMPRELRUBRECEB'           then frm := tfrmPRelRubReceb.Create(Application)
     else if UPPERCASE(Form)= 'FRMPRELRESUMORUBRICAS'     then frm := TfrmPRelResumoRubricas.Create(Application)
     else if UPPERCASE(Form)= 'FRMPARAMRELRESIMP'         then frm := TfrmParamRelResImp.Create(Application)
     else frm := nil;
     //
     if frm = nil then Result := true
     else
      begin
        with frm do
         begin
           Result := (ShowModal = mrOk);
           free;
         end;
      end;
end;

//-------------------------- RELATÓRIO DE CRÍTICAS ----------------------------

function TdtmRelatorios.RetornaNomeParticipante(CHAVE: string; CHAVEVALOR: string;
Cod_Patrocinadora: Integer; Cod_Plano: Integer): string;
var
  sSQL, sWhere, sTabela: string;
begin

  //VERIFICA O TIPO DE INSCRIÇÃO DO PARTICIPANTE E MONTA A QUERY
  Result  := '';
  sTabela := '';
  sWhere  := '';

  if Trim(Uppercase(CHAVE)) = 'MATRICULA' then
   begin
     sTabela := sTabela + 'PESSOA, PESSOA PESSJUR, ELEGPATRO ';
     sWhere  := sWhere  + ' ELEGPATRO.' + CHAVE + ' =  ''' + CHAVEVALOR + '''';
     sWhere  := sWhere  + ' AND PESSJUR.IDPESSOA = ' + IntToStr(Cod_Patrocinadora);
     sWhere  := sWhere  + ' AND PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA';
   end
  else
    if Trim(Uppercase(CHAVE)) = 'INSCRICAONUMERO' then
     begin
       sTabela := sTabela + 'PESSOA, PESSOA PESSJUR, PARTPREVPLAN T';
       sWhere  := sWhere  + ' T.'+ CHAVE + ' = ' + CHAVEVALOR;
       sWhere  := sWhere  + ' AND T.IDPLANOPREV = ' + IntToStr(Cod_Plano);
       sWhere  := sWhere  + ' AND PESSOA.IDPESSOA = T.IDPESSOA';
       sWhere  := sWhere  + ' AND PESSJUR.IDPESSOA = ' + IntToStr(Cod_Patrocinadora);
     end
    else
      if Trim(Uppercase(CHAVE)) = 'NUMINSC' then
       begin
         sTabela := 'PESSOA, PESSOAXFUND T, PATRO P';
         sWhere  := sWhere + ' T.'+ CHAVE + ' =  ''' + CHAVEVALOR + '''';
         sWhere  := sWhere + ' AND P.IDPESSOA = ' + IntToStr(Cod_Patrocinadora);
         sWhere  := sWhere + ' AND T.IDFUNDACAO = P.IDFUNDACAO ';
         sWhere  := sWhere + ' AND PESSOA.IDPESSOA = T.IDPESSOA ';
       end;

  if (sTabela<> '') and (sWhere<> '') then
   begin
     with qryAux2 do
      begin
        Close;
        SQL.Clear;
        sSQL := ' SELECT PESSOA.NOME FROM ' + sTabela + ' WHERE ' + sWhere;
        SQL.Add(sSQL);
        Open;
      end;

     //VERIFICA SE A QUERY ESTÁ VAZIA
     if not qryAux2.IsEmpty then Result := qryAux2.FieldByName('NOME').AsString
     else Result := '';
   end
  else Result := '';
end;

procedure TdtmRelatorios.ppLabel63Print(Sender: TObject);
begin
  inherited;
  // Preenche Roda pé
  (Sender as TppLabel).Caption := Sistema.NomeEmpresa;
end;

procedure TdtmRelatorios.ppLabel65Print(Sender: TObject);
begin
  inherited;
  // Preenche Roda pé
  (Sender as TppLabel).Caption := Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

procedure TdtmRelatorios.rpResRubRecGroupFooterBand3BeforePrint(Sender: TObject);
begin
  inherited;
  // Verifica se ...
  if qryResRubRec.fieldByName('FlgAtrasoDevol').AsString      = 'Normal' then lblDescSit.Caption:= 'Total da Situação Normal'
  else if qryResRubRec.fieldByName('FlgAtrasoDevol').AsString = 'Atraso' then lblDescSit.Caption:= 'Total da Situação Atraso'
  else lblDescSit.Caption := 'Total da Situação Desconto';
end;

procedure TdtmRelatorios.rpResRubRecGroupFooterBand2BeforePrint(Sender: TObject);
begin
  inherited;
  // Verifica por qual Módulo do TOTALPREV foi gerada a Rubrica
  if qryResRubRec.fieldByName('FlgTPRubrica').AsString = 'Geral'               then lblDescTip.Caption := 'Total do Tipo de Rúbrica Geral'
  else if qryResRubRec.fieldByName('FlgTPRubrica').AsString = 'Previdenciário' then lblDescTip.Caption := 'Total do Tipo de Rúbrica Previdenciário'
  else if qryResRubRec.fieldByName('FlgTPRubrica').AsString = 'Empréstimo'     then lblDescTip.Caption := 'Total do Tipo de Rúbrica Empréstimo'
  else if qryResRubRec.fieldByName('FlgTPRubrica').AsString = 'Assistencial'   then lblDescTip.Caption := 'Total do Tipo de Rúbrica Assistencial'
  else lblDescTip.Caption:= 'Total da Situação Salarial';
end;

procedure TdtmRelatorios.rpResRubRecGroupFooterBand3AfterPrint(Sender: TObject);
begin
  inherited;
  // Verifica se ...
  if qryResRubRec.fieldByName('FlgAtrasoDevol').AsString      = 'Normal' then dnormal := dprov-ddesc
  else if qryResRubRec.fieldByName('FlgAtrasoDevol').AsString = 'Atraso' then datraso := dprov-ddesc
  else ddevol:=dprov-ddesc;
end;

procedure TdtmRelatorios.rpResRubRecGroupFooterBand4BeforePrint(Sender: TObject);
begin
  inherited;
  // Verifica se é DESCONTO ou PROVENTO para trocar o Caption do TLabel
  if qryResRubRec.fieldByName('FlgDesconto').AsString = 'Provento' then lblDescInc.Caption:= 'Total de Proventos'
  else lblDescInc.Caption:= 'Total de Desconto';
end;

procedure TdtmRelatorios.lblTotSituacaoPrint(Sender: TObject);
begin
  inherited;
  // Total da Situação
  lblTotSituacao.Caption := FormatFloat('###,###,##0.00',(dProv-dDesc));
end;

procedure TdtmRelatorios.lblTotTipoPrint(Sender: TObject);
begin
  inherited;
  // Total do Tipo
  lblTotTipo.Caption := FormatFloat('###,###,##0.00',(dNormal+dAtraso+dDevol));
end;

procedure TdtmRelatorios.rpResRubRecGroupFooterBand4AfterPrint(Sender: TObject);
begin
  inherited;
  // Verifica se ...
  if qryResRubRec.fieldByName('FlgDesconto').AsString = 'Provento' then dprov := lblTotIncidencia.Value
  else ddesc := lblTotIncidencia.Value;
end;

procedure TdtmRelatorios.rpResRubRecGroupHeaderBand4BeforePrint(Sender: TObject);
begin
  inherited;
  // Verifica se a Rubrica é de Desconto.
  if qryResRubRec.fieldByName('FlgDesconto').AsString = 'Desconto' then
   begin
     dDesc := 0;
     dProv := 0;
   end;
end;

procedure TdtmRelatorios.qryResRubRecAfterOpen(DataSet: TDataSet);
begin
  inherited;
  // Atribui Valores ...
  sTipoRubrica := qryResRubRec.FieldByName('FLGTPRUBRICA').AsString;
  sSituacao    := qryResRubRec.FieldByName('FLGATRASODEVOL').AsString;
end;

procedure TdtmRelatorios.rpResRubRecGroupHeaderBand1BeforePrint(Sender: TObject);
begin
  inherited;
  // Verifica se ...
  If Not (sTipoRubrica = qryResRubRec.fieldByName('FLGTPRUBRICA').AsString) Then
   Begin
     dNormal      := 0;
     dAtraso      := 0;
     dDevol       := 0;
     dDesc        := 0;
     dProv        := 0;
     sTipoRubrica := qryResRubRec.fieldByName('FLGTPRUBRICA').AsString;
   End;
  // Verifica se ...
  If Not (sSituacao = qryResRubRec.fieldByName('FLGATRASODEVOL').AsString) Then
   Begin
     dDesc        := 0;
     dProv        := 0;
     sSituacao    := qryResRubRec.fieldByName('FLGATRASODEVOL').AsString;
   End
end;

procedure TdtmRelatorios.QryGeralBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // Abre Query Fundação
  QryFundacao.Close;
  QryFundacao.ParamByName('pFundacao').AsInteger := uAdmPrev.iIdFundacao;
  QryFundacao.Open;
end;

procedure TdtmRelatorios.QryGeralAfterClose(DataSet: TDataSet);
begin
  inherited;
  // Fecha Query da Fundação
  QryFundacao.Close;
end; 

procedure TdtmRelatorios.rpCriticasCcpStartPage(Sender: TObject);
begin
  inherited;
  if not (frmConsCriticasCcp = nil) then
  begin
     dtmRelatorios.pplblMes.caption := frmConsCriticasCcp.cmbMes.text;
     dtmRelatorios.pplblPatro.caption := frmConsCriticasCcp.dblkPatrocinadora.text;
     dtmRelatorios.pplblOco.caption := frmConsCriticasCcp.qryresumo.fieldbyname('DESCERRO').AsString;
     dtmRelatorios.ppLabel26.caption := sistema.NomeModulo;
     dtmRelatorios.ppLabel14.caption := sistema.NomeEmpresa;
  end;
end;

procedure TdtmRelatorios.qryEnvioArqPatroAnalBeforeOpen(DataSet: TDataSet);
begin
  inherited;
   // Abre Query Fundação
  QryFundacao.Close;
  QryFundacao.ParamByName('pFundacao').AsInteger := Sistema.IdEmpresa;
  QryFundacao.Open;    
end;

procedure TdtmRelatorios.qryEnvioArqPatroSintBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  QryFundacao.Close;
  QryFundacao.ParamByName('pFundacao').AsInteger := Sistema.IdEmpresa;
  QryFundacao.Open;
end;

procedure TdtmRelatorios.ppDetEstatisticaSPCBeforePrint(Sender: TObject);
begin
  inherited;
  with qryEstatisticaSPC do
  begin
     case FieldbyName('CODARVORE').AsInteger of
          11000 : lblDescEstSPC.caption :=  'Aposentadorias de Prestação Continuada';
          11100 : lblDescEstSPC.caption := 'Aposentadoria por Tempo de Contribuição e Idade';
          11200 : lblDescEstSPC.caption := 'Aposentadoria por Tempo de Contribuição';
          11300 : lblDescEstSPC.caption :='Aposentadoria por Idade ';
          11400 : lblDescEstSPC.caption := 'Aposentadoria por Invalidez';
          11500 : lblDescEstSPC.caption := 'Aposentadoria Antecipada';
          11600 : lblDescEstSPC.caption := 'Aposentadoria Postergada';
          11700 : lblDescEstSPC.caption := 'Aposentadoria Proporcional Diferida';
          11800 : lblDescEstSPC.caption := 'Aposentadoria Especial';
          12000 : lblDescEstSPC.caption := 'Aposentadorias de Pagamento Único';
          12100 : lblDescEstSPC.caption := 'Aposentadoria por Tempo de Contribuição e Idade';
          12200 : lblDescEstSPC.caption := 'Aposentadoria por Tempo de Contribuição';
          12300 : lblDescEstSPC.caption := 'Aposentadoria por Idade';
          12400 : lblDescEstSPC.caption := 'Aposentadoria por Invalidez';
          12500 : lblDescEstSPC.caption := 'Aposentadoria Antecipada';
          12600 : lblDescEstSPC.caption := 'Aposentadoria Postergada';
          12700 : lblDescEstSPC.caption := 'Aposentadoria Proporcional Diferida';
          12800 : lblDescEstSPC.caption := 'Aposentadoria Especial';
          21000 : lblDescEstSPC.caption := 'Pensões (Totalizador)';
          21100 : lblDescEstSPC.caption := 'Pensão - Origem Participante';
          21200 : lblDescEstSPC.caption := 'Pensão - Origem Assistido';
          31000 : lblDescEstSPC.caption := 'Auxílios de Prestação Continuada';
          31100 : lblDescEstSPC.caption := 'Auxílio Reclusao';
          31200 : lblDescEstSPC.caption := 'Auxílio Doença';
          31300 : lblDescEstSPC.caption := 'Outros Auxílios';
          32000 : lblDescEstSPC.caption := 'Auxílios de Prestação Única';
          32100 : lblDescEstSPC.caption := 'Auxílio Funeral';
          32200 : lblDescEstSPC.caption := 'Auxílio Natalidade';
          32300 : lblDescEstSPC.caption := 'Auxílio Nupcial';
          32400 : lblDescEstSPC.caption := 'Outros Auxílios';
          41000 : lblDescEstSPC.caption := 'Pecúlios (Totalizador)';
          41100 : lblDescEstSPC.caption := 'Pecúlio por Morte do Participante';
          41200 : lblDescEstSPC.caption := 'Pecúlio por Morte do Assistido';
          41300 : lblDescEstSPC.caption := 'Pecúlio por Invalidez';
          41400 : lblDescEstSPC.caption := 'Outros Pecúlios';
          51000 : lblDescEstSPC.caption := 'Outros Benefícios';
          61000 : lblDescEstSPC.caption := 'Resgates de Contribuições (Totalizador)';
          61100 : lblDescEstSPC.caption := 'Resgate de Contribuições com Custeio Patronal';
          61200 : lblDescEstSPC.caption := 'Resgate de Contribuições com Custeio do Participante';// ???
          71100 : lblDescEstSPC.caption := 'Plano de Benefícios Originário';
          71200 : lblDescEstSPC.caption := 'Plano de Benefícios Receptor';
          81000 : lblDescEstSPC.caption := 'Participantes (Totalizador)';
          81100 : lblDescEstSPC.caption := 'Participantes com Custeio Patronal';
          81200 : lblDescEstSPC.caption := 'Participante com Custeio Exclusivo do Participante ';// ???
          81300 : lblDescEstSPC.caption := 'Participante com Benefício Proporcional';
          81400 : lblDescEstSPC.caption := 'Participante em Processo de Aposentadoria'; // ???
          81500 : lblDescEstSPC.caption := 'Participante no Prazo de Opção';
          82000 : lblDescEstSPC.caption := 'Assistido de Prestação Continuada';
          83000 : lblDescEstSPC.caption := 'Assistido de Pagamento Único';
          84000 : lblDescEstSPC.caption := 'Designados (Totalizador)';
          84100 : lblDescEstSPC.caption := 'Designado de Participante';
          84200 : lblDescEstSPC.caption := 'Designado de Assistido';
          91000 : lblDescEstSPC.caption := 'Beneficiários de Pensão';
     end;


  end;
end;

procedure TdtmRelatorios.pDetBandInterfCadSinteticoBeforePrint(
  Sender: TObject);
begin
  inherited;
  if   ppShapeInterfCadSintetico.Brush.Color = clWhite
  then ppShapeInterfCadSintetico.Brush.Color := clSilver
  else ppShapeInterfCadSintetico.Brush.Color := clWhite;
end;

procedure TdtmRelatorios.ppDetCritCadAnaliticoBeforePrint(Sender: TObject);
begin
  inherited;
  if   ppShapeInterfCadAnalitico.Brush.Color = clWhite
  then ppShapeInterfCadAnalitico.Brush.Color := clSilver
  else ppShapeInterfCadAnalitico.Brush.Color := clWhite;
end;

end.
