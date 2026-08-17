unit fCadRegEvol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, TB97, Buttons,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, DBCtrls, CMProcura,
  wwdbedit, TREdit, wwdbdatetimepicker, CMDateTimePicker, wwdblook, ImgList, DBClient,
  CmEventosCadastro, uCMClientDataSet, fCadastroMestreDetMT, TB97Tlwn, Wwdbspin,
  uCtrlCargo, uCtrlGlobalRH, uCtrlPessoaFilialPessoa, uCtrlPessoaFuncionario, uCtrlMotivo,
  uCtrlFaixaSal, uCtrlListTerceirosRH, uCtrlEvolFunc, uCtrlSitFunc, uCtrlTabelaHay,
  uCtrlPpraCipa, uCtrlIntegraPrevRH, IvEMulti;

type
  TfrmCadRegEvol = class(TFrmCadastroMestreDetMT)
    Label2: TLabel;
    dblcTipoEv: TwwDBLookupCombo;
    rgAltSalario: TRadioGroup;
    gbxSalario: TGroupBox;
    Label5: TLabel;
    Label8: TLabel;
    gbxCargo: TGroupBox;
    dblcCargo: TwwDBLookupCombo;
    gbxLotacao: TGroupBox;
    dblcEstab: TwwDBLookupCombo;
    dblcLotac: TwwDBLookupCombo;
    Label4: TLabel;
    dbedDatEfet: TCMDateTimePicker;
    Label3: TLabel;
    Label7: TLabel;
    dbedSalario: TDBRealEdit;
    dbedPerc: TDBRealEdit;
    gbxStepsFaixa: TGroupBox;
    cmbSteps: TComboBox;
    dbedNomeCC: TwwDBEdit;
    Toolbar972: TToolbar97;
    sbtnImprimirEtiqueta: TSpeedButton;
    gbxCargo2: TGroupBox;
    CdsDet: TCMClientDataSet;
    CdsMotivo: TCMClientDataSet;
    CdsEstab: TCMClientDataSet;
    CdsCargo2: TCMClientDataSet;
    CdsLotacao: TCMClientDataSet;
    CdsFaixa: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    CdsParamRH: TCMClientDataSet;
    Label1: TLabel;
    Label10: TLabel;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    edSitFunc: TEdit;
    edCargo: TEdit;
    bbtnEmpresas: TBitBtn;
    CdsEmpresa: TCMClientDataSet;
    townEmpresas: TToolWindow97;
    btnOkMudar: TBitBtn;
    btnCancelarMudar: TBitBtn;
    gbxEmpresas: TGroupBox;
    dblcEmpresas: TwwDBLookupCombo;
    gbxTransfer: TGroupBox;
    cbxFichaFin: TCheckBox;
    cbxLancamentos: TCheckBox;
    townCargoAlternativo: TToolWindow97;
    bbtnFechar: TBitBtn;
    gbxCargoAlt: TGroupBox;
    dblcFuncao: TwwDBLookupCombo;
    gbxFaixa2: TGroupBox;
    Label28: TLabel;
    dbspeStep2: TwwDBSpinEdit;
    dblckFaixa2: TwwDBLookupCombo;
    bbtnAtivarCargoAlt: TBitBtn;
    CdsFaixa2: TCMClientDataSet;
    gbxFaixa1: TGroupBox;
    Label27: TLabel;
    dbspeStep1: TwwDBSpinEdit;
    dblckFaixa1: TwwDBLookupCombo;
    dbrgTipoSalar: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure rgAltSalarioClick(Sender: TObject);
    procedure cmbStepsChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure dbedSalarioChange(Sender: TObject);
    procedure dbedPercChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedDatEfetExit(Sender: TObject);
    procedure sbtnImprimirEtiquetaClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CdsDetBeforePost(DataSet: TDataSet);
    procedure dblcCargoChange(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dblcTipoEvChange(Sender: TObject);
    procedure dblcFuncaoChange(Sender: TObject);
    procedure dblcEstabChange(Sender: TObject);
    procedure dblcLotacChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnOkMudarClick(Sender: TObject);
    procedure btnCancelarMudarClick(Sender: TObject);
    procedure bbtnEmpresasClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnAtivarCargoAltClick(Sender: TObject);
    procedure bbtnFecharClick(Sender: TObject);
    procedure dblckFaixa1Change(Sender: TObject);
  private
    CtrlEvolFunc: TCtrlEvolFunc;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlMotivo: TCtrlMotivo;
    CtrlFaixaSal: TCtrlFaixaSal;
    CtrlCargo: TCtrlCargo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlSitFunc: TCtrlSitFunc;
    CtrlTabelaHay: TCtrlTabelaHay;
    CtrlPpraCipa: TCtrlPpraCipa;
    CtrlIntegraPrevRH: TCtrlIntegraPrevRH;

    IndPolitica: integer;
    SalRef: real;
    bMudouEmpresa: boolean;

    procedure Sel(IdPessoa: double);
    function  GravarRegistro: boolean;
    procedure TestaSeMudouEmpresa;
  end;

var
  frmCadRegEvol: TfrmCadRegEvol;

implementation

uses uCMTypes, uModulo, uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, dCds, fAguarde,
  REtiquetaAlteracaoCTPS, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadRegEvol.FormCreate(Sender: TObject);
var
  c: integer;
begin
  inherited;
  bMudouEmpresa := False;
  CtrlEvolFunc := TCtrlEvolFunc.Create;
  CtrlEvolFunc.InitializeAs(Padroes);
  CtrlEvolFunc.CdsFuncionario := Cds;
  CtrlEvolFunc.CdsEvolFunc := CdsDet;

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlFaixaSal := TCtrlFaixaSal.Create(Sistema.IdEmpresa);
  CtrlFaixaSal.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlSitFunc := TCtrlSitFunc.Create;
  CtrlSitFunc.InitializeAs(Padroes);

  CtrlTabelaHay := TCtrlTabelaHay.Create;
  CtrlTabelaHay.InitializeAs(Padroes);

  CtrlPpraCipa := TCtrlPpraCipa.Create;
  CtrlPpraCipa.InitializeAs(Padroes);

  CtrlIntegraPrevRH := TCtrlIntegraPrevRH.Create;
  CtrlIntegraPrevRH.InitializeAs(Padroes);

  CdsEmpresa.Data := CtrlPpraCipa.ListEmpresaProp;
  bbtnEmpresas.Visible := (CdsEmpresa.RecordCount > 1);

  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  CdsLotacao.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));

  CdsParamRH.Data := CtrlGlobalRH.GetParamRH('NUMSTEPS, FLGDOISCARGOS, FLGNIVELINDIV,'+
    'INDPOLITICA, TITSTEP1, TITSTEP2, TITSTEP3, TITSTEP4, TITSTEP5, TITSTEP6, '+
    'TITSTEP7, TITSTEP8, TITSTEP9');
  CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('A');
  CdsCargo.Data := CtrlCargo.ListCargo;

  dbspeStep2.MaxValue := CdsParamRH.FieldByName('NUMSTEPS').asInteger;
  if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) or
     (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) then
  begin
    dblckFaixa2.Selected.Clear;
    dblckFaixa2.Selected.Add('IDFAIXASALARIAL' +#9+'06'+#9+ 'Código');
    dblckFaixa2.Selected.Add('DATAEFETIV' +#9+'15'+#9+ 'Data Efetivação');

    for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
      dblckFaixa2.Selected.Add('STEP' + IntToStr(c) +#9+'15'+#9+
        CdsParamRH.FieldByName('TITSTEP' + IntToStr(c)).asString);
    if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) then
    begin
      CdsFaixa2.Data := CtrlFaixaSal.ListFaixaSal;
      dbspeStep1.MaxValue := CdsParamRH.FieldByName('NUMSTEPS').asInteger;
      dblckFaixa1.Selected.Clear;
      dblckFaixa1.Selected.Add('IDFAIXASALARIAL' +#9+'06'+#9+ 'Código');
      dblckFaixa1.Selected.Add('DATAEFETIV' +#9+'15'+#9+ 'Data Efetivação');

      for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
        dblckFaixa1.Selected.Add('STEP' + IntToStr(c) +#9+'15'+#9+
          CdsParamRH.FieldByName('TITSTEP' + IntToStr(c)).asString);
    end;
  end;

  IndPolitica := CdsParamRH.FieldByName('INDPOLITICA').asInteger;
  if (IndPolitica = 1) then
  begin
    gbxStepsFaixa.Caption := 'Valor Hay';
    rgAltSalario.Items[3] := 'Hay';
  end;

  gbxCargo2.Visible := (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1);
  if (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) then
    CdsCargo2.Data := CdsCargo.Data
  else
  with dbgrdDet, dbgrdDet.DataSource.DataSet do
  begin
    DisableControls;
    Selected.Delete(6);
    EnableControls;
  end;

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

    // Usuário RH
    if not(CtrlUsoGeralRH.UsuarioRH) or (Sistema.IdModulo = MODFOL) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  // Apresento o MontaSelect antes de visualizar o Form
  sbtnProcurarClick(Self);
  if not(MontaSelect.RetornouValor) then
    Sel(-1);

  case (Sistema.IdModulo) of
    MODCES : HelpContext := 740015;
    MODFOL : HelpContext := 210065;
  end;
end;

procedure TfrmCadRegEvol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlEvolFunc);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlFaixaSal);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlSitFunc);
  FreeAndNil(CtrlTabelaHay);
  FreeAndNil(CtrlPpraCipa);
  FreeAndNil(CtrlIntegraPrevRH);
  inherited;
