//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 12/07/2005
// Código   : AL_15
// Motivo   : Atualização da rotina de SUBSCRIÇÃO
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 04/07/2005
// Código   : AL_14
// Motivo   : Atualização da rotina de GRUPAMENTO
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 24/05/2005
// Código   : AL_13
// Motivo   : Implementação na bonificação do tratamento do tipo de operação para afetar a
//            quantidade na nova ou na velha   
//******************************************************************************
// Autor    : Marco Turon
// Data     : 01/06/2005
// Código   : AL_12
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 27/04/2005
// Código   : Al_11
// Motivo   : Retirado o campo pq esse ja está declarado
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 26/04/2005
// Código   : Al_10
// Motivo   : Inclusão dos campos ORIGDEST e IDOPERCUSTODIA na QryInsetOperacaoInvest
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 26/04/2005
// Código   : Al_9
// Motivo   : Inclusão QryCarteiraGerenc
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 26/04/2005
// Código   : AL_8
// Motivo   : Implementação de parametros devido a carteira gerencial
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 26/04/2005
// Código   : AL_7
// Motivo   : Implementação da bonificação para as cart. gerenciais
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 15/02/2005
// Código   : AL_6
// Motivo   : Acerto na montagem da AbreQueryOrigem
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 18/10/2004
// Código   : AL_5
// Motivo   : Ajuste na ProcCisao
//******************************************************************************
// Autor    : Marco Turon
// Data     : 06/10/2004
// Código   : AL_4
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 05/10/2004
// Origem   : FUNCEF
// Função   : ProcRestituicaoCap
// Linha(s) : AL_5
// Motivo   : Ajuste para funcionar a operação
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 28/06/2004
// Origem   : FUNCEF
// Função   : ProcBonificacao
// Linha(s) : AL_3
// Motivo   : Implementação do tipo de boleta para bonificação 'DTD' e alguns
//            tratamentos p/
//            essa operação
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 28/06/2004
// Origem   : FUNCEF
// Função   : ProcBonificacao
// Linha(s) : AL_2
// Motivo   : Implementação do tipo de boleta para bonificação 'DTB'
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 05/04/2004
// Origem   : CM
// Função   : ProcDivJurCap
// Linha(s) : 2380, 2455
// Motivo   : Acerto na gravação da planilha e coddocumento após contabilização qryUpdOperDirCtbFin
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 05/04/2004
// Origem   : CM
// Função   : ProcDivJurCap
// Linha(s) : 2050
// Motivo   : Acerto na gravação da planilha e coddocumento após contabilização na tabela OPERACAODIREITO
//******************************************************************************

unit FCadOperAGE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook, DBCtrls, UOperacaoInvest,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList,
  uCtrlInvContab;

Const
  FMT_NUM_DUAS_CASAS = ',##0.00';

Type
   PRegDestino = ^TRegDestino;

   TRegDestino = Record
     IDINVESTIMENTO,
     IDCARTEIRAINVEST,
     IDCUSTODIANTE,
     IDMOTIVOBLOQUEIO : Longint;
     IDLOTE : string;
     QTDE,
     QTDEDIREITO,
     VALOREXERCIDO,
     PERCENTUALINV,
     VLRCUSTO,
     PERCCUSTO : Extended;
   end;

