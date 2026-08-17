unit fRegAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, IvDictio, IvMulti, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, DB, DBClient,
  uCMClientDataSet, Wwdatsrc, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, fcLabel, TB97Tlwn,
  Mask, wwdbedit, Wwdotdot, Wwdbcomb, Spin, uCMTranslate, IniFiles, uBiometria, uCtrlCargo,
  uCtrlListTerceirosRH, uCtrlPessoaFuncionario, uCtrlGlobalRH, uCtrlHoraTrab,
  uCtrlAssociaHorario, uCtrlRegAcessoFunc, uCtrlHorarioVariavel, ComPort;

type
  TfrmRegAcesso = class(TfrmTelaAutorizacao)
    dsImg: TwwDataSource;
    CdsImg: TCMClientDataSet;
    dsHorario: TwwDataSource;
    CdsHorario: TCMClientDataSet;
    tmHoraAtual: TTimer;
    CdsAcessoFunc: TCMClientDataSet;
    Bevel2: TBevel;
    lblMatricula: TLabel;
    lblNome: TLabel;
    lblCCusto: TLabel;
    lblCargo: TLabel;
    Bevel4: TBevel;
    bbtnOk: TBitBtn;
    bbtnRejeitar: TBitBtn;
    bbtnSair: TBitBtn;
    Bevel3: TBevel;
    lblHorarioTrab: TLabel;
    wwDBGrid1: TwwDBGrid;
    pnlDocumento: TPanel;
    lblMensagem: TLabel;
    lblHora: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    imgPessoa: TDBImage;
    memDocumento: TMemo;
    lblMensagem2: TfcLabel;
    pnlTeclado: TPanel;
    Label2: TLabel;
    edDocumento: TEdit;
    bbtnOKteclado: TBitBtn;
    bbtnCancTeclado: TBitBtn;
    tmInterrogacao: TTimer;
    townTelaConfig: TToolWindow97;
    btnFecharTelaConfig: TBitBtn;
    gbxTurnos: TGroupBox;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    mkedInicio1: TMaskEdit;
    mkedFinal1: TMaskEdit;
    edNome1: TEdit;
    mkedInicio2: TMaskEdit;
    mkedFinal2: TMaskEdit;
    edNome2: TEdit;
    mkedInicio3: TMaskEdit;
    mkedFinal3: TMaskEdit;
    edNome3: TEdit;
    rgHorario: TRadioGroup;
    gbxSerial: TGroupBox;
    Label3: TLabel;
    cmbVeloc: TComboBox;
    Label4: TLabel;
    cmbBitDado: TComboBox;
    cmbFluxo: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    cmbParidade: TComboBox;
    Label7: TLabel;
    cmbBitParada: TComboBox;
    gbxMensagem: TGroupBox;
    edMensagemPadrao: TEdit;
    Label8: TLabel;
    cmbAcionamento: TwwDBComboBox;
    gbxTempoEspera: TGroupBox;
    spedTempo: TSpinEdit;
    CdsHorarioVariavel: TCMClientDataSet;
    CdsFuncionario: TCMClientDataSet;
    rgPontoAcesso: TRadioGroup;
    chkLOG: TCheckBox;
    cbxTolerancia: TCheckBox;
    gbxMin: TGroupBox;
    spedMin: TSpinEdit;
    Label9: TLabel;
    CdsFunc: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnRejeitarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure memDocumentoChange(Sender: TObject);
    procedure bbtnCancTecladoClick(Sender: TObject);
    procedure bbtnOKtecladoClick(Sender: TObject);
    procedure btnFecharTelaConfigClick(Sender: TObject);
    procedure rgHorarioClick(Sender: TObject);
    procedure cbxToleranciaClick(Sender: TObject);
    procedure tmInterrogacaoTimer(Sender: TObject);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlCargo: TCtrlCargo;
    CtrlHoraTrab: TCtrlHoraTrab;
    CtrlAssociaHorario: TCtrlAssociaHorario;
    CtrlRegAcessoFunc: TCtrlRegAcessoFunc;
    CtrlHorarioVariavel: TCtrlHorarioVariavel;

    ArqConfig: TIniFile;

    dIdPessoa: double;
    dIdEmpresa: double;
    dIdCargo: double;

    sCodCentroCusto: string;
    sNumDocumento: string;

    FObjPorta: TComPort;

    FLog: TStringList;
    FUlt_Result_Comando: char;
    sCheck, cBuffer, sEndereco, sCartao, sStatus: string;

    procedure SelPessoa;
    function  ProcurarPessoa: boolean;
    procedure HabilitarBotoes(const Habilita: boolean);
    procedure ExecFocus(const ExecLimparTela: boolean = true);

    procedure MontarTelaInicial;

    procedure LeAlteracoes;
    procedure GravaAlteracoes;

    function BCDToDec(sValorBCD: string): string;
    function CheckSumRodbel(Endereco, Funcao, Tamanho: byte; Texto: string): string;
    function CodAscii(const Msg: string): string;
    function DecToBCD(sValorDec: string): string;
    function Enviar_DataHora: string;
    function GeraPolling(cAcao: Char; cDados: String): string;
    function HexToBinECF(Text: String; var Buffer: String;
      BufSize: Integer): Integer;
    function MoveRegistro(Str: string): boolean;
    function Recepcao: string;
    procedure Interrogacao;
  public
    iColDocumento: integer;
    iTamDocumento: integer;

    dIdDocumento: double;

    sMensagem: string;

    procedure LimparTela;
  end;

