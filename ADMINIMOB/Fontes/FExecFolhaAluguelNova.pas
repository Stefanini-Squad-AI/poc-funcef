unit FExecFolhaAluguelNova;
{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina.......: ReajustaTodosContratos
WO...........: 22016
Data.........: 21/05/2025
Responsável..: Paulo Nobre
Descrição....: Foi necessário desfazer o procedimento do WO19422 abaixo, face
               o recurso implementado ter causado calculos imprecisos nos
               contratos. Ex. O contrato 'S1420' reportado nessa demanda. 
--------------------------------------------------------------------------------
Rotina.......: ReajustaTodosContratos
WO...........: 19422
Data.........: 26/03/2025
Responsável..: Leandro Pocebon
Descrição....: Ajuste para pegar o fator a partir do mes subsequente ao ultino reajuste
--------------------------------------------------------------------------------

Rotina.......: CtrlLancamentosImovel.PrepareRatLanImovel
SOL..........: 180032
Kintana......: 1674608
Data.........: 23/01/2013
Responsável..: Baruc Singh Baptista
Descrição....: Função UTILIZADA PARA ARREDONDAMENTO DE VALORES
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902
Nº KINTANA..: 1577381
Data........: 14/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
Nº SOL.......: 123660
Nº KINTANA...: 620038
Responsável..: Cássio Rovaroto de Camargo
Data.........: 14/09/2009
Descrição....: Alteração na rotina VerificaPreenchimento, mudando o tipo de
               mensagem exibida quando existem imóveis com Data de Encerramento
               dentro do período de competência selecionado.
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27739
Responsável : Daniel Simões
Data        : 16/04/2008
Descrição   : Correção na rotina de cálculo dos valores pró-rata de acordo com
              o cadastro de desconto por contrato na tela de Cadastro de
              Contratos de Locação...
--------------------------------------------------------------------------------
Pendência   : 25166
Responsável : Gustavo Mendes
Data        :
Descrição   : Adicionar a Tag <imovel>, na mensagem do boleto. Essa opção trará
              concatenado descrição dos imóveis para um contrato.
--------------------------------------------------------------------------------
Pendência   : 24079
Responsável : Daniel Simões
Data        : 08/06/2007
Descrição   : Descrição do campo 'OBSERVACAO' dos alteradores passa a receber a
              descrição do campo 'OBSERVACAO' do cadastro de descontos...
--------------------------------------------------------------------------------
Pendência   : 24085
Responsável : Daniel Simões
Data        : 24/04/2007
Descrição   : Mudança na query 'DtmImobiliario.qryContratoXImovel'. Ela foi
              adaptada para carregar Imóveis ou Unidades pertencentes ao
              contrato e seu conteúdo será espelhado em 'qryLancFolha'...
--------------------------------------------------------------------------------
Pendência   : 24703
Responsável : Daniel Simões
Data        : 12/03/2007
Descrição   : Correção para informar a data de lançamento corretamente caso haja
              período de competência na geração da folha de aluguéis...
--------------------------------------------------------------------------------
Pendência   : 23743
Responsável : Marchetti
Data        : 03/01/2007
Descrição   : Implementacao da chamada da rotina de calculo de parcelas de
              confissao de dividas
--------------------------------------------------------------------------------
Pendência   : 21164
Responsável : Daniel Simões
Data        : 02/06/2006
Descrição   : Implementação da geração da folha de aluguel por período de
              Competência...
--------------------------------------------------------------------------------
Pendência   : 22113
Responsável : Daniel Simões
Data        : 19/04/2006
Descrição   : Passa a Permitir reajuste com fator acumulado negativo...
--------------------------------------------------------------------------------
Pendência   :
Responsável : Daniel Simões
Data        : 22/02/2006
Descrição   : Adicionado filtro apenas pelo(s) contrato(s) vigente(s) ...
--------------------------------------------------------------------------------
Pendência   : 17340
Responsável : David Ayrolla
Data        : 30/08/2004 (término)
Descrição   : Implementação dos descontos programados.
--------------------------------------------------------------------------------
Pendência   : 17341
Responsável : Vinícius Meyer Lana
Data        : 22/09/2004 (término)
Descrição   : Atribui Percentual fixo de reajuste além do indice informado...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, Wwdbigrd, Wwdbgrid,
  fcButton, fcImgBtn, Wwdbspin, Mask, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook, StdCtrls, ExtCtrls,
  fcLabel, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Db, DBTables,
  Wwquery, Wwdatsrc, fcShapeBtn, wwdbdatetimepicker, CMDateTimePicker, FSairAjudaImob, Menus,
  mResponsavel, uModuloImobiliario, uComunsImobiliarioDB, uCtrlContratoImovel, uCtrlHistMovImob, uCtrlPadroes,
  DBClient, uCMClientDataSet, uCmSqlParams, uCtrlLancamentosImovel, uCtrlTipoCustoRecImov, uCtrlBloqueioImob,
  uCtrlParamMulta,
  // Helen - SOL: 172902 KTN: 1577381
  uCtrlContab;

type
  TParteAluguel = (paTudo, paFixo, paComplemento, paNenhum);

  TfrmExecFolhaAluguelNova = class(TfrmSairAjudaImob)
    Panel3: TPanel;
    ntbInstrucao: TNotebook;
    Panel1: TPanel;
    lblTitulo: TfcLabel;
    ntbPrincipal: TNotebook;
    rdgVariavel: TRadioGroup;
    rdgUsoIndicador: TRadioGroup;
    Panel2: TPanel;
    Label15: TLabel;
    Label5: TLabel;
    DBspnAno: TwwDBSpinEdit;
    edtDataLancamento: TCMDateTimePicker;
    btnContinuaSelecao: TfcShapeBtn;
    DBgrdReajuste: TwwDBGrid;
    Memo2: TMemo;
    Memo1: TMemo;
    btnCancelaReajuste: TfcShapeBtn;
    btnCancelaLanc: TfcShapeBtn;
    btnContinuaReajuste: TfcShapeBtn;
    btnConfirmaLanc: TfcShapeBtn;
    Memo3: TMemo;
    Memo4: TMemo;
    btnCancelaEncerra: TfcShapeBtn;
    btnContinuaEncerra: TfcShapeBtn;
    DBgrdRescisao: TwwDBGrid;
    dsRescisao: TwwDataSource;
    cboMes: TComboBox;
    Memo5: TMemo;
    wwDBGrid1: TwwDBGrid;
    btnCancelaErroEncerra: TfcShapeBtn;
    wwDBGrid2: TwwDBGrid;
    btnCancelaErroReajuste: TfcShapeBtn;
    Memo6: TMemo;
    btnConsultaIndice: TfcShapeBtn;
    lblContador: TLabel;
    lblProgress: TLabel;
    ProgressBar: TProgressBar;
    dsReajuste: TwwDataSource;
    dsLancFolha: TwwDataSource;
    updLancFolha: TUpdateSQL;
    pgcLancamentos: TPageControl;
    tbsLancamentos: TTabSheet;
    DBgrdLancamentos: TwwDBGrid;
    tbsErro: TTabSheet;
    memErro: TMemo;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    btnContinuaLanc: TfcShapeBtn;
    Panel9: TPanel;
    btnCancelaAltera: TfcShapeBtn;
    btnConfirmaAltera: TfcShapeBtn;
    DBgrdAlteraLanc: TwwDBGrid;
    mnuMsgLanc: TPopupMenu;
    qryInsertPrevisao: TwwQuery;
    AlterarMensagemPadro1: TMenuItem;
    qryLancFolha: TwwQuery;
    qryLancFolhaCONTRATO: TStringField;
    qryLancFolhaIMOVEL: TStringField;
    qryLancFolhaIDLANCIMOVEL: TFloatField;
    qryLancFolhaIDPESSOA: TFloatField;
    qryLancFolhaIDIMOVEL: TFloatField;
    qryLancFolhaIDTIPOCUSTORECIMO: TFloatField;
    qryLancFolhaIDCONTRATOIMOVEL: TFloatField;
    qryLancFolhaDATALANCAMENTO: TDateTimeField;
    qryLancFolhaDATAVENCIMENTO: TDateTimeField;
    qryLancFolhaMESREFERENCIA: TFloatField;
    qryLancFolhaANOREFERENCIA: TFloatField;
    qryLancFolhaMESCOMPETENCIA: TFloatField;
    qryLancFolhaANOCOMPETENCIA: TFloatField;
    qryLancFolhaRECPAG: TStringField;
    qryLancFolhaVLRLANCOMRECEB: TFloatField;
    qryLancFolhaVLRLANCRECEB: TFloatField;
    qryLancFolhaMOEDARECEB: TFloatField;
    qryLancFolhaIDFORCLI: TFloatField;
    qryLancFolhaFLGAGRUPAR: TStringField;
    qryLancFolhaFLGAGRUPADO: TFloatField;
    qryLancFolhaFLGTIPOLANCAMENTO: TStringField;
    qryLancFolhaFLGINTEGRADO: TFloatField;
    qryLancFolhaFLGORIGEMLANC: TStringField;
    qryLancFolhaIDUSUARIOSISTEMA: TFloatField;
    qryLancFolhaVLRJUROS: TFloatField;
    qryLancFolhaVLRMULTA: TFloatField;
    qryLancFolhaVLRCORRECAOMON: TFloatField;
    qryLancFolhaVLRCOMISSAO: TFloatField;
    qryLancFolhaIDDOCUMENTO: TFloatField;
    qryLancFolhaNODOCUMENTO: TFloatField;
    qryLancFolhaIDPROGRAMA: TFloatField;
    qryLancFolhaIDEMPRESA: TFloatField;
    qryLancFolhaCODCENTROCUSTO: TStringField;
    qryLancFolhaDATALIMITE: TDateTimeField;
    qryLancFolhaCODPORTFORMA: TFloatField;
    qryLancFolhaIDMODULO: TFloatField;
    qryLancFolhaDTINICTBDIARIA: TDateTimeField;
    qryLancFolhaDTFIMCTBDIARIA: TDateTimeField;
    qryExistePrevisaoImovel: TwwQuery;
    qryExistePrevisaoContrato: TwwQuery;
    qryExistePrevisaoContratoPLNCODIGO: TFloatField;
    qryExistePrevisaoContratoVLRLANCRECEB: TFloatField;
    qryExistePrevisaoContratoIDDOCUMENTO: TFloatField;
    qryExistePrevisaoContratoCODDOCUMENTO: TFloatField;
    qryContratoXDesc: TwwQuery;
    qryCotacaoMoeda: TwwQuery;
    qryCotacaoMoedaCOTVALOR: TFloatField;
    dtsAlteradores: TwwDataSource;
    qryAlteradores: TwwQuery;
    updAlteradores: TUpdateSQL;
    qryContratoXDescCODALTERADOR: TFloatField;
    qryContratoXDescVLRDESCONTO: TFloatField;
    qryContratoXDescMOECODIGO: TFloatField;
    qryContratoXDescPERDESCONTO: TFloatField;
    qryContratoXDescCODTIPIMOVEL: TStringField;
    qryContratoXDescMOESIGLA: TStringField;
    qryContratoXDescDESCRICAO: TStringField;
    qryContratoXDescDESCTIPOIMOVEL: TStringField;
    qryAlteradoresIDDOCUMENTO: TFloatField;
    qryAlteradoresCODALTERADOR: TFloatField;
    qryAlteradoresVLRALTERADOR: TFloatField;
    qryAlteradoresCODTIPIMOVEL: TStringField;
    qryAlteradoresDESCRICAO: TStringField;
    qryAlteradoresDESCTIPOIMOVEL: TStringField;
    qryAlteradoresVLRBRUTO: TFloatField;
    qryAlteradoresVLRLIQUIDO: TFloatField;
    qryContratoXDescCONNOME: TStringField;
    qryAlteradoresCONNOME: TStringField;
    qryAlteradoresIDCONTRATOIMOVEL: TFloatField;
    qryLancFolhaCODTIPIMOVEL: TStringField;
    GroupBox1: TGroupBox;
    MolResponsavel1: TmolResponsavel;
    Label1: TLabel;
    edtAdminImovel: TEdit;
    btnBuscaAdminImovel: TBitBtn;
    btnLimpaAdminImovel: TBitBtn;
    Label22: TLabel;
    DBcboPortadorForma: TwwDBLookupCombo;
    Label4: TLabel;
    DBcboIndiceReajuste: TwwDBLookupCombo;
    Label21: TLabel;
    DBcboTipoRecCusto: TwwDBLookupCombo;
    Label2: TLabel;
    edtNumContrato: TEdit;
    Label3: TLabel;
    edtNomeContrato: TEdit;
    btnBuscaContrato: TBitBtn;
    btnLimpaContrato: TBitBtn;
    Label6: TLabel;
    edtDataEmissao: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    dbcboPortadorFormaDif: TwwDBLookupCombo;
    qryLancFolhaDATAEMISSAO: TDateTimeField;
    qryLookTipoRecContr: TwwQuery;
    qryLookTipoRecContrDESCCUSTORECIMO: TStringField;
    qryLookTipoRecContrIDTIPOCUSTORECIMO: TFloatField;
    qryLookTipoRecContrRECCUSTO: TStringField;
    qryLookTipoRecContrCODTIPDOC: TFloatField;
    qryLookTipoRecContrFLGOBRIGAORC: TFloatField;
    qryLookTipoRecContrIDTIPODESPESA: TFloatField;
    qryLookTipoRecContrFLGDIARIO: TStringField;
    QryContratosPend: TwwQuery;
    QryContratosPendIDCONTRATOIMOVEL: TFloatField;
    QryContratosPendCONNUMERO: TStringField;
    QryContratosPendCONNOME: TStringField;
    QryContratosPendCONDATAINICIO: TDateTimeField;
    QryContratosPendCONDATAFIM: TDateTimeField;
    QryContratosPendIDTIPOCUSTORECIMO: TFloatField;
    Label7: TLabel;
    cboMesFim: TComboBox;
    DBspnAnoFim: TwwDBSpinEdit;
    dsVerificaContrato: TwwDataSource;
    qryVerificaContrato: TwwQuery;
    qryVerificaContratoCONDATAFIM: TDateTimeField;
    qryVerificaContratoCONPROXREAJUSTE: TDateTimeField;
    qryVerificaContratoCONINDICEREAJUSTE: TFloatField;
    qryVerificaContratoFLGINDETERMINADO: TStringField;
    qryVerificaContratoCIMDTFIM: TDateTimeField;
    qryVerificaContratoCONPERALUGUEL: TFloatField;
    qryVerificaContratoCONDATACARENCIA: TDateTimeField;
    cdsCondPag: TCMClientDataSet;
    cdsHistMovImob: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    Panel10: TPanel;
    wwDBGrid3: TwwDBGrid;
    dsHistMovImob: TDataSource;
    cdsHistMovImobNOME: TStringField;
    cdsHistMovImobCONNUMERO: TStringField;
    cdsHistMovImobCONNOME: TStringField;
    cdsHistMovImobDESCCUSTORECIMO: TStringField;
    cdsHistMovImobIDHISTMOVIMOB: TFloatField;
    cdsHistMovImobIDCONDPAGIMOVEL: TFloatField;
    cdsHistMovImobIDTIPOCUSTORECIMO: TFloatField;
    cdsHistMovImobIDITEMCENTRALIZA: TFloatField;
    cdsHistMovImobHMIDATAMOV: TDateTimeField;
    cdsHistMovImobHMIVALOR: TFloatField;
    cdsHistMovImobHMIDOCUMENTO: TFloatField;
    cdsHistMovImobPLNCODIGO: TFloatField;
    btnConfirmaConfissao: TfcShapeBtn;
    GroupBox3: TGroupBox;
    chkAluguel: TCheckBox;
    chkConfissao: TCheckBox;
    cdsContratoXImovel: TCMClientDataSet;
    cdsContratoXAlterador: TCMClientDataSet;
    cdsItensCalc: TCMClientDataSet;
    cdsHistMovImobIDCONTRATOIMOVEL: TFloatField;
    chkItemCentralizador: TCheckBox;
    Memo7: TMemo;
    cdsHistMovImobHMITIPOEVENTO: TFloatField;
    cdsHistMovImobHMIPARCELA: TFloatField;
    fcShapeBtn1: TfcShapeBtn;
    qryAlteradoresOBSERVACAO: TStringField;
    qryContratoXDescOBSERVACAO: TStringField;
    cdsBloqueioImob: TCMClientDataSet;
    qryContratoXDescRateio: TwwQuery;
    qryContratoXDescRateioDATAINICIO: TDateTimeField;
    qryContratoXDescRateioCODALTERADOR: TFloatField;
    qryContratoXDescRateioVLRDESCONTO: TFloatField;
    qryContratoXDescRateioMOECODIGO: TFloatField;
    qryContratoXDescRateioPERDESCONTO: TFloatField;
    qryContratoXDescRateioOBSERVACAO: TStringField;
    qryContratoXDescRateioCODTIPIMOVEL: TStringField;
    qryContratoXDescRateioCONNOME: TStringField;
    qryContratoXDescRateioMOESIGLA: TStringField;
    qryContratoXDescRateioDESCRICAO: TStringField;
    qryContratoXDescRateioDESCTIPOIMOVEL: TStringField;
    qryContratoXDescRateioDATAFIM: TDateTimeField;
    qryImoveis: TwwQuery;

    procedure btnContinuaSelecaoClick(Sender: TObject);
    procedure btnCancelaLancClick(Sender: TObject);
    procedure btnCancelaReajusteClick(Sender: TObject);
    procedure btnContinuaReajusteClick(Sender: TObject);
    procedure btnConfirmaLancClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelaEncerraClick(Sender: TObject);
    procedure btnContinuaEncerraClick(Sender: TObject);
    procedure btnBuscaAdminImovelClick(Sender: TObject);
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);
    procedure btnLimpaAdminImovelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBcboPortadorFormaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBgrdRescisaoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdReajusteCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdLancamentosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdRescisaoTopRowChanged(Sender: TObject);
    procedure DBgrdReajusteTopRowChanged(Sender: TObject);
    procedure DBgrdLancamentosTopRowChanged(Sender: TObject);
    procedure btnConsultaIndiceClick(Sender: TObject);
    procedure cboMesExit(Sender: TObject);
    procedure DBspnAnoExit(Sender: TObject);
    procedure btnCancelaAlteraClick(Sender: TObject);
    procedure btnConfirmaAlteraClick(Sender: TObject);
    procedure btnContinuaLancClick(Sender: TObject);
    procedure AlterarMensagemPadro1Click(Sender: TObject);
    procedure DBcboIndiceReajusteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBcboTipoRecCustoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmaConfissaoClick(Sender: TObject);
    procedure ntbPrincipalPageChanged(Sender: TObject);
    procedure chkItemCentralizadorClick(Sender: TObject);


  private { Private declarations }
    iAdminImovel     : integer;
    iContratoSelecao : integer;
    sTipoContrato    : String;
    iPortadorForma   : integer;
    iIndiceReajuste  : integer;
    iTipoCustoRecImo : Integer;
    ParteAluguel     : TParteAluguel;

    ComunsImobiliarioDB   : TComunsImobiliarioDB;
    CtrlHistMovImob       : TCtrlHistMovImob;
    CtrlContratoImovel    : TCtrlContratoImovel;
    CtrlLancamentosImovel : TCtrlLancamentosImovel;
    CtrlTipoCustoRecImov  : TCtrlTipoCustoRecImov;
    CtrlBloqueioImob      : TCtrlBloqueioImob;
    CtrlParamMulta        : TCtrlParamMulta;
    CtrlContab  : TCtrlContab; // Helen - SOL: 172902 KTN: 1577381

    // variáveis que controlam a habilitação dos botões de
    bHabilitaContinuaLanc  : boolean;
    bHabilitaConfirmaLanc  : boolean;

    procedure FiltraContratosRescisao;

    function RescindeContratos: boolean;
    procedure FiltraContratosReajuste;

    function  ReajustaTodosContratos: boolean;
    procedure AplicaReajuste(const dDataReajuste: TDateTime; const fVlrAtual, fFatorReajuste, fFatorVlrAno: double; const iPeriodo: integer; const bParcial: Boolean);
    function  FinalizaReajustes: boolean;

    procedure DesfazPrevisaoCompetencia;
    procedure SelecionaLancamentosPrevisao(const bApenasDoMes:Boolean);
    function  ExistePrevisaoNoMes(const iMeses:Integer): Boolean;
    procedure LancaPrevisao(const IDDocumento: integer; const iMeses: integer);
    // Daniel Simões - 21164
    procedure ExcluiPrevisao(const iContrato,iMeses,iMes,iAno:Integer);

    procedure GeraFolha;
    
    // Marchetti - Pendencia 23743
    procedure GeraFolhaConfissao;
    // Fim Marchetti - Pendencia 23743


    procedure SelecionaContratosFolha(const iTipoContrato : String);
    procedure ProcessaContrato;
    // Daniel Simões - 21164
    procedure ProcessaContratoPeriodo;

    //DAVID - Pendência 17340
    procedure ProcessaDesconto( iDocumento, iIdContratoImovel : integer; dVenc : TDateTime );

    function ProcuraDesconto: boolean;
    procedure DescontoConcedido(iDesconto: int64);

    // Daniel - 23113
    procedure ProcessaMensagem(iDocumento:int64; iAno,iMes:Integer);
    procedure ProcuraMsgContrato(var vMsg: array of string);
    procedure TrataMsg(var vMsg:array of string; iAno,iMes:Integer);

    function MesAluguel(const iMes, iAno:Integer): boolean;// Daniel Simões - 21164

    // Daniel Simões - 21164
    function SelecionaImoveisContrato(const iAno: Integer; const iMes: Integer): Boolean;

    procedure ProcessaImovel(const IDDocumento, iAno, iMes: integer; var dVenc : TDateTime );

    // Daniel Simões - 21164
    procedure GeraAluguelImovel(const sTipoAluguel: string; IDDocumento, iAno, iMes: integer;
                                //DAVID - Pendência 17340
                                var dVenc : TDateTime);
    // Daniel Simões - 21164
    function CalculaAluguel(const sTipoAluguel: string; const iAno, iMes: Integer; var fAluguelOM: currency): currency;

    function DefineDataCtbDiaria( var dCtbIni, dCtbFim : TDateTime ) : boolean;

    function VerificaPreenchimento: boolean;

    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;

    procedure MostraEspera(const sMensagem: string);
    procedure EscondeEspera;

    procedure MudaPrincipal(const iPagPrincipal: integer);
    procedure MudaInstrucao(const iPagInstrucao: integer; sProgresso: string);

    // Verifica se existem contratos do mes anterior pendentes de cobrança
    // Pendência : 19878 - Marcos Ventura Topini - Vinícius Lana
    function VerificaContratosPendentes : Boolean;

    function BuscaValorTotalImovel(iIdContrato:Integer) : Double;
    function VerificaValorImovel(iIdContrato: Integer) : Boolean;

    // Marchetti - pendencia 21163
    procedure ProcessaDescontoRateado( iDocumento, iIdContratoImovel : integer );
    // Fim Marchetti - pendencia 21163


  public { Public declarations }

    rParamMulta : TParamMulta;

  end;