end;

procedure TfrmCadRegEvol.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));

    dmCds.Cds.Data := CtrlSitFunc.ListGeral(Cds.FieldByName('IDSITFUNC').asInteger);
    if not(dmCds.Cds.IsEmpty) then
      edSitFunc.Text := dmCds.Cds.FieldByName('DESCRICAO').asString
    else
      edSitFunc.Text := '';

    if (CdsCargo.Locate('IDCARGO', Cds.FieldByName('IDCARGO').asFloat, [])) then
      edCargo.Text := CdsCargo.FieldByName('TITULO').asString
    else
      edCargo.Text := '';
  end;
end;

procedure TfrmCadRegEvol.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
  CdsDet.FieldByName('IDEMPRESA').asInteger := Cds.FieldByName('IDEMPRESA').asInteger;
  CdsDet.FieldByName('CODCENTROCUSTO').asString := Cds.FieldByName('CODCENTROCUSTO').asString;
  if (CdsLotacao.Locate('CODCENTROCUSTO', Cds.FieldByName('CODCENTROCUSTO').asString, [])) then
    CdsDet.FieldByName('CENTROCUSTO').asString := CdsLotacao.FieldByName('NOME').asString;
  CdsDet.FieldByName('IDCARGO').asFloat := Cds.FieldByName('IDCARGO').asFloat;

  if (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) then
  begin
    CdsDet.FieldByName('IDFUNCAO').asFloat := Cds.FieldByName('IDFUNCAO').asFloat;
    if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) then
      CdsDet.FieldByName('IDFAIXAFUNCAO').asFloat := Cds.FieldByName('IDFAIXAFUNCAO').asFloat;
    CdsDet.FieldByName('NIVELINDIV2').asFloat := Cds.FieldByName('NIVELINDIV2').asFloat;
  end;

  if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) or
     (Modulo.IdContraCheque = FUNCEF) then
  begin
    if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) then
      CdsDet.FieldByName('IDFAIXACARGO').asFloat := Cds.FieldByName('IDFAIXACARGO').asFloat;
    CdsDet.FieldByName('NIVELINDIV1').asFloat := Cds.FieldByName('NIVELINDIV1').asFloat;
  end;

  CdsDet.FieldByName('IDESTAB').asFloat := Cds.FieldByName('IDESTAB').asFloat;
  CdsDet.FieldByName('SALARIO').asFloat := Cds.FieldByName('SALARIOATUAL').asFloat;
  CdsDet.FieldByName('TIPOPAGAMENTO').asString := Cds.FieldByName('TIPOPAGAMENTO').asString;
  CdsDet.FieldByName('PERC_REAJ').asFloat := 0;
