//******************************************************************************
// Data      : 12/06/2008
// Código    : AL_20
// Pendencia : 25729
// SOL       : 63283
// Motivo    : Implementação de limitação na seleção de datas para operar
//               carteiras gerenciais de acordo com o parametro cadastrado.
//******************************************************************************
// Data      : 21/12/2006
// Código    : AL_19
// Pendencia : 21859
// SOL       : 41425
// Motivo    : Implementação da permissão da transferência mesmo que seja
//             verificado a existência de anúncios e recebimento de direitos.
//             Será apenas apresentada a mensagem.
//******************************************************************************
// Data      : 05/10/2006
// Codigo    : AL_18
// Pendência :
// Sol       :
// Motivo    : Ajuste na busca do destino da trasnferencia de carteiras
//******************************************************************************
// Data      : 31/08/2006
// Codigo    : AL_17
// Pendência :
// Sol       :
// Motivo    :  Implementação do plano/patrocinador
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_16
// Pendencia :
// SOL       :
// Desc      : Acerto nos status dos botões
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_15
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_14
// Pendencia:
// SOL      :
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 09/06/2006
// Código   : AL_13
// Pendencia:
// SOL      :
// Desc     : Ajuste na aberturadas querys de saldo origem e destino da carteira
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_12
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 05/06/2006
// Código   : AL_11
// Pendencia: 22527
// SOL      : 43810
// Motivo(S): Ajuste na gravação do Flag de Boleta Fechada na OperacaoInvest
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_10
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//******************************************************************************
// Data      : 03/04/2006
// Código    : AL_9
// Pendencia : 21859
// SOL       : 41425
// Motivo    : Implementação da verificação de anúncios e recebimento de direitos,
//             no momento da tranferência de carteiras gerenciais
//******************************************************************************
//Data	    : 06/03/2006
//Código    : Al_8
//Pendencia :
//SOL       :
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//******************************************************************************
// Data     : 10/02/2005
// Código   : AL_7
// Motivo   : Implementação da transferência proporcional das quantidades
//            CC e CCI.
//******************************************************************************
// Data     : 01/06/2005
// Código   : AL_6
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
//Data	    : 02/03/2005
//Código    : Al_5
//Motivo(S) : Alterada o prazo limite para 60 dias para zerar a cota do Cart. Gerencial
//******************************************************************************
// Data     : 23/12/2004
// Codigo   : AL_4
// Motivo   : Atualizado a rotina de delecao de cotas
//******************************************************************************
// Data     : 07/12/2004
// Codigo   : AL_2
// Motivo   : A provisão da transferencia passa a ter a cotação do dia
//******************************************************************************
// Data     : 06/12/2004
// Codigo   : AL_1
// Motivo   : Implementação da precisão matemática comforme a bovespa.
//******************************************************************************
// Data	    : 29/06/2004
// Codigo   :
// Query    : QryVerificaTransfDia
// Motivo   : Passado o Active da qry para 'False'
//******************************************************************************

unit FCadOpeVirtual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, TREdit, wwdblook, wwdbdatetimepicker,FPreview,
  CMDateTimePicker, ComCtrls, CmEventosCadastro, ImgList, Db, Wwdatsrc,
  MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  fcLabel, Mask, DBCtrls, uCtrlInvContab;

