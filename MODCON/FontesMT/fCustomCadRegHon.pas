unit fCustomCadRegHon;

interface                                          

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls, DBClient, TREdit,
  wwdbedit, wwdblook, CMProcuraSubTipo, wwdbdatetimepicker, CMDateTimePicker, ImgList, Mask,
  CmEventosCadastro, FCadastroMestreDetMT, uCMClientDataSet, uCtrlGlobalRH, uCtrlVaraJustica,
  uCtrlProcessoTrab, uCtrlHonorarioProcesso, uCtrlListTerceirosRH, uCtrlPeriodo, IvEMulti;

type
  TfrmCustomCadRegHon = class(TFrmCadastroMestreDetMT)
    tbshCAP: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    dbedNumero: TDBEdit;
    dbedDataAju: TCMDateTimePicker;
    CdsDet: TCMClientDataSet;
    CdsVara: TCMClientDataSet;
    CdsAdvog: TCMClientDataSet;
    CdsTipoDoc: TCMClientDataSet;
    CdsTipoDesemb: TCMClientDataSet;
    CdsTipoOper: TCMClientDataSet;
    gbkTipoDesemb: TGroupBox;
    dblckTipoDesemb: TwwDBLookupCombo;
    gbxContabilizacao: TGroupBox;
    dblckTipOper: TwwDBLookupCombo;
    gbxCAP: TGroupBox;
    dblckTipoDoc: TwwDBLookupCombo;
    StaticText1: TStaticText;
    dbedDataNot: TCMDateTimePicker;
    Label5: TLabel;
    dtPagamento: TCMDateTimePicker;
    cbxSucumbencia: TCheckBox;
    Label7: TLabel;
    dblckFavor: TwwDBLookupCombo;
    Label8: TLabel;
    dbedValHon: TDBRealEdit;
    dbrgIndHonor: TDBRadioGroup;
    redValorTotal: TDBRealEdit;
    dbrgPagtoProv: TDBRadioGroup;
    lblDataPrev: TLabel;
    Procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure CdsDetBeforeDelete(DataSet: TDataSet);
    procedure CdsDetBeforeEdit(DataSet: TDataSet);
    procedure cbxSucumbenciaClick(Sender: TObject);
    procedure pnlControlesDetEnter(Sender: TObject);
    procedure dbrgIndHonorChange(Sender: TObject);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlVaraJustica: TCtrlVaraJustica;
    CtrlProcessoTrab: TCtrlProcessoTrab;
    CtrlHonorarioProcesso: TCtrlHonorarioProcesso;
    CtrlPeriodo: TCtrlPeriodo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    dValDespesaTot, dValHonorAntes, dValorSentenca: double;
    bAlterouValores, bFazCAP, bFazContab: boolean;
    IdPatro, IdPlanoPrev: integer;

    procedure IniciarValoresContabeis;
    procedure Sel(NumProcTrab: double);
  end;

var
  frmCustomCadRegHon: TfrmCustomCadRegHon;

implementation

uses uSistema, uMensErro, fAguarde, uModulo, uCtrlPadroes, uCtrlParamIntegra,
  uCtrlFuncoesRH, uCtrlUsoGeralRH, dCds;

{$R *.DFM}

