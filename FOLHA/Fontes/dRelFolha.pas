// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Alteração  : dfm - qryFundacao
//Nº SIG.....: SIG TIBERO
//Data.......: 22/10/2018
//Responsável: Andre Imakawa
//Descrição..: Inserido SUBSTR no campo BARCIDUF.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 20/02/2006
// Pendência   : 21606
// Descricao   : Colocar em qryRelPensBanco, qryRelPensAlim, qryBenefPgto,
//               qryPAFavor, qrySub01, qrySubReport02, wwQuery1, wwQuery3,
//               qryCredBenef, qryCredBenefBeneficio
//               filtro 1=2, para otimizar abertura do módulo
//------------------------------------------------------------------------------
unit dRelFolha;

interface

uses
  Windows , Messages, SysUtils, Classes , Graphics, Controls, Forms  , Dialogs ,
  dReports, ppCtrls , Db      , ppBands , ppPrnabl, ppClass , ppProd , ppReport,
  DBTables, Wwquery , Wwdatsrc, ppComm  , ppCache , ppDB    , ppDBBDE, ppStrtch,
  ppSubRpt, ppMemo  , uSistema, ppRichTx, URegra  , ppVar,
  ppRelatv, ppDBPipe, ExtCtrls;

type
  TdtmRelFolha = class(TdtmReports)
    ppCredBenef                           : TppBDEPipeline;
    ppPAFavor                             : TppBDEPipeline;
    dsPAFavor                             : TwwDataSource;
    qryPAFavor                            : TwwQuery;
    qryPAFavorNOME                        : TStringField;
    qryPAFavorVALORPROVENTO               : TFloatField;
    rpPAFavor                             : TppReport;
    ppHeaderBand4                         : TppHeaderBand;
    ppLabel41                             : TppLabel;
    ppLine9                               : TppLine;
    ppLabel42                             : TppLabel;
    ReportPAFavorLine1                    : TppLine;
    ReportPAFavorLabel2                   : TppLabel;
    ReportPAFavorLabel4                   : TppLabel;
    ppDetailBand7                         : TppDetailBand;
    ReportPAFavorDBText2                  : TppDBText;
    ReportPAFavorDBText3                  : TppDBText;
    ppFooterBand4                         : TppFooterBand;
    ppLine10                              : TppLine;
    ppLabel43                             : TppLabel;
    ppGerAtiv                             : TppBDEPipeline;
    dsGerAtiv                             : TwwDataSource;
    qryGerAtiv                            : TwwQuery;
    rpGerAtiv                             : TppReport;
    ppHeaderBand8                         : TppHeaderBand;
    ppLabel53                             : TppLabel;
    ppLine17                              : TppLine;
    ppLabel54                             : TppLabel;
    ppDetailBand9                         : TppDetailBand;
    ppFooterBand8                         : TppFooterBand;
    ppLine18                              : TppLine;
    ppLabel55                             : TppLabel;
    ppBenEncer                            : TppBDEPipeline;
    dsBenEncer                            : TwwDataSource;
    qryBenEncer                           : TwwQuery;
    rpBenEncer                            : TppReport;
    ppHeaderBand1                         : TppHeaderBand;
    ppLabel1                              : TppLabel;
    ppLine1                               : TppLine;
    ppDetailBand1                         : TppDetailBand;
    ppFooterBand1                         : TppFooterBand;
    ppLine2                               : TppLine;
    ppLabel3                              : TppLabel;
    qryHst                                : TwwQuery;
    dsHst                                 : TwwDataSource;
    qryProventos                          : TwwQuery;
    qryDescontos                          : TwwQuery;
    qryEndereco                           : TwwQuery;
    qryConta                              : TwwQuery;
    qryCredBenefBeneficio                 : TwwQuery;
    ppCredBenefBeneficio                  : TppBDEPipeline;
    dsCredBenefBeneficio                  : TwwDataSource;
    qryBenefAlterRes                      : TwwQuery;
    ppBenefAlterRes                       : TppBDEPipeline;
    dsBenefAlterRes                       : TwwDataSource;
    qryBenefAlterResBENEFICIO             : TStringField;
    qryBenefAlterResVALANT                : TFloatField;
    qryBenefAlterResVALATU                : TFloatField;
    qryBenefAlterResDIFERENCA             : TFloatField;
    qryTmp                                : TwwQuery;
    ppReport1                             : TppReport;
    ppHeaderBand12                        : TppHeaderBand;
    ppLabel48                             : TppLabel;
    ppLabel49                             : TppLabel;
    ppLine25                              : TppLine;
    ppDBText4                             : TppDBText;
    ppDBText5                             : TppDBText;
    ppDetailBand13                        : TppDetailBand;
    ppDBText6                             : TppDBText;
    ppDBText13                            : TppDBText;
    ppDBText14                            : TppDBText;
    ppFooterBand12                        : TppFooterBand;
    ppLabel56                             : TppLabel;
    ppLine26                              : TppLine;
    ppGroup2                              : TppGroup;
    ppGroupHeaderBand2                    : TppGroupHeaderBand;
    ppDBText15                            : TppDBText;
    ppLine27                              : TppLine;
    ppLabel57                             : TppLabel;
    ppLabel58                             : TppLabel;
    ppLabel59                             : TppLabel;
    ppLabel60                             : TppLabel;
    ppLabel61                             : TppLabel;
    ppLabel62                             : TppLabel;
    ppLabel63                             : TppLabel;
    ppGroupFooterBand2                    : TppGroupFooterBand;
    ppLabel64                             : TppLabel;
    ppLabel65                             : TppLabel;
    ppDBCalc1                             : TppDBCalc;
    ppDBCalc2                             : TppDBCalc;
    wwDataSource1                         : TwwDataSource;
    wwQuery1                              : TwwQuery;
    rpRelPensBanco                        : TppReport;
    ppHeaderBand13                        : TppHeaderBand;
    ppLabel66                             : TppLabel;
    ppLine28                              : TppLine;
    ppDetailBand14                        : TppDetailBand;
    rpRelCredPenAlimDBText6               : TppDBText;
    rpRelCredPenAlimDBText7               : TppDBText;
    rpRelCredPenAlimDBText8               : TppDBText;
    rpRelCredPenAlimDBText9               : TppDBText;
    rpRelCredPenAlimDBText10              : TppDBText;
    ppFooterBand13                        : TppFooterBand;
    ppLabel68                             : TppLabel;
    ppLine29                              : TppLine;
    rpRelCredPenAlimGroup1                : TppGroup;
    rpRelCredPenAlimGroupHeaderBand1      : TppGroupHeaderBand;
    rpRelCredPenAlimGroupFooterBand1      : TppGroupFooterBand;
    rpRelCredPenAlimLabel12               : TppLabel;
    rpRelCredPenAlimDBCalc2               : TppDBCalc;
    rpRelCredPenAlimGroup2                : TppGroup;
    rpRelCredPenAlimGroupHeaderBand2      : TppGroupHeaderBand;
    rpRelCredPenAlimLine2                 : TppLine;
    rpRelCredPenAlimLabel6                : TppLabel;
    rpRelCredPenAlimLabel7                : TppLabel;
    rpRelCredPenAlimLabel8                : TppLabel;
    rpRelCredPenAlimLabel9                : TppLabel;
    rpRelCredPenAlimLabel10               : TppLabel;
    rpRelCredPenAlimLine1                 : TppLine;
    rpRelCredPenAlimLabel1                : TppLabel;
    rpRelCredPenAlimDBText2               : TppDBText;
    rpRelCredPenAlimLabel2                : TppLabel;
    rpRelCredPenAlimDBText3               : TppDBText;
    rpRelCredPenAlimLabel3                : TppLabel;
    rpRelCredPenAlimDBText4               : TppDBText;
    rpRelCredPenAlimLabel4                : TppLabel;
    rpRelCredPenAlimDBText5               : TppDBText;
    rpRelCredPenAlimGroupFooterBand2      : TppGroupFooterBand;
    rpRelCredPenAlimLabel11               : TppLabel;
    rpRelCredPenAlimDBCalc1               : TppDBCalc;
    qryRelPensBanco                       : TwwQuery;
    dsRelPensBanco                        : TwwDataSource;
    ppRelPensBanco                        : TppBDEPipeline;
    qryRelPensAlim                        : TwwQuery;
    dsRelPensAlim                         : TwwDataSource;
    ppRelPensAlim                         : TppBDEPipeline;
    rpRelPensAlim                         : TppReport;
    ppHeaderBand14                        : TppHeaderBand;
    ppLabel69                             : TppLabel;
    ppLine30                              : TppLine;
    ppLabel73                             : TppLabel;
    ppLine32                              : TppLine;
    ppLabel71                             : TppLabel;
    ppLabel72                             : TppLabel;
    ppLabel74                             : TppLabel;
    rpRelFolhaPenAlimLabel1               : TppLabel;
    rpRelFolhaPenAlimLabel2               : TppLabel;
    ppLabel75                             : TppLabel;
    ppLabel76                             : TppLabel;
    rpRelFolhaPenAlimLine1                : TppLine;
    ppDetailBand15                        : TppDetailBand;
    ppFooterBand14                        : TppFooterBand;
    ppLabel78                             : TppLabel;
    ppLine31                              : TppLine;
    rpRelFolhaPenAlimSummaryBand1         : TppSummaryBand;
    rpRelFolhaPenAlimLabel5               : TppLabel;
    rpRelFolhaPenAlimDBCalc1              : TppDBCalc;
    rpRelFPenAlimLine1                    : TppLine;
    ppBDEPipeline1                        : TppBDEPipeline;
    dsCredBenef                           : TwwDataSource;
    qryCredBenef                          : TwwQuery;
    ppCredBenefAgen                       : TppBDEPipeline;
    rpCredBenef                           : TppReport;
    ppHeaderBand5                         : TppHeaderBand;
    ppLabel45                             : TppLabel;
    rpCredBenefLabel1                     : TppLabel;
    rpCredBenefLabel2                     : TppLabel;
    rpCredBenefLabel3                     : TppLabel;
    rpCredBenefLabel5                     : TppLabel;
    rpCredBenefLabel7                     : TppLabel;
    rpCredBenefLabel9                     : TppLabel;
    ppDetailBand5                         : TppDetailBand;
    rpCredBenefDBText5                    : TppDBText;
    rpCredBenefDBText2                    : TppDBText;
    rpCredBenefDBText3                    : TppDBText;
    rpCredBenefDBText4                    : TppDBText;
    rpCredBenefDBText1                    : TppDBText;
    ppFooterBand5                         : TppFooterBand;
    rpCredBenefLine7                      : TppLine;
    rpCredBenefLabel16                    : TppLabel;
    rpCredBenefSummaryBand1               : TppSummaryBand;
    rpCredBenefLabel14                    : TppLabel;
    rpCredBenefDBCalc5                    : TppDBCalc;
    rpCredBenefDBCalc4                    : TppDBCalc;
    rpCredBenefLabel13                    : TppLabel;
    rpCredBenefLine8                      : TppLine;
    rpCredBenefGroup4                     : TppGroup;
    rpCredBenefGroupHeaderBand4           : TppGroupHeaderBand;
    rpCredBenefDBText11                   : TppDBText;
    rpCredBenefGroupFooterBand4           : TppGroupFooterBand;
    rpCredBenefSubReport1                 : TppSubReport;
    rpCredBenefChildReport1               : TppChildReport;
    rpCredBenefChildReport1Label1         : TppLabel;
    rpCredBenefChildReport1Label2         : TppLabel;
    rpCredBenefChildReport1Label3         : TppLabel;
    rpCredBenefChildReport1Line1          : TppLine;
    rpCredBenefChildReport1DetailBand1    : TppDetailBand;
    rpCredBenefChildReport1DBText1        : TppDBText;
    rpCredBenefChildReport1DBText2        : TppDBText;
    rpCredBenefChildReport1Label4         : TppLabel;
    rpCredBenefChildReport1Line3          : TppLine;
    rpdbcalctotbenef                      : TppDBCalc;
    rpCredBenefDBCalc6                    : TppDBCalc;
    rpCredBenefLabel12                    : TppLabel;
    rpCredBenefDBText12                   : TppDBText;
    rpCredBenefGroup2                     : TppGroup;
    rpCredBenefGroupHeaderBand2           : TppGroupHeaderBand;
    NUMBANCO                              : TppDBText;
    rpCredBenefDBText9                    : TppDBText;
    rpCredBenefLabel15                    : TppLabel;
    rpCredBenefGroupFooterBand2           : TppGroupFooterBand;
    rpCredBenefLabel8                     : TppLabel;
    rpCredBenefDBCalc2                    : TppDBCalc;
    rpCredBenefLine6                      : TppLine;
    rpCredBenefDBText8                    : TppDBText;
    rpCredBenefGroup1                     : TppGroup;
    rpCredBenefGroupHeaderBand1           : TppGroupHeaderBand;
    rpCredBenefDBText6                    : TppDBText;
    rpCredBenefLabel6                     : TppLabel;
    rpCredBenefLine2                      : TppLine;
    rpCredBenefDBText7                    : TppDBText;
    rpCredBenefGroupFooterBand1           : TppGroupFooterBand;
    rpCredBenefLabel4                     : TppLabel;
    rpCredBenefLine5                      : TppLine;
    rpCredBenefDBCalc1                    : TppDBCalc;
    rpCredBenefDBCalc3                    : TppDBCalc;
    rpCredBenefLabel11                    : TppLabel;
    rpCredBenefAgen                       : TppReport;
    ppHeaderBand15                        : TppHeaderBand;
    ppLine12                              : TppLine;
    ppLabel79                             : TppLabel;
    rpCredBenefAgenLabel10                : TppLabel;
    ppDetailBand16                        : TppDetailBand;
    ppFooterBand15                        : TppFooterBand;
    rpCredBenefAgenLine5                  : TppLine;
    rpCredBenefAgenLabel11                : TppLabel;
    rpCredBenefAgenSummaryBand1           : TppSummaryBand;
    rpCredBenefAgenLabel2                 : TppLabel;
    rpCredBenefAgenDBCalc4                : TppDBCalc;
    rpCredBenefAgenLine2                  : TppLine;
    rpCredBenefAgenLine3                  : TppLine;
    rpCredBenefAgenLine4                  : TppLine;
    lblAssina1: TppLabel;
    lblAssina2: TppLabel;
    rpCredBenefAgenLabel12                : TppLabel;
    rpCredBenefAgenDBCalc6                : TppDBCalc;
    ppGroup3                              : TppGroup;
    ppGroupHeaderBand3                    : TppGroupHeaderBand;
    ppDBText25                            : TppDBText;
    ppLine33                              : TppLine;
    ppDBText26                            : TppDBText;
    rpCredBenefAgenMemo1                  : TppMemo;
    rpCredBenefAgenDBText1                : TppDBText;
    rpCredBenefAgenLabel5                 : TppLabel;
    rpCredBenefAgenLabel6                 : TppLabel;
    rpCredBenefAgenDBText3                : TppDBText;
    rpCredBenefAgenDBText4                : TppDBText;
    ppLabel80                             : TppLabel;
    ppLabel81                             : TppLabel;
    ppLabel82                             : TppLabel;
    ppLabel83                             : TppLabel;
    ppLine34                              : TppLine;
    ppGroupFooterBand3                    : TppGroupFooterBand;
    rpCredBenefAgenLine1                  : TppLine;
    rpCredBenefAgenLabel1                 : TppLabel;
    rpCredBenefAgenGroup2                 : TppGroup;
    rpCredBenefAgenGroupHeaderBand2       : TppGroupHeaderBand;
    rpCredBenefAgenGroupFooterBand2       : TppGroupFooterBand;
    rpCredBenefAgenDBCalc2                : TppDBCalc;
    rpCredBenefAgenDBText8                : TppDBText;
    rpCredBenefAgenDBText9                : TppDBText;
    rpCredBenefAgenDBCalc3                : TppDBCalc;
    rpBenEncerDBText1                     : TppDBText;
    rpBenEncerDBText2                     : TppDBText;
    rpBenEncerDBText4                     : TppDBText;
    rpBenEncerDBText5                     : TppDBText;
    rpBenEncerLabel1                      : TppLabel;
    rpBenEncerDBText6                     : TppDBText;
    rpBenEncerLabel2                      : TppLabel;
    rpBenEncerLabel3                      : TppLabel;
    rpBenEncerLabel4                      : TppLabel;
    rpBenEncerLabel5                      : TppLabel;
    rpBenEncerLabel6                      : TppLabel;
    rpBenEncerLabel7                      : TppLabel;
    rpBenEncerLabel8                      : TppLabel;
    rpBenEncerDBText3                     : TppDBText;
    rpBenEncerLine2                       : TppLine;
    rpBenEncerLabel11                     : TppLabel;
    rpBenEncerLine3                       : TppLine;
    rpBenEncerLabel9                      : TppLabel;
    rpBenEncerDBText7                     : TppDBText;
    rpBenEncerLabel10                     : TppLabel;
    rpBenEncerDBText8                     : TppDBText;
    rpBenEncerLabel12                     : TppLabel;
    rpBenEncerDBText9                     : TppDBText;
    rpBenEncerDBText10                    : TppDBText;
    rpBenEncerLabel13                     : TppLabel;
    rpBenEncerMesAno                      : TppLabel;
    ppBDEPipeline2                        : TppBDEPipeline;
    wwDataSource2                         : TwwDataSource;
    wwQuery2                              : TwwQuery;
    ppReport2                             : TppReport;
    ppHeaderBand17                        : TppHeaderBand;
    ppLine35                              : TppLine;
    ppLabel13                             : TppLabel;
    ppLabel14                             : TppLabel;
    ppDetailBand18                        : TppDetailBand;
    ppFooterBand17                        : TppFooterBand;
    ppLabel87                             : TppLabel;
    ppLine36                              : TppLine;
    ppReport2DBText1                      : TppDBText;
    ppReport2DBText2                      : TppDBText;
    qryFundacao                           : TwwQuery;
    dsFundacao                            : TwwDataSource;
    ppFundacao                            : TppBDEPipeline;
    ppBDEPipeline3                        : TppBDEPipeline;
    wwDataSource3                         : TwwDataSource;
    wwQuery3                              : TwwQuery;
    ppReport3                             : TppReport;
    ppHeaderBand18                        : TppHeaderBand;
    ppLine37                              : TppLine;
    ppLabel88                             : TppLabel;
    ppLabel89                             : TppLabel;
    ppDetailBand19                        : TppDetailBand;
    ppFooterBand18                        : TppFooterBand;
    ppLabel90                             : TppLabel;
    ppReport3DBText1                      : TppDBText;
    ppReport3DBText2                      : TppDBText;
    ppReport3Line1                        : TppLine;
    ppReport3Label1                       : TppLabel;
    ppReport3Label2                       : TppLabel;
    ppReport3Line2                        : TppLine;
    ppReport3DBText3                      : TppDBText;
    ppReport3Label3                       : TppLabel;
    rpBenEncerDBImage1                    : TppDBImage;
    rpBenEncerDBText11                    : TppDBText;
    rpBenEncerDBText12                    : TppDBText;
    rpBenEncerDBText13                    : TppDBText;
    rpBenEncerDBText14                    : TppDBText;
    rpBenEncerLabel14                     : TppLabel;
    rpBenEncerDBText15                    : TppDBText;
    rpBenEncerDBText16                    : TppDBText;
    rpBenEncerDBText17                    : TppDBText;
    rpBenEncerDBText18                    : TppDBText;
    ppBenConced                           : TppBDEPipeline;
    dsBenConced                           : TwwDataSource;
    qryBenConced                          : TwwQuery;
    rpBenConced                           : TppReport;
    ppHeaderBand19                        : TppHeaderBand;
    ppLabel8                              : TppLabel;
    ppDetailBand20                        : TppDetailBand;
    ppFooterBand19                        : TppFooterBand;
    ppLabel91                             : TppLabel;
    ppLine39                              : TppLine;
    rpBenConcedDBImage1                   : TppDBImage;
    rpBenConcedDBText1                    : TppDBText;
    rpBenConcedDBText2                    : TppDBText;
    rpBenConcedDBText3                    : TppDBText;
    rpBenConcedDBText4                    : TppDBText;
    rpBenConcedLabel1                     : TppLabel;
    rpBenConcedDBText5                    : TppDBText;
    rpBenConcedDBText6                    : TppDBText;
    rpBenConcedDBText7                    : TppDBText;
    rpBenConcedDBText8                    : TppDBText;
    rpBenConcedLine1                      : TppLine;
    rpBenConcedLabel2                     : TppLabel;
    rpBenConcedLabel3                     : TppLabel;
    rpBenConcedLabel4                     : TppLabel;
    rpBenConcedLabel5                     : TppLabel;
    rpBenConcedLine2                      : TppLine;
    rpBenConcedLabel7                     : TppLabel;
    rpBenConcedDBText10                   : TppDBText;
    rpBenConcedLabel8                     : TppLabel;
    rpBenConcedDBText11                   : TppDBText;
    rpBenConcedDBText12                   : TppDBText;
    rpBenConcedDBText13                   : TppDBText;
    rpBenConcedDBText14                   : TppDBText;
    rpBenEncerDBText19                    : TppDBText;
    rpBenEncerLabel15                     : TppLabel;
    rpBenConcedDBText9                    : TppDBText;
    rpBenConcedLabel6                     : TppLabel;
    plBenefPgto                           : TppBDEPipeline;
    dsBenefPgto                           : TwwDataSource;
    qryBenefPgto                          : TwwQuery;
    rpBenefPgto                           : TppReport;
    ppHeaderBand22                        : TppHeaderBand;
    ppLabel123                            : TppLabel;
    ppDBText55                            : TppDBText;
    ppDBText56                            : TppDBText;
    ppDBText57                            : TppDBText;
    ppDBImage2                            : TppDBImage;
    ppDBText58                            : TppDBText;
    ppDBText59                            : TppDBText;
    ppDetailBand23                        : TppDetailBand;
    ppDBText60                            : TppDBText;
    ppDBText61                            : TppDBText;
    ppDBText62                            : TppDBText;
    ppFooterBand22                        : TppFooterBand;
    ppLabel124                            : TppLabel;
    ppLine41                              : TppLine;
    rpBenefPgtoSummaryBand1               : TppSummaryBand;
    rpBenefPgtoLabel1                     : TppLabel;
    rpBenefPgtoDBCalc2                    : TppDBCalc;
    rpBenefPgtoLine1                      : TppLine;
    rpBenefPgtoDBCalc3                    : TppDBCalc;
    ppGroup7                              : TppGroup;
    ppGroupHeaderBand7                    : TppGroupHeaderBand;
    ppLabel125                            : TppLabel;
    ppDBText63                            : TppDBText;
    ppLine44                              : TppLine;
    ppLine43                              : TppLine;
    ppLabel126                            : TppLabel;
    ppLabel127                            : TppLabel;
    ppLabel128                            : TppLabel;
    ppGroupFooterBand7                    : TppGroupFooterBand;
    ppLabel129                            : TppLabel;
    ppDBCalc7                             : TppDBCalc;
    ppLine42                              : TppLine;
    rpBenefPgtoDBCalc1                    : TppDBCalc;
    rpCredBenefAgenDBText2                : TppDBText;
    rpCredBenefAgenDBText6                : TppDBText;
    rpCredBenefAgenDBText7                : TppDBText;
    rpCredBenefAgenDBImage1               : TppDBImage;
    rpCredBenefAgenDBText10               : TppDBText;
    rpCredBenefAgenDBText11               : TppDBText;
    rpCredBenefDBText10                   : TppDBText;
    rpCredBenefDBText13                   : TppDBText;
    rpCredBenefDBText14                   : TppDBText;
    rpCredBenefDBImage1                   : TppDBImage;
    rpCredBenefDBText15                   : TppDBText;
    rpCredBenefDBText16                   : TppDBText;
    qrySupMaiorMenor                      : TwwQuery;
    dsSupMaiorMenor                       : TwwDataSource;
    plSupMaiorMenor                       : TppBDEPipeline;
    rpSupMaiorMenor                       : TppReport;
    ppHeaderBand23                        : TppHeaderBand;
    ppLabel22                             : TppLabel;
    ppDBText64                            : TppDBText;
    ppDBText65                            : TppDBText;
    ppDBText66                            : TppDBText;
    ppDBImage3                            : TppDBImage;
    ppDBText67                            : TppDBText;
    ppDBText68                            : TppDBText;
    ppDetailBand24                        : TppDetailBand;
    ppDBText69                            : TppDBText;
    ppDBText71                            : TppDBText;
    ppFooterBand23                        : TppFooterBand;
    ppLabel44                             : TppLabel;
    ppLine45                              : TppLine;
    ppSummaryBand2                        : TppSummaryBand;
    ppLabel84                             : TppLabel;
    ppDBCalc8                             : TppDBCalc;
    ppLine46                              : TppLine;
    ppDBCalc9                             : TppDBCalc;
    ppGroup9                              : TppGroup;
    ppGroupHeaderBand9                    : TppGroupHeaderBand;
    ppLabel86                             : TppLabel;
    ppDBText72                            : TppDBText;
    ppLine47                              : TppLine;
    ppLine48                              : TppLine;
    ppLabel130                            : TppLabel;
    ppLabel131                            : TppLabel;
    ppLabel132                            : TppLabel;
    ppGroupFooterBand9                    : TppGroupFooterBand;
    ppGroup10                             : TppGroup;
    ppGroupHeaderBand10                   : TppGroupHeaderBand;
    ppGroupFooterBand10                   : TppGroupFooterBand;
    rpSupMaiorMenorLabel1                 : TppLabel;
    rpSupMaiorMenorLabel2                 : TppLabel;
    rpSupMaiorMenorDBCalc1                : TppDBCalc;
    rpSupMaiorMenorDBCalc2                : TppDBCalc;
    rpSupMaiorMenorDBText1                : TppDBText;
    rpSupMaiorMenorDBText2                : TppDBText;
    rpRelPensBancoDBText1                 : TppDBText;
    rpRelPensBancoDBText2                 : TppDBText;
    rpRelPensBancoDBText3                 : TppDBText;
    rpRelPensBancoDBImage1                : TppDBImage;
    rpRelPensBancoDBText4                 : TppDBText;
    rpRelPensBancoDBText5                 : TppDBText;
    rpRelPensAlimDBText1                  : TppDBText;
    rpRelPensAlimDBText2                  : TppDBText;
    rpRelPensAlimDBText3                  : TppDBText;
    rpRelPensAlimDBImage1                 : TppDBImage;
    rpRelPensAlimDBText4                  : TppDBText;
    rpRelPensAlimDBText5                  : TppDBText;
    qrySub01                              : TwwQuery;
    dsSub01                               : TwwDataSource;
    plSub01                               : TppBDEPipeline;
    rpCredBenefDBText17                   : TppDBText;
    rpCredBenefDBText19                   : TppDBText;
    rpCredBenefLabel10                    : TppLabel;
    rpCredBenefLabel17                    : TppLabel;
    rpCredBenefLine1                      : TppLine;
    rpCredBenefLine10                     : TppLine;
    rpCredBenefLabel18                    : TppLabel;
    rpCredBenefLabel19                    : TppLabel;
    rpCredBenefLine9                      : TppLine;
    rpCredBenefChildReport1HeaderBand1    : TppHeaderBand;
    rpCredBenefLine3                      : TppLine;
    rpCredBenefChildReport1DBText3        : TppDBText;
    rpCredBenefChildReport1DBText4        : TppDBText;
    rpCredBenefChildReport1DBText5        : TppDBText;
    rpCredBenefChildReport1DBImage1       : TppDBImage;
    rpCredBenefChildReport1DBText6        : TppDBText;
    rpCredBenefChildReport1DBText7        : TppDBText;
    rpRelPensBancoLabel1                  : TppLabel;
    rpRelPensBancoDBText6                 : TppDBText;
    rpRelPensBancoLine1                   : TppLine;
    rpRelPensBancoLine2                   : TppLine;
    rpSupMaiorMenorLabel3                 : TppLabel;
    rpSupMaiorMenorDBText3                : TppDBText;
    rpSupMaiorMenorLabel4                 : TppLabel;
    rpSupMaiorMenorDBCalc3                : TppDBCalc;
    rpSupMaiorMenorDBCalc4                : TppDBCalc;
    rpSupMaiorMenorLabel5                 : TppLabel;
    lbOrdem01                             : TppLabel;
    rpBenConcedLabel9                     : TppLabel;
    rpBenConcedDBCalc1                    : TppDBCalc;
    rpBenConcedLabel10                    : TppLabel;
    rpBenConcedDBText15                   : TppDBText;
    rpBenConcedDBCalc2                    : TppDBCalc;
    rpBenConcedLabel11                    : TppLabel;
    rpBenConcedLine3                      : TppLine;
    qryBenefConcedSub                     : TwwQuery;
    dsBenefConcedSub                      : TwwDataSource;
    plBenefConcedSub                      : TppBDEPipeline;
    rpBenConcedSummaryBand1               : TppSummaryBand;
    SubReport01                           : TppSubReport;
    rpBenConcedChildReport1TitleBand1     : TppTitleBand;
    rpBenConcedChildReport1DetailBand1    : TppDetailBand;
    rpBenConcedChildReport1SummaryBand1   : TppSummaryBand;
    rpBenConcedChildReport1Label1         : TppLabel;
    rpBenConcedChildReport1DBImage1       : TppDBImage;
    rpBenConcedChildReport1DBText1        : TppDBText;
    rpBenConcedChildReport1DBText2        : TppDBText;
    rpBenConcedChildReport1DBText3        : TppDBText;
    rpBenConcedChildReport1DBText4        : TppDBText;
    rpBenConcedChildReport1Label2         : TppLabel;
    rpBenConcedChildReport1DBText5        : TppDBText;
    rpBenConcedChildReport1DBText6        : TppDBText;
    rpBenConcedChildReport1DBText7        : TppDBText;
    rpBenConcedChildReport1DBText8        : TppDBText;
    rpBenConcedChildReport1Label3         : TppLabel;
    rpBenConcedChildReport1Label6         : TppLabel;
    rpBenConcedChildReport1Line1          : TppLine;
    rpBenConcedChildReport1DBText9        : TppDBText;
    rpBenConcedChildReport1DBText10       : TppDBText;
    rpBenConcedChildReport1Line2          : TppLine;
    rpBenConcedChildReport1DBCalc1        : TppDBCalc;
    rpBenConcedChildReport1Label4         : TppLabel;
    rpBenefPgtoDBText1                    : TppDBText;
    rpBenefPgtoLabel2                     : TppLabel;
    SubReport02                           : TppSubReport;
    qrySubReport02                        : TwwQuery;
    dsSubReport02                         : TwwDataSource;
    plSubReport02                         : TppBDEPipeline;
    rpBenefPgtoChildReport1TitleBand1     : TppTitleBand;
    rpBenefPgtoChildReport1DetailBand1    : TppDetailBand;
    rpBenefPgtoChildReport1SummaryBand1   : TppSummaryBand;
    rpBenefPgtoChildReport1Label1         : TppLabel;
    rpBenefPgtoChildReport1DBText1        : TppDBText;
    rpBenefPgtoChildReport1DBText2        : TppDBText;
    rpBenefPgtoChildReport1DBText3        : TppDBText;
    rpBenefPgtoChildReport1DBImage1       : TppDBImage;
    rpBenefPgtoChildReport1DBText4        : TppDBText;
    rpBenefPgtoChildReport1DBText5        : TppDBText;
    rpBenefPgtoChildReport1Line1          : TppLine;
    rpBenefPgtoChildReport1Label2         : TppLabel;
    rpBenefPgtoChildReport1Label3         : TppLabel;
    rpBenefPgtoChildReport1DBText6        : TppDBText;
    rpBenefPgtoChildReport1DBText7        : TppDBText;
    rpBenefPgtoChildReport1Line2          : TppLine;
    rpBenefPgtoChildReport1DBCalc1        : TppDBCalc;
    rpRelPensBancoDBCalc1                 : TppDBCalc;
    rpRelPensBancoLabel2                  : TppLabel;
    qryBenefPendentes                     : TwwQuery;
    plBenefPendentes                      : TppBDEPipeline;
    rpBenefPendentes                      : TppReport;
    ppHeaderBand2                         : TppHeaderBand;
    ppLabel4                              : TppLabel;
    ppDBText81                            : TppDBText;
    ppDBText82                            : TppDBText;
    ppDBText83                            : TppDBText;
    ppDBImage5                            : TppDBImage;
    ppDBText84                            : TppDBText;
    ppDBText85                            : TppDBText;
    ppDetailBand2                         : TppDetailBand;
    ppDBText86                            : TppDBText;
    ppDBText87                            : TppDBText;
    ppDBText88                            : TppDBText;
    ppDBText89                            : TppDBText;
    ppLabel5                              : TppLabel;
    ppFooterBand2                         : TppFooterBand;
    ppLabel6                              : TppLabel;
    ppLine3                               : TppLine;
    ppGroup13                             : TppGroup;
    ppGroupHeaderBand13                   : TppGroupHeaderBand;
    ppGroupFooterBand13                   : TppGroupFooterBand;
    ppLabel133                            : TppLabel;
    ppDBCalc10                            : TppDBCalc;
    ppLine4                               : TppLine;
    ppLabel140                            : TppLabel;
    ppGroup14                             : TppGroup;
    ppGroupHeaderBand14                   : TppGroupHeaderBand;
    ppLabel141                            : TppLabel;
    ppLabel142                            : TppLabel;
    ppLine11                              : TppLine;
    ppLabel143                            : TppLabel;
    ppLabel144                            : TppLabel;
    ppLabel145                            : TppLabel;
    ppLabel146                            : TppLabel;
    ppLine50                              : TppLine;
    ppLabel147                            : TppLabel;
    ppGroupFooterBand14                   : TppGroupFooterBand;
    ppLabel148                            : TppLabel;
    ppDBCalc11                            : TppDBCalc;
    ppLine53                              : TppLine;
    ppLabel149                            : TppLabel;
    ppGroup15                             : TppGroup;
    ppGroupHeaderBand15                   : TppGroupHeaderBand;
    ppGroupFooterBand15                   : TppGroupFooterBand;
    dsBenefPendentes                      : TwwDataSource;
    rpBenefPendentesDBText1               : TppDBText;
    rpBenefPendentesDBText2               : TppDBText;
    QryBenefSituacao                      : TwwQuery;
    plBenefSituacao                       : TppBDEPipeline;
    rpBenefSituacao                       : TppReport;
    ppHeaderBand25                        : TppHeaderBand;
    lbTituloSituacao                      : TppLabel;
    ppDBText90                            : TppDBText;
    ppDBText91                            : TppDBText;
    ppDBText92                            : TppDBText;
    ppDBImage6                            : TppDBImage;
    ppDBText93                            : TppDBText;
    ppDBText94                            : TppDBText;
    ppDetailBand26                        : TppDetailBand;
    ppDBText95                            : TppDBText;
    ppDBText96                            : TppDBText;
    ppDBText97                            : TppDBText;
    ppDBText98                            : TppDBText;
    ppLabel151                            : TppLabel;
    ppFooterBand25                        : TppFooterBand;
    ppLabel152                            : TppLabel;
    ppLine54                              : TppLine;
    ppGroup16                             : TppGroup;
    ppGroupHeaderBand16                   : TppGroupHeaderBand;
    ppGroupFooterBand16                   : TppGroupFooterBand;
    ppLabel153                            : TppLabel;
    ppDBCalc12                            : TppDBCalc;
    ppLine55                              : TppLine;
    ppLabel154                            : TppLabel;
    ppGroup17                             : TppGroup;
    ppGroupHeaderBand17                   : TppGroupHeaderBand;
    ppLabel155                            : TppLabel;
    ppLabel156                            : TppLabel;
    ppLine56                              : TppLine;
    ppLabel157                            : TppLabel;
    lbDataReq: TppLabel;
    lbDataIni: TppLabel;
    ppLabel160                            : TppLabel;
    ppLine57                              : TppLine;
    ppLabel161                            : TppLabel;
    ppDBText99                            : TppDBText;
    ppDBText100                           : TppDBText;
    ppGroupFooterBand17                   : TppGroupFooterBand;
    ppLabel162                            : TppLabel;
    ppDBCalc13                            : TppDBCalc;
    ppLine58                              : TppLine;
    ppLabel163                            : TppLabel;
    ppGroup18                             : TppGroup;
    ppGroupHeaderBand18                   : TppGroupHeaderBand;
    ppGroupFooterBand18                   : TppGroupFooterBand;
    dsBenefSituacao                       : TwwDataSource;
    rpCredBenefBanAux: TppReport;
    ppHeaderBand24: TppHeaderBand;
    ppLabel67: TppLabel;
    ppLine13: TppLine;
    ppLabel70: TppLabel;
    ppLabel92: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLine49: TppLine;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLabel138: TppLabel;
    ppDBText16: TppDBText;
    ppDBText70: TppDBText;
    ppDBText73: TppDBText;
    ppDBImage4: TppDBImage;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDetailBand25: TppDetailBand;
    ppFooterBand24: TppFooterBand;
    ppLine51: TppLine;
    ppLabel139: TppLabel;
    ppSummaryBand3: TppSummaryBand;
    ppLabel150: TppLabel;
    ppDBCalc14: TppDBCalc;
    ppLine52: TppLine;
    ppLabel158: TppLabel;
    ppDBCalc15: TppDBCalc;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppGroupFooterBand11: TppGroupFooterBand;
    rpCredBenefBanDBText6: TppDBText;
    rpCredBenefBanDBText7: TppDBText;
    rpCredBenefBanDBText8: TppDBText;
    rpCredBenefBanDBText9: TppDBText;
    ppBDEPipeline4: TppBDEPipeline;
    dsReciboAdiantamento: TwwDataSource;
    qryReciboAdiantamento: TwwQuery;
    ppReportReciboAdiantamento: TppReport;
    ppReportReciboAdiantamentoTitleBand1: TppTitleBand;
    ppReportReciboAdiantamentoShape7: TppShape;
    ppReportReciboAdiantamentoLabel1: TppLabel;
    Titulo: TppLabel;
    ppReportReciboAdiantamentoDetailBand1: TppDetailBand;
    ppReportReciboAdiantamentoShape6: TppShape;
    ppReportReciboAdiantamentoDBMemo1: TppDBMemo;
    ppReportReciboAdiantamentoFooterBand1: TppFooterBand;
    ppReportReciboAdiantamentoShape1: TppShape;
    ppReportReciboAdiantamentoShape3: TppShape;
    ppReportReciboAdiantamentoShape4: TppShape;
    ppReportReciboAdiantamentoShape2: TppShape;
    ppReportReciboAdiantamentoLabel10: TppLabel;
    ppReportReciboAdiantamentoLabel11: TppLabel;
    ppReportReciboAdiantamentoLabel12: TppLabel;
    ppReportReciboAdiantamentoLabel13: TppLabel;
    ppReportReciboAdiantamentoLabel14: TppLabel;
    ppReportReciboAdiantamentoLabel15: TppLabel;
    ppReportReciboAdiantamentoLabel16: TppLabel;
    ppReportReciboAdiantamentoLabel17: TppLabel;
    ppReportReciboAdiantamentoLabel19: TppLabel;
    ppReportReciboAdiantamentoLine1: TppLine;
    ppReportReciboAdiantamentoLabel20: TppLabel;
    ppReportReciboAdiantamentoLabel21: TppLabel;
    ppReportReciboAdiantamentoLabel22: TppLabel;
    ppReportReciboAdiantamentoLabel23: TppLabel;
    ppReportReciboAdiantamentoShape5: TppShape;
    ppReportReciboAdiantamentoLabel24: TppLabel;
    sNome: TppLabel;
    sBanco: TppLabel;
    sAgencia: TppLabel;
    sCPF1: TppLabel;
    sIdentidade: TppLabel;
    sOE: TppLabel;
    sCC: TppLabel;
    sUF: TppLabel;
    rpMemObs: TppMemo;
    ppBDEPipelineReciboAdiantamento: TppBDEPipeline;
    qryFundacaoNOME: TStringField;
    qryFundacaoRAZAOSOCIAL: TStringField;
    qryFundacaoLOGRADOURO: TStringField;
    qryFundacaoNUMERO: TStringField;
    qryFundacaoCOMPLEMENTO: TStringField;
    qryFundacaoBAIRRO: TStringField;
    qryFundacaoCIDADE: TStringField;
    qryFundacaoCODESTADO: TStringField;
    qryFundacaoCEP: TStringField;
    qryFundacaoIMAGEM: TBlobField;
    qryFundacaoENDERECO: TStringField;
    qryFundacaoBARCIDUF: TStringField;
    ppDBText17: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    rpRelFolhaPenAlimDBText1: TppDBText;
    rpRelFolhaPenAlimLabel3: TppLabel;
    rpRelFolhaPenAlimDBText2: TppDBText;
    ppLabel77: TppLabel;
    ppDBText23: TppDBText;
    ppDBText21: TppDBText;
    ppDBText24: TppDBText;
    lblFolha: TppLabel;
    rpRelPensAlimLabel1: TppLabel;
    lblpatro: TppLabel;
    rpCredBenefLabel20: TppLabel;
    rpCredBenefDBText18: TppDBText;
    dsCredBenefAgen: TwwDataSource;
    qryCredBenefAgen: TwwQuery;
    qryCredBenefAgenCODPORTFORMA: TFloatField;
    qryCredBenefAgenCENTRALIZA: TStringField;
    qryCredBenefAgenNUMBANCO: TStringField;
    qryCredBenefAgenNOME: TStringField;
    qryCredBenefAgenAGENCIA: TStringField;
    qryCredBenefAgenVALOR: TFloatField;
    qryCredBenefAgenQUANTIDADE: TFloatField;
    qryCredBenefAgenNUMAGENCIA: TStringField;
    qryCredBenefAgenNOCONTACORR: TStringField;
    rpCredBenefAgenDBText12: TppDBText;
    rpCredBenefAgenDBText13: TppDBText;
    rpCredBenefAgenLine6: TppLine;
    rpCredBenefAgenLabel3: TppLabel;
    rpCredBenefAgenDBCalc1: TppDBCalc;
    rpCredBenefAgenDBCalc5: TppDBCalc;
    ppCredBenefBan: TppBDEPipeline;
    dsCredBenefBan: TwwDataSource;
    QryCredBenefBan: TwwQuery;
    QryCredBenefBanNUMBANCO: TStringField;
    QryCredBenefBanNOME: TStringField;
    QryCredBenefBanVALOR: TFloatField;
    QryCredBenefBanQUANTIDADE: TFloatField;
    rpCredBenefChildReport1FooterBand1: TppFooterBand;
    rpCredBenefChildReport1Line2: TppLine;
    rpCredBenefChildReport1Label5: TppLabel;
    qryRelLayout: TwwQuery;
    dsLayout: TwwDataSource;
    plLayout: TppBDEPipeline;
    ppLayout: TppReport;
    ppHeaderBand29: TppHeaderBand;
    ppLabel166: TppLabel;
    ppLine66: TppLine;
    ppLine67: TppLine;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText103: TppDBText;
    ppDBImage8: TppDBImage;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppLabel167: TppLabel;
    ppLayoutLabel1: TppLabel;
    lblRubrica: TppLabel;
    lblMesRef: TppLabel;
    ppLayoutLabel2: TppLabel;
    ppLayoutLabel4: TppLabel;
    ppLayoutLabel5: TppLabel;
    ppLayoutLine1: TppLine;
    ppDetailBand30: TppDetailBand;
    ppDBText108: TppDBText;
    ppLayoutDBText1: TppDBText;
    ppLayoutDBText2: TppDBText;
    ppFooterBand29: TppFooterBand;
    ppLine68: TppLine;
    ppLabel169: TppLabel;
    ppSummaryBand5: TppSummaryBand;
    ppLabel170: TppLabel;
    ppLayoutDBCalc1: TppDBCalc;
    ppLayoutDBCalc2: TppDBCalc;
    ppLayoutDBText3: TppDBText;
    ppLayoutLabel6: TppLabel;
    ppLayoutLabel7: TppLabel;
    rpCredBenefBan: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLabel85: TppLabel;
    ppReport1Line3: TppLine;
    ppReport1Label3: TppLabel;
    ppReport1Label4: TppLabel;
    ppReport1Label5: TppLabel;
    ppReport1Label6: TppLabel;
    ppReport1Line4: TppLine;
    ppLabelVersao: TppLabel;
    rpCredBenefBanDBText1: TppDBText;
    rpCredBenefBanDBText2: TppDBText;
    rpCredBenefBanDBText3: TppDBText;
    rpCredBenefBanDBImage1: TppDBImage;
    rpCredBenefBanDBText4: TppDBText;
    rpCredBenefBanDBText5: TppDBText;
    ppDetailBand17: TppDetailBand;
    rpCredBenefBanDBText10: TppDBText;
    rpCredBenefBanDBText11: TppDBText;
    rpCredBenefBanDBText12: TppDBText;
    rpCredBenefBanDBText13: TppDBText;
    ppFooterBand16: TppFooterBand;
    rpCredBenefBanLine1: TppLine;
    rpCredBenefBanLabel3: TppLabel;
    lbAssina1: TppLabel;
    lbAssina2: TppLabel;
    rpCredBenefBanLine2: TppLine;
    rpCredBenefBanLine3: TppLine;
    rpCredBenefBanSummaryBand1: TppSummaryBand;
    ppReport1Label7: TppLabel;
    ppReport1DBCalc1: TppDBCalc;
    ppReport1Line5: TppLine;
    rpCredBenefBanLabel1: TppLabel;
    ppDBCalc3: TppDBCalc;
    rpCredBenefBanDBCalc1: TppDBCalc;
    rpCredBenefBanLabel6: TppLabel;
    ppCalc47: TppSystemVariable;
    ppCalc48: TppSystemVariable;
    rpCredBenefBanCalc1: TppSystemVariable;
    rpCredBenefBanCalc2: TppSystemVariable;
    ppReportReciboAdiantamentoCalc1: TppSystemVariable;
    ppCalc39: TppSystemVariable;
    ppCalc40: TppSystemVariable;
    ppCalc41: TppSystemVariable;
    ppCalc42: TppSystemVariable;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppCalc37: TppSystemVariable;
    ppCalc38: TppSystemVariable;
    ppCalc35: TppSystemVariable;
    ppCalc36: TppSystemVariable;
    ppCalc29: TppSystemVariable;
    ppCalc30: TppSystemVariable;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    rpCredBenefAgenCalc1: TppSystemVariable;
    rpCredBenefAgenCalc2: TppSystemVariable;
    rpCredBenefCalc1: TppSystemVariable;
    rpCredBenefCalc2: TppSystemVariable;
    rpCredBenefChildReport1Calc1: TppSystemVariable;
    rpCredBenefChildReport1Calc2: TppSystemVariable;
    ppCalc25: TppSystemVariable;
    ppCalc26: TppSystemVariable;
    ppCalc23: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    ppCalc21: TppSystemVariable;
    ppCalc22: TppSystemVariable;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    ppLine71: TppLine;
    lblDescricao: TppLabel;
    ppLabel23: TppLabel;
    ppDBText119: TppDBText;
    ppLabel40: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppLblMatricula: TppLabel;
    ppDBText37: TppDBText;
    ppLblPortadorForma: TppLabel;
    ppDBText38: TppDBText;
    rpRelCredPenAlimLabel5: TppLabel;
    rpRelCredPenAlimDBText11: TppDBText;
    ppLblMatric: TppLabel;
    ppDbMatric: TppDBText;
    ppLblPortForma: TppLabel;
    ppDbPortForma: TppDBText;
    ppDBText18: TppDBText;
    Panel1: TPanel;
    Panel2: TPanel;
    ppReport4: TppReport;
    ppReport4HeaderBand1: TppHeaderBand;
    ppReport4DetailBand1: TppDetailBand;
    ppReport4FooterBand1: TppFooterBand;
    ppShapeCor: TppShape;