type

  TfrmCadOperAGE = class(TfrmCadastroCS)
    pnlOrigem: TPanel;
    pnlDestino: TPanel;
    qryEmissor: TwwQuery;
    qryEmissorIDEMISSOR: TFloatField;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryFilha: TwwQuery;
    dtsFilha: TwwDataSource;
    dbgOrigem: TwwDBGrid;
    qryDESCINVESTIMENTO: TStringField;
    qryDESCCARTINVEST: TStringField;
    qrySGLCUSTODIANTE: TStringField;
    qrySIGLAMOTBLOQ: TStringField;
    qryIDLOTE: TStringField;
    qryDATAREFERENCIA: TDateTimeField;
    qryQTDE: TFloatField;
    qryVALOREXERCIDO: TFloatField;
    qryVLRREMUNERACAO: TFloatField;
    qryIR: TFloatField;
    qryVLRLIQ: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDCUSTODIANTE: TFloatField;
    qryIDMOTIVOBLOQUEIO: TFloatField;
    qryTipoOperacao: TwwQuery;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryOperacaoDireito: TwwQuery;
    qryAcoesxBolsa: TwwQuery;
    qryAcoesxBolsaQTDELOTE: TFloatField;
    qryFilhaIDINVESTIMENTO: TFloatField;
    qryCarteiraInvest: TwwQuery;
    qryCustodiante: TwwQuery;
    qryCarteiraInvestIDCARTEIRAINVEST: TFloatField;
    qryCarteiraInvestDESCCARTINVEST: TStringField;
    qryCustodianteIDCUSTODIANTE: TFloatField;
    qryCustodianteSGLCUSTODIANTE: TStringField;
    qryMotivoBloqueio: TwwQuery;
    qryMotivoBloqueioIDMOTIVOBLOQUEIO: TFloatField;
    qryMotivoBloqueioSIGLAMOTBLOQ: TStringField;
    dblCarteira: TwwDBLookupCombo;
    dblCustodiante: TwwDBLookupCombo;
    dblBloqueio: TwwDBLookupCombo;
    qryFilhaDESCCARTEIRA: TStringField;
    qryFilhaDESCINVESTIMENTO: TStringField;
    qryFilhaIDCARTEIRAINVEST: TFloatField;
    qryFilhaIDCUSTODIANTE: TFloatField;
    qryFilhaIDMOTIVOBLOQUEIO: TFloatField;
    qryFilhaQTDEDIREITO: TFloatField;
    qryFilhaVALOREXERCIDO: TFloatField;
    qryFilhaDESCCUSTODIANTE: TStringField;
    qryFilhaDESCBLOQUEIO: TStringField;
    updFilha: TUpdateSQL;
    Panel4: TPanel;
    qryFilhaIDLOTE: TStringField;
    lbDistribuido: TLabel;
    lbAdistribuir: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    qryInvestimento: TwwQuery;
    dtsOperacaoDireito: TwwDataSource;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryFilhaACAO: TStringField;
    pnlBotoesDestino: TPanel;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtIncDet: TSpeedButton;
    BtAltDet: TSpeedButton;
    BtDelDet: TSpeedButton;
    Toolbar975: TToolbar97;
    BtOkDet: TBitBtn;
    BtCancDet: TBitBtn;
    BtVoltaDet: TBitBtn;
    dbgDestino: TwwDBGrid;
    Panel5: TPanel;
    QryBuscaTipoOper: TwwQuery;
    QryBuscaTipoOperIDTIPOINVEST: TFloatField;
    QryBuscaTipoOperIDTIPOOPERACAO: TFloatField;
    QryBuscaTipoOperIDMERCADO: TFloatField;
    QryBuscaTipoOperDESCTIPOOPERACAO: TStringField;
    QryBuscaTipoOperNATUREZAOPERACAO: TStringField;
    QryBuscaTipoOperTIPOCUSTODIA: TStringField;
    QryBuscaTipoOperVENCIMENTO: TFloatField;
    QryBuscaTipoOperTIPCREDOR: TStringField;
    QryBuscaTipoOperFLGTRANSF: TStringField;
    QryBuscaTipoOperFLGCORRET: TStringField;
    QryBuscaTipoOperFLGORDMOVINV: TStringField;
    QryBuscaTipoOperFLGTRATAIR: TStringField;
    QryBuscaInvestimento: TwwQuery;
    QryInsetOperacaoInvest: TwwQuery;
    QryInsertOprAcao: TwwQuery;
    QryBuscaOrdem: TwwQuery;
    QryBuscaOrdemIDORDMOVINV: TFloatField;
    QryBuscaOrdemIDCORRETVALORES: TFloatField;
    QryBuscaOrdemIDINVESTIMENTO: TFloatField;
    QryBuscaOrdemPUORDMOVINV: TFloatField;
    QryBuscaOrdemOBSMOVINV: TStringField;
    QryBuscaOrdemDATAORDMOVINV: TDateTimeField;
    QryBuscaOrdemQTDEORDMOVINV: TFloatField;
    QryBuscaOrdemNUMDOCMOVINV: TStringField;
    QryBuscaOrdemSTATMOVINV: TStringField;
    QryBuscaOrdemIDUSUARIO: TFloatField;
    QryBuscaOrdemIDAUTORIZACAO: TFloatField;
    QryBuscaOrdemTRGDTINCLUSAO: TDateTimeField;
    QryBuscaOrdemTRGUSERINCLUSAO: TStringField;
    QryBuscaOrdemIDTIPOINVEST: TFloatField;
    QryBuscaOrdemIDTIPOOPERACAO: TFloatField;
    QryBuscaOrdemOBSAUTMOV: TStringField;
    QryBuscaOrdemIDCARTEIRAINVEST: TFloatField;
    QryBuscaOrdemIDLOTE: TStringField;
    QryBuscaOrdemIDBOLSAVALORES: TFloatField;
    QryBuscaOrdemIDCUSTODIANTE: TFloatField;
    QryBuscaOrdemQTDEORDENADA: TFloatField;
    QryBuscaOrdemDATAAUTORIZACAO: TDateTimeField;
    QryBuscaOrdemDESCINVESTIMENTO: TStringField;
    QryBuscaOrdemHORAMOV: TStringField;
    QryBuscaOrdemVALOR: TFloatField;
    QryBuscaBolsaValores: TwwQuery;
    QryNumDocumento: TwwQuery;
    qryFilhaPERCCUSTO: TFloatField;
    lblSigla: TLabel;
    lblDataAGE: TLabel;
    lblTipoOperacao: TLabel;
    lblDataEfetiva: TLabel;
    edtDataEfetiva: TCMDateTimePicker;
    QryUpdOperacaoDireitoStatus: TwwQuery;
    QryInsertBoleta: TwwQuery;
    QryBoleta: TwwQuery;
    QryBoletaIDBOLETA: TStringField;
    qryVLRIRREMUNERACAO: TFloatField;
    QryBuscaCarteira: TwwQuery;
    QryUpdIrLitigio: TwwQuery;
    dblAcao: TwwDBLookupCombo;
    QryLote: TwwQuery;
    qryFilhaQTDENOVA: TFloatField;
    QryBuscaInvestimentoIDINVESTIMENTO: TFloatField;
    QryBuscaInvestimentoIDMOEDACONTAB: TFloatField;
    QryBuscaInvestimentoIDEMISSOR: TFloatField;
    QryBuscaInvestimentoIDTIPOINVEST: TFloatField;
    QryBuscaInvestimentoDESCINVESTIMENTO: TStringField;
    QryBuscaInvestimentoCODTIPOACAO: TStringField;
    QryBuscaInvestimentoMOECODIGO: TFloatField;
    QryBuscaInvestimentoQTDELOTE: TFloatField;
    QryBuscaInvestimentoIDBOLSAVALORES: TFloatField;
    qryPERCENTUALINV: TFloatField;
    qryFilhaPERCENTUALINV: TFloatField;
    QryUpdCustoHist: TwwQuery;
    qryFilhaVLRCUSTO: TFloatField;
    qryVLRCUSTO: TFloatField;
    qryVLRCUSTOATUAL: TFloatField;
    qryUpdOperacaoDireito: TwwQuery;
    qryQTDEDIREITO: TFloatField;
    QryOperacaoInvest: TwwQuery;
    QryOperacaoInvestVLRREMUNERACAO: TFloatField;
    QryOperacaoInvestVLRIRREMUNER: TFloatField;
    QryOperacaoInvestQTDEOPERACAO: TFloatField;
    qryFilhaIDOPERACAODIREITO: TFloatField;
    QryBuscaOperacaInvestGrv: TwwQuery;
    QryBuscaTipoOperRECPAG: TStringField;
    QryOperacaoInvestVLROPERACAO: TFloatField;
    QryLoteQTDELOTE: TFloatField;
    qryBuscaValoresCtbFin: TwwQuery;
    qryBuscaValoresCtbFinVALORPLANILHA: TFloatField;
    qryBuscaValoresCtbFinVALORDOCUMENTO: TFloatField;
    qryUpdOperDirCtbFin: TwwQuery;
    LblBoleta: TLabel;
    QryOperacaoInvestNUMDOCUMENTO: TStringField;
    QryOperacaoInvestDATAOPERACAO: TDateTimeField;
    QryAux: TwwQuery;
    qryOperacaoDireitoIDOPERACAODIREITO: TFloatField;
    qryOperacaoDireitoINVORIGEM: TFloatField;
    qryOperacaoDireitoDATAAGE: TDateTimeField;
    qryOperacaoDireitoDATAEX: TDateTimeField;
    qryOperacaoDireitoDATACOM: TDateTimeField;
    qryOperacaoDireitoPERCENTUAL: TFloatField;
    qryOperacaoDireitoPARIDADE: TFloatField;
    qryOperacaoDireitoPRZBOLSA: TDateTimeField;
    qryOperacaoDireitoPRZEMPRESA: TDateTimeField;
    qryOperacaoDireitoATADECISAO: TDateTimeField;
    qryOperacaoDireitoFORMAPAGREC: TStringField;
    qryOperacaoDireitoDIVPORACAO: TFloatField;
    qryOperacaoDireitoINIPAGTO: TDateTimeField;
    qryOperacaoDireitoJUROSCAP: TStringField;
    qryOperacaoDireitoTRGDTINCLUSAO: TDateTimeField;
    qryOperacaoDireitoTRGUSERINCLUSAO: TStringField;
    qryOperacaoDireitoIDTIPOINVEST: TFloatField;
    qryOperacaoDireitoIDTIPOOPERACAO: TFloatField;
    qryOperacaoDireitoIDEMISSOR: TFloatField;
    qryOperacaoDireitoOBSERVACAO: TMemoField;
    qryOperacaoDireitoSTATUS: TStringField;
    qryOperacaoDireitoISENCAOIR: TStringField;
    qryOperacaoDireitoIRLITIGIO: TStringField;
    qryOperacaoDireitoPLNCODIGO: TFloatField;
    qryOperacaoDireitoCODDOCUMENTO: TFloatField;
    qryOperacaoDireitoPLANO: TFloatField;
    qryOperacaoDireitoQTDEACOESDIRPROV: TFloatField;
    qryOperacaoDireitoIDPEDIDOFUNDO: TFloatField;
    qryOperacaoDireitoQTDERECDIRPARC: TFloatField;
    dbgOrigemDivJur: TwwDBGrid;
    UpdOrigDivJur: TUpdateSQL;
    DsOrigDivJur: TwwDataSource;
    QryOrigDivJur: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    StringField5: TStringField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    QryOrigDivJurDESCTIPOOPERACAO: TStringField;
    QryBuscaFundo: TwwQuery;
    qryRENDIMENTO: TFloatField;
    qryOperacaoDireitoDATAOPER: TDateTimeField;
    QryOperacaoInvestVLRIR: TFloatField;
    qryUpdOperacaoDireitoQtd: TwwQuery;
    qryAtualizaBoleta: TwwQuery;
    QryAtualizaOperacoes: TwwQuery;
    qryAcoesxBolsaIDBOLSAVALORES: TFloatField;
    QryOperacaoInvestDestino: TwwQuery;
    QryOperacaoInvestDestinoVLRREMUNERACAO: TFloatField;
    QryOperacaoInvestDestinoVLRIRREMUNER: TFloatField;
    QryOperacaoInvestDestinoQTDEOPERACAO: TFloatField;
    QryOperacaoInvestDestinoVLROPERACAO: TFloatField;
    QryOperacaoInvestDestinoNUMDOCUMENTO: TStringField;
    QryUpdOperDiretoXInv: TwwQuery;
    qryFilhaIDOPERACAOINVEST: TFloatField;
    qryOperacaoDireitoQTDDIREITO: TFloatField;
    qryOperacaoDireitoFLGTIPODIREITO: TStringField;
    //Al_9 - Ricardo - 27/04/2005
    QryCarteiraGerenc: TwwQuery;
    //Al_9 - Fim
    procedure FormCreate(Sender: TObject);
    procedure dbgDestinoEnter(Sender: TObject);
    procedure qryFilhaQTDEDIREITOSetText(Sender: TField;const Text: String);
    procedure BtIncDetClick(Sender: TObject);
    procedure dtsFilhaStateChange(Sender: TObject);
    procedure dtsFilhaDataChange(Sender: TObject; Field: TField);
    procedure BtOkDetClick(Sender: TObject);
    procedure BtCancDetClick(Sender: TObject);
    procedure BtAltDetClick(Sender: TObject);
    procedure BtDelDetClick(Sender: TObject);
    procedure dbgDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDestinoKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure dbgOrigemEnter(Sender: TObject);
    procedure qryAfterPost(DataSet: TDataSet);
    procedure qryFilhaAfterPost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryVLRREMUNERACAOSetText(Sender: TField; const Text: String);
    procedure LSetText(Sender: TField; const Text: String);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FazerProcurarCadAGE(Emissor, TipoOperacao,OperacaoDireito : LongInt;
                                  DataEX : TDateTime;
                                  SiglaEmissor, DescTipoOperacao : String;
                                  bForm, bProv : Boolean);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure BtVoltaDetClick(Sender: TObject);
    procedure dbgDestinoExit(Sender: TObject);
    procedure qryVLRLIQSetText(Sender: TField; const Text: String);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure qryQTDEDIREITOSetText(Sender: TField; const Text: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryVALOREXERCIDOSetText(Sender: TField; const Text: String);
    procedure bbtnSairClick(Sender: TObject);
    procedure qryFilhaQTDENOVASetText(Sender: TField; const Text: String);
  private
    CalculandoOrigem, CalculandoDestino : Boolean;

    Procedure ProcessaLabels;
    procedure AbreQueryOrigem(Emissor, TipoOperacao : LongInt; DataAGE : TDateTime; bCancelar,bRecalcula : boolean);
    Procedure AbreQueryDestino(TipoOperacao, OperacaoDireito : Integer;
                               Acumulado : Extended; DataAGE : TDateTime);
    procedure QTDMudou(QTD : String; ValorAntigo : Extended);
    procedure QTDDIREITOMudou(QTDDIREITO : String; ValorAntigo : Extended);
    procedure RecalculaOrigem;
    procedure RecalculaDestino;
    //Al_8 - Ricardo - 26/04/2005
    procedure GravaOperacaoInvest(iIDOPERACAOINVEST,iMOECODIGO,iIDMODULO,iEMPRESAPROP,iIDINVESTIMENTO,iIDCARTEIRAINVEST,
                                  iIDTIPOINVEST,iIDTIPOOPERACAO,iIDFORCLI,iIDCUSTODIANTE,iIDOPERACAODIREITO,
                                  iIDCARTEIRAGERENC : Integer;
                                  dDATAOPERACAO,dDATAVENCOPER : TDateTime;
                                  sNUMDOCUMENTO,sFLGSTATUSFECHBOL,sFLGSTATUSORDMOV,sIDLOTE : String;
                                  fQTDEOPERACAO,fPRECOUNITOPERACAO,fVLROPERACAO,fVLRIR,
                                  fVLRREMUNERACAO,fVLRIRREMUNER,fPERCCUSTO : Double;
                                  sORIGDEST : String = ''; iOperCustodia: Integer = -1);

    function  ProcuraCampoPeloNome(Grid : TwwDbGrid; NomeCampo : String) : Integer;
    function  ProcDivJurCap   : boolean;
    function  ProcBonificacao : boolean;
    function  ProcCisao       : boolean;
    function  ProcSubscricao  : boolean;
    function  ProcDesdobramento : boolean;
    function  ProcIncorporacao  : boolean;
    function  ProcGrupamento    : boolean;
    function  ProcRestituicaoCap  : boolean;
    function  ProcReorganizacao   : boolean;
    function  VerificaParamInvest : boolean;
    function  ExisteForm : Boolean;
    //Al_7 - Ricardo - 26/04/2005
    function  ProcBonificacaoCartGerenc(wNumDoc : String)  : boolean;
    //Al_7 - Fim    
    { Private declarations }

  published

  public
    { Public declarations }
  end;

var
  frmCadOperAGE: TfrmCadOperAGE;

  wIdOperacaoDireito, iTipoOperacao, wPlano,wPlanilha,wDocumCont, wPlanoProv, wPlnProv,
  wDocProv, wIdOperCust, wIdNovaOperacao, wIdForCli, Investimento, Carteira, Custodiante,
  iIDBOLSAVALORES, Bloqueio, iIdHistCustodia, iInc : integer;

  eIRRemuneracao,eIRExercido,eRemuneracao, wQtdCotaini, Total, fQTDEDIREITO, fQTDE : Extended;

  wNumDoc, Lote, sTipoCustodia, wTipoRecDesBol,wMensErro: String;

  wVlrIR, wVlrIRProv, wVlrOperacao, wSaldoQtd, wSdoQtdCPMF, wSaldoVlr, wSaldoAqui, wSaldoCusto, wSaldoInutil,
  wSaldoIRApu, wVlrTotOperacao, wVlrTotOperacaoAnt, wSaldoAquiPrevisto, wSaldoAquiDestino, wPuCusto,
  fPuAtual : Double;

  dDataBase, dDataAGE, wDataVenc, dDataAGEProv, dDataVencProv : TDateTime;

  RO : TRegTipoOperacao;

  wOperacaoDireito : Word;

  bProvisiona, bQTDEDIREITO, bCancelar, bRecalcula, bCriaLancto, bVerFormAge : boolean;

  wTipoSaida : char;
  fVlrRendimento : Double;

implementation

uses FProcOperAcao, DBaseDados, uMensErro, uDataBase, UOperComum, UImpostos, UBibliotecaInvest,
     uSistema, uDocumento, uIntegraBack, dAGE, FCadAGE, UDiasUteisInv,
  URendaVariavel, dRendaVariavel;
{$R *.DFM}

//Al_8 - Ricardo - 26/04/2005
procedure TfrmCadOperAGE.GravaOperacaoInvest(iIDOPERACAOINVEST,iMOECODIGO,iIDMODULO,iEMPRESAPROP,iIDINVESTIMENTO,iIDCARTEIRAINVEST,
                              iIDTIPOINVEST,iIDTIPOOPERACAO,iIDFORCLI,iIDCUSTODIANTE,iIDOPERACAODIREITO,
                              iIDCARTEIRAGERENC : Integer;
                              dDATAOPERACAO,dDATAVENCOPER : TDateTime;
                              sNUMDOCUMENTO,sFLGSTATUSFECHBOL,sFLGSTATUSORDMOV, sIDLOTE : String;
                              fQTDEOPERACAO,fPRECOUNITOPERACAO,fVLROPERACAO,fVLRIR,
                              fVLRREMUNERACAO,fVLRIRREMUNER, fPERCCUSTO : Double;
                              sORIGDEST : String = ''; iOperCustodia: Integer = -1);
begin
    QryInsetOperacaoInvest.Close;
    QryInsetOperacaoInvest.ParamByName('IDOPERACAOINVEST').AsInteger  := iIDOPERACAOINVEST;
    QryInsetOperacaoInvest.ParamByName('MOECODIGO').AsInteger         := iMOECODIGO;
    QryInsetOperacaoInvest.ParamByName('IDMODULO').AsInteger          := iIDMODULO;
    QryInsetOperacaoInvest.ParamByName('EMPRESAPROP').AsInteger       := iEMPRESAPROP;
    QryInsetOperacaoInvest.ParamByName('IDINVESTIMENTO').AsInteger    := iIDINVESTIMENTO;
    QryInsetOperacaoInvest.ParamByName('IDCARTEIRAINVEST').AsInteger  := iIDCARTEIRAINVEST;
    QryInsetOperacaoInvest.ParamByName('IDTIPOINVEST').AsInteger      := iIDTIPOINVEST;
    QryInsetOperacaoInvest.ParamByName('IDTIPOOPERACAO').AsInteger    := iIDTIPOOPERACAO;
    QryInsetOperacaoInvest.ParamByName('IDFORCLI').AsInteger          := iIDFORCLI;
    QryInsetOperacaoInvest.ParamByName('IDLOTE').AsString             := sIDLOTE;
    If iIDCUSTODIANTE = -1 Then
       QryInsetOperacaoInvest.ParamByName('IDCUSTODIANTE').Clear
    Else
       QryInsetOperacaoInvest.ParamByName('IDCUSTODIANTE').AsInteger  := iIDCUSTODIANTE;

    QryInsetOperacaoInvest.ParamByName('IDOPERACAODIREITO').AsInteger := iIDOPERACAODIREITO;

    If iIDCARTEIRAGERENC <> 0 Then
       QryInsetOperacaoInvest.ParamByName('IDCARTEIRAGERENC').AsInteger  := iIDCARTEIRAGERENC
    Else
       QryInsetOperacaoInvest.ParamByName('IDCARTEIRAGERENC').Clear;

    QryInsetOperacaoInvest.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
    QryInsetOperacaoInvest.ParamByName('DATAOPERACAO').AsDateTime     := dDATAOPERACAO;
    QryInsetOperacaoInvest.ParamByName('DATAVENCOPER').AsDateTime     := dDATAVENCOPER;
    QryInsetOperacaoInvest.ParamByName('NUMDOCUMENTO').AsString       := sNUMDOCUMENTO;
    QryInsetOperacaoInvest.ParamByName('FLGSTATUSFECHBOL').AsString   := sFLGSTATUSFECHBOL;
    QryInsetOperacaoInvest.ParamByName('FLGSTATUSORDMOV').AsString    := sFLGSTATUSORDMOV;
    QryInsetOperacaoInvest.ParamByName('QTDEOPERACAO').AsFloat        := fQTDEOPERACAO;
    QryInsetOperacaoInvest.ParamByName('PRECOUNITOPERACAO').AsFloat   := fPRECOUNITOPERACAO;
    QryInsetOperacaoInvest.ParamByName('VLROPERACAO').AsFloat         := fVLROPERACAO;
    QryInsetOperacaoInvest.ParamByName('VLRIR').AsFloat               := fVLRIR;
    QryInsetOperacaoInvest.ParamByName('VLRREMUNERACAO').AsFloat      := fVLRREMUNERACAO;
    QryInsetOperacaoInvest.ParamByName('VLRIRREMUNER').AsFloat        := fVLRIRREMUNER;
    QryInsetOperacaoInvest.ParamByName('PERCENTUAL').AsFloat          := fPERCCUSTO;
    //Al_8 - Ricardo - 26/04/2005
    If Trim(sORIGDEST) <> '' Then
       QryInsetOperacaoInvest.ParamByName('ORIGDEST').AsString        := sORIGDEST;
    if iOperCustodia <> -1 then
       QryInsetOperacaoInvest.ParamByName('IDOPERCUSTODIA').AsInteger := iOperCustodia;
    //Al_8 - Fim       
    QryInsetOperacaoInvest.ExecSQL;
end;

Procedure TfrmCadOperAGE.ProcessaLabels;
begin
  If lbDistribuido.Caption <> lbAdistribuir.Caption Then
     Begin
       lbDistribuido.Font.Color := clRed;
       lbAdistribuir.Font.Color := clRed;
     End
  Else
     Begin
       lbDistribuido.Font.Color := clWindowText;
       lbAdistribuir.Font.Color := clWindowText;
     End
end;

function TfrmCadOperAGE.VerificaParamInvest:boolean;
begin
   Result := true;
   if pRPI.IDTIPOOPERDIRDIV = 0 then
   begin
      MsgDlg('Parâmetro não definido '#13+'para Tipo de Operação de Direito ( Dividendos )!','Mensagem do Sistema',MtWarning,[mbOk],0);
      Result := False;
   end
   else if pRPI.IDTIPOOPERDIRJUR = 0 then
   begin
      MsgDlg('Parâmetro não definido '#13+'para Tipo de Operação de Direito ( Juros de Capital )!','Mensagem do Sistema',MtWarning,[mbOk],0);
      Result := False;
   end;
end;

Procedure TfrmCadOperAGE.CmeCadastroFind(Sender: TObject);
begin
  Inherited;
  
   if not VerificaParamInvest then
      Exit;

   if MontaSelect.RetornouValor then
   begin
      bQTDEDIREITO       := False;
      wIdOperacaoDireito := StrToInt(MontaSelect.ValoresChave[3]);
      AbreQueryOrigem(StrToInt(MontaSelect.ValoresChave[0]),
                      StrToInt(MontaSelect.ValoresChave[2]),
                      StrToDate(MontaSelect.ValoresChave[1]),
                      False,False);
      iTipoOperacao      := StrToInt(MontaSelect.ValoresChave[2]);
      if (qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat) > 0 Then
      begin
         if ((qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat -
              qryOperacaoDireitoQTDERECDIRPARC.AsFloat) = 0) Then
         begin
            QryBuscaFundo.Close;
            QryBuscaFundo.ParamByName('IDPEDIDOFUNDO').AsInteger :=
                          QryOperacaoDireito.FieldByName('IDPEDIDOFUNDO').AsInteger;
            QryBuscaFundo.Open;

            Panel4.Caption := Trim(QryBuscaFundo.FieldByName('DESCTIPOOPERACAO').AsString);

            lblDataEfetiva.Visible  := False;
            edtDataEfetiva.Visible  := False;
         end
         else
         Begin
            lblDataEfetiva.Visible  := True;
            edtDataEfetiva.Visible  := True;
         End;
      End
      Else
      Begin
         lblDataEfetiva.Visible  := True;
         edtDataEfetiva.Visible  := True;
         LblBoleta.Visible       := True;
      End;
      lblDataAGE.Caption      := MontaSelect.ValoresChave[1];
      lblSigla.Caption        := MontaSelect.ValoresChave[4];
      lblTipoOperacao.Caption := MontaSelect.ValoresChave[5];
      LblBoleta.Caption       := MontaSelect.ValoresChave[6];
      If Not bQTDEDIREITO Then
      Begin
         qry.Close;
         qryFilha.Close;
         edtDataEfetiva.Clear;
         lblSigla.Caption        := '';
         lblDataAGE.Caption      := '';
         lblTipoOperacao.Caption := '';
         LblBoleta.Caption       := '';
         lblDataEfetiva.Visible  := False;
         edtDataEfetiva.Visible  := False;
         bbtnConfirmar.Enabled   := False;
         bbtnCancelar.Enabled    := False;
         pnlDestino.Visible      := True;
         MsgDlg('Não exite Saldo para a Ação Origem.','Mensagem do Sistema',MtError,[mbOk],0);
      End;
   end;
end;

Procedure TfrmCadOperAGE.FazerProcurarCadAGE(Emissor, TipoOperacao,OperacaoDireito : LongInt;
                                             DataEX : TDateTime;
                                             SiglaEmissor, DescTipoOperacao : String;
                                             bForm, bProv  : Boolean);
begin
   bProvisiona             := bProv;
   bVerFormAge             := bForm;
   bQTDEDIREITO            := False;

   sbtnProcurar.Enabled    := False;

   lblDataAGE.Caption      := DateToStr(DataEX);
   lblSigla.Caption        := SiglaEmissor;
   lblTipoOperacao.Caption := DescTipoOperacao;
   wIdOperacaoDireito      := OperacaoDireito;

   AbreQueryOrigem(Emissor,
                   TipoOperacao,
                   DataEX,
                   False,False);

   iTipoOperacao           := TipoOperacao;

   if (qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat) > 0 Then
   begin
      if ((qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat -
           qryOperacaoDireitoQTDERECDIRPARC.AsFloat) = 0) Then
      begin
         lblDataEfetiva.Visible  := False;
         edtDataEfetiva.Visible  := False;
      end
      else
      Begin
         lblDataEfetiva.Visible  := True;
         edtDataEfetiva.Visible  := True;
      End;
   End
   Else
   Begin
      lblDataEfetiva.Visible  := True;
      edtDataEfetiva.Visible  := True;
   End;

   If Not bForm Then
   Begin
      //bbtnCancelar.Enabled := False;
      //bbtnSair.Enabled     := False;
   End;

   If bProv Then
   begin
      Panel4.Caption          := 'ANÚNCIO DE PROVENTOS / '+Copy(lblTipoOperacao.Caption, POS('/',lblTipoOperacao.Caption)+1,Length(lblTipoOperacao.Caption));
      lblDataAGE.Visible      := False;
      lblTipoOperacao.Visible := False;
      lblSigla.Visible        := False;
   end;

   If Not bQTDEDIREITO Then
   Begin
      bbtnSair.Click;
      MsgDlg('Não exite Saldo para a Ação Origem.','Mensagem do Sistema',MtError,[mbOk],0);
   End;

end;

Procedure TfrmCadOperAGE.AbreQueryOrigem(Emissor, TipoOperacao : LongInt; DataAGE : TDateTime; bCancelar, bRecalcula : boolean);
Var
  wQtd, wInutil   : Double;
  NCampo, I, OperacaoDireito : Integer;
  eAcumulado      : Extended;
  DataAnt, DataAGECons     : TDateTime;
begin
   btIncDet.Down := False;
   btAltDet.Down := False;
   btDelDet.Down := False;

   pnlDestino.Visible := False;

   eAcumulado    := 0;
   eIRExercido   := 0;
   wVlrTotOperacaoAnt := 0;

   qryVLRLIQ.ReadOnly           := False;
   qryQTDEDIREITO.ReadOnly      := False;
   qryVLRREMUNERACAO.ReadOnly   := False;
   qryVLRIRREMUNERACAO.ReadOnly := False;
   qryIR.ReadOnly               := False;

   qryOperacaoDireito.Close;
   qryOperacaoDireito.ParamByName('IDOPERACAODIREITO').Asinteger := wIdOperacaoDireito;
   qryOperacaoDireito.Open;

   If qryOperacaoDireito.FieldByName('DATACOM').AsDateTime <> 0 Then
      edtDataEfetiva.Date := qryOperacaoDireito.FieldByName('DATACOM').AsDateTime;

   pnlDestino.Visible := Not ((TipoOperacao  In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL]));

   OperacaoDireito    := qryOperacaoDireitoIDOPERACAODIREITO.AsInteger;

   OperacaoInvest.RetParamOperDireito(OperacaoDireito, RO, qry.DatabaseName);

   RO.DIVPORACAO      := qryOperacaoDireito.FieldByName('DIVPORACAO').AsFloat;
   fPuAtual           := RO.DIVPORACAO;

   wPlanoProv         := qryOperacaoDireitoPLANO.AsInteger;
   wPlnProv           := qryOperacaoDireitoPLNCODIGO.AsInteger;
   wDocProv           := qryOperacaoDireitoCODDOCUMENTO.AsInteger;
// dDataAGEProv       := qryOperacaoDireitoDATAEX.AsDateTime;
   dDataAGEProv       := qryOperacaoDireitoDATAOPER.AsDateTime;
   dDataVencProv      := qryOperacaoDireitoDATACOM.AsDateTime;

   CalculandoOrigem   := True;

   Try
      if not bRecalcula then
      begin
         if qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat = 0 Then
         begin
            qry.Close;
            qry.ParamByName('P_IDOPERACAODIREITO').AsInteger := OperacaoDireito;
            qry.ParamByName('pDATAAGE').AsDate               := DataAGE;
            qry.Open;
         end
         else
         begin
            qry.Close;
            qry.Sql.Clear;
            qry.Sql.Add('SELECT DISTINCT');
            qry.Sql.Add('    INV.DESCINVESTIMENTO,');
            qry.Sql.Add('    CAR.DESCCARTINVEST,');
            qry.Sql.Add('    '' '' AS SGLCUSTODIANTE,');
            qry.Sql.Add('    '' '' AS SIGLAMOTBLOQ,');
            qry.Sql.Add('    ''       '' AS IDLOTE,');
            qry.Sql.Add('    SYSDATE  AS DATAREFERENCIA,');
            qry.Sql.Add('    0 AS QTDE,');
            qry.Sql.Add('    0 AS QTDEDIREITO,');
            qry.Sql.Add('    0 AS VALOREXERCIDO,');
            qry.Sql.Add('    0 AS VLRREMUNERACAO,');
            qry.Sql.Add('    0 AS IR,');
            qry.Sql.Add('    0 AS RENDIMENTO,');
            qry.Sql.Add('    0 AS VLRLIQ,');
            qry.Sql.Add('    0 AS VLRIRREMUNERACAO,');
            qry.Sql.Add('    CAR.IDCARTEIRAINVEST,');
            qry.Sql.Add('    INV.IDINVESTIMENTO,');
            qry.Sql.Add('    -1 AS IDCUSTODIANTE,');
            qry.Sql.Add('    0 AS IDMOTIVOBLOQUEIO,');
            qry.Sql.Add('    OXI.PERCENTUALINV,');
            qry.Sql.Add('    0 AS VLRCUSTOATUAL,');
            qry.Sql.Add('    0 AS VLRCUSTO');
            qry.Sql.Add(' FROM ');
            qry.Sql.Add('    INVESTIMENTO INV, OPERDIREITOXINV OXI,');
            qry.Sql.Add('    OPERACAODIREITO ODI, CARTEIRAINVEST CAR');
            qry.Sql.Add(' WHERE');
            qry.Sql.Add('    OXI.IDOPERACAODIREITO = :P_IDOPERACAODIREITO  AND');
            qry.Sql.Add('    OXI.ORIGDEST          = ''O''                 AND');
            qry.Sql.Add('    CAR.IDCARTEIRAINVEST  = '+IntToStr(pRPI.IDCARTAVISTA)+' AND');
            qry.Sql.Add('    INV.IDINVESTIMENTO    = OXI.IDINVESTIMENTO    AND');
            qry.Sql.Add('    ODI.IDOPERACAODIREITO = OXI.IDOPERACAODIREITO AND');
            qry.Sql.Add('    (:pDATAAGE            =:pDATAAGE)                ');
            qry.ParamByName('P_IDOPERACAODIREITO').AsInteger := OperacaoDireito;
            qry.ParamByName('pDATAAGE').AsDate               := DataAGE;
            qry.Open;
         end;
      end;

      pnlDestino.Visible       := pnlDestino.Visible And (Not qry.IsEmpty);

      qryVALOREXERCIDO.Visible := False;
      qry.DisableControls;
      qry.First;
      while not qry.EOF Do
      begin

         If ((Qry.FieldByName('IDMOTIVOBLOQUEIO').AsInteger > 0)  And
             (QryOperacaoDireitoQTDEACOESDIRPROV.AsFloat <> 0)) Then
         begin
            Qry.Delete;
            //AL_6
            //Qry.Next;
            Continue;
         end;

         dtmAGE.qrySaldoCustodia.Close;
         dtmAGE.qrySaldoCustodia.ParamByName('IdCarteira').AsInteger     := qryIDCARTEIRAINVEST.AsInteger;
         dtmAGE.qrySaldoCustodia.ParamByName('IdInvestimento').AsInteger := qryIDINVESTIMENTO.AsInteger;
         dtmAGE.qrySaldoCustodia.ParamByName('IdLote').Clear;
         DataAGECons := DataAGE;
         If (Trim(qryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
         Begin
            DataAGECons := DataAGECons - 1;
            While not DiasUteisInv.DiaUtil(DataAGECons,-1,1,'',True,False,False) Do
                DataAGECons := DataAGECons - 1;   // Achar o dia útil anterior
         End;

         dtmAGE.qrySaldoCustodia.ParamByName('DataMov').AsDateTime         := DataAGECons;
         dtmAGE.qrySaldoCustodia.ParamByName('IDCUSTODIANTE').AsInteger    := qryIDCUSTODIANTE.AsInteger;
         dtmAGE.qrySaldoCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger := qryIDMOTIVOBLOQUEIO.AsInteger;
         dtmAGE.qrySaldoCustodia.ParamByName('IdCustodia').AsInteger       := high(integer);
         dtmAGE.qrySaldoCustodia.Open;

         //AL_6 Ini
         if ((qryIDMOTIVOBLOQUEIO.AsInteger = -1) and
             (dtmAGE.qrySaldoCustodiaSALDOLIBERADO.AsFloat = 0)) or
            ((qryIDMOTIVOBLOQUEIO.AsInteger > 0) and
             (dtmAGE.qrySaldoCustodiaSALDOBLOQUEADO.AsFloat = 0))  then
         begin
            Qry.Delete;
            Continue;
         end;
         //AL_6 Fim

         qryAcoesxBolsa.Close;
         qryAcoesxBolsa.ParamByName('IDINVESTIMENTO').AsInteger := qryIDINVESTIMENTO.AsInteger;
         qryAcoesxBolsa.Open;

         qry.Edit;
         qryIR.ReadOnly             := False;
         qryVLRLIQ.ReadOnly         := False;
         qryQTDE.ReadOnly           := False;
         qryQTDEDIREITO.ReadOnly    := False;
         qryDATAREFERENCIA.ReadOnly := False;
         qryVALOREXERCIDO.ReadOnly  := False;

         if qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat = 0 Then
         begin
            dbgOrigemDivJur.Visible := False;
            dbgOrigem.Visible       := True;

            if (qryIDMOTIVOBLOQUEIO.AsInteger = -1) then  // Está Bloqueado ?
                qryQTDE.AsFloat := dtmAGE.qrySaldoCustodiaSALDOLIBERADO.AsFloat   // Não
            else
                qryQTDE.AsFloat := dtmAGE.qrySaldoCustodiaSALDOBLOQUEADO.AsFloat; // Sim

         end
         else
         begin
            if (qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat -
                qryOperacaoDireitoQTDERECDIRPARC.AsFloat) > 0 Then
               qryQTDE.AsFloat     := (qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat-
                                       qryOperacaoDireitoQTDERECDIRPARC.AsFloat)
            else
               qryQTDE.AsFloat     :=  qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat;
         end;

         if (bQTDEDIREITO = False) then // primeira montagem
         begin
            //eRemuneracao := 0;
            if (RO.FLGPERC) And (RO.PERCENTUAL <> 0) then
            Begin
               //AL_3 - 19/08/2004 - RICARDO CRISTIANO
               qryQTDEDIREITO.AsFloat := qryQTDE.AsFloat;

               if (TipoOperacao  in [pRPI.IDTIPOOPERDIRBON]) Then
                  qryQTDEDIREITO.AsFloat := qryQTDE.AsFloat
               else if Not (TipoOperacao  in [pRPI.IDTIPOOPERDIRDES]) Then
                  qryQTDEDIREITO.AsFloat := OperComum.Round((qryQTDE.AsFloat * RO.PERCENTUAL) / 100,0);

               if (TipoOperacao  in [pRPI.IDTIPOOPERDIRREE]) Then
                  qryQTDE.AsFloat        := qryQTDE.AsFloat - qryQTDEDIREITO.AsFloat;
            end
            else
            begin
               if (TipoOperacao  in [pRPI.IDTIPOOPERDIRRES]) Then
                  qryQTDEDIREITO.AsFloat := OperComum.Trunca((qryQTDE.AsFloat * RO.PARIDADE),0)
               else
                  qryQTDEDIREITO.AsFloat := qryQTDE.AsFloat;
            end;
         end
         else  // qtd foi alterada
         begin
            if (qry.FieldByName('QTDEDIREITO').AsFloat <> fQTDEDIREITO) and
               (fQTDEDIREITO <> -1) then
            begin
               qryQTDEDIREITO.AsFloat    :=  fQTDEDIREITO;
               qryVLRREMUNERACAO.AsFloat := 0;
               fQTDEDIREITO              := -1;
            end;
         end;

         qryDATAREFERENCIA.AsDateTime    := qryOperacaoDireito.FieldByName('DATAEX').AsDateTime;

         qryOperacaoInvest.Close;
         qryOperacaoInvest.ParamByName('IDOPERACAODIREITO').Asinteger := wIdOperacaoDireito;
         qryOperacaoInvest.ParamByName('IDCARTEIRAINVEST').Asinteger  := qryIDCARTEIRAINVEST.AsInteger;
         qryOperacaoInvest.Open;

         if TipoOperacao In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR,
                             pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRMUL,
                             pRPI.IDTIPOOPERDIRREE] then
         begin
            qryVALOREXERCIDO.Visible     := True;

            QryLote.Close;
            QryLote.ParamByName('IDACAO').AsInteger := qryIDINVESTIMENTO.AsInteger;
            QryLote.Open;

            If (qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat = 0) Then
            Begin
               LblBoleta.Caption            := QryOperacaoInvestNUMDOCUMENTO.AsString;

               qryVLRREMUNERACAO.AsFloat    := QryOperacaoInvestVLRREMUNERACAO.AsFloat;

               If (Trim(qryOperacaoDireito.FieldByName('STATUS').AsString) <> '') And
                      ((qryQTDE.AsFloat - qryOperacaoDireitoQTDERECDIRPARC.AsFloat) = 0) Then
                   qryQTDEDIREITO.AsFloat   := QryOperacaoInvestQTDEOPERACAO.AsFloat;

               if (qryQTDE.AsFloat - qryOperacaoDireitoQTDERECDIRPARC.AsFloat) > 0 Then
                   qryQTDE.AsFloat    := qryQTDE.AsFloat - qryOperacaoDireitoQTDERECDIRPARC.AsFloat;

               qryQTDEDIREITO.AsFloat := qryQTDE.AsFloat;

            End;

            qryVALOREXERCIDO.AsFloat := 0;

            If qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat <> 0 Then
               qryVALOREXERCIDO.AsFloat    :=
                        OperComum.Round((qryQTDEDIREITO.AsFloat * RO.DIVPORACAO)-0.0049,2)

            Else If qryQTDEDIREITO.AsFloat <> 0 Then
               qryVALOREXERCIDO.AsFloat    :=
                        OperComum.Round((qryQTDEDIREITO.AsFloat *
                                OperComum.DivValorZero(RO.DIVPORACAO,
                                       QryLote.FieldByName('QTDELOTE').AsInteger))-0.0049,2)+
                                               QryOperacaoInvestVLRREMUNERACAO.AsFloat;

            fVlrRendimento := 0;
            if qryOperacaoDireitoISENCAOIR.AsString = 'N' then
               eIRExercido := Impostos.CalculaIr(0,
                                        qryIDINVESTIMENTO.AsInteger, 0{CARTEIRAGERENC},
                                        qryIDCARTEIRAINVEST.AsInteger,
                                        qryOperacaoDireitoIDTIPOOPERACAO.AsInteger,
                                        RO.IDMERCADO,
                                        qryIDLOTE.AsString,
                                        Date, Date,
                                        0,
                                        qryVALOREXERCIDO.AsFloat, 0, 'S',
                                        RO.FLGTRATAIR,
                                        fVlrRendimento);

            eIRExercido   := eIRExercido + QryOperacaoInvestVLRIRREMUNER.AsFloat;

            qryIR.AsFloat := eIRExercido;
            qryRENDIMENTO.AsFloat := fVlrRendimento;

            if qryOperacaoDireitoIRLITIGIO.AsString = 'S' then
               qryVLRLIQ.AsFloat := qryVALOREXERCIDO.AsFloat
            else
               qryVLRLIQ.AsFloat := qryVALOREXERCIDO.AsFloat-eIRExercido;

            If (Trim(qryOperacaoDireito.FieldByName('STATUS').AsString) <> '') And
                   ((qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat-
                     qryOperacaoDireitoQTDERECDIRPARC.AsFloat) = 0) then // se operação já lançada
            begin
               qryVALOREXERCIDO.AsFloat := QryOperacaoInvestVLROPERACAO.AsFloat;
               qryIR.AsFloat            := QryOperacaoInvestVLRIR.AsFloat;
               qryVLRLIQ.AsFloat        := (QryOperacaoInvestVLROPERACAO.AsFloat+
                                            QryOperacaoInvestVLRREMUNERACAO.AsFloat) -
                                                QryOperacaoInvestVLRIR.AsFloat;
            end;
         end;

         If TipoOperacao  in [pRPI.IDTIPOOPERDIRDES, pRPI.IDTIPOOPERDIRGRU,
                              pRPI.IDTIPOOPERDIRBON, pRPI.IDTIPOOPERDIRRES,
                              pRPI.IDTIPOOPERDIRINC, pRPI.IDTIPOOPERDIRPER,
                              pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRREE] Then
         begin
            qryIR.Visible                := False;
            qryVLRLIQ.Visible            := False;
            qryVLRREMUNERACAO.Visible    := False;
            qryVALOREXERCIDO.Visible     := False;
            qryVLRCUSTOATUAL.Visible     := False;
         end
         Else
         begin
            If TipoOperacao  In [pRPI.IDTIPOOPERDIRCIS] Then
            begin
               qryIR.Visible             := False;
               qryVLRLIQ.Visible         := False;
               qryQTDE.Visible           := False;
               qryVLRREMUNERACAO.Visible := False;
               qryVALOREXERCIDO.Visible  := False;
               qryVLRCUSTOATUAL.Visible  := True;
            end
            Else
            begin
               qryIR.Visible             := True;
               qryVLRLIQ.Visible         := True;
               qryQTDE.Visible           := True;
               qryVLRREMUNERACAO.Visible := True;
               qryVALOREXERCIDO.Visible  := True;
               qryVLRCUSTOATUAL.Visible  := False;
            end;
         end;

         wSaldoQtd:=0;
         If (Trim(qryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
         Begin
            //AL_1
            //AL_4
            OperComum.BuscaTodosSaldosInvestLote(
               qryIDCARTEIRAINVEST.AsInteger,
               0{IDCARTEIRAGERENC},
               qryIDINVESTIMENTO.AsInteger, high(integer),-1,
               qryIDLOTE.AsString,
               DateToStr(DataAGECons), -1,
               wSaldoQtd, wSaldoVlr, wSaldoInutil, wSaldoInutil, wSaldoAqui,
               wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
               wSaldoIRApu, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
               wSaldoCusto, wSaldoInutil, wSaldoInutil);
         End
         Else
         Begin
            //AL_1
            //AL_4
            OperComum.BuscaTodosSaldosInvestLote(
               qryIDCARTEIRAINVEST.AsInteger,
               0{IDCARTEIRAGERENC},
               qryIDINVESTIMENTO.AsInteger, high(integer), -1,
               qryIDLOTE.AsString,
               DateToStr(DataAGE), -1,
               wSaldoQtd, wSaldoVlr, wSaldoInutil, wSaldoInutil, wSaldoAqui,
               wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
               wSaldoIRApu, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoCusto,
               wSaldoInutil, wSaldoInutil);
         End;

         wSaldoAquiPrevisto := 0;
         wSaldoAquiDestino  := 0;
         wPuCusto           := 0;

         If (qryPERCENTUALINV.AsFloat <> 0) Then
         Begin
            wSaldoAquiPrevisto         := (wSaldoAqui*(qryPERCENTUALINV.AsFloat/100));
            wSaldoAquiDestino          := (wSaldoAqui - wSaldoAquiPrevisto);
            qryVLRCUSTO.ReadOnly       := False;
            qryVLRCUSTOATUAL.ReadOnly  := False;

            qryVLRCUSTO.AsFloat        := wSaldoAquiPrevisto;

            qryVLRCUSTOATUAL.AsFloat   := wSaldoAqui;
         End
         Else if (TipoOperacao  in [pRPI.IDTIPOOPERDIRREE]) Then
         Begin
            wPuCusto                   := OperComum.DivValorZero(wSaldoAqui,wSaldoQtd);
            qryVLRCUSTOATUAL.AsFloat   := OperComum.Round(qryQTDEDIREITO.AsFloat*wPuCusto,2);
         End;

         if ((TipoOperacao In [pRPI.IDTIPOOPERDIRRES]) And (RO.PERCENTUAL <> 0)) Then
         begin
            qryVLRCUSTOATUAL.ReadOnly := False;
            qryQTDE.AsFloat           := wSaldoQtd;
            qryVALOREXERCIDO.AsFloat  := wSaldoVlr;
            qryVLRCUSTOATUAL.AsFloat  := wSaldoAqui;
            qryIR.Visible             := False;
            qryVLRLIQ.Visible         := False;
            qryVLRREMUNERACAO.Visible := False;
            qrySGLCUSTODIANTE.Visible := False;
            qrySIGLAMOTBLOQ.Visible   := False;
            qryQTDEDIREITO.Visible    := False;
            qryVALOREXERCIDO.Visible  := True;
            qryVLRCUSTOATUAL.Visible  := True;
         end
         Else if ((TipoOperacao In [pRPI.IDTIPOOPERDIRRES, pRPI.IDTIPOOPERDIRALT]) And (RO.PARIDADE <> 0)) then
         begin
            qryVLRCUSTOATUAL.ReadOnly    := False;
            qryQTDE.AsFloat           := wSaldoQtd;
            qryVALOREXERCIDO.AsFloat  := wSaldoVlr;
            qryVLRCUSTOATUAL.AsFloat  := wSaldoAqui;
            qryIR.Visible             := False;
            qryVLRLIQ.Visible         := False;
            qryVLRREMUNERACAO.Visible := False;
            qrySGLCUSTODIANTE.Visible := False;
            qrySIGLAMOTBLOQ.Visible   := False;
            qryQTDEDIREITO.Visible    := True;
            qryVALOREXERCIDO.Visible  := True;
            qryVLRCUSTOATUAL.Visible  := True;
         end;

         qryIR.ReadOnly             := True;
         qryVLRLIQ.ReadOnly         := True;
         qryQTDE.ReadOnly           := True;
         qryQTDEDIREITO.ReadOnly    := False;
         qryDATAREFERENCIA.ReadOnly := True;
         qryVALOREXERCIDO.ReadOnly  := True;

         if (TipoOperacao  in [pRPI.IDTIPOOPERDIRREE]) Then
            qryVALOREXERCIDO.Visible   := True;

         qry.Post;

         If (TipoOperacao  in [pRPI.IDTIPOOPERDIRRES]) Then
            eAcumulado := eAcumulado + qryQTDEDIREITO.AsFloat
         Else
            eAcumulado := eAcumulado + OperComum.Trunca((qryQTDEDIREITO.AsFloat * RO.PARIDADE),0);

         wVlrTotOperacaoAnt := wVlrTotOperacaoAnt + qryVLRLIQ.AsFloat;
                      
         qry.Next;
      end;

      for I := 0 to Pred(qry.FieldCount) Do
      begin
         qry.Fields[I].ReadOnly := True;
         nCampo := ProcuraCampoPeloNome(dbgOrigem, qry.Fields[I].FieldName);
         if nCampo > 0 then
            dbgOrigem.Fields[nCampo].Visible := qry.Fields[I].Visible;
      end;

      if not (TipoOperacao in [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR,
                               pRPI.IDTIPOOPERDIRMUL])then
         AbreQueryDestino(TipoOperacao, OperacaoDireito, eAcumulado, DataAGE);

      if ((Trim(qryOperacaoDireito.FieldByName('STATUS').AsString) <> '') And
         ((qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat-
           qryOperacaoDireitoQTDERECDIRPARC.AsFloat) = 0))                Or
         ((Trim(qryOperacaoDireito.FieldByName('STATUS').AsString) <> '') And
         ((qryQTDEDIREITO.AsFloat - qryOperacaoDireitoQTDERECDIRPARC.AsFloat) = 0)) then // se operação já lançada
      begin
         edtDataEfetiva.Date := qryOperacaoInvest.FieldByName('DATAOPERACAO').AsDateTime;

         dbgOrigem.Color        := clSilver;
         dbgOrigem.Font.Color   := clGray;
         edtDataEfetiva.Color   := clSilver;
         edtDataEfetiva.Enabled := False;

         If iTipoOperacao  In [pRPI.IDTIPOOPERDIRBON, pRPI.IDTIPOOPERDIRGRU,
                               pRPI.IDTIPOOPERDIRCIS, pRPI.IDTIPOOPERDIRDES,
                               pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRINC,
                               pRPI.IDTIPOOPERDIRPER, pRPI.IDTIPOOPERDIRRES,
                               pRPI.IDTIPOOPERDIRALT, pRPI.IDTIPOOPERDIRREE] then
         Begin
            BtIncDet.Enabled      := False;
            BtAltDet.Enabled      := False;
            BtDelDet.Enabled      := False;
            dbgDestino.Color      := clSilver;
            dbgDestino.Font.Color := clGray;
         End;

         bbtnConfirmar.Enabled := False;
         bbtnCancelar.Enabled  := False;

      end
      Else
      Begin
         dbgOrigem.Color        := clWindow;
         dbgOrigem.Font.Color   := clWindowText;
         edtDataEfetiva.Color   := clWindow;
         edtDataEfetiva.Enabled := True;

         bbtnConfirmar.Enabled  := True;
         bbtnCancelar.Enabled   := True;

         If iTipoOperacao  In [pRPI.IDTIPOOPERDIRBON, pRPI.IDTIPOOPERDIRGRU,
                               pRPI.IDTIPOOPERDIRCIS, pRPI.IDTIPOOPERDIRDES,
                               pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRINC,
                               pRPI.IDTIPOOPERDIRPER, pRPI.IDTIPOOPERDIRRES,
                               pRPI.IDTIPOOPERDIRALT, pRPI.IDTIPOOPERDIRREE] then
         Begin
            BtIncDet.Enabled      := True;
            BtAltDet.Enabled      := True;
            BtDelDet.Enabled      := True;

            dbgDestino.Color      := clWindow;
            dbgDestino.Font.Color := clWindowText;
         End;
      End;

      qry.First;   // O First é necessário para o funcionamento do recalculo.

      if (Trim(qryOperacaoDireito.FieldByName('STATUS').AsString) <> '') And
             ((qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat-
               qryOperacaoDireitoQTDERECDIRPARC.AsFloat) = 0) then // se operação já lançada
      begin
         qryVLRLIQ.ReadOnly           := True;
         qryQTDEDIREITO.ReadOnly      := True;
         qryVLRREMUNERACAO.ReadOnly   := True;
         qryVLRIRREMUNERACAO.ReadOnly := True;
         qryIR.ReadOnly               := True;
      End
      Else
      Begin
         If ((TipoOperacao  In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR,
                                pRPI.IDTIPOOPERDIRMUL])) Then
             qryVLRLIQ.ReadOnly       := False;
         qryQTDEDIREITO.ReadOnly      := False;
         qryVALOREXERCIDO.ReadOnly    := False;
         qryVLRREMUNERACAO.ReadOnly   := False;
         qryVLRIRREMUNERACAO.ReadOnly := False;
         qryIR.ReadOnly               := False;
      End;

      bQTDEDIREITO := False;
      qry.First;
      while not qry.Eof do
      begin
         if qryQTDE.AsFloat > 0 then
         begin
            bQTDEDIREITO := True;
            qry.Next;
         end
         else
            qry.Delete;
      end;
      qry.FindFirst;

      if (qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat > 0) And
         (Trim(qryOperacaoDireito.FieldByName('STATUS').AsString) = '') Then
      begin
         QryOrigDivJur.Close;
         QryOrigDivJur.ParambyName('P_IDOPERACAODIREITO').Asinteger := OperacaoDireito;
         QryOrigDivJur.Open;
         if ((qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat -
              qryOperacaoDireitoQTDERECDIRPARC.AsFloat) = 0) Then
         begin
            Panel4.Caption               := Copy(lblTipoOperacao.Caption, POS('/',lblTipoOperacao.Caption)+1,Length(lblTipoOperacao.Caption));
            lblSigla.Visible             := False;
            LblBoleta.Visible            := False;
            lblTipoOperacao.Visible      := False;
            dbgOrigem.Visible            := False;
            dbgOrigemDivJur.Visible      := True;
            dbgOrigemDivJur.Color        := clSilver;
            dbgOrigemDivJur.Font.Color   := clGray;
         end
         else
         begin
            Panel4.Caption          := 'Origem';
            lblSigla.Visible        := True;
            LblBoleta.Visible       := True;
            lblTipoOperacao.Visible := True;
            dbgOrigem.Visible       := True;
            dbgOrigemDivJur.Visible := False;
         end;
      end;

   finally
      CalculandoOrigem := False;
      qry.EnableControls;
   end;
end;

Procedure TfrmCadOperAGE.AbreQueryDestino(TipoOperacao, OperacaoDireito : Integer;
                                          Acumulado : Extended; DataAGE : TDateTime);
Var
  I, nCampo : Integer;
  RO : TRegTipoOperacao;
  ListaDestino : TList;
  pDestino : PRegDestino;
  DataAGECons : TDateTime;
begin

  OperacaoInvest.RetParamOperDireito(OperacaoDireito, RO, qry.DatabaseName);
  RO.DIVPORACAO := qryOperacaoDireitoDIVPORACAO.AsFloat;

  qry.First;
  qryFilha.Close;
  qryFilha.ParamByName('P_IDOPERACAODIREITO').AsInteger := OperacaoDireito;
  qryFilha.Open;

  With DMRendaVariavel.QryVerInvestOrigDest Do
  begin
      Close;
      ParamByName('IDOPERACAODIREITO').AsInteger := OperacaoDireito;
      Open;
  end;    

  qryFilha.First;

  ListaDestino := TList.Create;
  Try
    while not qry.EOF Do
    begin
       if qryQTDEDIREITO.AsFloat <> 0 Then
       begin
          while not qryFilha.EOF Do
          begin
             dtmAGE.qrySaldoCustodia.Close;
             dtmAGE.qrySaldoCustodia.ParamByName('IdCarteira').AsInteger     := qryIDCARTEIRAINVEST.AsInteger;
             dtmAGE.qrySaldoCustodia.ParamByName('IdInvestimento').AsInteger := qryFilhaIDINVESTIMENTO.AsInteger;
             dtmAGE.qrySaldoCustodia.ParamByName('IdLote').AsString          := '';

             DataAGECons := DataAGE;

             If (Trim(qryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
             Begin
                DataAGECons := DataAGECons - 1;
                While not DiasUteisInv.DiaUtil(DataAGECons,-1,1,'',True,False,False) Do
                   DataAGECons := DataAGECons - 1;   // Achar o dia útil anterior
             End;

             dtmAGE.qrySaldoCustodia.ParamByName('DataMov').AsDateTime         :=
                                     DataAGECons;
             dtmAGE.qrySaldoCustodia.ParamByName('IDCUSTODIANTE').AsInteger    :=
                                     qryIDCUSTODIANTE.AsInteger;
             dtmAGE.qrySaldoCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger :=
                                     qryIDMOTIVOBLOQUEIO.AsInteger;
             dtmAGE.qrySaldoCustodia.ParamByName('IdCustodia').AsInteger       := high(integer);
             dtmAGE.qrySaldoCustodia.Open;

             pDestino := AllocMem(SizeOf(TRegDestino));

             pDestino^.IDINVESTIMENTO   := qryFilhaIDINVESTIMENTO.AsInteger;
             pDestino^.IDCARTEIRAINVEST := qryIDCARTEIRAINVEST.AsInteger;
             pDestino^.IDCUSTODIANTE    := qryIDCUSTODIANTE.AsInteger;
             pDestino^.IDMOTIVOBLOQUEIO := qryIDMOTIVOBLOQUEIO.AsInteger;
             pDestino^.IDLOTE           := qryIDLOTE.AsString;
             pDestino^.PERCENTUALINV    := qryFilhaPERCENTUALINV.AsFloat;
             pDestino^.VLRCUSTO         := qryVLRCUSTOATUAL.AsFloat;

             if (qryIDMOTIVOBLOQUEIO.AsInteger = -1) then  // Está Bloqueado ?
                 pDestino^.QTDE          := dtmAGE.qrySaldoCustodiaSALDOLIBERADO.AsFloat   // Não
             else
                 pDestino^.QTDE          := dtmAGE.qrySaldoCustodiaSALDOBLOQUEADO.AsFloat;  // Sim

             pDestino^.PERCCUSTO         := qryPERCENTUALINV.AsFloat;

             qryOperacaoInvest.Close;
             qryOperacaoInvest.ParamByName('IDOPERACAODIREITO').Asinteger := qryFilhaIDOPERACAODIREITO.AsInteger;
             qryOperacaoInvest.ParamByName('IDCARTEIRAINVEST').Asinteger  := qryIDCARTEIRAINVEST.AsInteger;
             qryOperacaoInvest.Open;

             if TipoOperacao = pRPI.IDTIPOOPERDIRCIS Then
             Begin
                QryOperacaoInvestDestino.Close;
                QryOperacaoInvestDestino.ParamByName('IDOPERACAOINVEST').Asinteger :=
                                         QryFilha.FieldByName('IDOPERACAOINVEST').AsInteger;
                QryOperacaoInvestDestino.Open;

                if (QryOperacaoInvestDestino.IsEmpty) Then
                begin
                   If QryOperacaoInvestDestinoQTDEOPERACAO.AsFloat <> 0 Then
                      pDestino^.QTDEDIREITO := QryOperacaoInvestDestinoQTDEOPERACAO.AsFloat
                   Else
                   Begin
                      pDestino^.QTDEDIREITO := qryQTDEDIREITO.AsFloat;

                      //Al_5 - Ricardo - 19/10/2004
                      if Not (DMRendaVariavel.QryVerInvestOrigDest.Locate('IDINVESTIMENTO',
                               qryFilha.FieldByName('IDINVESTIMENTO').AsInteger, [])) then
                         pDestino^.QTDEDIREITO := OperComum.Round(pDestino^.QTDEDIREITO*(pDestino^.PERCENTUALINV/100),0);
                   end;
                End
                Else
                   pDestino^.QTDEDIREITO    := QryOperacaoInvestDestino.FieldByName('QTDEOPERACAO').AsFloat;

                pDestino^.VLRCUSTO          := OperComum.Round(qryVLRCUSTOATUAL.AsFloat*(pDestino^.PERCENTUALINV/100),2);
                
                QryOperacaoInvestDestino.Close;
             End
             else
             begin
                //AL_3 - 19/08/2004 - RICARDO CRISTIANO
                pDestino^.QTDEDIREITO     := Acumulado;

                if (TipoOperacao  in [pRPI.IDTIPOOPERDIRBON,pRPI.IDTIPOOPERDIRSUB]) Then
                   pDestino^.QTDEDIREITO := OperComum.Round((qryQTDE.AsFloat * RO.PERCENTUAL) / 100,0)
                else if (TipoOperacao  = pRPI.IDTIPOOPERDIRDES) Then
                   pDestino^.QTDEDIREITO := OperComum.Round((pDestino^.QTDEDIREITO * RO.PERCENTUAL) / 100,0)
                //AL_5 - Ricardo - 05/10/2004
                else if (TipoOperacao  = pRPI.IDTIPOOPERDIRRES) And (RO.PARIDADE <> 0) Then
                   pDestino^.QTDEDIREITO := OperComum.Round((pDestino^.QTDEDIREITO * RO.PARIDADE),0);
             end;

             if (TipoOperacao  in [pRPI.IDTIPOOPERDIRREE]) Then
             begin
                pDestino^.QTDEDIREITO := qryQTDEDIREITO.AsFloat;
                pDestino^.QTDE        := pDestino^.QTDEDIREITO;
                pDestino^.VLRCUSTO    := OperComum.Round(pDestino^.QTDEDIREITO*wPuCusto,2);
             end;

             QryBuscaInvestimento.Close;
             QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger := qryFilhaIDINVESTIMENTO.AsInteger;
             QryBuscaInvestimento.Open;

             //AL_5 - Ricardo - 05/10/2004
             if (TipoOperacao IN [pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRREE, pRPI.IDTIPOOPERDIRRES]) and (RO.DIVPORACAO <> 0) Then
                pDestino^.VALOREXERCIDO      :=
                        OperComum.Round((OperComum.DivValorZero(pDestino^.QTDEDIREITO,
                                         QryBuscaInvestimento.FieldByName('QTDELOTE').AsInteger))*
                                         RO.DIVPORACAO,2);

             If (Trim(qryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
             Begin
                if TipoOperacao <> pRPI.IDTIPOOPERDIRCIS Then
                begin
                   pDestino^.QTDEDIREITO        := QryOperacaoInvestQTDEOPERACAO.AsFloat;
                   pDestino^.VALOREXERCIDO      := QryOperacaoInvestVLROPERACAO.AsFloat;
                end;   
             End;

             ListaDestino.Add(pDestino);
             qryFilha.Next;
          end;
       end;
//       if TipoOperacao <> pRPI.IDTIPOOPERDIRCIS Then
//          Break;
       qry.Next;
    end;

    qryFilha.First;

    qryFilhaVLRCUSTO.Visible      := Not (TipoOperacao in [pRPI.IDTIPOOPERDIRREE]);
    qryFilhaIDLOTE.Visible        := Not (TipoOperacao in [pRPI.IDTIPOOPERDIRDES,pRPI.IDTIPOOPERDIRGRU,
                                          pRPI.IDTIPOOPERDIRINC,pRPI.IDTIPOOPERDIRPER]);
    qryFilhaQTDENOVA.Visible      := (TipoOperacao in [pRPI.IDTIPOOPERDIRDES,pRPI.IDTIPOOPERDIRGRU,
                                          pRPI.IDTIPOOPERDIRINC,pRPI.IDTIPOOPERDIRPER]);
    qryFilhaVALOREXERCIDO.Visible := (TipoOperacao in [pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRREE]);
    qryFilhaPERCCUSTO.Visible     := (TipoOperacao in [pRPI.IDTIPOOPERDIRCIS]);

    For I := 0 to Pred(qryFilha.FieldCount) Do
      qryFilha.Fields[I].ReadOnly := False;

    OperacaoInvest.RetParamOperDireito(OperacaoDireito, RO, qry.DatabaseName);
    CalculandoDestino := True;
    qryFilha.DisableControls;
    Try

      while not qryFilha.IsEmpty do
        qryFilha.Delete;

      for I := 0 to Pred(ListaDestino.Count) do
      begin
        pDestino := ListaDestino.Items[I];

        qryFilha.Append;
        qryFilhaIDINVESTIMENTO.AsInteger   := pDestino^.IDINVESTIMENTO;
        qryFilhaIDCARTEIRAINVEST.AsInteger := pDestino^.IDCARTEIRAINVEST;
        qryFilhaIDCUSTODIANTE.AsInteger    := pDestino^.IDCUSTODIANTE;
        qryFilhaIDMOTIVOBLOQUEIO.AsInteger := pDestino^.IDMOTIVOBLOQUEIO;
        qryFilhaIDLOTE.AsString            := pDestino^.IDLOTE;
        qryFilhaQTDEDIREITO.AsFloat        := pDestino^.QTDEDIREITO;

        If TipoOperacao = pRPI.IDTIPOOPERDIRGRU Then
           qryFilhaQTDENOVA.AsFloat   := pDestino^.QTDEDIREITO
        Else
           qryFilhaQTDENOVA.AsFloat   := pDestino^.QTDEDIREITO + pDestino^.QTDE;

        qryFilhaVALOREXERCIDO.AsFloat := pDestino^.VALOREXERCIDO;

        If (TipoOperacao  in [pRPI.IDTIPOOPERDIRREE]) Then
           qryFilhaVLRCUSTO.AsFloat   := pDestino^.VLRCUSTO
        Else If ((wSaldoAquiDestino <> 0) And (TipoOperacao  <> pRPI.IDTIPOOPERDIRCIS)) Then
           qryFilhaVLRCUSTO.AsFloat   := wSaldoAquiDestino
        Else If (TipoOperacao  <> pRPI.IDTIPOOPERDIRCIS) Then
           qryFilhaVLRCUSTO.AsFloat   := OperComum.Round(qryVLRCUSTOATUAL.AsFloat*(pDestino^.PERCENTUALINV/100),2)
        Else If (TipoOperacao  In [pRPI.IDTIPOOPERDIRCIS]) Then
           qryFilhaVLRCUSTO.AsFloat   := pDestino^.VLRCUSTO;

        //AL_5 - Ricardo - 05/10/2004
        If (TipoOperacao in [pRPI.IDTIPOOPERDIRRES, pRPI.IDTIPOOPERDIRALT]) And (RO.PERCENTUAL <> 0) Then
        Begin
           qryFilhaVLRCUSTO.AsFloat      := OperComum.Round(qryVLRCUSTOATUAL.AsFloat*(RO.PERCENTUAL/100),2);
           qryFilhaVALOREXERCIDO.AsFloat := OperComum.Round(pDestino^.VALOREXERCIDO*(RO.PERCENTUAL/100),2);
        End
        Else If (TipoOperacao in [pRPI.IDTIPOOPERDIRRES, pRPI.IDTIPOOPERDIRALT]) And (RO.PARIDADE <> 0) Then
        Begin
           qryFilhaVLRCUSTO.AsFloat      := OperComum.Round(qryVLRCUSTOATUAL.AsFloat*RO.PARIDADE,2);
           qryFilhaVALOREXERCIDO.AsFloat := OperComum.Round(pDestino^.VALOREXERCIDO*RO.PARIDADE,2);
        End;

        qryFilhaPERCENTUALINV.AsFloat := pDestino^.PERCENTUALINV;

        qryFilha.Post;
      end;

      For I := 0 to Pred(qryFilha.FieldCount) Do
      Begin
        qryFilha.Fields[I].ReadOnly := True;
        nCampo := ProcuraCampoPeloNome(dbgDestino, qryFilha.Fields[I].FieldName);
        If nCampo > 0 Then
           dbgDestino.Fields[nCampo].Visible := qryFilha.Fields[I].Visible;

        If TipoOperacao = pRPI.IDTIPOOPERDIRCIS Then
        Begin
           If qryFilha.Fields[I].FieldName = 'PERCCUSTO' Then
              dbgDestino.Fields[nCampo].Visible := False;
        End;
      End;

      qryFilhaVLRCUSTO.ReadOnly         := False;
      qryFilhaIDCARTEIRAINVEST.ReadOnly := False;
      qryFilhaIDCUSTODIANTE.ReadOnly    := False;
      qryFilhaIDMOTIVOBLOQUEIO.ReadOnly := False;
      qryFilhaIDLOTE.ReadOnly           := False;

      If TipoOperacao = pRPI.IDTIPOOPERDIRBON then
      Begin
        qryFilhaQTDEDIREITO.ReadOnly := False;
      End;
      If TipoOperacao = pRPI.IDTIPOOPERDIRDIV then
      Begin
        qryFilhaQTDEDIREITO.ReadOnly := False;
      End;
      If TipoOperacao = pRPI.IDTIPOOPERDIRMUL then
      Begin
        qryFilhaQTDEDIREITO.ReadOnly := False;
      End;
      If TipoOperacao = pRPI.IDTIPOOPERDIRSUB then
      Begin
        qryFilhaQTDEDIREITO.ReadOnly   := False;
        qryFilhaVALOREXERCIDO.ReadOnly := False;
      End;
      //AL_5 - Ricardo - 05/10/2004      
      If (TipoOperacao IN [pRPI.IDTIPOOPERDIRREE, pRPI.IDTIPOOPERDIRRES]) then
      Begin
        qryFilhaQTDEDIREITO.ReadOnly   := False;
        qryFilhaVALOREXERCIDO.ReadOnly := False;
      End;
      If TipoOperacao = pRPI.IDTIPOOPERDIRJUR then
      Begin
        qryFilhaQTDEDIREITO.ReadOnly := False;
      End;
      If TipoOperacao = pRPI.IDTIPOOPERDIRCIS then
      Begin
        qryFilhaQTDEDIREITO.ReadOnly := False;
        qryFilhaPERCCUSTO.ReadOnly   := False;
      End;
      If TipoOperacao = pRPI.IDTIPOOPERDIRGRU then
      Begin
        qryFilhaQTDEDIREITO.ReadOnly := False;
      End;
      If TipoOperacao = pRPI.IDTIPOOPERDIRINC then
      Begin
        qryFilhaQTDEDIREITO.ReadOnly := False;
      End;
      If TipoOperacao in [pRPI.IDTIPOOPERDIRDES,pRPI.IDTIPOOPERDIRGRU] then
      Begin
        qryFilhaQTDEDIREITO.ReadOnly := False;
      End;
      If TipoOperacao = pRPI.IDTIPOOPERDIRPER then
      Begin
        qryFilhaQTDEDIREITO.ReadOnly := False;
      End;

      if ((TipoOperacao In [pRPI.IDTIPOOPERDIRRES]) And (RO.PERCENTUAL <> 0)) then
      begin
         qryFilhaIDLOTE.Visible        := False;
         qryFilhaQTDEDIREITO.Visible   := False;
         qryFilhaQTDENOVA.Visible      := False;
         qryFilhaVALOREXERCIDO.Visible := True;
         qryFilhaVLRCUSTO.Visible      := True;
      end
      Else if ((TipoOperacao In [pRPI.IDTIPOOPERDIRRES]))  then
      Begin
         qryFilhaIDLOTE.Visible        := False;
         qryFilhaQTDENOVA.Visible      := False;
         qryFilhaQTDEDIREITO.Visible   := True;
         qryFilhaVALOREXERCIDO.Visible := True;
         qryFilhaVLRCUSTO.Visible      := True;
      End;

      lbDistribuido.Caption := FormatFloat(FMT_NUM_DUAS_CASAS, Acumulado);
      lbAdistribuir.Caption := FormatFloat(FMT_NUM_DUAS_CASAS, Acumulado);
    Finally
      CalculandoDestino := False;
      qryFilha.EnableControls;
    End;
  finally
    // Libera a lista de ponteiros
    for I := 0 to Pred(ListaDestino.Count) do
    begin
       pDestino := ListaDestino.Items[I];
       FreeMem(pDestino, SizeOf(TRegDestino));
    end;
    ListaDestino.Clear;
    ListaDestino.Free;
  end;
end;


procedure TfrmCadOperAGE.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  pnlfundo.enabled := True;
end;

procedure TfrmCadOperAGE.FormCreate(Sender: TObject);
begin
  inherited;
  lblDataAGE.Caption      := '';
  lblSigla.Caption        := '';
  lblTipoOperacao.Caption := '';
  LblBoleta.Caption       := '';
  CalculandoOrigem        := False;
  CalculandoDestino       := False;
end;

Function TfrmCadOperAGE.ProcuraCampoPeloNome(Grid : TwwDbGrid; NomeCampo : String) : Integer;
Var
  I : Integer;
begin
  result := -1;
  For I := 0 To Pred(Grid.FieldCount) Do
    If Grid.Fields[I].FieldName = NomeCampo Then
    Begin
       result := I;
       Break;
    End;
end;

Procedure TfrmCadOperAGE.QTDMudou(QTD : String; ValorAntigo : Extended);
Var
  RO : TRegTipoOperacao;
  ValorTemp : Extended;
begin
  qryAcoesxBolsa.Close;
  qryAcoesxBolsa.ParamByName('IDINVESTIMENTO').AsInteger := qryIDINVESTIMENTO.AsInteger;
  qryAcoesxBolsa.Open;

  OperacaoInvest.RetParamOperDireito(Qry.ParamByname('P_IDOPERACAODIREITO').AsInteger, RO, qry.DatabaseName);

  If RO.FLGPERC Then
     ValorTemp := (StrToFloat(QTD) * RO.PERCENTUAL) / 100
  Else
     ValorTemp := StrToFloat(QTD);

  QTDDIREITOMudou(FloatToStr(ValorTemp), qryQTDEDIREITO.AsFloat);

  If StrToInt(MontaSelect.ValoresChave[2]) In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL] Then
     Begin
       If qryAcoesxBolsaQTDELOTE.AsFloat <> 0 Then
          qryVALOREXERCIDO.AsFloat := (qryQTDEDIREITO.AsFloat * RO.DIVPORACAO) / qryAcoesxBolsaQTDELOTE.AsFloat
       Else
         qryVALOREXERCIDO.AsFloat := 0;
     End;
end;


Procedure TfrmCadOperAGE.QTDDIREITOMudou(QTDDIREITO : String; ValorAntigo : Extended);
Var
  RO : TRegTipoOperacao;
  ValorTemp : Extended;
begin
  qryAcoesxBolsa.Close;
  qryAcoesxBolsa.ParamByName('IDINVESTIMENTO').AsInteger := qryIDINVESTIMENTO.AsInteger;
  qryAcoesxBolsa.Open;

  qryQTDEDIREITO.AsFloat := StrToFloat(QTDDIREITO);
  OperacaoInvest.RetParamOperDireito(qry.ParamByName('P_IDOPERACAODIREITO').AsInteger, RO, qry.DatabaseName);


  If StrToInt(MontaSelect.ValoresChave[2]) IN [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL] Then
  Begin
     If qryAcoesxBolsaQTDELOTE.AsFloat <> 0 Then
        qryVALOREXERCIDO.AsFloat := (StrToFloat(QTDDIREITO) * RO.DIVPORACAO) / qryAcoesxBolsaQTDELOTE.AsFloat
     Else
        qryVALOREXERCIDO.AsFloat := 0;
  End;
end;

procedure TfrmCadOperAGE.dbgDestinoEnter(Sender: TObject);
begin
   If iTipoOperacao = 0 Then
     Exit;
end;

procedure TfrmCadOperAGE.qryFilhaQTDEDIREITOSetText(Sender: TField;
  const Text: String);
Var
  eValorAntigo : Extended;
begin
  qryFilhaQTDEDIREITO.AsFloat := OperComum.Trunca(qryFilhaQTDEDIREITO.AsFloat,0); 
  If Sender = qryFilhaQTDEDIREITO Then
     If qryFilha.State = dsInsert Then
     Begin
        qryFilhaQTDEDIREITO.AsFloat := StrToFloat(Text);
     End
     Else If qryFilhaQTDEDIREITO.NewValue <> Text Then
     Begin
        eValorAntigo                := qryFilhaQTDEDIREITO.NewValue;
        qryFilhaQTDEDIREITO.AsFloat := StrToFloat(Text);
        qryFilhaQTDENOVA.ReadOnly   := False;
        qryFilhaQTDENOVA.AsFloat    := qryFilhaQTDENOVA.AsFloat+(StrToFloat(Text)-eValorAntigo);
        qryFilhaQTDENOVA.ReadOnly   := True;
     End;


     if (iTipoOperacao in [pRPI.IDTIPOOPERDIRREE]) Then
        qryFilhaVLRCUSTO.AsFloat    := OperComum.Round(qryFilhaQTDEDIREITO.AsFloat*wPuCusto,2);

     if (iTipoOperacao IN [pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRRES, 
                           pRPI.IDTIPOOPERDIRREE]) And (RO.DIVPORACAO <> 0) Then
        qryFilhaVALOREXERCIDO.AsFloat  := OperComum.DivValorZero(qryFilhaQTDEDIREITO.AsFloat,
                                                    QryBuscaInvestimento.FieldByName('QTDELOTE').AsInteger)*
                                                   (RO.DIVPORACAO);
  dbgOrigem.Refresh;
  ProcessaLabels;
end;

procedure TfrmCadOperAGE.BtIncDetClick(Sender: TObject);
Var
  Novo : Boolean;
  Investimento, Carteira, Custodiante, Bloqueio : Longint;
  Lote : String;
begin
  Novo := False;
  Investimento:= 0;
  Carteira    := 0;
  Custodiante := 0;
  Bloqueio    := 0;
  Lote        := '';

  If (BtIncDet.Down) and (Not qryFilha.IsEmpty) Then
     Begin
       Novo := True;
       Investimento := qryFilhaIDINVESTIMENTO.AsInteger;
       Carteira     := qryFilhaIDCARTEIRAINVEST.AsInteger;
       Custodiante  := qryFilhaIDCUSTODIANTE.AsInteger;
       Bloqueio     := qryFilhaIDMOTIVOBLOQUEIO.AsInteger;
       Lote         := qryFilhaIDLOTE.AsString;
     End;

  qryFilha.Append;

  If Novo Then
  Begin
    qryFilhaIDINVESTIMENTO.AsInteger   := Investimento;
    qryFilhaIDCARTEIRAINVEST.AsInteger := Carteira;
    qryFilhaIDCUSTODIANTE.AsInteger    := Custodiante;
    qryFilhaIDMOTIVOBLOQUEIO.AsInteger := Bloqueio;
    qryFilhaIDLOTE.AsString            := Lote;
    qryFilhaQTDEDIREITO.AsFloat        := 0;
    If qryFilhaVALOREXERCIDO.visible Then
       qryFilhaVALOREXERCIDO.AsFloat := 0;
  End;

end;

procedure TfrmCadOperAGE.dtsFilhaStateChange(Sender: TObject);
Var
  I : Integer;
begin
  qryFilhaIDINVESTIMENTO.ReadOnly :=  (qryFilha.State in [dsEdit]);
  qryFilhaDESCINVESTIMENTO.ReadOnly :=  (qryFilha.State in [dsEdit]);

  BtAltDet.Down := (qryFilha.State = dsEdit);

  If qryFilha.State in [dsInsert, dsEdit] Then
     dbgDestino.Options := dbgDestino.Options + [TwwDBgridOption(dgEditing)]
  Else
     dbgDestino.Options := dbgDestino.Options - [TwwDBgridOption(dgEditing)];
end;

procedure TfrmCadOperAGE.dtsFilhaDataChange(Sender: TObject;
  Field: TField);
begin
  btIncDet.Enabled :=  qryFilha.State = dsBrowse;
  BtAltDet.Enabled := (qryFilha.State = dsBrowse) And (Not qryFilha.IsEmpty);
  BtDelDet.Enabled := (qryFilha.State = dsBrowse) And (Not qryFilha.IsEmpty);
  BtCancDet.Enabled := (qryFilha.State  in [dsInsert, dsEdit]);
  BtOkDet.Enabled := (qryFilha.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadOperAGE.BtOkDetClick(Sender: TObject);
Var
  Novo : Boolean;
  Investimento, Carteira, Custodiante, Bloqueio : Longint;
  Lote : String;
begin
  Novo := False;
  Investimento:= 0;
  Carteira    := 0;
  Custodiante := 0;
  Bloqueio    := 0;
  Lote        := '';

  If (BtIncDet.Down) and (qryFilha.State = dsInsert) Then
  Begin
    Novo := True;
    Investimento := qryFilhaIDINVESTIMENTO.AsInteger;
    Carteira     := qryFilhaIDCARTEIRAINVEST.AsInteger;
    Custodiante  := qryFilhaIDCUSTODIANTE.AsInteger;
    Bloqueio     := qryFilhaIDMOTIVOBLOQUEIO.AsInteger;
    Lote         := qryFilhaIDLOTE.AsString;
  End;

  // Caso o Usuário não selecione nenhum tipo de bloqueio
  if Bloqueio = 0 then
  begin
     qryFilhaIDMOTIVOBLOQUEIO.AsInteger := -1;
     Bloqueio := -1;
  end;

  qryFilha.Post;

  If Novo Then
    Begin
      qryFilha.Append;
      qryFilhaIDINVESTIMENTO.AsInteger   := Investimento;
      qryFilhaIDCARTEIRAINVEST.AsInteger := Carteira;
      qryFilhaIDCUSTODIANTE.AsInteger    := Custodiante;
      qryFilhaIDMOTIVOBLOQUEIO.AsInteger := Bloqueio;
      qryFilhaIDLOTE.AsString            := Lote;
      qryFilhaQTDEDIREITO.AsFloat        := 0;
      if qryFilhaVALOREXERCIDO.ReadOnly then
      begin
         qryFilhaVALOREXERCIDO.ReadOnly := False;
         qryFilhaVALOREXERCIDO.AsFloat  := 0;
         qryFilhaVALOREXERCIDO.ReadOnly := True;
      end else
         qryFilhaVALOREXERCIDO.AsFloat  := 0;
    End;
  qryFilhaQTDEDIREITO.DisplayFormat     := '###,###,###,###,###';
  qryFilhaQTDENOVA.DisplayFormat        := '###,###,###,###,###';
  dbgDestino.SetFocus;
end;

procedure TfrmCadOperAGE.BtCancDetClick(Sender: TObject);
begin
  BtIncDet.Down := False;
  qryFilha.Cancel;
  qryFilhaQTDEDIREITO.DisplayFormat := '###,###,###,###,###';
  qryFilhaQTDENOVA.DisplayFormat    := '###,###,###,###,###';
  dbgDestino.SetFocus;
end;

procedure TfrmCadOperAGE.BtAltDetClick(Sender: TObject);
begin
  qryFilha.Edit;
  qryFilhaQTDEDIREITO.DisplayFormat := '';
  qryFilhaQTDENOVA.DisplayFormat    := '';
end;

procedure TfrmCadOperAGE.BtDelDetClick(Sender: TObject);
begin
  If Application.MessageBox('Deseja Realmente excluir esse destino ?', 'Confirmação', MB_YESNO) = IDYES Then
  Begin
     lbDistribuido.Caption := FormatFloat(FMT_NUM_DUAS_CASAS, StrToFloat(OperComum.StripChar(lbDistribuido.Caption, '.'))  - qryFilhaQTDEDIREITO.AsFloat);
     qryFilha.Delete;
  End;
  BtDelDet.Down := False;
end;

procedure TfrmCadOperAGE.dbgDestinoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = Chr(VK_TAB) Then
    Begin
      Key := #00;
      BtOkDet.SetFocus;
    End;
end;

procedure TfrmCadOperAGE.dbgDestinoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key Of
    VK_TAB: Key := 0;
    38, 40:
      If (TwwDBgridOption(dgEditing) in dbgDestino.Options) and
         (qryFilha.State In [dsInsert, dsEdit]) Then
          Key := 0;
  End;
end;

procedure TfrmCadOperAGE.dbgOrigemEnter(Sender: TObject);
begin
  lbDistribuido.Visible := False;
  lbAdistribuir.Visible := False;
  Label4.Visible        := False;
  Label5.Visible        := False;
end;

Procedure TfrmCadOperAGE.RecalculaOrigem;
Var
  Investimento, Carteira, Custodiante, Bloqueio, Lote : String;
  Total : Extended;
begin
  Total := 0;
  Investimento := qryIDINVESTIMENTO.AsString;
  Carteira     := qryIDCARTEIRAINVEST.AsString;
  Custodiante  := qryIDCUSTODIANTE.AsString;
  Bloqueio     := qryIDMOTIVOBLOQUEIO.AsString;
  Lote         := qryIDLOTE.AsString;
  qry.DisableControls;
  Try
    qry.First;
    While Not qry.EOF Do
      Begin
        Total := Total + qryQTDEDIREITO.AsFloat;
        qry.Next;
      End;

    qry.Locate('IDINVESTIMENTO;IDCARTEIRAINVEST;IDCUSTODIANTE;IDMOTIVOBLOQUEIO;IDLOTE',
               VarArrayOf([Investimento, Carteira, Custodiante,  Bloqueio, Lote]),
                [loCaseInsensitive]);

    AbreQueryDestino(
    qryOperacaoDireito.FieldByName('IDTIPOOPERACAO').AsInteger,
      qry.ParamByName('P_IDOPERACAODIREITO').AsInteger, Total, qryDATAREFERENCIA.AsDateTime);

  Finally
    qry.EnableControls;
  End;
end;

Procedure TfrmCadOperAGE.RecalculaDestino;
Var
  Investimento, Carteira, Custodiante, Bloqueio, Lote : String;
  Total : Extended;
begin
  Total := 0;
  Investimento := qryFilhaIDINVESTIMENTO.AsString;
  Carteira     := qryFilhaIDCARTEIRAINVEST.AsString;
  Custodiante  := qryFilhaIDCUSTODIANTE.AsString;
  Bloqueio     := qryFilhaIDMOTIVOBLOQUEIO.AsString;
  Lote         := qryFilhaIDLOTE.AsString;
  qryFilha.DisableControls;
  Try
    qryFilha.First;
    While Not qryFilha.EOF Do
      Begin
        Total := Total + qryFilhaQTDEDIREITO.AsFloat;
        qryFilha.Next;
      End;

    qryFilha.Locate('IDINVESTIMENTO;IDCARTEIRAINVEST;IDCUSTODIANTE;IDMOTIVOBLOQUEIO;IDLOTE',
               VarArrayOf([Investimento, Carteira, Custodiante,  Bloqueio, Lote]),
                [loCaseInsensitive]);

  lbDistribuido.Caption := FormatFloat(FMT_NUM_DUAS_CASAS, Total);
  Finally
    qryFilha.EnableControls;
  End;
end;

procedure TfrmCadOperAGE.qryAfterPost(DataSet: TDataSet);
begin
  If Not CalculandoOrigem Then {Evita a recursão}
     RecalculaOrigem;
  ProcessaLabels;
end;

procedure TfrmCadOperAGE.qryFilhaAfterPost(DataSet: TDataSet);
begin
  If Not CalculandoDestino Then {Evita a recursão}
     RecalculaDestino;
  ProcessaLabels;
end;

procedure TfrmCadOperAGE.bbtnConfirmarClick(Sender: TObject);
Var
   fQtdDireito : Double;
begin
   // AL_12 - Inicio
   fQtdDireito := 0;
   If  (edtDataEfetiva.Date < qryOperacaoDireitoDATAEX.AsDateTime) Then
   Begin
      MsgDlg('Data Prevista menor que a Data Base.','Mensagem do Sistema',mtWarning,[mbOk],0);
      if edtDataEfetiva.CanFocus then
         edtDataEfetiva.SetFocus;
      Exit;
   End;
   if edtDataEfetiva.Visible then
   begin
      if Trim(edtDataEfetiva.Text) = '' then
      begin
         MsgDlg('Data de Recebimento não preenchida.','Mensagem do Sistema',mtWarning,[mbOk],0);
         if edtDataEfetiva.CanFocus then
            edtDataEfetiva.SetFocus;
         Exit;
      end;
   end
   else
      Exit;

   // Testa o período contábil
   if not CtrlInvContab.TestaPeriodo(edtDataEfetiva.Text) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if edtDataEfetiva.CanFocus then
         edtDataEfetiva.SetFocus;
      Exit;
   end;
   // AL_12 - Fim

   qry.DisableControls;
   qryFilha.DisableControls;

   wQtdCotaini := pRPI.VLRCOTAINICART;
   dDataBase   := qryOperacaoDireitoDATAEX.AsDateTime;
   dDataAGE    := qryDATAREFERENCIA.AsDateTime;

   with QryBuscaTipoOper do
   begin   // Ana: Buscar essa query de FProcOperacao
      Close;
      ParamByName('TIPOOPERACAO').asInteger := iTipoOperacao;   // Ana: Alimentado a partir do MontaSelect
      Open;
   end;
   // Dados do Investimento
   with QryBuscaInvestimento do
   begin
      Close;
      ParamByName('IDINVESTIMENTO').AsInteger := qryIDINVESTIMENTO.AsInteger;
      Open;
   end;
   // Tratamento de Dividendos e Juros de Capital
   if iTipoOperacao  In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL] then
   begin
      if not ProcDivJurCap then
      begin
         If (Not bVerFormAge) Then
             bbtnSairClick(Sender);
         Exit;
      end;
   end
   // Tratamento de Bonificação
   else if iTipoOperacao = pRPI.IDTIPOOPERDIRBON then
   begin
      if not ProcBonificacao then
         Exit;
   end
   // Tratamento de Cisão
   else if iTipoOperacao = pRPI.IDTIPOOPERDIRCIS then
   begin
      if not ProcCisao then
         Exit;
   end
   // Tratamento da Subscricao
   else if iTipoOperacao = pRPI.IDTIPOOPERDIRSUB then
   begin
      if not ProcSubscricao then
         Exit;
   end
   // Tratamento da Desdobramento
   else if iTipoOperacao = pRPI.IDTIPOOPERDIRDES then
   begin
      if not ProcDesdobramento then
         Exit;
   end
   // Tratamento da Grupamento
   else if iTipoOperacao = pRPI.IDTIPOOPERDIRGRU then
   begin
      if not ProcGrupamento then
         Exit;
   end
   // Tratamento da Incorporação, Permulta, Alteração do tipo
   else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRINC, pRPI.IDTIPOOPERDIRPER, pRPI.IDTIPOOPERDIRALT] then
   begin
      if not ProcIncorporacao then
         Exit;
   end
   else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRRES] then
   begin
      if not ProcRestituicaoCap then
         Exit;
   end
   else if (iTipoOperacao  in [pRPI.IDTIPOOPERDIRREE]) Then
   begin
      if not ProcReorganizacao then
         Exit;
   end;

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   qry.DisableControls;
   qry.First;
   While Not qry.Eof Do
   begin
      fQtdDireito := fQtdDireito+qryQTDEDIREITO.AsFloat;
      qry.Next;
   end;
   qry.First;
   
   qryUpdOperacaoDireitoQtd.Close;
   qryUpdOperacaoDireitoQtd.ParambyName('QTDDIREITO').AsFloat        := fQtdDireito;
   qryUpdOperacaoDireitoQtd.ParambyName('IDOPERACAODIREITO').AsFloat := wIdOperacaoDireito;
   qryUpdOperacaoDireitoQtd.ExecSQL;

   qry.DisableControls;

   dtmBaseDados.dbBaseDados.Commit;

   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;

   qryOperacaoDireito.Close;
   qryOperacaoDireito.Open;

   if (Trim(qryOperacaoDireito.FieldByName('STATUS').AsString) <> '') then // se operação já lançada
   begin
      If bVerFormAge Then
      Begin
         frmCadAGE.sbtnAlterar.Enabled:= False;
         frmCadAGE.sbtnApagar.Enabled := False;
      End;
      qryVLRLIQ.ReadOnly           := True;
      qryQTDEDIREITO.ReadOnly      := True;
      qryVLRREMUNERACAO.ReadOnly   := True;
      qryVLRIRREMUNERACAO.ReadOnly := True;
      qryIR.ReadOnly               := True;
   End
   Else
   Begin
      If (bVerFormAge = True) Then
      Begin
         frmCadAGE.sbtnAlterar.Enabled:= True;
         frmCadAGE.sbtnApagar.Enabled := True;
      End;
      If ((iTipoOperacao  In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL])) Then
         qryVLRLIQ.ReadOnly           := False;
      qryQTDEDIREITO.ReadOnly         := False;
      qryVLRREMUNERACAO.ReadOnly      := False;
      qryVLRIRREMUNERACAO.ReadOnly    := False;
      qryIR.ReadOnly                  := False;
   End;

   dbgOrigem.Color       := clSilver;
   dbgOrigem.Font.Color  := clGray;
   edtDataEfetiva.Color  := clSilver;
   edtDataEfetiva.Enabled:= False;

   if iTipoOperacao  In [pRPI.IDTIPOOPERDIRBON, pRPI.IDTIPOOPERDIRGRU, pRPI.IDTIPOOPERDIRCIS,
      pRPI.IDTIPOOPERDIRDES, pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRINC, pRPI.IDTIPOOPERDIRPER,
      pRPI.IDTIPOOPERDIRRES, pRPI.IDTIPOOPERDIRALT, pRPI.IDTIPOOPERDIRREE] then
   Begin
      BtIncDet.Enabled      := False;
      BtAltDet.Enabled      := False;
      BtDelDet.Enabled      := False;
      dbgDestino.Color      := clSilver;
      dbgDestino.Font.Color := clGray;
   End;

   If (bVerFormAge) Then
       frmCadAGE.sbtnOpercoesDireito.Down := False;

   If Not bProvisiona Then
      FrmCadAge.bbtnCancelarClick(Sender);

   If (Not bVerFormAge) Then
       bbtnSairClick(Sender);

end;

procedure TfrmCadOperAGE.qryVLRREMUNERACAOSetText(Sender: TField;
  const Text: String);
Var
  eValorExercido : Extended;
  RO : TRegTipoOperacao;
  sTrataIR : string;
begin
   if bbtnConfirmar.Enabled then
   begin
      OperacaoInvest.RetParamOperDireito(qryOperacaoDireitoIDOPERACAODIREITO.AsInteger, RO, qry.DatabaseName);

      eRemuneracao              := StrToFloat(OperComum.StripChar(Text, '.'));

      eValorExercido            := qryVALOREXERCIDO.AsFloat;

      qryVLRREMUNERACAO.AsFloat := eRemuneracao;

      eIRRemuneracao            := 0;

      qryIR.ReadOnly            := False;
      qryVLRLIQ.ReadOnly        := False;
      qryVALOREXERCIDO.ReadOnly := False;

      //Recalculo o IR em caso de valores alterados
      fVlrRendimento := 0;
      eIRExercido := Impostos.CalculaIr(0,
                              qryIDINVESTIMENTO.AsInteger, 0{CARTEIRAGERENC},
                              qryIDCARTEIRAINVEST.AsInteger,
                              qryOperacaoDireitoIDTIPOOPERACAO.AsInteger,
                              RO.IDMERCADO,
                              qryIDLOTE.AsString,
                              Date, Date,
                              0,
                              eValorExercido, 0, 'S',
                              RO.FLGTRATAIR,fVlrRendimento);
      // Calculo do IR sobre Remuneração (Sempre)
      fVlrRendimento := 0;
      eIRRemuneracao :=  Impostos.CalculaIr(1,
                                  qryIDINVESTIMENTO.AsInteger, 0{CARTEIRAGERENC},
                                  qryIDCARTEIRAINVEST.AsInteger,
                                  0,
                                  0,
                                  qryIDLOTE.AsString,
                                  Date, Date,
                                  0,
                                  eRemuneracao, 0, 'S',
                                  RO.FLGTRATAIR,fVlrRendimento);

      qryIR.AsFloat := eIRExercido + eIRRemuneracao;

      if qryOperacaoDireitoIRLITIGIO.AsString = 'S' then
         qryVLRLIQ.AsFloat        := (eRemuneracao + eValorExercido)
      else
         qryVLRLIQ.AsFloat        := (eRemuneracao + eValorExercido) - qryIR.AsFloat;

      qryVLRIRREMUNERACAO.AsFloat := eIRRemuneracao;

      dbgOrigem.InvalidateCurrentRow;

   end;
end;

// Função que processa Dividendos e Juros de Capital
{ Dependendo da Propriedade Provisiona, efetua a operação ou não, fazendo somente a
  provisão contábil do dividendo. }
function TfrmCadOperAGE.ProcDivJurCap : boolean;
var
   wVlrTotOperacaoDif  : Currency;
   sCapCar, sHistorico : String;
   fQtdDireito         : Double;
begin
   Result             := True;
   wVlrTotOperacao    := 0;
   wVlrTotOperacaoDif := 0;
   fQtdDireito        := 0;
   try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      qry.First;
      while not qry.EOF do   // Percorre query Origem - Para Dividendo pode ser mais de 1
      begin
         if qryQTDEDIREITO.AsFloat = 0 then
            qry.Next;

         QryBuscaInvestimento.Close;
         QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger := qryIDINVESTIMENTO.AsInteger;
         QryBuscaInvestimento.Open;
         if QryBuscaInvestimento.IsEmpty then
         begin
            MsgDlg( 'Investimento não foi encontrado. ','Mensagem do Sistema ', MtError,[MbOk],0);
            QryBuscaInvestimento.Free;
            Exit;
         end;

         // Gera Novo Id de Operacao
         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');
         // Se Tipo de Credor for CUSTODIANTE
         if (QryBuscaTipoOper.FieldByName('TIPCREDOR').AsString = 'CT') then
         begin
            // Transforma Custodiante em Fornecedor - Cliente
            try
               if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                  Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False) // Cliente
               else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                  Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                             Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado
            wIdForCli := Qry.FieldByName('IDCUSTODIANTE').AsInteger;

            wNumDoc   := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

            LblBoleta.Caption := wNumDoc;

            QryBuscaBolsaValores.Close;
            QryBuscaBolsaValores.ParamByName('IDCUSTODIANTE').AsInteger := wIdForCli;
            QryBuscaBolsaValores.Open;
            if QryBuscaBolsaValores.IsEmpty then
               iIDBOLSAVALORES := pRPI.IDBVSP
            else
               iIDBOLSAVALORES := QryBuscaBolsaValores.FieldByName('IDBOLSAVALORES').AsInteger;

         // Se Tipo de Credor for EMISSOR
         end else
         begin
            // Transforma Emissor em Fornecedor - Cliente
            try
               if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                  Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False) // Cliente
               else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                  Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                             Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado
            wIdForCli := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;

            wNumDoc   := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

            LblBoleta.Caption := wNumDoc;

            iIDBOLSAVALORES := QryBuscaInvestimento.FieldByName('IDBOLSAVALORES').AsInteger;

         end;

         // Inicia outros Dados
         If qryVALOREXERCIDO.AsFloat = 0 Then
            wVlrOperacao   := qryVLRREMUNERACAO.AsFloat
         Else
            wVlrOperacao   := qryVLRLIQ.AsFloat;

         iInc        := 1;
         wDataVenc   := edtDataEfetiva.Date;
         While iInc  <=  QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger Do
         Begin
            wDataVenc   := wDataVenc + 1;
            While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
              wDataVenc := wDataVenc + 1;   // Achar o próximo dia útil
            iInc        := iInc + 1;
         End;

         wVlrIRProv  := 0;
         wVlrIR      :=  qryIR.AsFloat ;

         if not bProvisiona then
         begin
            // Verifica se existe provisionamento de IR
            if Impostos.BuscaProvisaoIR(2,QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsInteger) then  // Ana: Declarar Units que possuem as funções de IR
               wVlrIRProv := (OperComum.DivValorZero(wSaldoIRApu,wSaldoQtd)* qryQTDEDIREITO.AsFloat )* -1;

            GravaOperacaoInvest(wIdNovaOperacao,
                                QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                                Sistema.IdModulo, Sistema.IdEmpresa,
                                qryIDINVESTIMENTO.AsInteger,
                                qryIDCARTEIRAINVEST.AsInteger, 2,
                                iTipoOperacao,wIdForCli,
                                qryIDCUSTODIANTE.AsInteger,
                                wIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                                edtDataEfetiva.Date, wDataVenc,
                                wNumDoc,'F','L',
                                qryIDLOTE.AsString,
                                qryQTDEDIREITO.AsFloat,
                                RO.DIVPORACAO,
                                qryVALOREXERCIDO.AsFloat,
                                wVlrIR,
                                qryVLRREMUNERACAO.AsFloat,
                                qryVLRIRREMUNERACAO.AsFloat,0);

            if qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat <> 0 Then
            begin
               fQtdDireito := qryQTDEDIREITO.AsFloat;
               qry.Edit;
               qryQTDEDIREITO.AsFloat := 0;
               qry.Post;
            end;

            // Inclui Dados na Tabela de SubTipo, OPRACAO
            QryInsertOprAcao.Close;
            QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
            QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := iIDBOLSAVALORES;
            QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := qryIDINVESTIMENTO.AsInteger;
            QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
            QryInsertOprAcao.ExecSQL;
            // Inclui dados na Tabela BOLETA
            QryBoleta.Close;
            QryBoleta.ParamByName('IDBOLETA').AsString := wNumDoc;
            QryBoleta.Open;
            if QryBoleta.IsEmpty then
            begin
               QryInsertBoleta.Close;
               QryInsertBoleta.ParamByName('IDBOLETA').AsString     := wNumDoc;
               QryInsertBoleta.ParamByName('STATUS').AsString       := 'F';
               QryInsertBoleta.ParamByName('DATABOLETA').AsDateTime := edtDataEfetiva.Date;
               QryInsertBoleta.ParamByName('IDFORCLI').AsInteger    := wIdForCli;
               QryInsertBoleta.ExecSQL;
            end;
            QryBoleta.Close;

            if (qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat = 0) Or (qryQTDEDIREITO.AsFloat = 0) Then
            begin
               // Update no Status de Lançamento
               QryUpdOperacaoDireitoStatus.Close;
               QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := wIdOperacaoDireito;
               QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'L';
               QryUpdOperacaoDireitoStatus.ExecSQL;
            end;

            if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                             qryIDINVESTIMENTO.AsInteger, 2, wIdNovaOperacao, -1,
                             iTipoOperacao,
                             qryIDCARTEIRAINVEST.AsInteger, 0{IDCARTEIRAGERENC},
                             -1, -1, -1, -1, -1,
                             edtDataEfetiva.Date,
                             qryVALOREXERCIDO.AsFloat,
                             qryQTDEDIREITO.AsFloat, wQtdCotaini,
                             0 {Variacao}, 0{Juros},
                             wVlrIRProv, wVlrIR, 0, 0, 0, 0, 0,
                             QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                             QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                             qryIDLOTE.AsString,
                             QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                             qryDESCINVESTIMENTO.AsString,'OPE', '1', '', True,
                             -1, iPlanPrevCtbPatro, iIdHistCartInv) then
            begin
                MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                       'Mensagem do Sistema',MtError,[MbOk],0);
                Result := False;
                Exit;
            end;

            if not OperComum.AtualizaSaldos(wQtdCotaini,-1) then
            begin
                MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                       'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
                Result := False;
                Exit;
            end;

            ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                                 ' FlgCustodia         = NULL '+
                                 ' Where IdHistCartInv = '+IntToStr(iIdHistCartInv));

         end else begin
            // Inserir aqui alguma eventual particularidade da Provisão de dividendos / juros
         end;

         wVlrTotOperacao := wVlrTotOperacao + wVlrOperacao;
         qry.Next;
      end;
      qry.Locate('IDINVESTIMENTO;IDCARTEIRAINVEST;IDCUSTODIANTE;IDMOTIVOBLOQUEIO;IDLOTE',
                 VarArrayOf([Investimento, Carteira, Custodiante,  Bloqueio, Lote]),[loCaseInsensitive]);
      // Parametro para Contabilidade e CAP/CAR
      wMensErro      := '';
      wTipoRecDesBol := '';
      bCriaLancto    := True;
      wPlano         := -1;
      wPlanilha      := -1;
      wDocumCont     := -1;
      if not bProvisiona then
      begin
         // Busca os Lancamentos efetuados anteriormente
         OperComum.LimpaParametros(qryBuscaValoresCtbFin);
         qryBuscaValoresCtbFin.ParamByName('PLNCODIGO').AsInteger    := wPlnProv;
         qryBuscaValoresCtbFin.ParamByName('CODDOCUMENTO').AsInteger := wDocProv;
         qryBuscaValoresCtbFin.Open;

         // Faz por diferença
         If qry.FieldByName('VALOREXERCIDO').AsFloat = 0 Then
         begin
            sCapCar := 'S';
            sHistorico     := 'RECEBIMENTO';
            iTipoOperacao      := -70;  //Anuncio de Proventos
            wVlrTotOperacaoDif := wVlrTotOperacao;
         end
         Else
         begin
            wVlrTotOperacaoDif := wVlrTotOperacao-wVlrTotOperacaoAnt;
            if wVlrTotOperacaoDif <> 0 then
            begin
               sCapCar := 'S';
               iTipoOperacao      := -70;  //Anuncio de Proventos
               sHistorico      := 'RECEBIMENTO';
            end;
         end;

         if OperComum.Round(wVlrTotOperacao,2) <>
            OperComum.Round(qryBuscaValoresCtbFinVALORPLANILHA.AsFloat,2) then
         begin
            QryBuscaFundo.Close;
            QryBuscaFundo.ParamByName('IDPEDIDOFUNDO').AsInteger :=
                          QryOperacaoDireito.FieldByName('IDPEDIDOFUNDO').AsInteger;
            QryBuscaFundo.Open;

            // Lança o valor contabil correto
            if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                                       QryIDINVESTIMENTO.AsInteger,
                                       iTipoOperacao,
                                       wIdNovaOperacao, wIdForCli,
                                       QryIDCARTEIRAINVEST.AsInteger,
                                       QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                                       sHistorico+' / '+QryBuscaFundo.FieldByName('DESCTIPOOPERACAO').AsString+' - '+
                                       QryBuscaFundo.FieldByName('DESCFUNDOINVEST').AsString,
                                       qryIDLOTE.AsString,'',wNumDoc,'R',wTipoRecDesBol, bCriaLancto,
                                       wVlrTotOperacao,
                                       wVlrTotOperacaoDif,
                                       edtDataEfetiva.Date, wDataVenc,
                                       wPlano, wPlanilha, wDocumCont, wMensErro, sCapCar, False) <> 0 then
            begin
               DtmBaseDados.dbBaseDados.Rollback;
               MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                      'no lançamento contábil','Mensagem do Sistema ',mtWarning,[mbOK],0);
               Result := False;
               Exit;
            end;

            // Atualiza Status da Boleta e das Operações.
            with qryAtualizaBoleta do
            begin
               OperComum.LimpaParametros(qryAtualizaBoleta,True);
               ParamByName('BOLETA').asString           := wNumDoc;
               if wDocumCont > 0 then
                  ParamByName('CODDOCUMENTO').asInteger := wDocumCont;
               if wPlano     > 0 then
                  ParamByName('PLANO').asInteger        := wPlano;
               if wPlanilha  > 0 then
                  ParamByName('PLNCODIGO').asInteger    := wPlanilha;
               ExecSQL;
            end;

            // Atualiza o Ststus da Operação
            with qryAtualizaOperacoes do
            begin
               Close;
               if not(Prepared) then Prepare;
               ParamByName('BOLETA').asString := wNumDoc;
               ExecSQL;
            end;

            QryBuscaFundo.Close;
         end else begin
            // Se já foi lancado anteriormente o valor de plncodigo e coddocumento já existem
            wPlano := wPlanoProv;
            wPlanilha := wPlnProv;
            wDocumCont := wDocProv;
         end;

         // Update no Plano e PlnCodigo na IRLITIGIO
         QryUpdIrLitigio.Close;
         QryUpdIrLitigio.ParamByName('pIDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryUpdIrLitigio.ParamByName('pPLANO').AsInteger            := wPlano; If wPlano = -1 Then QryUpdIrLitigio.ParamByName('PLANO').Clear;
         QryUpdIrLitigio.ParamByName('pPLNCODIGO').AsInteger        := wPlanilha; If (wPlanilha = -1) or (wPlanilha = 0) Then QryUpdIrLitigio.ParamByName('pPLNCODIGO').Clear;
         QryUpdIrLitigio.ExecSQL;

         if (fQtdDireito <> 0) And (qryQTDEDIREITO.AsFloat = 0) Then
         begin
            qry.Edit;
            qryQTDEDIREITO.AsFloat := fQtdDireito;
            qry.Post;
         end;

         OperComum.LimpaParametros(qryUpdOperacaoDireito);
         qryUpdOperacaoDireito.ParamByName('P_DIVPORACAO').AsFloat          := fPuAtual;
         qryUpdOperacaoDireito.ParamByName('P_QTDERECDIRPARC').AsFloat      :=
                                  (qryOperacaoDireito.FieldByName('QTDERECDIRPARC').AsFloat+
                                     qry.FieldByName('QTDEDIREITO').AsFloat);
         qryUpdOperacaoDireito.ParamByName('P_IDOPERACAODIREITO').AsInteger :=
                               qryOperacaoDireito.FieldByName('IDOPERACAODIREITO').AsInteger;
         qryUpdOperacaoDireito.ExecSQL;

      end
      else
      begin
         if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                                    qryIDINVESTIMENTO.AsInteger,
                                    -70 {Anuncio de Proventos}{iTipoOperacao},
                                    -1,
                                    wIdForCli,
                                    qryIDCARTEIRAINVEST.AsInteger,
                                    QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                                    qryDESCINVESTIMENTO.AsString,
                                    qryIDLOTE.AsString,'',
                                    wNumDoc,'R', wTipoRecDesBol,  bCriaLancto,
                                    wVlrTotOperacao, wVlrTotOperacao,
                                    dDataAGEProv{edtDataEfetiva.Date},wDataVenc,
                                    wPlano,wPlanilha,wDocumCont,
                                    wMensErro, 'N'{Integra Cap/Car}) <> 0 then
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                   'no lançamento contábil','Mensagem do Sistema ',mtWarning,[mbOK],0);
            Result := False;
            Exit;
         end;

         // Atualiza Status da Boleta e das Operações.
         with qryAtualizaBoleta do
         begin
            OperComum.LimpaParametros(qryAtualizaBoleta,True);
            ParamByName('BOLETA').asString           := wNumDoc;
            if wDocumCont > 0 then
               ParamByName('CODDOCUMENTO').asInteger := wDocumCont;
            if wPlano     > 0 then
               ParamByName('PLANO').asInteger        := wPlano;
            if wPlanilha  > 0 then
               ParamByName('PLNCODIGO').asInteger    := wPlanilha;
            ExecSQL;
         end;

         // Atualiza o Ststus da Operação
         with qryAtualizaOperacoes do
         begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('BOLETA').asString := wNumDoc;
            ExecSQL;
         end;

      end;
      // Atualiza PLNCODIGO e CODDOCUMENTO na OperacaoDireito
      OperComum.LimpaParametros(qryUpdOperDirCtbFin);
      qryUpdOperDirCtbFin.ParamByName('PLANO').AsInteger             := wPlano; If wPlano = -1 Then qryUpdOperDirCtbFin.ParamByName('PLANO').Clear;
      qryUpdOperDirCtbFin.ParamByName('PLNCODIGO').AsInteger         := wPlanilha;
      If (wPlanilha = -1) or (wPlanilha = 0) Then
         qryUpdOperDirCtbFin.ParamByName('PLNCODIGO').Clear;
      qryUpdOperDirCtbFin.ParamByName('CODDOCUMENTO').AsInteger      := wDocumCont; If wDocumCont = -1 Then qryUpdOperDirCtbFin.ParamByName('CODDOCUMENTO').Clear;
      qryUpdOperDirCtbFin.ParamByName('IDOPERACAODIREITO').AsInteger :=
                          qryOperacaoDireito.FieldByName('IDOPERACAODIREITO').AsInteger;
      qryUpdOperDirCtbFin.ExecSQL;

      // Caso o Banco esteja em Transacao Commita
      If DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.Commit;

      if bProvisiona then
      begin
         frmCadAGE.sbtnProvisiona.Down := False;
         frmCadAGE.sbtnProvisiona.Enabled := False;
         frmCadAGE.qry.Close;
         frmCadAGE.qry.Open;
      end;

   except on E: Exception do
      begin
         qry.EnableControls;
         //qryFilha.EnableControls;
         If DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.Rollback;

         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'no lançamento da operação!'#13+
                E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         Result := False;
         Exit;
      end;
   end;
