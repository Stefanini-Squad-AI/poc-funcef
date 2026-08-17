unit fCadRegBen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, ExtCtrls,
  StdCtrls, CmEventosCadastro, ImgList, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti,
  Db, Wwdatsrc, MAHlpBtn, TB97Tlbr, Mask, Buttons, TB97Ctls, TB97, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, wwdbedit, TREdit, Spin, DBCtrls, wwdblook, fcLabel, DBClient,
  FCadastroMestreDetMT, uCMClientDataSet, uCtrlProvDesc, uCtrlRubricaIndiv, uCtrlCadRegra,
  uCtrlPessoaFuncionario, uCtrlCalcRub, uCtrlGlobalRH;

type
  TfrmCadRegBen = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    dbedMat: TwwDBEdit;
    Label10: TLabel;
    dbedNome: TwwDBEdit;
    tb97BotaoIncRubVarPess: TToolbar97;
    sbtnIncRubVarPess: TToolbarButton97;
    CdsRubrica: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    CdsRegra: TCMClientDataSet;
    Label2: TLabel;
    dblckcmbRubrica: TwwDBLookupCombo;
    chkRubPermanente: TCheckBox;
    Label16: TLabel;
    dbedSeq: TwwDBEdit;
    grpMesInicio: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    lblParcelas: TLabel;
    spedParcelas: TSpinEdit;
    Label3: TLabel;
    dbedOcorr: TwwDBEdit;
    gbxValInf: TGroupBox;
    dbedValor: TDBRealEdit;
    Label9: TLabel;
    dblckcmbRegra: TwwDBLookupCombo;
    gbxValCalc: TGroupBox;
    spdbtnValCalc: TSpeedButton;
    edTotProventos: TRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure spnedAnoChange(Sender: TObject);
    procedure dblckcmbRubricaChange(Sender: TObject);
    procedure dblckcmbRegraChange(Sender: TObject);
    procedure chkRubPermanenteClick(Sender: TObject);
    procedure spdbtnValCalcClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnIncRubVarPessClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
  private
    CtrlCalcRub: TCtrlCalcRub;
    CtrlRubricaIndiv: TCtrlRubricaIndiv;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlCadRegra: TCtrlCadRegra;
    CtrlGlobalRH: TCtrlGlobalRH;

    dtDataFim: TDateTime;
    wDia, wMes, wAno: word;

    procedure Sel(IdPessoa: double; AbrePrincipal: boolean);
    procedure AtualizaAnoMesInicio;
    procedure SetaBtIncRubVarPess(OpDown: boolean);
    function  GravarRegistro: boolean;
  public
    bIncRubVarPess: boolean;
  end;

var
  frmCadRegBen: TfrmCadRegBen;

implementation

uses uCMTypes, uSistema, uMensErro, uCtrlFuncoesRH, fIncRubrica, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadRegBen.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRubricaIndiv := TCtrlRubricaIndiv.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRubricaIndiv.InitializeAs(Padroes);
  CtrlRubricaIndiv.CdsRubricaIndiv := CdsDet;

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlCadRegra := TCtrlCadRegra.Create;
  CtrlCadRegra.InitializeAs(Padroes);

  CtrlCalcRub := TCtrlCalcRub.Create;
  CtrlCalcRub.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CdsRegra.Data := CtrlCadRegra.ListaRegra;
  CdsRubrica.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa), 1,
    '  RP.IDPESSOA, RP.IDRUBRICA, RP.DESCRPROVDESC,'+CR_LF+
    '  PD.IDBENEFSALAR, PD.IDREGRA', 1);

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
    if not(CtrlUsoGeralRH.UsuarioRH) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  dtDataFim := CtrlGlobalRH.GetNormalFim;
  bIncRubVarPess := false;

  sbtnProcurarClick(Self);
  if not(MontaSelect.RetornouValor) then
    Sel(-1, true);
end;

procedure TfrmCadRegBen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlRubricaIndiv);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlCadRegra);
  FreeAndNil(CtrlCalcRub);
  FreeAndNil(CtrlGlobalRH);
  inherited;
end;

procedure TfrmCadRegBen.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]), true);
end;

procedure TfrmCadRegBen.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnIncRubVarPess.Enabled := (Cds.State = dsEdit);
  SetaBtIncRubVarPess((Cds.State = dsEdit) and (bIncRubVarPess));
  sbtnInsDet.Down := (Cds.State = dsInsert) and not(sbtnIncRubVarPess.Down);
end;

procedure TfrmCadRegBen.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  edTotProventos.Text := '';
  bIncRubVarPess := sbtnIncRubVarPess.Down;

  CdsDet.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
  CdsDet.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
  CdsDet.FieldByName('FLGTPRUBMANUT').asInteger := 2;
  CdsDet.FieldByName('NUMOCORRENCIAS').asInteger := 0;

  AtualizaAnoMesInicio;
  spedParcelas.Value := 1;
  chkRubPermanente.Checked := false;
  dblckcmbRubrica.SetFocus;
end;

