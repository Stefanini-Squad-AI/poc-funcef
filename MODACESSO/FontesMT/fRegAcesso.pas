unit fRegAcesso;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, IvDictio, IvMulti, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, DB, DBClient,
  uCMClientDataSet, Wwdatsrc, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, fcLabel, TB97Tlwn,
  Mask, wwdbedit, Wwdotdot, Wwdbcomb, Spin, fConfigRegAcesso,
  uBiometria, uCtrlCargo, uCtrlListTerceirosRH, uCtrlPessoaFuncionario, uCtrlGlobalRH,
  uCtrlHoraTrab, uCtrlAssociaHorario, uCtrlRegAcessoFunc, uCtrlHorarioVariavel,
  uCtrlModeloAcesso, uCtrlModeloAcesso_Inner, uCtrlModeloAcesso_Rodbel,
  uCtrlModeloAcesso_Passo, IvEMulti;

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
    CdsHorarioVariavel: TCMClientDataSet;
    CdsFuncionario: TCMClientDataSet;
    CdsFunc: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    tmMostraConfig: TTimer;
    TimerVerificaDocumento: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnRejeitarClick(Sender: TObject);
    procedure tmHoraAtualTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure memDocumentoChange(Sender: TObject);
    procedure bbtnCancTecladoClick(Sender: TObject);
    procedure bbtnOKtecladoClick(Sender: TObject);
    procedure tmInterrogacaoTimer(Sender: TObject);
    procedure tmMostraConfigTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerVerificaDocumentoTimer(Sender: TObject);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlCargo: TCtrlCargo;
    CtrlHoraTrab: TCtrlHoraTrab;
    CtrlAssociaHorario: TCtrlAssociaHorario;
    CtrlRegAcessoFunc: TCtrlRegAcessoFunc;
    CtrlHorarioVariavel: TCtrlHorarioVariavel;

    ModeloAcesso: TCtrlModeloAcesso;

    Config: TfrmConfigRegAcesso;

    UltimoDigito: TDateTime;
    Log: TStringList;

    dIdPessoa: double;
    dIdEmpresa: double;
    dIdCargo: double;

    sCodCentroCusto: string;
    sNumDocumento: string;
    sModelo: string;

    bExecTimerInterrogacao: boolean;

    iSaldoAcessos: integer;

    bMsg_Aviso_Momentanea: boolean;
    sMsg_Aviso: string;
    Msg_Aviso_Cor: TColor;

    // Indicador da passagem, sendo:
    // 1º Caractere corresponde à situação da passagem.
    //    Abaixo encontra-se a Lista de Valores Permitidos:
    //    0=Normal;
    //    1=Forçada;
    //    2=Rejeitada;
    // 2º Caractere corresponde ao motivo da situação da passagem.
    //    Abaixo encontra-se a Lista de Valores Permitidos:
    //    0=Normal;
    //    1=Sit. Funcional;
    //    2=Dia de Trabalho;
    //    3=Horário Pessoa;
    //    4=Horário Estação;
    //    5=Quant. Acessos;
    //    6=Férias;
    sIndPassagem: string[2];

    FormaOperacao: TFormaOperacao;

    function  CriarObjAcesso_Passo: string;
    function  CriarObjAcesso_Rodbel: string;
    function  CriarObjAcesso_Inner: string;
    function  CriarObjAcesso: boolean;
    procedure LiberarObjAcesso;

    procedure IniciarObjAcesso;

    procedure AddLog(const Valor: string);

    function GetModeloCatraca(const Modelo: string): string;
    function GetTipoLiberacao: string;

    procedure SetIndPassagem(const Situacao, MotivoSituacao: char);

    procedure AguardaTempo;
    procedure Procurar_Acesso_Anterior;
    procedure Mostrar_Mensagem_Acesso;
    procedure Travar_Dispositivo;
    procedure Destravar_Dispositivo;
    procedure SelPessoa;
    function  ProcurarPessoa: boolean;
    procedure ReiniciarTimer;
    procedure HabilitarBotoes(const Habilita: boolean);
    procedure ExecFocus(const ExecLimparTela: boolean = true);

    procedure Msg_Aviso(Cor: TColor; const Msg, OpcaoConfirma: string);

    //procedure Enviar_Mensagem_Acesso_Nao_Concluido;
    procedure Mensagem_Libera_Acesso;
    procedure Mensagem_Acesso_Dia_Folga;
    procedure Mostrar_Mensagem_Sem_Horario;
    procedure Mensagem_Cracha_Invalido;

    function Verificar_Horario_Bloqueado: boolean;
    function Verificar_Sentido_Invalido: boolean;
    function Verificar_Acessos_Excedidos(var Complemento: string): boolean;
    function Verificar_Acessos_Fora_de_Hora: boolean;
    function Verificar_Pessoa_Desligada: boolean;
    function Verificar_Pessoa_Afastada: boolean;
    function Verificar_Pessoa_Ferias: boolean;

    procedure MontarTelaInicial;

    // Biometria
    function  InitLeituraBiometrica: string;
    procedure LeituraBiometrica;
  public
    iColDocumento: integer;
    iTamDocumento: integer;
    iIndIdentificacao: integer;

    dIdDocumento: double;

    procedure Limpar_memDocumento;
    procedure LimparTela;
    procedure IniciarConfig;
  end;

var
  frmRegAcesso: TfrmRegAcesso;

implementation

uses  uSistema, uMensErro, uCtrlPadroes, uModulo, uCtrlFuncoesRH, uCtrlUsoGeralRH,
  uBiometriaTypes, fPrincipal, dCds, uCmCustomCdbObject;

const
  // Indicador da passagem, sendo:
  // Valores da situação da passagem:
  IND_PASSAGEM_NORMAL = '0';
  IND_PASSAGEM_FORCADA = '1';
  IND_PASSAGEM_REJEITADA = '2';
  // Valores do motivo da situação da passagem:
  IND_MOTIVO_PASSAGEM_NORMAL = '0';
  IND_MOTIVO_PASSAGEM_SIT_FUNC = '1';
  IND_MOTIVO_PASSAGEM_DIA_TRAB = '2';
  IND_MOTIVO_PASSAGEM_HORARIO = '3';
  IND_MOTIVO_PASSAGEM_HORA_ESTACAO = '4';
  IND_MOTIVO_PASSAGEM_QUANT_ACESSOS = '5';
  IND_MOTIVO_PASSAGEM_FERIAS = '6';

  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_SALDO = ' Saldo :1.';
  MSG_SALDO_AUTOM = ' Saldo Antes de Passar :1.';
  MSG_ACESSOS_PERM = 'Acessos Permitidos (:1) Excedidos.';
  MSG_CRACHA_NAO_REC = 'Crachá ":1" não reconhecido.';

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

  if not(CriarObjAcesso) then
  begin
    Close;
    exit;
  end;

  MontarTelaInicial;
  LimparTela;

  // Carregar Form de Configuração
  Config := TfrmConfigRegAcesso.Create(Application);
  Config.ExecIniciarConfig := IniciarConfig;
  Config.ModeloCatraca := sModelo;

  ultimoDigito := Now;