//*---------------------------------------------------------------------------------*//
    procedure rpCredBenefChildReport1TitleBand1BeforePrint(Sender: TObject);
    procedure rpCredBenefChildReport1DetailBand1BeforePrint(Sender: TObject);
    procedure rpCredBenefSubReport1Print(Sender: TObject);
    procedure NomePatroPrint(Sender: TObject);
    procedure LblEmpresaPrint(Sender: TObject);
    procedure LblSistemaPrint(Sender: TObject);
    procedure ppLabel97GetText(Sender: TObject; var Text: String);
    procedure qryCredBenefBeforeOpen(DataSet: TDataSet);
    procedure qryCredBenefAfterClose(DataSet: TDataSet);
    procedure qryEntSaiFolhaBeforeOpen(DataSet: TDataSet);
    procedure qryEntSaiFolhaAfterClose(DataSet: TDataSet);
    procedure qryEntradaBeforeOpen(DataSet: TDataSet);
    procedure qryEntradaAfterClose(DataSet: TDataSet);
    procedure qrySupMaiorMenorBeforeClose(DataSet: TDataSet);
    procedure qryRelPensBancoBeforeOpen(DataSet: TDataSet);
    procedure qryRelPensBancoAfterClose(DataSet: TDataSet);
    procedure qryRelPensAlimBeforeOpen(DataSet: TDataSet);
    procedure qryRelPensAlimAfterClose(DataSet: TDataSet);
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    procedure qryAporpContabilBeforeOpen(DataSet: TDataSet);
    procedure qryAporpContabilAfterClose(DataSet: TDataSet);
