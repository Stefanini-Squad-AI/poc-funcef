// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
//Alteração  : consultarReembolsoINSS, consultarRubricas, consultarAnalitico, consultarTotais
//Nº SIG.....: 125847
//Data.......: 17/07/2022
//Responsável: Andre Imakawa
//Descrição..: Retorna apenas a rubrica FUNCEF vinculada na tabela RUBRICAXINSS
//--------------------------------------------------------------------------------
//Alteração  : consultarRubricas, consultarAnalitico, consultarReembolsoINSS, consultarTotais
//Nº SIG.....: 71716
//Data.......: 17/07/2018
//Responsável: Edilaine
//Descrição..: Conciliação do Reembolso do INSS não esta retornando a rubrica 1093
//--------------------------------------------------------------------------------
//Alteração  : consultarPessoa
//Nº SIG.....: 63648
//Data.......: 21/02/2018
//Responsável: Andre Imakawa
//Descrição..: Com a entrada do SIG 58556, faltou AND na query.
//--------------------------------------------------------------------------------
//Nº SIG.....: SIG TIBERO
//Data.......: 20/02/2018
//Responsável: Everson Luiz Pereira da Cunha
//Descrição..: Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//             Retirada de INDEX, +rule etc.
//             Melhoria realizada para adaptação ao TIBERO.
//--------------------------------------------------------------------------------
//Alteração  :
//Nº SIG.....: SIG58556
//Data.......: 20/11/2017
//Responsável: Luiz Carlos
//Descrição..: Criacao de campos na tela e relatorio para segregacao contabil
//--------------------------------------------------------------------------------
//Alteração  : consultarRubricas, consultarAnalitico, consultarReembolsoINSS,
//             consultarTotais
//Nº SIG.....: SIG53294
//Data.......: 27/04/2017
//Responsável: Andre Imakawa
//Descrição..: Reembolso do Inss não esta verificando registros com FLGMANUAL 
//			   1 e 2, como no Extrato Individual
//--------------------------------------------------------------------------------
//Alteração  : btnProcurarClick, consultarPessoa, consultar, consultarRubricas,
//             consultarAnalitico, consultarReembolsoINSS, consultarTotais
//Nº SIG.....: 44492
//Data.......: 27/04/2017
//Responsável: Andre Imakawa
//Descrição..: Erro na composição de valores na funcionalidade de conciliação do
//             INSS. Alteração no FORM objeto MSBenef
//--------------------------------------------------------------------------------
//Pendência   : SOL 268898 PPM 1289040
//Responsável : Douglas Siqueira / Andre Imakawa
//Data        : 20/03/2012
//Descrição   : Correção de Informações de RRA sem reebolso de INSS
//              Colocado NVL nos campos FLGRRA
//--------------------------------------------------------------------------------
//Pendência   : SOL 146675 Kintana 1002383
//Responsável : MARCIO DENILSON
//Data        : 20/03/2012
//Descrição   : Correção da duplicação de registros da consulta do desembolso
//              devido tabela INFORME
//--------------------------------------------------------------------------------
//Pendência   : SOL 146675 Kintana 1002383
//Responsável : MARCIO DENILSON
//Data        : 06/03/2012
//Descrição   : Retirada do filtro pelo campo FLGMANUAL das tabelas
//              DETCONCINSS e TEMPCONCINSS
//--------------------------------------------------------------------------------
//Pendência   : SOL 146675 Kintana 1002383
//Responsável : MARCIO DENILSON
//Data        : 06/09/2011
//Descrição   : Alterações em função de revisão da espeficicação do SOL
//--------------------------------------------------------------------------------
//Pendência   : SOL 146675 Kintana 1002383
//Responsável : MARCIO DENILSON
//Data        : 07/02/2011
//Descrição   : Desenvolvimento inicial da tela
//--------------------------------------------------------------------------------

unit FConciliacaoReembolsoINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, Wwdatsrc, TREdit, FPreview,  Pptypes, ComCtrls, Menus, ppEndUsr,
  ppCtrls, ppDB, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Mask, wwdbedit, wwdblook,
  MontaSelect, DBGrids, Wwdotdot, Wwdbcomb, ppParameter, ppModule, raCodMod,
  daDataModule;


type
  TfrmConciliacaoReembolsoINSS = class(TfrmSairAjuda)
    pnPesquisa: TPanel;
    Label1: TLabel;
    edtMatricula: TEdit;
    edtNumBeneficio: TEdit;
    Label2: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    spAno: TSpinEdit;
    spMes: TSpinEdit;
    SpAnoFim: TSpinEdit;
    SpMesFim: TSpinEdit;
    btnProcurar: TBitBtn;
    Label3: TLabel;
    edNome: TEdit;
    edMantenedora: TEdit;
    Label4: TLabel;
    Label7: TLabel;
    edDIB: TEdit;
    edEspecie: TEdit;
    Label10: TLabel;
    Label6: TLabel;
    edBeneficio: TEdit;
    edEntidade: TEdit;
    Label5: TLabel;
    Label13: TLabel;
    EdNomePlanoPrev: TEdit;
    chkInibirPA: TCheckBox;
    chkReembolsoFundacao: TCheckBox;
    MSBenef: TMontaSelect;
    Panel1: TPanel;
    dsFolhaFuncef: TwwDataSource;
    qryBeneficiario: TwwQuery;
    qryAux: TwwQuery;
    btnImprimir: TBitBtn;
    qryMantenedora: TwwQuery;
    dsMantenedora: TwwDataSource;
    qryMatricula: TwwQuery;
    qryGlosaExtrato: TwwQuery;
    qryGlosaExtratoVLRGLOSA: TFloatField;
    dsGlosa: TwwDataSource;
    dsReembolso: TwwDataSource;
    qryFolhaFuncef01: TwwQuery;
    qryFolhaFuncef01MESCOBRANCA: TStringField;
    qryFolhaFuncef01CODPROVDESC: TStringField;
    qryFolhaFuncef01VALORPROVENTO: TFloatField;
    qryFolhaFuncef01SINAL: TStringField;
    qryFolhaFuncef01DESCRRUBRICA: TStringField;
    qryFolhaFuncef01MES: TStringField;
    qryFolhaFuncef01IDRUBRICA: TFloatField;
    qryFolhaFuncef01DATAPAGTO: TStringField;
    qryFolhaFuncef01IDPLANOCONTABIL: TFloatField;
    qryFolhaFuncef01IDPLANOPREV: TFloatField;
    qryFolhaFuncef01NUMPROCINSS: TStringField;
    qryFolhaFuncef01FONTEPAGADORA: TFloatField;
    qryFolhaFuncef01VALOR: TFloatField;
    qryFolhaFuncef01MESCOMPREEM: TStringField;
    qryFolhaFuncef: TwwQuery;
    qryFolhaFuncefMESCOBRANCA: TStringField;
    qryFolhaFuncefCODPROVDESC: TStringField;
    qryFolhaFuncefVALORPROVENTO: TFloatField;
    qryFolhaFuncefSINAL: TStringField;
    qryFolhaFuncefDESCRRUBRICA: TStringField;
    qryFolhaFuncefMES: TStringField;
    qryFolhaFuncefIDRUBRICA: TFloatField;
    qryFolhaFuncefDATAPAGTO: TStringField;
    qryFolhaFuncefIDPLANOCONTABIL: TFloatField;
    qryFolhaFuncefIDPLANOPREV: TFloatField;
    qryFolhaFuncefNUMPROCINSS: TStringField;
    qryFolhaFuncefFONTEPAGADORA: TFloatField;
    qryFolhaFuncefVALOR: TFloatField;
    qryReembolso01: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField5: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField6: TFloatField;
    StringField9: TStringField;
    FloatField7: TFloatField;
    StringField10: TStringField;
    FloatField8: TFloatField;
    StringField11: TStringField;
    DateTimeField2: TDateTimeField;
    StringField12: TStringField;
    StringField13: TStringField;
    FloatField9: TFloatField;
    StringField14: TStringField;
    FloatField10: TFloatField;
    qryReembolso: TwwQuery;
    qryFolhaFuncefMESCOMPREEM: TStringField;
    qryTotReembolso: TwwQuery;
    qryTotReembolsoVALOR: TFloatField;
    dsTotReembolso: TDataSource;
    qryDIB: TwwQuery;
    updExtrIndivCRI: TUpdateSQL;
    qryExtrIndivCRI: TwwQuery;
    qryExtrIndivCRIMESCOBRANCA: TStringField;
    qryExtrIndivCRIMESREFERENCIA: TStringField;
    qryExtrIndivCRIIDPLANOPREV: TFloatField;
    qryExtrIndivCRINOMEPLANO: TStringField;
    qryExtrIndivCRIDIB: TDateTimeField;
    qryExtrIndivCRIMANTENEDORA: TStringField;
    qryExtrIndivCRINB: TStringField;
    qryExtrIndivCRIESPECIE: TFloatField;
    qryExtrIndivCRIMATRICULA: TStringField;
    qryExtrIndivCRINOMEBENEF: TStringField;
    qryExtrIndivCRIRUBFUNCEF: TFloatField;
    qryExtrIndivCRIVALORFUNCEF: TFloatField;
    qryExtrIndivCRIRUBINSS: TFloatField;
    qryExtrIndivCRIVALORINSS: TFloatField;
    qryExtrIndivCRIDIFERENCA: TFloatField;
    qryExtrIndivCRIMESCOBREEMB: TStringField;
    qryExtrIndivCRIMESREFREEMB: TStringField;
    qryExtrIndivCRIRMREAJ: TFloatField;
    qryExtrIndivCRIIDPLANOPREVREEMB: TFloatField;
    qryExtrIndivCRINOMEPLANOPREV: TStringField;
    qryExtrIndivCRICODPROVDESC: TStringField;
    qryExtrIndivCRIVALORPROVENTO: TFloatField;
    qryExtrIndivCRIDESCRRUBRICA: TStringField;
    qryExtrIndivCRIIDPLANOCONTABIL: TFloatField;
    qryExtrIndivCRIMESCOMPREEM: TStringField;
    qryExtrIndivCRIIDRUBRICA: TFloatField;
    qryExtrIndivCRIDESCRRUBRICAREM: TStringField;
    qryExtrIndivCRIDTINICIOCREDREM: TDateTimeField;
    qryExtrIndivCRIDTFIMCREDREM: TDateTimeField;
    qryExtrIndivCRIMESCOMPREEMREM: TStringField;
    dsExtrIndivCRI: TwwDataSource;
    ppExtrIndivCRI: TppBDEPipeline;
    pprExtrIndivCRI: TppReport;
    ppHeaderBand23: TppHeaderBand;
    ppShape33: TppShape;
    ppDBText305: TppDBText;
    ppDBText307: TppDBText;
    ppDBText309: TppDBText;
    ppDBText347: TppDBText;
    ppDBText348: TppDBText;
    ppDBText349: TppDBText;
    ppDBText350: TppDBText;
    ppLabel282: TppLabel;
    ppDBText351: TppDBText;
    ppLabel283: TppLabel;
    ppLine88: TppLine;
    ppLabel320: TppLabel;
    ppLabel322: TppLabel;
    ppLabel323: TppLabel;
    ppLabel381: TppLabel;
    ppLabel382: TppLabel;
    ppDBText352: TppDBText;
    ppDBText353: TppDBText;
    ppDBText354: TppDBText;
    ppDBText355: TppDBText;
    ppLabel386: TppLabel;
    ppLabel387: TppLabel;
    ppLabel388: TppLabel;
    ppDBText356: TppDBText;
    ppLine96: TppLine;
    ppLabel389: TppLabel;
    ppLabel390: TppLabel;
    ppLabel394: TppLabel;
    ppLabel395: TppLabel;
    ppDBText357: TppDBText;
    ppLabel405: TppLabel;
    ppLabel406: TppLabel;
    ppLabel407: TppLabel;
    ppLabel408: TppLabel;
    ppLabel385: TppLabel;
    ppLabel391: TppLabel;
    ppLabel392: TppLabel;
    ppLabel393: TppLabel;
    ppLabel409: TppLabel;
    ppLabel410: TppLabel;
    ppLine89: TppLine;
    ppDetailBand23: TppDetailBand;
    ppDBText358: TppDBText;
    ppDBText359: TppDBText;
    ppDBText361: TppDBText;
    ppDBText362: TppDBText;
    ppDBText363: TppDBText;
    ppDBText364: TppDBText;
    ppDBText368: TppDBText;
    ppDBText370: TppDBText;
    ppDBText371: TppDBText;
    ppDBText365: TppDBText;
    ppDBText366: TppDBText;
    ppDBText367: TppDBText;
    ppDBText372: TppDBText;
    ppDBText373: TppDBText;
    ppLine87: TppLine;
    ppFooterBand23: TppFooterBand;
    ppLine97: TppLine;
    ppLabel396: TppLabel;
    ppSystemVariable39: TppSystemVariable;
    ppSystemVariable40: TppSystemVariable;
    ppSummaryBand20: TppSummaryBand;
    ppShape36: TppShape;
    ppLine98: TppLine;
    ppLabel397: TppLabel;
    lblTotalFuncefCRI: TppLabel;
    lblTotalReembCRI: TppLabel;
    lblDiferencaCRI: TppLabel;
    ppLabel401: TppLabel;
    ppLabel402: TppLabel;
    ppLabel403: TppLabel;
    lblGlosaCRI: TppLabel;
    ppParameterList5: TppParameterList;
    ppdExtrIndivCRI: TppDesigner;
    ppFundacao: TppBDEPipeline;
    ppFundacaoppField1: TppField;
    ppFundacaoppField2: TppField;
    ppFundacaoppField3: TppField;
    ppFundacaoppField4: TppField;
    ppFundacaoppField5: TppField;
    ppFundacaoppField6: TppField;
    ppFundacaoppField7: TppField;
    ppFundacaoppField8: TppField;
    ppFundacaoppField9: TppField;
    ppFundacaoppField10: TppField;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    qryRubricasDesembolso: TwwQuery;
    dsRubricasDesembolso: TwwDataSource;
    btnImprimirSintetico: TBitBtn;
    qryRubricasReembolso: TwwQuery;
    dsRubricasReembolso: TwwDataSource;
    qryConsAnalitica: TwwQuery;
    dsConsAnalitica: TwwDataSource;
    Label15: TLabel;
    Label16: TLabel;
    medReembolso: TMaskEdit;
    Label8: TLabel;
    medDiferenca: TMaskEdit;
    Label9: TLabel;
    chkFiltrarRubricas: TCheckBox;
    pcPrincipal: TPageControl;
    tsGrids: TTabSheet;
    tsRubricasReembolso: TTabSheet;
    tsRubricasDesembolso: TTabSheet;
    pnGrids: TPanel;
    pnGridSintentico: TPanel;
    Panel5: TPanel;
    dbgrdRubricasReembolso: TwwDBGrid;
    dbgrdRubricasDesembolso: TwwDBGrid;
    qryFolhaFuncefNOME_ENTIDADE_CONTABIL: TStringField;
    qryFolhaFuncefNOME_PLANO_PREVIDENCIARIO: TStringField;
    qryReembolsoMESCOBRANCA: TStringField;
    qryReembolsoMESREFERENCIA: TStringField;
    qryReembolsoDESCRRUBRICA: TStringField;
    qryReembolsoSINAL: TStringField;
    qryReembolsoVALORINSS: TFloatField;
    qryReembolsoCODMANTENEDORA: TStringField;
    qryReembolsoNOMEMANTENEDORA: TStringField;
    qryReembolsoRMREAJ: TFloatField;
    qryReembolsoAPREAJ: TFloatField;
    qryReembolsoCODCONCESSORINSS: TStringField;
    qryReembolsoCODMANTENEDORINSS: TStringField;
    qryReembolsoCODSINONIMO: TFloatField;
    qryReembolsoDTINICIOCRED: TDateTimeField;
    qryReembolsoDTFIMCRED: TDateTimeField;
    qryReembolsoMESCOMPREEM: TStringField;
    qryReembolsoNUMPROCINSS: TStringField;
    qryReembolsoMATRICULA: TStringField;
    qryReembolsoESPECIE: TStringField;
    qryReembolsoRUBRICAINSS: TFloatField;
    qryReembolsoIDPLANOPREV: TFloatField;
    qryReembolsoENTIDADECONTABIL: TStringField;
    qryReembolsoSEQUENCIAL: TFloatField;
    qryReembolsoIDPLANOPREVPREV: TFloatField;
    qryReembolsoNOMEPLANOPREV: TStringField;
    qryReembolsoVALOR: TFloatField;
    dsExtrIndivCRISint: TwwDataSource;
    ppExtrIndivCRISint: TppBDEPipeline;
    pprExtrIndivCRISint2: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppDBImage1: TppDBImage;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel2: TppLabel;
    ppDBText9: TppDBText;
    ppLabel3: TppLabel;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine3: TppLine;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText14: TppDBText;
    ppLine4: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppShape3: TppShape;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDBText15: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLine5: TppLine;
    ppShape4: TppShape;
    ppLabel27: TppLabel;
    ppLine6: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppLine7: TppLine;
    ppDBText31: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine8: TppLine;
    ppLabel28: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppShape5: TppShape;
    ppLine9: TppLine;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppParameterList1: TppParameterList;
    ppdExtrIndivCRISint: TppDesigner;
    qryExtrIndivCRIMESANALITICO: TStringField;
    qryExtrIndivCRITOTALDESEMBOLSO: TFloatField;
    qryExtrIndivCRITOTALREEMBOLSO: TFloatField;
    qryExtrIndivCRIDIFERENCAANALITICA: TFloatField;
    qryExtrIndivCRICONTADOR: TFloatField;
    qryExtrIndivCRILINHADESEMBOLSO: TFloatField;
    qryExtrIndivCRILINHAREEMBOLSO: TFloatField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText35: TppDBText;
    updRubricasReembolso: TUpdateSQL;
    updRubricasDesembolso: TUpdateSQL;
    qryRubricasReembolsoIDPROVENTO: TFloatField;
    qryRubricasReembolsoDESCRICAO: TStringField;
    qryRubricasReembolsoPROCESSAR: TFloatField;
    qryRubricasDesembolsoIDPROVENTO: TFloatField;
    qryRubricasDesembolsoDESCRICAO: TStringField;
    qryRubricasDesembolsoPROCESSAR: TFloatField;
    qryConsAnaliticaMESCOBRANCA: TStringField;
    qryConsAnaliticaVALORDESEMBOLSO: TFloatField;
    qryConsAnaliticaVALORREEMBOLSO: TFloatField;
    qryConsAnaliticaDIFERENCA: TFloatField;
    pprExtrIndivCRISint: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppLabel41: TppLabel;
    ppDBText42: TppDBText;
    ppLabel42: TppLabel;
    ppLine1: TppLine;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppLabel47: TppLabel;
    ppDBText47: TppDBText;
    ppLine11: TppLine;
    ppLabel48: TppLabel;
    ppDBText48: TppDBText;
    ppShape1: TppShape;
    ppLabel49: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLine14: TppLine;
    ppLabel71: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppShape9: TppShape;
    ppLine15: TppLine;
    ppLabel72: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppParameterList2: TppParameterList;
    Panel2: TPanel;
    Panel3: TPanel;
    dbGridConsAnalitica: TwwDBGrid;
    wwIButton1: TwwIButton;
    qryConsTotais: TwwQuery;
    dsConsTotais: TwwDataSource;
    qryConsGlosa: TwwQuery;
    medDesembolso: TMaskEdit;
    medGlosa: TMaskEdit;
    Splitter1: TSplitter;
    pnGridsAnaliticos: TPanel;
    Splitter2: TSplitter;
    pnGridDesembolso: TPanel;
    Panel10: TPanel;
    dbGridDesembolso: TwwDBGrid;
    wwDBGrid5IButton: TwwIButton;
    pnGridReembolso: TPanel;
    Panel11: TPanel;
    dbGridReembolso: TwwDBGrid;
    ppLine12: TppLine;
    ppLabel1: TppLabel;
    ppLine13: TppLine;
    lblTotalFuncefCRISint: TppLabel;
    lblTotalReembCRISint: TppLabel;
    lblDiferencaCRISint: TppLabel;
    lblGlosaCRISint: TppLabel;
    ppLine10: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLine20: TppLine;
    qryExtrIndivCRISINALD: TStringField;
    qryExtrIndivCRISINALR: TStringField;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppImage1: TppImage;
    ppImage2: TppImage;
    qryConsAnaliticaANOCOBRANCA: TStringField;
    edPerfilInvest: TEdit;
    Label19: TLabel;
    ppLabel39: TppLabel;
    ppDBText34: TppDBText;
    ppLabel40: TppLabel;
    ppDBText49: TppDBText;
    qryExtrIndivCRIPERFINV: TStringField;
    daDataModule1: TdaDataModule;
    procedure bbtnSairClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spAnoChange(Sender: TObject);
    procedure spAnoExit(Sender: TObject);
    procedure spMesExit(Sender: TObject);
    procedure SpAnoFimExit(Sender: TObject);
    procedure SpMesFimExit(Sender: TObject);
    procedure chkInibirPAClick(Sender: TObject);
    procedure chkReembolsoFundacaoClick(Sender: TObject);
    procedure dblcRubricaDesembolsoExit(Sender: TObject);
    procedure btnImprimirSinteticoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure dsConsAnaliticaDataChange(Sender: TObject; Field: TField);
    procedure dbgrdRubricasReembolsoFieldChanged(Sender: TObject; Field: TField);
    procedure dbgrdRubricasDesembolsoFieldChanged(Sender: TObject; Field: TField);
    procedure dbgrdRubricasReembolsoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dbgrdRubricasDesembolsoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure chkFiltrarRubricasClick(Sender: TObject);
    procedure pcPrincipalChange(Sender: TObject);
    
  private
    { Private declarations }
    MesAno, sspAno, sspMes, sspMesFim, sspAnoFim, sCodmantenedora : String;
    dedReembolso : Double;
    iPessoa, iPlanoContab : Integer;
    filtroPorRubricas, bAlteracaoFiltroRubricas: boolean;


    procedure consultarPessoa(vNumProcInss: String);
    procedure AtualizaRubFolha(iidpessoa : Integer);
    procedure consultarRubricas();

    procedure consultarDesembolsoFUNCEF(iidpessoa : Integer);
    procedure consultarReembolsoINSS();
    procedure consultarAnalitico(iidpessoa : Integer);

    procedure consultar(bFiltraRubrica: boolean = false);
    procedure consultarTotais(iidpessoa : Integer);


    procedure imprimirRelatorio();
    procedure imprimirRelatorioAnalitico();
    procedure imprimirRelatorioSintetico();

    function retornaListaRubricas(qryGrid: TwwQuery): String;


  public
    { Public declarations }
  end;