end;

procedure TfrmRegAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  inherited;
end;

procedure TfrmRegAcesso.FormDestroy(Sender: TObject);
begin
  // Desligar os Timers
  tmInterrogacao.Enabled := false;
  tmHoraAtual.Enabled := false;

  // Liberar os recursos da classe de acesso ao leitor instanciada
  LiberarObjAcesso;

  // Liberar Form de Configuração
  FreeAndNil(Config);

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
  inherited;
end;

procedure TfrmRegAcesso.FormShow(Sender: TObject);
begin
  // Inicializar o Label que mostra a Hora Atual
  lblHora.Caption := TimeToStr(Time);
  tmHoraAtual.Enabled := true;
  inherited;
  tmMostraConfig.Enabled := true;
end;

procedure TfrmRegAcesso.tmMostraConfigTimer(Sender: TObject);
begin
  inherited;
  tmMostraConfig.Enabled := false;
  // Visualizar a tela de configuração
  Config.ShowModal;
end;

procedure TfrmRegAcesso.tmHoraAtualTimer(Sender: TObject);
begin
  lblHora.Caption := TimeToStr(Time);
  lblHora.Update;
end;

procedure TfrmRegAcesso.tmInterrogacaoTimer(Sender: TObject);
begin
  tmInterrogacao.Enabled := false;

  if (iIndIdentificacao = IDENTIF_BIOMETRICA) then
    LeituraBiometrica
  else
  if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
    memDocumento.Text := ModeloAcesso.Interrogacao;

  // Acionar o temporizador somente para as opções necessárias
  // Opção Assistida não pode habilitar o Timer agora
//  tmInterrogacao.Enabled :=
//    (Modulo.IndLiberacao in [AUTOM_COM_CATRACA, AUTOM_SEM_CATRACA]) or
//    (iIndIdentificacao = IDENTIF_BIOMETRICA);
  tmInterrogacao.Enabled := bExecTimerInterrogacao;
end;

procedure TfrmRegAcesso.memDocumentoChange(Sender: TObject);
begin
  UltimoDigito := Now;
  if (Length(memDocumento.Text) >= (iColDocumento + iTamDocumento - 1)) then
    SelPessoa;
end;

procedure TfrmRegAcesso.bbtnOKtecladoClick(Sender: TObject);
begin
  memDocumento.Text := Trim(edDocumento.Text);
end;

procedure TfrmRegAcesso.bbtnCancTecladoClick(Sender: TObject);
begin
  ExecFocus;
end;

procedure TfrmRegAcesso.bbtnOkClick(Sender: TObject);
var
  dDataAcesso: TDateTime;
  //sCracha: string;