var
  frmRegAcesso: TfrmRegAcesso;

implementation

uses StrUtils, uSistema, uMensErro, uCtrlPadroes, uModulo, uCtrlFuncoesRH, uCtrlUsoGeralRH,
  fPrincipal, dCds{, uCmCustomCdbObject};

{$R *.dfm}

procedure TfrmRegAcesso.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlHoraTrab := TCtrlHoraTrab.Create;
  CtrlHoraTrab.InitializeAs(Padroes);

  CtrlAssociaHorario := TCtrlAssociaHorario.Create;
  CtrlAssociaHorario.InitializeAs(Padroes);

  CtrlHorarioVariavel := TCtrlHorarioVariavel.Create;
  CtrlHorarioVariavel.InitializeAs(Padroes);

  CtrlRegAcessoFunc := TCtrlRegAcessoFunc.Create;
  CtrlRegAcessoFunc.InitializeAs(Padroes);
  CtrlRegAcessoFunc.CdsAcessoFunc := CdsAcessoFunc;

  CdsAux.Data := CtrlGlobalRH.GetParamRH(
    'IDDOCUMENTO, COLDOCUMENTO, TAMDOCUMENTO, TAMANHOMATRIC');
  dIdDocumento := CdsAux.FieldByName('IDDOCUMENTO').asFloat;
  iColDocumento := CdsAux.FieldByName('COLDOCUMENTO').asInteger;
  iTamDocumento := CdsAux.FieldByName('TAMDOCUMENTO').asInteger;

  FLog := TStringList.Create;  
  FObjPorta := TComPort.Create(Self);

  MontarTelaInicial;
  LimparTela;

  // Carregar alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmRegAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

  // Desligar os Timers
  tmInterrogacao.Enabled := false;
  tmHoraAtual.Enabled := false;

  // Salvar Log
  if (chkLOG.Checked) then
    FLog.SaveToFile(ExtractFilePath(Application.ExeName)+ 'RegAcesso.log');

  // Liberar os recursos da classe de acesso ao leitor instanciada
  if (FObjPorta.Active) then
    FObjPorta.Close;

  FObjPorta.Free;
  FLog.Free;

  // Liberar os recursos das classes de controle instanciadas
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlHoraTrab);
  FreeAndNil(CtrlAssociaHorario);
  FreeAndNil(CtrlRegAcessoFunc);
  FreeAndNil(CtrlHorarioVariavel);

  // Desabilitar Teclados na Tela Principal
  frmPrincipal.sbtnTeclado.Visible := false;
  frmPrincipal.sbtnTecladoMatric.Visible := false;

  // Gravar alterações nas opções feitas
  GravaAlteracoes;
  inherited;
end;

procedure TfrmRegAcesso.FormShow(Sender: TObject);
begin
  inherited;

  // Inicializar a tela de configuração
  townTelaConfig.Top := 180;
  townTelaConfig.Left := 100;
  townTelaConfig.BringToFront;
  townTelaConfig.Visible := true;
  Self.Enabled := false;
end;

procedure TfrmRegAcesso.tmInterrogacaoTimer(Sender: TObject);
begin
  tmInterrogacao.Enabled := false;
  {memDocumento.Text := }Interrogacao;
  tmInterrogacao.Enabled := true;
end;

procedure TfrmRegAcesso.memDocumentoChange(Sender: TObject);
begin
  if (Length(memDocumento.Text) >= iColDocumento + iTamDocumento - 1) then
    SelPessoa;
