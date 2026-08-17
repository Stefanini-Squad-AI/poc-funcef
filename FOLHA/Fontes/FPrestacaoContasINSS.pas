// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//Alteracoes  :  retornaValorDesembolsoPrevia, retornaValorDesembolsoEfetivacao
//Pendência   :  WO14620
//Responsável :  Edilaine
//Data        :  17/09/2024
//Descrição   :  Trazer na conciliação apenas valores do mes de reembolso
//------------------------------------------------------------------------------
//Alteracoes  :  retornaValorDesembolsoPrevia, retornaValorDesembolsoEfetivacao
//Pendência   :  WO 13135
//Responsável :  Leandro Pocebon
//Data        :  26/08/2024
//Descrição   :  Exclui da seleção dos valores de desembolso as rubricas da estrutura
//               de calculo 45 e 47
//------------------------------------------------------------------------------
//Pendência   :  SIG 127791
//Responsável :  Andre Imakawa
//Data        :  04/08/2022
//Descrição   :  Ajustar motivo para retenção quando motivo é Prova de Vida(73)
//------------------------------------------------------------------------------
//Pendência   :  SIG 114623
//Responsável :  Ewerton Beltramini
//Data        :  29/01/2021
//Descrição   :  Implementação do comando Copy, para igualar as bases de produção.
//------------------------------------------------------------------------------
//Alteracoes  : consultarPrestacaoContasDesembolso
//Pendência   : SIG 99995
//Responsável : Andre Imakawa
//Data        : 19/05/2020
//Descrição   : Tratamento no campo especie, agrupamento estava dando erro de PK.
//------------------------------------------------------------------------------
//Alteracoes  : (.dfm chkSomenteRel) gerarPrestacaoContas, bbtnConfirmarClick
//              gerarRelatorioSintetico,
//Pendência   : SIG 78760
//Responsável : Edilaine
//Data        : 22/11/2018
//Descrição   : adequação da funcionalidade para calculo da glosa e ordenação relatório
//------------------------------------------------------------------------------
//Pendência   : SIG TIBERO
//Responsável : Everson Luiz Pereira da Cunha
//Data        : 23/02/2018
//Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//              Retirada de INDEX, +rule etc.
//              Melhoria realizada para adaptação ao TIBERO.
//------------------------------------------------------------------------------
//Pendência   : SOL 146677 Kintana 1233515
//Responsável : MARCIO DENILSON
//Data        : 04/09/2012
//Descrição   : Alteraçao na totalização de valores de desembolso (relatórios)
//              para considerarem como os acertos realizados.
//------------------------------------------------------------------------------
//Pendência   : SOL 146677 Kintana 1233515
//Responsável : MARCIO DENILSON
//Data        : 13/08/2012
//Descrição   : Correção da rotina consultaTextoEmailUF e da totalização de valores
//              de diferenças
//------------------------------------------------------------------------------
//Pendência   : SOL 146677 Kintana 1233515
//Responsável : MARCIO DENILSON
//Data        : 10/07/2012
//Descrição   : Alteração da consulta consultarPrestacaoContasDesembolso
//              para desconsiderar rubricas manuais e evitar duplicação de registros
//------------------------------------------------------------------------------
//Pendência   : SOL 146677 Kintana 1233515
//Responsável : MARCIO DENILSON
//Data        : 02/07/2012
//Descrição   : Alteração de filtro da consulta consultarPrestacaoContasDesembolso
//              para corrigir apresentação do tipo de rubrica
//------------------------------------------------------------------------------
//Pendência   : SOL 146677 Kintana 1233515
//Responsável : MARCIO DENILSON
//Data        : 10/05/2012
//Descrição   : Ajustes solicitados pela GEPAB
//------------------------------------------------------------------------------
//Pendência   : SOL 146677 Kintana 1233515
//Responsável : MARCIO DENILSON
//Data        : 10/02/2012
//Descrição   : Retirada de trava de limitação de número de registros utilizada para
//              agilizar rotina de teste
//------------------------------------------------------------------------------
//Pendência   : SOL 146677 Kintana 1233515
//Responsável : MARCIO DENILSON
//Data        : 10/02/2012
//Descrição   : Ajustes solicitados pela GEPAB:
//               - Agrupamento por tipo de rubrica valoradas ( por configuração )
//               - Totalização de valores por Sinonimo/UF
//------------------------------------------------------------------------------
//Pendência   : SOL 146677 Kintana 1233515
//Responsável : MARCIO DENILSON
//Data        : 28/10/2011
//Descrição   : Desenvolvimento inicial da tela
//------------------------------------------------------------------------------
unit FPrestacaoContasINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, Db, DBTables, Wwquery,
  FPreview,  Pptypes, ComCtrls, Menus, ppEndUsr,
  ppCtrls, ppDB, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Mask, wwdbedit, wwdblook,
  MontaSelect, DBGrids, Wwdotdot, Wwdbcomb, JCLSysUtils, JclMapi, Wwdatsrc,
  ppParameter, ppStrtch, ppMemo, ppModule, daDataModule, raCodMod, uCMMath,
  DBClient, uCMClientDataSet;

type
  TTipoPrestacaoContas = (tpPrevia, tpEfetivacao);
  TOpRetifica = (trGrava, trApaga);                                  //edilaine - SIG78760
  TTipoConsultaFinal   = (tcDados, tcJustificativa, tcBeneficios);   //edilaine - SIG78760

  TfrmPrestacaoContasINSS = class(TfrmOkCancelar)
    pnOpcoesPesquisa: TPanel;
    gbPeriodo: TGroupBox;
    gbDataInicial: TGroupBox;
    cmb_mesInicio: TComboBox;
    spn_anoInicio: TSpinEdit;
    gbDataFinal: TGroupBox;
    cmb_mesFinal: TComboBox;
    spn_anoFinal: TSpinEdit;
    rbOpcaoSintetico: TRadioButton;
    rbOpcaoAnalitico: TRadioButton;
    gbResponsavel: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtNomeResponsavel: TEdit;
    edtCargoResponsavel: TEdit;
    bbtnGerarArquivo: TBitBtn;
    bbtnEnviar: TBitBtn;
    qryAux: TwwQuery;
    rgTipoRelatorio: TGroupBox;
    qryOrgaosINSS: TwwQuery;
    qryPC: TwwQuery;
    pprPcINSSSint: TppReport;
    ppParameterList2: TppParameterList;
    ppPcINSSSint: TppBDEPipeline;
    dsPcINSSSint: TwwDataSource;
    qryPcINSSSint: TwwQuery;
    updPcINSSSsint: TUpdateSQL;
    updPcINSSAnal: TUpdateSQL;
    qryPcINSSAnal_old: TwwQuery;
    qryPcINSSAnal_oldIDPESSOA: TFloatField;
    qryPcINSSAnal_oldESPECIE: TStringField;
    qryPcINSSAnal_oldVALORREEMBOLSO: TFloatField;
    qryPcINSSAnal_oldDESCRICAO: TStringField;
    qryPcINSSAnal_oldVALORDESEMBOLSO: TFloatField;
    qryPcINSSAnal_oldDATAPAGAMENTO: TDateTimeField;
    qryPcINSSAnal_oldVALORDIFERENCA: TFloatField;
    dsPcINSSAnal: TwwDataSource;
    ppdPcINSSAnal: TppDesigner;
    ppdPcINSSSint: TppDesigner;
    updPcINSSSEnvio: TUpdateSQL;
    qryPcINSSEnvio: TwwQuery;
    dsPcINSSEnvio: TwwDataSource;
    ppPcINSSEnvio: TppBDEPipeline;
    pprPcINSSEnvio: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel9: TppLabel;
    ppLine1: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLabel15: TppLabel;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppParameterList3: TppParameterList;
    ppdPcINSSEnvio: TppDesigner;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppLabel14: TppLabel;
    ppLabel24: TppLabel;
    ppShape3: TppShape;
    ppLabel25: TppLabel;
    ppShape4: TppShape;
    ppLabel26: TppLabel;
    ppShape5: TppShape;
    ppLabel16: TppLabel;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppShape9: TppShape;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppShape10: TppShape;
    ppLabel27: TppLabel;
    ppShape11: TppShape;
    ppLabel28: TppLabel;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppMemo1: TppMemo;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppShape14: TppShape;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppShape15: TppShape;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    pprPcINSSDet: TppReport;
    ppHeaderBand20: TppHeaderBand;
    ppShape24: TppShape;
    ppLabel276: TppLabel;
    ppLine90: TppLine;
    ppLabel279: TppLabel;
    ppLabel280: TppLabel;
    ppLabel284: TppLabel;
    ppDBText294: TppDBText;
    ppLine92: TppLine;
    ppLabel290: TppLabel;
    ppLabel275: TppLabel;
    ppLabel314: TppLabel;
    ppLabel315: TppLabel;
    ppLabel316: TppLabel;
    ppLabel317: TppLabel;
    ppLabel318: TppLabel;
    ppLabel281: TppLabel;
    ppLabel289: TppLabel;
    ppLabel293: TppLabel;
    ppLabel319: TppLabel;
    ppLabel321: TppLabel;
    ppShape29: TppShape;
    ppLabel285: TppLabel;
    ppShape27: TppShape;
    ppLabel286: TppLabel;
    ppShape30: TppShape;
    ppLabel288: TppLabel;
    ppShape31: TppShape;
    ppLabel291: TppLabel;
    ppShape32: TppShape;
    ppLabel292: TppLabel;
    ppShape35: TppShape;
    ppLabel287: TppLabel;
    ppShape37: TppShape;
    ppLabel294: TppLabel;
    ppShape38: TppShape;
    ppLabel295: TppLabel;
    ppShape39: TppShape;
    ppLabel296: TppLabel;
    ppShape40: TppShape;
    ppLabel297: TppLabel;
    ppShape41: TppShape;
    ppLabel298: TppLabel;
    ppShape42: TppShape;
    ppLabel299: TppLabel;
    ppShape43: TppShape;
    ppLabel300: TppLabel;
    ppShape44: TppShape;
    ppLabel301: TppLabel;
    ppShape45: TppShape;
    ppLabel302: TppLabel;
    ppShape46: TppShape;
    ppLabel303: TppLabel;
    ppDetailBand21: TppDetailBand;
    ppShape47: TppShape;
    ppDBText313: TppDBText;
    ppShape48: TppShape;
    ppDBText286: TppDBText;
    ppShape49: TppShape;
    ppShape50: TppShape;
    ppShape51: TppShape;
    ppShape52: TppShape;
    ppShape53: TppShape;
    ppShape54: TppShape;
    ppShape55: TppShape;
    ppShape56: TppShape;
    ppShape57: TppShape;
    ppDBText287: TppDBText;
    ppDBText288: TppDBText;
    ppDBText289: TppDBText;
    ppDBText291: TppDBText;
    ppDBText292: TppDBText;
    ppDBText290: TppDBText;
    ppFooterBand20: TppFooterBand;
    ppLine99: TppLine;
    ppLabel305: TppLabel;
    ppSystemVariable35: TppSystemVariable;
    ppSystemVariable36: TppSystemVariable;
    ppSummaryBand18: TppSummaryBand;
    ppParameterList1: TppParameterList;
    pprPcINSSAnal: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape16: TppShape;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppDBText16: TppDBText;
    ppLine4: TppLine;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    pplblAnexo: TppLabel;
    ppLabel46: TppLabel;
    pplblTitulo1: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppShape17: TppShape;
    ppLabel55: TppLabel;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppLabel57: TppLabel;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppLabel60: TppLabel;
    ppShape23: TppShape;
    ppLabel61: TppLabel;
    ppShape25: TppShape;
    ppLabel62: TppLabel;
    ppShape26: TppShape;
    ppLabel63: TppLabel;
    ppShape28: TppShape;
    ppLabel64: TppLabel;
    ppShape33: TppShape;
    ppLabel65: TppLabel;
    ppShape34: TppShape;
    ppLabel66: TppLabel;
    ppShape36: TppShape;
    ppLabel67: TppLabel;
    ppShape58: TppShape;
    ppLabel68: TppLabel;
    ppShape59: TppShape;
    ppLabel69: TppLabel;
    ppShape60: TppShape;
    ppLabel70: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape61: TppShape;
    ppDBText17: TppDBText;
    ppShape62: TppShape;
    ppDBText18: TppDBText;
    ppShape63: TppShape;
    ppShape64: TppShape;
    ppShape65: TppShape;
    ppShape66: TppShape;
    ppShape67: TppShape;
    ppShape68: TppShape;
    ppShape69: TppShape;
    ppShape70: TppShape;
    ppShape71: TppShape;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable3: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppParameterList4: TppParameterList;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppBndTotalSinonimo: TppGroupFooterBand;
    edtCPFResponsavel: TMaskEdit;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppDBText3: TppDBText;
    daDataModule2: TdaDataModule;
    ppDBText4: TppDBText;
    ppLabel76: TppLabel;
    bbtnEfetivar: TBitBtn;
    dsPcINSSAnalTB: TwwDataSource;
    ppPcINSSAnalTB: TppBDEPipeline;
    ppdPcINSSAnalTB: TppDesigner;
    updPcINSSSsintTB: TUpdateSQL;
    qryPcINSSSintTB: TwwQuery;
    dsPcINSSSintTB: TwwDataSource;
    ppPcINSSSintTB: TppBDEPipeline;
    ppdPcINSSSintTB: TppDesigner;
    pprPcINSSAnalTB2: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel77: TppLabel;
    ppLine6: TppLine;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppShape72: TppShape;
    ppDBText13: TppDBText;
    ppShape73: TppShape;
    ppDBText14: TppDBText;
    ppShape74: TppShape;
    ppShape75: TppShape;
    ppShape76: TppShape;
    ppShape77: TppShape;
    ppShape78: TppShape;
    ppShape79: TppShape;
    ppShape80: TppShape;
    ppShape81: TppShape;
    ppShape82: TppShape;
    ppDBText15: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine7: TppLine;
    ppLabel82: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppDBText41: TppDBText;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLine8: TppLine;
    ppShape83: TppShape;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppShape84: TppShape;
    ppLabel94: TppLabel;
    ppShape85: TppShape;
    ppLabel95: TppLabel;
    ppShape86: TppShape;
    ppLabel96: TppLabel;
    ppShape87: TppShape;
    ppLabel97: TppLabel;
    ppShape88: TppShape;
    ppLabel98: TppLabel;
    ppShape89: TppShape;
    ppLabel99: TppLabel;
    ppShape90: TppShape;
    ppLabel100: TppLabel;
    ppShape91: TppShape;
    ppLabel101: TppLabel;
    ppShape92: TppShape;
    ppLabel102: TppLabel;
    ppShape93: TppShape;
    ppLabel103: TppLabel;
    ppShape94: TppShape;
    ppLabel104: TppLabel;
    ppShape95: TppShape;
    ppLabel105: TppLabel;
    ppShape96: TppShape;
    ppLabel106: TppLabel;
    ppShape97: TppShape;
    ppLabel107: TppLabel;
    ppShape98: TppShape;
    ppLabel108: TppLabel;
    ppShape99: TppShape;
    ppLabel109: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    raCodeModule3: TraCodeModule;
    ppParameterList5: TppParameterList;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLine11: TppLine;
    ppLabel127: TppLabel;
    ppDBText53: TppDBText;
    ppDBText55: TppDBText;
    qryPcINSSAnal_oldDIFDESEMBOLSO: TFloatField;
    qryPcINSSAnal_oldDATAACERTO: TDateTimeField;
    qryPcINSSAnal_oldDS_JUSTIFICATIVA: TStringField;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    pnProcessando: TPanel;
    ProgressBar: TProgressBar;
    lbInformacao: TLabel;
    qryPCEnvio: TwwQuery;
    qryUpdArquivo: TwwQuery;
    qryInsArquivo: TwwQuery;
    memoCorpoEmail: TMemo;
    ppDBText58: TppDBText;
    ppRA_Competencia: TppDBText;
    qryPcINSSAnal_oldCENTRALIZADOR: TFloatField;
    ppLabel71: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppLabel131: TppLabel;
    lbTotalDesembolso: TppLabel;
    lbTotalReembolso: TppLabel;
    lbTotalGlosas: TppLabel;
    lbTotalDirerencas: TppLabel;
    ppdbCentral: TppDBText;
    pplblTitulo2: TppLabel;
    qryPcINSSAnal_oldSINONIMO: TStringField;
    qryPcINSSAnal_oldVALORREEMBOLSOF: TStringField;
    qryPcINSSAnal_oldVALORDESEMBOLSOF: TStringField;
    qryPcINSSAnal_oldVALORDIFERENCAF: TStringField;
    qryPcINSSAnal_oldDIFDESEMBOLSOF: TStringField;
    qryPcINSSAnal_oldNUMPROCINSS: TStringField;
    qryPcINSSAnal_oldNUMDOCUMENTO: TStringField;
    qryPcINSSAnal_oldMESREFERENCIA: TStringField;
    pprPcINSSAnalTB: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppShape100: TppShape;
    ppDBText61: TppDBText;
    ppShape101: TppShape;
    ppDBText62: TppDBText;
    ppShape102: TppShape;
    ppShape103: TppShape;
    ppShape104: TppShape;
    ppShape105: TppShape;
    ppShape106: TppShape;
    ppShape107: TppShape;
    ppShape108: TppShape;
    ppShape109: TppShape;
    ppShape110: TppShape;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand5: TppSummaryBand;
    ppLabel137: TppLabel;
    ppLabel138: TppLabel;
    ppLabel139: TppLabel;
    ppLabel140: TppLabel;
    lbTotalReembolsoTB: TppLabel;
    lbTotalDesembolsoTB: TppLabel;
    lbTotalDirerencasTB: TppLabel;
    lbTotalGlosasTB: TppLabel;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppLabel145: TppLabel;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    ppDBText72: TppDBText;
    ppLabel148: TppLabel;
    ppLabel149: TppLabel;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    ppLabel152: TppLabel;
    ppLabel153: TppLabel;
    ppLine3: TppLine;
    ppShape111: TppShape;
    ppLabel154: TppLabel;
    ppLabel155: TppLabel;
    ppShape112: TppShape;
    ppLabel156: TppLabel;
    ppShape113: TppShape;
    ppLabel157: TppLabel;
    ppShape114: TppShape;
    ppLabel158: TppLabel;
    ppShape115: TppShape;
    ppLabel159: TppLabel;
    ppShape116: TppShape;
    ppLabel160: TppLabel;
    ppShape117: TppShape;
    ppLabel161: TppLabel;
    ppShape118: TppShape;
    ppLabel162: TppLabel;
    ppShape119: TppShape;
    ppLabel163: TppLabel;
    ppShape120: TppShape;
    ppLabel164: TppLabel;
    ppShape121: TppShape;
    ppLabel165: TppLabel;
    ppShape122: TppShape;
    ppLabel166: TppLabel;
    ppShape123: TppShape;
    ppLabel167: TppLabel;
    ppShape124: TppShape;
    ppLabel168: TppLabel;
    ppShape125: TppShape;
    ppLabel169: TppLabel;
    ppShape126: TppShape;
    ppLabel170: TppLabel;
    ppShape127: TppShape;
    ppLabel171: TppLabel;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppLabel172: TppLabel;
    ppDBText75: TppDBText;
    ppLabel173: TppLabel;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppParameterList7: TppParameterList;
    Label9: TLabel;
    Label10: TLabel;
    qryPcINSSAnalTB_old: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    qryPcINSSAnalTB_oldVALORREEMBOLSO: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    DateTimeField3: TDateTimeField;
    StringField3: TStringField;
    FloatField10: TFloatField;
    StringField4: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    updPcINSSAnalTB: TUpdateSQL;
    qryPcINSSAnalTB_oldNOME_BENEFICIO: TStringField;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppBndTotalUFxBenef: TppGroupFooterBand;
    ppLabel174: TppLabel;
    ppDBText76: TppDBText;
    qryPcINSSAnal_oldVALORACERTO: TFloatField;
    qryPcINSSAnal_oldVALORACERTOF: TStringField;
    qryPcINSSAnalTB_oldVALORACERTO: TFloatField;
    qryPcINSSAnalTB_oldVALORACERTOF: TStringField;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    qryPcINSSEnvioTodos: TwwQuery;
    updPcINSSSEnvioTodos: TUpdateSQL;
    ppHeaderBand21: TppHeaderBand;
    ppLabel304: TppLabel;
    ppLabel310: TppLabel;
    ppLabel311: TppLabel;
    ppLabel312: TppLabel;
    ppLabel313: TppLabel;
    ppDetailBand22: TppDetailBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppFooterBand21: TppFooterBand;
    ppLine94: TppLine;
    ppSystemVariable37: TppSystemVariable;
    ppSummaryBand19: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel308: TppLabel;
    ppShape128: TppShape;
    ppGroupFooterBand2: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    ppShape129: TppShape;
    ppShape130: TppShape;
    ppShape131: TppShape;
    ppShape132: TppShape;
    ppShape133: TppShape;
    ppShape134: TppShape;
    ppShape135: TppShape;
    ppLabel23: TppLabel;
    ppShape136: TppShape;
    ppShape137: TppShape;
    ppShape138: TppShape;
    ppShape139: TppShape;
    ppShape140: TppShape;
    ppShape141: TppShape;
    ppShape142: TppShape;
    ppShape143: TppShape;
    ppShape144: TppShape;
    ppShape145: TppShape;
    ppShape146: TppShape;
    ppLabel7: TppLabel;
    ppShape147: TppShape;
    qryPcINSSEnvioSINONIMO: TStringField;
    qryPcINSSEnvioCENTRALIZADOR: TStringField;
    qryPcINSSEnvioMESCOMPETENCIA: TStringField;
    qryPcINSSEnvioANOCOMPETENCIA: TStringField;
    qryPcINSSEnvioDSDATAASSINATURA: TStringField;
    qryPcINSSEnvioNOMEARQUIVO: TStringField;
    qryPcINSSEnvioNOMERESPONSAVEL: TStringField;
    qryPcINSSEnvioCPFRESPONSAVEL: TStringField;
    qryPcINSSEnvioCARGORESPONSAVEL: TStringField;
    qryPcINSSEnvioTodosSINONIMO: TStringField;
    qryPcINSSEnvioTodosCENTRALIZADOR: TStringField;
    qryPcINSSEnvioTodosMESCOMPETENCIA: TStringField;
    qryPcINSSEnvioTodosANOCOMPETENCIA: TStringField;
    qryPcINSSEnvioTodosDSDATAASSINATURA: TStringField;
    qryPcINSSEnvioTodosNOMEARQUIVO: TStringField;
    qryPcINSSEnvioTodosNOMERESPONSAVEL: TStringField;
    qryPcINSSEnvioTodosCPFRESPONSAVEL: TStringField;
    qryPcINSSEnvioTodosCARGORESPONSAVEL: TStringField;
    pprPcINSSSintTB: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel141: TppLabel;
    ppLabel142: TppLabel;
    ppLabel143: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppShape148: TppShape;
    ppShape149: TppShape;
    ppShape150: TppShape;
    ppShape151: TppShape;
    ppShape152: TppShape;
    ppShape153: TppShape;
    ppShape154: TppShape;
    ppShape155: TppShape;
    ppShape156: TppShape;
    ppShape157: TppShape;
    ppDBText35: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSummaryBand6: TppSummaryBand;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppShape158: TppShape;
    ppShape159: TppShape;
    ppShape160: TppShape;
    ppLabel144: TppLabel;
    ppShape161: TppShape;
    ppShape162: TppShape;
    ppShape163: TppShape;
    ppShape164: TppShape;
    ppShape165: TppShape;
    ppShape166: TppShape;
    ppLabel175: TppLabel;
    ppLabel176: TppLabel;
    ppLabel177: TppLabel;
    ppLabel178: TppLabel;
    ppLabel179: TppLabel;
    ppLabel180: TppLabel;
    ppLabel181: TppLabel;
    ppLabel182: TppLabel;
    ppShape167: TppShape;
    ppLabel183: TppLabel;
    ppGroupFooterBand10: TppGroupFooterBand;
    raCodeModule2: TraCodeModule;
    ppParameterList8: TppParameterList;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppLabel184: TppLabel;
    ppDBText87: TppDBText;
    ppLabel56: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    qryPcINSSSintMESCOMPETENCIA: TStringField;
    qryPcINSSSintSINONIMO: TStringField;
    qryPcINSSSintUF: TStringField;
    qryPcINSSSintDATAENVIO: TDateTimeField;
    qryPcINSSSintEXECUTOR: TStringField;
    qryPcINSSSintCENTRALIZADOR: TStringField;
    qryPcINSSSintVALORREEMBOLSADO: TStringField;
    qryPcINSSSintVALORDESEMBOLSADO: TStringField;
    qryPcINSSSintVALORGLOSADO: TStringField;
    qryPcINSSSintVALORDIFERENCA: TStringField;
    qryPcINSSSintAGRUPADOR: TFloatField;
    qryPcINSSSintTBMESCOMPETENCIA: TStringField;
    qryPcINSSSintTBNOME_BENEFICIO: TStringField;
    qryPcINSSSintTBSINONIMO: TStringField;
    qryPcINSSSintTBUF: TStringField;
    qryPcINSSSintTBDATAENVIO: TDateTimeField;
    qryPcINSSSintTBEXECUTOR: TStringField;
    qryPcINSSSintTBCENTRALIZADOR: TStringField;
    qryPcINSSSintTBVALORREEMBOLSADO: TStringField;
    qryPcINSSSintTBVALORDESEMBOLSADO: TStringField;
    qryPcINSSSintTBVALORGLOSADO: TStringField;
    qryPcINSSSintTBVALORDIFERENCA: TStringField;
    qryPcINSSSintTBAGRUPADOR: TFloatField;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    lbTotalDirerencasSint: TppLabel;
    lbTotalGlosasSint: TppLabel;
    lbTotalReembolsoSint: TppLabel;
    lbTotalDesembolsoSint: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    lbTotalDirerencasSintTB: TppLabel;
    lbTotalGlosasSintTB: TppLabel;
    lbTotalReembolsoSintTB: TppLabel;
    lbTotalDesembolsoSintTB: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    qryPcINSSAnal_oldVALORGLOSADO: TFloatField;
    qryPcINSSAnal_oldTOTALDESEMBOLSO: TFloatField;
    ppPcINSSAnal: TppBDEPipeline;
    ppLine5: TppLine;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLine9: TppLine;
    qryPcINSSAnalTB_oldVALORGLOSADO: TFloatField;
    qryPcINSSAnalTB_oldVALORDESEMBOLSOACERTOS: TFloatField;
    qryPcINSSAnal: TCMClientDataSet;
    chkSomenteRel: TCheckBox;
    lstNB: TMemo;
    qryPcINSSAnalTB: TCMClientDataSet;
    Label11: TLabel;
    edtEmailResponsa: TEdit;
    qryPcINSSEnvioVALORREEMBOLSADO: TStringField;
    qryPcINSSEnvioVALORDESEMBOLSADO: TStringField;
    qryPcINSSEnvioVALORGLOSADO: TStringField;
    qryPcINSSEnvioVALORDIFERENCA: TStringField;
    qryPcINSSEnvioTodosVALORREEMBOLSADO: TStringField;
    qryPcINSSEnvioTodosVALORDESEMBOLSADO: TStringField;
    qryPcINSSEnvioTodosVALORGLOSADO: TStringField;
    qryPcINSSEnvioTodosVALORDIFERENCA: TStringField;
    pprPcINSSFinal: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppLabel126: TppLabel;
    ppLabel128: TppLabel;
    ppLabel185: TppLabel;
    ppLabel186: TppLabel;
    ppLabel187: TppLabel;
    ppLabel188: TppLabel;
    ppLabel189: TppLabel;
    ppLabel190: TppLabel;
    ppLabel191: TppLabel;
    ppLine10: TppLine;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppLabel192: TppLabel;
    ppLabel193: TppLabel;
    ppLabel194: TppLabel;
    ppLabel195: TppLabel;
    ppLabel196: TppLabel;
    ppLabel197: TppLabel;
    ppPcINSSFinal: TppBDEPipeline;
    dsPcINSSFinal: TwwDataSource;
    qryPcINSSFinal: TwwQuery;
    cdsPcINSSFinal: TCMClientDataSet;
    bbtnGerarArqFinal: TBitBtn;
    ppDBText45: TppDBText;
    qryBenef: TwwQuery;
    qryJustifica: TwwQuery;
    ppLabel198: TppLabel;
    qryPcINSSFinalSIGLA: TStringField;
    qryPcINSSFinalSINONIMO: TStringField;
    qryPcINSSFinalCENTRALIZADOR: TStringField;
    qryPcINSSFinalMESCOMPETENCIA: TStringField;
    qryPcINSSFinalORDEM: TFloatField;
    qryPcINSSFinalPERIODOINI: TStringField;
    qryPcINSSFinalPERIODOFIM: TStringField;
    qryPcINSSFinalVLRREEMBOLSO: TFloatField;
    qryPcINSSFinalDATARECEBIMENTO: TDateTimeField;
    qryPcINSSFinalVLRDESEMBOLSO: TFloatField;
    qryPcINSSFinalDATAPAGAMENTO: TDateTimeField;
    qryPcINSSFinalVLRDIFERENCA: TFloatField;
    qryPcINSSFinalVLR_INDICACAO: TStringField;
    qryPcINSSFinalVLR_INDICACAO_C: TFloatField;
    qryPcINSSFinalVLR_INDICACAO_M: TFloatField;
    qryPcINSSFinalVLR_INDICACAO_P: TFloatField;
    qryPcINSSFinalANOCOMPETENCIA: TStringField;
    qryPcINSSFinalNOMERESPONSAVEL: TStringField;
    qryPcINSSFinalCPFRESPONSAVEL: TStringField;
    qryPcINSSFinalCARGORESPONSAVEL: TStringField;
    qryPcINSSFinalNOME_ARQUIVO: TStringField;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppShape168: TppShape;
    ppShape169: TppShape;
    ppShape170: TppShape;
    ppShape171: TppShape;
    ppShape172: TppShape;
    ppShape173: TppShape;
    ppLabel199: TppLabel;
    ppLabel200: TppLabel;
    ppLabel201: TppLabel;
    ppLabel203: TppLabel;
    ppLabel204: TppLabel;
    ppLabel205: TppLabel;
    ppShape174: TppShape;
    ppLabel202: TppLabel;
    ppShape175: TppShape;
    ppLabel206: TppLabel;
    ppLabel207: TppLabel;
    ppShape176: TppShape;
    ppShape177: TppShape;
    ppLabel208: TppLabel;
    ppShape178: TppShape;
    ppShape179: TppShape;
    ppShape180: TppShape;
    ppShape182: TppShape;
    ppShape183: TppShape;
    ppShape184: TppShape;
    ppShape185: TppShape;
    ppShape186: TppShape;
    ppShape187: TppShape;
    ppShape188: TppShape;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText54: TppDBText;
    qryPcINSSFinalJUSTIFICATIVA: TStringField;
    qryPcINSSFinalNUMPROCINSS: TStringField;
    ppLabel209: TppLabel;
    ppLabel210: TppLabel;
    ppLabel212: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppSystemVariable2: TppSystemVariable;
    ppLabel211: TppLabel;
    ppDBText89: TppDBText;
    qryPcINSSFinalDSDATAASSINATURA: TStringField;
    ppLabel213: TppLabel;
    ppDBText46: TppDBText;
    ppLine12: TppLine;
    ppdPcINSSFinal: TppDesigner;
    qryPcINSSFinalDATAINI: TStringField;
    qryPcINSSFinalDATAFIM: TStringField;
    ppDBText90: TppDBText;
    ppLabel216: TppLabel;
    ppDBText91: TppDBText;
    qryPcINSSFinalORIGEM: TStringField;
    ppDBText92: TppDBText;
    qryPcINSSFinalCODSINONIMO: TStringField;
    qryPcINSSFinalNOMEESTADO: TStringField;
    ppDBText59: TppDBText;
    ppDBText93: TppDBText;
    ppDBText60: TppDBText;
    ppDBText88: TppDBText;
    ppDBText94: TppDBText;
    ppLabel45: TppLabel;
    ppLabel47: TppLabel;
    ppLabel132: TppLabel;
    ppLabel214: TppLabel;
    qryPcINSSEnvioUF: TStringField;
    ppDBText77: TppDBText;
    bbtnRetificar: TBitBtn;
    GroupBox1: TGroupBox;
    rbOpcRelPreviaSIM: TRadioButton;
    rbOpcRelEfetivacaoSIM: TRadioButton;
    rbOpcRelRetificadoSIM: TRadioButton;
    rbOpcRelFinal: TRadioButton;
    ppLblSinonimo: TppLabel;
    procedure cmb_mesInicioChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnGerarArquivoClick(Sender: TObject);
    procedure bbtnEnviarClick(Sender: TObject);
    procedure bbtnEfetivarClick(Sender: TObject);
    procedure bbtnRetificarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure ppDBText20GetText(Sender: TObject; var Text: String);
    procedure ppDBCalc2GetText(Sender: TObject; var Text: String);
    procedure bbtnGerarArqFinalClick(Sender: TObject);
    procedure rbOpcRelFinalClick(Sender: TObject);
    procedure spn_anoInicioChange(Sender: TObject);
    procedure ppLblSinonimoPrint(Sender: TObject);
  private
    { Private declarations }
    sAnoMesInicio, sAnoMesFinal : String;
    sArquivoAnalitico, sArquivoSintetico, sNomeArquivoRecibo, sMesAnoEnvio, sSinonimoEnvio, sMotivoRetificacao: String;
    bPrestacaoContasGerada, bPrestacaoContasPrevia, bPrestacaoContasEfetivacao, bArquivoINSSGerado, bPrestacaoContasEfetivada, bArquivoINSSEnviado: boolean;
    bCancelarOperacao : boolean;

    bPrestacaoRetificada : boolean;        //edilaine - SIG78760

    function PegaAnoMesRef(acbMes : tcombobox; aspAno : tspinedit) : string;

    procedure consultarOrgaosINSS();

    function retornaPeriodoAtual() : String;
    function retornaDataHoraComporNomeArquivo() : String;


    {GERAÇÃO DA PRESTAÇÃO DE CONTAS}
    procedure verificaStatusPrestacaoContas(sMesAnoInicio, sMesAnoFinal: String);

    function verificaFoiGeradaPrestacaoContasPrevia(sMesAnoInicio, sMesAnoFinal: String): boolean;

    procedure apagarPrestacaoContas(sMesAnoInicio, sMesAnoFinal: String);

    procedure inserirPrestacaoContas(sSigla, sCodOrgao, sSinonimo, sEspecie, sMesRef: String;
                                     fVlrReembolsado, fVlrDesembolsado, fVlrGlosado, fVlrDifDesembolso, fVlrAcertoDesembolso, fVlrDiferenca: Real;
                                     sDsValoresNaoPagos, sIdPessoa, sNome, sNumDocumento, sNumBeneficio: String;
                                     idBeneficio: Integer;
                                     sDescricao, sDataPagamento, sDataAcerto, sFlgPrestacaoEfetivada, sNomeResponsavel, sCPFResponsabel, sCargoResponsavel, sFlgPrevia, sFlgEfetivada, flgTipoBeneficio, sTipoBeneficio: String;
                                     sFlgRetificada, sMotivoRetificacao: String);

    procedure gerarPrestacaoContas(tPrestacaoContas:TTipoPrestacaoContas; sMesInicio, sMesFinal : String; bRetificacao: boolean = False);

    procedure consultarPrestacaoContasDesembolso(sMesAnoInicio, sMesAnoFinal: String);

    function retornaTotalRegistrosPrestacaoContas(sMesAnoInicio, sMesAnoFinal: String): Integer;

    function retornaValorDesembolsoPrevia(sNumProcINSS, sMesRef: String; var sDtPagamento: String): real;
    function retornaValorAcertoDesembolsoPrevia(sNumProcINSS, sMesRef: String; var sDtAcerto: String): real;
    function retornaValorGlosa(sMesRef,sNumProcINSS: String): real;

    function retornaValorDesembolsoEfetivacao(sNumProcINSS, sMesRef: String; var sDtPagamento: String): real;
    function retornaValorAcertoDesembolsoEfetivacao(sNumProcINSS, sMesRef: String; var sDtAcerto: String): real;


    function retornaJustificativaDiferenca(): String;

    procedure consultarDadosPessoa(idPessoa: Integer; var sNome: String; var sNumDocumento: String);

    {GERAÇÃO DA ARQUIVOS DOS RELATÓRIOS DE PRESTAÇÃO DE CONTAS}
    procedure apagarArquivosGeradosNaoEfetivados(sMesAnoInicio, sMesAnoFinal: String);

    procedure gerarRelatorioAnalitico( bGeracaoEnvio: boolean = False);
    procedure consultarRelatorioAnalitico(sMesAnoInicio, sMesAnoFinal: String);
    procedure consultarRelatorioAnaliticoEnvio(sMesAno, sSinonimo: String);

    procedure gerarRelatorioSintetico( bGeracaoEnvio: boolean = False);
    procedure consultarRelatorioSintetico(sMesAnoInicio, sMesAnoFinal: String);
    procedure consultarRelatorioSinteticoEnvio(sMesAno, sSinonimo: String);


    procedure gerarRelatorioReciboUF();
    procedure gerarRelatorioReciboTodos(sNomeArquivo: String);

    procedure gerarRelatorioAnaliticoPorBeneficio();
    procedure consultarRelatorioAnaliticoPorBeneficio(sMesAnoInicio, sMesAnoFinal: String);

    procedure gerarRelatorioSinteticoPorBeneficio();
    procedure consultarRelatorioSinteticoPorBeneficio(sMesAnoInicio, sMesAnoFinal: String);


    {GERAÇÃO E ENVIO DE ARQUIVOS DE PRESTAÇÃO DE CONTAS INSS}
    procedure inserirEnvioPrestacaoContas(sSigla, sCodOrgao, sSinonimo, sMesRef: String;
                                          fVlrReembolsado, fVlrDesembolsado, fVlrGlosado, fVlrDiferenca: Real;
                                          sFlgPrestacaoEfetivada, sFlgEmailEnviado, sFlgPrestacaoRetificada, sNomeResponsavel,sCPFResponsabel,sCargoResponsavel: String);

    procedure atualizarArquivosEnvioPrestacaoContas(sSigla, sCodOrgao, sSinonimo, sMesRef: String);

    procedure InserirArquivoEnvioPrestacaoContas(idArquivo, iTipoArquivo: Integer; sNomeArquivo: String);

    function retornaProximoValorIdArquivo(): Integer;

    procedure gerarArquivoEnvioINSS();
    procedure consultarRelatorioArquivoEnvioINSS(sSinonimo, sMesAnoInicio, sMesAnoFinal: String);
    procedure gerarArquivoINSSeEnviarEmail();
    procedure consultarArquivosGeradosParaEnvioINSS(sSinonimo, sMesAnoInicio, sMesAnoFinal: String);
    function  verificaExistePrestacaoContasEnviadaMesmoValor(sSinonimo, sMesAno: String; fVlrReembolsado, fVlrDesembolsado, fVlrGlosado: Real ): Boolean;
    procedure consultaTextoEmailUF(sUF, sMesReferencia: String);
    function  retornaPathArquivo(idArquivo: Integer; sMesReferencia: String): String;
    procedure enviarEmailOutlook(sDestinatario, sAssunto, sAnexo: String);
    procedure marcarArquivoEnviadoINSS(sUF, sMesAno, sSinonimo : String);             //edilaine - SIG78760

    function  retornaDescMesReferencia(sMesReferencia: String): String;

    //edilaine - SIG78760 - inicio
    function  RetornarEmailUsuario(bEmailTeste : boolean) : string;
    function  ValidaEMail(const EMailIn : String) : Boolean;
    function  retornaJustificativaOutras(sNumProcInss : string) : String;
    function  retornaDataRecebimento(sDataPagamento : string) : string;
    function  verificaMesesPrestacaoContas(sMesAnoInicio, sMesAnoFinal: String; var lstMesFalta : string) : boolean;
    function  GetDadosEstado(sSinonimo : string; bSiglaNome : boolean = true) : string;
    function  consultarRelatorioAnaliticoEnvioDiferenca(sMesInicio, sMesFinal, sSinonimo: String) : string;

    procedure recuperaResponsavel;

    procedure gerarArquivoFinalEnvioINSS;
    procedure gerarRelatorioDiferencas(sSinonimo : string);
    procedure consultarRelatorioArquivoFinalEnvioINSS(tipoConsulta : TTipoConsultaFinal;
                                                      sSinonimo, sMesAnoInicio, sMesAnoFinal : String);
    procedure gerarRelatorioFinalTodos(sNomeArquivo: String);
    procedure RegistraLancamentosParaRetificar(Operacao : TOpRetifica; sMesInicio, sMesFinal, sMotivo : string; var iIdRetifica : integer);
    procedure gerarRelatorioPrestacaoContas;
    //edilaine - SIG78760 - fim

    {EFETIVAÇÃO DA PRESTAÇÃO DE CONTAS INSS}
    procedure efetivarPrestacaoContas();

    {RETIFICAÇÃO DA PRESTAÇÃO DE CONTAS INSS}
    procedure retificarPrestacaoContas();
    procedure marcarEnvioPrestacoesContasComoRetificadas(sMesAnoInicio, sMesAnoFinal: String);


    function Mascara(edt: String;str:String):string;
    function formataNumBeneficio(num: String):string;
    function formataNumCPF(num: String):string;

  public
    { Public declarations }
  end;