end;

function TfrmCadOperAGE.ProcBonificacao : boolean;
begin
   try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      qryFilha.ControlsDisabled;
      qryFilha.First;
      While Not qryFilha.Eof Do
      Begin
         QryBuscaInvestimento.Close;
         QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger := qryFilhaIDINVESTIMENTO.AsInteger;
         QryBuscaInvestimento.Open;
         
         // Se Tipo de Credor for CUSTODIANTE
         if (QryBuscaTipoOper.FieldByName('TIPCREDOR').AsString = 'CT') then
         begin
            // Transforma Custodiante em Fornecedor - Cliente
            try
               if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                  Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False) // Cliente
               else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                  Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                             Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado
            wIdForCli   := Qry.FieldByName('IDCUSTODIANTE').AsInteger;

            wNumDoc     := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

            QryBuscaBolsaValores.Close;
            QryBuscaBolsaValores.ParamByName('IDCUSTODIANTE').AsInteger := wIdForCli;
            QryBuscaBolsaValores.Open;
            if QryBuscaBolsaValores.IsEmpty then
               iIDBOLSAVALORES := pRPI.IDBVSP
            else
               iIDBOLSAVALORES := QryBuscaBolsaValores.FieldByName('IDBOLSAVALORES').AsInteger;

         // Se Tipo de Credor for EMISSOR
         end else
         begin
            // Transforma Emissor em Fornecedor - Cliente
            try
               if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                  Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False) // Cliente
               else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                  Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                             Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado
            wIdForCli   := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;

            wNumDoc     := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

            iIDBOLSAVALORES := QryBuscaInvestimento.FieldByName('IDBOLSAVALORES').AsInteger;
         end;

         iInc        := 1;
         wDataVenc   := edtDataEfetiva.Date;
         While iInc  <=  QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger Do
         Begin
            wDataVenc   := wDataVenc + 1;
            While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
              wDataVenc := wDataVenc + 1;   // Achar o próximo dia útil
            iInc        := iInc + 1;
         End;

         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         //AL_13 - Ricardo - 24/05/2005         
         if qryOperacaoDireitoFLGTIPODIREITO.AsString = 'N' then
            iTipoOperacao:= iTipoOperacao + 10000;
         //AL_13 - Fim            

         GravaOperacaoInvest(wIdNovaOperacao,QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,Sistema.IdModulo,
                             Sistema.IdEmpresa,qryFilhaIDINVESTIMENTO.AsInteger,qryFilhaIDCARTEIRAINVEST.AsInteger, 2,
                             iTipoOperacao,wIdForCli,qryIDCUSTODIANTE.AsInteger,wIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date,wDataVenc,wNumDoc,'F','L',qryFilhaIDLOTE.AsString,qryFilhaQTDEDIREITO.AsFloat,
                             RO.DIVPORACAO,0,0,0,0,0);

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := iIDBOLSAVALORES;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := qryFilhaIDINVESTIMENTO.AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
         QryInsertOprAcao.ExecSQL;
         // Inclui dados na Tabela BOLETA
         QryBoleta.Close;
         QryBoleta.ParamByName('IDBOLETA').AsString := wNumDoc;
         QryBoleta.Open;
         //AL_2 - 28/06/2004 - RICARDO CRISTIANO
         If QryBoleta.IsEmpty then
         begin
            QryInsertBoleta.Close;
            QryInsertBoleta.ParamByName('IDBOLETA').AsString     := wNumDoc;
            QryInsertBoleta.ParamByName('STATUS').AsString       := 'F';
            QryInsertBoleta.ParamByName('TIPMOVBOLETA').AsString := 'DTB';
            QryInsertBoleta.ParamByName('DATABOLETA').AsDateTime := edtDataEfetiva.Date;
            QryInsertBoleta.ParamByName('IDFORCLI').AsInteger    := wIdForCli;
            QryInsertBoleta.ExecSQL;
         end;
         QryBoleta.Close;

         // Update no Status de Lançamento
         QryUpdOperacaoDireitoStatus.Close;
         QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := wIdOperacaoDireito;
         QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'L';
         QryUpdOperacaoDireitoStatus.ExecSQL;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                qryFilhaIDINVESTIMENTO.AsInteger, 2, wIdNovaOperacao, -1,
                iTipoOperacao,
                qryFilhaIDCARTEIRAINVEST.AsInteger, 0{IDCARTEIRAGERENC},
                -1, -1, -1, -1, -1,
                edtDataEfetiva.Date,
                0{wVlrOperacao},qryFilhaQTDEDIREITO.AsFloat,
                wQtdCotaini,
                0 {Variacao}, 0{Juros}, 0, 0, 0, 0, 0, 0, 0,
                QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                qryFilhaIDLOTE.AsString,
                QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                qryFilhaACAO.AsString,'OPE', '1', '', True,
                -1,
                iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
             MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                    'Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         if not OperComum.AtualizaSaldos(wQtdCotaini,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;
         // Atualizar Custodia
         if QryBuscaTipoOper.FieldByName('TIPOCUSTODIA').AsString  <> 'N' then
            wIdOperCust := wIdNovaOperacao
         else
            wIdOperCust := -1;

         if not OperacaoInvest.CadastraCustodia(wIdOperCust) then
         begin
            MsgDlg('Erro ao Atualizar Custodia, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

//         OperacaoInvest.AtualizaSaldosCustodia;
         If wIdOperCust <> -1 Then
            ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                                 ' FlgCustodia         = NULL '+
                                  ' Where IdHistCartInv = '+IntToStr(iIdHistCartInv));
         qryFilha.Next;
      end;

      //Al_7 - Ricardo - 26/04/2005
      if Not ProcBonificacaoCartGerenc(wNumDoc) then
      begin
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'na Especificação da Carteira.','Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
         Exit;
      end;
      //Al_7 - Fim

      // Caso o Banco esteja em Transacao Commita
      If DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.Commit;

   except on E: Exception do
      begin
         qryFilha.EnableControls;
         //qryFilha.EnableControls;
         If DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.Rollback;

         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'no lançamento da operação!'#13+
                E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         Result := False;
         Exit;
      end;
   end;
   Result := True;
   qryFilha.DisableControls;
