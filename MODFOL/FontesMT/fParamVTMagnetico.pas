// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamVTMagnetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, Spin, ExtCtrls, checklst,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, fSairAjuda, DBClient, wwdblook,
  IniFiles, ComCtrls, CMDateTimePicker, ColorCheckListBox, CMProcuraSubTipo, uCMClientDataSet,
  TB97Tlwn, IvEMulti, uCtrlGlobalRH, uCtrlPessoaFilialPessoa, uCtrlParamVTMagnetico,
  TREdit;

type
  TfrmParamVTMagnetico = class(TfrmSairAjuda)
    ToolbarSep972: TToolbarSep97;
    rbtnGerar: TBitBtn;
    pnlHorario: TPanel;
    pgctrlPrincipal: TPageControl;
    tbshGeral: TTabSheet;
    tbshRioCard: TTabSheet;
    gbxEstab: TGroupBox;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    gbxIntervRef: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedInicio: TCMDateTimePicker;
    dtedFim: TCMDateTimePicker;
    gbxDiasMin: TGroupBox;
    speDias: TSpinEdit;
    gbxDesconta: TGroupBox;
    chkbFerias: TCheckBox;
    chkbFaltas: TCheckBox;
    chkbFeriados: TCheckBox;
    gbxQuantDias: TGroupBox;
    spedQuantDias: TSpinEdit;
    gbxIndentFunc: TGroupBox;
    cmbIdentFunc: TComboBox;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    rgRioCard: TRadioGroup;
    gbxCidadeRecargaRioCard: TGroupBox;
    cmbCidadeRecargaRioCard: TComboBox;
    rgCadUsuarios: TRadioGroup;
    gbxRedeRecarda: TGroupBox;
    cmbRedeRecarda: TComboBox;
    gbxRegTipo3_RioCard: TGroupBox;
    dtedDataLiberacaoCarga_RioCard: TCMDateTimePicker;
    Label3: TLabel;
    cbxRegTipo3_RioCard: TCheckBox;
    cmbTipoEntrega_RioCard: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    spedNumAgencia: TSpinEdit;
    tbshPasseCard: TTabSheet;
    rgPasseCard: TRadioGroup;
    gbxCidadeRecargaPasseCard: TGroupBox;
    cmbCidadeRecargaPasseCard: TComboBox;
    rgCadUsuariosPasseCard: TRadioGroup;
    gbxRedeRecargaPasseCard: TGroupBox;
    cmbRedeRecargaPasseCard: TComboBox;
    redCodCli: TRealEdit;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbtnGerarClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure dtedInicioChange(Sender: TObject);
    procedure rgRioCardClick(Sender: TObject);
    procedure cmbTipoEntrega_RioCardChange(Sender: TObject);
    procedure cbxRegTipo3_RioCardClick(Sender: TObject);
    procedure spedNumAgenciaChange(Sender: TObject);
    procedure rgPasseCardClick(Sender: TObject);
  private
    CtrlParamVTMagnetico: TCtrlParamVTMagnetico;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;

    ListaIdEstab: TStringList;
    ArqConfig: TIniFile;

    sMsg: string;
    sVersaoArqCadUsuariosRioCard: string;
    sVersaoArqPedidoRioCard: string;
    sNomeArqVT: string;
    sPastaArq: string;
    bGerouAlgumArq: boolean;

    procedure LerAlteracoes;
    procedure GravarAlteracoes;
    procedure HabilitaBtOk;
    procedure HabilitarControlesRegTipo3(Valor: boolean);
    procedure HabilitarNumAgencia(Valor: boolean);
    function  VerificaOpcoesOk: boolean;
    procedure Progresso(Args: array of variant);

    function  GerarArquivoVTMagnetico: boolean;
    function  GerarArquivoCadUsuariosRioCard: boolean;
    function  GerarArquivoPedidoRioCard: boolean;
    function  GerarArquivoCadUsuariosPasseCard: boolean;
    function  GerarArquivoPedidoPasseCard: boolean;
    function  GetArquivoAtual(var Arquivo, Inscricao: string): string;
    function  GetCidadeRecargaRioCard: integer;
  end;

