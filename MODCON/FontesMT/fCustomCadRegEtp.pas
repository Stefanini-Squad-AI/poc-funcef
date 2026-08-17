unit fCustomCadRegEtp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls, Mask, TREdit,
  wwdbedit, wwdblook, CMProcuraSubTipo, wwdbdatetimepicker, CMDateTimePicker, uCMClientDataSet,
  CmEventosCadastro, ImgList, FCadastroMestreDetMT, DBClient, uCtrlGlobalRH, uCtrlProcessoTrab,
  uCtrlEtapaProcesso, uCtrlListTerceirosRH, uCtrlTipRec, uCtrlPeriodo, uCtrlHonorarioProcesso,
  IvEMulti, FTelaAut, uCmSqlParams, uCtrlDestacamento;

type
  TfrmCustomCadRegEtp = class(TFrmCadastroMestreDetMT)
    dsIMGAux: TwwDataSource;
    tbshCAP: TTabSheet;
    gbxCAP: TGroupBox;
    Label47: TLabel;
    dblckTipoDoc: TwwDBLookupCombo;
    Label46: TLabel;
    dtLancamento: TCMDateTimePicker;
    gbxContabilizacao: TGroupBox;
    dblckTipOper: TwwDBLookupCombo;
    ToolbarSep972: TToolbarSep97;
    sbtnImagem: TToolbarButton97;
    Label1: TLabel;
    Label2: TLabel;
    dbedNumero: TDBEdit;
    dbedDataAju: TCMDateTimePicker;
    CdsDet: TCMClientDataSet;
    gbkTipoDesemb: TGroupBox;
    dblckTipoDesemb: TwwDBLookupCombo;
    CdsTipoDesemb: TCMClientDataSet;
    CdsTipoOper: TCMClientDataSet;
    CdsTipoDoc: TCMClientDataSet;
    CdsTipoEtapa: TCMClientDataSet;
    CdsImagem: TCMClientDataSet;
    CdsIMGAux: TCMClientDataSet;
    CdsHonorarios: TCMClientDataSet;
    cmprocFonecedor: TCMProcuraForCli;
    StaticText1: TStaticText;
    dbedDataNot: TCMDateTimePicker;
    Label7: TLabel;
    dblckTipoEtp: TwwDBLookupCombo;
    Label4: TLabel;
    dtedDataReal: TCMDateTimePicker;
    mskedHora: TMaskEdit;
    Label3: TLabel;
    dbedAssunto: TDBEdit;
    Label6: TLabel;
    dbmObserv: TDBMemo;
    btnPenhora: TBitBtn;
    CdsEventoImovel: TCMClientDataSet;
    CdsImovel: TCMClientDataSet;
    lblHonor: TLabel;
    dbredHonor: TRealEdit;
    sbtnProcurarLitis: TToolbarButton97;
    dbrgAbate: TDBRadioGroup;
    Label42: TLabel;
    dbedValRec: TDBRealEdit;
    lblCustas: TLabel;
    dbedCustas: TDBRealEdit;
    btnContaBanc: TBitBtn;
    Label5: TLabel;
    bbtnMulta: TBitBtn;
    lblNumSeqVinc: TLabel;
    dbedNumSeqVinc: TDBRealEdit;
    tbshCAR: TTabSheet;
    gbkTipoReceb: TGroupBox;
    dblckTipoReceb: TwwDBLookupCombo;
    cmprocPagador: TCMProcuraForCli;
    GroupBox2: TGroupBox;
    LabelTipDoc: TLabel;
    Label9: TLabel;
    dblckTipoDocRec: TwwDBLookupCombo;
    dtLancamentoRec: TCMDateTimePicker;
    CdsTipoReceb: TCMClientDataSet;
    CdsTipoDocRec: TCMClientDataSet;
    Label10: TLabel;
    dblkcAlterador: TwwDBLookupCombo;
    Label11: TLabel;
    CdsTipoAlterador: TCMClientDataSet;
    Label8: TLabel;
    dtPagamento: TCMDateTimePicker;
    Label12: TLabel;
    dblckFormaPagto: TwwDBLookupCombo;
    Label13: TLabel;
    Label14: TLabel;
    dblckFormaReceb: TwwDBLookupCombo;
    dtRecebimento: TCMDateTimePicker;
    tbshCapCar: TTabSheet;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    dblkPrograma: TwwDBLookupCombo;
    CdsCentroCusto: TCMClientDataSet;
    CdsCentroResponsabilidade: TCMClientDataSet;
    qryCentroCusto: TCMSqlParams;
    qryCentroResponsabilidade: TCMSqlParams;
    dblkCentroCusto: TwwDBLookupCombo;
    dblkCentroResponsabilidade: TwwDBLookupCombo;
    CdsPrograma: TCMClientDataSet;
    CdsFormaPag: TCMClientDataSet;
    CdsFormaRec: TCMClientDataSet;
    Procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnImagemClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure CdsDetBeforeEdit(DataSet: TDataSet);
    procedure CdsDetAfterScroll(DataSet: TDataSet);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure dblckTipoEtpChange(Sender: TObject);
    procedure btnPenhoraClick(Sender: TObject);
    procedure CdsDetAfterInsert(DataSet: TDataSet);
    procedure CdsDetBeforePost(DataSet: TDataSet);
    procedure CdsDetBeforeDelete(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnProcurarLitisClick(Sender: TObject);
    procedure btnContaBancClick(Sender: TObject);
    procedure bbtnMultaClick(Sender: TObject);
    procedure dblckTipoEtpCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CdsAfterScroll(DataSet: TDataSet);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlProcessoTrab: TCtrlProcessoTrab;
    CtrlHonorarioProcesso: TCtrlHonorarioProcesso;
    CtrlEtapaProcesso: TCtrlEtapaProcesso;
    CtrlPeriodo: TCtrlPeriodo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlTipRec: TCtrlTipRec;
    CtrlDestacamento: TCtrlDestacamento;

    dValDespesaTot, dValHonorAntes, dValCustasAntes, IdImovelAntes,
    dValorDepAntes, dValorPenAntes, dValorConAntes, dValorLevAntes,
    dValorDep, dValorPen, dValorCon, dValorLev, dValorAlt,
    dValorInv, dValorInvAntes: double;
    bAlterouValores, bFazCAP, bFazContab, bFazDiferenca, bFazCAR,
    bFazAlterador, bAjustarObjetos: boolean;
    iNumSeqAtual, IdPatro, IdPlanoPrev, IdPatroInvest, IdPlanoInvest: integer;
    IdBemAntes,IdConjuntoAntes: double;
    dValorObj, dValCausa, dValOrig, dValAtual, dValReal: double;

    procedure IniciarValoresContabeis;
    procedure Sel(NumProcTrab: double);
    procedure GravarHonorarioEtapa;
    function  GravarRegistro: boolean;
  protected
    procedure OnClick_ProcurarProcesso; virtual; abstract;
    procedure OnClick_ProcurarProcessoComLitisconsortes; virtual; abstract;
  end;

var
  frmCustomCadRegEtp: TfrmCustomCadRegEtp;

implementation

uses uSistema, uMensErro, fAguarde, uModulo, uCtrlPadroes, uCtrlParamIntegra,
  uCtrlFuncoesRH, uCtrlUsoGeralRH, dCds, fCadRegPenhora, fCadRegContaBanc,
  fCadRegMulta, fCadRegEtp;

{$R *.DFM}

procedure TfrmCustomCadRegEtp.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlEtapaProcesso := TCtrlEtapaProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlEtapaProcesso.InitializeAs(Padroes);
  CtrlEtapaProcesso.CdsProcesso := Cds;
  CtrlEtapaProcesso.CdsEtapas := CdsDet;
  CtrlEtapaProcesso.CdsImagens := CdsImagem;
  CtrlEtapaProcesso.CdsHonorarios := CdsHonorarios;
  CtrlEtapaProcesso.CdsImovel := CdsImovel;
  CtrlEtapaProcesso.CdsEventoImovel := CdsEventoImovel;

  CtrlProcessoTrab := TCtrlProcessoTrab.Create(Sistema.IdModulo, Sistema.IdUsuario,
    Sistema.IdEmpresa, Sistema.UsaPlanoPatro, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlProcessoTrab.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.InitializeAs(Padroes);

  CtrlTipRec := TCtrlTipRec.Create;
  CtrlTipRec.InitializeAs(Padroes);

  CtrlHonorarioProcesso := TCtrlHonorarioProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlHonorarioProcesso.InitializeAs(Padroes);

  CtrlDestacamento := TCtrlDestacamento.Create(Sistema);
  CtrlDestacamento.InitializeAs(Padroes);

  CdsHonorarios.Data := CtrlHonorarioProcesso.ListTabHonorarioEmBranco;
  CdsTipoEtapa.Data := CtrlTipRec.ListTipRec;
  CdsIMGAux.Data := CtrlEtapaProcesso.ListImagens(-1);
  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGINTEGRACAP, FLGINTEGRACONT');
  CdsImovel.Data := CtrlListTerceirosRH.ListImovel;
  CdsEventoImovel.Data := CtrlListTerceirosRH.ListEventoImovelVazio;

  sbtnProcurarClick(Self);
  if not(MontaSelect.RetornouValor) then
    Sel(-1);

  // Integração com o CAP
  bFazCAP := (dmCds.Cds.FieldByName('FLGINTEGRACAP').asInteger = 1);
  gbxCAP.Visible := bFazCAP;

  if (bFazCAP) then
  begin
    CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocRecPag('P');
    CdsTipoDocRec.Data := CtrlListTerceirosRH.ListTipoDocRecPag('R');
  end;

  // Integração com a Contabilidade
  bFazContab := (dmCds.Cds.FieldByName('FLGINTEGRACONT').asInteger = 1) and
    (CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, DateToStr(Date)));
  gbxContabilizacao.Visible := bFazContab;

  if (bFazContab) then
  begin
    // Pega o ID da Patrocinadora e do Plano Previdenciário
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

    CdsTipoOper.Data := CtrlListTerceirosRH.ListTipoOperacao;
  end;

  gbkTipoDesemb.Visible := (bFazCAP) or (bFazContab);

  tbcDetalhe.detdbGrids.Clear;
  tbcDetalhe.detdbGrids.Add('dbgrdDet');
  tbcDetalhe.Tabs.Clear;
  tbcDetalhe.Tabs.Add('Etapas (Andamento) do Processo');
  if (bFazCAP) or (bFazContab) then
  begin
    if (bFazCAP) then
    begin
      dtPagamento.Date := Date;
      dtRecebimento.Date := Date;
      dtLancamento.Date := Date;
      dtLancamentoRec.Date := Date;
    end;

    tbcDetalhe.detdbGrids.Add('');
    tbcDetalhe.detdbGrids.Add('');
    tbcDetalhe.detdbGrids.Add('');
    if (bFazCAP) and not(bFazContab) then
      tbcDetalhe.Tabs.Add('Contas a Pagar')
    else
    if not(bFazCAP) and (bFazContab) then
      tbcDetalhe.Tabs.Add('Contabilização')
    else
      tbcDetalhe.Tabs.Add('Contabilização e Contas a Pagar');

    tbcDetalhe.Tabs.Add('Contas a Receber (Levantamentos)');
    tbcDetalhe.Tabs.Add('CAP/CAR');

    CdsTipoDesemb.Data := CtrlListTerceirosRH.ListTipoDocRecebDesemb(
      Sistema.IdEmpresa, 'P', true);

    CdsTipoReceb.Data := CtrlListTerceirosRH.ListTipoDocRecebDesemb(
      Sistema.IdEmpresa, 'R', true);

    CdsTipoAlterador.Data := CtrlListTerceirosRH.ListTipoAlterador(
      Sistema.IdEmpresa, 'R');

    CdsCentroCusto.Data            := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa), '', false);
    CdsCentroResponsabilidade.Data := ctrlDestacamento.listarCentroResponsabilidade(Sistema.IdUsuario);
    CdsPrograma.Data := CtrlListTerceirosRH.ListPrograma;

    CdsFormaPag.Data := CtrlListTerceirosRH.ListFormaRecPag('P', Sistema.IdEmpresa);
    CdsFormaRec.Data := CtrlListTerceirosRH.ListFormaRecPag('R', Sistema.IdEmpresa);

    CtrlEtapaProcesso.IniciarIntegracao(Sistema.IdEmpresa, Sistema.IdModulo,
      Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.UsaPlanoPatro,
      ParamIntegra.ObrigaAbc, ParamIntegra.ObrigaCRespon,
      ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal);
  end;

  IniciarValoresContabeis;