end;

function TfrmCadOperAGE.ProcSubscricao : boolean;
begin
   wVlrTotOperacao := 0;
   try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      wNumDoc     := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                          LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

      qryFilha.ControlsDisabled;
      qryFilha.First;
      While Not qryFilha.Eof Do
      Begin
         // Se Tipo de Credor for CUSTODIANTE
         if (QryBuscaTipoOper.FieldByName('TIPCREDOR').AsString = 'CT') then
         begin
            // Transforma Custodiante em Fornecedor - Cliente
            try
               if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                  Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False) // Cliente
               else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                  Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                             Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado
            wIdForCli   := Qry.FieldByName('IDCUSTODIANTE').AsInteger;

            QryBuscaBolsaValores.Close;
            QryBuscaBolsaValores.ParamByName('IDCUSTODIANTE').AsInteger := wIdForCli;
            QryBuscaBolsaValores.Open;
            if QryBuscaBolsaValores.IsEmpty then
               iIDBOLSAVALORES := pRPI.IDBVSP
            else
               iIDBOLSAVALORES := QryBuscaBolsaValores.FieldByName('IDBOLSAVALORES').AsInteger;

         // Se Tipo de Credor for EMISSOR
         end else
         begin
            // Transforma Emissor em Fornecedor - Cliente
            try
               if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                  Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False) // Cliente
               else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                  Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                             Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado
            wIdForCli   := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;

            wNumDoc     := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

            iIDBOLSAVALORES := QryBuscaInvestimento.FieldByName('IDBOLSAVALORES').AsInteger;
         end;

         iInc        := 1;
         wDataVenc   := edtDataEfetiva.Date;
         While iInc  <=  QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger Do
         Begin
            wDataVenc   := wDataVenc + 1;
            While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
              wDataVenc := wDataVenc + 1;   // Achar o próximo dia útil
            iInc        := iInc + 1;
         End;

         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         wVlrOperacao    :=  qryFilhaVALOREXERCIDO.AsFloat;

         GravaOperacaoInvest(wIdNovaOperacao,QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,Sistema.IdModulo,
                             Sistema.IdEmpresa,qryFilhaIDINVESTIMENTO.AsInteger,qryFilhaIDCARTEIRAINVEST.AsInteger, 2,
                             iTipoOperacao,wIdForCli,qryIDCUSTODIANTE.AsInteger,wIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date,wDataVenc,wNumDoc,'F','L',qryFilhaIDLOTE.AsString,qryFilhaQTDEDIREITO.AsFloat,
                             RO.DIVPORACAO,wVlrOperacao,0,0,0,0);

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := iIDBOLSAVALORES;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := qryFilhaIDINVESTIMENTO.AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
         QryInsertOprAcao.ExecSQL;
         // Inclui dados na Tabela BOLETA
         QryBoleta.Close;
         QryBoleta.ParamByName('IDBOLETA').AsString := wNumDoc;
         QryBoleta.Open;
         If QryBoleta.IsEmpty then
         begin
            QryInsertBoleta.Close;
            QryInsertBoleta.ParamByName('IDBOLETA').AsString     := wNumDoc;
            QryInsertBoleta.ParamByName('STATUS').AsString       := 'F';
            QryInsertBoleta.ParamByName('DATABOLETA').AsDateTime := edtDataEfetiva.Date;
            QryInsertBoleta.ParamByName('IDFORCLI').AsInteger    := wIdForCli;
            QryInsertBoleta.ParamByName('IDFORCLI').AsInteger    := wIdForCli;
            //Al_15 - Ricardo - 12/07/2005
            QryInsertBoleta.ParamByName('TIPMOVBOLETA').AsString := 'DTS';
            QryInsertBoleta.ExecSQL;
         end;
         QryBoleta.Close;
         // Update no Status de Lançamento
         QryUpdOperacaoDireitoStatus.Close;
         QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := wIdOperacaoDireito;
         QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'L';
         QryUpdOperacaoDireitoStatus.ExecSQL;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                qryFilhaIDINVESTIMENTO.AsInteger, 2, wIdNovaOperacao, -1,
                iTipoOperacao,
                qryFilhaIDCARTEIRAINVEST.AsInteger, 0{IDCARTEIRAGERENC},
                -1, -1, -1, -1, -1,
                edtDataEfetiva.Date,
                wVlrOperacao,qryFilhaQTDEDIREITO.AsFloat,
                wQtdCotaini,
                0 {Variacao}, 0{Juros}, 0, 0, 0, 0, 0, 0, 0,
                QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                qryFilhaIDLOTE.AsString,
                QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                qryFilhaACAO.AsString,'OPE', '1', '', True,
                -1,
                iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
             MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                    'Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         if not OperComum.AtualizaSaldos(wQtdCotaini,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;
         // Atualizar Custodia
         if QryBuscaTipoOper.FieldByName('TIPOCUSTODIA').AsString <> 'N' then
            wIdOperCust := wIdNovaOperacao
         else
            wIdOperCust := -1;

         if not OperacaoInvest.CadastraCustodia(wIdOperCust) then
         begin
            MsgDlg('Erro ao Atualizar Custodia, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

//         OperacaoInvest.AtualizaSaldosCustodia;
         If wIdOperCust <> -1 Then
            ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                                 ' FlgCustodia         = NULL '+
                                  ' Where IdHistCartInv = '+IntToStr(iIdHistCartInv));

         wVlrTotOperacao := wVlrTotOperacao + wVlrOperacao;

         // Parametro para Contabilidade e CAP/CAR
         wTipoRecDesBol := '';
         bCriaLancto := True;
         wPlano := -1;
         wPlanilha := -1;
         wDocumCont := -1;
         wMensErro := '';
         if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                                 qryFilhaIDINVESTIMENTO.AsInteger,iTipoOperacao,
                                 wIdNovaOperacao,wIdForCli,qryFilhaIDCARTEIRAINVEST.AsInteger,
                                 QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                                 '',qryIDLOTE.AsString,'',wNumDoc,'P',wTipoRecDesBol,bCriaLancto,
                                 wVlrTotOperacao,wVlrTotOperacao,edtDataEfetiva.Date,
                                 wDataVenc,wPlano,wPlanilha,wDocumCont,wMensErro) <> 0 then
         begin
            If DtmBaseDados.dbBaseDados.InTransaction Then
               DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                   'no lançamento contábil','Mensagem do Sistema ',mtWarning,[mbOK],0);
            Result := False;
            Exit;
         end;

         qryFilha.Next;
      end;

      // Caso o Banco esteja em Transacao Commita
      If DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.Commit;

   except on E: Exception do
      begin
         qryFilha.EnableControls;
         //qryFilha.EnableControls;
         If DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'no lançamento da operação!'#13+
                E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         Result := False;
         Exit;
      end;
   end;
   Result := True;
   qryFilha.DisableControls;