var
  frmConciliacaoReembolsoINSS: TfrmConciliacaoReembolsoINSS;

implementation

{$R *.DFM}

uses USistema, UdataBase,UmensErro, UAdmPrev, fAguarde, fParamRelEspecieRI, fParamRelRubricaRI;

procedure TfrmConciliacaoReembolsoINSS.AtualizaRubFolha(iidpessoa: Integer);
begin

  qryGlosaExtrato.Close;
  qryGlosaExtrato.ParamByName('numproc').AsString   := edtNumBeneficio.text;
  qryGlosaExtrato.ParamByName('mescob').AsString    := sspAno;         
  qryGlosaExtrato.ParamByName('MESCOBFIM').AsString := sspAnoFim;   

  qryGlosaExtrato.ParamByName('PMANTENEDORAFUND').AsInteger  := Ord(chkReembolsoFundacao.Checked);

  qryGlosaExtrato.Open;
end;

procedure TfrmConciliacaoReembolsoINSS.bbtnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConciliacaoReembolsoINSS.btnProcurarClick(Sender: TObject);
begin
  inherited;
  bAlteracaoFiltroRubricas := False;

  MSBenef.Executar;
  if (MSBenef.ValoresChave.Count > 0) and
     (MSBenef.ValoresChave[0] <> '') then
  begin
    consultar(True);// Andre Imakawa - SIG 44492
    //if not filtroPorRubricas then // Andre Imakawa - SIG 44492
       //consultarRubricas(); // Andre Imakawa - SIG 44492
  end;
end;

procedure TfrmConciliacaoReembolsoINSS.consultarPessoa(vNumProcInss: String);
begin
  qryBeneficiario.Close;

  qryBeneficiario.ParamByName('numproc').AsString  := vNumProcInss;
  qryBeneficiario.Open;

  if qryBeneficiario.EOF then begin
    qryAux.SQL.text := 'SELECT B.IDPESSOA, B.IDPLANOPREV, B.IDPLANPREVCONTAB, B.DATAINICIO, ' +
                       '       D.MATRICULA, PL.NOME, BN.NOME AS NOMEBENEF, P.NOME AS NOMEPESSOA, ' +
                       '       BN.CODBENEFICIO AS ESPECIE, '+
                       '       PP.NOME AS NOMEPLANOPREV, PI.IDPLANOPREV || '' - '' || PI.NOME AS PERFINV '+
                       'FROM BENEFBFCIARIO B, DEPENTIT D, BENEFPLANPREV BP,BENEFICIO BN,  '+
                       '     PESSOA P, PLANPREVCONTABIL PL, '+
                       '     PLANPREV PP, PERFILINVEST PI '+
                       'WHERE B.NUMPROCINSS = ' + QuotedStr(vNumProcInss) + ' AND '+
                       '      B.IDTITULAR = D.IDTITULAR(+) AND ' +
                       '      B.IDPESSOA  = D.IDPESSOA(+) AND ' +
                       '      B.IDPESSOA  = P.IDPESSOA(+) AND ' +
                       '      B.IDPLANOPREV = PP.IDPLANOPREV(+) AND ' +
                       '      B.IDPLANOPREV = BP.IDPLANOPREV(+) AND ' +
                       '      B.IDBENEFICIO = BP.IDBENEFICIO(+) AND ' +
                       '      BP.FLGREFERENCIA = 1 AND ' +
                       '      B.IDBENEFICIO = BN.IDBENEFICIO AND ' +
                       '      B.IDPLANPREVCONTAB = PL.IDPLANOPREV(+) AND '+ // Andre Imakawa - SIG 63648
                       '      B.IDPERFILINVEST = PI.IDPERFILINVEST(+) ';
    qryAux.Open;
    if not qryAux.EOF then begin
       //iPessoa            := qryAux.FieldByName('IDPESSOA').AsInteger; // Andre Imakawa - SIG 44492
       iPlanoContab       := qryAux.FieldByName('IDPLANPREVCONTAB').AsInteger;
       edMantenedora.Text := 'FUNCEF';
       sCodmantenedora    :=  '99';
       edNome.Text        := qryAux.FieldByName('NOMEPESSOA').AsString;
       edDIB.Text         := qryAux.FieldByName('DATAINICIO').AsString;
       edEntidade.Text    := qryAux.FieldByName('NOME').AsString;
       edBeneficio.Text   := qryAux.FieldByName('NOMEBENEF').AsString;
       edEspecie.Text     := qryAux.FieldByName('ESPECIE').AsString;
       EdNomePlanoPrev.Text := qryAux.FieldByName('NOMEPLANOPREV').AsString;
       edPerfilInvest.text  := qryAux.FieldByName('PERFINV').AsString;

    end
    else begin
       ShowMessage('NB não encontrado');
       exit;
    end;
  end
  else begin
    //iPessoa            := qryBeneficiario.FieldByName('IDPESSOA').AsInteger; // Andre Imakawa - SIG 44492
    iPlanoContab       := qryBeneficiario.FieldByName('IDPLANOPREV').AsInteger;
    edEntidade.Text    := qryBeneficiario.FieldByName('PLANOCONTABIL').AsString;
    edBeneficio.Text   := qryBeneficiario.FieldByName('NOMEBENEFICIO').AsString;
    edEspecie.Text     := qryBeneficiario.FieldByName('ESPECIE').AsString;
    EdNomePlanoPrev.Text := qryBeneficiario.FieldByName('NOMEPLANOPREV').AsString;
    edPerfilInvest.text  := qryBeneficiario.FieldByName('PERFINV').AsString;

    qryDIB.Close;
    qryDIB.ParamByName('numproc').AsString  :=  vNumProcInss;
    qryDIB.Open;
    if not qryDIB.EOF then
       edDIB.Text  := qryDIB.FieldByName('DIB').AsString;

    qryMantenedora.Close;
    qryMantenedora.ParamByName('numproc').AsString  := vNumProcInss;
    qryMantenedora.Open;
    if not qryMantenedora.EOF then begin
       edMantenedora.Text := qryMantenedora.FieldByName('NOMEMANTENEDORA').AsString;
       sCodmantenedora    :=  qryMantenedora.FieldByName('CODMANTENEDORA').AsString;
    end;

    qryMatricula.Close;
    qryMatricula.ParamByName('numproc').AsString  := vNumProcInss;
    qryMatricula.Open;
    if not qryMatricula.EOF then begin
       edNome.Text := qryMatricula.FieldByName('NOME').AsString;
    end
    else begin
       qryBeneficiario.First;
       edNome.Text :=   qryBeneficiario.FieldByName('NOME').AsString;
    end;

    qryBeneficiario.First;
  end;

end;

procedure TfrmConciliacaoReembolsoINSS.FormCreate(Sender: TObject);
Var
  Year,Month,Day : Word;
begin
  inherited;

  tsRubricasReembolso.TabVisible  := False;
  tsRubricasDesembolso.TabVisible := False;

  consultarRubricas();

  sspAno := InttoStr(spAno.Value);
  if spMes.Value < 10 then
    sspMes := '0' + InttoStr(spMes.Value)
  else
    sspMes := InttoStr(spMes.Value);
  sspAno := sspAno + '/' + sspMes;

  DecodeDate(Date,Year,Month,Day);                           
  spAnoFim.Value := Year;
  spMesFim.Value := Month;
  sspAnoFim := InttoStr(spAnoFim.Value);
  if spMesFim.Value < 10 then
    sspMesFim := '0' + InttoStr(spMesFim.Value)
  else
    sspMesFim := InttoStr(spMesFim.Value);
  sspAnoFim := sspAnoFim + '/' + sspMesFim;

  qryConsAnalitica.Active := True;
  qryFolhaFuncef.Active   := True;
  qryReembolso.Active     := True;

  filtroPorRubricas       :=False;

end;

procedure TfrmConciliacaoReembolsoINSS.consultarDesembolsoFUNCEF(iidpessoa : Integer);
var
   sSQL,sListaRubDesembolso,sSqlFiltroRubDesembolso      : String;
begin
   inherited;

   sListaRubDesembolso     := '0';
   sSqlFiltroRubDesembolso := '';
   if chkFiltrarRubricas.Checked then
    begin
      sListaRubDesembolso     := retornaListaRubricas( qryRubricasDesembolso );
      if sListaRubDesembolso <> '' then
        sSqlFiltroRubDesembolso := ' AND ( P.IDPROVENTO IN (' + sListaRubDesembolso + ') ) '
    end;

   if (not qryConsAnalitica.Active) or (qryConsAnalitica.IsEmpty) then
   begin
     qryFolhaFuncef.Close;
     Exit;
   end;

   sSQL :=
         ' SELECT                                                                                                       '
       + '   H.IDPLANOCONTABIL,H.IDPLANOPREV,                                                                           '
       + '   H.MES,H.MESCOBRANCA, H.IDRUBRICA, H.CODPROVDESC, H.VALORPROVENTO,                                          '
       + '   H.FONTEPAGADORA,     H.NUMPROCINSS,                                                                        '
       + '   TO_CHAR(H.DATAPAGAMENTO,''DD/MM/YYYY'') AS DATAPAGTO,                                                      '
       + '   DECODE(P.FLGDESCONTO,1,''(-)'',0,''(+)'') AS SINAL,                                                        '
       + '   SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA,                                                                  '
       //+ '   H.MESCOMPREEM, H.IDPLANOCONTABIL || '' - '' || PPC.nome AS NOME_ENTIDADE_CONTABIL ,                        '//SOL 268898 PPM 1289040
       + '   H.MESCOMPREEM, H.IDPLANOCONTABIL || '' - ''   AS NOME_ENTIDADE_CONTABIL ,                        '
       //+ '   H.IDPLANOPREV || '' - '' || PP.nome AS NOME_PLANO_PREVIDENCIARIO,                                          '//SOL 268898 PPM 1289040
       + '   H.IDPLANOPREV || '' - ''  AS NOME_PLANO_PREVIDENCIARIO,                                          '
       + '   DECODE(P.FLGDESCONTO, 0, H.VALORPROVENTO, 1, -H.VALORPROVENTO) AS  VALOR                                   '
       + ' FROM                                                                                                         '
       //+ '   HISTRUBSAL H, PROVDESC P,  INFORME I, PLANPREVCONTABIL PPC, PLANPREV PP                                    '//SOL 268898 PPM 1289040
       //+ '   HISTRUBSAL H, PROVDESC P,  INFORME I                                                                       '// Andre Imakawa - SIG 44492 - Estrutura de Calculo
       + '   HISTRUBSAL H, PROVDESC P                                                                                     '// Andre Imakawa - SIG 44492 - Estrutura de Calculo
       + ' WHERE                                                                                                        '

       //SOL 268898 PPM 1289040
       + ' H.IDRUBRICA NOT IN (SELECT IDPROVENTO                                                                        '
       + '                             FROM   PROVDESC PD                                                               '
       + '                            WHERE  NVL(PD.FLGRRA, 0) = 1                                                      '
       + '                             AND    UPPER(PD.DESCRICAO) LIKE ''%RENDA FONTE RRA%'')    AND                       '
       //SOL 268898 PPM 1289040


       + '   (H.IDPESSJUR = :IDPESSJUR)      AND                                                                        '
       + '   (H.IDPESSOA  = :IDPESSOA)       AND                                                                        '
       + '   ( ( (H.NUMPROCINSS = :NUMPROCINSS) AND (H.IDMODULO=18) ) OR                                                '
       + '     ( (H.NUMPROCINSS IS NULL) AND (H.IDMODULO=21) ))AND                                                      '
       + '   (H.IDMODULO IN (18,21))            AND                                                                     '
       + '   (H.IDRUBRICA = P.IDPROVENTO)       AND                                                                     '
       + '   ((H.FLGESTORNO = 0) OR (H.FLGESTORNO IS NULL)) AND                                                         '
       + '   ((H.FONTEPAGADORA = 2 ) OR ( (H.FONTEPAGADORA IS NULL) AND (H.IDMODULO=21) AND                             '
       + '   (P.CODFONTEPAGADORA = 2) ) )                                                                               '

       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Inicio
       //+ '   AND (H.IDINFORME = I.IDINFORME(+))                                                                         '
       //+ '   AND (P.IDINFORME = I.IDINFORME OR P.IDINFORME IS NULL  )                                                   '
       //+ '   AND ( (I.CODDIRF NOT IN (3,7,14,16,17)) OR (I.CODDIRF IS NULL) )                                           '
       + '   AND ( H.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 45))         '
       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Fim

