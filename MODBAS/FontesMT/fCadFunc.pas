unit fCadFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, Menus,
  MontaSelect, DBTables, Wwdatsrc, TB97, MAHlpBtn, StdCtrls, Grids, Buttons, Wwdbigrd,
  Wwdbgrid, checklst, DBCtrls, TabControlDetalhe, wwdblook, Mask, Spin, wwdbedit, ExtCtrls,
  ExtDlgs, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, CMDBLookupCombo, Wwdbspin, TREdit,
  CmEventosCadastro, ImgList, ComCtrls, CMDateTimePicker, wwdbdatetimepicker, Wwdotdot,
  Wwdbcomb, fpessoaMT, DBClient, uCMClientDataSet, CMProcura, TB97Tlwn, uCtrlListTerceirosRH,
  uCtrlMotivo, uCtrlPais, uCtrlSitFunc, uCtrlGlobalRH, uCtrlCargo, uCtrlPessoaSindicato,
  uCtrlPessoaFilialPessoa, uCtrlGrInstr, uCtrlProfiss, uCtrlFonte, uCtrlHoraTrab,
  uCtrlUltimosEmpregos, uCtrlIntegraPrevRH, uCmSqlParams;

type
  TfrmCadFunc = class(TfrmPessoaMT)
    tbsDadosPess: TTabSheet;
    tbsSitFunc: TTabSheet;
    tbsUltEmpr: TTabSheet;
    dbgrUltEmpr: TwwDBGrid;
    opndArqBmp: TOpenPictureDialog;
    dsUltEmpr: TwwDataSource;
    pnlUltEmpr: TPanel;
    Label12: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    dblckUltCargo: TwwDBLookupCombo;
    dbedUltAdm: TCMDateTimePicker;
    dbedUltDem: TCMDateTimePicker;
    dbedUltSal: TDBRealEdit;
    dblcUltMotivo: TwwDBLookupCombo;
    dbedUltCargo: TwwDBEdit;
    dbedUltEmpresa: TwwDBEdit;
    dbedNumSeq: TwwDBEdit;
    gbxIdent: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label55: TLabel;
    Label13: TLabel;
    dbedMatric: TwwDBEdit;
    dbedDatAdmis: TCMDateTimePicker;
    dblckSituacao: TwwDBLookupCombo;
    dblckHorario: TwwDBLookupCombo;
    dblckFonteRecr: TwwDBLookupCombo;
    dbedDatRefHor: TCMDateTimePicker;
    dblckMotivo1: TwwDBLookupCombo;
    dblckMotivo2: TwwDBLookupCombo;
    gbxContr: TGroupBox;
    dbrgTipContrato: TDBRadioGroup;
    gbxContrato: TGroupBox;
    Label43: TLabel;
    Label47: TLabel;
    lblTipoDuracaoContr: TLabel;
    dbedFinalContr: TCMDateTimePicker;
    dbedDuracaoContr: TwwDBEdit;
    dbedProrrogContr: TwwDBEdit;
    gbxDeslig: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    dbedDatSaida: TCMDateTimePicker;
    dbedRetorno: TCMDateTimePicker;
    spedDias: TSpinEdit;
    gbxCargo: TGroupBox;
    Label52: TLabel;
    dblckCargo: TwwDBLookupCombo;
    dbedDataCargo: TCMDateTimePicker;
    gbxSalar: TGroupBox;
    Label50: TLabel;
    Label51: TLabel;
    dbedSalario: TDBRealEdit;
    dbedDatSalar: TCMDateTimePicker;
    dbrgTipoSalar: TDBRadioGroup;
    gbxLotacao: TGroupBox;
    Label29: TLabel;
    Label32: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    dblckEstab: TwwDBLookupCombo;
    dbedDatLotac: TCMDateTimePicker;
    dblckChefe: TwwDBLookupCombo;
    edNomeCCusto: TEdit;
    dblckCCusto: TwwDBLookupCombo;
    dbrgEstCivil: TDBRadioGroup;
    gbxDepend: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    dbedQtdIR: TwwDBEdit;
    dbedQtdSF: TwwDBEdit;
    dbedQtdTot: TwwDBEdit;
    Label21: TLabel;
    dbcmbTipoSang: TwwDBComboBox;
    dbrgSexo: TDBRadioGroup;
    Label2: TLabel;
    dbedDatNasc: TCMDateTimePicker;
    dbrgIsento: TDBRadioGroup;
    Label15: TLabel;
    cmbRaca: TComboBox;
    dblckNacional: TwwDBLookupCombo;
    gbxNaturalidade: TGroupBox;
    Label17: TLabel;
    Label65: TLabel;
    dblckCidadeNasc: TwwDBLookupCombo;
    dblckEstadoNasc: TwwDBLookupCombo;
    Label18: TLabel;
    dblckGrauInstr: TwwDBLookupCombo;
    Label20: TLabel;
    dblckProfissao: TwwDBLookupCombo;
    Label34: TLabel;
    dblckSindi: TwwDBLookupCombo;
    gbxFiliacao: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    CdsMotivo: TCMClientDataSet;
    Label23: TLabel;
    CdsPaises: TCMClientDataSet;
    CdsCidadeNasc: TCMClientDataSet;
    CdsEstadoNasc: TCMClientDataSet;
    CdsCCusto: TCMClientDataSet;
    CdsSitFunc: TCMClientDataSet;
    CdsParamRH: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    CdsChefe: TCMClientDataSet;
    CdsSindicato: TCMClientDataSet;
    CdsGrauInstr: TCMClientDataSet;
    CdsProfissao: TCMClientDataSet;
    CdsFonteRecr: TCMClientDataSet;
    CdsEstab: TCMClientDataSet;
    CdsUltEmpr: TCMClientDataSet;
    CdsHorario: TCMClientDataSet;
    Label24: TLabel;
    Label25: TLabel;
    Panel4: TPanel;
    chkGravaHstAltCad: TCheckBox;
    chkMarcaPonto: TDBCheckBox;
    dbrgDeficienteFis: TGroupBox;
    dbcmbDeficFis: TwwDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure dsSubTipoStateChange(Sender: TObject);
    procedure dblckCCustoChange(Sender: TObject);
    procedure dbedFinalContrExit(Sender: TObject);
    procedure dbedDuracaoContrExit(Sender: TObject);
    procedure dbedRetornoExit(Sender: TObject);
    procedure spedDiasExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure dblckNacionalChange(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dblckCargoChange(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CdsSubTipoAfterScroll(DataSet: TDataSet);
    procedure CdsSubTipoBeforePost(DataSet: TDataSet);
    procedure CdsPessoaFisicaAfterScroll(DataSet: TDataSet);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure dblckUltCargoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbedMatricExit(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlMotivo: TCtrlMotivo;
    CtrlPais: TCtrlPais;
    CtrlSitFunc: TCtrlSitFunc;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlCargo: TCtrlCargo;
    CtrlPessoaSindicato: TCtrlPessoaSindicato;
    CtrlGrInstr: TCtrlGrInstr;
    CtrlProfiss: TCtrlProfiss;
    CtrlFonte: TCtrlFonte;
    CtrlHoraTrab: TCtrlHoraTrab;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlUltimosEmpregos: TCtrlUltimosEmpregos;
    CtrlIntegraPrevRH: TCtrlIntegraPrevRH;

    iPaisAntigo: integer;
    
    procedure SelHstDados;
    procedure SelHstAltCad(PrimeiraVez: boolean);
  protected
    procedure SelSubTipo(IdPessoa: double); override;
  public
    procedure SelFuncionario(IdPessoa: double);
  end;

var
  frmCadFunc: TfrmCadFunc;

implementation

uses uCMTypes, uCtrlPessoa, uCtrlPadroes, uSistema, uMensErro, uDiasUteis, fAguarde,
  uCtrlFuncoesRH, uCtrlPessoaFuncionario, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadFunc.FormCreate(Sender: TObject);
begin
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlPais := TCtrlPais.Create;
  CtrlPais.InitializeAs(Padroes);

  CtrlSitFunc := TCtrlSitFunc.Create;
  CtrlSitFunc.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlPessoaSindicato := TCtrlPessoaSindicato.Create;
  CtrlPessoaSindicato.InitializeAs(Padroes);

  CtrlGrInstr := TCtrlGrInstr.Create;
  CtrlGrInstr.InitializeAs(Padroes);

  CtrlProfiss := TCtrlProfiss.Create;
  CtrlProfiss.InitializeAs(Padroes);

  CtrlFonte := TCtrlFonte.Create;
  CtrlFonte.InitializeAs(Padroes);

  CtrlHoraTrab := TCtrlHoraTrab.Create;
  CtrlHoraTrab.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlUltimosEmpregos := TCtrlUltimosEmpregos.Create;
  CtrlUltimosEmpregos.InitializeAs(Padroes);
  CtrlUltimosEmpregos.CdsUltimosEmpregos := CdsUltEmpr;

  Pessoa := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  Pessoa.InitializeAs(Padroes);
  Pessoa.SubTipo := stFuncionario;
  Pessoa.TipoPessoa := tpFisica;
  Pessoa.MostraFoto := true;
  Pessoa.SaveModuloRespon := false;
  Pessoa.MudaCaption := false;
  Pessoa.FormCaption := Self.Caption;
  Pessoa.ObrigaDocumento := true;

  CtrlIntegraPrevRH := TCtrlIntegraPrevRH.Create;
  CtrlIntegraPrevRH.InitializeAs(Padroes);

  TCtrlPessoaFuncionario(Pessoa).CdsUltEmpr := CdsUltEmpr;
  inherited;
  MontaSelect.SensivelACaixa[0] := 'N';
  MontaSelect.SensivelACaixa[1] := 'N';
  with (MontaSelect.Filtro) do
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

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    // Usuário RH
    if not(CtrlUsoGeralRH.UsuarioRH) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
    Add('FUNCIONARIO.IDSITFUNC = SITFUNC.IDSITFUNC(+)');
  end;

  CdsParamRH.Data := CtrlGlobalRH.GetParamRH('*');
  CdsCCusto.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa),'',false,true);
  CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('D,A');
  CdsSitFunc.Data := CtrlSitFunc.ListGeral(0, '', 'R,G');
  CdsCargo.Data := CtrlCargo.ListCargo;
  CdsSindicato.Data := CtrlPessoaSindicato.ListPessoaSindicato;
  CdsGrauInstr.Data := CtrlGrInstr.ListGrauInstrucao;
  CdsProfissao.Data := CtrlProfiss.ListProfissao;
  CdsFonteRecr.Data := CtrlFonte.ListGeral;
  CdsHorario.Data := CtrlHoraTrab.ListHoraTrab;
  CdsChefe.Data := TCtrlPessoaFuncionario(Pessoa).ListChefe(Sistema.IdEmpresa);
  CdsEstab.Data := CtrlPessoaFilialPessoa.ListEstabDaEmpresa(Sistema.IdEmpresa);

  dblckNacional.OnChange := nil;
  CdsPaises.Data := CtrlPais.ListaPais;
  dblckNacional.OnChange := dblckNacionalChange;
  dblckNacionalChange(Sender);

  case (CdsParamRH.FieldByName('INDDURACAOCONTR').asInteger) of
    1 : lblTipoDuracaoContr.Caption := '(Dias)';
    2 : lblTipoDuracaoContr.Caption := '(Semanas)';
    3 : lblTipoDuracaoContr.Caption := '(Meses)';
    4 : lblTipoDuracaoContr.Caption := '(Anos)';
  end;

  pgctrlDetalhe.ActivePageIndex := 0;

  // Chamada do Empregado Identificado
  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
    SelPessoa(StrToFloat(CtrlUsoGeralRH.IdUsuarioGeral));
end;

procedure TfrmCadFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlPais);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlSitFunc);
  FreeAndNil(CtrlCargo);
  FreeAndNil(Pessoa);
  FreeAndNil(CtrlPessoaSindicato);
  FreeAndNil(CtrlGrInstr);
  FreeAndNil(CtrlProfiss);
  FreeAndNil(CtrlFonte);
  FreeAndNil(CtrlHoraTrab);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlUltimosEmpregos);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlIntegraPrevRH);
  inherited;