{->}procedure AddLogGravacao(const Processo: string);
    begin
      AddLog(
       fu.CMTranslate('GRAVAÇÃO')+CR_LF+
       fu.CMTranslate('  Acesso: ') +Processo+CR_LF+
       fu.CMTranslate('  Data: ') +FormatDateTime('dd/mm/yyyy - hh:nn:ss', dDataAcesso)+CR_LF+
       fu.CMTranslate('  Matrícula: ') +CdsFunc.FieldByName('MATRICULA').asString+CR_LF+
       fu.CMTranslate('  Estação: ') +FloatToStr(Modulo.IdEstacaoEcesso)+CR_LF+
       fu.CMTranslate('  Tipo da Estação: ') +
       FU.IFF(Config.rgPontoAcesso.ItemIndex = 0,
       fu.CMTranslate('Ponto'), fu.CMTranslate('Acesso')) + CR_LF+
        fu.CMTranslate('  Indicador de Passagem: ' + sIndPassagem[1] + sIndPassagem[2]));
{->}end;
begin
  if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
  begin
    Mensagem_Libera_Acesso;
{    if (sModelo = RODBEL_RBC_2801) then
    begin
      while (true) do
      begin
        sCracha := ModeloAcesso.Interrogacao;
        if (sCracha <> '') then
        begin
          if (TCtrlModeloAcesso_Rodbel(ModeloAcesso).Status <> RET_ACESSO_CONCLUIDO_ENT) and
             (TCtrlModeloAcesso_Rodbel(ModeloAcesso).Status <> RET_ACESSO_CONCLUIDO_SAI) then
          begin
            TCtrlModeloAcesso_Rodbel(ModeloAcesso).Enviar_Mensagem(
              CMTranslate('Acesso não Concluído.'));
            lblMensagem.Caption := CMTranslate('Acesso não Concluído. Passe o Cartão Novamente.');
            lblMensagem.Font.Color := clRed;
            AddLog(ColorToString(lblMensagem.Font.Color) +' - '+ lblMensagem.Caption);
            Self.Update;
            lblMensagem.Update;
            AguardaTempo;
            exit;
          end
          else
            break;
        end;
      end;
    end;}
  end;

  Procurar_Acesso_Anterior;
  dDataAcesso := Now;

  // Caso seja o primeiro acesso ou a estação permita Somente Entrada, inserir o acesso
  if (CdsAcessoFunc.IsEmpty) or (FormaOperacao = tpoEntrada) then
  begin
    AddLogGravacao(fu.CMTranslate('ENTRADA'));

    if (Modulo.IndLiberacao = AUTOM_SEM_CATRACA) then
      SetIndPassagem(IND_PASSAGEM_FORCADA, #0);

    CdsAcessoFunc.Insert;
    CdsAcessoFunc.FieldByName('IDPESSOA').asFloat := dIdPessoa;
    CdsAcessoFunc.FieldByName('IDESTACAOACESSO').asFloat := Modulo.IdEstacaoEcesso;
    CdsAcessoFunc.FieldByName('INDFUNCAO').asString :=
      FU.IFF(Config.rgPontoAcesso.ItemIndex = 0, 'P', 'A');
    CdsAcessoFunc.FieldByName('ENTRADA').asDateTime := dDataAcesso;
    CdsAcessoFunc.FieldByName('FLGABONADO').asInteger := 0;
    CdsAcessoFunc.FieldByName('INDPASSAGEM').asString := sIndPassagem[1] + sIndPassagem[2];
    // Preencher com 1 o campo QTDEVEZES para marcar o acesso como "já fechado" e
    // portanto, não deve ser utilizado em outras entradas. Isto foi feito porque
    // uma estação que está como só para Entrada pode mudar para Entrada e Saída e
    // caso alguém que tenha feito acesso nesta estação, o sistema pegava o primeiro
    // acesso e marcava-o como saída. O que ele faz agora, é criar um novo registro
    // de entrada.
    if (FormaOperacao = tpoEntrada) then
      CdsAcessoFunc.FieldByName('QTDEVEZES').asInteger := 1
    else
      CdsAcessoFunc.FieldByName('QTDEVEZES').Clear;

    CdsAcessoFunc.Post;
  end
  else // Demais casos, editar o último acesso
  begin
    CdsHorario.Locate('IDDIASEMANA', DayOfWeek(Date), []);
    CdsAcessoFunc.Edit;
    if (Config.rgPontoAcesso.ItemIndex = 0) and
       (CdsHorario.FieldByName('INICIOALMOCO').asString <> '00:00') and
       (CdsHorario.FieldByName('INICIOALMOCO').asString <> '') and
       (CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1) and
       (CdsAcessoFunc.FieldByName('SAIDAINTERVALO').IsNull) then
    begin
      AddLogGravacao(fu.CMTranslate('INÍCIO DO INTERVALO'));
      CdsAcessoFunc.FieldByName('SAIDAINTERVALO').asDateTime := dDataAcesso;
    end
    else
    if (Config.rgPontoAcesso.ItemIndex = 0) and
       (CdsHorario.FieldByName('FINALALMOCO').asString <> '00:00') and
       (CdsHorario.FieldByName('FINALALMOCO').asString <> '') and
       (CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1) and
       (CdsAcessoFunc.FieldByName('RETORNOINTERVALO').IsNull) then
    begin
      AddLogGravacao(fu.CMTranslate('FINAL DO INTERVALO'));
      CdsAcessoFunc.FieldByName('RETORNOINTERVALO').asDateTime := dDataAcesso
    end
    else
    begin
      AddLogGravacao(fu.CMTranslate('SAÍDA'));
      CdsAcessoFunc.FieldByName('SAIDA').asDateTime := dDataAcesso;
    end;

    CdsAcessoFunc.Post;
  end;

  if not(CtrlRegAcessoFunc.GravarAcessoFunc) then
  begin
    dmCds.CmErroDlg.ErrorMesage.Text :=
      fu.CMTranslate('Ocorreu um erro ao tentar gravar o acesso.') +CR_LF+
      fu.CMTranslate('Erro:') +CR_LF+ CtrlRegAcessoFunc.MessageInfo;
    dmCds.CmErroDlg.Execute;
    exit;
  end;

  // Executar o Focus no campo correto e reiniciar o temporizador
  ReiniciarTimer;
end;

procedure TfrmRegAcesso.bbtnRejeitarClick(Sender: TObject);
begin
  AddLog(fu.CMTranslate('Rejeitando Acesso'));
  ReiniciarTimer;
end;

procedure TfrmRegAcesso.bbtnSairClick(Sender: TObject);
begin
  Close;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

function TfrmRegAcesso.CriarObjAcesso_Passo: string;
begin
  ModeloAcesso := TCtrlModeloAcesso_Passo.Create;

  if (ModeloAcesso.CarregarFuncoesDLL) then
    Result := ''
  else
    Result := ModeloAcesso.MessageInfo;
end;

function TfrmRegAcesso.CriarObjAcesso_Rodbel: string;
begin
  ModeloAcesso := TCtrlModeloAcesso_Rodbel.Create;
  Result := '';
end;

function TfrmRegAcesso.CriarObjAcesso_Inner: string;
begin
  ModeloAcesso := TCtrlModeloAcesso_Inner.Create;

  if (ModeloAcesso.CarregarFuncoesDLL) then
  begin
    TCtrlModeloAcesso_Inner(ModeloAcesso).NumInner := 1;
    TCtrlModeloAcesso_Inner(ModeloAcesso).TamDocumento := iTamDocumento;
    Result := '';
  end
  else
    Result := ModeloAcesso.MessageInfo;
end;

function TfrmRegAcesso.CriarObjAcesso: boolean;
var
  sMsg: string;
begin
  try
    // Obter se a estação permite Somente Entrada ou Entrada e Saída
    if (Modulo.IndEntraSai = 0) then
      FormaOperacao := tpoEntradaSaida
    else
      FormaOperacao := tpoEntrada;

    sModelo := GetModeloCatraca(Modulo.ModeloCatraca); // Obter o modelo de entrada de dados

    iIndIdentificacao := Modulo.IndIdentificacao;
    case (iIndIdentificacao) of
      IDENTIF_BIOMETRICA         : sMsg := InitLeituraBiometrica;
      IDENTIF_LEITOR_COM_CATRACA :
      begin
        if (sModelo = PASSO_CA1M) then
          sMsg := CriarObjAcesso_Passo
        else
        if (sModelo = RODBEL_RBC_2801) then
          sMsg := CriarObjAcesso_Rodbel
        else
        if (sModelo = TOPDATA_INNER) then
          sMsg := CriarObjAcesso_Inner
        else
          sMsg := '';
      end
      else
        sMsg := '';
    end;

    if Assigned(ModeloAcesso) then
    begin
      ModeloAcesso.ColDocumento := iColDocumento;
      ModeloAcesso.TamDocumento := iTamDocumento;
    end
    else
      Log := TStringList.Create;

    AddLog(fu.CMTranslate('Tipo de Liberação: ')+ GetTipoLiberacao);

    Result := (sMsg = '');
  except
    Result := false;
  end;

  if not(Result) then
  begin
    dmCds.CmErroDlg.ErrorMesage.Text := sMsg;
    dmCds.CmErroDlg.Execute;
  end;
end;

procedure TfrmRegAcesso.LiberarObjAcesso;
begin
  if (Assigned(ModeloAcesso)) then
  begin
    ModeloAcesso.Finalizar_Dispositivo;
    ModeloAcesso.LiberarFuncoesDLL;

    // Salvar Log
    if (Config.cmbGerarLog.ItemIndex > 0) then
      ModeloAcesso.Log.SaveToFile(ExtractFilePath(Application.ExeName) + '\RegAcesso.log');
  //    ModeloAcesso.Log.SaveToFile(FU.DirTempLog + '\RegAcesso.log');

    ModeloAcesso.Free;
  end
  else
  if (Config.cmbGerarLog.ItemIndex > 0) then // Salvar Log
  begin
    Log.SaveToFile(ExtractFilePath(Application.ExeName) + '\RegAcesso.log');
    Log.Free;
  end;
end;

procedure TfrmRegAcesso.IniciarConfig;
begin
  ExecFocus(false);

  // Atribuir propriedades do objeto de acesso ao leitor
  IniciarObjAcesso;

  // Acionar o temporizador somente para as opções necessárias
  bExecTimerInterrogacao :=
    (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) or
    (iIndIdentificacao = IDENTIF_BIOMETRICA);
  tmInterrogacao.Enabled := bExecTimerInterrogacao;
end;

procedure TfrmRegAcesso.IniciarObjAcesso;
begin
  if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) and
     ((sModelo = PASSO_CA1M) or (sModelo = RODBEL_RBC_2801) or (sModelo = TOPDATA_INNER)) then
  begin