//       + '   AND ((1=:pConsideraPA) AND (H.CODPROVDESC NOT LIKE ''%30404'') AND (H.CODPROVDESC NOT LIKE ''%33404'') AND '
//       + '       (H.CODPROVDESC NOT LIKE ''%30104'') OR (1<>:pConsideraPA))                                             '

       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Inicio
       //+ '   AND ((2=:pConsideraPA) OR ( (H.CODPROVDESC NOT LIKE ''%30404'') AND (H.CODPROVDESC NOT LIKE ''%33404'') AND '
       //+ '       (H.CODPROVDESC NOT LIKE ''%30104'') ) )                                                                 '
       + '   AND ((2=:pConsideraPA) OR ( H.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47)))        '
       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Fim

       + '   AND  H.MESCOMPREEM = :MESCOB                                                                               '
       //+ '   AND H.IDPLANOCONTABIL = PPC.IDPLANOPREV                                                                    '//SOL 268898 PPM 1289040
       //+ '   AND H.IDPLANOPREV = PP.IDPLANOPREV   '                                                                      //SOL 268898 PPM 1289040
       // Andre Imakawa - SOL 268898 - PPM 1289040 - Inicio
       //+ '   AND NVL(I.ANOVIGENCIA,'''') =                                                                              '
       //+ '   (                                                                                                          '
       //+ '    SELECT NVL(MAX(ANOVIGENCIA),'''')                                                                         '
       //+ '    FROM INFORME I2                                                                                           '
       //+ '    WHERE I2.ANOVIGENCIA <= :ANOCOB                                                                           '
       //+ '      AND I2.IDINFORME = H.IDINFORME                                                                          '
       //+ '      AND I2.CODDIRF NOT IN (3, 7, 14, 16, 17)                                                                '
       //+ '   )                                                                                                          '
       // Andre Imakawa - SOL 268898 - PPM 1289040 - Fim
       +  sSqlFiltroRubDesembolso

       + ' ORDER BY                                                                                                     '
       + '   H.MESCOMPREEM, H.MESCOBRANCA DESC, H.MES DESC                                                              ';

  //qryFolhaFuncef.SQL.Text := sSQL;
  qryFolhaFuncef.Close;
  qryFolhaFuncef.SQL.clear;
  qryFolhaFuncef.SQL.ADD(sSQL);
  qryFolhaFuncef.ParamByName('idpessjur').AsInteger  := Sistema.IdEmpresa;
  qryFolhaFuncef.ParamByName('idpessoa').AsInteger   := iidpessoa;
  qryFolhaFuncef.ParamByName('numprocinss').AsString := edtNumBeneficio.Text;
  qryFolhaFuncef.ParamByName('mescob').AsString      := qryConsAnalitica.FieldByName('MESCOBRANCA').AsString;
//  qryFolhaFuncef.ParamByName('ANOCOB').AsString      := qryConsAnalitica.FieldByName('ANOCOBRANCA').AsString; // // Andre Imakawa - SOL 268898 - PPM 1289040

  if chkInibirPA.Checked then begin
    qryFolhaFuncef.ParamByName('pConsideraPA').AsInteger  := 1;
  end else begin
    qryFolhaFuncef.ParamByName('pConsideraPA').AsInteger  := 2;
  end;

  qryFolhaFuncef.Open;
end;

procedure TfrmConciliacaoReembolsoINSS.spAnoChange(Sender: TObject);
begin
  inherited;
  sspAno := InttoStr(spAno.Value);
  if (spAno.Value < 1000) then                  
     exit;
  if spMes.Value < 10 then
    sspMes := '0' + InttoStr(spMes.Value)
  else if spMes.Value < 13 then
         sspMes := InttoStr(spMes.Value)
       else begin
         MsgDlg('Mês deve ser no máximo 12','Erro',mtWarning,[mbOk],0);
         spMes.Value := 12;
         spMes.SetFocus;
         exit;
       end;



  sspAno := sspAno + '/' + sspMes;

  sspAnoFim := InttoStr(spAnoFim.Value);                    
  if (spAnoFim.Value < 1000) then                             
     exit;
  if spMesFim.Value < 10 then
    sspMesFim := '0' + InttoStr(spMesFim.Value)
  else if spMesFim.Value < 13 then
         sspMesFim := InttoStr(spMesFim.Value)
       else begin
         MsgDlg('Mês deve ser no máximo 12','Erro',mtWarning,[mbOk],0);
         spMesFim.Value := 12;
         spMesFim.SetFocus;
         exit;
       end;
  sspAnoFim := sspAnoFim + '/' + sspMesFim;


  if sspAno < '1997/05' then begin
    MsgDlg('Periodo mínimo de pesquisa se inicia em "1997/05"','Erro',mtWarning,[mbOk],0);
    spAno.Value := 1997;
    spMes.Value := 05;
  End;

  if sspAnoFim < sspAno then begin
    MsgDlg('Periodo máximo de pesquisa deve ser maior que o mínimo','Erro',mtWarning,[mbOk],0);
    spAnoFim.Value := spAno.Value;
    spMesFim.Value := spMes.Value;
  End;

  if edtNumBeneficio.Text = '' then Exit;

end;

procedure TfrmConciliacaoReembolsoINSS.consultar(bFiltraRubrica: boolean);
begin
  if (MSBenef.ValoresChave.Count > 0) and
     (MSBenef.ValoresChave[0] <> '') then
  begin
    edtMatricula.Text       := MSBenef.ValoresChave[2];
    edtNumBeneficio.Text    := MSBenef.ValoresChave[0];
    iPessoa                 := StrToInt(MSBenef.ValoresChave[3]);// Andre Imakawa - SIG 44492
    consultarPessoa(MSBenef.ValoresChave[0]);
    if bFiltraRubrica then consultarRubricas();// Andre Imakawa - SIG 44492
    dsConsAnalitica.OnDataChange := nil;

    consultarTotais(iPessoa);
    consultarAnalitico(iPessoa);
    consultarDesembolsoFUNCEF(iPessoa);
    consultarReembolsoINSS();
    AtualizaRubFolha(iPessoa);

    dsConsAnalitica.OnDataChange := dsConsAnaliticaDataChange;
  end;

end;

procedure TfrmConciliacaoReembolsoINSS.spAnoExit(Sender: TObject);
begin
  inherited;
  consultar();
end;

procedure TfrmConciliacaoReembolsoINSS.spMesExit(Sender: TObject);
begin
  inherited;
  consultar();
end;

procedure TfrmConciliacaoReembolsoINSS.SpAnoFimExit(Sender: TObject);
begin
  inherited;
  consultar();
end;

procedure TfrmConciliacaoReembolsoINSS.SpMesFimExit(Sender: TObject);
begin
  inherited;
  consultar();
end;

procedure TfrmConciliacaoReembolsoINSS.chkInibirPAClick(Sender: TObject);
begin
  inherited;
  consultar();
end;

procedure TfrmConciliacaoReembolsoINSS.chkReembolsoFundacaoClick(
  Sender: TObject);
begin
  inherited;
  consultar();
end;

procedure TfrmConciliacaoReembolsoINSS.imprimirRelatorio;
Var
   i, ilinha, iContRub, iCountDet : Integer;
   sIdProvento, sRubricaINSS, sNumProc, sNomePlanoPrev,
   sEspecieFolha, sBenefFolha : String;
   dReembolsoLocal, nDifer : Double;
   arqeof : Boolean;
begin
  inherited;

   qryFundacao.Close;
   qryFundacao.ParamByName('pPessoa').AsInteger   := iPessoa;
   qryFundacao.Open;

   qryFolhaFuncef.DisableControls;
   qryReembolso.DisableControls;

   qryExtrIndivCRI.Close;
   qryExtrIndivCRI.Open;
   qryExtrIndivCRI.First;
   while not qryFolhaFuncef.EOF do begin
       iLinha := 1;
       sEspecieFolha  := edEspecie.text;
       sNomePlanoPrev := EdNomePlanoPrev.Text;
       sBenefFolha    := edBeneficio.text;
       sNumProc       := qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString;
       arqeof := False;

       if qryReembolso.Locate('NUMPROCINSS',qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString,
                              [loCaseInsensitive, loPartialKey]) then

         nDifer := (dedReembolso - qryFolhaFuncef.FieldByName('VALOR').AsFloat)
       else begin
         nDifer := (qryFolhaFuncef.FieldByName('VALOR').AsFloat);
         arqeof:= True;
       end;
       while (not qryFolhaFuncef.EOF) and (sNumProc = qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString )do begin

          qryExtrIndivCRI.Insert;
          qryExtrIndivCRI.FieldByName('MANTENEDORA').AsString  := edMantenedora.Text;
          qryExtrIndivCRI.FieldByName('MESCOBRANCA').AsString  := qryFolhaFuncef.FieldByName('MESCOBRANCA').AsString;
          qryExtrIndivCRI.FieldByName('MESREFERENCIA').AsString:= qryFolhaFuncef.FieldByName('MES').AsString;
          qryExtrIndivCRI.FieldByName('IDPLANOPREV').AsInteger := iPlanoContab;
          qryExtrIndivCRI.FieldByName('NOMEPLANO').AsString    := edEntidade.Text;
          qryExtrIndivCRI.FieldByName('ESPECIE').AsString      := sEspecieFolha;
          qryExtrIndivCRI.FieldByName('NOMEPLANOPREV').AsString:= sNomePlanoPrev;
          qryExtrIndivCRI.FieldByName('MATRICULA').AsString    := edtMatricula.Text;
          qryExtrIndivCRI.FieldByName('NB').AsString           := qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString;
          qryExtrIndivCRI.FieldByName('NOMEBENEF').AsString    := edNome.Text;
          qryExtrIndivCRI.FieldByName('RUBFUNCEF').AsString    := qryFolhaFuncef.FieldByName('CODPROVDESC').AsString;

          qryExtrIndivCRI.FieldByName('CODPROVDESC').AsString     := qryFolhaFuncef.FieldByName('CODPROVDESC').AsString;
          qryExtrIndivCRI.FieldByName('VALORPROVENTO').AsFloat    := qryFolhaFuncef.FieldByName('VALORPROVENTO').AsFloat;
          qryExtrIndivCRI.FieldByName('DESCRRUBRICA').AsString    := qryFolhaFuncef.FieldByName('DESCRRUBRICA').AsString;
          qryExtrIndivCRI.FieldByName('IDRUBRICA').AsString       := qryFolhaFuncef.FieldByName('IDRUBRICA').AsString;
          qryExtrIndivCRI.FieldByName('IDPLANOCONTABIL').AsString := qryFolhaFuncef.FieldByName('IDPLANOCONTABIL').AsString;
          qryExtrIndivCRI.FieldByName('MESCOMPREEM').AsString     := qryFolhaFuncef.FieldByName('MESCOMPREEM').AsString;


          qryExtrIndivCRI.FieldByName('VALORFUNCEF').AsFloat   := qryFolhaFuncef.FieldByName('VALORPROVENTO').AsFloat;
          if (not arqeof) and (qryReembolso.FieldByName('NUMPROCINSS').AsString  = sNumProc) and
             (not qryReembolso.EOF) then begin
             qryExtrIndivCRI.FieldByName('MESCOBREEMB').AsString := qryReembolso.FieldByName('MESCOBRANCA').AsString;
             qryExtrIndivCRI.FieldByName('MESREFREEMB').AsString := qryReembolso.FieldByName('MESREFERENCIA').AsString;
             qryExtrIndivCRI.FieldByName('RMREAJ').AsFloat       := qryReembolso.FieldByName('RMREAJ').AsFloat;
             qryExtrIndivCRI.FieldByName('RUBINSS').AsString     := qryReembolso.FieldByName('RUBRICAINSS').AsString;
             qryExtrIndivCRI.FieldByName('VALORINSS').AsFloat    := qryReembolso.FieldByName('VALORINSS').AsFloat;
             qryExtrIndivCRI.FieldByName('IDPLANOPREVREEMB').AsInteger := qryReembolso.FieldByName('IDPLANOPREV').AsInteger;

             qryExtrIndivCRI.FieldByName('DESCRRUBRICAREM').AsString   := qryReembolso.FieldByName('DESCRRUBRICA').AsString;
             qryExtrIndivCRI.FieldByName('DTINICIOCREDREM').AsString   := qryReembolso.FieldByName('DTINICIOCRED').AsString;
             qryExtrIndivCRI.FieldByName('DTFIMCREDREM').AsString      := qryReembolso.FieldByName('DTFIMCRED').AsString;
             qryExtrIndivCRI.FieldByName('MESCOMPREEMREM').AsString    := qryReembolso.FieldByName('MESCOMPREEM').AsString;

          end else begin
             qryExtrIndivCRI.FieldByName('MESCOBREEMB').Clear;
             qryExtrIndivCRI.FieldByName('MESREFREEMB').Clear;
             qryExtrIndivCRI.FieldByName('RMREAJ').Clear;
             qryExtrIndivCRI.FieldByName('RUBINSS').Clear;
             qryExtrIndivCRI.FieldByName('VALORINSS').Clear;
          end;
          if iLinha = 1 then
             qryExtrIndivCRI.FieldByName('DIFERENCA').AsFloat  := nDifer
          else
             qryExtrIndivCRI.FieldByName('DIFERENCA').Clear;
          inc(iLinha);
          qryExtrIndivCRI.Post;
          if not qryReembolso.eof then
             qryReembolso.Next;
          qryFolhaFuncef.Next;
       end;

       while (not qryReembolso.EOF) and (qryReembolso.FieldByName('NUMPROCINSS').AsString  = sNumProc) do begin
          qryExtrIndivCRI.Insert;
          qryExtrIndivCRI.FieldByName('ESPECIE').AsString      := sEspecieFolha;
          qryExtrIndivCRI.FieldByName('NOMEPLANOPREV').AsString:= sNomePlanoPrev;
          qryExtrIndivCRI.FieldByName('MATRICULA').AsString    := edtMatricula.Text;
          qryExtrIndivCRI.FieldByName('NB').AsString           := edtNumBeneficio.Text;
          qryExtrIndivCRI.FieldByName('NOMEBENEF').AsString    := edNome.Text;

          qryExtrIndivCRI.FieldByName('MANTENEDORA').AsString  := edMantenedora.Text;
          qryExtrIndivCRI.FieldByName('MESCOBREEMB').AsString  := qryReembolso.FieldByName('MESCOBRANCA').AsString;
          qryExtrIndivCRI.FieldByName('MESREFREEMB').AsString  := qryReembolso.FieldByName('MESREFERENCIA').AsString;
          qryExtrIndivCRI.FieldByName('IDPLANOPREV').AsInteger := qryReembolso.FieldByName('IDPLANOPREV').AsInteger;
          qryExtrIndivCRI.FieldByName('NOMEPLANO').AsString    := qryReembolso.FieldByName('ENTIDADECONTABIL').AsString;
          qryExtrIndivCRI.FieldByName('RUBINSS').AsString      := qryReembolso.FieldByName('RUBRICAINSS').AsString;
          qryExtrIndivCRI.FieldByName('VALORINSS').AsFloat     := qryReembolso.FieldByName('VALORINSS').AsFloat;
          qryExtrIndivCRI.FieldByName('RMREAJ').AsFloat        := qryReembolso.FieldByName('RMREAJ').AsFloat;
          qryExtrIndivCRI.FieldByName('IDPLANOPREVREEMB').AsInteger := qryReembolso.FieldByName('IDPLANOPREV').AsInteger;

          qryExtrIndivCRI.FieldByName('DESCRRUBRICAREM').AsString   := qryReembolso.FieldByName('DESCRRUBRICA').AsString;
          qryExtrIndivCRI.FieldByName('DTINICIOCREDREM').AsString   := qryReembolso.FieldByName('DTINICIOCRED').AsString;
          qryExtrIndivCRI.FieldByName('DTFIMCREDREM').AsString      := qryReembolso.FieldByName('DTFIMCRED').AsString;
          qryExtrIndivCRI.FieldByName('MESCOMPREEMREM').AsString    := qryReembolso.FieldByName('MESCOMPREEM').AsString;

          qryExtrIndivCRI.Post;
          qryReembolso.Next;
       end;
   end;

   qryReembolso.First;
   while not qryReembolso.EOF do begin
       iLinha := 1;

       if not qryFolhaFuncef.Locate('NUMPROCINSS',qryReembolso.FieldByName('NUMPROCINSS').AsString,[loCaseInsensitive, loPartialKey]) then begin
          sNumProc := qryReembolso.FieldByName('NUMPROCINSS').AsString;
          while (not qryReembolso.EOF) and (sNumProc = qryReembolso.FieldByName('NUMPROCINSS').AsString) do begin
             qryExtrIndivCRI.Insert;
             qryExtrIndivCRI.FieldByName('MANTENEDORA').AsString  := edMantenedora.Text;
             qryExtrIndivCRI.FieldByName('MESCOBREEMB').AsString  := qryReembolso.FieldByName('MESCOBRANCA').AsString;
             qryExtrIndivCRI.FieldByName('MESREFREEMB').AsString  := qryReembolso.FieldByName('MESREFERENCIA').AsString;
             qryExtrIndivCRI.FieldByName('IDPLANOPREV').AsInteger := qryReembolso.FieldByName('IDPLANOPREV').AsInteger;
             qryExtrIndivCRI.FieldByName('NOMEPLANO').AsString    := qryReembolso.FieldByName('ENTIDADECONTABIL').AsString;
             qryExtrIndivCRI.FieldByName('ESPECIE').AsString      := qryReembolso.FieldByName('ESPECIE').AsString;
             qryExtrIndivCRI.FieldByName('NOMEPLANOPREV').AsString:= qryReembolso.FieldByName('NOMEPLANOPREV').AsString;
             qryExtrIndivCRI.FieldByName('MATRICULA').AsString    := edtMatricula.Text; //qryReembolso.FieldByName('MATRICULA').AsString;
             qryExtrIndivCRI.FieldByName('NB').AsString           := qryReembolso.FieldByName('NUMPROCINSS').AsString;
             qryExtrIndivCRI.FieldByName('NOMEBENEF').AsString    := edNome.Text;
             qryExtrIndivCRI.FieldByName('RMREAJ').AsFloat        := qryReembolso.FieldByName('RMREAJ').AsFloat;
             qryExtrIndivCRI.FieldByName('RUBFUNCEF').Clear;
             qryExtrIndivCRI.FieldByName('VALORFUNCEF').Clear;
             qryExtrIndivCRI.FieldByName('RUBINSS').AsString      := qryReembolso.FieldByName('RUBRICAINSS').AsString;
             qryExtrIndivCRI.FieldByName('VALORINSS').AsFloat     := qryReembolso.FieldByName('VALORINSS').AsFloat;
             qryExtrIndivCRI.FieldByName('IDPLANOPREVREEMB').AsInteger := qryReembolso.FieldByName('IDPLANOPREV').AsInteger;

             qryExtrIndivCRI.FieldByName('DESCRRUBRICAREM').AsString   := qryReembolso.FieldByName('DESCRRUBRICA').AsString;
             qryExtrIndivCRI.FieldByName('DTINICIOCREDREM').AsString   := qryReembolso.FieldByName('DTINICIOCRED').AsString;
             qryExtrIndivCRI.FieldByName('DTFIMCREDREM').AsString      := qryReembolso.FieldByName('DTFIMCRED').AsString;
             qryExtrIndivCRI.FieldByName('MESCOMPREEMREM').AsString    := qryReembolso.FieldByName('MESCOMPREEM').AsString;

             qryExtrIndivCRI.FieldByName('DIFERENCA').AsFloat  := dedReembolso;
             inc(iLinha);
             qryExtrIndivCRI.Post;
             qryReembolso.Next;
          end;
       end else
          qryReembolso.Next;
   end;

   lblTotalFuncefCRI.Caption := FormatFloat('#,##0.00',qryFolhaFuncef.FieldByName('VALOR').AsFloat);


   qryGlosaExtrato.Close;
   qryGlosaExtrato.Prepare;
   qryGlosaExtrato.ParamByName('MESCOB').AsString             := sspAno;
   qryGlosaExtrato.ParamByName('MESCOBFIM').AsString          := sspAnoFim;
   qryGlosaExtrato.ParamByName('NUMPROC').AsString            := edtNumBeneficio.text;
   qryGlosaExtrato.ParamByName('PMANTENEDORAFUND').AsInteger  := Ord(chkReembolsoFundacao.Checked);
   qryGlosaExtrato.Open;

   if qryGlosaExtrato.EOF then
     dReembolsoLocal := dedReembolso
   else
     dReembolsoLocal := dedReembolso + qryGlosaExtrato.FieldByName('VLRGLOSA').AsFloat;

   lblTotalReembCRI.Caption  := FormatFloat('#,##0.00',dReembolsoLocal); { era dedReembolso }
   nDifer := nDifer + qryGlosaExtrato.FieldByName('VLRGLOSA').AsFloat;

   lblDiferencaCRI.Caption   := medDiferenca.text; //FormatFloat('#,##0.00',StrToFloat(medDiferenca.text));
   lblGlosaCRI.Caption       := medGlosa.text;    //FormatFloat('#,##0.00',nDifer);

   ppdExtrIndivCRI.Report.Template.SaveTo  := stFile;
   ppdExtrIndivCRI.Report.Template.Format  := ftASCII;
   ppdExtrIndivCRI.Report.Device           := dvScreen;

   qryFolhaFuncef.EnableControls;
   qryReembolso.EnableControls;

   TFrmPreview.CreateModalPreview(Application, ppdExtrIndivCRI.Report, 'Conciliação do Reembolso do INSS');
   