procedure TfrmCadRegBen.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  spedParcelas.Value := CdsDet.FieldByName('PARCELAS').asInteger;
  chkRubPermanente.Checked := (CdsDet.FieldByName('FLGPERMANENTE').asInteger = 1);
  AtualizaAnoMesInicio;
end;

procedure TfrmCadRegBen.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRegBen.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRegBen.dsDetStateChange(Sender: TObject);
begin
  inherited;
  edTotProventos.Value := 0;
  spdbtnValCalc.Enabled := (CdsDet.FieldByName('IDREGRACALCULO').asString <> '') and
    (CdsDet.State = dsEdit);
end;

procedure TfrmCadRegBen.cmbMesChange(Sender: TObject);
begin
  wMes := cmbMes.ItemIndex + 1;
end;

procedure TfrmCadRegBen.spnedAnoChange(Sender: TObject);
begin
  wAno := spnedAno.Value;
end;

procedure TfrmCadRegBen.dblckcmbRubricaChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
  begin
    if (CdsRubrica.FieldByName('IDREGRA').asFloat <> 0) then
      CdsDet.FieldByName('IDREGRACALCULO').asFloat := CdsRubrica.FieldByName('IDREGRA').asFloat
    else
      CdsDet.FieldByName('IDREGRACALCULO').Clear;

    CdsDet.FieldByName('RUBRICA').asString := Trim(dblckcmbRubrica.Text);
  end;
end;

procedure TfrmCadRegBen.dblckcmbRegraChange(Sender: TObject);
begin
  spdbtnValCalc.Enabled := (Trim(dblckcmbRegra.Text) <> '');
end;

procedure TfrmCadRegBen.chkRubPermanenteClick(Sender: TObject);
begin
  spedParcelas.Visible := not(chkRubPermanente.Checked);
  lblParcelas.Visible := not(chkRubPermanente.Checked);
end;

procedure TfrmCadRegBen.spdbtnValCalcClick(Sender: TObject);
var
  dValCalc: double;
begin
  if not(CdsDet.FieldByName('VALORRUBRICA').IsNull) then
    dValCalc := CdsDet.FieldByName('VALORRUBRICA').asFloat
  else
    dValCalc := 0;

  try
    if not(CdsDet.FieldByName('IDREGRACALCULO').IsNull) then
    begin
      CtrlCalcRub.IniFormaCalc(GERACAO_NORMAL);
      CtrlCalcRub.CalcBeneficio(
        0, CdsDet.FieldByName('IDREGRACALCULO').asString,
        CdsDet.FieldByName('IDPESSOA').asString, dValCalc, 0, 1,
        CdsDet.FieldByName('PARCELAS').asInteger,
        CdsDet.FieldByName('NumOcorrencias').asInteger, 0, 0);

      if (CtrlCalcRub.ErroExecucao) then
        MsgDlg(CtrlCalcRub.MessageInfo, 'Erro', mtError, [mbOk, mbHelp], 0);
    end;
  except
  end;

  edTotProventos.Value := dValCalc;
end;

procedure TfrmCadRegBen.sbtnIncRubVarPessClick(Sender: TObject);
begin
  if (sbtnIncRubVarPess.Down) then
  begin
    dbgrdDet.SendToBack;
    tb97Detalhe.Visible := true;
    CmeDetalhe.Insert(Self);
    CmeDetalhe.Atualizabotoes(Self)
  end
  else
    sbtnIncRubVarPess.Down := true;
end;

procedure TfrmCadRegBen.bbtnOkDetClick(Sender: TObject);
var
  iProxSeq, iNumParcelas, iNumOcorrencias: integer;
  dIdPessoa, dIdRubrica, dIdRegra, dValor: double;
  bInserindo, bRubPermanente: boolean;
