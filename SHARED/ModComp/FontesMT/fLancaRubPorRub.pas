unit fLancaRubPorRub;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadMestreDetCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, Spin, MAHlpBtn,
  TB97Tlbr, StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls, DBCtrls,
  DBClient, TabControlDetalhe, Mask, CMProcuraSubTipo, wwdbedit, wwdblook, TREdit, ImgList,
  CmEventosCadastro, FCadastroMestreDetMT, uCMClientDataSet, uCtrlProvDesc, uCtrlGlobalRH,
  uCtrlRubricaIndiv, uCtrlPessoaFuncionario, uCtrlCadRegra, uCtrlCalcRub, TB97Tlwn;

type
  TfrmLancaRubPorRub = class(TFrmCadastroMestreDetMT)
    Label10: TLabel;
    Label1: TLabel;
    lblMesLanc: TLabel;
    Bevel1: TBevel;
    dbedDescricao: TwwDBEdit;
    dbedCodigo: TwwDBEdit;
    CdsDet: TCMClientDataSet;
    CdsFunc: TCMClientDataSet;
    CdsRegra: TCMClientDataSet;
    Label2: TLabel;
    dblkpcmbEmpregado: TwwDBLookupCombo;
    lblSeq: TLabel;
    dbedSeq: TwwDBEdit;
    chkRubPermanente: TCheckBox;
    grpMesInicio: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    lblParcelas: TLabel;
    spedParcelas: TSpinEdit;
    lblOcorr: TLabel;
    dbedOcorr: TwwDBEdit;
    ProcuraFavorecido: TCMProcuraForCli;
    gbxValInf: TGroupBox;
    dbredValor: TDBRealEdit;
    lblRegra: TLabel;
    dblkcmbRegra: TwwDBLookupCombo;
    gbxValCalc: TGroupBox;
    spdbtnValCalc: TSpeedButton;
    edTotProventos: TRealEdit;
    bbtnDica: TBitBtn;
    townDica: TToolWindow97;
    btnFecharDica: TBitBtn;
    Memo1: TMemo;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    sbtnAlteracaoColetiva: TToolbarButton97;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkRubPermanenteClick(Sender: TObject);
    procedure ProcuraFavorecidoExit(Sender: TObject);
    procedure cmbMesExit(Sender: TObject);
    procedure spnedAnoExit(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dblkcmbRegraChange(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure spdbtnValCalcClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    procedure dblkpcmbEmpregadoChange(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dbgrdDetTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure bbtnDicaClick(Sender: TObject);
    procedure btnFecharDicaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cbxAtivosClick(Sender: TObject);
    procedure dblkpcmbEmpregadoEnter(Sender: TObject);
    procedure sbtnAlteracaoColetivaClick(Sender: TObject);
  private
    CtrlRubricaIndiv: TCtrlRubricaIndiv;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlCadRegra: TCtrlCadRegra;
    CtrlCalcRub: TCtrlCalcRub;

    bMudouSituacao: boolean;
    sAnoMes: string;
    DataFim: TDateTime;
    wDia, wMes, wAno: word;
    UltSeq: integer;

    procedure Sel(IdRubrica: double; Sequencia: integer);
    procedure AtualizaAnoMesInicio;
    procedure CalcularRegra;
    procedure SelListaFunc;
    procedure OnDepoisExecucaoAlterColetiva(const ListaIdRubricaSel: string);
  end;

var
  frmLancaRubPorRub: TfrmLancaRubPorRub;

implementation

uses uCMTypes, uMensErro, uSistema, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH,
     fAlteraColetivoLanca;

{$R *.DFM}

procedure TfrmLancaRubPorRub.FormCreate(Sender: TObject);
var
  NormalIni, NormalFim: TDate;
begin
  inherited;
  UltSeq := 1;

  CtrlRubricaIndiv := TCtrlRubricaIndiv.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRubricaIndiv.InitializeAs(Padroes);
  CtrlRubricaIndiv.CdsRubricaIndiv := CdsDet;

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlCadRegra := TCtrlCadRegra.Create;
  CtrlCadRegra.InitializeAs(Padroes);

  CtrlCalcRub := TCtrlCalcRub.Create;
  CtrlCalcRub.InitializeAs(Padroes);

  CdsRegra.Data := CtrlCadRegra.ListaRegra;
  SelListaFunc;

  if (Sistema.IdModulo = MODAUTO) then
    HelpContext := 4170026;

  NormalIni := CtrlGlobalRH.GetNormalIni;
  NormalFim := CtrlGlobalRH.GetNormalFim;
  if (NormalIni = 0) or (NormalFim = 0) then
  begin
    MsgDlg('Não Há Período Aberto.' +CR_LF+
      'Verifique e tente novamente.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    Close;
    Exit;
  end;

  with (MontaSelect.Filtro) do
  begin
    Clear;
    Add('RUBRICAXPESS.IDRUBRICA IS NULL OR RUBRICAXPESS.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
    Add('PROVDESC.FLGTPRUBRICA LIKE (''%F%'')');
    Add('PROVDESC.IDPROVENTO = RUBRICAXPESS.IDRUBRICA');

    if (Sistema.IdModulo = MODAUTO) then
    begin
      Add('PROVDESC.CODRUBCLT = ''50490''');
      lblSeq.Visible := false;
      dbedSeq.Visible := false;
      chkRubPermanente.Visible := false;
      gbxValCalc.Visible := false;
      grpMesInicio.Visible := false;
      lblParcelas.Visible := false;
      spedParcelas.Visible := false;
      lblOcorr.Visible := false;
      dbedOcorr.Visible := false;
      lblRegra.Visible := false;
      dblkcmbRegra.Visible := false;
    end;
  end;

  lblMesLanc.Caption := 'Período Aberto: ' +DateToStr(NormalIni) +' a '+ DateToStr(NormalFim);

  sAnoMes := FU.RetornaAnoMes(NormalIni);
  DataFim := NormalFim;

  sbtnProcurarClick(Self);
  if not(MontaSelect.RetornouValor) then
    Sel(-1,UltSeq);
end;

procedure TfrmLancaRubPorRub.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlRubricaIndiv);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlCadRegra);
  FreeAndNil(CtrlCalcRub);
  inherited;
end;

procedure TfrmLancaRubPorRub.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[1]),UltSeq);
end;

procedure TfrmLancaRubPorRub.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (Cds.FieldByName('IDREGRA').IsNull) then
    CdsDet.FieldByName('IDREGRACALCULO').Clear
  else
    CdsDet.FieldByName('IDREGRACALCULO').asFloat := Cds.FieldByName('IDREGRA').asFloat;

  CdsDet.FieldByName('IDRUBRICA').asFloat := Cds.FieldByName('IDRUBRICA').asFloat;
  CdsDet.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
  CdsDet.FieldByName('FLGTPRUBMANUT').asInteger := 2;
  CdsDet.FieldByName('ANOMESINICIO').asString := sAnoMes;
  CdsDet.FieldByName('NUMOCORRENCIAS').asInteger := 0;

  AtualizaAnoMesInicio;
  spedParcelas.Value := 1;
  chkRubPermanente.Checked := false;
  dblkpcmbEmpregado.SetFocus;
end;

procedure TfrmLancaRubPorRub.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  spedParcelas.Value := CdsDet.FieldByName('PARCELAS').asInteger;
  chkRubPermanente.Checked := (CdsDet.FieldByName('FLGPERMANENTE').asInteger = 1);
  AtualizaAnoMesInicio;
end;

procedure TfrmLancaRubPorRub.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmLancaRubPorRub.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := (CtrlRubricaIndiv.GravarRubricaIndiv);
  if not(Accept) then
    MsgDlg('Ocorreu um erro ao tentar Inserir/Alterar Lançamento(s).' +CR_LF+ 'Erro:' +CR_LF+
      CtrlProvDesc.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
end;

procedure TfrmLancaRubPorRub.dsDetStateChange(Sender: TObject);
begin
  inherited;
  edTotProventos.Value := 0;

  case (CdsDet.State) of
    dsInsert : spdbtnValCalc.Enabled := false;
    dsEdit   : spdbtnValCalc.Enabled := (CdsDet.FieldByName('IDREGRACALCULO').asString <> '');
  end;
end;

procedure TfrmLancaRubPorRub.dblkpcmbEmpregadoEnter(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) and (bMudouSituacao) then
    SelListaFunc;
end;

procedure TfrmLancaRubPorRub.dblkpcmbEmpregadoChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    CdsDet.FieldByName('FUNCIONARIO').asString := dblkpcmbEmpregado.Text;
end;

procedure TfrmLancaRubPorRub.dblkcmbRegraChange(Sender: TObject);
begin
  spdbtnValCalc.Enabled := (Trim(dblkcmbRegra.Text) <> '');
end;

procedure TfrmLancaRubPorRub.chkRubPermanenteClick(Sender: TObject);
begin
  spedParcelas.Visible := not(chkRubPermanente.Checked);
  lblParcelas.Visible := not(chkRubPermanente.Checked);
end;

procedure TfrmLancaRubPorRub.ProcuraFavorecidoExit(Sender: TObject);
begin
  if (ProcuraFavorecido.Valida <> vcOk) then
    exit;
end;

procedure TfrmLancaRubPorRub.cmbMesExit(Sender: TObject);
begin
  wMes := cmbMes.ItemIndex + 1;
end;

procedure TfrmLancaRubPorRub.spnedAnoExit(Sender: TObject);
begin
  wAno := spnedAno.Value;
end;

procedure TfrmLancaRubPorRub.dbgrdDetTitleButtonClick(Sender: TObject; AFieldName: String);
begin
  inherited;
  if (AFieldName = 'FUNCIONARIO') then
  begin
    UltSeq := 2;
    Sel(StrToFloat(MontaSelect.ValoresChave[1]), UltSeq);
  end
  else
  if (AFieldName = 'ANOMESINICIO') then
  begin
    UltSeq := 1;
    Sel(StrToFloat(MontaSelect.ValoresChave[1]), UltSeq);
  end;
end;

procedure TfrmLancaRubPorRub.bbtnDicaClick(Sender: TObject);
begin
  townDica.Top := 100;
  townDica.BringToFront;
  townDica.Visible := true;
  Self.Enabled := false;
end;

procedure TfrmLancaRubPorRub.btnFecharDicaClick(Sender: TObject);
begin
  Self.Enabled := true;
  townDica.Visible := false;
end;

procedure TfrmLancaRubPorRub.spdbtnValCalcClick(Sender: TObject);
begin
  CalcularRegra;
end;

procedure TfrmLancaRubPorRub.cbxAtivosClick(Sender: TObject);
begin
  bMudouSituacao := true;
end;

procedure TfrmLancaRubPorRub.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblkpcmbEmpregado.Text) = '') then
  begin
    MsgDlg('Pessoa Não Identificada.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblkpcmbEmpregado.SetFocus;
    exit;
  end;

  ProcuraFavorecido.PermiteChaveEmBranco := false;
  if (Cds.FieldByName('FLGOBRIGAFAVOREC').asInteger = 1) and
     (ProcuraFavorecido.Valida <> vcOk) then
  begin
    ProcuraFavorecido.PermiteChaveEmBranco := true;    
    exit;
  end;
  ProcuraFavorecido.PermiteChaveEmBranco := true;

  if (dbredValor.Value = 0) and (Trim(dblkcmbRegra.Text) = '') then
  begin
    MsgDlg('Informe Valor e/ou Regra.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbredValor.SetFocus;
    exit;
  end;

  if (dbredValor.Value <> 0) and (Trim(dblkcmbRegra.Text) <> '') and
     (MsgDlg('Confirma Ambos: Valor e Regra?', 'Aviso', mtWarning,
      [mbYes,mbNo], 0) <> mrYes) then
  begin
    dblkcmbRegra.SetFocus;
    exit;
  end;

  if (CdsDet.State = dsInsert) then
    CdsDet.FieldByName('SEQRUBRICAINDIV').asInteger :=
      CtrlRubricaIndiv.UltimoNumSeq(CdsFunc.FieldByName('IDPESSOA').asFloat,
        Cds.FieldByName('IDRUBRICA').asFloat, Sistema.IdEmpresa) + 1;

  CdsDet.FieldByName('ANOMESINICIO').asString :=
    Trim(spnedAno.Text) +'/'+ FU.RetornaMes(Trim(cmbMes.Text));

  CdsDet.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
  CdsDet.FieldByName('PARCELAS').asInteger := spedParcelas.Value;

  if (chkRubPermanente.Checked) then
    CdsDet.FieldByName('FLGPERMANENTE').asInteger := 1
  else
    CdsDet.FieldByName('FLGPERMANENTE').asInteger := 0;

  if (Trim(dblkcmbRegra.Text) <> '') then
    CdsDet.FieldbyName('IDREGRACALCULO').asInteger := CdsRegra.FieldbyName('IDREGRA').asInteger;
  inherited;
end;

procedure TfrmLancaRubPorRub.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  CmeCadastroFind(Sender);
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmLancaRubPorRub.Sel(IdRubrica: double; Sequencia: integer);
begin
  Cds.Data := CtrlProvDesc.ListProvento(IdRubrica, Sistema.IdEmpresa, -1,
    '  RP.IDRUBRICA, RP.CODPROVDESC, (''  '' || RP.DESCRPROVDESC) DESCRPROVDESC,'+CR_LF+
    '  PD.IDREGRA, PD.FLGOBRIGAFAVOREC');
  CdsDet.Data := CtrlRubricaIndiv.ListPessoaRubricaIndiv(IdRubrica, Sistema.IdEmpresa, Sequencia);

  ProcuraFavorecido.Visible := (Cds.FieldByName('FLGOBRIGAFAVOREC').asInteger = 1);
end;

procedure TfrmLancaRubPorRub.AtualizaAnoMesInicio;
begin
  if (CdsDet.FieldByName('ANOMESINICIO').IsNull) then
    DecodeDate(DataFim, wAno, wMes, wDia)
  else
  begin
    wMes := StrToInt(Copy(CdsDet.FieldByName('ANOMESINICIO').asString,6,2));
    wAno := StrToInt(Copy(CdsDet.FieldByName('ANOMESINICIO').asString,1,4));
  end;
  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value := wAno;
end;

procedure TfrmLancaRubPorRub.CalcularRegra;
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
      CtrlCalcRub.CalcBeneficio(0,
        CdsDet.FieldByName('IDREGRACALCULO').asString,
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

procedure TfrmLancaRubPorRub.SelListaFunc;
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg('Ao menos um Tipo de Situação deve ser selecionado.',
           'Aviso', mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.Checked := true;
    cbxAfastados.Checked := true;
    cbxDemitidos.Checked := true;
  end;

  CdsFunc.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
    '  F.MATRICULA, F.IDPESSOA, P.NOME,'+CR_LF+
    '  TO_CHAR(DECODE(ST.TIPOSIT,''A'',''Ativo(a)'','+CR_LF+
    '    ''F'',''Afastado(a)'','+CR_LF+
    '    ''D'',''Demitido(a)'')) AS SITUACAO','',FU.GerarListaSitFuncSel(
    cbxAtivos.Checked, cbxAfastados.Checked, cbxDemitidos.Checked));

  bMudouSituacao := false;
end;

procedure TfrmLancaRubPorRub.sbtnAlteracaoColetivaClick(Sender: TObject);
begin
  inherited;
  sbtnAlteracaoColetiva.Down := false;
  with TfrmAlteraColetivoLanca.Create(Application) do
  begin
    edCodRubricas.Text := dbedCodigo.Text;
    sbtnMarcarRubClick(nil);
    OnDepoisExecucao := OnDepoisExecucaoAlterColetiva;
    ShowModal;
    Free;
  end;
end;

procedure TfrmLancaRubPorRub.OnDepoisExecucaoAlterColetiva(const ListaIdRubricaSel: string);
begin
  if (dbedCodigo.Text <> '') then
    if (FU.VerificaCodigoEm(ListaIdRubricaSel, Cds.FieldByName('IDRUBRICA').asString, ',') = 1) then
      Sel(StrToFloat(MontaSelect.ValoresChave[1]),UltSeq);
end;

end.