end;

procedure TfrmRegAcesso.rgHorarioClick(Sender: TObject);
begin
  gbxTurnos.Visible := (rgHorario.ItemIndex = 0);
end;

procedure TfrmRegAcesso.cbxToleranciaClick(Sender: TObject);
begin
  gbxMin.Visible := cbxTolerancia.Checked;
end;

procedure TfrmRegAcesso.bbtnOKtecladoClick(Sender: TObject);
begin
  memDocumento.Text := Trim(edDocumento.Text);
end;

procedure TfrmRegAcesso.bbtnCancTecladoClick(Sender: TObject);
begin
  ExecFocus;
end;

procedure TfrmRegAcesso.btnFecharTelaConfigClick(Sender: TObject);
var
  sMsg, sTexto: string;
begin
  Self.Enabled := true;
  townTelaConfig.Visible := false;
  ExecFocus(false);

  FLog.Add('>> INICIO <<');
  FLog.Add('VERSÃO: ' +Sistema.Versao);
  FLog.Add('[' +TimeToStr(Time)+ '] - Abrindo porta ' +UpperCase(Modulo.PortaCatraca)+ '...');

  FObjPorta.DeviceName := UpperCase(Modulo.PortaCatraca);
  FObjPorta.Open;

  // Liberar buffer
  sMsg := GeraPolling('b', '');
  FLog.Add('[' +TimeToStr(Time)+ '] - Porta ' +UpperCase(Modulo.PortaCatraca)+ ' aberta.');

  // Envia as configurações iniciais
  FLog.Add('>> ENVIO <<');
  FLog.Add('[' +TimeToStr(Time)+ '] - Enviando configurações iniciais para o leitor...');
  sMsg := GeraPolling('c', '00');
  FLog.Add('[' +TimeToStr(Time)+ '] - Configurações iniciais enviadas.');
  FLog.Add('Conteúdo: ' + CodAscii(sMsg));

  // Enviar a configuração de parâmetros diversos
  FLog.Add('>> ENVIO <<');
  FLog.Add('[' +TimeToStr(Time)+ '] - Enviando configurações diversas para o leitor...');
  sTexto :=
    #0 + // Tipo de Liberação Local da Entrada (Liberar Todos os Cartões)
    #0 + // Tipo de Liberação Local da Saída (Liberar Todos os Cartões)
    #0 + // Desabilitar Consulta por Senha
    #0 + // Desabilitar Consulta por Cartão Mestre
    #0 + // Entrar em Modo de Liberação Local, no Caso de Falha de Comunicação
    #0 + // Lista Local de Permissões
    #0 + // Número Exato de Dígitos do Cartão (00 - Aceita Qualquer Cartão)
    #0;  // Tipo de Leitor (Utilizar Sempre 00)
  sMsg := GeraPolling('v', sTexto);
  FLog.Add('[' +TimeToStr(Time)+ '] - Configurações diversas enviadas.');
  FLog.Add('Conteúdo: ' + CodAscii(sMsg));

  Sleep(300);

  // Envia a data
  FLog.Add('>> ENVIO <<');
  FLog.Add('[' +TimeToStr(Time)+ '] - Enviando data e hora para o leitor...');
  sMsg := Enviar_DataHora;
  FLog.Add('[' +TimeToStr(Time)+ '] - Data e hora enviados.');
  FLog.Add('Conteúdo: ' + CodAscii(sMsg));

  // Envia a mensagem padrão
  FLog.Add('>> ENVIO <<');
  FLog.Add('[' +TimeToStr(Time)+ '] - Enviando mensagem padrão para o leitor...');
  sMsg := GeraPolling('p', #0 + Copy(edMensagemPadrao.Text +'                 ', 1, 16));
  FLog.Add('[' +TimeToStr(Time)+ '] - Mensagem padrão enviada.');
  FLog.Add('Conteúdo: ' + CodAscii(sMsg));

  FUlt_Result_Comando := 'j';

  tmInterrogacao.Enabled := true;
end;

procedure TfrmRegAcesso.bbtnOkClick(Sender: TObject);
begin
  ExecFocus;
end;

procedure TfrmRegAcesso.bbtnRejeitarClick(Sender: TObject);
begin
  ExecFocus;
end;

procedure TfrmRegAcesso.bbtnSairClick(Sender: TObject);
begin
  Close;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmRegAcesso.MontarTelaInicial;
begin
  frmPrincipal.sbtnTeclado.Visible := false;
  frmPrincipal.sbtnTecladoMatric.Visible := false;

  lblMensagem2.Caption := CMTranslate('Aguardando Identificação');

  rgPontoAcesso.ItemIndex := FU.IFF(Modulo.TipoEstacao = 'P', 0, 1);
  rgPontoAcesso.Enabled := (rgPontoAcesso.ItemIndex = 0);
end;

procedure TfrmRegAcesso.LimparTela;
begin
  memDocumento.Text := '';
  edDocumento.Text := '';
  lblMensagem.Caption := '';
  imgPessoa.Visible := false;
  lblNome.Caption := '';
  lblMatricula.Caption := '';
  lblCCusto.Caption := '';
  lblCargo.Caption := '';
  lblHorarioTrab.Caption := '';
  lblMensagem2.Visible := true;
  HabilitarBotoes(false);
  CdsHorario.Data := CtrlAssociaHorario.ListTurnoDiaSel(-1);
end;

procedure TfrmRegAcesso.ExecFocus(const ExecLimparTela: boolean);
begin
  if (ExecLimparTela) then
    LimparTela;

  memDocumento.SetFocus;
end;

procedure TfrmRegAcesso.SelPessoa;
var
  bSalvaTimer: boolean;
  sComplemento: string;
  iPermitidos, iUsados: integer;

{-->}procedure FinalizarFuncao(const MsgErro: string);
     begin
       CdsHorario.First;
       CdsHorario.EnableControls;
       lblMensagem2.Visible := false;
       pnlTeclado.Visible := false;

       if (Modulo.IndLiberacao = AUTOM_COM_CATRACA) then
       begin
         Self.Update;
         Sleep(spedTempo.Value);

         if (MsgErro <> '') then
           bbtnRejeitarClick(Self)
         else
           bbtnOkClick(Self);
       end
       else
       if (Modulo.IndLiberacao = AUTOM_SEM_CATRACA) then
       begin
         Self.Update;
         sleep(spedTempo.Value);
         bbtnOkClick(Self);
       end
       else
         HabilitarBotoes(true);

       if (Round(Modulo.IndLiberacao) in [ASSIST_SEM_CATRACA, ASSIST_COM_CATRACA]) then
         MsgDlg(MsgErro, CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0)
       else
       begin
         lblMensagem.Font.Color := clRed;
         lblMensagem.Caption := sMensagem;
         Self.Update;
         Sleep(spedTempo.Value);
         bbtnRejeitarClick(Self);
       end;
{-->}end;

begin
  if (Trim(memDocumento.Text) = '') then
    exit;

  bSalvaTimer := tmInterrogacao.Enabled;
  tmInterrogacao.Enabled := false;

  sComplemento := '';
  sMensagem := '';
  iPermitidos := 0;
  iUsados := 0;

  try
    if (ProcurarPessoa) then
    begin
      // Obter o Centro de Custo da Pessoa
      CdsAux.Data := CtrlListTerceirosRH.ListCCusto(FloatToStr(dIdEmpresa), sCodCentroCusto);
      lblCCusto.Caption := CdsAux.FieldByName('NOME').asString;

      // Obter o Cargo da Pessoa
      CdsAux.Data := CtrlCargo.ListCargo(dIdCargo);
      lblCargo.Caption := CdsAux.FieldByName('TITULO').asString;

      CdsHorario.DisableControls;
    end;

    FinalizarFuncao(sMensagem);
  except
    on E: Exception do
      FinalizarFuncao(E.Message);
  end;

  tmInterrogacao.Enabled := bSalvaTimer;
  memDocumento.Text := '';
end;

function TfrmRegAcesso.ProcurarPessoa: boolean;
begin
  sNumDocumento := Trim(Copy(memDocumento.Text, iColDocumento, iTamDocumento));
  if (dIdDocumento > 0) then
    dIdPessoa := CtrlListTerceirosRH.GetPessoa_Documento(sNumDocumento, dIdDocumento)
  else
    dIdPessoa := CtrlPessoaFuncionario.GetMatriculaJaExiste(sNumDocumento,Sistema.IdEmpresa);

  CdsFunc.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(dIdPessoa,
    '  P.NOME, F.MATRICULA, F.IDCARGO, F.CODCENTROCUSTO, F.IDEMPRESA,' +CR_LF+
    '  P.IDIMAGEM, F.IDHORARIO, F.FLGMARCAINTERVALO, TIPOSIT');

  Result := not(CdsFunc.IsEmpty);
  if (Result) then
  begin
    // Obter a Foto da Pessoa
    CdsImg.Data := CtrlListTerceirosRH.ListImagem(CdsFunc.FieldByName('IDIMAGEM').asFloat);
    imgPessoa.Visible := not(CdsImg.IsEmpty) and not(CdsFunc.FieldByName('IDIMAGEM').IsNull);

    // Preencher os campo da tela
    lblNome.Caption := CdsFunc.FieldByName('NOME').asString;
    lblMatricula.Caption := CMTranslate('Matrícula: ')+ CdsFunc.FieldByName('MATRICULA').asString;

    sCodCentroCusto := CdsFunc.FieldByName('CODCENTROCUSTO').asString;
    dIdEmpresa := CdsFunc.FieldByName('IDEMPRESA').asFloat;
    dIdCargo := CdsFunc.FieldByName('IDCARGO').asFloat;

    // Preencher o horário da pessoa
    CdsHorarioVariavel.Data := CtrlHorarioVariavel.ListHorarioVariavel(
      dIdPessoa, DateToStr(Date), DateToStr(Date));

    if (CdsHorarioVariavel.IsEmpty) then
      CdsAux.Data := CtrlHoraTrab.ListHoraTrab(CdsFunc.FieldByName('IDHORARIO').asInteger)
    else
      CdsAux.Data := CtrlHoraTrab.ListHoraTrab(CdsHorarioVariavel.FieldByName('IDHORARIO').asInteger);

    lblHorarioTrab.Caption := CMTranslate('Horário: ') + CdsAux.FieldByName('NOMEHORARIO').asString;
    CdsHorario.Data := CtrlAssociaHorario.ListTurnoDiaSel(CdsAux.FieldByName('IDHORARIO').asInteger);
  end;
end;

procedure TfrmRegAcesso.HabilitarBotoes(const Habilita: boolean);
begin
  bbtnOk.Enabled := Habilita;
  bbtnRejeitar.Enabled := Habilita;
end;

procedure TfrmRegAcesso.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  //rgEntraSai.ItemIndex := StrToInt(ArqConfig.ReadString('ESTACESSO', 'EntraSai', '0'));
  rgHorario.ItemIndex := StrToInt(ArqConfig.ReadString('ESTACESSO', 'ChecaHora', '0'));
  mkedInicio1.Text := ArqConfig.ReadString('RELACESSO', 'Inicio1', '00:00');
  mkedInicio2.Text := ArqConfig.ReadString('RELACESSO', 'Inicio2', '00:00');
  mkedInicio3.Text := ArqConfig.ReadString('RELACESSO', 'Inicio3', '00:00');
  mkedFinal1.Text := ArqConfig.ReadString('RELACESSO', 'Final1', '00:00');
  mkedFinal2.Text := ArqConfig.ReadString('RELACESSO', 'Final2', '00:00');
  mkedFinal3.Text := ArqConfig.ReadString('RELACESSO', 'Final3', '00:00');
  edNome1.Text := ArqConfig.ReadString('RELACESSO', 'Nome1', ' ');
  edNome2.Text := ArqConfig.ReadString('RELACESSO', 'Nome2', ' ');
  edNome3.Text := ArqConfig.ReadString('RELACESSO', 'Nome3', ' ');
  cmbVeloc.ItemIndex := StrToInt(ArqConfig.ReadString('ESTACESSO', 'Velocidade', '0'));
  cmbBitDado.ItemIndex := StrToInt(ArqConfig.ReadString('ESTACESSO', 'BitDado', '0'));
  cmbFluxo.ItemIndex := StrToInt(ArqConfig.ReadString('ESTACESSO', 'Fluxo', '0'));
  cmbParidade.ItemIndex := StrToInt(ArqConfig.ReadString('ESTACESSO', 'Paridade', '0'));
  cmbBitParada.ItemIndex := StrToInt(ArqConfig.ReadString('ESTACESSO', 'BitParada', '0'));
  cmbAcionamento.ItemIndex := StrToInt(ArqConfig.ReadString('ESTACESSO', 'Acionamento', '0'));
  edMensagemPadrao.Text := ArqConfig.ReadString('ESTACESSO', 'MensagemPadrao', ' ');
  spedTempo.Value := StrToInt(ArqConfig.ReadString('ESTACESSO', 'TempoEspera', '2000'));
  spedMin.Value := StrToInt(ArqConfig.ReadString('ESTACESSO', 'TempoTolerancia', '0'));
  cbxTolerancia.Checked := StrToBool(ArqConfig.ReadString('ESTACESSO', 'ChecaTolerancia', 'True'));
end;

procedure TfrmRegAcesso.GravaAlteracoes;
begin
  // Grava as últimas alterações das Opções
  //ArqConfig.WriteString('ESTACESSO', 'EntraSai', IntToStr(rgEntraSai.ItemIndex));
  ArqConfig.WriteString('ESTACESSO', 'ChecaHora', IntToStr(rgHorario.ItemIndex));
  ArqConfig.WriteString('RELACESSO', 'Inicio1', mkedInicio1.Text);
  ArqConfig.WriteString('RELACESSO', 'Inicio2', mkedInicio2.Text);
  ArqConfig.WriteString('RELACESSO', 'Inicio3', mkedInicio3.Text);
  ArqConfig.WriteString('RELACESSO', 'Final1', mkedFinal1.Text);
  ArqConfig.WriteString('RELACESSO', 'Final2', mkedFinal2.Text);
  ArqConfig.WriteString('RELACESSO', 'Final3', mkedFinal3.Text);
  ArqConfig.WriteString('RELACESSO', 'Nome1', edNome1.Text);
  ArqConfig.WriteString('RELACESSO', 'Nome2', edNome2.Text);
  ArqConfig.WriteString('RELACESSO', 'Nome3', edNome3.Text);
  ArqConfig.WriteString('ESTACESSO', 'Velocidade', IntToStr(cmbVeloc.ItemIndex));
  ArqConfig.WriteString('ESTACESSO', 'BitDado', IntToStr(cmbBitDado.ItemIndex));
  ArqConfig.WriteString('ESTACESSO', 'Fluxo', IntToStr(cmbFluxo.ItemIndex));
  ArqConfig.WriteString('ESTACESSO', 'Paridade', IntToStr(cmbParidade.ItemIndex));
  ArqConfig.WriteString('ESTACESSO', 'BitParada', IntToStr(cmbBitParada.ItemIndex));
  ArqConfig.WriteString('ESTACESSO', 'Acionamento', IntToStr(cmbAcionamento.ItemIndex));
  ArqConfig.WriteString('ESTACESSO', 'MensagemPadrao', edMensagemPadrao.Text);
  ArqConfig.WriteString('ESTACESSO', 'TempoEspera', IntToStr(spedTempo.Value));
  ArqConfig.WriteString('ESTACESSO', 'TempoTolerancia', IntToStr(spedMin.Value));
  ArqConfig.WriteString('ESTACESSO', 'ChecaTolerancia', BoolToStr(cbxTolerancia.Checked,True));
end;

function TfrmRegAcesso.CodAscii(const Msg: string): string;
var
  c: integer;
begin
  Result := '';
  for c:=0 to Length(Msg)-1 do
    Result := Result + '#'+IntToStr(Ord(Msg[c]));
end;

function TfrmRegAcesso.DecToBCD(sValorDec: string):string;
var
  Aux1, Aux2, Aux3: integer;
  sDig1, sDig2: string;
  pAux1, pAux2: String;
begin
  result := '';
  pAux2 := '0';
  try
    Aux1 := StrToInt(sValorDec);
    Aux2 := Aux1 mod 16;
    sDig2 := lowercase(IntToHex(Aux2,1));
    Aux3 := (Aux1 - Aux2) div 16;
    sDig1 := lowercase(IntToHex(Aux3,1));
    pAux1 := (sDig1+sDig2);
    {Aux1 := }HexToBinECF(pAux1, pAux2, 1);
    Result := (pAux2);
  except
    result := '';
  end;
end;

function TfrmRegAcesso.BCDToDec(sValorBCD: string): string;
var
  iDig1,
    iDig2: integer;
begin
  Result := '';
  try
    iDig1 := StrToInt(copy(sValorBCD, 1, 1));
    iDig2 := StrToInt(Copy(sValorBCD, 2, 1));

    Result := IntToStr((iDig1 * 16) + iDig2);
  except
    Result := '';
  end;
end;

function TfrmRegAcesso.HexToBinECF(Text: String; var Buffer: String; BufSize: Integer): Integer;
const
  Convert: array['0'..'f'] of SmallInt =
    ( 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,-1,-1,-1,-1,-1,-1,
     -1,10,11,12,13,14,15,-1,-1,-1,-1,-1,-1,-1,-1,-1,
     -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
     -1,10,11,12,13,14,15);
var
  I: Integer;
begin
  I := BufSize;
  while I > 0 do
  begin
    if not (Text[1] in ['0'..'f']) or not (Text[2] in ['0'..'f']) then Break;
    Buffer[1] := Char((Convert[Text[1]] shl 4) + Convert[Text[2]]);
    Dec(I);
  end;
  Result := BufSize - I;
end;


function TfrmRegAcesso.CheckSumRodbel(Endereco,Funcao,Tamanho:byte; Texto: string): string;
var
  iCheck, c: integer;
  bCheck: byte;
begin
  iCheck := Endereco xor Funcao;
  iCheck := iCheck xor Tamanho;
  for c:=1 to length(Texto) do
    iCheck := iCheck xor ord(Texto[c]);

  bCheck := iCheck and ord(Chr($7F));
  Result := Chr(bCheck);
end;

function TfrmRegAcesso.Enviar_DataHora: string;
var
  sTexto: string;
  wDia, wMes, wAno, wHora, wMin, wSec, wMSec: word;
  iDia1, iDia2, iMes1, iMes2, iAno1, iAno2, iAnoB,
  iHor1, iHor2, iMin1, iMin2, iSeg1, iSeg2: integer;
begin
  DecodeDate(Date, wAno, wMes, wDia);
  DecodeTime(Time, wHora, wMin, wSec, wMSec);

  wAno := wAno - 2000;
  iAnoB := wAno - Trunc(wAno / 4) * 4;

  iDia1 := Trunc(wDia / 10);
  iDia2 := wDia - iDia1 * 10;

  iMes1 := Trunc(wMes / 10);
  iMes2 := wMes - iMes1 * 10;

  iAno1 := Trunc(wAno / 10);
  iAno2 := wAno - iAno1 * 10;

  iHor1 := Trunc(wHora / 10);
  iHor2 := wHora - iHor1 * 10;

  iMin1 := Trunc(wMin / 10);
  iMin2 := wMin - iMin1 * 10;

  iSeg1 := Trunc(wSec / 10);
  iSeg2 := wSec - iSeg1 * 10;

  sTexto :=
    DecToBCD(IntToStr(iDia1 * 16 + iDia2)) +
    DecToBCD(IntToStr(iMes1 * 16 + iMes2)) +
    DecToBCD(IntToStr(iAno1 * 16 + iAno2)) +
    DecToBCD(IntToStr(DayOfWeek(Date) * 16 + iAnoB))+
    DecToBCD(IntToStr(iHor1 * 16 + iHor2)) +
    DecToBCD(IntToStr(iMin1 * 16 + iMin2)) +
    DecToBCD(IntToStr(iSeg1 * 16 + iSeg2));
  Result := GeraPolling('d', sTexto);
end;

function TfrmRegAcesso.GeraPolling(cAcao: Char; cDados: String): string;
var
  sMsg, Dados: string;
  Funcao, Tamanho: byte;
begin
  try
    case cAcao of
      'b' : // Limpa Buffer
      begin
        Funcao := 11;
        Tamanho := 0;
        Dados := '';
      end;
      'c' : // Configuração Inicial
      begin
        Funcao := 7;
        Tamanho := 1;
        Dados := DecToBCD(cDados);
      end;
      'v' : // Configurações Diversas
      begin
        Funcao := 7;
        Tamanho := 1;
        Dados := #1;//DecToBCD(cDados);
      end;
      'd' : // Data e Hora
      begin
        Funcao := 5;
        Tamanho := 7;
        Dados := cDados;
      end;
      'i', 'l' : // Impede/Libera
      begin
        Funcao := 18;
        Tamanho := $1;
        if cAcao = 'i' then
          Dados := String(Chr($0))
        else
          Dados := String(Chr($1));
      end;
      'j' : // Telegrama Tipo J
      begin
        Funcao := 14;
        Tamanho := 0;
        Dados := '';
      end;
      'k' : // Telegrama Tipo K
      begin
        Funcao := 15;
        Tamanho := 0;
        Dados := '';
      end;
      's' : // Status
      begin
        Funcao := 31;
        Tamanho := 0;
        Dados := '';
      end;
      'm' : // Mensagem
      begin
        Funcao := 17;
        Tamanho := 16;
        Dados := cDados;
      end;
      'p' : // Mensagem padrao
      begin
        Funcao := 6;
        Tamanho := 17;
        Dados := cDados;
      end;
      else // Mensagem vazia
      begin
        Funcao := 0;
        Tamanho := 0;
        Dados := '';
      end;
    end;

    if (Funcao = 0) then
      exit;

    // Check-Sum
    sCheck := CheckSumRodbel(0, Funcao, Tamanho, Dados);

    sMsg := Chr(0) + Chr(Funcao)+ Chr(Tamanho) + Dados;
    Result := Chr($FE) + sMsg + sCheck + Chr($F0);

    FObjPorta.WriteString(Result);
    FLog.Add('[OK] - Buffer(' +IntToStr(Length(cBuffer))+') = '+ CodAscii(cBuffer)+
      ' Msg(' +cAcao+ ',' +IntToStr(Tamanho)+ ') = ' + CodAscii(Result));
  except
    on E: Exception do
    begin
      Result := '';
      FLog.Add('[ERRO] - Buffer(' +IntToStr(Length(cBuffer))+') = '+ CodAscii(cBuffer)+
        ' Msg(' +cAcao+ ',' +IntToStr(Tamanho)+ ') = ' + CodAscii(Result));
    end;
  end;

  cBuffer := Recepcao;
end;

Function TfrmRegAcesso.MoveRegistro(Str: string): boolean;
var
  cAux: string;
  nVl1, nVl2, nVl3, a: integer;
begin
  cAux := '';
  for a:=2 to 18 do
  begin
    nVl1 := Ord(Copy(Str,a,1)[1]);
    if (nVl1 < 16) then
    begin
      cAux := cAux + FormatFloat('00', nVl1);
      if (a <> 3) and (a <> 4) then
      begin
        if (nVl1 > 9) then
        begin
          MoveRegistro := False;
          exit;
        end;
      end;
    end
    else
    begin
      nVl2 := Round(nVl1 / 16);
      nVl3 := (nVl1 Mod 16);
      if (a <> 3) and (a <> 4) then
      begin
        if (nVl2 > 9) Or (nVl3 > 9) then
        begin
          MoveRegistro := False;
          exit;
        end;
      end;
      cAux := cAux + FormatFloat('0', nVl2) + FormatFloat('0', nVl3);
    end;
  end;

  sEndereco := Copy(cAux, 1, 2);
  sCartao := Copy(cAux, 7, 16);
  sStatus := Copy(cAux, 33, 2);

  Result := true;
end;

function TfrmRegAcesso.Recepcao: string;
var
  c: char;
  sAux: string;
begin
  sAux := '';
  while (FObjPorta.InputCount <> 0) do
  begin
    c := FObjPorta.ReadChar;
    sAux := sAux + string(c);
  end;
  Result := sAux;
end;

procedure TfrmRegAcesso.Interrogacao;
begin
  // Função de transmissão da mensagem
  GeraPolling(FUlt_Result_Comando, '');
  FLog.Add('[' +TimeToStr(Time)+ ']');

  // Verificação da resposta
  if (cBuffer <> '') then
  begin
    if (Pos(Chr(254), cBuffer) > 0) then
    begin
      if (Length(Trim(cBuffer)) > 10) then  // trouxe dados
        FLog.Add('Tamanho: ' +IntToStr(Length(cBuffer))+' - Conteúdo: '+ CodAscii(cBuffer));

      if (Length(Trim(cBuffer)) = 20) and (MoveRegistro(Trim(cBuffer))) then // Trouxe dados
      begin
        // Resposta ok, nao vazia
        FUlt_Result_Comando := 'k';
        FLog.Add('Passou Crachá '+ sCartao);
        GeraPolling('l', '');

        GeraPolling('m', 'Seja bem-vindo');

        GeraPolling('i','');

        GeraPolling('m', edMensagemPadrao.Text);
        memDocumento.Text := sCartao;
      end
      else
      begin   //Resposta ok, vazia
        FUlt_Result_Comando := 'j';
        //EditCarteirinha.Text := 'Aguardo Passagem';
        GeraPolling('m', edMensagemPadrao.Text);
      end;
    end
    else
    begin
      // Erro na resposta
      FUlt_Result_Comando := 'j';
      FLog.Add('Erro na resposta');
    end;
  end
  else
  begin
    // não há resposta
    FUlt_Result_Comando := 'j';
    GeraPolling('p', edMensagemPadrao.Text);
  end;
end;

end.