var
  frmPrestacaoContasINSS: TfrmPrestacaoContasINSS;

implementation

{$R *.DFM}

uses USistema, UdataBase, UmensErro, UAdmPrev, DBaseDados,
     comobj, olectrls, FPrestacaoContasINSSMotivo,
     uCtrlPadroes, FPreviewExport;  //edilaine - SIG78760


{ TfrmPrestacaoContasINSS }

procedure TfrmPrestacaoContasINSS.inserirEnvioPrestacaoContas(sSigla, sCodOrgao, sSinonimo, sMesRef: String;
  fVlrReembolsado, fVlrDesembolsado, fVlrGlosado, fVlrDiferenca: Real;
  sFlgPrestacaoEfetivada, sFlgEmailEnviado, sFlgPrestacaoRetificada,
  sNomeResponsavel, sCPFResponsabel, sCargoResponsavel: String);
var sSql : String;
begin
  Try

    sSql :=  ' INSERT INTO ENVIOPRESTACAOCONTASINSS  '
          +  ' (                                     '
          +  '   SIGLA                               '
          +  '  ,CODORGAOLOCAL                       '
          +  '  ,SINONIMO                            '
          +  '  ,MESREFERENCIA                       '
          +  '  ,TOTALREEMBOLSADO                    '
          +  '  ,TOTALDESEMBOLSADO                   '
          +  '  ,TOTALGLOSADO                        '
          +  '  ,DIFERENCA                           '
          +  '  ,PRESTACAOCONTASEFETIVADA            '
          +  '  ,FLGEMAILENVIADO                     '
          +  '  ,FLGPRESTACAORETIFICADA              '
          +  '  ,NOMERESPONSAVEL                     '
          +  '  ,CPFRESPONSAVEL                      '
          +  '  ,CARGORESPONSAVEL                    '
          +  ' )                                     '
          +  ' VALUES                                '
          +  ' (                                     '
          +  '   :SIGLA                              '
          +  '  ,:CODORGAOLOCAL                      '
          +  '  ,:SINONIMO                           '
          +  '  ,:MESREFERENCIA                      '
          +  '  ,:TOTALREEMBOLSADO                   '
          +  '  ,:TOTALDESEMBOLSADO                  '
          +  '  ,:TOTALGLOSADO                       '
          +  '  ,:DIFERENCA                          '
          +  '  ,:PRESTACAOCONTASEFETIVADA           '
          +  '  ,:FLGEMAILENVIADO                    '
          +  '  ,:FLGPRESTACAORETIFICADA             '
          +  '  ,:NOMERESPONSAVEL                    '
          +  '  ,:CPFRESPONSAVEL                     '
          +  '  ,:CARGORESPONSAVEL                   '
          +  ' )                                     ';

    qryAux.sql.Text := ssql;

    qryAux.ParamByName('SIGLA').AsString            := Trim(sSigla);
    qryAux.ParamByName('CODORGAOLOCAL').AsString    := Trim(sCodOrgao);
    qryAux.ParamByName('SINONIMO').AsString         := Trim(sSinonimo);
    qryAux.ParamByName('MESREFERENCIA').AsString    := Trim(sMesRef);
    qryAux.ParamByName('TOTALREEMBOLSADO').AsFloat  := fVlrReembolsado;
    qryAux.ParamByName('TOTALDESEMBOLSADO').AsFloat := fVlrDesembolsado;
    qryAux.ParamByName('TOTALGLOSADO').AsFloat      := fVlrGlosado;
    qryAux.ParamByName('DIFERENCA').AsFloat         := fVlrDiferenca;
    qryAux.ParamByName('PRESTACAOCONTASEFETIVADA').AsString  := sFlgPrestacaoEfetivada;
    qryAux.ParamByName('FLGEMAILENVIADO').AsString           := sFlgEmailEnviado;
    qryAux.ParamByName('FLGPRESTACAORETIFICADA').AsString    := sFlgPrestacaoRetificada;
    qryAux.ParamByName('NOMERESPONSAVEL').AsString  := sNomeResponsavel;
    qryAux.ParamByName('CPFRESPONSAVEL').AsString   := sCPFResponsabel;
    qryAux.ParamByName('CARGORESPONSAVEL').AsString := sCargoResponsavel;

    qryAux.ExecSQL;

  Except
    on e:Exception do
     begin
//         showmessage(e.Message );
       raise;
     end;
  end;

end;

procedure TfrmPrestacaoContasINSS.inserirPrestacaoContas(sSigla, sCodOrgao, sSinonimo, sEspecie, sMesRef: String;
  fVlrReembolsado, fVlrDesembolsado, fVlrGlosado, fVlrDifDesembolso, fVlrAcertoDesembolso, fVlrDiferenca: Real;
  sDsValoresNaoPagos, sIdPessoa, sNome, sNumDocumento, sNumBeneficio: String;
  idBeneficio: Integer;
  sDescricao, sDataPagamento, sDataAcerto, sFlgPrestacaoEfetivada, sNomeResponsavel, sCPFResponsabel, sCargoResponsavel, sFlgPrevia, sFlgEfetivada, flgTipoBeneficio, sTipoBeneficio: String;
  sFlgRetificada, sMotivoRetificacao: String);
var sSql : String;
begin
  Try
    sSql :=  ' INSERT INTO CM.PRESTACAOCONTASINSS     '
          +  ' ( SIGLA                                '
          +  '  ,CODORGAOLOCAL                        '
          +  '  ,SINONIMO                             '
          +  '  ,ESPECIE                              '
          +  '  ,MESREFERENCIA                        '
          +  '  ,REEMBOLSADO                          '
          +  '  ,DESEMBOLSADO                         '
          +  '  ,GLOSADO                              '
          +  '  ,DIFERENCADESEMBOLSO                  '
          +  '  ,ACERTODESEMBOLSO                     '
          +  '  ,DIFERENCA                            '
          +  '  ,DS_VALORESNAOPAGO                   '
          +  '  ,IDPESSOA                             '
          +  '  ,NOME                                 '
          +  '  ,NUMDOCUMENTO                         '
          +  '  ,NUMEROBENEFICIO                      '
          +  '  ,IDBENEFICIO                          '
          +  '  ,DESCRICAO                            '
          +  '  ,DATAPAGAMENTO                        '
          +  '  ,DATAACERTO                           '
          +  '  ,PRESTACAOCONTASEFETIVADA             '
          +  '  ,NOMERESPONSAVEL                      '
          +  '  ,CPFRESPONSAVEL                       '
          +  '  ,CARGORESPONSAVEL                     '
          +  '  ,FLGPREVIA                            '
          +  '  ,FLGEFETIVADA                         '
          +  '  ,FLGTIPOBENEFICIO                     '
          +  '  ,TIPOBENEFICIO                        '
          +  '  ,FLGRETIFICADA                        '
          +  '  ,MOTIVORETIFICACAO                    '
          +  ' )                                      '
          +  ' VALUES                                 '
          +  ' ( :SIGLA                               '
          +  '  ,:CODORGAOLOCAL                       '
          +  '  ,:SINONIMO                            '
          +  '  ,:ESPECIE                             '
          +  '  ,:MESREFERENCIA                       '
          +  '  ,:REEMBOLSADO                         '
          +  '  ,:DESEMBOLSADO                        '
          +  '  ,:GLOSADO                             '
          +  '  ,:DIFERENCADESEMBOLSO                 '
          +  '  ,:ACERTODESEMBOLSO                    '
          +  '  ,:DIFERENCA                           '
          +  '  ,:DS_VALORESNAOPAGO                  '
          +  '  ,:IDPESSOA                            '
          +  '  ,:NOME                                '
          +  '  ,:NUMDOCUMENTO                        '
          +  '  ,:NUMEROBENEFICIO                     '
          +  '  ,:IDBENEFICIO                         '
          +  '  ,:DESCRICAO                           '
          +  '  ,:DATAPAGAMENTO                       '
          +  '  ,:DATAACERTO                          '
          +  '  ,:PRESTACAOCONTASEFETIVADA            '
          +  '  ,:NOMERESPONSAVEL                     '
          +  '  ,:CPFRESPONSAVEL                      '
          +  '  ,:CARGORESPONSAVEL                    '
          +  '  ,:FLGPREVIA                           '
          +  '  ,:FLGEFETIVADA                        '
          +  '  ,:FLGTIPOBENEFICIO                    '
          +  '  ,:TIPOBENEFICIO                       '
          +  '  ,:FLGRETIFICADA                       '
          +  '  ,:MOTIVORETIFICACAO                   '
          +  ' )                                      ';

    qryAux.sql.Text := ssql;

    Try
      FloatToStr( StrToFloat(sNumDocumento) );
    Except
      sNumDocumento := '';
    end;

    if sNome = '' then
      sNome := ' ';

    qryAux.ParamByName('SIGLA').AsString            := sSigla;
    qryAux.ParamByName('CODORGAOLOCAL').AsString    := sCodOrgao;
    qryAux.ParamByName('SINONIMO').AsString         := sSinonimo;
    qryAux.ParamByName('ESPECIE').AsString          := sEspecie;
    qryAux.ParamByName('MESREFERENCIA').AsString    := sMesRef;
    qryAux.ParamByName('REEMBOLSADO').AsFloat       := fVlrReembolsado;
    qryAux.ParamByName('DESEMBOLSADO').AsFloat      := fVlrDesembolsado;
    qryAux.ParamByName('GLOSADO').AsFloat           := fVlrGlosado;
    qryAux.ParamByName('DIFERENCADESEMBOLSO').AsFloat := fVlrDifDesembolso;
    qryAux.ParamByName('ACERTODESEMBOLSO').AsFloat    := fVlrAcertoDesembolso;
    qryAux.ParamByName('DIFERENCA').AsFloat           := fVlrDiferenca;
    qryAux.ParamByName('DS_VALORESNAOPAGO').AsString := sDsValoresNaoPagos;
    qryAux.ParamByName('IDPESSOA').AsString         := sIdPessoa;
    qryAux.ParamByName('NOME').AsString             := sNome;
    qryAux.ParamByName('NUMDOCUMENTO').AsString     := sNumDocumento;
    qryAux.ParamByName('NUMEROBENEFICIO').AsString  := sNumBeneficio;
    qryAux.ParamByName('IDBENEFICIO').AsInteger     := idBeneficio;
    qryAux.ParamByName('DESCRICAO').AsString        := sDescricao;
    qryAux.ParamByName('DATAPAGAMENTO').AsString    := sDataPagamento;
    qryAux.ParamByName('DATAACERTO').AsString       := sDataAcerto;
    qryAux.ParamByName('PRESTACAOCONTASEFETIVADA').AsString  := sFlgPrestacaoEfetivada;
    qryAux.ParamByName('NOMERESPONSAVEL').AsString  := sNomeResponsavel;
    qryAux.ParamByName('CPFRESPONSAVEL').AsString   := sCPFResponsabel;
    qryAux.ParamByName('CARGORESPONSAVEL').AsString := sCargoResponsavel;
    qryAux.ParamByName('FLGPREVIA').AsString        := sFlgPrevia;
    qryAux.ParamByName('FLGEFETIVADA').AsString     := sFlgEfetivada;
    qryAux.ParamByName('FLGTIPOBENEFICIO').AsString := sFlgEfetivada;
    qryAux.ParamByName('TIPOBENEFICIO').AsString    := sTipoBeneficio;

    qryAux.ParamByName('FLGRETIFICADA').AsString     := sFlgRetificada;
    qryAux.ParamByName('MOTIVORETIFICACAO').AsString := sMotivoRetificacao;

    qryAux.ExecSQL;

  Except
    on e:Exception do
     begin
//       showmessage(e.Message);
       raise;
     end;
  end;

end;

procedure TfrmPrestacaoContasINSS.cmb_mesInicioChange(Sender: TObject);
begin
  inherited;

  sAnoMesInicio := PegaAnoMesRef(cmb_mesInicio, spn_anoInicio);
  sAnoMesFinal  := PegaAnoMesRef(cmb_mesFinal, spn_anoFinal);

  //edilaine - SIG78760 - inicio
  rbOpcRelPreviaSIM.checked     := false;
  rbOpcRelEfetivacaoSIM.checked := false;
  rbOpcRelRetificadoSIM.checked := false;
  rbOpcRelFinal.checked         := false;
  //edilaine - SIG78760 - fim


  if (sAnoMesInicio <> '') {and (sAnoMesFinal <> '')} then        //edilaine - SIG78760
   begin
      rgTipoRelatorio.Enabled := True;
      gbResponsavel.Enabled   := True;

      //edilaine - SIG78760 - inicio
      chkSomenteRel.Checked   := false;

      recuperaResponsavel();
      //edilaine - SIG78760 - fim

      verificaStatusPrestacaoContas(sAnoMesInicio, sAnoMesFinal);

      bbtnCancelar.Enabled     := True;
      bbtnConfirmar.Enabled    := (not ( bPrestacaoContasGerada and bPrestacaoContasEfetivada )) or (bPrestacaoRetificada);
      bbtnGerarArquivo.Enabled := ( bPrestacaoContasGerada and  bPrestacaoContasEfetivacao and ( not bPrestacaoContasEfetivada ) );
      bbtnEfetivar.Enabled     := ( bPrestacaoContasGerada and  bPrestacaoContasEfetivacao and bArquivoINSSGerado and ( not bPrestacaoContasEfetivada ) );
      bbtnEnviar.Enabled       := ( bPrestacaoContasGerada and bArquivoINSSGerado and  bPrestacaoContasEfetivada and ( not bArquivoINSSEnviado ) );
      //edilaine - SIG78760 - inicio
      //bbtnRetificar.Enabled    := ( bPrestacaoContasGerada and bPrestacaoContasEfetivada and bArquivoINSSEnviado);
      rbOpcRelRetificadoSIM.Enabled := (bArquivoINSSEnviado) or (bPrestacaoRetificada);

      rbOpcRelPreviaSIM.enabled     := not rbOpcRelRetificadoSIM.enabled;
      rbOpcRelEfetivacaoSIM.enabled := not rbOpcRelRetificadoSIM.enabled;
      //edilaine - SIG78760 - fim
   end
  Else
   begin
      bbtnCancelar.Enabled     := False;
      rgTipoRelatorio.Enabled  := True;
      gbResponsavel.Enabled    := True;
      bbtnConfirmar.Enabled    := False;
      bbtnGerarArquivo.Enabled := False;
      bbtnEfetivar.Enabled     := False;
      bbtnEnviar.Enabled       := False;
      //edilaine - SIG78760 - inicio
      //bbtnRetificar.Enabled    := False;
      rbOpcRelRetificadoSIM.Enabled := false;
      rbOpcRelPreviaSIM.enabled     := true;
      rbOpcRelEfetivacaoSIM.enabled := true;
      //edilaine - SIG78760 - false

      //edilaine - SIG78760 - inicio
      edtNomeResponsavel.text  := '';
      edtCPFResponsavel.text   := '';
      edtCargoResponsavel.text := '';
      //edilaine - SIG78760 - fim

   end


end;

function TfrmPrestacaoContasINSS.PegaAnoMesRef(acbMes: tcombobox;
  aspAno: tspinedit): string;
begin
  result:='';
  if (aspAno.value > 0) and (acbMes.ItemIndex <> -1) then
  begin
    result:=Trim(aspAno.Text) + '/';
    if acbMes.ItemIndex >= 0 then
    begin
      if acbMes.ItemIndex <= 8 then
        result:=result+'0'+IntToStr(acbMes.ItemIndex+1)
      else
        result:=result+IntToStr(acbMes.ItemIndex+1);
    end;
  end;
end;