end;



procedure TfrmConciliacaoReembolsoINSS.consultarRubricas;
var
   sSQL,sSQLTodas         : String;
begin
   inherited;

   qryRubricasDesembolso.Close;

   sSQL :=
         ' SELECT DISTINCT IDPROVENTO                                                                                   '
       + '       ,CASE WHEN CODPROVDESC IS NOT NULL                                                                     '
       + '         THEN CODPROVDESC || '' - '' || NVL(DESCRPROVDESC,DESCRICAO)                                          '
       + '         ELSE NVL(DESCRPROVDESC,DESCRICAO)                                                                    '
       + '        END AS DESCRICAO                                                                                      '
       + '       ,1 as PROCESSAR                                                                                        '
       + ' FROM PROVDESC P                                                                                              '
       + ' WHERE CODFONTEPAGADORA=2                                                                                     '
       + ' AND EXISTS                                                                                                   '
       + ' (                                                                                                            '
       + '   SELECT 1                                                                                                   '
       + '   FROM HISTRUBSAL H                                                                                          '
       + '   WHERE (H.IDPESSJUR = :IDPESSJUR)      AND                                                                  '
       + '         (H.IDPESSOA  = :IDPESSOA)       AND                                                                  '
       + '    (  (H.MESCOBRANCA >= :MESCOB)        AND                                                                  '
       + '       (H.MESCOBRANCA <= :MESCOBFIM)                                                                          '
       + '    ) AND                                                                                                     '
       + '    ( ( (H.NUMPROCINSS = :NUMPROCINSS) AND (H.IDMODULO=18) ) OR                                               '
       + '      ( (H.NUMPROCINSS IS NULL) AND (H.IDMODULO=21) ))AND                                                     '
       + '    (H.IDMODULO IN (18,21))            AND                                                                    '
       + '    (H.IDRUBRICA = P.IDPROVENTO)       AND                                                                    '
       + '    ((H.FLGESTORNO = 0) OR (H.FLGESTORNO IS NULL)) AND                                                        '
       + '    ((H.FONTEPAGADORA = 2 ) OR ( (H.FONTEPAGADORA IS NULL) AND (H.IDMODULO=21) )) AND                         '
       + '    ( H.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 45)) AND        '// Andre Imakawa - SIG 44492 - Estrutura de Calculo
//       + '     ((1=:pConsideraPA) AND (H.CODPROVDESC NOT LIKE ''%30404'') AND (H.CODPROVDESC NOT LIKE ''%33404'') AND   '
//       + '        (H.CODPROVDESC NOT LIKE ''%30104'') OR (1<>:pConsideraPA))                                            '

       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Inicio
       //+ '    ((2=:pConsideraPA) OR ( (H.CODPROVDESC NOT LIKE ''%30404'') AND (H.CODPROVDESC NOT LIKE ''%33404'') AND   '
       //+ '       (H.CODPROVDESC NOT LIKE ''%30104'') ) )                                                                '
       + '   ((2=:pConsideraPA) OR ( H.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47)))        '
       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Fim

       + ' )                                                                                                            '
       + ' ORDER BY 2                                                                                                   ';

   sSQLTodas :=
         ' SELECT DISTINCT IDPROVENTO                                                                                   '
       + '       ,CASE WHEN CODPROVDESC IS NOT NULL                                                                     '
       + '         THEN CODPROVDESC || '' - '' || NVL(DESCRPROVDESC,DESCRICAO)                                          '
       + '         ELSE NVL(DESCRPROVDESC,DESCRICAO)                                                                    '
       + '        END AS DESCRICAO                                                                                      '
       + '       ,1 as PROCESSAR                                                                                        '
       + ' FROM PROVDESC P                                                                                              '
       + ' WHERE CODFONTEPAGADORA=2                                                                                     '
       + '   AND ( IDPROVENTO NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 45))          '// Andre Imakawa - SIG 44492 - Estrutura de Calculo
       + ' ORDER BY 2                                                                                                   ';


  qryRubricasDesembolso.Close;

  if (MSBenef.ValoresChave.Count > 0) and (MSBenef.ValoresChave[0] <> '') then
   begin
    qryRubricasDesembolso.SQL.Text := sSQL;

    qryRubricasDesembolso.ParamByName('IDPESSJUR').AsInteger  := Sistema.IdEmpresa;
    qryRubricasDesembolso.ParamByName('IDPESSOA').AsInteger   := iPessoa;
    qryRubricasDesembolso.ParamByName('NUMPROCINSS').AsString := edtNumBeneficio.Text;
    qryRubricasDesembolso.ParamByName('MESCOB').AsString      := sspAno;
    qryRubricasDesembolso.ParamByName('MESCOBFIM').AsString   := sspAnoFim;

    if chkInibirPA.Checked then
      qryRubricasDesembolso.ParamByName('pConsideraPA').AsInteger  := 1
    else
      qryRubricasDesembolso.ParamByName('pConsideraPA').AsInteger  := 2;

   end
  Else
    qryRubricasDesembolso.SQL.Text := sSQLTodas;

  qryRubricasDesembolso.Open;

  qryRubricasReembolso.Close;

   sSQL :=
         ' SELECT DISTINCT IDPROVENTO                                                                                   '
       + '       ,NVL(DESCRPROVDESC,DESCRICAO) AS DESCRICAO                                                             '
       + '       ,1 as PROCESSAR                                                                                        '
       + ' FROM PROVDESC P                                                                                              '
       + ' WHERE EXISTS                                                                                                 '
       + ' (                                                                                                            '
       + ' SELECT 1                                                                                                     '
       + ' FROM RUBRICAXINSS RI                                                                                         '
       + ' WHERE RI.IDRUBRICA = P.IDPROVENTO                                                                            '
       + '  AND SUBSTR(RI.RUBRICAINSS, 2, 1) NOT IN (''9'', ''3'')                                                      '
       + ' )                                                                                                            '
       + ' ORDER BY 2                                                                                                   ';


   sSQL :=
        ' SELECT DISTINCT IDPROVENTO                                                                   '
      + '       ,DESCRICAO                                                                             '
      + '       ,1 as PROCESSAR                                                                        '
      + ' FROM                                                                                         '
      + ' (                                                                                            '
      + ' SELECT P.IDPROVENTO                                                                          '
      + '       ,NVL(P.DESCRPROVDESC,P.DESCRICAO) AS DESCRICAO                                         '
      + ' FROM                                                                                         '
      + '    DETCONCINSS      D,                                                                       '
      + '    PROVDESC         P                                                                        '
      + ' WHERE                                                                                        '
      + '        (D.NUMPROCINSS = :pNUMPROCINSS)                                                       '
      + '    AND ( D.MESCOBRANCA >= :MESCOB )                                                          '
      + '    AND ( D.MESCOBRANCA <= :MESCOBFIM )                                                       '
      +  '    AND ((SUBSTR(D.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(D.RUBRICAINSS, 2, 1) <> ''9''))  '
      +  '    AND (D.IDRUBRICA       = P.IDPROVENTO)                                                   '
      +  '    AND (D.FLGMANUAL      <> 4)                                                              '// Andre Imakawa - SIG 44492
      +  '    AND (D.FLGMANUAL      <> 1)                                                              '// Andre Imakawa - SIG 44492
      +  '    AND (D.FLGMANUAL      <> 2)                                                              '// Andre Imakawa - SIG 44492
      +  '    AND ( (0 = :pAPENAS_REEMBOLSO_PARA_FUNCEF) OR                                            '
      +  '          ( (D.CODMANTENEDORA  IS NULL) OR ( D.CODMANTENEDORA IN (6, 14, 99) ) )  )          '

      // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Inicio
      //+  '    AND ( (0 = :pINIBIR_RUBRICA_PA) OR                                                       '
      //+  '          ( (P.CODPROVDESC NOT LIKE ''%30404'') AND (P.CODPROVDESC NOT LIKE ''%33404'') ) )  '
      + '   AND ((0 = :pINIBIR_RUBRICA_PA) OR ( D.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47)))        '
      // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Fim

      +  ' UNION ALL                                                                                   '
      +  ' SELECT P.IDPROVENTO                                                                         '
      +  '       ,NVL(P.DESCRPROVDESC,P.DESCRICAO) AS DESCRICAO                                        '
      +  ' FROM                                                                                        '
      +  '    TEMPCONCINSS T                                                                           '
      +  '   ,PROVDESC P                                                                               '
      +  '   ,RUBRICAXINSS R                                                                           ' // Andre Imakawa - SIG 125847
      +  ' WHERE                                                                                       '
      +  '        T.NUMPROCINSS = :pNUMPROCINSS                                                        '
      +  '    AND ( T.MESPROCESSAMENTO >= :MESCOB )                                                    '
      +  '    AND ( T.MESPROCESSAMENTO <= :MESCOBFIM )                                                 '
      +  '    AND TO_CHAR(T.CODRUBRICA1) = P.CODPROVDESC                                               '
      +  '    AND (R.IDRUBRICA          = P.IDPROVENTO)                                                ' // Andre Imakawa - SIG 125847
      //edilaine - SIG71716 - inicio
      {+  '    AND T.FLGMANUAL <> 4                                                                    '// Andre Imakawa - SIG 44492
      +  '    AND T.FLGMANUAL <> 1                                                                     '// Andre Imakawa - SIG 44492
      +  '    AND T.FLGMANUAL <> 2                                                                     '// Andre Imakawa - SIG 44492
      }//edilaine - SIG71716 - fim

      // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Inicio
      //+  '    AND ( (0 = :pINIBIR_RUBRICA_PA) OR                                                       '
      //+  '          ( (P.CODPROVDESC NOT LIKE ''%30404'') AND (P.CODPROVDESC NOT LIKE ''%33404'') ) )  '
      + '   AND ((0 = :pINIBIR_RUBRICA_PA) OR ( P.IDPROVENTO NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47)))        '
      // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Fim

      // Andre Imakawa - SIG SIG53294 - Inicio
      + ' UNION ALL                                                                                   '
      + ' SELECT P.IDPROVENTO                                                                          '
      + '       ,NVL(P.DESCRPROVDESC,P.DESCRICAO) AS DESCRICAO                                         '
      + ' FROM                                                                                         '
      + '    DETCONCINSS      D,                                                                       '
      + '    PROVDESC         P                                                                        '
      + ' WHERE                                                                                        '
      + '        (D.NUMPROCINSS = :pNUMPROCINSS)                                                       '
      + '    AND ( D.MESCOBRANCA >= :MESCOB )                                                          '
      + '    AND ( D.MESCOBRANCA <= :MESCOBFIM )                                                       '
      +  '    AND ((SUBSTR(D.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(D.RUBRICAINSS, 2, 1) <> ''9''))  '
      +  '    AND ((D.FLGMANUAL = 1) OR (D.FLGMANUAL = 2))                                             '
      +  '    AND (D.IDRUBRICA       = P.IDPROVENTO)                                                   '
      +  '    AND ( (0 = :pAPENAS_REEMBOLSO_PARA_FUNCEF) OR                                            '
      +  '          ( (D.CODMANTENEDORA  IS NULL) OR ( D.CODMANTENEDORA IN (6, 14, 99) ) )  )          '
      +  '   AND ((0 = :pINIBIR_RUBRICA_PA) OR ( D.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47)))        '
      // Andre Imakawa - SIG SIG53294 - Fim

      +  ' )                                                                                           '
      +  ' ORDER BY 2                                                                                  ';


   sSQLTodas :=
         ' SELECT IDPROVENTO                                                                                            '
       + '       ,NVL(DESCRPROVDESC,DESCRICAO) AS DESCRICAO                                                             '
       + '       ,1 as PROCESSAR                                                                                        '
       + ' FROM PROVDESC P                                                                                              '
       + ' WHERE EXISTS                                                                                                 '
       + ' (                                                                                                            '
       + ' SELECT 1                                                                                                     '
       + ' FROM RUBRICAXINSS RI                                                                                         '
       + ' WHERE RI.IDRUBRICA = P.IDPROVENTO                                                                            '
       + '  AND SUBSTR(RI.RUBRICAINSS, 2, 1) NOT IN (''9'', ''3'')                                                      '
       + '  AND ( RI.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 45))         '// Andre Imakawa - SIG 44492 - Estrutura de Calculo
       + ' )                                                                                                            '
       + ' ORDER BY 2                                                                                                   ';


  qryRubricasReembolso.Close;

  if (MSBenef.ValoresChave.Count > 0) and (MSBenef.ValoresChave[0] <> '') then
   begin
    //qryRubricasReembolso.SQL.Text := sSQL;
    qryRubricasReembolso.SQL.clear;
    qryRubricasReembolso.SQL.ADD(sSQL);
    qryRubricasReembolso.ParamByName('pNUMPROCINSS').AsString := edtNumBeneficio.Text;
    qryRubricasReembolso.ParamByName('MESCOB').AsString      := sspAno;
    qryRubricasReembolso.ParamByName('MESCOBFIM').AsString   := sspAnoFim;

    if chkInibirPA.Checked then
      qryRubricasReembolso.ParamByName('pINIBIR_RUBRICA_PA').AsInteger := 1
    Else
      qryRubricasReembolso.ParamByName('pINIBIR_RUBRICA_PA').AsInteger := 0;

    if chkReembolsoFundacao.Checked then
      qryRubricasReembolso.ParamByName('pAPENAS_REEMBOLSO_PARA_FUNCEF').AsInteger := 1
    Else
      qryRubricasReembolso.ParamByName('pAPENAS_REEMBOLSO_PARA_FUNCEF').AsInteger := 0;
   end
  Else
    qryRubricasReembolso.SQL.Text := sSQLTodas;

  qryRubricasReembolso.Open;