begin
  if (Trim(dblckcmbRubrica.Text) = '') then
  begin
    MsgDlg('Rubrica Não Identificada.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblckcmbRubrica.SetFocus;
    exit;
  end;

  if (dbedValor.Value = 0) and (Trim(dblckcmbRegra.Text) = '') then
  begin
    MsgDlg('Informe Valor e/ou Regra.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedValor.SetFocus;
    exit;
  end;

  if (dbedValor.Value <> 0) and (Trim(dblckcmbRegra.Text) <> '') and
     (MsgDlg('Confirma Ambos: Valor e Regra?', 'Confirmação', mtConfirmation,
      [mbYes, mbNo], 0) <> mrYes) then
  begin
    dbedValor.SetFocus;
    exit;
  end;

  if (bIncRubVarPess) then
  begin
    iNumOcorrencias := CdsDet.FieldByName('NUMOCORRENCIAS').asInteger;
    dIdRubrica := CdsRubrica.FieldByName('IDRUBRICA').asFloat;
    iNumParcelas := spedParcelas.Value;
    bRubPermanente := chkRubPermanente.Checked;
    dValor := dbedValor.Value;

    if (Trim(dblckcmbRegra.Text) <> '') then
      dIdRegra := CdsRegra.FieldByName('IDREGRA').asFloat
    else
      dIdRegra := 0;  

    bbtnCancelarClick(bbtnConfirmar);

    if (IncluirBeneficios(dIdRubrica, Trim(spnedAno.Text) +'/'+ FU.RetornaMes(Trim(cmbMes.Text)),
        iNumParcelas, bRubPermanente, dIdRegra, iNumOcorrencias, dValor) and
       (MsgDlg('Deseja fazer a atualização da tela agora?', 'Confirmação',
        mtConfirmation, [mbYes,mbNo], 0) = mrYes)) then
      Sel(StrToFloat(MontaSelect.ValoresChave[0]), false);
  end
  else
  begin
    // Geração do Próximo Número de Sequência
    bInserindo := (CdsDet.State = dsInsert);
    if (bInserindo) then
    begin
      CdsDet.DisableControls;
      dIdPessoa := CdsDet.FieldByName('IDPESSOA').asFloat;
      dIdRubrica := CdsDet.FieldByName('IDRUBRICA').asFloat;

      CdsDet.Post;
      CdsDet.Filter := 'IDPESSOA = '+ FloatToStr(dIdPessoa) +' AND '+
                       'IDRUBRICA = '+ FloatToStr(dIdRubrica);
      CdsDet.Filtered := true;
      if (CdsDet.IsEmpty) then
        iProxSeq := 1
      else
      begin
        iProxSeq := 0;
        CdsDet.First;
        repeat
          if (iProxSeq < CdsDet.FieldByName('SEQRUBRICAINDIV').asInteger) then
            iProxSeq := CdsDet.FieldByName('SEQRUBRICAINDIV').asInteger;
          CdsDet.Next;
        until (CdsDet.EOF);
        iProxSeq := iProxSeq + 1;
      end;

      CdsDet.Filtered := false;
      CdsDet.Locate('IDEMPRESA;IDPESSOA;IDRUBRICA;SEQRUBRICAINDIV', VarArrayOf([
        Sistema.IdEmpresa, dIdPessoa, dIdRubrica, 0]), []);

      CdsDet.Edit;
      CdsDet.EnableControls;
      CdsDet.FieldByName('SEQRUBRICAINDIV').asInteger := iProxSeq;
    end;

    CdsDet.FieldByName('ANOMESINICIO').asString :=
      Trim(spnedAno.Text) + '/' + FU.RetornaMes(Trim(cmbMes.Text));

    CdsDet.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
    CdsDet.FieldByName('PARCELAS').asInteger := spedParcelas.Value;

    if (chkRubPermanente.Checked) then
      CdsDet.FieldByName('FLGPERMANENTE').asInteger := 1
    else
      CdsDet.FieldByName('FLGPERMANENTE').asInteger := 0;
    inherited;
    if (bInserindo) then
    begin
      sbtnInsDet.Down := true;
      sbtnInsDetClick(sbtnInsDet);
    end;
  end;
end;

procedure TfrmCadRegBen.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  SetaBtIncRubVarPess(false);
end;

procedure TfrmCadRegBen.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  SetaBtIncRubVarPess(false);
end;

procedure TfrmCadRegBen.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Sel(StrToFloat(MontaSelect.ValoresChave[0]), false);
  Cds.Cancel;
  SetaBtIncRubVarPess(false);
  sbtnIncRubVarPess.Enabled := false;
end;

procedure TfrmCadRegBen.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  SetaBtIncRubVarPess(false);
  sbtnIncRubVarPess.Enabled := false;
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmCadRegBen.Sel(IdPessoa: double; AbrePrincipal: boolean);
begin
  if (AbrePrincipal) then
    Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa,
      '  F.IDPESSOA, F.MATRICULA, P.NOME');
  CdsDet.Data := CtrlRubricaIndiv.ListRubricaXRubricaIndiv(IdPessoa, Sistema.IdEmpresa, 1);

  sbtnAlterar.Enabled := not(CdsDet.EOF);
  sbtnApagar.Enabled := not(CdsDet.EOF);
end;

function TfrmCadRegBen.GravarRegistro: boolean;
begin
  Result := CtrlRubricaIndiv.GravarRubricaIndiv;
  if not(Result) then
    raise Exception.Create(CtrlRubricaIndiv.MessageInfo);
end;

procedure TfrmCadRegBen.AtualizaAnoMesInicio;
begin
  if (Trim(CdsDet.FieldByName('ANOMESINICIO').asString) = '') then
    DecodeDate(dtDataFim, wAno, wMes, wDia)
  else
  begin
    wMes := FU.StrInt(Copy(CdsDet.FieldByName('ANOMESINICIO').asString,6,2));
    wAno := FU.StrInt(Copy(CdsDet.FieldByName('ANOMESINICIO').asString,1,4));
  end;
  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value := wAno;
end;

procedure TfrmCadRegBen.SetaBtIncRubVarPess(OpDown: boolean);
begin
  sbtnIncRubVarPess.Down := OpDown;
  bIncRubVarPess := OpDown;
end;

end.