var
  frmExecFolhaAluguelNova: TfrmExecFolhaAluguelNova;



implementation
{$R *.DFM}
uses
  uSistema, uMensErro, uDatabase, DBaseDados, uFuncoesImob, UComunsImobiliario, uVerificaPreenchimento,
  uDiasInUteis, uDiasUteis, dImobiliario, FEspera, dLookImobiliario, uIntegraBack, fConsVariacaoIndice,
  uDocumento, uEventoImovel, dMS, dLancImovel, uCalcDocumento, fEditMsgLanc, uModuloAdminImob, uMolduras;




// =================================================================================================
//    1º) Rescisão
// =================================================================================================

procedure TfrmExecFolhaAluguelNova.FiltraContratosRescisao;
var
   dDataFim : TDateTime;
begin
   MostraEspera('Selecionando Contratos que necessitam ser encerrados/prorrogados...');

   dDataFim := EncodeDate(Word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1) -1;

   // seleciona os contratos
   with dtmImobiliario.qryContratosRescisao do begin

      LimpaParametros(dtmImobiliario.qryContratosRescisao);

      ParamByName('PIDPESSOA').AsInteger        := Sistema.idEmpresa;
      ParamByName('PCONDATAFIM').asDateTime     := dDataFim;
      ParamByName('PFLGTIPOCONTRATO').asString  := 'L';

      ParametrosSistema;
      if dtmImobiliario.qryParamImobFLGFILTRAENCERRA.AsInteger = 1 then begin
         if iContratoSelecao > 0             then  ParamByName('PIDCONTRATOIMOVEL').AsInteger  := iContratoSelecao;
         if MolResponsavel1.iResponsavel > 0 then  ParamByName('PIDRESPONSAVEL').AsInteger     := MolResponsavel1.iResponsavel;
         if iAdminImovel > 0                 then  ParamByName('PIDADMINIMOVEL').AsInteger     := iAdminImovel;
         if iPortadorForma > 0               then  ParamByName('PCODPORTFORMA').AsInteger      := iPortadorForma;
         if iIndiceReajuste > 0              then  ParamByName('PINDICEREAJUSTE').AsInteger    := iIndiceReajuste;
         if iTipoCustoRecImo > 0             then  ParamByName('PIDTIPOCUSTORECIMO').AsInteger := iTipoCustoRecImo;
      end;

      Open;
   end;
end;



function TfrmExecFolhaAluguelNova.RescindeContratos: boolean;
var
   iContratoRescisao : integer;
   dDataRescisao     : TDateTime;
   fAtual, fQuant    : double;
begin
   Result := True;

   if not(dtmImobiliario.qryContratosRescisao.isEmpty) then begin

      MudaInstrucao(6, 'Encerrando/prorrogando Contratos...'); // progressbar

      // ProgressBar
      fQuant := dtmImobiliario.qryContratosRescisao.RecordCount;
      MostraProgresso(ProgressBar, lblProgress, lblContador, fQuant, 'Encerrando/prorrogando Contratos...');

      Temporiza(2);

      with dtmImobiliario.qryContratosRescisao do begin
         First;
         fAtual := 0;
         while not EOF do begin

            // ProgressBar
            fAtual := fAtual + 1;
            AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fQuant);
            Application.ProcessMessages;

            Temporiza(2);

            iContratoRescisao := dtmImobiliario.qryContratosRescisaoIDCONTRATOIMOVEL.AsInteger;
            dDataRescisao     := dtmImobiliario.qryContratosRescisaoCONDATAFIM.AsDateTime;

            StartTransacao;

            ParametrosSistema;
            // verifica se é para Encerrar ou Prorrogar o Contrato
            if (dtmImobiliario.qryParamImobFLGAUTORESCISAO.AsInteger = 1) then begin

               // Encerra o Contrato
               if EventoImovel.RescisaoContratual(iContratoRescisao, dDataRescisao) then begin
                  CommitTransacao;
               end else begin
                  RollBackTransacao;
                  Result := False;
               end;

            end else begin

               // Prorroga o Contrato por tempo indeterminado
               if EventoImovel.ProrrogaContrato(iContratoRescisao, Date, -1, False) = 0 then begin
                  CommitTransacao;
               end else begin
                  RollBackTransacao;
                  Result := False;
               end;

            end;

            Temporiza(1);
            Next;
         end;
      end;

   end;
end;

// =================================================================================================
//    Fim da Rescisão
// =================================================================================================





// =================================================================================================
//    2º) Reajuste
// =================================================================================================

procedure TfrmExecFolhaAluguelNova.FiltraContratosReajuste;
var
   dDataFim    : TDateTime;
   iAno,iMes   : word;
begin
   iAno     := word(trunc(DBspnAno.Value));
   iMes     := cboMes.ItemIndex + 1;
   dDataFim := EncodeDate(Word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1);

   MostraEspera('Selecionando Contratos para reajuste...');

   // seleciona os contratos
   with dtmImobiliario.qryContratosReajuste do begin
      LimpaParametros(dtmImobiliario.qryContratosReajuste);
      ParamByName('PIDPESSOA').AsInteger        := Sistema.idEmpresa;
      ParamByName('PCONDATAFIM').asDateTime     := dDataFim;
      ParamByName('PFLGTIPOCONTRATO').asString  := 'L';
      ParamByName('DATAINI').AsDateTime         := EncodeDate(iAno, iMes, 1);
      ParamByName('DATAFIM').AsDateTime         := DiasInuteis.UltDiaMes(iAno, iMes);

      ParametrosSistema;
      if dtmImobiliario.qryParamImobFLGFILTRAREAJUSTE.AsInteger = 1 then begin
         if iContratoSelecao             > 0 then ParamByName('PIDCONTRATOIMOVEL').AsInteger  := iContratoSelecao;
         if MolResponsavel1.iResponsavel > 0 then ParamByName('PIDRESPONSAVEL').AsInteger     := MolResponsavel1.iResponsavel;
         if iAdminImovel                 > 0 then ParamByName('PIDADMINIMOVEL').AsInteger     := iAdminImovel;
         if iPortadorForma               > 0 then ParamByName('PCODPORTFORMA').AsInteger      := iPortadorForma;
         if iIndiceReajuste              > 0 then ParamByName('PINDICEREAJUSTE').AsInteger    := iIndiceReajuste;
         if iTipoCustoRecImo             > 0 then ParamByName('PIDTIPOCUSTORECIMO').AsInteger := iTipoCustoRecImo;
      end;
      Open;

      // Daniel Simões - 22/02/2006 - ------------------------------------------
      // Filtra apenas os contratos que estão vigentes...
      Filtered := False;
      Filter   := ' FLGSTATUS = ''V'' ';
      Filtered := True;
      // Daniel Simões - 22/02/2006 - ------------------------------------------
   end;

   Temporiza(1);
   MudaPrincipal(3);
   Temporiza(1);
   EscondeEspera;
   Repaint;
end;



function TfrmExecFolhaAluguelNova.ReajustaTodosContratos: boolean;
var
   dDataUltReajuste, dDataReajuste, dIniContrato : TDateTime;
   fVlrAtual, fFatorReajuste, fFatorVlrAno : double;
   iIndiceReajuste, iPeriodo               : integer;
   fQuant, fAtual                          : double;
   iDia, iMes, iAno                        : word;
   bParcial                                : Boolean;
   fSomaValor                              : Double; // Daniel Simões ----------
begin
   Result := True;

   MudaInstrucao(6, 'Calculando Reajustes...'); // progressbar
   Application.ProcessMessages;

   // ProgressBar
   fQuant := dtmImobiliario.qryContratosReajuste.RecordCount;
   MostraProgresso(ProgressBar, lblProgress, lblContador, fQuant, 'Calculando Reajustes...');

   dtmImobiliario.qryContratosReajuste.First;
   fAtual := 0;
   while not (dtmImobiliario.qryContratosReajuste.EOF) do begin

      // ProgressBar
      fAtual := fAtual + 1;
      AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fQuant);
      Application.ProcessMessages;

// Daniel Simões - 21/02/2006 - ------------------------------------------------
      fSomaValor := BuscaValorTotalImovel( dtmImobiliario.qryContratosReajusteIDCONTRATOIMOVEL.AsInteger );

      if not ( VerificaValorImovel( dtmImobiliario.qryContratosReajusteIDCONTRATOIMOVEL.AsInteger ) ) then begin
        if ( MsgDlg('Valor do contrato Nº: '+dtmImobiliario.qryContratosReajusteCONNUMERO.AsString+' ( '+
                     FloatToStrF(dtmImobiliario.qryContratosReajusteCONVLRAJUSTADO.AsFloat,ffNumber,8,2)+' ) '+
                    'não corresponde a soma do valor'+#13+'dos imóveis: ( '+FloatToStrF(fSomaValor,ffNumber,8,2)+
                    ' ). Deseja atualizar o valor do contrato de forma automática?','Confirmação!',mtConfirmation,
                    [mbYes,mbNo],0) = mrYes ) then
        begin
          dtmImobiliario.qryContratosReajuste.Edit;
          dtmImobiliario.qryContratosReajusteCONVLRAJUSTADO.asFloat := fSomaValor;
          dtmImobiliario.qryContratosReajuste.Post;
        end;
      end;
// Daniel Simões - 21/02/2006 - ------------------------------------------------

      iIndiceReajuste   := dtmImobiliario.qryContratosReajusteCONINDICEREAJUSTE.AsInteger;
      fVlrAtual         := dtmImobiliario.qryContratosReajusteCONVLRAJUSTADO.asFloat;
      dDataUltReajuste  := dtmImobiliario.qryContratosReajusteCONDATAREAJUSTE.asFloat;
      iPeriodo          := dtmImobiliario.qryContratosReajusteCONPERREAJUSTE.AsInteger;
      dDataReajuste     := dtmImobiliario.qryContratosReajusteCONPROXREAJUSTE.asFloat;
      dIniContrato      := dtmImobiliario.qryContratosReajusteCONDATAINICIO.AsDateTime;
      DecodeDate(dDataReajuste, iAno, iMes, iDia);

      // Verifica se existe valor específico para o ano
      with dtmImobiliario.qryContratosVlrAno do begin
         LimpaParametros(dtmImobiliario.qryContratosVlrAno);
         ParamByName('PIDCONTRATOIMOVEL').AsInteger := dtmImobiliario.qryContratosReajusteIDCONTRATOIMOVEL.AsInteger;
         ParamByName('PANOINICIO').AsInteger        := iAno;
         Open;
         if IsEmpty then
              bParcial := False
         else bParcial := True;
      end;

      // Verifica a variação percentual do índice
      fFatorVlrAno   := 1;

//      VINICIUS - 06/01/2005 - Forma anterior não calculava o FATOR pro-rata
//      VINICIUS - 03/03/2005 - Retornada a forma anterior para demais clientes
//                 VERIFICAR NA FUNCEF NÃO ESTÁ USANDO SEMPRE O MES ANTERIOR ???
      // Reajuste pro-rata específico para a VALIA, verificar com demais clientes
      if Sistema.TipoCliente = 20041 then begin
         fFatorReajuste := ComunsImobiliarioDB.FatorCorrecao(iIndiceReajuste, dDataUltReajuste,
                                                             (dDataReajuste -1), True, 0, True); // Daniel Simões - 19/04/2006 - P: 22113

         if bParcial then begin
            fFatorVlrAno := ComunsImobiliarioDB.FatorCorrecao(iIndiceReajuste, dIniContrato,
                                                              (dDataReajuste -1), True, 0, True);
         end;

      end else begin
         //fFatorReajuste := FuncoesImob.CalculaFatorCorrecao(iIndiceReajuste, dDataUltReajuste, DiasInUteis.SomaMeses(dDataReajuste, -1), True); //WO19422 Leandro Pocebon
         
		 // Paulo Nobre - WO22016
         //fFatorReajuste := FuncoesImob.CalculaFatorCorrecao(iIndiceReajuste, DiasInUteis.SomaMeses(dDataUltReajuste,1), DiasInUteis.SomaMeses(dDataReajuste, -1), True);   //WO19422 Leandro Pocebon

         fFatorReajuste := FuncoesImob.CalculaFatorCorrecao(iIndiceReajuste, dDataUltReajuste, DiasInUteis.SomaMeses(dDataReajuste, -1), True);
         // Paulo Nobre - WO22016

         if bParcial then begin
            fFatorVlrAno := FuncoesImob.CalculaFatorCorrecao(iIndiceReajuste, dIniContrato, DiasInUteis.SomaMeses(dDataReajuste, -1), True);
         end;
      end;
      AplicaReajuste(dDataReajuste, fVlrAtual, fFatorReajuste, fFatorVlrAno, iPeriodo, bParcial);

      dtmImobiliario.qryContratosReajuste.Next;
   end;
end;



procedure TfrmExecFolhaAluguelNova.AplicaReajuste(const dDataReajuste: TDateTime; const fVlrAtual, fFatorReajuste, fFatorVlrAno: double; const iPeriodo: integer; const bParcial: Boolean);
var
   fVlrAjustado,fVlrParcial : double;
   dDataProxReajuste : TDateTime;
   fVlrAnoComCorrecao, fVlrAnoSemCorrecao : double;
begin
   // calcula o novo valor
   if bParcial then begin
     // Desconta do aluguel principal atual, os imoveis que tem valor específico para o ano
     fVlrParcial := fVlrAtual;
     fVlrAnoComCorrecao := 0;
     fVlrAnoSemCorrecao := 0;
     with dtmImobiliario do begin
        qryContratosVlrAno.First;
        while not qryContratosVlrAno.Eof do begin
           fVlrParcial := fVlrParcial - qryContratosVlrAnoCIMVLRAJUSTADO.AsFloat;
           if qryContratosVlrAnoFLGCORRIGE.AsString = 'S' then
                fVlrAnoComCorrecao := fVlrAnoComCorrecao + qryContratosVlrAnoVALOR.AsFloat
           else fVlrAnoSemCorrecao := fVlrAnoSemCorrecao + qryContratosVlrAnoVALOR.AsFloat;
           qryContratosVlrAno.Next;
        end;
     end;

     // Aplica os devidos reajustes
     fVlrAjustado := (fVlrParcial * fFatorReajuste * dtmImobiliario.qryContratosReajustePERCENTFIXO.asFloat) +
                     (fVlrAnoComCorrecao * fFatorVlrAno) + fVlrAnoSemCorrecao;
   end else begin
      fVlrAjustado := fVlrAtual * fFatorReajuste * dtmImobiliario.qryContratosReajustePERCENTFIXO.asFloat;
   end;

   // Vinicius 28/08/2004 - Arredondamento
   fVlrAjustado := ComunsImobiliario.Arredonda(fVlrAjustado, 2);

   // calcula a data do próximo reajuste, baseado na periodicidade
   dDataProxReajuste := DiasInUteis.SomaMeses(dDataReajuste, iPeriodo);

   // grava os dados atualizados, registro a registro
   dtmImobiliario.qryContratosReajuste.Edit;
   dtmImobiliario.qryContratosReajusteCONVLRTOTAL.asFloat         := fVlrAtual;
   dtmImobiliario.qryContratosReajusteCONVLRAJUSTADO.asFloat      := fVlrAjustado;
   dtmImobiliario.qryContratosReajustePERCENTREAJUSTE.asFloat     := fFatorReajuste;
   dtmImobiliario.qryContratosReajustePERCENTVLRANO.asFloat       := fFatorVlrAno;
   dtmImobiliario.qryContratosReajusteCONDATAREAJUSTE.AsDateTime  := dDataReajuste;
   dtmImobiliario.qryContratosReajusteCONPROXREAJUSTE.AsDateTime  := dDataProxReajuste;
   dtmImobiliario.qryContratosReajuste.Post;
end;



function TfrmExecFolhaAluguelNova.FinalizaReajustes: boolean;
var
   iContador             : integer;
   fSaldoAjuste          : double;
   fVlrImovel            : double;
   fVlrAjustadoImovel    : double;
   iDia, iMes, iAno      : word;
   bVlrAno               : Boolean;
   sObsEvento, sObsContr : String;
   fPercentEvento        : Double;