end;

function TfrmCadOperAGE.ProcDesdobramento: boolean;
begin
   try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      qryFilha.ControlsDisabled;
      qryFilha.First;
      While Not qryFilha.Eof Do
      Begin
         // Se Tipo de Credor for CUSTODIANTE
         if (QryBuscaTipoOper.FieldByName('TIPCREDOR').AsString = 'CT') then
         begin
            // Transforma Custodiante em Fornecedor - Cliente
            try
               if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                  Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False) // Cliente
               else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                  Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                             Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado
            wIdForCli   := Qry.FieldByName('IDCUSTODIANTE').AsInteger;

            wNumDoc     := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

            QryBuscaBolsaValores.Close;
            QryBuscaBolsaValores.ParamByName('IDCUSTODIANTE').AsInteger := wIdForCli;
            QryBuscaBolsaValores.Open;
            if QryBuscaBolsaValores.IsEmpty then
               iIDBOLSAVALORES := pRPI.IDBVSP
            else
               iIDBOLSAVALORES := QryBuscaBolsaValores.FieldByName('IDBOLSAVALORES').AsInteger;

         // Se Tipo de Credor for EMISSOR
         end else
         begin
            // Transforma Emissor em Fornecedor - Cliente
            try
               if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                  Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False) // Cliente
               else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                  Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                             Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado
            wIdForCli   := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;

            wNumDoc     := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

            iIDBOLSAVALORES := QryBuscaInvestimento.FieldByName('IDBOLSAVALORES').AsInteger;
         end;

         iInc        := 1;
         wDataVenc   := edtDataEfetiva.Date;         
         While iInc  <=  QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger Do
         Begin
            wDataVenc   := wDataVenc + 1;
            While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
              wDataVenc := wDataVenc + 1;   // Achar o próximo dia útil
            iInc        := iInc + 1;
         End;

         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');


         GravaOperacaoInvest(wIdNovaOperacao,QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,Sistema.IdModulo,
                             Sistema.IdEmpresa,qryFilhaIDINVESTIMENTO.AsInteger,qryFilhaIDCARTEIRAINVEST.AsInteger, 2,
                             iTipoOperacao,wIdForCli,qryIDCUSTODIANTE.AsInteger,wIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date,wDataVenc,wNumDoc,'F','L',qryFilhaIDLOTE.AsString,qryFilhaQTDEDIREITO.AsFloat,
                             RO.DIVPORACAO,0,0,0,0,0);

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := iIDBOLSAVALORES;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := qryFilhaIDINVESTIMENTO.AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
         QryInsertOprAcao.ExecSQL;
         // Inclui dados na Tabela BOLETA
         QryBoleta.Close;
         QryBoleta.ParamByName('IDBOLETA').AsString := wNumDoc;
         QryBoleta.Open;
         If QryBoleta.IsEmpty then
         begin
            //AL_3 - 19/08/2004 - RICARDO CRISTIANO
            QryInsertBoleta.Close;
            QryInsertBoleta.ParamByName('IDBOLETA').AsString     := wNumDoc;
            QryInsertBoleta.ParamByName('STATUS').AsString       := 'F';
            QryInsertBoleta.ParamByName('TIPMOVBOLETA').AsString := 'DTD';            
            QryInsertBoleta.ParamByName('DATABOLETA').AsDateTime := edtDataEfetiva.Date;
            QryInsertBoleta.ParamByName('IDFORCLI').AsInteger    := wIdForCli;
            QryInsertBoleta.ExecSQL;
         end;
         QryBoleta.Close;
         // Update no Status de Lançamento
         QryUpdOperacaoDireitoStatus.Close;
         QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := wIdOperacaoDireito;
         QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'L';
         QryUpdOperacaoDireitoStatus.ExecSQL;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                qryFilhaIDINVESTIMENTO.AsInteger, 2, wIdNovaOperacao, -1,
                iTipoOperacao,
                qryFilhaIDCARTEIRAINVEST.AsInteger, 0{IDCARTEIRAGERENC},
                -1, -1, -1, -1, -1,
                edtDataEfetiva.Date,
                0 ,qryFilhaQTDEDIREITO.AsFloat,
                wQtdCotaini,
                0 , 0 , 0, 0, 0, 0, 0, 0, 0,
                QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString,
                QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString,
                qryFilhaIDLOTE.AsString,
                QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                qryFilhaACAO.AsString,'OPE', '1', '', True,
                -1,
                iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
             MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                    'Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         if not OperComum.AtualizaSaldos(wQtdCotaini,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;
         // Atualizar Custodia
         if QryBuscaTipoOper.FieldByName('TIPOCUSTODIA').AsString <> 'N' then
            wIdOperCust := wIdNovaOperacao
         else
            wIdOperCust := -1;

         if not OperacaoInvest.CadastraCustodia(wIdOperCust) then
         begin
            MsgDlg('Erro ao Atualizar Custodia, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         If wIdOperCust <> -1 Then
            ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                                 ' FlgCustodia         = NULL '+
                                 ' Where IdHistCartInv = '+IntToStr(iIdHistCartInv));

         qryFilha.Next;
      end;

      // Caso o Banco esteja em Transacao Commita
      If DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.Commit;

   except on E: Exception do
      begin
         qryFilha.EnableControls;
         //qryFilha.EnableControls;
         If DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'no lançamento da operação!'#13+
                E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         Result := False;
         Exit;
      end;
   end;
   Result := True;
   qryFilha.DisableControls;