end;

procedure TfrmConciliacaoReembolsoINSS.dblcRubricaDesembolsoExit(Sender: TObject);
begin
  inherited;
  consultar();
end;

procedure TfrmConciliacaoReembolsoINSS.consultarAnalitico(iidpessoa : Integer);
var
   sSQL,
   sListaRubDesembolso,
   sSqlFiltroRubDesembolso,
   sListaRubReembolso,
   sSqlFiltroRubReembolso  : String;
begin
   inherited;

   sListaRubDesembolso     := '0';
   sSqlFiltroRubDesembolso := '';
   if chkFiltrarRubricas.Checked then
    begin
      sListaRubDesembolso     := retornaListaRubricas( qryRubricasDesembolso );
      if sListaRubDesembolso <> '' then
       begin
        sSqlFiltroRubDesembolso := ' AND ( P.IDPROVENTO IN (' + sListaRubDesembolso + ') ) ';
        filtroPorRubricas       := True;
       end;
    end;

   sListaRubReembolso       := '0';
   sSqlFiltroRubReembolso   := '';
   if chkFiltrarRubricas.Checked then
    begin
      sListaRubReembolso        := retornaListaRubricas( qryRubricasReembolso );
      if sListaRubReembolso <> '' then
       begin
        sSqlFiltroRubReembolso  := ' AND ( P.IDPROVENTO IN (' + sListaRubReembolso + ') ) ';
        filtroPorRubricas       := True;
       end;
    end;


   sSQL :=
         ' SELECT MESCOMPREEM AS MESCOBRANCA                                                                            '
       + '       ,SUBSTR(MESCOMPREEM,1,4) AS ANOCOBRANCA                                                                '
       + '       ,SUM(VALORDESEMBOLSO) AS VALORDESEMBOLSO                                                               '
       + '       ,SUM(VALORREEMBOLSO) AS VALORREEMBOLSO                                                                 '
       + '       ,SUM(VALORREEMBOLSO-VALORDESEMBOLSO) AS DIFERENCA                                                      '
       + ' FROM                                                                                                         '
       + ' (                                                                                                            '
       + ' (                                                                                                            '
       + ' SELECT                                                                                                       '
       + '    H.MESCOMPREEM                                                                                             '
       + '   ,SUM(DECODE(P.FLGDESCONTO, 0, H.VALORPROVENTO, 1, -H.VALORPROVENTO)) AS  VALORDESEMBOLSO                   '
       + '   ,0 AS VALORREEMBOLSO                                                                                       '
       + ' FROM                                                                                                         '
       //+ '   HISTRUBSAL H, PROVDESC P,  INFORME I,                                                                      ' // Andre Imakawa - SIG 44492 - Estrutura de Calculo
       + '   HISTRUBSAL H, PROVDESC P,                                                                                  '   // Andre Imakawa - SIG 44492 - Estrutura de Calculo
       + '   (SELECT IDRUBIRRFINSS FROM PARAMAPREV )PA                                                                  '
       + ' WHERE                                                                                                        '

       //SOL 268898 PPM 1289040
       + ' H.IDRUBRICA NOT IN (SELECT IDPROVENTO                                                                        '
       + '                             FROM   PROVDESC PD                                                               '
       + '                            WHERE  NVL(PD.FLGRRA, 0) = 1                                                      '
       + '                             AND    UPPER(PD.DESCRICAO) LIKE ''%RENDA FONTE RRA%'')    AND                       '
       //SOL 268898 PPM 1289040

       + '   (H.IDPESSJUR = :IDPESSJUR)      AND                                                                        '
       + '   (H.IDPESSOA  = :IDPESSOA)       AND                                                                        '
       + '   ((H.MESCOMPREEM >= :MESCOB)     AND                                                                        '
       + '    (H.MESCOMPREEM <= :MESCOBFIM)) AND                                                                        '
       + '   ( ( (H.NUMPROCINSS = :pNUMPROCINSS) AND (H.IDMODULO=18) ) OR                                               '
       + '     ( (H.NUMPROCINSS IS NULL) AND (H.IDMODULO=21) ))AND                                                      '
       + '   (H.IDMODULO IN (18,21))            AND                                                                     '
       + '   (H.IDRUBRICA = P.IDPROVENTO)       AND                                                                     '
       + '   (H.IDRUBRICA <> PA.IDRUBIRRFINSS)  AND                                                                     '
       + '   ((H.FLGESTORNO = 0) OR (H.FLGESTORNO IS NULL)) AND                                                         '
       + '   ((H.FONTEPAGADORA = 2 ) OR ( (H.FONTEPAGADORA IS NULL) AND (H.IDMODULO=21) AND                             '
       + '   (P.CODFONTEPAGADORA = 2) ) )                                                                               '

       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Inicio
       //+ '   AND (H.IDINFORME = I.IDINFORME(+))                                                                         '
       //+ '   AND (P.IDINFORME = I.IDINFORME OR P.IDINFORME IS NULL  )                                                   '
       //+ '   AND ( (I.CODDIRF NOT IN (3,7,14,16,17)) OR (I.CODDIRF IS NULL) )                                           '
       + '   AND ( H.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 45))         '
       //+ '   AND ( (0 = :pINIBIR_RUBRICA_PA) OR                                                                         '
       //+ '         ( (P.CODPROVDESC NOT LIKE ''%30404'') AND (P.CODPROVDESC NOT LIKE ''%33404'') ) )                    '
       + '   AND ((0 = :pINIBIR_RUBRICA_PA) OR ( H.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47)))        '
       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Fim




       +  sSqlFiltroRubDesembolso
       + ' GROUP BY MESCOMPREEM                                                                                         '
       + ' )                                                                                                            '
       + ' UNION ALL                                                                                                    '
       + ' (                                                                                                            '
       + ' SELECT MESCOMPREEM                                                                                           '
       + '       ,0 AS VALORDESEMBOLSO                                                                                  '
       + '       ,SUM(VALOR) as VALORREEMBOLSO                                                                          '
       + ' FROM                                                                                                         '
       + ' (                                                                                                            '
       + ' SELECT D.MESCOBRANCA AS MESCOMPREEM                                                                          '
       + '       ,DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0) AS VALOR                                        '
       + ' FROM                                                                                                         '
       + '    DETCONCINSS      D,                                                                                       '
       + '    PROVDESC         P                                                                                        '
       + ' WHERE                                                                                                        '
       + '        (D.NUMPROCINSS = :pNUMPROCINSS)                                                                       '
       + '    AND ( D.MESCOBRANCA >= :MESCOB )                                                                          '
       + '    AND ( D.MESCOBRANCA <= :MESCOBFIM )                                                                       '
       + '    AND (D.IDRUBRICA       = P.IDPROVENTO)                                                                    '
       + '    AND ((SUBSTR(D.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(D.RUBRICAINSS, 2, 1) <> ''9''))                   '
       + '    AND (D.FLGMANUAL      <> 4)                                                                               '// Andre Imakawa - SIG 44492
       + '    AND (D.FLGMANUAL      <> 1)                                                                               '// Andre Imakawa - SIG 44492
       + '    AND (D.FLGMANUAL      <> 2)                                                                               '// Andre Imakawa - SIG 44492
       + '    AND ( (0 = :pAPENAS_REEMBOLSO_PARA_FUNCEF) OR                                                             '
       + '          ( (D.CODMANTENEDORA  IS NULL) OR ( D.CODMANTENEDORA IN (6, 14, 99) ) )  )                           '

       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Inicio
       //+ '    AND ( (0 = :pINIBIR_RUBRICA_PA) OR                                                                        '
       //+ '          ( (P.CODPROVDESC NOT LIKE ''%30404'') AND (P.CODPROVDESC NOT LIKE ''%33404'') ) )                   '
       + '   AND ((0 = :pINIBIR_RUBRICA_PA) OR ( P.IDPROVENTO NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47)))        '
       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Fim

       +   sSqlFiltroRubReembolso
       + ' UNION ALL                                                                                                    '
       + ' SELECT T.MESPROCESSAMENTO AS MESCOMPREEM                                                                     '
//       + '       ,DECODE(P.FLGDESCONTO, 0, VLRRUBRICA1, 1, -VLRRUBRICA1, 0) AS VALOR                                    ' //Everson TIBERO
       + '       ,DECODE(P.FLGDESCONTO, 0, T.VLRRUBRICA1, 1, -T.VLRRUBRICA1, 0) AS VALOR                                '   //Everson TIBERO
       + ' FROM                                                                                                         '
       + '    TEMPCONCINSS T                                                                                            '
       + '   ,PROVDESC P                                                                                                '
       + '   ,RUBRICAXINSS R                                                                                            ' // Andre Imakawa - SIG 125847
       + ' WHERE                                                                                                        '
       + '        T.NUMPROCINSS = :pNUMPROCINSS                                                                         '
       + '    AND ( T.MESPROCESSAMENTO >= :MESCOB )                                                                     '
       + '    AND ( T.MESPROCESSAMENTO <= :MESCOBFIM )                                                                  '
       + '    AND TO_CHAR(T.CODRUBRICA1) = P.CODPROVDESC                                                                '
       + '    AND (R.IDRUBRICA          = P.IDPROVENTO)                                                                 ' // Andre Imakawa - SIG 125847
       //edilaine - SIG71716 - inicio
       {+'    AND T.FLGMANUAL <> 4                                                                                      '// Andre Imakawa - SIG 44492
       + '    AND T.FLGMANUAL <> 1                                                                                      '// Andre Imakawa - SIG 44492
       + '    AND T.FLGMANUAL <> 2                                                                                      '// Andre Imakawa - SIG 44492
       }//edilaine - SIG71716 - fim

       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Inicio
       //+ '    AND ( (0 = :pINIBIR_RUBRICA_PA) OR                                                                        '
       //+ '          ( (P.CODPROVDESC NOT LIKE ''%30404'') AND (P.CODPROVDESC NOT LIKE ''%33404'') ) )                   '
       + '   AND ((0 = :pINIBIR_RUBRICA_PA) OR ( P.IDPROVENTO NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47)))        '
       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Fim

       +   sSqlFiltroRubReembolso

       // Andre Imakawa - SIG SIG53294 - Inicio

       + ' UNION ALL                                                                                                    '
       + ' SELECT D.MESCOBRANCA AS MESCOMPREEM                                                                          '
//       + '       ,DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0) AS VALOR                                        ' //Everson TIBERO
       + '       ,DECODE(P.FLGDESCONTO, 0, D.VALORINSS, 1, -D.VALORINSS, 0) AS VALOR                                    '   //Everson TIBERO
       + ' FROM                                                                                                         '
       + '    DETCONCINSS      D,                                                                                       '
       + '    PROVDESC         P                                                                                        '
       + ' WHERE                                                                                                        '
       + '        (D.NUMPROCINSS = :pNUMPROCINSS)                                                                       '
       + '    AND ( D.MESCOBRANCA >= :MESCOB )                                                                          '
       + '    AND ( D.MESCOBRANCA <= :MESCOBFIM )                                                                       '
       + '    AND (D.IDRUBRICA       = P.IDPROVENTO)                                                                    '
       + '    AND ((SUBSTR(D.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(D.RUBRICAINSS, 2, 1) <> ''9''))                   '
       + '    AND ((D.FLGMANUAL = 1) OR (D.FLGMANUAL = 2))                                                              '
       + '    AND ( (0 = :pAPENAS_REEMBOLSO_PARA_FUNCEF) OR                                                             '
       + '          ( (D.CODMANTENEDORA  IS NULL) OR ( D.CODMANTENEDORA IN (6, 14, 99) ) )  )                           '
       + '   AND ((0 = :pINIBIR_RUBRICA_PA) OR ( P.IDPROVENTO NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47)))        '
       +   sSqlFiltroRubReembolso

       // Andre Imakawa - SIG SIG53294 - Fim

       + ' )                                                                                                            '
       + ' GROUP BY MESCOMPREEM                                                                                         '
       + ')                                                                                                             '
       + ')                                                                                                             '
       + ' GROUP BY MESCOMPREEM                                                                                         '
       + ' ORDER BY                                                                                                     '
       + ' MESCOMPREEM DESC                                                                                             ';


  //qryConsAnalitica.SQL.Text := sSQL;
  qryConsAnalitica.Close;
  qryConsAnalitica.SQL.clear;
  qryConsAnalitica.SQL.ADD(sSQL);
  qryConsAnalitica.ParamByName('IDPESSJUR').AsInteger  := Sistema.IdEmpresa;
  qryConsAnalitica.ParamByName('IDPESSOA').AsInteger   := iidpessoa;
  qryConsAnalitica.ParamByName('pNUMPROCINSS').AsString := edtNumBeneficio.Text;
  qryConsAnalitica.ParamByName('MESCOB').AsString      := sspAno;
  qryConsAnalitica.ParamByName('MESCOBFIM').AsString   := sspAnoFim;

  if chkInibirPA.Checked then
    qryConsAnalitica.ParamByName('pINIBIR_RUBRICA_PA').AsInteger := 1
  Else
    qryConsAnalitica.ParamByName('pINIBIR_RUBRICA_PA').AsInteger := 0;

  if chkReembolsoFundacao.Checked then
    qryConsAnalitica.ParamByName('pAPENAS_REEMBOLSO_PARA_FUNCEF').AsInteger := 1
  Else
    qryConsAnalitica.ParamByName('pAPENAS_REEMBOLSO_PARA_FUNCEF').AsInteger := 0;

  qryConsAnalitica.Open;

end;

procedure TfrmConciliacaoReembolsoINSS.dsConsAnaliticaDataChange(  Sender: TObject; Field: TField);
begin
  consultarDesembolsoFUNCEF(iPessoa);
  consultarReembolsoINSS();
end;

procedure TfrmConciliacaoReembolsoINSS.imprimirRelatorioAnalitico;
Var
   i, ilinha, iContRub, iCountDet : Integer;
   dReembolsoLocal, nDifer : Double;
   arqeof : Boolean;

   procedure insereCamposLinhaInfAnalitica();
    begin
      qryExtrIndivCRI.FieldByName('MESCOBRANCA').Clear;
      qryExtrIndivCRI.FieldByName('MESREFERENCIA').Clear;
      qryExtrIndivCRI.FieldByName('CODPROVDESC').Clear;
      qryExtrIndivCRI.FieldByName('VALORPROVENTO').Clear;
      qryExtrIndivCRI.FieldByName('DESCRRUBRICA').Clear;
      qryExtrIndivCRI.FieldByName('IDRUBRICA').Clear;
      qryExtrIndivCRI.FieldByName('IDPLANOCONTABIL').Clear;
      qryExtrIndivCRI.FieldByName('MESCOMPREEM').Clear;
      qryExtrIndivCRI.FieldByName('IDPLANOPREV').Clear;
      qryExtrIndivCRI.FieldByName('NOMEPLANO').Clear;
      qryExtrIndivCRI.FieldByName('DIB').Clear;
      qryExtrIndivCRI.FieldByName('MANTENEDORA').Clear;
      qryExtrIndivCRI.FieldByName('NB').Clear;
      qryExtrIndivCRI.FieldByName('ESPECIE').Clear;
      qryExtrIndivCRI.FieldByName('MATRICULA').Clear;
      qryExtrIndivCRI.FieldByName('NOMEBENEF').Clear;
      qryExtrIndivCRI.FieldByName('RUBFUNCEF').Clear;
      qryExtrIndivCRI.FieldByName('VALORFUNCEF').Clear;
      qryExtrIndivCRI.FieldByName('RUBINSS').Clear;
      qryExtrIndivCRI.FieldByName('VALORINSS').Clear;
      qryExtrIndivCRI.FieldByName('DIFERENCA').Clear;
      qryExtrIndivCRI.FieldByName('MESCOBREEMB').Clear;
      qryExtrIndivCRI.FieldByName('RMREAJ').Clear;
      qryExtrIndivCRI.FieldByName('IDPLANOPREVREEMB').Clear;
      qryExtrIndivCRI.FieldByName('NOMEPLANOPREV').Clear;
      qryExtrIndivCRI.FieldByName('DESCRRUBRICAREM').Clear;
      qryExtrIndivCRI.FieldByName('DTINICIOCREDREM').Clear;
      qryExtrIndivCRI.FieldByName('DTFIMCREDREM').Clear;
      qryExtrIndivCRI.FieldByName('MESCOMPREEMREM').Clear;

      qryExtrIndivCRI.FieldByName('MANTENEDORA').AsString  := edMantenedora.Text;
      qryExtrIndivCRI.FieldByName('IDPLANOPREV').AsInteger := iPlanoContab;
      qryExtrIndivCRI.FieldByName('NOMEPLANO').AsString    := edEntidade.Text;
      qryExtrIndivCRI.FieldByName('ESPECIE').AsString      := edEspecie.Text;
      qryExtrIndivCRI.FieldByName('NOMEPLANOPREV').AsString:= EdNomePlanoPrev.Text;
      qryExtrIndivCRI.FieldByName('MATRICULA').AsString    := edtMatricula.Text;
      qryExtrIndivCRI.FieldByName('NOMEBENEF').AsString    := edNome.Text;
      qryExtrIndivCRI.FieldByName('NB').AsString           := edtNumBeneficio.Text;
      qryExtrIndivCRI.FieldByName('PERFINV').AsString      := edPerfilInvest.Text;

      qryExtrIndivCRI.FieldByName('MESANALITICO').AsString       := qryConsAnalitica.FieldByName('MESCOBRANCA').AsString;
      qryExtrIndivCRI.FieldByName('TOTALDESEMBOLSO').AsFloat     := qryConsAnalitica.FieldByName('VALORDESEMBOLSO').AsFloat;
      qryExtrIndivCRI.FieldByName('TOTALREEMBOLSO').AsFloat      := qryConsAnalitica.FieldByName('VALORREEMBOLSO').AsFloat;
      qryExtrIndivCRI.FieldByName('DIFERENCAANALITICA').Clear;
      qryExtrIndivCRI.FieldByName('CONTADOR').AsInteger          := 1;
      qryExtrIndivCRI.FieldByName('LINHADESEMBOLSO').AsInteger   := 0;
      qryExtrIndivCRI.FieldByName('LINHAREEMBOLSO').AsInteger    := 0;


    end;