//    if (sModelo = RODBEL_RBC_2801) then
//      TCtrlModeloAcesso_Rodbel(ModeloAcesso).TipoAcionamento :=
//        Copy(Config.cmbAcionamento.Items[Config.cmbAcionamento.ItemIndex],1,2);

    ModeloAcesso.SetSentidoCatraca(Config.rgSentido1.ItemIndex, Config.rgSentido2.ItemIndex);
    ModeloAcesso.TempoMsg := Config.spedTempo.Value * 1000;
    ModeloAcesso.TempoAcesso := Config.spedTempoCatraca.Value * 1000;
    ModeloAcesso.MensagemPadrao := Config.edMensagemPadrao.Text;
    ModeloAcesso.GerarLog := Config.cmbGerarLog.ItemIndex;
    ModeloAcesso.FormaOperacao := FormaOperacao;
    ModeloAcesso.AddLog(fu.CMTranslate('Versão do Sistema: ') +Sistema.Versao);
    ModeloAcesso.AddLog(fu.CMTranslate('Versão do Padrão: ') +FU.VersaoPadrao(Sistema.NomeDPL, Sistema.VersaoDPL));

    if not(ModeloAcesso.Inicializar(Modulo.PortaCatraca,
           StrToInt(Config.cmbVeloc.Items[Config.cmbVeloc.ItemIndex]))) then
    begin
      dmCds.CmErroDlg.ErrorMesage.Text := ModeloAcesso.MessageInfo;
      dmCds.CmErroDlg.Execute;
      Close;
    end;
  end;
end;

procedure TfrmRegAcesso.AddLog(const Valor: string);
begin
  if Assigned(ModeloAcesso) then
  begin
    ModeloAcesso.AddLog(Valor);
    ModeloAcesso.Log.SaveToFile(ExtractFilePath(Application.ExeName) + '\RegAcesso.log');
  end
  else
    Log.Add(Valor);
end;

function TfrmRegAcesso.GetModeloCatraca(const Modelo: string): string;
begin
  Result := Copy(Modelo,1,4);
end;

function TfrmRegAcesso.GetTipoLiberacao: string;
begin
  case (Round(Modulo.IndLiberacao)) of
    ASSIST_SEM_CATRACA : Result := 'ASSIST_SEM_CATRACA';
    ASSIST_COM_CATRACA : Result := 'ASSIST_COM_CATRACA';
    AUTOM_COM_CATRACA : Result := 'AUTOM_COM_CATRACA';
    AUTOM_SEM_CATRACA : Result := 'AUTOM_SEM_CATRACA';
  end;
end;