end;

function TfrmCadOperAGE.ProcIncorporacao :boolean;
Var
  sDescrInvest : String;
begin
   try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      with QryBuscaTipoOper do
      begin   // Ana: Buscar essa query de FProcOperacao
         Close;
         if not(Prepared) then Prepare;
         ParamByName('TIPOOPERACAO').asInteger := iTipoOperacao;   // Ana: Alimentado a partir do MontaSelect
         Open;
      end;

      wNumDoc := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                 LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

      iIDBOLSAVALORES := pRPI.IDBVSP;

      OperacaoInvest.RetParamOperDireito(wIdOperacaoDireito, RO, qry.DatabaseName);

      qry.First;
      while not qry.EOF do   // Ana: Percorre query Origem - Para Cisão só pode ser 1
      begin
         if qryQTDEDIREITO.AsFloat = 0 then
         begin
            qry.Next;
            Continue;
         end;

         dDataAGE := qryDATAREFERENCIA.AsDateTime;

         // Dados do Investimento
         QryBuscaInvestimento.Close;
         QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger := qryIDINVESTIMENTO.AsInteger;
         QryBuscaInvestimento.Open;
         if QryBuscaInvestimento.IsEmpty then
         begin
            MsgDlg( 'Investimento não foi encontrado. ','Mensagem do Sistema ', MtError,[MbOk],0);
            QryBuscaInvestimento.Free;
            Result := False; 
            Exit;
         end;
         // Busca Saldos na Carteira
         wSaldoQtd:=0;
         //AL_1
         //AL_4
         OperComum.BuscaTodosSaldosInvestLote(
            qryIDCARTEIRAINVEST.AsInteger, 0{IDCARTEIRAGERENC},
            qryIDINVESTIMENTO.AsInteger, high(integer),-1,
            qryIDLOTE.AsString,
            DateToStr(qryOperacaoDireitoDATAEX.AsDateTime), -1,
            wSaldoQtd, wSaldoVlr, wSaldoInutil, wSaldoInutil, wSaldoAqui,
            wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
            wSaldoIRApu, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
            wSaldoInutil, wSaldoInutil, wSaldoInutil);

         // Gera Novo Id de Operacao
         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         // Inicia outros Dados
         wVlrOperacao:= OperComum.DivValorZero(qryQTDEDIREITO.AsFloat,
                                               QryBuscaInvestimento.FieldByName('QTDELOTE').AsInteger)*
                                               (wSaldoVlr / wSaldoQtd);
         iInc        := 1;
         wDataVenc   := edtDataEfetiva.Date;         
         While iInc  <=  QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger Do
         Begin
            wDataVenc   := wDataVenc + 1;
            While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
              wDataVenc := wDataVenc + 1;   // Achar o próximo dia útil
            iInc        := iInc + 1;
         End;

         wVlrIR      := 0;
         wVlrIRProv  := 0;

         wIdForCli   := Qry.FieldByName('IDCUSTODIANTE').AsInteger;

         GravaOperacaoInvest(wIdNovaOperacao,QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,Sistema.IdModulo,
                          Sistema.IdEmpresa,qryIDINVESTIMENTO.AsInteger,qryIDCARTEIRAINVEST.AsInteger, 2,
                          iTipoOperacao,wIdForCli,qryIDCUSTODIANTE.AsInteger,wIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                          edtDataEfetiva.Date,wDataVenc,wNumDoc,'F','L',qryIDLOTE.AsString,qryQTDEDIREITO.AsFloat,
                          wSaldoVlr / wSaldoQtd,wVlrOperacao,wVLRIR,0,0,0);

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := iIDBOLSAVALORES;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := qryIDINVESTIMENTO.AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimentoIDEMISSOR.AsInteger;
         QryInsertOprAcao.ExecSQL;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
            qryIDINVESTIMENTO.AsInteger, 2, wIdNovaOperacao, -1,
            iTipoOperacao,
            qryIDCARTEIRAINVEST.AsInteger, 0{IDCARTEIRAGERENC},
            -1, -1, -1, -1, -1,
            edtDataEfetiva.Date,
            wVlrOperacao, qryQTDEDIREITO.AsFloat,
            wQtdCotaini,
            0 {Variacao}, 0{Juros}, wVlrIRProv, wVlrIR, 0, 0, 0, 0 , 0,
            'D', 'D', qryIDLOTE.AsString,
            QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / Baixa de '+
               qryDESCINVESTIMENTO.AsString,'TRF', '1', '', True,
            -1,
            iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
            MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         if not OperComum.AtualizaSaldos(wQtdCotaini,-1) then
         begin
            MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                   'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         if qryIDMOTIVOBLOQUEIO.AsInteger = -1 then
            sTipoCustodia := 'V'
         else
            sTipoCustodia := 'Z';  //BLOQUEADA

         OperacaoInvest.InsereCustodia(
                   qryIDCARTEIRAINVEST.AsInteger,
                   qryIDINVESTIMENTO.AsInteger,
                   qryIDCUSTODIANTE.AsInteger,
                   qryIDMOTIVOBLOQUEIO.AsInteger, wIdNovaOperacao,
                   -1,
                   qryIDLOTE.AsString, sTipoCustodia[1],
                   dDataAGE, qryQTDEDIREITO.AsFloat,iIdHistCustodia);

         OperacaoInvest.AtualizaSaldosCustodia;

         ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                              ' FlgCustodia         = NULL '+
                              ' Where IdHistCartInv = '+IntToStr(iIdHistCartInv));

         qry.Next;

      end;

      qryFilha.ControlsDisabled;
      qryFilha.First;
      While Not qryFilha.Eof Do
      Begin
         with QryBuscaInvestimento do
         begin
            Close;
            ParamByName('IDINVESTIMENTO').AsInteger := qryFilhaIDINVESTIMENTO.AsInteger;
            Open;
         end;
         // Se Tipo de Credor for CUSTODIANTE
         if (QryBuscaTipoOper.FieldByName('TIPCREDOR').AsString = 'CT') then
         begin
            // Transforma Custodiante em Fornecedor - Cliente
            try
               if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                  Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False) // Cliente
               else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                  Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                             Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado
            wIdForCli   := Qry.FieldByName('IDCUSTODIANTE').AsInteger;

{            wNumDoc     := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));}

            QryBuscaBolsaValores.Close;
            QryBuscaBolsaValores.ParamByName('IDCUSTODIANTE').AsInteger := wIdForCli;
            QryBuscaBolsaValores.Open;
            if QryBuscaBolsaValores.IsEmpty then
               iIDBOLSAVALORES := pRPI.IDBVSP
            else
               iIDBOLSAVALORES := QryBuscaBolsaValores.FieldByName('IDBOLSAVALORES').AsInteger;

         // Se Tipo de Credor for EMISSOR
         end else
         begin
            // Transforma Emissor em Fornecedor - Cliente
            try
               if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                  Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False) // Cliente
               else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                  Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                             Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado
            wIdForCli   := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;

{            wNumDoc     := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));}

            iIDBOLSAVALORES := QryBuscaInvestimento.FieldByName('IDBOLSAVALORES').AsInteger;
         end;

         iInc        := 1;
         wDataVenc   := edtDataEfetiva.Date;         
         While iInc  <=  QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger Do
         Begin
            wDataVenc   := wDataVenc + 1;
            While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
              wDataVenc := wDataVenc + 1;   // Achar o próximo dia útil
            iInc        := iInc + 1;
         End;

         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');


         GravaOperacaoInvest(wIdNovaOperacao,QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,Sistema.IdModulo,
                             Sistema.IdEmpresa,qryFilhaIDINVESTIMENTO.AsInteger,qryFilhaIDCARTEIRAINVEST.AsInteger, 2,
                             iTipoOperacao,wIdForCli,qryIDCUSTODIANTE.AsInteger,wIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date,wDataVenc,wNumDoc,'F','L',qryFilhaIDLOTE.AsString,qryFilhaQTDEDIREITO.AsFloat,
                             RO.DIVPORACAO,0,0,0,0,0);

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := iIDBOLSAVALORES;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := qryFilhaIDINVESTIMENTO.AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimentoIDEMISSOR.AsInteger;
         QryInsertOprAcao.ExecSQL;
         // Inclui dados na Tabela BOLETA
         QryBoleta.Close;
         QryBoleta.ParamByName('IDBOLETA').AsString := wNumDoc;
         QryBoleta.Open;
         If QryBoleta.IsEmpty then
         begin
            QryInsertBoleta.Close;
            QryInsertBoleta.ParamByName('IDBOLETA').AsString     := wNumDoc;
            QryInsertBoleta.ParamByName('STATUS').AsString       := 'F';
            QryInsertBoleta.ParamByName('DATABOLETA').AsDateTime := edtDataEfetiva.Date;
            QryInsertBoleta.ParamByName('IDFORCLI').AsInteger    := wIdForCli;
            QryInsertBoleta.ExecSQL;
         end;
         QryBoleta.Close;
         // Update no Status de Lançamento
         QryUpdOperacaoDireitoStatus.Close;
         QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := wIdOperacaoDireito;
         QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'L';
         QryUpdOperacaoDireitoStatus.ExecSQL;

         If Trim(qryFilhaDESCINVESTIMENTO.AsString) = '' Then
            sDescrInvest := qryFilhaACAO.AsString
         Else
            sDescrInvest := qryFilhaDESCINVESTIMENTO.AsString;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                qryFilhaIDINVESTIMENTO.AsInteger, 2, wIdNovaOperacao, -1,
                iTipoOperacao,
                qryFilhaIDCARTEIRAINVEST.AsInteger, 0{IDCARTEIRAGERENC},
                -1, -1, -1, -1, -1,
                edtDataEfetiva.Date,
                0{wVlrOperacao},qryFilhaQTDEDIREITO.AsFloat,
                wQtdCotaini,
                0 {Variacao}, 0{Juros}, 0, 0, 0, 0, 0, 0, 0,
                QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                qryFilhaIDLOTE.AsString,
                QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / Acréscimo de '+
                sDescrInvest,'TRF', '1', '', True,
                -1,
                iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
             MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                    'Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         if not OperComum.AtualizaSaldos(wQtdCotaini,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;
         // Atualizar Custodia
         if QryBuscaTipoOper.FieldByName('TIPOCUSTODIA').AsString <> 'N' then
            wIdOperCust := wIdNovaOperacao
         else
            wIdOperCust := -1;

         if not OperacaoInvest.CadastraCustodia(wIdOperCust) then
         begin
            MsgDlg('Erro ao Atualizar Custodia, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

//         OperacaoInvest.AtualizaSaldosCustodia;
         If wIdOperCust <> -1 Then
            ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                                 ' FlgCustodia         = NULL '+
                                 ' Where IdHistCartInv = '+IntToStr(iIdHistCartInv));

         qryFilha.Next;
      end;
      qry.Locate('IDINVESTIMENTO;IDCARTEIRAINVEST;IDCUSTODIANTE;IDMOTIVOBLOQUEIO;IDLOTE',
                 VarArrayOf([Investimento, Carteira, Custodiante,  Bloqueio, Lote]),[loCaseInsensitive]);
      // Parametro para Contabilidade e CAP/CAR
      wTipoRecDesBol := '';
      bCriaLancto := True;
      wPlano := -1;
      wPlanilha := -1;
      wDocumCont := -1;
      wMensErro := '';
      if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                              qryIDINVESTIMENTO.AsInteger,iTipoOperacao,
                              wIdNovaOperacao,wIdForCli,qryIDCARTEIRAINVEST.AsInteger,
                              QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                              '',qryIDLOTE.AsString,'',wNumDoc,'R',wTipoRecDesBol,bCriaLancto,
                              wVlrTotOperacao,wVlrTotOperacao,edtDataEfetiva.Date,
                              wDataVenc,wPlano,wPlanilha,wDocumCont,wMensErro) <> 0 then
      begin
         If DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'no lançamento contábil','Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
         Exit;
      end;

      // Caso o Banco esteja em Transacao Commita
      If DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.Commit;

   except on E: Exception do
      begin
         qryFilha.EnableControls;
         //qryFilha.EnableControls;
         If DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'no lançamento da operação!'#13+
                E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         Result := False;
         Exit;
      end;
   end;
   Result := True;
   qryFilha.DisableControls;
end;

function TfrmCadOperAGE.ProcGrupamento :boolean;
Var
   sDescrInvest : String;
begin
   try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      with QryBuscaTipoOper do
      begin   // Ana: Buscar essa query de FProcOperacao
         Close;
         if not(Prepared) then Prepare;
         ParamByName('TIPOOPERACAO').asInteger := iTipoOperacao;   // Ana: Alimentado a partir do MontaSelect
         Open;
      end;

      wNumDoc := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                 LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

      iIDBOLSAVALORES := pRPI.IDBVSP;

      OperacaoInvest.RetParamOperDireito(wIdOperacaoDireito, RO, qry.DatabaseName);

      qry.First;
      while not qry.EOF do   // Ana: Percorre query Origem - Para Cisão só pode ser 1
      begin
         if qryQTDEDIREITO.AsFloat = 0 then
         begin
            qry.Next;
            Continue;
         end;

         dDataAGE := qryDATAREFERENCIA.AsDateTime;

         // Dados do Investimento
         QryBuscaInvestimento.Close;
         QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger := qryIDINVESTIMENTO.AsInteger;
         QryBuscaInvestimento.Open;
         if QryBuscaInvestimento.IsEmpty then
         begin
            MsgDlg( 'Investimento não foi encontrado. ','Mensagem do Sistema ', MtError,[MbOk],0);
            QryBuscaInvestimento.Free;
            Result := False;
            Exit;
         end;
         // Busca Saldos na Carteira
         wSaldoQtd:=0;
         //AL_1
         //AL_4
         OperComum.BuscaTodosSaldosInvestLote(
                   qryIDCARTEIRAINVEST.AsInteger, 0{IDCARTEIRAGERENC},
                   qryIDINVESTIMENTO.AsInteger, high(integer), -1,
                   qryIDLOTE.AsString,
                   DateToStr(qryOperacaoDireitoDATAEX.AsDateTime), -1,
                   wSaldoQtd, wSaldoVlr, wSaldoInutil, wSaldoInutil, wSaldoAqui,
                   wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                   wSaldoIRApu, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                   wSaldoInutil, wSaldoInutil, wSaldoInutil);

         wIdForCli   := Qry.FieldByName('IDCUSTODIANTE').AsInteger;

         // Gera Novo Id de Operacao
         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         // Inicia outros Dados
         wVlrOperacao:= OperComum.DivValorZero(qryQTDEDIREITO.AsFloat,
                                               QryBuscaInvestimento.FieldByName('QTDELOTE').AsInteger)*
                                               (wSaldoVlr / wSaldoQtd);

         iInc        := 1;
         wDataVenc   := edtDataEfetiva.Date;         
         While iInc  <=  QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger Do
         Begin
            wDataVenc   := wDataVenc + 1;
            While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
              wDataVenc := wDataVenc + 1;   // Achar o próximo dia útil
            iInc        := iInc + 1;
         End;                                               

         wVlrIR      := 0;
         wVlrIRProv  := 0;


         GravaOperacaoInvest(wIdNovaOperacao,
                             QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                             Sistema.IdModulo, Sistema.IdEmpresa,
                             qryIDINVESTIMENTO.AsInteger,
                             qryIDCARTEIRAINVEST.AsInteger, 2, iTipoOperacao,wIdForCli,
                             qryIDCUSTODIANTE.AsInteger,
                             wIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date,
                             wDataVenc,wNumDoc,'F','L',
                             qryIDLOTE.AsString,qryQTDEDIREITO.AsFloat,
                             0,0,0,0,0,0,'O');

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := iIDBOLSAVALORES;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := qryIDINVESTIMENTO.AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimentoIDEMISSOR.AsInteger;
         QryInsertOprAcao.ExecSQL;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                          qryIDINVESTIMENTO.AsInteger, 2, wIdNovaOperacao, -1,
                          iTipoOperacao,
                          qryIDCARTEIRAINVEST.AsInteger, 0{IDCARTEIRAGERENC},
                          -1, -1, -1, -1, -1,
                          edtDataEfetiva.Date,
                          wVlrOperacao, qryQTDEDIREITO.AsFloat,
                          wQtdCotaini,
                          0 {Variacao}, 0{Juros}, wVlrIRProv, wVlrIR, 0, 0, 0, 0, 0,
                          'D', 'D', qryIDLOTE.AsString,
                          QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / Baixa de '+
                             qryDESCINVESTIMENTO.AsString,
                          //Al_14 - Ricardo - 04/05/2005                             
                          'OPE', '1', '', True, -1,
                          iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
            MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         if not OperComum.AtualizaSaldos(wQtdCotaini,-1) then
         begin
            MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                   'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         //Al_14 - Ricardo - 04/05/2005
{         if qryIDMOTIVOBLOQUEIO.AsInteger = -1 then
            sTipoCustodia := 'V'
         else
            sTipoCustodia := 'Z';  //BLOQUEADA

         OperacaoInvest.InsereCustodia(qryIDCARTEIRAINVEST.AsInteger,
                                       qryIDINVESTIMENTO.AsInteger,
                                       qryIDCUSTODIANTE.AsInteger,
                                       qryIDMOTIVOBLOQUEIO.AsInteger, wIdNovaOperacao,
                                       -1,
                                       qryIDLOTE.AsString, sTipoCustodia[1],
                                       dDataAGE, qryQTDEDIREITO.AsFloat,iIdHistCustodia);

         OperacaoInvest.AtualizaSaldosCustodia;

         ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                              ' FlgCustodia         = NULL '+
                              ' Where IdHistCartInv = '+IntToStr(iIdHistCartInv));}

         qry.Next;

      end;

      qryFilha.ControlsDisabled;
      qryFilha.First;
      While Not qryFilha.Eof Do
      Begin
         // Se Tipo de Credor for CUSTODIANTE
{         if (QryBuscaTipoOper.FieldByName('TIPCREDOR').AsString = 'CT') then
         begin
            // Transforma Custodiante em Fornecedor - Cliente
            try
               if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                  Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False) // Cliente
               else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                  Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                             Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado
            wIdForCli   := Qry.FieldByName('IDCUSTODIANTE').AsInteger;

            wNumDoc     := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

            QryBuscaBolsaValores.Close;
            QryBuscaBolsaValores.ParamByName('IDCUSTODIANTE').AsInteger := wIdForCli;
            QryBuscaBolsaValores.Open;
            if QryBuscaBolsaValores.IsEmpty then
               iIDBOLSAVALORES := pRPI.IDBVSP
            else
               iIDBOLSAVALORES := QryBuscaBolsaValores.FieldByName('IDBOLSAVALORES').AsInteger;

         // Se Tipo de Credor for EMISSOR
         end else
         begin
            // Transforma Emissor em Fornecedor - Cliente
            try
               if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                  Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False) // Cliente
               else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                  Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                             Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado
            wIdForCli   := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;

            wNumDoc     := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

            iIDBOLSAVALORES := QryBuscaInvestimento.FieldByName('IDBOLSAVALORES').AsInteger;
         end;}

         iInc        := 1;
         wDataVenc   := edtDataEfetiva.Date;
         While iInc  <=  QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger Do
         Begin
            wDataVenc   := wDataVenc + 1;
            While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
              wDataVenc := wDataVenc + 1;   // Achar o próximo dia útil
            iInc        := iInc + 1;
         End;

         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');


         GravaOperacaoInvest(wIdNovaOperacao,
                             QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                             Sistema.IdModulo, Sistema.IdEmpresa,
                             qryFilhaIDINVESTIMENTO.AsInteger,
                             qryFilhaIDCARTEIRAINVEST.AsInteger, 2, iTipoOperacao,
                             wIdForCli,
                             qryFilhaIDCUSTODIANTE.AsInteger,
                             wIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date,wDataVenc,wNumDoc,'F','L',
                             qryFilhaIDLOTE.AsString,qryFilhaQTDEDIREITO.AsFloat,
                             0,0,0,0,0,0,'D');

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := iIDBOLSAVALORES;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := qryFilhaIDINVESTIMENTO.AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
         QryInsertOprAcao.ExecSQL;

         If Trim(qryFilhaDESCINVESTIMENTO.AsString) = '' Then
            sDescrInvest := qryFilhaACAO.AsString
         Else
            sDescrInvest := qryFilhaDESCINVESTIMENTO.AsString;

         // Inclui dados na Tabela BOLETA
         QryBoleta.Close;
         QryBoleta.ParamByName('IDBOLETA').AsString := wNumDoc;
         QryBoleta.Open;
         If QryBoleta.IsEmpty then
         begin
            QryInsertBoleta.Close;
            QryInsertBoleta.ParamByName('IDBOLETA').AsString     := wNumDoc;
            QryInsertBoleta.ParamByName('STATUS').AsString       := 'F';
            QryInsertBoleta.ParamByName('DATABOLETA').AsDateTime := edtDataEfetiva.Date;
            QryInsertBoleta.ParamByName('IDFORCLI').AsInteger    := wIdForCli;
            //Al_14  - Ricardo - 04/07/2005
            QryInsertBoleta.ParamByName('TIPMOVBOLETA').AsString := 'DTG';
            QryInsertBoleta.ExecSQL;
         end;
         QryBoleta.Close;

         // Update no Status de Lançamento
         QryUpdOperacaoDireitoStatus.Close;
         QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := wIdOperacaoDireito;
         QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'L';
         QryUpdOperacaoDireitoStatus.ExecSQL;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                          qryFilhaIDINVESTIMENTO.AsInteger, 2, wIdNovaOperacao, -1,
                          iTipoOperacao,
                          qryFilhaIDCARTEIRAINVEST.AsInteger, 0{IDCARTEIRAGERENC},
                          -1, -1, -1, -1, -1,
                          edtDataEfetiva.Date,
                          0{wVlrOperacao},qryFilhaQTDEDIREITO.AsFloat,
                          wQtdCotaini,
                          0 {Variacao}, 0{Juros}, 0, 0, 0, 0, 0, 0, 0,
                          'A', 'A', qryFilhaIDLOTE.AsString,
                          QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                          //Al_14 - Ricardo - 04/05/2005
                          sDescrInvest,'OPE', '1', '', True,
                          -1,
                          iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
             MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                    'Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         if not OperComum.AtualizaSaldos(wQtdCotaini,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

{         if qryFilhaIDMOTIVOBLOQUEIO.AsInteger = -1 then
            sTipoCustodia := 'C'
         else
            sTipoCustodia := 'Y';  //BLOQUEADA}

         //Al_14 - Ricardo - 04/05/2005            
         sTipoCustodia := 'I'; //Inicialização

         OperacaoInvest.InsereCustodia(qryFilhaIDCARTEIRAINVEST.AsInteger,
                                       qryFilhaIDINVESTIMENTO.AsInteger,
                                       qryIDCUSTODIANTE.AsInteger,
                                       qryFilhaIDMOTIVOBLOQUEIO.AsInteger, wIdNovaOperacao,
                                       -1,
                                       qryFilhaIDLOTE.AsString, sTipoCustodia[1],
                                       dDataAGE, qryFilhaQTDEDIREITO.AsFloat,iIdHistCustodia);

         OperacaoInvest.AtualizaSaldosCustodia;

         ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                              ' FlgCustodia         = NULL '+
                              ' Where IdHistCartInv = '+IntToStr(iIdHistCartInv));

         qryFilha.Next;
      end;

      // Caso o Banco esteja em Transacao Commita
      If DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.Commit;

   except on E: Exception do
      begin
         qryFilha.EnableControls;
         //qryFilha.EnableControls;
         If DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'no lançamento da operação!'#13+
                E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         Result := False;
         Exit;
      end;
   end;
   Result := True;
   qryFilha.DisableControls;
end;

function TfrmCadOperAGE.ProcCisao : boolean;
Var
   sDescrInvest : String;
   wValorInvestOrigem : Double;
   wIdOperCust, idHistCartDest, idHistCartOrig, iInvestOrigem: Integer;
