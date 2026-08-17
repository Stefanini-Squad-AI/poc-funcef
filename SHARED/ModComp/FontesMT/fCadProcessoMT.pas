unit fCadProcessoMT;

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
  uCtrlEtapaProcesso, uCmSqlParams;

type
  TfrmCadProcessoMT = class(TFrmCadastroMestreDetMT)
    dsEtapa: TwwDataSource;
    dsPartic: TwwDataSource;
    dsProcVinc: TwwDataSource;
    tbshReclamante: TTabSheet;
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
    Label21: TLabel;
    dbedUF: TwwDBEdit;
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
    Label1: TLabel;
    Label2: TLabel;
    dbedNumero: TDBEdit;
    dbedDataAju: TCMDateTimePicker;
    MontaSelectFunc: TMontaSelect;
    Label5: TLabel;
    dblckTipObj: TwwDBLookupCombo;
    lblValorReclamado: TLabel;
    dbedValRecl: TDBRealEdit;
    Label40: TLabel;
    dbedValProbOrig: TDBRealEdit;
    Label7: TLabel;
    dbedPerc: TDBRealEdit;
    Label24: TLabel;
    lblValReal: TLabel;
    Label39: TLabel;
    dbmemObserv: TDBMemo;
    sbtnProcurarLitis: TToolbarButton97;
    dbedValReal: TDBRealEdit;
    CdsDet: TCMClientDataSet;
    Label20: TLabel;
    Label22: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    lblHonor: TLabel;
    Label43: TLabel;
    dblckTipoEtp: TwwDBLookupCombo;
    dtedDataReal: TCMDateTimePicker;
    mskedHora: TMaskEdit;
    dbedAssunto: TDBEdit;
    redHonor: TRealEdit;
    dbmObserv: TDBMemo;
    dbedValRec: TDBRealEdit;
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
    redJuros: TRealEdit;
    rgJuros: TRadioGroup;
    gbxCAP: TGroupBox;
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
    ntbkTipoModulo: TNotebook;
    Label30: TLabel;
    Label19: TLabel;
    Label13: TLabel;
    dbedNumJCJ_ModCon: TDBEdit;
    dbedDataNot_ModCon: TCMDateTimePicker;
    dbedJCJ: TDBEdit;
    rgSituacao_ModCon: TDBRadioGroup;
    CMProcuraReclamante: TCMProcuraSubTipo;
    gbxSitReq_ModCon: TGroupBox;
    lblSitReq_ModCon: TLabel;
    dblckMotivoReq_ModCon: TwwDBLookupCombo;
    Label48: TLabel;
    Label50: TLabel;
    dbedDataNot_ProcPrev: TCMDateTimePicker;
    dbrgMateria_ProcPrev: TDBRadioGroup;
    rgSituacao_ProcPrev: TDBRadioGroup;
    dbedNumJCJ_ProcPrev: TDBEdit;
    rgAtivo_ProcPrev: TDBRadioGroup;
    gbxRequerente_ProcPrev: TGroupBox;
    edNomeRequerente_ProcPrev: TEdit;
    gbxSitReq_ProcPrev: TGroupBox;
    lblSitReq_ProcPrev: TLabel;
    dblckMotivoReq_ProcPrev: TwwDBLookupCombo;
    ntbkDadosRequerente: TNotebook;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label23: TLabel;
    Label32: TLabel;
    dbedCargo: TDBEdit;
    dbedSalAtual_ModCon: TDBEdit;
    dbrgTipoSalar: TDBRadioGroup;
    dbedAdm_ModCon: TDBEdit;
    dbedDem_ModCon: TDBEdit;
    dbedMotivo: TDBEdit;
    dbedEstab: TDBEdit;
    Label51: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    dbedPlano: TDBEdit;
    dbedInscNum: TDBEdit;
    dbedInscData: TDBEdit;
    dbedPatro: TDBEdit;
    dbedCargoI: TDBEdit;
    dbedSalAtual_ProcPrev: TDBEdit;
    dbedAdm_ProcPrev: TDBEdit;
    dbedDem_ProcPrev: TDBEdit;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    dbedRazao: TDBEdit;
    dbedNumDoc: TDBEdit;
    dbrgTipoPessoa: TDBRadioGroup;
    dbedEmail: TDBEdit;
    dbedLogra: TDBEdit;
    dbedNumLogra: TDBEdit;
    dbedComplem: TDBEdit;
    dbedBairro: TDBEdit;
    MontaSelectPROCPREV: TMontaSelect;
    MontaSelectPROCJUD: TMontaSelect;
    MontaSelectMODCON: TMontaSelect;
    ntbkDadosLitisconsorte: TNotebook;
    CMProcuraLitisEmpregado: TCMProcuraSubTipo;
    gbxSitLitis: TGroupBox;
    lblSitLit_ModCon: TLabel;
    dblckMotivoLit_ModCon: TwwDBLookupCombo;
    CMProcuraLitisEmpresa: TCMProcuraSubTipo;
    gbxLitisconsorte: TGroupBox;
    spbtnProcLitisconsorte: TSpeedButton;
    edLitisconsorte: TEdit;
    GroupBox1: TGroupBox;
    lblSitLit_ProcPrev: TLabel;
    dblckMotivoLit_Outros: TwwDBLookupCombo;
    Label3: TLabel;
    dbedPost: TCMDateTimePicker;
    Label18: TLabel;
    dbedQtde: TDBEdit;
    Label31: TLabel;
    dblckTipProc: TwwDBLookupCombo;
    Label33: TLabel;
    dblckTipAcao: TwwDBLookupCombo;
    Label35: TLabel;
    dbedPasta: TDBEdit;
    Label36: TLabel;
    ProcuraCidade: TCMProcura;
    Label4: TLabel;
    Label16: TLabel;
    rgSituacao_ProcJud: TDBRadioGroup;
    dbedDataNot_ProcJud: TCMDateTimePicker;
    dbedNumJCJ: TDBEdit;
    dbrgMateria_ProcJud: TDBRadioGroup;
    rgAtivo_ProcJud: TDBRadioGroup;
    gbxSitReq_ProcJud: TGroupBox;
    lblSitReq_ProcJud: TLabel;
    dblckMotivoReq_ProcJud: TwwDBLookupCombo;
    gbxRequerente_ProcJud: TGroupBox;
    edNomeRequerente_ProcJud: TEdit;
    bbtnProcRequerente_ProcJud: TBitBtn;
    bbtnProcRequerente_ProcPrev: TBitBtn;
    GroupBox2: TGroupBox;
    dbedPrevEnc: TCMDateTimePicker;
    dbrgCategoria: TDBRadioGroup;
    dbrgCategoriaOutros: TDBRadioGroup;
    edValor: TDBRealEdit;
    Label25: TLabel;
    Label28: TLabel;
    Label14: TLabel;
    Label8: TLabel;
    dbreCusto: TDBRealEdit;
    redValorAtual: TRealEdit;
    dbreDespesa: TDBRealEdit;
    dbrgAbate: TDBRadioGroup;
    tbsInstancias: TTabSheet;
    lblTRT: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    dbedNumTRT: TDBEdit;
    dbedNumTST: TDBEdit;
    dblckVara: TwwDBLookupCombo;
    dblckVara3: TwwDBLookupCombo;
    dbedNumJCJ2: TDBEdit;
    dblckVara2: TwwDBLookupCombo;
    dbedNumExec: TDBEdit;
    sbtnFicha: TToolbarButton97;
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbreCustoChange(Sender: TObject);
    procedure spbProcVincClick(Sender: TObject);
    procedure spbApagaVincClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dblckTipoEtpCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ProcuraCidadeValidaDados(Sender: TObject);
    procedure dblckMoedaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblckRegraNormalCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblckMotivoReq_ModConChange(Sender: TObject);
    procedure dblckMotivoLit_ModConChange(Sender: TObject);
    procedure sbtnProcurarLitisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CdsEtapaAfterScroll(DataSet: TDataSet);
    procedure CdsEtapaBeforeEdit(DataSet: TDataSet);
    procedure dsStateChange(Sender: TObject);
    procedure CMProcuraReclamanteExit(Sender: TObject);
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
    procedure rgSituacao_ModConChange(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure bbtnProcRequerente_ProcJudClick(Sender: TObject);
    procedure dbrgIndTaxaConvChange(Sender: TObject);
    procedure dbedNumJCJExit(Sender: TObject);
    procedure sbtnFichaClick(Sender: TObject);
  private
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

    FdblckMotivoLit: TwwDbLookupCombo;
    FrgSituacao: TDbRadioGroup;
    FlblSitReq, FlblSitLit: TLabel;
    FedNomeRequerente: TEdit;
    FbbtnProcRequerente: TBitBtn;

    dValAntes, dValorReclamadoDepois, dValorProvavelDepois: double;
    sMascaraPlaConta, sMesRef: string;
    iSituacaoAnterior, Ind, iNumReg, liExercicio, liPeriodo, FlgSitAntes,
    iNumSeqAtual, IdPatro, IdPlanoPrev, iCodDocumento, iUltIdBanco, iPortadorFormaPadrao: integer;
    bGravou, bFazContab, bFazCAP, bAlterouValores, bOkDetalhe: boolean;

    procedure HabilitarIntegracao;
    procedure HabilitarBtProcVinc(Alterando: boolean);

    procedure MudarDadosParticipante;
    procedure MudarDadosCidade;

    procedure AssociarComponentesPart;
    procedure IniciarValoresContabeis;
    procedure AcharUltimoNumSeq;
    procedure FormatarCampoCdsObjetos;
    procedure MudarParametrosTela;
    procedure MudarMontaSelectProcVinc;
    procedure HabilitarDadosEncerramento;
    procedure GravarProcessoTrab;
    procedure GravarIntegracao;
  public
    procedure Sel(SelPrincipal: boolean; NumProcTrab: double);
  end;

var
  frmCadProcessoMT: TfrmCadProcessoMT;

implementation

uses uCMTypes, uSistema, uMensErro, uModulo, uCtrlFuncoesRH, uCtrlPadroes, fParcelaAcordoMT,
  fValorRealMT, fProcuraPessoaDocMT, uCtrlUsoGeralRH, dCds, fParamFichaProc,
  RFichaProc;

{$R *.DFM}

procedure TfrmCadProcessoMT.FormCreate(Sender: TObject);
begin
  inherited;
  lblValorReclamado.Caption := 'Valor '+FU.IFF(Modulo.IdContraCheque=REFER,'da Causa','Reclamado');

  CtrlProcessoTrab := TCtrlProcessoTrab.Create(Sistema.IdModulo, Sistema.IdUsuario,
    Sistema.IdEmpresa, Sistema.UsaPlanoPatro, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlProcessoTrab.InitializeAs(Padroes);
  CtrlProcessoTrab.CdsProcesso := Cds;
  CtrlProcessoTrab.CdsLitisconsortes := CdsLitis;
  CtrlProcessoTrab.CdsObjetos := CdsDet;
  CtrlProcessoTrab.CdsEtapas := CdsEtapa;
  CtrlProcessoTrab.CdsHonorarios := CdsHonorarios;

  CtrlEtapaProcesso := TCtrlEtapaProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlEtapaProcesso.InitializeAs(Padroes);

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

  CdsParamRH.Data := CtrlGlobalRH.GetParamRH(
    'FLGINTEGRACAP, FLGINTEGRACONT, FLGCRIASUBCONTA, MOEDAPROCTRAB');
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

  MudarParametrosTela;
  Sel(true, -1);

  tbshIntegracao.TabVisible := false;

  sMesRef := Copy(DateToStr(Date),7,4) + Copy(DateToStr(Date),3,3);
  pgCtrlOutrosDados.ActivePageIndex := 0;
end;

procedure TfrmCadProcessoMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlProcessoTrab);
  FreeAndNil(CtrlEtapaProcesso);
  FreeAndNil(CtrlHonorarioProcesso);
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
  if Assigned(frmProcuraPessoaDocMT) then
    FreeAndNil(frmProcuraPessoaDocMT);
  inherited;
end;

procedure TfrmCadProcessoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Sel(true, StrToFloat(MontaSelect.ValoresChave[0]));
    AcharUltimoNumSeq;
  end;
end;

procedure TfrmCadProcessoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Sel(false, -1);

  Cds.FieldByName('FLGSITPROC').asInteger := 0;
  Cds.FieldByName('CUSTOPROC').asInteger := 0;
  Cds.FieldByName('DESPESAPROC').asInteger := 0;
  Cds.FieldByName('DATAPREVENCER').asDateTime := Date + Round(365.25 * 5);
  Cds.FieldByName('INDTAXACONV').asInteger := 0;
  Cds.FieldByName('FLGPARTEATIVA').asInteger := 0;
  Cds.FieldByName('MOEDAPROCTRAB').asFloat := CdsParamRH.FieldByName('MOEDAPROCTRAB').asFloat;

  case (Sistema.IdModulo) of
    MODCON   : Cds.FieldByName('INDMATERIA').asInteger := 1;
    PROCJUD  : Cds.FieldByName('INDMATERIA').asInteger := 4;
    PROCPREV : Cds.FieldByName('INDMATERIA').asInteger := 2;
  end;

  CtrlProcessoTrab.ZerarValoresProcesso;
  iNumSeqAtual := 0;
  bAlterouValores := false;
end;

procedure TfrmCadProcessoMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
    CdsDet.FieldByName('VALORSENTENCA').asFloat := 0;
    edValor.Value := CdsDet.FieldByName('VALORPROVAVEL').asFloat;
  end
  else
  if (pgctrlDetalhe.ActivePage = tbsEtapas) then
  begin
    Inc(iNumSeqAtual);
    CdsEtapa.FieldByName('NUMSEQ').asInteger := iNumSeqAtual;
  end;
end;

procedure TfrmCadProcessoMT.CmeDetalheDelete(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsEtapas) and
     (CdsHonorarios.Locate('NUMSEQ', CdsEtapa.FieldByName('NUMSEQ').asInteger, [])) then
    CdsHonorarios.Delete;
  inherited;
end;

procedure TfrmCadProcessoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadProcessoMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  GravarProcessoTrab;
  Accept := bGravou;
end;

procedure TfrmCadProcessoMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  GravarProcessoTrab;
  Accept := bGravou;
end;

procedure TfrmCadProcessoMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlProcessoTrab.ExcluirProcessoTrab;
  if (Accept) then
  begin
    CdsPartic.EmptyDataSet;
    CdsProcVinc.EmptyDataSet;
  end
  else
    MsgDlg(CtrlProcessoTrab.MessageInfo, 'Erro', mtWarning, [mbOk,mbHelp], 0);
end;

procedure TfrmCadProcessoMT.dsStateChange(Sender: TObject);
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

  if (bAlterando) and (dbedDataAju.CanFocus) then
    dbedDataAju.SetFocus;
end;

procedure TfrmCadProcessoMT.dsLitisStateChange(Sender: TObject);
begin
  if (CdsLitis.State in [dsInsert,dsEdit]) then
  begin
    edLitisconsorte.Text := FU.IFF(CdsLitis.FieldByName('IDPESSOA').IsNull, '',
      CdsLitis.FieldByName('NOME').asString);
    FlblSitLit.Caption := FU.IFF(CdsLitis.FieldByName('IDMOTIVO').IsNull, 'Normal', 'Excl. Por');
    if (CMProcuraLitisEmpregado.CanFocus) then
      CMProcuraLitisEmpregado.SetFocus;
  end;
end;

procedure TfrmCadProcessoMT.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert,dsEdit]) and (dblckTipObj.CanFocus) then
    dblckTipObj.SetFocus;