begin
   Result := True;

   try

      dtmImobiliario.qryContratosReajuste.First;
      while not(dtmImobiliario.qryContratosReajuste.EOF) do begin

         // Verifica o ano do reajuste para checar valores específicos por ano
         DecodeDate(dtmImobiliario.qryContratosReajusteCONDATAREAJUSTE.AsDateTime, iAno, iMes, iDia);

         sObsContr := 'Reajuste Contratual';
         if dtmImobiliario.qryContratosReajustePERCENTVLRANO.AsFloat > 1 then
              sObsContr := sObsContr + ', possuindo imóveis com Valor Futuro ao Percentual de reajuste de ' +
                                       FormatFloat('##0.000000', ComunsImobiliario.Arredonda( ((dtmImobiliario.qryContratosReajustePERCENTVLRANO.AsFloat - 1) * 100), 6 ) ) + ' %';
         if dtmImobiliario.qryContratosReajustePERCENTFIXO.AsFloat > 1 then
              sObsContr := sObsContr + ', acrescido do percentual fixo de ' +
                                       FormatFloat('##0.0000', ComunsImobiliario.Arredonda( ((dtmImobiliario.qryContratosReajustePERCENTFIXO.AsFloat - 1) * 100), 6 ) ) + ' % além do indice de correção.';

         // abre a tabela de Imóveis por Contrato
         with dtmImobiliario.qryContratoXImovel do begin
            LimpaParametros(dtmImobiliario.qryContratoXImovel);
            ParamByName('PIDCONTRATOIMOVEL').AsInteger := dtmImobiliario.qryContratosReajusteIDCONTRATOIMOVEL.AsInteger;
            Open;
            First;

            // contador para identificar o último registro
            iContador      := dtmImobiliario.qryContratoXImovel.RecordCount;
            fSaldoAjuste   := dtmImobiliario.qryContratosReajusteCONVLRAJUSTADO.asFloat;

            // reajusta o valor de cada Imóvel
            while not(dtmImobiliario.qryContratoXImovel.EOF) do begin
               dec(iContador);

               fVlrImovel := dtmImobiliario.qryContratoXImovelCIMVLRAJUSTADO.asFloat;

               // Abre tabela com valores por ano
               LimpaParametros(dtmImobiliario.qryContratosVlrAno);
               dtmImobiliario.qryContratosVlrAno.ParamByName('PIDCONTRATOIMOVEL').AsInteger := dtmImobiliario.qryContratoXImovelIDCONTRATOIMOVEL.AsInteger;
               dtmImobiliario.qryContratosVlrAno.ParamByName('PIDIMOVEL').AsInteger  := dtmImobiliario.qryContratoXImovelIDIMOVEL.AsInteger;
               dtmImobiliario.qryContratosVlrAno.ParamByName('PANOINICIO').AsInteger := iAno;
               dtmImobiliario.qryContratosVlrAno.Open;
               if dtmImobiliario.qryContratosVlrAno.IsEmpty then begin
                  bVlrAno        := False;
                  sObsEvento     := 'Reajuste Contratual';
                  fPercentEvento := ComunsImobiliario.Arredonda( ((dtmImobiliario.qryContratosReajustePERCENTREAJUSTE.asFloat - 1) * 100), 6 );
               end else begin
                  bVlrAno        := True;
                  if dtmImobiliario.qryContratosVlrAnoFLGCORRIGE.AsString = 'S' then begin
                     sObsEvento     := 'Reajuste de valor futuro do aluguel';
                     fPercentEvento := ComunsImobiliario.Arredonda( ((dtmImobiliario.qryContratosReajustePERCENTVLRANO.asFloat - 1) * 100), 6 );
                  end else begin
                     sObsEvento     := 'Novo valor futuro do aluguel, sem reajuste';
                     fPercentEvento := 0;
                  end;
               end;

               // Se existir valor específico no contrato, executa o reajuste sobre o valor especificado
               if bVlrAno then begin

                  fVlrAjustadoImovel := dtmImobiliario.qryContratosVlrAnoVALOR.AsFloat;
                  if dtmImobiliario.qryContratosVlrAnoFLGCORRIGE.AsString = 'S' then
                     fVlrAjustadoImovel := fVlrAjustadoImovel * dtmImobiliario.qryContratosReajustePERCENTVLRANO.asFloat;
               end else begin
                  fVlrAjustadoImovel := fVlrImovel * dtmImobiliario.qryContratosReajustePERCENTREAJUSTE.asFloat;

                  // Pend 17341 22/08/2004 - Vinicius - Atribui percentual fixo de reajuste além do indice definido
                  if dtmImobiliario.qryContratosReajustePERCENTFIXO.asFloat <> 1 then begin
                     fVlrAjustadoImovel := fVlrAjustadoImovel * dtmImobiliario.qryContratosReajustePERCENTFIXO.asFloat;
                     sObsEvento := 'Reajustado pelo indice acrescido do percentual fixo de ' +
                                   FormatFloat('##0.000000%', ComunsImobiliario.Arredonda( ((dtmImobiliario.qryContratosReajustePERCENTFIXO.asFloat - 1) * 100), 6 ) );
                  end;
               end;

               // Vinicius 28/08/2004 - Arredondamento
               fVlrAjustadoImovel := ComunsImobiliario.Arredonda(fVlrAjustadoImovel, 2);

               fSaldoAjuste := fSaldoAjuste - fVlrAjustadoImovel;

               // ajusta o último valor
               if iContador = 0 then fVlrAjustadoImovel := ComunsImobiliario.Arredonda(fVlrAjustadoImovel + fSaldoAjuste, 2);

               // grava o reajuste do valor do Imóvel
               with dtmImobiliario.qryUpdateCXI do begin
                  LimpaParametros(dtmImobiliario.qryUpdateCXI);
                  ParamByName('PIDCONTRATOIMOVEL').AsInteger := dtmImobiliario.qryContratosReajusteIDCONTRATOIMOVEL.AsInteger;
                  ParamByName('PIDIMOVEL').AsInteger         := dtmImobiliario.qryContratoXImovelIDIMOVEL.AsInteger;
                  ParamByName('PCIMVLRAJUSTADO').asFloat     := fVlrAjustadoImovel;
                  ParamByName('PCIMVLRALUGUEL').asFloat      := fVlrImovel;
                  ExecSQL;
               end;

               // registra o reajuste PARA O IMÓVEL
               if fVlrAjustadoImovel > 0 then begin
                  EventoImovel.RegistraEvento(dtmImobiliario.qryContratoXImovelIDIMOVEL.AsInteger,
                               dtmImobiliario.qryContratosReajusteIDCONTRATOIMOVEL.AsInteger, Sistema.idUsuario,
                               dtmImobiliario.qryContratosReajusteCONINDICEREAJUSTE.AsInteger, -1,
                               dtmImobiliario.qryContratosReajusteCONDATAREAJUSTE.AsDateTime,
                               dtmImobiliario.qryContratosReajusteCONPROXREAJUSTE.AsDateTime,
                               'RJ', 'Reajuste Contratual', sObsEvento, fPercentEvento,
                               fVlrImovel, fVlrAjustadoImovel, False);
               end;

               dtmImobiliario.qryContratoXImovel.Next;
            end;

         end;

         // registra o reajuste PARA O CONTRATO
         EventoImovel.RegistraEvento(-1, dtmImobiliario.qryContratosReajusteIDCONTRATOIMOVEL.AsInteger,
                      Sistema.idUsuario, dtmImobiliario.qryContratosReajusteCONINDICEREAJUSTE.AsInteger,
                      -1, dtmImobiliario.qryContratosReajusteCONDATAREAJUSTE.AsDateTime,
                      dtmImobiliario.qryContratosReajusteCONPROXREAJUSTE.AsDateTime,
                      'RJ', 'Reajuste Contratual', sObsContr,
                      ComunsImobiliario.Arredonda( ((dtmImobiliario.qryContratosReajustePERCENTREAJUSTE.asFloat - 1) * 100), 6 ),
                      dtmImobiliario.qryContratosReajusteCONVLRTOTAL.AsFloat,
                      dtmImobiliario.qryContratosReajusteCONVLRAJUSTADO.asFloat, False);

         dtmImobiliario.qryContratosReajuste.Next;
      end;

      if ( (dtmImobiliario.qryContratosReajuste.Active) and (dtmImobiliario.qryContratosReajuste.UpdatesPending) ) then begin
         dtmImobiliario.qryContratosReajuste.ApplyUpdates;
      end;

   except
      if ( (dtmImobiliario.qryContratosReajuste.Active) and (dtmImobiliario.qryContratosReajuste.UpdatesPending) ) then begin
         dtmImobiliario.qryContratosReajuste.CancelUpdates;
      end;

      Result := False;

      Screen.Cursor := crDefault;
      MsgDlg('Ocorreu falha durante o reajuste dos Contratos. Processo interrompido', 'Erro', mtError, [mbOk], 0);
      Raise;
      Repaint;
   end;
end;



// =================================================================================================
//    Fim do Reajuste
// =================================================================================================





// =================================================================================================
//    Manipulação de Lançamentos de Previsão
// =================================================================================================


{ desfazer os lançamentos de previsão da competencia a ser gerada }
procedure TfrmExecFolhaAluguelNova.DesfazPrevisaoCompetencia;
var fAtual, fQuant : integer;
    sErro: string;
begin
   SelecionaLancamentosPrevisao(True);
   try
      if not(dtmLancImovel.qryLancImovel.IsEmpty) then begin
         with dtmLancImovel.qryLancImovel do begin
            fAtual := 1;
            fQuant := RecordCount;
            MostraProgresso(ProgressBar, lblProgress, lblContador, fQuant, 'Desfazendo Lançamentos de Previsões...');

            First;
            while not(EOF) do begin
               // Exclui o(s) lançamento(s)
               FuncoesImob.ExcluiLancImovel(dtmLancImovel.qryLancImovelIDDOCUMENTO.AsInteger,
                                            dtmLancImovel.qryLancImovelPLNCODIGO.AsInteger, Date,
                                            (not dtmLancImovel.qryLancImovelCODDOCUMENTO.IsNull),
                                            (not dtmLancImovel.qryLancImovelPLNCODIGO.IsNull),
                                            sErro);
               Next;
               fAtual := fAtual + 1;
               AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fQuant);
               Application.ProcessMessages;
            end;
         end;
      end;
   finally
      LimpaParametros(dtmLancImovel.qryLancImovel);
   end;
end;


// Seleciona apenas os lançamentos do mes atual para desfazer a previsão
procedure TfrmExecFolhaAluguelNova.SelecionaLancamentosPrevisao(const bApenasDoMes:Boolean);
var sAno,sMes   : string;
begin
   sAno := FormatFloat('0000', DBspnAno.Value);
   sMes := IntToStr(cboMes.ItemIndex + 1);

   if length(sMes) = 1 then sMes := '0' + sMes;

   with dtmLancImovel.qryLancImovel do begin
      LimpaParametros(dtmLancImovel.qryLancImovel);
      ParamByName('PIDPESSOA').AsInteger      := Sistema.idEmpresa;
      ParamByName('PFLGORIGEMLANC').AsString  := 'V';
      if bApenasDoMes then begin
         ParamByName('PMESCOMPETENCIA').AsInteger := cboMes.ItemIndex + 1;
         ParamByName('PANOCOMPETENCIA').AsInteger := StrToInt(FloatToStr(DBspnAno.Value));
      end else begin
         ParamByName('PANOMESCOMPETENCIAMAIOR').AsString := sAno + sMes;
      end;

      if MolResponsavel1.iResponsavel > 0 then ParamByName('PIDRESPONSAVEL').AsInteger     := MolResponsavel1.iResponsavel;
      if iAdminImovel > 0                 then ParamByName('PIDADMINIMOVEL').AsInteger     := iAdminImovel;
      if iContratoSelecao > 0             then ParamByName('PIDCONTRATOIMOVEL').AsInteger  := iContratoSelecao;
      if iPortadorForma > 0               then ParamByName('PCODPORTFORMA').AsInteger      := iPortadorForma;
      if iIndiceReajuste > 0              then ParamByName('PINDICEREAJUSTE').AsInteger    := iIndiceReajuste;
      if iTipoCustoRecImo > 0             then ParamByName('PIDTIPOCUSTORECIMO').AsInteger := iTipoCustoRecImo;
      Open;
   end;
end;


function TfrmExecFolhaAluguelNova.ExistePrevisaoNoMes(const iMeses: Integer): Boolean;
var iMes, iAno : Integer;
begin
   iMes := cboMes.ItemIndex + 1 + iMeses;
   iAno := word(trunc(DBspnAno.Value));
   while iMes > 12 do begin
      iMes := iMes - 12;
      iAno := iAno + 1;
   end;

   with qryExistePrevisaoImovel do begin
      LimpaParametros(qryExistePrevisaoImovel);
      ParamByName('PIDPESSOA').AsInteger         := Sistema.IdEmpresa;
      ParamByName('PMESCOMPETENCIA').AsInteger   := iMes;
      ParamByName('PANOCOMPETENCIA').AsInteger   := iAno;
      ParamByName('PIDCONTRATOIMOVEL').AsInteger := dtmImobiliario.qryContratoXImovelIDCONTRATOIMOVEL.AsInteger;
      ParamByName('PIDIMOVEL').AsInteger         := dtmImobiliario.qryContratoXImovelIDIMOVEL.AsInteger;
      Open;
   end;
   Result := not qryExistePrevisaoImovel.IsEmpty;
end;


procedure TfrmExecFolhaAluguelNova.ExcluiPrevisao(const iContrato, iMeses, iMes, iAno: Integer);
var i, iMesAux, iAnoAux : Integer;
    sErro : String;
    sAnoMesComp : String; // Daniel Simões
begin
   sAnoMesComp := IntToStr(iAno)+IntToStr(iMes); // Daniel Simões

   if iMeses > 0 then begin

      // Para cada mes de previsão, verifica o valor já lançado
      for i := 1 to iMeses do begin
        // Daniel Simões - 21164
        iMesAux := iMes+i;
        iAnoAux := iAno;
         while iMes > 12 do begin
            iMesAux := iMesAux - 12;
            iAnoAux := iAnoAux + 1;
         end;

         with qryExistePrevisaoContrato do begin
            LimpaParametros(qryExistePrevisaoContrato);
            ParamByName('PIDPESSOA').AsInteger         := Sistema.IdEmpresa;
            // Daniel Simões - 21164
            ParamByName('PMESCOMPETENCIA').AsInteger   := iMesAux;
            ParamByName('PANOCOMPETENCIA').AsInteger   := iAnoAux;
            ParamByName('PIDCONTRATOIMOVEL').AsInteger := iContrato;
            Open;
         end;

         // Exclui a previsão quando o valor for diferente do atual
         if not qryExistePrevisaoContrato.IsEmpty then begin
            if qryExistePrevisaoContratoVLRLANCRECEB.AsFloat <> dtmImobiliario.qryContratosFolhaCONVLRAJUSTADO.AsFloat then begin
                  FuncoesImob.ExcluiLancImovel(qryExistePrevisaoContratoIDDOCUMENTO.AsInteger,
                                               qryExistePrevisaoContratoPLNCODIGO.AsInteger, Date,
                                               (not qryExistePrevisaoContratoCODDOCUMENTO.IsNull),
                                               (not qryExistePrevisaoContratoPLNCODIGO.IsNull),
                                               sErro);
            end;
         end;
      end;
   end else begin

      with qryExistePrevisaoContrato do begin
         LimpaParametros(qryExistePrevisaoContrato);
         ParamByName('PIDPESSOA').AsInteger         := Sistema.IdEmpresa;
         // Daniel Simões - 21164
         ParamByName('PANOMESCOMP').AsString        := sAnoMesComp;
         ParamByName('PIDCONTRATOIMOVEL').AsInteger := iContrato;
         Open;
      end;

      // Exclui a previsão quando o valor for diferente do atual
      if not qryExistePrevisaoContrato.IsEmpty then begin
         while not qryExistePrevisaoContrato.eof do begin
            FuncoesImob.ExcluiLancImovel(qryExistePrevisaoContratoIDDOCUMENTO.AsInteger,
                                         qryExistePrevisaoContratoPLNCODIGO.AsInteger, Date,
                                         (not qryExistePrevisaoContratoCODDOCUMENTO.IsNull),
                                         (not qryExistePrevisaoContratoPLNCODIGO.IsNull),
                                         sErro);
            qryExistePrevisaoContrato.next;
         end;
      end;
   end;
end;



// =================================================================================================
//    Fim da manipulação de Lançamentos de Previsão
// =================================================================================================





// =================================================================================================
//    Cálculo e Lançamento dos Aluguéis
// =================================================================================================
procedure TfrmExecFolhaAluguelNova.GeraFolha;
var fAtual, fQuant : double;
begin
   // monta a query dos contratos para os quais se deve tentar gerar aluguel
   SelecionaContratosFolha('L');

   with dtmImobiliario.qryContratosFolha do begin
      // ProgressBar
      MudaInstrucao(6, 'Calculando aluguéis...');
      fQuant := dtmImobiliario.qryContratosFolha.RecordCount;
      MostraProgresso(ProgressBar, lblProgress, lblContador, fQuant, 'Calculando aluguéis...');

      // varre escopo de contratos
      First;
      fAtual := 0;
      while not(EOF) do begin

         // ProgressBar
         fAtual := fAtual + 1;
         AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fQuant);
         Application.ProcessMessages;

         if (DBspnAnoFim.Value = 0) then begin
            ProcessaContrato;
         end else begin
            ProcessaContratoPeriodo;
         end;

         Next;
         Application.ProcessMessages;
      end;
   end;
end;



procedure TfrmExecFolhaAluguelNova.SelecionaContratosFolha(const iTipoContrato : String);
var dDataIniCarencia, dDataFimCarencia : String;
var dDataFim, dDataIni : tDateTime;
begin
   dDataIni         := DiasUteis.UltDiaMes( Word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1) );
   dDataFim         := EncodeDate(Word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1);
   dDataIniCarencia := DateToStr(dDataFim);
   dDataFimCarencia := DateToStr(DiasInUteis.UltDiaMes(trunc(DBspnAno.Value), (cboMes.ItemIndex + 1)));

   // seleciona os contratos
   with dtmImobiliario.qryContratosFolha do begin
      LimpaParametros(dtmImobiliario.qryContratosFolha);
      ParamByName('PIDPESSOA').AsInteger           := Sistema.idEmpresa;
      ParamByName('PCONDATAINICIO').asDateTime     := dDataIni;
      ParamByName('PCONDATAFIM').asDateTime        := dDataFim;
      ParamByName('PCONDATAINICARENCIA').asString  := dDataIniCarencia;
      ParamByName('PCONDATAFIMCARENCIA').asString  := dDataFimCarencia;
      ParamByName('PFLGTIPOCONTRATO').asString     := iTipoContrato;
      ParamByName('PFLGCOBRANCAAUTO').AsInteger    := 1;

      if MolResponsavel1.iResponsavel > 0 then ParamByName('PIDRESPONSAVEL').AsInteger     := MolResponsavel1.iResponsavel;
      if iAdminImovel > 0                 then ParamByName('PIDADMINIMOVEL').AsInteger     := iAdminImovel;
      if iContratoSelecao > 0             then ParamByName('PIDCONTRATOIMOVEL').AsInteger  := iContratoSelecao;
      if iPortadorForma > 0               then ParamByName('PCODPORTFORMA').AsInteger      := iPortadorForma;
      if iIndiceReajuste > 0              then ParamByName('PINDICEREAJUSTE').AsInteger    := iIndiceReajuste;
      if iTipoCustoRecImo > 0             then ParamByName('PIDTIPOCUSTORECIMO').AsInteger := iTipoCustoRecImo;
      Open;
   end;
end;



procedure TfrmExecFolhaAluguelNova.ProcessaContrato;
var
   iDocumento, i : integer;
   iDocumentoPrevisao: array of integer;  // guardará os iddocumentos das previsoes
   iQtdeMesesPrevisao: Integer;
   iDia, iMes, iAno: word;
   dDataBase: TDateTime;
   dVenc : TDateTime;

   iMes1, iAno1 : word; // Daniel Simões - 21164
begin
   // Daniel Simões - 21164
   iMes1 := cboMes.ItemIndex + 1;
   iAno1 := word(trunc(DBspnAno.Value));


   // verifica se deve ser gerado aluguel para aquele mês
   // se o contrato não for mensal
   // verifica tbém se já há aluguel para aquele mês
   if MesAluguel( iMes1, iAno1 ) then begin

      // abre a query de imóveis por contrato
      SelecionaImoveisContrato( iAno1, iMes1 );

      StartTransacao;

      try
         // Guarda o nº de documento para os imóveis e já prepara o NoDocumento
         iDocumento := Documento.GetCodigo(dtmImobiliario.qryAux);

         // Verifica o Nr. de meses a ser gerado na previsão
         iQtdeMesesPrevisao := 0;
         if ModuloImobiliario.AdminImob.iFlgPrevFolha > 0 then begin
            if (ModuloImobiliario.AdminImob.iFlgPrevFolha = 2) or
               (dtmImobiliario.qryContratosFolhaFLGINDETERMINADO.AsString = 'S') then begin
              iQtdeMesesPrevisao := ModuloImobiliario.AdminImob.iQtdeMesPrevFolha;
            end else begin
              DecodeDate(dtmImobiliario.qryContratosFolhaCONDATAFIM.AsDateTime, iAno, iMes, iDia);
              dDataBase := EncodeDate(StrToInt(FloatToStr(DBspnAno.Value)), cboMes.itemIndex+1, 1);
              iQtdeMesesPrevisao := DiasUteis.IntervaloMeses(dDataBase,dtmImobiliario.qryContratosFolhaCONDATAFIM.AsDateTime);
            end;

            // inicializa o vetor a ser utilizado na previsão e define o Nr. do documento
            SetLength(iDocumentoPrevisao, iQtdeMesesPrevisao);
            for i := 0 to iQtdeMesesPrevisao -1 do begin
               iDocumentoPrevisao[i] := Documento.GetCodigo(dtmImobiliario.qryAux);
            end;
         end;

         // Exclui as previsões existentes com valores diferentes do atual
         ExcluiPrevisao(dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.AsInteger, iQtdeMesesPrevisao,-1,-1);

         with dtmImobiliario.qryContratoXImovel do begin

            // varre escopo de contratos
            First;
            while not(EOF) do begin

               // QUASE tudo ocorre aqui
               ProcessaImovel( iDocumento, iAno1, iMes1, dVenc ); // Daniel Simões - 21164

               // Lança Previsão de Recebimentos para o Nr. de meses definidos
               if iQtdeMesesPrevisao > 0 then begin
                  for i := 0 to iQtdeMesesPrevisao -1 do begin
                     if not ExistePrevisaoNoMes(i+1) then begin
                        LancaPrevisao( iDocumentoPrevisao[i], i+1 );
                     end;
                  end;
               end;

               Next;
               Application.ProcessMessages;
            end;
         end;

         ProcessaMensagem(iDocumento,iAno1,iMes1);

         // Marchetti - pendencia 21163


         ProcessaDescontoRateado( iDocumento, dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.AsInteger );
         // Fim Marchetti - pendencia 21163

         CommitTransacao;
      except
         RollBackTransacao;
      end;
   end;
end;


procedure TfrmExecFolhaAluguelNova.ProcessaContratoPeriodo;
var
   iDocumento, i : integer;
   iDocumentoPrevisao: array of integer;  // guardará os iddocumentos das previsoes
   iQtdeMesesPrevisao: Integer;
   iDia, iMes, iAno: word;
   dDataBase: TDateTime;
   dVenc : TDateTime;

// Daniel Simões - 21164
   iQtdMeses, x          : integer;
   dDtCompIni,dDtCompFim : TDateTime;
   dDataAux              : TdateTime;
   iDia1,iMes1,iAno1     : word;
// Daniel Simões - 21164

