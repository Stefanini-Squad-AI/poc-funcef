// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -----------------------------------------------------------------------------
//Pendência   : MIGRACAO-ORACLE
//Responsável : Edilane
//Data        : 14/10/2025
//Descrição   : Casting de campos, remover aspas, espaços e acentos dos nomes de campos
//--------------------------------------------------------------------------------------
// Alteracao   : btnDeleteClick
// Pendência   : WO13803
// Responsável : Helen V Bianchi
// Data        : 25/09/2024
// Descrição   : Adicionado a exclusao da MOVDIVIDA  quando excluir a divida.
//--------------------------------------------------------------------------------------
// Alteracao   : (.dfm) Consulta , sbtnExcluiDetClick, bbtnOkDetClick,sbtAltProvisaoClick
// Pendência   : WO8288
// Responsável : Helen V Bianchi
// Data        : 01/03/2024
// Descrição   : Adicionado Log de Movimentaçao na HSTDIVIDABENEFICIO p qq alteração
//--------------------------------------------------------------------------------------
//Alteracao   : ExecutarEnvio 
//Pendência   : 136150
//Responsável : leandro
//Data        : 27/07/2023
//Descrição   : alterar a conta contábil no momento de gerar/baixar os boletos emitidos
// -----------------------------------------------------------------------------
// Alteracao   : (.dfm) Consulta, ExecutarEnvio, UpdateHSTDIVIDABENEFICIO
// Pendência   : 126276
// Responsável : Marcos Lima / Edilaine
// Data        : 03/08/2023
// Descrição   : Historico de Movimentos da Divida
// Descrição   : Alterada rotina busca parametros
// -----------------------------------------------------------------------------
// Alteracao   :
// Pendência   : 137257
// Responsável : leandro
// Data        : 30/06/2023
// Descrição   : Permitir '-' ',' '.' no campo valor previsto
//------------------------------------------------------------------------------
// Alteracao   : VerificarRecebimentoTMPDESC, ExecutarDesfazerEnvio
// Pendência   : 134478
// Responsável : edilaine
// Data        : 10/04/2023
// Descrição   : Nao permite desfazer envio - aviso que previa foi executada
//------------------------------------------------------------------------------
// Alteracao   : sbtAltProvisaoClick
// Pendência   : 134593
// Responsável : edilaine
// Data        : 24/04/2023
// Descrição   : Tratamento de baixa definitiva parcial
// --------------------------------------------------------------------------------
// Alteracao   : (dfm tsDividaBenef, updCap)
// Pendência   : 132927
// Responsável : Luis Ferrari
// Data        : 23/02/2023
// Descrição   : Ajuste no plano financeiro do rateio na emissão do boleto
// --------------------------------------------------------------------------------
// Alteracao   : (dfm tsDividaBenef, updCap)
// Pendência   : 115304
// Responsável : edilaine
// Data MERGE  : 25/01/2023
// Data        : 21/10/2021
// Descrição   : Inclusão de tratamento para contabilização da Provisão de Perdas
// --------------------------------------------------------------------------------
//Rotina      : (dfm dbedDataPrev) UpdateHSTDIVIDABENEFICIO, wwDBEdit1KeyPress
//Pendência   : 128237
//Responsável : Edilaine
//Data        : 23/08/2022
//Descrição   : Data inicial da divida fixa em dia 20 ou proximo dia util
//------------------------------------------------------------------------------
//Alteraçao   : (.dfm) dbtxtNumProcINSS, lblNumBenefINSS
//Alterações  : .DFM
//Pendência   : SIG33744 (SOL 231442/18314)
//Responsável : BRUNO AZEVEDO DOS SANTOS / Edilaine
//Data MERGE  : 05/07/2022
//Data        : 27/07/2018
//Descrição   : Criação dos campos Status, Observação e Numprocinss das dívidas de benefícios,
//              assim como a mudança de diversos controles da funcionalidade.
//              ajuste para marcar a opção "Não" no flag Atualizar Saldo Devedor
// ------------------------------------------------------------------------------------
//Alteraçao   : (.dfm) qry_cab
//Pendência   : SIG 119678
//Responsável : Edilaine
//Data        : 01/10/2021
//Descrição   : Alterar tipo de campo do No. de Beneficio INSS
//------------------------------------------------------------------------------
//Alteraçao   : (.dfm) dbtxtNumProcINSS, lblNumBenefINSS
//Pendência   : SIG 56256
//Responsável : Edilaine
//Data        : 15/06/2020
//Descrição   : Vinculaçao do No. de Beneficio INSS na dívidas geradas
//------------------------------------------------------------------------------
// Nº SIG.....: SIG TIBERO
// Data.......: 05/03/2018
// Responsável: Everson Luiz Pereira da Cunha
// Descrição..: Melhoria no Planus para adequação ao TIBERO.
//              Inclusão de alias nas tabelas e campos.
//              Retirar INDEX, +rule etc
// -----------------------------------------------------------------------------
//Pendência   : SIG 30731
//Responsável : William Moreira da Silva
//Data        : 03/10/2016
//Descrição   : Atualizar campo FLGPORTFORMA com 0 (zero)
// -----------------------------------------------------------------------------
//Pendência   : SOL 254805 PPM 806470
//Responsável : Petri Nocentini
//Data        : 25/05/2014
//Descrição   : Listagem das parcelas deve aparecer em ordem decrescente do mês
//              de cobrança
// -----------------------------------------------------------------------------
//Pendência   : SOL 237951 PPM 493275
//Responsável : Fernando Xavier
//Data        : 05/09/2014
//Descrição   : ERRO CONTABILIZAÇÃO DIVIDA BENEFICIO: adequar o módulo Folha de
//              Benefícios a documentação atualizada e homologada da
//              funcionalidade de Controle de dívida de Benefícios
// -----------------------------------------------------------------------------
//Pendência   : SOL 232999/16147 PPM 409169
//Responsável : Fernando Xavier
//Data        : 09/06/2014
//Descrição   : ao efetuar o envio das parcelas o sistema não esta efetivanto a operação.
//---------------------------------------------------------------------------------------
//Pendência   : SOL 231492 PPM 374038
//Responsável : William Moreira da Silva
//Data        : 06/05/2014
//Descrição   : Ajuste na funcionalidade de alteração de Valor
// -----------------------------------------------------------------------------
//Pendência   : SOL 230290 KINTANA 350993
//Responsável : Fernando Xavier
//Data        : 02/05/2014
//Descrição   : Ajustar a rotina de envio para que grave o plano contabil corretamente.
//---------------------------------------------------------------------------------------
//Pendência   : SOL 230444 PPM 363495
//Responsável : Felipe A. Santos
//Data        : 28/04/2014
//Alteração Form : permitir control + c e control + v no campo matrícula da
//                 funcionalidade de procurar, alteração somente no dfm
//Descrição   : foi mudado o campo matrícula para caracter para permitir a operação
//              Ctrl + c e Ctrl + v.
// -----------------------------------------------------------------------------
//Pendência   : SOL 226903/15867 KINTANA 2061652
//Responsável : Douglas Siqueira
//Data        : 27/03/2014
//Descrição   : Alteração na gravação do valor previsto / valor parcela.
// -----------------------------------------------------------------------------
//Pendência   : SOL 174933 KINTANA 1733374
//Responsável : Douglas Siqueira
//Data        : 10/01/2014
//Descrição   : Controle de Saldo devedor.

unit FHstDividaBenef3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs
  ,uCtrlDocumento,uCtrlPadroes, FCadMestreDetCS, ppDB, StdCtrls, Mask,
  wwdblook, DBCtrls, wwdbedit, ppDBPipe, ppDBBDE, ppParameter, ppModule,
  raCodMod, ppBands, ppCtrls, jpeg, ppVar, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, Db, DBTables, Wwquery,
  CmEventosCadastro, ImgList, MontaSelect, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, uIntegraBack,
  UControleDividaBenef, uCMTypes, TREdit;
  