end;

procedure TfrmCadRegEvol.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  // Chama a rotina de integraçao dos sistemas previdenciarios com os sistemas
  // de RH e Folha de Pagamento de uma Fundação
  if (Cds.FieldByName('IDEMPRESA').asString <> '') and (Sistema.TipoEmpresa = 'P') then
  begin
    frmAguarde.Mostra('Atualizando o Histórico das Faixas');
    frmAguarde.Pos := 0;

    if not(CtrlIntegraPrevRH.AtualizaDadosPrevFuncionario(
        Cds.FieldByName('IDEMPRESA').asInteger,
        Cds.FieldByName('IDPESSOA').asInteger)) then
      raise Exception.Create(CtrlIntegraPrevRH.MessageInfo);

    frmAguarde.Apaga;
  end;

  // Verifica se transfere Histórico e Lançamentos para outra empresa
  if (cbxFichaFin.Checked) and (MsgDlg('Confirma Transferência da Ficha Financeira ?',
      'Confirmação', mtConfirmation, [mbYes, mbNo], 0) <> mrNo) then
    if CtrlEvolFunc.TransfereHistoricoRubricas(
       Cds.FieldByName('IDPESSOA').asFloat, CdsEmpresa.FieldByName('IDPESSOA').asInteger) then
         MsgDlg('Transferência da Ficha Financeira Efetuada.', 'Aviso', mtInformation, [mbOk, mbHelp], 0)
    else
         MsgDlg('Não Foi Possível Efetuar a Transferência da Ficha Financeira.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);

  if (cbxLancamentos.Checked) and (MsgDlg('Confirma Transferência dos Lançamentos Pendentes ?',
      'Confirmação', mtConfirmation, [mbYes, mbNo], 0) <> mrNo) then
    if CtrlEvolFunc.TransfereLancamentoRubricas(
       Cds.FieldByName('IDPESSOA').asFloat, CdsEmpresa.FieldByName('IDPESSOA').asInteger) then
         MsgDlg('Transferência dos Lançamentos Pendentes Efetuada.', 'Aviso', mtInformation, [mbOk, mbHelp], 0)
    else
         MsgDlg('Não Foi Possível Efetuar a Transferência dos Lançamentos Pendentes.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);

end;

procedure TfrmCadRegEvol.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRegEvol.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRegEvol.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) then
  begin
    rgAltSalario.Enabled := (Trim(CdsDet.FieldByName('DATAALTERFUNC').asString) <> '');
    gbxSalario.Enabled := rgAltSalario.Enabled;
    rgAltSalario.ItemIndex := 0;
    rgAltSalarioClick(Self);

    if (dblcTipoEv.CanFocus) then
      dblcTipoEv.SetFocus;
  end;
end;

procedure TfrmCadRegEvol.CdsDetBeforePost(DataSet: TDataSet);
var
  sSalDet, sSalCad: string;
begin
  inherited;
  sSalDet := CdsDet.FieldByName('SALARIO').asString;
  sSalCad := Cds.FieldByName('SALARIOATUAL').asString;
  if (CdsDet.FieldByName('DATAALTERFUNC').asDateTime >= Cds.FieldByName('DATASALARIO').asDateTime) and
     (sSalDet <> sSalCad) then
  begin
    Cds.FieldByName('DATASALARIO').asDateTime := CdsDet.FieldByName('DATAALTERFUNC').asDateTime;
    Cds.FieldByName('SALARIOATUAL').asFloat := CdsDet.FieldByName('SALARIO').asFloat;
    Cds.FieldByName('TIPOPAGAMENTO').asString := CdsDet.FieldByName('TIPOPAGAMENTO').asString;
    if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) then
    begin
      if (CdsDet.FieldByName('IDFAIXACARGO').asFloat <> Cds.FieldByName('IDFAIXACARGO').asFloat) then
        Cds.FieldByName('IDFAIXACARGO').asFloat := CdsDet.FieldByName('IDFAIXACARGO').asFloat;
      if (CdsDet.FieldByName('NIVELINDIV1').asFloat <> Cds.FieldByName('NIVELINDIV1').asFloat) then
        Cds.FieldByName('NIVELINDIV1').asFloat := CdsDet.FieldByName('NIVELINDIV1').asFloat;
    end;
    if (Modulo.IdContraCheque = FUNCEF) then
      if (CdsDet.FieldByName('NIVELINDIV1').asFloat <> Cds.FieldByName('NIVELINDIV1').asFloat) then
        Cds.FieldByName('NIVELINDIV1').asFloat := CdsDet.FieldByName('NIVELINDIV1').asFloat;
  end;

  if (CdsDet.FieldByName('DATAALTERFUNC').asDateTime >= Cds.FieldByName('DATACARGO').asDateTime) and
     (CdsDet.FieldByName('IDCARGO').asFloat <> Cds.FieldByName('IDCARGO').asFloat) then
  begin
    Cds.FieldByName('DATACARGO').asDateTime := CdsDet.FieldByName('DATAALTERFUNC').asDateTime;
    Cds.FieldByName('IDCARGO').asFloat := CdsDet.FieldByName('IDCARGO').asFloat;
  end;

  if (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) and
     (CdsDet.FieldByName('DATAALTERFUNC').asDateTime >= Cds.FieldByName('DATACARGO2').asDateTime) then
  begin
    if (CdsDet.FieldByName('IDFUNCAO').asFloat <> Cds.FieldByName('IDFUNCAO').asFloat) then
    begin
      Cds.FieldByName('DATACARGO2').asDateTime := CdsDet.FieldByName('DATAALTERFUNC').asDateTime;
      Cds.FieldByName('IDFUNCAO').asFloat := CdsDet.FieldByName('IDFUNCAO').asFloat;
    end;
    if (CdsDet.FieldByName('NIVELINDIV2').asFloat <> Cds.FieldByName('NIVELINDIV2').asFloat) then
      Cds.FieldByName('NIVELINDIV2').asFloat := CdsDet.FieldByName('NIVELINDIV2').asFloat;
    if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) and
       (CdsDet.FieldByName('IDFAIXAFUNCAO').asFloat <> Cds.FieldByName('IDFAIXAFUNCAO').asFloat) then
        Cds.FieldByName('IDFAIXAFUNCAO').asFloat := CdsDet.FieldByName('IDFAIXAFUNCAO').asFloat;
  end;

  if (CdsDet.FieldByName('DATAALTERFUNC').asDateTime >= Cds.FieldByName('DATALOTACAO').asDateTime) and
     ((CdsDet.FieldByName('CODCENTROCUSTO').asString <> Cds.FieldByName('CODCENTROCUSTO').asString) or
      (CdsDet.FieldByName('IDEMPRESA').asFloat <> Cds.FieldByName('IDEMPRESA').asFloat) or
      (CdsDet.FieldByName('IDESTAB').asFloat <> Cds.FieldByName('IDESTAB').asFloat)) then
  begin
    Cds.FieldByName('DATALOTACAO').asDateTime := CdsDet.FieldByName('DATAALTERFUNC').asDateTime;
    Cds.FieldByName('IDESTAB').asFloat := CdsDet.FieldByName('IDESTAB').asFloat;
    Cds.FieldByName('IDEMPRESA').asFloat := CdsDet.FieldByName('IDEMPRESA').asFloat;
    Cds.FieldByName('CODCENTROCUSTO').asString := CdsDet.FieldByName('CODCENTROCUSTO').asString;
  end;