begin
  inherited;

   qryFundacao.Close;
   qryFundacao.ParamByName('pPessoa').AsInteger   := iPessoa;
   qryFundacao.Open;

   qryExtrIndivCRI.Close;
   qryExtrIndivCRI.Open;
   qryExtrIndivCRI.First;

   qryConsAnalitica.DisableControls;
   qryFolhaFuncef.DisableControls;
   qryReembolso.DisableControls;

   dsConsAnalitica.OnDataChange := nil;

   qryConsAnalitica.First;
   while not qryConsAnalitica.EOF do
    begin
      qryExtrIndivCRI.Insert;
      insereCamposLinhaInfAnalitica();
      qryExtrIndivCRI.Post;

      consultarDesembolsoFUNCEF(iPessoa);

      iCountDet := 0;
      while not qryFolhaFuncef.EOF do
        begin
          Inc(iCountDet);
          if qryExtrIndivCRI.Locate('MESANALITICO;LINHADESEMBOLSO',
                                    varArrayOf([qryConsAnalitica.FieldByName('MESCOBRANCA').AsString,0]),
                                    []) then
            qryExtrIndivCRI.Edit
          Else
           begin
              qryExtrIndivCRI.Insert;
              insereCamposLinhaInfAnalitica();
           end;

          qryExtrIndivCRI.FieldByName('MESCOBRANCA').AsString  := qryFolhaFuncef.FieldByName('MESCOBRANCA').AsString;
          qryExtrIndivCRI.FieldByName('MESREFERENCIA').AsString:= qryFolhaFuncef.FieldByName('MES').AsString;
          qryExtrIndivCRI.FieldByName('RUBFUNCEF').AsString    := qryFolhaFuncef.FieldByName('CODPROVDESC').AsString;

          qryExtrIndivCRI.FieldByName('CODPROVDESC').AsString      := qryFolhaFuncef.FieldByName('CODPROVDESC').AsString;
          qryExtrIndivCRI.FieldByName('VALORPROVENTO').AsFloat     := qryFolhaFuncef.FieldByName('VALORPROVENTO').AsFloat;
          qryExtrIndivCRI.FieldByName('DESCRRUBRICA').AsString     := qryFolhaFuncef.FieldByName('DESCRRUBRICA').AsString;
          qryExtrIndivCRI.FieldByName('IDRUBRICA').AsString        := qryFolhaFuncef.FieldByName('IDRUBRICA').AsString;
          qryExtrIndivCRI.FieldByName('IDPLANOCONTABIL').AsString  := qryFolhaFuncef.FieldByName('IDPLANOCONTABIL').AsString;
          qryExtrIndivCRI.FieldByName('MESCOMPREEM').AsString      := qryFolhaFuncef.FieldByName('MESCOMPREEM').AsString;
          qryExtrIndivCRI.FieldByName('SINALD').AsString           := qryFolhaFuncef.FieldByName('SINAL').AsString;
          qryExtrIndivCRI.FieldByName('LINHADESEMBOLSO').AsInteger := iCountDet;

          qryExtrIndivCRI.Post;
          qryFolhaFuncef.Next;
        end;

      consultarReembolsoINSS();
      qryReembolso.First;
      iCountDet := 0;
      while not qryReembolso.EOF do
        begin
          Inc(iCountDet);
          if qryExtrIndivCRI.Locate('MESANALITICO;LINHAREEMBOLSO',
                                    varArrayOf([qryConsAnalitica.FieldByName('MESCOBRANCA').AsString,0]),
                                    []) then
            qryExtrIndivCRI.Edit
          Else
           begin
              qryExtrIndivCRI.Insert;
              insereCamposLinhaInfAnalitica();
           end;

          qryExtrIndivCRI.FieldByName('MESCOBREEMB').AsString := qryReembolso.FieldByName('MESCOBRANCA').AsString;
          qryExtrIndivCRI.FieldByName('MESREFREEMB').AsString := qryReembolso.FieldByName('MESREFERENCIA').AsString;
          qryExtrIndivCRI.FieldByName('RMREAJ').AsFloat       := qryReembolso.FieldByName('RMREAJ').AsFloat;
          qryExtrIndivCRI.FieldByName('RUBINSS').AsString     := qryReembolso.FieldByName('RUBRICAINSS').AsString;
          qryExtrIndivCRI.FieldByName('VALORINSS').AsFloat    := qryReembolso.FieldByName('VALORINSS').AsFloat;
          qryExtrIndivCRI.FieldByName('IDPLANOPREVREEMB').AsInteger := qryReembolso.FieldByName('IDPLANOPREV').AsInteger;

          qryExtrIndivCRI.FieldByName('DESCRRUBRICAREM').AsString   := qryReembolso.FieldByName('DESCRRUBRICA').AsString;
          qryExtrIndivCRI.FieldByName('DTINICIOCREDREM').AsString   := qryReembolso.FieldByName('DTINICIOCRED').AsString;
          qryExtrIndivCRI.FieldByName('DTFIMCREDREM').AsString      := qryReembolso.FieldByName('DTFIMCRED').AsString;
          qryExtrIndivCRI.FieldByName('MESCOMPREEMREM').AsString    := qryReembolso.FieldByName('MESCOMPREEM').AsString;
          qryExtrIndivCRI.FieldByName('SINALR').AsString            := qryReembolso.FieldByName('SINAL').AsString;
          qryExtrIndivCRI.FieldByName('LINHAREEMBOLSO').AsInteger   := iCountDet;
          qryExtrIndivCRI.Post;

          qryReembolso.Next;
        end;

      qryExtrIndivCRI.Edit;
      qryExtrIndivCRI.FieldByName('DIFERENCAANALITICA').AsFloat  := qryConsAnalitica.FieldByName('DIFERENCA').AsFloat;
      qryExtrIndivCRI.Post;


      qryConsAnalitica.Next;
    end;

   lblTotalFuncefCRI.Caption := medDesembolso.Text;
   lblTotalReembCRI.Caption  := medReembolso.Text;
   lblDiferencaCRI.Caption   := medDiferenca.text;
   lblGlosaCRI.Caption       := medGlosa.text;

   ppdExtrIndivCRI.Report.Template.SaveTo  := stFile;
   ppdExtrIndivCRI.Report.Template.Format  := ftASCII;
   ppdExtrIndivCRI.Report.Device           := dvScreen;

   dsConsAnalitica.OnDataChange := dsConsAnaliticaDataChange;
   qryConsAnalitica.EnableControls;
   qryFolhaFuncef.EnableControls;
   qryReembolso.EnableControls;

   TFrmPreview.CreateModalPreview(Application, ppdExtrIndivCRI.Report, 'Conciliação do Reembolso do INSS');


end;

procedure TfrmConciliacaoReembolsoINSS.consultarReembolsoINSS;
var
   sSQL,
   sSQLComPlano,
   sListaRubReembolso,
   sSqlFiltroRubReembolso:String;
begin
   inherited;

   sListaRubReembolso       := '0';
   sSqlFiltroRubReembolso   := '';
   if chkFiltrarRubricas.Checked then
    begin
      sListaRubReembolso        := retornaListaRubricas( qryRubricasReembolso );
      if sListaRubReembolso <> '' then
       begin
        sSqlFiltroRubReembolso  := ' AND ( P.IDPROVENTO IN (' + sListaRubReembolso + ') ) ';
        filtroPorRubricas       := True;
       end;
    end;


   if (not qryConsAnalitica.Active) or (qryConsAnalitica.IsEmpty) then
   begin
     qryReembolso.Close;
     Exit;
   end;

   sSQL :=
         ' SELECT MESCOBRANCA                                                                          '
      +  '       ,MESREFERENCIA                                                                        '
      +  '       ,DESCRRUBRICA                                                                         '
      +  '       ,SINAL                                                                                '
      +  '       ,SUM(VALOR) as VALOR                                                                  '
      +  '       ,VALORINSS                                                                            '
      +  '       ,CODMANTENEDORA                                                                       '
      +  '       ,NOMEMANTENEDORA                                                                      '
      +  '       ,RMREAJ                                                                               '
      +  '       ,APREAJ                                                                               '
      +  '       ,CODCONCESSORINSS                                                                     '
      +  '       ,CODMANTENEDORINSS                                                                    '
      +  '       ,CODSINONIMO                                                                          '
      +  '       ,DTINICIOCRED                                                                         '
      +  '       ,DTFIMCRED                                                                            '
      +  '       ,MESCOMPREEM                                                                          '
      +  '       ,NUMPROCINSS                                                                          '
      +  '       ,MATRICULA                                                                            '
      +  '       ,ESPECIE                                                                              '
      +  '       ,RUBRICAINSS                                                                          '
      +  '       ,IDPLANOPREV                                                                          '
      +  '       ,ENTIDADECONTABIL                                                                     '
      +  '       ,SEQUENCIAL                                                                           '
      +  '       ,IDPLANOPREVPREV                                                                      '
      +  '       ,NOMEPLANOPREV                                                                        '
      +  ' FROM                                                                                        '
      +  ' (                                                                                           '
      +  ' SELECT D.MESCOBRANCA                                                                        '
      +  '       ,D.MESREFERENCIA                                                                      '
      +  '       ,P.DESCRICAO AS DESCRRUBRICA                                                          '
      +  '       ,DECODE(P.FLGDESCONTO, 1, ''(-)'', 0, ''(+)'', ''(*)'') AS SINAL                      '
//      +  '       ,DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0) AS VALOR                       ' //Everson TIBERO
      +  '       ,DECODE(P.FLGDESCONTO, 0, D.VALORINSS, 1, -D.VALORINSS, 0) AS VALOR                   '   //Everson TIBERO
      +  '       ,D.VALORINSS                                                                          '
      +  '       ,D.CODMANTENEDORA                                                                     '
      +  '       ,NVL(M.NOME,''FUNCEF'') AS NOMEMANTENEDORA                                            '
      +  '       ,D.RMREAJ                                                                             '
      +  '       ,D.APREAJ                                                                             '
      +  '       ,D.CODCONCESSORINSS                                                                   '
      +  '       ,D.CODMANTENEDORINSS                                                                  '
{     +  '       ,CODSINONIMO                                                                          '   //Everson TIBERO
      +  '       ,DTINICIOCRED                                                                         '   //Everson TIBERO
      +  '       ,DTFIMCRED                                                                            ' } //Everson TIBERO
      +  '       ,D.CODSINONIMO                                                                        '   //Everson TIBERO
      +  '       ,D.DTINICIOCRED                                                                       '   //Everson TIBERO
      +  '       ,D.DTFIMCRED                                                                          '   //Everson TIBERO
      +  '       ,D.MESREFERENCIA AS MESCOMPREEM                                                       '
      +  '       ,D.NUMPROCINSS                                                                        '
      +  '       ,D.MATRICULA                                                                          '
      +  '       ,D.ESPECIE                                                                            '
      +  '       ,D.RUBRICAINSS                                                                        '
      +  '       ,D.IDPLANOPREV                                                                        '
      +  '       ,PL.NOME AS ENTIDADECONTABIL                                                          '
      +  '       ,D.SEQUENCIAL                                                                         '
      +  '       ,D.IDPLANOPREVPREV                                                                    '
      +  '       ,PP.NOME AS NOMEPLANOPREV                                                             '
      +  ' FROM                                                                                        '
      +  '    DETCONCINSS      D,                                                                      '
      +  '    PROVDESC         P,                                                                      '
      +  '    PLANPREVCONTABIL PL,                                                                     '
      +  '    MANTENEDORA      M,                                                                      '
      +  '    PLANPREV         PP                                                                      '
      +  ' WHERE                                                                                       '
      +  '        (D.NUMPROCINSS = :pNUMPROCINSS)                                                       '
      +  '    AND ( D.MESCOBRANCA = :pMESCOBRANCA )                                                     '
      +  '    AND ((SUBSTR(D.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(D.RUBRICAINSS, 2, 1) <> ''9''))  '
      +  '    AND (D.IDRUBRICA       = P.IDPROVENTO)                                                   '
      +  '    AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))                                              '
      +  '    AND (D.IDPLANOPREV     = PL.IDPLANOPREV(+))                                              '
      +  '    AND (D.FLGMANUAL      <> 4)                                                              '// Andre Imakawa - SIG 44492
      +  '    AND (D.FLGMANUAL      <> 1)                                                              '// Andre Imakawa - SIG 44492
      +  '    AND (D.FLGMANUAL      <> 2)                                                              '// Andre Imakawa - SIG 44492
      +  '    AND (D.CODMANTENEDORA  = M.CODMANTENEDORA(+))                                            '
      +  '    AND ( (0 = :pAPENAS_REEMBOLSO_PARA_FUNCEF) OR                                            '
      +  '          ( (D.CODMANTENEDORA  IS NULL) OR ( D.CODMANTENEDORA IN (6, 14, 99) ) )  )          '

      // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Inicio
      //+  '    AND ( (0 = :pINIBIR_RUBRICA_PA) OR                                                       '
      //+  '          ( (P.CODPROVDESC NOT LIKE ''%30404'') AND (P.CODPROVDESC NOT LIKE ''%33404'') ) )  '
      + '   AND ((0 = :pINIBIR_RUBRICA_PA) OR ( D.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47)))        '
      // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Fim

      + sSqlFiltroRubReembolso
      +  ' UNION ALL                                                                                   '
      +  ' SELECT T.MESPROCESSAMENTO AS MESCOBRANCA                                                    '
      +  '       ,T.MESREFERENCIA                                                                      '
      +  '       ,P.DESCRICAO AS DESCRRUBRICA                                                          '
      +  '       ,DECODE(P.FLGDESCONTO, 1, ''(-)'', 0, ''(+)'', ''(*)'') AS SINAL                      '
//      +  '       ,DECODE(P.FLGDESCONTO, 0, VLRRUBRICA1, 1, -VLRRUBRICA1, 0) AS VALOR                   '//Everson TIBERO
      +  '       ,DECODE(P.FLGDESCONTO, 0, T.VLRRUBRICA1, 1, -T.VLRRUBRICA1, 0) AS VALOR               '  //Everson TIBERO
      +  '       ,T.VLRRUBRICA1 AS VALORINSS                                                           '
      +  '       ,''99'' AS CODMANTENEDORA                                                             '
      +  '       ,''NÃO IDENTIFICADO'' AS NOMEMANTENEDORA                                              '
      +  '       ,T.RMREAJ                                                                             '
      +  '       ,T.APREAJ                                                                             '
      +  '       ,T.CODCONCESSORINSS                                                                   '
      +  '       ,T.CODMANTENEDORINSS                                                                  '
      +  '       ,T.CODSINONIMO                                                                        '
      +  '       ,T.DTINICIOCRED                                                                       '
      +  '       ,T.DTFIMCRED                                                                          '
      +  '       ,T.MESREFERENCIA AS MESCOMPREEM                                                       '
      +  '       ,T.NUMPROCINSS                                                                        '
      +  '       ,T.MATRICULA                                                                          '
      +  '       ,T.ESPECIE                                                                            '
      +  '       ,T.CODRUBRICA1 AS RUBRICAINSS                                                         '
      +  '       ,2 AS IDPLANOPREV                                                                     '
      +  '       ,''REPLAN'' AS ENTIDADECONTABIL                                                       '
      +  '       ,1 AS SEQUENCIAL                                                                      '
      +  '       ,0 AS IDPLANOPREVPREV                                                                 '
      +  '       ,'' '' AS NOMEPLANOPREV                                                               '
      +  ' FROM                                                                                        '
      +  '    TEMPCONCINSS T                                                                           '
      +  '   ,PROVDESC P                                                                               '
      +  '   ,RUBRICAXINSS R                                                                           ' // Andre Imakawa - SIG 125847
      +  ' WHERE                                                                                       '
      +  '        T.NUMPROCINSS = :pNUMPROCINSS                                                         '
      +  '    AND T.MESPROCESSAMENTO = :pMESCOBRANCA                                                    '
      +  '    AND TO_CHAR(T.CODRUBRICA1) = P.CODPROVDESC                                               '
      +  '    AND (R.IDRUBRICA          = P.IDPROVENTO)                                                ' // Andre Imakawa - SIG 125847
      //edilaine - SIG71716 - inicio
      {+ '    AND T.FLGMANUAL <> 4                                                                     '// Andre Imakawa - SIG 44492
      +  '    AND T.FLGMANUAL <> 1                                                                     '// Andre Imakawa - SIG 44492
      +  '    AND T.FLGMANUAL <> 2                                                                     '// Andre Imakawa - SIG 44492
      }//edilaine - SIG71716 - fim


      // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Inicio
      //+  '    AND ( (0 = :pINIBIR_RUBRICA_PA) OR                                                       '
      //+  '          ( (P.CODPROVDESC NOT LIKE ''%30404'') AND (P.CODPROVDESC NOT LIKE ''%33404'') ) )  '
      + '   AND ((0 = :pINIBIR_RUBRICA_PA) OR ( P.IDPROVENTO NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47)))        '
      // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Fim

      + sSqlFiltroRubReembolso

      // Andre Imakawa - SIG SIG53294 - Inicio

      +  ' UNION ALL                                                                                   '
      +  ' SELECT D.MESCOBRANCA                                                                        '
      +  '       ,D.MESREFERENCIA                                                                      '
      +  '       ,P.DESCRICAO AS DESCRRUBRICA                                                          '
      +  '       ,DECODE(P.FLGDESCONTO, 1, ''(-)'', 0, ''(+)'', ''(*)'') AS SINAL                      '