type
  TFrmHstDividaBenef3 = class(TfrmCadMestreDetalheCS)
    btnSelTudo: TBitBtn;
    btnInverte: TBitBtn;
    qryDet: TwwQuery;
    qryDetSELECIONAR: TStringField;
    qryDetMESREFERENCIA: TStringField;
    qryDetMESCOBRANCA: TStringField;
    qryDetVALORPREVISTO: TFloatField;
    qryDetVALORRECEBIDO: TFloatField;
    qryDetDATAPREVISTA: TDateTimeField;
    qryDetDATAEFETIVA: TDateTimeField;
    qryDetNUMEROPARCELA: TFloatField;
    qryDetQUANTIDADEPARCELASPAGAS: TFloatField;
    qryDetDESCRICAO: TStringField;
    qryDetFLGSITUACAO: TStringField;
    qryDetOBSERVACAO: TStringField;
    qryDetIDHISTORICODIVIDABENEFICIOREF: TFloatField;
    qryDetCODPORTFORMA: TFloatField;
    qryDetIDCONTROLEDIVIDABENEFICIO: TFloatField;
    qryDetIDHSTORICODIVIDABENEFICIO: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDTITULAR: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDBENEFICIO: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetIDPLANPREVCONTAB: TFloatField;
    qryDetIDMOTIVO: TFloatField;
    qryDetFLGSITUACAO2: TFloatField;
    qryDetVALORPARCELA: TFloatField;
    qryDetMESINICIO: TDateTimeField;
    qryDetQTDEPARCELAS: TFloatField;
    qryDetMatricula: TStringField;
    qryDetCODDOCUMENTO: TStringField;
    updDet: TUpdateSQL;
    query_cab: TwwQuery;
    query_cabMATRICULA: TStringField;
    query_cabNOME: TStringField;
    query_cabNOMEPLANPREV: TStringField;
    query_cabFONTEPAGADORA: TStringField;
    query_cabNOMEBENEFICIO: TStringField;
    query_cabIDCONTROLEDIVIDABENEFICIO: TFloatField;
    query_cabIDTITULAR: TFloatField;
    query_cabIDPESSOA: TFloatField;
    query_cabIDPLANOPREV: TFloatField;
    query_cabIDBENEFICIO: TFloatField;
    query_cabSALDODEVEDORATUAL: TFloatField;
    query_cabMESINICIO: TDateTimeField;
    query_cabMESFIM: TDateTimeField;
    query_cabVALORULTIMAPARCELA: TFloatField;
    query_cabIDCONTROLEDIVIDABENEFICIO_1: TFloatField;
    query_cabVALORPARCELA: TFloatField;
    query_cabSALDODEVEDORINICIAL: TFloatField;
    query_cabPERCENTUAL: TFloatField;
    query_cabQTDEPARCELAS: TFloatField;
    query_cabVALORBENEFICIO: TFloatField;
    query_cabFLGACAOJUD: TFloatField;
    query_cabSALDOPROVPERDA: TFloatField;
    query_cabSALDOBAIXADEF: TFloatField;
    dscab: TwwDataSource;
    updCap: TUpdateSQL;
    ppReport1: TppReport;
    ppTitleBand1: TppTitleBand;
    ppLabel41: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel56: TppLabel;
    ppLabel68: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppImage1: TppImage;
    ppHeaderBand3: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLabel13: TppLabel;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppLabel23: TppLabel;
    ppLabel25: TppLabel;
    ppLabel4: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppDetailBand3: TppDetailBand;
    ppShape17: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel31: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    raCodeModule2: TraCodeModule;
    ppParameterList1: TppParameterList;
    ppBDEPipeline1: TppBDEPipeline;
    qryRelatorio: TwwQuery;
    qryRelatorioSelecionar: TStringField;
    qryRelatorioMatricula: TStringField;
    qryRelatorioNome: TStringField;
    qryRelatorioPlanoContab: TFloatField;
    qryRelatorioBeneficio: TStringField;
    qryRelatorioDtLancDivida: TDateTimeField;
    qryRelatorioVlrBenef: TFloatField;
    qryRelatorioSaldoDevIni: TFloatField;
    qryRelatorioSaldoDevAtual: TFloatField;
    qryRelatorioUltParcela: TFloatField;
    qryRelatorioVlrParcela: TFloatField;
    qryRelatorioIniCobr: TDateTimeField;
    qryRelatorioFimCobr: TDateTimeField;
    qryRelatorioPercentual: TFloatField;
    qryRelatorioQtdePagas: TFloatField;
    qryRelatorioQtdeParcelas: TFloatField;
    qryRelatorioAtualizarSaldo: TStringField;
    qryRelatorioFLGSITUACAO: TFloatField;
    qryRelatorioIDCONTROLEDIVIDABENEFICIO: TFloatField;
    qryRelatorioIDHSTORICODIVIDABENEFICIO: TFloatField;
    qryRelatorioIDPESSOA: TFloatField;
    qryRelatorioIDTITULAR: TFloatField;
    qryRelatorioIDPESSJUR: TFloatField;
    qryRelatorioIDBENEFICIO: TFloatField;
    qryRelatorioIDPLANOPREV: TFloatField;
    qryRelatorioIDMOTIVO: TFloatField;
    qryRelatorioCODDOCUMENTO: TStringField;
    UpdateSQL1: TUpdateSQL;
    dsControleDivida: TwwDataSource;
    qryLkPORTADORFORMA: TwwQuery;
    qryLkPORTADORFORMADESCRICAO: TStringField;
    qryLkPORTADORFORMACODPORTFORMA: TFloatField;
    lbl_matri: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    dbedDataPrev: TwwDBEdit;
    dbMesCobr: TwwDBEdit;
    dbmmoOBSERVACAO: TDBMemo;
    dbchk2: TDBCheckBox;
    cboNCobra_D: TwwDBLookupCombo;
    medtvenc: TMaskEdit;
    medtanomescob: TMaskEdit;
    chkSusp: TCheckBox;
    btnProcessar: TBitBtn;
    bbtnDesfazer: TmaHelpBitBtn;
    ToolbarButton971: TToolbarButton97;
    lbl12: TLabel;
    dbtxtMATRICULA: TDBText;
    lbl13: TLabel;
    dbtxtMATRICULA1: TDBText;
    lbl1: TLabel;
    dbtxtNOMEPLANPREV: TDBText;
    dbtxtNOMEBENEFICIO: TDBText;
    lbl3: TLabel;
    dbtxtMESINICIO: TDBText;
    lbl2: TLabel;
    dbtxtMESFIM: TDBText;
    lbl5: TLabel;
    dbtxtVALORULTIMAPARCELA: TDBText;
    lbl6: TLabel;
    lbl7: TLabel;
    query_cabULT: TDateTimeField;
    dbtxtVALORULTIMAPARCELA1: TDBText;
    dbref: TwwDBLookupCombo;
    qryLkRefe: TwwQuery;
    chkParcela: TCheckBox;
    qryLkRefeIDHSTORICODIVIDABENEFICIO: TFloatField;
    btnProcurar: TBitBtn;
    query_cabFLGATUALIZARSALDO: TFloatField;
    query_cabFLGPORTFORMA: TFloatField;
    btnDelete: TBitBtn;
    qryLkRefeNUMEROPARCELA: TFloatField;
    lbl18: TLabel;
    dbtxtIDCONTROLEDIVIDABENEFICIO1: TDBText;
    query_cabQUANTIDADEPARCELASPAGAS: TFloatField;
    cbbStatusDivida: TComboBox;
    lblStatusDivida: TLabel;
    edtMotivoAlteracao: TwwDBEdit;
    lblMotivoAlt: TLabel;
    qryDetFLGSTATUS: TFloatField;
    qryDetFLGQUITADO: TFloatField;
    qryDetSTATUSDIVIDA: TStringField;
    qryDetMOTIVO: TStringField;
    query_cabFLGSTATUS: TFloatField;
    query_cabSTATUSDIVIDA: TStringField;
    query_cabMOTIVO: TStringField;
    memObservacaoInsert: TMemo;
    ppLabel19: TppLabel;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    query_cabNUMPROCINSS: TStringField;
    lblNumBenefINSS: TLabel;
    dbtxtNumProcINSS: TDBText;
    query_cabFLGQUITADOSTR: TStringField;
    query_cabFLGQUITADO: TFloatField;
    qryDetTIPOPAGAMENTO: TStringField;
    qryDetTIPOPAGTO: TStringField;
    ppLabel36: TppLabel;
    ppShape11: TppShape;
    ppDBText12: TppDBText;
    btnRelatorio: TToolbarButton97;
    chkAcaoJud: TDBCheckBox;
    sbtAltProvisao: TSpeedButton;
    pnl1: TPanel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    medtME_anomes: TMaskEdit;
    medt1: TMaskEdit;
    cbb_tipo_recebedor: TComboBox;
    btnFiltro: TBitBtn;
    GroupBox2: TGroupBox;
    dbtxtIDCONTROLEDIVIDABENEFICIO: TDBText;
    lbl4: TLabel;
    dbtxtSALDODEVEDORATUAL: TDBText;
    Label1: TLabel;
    dbtxtSALDOPROVISAO: TDBText;
    Label2: TLabel;
    dbtxtSALDOBAIXA: TDBText;
    tbsMovDivida: TTabSheet;
    qryMovDivida: TwwQuery;
    dsMovDivida: TwwDataSource;
    dbgrdMovDivida: TwwDBGrid;
    ppMovDivida: TppReport;
    ppTitleBand2: TppTitleBand;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel42: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel43: TppLabel;
    ppImage2: TppImage;
    ppHeaderBand1: TppHeaderBand;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel55: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel63: TppLabel;
    pplblMatricula: TppLabel;
    pplblNome: TppLabel;
    pplblCodDivida: TppLabel;
    pplblNomeBenef: TppLabel;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppLabel75: TppLabel;
    ppLabel77: TppLabel;
    pplblStatusDiv: TppLabel;
    pplblNumINSS: TppLabel;
    ppShape23: TppShape;
    ppDetailBand1: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel82: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    raCodeModule1: TraCodeModule;
    ppParameterList2: TppParameterList;
    ppBDEMovDivida: TppBDEPipeline;
    ppShape25: TppShape;
    ppShape24: TppShape;
    ppLabel61: TppLabel;
    medtValorPrevisto: TRealEdit;
    procedure Consulta(_iddivida:string);

    //procedure InserirHSTDIVIDABENEFICIO(_IDCONTROLE,_IDPESSOA,_IDTITULAR,_IDPESSJUR,_IDBENEFICIO,      //edilaine SIG115304
    function  InserirHSTDIVIDABENEFICIO(_IDCONTROLE,_IDPESSOA,_IDTITULAR,_IDPESSJUR,_IDBENEFICIO,
                                        _IDPLANOPREV,_MESREFERENCIA,_MESCOBRANCA,_VLQUITACAO,_dataprevista,
                                        _FLGDESCFOLHA,_FLGSITUACAO,_flgParcial,_CODPORTFORMA, _OBSERVACAO:string //BRUNO AZEVEDO SIG33744
                                       ) : integer;   //edilaine SIG115304  

    procedure ExecSaveRel(var Rpt: TppReport);
    procedure gerar_impressao;
    procedure ExecutarEnvio;
    procedure ExecutarRecebimento;
    procedure ExecutarDesfazerEnvio;
    function  VerificarRecebimentoTMPDESC : Boolean;

    procedure UpdateHSTDIVIDABENEFICIO(_flgsituacao:string);
    function RetornaSaldoAtualizado(_datainicio:string;_saldodevedoratual:Double):Double;
    function RetornaSaldoAtualizadoRegReplan(_saldodevedoratual:Double):Double;
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure medtValorPrevistoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure btnSelTudoClick(Sender: TObject);
    procedure btnInverteClick(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure ppHeaderBand3BeforePrint(Sender: TObject);
    procedure dbEditValorPrevistoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtAltProvisaoClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure dbEditValorPrevistoKeyPress(Sender: TObject; var Key: Char);
    procedure medtValorPrevistoKeyPress(Sender: TObject; var Key: Char);
    procedure dbMesCobrKeyPress(Sender: TObject; var Key: Char);
    procedure medtanomescobEnter(Sender: TObject);
    procedure dbedDataPrevExit(Sender: TObject);
    procedure dbgrdDetDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure tbcDetalheChange(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure qryMovDividaAfterOpen(DataSet: TDataSet);
    procedure medtValorPrevistoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
   ctrlDocumento: tctrlDocumento;
   mmObsAux : TMemo;      //edilaine SIG33744
   bPrevia  : boolean;    //edilaine 134478
   sDataPrevista , sVlParcela : string; //Helen WO8288

   procedure CarregaDadosDivida;   //edilaine SIG115304

  public
    { Public declarations }
    lCodLancCAPCAR,iIdLoteConcessao,iFlgIncluiMesConc:longint;
    doDelete,doInsert:boolean;
    idhistdelete,sAnoMesLoteConcessao:string;
    iddivida:string;
    qtCk:Integer;
    sDataFolha : string;      //edilaine 128237
  end;

var
  FrmHstDividaBenef3: TFrmHstDividaBenef3;

implementation

{$R *.DFM}
  uses
  UDataBase,UAdmPrev,USistema,UMensErro,DBaseDados,FPreview,FSelecionaLote,
  FHstDivBenefAltOpcao, UFuncoesUteis, FHstDivBenefAltProvisao;
{ TFrmCadMestreDetalheCS1 }


// edilaine - 22/01/2014 - SOL 174933
function iif(condicao : boolean; sVlrTrue, sVlrFalse : string) : string;
begin
  if condicao then result := sVlrTrue
              else result := sVlrFalse;
end;

procedure ExecDeleteDocumento(sCodDocumento : string);
var ctrlDocumento: tctrlDocumento;
begin
  {//edilaine SIG33744 - inicio
  with TwwQuery.create(nil) do
    try
      DataBaseName :='BaseDados';

      // limpando rateiodocum
      SQL.Clear;
      SQL.Add('DELETE FROM RATEIODOCUM WHERE CODDOCUMENTO = '+sCodDocumento);
      ExecSQL;
      Active:=false;

      // limpando lanctodocum
      SQL.Clear;
      SQL.Add('DELETE FROM LANCTODOCUM WHERE CODDOCUMENTO = '+sCodDocumento);
      ExecSQL;
      Active:=false;

      // limpando documento
      SQL.Clear;
      SQL.Add('DELETE FROM DOCUMENTO WHERE CODDOCUMENTO = '+sCodDocumento);
      ExecSQL;

      //GravaLogTOTALPREV ('DOCUMENTO -DELETE- (REFERENCIA)CODDOCUMENTO = '+sCodDocumento);

    finally
      free;
    end;   }

  Try
    try
      CtrlDocumento := TCtrlDocumento.Create;
      CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
    except
      FreeAndNil(CtrlDocumento);
      Exit;
    end;

    CtrlDocumento.Prepare(opDocumento, odlEfetivo);

    CtrlDocumento.IdEspAcesso  := Sistema.IdEspAcesso;
    CtrlDocumento.IdUsuario    := Sistema.IdUsuario;
    CtrlDocumento.IdModulo     := Sistema.IdModulo;
    CtrlDocumento.CodDocumento := StrToFloat(sCodDocumento);
    CtrlDocumento.Delete;
  Finally
    FreeAndNil(CtrlDocumento);
  end;
  //edilaine SIG33744 : fim
end;


function DocumentoJaBaixado(_CODDOCUMENTO : string):Boolean;
begin
  Result := false;

  if trim(_CODDOCUMENTO) <> '' then
  begin
    with TwwQuery.Create(nil) do
      try
        DatabaseName:='BaseDados';
        Active:=False;
        SQL.Clear;
        SQL.Add('SELECT CODDOCUMENTO FROM DOCUMENTO  ');
        SQL.Add(' WHERE CODDOCUMENTO ='+Trim(_CODDOCUMENTO));    //edilaine SIG33744
        //SQL.Add('   AND (STATUS = 2 or EMISBLOQ=''S'')');      //edilaine SIG33744
        SQL.Add('   AND STATUS <> 0 ');                          //edilaine SIG33744
        Active:=True;

        result := not IsEmpty;
      finally
       close;
       Destroy;
      end;
  end;
end;


function TFrmHstDividaBenef3.VerificarRecebimentoTMPDESC : Boolean;
begin
  with TwwQuery.Create(nil) do
    try
      DataBaseName :='BaseDados';
      Active:=false;
      SQL.Clear;
      SQL.Add('Select DATARECEBIMENTO FROM TMPDESC WHERE REFERENCIA = '+#39+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text+#39);
      SQL.Add(' and idpessoa= '+#39+qrydet.FieldByName('IDPESSOA').text+#39);
      SQL.Add(' and idtitular= '+#39+qrydet.FieldByName('IDTITULAR').text+#39);
      SQL.Add(' and mescobranca= '+#39+qrydet.FieldByName('MESCOBRANCA').text+#39);
      Open;

      //edilaine 134478 : inicio
      //result := FieldByName('DATARECEBIMENTO').Text <> '';
      bPrevia  := FieldByName('DATARECEBIMENTO').Text <> '';

      result := bPrevia;
      //edilaine 134478 : fim

    finally
      Close;
      Destroy;
    end;
end;
// edilaine - 22/01/2014 - SOL 174933






procedure TFrmHstDividaBenef3.Consulta(_iddivida: string);
var
I:Integer;
begin
qryDet.Active:=False;
qryDet.SQL.Clear;
//qryDet.SQL.Add('SELECT ''N'' "SELECIONAR",      ');      //MIGRACAO-ORACLE
qryDet.SQL.Add('SELECT ''N'' SELECIONAR,      ');          //MIGRACAO-ORACLE

//BRUNO AZEVEDO INÍCIO SIG33744
qryDet.SQL.Add('       c.flgstatus,');
//qryDet.SQL.Add('       decode(c.flgstatus, 1, ''Ativa'', 2, ''Suspensa'', 3, ''Encerrada'', '''') as StatusDivida,');  //edilaine SIG115304
qryDet.SQL.Add('       c.observacao as motivo,');
qryDet.SQL.Add('       h.tipopagamento,');
qryDet.SQL.Add('       decode(h.tipopagamento, ''F'', ''Folha'', ''Boleto'') as tipopagto,');
qryDet.SQL.Add('       h.flgdevolucao,');
qryDet.SQL.Add('       c.FLGQUITADO, ');
//BRUNO AZEVEDO FIM SIG33744

qryDet.SQL.Add('       C.IDCONTROLEDIVIDABENEFICIO,');
qryDet.SQL.Add('       H.IDHSTORICODIVIDABENEFICIO,');
qryDet.SQL.Add('       C.IDPESSOA,');
qryDet.SQL.Add('       C.IDTITULAR,');
qryDet.SQL.Add('       C.IDPESSJUR,');
qryDet.SQL.Add('       C.IDBENEFICIO,');
qryDet.SQL.Add('       C.IDPLANOPREV,');
qryDet.SQL.Add('       C.IDMOTIVO,');
qryDet.SQL.Add('       H.IDHISTORICODIVIDABENEFICIOREF ,');
qryDet.SQL.Add('       H.MESCOBRANCA,');
qryDet.SQL.Add('       H.MESREFERENCIA,');
qryDet.SQL.Add('       DECODE(H.FLGDEVOLUCAO, 1, -H.VALORPREVISTO, H.VALORPREVISTO) VALORPREVISTO, ');    //edilaine - SIG33744
qryDet.SQL.Add('       H.VALORRECEBIDO,');
qryDet.SQL.Add('       H.DATAPREVISTA,');
qryDet.SQL.Add('       H.DATAEFETIVA,');
qryDet.SQL.Add('       H.NUMEROPARCELA,');
qryDet.SQL.Add('       c.QUANTIDADEPARCELASPAGAS,');
qryDet.SQL.Add('       c.VALORPARCELA,');
qryDet.SQL.Add('       H.CODPORTFORMA,');
qryDet.SQL.Add('       (SELECT DESCRICAO FROM PORTADORFORMA WHERE CODPORTFORMA=H.CODPORTFORMA)DESCRICAO  ,');
qryDet.SQL.Add('       H.FLGSITUACAO AS FLGSITUACAO2,');
qryDet.SQL.Add('       decode(H.FLGSITUACAO,0,''Preparada'',''1'',''Enviada'',''2'',''Enviada e Não Recebida'',3,''Recebida'',4,''Recebida com Divergência'',5,''Suspensa'')FLGSITUACAO,');
qryDet.SQL.Add('       H.OBSERVACAO,');
qryDet.SQL.Add('       C.MESINICIO,');
qryDet.SQL.Add('       C.Qtdeparcelas,');
qryDet.SQL.Add('       NVL(H.CODDOCUMENTO,0) AS CODDOCUMENTO ,');  //SOL 232999/16147 PPM 409169/
qryDet.SQL.Add('       h.dataprevista,');
//qryDet.SQL.Add('       (select matricula from depentit d where d.idpessoa = c.idpessoa and d.idtitular = c.idtitular) as "Matrícula", ');     //MIGRACAO-ORACLE
qryDet.SQL.Add('       (select matricula from depentit d where d.idpessoa = c.idpessoa and d.idtitular = c.idtitular) as Matricula, ');         //MIGRACAO-ORACLE
qryDet.SQL.Add('       C.SALDODEVEDORINICIAL, ');
qryDet.SQL.Add('       C.SALDODEVEDORATUAL,   ');
//edilaine SIG115304 :  inicio
qryDet.SQL.Add('       decode(c.flgstatus, 1, ''Ativa'', 2, DECODE(C.FLGACAOJUD, 1, ''Susp. Jud'', ''Susp. Adm''), 3, ''Encerrada'', '''') as StatusDivida,');
qryDet.SQL.Add('       C.SALDOPROVPERDA,      ');
qryDet.SQL.Add('       C.SALDOBAIXADEF,       ');
qryDet.SQL.Add('       H.VLRPROVPERDA,        ');
qryDet.SQL.Add('       H.VLRBAIXADEF,         ');
qryDet.SQL.Add('       H.VLRREVPROVISAO,      ');
qryDet.SQL.Add('       H.VLRREVBAIXADEF,      ');
qryDet.SQL.Add('       H.PLNCODIGO,           ');
// Inicio SIG 132927 Ferrari
qryDet.SQL.Add('       (SELECT PI.IDPLANPREVCONTAB                                           ');
qryDet.SQL.Add('         FROM BENEFBFCIARIO BF                                               ');
qryDet.SQL.Add('         JOIN PERFILINVEST PI                                                ');
qryDet.SQL.Add('         ON PI.IDPERFILINVEST = BF.IDPERFILINVEST                            ');
qryDet.SQL.Add('         WHERE BF.IDPESSOA    = C.IDPESSOA                                   ');
qryDet.SQL.Add('         AND BF.IDTITULAR   = C.IDTITULAR                                    ');
qryDet.SQL.Add('         AND BF.IDPESSJUR   = C.IDPESSJUR                                    ');
qryDet.SQL.Add('         AND BF.IDPLANOPREV = C.IDPLANOPREV                                  ');
qryDet.SQL.Add('         AND BF.IDBENEFICIO = C.IDBENEFICIO                                  ');
qryDet.SQL.Add('         AND BF.NUMEROPROCESSO = C.NUMEROPROCESSO) AS IDPLANPREVCONTAB       ');
// FIM SIG 132927
//edilaine SIG115304 :  fim
qryDet.SQL.Add('  FROM HSTDIVIDABENEFICIO H,CONTROLEDIVIDABENEFICIO C     ');
qryDet.SQL.Add(' WHERE ');
qryDet.SQL.Add('   C.IDCONTROLEDIVIDABENEFICIO = H.IDCONTROLEDIVIDABENEFICIO');
//qryDet.SQL.Add('   AND H.IDCONTROLEDIVIDABENEFICIO = '+_iddivida);
qryDet.SQL.Add('   AND H.IDCONTROLEDIVIDABENEFICIO = '+_iddivida + 'ORDER BY H.MESCOBRANCA DESC'); //Petri SOL 254805 PPM 806470

qryDet.Active:=True;
  dbgrdDet.Columns[0].ReadOnly:=True;
  for i:= 1 to 11 do
   dbgrdDet.Columns[i].ReadOnly:=True;

  //Marcos Lima SIG126276 - Inicio
  qryMovDivida.Close;
  qryMovDivida.SQL.Clear;
  qryMovDivida.SQL.Add('SELECT ');
  qryMovDivida.SQL.Add('       CASE           ');
  qryMovDivida.SQL.Add('         WHEN MD.FLGSTATUS = 1 THEN ''Dívida Ativa''    ');
  qryMovDivida.SQL.Add('         WHEN MD.FLGSTATUS = 2 AND MD.FLGACAOJUD = 1 THEN ''Suspensa - Jud''    ');
  qryMovDivida.SQL.Add('         WHEN MD.FLGSTATUS = 2 AND MD.FLGACAOJUD <>1 THEN ''Suspensa - Adm''    ');
  qryMovDivida.SQL.Add('         WHEN MD.FLGSTATUS = 3 AND MD.FLGQUITADO = 1 THEN ''Dívida Quitada''    ');
  qryMovDivida.SQL.Add('         WHEN MD.FLGSTATUS = 3 AND MD.FLGQUITADO = 0 THEN ''Dívida Encerrada''  ');
  qryMovDivida.SQL.Add('       END AS STATUS, ');
  qryMovDivida.SQL.Add('       MD.DATAMOV,    ');
  qryMovDivida.SQL.Add('       TM.DESCRICAO AS OPEORIGEM, ');
  qryMovDivida.SQL.Add('       MD.SALDODEVEDORANT      AS SALDO_ANTERIOR, ');
  qryMovDivida.SQL.Add('       MD.SALDODEVEDORATUAL    AS SALDO_ATUAL,    ');
  qryMovDivida.SQL.Add('       MD.VALORULTIMAPARCELA,      ');
  qryMovDivida.SQL.Add('       MD.VALORPARCELA,            ');
  qryMovDivida.SQL.Add('       MD.QTDEPARCELASANT,         ');
  qryMovDivida.SQL.Add('       MD.QTDEPARCELASATUAL,       ');
  qryMovDivida.SQL.Add('       MD.MESINICIO,               ');
  qryMovDivida.SQL.Add('       MD.MESFIM,                  ');

  qryMovDivida.SQL.Add('       DECODE(MD.FLGDESCFOLHA, ''B'', ''Folha'', ''Boleto'') AS FLGDESCFOLHA, ');
  qryMovDivida.SQL.Add('       MD.FLGATUALIZARSALDO,       ');
  qryMovDivida.SQL.Add('       DECODE(MD.FLGATUALIZARSALDO, 1, ''Sim'', ''Não'') AS FLGATUSALDO, ');
  qryMovDivida.SQL.Add('       PF.DESCRICAO AS PORTADOR,   ');
  qryMovDivida.SQL.Add('       MD.FLGPORTFORMA,            ');
  qryMovDivida.SQL.Add('       MD.SALDOPROVPERDA,          ');
  qryMovDivida.SQL.Add('       MD.SALDOBAIXADEF,           ');
  qryMovDivida.SQL.Add('       MD.PARCELA,                 '); //WO8288 - Helen

  qryMovDivida.SQL.Add('       US.NOMEUSUARIO              ');
  qryMovDivida.SQL.Add('  FROM MOVDIVIDA           MD      ');
  qryMovDivida.SQL.Add('  JOIN TIPOMOVDIVIDA       TM      ');
  qryMovDivida.SQL.Add('    ON TM.IDTIPOMOVDIVIDA = MD.IDTIPOMOVDIVIDA ');

  qryMovDivida.SQL.Add('  LEFT JOIN PORTADORFORMA  PF      ');
  qryMovDivida.SQL.Add('    ON PF.CODPORTFORMA = MD.FLGPORTFORMA ');

  qryMovDivida.SQL.Add('  LEFT JOIN USUARIOSISTEMA US      ');
  qryMovDivida.SQL.Add('    ON TO_CHAR(US.IDUSUARIO) = SUBSTR(MD.TRGUSERINCLUSAO,3,10)');
  //SIG136150 - WO9347 Ini
  //qryMovDivida.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO = ' + qryDet.FieldByname('IDCONTROLEDIVIDABENEFICIO').AsString);
  qryMovDivida.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO = ' +_iddivida);
  //SIG136150 - WO9347 Fim
  qryMovDivida.SQL.Add(' ORDER BY  MD.TRGDTINCLUSAO  DESC  '); //WO8288 - Helen
  qryMovDivida.Open;
  //Marcos Lima SIG126276 - Fim  
end;

procedure TFrmHstDividaBenef3.ExecSaveRel(var Rpt: TppReport);
begin
Rpt.DeviceType       := 'ExcelFile';
Rpt.AllowPrintToFile := True;
Rpt.ShowPrintDialog  := True;
Rpt.TextFileName:='C:\PLANUS\TEMP\CONTROLEDIVIDABENEFICIO'+FormatDateTime('DD_MM_YYYY', date);
Rpt.Print;
end;

procedure TFrmHstDividaBenef3.ExecutarDesfazerEnvio;
var
 query:TwwQuery;
 flgsituacaoaodeletar:string;
 passou:Boolean;
 sTabela,sCampo : string; // edilaine - 22/01/2014 - SOL 174933
 sMensagem : string;   //edilaine SIG134478

    procedure ExecDeleteHSTDIVIDABENEFICIO;
    begin
      query.Active:=false;
      query.SQL.Clear;
      query.SQL.Add('DELETE HSTDIVIDABENEFICIO WHERE IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
      query.ExecSQL;
      GravaLogTOTALPREV ('HSTDIVIDABENEFICIO -DELETE- IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
    end;

    //function ProcurarTMPDESC:Boolean;
    function ProcurarLancamento(sTabela,sCampo : string) : boolean;     // edilaine - 22/01/2014 - SOL 174933
    begin
      query.Active:=false;
      query.SQL.Clear;
      query.SQL.Add('Select 1 FROM '+sTabela+' WHERE '+sCampo+' = '+#39+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text+#39);     // edilaine - 22/01/2014 - SOL 174933
      query.SQL.Add(' and idpessoa= '+#39+qrydet.FieldByName('IDPESSOA').text+#39);
      query.SQL.Add(' and idtitular= '+#39+qrydet.FieldByName('IDTITULAR').text+#39);
      query.SQL.Add(' and mescobranca= '+#39+qrydet.FieldByName('MESCOBRANCA').text+#39);
      query.Open;
      if query.IsEmpty then
         result:=False
      else
         result:=True;

      query.Close;
    end;

    procedure ExecDeleteTMPDESC;
    begin
      query.Active:=false;
      query.SQL.Clear;
      query.SQL.Add('DELETE TMPDESC WHERE REFERENCIA = '+#39+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text+#39);
      query.SQL.Add(' and idpessoa= '+#39+qrydet.FieldByName('IDPESSOA').text+#39);
      query.SQL.Add(' and idtitular= '+#39+qrydet.FieldByName('IDTITULAR').text+#39);
      query.SQL.Add(' and mescobranca= '+#39+qrydet.FieldByName('MESCOBRANCA').text+#39);
      query.ExecSQL;
      GravaLogTOTALPREV ('TMPDESC -DELETE- (REFERENCIA)IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
      query.Close;
    end;

begin

  query:=TwwQuery.Create(Self);
  query.DataBaseName :='BaseDados';
  query.Active:=false;
  query.SQL.Clear;

  passou:=False;

  qrydet.Filter:='Selecionar ='+#39+'S'+#39;
  qrydet.Filtered:=True;
  qrydet.Active:=True;

  if qrydet.IsEmpty then
    begin
      MsgDlg( 'É necessário selecionar pelo menos uma parcela para processamento.','Informação',mtInformation,[mbOk],0);
      qrydet.Filtered:=FALSE;
      Exit;
    end;

  try
    flgsituacaoaodeletar:='';

    bPrevia  := false;    //edilaine 134478

    qrydet.First;
    while not qrydet.eof do
     begin

       // verifica se houve baixa do documento
       //if ((qrydet.FieldByName('CODPORTFORMA').Text <> '') and (DocumentoJaBaixado( qrydet.FieldByName('CODDOCUMENTO').Text))) or
       //   ((qrydet.FieldByName('CODPORTFORMA').Text = '')  and (VerificarRecebimentoTMPDESC)) then

        if ((qrydet.FieldByName('TIPOPAGAMENTO').text = 'B') and (DocumentoJaBaixado( qrydet.FieldByName('CODDOCUMENTO').Text))) or
           ((qrydet.FieldByName('TIPOPAGAMENTO').Text = 'F') and (VerificarRecebimentoTMPDESC())) then
          begin
            qrydet.next;
            Continue;
          end;

       //sTabela := iif(qrydet.FieldByName('CODPORTFORMA').Text='', 'TMPDESC', 'HSTDIVIDABENEFICIO');  // edilaine - 22/01/2014 - SOL 174933
       //sCampo  := iif(qrydet.FieldByName('CODPORTFORMA').Text='', 'REFERENCIA','IDHSTORICODIVIDABENEFICIO');  // edilaine - 22/01/2014 - SOL 174933

       sTabela := iif(Trim(qrydet.FieldByName('TIPOPAGAMENTO').Text)='F', 'TMPDESC',   'HSTDIVIDABENEFICIO');  // edilaine - 22/01/2014 - SOL 174933
       sCampo  := iif(Trim(qrydet.FieldByName('TIPOPAGAMENTO').Text)='F', 'REFERENCIA','IDHSTORICODIVIDABENEFICIO');  // edilaine - 22/01/2014 - SOL 174933

       if (qrydet.FieldByName('FLGSITUACAO2').Text = '1') or (qrydet.FieldByName('FLGSITUACAO2').Text = '2') then
         begin                                                        

           if ProcurarLancamento(sTabela, sCampo) = true then   // edilaine - 22/01/2014 - SOL 174933
             begin
               if (qrydet.FieldByName('CODDOCUMENTO').Text > '0') then
                 begin
                   ExecDeleteDocumento(qrydet.FieldByName('CODDOCUMENTO').Text);
                   lCodLancCAPCAR := 0;
                 end;
                 UpdateHSTDIVIDABENEFICIO('0');///flgsituacao = 3-recebida
             end;

             //  UpdateHSTDIVIDABENEFICIO('0');
             ExecDeleteTMPDESC;

             flgsituacaoaodeletar:='1';
         end;
         passou := True;

       qrydet.Next;
     end;

 finally
    if passou then
      begin

        if flgsituacaoaodeletar = '0' then
          MsgDlg('Preparo de parcelas de cobranças mensal desfeito com sucesso.','Informação',mtInformation,[mbOk],0)
        else
          MsgDlg('Envio de parcelas de cobranças mensal desfeito com sucesso.','Informação',mtInformation,[mbOk],0);
      end
    else
    begin
      //edilaine SIG134478 : inicio
      //if flgsituacaoaodeletar = '0' then
      //   MsgDlg( 'Não foi possível desfazer o preparo.','Informação',mtInformation,[mbOk],0)
      //else
      //   MsgDlg( 'Não foi possível desfazer o envio.','Informação',mtInformation,[mbOk],0);

      sMensagem := 'Não foi possível desfazer o '+iff(flgsituacaoaodeletar = '0', 'preparo', 'envio')+'.';
      if bPrevia then
         sMensagem := sMensagem +char(10)+char(13)+
                      'Parcela está na Prévia e já foi efetivado.'+char(10)+char(13)+
                      'Favor entrar em contato com o setor de Pagamento de Benefício';

      MsgDlg(sMensagem, 'Informação',mtInformation,[mbOk],0);
      //edilaine SIG134478 : fim
    end;

    qrydet.Filtered:=False;
    FreeAndNil(query);
 end;
end;

procedure TFrmHstDividaBenef3.ExecutarEnvio;
var
   query_temp:TwwQuery;
   passou:boolean;
   lstSqlAtuDoc : TStringList;   //edilaine - SIG33744
   recPag   : string;       //William Santana - SIG33744
   iRetorno : integer;      //edilaine - SIG33744
   recParam : TParametros;  //edilaine - SIG33744
   sMensagem  : TStringList;     //edilaine - SIG33744
begin

  //BRUNO AZEVEDO INÍCIO SIG33744
  if (query_cab.FieldByName('FLGSTATUS').AsInteger <> 1) or
     (query_cab.FieldByName('FLGQUITADO').AsInteger = 1) then begin
    MsgDlg( 'Não foi possível efetuar o Envio.','Informação',mtInformation,[mbOk],0);
    Exit;
  end;
  //BRUNO AZEVEDO FIM SIG33744

  query_temp:=TwwQuery.Create(Self);
  query_temp.DataBaseName :='BaseDados';
  query_temp.Active:=false;
  query_temp.SQL.Clear;

  lstSqlAtuDoc := TStringList.create;     //edilaine - SIG33744
  sMensagem    := TStringList.create;     //edilaine - SIG33744

  iIdLoteConcessao := 0;

  if (iIdLoteConcessao <= 0) and (qrydet.FieldByName('TIPOPAGAMENTO').AsString = 'F')
  then begin
     iIdLoteConcessao := SelecionaLoteBeneficioAberto(sAnoMesLoteConcessao,
                                                      iFlgIncluiMesConc);
     if iIdLoteConcessao <= 0
     then begin
        MsgDlg('Nenhum lote selecinado para efetuar o Controle de Dívidas. Verifique. ','Erro',mtError,[mbOk],0);
        Exit;
     end;

     //edilaine SIG128237 : inicio
     sDataFolha := CriticaDataCobrancaSit( query_temp,
                                           IntToStr(iIdFundacao),'', 'AS', 'P',
                                           Copy(sAnoMesLoteConcessao,6,2),
                                           Copy(sAnoMesLoteConcessao,1,4) );
     //edilaine SIG128237 : fim

  end;

  passou:=false;

  try
    qrydet.Filter:='Selecionar ='+#39+'S'+#39;
    qrydet.Filtered:=True;
    qrydet.Active:=True;

    if qrydet.IsEmpty then
    begin
      MsgDlg( 'É necessário selecionar pelo menos uma parcela para processamento.','Informação',mtInformation,[mbOk],0);
      qrydet.Filtered:=FALSE;
      Exit;
    end;

    qrydet.First;
    while not qrydet.eof do
     begin

       if qrydet.FieldByName('FLGSITUACAO2').Text <> '0' then
         begin
           MsgDlg( 'Envio de parcela do mês para aposentado ou pensionista selecionado já efetuado.','Informação',mtInformation,[mbOk],0);
           qrydet.next;
           Continue;
         end;

       try

         //edilaine SIG33744 : inicio
         //recParam := BuscaParametros(qryDet, query_temp); //leandro SIG136150
         recParam := BuscaParametrosNovo(qryDet, query_temp);   //leandro SIG136150
         if not recParam.OK then
         begin
           MsgDlg( 'Erro ao buscar parametros para Envio de parcela.','Informação',mtInformation,[mbOk],0);
           qrydet.next;
           Continue;
         end;
         //edilaine SIG33744 : fim


         //if (qrydet.FieldByName('CODPORTFORMA').Text = '')or (qrydet.FieldByName('CODPORTFORMA').Text = '0') then    // edilaine - 22/01/2014 - SOL 174933  // edilaine - SIG33744
         if (recParam.sCODPORTFORMA = '') or (recParam.sCODPORTFORMA = '0') or (recParam.sCODPORTFORMA = '-1') then    // edilaine - SIG33744
           begin
             //if InsereTmpDesc(qryDet, recParam, iIdLoteConcessao) < 0 then    //edilaine SIG126276
             if LancaTmpDesc(qryDet, recParam, iIdLoteConcessao) < 0 then       //edilaine SIG126276
               begin
                 MsgDlg('É necessário efetuar a parametrização das Rubricas','Informação',mtInformation,[mbOk],0);
                 qrydet.next;
                 Continue;
               end
             else
               GravaLogTOTALPREV ('TMPDESC -Insert- (REFERENCIA)IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
           end

         else  //if qrydet.FieldByName('CODPORTFORMA').Text<>'' then
           begin

             ctrlDocumento.Prepare(OpDocumento,odlEfetivo);
             ctrlDocumento.IdEspAcesso:=Sistema.IdEspAcesso;
             ctrlDocumento.IdUsuario:=Sistema.IdUsuario;

             lCodLancCAPCAR:=Ctrldocumento.GetSequenceDocumento;

             //Início - William Santana - SIG33744
             if (qrydet.FieldByName('VALORPREVISTO').Value > 0) then
                recpag := 'R'
             else
                recpag := 'P';
             //Término - William Santana - SIG33744

             if not LancaDoc(qryDet, ctrlDocumento,
                      lCodLancCAPCAR,
                     //qrydet.FieldByName('IDTITULAR').Value         // edilaine - 22/01/2014 - SOL 174933
                     -1, //NÃO VINCULAR PLANILHA ORIGINAL AO NOVO DOCUMENTO A PAGAR
                     qrydet.FieldByName('IDPESSOA').Value,
                     StrtoInt(recParam.sCODPORTFORMA),
                     StrtoInt(recParam.sUNIDNEGOC),
                     StrToInt(recParam.sCODTIPDOC),
                     DateToStr(StrToDate(DateToStr(Now))),
                     qrydet.FieldByName('DATAPREVISTA').AsString, // DateToStr(StrToDate(DateToStr(Now))),///vencimento ver
                     IntToStr(lCodLancCAPCAR),
                     {dblkFolha.Text}'', ////ver
                     recParam.sCODTIPRECDES,
                     recParam.sCODCENTRORESPON,
                     iif(recParam.sCODCENTROCUSTOC = '-1', '', recParam.sCODCENTROCUSTOC),        //edilaine - SIG33744
                     recParam.sContaLiquido,
                     {'R',}  recpag,      //William Santana - SIG33744
                     //BRUNO AZEVEDO INÍCIO SIG33744
                     Abs(qrydet.FieldByName('VALORPREVISTO').Value),
                     //qrydet.FieldByName('VALORPARCELA').Value,
                     //BRUNO AZEVEDO FIM SIG33744
                     strtoint(recParam.sCODFORMA)
                     ) then
             begin
                MsgDlg('Erro ao efetuar envio para Contas a Receber','Informação',mtInformation,[mbOk],0);
                qrydet.next;
                Continue;
             end;

             qryDet.edit;
             qryDet.FieldByName('CODDOCUMENTO').AsInteger := lCodLancCAPCAR;
             qryDet.post;

             if GeraBoleto(qryDet, query_temp, lstSqlAtuDoc, sMensagem) then
             begin
               //atualiza dados da impressao
               if lstSqlAtuDoc.Count > 0 then
               begin
                 //If not dtmBaseDados.dbBaseDados.InTransaction Then
                 //  dtmBaseDados.dbBaseDados.StartTransaction;

                 try
                   query_temp.close;
                   query_temp.Sql.Text := 'BEGIN '+lstSqlAtuDoc.text+ ' END;';
                   query_temp.ExecSql;

                   //dtmBaseDados.dbBaseDados.Commit;
                   MsgDlg(sMensagem.text,'Informação',mtInformation,[mbOK],0);
                 except
                   //dtmBaseDados.dbBaseDados.RollBack;
                 end;
               end;
             end
             else
             begin
               MsgDlg(sMensagem.text, 'Informação',mtInformation,[mbOK],0);
               qrydet.next;
               Continue;
             end;

           end;

         UpdateHSTDIVIDABENEFICIO('1');///flgsituacao = 1
         passou := true;

       except
         qrydet.Filtered:=False;
         Exit;
       end;

       qrydet.Next;
     end;

  finally
    FreeAndNil(query_temp);
    FreeAndNil(lstSqlAtuDoc);
    FreeAndNil(sMensagem);
  end;

   qrydet.Filtered:=False;

   if passou then
      MsgDlg('Envio de cobranças efetuado com sucesso.','Informação',mtInformation,[mbOk],0)

end;


procedure TFrmHstDividaBenef3.ExecutarRecebimento;
var
   achou:Boolean;

{// edilaine - 22/01/2014 - SOL 174933
function VerificarRecebimentoTMPDESC:Boolean;
var
 query:TwwQuery;
   begin

   query:=TwwQuery.Create(Self);
   query.DataBaseName :='BaseDados';
   query.Active:=false;
   query.SQL.Clear;
   query.SQL.Add('Select DATARECEBIMENTO FROM TMPDESC WHERE REFERENCIA = '+#39+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text+#39);
   query.SQL.Add(' and idpessoa= '+#39+qrydet.FieldByName('IDPESSOA').text+#39);
   query.SQL.Add(' and idtitular= '+#39+qrydet.FieldByName('IDTITULAR').text+#39);
   query.SQL.Add(' and mescobranca= '+#39+qrydet.FieldByName('MESCOBRANCA').text+#39);
   query.Open;
   if query.FieldByName('DATARECEBIMENTO').Text<>'' then
      result:=True
   else
      result:=False;

   query.Close;
   query.Destroy;

   end;
} // edilaine - 22/01/2014 - SOL 174933

function VerificaRecebimento(_CODDOCUMENTO:string):Boolean;
   var
   query:TwwQuery;
   begin
   query:=TwwQuery.Create(Self);
   query.DataBaseName :='BaseDados';
   query.Active:=false;
   query.SQL.Clear;

   query.SQL.Add('SELECT 1 ');
   query.SQL.Add('  FROM LANCTODOCUM');
   query.SQL.Add(' WHERE CODDOCUMENTO ='+Trim(_CODDOCUMENTO) );   //edilaine SIG33744
   query.SQL.Add('   AND OPERACAO = 5');////5 é recebido
   query.Active:=True;
   if query.IsEmpty then
      result:=False
   else
      result:=True;


   query.Active:=false;
   query.Destroy;
   end;
begin


achou:=false;
qrydet.Filter:='Selecionar ='+#39+'S'+#39;
qrydet.Filtered:=True;
qrydet.Active:=True;

if qrydet.IsEmpty then
   begin
   MsgDlg( 'É necessário selecionar pelo menos um aposentado ou pensionista para processamento.','Informação',mtInformation,[mbOk],0);
   qrydet.Filtered:=FALSE;
   Exit;
   end;

qrydet.First;
while not qrydet.eof do
   begin

     if (qrydet.FieldByName('FLGSITUACAO2').Text <> '1') and (qrydet.FieldByName('FLGSITUACAO2').Text <> '2') then
        begin
        MsgDlg( 'Recebimento de parcela do mês para aposentado ou pensionista selecionado já efetuado.','Informação',mtInformation,[mbOk],0);
        qrydet.next;
        Continue;
        end;


     if qrydet.FieldByName('CODPORTFORMA').Text<>'' then
        begin

         //// se foi contas a receber
         if VerificaRecebimento(qrydet.FieldByName('CODDOCUMENTO').Text) = False then
            begin
            MsgDlg( 'Não é possível realizar o recebimento.','Informação',mtInformation,[mbOk],0);
            qrydet.next;
            Continue;
            end;
       end
     else
         begin

         if VerificarRecebimentoTMPDESC=False then
            begin
            MsgDlg( 'Não é possível realizar o recebimento.','Informação',mtInformation,[mbOk],0);
            qrydet.next;
            Continue;
            end;

         end;

   try
   UpdateHSTDIVIDABENEFICIO('3');///flgsituacao = 3-recebida
   achou:=true;
   except

   qrydet.Filtered:=False;
   Exit;
   end;







   qrydet.Next;
   end;


  qrydet.Filtered:=False;

  if achou then
     MsgDlg('Recebimento efetuado com sucesso.','Informação',mtInformation,[mbOk],0)
end;


procedure TFrmHstDividaBenef3.gerar_impressao;
begin
  //qryDet.Filter:='Selecionar ='+#39+'S'+#39;
  //qryDet.Filtered:=True;
  //qryDet.Active:=True;

  //edilaine SIG126276 : inicio
  if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
    TFrmPreview.CreateModalPreview(Application, ppReport1,'HISTÓRICO DE DÍVIDAS DE BENEFÍCIOS');
    ExecSaveRel(ppReport1);
  end
  else
  begin
    TFrmPreview.CreateModalPreview(Application, ppMovDivida,'MOVIMENTAÇÃO DE DÍVIDAS DE BENEFÍCIOS');
    ExecSaveRel(ppMovDivida);
  end;
  //edilaine SIG126276 : fim

  qryRelatorio.Active:=False;
end;


//procedure TFrmHstDividaBenef3.InserirHSTDIVIDABENEFICIO(_IDCONTROLE,    //edilaine SIG115304
function TFrmHstDividaBenef3.InserirHSTDIVIDABENEFICIO(_IDCONTROLE,
  _IDPESSOA, _IDTITULAR, _IDPESSJUR, _IDBENEFICIO, _IDPLANOPREV,
  _MESREFERENCIA, _MESCOBRANCA, _VLQUITACAO, _dataprevista, _FLGDESCFOLHA,
  _FLGSITUACAO, _flgParcial, _CODPORTFORMA, _OBSERVACAO: string   //BRUNO AZEVEDO SIG33744
  ) : integer;   //edilaine SIG115304
var
     idhstcontrole,qtparcela:Integer;
     _query,_queryx:TwwQuery;
     _TIPOPAGTO : string;                  //edilaine - SIG33744
     _FLGDEVOLUCAO : string;               //edilaine - SIG33744
begin

  result := -1;   //edilaine SIG115304

  IF _CODPORTFORMA='' then
    begin
      _FLGDESCFOLHA:='B';
      _CODPORTFORMA:='null';
      _TIPOPAGTO := 'F';                   //edilaine - SIG33744
    end
  else
    begin
      _FLGDESCFOLHA:='';
      _TIPOPAGTO := 'B';                  //edilaine - SIG33744
    end;

  _FLGDEVOLUCAO := iif(Str2Float(_VLQUITACAO) < 0,  '1', '0');                //edilaine - SIG33744
  _VLQUITACAO   := OraNumero(FloatToStr(Abs(Str2Float(_VLQUITACAO))));        //edilaine - SIG33744


  _queryx:=TwwQuery.Create(Self);
  _queryx.DataBaseName :='BaseDados';
  _queryx.Active:=false;
  _queryx.sql.clear;
  //_queryx.SQL.Add('SELECT (COUNT(*)+1)NEXTQT FROM HSTDIVIDABENEFICIO');              //edilaine - SIG33744
  _queryx.SQL.Add('SELECT (MAX(NUMEROPARCELA)+1)NEXTQT FROM HSTDIVIDABENEFICIO');      //edilaine - SIG33744
  _queryx.SQL.Add('WHERE IDCONTROLEDIVIDABENEFICIO ='+_IDCONTROLE);
  _queryx.Active:=True;
  qtparcela:= _queryx.fieldbyname('NEXTQT').Value;

  _MESREFERENCIA:=_MESCOBRANCA;
  _query:=TwwQuery.Create(Self);
  _query.DataBaseName :='BaseDados';
  _query.Active:=false;

  idhstcontrole:= (LeUltRegistro(Nil,'HSTDIVIDABENEFICIO'));

  _query.close;
  _query.sql.Clear;
  _query.SQL.Add('insert into HSTDIVIDABENEFICIO');
  _query.SQL.Add('  (IDHSTORICODIVIDABENEFICIO,');
  _query.SQL.Add('   IDHISTORICODIVIDABENEFICIOREF,');
  _query.SQL.Add('   IDCONTROLEDIVIDABENEFICIO,');
  _query.SQL.Add('   IDPESSOA,');
  _query.SQL.Add('   IDTITULAR,');
  _query.SQL.Add('   IDPESSJUR,');
  _query.SQL.Add('   IDBENEFICIO,');
  _query.SQL.Add('   IDPLANOPREV,');
  _query.SQL.Add('   MESREFERENCIA,');
  _query.SQL.Add('   MESCOBRANCA,');
  _query.SQL.Add('   NUMEROPARCELA,');
  _query.SQL.Add('   VALORPREVISTO,');
  _query.SQL.Add('   VALORRECEBIDO,');
  _query.SQL.Add('   DATAPREVISTA,');
  _query.SQL.Add('   DATAEFETIVA,');
  _query.SQL.Add('   IDHSTFOLHABENEF,');
  _query.SQL.Add('   CODPORTFORMA,');
  _query.SQL.Add('   FLGDESCFOLHA,');
  _query.SQL.Add('   FLGSITUACAO,');
  _query.SQL.Add('   TIPOPAGAMENTO,');           //edilaine -  SIG33744
  _query.SQL.Add('   FLGDEVOLUCAO,');            //edilaine -  SIG33744
  _query.SQL.Add('   SALDODEVEDORANT,');         //edilaine - SIG115304
  _query.SQL.Add('   OBSERVACAO,IDCONTROLEDIVIDABENEFUNIF)');
  _query.SQL.Add('values');
  _query.SQL.Add('  ('+FLOATTOSTR(idhstcontrole)+',');
  _query.SQL.Add(' '+'0'+',');
  _query.SQL.Add(' '+_IDCONTROLE+',');
  _query.SQL.Add(' '+_IDPESSOA+',');
  _query.SQL.Add(' '+_IDTITULAR+',');
  _query.SQL.Add(' '+_IDPESSJUR+',');
  _query.SQL.Add(' '+_IDBENEFICIO+',');
  _query.SQL.Add(' '+_IDPLANOPREV+',');
  _query.SQL.Add(' '+#39+_MESREFERENCIA+#39+',');
  _query.SQL.Add(' '+#39+_MESCOBRANCA+#39+',');
  _query.SQL.Add(' '+inttostr(qtparcela)+',');
  _query.SQL.Add(' '+OraNumero(_VLQUITACAO)+',');
  if _flgParcial = '1' then
   _query.SQL.Add(' '+OraNumero(_VLQUITACAO)+',')
  else
  _query.SQL.Add(' '+'null'+',');

  //_query.SQL.Add(' '+#39+DateToStr(StrToDate(DateToStr(Now)))+#39+',');    //edilaine SIG115304
  _query.SQL.Add(' '+#39+_dataprevista+#39+',');                             //edilaine SIG115304

  _query.SQL.Add(' '+'null'+',');
  _query.SQL.Add(' '+'null'+',');
  _query.SQL.Add(' '+_CODPORTFORMA+',');
  _query.SQL.Add(' '+#39+_FLGDESCFOLHA+#39+',');
  _query.SQL.Add(' '+#39+_FLGSITUACAO+#39+',');
  _query.SQL.Add(' '+#39+_TIPOPAGTO+#39+',');     //edilaine - SIG33744
  _query.SQL.Add(' '+#39+_FLGDEVOLUCAO+#39+',');  //edilaine - SIG33744

  _query.SQL.Add(' trunc( '+OraNumero(query_cab.FieldByName('SALDODEVEDORATUAL').AsString)+' ,2),');    //edilaine - SIG115304

  _query.SQL.Add(' '+#39+_OBSERVACAO+#39+',');    //BRUNO AZEVEDO SIG33744
  _query.SQL.Add('null )');
  _query.ExecSQL;

  try
   GravaLogTOTALPREV ('HSTDIVIDABENEFICIO -UPDATE- IDHSTORICODIVIDABENEFICIO'+FLOATTOSTR(idhstcontrole));
   result := idhstcontrole;   //edilaine SIG115304
  except
  end;

  _query.close;
  _query.Destroy;

end;


function TFrmHstDividaBenef3.RetornaSaldoAtualizado(
  _datainicio: string; _saldodevedoratual: Double): Double;
var
query:TwwQuery;
_datainicio2,_datainicio3:string;

begin
query:=TwwQuery.Create(Self);
query.DataBaseName :='BaseDados';
query.Active:=false;
query.SQL.Clear;

_datainicio3:=inttostr(strtoint(Copy(_datainicio,7,4))-1) +'/'+Copy(_datainicio,4,2);//data - 1 ano

if Copy(_datainicio,4,2) = '01' then
   begin
   _datainicio3:=inttostr(strtoint(Copy(_datainicio,7,4))-1) +'/'+'12';//data - 1 ano
   end
else
   begin
  _datainicio2:=Copy(_datainicio,7,4)+'/'+ formatfloat('00',strtoint(Copy(_datainicio,4,2))-1);//data - 1 ano
   end;

query.SQL.Add('SELECT ((EXP(SUM(LN(COTVALOR))) + 1) * '+OraNumero(floattostr(_saldodevedoratual))+' ');
query.SQL.Add('       ) NOVOSALDO');
query.SQL.Add('  FROM COTACAOMOEDA');
query.SQL.Add(' WHERE MOECODIGO IN');
query.SQL.Add('       (SELECT MOECODIGO FROM CM.MOEDA WHERE MOESIGLA = ''INPC'')');
query.SQL.Add('      ');
query.SQL.Add('   AND (SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 7, 4) || ''/'' ||');
query.SQL.Add('       SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 4, 2)) <=');
query.SQL.Add('       (SELECT '+#39+_datainicio2+#39+' ');
query.SQL.Add('          FROM DUAL)');
query.SQL.Add('      ');
query.SQL.Add('   AND (SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 7, 4) || ''/'' ||');
query.SQL.Add('       SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 4, 2)) >=');
query.SQL.Add('       (SELECT '+#39+_datainicio3+#39'');
query.SQL.Add('          FROM DUAL)');
query.SQL.Add('      ');
query.SQL.Add('   AND (SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 7, 4) || ''/'' ||');
query.SQL.Add('       SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 4, 2)) <=');
query.SQL.Add('       (SELECT MAX(MESREAJ) FROM REAJINSS)');
query.SQL.Add('      ');
query.SQL.Add('   AND (SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 7, 4) || ''/'' ||');
query.SQL.Add('       SUBSTR((TO_CHAR((COTDATA), ''DD/MM/YYYY'')), 4, 2)) <=');
query.SQL.Add('       (SELECT MAX(MESREAJ) FROM REAJBENEFICIO)');

query.Active:=True;

result:=query.fieldbyname('NOVOSALDO').Value;
query.close;
query.Destroy;

end;

function TFrmHstDividaBenef3.RetornaSaldoAtualizadoRegReplan(
  _saldodevedoratual: Double): Double;
var
query:TwwQuery;


begin
query:=TwwQuery.Create(Self);
query.DataBaseName :='BaseDados';
query.Active:=false;
query.SQL.Clear;

query.SQL.Add('SELECT (((COTVALOR)* + 1) * '+OraNumero(floattostr(_saldodevedoratual))+' ');
query.SQL.Add('       ) NOVOSALDO');
query.SQL.Add('  FROM COTACAOMOEDA');
query.SQL.Add(' WHERE MOECODIGO IN');
query.SQL.Add('       (SELECT MOECODIGO FROM CM.MOEDA WHERE MOESIGLA = ''REAJCAIXA'')');
query.SQL.Add('   AND COTDATA =');
query.SQL.Add('       (SELECT MAX(COTDATA) FROM COTACAOMOEDA WHERE MOECODIGO = 336)');

query.Active:=True;

result:=query.fieldbyname('NOVOSALDO').Value;
query.close;
query.Destroy;


end;

procedure TFrmHstDividaBenef3.UpdateHSTDIVIDABENEFICIO(
  _flgsituacao: string);
    var
     query,query2,queryx:TwwQuery;
     sIDHSTFOLHABENEF,sDATARECEBIMENTO,sCODPROVDESC:string;
     dVALORRECEBIDO:Double;
     bParcelaNegativa: Boolean;     //BRUNO AZEVEDO SIG33744
     sTipoMov : string;             //edilaine SIG126276

    function VerificaValorRecebimento(_CODDOCUMENTO:string):Double;
       var
       query:TwwQuery;
       begin
       query:=TwwQuery.Create(Self);
       query.DataBaseName :='BaseDados';
       query.Active:=false;
       query.SQL.Clear;

       query.SQL.Add('SELECT VALOR ');
       query.SQL.Add('  FROM LANCTODOCUM');
       query.SQL.Add(' WHERE CODDOCUMENTO ='+Trim(_CODDOCUMENTO) );   //edilaine SIG33744
       query.SQL.Add('   AND OPERACAO = 5');////5 é recebido
       query.Active:=True;

       result:=query.fieldbyname('VALOR').AsFloat;


       query.Active:=false;
       query.Destroy;
       end;


    begin

    dVALORRECEBIDO:=0;
    query:=TwwQuery.Create(Self);
    query.DataBaseName :='BaseDados';
    query.Active:=false;
    query.SQL.Clear;

    queryX:=TwwQuery.Create(Self);
    queryX.DataBaseName :='BaseDados';
    queryX.Active:=false;
    queryX.SQL.Clear;

    sTipoMov := '';             //edilaine SIG126276

    if _flgsituacao = '3' then
        begin
        queryx.SQL.Add(' SELECT DATARECEBIMENTO, NVL(VALORRECEBIDO,0)VALORRECEBIDO, CODPROVDESC');
        queryx.SQL.Add('   FROM TMPDESC');
        queryx.SQL.Add('  WHERE REFERENCIA ='+#39+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text+#39);
        queryx.SQL.Add('    AND IDPESSOA ='+qrydet.FieldByName('IDPESSOA').text);
        queryx.SQL.Add('    AND IDTITULAR ='+qrydet.FieldByName('IDTITULAR').text);
        queryx.SQL.Add('    AND MESCOBRANCA ='+#39+qrydet.FieldByName('MESCOBRANCA').text+#39);
        queryX.Active:=True;
        sDATARECEBIMENTO:= queryX.fieldbyname('DATARECEBIMENTO').text;
        dVALORRECEBIDO:= queryX.fieldbyname('VALORRECEBIDO').value;
        sCODPROVDESC:=queryX.fieldbyname('CODPROVDESC').text;
        end;
    queryX.Active:=false;
    queryX.SQL.Clear;
    queryX.SQL.Add(' SELECT IDHSTFOLHABENEF FROM HISTRUBSAL');
    queryx.SQL.Add(' WHERE IDPESSOA= '+qrydet.FieldByName('IDPESSOA').text);
    queryx.SQL.Add(' AND MESCOBRANCA = '+#39+qrydet.FieldByName('MESCOBRANCA').text+#39);
//    queryx.SQL.Add(' AND CODDOCUMENTO =  '+qrydet.FieldByName('CODDOCUMENTO').text);
    queryx.SQL.Add(' AND CODPROVDESC = '+#39+sCODPROVDESC+#39); // SOL 232999/16147 PPM 409169
    queryX.Active:=True;
    sIDHSTFOLHABENEF:=queryX.fieldbyname('IDHSTFOLHABENEF').text;

    query.SQL.Add('UPDATE HSTDIVIDABENEFICIO');


    if _flgsituacao = '3' then
        begin
    //    if VerificaValorRecebimento(qrydet.FieldByName('CODDOCUMENTO').Value) = qrydet.FieldByName('Vlr Parcela').Value then
//           query.SQL.Add('   SET FLGSITUACAO ='+_flgsituacao)
//        else
             if qrydet.FieldByName('CODPORTFORMA').Text<>'' then
                query.SQL.Add('   SET FLGSITUACAO ='+'4')
             else
                query.SQL.Add('   SET FLGSITUACAO ='+_flgsituacao);

        if qrydet.FieldByName('CODPORTFORMA').Text<>'' then
           begin
           query.SQL.Add('   , TIPOPAGAMENTO = ''B'' ');       //edilaine - SIG33744
           query.SQL.Add('   , VALORRECEBIDO ='+OraNumero(FloatToStr(VerificaValorRecebimento(qrydet.FieldByName('CODDOCUMENTO').Value))));
           query.SQL.Add('   , DATAEFETIVA  ='+#39+FormatDateTime('DD/MM/YYYY',date)+#39);
           end
        else
           begin
           query.SQL.Add('   , TIPOPAGAMENTO = ''F'' ');       //edilaine - SIG33744
           query.SQL.Add('   , VALORRECEBIDO ='+OraNumero(FloatToStr(dVALORRECEBIDO)));
           query.SQL.Add('   , DATAEFETIVA  ='+#39+sDATARECEBIMENTO+#39);
           query.SQL.Add('   , IDHSTFOLHABENEF  ='+#39+sIDHSTFOLHABENEF+#39);
           end;
//        query.SQL.Add('   , VALORRECEBIDO ='+OraNumero(FloatToStr(qrydet.FieldByName('Vlr Parcela').Value)));
        end
    else
        begin
        query.SQL.Add('   SET FLGSITUACAO ='+_flgsituacao);

         //edilaine SIG128237 : inicio
        if (_flgsituacao = '1') and (sDataFolha <> '') then
            query.SQL.Add('   , DATAPREVISTA  ='+QuotedStr(sDataFolha) );
         //edilaine SIG128237 : fim

        //if qrydet.FieldByName('CODPORTFORMA').Text<>'' then     //William Santana - SIG33744
         if not((qrydet.FieldByName('CODPORTFORMA').text = '')or(qrydet.FieldByName('CODPORTFORMA').text = '0')) then    //William Santana - SIG33744
           query.SQL.Add('   , CODDOCUMENTO  ='+#39+inttostr(lCodLancCAPCAR)+#39);
        end;

    query.SQL.Add(' WHERE IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
    query.ExecSQL;
    GravaLogTOTALPREV ('HSTDIVIDABENEFICIO -UPDATE- IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);



    if _flgsituacao = '3' then
       begin

        //BRUNO AZEVEDO INÍCIO SIG33744
        bParcelaNegativa := False;

        query.close;
        query.SQL.Clear;
        query.SQL.Add(' SELECT VALORPREVISTO FROM HSTDIVIDABENEFICIO');
        query.SQL.Add('  WHERE IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
        query.Open;

        if (query.Recordcount > 0) then begin
           if (query.FieldByName('VALORPREVISTO').Value < 0) then begin
             bParcelaNegativa := True;
           end;
        end;
        //BRUNO AZEVEDO FIM SIG33744

        query2:=TwwQuery.Create(Self);
        query2.DataBaseName :='BaseDados';
        query2.Active:=false;
        query2.SQL.Clear;

        query2.SQL.Add('SELECT SALDODEVEDORATUAL,QUANTIDADEPARCELASPAGAS');
        query2.SQL.Add('  FROM CONTROLEDIVIDABENEFICIO');
        query2.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO ='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
        query2.open;

        query.SQL.Clear;
        query.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO');
        if qrydet.FieldByName('CODPORTFORMA').Text<>'' then
          begin

            //BRUNO AZEVEDO INÍCIO SIG33744
            if not (bParcelaNegativa) then begin
              if query2.FieldByName('SALDODEVEDORATUAL').Value-VerificaValorRecebimento(qrydet.FieldByName('CODDOCUMENTO').Value)>0 then
                 query.SQL.Add('   SET FLGQUITADO =0')
              //BRUNO AZEVEDO INÍCIO SIG33744
              else begin
                 query.SQL.Add('   SET FLGQUITADO = 1');
                 query.SQL.Add('     , FLGSTATUS  = 3');

                 {movimento quitacao}
                 sTipoMov := '6';         //edilaine SIG126276
              end;
              //BRUNO AZEVEDO FIM SIG33744
              query.SQL.Add('   , SALDODEVEDORATUAL  ='+OraNumero(FloatToStr(query2.FieldByName('SALDODEVEDORATUAL').Value-VerificaValorRecebimento(qrydet.FieldByName('CODDOCUMENTO').Value))));

            end else begin
              query.SQL.Add('   SET FLGQUITADO =0');
              query.SQL.Add('   , SALDODEVEDORATUAL  ='+OraNumero(FloatToStr(query2.FieldByName('SALDODEVEDORATUAL').Value+VerificaValorRecebimento(qrydet.FieldByName('CODDOCUMENTO').Value))));
            end;
            //BRUNO AZEVEDO FIM SIG33744

          end
       else
          begin

           //BRUNO AZEVEDO INÍCIO SIG33744
           if not (bParcelaNegativa) then begin
              if (query2.FieldByName('SALDODEVEDORATUAL').Value-dVALORRECEBIDO)>0 then
                 query.SQL.Add('   SET FLGQUITADO =0')
              //BRUNO AZEVEDO INÍCIO SIG33744
              else begin
                 query.SQL.Add('   SET FLGQUITADO = 1');
                 query.SQL.Add('     , FLGSTATUS  = 3');

                 {movimento quitacao}
                 sTipoMov := '6';         //edilaine SIG126276
              end;
              //BRUNO AZEVEDO FIM SIG33744
              query.SQL.Add('   , VALORULTIMAPARCELA ='+OraNumero(FloatToStr(dVALORRECEBIDO)));
              query.SQL.Add('   , SALDODEVEDORATUAL  ='+OraNumero(FloatToStr(query2.FieldByName('SALDODEVEDORATUAL').Value-dVALORRECEBIDO)));

           end else begin
             query.SQL.Add('   SET FLGQUITADO =0');
             query.SQL.Add('   , VALORULTIMAPARCELA ='+OraNumero(FloatToStr(dVALORRECEBIDO)));
             query.SQL.Add('   , SALDODEVEDORATUAL  ='+OraNumero(FloatToStr(query2.FieldByName('SALDODEVEDORATUAL').Value+dVALORRECEBIDO)));
           end;
           //BRUNO AZEVEDO FIM SIG33744

          end;

        query.SQL.Add('   , QUANTIDADEPARCELASPAGAS ='+OraNumero(FloatToStr(query2.FieldByName('QUANTIDADEPARCELASPAGAS').Value+1)));
        query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO  = '+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
        query.ExecSQL;

        //edilaine SIG126276 - inicio
        {insere movimento de encerramento}
        if sTipoMov <> '' then
           CriaLogDivida(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, sTipoMov, query2.FieldByName('SALDODEVEDORATUAL').AsString );
        //edilaine SIG126276 - fim

        GravaLogTOTALPREV ('CONTROLEDIVIDABENEFICIO -UPDATE- IDCONTROLEDIVIDABENEFICIO = '+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
        query2.close;
        query2.Destroy;
       end;




    query.close;
    query.Destroy;



end;

procedure TFrmHstDividaBenef3.sbtnAlterarClick(Sender: TObject);
begin
  qryDet.edit;
  qryDet.post;
  btnProcurar.enabled := True;
inherited;

  //BRUNO AZEVEDO INÍCIO SIG33744
  query_cab.Edit;
  //BRUNO AZEVEDO FIM SIG33744
end;

procedure TFrmHstDividaBenef3.sbtnProcurarClick(Sender: TObject);
begin
//  inherited;

  MontaSelect.Executar;
  if MontaSelect.RetornouValor then
     CarregaDadosDivida();               //edilaine SIG115304

end;

//edilaine SIG115304 : inicio
procedure TFrmHstDividaBenef3.CarregaDadosDivida;
begin

    iddivida:=(MontaSelect.ValoresChave[8]);

    query_cab.CLOSE;
    query_cab.SQL.CLEAR;
    query_cab.SQL.Add('SELECT ');
    query_cab.SQL.Add('DISTINCT ');
    query_cab.SQL.Add('   (SELECT MATRICULA FROM DEPENTIT WHERE DEPENTIT.IDPESSOA = CONTROLEDIVIDABENEFICIO.IDPESSOA AND DEPENTIT.IDTITULAR = CONTROLEDIVIDABENEFICIO.IDTITULAR) AS MATRICULA ,');
    query_cab.SQL.Add('   (SELECT NOME FROM PESSOA  WHERE IDPESSOA = CONTROLEDIVIDABENEFICIO.IDPESSOA AND IDTITULAR = CONTROLEDIVIDABENEFICIO.IDTITULAR) AS NOME ,');
    query_cab.SQL.Add('   (SELECT NOME FROM PLANPREV WHERE IDPLANOPREV = CONTROLEDIVIDABENEFICIO.IDPLANOPREV) AS NOMEPLANPREV  ,');
    query_cab.SQL.Add('   DECODE(CONTROLEDIVIDABENEFICIO.FONTEPAGADORA,1,''FUNCEF'',2,''INSS'') AS FONTEPAGADORA,');
    query_cab.SQL.Add('   (SELECT NOME FROM BENEFICIO WHERE BENEFICIO.IDBENEFICIO = CONTROLEDIVIDABENEFICIO.IDBENEFICIO) AS NOMEBENEFICIO ,');
    //BRUNO AZEVEDO INÍCIO SIG33744
    query_cab.SQL.Add('   flgstatus,');
    //query_cab.SQL.Add('   decode(flgstatus, 1, ''Ativa'', 2, ''Suspensa'', 3, ''Encerrada'', '''') as StatusDivida,');   //edilaine SIG115304
    query_cab.SQL.Add('   observacao as motivo,');
    //BRUNO AZEVEDO FIM SIG33744
    query_cab.SQL.Add('   IDCONTROLEDIVIDABENEFICIO ,');
    query_cab.SQL.Add('   IDTITULAR,');
    query_cab.SQL.Add('   IDPESSOA,');
    query_cab.SQL.Add('   IDPLANOPREV,');
    query_cab.SQL.Add('   IDBENEFICIO,');
    query_cab.SQL.Add('   SALDODEVEDORATUAL,');
    query_cab.SQL.Add('   MESINICIO,');
    query_cab.SQL.Add('   MESFIM,');
    query_cab.SQL.Add('   VALORULTIMAPARCELA,');
    query_cab.SQL.Add('   IDCONTROLEDIVIDABENEFICIO,');
    query_cab.SQL.Add('   VALORPARCELA,');
    query_cab.SQL.Add('   SALDODEVEDORINICIAL,');
    query_cab.SQL.Add('   PERCENTUAL,');
    query_cab.SQL.Add('   QTDEPARCELAS,');
    query_cab.SQL.Add('   VALORBENEFICIO,');
    query_cab.SQL.Add(' (SELECT MAX(DATAEFETIVA)Ult FROM  HSTDIVIDABENEFICIO');
    query_cab.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO = '+iddivida);
    query_cab.SQL.Add(' AND FLGSITUACAO = 3)Ult,FLGATUALIZARSALDO,FLGPORTFORMA,');
    query_cab.SQL.Add(' decode(nvl(FLGQUITADO,0),0,''NÃO QUITADO'',''QUITADO'') FLGQUITADOstr, FLGQUITADO, ');    //edilaine - SIG33744
    query_cab.SQL.Add(' nvl(QUANTIDADEPARCELASPAGAS,0)QUANTIDADEPARCELASPAGAS');
    query_cab.SQL.Add(' , NUMPROCINSS ');                                          //edilaine SIG56256
    //edilaine SIG115304 : inicio
    query_cab.SQL.Add('    ,decode(flgstatus, 1, ''Ativa'', 2, DECODE(FLGACAOJUD, 1, ''Susp. Jud'', ''Susp. Adm''), 3, ''Encerrada'', '''') as StatusDivida');
    query_cab.SQL.Add('    ,FLGACAOJUD          ');
    query_cab.SQL.Add('    ,SALDOPROVPERDA      ');
    query_cab.SQL.Add('    ,SALDOBAIXADEF       ');
    //edilaine SIG115304 : fim

    query_cab.SQL.Add('    ,FLGDESCFOLHA        ');     //edilaine SIG126276    

    query_cab.SQL.Add('FROM');
    query_cab.SQL.Add('   CONTROLEDIVIDABENEFICIO');
    //edilaine SIG115304 - inicio
  //  query_cab.SQL.Add('   LEFT JOIN (SELECT CG.* FROM CTRLDIVIDABENEFCARGA CG');
  //  query_cab.SQL.Add('               WHERE CG.MESANO = (SELECT TO_CHAR(MAX(DATAEFETIVA), ''YYYY/MM'' FROM  HSTDIVIDABENEFICIO' );
  //  query_cab.SQL.Add('                                   WHERE IDCONTROLEDIVIDABENEFICIO = '+iddivida +')' );
  //  query_cab.SQL.Add('     ON CG.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO');

    //edilaine SIG115304 - fim
    query_cab.SQL.Add('WHERE IDCONTROLEDIVIDABENEFICIO = '+iddivida);
    query_cab.Open;

    if iddivida<>'' then
       Consulta(iddivida);

    //BRUNO AZEVEDO INÍCIO SIG33744
    if (query_cab.recordcount > 0) then begin
      cbbStatusDivida.ItemIndex := query_cab.FieldByName('FLGSTATUS').AsInteger -1;
    end;
    //BRUNO AZEVEDO FIM SIG33744

    dbgrdDet.ReadOnly:=false;
    qryLkRefe.close;
    qryLkRefe.ParamByName('IDCONTROLEDIVIDABENEFICIO').value   := strtofloat(iddivida);

    try
      if qryLkRefe.Active then qryLkRefe.Close;
        qryLkRefe.open;
    except
      MsgDlg('Erro ao abrir lookup2 ','Error',mtError,[mbok],0);
      Abort;
    end;

  if qryDet.IsEmpty then
    begin
  //   btnProcessar.Enabled:=false;
  //   bbtnDesfazer.Enabled:=false;
       btnSelTudo.Enabled:=false;
       btnInverte.Enabled:=false;
       btnRelatorio.Enabled:=false;
       btnFiltro.Enabled:=false;

       medtME_anomes.Enabled:=false;
       cbb_tipo_recebedor.Enabled:=false;
       medt1.Enabled:=false;
       btnDelete.Enabled:=false;

       MsgDlg( 'Não existem aposentados ou pensionistas com dívidas de benefícios cadastradas.','Informação',mtInformation,[mbOk],0);
    end
  else
    begin
  //   btnProcessar.Enabled:=True;
  //   bbtnDesfazer.Enabled:=True;

       btnSelTudo.Enabled:=True;
       btnInverte.Enabled:=True;
       btnRelatorio.Enabled:=True;
       btnFiltro.Enabled:=True;

       medtME_anomes.Enabled:=True;
       cbb_tipo_recebedor.Enabled:=True;
       medt1.Enabled:=True;
       btnDelete.Enabled:=True;
    end;

  qrydet.Filtered:=false;
  qry.Active:=true;
  sbtnProcurar.Down:=False;
  sbtnAlterar.Enabled:=True;
  pgctrlDetalhe.Enabled:=True;

end;
//edilaine SIG115304 : fim


procedure TFrmHstDividaBenef3.btnFiltroClick(Sender: TObject);
var
  passou:Boolean;
  filtro:string;
begin
  inherited;
passou:=False;
qrydet.Filter:='';
if not qryDet.IsEmpty then
   begin

    qrydet.Filtered:=False;
    if medt1.Text<>'    /  ' then
       begin
       filtro:=' MESREFERENCIA='+#39+medt1.Text+#39;
       passou:=True;
       end;



    if medtME_anomes.Text<>'    /  ' then
       begin

        if passou then
           filtro:=filtro+' AND';

       filtro:=filtro+' MESCOBRANCA='+#39+medtME_anomes.Text+#39;
       passou:=True;
       end;
    if (cbb_tipo_recebedor.itemindex>=0) and (cbb_tipo_recebedor.itemindex<6)then
       begin

       if passou then
         filtro:=filtro+' AND';

       filtro:=filtro+' FLGSITUACAO2 = '+inttostr(cbb_tipo_recebedor.itemindex) ;
       end;


    qrydet.Filter:= filtro;
    qrydet.Filtered:=True;
    //qrydet.Active:=True;
  end;

end;

procedure TFrmHstDividaBenef3.medtValorPrevistoExit(Sender: TObject);
begin
  inherited;
  //edilaine SIG126276 : inicio
  {if medtValorPrevisto.text<>'' then
   medtValorPrevisto.text:=formatfloat('0.00',Str2Float(medtValorPrevisto.text));    //edilaine SIG115304
  } //edilaine SIG126276
end;

procedure TFrmHstDividaBenef3.FormActivate(Sender: TObject);
begin
  inherited;
  try
    if qryLkPORTADORFORMA.Active then qryLkPORTADORFORMA.Close;
      qryLkPORTADORFORMA.open;
  except
    MsgDlg('Erro ao abrir lookup ','Error',mtError,[mbok],0);
    Abort;
  end;

  sbtAltProvisao.enabled := sbtnInsDet.enabled;    //edilaine SIG115304

  doDelete:=false;
//dbgrdDet.enabled:=False;
//dbgrdDet.Columns[0].ReadOnly:=True;

end;

procedure TFrmHstDividaBenef3.sbtnAltDetClick(Sender: TObject);
begin

  if qryDet.IsEmpty then
  begin
   sbtnAltDet.Down := false;
   exit;
  end
else
   begin
//   dbgrdDet.enabled:=True;
 // if qryDetSELECIONAr.text='S' then
     begin
//     dbgrdDet.Columns[0].ReadOnly:=False;

     if (qryDet.FieldByName('FLGSITUACAO2').Text='0') or (qryDet.FieldByName('FLGSITUACAO2').Text='5') then
        begin
        if qryDet.FieldByName('FLGSITUACAO2').Text='5' then
           chkSusp.checked := true
        else
           chkSusp.checked := false;
        medtvenc.Visible:=false;
        medtanomescob.Visible:=false;
        //medtValorPrevisto.Visible:=false;                                       //edilaine SIG126276
        medtValorPrevisto.value := qryDet.fieldbyname('VALORPREVISTO').AsFloat;   //edilaine SIG126276
        memObservacaoInsert.Visible := false; //BRUNO AZEVEDO SIG33744
        dbmmoOBSERVACAO.Visible := true; //BRUNO AZEVEDO SIG33744
        dbedDataPrev.Visible:=true;
        dbMesCobr.Visible:=true;             //edilaine SIG115304
        //dbEditValorPrevisto.Visible:=true;                                      //edilaine SIG126276

        mmObsAux.text := dbmmoOBSERVACAO.text;     //edilaine SIG33744
        sDataPrevista := qryDetDATAPREVISTA.asstring ; // Helen WO8288
        sVlParcela    := qryDetVALORPREVISTO.asstring ; // Helen WO8288
        qryDet.edit;

        inherited
        end
     else
        begin
        MsgDlg( 'Não foi possível efetuar a Alteração.','Informação',mtInformation,[mbOk],0);
        sbtnAltDet.Down := false;
        exit;
        end;

     end;

   end;


end;

procedure TFrmHstDividaBenef3.sbtnExcluiDetClick(Sender: TObject);
  procedure ExecDeleteHSTDIVIDABENEFICIO;
  var
   query:TwwQuery;
     begin

     query:=TwwQuery.Create(Self);
     query.DataBaseName :='BaseDados';
     query.Active:=false;
     query.SQL.Clear;
     query.SQL.Add('DELETE HSTDIVIDABENEFICIO WHERE IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
     query.ExecSQL;
     GravaLogTOTALPREV ('HSTDIVIDABENEFICIO -DELETE- IDHSTORICODIVIDABENEFICIO = '+qrydet.FieldByName('IDHSTORICODIVIDABENEFICIO').text);
     query.Close;


     query.Active:=false;
     query.SQL.Clear;
     query.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO');
     query.SQL.Add('SET QTDEPARCELAS = (QTDEPARCELAS - 1)');
     query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
     query.ExecSQL;


     query.Destroy;

     end;
var sParcelaDesc :String;  //Helen WO8288 
begin
 qryDet.first;
 qryDet.DisableControls;    //edilaine - SIG33744
  while not qryDet.eof do
   begin
     if qryDetSELECIONAr.text='S' then
     begin
     if (qryDet.FieldByName('FLGSITUACAO2').Text='0') or
        (qryDet.FieldByName('FLGSITUACAO2').Text='5') then
        begin

        idhistdelete:=qryDetIDHSTORICODIVIDABENEFICIO.Text;
        doDelete:=true;

        //Helen WO8288  : inicio
        sParcelaDesc := '******** Valores da Exclusão Realizada ********                     '+ #13+
                        '                                                                          '+ #13+
                        'Forma de Pagamento: '+ qryDetTIPOPAGAMENTO.asString + ';                  '+ #13+
                        'Data Vencto       : '+  qryDetDATAPREVISTA.AsString + ';                  '+ #13+
                        'Mês Cobrança      : ' + qryDetMESCOBRANCA.AsString + ';                   '+ #13+
                        'Valor Previsto    : ' + qryDetVALORPREVISTO.AsString + ';                 '+ #13+
                        'Suspender Cob     : ' + qryDetFLGSITUACAO.AsString + ';                   '+ #13+
                        'Parcela Ref       : ' + qryDetIDHISTORICODIVIDABENEFICIOREF.AsString + '; '+ #13+
                        'Obs               : '+ qryDetOBSERVACAO.asString + ';  ' ;
        {insere movimento de Exclusão manual - TIPOMOVDIVIDA = 14}
         CriaLogDivida(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, '14',
                 query_cab.fieldbyname('SALDODEVEDORATUAL').AsString,
                 query_cab.fieldbyname('QTDEPARCELAS').AsString,sParcelaDesc );
        //Helen WO8288  : Fim

        ExecDeleteHSTDIVIDABENEFICIO;
        qryDet.delete;
        continue;


        end
     else
        begin
        MsgDlg( 'Não foi possível Deletar.','Informação',mtInformation,[mbOk],0);
        qryDet.next;
        continue;
//        sbtnExcluiDet.Down:=false;
//        exit;
        end;


     end;
   qryDet.next;
   end;

   qryDet.first;             //edilaine - SIG33744
   qryDet.EnableControls;    //edilaine - SIG33744

  if doDelete then
     sbtnExcluiDet.Down:=false;
end;

procedure TFrmHstDividaBenef3.btnSelTudoClick(Sender: TObject);
begin
  inherited;
  if not qryDet.isempty then
   begin
     qryDet.First;
     qryDet.DisableControls;    //edilaine - SIG33744
     while not qryDet.eof do
      begin
        qryDet.edit;
        qryDetSELECIONAr.text:='S';
        qryDet.post;
        qryDet.Next;
      end;
     qryDet.First;              //edilaine - SIG33744
     qryDet.EnableControls;   //edilaine - SIG33744
  end;

end;

procedure TFrmHstDividaBenef3.btnInverteClick(Sender: TObject);
begin
  inherited;
   if not qryDet.isempty then
   begin
     qryDet.First;
     qryDet.DisableControls;    //edilaine - SIG33744
     while not qryDet.eof do
       begin
         qryDet.edit;
         qryDetSELECIONAr.text:='N';
         qryDet.post;
         qryDet.Next;
       end;
     qryDet.First;              //edilaine - SIG33744
     qryDet.EnableControls;   //edilaine - SIG33744
   end;
end;

procedure TFrmHstDividaBenef3.btnProcessarClick(Sender: TObject);
begin
  bbtnDesfazer.Enabled:=False;
  btnProcessar.Enabled:=False;

  qrydet.Filter:='Selecionar ='+#39+'S'+#39;
  qrydet.Filtered:=True;
  qrydet.Active:=True;

  //edilaine SIG33744 : inicio
  try
    if qrydet.IsEmpty then
     begin
       MsgDlg( 'É necessário selecionar pelo menos um aposentado ou pensionista','Informação',mtInformation,[mbOk],0);
       Exit;
     end;

     if qryDet.FieldByName('FLGSITUACAO2').Text='0' then
       begin
        if MsgDlg('Deseja efetuar o Envio ? ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo then
           exit;
       end
     else
       begin
         MsgDlg( 'Não é possível efetuar o Envio.','Informação',mtInformation,[mbOk],0);
         exit;
       end;

    try
       If not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

       ExecutarEnvio;

       dtmBaseDados.dbBaseDados.Commit;

    except
       If dtmBaseDados.dbBaseDados.InTransaction   Then
          dtmBaseDados.dbBaseDados.Rollback;
    end;

  finally
    bbtnDesfazer.Enabled:=True;
    btnProcessar.Enabled:=True;

    if iddivida<>'' then
       Consulta(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);

    qrydet.Filtered := FALSE;
  end;
  //edilaine SIG33744 : fim

end;

procedure TFrmHstDividaBenef3.bbtnDesfazerClick(Sender: TObject);
begin
  bbtnDesfazer.Enabled:=false;
  btnProcessar.Enabled:=false;

  qrydet.Filter:='Selecionar ='+#39+'S'+#39;
  qrydet.Filtered:=True;
  qrydet.Active:=True;

  //edilaine SIG33744 : inicio
  try
    if qrydet.IsEmpty then
     begin
       MsgDlg( 'É necessário selecionar pelo menos um aposentado ou pensionista','Informação',mtInformation,[mbOk],0);
       Exit;
     end;

     if (qrydet.FieldByName('FLGSITUACAO2').Text = '1') or (qrydet.FieldByName('FLGSITUACAO2').Text = '2') then
       begin
         if MsgDlg('Deseja defazer o Envio ? ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo then
            Exit;
       end
       else
       begin
         MsgDlg( 'Não é possível desfazer o Envio.','Informação',mtInformation,[mbOk],0);
         Exit;
       end;

    TRY
       If not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

       ExecutarDesfazerEnvio;

       dtmBaseDados.dbBaseDados.Commit;

    except
      If dtmBaseDados.dbBaseDados.InTransaction   Then
         dtmBaseDados.dbBaseDados.Rollback;
    end;

  finally
    bbtnDesfazer.Enabled:=True;
    btnProcessar.Enabled:=True;

    if iddivida<>'' then
       Consulta(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);

    qrydet.Filtered:=FALSE;
  end;
   //edilaine SIG33744 : fim
end;

procedure TFrmHstDividaBenef3.bbtnOkDetClick(Sender: TObject);
var
 query:TwwQuery;
 contr:string;
 rValor  : double;      //edilaine SIG33744
 sParcelaDesc, Tpmovdivida :string; //WO8288 - Helen
begin
  if dbedDataPrev.Visible = False then////veio do incluir
  begin

   //BRUNO AZEVEDO INÍCIO SIG33744
   //if (Trim(medtValorPrevisto.Text) <> '') then
   begin
     //if ((strtofloat(medtValorPrevisto.Text) < 0) and (Trim(memObservacaoInsert.Text) = '')) then begin
     if (medtValorPrevisto.value < 0) and (Trim(memObservacaoInsert.Text) = '') then begin           //edilaine SIG126276
       MsgDlg('É necessário preencher o campo "Observação".','Informação',mtInformation,[mbOk],0);
       memObservacaoInsert.SetFocus;
       Exit;
     end;
   end;
   //BRUNO AZEVEDO FIM SIG33744

   //BRUNO AZEVEDO INÍCIO SIG33744
   //if ((Trim(medtValorPrevisto.Text)='') or (Trim(medtValorPrevisto.Text)='0,00')or(strtofloat(medtValorPrevisto.Text)<0)) then
   //if ((Trim(medtValorPrevisto.Text)='') or (Trim(medtValorPrevisto.Text)='0,00')) then
   if (medtValorPrevisto.value = 0) then           //edilaine SIG126276
   //BRUNO AZEVEDO FIM SIG33744
       begin
       MsgDlg('O campo Valor Previsto da Parcela é de caráter obrigatório.','Aviso',mtInformation,[mbOk,mbHelp],0);
       medtValorPrevisto.setfocus;
       exit;
       end;


   if (medtanomescob.Text='    /  ') then
       begin
       MsgDlg('Os campo Ano/mês Cobrança é de caráter obrigatório.','Aviso',mtInformation,[mbOk,mbHelp],0);
       medtanomescob.setfocus;
       exit;
       end;

   if (medtvenc.Text='  /  /    ') then
       begin
       MsgDlg('O campo Data Vencimento é de caráter obrigatório.','Aviso',mtInformation,[mbOk,mbHelp],0);
       medtvenc.setfocus;
       exit;
       end;

   if (chkSusp.checked) and (memObservacaoInsert.text = '') then    //edilaine SIG33744
       begin
       MsgDlg('É obrigatório preencher a observação sobre suspensão.','Aviso',mtInformation,[mbOk,mbHelp],0);
       memObservacaoInsert.setfocus;                                //edilaine SIG33744
       exit;
       end;

    contr:=cboNCobra_D.LookupValue;
   bbtnCancelarDetClick(Sender);

   InserirHSTDIVIDABENEFICIO(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text,

                          qrydet.FieldByName('IDPESSOA').text,
                          qrydet.FieldByName('IDTITULAR').text,
                          qrydet.FieldByName('IDPESSJUR').text,
                          qrydet.FieldByName('IDBENEFICIO').text,
                          qrydet.FieldByName('IDPLANOPREV').text,
                          qrydet.FieldByName('MESREFERENCIA').text,
                          medtanomescob.Text,
                          //BRUNO AZEVEDO INÍCIO SIG33744
                          medtValorPrevisto.Text,
                          //(qrydet.FieldByName('VALORPARCELA').text),
                          //BRUNO AZEVEDO FIM SIG33744
                          medtvenc.text,   {medtanomescob.Text,}                           //edilaine SIG115304
//                          inttostr(cmbMes.Itemindex)+'/'+inttostr(speAno.Value),
                          'B',
                          iff(qryDet.FieldByName('FLGSTATUS').AsInteger = 2, '5', '0'),    //edilaine SIG115304
                          '0',contr,
                          memObservacaoInsert.Text //BRUNO AZEVEDO SIG33744
                          );

   //Helen WO8288  : inicio
   sParcelaDesc := '******** Valores da Inclusão Realizada ********                           '+ #13+
                   '                                                                          '+ #13+
                   'Forma de Pagamento: '+ qryDetTIPOPAGAMENTO.asString + ';                  '+ #13+
                   'Data Vencto       : '+  qryDetDATAPREVISTA.AsString + ';                  '+ #13+
                   'Mês Cobrança      : ' + qryDetMESCOBRANCA.AsString + ';                   '+ #13+
                   'Valor Previsto    : ' + qryDetVALORPREVISTO.AsString + ';                 '+ #13+
                   'Suspender Cob     : ' + qryDetFLGSITUACAO.AsString + ';                   '+ #13+
                   'Parcela Ref       : ' + qryDetIDHISTORICODIVIDABENEFICIOREF.AsString + '; '+ #13+
                   'Obs               : '+ qryDetOBSERVACAO.asString + ';  ' ;
   {insere movimento de Inserir manual - TIPOMOVDIVIDA = 13}
   CriaLogDivida(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, '13',
                 query_cab.fieldbyname('SALDODEVEDORATUAL').AsString,
                 query_cab.fieldbyname('QTDEPARCELAS').AsString, sParcelaDesc);
   //Helen WO8288  : Fim


  end
  else
  begin


   //BRUNO AZEVEDO INÍCIO SIG33744
   //if Trim(dbEditValorPrevisto.Text) <> '' then
   begin
      //edilaine SIG126276 : inicio
      //rValor := Str2Float(dbEditValorPrevisto.text);
      rValor := medtValorPrevisto.value;

      if rValor > query_cab.FieldByName('SALDODEVEDORATUAL').AsFloat then
      begin
        MsgDlg('O campo Valor Previsto deve ser menor que o Saldo Devedor.','Aviso',mtInformation,[mbOk,mbHelp],0);
        medtValorPrevisto.setfocus;
        exit;
      end;
      //edilaine SIG126276 : fim
   end;

   //if (Trim(dbEditValorPrevisto.Text) <> '') then         //edilaine SIG126276
   begin
     if (rValor < 0) and (Trim(dbmmoOBSERVACAO.Text) = '') then begin
       MsgDlg('É necessário preencher o campo "Observação".','Informação',mtInformation,[mbOk],0);
       dbmmoOBSERVACAO.SetFocus;
       Exit;
     end;
   end;
   //BRUNO AZEVEDO FIM SIG33744

  //  If not dtmBaseDados.dbBaseDados.InTransaction Then
 //           dtmBaseDados.dbBaseDados.StartTransaction;

   if chkParcela.checked then
      if dbref.text = '' then
        begin
        MsgDlg('É necessário selecionar a Parcela de Referência.','Aviso',mtInformation,[mbOk,mbHelp],0);
        dbref.setfocus;
        exit;
        end;

   //edilaine - SIG33744 : inicio
   if (not chkSusp.checked) and (qryDet.FieldByName('FLGSITUACAO2').AsInteger = 5) and
      (mmObsAux.text = dbmmoOBSERVACAO.text) then
   begin
       MsgDlg('É obrigatório preencher a observação sobre retirada da suspensão.','Aviso',mtInformation,[mbOk,mbHelp],0);
       dbmmoOBSERVACAO.setfocus;
       exit;
       end;
   //edilaine - SIG33744 : fim

   if ((chkSusp.checked) and (dbmmoOBSERVACAO.text = '')) then
       begin
       MsgDlg('É obrigatório preencher a observação sobre suspensão.','Aviso',mtInformation,[mbOk,mbHelp],0);
       dbmmoOBSERVACAO.setfocus;
       exit;
       end;

    query:=TwwQuery.Create(Self);
    query.DataBaseName :='BaseDados';
    query.Active:=false;
    query.SQL.Clear;

    if doInsert = false then
       begin
 //       query.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO');
//        query.SQL.Add('SET ');
//        //query.SQL.Add('MESCOBRANCA = '+#39+wwDBEdit1.Text+#39);
//        //query.SQL.Add(',MESREFERENCIA= '+#39+qryDet.fieldbyname('MESREFERENCIA').text+#39);
//   //     query.SQL.Add('VALORPREVISTO= '+#39+dbEditValorPrevisto.Text+#39);
//        query.SQL.Add('WHERE');
//        query.SQL.Add(' IDCONTROLEDIVIDABENEFICIO ='+qryDet.fieldbyname('IDCONTROLEDIVIDABENEFICIO').text);
//        query.ExecSQL;
        //WO8288 - Helen - ini
        sParcelaDesc := '******** Valores da Alteração Realizada ********         '+ #13+
                        '                                                               '+ #13+
                        'Forma de Pagamento : '+ qryDetTIPOPAGAMENTO.asString + ';      '+ #13+
                        'Data Vencto        : '+  qryDetDATAPREVISTA.AsString + ';      '+ #13+
                        'Mês Cobrança       : ' + qryDetMESCOBRANCA.AsString + ';       '+ #13+
                        'Valor Previsto     : ' + qryDetVALORPREVISTO.AsString + ';     '+ #13+
                        'Suspender Cob      : ' + qryDetFLGSITUACAO.AsString + ';       '+ #13+
                        'Parcela Ref        : ' + qryDetIDHISTORICODIVIDABENEFICIOREF.AsString + ';  '+ #13+
                        'Obs                : '+ qryDetOBSERVACAO.asString + ';  ' ;
        //WO8288 - Helen - Fim
        query.Active:=false;
        query.SQL.Clear;
        query.SQL.Add('UPDATE HSTDIVIDABENEFICIO');
        query.SQL.Add('SET ');
        query.SQL.Add('OBSERVACAO = '+#39+dbmmoOBSERVACAO.Text+#39);

        //edilaine - SIG33744 - inicio
        query.SQL.Add(',FLGDEVOLUCAO = '+iif(rValor < 0, '1', '0') );

        //query.SQL.Add(',VALORPREVISTO= '+OraNumero(dbEditValorPrevisto.text));
        query.SQL.Add(',VALORPREVISTO = '+OraNumero(FloatToStr(Abs(rValor))) );
        query.SQL.Add(',TIPOPAGAMENTO = '+QuotedStr(iif(cboNCobra_D.text <> '', 'B', 'F')) );
        //edilaine - SIG33744 - fim

        if chkSusp.checked = true then
           query.SQL.Add(',FLGSITUACAO = 5')
        else
           query.SQL.Add(',FLGSITUACAO = 0');

       if chkParcela.checked then
          begin
          query.SQL.Add(',IDHISTORICODIVIDABENEFICIOREF = '+#39+dbref.LookupValue+#39);
          end
       else
          query.SQL.Add(',IDHISTORICODIVIDABENEFICIOREF = NULL');


        query.SQL.Add(',MESCOBRANCA = '+#39+dbMesCobr.Text+#39);          //edilaine SIG115304
        query.SQL.Add(',DATAPREVISTA = '+#39+dbedDataPrev.Text+#39);
        IF cboNCobra_D.LookupValue<>'' THEN
           query.SQL.Add(',FLGDESCFOLHA=''P''')
        else
           query.SQL.Add(',FLGDESCFOLHA='+#39+'B'+#39);
        query.SQL.Add(',CODPORTFORMA='+#39+cboNCobra_D.LookupValue+#39);
        query.SQL.Add('WHERE');
        query.SQL.Add('    IDHSTORICODIVIDABENEFICIO ='+qryDet.fieldbyname('IDHSTORICODIVIDABENEFICIO').text);
        query.ExecSQL;

        //Helen WO8288 - inicio
       {insere movimento de alteracao manual - TIPOMOVDIVIDA = 9}
       Tpmovdivida := '9'; //  alteracao manual - Generica
       if sDataPrevista <>  dbedDataPrev.Text then
          Tpmovdivida := '17'; // Alteração Manual Dt Vencto
       if strtofloat(sVlParcela) <> strtofloat (medtValorPrevisto.text) then
          Tpmovdivida := '18'; // Alteração Manual Vl Parcela

       CriaLogDivida(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, Tpmovdivida,
                        query_cab.fieldbyname('SALDODEVEDORATUAL').AsString,
                        query_cab.fieldbyname('QTDEPARCELAS').AsString, sParcelaDesc
                        );

       //Helen WO8288  - Fim
       end ;


  //       if dtmBaseDados.dbBaseDados.InTransaction then
   //         dtmBaseDados.dbBaseDados.Commit;
   end;

medtvenc.Visible:=False;
medtanomescob.Visible:=False;
//medtValorPrevisto.Visible:=False;    //edilaine SIG126276
memObservacaoInsert.Visible := false; //BRUNO AZEVEDO SIG33744
dbmmoOBSERVACAO.Visible := true; //BRUNO AZEVEDO SIG33744

dbedDataPrev.Visible:=True;
dbMesCobr.Visible:=True;      //edilaine SIG115304

//dbEditValorPrevisto.Visible:=True;     //edilaine SIG126276

//query.close;
//showmessage('oi7');
//query.destroy;
//showmessage('oi8');

doDelete:=false;
qry.Close;
qry.Open;

  inherited;
  if iddivida<>'' then
     Consulta(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);

  bbtnVoltarDetClick(sender);

end;

procedure TFrmHstDividaBenef3.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
//dbgrdDet.Columns[0].ReadOnly:=True;
//dbgrdDet.enabled:=False;  
If not dtmBaseDados.dbBaseDados.InTransaction Then
     dtmBaseDados.dbBaseDados.StartTransaction;

If dtmBaseDados.dbBaseDados.InTransaction   Then
   dtmBaseDados.dbBaseDados.Rollback;

doInsert:=false;


end;

procedure TFrmHstDividaBenef3.bbtnConfirmarClick(Sender: TObject);
var
   sTipoMov : string;    //edilaine SIG126276
begin

  sTipoMov := '';           //edilaine SIG126276

  //BRUNO AZEVEDO INÍCIO SIG33744
  if (query_cab.State in [dsEdit]) then begin
    if ((cbbStatusDivida.ItemIndex = 1) or (cbbStatusDivida.ItemIndex = 2)) and
        (Trim(edtMotivoAlteracao.Text) = '') then begin
       MsgDlg('É necessário preencher o campo "Motivo de Alteração do Status da Dívida de Benefício".','Informação',mtInformation,[mbOk],0);
       edtMotivoAlteracao.SetFocus;
       Exit;
    end;

    //edilaine SIG126276 : inicio
    sTipoMov := '';
    if (query_cab.FieldByName('FLGSTATUS').AsInteger <> cbbStatusDivida.ItemIndex+1) then
    begin
      if (query_cab.FieldByName('FLGSTATUS').AsInteger <> 1) and (cbbStatusDivida.ItemIndex = 0) then
         sTipoMov := '3';    {reativacao}
      if (Trim(edtMotivoAlteracao.Text) <> '') and (sTipoMov = '') then
         sTipoMov := iff(cbbStatusDivida.ItemIndex = 1, '2', '4');    {suspensao ou encerramento}
    end;
    //edilaine SIG126276 : fim


    //edilaine SIG115304 : inicio
    query_cab.FieldByName('MOTIVO').AsString := edtMotivoAlteracao.text;

    query_cab.FieldByName('FLGSTATUS').AsInteger := cbbStatusDivida.ItemIndex + 1;
    if (query_cab.FieldByName('SALDODEVEDORATUAL').AsFloat = 0) and
       (query_cab.FieldByName('SALDOBAIXADEF').AsFloat = 0) then
    begin
       query_cab.FieldByName('FLGQUITADO').AsInteger := 1;
       sTipoMov := '6';    {quitacao}                        //edilaine SIG126276
    end
    else
       query_cab.FieldByName('FLGQUITADO').AsInteger := 0;
    //edilaine SIG115304 : fim   
    query_cab.Post;
    query_cab.ApplyUpdates;
  end;
  //BRUNO AZEVEDO FIM SIG33744

  //edilaine SIG126276 : inicio
  {insere movimento de encerramento}
  if sTipoMov <> '' then
     CriaLogDivida(query_cab.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, sTipoMov, query_cab.FieldByName('SALDODEVEDORATUAL').AsString );
  //edilaine SIG126276 : fim

  qry.cancelUpdates;   //edilaine SIG115304
  
     {
  query_cab.CLOSE;
  query_cab.SQL.CLEAR;
  query_cab.SQL.Add('SELECT ');
  query_cab.SQL.Add('DISTINCT ');
  query_cab.SQL.Add('   (SELECT MATRICULA FROM DEPENTIT WHERE DEPENTIT.IDPESSOA = CONTROLEDIVIDABENEFICIO.IDPESSOA AND DEPENTIT.IDTITULAR = CONTROLEDIVIDABENEFICIO.IDTITULAR) AS MATRICULA ,');
  query_cab.SQL.Add('   (SELECT NOME FROM PESSOA  WHERE IDPESSOA = CONTROLEDIVIDABENEFICIO.IDPESSOA AND IDTITULAR = CONTROLEDIVIDABENEFICIO.IDTITULAR) AS NOME ,');
  query_cab.SQL.Add('   (SELECT NOME FROM PLANPREV WHERE IDPLANOPREV = CONTROLEDIVIDABENEFICIO.IDPLANOPREV) AS NOMEPLANPREV  ,');
  query_cab.SQL.Add('   DECODE(CONTROLEDIVIDABENEFICIO.FONTEPAGADORA,1,''FUNCEF'',2,''INSS'') AS FONTEPAGADORA,');
  query_cab.SQL.Add('   (SELECT NOME FROM BENEFICIO WHERE BENEFICIO.IDBENEFICIO = CONTROLEDIVIDABENEFICIO.IDBENEFICIO) AS NOMEBENEFICIO ,');
  //BRUNO AZEVEDO INÍCIO SIG33744
  query_cab.SQL.Add('   flgstatus,');
  query_cab.SQL.Add('   decode(flgstatus, 1, ''Ativa'', 2, ''Suspensa'', 3, ''Encerrada'', '''') as StatusDivida,');
  query_cab.SQL.Add('   observacao as motivo,');
  //BRUNO AZEVEDO FIM SIG33744
  query_cab.SQL.Add('   IDCONTROLEDIVIDABENEFICIO ,');
  query_cab.SQL.Add('   IDTITULAR,');
  query_cab.SQL.Add('   IDPESSOA,');
  query_cab.SQL.Add('   IDPLANOPREV,');
  query_cab.SQL.Add('   IDBENEFICIO,');
  query_cab.SQL.Add('   SALDODEVEDORATUAL,');
  query_cab.SQL.Add('   MESINICIO,');
  query_cab.SQL.Add('   MESFIM,');
  query_cab.SQL.Add('   VALORULTIMAPARCELA,');
  query_cab.SQL.Add('   IDCONTROLEDIVIDABENEFICIO,');
  query_cab.SQL.Add('   VALORPARCELA,');
  query_cab.SQL.Add('   SALDODEVEDORINICIAL,');
  query_cab.SQL.Add('   PERCENTUAL,');
  query_cab.SQL.Add('   QTDEPARCELAS,');
  query_cab.SQL.Add('   VALORBENEFICIO,');
  query_cab.SQL.Add(' (SELECT MAX(DATAEFETIVA)Ult FROM  HSTDIVIDABENEFICIO');
  query_cab.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO = '+iddivida);
  query_cab.SQL.Add(' AND FLGSITUACAO = 3)Ult,FLGATUALIZARSALDO,FLGPORTFORMA, ');
  query_cab.SQL.Add(' decode(nvl(FLGQUITADO,0),0,''NÃO QUITADO'',''QUITADO'') FLGQUITADOstr, FLGQUITADO, ');     //edilaine - SIG33744
  query_cab.SQL.Add(' nvl(QUANTIDADEPARCELASPAGAS,0)QUANTIDADEPARCELASPAGAS');
  query_cab.SQL.Add(' , NUMPROCINSS ');                                          //edilaine SIG56256
  //edilaine SIG115304 : inicio
  query_cab.SQL.Add('    ,FLGACAOJUD          ');
  query_cab.SQL.Add('    ,SALDOPROVPERDA      ');
  query_cab.SQL.Add('    ,SALDOBAIXADEF       ');
  //edilaine SIG115304 : fim
  query_cab.SQL.Add('FROM');
  query_cab.SQL.Add('   CONTROLEDIVIDABENEFICIO');
  query_cab.SQL.Add('WHERE IDCONTROLEDIVIDABENEFICIO = '+iddivida);
  query_cab.Open;

  //BRUNO AZEVEDO INÍCIO SIG33744
  if (query_cab.recordcount > 0) then begin
    cbbStatusDivida.ItemIndex := query_cab.FieldByName('FLGSTATUS').AsInteger -1;
  end;
  //BRUNO AZEVEDO FIM SIG33744

  if iddivida<>'' then
      Consulta(iddivida);
  
  qry.Close;
  qry.Open;
//  dbgrdDet.Columns[0].ReadOnly:=True;
//  dbgrdDet.enabled:=False;
  btnProcurar.enabled:=False;
  bbtnDesfazer.Enabled:=False;
  btnProcessar.Enabled:=False;
  }

  inherited;

  if MontaSelect.RetornouValor then
     CarregaDadosDivida();               //edilaine SIG115304


end;

procedure TFrmHstDividaBenef3.FormCreate(Sender: TObject);
begin
  inherited;
  ctrlDocumento:=tctrlDocumento.create;
  ctrlDocumento.InitializeAs(Padroes);

  mmObsAux := TMemo.create(nil);      //edilaine SIG33744


  cbb_tipo_recebedor.ItemIndex:=0;
  qtCk:=0;
end;

procedure TFrmHstDividaBenef3.dbgrdDetDblClick(Sender: TObject);
begin
 // inherited;
 if qryDetSELECIONAr.text='S' then
    begin
     qryDet.edit;
     qryDetSELECIONAr.text:='N';
     qryDet.post;
     qtCk:=qtCk-1;
    end
 else
    begin
     qryDet.edit;
     qryDetSELECIONAr.text:='S';
     qryDet.post;
    qtCk:=qtCk+1; 
    end;

    
if qtCk>0 then
   begin
   btnProcessar.enabled:=True;
   bbtnDesfazer.enabled:=True;
   end
else
   begin
   btnProcessar.enabled:=False;
   bbtnDesfazer.enabled:=False;
   end;
end;

procedure TFrmHstDividaBenef3.bbtnCancelarClick(Sender: TObject);
begin
btnProcurar.enabled:=False;
bbtnDesfazer.Enabled:=False;
btnProcessar.Enabled:=False;

  //BRUNO AZEVEDO INÍCIO SIG33744
  query_cab.Cancel;
  //BRUNO AZEVEDO FIM SIG33744

  inherited;
//dbgrdDet.Columns[0].ReadOnly:=True;
//dbgrdDet.enabled:=False;
If not dtmBaseDados.dbBaseDados.InTransaction Then
     dtmBaseDados.dbBaseDados.StartTransaction;

If dtmBaseDados.dbBaseDados.InTransaction   Then
   dtmBaseDados.dbBaseDados.Rollback;
  if iddivida<>'' then
     Consulta(iddivida);


end;

procedure TFrmHstDividaBenef3.sbtnInsDetClick(Sender: TObject);
begin

  //BRUNO AZEVEDO INÍCIO SIG33744
  //if (query_cab.FieldByName('FLGSTATUS').AsInteger <> 1) then begin     //edilaine SIG115304
  if (cbbStatusDivida.ItemIndex > 1 ) then begin                          //edilaine SIG115304
    MsgDlg('Não é possível realizar a geração de parcelas.','Informação',mtInformation,[mbOk],0);
    sbtnInsDet.Down := false;
    Exit;
  end;
  //BRUNO AZEVEDO FIM SIG33744

medtvenc.Visible:=True;
medtvenc.clear;
medtanomescob.Visible:=True;
medtanomescob.clear;
//medtValorPrevisto.Visible:=True;                                        //edilaine SIG126276
medtValorPrevisto.value := qryDet.fieldbyname('VALORPARCELA').AsFloat;    //edilaine SIG126276
memObservacaoInsert.Visible := true; //BRUNO AZEVEDO SIG33744
memObservacaoInsert.Lines.Clear; //BRUNO AZEVEDO SIG33744

dbmmoOBSERVACAO.Visible := false; //BRUNO AZEVEDO SIG33744
dbedDataPrev.Visible:=False;
dbMesCobr.Visible:=False;      //edilaine SIG115304
//dbEditValorPrevisto.Visible:=False;                                     //edilaine SIG126276
doInsert:=true;

inherited;

end;

procedure TFrmHstDividaBenef3.btnRelatorioClick(Sender: TObject);
begin
//qryDet.Filter:='Selecionar ='+#39+'S'+#39;
//qryDet.Filtered:=True;
//qryDet.Active:=True;

  //edilaine SIG126276 : inicio
  if ((pgctrlDetalhe.ActivePage = tbsDet) and (not qryDet.IsEmpty)) or
     ((pgctrlDetalhe.ActivePage = tbsMovDivida) and (not qryMovDivida.IsEmpty)) 
   then
     gerar_impressao
  else
   begin
     if (pgctrlDetalhe.ActivePage = tbsDet) then
        MsgDlg('É necessário selecionar pelo menos um aposentado ou pensionista para emissão do relatório.','Informação',mtInformation,[mbOk],0)
     else
        MsgDlg('Não há dados para emissão do Relatório.','Informação',mtInformation,[mbOk],0);
     exit;
   end;
  //edilaine SIG126276 : fim
end;

procedure TFrmHstDividaBenef3.btnProcurarClick(Sender: TObject);
var
  mrResult        : TModalResult;
  i,qtparc:Integer;
  query:TwwQuery;
  codp:string;
  novosaldodev:double;
  rSaldoProv, rSaldoBaixa, rSaldoDev : double;    //edilaine SIG115304
  sDesFolha : string;   //edilaine SIG126276
  sParcelaDesc :string; //WO8288 - Helen
begin
   qtparc:=0;
   ToolbarButton971.Down:=False;
   query_cab.CLOSE;
   query_cab.SQL.CLEAR;

   query_cab.SQL.Add('SELECT DISTINCT (SELECT MATRICULA');
   query_cab.SQL.Add('                   FROM DEPENTIT');
   query_cab.SQL.Add('                  WHERE DEPENTIT.IDPESSOA = CONTROLEDIVIDABENEFICIO.IDPESSOA');
   query_cab.SQL.Add('                    AND DEPENTIT.IDTITULAR =');
   query_cab.SQL.Add('                        CONTROLEDIVIDABENEFICIO.IDTITULAR) AS MATRICULA,');
   query_cab.SQL.Add('                (SELECT NOME');
   query_cab.SQL.Add('                   FROM PESSOA');
   query_cab.SQL.Add('                  WHERE IDPESSOA = CONTROLEDIVIDABENEFICIO.IDPESSOA');
   query_cab.SQL.Add('                    AND IDTITULAR = CONTROLEDIVIDABENEFICIO.IDTITULAR) AS NOME,');
   query_cab.SQL.Add('                (SELECT NOME');
   query_cab.SQL.Add('                   FROM PLANPREV');
   query_cab.SQL.Add('                  WHERE IDPLANOPREV = CONTROLEDIVIDABENEFICIO.IDPLANOPREV) AS NOMEPLANPREV,');
   query_cab.SQL.Add('                DECODE(CONTROLEDIVIDABENEFICIO.FONTEPAGADORA,');
   query_cab.SQL.Add('                       1,');
   query_cab.SQL.Add('                       ''FUNCEF'',');
   query_cab.SQL.Add('                       2,');
   query_cab.SQL.Add('                       ''INSS'') AS FONTEPAGADORA,');
   query_cab.SQL.Add('                (SELECT NOME');
   query_cab.SQL.Add('                   FROM BENEFICIO');
   query_cab.SQL.Add('                  WHERE BENEFICIO.IDBENEFICIO =');
   query_cab.SQL.Add('                        CONTROLEDIVIDABENEFICIO.IDBENEFICIO) AS NOMEBENEFICIO,');
   //BRUNO AZEVEDO INÍCIO SIG33744
   query_cab.SQL.Add('                flgstatus,');
   query_cab.SQL.Add('                decode(flgstatus, 1, ''Ativa'', 2, ''Suspensa'', 3, ''Encerrada'', '''') as StatusDivida,');
   query_cab.SQL.Add('                observacao as motivo,');
   //BRUNO AZEVEDO FIM SIG33744
   query_cab.SQL.Add('                IDCONTROLEDIVIDABENEFICIO,');
   query_cab.SQL.Add('                IDTITULAR,');
   query_cab.SQL.Add('                IDPESSOA,');
   query_cab.SQL.Add('                IDPLANOPREV,');
   query_cab.SQL.Add('                IDBENEFICIO,');
   query_cab.SQL.Add('                SALDODEVEDORATUAL,');
   query_cab.SQL.Add('                MESINICIO,');
   query_cab.SQL.Add('                MESFIM,');
   query_cab.SQL.Add('                VALORULTIMAPARCELA,');
   query_cab.SQL.Add('                IDCONTROLEDIVIDABENEFICIO,');
   query_cab.SQL.Add('                VALORPARCELA,');
   query_cab.SQL.Add('                SALDODEVEDORINICIAL,');
   query_cab.SQL.Add('                PERCENTUAL,');
   query_cab.SQL.Add('                QTDEPARCELAS,');
   query_cab.SQL.Add('                VALORBENEFICIO,');
   query_cab.SQL.Add(' (SELECT MAX(DATAEFETIVA)Ult FROM  HSTDIVIDABENEFICIO');
   query_cab.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO = '+iddivida);
   query_cab.SQL.Add(' AND FLGSITUACAO = 3)Ult,FLGATUALIZARSALDO,FLGPORTFORMA, ');
   query_cab.SQL.Add(' decode(nvl(FLGQUITADO,0),0,''NÃO QUITADO'',''QUITADO'') FLGQUITADOstr, FLGQUITADO, ');   //edilaine - SIG33744
   query_cab.SQL.Add(' nvl(QUANTIDADEPARCELASPAGAS,0)QUANTIDADEPARCELASPAGAS');
   query_cab.SQL.Add(' , NUMPROCINSS ');                                          //edilaine SIG56256
   //edilaine SIG115304 : inicio
   query_cab.SQL.Add('  ,FLGACAOJUD          ');
   query_cab.SQL.Add('  ,SALDOPROVPERDA      ');
   query_cab.SQL.Add('  ,SALDOBAIXADEF       ');
   //edilaine SIG115304 : fim
   query_cab.SQL.Add('  ,FLGDESCFOLHA        ');         //edilaine SIG126276
   query_cab.SQL.Add('  FROM CONTROLEDIVIDABENEFICIO');
   query_cab.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO = '+iddivida);
   query_cab.Open;


   /////////

   query:=TwwQuery.Create(Self);
   query.DataBaseName :='BaseDados';
   query.Active:=false;
   query.SQL.Clear;

   try
     FrmHstDivBenefAltOpcao := TFrmHstDivBenefAltOpcao.Create(Application);
     with FrmHstDivBenefAltOpcao do
      begin

      // FHBS - 16/01/2014 - SOL 174933
       query.Active:=false;
       query.SQL.Clear;
       query.SQL.Add('select count(1) as QTDE, sum(FLGSITUACAO) as SOMA');
       query.SQL.Add('  FROM HSTDIVIDABENEFICIO');
       query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO ='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
       query.active:=true;

       // Permitir a alteração do campo apenas quando existir uma parcela preparada e não existir outras parcelas
       if (query.fieldbyname('QTDE').value = 1) and (query.fieldbyname('SOMA').value = 0) then
         FrmHstDivBenefAltOpcao.dtpDataInicioFunc.Enabled := True
       else
         FrmHstDivBenefAltOpcao.dtpDataInicioFunc.Enabled := False;
      // Fim - FHBS - 16/01/2014 - SOL 174933

      //edilaine SIG115304 : inicio
      rSaldoDev   := query_cab.fieldbyname('SALDODEVEDORATUAL').AsFloat;
      rSaldoProv  := query_cab.fieldbyname('SALDOPROVPERDA').AsFloat;
      rSaldoBaixa := query_cab.fieldbyname('SALDOBAIXADEF').AsFloat;


      {query.Active:=false;
      query.SQL.Clear;
      query.SQL.Add('SELECT VLRPROVPERDA, VLRBAIXADEF, VLRREVPROVISAO, VLRREVBAIXADEF');
      query.SQL.Add('  FROM HSTDIVIDABENEFICIO');
      query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO ='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
      query.SQL.Add('   AND (VLRPROVPERDA > 0 OR VLRBAIXADEF > 0 OR VLRREVPROVISAO > 0 OR VLRREVBAIXADEF > 0)');
      query.SQL.Add('   AND PLNCODIGO IS NULL ');
      query.active:=true;
      if not query.eof then
      begin
        rSaldoProv  := query_cab.fieldbyname('SALDOPROVPERDA').AsFloat;
        rSaldoBaixa := query_cab.fieldbyname('SALDOBAIXADEF').AsFloat;

        rSaldoProv  := rSaldoProv + query.FieldByName('VLRPROVPERDA').AsFloat;
        if rSaldoProv > 0 then
           rSaldoProv := rSaldoProv - query.FieldByName('VLRREVPROVISAO').AsFloat;

        rSaldoBaixa := rSaldoBaixa + query.FieldByName('VLRBAIXADEF').AsFloat;
        rSaldoDev   := rSaldoDev - query.FieldByName('VLRBAIXADEF').AsFloat;
        if rSaldoBaixa > 0 then
        begin
          rSaldoBaixa := rSaldoBaixa - query.FieldByName('VLRREVBAIXADEF').AsFloat;
          rSaldoDev   := rSaldoDev + query.FieldByName('VLRREVBAIXADEF').AsFloat;
        end;
      end;  }

      //edilaine SIG115304 : fim


       FrmHstDivBenefAltOpcao.edtperc.text               := query_cab.fieldbyname('PERCENTUAL').Text;
       FrmHstDivBenefAltOpcao.dtpDataInicioFunc.datetime := query_cab.fieldbyname('MESINICIO').Value;
       FrmHstDivBenefAltOpcao.dtpDataFimFunc.datetime    := query_cab.fieldbyname('MESFIM').Value;
       FrmHstDivBenefAltOpcao.edtsaldoinici.text         := query_cab.fieldbyname('SALDODEVEDORINICIAL').text;
       //FrmHstDivBenefAltOpcao.edtSaldoAtu.text           := query_cab.fieldbyname('SALDODEVEDORATUAL').text;   //edilaine SIG115304
       FrmHstDivBenefAltOpcao.edtvlParcela.text          := query_cab.fieldbyname('VALORPARCELA').Text;
       FrmHstDivBenefAltOpcao.edtqtparc.text             := query_cab.fieldbyname('QTDEPARCELAS').Text;

       //edilaine SIG115304 : inicio
       FrmHstDivBenefAltOpcao.edtSaldoAtu.text           := FormatFloat('#,##0.00', rSaldoDev );
       FrmHstDivBenefAltOpcao.edtSldProvisao.text        := FormatFloat('#,##0.00', rSaldoProv );
       FrmHstDivBenefAltOpcao.edtSldBaixa.text           := FormatFloat('#,##0.00', rSaldoBaixa);
       //edilaine SIG115304 : fim

       FrmHstDivBenefAltOpcao.cboNCobra_D.LookupValue    := query_cab.fieldbyname('FLGPORTFORMA').Text;

       FrmHstDivBenefAltOpcao.rgAtuSaldo.enabled := (query_cab.fieldbyname('FONTEPAGADORA').AsString = 'FUNCEF');   //edilaine SIG33744

       //edilaine SIG126276 : inicio
       FrmHstDivBenefAltOpcao.rgAtuSaldo.ItemIndex := query_cab.fieldbyname('FLGATUALIZARSALDO').AsInteger;
       {if query_cab.fieldbyname('FLGATUALIZARSALDO').Text='1' then
          FrmHstDivBenefAltOpcao.rg1.ItemIndex :=0
       else
          FrmHstDivBenefAltOpcao.rg1.ItemIndex :=1;
       }//edilaine SIG126276 : fim

       mrResult  := ShowModal;


       if mrResult <> mrOK then
        begin

          If dtmBaseDados.dbBaseDados.InTransaction   Then
             dtmBaseDados.dbBaseDados.Rollback;
          sbtnAlterarClick(sbtnAlterar);                     //edilaine - SIG33744
          Exit;
        end;

       codp:=FrmHstDivBenefAltOpcao.cboNCobra_D.LookupValue;
       if trim(codp)='' then
          codp:='null';

       //edilaine SIG126276 : inicio
       if (codp = 'null') or (codp = '') or (codp = '0') then
          sDesFolha := 'B'
       else
          sDesFolha := 'P';
       //edilaine SIG126276 : fim

//if query_cab.fieldbyname('QTDEPARCELAS').value< strtofloat(FrmHstDivBenefAltOpcao.edtqtparc.text) then
       begin
//    query.Active:=false;
//    query.SQL.Clear;
//    query.SQL.Add('DELETE HSTDIVIDABENEFICIO');
//    query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
//    query.SQL.Add(' AND FLGSITUACAO = 0');
//    query.ExecSQL;


        query.Active:=false;
        query.SQL.Clear;
        query.SQL.Add('SELECT COUNT(1) AS CONT');
        query.SQL.Add('  FROM HSTDIVIDABENEFICIO');
        query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO ='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
        query.SQL.Add('   AND FLGSITUACAO <> 0');
        query.active:=true;
        qtparc:=query.fieldbyname('CONT').value;

//   for i:=1 to (strtoINT(FrmHstDivBenefAltOpcao.edtqtparc.text)) do
//   InserirHSTDIVIDABENEFICIO(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text,
//                          qrydet.FieldByName('IDPESSOA').text,
//                          qrydet.FieldByName('IDTITULAR').text,
//                          qrydet.FieldByName('IDPESSJUR').text,
//                          qrydet.FieldByName('IDBENEFICIO').text,
//                          qrydet.FieldByName('IDPLANOPREV').text,
//                          qrydet.FieldByName('MESREFERENCIA').text,
//                          qrydet.FieldByName('MESCOBRANCA').text,
//                          (FrmHstDivBenefAltOpcao.edtvlParcela.text),
//                          qrydet.FieldByName('MESCOBRANCA').text,
////                          inttostr(cmbMes.Itemindex)+'/'+inttostr(speAno.Value),
//                          'B',
//                          '0','0', codp );


//   if FrmHstDivBenefAltOpcao.rg1.ItemIndex = 0 then
//      begin
//      if (qrydet.FieldByName('idplanoprev').text='74') or (qrydet.FieldByName('idplanoprev').text='66') or (qrydet.FieldByName('idplanoprev').text='28') then
//          novosaldodev:=RetornaSaldoAtualizado(query_cab.fieldbyname('MESINICIO').text,strtofloat(FrmHstDivBenefAltOpcao.edtSaldoAtu.text))
//      else
//          novosaldodev:=RetornaSaldoAtualizadoRegReplan(strtofloat(FrmHstDivBenefAltOpcao.edtSaldoAtu.text));
//      end
//   else
    //novosaldodev:= strtofloat(FrmHstDivBenefAltOpcao.edtSaldoAtu.text);  //edilaine SIG33744

        query.Active:=false;
        query.SQL.Clear;
        query.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO');
        query.SQL.Add('SET VALORPARCELA = '+OraNumero(FrmHstDivBenefAltOpcao.edtvlParcela.text));
        query.SQL.Add('    ,PERCENTUAL = '+OraNumero(FrmHstDivBenefAltOpcao.edtperc.text));
        query.SQL.Add('    ,QTDEPARCELAS ='+inttostr(strtoint(FrmHstDivBenefAltOpcao.edtqtparc.text)));

        //William Moreira da Silva - SIG 30731
        if (codp = 'null') or (codp = '') then
            query.SQL.Add('    ,FLGPORTFORMA = 0 ')
        else
            query.SQL.Add('    ,FLGPORTFORMA ='+codp);
        //William Moreira da Silva - SIG 30731

        query.SQL.Add('    ,MESFIM ='+#39+DateToStr(FrmHstDivBenefAltOpcao.dtpDataFimFunc.Datetime)+#39);

        query.SQL.Add('    ,MESINICIO ='+#39+DateToStr(FrmHstDivBenefAltOpcao.dtpDataInicioFunc.Datetime)+#39); // FHBS - 16/01/2014 - SOL 174933

        //William Moreira da Silva - SIG 30731 - Incluido condição 0 (Zero)
        if (codp = 'null') or (codp = '') or (codp = '0') then
            query.SQL.Add('    ,FLGDESCFOLHA =''B''')
        else
           query.SQL.Add('    ,FLGDESCFOLHA =''P''');// SOL 230290 KINTANA 350993


        //William Moreira da Silva - SOL 231492 PPM 374038
        //else
        //   query.SQL.Add('    ,FLGDESCFOLHA ='+#39+'B'+#39);
        //   query.SQL.Add('    ,QTDEPARCELAS ='+inttostr(strtoint(FrmHstDivBenefAltOpcao.edtqtparc.text)+qtparc));
        //query.SQL.Add('    ,SALDODEVEDORATUAL='+OraNumero(floattostr(novosaldodev)));               //edilaine SIG33744
        query.SQL.Add('    ,SALDODEVEDORATUAL='+OraNumero(FrmHstDivBenefAltOpcao.edtSaldoAtu.text));  //edilaine SIG33744
        //William Moreira da Silva - SOL 231492 PPM 374038

        //edilaine SIG126276 : inicio
        query.SQL.Add('    ,FLGATUALIZARSALDO = '+ IntToStr(FrmHstDivBenefAltOpcao.rgAtuSaldo.ItemIndex) );

        {if FrmHstDivBenefAltOpcao.rg1.ItemIndex = 0 then
           query.SQL.Add('    ,FLGATUALIZARSALDO=1')
        else
           query.SQL.Add('    ,FLGATUALIZARSALDO=0');
        }//edilaine SIG126276 : fim

    //    query.SQL.Add('    ,SALDODEVEDORATUAL='+OraNumero(FrmHstDivBenefAltOpcao.edtSaldoAtu.text));
        query.SQL.Add('WHERE IDCONTROLEDIVIDABENEFICIO='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
        query.ExecSQL;

        //edilaine SIG126276 : inicio
        {insere movimento de alteracao manual}
        if (query_cab.fieldbyname('VALORPARCELA').AsFloat <> FrmHstDivBenefAltOpcao.edtvlParcela.value) or
           (query_cab.fieldbyname('PERCENTUAL').AsFloat   <> FrmHstDivBenefAltOpcao.edtperc.value  ) or
           (query_cab.fieldbyname('QTDEPARCELAS').AsString <> FrmHstDivBenefAltOpcao.edtqtparc.text) or
           (query_cab.fieldbyname('FLGPORTFORMA').AsString <> codp ) or
           (query_cab.fieldbyname('MESFIM').AsString       <> DateToStr(FrmHstDivBenefAltOpcao.dtpDataFimFunc.Datetime) ) or
           (query_cab.fieldbyname('MESINICIO').AsString    <> DateToStr(FrmHstDivBenefAltOpcao.dtpDataInicioFunc.Datetime) ) or
           (query_cab.fieldbyname('FLGDESCFOLHA').AsString <> sDesFolha) or
           (query_cab.fieldbyname('SALDODEVEDORATUAL').AsFloat <> FrmHstDivBenefAltOpcao.edtSaldoAtu.value ) or
           (query_cab.fieldbyname('FLGATUALIZARSALDO').AsInteger <> FrmHstDivBenefAltOpcao.rgAtuSaldo.ItemIndex ) then
        begin
          //WO8288 - Helen V Bianchi - Ini
          sParcelaDesc := '******** Valores da operação de Alterar Opções de Parcelamento******** '+ #13+
                        '                                                                               '+ #13+
                        'Valor Parcela       : '+ query_cab.fieldbyname('VALORPARCELA').AsString + ';   '+ #13+
                        'Percentual          : '+  query_cab.fieldbyname('PERCENTUAL').AsString + ';    '+ #13+
                        'Qtde Parcelas       : '+ query_cab.fieldbyname('QTDEPARCELAS').AsString + ';   '+ #13+
                        'Flg Port Forma      : '+ query_cab.fieldbyname('FLGPORTFORMA').AsString + ';   '+ #13+
                        'Mês Inicio          : '+ query_cab.fieldbyname('MESINICIO').AsString + ';      '+ #13+
                        'Mês Fim             : '+ query_cab.fieldbyname('MESFIM').AsString + ';         '+ #13+
                        'Flg Desc Folha      : '+ query_cab.fieldbyname('FLGDESCFOLHA').AsString + ';   '+ #13+
                        'Saldo Devedor Atual : '+ query_cab.fieldbyname('SALDODEVEDORATUAL').AsString + ';         '+ #13+
                        'Flg Atualizar Saldo : '+ query_cab.fieldbyname('FLGATUALIZARSALDO').AsString + ';  ' ;
        //WO8288 - Helen V Bianchi - Fim
          CriaLogDivida(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, '9',
                        query_cab.fieldbyname('SALDODEVEDORATUAL').AsString,
                        query_cab.fieldbyname('QTDEPARCELAS').AsString , sParcelaDesc //WO8288 - Add sParcelaDesc
                        );
        end;
        //edilaine SIG126276 : fim

       end;

{ if mrResult <> mrOK then
   begin

    If dtmBaseDados.dbBaseDados.InTransaction   Then
       dtmBaseDados.dbBaseDados.Rollback;

   Exit;
   end; }

     end;
  finally
    FrmHstDivBenefAltOpcao.free;
  end;

  query.close;
  query.destroy;
  if iddivida<>'' then
     Consulta(iddivida);
//  inherited;

end;

procedure TFrmHstDividaBenef3.btnDeleteClick(Sender: TObject);
var
   query:TwwQuery;
   FIdDelPais  : tStringList;
   ind : integer;     //edilaine SIG126276
begin
  inherited;

  if query_cab.isEmpty then     //MIGRACAO-ORACLE
     abort;

  if MsgDlg('Deseja deletar a Dívida do Benefício ? ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then
  begin
    //// FAZER VERIFICACOES
     query:=TwwQuery.Create(Self);
     query.DataBaseName :='BaseDados';
     query.Active:=false;
     query.SQL.Clear;
     query.SQL.Add('SELECT IDCONTROLEDIVIDABENEFICIO');
     query.SQL.Add('  FROM HSTDIVIDABENEFICIO');
     query.SQL.Add(' WHERE FLGSITUACAO <> 0');
     query.SQL.Add('   AND IDCONTROLEDIVIDABENEFICIO  = '+query_cab.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
     query.OPEN;
     if not query.isempty then
        begin
        MsgDlg( 'Não foi possível deletar.','Informação',mtInformation,[mbOk],0);
        query.close;
        query.destroy;
        Exit;
        end;

    //query.OPEN;        //MIGRACAO-ORACLE
    query.close;

     query.Active:=false;
     query.SQL.Clear;
     query.SQL.Add('SELECT COUNT(1)CONTA');
     query.SQL.Add('  FROM HSTDIVIDABENEFICIO');
     query.SQL.Add(' WHERE FLGSITUACAO = 0');
     query.SQL.Add('   AND IDCONTROLEDIVIDABENEFICIO  = '+query_cab.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
     query.OPEN;
     if not query.isempty then
        begin
        if query.fieldbyname('CONTA').value>1 then
            begin
            MsgDlg( 'Não foi possível deletar.','Informação',mtInformation,[mbOk],0);
            query.close;
            query.destroy;
            Exit;
           end;
        end;

    query.close;

    ////EXECUTAR PROCESSO

    //edilaine SIG115304 : inicio
    try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         StartTransacao;

      try
        query.Active:=false;
        query.SQL.Clear;
        query.SQL.Add('DELETE FROM HSTDIVIDABENEFICIO');
        query.SQL.Add('WHERE IDCONTROLEDIVIDABENEFICIO = '+query_cab.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
        query.ExecSQL;

        /// VERIFICAR QUEM SAO OS PAIS
        query.Active:=false;
        query.SQL.Clear;
        query.SQL.Add('SELECT IDCONTROLEDIVIDABENEFICIO FROM CONTROLEDIVIDABENEFICIO WHERE');
        query.SQL.Add('IDCONTROLEDIVIDABENEFUNIF = '+query_cab.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
        query.OPEN;

        FIdDelPais:= TStringList.Create;
        FIdDelPais.clear;


        if not query.IsEmpty then
        begin
          query.first;
          while not query.eof do
          begin
            FIdDelPais.Add(query.FieldByName('IDCONTROLEDIVIDABENEFICIO').Text);
            query.next;
          end;

          query.Active:=false;
          query.SQL.Clear;
          query.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO');
          query.SQL.Add('   SET FLGQUITADO                = 1,');
          //BRUNO AZEVEDO INÍCIO SIG33744
           query.SQL.Add('       FLGSTATUS                 = 3,');
          //BRUNO AZEVEDO FIM SIG33744
          query.SQL.Add('       QUANTIDADEPARCELASPAGAS   = QUANTIDADEPARCELASPAGASUNIF,');
          query.SQL.Add('       SALDODEVEDORATUAL         = SALDODEVEDORATUALUNIF,');
          query.SQL.Add('       IDCONTROLEDIVIDABENEFUNIF = NULL,');
          query.SQL.Add('       QUANTIDADEPARCELASPAGASUNIF = NULL,');
          query.SQL.Add('       SALDODEVEDORATUALUNIF = NULL');
          query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO IN ('+FIdDelPais.COMMATEXT+')');
          query.ExecSQL;

          //edilaine SIG126276 : inicio
          {insere movimento de quitacao}
          for ind := 0 to FIdDelPais.count-1 do
            CriaLogDivida(FIdDelPais.Strings[ind] , '6' );
          //edilaine SIG126276 : fim

        end;
        //WO13803 - Helen V Bianchi - Inicio
        query.Active:=false;
        query.SQL.Clear;
        query.SQL.Add('DELETE FROM MOVDIVIDA WHERE IDCONTROLEDIVIDABENEFICIO = '+query_cab.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
        query.ExecSQL;
        //WO13803 - Helen V Bianchi - Fim

        query.Active:=false;
        query.SQL.Clear;
        query.SQL.Add('DELETE FROM CONTROLEDIVIDABENEFICIO WHERE IDCONTROLEDIVIDABENEFICIO = '+query_cab.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
        query.ExecSQL;

        dtmBaseDados.dbBaseDados.Commit;

        MsgDlg('Dívida deletada com sucesso.','Informação',mtInformation,[mbOk],0);

      except
        dtmBaseDados.dbBaseDados.Rollback;
        MsgDlg('Erro ao excluir a Dívida.','Erro',mtError,[mbOk],0);
      end;

    finally
      query.close;
      query.destroy;
      qryDet.close;
      query_cab.close;
    end;
    //edilaine SIG115304 : fim
  end;
end;

procedure TFrmHstDividaBenef3.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  chkSusp.checked := false;

end;

procedure TFrmHstDividaBenef3.ppHeaderBand3BeforePrint(Sender: TObject);
begin
  inherited;
ppLabel20.caption:=query_cab.fieldbyname('MATRICULA').text;
ppLabel21.caption:=query_cab.fieldbyname('NOME').text;
ppLabel22.caption:=query_cab.fieldbyname('IDCONTROLEDIVIDABENEFICIO').text;
ppLabel24.caption:=query_cab.fieldbyname('MESINICIO').text;
ppLabel26.caption:=query_cab.fieldbyname('MESFIM').text;
ppLabel27.caption:=query_cab.fieldbyname('NOMEBENEFICIO').text;
ppLabel28.caption:=query_cab.fieldbyname('SALDODEVEDORATUAL').text;
ppLabel29.caption:= query_cab.fieldbyname('VALORULTIMAPARCELA').text;

//BRUNO AZEVEDO INÍCIO SIG33744
ppLabel33.caption:= query_cab.fieldbyname('STATUSDIVIDA').text;
ppLabel34.caption:= query_cab.fieldbyname('MOTIVO').text;
ppLabel35.caption:= query_cab.fieldbyname('NUMPROCINSS').text;
//BRUNO AZEVEDO FIM SIG33744

end;

procedure TFrmHstDividaBenef3.dbEditValorPrevistoExit(Sender: TObject);
begin
  inherited;

  //BRUNO AZEVEDO INÍCIO SIG33744
  //if ((Trim(dbEditValorPrevisto.Text)='') or (Trim(dbEditValorPrevisto.Text)='0,00')or(strtofloat(dbEditValorPrevisto.Text)<0)or(strtofloat(dbEditValorPrevisto.Text)=0)) then
  //if ((Trim(dbEditValorPrevisto.Text)='') or (Trim(dbEditValorPrevisto.Text)='0,00')or(Str2Float(dbEditValorPrevisto.Text)=0)) then
  if (medtValorPrevisto.value = 0) then
  //BRUNO AZEVEDO FIM SIG33744
   begin
   MsgDlg('O campo Valor Previsto da Parcela é de caráter obrigatório.','Aviso',mtInformation,[mbOk,mbHelp],0);
   medtValorPrevisto.setfocus;
   exit;
   end;

end;

procedure TFrmHstDividaBenef3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(mmObsAux);      //edilaine SIG33744

  inherited;
end;


//edilaine SIG115304 : inicio
procedure TFrmHstDividaBenef3.sbtAltProvisaoClick(Sender: TObject);
VAR
  mrResult : TModalResult;
  _query   : TwwQuery;
  iIdHistorico : integer;
  sObservacao  : string;
  sDataPrevista : string;
  sTpMovDivida , sParcelaDesc, sDesfazProvisao :String; // WO8288 Helen
begin;
  inherited;

  if (not (qryDet.FieldByName('FLGSITUACAO2').AsInteger in [2,3,4,5])) then
  begin
   MsgDlg('Parcela não processada pelo recebimento.','Aviso',mtInformation,[mbOk,mbHelp],0);
   exit;
  end;

  if (qryDet.FieldByName('PLNCODIGO').AsString <> '') then
  begin
   MsgDlg('Parcela já está contabilizada.','Aviso',mtInformation,[mbOk,mbHelp],0);
   exit;
  end;

  _query := TwwQuery.create(nil);
  _query.DataBaseName := 'BaseDados';
       

  try
    FrmHstDivBenefAltProvisao := TFrmHstDivBenefAltProvisao.Create(Application);
    with FrmHstDivBenefAltProvisao do
    begin

      FrmHstDivBenefAltProvisao.medtanomescob.text     := FormatDateTime('YYYY/MM', StrToDate(SubTraiDias(DateToStr(date), StrToInt(copy(DateToStr(date),1,2))+1)));
      FrmHstDivBenefAltProvisao.lblMesCobranca.Caption := qryDet.fieldbyname('MESCOBRANCA').Text;
      FrmHstDivBenefAltProvisao.lblSitParcela.caption  := qryDet.fieldbyname('FLGSITUACAO').Text;
      FrmHstDivBenefAltProvisao.edtsaldoinici.text     := qryDet.fieldbyname('SALDODEVEDORINICIAL').Text;
      FrmHstDivBenefAltProvisao.edtSaldoAtu.text       := qryDet.fieldbyname('SALDODEVEDORATUAL').Text;
      FrmHstDivBenefAltProvisao.edtSldProvisao.text    := qryDet.fieldbyname('SALDOPROVPERDA').Text;
      FrmHstDivBenefAltProvisao.edtSldBaixa.text       := qryDet.fieldbyname('SALDOBAIXADEF').Text;
      //provisões
      FrmHstDivBenefAltProvisao.rVlrProvPerda          := qryDet.fieldbyname('VLRPROVPERDA').AsFloat;
      FrmHstDivBenefAltProvisao.rVlrRevProvisao        := qryDet.fieldbyname('VLRREVPROVISAO').AsFloat;
      FrmHstDivBenefAltProvisao.rVlrBaixaDef           := qryDet.fieldbyname('VLRBAIXADEF').AsFloat;
      FrmHstDivBenefAltProvisao.rVlrRevBaixa           := qryDet.fieldbyname('VLRREVBAIXADEF').AsFloat;
      FrmHstDivBenefAltProvisao.lFlgStatus             := qryDet.fieldbyname('FLGSTATUS').AsInteger;


      mrResult  := ShowModal;

      if mrResult = mrOk then
      begin
        try
          If not dtmBaseDados.dbBaseDados.InTransaction Then
             dtmBaseDados.dbBaseDados.StartTransaction;

          //insere parcela suspensa se necessario
          if (qryDet.fieldbyname('FLGSTATUS').AsInteger = 2) and
             (FrmHstDivBenefAltProvisao.medtanomescob.text <> qryDet.fieldbyname('MESCOBRANCA').Text) then
          begin
            sDataPrevista := '20/'+Copy(FrmHstDivBenefAltProvisao.medtanomescob.text,6,2)+'/'+
                                   Copy(FrmHstDivBenefAltProvisao.medtanomescob.text,1,4);
            sDataPrevista := GetDiaUtil(sDataPrevista,0);

            iIdHistorico := InserirHSTDIVIDABENEFICIO(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text,
                                                      qrydet.FieldByName('IDPESSOA').text,
                                                      qrydet.FieldByName('IDTITULAR').text,
                                                      qrydet.FieldByName('IDPESSJUR').text,
                                                      qrydet.FieldByName('IDBENEFICIO').text,
                                                      qrydet.FieldByName('IDPLANOPREV').text,
                                                      FrmHstDivBenefAltProvisao.medtanomescob.text,
                                                      FrmHstDivBenefAltProvisao.medtanomescob.text,
                                                      //query_cab.fieldbyname('VALORPARCELA').Text,
                                                      FloatToStr(FrmHstDivBenefAltProvisao.rVlrBaixaDef),
                                                      sDataPrevista,
                                                      'B',
                                                      '5',
                                                      '0', '',
                                                      ''
                                                      );

            qry.Close;
            qry.Open;

            //Helen WO8288  : inicio
            sParcelaDesc := '******** Inclusão Realizada pelo Ajusta Provisoes ******** ';
            {insere movimento de Inserir manual}
            CriaLogDivida(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, '13',
                 query_cab.fieldbyname('SALDODEVEDORATUAL').AsString,
                 query_cab.fieldbyname('QTDEPARCELAS').AsString,sParcelaDesc );
            //Helen WO8288  : Fim

          end
          else
            iIdHistorico := qryDet.fieldbyname('IDHSTORICODIVIDABENEFICIO').AsInteger;

          if FrmHstDivBenefAltProvisao.rVlrProvPerda > 0 then
             sObservacao := 'AJUSTA PROVISÃO DE PERDA';

           if FrmHstDivBenefAltProvisao.rVlrRevProvisao > 0 then
             sObservacao := 'REVERSÃO DE PROVISÃO DE PERDA';

          if FrmHstDivBenefAltProvisao.rVlrBaixaDef > 0 then
             //sObservacao := 'BAIXA DEFINITIVA ('+FloatToStr(FrmHstDivBenefAltProvisao.rVlrBaixaDef)+')';    //edilaine SIG134593
             sObservacao := 'BAIXA DEFINITIVA ('+FormatFloat('#,##0.00',FrmHstDivBenefAltProvisao.rVlrBaixaDef)+')';      //edilaine SIG134593

          if FrmHstDivBenefAltProvisao.rVlrRevBaixa > 0 then
             sObservacao := 'REVERSÃO DE BAIXA DEFINITIVA';

          //altera valores Na parcela
          _query.close;
          _query.SQL.Clear;
          _query.SQL.Add('UPDATE HSTDIVIDABENEFICIO SET');
          _query.SQL.Add('       OBSERVACAO     = '+ QuotedStr(sObservacao)+', ' );
          _query.SQL.Add('       VLRPROVPERDA   = '+OraNumero(FloatToStr(FrmHstDivBenefAltProvisao.rVlrProvPerda))+', ');
          _query.SQL.Add('       VLRREVPROVISAO = '+OraNumero(FloatToStr(FrmHstDivBenefAltProvisao.rVlrRevProvisao))+', ');
          _query.SQL.Add('       VLRBAIXADEF    = '+OraNumero(FloatToStr(FrmHstDivBenefAltProvisao.rVlrBaixaDef))+', ');
          _query.SQL.Add('       VLRREVBAIXADEF = '+OraNumero(FloatToStr(FrmHstDivBenefAltProvisao.rVlrRevBaixa)) );
          _query.SQL.Add(' WHERE IDHSTORICODIVIDABENEFICIO = '+IntToStr(iIdHistorico) );
          _query.ExecSQL;

          //Helen WO8288  : inicio
          {insere movimento de Alterar manual}
          if sObservacao = 'AJUSTA PROVISÃO DE PERDA' then
             sTpMovDivida :=  '15';
          if sObservacao = 'REVERSÃO DE PROVISÃO DE PERDA' then
             sTpMovDivida :=  '16';
          if (Str2Float(FrmHstDivBenefAltProvisao.edtSldProvisao.text) =  Str2Float(FrmHstDivBenefAltProvisao.lblSaldoProv.Caption))  then
             sTpMovDivida :=  '19';  //Desfaz Reversão de Provisão de Perda
          if sObservacao = 'BAIXA DEFINITIVA ('+FormatFloat('#,##0.00',FrmHstDivBenefAltProvisao.rVlrBaixaDef)+')' then
             sTpMovDivida :=  '5' ;
          if sObservacao = 'REVERSÃO DE BAIXA DEFINITIVA' then
             sTpMovDivida :=  '12' ;

          CriaLogDivida(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, sTpMovDivida,
                 query_cab.fieldbyname('SALDODEVEDORATUAL').AsString,
                 query_cab.fieldbyname('QTDEPARCELAS').AsString);
          //Helen WO8288  : Fim

          dtmBaseDados.dbBaseDados.Commit;

          FrmHstDividaBenef3.bbtnConfirmarClick(sender);
          FrmHstDividaBenef3.CmeDetalheAtualizaBotoes(Sender);

        except
          dtmBaseDados.dbBaseDados.rollback;
        end;
      end;
    end;
 finally
    FrmHstDivBenefAltProvisao.free;
    FreeAndNil(_query);
 end;
end;


procedure TFrmHstDividaBenef3.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  inherited;
  //sbtAltProvisao.enabled := (not query_cab.isEmpty) and (Not sbtnInsDet.Down);
  sbtAltProvisao.enabled := sbtnInsDet.enabled;    //edilaine SIG115304
end;


procedure TFrmHstDividaBenef3.dbEditValorPrevistoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if NOT (key IN ['0'..'9',#13,#44,#45,#46,#08]) then
     Abort;
end;

procedure TFrmHstDividaBenef3.medtValorPrevistoKeyPress(Sender: TObject;
  var Key: Char);
begin
  //if NOT (key IN ['0'..'9',#13,#44,#45,#46,#08]) then
  if NOT (key IN ['0'..'9',#13,#08, #47, '-', ',', '.']) then   //edilaine SIG128237 //leandro sig137257
     Abort;

  //edilaine SIG126276 : inicio
  if (key = '-') then
  begin
    if Pos('-', medtValorPrevisto.text) > 0 then
       medtValorPrevisto.text := StringReplace(medtValorPrevisto.text, '-', '', [])
    else
       medtValorPrevisto.text := '-' + medtValorPrevisto.text;
    abort;
  end;
  //edilaine SIG126276 : fim

  inherited;

end;

procedure TFrmHstDividaBenef3.dbMesCobrKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if NOT (key IN ['0'..'9',#13,#08,#47]) then
     Abort;
end;

procedure TFrmHstDividaBenef3.medtanomescobEnter(Sender: TObject);
begin
  inherited;
  if (trim(medtanomescob.text) = '/')  then
     medtanomescob.text := FormatDateTime('YYYY/MM', StrToDate(medtvenc.text));
end;

procedure TFrmHstDividaBenef3.dbedDataPrevExit(Sender: TObject);
begin
  inherited;
  //WO8288 - Helen V Bianchi - Inicio
  if (qryDet.State in [dsEdit]) then
  begin
    if StrToDate(dbedDataPrev.text) < StrToDate(sDataPrevista) then
    begin
       MsgDlg('Data não pode ser menor que a data Atual.','Informação',mtInformation,[mbOk,mbHelp],0);
       dbedDataPrev.SetFocus;
    end;
  end;
  //WO8288 - Helen V Bianchi - Fim
  if (trim(dbMesCobr.text) = '/')  then
     dbMesCobr.text := FormatDateTime('YYYY/MM', StrToDate(dbedDataPrev.text));


end;

procedure TFrmHstDividaBenef3.dbgrdDetDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  dbgrdDet.DefaultDrawDataCell(Rect, Field, State);
end;
//edilaine SIG115304 : fim


//edilaine SIG126276 : inicio
procedure TFrmHstDividaBenef3.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  Dock973.Visible := pgctrlDetalhe.ActivePage <> tbsMovDivida;
end;

procedure TFrmHstDividaBenef3.ppHeaderBand1BeforePrint(Sender: TObject);
begin
  inherited;
  pplblMatricula.caption := query_cab.fieldbyname('MATRICULA').text;
  pplblNome.caption      := query_cab.fieldbyname('NOME').text;
  pplblCodDivida.caption := query_cab.fieldbyname('IDCONTROLEDIVIDABENEFICIO').text;
  pplblNomeBenef.caption := query_cab.fieldbyname('NOMEBENEFICIO').text;
  pplblStatusDiv.caption := query_cab.fieldbyname('STATUSDIVIDA').text;
  pplblNumINSS.caption   := query_cab.fieldbyname('NUMPROCINSS').text;
end;

procedure TFrmHstDividaBenef3.qryMovDividaAfterOpen(DataSet: TDataSet);
var
  ind : integer;
  lstCamposInt : string;
begin
  inherited;

  lstCamposInt := 'qtdeparcelasant|qtdeparcelasatual|';

  for ind := 0 to qryMovDivida.Fields.count-1 do
    if (qryMovDivida.Fields[ind].DataType = ftFloat) and
       (pos(LowerCase(qryMovDivida.Fields[ind].FieldName), lstCamposInt) = 0) then
    begin
      TNumericField(qryMovDivida.Fields[ind]).DisplayFormat := '#,##0.00';
    end;
end;

procedure TFrmHstDividaBenef3.medtValorPrevistoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 109 then
  begin
    if Pos('-', medtValorPrevisto.text) > 0 then
       medtValorPrevisto.text := StringReplace(medtValorPrevisto.text, '-', '', [])
    else
       medtValorPrevisto.selectall;
  end;
end;
//edilaine SIG126276 : fim


end.