procedure TfrmCustomCadRegHon.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlHonorarioProcesso := TCtrlHonorarioProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlHonorarioProcesso.InitializeAs(Padroes);
  CtrlHonorarioProcesso.CdsProcesso := Cds;
  CtrlHonorarioProcesso.CdsHonorarios := CdsDet;

  CtrlProcessoTrab := TCtrlProcessoTrab.Create(Sistema.IdModulo, Sistema.IdUsuario,
    Sistema.IdEmpresa, Sistema.UsaPlanoPatro, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlProcessoTrab.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlVaraJustica := TCtrlVaraJustica.Create;
  CtrlVaraJustica.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.InitializeAs(Padroes);

  CdsVara.Data := CtrlVaraJustica.ListVaraJustica;
  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGINTEGRACAP, FLGINTEGRACONT');

  // Integração com o CAP
  bFazCAP := (dmCds.Cds.FieldByName('FLGINTEGRACAP').asInteger = 1);
  gbxCAP.Visible := bFazCAP;

  if (bFazCAP) then
    CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocRecPag('P');

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
  tbcDetalhe.Tabs.Add('Honorários Pagos');
  if (bFazCAP) or (bFazContab) then
  begin
    tbcDetalhe.detdbGrids.Add('');
    if (bFazCAP) and not(bFazContab) then
      tbcDetalhe.Tabs.Add('Contas a Pagar')
    else
    if not(bFazCAP) and (bFazContab) then
      tbcDetalhe.Tabs.Add('Contabilização')
    else
      tbcDetalhe.Tabs.Add('Contabilização e Contas a Pagar');

    CdsTipoDesemb.Data := CtrlListTerceirosRH.ListTipoDocRecebDesemb(
      Sistema.IdEmpresa, 'P', true);

    CtrlHonorarioProcesso.IniciarIntegracao(Sistema.IdEmpresa, Sistema.IdModulo,
      Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.UsaPlanoPatro,
      ParamIntegra.ObrigaAbc, ParamIntegra.ObrigaCRespon,
      ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal);
  end;                                     

  sbtnProcurarClick(Self);
  if not(MontaSelect.RetornouValor) then
    Sel(-1);
end;

procedure TfrmCustomCadRegHon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlHonorarioProcesso);
  FreeAndNil(CtrlProcessoTrab);
  FreeAndNil(CtrlVaraJustica);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPeriodo);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmCustomCadRegHon.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCustomCadRegHon.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('DATAPAGTOHONOR').asDateTime := Date;
end;

procedure TfrmCustomCadRegHon.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCustomCadRegHon.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
var
  bOk: boolean;
  iCodTipDoc: integer;
  sTipCodigo: string;
begin
  inherited;
  Accept := CtrlHonorarioProcesso.GravarHonorarioProcesso;

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

    bOk := CtrlHonorarioProcesso.GerarIntegracao(
      bFazCAP, bFazContab, Date, dtPagamento.Date, IdPlanoPrev, IdPatro,
      CdsTipoDesemb.FieldByName('PLACONTA').asString,
      CdsTipoDesemb.FieldByName('PLANO').asInteger,
      CdsTipoDesemb.FieldByName('PLACONTACREDITO').asString,
      sTipCodigo, CdsTipoDesemb.FieldByName('CODTIPRECDES').asString, iCodTipDoc);
      
    frmAguarde.Apaga;
    frmAguarde.pbAguarde.Visible := true;

    if (bOk) then
      MsgDlg(CtrlHonorarioProcesso.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0)
    else
      MsgDlg(CtrlHonorarioProcesso.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
  end;
end;

procedure TfrmCustomCadRegHon.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert,dsEdit]) then
    dtPagamento.SetFocus;
end;

procedure TfrmCustomCadRegHon.CdsDetBeforeDelete(DataSet: TDataSet);
begin
  CtrlHonorarioProcesso.AtualizarTotalDespesas(-CdsDet.FieldByName('VALORHONOR').asFloat *
    FU.IFF(CdsDet.FieldByName('INDHONOR').asInteger = 0, 1, dValorSentenca/100));
  dValHonorAntes := 0;
  inherited;
end;

