unit fCustomCadProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls,
  Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, CMProcura,
  Mask, wwdblook, Wwdbspin, wwdbedit, TREdit, CMProcuraSubTipo, DBCtrls, ImgList, DBClient,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, fCadastroMestreDetMT,
  uCMClientDataSet, uCtrlGlobalRH, uCtrlProcessoTrab, uCtrlVaraJustica, uCtrlListTerceirosRH,
  uCtrlTipRec, uCtrlPeriodo, uCtrlContab, uCtrlPessoaFuncionario, uCtrlTipObjeto, uCtrlMotivo,
  uCtrlTipProc, uCtrlTRT, uCtrlTipAcao, uCtrlTipSent, uCtrlCalcRub, uCtrlHonorarioProcesso,
  uCtrlEtapaProcesso, uCtrlHstObjProcTrab, fCmReport, TB97Tlwn, math;

const
  // Constantes usadas para indicar se o cadastro irá integrar somente com o CAP ou
  // também com o CAR. esta informação depende do Módulo que está sendo usado.
  CAP = 0;
  CAPCAR = 1;

type
  TfrmCustomCadProcesso = class(TFrmCadastroMestreDetMT)
    dsEtapa: TwwDataSource;
    dsPartic: TwwDataSource;
    dsProcVinc: TwwDataSource;
    tbshContraparte: TTabSheet;
    tbshOutrosDados: TTabSheet;
    tbshEncer: TTabSheet;
    tbsEtapas: TTabSheet;
    tbshVinculos: TTabSheet;
    rgTipEncer: TDBRadioGroup;
    gbxAcordo: TGroupBox;
    sbspeParc: TwwDBSpinEdit;
    gbxDataEncer: TGroupBox;
    dbedEncerr: TCMDateTimePicker;
    gbxSent: TGroupBox;
    dblckTipSent: TwwDBLookupCombo;
    dbGrdEtapa: TwwDBGrid;
    pnlLigado: TPanel;
    Label37: TLabel;
    spbProcVinc: TSpeedButton;
    spbApagaVinc: TSpeedButton;
    dbedNumVinc: TDBEdit;
    gbxVinculados: TGroupBox;
    dbgdProcessosVinc: TwwDBGrid;
    tbsLitisconsortes: TTabSheet;
    pnlDet2: TPanel;
    dbgrDet2: TwwDBGrid;
    dsLitis: TwwDataSource;
    pnlEtapas: TPanel;
    MontaSelectCidade: TMontaSelect;
    dsUF: TwwDataSource;
    pgCtrlOutrosDados: TPageControl;
    tbshTipos: TTabSheet;
    tbshAdvogados: TTabSheet;
    tbshValores: TTabSheet;
    CMProcuraAdv1: TCMProcuraSubTipo;
    CMProcuraAdv2: TCMProcuraSubTipo;
    CMProcuraAssist: TCMProcuraSubTipo;
    Label34: TLabel;
    dblckAdvCasa: TwwDBLookupCombo;
    dbrgIndTaxaConv: TDBRadioGroup;
    gbxIndice: TGroupBox;
    gbxRegra: TGroupBox;
    dblckMoeda: TwwDBLookupCombo;
    dblckRegraNormal: TwwDBLookupCombo;
    tbshIntegracao: TTabSheet;
    MontaSelectFunc: TMontaSelect;
    sbtnProcurarLitis: TToolbarButton97;
    CdsDet: TCMClientDataSet;
    CdsEtapa: TCMClientDataSet;
    CdsHonorarios: TCMClientDataSet;
    CdsTipoDesemb: TCMClientDataSet;
    CdsTipoOper: TCMClientDataSet;
    CdsVara: TCMClientDataSet;
    CdsTipoDoc: TCMClientDataSet;
    CdsTipoEtapa: TCMClientDataSet;
    gbkTipoDesemb: TGroupBox;
    dblckTipoDesemb: TwwDBLookupCombo;
    gbxContabilizacao: TGroupBox;
    Label44: TLabel;
    Label45: TLabel;
    dblckTipOper: TwwDBLookupCombo;
    rgJuros: TRadioGroup;
    gbxCAPCAR: TGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    dtPagamento: TCMDateTimePicker;
    dblckTipoDoc: TwwDBLookupCombo;
    CdsProcVinc: TCMClientDataSet;
    CdsUF: TCMClientDataSet;
    CdsPartic: TCMClientDataSet;
    CdsTipoObj: TCMClientDataSet;
    CdsParamRH: TCMClientDataSet;
    CdsLitis: TCMClientDataSet;
    bbtnParcelamento: TBitBtn;
    CdsMotivo: TCMClientDataSet;
    CdsTipoProc: TCMClientDataSet;
    CdsTRT: TCMClientDataSet;
    CdsTipAcao: TCMClientDataSet;
    CdsAdvCasa: TCMClientDataSet;
    CdsMoeda: TCMClientDataSet;
    CdsRegra: TCMClientDataSet;
    CdsTipSent: TCMClientDataSet;
    MontaSelectProcVinc: TMontaSelect;
    GroupBox2: TGroupBox;
    dbedPrevEnc: TCMDateTimePicker;
    Label28: TLabel;
    Label14: TLabel;
    Label8: TLabel;
    dbreCusto: TDBRealEdit;
    redValorAtual: TRealEdit;
    dbreDespesa: TDBRealEdit;
    tbsInstancias: TTabSheet;
    sbtnFicha: TToolbarButton97;
    Label17: TLabel;
    Label15: TLabel;
    lblTRT: TLabel;
    dbedNumJCJ2: TDBEdit;
    dblckVara: TwwDBLookupCombo;
    Label26: TLabel;
    dbedNumTRT: TDBEdit;
    dblckVara2: TwwDBLookupCombo;
    Label27: TLabel;
    dbedNumTST: TDBEdit;
    dblckVara3: TwwDBLookupCombo;
    Label29: TLabel;
    dbedNumExec: TDBEdit;
    Label5: TLabel;
    dblckTipObj: TwwDBLookupCombo;
    lblValorReclamado: TLabel;
    dbedValRecl: TDBRealEdit;
    lblValReal: TLabel;
    dbedValReal: TDBRealEdit;
    Label39: TLabel;
    dbmemObserv: TDBMemo;
    Label20: TLabel;
    dblckTipoEtp: TwwDBLookupCombo;
    Label22: TLabel;
    dtedDataReal: TCMDateTimePicker;
    Label25: TLabel;
    mskedHora: TMaskEdit;
    Label41: TLabel;
    dbedAssunto: TDBEdit;
    Label42: TLabel;
    dbedValRec: TDBRealEdit;
    dbrgAbate: TDBRadioGroup;
    lblHonor: TLabel;
    redHonor: TRealEdit;
    Label43: TLabel;
    dbmObserv: TDBMemo;
    dbrgCategoria: TDBRadioGroup;
    gbxSitLitis: TGroupBox;
    lblSitLit: TLabel;
    dblckMotivoLit: TwwDBLookupCombo;
    Label1: TLabel;
    dbedNumProcesso: TDBEdit;
    Label30: TLabel;
    dbedNumJCJ: TDBEdit;
    Label2: TLabel;
    dbedDataAju: TCMDateTimePicker;
    Label19: TLabel;
    dbedDataNot: TCMDateTimePicker;
    rgSituacao: TDBRadioGroup;
    gbxSitContraparte: TGroupBox;
    lblSitContraparte: TLabel;
    dblckMotivoContraparte: TwwDBLookupCombo;
    gbxLitisconsorte: TGroupBox;
    spbtnProcLitisconsorte: TSpeedButton;
    edLitisconsorte: TEdit;
    Label3: TLabel;
    dbedPost: TCMDateTimePicker;
    gbxQuantContraparte: TGroupBox;
    spbtnCalcNumContraparte: TBitBtn;
    dbedQtde: TDBEdit;
    Label31: TLabel;
    dblckTipProc: TwwDBLookupCombo;
    Label33: TLabel;
    dblckTipAcao: TwwDBLookupCombo;
    Label35: TLabel;
    dbedPasta: TDBEdit;
    Label36: TLabel;
    ProcuraCidade: TCMProcura;
    Label21: TLabel;
    dbedUF: TwwDBEdit;
    gbxContraparte: TGroupBox;
    edNomeContraparte: TEdit;
    spbtnProcContraparte: TBitBtn;
    btnPenhora: TBitBtn;
    tbshHonor: TTabSheet;
    dbgrHonor: TwwDBGrid;
    pnlHonor: TPanel;
    dsHonor: TwwDataSource;
    CdsHonor: TCMClientDataSet;
    CdsAdvog: TCMClientDataSet;
    lblDataPagto: TLabel;
    lblFavorecido: TLabel;
    lblValorHonor: TLabel;
    dtPagamentoHonor: TCMDateTimePicker;
    dblckFavor: TwwDBLookupCombo;
    dbedValHon: TDBRealEdit;
    cbxSucumbencia: TCheckBox;
    lblAvisoHonor1: TLabel;
    lblAvisoEtapa1: TLabel;
    CdsImovel: TCMClientDataSet;
    CdsEventoImovel: TCMClientDataSet;
    bbtnSubstituirContraparte: TBitBtn;
    CdsOutroProc: TCMClientDataSet;
    townOutroProc: TToolWindow97;
    btnFecharDica: TBitBtn;
    dbgrOutroProc: TwwDBGrid;
    dsOutroProc: TwwDataSource;
    dbedNumVara: TwwDBEdit;
    Label4: TLabel;
    CdsCCusto: TCMClientDataSet;
    dblckCCusto: TwwDBLookupCombo;
    Label6: TLabel;
    gbxEstimativaOriginal: TGroupBox;
    Label40: TLabel;
    dbedValProbOrig: TDBRealEdit;
    gbxEstimativaAtual: TGroupBox;
    Label7: TLabel;
    dbedPerc: TDBRealEdit;
    Label24: TLabel;
    dbedValor: TDBRealEdit;
    lblValorOrig: TLabel;
    dbedValorOrig: TDBRealEdit;
    lblObsProbab: TLabel;
    lblTaxaJuros: TLabel;
    dbredJuros: TDBRealEdit;
    dbdtJuros: TCMDateTimePicker;
    lblDataJuros: TLabel;
    redJuros: TDBRealEdit;
    lblDataAval: TLabel;
    dbedDataAval: TCMDateTimePicker;
    townHistObjeto: TToolWindow97;
    bbtnFecharHistObjeto: TBitBtn;
    dbgrHistObjeto: TwwDBGrid;
    bbtnVerHistObjeto: TBitBtn;
    dsHistObjeto: TwwDataSource;
    CdsHistObjeto: TCMClientDataSet;
    CdsHistObjetoGravar: TCMClientDataSet;
    lblObservHistObjeto: TLabel;
    dbmemObservHist: TDBMemo;
    CMDateTimePicker1: TCMDateTimePicker;
    lblDataHoraIncl: TLabel;
    lblDataAltSit: TLabel;
    dbedDataAltSit: TCMDateTimePicker;
    dbedDataAltSitLitis: TCMDateTimePicker;
    lblAltSitLitis: TLabel;
    dbedCustas: TDBRealEdit;
    lblCustas: TLabel;
    btnContaBanc: TBitBtn;
    bbtnMulta: TBitBtn;
    dbrgIndCondenacao: TDBRadioGroup;
    bbtnCondenacao: TBitBtn;
    lblValorCondenacao: TLabel;
    dbredValorCondenacao: TDBRealEdit;
    dbrgIndHonor: TDBRadioGroup;
    redValorTotal: TDBRealEdit;
    lblNumSeqVinc: TLabel;
    dbedNumSeqVinc: TDBRealEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure spbProcVincClick(Sender: TObject);
    procedure spbApagaVincClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ProcuraCidadeValidaDados(Sender: TObject);
    procedure dblckMoedaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblckRegraNormalCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblckMotivoContraparteChange(Sender: TObject);
    procedure dblckMotivoLitChange(Sender: TObject);
    procedure sbtnProcurarLitisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CdsEtapaAfterScroll(DataSet: TDataSet);
    procedure CdsEtapaBeforeEdit(DataSet: TDataSet);
    procedure dsStateChange(Sender: TObject);
    procedure CdsDetBeforeEdit(DataSet: TDataSet);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure dsEtapaStateChange(Sender: TObject);
    procedure dsLitisStateChange(Sender: TObject);
    procedure bbtnParcelamentoClick(Sender: TObject);
    procedure rgTipEncerChange(Sender: TObject);
    procedure rgSituacaoChange(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure dbrgIndTaxaConvChange(Sender: TObject);
    procedure dbedNumJCJExit(Sender: TObject);
    procedure sbtnFichaClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure dbedPercChange(Sender: TObject);
    procedure dbedValorChange(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure spbtnProcLitisconsorteClick(Sender: TObject);
    procedure dbreCustoChange(Sender: TObject);
    procedure spbtnCalcNumContraparteClick(Sender: TObject);
    procedure CdsBeforeInsert(DataSet: TDataSet);
    procedure spbtnProcContraparteClick(Sender: TObject);
    procedure dblckTipoEtpChange(Sender: TObject);
    procedure btnPenhoraClick(Sender: TObject);
    procedure CdsHonorBeforeDelete(DataSet: TDataSet);
    procedure dsHonorStateChange(Sender: TObject);
    procedure CdsHonorBeforeEdit(DataSet: TDataSet);
    procedure cbxSucumbenciaClick(Sender: TObject);
    procedure CdsEtapaAfterInsert(DataSet: TDataSet);
    procedure CdsEtapaBeforePost(DataSet: TDataSet);
    procedure CdsEtapaBeforeDelete(DataSet: TDataSet);
    procedure dblckMotivoContraparteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnSubstituirContraparteClick(Sender: TObject);
    procedure CdsAfterScroll(DataSet: TDataSet);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure btnFecharDicaClick(Sender: TObject);
    procedure CdsBeforePost(DataSet: TDataSet);
    procedure dbedValorOrigChange(Sender: TObject);
    procedure dbedValProbOrigChange(Sender: TObject);
    procedure bbtnVerHistObjetoClick(Sender: TObject);
    procedure bbtnFecharHistObjetoClick(Sender: TObject);
    procedure CdsDetAfterPost(DataSet: TDataSet);
    procedure dbedDataAvalEnter(Sender: TObject);
    procedure CdsDetBeforeDelete(DataSet: TDataSet);
    procedure dblckMotivoLitCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnContaBancClick(Sender: TObject);
    procedure bbtnMultaClick(Sender: TObject);
    procedure dbrgIndCondenacaoChange(Sender: TObject);
    procedure bbtnCondenacaoClick(Sender: TObject);
    procedure pnlHonorEnter(Sender: TObject);
    procedure dbrgIndHonorChange(Sender: TObject);
  private
    dValAntes, dValHonorAntes, IdImovelAntes: double;

    DataDemissao, DataAvalAntes: TDate;
    sNomeSubConta, sMascaraPlaConta: string;
    iSituacao_Original, iNumSeqAtual, IdPatro, IdPlanoPrev: integer;
    bIntegraContab, bIntegraCAPCAR, // Indicam se a tela permite integração
    bFazContab, bFazCAPCAR, // Indicam se deverá ser feita a integração (quando o valor dos objetos é mudado)
    bAlterouValores, bOkDetalhe, bEncerrar, bExibeMensagens: boolean;

    procedure HabilitarIntegracao;
    procedure HabilitarPastaIntegracao;
    procedure HabilitarBtProcVinc(Alterando: boolean);
    procedure HabilitarTipoEncerramento(Situacao: integer; TipoEncerramento: string);

    procedure MudarDadosCidade;

    procedure IniciarValoresContabeis;
    procedure AcharUltimoNumSeq;
    procedure FormatarCampoCdsObjetos;
    procedure CopiarDadosMontaSelect(MSOrigem, MSDestino: TMontaSelect);
    procedure MontarMontaSelect;
    procedure MudarParametrosTela;
    procedure HabilitarDadosEncerramento(Situacao: integer);
    function  GravarProcessoTrab: boolean;
    function  ExcluirProcessoTrab: boolean;
    function  TotalValorSentenca: double;
    procedure GravarIntegracao;

    procedure Progresso(Args: array of Variant);
    procedure FormCloseParamFichaProc(Sender: TObject; var Action: TCloseAction);
    procedure ImprimeFichaProc(const NumProcesso, NomeContraparte, NossoAdv: string);
  protected
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlProcessoTrab: TCtrlProcessoTrab;
    CtrlVaraJustica: TCtrlVaraJustica;
    CtrlTipRec: TCtrlTipRec;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlTipObjeto: TCtrlTipObjeto;
    CtrlPeriodo: TCtrlPeriodo;
    CtrlContab: TCtrlContab;
    CtrlMotivo: TCtrlMotivo;
    CtrlTipProc: TCtrlTipProc;
    CtrlTRT: TCtrlTRT;
    CtrlTipAcao: TCtrlTipAcao;
    CtrlTipSent: TCtrlTipSent;
    CtrlHonorarioProcesso: TCtrlHonorarioProcesso;
    CtrlCalcRub: TCtrlCalcRub;
    CtrlEtapaProcesso: TCtrlEtapaProcesso;
    CtrlHstObjProcTrab: TCtrlHstObjProcTrab;

    iTipoIntegraCAPCAR: integer;

    procedure OnMudarParametrosTela; virtual; abstract;
    procedure OnMudarDadosParticipante; virtual;
    function  CriarTelaParamFichaProc: TForm; virtual; abstract;
    function  CriarFichaProc: TFrmCmReport; virtual; abstract;
    procedure OnParamFichaProc(Frm: TForm); virtual; abstract;
    procedure OnClick_ProcurarProcesso; virtual; abstract;
    procedure OnClick_ProcurarProcessoComLitisconsortes; virtual; abstract;
    function  OnClick_OkDetalheLitisconsortes: boolean; virtual;
    function  OnClick_OkDetalheObjetos: boolean; virtual;
    function  OnClick_OkDetalheEtapas: boolean; virtual;
    function  OnClick_OkDetalheHonor: boolean; virtual;
    procedure MudarNomeSubConta(Nome: string); virtual;
    function  GetDataDemissao: TDate; virtual;
  public
    DataAjuizamento, DataNotificacao: TCMDateTimePicker;

    procedure Sel(SelPrincipal: boolean; NumProcTrab: double);
  end;

var
  frmCustomCadProcesso: TfrmCustomCadProcesso;

implementation

uses uCMTypes, uSistema, uMensErro, uModulo, uCtrlFuncoesRH, uCtrlPadroes, uCtrlParamIntegra,
  fParcelaAcordoMT, fValorRealMT, fProcuraPessoaDoc, uCtrlUsoGeralRH, dCds,
  fCustomParamFichaProc, fAguarde, fCadRegPenhora, fCadRegContaBanc,
  fCadRegMulta, fCadRegCondenacao;

{$R *.DFM}

procedure TfrmCustomCadProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlProcessoTrab := TCtrlProcessoTrab.Create(Sistema.IdModulo, Sistema.IdUsuario,
    Sistema.IdEmpresa, Sistema.UsaPlanoPatro, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlProcessoTrab.InitializeAs(Padroes);
  CtrlProcessoTrab.CdsProcesso := Cds;
  CtrlProcessoTrab.CdsLitisconsortes := CdsLitis;
  CtrlProcessoTrab.CdsObjetos := CdsDet;
  CtrlProcessoTrab.CdsEtapas := CdsEtapa;
  CtrlProcessoTrab.CdsHonorarios := CdsHonorarios;
  CtrlProcessoTrab.CdsHonor := CdsHonor;
  CtrlProcessoTrab.AssociarCdsImovel(CdsImovel, CdsEventoImovel);
  CtrlProcessoTrab.Progresso := Progresso;

  CtrlEtapaProcesso := TCtrlEtapaProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlEtapaProcesso.InitializeAs(Padroes);

  CtrlHstObjProcTrab := TCtrlHstObjProcTrab.Create;
  CtrlHstObjProcTrab.InitializeAs(Padroes);
  CtrlHstObjProcTrab.CdsHistObjeto := CdsHistObjetoGravar;
  CdsHistObjetoGravar.Data := CtrlHstObjProcTrab.ListGeral(-1,-1, 0);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlHonorarioProcesso := TCtrlHonorarioProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlHonorarioProcesso.InitializeAs(Padroes);

  CtrlVaraJustica := TCtrlVaraJustica.Create;
  CtrlVaraJustica.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlTipRec := TCtrlTipRec.Create;
  CtrlTipRec.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlTipObjeto := TCtrlTipObjeto.Create;
  CtrlTipObjeto.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlTRT := TCtrlTRT.Create;
  CtrlTRT.InitializeAs(Padroes);

  CtrlTipProc := TCtrlTipProc.Create;
  CtrlTipProc.InitializeAs(Padroes);

  CtrlTipSent := TCtrlTipSent.Create;
  CtrlTipSent.InitializeAs(Padroes);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.InitializeAs(Padroes);

  CtrlTipAcao := TCtrlTipAcao.Create;
  CtrlTipAcao.InitializeAs(Padroes);

  CtrlCalcRub := TCtrlCalcRub.Create;
  CtrlCalcRub.InitializeAs(Padroes);
  CtrlCalcRub.IdEmpresa := Sistema.IdEmpresa;

  CtrlContab := TCtrlContab.Create;
  CtrlContab.InitializeAs(Padroes);
  CtrlContab.SelecionaParametros(Sistema.IdEmpresa);

  frmProcuraPessoaDoc := TfrmProcuraPessoaDoc.Create(Application);

  CdsParamRH.Data := CtrlGlobalRH.GetParamRH(
    'FLGINTEGRACAP, FLGINTEGRACONT, INDCONTABJUR, FLGCRIASUBCONTA, FLGPERCPROB, MOEDAPROCTRAB');
  CdsTipoEtapa.Data := CtrlTipRec.ListTipRec;
  CdsTipoObj.Data := CtrlTipObjeto.ListTipObjeto;
  CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('O');
  CdsTipoProc.Data := CtrlTipProc.ListTipProc;
  CdsTRT.Data := CtrlTRT.ListTRT;
  CdsVara.Data := CtrlVaraJustica.ListVaraJustica;
  CdsTipAcao.Data := CtrlTipAcao.ListTipAcao;
  CdsAdvCasa.Data := CtrlListTerceirosRH.ListUsuarioSistema;
  CdsMoeda.Data := CtrlListTerceirosRH.ListMoeda;
  CdsRegra.Data := CtrlListTerceirosRH.ListRegras;
  CdsTipSent.Data := CtrlTipSent.ListTipSent;
  CdsImovel.Data := CtrlListTerceirosRH.ListImovel;
  CdsEventoImovel.Data := CtrlListTerceirosRH.ListEventoImovelVazio;
  CdsCCusto.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));

  MudarParametrosTela;
  HabilitarIntegracao;
  Sel(true, -1);

  tbshIntegracao.TabVisible := false;
  pgCtrlOutrosDados.ActivePageIndex := 0;

  Self.Height := 494;
  Self.Width := 757;
end;

procedure TfrmCustomCadProcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlProcessoTrab);
  FreeAndNil(CtrlEtapaProcesso);
  FreeAndNil(CtrlHonorarioProcesso);
  FreeAndNil(CtrlHstObjProcTrab);
  FreeAndNil(CtrlVaraJustica);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlTipProc);
  FreeAndNil(CtrlPeriodo);
  FreeAndNil(CtrlContab);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlTipRec);
  FreeAndNil(CtrlTipSent);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlTipObjeto);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlTRT);
  FreeAndNil(CtrlTipAcao);
  FreeAndNil(CtrlCalcRub);
  FreeAndNil(frmProcuraPessoaDoc);

  if Assigned(frmCadRegPenhora) then
    FreeAndNil(frmCadRegPenhora);
  inherited;