end;

procedure TfrmCadFunc.FormShow(Sender: TObject);
begin
  inherited;
  cmbRaca.Enabled := false;
  dbcmbTipoSang.Enabled := false;
  CmeCadastro.Operacao := opIdle;
  CmeCadastroAtualizaBotoes(Sender);
end;

procedure TfrmCadFunc.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    TCtrlPessoaFuncionario(Pessoa).MudouEnderecoResidencial := false;
    TCtrlPessoaFuncionario(Pessoa).MudouSituacao := false;
  end;
end;

procedure TfrmCadFunc.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
  begin
    if (pgctrlDetalhe.ActivePage = tbsDet) then
    begin
      sbtnInsDet.Enabled := (CdsParamRH.FieldByName('FlgEnderIns').asInteger = 1);
      sbtnAltDet.Enabled := (CdsParamRH.FieldByName('FlgEnderAlt').asInteger = 1);
      sbtnExcluiDet.Enabled := (CdsParamRH.FieldByName('FlgEnderExc').asInteger = 1);
    end
    else
    if (pgctrlDetalhe.ActivePage = tbsTelefone) then
    begin
      sbtnInsDet.Enabled := (CdsParamRH.FieldByName('FlgTelefIns').asInteger = 1);
      sbtnAltDet.Enabled := (CdsParamRH.FieldByName('FlgTelefAlt').asInteger = 1);
      sbtnExcluiDet.Enabled := (CdsParamRH.FieldByName('FlgTelefExc').asInteger = 1);
    end
    else
    if (pgctrlDetalhe.ActivePage = tbsContato) then
    begin
      sbtnInsDet.Enabled := (CdsParamRH.FieldByName('FlgConttIns').asInteger = 1);
      sbtnAltDet.Enabled := (CdsParamRH.FieldByName('FlgConttAlt').asInteger = 1);
      sbtnExcluiDet.Enabled := (CdsParamRH.FieldByName('FlgConttExc').asInteger = 1);
    end
    else
    if (pgctrlDetalhe.ActivePage = tbsDadosPess) then
      gbxDepend.Enabled := false
    else
    if (pgctrlDetalhe.ActivePage = tbsSitFunc) then
      tbsSitFunc.Enabled := false
    else
    if (pgctrlDetalhe.ActivePage = tbsUltEmpr) then
    begin
      sbtnInsDet.Enabled := (CdsParamRH.FieldByName('FlgEmprgIns').asInteger = 1);
      sbtnAltDet.Enabled := (CdsParamRH.FieldByName('FlgEmprgAlt').asInteger = 1);
      sbtnExcluiDet.Enabled := (CdsParamRH.FieldByName('FlgEmprgExc').asInteger = 1);
    end;
  end;