end;

procedure TfrmCadRegEvol.cmbStepsChange(Sender: TObject);
begin
  if (IndPolitica = 0) then
  begin
    dbedSalario.Value := StrToFloat(FU.TiraCaracter(Copy(cmbSteps.Text,7,14), '.'));
    if (Modulo.IdContraCheque = FUNCEF) then
      CdsDet.FieldByName('NIVELINDIV1').asFloat := StrToFloat(Copy(cmbSteps.Text,1,1));
  end
  else
    dbedSalario.Value := StrToFloat(FU.TiraCaracter(cmbSteps.Text, '.'));
end;

procedure TfrmCadRegEvol.dbedSalarioChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) and (rgAltSalario.ItemIndex in [1, 3]) and
     (SalRef > 0) then
    dbedPerc.Value := (dbedSalario.Value - SalRef) * 100 / SalRef;
end;

procedure TfrmCadRegEvol.dbedPercChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) and (rgAltSalario.ItemIndex = 2) and
     (SalRef > 0) then
    dbedSalario.Value := (100 + dbedPerc.Value) * SalRef / 100;
end;

procedure TfrmCadRegEvol.dblcCargoChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
  begin
    CdsDet.FieldByName('TITULO').asString := CdsCargo.FieldByName('TITULO').asString;
    rgAltSalarioClick(Self);
  end;