//*---------------------------------------------------------------------------------*//
    function MostraParam(Form: string): boolean; override;
    procedure qryBenConcedBeforeClose(DataSet: TDataSet);
    procedure QryCredBenefBanBeforeOpen(DataSet: TDataSet);
    procedure qryRelPensAlimAfterOpen(DataSet: TDataSet);
    procedure qryBenefAlterBeforeOpen(DataSet: TDataSet);
    procedure qryBenefAlterAfterOpen(DataSet: TDataSet);
    procedure qryCredBenefBeneficioBeforeOpen(DataSet: TDataSet);
    procedure qryCredBenefBeneficioAfterOpen(DataSet: TDataSet);
    procedure qryCredBenefAfterOpen(DataSet: TDataSet);
    procedure rpCredBenefAgenSummaryBand1BeforePrint(Sender: TObject);
    procedure qryCredBenefAgenBeforeOpen(DataSet: TDataSet);
    procedure rpCredBenefBanSummaryBand1AfterPrint(Sender: TObject);
    procedure qryCredBenefAgenAfterOpen(DataSet: TDataSet);
    procedure qryCredBenefAgenAfterClose(DataSet: TDataSet);
    procedure QryCredBenefBanAfterOpen(DataSet: TDataSet);
    procedure QryCredBenefBanAfterClose(DataSet: TDataSet);
    procedure ppGroupFooterBand3BeforePrint(Sender: TObject);
    procedure qryRelCadPensaoAfterOpen(DataSet: TDataSet);

    procedure rpCredBenefBanSummaryBand1BeforePrint(Sender: TObject);
    procedure qryRelLayoutAfterClose(DataSet: TDataSet);
    procedure ppSummaryBand5AfterPrint(Sender: TObject);
    procedure qryRelLayoutBeforeOpen(DataSet: TDataSet);

    procedure ppFooterBand13AfterPrint(Sender: TObject);
    procedure qrydemonstpag1BeforeOpen(DataSet: TDataSet);
    procedure qrydemonstpag1BeforeClose(DataSet: TDataSet);
    procedure ppFooterBand21AfterPrint(Sender: TObject);
    procedure ppShapeCorPrint(Sender: TObject);
    procedure rpCredBenefBanStartPage(Sender: TObject);
  private
    { Private declarations }
    Total, Total4, Total5 : Real;
    cMudaCor : TColor;
    MudaCor  : TColor;
    procedure SetColor(Cor: TColor);
  public
    { Public declarations }

  published
    property CorZebra: TColor read cMudaCor write SetColor;
 end;