begin
   // Daniel Simões - 21164
   iMes1          := cboMes.ItemIndex + 1;
   iAno1          := word(trunc(DBspnAno.Value));
   dDtCompIni     := EncodeDate( word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1) ,1 );
   dDtCompFim     := EncodeDate( word(trunc(DBspnAnoFim.Value)), (cboMesFim.ItemIndex + 1) ,1 );
   // Daniel Simões - 21164
   // Variável recebe a quantidade de meses entre as datas de competência inicial e final...
   iQtdMeses  := DiasUteis.IntervaloMeses(dDtCompIni,dDtCompFim) + 1;

   StartTransacao;

   try
      // Daniel Simões - 21164
      for x := 0 to iQtdMeses -1 do begin
         dDataAux := EncodeDate(iAno1,iMes1,1);

         if x > 0 then dDataAux := DiasUteis.SomaMeses(dDataAux,1);

         DecodeDate(dDataAux,iAno1,iMes1,iDia1);

         // verifica se deve ser gerado aluguel para aquele mês
         // se o contrato não for mensal
         // verifica tbém se já há aluguel para aquele mês
         if MesAluguel( iMes1, iAno1 ) then begin          // VERIFICAR PARAMETRO
            // abre a query de imóveis por contrato
            SelecionaImoveisContrato( iAno1, iMes1);       // VERIFICAR PARAMETRO

            // Guarda o nº de documento para os imóveis e já prepara o NoDocumento
            iDocumento := Documento.GetCodigo(dtmImobiliario.qryAux);

            // Exclui as previsões existentes do contrato
            ExcluiPrevisao(dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.AsInteger, -1 , iMes1, iAno1);

            with dtmImobiliario.qryContratoXImovel do begin
               // varre escopo de contratos
               First;
               while not(EOF) do begin
                  // QUASE tudo ocorre aqui
                  // Daniel Simões - 21164
                  ProcessaImovel( iDocumento, iAno1, iMes1, dVenc );       /// VERIFICAR PARAMETRO

                  Next;
                  Application.ProcessMessages;
               end;
            end;

            ProcessaMensagem(iDocumento,iAno1,iMes1);

            // Marchetti - pendencia 21163

            //DAVID - Pendência 17340

            ProcessaDescontoRateado( iDocumento, dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.AsInteger );   // VERIFICAR PARAMETRO
            // Fim Marchetti - pendencia 21163
         end;
      end; // end for/while
      CommitTransacao;
   except
      RollBackTransacao;
   end;
end;


procedure TfrmExecFolhaAluguelNova.ProcessaDesconto( iDocumento, iIdContratoImovel : integer; dVenc : TDateTime );
var
  fTotal, fValor, fVlrBruto : extended;
  bInclui : boolean;
  i : integer;
  iDocExcluir : array of integer;
begin
  //DAVID - Pendência 17340
  qryContratoXDesc.Close;
  qryContratoXDesc.ParamByName('IDCONTRATOIMOVEL').AsFloat := iIdContratoImovel;
  qryContratoXDesc.ParamByName('DATAVENC').AsDateTime      := dVenc;
  qryContratoXDesc.Open;

  fTotal    := 0;
  fValor    := 0;
  fVlrBruto := 0;

  // Vinicius - O desconto é aplicado no valor do documento do mês, não busca direto do
  //            contrato devido ao pro-rata no mes de reajuste
  if not qryContratoXDesc.IsEmpty then begin
    qryLancFolha.First;
    qryLancFolha.Locate( 'IDDOCUMENTO', iDocumento, [loCaseInsensitive, loPartialKey] );
    while (qryLancFolhaIDDOCUMENTO.AsInteger = iDocumento) and (not qryLancFolha.Eof) do begin
      fVlrBruto := fVlrBruto + qryLancFolhaVLRLANCRECEB.AsFloat;
      qryLancFolha.Next;
    end;
  end;

  bInclui := True;
  qryContratoXDesc.First;
  while ( not qryContratoXDesc.Eof ) and bInclui do
  begin

    qryAlteradores.First;
    if qryAlteradores.Locate( 'IDCONTRATOIMOVEL;CODALTERADOR', VarArrayOf([iIdContratoImovel,qryContratoXDescCODALTERADOR.AsInteger]), [loCaseInsensitive, loPartialKey] ) then
    begin
      memErro.Lines.Add('- Existem alteradores duplicados nos descontos do contrato "' +
       qryContratoXDescCONNOME.AsString + '".' + #13 );
      bInclui := False;
    end
    else
    begin
      if not qryContratoXDescPERDESCONTO.IsNull then
      begin
        fValor := ComunsImobiliario.Arredonda(fVlrBruto * ( qryContratoXDescPERDESCONTO.AsFloat / 100 ), 2);
        bInclui := True;
      end
      else
      begin
        qryCotacaoMoeda.Close;
        qryCotacaoMoeda.ParamByName('MOECODIGO').AsFloat := qryContratoXDescMOECODIGO.AsFloat;
        qryCotacaoMoeda.ParamByName('DATA').AsDateTime   := dVenc;
        qryCotacaoMoeda.Open;
        if qryCotacaoMoeda.IsEmpty then
        begin
          memErro.Lines.Add('- Não foi possível encontrar cotação para a moeda ' +
           qryContratoXDescMOESIGLA.AsString + ' em ' + FormatDateTime( 'dd/mm/yyyy', dVenc ) + ', utilizada ' +
           'em desconto do documento ' + IntToStr( iDocumento ) + '.' + #13 );
          bInclui := False;
        end
        else
        begin
          fValor := ComunsImobiliario.Arredonda(qryContratoXDescVLRDESCONTO.AsFloat * qryCotacaoMoedaCOTVALOR.AsFloat, 2) ;
          bInclui := True;
        end;
      end;
    end;

    if bInclui then
      fTotal := fTotal + fValor;

    if fTotal > fVlrBruto then
    begin
      memErro.Lines.Add('- O somatório dos descontos do contrato "' + qryContratoXDescCONNOME.AsString +
       '" ultrapassa o seu valor a ser cobrado no mês.' + #13 );
      bInclui := False;
    end;

    if bInclui then
    begin
      qryAlteradores.Insert;
      qryAlteradores.FieldByName('IDDOCUMENTO').AsFloat        := iDocumento;
      qryAlteradores.FieldByName('IDCONTRATOIMOVEL').AsInteger := iIdContratoImovel;
      qryAlteradores.FieldByName('CONNOME').AsString           := qryContratoXDescCONNOME.AsString;
      qryAlteradores.FieldByName('CODALTERADOR').AsFloat       := qryContratoXDescCODALTERADOR.AsFloat;
      qryAlteradores.FieldByName('VLRALTERADOR').AsFloat       := fValor;
      qryAlteradores.FieldByName('VLRBRUTO').AsFloat           := fVlrBruto;
      qryAlteradores.FieldByName('VLRLIQUIDO').AsFloat         := ComunsImobiliario.Arredonda(fVlrBruto - fValor, 2);
      qryAlteradores.FieldByName('CODTIPIMOVEL').AsString      := qryContratoXDescCODTIPIMOVEL.AsString;
      qryAlteradores.FieldByName('DESCRICAO').AsString         := qryContratoXDescDESCRICAO.AsString;
      qryAlteradores.FieldByName('DESCTIPOIMOVEL').AsString    := qryContratoXDescDESCTIPOIMOVEL.AsString;
      qryAlteradores.FieldByName('OBSERVACAO').AsString        := qryContratoXDescOBSERVACAO.AsString; // Daniel - 24079
      qryAlteradores.Post;
    end
    else
    begin
      SetLength( iDocExcluir, length( iDocExcluir ) + 1 );
      iDocExcluir[ High( iDocExcluir ) ] := iDocumento;
    end;

    qryContratoXDesc.Next;
  end;

  // Caso ocorra erros, Exclui os lançamentos da LançamentosImovel e Alteradores
  for i := 0 to High( iDocExcluir ) do
  begin
    qryAlteradores.First;
    while qryAlteradores.Locate( 'IDDOCUMENTO', iDocExcluir[i], [loCaseInsensitive, loPartialKey] ) do
    begin
      qryAlteradores.Delete;
      qryAlteradores.First;
    end;

    qryLancFolha.First;
    while qryLancFolha.Locate( 'IDDOCUMENTO', iDocExcluir[i], [loCaseInsensitive, loPartialKey] ) do
    begin
      qryLancFolha.Delete;
      qryLancFolha.First;
    end;
  end;

  qryContratoXDesc.Close;
  qryCotacaoMoeda.Close;
end;

function TfrmExecFolhaAluguelNova.ProcuraDesconto: boolean;
begin
   with dtmLancImovel.qrySelectDesconto do begin
      LimpaParametros(dtmLancImovel.qrySelectDesconto);
      ParamByName('PIDCONTRATOIMOVEL').AsInteger   := dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.AsInteger;
      ParamByName('PDCCANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
      ParamByName('PDCCMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
      ParamByName('PFLGCONCEDIDO').AsInteger       := 0;
      Open;
   end;
   Result := dtmLancImovel.qrySelectDesconto.RecordCount > 0;
end;



procedure TfrmExecFolhaAluguelNova.DescontoConcedido(iDesconto: int64);
begin
   with dtmLancImovel.qryUpdateDesconto do begin
      LimpaParametros(dtmLancImovel.qryUpdateDesconto);
      ParamByName('PIDDESCONTO').AsInteger := iDesconto;
      ExecSQL;
   end;
end;



procedure TfrmExecFolhaAluguelNova.ProcessaMensagem(iDocumento:int64; iAno,iMes:Integer);
var
   vMensagem : array of string;
begin
   SetLength(vMensagem, 9);

   ProcuraMsgContrato(vMensagem);
   TrataMsg(vMensagem,iAno,iMes);

   FuncoesImob.InsertMsgLanc(iDocumento, '', '', -1, vMensagem);
end;



procedure TfrmExecFolhaAluguelNova.ProcuraMsgContrato(var vMsg: array of string);
begin
   try
      try

         with dtmLancImovel.qrySelectMsgLanc do begin
            LimpaParametros(dtmLancImovel.qrySelectMsgLanc);
            ParamByName('PIDMSGBOLETO').AsInteger := dtmImobiliario.qryContratosFolhaIDMSGBOLETO.AsInteger;
            Open;
         end;

         if not(dtmLancImovel.qrySelectMsgLanc.IsEmpty) then begin

            vMsg[0]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_1.AsString, 1, 69);
            vMsg[1]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_2.AsString, 1, 69);
            vMsg[2]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_3.AsString, 1, 69);
            vMsg[3]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_4.AsString, 1, 69);
            vMsg[4]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_5.AsString, 1, 69);
            vMsg[5]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_6.AsString, 1, 69);
            vMsg[6]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_7.AsString, 1, 69);
            vMsg[7]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_8.AsString, 1, 69);
            vMsg[8]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_9.AsString, 1, 69);

         end;

      except

      end;

   finally
      dtmLancImovel.qrySelectMsgLanc.Close;
   end;
end;



procedure TfrmExecFolhaAluguelNova.TrataMsg(var vMsg:array of string; iAno,iMes:Integer);
var
  vCuringa, vValor              : array of string;
  dDataVenc, dDataTolera        : TDateTime;

  fMulta                        : Currency;
  fMora                         : Currency;
  sMulta, sMora, sPeriodo, sSql : String;
  sCompetencia, sNomeImoveis    : String;
begin
  SetLength(vCuringa, 12);
  SetLength(vValor, 12);

  dDataVenc   := FuncoesImob.DataVencAluguel(dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.asInteger,
                                             iAno,
                                             iMes,
                                             'A',
                                             False);

  // Data limite para pagamento...
  dDataTolera := dDataVenc;

  if ( dtmImobiliario.qryContratosFolhaCONDIASTOLERANCIA.asInteger>0 ) then begin
    if ( dtmImobiliario.qryContratosFolhaFLGTIPODIATOLERA.asString='U' ) then begin
      dDataTolera := DiasInUteis.SomaDiasUteis(dDataVenc,
                                               dtmImobiliario.qryContratosFolhaCONDIASTOLERANCIA.asInteger,
                                               -1,
                                               -1,
                                               '',
                                               True,
                                               False,
                                               False);
    end else begin
      dDataTolera := dDataVenc+dtmImobiliario.qryContratosFolhaCONDIASTOLERANCIA.asInteger;
    end;
  end;

  // Multa (se valor, então valor; senão, calcula valor a partir do percentual) ...
  if ( dtmImobiliario.qryContratosFolhaCONVLRMULTA.AsFloat>0 ) then begin
    fMulta := dtmImobiliario.qryContratosFolhaCONVLRMULTA.AsFloat;
    sMulta := Modulo.sMoedaCorrente+FormatFloat('#,##0.00',fMulta);
  end else begin
    fMulta := (dtmImobiliario.qryContratosFolhaCONVLRAJUSTADO.AsCurrency*dtmImobiliario.qryContratosFolhaCONPERCENTMULTA.AsCurrency/100);
    sMulta := Modulo.sMoedaCorrente+' '+FormatFloat('#,##0.00',fMulta);
  end;

  // Juros (idem a multa) ...
  if ( dtmImobiliario.qryContratosFolhaCONVLRMORA.AsFloat>0 ) then begin
    fMora := dtmImobiliario.qryContratosFolhaCONVLRMORA.AsCurrency;
    sMora := Modulo.sMoedaCorrente+' '+FormatFloat('#,##0.00',fMora);
  end else begin
    fMora := (dtmImobiliario.qryContratosFolhaCONVLRAJUSTADO.AsCurrency*dtmImobiliario.qryContratosFolhaCONPERCENTMORA.AsCurrency/100);

    { TODO -oAndre -cPhon : se for proporcional, divide por 30 *** É: tá cravado também !!! }
    if ( dtmImobiliario.qryContratosFolhaFLGMORAPROPORC.AsInteger=1 ) then
      fMora := fMora/30;

    sMora := Modulo.sMoedaCorrente+' '+FormatFloat('#,##0.00',fMora);
  end;

  // Periodicidade de aplicação da mora...
  if ( dtmImobiliario.qryContratosFolhaCONPERMORA.AsString='D' ) then
    sPeriodo := 'dia'
  else
    sPeriodo := 'mês';

  // Daniel - 23113
  // Competencia do Lançamento...
  sCompetencia := FormatFloat('00',iMes)+'/'+FormatFloat('0000',iAno);

//Gustavo Mendes - 25166 - Inicio

  LimpaParametros(qryImoveis);
  qryImoveis.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;

  qryImoveis.ParamByName('PCOMP').AsString := FormatFloat('0000',iAno) + FormatFloat('00',iMes);

  if edtNumContrato.Text <> '' then
  begin
    qryImoveis.ParamByName('PIDCONTRATOIMOVEL').AsInteger := iContratoSelecao;
  end
  else
  begin
    qryImoveis.ParamByName('PIDCONTRATOIMOVEL').AsInteger := -1;
  end;

  qryImoveis.Open;
  qryImoveis.First;

  while not qryImoveis.Eof do
  begin
    sNomeImoveis := sNomeImoveis + qryImoveis.FieldByName('CIMDESCRICAO').AsString + ' ';

    qryImoveis.Next;
  end;

//Gustavo Mendes - 25166 - Fim


  // Inicializa os curingas e os valores...
  vCuringa[0]  := '<parcela>';  {|} vValor[0]  := '*parcela*';
  vCuringa[1]  := '<parcelas>'; {|} vValor[1]  := '*parcelas*';
  vCuringa[2]  := '<vo>';       {|} vValor[2]  := '*vo*';
  vCuringa[3]  := '<cm>';       {|} vValor[3]  := '*cm*';
  vCuringa[6]  := '<dataval>';  {|} vValor[6]  := '*dataval*';
  vCuringa[4]  := '<juros>';    {|} vValor[4]  := sMora;
  vCuringa[5]  := '<multa>';    {|} vValor[5]  := sMulta;
  vCuringa[7]  := '<imovel>';   {|} vValor[7]  := Trim(sNomeImoveis);//25166
  vCuringa[8]  := '<recdes>';   {|} vValor[8]  := 'Aluguel';
  vCuringa[9]  := '<tolera>';   {|} vValor[9]  := FormatDateTime('dd/mm/yyyy', dDataTolera);
  vCuringa[10] := '<periodo>';  {|} vValor[10] := sPeriodo;
  vCuringa[11] := '<comp>';     {|} vValor[11] := sCompetencia;

  FuncoesImob.SubstituiCuringa(vMSG,vCuringa,vValor);
end;



function TfrmExecFolhaAluguelNova.MesAluguel(const iMes, iAno:Integer): boolean;
var
   iPeriodo                      : integer;
   dDataBase, dDataHoje          : TDateTime;
   iAnoCarencia                  : word;
   iMesCarencia                  : word;
   bExisteAluguel, bExisteCompl  : boolean;
   sContrato      : string;