end;

procedure TfrmCadRegEvol.dblcTipoEvChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    CdsDet.FieldByName('DESCRICAO').asString := CdsMotivo.FieldByName('DESCRICAO').asString;
end;

procedure TfrmCadRegEvol.dblcFuncaoChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    CdsDet.FieldByName('FUNCAO').asString := CdsCargo2.FieldByName('TITULO').asString;

  if (CdsDet.Active) and (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 0) then
    CdsFaixa2.Data := CtrlFaixaSal.ListFaixaCargo(FU.StrFloat(dblcFuncao.LookupValue));
end;

procedure TfrmCadRegEvol.dblcEstabChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    CdsDet.FieldByName('FILIAL').asString := CdsEstab.FieldByName('NOME').asString;
end;

procedure TfrmCadRegEvol.dblcLotacChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    CdsDet.FieldByName('CENTROCUSTO').asString := CdsLotacao.FieldByName('NOME').asString;
end;

procedure TfrmCadRegEvol.dbedDatEfetExit(Sender: TObject);
begin
  if (Trim(dbedDatEfet.Text) <> '') then
  begin
    SalRef := CtrlEvolFunc.GetSalarioEvolFunc(StrToFloat(MontaSelect.ValoresChave[0]),
      StrToDate(dbedDatEfet.Text));

    if (SalRef = 0) then
      SalRef := Cds.FieldByName('SalarioAtual').asFloat;

    rgAltSalario.Enabled := true;
    gbxSalario.Enabled := true;
  end
  else
    SalRef := 0;