end;

procedure TfrmCadProcessoMT.dsEtapaStateChange(Sender: TObject);
begin
  if (CdsEtapa.State in [dsInsert,dsEdit]) and (dblckTipoEtp.CanFocus) then
    dblckTipoEtp.SetFocus;
end;

procedure TfrmCadProcessoMT.rgSituacao_ModConChange(Sender: TObject);
begin
  if (Cds.State <> dsEdit) or (iSituacaoAnterior = FrgSituacao.ItemIndex) then
    exit;

  iSituacaoAnterior := FrgSituacao.ItemIndex;
  if (FrgSituacao.ItemIndex = 0) then
  begin
    if (MsgDlg('Deseja Reabrir o Processo?', 'Confirmação',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      Cds.FieldByName('FLGSITPROC').asInteger := 0;
      Cds.FieldByName('DATAEFETENC').Clear;
      bbtnConfirmarClick(FrgSituacao);
    end
    else
    begin
      FrgSituacao.OnChange := nil;
      FrgSituacao.ItemIndex := 1;
      FrgSituacao.OnChange := rgSituacao_ModConChange;
    end;
  end
  else
  begin
    if (MsgDlg('Deseja Encerrar o Processo?', 'Confirmação',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      Cds.FieldByName('DATAEFETENC').asDateTime := Date;
      FazerVoltarDet;
      //Dock973.Visible := false;
      tbcDetalhe.TabIndex := 7;
      pgctrlDetalhe.ActivePageIndex := 7;
      bAlterouValores := true;
    end
    else
    begin
      bbtnCancelarClick(FrgSituacao);
      FrgSituacao.OnChange := nil;
      FrgSituacao.ItemIndex := 0;
      FrgSituacao.OnChange := rgSituacao_ModConChange;
    end;
  end;

  HabilitarDadosEncerramento;
end;

procedure TfrmCadProcessoMT.CdsEtapaAfterScroll(DataSet: TDataSet);
begin
  dtedDataReal.Text := '';
  mskedHora.Text := '';
  if not(CdsEtapa.FieldByName('DATAREALOCOR').IsNull) then
  begin
    dtedDataReal.Date := StrToDate(DateToStr(CdsEtapa.FieldByName('DATAREALOCOR').asDateTime));
    mskedHora.Text := Copy(CdsEtapa.FieldByName('DATAREALOCOR').asString,12,5);
  end;
end;

procedure TfrmCadProcessoMT.CdsDetBeforeEdit(DataSet: TDataSet);
begin
  if (CdsDet.FieldByName('VALORSENTENCA').asFloat = 0) then
    dValAntes := CdsDet.FieldByName('VALORPROVAVEL').asFloat
  else
    dValAntes := CdsDet.FieldByName('VALORSENTENCA').asFloat;
end;

procedure TfrmCadProcessoMT.CdsEtapaBeforeEdit(DataSet: TDataSet);
begin
  dValAntes := CdsEtapa.FieldByName('VALORREC').asFloat *
    (1 - CdsEtapa.FieldByName('FLGVALORABATE').asInteger);
end;

procedure TfrmCadProcessoMT.dblckMotivoReq_ModConChange(Sender: TObject);
begin
  if Assigned(FlblSitReq) then
    FlblSitReq.Caption := FU.IFF(Trim(TwwDbLookupCombo(Sender).Text)='', 'Normal', 'Excl. Por');
end;

procedure TfrmCadProcessoMT.dblckMotivoLit_ModConChange(Sender: TObject);
begin
  if Assigned(FlblSitLit) then
    FlblSitLit.Caption := FU.IFF(Trim(TwwDbLookupCombo(Sender).Text)='', 'Normal', 'Excl. Por');
end;

procedure TfrmCadProcessoMT.dbreCustoChange(Sender: TObject);
begin
  if (CdsPartic.Active) then
    redValorAtual.Value := CtrlCalcRub.ValorAtualProcesso(
      Cds.FieldByName('CUSTOPROC').asFloat,
      FU.IFF(Sistema.IdEmpresa=MODCON, FU.IFF(dbedDem_ModCon.Text<>'', dbedDem_ModCon.Text,
        Cds.FieldByName('DATANOTIF').asString), Cds.FieldByName('DATANOTIF').asString),
      Cds.FieldByName('MOEDAPROCTRAB').asString,
      Cds.FieldByName('IDREGRA').asString,
      Cds.FieldByName('NUMPROCTRAB').asString,
      dbrgIndTaxaConv.ItemIndex);
end;

procedure TfrmCadProcessoMT.dbrgIndTaxaConvChange(Sender: TObject);
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
  dbreCustoChange(Self);
end;

procedure TfrmCadProcessoMT.rgTipEncerChange(Sender: TObject);
begin
  if not(CdsDet.IsEmpty) and (CdsDet.State in [dsInsert,dsEdit]) and
     (rgTipEncer.ItemIndex in [1,3]) then
  begin
    if (TfrmValorRealMT.ExibirCalculoValorReal(CdsDet)) then
    begin
      CdsDet.First;
      while not(CdsDet.EOF) do
      begin
        Cds.FieldByName('CUSTOPROC').asFloat := Cds.FieldByName('CUSTOPROC').asFloat -
          CdsDet.FieldByName('VALORPROVAVEL').asFloat +
          CdsDet.FieldByName('VALORSENTENCA').asFloat;
        CdsDet.Next;
      end;
      CdsDet.First;
      FormatarCampoCdsObjetos;
      bAlterouValores := true;
    end
    else
      MsgDlg('Não Esqueça de Atualizar os Valores Reais dos Objetos.',
        'Aviso', mtInformation, [mbOk, mbHelp], 0);
  end;

  gbxAcordo.Visible := (rgTipEncer.ItemIndex = 1);
  gbxSent.Visible := (rgTipEncer.ItemIndex = 3);
end;

procedure TfrmCadProcessoMT.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  //Dock973.Visible := (pgctrlDetalhe.ActivePageIndex in [1,3,5]);
end;

procedure TfrmCadProcessoMT.ProcuraCidadeValidaDados(Sender: TObject);
begin
  MudarDadosCidade;
end;

procedure TfrmCadProcessoMT.dblckMoedaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (Modified) then
    dbreCustoChange(Self);
end;

procedure TfrmCadProcessoMT.dblckRegraNormalCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if (Modified) then
    dbreCustoChange(Self);
end;

procedure TfrmCadProcessoMT.dblckTipoEtpCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (sbtnInsDet.Down) and (CdsTipoEtapa.FieldByName('VALORHONOR').asFloat <> 0)  then
  begin
    lblHonor.Visible := true;
    redHonor.Visible := true;
    redHonor.Value := CdsTipoEtapa.FieldByName('VALORHONOR').asFloat;
  end;
end;

procedure TfrmCadProcessoMT.CMProcuraReclamanteExit(Sender: TObject);
begin
  if (Sistema.IdModulo in [PROCJUD,PROCPREV]) then
    MudarDadosParticipante;
end;

procedure TfrmCadProcessoMT.bbtnProcRequerente_ProcJudClick(Sender: TObject);
begin
  if (Cds.State in [dsInsert,dsEdit]) and (frmProcuraPessoaDocMT.ShowModal = mrOk) then
  begin
    if (Copy(TComponent(Sender).Name,1,18) = 'bbtnProcRequerente') then
    begin
      Cds.FieldByName('IDRECLAMANTE').asString := frmProcuraPessoaDocMT.sIDPessoa;
      FedNomeRequerente.Text := frmProcuraPessoaDocMT.sNomePessoa;
    end
    else
    begin
      CdsLitis.FieldByName('IDPESSOA').asString := frmProcuraPessoaDocMT.sIDPessoa;
      edLitisconsorte.Text := frmProcuraPessoaDocMT.sNomePessoa;
    end;
    if (Sistema.IdModulo in [PROCJUD,PROCPREV]) then
      MudarDadosParticipante;
  end;
end;

procedure TfrmCadProcessoMT.sbtnProcurarClick(Sender: TObject);
begin
  if (TComponent(Sender).Name = 'sbtnProcurar') then
  begin
    MontaSelect.Filtro.Clear;
    case (Sistema.IdModulo) of
      MODCON :
      begin
        MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA   = 1');
        MontaSelect.Filtro.Add('PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA');
        MontaSelect.Filtro.Add('PROCESSOTRAB.CODIGOTRT    = TRT.CODIGOTRT(+)');
      end;
      PROCJUD :
      begin
        MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA    > 3');
        MontaSelect.Filtro.Add('PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA');
        MontaSelect.Filtro.Add('PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)');
      end;
      PROCPREV :
      begin
        MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA    > 1');
        MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA    < 4');
        MontaSelect.Filtro.Add('PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA');
        MontaSelect.Filtro.Add('PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)');
      end;
    end;  
    MontaSelect.Tabelas.Clear;
    MontaSelect.Tabelas.Add('PESSOA');
    MontaSelect.Tabelas.Add('PROCESSOTRAB');
    if (Sistema.IdModulo = MODCON) then
      MontaSelect.Tabelas.Add('TRT')
    else
      MontaSelect.Tabelas.Add('VARAJUSTICA');  
  end;
  inherited;
end;

procedure TfrmCadProcessoMT.sbtnProcurarLitisClick(Sender: TObject);
begin
  MontaSelect.Filtro.Clear;
  case (Sistema.IdModulo) of
    MODCON :
    begin
      MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA    = 1');
      MontaSelect.Filtro.Add('(PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA) OR (COPARTPROCTRAB.IDPESSOA = PESSOA.IDPESSOA)');
      MontaSelect.Filtro.Add('PROCESSOTRAB.NUMPROCTRAB   = COPARTPROCTRAB.NUMPROCTRAB(+)');
      MontaSelect.Filtro.Add('PROCESSOTRAB.CODIGOTRT     = TRT.CODIGOTRT(+)');
    end;
    PROCJUD :
    begin
      MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA    > 3');
      MontaSelect.Filtro.Add('(PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA) OR (COPARTPROCTRAB.IDPESSOA = PESSOA.IDPESSOA)');
      MontaSelect.Filtro.Add('PROCESSOTRAB.NUMPROCTRAB   = COPARTPROCTRAB.NUMPROCTRAB(+)');
      MontaSelect.Filtro.Add('PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)');
    end;
    PROCPREV :
    begin
      MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA    > 1');
      MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA    < 4');
      MontaSelect.Filtro.Add('(PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA) OR (COPARTPROCTRAB.IDPESSOA = PESSOA.IDPESSOA)');
      MontaSelect.Filtro.Add('PROCESSOTRAB.NUMPROCTRAB   = COPARTPROCTRAB.NUMPROCTRAB(+)');
      MontaSelect.Filtro.Add('PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)');
    end;
  end;
  MontaSelect.Tabelas.Clear;
  MontaSelect.Tabelas.Add('PESSOA');
  MontaSelect.Tabelas.Add('PROCESSOTRAB');
  if (Sistema.IdModulo = MODCON) then
    MontaSelect.Tabelas.Add('TRT')
  else
    MontaSelect.Tabelas.Add('VARAJUSTICA');  
  MontaSelect.Tabelas.Add('COPARTPROCTRAB');
  sbtnProcurarClick(Sender);
  sbtnProcurarLitis.Down := false;
end;

procedure TfrmCadProcessoMT.bbtnParcelamentoClick(Sender: TObject);
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

procedure TfrmCadProcessoMT.spbProcVincClick(Sender: TObject);
begin
  MontaSelectProcVinc.Executar;
  if (MontaSelectProcVinc.RetornouValor) then
  begin
    Cds.FieldByName('IDPROCVINCULADO').asFloat := StrToFloat(MontaSelectProcVinc.ValoresChave[0]);
    spbApagaVinc.Enabled := true;
  end;
end;

procedure TfrmCadProcessoMT.spbApagaVincClick(Sender: TObject);
begin
  if (MsgDlg('Confirma a Excluão do Vínculo?', 'Confirmação',
             mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    Cds.FieldByName('IDPROCVINCULADO').Clear;
    Cds.FieldByName('FLGVINCULADO').Clear;
    spbApagaVinc.Enabled := false;
  end;
end;

procedure TfrmCadProcessoMT.bbtnOkDetClick(Sender: TObject);
begin
  bOkDetalhe := false;
  if (pgctrlDetalhe.ActivePage = tbsLitisconsortes) then
  begin
    if (Sistema.IdModulo = MODCON) then
    begin
      if (Trim(CMProcuraLitisEmpregado.Text) = '') and
         (Trim(CMProcuraLitisEmpresa.Text) = '') then
      begin
        MsgDlg('Litisconsorte Não Identificado.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
        CMProcuraLitisEmpregado.SetFocus;
        exit;
      end;

      if (dbrgCategoria.ItemIndex = -1) then
      begin
        MsgDlg('Categoria Não Identificada.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
        dbrgCategoria.SetFocus;
        exit;
      end;

      if (Trim(CMProcuraLitisEmpregado.Text) <> '') then
        CdsLitis.FieldByName('NOME').asString := CMProcuraLitisEmpregado.Text
      else
        CdsLitis.FieldByName('NOME').asString := CMProcuraLitisEmpresa.Text;

      CdsLitis.FieldByName('CATEGORIA').asString :=
        FU.IFF(CdsLitis.FieldByName('INDTESTEMUNHA').asInteger = 0, 'Listisconsorte C.Parte',
          FU.IFF(CdsLitis.FieldByName('INDTESTEMUNHA').asInteger = 1, 'Testemunha C.Parte',
            FU.IFF(CdsLitis.FieldByName('INDTESTEMUNHA').asInteger = 2, 'Nossa Testemunha',
              'Nossa Listisconsorte')));
    end
    else
    begin
      if (Trim(edLitisconsorte.Text) = '') then
      begin
        MsgDlg('Litisconsorte Não Identificado.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
        CMProcuraLitisEmpregado.SetFocus;
        exit;
      end;

      CdsLitis.FieldByName('NOME').asString := edLitisconsorte.Text;
    end;

    CdsLitis.FieldByName('SITUACAO').asString :=
      FU.IFF(Trim(FdblckMotivoLit.Text)='', 'Normal', FdblckMotivoLit.Text);
  end
  else
  if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
    if (Trim(dblckTipObj.Text) = '')  then
    begin
      MsgDlg('Tipo de Objeto Não Identificado.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
      dblckTipObj.SetFocus;
      exit;
    end;

    if (dbedValRecl.Value = 0) and
       (MsgDlg('Valor '+FU.IFF(Modulo.IdContraCheque=REFER,'da Causa','Reclamado')+' Não Informado.'+CR_LF+'Deseja informar agora?', 'Aviso',
        mtWarning, [mbYes,mbNo], 0) = mrYes) then
    begin
      dbedValRecl.SetFocus;
      exit;
    end;

    if (edValor.Value = 0) and (dbedPerc.Value = 0) and (dbedValRecl.Value > 0) and
       (MsgDlg('Valor Esperado é igual a Zero.'+CR_LF+'Confirma?', 'Confirmação',
        mtConfirmation, [mbYes,mbNo], 0) <> mrYes) then
    begin
      dbedPerc.SetFocus;
      exit;
    end;

    if (edValor.Value <> 0) and (dbedPerc.Value = 0) and (dbedValRecl.Value > 0) then
      dbedPerc.Value := edValor.Value * 100 / dbedValRecl.Value;

    CdsDet.FieldByName('DESCRICAO').asString := dblckTipObj.Text;
    CdsDet.FieldByName('VALORPROVAVEL').asFloat := (CdsDet.FieldByName('VALORRECL').asFloat *
      CdsDet.FieldByName('PERCPROB').asFloat) / 100;

    Cds.FieldByName('CUSTOPROC').asFloat := Cds.FieldByName('CUSTOPROC').asFloat +
      (1 - FrgSituacao.ItemIndex) * CdsDet.FieldByName('VALORPROVAVEL').asFloat +
      FrgSituacao.ItemIndex * CdsDet.FieldByName('VALORSENTENCA').asFloat - dValAntes;
  end
  else
  if (pgctrlDetalhe.ActivePage = tbsEtapas) then
  begin
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

    CdsEtapa.FieldByName('ETAPA').asString := dblckTipoEtp.Text;

    // Deposito e Despesa entram no campo DESPESAPROC
    Cds.FieldByName('DESPESAPROC').asFloat := Cds.FieldByName('DESPESAPROC').asFloat +
      CdsEtapa.FieldByName('VALORREC').asFloat *
      (1 - CdsEtapa.FieldByName('FLGVALORABATE').asInteger) - dValAntes;

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
  end;

  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
    bAlterouValores := true;
    HabilitarIntegracao;
  end  
  else
  if (pgctrlDetalhe.ActivePage = tbsLitisconsortes) then
    edLitisconsorte.Text := '';

  bOkDetalhe := true;
end;

procedure TfrmCadProcessoMT.bbtnCancelarDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsEtapas) and (CdsEtapa.State = dsInsert) then
    Dec(iNumSeqAtual);
  inherited;
end;

procedure TfrmCadProcessoMT.bbtnVoltarDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsEtapas) and (CdsEtapa.State = dsInsert) then
    Dec(iNumSeqAtual);
  inherited;
end;

procedure TfrmCadProcessoMT.bbtnConfirmarClick(Sender: TObject);
var
  _CdsAux: TCMClientDataSet;
begin
  if (Sistema.IdModulo in [PROCJUD,PROCPREV]) and (Trim(FedNomeRequerente.Text) = '') then
  begin
    MsgDlg('Contra-Parte Não Identificada', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    FbbtnProcRequerente.SetFocus;
    exit;
  end;

  if (Trim(dblckVara.Text) = '') or (Trim(ProcuraCidade.Text) = '') then
  begin
    FazerVoltarDet;
    //Dock973.Visible := false;
    tbcDetalhe.TabIndex := 2;
    pgctrlDetalhe.ActivePageIndex := 2;
    pgCtrlOutrosDados.ActivePageIndex := 0;
    if (Trim(dblckVara.Text) = '') then
    begin
      MsgDlg('Vara Não Identificada', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      dblckVara.SetFocus;
    end
    else
    begin
      MsgDlg('Cidade/Estado Não Identificados', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      ProcuraCidade.SetFocus;
    end;
    exit;
  end;

  // Se algum Detalhe estiver sendo Alterado ou Incluído, executar primeiro o Ok do Detalhe
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

  if (((bFazContab) and (Trim(dblckTipOper.Text) = '')) or
      ((bFazCAP) and ((Trim(dblckTipoDoc.Text) = '') or (Trim(dblckTipoDesemb.Text) = '')))) then
  begin
    tb97BotoesDetalhe.Visible := false;
    pgCtrlOutrosDados.ActivePage := tbshIntegracao;
    pgctrlDetalhe.ActivePage := tbshOutrosDados;
    tbcDetalhe.TabIndex := tbshOutrosDados.PageIndex;
    tbcDetalhe.Repaint;
    MsgDlg('Complemente os dados requeridos para a integração'+CR_LF+
           'Contábil e/ou do Contas a Pagar'+
           FU.IFF(Sistema.IdModulo in [PROCJUD,PROCPREV], '/Receber', ''),
           'Informação', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  if (Cds.State = dsInsert) and not(Cds.FieldByName('DATANOTIF').IsNull) then
    Cds.FieldByName('DATAPREVENCER').asDateTime :=
      Cds.FieldByName('DATANOTIF').asDateTime + Int(365.25 * 5);

  inherited;
  if (Cds.State = dsBrowse) then
  begin
    GravarIntegracao;
    Sel(true, StrToFloat(MontaSelect.ValoresChave[0]));
  end;
end;

procedure TfrmCadProcessoMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if (Assigned(Self.ActiveControl)) and
     (TComponent(Self.ActiveControl).Name = 'bbtnCancelar') and
     (Cds.FieldByName('NUMPROCTRAB').asFloat > 0) then
    Sel(true, Cds.FieldByName('NUMPROCTRAB').asFloat)
  else
    HabilitarDadosEncerramento;
      
  AcharUltimoNumSeq;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadProcessoMT.Sel(SelPrincipal: boolean; NumProcTrab: double);
begin
  CdsHonorarios.Data := CtrlHonorarioProcesso.ListTabHonorarioEmBranco;

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
  CdsDet.Data := CtrlProcessoTrab.ListObjetoXTipo(NumProcTrab);
  CdsEtapa.Data := CtrlEtapaProcesso.ListEtapas(NumProcTrab);
  CdsProcVinc.Data := CtrlProcessoTrab.ListProcessosVinculados(NumProcTrab);
  MudarDadosCidade;

  dbreCustoChange(Self);
  if (Sistema.IdModulo in [PROCJUD,PROCPREV]) then
    MudarDadosParticipante;
  HabilitarIntegracao;

  TFloatField(CdsEtapa.FieldByName('VALORREC')).DisplayFormat := '###,###,##0.00';
  FormatarCampoCdsObjetos;

  if Assigned(FlblSitReq) then
    FlblSitReq.Caption := FU.IFF(Cds.FieldByName('IDMOTIVO').IsNull, 'Normal', 'Excl. Por');
                                             
  iSituacaoAnterior := FrgSituacao.ItemIndex;
  HabilitarDadosEncerramento;

  gbxAcordo.Visible := (rgTipEncer.ItemIndex = 1);
  gbxSent.Visible := (rgTipEncer.ItemIndex = 3);

  Cds.EnableControls;
  CdsLitis.EnableControls;
  CdsDet.EnableControls;
  CdsEtapa.EnableControls;
  CdsProcVinc.EnableControls;
  CdsUF.EnableControls;
  
  sbtnFicha.Enabled := not(Cds.IsEmpty);
end;

procedure TfrmCadProcessoMT.MudarDadosParticipante;
begin
  case (Sistema.IdModulo) of
    MODCON   : CdsPartic.Data := CtrlPessoaFuncionario.ListDadosParticipante(
      Cds.FieldByName('IDRECLAMANTE').asFloat);
    PROCJUD  : CdsPartic.Data := CtrlPessoaFuncionario.ListDadosParticipante_ComEndereco(
      Cds.FieldByName('IDRECLAMANTE').asFloat);
    PROCPREV : CdsPartic.Data := CtrlPessoaFuncionario.ListDadosParticipante_ComPlano(
      Cds.FieldByName('IDRECLAMANTE').asFloat);
  end;

  AssociarComponentesPart;

  if (Sistema.IdModulo in [PROCJUD,PROCPREV]) then
    FedNomeRequerente.Text := CdsPartic.FieldByName('NOME').asString;
end;

procedure TfrmCadProcessoMT.MudarDadosCidade;
begin
  if (Cds.FieldByName('IDCIDADES').asInteger = 0) then
    CdsUF.Data := CtrlListTerceirosRH.ListEstado(-1)
  else
    CdsUF.Data := CtrlListTerceirosRH.ListEstado(0, Cds.FieldByName('IDCIDADES').asInteger);
end;

procedure TfrmCadProcessoMT.AssociarComponentesPart;
begin
  case (Sistema.IdModulo) of
    MODCON   :
    begin
      dbedCargo.DataSource := dsPartic;
      dbedSalAtual_ModCon.DataSource := dsPartic;
      dbrgTipoSalar.DataSource := dsPartic;
      dbedAdm_ModCon.DataSource := dsPartic;
      dbedDem_ModCon.DataSource := dsPartic;
      dbedMotivo.DataSource := dsPartic;
      dbedEstab.DataSource := dsPartic;
    end;
    PROCJUD  :
    begin
      dbedRazao.DataSource := dsPartic;
      dbedNumDoc.DataSource := dsPartic;
      dbrgTipoPessoa.DataSource := dsPartic;
      dbedEmail.DataSource := dsPartic;
      dbedLogra.DataSource := dsPartic;
      dbedNumLogra.DataSource := dsPartic;
      dbedComplem.DataSource := dsPartic;
      dbedBairro.DataSource := dsPartic;
    end;
    PROCPREV :
    begin
      dbedPlano.DataSource := dsPartic;
      dbedInscNum.DataSource := dsPartic;
      dbedInscData.DataSource := dsPartic;
      dbedPatro.DataSource := dsPartic;
      dbedCargoI.DataSource := dsPartic;
      dbedSalAtual_ProcPrev.DataSource := dsPartic;
      dbedAdm_ProcPrev.DataSource := dsPartic;
      dbedDem_ProcPrev.DataSource := dsPartic;
    end;
  end;
end;

procedure TfrmCadProcessoMT.HabilitarIntegracao;
var
  TipoDocumento: string;
begin
  // Integração com CAPCAR
  bFazCAP := (CdsParamRH.FieldByName('FLGINTEGRACAP').asInteger = 1) and
    (Cds.FieldByName('FLGSITPROC').asInteger = 1) and (bAlterouValores);
  gbxCAP.Visible := bFazCAP;
  gbkTipoDesemb.Visible := bFazCAP;

  if (bFazCAP) then
  begin
    if (Sistema.IdModulo = MODCON) then
      TipoDocumento := 'P'
    else
      TipoDocumento := FU.IFF(Cds.FieldByName('FLGPARTEATIVA').asInteger=0, 'P', 'R');

    if (CdsTipoDoc.IsEmpty) then
      CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocRecPag(TipoDocumento);
    if (CdsTipoDesemb.IsEmpty) then
      CdsTipoDesemb.Data := CtrlListTerceirosRH.ListTipoDocRecebDesemb(TipoDocumento, true);
  end;

  // Integração com a Contabilidade
  bFazContab := (CdsParamRH.FieldByName('FLGINTEGRACONT').asInteger = 1) and
    (CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, DateToStr(Date))) and
    (bAlterouValores);
  gbxContabilizacao.Visible := bFazContab;

  if (bFazContab) then
  begin
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

    if (CdsTipoOper.IsEmpty) then
      CdsTipoOper.Data := CtrlListTerceirosRH.ListTipoOperacao;
  end;

  // Parametrizações comuns ao CAPCAR e Contabilidade
  if (bFazCAP) or (bFazContab) then
  begin
    if (bFazCAP) and not(bFazContab) then
      tbshIntegracao.Caption := 'Contas a Pagar'
    else
    if not(bFazCAP) and (bFazContab) then
      tbshIntegracao.Caption := 'Contabilização'
    else
      tbshIntegracao.Caption := 'Contabilização e Contas a Pagar';

    dtPagamento.Date := Date;
  end;
end;

procedure TfrmCadProcessoMT.HabilitarBtProcVinc(Alterando: boolean);
begin
  spbProcVinc.Enabled := Alterando;
  spbApagaVinc.Enabled := (Alterando) and not(Cds.FieldByName('IDPROCVINCULADO').IsNull);
end;

procedure TfrmCadProcessoMT.IniciarValoresContabeis;
begin
  bAlterouValores := false;
  FlgSitAntes := Cds.FieldByName('FLGSITPROC').asInteger;

  if (bFazContab) or (bFazCAP) then
    CtrlProcessoTrab.IniciarValoresContabeis(
      CdsPartic.FieldByName('DATADEMISSAO').asDateTime);
end;

procedure TfrmCadProcessoMT.AcharUltimoNumSeq;
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

procedure TfrmCadProcessoMT.FormatarCampoCdsObjetos;
begin
  TFloatField(CdsDet.FieldByName('VALORRECL')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsDet.FieldByName('PERCPROB')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsDet.FieldByName('PERCORIG')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsDet.FieldByName('VALORSENTENCA')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsDet.FieldByName('VALORPROVAVEL')).DisplayFormat := '###,###,##0.00';
end;

procedure TfrmCadProcessoMT.MudarParametrosTela;
begin
  dbgrdDet.Selected.Clear;
  dbgrdDet.Selected.Add('DESCRICAO'+#9+'40'+#9+'Descrição do Objeto Reclamado');
  dbgrdDet.Selected.Add('VALORRECL'+#9+'16'+#9+'Valor '+FU.IFF(Modulo.IdContraCheque=REFER,'da Causa','Reclamado'));
  case (Sistema.IdModulo) of
    MODCON  :
    begin
      dbgrdDet.Selected.Add('PERCORIG'+#9+'10'+#9+'Probab. Original (%)');
      dbgrdDet.Selected.Add('PERCPROB'+#9+'17'+#9+'Probab. Contra-Parte (%)');
      MontaSelect := MontaSelectMODCON;
      ntbkTipoModulo.ActivePage := 'ModCon';
      Caption := 'Processo Trabalhista';
      FrgSituacao := rgSituacao_ModCon;
      FlblSitReq := lblSitReq_ModCon;
      FlblSitLit := lblSitLit_ModCon;
    end;
    PROCJUD :
    begin
      dbgrdDet.Selected.Add('PERCPROB'+#9+'17'+#9+'Probab. Contra-Parte (%)');
      MontaSelect := MontaSelectPROCJUD;
      ntbkTipoModulo.ActivePage := 'ProcJud';
      Caption := 'Processo Judicial';
      FrgSituacao := rgSituacao_ProcJud;
      FedNomeRequerente := edNomeRequerente_ProcJud;
      FbbtnProcRequerente := bbtnProcRequerente_ProcJud;
    end;
    PROCPREV :
    begin
      dbgrdDet.Selected.Add('PERCPROB'+#9+'17'+#9+'Probab. Contra-Parte (%)');
      MontaSelect := MontaSelectPROCPREV;
      ntbkTipoModulo.ActivePage := 'ProcPrev';
      Caption := 'Processo Previdenciário';
      FrgSituacao := rgSituacao_ProcPrev;
      FlblSitReq := lblSitReq_ProcPrev;
      FlblSitLit := lblSitLit_ProcPrev;
      FedNomeRequerente := edNomeRequerente_ProcPrev;
      FbbtnProcRequerente := bbtnProcRequerente_ProcPrev;
    end;
  end;
  dbgrdDet.Selected.Add('VALORPROVAVEL'+#9+'12'+#9+'Valor Estimado');
  dbgrdDet.Selected.Add('VALORSENTENCA'+#9+'10'+#9+'Valor Real');
  dbgrdDet.Selected.Add('OBSERVACAO'+#9+'240'+#9+'Observação');

  MudarMontaSelectProcVinc;
  ntbkDadosRequerente.ActivePage := ntbkTipoModulo.ActivePage;

  if (Sistema.IdModulo = MODCON) then
  begin
    ntbkDadosLitisconsorte.ActivePage := 'ModCon';
    CMProcuraAdv1.Caption := 'Escritório/Advogado do Reclamante';
//    lblNumTRT.Caption := 'Número no TRT';
//    lblNumTST.Caption := 'Número no TST';
//    lblVara.Caption := 'Vara do Trabalho';
//    lblTRT.Caption := 'TRT';
    FdblckMotivoLit := dblckMotivoLit_ModCon;
    CMProcuraLitisEmpregado.DataSource := dsLitis;
    CMProcuraLitisEmpresa.DataSource := dsLitis;
  end
  else
  begin
    frmProcuraPessoaDocMT := TfrmProcuraPessoaDocMT.Create(Application);

    ntbkDadosLitisconsorte.ActivePage := 'Outros';
    CMProcuraAdv1.Caption := 'Escritório/Advogado da Contra-Parte';
//    lblNumTRT.Caption := 'Número na 2a Inst.';
//    lblNumTST.Caption := 'Número na Inst. Sup.';
//    lblVara.Caption := 'Órgão Jurisdicional (Vara) e Nº';
//    if (Sistema.IdModulo = PROCPREV) then
//      lblTRT.Caption := 'Tribunal';
    FdblckMotivoLit := dblckMotivoLit_Outros;
  end;
//  lblTRT.Visible := (Sistema.IdModulo in [MODCON,PROCPREV]);
end;

procedure TfrmCadProcessoMT.MudarMontaSelectProcVinc;
begin
  MontaSelectProcVinc.Colunas.Text := MontaSelect.Colunas.Text;
  MontaSelectProcVinc.Descricao.Text := MontaSelect.Descricao.Text;
  MontaSelectProcVinc.Filtro.Text := MontaSelect.Filtro.Text;
  MontaSelectProcVinc.Larguras.Text := MontaSelect.Larguras.Text;
  MontaSelectProcVinc.Mascaras.Text := MontaSelect.Mascaras.Text;
  MontaSelectProcVinc.SensivelACaixa.Text := MontaSelect.SensivelACaixa.Text;
  MontaSelectProcVinc.Tabelas.Text := MontaSelect.Tabelas.Text;
  MontaSelectProcVinc.TipoDeDado.Text := MontaSelect.TipoDeDado.Text;
end;

procedure TfrmCadProcessoMT.HabilitarDadosEncerramento;
begin
  //rgTipEncer.Visible := (FrgSituacao.ItemIndex = 1);
  //gbxDataEncer.Visible := (FrgSituacao.ItemIndex = 1);
  //lblValReal.Visible := (FrgSituacao.ItemIndex = 1);
  //dbedValReal.Visible := (FrgSituacao.ItemIndex = 1);

  rgTipEncer.Visible := (Cds.FieldByName('FLGSITPROC').asInteger = 1);
  gbxDataEncer.Visible := (Cds.FieldByName('FLGSITPROC').asInteger = 1);
  lblValReal.Visible := (Cds.FieldByName('FLGSITPROC').asInteger = 1);
  dbedValReal.Visible := (Cds.FieldByName('FLGSITPROC').asInteger = 1);
end;

procedure TfrmCadProcessoMT.GravarProcessoTrab;
begin
  bGravou := CtrlProcessoTrab.GravarProcessoTrab(
    FU.IFF(CdsParamRH.FieldByName('FLGCRIASUBCONTA').asInteger=1, CMProcuraReclamante.Text, ''));

  if not(bGravou) then
    MsgDlg(CtrlProcessoTrab.MessageInfo, 'Erro', mtWarning, [mbOk,mbHelp], 0);
end;

procedure TfrmCadProcessoMT.GravarIntegracao;
var
  bOkContab, bOkCAP: boolean;
begin
  if (bFazContab) and (bGravou) and (bAlterouValores) and (Trim(dblckTipOper.Text) <> '') then
  begin
    IniciarValoresContabeis;

{    bOkContab := CtrlProcessoTrab.GerarIntegracaoContabil(
      Copy(DateToStr(Date),7,4) + Copy(DateToStr(Date),3,3),
      CdsPartic.FieldByName('DATADEMISSAO').asDateTime,
      Cds.FieldByName('IDADVOGRECDA').asFloat,
      IdPlanoPrev,
      IdPatro,
      CdsTipoOper.FieldByName('TIPCODIGO').asString,
      rgJuros.ItemIndex = 0,
      redJuros.Value);}

    if (bOkContab) then
      MsgDlg(CtrlProcessoTrab.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0)
    else
      MsgDlg(CtrlProcessoTrab.MessageInfo, 'Aviso', mtWarning, [mbOk,mbHelp], 0);
  end;

{
  if (bFazCAP) and (bGravou) and (bAlterouValores) and (Trim(dblckTipoDoc.Text) <> '') and
     (Trim(dblckTipoDesemb.Text) <> '') then
  begin
    Modulo.PrimeiroCodTipDoc := dblckTipoDoc.LookupValue;
    bOkCAP := CtrlHonorarioProcesso.GerarIntegracaoCAPCAR(
      dtPagamento.Date,
      Cds.FieldByName('IDADVOGRECDA').asInteger,
      0,//Modulo.UnidNegoc,
      0,//Modulo.CodTipDoc,
      '',//Modulo.CodCentroRespon,
      CdsTipoDesemb.FieldByName('CODTIPRECDES').asString,
      //IdPlanoPrev,
      //IdPatro,
      CdsTipoDesemb.FieldByName('PLANO').asInteger,
      CdsTipoDesemb.FieldByName('PLACONTA').asString);

    if (bOkCAP) then
      MsgDlg(CtrlHonorarioProcesso.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0)
    else
      MsgDlg(CtrlHonorarioProcesso.MessageInfo, 'Aviso', mtWarning, [mbOk,mbHelp], 0);
  end;}
end;

procedure TfrmCadProcessoMT.dbedNumJCJExit(Sender: TObject);
begin
  inherited;
  if (ds.State = dsInsert) and
     (CtrlProcessoTrab.VerificaNumProcesso(trim(dbedNumJCJ.Text))) then
      MsgDlg('Existe Processo com esse número.'+CR_LF+
             'Sugiro verificar em Consulta Processo de Qualquer Matéria',
             'Aviso',mtInformation,[mbOk,mbHelp],0);
end;

procedure TfrmCadProcessoMT.sbtnFichaClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  with TfrmParamFichaProc.Create(Application) do
  begin
    edNumero.Text := dbedNumero.Text;
    edContraParte.Text := FedNomeRequerente.Text;
    sTipoPessoa := 'F';
    HabilitarBtOk;
    if (ShowModal = mrOk) then
    begin
      RptFichaProc := TRptFichaProc.Create(Application);
      RptFichaProc.CrmRptCM.IdReports := 567;
      RptFichaProc.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
      RptFichaProc.CrmRptCM.OrigemCM := 1;
      RptFichaProc.CrmRptCM.IdModulo := Sistema.IdModulo;
      RptFichaProc.CrmRptCM.IdUsuario := Sistema.IdUsuario;
      for c:=0 to Cmp_Padrao.Params.Count-1 do
        RptFichaProc.CmpRptCM.ParamValues[c].Value := Cmp_Padrao.ParamValues[c].Value;
      RptFichaProc.CrmRptCM.Print;
      FreeAndNil(RptFichaProc);
    end;
  end;
end;

end.