//      +  '       ,DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0) AS VALOR                       '//Everson TIBERO
      +  '       ,DECODE(P.FLGDESCONTO, 0, D.VALORINSS, 1, -D.VALORINSS, 0) AS VALOR                   '  //Everson TIBERO
      +  '       ,D.VALORINSS                                                                          '
      +  '       ,D.CODMANTENEDORA                                                                     '
      +  '       ,NVL(M.NOME,''FUNCEF'') AS NOMEMANTENEDORA                                            '
      +  '       ,D.RMREAJ                                                                             '
      +  '       ,D.APREAJ                                                                             '
      +  '       ,D.CODCONCESSORINSS                                                                   '
      +  '       ,D.CODMANTENEDORINSS                                                                  '
{     +  '       ,CODSINONIMO                                                                          '  //Everson TIBERO
      +  '       ,DTINICIOCRED                                                                         '  //Everson TIBERO
      +  '       ,DTFIMCRED                                                                            '} //Everson TIBERO
      +  '       ,D.CODSINONIMO                                                                        '  //Everson TIBERO
      +  '       ,D.DTINICIOCRED                                                                       '  //Everson TIBERO
      +  '       ,D.DTFIMCRED                                                                          '  //Everson TIBERO
      +  '       ,D.MESREFERENCIA AS MESCOMPREEM                                                       '
      +  '       ,D.NUMPROCINSS                                                                        '
      +  '       ,D.MATRICULA                                                                          '
      +  '       ,D.ESPECIE                                                                            '
      +  '       ,D.RUBRICAINSS                                                                        '
      +  '       ,D.IDPLANOPREV                                                                        '
      +  '       ,PL.NOME AS ENTIDADECONTABIL                                                          '
      +  '       ,D.SEQUENCIAL                                                                         '
      +  '       ,D.IDPLANOPREVPREV                                                                    '
      +  '       ,PP.NOME AS NOMEPLANOPREV                                                             '
      +  ' FROM                                                                                        '
      +  '    DETCONCINSS      D,                                                                      '
      +  '    PROVDESC         P,                                                                      '
      +  '    PLANPREVCONTABIL PL,                                                                     '
      +  '    MANTENEDORA      M,                                                                      '
      +  '    PLANPREV         PP                                                                      '
      +  ' WHERE                                                                                       '
      +  '        (D.NUMPROCINSS = :pNUMPROCINSS)                                                       '
      +  '    AND ( D.MESCOBRANCA = :pMESCOBRANCA )                                                     '
      +  '    AND ((SUBSTR(D.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(D.RUBRICAINSS, 2, 1) <> ''9''))  '
      +  '    AND ((D.FLGMANUAL = 1) OR (D.FLGMANUAL = 2))                                             '
      +  '    AND (D.IDRUBRICA       = P.IDPROVENTO)                                                   '
      +  '    AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))                                              '
      +  '    AND (D.IDPLANOPREV     = PL.IDPLANOPREV(+))                                              '
      +  '    AND (D.CODMANTENEDORA  = M.CODMANTENEDORA(+))                                            '
      +  '    AND ( (0 = :pAPENAS_REEMBOLSO_PARA_FUNCEF) OR                                            '
      +  '          ( (D.CODMANTENEDORA  IS NULL) OR ( D.CODMANTENEDORA IN (6, 14, 99) ) )  )          '

      // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Inicio
      //+  '    AND ( (0 = :pINIBIR_RUBRICA_PA) OR                                                       '
      //+  '          ( (P.CODPROVDESC NOT LIKE ''%30404'') AND (P.CODPROVDESC NOT LIKE ''%33404'') ) )  '
      + '   AND ((0 = :pINIBIR_RUBRICA_PA) OR ( D.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47)))        '
      // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Fim

      + sSqlFiltroRubReembolso


      +  ' )                                                                                           '
      +  ' GROUP BY MESCOBRANCA                                                                        '
      +  '       ,MESREFERENCIA                                                                        '
      +  '       ,DESCRRUBRICA                                                                         '
      +  '       ,SINAL                                                                                '
      +  '       ,VALORINSS                                                                            '
      +  '       ,CODMANTENEDORA                                                                       '
      +  '       ,NOMEMANTENEDORA                                                                      '
      +  '       ,RMREAJ                                                                               '
      +  '       ,APREAJ                                                                               '
      +  '       ,CODCONCESSORINSS                                                                     '
      +  '       ,CODMANTENEDORINSS                                                                    '
      +  '       ,CODSINONIMO                                                                          '
      +  '       ,DTINICIOCRED                                                                         '
      +  '       ,DTFIMCRED                                                                            '
      +  '       ,MESCOMPREEM                                                                          '
      +  '       ,NUMPROCINSS                                                                          '
      +  '       ,MATRICULA                                                                            '
      +  '       ,ESPECIE                                                                              '
      +  '       ,RUBRICAINSS                                                                          '
      +  '       ,IDPLANOPREV                                                                          '
      +  '       ,ENTIDADECONTABIL                                                                     '
      +  '       ,SEQUENCIAL                                                                           '
      +  '       ,IDPLANOPREVPREV                                                                      '
      +  '       ,NOMEPLANOPREV                                                                        ';

   qryReembolso.Close;
   qryReembolso.SQL.Clear;
   qryReembolso.SQL.Text := sSQL;

   qryReembolso.ParamByName('pMESCOBRANCA').AsString := qryConsAnalitica.FieldByName('MESCOBRANCA').AsString;
   qryReembolso.ParamByName('pNUMPROCINSS').AsString := edtNumBeneficio.Text;

   if chkInibirPA.Checked then
    qryReembolso.ParamByName('pINIBIR_RUBRICA_PA').AsInteger := 1
   Else
    qryReembolso.ParamByName('pINIBIR_RUBRICA_PA').AsInteger := 0;

   if chkReembolsoFundacao.Checked then
    qryReembolso.ParamByName('pAPENAS_REEMBOLSO_PARA_FUNCEF').AsInteger := 1
   Else
    qryReembolso.ParamByName('pAPENAS_REEMBOLSO_PARA_FUNCEF').AsInteger := 0;

   qryReembolso.Open;

   dedReembolso := 0;
   while not(qryReembolso.EOF) do
   begin
      dedReembolso := dedReembolso + qryReembolso.FieldByName('VALOR').AsCurrency;
      qryReembolso.Next;
   end;

end;

procedure TfrmConciliacaoReembolsoINSS.btnImprimirSinteticoClick(
  Sender: TObject);
begin
  inherited;
  imprimirRelatorioSintetico();
end;

procedure TfrmConciliacaoReembolsoINSS.btnImprimirClick(Sender: TObject);
begin
  inherited;
  imprimirRelatorioAnalitico();
end;

procedure TfrmConciliacaoReembolsoINSS.dbgrdRubricasReembolsoFieldChanged(Sender: TObject; Field: TField);
begin
  if (Field.FieldName = 'PROCESSAR')  then
   bAlteracaoFiltroRubricas := True;

  if (Field.FieldName = 'PROCESSAR') and ( Field.Value = '0' ) and (Field.DisplayLabel = 'Inverter~Seleção') then
   begin
    qryRubricasReembolso.fieldbyname('PROCESSAR').displaylabel := 'Selecionar~Todos';
    dbgrdRubricasReembolso.Refresh;
   end;
end;

procedure TfrmConciliacaoReembolsoINSS.dbgrdRubricasDesembolsoFieldChanged(
  Sender: TObject; Field: TField);
begin
  inherited;
  if (Field.FieldName = 'PROCESSAR')  then
   bAlteracaoFiltroRubricas := True;

  if (Field.FieldName = 'PROCESSAR') and ( Field.Value = '0' ) and (Field.DisplayLabel = 'Inverter~Seleção') then
   begin
    qryRubricasDesembolso.fieldbyname('PROCESSAR').displaylabel := 'Selecionar~Todos';
    dbgrdRubricasDesembolso.Refresh;
   end;
end;

procedure TfrmConciliacaoReembolsoINSS.dbgrdRubricasReembolsoTitleButtonClick(
  Sender: TObject; AFieldName: String);
var qryLista : TwwQuery;
    dbgrdLista: TwwDBGrid;
begin
  qryLista   := qryRubricasReembolso;
  dbgrdLista := dbgrdRubricasReembolso;

  if AFieldName = 'PROCESSAR' then
   begin
     bAlteracaoFiltroRubricas := True;
     qryLista.disableControls;
     qryLista.First;
     While not qryLista.Eof do
      begin
         qryLista.Edit;
         if (qryLista.FieldByName('PROCESSAR').DisplayName = 'Selecionar~Todos') then
          qryLista.FieldByName('PROCESSAR').AsInteger := 1
         Else if (qryLista.FieldByName('PROCESSAR').DisplayName = 'Inverter~Seleção') and (qryLista.FieldByName('PROCESSAR').AsInteger= 1) then
          qryLista.FieldByName('PROCESSAR').AsInteger := 0
         Else if (qryLista.FieldByName('PROCESSAR').DisplayName = 'Inverter~Seleção') and (qryLista.FieldByName('PROCESSAR').AsInteger= 0) then
          qryLista.FieldByName('PROCESSAR').AsInteger := 1;
         qryLista.Post;
         qryLista.Next;
      end;
     qryLista.enableControls;
     qryLista.First;
   end;

  if (qryLista.FieldByName('PROCESSAR').DisplayName = 'Inverter~Seleção') then
   begin
    qryLista.fieldbyname('PROCESSAR').displaylabel := 'Selecionar~Todos';
    dbgrdLista.Refresh;
   end
  Else if (qryLista.FieldByName('PROCESSAR').DisplayName = 'Selecionar~Todos') then
   begin
    qryLista.fieldbyname('PROCESSAR').displaylabel := 'Inverter~Seleção';
    dbgrdLista.Refresh;
   end;
end;

procedure TfrmConciliacaoReembolsoINSS.dbgrdRubricasDesembolsoTitleButtonClick(
  Sender: TObject; AFieldName: String);
var qryLista : TwwQuery;
    dbgrdLista: TwwDBGrid;
begin
  inherited;
  qryLista   := qryRubricasDesembolso;
  dbgrdLista := dbgrdRubricasDesembolso;

  if AFieldName = 'PROCESSAR' then
   begin
     bAlteracaoFiltroRubricas := True;
     qryLista.disableControls;
     qryLista.First;
     While not qryLista.Eof do
      begin
         qryLista.Edit;
         if (qryLista.FieldByName('PROCESSAR').DisplayName = 'Selecionar~Todos') then
          qryLista.FieldByName('PROCESSAR').AsInteger := 1
         Else if (qryLista.FieldByName('PROCESSAR').DisplayName = 'Inverter~Seleção') and (qryLista.FieldByName('PROCESSAR').AsInteger= 1) then
          qryLista.FieldByName('PROCESSAR').AsInteger := 0
         Else if (qryLista.FieldByName('PROCESSAR').DisplayName = 'Inverter~Seleção') and (qryLista.FieldByName('PROCESSAR').AsInteger= 0) then
          qryLista.FieldByName('PROCESSAR').AsInteger := 1;
         qryLista.Post;
         qryLista.Next;
      end;
     qryLista.enableControls;
     qryLista.First;
   end;

  if (qryLista.FieldByName('PROCESSAR').DisplayName = 'Inverter~Seleção') then
   begin
    qryLista.fieldbyname('PROCESSAR').displaylabel := 'Selecionar~Todos';
    dbgrdLista.Refresh;
   end
  Else if (qryLista.FieldByName('PROCESSAR').DisplayName = 'Selecionar~Todos') then
   begin
    qryLista.fieldbyname('PROCESSAR').displaylabel := 'Inverter~Seleção';
    dbgrdLista.Refresh;
   end;
end;

procedure TfrmConciliacaoReembolsoINSS.chkFiltrarRubricasClick(
  Sender: TObject);
begin
  inherited;

  tsRubricasReembolso.TabVisible  := chkFiltrarRubricas.Checked;
  tsRubricasDesembolso.TabVisible := chkFiltrarRubricas.Checked;

  // Andre Imakawa - SIG 44492 - Inicio
  if not chkFiltrarRubricas.Checked then
  begin
    filtroPorRubricas := False;
    consultar(True);
  end;
  // Andre Imakawa - SIG 44492 - Fim

end;

procedure TfrmConciliacaoReembolsoINSS.imprimirRelatorioSintetico;
Var
   i, ilinha, iContRub, iCountDet : Integer;
   sIdProvento, sRubricaINSS, sNumProc, sNomePlanoPrev,
   sEspecieFolha, sBenefFolha : String;
   dReembolsoLocal, nDifer : Double;
   arqeof : Boolean;

   procedure insereCamposLinhaInfAnalitica();
    begin
      With qryExtrIndivCRI do
       begin
        FieldByName('MESCOBRANCA').Clear;
        FieldByName('MESREFERENCIA').Clear;
        FieldByName('CODPROVDESC').Clear;
        FieldByName('VALORPROVENTO').Clear;
        FieldByName('DESCRRUBRICA').Clear;
        FieldByName('IDRUBRICA').Clear;
        FieldByName('IDPLANOCONTABIL').Clear;
        FieldByName('MESCOMPREEM').Clear;
        FieldByName('IDPLANOPREV').Clear;
        FieldByName('NOMEPLANO').Clear;
        FieldByName('DIB').Clear;
        FieldByName('MANTENEDORA').Clear;
        FieldByName('NB').Clear;
        FieldByName('ESPECIE').Clear;
        FieldByName('MATRICULA').Clear;
        FieldByName('NOMEBENEF').Clear;
        FieldByName('RUBFUNCEF').Clear;
        FieldByName('VALORFUNCEF').Clear;
        FieldByName('RUBINSS').Clear;
        FieldByName('VALORINSS').Clear;
        FieldByName('DIFERENCA').Clear;
        FieldByName('MESCOBREEMB').Clear;
        FieldByName('RMREAJ').Clear;
        FieldByName('IDPLANOPREVREEMB').Clear;
        FieldByName('NOMEPLANOPREV').Clear;
        FieldByName('DESCRRUBRICAREM').Clear;
        FieldByName('DTINICIOCREDREM').Clear;
        FieldByName('DTFIMCREDREM').Clear;
        FieldByName('MESCOMPREEMREM').Clear;

        FieldByName('MESANALITICO').AsString       := qryConsAnalitica.FieldByName('MESCOBRANCA').AsString;
        FieldByName('TOTALDESEMBOLSO').AsFloat     := qryConsAnalitica.FieldByName('VALORDESEMBOLSO').AsFloat;
        FieldByName('TOTALREEMBOLSO').AsFloat      := qryConsAnalitica.FieldByName('VALORREEMBOLSO').AsFloat;
        FieldByName('DIFERENCAANALITICA').AsFloat  := qryConsAnalitica.FieldByName('DIFERENCA').AsFloat;
        FieldByName('CONTADOR').AsInteger          := 1;
        FieldByName('LINHADESEMBOLSO').AsInteger   := 0;
        FieldByName('LINHAREEMBOLSO').AsInteger    := 0;
       end;
    end;