end;

procedure TfrmCadRegEvol.sbtnImprimirEtiquetaClick(Sender: TObject);
begin
  if (CdsDet.IsEmpty) then
    MsgDlg('Para imprimir a carta deve existir alguma solicitação.',
      'Aviso', mtInformation, [mbOk, mbHelp], 0)
  else
  begin
    RptEtiquetaAlteracaoCTPS := TRptEtiquetaAlteracaoCTPS.Create(Self);
    with (RptEtiquetaAlteracaoCTPS.sqlEtiquetaAlteracaoCTPS.SQL) do
    begin
      Clear;
      Add('SELECT');  
      Add('  TO_CHAR(H.DATAALTERFUNC,''DD/MM/YYYY'') AS DATA,');
      Add('  DECODE(E2.IDCARGO,C.IDCARGO,''A mesma'',C.TITULO) AS NOVAFUNCAO,');
      Add('  H.SALARIO AS NOVOSALARIO, F.MATRICULA,');
      Add('  (' +QuotedStr(FU.Replicate(' ',24))+ ' || :MOTIVO || MO.DESCRICAO) AS MOTIVO,');
      Add('  C.CBO2002 AS CBO');
      Add('FROM');
      Add('  EVOLFUNC H, FUNCIONARIO F, MOTIVO MO, CARGO C,');
      Add('  (SELECT');
      Add('     IDCARGO, IDPESSOA');
      Add('   FROM');
      Add('     EVOLFUNC');
      Add('   WHERE');
      Add('     (IDPESSOA      = 10485) AND');
      Add('     (DATAALTERFUNC = (SELECT MAX(DATAALTERFUNC)');
      Add('                       FROM   EVOLFUNC');
      Add('                       WHERE  (IDPESSOA      = 10485) AND');
      Add('                              (DATAALTERFUNC < TO_DATE('+
        QuotedStr(CdsDet.FieldByName('DATAALTERFUNC').asString)+ ',''DD/MM/YYYY''))))) E2');
      Add('WHERE');
      Add('  (MO.GRUPOMOTIVO IN (''A'',''D'')) AND');
      Add('  (H.DATAALTERFUNC = TO_DATE(' +
        QuotedStr(CdsDet.FieldByName('DATAALTERFUNC').asString)+ ',''DD/MM/YYYY'')) AND');
      Add('  (H.IDPESSOA      = ' +CdsDet.FieldByName('IDPESSOA').asString+ ') AND');
      Add('  (H.IDPESSOA      = F.IDPESSOA) AND');
      Add('  (H.IDPESSOA      = E2.IDPESSOA(+)) AND');
      Add('  (H.IDMOTIVO      = MO.IDMOTIVO(+)) AND');
      Add('  (H.IDCARGO       = C.IDCARGO(+))');
    end;
    RptEtiquetaAlteracaoCTPS.sqlEtiquetaAlteracaoCTPS.Prepare;
    RptEtiquetaAlteracaoCTPS.sqlEtiquetaAlteracaoCTPS.ParamByName('MOTIVO').asString :=
      'Por motivo de: ';

    RptEtiquetaAlteracaoCTPS.CrmRptCM.IdReports := 3674;
    RptEtiquetaAlteracaoCTPS.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
    RptEtiquetaAlteracaoCTPS.CrmRptCM.OrigemCM := 1;
    RptEtiquetaAlteracaoCTPS.CrmRptCM.IdModulo := Sistema.IdModulo;
    RptEtiquetaAlteracaoCTPS.CrmRptCM.IdUsuario := Sistema.IdUsuario;
    RptEtiquetaAlteracaoCTPS.CrmRptCM.Print;
    FreeAndNil(RptEtiquetaAlteracaoCTPS);
  end;