end;

procedure TfrmCustomCadRegEtp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlEtapaProcesso);
  FreeAndNil(CtrlHonorarioProcesso);
  FreeAndNil(CtrlProcessoTrab);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPeriodo);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlTipRec);
  FreeAndNil(CtrlDestacamento);

  if Assigned(frmCadRegPenhora) then
    FreeAndNil(frmCadRegPenhora);
  inherited;

end;

procedure TfrmCustomCadRegEtp.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
    IniciarValoresContabeis;
    iNumSeqAtual := CtrlEtapaProcesso.GetUltimoNumSeq;
  end;
end;

procedure TfrmCustomCadRegEtp.CmeDetalheDelete(Sender: TObject);
begin
  IdBemAntes := CdsDet.FieldByName('IDBEM').asFloat;
  IdConjuntoAntes := CdsDet.FieldByName('IDCONJUNTO').asFloat;

  if (CdsHonorarios.Locate('NUMSEQ', CdsDet.FieldByName('NUMSEQ').asFloat, [])) then
    CdsHonorarios.Delete;
  if (CdsImagem.Locate('IDIMAGEM', CdsDet.FieldByName('IDIMAGEM').asFloat, [])) then
    CdsImagem.Delete;
  inherited;
end;

procedure TfrmCustomCadRegEtp.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCustomCadRegEtp.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
var
  bOk: boolean;
  iCodTipDoc: integer;
  sTipCodigo: string;