procedure TfrmRegAcesso.SetIndPassagem(const Situacao, MotivoSituacao: char);
begin
  sIndPassagem[1] := Situacao;
  if (MotivoSituacao <> #0) then
    sIndPassagem[2] := MotivoSituacao;
end;

procedure TfrmRegAcesso.MontarTelaInicial;
begin
  frmPrincipal.sbtnTeclado.Visible := (iIndIdentificacao <> IDENTIF_TECLADO);
  frmPrincipal.sbtnTecladoMatric.Visible :=
    (iIndIdentificacao <> IDENTIF_TECLADO) and (dIdDocumento > 0);

  if (iIndIdentificacao = IDENTIF_BIOMETRICA) or (sModelo = RODBEL_RBC_2801) then
    lblMensagem2.Caption := fu.CMTranslate('Aguardando Identificação')
  else
  if (iIndIdentificacao in [IDENTIF_LEITOR_SEM_CATRACA, IDENTIF_LEITOR_COM_CATRACA]) then
    lblMensagem2.Caption := fu.CMTranslate('Passe o Cartão')
  else
    lblMensagem2.Caption := '';
end;

procedure TfrmRegAcesso.Limpar_memDocumento;
begin
  memDocumento.OnChange := nil;
  memDocumento.Text := '';
  memDocumento.OnChange := memDocumentoChange;
end;

procedure TfrmRegAcesso.LimparTela;
begin
  Limpar_memDocumento;
  edDocumento.Text := '';
  lblMensagem.Caption := '';
  imgPessoa.Visible := false;
  lblNome.Caption := '';
  lblMatricula.Caption := '';
  lblCCusto.Caption := '';
  lblCargo.Caption := '';
  lblHorarioTrab.Caption := '';
  pnlTeclado.Visible := (iIndIdentificacao = IDENTIF_TECLADO);
  lblMensagem2.Visible := not(iIndIdentificacao = IDENTIF_TECLADO);
  HabilitarBotoes(false);
  CdsHorario.Data := CtrlAssociaHorario.ListTurnoDiaSel(-1);
end;

procedure TfrmRegAcesso.ExecFocus(const ExecLimparTela: boolean);
begin
  if (ExecLimparTela) then
    LimparTela;

  case (iIndIdentificacao) of
    IDENTIF_TECLADO    : edDocumento.SetFocus;
    IDENTIF_BIOMETRICA : tmInterrogacao.Enabled := true;
    else memDocumento.SetFocus;
  end;
end;

procedure TfrmRegAcesso.Msg_Aviso(Cor: TColor; const Msg, OpcaoConfirma: string);
begin
  Msg_Aviso_Cor := Cor;
  if (Round(Modulo.IndLiberacao) in [AUTOM_COM_CATRACA, AUTOM_SEM_CATRACA]) then
  begin
    sMsg_Aviso := Msg;
    AddLog(ColorToString(Cor) +' - '+ Msg);
  end
  else
  begin
    sMsg_Aviso := Msg +' '+ OpcaoConfirma;
    AddLog(ColorToString(Cor) +' - '+ Msg +' - '+ OpcaoConfirma);
  end;
end;

function TfrmRegAcesso.Verificar_Horario_Bloqueado: boolean;
var
  sHora: string;
begin
  Result := false;
  with (Config) do
  begin
    if (cbxVerificaHorario.Checked) then
    begin
      sHora := Copy(TimeToStr(Time),1,5);
      if not(((stgdHorario.Cells[2,1] <> '') and (sHora >= stgdHorario.Cells[0,1]) and (sHora <= stgdHorario.Cells[1,1])) or
             ((stgdHorario.Cells[2,2] <> '') and (sHora >= stgdHorario.Cells[0,2]) and (sHora <= stgdHorario.Cells[1,2])) or
             ((stgdHorario.Cells[2,3] <> '') and (sHora >= stgdHorario.Cells[0,3]) and (sHora <= stgdHorario.Cells[1,3]))) then
      begin
        SetIndPassagem(IND_PASSAGEM_REJEITADA, IND_MOTIVO_PASSAGEM_HORA_ESTACAO);

        if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
          ModeloAcesso.Enviar_Mensagem_Cartao_Bloqueado;

        Msg_Aviso(clRed, fu.CMTranslate('Horário de Operação Bloqueado.'), fu.CMTranslate('Confirma?'));
        bMsg_Aviso_Momentanea :=
          (Modulo.IndLiberacao in [AUTOM_SEM_CATRACA, AUTOM_COM_CATRACA]);
        Result := true;
      end;
    end;
  end;
end;

function TfrmRegAcesso.Verificar_Sentido_Invalido: boolean;
var
  bSentidoValido: boolean;
begin
  Result := false;
  if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
  begin
    case (FormaOperacao) of
      tpoEntradaSaida :
      begin
        Procurar_Acesso_Anterior;

        bSentidoValido :=
          // Caso já exista uma entrada e a pessoa indicou que quer entrar ou sair.
          // Isto caracteriza que a pessoa está saíndo para ou voltando do almoço
          (
            not(CdsAcessoFunc.IsEmpty) and
            (CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1) and
            (
              (
                (ModeloAcesso.SentidoPassagem = tpsEntrada) and
                (CdsAcessoFunc.FieldByName('RETORNOINTERVALO').IsNull) and
                not(CdsAcessoFunc.FieldByName('SAIDAINTERVALO').IsNull)
              ) or
              (
                (ModeloAcesso.SentidoPassagem = tpsSaida) and
                (
                  (CdsAcessoFunc.FieldByName('SAIDAINTERVALO').IsNull) or
                  (
                    not(CdsAcessoFunc.FieldByName('SAIDAINTERVALO').IsNull) and
                    not(CdsAcessoFunc.FieldByName('RETORNOINTERVALO').IsNull)
                  )
                )    
              )
            )
          ) or
          // Caso não exista nenhuma entrada e a pessoa indicou que quer entrar
          (
            (CdsAcessoFunc.IsEmpty) and
            (ModeloAcesso.SentidoPassagem = tpsEntrada)
          ) or
          // Caso já exista uma entrada e a pessoa indicou que quer sair
          (
            not(CdsAcessoFunc.IsEmpty) and
            (CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 0) and
            (ModeloAcesso.SentidoPassagem = tpsSaida)
          );

        if not(bSentidoValido) then
        begin
          ModeloAcesso.Enviar_Mensagem_Sentido_Invalido;
          Msg_Aviso(clRed, fu.CMTranslate('Sentido de Passagem Inválido. Passagem não Permitida'), '');
          bMsg_Aviso_Momentanea := true;
          Result := true;
        end;
      end
      else // tpoEntrada
      if (ModeloAcesso.SentidoPassagem = tpsSaida) then
      begin
        ModeloAcesso.Enviar_Mensagem_Sentido_Invalido;
        Msg_Aviso(clRed, fu.CMTranslate('Esta estação permite apenas Entradas'), '');
        bMsg_Aviso_Momentanea := true;
        Result := true;
      end;
    end;
  end;
end;

function TfrmRegAcesso.Verificar_Acessos_Excedidos(var Complemento: string): boolean;
var
  bPermitido: boolean;
  iPermitidos: integer;
  iUsados: integer;
begin
  Result := false;
  // Esta verificação é feita somente com base na entrada de cada pessoa.
  // Ex: Caso uma determinada pessoa tenha um limite de 4 acessos diários, o sistema
  //     irá permitir o acesso de 4 entradas e 4 saídas. O que conta mesmo é a saída,
  //     não cada acesso feito pela pessoa.
  if (Modulo.TipoEstacao = 'A') then
  begin
    bPermitido := (CtrlRegAcessoFunc.VerificaAcessoRegVezesFunc(
      dIdPessoa, Modulo.IdEstacaoEcesso, Date, iPermitidos, iUsados));
    iSaldoAcessos := iPermitidos - iUsados;

    if (iPermitidos > 0) then
      if (Round(Modulo.IndLiberacao) in [AUTOM_COM_CATRACA, AUTOM_SEM_CATRACA]) then
        Complemento := fu.CMTranslateMsg(MSG_SALDO_AUTOM, [IntToStr(iSaldoAcessos)])
      else
        Complemento := fu.CMTranslateMsg(MSG_SALDO, [IntToStr(iSaldoAcessos)]);

    if not(bPermitido) then
    begin
      SetIndPassagem(IND_PASSAGEM_REJEITADA, IND_MOTIVO_PASSAGEM_QUANT_ACESSOS);

      if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
        ModeloAcesso.Enviar_Mensagem_Acessos_Excedidos;

      Msg_Aviso(clRed,
        fu.CMTranslateMsg(MSG_ACESSOS_PERM, [IntToStr(iPermitidos)]), fu.CMTranslate('Confirma?'));
      bMsg_Aviso_Momentanea := (Modulo.IndLiberacao in [AUTOM_SEM_CATRACA, AUTOM_COM_CATRACA]);  
      Result := true;
    end;
  end;
end;

function TfrmRegAcesso.Verificar_Acessos_Fora_de_Hora: boolean;
var
  Hora: TTime;
  iMinInicio: integer;
begin
  Result := false;
  if (Config.cbxTolerancia.Checked) then
  begin
    Hora := Time;
    // Precisa verificar:
    // 1) Se é a primeira batida do dia
    // 2) Se a tolerância foi ultrapassada
    iMinInicio :=
      StrToInt(Copy(CdsHorario.FieldByName('INICIOEXPEDIENTE').asString,1,2))*60+
      StrToInt(Copy(CdsHorario.FieldByName('INICIOEXPEDIENTE').asString,4,2));

    Procurar_Acesso_Anterior;
    if (((Hora-Int(Hora)) * 24 * 60 < iMinInicio - Config.spedMin.Value) or
        ((Hora-Int(Hora)) * 24 * 60 > iMinInicio + Config.spedMin.Value)) and
       ((CdsAcessoFunc.IsEmpty) or (FormaOperacao = tpoEntrada)) then
    begin
      // Fora da Tolerância de Horário
      SetIndPassagem(IND_PASSAGEM_FORCADA, IND_MOTIVO_PASSAGEM_HORARIO);

      if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
        ModeloAcesso.Enviar_Mensagem_Acessos_Fora_de_Hora;

      Msg_Aviso(clRed, fu.CMTranslate('Acesso Fora do Horário.'), fu.CMTranslate(' Confirma?'));
      bMsg_Aviso_Momentanea := (Modulo.IndLiberacao in [AUTOM_SEM_CATRACA, AUTOM_COM_CATRACA]);
      Result := true;
    end;
  end;
end;

procedure TfrmRegAcesso.Mensagem_Libera_Acesso;
begin
  AddLog(fu.CMTranslate('Liberação de Acesso'));
  ModeloAcesso.Enviar_Mensagem_Libera_Acesso(memDocumento.Text, iSaldoAcessos);
end;

{procedure TfrmRegAcesso.Enviar_Mensagem_Acesso_Nao_Concluido;
begin
  if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
    ModeloAcesso.Enviar_Mensagem(CMTranslate('Acesso não Concluído.'));

  Msg_Aviso(clRed, CMTranslate('Acesso não Concluído.'), 'Passe o Cartão Novamente.');
  bMsg_Aviso_Momentanea := true;
end;}

procedure TfrmRegAcesso.Mensagem_Acesso_Dia_Folga;
begin
  SetIndPassagem(IND_PASSAGEM_REJEITADA, IND_MOTIVO_PASSAGEM_DIA_TRAB);

  if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
    ModeloAcesso.Enviar_Mensagem_Acesso_Dia_Folga;

  Msg_Aviso(clRed, fu.CMTranslate('Acesso em Dia de Folga.'), fu.CMTranslate(' Confirma?'));
  bMsg_Aviso_Momentanea := (Modulo.IndLiberacao in [AUTOM_SEM_CATRACA, AUTOM_COM_CATRACA]);
end;

procedure TfrmRegAcesso.Mostrar_Mensagem_Sem_Horario;
begin
  Msg_Aviso(clRed, fu.CMTranslate('Sem Horário de Trabalho Cadastrado. Passagem não Permitida'), '');
  bMsg_Aviso_Momentanea := true;
end;

function TfrmRegAcesso.Verificar_Pessoa_Desligada: boolean;
begin
  Result := false;
  if (CdsFunc.FIeldByName('TIPOSIT').asString = 'D') then
  begin
    SetIndPassagem(IND_PASSAGEM_REJEITADA, IND_MOTIVO_PASSAGEM_SIT_FUNC);

    if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
      ModeloAcesso.Enviar_Mensagem_Pessoa_Desligada;

    Msg_Aviso(clRed, fu.CMTranslate('Pessoa Desligada da Empresa. Passagem não Permitida'), '');
    bMsg_Aviso_Momentanea := true;
    ExecFocus(false);
    Result := true;
  end;
end;

function TfrmRegAcesso.Verificar_Pessoa_Afastada: boolean;
begin
  Result := false;
  if (CdsFunc.FIeldByName('TIPOSIT').asString = 'F') then
  begin
    SetIndPassagem(IND_PASSAGEM_REJEITADA, IND_MOTIVO_PASSAGEM_SIT_FUNC);

    if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
      ModeloAcesso.Enviar_Mensagem_Pessoa_Afastada;

    Msg_Aviso(clRed, fu.CMTranslate('Pessoa Afastada. Passagem não Permitida'), '');
    bMsg_Aviso_Momentanea := true;
    ExecFocus(false);
    Result := true;
  end;
end;

function TfrmRegAcesso.Verificar_Pessoa_Ferias: boolean;
begin
  Result := false;
  if (CtrlRegAcessoFunc.PessoaEmFerias(CdsFunc.FieldByName('IDPESSOA').asFloat, Date)) then
  begin
    SetIndPassagem(IND_PASSAGEM_REJEITADA, IND_MOTIVO_PASSAGEM_FERIAS);

    if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
      ModeloAcesso.Enviar_Mensagem_Pessoa_Ferias;

    Msg_Aviso(clRed, fu.CMTranslate('Pessoa Em Gozo de Férias.'), fu.CMTranslate('Confirma?'));
    bMsg_Aviso_Momentanea := (Modulo.IndLiberacao in [AUTOM_SEM_CATRACA, AUTOM_COM_CATRACA]);
    ExecFocus(false);
    Result := true;
  end;
end;

procedure TfrmRegAcesso.Mensagem_Cracha_Invalido;
begin
  if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) then
    ModeloAcesso.Enviar_Mensagem_Cracha_Invalido;

  Msg_Aviso(clRed, fu.CMTranslateMsg(MSG_CRACHA_NAO_REC, [sNumDocumento]), '');
  bMsg_Aviso_Momentanea := true;
  Limpar_memDocumento;
  edDocumento.Text := '';
  ExecFocus(false);