var
  dtmRelFolha  : TdtmRelFolha;
  dTotReajuste : Double;
  bFaz         : Boolean;
  iIdPlano     : Integer;
  sAnoMes      : String;

implementation

uses
  FPRelPAFavor,            FPRelCredBenef,            FParamRelRendasAlteradas,
  FParamRelPensAlim,       FParamRelPensBanco,        FPRelCredbenefBan,
  FPRelCredBenefAgen,      FPRelBenefEncer,           FPRelBenConced,
  UAdmPrevFB,                FParamRelBenefPgto,
  FParamRelSuplMaiorMenor, FParamRelApropContabil,    FParamRelBenefPendentes,
  FParamBenefSituacao,     FAguarde,                  FpRelLayout;

{$R *.DFM}

function TdtmRelFolha.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     if UPPERCASE(Form)      = 'FRMPRELPAFAVOR'            then frm := TfrmPRelPAFavor.Create(Application)
     else if UPPERCASE(Form) = 'FRMPRELCREDBENEF'          then frm := TfrmPRelCredBenef.Create(Application)
     else if UPPERCASE(Form) = 'FRMPRELRENDASALTERADAS'    then frm := TfrmPRelRendasAlteradas.Create(Application)
     else if UPPERCASE(Form) = 'FRMPARAMRELPENSBANCO'      then frm := TfrmParamRelPensBanco.Create(Application)
     else if UPPERCASE(Form) = 'FRMPARAMRELPENSALIM'       then frm := TfrmParamRelPensAlim.Create(Application)
     else if UPPERCASE(Form) = 'FRMPRELCREDBENEF'          then frm := TfrmPRelCredBenef.Create(Application)
     else if UPPERCASE(Form) = 'FRMPRELCREDBENEFAGEN'      then frm := TfrmPRelCredBenefAgen.Create(Application)
     else if UPPERCASE(Form) = 'FRMPRELBENCONCED'          then frm := TfrmPRelBenConced.Create(Application)
     else if UPPERCASE(Form) = 'FRMFPRELBENEFENCER'        then frm := TfrmFPRelBenefEncer.Create(Application)
     else if UPPERCASE(Form) = 'FRMBENEFPGTO'              then frm := TfrmBenefPgto.Create(Application)
     else if UPPERCASE(Form) = 'FRMPARAMRELSUPLMAIORMENOR' then frm := TfrmParamRelSuplMaiorMenor.Create(Application)
     else if UPPERCASE(Form) = 'FRMAPROPCONTABIL'          then frm := TfrmApropContabil.Create(Application)
     else if UPPERCASE(Form) = 'FRMPARAMRELBENEFPENDENTES' then frm := TfrmParamRelBenefPendentes.Create(Application)
     else if UPPERCASE(Form) = 'FRMPARAMBENEFSITUACAO'     then frm := TfrmParamRelBenefSituacao.Create(Application)
     else if UPPERCASE(Form) = 'FRMPRELCREDBENEFBAN'       then frm := TfrmPRelCredBenefBan.Create(Application)
     else if UPPERCASE(Form) = 'FRMPRELLAYOUT'             then frm := TfrmPRelLayout.Create(Application)
     else frm := nil;

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