end;

procedure TfrmCustomCadProcesso.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Sel(true, StrToFloat(MontaSelect.ValoresChave[0]));
    AcharUltimoNumSeq;
  end;
end;

procedure TfrmCustomCadProcesso.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnProcurarLitis.Enabled := (Cds.State = dsBrowse);
  sbtnFicha.Enabled := not(Cds.IsEmpty) and (Cds.State = dsBrowse);
end;

procedure TfrmCustomCadProcesso.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Sel(false, -1);

  Cds.FieldByName('FLGSITPROC').asInteger := 0;
  Cds.FieldByName('CUSTOPROC').asInteger := 0;
  Cds.FieldByName('DESPESAPROC').asInteger := 0;
  Cds.FieldByName('DATAPREVENCER').asDateTime := Date + Round(365.25 * 5);
  Cds.FieldByName('FLGPARTEATIVA').asInteger := 0;
  Cds.FieldByName('MOEDAPROCTRAB').asFloat := CdsParamRH.FieldByName('MOEDAPROCTRAB').asFloat;
  if (Modulo.IdContraCheque = FUNCEF) then
    Cds.FieldByName('TAXAJUROS').asFloat := 1;

  // Caso a moeda indicada
  if (CdsParamRH.FieldByName('MOEDAPROCTRAB').IsNull) then
    Cds.FieldByName('INDTAXACONV').asInteger := 2
  else
  begin
    Cds.FieldByName('INDTAXACONV').asInteger := 0;
    Cds.FieldByName('MOEDAPROCTRAB').asFloat := CdsParamRH.FieldByName('MOEDAPROCTRAB').asFloat;
  end;

  CtrlProcessoTrab.ZerarValoresProcesso;
  iNumSeqAtual := 0;
  bAlterouValores := false;
end;

procedure TfrmCustomCadProcesso.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
    CdsDet.FieldByName('VALORSENTENCA').asFloat := 0;
    dbedValor.Value := CdsDet.FieldByName('VALORPROVAVEL').asFloat;
    CdsDet.FieldByName('DATAAVAL').asDateTime := Date;
  end
  else
  if (pgctrlDetalhe.ActivePage = tbsEtapas) then
  begin
    btnPenhora.Enabled := False;
    Inc(iNumSeqAtual);
    CdsEtapa.FieldByName('NUMSEQ').asInteger := iNumSeqAtual;
  end
  else
  if (pgctrlDetalhe.ActivePage = tbshHonor) then
    CdsHonor.FieldByName('DATAPAGTOHONOR').asDateTime := Date;
end;

procedure TfrmCustomCadProcesso.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  dbedPercChange(Sender);
end;