begin
  inherited;

   qryFundacao.Close;
   qryFundacao.ParamByName('pPessoa').AsInteger   := iPessoa;
   qryFundacao.Open;

   qryExtrIndivCRI.Close;
   qryExtrIndivCRI.Open;
   qryExtrIndivCRI.First;

   qryConsAnalitica.DisableControls;
   qryFolhaFuncef.DisableControls;
   qryReembolso.DisableControls;

   dsConsAnalitica.OnDataChange := nil;

   qryConsAnalitica.First;
   while not qryConsAnalitica.EOF do
    begin
      qryExtrIndivCRI.Insert;
      insereCamposLinhaInfAnalitica();
      qryExtrIndivCRI.FieldByName('MANTENEDORA').AsString  := edMantenedora.Text;
      qryExtrIndivCRI.FieldByName('IDPLANOPREV').AsInteger := iPlanoContab;
      qryExtrIndivCRI.FieldByName('NOMEPLANO').AsString    := edEntidade.Text;
      qryExtrIndivCRI.FieldByName('ESPECIE').AsString      := edEspecie.Text;
      qryExtrIndivCRI.FieldByName('NOMEPLANOPREV').AsString:= EdNomePlanoPrev.Text;
      qryExtrIndivCRI.FieldByName('MATRICULA').AsString    := edtMatricula.Text;
      qryExtrIndivCRI.FieldByName('NOMEBENEF').AsString    := edNome.Text;
      qryExtrIndivCRI.FieldByName('NB').AsString           := edtNumBeneficio.Text;
      qryExtrIndivCRI.FieldByName('PERFINV').AsString      := edPerfilInvest.Text;
      qryExtrIndivCRI.Post;
      qryConsAnalitica.Next;
    end;

   lblTotalFuncefCRISint.Caption := medDesembolso.Text;
   lblTotalReembCRISint.Caption  := medReembolso.Text;
   lblDiferencaCRISint.Caption   := medDiferenca.text;
   lblGlosaCRISint.Caption       := medGlosa.text;

   ppdExtrIndivCRISint.Report.Template.SaveTo  := stFile;
   ppdExtrIndivCRISint.Report.Template.Format  := ftASCII;
   ppdExtrIndivCRISint.Report.Device           := dvScreen;

   dsConsAnalitica.OnDataChange := dsConsAnaliticaDataChange;
   qryConsAnalitica.EnableControls;
   qryFolhaFuncef.EnableControls;
   qryReembolso.EnableControls;

   TFrmPreview.CreateModalPreview(Application, ppdExtrIndivCRISint.Report, 'Conciliação do Reembolso do INSS');
end;

procedure TfrmConciliacaoReembolsoINSS.consultarTotais(iidpessoa: Integer);
var
   sSQL,
   sListaRubDesembolso,
   sSqlFiltroRubDesembolso,
   sListaRubReembolso,
   sSqlFiltroRubReembolso  : String;
begin
   inherited;

   sListaRubDesembolso     := '0';
   sSqlFiltroRubDesembolso := '';
   if chkFiltrarRubricas.Checked then
    begin
      sListaRubDesembolso     := retornaListaRubricas( qryRubricasDesembolso );
      if sListaRubDesembolso <> '' then
       begin
        sSqlFiltroRubDesembolso := ' AND ( P.IDPROVENTO IN (' + sListaRubDesembolso + ') ) ';
        filtroPorRubricas       := True;
       end;
    end;

   sListaRubReembolso       := '0';
   sSqlFiltroRubReembolso   := '';
   if chkFiltrarRubricas.Checked then
    begin
      sListaRubReembolso        := retornaListaRubricas( qryRubricasReembolso );
      if sListaRubReembolso <> '' then
       begin
        sSqlFiltroRubReembolso  := ' AND ( P.IDPROVENTO IN (' + sListaRubReembolso + ') ) ';
        filtroPorRubricas       := True;
       end;
    end;

   medDesembolso.Clear;
   medReembolso.Clear;
   medDiferenca.Clear;
   medGlosa.Clear;

   sSQL :=
         ' SELECT SUM(VALORDESEMBOLSO) AS VALORDESEMBOLSO                                                               '
       + '       ,SUM(VALORREEMBOLSO) AS VALORREEMBOLSO                                                                 '
       + '       ,SUM(VALORREEMBOLSO-VALORDESEMBOLSO) AS DIFERENCA                                                      '
       + ' FROM                                                                                                         '
       + ' (                                                                                                            '
       + ' (                                                                                                            '
       + ' SELECT                                                                                                       '
       + '    SUM(DECODE(P.FLGDESCONTO, 0, H.VALORPROVENTO, 1, -H.VALORPROVENTO)) AS  VALORDESEMBOLSO                   '
       + '   ,0 AS VALORREEMBOLSO                                                                                       '
       + ' FROM                                                                                                         '
       //+ '   HISTRUBSAL H, PROVDESC P,  INFORME I                                                                       ' // Andre Imakawa - SIG 44492 - Estrutura de Calculo
       + '   HISTRUBSAL H, PROVDESC P                                                                                   '   // Andre Imakawa - SIG 44492 - Estrutura de Calculo
       + ' WHERE                                                                                                        '
       //SOL 268898 PPM 1289040
       + ' H.IDRUBRICA NOT IN (SELECT IDPROVENTO                                                                        '
       + '                             FROM   PROVDESC PD                                                               '
       + '                            WHERE  NVL(PD.FLGRRA, 0) = 1                                                      '
       + '                             AND    UPPER(PD.DESCRICAO) LIKE ''%RENDA FONTE RRA%'')    AND                       '
       //SOL 268898 PPM 1289040

       + '   (H.IDPESSJUR = :IDPESSJUR)      AND                                                                        '
       + '   (H.IDPESSOA  = :IDPESSOA)       AND                                                                        '
       + '   ((H.MESCOMPREEM >= :MESCOB)     AND                                                                        '
       + '    (H.MESCOMPREEM <= :MESCOBFIM)) AND                                                                        '
       + '   ( ( (H.NUMPROCINSS = :pNUMPROCINSS) AND (H.IDMODULO=18) ) OR                                               '
       + '     ( (H.NUMPROCINSS IS NULL) AND (H.IDMODULO=21) ))AND                                                      '
       + '   (H.IDMODULO IN (18,21))            AND                                                                     '
       + '   (H.IDRUBRICA = P.IDPROVENTO)       AND                                                                     '
       + '   ((H.FLGESTORNO = 0) OR (H.FLGESTORNO IS NULL)) AND                                                         '
       + '   ((H.FONTEPAGADORA = 2 ) OR ( (H.FONTEPAGADORA IS NULL) AND (H.IDMODULO=21) AND                             '
       + '   (P.CODFONTEPAGADORA = 2) ) )                                                                               '

       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Inicio
       //+ '   AND (H.IDINFORME = I.IDINFORME(+))                                                                         '
       //+ '   AND (P.IDINFORME = I.IDINFORME OR P.IDINFORME IS NULL  )                                                   '
       //+ '   AND ( (I.CODDIRF NOT IN (3,7,14,16,17)) OR (I.CODDIRF IS NULL) )                                           '
       + '   AND ( H.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 45))         '
       //+ '   AND ( (0 = :pINIBIR_RUBRICA_PA) OR                                                                         '
       //+ '         ( (P.CODPROVDESC NOT LIKE ''%30404'') AND (P.CODPROVDESC NOT LIKE ''%33404'') ) )                    '
       + '   AND ((0 = :pINIBIR_RUBRICA_PA) OR ( H.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47)))        '
       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Fim



       +  sSqlFiltroRubDesembolso
       + ' )                                                                                                            '
       + ' UNION ALL                                                                                                    '
       + ' (                                                                                                            '
       + ' SELECT 0 AS VALORDESEMBOLSO                                                                                  '
       + '       ,SUM(VALOR) as VALORREEMBOLSO                                                                          '
       + ' FROM                                                                                                         '
       + ' (                                                                                                            '
//       + ' SELECT DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0) AS VALOR                                        ' //Everson TIBERO
       + ' SELECT DECODE(P.FLGDESCONTO, 0, D.VALORINSS, 1, -D.VALORINSS, 0) AS VALOR                                    '   //Everson TIBERO
       + ' FROM                                                                                                         '
       + '    DETCONCINSS      D,                                                                                       '
       + '    PROVDESC         P                                                                                        '
       + ' WHERE                                                                                                        '
       + '        (D.NUMPROCINSS = :pNUMPROCINSS)                                                                       '
       + '    AND ( D.MESCOBRANCA >= :MESCOB )                                                                          '
       + '    AND ( D.MESCOBRANCA <= :MESCOBFIM )                                                                       '
       + '    AND (D.IDRUBRICA       = P.IDPROVENTO)                                                                    '
       + '    AND ((SUBSTR(D.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(D.RUBRICAINSS, 2, 1) <> ''9''))                   '
       + '    AND (D.FLGMANUAL      <> 4)                                                                               '// Andre Imakawa - SIG 44492
       + '    AND (D.FLGMANUAL      <> 1)                                                                               '// Andre Imakawa - SIG 44492
       + '    AND (D.FLGMANUAL      <> 2)                                                                               '// Andre Imakawa - SIG 44492
       + '    AND ( (0 = :pAPENAS_REEMBOLSO_PARA_FUNCEF) OR                                                             '
       + '          ( (D.CODMANTENEDORA  IS NULL) OR ( D.CODMANTENEDORA IN (6, 14, 99) ) )  )                           '

       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Inicio
       //+ '    AND ( (0 = :pINIBIR_RUBRICA_PA) OR                                                                        '
       //+ '          ( (P.CODPROVDESC NOT LIKE ''%30404'') AND (P.CODPROVDESC NOT LIKE ''%33404'') ) )                   '
       + '   AND ((0 = :pINIBIR_RUBRICA_PA) OR ( D.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47)))        '
       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Fim

       +   sSqlFiltroRubReembolso
       + ' UNION ALL                                                                                                    '
//       + ' SELECT DECODE(P.FLGDESCONTO, 0, VLRRUBRICA1, 1, -VLRRUBRICA1, 0) AS VALOR                                    ' //Everson TIBERO
       + ' SELECT DECODE(P.FLGDESCONTO, 0, T.VLRRUBRICA1, 1, -T.VLRRUBRICA1, 0) AS VALOR                                '   //Everson TIBERO
       + ' FROM                                                                                                         '
       + '    TEMPCONCINSS T                                                                                            '
       + '   ,PROVDESC P                                                                                                '
       + '   ,RUBRICAXINSS R                                                                                            ' // Andre Imakawa - SIG 125847
       + ' WHERE                                                                                                        '
       + '        T.NUMPROCINSS = :pNUMPROCINSS                                                                         '
       + '    AND ( T.MESPROCESSAMENTO >= :MESCOB )                                                                     '
       + '    AND ( T.MESPROCESSAMENTO <= :MESCOBFIM )                                                                  '
       + '    AND TO_CHAR(T.CODRUBRICA1) = P.CODPROVDESC                                                                '
       + '    AND (R.IDRUBRICA          = P.IDPROVENTO)                                                                 ' // Andre Imakawa - SIG 125847
       //edilaine - SIG71716 - inicio
       {+'    AND T.FLGMANUAL <> 4                                                                                      '// Andre Imakawa - SIG 44492
       + '    AND T.FLGMANUAL <> 1                                                                                      '// Andre Imakawa - SIG 44492
       + '    AND T.FLGMANUAL <> 2                                                                                      '// Andre Imakawa - SIG 44492
       }//edilaine - SIG71716 - fim


       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Inicio
       //+ '    AND ( (0 = :pINIBIR_RUBRICA_PA) OR                                                                        '
       //+ '          ( (P.CODPROVDESC NOT LIKE ''%30404'') AND (P.CODPROVDESC NOT LIKE ''%33404'') ) )                   '
       + '   AND ((0 = :pINIBIR_RUBRICA_PA) OR ( P.IDPROVENTO NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47)))        '
       // Andre Imakawa - SIG 44492 - Estrutura de Calculo - Fim

       +   sSqlFiltroRubReembolso

       // Andre Imakawa - SIG SIG53294 - Inicio
       
       + ' UNION ALL                                                                                                    '
//       + ' SELECT DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0) AS VALOR                                        ' //Everson TIBERO
       + ' SELECT DECODE(P.FLGDESCONTO, 0, D.VALORINSS, 1, -D.VALORINSS, 0) AS VALOR                                    '   //Everson TIBERO
       + ' FROM                                                                                                         '
       + '    DETCONCINSS      D,                                                                                       '
       + '    PROVDESC         P                                                                                        '
       + ' WHERE                                                                                                        '
       + '        (D.NUMPROCINSS = :pNUMPROCINSS)                                                                       '
       + '    AND ( D.MESCOBRANCA >= :MESCOB )                                                                          '
       + '    AND ( D.MESCOBRANCA <= :MESCOBFIM )                                                                       '
       + '    AND (D.IDRUBRICA       = P.IDPROVENTO)                                                                    '
       + '    AND ((SUBSTR(D.RUBRICAINSS, 2, 1) <> ''3'') AND (SUBSTR(D.RUBRICAINSS, 2, 1) <> ''9''))                   '
       + '    AND ((D.FLGMANUAL = 1) OR (D.FLGMANUAL = 2))                                                              '
       + '    AND ( (0 = :pAPENAS_REEMBOLSO_PARA_FUNCEF) OR                                                             '
       + '          ( (D.CODMANTENEDORA  IS NULL) OR ( D.CODMANTENEDORA IN (6, 14, 99) ) )  )                           '
       + '   AND ((0 = :pINIBIR_RUBRICA_PA) OR ( D.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47)))        '
       +   sSqlFiltroRubReembolso

       // Andre Imakawa - SIG SIG53294 - Fim

       + ' )                                                                                                            '
       + ' )                                                                                                            '
       + ' )                                                                                                            ';


  //qryConsTotais.SQL.Text := sSQL;
  qryConsTotais.Close;
  qryConsTotais.SQL.clear;
  qryConsTotais.SQL.ADD(sSQL);
  qryConsTotais.ParamByName('IDPESSJUR').AsInteger  := Sistema.IdEmpresa;
  qryConsTotais.ParamByName('IDPESSOA').AsInteger   := iidpessoa;
  qryConsTotais.ParamByName('pNUMPROCINSS').AsString := edtNumBeneficio.Text;
  qryConsTotais.ParamByName('MESCOB').AsString      := sspAno;
  qryConsTotais.ParamByName('MESCOBFIM').AsString   := sspAnoFim;

  if chkInibirPA.Checked then
    qryConsTotais.ParamByName('pINIBIR_RUBRICA_PA').AsInteger := 1
  Else
    qryConsTotais.ParamByName('pINIBIR_RUBRICA_PA').AsInteger := 0;

  if chkReembolsoFundacao.Checked then
    qryConsTotais.ParamByName('pAPENAS_REEMBOLSO_PARA_FUNCEF').AsInteger := 1
  Else
    qryConsTotais.ParamByName('pAPENAS_REEMBOLSO_PARA_FUNCEF').AsInteger := 0;

  qryConsTotais.Open;

  if not qryConsTotais.IsEmpty then
   begin
     medDesembolso.Text := FormatFloat('###,###,##0.00', qryConsTotais.FieldByName('VALORDESEMBOLSO').AsCurrency);
     medReembolso.Text  := FormatFloat('###,###,##0.00', qryConsTotais.FieldByName('VALORREEMBOLSO').AsCurrency);
     medDiferenca.Text  := FormatFloat('###,###,##0.00', qryConsTotais.FieldByName('DIFERENCA').AsCurrency);
   end;

  qryConsGlosa.Close;

  qryConsGlosa.ParamByName('pNUMPROCINSS').AsString := edtNumBeneficio.Text;
  qryConsGlosa.ParamByName('MESCOB').AsString      := sspAno;
  qryConsGlosa.ParamByName('MESCOBFIM').AsString   := sspAnoFim;

  if chkInibirPA.Checked then
    qryConsGlosa.ParamByName('pINIBIR_RUBRICA_PA').AsInteger := 1
  Else
    qryConsGlosa.ParamByName('pINIBIR_RUBRICA_PA').AsInteger := 0;

  if chkReembolsoFundacao.Checked then
    qryConsGlosa.ParamByName('pAPENAS_REEMBOLSO_PARA_FUNCEF').AsInteger := 1
  Else
    qryConsGlosa.ParamByName('pAPENAS_REEMBOLSO_PARA_FUNCEF').AsInteger := 0;

  qryConsGlosa.Open;

  if not qryConsGlosa.IsEmpty then
   begin
     medGlosa.Text  := FormatFloat('###,###,##0.00', qryConsGlosa.FieldByName('VALORGLOSA').AsCurrency);
   end;

  qryConsGlosa.Close;

end;

function TfrmConciliacaoReembolsoINSS.retornaListaRubricas( qryGrid: TwwQuery ): String;
var vListaRub: String;
begin
   vListaRub := '';
   if not qryGrid.IsEmpty then
    begin
      qryGrid.First;
      While not qryGrid.Eof do
       begin
         if (qryGrid.FieldByName('PROCESSAR').AsString = '1') and (vListaRub = '') then
           vListaRub := qryGrid.FieldByName('IDPROVENTO').AsString
         Else if (qryGrid.FieldByName('PROCESSAR').AsString = '1') and (vListaRub <> '') then
           vListaRub := vListaRub + ',' + qryGrid.FieldByName('IDPROVENTO').AsString;
         qryGrid.Next;
       end;
    end;

   result := vListaRub;
end;

procedure TfrmConciliacaoReembolsoINSS.pcPrincipalChange(Sender: TObject);
begin
  inherited;
  if (pcPrincipal.ActivePage = tsGrids) and ( bAlteracaoFiltroRubricas ) then
    begin
      bAlteracaoFiltroRubricas := False;
      consultar();
    end;

end;

end.