end;

procedure TfrmRegAcesso.AguardaTempo;
begin
  Sleep(Config.spedTempo.Value * 1000);
end;

procedure TfrmRegAcesso.Procurar_Acesso_Anterior;
begin
  if (Config.rgPontoAcesso.ItemIndex = 0) then
    CdsAcessoFunc.Data := CtrlRegAcessoFunc.ListAcessoEntradaFunc(dIdPessoa, 'P')
  else
    CdsAcessoFunc.Data := CtrlRegAcessoFunc.ListAcessoEntradaFunc(dIdPessoa, 'A');
end;

procedure TfrmRegAcesso.Mostrar_Mensagem_Acesso;
var
  bExecTravar, bMsg_Erro_DispAcesso: boolean;
begin
  if Assigned(ModeloAcesso) then
    bMsg_Erro_DispAcesso := (ModeloAcesso.MessageInfo <> '')
  else
    bMsg_Erro_DispAcesso := false;

  CdsHorario.First;
  CdsHorario.EnableControls;
  lblMensagem2.Visible := false;
  pnlTeclado.Visible := false;
  bExecTravar := true;

  AddLog(fu.CMTranslate('Mostrar Mensagem de Acesso'));
  AddLog(fu.CMTranslate('Erro de Acesso: ') + UpperCase(fu.BoolToStr(bMsg_Erro_DispAcesso, true)));

  // Mensagem de erro (falha) na comunicação com o Dispositivo de Acesso
  if (bMsg_Erro_DispAcesso) then
  begin
    if (Round(Modulo.IndLiberacao) in [ASSIST_SEM_CATRACA, ASSIST_COM_CATRACA]) then
      MsgDlg(ModeloAcesso.MessageInfo, fu.CMTranslate('Erro'), mtInformation, [mbOk,mbHelp], 0)
    else
    begin
      lblMensagem.Caption := ModeloAcesso.MessageInfo;
      lblMensagem.Font.Color := clRed;
      Self.Update;
      AguardaTempo;
    end;

    ReiniciarTimer;
    pnlTeclado.Visible := (iIndIdentificacao = IDENTIF_TECLADO);
    lblMensagem2.Visible := not(iIndIdentificacao = IDENTIF_TECLADO);
    ExecFocus(false);
  end
  else // Mensagem normais do sistema (Aviso)
  begin
    lblMensagem.Caption := sMsg_Aviso;
    lblMensagem.Font.Color := Msg_Aviso_Cor;
    Self.Update;
    lblMensagem.Update;

    if (Round(Modulo.IndLiberacao) in [ASSIST_SEM_CATRACA, ASSIST_COM_CATRACA]) then
    begin
      HabilitarBotoes(not(bMsg_Aviso_Momentanea));
      if (bMsg_Aviso_Momentanea) then
      begin
        bExecTravar := false;
        AguardaTempo;
        ExecFocus;
        bExecTimerInterrogacao := true;
        tmInterrogacao.Enabled := true;
        Destravar_Dispositivo;
      end;
    end
    else
    begin
      // Só forçar o Ok quando for uma mensagem momentânea e não seja
      // de Aviso de Inconsistência (quando a cor da mensagem de Aviso for clTeal).
      if (sModelo = RODBEL_RBC_2801) then
      begin
        if (Msg_Aviso_Cor = clTeal) then
          bbtnOkClick(Self)
        else
        begin
          Sleep(ModeloAcesso.TempoAcesso);
          ReiniciarTimer;
        end;
      end
      else
      begin
        if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) and
           (Msg_Aviso_Cor = clTeal) then
          Mensagem_Libera_Acesso;

        AguardaTempo;

        if (Msg_Aviso_Cor = clTeal) then
          bbtnOkClick(Self)
        else
          ReiniciarTimer;
      end;

      pnlTeclado.Visible := (iIndIdentificacao = IDENTIF_TECLADO);
      lblMensagem2.Visible := not(iIndIdentificacao = IDENTIF_TECLADO);
      ExecFocus;
    end;
  end;

  if (bExecTravar) then
    Travar_Dispositivo;