begin
   Try
     wValorInvestOrigem := 0;
     if not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;
      with QryBuscaTipoOper do
      begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('TIPOOPERACAO').asInteger := iTipoOperacao;   // Ana: Alimentado a partir do MontaSelect
         Open;
      end;

      wNumDoc := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                 LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

      iIDBOLSAVALORES := pRPI.IDBVSP;

      OperacaoInvest.RetParamOperDireito(wIdOperacaoDireito, RO, qry.DatabaseName);

      qry.First;
      while not qry.EOF do   // Ana: Percorre query Origem - Para Cisão só pode ser 1
      begin
         if qryQTDEDIREITO.AsFloat = 0 then
         begin
            qry.Next;
            Continue;
         end;

         dDataAGE := qryDATAREFERENCIA.AsDateTime;

         // Dados do Investimento
         QryBuscaInvestimento.Close;
         QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger := qryIDINVESTIMENTO.AsInteger;
         QryBuscaInvestimento.Open;
         if QryBuscaInvestimento.IsEmpty then
         begin
            MsgDlg( 'Investimento não foi encontrado. ','Mensagem do Sistema ', MtError,[MbOk],0);
            QryBuscaInvestimento.Free;
            Exit;
         end;
         // Busca Saldos na Carteira
         wSaldoQtd:=0;
         //AL_4
         OperComum.BuscaTodosSaldosInvestLote(
            qryIDCARTEIRAINVEST.AsInteger, 0,
            qryIDINVESTIMENTO.AsInteger, high(integer),-1,
            qryIDLOTE.AsString,
            DateToStr(qryOperacaoDireitoDATAEX.AsDateTime), -1,
            wSaldoQtd, wSaldoVlr, wSaldoInutil, wSaldoInutil, wSaldoAqui,
            wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
            wSaldoIRApu,  wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
            wSaldoInutil, wSaldoInutil, wSaldoInutil);

         wIdForCli   := Qry.FieldByName('IDCUSTODIANTE').AsInteger;

         // Gera Novo Id de Operacao
         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         wVlrOperacao:= wSaldoVlr;
         wValorInvestOrigem := wVlrOperacao;
         iInvestOrigem := qryIDINVESTIMENTO.AsInteger;

         iInc        := 1;
         wDataVenc   := edtDataEfetiva.Date;
         While iInc  <=  QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger Do
         Begin
            wDataVenc   := wDataVenc + 1;
            While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
              wDataVenc := wDataVenc + 1;   // Achar o próximo dia útil
            iInc        := iInc + 1;
         End;

         wVlrIR      := 0;
         wVlrIRProv  := 0;

         GravaOperacaoInvest(wIdNovaOperacao,pRPI.MOECODIGO,Sistema.IdModulo,
                             Sistema.IdEmpresa,qryIDINVESTIMENTO.AsInteger,
                             qryIDCARTEIRAINVEST.AsInteger, 2,
                             iTipoOperacao,wIdForCli,
                             qryIDCUSTODIANTE.AsInteger,wIdOperacaoDireito, 0,
                             edtDataEfetiva.Date,wDataVenc,wNumDoc,'F','L',
                             qryIDLOTE.AsString,qryQTDEDIREITO.AsFloat,
                             0,wVlrOperacao,0,0,0,0);

         OperComum.LimpaParametros(QryUpdOperDiretoXInv);
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAOINVEST').AsInteger  := wIdNovaOperacao;
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAODIREITO').AsInteger := wIdOperacaoDireito;
         QryUpdOperDiretoXInv.ParamByName('IDINVESTIMENTO').AsInteger    := qryIDINVESTIMENTO.AsInteger;
         QryUpdOperDiretoXInv.ParamByName('ORIGDEST').AsString           := 'O';
         QryUpdOperDiretoXInv.ExecSQL;

         ExecutarQuery(QryAux,'Update Operacaoinvest Set '+
                              ' ORIGDEST           = ''O'''+
                              'Where IDOPERACAOINVEST = ' + IntToStr(wIdNovaOperacao));

         // Inclui dados na Tabela BOLETA
         QryBoleta.Close;
         QryBoleta.ParamByName('IDBOLETA').AsString := wNumDoc;
         QryBoleta.Open;
         If QryBoleta.IsEmpty then
         begin
            QryInsertBoleta.Close;
            QryInsertBoleta.ParamByName('IDBOLETA').AsString     := wNumDoc;
            QryInsertBoleta.ParamByName('STATUS').AsString       := 'F';
            //AL_5 - Ricardo - 15/10/2004
            QryInsertBoleta.ParamByName('TIPMOVBOLETA').AsString := 'DCI';
            QryInsertBoleta.ParamByName('DATABOLETA').AsDateTime := edtDataEfetiva.Date;
            QryInsertBoleta.ParamByName('IDFORCLI').AsInteger    := wIdForCli;
            QryInsertBoleta.ExecSQL;
         end;
         QryBoleta.Close;

         qry.Next;
      end;

      qryFilha.First;
      while not qryFilha.EOF do
      begin
         if qryFilhaQTDEDIREITO.AsFloat = 0 then
         begin
            qryFilha.Next;
            Continue;
         end;

         // Busca Saldos na Carteira
         wSaldoQtd:=0;
         //AL_1
         //AL_4
         OperComum.BuscaTodosSaldosInvestLote(
            qryFilhaIDCARTEIRAINVEST.AsInteger, 0{IDCARTEIRAGERENC},
            qryFilhaIDINVESTIMENTO.AsInteger, high(integer),-1,
            qryFilhaIDLOTE.AsString,
            DateToStr(qryOperacaoDireitoDATAEX.AsDateTime), -1,
            wSaldoQtd, wSaldoVlr, wSaldoInutil, wSaldoInutil, wSaldoAqui,
            wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
            wSaldoIRApu,  wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
            wSaldoInutil, wSaldoInutil, wSaldoInutil);

         // Dados do Investimento
         QryBuscaInvestimento.Close;
         QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger := qryFilhaIDINVESTIMENTO.AsInteger;
         QryBuscaInvestimento.Open;
         if QryBuscaInvestimento.IsEmpty then
         begin
            MsgDlg( 'Investimento não foi encontrado. ','Mensagem do Sistema ', MtError,[MbOk],0);
            QryBuscaInvestimento.Free;
            Exit;
         end;

         // Se Tipo de Credor for CUSTODIANTE
         if (QryBuscaTipoOper.FieldByName('TIPCREDOR').AsString = 'CT') then
         begin
            // Transforma Custodiante em Fornecedor - Cliente
            try
               if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                  Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False) // Cliente
               else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                  Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                             Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado
            wIdForCli   := Qry.FieldByName('IDCUSTODIANTE').AsInteger;

//AL_5 - RICARDO - 18/10/2004
{            wNumDoc     := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));}

            QryBuscaBolsaValores.Close;
            QryBuscaBolsaValores.ParamByName('IDCUSTODIANTE').AsInteger := wIdForCli;
            QryBuscaBolsaValores.Open;
            if QryBuscaBolsaValores.IsEmpty then
               iIDBOLSAVALORES := pRPI.IDBVSP
            else
               iIDBOLSAVALORES := QryBuscaBolsaValores.FieldByName('IDBOLSAVALORES').AsInteger;

         // Se Tipo de Credor for EMISSOR
         end else
         begin
            // Transforma Emissor em Fornecedor - Cliente
            try
               if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                  Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False) // Cliente
               else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                  Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                             Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado
            wIdForCli   := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;

//AL_5 - RICARDO - 18/10/2004
{            wNumDoc     := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));}

            iIDBOLSAVALORES := QryBuscaInvestimento.FieldByName('IDBOLSAVALORES').AsInteger;
         end;

         // Inicia outros Dados
         if qryFilhaIDINVESTIMENTO.AsInteger = qryIDINVESTIMENTO.AsInteger then
            wVlrOperacao := wValorInvestOrigem
         else
            wVlrOperacao := 0;

         iInc        := 1;
         wDataVenc   := edtDataEfetiva.Date;
         While iInc  <=  QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger Do
         Begin
            wDataVenc   := wDataVenc + 1;
            While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
              wDataVenc := wDataVenc + 1;   // Achar o próximo dia útil
            iInc        := iInc + 1;
         End;

         wVlrIR      := 0;
         wVlrIRProv  := 0;

         // Gera Novo Id de Operacao
         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         GravaOperacaoInvest(wIdNovaOperacao, pRPI.MOECODIGO, Sistema.IdModulo,
                             Sistema.IdEmpresa,qryFilhaIDINVESTIMENTO.AsInteger,
                             qryFilhaIDCARTEIRAINVEST.AsInteger, 2,
                             iTipoOperacao,wIdForCli,
                             qryFilhaIDCUSTODIANTE.AsInteger,
                             wIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date,wDataVenc,wNumDoc,'F','L',
                             qryFilhaIDLOTE.AsString,qryFilhaQTDEDIREITO.AsFloat, 0,
                             wVlrOperacao,0,0,0,qryFilhaPERCENTUALINV.AsFloat);

         OperComum.LimpaParametros(QryUpdOperDiretoXInv);
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAOINVEST').AsInteger  := wIdNovaOperacao;
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAODIREITO').AsInteger := wIdOperacaoDireito;
         QryUpdOperDiretoXInv.ParamByName('IDINVESTIMENTO').AsInteger    := qryFilhaIDINVESTIMENTO.AsInteger;
         QryUpdOperDiretoXInv.ParamByName('ORIGDEST').AsString           := 'D';
         QryUpdOperDiretoXInv.ExecSQL;

         //Al_5 - Ricardo - 19/10/2004
         if (DMRendaVariavel.QryVerInvestOrigDest.Locate('IDINVESTIMENTO',
                  qryFilha.FieldByName('IDINVESTIMENTO').AsInteger, [])) then
         begin
            ExecutarQuery(QryAux,'Update Operacaoinvest Set '+
                                 ' ORIGDEST           = ''D'''+
                                 'Where IDOPERACAOINVEST = ' + IntToStr(wIdNovaOperacao));
            qryFilha.Next;
            Continue;
         end;   

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         ExecutaQuery(QryInsertOprAcao,
            'INSERT INTO OPRACAO (IDOPERACAOINVEST, IDBOLSAVALORES, IDACAO, IDEMISSOR) '+
            'VALUES                                                  '+
            '('+QuotedStr(IntToStr(wIdNovaOperacao))+', '+
                QuotedStr(IntToStr(iIDBOLSAVALORES))+', '+   // Ana: Ver se não vai dar erro de Constraint quando IdForCli não for uma Bolsa
                QuotedStr(qryFilhaIDINVESTIMENTO.AsString)+', '+
                QuotedStr(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsString)+
            ')');

         If Trim(qryFilhaDESCINVESTIMENTO.AsString) = '' Then
            sDescrInvest := qryFilhaACAO.AsString
         Else
            sDescrInvest := qryFilhaDESCINVESTIMENTO.AsString;

         // Update no Status de Lançamento
         QryUpdOperacaoDireitoStatus.Close;
         QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := wIdOperacaoDireito;
         QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'L';
         QryUpdOperacaoDireitoStatus.ExecSQL;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
            qryFilhaIDINVESTIMENTO.AsInteger, 2, wIdNovaOperacao, -1,
            iTipoOperacao,
            qryFilhaIDCARTEIRAINVEST.AsInteger, 0{IDCARTEIRAGERENC},
            -1, -1, -1, -1, -1,
            edtDataEfetiva.Date,
            wVlrOperacao, qryFilhaQTDEDIREITO.AsFloat,
            wQtdCotaini,
            0 {Variacao}, 0 {Juros}, wVlrIRProv, wVlrIR, 0, 0, 0, 0, 0,
            'A', 'A', qryFilhaIDLOTE.AsString,
            QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / Acréscimo de '+
            sDescrInvest,'OPE', '1', '', True,
            -1,
            iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
            MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Exit;
         end;

         if not OperComum.AtualizaSaldos(wQtdCotaini,-1) then
         begin
            MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                   'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
            Exit;
         end;

         idHistCartDest := iIdHistCartInv;

         wIdOperCust    := LeUltRegistro(Nil,'OPERCUSTODIA');

         If Not OperacaoInvest.AlimentaOperCustodia(wIdOperCust,
                                             -1,
                                             -1,
                                             idHistCartDest,
                                             idHistCartDest,
                                             qryFilha.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             qryFilha.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             qryFilha.FieldByName('IDINVESTIMENTO').AsInteger,
                                             qryFilha.FieldByName('IDCUSTODIANTE').AsInteger,
                                             qryFilha.FieldByName('IDCUSTODIANTE').AsInteger,
                                             OperComum.IIF(qryFilha.FieldByName('IDMOTIVOBLOQUEIO').IsNull,-1,qryFilha.FieldByName('IDMOTIVOBLOQUEIO').AsInteger),
                                             OperComum.IIF(qryFilha.FieldByName('IDMOTIVOBLOQUEIO').IsNull,-1,qryFilha.FieldByName('IDMOTIVOBLOQUEIO').AsInteger),
                                             qryFilha.FieldByName('QTDEDIREITO').AsFloat,
                                             edtDataEfetiva.DateTime,
                                             qryFilha.FieldByName('IDLOTE').AsString,
                                             wNumDoc,
                                             iPlanPrevCtbPatro) Then
         begin
             MsgDlg('Erro ao Alimentar a Custódia, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         ExecutarQuery(QryAux,'Update Operacaoinvest Set '+
                              ' ORIGDEST           = ''D'','+
                              ' IDOPERCUSTODIA  = ' + IntToStr(wIdOperCust) + ' ' +
                              'Where IDOPERACAOINVEST = ' + IntToStr(wIdNovaOperacao));

         if qryFilha.FieldByName('IDMOTIVOBLOQUEIO').AsInteger = -1 then
            sTipoCustodia := 'C'
         else
            sTipoCustodia := 'Y';  //AUMENTA BLOQUEADA

         If Not OperacaoInvest.InsereCustodia(
                                       qryFilha.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       qryFilha.FieldByName('IDINVESTIMENTO').AsInteger,
                                       qryFilha.FieldByName('IDCUSTODIANTE').AsInteger,
                                       OperComum.IIF(qryFilha.FieldByName('IDMOTIVOBLOQUEIO').IsNull,-1,
                                                        qryFilha.FieldByName('IDMOTIVOBLOQUEIO').AsInteger),
                                       wIdNovaOperacao, wIdOperCust,
                                       qryFilha.FieldByName('IDLOTE').AsString,
                                       sTipoCustodia[1],
                                       edtDataEfetiva.Date,
                                       qryFilha.FieldByName('QTDEDIREITO').AsFloat,
                                       iIdHistCustodia) Then
         begin
             MsgDlg('Erro ao Atualizar a Custódia, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         OperacaoInvest.AtualizaSaldosCustodia;

         qryFilha.Next;
      end;

      qry.Locate('IDINVESTIMENTO;IDCARTEIRAINVEST;IDCUSTODIANTE;IDMOTIVOBLOQUEIO;IDLOTE',
                 VarArrayOf([Investimento, Carteira, Custodiante,  Bloqueio, Lote]),[loCaseInsensitive]);
      qryFilha.Locate('IDINVESTIMENTO;IDCARTEIRAINVEST;IDCUSTODIANTE;IDMOTIVOBLOQUEIO;IDLOTE',
                 VarArrayOf([Investimento, Carteira, Custodiante,  Bloqueio, Lote]),[loCaseInsensitive]);

      // Caso o Banco esteja em Transacao Commita
      If DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.Commit;

   finally
      qry.EnableControls;
      qryFilha.EnableControls;
   end;
   Result := True;
   qryFilha.DisableControls;
end;

function TfrmCadOperAGE.ProcRestituicaoCap : boolean;
begin
   try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      qryFilha.ControlsDisabled;
      qryFilha.First;
      While Not qryFilha.Eof Do
      Begin
         QryBuscaInvestimento.Close;
         QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger := qryFilhaIDINVESTIMENTO.AsInteger;
         QryBuscaInvestimento.Open;

         // Se Tipo de Credor for CUSTODIANTE
         if (QryBuscaTipoOper.FieldByName('TIPCREDOR').AsString = 'CT') then
         begin
            // Transforma Custodiante em Fornecedor - Cliente
            try
               if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                  Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False) // Cliente
               else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                  Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                             Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado
            wIdForCli   := Qry.FieldByName('IDCUSTODIANTE').AsInteger;

            wNumDoc     := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

            QryBuscaBolsaValores.Close;
            QryBuscaBolsaValores.ParamByName('IDCUSTODIANTE').AsInteger := wIdForCli;
            QryBuscaBolsaValores.Open;
            //AL_5 - Ricardo - 05/10/2004
            if QryBuscaBolsaValores.IsEmpty then
            begin
               If Not qryAcoesxBolsa.IsEmpty then
                  iIDBOLSAVALORES := qryAcoesxBolsaIDBOLSAVALORES.AsInteger;
            end
            else
               iIDBOLSAVALORES := QryBuscaBolsaValores.FieldByName('IDBOLSAVALORES').AsInteger;

            If iIDBOLSAVALORES  = 0 then
               iIDBOLSAVALORES := pRPI.IDBVSP;
         // Se Tipo de Credor for EMISSOR
         end else
         begin
            // Transforma Emissor em Fornecedor - Cliente
            try
               if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                  Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False) // Cliente
               else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                  Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                             Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado
            wIdForCli   := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;

            wNumDoc     := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                              LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

            iIDBOLSAVALORES := QryBuscaInvestimento.FieldByName('IDBOLSAVALORES').AsInteger;
         end;

         iInc        := 1;
         wDataVenc   := edtDataEfetiva.Date;
         While iInc  <=  QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger Do
         Begin
            wDataVenc   := wDataVenc + 1;
            While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
              wDataVenc := wDataVenc + 1;   // Achar o próximo dia útil
            iInc        := iInc + 1;
         End;

         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         GravaOperacaoInvest(wIdNovaOperacao,QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,Sistema.IdModulo,
                             Sistema.IdEmpresa,qryFilhaIDINVESTIMENTO.AsInteger,qryFilhaIDCARTEIRAINVEST.AsInteger, 2,
                             iTipoOperacao,wIdForCli,qryIDCUSTODIANTE.AsInteger,wIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date,wDataVenc,wNumDoc,'F','L',qryFilhaIDLOTE.AsString,
                             0{qryFilhaQTDEDIREITO.AsFloat}, RO.PARIDADE,
                             qryFilhaVALOREXERCIDO.AsFloat,0,0,0,RO.PERCENTUAL);

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := iIDBOLSAVALORES;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := qryFilhaIDINVESTIMENTO.AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
         QryInsertOprAcao.ExecSQL;
         // Inclui dados na Tabela BOLETA
         QryBoleta.Close;
         QryBoleta.ParamByName('IDBOLETA').AsString := wNumDoc;
         QryBoleta.Open;
         If QryBoleta.IsEmpty then
         begin
            QryInsertBoleta.Close;
            QryInsertBoleta.ParamByName('IDBOLETA').AsString     := wNumDoc;
            QryInsertBoleta.ParamByName('STATUS').AsString       := 'F';
            //AL_5 - Ricardo - 05/10/2004
            QryInsertBoleta.ParamByName('TIPMOVBOLETA').AsString := 'DRS';
            QryInsertBoleta.ParamByName('DATABOLETA').AsDateTime := edtDataEfetiva.Date;
            QryInsertBoleta.ParamByName('IDFORCLI').AsInteger    := wIdForCli;
            QryInsertBoleta.ExecSQL;
         end;
         QryBoleta.Close;

         // Update no Status de Lançamento
         QryUpdOperacaoDireitoStatus.Close;
         QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := wIdOperacaoDireito;
         QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'L';
         QryUpdOperacaoDireitoStatus.ExecSQL;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                qryFilhaIDINVESTIMENTO.AsInteger, 2, wIdNovaOperacao, -1,
                iTipoOperacao,
                qryFilhaIDCARTEIRAINVEST.AsInteger, 0{IDCARTEIRAGERENC},
                -1, -1, -1, -1, -1,
                edtDataEfetiva.Date,
                qryFilhaVALOREXERCIDO.AsFloat{wVlrOperacao},
                0 {qryFilhaQTDEDIREITO.AsFloat},
                wQtdCotaini,
                0 {Variacao}, 0{Juros}, 0, 0, 0, 0, 0, 0, 0,
                QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                qryFilhaIDLOTE.AsString,
                QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                qryFilhaAcao.AsString,'OPE', '1', '', True,
                -1,
                iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
             MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                    'Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         QryUpdCustoHist.Close;
         QryUpdCustoHist.ParamByName('MOVIMAQUI').AsFloat          := qryFilhaVLRCUSTO.AsFloat*-1;
         QryUpdCustoHist.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryUpdCustoHist.ExecSQL;
         QryUpdCustoHist.Close;

         if not OperComum.AtualizaSaldos(wQtdCotaini,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;
         // Atualizar Custodia
         if QryBuscaTipoOper.FieldByName('TIPOCUSTODIA').AsString <> 'N' then
            wIdOperCust := wIdNovaOperacao
         else
            wIdOperCust := -1;

         if not OperacaoInvest.CadastraCustodia(wIdOperCust) then
         begin
            MsgDlg('Erro ao Atualizar Custodia, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         If wIdOperCust <> -1 Then
            ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                                 ' FlgCustodia         = NULL '+
                                 ' Where IdHistCartInv = '+IntToStr(iIdHistCartInv));

         wVlrTotOperacao := wVlrTotOperacao + qryFilhaVALOREXERCIDO.AsFloat;
         qryFilha.Next;
      end;
      // Parametro para Contabilidade e CAP/CAR
      wTipoRecDesBol := '';
      bCriaLancto := True;
      wPlano := -1;
      wPlanilha := -1;
      wDocumCont := -1;
      wMensErro := '';

      if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                              qryIDINVESTIMENTO.AsInteger,iTipoOperacao,
                              wIdNovaOperacao,wIdForCli,qryIDCARTEIRAINVEST.AsInteger,
                              QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                              '',qryIDLOTE.AsString,'',wNumDoc,'R',wTipoRecDesBol,bCriaLancto,
                              wVlrTotOperacao,wVlrTotOperacao,edtDataEfetiva.Date,
                              wDataVenc,wPlano,wPlanilha,wDocumCont,wMensErro) <> 0 then
      begin
         If DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'no lançamento contábil','Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
         Exit;
      end;
      // Caso o Banco esteja em Transacao Commita
      If DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.Commit;

   except on E: Exception do
      begin
         qryFilha.EnableControls;
         //qryFilha.EnableControls;
         If DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'no lançamento da operação!'#13+
                E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         Result := False;
         Exit;
      end;
   end;
   Result := True;
   qryFilha.DisableControls;
end;

function TfrmCadOperAGE.ProcReorganizacao : boolean;
begin
   try
     // Parametro para Contabilidade e CAP/CAR
     wTipoRecDesBol := '';
     bCriaLancto := True;
     wPlano      := -1;
     wPlanilha   := -1;
     wDocumCont  := -1;
     wMensErro   := '';

     if not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

      with QryBuscaTipoOper do
      begin   // Ana: Buscar essa query de FProcOperacao
         Close;
         if not(Prepared) then Prepare;
         ParamByName('TIPOOPERACAO').asInteger := iTipoOperacao;   // Ana: Alimentado a partir do MontaSelect
         Open;
      end;

      Qry.First;

      QryBuscaInvestimento.Close;
      QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger := qryIDINVESTIMENTO.AsInteger;
      QryBuscaInvestimento.Open;

      // Se Tipo de Credor for CUSTODIANTE
      if (QryBuscaTipoOper.FieldByName('TIPCREDOR').AsString = 'CT') then
      begin
         // Transforma Custodiante em Fornecedor - Cliente
         try
            if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
               Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                        Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                        '','','','','C',False) // Cliente
            else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
               Documento.ForCli.Inserir(Qry.FieldByName('IDCUSTODIANTE').AsInteger,
                                          Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                        '','','','','F',False); // Fornecedor
         Except  // Função gerava um Abort quando o Fornecedor
         End;    // já estava cadastrado
         wIdForCli   := Qry.FieldByName('IDCUSTODIANTE').AsInteger;

         wNumDoc     := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                           LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

         QryBuscaBolsaValores.Close;
         QryBuscaBolsaValores.ParamByName('IDCUSTODIANTE').AsInteger := wIdForCli;
         QryBuscaBolsaValores.Open;
         if QryBuscaBolsaValores.IsEmpty then
            iIDBOLSAVALORES := pRPI.IDBVSP
         else
            iIDBOLSAVALORES := QryBuscaBolsaValores.FieldByName('IDBOLSAVALORES').AsInteger;

      // Se Tipo de Credor for EMISSOR
      end else
      begin

         // Transforma Emissor em Fornecedor - Cliente
         try
            if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
               Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                        Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                        '','','','','C',False) // Cliente
            else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
               Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                          Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                        '','','','','F',False); // Fornecedor
         Except  // Função gerava um Abort quando o Fornecedor
         End;    // já estava cadastrado
         wIdForCli   := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;

         wNumDoc     := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                           LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

         iIDBOLSAVALORES := QryBuscaInvestimento.FieldByName('IDBOLSAVALORES').AsInteger;
      end;

      OperacaoInvest.RetParamOperDireito(wIdOperacaoDireito, RO, qry.DatabaseName);

      while not qry.EOF do   // Ana: Percorre query Origem - Para Cisão só pode ser 1
      begin
         if qryQTDEDIREITO.AsFloat = 0 then
         begin
            qry.Next;
            Continue;
         end;

         dDataAGE := qryDATAREFERENCIA.AsDateTime;

         wIdForCli       := Qry.FieldByName('IDCUSTODIANTE').AsInteger;

         // Gera Novo Id de Operacao
         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         iInc        := 1;
         wDataVenc   := edtDataEfetiva.Date;
         While iInc  <=  QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger Do
         Begin
            wDataVenc   := wDataVenc + 1;
            While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
              wDataVenc := wDataVenc + 1;   // Achar o próximo dia útil
            iInc        := iInc + 1;
         End;

         wVlrIR      := 0;
         wVlrIRProv  := 0;

         GravaOperacaoInvest(wIdNovaOperacao,
                             pRPI.MOECODIGO,
                             Sistema.IdModulo, Sistema.IdEmpresa,
                             qryIDINVESTIMENTO.AsInteger,
                             qryIDCARTEIRAINVEST.AsInteger,
                             2, iTipoOperacao, wIdForCli,
                             qryIDCUSTODIANTE.AsInteger,
                             wIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date,wDataVenc,
                             wNumDoc,'F','L',
                             qryIDLOTE.AsString,qryQTDEDIREITO.AsFloat,0,
                             QryVALOREXERCIDO.AsFloat,0,0,0,0);

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         ExecutaQuery(QryInsertOprAcao,
            'INSERT INTO OPRACAO (IDOPERACAOINVEST, IDBOLSAVALORES, IDACAO, IDEMISSOR) '+
            'VALUES                                                  '+
            '('+QuotedStr(IntToStr(wIdNovaOperacao))+', '+
                QuotedStr(IntToStr(iIDBOLSAVALORES))+', '+   // Ana: Ver se não vai dar erro de Constraint quando IdForCli não for uma Bolsa
                QuotedStr(qryIDINVESTIMENTO.AsString)+', '+
                QuotedStr(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsString)+
            ')');

         // Inclui dados na Tabela BOLETA
         QryBoleta.Close;
         QryBoleta.ParamByName('IDBOLETA').AsString := wNumDoc;
         QryBoleta.Open;
         If QryBoleta.IsEmpty then
         begin
            QryInsertBoleta.Close;
            QryInsertBoleta.ParamByName('IDBOLETA').AsString     := wNumDoc;
            QryInsertBoleta.ParamByName('STATUS').AsString       := 'F';
            QryInsertBoleta.ParamByName('DATABOLETA').AsDateTime := edtDataEfetiva.Date;
            QryInsertBoleta.ParamByName('IDFORCLI').AsInteger    := wIdForCli;
            QryInsertBoleta.ExecSQL;
         end;
         QryBoleta.Close;

         // Update no Status de Lançamento
         QryUpdOperacaoDireitoStatus.Close;
         QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := wIdOperacaoDireito;
         QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'L';
         QryUpdOperacaoDireitoStatus.ExecSQL;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           qryIDINVESTIMENTO.AsInteger, 2,
                                           wIdNovaOperacao, -1, iTipoOperacao,
                                           qryIDCARTEIRAINVEST.AsInteger, 0{IDCARTEIRAGERENC},
                                           -1, -1, -1, -1, -1,
                                           edtDataEfetiva.Date,
                                           QryVALOREXERCIDO.AsFloat,
                                           qryQTDEDIREITO.AsFloat,
                                           wQtdCotaini,
                                            0 {Variacao}, 0{Juros}, 0{IR Provisão}, 0{IR}, 0, 0, 0, 0, 0,
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                                           QryIDLOTE.AsString,
                                           QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / Baixa de '+
                                           qryDESCINVESTIMENTO.AsString,'OPE', '1', '', True,
                                           -1, iPlanPrevCtbPatro, iIdHistCartInv) then
         begin
            MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Abort;
         end;

         if not OperComum.AtualizaSaldos(wQtdCotaini,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Abort;
         end;

         ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                              ' FlgCustodia         = NULL '+
                              ' Where IdHistCartInv = '+IntToStr(iIdHistCartInv));

         If OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                       qryIDINVESTIMENTO.AsInteger, 2,
                                       wIdNovaOperacao, -1,
                                       iTipoOperacao,
                                       qryIDCARTEIRAINVEST.AsInteger,
                                        0{IDCARTEIRAGERENC},
                                       -1, -1, -1, -1, -1,edtDataEfetiva.Date,
                                       QryVALOREXERCIDO.AsFloat,
                                       qryQTDEDIREITO.AsFloat,
                                       wQtdCotaini,
                                       0, 0, 0, 0, 0, 0, 0, 0, 0, 'L' {Movimento},
                                       QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString,
                                       '' {Lote},
                                       'LUCRO/PREJUIZO NA VENDA'+' - '+
                                       qryDESCINVESTIMENTO.AsString,
                                       'LUC', '', '', True,
                                       -1, iPlanPrevCtbPatro, iIdHistCartInv) Then
         Begin
            // Alimenta os Saldos da Carteira
            If Not OperComum.AtualizaSaldos(wQtdCotaini,-1) Then
            Begin
               MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                      'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
               Abort;
            End;
            // Caso Operacao de Venda (NATURMOV = 'D') MArca o Regsitro de Lucro Com Flag (1) Para ser Recalculado
            ExecutaQuery(QryAux,'UPDATE HISTCARTINV SET FLGCALCSALDO = ''2'' '+
                                'WHERE 	(TIPMOVCARTINV    = ''LUC'') AND '+
                                '      	(IDOPERACAOINVEST = '+
                                QuotedStr(IntToStr(wIdNovaOperacao))+')');
            QryAux.Close;

            // Alimenta os Saldos da Carteira
            If Not OperComum.AtualizaSaldos(wQtdCotaini,-1) Then
            Begin
               MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                      'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
               Abort;
            End;
         End;

         // Atualizar Custodia
         if QryBuscaTipoOper.FieldByName('TIPOCUSTODIA').AsString  <> 'N' then
            wIdOperCust := wIdNovaOperacao
         else
            wIdOperCust := -1;

         if not OperacaoInvest.CadastraCustodia(wIdOperCust) then
         begin
            MsgDlg('Erro ao Atualizar Custodia, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',
                   MtError,[MbOk],0);
            Abort;
         end;