procedure TfrmCustomCadProcesso.CmeDetalheDelete(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsEtapas) and
     (CdsHonorarios.Locate('NUMSEQ', CdsEtapa.FieldByName('NUMSEQ').asInteger, [])) then
    CdsHonorarios.Delete;
  inherited;
end;

procedure TfrmCustomCadProcesso.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCustomCadProcesso.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarProcessoTrab;
end;

procedure TfrmCustomCadProcesso.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarProcessoTrab;
end;

procedure TfrmCustomCadProcesso.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := ExcluirProcessoTrab;
end;

procedure TfrmCustomCadProcesso.dsStateChange(Sender: TObject);
var
  bAlterando: boolean;
begin
  inherited;
  bAlterando := (Cds.State in [dsInsert,dsEdit]);

  HabilitarBtProcVinc(bAlterando);
  ProcuraCidade.Enabled := bAlterando;
  CMProcuraAdv1.Enabled := bAlterando;
  CMProcuraAdv2.Enabled := bAlterando;
  CMProcuraAssist.Enabled := bAlterando;
  spbtnCalcNumContraparte.Enabled := bAlterando;

  if (bAlterando) and (dbedNumJCJ.CanFocus) then
    dbedNumJCJ.SetFocus;
end;

procedure TfrmCustomCadProcesso.dsLitisStateChange(Sender: TObject);
begin
  if (CdsLitis.State in [dsInsert,dsEdit]) then
  begin
    if (CdsLitis.FieldByName('IDPESSOA').IsNull) then
      edLitisconsorte.Text := ''
    else
      edLitisconsorte.Text := CdsLitis.FieldByName('NOME').asString;

    dblckMotivoLitChange(Sender);

    dbredValorCondenacao.Visible := (CdsLitis.FieldByName('INDTESTEMUNHA').asInteger = 3) and (rgSituacao.ItemIndex = 1);
    lblValorCondenacao.Visible := (CdsLitis.FieldByName('INDTESTEMUNHA').asInteger = 3) and (rgSituacao.ItemIndex = 1);

  end;
end;

procedure TfrmCustomCadProcesso.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert,dsEdit]) and (dblckTipObj.CanFocus) then
    dblckTipObj.SetFocus;
end;

procedure TfrmCustomCadProcesso.dsEtapaStateChange(Sender: TObject);
begin
  if (CdsEtapa.State in [dsInsert,dsEdit]) and (dblckTipoEtp.CanFocus) then
    dblckTipoEtp.SetFocus;
end;

procedure TfrmCustomCadProcesso.CdsBeforeInsert(DataSet: TDataSet);
begin
  Cds.Data := CtrlProcessoTrab.ListProcesso(-1);
  inherited;
end;

procedure TfrmCustomCadProcesso.CdsEtapaAfterScroll(DataSet: TDataSet);
begin
  dtedDataReal.Text := '';
  mskedHora.Text := '';
  if not(CdsEtapa.FieldByName('DATAREALOCOR').IsNull) then
  begin
    dtedDataReal.Date := StrToDate(DateToStr(CdsEtapa.FieldByName('DATAREALOCOR').asDateTime));
    mskedHora.Text := Copy(CdsEtapa.FieldByName('DATAREALOCOR').asString,12,5);
  end;
end;

procedure TfrmCustomCadProcesso.CdsDetBeforeEdit(DataSet: TDataSet);
begin
  if (CdsDet.FieldByName('VALORSENTENCA').asFloat = 0) then
    dValAntes := CdsDet.FieldByName('VALORPROVAVEL').asFloat
  else
    dValAntes := CdsDet.FieldByName('VALORSENTENCA').asFloat;
end;

procedure TfrmCustomCadProcesso.CdsEtapaBeforeEdit(DataSet: TDataSet);
begin
  dValAntes := CdsEtapa.FieldByName('VALORCUSTAS').asFloat;
  IdImovelAntes := CdsEtapa.FieldByName('IDIMOVEL').asFloat;
end;

procedure TfrmCustomCadProcesso.dbedPercChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert,dsEdit]) then
  try
    dbedValor.OnChange := nil;
    dbedValor.Value := FU.Arredondar((dbedValRecl.Value * dbedPerc.Value) / 100,2);
    if (CdsParamRH.FieldByName('FLGPERCPROB').asInteger = 1) then  // sobre Estim.Original
      dbedValor.Value := FU.Arredondar((dbedValor.Value * dbedValProbOrig.Value) / 100,2);
    dbedValor.OnChange := dbedValorChange;
  except
  end;
end;

procedure TfrmCustomCadProcesso.dbedValorChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert,dsEdit]) then
  try
    dbedPerc.OnChange := nil;
    dbedPerc.Value := FU.Arredondar((dbedValor.Value * 100) / dbedValRecl.Value,4);
    if (CdsParamRH.FieldByName('FLGPERCPROB').asInteger = 1) then  // sobre Estim.Original
      dbedPerc.Value := FU.Arredondar((dbedValor.Value * 100) / dbedValorOrig.Value,4);
    dbedPerc.OnChange := dbedPercChange;
  except
  end;
end;

procedure TfrmCustomCadProcesso.dbedValorOrigChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert,dsEdit]) then
  try
    dbedValProbOrig.Value := FU.Arredondar((dbedValorOrig.Value * 100) / dbedValRecl.Value,4);
  except
  end;
end;

procedure TfrmCustomCadProcesso.dbedValProbOrigChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert,dsEdit]) then
  try
    dbedValorOrig.Value := FU.Arredondar((dbedValRecl.Value * dbedValProbOrig.Value) / 100,2);
  except
  end;
end;

procedure TfrmCustomCadProcesso.rgSituacaoChange(Sender: TObject);
var
  bOk: boolean;