var
  frmParamVTMagnetico: TfrmParamVTMagnetico;

implementation

uses uSistema, uMensErro, uModulo, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, FileCtrl, dCds,
  uCtrlUsoGeralRH, uCtrlParamIntegra;

{$R *.DFM}

procedure TfrmParamVTMagnetico.FormCreate(Sender: TObject);
begin
  inherited;
  ListaIdEstab := TStringList.Create;

  CtrlParamVTMagnetico := TCtrlParamVTMagnetico.Create(Modulo.IdContraCheque);
  CtrlParamVTMagnetico.InitializeAs(Padroes);
  CtrlParamVTMagnetico.Progresso := Progresso;

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  // Montagem da Lista dos Estabelecimentos
  chklstEstab.Items.Clear;
  dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdEstab.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  // Obter a data default da tabela de parâmetros
  dtedInicio.Date := FU.ProxMes(CtrlGlobalRH.GetNormalIni);
  dtedFim.Date := FU.ProxMes(CtrlGlobalRH.GetNormalFim);
  pnlHorario.Caption := '';
  cmbIdentFunc.ItemIndex := 0;
  cmbOrderBy.ItemIndex := 2;

  cmbCidadeRecargaRioCard.ItemIndex := 1;
  cmbRedeRecarda.ItemIndex := 0;
  cmbTipoEntrega_RioCard.ItemIndex := 1;
  sNomeArqVT := 'VALE.TXT'; // Nome do arquivo de vale transporte
  sVersaoArqCadUsuariosRioCard := '0200'; // Versão 2.00 do Arquivo de Importação de Usuários Rio Card
  sVersaoArqPedidoRioCard := '0100'; // Versão 1.00 do Arquivo de Importação de Pedidos Rio Card
  pgctrlPrincipal.ActivePageIndex := 0;
  LerAlteracoes;
  rgRioCardClick(nil);
  rgPasseCardClick(nil);
end;

procedure TfrmParamVTMagnetico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravarAlteracoes;
  FreeAndNil(ListaIdEstab);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlParamVTMagnetico);
  inherited;
end;

procedure TfrmParamVTMagnetico.dtedInicioChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamVTMagnetico.cmbTipoEntrega_RioCardChange(Sender: TObject);
begin
  spedNumAgencia.Enabled := (cmbTipoEntrega_RioCard.ItemIndex = 1);
  HabilitarNumAgencia(spedNumAgencia.Enabled);
end;

procedure TfrmParamVTMagnetico.spedNumAgenciaChange(Sender: TObject);
begin
  if (Length(spedNumAgencia.Text) > 4) then // Limitar o número da agência a 4 dígitos
    spedNumAgencia.Text := Copy(spedNumAgencia.Text, 1, 4);
end;

procedure TfrmParamVTMagnetico.chklstEstabClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamVTMagnetico.cbxRegTipo3_RioCardClick(Sender: TObject);
begin
  HabilitarControlesRegTipo3(cbxRegTipo3_RioCard.Checked);
end;

procedure TfrmParamVTMagnetico.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  HabilitaBtOk;
  chklstEstab.Repaint;
end;

procedure TfrmParamVTMagnetico.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  HabilitaBtOk;
  chklstEstab.Repaint;
end;

procedure TfrmParamVTMagnetico.rgRioCardClick(Sender: TObject);
begin
  rgCadUsuarios.Enabled := (rgRioCard.ItemIndex = 0);
  cmbCidadeRecargaRioCard.Enabled := (rgRioCard.ItemIndex = 0);
  cmbRedeRecarda.Enabled := (rgRioCard.ItemIndex = 0);
  cbxRegTipo3_RioCard.Enabled := (rgRioCard.ItemIndex = 0);
  HabilitarControlesRegTipo3((rgRioCard.ItemIndex = 0) and cbxRegTipo3_RioCard.Checked);

  if (rgRioCard.ItemIndex = 0) then
  begin
    rgPasseCard.ItemIndex := 1;
    rgPasseCardClick(nil);
  end;