end;

procedure TfrmCadFunc.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  if (CdsParamRH.FieldByName('FLGNUMERAMATRIC').asInteger = 1) then
    dbedMatric.Text := TCtrlPessoaFuncionario(Pessoa).GetProxMatricula(
      CdsParamRH.FieldByName('TAMANHOMATRIC').asInteger);
end;

procedure TfrmCadFunc.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  // Chama a rotina de integraçao dos sistemas previdenciários com os sistemas
  // de RH e Folha de Pagamento de uma Fundação
  if (CdsSubTipo.FieldByName('IDEMPRESA').asInteger > 0) and (Sistema.TipoEmpresa = 'P') then
  begin
    frmAguarde.Mostra('Atualizando o Cadastro do Funcionário no Previdenciário');
    frmAguarde.Pos := 0;

    if not(CtrlIntegraPrevRH.AtualizaDadosPrevFuncionario(
        CdsSubTipo.FieldByName('IDEMPRESA').asInteger,
        Cds.FieldByName('IDPESSOA').asInteger)) then
      raise Exception.Create(CtrlIntegraPrevRH.MessageInfo);

    frmAguarde.Apaga;
  end;
end;

procedure TfrmCadFunc.dsStateChange(Sender: TObject);
begin
  inherited;
  cmbRaca.Enabled := (Cds.State in [dsInsert,dsEdit]);
  dbcmbTipoSang.Enabled := cmbRaca.Enabled;