//         OperacaoInvest.AtualizaSaldosCustodia;
         If wIdOperCust <> -1 Then
            ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                                 ' FlgCustodia         = NULL '+
                                 ' Where IdHistCartInv = '+IntToStr(iIdHistCartInv));

         // Contabiliza Operação
         If OperComum.LancaOperRFRV(Sistema.IdEmpresa, 79, 2,
                                 qryIDINVESTIMENTO.AsInteger,
                                 iTipoOperacao,
                                 wIdNovaOperacao,
                                 wIdForCli,
                                 qryIDCARTEIRAINVEST.AsInteger,
                                 QryBuscaInvestimentoMOECODIGO.AsInteger,
                                 QryBuscaInvestimentoCODTIPOACAO.AsString,
                                 QryIDLOTE.AsString,
                                 '',
                                 wNumDoc,
                                 'R', wTipoRecDesBol, bCriaLancto,
                                 QryVALOREXERCIDO.AsFloat,
                                 QryVALOREXERCIDO.AsFloat,
                                 edtDataEfetiva.Date,
                                 wDataVenc,wPlano,wPlanilha,wDocumCont,wMensErro) <> 0 then
         begin
            MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                   'no lançamento contábil','Mensagem do Sistema ',mtWarning,[mbOK],0);
            Abort;
         end;

         qry.Next;
      end;

//COMPRA
      wTipoRecDesBol := '';

      QryBuscaInvestimento.Close;
      QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger := qryFilhaIDINVESTIMENTO.AsInteger;
      QryBuscaInvestimento.Open;

      with QryBuscaTipoOper do
      begin   // Ana: Buscar essa query de FProcOperacao
         Close;
         if not(Prepared) then Prepare;
         ParamByName('TIPOOPERACAO').asInteger := 1; {Compra}
         Open;
      end;

      // Se Tipo de Credor for CUSTODIANTE
      if (QryBuscaTipoOper.FieldByName('TIPCREDOR').AsString = 'CT') then
      begin
         // Transforma Custodiante em Fornecedor - Cliente
         try
            if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
               Documento.ForCli.Inserir(qryFilha.FieldByName('IDCUSTODIANTE').AsInteger,
                                        Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                        '','','','','C',False) // Cliente
            else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
               Documento.ForCli.Inserir(qryFilha.FieldByName('IDCUSTODIANTE').AsInteger,
                                          Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                        '','','','','F',False); // Fornecedor
         Except  // Função gerava um Abort quando o Fornecedor
         End;    // já estava cadastrado
         wIdForCli   := qryFilha.FieldByName('IDCUSTODIANTE').AsInteger;

         QryBuscaBolsaValores.Close;
         QryBuscaBolsaValores.ParamByName('IDCUSTODIANTE').AsInteger := wIdForCli;
         QryBuscaBolsaValores.Open;
         if QryBuscaBolsaValores.IsEmpty then
            iIDBOLSAVALORES := pRPI.IDBVSP
         else
            iIDBOLSAVALORES := QryBuscaBolsaValores.FieldByName('IDBOLSAVALORES').AsInteger;

      // Se Tipo de Credor for EMISSOR
      end else
      begin

         // Transforma Emissor em Fornecedor - Cliente
         try
            if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
               Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                        Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                        '','','','','C',False) // Cliente
            else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
               Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                          Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                        '','','','','F',False); // Fornecedor
         Except  // Função gerava um Abort quando o Fornecedor
         End;    // já estava cadastrado
         wIdForCli   := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;

         iIDBOLSAVALORES := QryBuscaInvestimento.FieldByName('IDBOLSAVALORES').AsInteger;
      end;

      OperacaoInvest.RetParamOperDireito(wIdOperacaoDireito, RO, qry.DatabaseName);

      qryFilha.First;
      while not qryFilha.EOF do
      begin
         if qryFilhaQTDEDIREITO.AsFloat = 0 then
         begin
            qry.Next;
            Continue;
         end;

         dDataAGE        := qryDATAREFERENCIA.AsDateTime;

         wIdForCli       := qryFilha.FieldByName('IDCUSTODIANTE').AsInteger;

         // Gera Novo Id de Operacao
         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         iInc        := 1;
         wDataVenc   := edtDataEfetiva.Date;
         While iInc  <=  QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger Do
         Begin
            wDataVenc   := wDataVenc + 1;
            While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
              wDataVenc := wDataVenc + 1;   // Achar o próximo dia útil
            iInc        := iInc + 1;
         End;

         wVlrIR      := 0;
         wVlrIRProv  := 0;

         GravaOperacaoInvest(wIdNovaOperacao,
                             pRPI.MOECODIGO,
                             Sistema.IdModulo, Sistema.IdEmpresa,
                             qryFilhaIDINVESTIMENTO.AsInteger,
                             qryFilhaIDCARTEIRAINVEST.AsInteger,
                             2, 1 {Compra}, wIdForCli,
                             qryFilhaIDCUSTODIANTE.AsInteger,
                             wIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date,wDataVenc,
                             wNumDoc,'F','L',
                             qryFilhaIDLOTE.AsString,qryFilhaQTDEDIREITO.AsFloat,0,
                             qryFilhaVALOREXERCIDO.AsFloat,0,0,0,0);

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         ExecutaQuery(QryInsertOprAcao,
            'INSERT INTO OPRACAO (IDOPERACAOINVEST, IDBOLSAVALORES, IDACAO, IDEMISSOR) '+
            'VALUES                                                  '+
            '('+QuotedStr(IntToStr(wIdNovaOperacao))+', '+
                QuotedStr(IntToStr(iIDBOLSAVALORES))+', '+   // Ana: Ver se não vai dar erro de Constraint quando IdForCli não for uma Bolsa
                QuotedStr(qryFilhaIDINVESTIMENTO.AsString)+', '+
                QuotedStr(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsString)+
            ')');

         // Update no Status de Lançamento
         QryUpdOperacaoDireitoStatus.Close;
         QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := wIdOperacaoDireito;
         QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'L';
         QryUpdOperacaoDireitoStatus.ExecSQL;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           qryFilhaIDINVESTIMENTO.AsInteger, 2,
                                           wIdNovaOperacao, -1, 1{Compra},
                                           qryFilhaIDCARTEIRAINVEST.AsInteger, 0{IDCARTEIRAGERENC},
                                           -1, -1, -1, -1, -1,
                                           edtDataEfetiva.Date,
                                           qryFilhaVALOREXERCIDO.AsFloat,
                                           qryFilhaQTDEDIREITO.AsFloat,
                                           wQtdCotaini,
                                            0 {Variacao}, 0{Juros}, 0{IR Provisão}, 0{IR}, 0, 0, 0, 0, 0,
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                                           qryFilhaIDLOTE.AsString,
                                           'REORGANIZACAO SOCIETARIA / '+QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' - '+
                                           qryFilhaACAO.AsString,'OPE', '1', '', True,
                                           -1, iPlanPrevCtbPatro, iIdHistCartInv) then
         begin
            MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Abort;
         end;

         if not OperComum.AtualizaSaldos(wQtdCotaini,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Abort;
         end;

         // Atualizar Custodia
         if QryBuscaTipoOper.FieldByName('TIPOCUSTODIA').AsString  <> 'N' then
            wIdOperCust := wIdNovaOperacao
         else
            wIdOperCust := -1;

         if not OperacaoInvest.CadastraCustodia(wIdOperCust) then
         begin
            MsgDlg('Erro ao Atualizar Custodia, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',
                   MtError,[MbOk],0);
            Abort;
         end;

         If wIdOperCust <> -1 Then
            ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                                 ' FlgCustodia         = NULL '+
                                 ' Where IdHistCartInv = '+IntToStr(iIdHistCartInv));

         // Contabiliza Operação
         If OperComum.LancaOperRFRV(Sistema.IdEmpresa, 79, 2,
                                    qryFilhaIDINVESTIMENTO.AsInteger,
                                    1 {Compra},
                                    wIdNovaOperacao,
                                    wIdForCli,
                                    qryFilhaIDCARTEIRAINVEST.AsInteger,
                                    QryBuscaInvestimentoMOECODIGO.AsInteger,
                                    QryBuscaInvestimentoCODTIPOACAO.AsString,
                                    qryFilhaIDLOTE.AsString,
                                    '',
                                    wNumDoc,
                                    'P', wTipoRecDesBol, bCriaLancto,
                                    qryFilhaVALOREXERCIDO.AsFloat,
                                    qryFilhaVALOREXERCIDO.AsFloat,
                                    edtDataEfetiva.Date,
                                    wDataVenc,wPlano,wPlanilha,wDocumCont,wMensErro) <> 0 then
         begin
            MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                   'no lançamento contábil','Mensagem do Sistema ',mtWarning,[mbOK],0);
            Abort;
         end;

         qryFilha.Next;
      end;

      // Caso o Banco esteja em Transacao Commita
      If DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.Commit;

      Result := True;
   except
      Result := False;
   end;
end;

procedure TfrmCadOperAGE.LSetText(Sender: TField;
  const Text: String);
begin
  inherited;
   if bbtnConfirmar.Enabled then
   begin
      fQTDEDIREITO := ABS(StrToFloat(OperComum.StripChar(Text, '.')));
      AbreQueryOrigem(qryOperacaoDireitoIDEMISSOR.AsInteger,
                      qryOperacaoDireitoIDTIPOOPERACAO.AsInteger,
                      qryOperacaoDireitoDATAEX.AsDateTime,
                      False,True);
   end;
end;

procedure TfrmCadOperAGE.bbtnCancelarClick(Sender: TObject);
begin
  if (wTipoSaida <> 'S') then
  begin
     If iTipoOperacao <> pRPI.IDTIPOOPERDIRBON then
     Begin
        If MontaSelect.RetornouValor Then
        Begin
           qry.DisableControls;
           qryFilha.DisableControls;
           AbreQueryOrigem(StrToInt(MontaSelect.ValoresChave[0]),
                                    StrToInt(MontaSelect.ValoresChave[2]),
                                    StrToDate(MontaSelect.ValoresChave[1]),
                                    True,False);
           qryFilha.EnableControls;
           qry.EnableControls;
           iTipoOperacao := StrToInt(MontaSelect.ValoresChave[2]);
           wIdOperacaoDireito := StrToInt(MontaSelect.ValoresChave[3]);
           bQTDEDIREITO := False;
           lblDataEfetiva.Visible := True;
           edtDataEfetiva.Visible := True;
           lblDataAGE.Caption     := MontaSelect.ValoresChave[1];
           lblSigla.Caption       := MontaSelect.ValoresChave[4];
           lblTipoOperacao.Caption:= MontaSelect.ValoresChave[5];
           LblBoleta.Caption      := MontaSelect.ValoresChave[6];           
        End;
     End
     Else
     Begin
        qry.Cancel;
        qryFilha.Cancel;
     End;
  end
  Else
   inherited;
end;

procedure TfrmCadOperAGE.FormShow(Sender: TObject);
begin
  inherited;
  wTipoSaida  := 'N';
  wPlnProv    := 0;
  wPlanoProv  := 0;
  wDocProv    := 0;

  bVerFormAge := False;

  // Seta teomporariamente a propriedade para False
  bProvisiona := False;

end;

procedure TfrmCadOperAGE.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  ProcessaLabels;
end;

procedure TfrmCadOperAGE.BtVoltaDetClick(Sender: TObject);
begin
  inherited;
  qryFilhaQTDEDIREITO.DisplayFormat := '###,###,###,###,###';
  qryFilhaQTDENOVA.DisplayFormat    := '###,###,###,###,###';
end;

procedure TfrmCadOperAGE.dbgDestinoExit(Sender: TObject);
begin
  inherited;
  qryFilhaQTDEDIREITO.DisplayFormat := '###,###,###,###,###';
  qryFilhaQTDENOVA.DisplayFormat    := '###,###,###,###,###';
end;

procedure TfrmCadOperAGE.qryVLRLIQSetText(Sender: TField;
  const Text: String);
begin
  inherited;
   If ((iTipoOperacao In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL])) Then
   Begin
      If (qryVLRLIQ.OldValue <> qryVLRLIQ.Value) Then
      Begin
         fPuAtual := OperComum.DivValorZero(
                       OperComum.DivValorZero(qryVLRLIQ.Value,qryQTDEDIREITO.AsFloat),
                                              QryLote.FieldByName('QTDELOTE').AsInteger);
      End;
   End;
end;

procedure TfrmCadOperAGE.qryQTDEDIREITOSetText(Sender: TField;
  const Text: String);
var
   eIRExercido : Double;
   i           : Integer;
   sValor      : String;
begin
  inherited;

    eIRExercido := 0;

    For i := 1 To Length(Text) Do
    Begin
       If Copy(Text,i,1) <> '.' Then
          sValor := sValor + Copy(Text,i,1);
    End;

    qryQTDEDIREITO.AsFloat    := StrToFloat(sValor);

    qryQTDE.ReadOnly          := False;

    qryQTDE.AsFloat           := StrToFloat(sValor);

    qryQTDE.ReadOnly          := True;

    qryVALOREXERCIDO.ReadOnly := False;

    If qryOperacaoDireitoQTDEACOESDIRPROV.AsFloat <> 0 Then
       qryVALOREXERCIDO.AsFloat  :=
                   OperComum.Round((qryQTDEDIREITO.AsFloat * RO.DIVPORACAO)-0.0049,2)
    Else
       qryVALOREXERCIDO.AsFloat := OperComum.Round(
         (qryQTDEDIREITO.AsFloat *
             OperComum.DivValorZero(RO.DIVPORACAO,
                        QryLote.FieldByName('QTDELOTE').AsInteger))-0.0049,2)+
                               qryVLRREMUNERACAO.AsFloat;

    fVlrRendimento := 0;
    if qryOperacaoDireitoISENCAOIR.AsString = 'N' then
       eIRExercido := Impostos.CalculaIr(0,
                               qryIDINVESTIMENTO.AsInteger, 0{CARTEIRAGERENC},
                               qryIDCARTEIRAINVEST.AsInteger,
                               qryOperacaoDireitoIDTIPOOPERACAO.AsInteger,
                               RO.IDMERCADO,
                               qryIDLOTE.AsString,
                               Date, Date,
                               0,
                               qryVALOREXERCIDO.AsFloat, 0, 'S',
                               RO.FLGTRATAIR,fVlrRendimento);

    eIRExercido           := eIRExercido + qryVLRREMUNERACAO.AsFloat;

    qryOperacaoInvest.Close;

    qryIR.AsFloat         := eIRExercido;

    qryRENDIMENTO.ReadOnly:= False;
    qryRENDIMENTO.AsFloat := fVlrRendimento;
    qryRENDIMENTO.ReadOnly:= True;

    qryVLRLIQ.ReadOnly    := False;

    if qryOperacaoDireitoIRLITIGIO.AsString = 'S' then
       qryVLRLIQ.AsFloat := qryVALOREXERCIDO.AsFloat
    else
       qryVLRLIQ.AsFloat := qryVALOREXERCIDO.AsFloat-eIRExercido;

    dbgOrigem.InvalidateCurrentRow;

end;

procedure TfrmCadOperAGE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   If Not bVerFormAge Then
   begin
      Action := caNone;
      Exit;
   end;

   inherited;

   wTipoSaida := 'S';
   qryOperacaoInvest.Close;   
   if iTipoOperacao  In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL] then
   begin
      Qry.Close;
      If (bVerFormAge = True) Then
      Begin
         if ExisteForm then
         begin
         frmCadAGE.sbtnProvisiona.Down      := False;
         frmCadAGE.sbtnOpercoesDireito.Down := False;
         frmCadAGE.qry.Close;
         frmCadAGE.qry.Open;
            frmCadAGE.sbtnInserir.Click;
         end;
      End;
   end;
end;

procedure TfrmCadOperAGE.qryVALOREXERCIDOSetText(Sender: TField;
  const Text: String);
var
   eIRExercido : Double;
   i           : Integer;
   sValor      : String;
begin
  inherited;

    eIRExercido := 0;

    For i := 1 To Length(Text) Do
    Begin
       If Copy(Text,i,1) <> '.' Then
          sValor := sValor + Copy(Text,i,1);
    End;

    qryVALOREXERCIDO.AsFloat := StrToFloat(sValor);

    fVlrRendimento := 0;
    if qryOperacaoDireitoISENCAOIR.AsString = 'N' then
       eIRExercido := Impostos.CalculaIr(0,
                               qryIDINVESTIMENTO.AsInteger, 0{CARTEIRAGERENC},
                               qryIDCARTEIRAINVEST.AsInteger,
                               qryOperacaoDireitoIDTIPOOPERACAO.AsInteger,
                               RO.IDMERCADO,
                               qryIDLOTE.AsString,
                               Date, Date,
                               0,
                               qryVALOREXERCIDO.AsFloat, 0, 'S',
                               RO.FLGTRATAIR,fVlrRendimento);

    eIRExercido   := eIRExercido + qryVLRREMUNERACAO.AsFloat;

    qryIR.AsFloat := eIRExercido;

    qryRENDIMENTO.ReadOnly := False;

    qryRENDIMENTO.AsFloat  := fVlrRendimento;

    qryRENDIMENTO.ReadOnly := True;

    qryVLRLIQ.ReadOnly     := False;
    if qryOperacaoDireitoIRLITIGIO.AsString = 'S' then
       qryVLRLIQ.AsFloat   := qryVALOREXERCIDO.AsFloat
    else
       qryVLRLIQ.AsFloat   := qryVALOREXERCIDO.AsFloat-eIRExercido;

    qryVLRLIQ.ReadOnly     := True;

    qryVALOREXERCIDO.ReadOnly := False;

end;

procedure TfrmCadOperAGE.bbtnSairClick(Sender: TObject);
var
   sStatus : String;
begin
   bVerFormAge := True;
   Qry.Close;
   QryFilha.Close;
   sStatus     := Trim(qryOperacaoDireito.FieldByName('STATUS').AsString);

  inherited;

  If (bProvisiona) Or (sStatus <> '') Then
      FrmCadAge.bbtnCancelarClick(Sender);

end;

function TfrmCadOperAGE.ExisteForm: Boolean;
var
   i: Integer;
begin
   Result := False;
   for i := 0 to Screen.FormCount - 1 do
      if Screen.Forms[i] = frmCadAGE then begin
         Result := True;
         Break;
      end;
end;

procedure TfrmCadOperAGE.qryFilhaQTDENOVASetText(Sender: TField;
  const Text: String);
begin
  inherited;
  qryFilhaQTDENOVA.AsFloat := OperComum.Trunca(qryFilhaQTDENOVA.AsFloat,0);
end;

//Al_7 - Ricardo - 26/04/2005
function TfrmCadOperAGE.ProcBonificacaoCartGerenc(wNumDoc : String)  : boolean;
var
   wIdCarteiraXEvento, wIdBolsaValores, wIdNovaOperacao  : Integer;
   //Al_11 - Ricardo - 27/04/2005
   wDataAge, wDataAgeCons                                : TDateTime;
   wQtdeDireitoCart                                      : Double;
begin
   Result       := True;
   wDataAge     := StrToDate(lblDataAGE.Caption);
   wDataAGECons := wDataAGE;
   If (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
   Begin
      wDataAGECons := wDataAGECons - 1;
      While not DiasUteisInv.DiaUtil(wDataAGECons,-1,1,'',True,False,False) Do
          wDataAGECons := wDataAGECons - 1;   // Achar o dia útil anterior
   End;

   try
      QryCarteiraGerenc.Close;
      QryCarteiraGerenc.Open;
      while not QryCarteiraGerenc.Eof do
      begin
         wSaldoIRApu := 0;
         wSaldoQtd   := 0;
         wSaldoAqui  := 0;
         wSaldoVlr   := 0;
         wSdoQtdCPMF := 0;

         //Busca o saldo atual
         If (Trim(qryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
         Begin
            OperComum.BuscaTodosSaldosInvestLote(
               QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
               QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
               qryFilha.FieldByName('IDINVESTIMENTO').AsInteger,
               high(integer),-1,
               qryFilha.FieldByName('IDLOTE').AsString,
               DateToStr(wDataAGECons), -1,
               wSaldoQtd, wSaldoVlr, wSaldoInutil, wSaldoInutil, wSaldoAqui,
               wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
               wSaldoIRApu, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
               wSaldoCusto, wSaldoInutil, wSdoQtdCPMF);
         End
         Else
         Begin
            OperComum.BuscaTodosSaldosInvestLote(
               QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
               QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
               qryFilha.FieldByName('IDINVESTIMENTO').AsInteger,
               high(integer),-1,
               qryFilha.FieldByName('IDLOTE').AsString,
               DateToStr(wDataAGECons), -1,
               wSaldoQtd, wSaldoVlr, wSaldoInutil, wSaldoInutil, wSaldoAqui,
               wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
               wSaldoIRApu, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
               wSaldoCusto, wSaldoInutil, wSdoQtdCPMF);
         End;

         if wSaldoQtd = 0 then
         begin
            QryCarteiraGerenc.Next;
            Continue;
         end;

         wQtdeDireitoCart  := OperComum.Round((wSaldoQtd * RO.PERCENTUAL) / 100,0);

         // Gera Novo Id de Operacao
         wIdNovaOperacao   := LeUltRegistro(Nil,'OPERACAOINVEST');

         GravaOperacaoInvest(wIdNovaOperacao,
                             QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                             Sistema.IdModulo, Sistema.IdEmpresa,
                             qryFilha.FieldByName('IDINVESTIMENTO').AsInteger,
                             QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger, 2,
                             QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                             wIdForCli,
                             qryFilha.FieldByName('IDCUSTODIANTE').AsInteger,
                             wIdOperacaoDireito,
                             QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                             edtDataEfetiva.Date,
                             wDataVenc,
                             wNumDoc,'F','L',
                             qryFilha.FieldByName('IDLOTE').AsString,
                             wQtdeDireitoCart, 0, 0, 0, 0, 0, 0,'D');

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           qryFilha.FieldByName('IDINVESTIMENTO').AsInteger,
                                           2, wIdNovaOperacao, -1,
                                           QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                                           QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                           -1, -1, -1, -1, -1,
                                           edtDataEfetiva.Date,
                                           0,
                                           wQtdeDireitoCart,
                                           pRPI.VLRCOTAINICART,
                                           0 , 0, 0, 0, 0, 0, 0, 0, 0,
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                                           qryFilha.FieldByName('IDLOTE').AsString,
                                           QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                           qryFilha.FieldByName('ACAO').AsString,
                                           'OPE', '1', '', True, -1,
                                           iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
            MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         QryCarteiraGerenc.Next;
      End;
   except
      Result := False;
   end;
end;
//Al_7 - Fim

end.
