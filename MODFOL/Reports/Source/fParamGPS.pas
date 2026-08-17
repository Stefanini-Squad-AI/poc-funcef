unit fParamGPS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin,
  DBTables, TREdit, wwdblook, wwdbdatetimepicker, CMDateTimePicker, fSairAjuda, Wwdatsrc,
  Grids, Wwdbigrd, Wwdbgrid, CheckLst, fParamReports_Padrao, CmParamReport, DBClient,
  uCMClientDataSet, uCtrlGuiaGPS, uCtrlGlobalRH, uCtrlPessoaFilialPessoa, uCtrlMotivo,
  uCtrlListTerceirosRH, ColorCheckListBox;

type
  TfrmParamGPS = class(TfrmParamReports_Padrao)
    bbtnHistorico: TBitBtn;
    dbgrdHstGPS: TwwDBGrid;
    dsHstGPS: TwwDataSource;
    bbtnVoltar: TBitBtn;
    gbxTipoInformacao: TGroupBox;
    cmbxTipoInformacao: TComboBox;
    gbxCodPagamento: TGroupBox;
    edCodPagamento: TEdit;
    rgTipoImpressao: TRadioGroup;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxDatasProcess: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtPagamento: TCMDateTimePicker;
    dtVencimento: TCMDateTimePicker;
    rgGera13: TRadioGroup;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxTipoPag: TGroupBox;
    gbxConfigProcess: TGroupBox;
    chkbxCorrecao: TCheckBox;
    cbJuros: TCheckBox;
    cbMulta: TCheckBox;
    pnlJuros: TPanel;
    rbPercentJuros: TRadioButton;
    rbValorJuros: TRadioButton;
    redJuros: TRealEdit;
    pnlMulta: TPanel;
    rbValorMulta: TRadioButton;
    rbPercentMulta: TRadioButton;
    redMulta: TRealEdit;
    pnlCorrecao: TPanel;
    dblkpCorrecao: TwwDBLookupCombo;
    gbxAdicGPS: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    pnlLinha7: TPanel;
    rbTributosLinha7: TRadioButton;
    rbAbatimentoLinha7: TRadioButton;
    pnlLinha8: TPanel;
    rbTributosLinha8: TRadioButton;
    rbAbatimentoLinha8: TRadioButton;
    dtDescricao7: TEdit;
    dtDescricao8: TEdit;
    edValAdicLinha8: TRealEdit;
    edValAdicLinha7: TRealEdit;
    pnlLinha6: TPanel;
    rbTributosLinha6: TRadioButton;
    rbAbatimentoLinha6: TRadioButton;
    edValAdicLinha6: TRealEdit;
    gbxDadosRel: TGroupBox;
    chkbxAtualizacao: TCheckBox;
    chkbxTotal: TCheckBox;
    rgNumVias: TRadioGroup;
    rgProcesso: TRadioGroup;
    chklstTipoFolha: TColorCheckListBox;
    CdsEstab: TCMClientDataSet;
    CdsMoeda: TCMClientDataSet;
    CdsHstGPS: TCMClientDataSet;
    CdsCotacaoMoeda: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chkbxCorrecaoClick(Sender: TObject);
    procedure cbJurosClick(Sender: TObject);
    procedure cbMultaClick(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure edCodPagamentoChange(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnHistoricoClick(Sender: TObject);
  private
    CtrlGuiaGPS: TCtrlGuiaGPS;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlMotivo: TCtrlMotivo;

    ListaIdTipoFolha: TStringList;

    sMoeCodigo: string;
    CotacaoMoedaDataVenc, CotacaoMoedaDataPag: double;

    function  VerificarTipoCorrMonet: boolean;
    function  VerificarOpcoesOk: boolean;
    procedure HabilitaBtOk;
  end;

var
  frmParamGPS: TfrmParamGPS;

implementation

uses uSistema, uMensErro, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamGPS.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
begin
  inherited;
  ListaIdTipoFolha := TStringList.Create;

  CtrlGuiaGPS := TCtrlGuiaGPS.Create;
  CtrlGuiaGPS.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  CdsMoeda.Data := CtrlListTerceirosRH.ListMoeda;

  // Montar a Lista de Tipos de Folha
  chklstTipoFolha.Items.Clear;
  dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdTipoFolha.Add(dmCds.Cds.FieldByName('IDMOTIVO').asString);
    chklstTipoFolha.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Value := FU.ExtraiAno(NormalIni);

  dtPagamento.Date := Date;
  cmbxTipoInformacao.ItemIndex := 0;
end;

procedure TfrmParamGPS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGuiaGPS);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(ListaIdTipoFolha);
  inherited;
end;

procedure TfrmParamGPS.edCodPagamentoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamGPS.dblkcbEstabChange(Sender: TObject);
begin
  dblkcbEstab.Text := Trim(dblkcbEstab.Text);
  HabilitaBtOk;
end;

procedure TfrmParamGPS.chkbxCorrecaoClick(Sender: TObject);
begin
  pnlCorrecao.Visible := chkbxCorrecao.Checked;
end;

procedure TfrmParamGPS.cbJurosClick(Sender: TObject);
begin
  pnlJuros.Visible := cbJuros.Checked;
  if (cbJuros.Checked) then
    redJuros.SetFocus;
end;

procedure TfrmParamGPS.cbMultaClick(Sender: TObject);
begin
  pnlMulta.Visible := cbMulta.Checked;
  if (cbMulta.Checked) then
    redMulta.SetFocus;
end;

procedure TfrmParamGPS.bbtnHistoricoClick(Sender: TObject);
begin
  frmAguarde.Mostra('Selecionando Dados do Histórico...');
  frmAguarde.Update;

  if (dblkcbEstab.Text = '') then
    CdsHstGPS.Data := CtrlGuiaGPS.ListHistGuiaGPS
  else
    CdsHstGPS.Data := CtrlGuiaGPS.ListHistGuiaGPS(CdsEstab.FieldByName('IDPESSOA').asFloat);

  TFloatField(CdsHstGPS.FieldByName('SAL_MAT')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsHstGPS.FieldByName('SAL_FAM')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsHstGPS.FieldByName('AUX_DOENCA')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsHstGPS.FieldByName('AUX_NAT')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsHstGPS.FieldByName('SAT')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsHstGPS.FieldByName('TOTAL')).DisplayFormat := '###,###,##0.00';

  dbgrdHstGPS.Align := alClient;
  dbgrdHstGPS.Visible := true;
  bbtnVoltar.Enabled := true;
  bbtnHistorico.Enabled := false;
  frmAguarde.Apaga;
end;

procedure TfrmParamGPS.bbtnVoltarClick(Sender: TObject);
begin
  dbgrdHstGPS.Visible := false;
  bbtnVoltar.Enabled := false;
  bbtnHistorico.Enabled := true;
end;

procedure TfrmParamGPS.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sListaIdTipoFolhaSel: string;
begin
  CotacaoMoedaDataVenc := 0;
  CotacaoMoedaDataPag := 0;

  if not(VerificarOpcoesOk) then
  begin
    ModalResult := mrNone;
    exit;
  end;

  // Tipos de Folha selecionados
  wNum := FU.CriaListaOpcoes(chklstTipoFolha, ListaIdTipoFolha, sListaIdTipoFolhaSel, ',', false);
  if (wNum = ListaIdTipoFolha.Count) then
    sListaIdTipoFolhaSel := '';

  Cmp_Padrao.ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;
  Cmp_Padrao.ParamByName('IdEstab').asFloat := CdsEstab.FieldByName('IDPESSOA').asFloat;
  Cmp_Padrao.ParamByName('MesRef').asInteger := cmbMes.ItemIndex+1;
  Cmp_Padrao.ParamByName('AnoRef').asInteger := speAno.Value;
  Cmp_Padrao.ParamByName('ListaIdTipoFolha').asString := sListaIdTipoFolhaSel;
  Cmp_Padrao.ParamByName('Juros').asFloat := redJuros.Value;
  Cmp_Padrao.ParamByName('PercentJuros').asBoolean := rbPercentJuros.Checked;
  Cmp_Padrao.ParamByName('Multa').asFloat := redMulta.Value;
  Cmp_Padrao.ParamByName('PercentMulta').asBoolean := rbPercentMulta.Checked;
  Cmp_Padrao.ParamByName('TipoInformacao').asInteger := cmbxTipoInformacao.ItemIndex;
  Cmp_Padrao.ParamByName('GPS13Salario').asBoolean := (rgGera13.ItemIndex = 0);
  Cmp_Padrao.ParamByName('CodPagamento').asString := edCodPagamento.Text;
  Cmp_Padrao.ParamByName('ValorAdicionalLinha6').asFloat := edValAdicLinha6.Value;
  Cmp_Padrao.ParamByName('ValorAdicionalLinha7').asFloat := edValAdicLinha7.Value;
  Cmp_Padrao.ParamByName('ValorAdicionalLinha8').asFloat := edValAdicLinha8.Value;
  Cmp_Padrao.ParamByName('DescrAdicionalLinha7').asString := dtDescricao7.Text;
  Cmp_Padrao.ParamByName('DescrAdicionalLinha8').asString := dtDescricao8.Text;
  Cmp_Padrao.ParamByName('SomaAdicionalLinha6').asBoolean := rbTributosLinha6.Checked;
  Cmp_Padrao.ParamByName('SomaAdicionalLinha7').asBoolean := rbTributosLinha7.Checked;
  Cmp_Padrao.ParamByName('SomaAdicionalLinha8').asBoolean := rbTributosLinha8.Checked;
  Cmp_Padrao.ParamByName('ImprimeAtualizacaoMonet').asBoolean := chkbxAtualizacao.Checked;
  Cmp_Padrao.ParamByName('ImprimeTotal').asBoolean := chkbxTotal.Checked;
  Cmp_Padrao.ParamByName('ImprimeFormulario').asBoolean := (rgTipoImpressao.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ImprimeEmDuasVias').asBoolean := (rgNumVias.ItemIndex = 0);
  Cmp_Padrao.ParamByName('DataPagamento').asString := dtPagamento.Text;
  Cmp_Padrao.ParamByName('DataVencimento').asString := dtVencimento.Text;
  Cmp_Padrao.ParamByName('MoeCodigo').asString := sMoeCodigo;
  Cmp_Padrao.ParamByName('CotacaoMoedaDataPag').asFloat := CotacaoMoedaDataPag;
  Cmp_Padrao.ParamByName('CotacaoMoedaDataVenc').asFloat := CotacaoMoedaDataVenc;

  if (rgProcesso.ItemIndex = 0) then
    Cmp_Padrao.ParamByName('NomeTabela').asString := 'PREVIAFOLPAG'
  else
    Cmp_Padrao.ParamByName('NomeTabela').asString := 'HISTRUBSAL';

  if (rgTipoImpressao.ItemIndex = 0) then
    frmAguarde.Mostra('Relatório GPS (Espelho)')
  else
    frmAguarde.Mostra('Relatório GPS (Imagem)');

  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

function TfrmParamGPS.VerificarTipoCorrMonet: boolean;
var
  iCorrecao: LongInt;
  sDataPgto, sDataVenc: string;
begin
  Result := false;

  if (pnlCorrecao.Visible) then
  begin
    if (dblkpCorrecao.Text = '') then
    begin
      MsgDlg('Tipo de Correção Monetária não escolhida.', 'Aviso', mtWarning, [mbOK,mbHelp], 0);
      dblkpCorrecao.SetFocus;
      exit;
    end
    else
    begin
      iCorrecao := CdsMoeda.FieldByName('MOECODIGO').asInteger;

      //******************************************************************************
      // Verfica se Tipo de Correção Monetária é Diário, Mensal, Semestral ou Anual
      // (tirando otipo DIÁRIO, vale sempre o 1º dia do Mês/Semestre/Ano)
      //******************************************************************************

      //***************
      // Vencimento
      //***************
      case (CdsMoeda.FieldByName('MOEPERIODICIDADE').asString[1]) of
        'D' : sDataVenc := dtVencimento.Text; // Diário
        'M' : sDataVenc := '01'+Copy(dtVencimento.Text,3,8); // Mensal
        'A' : sDataVenc := '01/01'+Copy(dtVencimento.Text,6,5); // Anual
        'S' : // Semestral
        if (StrToDate(dtVencimento.Text) < StrToDate('01/07'+Copy(dtVencimento.Text,6,5))) then
          sDataVenc := '01/01'+Copy(dtVencimento.Text,6,5) // 1º Semestre
        else
          sDataVenc := '01/07'+Copy(dtVencimento.Text,6,5); // 2º Semestre
      end;

      // Verifica se o Tipo está cadastrado na data referida
      CdsCotacaoMoeda.Data := CtrlListTerceirosRH.ListCotacaoMoeda(iCorrecao,
        StrToDate(sDataVenc));

      if (CdsCotacaoMoeda.IsEmpty) then
      begin
        MsgDlg('Tipo de Correção Monetária para Vencimento não cadastrado.',
          'Aviso', mtWarning, [mbOK,mbHelp], 0);
        exit;
      end
      else
        CotacaoMoedaDataVenc := CdsCotacaoMoeda.FieldByName('VALOR').AsFloat;

      //***************
      // Pagamento
      //***************
      case (CdsMoeda.FieldByName('MOEPERIODICIDADE').asString[1]) of
        'D' : sDataPgto := dtPagamento.Text; // Diário
        'M' : sDataPgto := '01'+Copy(dtPagamento.Text,3,8); // Mensal
        'A' : sDataPgto := '01/01'+Copy(dtPagamento.Text,6,5); // Anual
        'S' : // Semestral
          if (StrToDate(dtPagamento.Text) < StrToDate('01/07'+Copy(dtPagamento.Text,6,5))) then
            sDataPgto := '01/01'+Copy(dtPagamento.Text,6,5)  // 1º Semestre
          else
            sDataPgto := '01/07'+Copy(dtPagamento.Text,6,5); // 2º Semestre
      end;

      // Verifica se o Tipo está cadastrado na data referida
      CdsCotacaoMoeda.Data := CtrlListTerceirosRH.ListCotacaoMoeda(iCorrecao,
        StrToDate(sDataPgto));

      if (CdsCotacaoMoeda.IsEmpty) then
      begin
        MsgDlg('Tipo de Correção Monetária para Pagamento não cadastrado.',
          'Aviso', mtWarning, [mbOK,mbHelp], 0);
        exit;
      end
      else
        CotacaoMoedaDataPag := CdsCotacaoMoeda.FieldByName('VALOR').asFloat;
    end;
    sMoeCodigo := CdsMoeda.FieldByName('MOECODIGO').asString;
  end
  else
  begin
    CdsMoeda.Locate('MOEDESC', 'REAL', [loCaseInsensitive]);
    sMoeCodigo := CdsMoeda.FieldByName('MOECODIGO').asString;
  end;

  Result := true;  
end;

function TfrmParamGPS.VerificarOpcoesOk: boolean;
begin
  Result := false;

  // Confirma os Períodos com o usuário
  if (dtPagamento.Date > dtVencimento.Date) then
    if (MsgDlg('Data do Pagamento DIFERENTE da Data do Vencimento.'+CR_LF+
               'Deseja continuar?', 'Aviso', mtConfirmation, [mbYes,mbNo],0) = mrNo) then
      exit;

  // Juros
  if (pnlJuros.Visible) then
  begin
    try
      StrToFloat(redJuros.Text);
    except
      MsgDlg('Valor do Juros Vazio ou Inválido.', 'Aviso', mtWarning, [mbOK,mbHelp], 0);
      redJuros.SetFocus;
      exit;
    end;
  end;

  // Multas
  if (pnlMulta.Visible) then
  begin
    try
      StrToFloat(redMulta.Text);
    except
      MsgDlg('Valor da Multa Vazia ou Inválida.', 'Aviso', mtWarning, [mbOK,mbHelp], 0);
      redMulta.SetFocus;
      exit;
    end;
  end;

  // Verfica se o Tipo de Correção Monetária foi escolhido
  if not(VerificarTipoCorrMonet) then
    exit;

  Result := true;
end;

procedure TfrmParamGPS.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (edCodPagamento.Text <> '') and (dblkcbEstab.Text <> '') and
    (dtVencimento.Text <> '') and (dtPagamento.Text <> '') and (speAno.Text <> '');
end;

end.