procedure TDtmRelFolha.SetColor(Cor: TColor);
begin
  cMudaCor := Cor;
end;

procedure TdtmRelFolha.rpCredBenefChildReport1TitleBand1BeforePrint(Sender: TObject);
begin
  inherited;
  Total := 0;
end;

procedure TdtmRelFolha.rpCredBenefChildReport1DetailBand1BeforePrint(Sender: TObject);
begin
  inherited;
  Total := Total + qryCredBenefBeneficio.FieldByName('SUM(HST.VLBENEFPGTO)').AsFloat;
end;

procedure TdtmRelFolha.rpCredBenefSubReport1Print(Sender: TObject);
begin
  inherited;
  with qryCredBenefBeneficio do
  begin
    Filtered := False;
    Filter   := 'IDBANCO = ' + qryCredBenef.FieldbyName('IDBANCO').AsString +
                ' AND IDPESSJUR = ' + qryCredBenef.FieldbyName('IDPESSJUR').AsString;
    Filtered := True;
  end;
end;

procedure TdtmRelFolha.LblEmpresaPrint(Sender: TObject);
begin
  inherited;
  //Impressão do Nome da Empresa No Cabeçalho do Relatório
  (Sender as TppLabel).Caption := Sistema.NomeEmpresa;
end;

procedure TdtmRelFolha.LblSistemaPrint(Sender: TObject);
begin
  inherited;
  //Impressão do Nome do Módulo + Versão no Rodapé do Relatório
  (Sender as TppLabel).Caption := Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