procedure TfrmCustomCadRegHon.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dtPagamento.Text) = '') then
  begin
    MsgDlg('Preencha a Data.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dtPagamento.SetFocus;
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

  CdsDet.FieldByName('NOME').asString := CdsAdvog.FieldByName('NOME').asString;

  // Atualizar Total de Despesas
  CtrlHonorarioProcesso.AtualizarTotalDespesas(
    CdsDet.FieldByName('VALORHONOR').asFloat *
    FU.IFF(CdsDet.FieldByName('INDHONOR').asInteger = 0, 1, dValorSentenca/100)-
    dValHonorAntes);
  dValHonorAntes := 0;

  inherited;
end;

procedure TfrmCustomCadRegHon.bbtnConfirmarClick(Sender: TObject);
begin
  bAlterouValores := (Cds.FieldByName('DESPESAPROC').asFloat <> dValDespesaTot);

  if (bAlterouValores) and
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

  if (bAlterouValores) and
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


  if (bAlterouValores) and
     (((bFazCAP) and ((Trim(dblckTipoDoc.Text) = '') or (Trim(dblckTipoDesemb.Text) = ''))) or
      ((bFazContab) and (Trim(dblckTipOper.Text) = ''))) then
  begin
    tb97BotoesDetalhe.Visible := false;
    pgctrlDetalhe.ActivePage := tbshCAP;
    tbcDetalhe.TabIndex := tbshCAP.PageIndex;
    tbcDetalhe.Repaint;

    MsgDlg('Complemente os dados requeridos para a integração'+CR_LF+
           'Contábil e/ou do Contas a Pagar.', 'Informação', mtWarning, [mbOk,mbHelp], 0);
  end
  else
  begin
    inherited;
    CmeCadastroFind(Sender);
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form        
// -----------------------------------------------------------------------------------------

procedure TfrmCustomCadRegHon.IniciarValoresContabeis;
begin
  if (bFazContab) or (bFazCAP) then
    CtrlHonorarioProcesso.IniciarValoresContabeis;
end;

procedure TfrmCustomCadRegHon.Sel(NumProcTrab: double);
begin
  Cds.Data := CtrlProcessoTrab.ListProcesso(NumProcTrab);
  CdsDet.Data := CtrlHonorarioProcesso.ListHonorario(NumProcTrab);
  CdsAdvog.Data := CtrlProcessoTrab.ListAdvogadosDoProcesso(NumProcTrab);
  dValHonorAntes := 0;
  dValorSentenca := CtrlProcessoTrab.TotalValorSentenca(Cds.FieldByName('NUMPROCTRAB').asFloat);
  dValDespesaTot := Cds.FieldByName('DESPESAPROC').asFloat;

  TFloatField(CdsDet.FieldByName('VALORHONOR')).DisplayFormat := '###,###,##0.00';

  IniciarValoresContabeis;
end;

procedure TfrmCustomCadRegHon.CdsDetBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  dValHonorAntes := CdsDet.FieldByName('VALORHONOR').asFloat *
    FU.IFF(CdsDet.FieldByName('INDHONOR').asInteger = 0, 1, dValorSentenca/100);
end;

procedure TfrmCustomCadRegHon.cbxSucumbenciaClick(Sender: TObject);
begin
  inherited;
  dbrgIndHonor.Visible := cbxSucumbencia.Checked;
  redValorTotal.Visible := cbxSucumbencia.Checked;

  if cbxSucumbencia.Checked then
    CdsAdvog.Data := CtrlProcessoTrab.ListAdvogadosDaContraParte(Cds.FieldByName('NUMPROCTRAB').asFloat)
  else
    CdsAdvog.Data := CtrlProcessoTrab.ListAdvogadosDoProcesso(Cds.FieldByName('NUMPROCTRAB').asFloat);
end;

procedure TfrmCustomCadRegHon.pnlControlesDetEnter(Sender: TObject);
begin
  inherited;
  cbxSucumbencia.Checked := (CdsDet.FieldByName('IDFORNSERV').asFloat > 0) and
     (CdsDet.FieldByName('IDFORNSERV').asFloat =
      Cds.FieldByName('IDADVOGRECTE').asFloat);

  cbxSucumbenciaClick(Self);
  redValorTotal.Value := dValorSentenca;
end;

procedure TfrmCustomCadRegHon.dbrgIndHonorChange(Sender: TObject);
begin
  inherited;
  redValorTotal.Visible := dbrgIndHonor.ItemIndex = 1;
  redValorTotal.Value := dValorSentenca;
end;

end.