type
  TfrmCadOpeVirtual = class(TfrmCadastroCS)
    pnlCampos: TPanel;
    pnlDetalhes: TPanel;
    pgcDetalhes: TPageControl;
    tbsCxGerencial: TTabSheet;
    tbsTransf: TTabSheet;
    dbdtDataOperacao: TCMDateTimePicker;
    Label1: TLabel;
    dblTipoOperacao: TwwDBLookupCombo;
    lblTipoOperacao: TLabel;
    pnlDetCXGerencialFundo: TPanel;
    pnlDetTransf: TPanel;
    pnlDetDestino: TPanel;
    pnlDetOrigem: TPanel;
    dbgDetCartOrigem: TwwDBGrid;
    pnlDetCartOrigem: TPanel;
    Label11: TLabel;
    dbrQuantidadeAntiga: TDBRealEdit;
    dbgDetCartDestino: TwwDBGrid;
    lblInvestimento: TfcLabel;
    btnVoltarDetOrigem: TBitBtn;
    tbsOperacoes: TTabSheet;
    dbgCXGerencial: TwwDBGrid;
    //AL_17
    qryOperacao: TwwQuery;
    qryOperador: TwwQuery;
    qryCarteiraOrigem: TwwQuery;
    qryCarteiraDestino: TwwQuery;
    qrySaldosOrigem: TwwQuery;
    dsSaldosOrigem: TwwDataSource;
    qrySaldosDestino: TwwQuery;
    dsSaldosDestino: TwwDataSource;
    dsSaldoCaixas: TwwDataSource;
    qrySaldoCaixas: TwwQuery;
    qrySaldoCaixasCARTEIRA: TStringField;
    qrySaldoCaixasDATAHISTCAIXA: TDateTimeField;
    qrySaldoCaixasSALDOCAIXA: TFloatField;
    qryOperadorIDUSUARIO: TFloatField;
    qryOperadorNOMEUSUARIO: TStringField;
    qryDATAOPERACAO: TDateTimeField;
    qryIDTIPOOPERACAO: TFloatField;
    qryOPERADOR2: TFloatField;
    qryAUTORIZADOR2: TFloatField;
    qryIDCARTEIRAORIGEM: TFloatField;
    qryIDCARTEIRADESTINO: TFloatField;
    qryINVESTORIGEM: TFloatField;
    qryINVESTDESTINO: TFloatField;
    qryQTDDESTINO: TFloatField;
    qryVALORAPLIC: TFloatField;
    qryAux: TwwQuery;
    qrySaldoCaixaDet: TQuery;
    sbtnSaldos: TToolbarButton97;
    dsSaldoCaixaDet: TwwDataSource;
    qrySaldoCaixaDetIDCARTEIRAXEVENTO: TFloatField;
    qrySaldoCaixaDetDATAHISTCAIXA: TDateTimeField;
    qrySaldoCaixaDetDESCCAIXACOTA: TStringField;
    qrySaldoCaixaDetDESCTIPOOPERACAO: TStringField;
    qrySaldoCaixaDetVLRHISTCAIXA: TFloatField;
    qrySaldoCaixaDetSLDHISTCAIXA: TFloatField;
    qrySaldoCaixasIDCARTEIRAXEVENTO: TFloatField;
    qryCarteiraOrigemCARTEIRA: TStringField;
    qryCarteiraOrigemIDCARTEIRA: TStringField;
    qryCarteiraOrigemIDCARTEIRAINVEST: TFloatField;
    qryCarteiraOrigemIDCARTEIRAGERENC: TFloatField;
    qryCarteiraDestinoCARTEIRA: TStringField;
    qryCarteiraDestinoIDCARTEIRA: TStringField;
    qryCarteiraDestinoIDCARTEIRAINVEST: TFloatField;
    qryCarteiraDestinoIDCARTEIRAGERENC: TFloatField;
    qrySaldoCaixasIDCARTEIRAINVEST: TFloatField;
    qrySaldoCaixasIDCARTEIRAGERENC: TFloatField;
    qrySaldoCaixaDetIDCARTEIRAINVEST: TFloatField;
    qrySaldoCaixaDetIDCARTEIRAGERENC: TFloatField;
    qrySaldosDestinoDATAMOVCARTINV: TDateTimeField;
    qrySaldosDestinoDESCINVESTIMENTO: TStringField;
    qrySaldosDestinoSALDOINV: TFloatField;
    qrySaldosDestinoIDHISTCARTINV: TFloatField;
    qrySaldosDestinoIDCARTEIRAINVEST: TFloatField;
    qrySaldosDestinoIDCARTEIRAGERENC: TFloatField;
    qrySaldosDestinoSALDOCOTASCARTINV: TFloatField;
    qrySaldosDestinoSALDOVLRCARTINV: TFloatField;
    qrySaldosDestinoSALDOQTDEINVCART: TFloatField;
    qrySaldosDestinoSALDOVLRINVCART: TFloatField;
    qrySaldosDestinoSALDOATU: TFloatField;
    qrySaldosDestinoSALDOCAR: TFloatField;
    qrySaldosDestinoSALDOAQUI: TFloatField;
    qrySaldosDestinoSALDOREND: TFloatField;
    qrySaldosDestinoSALDOVARIACAO: TFloatField;
    qrySaldosDestinoSALDOJUROS: TFloatField;
    qrySaldosDestinoSALDOPREMIO: TFloatField;
    qrySaldosDestinoSALDOIRPROV: TFloatField;
    qrySaldosDestinoSALDOIRAPU: TFloatField;
    qrySaldosDestinoSALDOIOFPROV: TFloatField;
    qrySaldosDestinoSALDOIOFAPU: TFloatField;
    qrySaldosDestinoSALDOAGIO: TFloatField;
    qrySaldosOrigemDATAMOVCARTINV: TDateTimeField;
    qrySaldosOrigemDESCINVESTIMENTO: TStringField;
    qrySaldosOrigemSALDOINV: TFloatField;
    qrySaldosOrigemIDHISTCARTINV: TFloatField;
    qrySaldosOrigemIDCARTEIRAINVEST: TFloatField;
    qrySaldosOrigemIDCARTEIRAGERENC: TFloatField;
    qrySaldosOrigemSALDOCOTASCARTINV: TFloatField;
    qrySaldosOrigemSALDOVLRCARTINV: TFloatField;
    qrySaldosOrigemSALDOQTDEINVCART: TFloatField;
    qrySaldosOrigemSALDOVLRINVCART: TFloatField;
    qrySaldosOrigemSALDOATU: TFloatField;
    qrySaldosOrigemSALDOCAR: TFloatField;
    qrySaldosOrigemSALDOAQUI: TFloatField;
    qrySaldosOrigemSALDOREND: TFloatField;
    qrySaldosOrigemSALDOVARIACAO: TFloatField;
    qrySaldosOrigemSALDOJUROS: TFloatField;
    qrySaldosOrigemSALDOPREMIO: TFloatField;
    qrySaldosOrigemSALDOIRPROV: TFloatField;
    qrySaldosOrigemSALDOIRAPU: TFloatField;
    qrySaldosOrigemSALDOIOFPROV: TFloatField;
    qrySaldosOrigemSALDOIOFAPU: TFloatField;
    qrySaldosOrigemSALDOAGIO: TFloatField;
    qrySaldosOrigemIDINVESTIMENTO: TFloatField;
    qrySaldosDestinoIDINVESTIMENTO: TFloatField;
    qrySaldosOrigemIDLOTE: TStringField;
    qrySaldosDestinoIDLOTE: TStringField;
    qryTpOper: TwwQuery;
    qryTpOperIDTIPOINVEST: TFloatField;
    qryTpOperIDTIPOOPERACAO: TFloatField;
    qryTpOperIDMERCADO: TFloatField;
    qryTpOperCODTIPDOC: TFloatField;
    qryTpOperDESCTIPOOPERACAO: TStringField;
    qryTpOperNATUREZAOPERACAO: TStringField;
    qryTpOperTIPOCUSTODIA: TStringField;
    qryTpOperVENCIMENTO: TFloatField;
    qryTpOperFLGGERACONTAB: TFloatField;
    qryTpOperFLGGERACAPCAR: TFloatField;
    qryTpOperRECPAG: TStringField;
    qryTpOperTIPCREDOR: TStringField;
    qryTpOperFLGGERACAF: TFloatField;
    qryTpOperFLGTRANSF: TStringField;
    qryTpOperTRGDTINCLUSAO: TDateTimeField;
    qryTpOperTRGUSERINCLUSAO: TStringField;
    qryTpOperFLGCORRET: TStringField;
    qryTpOperFLGORDMOVINV: TStringField;
    qryTpOperIDMOTIVOBLOQUEIO: TFloatField;
    qryTpOperFLGOPDIREITO: TStringField;
    qryTpOperFLGAGE: TStringField;
    qryTpOperFLGDATAEX: TStringField;
    qryTpOperFLGDATACOM: TStringField;
    qryTpOperFLGINVORIGEM: TStringField;
    qryTpOperFLGPERC: TStringField;
    qryTpOperFLGPARIDADE: TStringField;
    qryTpOperFLGPRZBOLSA: TStringField;
    qryTpOperFLGPRZEMP: TStringField;
    qryTpOperFLGATADEC: TStringField;
    qryTpOperFLGFORMAPAGREC: TStringField;
    qryTpOperFLGDIVACAO: TStringField;
    qryTpOperFLGINIPAG: TStringField;
    qryTpOperFLGJUROS: TStringField;
    qryTpOperMOTBLOQCARTORIG: TFloatField;
    qryTpOperMOTBLOQCARTDEST: TFloatField;
    qryTpOperTIPSALDOCARTORIG: TStringField;
    qryTpOperTIPSALDOCARTDEST: TStringField;
    qryTpOperFLGTRATAIR: TStringField;
    qryTpOperSIGLATIPOOPER: TStringField;
    qryTpOperFLGISENTOIR: TStringField;
    qryTpOperFLGGRAVAIRLITIGIO: TStringField;
    qryTpOperFLGOPGERENC: TStringField;
    pnlComboCartOrigem: TPanel;
    dblCarteiraOrigem: TwwDBLookupCombo;
    pnlComboCartDestino: TPanel;
    dblCarteiraDestino: TwwDBLookupCombo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DbGrdAplResg: TwwDBGrid;
    pnlResgate: TPanel;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    BtInc: TSpeedButton;
    BtAlt: TSpeedButton;
    BtExc: TSpeedButton;
    dbrValor: TDBRealEdit;
    Label6: TLabel;
    dblCarteiraCXGerencial: TwwDBLookupCombo;
    Label7: TLabel;
    QryAplResg: TwwQuery;
    DsAplResg: TwwDataSource;
    QryAplResgDESCCARTGERENC: TStringField;
    QryAplResgVLRHISTCAIXA: TFloatField;
    QryAplResgIDCARTEIRAGERENC: TFloatField;
    QryAplResgIDCARTEIRAINVEST: TFloatField;
    QryAplResgIDHISTCAIXA: TFloatField;
    Dock974: TDock97;
    Toolbar973: TToolbar97;
    BtOk: TBitBtn;
    BtCanc: TBitBtn;
    BtVolta: TBitBtn;
    QryAuxiliar: TwwQuery;
    qryOperacaoDESCCAIXACOTA: TStringField;
    qryOperacaoIDEVENTOCAIXACOTA: TFloatField;
    qryIDEVENTOCAIXACOTA: TFloatField;
    QryHistCaixa: TwwQuery;
    QryTipoOper: TwwQuery;
    TbsDireitos: TTabSheet;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    DbgDireito: TwwDBGrid;
    pnlDireitos: TPanel;
    Label3: TLabel;
    dbrValorDir: TDBRealEdit;
    Dock975: TDock97;
    Toolbar974: TToolbar97;
    BtOkDir: TBitBtn;
    BtCancDir: TBitBtn;
    BtVoltaDir: TBitBtn;
    Dock976: TDock97;
    Toolbar975: TToolbar97;
    BtIncDir: TSpeedButton;
    BtAltDir: TSpeedButton;
    BtExcDir: TSpeedButton;
    Label4: TLabel;
    dblCarteiraGerDir: TwwDBLookupCombo;
    Label5: TLabel;
    dblTipoOperDir: TwwDBLookupCombo;
    QryDireito: TwwQuery;
    StringField2: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    DsDireito: TwwDataSource;
    QryDireitoDESCCAIXACOTA: TStringField;
    QryTipoOperDESCCAIXACOTA: TStringField;
    QryTipoOperIDEVENTOCAIXACOTA: TFloatField;
    QryDireitoIDEVENTOCAIXACOTA: TFloatField;
    QryAplResgDESCCAIXACOTA: TStringField;
    TbsEmprestimo: TTabSheet;
    PageControl3: TPageControl;
    TabSheet2: TTabSheet;
    DbgEmprestimo: TwwDBGrid;
    pnlEmprestimo: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Dock977: TDock97;
    Toolbar976: TToolbar97;
    BtOkEmp: TBitBtn;
    BtCancEmp: TBitBtn;
    BtVoltaEmp: TBitBtn;
    dblCarteiraGerEmp: TwwDBLookupCombo;
    dblTipoOperEmp: TwwDBLookupCombo;
    Dock978: TDock97;
    Toolbar977: TToolbar97;
    BtIncEmp: TSpeedButton;
    BtAltEmp: TSpeedButton;
    BtExcEmp: TSpeedButton;
    QryTipoOperEmp: TwwQuery;
    QryEmprestimo: TwwQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    DsEmprestimo: TwwDataSource;
    QryTipoOperEmpDESCCAIXACOTA: TStringField;
    QryTipoOperEmpIDEVENTOCAIXACOTA: TFloatField;
    qryOperacaoIDTIPOOPERACAO: TFloatField;
    QryAplResgIDCARTEIRAXEVENTO: TFloatField;
    dbrValorEmp: TDBRealEdit;
    QryInsetOperacaoInvest: TwwQuery;
    qrySaldosOrigemMOECODIGO: TFloatField;
    qrySaldosDestinoMOECODIGO: TFloatField;
    QryBoleta: TwwQuery;
    QryBoletaIDBOLETA: TStringField;
    QryInsertBoleta: TwwQuery;
    QryVerificaTransfDia: TwwQuery;
    dsCarteiraOrigem: TwwDataSource;
    qryTpOperTIPOMOVTO: TStringField;
    qryTpOperSTAATIVO: TStringField;
    qryTpOperFLGRENTABILIDADE: TStringField;
    qryTpOperFLGCONTAINVEST: TFloatField;
    qryTpOperFLGMOVCOTA: TStringField;
    qryTpOperFLGCOTARECDES: TStringField;
    qryTpOperFLGDATAVENCIMENTO: TStringField;
    qryTpOperFLGOBRIGAOBS: TStringField;
    Panel4: TPanel;
    Panel1: TPanel;
    //AL_7
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    qrySaldosOrigemSALDOINVNOVA: TFloatField;
    qrySaldosOrigemSALDOINVANTIGA: TFloatField;
    qrySaldosOrigemSALDOQTDECPMF: TFloatField;
    qrySaldosDestinoSALDOINVNOVA: TFloatField;
    qrySaldosDestinoSALDOINVANTIGA: TFloatField;
    qrySaldosDestinoSALDOQTDECPMF: TFloatField;
    Label2: TLabel;
    dbrQuantidadeNova: TDBRealEdit;
    ToolbarSep972: TToolbarSep97;
    bbtntTransfer: TBitBtn;
    qryQTDORIGEMCC: TFloatField;
    qryQTDORIGEMCCI: TFloatField;
    pnlEtiqueta: TPanel;
    lblValorTransferido: TStaticText;
    //AL_9
    QryVerificaAnunDir: TwwQuery;
    QryVerificaRecDir: TwwQuery;
    procedure dbgDetCartOrigemDblClick(Sender: TObject);
    procedure btnVoltarDetOrigemClick(Sender: TObject);
    procedure dbgDetCartOrigemStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure dbrQuantidadeAntigaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgDetCartOrigemEnter(Sender: TObject);
    procedure dbgDetCartOrigemExit(Sender: TObject);
    procedure dbgDetCartOrigemEndDrag(Sender, Target: TObject; X,
      Y: Integer);
    procedure dbgDetCartOrigemMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgDetCartDestinoDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure MostraValor(bMostra: Boolean; fValor: Double = 0);
    procedure dblTipoOperacaoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblTipoOperacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure dbgCXGerencialCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgCXGerencialTopRowChanged(Sender: TObject);
    procedure dbdtDataOperacaoExit(Sender: TObject);
    procedure sbtnSaldosClick(Sender: TObject);
    procedure dblCarteiraOrigemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qrySaldosOrigemAfterScroll(DataSet: TDataSet);
    //AL_17
    procedure dblCarteiraDestinoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbgDetCartOrigemKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgDetCartDestinoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BtIncClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure BtCancClick(Sender: TObject);
    procedure BtExcClick(Sender: TObject);
    procedure BtAltClick(Sender: TObject);
    procedure pgcDetalhesChange(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtIncDirClick(Sender: TObject);
    procedure BtAltDirClick(Sender: TObject);
    procedure BtExcDirClick(Sender: TObject);
    procedure BtOkDirClick(Sender: TObject);
    procedure BtCancDirClick(Sender: TObject);
    procedure BtOkEmpClick(Sender: TObject);
    procedure BtCancEmpClick(Sender: TObject);
    procedure BtIncEmpClick(Sender: TObject);
    procedure BtAltEmpClick(Sender: TObject);
    procedure BtExcEmpClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dblCarteiraGerEmpChange(Sender: TObject);
    //AL_7
    procedure bbtntTransferClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure DsAplResgStateChange(Sender: TObject);
    procedure DsDireitoStateChange(Sender: TObject);
    procedure DsEmprestimoStateChange(Sender: TObject);
    //AL_20
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function  AplicaResgata(Valor : Currency; sDescInvest : String): Boolean;

    function  VerificaTransfDia(dDataOper             : TDateTime;
                                iInvestimento,
                                iCarteiraGerencOrig,
                                iCarteiraGerencDest   : Integer) : Boolean;

    function  Transfere      : Boolean;

    function  HabilitaTransf : Boolean;

    //Al_9
    function VerificaRecDireitos(dDataOper : TDateTime;
                                 iInvestimento, iCarteiraGerenc : Integer) : Boolean;

    procedure HabilitaTab;
    procedure RefazSaldo;
    procedure ImpRelSaldo;
    procedure LimpaSaldos(sQuerie: Char);
    procedure AtualizaSaldoOrigem(iCartP, iCartG: Integer;
                                  dData: TDateTime;
                                  iCartO: Integer = 0);
    procedure AtualizaSaldoDestino(iCartP, iCartG: Integer;
                                   dData: TDateTime);

    procedure GravaOperacaoInvest(iIDOPERACAOINVEST, iMOECODIGO, iIDMODULO,
                                  iEMPRESAPROP, iIDINVESTIMENTO,
                                  iIDCARTEIRAINVEST, iIDTIPOINVEST,
                                  iIDTIPOOPERACAO, iIDFORCLI, iIDCUSTODIANTE,
                                  iIDOPERACAODIREITO, iIDCARTEIRAGERENC : Integer;
                                  dDATAOPERACAO, dDATAVENCOPER          : TDateTime;
                                  sNUMDOCUMENTO, sFLGSTATUSFECHBOL,
                                  sFLGSTATUSORDMOV, sIDLOTE             : String;
                                  fQTDEOPERACAO, fPRECOUNITOPERACAO,
                                  fVLROPERACAO, fVLRIR, fVLRREMUNERACAO,
                                  fVLRIRREMUNER, fPERCCUSTO             : Double);
  public
    { Public declarations }
  end;

var
  frmCadOpeVirtual        : TfrmCadOpeVirtual;
  iIdHistCartInv          : Integer;
  bOperacao, bOperacaoDir, bOperacaoEmp : Boolean;

implementation

uses UDatabase, DBaseDados,UMensErro,USistema,UOperComum, FPrincipal,
     UImpostos,UBibliotecaInvest,UFundoComum, UDiasUteisInv,
     FTelaAut, FDMRelSldCartGerenc, fAguardeInv, UOperacaoinvest,
     UProvisaoComum, UCotaComum, UCaixaComum, URendaVariavel, uCtrlParamInvest;

{$R *.DFM}

procedure TfrmCadOpeVirtual.dbgDetCartOrigemDblClick(Sender: TObject);
begin
  inherited;
  dbgDetCartOrigem.SendToBack;
end;

procedure TfrmCadOpeVirtual.btnVoltarDetOrigemClick(Sender: TObject);
begin
  inherited;
  pnlDetCartOrigem.SendToBack;
end;

procedure TfrmCadOpeVirtual.dbgDetCartOrigemStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  inherited;
  //AL_7
  MostraValor(True, qrySaldosOrigemSALDOINVANTIGA.AsFloat+qrySaldosOrigemSALDOINVNOVA.AsFloat);
  dbrQuantidadeAntiga.Value := qrySaldosOrigemSALDOINVANTIGA.AsFloat;
  dbrQuantidadeNova.Value   := qrySaldosOrigemSALDOINVNOVA.AsFloat;
end;

procedure TfrmCadOpeVirtual.dbrQuantidadeAntigaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
     pnlDetCartOrigem.SendToBack;
end;

procedure TfrmCadOpeVirtual.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadOpeVirtual.dbgDetCartOrigemEnter(Sender: TObject);
begin
  inherited;
  //AL_7
  dbrQuantidadeAntiga.Value := qrySaldosOrigemSALDOINVANTIGA.AsFloat;
  dbrQuantidadeNova.Value   := qrySaldosOrigemSALDOINVNOVA.AsFloat;
end;

procedure TfrmCadOpeVirtual.dbgDetCartOrigemExit(Sender: TObject);
begin
  inherited;
  bbtntTransfer.Visible := HabilitaTransf;
end;

procedure TfrmCadOpeVirtual.dbgDetCartOrigemEndDrag(Sender,
  Target: TObject; X, Y: Integer);
begin
  inherited;
  if Target <> nil then
  begin    
    if not dtmBaseDados.dbBaseDados.InTransaction then
       Transfere
    else
       MsgDlg('É Necessário Confirmar ou Cancelar a Operação Pendente.','Mensagem do Sistema', mtWarning, [mbOk],0);
  end;
  MostraValor(False, 0);
end;

procedure TfrmCadOpeVirtual.dbgDetCartOrigemMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ssLeft in Shift then
     dbgDetCartOrigem.BeginDrag(False);
end;

procedure TfrmCadOpeVirtual.dbgDetCartDestinoDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := HabilitaTransf;
end;

procedure TfrmCadOpeVirtual.MostraValor(bMostra: Boolean; fValor: Double);
begin
   if bMostra then
     lblValorTransferido.Visible := True
   else
     lblValorTransferido.Visible := False;

   if fValor <> 0 then
      lblValorTransferido.Caption := 'Quantidade à Transferir ' + FormatFloat('##,###,###,###,##0', fValor)
   else
      lblValorTransferido.Caption := 'Quantidade à Transferir ' + FormatFloat('##,###,###,###,##0', 0);
end;

procedure TfrmCadOpeVirtual.dblTipoOperacaoExit(Sender: TObject);
begin
  inherited;
   HabilitaTab;
end;

procedure TfrmCadOpeVirtual.bbtnConfirmarClick(Sender: TObject);
Var
  wDtMov : TDateTime;
begin
  // AL_8
  if RendaVariavel.VerEmAbertura then
     Exit;

  //AL_6
  //AL_15
  if Trim(dbdtDataOperacao.Text) = '' then
  begin
     MsgDlg('Data da Operação não informada.','Mensagem do Sistema', mtWarning,[mbOK],0);
     if dbdtDataOperacao.CanFocus then
        dbdtDataOperacao.SetFocus;
     Exit;
  end;

  if not CtrlInvContab.TestaPeriodo(dbdtDataOperacao.Text, 2) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbdtDataOperacao.CanFocus then
        dbdtDataOperacao.SetFocus;
     Exit;
  end;

  if not sbtnSaldos.Down then
  begin
     if Trim(dblTipoOperacao.Text) = '' then
     begin
        MsgDlg('Tipo de Operação não Selecionado','Mensagem do Sistema', mtWarning,[mbOK],0);
        if dblTipoOperacao.CanFocus then
           dblTipoOperacao.SetFocus;
        Exit;
     end;
     if qryOperacaoIDTIPOOPERACAO.AsInteger = -53 Then
     begin
        if Trim(dblCarteiraGerEmp.Text) = '' then
        begin
           MsgDlg('Carteira não Selecionada','Mensagem do Sistema', mtWarning,[mbOK],0);
           if dblCarteiraGerEmp.CanFocus then
              dblCarteiraGerEmp.SetFocus;
           Exit;
        end;

        if Trim(dblTipoOperEmp.Text) = '' then
        begin
           MsgDlg('Tipo de Operação não Selecionada','Mensagem do Sistema', mtWarning,[mbOK],0);
           if dblTipoOperEmp.CanFocus then
              dblTipoOperEmp.SetFocus;
           Exit;
        end;

        if dbrValorEmp.Value = 0 then
        begin
           MsgDlg('Valor a ser Informado','Mensagem do Sistema', mtWarning,[mbOK],0);
           if dbrValorEmp.CanFocus then
              dbrValorEmp.SetFocus;
           Exit;
        end;

        //AL_17
        //Atualiza o saldo das Operações, caso exista regitro de atualização
        If Not CaixaComum.AtualizaSaldoDasOperacoes(
                          StrToDate(dbdtDataOperacao.Text),
                          qryCarteiraOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                          qryCarteiraOrigem.FieldByName('IDCARTEIRAGERENC').AsInteger,
                          iPlanPrevCtbPatro) Then
        begin
           MsgDlg('Não foi possível Atualizar o Saldo das Operações.','Mensagem do Sistema', mtWarning,[mbOK],0);
           Exit;
        end;
     end
     Else if (qryOperacaoIDEVENTOCAIXACOTA.AsInteger <> -100) And
        (qryOperacaoIDEVENTOCAIXACOTA.AsInteger <> 0)    then
     begin
        if Trim(dblCarteiraCXGerencial.Text) = '' then
        begin
           MsgDlg('Carteira não Selecionada','Mensagem do Sistema', mtWarning,[mbOK],0);
           if dblCarteiraCXGerencial.CanFocus then
              dblCarteiraCXGerencial.SetFocus;
           Exit;
        end;
        if dbrValor.Value = 0 then
        begin
           MsgDlg('Valor não Informado','Mensagem do Sistema', mtWarning,[mbOK],0);
           if dbrValor.CanFocus then
              dbrValor.SetFocus;
           Exit;
        end;

        //AL_17
        //Atualiza o saldo das Operações, caso exista regitro de atualização
        If Not CaixaComum.AtualizaSaldoDasOperacoes(
                          StrToDate(dbdtDataOperacao.Text),
                          qryCarteiraOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                          qryCarteiraOrigem.FieldByName('IDCARTEIRAGERENC').AsInteger,
                          iPlanPrevCtbPatro) Then
        begin
           MsgDlg('Não foi possível Atualizar o Saldo das Operações.','Mensagem do Sistema', mtWarning,[mbOK],0);
           Exit;
        end;
     //AL_7
     end else if (qryOperacaoIDEVENTOCAIXACOTA.AsInteger <> -100) Then begin
        if (((dbrQuantidadeAntiga.Value+dbrQuantidadeNova.Value) = 0)) then
        begin
           MsgDlg('Quantidade a ser Transferida não Informada','Mensagem do Sistema', mtWarning,[mbOK],0);
           if dbrQuantidadeAntiga.Value = 0 then
           begin
              if dbrQuantidadeAntiga.CanFocus then
                 dbrQuantidadeAntiga.SetFocus;
           end
           else if dbrQuantidadeNova.Value = 0 then
           begin
              if dbrQuantidadeNova.CanFocus then
                 dbrQuantidadeNova.SetFocus;
           end;
           Exit;
        end;
     end
     else
     begin
        if Trim(dblCarteiraGerDir.Text) = '' then
        begin
           MsgDlg('Carteira não Selecionada','Mensagem do Sistema', mtWarning,[mbOK],0);
           if dblCarteiraGerDir.CanFocus then
              dblCarteiraGerDir.SetFocus;
           Exit;
        end;

        if Trim(dblTipoOperDir.Text) = '' then
        begin
           MsgDlg('Tipo de Operação não Selecionada','Mensagem do Sistema', mtWarning,[mbOK],0);
           if dblTipoOperDir.CanFocus then
              dblTipoOperDir.SetFocus;
           Exit;
        end;

        if dbrValorDir.Value = 0 then
        begin
           MsgDlg('Valor a ser Informado','Mensagem do Sistema', mtWarning,[mbOK],0);
           if dbrValorDir.CanFocus then
              dbrValorDir.SetFocus;
           Exit;
        end;

        //AL_17
        //Atualiza o saldo das Operações, caso exista regitro de atualização
        If Not CaixaComum.AtualizaSaldoDasOperacoes(
                          StrToDate(dbdtDataOperacao.Text),
                          qryCarteiraOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                          qryCarteiraOrigem.FieldByName('IDCARTEIRAGERENC').AsInteger,
                          iPlanPrevCtbPatro) Then
        begin
           MsgDlg('Não foi possível Atualizar o Saldo das Operações.','Mensagem do Sistema', mtWarning,[mbOK],0);
           Exit;
        end;

     end;

     bOperacao    := False;
     bOperacaoDir := False;

     if qryOperacaoIDEVENTOCAIXACOTA.AsInteger = 0 then
     begin
        if dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.Commit;
        dblCarteiraOrigem.Text         := qryCarteiraOrigemCARTEIRA.AsString;
        dblCarteiraOrigem.LookupValue  := qryCarteiraOrigemIDCARTEIRA.AsString;
        dblCarteiraOrigem.PerformSearch;
        dblCarteiraDestino.Text        := qryCarteiraDestinoCARTEIRA.AsString;
        dblCarteiraDestino.LookupValue := qryCarteiraDestinoIDCARTEIRA.AsString;
        dblCarteiraDestino.PerformSearch;
     end;

  end else begin
     ImpRelSaldo;
     if dbdtDataOperacao.CanFocus then
        dbdtDataOperacao.SetFocus;
     Exit;
  end;

  wDtMov    := dbdtDataOperacao.Date;
  //AL_5
  //AL_4
  if wDtMov <= (pRPI.DATAULTFECH-60) then
     wDtMov := (pRPI.DATAULTFECH-60)+1;
  qryAuxiliar.Close;
  qryAuxiliar.SQL.Clear;
  qryAuxiliar.SQL.Text:= 'DELETE FROM HISTCOTA WHERE (DATAHISTCOTA >= TO_DATE('''+DateToStr(wDtMov)+''',''DD/MM/YYYY''))';
  qryAuxiliar.ExecSQL;
  qryAuxiliar.Close;

  if dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.Commit;

  RefazSaldo;
  HabilitaTab;
  sbtnSaldos.Enabled    := True;

  bbtntTransfer.Visible := False;

  pnlFundo.Enabled      := True;

  bbtnConfirmar.Enabled := False;

end;


function TfrmCadOpeVirtual.AplicaResgata(Valor : Currency; sDescInvest : String): Boolean;
var
   iResult      : Byte;
   fSaldoCaixa  : Currency;
begin
   //AL_17
   fSaldoCaixa  := CaixaComum.BuscaSaldoCaixa(dbdtDataOperacao.DateTime,
                                              qryCarteiraOrigemIDCARTEIRAINVEST.AsInteger,
                                              qryCarteiraOrigemIDCARTEIRAGERENC.AsInteger,
                                              iPlanPrevCtbPatro, 'OPE');
   //AL_17
   iResult      := CaixaComum.AtualizaHistCaixa(dbdtDataOperacao.DateTime,
                                                qryCarteiraOrigemIDCARTEIRAINVEST.AsInteger,
                                                qryCarteiraOrigemIDCARTEIRAGERENC.AsInteger,
                                                qryAux.FieldByName('IDCARTEIRAXEVENTO').AsInteger,
                                                -1, -1,
                                                iPlanPrevCtbPatro,
                                                sDescInvest,
                                                Valor, fSaldoCaixa);
   Result       := Not (iResult In [1,2,3]);

   Case iResult of
        1: MsgDlg('O Evento encontrado não é um Evento de Caixa','Mensagem do Sistema', mtWarning,[mbOK],0);
        2: MsgDlg('Esta Carteira não possui um Evento de Caixa','Mensagem do Sistema', mtWarning,[mbOK],0);
        3: MsgDlg('Ocorreu um problema, Aplicação não efetivada.','Mensagem do Sistema', mtWarning,[mbOK],0);
   end;

end;

procedure TfrmCadOpeVirtual.FormShow(Sender: TObject);
begin
  inherited;
  pgcDetalhes.ActivePage := tbsCxGerencial;
  bbtntTransfer.Visible := False;
  bOperacao   := False;
  //AL_7
  HabilitaTab;
end;

procedure TfrmCadOpeVirtual.dblTipoOperacaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //AL_7
  if modified then
     HabilitaTab;
end;

procedure TfrmCadOpeVirtual.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin

  Accept := True;

  if Trim(dbdtDataOperacao.Text) = '' then
  begin
     MsgDlg('Data da Operação não preenchida','Mensagem do Sistema', mtWarning,[mbOK],0);
     Accept := False;
     if dbdtDataOperacao.CanFocus then
        dbdtDataOperacao.SetFocus;
     Exit;
  end;
  
  if Trim(dblTipoOperacao.Text) = '' then
  begin
     MsgDlg('Tipo de Operação não Selecionado','Mensagem do Sistema', mtWarning,[mbOK],0);
     Accept := False;
     if dblTipoOperacao.CanFocus then
        dblTipoOperacao.SetFocus;
     Exit;
  end;
  
  if qryOperacaoIDEVENTOCAIXACOTA.AsInteger <> 0 then
  begin
     if Trim(dblCarteiraCXGerencial.Text) = '' then
     begin
        MsgDlg('Carteira não Selecionada','Mensagem do Sistema', mtWarning,[mbOK],0);
        Accept := False;
        if dblCarteiraCXGerencial.CanFocus then
           dblCarteiraCXGerencial.SetFocus;
        Exit;
     end;
     if dbrValor.Value = 0 then
     begin
        MsgDlg('Valor não Informado','Mensagem do Sistema', mtWarning,[mbOK],0);
        Accept := False;
        if dbrValor.CanFocus then
           dbrValor.SetFocus;
        Exit;
     end;
  end else begin
     //AL_7
     if (((dbrQuantidadeAntiga.Value+dbrQuantidadeNova.Value) = 0)) then
     begin
        MsgDlg('Quantidade a ser Transferida não Informada','Mensagem do Sistema', mtWarning,[mbOK],0);
        Accept := False;
        if dbrQuantidadeAntiga.Value = 0 then
        begin
           if dbrQuantidadeAntiga.CanFocus then
              dbrQuantidadeAntiga.SetFocus;
        end
        else if dbrQuantidadeNova.Value = 0 then
        begin
           if dbrQuantidadeNova.CanFocus then
              dbrQuantidadeNova.SetFocus;
        end;
        Exit;
     end;
  end;

  inherited;

end;

procedure TfrmCadOpeVirtual.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if DtmBaseDados.dbBaseDados.InTransaction then
     DtmBaseDados.dbBaseDados.Rollback;
  //AL_7
  dbgDetCartOrigem.BringToFront;

  DbGrdAplResg.BringToFront;

  DbgDireito.BringToFront;       

  bOperacao    := False;
  bOperacaoDir := False;

  bbtnConfirmar.Caption   := '&Ok';

  dblTipoOperacao.Visible := True;
  lblTipoOperacao.Visible := True;

  pnlFundo.Enabled        := False;
  sbtnInserir.Enabled     := True;
  sbtnSaldos.Enabled      := True;
  sbtnSaldos.Down         := False;
  bbtntTransfer.Visible   := False;

  CmeCadastro.Cancel(Self);
  CmeCadastro.AtualizaBotoes(Self);

  qrySaldoCaixas.Close;
  If Trim(dbdtDataOperacao.Text) <> '' Then
     RefazSaldo;
  HabilitaTab;
  sbtnAlterar.Enabled := True;  
end;

procedure TfrmCadOpeVirtual.sbtnInserirClick(Sender: TObject);
begin
  // AL_8
  if RendaVariavel.VerEmAbertura then
  begin
     sbtnInserir.Down := False;
     Exit;
  end;

  inherited;
  sbtnSaldos.Enabled    := False;

  bbtntTransfer.Visible := True;

  //AL_16

  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := True;

  dblCarteiraOrigem.Text  := '';
  dblCarteiraDestino.Text := '';

  AtualizaSaldoOrigem(-1,-1,dbdtDataOperacao.DateTime);
  AtualizaSaldoDestino(-1,-1,dbdtDataOperacao.DateTime);
  SelectNext(pnlCampos,True,True);
end;

procedure TfrmCadOpeVirtual.HabilitaTab;
begin
  pnlEtiqueta.Visible    := False;
  if Trim(dblTipoOperacao.Text) <> '' then
  begin
     if qryOperacaoIDEVENTOCAIXACOTA.AsInteger = 0 then
     begin
        pnlEtiqueta.Visible    := True;     
        tbsTransf.Enabled      := True;
        tbsOperacoes.Enabled   := False;
        pgcDetalhes.ActivePage := tbsTransf;
        if dblCarteiraOrigem.CanFocus then
           dblCarteiraOrigem.SetFocus;
     end else if qryOperacaoIDTIPOOPERACAO.AsInteger = -53 then
     begin
        tbsTransf.Enabled      := False;
        tbsOperacoes.Enabled   := False;
        TbsDireitos.Enabled    := False;
        TbsEmprestimo.Enabled  := True;
        pgcDetalhes.ActivePage := TbsEmprestimo;
     end else if qryOperacaoIDEVENTOCAIXACOTA.AsInteger = -100 then
     begin
        tbsTransf.Enabled      := False;
        tbsOperacoes.Enabled   := False;
        TbsDireitos.Enabled    := True;
        pgcDetalhes.ActivePage := TbsDireitos;
     end else begin
        tbsTransf.Enabled      := False;
        tbsOperacoes.Enabled   := True;
        pgcDetalhes.ActivePage := tbsOperacoes;
     end;
  end else begin
     tbsTransf.Enabled         := False;
     tbsOperacoes.Enabled      := False;
     pgcDetalhes.ActivePage    := tbsCxGerencial;
  end;
end;

procedure TfrmCadOpeVirtual.dbgCXGerencialCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   if qrySaldoCaixas.IsEmpty then Exit;

   (* faz com que as linhas do grid tenham cores alternadas *)
   if State <> [gdSelected] then begin
      if not Highlight then begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; (* amarelo *)
         end else begin
            ABrush.Color := clWhite;
         end;         
      end;

   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmCadOpeVirtual.dbgCXGerencialTopRowChanged(Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmCadOpeVirtual.RefazSaldo;
begin
  //AL_17
  OperComum.LimpaParametros(qrySaldoCaixas);
  qrySaldoCaixas.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
  if Trim(dbdtDataOperacao.Text) = '' then
     qrySaldoCaixas.ParamByName('DATAHISTCAIXA').Clear
  else
     qrySaldoCaixas.ParamByName('DATAHISTCAIXA').AsString   := dbdtDataOperacao.Text;
  qrySaldoCaixas.Open;
end;

procedure TfrmCadOpeVirtual.dbdtDataOperacaoExit(Sender: TObject);
begin
  inherited;
  //AL_17
  //AL_7
  OperComum.LimpaParametros(QryAplResg);
  QryAplResg.ParamByName('DATAHISTCAIXA').AsString      := dbdtDataOperacao.Text;
  QryAplResg.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
  QryAplResg.Open;

  OperComum.LimpaParametros(QryDireito);
  QryDireito.ParamByName('DATAHISTCAIXA').AsString      := dbdtDataOperacao.Text;
  QryDireito.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
  QryDireito.Open;

  OperComum.LimpaParametros(QryEmprestimo);
  QryEmprestimo.ParamByName('DATAHISTCAIXA').AsString      := dbdtDataOperacao.Text;
  QryEmprestimo.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
  QryEmprestimo.Open;

  QryTipoOper.Close;
  QryTipoOper.Open;

  QryTipoOperEmp.Close;
  QryTipoOperEmp.Open;

  qrySaldoCaixas.Close;
  If Trim(dbdtDataOperacao.Text) <> '' Then
     RefazSaldo;
end;

procedure TfrmCadOpeVirtual.sbtnSaldosClick(Sender: TObject);
begin
  CmeCadastro.Insert(Self);
  pnlFundo.Enabled := True;
  dblTipoOperacao.Visible := False;
  lblTipoOperacao.Visible := False;
  bbtnConfirmar.Caption := '&Imprime';
  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled := True;
  sbtnInserir.Enabled := False;
  sbtnAlterar.Enabled := False;  
  sbtnSaldos.Down := True;
  SelectNext(pnlCampos,True,True);
  BtInc.Enabled      := False;
  BtAlt.Enabled      := False;
  BtExc.Enabled      := False;
end;

procedure TfrmCadOpeVirtual.ImpRelSaldo;
begin
  //AL_17
  OperComum.LimpaParametros(qrySaldoCaixaDet);
  qrySaldoCaixaDet.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
  qrySaldoCaixaDet.ParamByName('DATAHISTCAIXA').AsString      := dbdtDataOperacao.Text;
  qrySaldoCaixaDet.Open;
  qrySaldoCaixaDet.Filter := 'IDCARTEIRAINVEST = ' + qrySaldoCaixasIDCARTEIRAINVEST.AsString + ' AND ' +
                             'IDCARTEIRAGERENC = ' + qrySaldoCaixasIDCARTEIRAGERENC.AsString;
  if not qrySaldoCaixas.IsEmpty then
     TfrmPreview.CreateModalPreview(Application,
                                 DMRelSldCartGerenc.rptSldCartGerenc,
                                 DMRelSldCartGerenc.rptSldCartGerenc.PrinterSetup.DocumentName);
end;

procedure TfrmCadOpeVirtual.dblCarteiraOrigemCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if (modified) or (qrySaldosOrigem.IsEmpty)then
   begin
      AtualizaSaldoOrigem(qryCarteiraOrigemIDCARTEIRAINVEST.AsInteger,
                          qryCarteiraOrigemIDCARTEIRAGERENC.AsInteger,
                          dbdtDataOperacao.DateTime,
                          qryCarteiraOrigemIDCARTEIRA.AsInteger);
   end;
end;

procedure TfrmCadOpeVirtual.qrySaldosOrigemAfterScroll(DataSet: TDataSet);
begin
  inherited;
  //AL_7
  lblInvestimento.Caption   := qrySaldosOrigemDESCINVESTIMENTO.AsString;
  dbrQuantidadeAntiga.Value := qrySaldosOrigemSALDOINVANTIGA.AsFloat;
  dbrQuantidadeNova.Value   := qrySaldosOrigemSALDOINVNOVA.AsFloat;
  bbtntTransfer.Visible     := HabilitaTransf;
end;

function TfrmCadOpeVirtual.VerificaTransfDia(dDataOper             : TDateTime;
                                             iInvestimento,
                                             iCarteiraGerencOrig,
                                             iCarteiraGerencDest   : Integer) : Boolean;
begin
   OperComum.LimpaParametros(QryVerificaTransfDia);
   QryVerificaTransfDia.ParamByName('DATAOPERACAO').AsString          := DateToStr(dDataOper);
   QryVerificaTransfDia.ParamByName('IDINVESTIMENTO').AsInteger       := iInvestimento;
   QryVerificaTransfDia.ParamByName('IDCARTEIRAGERENCORIG').AsInteger := iCarteiraGerencOrig;
   QryVerificaTransfDia.ParamByName('IDCARTEIRAGERENCDEST').AsInteger := iCarteiraGerencDest;
   //AL_17
   QryVerificaTransfDia.ParamByName('IDPLANPREVCTBPATR').AsInteger    := iPlanPrevCtbPatro;
   QryVerificaTransfDia.Open;
   //Não há transf. desse investimento
   If QryVerificaTransfDia.IsEmpty Then
      Result := True
   Else
      Result := False;

   QryVerificaTransfDia.Close;      
end;

function TfrmCadOpeVirtual.Transfere: Boolean;
var
    //AL_18
    idCartGerDest, i, x, wPlanilha, wDocumento, wPlano, iIdCarteiraXEvento : Integer;
    wIdNovaOperacao                 : Integer;
    fCotacao, fValorOper            : Double;
    fCotacaoAnt, fValorOperAnt      : Double;
    fSaldoCaixa                     : Currency;
    wDtMov, dDataAnt, dDataVenc     : TDateTime;
    wNumDoc                         : String;
    //AL_7
    fQuantidade, fSaldoQtd, fSaldoVlr, fSaldoInutil, fSaldoAqui, fSaldoRend,
    fSaldoVariacao, fSaldoIrApu, fSaldoQtdCPMF : Double;
begin
   //AL_18
   idCartGerDest := qryCarteiraDestinoIDCARTEIRAGERENC.AsInteger;

   //AL_7
   if ((dbrQuantidadeAntiga.Value + dbrQuantidadeNova.Value) <= 0)  then
   begin
      MsgDlg('Atenção : A quantidade a transferir tem que ser maior que zero.',
             'Mensagem do Sistema', MtWarning, [MbOk], 0);
      Exit;
   end;

   if (dbrQuantidadeAntiga.Value > qrySaldosOrigemSALDOINVANTIGA.AsFloat) then
   begin
      MsgDlg('Atenção : A quantidade a transferir é maior que o Saldo Antigo - CC.',
             'Mensagem do Sistema', MtWarning, [MbOk], 0);
      Exit;
   end;

   if (dbrQuantidadeNova.Value   > qrySaldosOrigemSALDOINVNOVA.AsFloat) then
   begin
      MsgDlg('Atenção : A quantidade a transferir é maior que o Saldo Novo - CCI.',
             'Mensagem do Sistema', MtWarning, [MbOk], 0);
      Exit;
   end;

   //AL_6
   //AL_15
   if not CtrlInvContab.TestaPeriodo(dbdtDataOperacao.Text, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dbdtDataOperacao.CanFocus then
         dbdtDataOperacao.SetFocus;
      Exit;
   end;

   If Not VerificaTransfDia(dbdtDataOperacao.Date,
                            qrySaldosOrigemIDINVESTIMENTO.AsInteger,
                            qryCarteiraOrigemIDCARTEIRAGERENC.AsInteger,
                            qryCarteiraDestinoIDCARTEIRAGERENC.AsInteger) Then
   begin
      MsgDlg('Atenção : Já há transferência para esse investimento entre uma das Carteiras.',
             'Mensagem do Sistema', MtWarning, [MbOk], 0);
      Exit;
   end;

   //Al_9
   //Se existir anuncios ou recebimentos. avisa que existe a operação
   VerificaRecDireitos(dbdtDataOperacao.Date,
                       qrySaldosOrigemIDINVESTIMENTO.AsInteger,
                       qryCarteiraOrigemIDCARTEIRAGERENC.AsInteger);

   //AL_7
   frmAguardeInv.Max := (10*2) + 4;
   frmAguardeInv.Mostra('Efetuando transferência...');
   MostraValor(True, dbrQuantidadeAntiga.Value+dbrQuantidadeNova.Value);
   frmAguardeInv.Pos := 0;
   Result            := True; 
   try
      try
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;
         //AL_7
         //AL_10
         //AL_12
         //AL_14
         //AL_17

         for x := 1 to 2 do
         begin
            wPlanilha   := -1;
            wDocumento  := -1;
            wPlano      := -1;

            frmAguardeInv.Pos := frmAguardeInv.Pos + 1;
            //VENDA DE AÇÕES
            qryTpOper.Close;
            qryTpOper.ParamByName('NATUREZAOPERACAO').AsString := 'D';
            qryTpOper.Open;
            if x = 2 then //Nova - CCI
            begin
               fQuantidade := dbrQuantidadeNova.Value;
               if fQuantidade > 0 then
               begin
                  if not qryTpOper.Locate('FLGCONTAINVEST' ,'1' , []) then
                     Raise Exception.Create('O tipo de operação da Origem para conta CCI não foi encontrado');
               end
               else
               begin
                  frmAguardeInv.Pos := frmAguardeInv.Pos + 9;
                  continue;
               end;
            end
            else          //Antiga - CC
            begin
               fQuantidade := dbrQuantidadeAntiga.Value;
               if fQuantidade > 0 then
               begin
                  if (not qryTpOper.Locate('FLGCONTAINVEST' ,NULL, [])) then
                     if (not qryTpOper.Locate('FLGCONTAINVEST', 0, [])) then
                        Raise Exception.Create('O tipo de operação da Origem para conta CC não foi encontrado');
               end
               else
               begin
                  frmAguardeInv.Pos := frmAguardeInv.Pos + 9;
                  continue;
               end;
            end;

            i := 1;
            dDataVenc := dbdtDataOperacao.Date;
            While i<= qryTpOper.FieldByName('VENCIMENTO').AsInteger Do
            Begin
               dDataVenc   := dDataVenc+1;
               While not DiasUteisInv.DiaUtil(dDataVenc,-1,1,'',True,False,False) Do
                 dDataVenc := dDataVenc+1;   
               i:=i+1;
            End;

            fCotacao   := 0;
            fCotacao   := OperComum.BuscaCotacaoAcao(qrySaldosOrigemIDINVESTIMENTO.AsInteger,
                                                     dbdtDataOperacao.Date,True);
            fValorOper := fQuantidade * fCotacao;

            if fValorOper <> 0 then
               fValorOper := fValorOper - 0.0049;

            if fCotacao = 0 then
               Raise Exception.Create('Falta Cotação de ' + dbdtDataOperacao.Text + ' para ' + qrySaldosOrigemDESCINVESTIMENTO.AsString);

            wNumDoc   := 'RV-'+Copy(dbdtDataOperacao.Text,9,2)+'/'+FormatFloat('0000',
                            LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(dbdtDataOperacao.Text,9,2)));

            frmAguardeInv.Pos := frmAguardeInv.Pos + 1;

            //AL_17
            OperComum.LimpaParametros(QryBoleta);
            QryBoleta.ParamByName('IDBOLETA').AsString := wNumDoc;
            QryBoleta.Open;
            If QryBoleta.IsEmpty then
            begin
               OperComum.LimpaParametros(QryInsertBoleta);
               QryInsertBoleta.ParamByName('IDBOLETA').AsString     := wNumDoc;
               QryInsertBoleta.ParamByName('STATUS').AsString       := 'F';
               QryInsertBoleta.ParamByName('TIPMOVBOLETA').AsString := 'TCG';
               QryInsertBoleta.ParamByName('DATABOLETA').AsString   := dbdtDataOperacao.Text;
               QryInsertBoleta.ExecSQL;
            end;
            QryBoleta.Close;

            wIdNovaOperacao   := LeUltRegistro(Nil,'OPERACAOINVEST');

            GravaOperacaoInvest(wIdNovaOperacao,
                                qrySaldosOrigemMOECODIGO.AsInteger,
                                Sistema.IdModulo, Sistema.IdEmpresa,
                                qrySaldosOrigemIDINVESTIMENTO.AsInteger,
                                qrySaldosOrigemIDCARTEIRAINVEST.AsInteger, 2,
                                qryTpOperIDTIPOOPERACAO.AsInteger, -1, -1, -1,
                                qrySaldosOrigemIDCARTEIRAGERENC.AsInteger,
                                dbdtDataOperacao.Date,
                                dDataVenc,
                                wNumDoc,
                                // AL_11
                                'F' {Status de Fechamento da Boleta} ,
                                qryTpOperNATUREZAOPERACAO.AsString {Natureza Movimento},
                                qrySaldosOrigemIDLOTE.AsString,
                                fQuantidade,
                                fValorOper/fQuantidade,
                                fValorOper,0,0,0,0);

            frmAguardeInv.Pos := frmAguardeInv.Pos + 1;

            // Alimenta Carteira
            If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                              qrySaldosOrigemIDINVESTIMENTO.AsInteger,
                                              2,wIdNovaOperacao, -1,
                                              qryTpOperIDTIPOOPERACAO.AsInteger,
                                              qrySaldosOrigemIDCARTEIRAINVEST.AsInteger,
                                              qrySaldosOrigemIDCARTEIRAGERENC.AsInteger,
                                              -1, -1, wPlanilha, wDocumento, wPlano,
                                              dbdtDataOperacao.Date,
                                              fValorOper,
                                              fQuantidade,
                                              pRPI.VLRCOTAINICART, 0, 0 , 0, 0, 0, 0, 0, 0, 0,
                                              qryTpOperNATUREZAOPERACAO.AsString,
                                              qryTpOperNATUREZAOPERACAO.AsString,
                                              qrySaldosOrigemIDLOTE.AsString,
                                             'Transferência Negativa de Carteira Gerencia : ' + qrySaldosOrigemDESCINVESTIMENTO.AsString,
                                             'TCG', '', '', True,
                                             -1, iPlanPrevCtbPatro, iIdHistCartInv) Then
               Raise Exception.Create('Ocorreu um problema ao Alimentar a Carteiras na baixa da Transferência.');

            frmAguardeInv.Pos := frmAguardeInv.Pos + 1;

            if Not OperComum.AtualizaSaldos(1,-1) then
               Raise Exception.Create('Ocorreu um problema ao Atualizar Saldos após a baixa da Transferência.');

            frmAguardeInv.Pos := frmAguardeInv.Pos + 1;

            //Al_2

            fValorOperAnt := fQuantidade * fCotacao;

            //Al_1
            if fValorOperAnt <> 0 then
               fValorOperAnt := fValorOperAnt - 0.0049;

            iIdCarteiraXEvento  := CotaComum.BuscaEventoPorTpOper(
                                             qrySaldosOrigemIDCARTEIRAINVEST.AsInteger,
                                             qrySaldosOrigemIDCARTEIRAGERENC.AsInteger,
                                             qryTpOperIDTIPOOPERACAO.AsInteger);

            If iIdCarteiraXEvento = 0 Then
               Raise Exception.Create('Não foi encontrado o evento de Caixa/Cota para a Carteira Gerencial.');

            //AL_17
            If Not ProvisaoComum.GravaProvisao(dDataVenc,
                                               dDataVenc,
                                               qrySaldosOrigemIDCARTEIRAINVEST.AsInteger,
                                               qrySaldosOrigemIDCARTEIRAGERENC.AsInteger,
                                               iIdCarteiraXEvento,
                                               wIdNovaOperacao,
                                               0,
                                               iPlanPrevCtbPatro,
                                               fValorOperAnt) Then
               Raise Exception.Create('Ocorreu um problema ao gravar o evento de Caixa de baixa da Transferência.');

            frmAguardeInv.Pos := frmAguardeInv.Pos + 1;

            //COMPRA DE AÇÕES
            qryTpOper.Close;
            qryTpOper.ParamByName('NATUREZAOPERACAO').AsString := 'A';
            qryTpOper.Open;
            if x = 2 then //CCI
            begin
               if not qryTpOper.Locate('FLGCONTAINVEST', '1', []) then
                  Raise Exception.Create('O tipo de operação da Destino para conta CCI não foi encontrado');
            end
            else          //CC
            begin
               if (not qryTpOper.Locate('FLGCONTAINVEST' ,NULL, [])) then
                  if (not qryTpOper.Locate('FLGCONTAINVEST', 0, [])) then
                     Raise Exception.Create('O tipo de operação da Destino para conta CC não foi encontrado');
            end;

            i := 1;
            dDataVenc := dbdtDataOperacao.Date;
            While i<= qryTpOper.FieldByName('VENCIMENTO').AsInteger Do
            Begin
               dDataVenc   := dDataVenc+1;
               While not DiasUteisInv.DiaUtil(dDataVenc,-1,1,'',True,False,False) Do
                 dDataVenc := dDataVenc+1;   
               i:=i+1;
            End;

            fValorOper := fQuantidade * fCotacao;

            //Al_1
            if fValorOper <> 0 then
               fValorOper := fValorOper - 0.0049;

            wIdNovaOperacao   := LeUltRegistro(Nil,'OPERACAOINVEST');

            GravaOperacaoInvest(wIdNovaOperacao,
                                qrySaldosOrigemMOECODIGO.AsInteger,
                                Sistema.IdModulo, Sistema.IdEmpresa,
                                qrySaldosOrigemIDINVESTIMENTO.AsInteger,
                                qryCarteiraDestinoIDCARTEIRAINVEST.AsInteger, 2,
                                qryTpOperIDTIPOOPERACAO.AsInteger, -1, -1, -1,
                                qryCarteiraDestinoIDCARTEIRAGERENC.AsInteger,
                                dbdtDataOperacao.Date,
                                dDataVenc,
                                wNumDoc,
                                // AL_11
                                'F' {Status de Fechamento da Boleta} ,
                                qryTpOperNATUREZAOPERACAO.AsString {Natureza Movimento},
                                qrySaldosOrigemIDLOTE.AsString,
                                fQuantidade,
                                fValorOper/fQuantidade,
                                fValorOper,0,0,0,0);

            frmAguardeInv.Pos := frmAguardeInv.Pos + 1;

            if Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                              qrySaldosOrigemIDINVESTIMENTO.AsInteger,
                                              2, wIdNovaOperacao, -1,
                                              qryTpOperIDTIPOOPERACAO.AsInteger,
                                              qryCarteiraDestinoIDCARTEIRAINVEST.AsInteger,
                                              qryCarteiraDestinoIDCARTEIRAGERENC.AsInteger,
                                              -1, -1, wPlanilha, wDocumento, wPlano,
                                              dbdtDataOperacao.Date,
                                              fValorOper, fQuantidade,
                                              pRPI.VLRCOTAINICART, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                              qryTpOperNATUREZAOPERACAO.AsString,
                                              qryTpOperNATUREZAOPERACAO.AsString,
                                              qrySaldosOrigemIDLOTE.AsString,
                                              'Transferência Positiva de Carteira Gerencial : ' + qrySaldosOrigemDESCINVESTIMENTO.AsString,
                                              'TCG', '', '', True,
                                              -1, iPlanPrevCtbPatro, iIdHistCartInv) then
               Raise Exception.Create('Ocorreu um problema ao Alimentar a Carteiras no acréscimo da Transferência.');

            frmAguardeInv.Pos := frmAguardeInv.Pos + 1;

            if Not OperComum.AtualizaSaldos(1,-1) then
               Raise Exception.Create('Ocorreu um problema ao Atualizar Saldos após o acréscimo da Transferência.');

            frmAguardeInv.Pos := frmAguardeInv.Pos + 1;

            iIdCarteiraXEvento  := CotaComum.BuscaEventoPorTpOper(
                                             qryCarteiraDestinoIDCARTEIRAINVEST.AsInteger,
                                             qryCarteiraDestinoIDCARTEIRAGERENC.AsInteger,
                                             qryTpOperIDTIPOOPERACAO.AsInteger);

            If iIdCarteiraXEvento = 0 Then
               Raise Exception.Create('Não foi encontrado o evento de Caixa/Cota para a Carteira Gerencial.');

            //AL_17
            If Not ProvisaoComum.GravaProvisao(dDataVenc,
                                               dDataVenc,
                                               qryCarteiraDestinoIDCARTEIRAINVEST.AsInteger,
                                               qryCarteiraDestinoIDCARTEIRAGERENC.AsInteger,
                                               iIdCarteiraXEvento,
                                               wIdNovaOperacao,
                                               0,
                                               iPlanPrevCtbPatro,
                                               fValorOperAnt) Then
               Raise Exception.Create('Ocorreu um problema ao gravar o evento de Caixa de acréscimo da Transferência.');

            frmAguardeInv.Pos := frmAguardeInv.Pos + 1;

         end;

         qryTpOper.Close;

         If dbdtDataOperacao.Date < pRPI.DATAULTFECH Then
            RendaVariavel.MarcarFlagReproc(qrySaldosOrigemIDINVESTIMENTO.AsInteger, -1, -1,
                                           dbdtDataOperacao.Date);

         frmAguardeInv.Pos := frmAguardeInv.Pos + 1;

         //Exclui o histórico de cotas da carteira gerencial para ser reprocessada ...
         wDtMov    := dbdtDataOperacao.Date;
         //AL_5
         //AL_4
         if wDtMov <= (pRPI.DATAULTFECH-60) then
            wDtMov := (pRPI.DATAULTFECH-60)+1;

         qryAuxiliar.Close;
         qryAuxiliar.SQL.Clear;
         qryAuxiliar.SQL.Text:= 'DELETE FROM HISTCOTA WHERE (DATAHISTCOTA >= TO_DATE('''+DateToStr(wDtMov)+''',''DD/MM/YYYY'')) ';
         qryAuxiliar.ExecSQL;
         qryAuxiliar.Close;

         frmAguardeInv.Pos := frmAguardeInv.Pos + 1;

         bbtnConfirmar.Enabled := True;

         Result := True;

      except
         on E: Exception do
         begin
            MsgDlg('Não foi possível realizar a Operação.' + #13 +
                    E.Message, 'Mensagem do Sistema',mtWarning,[mbOK],0);
            bbtnCancelar.Click;
            Result := False;
            Exit;
         end;
      end;
   finally
      //AL_7
      qrySaldosOrigem.DisableControls;
      // Atualiza Saldos Origem 
      dblCarteiraOrigem.PerformSearch;
      
      AtualizaSaldoOrigem(qryCarteiraOrigemIDCARTEIRAINVEST.AsInteger,
                          qryCarteiraOrigemIDCARTEIRAGERENC.AsInteger,
                          dbdtDataOperacao.DateTime,
                          qryCarteiraOrigemIDCARTEIRA.AsInteger);
      qrySaldosOrigem.EnableControls;

      frmAguardeInv.Pos := frmAguardeInv.Pos + 1;

      //AL_18
      // Atualiza Saldos Destino
      qrySaldosDestino.DisableControls;
      qryCarteiraDestino.Locate('IDCARTEIRAGERENC',idCartGerDest,[]);
      dblCarteiraDestino.Text        := qryCarteiraDestinoCARTEIRA.AsString;
      AtualizaSaldoDestino(qryCarteiraDestinoIDCARTEIRAINVEST.AsInteger,
                           qryCarteiraDestinoIDCARTEIRAGERENC.AsInteger,
                           dbdtDataOperacao.DateTime);
      qrySaldosDestino.EnableControls;
      //AL_7
      frmAguardeInv.Pos := frmAguardeInv.Pos + 1;      

      frmAguardeInv.Apaga;
      dbgDetCartOrigem.BringToFront;
      MostraValor(False, 0);
      sbtnAlterar.Enabled := False;
   end;
end;

function TfrmCadOpeVirtual.HabilitaTransf: Boolean;
begin
  //AL_7
  sbtnAlterar.Enabled := False;
  if (not (qrySaldosOrigem.IsEmpty))and
     (Trim(dblCarteiraDestino.Text) <> '') and
     ((dbrQuantidadeAntiga.Value+dbrQuantidadeNova.Value) <> 0) and
     (not (bbtnConfirmar.Enabled)) then
     Result :=  True
  else Result := False;

end;

procedure TfrmCadOpeVirtual.LimpaSaldos(sQuerie: Char);
begin
   if sQuerie in ['O','A'] then
   begin
      OperComum.LimpaParametros(qrySaldosOrigem);
      qrySaldosOrigem.Open;
   end;

   if sQuerie in ['D','A'] then
   begin
      OperComum.LimpaParametros(qrySaldosDestino);
      qrySaldosDestino.Open;
   end;

end;

//AL_17

procedure TfrmCadOpeVirtual.AtualizaSaldoOrigem(iCartP, iCartG: Integer;
                                                dData: TDateTime;
                                                iCartO: Integer = 0);
begin
   //AL_13
   OperComum.LimpaParametros(qrySaldosOrigem);
   //AL_17
   qrySaldosOrigem.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCartP;
   qrySaldosOrigem.ParamByName('IDCARTEIRAGERENC').AsInteger  := iCartG;
   qrySaldosOrigem.ParamByName('DATAMOVCARTINV').AsString     := dbdtDataOperacao.Text;
   qrySaldosOrigem.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

   OperComum.LimpaParametros(qryCarteiraDestino);
   if iCartO > 0 then
   begin
      if qryCarteiraDestino.ParamByName('IDCARTEIRA').AsInteger <> iCartO then
      begin
         qryCarteiraDestino.ParamByName('IDCARTEIRA').AsInteger := iCartO;
         qryCarteiraDestino.Open;
         if Trim(dblCarteiraDestino.Text) <> '' then
            AtualizaSaldoDestino(qryCarteiraDestinoIDCARTEIRAINVEST.AsInteger,
                                 qryCarteiraDestinoIDCARTEIRAGERENC.AsInteger,
                                 dbdtDataOperacao.DateTime)
         else
            LimpaSaldos('D');
      end;
   end else begin
      qryCarteiraDestino.ParamByName('IDCARTEIRA').Clear;
      qryCarteiraDestino.Open;
      LimpaSaldos('D');
   end;

   qrySaldosOrigem.Open;

   if not qrySaldosOrigem.IsEmpty then
   begin
      //AL_7
      dbrQuantidadeAntiga.Value := qrySaldosOrigemSALDOINVANTIGA.AsFloat;
      dbrQuantidadeNova.Value   := qrySaldosOrigemSALDOINVNOVA.AsFloat;
      bbtntTransfer.Visible     := HabilitaTransf;
   end;
end;

procedure TfrmCadOpeVirtual.AtualizaSaldoDestino(iCartP, iCartG: Integer;
                                                 dData: TDateTime);
begin
   //AL_13
   OperComum.LimpaParametros(qrySaldosDestino);
   with qrySaldosDestino do
   begin
      //AL_17
      ParamByName('IDCARTEIRAINVEST').AsInteger  := iCartP;
      ParamByName('IDCARTEIRAGERENC').AsInteger  := iCartG;
      ParamByName('DATAMOVCARTINV').AsString     := dbdtDataOperacao.Text;
      ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      Open;
      bbtntTransfer.Visible := HabilitaTransf;
   end;
end;


procedure TfrmCadOpeVirtual.dblCarteiraDestinoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
     AtualizaSaldoDestino(qryCarteiraDestinoIDCARTEIRAINVEST.AsInteger,
                          qryCarteiraDestinoIDCARTEIRAGERENC.AsInteger,
                          dbdtDataOperacao.DateTime);
end;

procedure TfrmCadOpeVirtual.dbgDetCartOrigemKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   If Key = VK_F5 Then      
   begin
      dblCarteiraOrigem.PerformSearch;
      AtualizaSaldoOrigem(qryCarteiraOrigemIDCARTEIRAINVEST.AsInteger,
                          qryCarteiraOrigemIDCARTEIRAGERENC.AsInteger,
                          dbdtDataOperacao.DateTime);
   end;
end;

procedure TfrmCadOpeVirtual.dbgDetCartDestinoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   If Key = VK_F5 Then
   begin
      dblCarteiraDestino.PerformSearch;
      AtualizaSaldoDestino(qryCarteiraDestinoIDCARTEIRAINVEST.AsInteger,
                           qryCarteiraDestinoIDCARTEIRAGERENC.AsInteger,
                           dbdtDataOperacao.DateTime);
   end;
end;

//AL_7
procedure TfrmCadOpeVirtual.FormActivate(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled    := True;
   sbtnAlterar.Enabled := True;
end;

procedure TfrmCadOpeVirtual.BtIncClick(Sender: TObject);
begin
   //AL_8
   if RendaVariavel.VerEmAbertura then
   begin
      BtInc.Down := False;
      Exit;
   end;

   If not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   PnlResgate.BringToFront;

   dblCarteiraCXGerencial.SetFocus;
   dblCarteiraCXGerencial.Clear;
   dbrValor.Clear;

   BtOk.Enabled    := True;
   BtCanc.Enabled  := True;
   BtVolta.Enabled := True;

   bOperacao       := True;

end;

procedure TfrmCadOpeVirtual.BtOkClick(Sender: TObject);
begin
  //AL_6
  //AL_15
  if Trim(dbdtDataOperacao.Text) = '' then
  begin
     MsgDlg('Data da Operação não informada.','Mensagem do Sistema', mtWarning,[mbOK],0);
     if dbdtDataOperacao.CanFocus then
        dbdtDataOperacao.SetFocus;
     Exit;
  end;

  if not CtrlInvContab.TestaPeriodo(dbdtDataOperacao.Text, 2) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbdtDataOperacao.CanFocus then
        dbdtDataOperacao.SetFocus;
     Exit;
  end;

  pnlFundo.Enabled := True;

  If BtInc.Down Then
  Begin
    //AL_17
    BtInc.Down := False;  

    FazQuery(QryAux,'SELECT IDCARTEIRAXEVENTO FROM CARTEIRAXEVENTO ' +
                    'WHERE  IDCARTEIRAGERENC  = ' + qryCarteiraOrigemIDCARTEIRAGERENC.AsString + ' AND ' +
                    '       IDEVENTOCAIXACOTA = ' + qryOperacaoIDEVENTOCAIXACOTA.AsString);

    OperComum.LimpaParametros(QryHistCaixa);
    QryHistCaixa.ParamByName('DATAHISTCAIXA').AsString       := dbdtDataOperacao.Text;
    QryHistCaixa.ParamByName('IDCARTEIRAGERENC').AsInteger   := qryCarteiraOrigemIDCARTEIRAGERENC.AsInteger;
    QryHistCaixa.ParamByName('IDCARTEIRAINVEST').AsInteger   := qryCarteiraOrigemIDCARTEIRAINVEST.AsInteger;
    QryHistCaixa.ParamByName('IDCARTEIRAXEVENTO').AsInteger  := qryAux.FieldByName('IDCARTEIRAXEVENTO').AsInteger;
    QryHistCaixa.ParamByName('IDPLANPREVCTBPATR').AsInteger  := iPlanPrevCtbPatro;
    QryHistCaixa.Open;
    If Not QryHistCaixa.IsEmpty Then
    Begin
       MsgDlg('Já há resgistro para essa Data e essa Carteira.','Mensagem do Sistema',mtInformation ,[mbOK],0);
       BtCancClick(Sender);
       Exit;
    End;

    If Not AplicaResgata(dbrValor.Value, qryOperacaoDESCCAIXACOTA.AsString) Then
       BtCancClick(Sender);

  End
  Else If BtAlt.Down Then
  Begin
     BtAlt.Down       := False;

     ExecutaQuery(QryAux,'DELETE FROM HISTCAIXA WHERE IDHISTCAIXA = '+
                         IntToStr(QryAplResg.FieldByName('IDHISTCAIXA').AsInteger));

     FazQuery(QryAux,'SELECT IDCARTEIRAXEVENTO FROM CARTEIRAXEVENTO ' +
                     'WHERE  IDCARTEIRAGERENC  = ' + qryCarteiraOrigemIDCARTEIRAGERENC.AsString + ' AND ' +
                     '       IDEVENTOCAIXACOTA = ' + qryOperacaoIDEVENTOCAIXACOTA.AsString);

     If Not AplicaResgata(dbrValor.Value, qryOperacaoDESCCAIXACOTA.AsString) Then
        BtCancClick(Sender);

  End;

  qryAux.Close;  

  Label7.Enabled  := True;
  dblCarteiraCXGerencial.Enabled := True;

  DbGrdAplResg.BringToFront;

  OperComum.LimpaParametros(QryAplResg);
  QryAplResg.ParamByName('DATAHISTCAIXA').AsString      := dbdtDataOperacao.Text;
  QryAplResg.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
  QryAplResg.Open;

  PgcDetalhes.ActivePage := tbsOperacoes;

  bbtnConfirmar.Enabled  := True;
  bbtnCancelar.Enabled   := True;

  BtInc.Down := False;
  BtAlt.Down := False;
  BtExc.Down := False;

end;

procedure TfrmCadOpeVirtual.BtCancClick(Sender: TObject);
begin
  inherited;

   If dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;

   QryAplResg.Close;
   QryAplResg.Open;

   Label7.Enabled  := True;
   dblCarteiraCXGerencial.Enabled := True;

   DbGrdAplResg.BringToFront;

   BtInc.Down      := False;
   BtAlt.Down      := False;
   BtExc.Down      := False;

   BtOk.Enabled    := False;
   BtCanc.Enabled  := False;
   BtVolta.Enabled := False;

   dblCarteiraCXGerencial.Text := '';

   dbrValor.Clear;

   pnlFundo.Enabled := True;

   bbtnConfirmar.Enabled := False;

   bOperacao        := False;

end;

procedure TfrmCadOpeVirtual.BtExcClick(Sender: TObject);
var
   fSaldoCaixa : Currency;
   sSqlText    : String;
   wDtMov : TDateTime;
begin
  //AL_8
  if RendaVariavel.VerEmAbertura then
  begin
     BtExc.Down := False;
     Exit;
  end;

  inherited;

  //AL_6
  //AL_15
  if Trim(dbdtDataOperacao.Text) = '' then
  begin
     MsgDlg('Data da Operação não informada.','Mensagem do Sistema', mtWarning,[mbOK],0);
     if dbdtDataOperacao.CanFocus then
        dbdtDataOperacao.SetFocus;
     Exit;
  end;

  if not CtrlInvContab.TestaPeriodo(dbdtDataOperacao.Text, 2) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbdtDataOperacao.CanFocus then
        dbdtDataOperacao.SetFocus;
     Exit;
  end;

  If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
            [mbYes, mbNo],0) = mrYes  Then
  Begin
     If not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

     fSaldoCaixa := CaixaComum.BuscaSaldoCaixa(StrToDate(dbdtDataOperacao.Text),
                                               QryAplResg.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                               QryAplResg.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                               -1,'');
     //Aplicação
     If qryOperacao.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -9 Then
        fSaldoCaixa := fSaldoCaixa - QryAplResg.FieldByName('VLRHISTCAIXA').AsFloat
     Else
        fSaldoCaixa := fSaldoCaixa + QryAplResg.FieldByName('VLRHISTCAIXA').AsFloat;

     ExecutaQuery(QryAux,'DELETE HISTCAIXA WHERE IDHISTCAIXA = '+
                          QryAplResg.FieldByName('IDHISTCAIXA').AsString);

     //Trata carteira gerencial
     If QryAplResg.FieldByName('IDCARTEIRAGERENC').AsInteger <> 0 Then
        sSqlText := 'IDCARTEIRAGERENC = '+QryAplResg.FieldByName('IDCARTEIRAGERENC').AsString;

     sSqlText    := sSqlText+' AND IDHISTCAIXA > '+QryAplResg.FieldByName('IDHISTCAIXA').AsString;

     //AL_17
     //verifica se e um registro de atualização
     FazQuery(QryAux,'SELECT * FROM HISTCAIXA WHERE  IDHISTCAIXA IN '+
                     '( SELECT MAX(IDHISTCAIXA) FROM HISTCAIXA      '+
                     '  WHERE IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+
                     '  AND   IDCARTEIRAINVEST  = '+QryAplResg.FieldByName('IDCARTEIRAINVEST').AsString+
                     '  AND   IDCARTEIRAGERENC > 0 '+
                     '  AND   DATAHISTCAIXA     = TO_DATE('''+dbdtDataOperacao.Text+''',''DD/MM/YYYY'')  '+
                     '  GROUP BY IDPLANPREVCTBPATR, IDCARTEIRAINVEST, IDCARTEIRAGERENC) AND '+
                      sSqlText);

     //sendo um registro de atualização de caixa deleta
     If QryAux.FieldByName('TIPMOVCAIXA').AsString = 'ATU' Then
        ExecutaQuery(QryAux,'DELETE FROM HISTCAIXA WHERE  IDHISTCAIXA IN '+
                            '( SELECT MAX(IDHISTCAIXA) FROM HISTCAIXA    '+
                            '  WHERE  IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+
                            '  AND    IDCARTEIRAINVEST  = '+QryAplResg.FieldByName('IDCARTEIRAINVEST').AsString+
                            '  AND    IDCARTEIRAGERENC > 0 '+
                            '  AND    DATAHISTCAIXA     = TO_DATE('''+dbdtDataOperacao.Text+''',''DD/MM/YYYY'') '+
                            '  GROUP BY IDPLANPREVCTBPATR, IDCARTEIRAINVEST, IDCARTEIRAGERENC) AND '+
                            sSqlText);

     //atualiza o caixa, devido ao ultimo lançamento do dia
     ExecutaQuery(QryAux,'UPDATE HISTCAIXA SET SLDHISTCAIXA = '+TrocaVirgulaPonto(FloatToStr(fSaldoCaixa))+' '+
                         'WHERE  IDHISTCAIXA IN '+
                         ' ( SELECT MAX(IDHISTCAIXA) FROM HISTCAIXA  '+
                         '   WHERE  IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+
                         '   AND    IDCARTEIRAINVEST  = '+QryAplResg.FieldByName('IDCARTEIRAINVEST').AsString+
                         '   AND    IDCARTEIRAGERENC > 0 '+
                         '   AND    DATAHISTCAIXA     = TO_DATE('''+dbdtDataOperacao.Text+''',''DD/MM/YYYY'')  '+
                         '   GROUP BY IDPLANPREVCTBPATR, IDCARTEIRAINVEST, IDCARTEIRAGERENC) AND '+
                          sSqlText);
     QryAux.Close;

     wDtMov    := dbdtDataOperacao.Date;
     //AL_5
     //AL_4
     if wDtMov <= (pRPI.DATAULTFECH-60) then
        wDtMov := (pRPI.DATAULTFECH-60)+1;

     qryAuxiliar.Close;
     qryAuxiliar.SQL.Clear;
     qryAuxiliar.SQL.Text:= 'DELETE FROM HISTCOTA WHERE (DATAHISTCOTA >= TO_DATE('''+DateToStr(wDtMov)+''',''DD/MM/YYYY''))';
     qryAuxiliar.ExecSQL;
     qryAuxiliar.Close;

     dtmBaseDados.dbBaseDados.Commit;

     BtExc.Down      := False;

     QryAplResg.Close;
     QryAplResg.Open;
  End;

  RefazSaldo;
  HabilitaTab;
  sbtnSaldos.Enabled := True;

  pnlFundo.Enabled   := True;

end;

procedure TfrmCadOpeVirtual.BtAltClick(Sender: TObject);
begin
   // AL_8
   if RendaVariavel.VerEmAbertura then
   begin
      BtAlt.Down := False;
      Exit;
   end;

   inherited;

   If not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   PnlResgate.BringToFront;

   qryCarteiraOrigem.Locate('IDCARTEIRAGERENC;IDCARTEIRAINVEST',
                    VarArrayOf([QryAplResg.FieldByName('IDCARTEIRAGERENC').AsString,
                                QryAplResg.FieldByName('IDCARTEIRAINVEST').AsString]),
                    [loPartialKey]);

   dblCarteiraCXGerencial.Enabled := True;
   dblCarteiraCXGerencial.Text    := qryCarteiraOrigem.FieldByName('CARTEIRA').AsString;

   dbrValor.Value  := QryAplResg.FieldByName('VLRHISTCAIXA').AsFloat;

   Label7.Enabled  := False;
   dblCarteiraCXGerencial.Enabled := False;

   BtOk.Enabled    := True;
   BtCanc.Enabled  := True;
   BtVolta.Enabled := True;

   bOperacao       := True;
                                             
end;

procedure TfrmCadOpeVirtual.pgcDetalhesChange(Sender: TObject);
begin
  inherited;
  //AL_17
  If (QryAplResg.IsEmpty) Then
  Begin
     BtAlt.Enabled := False;
     BtExc.Enabled := False;
  End
  Else If sbtnAlterar.Enabled Then
  Begin
     BtAlt.Enabled := True;
     BtExc.Enabled := True;
  End;

  If (BtAlt.Down) Or (BtInc.Down) Or (bOperacao) then
  Begin
     if MsgDlg( 'Alguns dados informados ainda não foram gravados.'+#13+#10+'Deseja realmente sair da tela?',
                'Alterações pendentes', mtWarning, [mbYes, mbNo],0) = mrNo then
        pgcDetalhes.ActivePage := tbsOperacoes
     else
        BtCanc.Click;
  End;

  If (BtAltDir.Down) Or (BtIncDir.Down) Or (bOperacaoDir) then
  begin
     if MsgDlg( 'Alguns dados informados ainda não foram gravados.'+#13+#10+'Deseja realmente sair da tela?',
                'Alterações pendentes', mtWarning, [mbYes, mbNo],0) = mrNo then
        pgcDetalhes.ActivePage := TbsDireitos
     else
        BtCancDir.Click;
  end;
  //AL_7
  bbtntTransfer.Visible := False;
  if pgcDetalhes.ActivePage = tbsTransf then
     bbtntTransfer.Visible := True;

end;

procedure TfrmCadOpeVirtual.sbtnAlterarClick(Sender: TObject);
begin
  // AL_8
  if RendaVariavel.VerEmAbertura then
   begin
      sbtnAlterar.Down := False;
      Exit;
   end;

  inherited;
  sbtnSaldos.Enabled    := False;

  bbtntTransfer.Visible := False;

  //AL_16

  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := True;

  AtualizaSaldoOrigem(-1,-1,dbdtDataOperacao.DateTime);
  AtualizaSaldoDestino(-1,-1,dbdtDataOperacao.DateTime);
  SelectNext(pnlCampos,True,True);

end;

procedure TfrmCadOpeVirtual.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
    QryAux.Close;
    QryAuxiliar.Close;
end;

procedure TfrmCadOpeVirtual.BtIncDirClick(Sender: TObject);
begin
   // AL_8
   if RendaVariavel.VerEmAbertura then
   begin
      BtIncDir.Down := False;
      Exit;
   end;

   If not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   pnlDireitos.BringToFront;

   Label4.Enabled            := True;
   dblCarteiraGerDir.Enabled := True;

   Label5.Enabled            := True;
   dblTipoOperDir.Enabled    := True;

   dblCarteiraGerDir.Clear;
   dblTipoOperDir.Clear;
   dbrValorDir.Clear;

   dblCarteiraGerDir.SetFocus;

   BtOkDir.Enabled    := True;
   BtCancDir.Enabled  := True;
   BtVoltaDir.Enabled := True;

   bOperacaoDir       := True;

end;

procedure TfrmCadOpeVirtual.BtAltDirClick(Sender: TObject);
begin
   // AL_8
   if RendaVariavel.VerEmAbertura then
   begin
      BtAltDir.Down := False;
      Exit;
   end;

   inherited;

   If not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   pnlDireitos.BringToFront;

   qryCarteiraOrigem.Locate('IDCARTEIRAGERENC;IDCARTEIRAINVEST',
                    VarArrayOf([QryDireito.FieldByName('IDCARTEIRAGERENC').AsString,
                                QryDireito.FieldByName('IDCARTEIRAINVEST').AsString]),
                    [loPartialKey]);

   dblCarteiraGerDir.Enabled := True;
   dblCarteiraGerDir.Text    := qryCarteiraOrigem.FieldByName('CARTEIRA').AsString;

   QryTipoOper.Locate('IDEVENTOCAIXACOTA',
                       QryDireito.FieldByName('IDEVENTOCAIXACOTA').AsString,
                       [loPartialKey]);

   dblTipoOperDir.Enabled    := True;
   dblTipoOperDir.Text       := QryTipoOper.FieldByName('DESCCAIXACOTA').AsString;

   dbrValorDir.Value         := QryDireito.FieldByName('VLRHISTCAIXA').AsFloat;

   Label4.Enabled            := False;
   dblCarteiraGerDir.Enabled := False;

   Label5.Enabled            := False;
   dblTipoOperDir.Enabled    := False;

   BtOkDir.Enabled    := True;
   BtCancDir.Enabled  := True;
   BtVoltaDir.Enabled := True;

   bOperacaoDir       := True;
end;

procedure TfrmCadOpeVirtual.BtExcDirClick(Sender: TObject);
var
   fSaldoCaixa : Currency;
   sSqlText    : String;
   wDtMov      : TDateTime;
begin
  // AL_8
  if RendaVariavel.VerEmAbertura then
  begin
     BtExcDir.Down := False;
     Exit;
  end;

  inherited;

  // AL_6
  //AL_15
  if Trim(dbdtDataOperacao.Text) = '' then
  begin
     MsgDlg('Data da Operação não informada.','Mensagem do Sistema', mtWarning,[mbOK],0);
     if dbdtDataOperacao.CanFocus then
        dbdtDataOperacao.SetFocus;
     Exit;
  end;

  if not CtrlInvContab.TestaPeriodo(dbdtDataOperacao.Text, 2) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbdtDataOperacao.CanFocus then
        dbdtDataOperacao.SetFocus;
     Exit;
  end;

  If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
            [mbYes, mbNo],0) = mrYes  Then
  Begin
     If not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

     ExecutaQuery(QryAux,'DELETE HISTCAIXA WHERE IDHISTCAIXA = '+
                          QryDireito.FieldByName('IDHISTCAIXA').AsString);
     QryAux.Close;

     //Trata carteira gerencial
     sSqlText := '';
     If QryDireito.FieldByName('IDCARTEIRAGERENC').AsInteger <> 0 Then
        sSqlText := ' AND IDCARTEIRAGERENC = '+QryDireito.FieldByName('IDCARTEIRAGERENC').AsString;

     //AL_17
     //sendo um registro de atualização de caixa deleta
     ExecutaQuery(QryAux,'DELETE FROM HISTCAIXA WHERE  IDHISTCAIXA IN '+
                         ' ( SELECT MAX(IDHISTCAIXA) FROM HISTCAIXA  '+
                         '   WHERE IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+
                         '   AND   IDCARTEIRAINVEST  = '+QryDireito.FieldByName('IDCARTEIRAINVEST').AsString+
                         '   AND   IDCARTEIRAGERENC > 0 '+
                         '   AND   DATAHISTCAIXA     = TO_DATE('''+dbdtDataOperacao.Text+''',''DD/MM/YYYY'')'+
                         '   AND   TIPMOVCAIXA       = ''ATU'''+
                         '   GROUP BY IDPLANPREVCTBPATR, IDCARTEIRAINVEST, IDCARTEIRAGERENC) AND '+
                          sSqlText);
     QryAux.Close;

     //atualiza o caixa, devido ao ultimo lançamento do dia
     ExecutaQuery(QryAux,'UPDATE HISTCAIXA SET SLDHISTCAIXA = SLDHISTCAIXA - '+TrocaVirgulaPonto(FloatToStr(QryDireito.FieldByName('VLRHISTCAIXA').AsFloat))+' '+
                         'WHERE  IDHISTCAIXA IN '+
                         ' ( SELECT MAX(IDHISTCAIXA) FROM HISTCAIXA  '+
                         '   WHERE  IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+
                         '   AND    IDCARTEIRAINVEST  = '+QryDireito.FieldByName('IDCARTEIRAINVEST').AsString +
                         '   AND    IDCARTEIRAGERENC > 0 '+                         
                         '   AND    DATAHISTCAIXA     = TO_DATE('''+dbdtDataOperacao.Text+''',''DD/MM/YYYY'') '+
                         '   GROUP BY IDPLANPREVCTBPATR, IDCARTEIRAINVEST, IDCARTEIRAGERENC) AND '+
                          sSqlText+' AND IDHISTCAIXA > '+QryDireito.FieldByName('IDHISTCAIXA').AsString);
                          
     QryAux.Close;

     wDtMov    := dbdtDataOperacao.Date;
     //AL_5
     //AL_4
     if wDtMov <= (pRPI.DATAULTFECH-60) then
        wDtMov := (pRPI.DATAULTFECH-60)+1;

     qryAuxiliar.Close;
     qryAuxiliar.SQL.Clear;
     qryAuxiliar.SQL.Text:= 'DELETE FROM HISTCOTA WHERE (DATAHISTCOTA >= TO_DATE('''+DateToStr(wDtMov)+''',''DD/MM/YYYY''))';
     qryAuxiliar.ExecSQL;
     qryAuxiliar.Close;

     dtmBaseDados.dbBaseDados.Commit;

     BtExc.Down      := False;

     QryDireito.Close;
     QryDireito.Open;
  End;

  RefazSaldo;
  HabilitaTab;
  sbtnSaldos.Enabled := True;

  pnlFundo.Enabled   := True;

end;

procedure TfrmCadOpeVirtual.BtOkDirClick(Sender: TObject);
begin
  //AL_6
  //AL_15
  if Trim(dbdtDataOperacao.Text) = '' then
  begin
     MsgDlg('Data da Operação não informada.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbdtDataOperacao.CanFocus then
        dbdtDataOperacao.SetFocus;
     Exit;
  end;

  if not CtrlInvContab.TestaPeriodo(dbdtDataOperacao.Text, 2) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbdtDataOperacao.CanFocus then
        dbdtDataOperacao.SetFocus;
     Exit;
  end;

  pnlFundo.Enabled := True;

  If BtIncDir.Down Then
  Begin
    BtIncDir.Down := False;

    //AL_17
    FazQuery(QryAux,'SELECT IDCARTEIRAXEVENTO FROM CARTEIRAXEVENTO ' +
                    'WHERE  IDCARTEIRAGERENC  = ' + qryCarteiraOrigemIDCARTEIRAGERENC.AsString + ' AND ' +
                    '       IDEVENTOCAIXACOTA = ' + qryOperacaoIDEVENTOCAIXACOTA.AsString);

    OperComum.LimpaParametros(QryHistCaixa);
    QryHistCaixa.ParamByName('DATAHISTCAIXA').AsString       := dbdtDataOperacao.Text;
    QryHistCaixa.ParamByName('IDCARTEIRAGERENC').AsInteger   := qryCarteiraOrigemIDCARTEIRAGERENC.AsInteger;
    QryHistCaixa.ParamByName('IDCARTEIRAINVEST').AsInteger   := qryCarteiraOrigemIDCARTEIRAINVEST.AsInteger;
    QryHistCaixa.ParamByName('IDCARTEIRAXEVENTO').AsInteger  := qryAux.FieldByName('IDCARTEIRAXEVENTO').AsInteger;
    QryHistCaixa.ParamByName('IDPLANPREVCTBPATR').AsInteger  := iPlanPrevCtbPatro;
    QryHistCaixa.Open;
    If Not QryHistCaixa.IsEmpty Then
    Begin
       MsgDlg('Já há resgistro para essa Data e essa Carteira.','Mensagem do Sistema',mtInformation ,[mbOK],0);
       BtCancClick(Sender);
       Exit;
    End;

    If Not AplicaResgata(dbrValorDir.Value,QryTipoOperDESCCAIXACOTA.AsString) Then
       BtCancDirClick(Sender);

  End
  Else If BtAltDir.Down Then
  Begin
    BtAltDir.Down := False;

    ExecutaQuery(QryAux,'UPDATE HISTCAIXA SET VLRHISTCAIXA = '+
       TrocaVirgulaPonto(FLoatToStr(dbrValorDir.Value))+', '+
                        'SLDHISTCAIXA = (SLDHISTCAIXA-'+
       TrocaVirgulaPonto(FLoatToStr(QryDireito.FieldByName('VLRHISTCAIXA').AsFloat))+')+'+
                        TrocaVirgulaPonto(FLoatToStr(dbrValorDir.Value))+' '+
                        'WHERE IDHISTCAIXA = '+
                        IntToStr(QryDireito.FieldByName('IDHISTCAIXA').AsInteger));
  End;

  Label4.Enabled  := True;
  dblCarteiraGerDir.Enabled := True;

  Label5.Enabled  := True;
  dblTipoOperDir.Enabled := True;

  DbgDireito.BringToFront;

  //AL_17
  OperComum.LimpaParametros(QryDireito);
  QryDireito.ParamByName('DATAHISTCAIXA').AsString      := dbdtDataOperacao.Text;
  QryDireito.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
  QryDireito.Open;

  PgcDetalhes.ActivePage := TbsDireitos;

  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;

end;

procedure TfrmCadOpeVirtual.BtCancDirClick(Sender: TObject);
begin
  inherited;

   If dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;

   QryDireito.Close;
   QryDireito.Open;

   Label4.Enabled  := True;
   dblCarteiraGerDir.Enabled := True;
   Label5.Enabled  := True;
   dblTipoOperDir.Enabled := True;

   DbgDireito.BringToFront;

   BtIncDir.Down      := False;
   BtAltDir.Down      := False;
   BtExcDir.Down      := False;

   BtOkDir.Enabled    := False;
   BtCancDir.Enabled  := False;
   BtVoltaDir.Enabled := False;

   dblCarteiraGerDir.Text := '';

   dbrValorDir.Clear;

   pnlFundo.Enabled := True;

   bbtnConfirmar.Enabled := False;

   bOperacaoDir     := False;

end;

procedure TfrmCadOpeVirtual.BtOkEmpClick(Sender: TObject);
begin
  inherited;
  //AL_6
  //AL_15
  if Trim(dbdtDataOperacao.Text) = '' then
  begin
     MsgDlg('Data da Operação não informada.','Mensagem do Sistema', mtWarning,[mbOK],0);
     if dbdtDataOperacao.CanFocus then
        dbdtDataOperacao.SetFocus;
     Exit;
  end;

  if not CtrlInvContab.TestaPeriodo(dbdtDataOperacao.Text, 2) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbdtDataOperacao.CanFocus then
        dbdtDataOperacao.SetFocus;
     Exit;
  end;

  pnlFundo.Enabled := True;

  If BtIncEmp.Down Then
  Begin
    BtIncEmp.Down := False;

    FazQuery(QryAux,'SELECT IDCARTEIRAXEVENTO FROM CARTEIRAXEVENTO ' +
                    'WHERE  IDCARTEIRAGERENC  = ' + qryCarteiraOrigemIDCARTEIRAGERENC.AsString + ' AND ' +
                    '       IDEVENTOCAIXACOTA = ' + qryOperacaoIDEVENTOCAIXACOTA.AsString);

    OperComum.LimpaParametros(QryHistCaixa);
    QryHistCaixa.ParamByName('DATAHISTCAIXA').AsString       := dbdtDataOperacao.Text;
    QryHistCaixa.ParamByName('IDCARTEIRAGERENC').AsInteger   := qryCarteiraOrigemIDCARTEIRAGERENC.AsInteger;
    QryHistCaixa.ParamByName('IDCARTEIRAINVEST').AsInteger   := qryCarteiraOrigemIDCARTEIRAINVEST.AsInteger;
    QryHistCaixa.ParamByName('IDCARTEIRAXEVENTO').AsInteger  := qryAux.FieldByName('IDCARTEIRAXEVENTO').AsInteger;
    QryHistCaixa.ParamByName('IDPLANPREVCTBPATR').AsInteger  := iPlanPrevCtbPatro;
    QryHistCaixa.Open;
    If Not QryHistCaixa.IsEmpty Then
    Begin
       MsgDlg('Já há resgistro para essa Data e essa Carteira.','Mensagem do Sistema',mtInformation ,[mbOK],0);
       BtCancClick(Sender);
       Exit;
    End;

    If Not AplicaResgata(dbrValorEmp.Value, QryTipoOperEmpDESCCAIXACOTA.AsString) Then
       BtCancEmpClick(Sender);

  End
  Else If BtAltEmp.Down Then
  Begin
    BtAltEmp.Down := False;

    ExecutaQuery(QryAux,'UPDATE HISTCAIXA SET VLRHISTCAIXA = '+
       TrocaVirgulaPonto(FloatToStr(dbrValorEmp.Value))+', '+
                        'SLDHISTCAIXA = (SLDHISTCAIXA-'+
       TrocaVirgulaPonto(FLoatToStr(QryEmprestimo.FieldByName('VLRHISTCAIXA').AsFloat))+')+'+
                        TrocaVirgulaPonto(FloatToStr(dbrValorEmp.Value))+' '+
                        'WHERE IDHISTCAIXA = '+
                        IntToStr(QryEmprestimo.FieldByName('IDHISTCAIXA').AsInteger));
  End;

  Label4.Enabled  := True;
  dblCarteiraGerEmp.Enabled := True;

  Label5.Enabled  := True;
  dblTipoOperEmp.Enabled := True;

  DbgEmprestimo.BringToFront;

  //AL_17
  OperComum.LimpaParametros(QryEmprestimo);
  QryEmprestimo.ParamByName('DATAHISTCAIXA').AsString      := dbdtDataOperacao.Text;
  QryEmprestimo.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
  QryEmprestimo.Open;

  PgcDetalhes.ActivePage := TbsEmprestimo;

  bbtnConfirmar.Enabled  := True;
  bbtnCancelar.Enabled   := True;
end;

procedure TfrmCadOpeVirtual.BtCancEmpClick(Sender: TObject);
begin
  inherited;

   If dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;

   QryEmprestimo.Close;
   QryEmprestimo.Open;

   Label4.Enabled  := True;
   dblCarteiraGerEmp.Enabled := True;
   Label5.Enabled  := True;
   dblTipoOperEmp.Enabled := True;

   DbgEmprestimo.BringToFront;

   BtIncEmp.Down      := False;
   BtAltEmp.Down      := False;
   BtExcEmp.Down      := False;

   BtOkEmp.Enabled    := False;
   BtCancEmp.Enabled  := False;
   BtVoltaEmp.Enabled := False;

   dblCarteiraGerEmp.Text := '';

   dbrValorEmp.Clear;

   pnlFundo.Enabled := True;

   bbtnConfirmar.Enabled := False;

   bOperacaoEmp     := False;

end;

procedure TfrmCadOpeVirtual.BtIncEmpClick(Sender: TObject);
begin
   // AL_8
   if RendaVariavel.VerEmAbertura then
   begin
      BtIncEmp.Down := False;
      Exit;
   end;

   If not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   pnlEmprestimo.BringToFront;

   Label4.Enabled            := True;
   dblCarteiraGerEmp.Enabled := True;

   Label5.Enabled            := True;
   dblTipoOperEmp.Enabled    := True;

   dblCarteiraGerEmp.Clear;
   dblTipoOperEmp.Clear;
   dbrValorEmp.Clear;

   //AL_17
   if dblCarteiraGerEmp.CanFocus then
      dblCarteiraGerEmp.SetFocus;

   BtOkEmp.Enabled    := True;
   BtCancEmp.Enabled  := True;
   BtVoltaEmp.Enabled := True;

   bOperacaoEmp       := True;
end;

procedure TfrmCadOpeVirtual.BtAltEmpClick(Sender: TObject);
begin
   // AL_8
   if RendaVariavel.VerEmAbertura then
   begin
      BtAltEmp.Down := False;
      Exit;
   end;

   inherited;
   
   If not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   pnlEmprestimo.BringToFront;

   qryCarteiraOrigem.Locate('IDCARTEIRAGERENC;IDCARTEIRAINVEST',
                     VarArrayOf([QryEmprestimo.FieldByName('IDCARTEIRAGERENC').AsString,
                                 QryEmprestimo.FieldByName('IDCARTEIRAINVEST').AsString]),
                    [loPartialKey]);

   dblCarteiraGerEmp.Enabled := True;
   dblCarteiraGerEmp.Text    := qryCarteiraOrigem.FieldByName('CARTEIRA').AsString;

   QryTipoOperEmp.Locate('IDEVENTOCAIXACOTA',
                       QryEmprestimo.FieldByName('IDEVENTOCAIXACOTA').AsString,
                       [loPartialKey]);

   dblTipoOperEmp.Enabled    := True;
   dblTipoOperEmp.Text       := QryTipoOperEmp.FieldByName('DESCCAIXACOTA').AsString;

   dbrValorEmp.Value         := QryEmprestimo.FieldByName('VLRHISTCAIXA').AsFloat;

   Label9.Enabled            := False;
   dblCarteiraGerEmp.Enabled := False;

   Label12.Enabled           := False;
   dblTipoOperEmp.Enabled    := False;

   BtOkEmp.Enabled    := True;
   BtCancEmp.Enabled  := True;
   BtVoltaEmp.Enabled := True;

   bOperacaoEmp       := True;

end;

procedure TfrmCadOpeVirtual.BtExcEmpClick(Sender: TObject);
var
   fSaldoCaixa : Currency;
   sSqlText    : String;
   wDtMov      : TDateTime;
begin
   //AL_8
   if RendaVariavel.VerEmAbertura then
   begin
      BtExcEmp.Down := False;
      Exit;
   end;

   inherited;
   
   //AL_6
   //AL_15
   if Trim(dbdtDataOperacao.Text) = '' then
   begin
      MsgDlg('Data da Operação não informada.','Mensagem do Sistema', mtWarning,[mbOK],0);
      if dbdtDataOperacao.CanFocus then
         dbdtDataOperacao.SetFocus;
      Exit;
   end;

   if not CtrlInvContab.TestaPeriodo(dbdtDataOperacao.Text, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dbdtDataOperacao.CanFocus then
         dbdtDataOperacao.SetFocus;
      Exit;
   end;

  If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
            [mbYes, mbNo],0) = mrYes  Then
  Begin
     If not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

     ExecutaQuery(QryAux,'DELETE HISTCAIXA WHERE IDHISTCAIXA = '+
                          QryEmprestimo.FieldByName('IDHISTCAIXA').AsString);
     QryAux.Close;

     //Trata carteira gerencial
     sSqlText := '';
     If QryEmprestimo.FieldByName('IDCARTEIRAGERENC').AsInteger <> 0 Then
        sSqlText := ' AND IDCARTEIRAGERENC = '+QryEmprestimo.FieldByName('IDCARTEIRAGERENC').AsString;

     //AL_17
     //sendo um registro de atualização de caixa deleta
     ExecutaQuery(QryAux,'DELETE FROM HISTCAIXA WHERE  IDHISTCAIXA IN '+
                         ' ( SELECT MAX(IDHISTCAIXA) FROM HISTCAIXA  '+
                         '   WHERE IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+
                         '   AND   IDCARTEIRAINVEST  = '+QryEmprestimo.FieldByName('IDCARTEIRAINVEST').AsString+
                         '   AND   IDCARTEIRAGERENC > 0 '+                         
                         '   AND   DATAHISTCAIXA     = TO_DATE('''+dbdtDataOperacao.Text+''',''DD/MM/YYYY'')'+
                         '   AND   TIPMOVCAIXA       = ''ATU'''+
                         '   GROUP BY IDPLANPREVCTBPATR, IDCARTEIRAINVEST, IDCARTEIRAGERENC) AND '+
                          sSqlText);
     QryAux.Close;

     //AL_17
     //atualiza o caixa, devido ao ultimo lançamento do dia
     ExecutaQuery(QryAux,'UPDATE HISTCAIXA SET SLDHISTCAIXA = SLDHISTCAIXA - '+TrocaVirgulaPonto(FloatToStr(QryEmprestimo.FieldByName('VLRHISTCAIXA').AsFloat))+' '+
                         'WHERE  IDHISTCAIXA IN '+
                         ' ( SELECT MAX(IDHISTCAIXA) FROM HISTCAIXA  '+
                         '   WHERE IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+
                         '   AND   IDCARTEIRAINVEST  = '+QryEmprestimo.FieldByName('IDCARTEIRAINVEST').AsString +
                         '   AND   IDCARTEIRAGERENC > 0 '+
                         '   AND   DATAHISTCAIXA     = TO_DATE('''+dbdtDataOperacao.Text+''',''DD/MM/YYYY'')'+
                         '   GROUP BY IDPLANPREVCTBPATR, IDCARTEIRAINVEST, IDCARTEIRAGERENC) AND '+
                          sSqlText+' AND IDHISTCAIXA > '+QryEmprestimo.FieldByName('IDHISTCAIXA').AsString);
     QryAux.Close;

     wDtMov    := dbdtDataOperacao.Date;
     //AL_5
     //AL_4
     if wDtMov <= (pRPI.DATAULTFECH-60) then
        wDtMov := (pRPI.DATAULTFECH-60)+1;

     qryAuxiliar.Close;
     qryAuxiliar.SQL.Clear;
     qryAuxiliar.SQL.Text := 'DELETE FROM HISTCOTA WHERE (DATAHISTCOTA >= TO_DATE('''+DateToStr(wDtMov)+''',''DD/MM/YYYY'')) ';
     qryAuxiliar.ExecSQL;
     qryAuxiliar.Close;

     dtmBaseDados.dbBaseDados.Commit;

     BtExcEmp.Down      := False;

     QryEmprestimo.Close;
     QryEmprestimo.Open;
  End;

  RefazSaldo;
  HabilitaTab;
  sbtnSaldos.Enabled := True;

  pnlFundo.Enabled   := True;

end;

procedure TfrmCadOpeVirtual.GravaOperacaoInvest(iIDOPERACAOINVEST, iMOECODIGO, iIDMODULO,
                                                iEMPRESAPROP, iIDINVESTIMENTO,
                                                iIDCARTEIRAINVEST, iIDTIPOINVEST,
                                                iIDTIPOOPERACAO, iIDFORCLI, iIDCUSTODIANTE,
                                                iIDOPERACAODIREITO, iIDCARTEIRAGERENC : Integer;
                                                dDATAOPERACAO, dDATAVENCOPER          : TDateTime;
                                                sNUMDOCUMENTO, sFLGSTATUSFECHBOL,
                                                sFLGSTATUSORDMOV, sIDLOTE             : String;
                                                fQTDEOPERACAO, fPRECOUNITOPERACAO,
                                                fVLROPERACAO, fVLRIR, fVLRREMUNERACAO,
                                                fVLRIRREMUNER, fPERCCUSTO             : Double);
begin
    OperComum.LimpaParametros(QryInsetOperacaoInvest);
    QryInsetOperacaoInvest.ParamByName('IDOPERACAOINVEST').AsInteger  := iIDOPERACAOINVEST;
    QryInsetOperacaoInvest.ParamByName('MOECODIGO').AsInteger         := iMOECODIGO;
    QryInsetOperacaoInvest.ParamByName('IDMODULO').AsInteger          := iIDMODULO;
    QryInsetOperacaoInvest.ParamByName('EMPRESAPROP').AsInteger       := iEMPRESAPROP;
    QryInsetOperacaoInvest.ParamByName('IDINVESTIMENTO').AsInteger    := iIDINVESTIMENTO;
    QryInsetOperacaoInvest.ParamByName('IDCARTEIRAINVEST').AsInteger  := iIDCARTEIRAINVEST;
    QryInsetOperacaoInvest.ParamByName('IDTIPOINVEST').AsInteger      := iIDTIPOINVEST;
    QryInsetOperacaoInvest.ParamByName('IDTIPOOPERACAO').AsInteger    := iIDTIPOOPERACAO;
    QryInsetOperacaoInvest.ParamByName('IDLOTE').AsString             := sIDLOTE;
    QryInsetOperacaoInvest.ParamByName('IDCARTEIRAGERENC').AsInteger  := iIDCARTEIRAGERENC;
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
    QryInsetOperacaoInvest.ExecSQL;
end;

procedure TfrmCadOpeVirtual.bbtnSairClick(Sender: TObject);
begin
   bbtnCancelarClick(Sender);
  inherited;

end;

procedure TfrmCadOpeVirtual.dblCarteiraGerEmpChange(Sender: TObject);
begin
  inherited;
  QryTipoOperEmp.Close;
  QryTipoOperEmp.Open;
end;

//AL_7
procedure TfrmCadOpeVirtual.bbtntTransferClick(Sender: TObject);
begin
  // AL_8
  if RendaVariavel.VerEmAbertura then
     Exit;
  inherited;
  Transfere;
end;

procedure TfrmCadOpeVirtual.sbtnApagarClick(Sender: TObject);
begin
  //AL_8
  if RendaVariavel.VerEmAbertura then
  begin
     sbtnApagar.Down := False;
     Exit;
  end;

  inherited;

end;

//Al_9
function TfrmCadOpeVirtual.VerificaRecDireitos(dDataOper : TDateTime;
                          iInvestimento, iCarteiraGerenc : Integer) : Boolean;
begin
   OperComum.LimpaParametros(QryVerificaAnunDir);
   QryVerificaAnunDir.ParamByName('DATAOPERACAO').AsString      := DateToStr(dDataOper);
   QryVerificaAnunDir.ParamByName('IDINVESTIMENTO').AsInteger   := iInvestimento;
   QryVerificaAnunDir.ParamByName('IDCARTEIRAGERENC').AsInteger := iCarteiraGerenc;
   //AL_17
   QryVerificaAnunDir.ParamByName('IDPLANPREVCTBPATR').AsInteger:= iPlanPrevCtbPatro;
   QryVerificaAnunDir.Open;
   //AL_19
   if not QryVerificaAnunDir.IsEmpty then
      MsgDlg('Existe Anúncios lançados para esse Investimento!','Mensagem do Sistema',mtInformation ,[mbOK],0);

   OperComum.LimpaParametros(QryVerificaRecDir);
   QryVerificaRecDir.ParamByName('DATAVENCOPER').AsString      := DateToStr(dDataOper);
   QryVerificaRecDir.ParamByName('IDINVESTIMENTO').AsInteger   := iInvestimento;
   QryVerificaRecDir.ParamByName('IDCARTEIRAGERENC').AsInteger := iCarteiraGerenc;
   //AL_17
   QryVerificaRecDir.ParamByName('IDPLANPREVCTBPATR').AsInteger:= iPlanPrevCtbPatro;
   QryVerificaRecDir.Open;
   //AL_19   
   if not QryVerificaRecDir.IsEmpty then
      MsgDlg('Existe Recebimentos de Direitos para esse Investimento!','Mensagem do Sistema',mtInformation ,[mbOK],0);

   Result := False;

end;

procedure TfrmCadOpeVirtual.DsDireitoStateChange(Sender: TObject);
begin
  inherited;
   //Controla o Status do Novo Botão
   BtIncDir.Enabled := ((not (DsDireito.State in [dsInsert, dsEdit, dsInactive])));
   BtAltDir.Enabled := ((not (DsDireito.State in [dsInsert, dsEdit, dsInactive])) and (not (DsDireito.DataSet.IsEmpty)));
   BtExcDir.Enabled := ((not (DsDireito.State in [dsInsert, dsEdit, dsInactive])) and (not (DsDireito.DataSet.IsEmpty)));
end;

procedure TfrmCadOpeVirtual.DsEmprestimoStateChange(Sender: TObject);
begin
  inherited;
   //Controla o Status do Novo Botão
   BtIncEmp.Enabled := ((not (DsEmprestimo.State in [dsInsert, dsEdit, dsInactive])));
   BtAltEmp.Enabled := ((not (DsEmprestimo.State in [dsInsert, dsEdit, dsInactive])) and (not (DsEmprestimo.DataSet.IsEmpty)));
   BtExcEmp.Enabled := ((not (DsEmprestimo.State in [dsInsert, dsEdit, dsInactive])) and (not (DsEmprestimo.DataSet.IsEmpty)));
end;

procedure TfrmCadOpeVirtual.DsAplResgStateChange(Sender: TObject);
begin
  inherited;
   //Controla o Status do Novo Botão
   BtInc.Enabled := ((not (DsAplResg.State in [dsInsert, dsEdit, dsInactive])));
   BtAlt.Enabled := ((not (DsAplResg.State in [dsInsert, dsEdit, dsInactive])) and (not (DsAplResg.DataSet.IsEmpty)));
   BtExc.Enabled := ((not (DsAplResg.State in [dsInsert, dsEdit, dsInactive])) and (not (DsAplResg.DataSet.IsEmpty)));
end;

procedure TfrmCadOpeVirtual.FormCreate(Sender: TObject);
begin
  inherited;
  //AL_20 - Não será possivel lançar operações em data posterior a este parâmetro.
  if CtrlPInv.DataLimCartGer > 0 then
     dbdtDataOperacao.MaxDate :=  CtrlPInv.DataLimCartGer;
end;

end.