end;

procedure TfrmCadFunc.dsSubTipoStateChange(Sender: TObject);
begin
  inherited;
  dbedSalario.Enabled := (CdsSubTipo.State in [dsInsert,dsEdit]);
end;

procedure TfrmCadFunc.CdsSubTipoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (CdsSubTipo.Active) then
  begin
    dbedSalario.Enabled := (CdsSubTipo.State in [dsInsert,dsEdit]);
    dbedRetornoExit(nil);
  end;
end;

procedure TfrmCadFunc.CdsPessoaFisicaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  //(2->Branca; 4->Preta; 6->Amarela; 8->Parda; 0->Indígena)
  if (CdsPessoaFisica.FieldByName('CORPESSOA').asString = '2') then
    cmbRaca.ItemIndex := 0
  else
  if (CdsPessoaFisica.FieldByName('CORPESSOA').asString = '4') then
    cmbRaca.ItemIndex := 1
  else
  if (CdsPessoaFisica.FieldByName('CORPESSOA').asString = '6') then
    cmbRaca.ItemIndex := 2
  else
  if (CdsPessoaFisica.FieldByName('CORPESSOA').asString = '0') then
    cmbRaca.ItemIndex := 4
  else
    cmbRaca.ItemIndex := 3;
end;

procedure TfrmCadFunc.CdsSubTipoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if not(CdsSubTipo.FieldByName('CODCENTROCUSTO').IsNull) then
    CdsSubTipo.FieldByName('IDEMPRESA').asFloat := Sistema.IdEmpresa;