begin
  if (Cds.State <> dsEdit) or (iSituacao_Original = rgSituacao.ItemIndex) then
    exit;

  if (rgSituacao.ItemIndex = 0) then
  begin
    bOk := (MsgDlg('Deseja Reabrir o Processo?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes);

    if (bOk) then
    begin
      Cds.FieldByName('FLGSITPROC').asInteger := 0;
      Cds.FieldByName('DATAEFETENC').Clear;
      bbtnConfirmarClick(rgSituacao);
    end
    else
    begin
      rgSituacao.OnChange := nil;
      rgSituacao.ItemIndex := 1;
      rgSituacao.OnChange := rgSituacaoChange;
    end;
  end
  else
  begin
    bOk := (MsgDlg('Deseja Encerrar o Processo?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes);

    if (bOk) then
    begin
      Cds.FieldByName('DATAEFETENC').asDateTime := Date;
      rgTipEncer.ItemIndex := 0;

      tb97BotoesDetalhe.Visible := false;
      pgctrlDetalhe.ActivePage := tbshEncer;
      tbcDetalhe.TabIndex := 7;
      tbcDetalhe.Repaint;
      tbcDetalheChange(Sender);

      bAlterouValores := true;
      CtrlProcessoTrab.ZerarValoresProcesso;
    end
    else
    begin
      bbtnCancelarClick(rgSituacao);
      rgSituacao.OnChange := nil;
      rgSituacao.ItemIndex := 0;
      rgSituacao.OnChange := rgSituacaoChange;
    end;
  end;

  if (bOk) then
  begin
    iSituacao_Original := rgSituacao.ItemIndex;
    HabilitarDadosEncerramento(rgSituacao.ItemIndex);
    HabilitarPastaIntegracao;
  end;  
end;

procedure TfrmCustomCadProcesso.dbreCustoChange(Sender: TObject);
begin
  inherited;
  // Somente para ser sobreposto nas classes-filho
end;

procedure TfrmCustomCadProcesso.dblckMotivoContraparteChange(Sender: TObject);
begin
  if (Trim(dblckMotivoContraparte.Text) = '') then
    lblSitContraparte.Caption := 'Normal'
  else
    lblSitContraparte.Caption := 'Excl. Por';

  dbedDataAltSit.Enabled := (Trim(dblckMotivoContraparte.Text) <> '');
end;

procedure TfrmCustomCadProcesso.dblckMotivoContraparteCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (modified) and (Cds.State <> dsBrowse) then
  begin
    if (Trim(dblckMotivoContraparte.Text) <> '') then
      Cds.FieldByName('DATAALTSIT').asString := DateToStr(Date)
    else
      Cds.FieldByName('DATAALTSIT').Clear;
  end;

  if (modified) and (Trim(dblckMotivoContraparte.Text) <> '') and (not CdsLitis.IsEmpty) and
     (MsgDlg('Deseja Substituir a Contraparte por um Litisconsorte ?', 'Confirmação',
               mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    // Rotina de Substituição da Contraparte
    bbtnSubstituirContraparte.Visible := True;
    pgctrlDetalhe.ActivePage := tbsLitisconsortes;
    tbcDetalhe.TabIndex := 1;
    tbcDetalhe.Repaint;
    tbcDetalheChange(Sender);
    MsgDlg('Selecione o Litisconsorte Desejado e Clique "Substituir Contraparte".',
      'Aviso', mtInformation, [mbOk, mbHelp], 0);
  end;
end;

procedure TfrmCustomCadProcesso.dblckMotivoLitChange(Sender: TObject);
begin
  if (Trim(dblckMotivoLit.Text) = '') then
    lblSitLit.Caption := 'Normal'
  else
    lblSitLit.Caption := 'Excl. Por';

  dbedDataAltSitLitis.Enabled := (Trim(dblckMotivoLit.Text) <> '');
end;

procedure TfrmCustomCadProcesso.dbrgIndTaxaConvChange(Sender: TObject);
begin
  gbxIndice.Visible := (dbrgIndTaxaConv.ItemIndex = 0);
  gbxRegra.Visible := (dbrgIndTaxaConv.ItemIndex = 1);
  if (Cds.State in [dsInsert,dsEdit]) then
  begin
    if not(gbxIndice.Visible) then
      Cds.FieldByName('MOEDAPROCTRAB').Clear;
    if not(gbxRegra.Visible) then
      Cds.FieldByName('IDREGRA').Clear;
  end;
  dbreCustoChange(nil);
end;

procedure TfrmCustomCadProcesso.rgTipEncerChange(Sender: TObject);
begin
  dbrgIndCondenacao.Visible := (rgTipEncer.ItemIndex in [1,3]) and
    ((Cds.FieldByName('FLGSITPROC').asInteger = 1) or (rgSituacao.ItemIndex = 1)) and
    (CtrlProcessoTrab.ContaNossaLitisconsorte(Cds.FieldByName('NumProcTrab').asFloat) > 0);

  if (Cds.State in [dsInsert,dsEdit]) then
  begin
    if not(CdsDet.IsEmpty) and (rgTipEncer.ItemIndex in [1,3]) then
    begin
      if (TfrmValorRealMT.ExibirCalculoValorReal(CdsDet)) then
      begin
        // Atualizar custo do processo somando todos os valores dos objetos
        Cds.FieldByName('CUSTOPROC').asFloat := 0;
        CdsDet.First;
        while not(CdsDet.EOF) do
        begin
          Cds.FieldByName('CUSTOPROC').asFloat := Cds.FieldByName('CUSTOPROC').asFloat +
            CdsDet.FieldByName('VALORSENTENCA').asFloat;
          CdsDet.Next;
        end;
        CdsDet.First;

        // Atualizar custo do processo subtraindo todos os valores das etapas
        CdsEtapa.First;
        while not(CdsEtapa.EOF) do
        begin
          Cds.FieldByName('CUSTOPROC').asFloat := Cds.FieldByName('CUSTOPROC').asFloat +
              CdsEtapa.FieldByName('VALORCUSTAS').asFloat;
          CdsEtapa.Next;
        end;
        CdsEtapa.First;

        // Custo do processo não pode ficar negativo
        if (Cds.FieldByName('CUSTOPROC').asFloat < 0) then
          Cds.FieldByName('CUSTOPROC').asFloat := 0;

        FormatarCampoCdsObjetos;
        bAlterouValores := true;
      end
      else
        MsgDlg('Não Esqueça de Atualizar os Valores Reais dos Objetos.',
          'Aviso', mtInformation, [mbOk, mbHelp], 0);
    end;
    HabilitarTipoEncerramento(rgSituacao.ItemIndex, rgTipEncer.Values[rgTipEncer.ItemIndex]);
  end;
end;

procedure TfrmCustomCadProcesso.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  Dock973.Visible := (tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex] <> '');
  bbtnVerHistObjeto.Visible := (tbcDetalhe.TabIndex = 3) and (not CdsDet.Eof);
end;

procedure TfrmCustomCadProcesso.ProcuraCidadeValidaDados(Sender: TObject);
begin
  MudarDadosCidade;
end;

procedure TfrmCustomCadProcesso.dblckMoedaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (Modified) then
    dbreCustoChange(nil);
end;

procedure TfrmCustomCadProcesso.dblckRegraNormalCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if (Modified) then
    dbreCustoChange(nil);
end;

procedure TfrmCustomCadProcesso.dbedNumJCJExit(Sender: TObject);
begin
  inherited;
  if (ds.State = dsInsert) and (Trim(dbedNumJCJ.Text) <> '') then
    if (CtrlProcessoTrab.VerificaNumProcesso(Trim(dbedNumJCJ.Text))) then
      MsgDlg('Existe Processo com esse número.' +CR_LF+
             'Sugiro verificar em Consulta Processo de Qualquer Matéria',
             'Aviso', mtInformation, [mbOk,mbHelp], 0);
end;

procedure TfrmCustomCadProcesso.spbtnCalcNumContraparteClick(Sender: TObject);
begin
  CtrlProcessoTrab.SetNumContraparte;
end;

procedure TfrmCustomCadProcesso.spbtnProcLitisconsorteClick(Sender: TObject);
begin
  if (CdsLitis.State in [dsInsert,dsEdit]) and (frmProcuraPessoaDoc.ShowModal = mrOk) then
  begin
    if (CdsLitis.State = dsInsert) then
    begin
      CdsOutroProc.Data := CtrlProcessoTrab.VerificaContraParte(frmProcuraPessoaDoc.sIDPessoa);
      if not(CdsOutroProc.IsEmpty) then
      begin
        townOutroProc.Top := 200;
        townOutroProc.BringToFront;
        townOutroProc.Visible := true;
        Self.Enabled := false;
      end;
    end;
    CdsLitis.FieldByName('IDPESSOA').asString := frmProcuraPessoaDoc.sIDPessoa;
    edLitisconsorte.Text := frmProcuraPessoaDoc.sNomePessoa;
  end;
end;

procedure TfrmCustomCadProcesso.spbtnProcContraparteClick(Sender: TObject);
begin
  if (Cds.State in [dsInsert,dsEdit]) and (frmProcuraPessoaDoc.ShowModal = mrOk) then
  begin
    if (Cds.State = dsInsert) then
    begin
      CdsOutroProc.Data := CtrlProcessoTrab.VerificaContraParte(frmProcuraPessoaDoc.sIDPessoa);
      if not(CdsOutroProc.IsEmpty) then
      begin
        townOutroProc.Top := 200;
        townOutroProc.BringToFront;
        townOutroProc.Visible := true;
        Self.Enabled := false;
      end;
    end;
    Cds.FieldByName('IDRECLAMANTE').asString := frmProcuraPessoaDoc.sIDPessoa;
    OnMudarDadosParticipante;
    MudarNomeSubConta(edNomeContraparte.Text);
  end;
end;

procedure TfrmCustomCadProcesso.btnFecharDicaClick(Sender: TObject);
begin
  inherited;
  Self.Enabled := true;
  townOutroProc.Visible := false;
end;

procedure TfrmCustomCadProcesso.sbtnFichaClick(Sender: TObject);
begin
  ImprimeFichaProc(dbedNumProcesso.Text, edNomeContraparte.Text, CMProcuraAdv2.Text);
end;

procedure TfrmCustomCadProcesso.ImprimeFichaProc(const NumProcesso, NomeContraparte, NossoAdv: string);
var
  c: integer;
  Frm: TfrmCustomParamFichaProc;
  Rpt: TFrmCmReport;
begin
  // Criar Form de Parâmetros de acordo com o módulo
  Frm := TfrmCustomParamFichaProc(CriarTelaParamFichaProc);
  try
    CopiarDadosMontaSelect(MontaSelect, Frm.MontaSelect);
    Frm.MontaSelect.SensivelACaixa[0] := 'S';
    Frm.MontaSelect.ItemsBusca.Add(edNomeContraparte.Text);
    Frm.edNumero.Text := dbedNumProcesso.Text;
    Frm.edNomeContraparte.Text := edNomeContraparte.Text;
    Frm.NomeNossoAdvog := CMProcuraAdv2.Text;
    Frm.OnClose := FormCloseParamFichaProc;

    OnParamFichaProc(Frm); // Indicar Parâmetros de acordo com o módulo

    Frm.HabilitarBtOk;
    if (Frm.ShowModal = mrOk) then
    begin
      Rpt := CriarFichaProc; // Criar Relatório de acordo com o módulo
      try
        Rpt.CrmRptCM.IdReports := Frm.IdReports;
        Rpt.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
        Rpt.CrmRptCM.OrigemCM := 1;
        Rpt.CrmRptCM.IdModulo := Sistema.IdModulo;
        Rpt.CrmRptCM.IdUsuario := Sistema.IdUsuario;
        for c:=0 to Frm.Cmp_Padrao.Params.Count-1 do
          Rpt.CmpRptCM.ParamValues[c].Value := Frm.Cmp_Padrao.ParamValues[c].Value;
        Rpt.CrmRptCM.Print;
      finally
        Rpt.Free;
      end;
    end;
  finally
    Frm.Free;
  end;
end;

procedure TfrmCustomCadProcesso.sbtnProcurarClick(Sender: TObject);
begin
  if (TComponent(Sender).Name = 'sbtnProcurar') then
    MontarMontaSelect;
  inherited;
end;

procedure TfrmCustomCadProcesso.sbtnProcurarLitisClick(Sender: TObject);
begin
  MontaSelect.UsaDistinct := true;
  MontaSelect.Caption := 'Seleciona Processo Incluindo Litisconsortes';

  MontaSelect.Filtro.Clear;

  MontaSelect.CamposChave.Clear;
  MontaSelect.CamposChave.Add('PROCESSOTRAB.NUMPROCTRAB');

  MontaSelect.Tabelas.Clear;
  MontaSelect.Tabelas.Add('PESSOA');
  MontaSelect.Tabelas.Add('PROCESSOTRAB');
  MontaSelect.Tabelas.Add('COPARTPROCTRAB');
  MontaSelect.Tabelas.Add('VARAJUSTICA');

  OnClick_ProcurarProcessoComLitisconsortes;

  MontaSelect.Filtro.Add('(PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA) OR (COPARTPROCTRAB.IDPESSOA = PESSOA.IDPESSOA)');
  MontaSelect.Filtro.Add('PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)');
  MontaSelect.Filtro.Add('PROCESSOTRAB.NUMPROCTRAB   = COPARTPROCTRAB.NUMPROCTRAB(+)');

  sbtnProcurarClick(Sender);
  sbtnProcurarLitis.Down := false;
end;

procedure TfrmCustomCadProcesso.bbtnParcelamentoClick(Sender: TObject);
begin
  if (rgTipEncer.ItemIndex = 1) and (sbspeParc.Value < 1) then
  begin
    sbspeParc.SetFocus;
    MsgDlg('Informe o Número de Parcelas a Pagar.', 'Informação', mtInformation, [mbOk,mbHelp], 0);
  end
  else
    ExibirParcelasDoProcesso(Cds.FieldByName('NUMPROCTRAB').asFloat, Round(sbspeParc.Value),
      dbedEncerr.Date, CdsDet.Data);
end;

procedure TfrmCustomCadProcesso.spbProcVincClick(Sender: TObject);
begin
  MontaSelectProcVinc.Executar;
  if (MontaSelectProcVinc.RetornouValor) then
  begin
    Cds.FieldByName('IDPROCVINCULADO').asFloat := StrToFloat(MontaSelectProcVinc.ValoresChave[0]);
    spbApagaVinc.Enabled := true;
  end;
end;

procedure TfrmCustomCadProcesso.spbApagaVincClick(Sender: TObject);
begin
  if (MsgDlg('Confirma a Excluão do Vínculo?', 'Confirmação',
             mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    Cds.FieldByName('IDPROCVINCULADO').Clear;
    Cds.FieldByName('FLGVINCULADO').Clear;
    spbApagaVinc.Enabled := false;
  end;
end;

procedure TfrmCustomCadProcesso.bbtnOkDetClick(Sender: TObject);
begin
  bOkDetalhe := false;
  case (pgctrlDetalhe.ActivePageIndex) of
    1 : if not(OnClick_OkDetalheLitisconsortes) then exit; // Litisconsortes
    3 : if not(OnClick_OkDetalheObjetos) then exit; // Objetos
    4 : if not(OnClick_OkDetalheEtapas) then exit; // Etapas
    5 : if not(OnClick_OkDetalheHonor) then exit; // Honorários
  end;

  if (pgctrlDetalhe.ActivePageIndex = 3) then
  try
    StrToDate(dbedDataAval.Text);
  except
    exit;
  end;

  case (pgctrlDetalhe.ActivePageIndex) of
    3 : // Objetos
    begin
      if (DataAvalAntes > dbedDataAval.Date) and (dsDet.State = dsEdit) then
      begin
        MsgDlg('Você não deve retroagir a data (de '+DateToStr(DataAvalAntes)+
               ' para '+ DateToStr(dbedDataAval.Date) + ')',
          'Aviso', mtInformation, [mbOk, mbHelp], 0);
        CdsDet.FieldByName('DATAAVAL').asDateTime := DataAvalAntes;
        dbedDataAval.Update;
        dbedDataAval.SetFocus;
        exit;
      end;
    end;
  end;


  inherited;

  case (pgctrlDetalhe.ActivePageIndex) of
    3 : // Objetos
    begin
      bAlterouValores := true;
      HabilitarPastaIntegracao;
    end;
    4 : // Etapas
    begin
      edLitisconsorte.Text := '';
      if bEncerrar then
      begin
        if dsEtapa.State = dsInsert then
          bbtnCancelarDetClick(Self);
        rgSituacao.ItemIndex := 1;
      end;
    end;
  end;

  bOkDetalhe := true;
end;

procedure TfrmCustomCadProcesso.bbtnCancelarDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsEtapas) and (CdsEtapa.State = dsInsert) then
    Dec(iNumSeqAtual);
  inherited;
end;

procedure TfrmCustomCadProcesso.bbtnVoltarDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsEtapas) and (CdsEtapa.State = dsInsert) then
    Dec(iNumSeqAtual);
  inherited;
end;

procedure TfrmCustomCadProcesso.bbtnConfirmarClick(Sender: TObject);
var
  bInserir: boolean;
  sRecPag: string;
  dValorObj, dValorDep, dValorPen, dValorCon, dValorLev: double;
  _CdsAux: TCMClientDataSet;
begin
  if (Trim(dbedNumJCJ.Text) = '') then
  begin
    MsgDlg('Número do Processo Não Informado', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dbedNumJCJ.SetFocus;
    exit;
  end;

  if (Trim(edNomeContraparte.Text) = '') then
  begin
    MsgDlg('Contraparte Não Identificada', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    gbxContraparte.SetFocus;
    exit;
  end;

  if (Trim(dblckVara.Text) = '') then
  begin
    tbcDetalhe.TabIndex := 2;
    tbcDetalhe.Repaint;
    tbcDetalheChange(Sender);

    pgCtrlOutrosDados.ActivePage := tbsInstancias;
    MsgDlg('Vara Não Identificada', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dblckVara.SetFocus;
    exit;
  end;

  if (Trim(DataNotificacao.Text) = '') then
  begin
    if (Sistema.IdModulo <> PROCPREV) and (Sistema.IdModulo <> PROCJUD) and
       (Sistema.IdModulo <> MODCON) then
    begin
      tbcDetalhe.TabIndex := 2;
      tbcDetalhe.Repaint;
      tbcDetalheChange(Sender);
      pgCtrlOutrosDados.ActivePage := tbshTipos;
    end;
    MsgDlg('Data da Notificação Não Identificada', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    DataNotificacao.SetFocus;
    exit;
  end;

  if (Trim(DataAjuizamento.Text) = '') then
  begin
    if (Sistema.IdModulo <> PROCPREV) and (Sistema.IdModulo <> PROCJUD) and
       (Sistema.IdModulo <> MODCON) then
    begin
      tbcDetalhe.TabIndex := 2;
      tbcDetalhe.Repaint;
      tbcDetalheChange(Sender);
      pgCtrlOutrosDados.ActivePage := tbshTipos;
    end;
    MsgDlg('Data do Ajuizamento Não Identificada', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    DataAjuizamento.SetFocus;
    exit;
  end;

  if (Trim(dblckTipProc.Text) = '') then
  begin
    tbcDetalhe.TabIndex := 2;
    tbcDetalhe.Repaint;
    tbcDetalheChange(Sender);

    pgCtrlOutrosDados.ActivePage := tbshTipos;
    MsgDlg('Tipo de Processo Não Identificado', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dblckTipProc.SetFocus;
    exit;
  end;

  if (Trim(ProcuraCidade.Text) = '') then
  begin
    tbcDetalhe.TabIndex := 2;
    tbcDetalhe.Repaint;
    tbcDetalheChange(Sender);

    pgCtrlOutrosDados.ActivePage := tbshTipos;
    MsgDlg('Cidade/Estado Onde Corre o Processo Não Identificados', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    ProcuraCidade.SetFocus;
    exit;
  end;

  if (dbredJuros.Value = 0) and (Trim(dbdtJuros.Text) <> '') then
  begin
    tbcDetalhe.TabIndex := 2;
    tbcDetalhe.Repaint;
    tbcDetalheChange(Sender);
    pgCtrlOutrosDados.ActivePage := tbshValores;
    MsgDlg('Taxa de Juros Não Informada', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dbredJuros.SetFocus;
    exit;
  end;

  if (dbredJuros.Value > 0) and (Trim(dbdtJuros.Text) = '') then
  begin
    tbcDetalhe.TabIndex := 2;
    tbcDetalhe.Repaint;
    tbcDetalheChange(Sender);
    pgCtrlOutrosDados.ActivePage := tbshValores;
    MsgDlg('Data Inic. Juros Não Identificada', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dbdtJuros.SetFocus;
    exit;
  end;

  if (dbrgIndTaxaConv.ItemIndex = 0) and (Trim(dblckMoeda.Text) = '') then
  begin
    tbcDetalhe.TabIndex := 2;
    tbcDetalhe.Repaint;
    tbcDetalheChange(Sender);
    pgCtrlOutrosDados.ActivePage := tbshValores;
    MsgDlg('Indice de Atualização Monetária Não Identificado', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dblckMoeda.SetFocus;
    exit;
  end;

  if (dbrgIndTaxaConv.ItemIndex = 1) and (Trim(dblckRegraNormal.Text) = '') then
  begin
    tbcDetalhe.TabIndex := 2;
    tbcDetalhe.Repaint;
    tbcDetalheChange(Sender);
    pgCtrlOutrosDados.ActivePage := tbshValores;
    MsgDlg('Regra de Cálculo da Atualização Monetária Não Identificada', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dblckRegraNormal.SetFocus;
    exit;
  end;

  // Se um dos detalhes estiver em edição, executar primeiro o Ok deste
  if (CdsLitis.State in [dsInsert, dsEdit]) then
    _CdsAux := CdsLitis
  else
  if (CdsDet.State in [dsInsert, dsEdit]) then
    _CdsAux := CdsDet
  else
  if (CdsEtapa.State in [dsInsert, dsEdit]) then
    _CdsAux := CdsEtapa
  else
    _CdsAux := nil;

  if Assigned(_CdsAux) then
  begin
    bbtnOkDetClick(Sender);
    if not(bOkDetalhe) then
      exit;
    _CdsAux.Delete;
  end;

  // Deve ter pelo menos um objeto com valor
  dValorObj := 0;
  CdsDet.First;
  while not CdsDet.Eof do
  begin
    dValorObj := dValorObj + CdsDet.FieldByName('VALORRECL').asFloat;
    CdsDet.Next;
  end;
  CdsDet.First;
  if (dValorObj = 0) then
  begin
    tbcDetalhe.TabIndex := 3;
    tbcDetalhe.Repaint;
    tbcDetalheChange(Sender);
    MsgDlg('Deve existir pelo menos um objeto com valor', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  //

  if (dbredJuros.Value = 0) and (Trim(dbdtJuros.Text) = '') and
     (bExibeMensagens) and
     (MsgDlg('Tem certeza de que não haverá cálculo de Juros ?', 'Confirmação',
               mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
  begin
    tbcDetalhe.TabIndex := 2;
    tbcDetalhe.Repaint;
    tbcDetalheChange(Sender);
    pgCtrlOutrosDados.ActivePage := tbshValores;
    dbredJuros.SetFocus;
    exit;
  end;

  // Verifica Depósitos vs ((Levantamento + Convolação)
  dValorDep := 0;
  dValorPen := 0;
  dValorCon := 0;
  dValorLev := 0;
  CdsEtapa.First;
  while not CdsEtapa.Eof do
  begin
    if (CdsEtapa.FieldByName('FLGVALORABATE').asInteger = 1) then
      dValorDep := dValorDep + CdsEtapa.FieldByName('VALORREC').asFloat;

    if (CdsEtapa.FieldByName('FLGVALORABATE').asInteger = 2) and
        (CdsEtapa.FieldByName('INDPENHORA').asInteger = 4) then
      dValorPen := dValorPen + CdsEtapa.FieldByName('VALORREC').asFloat;

    if (CdsEtapa.FieldByName('FLGVALORABATE').asInteger = 3) then
      dValorLev := dValorLev + CdsEtapa.FieldByName('VALORREC').asFloat;

    if (CdsEtapa.FieldByName('FLGVALORABATE').asInteger = 4) then
      dValorCon := dValorCon + CdsEtapa.FieldByName('VALORREC').asFloat;

    CdsEtapa.Next;
  end;
  CdsEtapa.First;
  if (dValorLev+dValorCon > 0) and (dValorLev+dValorCon <> dValorDep+dValorPen) and
     (bExibeMensagens) and
     (MsgDlg('Encontrei os seguintes valores: '+CR_LF+
               'Depósitos'+#9+#9+'= '+FormatFloat('###,###,##0.00',dValorDep)+CR_LF+
               'Penhoras de Numerário'+#9+'= '+FormatFloat('###,###,##0.00',dValorPen)+CR_LF+
               'Levantamentos'+#9+#9+'= '+FormatFloat('###,###,##0.00',dValorLev)+CR_LF+
               'Convolações'+#9+#9+'= '+FormatFloat('###,###,##0.00',dValorCon)+CR_LF+
               'Existe diferença de '+FormatFloat('###,###,##0.00',dValorDep+dValorPen-dValorCon-dValorLev) +CR_LF+
               'considerando Depósitos + Penhoras de Numerário - Levantamentos - Convolações. Confirma ?', 'Confirmação',
               mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
  begin
    tbcDetalhe.TabIndex := 4;
    tbcDetalhe.Repaint;
    tbcDetalheChange(Sender);
    exit;
  end;
  //

  if (not bExibeMensagens) and
     (bFazContab) and (Trim(dblckTipOper.Text) = '') then
    bFazContab := false;

  if (not bExibeMensagens) and
     ((bFazCAPCAR) and ((Trim(dblckTipoDoc.Text) = '') or
                        (Trim(dblckTipoDesemb.Text) = ''))) then
    bFazCAPCAR := false;

  if (bExibeMensagens) and
     (((bFazContab) and (Trim(dblckTipOper.Text) = '')) or
      ((bFazCAPCAR) and ((Trim(dblckTipoDoc.Text) = '') or
                         (Trim(dblckTipoDesemb.Text) = '')))) then
  begin
    tb97BotoesDetalhe.Visible := false;
    pgCtrlOutrosDados.ActivePage := tbshIntegracao;
    pgctrlDetalhe.ActivePage := tbshOutrosDados;

    tbcDetalhe.TabIndex := tbshOutrosDados.PageIndex;
    tbcDetalhe.Repaint;
    MsgDlg('Caso deseje, Complemente os dados requeridos para a integração'+CR_LF+
           'Contábil e/ou do ' +gbxCAPCAR.Caption,
           'Informação', mtInformation, [mbOk,mbHelp], 0);
  end
  else
  begin
    if (Cds.State = dsInsert) and not(Cds.FieldByName('DATANOTIF').IsNull) then
      Cds.FieldByName('DATAPREVENCER').asDateTime :=
        Cds.FieldByName('DATANOTIF').asDateTime + Int(365.25 * 5);

    // Quando o Módulo usado for PROCPREV ou PROCJUD ou SISTJURCONS deve-se verificar se o Tipo de Documento
    // selecionado para a Integração é compatível com o Documento a ser gerado (CAP ou CAR),
    // caso contrário, emitir uma mensagem de erro.
    if (bAlterouValores) and (bFazCAPCAR) then
    begin
      case (Sistema.IdModulo) of
        PROCPREV,PROCJUD, SISTJURCONS :
        begin
          sRecPag := CtrlProcessoTrab.GetRecPag;
          if (sRecPag <> CdsTipoDoc.FieldByName('RECPAG').asString[1]) then
          begin
            MsgDlg('Tipo de Documento não compatível com a integração a ser realizada.'+CR_LF+
               'Você deve selecionar um Tipo de Documento relativo ao Contas a ' +
               FU.IFF(sRecPag='P', 'Pagar', 'Receber'),
               'Aviso', mtWarning, [mbOk,mbHelp], 0);
            exit;
          end;
        end;
        MODCON : CtrlProcessoTrab.SetRecPag('P');
      end;
    end;
    bInserir := (Cds.State = dsInsert);
    inherited;
    if (bInserir) then
    begin
      if (MsgDlg('Deseja que seja gerada a ficha do processo ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        bbtnCancelarClick(Self);
        Sel(true, CtrlProcessoTrab.NumProcTrab);
        sbtnFicha.Click;
      end;
    end;
  end;

  bExibeMensagens := false;
end;

procedure TfrmCustomCadProcesso.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if (Assigned(Self.ActiveControl)) and
     (TComponent(Self.ActiveControl).Name = 'bbtnCancelar') and
     (Cds.FieldByName('NUMPROCTRAB').asFloat > 0) then
    Sel(true, Cds.FieldByName('NUMPROCTRAB').asFloat)
  else
  begin
    HabilitarDadosEncerramento(Cds.FieldByName('FLGSITPROC').asInteger);
    OnMudarDadosParticipante;
  end;

  AcharUltimoNumSeq;
end;

procedure TfrmCustomCadProcesso.dblckTipoEtpChange(Sender: TObject);
begin
  inherited;
  btnPenhora.Enabled := (CdsTipoEtapa.FieldByName('FLGPENHORA').asInteger = 1);
  if (CdsTipoEtapa.FieldByName('FLGPENHORA').asInteger = 1) then
    dbrgAbate.ItemIndex := 1;
  if (CdsTipoEtapa.FieldByName('VALORHONOR').asFloat <> 0)  then
  begin
    lblHonor.Visible := true;
    redHonor.Visible := true;
    if sbtnInsDet.Down then
      redHonor.Value := CdsTipoEtapa.FieldByName('VALORHONOR').asFloat;
    //dbedAssunto.Width := 462;
  end
  else
  begin
    lblHonor.Visible := false;
    redHonor.Visible := false;
    redHonor.Value := 0;
    //dbedAssunto.Width := 624;
  end;
end;

procedure TfrmCustomCadProcesso.btnPenhoraClick(Sender: TObject);
begin
  if  dtedDataReal.Text <> '' then
    if (mskedHora.Text = '  :  ') then
      CdsEtapa.FieldByName('DATAREALOCOR').asDateTime := dtedDataReal.Date
    else
      CdsEtapa.FieldByName('DATAREALOCOR').asDateTime := dtedDataReal.Date +
        StrToTime(mskedHora.Text);

  if CdsEtapa.FieldByName('DATAREALOCOR').IsNull then
  begin
    MsgDlg('Informe a Data da Penhora, antes de abrir esta tela', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dtedDataReal.SetFocus;
    exit;
  end;

  if not(Assigned(frmCadRegPenhora)) then
    frmCadRegPenhora := TfrmCadRegPenhora.Create(Application);

  frmCadRegPenhora.ExibirTelaPenhora(CdsEtapa);
end;

procedure TfrmCustomCadProcesso.CdsHonorBeforeDelete(DataSet: TDataSet);
begin
  // Atualizar Total de Despesas
  Cds.FieldByName('DESPESAPROC').asFloat :=
    Cds.FieldByName('DESPESAPROC').asFloat - CdsHonor.FieldByName('VALORHONOR').asFloat;
  dValHonorAntes := 0;
  inherited;
end;

procedure TfrmCustomCadProcesso.dsHonorStateChange(Sender: TObject);
begin
  inherited;
  if (CdsHonor.State in [dsInsert,dsEdit]) then
    dtPagamentoHonor.SetFocus;
end;

procedure TfrmCustomCadProcesso.CdsHonorBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  dValHonorAntes := CdsHonor.FieldByName('VALORHONOR').asFloat;
end;

procedure TfrmCustomCadProcesso.cbxSucumbenciaClick(Sender: TObject);
begin
  dbrgIndHonor.Visible := cbxSucumbencia.Checked;
  redValorTotal.Visible := cbxSucumbencia.Checked;

  if (cbxSucumbencia.Checked) then
    CdsAdvog.Data := CtrlProcessoTrab.ListAdvogadosDaContraParte(Cds.FieldByName('NUMPROCTRAB').asFloat)
  else
    CdsAdvog.Data := CtrlProcessoTrab.ListAdvogadosDoProcesso(Cds.FieldByName('NUMPROCTRAB').asFloat);
end;

procedure TfrmCustomCadProcesso.CdsEtapaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  IdImovelAntes := 0;
end;

procedure TfrmCustomCadProcesso.CdsEtapaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (IdImovelAntes <> CdsEtapa.FieldByName('IDIMOVEL').asFloat) or
     ((CdsEtapa.FieldByName('IDIMOVEL').asFloat > 0) and
      (CdsEtapa.FieldByName('VALORREC').asFloat < 0)) then
  begin
    if (CdsEtapa.FieldByName('IDIMOVEL').asFloat > 0) and
       (CdsEtapa.FieldByName('VALORREC').asFloat > 0) then // Início de Penhora
    begin
      CtrlProcessoTrab.AtualizarImovel(CdsEtapa.FieldByName('IDIMOVEL').asFloat, true);
      CtrlProcessoTrab.InserirEventoImovel(
        CdsEtapa.FieldByName('IDIMOVEL').asFloat,
        CdsEtapa.FieldByName('DATAREALOCOR').asDateTime, //EviData
        True,
        copy(CdsEtapa.FieldByName('OBSERVETAPA').asString,1,2000),
        FU.IFF(CdsEtapa.FieldByName('INDVALOR').asInteger=3,CdsEtapa.FieldByName('VALOR').asFloat,100), //EviPercent
        CdsEtapa.FieldByName('VALORREC').asFloat) //EviVlrAjustado
    end;

    // Término de Penhora
    if ((IdImovelAntes > 0) and                       // Por Exclusão da Etapa
        (CdsEtapa.FieldByName('IDIMOVEL').asFloat = 0)) or
       ((IdImovelAntes = 0) and                       // Por Desconstituição em Nova Etapa
        (CdsEtapa.FieldByName('IDIMOVEL').asFloat > 0) and
        (CdsEtapa.FieldByName('VALORREC').asFloat < 0)) then
    begin
      CtrlProcessoTrab.AtualizarImovel(FU.IFF(IdImovelAntes > 0,IdImovelAntes,
        CdsEtapa.FieldByName('IDIMOVEL').asFloat), False);
      CtrlProcessoTrab.InserirEventoImovel(
        FU.IFF(IdImovelAntes > 0,IdImovelAntes,CdsEtapa.FieldByName('IDIMOVEL').asFloat),
        CdsEtapa.FieldByName('DATAREALOCOR').asDateTime, //EviData
        False,
        copy(CdsEtapa.FieldByName('OBSERVETAPA').asString,1,2000),
        0, //EviPercent
        0) //EviVlrAjustado
    end;
  end;

  // Término de Penhora por Desconstituição na Mesma Etapa
  if (IdImovelAntes > 0) and
     (IdImovelAntes = CdsEtapa.FieldByName('IDIMOVEL').asFloat) and
     (CdsEtapa.FieldByName('VALORREC').asFloat < 0) and
     (CdsEtapa.FieldByName('VALORREC').asFloat + frmCadRegPenhora.redValorPenhorado.Value = 0) then
  begin
    CtrlProcessoTrab.AtualizarImovel(IdImovelAntes, False);
    CtrlProcessoTrab.InserirEventoImovel(
      IdImovelAntes,
      CdsEtapa.FieldByName('DATAREALOCOR').asDateTime, //EviData
      False,
      copy(CdsEtapa.FieldByName('OBSERVETAPA').asString,1,2000),
      0, //EviPercent
      0) //EviVlrAjustado
  end;
end;

procedure TfrmCustomCadProcesso.CdsEtapaBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if (CdsEtapa.FieldByName('IDIMOVEL').asFloat > 0) then // Término de Penhora
  begin
    CtrlProcessoTrab.AtualizarImovel(CdsEtapa.FieldByName('IDIMOVEL').asFloat, False);
    CtrlProcessoTrab.InserirEventoImovel(
      CdsEtapa.FieldByName('IDIMOVEL').asFloat,
      CdsEtapa.FieldByName('DATAREALOCOR').asDateTime, //EviData
      False,
      'Penhora Excluída',
      0, //EviPercent
      0) //EviVlrAjustado
  end;
end;

procedure TfrmCustomCadProcesso.bbtnSubstituirContraparteClick(Sender: TObject);
var
  sGuardaIdPessoa, sGuardaNome, sGuardaIndTestemunha, sGuardaSit, sGuardaCat,
  sGuardaMotivo, sGuardaPlano, sGuardaPatro: string;
begin
  if (ds.State in [dsInsert, dsEdit]) then
  begin
    if (CdsLitis.FieldByName('SITUACAO').asString <> 'Normal') then
    begin
      MsgDlg('Selecione um Litisconsorte em Situação "Normal".',
        'Aviso', mtInformation, [mbOk, mbHelp], 0);
      exit;
    end;
    sGuardaIdPessoa := Cds.FieldByName('IDRECLAMANTE').AsString;
    sGuardaNome := edNomeContraparte.Text;
    sGuardaIndTestemunha := CdsLitis.FieldByName('INDTESTEMUNHA').AsString;
    sGuardaMotivo := Cds.FieldByName('IDMOTIVO').AsString;
    sGuardaPlano := Cds.FieldByName('IDPLANOPREV').AsString;
    sGuardaPatro := Cds.FieldByName('IDPATRO').AsString;
    sGuardaSit := dblckMotivoContraparte.Text;
    sGuardaCat := CdsLitis.FieldByName('CATEGORIA').AsString;
    Cds.FieldByName('IDRECLAMANTE').AsString := CdsLitis.FieldByName('IDPESSOA').AsString;
    edNomeContraparte.Text := CdsLitis.FieldByName('NOME').asString;
    sbtnExcluiDetClick(Self);
    bbtnSubstituirContraparte.Visible := False;
    Cds.FieldByName('IDMOTIVO').Clear;
    Cds.FieldByName('DATAALTSIT').Clear;
    if (MsgDlg('Deseja Colocar a ex-Contraparte como um Litisconsorte ?', 'Confirmação',
               mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      CdsLitis.Insert;
      CdsLitis.FieldByName('IDPESSOA').AsString := sGuardaIdPessoa;
      CdsLitis.FieldByName('NOME').AsString := sGuardaNome;
      CdsLitis.FieldByName('NUMPROCTRAB').AsString := Cds.FieldByName('NUMPROCTRAB').AsString;
      CdsLitis.FieldByName('INDTESTEMUNHA').AsString := sGuardaIndTestemunha;
      CdsLitis.FieldByName('IDMOTIVO').AsString := sGuardaMotivo;
      CdsLitis.FieldByName('SITUACAO').AsString := sGuardaSit;
      CdsLitis.FieldByName('CATEGORIA').AsString := sGuardaCat;

      if (Trim(sGuardaSit) <> '') then
        CdsLitis.FieldByName('DATAALTSIT').asString := DateToStr(Date)
      else
        CdsLitis.FieldByName('DATAALTSIT').Clear;

      CdsLitis.FieldByName('IDPLANPREVCTBPATR').AsString :=
        CtrlProcessoTrab.RetornaPlanoPatro(sGuardaPlano, sGuardaPatro);
      CdsLitis.Post;
    end;
  end;
end;

procedure TfrmCustomCadProcesso.CdsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  bbtnSubstituirContraparte.Visible := false;
  dbrgIndCondenacao.Visible :=
    ((Cds.FieldByName('TIPOENCER').asString = 'C') or
     (Cds.FieldByName('TIPOENCER').asString = 'S')) and
    ((Cds.FieldByName('FLGSITPROC').asInteger = 1) or (rgSituacao.ItemIndex = 1)) and
    (CtrlProcessoTrab.ContaNossaLitisconsorte(Cds.FieldByName('NUMPROCTRAB').asFloat) > 0);
  bbtnCondenacao.Visible := dbrgIndCondenacao.ItemIndex = 0; //in [0,1];
end;

procedure TfrmCustomCadProcesso.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  bbtnSubstituirContraparte.Visible := False;
end;

procedure TfrmCustomCadProcesso.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  bbtnSubstituirContraparte.Visible := False;
  CdsHistObjetoGravar.Data := CtrlHstObjProcTrab.ListGeral(-1,-1, 0);  
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCustomCadProcesso.Sel(SelPrincipal: boolean; NumProcTrab: double);
begin
  bExibeMensagens := true;

  Cds.DisableControls;
  CdsLitis.DisableControls;
  CdsDet.DisableControls;
  CdsEtapa.DisableControls;
  CdsProcVinc.DisableControls;
  CdsUF.DisableControls;

  if (SelPrincipal) then
  begin
    Cds.Data := CtrlProcessoTrab.ListProcesso(NumProcTrab);
    spbProcVinc.Enabled := false;
    spbApagaVinc.Enabled := false;
  end;

  CdsLitis.Data := CtrlProcessoTrab.ListDadosLitisconsortes(NumProcTrab);
  CdsDet.Data := CtrlProcessoTrab.ListObjetoXTipo(NumProcTrab,CdsParamRH.FieldByName('FLGPERCPROB').asInteger);
  CdsEtapa.Data := CtrlEtapaProcesso.ListEtapas(NumProcTrab);
  CdsHonorarios.Data := CtrlHonorarioProcesso.ListTabHonorarioEmBranco;
  CdsHonor.Data := CtrlHonorarioProcesso.ListHonorario(NumProcTrab);
  CdsProcVinc.Data := CtrlProcessoTrab.ListProcessosVinculados(NumProcTrab);
  CdsAdvog.Data := CtrlProcessoTrab.ListAdvogadosDoProcesso(NumProcTrab);
  MudarDadosCidade;

  dbreCustoChange(nil);
  OnMudarDadosParticipante;
  HabilitarPastaIntegracao;

  TFloatField(CdsHonor.FieldByName('VALORHONOR')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsEtapa.FieldByName('VALORREC')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsEtapa.FieldByName('VALORCUSTAS')).DisplayFormat := '###,###,##0.00';
  FormatarCampoCdsObjetos;

  dblckMotivoContraparteChange(nil);

  iSituacao_Original := Cds.FieldByName('FLGSITPROC').asInteger;
  HabilitarDadosEncerramento(Cds.FieldByName('FLGSITPROC').asInteger);
  HabilitarTipoEncerramento(iSituacao_Original, Cds.FieldByName('TIPOENCER').asString);

  DataDemissao := GetDataDemissao;
  IniciarValoresContabeis;

  Cds.EnableControls;
  CdsLitis.EnableControls;
  CdsDet.EnableControls;
  CdsEtapa.EnableControls;
  CdsProcVinc.EnableControls;
  CdsUF.EnableControls;

  bbtnVerHistObjeto.Visible := (tbcDetalhe.TabIndex = 3) and (not CdsDet.Eof);
end;

procedure TfrmCustomCadProcesso.MudarDadosCidade;
begin
  if (Cds.FieldByName('IDCIDADES').asInteger = 0) then
    CdsUF.Data := CtrlListTerceirosRH.ListEstado(-1)
  else
    CdsUF.Data := CtrlListTerceirosRH.ListEstado(0, Cds.FieldByName('IDCIDADES').asInteger);
end;

procedure TfrmCustomCadProcesso.HabilitarIntegracao;
begin
  // Integração com CAPCAR
  bIntegraCAPCAR := (CdsParamRH.FieldByName('FLGINTEGRACAP').asInteger = 1);

  // Integração com a Contabilidade
  bIntegraContab := (CdsParamRH.FieldByName('FLGINTEGRACONT').asInteger = 1) and
    //(CdsParamRH.FieldByName('INDCONTABJUR').asInteger = 0) and
    (CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, DateToStr(Date)));

  if (bIntegraContab) then
  begin
    CdsTipoOper.Data := CtrlListTerceirosRH.ListTipoOperacao;

    // Pega a Máscara do Plano de Contas
    sMascaraPlaConta := CtrlContab.MascaraContaParam;

    // Pega o ID da Patrocinadora e do Plano Previdenciário
    if (IdPatro <= 0) or (IdPlanoPrev <= 0) then
      if (Sistema.UsaPlanoPatro) then
      begin
        IdPatro := CtrlListTerceirosRH.GetIdPatro(Sistema.IdEmpresa);
        IdPlanoPrev := CtrlListTerceirosRH.GetIdPlanoPrev(Sistema.IdEmpresa);
      end
      else
      begin
        IdPatro := -1;
        IdPlanoPrev := -1;
      end;
  end;

  if (bIntegraCAPCAR) or (bIntegraContab) then
    CtrlProcessoTrab.IniciarIntegracao(Sistema.IdEmpresa, Sistema.IdModulo,
      Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.UsaPlanoPatro,
      ParamIntegra.ObrigaAbc, ParamIntegra.ObrigaCRespon,
      ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal);
end;

procedure TfrmCustomCadProcesso.HabilitarPastaIntegracao;
var
  TipoDocumento: string;
begin
  // Integração com CAPCAR
  bFazCAPCAR := (bIntegraCAPCAR) and (bAlterouValores) and
    ((Cds.FieldByName('FLGSITPROC').asInteger = 1) or (rgSituacao.ItemIndex = 1));
  gbxCAPCAR.Visible := bFazCAPCAR;
  gbkTipoDesemb.Visible := bFazCAPCAR;

  // Somente faz a seleção dos Tipos de Documento e dos Tipos de Desembolso se o sistema
  // está parametrizado para fazer integração com o CAP ou CAR e o processo estiver sendo
  // ou já estava encerrado e for a primeira vez que está passando neste ponto (CdsTipoDoc não ativo).
  if (bFazCAPCAR) and ((Cds.FieldByName('FLGSITPROC').asInteger = 1) or (rgSituacao.ItemIndex = 1)) and
     not(CdsTipoDoc.Active) then
  begin
    if (Sistema.IdModulo = MODCON) then
      TipoDocumento := 'P'
    else
      TipoDocumento := '';

    CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocRecPag(TipoDocumento);
    CdsTipoDesemb.Data := CtrlListTerceirosRH.ListTipoDocRecebDesemb(
      Sistema.IdEmpresa, TipoDocumento, true);
  end;

  // Integração com a Contabilidade
  bFazContab := (bIntegraContab) and (bAlterouValores);
  gbxContabilizacao.Visible := bFazContab;

  // Parametrizações comuns ao CAPCAR e Contabilidade
  tbshIntegracao.TabVisible := (bFazContab) or (bFazCAPCAR);
  if (bFazCAPCAR) or (bFazContab) then
  begin
    if (bFazCAPCAR) then
      dtPagamento.Date := Date;

    if (bFazCAPCAR) and not(bFazContab) then
      tbshIntegracao.Caption := gbxCAPCAR.Caption
    else
    if not(bFazCAPCAR) and (bFazContab) then
      tbshIntegracao.Caption := 'Contabilização'
    else
      tbshIntegracao.Caption := 'Contabilização e ' +gbxCAPCAR.Caption;
  end;
end;

procedure TfrmCustomCadProcesso.HabilitarBtProcVinc(Alterando: boolean);
begin
  spbProcVinc.Enabled := Alterando;
  spbApagaVinc.Enabled := (Alterando) and not(Cds.FieldByName('IDPROCVINCULADO').IsNull);
end;

procedure TfrmCustomCadProcesso.HabilitarTipoEncerramento(Situacao: integer;
  TipoEncerramento: string);
begin
  gbxAcordo.Visible := (Situacao = 1) and (TipoEncerramento = 'C');
  gbxSent.Visible := (Situacao = 1) and (TipoEncerramento = 'S');
end;

procedure TfrmCustomCadProcesso.IniciarValoresContabeis;
begin
  bAlterouValores := false;
  if (bIntegraContab) or (bIntegraCAPCAR) then
    CtrlProcessoTrab.IniciarValoresContabeis(DataDemissao);
end;

procedure TfrmCustomCadProcesso.AcharUltimoNumSeq;
begin
  CdsEtapa.DisableControls;
  CdsEtapa.First;
  iNumSeqAtual := 0;
  while not(CdsEtapa.EOF) do
  begin
    if (CdsEtapa.FieldByName('NUMSEQ').asInteger > iNumSeqAtual) then
      iNumSeqAtual := CdsEtapa.FieldByName('NUMSEQ').asInteger;
    CdsEtapa.Next;
  end;
  CdsEtapa.First;
  CdsEtapa.EnableControls;
end;

procedure TfrmCustomCadProcesso.FormatarCampoCdsObjetos;
begin
  TFloatField(CdsDet.FieldByName('VALORRECL')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsDet.FieldByName('PERCPROB')).DisplayFormat := '###,###,##0.0000';
  TFloatField(CdsDet.FieldByName('PERCORIG')).DisplayFormat := '###,###,##0.0000';
  TFloatField(CdsDet.FieldByName('VALORSENTENCA')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsDet.FieldByName('VALORPROVAVEL')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsDet.FieldByName('VALORORIG')).DisplayFormat := '###,###,##0.00';
end;

procedure TfrmCustomCadProcesso.MontarMontaSelect;
begin
  MontaSelect.UsaDistinct := false;
  MontaSelect.Caption := 'Seleciona Processo';

  MontaSelect.Filtro.Clear;

  MontaSelect.Tabelas.Clear;
  MontaSelect.Tabelas.Add('PESSOA');
  MontaSelect.Tabelas.Add('PROCESSOTRAB');
  MontaSelect.Tabelas.Add('VARAJUSTICA');

  OnClick_ProcurarProcesso;

  MontaSelect.Filtro.Add('PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA');
  MontaSelect.Filtro.Add('PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)');
end;

procedure TfrmCustomCadProcesso.MudarParametrosTela;
begin
  case (iTipoIntegraCAPCAR) of
    CAP    : gbxCAPCAR.Caption := 'Contas a Pagar';
    CAPCAR : gbxCAPCAR.Caption := 'Contas a Pagar / Receber';
  end;

  if (Modulo.IdContraCheque = REFER) or (Modulo.IdContraCheque = FUNCEF) then
    lblValorReclamado.Caption := 'Valor da Causa'
  else
    lblValorReclamado.Caption := 'Valor Reclamado';

  // Mudar Rótulos do Grid de Objetos
  dbgrdDet.Selected.Clear;
  dbgrdDet.Selected.Add('DESCRICAO'+#9+'40'+#9+'Descrição do Objeto Reclamado');
  dbgrdDet.Selected.Add('VALORRECL'+#9+'16'+#9+lblValorReclamado.Caption);
  dbgrdDet.Selected.Add('PERCORIG'+#9+'10'+#9+'Variação Original (%)');
  dbgrdDet.Selected.Add('VALORORIG'+#9+'12'+#9+'Valor Estim. Orig.');
  dbgrdDet.Selected.Add('PERCPROB'+#9+'17'+#9+'Probab. Atual (%)');
  dbgrdDet.Selected.Add('VALORPROVAVEL'+#9+'12'+#9+'Valor Estim. Atual');
  dbgrdDet.Selected.Add('DATAAVAL'+#9+'12'+#9+'Data Avaliação');
  dbgrdDet.Selected.Add('VALORSENTENCA'+#9+'10'+#9+'Valor Real');
  dbgrdDet.Selected.Add('OBSERVACAO'+#9+'250'+#9+'Observação');

  // Mudar Rótulos do Grid de Hist. de Objetos
  dbgrHistObjeto.Selected[2] := 'VALORRECL'+#9+'16'+#9+lblValorReclamado.Caption;

  dblckTipoDesemb.Selected.Clear;
  dblckTipoDesemb.Selected.Add('DESCRICAO'+#9+'35'+#9+'Descrição');

  dblckTipoDoc.Selected.Clear;
  dblckTipoDoc.Selected.Add('DESCRICAO'+#9+'35'+#9+'Descrição');

  DataAjuizamento := dbedDataAju;
  DataNotificacao := dbedDataNot;

  OnMudarParametrosTela;

  MontarMontaSelect;
  CopiarDadosMontaSelect(MontaSelect, MontaSelectProcVinc);
end;

procedure TfrmCustomCadProcesso.CopiarDadosMontaSelect(MSOrigem, MSDestino: TMontaSelect);
begin
  MSDestino.Colunas.Text := MSOrigem.Colunas.Text;
  MSDestino.Descricao.Text := MSOrigem.Descricao.Text;
  MSDestino.Filtro.Text := MSOrigem.Filtro.Text;
  MSDestino.Larguras.Text := MSOrigem.Larguras.Text;
  MSDestino.Mascaras.Text := MSOrigem.Mascaras.Text;
  MSDestino.SensivelACaixa.Text := MSOrigem.SensivelACaixa.Text;
  MSDestino.Tabelas.Text := MSOrigem.Tabelas.Text;
  MSDestino.TipoDeDado.Text := MSOrigem.TipoDeDado.Text;
end;

procedure TfrmCustomCadProcesso.HabilitarDadosEncerramento(Situacao: integer);
begin
  rgTipEncer.Visible := (Situacao = 1);
  gbxDataEncer.Visible := (Situacao = 1);
  lblValReal.Visible := (Situacao = 1);
  dbedValReal.Visible := (Situacao = 1);
  gbxSent.Visible := (Situacao = 1);
  dbrgIndCondenacao.Visible := (Situacao = 1) and
    ((Cds.FieldByName('TIPOENCER').asString = 'C') or
     (Cds.FieldByName('TIPOENCER').asString = 'S')) and
    (CtrlProcessoTrab.ContaNossaLitisconsorte(Cds.FieldByName('NumProcTrab').asFloat) > 0);
  bbtnCondenacao.Visible := (dbrgIndCondenacao.Visible) and (dbrgIndCondenacao.ItemIndex = 0); //in [0,1]);
end;

function TfrmCustomCadProcesso.GravarProcessoTrab: boolean;
var
  bEditando: boolean;
begin
  bEditando := (Cds.State = dsEdit);
  Result := CtrlProcessoTrab.GravarProcessoTrab(sNomeSubConta);
  if (Result) then
  begin
    Result := CtrlHstObjProcTrab.GravarHstObjProcTrab(CtrlProcessoTrab.NumProcTrab);
    CdsHistObjetoGravar.Data := CtrlHstObjProcTrab.ListGeral(-1,-1, 0);
    if (Result) then
    begin
      GravarIntegracao;
      if (bEditando) then
        Sel(true, StrToFloat(MontaSelect.ValoresChave[0]));
    end;
  end
  else
    MsgDlg(CtrlProcessoTrab.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
end;

function TfrmCustomCadProcesso.ExcluirProcessoTrab: boolean;
begin
  Result := CtrlProcessoTrab.ExcluirProcessoTrab;
  
  if (Result) then
  begin
    CdsPartic.EmptyDataSet;
    CdsProcVinc.EmptyDataSet;
    if (CdsHistObjeto.Active) and not(CdsHistObjeto.IsEmpty) then
      CdsHistObjeto.EmptyDataSet;
    edNomeContraparte.Text := '';
  end
  else
    MsgDlg(CtrlProcessoTrab.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
end;

procedure TfrmCustomCadProcesso.GravarIntegracao;
var
  bOk: boolean;
  iCodTipDoc, iIdPlano: integer;
  sTipCodigo, sCodTipRecDes: string;
begin
  if (Cds.FieldByName('IDPATRO').asInteger > 0) then
    IdPatro := Cds.FieldByName('IDPATRO').asInteger;

  if (Cds.FieldByName('IDPLANOPREV').asInteger > 0) then
    IdPlanoPrev := Cds.FieldByName('IDPLANOPREV').asInteger;

  if (bAlterouValores) and ((bFazCAPCAR) or (bFazContab)) then
  begin
    frmAguarde.pbAguarde.Visible := false;
    frmAguarde.Mostra('Fazendo Integração...');

    if (bFazCAPCAR) then
    begin
      iCodTipDoc := CdsTipoDoc.FieldByName('CODTIPDOC').asInteger;
      iIdPlano := CdsTipoDesemb.FieldByName('PLANO').asInteger;
      sCodTipRecDes := CdsTipoDesemb.FieldByName('CODTIPRECDES').asString;
    end
    else
    begin
      iCodTipDoc := 0;
      iIdPlano := 0;
      sCodTipRecDes := '';
    end;

    if (bFazContab) then
      sTipCodigo := CdsTipoOper.FieldByName('TIPCODIGO').asString
    else
      sTipCodigo := '';

    CtrlProcessoTrab.CreateThreadProgresso;
    CtrlProcessoTrab.ReceberValorDepPenh(Cds.FieldByName('NumProcTrab').asFloat);
    bOk := CtrlProcessoTrab.GerarIntegracao(
      bFazCAPCAR and (Trim(dblckTipoDoc.Text) <> ''),
      bFazContab and (Trim(dblckTipOper.Text) <> ''),
      Date, dtPagamento.Date, DataDemissao, IdPlanoPrev,
      IdPatro, iIdPlano, sTipCodigo, sCodTipRecDes,
      iCodTipDoc, FU.IFF(rgJuros.ItemIndex=0, redJuros.Value, 0));
    CtrlProcessoTrab.FreeThreadProgresso;

    frmAguarde.Apaga;
    frmAguarde.pbAguarde.Visible := true;

    if (bOk) then
      MsgDlg(CtrlProcessoTrab.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0)
    else
      MsgDlg(CtrlProcessoTrab.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
  end;
end;

procedure TfrmCustomCadProcesso.Progresso(Args: array of Variant);
begin
  Self.Update;
  frmAguarde.Update;
end;

procedure TfrmCustomCadProcesso.MudarNomeSubConta(Nome: string);
begin
  if (CdsParamRH.FieldByName('FLGCRIASUBCONTA').asInteger = 1) then
    sNomeSubConta := Nome
  else
    sNomeSubConta := '';
end;

function TfrmCustomCadProcesso.GetDataDemissao: TDate;
begin
  Result := 0;
end;

function TfrmCustomCadProcesso.OnClick_OkDetalheLitisconsortes: boolean;
begin
  Result := false;

  if (Trim(edLitisconsorte.Text) = '') then
  begin
    MsgDlg('Litisconsorte Não Identificado.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    exit;
  end;

  if (CdsLitis.FieldByName('INDTESTEMUNHA').isNull) then
  begin
    MsgDlg('Categoria Não Identificada.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    // dbrgCategoria.SetFocus;
    exit;
  end;

  if (Trim(edLitisconsorte.Text) <> '') then
    CdsLitis.FieldByName('NOME').asString := edLitisconsorte.Text;

  CdsLitis.FieldByName('CATEGORIA').asString :=
    FU.IFF(CdsLitis.FieldByName('INDTESTEMUNHA').asInteger = 0, 'Listisconsorte C.Parte',
      FU.IFF(CdsLitis.FieldByName('INDTESTEMUNHA').asInteger = 1, 'Testemunha C.Parte',
        FU.IFF(CdsLitis.FieldByName('INDTESTEMUNHA').asInteger = 2, 'Nossa Testemunha',
          FU.IFF(CdsLitis.FieldByName('INDTESTEMUNHA').asInteger = 3, 'Nossa Listisconsorte',
            'Parte Ré'))));

  CdsLitis.FieldByName('NOME').asString := edLitisconsorte.Text;
  CdsLitis.FieldByName('SITUACAO').asString :=
    FU.IFF(Trim(dblckMotivoLit.Text)='', 'Normal', dblckMotivoLit.Text);

  Result := true;
end;

function TfrmCustomCadProcesso.OnClick_OkDetalheObjetos: boolean;
begin
  Result := false;
  if (Trim(dblckTipObj.Text) = '')  then
  begin
    MsgDlg('Tipo de Objeto Não Identificado.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblckTipObj.SetFocus;
    exit;
  end;

  if (dbedValRecl.Value = 0) and
     (MsgDlg(lblValorReclamado.Caption + ' Não Informado.' +CR_LF+ 'Deseja informar agora?',
             'Aviso', mtInformation, [mbYes,mbNo], 0) = mrYes) then
  begin
    dbedValRecl.SetFocus;
    exit;
  end;

  if (dbedValor.Value = 0) and (dbedPerc.Value = 0) and (dbedValRecl.Value > 0) and
     (MsgDlg('Valor Esperado é igual a Zero.' +CR_LF+ 'Confirma?', 'Confirmação',
      mtConfirmation, [mbYes,mbNo], 0) <> mrYes) then
  begin
    dbedPerc.SetFocus;
    exit;
  end;
{
  if (dbedValProbOrig.Value >= 1000) or (dbedPerc.Value >= 1000) then
  begin
    MsgDlg('Os Percentuais Não Podem Exceder a 999,99.',
      'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dbedPerc.SetFocus;
    exit;
  end;
}
  CdsDet.FieldByName('DESCRICAO').asString := dblckTipObj.Text;
  CdsDet.FieldByName('VALORPROVAVEL').asFloat := (CdsDet.FieldByName('VALORRECL').asFloat *
    CdsDet.FieldByName('PERCPROB').asFloat) / 100;

  if (CdsParamRH.FieldByName('FLGPERCPROB').asInteger = 1) then  // sobre Estim.Original
    CdsDet.FieldByName('VALORPROVAVEL').asFloat := (CdsDet.FieldByName('VALORPROVAVEL').asFloat *
      CdsDet.FieldByName('PERCORIG').asFloat) / 100;

  Cds.FieldByName('CUSTOPROC').asFloat := Cds.FieldByName('CUSTOPROC').asFloat +
    (1 - rgSituacao.ItemIndex) * CdsDet.FieldByName('VALORPROVAVEL').asFloat +
    rgSituacao.ItemIndex * CdsDet.FieldByName('VALORSENTENCA').asFloat - dValAntes;

  Result := true;
end;

function TfrmCustomCadProcesso.OnClick_OkDetalheEtapas: boolean;
var
  dValVariacaoCusto: double;
begin
  Result := false;
  bEncerrar := false;
  if (Trim(dtedDataReal.Text) = '') then
  begin
    MsgDlg('Preencha a Data (Prevista ou Real).', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dtedDataReal.SetFocus;
    exit;
  end;

  if (Trim(dblckTipoEtp.Text) = '') then
  begin
    MsgDlg('Preencha o Tipo de Etapa.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblckTipoEtp.SetFocus;
    exit;
  end;

  if (dbedNumSeqVinc.Value > 0) and
     ((dbedNumSeqVinc.Value > iNumSeqAtual) or
      (dbedNumSeqVinc.Value = CdsEtapa.FieldByName('NUMSEQ').asInteger)) then
  begin
    MsgDlg('Etapa Vinculada Inválida.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedNumSeqVinc.SetFocus;
    exit;
  end;

  CdsEtapa.FieldByName('ETAPA').asString := dblckTipoEtp.Text;

  if (Trim(dbedAssunto.Text) = '') then
    dbedAssunto.Text := dblckTipoEtp.Text;

  if (CdsEtapa.FieldByName('VALORCUSTAS').asFloat > 0) then
  begin
    // Calcular variação da despesa
    dValVariacaoCusto := CdsEtapa.FieldByName('VALORCUSTAS').asFloat - dValAntes;

    // Somar variação ao valor total das despesas
    Cds.FieldByName('DESPESAPROC').asFloat :=
      Cds.FieldByName('DESPESAPROC').asFloat + dValVariacaoCusto;

    // Subtrair a variação ao custo total do processo caso seja indicado
    Cds.FieldByName('CUSTOPROC').asFloat :=
      Cds.FieldByName('CUSTOPROC').asFloat + dValVariacaoCusto;
  end;

  // Gravação do Honorário referente à Etapa
  if (redHonor.Value <> 0) and (redHonor.Visible) and
     not(Cds.FieldByName('IDADVOGRECDA').IsNull) then
  begin
    dmCds.Cds.Data := CtrlHonorarioProcesso.ListHonorario(
      Cds.FieldByName('NUMPROCTRAB').asFloat,
      Cds.FieldByName('IDADVOGRECDA').asFloat, dtedDataReal.Date);
    if (dmCds.Cds.IsEmpty) then
    begin
      if (CdsHonorarios.Locate('NUMSEQ', CdsEtapa.FieldByName('NUMSEQ').asInteger, [])) then
        CdsHonorarios.Edit
      else
        CdsHonorarios.Insert;

      CdsHonorarios.FieldByName('NUMSEQ').asInteger := CdsEtapa.FieldByName('NUMSEQ').asInteger;
      CdsHonorarios.FieldByName('DATAPAGTOHONOR').asDateTime := dtedDataReal.Date;
      CdsHonorarios.FieldByName('IDFORNSERV').asFloat := Cds.FieldByName('IDADVOGRECDA').asFloat;
      CdsHonorarios.FieldByName('VALORHONOR').asFloat := redHonor.Value;
      CdsHonorarios.Post;
    end;
  end;

  lblHonor.Visible := false;
  redHonor.Visible := false;
  redHonor.Value := 0;

  if (mskedHora.Text = '  :  ') then
    CdsEtapa.FieldByName('DATAREALOCOR').asDateTime := dtedDataReal.Date
  else
    CdsEtapa.FieldByName('DATAREALOCOR').asDateTime := dtedDataReal.Date +
      StrToTime(mskedHora.Text);

  bEncerrar := (CdsTipoEtapa.FieldByName('FLGENCERRAMENTO').asInteger = 1) and
               (Cds.FieldByName('FLGSITPROC').asInteger = 0);

  Result := true;
end;

function TfrmCustomCadProcesso.OnClick_OkDetalheHonor: boolean;
begin
  Result := false;
  if (Trim(dtPagamentoHonor.Text) = '') then
  begin
    MsgDlg('Preencha a Data.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dtPagamentoHonor.SetFocus;
    exit;
  end;

  if (Trim(dblckFavor.Text) = '') then
  begin
    MsgDlg('Indique o Favorecido.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblckFavor.SetFocus;
    exit;
  end;

  if (dbedValHon.Value = 0) then
  begin
    MsgDlg('Preencha o Valor.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedValHon.SetFocus;
    exit;
  end;

  CdsHonor.FieldByName('NOME').asString := CdsAdvog.FieldByName('NOME').asString;

  // Atualizar Total de Despesas
  Cds.FieldByName('DESPESAPROC').asFloat :=
    Cds.FieldByName('DESPESAPROC').asFloat + CdsHonor.FieldByName('VALORHONOR').asFloat - dValHonorAntes;
  dValHonorAntes := 0;
  Result := true;
end;

procedure TfrmCustomCadProcesso.OnMudarDadosParticipante;
begin
  edNomeContraparte.Text := CdsPartic.FieldByName('NOME').asString;
end;

procedure TfrmCustomCadProcesso.FormCloseParamFichaProc(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmCustomCadProcesso.CdsBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dblckCCusto.Text <> '' then
    Cds.FieldByName('IDEMPRESAPROP').asInteger := Sistema.IdEmpresa;
end;

procedure TfrmCustomCadProcesso.bbtnVerHistObjetoClick(Sender: TObject);
begin
  inherited;
  CdsHistObjeto.Data := CtrlHstObjProcTrab.ListGeral(CdsDet.FieldByName('NumProcTrab').AsFloat,
    CdsDet.FieldByName('CodTipoObjeto').AsFloat, CdsParamRH.FieldByName('FLGPERCPROB').asInteger);

  TFloatField(CdsHistObjeto.FieldByName('VALORRECL')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsHistObjeto.FieldByName('PERCPROB')).DisplayFormat := '###,###,##0.0000';
  TFloatField(CdsHistObjeto.FieldByName('PERCORIG')).DisplayFormat := '###,###,##0.0000';
  TFloatField(CdsHistObjeto.FieldByName('VALORSENTENCA')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsHistObjeto.FieldByName('VALORPROVAVEL')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsHistObjeto.FieldByName('VALORORIG')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsHistObjeto.FieldByName('JUROS')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsHistObjeto.FieldByName('CORRECAO')).DisplayFormat := '###,###,##0.00';

  townHistObjeto.Visible := true;
  townHistObjeto.Top := 200;
  Self.Enabled := false;
end;

procedure TfrmCustomCadProcesso.bbtnFecharHistObjetoClick(Sender: TObject);
begin
  inherited;
  townHistObjeto.Visible := false;
  Self.Enabled := true;
end;

procedure TfrmCustomCadProcesso.CdsDetAfterPost(DataSet: TDataSet);
begin
  inherited;
  CdsHistObjetoGravar.Insert;
  CdsHistObjetoGravar.FieldByName('CODTIPOOBJETO').AsFloat := CdsDet.FieldByName('CODTIPOOBJETO').AsFloat;
  CdsHistObjetoGravar.FieldByName('VALORRECL').AsFloat := CdsDet.FieldByName('VALORRECL').AsFloat;
  CdsHistObjetoGravar.FieldByName('PERCPROB').AsFloat := CdsDet.FieldByName('PERCPROB').AsFloat;
  CdsHistObjetoGravar.FieldByName('VALORSENTENCA').AsFloat := CdsDet.FieldByName('VALORSENTENCA').AsFloat;
  CdsHistObjetoGravar.FieldByName('PERCORIG').AsFloat := CdsDet.FieldByName('PERCORIG').AsFloat;
  CdsHistObjetoGravar.FieldByName('OBSERVACAO').AsString := CdsDet.FieldByName('OBSERVACAO').AsString;
  CdsHistObjetoGravar.FieldByName('INDVALOR').AsInteger := CdsDet.FieldByName('INDVALOR').AsInteger;
  CdsHistObjetoGravar.FieldByName('DATAINICIO').AsDateTime := CdsDet.FieldByName('DATAINICIO').AsDateTime;
  CdsHistObjetoGravar.FieldByName('DATAFINAL').AsDateTime := CdsDet.FieldByName('DATAFINAL').AsDateTime;
  CdsHistObjetoGravar.FieldByName('DATAAVAL').AsDateTime := CdsDet.FieldByName('DATAAVAL').AsDateTime;
  CdsHistObjetoGravar.Post;
end;

procedure TfrmCustomCadProcesso.CdsDetBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  CdsHistObjetoGravar.Filter := 'CODTIPOOBJETO = ' +CdsDet.FieldByName('CODTIPOOBJETO').asString;
  CdsHistObjetoGravar.Filtered := true;
  while not(CdsHistObjetoGravar.EOF) do
    CdsHistObjetoGravar.Delete;
  CdsHistObjetoGravar.Filtered := false;
  CdsHistObjetoGravar.Filter := '';
end;

procedure TfrmCustomCadProcesso.dbedDataAvalEnter(Sender: TObject);
begin
  inherited;
  DataAvalAntes := dbedDataAval.Date;
end;


procedure TfrmCustomCadProcesso.dblckMotivoLitCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (modified) and (CdsLitis.State <> dsBrowse) then
  begin
    if (Trim(dblckMotivoLit.Text) <> '') then
      CdsLitis.FieldByName('DATAALTSIT').asString := DateToStr(Date)
    else
      CdsLitis.FieldByName('DATAALTSIT').Clear;
  end;

end;

procedure TfrmCustomCadProcesso.btnContaBancClick(Sender: TObject);
begin
  inherited;
  if not(Assigned(frmCadRegContaBanc)) then
    frmCadRegContaBanc := TfrmCadRegContaBanc.Create(Application);

  frmCadRegContaBanc.ExibirTelaContaBanc(CdsEtapa);
end;

procedure TfrmCustomCadProcesso.bbtnMultaClick(Sender: TObject);
begin
  inherited;
  if ds.State = dsInsert then
  begin
    MsgDlg('A Subtela de Multa só pode ser chamada em processos já cadastrados.'+CR_LF+
      'Conclua o cadastramento deste processo, para poder fazer esta operação.',
      'Aviso', mtInformation, [mbOk, mbHelp], 0);
    exit;
  end;

  if not(Assigned(frmCadRegMulta)) then
    frmCadRegMulta := frmCadRegMulta;
    frmCadRegMulta := TfrmCadRegMulta.Create(Application);
    frmCadRegMulta.ExibirTelaMulta(CdsEtapa, CdsDet);
end;

procedure TfrmCustomCadProcesso.dbrgIndCondenacaoChange(Sender: TObject);
begin
  inherited;
  bbtnCondenacao.Visible := dbrgIndCondenacao.ItemIndex = 0; //in [0,1];
end;

procedure TfrmCustomCadProcesso.bbtnCondenacaoClick(Sender: TObject);
begin
  if not(Assigned(frmCadRegCondenacao)) then
    frmCadRegCondenacao := TfrmCadRegCondenacao.Create(Application);

  frmCadRegCondenacao.ExibirTelaCondenacao(Cds, CdsLitis, TotalValorSentenca);
end;

procedure TfrmCustomCadProcesso.pnlHonorEnter(Sender: TObject);
begin
  inherited;
  cbxSucumbencia.Checked := (CdsHonor.FieldByName('IDFORNSERV').asFloat > 0) and
     (CdsHonor.FieldByName('IDFORNSERV').asFloat =
      Cds.FieldByName('IDADVOGRECTE').asFloat);

  cbxSucumbenciaClick(Self);

end;

function TfrmCustomCadProcesso.TotalValorSentenca: double;
begin
  inherited;
  CdsDet.First;
  Result := 0;
  while not CdsDet.Eof do
  begin
    Result := Result + CdsDet.FieldByName('VALORSENTENCA').asFloat;
    CdsDet.Next;
  end;
  CdsDet.First;
end;

procedure TfrmCustomCadProcesso.dbrgIndHonorChange(Sender: TObject);
begin
  inherited;
  redValorTotal.Visible := dbrgIndHonor.ItemIndex = 1;
  redValorTotal.Value := TotalValorSentenca;
end;

end.