end;

procedure TfrmRegAcesso.Travar_Dispositivo;
begin
  if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) and
     Assigned(ModeloAcesso) then
    ModeloAcesso.Enviar_Mensagem_Travar_Dispositivo;
end;

procedure TfrmRegAcesso.Destravar_Dispositivo;
begin
  if (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) and
     Assigned(ModeloAcesso) then
    ModeloAcesso.Enviar_Mensagem_Destravar_Dispositivo;
end;

procedure TfrmRegAcesso.SelPessoa;
var
  sComplemento, sDiaSemana: string;
  TotHoras: integer;
  Hora1, Hora2: double;
  c, i: integer;
begin
  if (Trim(memDocumento.Text) = '') then
    exit;

  sMsg_Aviso := '';
  sComplemento := '';
  SetIndPassagem(IND_PASSAGEM_NORMAL, IND_MOTIVO_PASSAGEM_NORMAL);
  bExecTimerInterrogacao := false;

  if (ProcurarPessoa) then
  begin
    AddLog(fu.CMTranslate('Achou Pessoa'));
    // Obter o Centro de Custo da Pessoa
    // CdsAux.Data := CtrlListTerceirosRH.ListCCusto(FloatToStr(dIdEmpresa), sCodCentroCusto);
    lblCCusto.Caption := CdsFunc.FieldByName('CENTROCUSTO').asString;

    // Obter o Cargo da Pessoa
    CdsAux.Data := CtrlCargo.ListCargo(dIdCargo);
    lblCargo.Caption := CdsAux.FieldByName('TITULO').asString;

    CdsHorario.DisableControls;

    if not(Verificar_Horario_Bloqueado) and
       not(Verificar_Sentido_Invalido) and
       not(Verificar_Acessos_Excedidos(sComplemento)) and
       not(Verificar_Pessoa_Ferias) then
    begin
      if (CdsHorario.IsEmpty) then
      begin
         // ECF 10/07/07 ESC.ROTATIVA
        CdsAux.Data := CtrlHoraTrab.ListHoraTrab(CdsFunc.FieldByName('IDHORARIO').asInteger);
        if (CdsAux.FieldByName('FLGTIPOHORARIO').asInteger = 0) then
          Mostrar_Mensagem_Sem_Horario
        else
        begin  // ECF 10/07/07 ESC.ROTATIVA
          TotHoras := CdsAux.FieldByName('HORASFOLGA1').asInteger +
            CdsAux.FieldByName('HORASSERVICO').asInteger +
            CdsAux.FieldByName('HORASFOLGA2').asInteger;
          if (TotHoras = 0) then
            TotHoras := 1;

          i := DayOfWeek(Date);

          for c := 1-i to 7-i do
          begin
            CdsHorario.Insert;
            case (DayOfWeek(Date + c)) of
              1: sDiaSemana := '  Domingo';
              2: sDiaSemana := '  Segunda';
              3: sDiaSemana := '  Terça';
              4: sDiaSemana := '  Quarta';
              5: sDiaSemana := '  Quinta';
              6: sDiaSemana := '  Sexta';
              7: sDiaSemana := '  Sábado';
            end;
            CdsHorario.FieldByName('IDDIASEMANA').asInteger := DayOfWeek(Date + c);
            CdsHorario.FieldByName('DIASEMANA').asString := sDiaSemana;

            Hora1 := FU.RestoDivisao((Date + c -
              CdsFunc.FieldByName('DATAREFHORARIO').asDateTime) * 24, TotHoras) +
              CdsAux.FieldByName('HORASFOLGA1').asInteger;

            if (Hora1  < 24) then
            begin
              Hora2 := Hora1 + CdsAux.FieldByName('HORASSERVICO').asFloat;

              if (Hora2 > 24) then
                Hora2 := Hora2 - 24;

              CdsHorario.FieldByName('INICIOEXPEDIENTE').asString :=
                FU.PoeZero(Round(Hora1)) + ':' +
                FU.PoeZero(Round(Frac(Hora1) * 60));
              CdsHorario.FieldByName('FINALEXPEDIENTE').asString :=
                FU.PoeZero(Round(Hora2)) + ':' +
                FU.PoeZero(Round(frac(Hora2) * 60));
            end;
            CdsHorario.Post;
          end;
        end;
      end;  // ECF 10/07/07 ESC.ROTATIVA

      if (not CdsHorario.IsEmpty) and (CdsHorario.Locate('IDDIASEMANA', DayOfWeek(Date), [])) then
      begin
        if (CdsHorario.FieldByName('INICIOEXPEDIENTE').asString <> '') and // ECF 10/07/07 ESC.ROTATIVA
           not(Verificar_Acessos_Fora_de_Hora) then
        begin
          // Mensagem de liberação da passagem a ser exibida na tela
          if (Modulo.IndLiberacao in [AUTOM_COM_CATRACA, AUTOM_SEM_CATRACA]) then
          begin
            if (sComplemento = '') then
              Msg_Aviso(clTeal, fu.CMTranslate('Acesso Liberado'), '')
            else
              Msg_Aviso(clTeal, sComplemento, fu.CMTranslate('Acesso Liberado'));
          end
          else
          begin
            if (sComplemento = '') then
              Msg_Aviso(clTeal, fu.CMTranslate('Confirma Acesso?'), '')
            else
              Msg_Aviso(clTeal, sComplemento, fu.CMTranslate('Confirma Acesso?'));
          end;
          bMsg_Aviso_Momentanea :=
            (Modulo.IndLiberacao in [AUTOM_SEM_CATRACA, AUTOM_COM_CATRACA]);
        end  // ECF 10/07/07 ESC.ROTATIVA
        else if (CdsHorario.FieldByName('INICIOEXPEDIENTE').asString = '') then  // ECF 10/07/07 ESC.ROTATIVA
          Mensagem_Acesso_Dia_Folga;  // ECF 10/07/07 ESC.ROTATIVA
      end
      else
        Mensagem_Acesso_Dia_Folga;
    end;
  end
  else
    AddLog(fu.CMTranslate('Não Achou Pessoa'));