end;

procedure TfrmCadRegEvol.rgAltSalarioClick(Sender: TObject);
var
  c: byte;
begin
  cmbSteps.Text := '';
  dbedSalario.Enabled := (rgAltSalario.ItemIndex = 1);
  dbedPerc.Enabled := (rgAltSalario.ItemIndex = 2);
  gbxStepsFaixa.Visible := (rgAltSalario.ItemIndex = 3);

  if (rgAltSalario.ItemIndex = 3) then
  begin
    cmbSteps.Items.Clear;

    if (IndPolitica = 0) then // Faixas Salariais
    begin
      gbxFaixa1.SendToBack;
      if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 0) then // Por Cargo
      begin
        CdsFaixa.Data := CtrlFaixaSal.ListFaixaCargo(CdsDet.FieldByName('IdCargo').asFloat);
        if not(CdsFaixa.IsEmpty) then
          for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
            cmbSteps.Items.Add(IntToStr(c) +'  =  '+
              FloatToStrF(CdsFaixa.FieldByName('Step' +IntToStr(c)).asFloat, ffNumber, 14, 2))
        else
        begin
          MsgDlg('Não Existe Faixa Salarial Associada.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
          rgAltSalario.SetFocus;
          exit;
        end;
      end
      else   // Individuais
        gbxFaixa1.BringToFront;
    end
    else // Tabela Hay
      cmbSteps.Items.Add(FloatToStrF(CtrlTabelaHay.GetValorHay(
        CdsDet.FieldByName('IDCARGO').asInteger), ffNumber, 14, 2));
  end
  else
    gbxFaixa1.SendToBack;
end;

procedure TfrmCadRegEvol.btnOkMudarClick(Sender: TObject);
begin
  if (dblcEmpresas.Text = '') then
  begin
    MsgDlg('Escolha a Empresa.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dblcEmpresas.SetFocus;
    exit;
  end;

  Self.Enabled := true;
  townEmpresas.Visible := false;
  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(CdsEmpresa.FieldByName('IDPESSOA').asString);
  CdsLotacao.Data := CtrlListTerceirosRH.ListCCusto(CdsEmpresa.FieldByName('IDPESSOA').asString);
  bMudouEmpresa := True;
end;

procedure TfrmCadRegEvol.btnCancelarMudarClick(Sender: TObject);
begin
  Self.Enabled := true;
  townEmpresas.Visible := false;
  bMudouEmpresa := False;
  cbxFichaFin.Checked := False;
  cbxLancamentos.Checked := False;
  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  CdsLotacao.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
end;

procedure TfrmCadRegEvol.bbtnEmpresasClick(Sender: TObject);
begin
  townEmpresas.Top := 140;
  townEmpresas.Visible := True;
end;

procedure TfrmCadRegEvol.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblcTipoEv.Text) = '') then
  begin
    MsgDlg('Informe o Tipo de Evento.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dblcTipoEv.SetFocus;
    exit;
  end;

  if (CdsDet.FieldByName('DATAALTERFUNC').IsNull) then
  begin
    MsgDlg('Informe a Data de Efetivação.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDatEfet.SetFocus;
    exit;
  end;

  if (CdsDet.FieldByName('DATAALTERFUNC').asDateTime > Date) then
    if (MsgDlg('Evento para Data Futura.' +CR_LF+ 'Confirma?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    begin
      dbedDatEfet.SetFocus;
      exit;
    end;

  if (Trim(dbedSalario.Text) = '') or (StrToFloat(dbedSalario.Text) = 0) then
    if (MsgDlg('Sem Valor de Salário.' +CR_LF+ 'Confirma?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    begin
      dbedSalario.SetFocus;
      exit;
    end;

  if (bMudouEmpresa) then
    CdsDet.FieldByName('IdEmpresa').asInteger := CdsEmpresa.FieldByName('IdPessoa').asInteger;

  if (CdsDet.State in [dsInsert,dsEdit]) then
    CdsDet.FieldByName('TRGDTINCLUSAO').asDateTime := Now;

  inherited;
  TestaSeMudouEmpresa;
end;

procedure TfrmCadRegEvol.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  TestaSeMudouEmpresa;
end;

procedure TfrmCadRegEvol.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  TestaSeMudouEmpresa;
end;

procedure TfrmCadRegEvol.bbtnConfirmarClick(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert,dsEdit]) then
  begin
    bbtnOkDetClick(Sender);
    bbtnCancelarDetClick(Sender);
  end;
  inherited;
  Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadRegEvol.Sel(IDPessoa: double);
begin
  Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa,
    'P.NOME, F.*, '' '' AS CENTROCUSTO');
  CdsDet.Data := CtrlEvolFunc.ListHistoricoEvolFunc(IdPessoa);

  TFloatField(CdsDet.FieldByName('SALARIO')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsDet.FieldByName('PERC_REAJ')).DisplayFormat := '###,###,##0.00';
end;

function TfrmCadRegEvol.GravarRegistro: boolean;
begin
  Result := CtrlEvolFunc.GravarEvolFunc(true);
  if not(Result) then
    MsgDlg(CtrlEvolFunc.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
end;

procedure TfrmCadRegEvol.TestaSeMudouEmpresa;
begin
  if (bMudouEmpresa) then
  begin
    bMudouEmpresa := False;
    CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
    CdsLotacao.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  end;
end;

procedure TfrmCadRegEvol.bbtnAtivarCargoAltClick(Sender: TObject);
begin
  inherited;
  Self.Enabled := false;
  townCargoAlternativo.Top := 140;
  townCargoAlternativo.Visible := True;
end;

procedure TfrmCadRegEvol.bbtnFecharClick(Sender: TObject);
begin
  inherited;
  Self.Enabled := true;
  townCargoAlternativo.Visible := false;
end;

procedure TfrmCadRegEvol.dblckFaixa1Change(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) then
    dbedSalario.Value := CdsFaixa2.FieldByName('STEP'+ FloatToStr(dbspeStep1.Value)).AsFloat;
end;

end.