end;

procedure TfrmCadFunc.dblckCCustoChange(Sender: TObject);
begin
  if (Trim(dblckCCusto.Text) <> '') then
  begin
    CdsCCusto.Locate('CODCENTROCUSTO', dblckCCusto.Text, []);
    edNomeCCusto.Text := CdsCCusto.FieldByName('NOME').asString;
  end
  else
    edNomeCCusto.Text := '';
end;

procedure TfrmCadFunc.dblckNacionalChange(Sender: TObject);
begin
  gbxNaturalidade.Enabled := (Trim(dblckNacional.Text) <> '') or
    (CdsPessoaFisica.FieldByName('IdPessoa').IsNull);

  if (iPaisAntigo <> CdsPaises.FieldByName('IDPAIS').asInteger) or
     (gbxNaturalidade.Enabled) then
  begin
    iPaisAntigo := CdsPaises.FieldByName('IDPAIS').asInteger;
    CdsEstadoNasc.Data := CtrlListTerceirosRH.ListEstado(
      CdsPaises.FieldByName('IDPAIS').asInteger);

    CdsCidadeNasc.Data := CtrlListTerceirosRH.ListCidadeNasc(
      CdsPaises.FieldByName('IDPAIS').asInteger);

    if (CdsPessoaFisica.State in [dsInsert, dsEdit]) then
    begin
      CdsPessoaFisica.FieldByName('CODESTADO').Clear;
      CdsPessoaFisica.FieldByName('IDCIDADES').Clear;
    end;
  end;
end;

procedure TfrmCadFunc.dblckCargoChange(Sender: TObject);
begin
  if not(CdsCargo.Active) or (CdsCargo.FieldByName('CBO2002').IsNull) then
    gbxCargo.Caption := 'Cargo'
  else
    gbxCargo.Caption := 'Cargo (CBO: ' +CdsCargo.FieldByName('CBO2002').asString+ ')';
end;

procedure TfrmCadFunc.dblckUltCargoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (Modified) and (Trim(dblckUltCargo.Text) <> '') and
     (pgctrlDetalhe.ActivePage = tbsUltEmpr) then
    CdsUltEmpr.FieldbyName('CARGO').asString := dblckUltCargo.Text;