{  lblMensagem2.Visible := false;
  pnlTeclado.Visible := false;
  AguardaTempo;
  bExecTimerInterrogacao := true;
  tmInterrogacao.Enabled := true;
  //ReiniciarTimer;}

  Mostrar_Mensagem_Acesso;
  Limpar_memDocumento;
end;

function TfrmRegAcesso.ProcurarPessoa: boolean;
var
  iIdHorario: integer;
begin
  sNumDocumento := Trim(Copy(memDocumento.Text, iColDocumento, iTamDocumento));

  Limpar_memDocumento; // ECF 06/07/06 para ver se melhora problema no Serhs
  
  if (dIdDocumento > 0) then
    dIdPessoa := CtrlListTerceirosRH.GetPessoa_Documento(sNumDocumento, dIdDocumento)
  else
    dIdPessoa := CtrlPessoaFuncionario.GetMatriculaJaExiste(sNumDocumento,
      FU.IFF(Config.rgPermiteAcessoOutraEmpProp.ItemIndex=1, Sistema.IdEmpresa, 0));

  CdsFunc.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(dIdPessoa,
    '  P.IDPESSOA, P.NOME, F.MATRICULA, F.IDCARGO, F.CODCENTROCUSTO, F.IDEMPRESA,' +CR_LF+
    '  P.IDIMAGEM, F.IDHORARIO, F.FLGMARCAINTERVALO, F.DATAREFHORARIO, TIPOSIT, CC.NOME AS CENTROCUSTO');

  Result := not(CdsFunc.IsEmpty);
  if (Result) then
  begin
    if (Verificar_Pessoa_Desligada) or (Verificar_Pessoa_Afastada) then
    begin
      Result := false;
      exit;
    end;  

    // Obter a Foto da Pessoa
    CdsImg.Data := CtrlListTerceirosRH.ListImagem(CdsFunc.FieldByName('IDIMAGEM').asFloat);
    imgPessoa.Visible := not(CdsImg.IsEmpty) and not(CdsFunc.FieldByName('IDIMAGEM').IsNull);

    // Preencher os campos da tela
    lblNome.Caption := CdsFunc.FieldByName('NOME').asString;
    lblMatricula.Caption := fu.CMTranslate('Matrícula: ')+ CdsFunc.FieldByName('MATRICULA').asString;

    sCodCentroCusto := CdsFunc.FieldByName('CODCENTROCUSTO').asString;
    dIdEmpresa := CdsFunc.FieldByName('IDEMPRESA').asFloat;
    dIdCargo := CdsFunc.FieldByName('IDCARGO').asFloat;

    // Preencher o horário da pessoa
    CdsHorarioVariavel.Data := CtrlHorarioVariavel.ListHorarioVariavel(
      dIdPessoa, DateToStr(Date), DateToStr(Date));

    if (CdsHorarioVariavel.IsEmpty) then
      iIdHorario := CdsFunc.FieldByName('IDHORARIO').asInteger
    else
      iIdHorario := CdsHorarioVariavel.FieldByName('IDHORARIO').asInteger;

    if (iIdHorario = 0) then
      CdsAux.Data := CtrlHoraTrab.ListHoraTrab(-1)
    else
      CdsAux.Data := CtrlHoraTrab.ListHoraTrab(iIdHorario);

    lblHorarioTrab.Caption := fu.CMTranslate('Horário: ') + CdsAux.FieldByName('NOMEHORARIO').asString;
    CdsHorario.Data := CtrlAssociaHorario.ListTurnoDiaSel(CdsAux.FieldByName('IDHORARIO').asInteger);
  end
  else
    Mensagem_Cracha_Invalido;
end;

procedure TfrmRegAcesso.ReiniciarTimer;
begin
  ExecFocus;
  // Acionar o temporizador somente para as opções necessárias
  bExecTimerInterrogacao :=
    (Modulo.IndLiberacao in [ASSIST_COM_CATRACA, AUTOM_COM_CATRACA]) or
    (iIndIdentificacao = IDENTIF_BIOMETRICA);
  tmInterrogacao.Enabled := bExecTimerInterrogacao;
  //if (bExecTimerInterrogacao) then
  //  Destravar_Dispositivo;
end;

procedure TfrmRegAcesso.HabilitarBotoes(const Habilita: boolean);
begin
  bbtnOk.Enabled := Habilita;
  bbtnRejeitar.Enabled := Habilita;
end;

function TfrmRegAcesso.InitLeituraBiometrica: string;
begin
  if not(TCmBSP.Exists) then
  begin
    Result := fu.CMTranslate('Leitor de digitais não está devidamente conectado ou instalado.');
    exit;
  end;

  // Procurar todos os Funcionários para a comparação da digital
  CdsFuncionario.Data := Padroes.GetDataPacket(
    'SELECT MATRICULA, FIR' +CR_LF+
    'FROM   FUNCIONARIO' +CR_LF+
    'WHERE' +CR_LF+
    FU.IFF(Config.rgPontoAcesso.ItemIndex = 0,
    '  (FLGMARCAPONTO = 1) AND'+CR_LF, '')+
    '  (FIR IS NOT NULL)');

  Result := '';
end;

procedure TfrmRegAcesso.LeituraBiometrica;
const
  Meu_SecuBSPERROR_USER_CANCEL = 513;
var
  bAchou: boolean;
  CmBSP: TCmBSP;
begin
  bAchou := false;
  Application.ProcessMessages;

  CmBSP := TCmBSP.Create;
  try
    if (CmBSP.Open) then
    begin
      CmBSP.LoadFromDb(Sistema.IdUsuario);

      if (CmBSP.CapturarParaComparar) then
      begin
        CdsFuncionario.First;
        while not(CdsFuncionario.EOF) do
        begin
          bAchou := CmBSP.Comparar(CdsFuncionario.FieldByName('FIR').asString);

          if (bAchou) then
            break
          else
            CdsFuncionario.Next;
        end;
      end;
    end;
  finally
    CmBSP.Free;
  end;

  if (bAchou) then
    memDocumento.Text := CdsFuncionario.FieldByName('MATRICULA').asString
  else
  if (CmBSP.ErrorCode = Meu_SecuBSPERROR_USER_CANCEL) then
  begin
    MsgDlg(fu.CMTranslate('Identificação cancelada pelo usuário.'),
      fu.CMTranslate('Aviso'), mtWarning, [mbOk,mbHelp], 0);
    Close;
  end
  else
  if (CmBSP.ErrorCode <> SecuBSPERROR_NONE) and
     (CmBSP.ErrorCode <> SecuBSPERROR_CAPTURE_TIMEOUT) then
  begin
    dmCds.CmErroDlg.ErrorMesage.Text :=
      fu.CMTranslate('Ocorreu um erro na leitura biométrica.') +CR_LF+
      fu.CMTranslate('Erro: ') +CmBSP.ErrorMessage +CR_LF+
      fu.CMTranslate('Favor efetuar a identificação novamente.');
    dmCds.CmErroDlg.Execute;
  end;

  Application.ProcessMessages;
end;

procedure TfrmRegAcesso.TimerVerificaDocumentoTimer(Sender: TObject);
var
  TempoDecorrido: integer;
begin
  inherited;
  TempoDecorrido := 100;

  if (Length(memDocumento.Text) < (iColDocumento + iTamDocumento - 1)) and (TempoDecorrido > 500) then
  begin
    Limpar_memDocumento;
  end;
end;

end.