begin
   // Contrato Extenso
   if dtmImobiliario.qryContratosFolhaCONNUMERO.isNULL then begin
      sContrato   := dtmImobiliario.qryContratosFolhaCONNOME.AsString;
   end else begin
      sContrato   := dtmImobiliario.qryContratosFolhaCONNUMERO.AsString + ' - ' +
                     dtmImobiliario.qryContratosFolhaCONNOME.AsString;
   end;

   Result := True;

   iPeriodo    := dtmImobiliario.qryContratosFolhaCONPERALUGUEL.AsInteger;
   if iPeriodo = 0 then iPeriodo := 1;

   //  Verifica se o contrato é mensal, e não o sendo, verifica se deve haver aluguel no mês
   if iPeriodo <> 1 then begin

      // Daniel Simões - 21164
      dDataHoje      := EncodeDate(iAno, iMes, 1);

      iAnoCarencia   := DiasInUteis.ExtraiAno(dtmImobiliario.qryContratosFolhaCONDATACARENCIA.AsDateTime);
      iMesCarencia   := DiasInUteis.ExtraiMes(dtmImobiliario.qryContratosFolhaCONDATACARENCIA.AsDateTime);

      if dtmImobiliario.qryContratosFolhaCONDATACARENCIA.AsDateTime = DiasInUteis.UltDiaMes(iAnoCarencia, iMesCarencia) then begin
         dDataBase := dtmImobiliario.qryContratosFolhaCONDATACARENCIA.AsDateTime + 1;
      end else begin
         dDataBase := EncodeDate(iAnoCarencia, iMesCarencia, 1);
      end;

      // se não houver divisão exata, não é mês de aluguel
      if DiasInUteis.IntervaloMeses(dDataBase, dDataHoje) mod iPeriodo <> 0 then begin

         Result := False;

         // registra o "erro"
         memErro.Lines.Add('- Mês fora da periodicidade --> ' + sContrato + ';' + #13);

         Exit;

      end;
   end;

   // se for mês de aluguel, verifica se já houve o lançamento de aluguel
   case rdgVariavel.ItemIndex of
      0: ParteAluguel := paFixo;
      1: ParteAluguel := paComplemento;
      2: ParteAluguel := paTudo;
   end;

   // pelo contrato (Fixo / Variável), já elimina opções
   if (dtmImobiliario.qryContratosFolhaFLGTIPOALUGUEL.AsString = 'F') then begin
      Case ParteAluguel of
         paTudo:        ParteAluguel := paFixo;
         paComplemento: ParteAluguel := paNenhum;
      end;
   end;

   bExisteAluguel := False;
   bExisteCompl   := False;

   try

      // 1) Verifica se há lançamento individual
      //    Nesse caso, anula tanto 'A' (aluguel) quanto 'C' (complemento)
      with dtmLancImovel.qryLancImovel do begin
         LimpaParametros(dtmLancImovel.qryLancImovel);

         ParamByName('PIDPESSOA').AsInteger           := Sistema.idEmpresa;
         // Daniel Simões - 21164
         ParamByName('PMESCOMPETENCIA').AsInteger     := iMes;
         ParamByName('PANOCOMPETENCIA').AsInteger     := iAno;
         ParamByName('PFLGTIPOLANCAMENTO').AsString   := 'L';
         ParamByName('PFLGTIPOCONTRATO').AsString     := 'L';
         ParamByName('PFLGORIGEMLANC').AsString       := 'L';
         ParamByName('PIDCONTRATOIMOVEL').AsInteger   := dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.asInteger;
         ParamByName('PIDTIPOCUSTORECIMO').AsInteger  := dtmImobiliario.qryContratosFolhaIDTIPOCUSTORECIMO.asInteger;
         ParamByName('PESTORNADONULL').AsInteger      := 1;
         ParamByName('PFLGESTORNADO').AsInteger       := 0;

         Open;
      end;

      if not(dtmLancImovel.qryLancImovel.IsEmpty) then begin

         bExisteAluguel := True;
         bExisteCompl   := True;

      end else begin

         // 2) Verifica se há lançamento de Aluguel
         //    Anula apenas 'A' (aluguel)
         if ( (ParteAluguel = paTudo) or (ParteAluguel = paFixo) ) then begin
            with dtmLancImovel.qryLancImovel do begin
               LimpaParametros(dtmLancImovel.qryLancImovel);

               ParamByName('PIDPESSOA').AsInteger           := Sistema.idEmpresa;
               // Daniel Simões - 21164
               ParamByName('PMESCOMPETENCIA').AsInteger     := iMes;
               ParamByName('PANOCOMPETENCIA').AsInteger     := iAno;
               ParamByName('PFLGTIPOLANCAMENTO').AsString   := 'A';
               ParamByName('PFLGTIPOCONTRATO').AsString     := 'L';
               ParamByName('PFLGORIGEMLANC').AsString       := 'F';
               ParamByName('PIDCONTRATOIMOVEL').AsInteger   := dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.asInteger;
               ParamByName('PIDTIPOCUSTORECIMO').AsInteger  := dtmImobiliario.qryContratosFolhaIDTIPOCUSTORECIMO.asInteger;
               ParamByName('PESTORNADONULL').AsInteger      := 1;
               ParamByName('PFLGESTORNADO').AsInteger       := 0;

               Open;
            end;

            bExisteAluguel := not(dtmLancImovel.qryLancImovel.IsEmpty);
         end;

         // 3) Verifica se há lançamento de Complemento
         //    Anula apenas 'C' (complemento)
         if ( (ParteAluguel = paTudo) or (ParteAluguel = paComplemento) ) then begin
            with dtmLancImovel.qryLancImovel do begin
               LimpaParametros(dtmLancImovel.qryLancImovel);

               ParamByName('PIDPESSOA').AsInteger           := Sistema.idEmpresa;
               // Daniel Simões - 21164
               ParamByName('PMESCOMPETENCIA').AsInteger     := iMes;
               ParamByName('PANOCOMPETENCIA').AsInteger     := iAno;
               ParamByName('PFLGTIPOLANCAMENTO').AsString   := 'C';
               ParamByName('PFLGTIPOCONTRATO').AsString     := 'L';
               ParamByName('PFLGORIGEMLANC').AsString       := 'F';
               ParamByName('PIDCONTRATOIMOVEL').AsInteger   := dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.asInteger;
               ParamByName('PIDTIPOCUSTORECIMO').AsInteger  := dtmImobiliario.qryContratosFolhaIDTIPOCUSTORECIMO.asInteger;
               ParamByName('PESTORNADONULL').AsInteger      := 1;
               ParamByName('PFLGESTORNADO').AsInteger       := 0;
               
               Open;
            end;

            bExisteCompl := not(dtmLancImovel.qryLancImovel.IsEmpty);
         end;

      end;

      // redefine o tipo de aluguel baseado na existência de lançamento de Aluguel
      Case ParteAluguel of
         paTudo:  if bExisteAluguel then ParteAluguel := paComplemento;
         paFixo:  if bExisteAluguel then ParteAluguel := paNenhum;
      end;

      // redefine o tipo de aluguel baseado na existência de lançamento de Complemento
      Case ParteAluguel of
         paTudo:        if bExisteCompl then ParteAluguel := paFixo;
         paComplemento: if bExisteCompl then ParteAluguel := paNenhum;
      end;

      if ParteAluguel = paNenhum then begin
         Result := False;
         // registra o "erro"
         memErro.Lines.Add('- Lançamento já existe --> ' + IntToStr(iMes) + '/' + IntToStr(iAno) + '  ' + sContrato + ';' + #13);
      end;

   finally
      LimpaParametros(dtmLancImovel.qryLancImovel);
   end;
end;





procedure TfrmExecFolhaAluguelNova.ProcessaImovel(const IDDocumento, iAno, iMes: integer; var dVenc : TDateTime);
begin
   // pelo contrato (Fixo / Variável), já elimina opções
   if (dtmImobiliario.qryContratosFolhaFLGTIPOALUGUEL.AsString = 'F') then begin
      Case ParteAluguel of
         paTudo:        ParteAluguel := paFixo;
         paComplemento: ParteAluguel := paNenhum;
      end;
   end;

   // definidos os lançamentos, parte-se para o vamos ver
   Case ParteAluguel of

      paTudo:
      begin
     // Daniel Simões - 21164
         GeraAluguelImovel('A', IDDocumento,iAno,iMes,dVenc);
         GeraAluguelImovel('C', IDDocumento,iAno,iMes,dVenc);
      end;

      paFixo:        GeraAluguelImovel('A', IDDocumento,iAno,iMes,dVenc);
      paComplemento: GeraAluguelImovel('C', IDDocumento,iAno,iMes,dVenc);
      // Daniel Simões - 21164
   end;
end;

procedure TfrmExecFolhaAluguelNova.GeraAluguelImovel(const sTipoAluguel: string; IDDocumento, iAno, iMes: integer; var dVenc : TDateTime );
var
   dDataVenc      : TDateTime;
   fVlrAluguelOM  : currency;
   fVlrAluguel    : currency;
   iLancImovel    : integer;
   sContrato      : string;
   dCtbIni        : TDateTime;
   dCtbFim        : TDateTime;

   dDtLancamento     : TDateTime; // Daniel Simões - 21164
   iAno1,iMes1,iDia1 : word;
   bBloqueioJudicial : Boolean;

begin
// Daniel - 24703 - Início -----------------------------------------------------
  if (DBspnAnoFim.Value=0) then
    dDtLancamento := edtDataLancamento.Date
  else begin
    // Gera a data do lançamento a cada mês de competência...
    DecodeDate(edtDataLancamento.Date, iAno1, iMes1, iDia1);
    dDtLancamento := EncodeDate(iAno,iMes,iDia1);
  end;
// Daniel - 24703 - Fim --------------------------------------------------------

   // Contrato Extenso
   if dtmImobiliario.qryContratosFolhaCONNUMERO.isNULL then begin
      sContrato   := dtmImobiliario.qryContratosFolhaCONNOME.AsString;
   end else begin
      sContrato   := dtmImobiliario.qryContratosFolhaCONNUMERO.AsString + ' - ' +
                     dtmImobiliario.qryContratosFolhaCONNOME.AsString;
   end;

   // verifica se o aluguel não está zerado
   if dtmImobiliario.qryContratoXImovelCIMVLRAJUSTADO.AsFloat <= 0 then begin

      ParametrosSistema;
      if dtmImobiliario.qryParamImobFLGALUGUELZERO.AsInteger <> 1 then begin
         // grava o contrato e o imóvel com erro
         memErro.Lines.Add('- Aluguel zero --> ' + sContrato + ', ' +
                           dtmImobiliario.qryContratoXImovelNOME_MESTRE.AsString + ' - ' +
                           dtmImobiliario.qryContratoXImovelNOME_IMOVEL.AsString + ';' + #13);
      end;

   end else begin

      // define a data de vencimento do aluguel (seja o principal ou o complemento)
      dDataVenc      := FuncoesImob.DataVencAluguel(dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.asInteger,
                        iAno, iMes, sTipoAluguel[1], False); // Daniel Simões - 21164


      // Busca Parametros de Inadimplencia
      CtrlParamMulta.LimpaQueryMultaJuros(rParamMulta);
      CtrlParamMulta.BuscaParamMulta(rParamMulta, dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.AsInteger,
                                     dtmImobiliario.qryContratosFolhaIDTIPOCUSTORECIMO.AsInteger, dDataVenc );


      // grava o contrato e imóvel com erro na data de vencimento
      if dDataVenc <= 0 then begin
         memErro.Lines.Add('- Data de vencimento inválida --> ' + sContrato + ', ' +
                           dtmImobiliario.qryContratoXImovelNOME_MESTRE.AsString + ' - ' +
                           dtmImobiliario.qryContratoXImovelNOME_IMOVEL.AsString + ';' + #13);
      end else begin

         // TODO -oAndre : é preciso ainda fazer a conversão, presume-se moeda corrente sempre... -----
         fVlrAluguel    := CalculaAluguel(sTipoAluguel, iAno, iMes, fVlrAluguelOM);
         fVlrAluguelOM  := fVlrAluguel;
         // -------------------------------------------------------------------------------------------

         // Gravação na query de Lançamentos -----------------------------------------------------------------------------
         if fVlrAluguel <= 0 then begin
            // grava o contrato e o imóvel com erro
            memErro.Lines.Add('- Aluguel zero --> ' + sContrato + ', ' +
                              dtmImobiliario.qryContratoXImovelNOME_MESTRE.AsString + ' - ' +
                              dtmImobiliario.qryContratoXImovelNOME_IMOVEL.AsString + ';' + #13);
         end else begin

            bBloqueioJudicial := CtrlTipoCustoRecImov.ReceitaPossuiBloqueioJudicial(dtmImobiliario.qryContratosFolhaIDTIPOCUSTORECIMO.AsInteger);

            qryLancFolha.Insert;
            qryLancFolhaCONTRATO.AsString             := sContrato;
            // Daniel - 24085
            qryLancFolhaIMOVEL.AsString               := dtmImobiliario.qryContratoXImovelNOME_MESTRE.AsString + ' - ' +
                                                         dtmImobiliario.qryContratoXImovelNOME_IMOVEL.AsString;
            qryLancFolhaIDLANCIMOVEL.AsInteger        := LeUltRegistro(nil, 'LANCAMENTOSIMOVEL');
            qryLancFolhaIDPESSOA.AsInteger            := Sistema.idEmpresa;
            qryLancFolhaIDIMOVEL.AsInteger            := dtmImobiliario.qryContratoXImovelIDIMOVEL.AsInteger;
            qryLancFolhaCODTIPIMOVEL.AsString         := dtmImobiliario.qryContratoXImovelCODTIPIMOVEL.AsString;
            qryLancFolhaIDTIPOCUSTORECIMO.AsInteger   := dtmImobiliario.qryContratosFolhaIDTIPOCUSTORECIMO.AsInteger;
            qryLancFolhaIDCONTRATOIMOVEL.AsInteger    := dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.AsInteger;

            // Daniel Simões - 21164
            qryLancFolhaDATALANCAMENTO.AsDateTime     := dDtLancamento;
            qryLancFolhaDATAEMISSAO.AsDateTime        := edtDataEmissao.Date;
            qryLancFolhaDATAVENCIMENTO.AsDateTime     := dDataVenc;

            qryLancFolhaMESREFERENCIA.AsInteger       := DiasInUteis.ExtraiMes(dDataVenc);
            qryLancFolhaANOREFERENCIA.AsInteger       := DiasInUteis.ExtraiAno(dDataVenc);
            // Daniel Simões - 21164
            qryLancFolhaMESCOMPETENCIA.AsInteger      := iMes;
            qryLancFolhaANOCOMPETENCIA.AsInteger      := iAno;

            qryLancFolhaRECPAG.AsString               := 'R';
            qryLancFolhaVLRLANCOMRECEB.AsCurrency     := fVlrAluguelOM;
            qryLancFolhaVLRLANCRECEB.AsCurrency       := fVlrAluguel;

            qryLancFolhaMOEDARECEB.AsInteger          := dtmImobiliario.qryContratosFolhaMOECODIGO.AsInteger;

            qryLancFolhaIDFORCLI.AsInteger            := dtmImobiliario.qryContratosFolhaIDLOCATARIO.AsInteger;

            qryLancFolhaFLGAGRUPAR.AsString           := 'S';
            qryLancFolhaFLGAGRUPADO.AsInteger         := 0;
            qryLancFolhaFLGTIPOLANCAMENTO.AsString    := sTipoAluguel;

            // Marchetti - Pendencia 22289
            qryLancFolhaFLGINTEGRADO.AsInteger        := Ord(bBloqueioJudicial);
            // Fim Marchetti - Pendencia 22289

            qryLancFolhaFLGORIGEMLANC.AsString        := 'F';
            qryLancFolhaIDUSUARIOSISTEMA.AsInteger    := Sistema.idUsuario;

            qryLancFolhaVLRJUROS.AsCurrency           := 0;
            qryLancFolhaVLRMULTA.AsCurrency           := 0;
            qryLancFolhaVLRCORRECAOMON.AsCurrency     := 0;
            qryLancFolhaVLRCOMISSAO.AsCurrency        := 0;

            qryLancFolhaIDDOCUMENTO.AsInteger         := IDDocumento;
            qryLancFolhaNODOCUMENTO.AsInteger         := IDDocumento;  // 18/07 - No.Doc. = Id.Doc.

            qryLancFolhaDATALIMITE.AsDateTime         := ComunsImobiliarioDB.DataLimite(dDataVenc,
                                                         dtmImobiliario.qryContratosFolhaIDCIDADES.AsInteger,
                                                         dtmImobiliario.qryContratosFolhaIDPAIS.AsInteger,
                                                         rParamMulta.iDiasTolerancia,
                                                         rParamMulta.iDiasRepasse,
                                                         dtmImobiliario.qryContratosFolhaCODESTADO.AsString,
                                                         rParamMulta.sFlgTipoDiasTolera,
                                                         rParamMulta.sFlgTipoDiasRepasse,
                                                         True, False, False);

            qryLancFolhaIDMODULO.AsInteger            := Sistema.IdModulo;

            if dbcboPortadorFormaDif.Text = '' then
                 qryLancFolhaCODPORTFORMA.AsInteger   := dtmImobiliario.qryContratosFolhaCODPORTFORMA.AsInteger
            else qryLancFolhaCODPORTFORMA.AsInteger   := StrToInt(dbcboPortadorFormaDif.LookupValue);

            if length(trim(Modulo.sCentroCusto)) > 0 then begin
               qryLancFolhaCODCENTROCUSTO.asString    := Modulo.sCentroCusto;
               qryLancFolhaIDEMPRESA.asInteger        := Sistema.idEmpresa;
            end;

            if Modulo.iPrograma > 0 then begin
               qryLancFolhaIDPROGRAMA.asInteger       := Modulo.iPrograma;
            end;

            // Define período da contabilização diária
            if DefineDataCtbDiaria( dCtbIni, dCtbFim ) then begin
               if (dCtbFim = 0) or (dCtbIni = 0) then begin
                 MsgDlg('ERRO NA DATA CTBDIARIA','ERRO',mtError, [mbok],0);
               end;
               qryLancFolhaDTINICTBDIARIA.AsDateTime  := dCtbIni;
               qryLancFolhaDTFIMCTBDIARIA.AsDateTime  := dCtbFim;
            end;

            //DAVID - Pendência 17340
            dVenc := qryLancFolhaDATAVENCIMENTO.AsDateTime;

            qryLancFolha.Post;

            // Marchetti - Pendencia 22289
            if bBloqueioJudicial then
            begin
               cdsBloqueioImob.Data := CtrlBloqueioImob.LookupBloqueioImob(-1,IDDocumento,-1,dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.AsInteger);
               if cdsBloqueioImob.IsEmpty then cdsBloqueioImob.Insert
               else                            cdsBloqueioImob.Edit;

               cdsBloqueioImob.FieldByName('IDDOCUMENTOBLOQ').AsInteger  := IDDocumento;
               cdsBloqueioImob.FieldByName('IDCONTRATOIMOVEL').AsInteger := dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.AsInteger;
               cdsBloqueioImob.Post;
               
               CtrlBloqueioImob.GravaBloqueioImob;
            end;
            // Fim Marchetti - Pendencia 22289
         end;
      end;
   end;
end;


function TfrmExecFolhaAluguelNova.DefineDataCtbDiaria(var dCtbIni, dCtbFim: TDateTime) : boolean;
var iAnoComp, iMesComp, iDiaComp : Word;
    iAnoCont, iMesCont, iDiaCont : Word;
    dIniGer, dFimGer : TDateTime;
begin
  dCtbIni := -1;
  dCtbFim := -1;
  Result  := False;
  // Define as Periodicidade da Ctb diária, apenas se o processo estiver ligado nos
  // parâmetros e no tipo de Receita
  if ModuloImobiliario.AdminImob.bFlgDiario then begin
     try
        LimpaParametros( dtmLookImobiliario.qryLookTipoRecDes );
        dtmLookImobiliario.qryLookTipoRecDes.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := dtmImobiliario.qryContratosFolhaIDTIPOCUSTORECIMO.AsInteger;
        dtmLookImobiliario.qryLookTipoRecDes.Open;
        if dtmLookImobiliario.qryLookTipoRecDes.FieldByName('FLGDIARIO').AsString = 'M' then begin
           // por default, o período equivale ao mes de lançamento contábil completo
           Result   := True;
           DecodeDate(edtDataLancamento.Date,iAnoComp,iMesComp,iDiaComp);
           dCtbIni  := EncodeDate(iAnoComp,iMesComp,1);
           dCtbFim  := DiasUteis.UltDiaMes(iAnoComp,iMesComp);

           // Calcula o período gerencial para comparar com o período do contrato
           iMesCont := (cboMes.ItemIndex + 1);
           iAnoCont := word(trunc(DBspnAno.Value));
           dIniGer  := EncodeDate(iAnoCont,iMesCont,1);
           dFimGer  := DiasUteis.UltDiaMes(iAnoCont,iMesCont);

           // Ajusta as datas inicial e final conforme início e término do contrato
           if (not dtmImobiliario.qryContratosFolhaCONDATAINICIO.isNull) and
              (dtmImobiliario.qryContratosFolhaCONDATAINICIO.AsDateTime > dIniGer) then begin
              DecodeDate(dtmImobiliario.qryContratosFolhaCONDATAINICIO.AsDateTime, iAnoCont, iMesCont, iDiaCont);
              dCtbIni := EncodeDate(iAnoComp,iMesComp,iDiaCont);
           end;
           if (not dtmImobiliario.qryContratosFolhaCONDATAFIM.isNull) and
              (dtmImobiliario.qryContratosFolhaCONDATAFIM.AsDateTime < dFimGer) then begin
              DecodeDate(dtmImobiliario.qryContratosFolhaCONDATAFIM.AsDateTime, iAnoCont, iMesCont, iDiaCont);
              dCtbFim := EncodeDate(iAnoComp,iMesComp,iDiaCont);
           end;
        end;
     except
        Result := False;
     end;
  end;
end;


function TfrmExecFolhaAluguelNova.CalculaAluguel(const sTipoAluguel: string; const iAno, iMes: Integer; var fAluguelOM: currency): currency;
var
   iDiasMes          : integer;
   iMesEvento        : integer;
   iAnoEvento        : integer;
   iMesCompetencia   : integer;
   iAnoCompetencia   : integer;
   iDiasAnterior     : integer;
   iDiasPosterior    : integer;

   dDataInicio       : TDateTime;
   dDataIniCarencia  : TDateTime;
   dDataCarencia     : TDateTime;
   dDataFim          : TDateTime;
   dDataUltReajuste  : TDateTime;
   dDataIniFolha     : TDateTime;
   dDataFimFolha     : TDateTime;

   fVlrAluguelOrig   : currency;
   fVlrAluguelAnt    : currency;
   fVlrOMAluguel     : currency;
   fVlrAluguel       : currency;

   iAnoMesIniCaren   : Integer;
   iAnoMesFimCaren   : Integer;
   iAnoMesFolha      : Integer;
   iDiasCarencia     : Extended;

   bIndeterminado    : boolean;
begin
   Result := 0;

   iMesCompetencia   := iMes;
   iAnoCompetencia   := iAno;
   iDiasMes          := DiasInUteis.ExtraiDia(DiasInUteis.UltDiaMes(iAnoCompetencia, iMesCompetencia));

   dDataIniFolha     := EncodeDate(iAnoCompetencia,iMesCompetencia,1);
   dDataFimFolha     := EncodeDate(iAnoCompetencia,iMesCompetencia, iDiasMes);


//  Vinicius - 10/02/2006 - Passa a considerar a vigencia do imovel no contrato

   dDataInicio       := dtmImobiliario.qryContratoxImovelCIMDTINI.asDateTime;
   dDataFim          := dtmImobiliario.qryContratoxImovelCIMDTFIM.asDateTime;

   dDataCarencia     := dtmImobiliario.qryContratosFolhaCONDATACARENCIA.asDateTime;
   dDataUltReajuste  := dtmImobiliario.qryContratosFolhaCONDATAREAJUSTE.asDateTime;

   bIndeterminado    := dtmImobiliario.qryContratoXImovelCIMDTFIM.IsNull;

   fVlrAluguelOrig   := dtmImobiliario.qryContratoXImovelCIMVLRAJUSTADO.asFloat;
   fVlrAluguelAnt    := dtmImobiliario.qryContratoXImovelCIMVLRALUGUEL.asFloat;

   // inicializa o valor a ser cobrado
   fVlrOMAluguel     := fVlrAluguelOrig;

    case sTipoAluguel[1] of

      'A': // FIXO ---------------------------------------------------------------------------------
      begin

         // Verifica se é preciso fazer Rateio por Data de Inicio
         iMesEvento  := DiasInUteis.ExtraiMes(dDataInicio);
         iAnoEvento  := DiasInUteis.ExtraiAno(dDataInicio);

         if ( (iMesEvento = iMesCompetencia) and (iAnoEvento = iAnoCompetencia) ) then begin

            if DiasInUteis.ExtraiDia(dDataInicio) <> 1 then begin

               iDiasAnterior  := DiasInUteis.ExtraiDia(dDataInicio) - 1;
               iDiasPosterior := iDiasMes - iDiasAnterior;

               fVlrOMAluguel  := (iDiasPosterior / iDiasMes) * fVlrAluguelOrig +
                                 (iDiasAnterior / iDiasMes) * 0;
            end;

         end else begin

            // Verifica se é preciso fazer Rateio por Data de Reajuste
            iMesEvento  := DiasInUteis.ExtraiMes(dDataUltReajuste);
            iAnoEvento  := DiasInUteis.ExtraiAno(dDataUltReajuste);

            if ( (iMesEvento = iMesCompetencia) and (iAnoEvento = iAnoCompetencia) ) then begin

               iDiasAnterior  := DiasInUteis.ExtraiDia(dDataUltReajuste) - 1;
               iDiasPosterior := iDiasMes - iDiasAnterior;

               fVlrOMAluguel  := (iDiasPosterior / iDiasMes) * fVlrAluguelOrig +
                                 (iDiasAnterior / iDiasMes) * fVlrAluguelAnt;

            end else begin

               if not (bIndeterminado) then begin

                  // Verifica se é preciso fazer Rateio por Data de Término
                  iMesEvento  := DiasInUteis.ExtraiMes(dDataFim);
                  iAnoEvento  := DiasInUteis.ExtraiAno(dDataFim);

                  if ( (iMesEvento = iMesCompetencia) and (iAnoEvento = iAnoCompetencia) ) then begin

                     iDiasAnterior  := DiasInUteis.ExtraiDia(dDataFim);
                     iDiasPosterior := 0;

                     fVlrOMAluguel  := (iDiasPosterior / iDiasMes) * fVlrAluguelOrig +
                                       (iDiasAnterior / iDiasMes) * fVlrAluguelOrig;
                  end;
               end;
            end;
         end;

         // Verifica o tempo de carencia para rateio
         dDataIniCarencia := -1;
         with dtmImobiliario do begin
            if not qryContratosFolhaCONDATAINICAREN.IsNull then begin
               dDataIniCarencia := qryContratosFolhaCONDATAINICAREN.AsDateTime;
               dDataCarencia    := qryContratosFolhaCONDATACARENCIA.AsDateTime;
            end else begin
               if not qryContratosFolhaCONDATACARENCIA.IsNull then begin
                  dDataIniCarencia := qryContratosFolhaCONDATAINICIO.AsDateTime;
                  dDataCarencia    := qryContratosFolhaCONDATACARENCIA.AsDateTime;
               end;
            end;

            // carencia já terminou ou nem começou
            if dDataIniCarencia <> -1 then begin
               if (dDataCarencia < dDataIniFolha) or (dDataIniCarencia > dDataFimFolha) then begin
                  dDataIniCarencia := -1;
               end;
            end;

            // Ajusta as datas de carencia conforme data de inicio e termino do contrato
            if dDataIniCarencia <> -1 then begin
               if (not qryContratosFolhaCONDATAFIM.IsNull) and (dDataCarencia > qryContratosFolhaCONDATAFIM.AsDateTime) then begin
                  dDataCarencia := qryContratosFolhaCONDATAFIM.AsDateTime;
               end;
               if (not qryContratosFolhaCONDATAINICIO.IsNull) and (dDataIniCarencia < qryContratosFolhaCONDATAINICIO.AsDateTime) then begin
                  dDataIniCarencia := qryContratosFolhaCONDATAINICIO.AsDateTime;
               end;
            end;
         end;

         // Verifica os dias de desconto por Carencia
         iDiasCarencia := 0;
         if dDataIniCarencia <> -1 then begin
            if (dDataIniCarencia <= dDataIniFolha) and (dDataCarencia >= dDataFimFolha) then begin
               iDiasCarencia := iDiasMes;
            end else if (dDataIniCarencia > dDataIniFolha) and (dDataCarencia >= dDataFimFolha) then begin
               iDiasCarencia := dDataFimFolha - dDataIniCarencia;
            end else if (dDataCarencia < dDataFimFolha) and (dDataIniCarencia <= dDataIniFolha) then begin
               iDiasCarencia := dDataCarencia - dDataIniFolha;
            end else begin
               iDiasCarencia := dDataCarencia - dDataIniCarencia;
            end;
         end;

         // Desconta os dias de carencia
         if (iDiasCarencia > 0) then begin
            iDiasCarencia := iDiasCarencia + 1;
            fVlrOMAluguel := fVlrOMAluguel - (iDiasCarencia * (fVlrAluguelOrig / iDiasMes) );
         end;

         // converte o valor do aluguel para moeda corrente com cotação na data do lançamento
         fVlrAluguel := FuncoesImob.ConverteMoeda(dtmImobiliario.qryContratosFolhaMOECODIGO.AsInteger,
                        fVlrOMAluguel, edtDataLancamento.Date, False);

         // se não houver cotação...
         if fVlrAluguel = -1 then begin
            //--------------------------------------------------------------------------------------
            //    Gerar Mensagem ! (linha do memResultado)
            //--------------------------------------------------------------------------------------
         end;

      end;


      'C': // COMPLEMENTO --------------------------------------------------------------------------
      begin

      end;

   end;

   Result := fVlrAluguel;
   if Result < 0 then Result := 0;
end;



// =================================================================================================
//    Fim do Cálculo e Lançamento dos Aluguéis
// =================================================================================================





// =================================================================================================
//
// =================================================================================================



function TfrmExecFolhaAluguelNova.VerificaPreenchimento: boolean;
var
  iDia, iMes, iAno, iDifMeses, iAnoComp, iMesComp: word;
  dDia1, dDia2: TDateTime;

  dDtCompIni, dDtCompFim : TDateTime; // Daniel Simões - P: 21164
  iAnoFim, iMesFim       : word;      // Daniel Simões - P: 21164
  dDtReajuste            : TDateTime; // Daniel Simões - P: 21164
  iDiaR, iMesR, iAnoR    : word;      // Daniel Simões - P: 21164
begin
   Result := False;

   try
      iAnoComp := Word(trunc(DBspnAno.Value));
      iMesComp := cboMes.ItemIndex + 1;

// Daniel Simões - P: 21164 - Início -------------------------------------------
      // Carrega pra dentro das variáveis o conteúdo da competência final...
      iAnoFim := word(trunc(DBspnAnoFim.Value));
      iMesFim := cboMesFim.ItemIndex + 1;

      // Testa apenas se a competência final foi preenchida...
      if (iAnoFim>0) and (iMesFim>0) then begin
        dDtCompIni := EncodeDate(Word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1);
        dDtCompFim := EncodeDate(Word(trunc(DBspnAnoFim.Value)), (cboMesFim.ItemIndex + 1), 1);

        // Abre a query que vai fazer a verificação do contrato selecionado...
        with qryVerificaContrato do begin
          LimpaParametros(qryVerificaContrato);
          ParamByName('PIDCONTRATOIMOVEL').AsInteger  := iContratoSelecao;
          Open;

          DecodeDate(FieldByName('CONPROXREAJUSTE').AsDateTime,iAnoR,iMesR,iDiaR);
          dDtReajuste := EncodeDate(iAnoR,iMesR,1);

          if ( FieldByName('CONPERALUGUEL').AsInteger > 1 ) then
            raise EValidacao.CreateVal('Contrato só pode ser mensal.', btnBuscaContrato);

          // Verifica se a data da competência final é anterior a data da competência inicial...
          if (dDtCompIni > dDtCompFim) then
            raise EValidacao.CreateVal('A data da competência final não pode ser anterior a data da competência inicial.', cboMesFim);

          if (dDtCompIni < FieldByName('CONDATACARENCIA').AsDateTime) then
            raise EValidacao.CreateVal('Contrato não está vigente na competência inicial informada.', cboMes);

          // Testa apenas se o contrato tiver data de encerramento OU reajuste...
          if ( (FieldByName('FLGINDETERMINADO').AsString='N') or not (FieldByName('CONINDICEREAJUSTE').IsNull) ) then begin

            // Verifica se a data de encerramento do contrato encontra-se no período
            // selecionado entre a competência inicial e final...
            if ((FieldByName('CIMDTFIM').AsDateTime >= dDtCompIni) and
                (FieldByName('CIMDTFIM').AsDateTime <= dDtCompFim)) then
            //Cássio - SOL Nº 123660 KINTANA Nº 620038 - Início
            //  raise EValidacao.CreateVal('Existe imóvel com data de encerramento prevista no período de competência selecionado.', cboMesFim);
            begin
              if MsgDlg('Existe(m) imóvel(is) com a Data de Encerramento prevista ' +
                        #10#13 +'dentro do período de competência selecionado.' +
                        #10#13 + 'Deseja continuar?', 'Aviso', mtWarning, [mbYes, mbNo], 0) <> mrYes then
              begin
                Result := False;
                Exit;
              end
            end;
            //Cássio - SOL Nº 123660 KINTANA Nº 620038 - Fim

            // Verifica se existe data para reajuste do contrato no período selecionado
            // entre a competência inicial e final...
            if ((dDtReajuste >= dDtCompIni) and (dDtReajuste <= dDtCompFim)) then
              raise EValidacao.CreateVal('Existe reajuste previsto para o contrato no período de competência selecionado.', cboMesFim);
          end;
        end;
      end;
// Daniel Simões - P: 21164 - Fim ----------------------------------------------


      if (MolResponsavel1.iResponsavel = -999) then
         raise EValidacao.CreateVal('É necessário que o responsável seja válido!', MolResponsavel1.btnBuscaResponsavel);

      if cboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o Mês de competência dos Aluguéis!', cboMes);

      if DBspnAno.Value <= 0 then
         raise EValidacao.CreateVal('É necessário indicar o Ano de competência dos Aluguéis!', DBspnAno);

      if length(trim(edtDataLancamento.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Lançamento!', edtDataLancamento);

      if length(trim(edtDataEmissao.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Emissão!', edtDataEmissao);

      // 20/06 travado data de lançamento deve estar dentro da competência
      // 19/08 travado data de lançamento apenas para frente da competência
      DecodeDate(edtDataLancamento.Date, iAno, iMes, iDia);
      if not ModuloImobiliario.AdminImob.bFlgLancForaComp then begin
         dDia1 := DiasInUteis.UltDiaMes (iAnoComp, iMesComp);
         if edtDataLancamento.Date > dDia1 then
            raise EValidacao.CreateVal('A data de lançamento não pode ser após a sua competência!', edtDataLancamento);
      end;

      if (iAno < DBspnAno.Value) or (iMes < cboMes.ItemIndex + 1) then
         if MsgDlg ('A data de lançamento esta digitada antes do vencimento. Continua?', 'AdminImob', mtConfirmation, [mbyes,mbno], 0) = MrNo then
           raise EValidacao.CreateVal('Altere data de Lançamento.', edtDataLancamento);


      ParametrosSistema;

      if dtmImobiliario.qryParamImobFLGMESPOSTERIOR.AsInteger = 1 then begin
         if ( DiasInUteis.UltDiaMes(trunc(DBspnAno.Value), (cboMes.ItemIndex + 1)) ) > ( DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(Date), + DiasInUteis.ExtraiMes(Date)) ) then
            raise EValidacao.CreateVal('O Mês de competência não pode ser posterior ao mês vigente!', cboMes);
      end;

      { 20/06
        se possui contabilização diária
           a competencia do lançamento somente pode ser igual a competencia
           atual ou no máximo um mês apos
      }
      if ModuloImobiliario.AdminImob.bFlgDiario then begin
         dDia1 := EncodeDate(ModuloImobiliario.AdminImob.iAnoCompetencia,
                             ModuloImobiliario.AdminImob.iMesCompetencia, 1);
         dDia2 := EncodeDate(iAnoComp, iMesComp, 1);
         if dDia2 < dDia1 then begin  // tentativa de lançar em um mes anterior
            raise EValidacao.CreateVal('A competência selecionada já foi encerrada!', edtDataLancamento);
         end else begin
            iDifMeses := DiasInUteis.IntervaloMeses(dDia1, dDia2);
            if iDifMeses <= ModuloImobiliario.AdminImob.iMesBloqLancto then
               MsgDlg('A competência selecionada ainda não foi inicializada, execute o fechamento mensal!', 'Informação', mtInformation, [mbok], 0)
            else if iDifMeses > ModuloImobiliario.AdminImob.iMesBloqLancto then
               raise EValidacao.CreateVal('A competência selecionada ainda não foi inicializada, execute o encerramento mensal!', edtDataLancamento);
         end;
      end;
      // Helen - SOL: 172902 KTN: 1577381 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataLancamento.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataLancamento);
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataEmissao.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataEmissao);
      // Helen - SOL: 172902 KTN: 1577381 - Fim
   except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmExecFolhaAluguelNova.DesabilitaBotoes;
begin
   Screen.Cursor                 := crHourGlass;

   bHabilitaContinuaLanc         := btnContinuaLanc.Enabled;
   bHabilitaConfirmaLanc         := btnConfirmaLanc.Enabled;

   btnContinuaSelecao.Enabled    := False;
   btnContinuaEncerra.Enabled    := False;
   btnContinuaReajuste.Enabled   := False;
   btnContinuaLanc.Enabled       := False;
   btnConfirmaLanc.Enabled       := False;

   btnCancelaEncerra.Enabled     := False;
   btnCancelaReajuste.Enabled    := False;
   btnCancelaLanc.Enabled        := False;

   bbtnSair.Enabled              := False;

   ntbPrincipal.Enabled          := False;
   ntbInstrucao.Enabled          := False;
end;



procedure TfrmExecFolhaAluguelNova.HabilitaBotoes;
begin
   ntbPrincipal.Enabled          := True;
   ntbInstrucao.Enabled          := True;

   btnContinuaSelecao.Enabled    := True;
   btnContinuaEncerra.Enabled    := True;
   btnContinuaReajuste.Enabled   := True;
   btnContinuaLanc.Enabled       := bHabilitaContinuaLanc;
   btnConfirmaLanc.Enabled       := bHabilitaConfirmaLanc;

   btnCancelaEncerra.Enabled     := True;
   btnCancelaReajuste.Enabled    := True;
   btnCancelaLanc.Enabled        := True;

   bbtnSair.Enabled              := True;

   Screen.Cursor                 := crDefault;
end;



procedure TfrmExecFolhaAluguelNova.MostraEspera(const sMensagem: string);
begin
   frmEspera.Config('Aguarde', sMensagem, False);
   frmEspera.Show;
   Application.ProcessMessages;
end;



procedure TfrmExecFolhaAluguelNova.EscondeEspera;
begin
   frmEspera.Hide;
   frmEspera.Config('', '', False);
end;



procedure TfrmExecFolhaAluguelNova.MudaPrincipal(const iPagPrincipal: integer);
begin
   case iPagPrincipal of
      0: lblTitulo.Caption := 'Folha de Aluguéis [Seleção]';
      1: lblTitulo.Caption := 'Folha de Aluguéis [Encerramento/Prorrogação]';
      2: lblTitulo.Caption := 'Folha de Aluguéis [ERRO no Encerramento/Prorrogação]';
      3: lblTitulo.Caption := 'Folha de Aluguéis [Reajuste]';
      4: lblTitulo.Caption := 'Folha de Aluguéis [ERRO no Reajuste]';
      5: lblTitulo.Caption := 'Folha de Aluguéis [Lançamentos]';
      7: lblTitulo.Caption := 'Folha de Aluguéis [Confissão de dívidas]';
   else
         lblTitulo.Caption := '';
   end;

   ntbPrincipal.PageIndex  := iPagPrincipal;
end;


procedure TfrmExecFolhaAluguelNova.MudaInstrucao(const iPagInstrucao: integer; sProgresso: string);
begin
   lblProgress.Caption     := '';
   ntbInstrucao.PageIndex  := iPagInstrucao;
end;



// =============================================================================
//    Controle das Páginas
// =============================================================================

procedure TfrmExecFolhaAluguelNova.btnContinuaSelecaoClick(Sender: TObject);
begin
  inherited;

  try

    if VerificaPreenchimento then begin


      if VerificaContratosPendentes then begin

        // Marchetti - Pendencia 23743
        if (sTipoContrato='D') or ((not chkAluguel.Checked) and (chkConfissao.Checked)) then begin
          MudaPrincipal(7);
          MudaInstrucao(7, 'Calculando parcelas de confissão de dívida.');
          GeraFolhaConfissao;
        end else begin
        // Fim Marchetti - Pendencia 23743

          DesabilitaBotoes;
          Temporiza(1);

          FiltraContratosRescisao;

          if dtmImobiliario.qryContratosRescisao.IsEmpty then begin
            // Informa que não há necessidade de rescisão/prorrogação
            Temporiza(1);
            MostraEspera('Não há contratos a encerrar/prorrogar.');
            Temporiza(3);
            EscondeEspera;

            FiltraContratosReajuste;

            if ReajustaTodosContratos then begin
              MudaPrincipal(3);
              MudaInstrucao(3, ''); // confirma reajustes
            end else begin
              Temporiza(2);
              MudaPrincipal(4);
              MudaInstrucao(4, ''); // msg erro reajuste
            end;
          end else begin
            Temporiza(3);
            MudaPrincipal(1);     // contratos a rescindir
            MudaInstrucao(1, ''); // confirma rescisao
          end;

          EscondeEspera;
          Repaint;
          Application.ProcessMessages;
        end;
      end;
    end;
  finally
     HabilitaBotoes;
  end;
end;

// =================================================================================================

procedure TfrmExecFolhaAluguelNova.btnContinuaEncerraClick(Sender: TObject);
begin
   inherited;
   DesabilitaBotoes;
   Temporiza(3);
   try
      if RescindeContratos then begin
         FiltraContratosReajuste;

         if ReajustaTodosContratos then begin
            MudaPrincipal(3);
            MudaInstrucao(3, ''); // confirma reajustes
         end else begin
            Temporiza(2);
            MudaPrincipal(4);
            MudaInstrucao(4, ''); // msg erro reajuste
         end;
      end else begin
         MudaPrincipal(2);
         MudaInstrucao(2, ''); // msg erro rescisao
      end;
   finally
      HabilitaBotoes;
   end;
end;



procedure TfrmExecFolhaAluguelNova.btnContinuaReajusteClick(Sender: TObject);
begin
   inherited;

   // Continua Reajustes
   // 1) Aplica (grava) reajustes
   // 2) Executa lançamentos
   //    Reajuste -> Lançamentos
   //    pág. 3   -> pág 5

   DesabilitaBotoes;

   MudaInstrucao(6, 'Processando Aluguéis...'); // progress bar
   Temporiza(3);

   try
      try
         // 1) ApplyUpdates na query de contratos (para gravar reajustes)
         // 2) Grava a tabela de histórico de reajustes
         if FinalizaReajustes then begin

            // Apaga TODOS os lançamentos de previsão para o mês de competência
            DesfazPrevisaoCompetencia;

            // fecha e abre as queries onde se fará a inclusão dos registros
            qryLancFolha.Close;
            qryLancFolha.Open;

            //DAVID - Pendência 17340
            qryAlteradores.Close;
            qryAlteradores.Open;

            pgcLancamentos.ActivePage := tbsLancamentos;

            MudaPrincipal(5);

            // Calcula os aluguéis e executa os lançamentos
            GeraFolha;

            // define se os botões do Lançamento ficarão habilitados
            //DAVID - Pendência 17340
            if qryAlteradores.IsEmpty then begin
               bHabilitaContinuaLanc   := False;
               bHabilitaConfirmaLanc   := True;
            end else begin
               bHabilitaContinuaLanc   := True;
               bHabilitaConfirmaLanc   := False;
            end;

            // se houver alguma ocorrência
            if length(trim(memErro.Text)) > 0 then begin
               pgcLancamentos.ActivePage := tbsErro;
               Repaint;
            end;

            MudaInstrucao(5, ''); // confirma aluguéis
         end else begin
            MudaPrincipal(4);
            MudaInstrucao(4, ''); // msg erro reajuste
         end;
      except
         MudaPrincipal(4);
         MudaInstrucao(4, ''); // msg erro reajuste
      end;
   finally
      HabilitaBotoes;
   end;
end;


//Baruc
procedure TfrmExecFolhaAluguelNova.btnConfirmaLancClick(Sender: TObject);
begin
   inherited;

   // Continua Lançamento
   // 1) Aplica (grava) lançamentos
   //    Lançamentos -> Seleção
   //    pág. 5      -> pág 0

   DesabilitaBotoes;

   MudaInstrucao(6, 'Processando Aluguéis...');

   Temporiza(3);

   //DAVID - Correção do problema no tratamento de erros
   try

     StartTransacao;
     if ( (qryLancFolha.Active) and (qryLancFolha.UpdatesPending) ) then qryLancFolha.ApplyUpdates;

     qryLancFolha.First;
     while not qryLancFolha.Eof do
       begin
         //BARUC 14/11/2012 - SOL : 180032 KTN : 1674608 - INICIO
         CtrlLancamentosImovel.PrepareRatLanImovel(qryLancFolha.FieldByName('IDLANCIMOVEL').AsFloat,
                                                   qryLancFolha.FieldByName('IDIMOVEL').AsInteger,
                                                   qryLancFolha.FieldByName('DATALANCAMENTO').AsDateTime );
         //BARUC 14/11/2012 - SOL : 180032 KTN : 1674608 - FIM
         qryLancFolha.Next;

       end;


     CommitTransacao;

     MsgDlg('Término do processamento da Folha de Aluguéis.', 'Informação', mtInformation, [mbOk], 0);
     Repaint;


     MudaPrincipal(0);
     MudaInstrucao(0, '');

     qryLancFolha.Close;

     HabilitaBotoes;

   except
     On E : Exception do
     begin
       RollBackTransacao;
       HabilitaBotoes;
       btnCancelaLancClick( Self );
     end;
   end;
end;

// -------------------------------------------------------------------------------------------------

procedure TfrmExecFolhaAluguelNova.btnCancelaEncerraClick(Sender: TObject);
begin
   inherited;

   DesabilitaBotoes;

   MostraEspera('Desfazendo seleção...');

   MudaPrincipal(0);
   MudaInstrucao(0, '');

   Temporiza(1);

   EscondeEspera;
   Repaint;
   Application.ProcessMessages;

   HabilitaBotoes;
end;

// -------------------------------------------------------------------------------------------------

procedure TfrmExecFolhaAluguelNova.btnCancelaReajusteClick(Sender: TObject);
begin
   inherited;

   DesabilitaBotoes;

   MostraEspera('Desfazendo Reajustes...');

   if ( (dtmImobiliario.qryContratosReajuste.Active) and (dtmImobiliario.qryContratosReajuste.UpdatesPending) ) then begin
      dtmImobiliario.qryContratosReajuste.CancelUpdates;
   end;

   Temporiza(1);

   EscondeEspera;

   MudaPrincipal(0);
   MudaInstrucao(0, '');

   HabilitaBotoes;
end;

// -------------------------------------------------------------------------------------------------

procedure TfrmExecFolhaAluguelNova.btnCancelaLancClick(Sender: TObject);
begin
   inherited;

   DesabilitaBotoes;

   if ( (qryLancFolha.Active) and (qryLancFolha.UpdatesPending) ) then qryLancFolha.CancelUpdates;

   //DAVID - Pendência 17340
   if ( (qryAlteradores.Active) and (qryAlteradores.UpdatesPending) ) then qryAlteradores.CancelUpdates;

   qryLancFolha.Close;
   qryAlteradores.Close;
   memErro.Clear;

   MudaPrincipal(0);
   MudaInstrucao(0, '');

   HabilitaBotoes;
end;

// -------------------------------------------------------------------------------------------------
//    Fim do Controle das Páginas
// -------------------------------------------------------------------------------------------------



procedure TfrmExecFolhaAluguelNova.FormShow(Sender: TObject);
begin
   inherited;

   AtribuiMolResponsavel(MolResponsavel1.iResponsavel,MolResponsavel1.edtResponsavel);

   iAdminImovel      := -1;
   iContratoSelecao  := -1;
   sTipoContrato     := 'L';
   iPortadorForma    := -1;
   iIndiceReajuste   := -1;
   iTipoCustoRecImo  := -1;

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex        := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasInUteis.ExtraiAno(Date);

// Daniel Simões - P: 21164 - --------------------------------------------------
   cboMesFim.ItemIndex     := -1;
   DBspnAnoFim.Value       := 0;
// Daniel Simões - P: 21164 - --------------------------------------------------

   edtDataLancamento.Date  := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1);
   edtDataEmissao.Date     := Date;

   // acerta os notebooks
   MudaPrincipal(0);
   MudaInstrucao(0, '');
   Repaint;

   DesabilitaBotoes;

   with dtmLookImobiliario.qryLookPortadorForma do begin
      LimpaParametros(dtmLookImobiliario.qryLookPortadorForma);
      ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
      Open;
   end;

   with dtmLookImobiliario.qryLookTipoRecDes do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      ParamByName('PRECCUSTO').AsString  := 'R';
      Open;
   end;

   // Cria Ctrl para Reajuste
   ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
   ComunsImobiliarioDB.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                  Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                  ComunsImobiliario.MensErroMT);




   qryLookTipoRecContr.Open;
   dtmLookImobiliario.qryLookMoeda.Open;
   dtmLancImovel.qryLancImovel.Close;
   dtmLancImovel.qryLancImovel.Unprepare;

   HabilitaBotoes;
end;



procedure TfrmExecFolhaAluguelNova.btnBuscaAdminImovelClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_AdminImovel.Executar;
   // dtmMS.MS_AdminImovel.CamposChave
   //    [0] A.IDADMINIMOVEL
   //    [1] P.NOME
   //    [2] P.RAZAOSOCIAL

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_AdminImovel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iAdminImovel         := StrToInt(dtmMS.MS_AdminImovel.ValoresChave[0]);
      edtAdminImovel.Text  := dtmMS.MS_AdminImovel.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaAdminImovel.SetFocus;
end;



procedure TfrmExecFolhaAluguelNova.btnBuscaContratoClick(Sender: TObject);
var
   sFiltro : String;
begin
   inherited;
   sFiltro       := dtmMS.MS_Contrato.Filtro.Text;
   dtmMS.MS_Contrato.Filtro.Text :=  'C.IDRESPONSAVEL = PR.IDPESSOA(+)'   + #13 +
                                     'C.IDLOCATARIO = PL.IDPESSOA(+)'     + #13 +
                                     'C.IDRESPONSAVEL = U.IDUSUARIO(+)'   + #13 +
                                     'C.IDTIPOCONTRIMOB = TC.IDTIPOCONTRIMOB(+)' + #13 +
                                     'C.FLGTIPOCONTRATO IN (''L'',''D'')' + #13;


   dtmMS.MS_Contrato.Executar;
   // dtmMS.MS_Contrato.CamposChave
   //    [0] C.IDCONTRATOIMOVEL
   //    [1] C.CONNUMERO
   //    [2] C.CONNOME

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Contrato.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iContratoSelecao     := StrToInt(dtmMS.MS_Contrato.ValoresChave[0]);
      edtNumContrato.Text  := dtmMS.MS_Contrato.ValoresChave[1];
      edtNomeContrato.Text := dtmMS.MS_Contrato.ValoresChave[2];
      Screen.Cursor        := crDefault;
// Daniel Simões - P: 21164 - --------------------------------------------------
      cboMesFim.Enabled    := True;
      cboMesFim.Color      := clWindow;
      DBspnAnoFim.Enabled  := True;
      DBspnAnoFim.Color    := clWindow;
// Daniel Simões - P: 21164 - --------------------------------------------------

      sTipoContrato        := dtmMS.MS_Contrato.ValoresChave[3];
   end;

   dtmMS.MS_Contrato.Filtro.Text := sFiltro;

   btnBuscaContrato.SetFocus;
end;



procedure TfrmExecFolhaAluguelNova.btnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   iContratoSelecao  := -1;
   edtNumContrato.Clear;
   edtNomeContrato.Clear;
// Daniel Simões - P: 21164 - --------------------------------------------------
   cboMesFim.Enabled    := False;
   cboMesFim.ItemIndex  := -1;
   cboMesFim.Color      := clBtnFace;
   DBspnAnoFim.Enabled  := False;
   DBspnAnoFim.Value    := 0;
   DBspnAnoFim.Color    := clBtnFace;
// Daniel Simões - P: 21164 - --------------------------------------------------
end;


procedure TfrmExecFolhaAluguelNova.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;
   iAdminImovel  := -1;
   edtAdminImovel.Clear;
end;



procedure TfrmExecFolhaAluguelNova.FormClose(Sender: TObject; var Action: TCloseAction);
var
   i : integer;
begin
   for i := 0 to (ComponentCount - 1) do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;
   end;

   dtmLancImovel.qryLancImovel.Close;
   dtmLancImovel.qryLancImovel.Unprepare;

   LimpaParametros(dtmImobiliario.qryParamImob);

   ComunsImobiliarioDB.Free;
   FreeAndNil( CtrlHistMovImob );
   FreeAndNil( CtrlContratoImovel );
   FreeAndNil( CtrlLancamentosImovel );
   FreeAndNil( CtrlTipoCustoRecImov );
   FreeAndNil( CtrlBloqueioImob );
   FreeAndNil( CtrlParamMulta );
   FreeAndNil(CtrlContab);// Helen - SOL: 172902 KTN: 1577381
   inherited;
end;



procedure TfrmExecFolhaAluguelNova.DBcboPortadorFormaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   iPortadorForma := -1;
   if DBcboPortadorForma.LookupValue <> '' then iPortadorForma := StrToInt(DBcboPortadorForma.LookupValue);
end;

procedure TfrmExecFolhaAluguelNova.DBcboIndiceReajusteCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   iIndiceReajuste := -1;
   if DBcboIndiceReajuste.LookupValue <> '' then iIndiceReajuste := StrToInt(DBcboIndiceReajuste.LookupValue);
end;

procedure TfrmExecFolhaAluguelNova.DBcboTipoRecCustoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   iTipoCustoRecImo := -1;
   if DBcboTipoRecCusto.LookupValue <> '' then iTipoCustoRecImo := StrToInt(DBcboTipoRecCusto.LookupValue);
end;



procedure TfrmExecFolhaAluguelNova.DBgrdRescisaoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecFolhaAluguelNova.DBgrdReajusteCalcCellColors(Sender: TObject; Field: TField;
State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecFolhaAluguelNova.DBgrdLancamentosCalcCellColors(Sender: TObject; Field: TField;
State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecFolhaAluguelNova.DBgrdRescisaoTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecFolhaAluguelNova.DBgrdReajusteTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecFolhaAluguelNova.DBgrdLancamentosTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecFolhaAluguelNova.btnConsultaIndiceClick(Sender: TObject);
begin
   inherited;
   Application.CreateForm(TfrmConsVariacaoIndice, frmConsVariacaoIndice);
   frmConsVariacaoIndice.Show;
end;



procedure TfrmExecFolhaAluguelNova.cboMesExit(Sender: TObject);
begin
   inherited;
   // preenche a data de lançamento e o ano de referência/competência
   edtDataLancamento.Date := EncodeDate(StrToInt(IntToStr(trunc(DBspnAno.Value))), (cboMes.ItemIndex + 1), 1);
end;


procedure TfrmExecFolhaAluguelNova.DBspnAnoExit(Sender: TObject);
begin
   inherited;
   // preenche a data de lançamento e o ano de referência/competência
   edtDataLancamento.Date := EncodeDate(StrToInt(IntToStr(trunc(DBspnAno.Value))), (cboMes.ItemIndex + 1), 1);
end;


procedure TfrmExecFolhaAluguelNova.btnCancelaAlteraClick(Sender: TObject);
begin
   inherited;

   DesabilitaBotoes;

   if ( (qryLancFolha.Active) and (qryLancFolha.UpdatesPending) ) then qryLancFolha.CancelUpdates;

   //DAVID - Pendência 17340
   if ( (qryAlteradores.Active) and (qryAlteradores.UpdatesPending) ) then qryAlteradores.CancelUpdates;

   qryLancFolha.Close;

   //DAVID - Pendência 17340
   qryAlteradores.Close;

   memErro.Clear;

   MudaPrincipal(0);
   MudaInstrucao(0, '');

   HabilitaBotoes;
end;



procedure TfrmExecFolhaAluguelNova.btnConfirmaAlteraClick(Sender: TObject);
begin
   inherited;

   // Continua Lançamento
   // 1) Aplica (grava) lançamentos
   //    Lançamentos -> Seleção
   //    pág. 5      -> pág 0

   DesabilitaBotoes;

   MudaInstrucao(6, 'Processando Aluguéis...');

   Temporiza(3);

   //DAVID - Correção do problema no tratamento de erros
   try
     StartTransacao;

     if ( (qryLancFolha.Active) and (qryLancFolha.UpdatesPending) ) then qryLancFolha.ApplyUpdates;

     //DAVID - Pendência 17340
     if ( (qryAlteradores.Active) and (qryAlteradores.UpdatesPending) ) then qryAlteradores.ApplyUpdates;

     CommitTransacao;

     MsgDlg('Término do processamento da Folha de Aluguéis.', 'Informação', mtInformation, [mbOk], 0);
     Repaint;

     qryLancFolha.Close;

     // Marchetti - Pendencia 23743
     if not chkConfissao.checked then
     begin
        MudaPrincipal(0);
        MudaInstrucao(0, '');
     end
     else
     begin
        MudaPrincipal(7);
        MudaInstrucao(7, 'Calculando parcelas de confissão de dívida.');
        GeraFolhaConfissao;
     end;
     // Fim Marchetti - Pendencia 23743

     HabilitaBotoes;
   except
     On E : Exception do
     begin
       RollBackTransacao;
       HabilitaBotoes;
       btnCancelaAlteraClick( Self );
     end;
   end;
end;



procedure TfrmExecFolhaAluguelNova.btnContinuaLancClick(Sender: TObject);
begin
   inherited;
   DesabilitaBotoes;
   Temporiza(3);
   try
      MudaPrincipal(6);
   finally
      HabilitaBotoes;
   end;
end;



procedure TfrmExecFolhaAluguelNova.LancaPrevisao(const IDDocumento: integer; const iMeses: integer);
var
   dDataVenc      : TDateTime;
   iLancImovel    : integer;
   iMes, iAno     : integer;
   dCtbIni        : TDateTime;
   dCtbFim        : TDateTime;
   sContrato      : String;
   bBloqueioJudicial : Boolean;
begin
   // Contrato Extenso
   if dtmImobiliario.qryContratosFolhaCONNUMERO.isNULL then begin
      sContrato   := dtmImobiliario.qryContratosFolhaCONNOME.AsString;
   end else begin
      sContrato   := dtmImobiliario.qryContratosFolhaCONNUMERO.AsString + ' - ' +
                     dtmImobiliario.qryContratosFolhaCONNOME.AsString;
   end;

   // verifica se o aluguel não está zerado
   if dtmImobiliario.qryContratoXImovelCIMVLRAJUSTADO.AsFloat > 0 then begin

      iMes := cboMes.ItemIndex + 1 + iMeses;
      iAno := word(trunc(DBspnAno.Value));
      while iMes > 12 do begin
         iMes := iMes - 12;
         iAno := iAno + 1;
      end;

      // define a data de vencimento do aluguel (seja o principal ou o complemento)
      dDataVenc := FuncoesImob.DataVencAluguel(dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.asInteger,
                   iAno, iMes, 'A' {ALUGUEL FIXO SEM COMPLEMENTO} , False);

      if dDataVenc <= 0 then begin
         memErro.Lines.Add('- Data de vencimento inválida --> ' + sContrato + ', ' +
                           dtmImobiliario.qryContratoXImovelNOME_MESTRE.AsString + ' - ' +
                           dtmImobiliario.qryContratoXImovelNOME_IMOVEL.AsString + ';' + #13);
         exit;
      end;

      // Busca Parametros de Inadimplencia
      CtrlParamMulta.LimpaQueryMultaJuros(rParamMulta);
      CtrlParamMulta.BuscaParamMulta(rParamMulta, dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.AsInteger,
                                     dtmImobiliario.qryContratosFolhaIDTIPOCUSTORECIMO.AsInteger, dDataVenc );


      // Gravação na query de Previsão -----------------------------------------------------------------------------

      bBloqueioJudicial := CtrlTipoCustoRecImov.ReceitaPossuiBloqueioJudicial(dtmImobiliario.qryContratosFolhaIDTIPOCUSTORECIMO.AsInteger);

      with qryInsertPrevisao do begin

         ParamByName('PIDLANCIMOVEL').AsInteger      := LeUltRegistro(nil, 'LANCAMENTOSIMOVEL');
         ParamByName('PIDPESSOA').AsInteger          := Sistema.idEmpresa;
         ParamByName('PIDIMOVEL').AsInteger          := dtmImobiliario.qryContratoXImovelIDIMOVEL.AsInteger;
         ParamByName('PIDTIPOCUSTORECIMO').AsInteger := dtmImobiliario.qryContratosFolhaIDTIPOCUSTORECIMO.AsInteger;
         ParamByName('PIDCONTRATOIMOVEL').AsInteger  := dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.AsInteger;

         ParamByName('PDATALANCAMENTO').AsDateTime   := edtDataLancamento.Date;
         ParamByName('PDATAVENCIMENTO').AsDateTime   := dDataVenc;

         { TODO -oAlex -cPrevisão : No Lançamento de Previsão competência e referência vão mudar? }
         ParamByName('PMESREFERENCIA').AsInteger     := DiasInUteis.ExtraiMes(dDataVenc);
         ParamByName('PANOREFERENCIA').AsInteger     := DiasInUteis.ExtraiAno(dDataVenc);
         ParamByName('PMESCOMPETENCIA').AsInteger    := iMes;
         ParamByName('PANOCOMPETENCIA').AsInteger    := iAno;
         ParamByName('PRECPAG').AsString             := 'R';
         ParamByName('PVLRLANCOMRECEB').AsCurrency   := dtmImobiliario.qryContratoXImovelCIMVLRAJUSTADO.asFloat;
         ParamByName('PVLRLANCRECEB').AsCurrency     := dtmImobiliario.qryContratoXImovelCIMVLRAJUSTADO.asFloat;
         ParamByName('PMOEDARECEB').AsInteger        := dtmImobiliario.qryContratosFolhaMOECODIGO.AsInteger;
         ParamByName('PIDFORCLI').AsInteger          := dtmImobiliario.qryContratosFolhaIDLOCATARIO.AsInteger;
         ParamByName('PFLGAGRUPAR').AsString         := 'N';
         ParamByName('PFLGAGRUPADO').AsInteger       := 0;
         ParamByName('PFLGTIPOLANCAMENTO').AsString  := 'A';  // lançamento fixo - sem aluguel variável

         // Marchetti - Pendencia 22289
         ParamByName('PFLGINTEGRADO').AsInteger      := Ord(bBloqueioJudicial);
         // Fim Marchetti - Pendencia 22289

         ParamByName('PFLGORIGEMLANC').AsString      := 'V';
         ParamByName('PIDUSUARIOSISTEMA').AsInteger  := Sistema.idUsuario;

         ParamByName('PVLRJUROS').AsFloat            := 0;
         ParamByName('PVLRMULTA').AsFloat            := 0;
         ParamByName('PVLRCORRECAOMON').AsFloat      := 0;
         ParamByName('PVLRCOMISSAO').AsFloat         := 0;

         ParamByName('PIDDOCUMENTO').AsInteger       := IDDocumento;
         ParamByName('PNODOCUMENTO').AsInteger       := IDDocumento;
         ParamByName('PIDMODULO').asInteger          := Sistema.IdModulo;


         ParamByName('PDATALIMITE').AsDateTime       := ComunsImobiliarioDB.DataLimite(
                                                        DiasInUteis.SomaMeses(dDataVenc, iMeses),
                                                        dtmImobiliario.qryContratosFolhaIDCIDADES.AsInteger,
                                                        dtmImobiliario.qryContratosFolhaIDPAIS.AsInteger,
                                                        rParamMulta.iDiasTolerancia,
                                                        rParamMulta.iDiasRepasse,
                                                        dtmImobiliario.qryContratosFolhaCODESTADO.AsString,
                                                        rParamMulta.sFlgTipoDiasTolera,
                                                        rParamMulta.sFlgTipoDiasRepasse,
                                                        True, False, False);


         if length(trim(Modulo.sCentroCusto)) > 0 then begin
            ParamByName('PCODCENTROCUSTO').asString  := Modulo.sCentroCusto;
            ParamByName('PIDEMPRESA').asInteger      := Sistema.idEmpresa;
         end;

         if Modulo.iPrograma > 0 then begin
            ParamByName('PIDPROGRAMA').asInteger     := Modulo.iPrograma;
         end;

         // Define período da contabilização diária
         if DefineDataCtbDiaria( dCtbIni, dCtbFim ) then begin
            if (dCtbFim = 0) or (dCtbIni = 0) then begin
              MsgDlg('ERRO NA DATA CTBDIARIA','ERRO',mtError, [mbok],0);
            end;
            ParamByName('PDTINICTBDIARIA').AsDateTime := dCtbIni;
            ParamByName('PDTFIMCTBDIARIA').AsDateTime := dCtbFim;
         end;

         ExecSQL;

         // Marchetti - Pendencia 22289
         if bBloqueioJudicial then
         begin
            cdsBloqueioImob.Data := CtrlBloqueioImob.LookupBloqueioImob(-1,IDDocumento,-1,dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.AsInteger);
            if cdsBloqueioImob.IsEmpty then cdsBloqueioImob.Insert
            else                            cdsBloqueioImob.Edit;

            cdsBloqueioImob.FieldByName('IDDOCUMENTOBLOQ').AsInteger  := IDDocumento;
            cdsBloqueioImob.FieldByName('IDCONTRATOIMOVEL').AsInteger := dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.AsInteger;
            cdsBloqueioImob.Post;

            CtrlBloqueioImob.GravaBloqueioImob;
         end;
         // Fim Marchetti - Pendencia 22289

      end;
   end;
end;

procedure TfrmExecFolhaAluguelNova.AlterarMensagemPadro1Click(Sender: TObject);
var F: TfrmEditMsgLanc;
begin
   inherited;
   F := TfrmEditMsgLanc.Create(self);
   try
      F.iDocumento := qryLancFolhaIDDOCUMENTO.AsInteger;
      F.ShowModal;   // se quiser implementar retorno .. if F.ShowModal = MrOk then
   finally
      F.Free;
   end;
end;



function TfrmExecFolhaAluguelNova.VerificaContratosPendentes: Boolean;
var
  Ano, Mes : Integer;
begin
  Result := True;

  // Competência (mês/ano)
  Ano := Trunc(DBspnAno.Value);
  Mes := cboMes.ItemIndex + 1;

  if Mes = 1 then // Janeiro
   begin // MesAno anterior
    Ano := Ano - 1;
    Mes := 12
   end
  else // Mes anterior
    Mes := Mes - 1;

  QryContratosPend.Close;
  QryContratosPend.ParamByName('ANOMES').AsString := IntToStr(Ano) + IntToStr(Mes);
  QryContratosPend.ParamByName('MES').AsString    := IntToStr(Mes);
  QryContratosPend.ParamByName('ANO').AsString    := IntToStr(Ano);
  QryContratosPend.Open;

  if QryContratosPend.RecordCount > 0 then begin
   Result := MsgDlg('Existem receitas de competência anterior pendente de cobrança! Continua ? ',
                    'Confirmação', mtConfirmation, [mbYes, MbNo], 0) = mrYes;
  end;

  QryContratosPend.Close

end;

function TfrmExecFolhaAluguelNova.BuscaValorTotalImovel( iIdContrato : Integer ): Double;
var
  fVlr : double;
begin
  dtmImobiliario.qryContratoXImovel.Filtered := False;
  dtmImobiliario.qryContratoXImovel.Filter   := ' ( (CIMDTFIM IS NOT NULL) AND ('+QuotedStr(DateToStr(Date))+' >= CIMDTINI AND '+QuotedStr(DateToStr(Date))+' <= CIMDTFIM) ) OR ' +
                                                ' ( (CIMDTFIM IS NULL) AND ('+QuotedStr(DateToStr(Date))+' >= CIMDTINI) ) ';
  dtmImobiliario.qryContratoXImovel.Filtered := True;

  with ( dtmImobiliario.qryContratoXImovel ) do begin
    LimpaParametros(dtmImobiliario.qryContratoXImovel);
    ParamByName('PIDCONTRATOIMOVEL').AsInteger := iIdContrato;
    Open;
    First;

    while not ( dtmImobiliario.qryContratoXImovel.Eof ) do begin
      fVlr := fVlr + dtmImobiliario.qryContratoXImovelCIMVLRAJUSTADO.AsFloat;
      Next;
    end;
  end;

  Result := fVlr;
end;


function TfrmExecFolhaAluguelNova.VerificaValorImovel(iIdContrato: Integer): Boolean;
var
  fVlr : Currency;
begin
  Result := True;

  dtmImobiliario.qryContratoXImovel.Filtered := False;
  dtmImobiliario.qryContratoXImovel.Filter   := ' ( (CIMDTFIM IS NOT NULL) AND ('+QuotedStr(DateToStr(Date))+' >= CIMDTINI AND '+QuotedStr(DateToStr(Date))+' <= CIMDTFIM) ) OR ' +
                                                ' ( (CIMDTFIM IS NULL) AND ('+QuotedStr(DateToStr(Date))+' >= CIMDTINI) ) ';
  dtmImobiliario.qryContratoXImovel.Filtered := True;

  with ( dtmImobiliario.qryContratoXImovel ) do begin
    LimpaParametros(dtmImobiliario.qryContratoXImovel);
    ParamByName('PIDCONTRATOIMOVEL').AsInteger := iIdContrato;
    Open;
    First;

    while not ( dtmImobiliario.qryContratoXImovel.Eof ) do begin
      fVlr := fVlr + dtmImobiliario.qryContratoXImovelCIMVLRAJUSTADO.AsCurrency;
      Next;
    end;
  end;

  if ( fVlr <> dtmImobiliario.qryContratosReajusteCONVLRAJUSTADO.AsCurrency ) then
    Result := False;
end;

function TfrmExecFolhaAluguelNova.SelecionaImoveisContrato(const iAno,
  iMes: Integer): Boolean;
var
   dDtComp        : TDatetime;
begin
   Result := False;

   dDtComp := EncodeDate(iAno,iMes,1);

   with dtmImobiliario.qryContratoXImovel do begin
     LimpaParametros(dtmImobiliario.qryContratoXImovel);
     ParamByName('PIDCONTRATOIMOVEL').AsInteger   := dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.asInteger;
     ParamByName('PANOMES').AsDateTime            := dDtComp;
     Open;
   end;

   if (dtmImobiliario.qryContratoXImovel.RecordCount>0) then Result := True;
end;



procedure TfrmExecFolhaAluguelNova.FormCreate(Sender: TObject);
begin
   inherited;
   DiasUteis := TDiasUteis.Create;
   CtrlHistMovImob := TCtrlHistMovImob.Create;
   CtrlHistMovImob.InitializeAs(Padroes);
   CtrlHistMovImob.CdsHistMovImob := cdsHistMovImob;
   CtrlHistMovImob.CdsCondPag     := cdsCondPag;
   CtrlHistMovImob.CdsItensCalc   := CdsItensCalc;

   CtrlContratoImovel  := TCtrlContratoImovel.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.IdEspAcesso,Sistema.UsaPlanoPatro);
   CtrlContratoImovel.InitializeAs(Padroes);

   CtrlLancamentosImovel := TCtrlLancamentosImovel.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.IdEspAcesso,Sistema.UsaPlanoPatro);
   CtrlLancamentosImovel.InitializeAs(Padroes);

   CtrlTipoCustoRecImov  := TCtrlTipoCustoRecImov.Create;
   CtrlTipoCustoRecImov.InitializeAs(Padroes);
   CtrlBloqueioImob      := TCtrlBloqueioImob.Create;
   CtrlBloqueioImob.InitializeAs(Padroes);
   CtrlBloqueioImob.OpenTransaction := False;
   CtrlBloqueioImob.CdsBloqueioImob := cdsBloqueioImob;
   CtrlParamMulta        := TCtrlParamMulta.Create(Sistema.IdEmpresa, Sistema.IdModulo,
                                                   Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.UsaPlanoPatro);
   CtrlParamMulta.InitializeAs(Padroes);
   // Helen - SOL: 172902 KTN: 1577381
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(Padroes);
end;



procedure TfrmExecFolhaAluguelNova.GeraFolhaConfissao;
var fAtual, fQuant : double;
begin
   if not CtrlHistMovImob.ExisteLancamentoNoPeriodo(cboMes.ItemIndex + 1, Trunc(DBspnAno.Value), iContratoSelecao) then
   begin
      // monta a query dos contratos para os quais se deve tentar gerar aluguel
      SelecionaContratosFolha('D');

      CtrlHistMovImob.DataMov := edtDataLancamento.Date;
      CdsHistMovImob.Data     := CtrlHistMovImob.LookupHistMovImob(-2,-1);

      with dtmImobiliario.qryContratosFolha do
      begin
         // ProgressBar
         MudaInstrucao(7, 'Calculando parcelas de confissão de dívida...');
         fQuant := dtmImobiliario.qryContratosFolha.RecordCount;
         MostraProgresso(ProgressBar, lblProgress, lblContador, fQuant, 'Calculando parcelas de confissão de dívida...');

         // varre escopo de contratos
         First;
         fAtual := 0;
         while not(EOF) do
         begin

            // ProgressBar
            fAtual := fAtual + 1;
            AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fQuant);
            Application.ProcessMessages;

            cdsCondPag.Data := CtrlHistMovImob.LookupCondPag(cboMes.ItemIndex + 1,
                                                             trunc(DBspnAno.Value),
                                                             dtmImobiliario.qryContratosFolhaIDCONTRATOIMOVEL.AsInteger);
            if not CtrlHistMovImob.ProcessaCalculo(0, cboMes.ItemIndex + 1, trunc(DBspnAno.Value)) then
               MsgDlg(CtrlHistMovImob.MessageInfo,Sistema.NomeModulo,mtError,[mbOK],0);

            Next;
            Application.ProcessMessages;
         end;

         // Verifica se existe alguma condição de pagamento que venceu no mes anterior e
         // que possua algum tipo de desconto condicional a ser cobrado.
         cdsCondPag.Data := CtrlHistMovImob.LookupCondicaoComDesconto(cboMes.ItemIndex + 1,
                                                                      trunc(DBspnAno.Value));

         if not CtrlHistMovImob.ProcessaCalculo(1, cboMes.ItemIndex + 1, trunc(DBspnAno.Value)) then
            MsgDlg(CtrlHistMovImob.MessageInfo,Sistema.NomeModulo,mtError,[mbOK],0);
      end;
   end
   else
   begin
      MsgDlg(CtrlHistMovImob.MessageInfo, 'Aviso', mtWarning, [mbOK], 0);
   end;
end;


//Baruc
procedure TfrmExecFolhaAluguelNova.btnConfirmaConfissaoClick(Sender: TObject);
var
   iCodPortForma    : Integer;
   iDocumento       : Integer;
   dVencimento      : TDateTime;
   fValorAjustado   : Currency;
   iDia, iMes, iAno : word;
   iAnoVenc, iMesVenc : word;
begin
   inherited;
   try

      StartTransacao;

      cdsHistMovImob.DisableControls;
      cdsHistMovImob.Filter   := '';
      cdsHistMovImob.Filtered := False;

      cdsHistMovImob.First;
      while not cdsHistMovImob.eof do
      begin
         if cdsHistMovImob.FieldByName('IDTIPOCUSTORECIMO').AsInteger = cdsHistMovImob.FieldByName('IDITEMCENTRALIZA').AsInteger then
         begin

            cdsContratoXAlterador.Data := CtrlContratoImovel.LookupContratoXDesc(cdsHistMovImob.FieldByName('IDCONTRATOIMOVEL').AsInteger);
            cdsCondPag.Data            := CtrlHistMovImob.LookupCondPag(cboMes.ItemIndex + 1,
                                                                        trunc(DBspnAno.Value),
                                                                        cdsHistMovImob.FieldByName('IDCONTRATOIMOVEL').AsInteger);
            cdsContratoXImovel.Data    := CtrlContratoImovel.LookupContratoXImovel(cdsHistMovImob.FieldByName('IDCONTRATOIMOVEL').AsInteger);

            // Ajusta o valor a ser cobrado por imovel conforme o rateio
            cdsContratoXImovel.First;
            while not cdsContratoXImovel.eof do
            begin
               fValorAjustado := (cdsHistMovImob.FieldByName('HMIVALOR').AsCurrency *
                                  (cdsContratoXImovel.FieldByName('CIMVLRAJUSTADO').AsCurrency /
                                   cdsContratoXImovel.FieldByName('CONVLRAJUSTADO').AsCurrency) * 100) / 100;

               cdsContratoXImovel.Edit;
               cdsContratoXImovel.FieldByName('VLRIMOVEL').AsCurrency := fValorAjustado;
               cdsContratoXImovel.Post;
               cdsContratoXImovel.Next;
            end;
            cdsContratoXImovel.First;

            iDocumento  := Documento.GetCodigo(dtmImobiliario.qryAux);

            if cdsCondPag.IsEmpty then
               cdsCondPag.Data := CtrlHistMovImob.LookupCondicaoComDesconto(cboMes.ItemIndex + 1,
                                                                            trunc(DBspnAno.Value));

            DecodeDate(cdsCondPag.FieldByName('DATAVENCIMENTO').AsDateTime, iAno, iMes, iDia);

            iAnoVenc := Trunc(DBspnAno.Value);
            iMesVenc := cboMes.ItemIndex + 1;

            // Verifica se o vencimento original é no ultimo dia do mes
            if iDia = DiasUteis.UltDiaMes(iAno,iMes) then
            begin
               dVencimento := DiasUteis.UltDiaMes(iAnoVenc,iMesVenc);
            end
            else
            begin
               dVencimento := EncodeDate(iAnoVenc, iMesVenc, iDia);
            end;

            iCodPortForma := cdsCondPag.FieldByName('CODFORMA').AsInteger;
            if dbcboPortadorFormaDif.Text <> '' then iCodPortForma := StrToInt(dbcboPortadorFormaDif.LookupValue);

            if not CtrlLancamentosImovel.Inserir(cboMes.ItemIndex + 1,
                                                 Trunc(DBspnAno.Value),
                                                 cdsCondPag.FieldByName('IDLOCATARIO').AsInteger,
                                                 cdsHistMovImob.FieldByName('IDTIPOCUSTORECIMO').AsInteger,
                                                 iCodPortForma,
                                                 -1, // Daniel - 24872
                                                 0,
                                                 0,
                                                 cdsCondPag.FieldByName('MOECODIGOCORRENTE').AsInteger,
                                                 iDocumento,
                                                 0,
                                                 iDocumento,
                                                 0,
                                                 0,
                                                 'F',
                                                 'R',
                                                 '',
                                                 'Parcela de confissão de dívida',
                                                 Modulo.sCentrocusto,
                                                 '', // Daniel - 22993
                                                 dVencimento,
                                                 edtDataLancamento.Date,
                                                 -1,
                                                 -1,
                                                 cdsContratoxImovel.Data,
                                                 cdsContratoXAlterador.Data,
                                                 False,
                                                 False
                                                ) then
               Raise Exception.Create(CtrlLancamentosImovel.MessageInfo);

            cdsHistMovImob.Edit;
            cdsHistMovImob.FieldByName('HMIDOCUMENTO').AsInteger := iDocumento;
            cdsHistMovImob.Post;
            
         end;
         cdsHistMovImob.Next;
      end;
      cdsHistMovImob.First;
      cdsHistMovImob.EnableControls;

      CtrlHistMovImob.OpenTransaction := False;
      if not CtrlHistMovImob.GravaHistMovImob then
         Raise Exception.Create(CtrlHistMovImob.MessageInfo);

      CommitTransacao;

      MudaPrincipal(0);
      MudaInstrucao(0, '');
   except
      on E : Exception do
      begin
         RollBackTransacao;
         MsgDlg(E.Message,Sistema.NomeModulo,mtError,[mbOK],0);
      end;
   end;
end;



procedure TfrmExecFolhaAluguelNova.ntbPrincipalPageChanged(Sender: TObject);
begin
   inherited;
   if ntbPrincipal.PageIndex = 7 then
   begin
      chkItemCentralizadorClick(Self);
   end;

end;



procedure TfrmExecFolhaAluguelNova.chkItemCentralizadorClick(Sender: TObject);
begin
   inherited;
   if chkItemCentralizador.Checked then
   begin
      cdsHistMovImob.Filter   := 'IDTIPOCUSTORECIMO = IDITEMCENTRALIZA';
      cdsHistMovImob.Filtered := True;
   end
   else
   begin
      cdsHistMovImob.Filter   := '';
      cdsHistMovImob.Filtered := False;
   end;
end;



procedure TfrmExecFolhaAluguelNova.ProcessaDescontoRateado(iDocumento, iIdContratoImovel: integer);
var
  fTotal, fValor, fVlrBruto : Extended;
  bInclui                   : Boolean;
  i : Integer;
  iDocExcluir : array of integer;
  iNumRegistros : Integer;
  iDiasMes          : Integer;
  fDesconto         : Extended;
  dVenc             : TDateTime;
  // Daniel - 27739
  iDiasEfetivo              : Integer;
  iDia1, iMes1, iAno1       : word;
  iDia2, iMes2, iAno2       : word;
  // Fim
begin
   fTotal    := 0;
   fValor    := 0;
   fVlrBruto := 0;
   iDiasMes  := DiasInUteis.ExtraiDia(DiasInUteis.UltDiaMes(word(trunc(DBspnAno.Value)), cboMes.ItemIndex + 1));
   dVenc     := DiasInUteis.UltDiaMes(word(trunc(DBspnAno.Value)), cboMes.ItemIndex + 1);

   qryContratoXDescRateio.Close;
   qryContratoXDescRateio.ParamByName('PIDCONTRATOIMOVEL').AsFloat := iIdContratoImovel;
   qryContratoXDescRateio.ParamByName('PERIODO').AsString          := FormatDateTime('yyyymm',dVenc);
   qryContratoXDescRateio.Open;

  if not qryContratoXDescRateio.IsEmpty then begin
      qryLancFolha.First;
      qryLancFolha.Locate( 'IDDOCUMENTO', iDocumento, [loCaseInsensitive, loPartialKey] );

    while (qryLancFolhaIDDOCUMENTO.AsInteger=iDocumento) and (not qryLancFolha.Eof) do begin
         fVlrBruto := fVlrBruto + qryLancFolhaVLRLANCRECEB.AsFloat;
         qryLancFolha.Next;
      end;
// Daniel - 27739 - Início -----------------------------------------------------
    // Testa valores pro-rata no inicio e término do período de desconto
    iDiasEfetivo  := iDiasMes;
    DecodeDate( qryContratoXDescRateioDATAINICIO.AsDateTime, iAno1, iMes1, iDia1 );
    DecodeDate( qryContratoXDescRateioDATAFIM.AsDateTime, iAno2, iMes2, iDia2 );

    if (iMes1=iMes2) and (iAno1=iAno2) and (iMes1=cboMes.ItemIndex+1) and (iAno1=word(trunc(DBspnAno.Value))) then
      iDiasEfetivo := (qryContratoXDescRateioDATAFIM.AsInteger-qryContratoXDescRateioDATAINICIO.AsInteger)+1
    else
    if (iMes1=cboMes.ItemIndex+1) and (iAno1=word(trunc(DBspnAno.Value))) then iDiasEfetivo := iDiasMes-iDia1
    else
    if (iMes2=cboMes.ItemIndex+1) and (iAno2=word(trunc(DBspnAno.Value))) then iDiasEfetivo := iDia2;
// Daniel - 27739 - Fim --------------------------------------------------------
      bInclui := True;
      qryContratoXDescRateio.First;
    while ( not qryContratoXDescRateio.Eof ) and bInclui do begin
         qryAlteradores.First;
         if qryAlteradores.Locate( 'IDCONTRATOIMOVEL;CODALTERADOR', VarArrayOf([iIdContratoImovel,qryContratoXDescRateioCODALTERADOR.AsInteger]), [loCaseInsensitive, loPartialKey] ) then
         begin
            memErro.Lines.Add('- Existem alteradores duplicados nos descontos do contrato "' +
                              qryContratoXDescRateioCONNOME.AsString + '".' + #13 );
            bInclui := False;
      end else begin
        if not qryContratoXDescRateioPERDESCONTO.IsNull then begin
          fDesconto := ComunsImobiliario.Arredonda((qryContratoXDescRateioPERDESCONTO.AsFloat / iDiasMes) * (iDiasEfetivo),2); // Daniel - 27739
                  fValor    := fValor + ComunsImobiliario.Arredonda(fVlrBruto * ( fDesconto / 100 ), 2);
               bInclui := True;
        end else begin
               qryCotacaoMoeda.Close;
               qryCotacaoMoeda.ParamByName('MOECODIGO').AsFloat := qryContratoXDescRateioMOECODIGO.AsFloat;
               qryCotacaoMoeda.ParamByName('DATA').AsDateTime   := dVenc;
               qryCotacaoMoeda.Open;

          if qryCotacaoMoeda.IsEmpty then begin
                  memErro.Lines.Add('- Não foi possível encontrar cotação para a moeda ' +
                                    qryContratoXDescRateioMOESIGLA.AsString + ' em ' + FormatDateTime( 'dd/mm/yyyy', dVenc ) + ', utilizada ' +
                                    'em desconto do documento ' + IntToStr( iDocumento ) + '.' + #13 );
                 bInclui := False;
          end else begin
            fDesconto := ComunsImobiliario.Arredonda((qryContratoXDescRateioVLRDESCONTO.AsFloat / iDiasMes) * (iDiasEfetivo),2); // Daniel - 27739
                     fValor    := fValor + ComunsImobiliario.Arredonda( fDesconto * qryCotacaoMoedaCOTVALOR.AsFloat, 2) ;
                  bInclui := True;
               end;
            end;
         end;

         qryContratoXDescRateio.Next;
      end;

    if bInclui then fTotal := fTotal+fValor;

    if fTotal>fVlrBruto then begin
         memErro.Lines.Add('- O somatório dos descontos do contrato "' + qryContratoXDescRateioCONNOME.AsString +
                           '" ultrapassa o seu valor a ser cobrado no mês.' + #13 );
         bInclui := False;
      end;

    if bInclui then begin
         qryAlteradores.Insert;
         qryAlteradores.FieldByName('IDDOCUMENTO').AsFloat        := iDocumento;
         qryAlteradores.FieldByName('IDCONTRATOIMOVEL').AsInteger := iIdContratoImovel;
         qryAlteradores.FieldByName('CONNOME').AsString           := qryContratoXDescRateioCONNOME.AsString;
         qryAlteradores.FieldByName('CODALTERADOR').AsFloat       := qryContratoXDescRateioCODALTERADOR.AsFloat;
         qryAlteradores.FieldByName('VLRALTERADOR').AsFloat       := fValor;
         qryAlteradores.FieldByName('VLRBRUTO').AsFloat           := fVlrBruto;
         qryAlteradores.FieldByName('VLRLIQUIDO').AsFloat         := ComunsImobiliario.Arredonda(fVlrBruto - fValor, 2);
         qryAlteradores.FieldByName('CODTIPIMOVEL').AsString      := qryContratoXDescRateioCODTIPIMOVEL.AsString;
         qryAlteradores.FieldByName('DESCRICAO').AsString         := qryContratoXDescRateioDESCRICAO.AsString;
         qryAlteradores.FieldByName('DESCTIPOIMOVEL').AsString    := qryContratoXDescRateioDESCTIPOIMOVEL.AsString;
         qryAlteradores.FieldByName('OBSERVACAO').AsString        := qryContratoXDescRateioOBSERVACAO.AsString; // Daniel - 24079
         qryAlteradores.Post;
    end else begin
         SetLength( iDocExcluir, length( iDocExcluir ) + 1 );
         iDocExcluir[ High( iDocExcluir ) ] := iDocumento;
    end;

      // Caso ocorra erros, Exclui os lançamentos da LançamentosImovel e Alteradores
    for i := 0 to High(iDocExcluir) do begin
         qryAlteradores.First;
      while qryAlteradores.Locate('IDDOCUMENTO',iDocExcluir[i],[loCaseInsensitive,loPartialKey]) do begin
            qryAlteradores.Delete;
            qryAlteradores.First;
         end;

         qryLancFolha.First;
      while qryLancFolha.Locate('IDDOCUMENTO',iDocExcluir[i],[loCaseInsensitive,loPartialKey]) do begin
            qryLancFolha.Delete;
            qryLancFolha.First;
         end;
      end;
   end;

   qryContratoXDescRateio.Close;
   qryCotacaoMoeda.Close;
end;

end.