procedure TdtmRelFolha.NomePatroPrint(Sender: TObject);
begin
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelFolha.ppLabel97GetText(Sender: TObject; var Text: String);
begin
  inherited;
  //Impressão do Nome do Módulo + Versão no Rodapé do Relatório
  (Sender as TppLabel).Caption := Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

procedure TdtmRelFolha.qryCredBenefBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelFolha.qryCredBenefAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelFolha.qryEntSaiFolhaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelFolha.qryEntSaiFolhaAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelFolha.qryEntradaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelFolha.qryEntradaAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelFolha.qrySupMaiorMenorBeforeClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelFolha.pAbreFundacao;
begin
  inherited;
  QryFundacao.Close;
  QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  QryFundacao.Open;
end;

procedure TdtmRelFolha.pFechaFundacao;
begin
  inherited;
  QryFundacao.Close;
end;

procedure TdtmRelFolha.qryRelPensBancoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelFolha.qryRelPensBancoAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelFolha.qryRelPensAlimBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelFolha.qryRelPensAlimAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelFolha.qryAporpContabilBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelFolha.qryAporpContabilAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelFolha.qryBenConcedBeforeClose(DataSet: TDataSet);
begin
  inherited;
  // Fecha Query do Cabeçalho
  qryFundacao.Close;