end;

procedure TfrmCadFunc.dbedMatricExit(Sender: TObject);
var
  dIdPessoa: double;
begin
  dIdPessoa := TCtrlPessoaFuncionario(Pessoa).GetMatriculaJaExiste(dbedMatric.Text,
    Sistema.IdEmpresa);

  if (dIdPessoa > 0) and (dIdPessoa <> Cds.FieldByName('IDPESSOA').asFloat) then
  begin
    MsgDlg('Matrícula já cadastrada para esta Empresa.' +CR_LF+ 'Informe outra.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    dbedMatric.SetFocus;
  end;
end;

procedure TfrmCadFunc.dbedFinalContrExit(Sender: TObject);
begin
  if (dbedFinalContr.Text <> '') and not(Cds.IsEmpty) then
    TCtrlPessoaFuncionario(Pessoa).SetDuracaoContrato(dbedFinalContr.Date, dbedDatAdmis.Date,
      CdsParamRH.FieldByName('INDDURACAOCONTR').asInteger);
end;

procedure TfrmCadFunc.dbedDuracaoContrExit(Sender: TObject);
var
  DataIni: TDate;
begin
  if (dbedDuracaoContr.Text <> '') and not(Cds.IsEmpty) then
  begin
    if (CdsSubTipo.FieldByName('DURACAOCONTRATO').asInteger = 0) then
    begin
      dbedDuracaoContr.Text := '1';
      CdsSubTipo.FieldByName('DURACAOCONTRATO').asInteger := 1;
    end;

    if (dbedDatAdmis.Text <> '') then
      DataIni := StrToDate(dbedDatAdmis.Text)
    else
      DataIni := Date;

    TCtrlPessoaFuncionario(Pessoa).SetDataFinalContrato(DataIni,
      StrToInt(dbedDuracaoContr.Text), CdsParamRH.FieldByName('INDDURACAOCONTR').asInteger);

    dbedFinalContr.Text := CdsSubTipo.FieldByName('DATAFIMCONTRATO').asString;
  end;
end;

procedure TfrmCadFunc.dbedRetornoExit(Sender: TObject);
begin
  if (Trim(dbedRetorno.Text) <> '') and (Trim(dbedDatSaida.Text) <> '') then
    spedDias.Value := DiasUteis.IntervaloDias(StrToDate(dbedDatSaida.Text),
      StrToDate(dbedRetorno.Text))
  else
    spedDias.Value := 0;
end;

procedure TfrmCadFunc.spedDiasExit(Sender: TObject);
begin
  if (Trim(spedDias.Text) <> '') and (Trim(dbedDatSaida.Text) <> '') then
    CdsSubTipo.FieldByName('DATARETORNO').asDateTime :=
      StrToDate(dbedDatSaida.Text) + StrToInt(spedDias.Text)
  else
    CdsSubTipo.FieldByName('DATARETORNO').Clear;
end;

procedure TfrmCadFunc.sbtnInserirClick(Sender: TObject);
begin
  SelHstAltCad(true);
  inherited;
end;

procedure TfrmCadFunc.sbtnAlterarClick(Sender: TObject);
begin
  SelHstAltCad(true);
  inherited;
end;

procedure TfrmCadFunc.bbtnOkDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsDet) then
    TCtrlPessoaFuncionario(Pessoa).GuardarAlteracaoEndereco
  else
  if (pgctrlDetalhe.ActivePage = tbsUltEmpr) then
  begin
    if (CdsUltEmpr.FieldByName('NUMSEQ').IsNull) then
    begin
      MsgDlg('Número de Sequência deve ser preenchido.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
      dbedNumSeq.SetFocus;
      exit;
    end;
  end;
  inherited;
end;

procedure TfrmCadFunc.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Cds.State = dsInsert) and (CdsSubTipo.FieldByName('IDMOTIVODESLIGRAIS').IsNull) then
  begin
    MsgDlg('Você deve selecionar o Motivo Oficial da Admissão.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    tbcDetalhe.TabIndex := 7;
    pgctrlDetalhe.ActivePageIndex := 7;
    dblckMotivo1.SetFocus;
    exit;
  end;

  //(2->Branca; 4->Preta; 6->Amarela; 8->Parda; 0->Indígena)
  case (cmbRaca.ItemIndex) of
    0 :  CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 2;
    1 :  CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 4;
    2 :  CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 6;
    4 :  CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 0;
    else CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 8;
  end;

  CdsPessoaFisica.FieldByName('IDESTADO').Clear;
  if (CdsSubTipo.FieldByName('IDEMPRESA').IsNull) then
    CdsSubTipo.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;

  bInserindo := (Cds.State = dsInsert);
  SelHstAltCad(false);
  SelHstDados;
  TCtrlPessoaFuncionario(Pessoa).PassouGravacao := false;
  inherited;

  if (TCtrlPessoaFuncionario(Pessoa).PassouGravacao) then
  begin
    TCtrlPessoaFuncionario(Pessoa).GravarHistorico(chkGravaHstAltCad.Checked,
      bInserindo, Sistema.IdEmpresa);

    if (TCtrlPessoaFuncionario(Pessoa).MessageInfo <> '') then
      MsgDlg(TCtrlPessoaFuncionario(Pessoa).MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);

    TCtrlPessoaFuncionario(Pessoa).MudouSituacao := false;
  end;
end;

procedure TfrmCadFunc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if (Assigned(Self.ActiveControl)) and
     (TComponent(Self.ActiveControl).Name = 'bbtnCancelar') and
     (Cds.FieldByName('IDPESSOA').asFloat > 0) then
    CmeCadastroFind(Sender);

  TCtrlPessoaFuncionario(Pessoa).MudouSituacao := false;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadFunc.SelFuncionario(IdPessoa: double);
begin
  SelPessoa(IdPessoa);
end;

procedure TfrmCadFunc.SelSubTipo(IdPessoa: double);
begin
  inherited;
  CdsSubTipo.Data := TCtrlPessoaFuncionario(Pessoa).ListFuncionario(FloatToStr(IdPessoa));
  CdsUltEmpr.Data := CtrlUltimosEmpregos.ListUltimosEmpregos(IdPessoa);
end;

procedure TfrmCadFunc.SelHstDados;
begin
  // Obtém os Dados necessários à alteração da Evolução Funcional
  TCtrlPessoaFuncionario(Pessoa).SelDadosEvolFunc;
  // Obtém os Dados necessários à alteração da Situação Funcional
  TCtrlPessoaFuncionario(Pessoa).SelDadosSitFunc(CdsSitFunc.FieldByName('TIPOSIT').asString);
end;

procedure TfrmCadFunc.SelHstAltCad(PrimeiraVez: boolean);
begin
  // Obtém o Número dos documentos que podem ser alterados
  TCtrlPessoaFuncionario(Pessoa).SelHstDocumentos(PrimeiraVez);
  // Obtém campos iniciais que podem ser alterados
  TCtrlPessoaFuncionario(Pessoa).SelHstAltCad(
    PrimeiraVez,
    CdsSubTipo.FieldByName('MATRICULA').asString,
    Cds.FieldByName('NOME').asString,
    CdsPessoaFisica.FieldByName('DATANASC').asDateTime,
    CdsSubTipo.FieldByName('DATAADMISSAO').asDateTime,
    CdsHorario.FieldByName('NOMEHORARIO').asString,
    CdsChefe.FieldByName('NOME').asString,
    CdsGrauInstr.FieldByName('DESCRICAO').asString,
    CdsPessoaFisica.FieldByName('ESTCIVIL').asString,
    CdsSindicato.FieldByName('RAZAOSOCIAL').asString,
    CdsProfissao.FieldByName('DESCRICAO').asString,
    CdsPessoaFisica.FieldByName('NUMDEPIRRF').asInteger,
    CdsPessoaFisica.FieldByName('NUMDEPSALF').asInteger);
end;

end.
