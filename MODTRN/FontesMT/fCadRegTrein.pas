unit fCadRegTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls,
  Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, CMProcura, wwdblook, ImgList, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, DBClient, uCMClientDataSet, FCadastroMestreDetMT, uCtrlRegTrein,
  uCtrlListTerceirosRH, uCtrlCurso, uCtrlPessoaFuncionario, uCtrlPessoaCandidato, uCtrlCargo,
  wwdbedit, uCtrlEscalaConceitos, uCtrlGlobalRH;

type
  TfrmCadRegTrein = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    dbedMatricula: TDBEdit;
    Label10: TLabel;
    dbedNome: TDBEdit;
    dbedSit: TDBEdit;
    dbedCargo: TDBEdit;
    tbshAval: TTabSheet;
    pnlAval: TPanel;
    dbgrdAval: TwwDBGrid;
    dsAval: TwwDataSource;
    sbtnProcurarCand: TToolbarButton97;
    pnlImprimeAval: TPanel;
    sbtnImprimirAval: TSpeedButton;
    CdsEntid: TCMClientDataSet;
    CdsInstrutor: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    CdsAval: TCMClientDataSet;
    Label18: TLabel;
    DBEdit2: TDBEdit;
    gbxAvalEscal: TGroupBox;
    Label19: TLabel;
    DBMemo1: TDBMemo;
    CdsCurso: TCMClientDataSet;
    dsCargo: TwwDataSource;
    CdsCargo: TCMClientDataSet;
    MontaSelectFunc: TMontaSelect;
    MontaSelectCand: TMontaSelect;
    MontaSelectCurso: TMontaSelect;
    dbredAvaliacao: TDBRealEdit;
    MontaSelectLocal: TMontaSelect;
    PageControlDet: TPageControl;
    tbshDadosBasicos: TTabSheet;
    tbshDadosComplementares: TTabSheet;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CMProcuraCurso: TCMProcura;
    dblckEntid: TwwDBLookupCombo;
    dblckInstrutor: TwwDBLookupCombo;
    pgctrlDados: TPageControl;
    tbshDatas: TTabSheet;
    Label5: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    cmDatPlIni: TCMDateTimePicker;
    cmDatPlFim: TCMDateTimePicker;
    cmDatReIni: TCMDateTimePicker;
    cmDatReFim: TCMDateTimePicker;
    tbshCargaHoraria: TTabSheet;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    dbedDurTeor: TDBRealEdit;
    dbedDurPrat: TDBRealEdit;
    dbedDurTot: TDBRealEdit;
    tbshDespesas: TTabSheet;
    Label26: TLabel;
    Label28: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    dbedValor: TDBRealEdit;
    dbedHosped: TDBRealEdit;
    dbedViagem: TDBRealEdit;
    dbedOutras: TDBRealEdit;
    dbrgControle: TDBRadioGroup;
    gbxResult: TGroupBox;
    LblAprov: TLabel;
    imgAprov: TImage;
    imgReprov: TImage;
    dbrgAvalTeor: TDBRadioGroup;
    dbedAvTeor: TDBRealEdit;
    dbrgAvalPrat: TDBRadioGroup;
    dbedAvPrat: TDBRealEdit;
    dbrgAvalCurs: TDBRadioGroup;
    dbedAvCurs: TDBEdit;
    gbxLocalCurso: TGroupBox;
    dbedLocalCurso: TDBEdit;
    bbtnProcLocal: TBitBtn;
    Label6: TLabel;
    bbtnAlimenta: TBitBtn;
    Label7: TLabel;
    bbtnBuscaInstrutorExterno: TBitBtn;
    bbtnBuscaInstrutorInterno: TBitBtn;
    edDataHora: TwwDBEdit;
    edInstrutores: TwwDBEdit;
    MontaSelectExterno: TMontaSelect;
    MontaSelectInterno: TMontaSelect;
    gbxAvalConceitual: TGroupBox;
    CdsEscala: TCMClientDataSet;
    cmbAvalConceitual: TComboBox;
    tbshAval2: TTabSheet;
    dbgrdAval2: TwwDBGrid;
    pnlAval2: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    gbxAvalEscal2: TGroupBox;
    DBRealEdit1: TDBRealEdit;
    DBMemo2: TDBMemo;
    gbxAvalConceitual2: TGroupBox;
    cmbAvalConceitual2: TComboBox;
    dsAval2: TwwDataSource;
    CdsAval2: TCMClientDataSet;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbrgAvalTeorChange(Sender: TObject);
    procedure dbrgAvalPratChange(Sender: TObject);
    procedure dbrgControleChange(Sender: TObject);
    procedure dbrgAvalCursChange(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CMProcuraCursoValidaDados(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure sbtnImprimirAvalClick(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dblckEntidChange(Sender: TObject);
    procedure dbedAvTeorChange(Sender: TObject);
    procedure dblckEntidEnter(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure CdsDetBeforeEdit(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CdsAvalAfterScroll(DataSet: TDataSet);
    procedure bbtnProcLocalClick(Sender: TObject);
    procedure bbtnAlimentaClick(Sender: TObject);
    procedure bbtnBuscaInstrutorExternoClick(Sender: TObject);
    procedure bbtnBuscaInstrutorInternoClick(Sender: TObject);
    procedure cmbAvalConceitualChange(Sender: TObject);
    procedure CdsAval2AfterScroll(DataSet: TDataSet);
    procedure cmbAvalConceitual2Change(Sender: TObject);
    procedure CdsDetAfterScroll(DataSet: TDataSet);
  private
    CtrlRegTrein: TCtrlRegTrein;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlCurso: TCtrlCurso;
    CtrlCargo: TCtrlCargo;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlPessoaCandidato: TCtrlPessoaCandidato;
    CtrlEscalaConceitos: TCtrlEscalaConceitos;
    CtrlGlobalRH: TCtrlGlobalRH;

    dOldIdCurso: double;
    iOldNumSeq, IdTipoProcesso, iTabIndex: integer;
    sDataFinalAntes, sDataFinalDepois, sDataIniAntes, sDataIniDepois: string;
    bAvalAluno, bFezAvalCurso, bFezAvalAluno: boolean;

    procedure AtualizarAvaliacao;
  public
    bEmpregado: boolean;
    IdPessoa: double;

    procedure Sel(SelPrincipal: boolean);
  end;

var
  frmCadRegTrein: TfrmCadRegTrein;

implementation

uses uCMTypes, uSistema, uMensErro, uModulo, uCtrlFuncoesRH, fPreview, uCtrlPadroes,
  uCtrlUsoGeralRH, RAvalCurso, dCds;

{$R *.DFM}

procedure TfrmCadRegTrein.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);
  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGAVALALUNO');
  bAvalAluno := (dmCds.Cds.FieldByName('FLGAVALALUNO').asInteger = 1);
  if (bAvalAluno) then
  begin
    dbrgAvalPrat.Visible := False;
    dbrgAvalTeor.Caption := 'Avaliação do Aluno';
    dbedAvTeor.Visible := False;
    dbedAvPrat.Visible := False;
    lblAprov.Visible := false;
    imgReprov.Visible := false;
    imgAprov.Visible := false;
  end
  else
  begin
    tbcDetalhe.detdbGrids.Clear;
    tbcDetalhe.detdbGrids.Add('dbgrdDet');
    tbcDetalhe.detdbGrids.Add('dbgrdAval');

    tbcDetalhe.Tabs.Clear;
    tbcDetalhe.Tabs.Add('Cursos');
    tbcDetalhe.Tabs.Add('Avaliações dos Cursos');
  end;

  CtrlRegTrein := TCtrlRegTrein.Create(true, Sistema.UsaRAD, true, bAvalAluno, Sistema.IdEmpresa,
    Sistema.IdUsuario, Sistema.NomeUsuario, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRegTrein.InitializeAs(Padroes);
  CtrlRegTrein.CdsHistTrein := CdsDet;
  CtrlRegTrein.CdsAvalCurso := CdsAval;
  CtrlRegTrein.CdsAvalAluno := CdsAval2;

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlPessoaCandidato := TCtrlPessoaCandidato.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaCandidato.InitializeAs(Padroes);

  CdsEntid.Data := CtrlRegTrein.ListEntid;
  CdsInstrutor.Data := CtrlListTerceirosRH.ListPessoaTerceiro('F');
  CdsCurso.Data := CtrlCurso.ListGeral(-1);
  CdsAval.Data := CtrlRegTrein.ListAvaliacaoCurso(-1, -1, -1, -1);
  CdsAval2.Data := CtrlRegTrein.ListAvaliacaoCurso(-1, -1, -1, -1);

  CtrlEscalaConceitos := TCtrlEscalaConceitos.Create;
  CtrlEscalaConceitos.InitializeAs(Padroes);

  if (Modulo.IdContraCheque = FUNCEF) then
    dbrgControle.Caption := 'Por Conta da Empresa?';

  with (MontaSelectFunc.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    // Usuário RH
    if not(CtrlUsoGeralRH.UsuarioRH) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  if (Sistema.UsaRAD) then
    IdTipoProcesso := CtrlListTerceirosRH.GetIdTipoProcesso(Sistema.IdUsuario, 20)
  else
    IdTipoProcesso := -1;

  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
  begin
    bEmpregado := true;
    IdPessoa := StrToFloat(CtrlUsoGeralRH.IdUsuarioGeral);
    Sel(true);
    sbtnProcurarCand.Visible := false;
  end
  else
  begin
    IdPessoa := -1;
    Sel(true);
  end;  

  if (Sistema.IdModulo = 417) then
    HelpContext := 4170012;

  CMProcuraCurso.DataSource := nil;
  pgctrlDados.ActivePageIndex := 0;
end;

procedure TfrmCadRegTrein.FormShow(Sender: TObject);
begin
  inherited;
  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
  begin
    sbtnProcurar.Visible := false;
    sbtnAlterar.Enabled := true;
  end;
end;

procedure TfrmCadRegTrein.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlRegTrein);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlCurso);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlPessoaCandidato);
  FreeAndNil(CtrlEscalaConceitos);
  FreeAndNil(CtrlGlobalRH);
  inherited;
end;

procedure TfrmCadRegTrein.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    IdPessoa := StrToFloat(MontaSelect.ValoresChave[0]);
    Sel(true);
  end;
end;

procedure TfrmCadRegTrein.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnProcurarCand.Enabled := sbtnProcurar.Enabled;
end;

procedure TfrmCadRegTrein.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (bEmpregado) then
    CdsDet.FieldByName('FLGCONTROLE').asInteger := 1
  else
    CdsDet.FieldByName('FLGCONTROLE').asInteger := 0;

  CdsDet.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
  CdsDet.FieldByName('FLGAVALCURS').asInteger := 0;
  CdsDet.FieldByName('FLGAVALTEOR').asInteger := 0;
  CdsDet.FieldByName('FLGAVALPRAT').asInteger := 0;
end;

procedure TfrmCadRegTrein.CmeDetalheDelete(Sender: TObject);
begin
  inherited;
  while not(CdsAval.EOF) do
    CdsAval.Delete;
  while not(CdsAval2.EOF) do
    CdsAval2.Delete;
end;

procedure TfrmCadRegTrein.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRegTrein.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := (CtrlRegTrein.GravarHistoricoTreinamento(bEmpregado, dbedNome.Text,
    Cds.FieldByName('CODCENTROCUSTO').asString, IdTipoProcesso));

  if not(Accept) then
    raise Exception.Create(CtrlRegTrein.MessageInfo)
  else
  if (CtrlRegTrein.MessageInfo <> '') then
    MsgDlg(CtrlRegTrein.MessageInfo, 'Aviso', mtInformation, [mbOk,mbHelp], 0);
end;

procedure TfrmCadRegTrein.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert,dsEdit]) then
  begin
    pgctrlDados.ActivePageIndex := 0;
    PageControlDet.ActivePageIndex := 0;
    CdsCurso.Data := CtrlCurso.ListGeral(CdsDet.FieldByName('IDCURSO').asFloat);
    if (not bAvalAluno) then
      AtualizarAvaliacao;
    CMProcuraCurso.DataSource := dsDet;
    CMProcuraCurso.SetFocus;
  end
  else
  if (CdsDet.State = dsBrowse) then
    CMProcuraCurso.DataSource := nil;
end;

procedure TfrmCadRegTrein.CdsAvalAfterScroll(DataSet: TDataSet);
var
  c: integer;
begin
  gbxAvalEscal.Visible := (CdsAval.FieldByName('FLGAVALCURSO').asInteger = 0);
  gbxAvalConceitual.Visible := (CdsAval.FieldByName('FLGAVALCURSO').asInteger > 0);
  if (CdsAval.FieldByName('FLGAVALCURSO').asInteger > 0) then
  begin
    CdsEscala.Data := CtrlEscalaConceitos.ListGeral(CdsAval.FieldByName('IdEscalaConceitos').asFloat);
    cmbAvalConceitual.Items.Clear;

    if CdsEscala.FieldByName('QTDECONCEITOS').asInteger > 0 then
      for c := 1 to CdsEscala.FieldByName('QTDECONCEITOS').asInteger do
        cmbAvalConceitual.Items.Add(CdsEscala.FieldByName('CONCEITO'+IntToStr(c)).asString);

    cmbAvalConceitual.ItemIndex := CdsAval.FieldByName('AVALCURSO').asInteger - 1;
  end;
end;

procedure TfrmCadRegTrein.CdsDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  iOldNumSeq := -1;
  dOldIdCurso := -1;
  bFezAvalCurso := false;
  bFezAvalAluno := false;
end;

procedure TfrmCadRegTrein.CdsDetBeforeEdit(DataSet: TDataSet);
begin
  sDataFinalAntes := cmDatReFim.Text;
  sDataIniAntes := cmDatReIni.Text;
end;

procedure TfrmCadRegTrein.CMProcuraCursoValidaDados(Sender: TObject);
begin
  if (CdsDet.State in [dsEdit,dsInsert]) then
  begin
    dbrgAvalTeor.OnChange := nil;
    dbrgAvalPrat.OnChange := nil;

    CdsCurso.Data := CtrlCurso.ListGeral(CdsDet.FieldByName('IDCURSO').asFloat);
    CdsDet.FieldByName('IDENTIDINSTR').asFloat := CdsCurso.FieldByName('IDENTIDINSTR').asFloat;
    CdsDet.FieldByName('FLGAVALTEOR').asInteger := CdsCurso.FieldByName('TEMAVAL').asInteger;
    CdsDet.FieldByName('FLGAVALPRAT').asInteger := CdsCurso.FieldByName('TEMAVPR').asInteger;
    CdsDet.FieldByName('DUR_PRAT').asFloat := CdsCurso.FieldByName('DUR_PRAT').asFloat;
    CdsDet.FieldByName('DUR_TEOR').asFloat := CdsCurso.FieldByName('DUR_TEOR').asFloat;
    CdsDet.FieldByName('VALOR').asFloat := CdsCurso.FieldByName('VALOR').asFloat;

    if (not bAvalAluno) then
    begin
      AtualizarAvaliacao;
      dbrgAvalTeor.OnChange := dbrgAvalTeorChange;
      dbrgAvalPrat.OnChange := dbrgAvalPratChange;
    end;
  end;
end;

procedure TfrmCadRegTrein.dblckEntidEnter(Sender: TObject);
begin
  if (CMProcuraCurso.Text <> '') and (CdsDet.State in [dsEdit,dsInsert]) then
    CdsEntid.Data := CtrlRegTrein.ListEntid(CdsDet.FieldByName('IDCURSO').asFloat);
end;

procedure TfrmCadRegTrein.dblckEntidChange(Sender: TObject);
begin
  if (dblckEntid.Text <> '') and (CdsDet.State in [dsEdit,dsInsert]) then
    CdsInstrutor.Data := CtrlListTerceirosRH.ListPessoaTerceiro('F',
      CdsEntid.FieldByName('IDPESSOA').asFloat);
end;

procedure TfrmCadRegTrein.dbedAvTeorChange(Sender: TObject);
begin
  if (CdsDet.State in [dsEdit,dsInsert]) and  (not bAvalAluno) then
    AtualizarAvaliacao;
end;

procedure TfrmCadRegTrein.dbrgAvalTeorChange(Sender: TObject);
begin
  if (CdsDet.State in [dsEdit,dsInsert]) then
  begin
    dbedAvTeor.Visible := (not bAvalAluno) and (dbrgAvalTeor.ItemIndex = 0);
    if (not bAvalAluno) then
      AtualizarAvaliacao;
  end;
end;

procedure TfrmCadRegTrein.dbrgAvalPratChange(Sender: TObject);
begin
  if (CdsDet.State in [dsEdit,dsInsert]) then
  begin
    dbedAvPrat.Visible := (dbrgAvalPrat.ItemIndex = 0);
    if (not bAvalAluno) then
      AtualizarAvaliacao;
  end;
end;

procedure TfrmCadRegTrein.dbrgAvalCursChange(Sender: TObject);
begin
  dbedAvCurs.Visible := (dbrgAvalCurs.ItemIndex = 0);
end;

procedure TfrmCadRegTrein.dbrgControleChange(Sender: TObject);
begin
  if (CdsDet.State in [dsEdit,dsInsert]) then
  begin
    tbshDespesas.Enabled := (dbrgControle.ItemIndex = 0);
    dbrgAvalCurs.Visible := (dbrgControle.ItemIndex = 0);
    dbedAvCurs.Visible := (dbrgControle.ItemIndex = 0);
    tbshDespesas.TabVisible := (dbrgControle.ItemIndex = 0);

    if (CdsDet.State = dsInsert) then
      dbrgAvalCurs.ItemIndex := dbrgControle.ItemIndex;

    dbrgAvalCursChange(Sender);
  end;
end;

procedure TfrmCadRegTrein.tbcDetalheChange(Sender: TObject);
begin
  if (tbcDetalhe.TabIndex = 1) and
     ((cmDatReFim.Text = '') or (CdsDet.FieldByName('FLGAVALCURS').asInteger <> 1)) then
  begin
    //AllowChange := false;
    MsgDlg('Curso selecionado não tem avaliação pelo aluno e/ou não foi concluído.',
      'Informação', mtInformation, [mbOk,mbHelp], 0);
    tbcDetalhe.TabIndex := iTabIndex;
    pgctrlDetalhe.ActivePageIndex := iTabIndex;
    exit;
  end;

  if (tbcDetalhe.TabIndex = 2) and
     ((cmDatReFim.Text = '') or (CdsDet.FieldByName('FLGAVALTEOR').asInteger <> 1)) then
  begin
    //AllowChange := false;
    MsgDlg('Curso selecionado não tem avaliação do aluno e/ou não foi concluído.',
      'Informação', mtInformation, [mbOk,mbHelp], 0);
    tbcDetalhe.TabIndex := iTabIndex;
    pgctrlDetalhe.ActivePageIndex := iTabIndex;
    exit;
  end;

  if ((iOldNumSeq <> CdsDet.FieldByName('NUMSEQ').asInteger) or
      (dOldIdCurso <> CdsDet.FieldByName('IDCURSO').asFloat) or
      (not bFezAvalCurso) or
      (not bFezAvalAluno)) then
  begin
    if (tbcDetalhe.TabIndex = 1) and (not bFezAvalCurso) then
    begin
      bFezAvalCurso := True;
      CdsAval.Data := CtrlRegTrein.ListAvaliacaoCurso(CdsDet.FieldByName('IDPESSOA').asFloat,
        CdsDet.FieldByName('IDCURSO').asFloat, CdsDet.FieldByName('NUMSEQ').asInteger, 0);

      if (CdsAval.IsEmpty) then
      begin
        if not(CtrlRegTrein.GerarAvaliacoes_Dos_Cursos) then
        begin
          //AllowChange := false;
          MsgDlg(CtrlRegTrein.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0);
          tbcDetalhe.TabIndex := iTabIndex;
          pgctrlDetalhe.ActivePageIndex := iTabIndex;
          exit;
        end;
      end;
    end;

    if (tbcDetalhe.TabIndex = 2) and (bAvalAluno) and (not bFezAvalAluno) then
    begin
      bFezAvalAluno := True;
      CdsAval2.Data := CtrlRegTrein.ListAvaliacaoCurso(CdsDet.FieldByName('IDPESSOA').asFloat,
        CdsDet.FieldByName('IDCURSO').asFloat, CdsDet.FieldByName('NUMSEQ').asInteger, 1);

      if (CdsAval2.IsEmpty) then
      begin
        if not(CtrlRegTrein.GerarAvaliacoes_Dos_Alunos) then
        begin
          //AllowChange := false;
          MsgDlg(CtrlRegTrein.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0);
          tbcDetalhe.TabIndex := iTabIndex;
          pgctrlDetalhe.ActivePageIndex := iTabIndex;
          exit;
        end;
      end;
    end;

  end;

  sbtnImprimirAval.Enabled := (tbcDetalhe.TabIndex = 1) and not(CdsAval.IsEmpty);

  if (tbcDetalhe.TabIndex > 0) then
  begin
    //AllowChange := true;
    iOldNumSeq := CdsDet.FieldByName('NUMSEQ').asInteger;
    dOldIdCurso := CdsDet.FieldByName('IDCURSO').asFloat;
  end;

  inherited;
  sbtnInsDet.Visible := (tbcDetalhe.TabIndex = 0);
  sbtnExcluiDet.Visible := (tbcDetalhe.TabIndex = 0);
  pnlImprimeAval.Visible := (tbcDetalhe.TabIndex = 1);
end;

procedure TfrmCadRegTrein.cmbAvalConceitualChange(Sender: TObject);
begin
  inherited;
  if (cmbAvalConceitual.ItemIndex <> CdsAval.FieldByName('AVALCURSO').asInteger - 1) and
     (CdsAval.State in [dsInsert, dsEdit]) then
    CdsAval.FieldByName('AVALCURSO').asInteger := cmbAvalConceitual.ItemIndex + 1;
end;

procedure TfrmCadRegTrein.CdsAval2AfterScroll(DataSet: TDataSet);
var
  c: integer;
begin
  inherited;
  gbxAvalEscal2.Visible := (CdsAval2.FieldByName('FLGAVALCURSO').asInteger = 0);
  gbxAvalConceitual2.Visible := (CdsAval2.FieldByName('FLGAVALCURSO').asInteger > 0);
  if (CdsAval2.FieldByName('FLGAVALCURSO').asInteger > 0) then
  begin
    CdsEscala.Data := CtrlEscalaConceitos.ListGeral(CdsAval2.FieldByName('IdEscalaConceitos').asFloat);
    cmbAvalConceitual2.Items.Clear;

    if CdsEscala.FieldByName('QTDECONCEITOS').asInteger > 0 then
      for c := 1 to CdsEscala.FieldByName('QTDECONCEITOS').asInteger do
        cmbAvalConceitual2.Items.Add(CdsEscala.FieldByName('CONCEITO'+IntToStr(c)).asString);

    cmbAvalConceitual2.ItemIndex := CdsAval2.FieldByName('AVALCURSO').asInteger - 1;
  end;

end;

procedure TfrmCadRegTrein.cmbAvalConceitual2Change(Sender: TObject);
begin
  inherited;
  if (cmbAvalConceitual2.ItemIndex <> CdsAval2.FieldByName('AVALCURSO').asInteger - 1) and
     (CdsAval2.State in [dsInsert, dsEdit]) then
    CdsAval2.FieldByName('AVALCURSO').asInteger := cmbAvalConceitual2.ItemIndex + 1;
end;

procedure TfrmCadRegTrein.tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
begin
  inherited;
  iTabIndex := tbcDetalhe.TabIndex;
end;

procedure TfrmCadRegTrein.sbtnProcurarClick(Sender: TObject);
begin
  bEmpregado := (Sender = sbtnProcurar);
  if (bEmpregado) then
    MontaSelect := MontaSelectFunc
  else
  begin
    sbtnProcurarCand.Down := false;
    MontaSelect := MontaSelectCand;
  end;
  inherited;
end;

procedure TfrmCadRegTrein.sbtnImprimirAvalClick(Sender: TObject);
var
  Rpt: TRptAvalCurso;
begin
  if (Trim(cmDatReFim.Text) <> '') then
  begin
    Rpt := TRptAvalCurso.Create(Application);

    Rpt.IdPessoa := CdsDet.FieldByName('IDPESSOA').asFloat;
    Rpt.IdCurso := CdsDet.FieldByName('IDCURSO').asFloat;
    Rpt.NumSeq := CdsDet.FieldByName('NUMSEQ').asInteger;
    Rpt.Matricula := dbedMatricula.Text;
    Rpt.NomeEmpregado := dbedNome.Text;
    Rpt.NomeCargo := dbedCargo.Text;
    Rpt.NomeCurso := CdsDet.FieldByName('DESCRICAO').asString;
    Rpt.NomeEntidade := dblckEntid.Text;
    Rpt.LocalCurso := dbedLocalCurso.Text;
    Rpt.DataInicioEfetivo := cmDatReIni.Date;
    Rpt.DataFinalEfetivo := cmDatReFim.Date;

    Rpt.CrmRptCMBeforePrint(Sender);
    TFrmPreview.CreateModalPreview(Application, Rpt.rpAvalCurso, Rpt.rpAvalCurso.Caption);

    Rpt.Free;
  end;
end;

procedure TfrmCadRegTrein.bbtnProcLocalClick(Sender: TObject);
begin
  inherited;
  MontaSelectLocal.Executar;
  if (MontaSelectLocal.RetornouValor) then
    dbedLocalCurso.Text := MontaSelectLocal.ValoresChave[2];
end;

procedure TfrmCadRegTrein.bbtnAlimentaClick(Sender: TObject);
var
  sDataIni, sDataFim, sDataRef: string;
  i, j: integer;
begin
  inherited;
  sDataIni := FU.iff(cmDatReIni.Text = '', cmDatPlIni.Text, cmDatReIni.Text);
  sDataFim := FU.iff(cmDatReFim.Text = '', cmDatPlFim.Text, cmDatReFim.Text);
  if (sDataIni = '') or (sDataFim = '') then
  begin
    MsgDlg('Datas Insuficientes para Esta Função.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  if (edDataHora.Text <> '') and (MsgDlg('Este Procedimento Limpa o Texto Existente. Confirma?',
      'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes) then
    exit;

  CdsDet.FieldByName('DATAHORA').asString := '';
  j := 0;
  for i:=1 to Round(StrToDate(sDataFim) - StrToDate(sDataIni) + 1) do
  begin
    if ((DayOfWeek((StrToDate(sDataIni) + i - 1)) in [2,3,4,5,6]) or
        (MsgDlg('Haverá aula no '+
         FU.iff(DayOfWeek(StrToDate(sDataIni)+i-1)=1,'domingo','sábado')+
         ' dia '+DateToStr(StrToDate(sDataIni)+i-1)+' ?',
         'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes)) then
    begin
      inc(j);
      if j > 1 then
         CdsDet.FieldByName('DATAHORA').asString :=
           CdsDet.FieldByName('DATAHORA').asString + CR_LF;
      sDataRef := DateToStr(StrToDate(sDataIni) + i - 1);
      CdsDet.FieldByName('DATAHORA').asString :=
        CdsDet.FieldByName('DATAHORA').asString + sDataRef +
                         ':   das __:__ às __:__ hs.    ';
    end;
  end;

  if length(CdsDet.FieldByName('DATAHORA').asString) > 1000 then
    CdsDet.FieldByName('DATAHORA').asString :=
      copy(CdsDet.FieldByName('DATAHORA').asString, 1, 1000);
end;

procedure TfrmCadRegTrein.bbtnBuscaInstrutorExternoClick(Sender: TObject);
begin
  inherited;
  if dblckEntid.Text = '' then
  begin
    MsgDlg('Dados Insuficientes para Esta Função.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  MontaSelectExterno.Filtro.Clear;
  MontaSelectExterno.Filtro.Add('IDGRUPO = ' + CdsEntid.FieldByName('IDPESSOA').asString);
  MontaSelectExterno.Executar;
  if (MontaSelectExterno.RetornouValor) then
  begin
    if CdsDet.FieldByName('INSTRUTORES').asString <> '' then
      CdsDet.FieldByName('INSTRUTORES').asString :=
        CdsDet.FieldByName('INSTRUTORES').asString + ', ' + CR_LF;
    CdsDet.FieldByName('INSTRUTORES').asString :=
      CdsDet.FieldByName('INSTRUTORES').asString + MontaSelectExterno.ValoresChave[1];
  end;

  if length(CdsDet.FieldByName('INSTRUTORES').asString) > 1000 then
    CdsDet.FieldByName('INSTRUTORES').asString :=
      copy(CdsDet.FieldByName('INSTRUTORES').asString, 1, 1000);
end;

procedure TfrmCadRegTrein.bbtnBuscaInstrutorInternoClick(Sender: TObject);
begin
  inherited;
  MontaSelectInterno.Filtro.Clear;
  MontaSelectInterno.Filtro.Add('IE.IDPESSOA = F.IDPESSOA');
  MontaSelectInterno.Filtro.Add('IE.IDPESSOA = P.IDPESSOA');
  MontaSelectInterno.Filtro.Add('IE.IDCURSO  = ' + CdsCurso.FieldByName('IDCURSO').asString);
  MontaSelectInterno.Executar;
  if (MontaSelectInterno.RetornouValor) then
  begin
    if CdsDet.FieldByName('INSTRUTORES').asString <> '' then
      CdsDet.FieldByName('INSTRUTORES').asString :=
        CdsDet.FieldByName('INSTRUTORES').asString + ', ' + CR_LF;
    CdsDet.FieldByName('INSTRUTORES').asString :=
      CdsDet.FieldByName('INSTRUTORES').asString + MontaSelectInterno.ValoresChave[1];
  end;

  if length(CdsDet.FieldByName('INSTRUTORES').asString) > 1000 then
    CdsDet.FieldByName('INSTRUTORES').asString :=
      copy(CdsDet.FieldByName('INSTRUTORES').asString, 1, 1000);
end;

procedure TfrmCadRegTrein.bbtnOkDetClick(Sender: TObject);
var
  sFlgOk: string;
  QtdAva, TotAva: integer;
begin
  if (CMProcuraCurso.Text = '') then
  begin
    MsgDlg('Informe o Curso (não pode ficar em branco).',
           'Informação', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  if (pgctrlDetalhe.ActivePageIndex = 0) then
  begin
    sDataFinalDepois := cmDatReFim.Text;
    sDataIniDepois := cmDatReIni.Text;
    if (sDataIniAntes = '') and (sDataIniDepois <> '') and
       (CdsDet.FieldByName('IDPROCESSO').asInteger > 0) then
    begin
      sFlgOk := CtrlListTerceirosRH.GetFlgOk_RAD(CdsDet.FieldByName('IDPROCESSO').asFloat);
      if (Trim(sFlgOk) = '') then
        sFlgOk := 'S';

      if (sFlgOk <> 'S') then
      begin
        MsgDlg('Processo não está concluído.' +CR_LF+ 'O curso não pode ser iniciado.',
               'Informação', mtInformation, [mbOk,mbHelp], 0);
        exit;
      end;
    end;

    // Cálculo da Avaliação do Curso
    if (pgctrlDetalhe.ActivePage = tbsDet) and (dbrgAvalCurs.ItemIndex = 0) and
       (CdsAval.Active) and (CdsAval.RecordCount > 0) and
       (MsgDlg('Deseja alterar a avaliação do curso com média das avaliações dos fatores?',
               'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) then
    begin
      CdsAval.First;
      QtdAva := 0;
      TotAva := 0;
      while not(CdsAval.EOF) do
      begin
        Inc(QtdAva);
        TotAva := TotAva + CdsAval.FieldByName('AVALCURSO').asInteger *
          FU.IFF(CdsAval.FieldByName('FLGAVALCURSO').asInteger=0,1,25);
        CdsAval.Next;
      end;
      CdsAval.First;
      CdsDet.FieldByName('AVALCURSO').asInteger := Round(TotAva / QtdAva);
    end;

    // Cálculo do Número de Sequência
    if (CdsDet.State = dsInsert) then
    begin
      CdsDet.FieldByName('NUMSEQ').asInteger := CtrlRegTrein.GetProxNumSeq;
      if (CdsDet.FieldByName('NUMSEQ').asInteger > 1) and
         (MsgDlg('Já consta esse curso para essa pessoa.' +CR_LF+
                 'Deseja registrar nova ocorrência?', 'Confirmação', mtConfirmation,
                 [mbYes, mbNo, mbHelp], 0) <> mrYes) then
        exit;
    end;

    CdsDet.FieldByName('DESCRICAO').asString := CMProcuraCurso.Text;

    if (sDataFinalAntes = '') and (sDataFinalDepois <> '') and
       (dbrgAvalCurs.ItemIndex = 0) and (dbedAvCurs.Text = '') and
       (dbrgControle.ItemIndex = 0) then
      CdsDet.FieldByName('CONCLUIDO').asInteger := 1
    else
      CdsDet.FieldByName('CONCLUIDO').asInteger := 0;

    if (CdsDet.FieldByName('DUR_TEOR').IsNull) then
      CdsDet.FieldByName('DUR_TEOR').asInteger := 0;

    if (CdsDet.FieldByName('DUR_PRAT').IsNull) then
      CdsDet.FieldByName('DUR_PRAT').asInteger := 0;

    CdsDet.FieldByName('DUR_TOT').asFloat := CdsDet.FieldByName('DUR_TEOR').asFloat +
      CdsDet.FieldByName('DUR_PRAT').asFloat;
  end
  else
  if (pgctrlDetalhe.ActivePageIndex = 1) and (cmbAvalConceitual.ItemIndex = -1) and (gbxAvalConceitual.Visible) then
  begin
    MsgDlg('Avaliação Conceitual do curso não indicada.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    cmbAvalConceitual.SetFocus;
    exit;
  end
  else
  if (pgctrlDetalhe.ActivePageIndex = 2) and (cmbAvalConceitual2.ItemIndex = -1) and (gbxAvalConceitual2.Visible) then
  begin
    MsgDlg('Avaliação Conceitual do aluno não indicada.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    cmbAvalConceitual2.SetFocus;
    exit;
  end;
  inherited;
end;

procedure TfrmCadRegTrein.bbtnConfirmarClick(Sender: TObject);
begin
  if (CdsDet.State <> dsBrowse) then
    exit;
  inherited;
  Sel(false);
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadRegTrein.AtualizarAvaliacao;
begin
  lblAprov.Visible := false;
  imgReprov.Visible := false;
  imgAprov.Visible := false;

  if (CdsCurso.Active) and
     (((CdsCurso.FieldByName('TEMAVAL').asInteger = 1) and (dbrgAvalTeor.ItemIndex = 0)) or
      ((CdsCurso.FieldByName('TEMAVPR').asInteger = 1) and (dbrgAvalPrat.ItemIndex = 0))) then
  begin
    if ((CdsCurso.FieldByName('TEMAVAL').asInteger = 1) and (dbrgAvalTeor.ItemIndex = 0) and
        (CdsCurso.FieldByName('AVALIACAO').asInteger > dbedAvTeor.Value)) or
       ((CdsCurso.FieldByName('TEMAVPR').asInteger = 1) and (dbrgAvalPrat.ItemIndex = 0) and
        (CdsCurso.FieldByName('AVALPRAT').asInteger > dbedAvPrat.Value))  then
    begin
      lblAprov.Caption := 'REPROVADO';
      lblAprov.Font.Color := clRed;
      imgReprov.Visible := true;
    end
    else
    begin
      lblAprov.Caption := 'APROVADO';
      lblAprov.Font.Color := clBlue;
      imgAprov.Visible := true;
    end;
    lblAprov.Visible := true;
  end;

  dbedAvTeor.Visible := (dbrgAvalTeor.ItemIndex = 0);
  dbedAvPrat.Visible := (dbrgAvalPrat.ItemIndex = 0);
  tbshDespesas.Enabled := (dbrgControle.ItemIndex = 0);
  dbrgAvalCurs.Visible := (dbrgControle.ItemIndex = 0);
  dbedAvCurs.Visible := (dbrgAvalCurs.ItemIndex = 0);
  tbshDespesas.TabVisible := (dbrgControle.ItemIndex = 0);
end;

procedure TfrmCadRegTrein.Sel(SelPrincipal: boolean);
begin
  if (SelPrincipal) then
  begin
    if (bEmpregado) then
      Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa,
        '  F.IDPESSOA, F.MATRICULA, F.IDCARGO, (''  '' || P.NOME) AS NOME,'+CR_LF+
        '  ST.DESCRICAO AS SITUACAO, F.CODCENTROCUSTO, F.IDEMPRESA')
    else
      Cds.Data := CtrlPessoaCandidato.ListCandidatoPessoa(IdPessoa,
        '  CA.IDPESSOA, CA.IDPESSOA AS MATRICULA, CA.IDCARGO, (''  '' || P.NOME) AS NOME,'+CR_LF+
        '  ''Candidato'' AS SITUACAO, ('' '') AS CODCENTROCUSTO, ' +
        FloatToStr(Sistema.IdEmpresa)+ ' AS IDEMPRESA');

    CdsCargo.Data := CtrlCargo.ListCargo(FU.IFF(Cds.FieldByName('IDCARGO').asFloat > 0,
      Cds.FieldByName('IDCARGO').asFloat, -1));
  end;

  iOldNumSeq := -1;
  dOldIdCurso := -1;
  bFezAvalCurso := False;
  bFezAvalAluno := False;
  CdsDet.Data := CtrlRegTrein.ListHistoricoTreinamentoPorPessoa(IdPessoa);
end;

end.