begin
  inherited;
  if (Cds.FieldByName('IDPATRO').asInteger > 0) and (IdPatroInvest = 0) then
    IdPatro := Cds.FieldByName('IDPATRO').asInteger;

  if (Cds.FieldByName('IDPLANOPREV').asInteger > 0) and (IdPlanoInvest = 0) then
    IdPlanoPrev := Cds.FieldByName('IDPLANOPREV').asInteger;

  Accept := GravarRegistro;
  if (Accept) and (bAlterouValores) and ((bFazCAP) or (bFazContab)) then
  begin
    frmAguarde.pbAguarde.Visible := false;
    frmAguarde.Mostra('Fazendo Integração...');

    if (bFazCAP) then
      iCodTipDoc := CdsTipoDoc.FieldByName('CODTIPDOC').asInteger
    else
      iCodTipDoc := 0;

    if (bFazContab) then
      sTipCodigo := CdsTipoOper.FieldByName('TIPCODIGO').asString
    else
      sTipCodigo := '';

    bOk := CtrlEtapaProcesso.GerarIntegracao(
      bFazCAP, bFazContab, FU.IFF(dtLancamento.Text='',Date,dtLancamento.Date),
      FU.IFF(dtPagamento.Text='',Date,dtPagamento.Date),
      cmprocFonecedor.ForCliReg.Id,
      IdPlanoPrev, IdPatro, CdsTipoDesemb.FieldByName('PLACONTA').asString,
      CdsTipoDesemb.FieldByName('PLANO').asInteger,
      CdsTipoDesemb.FieldByName('PLACONTACREDITO').asString,
      sTipCodigo, CdsTipoDesemb.FieldByName('CODTIPRECDES').asString,
      CdsCentroResponsabilidade.FieldByName('CODCENTRORESPON').asString,
      CdsCentroCusto.FieldByName('CODCENTROCUSTO').asString,
      iCodTipDoc,
      CdsFormaPag.FieldByName('CODFORMA').asInteger,
      CdsPrograma.FieldByName('IDPROGRAMA').asInteger);

    frmAguarde.Apaga;
    frmAguarde.pbAguarde.Visible := true;

    if (bOk) then
      MsgDlg(CtrlEtapaProcesso.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0)
    else
      MsgDlg(CtrlEtapaProcesso.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
  end;

  if (Accept) and (bFazDiferenca) and ((bFazCAP) or (bFazContab)) then
  begin
    frmAguarde.pbAguarde.Visible := false;
    frmAguarde.Mostra('Fazendo Integração...');

    if (bFazCAP) then
      iCodTipDoc := CdsTipoDoc.FieldByName('CODTIPDOC').asInteger
    else
      iCodTipDoc := 0;

    if (bFazContab) then
      sTipCodigo := CdsTipoOper.FieldByName('TIPCODIGO').asString
    else
      sTipCodigo := '';

    bOk := CtrlEtapaProcesso.GerarIntegracao(
      bFazCAP, bFazContab, FU.IFF(dtLancamento.Text='',Date,dtLancamento.Date),
      FU.IFF(dtPagamento.Text='',Date,dtPagamento.Date),
      cmprocFonecedor.ForCliReg.Id,
      IdPlanoPrev, IdPatro, CdsTipoDesemb.FieldByName('PLACONTA').asString,
      CdsTipoDesemb.FieldByName('PLANO').asInteger,
      CdsTipoDesemb.FieldByName('PLACONTACREDITO').asString,
      sTipCodigo, CdsTipoDesemb.FieldByName('CODTIPRECDES').asString,
      CdsCentroResponsabilidade.FieldByName('CODCENTRORESPON').asString,
      CdsCentroCusto.FieldByName('CODCENTROCUSTO').asString,
      iCodTipDoc,
      CdsFormaPag.FieldByName('CODFORMA').asInteger,
      CdsPrograma.FieldByName('IDPROGRAMA').asInteger,
      dValorDep+dValorPen+dValorInv-dValorDepAntes-dValorPenAntes-dValorInvAntes);

    frmAguarde.Apaga;
    frmAguarde.pbAguarde.Visible := true;

    if (bOk) then
      MsgDlg(CtrlEtapaProcesso.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0)
    else
      MsgDlg(CtrlEtapaProcesso.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
  end;

  if (Accept) and (bFazCAR) then
  begin
    frmAguarde.pbAguarde.Visible := false;
    frmAguarde.Mostra('Fazendo Integração CAR...');

    if (bFazCAR) then
      iCodTipDoc := CdsTipoDocRec.FieldByName('CODTIPDOC').asInteger
    else
      iCodTipDoc := 0;

    sTipCodigo := '';

    bOk := CtrlEtapaProcesso.GerarIntegracao(
      bFazCAP, bFazContab, FU.IFF(dtLancamentoRec.Text='',Date,dtLancamentoRec.Date),
      FU.IFF(dtRecebimento.Text='',Date,dtRecebimento.Date),
      cmprocPagador.ForCliReg.Id,
      IdPlanoPrev, IdPatro, CdsTipoReceb.FieldByName('PLACONTA').asString,
      CdsTipoReceb.FieldByName('PLANO').asInteger,
      CdsTipoReceb.FieldByName('PLACONTACREDITO').asString,
      sTipCodigo, CdsTipoReceb.FieldByName('CODTIPRECDES').asString,
      CdsCentroResponsabilidade.FieldByName('CODCENTRORESPON').asString,
      CdsCentroCusto.FieldByName('CODCENTROCUSTO').asString,
      iCodTipDoc,
      CdsFormaRec.FieldByName('CODFORMA').asInteger,
      CdsPrograma.FieldByName('IDPROGRAMA').asInteger,
      0, FU.IFF(bFazAlterador, dValorDep+dValorPen-dValorCon-dValorLevAntes, dValorLev-dValorLevAntes),
      abs(dValorAlt),
      FU.IFF(bFazAlterador, CdsTipoAlterador.FieldByName('CODALTERADOR').asInteger, 0));

    frmAguarde.Apaga;
    frmAguarde.pbAguarde.Visible := true;

    if (bOk) then
      MsgDlg(CtrlEtapaProcesso.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0)
    else
      MsgDlg(CtrlEtapaProcesso.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
  end;
end;

procedure TfrmCustomCadRegEtp.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert,dsEdit]) then
    dblckTipoEtp.SetFocus;
end;

procedure TfrmCustomCadRegEtp.CdsDetAfterScroll(DataSet: TDataSet);
begin
  sbtnImagem.Enabled := not(CdsDet.IsEmpty);
  dtedDataReal.Text := '';
  mskedHora.Text := '';
  if not(CdsDet.FieldByName('DATAREALOCOR').IsNull) then
  begin
    dtedDataReal.Date := StrToDate(DateToStr(CdsDet.FieldByName('DATAREALOCOR').asDateTime));
    mskedHora.Text := Copy(CdsDet.FieldByName('DATAREALOCOR').asString,12,5);
  end;
  inherited;
end;

procedure TfrmCustomCadRegEtp.CdsDetBeforeEdit(DataSet: TDataSet);
begin
  // CtrlEtapaProcesso.AtualizarTotalDespesas(CdsDet.FieldByName('VALORCUSTAS').asFloat);
  dValCustasAntes := CdsDet.FieldByName('VALORCUSTAS').asFloat;
  dValHonorAntes := 0;
  IdImovelAntes := CdsDet.FieldByName('IDIMOVEL').asFloat;
  inherited;
end;

procedure TfrmCustomCadRegEtp.dblckTipoEtpChange(Sender: TObject);
begin
  btnPenhora.Enabled := (CdsTipoEtapa.FieldByName('FLGPENHORA').asInteger = 1);
  if (CdsTipoEtapa.FieldByName('FLGPENHORA').asInteger = 1) then
    dbrgAbate.ItemIndex := 1;

  if (CdsTipoEtapa.FieldByName('VALORHONOR').asFloat <> 0)  then
  begin
    lblHonor.Visible := true;
    dbredHonor.Visible := true;
    if sbtnInsDet.Down then
      dbredHonor.Value := CdsTipoEtapa.FieldByName('VALORHONOR').asFloat;
    //dbedAssunto.Width := 436;
  end
  else
  begin
    lblHonor.Visible := false;
    dbredHonor.Visible := false;
    dbredHonor.Value := 0;
    //dbedAssunto.Width := 618;
  end;
end;

procedure TfrmCustomCadRegEtp.sbtnImagemClick(Sender: TObject);
var
  bInserir: boolean;
begin
  CdsIMGAux.EmptyDataSet;
  bInserir := not(CdsImagem.Locate('NUMSEQ', CdsDet.FieldByName('NUMSEQ').asInteger, []));
  if not(bInserir) then
  begin
    CdsIMGAux.Insert;
    CdsIMGAux.FieldByName('IDIMAGEM').asFloat := CdsImagem.FieldByName('IDIMAGEM').asFloat;
    TBlobField(CdsIMGAux.FieldByName('IMAGEM')).Value :=
      TBlobField(CdsImagem.FieldByName('IMAGEM')).Value;
    CdsIMGAux.FieldByName('DESCRIMAGEM').asString := CdsImagem.FieldByName('DESCRIMAGEM').asString;
    CdsIMGAux.Post;
  end;

  FU.AssociarImagem(dsIMGAux, TBlobField(CdsIMGAux.FieldByName('IMAGEM')),
    TFloatField(CdsDet.FieldByName('IDIMAGEM')), 'Documento',
    (CdsDet.State in [dsInsert,dsEdit]), (CdsDet.State in [dsInsert,dsEdit]));

  if (CdsDet.FieldByName('IDIMAGEM').asFloat <= 0) then
  begin
    if not(bInserir) then
      CdsImagem.Delete;
  end
  else
  begin
    if (bInserir) then
    begin
      CdsImagem.Insert;
      CdsImagem.FieldByName('NUMSEQ').asInteger := CdsDet.FieldByName('NUMSEQ').asInteger;
      CdsImagem.FieldByName('IDIMAGEM').asFloat := CdsIMGAux.FieldByName('IDIMAGEM').asFloat;
    end
    else
      CdsImagem.Edit;

    TBlobField(CdsImagem.FieldByName('IMAGEM')).Value :=
      TBlobField(CdsIMGAux.FieldByName('IMAGEM')).Value;
    CdsImagem.FieldByName('DESCRIMAGEM').asString := CdsIMGAux.FieldByName('DESCRIMAGEM').asString;
    CdsImagem.Post;
  end;
end;

procedure TfrmCustomCadRegEtp.bbtnOkDetClick(Sender: TObject);
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

  if (Trim(dbedAssunto.Text) = '') then
    dbedAssunto.Text := dblckTipoEtp.Text;

  if (dbedNumSeqVinc.Value > 0) and
     ((dbedNumSeqVinc.Value > iNumSeqAtual) or
      (dbedNumSeqVinc.Value = CdsDet.FieldByName('NUMSEQ').asInteger)) then
  begin
    MsgDlg('Etapa Vinculada Inválida.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedNumSeqVinc.SetFocus;
    exit;
  end;

  CdsDet.FieldByName('ETAPA').asString := CdsTipoEtapa.FieldByName('DESCRICAO').asString;

  // Incrementar Número de sequência
  if (CdsDet.State = dsInsert) then
  begin
    Inc(iNumSeqAtual);
    CdsDet.FieldByName('NUMSEQ').asInteger := iNumSeqAtual;
  end;

  // Atualizar Total de Despesas
  CtrlEtapaProcesso.AtualizarTotalDespesas(
    CdsDet.FieldByName('VALORCUSTAS').asFloat - dValCustasAntes);
  dValHonorAntes := 0;

  // Gravação do Honorário referente à Etapa
  GravarHonorarioEtapa;

  lblHonor.Visible := false;
  dbredHonor.Visible := false;

  // Gravar a Data + Hora da Data Ocorrência
  if (mskedHora.Text = '  :  ') then
    CdsDet.FieldByName('DATAREALOCOR').asDateTime := dtedDataReal.Date
  else
    CdsDet.FieldByName('DATAREALOCOR').asDateTime := dtedDataReal.Date +
      StrToTime(mskedHora.Text);

  bAjustarObjetos := (bAjustarObjetos) or
    ((CdsTipoEtapa.FieldByName('FLGEXECUCAO').asInteger = 1) and
     (dsDet.State = dsInsert) and (Cds.FieldByName('FLGSITPROC').asInteger = 0)  and
     (MsgDlg('Deseja alterar a probabilidade atual dos objetos para 100% ?', 'Confirmação',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes));

  inherited;
  if CdsDet.FieldByName('IDPLANPREVCTBPATR').asFloat > 0 then
  begin
    dmCds.Cds.Data := CtrlListTerceirosRH.ListPlanoPatro(
      CdsDet.FieldByName('IDPLANPREVCTBPATR').asFloat);
    IdPatroInvest := dmCds.Cds.FieldByName('IDPATRO').asInteger;
    IdPlanoInvest := dmCds.Cds.FieldByName('IDPLANOPREV').asInteger;
  end;
end;

procedure TfrmCustomCadRegEtp.bbtnConfirmarClick(Sender: TObject);
begin
  // Verifica Depósitos vs ((Levantamento + Convolação)
  bFazDiferenca := false;
  dValorDep := 0;
  dValorPen := 0;
  dValorInv := 0;
  dValorCon := 0;
  dValorLev := 0;
  dValorAlt := 0;
  CdsDet.First;
  while not CdsDet.Eof do
  begin
    if (CdsDet.FieldByName('FLGVALORABATE').asInteger = 1)  then
      dValorDep := dValorDep + CdsDet.FieldByName('VALORREC').asFloat;

    if (CdsDet.FieldByName('FLGVALORABATE').asInteger = 2) and
        (CdsDet.FieldByName('INDPENHORA').asInteger = 4) then
      dValorPen := dValorPen + CdsDet.FieldByName('VALORREC').asFloat;

    if (CdsDet.FieldByName('FLGVALORABATE').asInteger = 2) and
        (CdsDet.FieldByName('INDPENHORA').asInteger = 3) then
      dValorInv := dValorInv + CdsDet.FieldByName('VALORREC').asFloat;

    if (CdsDet.FieldByName('FLGVALORABATE').asInteger = 3) then
      dValorLev := dValorLev + CdsDet.FieldByName('VALORREC').asFloat;

    if (CdsDet.FieldByName('FLGVALORABATE').asInteger = 4) then
      dValorCon := dValorCon + CdsDet.FieldByName('VALORREC').asFloat;

    CdsDet.Next;
  end;
  CdsDet.First;
  if (dValorLev+dValorCon-dValorLevAntes-dValorConAntes = 0) and
     (dValorDep+dValorPen+dValorInv-dValorDepAntes-dValorPenAntes-dValorInvAntes > 0) then
    bFazDiferenca := ((bFazCAP) or (bFazContab)) and
      (MsgDlg('Encontrei os seguintes valores: '+CR_LF+
             'Variação de Depósitos'+#9+#9+#9+'= '+FormatFloat('###,###,##0.00',dValorDep-dValorDepAntes)+CR_LF+
             'Variação de Penhoras de Numerário'+#9+'= '+FormatFloat('###,###,##0.00',dValorPen-dValorPenAntes)+CR_LF+
             'Variação de Penhoras de Investim.'+#9+'= '+FormatFloat('###,###,##0.00',dValorInv-dValorInvAntes)+CR_LF+
             FU.IFF((Cds.FieldByName('FLGSITPROC').asInteger = 0) AND
               (dValorDep+dValorPen+dValorInv-dValorDepAntes-dValorPenAntes-dValorInvAntes > dValAtual),CR_LF+
               'ALERTA: Supera o Valor Estimado Atual de ' +FormatFloat('###,###,##0.00',dValAtual)+CR_LF+CR_LF, '')+
             FU.IFF((Cds.FieldByName('FLGSITPROC').asInteger = 1) AND
               (dValorDep+dValorPen+dValorInv-dValorDepAntes-dValorPenAntes-dValorInvAntes > dValReal),CR_LF+
               'ALERTA: Supera o Valor Real da Sentença de ' +FormatFloat('###,###,##0.00',dValReal)+CR_LF+CR_LF, '')+
             'Gera Evento Contábil e/ou Financeiro (AP) dessa variação de '+
        FormatFloat('###,###,##0.00',dValorDep+dValorPen+dValorInv-dValorDepAntes-dValorPenAntes-dValorInvAntes) +' ?', 'Confirmação',
             mtConfirmation, [mbYes, mbNo], 0) = mrYes);
  //

  bFazCAR := false;
  if (dValorLev > dValorLevAntes) then
      bFazCAR := ((bFazCAP) or (bFazContab)) and
       (MsgDlg('Encontrei os seguintes valores: '+CR_LF+
             'Variação de Depósitos'+#9+#9+#9+'= '+FormatFloat('###,###,##0.00',dValorDep-dValorDepAntes)+CR_LF+
             'Variação de Penhoras de Numerário'+#9+'= '+FormatFloat('###,###,##0.00',dValorPen-dValorPenAntes)+CR_LF+
             'Variação de Convolações'+#9+#9+'= '+FormatFloat('###,###,##0.00',dValorCon-dValorConAntes)+CR_LF+
             'Variação de Levantamentos'+#9+#9+'= '+FormatFloat('###,###,##0.00',dValorLev-dValorLevAntes)+CR_LF+
               'Gera Evento Financeiro (Contas a Receber) e/ou Contábil ?', 'Confirmação',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes);

  if (bFazCAR) and (bFazCAP) and
     ((Trim(dblckTipoDocRec.Text) = '') or (Trim(dblckTipoReceb.Text) = '') or
      (cmprocPagador.Text = '')) then
  begin
    tb97BotoesDetalhe.Visible := false;
    pgctrlDetalhe.ActivePage := tbshCAR;
    tbcDetalhe.TabIndex := tbshCAR.PageIndex;
    tbcDetalhe.Repaint;

    MsgDlg('Complemente os dados requeridos para a integração'+CR_LF+
           'do Contas a Receber.', 'Informação', mtWarning, [mbOk,mbHelp], 0);
    exit;
  end;

  if (bFazCAR) and (bFazContab) and (Trim(dblckTipOper.Text) = '') then
  begin
    tb97BotoesDetalhe.Visible := false;
    pgctrlDetalhe.ActivePage := tbshCAP;
    tbcDetalhe.TabIndex := tbshCAP.PageIndex;
    tbcDetalhe.Repaint;

    MsgDlg('Complemente os dados requeridos para a integração contábil.',
      'Informação', mtWarning, [mbOk,mbHelp], 0);
    exit;
  end;

  //
  bFazAlterador :=
    ((bFazCAR) and (dValorDep+dValorPen-dValorCon < dValorLev) and
     (MsgDlg('Encontrei Diferença A Maior de: '+
           FormatFloat('###,###,##0.00',-dValorDep-dValorPen+dValorCon + dValorLev)+CR_LF+
             'Gera Alterador de Acréscimo na GR ?', 'Confirmação',
              mtConfirmation, [mbYes, mbNo], 0) = mrYes))
    or
    ((bFazCAR) and (dValorDep+dValorPen-dValorCon > dValorLev) and
     (MsgDlg('Encontrei Diferença A Menor de: '+
           FormatFloat('###,###,##0.00',dValorDep+dValorPen-dValorCon - dValorLev)+CR_LF+
             'Gera Alterador de Decréscimo na GR ?', 'Confirmação',
              mtConfirmation, [mbYes, mbNo], 0) = mrYes));

  //
  if bFazAlterador then  // se for a menor, fica negativa
  begin
    dValorAlt := dValorLev-dValorDep-dValorPen+dValorCon;
    if (Trim(dblkcAlterador.Text) = '') then
    begin
      tb97BotoesDetalhe.Visible := false;
      pgctrlDetalhe.ActivePage := tbshCAR;
      tbcDetalhe.TabIndex := tbshCAR.PageIndex;
      tbcDetalhe.Repaint;
      MsgDlg('Selecione o Tipo de Alterador.',
        'Informação', mtWarning, [mbOk,mbHelp], 0);
      exit;
    end
    else if (dValorAlt > 0) and (copy(CdsTipoAlterador.FieldByName('ACRESDECRES').asString,1,1)='D') then
    begin
      tb97BotoesDetalhe.Visible := false;
      pgctrlDetalhe.ActivePage := tbshCAR;
      tbcDetalhe.TabIndex := tbshCAR.PageIndex;
      tbcDetalhe.Repaint;
      MsgDlg('Selecione um Alterador de Acréscimo.',
        'Informação', mtWarning, [mbOk,mbHelp], 0);
      exit;
    end
    else if (dValorAlt < 0) and (copy(CdsTipoAlterador.FieldByName('ACRESDECRES').asString,1,1)='A') then
    begin
      tb97BotoesDetalhe.Visible := false;
      pgctrlDetalhe.ActivePage := tbshCAR;
      tbcDetalhe.TabIndex := tbshCAR.PageIndex;
      tbcDetalhe.Repaint;
      MsgDlg('Selecione um Alterador de Decréscimo.',
        'Informação', mtWarning, [mbOk,mbHelp], 0);
      exit;
    end;
  end;

  bAlterouValores := (Cds.FieldByName('DESPESAPROC').asFloat <> dValDespesaTot);

  if ((bAlterouValores) or (bFazDiferenca)) and
     (bFazCAP) and ((Trim(dblckTipoDoc.Text) = '') or (Trim(dblckTipoDesemb.Text) = '')) then
  begin
    if (MsgDlg('Não Encontrei os dados requeridos para a integração do Contas a Pagar.'+CR_LF+
             'Se Deseja Essa Integração (Sim), Complemente os dados', 'Confirmação',
              mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      tb97BotoesDetalhe.Visible := false;
      pgctrlDetalhe.ActivePage := tbshCAP;
      tbcDetalhe.TabIndex := tbshCAP.PageIndex;
      tbcDetalhe.Repaint;
      exit;
    end
    else
      bFazCAP := false;
  end;

  if ((bAlterouValores) or (bFazDiferenca)) and
     (bFazContab) and (Trim(dblckTipOper.Text) = '') then
  begin
    if (MsgDlg('Não Encontrei os dados requeridos para a integração Contábil.'+CR_LF+
             'Se Deseja Essa Integração (Sim), Complemente os dados', 'Confirmação',
              mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      tb97BotoesDetalhe.Visible := false;
      pgctrlDetalhe.ActivePage := tbshCAP;
      tbcDetalhe.TabIndex := tbshCAP.PageIndex;
      tbcDetalhe.Repaint;
      exit;
    end
    else
      bFazContab := false;
  end;


  begin
    inherited;

    if (bAjustarObjetos) then
      if CtrlEtapaProcesso.AtualizarObjetos(Cds.FieldByName('NUMPROCTRAB').asFloat) then
        MsgDlg('Procedimento de ajuste dos objetos efetuado. ',
          'Aviso', mtInformation, [mbOk,mbHelp], 0);

    CmeCadastroFind(Sender);
    IniciarValoresContabeis;
  end;
end;

procedure TfrmCustomCadRegEtp.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  iNumSeqAtual := CtrlEtapaProcesso.GetUltimoNumSeq;
  bAjustarObjetos := false;
end;

procedure TfrmCustomCadRegEtp.btnPenhoraClick(Sender: TObject);
begin
  if  dtedDataReal.Text <> '' then
    if (mskedHora.Text = '  :  ') then
      CdsDet.FieldByName('DATAREALOCOR').asDateTime := dtedDataReal.Date
    else
      CdsDet.FieldByName('DATAREALOCOR').asDateTime := dtedDataReal.Date +
        StrToTime(mskedHora.Text);

  if CdsDet.FieldByName('DATAREALOCOR').IsNull then
  begin
    MsgDlg('Informe a Data da Penhora, antes de abrir esta tela', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dtedDataReal.SetFocus;
    exit;
  end;

  if not(Assigned(frmCadRegPenhora)) then
    frmCadRegPenhora := TfrmCadRegPenhora.Create(Application);

   frmCadRegPenhora.ExibirTelaPenhora(CdsDet);
end;

procedure TfrmCustomCadRegEtp.CdsDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  btnPenhora.Enabled := False;
  IdImovelAntes := 0;
end;

procedure TfrmCustomCadRegEtp.CdsDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (IdImovelAntes <> CdsDet.FieldByName('IDIMOVEL').asFloat) then
  begin
    if (CdsDet.FieldByName('IDIMOVEL').asFloat > 0) then // Início de Penhora
    begin
      CtrlEtapaProcesso.AtualizarImovel(CdsDet.FieldByName('IDIMOVEL').asFloat, true);
      CtrlEtapaProcesso.InserirEventoImovel(
        CdsDet.FieldByName('IDIMOVEL').asFloat,
        CdsDet.FieldByName('DATAREALOCOR').asDateTime, //EviData
        true,
        Copy(CdsDet.FieldByName('OBSERVETAPA').asString,1,2000),
        FU.IFF(CdsDet.FieldByName('INDVALOR').asInteger=3,CdsDet.FieldByName('VALOR').asFloat,100), //EviPercent
        CdsDet.FieldByName('VALORREC').asFloat) //EviVlrAjustado
    end;

    if (IdImovelAntes > 0) then // Término de Penhora
    begin
      CtrlEtapaProcesso.AtualizarImovel(IdImovelAntes, False);
      CtrlEtapaProcesso.InserirEventoImovel(
        IdImovelAntes,
        CdsDet.FieldByName('DATAREALOCOR').asDateTime, //EviData
        False,
        copy(CdsDet.FieldByName('OBSERVETAPA').asString,1,2000),
        0, //EviPercent
        0) //EviVlrAjustado
    end;
  end;

  if (IdImovelAntes > 0) and // Término de Penhora por Desconstituição
     (IdImovelAntes = CdsDet.FieldByName('IDIMOVEL').asFloat) and
     (CdsDet.FieldByName('VALORREC').asFloat < 0) then
  begin
    CtrlProcessoTrab.AtualizarImovel(IdImovelAntes, False);
    CtrlProcessoTrab.InserirEventoImovel(
      IdImovelAntes,
      CdsDet.FieldByName('DATAREALOCOR').asDateTime, //EviData
      False,
      copy(CdsDet.FieldByName('OBSERVETAPA').asString,1,2000),
      0, //EviPercent
      0) //EviVlrAjustado
  end;
end;

procedure TfrmCustomCadRegEtp.CdsDetBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if (CdsDet.FieldByName('IDIMOVEL').asFloat > 0) then // Término de Penhora
  begin
    CtrlEtapaProcesso.AtualizarImovel(CdsDet.FieldByName('IDIMOVEL').asFloat, False);
    CtrlEtapaProcesso.InserirEventoImovel(
      CdsDet.FieldByName('IDIMOVEL').asFloat,
      CdsDet.FieldByName('DATAREALOCOR').asDateTime, //EviData
      False,
      'Penhora Excluída',
      0, //EviPercent
      0) //EviVlrAjustado
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------
procedure TfrmCustomCadRegEtp.IniciarValoresContabeis;
begin
  if (bFazContab) or (bFazCAP) then
    CtrlEtapaProcesso.IniciarValoresContabeis;
end;

procedure TfrmCustomCadRegEtp.Sel(NumProcTrab: double);
begin
  bAjustarObjetos := false;

  Cds.Data := CtrlProcessoTrab.ListProcesso(NumProcTrab);
  CdsDet.Data := CtrlEtapaProcesso.ListEtapas(NumProcTrab);
  CdsImagem.Data := CtrlEtapaProcesso.ListImagens(NumProcTrab);
  dValHonorAntes := 0;
  dValDespesaTot := Cds.FieldByName('DESPESAPROC').asFloat;

  TFloatField(CdsDet.FieldByName('VALORREC')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsDet.FieldByName('VALORCUSTAS')).DisplayFormat := '###,###,##0.00';

  dValorDepAntes := 0;
  dValorPenAntes := 0;
  dValorInvAntes := 0;
  dValorLevAntes := 0;
  dValorConAntes := 0;
  CdsDet.First;
  while not CdsDet.Eof do
  begin
    if (CdsDet.FieldByName('FLGVALORABATE').asInteger = 1)  then
      dValorDepAntes := dValorDepAntes + CdsDet.FieldByName('VALORREC').asFloat;

    if (CdsDet.FieldByName('FLGVALORABATE').asInteger = 2) and
        (CdsDet.FieldByName('INDPENHORA').asInteger = 4) then
      dValorPenAntes := dValorPenAntes + CdsDet.FieldByName('VALORREC').asFloat;

    if (CdsDet.FieldByName('FLGVALORABATE').asInteger = 2) and
        (CdsDet.FieldByName('INDPENHORA').asInteger = 3) then
      dValorInvAntes := dValorInvAntes + CdsDet.FieldByName('VALORREC').asFloat;

    if (CdsDet.FieldByName('FLGVALORABATE').asInteger = 3) then
      dValorLevAntes := dValorLevAntes + CdsDet.FieldByName('VALORREC').asFloat;

    if (CdsDet.FieldByName('FLGVALORABATE').asInteger = 4) then
      dValorConAntes := dValorConAntes + CdsDet.FieldByName('VALORREC').asFloat;
    CdsDet.Next;
  end;
  CdsDet.First;
end;

procedure TfrmCustomCadRegEtp.GravarHonorarioEtapa;
begin
  if (dbredHonor.Visible) and (dbredHonor.Value <> 0) and
     not(Cds.FieldByName('IDADVOGRECDA').IsNull) then
  begin
    if not(CtrlEtapaProcesso.GerarHonorario(Date)) then
      MsgDlg(CtrlEtapaProcesso.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
  end;
end;

function TfrmCustomCadRegEtp.GravarRegistro: boolean;
begin
  CdsDet.BeforeEdit := nil;
  Result := CtrlEtapaProcesso.GravarEtapaProcesso(true,true,IdBemAntes,IdConjuntoAntes);
  CdsDet.BeforeEdit := CdsDetBeforeEdit;
  if not(Result) then
    raise Exception.Create(CtrlEtapaProcesso.MessageInfo);
end;

procedure TfrmCustomCadRegEtp.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
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

procedure TfrmCustomCadRegEtp.sbtnProcurarLitisClick(Sender: TObject);
begin
  inherited;
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

procedure TfrmCustomCadRegEtp.btnContaBancClick(Sender: TObject);
begin
  inherited;
  if not(Assigned(frmCadRegContaBanc)) then
    frmCadRegContaBanc := TfrmCadRegContaBanc.Create(Application);

  frmCadRegContaBanc.ExibirTelaContaBanc(CdsDet);
end;

procedure TfrmCustomCadRegEtp.bbtnMultaClick(Sender: TObject);
begin
  inherited;
          if Assigned(frmCadRegMulta) then
        frmCadRegMulta := frmCadRegMulta;
        frmCadRegMulta := TfrmCadRegMulta.Create(Application);
        frmCadRegMulta.ExibirTelaMulta(Cds, CdsDet, Nil);

end;

procedure TfrmCustomCadRegEtp.dblckTipoEtpCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (CdsTipoEtapa.FieldByName('FLGEXECUCAO').asInteger = 1) and
     (modified) and (dsDet.State = dsInsert) and (Cds.FieldByName('FLGSITPROC').asInteger = 0) then
     MsgDlg('Caso deseje alterar a probabilidade atual dos objetos deste processo para 100%,'+CR_LF+
            'com respectiva contabilização, cancele esta operação e use a tela  Transações/Processo'+CR_LF+
            'para registrar este tipo de etapa, que o coloca em execução.'+CR_LF+CR_LF+
            'Se, entretanto, for suficiente alterar a probabilidade atual dos objetos para 100%,'+CR_LF+
            'sem a respectiva contabilização, isto pode ser feito nesta transação.',
            'Aviso', mtInformation, [mbOk,mbHelp], 0);
end;

procedure TfrmCustomCadRegEtp.CdsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  // Rotina para trazer os valores do Banco de Dados
  CtrlEtapaProcesso.GetValores(Cds.FieldByName('NumProcTrab').AsFloat,
    dValCausa, dValOrig, dValAtual, dValReal);
end;

end.