end;

procedure TdtmRelFolha.QryCredBenefBanBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelFolha.qryRelPensAlimAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelFolha.qryBenefAlterBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Repaint;
  frmAguarde.SetFocus;
end;

procedure TdtmRelFolha.qryBenefAlterAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelFolha.qryCredBenefBeneficioBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Repaint;
end;

procedure TdtmRelFolha.qryCredBenefBeneficioAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelFolha.qryCredBenefAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelFolha.rpCredBenefAgenSummaryBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelFolha.qryCredBenefAgenBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelFolha.rpCredBenefBanSummaryBand1AfterPrint(
  Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelFolha.qryCredBenefAgenAfterOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelFolha.qryCredBenefAgenAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelFolha.QryCredBenefBanAfterOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelFolha.QryCredBenefBanAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelFolha.ppGroupFooterBand3BeforePrint(Sender: TObject);
begin
  inherited;
  rpCredBenefAgenLine3.visible:=true;
  lblAssina1.visible:=true;
  rpCredBenefAgenLine4.visible:=true;
  lblAssina2.visible:=true;
end;

procedure TdtmRelFolha.qryRelCadPensaoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelFolha.rpCredBenefBanSummaryBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelFolha.qryRelLayoutAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelFolha.ppSummaryBand5AfterPrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelFolha.qryRelLayoutBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelFolha.ppFooterBand13AfterPrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRelFolha.qrydemonstpag1BeforeOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelFolha.qrydemonstpag1BeforeClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelFolha.ppFooterBand21AfterPrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;
procedure TdtmRelFolha.ppShapeCorPrint(Sender: TObject);
begin
  inherited;
  If MudaCor = CorZebra Then
    MudaCor := clWhite
  else
    MudaCor := CorZebra;
  TppShape(Sender).Brush.Color := MudaCor;
end;

procedure TdtmRelFolha.rpCredBenefBanStartPage(Sender: TObject);
begin
  inherited;
  MudaCor := CorZebra;
  ppShapeCor.Brush.Color := clWhite;
end;

end.

{==============================================================================|
| UNIT: DRELFOLHA                                                              |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   DATA MODULE DE RELATORIOS DA FOLHA                                         |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 12.07.2001 A 12.07.2001                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   SUBSTITUI MES POR MESCOBRANCA NA QUERY QRYFICHAFINANC                      |
| O RELATORIO DE FICHA FINANCEIRA TEM COMO REPORT RPFICHAFINANC                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 25.09.2001 A 25.09.2001                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ALTERAÇÃO NA QUERY QRYDEMONSTPAG E NO RELATÓRIO DE SEGUNDA VIA DO CONTRA   |
| CHEQUE.                                                                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/03/2002 A 02/03/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - USAR O FLGESTORNO NAS CONSULTAS DOS RELATÓRIOS DE BANCO E BANCO/AGENCIA E  |
| RESUMO DE RUBRICAS.                                                          |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/04/2002 A 30/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12J                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    FORAM COLOCADOS MAIS DOIS FILTROS, POR PATROCINADORA E POR PLANO E TAMBÉM |
|  O CAMPO MES DE REFERÊNCIA COMO PEDIU O MENEZES                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FLAVIO DIAS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 15/05/2002 A 15/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12q                                              |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - em rpCredBenef ==> TROCAR EM rpCredBenefDBText9 O DATAFIELD P/ BANCO       |
| - em rpCredBenef ==> TROCAR EM rpCredBenefDBText8 O DATAFIELD P/ BANCO       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/07/2002 A 22/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Foi colocado mais o filtro flgdesativado = 0 na qryRelLayout             |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei B Marins.                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/07/2002 A 23/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF  - Pendencia 7664.                                           |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Modificação para exibir código/descrição externa |
|  conforme a parametrização na tabela PARAMAPREV.                             |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/09/2002 A 10/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO NO RELATORIO DE PAGAMENTOS POR BANCO PARA SEMPRE USAR AS INFOR-  |
| MAÇÕES DE BANCO DA HISTRUBSAL E NÃO DA CONTABANCARIA.                        |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/12/2002 A 03/12/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT) Pendência 10774.                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Alteração no relatório de beneficios por banco e |
|   relatório de beneficios por banco agência.                                 |
|------------------------------------------------------------------------------|                                                                                   |
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/06/2003 A 06/06/2003                         |
| PENDÊNCIA: 14189                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05e                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| COLOCAR FILTRO DO CAMPO IDMODULO DA FOLHA NAS CONSULTAS DA BANCOPORTORMA.    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}