end;

procedure TfrmParamVTMagnetico.rgPasseCardClick(Sender: TObject);
begin
  inherited;
  rgCadUsuariosPasseCard.Enabled := (rgPasseCard.ItemIndex = 0);
  cmbCidadeRecargaPasseCard.Enabled := (rgPasseCard.ItemIndex = 0);
  cmbRedeRecargaPasseCard.Enabled := (rgPasseCard.ItemIndex = 0);
  redCodCli.Enabled := (rgPasseCard.ItemIndex = 0);

  if (rgPasseCard.ItemIndex = 0) then
  begin
    rgRioCard.ItemIndex := 1;
    rgRioCardClick(nil);
  end;
end;

procedure TfrmParamVTMagnetico.rbtnGerarClick(Sender: TObject);
var
  bOk: boolean;
  sListaIdEstabSel: string;
  MSG: array[1..2] of string;
begin
  if not(VerificaOpcoesOk) then
    exit;

  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  // Processamento
  frmAguarde.Pos := 0;
  frmAguarde.Mostra(Translate('Processando Dados...'));

  bGerouAlgumArq := false;
  MSG[1] := Translate('O Arquivo abaixo foi gerado com sucesso:');
  MSG[2] := Translate('Os Arquivos abaixo foram gerados com sucesso:');
  sMsg := '';
  try
    CtrlParamVTMagnetico.CreateThreadProgresso;
    bOk := CtrlParamVTMagnetico.ProcessarGeracao(
      sListaIdEstabSel, dtedInicio.Date, dtedFim.Date, chkbFerias.Checked,
      chkbFeriados.Checked, chkbFaltas.Checked, spedQuantDias.Value, speDias.Value,
      cmbIdentFunc.ItemIndex, cmbOrderBy.ItemIndex, (rgRioCard.ItemIndex = 0),
      (rgCadUsuarios.ItemIndex = 1), cbxRegTipo3_RioCard.Checked, (rgPasseCard.ItemIndex = 0),
      (rgCadUsuariosPasseCard.ItemIndex = 1), GetCidadeRecargaRioCard,
      cmbRedeRecarda.ItemIndex+1, dtedDataLiberacaoCarga_RioCard.Date,
      cmbTipoEntrega_RioCard.ItemIndex, spedNumAgencia.Text, redCodCli.Value);
    CtrlParamVTMagnetico.FreeThreadProgresso;

    if not(bOk) then
      raise Exception.Create(Translate('Ocorreu um erro durante o Processamento.') +CR_LF+
        Translate('Este erro pode ser decorrente da falta de dados cadastrais') +CR_LF+
        Translate('ou um erro no Sistema.') +CR_LF+ CtrlParamVTMagnetico.MessageInfo);

    frmAguarde.Mostra(Translate('Gerando Arquivos...'));
    frmAguarde.Update;

    // Geração do arquivo de Pedidos de Vale Transporte
    if (rgPasseCard.ItemIndex = 1) and not(GerarArquivoVTMagnetico) then
      raise Exception.Create(sMsg);

    // Geração do arquivo de Importação de Usuários Rio Card
    if (rgRioCard.ItemIndex = 0) and (CtrlParamVTMagnetico.ArquivoCadUsuariosCard.Count-1 >= 0) then
      if not(GerarArquivoCadUsuariosRioCard) then
        raise Exception.Create(sMsg);

    // Geração do arquivo de Importação de Pedidos Rio Card
    if (rgRioCard.ItemIndex = 0) and (CtrlParamVTMagnetico.ArquivoPedidoCard.Count-1 >= 0) then
      if not(GerarArquivoPedidoRioCard) then
        raise Exception.Create(sMsg);

    // Geração do arquivo de Importação de Usuários Passe Card
    if (rgPasseCard.ItemIndex = 0) and (CtrlParamVTMagnetico.ArquivoCadUsuariosCard.Count-1 >= 0) then
      if not(GerarArquivoCadUsuariosPasseCard) then
        raise Exception.Create(sMsg);

    // Geração do arquivo de Importação de Pedidos Passe Card
    if (rgPasseCard.ItemIndex = 0) and (CtrlParamVTMagnetico.ArquivoPedidoCard.Count-1 >= 0) then
      if not(GerarArquivoPedidoPasseCard) then
        raise Exception.Create(sMsg);

    pnlHorario.Caption := Translate('Tempo de Processamento: ')+CtrlParamVTMagnetico.TempoDeProcessamento;
    sMsg := MSG[FU.IFF(FU.ContaCaracter(sMsg,'*')=1, 1, 2)] +CR_LF+ sMsg;
    MsgDlg(sMsg, Translate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
  except
    on E: Exception do
    begin
      if (bGerouAlgumArq) then
        sMsg := E.Message +CR_LF+ MSG[FU.IFF(FU.ContaCaracter(sMsg,'*')=1, 1, 2)] +CR_LF+ sMsg
      else
        sMsg := E.Message;
      MsgDlg(sMsg, Translate('Erro'), mtError, [mbOk,mbHelp], 0);
    end;
  end;

  frmAguarde.Apaga;
  //CtrlParamVTMagnetico.SQL.SaveToFile('c:\qry.txt');
  CtrlParamVTMagnetico.SQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmParamVTMagnetico.LerAlteracoes;
begin
  // Recuperar as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  //sPastaArq := ArqConfig.ReadString('VALE_TRANSP', 'PastaArquivo', 'C:\VALE');
  sPastaArq := ArqConfig.ReadString('VALE_TRANSP', 'PastaArquivo', Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\VALE');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  rgRioCard.ItemIndex := FU.StrInt(ArqConfig.ReadString('VALE_TRANSP', 'RioCard', '0'));
  cmbTipoEntrega_RioCard.ItemIndex := FU.StrInt(ArqConfig.ReadString('VALE_TRANSP', 'TipoEntrega', '1'));
  cmbTipoEntrega_RioCardChange(nil);
  cbxRegTipo3_RioCard.Checked := (UpperCase(ArqConfig.ReadString('VALE_TRANSP', 'GerarRegTipo3', 'False')) = 'TRUE');
  cbxRegTipo3_RioCardClick(nil);
  spedNumAgencia.Text := ArqConfig.ReadString('VALE_TRANSP', 'NumAgencia', '');

  rgPasseCard.ItemIndex := FU.StrInt(ArqConfig.ReadString('VALE_TRANSP', 'PasseCard', '0'));
  redCodCli.Value := StrToFloat(ArqConfig.ReadString('VALE_TRANSP', 'CodCliente', '0'));
  rgCadUsuariosPasseCard.ItemIndex := FU.StrInt(ArqConfig.ReadString('VALE_TRANSP', 'CadUsuPasseCard', '0'));
  cmbCidadeRecargaPasseCard.ItemIndex := FU.StrInt(ArqConfig.ReadString('VALE_TRANSP', 'CidadePasseCard', '0'));
  cmbRedeRecargaPasseCard.ItemIndex := FU.StrInt(ArqConfig.ReadString('VALE_TRANSP', 'RedePasseCard', '0'));
end;

procedure TfrmParamVTMagnetico.GravarAlteracoes;
begin
  ArqConfig.WriteString('VALE_TRANSP', 'RioCard', IntToStr(rgRioCard.ItemIndex));
  ArqConfig.WriteString('VALE_TRANSP', 'PastaArquivo', sPastaArq);
  ArqConfig.WriteString('VALE_TRANSP', 'GerarRegTipo3', FU.IFF(cbxRegTipo3_RioCard.Checked, 'True', 'False'));
  ArqConfig.WriteString('VALE_TRANSP', 'TipoEntrega', IntToStr(cmbTipoEntrega_RioCard.ItemIndex));
  ArqConfig.WriteString('VALE_TRANSP', 'NumAgencia', spedNumAgencia.Text);

  ArqConfig.WriteString('VALE_TRANSP', 'PasseCard', IntToStr(rgPasseCard.ItemIndex));
  ArqConfig.WriteString('VALE_TRANSP', 'CodCliente', FloatToStr(redCodCli.Value));
  ArqConfig.WriteString('VALE_TRANSP', 'CadUsuPasseCard', IntToStr(rgCadUsuariosPasseCard.ItemIndex));
  ArqConfig.WriteString('VALE_TRANSP', 'CidadePasseCard', IntToStr(cmbCidadeRecargaPasseCard.ItemIndex));
  ArqConfig.WriteString('VALE_TRANSP', 'RedePasseCard', IntToStr(cmbRedeRecargaPasseCard.ItemIndex));
  ArqConfig.Free;
end;

procedure TfrmParamVTMagnetico.HabilitaBtOk;
var
  c: integer;
  bSelEstab: boolean;
begin
  bSelEstab := false;
  for c:=0 to chklstEstab.Items.Count-1 do
    if (chklstEstab.Checked[c]) then
    begin
      bSelEstab := true;
      break;
    end;

  rbtnGerar.Enabled := (bSelEstab) and (Trim(dtedInicio.Text) <> '') and
    (Trim(dtedFim.Text) <> '');
end;

procedure TfrmParamVTMagnetico.HabilitarControlesRegTipo3(Valor: boolean);
begin
  dtedDataLiberacaoCarga_RioCard.Enabled := Valor;
  cmbTipoEntrega_RioCard.Enabled := Valor;
  spedNumAgencia.Enabled := Valor;
  HabilitarNumAgencia(Valor and (cmbTipoEntrega_RioCard.ItemIndex = 1));
end;

procedure TfrmParamVTMagnetico.HabilitarNumAgencia(Valor: boolean);
begin
  if (Valor) then
  begin
    spedNumAgencia.Color := clWindow;
    spedNumAgencia.Font.Color := clBlack;
  end
  else
  begin
    spedNumAgencia.Color := clGray;
    spedNumAgencia.Font.Color := clWhite;
  end;
end;

function TfrmParamVTMagnetico.VerificaOpcoesOk: boolean;
begin
  Result := false;
  frmAguarde.Apaga;

  // Abrir o diálogo de seleção do arquivo
  if not(DirectoryExists(sPastaArq)) then
  begin
    if (MsgDlg(Format(Translate('Pasta %s não foi encontrada.'), [sPastaArq]) +CR_LF+
        Translate('Deseja criá-la?'), Translate('Confirmação'),
        mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
      CreateDir(sPastaArq)
    else
    begin
      //sPastaArq := 'C:\';
      sPastaArq := (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
      if not(FU.ProcurarPasta(sPastaArq, Translate('Selecione a Pasta Desejada'),
        Translate('Selecione a Pasta para a Geração dos Arquivos'))) then
        exit;
    end;
  end;

  // Verificar se o arquivo existe na pasta escolhida
  if (FileExists(sPastaArq +'\'+ sNomeArqVT)) then
    RenameFile(
      sPastaArq +'\'+ sNomeArqVT,
      Copy(sPastaArq +'\'+ sNomeArqVT, 1,
        Length(sPastaArq +'\'+ sNomeArqVT) -
        Length(ExtractFileExt(sPastaArq +'\'+ sNomeArqVT))) +
      '-'+
      FormatDateTime('yyyymmdd', FU.GetFileDate(sPastaArq +'\'+ sNomeArqVT)) +'.TXT');

  Result := true;
end;

procedure TfrmParamVTMagnetico.Progresso(Args: array of variant);
begin
  if (Args[0] > 0) then
  begin
    frmAguarde.Min := 0;
    frmAguarde.Max := Args[0];
  end;

  if (Args[1] > 0) then
    frmAguarde.Pos := frmAguarde.Pos + Args[1];

  frmAguarde.Update;
end;

function TfrmParamVTMagnetico.GetCidadeRecargaRioCard: integer;
begin
  case (cmbCidadeRecargaRioCard.ItemIndex) of
    0 : Result := 01; // Teresópolis
    2 : Result := 06; // Niterói
    3 : Result := 46; // Maricá
    4 : Result := 74; // São Gonçalo
    else Result := 2; // Rio de Janeiro
  end;
end;

function TfrmParamVTMagnetico.GerarArquivoVTMagnetico: boolean;
var
  Arq: TStringList;
begin
  Arq := TStringList.Create;

  Result := false;
  frmAguarde.Mostra(Translate('Gravando Arquivo de Vale Transporte...'));
  frmAguarde.pbAguarde.Visible := false;
  frmAguarde.Update;
  try
    Arq.Text := CtrlParamVTMagnetico.ArquivoValeTransporte.Text;
    Arq.SaveToFile(sPastaArq +'\'+ sNomeArqVT);
    sMsg := '  * ' + sNomeArqVT;

    Result := true;
    bGerouAlgumArq := true;
  except
    on E: Exception do
      sMsg := Translate('Ocorreu um erro durante a criação em ') +
        sPastaArq +'\'+ sNomeArqVT +CR_LF+
        Translate('Erro:') +CR_LF+ E.Message;
  end;
  Arq.Free;
end;

function TfrmParamVTMagnetico.GetArquivoAtual(var Arquivo, Inscricao: string): string;
var
  iPos: integer;
  sInscricao: string;
begin
  // Retirar a indicação da inscrição
  FU.ExtraiString(Arquivo, sInscricao, CR_LF);
  // Retirar a marca da inscrição
  Inscricao := Trim(Copy(sInscricao, Length(MARCA_ESTAB)+1, Length(sInscricao)-Length(MARCA_ESTAB)));
  // Retorna somente a porção atual do arquivo
  iPos := Pos(MARCA_ESTAB, Arquivo);
  if (iPos = 0) then
  begin
    Result := Arquivo;
    Arquivo := '';
  end
  else
  begin
    Result := Copy(Arquivo, 1, iPos-1); // O "-1" é para retirar o CR_LF que tem antes da marca
    Delete(Arquivo, 1, iPos);
  end;
end;

function TfrmParamVTMagnetico.GerarArquivoCadUsuariosRioCard: boolean;
var
  Arq: TStringList;
  sConteudoArquivos, sInscricao, sNomeArq: string;
begin
  Arq := TStringList.Create;

  Result := false;
  frmAguarde.Mostra(Translate('Gravando Arquivo(s) de Usuários Rio Card...'));
  frmAguarde.Update;
  try
    sConteudoArquivos := CtrlParamVTMagnetico.ArquivoCadUsuariosCard.Text;
    while (sConteudoArquivos <> '') do
    begin
      Arq.Text := GetArquivoAtual(sConteudoArquivos, sInscricao);
      sNomeArq :=
        'CADUSU_' +
        sVersaoArqCadUsuariosRioCard +'_'+
        sInscricao +'_'+
        FormatDateTime('yyyymmdd', Date) +'_'+
        FormatDateTime('hhnn', Time) + '.TXT';

      Arq.SaveToFile(sPastaArq +'\'+ sNomeArq);
      sMsg := sMsg +CR_LF+ '  * '+ sNomeArq;
    end;

    Result := true;
    bGerouAlgumArq := true;
  except
    on E: Exception do
      sMsg := sMsg +CR_LF+ Translate('Ocorreu um erro durante a criação em ') +
        sPastaArq +'\'+ sNomeArq +CR_LF+
        Translate('Erro:') +CR_LF+ E.Message;
  end;

  Arq.Free;
end;

function TfrmParamVTMagnetico.GerarArquivoPedidoRioCard: boolean;
var
  Arq: TStringList;
  sConteudoArquivos, sInscricao, sNomeArq: string;
begin
  Arq := TStringList.Create;

  Result := false;
  frmAguarde.Mostra(Translate('Gravando Arquivo(s) Pedidos Rio Card...'));
  frmAguarde.Update;
  try
    sConteudoArquivos := CtrlParamVTMagnetico.ArquivoPedidoCard.Text;
    while (sConteudoArquivos <> '') do
    begin
      Arq.Text := GetArquivoAtual(sConteudoArquivos, sInscricao);
      sNomeArq :=
        'PEDIDO_' +
        sVersaoArqPedidoRioCard +'_'+
        sInscricao +'_'+
        FormatDateTime('yyyymmdd', Date) +'_'+
        FormatDateTime('hhnn', Time) + '.TXT';

      Arq.SaveToFile(sPastaArq +'\'+ sNomeArq);
      sMsg := sMsg +CR_LF+ '  * '+ sNomeArq;
    end;

    Result := true;
    bGerouAlgumArq := true;
  except
    on E: Exception do
      sMsg := sMsg +CR_LF+ Translate('Ocorreu um erro durante a criação em ') +
        sPastaArq +'\'+ sNomeArq +CR_LF+
        Translate('Erro:') +CR_LF+ E.Message;
  end;

  Arq.Free;
end;

function TfrmParamVTMagnetico.GerarArquivoCadUsuariosPasseCard: boolean;
var
  Arq: TStringList;
  sConteudoArquivos, sInscricao, sNomeArq: string;
begin
  Arq := TStringList.Create;

  Result := false;
  frmAguarde.Mostra(Translate('Gravando Arquivo(s) de Usuários Passe Card...'));
  frmAguarde.Update;
  try
    sConteudoArquivos := CtrlParamVTMagnetico.ArquivoCadUsuariosCard.Text;
    if (sConteudoArquivos <> '') then
    begin
      Arq.Text := sConteudoArquivos;
      sNomeArq :=
        'CADUSU_PCTRANSFER_' +
        FormatDateTime('yyyymmdd', Date) +'_'+
        FormatDateTime('hhnn', Time) + '.ALP';

      Arq.SaveToFile(sPastaArq +'\'+ sNomeArq);
      sMsg := sMsg +CR_LF+ '  * '+ sNomeArq;
    end;

    Result := true;
    bGerouAlgumArq := true;
  except
    on E: Exception do
      sMsg := sMsg +CR_LF+ Translate('Ocorreu um erro durante a criação em ') +
        sPastaArq +'\'+ sNomeArq +CR_LF+
        Translate('Erro:') +CR_LF+ E.Message;
  end;

  Arq.Free;
end;

function TfrmParamVTMagnetico.GerarArquivoPedidoPasseCard: boolean;
var
  Arq: TStringList;
  sConteudoArquivos, sInscricao, sNomeArq: string;
begin
  Arq := TStringList.Create;

  Result := false;
  frmAguarde.Mostra(Translate('Gravando Arquivo(s) Pedidos Passe Card...'));
  frmAguarde.Update;
  try
    sConteudoArquivos := CtrlParamVTMagnetico.ArquivoPedidoCard.Text;
    if (sConteudoArquivos <> '') then
    begin
      Arq.Text := sConteudoArquivos;
      sNomeArq :=
        'PEDIDO_PCTRANSFER_' +
        FormatDateTime('yyyymmdd', Date) +'_'+
        FormatDateTime('hhnn', Time) + '.PED';

      Arq.SaveToFile(sPastaArq +'\'+ sNomeArq);
      sMsg := sMsg +CR_LF+ '  * '+ sNomeArq;
    end;

    Result := true;
    bGerouAlgumArq := true;
  except
    on E: Exception do
      sMsg := sMsg +CR_LF+ Translate('Ocorreu um erro durante a criação em ') +
        sPastaArq +'\'+ sNomeArq +CR_LF+
        Translate('Erro:') +CR_LF+ E.Message;
  end;

  Arq.Free;
end;

end.