procedure TfrmPrestacaoContasINSS.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if pnProcessando.Visible then
   Exit;

  bCancelarOperacao := False;

  if Trim(edtNomeResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o nome do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  if Trim(edtCPFResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o CPF do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  if Trim(edtCargoResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o cargo do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  //edilaine - SIG78760 - inicio
  //if rbOpcRelPreviaNAO.Checked and rbOpcRelPreviaTipoBenefNAO.Checked and  rbOpcRelEfetivacaoNAO.Checked and rbOpcRelTipoBenefEfetivacaNAO.Checked then
  if (not rbOpcRelPreviaSIM.Checked) and (not rbOpcRelEfetivacaoSIM.Checked) and (not rbOpcRelRetificadoSIM.Checked) then
   begin
      MsgDlg('É necessário selecionar uma das opções de emissão do relatório.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  if rbOpcRelRetificadoSIM.Checked then
  begin
    bbtnCancelar.Enabled  := False;

    rbOpcaoAnalitico.checked := true;

    retificarPrestacaoContas();

  end
  else
  begin

    gerarRelatorioPrestacaoContas();

  end;
  
  cmb_mesInicioChange(Sender);
  //edilaine - SIG78760 - fim

end;




procedure TfrmPrestacaoContasINSS.consultarOrgaosINSS;
var sSql : String;
begin
  Try
    sSql :=  ' SELECT SIGLA               '
          +  '       ,CODORGAOLOCAL       '
          +  '       ,SINONIMO            '
          +  '       ,EMAIL               '
          +  ' FROM UFINSS                '
          +  ' WHERE EMAIL IS NOT NULL    ';
//          +  '   AND SINONIMO <> 129893   ';

    FazQuery(qryOrgaosINSS, ssql);

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

procedure TfrmPrestacaoContasINSS.gerarRelatorioAnalitico( bGeracaoEnvio: boolean);
var sMesInicio, sMesFinal : String;
    sEndereco, sAssunto, sMensagem, sAnexo: String;
    vlrTotalDesembolso, vlrTotalReembolso, vlrDiferenca, vlrTotalGlosa: real;
    sNomeEstado, sUF : string;          //edilaine - SIG78760
begin

  //edilaine - SIG78760 - inicio
  {para ordenar o relatorio foi substituido o TwwQuery pelo CDS mantendo o nome do componente qryPcINSSAnal}
  //qryPcINSSAnal.Close;
  //qryPcINSSAnal.Open;
  //qryPcINSSAnal.First;

  qryPcINSSAnal.data := Padroes.GetDataPacket(qryPcINSSAnal_old.SQL.text);
  //edilaine - SIG78760 - fim


  if not bGeracaoEnvio then
   begin
    sMesInicio := PegaAnoMesRef(cmb_mesInicio,spn_anoInicio);
    sMesFinal  := PegaAnoMesRef(cmb_mesFinal,spn_anoFinal);
    consultarRelatorioAnalitico(sMesInicio, sMesFinal);
   end
  Else
    consultarRelatorioAnaliticoEnvio(sMesAnoEnvio, sSinonimoEnvio);

  vlrTotalDesembolso := 0;
  vlrTotalReembolso  := 0;
  vlrDiferenca       := 0;
  vlrTotalGlosa      := 0;

  sUF := '';         //edilaine - SIG78760

  While not qryPC.Eof do
   begin
      begin
        vlrTotalDesembolso := vlrTotalDesembolso +  qryPC.FieldByName('VALORDESEMBOLSO').AsFloat;
        vlrTotalDesembolso := vlrTotalDesembolso +  qryPC.FieldByName('ACERTODESEMBOLSO').AsFloat;   
        vlrTotalReembolso  := vlrTotalReembolso  +  qryPC.FieldByName('VALORREEMBOLSO').AsFloat;
        vlrTotalGlosa      := vlrTotalGlosa      +  qryPC.FieldByName('VALORGLOSADO').AsFloat;
        vlrDiferenca       := vlrDiferenca       +  qryPC.FieldByName('VALORDIFERENCA').AsFloat;

        //edilaine - SIG78760 - inicio
        if sUF <> qryPC.fieldByName('SIGLA').AsString then
        begin
          sNomeEstado := GetDadosEstado(qryPC.fieldByName('CODSINONIMO').AsString, false);
          sUf := qryPC.fieldByName('SIGLA').AsString;
        end;
        //edilaine - SIG78760 - fim

        qryPcINSSAnal.Insert;
        qryPcINSSAnal.FieldByName('IDPESSOA').AsString       := qryPC.FieldByName('IDPESSOA').AsString;

        if qryPC.FieldByName('NUMPROCINSS').AsString <> '' then
          qryPcINSSAnal.FieldByName('NUMPROCINSS').AsString    := formataNumBeneficio(qryPC.FieldByName('NUMPROCINSS').AsString)
        Else
          qryPcINSSAnal.FieldByName('NUMPROCINSS').AsString    := '';

        if qryPC.FieldByName('NUMDOCUMENTO').AsString <> '' then
          qryPcINSSAnal.FieldByName('NUMDOCUMENTO').AsString   := formataNumCPF( qryPC.FieldByName('NUMDOCUMENTO').AsString )
        Else
          qryPcINSSAnal.FieldByName('NUMDOCUMENTO').AsString   := '';

        qryPcINSSAnal.FieldByName('ESPECIE').AsString        := qryPC.FieldByName('ESPECIE').AsString;
        qryPcINSSAnal.FieldByName('VALORREEMBOLSO').AsFloat  := qryPC.FieldByName('VALORREEMBOLSO').AsFloat;

        if qryPC.FieldByName('VALORREEMBOLSO').AsFloat = 0 then
          qryPcINSSAnal.FieldByName('VALORREEMBOLSOF').AsString := '  -   '
        Else
          qryPcINSSAnal.FieldByName('VALORREEMBOLSOF').AsString := FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORREEMBOLSO').AsFloat);

        qryPcINSSAnal.FieldByName('DESCRICAO').AsString      := qryPC.FieldByName('DESCRICAO').AsString;
        qryPcINSSAnal.FieldByName('VALORDESEMBOLSO').AsFloat := qryPC.FieldByName('VALORDESEMBOLSO').AsFloat;

        if qryPC.FieldByName('VALORDESEMBOLSO').AsFloat <> 0 then             //edilaine - SIG78760
          qryPcINSSAnal.FieldByName('VALORDESEMBOLSOF').AsString := FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORDESEMBOLSO').AsFloat)
        Else
          qryPcINSSAnal.FieldByName('VALORDESEMBOLSOF').AsString := '  -   ';

        qryPcINSSAnal.FieldByName('DATAPAGAMENTO').AsString  := qryPC.FieldByName('DATAPAGAMENTO').AsString;
        qryPcINSSAnal.FieldByName('DIFDESEMBOLSO').AsFloat   := qryPC.FieldByName('DIFERENCADESEMBOLSO').AsFloat;

        if qryPC.FieldByName('DIFERENCADESEMBOLSO').AsFloat <> 0 then
          qryPcINSSAnal.FieldByName('DIFDESEMBOLSOF').AsString := FormatFloat('###,###,##0.00',qryPC.FieldByName('DIFERENCADESEMBOLSO').AsFloat)
        Else
          qryPcINSSAnal.FieldByName('DIFDESEMBOLSOF').AsString := '  -   ';

        qryPcINSSAnal.FieldByName('VALORACERTO').AsFloat := qryPC.FieldByName('ACERTODESEMBOLSO').AsFloat;

        if qryPC.FieldByName('ACERTODESEMBOLSO').AsFloat <> 0 then
          qryPcINSSAnal.FieldByName('VALORACERTOF').AsString := FormatFloat('###,###,##0.00',qryPC.FieldByName('ACERTODESEMBOLSO').AsFloat)
        Else
          qryPcINSSAnal.FieldByName('VALORACERTOF').AsString := '  -   ';

        qryPcINSSAnal.FieldByName('DATAACERTO').AsString     := qryPC.FieldByName('DATAACERTO').AsString;
        qryPcINSSAnal.FieldByName('VALORDIFERENCA').AsFloat  := qryPC.FieldByName('VALORDIFERENCA').AsFloat;

        if qryPC.FieldByName('VALORDIFERENCA').AsFloat <> 0 then
          qryPcINSSAnal.FieldByName('VALORDIFERENCAF').AsString  := FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORDIFERENCA').AsFloat)
        Else
          qryPcINSSAnal.FieldByName('VALORDIFERENCAF').AsString  := '  -   ';

        qryPcINSSAnal.FieldByName('VALORGLOSADO').AsFloat    := qryPC.FieldByName('VALORGLOSADO').AsFloat;

        qryPcINSSAnal.FieldByName('TOTALDESEMBOLSO').AsFloat := qryPC.FieldByName('VALORDESEMBOLSO').AsFloat +
                                                                qryPC.FieldByName('ACERTODESEMBOLSO').AsFloat;

        qryPcINSSAnal.FieldByName('DS_JUSTIFICATIVA').AsString  := qryPC.FieldByName('DS_VALORESNAOPAGO').AsString;
        qryPcINSSAnal.FieldByName('SINONIMO').AsString       := qryPC.fieldByName('CODSINONIMO').AsString + ' - ' +        //edilaine - SIG78760
                                                                 qryPC.fieldByName('SIGLA').AsString +' - '+sNomeEstado;   //edilaine - SIG78760
        qryPcINSSAnal.FieldByName('CENTRALIZADOR').AsString  := qryPC.fieldByName('CENTRALIZADOR').AsString;
        qryPcINSSAnal.FieldByName('MESREFERENCIA').AsString  := qryPC.fieldByName('DESCMESREFERENCIA').AsString;
        qryPcINSSAnal.Post;
      end;
      qryPC.Next;
   end;

   vlrDiferenca := vlrTotalReembolso - vlrTotalDesembolso;

   lbTotalReembolso.Caption  := 'R$ ' + FormatFloat('###,###,##0.00',vlrTotalReembolso);
   lbTotalDesembolso.Caption := 'R$ ' + FormatFloat('###,###,##0.00',vlrTotalDesembolso);
   lbTotalDirerencas.Caption := 'R$ ' + FormatFloat('###,###,##0.00',vlrDiferenca);
   lbTotalGlosas.Caption     := 'R$ ' + FormatFloat('###,###,##0.00',vlrTotalGlosa);

  if qryPcINSSAnal.IsEmpty then
   begin
    MsgDlg('Não existe prestação de contas a ser gerada.','Informação', mtInformation, [mbOk, mbHelp], 0);
    Exit;
   end;

   qryPcINSSAnal.IndexName := 'ORDENA';     //edilaine - SIG78760

   sArquivoAnalitico := 'C:\Planus\Temp\' + qryPC.FieldbyName('NOME_ARQUIVO').AsString;

   ppBndTotalSinonimo.visible := (not bGeracaoEnvio);     //edilaine - SIG78760

   ppdPcINSSAnal.Report.TextFileName     := sArquivoAnalitico;
   ppdPcINSSAnal.Report.AllowPrintToFile := True;
   ppdPcINSSAnal.Report.ShowPrintDialog  := False;
   ppdPcINSSAnal.Report.DeviceType       :='PDFFile';
   ppdPcINSSAnal.Report.Print;

  if not bGeracaoEnvio then
   begin
     ppdPcINSSAnal.Report.Template.SaveTo  := stFile;
     ppdPcINSSAnal.Report.Template.Format  := ftASCII;
     ppdPcINSSAnal.Report.Device           := dvScreen;
     //edilaine - SIG78760 - inicio
     //TFrmPreview.CreateModalPreview(Application, ppdPcINSSAnal.Report, 'Relatório de Prestação de Contas do INSS - Analítico');
     TFrmPreviewExport.CreateModalPreviewExpPipe(Application, ppdPcINSSAnal.Report, 'Relatório de Prestação de Contas do INSS - Analítico');
     //edilaine - SIG78760 - fim
   end;
   qryPcINSSAnal.IndexName := '';        //edilaine - SIG78760
end;

function TfrmPrestacaoContasINSS.retornaPeriodoAtual: String;
begin
  if FazQuery(qryAux, 'SELECT TO_CHAR(SYSDATE,''YYYYMM'') AS MESANO FROM DUAL') then
    result := qryAux.FieldByName('MESANO').AsString
  else
    result := '';

  qryAux.Close;

end;

procedure TfrmPrestacaoContasINSS.FormCreate(Sender: TObject);
var sanomesref: String;
begin
   inherited;
   sanomesref := retornaPeriodoAtual();

   spn_anoInicio.Value     := StrToInt(Copy(sanomesref,1,4));
   spn_anoFinal.Value      := StrToInt(Copy(sanomesref,1,4));
end;

procedure TfrmPrestacaoContasINSS.consultarRelatorioAnalitico(sMesAnoInicio, sMesAnoFinal: String);
var sSql : String;
begin
  Try
    sSql :=  ' SELECT P.IDPESSOA                                            '
          +  '       ,P.NOME                                                '
          +  '       ,P.NUMEROBENEFICIO AS NUMPROCINSS                      '
          +  '       ,P.NUMDOCUMENTO                                        '
          +  '       ,P.ESPECIE                                             '
          +  '       ,P.DESCRICAO                                           '
          +  '       ,P.SINONIMO AS CODSINONIMO                             '
          +  '       ,P.SIGLA                                               '
          +  '       ,P.SINONIMO || '' - '' || U.SIGLA AS DSSINONIMO        '
          +  '       ,UC.SINONIMO AS CENTRALIZADOR                          '
          +  '       ,P.CODORGAOLOCAL                                       '
          +  '       ,U.EMAIL                                               '
          +  '       ,P.MESREFERENCIA                                       '
          +  '       ,TRIM(TO_CHAR(TO_DATE(P.MESREFERENCIA||''/01'',''YYYY/MM/DD''),''Month'')) ||                   '
          +  '        TRIM(TO_CHAR(TO_DATE(P.MESREFERENCIA||''/01'',''YYYY/MM/DD''),''/yyyy''))AS DESCMESREFERENCIA  '
          +  '       ,P.REEMBOLSADO AS VALORREEMBOLSO                       '
          +  '       ,P.DATAPAGAMENTO AS DATAPAGAMENTO                      '
          +  '       ,P.DESEMBOLSADO AS VALORDESEMBOLSO                     '
          +  '       ,ROUND(P.DIFERENCADESEMBOLSO,2) AS DIFERENCADESEMBOLSO '
          +  '       ,P.GLOSADO AS VALORGLOSADO                             '
          +  '       ,P.ACERTODESEMBOLSO                                    '
          +  '       ,P.DATAACERTO                                          '
          +  '       ,NVL(P.DS_VALORESNAOPAGO,'' '') as DS_VALORESNAOPAGO   '
          +  '       ,P.IDBENEFICIO                                         '
          +  '       ,ROUND(P.DIFERENCA,2) AS VALORDIFERENCA                '
          +  '       ,''PRESTACAO_CONTAS_INSS_'' ||                         '
          +  '         SUBSTR(P.MESREFERENCIA,6,2) || ''_'' ||              '
          +  '         SUBSTR(P.MESREFERENCIA,1,4) || ''_'' ||              '
          +  '         TO_CHAR(SYSDATE,''DDMMYYYY_HH_MI_SS'') || ''.pdf''   '
          +  '        AS NOME_ARQUIVO                                       '
          +  ' FROM CM.PRESTACAOCONTASINSS P                                '
          +  '    , CM.UFINSS U                                             '
          +  '    , CM.UFINSS UC                                            '
          +  ' WHERE P.SINONIMO  = U.SINONIMO                               '
          +  '   AND U.SIGLACENTRAL = UC.SIGLA                              '
          +  '   AND P.MESREFERENCIA = ' + QuotedStr( sMesAnoInicio )                   //edilaine - SIG78760
//          +  '   AND P.MESREFERENCIA <= ' + QuotedStr( sMesAnoFinal )                 //edilaine - SIG78760
//          +  '   AND U.SINONIMO <> 129893                                   '
          +  '   AND UC.SINONIMO <> 156787                                  ';

          //edilaine - SIG78760 - inicio
          if Trim(lstNB.Text) <> '' then
             sSql := sSql +'   AND P.NUMEROBENEFICIO IN (  '+lstNB.Text +') ';

          sSql := sSql    //edilaine - SIG78760 - fim
          +  ' ORDER BY DSSINONIMO                                          '
          +  '      , CENTRALIZADOR                                         '
          +  '      , ABS(NVL(P.DIFERENCA,0))                              '
          +  '      , DS_VALORESNAOPAGO                                     '
          +  '      , TRIM(ESPECIE)                                         '
          +  '      , NUMPROCINSS                                           '
          +  '      , NUMDOCUMENTO                                          '
          +  '      , VALORREEMBOLSO                                        '
          +  '      , VALORDESEMBOLSO                                       ';

    FazQuery(qryPC, ssql);

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

procedure TfrmPrestacaoContasINSS.bbtnGerarArquivoClick(Sender: TObject);
begin
  inherited;

  if Trim(edtNomeResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o nome do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  if Trim(edtCPFResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o CPF do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  if Trim(edtCargoResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o Cargo do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  if pnProcessando.Visible then
   Exit;

  bbtnCancelar.Enabled  := False;

  gerarArquivoEnvioINSS();
end;

procedure TfrmPrestacaoContasINSS.bbtnEnviarClick(Sender: TObject);
begin
  inherited;

  if Trim(edtNomeResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o nome do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      edtNomeResponsavel.setfocus;         //edilaine - SIG78760
      Exit;
   end;

  if Trim(edtCPFResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o CPF do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      edtCPFResponsavel.setfocus;         //edilaine - SIG78760
      Exit;
   end;

  if Trim(edtCargoResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o Cargo do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      edtCargoResponsavel.setfocus;         //edilaine - SIG78760
      Exit;
   end;

  //edilaine - SIG78760 - inicio
  if Trim(edtEmailResponsa.Text) = '' then
   begin
      MsgDlg('É necessário informar o e-mail do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      edtEmailResponsa.setfocus;
      Exit;
   end
   else if not (ValidaEMail(edtEmailResponsa.text)) then
   begin
      MsgDlg('O e-mail não é válido. Favor verificar!','Informação', mtInformation, [mbOk, mbHelp], 0);
      edtEmailResponsa.setfocus;
      Exit;
   end;
   //edilaine - SIG78760 - fim


  if pnProcessando.Visible then
   Exit;

  bbtnCancelar.Enabled  := False;

  gerarArquivoINSSeEnviarEmail();
end;

procedure TfrmPrestacaoContasINSS.consultarRelatorioSintetico(sMesAnoInicio, sMesAnoFinal: String);
var sSql : String;
begin
  Try
    sSql :=  ' SELECT P.MESREFERENCIA AS MESCOMPETENCIA                           '
          +  '      , P.SINONIMO                                                  '
          +  '      , P.SIGLA AS UF                                               '
          +  '      , TO_CHAR(MAX(P.TRGDTINCLUSAO),''dd/mm/yyyy'') AS  DATAENVIO  '
          +  '      , P.SINONIMO AS EXECUTOR                                      '
          +  '      , UC.SINONIMO AS CENTRALIZADOR                                '
          +  '      , SUM(P.REEMBOLSADO) AS VALORREEMBOLSADO                      '
          +  '      , SUM(P.ACERTODESEMBOLSO) AS ACERTODESEMBOLSO                 '
          +  '      , SUM(P.DESEMBOLSADO) AS VALORDESEMBOLSADO                    '
          +  '      , SUM(P.GLOSADO) AS VALORGLOSADO                              '
          +  '      , SUM(P.DIFERENCA) AS VALORDIFERENCA                          '
          +  '       ,''SINTETICO_'' ||                                           '
          +  '         SUBSTR(P.MESREFERENCIA,6,2) || ''_'' ||                    '
          +  '         SUBSTR(P.MESREFERENCIA,1,4) || ''_'' ||                    '
          +  '         TO_CHAR(SYSDATE,''DDMMYYYY_HH_MI_SS'') || ''.pdf''         '
          +  '        AS NOME_ARQUIVO                                             '
          +  ' FROM CM.PRESTACAOCONTASINSS P                                      '
          +  '    , CM.UFINSS U                                                   '
          +  '    , CM.UFINSS UC                                                  '
          +  ' WHERE P.SINONIMO  = U.SINONIMO                                     '
          +  '   AND U.SIGLACENTRAL = UC.SIGLA                                    '
          +  '   AND P.MESREFERENCIA =  ' + QuotedStr( sMesAnoInicio )                        //edilaine - SIG78760
//          +  '   AND P.MESREFERENCIA <=  ' + QuotedStr( sMesAnoFinal )                      //edilaine - SIG78760
//          +  '   AND U.SINONIMO <> 129893                                         '
          +  '   AND UC.SINONIMO <> 156787                                        '
          +  ' GROUP BY P.MESREFERENCIA                                           '
          +  '      , P.SINONIMO                                                  '
          +  '      , P.SIGLA                                                     '
          +  '      , P.SINONIMO                                                  '
          +  '      , UC.SINONIMO                                                 '
          +  ' ORDER BY SINONIMO                                                  '
          +  '      , CENTRALIZADOR                                               '
          +  '      , VALORREEMBOLSADO                                            '
          +  '      , VALORREEMBOLSADO                                            ';

    FazQuery(qryPC, ssql);

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

procedure TfrmPrestacaoContasINSS.gerarRelatorioSintetico (bGeracaoEnvio: boolean);
var sMesInicio,sMesFinal,sNomeArquivo : String;
    sEndereco, sAssunto, sMensagem, sAnexo: String;
    vlrTotalDesembolso, vlrTotalReembolso, vlrDiferenca, vlrTotalGlosa: real;
begin

  qryPcINSSSint.Close;
  qryPcINSSSint.Open;
  qryPcINSSSint.First;

  if not bGeracaoEnvio then
   begin
    sMesInicio := PegaAnoMesRef(cmb_mesInicio,spn_anoInicio);
    sMesFinal  := PegaAnoMesRef(cmb_mesFinal,spn_anoFinal);
    consultarRelatorioSintetico(sMesInicio, sMesFinal);
   end
  Else
    consultarRelatorioSinteticoEnvio(sMesAnoEnvio, sSinonimoEnvio);

  vlrTotalDesembolso := 0;
  vlrTotalReembolso  := 0;
  vlrDiferenca       := 0;
  vlrTotalGlosa      := 0;

  While not qryPC.Eof do
   begin
      begin
        vlrTotalDesembolso := vlrTotalDesembolso +  qryPC.FieldByName('VALORDESEMBOLSADO').AsFloat;
        vlrTotalDesembolso := vlrTotalDesembolso +  qryPC.FieldByName('ACERTODESEMBOLSO').AsFloat;
        vlrTotalReembolso  := vlrTotalReembolso  +  qryPC.FieldByName('VALORREEMBOLSADO').AsFloat;
        vlrTotalGlosa      := vlrTotalGlosa      +  qryPC.FieldByName('VALORGLOSADO').AsFloat;
        vlrDiferenca       := vlrDiferenca       +  qryPC.FieldByName('VALORDIFERENCA').AsFloat;

        qryPcINSSSint.Insert;
        qryPcINSSSint.FieldByName('MESCOMPETENCIA').AsString   := qryPC.FieldByName('MESCOMPETENCIA').AsString;
        qryPcINSSSint.FieldByName('SINONIMO').AsString         := qryPC.FieldByName('SINONIMO').AsString;
        qryPcINSSSint.FieldByName('UF').AsString               := qryPC.FieldByName('UF').AsString;
        qryPcINSSSint.FieldByName('DATAENVIO').AsString        := qryPC.FieldByName('DATAENVIO').AsString;
        qryPcINSSSint.FieldByName('EXECUTOR').AsString         := qryPC.FieldByName('EXECUTOR').AsString;
        qryPcINSSSint.FieldByName('CENTRALIZADOR').AsString    := qryPC.FieldByName('CENTRALIZADOR').AsString;
        qryPcINSSSint.FieldByName('VALORREEMBOLSADO').AsString := 'R$ ' + FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORREEMBOLSADO').AsFloat);
        qryPcINSSSint.FieldByName('VALORDESEMBOLSADO').AsString:= 'R$ ' + FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORDESEMBOLSADO').AsFloat);
        qryPcINSSSint.FieldByName('VALORGLOSADO').AsString     := 'R$ ' + FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORGLOSADO').AsFloat);
        qryPcINSSSint.FieldByName('VALORDIFERENCA').AsString   := 'R$ ' + FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORDIFERENCA').AsFloat);
        qryPcINSSSint.FieldByName('AGRUPADOR').AsInteger       := 1;
        qryPcINSSSint.Post;
      end;
      qryPC.Next;
   end;

  vlrDiferenca := vlrTotalReembolso - vlrTotalDesembolso;

  lbTotalReembolsoSint.Caption  := 'R$ ' + FormatFloat('###,###,##0.00',vlrTotalReembolso);
  lbTotalDesembolsoSint.Caption := 'R$ ' + FormatFloat('###,###,##0.00',vlrTotalDesembolso);
  lbTotalDirerencasSint.Caption := 'R$ ' + FormatFloat('###,###,##0.00',vlrDiferenca);
  lbTotalGlosasSint.Caption     := 'R$ ' + FormatFloat('###,###,##0.00',vlrTotalGlosa);

  if qryPcINSSSint.IsEmpty then
   begin
    MsgDlg('Não existe prestação de contas a ser gerada.','Informação', mtInformation, [mbOk, mbHelp], 0);
    Exit;
   end;

  sArquivoSintetico := 'C:\Planus\Temp\' + qryPC.FieldbyName('NOME_ARQUIVO').AsString;

  ppdPcINSSSint.Report.TextFileName     := sArquivoSintetico;
  ppdPcINSSSint.Report.AllowPrintToFile := True;
  ppdPcINSSSint.Report.ShowPrintDialog  := False;
  ppdPcINSSSint.Report.DeviceType       :='PDFFile';
  ppdPcINSSSint.Report.Print;

  if not bGeracaoEnvio then
   begin
     ppdPcINSSSint.Report.Template.SaveTo  := stFile;
     ppdPcINSSSint.Report.Template.Format  := ftASCII;
     ppdPcINSSSint.Report.Device           := dvScreen;
     //edilaine - SIG78760 - inicio
     //TFrmPreview.CreateModalPreview(Application, ppdPcINSSSint.Report, 'Relatório de Prestação de Contas do INSS - Sintetico');
     TFrmPreviewExport.CreateModalPreviewExpPipe(Application, ppdPcINSSSint.Report, 'Relatório de Prestação de Contas do INSS - Sintetico');
     //edilaine - SIG78760 - fim
   end;
end;

procedure TfrmPrestacaoContasINSS.apagarPrestacaoContas(sMesAnoInicio, sMesAnoFinal: String);
var sSql : String;
begin
  Try
    sSql :=  ' DELETE                           '
          +  ' FROM CM.PRESTACAOCONTASINSS      '
          +  ' WHERE MESREFERENCIA = ' + QuotedStr( sMesAnoInicio );                     //edilaine - SIG78760
          //+  '   AND MESREFERENCIA <= ' + QuotedStr( sMesAnoFinal );                   //edilaine - SIG78760

    qryAux.sql.Text := ssql;
    qryAux.ExecSQL;

    qryAux.Close;
    qryAux.sql.Clear;

    sSql :=  ' DELETE                                                  '
          +  ' FROM CM.ARQUIVOPRESTACAOCONTASINSS A                    '
          +  ' WHERE EXISTS                                            '
          +  ' (                                                       '
          +  '   SELECT 1                                              '
          +  '   FROM CM.ENVIOPRESTACAOCONTASINSS E                    '
          +  '   WHERE ( (E.IDARQUIVORECIBO = A.IDARQUIVO)             '
          +  '        OR (E.IDARQUIVOANALITICO = A.IDARQUIVO)          '
          +  '        OR (E.IDARQUIVOSINTETICO = A.IDARQUIVO)          '
          +  '         )                                               '
          +  '   AND E.FLGEMAILENVIADO = 0                             '
          +  '   AND E.MESREFERENCIA = ' + QuotedStr( sMesAnoInicio )                 //edilaine - SIG78760
//          +  '   AND E.MESREFERENCIA <= ' + QuotedStr( sMesAnoFinal )               //edilaine - SIG78760
          +  ' )                                                       ';

    qryAux.sql.Text := ssql;
    qryAux.ExecSQL;

    qryAux.Close;
    qryAux.sql.Clear;

    sSql :=  ' DELETE                           '
          +  ' FROM CM.ENVIOPRESTACAOCONTASINSS '
          +  ' WHERE FLGEMAILENVIADO = 0        '
          +  '   AND MESREFERENCIA = ' + QuotedStr( sMesAnoInicio );                  //edilaine - SIG78760
//          +  '   AND MESREFERENCIA <= ' + QuotedStr( sMesAnoFinal );                //edilaine - SIG78760

    qryAux.sql.Text := ssql;
    qryAux.ExecSQL;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

procedure TfrmPrestacaoContasINSS.consultarRelatorioArquivoEnvioINSS(sSinonimo, sMesAnoInicio, sMesAnoFinal: String);
var sSql : String;
begin
  Try
    sSql :=  ' SELECT P.SINONIMO                                                        '
          +  '      , UC.SINONIMO AS CENTRALIZADOR                                      '
          +  '      , P.MESREFERENCIA AS MESCOMPETENCIA                                 '
          +  '      ,''Brasília-DF, '' || TO_CHAR(SYSDATE,''DD'')  ||                   '
          +  '       '' de '' || TRIM(TO_CHAR(SYSDATE,''month''))  ||                   '
          +  '       '' de '' || TO_CHAR(SYSDATE,''YYYY'') AS DSDATAASSINATURA          '
          +  '      , ''RECIBO_'' ||                                                    '
          +  '          SUBSTR(P.MESREFERENCIA,6,2) || ''_'' ||                         '
          +  '          SUBSTR(P.MESREFERENCIA,1,4) || ''_'' ||                         '
          +  '          TRIM(P.SIGLA) || ''_'' ||                                       '
          +  '          TO_CHAR(SYSDATE,''DDMMYYYY_HH_MI_SS'') || ''.pdf''              '
          +  '        AS NOMEARQUIVO                                                    '
          +  '      , ''RECIBO_'' ||                                                    '
          +  '          SUBSTR(P.MESREFERENCIA,6,2) || ''_'' ||                         '
          +  '          SUBSTR(P.MESREFERENCIA,1,4) || ''_'' ||                         '
          +  '          TO_CHAR(SYSDATE,''DDMMYYYY_HH_MI_SS'') || ''.pdf''              '
          +  '        AS NOMEARQUIVOTODOS                                               '
          +  '      , SUBSTR(P.MESREFERENCIA,1,4)AS ANOCOMPETENCIA                      '
          +  '      , P.NOMERESPONSAVEL                                                 '
          +  '      , P.CPFRESPONSAVEL                                                  '
          +  '      , P.CARGORESPONSAVEL                                                '
          +  '      , SUM(P.REEMBOLSADO) AS VALORREEMBOLSADO                            '
          +  '      , SUM(P.DESEMBOLSADO) AS VALORDESEMBOLSADO                          '
          +  '      , SUM(P.GLOSADO) AS VALORGLOSADO                                    '
          +  '      , SUM(P.DIFERENCA) AS VALORDIFERENCA                                '
          +  '      , SUM(P.ACERTODESEMBOLSO) AS ACERTODESEMBOLSO                       '       //edilaine - SIG78760
          +  '      , MAX(P.FLGRETIFICADA) AS FLGRETIFICADA                             '
          +  ' FROM CM.PRESTACAOCONTASINSS P                                            '
          +  '    , CM.UFINSS U                                                         '
          +  '    , CM.UFINSS UC                                                        '
          +  ' WHERE P.SINONIMO  = U.SINONIMO                                           '
          +  '   AND U.SIGLACENTRAL = UC.SIGLA                                          '
//          +  '   AND U.SINONIMO <> 129893                                               '
          +  '   AND UC.SINONIMO <> 156787                                              '
          +  '   AND P.SINONIMO =  ' + QuotedStr( sSinonimo )
          +  '   AND P.MESREFERENCIA =  ' + QuotedStr( sMesAnoInicio )                          //edilaine - SIG78760
//          +  '   AND P.MESREFERENCIA <=  ' + QuotedStr( sMesAnoFinal )                        //edilaine - SIG78760
          +  ' GROUP BY P.MESREFERENCIA                                                 '
          +  '      , P.SINONIMO                                                        '
          +  '      , P.SIGLA                                                           '
          +  '      , P.SINONIMO                                                        '
          +  '      , UC.SINONIMO                                                       '
          +  '      , P.NOMERESPONSAVEL                                                 '
          +  '      , P.CPFRESPONSAVEL                                                  '
          +  '      , P.CARGORESPONSAVEL                                                '
          +  '      , P.FLGPREVIA                                                       '
          +  '      , P.FLGEFETIVADA                                                    ';


    FazQuery(qryPCEnvio, ssql);

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

procedure TfrmPrestacaoContasINSS.gerarArquivoEnvioINSS;
var sSql, sMesInicio,sMesFinal, sSinonimo,sFlgRetificada : String;
    sEndereco, sAssunto, sMensagem, sAnexo, sNomeArqRecibo: String;
    bArquivoGerado, bGerarArquivo: boolean;
begin

  consultarOrgaosINSS();

  if qryOrgaosINSS.IsEmpty then
   begin
    MsgDlg('Não existe prestação de contas a ser gerada.','Informação', mtInformation, [mbOk], 0);
    Exit;
   end;

  sMesInicio := PegaAnoMesRef(cmb_mesInicio,spn_anoInicio);
  sMesFinal  := PegaAnoMesRef(cmb_mesFinal,spn_anoFinal);

  verificaStatusPrestacaoContas(sMesInicio,sMesFinal);

  if not bPrestacaoContasGerada then
   begin
     MsgDlg('Não é possível gerar arquivos pois não existe prestação de contas para o período e parâmetros informados.','Informação', mtInformation, [mbOk], 0);
     Exit;
   end;

  if not bPrestacaoContasEfetivacao then
   begin
     MsgDlg('Não é possível gerar arquivos pois não existe prestação de contas gerada pela efetivação para o período e parâmetros informados.','Informação', mtInformation, [mbOk], 0);
     Exit;
   end;

  apagarArquivosGeradosNaoEfetivados(sMesInicio,sMesFinal);

  bArquivoGerado := False;

  qryPcINSSEnvioTodos.Close;
  qryPcINSSEnvioTodos.Open;

  While not qryOrgaosINSS.Eof do
   begin
      begin
       sSinonimo      := qryOrgaosINSS.FieldByName('SINONIMO').AsString;
       sSinonimoEnvio := qryOrgaosINSS.FieldByName('SINONIMO').AsString;

       consultarRelatorioArquivoEnvioINSS(sSinonimo,sMesInicio,sMesFinal);

         While not qryPCEnvio.Eof do
          begin
             bGerarArquivo := True;
             sFlgRetificada := '0';
             if qryPCEnvio.FieldByName('FLGRETIFICADA').AsString = '1' then
              begin
               sFlgRetificada := '1';
               if verificaExistePrestacaoContasEnviadaMesmoValor(qryOrgaosINSS.FieldByName('SINONIMO').AsString
                                                                ,qryPCEnvio.FieldByName('MESCOMPETENCIA').AsString
                                                                ,qryPCEnvio.FieldByName('VALORREEMBOLSADO').AsFloat
                                                                ,qryPCEnvio.FieldByName('VALORDESEMBOLSADO').AsFloat
                                                                ,qryPCEnvio.FieldByName('VALORGLOSADO').AsFloat) then
                 bGerarArquivo := False;
              end;

             if bGerarArquivo then
              begin
                 sMesAnoEnvio := qryPCEnvio.FieldByName('MESCOMPETENCIA').AsString;

                 inserirEnvioPrestacaoContas(qryOrgaosINSS.FieldByName('SIGLA').AsString
                                            ,qryOrgaosINSS.FieldByName('CODORGAOLOCAL').AsString
                                            ,qryOrgaosINSS.FieldByName('SINONIMO').AsString
                                            ,qryPCEnvio.FieldByName('MESCOMPETENCIA').AsString
                                            ,qryPCEnvio.FieldByName('VALORREEMBOLSADO').AsFloat
                                            ,qryPCEnvio.FieldByName('VALORDESEMBOLSADO').AsFloat +      //edilaine - SIG78760
                                             qryPCEnvio.FieldByName('ACERTODESEMBOLSO').AsFloat         //edilaine - SIG78760
                                            ,qryPCEnvio.FieldByName('VALORGLOSADO').AsFloat
                                            ,qryPCEnvio.FieldByName('VALORDIFERENCA').AsFloat
                                            ,'1'
                                            ,'0'
                                            ,sFlgRetificada
                                            ,Trim(edtNomeResponsavel.Text)
                                            ,Trim(edtCPFResponsavel.Text)
                                            ,Trim(edtCargoResponsavel.Text)  );

                 qryPcINSSEnvioTodos.Insert;
                 qryPcINSSEnvioTodos.FieldByName('SINONIMO').AsString          := qryPCEnvio.FieldByName('SINONIMO').AsString;
                 qryPcINSSEnvioTodos.FieldByName('CENTRALIZADOR').AsString     := qryPCEnvio.FieldByName('CENTRALIZADOR').AsString;
                 qryPcINSSEnvioTodos.FieldByName('MESCOMPETENCIA').AsString    := qryPCEnvio.FieldByName('MESCOMPETENCIA').AsString;
                 qryPcINSSEnvioTodos.FieldByName('ANOCOMPETENCIA').AsString    := qryPCEnvio.FieldByName('ANOCOMPETENCIA').AsString + '.';
                 qryPcINSSEnvioTodos.FieldByName('DSDATAASSINATURA').AsString  := qryPCEnvio.FieldByName('DSDATAASSINATURA').AsString;
                 qryPcINSSEnvioTodos.FieldByName('NOMERESPONSAVEL').AsString   := qryPCEnvio.FieldByName('NOMERESPONSAVEL').AsString;
                 qryPcINSSEnvioTodos.FieldByName('CPFRESPONSAVEL').AsString    := qryPCEnvio.FieldByName('CPFRESPONSAVEL').AsString;
                 qryPcINSSEnvioTodos.FieldByName('CARGORESPONSAVEL').AsString  := qryPCEnvio.FieldByName('CARGORESPONSAVEL').AsString;
                 qryPcINSSEnvioTodos.FieldByName('VALORREEMBOLSADO').AsString  := 'R$ ' + FormatFloat('###,###,##0.00',qryPCEnvio.FieldByName('VALORREEMBOLSADO').AsFloat);
                 qryPcINSSEnvioTodos.FieldByName('VALORDESEMBOLSADO').AsString := 'R$ ' + FormatFloat('###,###,##0.00',qryPCEnvio.FieldByName('VALORDESEMBOLSADO').AsFloat+     //edilaine - SIG78760
                                                                                                                       qryPCEnvio.FieldByName('ACERTODESEMBOLSO').AsFloat);     //edilaine - SIG78760
                 qryPcINSSEnvioTodos.FieldByName('VALORGLOSADO').AsString      := 'R$ ' + FormatFloat('###,###,##0.00',qryPCEnvio.FieldByName('VALORGLOSADO').AsFloat);
                 qryPcINSSEnvioTodos.FieldByName('VALORDIFERENCA').AsString    := 'R$ ' + FormatFloat('###,###,##0.00',qryPCEnvio.FieldByName('VALORDIFERENCA').AsFloat);
                 qryPcINSSEnvioTodos.Post;

                 if not qryPCEnvio.IsEmpty then
                  begin
                   bArquivoGerado := True;
                   sNomeArqRecibo := qryPCEnvio.FieldByName('NOMEARQUIVOTODOS').AsString;
                  end;

                 gerarRelatorioReciboUF();

                 gerarRelatorioSintetico(True);

                 gerarRelatorioAnalitico(True);


                 atualizarArquivosEnvioPrestacaoContas(qryOrgaosINSS.FieldByName('SIGLA').AsString
                                                      ,qryOrgaosINSS.FieldByName('CODORGAOLOCAL').AsString
                                                      ,qryOrgaosINSS.FieldByName('SINONIMO').AsString
                                                      ,qryPCEnvio.FieldByName('MESCOMPETENCIA').AsString);

              end;

             qryPCEnvio.Next;

          end;


       qryPC.Close;

       qryOrgaosINSS.Next;
      end;
   end;


  Try
    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

    if  (sFlgRetificada = '1') and (not bArquivoGerado) then
      sSql :=  ' UPDATE CM.PRESTACAOCONTASINSS      '
            +  ' SET FLGARQUIVOGERADO = 1           '
            +  '    ,FLGRETIFICADA = 0              '
            +  '    ,PRESTACAOCONTASEFETIVADA = 1   '
            +  ' WHERE MESREFERENCIA = ' + QuotedStr( sMesInicio )                  //edilaine - SIG78760
            //+  '   AND MESREFERENCIA <= ' + QuotedStr( sMesFinal )                //edilaine - SIG78760
    Else
      sSql :=  ' UPDATE CM.PRESTACAOCONTASINSS      '
            +  ' SET FLGARQUIVOGERADO = 1           '
            +  ' WHERE MESREFERENCIA = ' + QuotedStr( sMesInicio );                 //edilaine - SIG78760
            //+  '   AND MESREFERENCIA <= ' + QuotedStr( sMesFinal );               //edilaine - SIG78760

    qryAux.sql.Text := ssql;
    qryAux.ExecSQL;


    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;

  Except
    on e: Exception do
     begin
        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Erro ao gerar arquivos da prestação de contas.' + #13 + 'Erro: ' + e.Message,'Erro',mtError, [mbOk, mbHelp], 0);
        bbtnCancelar.Enabled := True;
        Exit;
     end;
  end;


  if bArquivoGerado then
   begin
    MsgDlg('Arquivo(s) de prestação de contas gerado(s) com sucesso.','Informação', mtInformation, [mbOk], 0);
    bbtnEfetivar.Enabled     := True;
    gerarRelatorioReciboTodos(sNomeArqRecibo);
   end
  Else
   begin
    MsgDlg('Não é possível gerar arquivos pois não existe prestação de contas para o período e parâmetros informados.','Informação', mtInformation, [mbOk], 0);
   end;

  qryPcINSSEnvioTodos.Close;

  bbtnCancelar.Enabled := True;

end;


procedure TfrmPrestacaoContasINSS.gerarRelatorioAnaliticoPorBeneficio;
var sMesInicio, sMesFinal : String;
    sEndereco, sAssunto, sMensagem, sAnexo: String;
    vlrTotalDesembolso, vlrTotalReembolso, vlrDiferenca, vlrTotalGlosa: real;
begin

  //edilaine - SIG78760 - inicio
  {para ordenar o relatorio foi substituido o TwwQuery pelo CDS mantendo o nome do componente qryPcINSSAnalTB}
  //qryPcINSSAnalTB.Close;
  //qryPcINSSAnalTB.Open;
  //qryPcINSSAnalTB.First;

  qryPcINSSAnalTB.data := Padroes.GetDataPacket(qryPcINSSAnalTB_old.SQL.text);
  //edilaine - SIG78760 - fim

  sMesInicio := PegaAnoMesRef(cmb_mesInicio,spn_anoInicio);
  sMesFinal  := PegaAnoMesRef(cmb_mesFinal,spn_anoFinal);
  consultarRelatorioAnaliticoPorBeneficio(sMesInicio, sMesFinal);

  vlrTotalDesembolso := 0;
  vlrTotalReembolso  := 0;
  vlrDiferenca       := 0;
  vlrTotalGlosa      := 0;

  While not qryPC.Eof do
   begin
      begin
        vlrTotalDesembolso := vlrTotalDesembolso +  qryPC.FieldByName('VALORDESEMBOLSO').AsFloat;
        vlrTotalDesembolso := vlrTotalDesembolso +  qryPC.FieldByName('ACERTODESEMBOLSO').AsFloat;
        vlrTotalReembolso  := vlrTotalReembolso  +  qryPC.FieldByName('VALORREEMBOLSO').AsFloat;
        vlrTotalGlosa      := vlrTotalGlosa      +  qryPC.FieldByName('VALORGLOSADO').AsFloat;

        qryPcINSSAnalTB.Insert;
        qryPcINSSAnalTB.FieldByName('NOME_BENEFICIO').AsString := qryPC.FieldByName('NOME_BENEFICIO').AsString;
        qryPcINSSAnalTB.FieldByName('IDPESSOA').AsString       := qryPC.FieldByName('IDPESSOA').AsString;


        if qryPC.FieldByName('NUMPROCINSS').AsString <> '' then
          qryPcINSSAnalTB.FieldByName('NUMPROCINSS').AsString    := formataNumBeneficio(qryPC.FieldByName('NUMPROCINSS').AsString)
        Else
          qryPcINSSAnalTB.FieldByName('NUMPROCINSS').AsString    := '';

        if qryPC.FieldByName('NUMDOCUMENTO').AsString <> '' then
          qryPcINSSAnalTB.FieldByName('NUMDOCUMENTO').AsString   := formataNumCPF( qryPC.FieldByName('NUMDOCUMENTO').AsString )
        Else
          qryPcINSSAnalTB.FieldByName('NUMDOCUMENTO').AsString   := '';

        qryPcINSSAnalTB.FieldByName('ESPECIE').AsString        := qryPC.FieldByName('ESPECIE').AsString;
        qryPcINSSAnalTB.FieldByName('VALORREEMBOLSO').AsFloat  := qryPC.FieldByName('VALORREEMBOLSO').AsFloat;

        if qryPC.FieldByName('VALORREEMBOLSO').AsFloat > 0 then
          qryPcINSSAnalTB.FieldByName('VALORREEMBOLSOF').AsString := FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORREEMBOLSO').AsFloat)
        Else
          qryPcINSSAnalTB.FieldByName('VALORREEMBOLSOF').AsString := '  -   ';

        qryPcINSSAnalTB.FieldByName('DESCRICAO').AsString      := qryPC.FieldByName('DESCRICAO').AsString;
        qryPcINSSAnalTB.FieldByName('VALORDESEMBOLSO').AsFloat := qryPC.FieldByName('VALORDESEMBOLSO').AsFloat;

        if qryPC.FieldByName('VALORDESEMBOLSO').AsFloat > 0 then
          qryPcINSSAnalTB.FieldByName('VALORDESEMBOLSOF').AsString := FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORDESEMBOLSO').AsFloat)
        Else
          qryPcINSSAnalTB.FieldByName('VALORDESEMBOLSOF').AsString := '  -   ';

        qryPcINSSAnalTB.FieldByName('VALORDESEMBOLSOACERTOS').AsFloat := qryPC.FieldByName('VALORDESEMBOLSO').AsFloat + qryPC.FieldByName('ACERTODESEMBOLSO').AsFloat;
        qryPcINSSAnalTB.FieldByName('DATAPAGAMENTO').AsString  := qryPC.FieldByName('DATAPAGAMENTO').AsString;
        qryPcINSSAnalTB.FieldByName('DIFDESEMBOLSO').AsFloat   := qryPC.FieldByName('DIFERENCADESEMBOLSO').AsFloat;

        if qryPC.FieldByName('DIFERENCADESEMBOLSO').AsFloat > 0 then
          qryPcINSSAnalTB.FieldByName('DIFDESEMBOLSOF').AsString := FormatFloat('###,###,##0.00',qryPC.FieldByName('DIFERENCADESEMBOLSO').AsFloat)
        Else
          qryPcINSSAnalTB.FieldByName('DIFDESEMBOLSOF').AsString := '  -   ';

        qryPcINSSAnalTB.FieldByName('VALORACERTO').AsFloat := qryPC.FieldByName('ACERTODESEMBOLSO').AsFloat;

        if qryPC.FieldByName('ACERTODESEMBOLSO').AsFloat > 0 then
          qryPcINSSAnalTB.FieldByName('VALORACERTOF').AsString := FormatFloat('###,###,##0.00',qryPC.FieldByName('ACERTODESEMBOLSO').AsFloat)
        Else
          qryPcINSSAnalTB.FieldByName('VALORACERTOF').AsString := '  -   ';

        qryPcINSSAnalTB.FieldByName('VALORGLOSADO').AsFloat    := qryPC.FieldByName('VALORGLOSADO').AsFloat;

        qryPcINSSAnalTB.FieldByName('DATAACERTO').AsString     := qryPC.FieldByName('DATAACERTO').AsString;
        qryPcINSSAnalTB.FieldByName('VALORDIFERENCA').AsFloat  := qryPC.FieldByName('VALORDIFERENCA').AsFloat;

        if qryPC.FieldByName('VALORDIFERENCA').AsFloat > 0 then
          qryPcINSSAnalTB.FieldByName('VALORDIFERENCAF').AsString  := FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORDIFERENCA').AsFloat)
        Else
          qryPcINSSAnalTB.FieldByName('VALORDIFERENCAF').AsString  := '  -   ';

        qryPcINSSAnalTB.FieldByName('DS_JUSTIFICATIVA').AsString  := qryPC.FieldByName('DS_VALORESNAOPAGO').AsString;
        qryPcINSSAnalTB.FieldByName('SINONIMO').AsString       := qryPC.fieldByName('CODSINONIMO').AsString + ' - ' + qryPC.fieldByName('SIGLA').AsString;
        qryPcINSSAnalTB.FieldByName('CENTRALIZADOR').AsString  := qryPC.fieldByName('CENTRALIZADOR').AsString;
        qryPcINSSAnalTB.FieldByName('MESREFERENCIA').AsString  := qryPC.fieldByName('DESCMESREFERENCIA').AsString;
        qryPcINSSAnalTB.Post;
      end;
      qryPC.Next;
   end;

   vlrDiferenca := vlrTotalReembolso - vlrTotalDesembolso;

   lbTotalReembolsoTB.Caption  := FormatFloat('###,###,##0.00',vlrTotalReembolso);
   lbTotalDesembolsoTB.Caption := FormatFloat('###,###,##0.00',vlrTotalDesembolso);
   lbTotalDirerencasTB.Caption := FormatFloat('###,###,##0.00',vlrDiferenca);
   lbTotalGlosasTB.Caption     := FormatFloat('###,###,##0.00',vlrTotalGlosa);

  if qryPcINSSAnalTB.IsEmpty then
   begin
    MsgDlg('Não existe prestação de contas a ser gerada.','Informação', mtInformation, [mbOk, mbHelp], 0);
    Exit;
   end;

   qryPcINSSAnalTB.IndexName := 'ORDENA';     //edilaine - SIG78760

   sArquivoAnalitico := 'C:\Planus\Temp\' + qryPC.FieldbyName('NOME_ARQUIVO').AsString;

   ppdPcINSSAnalTB.Report.TextFileName     := sArquivoAnalitico;
   ppdPcINSSAnalTB.Report.AllowPrintToFile := True;
   ppdPcINSSAnalTB.Report.ShowPrintDialog  := False;
   ppdPcINSSAnalTB.Report.DeviceType       :='PDFFile';
   ppdPcINSSAnalTB.Report.Print;

   ppdPcINSSAnalTB.Report.Template.SaveTo  := stFile;
   ppdPcINSSAnalTB.Report.Template.Format  := ftASCII;
   ppdPcINSSAnalTB.Report.Device           := dvScreen;
   //edilaine - SIG78760 - inicio
   //TFrmPreview.CreateModalPreview(Application, ppdPcINSSAnalTB.Report, 'Relatório de Prestação de Contas do INSS - Analítico Por Tipo de Benefício');
   TFrmPreviewExport.CreateModalPreviewExpPipe(Application, ppdPcINSSAnalTB.Report, 'Relatório de Prestação de Contas do INSS - Analítico Por Tipo de Benefício');

   qryPcINSSAnalTB.IndexName := '';     
   //edilaine - SIG78760 - fim

end;


procedure TfrmPrestacaoContasINSS.verificaStatusPrestacaoContas(sMesAnoInicio, sMesAnoFinal: String);
var sSql : String;
begin

  Try
    sSql :=  ' SELECT  MAX(NVL(FLGARQUIVOGERADO,0)) AS FLGARQUIVOGERADO                   '
          +  '       , MAX(NVL(PRESTACAOCONTASEFETIVADA,0)) AS PRESTACAOCONTASEFETIVADA   '
          +  '       , MAX(NVL(FLGPREVIA,0)) AS FLGPREVIA                                 '
          +  '       , MAX(NVL(FLGEFETIVADA,0)) AS FLGEFETIVADA                           '
          +  '       , MAX(NVL(FLGTIPOBENEFICIO,0)) AS FLGTIPOBENEFICIO                   '
          +  '       , MAX(NVL(FLGRETIFICADA,0)) AS FLGRETIFICADA                         '    //edilaine - SIG78760
          +  '       , COUNT(*) AS TOTAL                                                  '
          +  '   FROM CM.PRESTACAOCONTASINSS                                              '
          +  '  WHERE MESREFERENCIA = ' + QuotedStr( sMesAnoInicio );              //edilaine - SIG78760
          //+  '   AND MESREFERENCIA <= ' + QuotedStr( sMesAnoFinal );             //edilaine - SIG78760

    if FazQuery(qryAux,sSql) and (not qryAux.IsEmpty) then
     begin
       bPrestacaoContasGerada     := ( qryAux.FieldByName('TOTAL').AsInteger > 0 );
       bArquivoINSSGerado         := ( qryAux.FieldByName('FLGARQUIVOGERADO').AsString = '1' );
       bPrestacaoContasEfetivada  := ( qryAux.FieldByName('PRESTACAOCONTASEFETIVADA').AsString = '1' );
       bPrestacaoContasPrevia     := ( qryAux.FieldByName('FLGPREVIA').AsString = '1' );
       bPrestacaoContasEfetivacao := ( qryAux.FieldByName('FLGEFETIVADA').AsString = '1' );
       bPrestacaoRetificada       := ( qryAux.FieldByName('FLGRETIFICADA').AsString = '1' ) and (not bPrestacaoContasEfetivada);    //edilaine - SIG78760
     end
    Else
     begin
       bPrestacaoContasGerada     := False;
       bArquivoINSSGerado         := False;
       bPrestacaoContasEfetivada  := False;
       bPrestacaoContasPrevia     := False;
       bPrestacaoContasEfetivacao := False;
       bArquivoINSSEnviado        := False;
       bPrestacaoRetificada       := false;        //edilaine - SIG78760
    end;

    bArquivoINSSEnviado := False;     //edilaine - SIG78760

    qryAux.Close;

    if (not bPrestacaoContasGerada) then
      Exit;

    sSql :=  ' SELECT  MAX(NVL(FLGEMAILENVIADO,0)) AS FLGEMAILENVIADO   '
          +  ' FROM CM.ENVIOPRESTACAOCONTASINSS                         '
          +  ' WHERE NVL(FLGPRESTACAORETIFICADA,0) = 0                  '
          +  '   AND MESREFERENCIA = ' + QuotedStr( sMesAnoInicio );              //edilaine - SIG78760
          //+  '   AND MESREFERENCIA <= ' + QuotedStr( sMesAnoFinal );            //edilaine - SIG78760

    if FazQuery(qryAux,sSql) and (not qryAux.IsEmpty) then
       bArquivoINSSEnviado := ( qryAux.FieldByName('FLGEMAILENVIADO').AsString = '1' )
    Else
       bArquivoINSSEnviado := False;


    qryAux.Close;


  Except
    on e:Exception do
     begin
       raise;
     end;
  end;


end;

function TfrmPrestacaoContasINSS.retornaDataHoraComporNomeArquivo: String;
begin
  if FazQuery(qryAux, 'SELECT  TO_CHAR(SYSDATE,''DDMMYYYY_HH_MI_SS'') AS DATAHORA FROM DUAL') then
    result := qryAux.FieldByName('DATAHORA').AsString
  else
    result := '';

  qryAux.Close;
end;

procedure TfrmPrestacaoContasINSS.consultarRelatorioAnaliticoPorBeneficio(
  sMesAnoInicio, sMesAnoFinal: String);
var sSql : String;
begin
  Try
    sSql :=  ' SELECT P.IDPESSOA                                            '
          +  '       ,P.NOME                                                '
          +  '       ,P.NUMEROBENEFICIO AS NUMPROCINSS                      '
          +  '       ,P.NUMDOCUMENTO                                        '
          +  '       ,P.ESPECIE                                             '
          +  '       ,P.DESCRICAO                                           '
          +  '       ,NVL(B.NOME,''Não Localizado'') AS NOME_BENEFICIO      '
          +  '       ,P.SINONIMO AS CODSINONIMO                             '
          +  '       ,P.SIGLA                                               '
          +  '       ,P.SINONIMO || '' - '' || U.SIGLA AS DSSINONIMO        '
          +  '       ,UC.SINONIMO AS CENTRALIZADOR                          '
          +  '       ,P.CODORGAOLOCAL                                       '
          +  '       ,U.EMAIL                                               '
          +  '       ,P.MESREFERENCIA                                       '
          +  '       ,TRIM(TO_CHAR(TO_DATE(P.MESREFERENCIA||''/01'',''YYYY/MM/DD''),''Month'')) ||                   '
          +  '        TRIM(TO_CHAR(TO_DATE(P.MESREFERENCIA||''/01'',''YYYY/MM/DD''),''/yyyy''))AS DESCMESREFERENCIA  '
          +  '       ,P.REEMBOLSADO AS VALORREEMBOLSO                       '
          +  '       ,P.DATAPAGAMENTO AS DATAPAGAMENTO                      '
          +  '       ,P.DESEMBOLSADO AS VALORDESEMBOLSO                     '
          +  '       ,ROUND(P.DIFERENCADESEMBOLSO,2) AS DIFERENCADESEMBOLSO '
          +  '       ,P.GLOSADO AS VALORGLOSADO                             '
          +  '       ,P.ACERTODESEMBOLSO                                    '
          +  '       ,P.DATAACERTO                                          '
          +  '       ,NVL(P.DS_VALORESNAOPAGO, '' '') AS DS_VALORESNAOPAGO  '
          +  '       ,P.IDBENEFICIO                                         '
          +  '       ,ROUND(P.DIFERENCA,2) AS VALORDIFERENCA                '
          +  '       ,''ANALITICO_TB_'' ||                                  '
          +  '         SUBSTR(P.MESREFERENCIA,6,2) || ''_'' ||              '
          +  '         SUBSTR(P.MESREFERENCIA,1,4) || ''_'' ||              '
          +  '         TO_CHAR(SYSDATE,''DDMMYYYY_HH_MI_SS'') || ''.pdf''   '
          +  '        AS NOME_ARQUIVO                                       '
          +  ' FROM CM.PRESTACAOCONTASINSS P                                '
          +  '    , CM.UFINSS U                                             '
          +  '    , CM.UFINSS UC                                            '
          +  '    , CM.BENEFICIO B                                          '
          +  ' WHERE P.SINONIMO  = U.SINONIMO                               '
          +  '   AND U.SIGLACENTRAL = UC.SIGLA                              '
          +  '   AND ( ( NVL(P.IDBENEFICIO,0) = B.IDBENEFICIO ) OR          '
          +  '         ( NVL(P.ESPECIE,0) = B.CODBENEFICIO    ) )           '
          +  '   AND P.MESREFERENCIA = ' + QuotedStr( sMesAnoInicio )               //edilaine - SIG78760
//          +  '   AND P.MESREFERENCIA <= ' + QuotedStr( sMesAnoFinal )             //edilaine - SIG78760
//          +  '   AND U.SINONIMO <> 129893                                   '
          +  '   AND UC.SINONIMO <> 156787                                  ';

          //edilaine - SIG78760 - inicio
          if Trim(lstNB.Text) <> '' then
             sSql := sSql +'   AND P.NUMEROBENEFICIO IN (  '+lstNB.Text +') ';

          sSql := sSql    //edilaine - SIG78760 - fim
          +  ' ORDER BY NOME_BENEFICIO                                      '
          +  '      , DSSINONIMO                                            '
          +  '      , CENTRALIZADOR                                         '
          +  '      , ABS(NVL(P.DIFERENCA,0))                              '
          +  '      , DS_VALORESNAOPAGO                                     '
          +  '      , ESPECIE                                               '
          +  '      , NUMPROCINSS                                           '
          +  '      , NUMDOCUMENTO                                          '
          +  '      , VALORREEMBOLSO                                        '
          +  '      , VALORDESEMBOLSO                                       ';
          

    FazQuery(qryPC, ssql);

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

procedure TfrmPrestacaoContasINSS.consultarRelatorioSinteticoPorBeneficio(
  sMesAnoInicio, sMesAnoFinal: String);
var sSql : String;
begin
  Try
    sSql :=  ' SELECT P.MESREFERENCIA AS MESCOMPETENCIA               '
          +  '      , P.SINONIMO                                      '
          +  '      , P.SIGLA AS UF                                   '
          +  '      , B.NOME AS NOME_BENEFICIO                        '
          +  '      , TO_CHAR(MAX(P.TRGDTINCLUSAO),''dd/mm/yyyy'') AS  DATAENVIO '
          +  '      , P.SINONIMO AS EXECUTOR                          '
          +  '      , UC.SINONIMO AS CENTRALIZADOR                    '
          +  '      , SUM(P.REEMBOLSADO) AS VALORREEMBOLSADO          '
          +  '      , SUM(P.DESEMBOLSADO) AS VALORDESEMBOLSADO        '
          +  '      , SUM(P.ACERTODESEMBOLSO) AS ACERTODESEMBOLSO     '
          +  '      , SUM(P.GLOSADO) AS VALORGLOSADO                  '
          +  '      , SUM(P.DIFERENCA) AS VALORDIFERENCA              '
          +  '      ,''SINTETICO_TB_'' ||                                         '
          +  '         SUBSTR(P.MESREFERENCIA,6,2) || ''_'' ||                    '
          +  '         SUBSTR(P.MESREFERENCIA,1,4) || ''_'' ||                    '
          +  '         TO_CHAR(SYSDATE,''DDMMYYYY_HH_MI_SS'') || ''.pdf''         '
          +  '        AS NOME_ARQUIVO                                             '
          +  ' FROM CM.PRESTACAOCONTASINSS P                          '
          +  '    , CM.UFINSS U                                       '
          +  '    , CM.UFINSS UC                                      '
          +  '    , CM.BENEFICIO B                                    '
          +  ' WHERE P.SINONIMO  = U.SINONIMO                         '
          +  '   AND U.SIGLACENTRAL = UC.SIGLA                        '
          +  ' AND ( ( NVL(P.IDBENEFICIO,0) = B.IDBENEFICIO )  OR     '
          +  '       ( NVL(P.ESPECIE,0) = B.CODBENEFICIO    ) )       '
          +  '   AND P.MESREFERENCIA =  ' + QuotedStr( sMesAnoInicio )               //edilaine - SIG78760
//          +  '   AND P.MESREFERENCIA <=  ' + QuotedStr( sMesAnoFinal )             //edilaine - SIG78760
//          +  '   AND U.SINONIMO <> 129893                             '
          +  '   AND UC.SINONIMO <> 156787                            '
          +  '   GROUP BY B.NOME                                      '
          +  '      , P.MESREFERENCIA                                 '
          +  '      , P.SINONIMO                                      '
          +  '      , P.SIGLA                                         '
          +  '      , UC.SINONIMO                                     '
          +  ' ORDER BY NOME_BENEFICIO                                '
          +  '      , SINONIMO                                        '
          +  '      , CENTRALIZADOR                                   '
          +  '      , VALORREEMBOLSADO                                '
          +  '      , VALORDESEMBOLSADO                               ';

    FazQuery(qryPC, ssql);

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

procedure TfrmPrestacaoContasINSS.gerarRelatorioSinteticoPorBeneficio;
var sMesInicio,sMesFinal,sNomeArquivo : String;
    sEndereco, sAssunto, sMensagem, sAnexo: String;
    vlrTotalDesembolso, vlrTotalReembolso, vlrDiferenca, vlrTotalGlosa: real;
begin

  qryPcINSSSintTB.Close;
  qryPcINSSSintTB.Open;
  qryPcINSSSintTB.First;

  sMesInicio := PegaAnoMesRef(cmb_mesInicio,spn_anoInicio);
  sMesFinal  := PegaAnoMesRef(cmb_mesFinal,spn_anoFinal);

  consultarRelatorioSinteticoPorBeneficio(sMesInicio, sMesFinal);

  vlrTotalDesembolso := 0;
  vlrTotalReembolso  := 0;
  vlrDiferenca       := 0;
  vlrTotalGlosa      := 0;

  While not qryPC.Eof do
   begin
      begin
        vlrTotalDesembolso := vlrTotalDesembolso +  qryPC.FieldByName('VALORDESEMBOLSADO').AsFloat;
        vlrTotalDesembolso := vlrTotalDesembolso +  qryPC.FieldByName('ACERTODESEMBOLSO').AsFloat;
        vlrTotalReembolso  := vlrTotalReembolso  +  qryPC.FieldByName('VALORREEMBOLSADO').AsFloat;
        vlrTotalGlosa      := vlrTotalGlosa      +  qryPC.FieldByName('VALORGLOSADO').AsFloat;

        qryPcINSSSintTB.Insert;
        qryPcINSSSintTB.FieldByName('MESCOMPETENCIA').AsString   := qryPC.FieldByName('MESCOMPETENCIA').AsString;
        qryPcINSSSintTB.FieldByName('SINONIMO').AsString         := qryPC.FieldByName('SINONIMO').AsString;
        qryPcINSSSintTB.FieldByName('UF').AsString               := qryPC.FieldByName('UF').AsString;
        qryPcINSSSintTB.FieldByName('NOME_BENEFICIO').AsString   := qryPC.FieldByName('NOME_BENEFICIO').AsString;
        qryPcINSSSintTB.FieldByName('DATAENVIO').AsString        := qryPC.FieldByName('DATAENVIO').AsString;
        qryPcINSSSintTB.FieldByName('EXECUTOR').AsString         := qryPC.FieldByName('EXECUTOR').AsString;
        qryPcINSSSintTB.FieldByName('CENTRALIZADOR').AsString    := qryPC.FieldByName('CENTRALIZADOR').AsString;
        qryPcINSSSintTB.FieldByName('VALORREEMBOLSADO').AsString := 'R$ ' + FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORREEMBOLSADO').AsFloat);
        qryPcINSSSintTB.FieldByName('VALORDESEMBOLSADO').AsString:= 'R$ ' + FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORDESEMBOLSADO').AsFloat);
        qryPcINSSSintTB.FieldByName('VALORGLOSADO').AsString     := 'R$ ' + FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORGLOSADO').AsFloat);
        qryPcINSSSintTB.FieldByName('VALORDIFERENCA').AsString   := 'R$ ' + FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORDIFERENCA').AsFloat);
        qryPcINSSSintTB.FieldByName('AGRUPADOR').AsInteger       := 1;

        qryPcINSSSintTB.Post;
      end;
      qryPC.Next;
   end;

  vlrDiferenca := vlrTotalReembolso - vlrTotalDesembolso;

  lbTotalReembolsoSintTB.Caption  := 'R$ ' + FormatFloat('###,###,##0.00',vlrTotalReembolso);
  lbTotalDesembolsoSintTB.Caption := 'R$ ' + FormatFloat('###,###,##0.00',vlrTotalDesembolso);
  lbTotalDirerencasSintTB.Caption := 'R$ ' + FormatFloat('###,###,##0.00',vlrDiferenca);
  lbTotalGlosasSintTB.Caption     := 'R$ ' + FormatFloat('###,###,##0.00',vlrTotalGlosa);

  if qryPcINSSSintTB.IsEmpty then
   begin
    MsgDlg('Não existe prestação de contas a ser gerada.','Informação', mtInformation, [mbOk, mbHelp], 0);
    Exit;
   end;

   sNomeArquivo := 'C:\Planus\Temp\' + qryPC.FieldbyName('NOME_ARQUIVO').AsString;

   ppdPcINSSSintTB.Report.TextFileName     := sNomeArquivo;
   ppdPcINSSSintTB.Report.AllowPrintToFile := True;
   ppdPcINSSSintTB.Report.ShowPrintDialog  := False;
   ppdPcINSSSintTB.Report.DeviceType       :='PDFFile';
   ppdPcINSSSintTB.Report.Print;

   ppdPcINSSSintTB.Report.Template.SaveTo  := stFile;
   ppdPcINSSSintTB.Report.Template.Format  := ftASCII;
   ppdPcINSSSintTB.Report.Device           := dvScreen;
   //edilaine - SIG78760 - inicio
   //TFrmPreview.CreateModalPreview(Application, ppdPcINSSSintTB.Report, 'Relatório de Prestação de Contas do INSS - Sintetico - Tipo de Benefício');
   TFrmPreviewExport.CreateModalPreviewExpPipe(Application, ppdPcINSSSintTB.Report, 'Relatório de Prestação de Contas do INSS - Sintetico - Tipo de Benefício');
   //edilaine - SIG78760 - fim

end;

procedure TfrmPrestacaoContasINSS.gerarArquivoINSSeEnviarEmail;
var sMesInicio,sMesFinal, sSinonimo : String;
    sEndereco, sAssunto, sMensagem, sAnexo: String;          
    bArquivoGerado: boolean;
begin

  //edilaine - SIG78760 - inicio
  {if Trim(edtNomeResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o nome do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  if Trim(edtCPFResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o CPF do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  if Trim(edtCargoResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o Cargo do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;
   }//edilaine - SIG78760 - fim

  consultarOrgaosINSS();

  if qryOrgaosINSS.IsEmpty then
   begin
    MsgDlg('Não existe prestação de contas a ser gerada.','Informação', mtInformation, [mbOk], 0);
    Exit;
   end;

  sMesInicio := PegaAnoMesRef(cmb_mesInicio,spn_anoInicio);
  sMesFinal  := PegaAnoMesRef(cmb_mesFinal,spn_anoFinal);


  verificaStatusPrestacaoContas(sMesInicio,sMesFinal);

  if not bPrestacaoContasGerada then
   begin
     MsgDlg('Não é possível enviar e-mails pois não existe prestação de contas para o período e parâmetros informados.','Informação', mtInformation, [mbOk], 0);
     Exit;
   end;

  if not bPrestacaoContasEfetivada then
   begin
     MsgDlg('Não é possível enviar e-mails pois a prestação de contas ainda não foi efetivada.','Informação', mtInformation, [mbOk], 0);

     Exit;
   end;

  if not bPrestacaoContasEfetivacao then
   begin
     MsgDlg('Não é possível enviar e-mails pois não existe prestação de contas gerada pela efetivação para o período e parâmetros informados.','Informação', mtInformation, [mbOk], 0);
     Exit;
   end;

  bbtnEnviar.Enabled := False;

  bArquivoGerado := False;

  //edilaine - SIG78760 - inicio
  if Copy(UpperCase(Sistema.AliasServidor),1,8) <> 'PRODUCAO' then  //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
  begin
    sEndereco := RetornarEmailUsuario(true);
  end;
  //edilaine - SIG78760 - fim

  Try
    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

    While not qryOrgaosINSS.Eof do
     begin
        begin
         sSinonimo := qryOrgaosINSS.FieldByName('SINONIMO').AsString;

         consultarArquivosGeradosParaEnvioINSS(sSinonimo,sMesInicio,sMesFinal);

         While not qryPCEnvio.Eof do
          begin
             bArquivoGerado := True;

             //edilaine - SIG78760 - inicio
             if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then   //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
                sEndereco := qryPCEnvio.FieldByName('EMAIL').AsString;
             //edilaine - SIG78760 - fim

             sAssunto  := qryPCEnvio.FieldByName('ASSUNTO').AsString;

             consultaTextoEmailUF(qryPCEnvio.FieldByName('SIGLA').AsString
                                 ,qryPCEnvio.FieldByName('MESREFERENCIA').AsString);

             sAnexo := retornaPathArquivo(qryPCEnvio.FieldByName('IDARQUIVOANALITICO').AsInteger
                                         ,qryPCEnvio.FieldByName('MESREFERENCIA').AsString);

             enviarEmailOutlook(sEndereco, sAssunto, sAnexo);

             //edilaine - SIG78760 - inicio
             if (lowercase(edtNomeResponsavel.text) = 'teste') and (Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO') then //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
                exit;
             //edilaine - SIG78760 - fim

             marcarArquivoEnviadoINSS(qryPCEnvio.FieldByName('SIGLA').AsString
                                     ,qryPCEnvio.FieldByName('MESREFERENCIA').AsString
                                     ,sSinonimo);               //edilaine - SIG78760

             qryPCEnvio.Next;

          end;

         qryPCEnvio.Close;

         qryOrgaosINSS.Next;
        end;
     end;


    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;


  Except
    on e: Exception do
     begin
        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Erro ao enviar prestação de contas.' + #13 + 'Erro: ' + e.Message,'Erro',mtError, [mbOk, mbHelp], 0);
        bbtnCancelar.Enabled := True;
        bbtnEnviar.Enabled   := True;
        Exit;
     end;
  end;

  if bArquivoGerado then
   begin
    MsgDlg('Arquivo(s) de prestação de contas enviados com sucesso.','Informação', mtInformation, [mbOk], 0);
    bbtnEnviar.Enabled       := False;
    bbtnEfetivar.Enabled     := False;
    bbtnGerarArquivo.Enabled := False;
    bbtnConfirmar.Enabled    := False;
    //edilaine - SIG78760 - inicio
    //bbtnRetificar.Enabled    := True;
    rbOpcRelRetificadoSIM.enabled := true;
    //edilaine - SIG78760 - inicio
    bbtnCancelar.Enabled     := True;
   end
  Else
   begin
    MsgDlg('Não é possível enviar arquivos pois não existe prestação de contas para o período e parâmetros informados.','Informação', mtInformation, [mbOk], 0);
   end;

  bbtnCancelar.Enabled := True;

end;

procedure TfrmPrestacaoContasINSS.bbtnEfetivarClick(Sender: TObject);
begin
  inherited;
  if pnProcessando.Visible then
   Exit;

  bbtnCancelar.Enabled  := False;

  efetivarPrestacaoContas();
end;

procedure TfrmPrestacaoContasINSS.efetivarPrestacaoContas;
var sSql, sMesInicio,sMesFinal, sSinonimo : String;
begin

  sMesInicio := PegaAnoMesRef(cmb_mesInicio,spn_anoInicio);
  sMesFinal  := PegaAnoMesRef(cmb_mesFinal,spn_anoFinal);


  verificaStatusPrestacaoContas(sMesInicio,sMesFinal);

  if not bPrestacaoContasGerada then
   begin
     MsgDlg('Não é possível efetivar pois não existe prestação de contas para o período e parâmetros informados.','Informação', mtInformation, [mbOk], 0);
     Exit;
   end;

  if not bArquivoINSSGerado then
   begin
     MsgDlg('Não é possível efetivar pois não existem arquivos de prestação de contas gerados para o período e parâmetros informados.','Informação', mtInformation, [mbOk], 0);
     Exit;
   end;

  if MsgDlg('Deseja efetivar a prestação de contas mensal do INSS para o período e parâmetros informados na interface?','Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo Then
    Exit;

  Try
    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

    sSql :=  ' UPDATE CM.PRESTACAOCONTASINSS      '
          +  ' SET PRESTACAOCONTASEFETIVADA = 1   '
          +  '    ,FLGRETIFICADA = 0              '
          +  ' WHERE MESREFERENCIA = ' + QuotedStr( sMesInicio );               //edilaine - SIG78760
//          +  '   AND MESREFERENCIA <= ' + QuotedStr( sMesFinal );             //edilaine - SIG78760

    qryAux.sql.Text := ssql;
    qryAux.ExecSQL;

    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;

    MsgDlg('Prestação de contas efetivada com sucesso.','Informação', mtInformation, [mbOk], 0);

    bbtnEnviar.Enabled   := True;
    bbtnEfetivar.Enabled     := False;
    bbtnGerarArquivo.Enabled := False;
    bbtnCancelar.Enabled := True;


  Except
    on e: Exception do
     begin
        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Erro ao efetivar prestação de contas.' + #13 + 'Erro: ' + e.Message,'Erro',mtError, [mbOk, mbHelp], 0);
        bbtnCancelar.Enabled := True;
     end;
  end;

end;


procedure TfrmPrestacaoContasINSS.bbtnRetificarClick(Sender: TObject);
begin
  inherited;
  if pnProcessando.Visible then
   Exit;

  bbtnCancelar.Enabled  := False;

  rbOpcaoAnalitico.checked := true;      //edilaine - SIG78760

  retificarPrestacaoContas();
end;

procedure TfrmPrestacaoContasINSS.retificarPrestacaoContas;
var sMesRef: string;
   sMesInicio,sMesFinal : String;
   iIdRetifica : integer;              //edilaine - SIG78760
begin

  if Trim(edtNomeResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o nome do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  if Trim(edtCPFResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o CPF do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  if Trim(edtCargoResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o Cargo do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  //edilaine - SIG78760 - inicio
  {if rbOpcRelRetificadoNAO.Checked then
   begin
      MsgDlg('Opção ''Emitir Relatório Retificado'' não selecionada','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  if rbOpcRelEfetivacaoNAO.Checked then
   begin
      MsgDlg('Não é possível retificar prestação de contas com informações da prévia.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;
  }//edilaine - SIG78760 - fim

  if MsgDlg('Deseja retificar a prestação de contas mensal do INSS para o período e parâmetros informados na interface?','Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo Then
    Exit;

  consultarOrgaosINSS();

  if qryOrgaosINSS.IsEmpty then
   begin
    MsgDlg('Não existe prestação de contas a ser gerada.','Informação', mtInformation, [mbOk], 0);
    Exit;
   end;

  Try
    frmPrestacaoContasINSSMotivo := TfrmPrestacaoContasINSSMotivo.Create(Self);
    frmPrestacaoContasINSSMotivo.ShowModal;
    sMotivoRetificacao := frmPrestacaoContasINSSMotivo.memoMotivo.Lines.Text;
    if frmPrestacaoContasINSSMotivo.ModalResult <> mrOK then
      Exit;
  Finally
    FreeAndNil(frmPrestacaoContasINSSMotivo);
  end;

  bbtnGerarArquivo.Enabled := false;
  bbtnEnviar.Enabled       := false;
  bbtnEfetivar.Enabled     := false;
  bbtnConfirmar.Enabled    := false;
  bbtnRetificar.Enabled    := false;

  qryOrgaosINSS.Close;


  Try
    bbtnCancelar.Enabled  := False;
    pnProcessando.Visible := True;
    ProgressBar.Min       := 0;
    ProgressBar.Max       := 0;
    ProgressBar.step      := 1;
    ProgressBar.Position  := 0;

  Try

    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

    sMesInicio := PegaAnoMesRef(cmb_mesInicio,spn_anoInicio);
    sMesFinal  := PegaAnoMesRef(cmb_mesFinal,spn_anoFinal);

    {historico dos lançamentos que serão retificados}
    RegistraLancamentosParaRetificar(trGrava, sMesInicio, sMesFinal, sMotivoRetificacao, iIdRetifica);      //edilaine - SIG78760

    apagarPrestacaoContas(sMesInicio, sMesFinal);

    if bCancelarOperacao then
      raise Exception.Create('Operação cancelada pelo usuário');

    qryPC.Close;

    //edilaine - SIG78760 - inicio
    {if rbOpcRelPreviaSIM.Checked or rbOpcRelPreviaTipoBenefSIM.Checked then
       gerarPrestacaoContas( tpPrevia, sMesInicio, sMesFinal, true)
    Else if rbOpcRelTipoBenefEfetivacaoSIM.Checked or rbOpcRelEfetivacaoSIM.Checked then
       gerarPrestacaoContas( tpEfetivacao, sMesInicio, sMesFinal, true);    }

    gerarPrestacaoContas( tpEfetivacao, sMesInicio, sMesFinal, true);
    //edilaine - SIG78760 - fim

    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;

    bbtnRetificar.Enabled := False;


  Except
    on e: Exception do
     begin
        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.RollBack;
        if ( e.Message = 'Operação cancelada pelo usuário' ) then
           MsgDlg('Operação cancelada pelo usuário','Aviso',mtInformation, [mbOk, mbHelp], 0)
        Else
           MsgDlg('Erro ao retificar prestação de contas.' + #13 + 'Mensagem: ' + e.Message,'Erro',mtError, [mbOk, mbHelp], 0);

        bbtnCancelar.Enabled := True;
        Exit;
     end;
  end;

  Finally
    pnProcessando.Visible := False;
    ProgressBar.Min       := 0;
    ProgressBar.Max       := 0;
    ProgressBar.step      := 1;
    ProgressBar.Position  := 0;
  end;

  if qryPC.IsEmpty then
   begin
    MsgDlg('Não existe prestação de contas a ser gerada.','Informação', mtInformation, [mbOk, mbHelp], 0);
    Exit;
   end;

  if {rbOpcRelTipoBenefEfetivacaoSIM.Checked or} rbOpcRelEfetivacaoSIM.Checked then          //edilaine - SIG78760
    bbtnGerarArquivo.Enabled := True;

  //edilaine - SIG78760 - inicio
  {if rbOpcaoAnalitico.Checked and rbOpcRelPreviaSIM.Checked and rbOpcRelPreviaTipoBenefSIM.Checked  then
     gerarRelatorioAnaliticoPorBeneficio()
  Else if rbOpcaoAnalitico.Checked and rbOpcRelEfetivacaoSIM.Checked and rbOpcRelTipoBenefEfetivacaoSIM.Checked  then
     gerarRelatorioAnaliticoPorBeneficio()
  Else if rbOpcaoAnalitico.Checked and rbOpcRelPreviaSIM.Checked  then
     gerarRelatorioAnalitico()
  Else if rbOpcaoAnalitico.Checked and rbOpcRelEfetivacaoSIM.Checked  then
     gerarRelatorioAnalitico()
  Else if rbOpcaoSintetico.Checked and rbOpcRelPreviaSIM.Checked and rbOpcRelPreviaTipoBenefSIM.Checked  then
     gerarRelatorioSinteticoPorBeneficio()
  Else if rbOpcaoSintetico.Checked and rbOpcRelEfetivacaoSIM.Checked and rbOpcRelTipoBenefEfetivacaoSIM.Checked  then
     gerarRelatorioSinteticoPorBeneficio()
  Else if rbOpcaoSintetico.Checked and rbOpcRelPreviaSIM.Checked  then
     gerarRelatorioSintetico()
  Else if rbOpcaoSintetico.Checked and rbOpcRelEfetivacaoSIM.Checked  then
     gerarRelatorioSintetico();   }

  if rbOpcaoAnalitico.Checked then
     gerarRelatorioAnalitico()
  else if rbOpcaoSintetico.Checked then
     gerarRelatorioSintetico();
  //edilaine - SIG78760 - fim

  bbtnCancelar.Enabled := True;


end;

procedure TfrmPrestacaoContasINSS.marcarEnvioPrestacoesContasComoRetificadas(sMesAnoInicio, sMesAnoFinal: String);
var sSql : String;
begin
  Try
    sSql :=  ' UPDATE CM.ENVIOPRESTACAOCONTASINSS      '
          +  ' SET FLGPRESTACAORETIFICADA = 1          '
          +  ' WHERE MESREFERENCIA = ' + QuotedStr( sMesAnoInicio );               //edilaine - SIG78760
          //+  '   AND MESREFERENCIA <= ' + QuotedStr( sMesAnoFinal );             //edilaine - SIG78760

    qryAux.sql.Text := ssql;
    qryAux.ExecSQL;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

function TfrmPrestacaoContasINSS.retornaValorAcertoDesembolsoPrevia(sNumProcINSS, sMesRef: String; var sDtAcerto: String): real;
var sSql : String;
begin

  sSql :=  ' SELECT SUM(DECODE(P.FLGDESCONTO, 0, P.VALORRECEBIDO, 1, -P.VALORRECEBIDO))  AS VALORRECEBIDO  '
        +  '       ,MAX(P.DATAPAGAMENTO) AS DATAPAGAMENTO  '
        +  ' FROM CM.PREVIA P                              '
        +  '     ,PROVDESC PD                              '
        +  ' WHERE P.IDRUBRICA = PD.IDPROVENTO             '
        +  '  AND P.FONTEPAGADORA = 2                      '
        +  '  AND SUBSTR(P.CODPROVDESC,3,3) <> ''280''     '
        +  '  AND P.NUMPROCINSS  = ' + QuotedStr(sNumProcINSS)
        +  '  AND P.MESCOMPREEM  = ' + QuotedStr(sMesRef)
        +  '  AND P.MESCOBRANCA <> ' + QuotedStr(sMesRef);

  if FazQuery(qryAux, ssql) then
   begin
    Result    := qryAux.FieldByName('VALORRECEBIDO').AsFloat;
    sDtAcerto := qryAux.FieldByName('DATAPAGAMENTO').AsString;
   end
  Else
   begin
    Result    := 0;
    sDtAcerto := '';
   end;

end;

function TfrmPrestacaoContasINSS.retornaJustificativaDiferenca: String;
var sSql, sJustificativa: String;
    iQtdRetorno, iQtdTempDesc, iQtdDetConc: Integer;
//    Num : TStringList;
begin
  ///douglas.siqueira inicio
  with TStringList.Create do
  begin
    Clear;
    Add('0439581354');  Add('0439581346');  Add('1155466966');
    Add('1148378437');  Add('1055271748');  Add('1158046429');
    Add('1127127117');  Add('1158046356');  Add('1159608404');
    Add('1158046933');  Add('1148378488');  Add('1159608366');
    Add('1159607092');  Add('1161631221');  Add('1159608331');
    Add('0760031738');  Add('1188744396');  Add('0255418973');
    Add('1161631302');  Add('1159608340');  Add('1159608390');
    Add('1159607009');  Add('1167203710');  Add('1120278969');
    Add('1159608412');  Add('1161631310');  Add('0471024902');
    Add('1148378232');  Add('1148378186');  Add('1161631280');
    Add('1148378461');  Add('1159608544');  Add('1109833684');
    Add('1158046267');  Add('1120279337');  Add('1072255208');
    Add('1159607025');  Add('1190976428');  Add('1159606991');
    Add('1106062334');  Add('1228081783');  Add('1084476034');
    Add('1158046704');  Add('1148378194');  Add('1530585748');

    try
      if IndexOf(qryPC.FieldByName('NUMPROCINSS').AsString ) > -1 then      //edilaine - SIG78760
      begin
        Result := '3 - Outros (Benefício de Pensão Alimentícia / Recebe PA).';
        Exit;
       end;
    finally
      Destroy;
    end;
  end;

  //edilaine - SIG78760 inicio
  if ( qryPC.FieldByName('ESPECIE').AsString = '25'  ) or
     ( qryPC.FieldByName('ESPECIE').AsString = '31'  ) or
     ( qryPC.FieldByName('ESPECIE').AsString = '47'  ) or
     ( qryPC.FieldByName('ESPECIE').AsString = '80'  ) or
     ( qryPC.FieldByName('ESPECIE').AsString = '91'  ) or
     ( qryPC.FieldByName('ESPECIE').AsString = '94'  ) or
     ( qryPC.FieldByName('ESPECIE').AsString = '95'  ) then
   begin
    Result := '3 - Outros (Benefício Não Pertence ao Convênio)';
    Exit;
   end;

   //sJustificativa := '';
   //edilaine - SIG78760 fim

   if qryPC.FieldByName('CODMANTENEDORA').AsString = '99' then
    begin
     Result := '3 - Outros (Benefício Não Identificado).';
     Exit;
    end;

   if qryPC.FieldByName('DESCRICAO').AsString = '4- PAB' then
    begin
     Result := '3 - Outros (Pagamento Alternativo de Benefícios - PAB).';
     Exit;
    end;


   if qryPC.FieldByName('DESCRICAO').AsString = '1- Concessão' then
    begin
     Result := '3 - Outros (Benefício Novo no Convênio).';
     Exit;
    end;


   if qryPC.FieldByName('DESCRICAO').AsString = '9- Glosa' then
    begin
     Result := '3 - Outros (Glosa INSS)';
     Exit;
    end;


   if qryPC.FieldByName('NUMPROCINSS').AsString='0439' then
    begin
     Result := '3 - Outros (Glosa INSS)';
     Exit;
    end;




   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM PESSOAFISICA             '
              + ' WHERE IDPESSOA = ' + qryPC.FieldByName('IDPESSOA').AsString
              + '   AND DATAMORTE IS NOT NULL   ';

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         Result := '1 - Óbito.';
         Exit;
        end;

    end;

   sSql :=  ' SELECT COUNT(*) AS TOTAL    '
          + ' FROM TEMPCONCINSS DC        '
          + ' WHERE NUMPROCINSS = '    + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
          + '  AND MESPROCESSAMENTO = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString );

   if FazQuery(qryAux,sSql) then
     iQtdTempDesc := qryAux.FieldByName('TOTAL').AsInteger;

  qryAux.Close;

  if iQtdTempDesc >0 then
   begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL    '
              + ' FROM DETCONCINSS DC        '
              + ' WHERE NUMPROCINSS = '    + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '  AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString );

      if FazQuery(qryAux,sSql) then
         iQtdDetConc := qryAux.FieldByName('TOTAL').AsInteger;

      qryAux.Close;
   end;

   if (iQtdTempDesc > 0) and (iQtdDetConc = 0 ) then
    begin
     Result := '3 - Outros (Benefício Não Identificado).';
     Exit;
    end;


   // 36640 -  CODPROVDESC =  3093
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''36640'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         Result := '3 - Outros (Valor Abatido da Dívida).';
         Exit;
        end;
    end;

   // 36605 -  CODPROVDESC =  1093
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''36605'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         Result := '3 - Outros (Valor Anterior Provisionado na Competência).';
         Exit;
        end;
    end;




//------------------------------------------------------------
   // 38578 -  CODPROVDESC =  350504
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''38578'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2216 / 350504 - Empréstimo Consignado.';
         Result := '3 - Outros (Empréstimo Consignado).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 38580 -  CODPROVDESC =  2216
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''38580'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2216 / 350504 - Empréstimo Consignado.';
         Result := '3 - Outros (Empréstimo Consignado).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;




   // 39767 -  CODPROVDESC =  338604
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''39767'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2203 / 338604 - Complemento Negativo.';
         Result := '3 - Outros (Complemento Negativo).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;

   // 36634 -  CODPROVDESC =  2203
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''36634'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2203 / 338604 - Complemento Negativo.';
         Result := '3 - Outros (Complemento Negativo).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 39769 -  CODPROVDESC =  338704
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''39769'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2214 / 338704 - Complemento Negativo 13º.';
         Result := '3 - Outros (Complemento Negativo 13º).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 39054 -  CODPROVDESC =  2214
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''39054'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2214 / 338704 - Complemento Negativo 13º.';
         Result := '3 - Outros (Complemento Negativo 13º).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 39815 -  CODPROVDESC =  339104
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''39815'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2223 / 339104 - Contribuição Força Sindical.';
         Result := '3 - Outros (Contribuição Força Sindical).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 39266 -  CODPROVDESC =  2223
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''39266'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2223 / 339104 - Contribuição Força Sindical.';
         Result := '3 - Outros (Contribuição Força Sindical).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;



   // 39817 -  CODPROVDESC =  339204
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''39817'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2229 / 339204 - Contribuição CUT.';
         Result := '3 - Outros (Contribuição CUT).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 39389 -  CODPROVDESC =  2229
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''39389'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2229 / 339204 - Contribuição CUT.';
         Result := '3 - Outros (Contribuição CUT).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 36033 -  CODPROVDESC =  220104
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''36033'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2118 / 220104 - Adicional de 25 Invalidez.';
         Result := '3 - Outros (Adicional de 25 Invalidez).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 36629 -  CODPROVDESC =  2118
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''36629'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2118 / 220104 - Adicional de 25 Invalidez.';
         Result := '3 - Outros (Adicional de 25 Invalidez).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;



   // 38365 -  CODPROVDESC =  122704
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''38365'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - fim
         //Result := '2144 / 122704 - Parcela de Revisão de IRSM';
         Result := '3 - Outros (Parcela de Revisão de IRSM).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 38358 -  CODPROVDESC =  2144
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''38358'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2144 / 122704 - Parcela de Revisão de IRSM';
         Result := '3 - Outros (Parcela de Revisão de IRSM).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 38549 -  CODPROVDESC =  440104
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''38549'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2202 / 440104 - Pensão Alimentícia.';
         Result := '3 - Outros (Pensão Alimentícia).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 36633 -  CODPROVDESC =  2202
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''36633'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2202 / 440104 - Pensão Alimentícia.';
         Result := '3 - Outros (Pensão Alimentícia).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 38551 -  CODPROVDESC =  440204
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''38551'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2210 / 440204 - Pensão Alimentícia 13º.';
         Result := '3 - Outros (Pensão Alimentícia 13º).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;



   // 36636 -  CODPROVDESC =  2210
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''36636'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2210 / 440204 - Pensão Alimentícia 13º.';
         Result := '3 - Outros (Pensão Alimentícia 13º).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 39265 -  CODPROVDESC =  2219
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''39265'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2219 / 341904 - Contribuição COBAP.';
         Result := '3 - Outros (Contribuição COBAP).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 40060 -  CODPROVDESC =  341504
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''40060'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2231 / 341504 - Desconto Antecipação de Renda.';
         Result := '3 - Outros (Desconto Antecipação de Renda).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 40054 -  CODPROVDESC =  2231
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''40054'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2231 / 341504 - Desconto Antecipação de Renda.';
         Result := '3 - Outros (Desconto Antecipação de Renda).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 40065 -  CODPROVDESC =  141704
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''40065'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2105 / 141704 - Salário Família';
         Result := '3 - Outros (Salário Família).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;

   // 36628 -  CODPROVDESC =  2105
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''36628'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2105 / 141704 - Salário Família';
         Result := '3 - Outros (Salário Família).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 40063 -  CODPROVDESC =  141604
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''40063'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2102 / 141604 - Complemento de Renda Mensal';
         Result := '3 - Outros (Complemento de Renda Mensal).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;


   // 36626 -  CODPROVDESC =  2102
   if not qryPC.FieldByName('IDPESSOA').IsNull then
    begin
       sSql :=  ' SELECT COUNT(*) AS TOTAL      '
              + ' FROM DETCONCINSS              '
              + ' WHERE NUMPROCINSS = ' + QuotedStr( qryPC.FieldByName('NUMPROCINSS').AsString )
              + '   AND IDRUBRICA   = ''36626'' '
              + '   AND MESCOBRANCA = '+ QuotedStr( qryPC.FieldByName('MESREFERENCIA').AsString )
              + '   AND CODSINONIMO = '+ QuotedStr( qryPC.FieldByName('CODSINONIMO').AsString );

       if FazQuery(qryAux,sSql) then
         iQtdRetorno := qryAux.FieldByName('TOTAL').AsInteger;

       if (iQtdRetorno > 0) then
        begin
         //edilaine - SIG78760 - inicio
         //Result := '2102 / 141604 - Complemento de Renda Mensal';
         Result := '3 - Outros (Complemento de Renda Mensal).';
         //edilaine - SIG78760 - fim
         Exit;
        end;
    end;

///douglas.siqueira fim

end;

function TfrmPrestacaoContasINSS.retornaTotalRegistrosPrestacaoContas(sMesAnoInicio, sMesAnoFinal: String): Integer;
var sSql : String;
begin
  Try

    sSql :=  'SELECT COUNT(*) AS TOTAL FROM                                                            '
          +  '(                                                                                        '
          +  'SELECT IDPESSOA                                                                          '
          +  '      , NOME                                                                             '
          +  '      , NUMPROCINSS                                                                      '
          +  '      , NUMDOCUMENTO                                                                     '
          +  '      , IDBENEFICIO                                                                      '
          +  '      , ESPECIE                                                                          '
          +  '      , CASE                                                                             '
          +  '           WHEN INICIALRUBRICA = ''1'' THEN ''1- Concessão''                             '
          +  '           WHEN INICIALRUBRICA = ''2'' THEN ''2- Manutenção''                            '
          +  '           WHEN INICIALRUBRICA = ''4'' THEN ''4- PAB''                                   '
          +  '           WHEN INICIALRUBRICA = ''9'' THEN ''9- Glosa''                                 '
          +  '        END AS DESCRICAO                                                                 '
          +  '      , CODSINONIMO                                                                      '
          +  '      , MESREFERENCIA                                                                    '
          +  '      , DSSINONIMO                                                                       '
          +  '      , UF                                                                               '
          +  '      , CENTRALIZADOR                                                                    '
          +  '      , CODORGAOLOCAL                                                                    '
          +  '      , EMAIL                                                                            '
          +  '      , CODMANTENEDORINSS                                                                '
          +  '      , SUM(VALORREEMBOLSO) AS VALORREEMBOLSO                                            '
          +  ' FROM                                                                                    '
          +  ' (                                                                                       '
          +  ' SELECT DC.IDPESSOA                                                                      '
          +  '      , '''' AS NOME                                                                     '
          +  '      , DC.NUMPROCINSS                                                                   '
          +  '      , '''' AS NUMDOCUMENTO                                                             '
          +  '      , DC.IDBENEFICIO                                                                   '
          +  '      , DC.ESPECIE                                                                       '
          +  '      , DECODE(PD.FLGDESCONTO, 0, DC.VALORINSS, 1, -DC.VALORINSS) AS  VALORREEMBOLSO     '
          +  '      , SUBSTR(PD.CODPROVDESC,1,1) AS INICIALRUBRICA                                     '
          +  '      , DC.CODSINONIMO                                                                   '
          +  '      , DC.MESCOBRANCA AS MESREFERENCIA                                                  '
          +  '      , U.SIGLA AS UF                                                                    '
          +  '      , DC.CODSINONIMO || '' - '' || U.SIGLA AS DSSINONIMO                               '
          +  '      , UC.SINONIMO AS CENTRALIZADOR                                                     '
          +  '      , U.CODORGAOLOCAL                                                                  '
          +  '      , U.EMAIL                                                                          '
          +  '      , DC.CODMANTENEDORINSS                                                             '
          +  ' FROM DETCONCINSS DC                                                                     '
          +  '     ,PROVDESC PD                                                                        '
          +  '     ,CM.UFINSS U                                                                        '
          +  '     ,CM.UFINSS UC                                                                       '
          +  ' WHERE DC.IDRUBRICA = PD.IDPROVENTO                                                      '
          +  '   AND DC.CODSINONIMO = U.SINONIMO                                                       '
          +  '   AND PD.CODFONTEPAGADORA = 2                                                       '//douglas.siqueira
          +  '   AND U.SIGLACENTRAL = UC.SIGLA                                                         '
          +  '   AND U.EMAIL IS NOT NULL                                                               '
          +  '   AND DC.MESCOBRANCA = ' + QuotedStr( sMesAnoInicio )                                         //edilaine - SIG78760
//          +  '   AND DC.MESCOBRANCA <= ' + QuotedStr( sMesAnoFinal )                                       //edilaine - SIG78760
          +  '   AND SUBSTR(PD.CODPROVDESC,2,1) NOT IN (''3'',''9'')                                   '
//          +  '   AND U.SINONIMO <> 129893                                                              '
          +  '   AND UC.SINONIMO <> 156787                                                             '
          +  ' UNION ALL                                                                               '
          +  ' SELECT TC.IDPESSOA                                                                      '
          +  '      , TC.NOME                                                                          '
          +  '      , TC.NUMPROCINSS                                                                   '
          +  '      , '''' AS NUMDOCUMENTO                                                             '
          +  '      , NULL AS IDBENEFICIO                                                              '
          +  '      , TC.ESPECIE                                                                       '
          +  '      , DECODE(PD.FLGDESCONTO, 0, TC.VLRRUBRICA1, 1, -TC.VLRRUBRICA1) AS  VALORREEMBOLSO '
          +  '      , SUBSTR(TC.CODRUBRICA1,1,1) AS INICIALRUBRICA                                     '
          +  '      , TC.CODSINONIMO                                                                   '
          +  '      , TC.MESPROCESSAMENTO AS MESREFERENCIA                                             '
          +  '      , TC.CODSINONIMO || '' - '' || U.SIGLA AS DSSINONIMO                               '
          +  '      , U.SIGLA AS UF                                                                    '
          +  '      , UC.SINONIMO AS CENTRALIZADOR                                                     '
          +  '      , U.CODORGAOLOCAL                                                                  '
          +  '      , U.EMAIL                                                                          '
          +  '      , TC.CODMANTENEDORINSS                                                             '
          +  ' FROM TEMPCONCINSS TC                                                                    '
          +  '     ,PROVDESC PD                                                                        '
          +  '     ,CM.UFINSS U                                                                        '
          +  '     ,CM.UFINSS UC                                                                       '
          +  ' WHERE TO_CHAR(TC.CODRUBRICA1) =  PD.CODPROVDESC                                         '
          +  '   AND TC.CODSINONIMO = U.SINONIMO                                                       '
          +  '   AND U.SIGLACENTRAL = UC.SIGLA                                                         '
          +  '   AND U.EMAIL IS NOT NULL                                                               '
          +  '   AND PD.CODFONTEPAGADORA = 2                                                           '   //douglas.siqueira
          +  '   AND TC.MESPROCESSAMENTO = ' + QuotedStr( sMesAnoInicio )                                  //edilaine - SIG78760
//          +  '   AND TC.MESPROCESSAMENTO <= ' + QuotedStr( sMesAnoInicio )                               //edilaine - SIG78760
          +  '   AND SUBSTR(TC.CODRUBRICA1,2,1) NOT IN (''3'',''9'')                                   '
//          +  '   AND U.SINONIMO <> 129893                                                            '
          +  '   AND UC.SINONIMO <> 156787                                                             '
          +  ' )                                                                                       '
          +  ' GROUP BY  IDPESSOA                                                                      '
          +  '      , NOME                                                                             '
          +  '      , NUMPROCINSS                                                                      '
          +  '      , NUMDOCUMENTO                                                                     '
          +  '      , IDBENEFICIO                                                                      '
          +  '      , ESPECIE                                                                          '
          +  '      , INICIALRUBRICA                                                                   '
          +  '      , CODSINONIMO                                                                      '
          +  '      , MESREFERENCIA                                                                    '
          +  '      , DSSINONIMO                                                                       '
          +  '      , UF                                                                               '
          +  '      , CENTRALIZADOR                                                                    '
          +  '      , CODORGAOLOCAL                                                                    '
          +  '      , EMAIL                                                                            '
          +  '      , CODMANTENEDORINSS                                                                '
          +  ' )                                                                                       ';

    if FazQuery(qryPC, ssql) then
      Result := qryPC.FieldByName('TOTAL').AsInteger
    Else
      Result := 0;

    qryPC.Close;  


  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

procedure TfrmPrestacaoContasINSS.consultarDadosPessoa(idPessoa: Integer;  var sNome, sNumDocumento: String);
var sSql : String;
begin

  sSql :=  ' SELECT NOME                '
        +  '       ,NUMDOCUMENTO        '
        +  ' FROM CM.PESSOA             '
        +  ' WHERE IDPESSOA = ' + IntToStr(idPessoa);

  if FazQuery(qryAux, ssql) then
   begin
    sNome         := qryAux.FieldByName('NOME').AsString;
    sNumDocumento := qryAux.FieldByName('NUMDOCUMENTO').AsString;
   end
  Else
   begin
    sNome         := '';
    sNumDocumento := '';
   end;
   
end;

function TfrmPrestacaoContasINSS.retornaValorDesembolsoPrevia(sNumProcINSS, sMesRef: String; var sDtPagamento: String): real;
var sSql : String;
begin


  sSql :=  ' SELECT SUM(DECODE(P.FLGDESCONTO, 0, P.VALORRECEBIDO, 1, -P.VALORRECEBIDO))  AS VALORRECEBIDO  '
        +  '       ,MAX(P.DATAPAGAMENTO) AS DATAPAGAMENTO  '
        +  ' FROM CM.PREVIA P                              '
        +  '     ,PROVDESC PD                              '
        +  ' WHERE P.IDRUBRICA = PD.IDPROVENTO             '
        +  '  AND P.FONTEPAGADORA = 2                      '
        +  '  AND SUBSTR(P.CODPROVDESC,3,3) <> ''280''     '
        +  ' AND P.IDRUBRICA NOT IN                        ' //Leandro WO13135
        +  '             (SELECT ER.IDRUBRICA              ' //Leandro WO13135
        +  '              FROM ESTRUTURAXRUBRICA ER        ' //Leandro WO13135
        +  '              WHERE ER.IDESTRUTURA in (45,47)) ' //Leandro WO13135
        +  '  AND P.NUMPROCINSS  = ' + QuotedStr(sNumProcINSS)
        //+  '  AND P.MESCOMPREEM  = ' + QuotedStr(sMesRef)  //Leandro WO131135
        +  '  AND P.MESCOMPREEM  = ' + QuotedStr(sMesRef)    //Edilaine WO14620
        +  '  AND MESCOBRANCA  = ' + QuotedStr(sMesRef);

  if FazQuery(qryAux, ssql) then
   begin
    Result       := qryAux.FieldByName('VALORRECEBIDO').AsFloat;
    sDtPagamento := qryAux.FieldByName('DATAPAGAMENTO').AsString;
   end
  Else
   begin
    Result       := 0;
    sDtPagamento := '';
   end;

end;

function TfrmPrestacaoContasINSS.retornaValorAcertoDesembolsoEfetivacao(
  sNumProcINSS, sMesRef: String; var sDtAcerto: String): real;
var sSql : String;
begin

  sSql :=  ' SELECT SUM(DECODE(P.FLGDESCONTO, 0, P.VALORRECEBIDO, 1, -P.VALORRECEBIDO))  AS VALORRECEBIDO  '
        +  '       ,MAX(P.DATAPAGAMENTO) AS DATAPAGAMENTO  '
        +  ' FROM CM.HISTRUBSAL P                          '
        +  '     ,PROVDESC PD                              '
        +  ' WHERE P.IDRUBRICA = PD.IDPROVENTO             '
        +  '  AND P.FONTEPAGADORA = 2                      '
        +  '  AND P.IDMODULO     = 18                      '             //edilaine - SIG78760
        +  '  AND SUBSTR(P.CODPROVDESC,3,3) <> ''280''     '
        +  '  AND P.NUMPROCINSS  = ' + QuotedStr(sNumProcINSS)
        +  '  AND P.MESCOMPREEM  = ' + QuotedStr(sMesRef)
//        +  '  AND MESCOBRANCA <> ' + QuotedStr(sMesRef); //Everson TIBERO
        +  '  AND P.MESCOBRANCA <> ' + QuotedStr(sMesRef); //Everson TIBERO

  if FazQuery(qryAux, ssql) then
   begin
    Result    := qryAux.FieldByName('VALORRECEBIDO').AsFloat;
    sDtAcerto := qryAux.FieldByName('DATAPAGAMENTO').AsString;
   end
  Else
   begin
    Result    := 0;
    sDtAcerto := '';
   end;

end;

function TfrmPrestacaoContasINSS.retornaValorDesembolsoEfetivacao(sNumProcINSS, sMesRef: String; var sDtPagamento: String): real;
var sSql : String;
begin

  sSql :=  ' SELECT SUM(DECODE(P.FLGDESCONTO, 0, P.VALORRECEBIDO, 1, -P.VALORRECEBIDO))  AS VALORRECEBIDO  '
        +  '       ,MAX(P.DATAPAGAMENTO) AS DATAPAGAMENTO  '
        +  ' FROM CM.HISTRUBSAL P                          '
        +  '     ,PROVDESC PD                              '
        +  ' WHERE P.IDRUBRICA = PD.IDPROVENTO             '
        +  '  AND P.FONTEPAGADORA = 2                      '
        +  '  AND P.IDMODULO     = 18                      '             //edilaine - SIG78760
        +  '  AND P.FLGTIPODESC <> ''I''                   '             //edilaine - SIG78760
        +  '  AND PD.IDCOLUNAMAPA NOT IN (14)              '             //edilaine - SIG78760
        +  '  AND SUBSTR(P.CODPROVDESC,3,3) <> ''280''     '
        +  ' AND P.IDRUBRICA NOT IN                        ' //Leandro WO13135
        +  '             (SELECT ER.IDRUBRICA              ' //Leandro WO13135
        +  '              FROM ESTRUTURAXRUBRICA ER        ' //Leandro WO13135
        +  '              WHERE ER.IDESTRUTURA in (45,47)) ' //Leandro WO13135
        +  '  AND P.NUMPROCINSS  = ' + QuotedStr(sNumProcINSS)
        //+  '  AND P.MESCOMPREEM  = ' + QuotedStr(sMesRef)  //Leandro WO13135
        +  '  AND P.MESCOMPREEM  = ' + QuotedStr(sMesRef)    //Edilaine WO14620
//        +  '  AND MESCOBRANCA  = ' + QuotedStr(sMesRef); //Everson TIBERO
        +  '  AND P.MESCOBRANCA  = ' + QuotedStr(sMesRef)  //Everson TIBERO
        +  '  AND NOT EXISTS (SELECT 1  '                                         //edilaine - SIG78760
        +  '                    FROM GRUPORUBRICA GR '                            //edilaine - SIG78760
        +  '                   WHERE UPPER(GR.DESCRICAO) LIKE ''IR%''  '          //edilaine - SIG78760
        +  '                     AND GR.IDGRUPORUBRICA = PD.IDGRUPORUBRICA)  ';   //edilaine - SIG78760


  if FazQuery(qryAux, ssql) then
   begin
    Result       := qryAux.FieldByName('VALORRECEBIDO').AsFloat;
    sDtPagamento := qryAux.FieldByName('DATAPAGAMENTO').AsString;
   end
  Else
   begin
    Result       := 0;
    sDtPagamento := '';
   end;

end;

procedure TfrmPrestacaoContasINSS.consultarPrestacaoContasDesembolso(
  sMesAnoInicio, sMesAnoFinal: String);
var sSql : String;
begin
  Try

    sSql :=  'SELECT IDPESSOA                                                                      '
          +  '      , NOME                                                                         '
          +  '      , NUMPROCINSS                                                                  '
          +  '      , NUMDOCUMENTO                                                                 '
          +  '      , IDBENEFICIO                                                                  '
          +  '      , TRIM(ESPECIE) AS ESPECIE                                                     '  //edilaine - SIG78760
          +  '      , CODSINONIMO                                                                  '
          +  '      , MESREFERENCIA                                                                '
          +  '      , DSSINONIMO                                                                   '
          +  '      , UF                                                                           '
          +  '      , CENTRALIZADOR                                                                '
          +  '      , CODORGAOLOCAL                                                                '
          +  '      , EMAIL                                                                        '
 //         +  '      , CODMANTENEDORINSS                                                            '
          +  '      , CODMANTENEDORA                                                               '
          +  '      , VALORREEMBOLSO                                                               '
          +  '      , VALORGLOSADO                                                                 '  //edilaine - SIG78760
          +  '      , ORDEMTIPORUBRICA                                                             '
          +  '      , (                                                                            '
          +  '          SELECT MAX(TRI.CODIGO || ''- '' || TRI.DESCRICAO)                          '
          +  '          FROM CM.TIPORUBRICAINSS TRI                                                '
          +  '          WHERE TRI.ORDEM = ORDEMTIPORUBRICA                                         '
          +  '        ) AS DESCRICAO                                                               '
          +  'FROM                                                                                 '
          +  '(                                                                                    '
          +  'SELECT IDPESSOA                                                                      '
          +  '      , NOME                                                                         '
          +  '      , NUMPROCINSS                                                                  '
          +  '      , NUMDOCUMENTO                                                                 '
          +  '      , IDBENEFICIO                                                                  '
          +  '      , ESPECIE                                                                      '
          +  '      , CODSINONIMO                                                                  '
          +  '      , MESREFERENCIA                                                                '
          +  '      , DSSINONIMO                                                                   '
          +  '      , UF                                                                           '
          +  '      , CENTRALIZADOR                                                                '
          +  '      , CODORGAOLOCAL                                                                '
          +  '      , EMAIL                                                                        '
 //         +  '      , CODMANTENEDORINSS                                                            '
          +  '      , NVL(CODMANTENEDORA,''14'') AS CODMANTENEDORA                                 '
          +  '      , SUM(VALORREEMBOLSO) AS VALORREEMBOLSO                                        '
          +  '      , MIN(ORDEMTIPORUBRICA) as ORDEMTIPORUBRICA                                    '
          +  '      , SUM(VALORGLOSADO) AS VALORGLOSADO                                            '   //edilaine - SIG78760
          +  ' FROM                                                                                '
          +  ' (                                                                                   '
          +  ' SELECT DC.IDPESSOA                                                                  '
          +  '      , '''' AS NOME                                                                 '
          +  '      , DC.NUMPROCINSS                                                               '
          +  '      , '''' AS NUMDOCUMENTO                                                         '
          +  '      , DC.IDBENEFICIO                                                               '
          //+  '      , NVL(B.CODBENEFICIO,DC.ESPECIE) ESPECIE                                       '   //edilaine - SIG78760 // Andre Imakawa - SIG 99995
          +  '      , TRIM(NVL(B.CODBENEFICIO,DC.ESPECIE)) ESPECIE                                       '   //edilaine - SIG78760 // Andre Imakawa - SIG 99995
          +  '      , DECODE(PD.FLGDESCONTO, 0, DC.VALORINSS, 1, -DC.VALORINSS) AS  VALORREEMBOLSO '
          +  '      , DC.CODSINONIMO                                                               '
          +  '      , DC.MESCOBRANCA AS MESREFERENCIA                                              '
          +  '      , U.SIGLA AS UF                                                                '
          +  '      , DC.CODSINONIMO || '' - '' || U.SIGLA AS DSSINONIMO                           '
          +  '      , UC.SINONIMO AS CENTRALIZADOR                                                 '
          +  '      , U.CODORGAOLOCAL                                                              '
          +  '      , U.EMAIL                                                                      '
  //        +  '      , DC.CODMANTENEDORINSS                                                         '
          +  '      , TRIM(NVL(DC.CODMANTENEDORA,''14'')) AS CODMANTENEDORA                        '
          +  '      , TR.ORDEM AS ORDEMTIPORUBRICA                                                 '
          +  '      , DECODE(TR.ORDEM,4,DECODE(PD.FLGDESCONTO,0,DC.VALORINSS,1,-DC.VALORINSS),0) VALORGLOSADO '   //edilaine - SIG78760
          +  ' FROM DETCONCINSS DC                                                                 '
          +  '     ,PROVDESC PD                                                                    '
          +  '     ,CM.TIPORUBRICAINSS TR                                                          '
          +  '     ,CM.UFINSS U                                                                    '
          +  '     ,CM.UFINSS UC                                                                   '
          +  '     ,CM.BENEFICIO  B                                                                '   //edilaine - SIG78760
          +  ' WHERE DC.IDRUBRICA = PD.IDPROVENTO                                                  '
          +  '   AND DC.CODSINONIMO = U.SINONIMO                                                   '
          +  '   AND U.SIGLACENTRAL = UC.SIGLA                                                     '
          +  '   AND DC.IDBENEFICIO = B.IDBENEFICIO (+)                                            '   //edilaine - SIG78760
          +  '   AND U.EMAIL IS NOT NULL                                                           '
          +  '   AND PD.CODFONTEPAGADORA = 2                                                       '//douglas.siqueira
          +  '   AND SUBSTR(PD.CODPROVDESC,1,1) = TR.CODIGO                                        '
          +  '   AND DC.MESCOBRANCA = ' + QuotedStr( sMesAnoInicio )                                      //edilaine - SIG78760
//          +  '   AND DC.MESCOBRANCA <= ' + QuotedStr( sMesAnoFinal )                                    //edilaine - SIG78760
          +  '   AND SUBSTR(PD.CODPROVDESC,2,1) NOT IN (''3'',''9'')                               '
          +  '   AND UC.SINONIMO <> 156787                                                         '
          +  '   AND ( (SUBSTR(PD.CODPROVDESC,1,2) NOT IN (''10'',''30'') ) or ( PD.CODPROVDESC IN (''1093'',''3093'')  )  )    '
          +  ' UNION ALL                                                                           '
          +  ' SELECT TC.IDPESSOA                                                                  '
          +  '      , TC.NOME                                                                      '
          +  '      , TC.NUMPROCINSS                                                               '
          +  '      , '''' AS NUMDOCUMENTO                                                         '
          +  '      , NULL AS IDBENEFICIO                                                          '
          +  '      , TC.ESPECIE                                                                   '
          //edilaine - SIG78760 - inicio
//          +  '      , DECODE(PD.FLGDESCONTO, 0, TC.VLRRUBRICA1, 1, -TC.VLRRUBRICA1) AS  VALORREEMBOLSO '

          +  '      , CASE '
          +  '           WHEN SUBSTR(CODRUBRICA1,1,2) = ''91'' THEN '
          +  '             -TC.VLRRUBRICA1                          '
          +  '           WHEN SUBSTR(CODRUBRICA1,1,2) = ''92'' THEN '
          +  '              TC.VLRRUBRICA1                          '
          +  '           WHEN SUBSTR(CODRUBRICA1,1,2) = ''22'' OR   '
          +  '                SUBSTR(CODRUBRICA1,1,2) = ''12'' OR   '
          +  '                SUBSTR(CODRUBRICA1,1,2) = ''30'' OR   '
          +  '                SUBSTR(CODRUBRICA1,1,2) = ''42'' THEN '
          +  '             -TC.VLRRUBRICA1                          '
          +  '           WHEN SUBSTR(CODRUBRICA1,1,2) = ''21'' OR   '
          +  '                SUBSTR(CODRUBRICA1,1,2) = ''11'' OR   '
          +  '                SUBSTR(CODRUBRICA1,1,2) = ''10'' OR   '
          +  '                SUBSTR(CODRUBRICA1,1,2) = ''41'' THEN '
          +  '             TC.VLRRUBRICA1 '
          +  '           ELSE             '
          +  '             TC.VLRRUBRICA1 '
          +  '         END AS VALORREEMBOLSO '
          //edilaine - SIG78760 - fim
          +  '      , TC.CODSINONIMO                                                               '
          +  '      , TC.MESPROCESSAMENTO AS MESREFERENCIA                                         '
          +  '      , U.SIGLA AS UF                                                                '
          +  '      , TC.CODSINONIMO || '' - '' || U.SIGLA AS DSSINONIMO                           '
          +  '      , UC.SINONIMO AS CENTRALIZADOR                                                 '
          +  '      , U.CODORGAOLOCAL                                                              '
          +  '      , U.EMAIL                                                                      '
 //         +  '      , TC.CODMANTENEDORINSS                                                         '
          +  '      , ''14'' AS CODMANTENEDORA                                                     '
          +  '      , TR.ORDEM AS ORDEMTIPORUBRICA                                                 '

          //edilaine - SIG78760 - inicio
          +  '      , DECODE(TR.ORDEM,4,CASE                                                       '
          +  '          WHEN SUBSTR(CODRUBRICA1,1,2) = ''91'' THEN                                 '
          +  '           -TC.VLRRUBRICA1                                                           '
          +  '          WHEN SUBSTR(CODRUBRICA1,1,2) = ''92'' THEN                                 '
          +  '             TC.VLRRUBRICA1                                                          '
          +  '          WHEN SUBSTR(CODRUBRICA1,1,2) = ''22'' OR                                   '
          +  '               SUBSTR(CODRUBRICA1,1,2) = ''12'' OR                                   '
          +  '               SUBSTR(CODRUBRICA1,1,2) = ''30'' OR                                   '
          +  '               SUBSTR(CODRUBRICA1,1,2) = ''42'' THEN                                 '
          +  '            -TC.VLRRUBRICA1                                                          '
          +  '          WHEN SUBSTR(CODRUBRICA1,1,2) = ''21'' OR                                   '
          +  '               SUBSTR(CODRUBRICA1,1,2) = ''11'' OR                                   '
          +  '               SUBSTR(CODRUBRICA1,1,2) = ''10'' OR                                   '
          +  '               SUBSTR(CODRUBRICA1,1,2) = ''41'' THEN                                 '
          +  '            TC.VLRRUBRICA1                                                           '
          +  '          ELSE                                                                       '
          +  '            TC.VLRRUBRICA1                                                           '
          +  '          END,0) VALORGLOSADO                                                        '
          //edilaine - SIG78760 - fim

          +  ' FROM TEMPCONCINSS TC                                                                '
//          +  '     ,PROVDESC PD                                                                    '    //edilaine - SIG78760
          +  '     ,CM.TIPORUBRICAINSS TR                                                          '
          +  '     ,CM.UFINSS U                                                                    '
          +  '     ,CM.UFINSS UC                                                                   '
//          +  ' WHERE TO_CHAR(TC.CODRUBRICA1) =  PD.CODPROVDESC                                     '     //edilaine - SIG78760
          +  ' WHERE TC.CODSINONIMO = U.SINONIMO                                                   '       //edilaine - SIG78760
          +  '   AND U.SIGLACENTRAL = UC.SIGLA                                                     '
//          +  '   AND PD.CODFONTEPAGADORA = 2                                                     '//douglas.siqueira     //edilaine - SIG78760
          +  '   AND U.EMAIL IS NOT NULL                                                           '
          +  '   AND SUBSTR(TC.CODRUBRICA1,1,1) = TR.CODIGO                                        '
          +  '   AND TC.MESPROCESSAMENTO = ' + QuotedStr( sMesAnoInicio )                             // edilaine - SIG78760
//          +  '   AND TC.MESPROCESSAMENTO <= ' + QuotedStr( sMesAnoFinal {sMesAnoInicio} )           // edilaine.ferraresi    //edilaine - SIG78760
          +  '   AND SUBSTR(TC.CODRUBRICA1,2,1) NOT IN (''3'',''9'')                               '
          +  '   AND UC.SINONIMO <> 156787                                                         '
          +  '   AND ( (SUBSTR(TC.CODRUBRICA1,1,2) NOT IN (''10'',''30'') ) or ( TC.CODRUBRICA1 IN (''1093'',''3093'')  )  )  '
          +  ' )                                                                                   '
          +  ' GROUP BY  IDPESSOA                                                                  '
          +  '      , NOME                                                                         '
          +  '      , NUMPROCINSS                                                                  '
          +  '      , NUMDOCUMENTO                                                                 '
          +  '      , IDBENEFICIO                                                                  '
          +  '      , ESPECIE                                                                      '
          +  '      , CODSINONIMO                                                                  '
          +  '      , MESREFERENCIA                                                                '
          +  '      , DSSINONIMO                                                                   '
          +  '      , UF                                                                           '
          +  '      , CENTRALIZADOR                                                                '
          +  '      , CODORGAOLOCAL                                                                '
          +  '      , EMAIL                                                                        '
 //         +  '      , CODMANTENEDORINSS                                                            '
          +  '      , CODMANTENEDORA                                                               '
          +  ' )                                                                                   ';


    FazQuery(qryPC, ssql);


  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

procedure TfrmPrestacaoContasINSS.gerarPrestacaoContas(tPrestacaoContas: TTipoPrestacaoContas; sMesInicio, sMesFinal : String; bRetificacao: boolean);
var sEndereco, sAssunto, sMensagem, sAnexo, sFlgPrevia, sFlgEfetiviacao, sFlgRetificada: String;
    fVlrAcerto, vVlrDiferenca: real;
    sDtAcerto, sJustificativa: String;
    iNumReg: Integer;

    sNome, sNumDocumento, sDtPagamento : String;
    fVlrDesembolso, vVlrDifDesembolso, fVlrGlosa: real;

begin

  consultarPrestacaoContasDesembolso(sMesInicio, sMesFinal);

  //iNumReg          := retornaTotalRegistrosPrestacaoContas(sMesInicio, sMesFinal);  // edilaine.ferraresi
  iNumReg          := qryPC.RecordCount;                                              // edilaine.ferraresi
  ProgressBar.Min  := 0;
  ProgressBar.Max  := iNumReg;
  ProgressBar.step := 1;
  ProgressBar.Position := 0;

  Try
  qryPC.first;  // edilaine.ferraresi
  While not qryPC.Eof do
   begin
      begin
        if bCancelarOperacao then
         begin
          apagarPrestacaoContas(sMesInicio, sMesFinal);
          raise Exception.Create('Operação cancelada pelo usuário');
         end;

        ProgressBar.Position := ProgressBar.Position + 1;
        
        //TRAVA NUM REGISTROS
        //if ProgressBar.Position = 50 then qryPC.Last;


        lbInformacao.Caption := 'Processando: ' + IntToStr(ProgressBar.Position) + ' de ' + IntToStr(iNumReg) + ' - ' + IntToStr(Trunc(ProgressBar.Position/iNumReg *100)) + '%';

        pnProcessando.Refresh;
        Application.ProcessMessages;

        consultarDadosPessoa(qryPC.fieldByName('IDPESSOA').AsInteger,sNome,sNumDocumento);

        if (qryPC.fieldByName('CODMANTENEDORA').AsString = '2') or
           (qryPC.fieldByName('CODMANTENEDORA').AsString = '3') or
           (qryPC.fieldByName('CODMANTENEDORA').AsString = '5') or
           (qryPC.fieldByName('CODMANTENEDORA').AsString = '6') then
          fVlrDesembolso    :=  qryPC.FieldByName('VALORREEMBOLSO').AsFloat

        Else if tPrestacaoContas = tpPrevia then
          fVlrDesembolso    :=  retornaValorDesembolsoPrevia( qryPC.fieldByName('NUMPROCINSS').AsString
                                                            , qryPC.FieldByName('MESREFERENCIA').AsString
                                                            , sDtPagamento )
        Else if (tPrestacaoContas = tpEfetivacao) or (bRetificacao) then      //edilaine - SIG78760
          fVlrDesembolso    :=  retornaValorDesembolsoEfetivacao( qryPC.fieldByName('NUMPROCINSS').AsString
                                                                , qryPC.FieldByName('MESREFERENCIA').AsString
                                                                , sDtPagamento );

        vVlrDifDesembolso := qryPC.FieldByName('VALORREEMBOLSO').AsFloat - fVlrDesembolso;


        if vVlrDifDesembolso <> 0 then
         begin
           if tPrestacaoContas = tpPrevia then
             fVlrAcerto    := retornaValorAcertoDesembolsoPrevia( qryPC.fieldByName('NUMPROCINSS').AsString
                                                                , qryPC.FieldByName('MESREFERENCIA').AsString
                                                                , sDtAcerto )
           Else if (tPrestacaoContas = tpEfetivacao) or (bRetificacao) then      //edilaine - SIG78760
             fVlrAcerto    := retornaValorAcertoDesembolsoEfetivacao( qryPC.fieldByName('NUMPROCINSS').AsString
                                                                    , qryPC.FieldByName('MESREFERENCIA').AsString
                                                                    , sDtAcerto );
           // edilaine.ferraresi
           vVlrDiferenca := ROUNDCM( qryPC.FieldByName('VALORREEMBOLSO').AsFloat - fVlrDesembolso - fVlrAcerto,2 );
         end
        Else
         begin
           fVlrAcerto    := 0;
           vVlrDiferenca := 0;
           sDtAcerto     := '';
         end;

         sJustificativa := '';
         //if (vVlrDiferenca > 0.01) or (vVlrDiferenca < -0.01) then       // edilaine.ferraresi
         if Abs( vVlrDiferenca) >= 0.01 then                               // edilaine.ferraresi
          begin
           sJustificativa := retornaJustificativaDiferenca();
           if (sJustificativa = '') and (fVlrDesembolso + fVlrAcerto > 0) and (vVlrDiferenca > 0) then
                sJustificativa := '3 - Outros (Benefício repassado a menor p/ assistido).'
           Else if (sJustificativa = '') and (fVlrDesembolso + fVlrAcerto > 0) and (vVlrDiferenca < 0) then
                sJustificativa := '3 - Outros (Benefício repassado a maior p/ assistido).'
           Else if (sJustificativa = '') and (fVlrDesembolso = 0) then
           begin
             //edilaine - SIG78760 - inicio
             sJustificativa := RetornaJustificativaOutras(qryPC.fieldByName('NUMPROCINSS').AsString);
             if sJustificativa = '' then
                sJustificativa := '3 - Outros (Valor não repassado)';
             //edilaine - SIG78760 - fim
           end;
         end;


         if tPrestacaoContas = tpPrevia then
          begin
            sFlgPrevia      := '1';
            sFlgEfetiviacao := '0';
          end
         Else
          begin
            sFlgPrevia      := '0';
            sFlgEfetiviacao := '1';
          end;

        if bRetificacao then
         sFlgRetificada := '1'
        Else
         begin
          sFlgRetificada     := '0';
          sMotivoRetificacao := '';
         end;

        //edilaine - SIG78760 - inicio
        //fVlrGlosa := retornaValorGlosa(qryPC.FieldByName('MESREFERENCIA').AsString,qryPC.fieldByName('NUMPROCINSS').AsString)
        fVlrGlosa := qryPC.FieldByName('VALORGLOSADO').AsFloat;
        //edilaine - SIG78760 - fim

        inserirPrestacaoContas( qryPC.fieldByName('UF').AsString
                               ,qryPC.fieldByName('CODORGAOLOCAL').AsString
                               ,qryPC.fieldByName('CODSINONIMO').AsString
                               ,qryPC.FieldByName('ESPECIE').AsString
                               ,qryPC.FieldByName('MESREFERENCIA').AsString
                               ,qryPC.FieldByName('VALORREEMBOLSO').AsFloat
                               ,fVlrDesembolso
                               ,fVlrGlosa
                               ,vVlrDifDesembolso
                               ,fVlrAcerto
                               ,vVlrDiferenca
                               ,sJustificativa
                               ,qryPC.fieldByName('IDPESSOA').AsString
                               ,sNome
                               ,sNumDocumento
                               ,qryPC.fieldByName('NUMPROCINSS').AsString
                               ,qryPC.fieldByName('IDBENEFICIO').AsInteger
                               ,qryPC.fieldByName('DESCRICAO').AsString
                               ,sDtPagamento
                               ,sDtAcerto
                               ,'0'
                               ,edtNomeResponsavel.Text
                               ,edtCPFResponsavel.Text
                               ,edtCargoResponsavel.Text
                               ,sFlgPrevia
                               ,sFlgEfetiviacao
                               ,'0'
                               ,''
                               ,sFlgRetificada
                               ,sMotivoRetificacao);

      end;
      qryPC.Next;
   end;


  Except
    on e: Exception do
     begin
       showmessage(e.Message);
       raise;
     end;
  end;
end;

procedure TfrmPrestacaoContasINSS.bbtnSairClick(Sender: TObject);
begin
  if pnProcessando.Visible then
   Exit;

  inherited;
end;

procedure TfrmPrestacaoContasINSS.bbtnCancelarClick(Sender: TObject);
var sanomesref: String;
begin
   inherited;
   sanomesref := retornaPeriodoAtual();

   spn_anoInicio.Value     := StrToInt(Copy(sanomesref,1,4));
   spn_anoFinal.Value      := StrToInt(Copy(sanomesref,1,4));

   cmb_mesInicio.ItemIndex := -1;
   cmb_mesFinal.ItemIndex  := -1;
   cmb_mesInicioChange(Sender);

   rbOpcaoAnalitico.Checked       := True;
   //edilaine - SIG78760 - inicio
   rbOpcRelPreviaSIM.Checked      := false;
   rbOpcRelEfetivacaoSIM.Checked  := false;
   rbOpcRelRetificadoSIM.Checked  := false;
   rbOpcRelFinal.Checked          := false;
   //rbOpcRelPreviaNAO.Checked             := True;
   //rbOpcRelPreviaTipoBenefNAO.Checked    := True;
   //rbOpcRelEfetivacaoNAO.Checked         := True;
   //rbOpcRelTipoBenefEfetivacaNAO.Checked := True;
   //rbOpcRelRetificadoNAO.Checked         := True;
   //edilaine - SIG78760 - fim

   edtNomeResponsavel.Clear;
   edtCPFResponsavel.Clear;
   edtCargoResponsavel.Clear;


end;

procedure TfrmPrestacaoContasINSS.consultarRelatorioAnaliticoEnvio( sMesAno, sSinonimo: String);
var sSql : String;
begin
  Try
    sSql :=  ' SELECT P.IDPESSOA                                            '
          +  '       ,P.NOME                                                '
          +  '       ,P.NUMEROBENEFICIO AS NUMPROCINSS                      '
          +  '       ,P.NUMDOCUMENTO                                        '
          +  '       ,P.ESPECIE                                             '
          +  '       ,P.DESCRICAO                                           '
          +  '       ,P.SINONIMO AS CODSINONIMO                             '
          +  '       ,P.SIGLA                                               '
          +  '       ,P.SINONIMO || '' - '' || U.SIGLA  AS DSSINONIMO       '
          +  '       ,UC.SINONIMO AS CENTRALIZADOR                          '
          +  '       ,P.CODORGAOLOCAL                                       '
          +  '       ,U.EMAIL                                               '
          +  '       ,P.MESREFERENCIA                                       '
          +  '       ,TRIM(TO_CHAR(TO_DATE(P.MESREFERENCIA||''/01'',''YYYY/MM/DD''),''Month'')) ||                   '
          +  '        TRIM(TO_CHAR(TO_DATE(P.MESREFERENCIA||''/01'',''YYYY/MM/DD''),''/yyyy''))AS DESCMESREFERENCIA  '
          +  '       ,P.REEMBOLSADO AS VALORREEMBOLSO                       '
          +  '       ,P.DATAPAGAMENTO AS DATAPAGAMENTO                      '
          +  '       ,P.DESEMBOLSADO AS VALORDESEMBOLSO                     '
          +  '       ,ROUND(P.DIFERENCADESEMBOLSO,2) AS DIFERENCADESEMBOLSO '
          +  '       ,P.ACERTODESEMBOLSO                                    '
          +  '       ,P.GLOSADO AS VALORGLOSADO                             '
          +  '       ,P.DATAACERTO                                          '
          +  '       ,NVL(P.DS_VALORESNAOPAGO, '' '') AS DS_VALORESNAOPAGO  '
          +  '       ,P.IDBENEFICIO                                         '
          +  '       ,ROUND(P.DIFERENCA,2) AS VALORDIFERENCA                '
          +  '       ,''PRESTACAO_CONTAS_INSS_'' ||                         '
          +  '         SUBSTR(P.MESREFERENCIA,6,2) || ''_'' ||              '
          +  '         SUBSTR(P.MESREFERENCIA,1,4) || ''_'' ||              '
          +  '         P.SIGLA || ''_'' ||                                  '
          +  '         TO_CHAR(SYSDATE,''DDMMYYYY_HH_MI_SS'') || ''.pdf''   '
          +  '        AS NOME_ARQUIVO                                       '
          +  ' FROM CM.PRESTACAOCONTASINSS P                                '
          +  '    , CM.UFINSS U                                             '
          +  '    , CM.UFINSS UC                                            '
          +  ' WHERE P.SINONIMO  = U.SINONIMO                               '
          +  '   AND U.SIGLACENTRAL = UC.SIGLA                              '
          +  '   AND P.MESREFERENCIA = ' + QuotedStr( sMesAno )
          +  '   AND P.SINONIMO = ' + QuotedStr( sSinonimo )
//          +  '   AND U.SINONIMO <> 129893                                   '
          +  '   AND UC.SINONIMO <> 156787                                  '
          +  ' ORDER BY DSSINONIMO                                          '
          +  '      , CENTRALIZADOR                                         '
          +  '      , ABS(NVL(P.DIFERENCA,0))                               '
          +  '      , DS_VALORESNAOPAGO                                     '
          +  '      , TRIM(ESPECIE)                                         '
          +  '      , NUMPROCINSS                                           '
          +  '      , NUMDOCUMENTO                                          '
          +  '      , VALORREEMBOLSO                                        '
          +  '      , VALORDESEMBOLSO                                       ';

    FazQuery(qryPC, ssql);

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

procedure TfrmPrestacaoContasINSS.enviarEmailOutlook(sDestinatario, sAssunto, sAnexo: String);
var
 Outlook, OutlookSec: OleVariant;
 vMailItem: variant;
 sEmailCC  : TStringList;   //edilaine - SIG78760
 sEmailCCO : string;        //edilaine - SIG78760
 ind       : integer;       //edilaine - SIG78760
begin
  Try
   Outlook:=GetActiveOleObject('Outlook.Application') ;
  Except
    Try
      Outlook:=CreateOleObject('Outlook.Application') ;
    Except
      showmessage('erro ao acessar Outlook');
      Exit;
    end;
  end;

  sEmailCC  := TStringList.create;   //edilaine - SIG78760

  try

    sEmailCCO := RetornarEmailUsuario(false);        //edilaine - SIG78760

    vMailItem := Outlook.CreateItem(0);

    //edilaine - SIG78760 - inicio
    //vMailItem.Recipients.Add(sDestinatario);
    ExtractStrings([';'], [], PChar(sDestinatario), sEmailCC);
    for ind := 0 to sEmailCC.count-1 do
    begin
      vMailItem.Recipients.Add(sEmailCC.Strings[ind]);
    end;

    vMailItem.SentOnBehalfOfName := edtEmailResponsa.text;
    if Trim(sEmailCCO) <> '' then
       vMailItem.BCC := sEmailCCO;
    //edilaine - SIG78760 - fim
    vMailItem.Subject := sAssunto;
    vMailItem.Body    := memoCorpoEmail.Lines.Text;
    vMailItem.Attachments.Add(sAnexo);
    vMailItem.Send;
    VarClear(Outlook);

  finally
    FreeAndNil(sEmailCC);    //edilaine - SIG78760
  end;
end;

procedure TfrmPrestacaoContasINSS.atualizarArquivosEnvioPrestacaoContas(sSigla, sCodOrgao, sSinonimo, sMesRef: String);
var sSql : String;
    streamArquivo: TMemoryStream;
    idArquivoRecibo,idArquivoSintetico,idArquivoAnalitico : Integer;
begin
  Try
    idArquivoRecibo := retornaProximoValorIdArquivo();
    InserirArquivoEnvioPrestacaoContas(idArquivoRecibo, 1, sNomeArquivoRecibo);

    idArquivoSintetico := retornaProximoValorIdArquivo();
    InserirArquivoEnvioPrestacaoContas(idArquivoSintetico, 2, sArquivoSintetico);

    idArquivoAnalitico := retornaProximoValorIdArquivo();
    InserirArquivoEnvioPrestacaoContas(idArquivoAnalitico, 3, sArquivoAnalitico);

    qryAux.Close;

    sSql :=  ' UPDATE ENVIOPRESTACAOCONTASINSS              '
          +  ' SET IDARQUIVORECIBO    = :IDARQUIVORECIBO    '
          +  '    ,IDARQUIVOSINTETICO = :IDARQUIVOSINTETICO '
          +  '    ,IDARQUIVOANALITICO = :IDARQUIVOANALITICO '
          +  ' WHERE SIGLA = :SIGLA                         '
          +  '   AND CODORGAOLOCAL = :CODORGAOLOCAL         '
          +  '   AND TRIM(SINONIMO) = :SINONIMO             '
          +  '   AND MESREFERENCIA = :MESREFERENCIA         ';

    qryAux.sql.Text := ssql;

    qryAux.ParamByName('SIGLA').AsString                := Trim(sSigla);
    qryAux.ParamByName('CODORGAOLOCAL').AsString        := Trim(sCodOrgao);
    qryAux.ParamByName('SINONIMO').AsString             := Trim(sSinonimo);
    qryAux.ParamByName('MESREFERENCIA').AsString        := Trim(sMesRef);
    qryAux.ParamByName('IDARQUIVORECIBO').AsInteger     := idArquivoRecibo;
    qryAux.ParamByName('IDARQUIVOSINTETICO').AsInteger  := idArquivoSintetico;
    qryAux.ParamByName('IDARQUIVOANALITICO').AsInteger  := idArquivoAnalitico;
    qryAux.ExecSQL;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;

end;

function TfrmPrestacaoContasINSS.retornaProximoValorIdArquivo: Integer;
var sSql : String;
begin
    sSql :=  ' SELECT NVL(MAX(IDARQUIVO),0) + 1 AS IDARQUIVO FROM CM.ARQUIVOPRESTACAOCONTASINSS ';

    qryAux.SQL.Text := sSql;

    if FazQuery(qryAux, ssql) then
     Result := qryAux.FieldByName('IDARQUIVO').AsInteger
    Else
     Result := 1;

    qryAux.Close;
end;

procedure TfrmPrestacaoContasINSS.InserirArquivoEnvioPrestacaoContas(idArquivo, iTipoArquivo: Integer; sNomeArquivo: String);
var sSql : String;
    streamArquivo: TMemoryStream;
begin
  Try
    sSql :=  ' INSERT INTO CM.ARQUIVOPRESTACAOCONTASINSS '
          +  ' (IDARQUIVO, TIPOARQUIVO, ARQUIVO)         '
          +  ' VALUES                                    '
          +  ' (:IDARQUIVO, :TIPOARQUIVO, :ARQUIVO)      ';

    qryUpdArquivo.sql.Text := ssql;

    With qryUpdArquivo do
     begin
        ParamByName('IDARQUIVO').AsInteger   := idArquivo;
        ParamByName('TIPOARQUIVO').AsInteger := iTipoArquivo;

        streamArquivo := TMemoryStream.Create;
        streamArquivo.LoadFromFile(sNomeArquivo);
        streamArquivo.Position := 0;
        qryUpdArquivo.ParamByName('ARQUIVO').LoadFromStream(streamArquivo,ftBlob);
        ExecSQL;
     end;

    streamArquivo := nil;


  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

procedure TfrmPrestacaoContasINSS.consultarRelatorioSinteticoEnvio(sMesAno,
  sSinonimo: String);
var sSql : String;
begin
  Try
    sSql :=  ' SELECT P.MESREFERENCIA AS MESCOMPETENCIA                     '
          +  '      , P.SINONIMO                                            '
          +  '      , P.SIGLA AS UF                                         '
          +  '      , TO_CHAR(MAX(P.TRGDTINCLUSAO),''dd/mm/yyyy'') AS  DATAENVIO '
          +  '      , P.SINONIMO AS EXECUTOR                                '
          +  '      , UC.SINONIMO AS CENTRALIZADOR                          '
          +  '      , SUM(P.REEMBOLSADO) AS VALORREEMBOLSADO                '
          +  '      , SUM(P.ACERTODESEMBOLSO) AS ACERTODESEMBOLSO           '
          +  '      , SUM(P.DESEMBOLSADO) AS VALORDESEMBOLSADO              '
          +  '      , SUM(P.GLOSADO) AS VALORGLOSADO                        '
          +  '      , SUM(P.DIFERENCA) AS VALORDIFERENCA                    '
          +  '       ,''SINTETICO_'' ||                                     '
          +  '         SUBSTR(P.MESREFERENCIA,6,2) || ''_'' ||              '
          +  '         SUBSTR(P.MESREFERENCIA,1,4) || ''_'' ||              '
          +  '         TRIM(P.SIGLA) || ''_'' ||                            '
          +  '         TO_CHAR(SYSDATE,''DDMMYYYY_HH_MI_SS'') || ''.pdf''   '
          +  '        AS NOME_ARQUIVO                                       '
          +  ' FROM CM.PRESTACAOCONTASINSS P                                '
          +  '    , CM.UFINSS U                                             '
          +  '    , CM.UFINSS UC                                            '
          +  ' WHERE P.SINONIMO  = U.SINONIMO                               '
          +  '   AND U.SIGLACENTRAL = UC.SIGLA                              '
          +  '   AND P.MESREFERENCIA = ' + QuotedStr( sMesAno )
          +  '   AND P.SINONIMO = ' + QuotedStr( sSinonimo )
//          +  '   AND U.SINONIMO <> 129893                                   '
          +  '   AND UC.SINONIMO <> 156787                                  '
          +  ' GROUP BY P.MESREFERENCIA                                     '
          +  '      , P.SINONIMO                                            '
          +  '      , P.SIGLA                                               '
          +  '      , P.SINONIMO                                            '
          +  '      , UC.SINONIMO                                           '
          +  ' ORDER BY SINONIMO                                            '
          +  '      , CENTRALIZADOR                                         '
          +  '      , VALORREEMBOLSADO                                      '
          +  '      , VALORREEMBOLSADO                                      ';

    FazQuery(qryPC, ssql);

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

procedure TfrmPrestacaoContasINSS.consultarArquivosGeradosParaEnvioINSS(sSinonimo, sMesAnoInicio, sMesAnoFinal: String);
var sSql : String;
begin
  Try
    sSql :=  ' SELECT E.SIGLA                                                                    '
          +  '       ,U.EMAIL                                                                    '
          +  '       ,E.CODORGAOLOCAL                                                            '
          +  '       ,E.SINONIMO                                                                 '
          +  '       ,E.MESREFERENCIA                                                            '
          +  '       ,E.IDARQUIVORECIBO                                                          '
          +  '       ,E.IDARQUIVOANALITICO                                                       '
          +  '       ,E.IDARQUIVOSINTETICO                                                       '
          +  '       ,''Prestação Contas INSS '' ||                                              '

          //Everson TIBERO - Início
{          +  '        TRIM(TO_CHAR(TO_DATE(MESREFERENCIA||''/01'',''YYYY/MM/DD''),''Month'')) || '
          +  '        '' '' ||  TRIM(SUBSTR(MESREFERENCIA,1,4))  || '' - '' || E.SIGLA           '}

          +  '        TRIM(TO_CHAR(TO_DATE(E.MESREFERENCIA||''/01'',''YYYY/MM/DD''),''Month'')) || '
          +  '        '' '' ||  TRIM(SUBSTR(E.MESREFERENCIA,1,4))  || '' - '' || E.SIGLA           '
          //Everson TIBERO - Fim

          +  '        AS ASSUNTO                                                                 '
          +  ' FROM CM.ENVIOPRESTACAOCONTASINSS E                                                '
          +  '     ,CM.UFINSS U                                                                  '
//          +  ' WHERE E.SIGLA = U.SIGLA                                                           '     //edilaine - SIG78760
          +  ' WHERE E.SINONIMO = U.SINONIMO                                                     '       //edilaine - SIG78760
          +  '   AND NVL(E.FLGEMAILENVIADO,0) = 0                                                '
//          +  '   AND U.SINONIMO <> 129893                                                        '
          +  '   AND E.SINONIMO =  ' + QuotedStr( sSinonimo )
          +  '   AND E.MESREFERENCIA =  ' + QuotedStr( sMesAnoInicio );                            //edilaine - SIG78760
//          +  '   AND E.MESREFERENCIA <=  ' + QuotedStr( sMesAnoFinal );                          //edilaine - SIG78760

    FazQuery(qryPCEnvio, ssql);

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

procedure TfrmPrestacaoContasINSS.consultaTextoEmailUF(sUF, sMesReferencia: String);
var sSql,sDescMesReferencia : String;
    streamAux: TMemoryStream;
begin
  Try
    memoCorpoEmail.Clear;

    sSql :=  ' SELECT TEXTOEMAIL           '
          +  ' FROM CM.UFINSS              '
          +  ' WHERE SIGLA = ' + QuotedStr( sUF )
          +  ' AND TEXTOEMAIL IS NOT NULL  ';
//          +  ' WHERE SINONIMO <> 129893    '

    FazQuery(qryAux, ssql);

    if (not qryAux.IsEmpty) and ( not qryAux.FieldByName('TEXTOEMAIL').IsNull ) then
     begin
        streamAux := TMemoryStream.Create;
        streamAux.Position := 0;
        TBlobField(qryAux.FieldByName('TEXTOEMAIL')).SaveToStream(streamAux);
        streamAux.Position := 0;
        memoCorpoEmail.Lines.LoadFromStream(streamAux);

        sDescMesReferencia :=  retornaDescMesReferencia(sMesReferencia);
        memoCorpoEmail.Lines.Text  := StringReplace(memoCorpoEmail.Lines.Text,'[PERIODO]',sDescMesReferencia,[rfReplaceAll, rfIgnoreCase]);

     end;

    qryAux.Close;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

function TfrmPrestacaoContasINSS.retornaPathArquivo(idArquivo: Integer; sMesReferencia: String): String;
var sSql : String;
    streamAux: TMemoryStream;
begin
  Try     //Everson TIBERO - Início
    {sSql :=  ' SELECT IDARQUIVO                                                        '
          +  '       ,TIPOARQUIVO                                                      '
          +  '       ,CASE                                                             '
          +  '          WHEN TIPOARQUIVO = 1 THEN                                      ' }

    sSql :=  ' SELECT A.IDARQUIVO                                                        '
          +  '       ,A.TIPOARQUIVO                                                      '
          +  '       ,CASE                                                             '
          +  '          WHEN A.TIPOARQUIVO = 1 THEN                                      '
          //Everson TIBERO - Fim

          +  '            ''RECIBO_'' ||                                               '
          +  '            SUBSTR(' + QuotedStr( sMesReferencia ) + ',6,2) || ''_'' ||  '
          +  '            SUBSTR(' + QuotedStr( sMesReferencia ) + ',1,4) || ''_'' ||  '
          +  '            TRIM(E.SIGLA) || ''_'' ||                                    '
          +  '            TO_CHAR(SYSDATE,''DDMMYYYY_HH_MI_SS'') || ''.pdf''           '
//          +  '          WHEN TIPOARQUIVO = 2 THEN                                      ' //Everson TIBERO
          +  '          WHEN A.TIPOARQUIVO = 2 THEN                                      ' //Everson TIBERO
          +  '            ''SINTETICO_'' ||                                            '
          +  '            SUBSTR(' + QuotedStr( sMesReferencia ) + ',6,2) || ''_'' ||  '
          +  '            SUBSTR(' + QuotedStr( sMesReferencia ) + ',1,4) || ''_'' ||  '
          +  '            TRIM(E.SIGLA) || ''_'' ||                                    '
          +  '            TO_CHAR(SYSDATE,''DDMMYYYY_HH_MI_SS'') || ''.pdf''           '
//          +  '          WHEN TIPOARQUIVO = 3 THEN                                      ' //Everson TIBERO
          +  '          WHEN A.TIPOARQUIVO = 3 THEN                                      ' //Everson TIBERO
          +  '            ''PRESTACAO_CONTAS_INSS_'' ||                                '
          +  '            SUBSTR(' + QuotedStr( sMesReferencia ) + ',6,2) || ''_'' ||  '
          +  '            SUBSTR(' + QuotedStr( sMesReferencia ) + ',1,4) || ''_'' ||  '
          +  '            TRIM(E.SIGLA) || ''_'' ||                                    '
          +  '            TO_CHAR(SYSDATE,''DDMMYYYY_HH_MI_SS'') || ''.pdf''           '
          +  '        END AS NOME_ARQUIVO                                              '
          +  '       ,ARQUIVO                                                          '
          +  ' FROM CM.ARQUIVOPRESTACAOCONTASINSS A                                    '
          +  '     ,CM.ENVIOPRESTACAOCONTASINSS E                                      '
          +  ' WHERE ( (E.IDARQUIVORECIBO = A.IDARQUIVO)                               '
          +  '      OR (E.IDARQUIVOANALITICO = A.IDARQUIVO)                            '
          +  '      OR (E.IDARQUIVOSINTETICO = A.IDARQUIVO)                            '
          +  '       )                                                                 '
//          +  '  AND IDARQUIVO = ' + IntToStr( idArquivo ); //Everson TIBERO
          +  '  AND A.IDARQUIVO = ' + IntToStr( idArquivo ); //Everson TIBERO

    FazQuery(qryAux, ssql);

    if (not qryAux.IsEmpty) and ( not qryAux.FieldByName('ARQUIVO').IsNull ) then
     begin
       Result := 'C:\Planus\Temp\' + qryAux.FieldbyName('NOME_ARQUIVO').AsString;
       TBlobField(qryAux.FieldByName('ARQUIVO')).SaveToFile( Result );
     end;

    qryAux.Close;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

function TfrmPrestacaoContasINSS.Mascara(edt, str: String): string;
var
  i : integer;
begin
  for i := 1 to Length(edt) do
  begin
     if (str[i] = '9') and not (edt[i] in ['0'..'9']) and (Length(edt)=Length(str)+1) then
        delete(edt,i,1);
     if (str[i] <> '9') and (edt[i] in ['0'..'9']) then
        insert(str[i],edt, i);
  end;
  result := edt;
end;


function TfrmPrestacaoContasINSS.formataNumBeneficio(num: String): string;
begin
//  if length(num) = 9 then
//   num := '0' + num;
  if length(num) < 10 then
   begin
    while length(num) < 10 do
      num := '0' + num;
   end;

  Result := copy(num,1,3)+'.'+copy(num,4,3)+'.'+copy(num,7,3)+'-'+copy(num,10,1)
end;

function TfrmPrestacaoContasINSS.formataNumCPF(num: String): string;
begin
  if length(num) < 11 then
   begin
    while length(num) < 11 do
      num := '0' + num;
   end;

  Result := copy(num,1,3)+'.'+copy(num,4,3)+'.'+copy(num,7,3)+'-'+copy(num,10,2);  //999.999.999-99
end;

procedure TfrmPrestacaoContasINSS.ppDBText20GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  if Trim(text) = '-' then
   text := '-     ';
end;

procedure TfrmPrestacaoContasINSS.apagarArquivosGeradosNaoEfetivados(sMesAnoInicio, sMesAnoFinal: String);
var sSql: String;
begin
  Try

    sSql :=  ' DELETE                                       '
          +  ' FROM CM.ENVIOPRESTACAOCONTASINSS             '
          +  '   WHERE NVL(FLGEMAILENVIADO,0) = 0           '
          +  '   AND NVL(PRESTACAOCONTASEFETIVADA,0) = 0    '
          +  '   AND MESREFERENCIA = ' + QuotedStr( sMesAnoInicio );            //edilaine - SIG78760
          //+  '   AND MESREFERENCIA <= ' + QuotedStr( sMesAnoFinal );          //edilaine - SIG78760

    qryAux.sql.Text := ssql;
    qryAux.ExecSQL;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;

end;

function TfrmPrestacaoContasINSS.verificaExistePrestacaoContasEnviadaMesmoValor( sSinonimo, sMesAno: String; fVlrReembolsado, fVlrDesembolsado,
  fVlrGlosado: Real): Boolean;
var sSql : String;
begin
  Result := False;

  Try     //Everson TIBERO - Início
    {sSql :=  ' SELECT TOTALREEMBOLSADO                                                           '
          +  '       ,TOTALDESEMBOLSADO                                                          '
          +  '       ,TOTALGLOSADO                                                               '}

    sSql :=  ' SELECT E.TOTALREEMBOLSADO                                                           '
          +  '       ,E.TOTALDESEMBOLSADO                                                          '
          +  '       ,E.TOTALGLOSADO                                                               '
          //Everson TIBERO - Fim

          +  ' FROM CM.ENVIOPRESTACAOCONTASINSS E                                                '
          +  '     ,CM.UFINSS U                                                                  '
//          +  ' WHERE E.SIGLA = U.SIGLA                                                           '        //edilaine - SIG78760
          +  ' WHERE E.SINONIMO = U.SINONIMO                                                     '          //edilaine - SIG78760
          +  '   AND NVL(E.FLGEMAILENVIADO,0) = 1                                                '
//          +  '   AND U.SINONIMO <> 129893                                                        '
          +  '   AND E.SINONIMO =  ' + QuotedStr( sSinonimo )
          +  '   AND E.MESREFERENCIA =  ' + QuotedStr( sMesAno );

    FazQuery(qryAux, ssql);

    if qryAux.Active then
     While not qryAux.EOF do
      begin
         if ( qryAux.FieldbyName('TOTALREEMBOLSADO').AsFloat = fVlrReembolsado ) and
            ( qryAux.FieldbyName('TOTALDESEMBOLSADO').AsFloat = fVlrDesembolsado ) and
            ( qryAux.FieldbyName('TOTALGLOSADO').AsFloat = fVlrGlosado ) then
            begin
              Result := True;
              qryAux.Close;
              Exit;
            end;
          qryAux.Next;
      end;
    qryAux.Close;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

procedure TfrmPrestacaoContasINSS.marcarArquivoEnviadoINSS(sUF, sMesAno, sSinonimo : String); //edilaine - SIG78760
var sSql : String;
begin
  Try
    sSql :=  ' UPDATE CM.ENVIOPRESTACAOCONTASINSS           '
          +  ' SET FLGEMAILENVIADO = 1                      '
//          +  ' WHERE SIGLA = ' + QuotedStr( sUF )                  //edilaine - SIG78760
          +  ' WHERE SINONIMO = ' + QuotedStr( sSinonimo )           //edilaine - SIG78760
          +  '   AND MESREFERENCIA =  ' + QuotedStr( sMesAno )
          +  '   AND NVL(FLGEMAILENVIADO,0) = 0           ';

    qryAux.sql.Text := ssql;
    qryAux.ExecSQL;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

function TfrmPrestacaoContasINSS.verificaFoiGeradaPrestacaoContasPrevia(
  sMesAnoInicio, sMesAnoFinal: String): boolean;
var sSql : String;
begin

  Try
    sSql :=  ' SELECT  COUNT(*) AS TOTAL                            '
          +  ' FROM CM.PRESTACAOCONTASINSS                          '
          +  ' WHERE MESREFERENCIA = ' + QuotedStr( sMesAnoInicio );           //edilaine - SIG78760
          //+  '   AND MESREFERENCIA <= ' + QuotedStr( sMesAnoFinal ) ;        //edilaine - SIG78760

    if FazQuery(qryAux,sSql) and (not qryAux.IsEmpty) then
     Result := (qryAux.FieldByName('TOTAL').AsInteger > 0 )
    Else
     Result := False;

    qryAux.Close;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;

end;

function TfrmPrestacaoContasINSS.retornaDescMesReferencia(sMesReferencia: String): String;
var sSql : String;
begin
  Try
    sSql :=  ' SELECT TRIM(TO_CHAR(TO_DATE('+ QuotedStr( sMesReferencia ) + '||''/01'',''YYYY/MM/DD''),''Month'')) ||  '
          +  ' '' de '' ||      '
          +  ' TRIM(TO_CHAR(TO_DATE('+ QuotedStr( sMesReferencia ) + '||''/01'',''YYYY/MM/DD''),''yyyy'')) as PERIODO  '
          +  ' FROM DUAL        ';

    if FazQuery(qryAux,sSql) and (not qryAux.IsEmpty) then
     Result := qryAux.FieldByName('PERIODO').AsString
    Else
     Result := sMesReferencia;

    qryAux.Close;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

function TfrmPrestacaoContasINSS.retornaValorGlosa(sMesRef,  sNumProcINSS: String): real;
var sSql : String;
begin

  sSql :=  ' SELECT SUM(VALORREEMBOLSO) AS VALORGLOSA                                                    '
        +  '  FROM                                                                                       '
        +  '  (                                                                                          '
        +  '  SELECT DC.NUMPROCINSS                                                                      '
        +  '       , DECODE(PD.FLGDESCONTO, 0, DC.VALORINSS, 1, -DC.VALORINSS) AS  VALORREEMBOLSO        '
        +  '       , SUBSTR(PD.CODPROVDESC,1,1) AS INICIALRUBRICA                                        '
        +  '  FROM DETCONCINSS DC                                                                        '
        +  '      ,PROVDESC PD                                                                           '
        +  '      ,CM.UFINSS U                                                                           '
        +  '      ,CM.UFINSS UC                                                                          '
        +  '  WHERE DC.IDRUBRICA = PD.IDPROVENTO                                                         '
        +  '    AND DC.CODSINONIMO = U.SINONIMO                                                          '
        +  '    AND U.SIGLACENTRAL = UC.SIGLA                                                            '
        +  '   AND PD.CODFONTEPAGADORA = 2                                                       '//douglas.siqueira        
        +  '    AND U.EMAIL IS NOT NULL                                                                  '
        +  '    AND DC.MESCOBRANCA = ' + QuotedStr( sMesRef )
        +  '    AND SUBSTR(PD.CODPROVDESC,2,1) NOT IN (''3'',''9'')                                      '
        +  '    AND ((SUBSTR(DC.RUBRICAINSS,1,1) in ''9'')  or DC.RUBRICAINSS in (''3093'',''1093''))    '
//        +  '    AND U.SINONIMO <> 129893                                                                 '
        +  '    AND UC.SINONIMO <> 156787                                                                '
        +  '    AND DC.NUMPROCINSS = ' + QuotedStr( sNumProcINSS )
        +  '  UNION ALL                                                                                  '
//        +  '  SELECT NUMPROCINSS                                                                         ' //Everson TIBERO
        +  '  SELECT TC.NUMPROCINSS                                                                         '//Everson TIBERO
        +  '       , DECODE(PD.FLGDESCONTO, 0, TC.VLRRUBRICA1, 1, -TC.VLRRUBRICA1) AS  VALORREEMBOLSO    '
        +  '       , SUBSTR(PD.CODPROVDESC,1,1) AS INICIALRUBRICA                                        '
        +  '  FROM TEMPCONCINSS TC                                                                       '
        +  '      ,PROVDESC PD                                                                           '
        +  '      ,CM.UFINSS U                                                                           '
        +  '      ,CM.UFINSS UC                                                                          '
        +  '  WHERE TO_CHAR(TC.CODRUBRICA1) =  PD.CODPROVDESC                                            '
        +  '    AND TC.CODSINONIMO = U.SINONIMO                                                          '
        +  '    AND U.SIGLACENTRAL = UC.SIGLA                                                            '
        +  '   AND PD.CODFONTEPAGADORA = 2                                                       '//douglas.siqueira        
        +  '    AND U.EMAIL IS NOT NULL                                                                  '
        +  '    AND TC.MESPROCESSAMENTO = ' + QuotedStr( sMesRef )
        +  '    AND SUBSTR(TC.CODRUBRICA1,2,1) NOT IN (''3'',''9'')                                      '
        +  '    AND ((SUBSTR(TC.CODRUBRICA1,1,1) in ''9'')  or TC.CODRUBRICA1 in (''3093'',''1093''))    '
//        +  '    AND U.SINONIMO <> 129893                                                                 '
        +  '    AND UC.SINONIMO <> 156787                                                                '
        +  '    AND TC.NUMPROCINSS = ' + QuotedStr( sNumProcINSS )
        +  '  )                                                                                          ';
//        +  '  WHERE INICIALRUBRICA = ''1''                                                               '
//        +  '    AND NUMPROCINSS = ' + QuotedStr( sNumProcINSS );

  if FazQuery(qryAux, ssql) then
    Result    := qryAux.FieldByName('VALORGLOSA').AsFloat
  Else
    Result    := 0;

  qryAux.Close;

end;


procedure TfrmPrestacaoContasINSS.gerarRelatorioReciboUF;
begin
   qryPcINSSEnvio.Close;
   qryPcINSSEnvio.Open;

   if ( not qryPCEnvio.Active) or ( qryPCEnvio.IsEmpty) then
    Exit;

   qryPcINSSEnvio.Insert;
   qryPcINSSEnvio.FieldByName('UF').AsString                := GetDadosEstado(qryPCEnvio.FieldByName('SINONIMO').AsString);
   qryPcINSSEnvio.FieldByName('SINONIMO').AsString          := qryPCEnvio.FieldByName('SINONIMO').AsString;
   qryPcINSSEnvio.FieldByName('CENTRALIZADOR').AsString     := qryPCEnvio.FieldByName('CENTRALIZADOR').AsString;
   qryPcINSSEnvio.FieldByName('MESCOMPETENCIA').AsString    := qryPCEnvio.FieldByName('MESCOMPETENCIA').AsString;
   qryPcINSSEnvio.FieldByName('ANOCOMPETENCIA').AsString    := qryPCEnvio.FieldByName('ANOCOMPETENCIA').AsString;
   qryPcINSSEnvio.FieldByName('DSDATAASSINATURA').AsString  := qryPCEnvio.FieldByName('DSDATAASSINATURA').AsString;
   qryPcINSSEnvio.FieldByName('NOMERESPONSAVEL').AsString   := qryPCEnvio.FieldByName('NOMERESPONSAVEL').AsString;
   qryPcINSSEnvio.FieldByName('CPFRESPONSAVEL').AsString    := qryPCEnvio.FieldByName('CPFRESPONSAVEL').AsString;
   qryPcINSSEnvio.FieldByName('CARGORESPONSAVEL').AsString  := qryPCEnvio.FieldByName('CARGORESPONSAVEL').AsString;
   qryPcINSSEnvio.FieldByName('VALORREEMBOLSADO').AsString  := 'R$ ' + FormatFloat('###,###,##0.00',qryPCEnvio.FieldByName('VALORREEMBOLSADO').AsFloat);
   qryPcINSSEnvio.FieldByName('VALORDESEMBOLSADO').AsString := 'R$ ' + FormatFloat('###,###,##0.00',qryPCEnvio.FieldByName('VALORDESEMBOLSADO').AsFloat+   //edilaine - SIG78760
                                                                                                    qryPCEnvio.FieldByName('ACERTODESEMBOLSO').AsFloat);   //edilaine - SIG78760
   qryPcINSSEnvio.FieldByName('VALORGLOSADO').AsString      := 'R$ ' + FormatFloat('###,###,##0.00',qryPCEnvio.FieldByName('VALORGLOSADO').AsFloat);
   qryPcINSSEnvio.FieldByName('VALORDIFERENCA').AsString    := 'R$ ' + FormatFloat('###,###,##0.00',qryPCEnvio.FieldByName('VALORDIFERENCA').AsFloat);
   qryPcINSSEnvio.Post;

   sNomeArquivoRecibo := 'C:\Planus\Temp\' + qryPCEnvio.FieldByName('NOMEARQUIVO').AsString;
   ppdPcINSSEnvio.Report.TextFileName     := sNomeArquivoRecibo;
   ppdPcINSSEnvio.Report.AllowPrintToFile := True;
   ppdPcINSSEnvio.Report.ShowPrintDialog  := False;
   ppdPcINSSEnvio.Report.DeviceType       :='PDFFile';
   ppdPcINSSEnvio.Report.Print;

end;

procedure TfrmPrestacaoContasINSS.gerarRelatorioReciboTodos(sNomeArquivo: String);
begin
   qryPcINSSEnvio.Close;
   qryPcINSSEnvio.Open;

   if ( not qryPcINSSEnvioTodos.Active) or ( qryPcINSSEnvioTodos.IsEmpty) then
    Exit;

   qryPcINSSEnvioTodos.First;
   While not qryPcINSSEnvioTodos.Eof do
    begin
       qryPcINSSEnvio.Insert;
       qryPcINSSEnvio.FieldByName('UF').AsString                := GetDadosEstado(qryPcINSSEnvioTodos.FieldByName('SINONIMO').AsString);
       qryPcINSSEnvio.FieldByName('SINONIMO').AsString          := qryPcINSSEnvioTodos.FieldByName('SINONIMO').AsString;
       qryPcINSSEnvio.FieldByName('CENTRALIZADOR').AsString     := qryPcINSSEnvioTodos.FieldByName('CENTRALIZADOR').AsString;
       qryPcINSSEnvio.FieldByName('MESCOMPETENCIA').AsString    := qryPcINSSEnvioTodos.FieldByName('MESCOMPETENCIA').AsString;
       qryPcINSSEnvio.FieldByName('ANOCOMPETENCIA').AsString    := qryPcINSSEnvioTodos.FieldByName('ANOCOMPETENCIA').AsString;
       qryPcINSSEnvio.FieldByName('DSDATAASSINATURA').AsString  := qryPcINSSEnvioTodos.FieldByName('DSDATAASSINATURA').AsString;
       qryPcINSSEnvio.FieldByName('NOMERESPONSAVEL').AsString   := qryPcINSSEnvioTodos.FieldByName('NOMERESPONSAVEL').AsString;
       qryPcINSSEnvio.FieldByName('CPFRESPONSAVEL').AsString    := qryPcINSSEnvioTodos.FieldByName('CPFRESPONSAVEL').AsString;
       qryPcINSSEnvio.FieldByName('CARGORESPONSAVEL').AsString  := qryPcINSSEnvioTodos.FieldByName('CARGORESPONSAVEL').AsString;
       qryPcINSSEnvio.FieldByName('VALORREEMBOLSADO').AsString  := qryPcINSSEnvioTodos.FieldByName('VALORREEMBOLSADO').AsString;
       qryPcINSSEnvio.FieldByName('VALORDESEMBOLSADO').AsString := qryPcINSSEnvioTodos.FieldByName('VALORDESEMBOLSADO').AsString;
       qryPcINSSEnvio.FieldByName('VALORGLOSADO').AsString      := qryPcINSSEnvioTodos.FieldByName('VALORGLOSADO').AsString;
       qryPcINSSEnvio.FieldByName('VALORDIFERENCA').AsString    := qryPcINSSEnvioTodos.FieldByName('VALORDIFERENCA').AsString;
       qryPcINSSEnvio.Post;

       qryPcINSSEnvioTodos.Next;
    end;

   qryPcINSSEnvio.First;
   
   sNomeArquivoRecibo := 'C:\Planus\Temp\' + sNomeArquivo;
   ppdPcINSSEnvio.Report.TextFileName     := sNomeArquivoRecibo;
   ppdPcINSSEnvio.Report.AllowPrintToFile := True;
   ppdPcINSSEnvio.Report.ShowPrintDialog  := False;
   ppdPcINSSEnvio.Report.DeviceType       :='PDFFile';
   ppdPcINSSEnvio.Report.Print;

   ppdPcINSSEnvio.Report.Template.SaveTo  := stFile;
   ppdPcINSSEnvio.Report.Template.Format  := ftASCII;
   ppdPcINSSEnvio.Report.Device           := dvScreen;
   TFrmPreview.CreateModalPreview(Application, ppdPcINSSEnvio.Report, 'Recibo de Envio de Prestação de Contas do INSS');

   
end;

procedure TfrmPrestacaoContasINSS.ppDBCalc2GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Text := 'R$ ' + FormatFloat('###,###,##0.00',TppDBCalc(Sender).Value);
//  TppDBCalc(Sender).Value := 0;
end;

//edilaine - SIG78760-  inicio
function TfrmPrestacaoContasINSS.RetornarEmailUsuario(bEmailTeste : boolean) : string;
var sSql : String;
begin
  Try
    sSql :=  'SELECT EMAIL FROM PESSOA WHERE IDPESSOA = '+IntToStr(Sistema.IdUsuario);

    if FazQuery(qryAux,sSql) and (not qryAux.IsEmpty) and (Trim(qryAux.FieldByName('EMAIL').AsString) <> '') then
       Result := qryAux.FieldByName('EMAIL').AsString
    Else if bEmailTeste then
       Result := InputBox ('Informe e-mail para teste do envio', 'E-mail: ', '')
    else
       Result := '';

    qryAux.Close;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;

end;


function TfrmPrestacaoContasINSS.ValidaEMail(const EMailIn : String) : Boolean;
const
  CaraEsp: array[1..42] of string[1] =
  ( '!','#','$','%','¨','&','*',
  '(',')','+','=','§','¬','¢','¹','²',
  '³','£','´','`','ç','Ç',',',';',':',
  '<','>','~','^','?','/','','|','[',']','{','}',
  'º','ª','°','é','ó');
var
  i,cont,t, posPonto   : integer;
  EMail                : ShortString;
begin
  EMail  := PChar(EMailIn);
  Result := True;
  cont   := 0;
  t      := Length(EMail);
  posPonto := 999;

  if (EMail <> EmptyStr) then
    begin
    //O texto digitado deve possuir, no mínimo, dois caracteres antes do final
    if Length(EMail) >= 1 then
        if (Email[t] = '.') or (Email[t-1] = '.') then
           begin
             Result := False;
             exit;
           end;

    // existe @ .
    if (Pos('@', EMail)<>0) and (Pos('.', EMail)<>0) then
    begin
      if (Pos('@', EMail)=1) or (Pos('@', EMail)= Length(EMail)) or (Pos('.', EMail)=1) or (Pos('.', EMail)= Length(EMail)) or (Pos(' ', EMail)<>0) then
        Result := False
      else
        // @ seguido de . e vice-versa
        if (abs(Pos('@', EMail) - Pos('.', EMail)) = 1) then
          Result := False
        else
          begin
            for i := 1 to 40 do
              // se existe Caracter Especial
              if Pos(CaraEsp[i], EMail)<>0 then
                begin
                   Result := False;
                   exit;
                end;

            for i := 1 to length(EMail) do
            begin
              // se existe apenas 1 @
              if EMail[i] = '@' then
                  cont := cont + 1;

              // . seguidos de .
              if (EMail[i] = '.') and (EMail[i+1] = '.') then
                begin
                  Result := false;
                  exit;
                end;

              if EMail[i] = '.' then
                  posPonto := i;
            end;

            // . no f, 2ou+ @, . no i, - no i, _ no i
            if (cont >=2) or ( EMail[length(EMail)]= '.' )
              or ( EMail[1]= '.' ) or ( EMail[1]= '_' )
              or ( EMail[1]= '-' )  then
             begin
                Result := false;
                exit;
             end;

            // @ seguido de COM e vice-versa
            if (abs(Pos('@', EMail) - Pos('com', EMail)) = 1) then
              begin
                Result := False;
                exit;
              end;

            // @ seguido de - e vice-versa
            if (abs(Pos('@', EMail) - Pos('-', EMail)) = 1) then
              begin
                Result := False;
                exit;
              end;

            // @ seguido de _ e vice-versa
            if (abs(Pos('@', EMail) - Pos('_', EMail)) = 1) then
              begin
                Result := False;
                exit;
              end;
          end;
    end
    else  Result:= False;

    //O ultimo ponto deve vir depois do arroba
    if (Pos('@', EMail) > posPonto) then
        Result := False;
    end;
end;


function TfrmPrestacaoContasINSS.retornaJustificativaOutras(sNumProcInss : string) : String;
var
  sSQL : string;
begin
  Result := '';

  sSQL := 'SELECT COUNT(*) AS QTD  '+
          '  FROM BENEFBFCIARIO BF '+
          ' WHERE BF.NUMPROCINSS    = '+QuotedStr(sNumProcInss) +
          '   AND BF.FONTEPAGADORA  = 2  '+
          '   AND BF.IDSITBENEFICIO = 2  '+
          '   AND EXISTS (SELECT 1       '+
          '  	              FROM MOVBENEF MB   '+
          '  	             WHERE BF.IDPLANOPREV = MB.IDPLANOPREV   '+
          '                  AND BF.IDBENEFICIO = MB.IDBENEFICIO   '+
          '                  AND BF.NUMEROPROCESSO = MB.NUMEROPROCESSO '+
          '                  AND BF.IDPESSJUR = MB.IDPESSJUR           '+
          '                  AND BF.IDTITULAR = MB.IDTITULAR           '+
          '                  AND BF.IDPLANOORIGEM = MB.IDPLANOORIGEM   '+
          '                  AND BF.IDPESSOA = MB.IDPESSOA             '+
          '                  AND BF.SEQPROPOSTA = MB.SEQPROPOSTA       '+
          '                  AND MB.MOTRETENC = ANY(46, 73)) ';        // Andre Imakawa - SIG 127791
  if FazQuery(qryAux,sSql) then
     if qryAux.FieldByName('QTD').AsInteger >= 1 then
        result := '3 - Outros (Ausência de recadastramento / Suspeita de Óbito)';

  qryAux.Close;

end;


procedure TfrmPrestacaoContasINSS.bbtnGerarArqFinalClick(Sender: TObject);
begin
  inherited;

  if Trim(edtNomeResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o nome do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  if Trim(edtCPFResponsavel.Text) = '' then
   begin                          
      MsgDlg('É necessário informar o CPF do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  if Trim(edtCargoResponsavel.Text) = '' then
   begin
      MsgDlg('É necessário informar o Cargo do responsável.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   end;

  if pnProcessando.Visible then
     Exit;

  bbtnCancelar.Enabled  := False;

  gerarArquivoFinalEnvioINSS();
end;


procedure TfrmPrestacaoContasINSS.consultarRelatorioArquivoFinalEnvioINSS(tipoConsulta : TTipoConsultaFinal;
                                                                          sSinonimo, sMesAnoInicio, sMesAnoFinal : String);
var sSql : String;
begin
  Try

    case tipoConsulta of
     tcDados : begin
        sSql :=  ' SELECT ''3.390'' AS ORIGEM, PF.*           '
              +  '      , ''              '' AS NUMPROCINSS   '
              +  '      , ''              '' AS JUSTIFICATIVA '
              +  '      , ''                                                                         '' AS VLR_INDICACAO '
              +  '      , TO_CHAR(TO_DATE(PF.PERIODOINI||''/01'', ''YYYY/MM/DD''), ''DD/MM/YYYY'') AS DATAINI '
              +  '      , TO_CHAR(LAST_DAY(TO_DATE(PF.PERIODOFIM||''/01'', ''YYYY/MM/DD'')), ''DD/MM/YYYY'')  AS DATAFIM '

              +  '      ,''Brasília-DF, '' || TO_CHAR(SYSDATE,''DD'')  ||           '
              +  '       '' de '' || TRIM(TO_CHAR(SYSDATE,''month''))  ||           '
              +  '       '' de '' || TO_CHAR(SYSDATE,''YYYY'') AS DSDATAASSINATURA  '

              +  '      , ''PRESTACAO_CONTAS_FINAL_INSS_'' || '
              +  '         REPLACE(PF.PERIODOINI, ''/'', '''') || ''_'' ||          '
              +  '         REPLACE(PF.PERIODOFIM, ''/'', '''') || ''_'' ||          '
              +  '         PF.SIGLA ||''_''|| TO_CHAR(SYSDATE,''DDMMYYYY_HH_MI_SS'') ||''.pdf'' '
              +  '        AS NOME_ARQUIVO   '
              +  '  FROM ( '
              +  ' SELECT P.SIGLA                                                        '
              +  '      , E.NOMEESTADO                                                   '
              +  '      , P.SINONIMO ||'' - ''|| U.SIGLA AS SINONIMO                     '
              +  '      , UC.SINONIMO AS CENTRALIZADOR                                   '
              +  '      , P.SINONIMO AS CODSINONIMO                                      '
              +  '      , P.MESREFERENCIA AS MESCOMPETENCIA                              '
              +  '      , dense_rank() over( order by P.SIGLA, P.MESREFERENCIA ) AS ORDEM'
              +  '      , SUM(P.REEMBOLSADO) AS VLRREEMBOLSO                             '
              +  '      , SYSDATE AS DATARECEBIMENTO                                     '
              +  '      , SUM(P.DESEMBOLSADO) AS VLRDESEMBOLSO                           '
              +  '      , MAX(P.DATAPAGAMENTO) AS DATAPAGAMENTO                          '
              +  '      , SUM(P.DIFERENCA) AS VLRDIFERENCA                               '

              +  '      , (SELECT MIN(PI.MESREFERENCIA) FROM PRESTACAOCONTASINSS PI      '
              +  '         WHERE PI.SINONIMO = P.SINONIMO                                '
              +  '           AND PI.MESREFERENCIA >= ' + QuotedStr( sMesAnoInicio )
              +  '           AND PI.MESREFERENCIA <= ' + QuotedStr( sMesAnoFinal )
              +  '        ) AS PERIODOINI                                                '
              +  '      , (SELECT MAX(PF.MESREFERENCIA) FROM PRESTACAOCONTASINSS PF      '
              +  '         WHERE PF.SINONIMO = P.SINONIMO                                '
              +  '           AND PF.MESREFERENCIA >= ' + QuotedStr( sMesAnoInicio )
              +  '           AND PF.MESREFERENCIA <= ' + QuotedStr( sMesAnoFinal )
              +  '        ) AS PERIODOFIM                                                '

              +  '      , SUM(DECODE(SUBSTR(P.DESCRICAO,1,1), ''1'', P.DESEMBOLSADO, 0)) AS VLR_INDICACAO_C '
              +  '      , SUM(DECODE(SUBSTR(P.DESCRICAO,1,1), ''2'', P.DESEMBOLSADO, 0)) AS VLR_INDICACAO_M '
              +  '      , SUM(DECODE(SUBSTR(P.DESCRICAO,1,1), ''4'', P.DESEMBOLSADO, 0)) AS VLR_INDICACAO_P '

              +  '      , SUBSTR(P.MESREFERENCIA,1,4) AS ANOCOMPETENCIA                  '
              +  '      , P.NOMERESPONSAVEL                                              '
              +  '      , P.CPFRESPONSAVEL                                               '
              +  '      , P.CARGORESPONSAVEL                                             '

              +  ' FROM PRESTACAOCONTASINSS P                                            '
              +  ' JOIN UFINSS U  ON U.SINONIMO = P.SINONIMO                             '
              +  ' JOIN UFINSS UC ON UC.SIGLA = U.SIGLACENTRAL                           '
              +  ' JOIN ESTADO E ON E.CODESTADO = U.SIGLA                                '
              +  ' WHERE UC.SINONIMO <> 156787                                           '
              +  '   AND P.SINONIMO =  ' + QuotedStr( sSinonimo )
              +  '   AND P.MESREFERENCIA >=  ' + QuotedStr( sMesAnoInicio )
              +  '   AND P.MESREFERENCIA <=  ' + QuotedStr( sMesAnoFinal )
              +  ' GROUP BY P.MESREFERENCIA                                              '
              +  '      , P.SINONIMO                                                     '
              +  '      , P.SIGLA                                                        '
              +  '      , E.NOMEESTADO                                                   '
              +  '      , U.SIGLA                                                        '
              +  '      , UC.SINONIMO                                                    '
              +  '      , P.NOMERESPONSAVEL                                              '
              +  '      , P.CPFRESPONSAVEL                                               '
              +  '      , P.CARGORESPONSAVEL                                             '
              +  ' ) PF   '
              +  ' ORDER BY PF.SINONIMO, PF.MESCOMPETENCIA ';

        FazQuery(qryPcINSSFinal, ssql);
     end;

     tcJustificativa : begin
        sSql :=  ' SELECT DISTINCT P.DS_VALORESNAOPAGO   '
              +  '   FROM PRESTACAOCONTASINSS P          '
              +  '  WHERE P.DIFERENCA <> 0               '
              +  '    AND P.SINONIMO =  ' + QuotedStr( sSinonimo )
              +  '    AND P.MESREFERENCIA >=  ' + QuotedStr( sMesAnoInicio )
              +  '    AND P.MESREFERENCIA <=  ' + QuotedStr( sMesAnoFinal )
              +  ' ORDER BY P.DS_VALORESNAOPAGO ';

        FazQuery(qryJustifica, ssql);
     end;

     tcBeneficios : begin
        sSql :=  ' SELECT P.NUMEROBENEFICIO        '
              +  '   FROM PRESTACAOCONTASINSS P    '
              +  '  WHERE P.DIFERENCA <> 0         '
              +  '    AND P.SINONIMO =  ' + QuotedStr( sSinonimo )
              +  '    AND P.MESREFERENCIA >=  ' + QuotedStr( sMesAnoInicio )
              +  '    AND P.MESREFERENCIA <=  ' + QuotedStr( sMesAnoFinal )               
              +  ' ORDER BY P.NUMEROBENEFICIO ';

        FazQuery(qryBenef, ssql);
     end;
    end;
  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;


procedure TfrmPrestacaoContasINSS.gerarArquivoFinalEnvioINSS;
var
   sSQL, sSinonimo, sArquivo,
   sMesInicio,sMesFinal : string;
   bArquivoGerado, bDiferenca, bPara : boolean;
   sMesesFalta, sMsg : string;
begin
  sMesInicio  := PegaAnoMesRef(cmb_mesInicio,spn_anoInicio);
  sMesFinal   := PegaAnoMesRef(cmb_mesFinal,spn_anoFinal);

  if (sMesFinal = '') then
     Exit;

  consultarOrgaosINSS();

  if qryOrgaosINSS.IsEmpty then
   begin
    MsgDlg('Não existe prestação de contas a ser gerada.','Informação', mtInformation, [mbOk], 0);
    Exit;
   end;

  sMesesFalta := '';

  if not (verificaMesesPrestacaoContas(sMesInicio,sMesFinal, sMesesFalta)) then
   begin
     MsgDlg('Não é possível gerar relatório final pois não existe prestação de contas para o período informados.','Informação', mtInformation, [mbOk], 0);
     Exit;
   end
  else if sMesesFalta <> '' then
   begin
     repeat
       sMsg := sMsg + char(10) + copy(sMesesFalta, 1, 90);
       sMesesFalta := StringReplace(sMesesFalta, copy(sMesesFalta, 1, 90), '', []);
     until sMesesFalta = '';
     sMsg := 'Não existe prestação de contas para o(s) mês(es):'+char(10)+sMsg;

     MsgDlg(sMsg,'Informação', mtInformation, [mbOk], 0);
     Exit;
   end;

  bArquivoGerado := False;

  //monta estrutura para gerar o relatório
  sSQL := qryPcINSSFinal.SQL.text;
  cdsPcINSSFinal.data := Padroes.GetDataPacket(sSQL);
  bPara := false;
  try
    While (not qryOrgaosINSS.Eof) and (not bPara) do
     begin

       //busca dados
       consultarRelatorioArquivoFinalEnvioINSS(tcDados, qryOrgaosINSS.FieldByName('SINONIMO').AsString, sMesInicio, sMesFinal );

       if not qryPcINSSFinal.eof then
       begin
         sArquivo := qryPcINSSFinal.FieldbyName('NOME_ARQUIVO').AsString;
         bDiferenca := false;

         if not bArquivoGerado then
            bArquivoGerado := true;

         while not qryPcINSSFinal.eof do
         begin
           cdsPcINSSFinal.Insert;
           cdsPcINSSFinal.FieldByName('ORIGEM').AsString          := qryPcINSSFinal.FieldByName('ORIGEM').AsString;
           cdsPcINSSFinal.FieldByName('SIGLA').AsString           := qryPcINSSFinal.FieldByName('SIGLA').AsString;
           cdsPcINSSFinal.FieldByName('SINONIMO').AsString        := qryPcINSSFinal.FieldByName('SINONIMO').AsString;
           cdsPcINSSFinal.FieldByName('CODSINONIMO').AsString     := qryPcINSSFinal.FieldByName('CODSINONIMO').AsString;
           cdsPcINSSFinal.FieldByName('CENTRALIZADOR').AsString   := qryPcINSSFinal.FieldByName('CENTRALIZADOR').AsString;
           cdsPcINSSFinal.FieldByName('MESCOMPETENCIA').AsString  := qryPcINSSFinal.FieldByName('MESCOMPETENCIA').AsString;
           cdsPcINSSFinal.FieldByName('ORDEM').AsInteger          := qryPcINSSFinal.FieldByName('ORDEM').AsInteger;
           cdsPcINSSFinal.FieldByName('VLRREEMBOLSO').AsFloat     := qryPcINSSFinal.FieldByName('VLRREEMBOLSO').AsFloat;
           cdsPcINSSFinal.FieldByName('DATARECEBIMENTO').AsString := retornaDataRecebimento(qryPcINSSFinal.FieldByName('DATAPAGAMENTO').AsString);
           cdsPcINSSFinal.FieldByName('VLRDESEMBOLSO').AsFloat    := qryPcINSSFinal.FieldByName('VLRDESEMBOLSO').AsFloat;
           cdsPcINSSFinal.FieldByName('DATAPAGAMENTO').AsString   := qryPcINSSFinal.FieldByName('DATAPAGAMENTO').AsString;
           cdsPcINSSFinal.FieldByName('VLRDIFERENCA').AsFloat     := qryPcINSSFinal.FieldByName('VLRDIFERENCA').AsFloat;

           cdsPcINSSFinal.FieldByName('DATAINI').AsString         := qryPcINSSFinal.FieldByName('DATAINI').AsString;
           cdsPcINSSFinal.FieldByName('DATAFIM').AsString         := qryPcINSSFinal.FieldByName('DATAFIM').AsString;
           cdsPcINSSFinal.FieldByName('PERIODOINI').AsString      := qryPcINSSFinal.FieldByName('PERIODOINI').AsString;
           cdsPcINSSFinal.FieldByName('PERIODOFIM').AsString      := qryPcINSSFinal.FieldByName('PERIODOFIM').AsString;
           cdsPcINSSFinal.FieldByName('DSDATAASSINATURA').AsString:= qryPcINSSFinal.FieldByName('DSDATAASSINATURA').AsString;

           cdsPcINSSFinal.FieldByName('NOMEESTADO').AsString      := qryPcINSSFinal.FieldByName('NOMEESTADO').AsString;
           cdsPcINSSFinal.FieldByName('ANOCOMPETENCIA').AsString  := qryPcINSSFinal.FieldByName('ANOCOMPETENCIA').AsString;
           cdsPcINSSFinal.FieldByName('NOMERESPONSAVEL').AsString := qryPcINSSFinal.FieldByName('NOMERESPONSAVEL').AsString;
           cdsPcINSSFinal.FieldByName('CPFRESPONSAVEL').AsString  := qryPcINSSFinal.FieldByName('CPFRESPONSAVEL').AsString;
           cdsPcINSSFinal.FieldByName('CARGORESPONSAVEL').AsString:= qryPcINSSFinal.FieldByName('CARGORESPONSAVEL').AsString;

           cdsPcINSSFinal.FieldByName('VLR_INDICACAO_C').AsFloat  := qryPcINSSFinal.FieldByName('VLR_INDICACAO_C').AsFloat;
           cdsPcINSSFinal.FieldByName('VLR_INDICACAO_M').AsFloat  := qryPcINSSFinal.FieldByName('VLR_INDICACAO_M').AsFloat;
           cdsPcINSSFinal.FieldByName('VLR_INDICACAO_P').AsFloat  := qryPcINSSFinal.FieldByName('VLR_INDICACAO_P').AsFloat;

           if  Abs(qryPcINSSFinal.FieldByName('VLRDIFERENCA').AsFloat) > 0 then
           begin
             cdsPcINSSFinal.FieldByName('NUMPROCINSS').AsString   := 'Vide anexo';
             cdsPcINSSFinal.FieldByName('JUSTIFICATIVA').AsString := 'Vide anexo';
           end;

           if (not bDiferenca) and ( Abs(qryPcINSSFinal.FieldByName('VLRDIFERENCA').AsFloat) > 0) then
              bDiferenca := true;

           cdsPcINSSFinal.Post;

           qryPcINSSFinal.next;
         end;

         //gera relatorio
         cdsPcINSSFinal.Filter := 'CODSINONIMO = '+qryOrgaosINSS.FieldByName('SINONIMO').AsString;
         cdsPcINSSFinal.Filtered := true;
         
         ppdPcINSSFinal.Report.TextFileName     := 'C:\Planus\Temp\' + sArquivo;
         ppdPcINSSFinal.Report.AllowPrintToFile := True;
         ppdPcINSSFinal.Report.ShowPrintDialog  := False;
         ppdPcINSSFinal.Report.DeviceType       :='PDFFile';
         ppdPcINSSFinal.Report.Print;

         //gera relatorio de diferenças
         if bDiferenca then
            gerarRelatorioDiferencas(qryOrgaosINSS.FieldByName('SINONIMO').AsString);

         // para apresentar o relatório na tela descomentar o trecho
         {begin
           ppdPcINSSFinal.Report.Template.SaveTo  := stFile;
           ppdPcINSSFinal.Report.Template.Format  := ftASCII;
           ppdPcINSSFinal.Report.Device           := dvScreen;
           TFrmPreview.CreateModalPreview(Application, ppdPcINSSFinal.Report, 'Relatório Final de Prestação de Contas do INSS');
         end;}

         cdsPcINSSFinal.Filtered := false;

       end;

       qryOrgaosINSS.Next;

     end;

  Except
    on e: Exception do
     begin
        MsgDlg('Erro ao gerar arquivos da prestação final de contas.' + #13 + 'Erro: ' + e.Message,'Erro',mtError, [mbOk, mbHelp], 0);
        bbtnCancelar.Enabled := True;
        bArquivoGerado := false;
        Exit;
     end;
  end;

  if bArquivoGerado then
   begin
    MsgDlg('Arquivo(s) de prestação final de contas gerado(s) com sucesso.','Informação', mtInformation, [mbOk], 0);
    gerarRelatorioFinalTodos('');
   end
  Else
   begin
    MsgDlg('Não é possível gerar arquivos pois não existe prestação de contas para o período e parâmetros informados.','Informação', mtInformation, [mbOk], 0);
   end;

  bbtnCancelar.Enabled := True;
end;


procedure TfrmPrestacaoContasINSS.gerarRelatorioFinalTodos(sNomeArquivo: String);
begin
   cdsPcINSSFinal.Filtered := false;
   cdsPcINSSFinal.First;
   cdsPcINSSFinal.IndexName := 'ORDENA';

   ppdPcINSSEnvio.Report.Template.SaveTo  := stFile;
   ppdPcINSSEnvio.Report.Template.Format  := ftASCII;
   ppdPcINSSEnvio.Report.Device           := dvScreen;
   TFrmPreview.CreateModalPreview(Application, ppdPcINSSFinal.Report, 'Relatório Final de Prestação de Contas do INSS');

   cdsPcINSSFinal.IndexName := '';
end;


procedure TfrmPrestacaoContasINSS.recuperaResponsavel;
var sSql : String;
begin

  Try
    sSql :=  ' SELECT DISTINCT            '
          +  '        P.NOMERESPONSAVEL,  '
          +  '        P.CPFRESPONSAVEL,   '
          +  '        P.CARGORESPONSAVEL, '
          +  '        P.MESREFERENCIA     '
          +  '   FROM CM.PRESTACAOCONTASINSS P '
          +  ' WHERE P.MESREFERENCIA >= ' + QuotedStr( PegaAnoMesRef(cmb_mesInicio, spn_anoInicio) )       //edilaine - SIG78760
          //+  '   AND P.MESREFERENCIA <= ' + QuotedStr( PegaAnoMesRef(cmb_mesFinal, spn_anoFinal) )       //edilaine - SIG78760
          +  ' ORDER BY P.MESREFERENCIA  ';

    if FazQuery(qryAux,sSql) and (not qryAux.IsEmpty) then
    begin
      edtNomeResponsavel.text  := qryAux.FieldByName('NOMERESPONSAVEL').AsString;
      edtCPFResponsavel.text   := qryAux.FieldByName('CPFRESPONSAVEL').AsString;
      edtCargoResponsavel.text := qryAux.FieldByName('CARGORESPONSAVEL').AsString;
    end;

    qryAux.Close;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;

end;


function TfrmPrestacaoContasINSS.retornaDataRecebimento(sDataPagamento: string): string;
var sSql : String;
begin

  Try
    sSql :=  'SELECT DU.DIA_UTIL '
          +  '  FROM (SELECT LAST_DAY(TO_DATE('+Quotedstr(sDataPagamento)+', ''DD/MM/YYYY''))+1 + ROWNUM - 1 DIA_UTIL, '
          +  '              CM.FN_EMP_QTDE_DIAS_UTEIS(LAST_DAY(TO_DATE('+Quotedstr(sDataPagamento)+', ''DD/MM/YYYY''))+1, '
          +  '                                        LAST_DAY(TO_DATE('+Quotedstr(sDataPagamento)+', ''DD/MM/YYYY''))+1 + ROWNUM - 1) AS NUM_UTIL '
          +  '          FROM ALL_OBJECTS   '
          +  '         WHERE ROWNUM <= 15  '
          +  '       ) DU  '
          +  ' WHERE DU.NUM_UTIL = 5 '
          +  ' ORDER BY DU.DIA_UTIL  ';

    if FazQuery(qryAux,sSql) and (not qryAux.IsEmpty) then
       result := qryAux.Fields[0].AsString
    else
       result := '';

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;

end;


procedure TfrmPrestacaoContasINSS.gerarRelatorioDiferencas(sSinonimo : string);
var sMesInicio, sMesFinal : string;
    sNomeArquivo, sSQL : String;
    sTitulo, sAnexo, sCentralizador : string;
begin

  sMesInicio := PegaAnoMesRef(cmb_mesInicio,spn_anoInicio);
  sMesFinal  := PegaAnoMesRef(cmb_mesFinal,spn_anoFinal);

  sSQL := consultarRelatorioAnaliticoEnvioDiferenca(sMesInicio, sMesFinal, sSinonimo);
  qryPcINSSAnal.data := Padroes.GetDataPacket(qryPcINSSAnal_old.SQL.text);

  if not qryPC.Eof then
  begin

    sCentralizador := qryPC.FieldByName('CENTRALIZADOR').AsString;

    While not qryPC.Eof do
     begin
        begin
          qryPcINSSAnal.Insert;
          qryPcINSSAnal.FieldByName('IDPESSOA').AsString       := qryPC.FieldByName('IDPESSOA').AsString;

          if qryPC.FieldByName('NUMPROCINSS').AsString <> '' then
            qryPcINSSAnal.FieldByName('NUMPROCINSS').AsString    := formataNumBeneficio(qryPC.FieldByName('NUMPROCINSS').AsString)
          Else
            qryPcINSSAnal.FieldByName('NUMPROCINSS').AsString    := '';

          if qryPC.FieldByName('NUMDOCUMENTO').AsString <> '' then
            qryPcINSSAnal.FieldByName('NUMDOCUMENTO').AsString   := formataNumCPF( qryPC.FieldByName('NUMDOCUMENTO').AsString )
          Else
            qryPcINSSAnal.FieldByName('NUMDOCUMENTO').AsString   := '';

          qryPcINSSAnal.FieldByName('ESPECIE').AsString        := qryPC.FieldByName('ESPECIE').AsString;
          qryPcINSSAnal.FieldByName('VALORREEMBOLSO').AsFloat  := qryPC.FieldByName('VALORREEMBOLSO').AsFloat;

          if qryPC.FieldByName('VALORREEMBOLSO').AsFloat = 0 then
            qryPcINSSAnal.FieldByName('VALORREEMBOLSOF').AsString := '  -   '
          Else
            qryPcINSSAnal.FieldByName('VALORREEMBOLSOF').AsString := FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORREEMBOLSO').AsFloat);

          qryPcINSSAnal.FieldByName('DESCRICAO').AsString      := qryPC.FieldByName('DESCRICAO').AsString;
          qryPcINSSAnal.FieldByName('VALORDESEMBOLSO').AsFloat := qryPC.FieldByName('VALORDESEMBOLSO').AsFloat;

          if qryPC.FieldByName('VALORDESEMBOLSO').AsFloat <> 0 then             //edilaine - SIG78760
            qryPcINSSAnal.FieldByName('VALORDESEMBOLSOF').AsString := FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORDESEMBOLSO').AsFloat)
          Else
            qryPcINSSAnal.FieldByName('VALORDESEMBOLSOF').AsString := '  -   ';

          qryPcINSSAnal.FieldByName('DATAPAGAMENTO').AsString  := qryPC.FieldByName('DATAPAGAMENTO').AsString;
          qryPcINSSAnal.FieldByName('DIFDESEMBOLSO').AsFloat   := qryPC.FieldByName('DIFERENCADESEMBOLSO').AsFloat;

          if qryPC.FieldByName('DIFERENCADESEMBOLSO').AsFloat <> 0 then
            qryPcINSSAnal.FieldByName('DIFDESEMBOLSOF').AsString := FormatFloat('###,###,##0.00',qryPC.FieldByName('DIFERENCADESEMBOLSO').AsFloat)
          Else
            qryPcINSSAnal.FieldByName('DIFDESEMBOLSOF').AsString := '  -   ';

          qryPcINSSAnal.FieldByName('VALORACERTO').AsFloat := qryPC.FieldByName('ACERTODESEMBOLSO').AsFloat;

          if qryPC.FieldByName('ACERTODESEMBOLSO').AsFloat <> 0 then
            qryPcINSSAnal.FieldByName('VALORACERTOF').AsString := FormatFloat('###,###,##0.00',qryPC.FieldByName('ACERTODESEMBOLSO').AsFloat)
          Else
            qryPcINSSAnal.FieldByName('VALORACERTOF').AsString := '  -   ';

          qryPcINSSAnal.FieldByName('DATAACERTO').AsString     := qryPC.FieldByName('DATAACERTO').AsString;
          qryPcINSSAnal.FieldByName('VALORDIFERENCA').AsFloat  := qryPC.FieldByName('VALORDIFERENCA').AsFloat;

          if qryPC.FieldByName('VALORDIFERENCA').AsFloat <> 0 then
            qryPcINSSAnal.FieldByName('VALORDIFERENCAF').AsString  := FormatFloat('###,###,##0.00',qryPC.FieldByName('VALORDIFERENCA').AsFloat)
          Else
            qryPcINSSAnal.FieldByName('VALORDIFERENCAF').AsString  := '  -   ';

          qryPcINSSAnal.FieldByName('VALORGLOSADO').AsFloat    := qryPC.FieldByName('VALORGLOSADO').AsFloat;

          qryPcINSSAnal.FieldByName('DS_JUSTIFICATIVA').AsString := qryPC.FieldByName('DS_VALORESNAOPAGO').AsString;
          qryPcINSSAnal.FieldByName('SINONIMO').AsString         := qryPC.fieldByName('CODSINONIMO').AsString + ' - ' +
                                                                    qryPC.fieldByName('SIGLA').AsString +' - '+ GetDadosEstado(qryPC.fieldByName('CODSINONIMO').AsString, false);
          qryPcINSSAnal.FieldByName('CENTRALIZADOR').AsString    := qryPC.fieldByName('CENTRALIZADOR').AsString;
          qryPcINSSAnal.FieldByName('MESREFERENCIA').AsString    := qryPC.fieldByName('DESCMESREFERENCIA').AsString;
          qryPcINSSAnal.Post;
        end;
        qryPC.Next;
     end;

     qryPcINSSAnal.IndexName := 'ORDENA';     //edilaine - SIG78760

     sNomeArquivo := 'C:\Planus\Temp\' + qryPC.FieldbyName('NOME_ARQUIVO').AsString;

     ppBndTotalSinonimo.visible := false;
     ppSummaryBand2.visible     := false;

     sAnexo  := pplblAnexo.caption;
     sTitulo := pplblTitulo1.caption;

     pplblAnexo.caption   := 'ANEXO';
     pplblTitulo1.caption := 'RELATÓRIO PRESTACAO DE CONTAS FINAL DE CONVÊNIO ( '+sCentralizador+ ' )';
     pplblTitulo2.Visible := false;
     ppdbCentral.visible  := false;

     // salva relatório no caminho informado
     ppdPcINSSAnal.Report.TextFileName     := sNomeArquivo;
     ppdPcINSSAnal.Report.AllowPrintToFile := True;
     ppdPcINSSAnal.Report.ShowPrintDialog  := False;
     ppdPcINSSAnal.Report.DeviceType       :='PDFFile';
     ppdPcINSSAnal.Report.Print;

     // para apresentar o relatório na tela descomentar o trecho
     {begin
       ppdPcINSSAnal.Report.Template.SaveTo  := stFile;
       ppdPcINSSAnal.Report.Template.Format  := ftASCII;
       ppdPcINSSAnal.Report.Device           := dvScreen;
       TFrmPreviewExport.CreateModalPreviewExpPipe(Application, ppdPcINSSAnal.Report, 'Relatório de Prestação de Contas do INSS - Diferenças');
     end; }
     
     qryPcINSSAnal.IndexName := '';

     ppSummaryBand2.visible := true;
     pplblAnexo.caption     := sAnexo;
     pplblTitulo1.caption   := sTitulo;
     pplblTitulo2.Visible   := true;
     ppdbCentral.visible    := true;

  end;
end;


function TfrmPrestacaoContasINSS.consultarRelatorioAnaliticoEnvioDiferenca(sMesInicio, sMesFinal, sSinonimo: String) : string;
var sSql : String;
begin
  Try
    sSql :=  ' SELECT P.IDPESSOA                                            '
          +  '       ,P.NOME                                                '
          +  '       ,P.NUMEROBENEFICIO AS NUMPROCINSS                      '
          +  '       ,P.NUMDOCUMENTO                                        '
          +  '       ,P.ESPECIE                                             '
          +  '       ,P.DESCRICAO                                           '
          +  '       ,P.SINONIMO AS CODSINONIMO                             '
          +  '       ,P.SIGLA                                               '
          +  '       ,P.SINONIMO || '' - '' || U.SIGLA AS DSSINONIMO        '
          +  '       ,UC.SINONIMO AS CENTRALIZADOR                          '
          +  '       ,P.CODORGAOLOCAL                                       '
          +  '       ,U.EMAIL                                               '
          +  '       ,P.MESREFERENCIA                                       '
          +  '       ,P.REEMBOLSADO AS VALORREEMBOLSO                       '
          +  '       ,P.DATAPAGAMENTO AS DATAPAGAMENTO                      '
          +  '       ,P.DESEMBOLSADO AS VALORDESEMBOLSO                     '
          +  '       ,ROUND(P.DIFERENCADESEMBOLSO,2) AS DIFERENCADESEMBOLSO '
          +  '       ,P.ACERTODESEMBOLSO                                    '
          +  '       ,P.GLOSADO AS VALORGLOSADO                             '
          +  '       ,P.DATAACERTO                                          '
          +  '       ,NVL(P.DS_VALORESNAOPAGO, '' '') AS DS_VALORESNAOPAGO  '
          +  '       ,P.IDBENEFICIO                                         '
          +  '       ,ROUND(P.DIFERENCA,2) AS VALORDIFERENCA                '

          +  '      , TO_CHAR(TO_DATE('+Quotedstr(sMesInicio)+'||''/01'', ''YYYY/MM/DD''), ''DD/MM/YYYY'') ||'' a ''|| '
          +  '        TO_CHAR(LAST_DAY(TO_DATE('+Quotedstr(sMesInicio)+'||''/01'', ''YYYY/MM/DD'')), ''DD/MM/YYYY'') AS DESCMESREFERENCIA '

          +  '       ,''PRESTACAO_CONTAS_FINAL_INSS_ANEXO_'' || '
          +  '        '+Quotedstr(StringReplace(sMesInicio, '/', '', []))+' ||''_'' || '
          +  '        '+Quotedstr(StringReplace(sMesFinal, '/', '', []))+' || ''_'' || '
          +  '        P.SIGLA ||''_''|| TO_CHAR(SYSDATE,''DDMMYYYY_HH_MI_SS'') ||''.pdf'' '
          +  '        AS NOME_ARQUIVO   '
          +  ' FROM CM.PRESTACAOCONTASINSS P                                '
          +  '    , CM.UFINSS U                                             '
          +  '    , CM.UFINSS UC                                            '
          +  ' WHERE P.SINONIMO  = U.SINONIMO                               '
          +  '   AND U.SIGLACENTRAL = UC.SIGLA                              '
          +  '   AND P.MESREFERENCIA >= ' + QuotedStr( sMesInicio )
          +  '   AND P.MESREFERENCIA <= ' + QuotedStr( sMesFinal )
          +  '   AND P.SINONIMO = ' + QuotedStr( sSinonimo )
          +  '   AND ABS(NVL(P.DIFERENCA,0)) > 0                            '
          +  '   AND UC.SINONIMO <> 156787                                  '
          +  ' ORDER BY DSSINONIMO                                          '
          +  '      , CENTRALIZADOR                                         '
          +  '      , ABS(NVL(P.DIFERENCA,0))                               '
          +  '      , DS_VALORESNAOPAGO                                     '
          +  '      , TRIM(ESPECIE)                                         '
          +  '      , NUMPROCINSS                                           '
          +  '      , NUMDOCUMENTO                                          '
          +  '      , VALORREEMBOLSO                                        '
          +  '      , VALORDESEMBOLSO                                       ';

    FazQuery(qryPC, ssql);

    result := sSql;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

function TfrmPrestacaoContasINSS.verificaMesesPrestacaoContas(
  sMesAnoInicio, sMesAnoFinal: String; var lstMesFalta: string) : boolean;
var sSql : String;
begin

  Try
    sSql :=  'SELECT M.MESES, NVL(PC.TOTAL, 0) AS TOTAL '
          +  '   FROM (SELECT TO_CHAR(ADD_MONTHS(TO_DATE('+Quotedstr(sMesAnoInicio)+' || ''/01'', ''YYYY/MM/DD''), '
          +  '                                   -1 + ROWNUM), '
          +  '                        ''YYYY/MM'') AS MESES    '
          +  '           FROM ALL_OBJECTS      '
          +  '          WHERE ROWNUM <= TRUNC(MONTHS_BETWEEN(ADD_MONTHS(TO_DATE('+Quotedstr(sMesAnoFinal)+'||''/01'', ''YYYY/MM/DD''),1), '
          +  '                                               TO_DATE('+QuotedStr(sMesAnoInicio)+'||''/01'', ''YYYY/MM/DD'')),0) '
          +  '         ) M  '
          +  '   LEFT JOIN (SELECT P.MESREFERENCIA, COUNT(*) AS TOTAL '
          +  '                FROM CM.PRESTACAOCONTASINSS P '
          +  '               WHERE MESREFERENCIA >= '+ QuotedStr( sMesAnoInicio )
          +  '                 AND MESREFERENCIA <= '+ QuotedStr( sMesAnoFinal )
          +  '               group by P.MESREFERENCIA     '
          +  '               order by P.MESREFERENCIA) PC '
          +  '     ON PC.MESREFERENCIA = M.MESES '
          +  '  ORDER BY M.MESES ';

    if FazQuery(qryAux,sSql) and (not qryAux.IsEmpty) then
     begin
       // verifica se todos os meses estao vazios
       qryAux.Filter := 'TOTAL <> 0';
       qryAux.Filtered := true;
       if qryAux.eof then
          result := false
       else
       begin
         result := true;
         
         qryAux.Filtered := false;
         qryAux.Filter := 'TOTAL = 0';
         qryAux.Filtered := true;

         while not qryAux.eof do
         begin
           lstMesFalta := lstMesFalta + iff(lstMesFalta = '', '', ', ') + qryAux.Fields[0].AsString;
           qryAux.next;
         end;
       end;
     end
    Else
     begin
       result := false;
     end;

    qryAux.Filter := '';
    qryAux.Filtered := false;
    qryAux.Close;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;

end;


function TfrmPrestacaoContasINSS.GetDadosEstado(sSinonimo: string; bSiglaNome : boolean): string;
var sSql : String;
    _qry : TwwQuery;
begin
   _qry := TwwQuery.create(nil);
  try
    _qry.DataBaseName := 'BaseDados';
    Result := '';
    Try
      sSql :=  ' SELECT U.SIGLA      '
            +  '       ,E.NOMEESTADO '
            +  ' FROM UFINSS U       '
            +  ' JOIN ESTADO E ON E.CODESTADO = U.SIGLA'
            +  ' WHERE U.SINONIMO = ' + sSinonimo;

      FazQuery(_qry, ssql);
      if not _qry.eof then
      begin
        if bSiglaNome then
           Result := _qry.Fields[0].AsString + ' - ' + _qry.Fields[1].AsString
        else
           Result := _qry.Fields[1].AsString;
      end;
    Except
      on e:Exception do
       begin
         raise;
       end;
    end;
  finally
    FreeAndNil(_qry);
  end;
end;


procedure TfrmPrestacaoContasINSS.RegistraLancamentosParaRetificar(Operacao : TOpRetifica;
   sMesInicio, sMesFinal, sMotivo: string; var iIdRetifica : integer);
var sSql : String;
    _qry : TwwQuery;
    ind : integer;
    lstCampos   : TStringList;
begin
   _qry := TwwQuery.create(nil);
   lstCampos := TStringList.create;
  try
    lstCampos.Add('SIGLA,               ');
    lstCampos.Add('CODORGAOLOCAL,       ');
    lstCampos.Add('SINONIMO,            ');
    lstCampos.Add('MESREFERENCIA,       ');
    lstCampos.Add('ESPECIE,             ');
    lstCampos.Add('REEMBOLSADO,         ');
    lstCampos.Add('DESEMBOLSADO,        ');
    lstCampos.Add('DIFERENCADESEMBOLSO, ');
    lstCampos.Add('ACERTODESEMBOLSO,    ');
    lstCampos.Add('DS_VALORESNAOPAGO,   ');
    lstCampos.Add('GLOSADO,             ');
    lstCampos.Add('DIFERENCA,           ');
    lstCampos.Add('IDPESSOA,            ');
    lstCampos.Add('NOME,                ');
    lstCampos.Add('NUMDOCUMENTO,        ');
    lstCampos.Add('NUMEROBENEFICIO,     ');
    lstCampos.Add('IDBENEFICIO,         ');
    lstCampos.Add('DESCRICAO,           ');
    lstCampos.Add('DATAPAGAMENTO,       ');
    lstCampos.Add('DATAACERTO,          ');
    lstCampos.Add('FLGTIPOBENEFICIO,    ');
    lstCampos.Add('TIPOBENEFICIO,       ');
    lstCampos.Add('PRESTACAOCONTASEFETIVADA, ');
    lstCampos.Add('FLGARQUIVOGERADO,    ');
    lstCampos.Add('NOMERESPONSAVEL,     ');
    lstCampos.Add('CPFRESPONSAVEL,      ');
    lstCampos.Add('CARGORESPONSAVEL,    ');
    lstCampos.Add('FLGPREVIA,           ');
    lstCampos.Add('FLGEFETIVADA         ');

    _qry.DataBaseName := 'BaseDados';

    Try
      if Operacao = trGrava then
      begin
        iIdRetifica := LeUltRegistro(_qry, 'PRESTACAOCONTASINSSRET');

        {copia lançamentos que serão apagados da prestação de contas}
        sSql :=  ' INSERT INTO PRESTACAOCONTASINSSRET '
              +  '    (IDRETIFICA, MOTIVORETIFICACAO, ' ;

        for ind := 0 to lstCampos.count-1 do
          sSql := sSql + lstCampos.Strings[ind]+' ';

        sSql := sSql +')  SELECT '+IntToStr(iIdRetifica)+ ', '+Quotedstr(sMotivo)+', ';

        for ind := 0 to lstCampos.count-1 do
          sSql := sSql + ' P.'+lstCampos.Strings[ind];

        sSql := sSql + ' FROM   PRESTACAOCONTASINSS  P '
                     + ' WHERE  P.MESREFERENCIA = ' + QuotedStr( sMesInicio );

        _qry.close;
        _qry.SQL.Text := sSQL;
        _qry.ExecSQL;

      end
      else if Operacao = trApaga then
      begin
        {apaga lançamentos que não foram retificados}
        sSQL := ' DELETE FROM PRESTACAOCONTASINSSRET PR '
              + ' WHERE  PR.IDRETIFICA = '+IntToStr(iIdRetifica)
              + ' AND    EXISTS ( SELECT 1 '
              + '           FROM PRESTACAOCONTASINSS P  '
              + '          WHERE P.SIGLA           = PR.SIGLA           '
              + '            AND P.CODORGAOLOCAL   = PR.CODORGAOLOCAL   '
              + '            AND P.SINONIMO        = PR.SINONIMO        '
              + '            AND P.MESREFERENCIA   = PR.MESREFERENCIA   '
              + '            AND P.NUMEROBENEFICIO = PR.NUMEROBENEFICIO '
              + '            AND P.MESREFERENCIA = ' + QuotedStr( sMesInicio )

              + '            AND nvl(PR.ESPECIE,0)              = nvl(P.ESPECIE,0)      '
              + '            AND nvl(PR.REEMBOLSADO,0)          = nvl(P.REEMBOLSADO,0)  '
              + '            AND nvl(PR.DESEMBOLSADO,0)         = nvl(P.DESEMBOLSADO,0) '
              + '            AND nvl(PR.DIFERENCADESEMBOLSO,0)  = nvl(P.DIFERENCADESEMBOLSO,0) '
              + '            AND nvl(PR.ACERTODESEMBOLSO,0)     = nvl(P.ACERTODESEMBOLSO,0)    '
              + '            AND nvl(PR.DS_VALORESNAOPAGO,0)    = nvl(P.DS_VALORESNAOPAGO,0)   '
              + '            AND nvl(PR.GLOSADO,0)              = nvl(P.GLOSADO,0)             '
              + '            AND nvl(PR.DIFERENCA,0)            = nvl(P.DIFERENCA,0)           '
              + '            AND nvl(PR.IDPESSOA,0)             = nvl(P.IDPESSOA,0)            '
              + '            AND nvl(PR.NUMDOCUMENTO,0)         = nvl(P.NUMDOCUMENTO,0)        '
              + '            AND nvl(PR.IDBENEFICIO,0)          = nvl(P.IDBENEFICIO,0)         '
              + '            AND nvl(PR.DESCRICAO,0)            = nvl(P.DESCRICAO,0)           '
              + '            AND nvl(PR.DATAPAGAMENTO,to_date(''01/01/1900'')) = nvl(P.DATAPAGAMENTO,to_date(''01/01/1900'')) '
              + '            AND nvl(PR.DATAACERTO,to_date(''01/01/1900''))    = nvl(P.DATAACERTO,to_date(''01/01/1900''))    '
              + '            AND nvl(PR.FLGTIPOBENEFICIO,0)     = nvl(P.FLGTIPOBENEFICIO,0)    '
              + '            AND nvl(PR.TIPOBENEFICIO,0)        = nvl(P.TIPOBENEFICIO,0)       '
              + '       ) ' ;

        _qry.close;
        _qry.SQL.Text := sSQL;
        _qry.ExecSQL;

      end;
    Except
      on e:Exception do
       begin
         raise;
       end;
    end;
  finally
    FreeAndNil(_qry);
    FreeAndNil(lstCampos);
  end;

end;

procedure TfrmPrestacaoContasINSS.gerarRelatorioPrestacaoContas;
var sMesRef: string;
   sMesInicio,sMesFinal : String;
begin
  sMesInicio := PegaAnoMesRef(cmb_mesInicio,spn_anoInicio);
  sMesFinal  := PegaAnoMesRef(cmb_mesFinal,spn_anoFinal);

  bbtnGerarArquivo.Enabled := false;
  bbtnEnviar.Enabled       := false;
  bbtnEfetivar.Enabled     := false;
  bbtnConfirmar.Enabled    := false;

  consultarOrgaosINSS();

  if qryOrgaosINSS.IsEmpty then
   begin
    MsgDlg('Não existe prestação de contas a ser gerada.','Informação', mtInformation, [mbOk], 0);
    Exit;
   end;

  qryOrgaosINSS.Close;

  if not chkSomenteRel.Checked then
  begin
    Try
      bbtnCancelar.Enabled  := False;
      pnProcessando.Visible := True;
      ProgressBar.Min       := 0;
      ProgressBar.Max       := 0;
      ProgressBar.step      := 1;
      ProgressBar.Position  := 0;

    Try

      if not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

      apagarPrestacaoContas(sMesInicio, sMesFinal);

      if bCancelarOperacao then
        raise Exception.Create('Operação cancelada pelo usuário');

      qryPC.Close;

      if rbOpcRelPreviaSIM.Checked then
         gerarPrestacaoContas( tpPrevia, sMesInicio, sMesFinal)
      Else if rbOpcRelEfetivacaoSIM.Checked then
         gerarPrestacaoContas( tpEfetivacao, sMesInicio, sMesFinal);

      if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Commit;

    Except
      on e: Exception do
       begin
          if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.RollBack;
          if ( e.Message = 'Operação cancelada pelo usuário' ) then
             MsgDlg('Operação cancelada pelo usuário','Aviso',mtInformation, [mbOk, mbHelp], 0)
          Else
             MsgDlg('Erro ao gerar prestação de contas.' + #13 + 'Mensagem: ' + e.Message,'Erro',mtError, [mbOk, mbHelp], 0);

          bbtnCancelar.Enabled := True;
          Exit;
       end;
    end;

    Finally
      pnProcessando.Visible := False;
      ProgressBar.Min       := 0;
      ProgressBar.Max       := 0;
      ProgressBar.step      := 1;
      ProgressBar.Position  := 0;
    end;

    if qryPC.IsEmpty then
     begin
      MsgDlg('Não existe prestação de contas a ser gerada.','Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
     end;

  end;

  if (rbOpcRelEfetivacaoSIM.Checked) and rbOpcaoAnalitico.Checked then
    bbtnGerarArquivo.Enabled := True;


  if rbOpcaoAnalitico.Checked  then
     gerarRelatorioAnalitico()
  Else if rbOpcaoSintetico.Checked then
     gerarRelatorioSintetico();

  bbtnCancelar.Enabled := True;

end;


procedure TfrmPrestacaoContasINSS.rbOpcRelFinalClick(Sender: TObject);
begin
  inherited;
  sAnoMesInicio := PegaAnoMesRef(cmb_mesInicio, spn_anoInicio);
  if sAnoMesInicio = '' then
     exit;

  gbDataFinal.Visible := rbOpcRelFinal.checked;

  if rbOpcRelFinal.checked then
  begin
    rbOpcaoAnalitico.checked  := true;
    bbtnConfirmar.Enabled     := false;
    bbtnGerarArquivo.Enabled  := false;
    bbtnEfetivar.Enabled      := false;
    bbtnEnviar.Enabled        := false;
    bbtnGerarArqFinal.enabled := true;
    rgTipoRelatorio.enabled   := false;
  end
  else if rbOpcRelRetificadoSIM.checked then
  begin
    rbOpcaoAnalitico.checked  := true;
    bbtnConfirmar.Enabled     := true;
    bbtnGerarArquivo.Enabled  := ( bPrestacaoContasGerada and  bPrestacaoContasEfetivacao and ( not bPrestacaoContasEfetivada ) );
    bbtnEfetivar.Enabled      := ( bPrestacaoContasGerada and  bPrestacaoContasEfetivacao and bArquivoINSSGerado and ( not bPrestacaoContasEfetivada ) );
    bbtnEnviar.Enabled        := ( bPrestacaoContasGerada and bArquivoINSSGerado and  bPrestacaoContasEfetivada and ( not bArquivoINSSEnviado ) );
    bbtnGerarArqFinal.enabled := false;
    rgTipoRelatorio.enabled   := false;
  end
  else
  begin
    bbtnCancelar.Enabled     := True;
    bbtnConfirmar.Enabled    := not ( bPrestacaoContasGerada and bPrestacaoContasEfetivada );
    bbtnGerarArquivo.Enabled := ( bPrestacaoContasGerada and  bPrestacaoContasEfetivacao and ( not bPrestacaoContasEfetivada ) );
    bbtnEfetivar.Enabled     := ( bPrestacaoContasGerada and  bPrestacaoContasEfetivacao and bArquivoINSSGerado and ( not bPrestacaoContasEfetivada ) );
    bbtnEnviar.Enabled       := ( bPrestacaoContasGerada and bArquivoINSSGerado and  bPrestacaoContasEfetivada and ( not bArquivoINSSEnviado ) );
    rbOpcRelRetificadoSIM.Enabled := ( bPrestacaoContasGerada and bPrestacaoContasEfetivada and bArquivoINSSEnviado) or (bPrestacaoRetificada);
    bbtnGerarArqFinal.enabled := false;
    rgTipoRelatorio.enabled   := true;
  end;
end;


procedure TfrmPrestacaoContasINSS.spn_anoInicioChange(Sender: TObject);
begin
  inherited;
  cmb_mesInicioChange(Sender);
end;

procedure TfrmPrestacaoContasINSS.ppLblSinonimoPrint(Sender: TObject);
begin
  inherited;
  ppLblSinonimo.Caption := cdsPcINSSFinal.FieldByName('SINONIMO').AsString + ' - ' +
                           cdsPcINSSFinal.FieldByName('NOMEESTADO').AsString;
end;
//edilaine - SIG78760 - fim


end.





