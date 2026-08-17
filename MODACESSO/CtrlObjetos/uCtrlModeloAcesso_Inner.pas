{*******************************************************}                  
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 18/10/2005                                 }
{                                                       }
{*******************************************************}

unit uCtrlModeloAcesso_Inner;

interface

uses Windows, SysUtils, Controls, uCmDbObject, uCmControlObject, IvDictio, uCtrlFuncoesRH,
uCtrlModeloAcesso;

const
  TAM_MSG = 16; // Tamanho de cada linha de mensagem

  // Retorno da Envia_Dados
  ENVIA_OK = 31;
  ENVIA_SEM_RESPOSTA = 21;
  ENVIA_FALHA_CS = 33;
  ENVIA_PORTA_NAO_ABERTA = 1;

  // Retorno da Recebe_Dados
  RECEBE_OK = 40;
  RECEBE_SEM_RESPOSTA = 21;
  RECEBE_FALHA_CS = 43;
  RECEBE_PORTA_NAO_ABERTA = 8;

  // Retorno da pergunta se possui dados no buffer da Inner
  NAO_POSSUI_DADOS_BUFFER = 0;
  POSSUI_DADOS_BUFFER = 1;

  // Comandos para o Inner
  CMD_ACIONA_RELE1_TEMPO = 1;
  CMD_ACIONA_RELE2_TEMPO = 2;
  CMD_ACIONA_RELE1_FIXO = 4;
  CMD_ACIONA_RELE2_FIXO = 5;
  CMD_DESACIONA_RELE1 = 6;
  CMD_DESACIONA_RELE2 = 7;
  CMD_BIP_CURTO = 8;
  CMD_BIP_LONGO = 9;
  CMD_LIBERA_SENTIDO_1 = 12; // Gira a catraca da direita para a esquerda
  CMD_LIBERA_SENTIDO_2 = 13; // Gira a catraca da esquerda para a direita
  CMD_LIBERA_AMBOS_SENTIDOS = 16;
  CMD_CONFIG_INI = 100;
  CMD_RELOGIO = 101;
  CMD_MENSAGEM = 104;
  CMD_CONFIG_ENTRADAS = 107;
  CMD_RECEBE_DADOS = 207;
  CMD_PERGUNTA_DADOS = 215;

  // Tamanho do buffer de dados (em bytes)
  TAM_BUF_RX = 20;
  TAM_BUF_TX = 50;

  // Tamanho do Buffer para cada comando (em bytes)
  SIZE_CMD_DIRETO = 0; // comandos abaixo de 100
  SIZE_CONFIG_INI = 50;
  SIZE_MENSAGEM = 33;
  SIZE_CONFIG_ENTRADAS = 5;
  SIZE_RECEBE_DADOS = 22;
  SIZE_PERGUNTA_DADOS = 1;

type
  TInicializaCom = function (NumPorta, Velocidade: integer): boolean; stdcall;
  TFinalizaCom = procedure; stdcall;
  TEnvia_Dados = function (NumInner: integer; Buff: pointer; CodComando: integer;
    NumBytes: LongInt; Protocolo: integer): integer; stdcall;
  TRecebe_Dados = function (NumInner: integer; Buff: pointer; CodComando: integer;
    NumBytes: LongInt; Protocolo: integer): integer; stdcall;

  TCtrlModeloAcesso_Inner = class(TCtrlModeloAcesso)
  private
    FNumInner: integer;

    FBufferRx: array[0..TAM_BUF_RX-1] of byte; // Buffer de Recepção
    FBufferTx: array[0..TAM_BUF_TX-1] of byte; // Buffer de Transmissão

    // Variáveis que irão guardar as funções da DLL
    FInicializaCom: TInicializaCom; // Função que abre a porta de comunicação
    FFinalizaCom: TFinalizaCom; // Função que finaliza a porta de comunicação
    FEnvia_Dados: TEnvia_Dados; // Função que envia comandos à catraca
    FRecebe_Dados: TRecebe_Dados; // Função que recebe dados da catraca
  protected
    function  Enviar_Comando(const NumComando: byte): boolean; override;
    function  Verificar_Existe_Dados: boolean; override;
    function  Receber_Dados: boolean; override;
    procedure Limpar_Buffer(const Tipo: TTipoBuffer); override;
    procedure Montar_Mensagem(Linha1, Linha2: string; const TempoMsg: byte);
    function  Enviar_Mensagem(const Linha1, Linha2: string; const TempoMsg: integer = 0): boolean; reintroduce;

    procedure Liberar_Giro_Catraca;
  public
    constructor Create; override;

    function CarregarFuncoesDLL: boolean; override;

    function Inicializar(const Porta: string; const Velocidade: integer): boolean; override;

    function  Inicializar_Dispositivo: boolean; override;
    procedure Finalizar_Dispositivo; override;

    function  Inicializar_Config: boolean; override;
    procedure Config_Entradas; override;

    procedure Enviar_DataHora;
    function  Enviar_Mensagem_Padrao: boolean; override;

    function  Enviar_Mensagem_Cartao_Bloqueado: boolean; override;
    function  Enviar_Mensagem_Acessos_Excedidos: boolean; override;
    function  Enviar_Mensagem_Acessos_Fora_de_Hora: boolean; override;
    function  Enviar_Mensagem_Sentido_Invalido: boolean; override;
    function  Enviar_Mensagem_Libera_Acesso(const NumCartao: string;
      const Saldo: integer): boolean; override;
    function  Enviar_Mensagem_Travar_Dispositivo: boolean; override;
    function  Enviar_Mensagem_Destravar_Dispositivo: boolean; override;
    function  Enviar_Mensagem_Acesso_Dia_Folga: boolean; override;
    function  Enviar_Mensagem_Pessoa_Desligada: boolean; override;
    function  Enviar_Mensagem_Pessoa_Afastada: boolean; override;
    function  Enviar_Mensagem_Pessoa_Ferias: boolean; override;
    function  Enviar_Mensagem_Cracha_Invalido: boolean; override;

    function Interrogacao: string; override;

    property NumInner: integer read FNumInner write FNumInner;
  end;

implementation

uses  uMensErro;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_LOG_FUNC_DLL =
    'Carregamento das Funções da DLL ":1": :2';
  MSG_LOG_INI_DISP =
    'Inicialização do Dispositivo em ":1" em :2: :3';

{ TCtrlModeloAcesso_Inner }

constructor TCtrlModeloAcesso_Inner.Create;
begin
  inherited;
  FNomeDLL := 'INNER2K.DLL';
end;

function TCtrlModeloAcesso_Inner.CarregarFuncoesDLL: boolean;
begin
  Result := inherited CarregarFuncoesDLL;
  if (Result) then
  begin
    Result := false;

    FFuncao := GetProcAddress(FDLL, PChar('InicializaCom'));
    if (Assigned(FFuncao)) then
      FInicializaCom := TInicializaCom(FFuncao)
    else
    begin
      MessageInfo := CMTranslateMsg(MSG_ERRO_FUNC_NAO_ENC, ['InicializaCom', FNomeDLL]);
      exit;
    end;

    FFuncao := GetProcAddress(FDLL, PChar('FinalizaCom'));
    if (Assigned(FFuncao)) then
      FFinalizaCom := TFinalizaCom(FFuncao)
    else
    begin
      MessageInfo := CMTranslateMsg(MSG_ERRO_FUNC_NAO_ENC, ['FinalizaCom', FNomeDLL]);
      exit;
    end;

    FFuncao := GetProcAddress(FDLL, PChar('Envia_Dados'));
    if (Assigned(FFuncao)) then
      FEnvia_Dados := TEnvia_Dados(FFuncao)
    else
    begin
      MessageInfo := CMTranslateMsg(MSG_ERRO_FUNC_NAO_ENC, ['Envia_Dados', FNomeDLL]);
      exit;
    end;

    FFuncao := GetProcAddress(FDLL, PChar('Recebe_Dados'));
    if (Assigned(FFuncao)) then
      FRecebe_Dados := TRecebe_Dados(FFuncao)
    else
    begin
      MessageInfo := CMTranslateMsg(MSG_ERRO_FUNC_NAO_ENC, ['Recebe_Dados', FNomeDLL]);
      exit;
    end;

    Result := true;
  end;
  AddLog(FU.CMTranslateMsg(MSG_LOG_FUNC_DLL, [FNomeDLL, BoolToStr(Result, true)]));
end;

function TCtrlModeloAcesso_Inner.Inicializar(const Porta: string;
  const Velocidade: integer): boolean;
begin
  Result := inherited Inicializar(Porta, Velocidade);
  if not(Result) then
    exit;

  Result := Inicializar_Dispositivo;
  if not(Result) then
    exit;

  Inicializar_Config;
  Result := Enviar_Mensagem_Padrao;
  if not(Result) then
    exit;

  Config_Entradas;
end;

function TCtrlModeloAcesso_Inner.Inicializar_Dispositivo: boolean;
begin
  inherited Inicializar_Dispositivo;

  if not(FDispositivo_Inicializado) then
  begin
    FDispositivo_Inicializado := FInicializaCom(StrToInt(Copy(FPorta,4,1)), FVelocidade);

    if not(FDispositivo_Inicializado) then
      MessageInfo := CMTranslate('Ocorreu um erro ao abrir porta de comunicação.');
  end;

  Limpar_Buffer(tpbTransmissao);
  Result := FDispositivo_Inicializado;

  AddLog(CMTranslateMsg(MSG_LOG_INI_DISP,
    [FPorta, IntToStr(FVelocidade), BoolToStr(Result, true)]));
end;

procedure TCtrlModeloAcesso_Inner.Finalizar_Dispositivo;
begin
  if (FDLL > 0) then
    FFinalizaCom;
  AddLog(CMTranslate('Finalização do Dispositivo'));  
  inherited;
end;

function TCtrlModeloAcesso_Inner.Inicializar_Config: boolean;
begin
  Result := inherited Inicializar_Config;
  FBufferTx[00] := 1; // Modo de Operação (OnLine)
  FBufferTx[04] := FTempoAcesso; // Tempo de Acionamento (em segundos)
  FBufferTx[06] := 0; // Tipo de Leitor (Código de Barras)
  FBufferTx[14] := FTamDocumento; // Número de Dígitos no Cartão
  Enviar_Comando(CMD_CONFIG_INI);
  Enviar_DataHora;
  AddLog(CMTranslate('Configuração inicial do dispositivo realizada'));
  AddLog(CMTranslate('  Tempo de Acionamento        = ') + IntToStr(FTempoAcesso));
  AddLog(CMTranslate('  Número de Dígitos no Cartão = ') + IntToStr(FTamDocumento));
end;

procedure TCtrlModeloAcesso_Inner.Config_Entradas;
begin
  inherited;
  //FBufferTx[0] := FTamDocumento;// Número de Dígitos a serem Lidos no Teclado
  //FBufferTx[1] := 1; // Ecoar Entrada de Dados no Display
  FBufferTx[2] := 10; // Forma de Entrada (Teclado e Leitura Biométrica)
  //FBufferTx[3] := 6; // Tempo Máximo para Entrada via Teclado (em segundos)
  FBufferTx[4] := 17; // Posição do Cursor para Entrada via Teclado (1 a 32)
  Enviar_Comando(CMD_CONFIG_ENTRADAS);
  AddLog(CMTranslate('Configuração das entradas do dispositivo realizada'));
end;

// *****************************************************
// Montar a mensagem a ser exibida pelo Inner
// -----------------------------------------------------
// Linha1: Primeira linha da mensagem
// Linha2: Segunda linha da mensagem
// TempoMsg: Tempo que a mensagem será mostrada em segundos
procedure TCtrlModeloAcesso_Inner.Montar_Mensagem(Linha1, Linha2: string;
  const TempoMsg: byte);
var
  c: byte;
begin
  // Cada linha da mensagem devem ter TAM_MSG caracteres
  Linha1 := Alinha(Linha1, TAM_MSG, 'C', ' ');
  Linha2 := Alinha(Linha2, TAM_MSG, 'C', ' ');

  // Juntar as duas linhas da mensagem no buffer a ser enviado
  for c:=1 to TAM_MSG do
  begin
    FBufferTx[c - 1] := Ord(Linha1[c]);
    FBufferTx[c + TAM_MSG - 1] := Ord(Linha2[c]);
  end;

  // O final do buffer possui a informação do tempo que a mensagem será visualizada
  FBufferTx[32] := Ord(TempoMsg);
end;

// *****************************************************
// Enviar mensagens para o Inner
// -----------------------------------------------------
// Linha1: Primeira linha da mensagem
// Linha2: Segunda linha da mensagem
function TCtrlModeloAcesso_Inner.Enviar_Mensagem(const Linha1, Linha2: string;
  const TempoMsg: integer): boolean;
begin
  inherited Enviar_Mensagem;
  // Formatar a mensagem. Esta será mostrada durante "FTempoMsg" segundos
  //*Montar_Mensagem(Linha1, Linha2, fu.IFF(TempoMsg > 0, TempoMsg, FTempoMsg));
  // Enviar a mensagem à leitora
  Result := Enviar_Comando(CMD_MENSAGEM);
end;

function TCtrlModeloAcesso_Inner.Enviar_Mensagem_Padrao: boolean;
begin
  inherited Enviar_Mensagem_Padrao;
  // Formatar a mensagem padrão indicada na tela
  Montar_Mensagem(FMensagemPadrao, ' ', 255);
  // Enviar a mensagem padrão à leitora
  Result := Enviar_Comando(CMD_MENSAGEM);
end;

function TCtrlModeloAcesso_Inner.Enviar_Mensagem_Cartao_Bloqueado: boolean;
begin
  inherited Enviar_Mensagem_Cartao_Bloqueado;
  AddLog(CMTranslate('Mensagem "Horário Bloqueado"...'));
  Result := Enviar_Mensagem(CMTranslate('Horario'), CMTranslate('Bloqueado'));
  if not(Result) then
    exit;

  Result := Enviar_Comando(CMD_BIP_LONGO);
  AddLog(CMTranslate('Mensagem "Horário Bloqueado": ')+ BoolToStr(Result, true));
end;

function TCtrlModeloAcesso_Inner.Enviar_Mensagem_Acessos_Excedidos: boolean;
begin
  inherited Enviar_Mensagem_Acessos_Excedidos;
  AddLog(CMTranslate('Mensagem "Acessos Excedidos"...'));
  Result := Enviar_Mensagem(CMTranslate('Acessos'), CMTranslate('Excedidos'));
  if not(Result) then
    exit;

  Result := Enviar_Comando(CMD_BIP_LONGO);
  AddLog(CMTranslate('Enviando Mensagem "Acessos Excedidos": ')+ BoolToStr(Result, true));
end;

function TCtrlModeloAcesso_Inner.Enviar_Mensagem_Acessos_Fora_de_Hora: boolean;
begin
  inherited Enviar_Mensagem_Acessos_Fora_de_Hora;
  AddLog(CMTranslate('Enviando Mensagem "Acesso Fora de Hora"...'));
  Result := Enviar_Mensagem(CMTranslate('Acesso'), CMTranslate('Fora de Hora'));
  if not(Result) then
    exit;

  Result := Enviar_Comando(CMD_BIP_LONGO);
  AddLog(CMTranslate('Enviando Mensagem "Acesso Fora de Hora": ')+ BoolToStr(Result, true));
end;

function TCtrlModeloAcesso_Inner.Enviar_Mensagem_Sentido_Invalido: boolean;
begin
  inherited Enviar_Mensagem_Sentido_Invalido;
  AddLog(CMTranslate('Enviando Mensagem "Sentido Inválido"...'));
  Result := Enviar_Mensagem(CMTranslate('Sentido'), CMTranslate('Invalido'));
  if not(Result) then
    exit;

  Result := Enviar_Comando(CMD_BIP_LONGO);
  AddLog(CMTranslate('Enviando Mensagem "Sentido Inválido": ')+ BoolToStr(Result, true));
end;

procedure TCtrlModeloAcesso_Inner.Liberar_Giro_Catraca;
begin
  case (FSentidoPassagem) of
    tpsSaida   :
    begin
      AddLog(CMTranslate('Liberando: SAÍDA'));
      if (FSentido1 = tsgSaida) then
        Enviar_Comando(CMD_LIBERA_SENTIDO_1)
      else
        Enviar_Comando(CMD_LIBERA_SENTIDO_2);
    end;
    tpsEntrada :
    begin
      AddLog(CMTranslate('Liberando: ENTRADA'));
      if (FSentido1 = tsgEntrada) then
        Enviar_Comando(CMD_LIBERA_SENTIDO_1)
      else
        Enviar_Comando(CMD_LIBERA_SENTIDO_2);
    end;
    else
    begin
      AddLog(CMTranslate('Liberando: NOS DOIS SENTIDOS'));
      Enviar_Comando(CMD_LIBERA_AMBOS_SENTIDOS);
    end;
  end;
end;

function TCtrlModeloAcesso_Inner.Enviar_Mensagem_Libera_Acesso(const NumCartao: string;
  const Saldo: integer): boolean;
begin
  inherited Enviar_Mensagem_Libera_Acesso(NumCartao, Saldo);
  AddLog(CMTranslate('Enviando Mensagem "Acesso Liberado"...'));
  try
    if (Saldo > 0) then
      Enviar_Mensagem(CMTranslate('Saldo ')+ IntToStr(Saldo), NumCartao, FTempoAcesso)
    else
      Enviar_Mensagem(CMTranslate('Liberado'), NumCartao, FTempoAcesso);

    Enviar_Comando(CMD_BIP_CURTO);
    Liberar_Giro_Catraca;

    Result := true;
  except
    Result := false;
  end;
  AddLog(CMTranslate('Enviando Mensagem "Acesso Liberado": ')+ BoolToStr(Result, true));
end;

function TCtrlModeloAcesso_Inner.Enviar_Mensagem_Travar_Dispositivo: boolean;
begin
  inherited Enviar_Mensagem_Travar_Dispositivo;
  AddLog(CMTranslate('Enviando Mensagem "Travar Dispositivo"...'));
  try
    // Formatar a mensagem
    Montar_Mensagem(CMTranslate('Aguardando'), CMTranslate('Liberacao...'), 255);
    // Enviar a mensagem à leitora
    Result := Enviar_Comando(CMD_MENSAGEM);
    if (Result) then
    begin
      FBufferTx[2] := 0; // Forma de Entrada (não aceita entrada de dados)
      FBufferTx[4] := 0; // Posição do Cursor para Entrada via Teclado (1 a 32)
      Result := Enviar_Comando(CMD_CONFIG_ENTRADAS);
    end;
  except
    Result := false;
  end;
  AddLog(CMTranslate('Enviando Mensagem "Travar Dispositivo": ')+ BoolToStr(Result, true));
end;

function TCtrlModeloAcesso_Inner.Enviar_Mensagem_Destravar_Dispositivo: boolean;
begin
  inherited Enviar_Mensagem_Destravar_Dispositivo;
  AddLog(CMTranslate('Enviando Mensagem "Destravar Dispositivo"...'));
  Config_Entradas;
  Result := Enviar_Mensagem_Padrao;
  AddLog(CMTranslate('Enviando Mensagem "Destravar Dispositivo": ')+ BoolToStr(Result, true));
end;

function TCtrlModeloAcesso_Inner.Enviar_Mensagem_Acesso_Dia_Folga: boolean;
begin
  inherited Enviar_Mensagem_Acesso_Dia_Folga;
  AddLog(CMTranslate('Enviando Mensagem "Acesso em Dia de Folga"...'));
  try
    Enviar_Mensagem(CMTranslate('Acesso em'), CMTranslate('Dia de Folga'));
    Enviar_Comando(CMD_BIP_LONGO);
    Result := true;
  except
    Result := false;
  end;
  AddLog(CMTranslate('Enviando Mensagem "Acesso em Dia de Folga": ')+ BoolToStr(Result, true));
end;

function TCtrlModeloAcesso_Inner.Enviar_Mensagem_Pessoa_Desligada: boolean;
begin
  inherited Enviar_Mensagem_Pessoa_Desligada;
  AddLog(CMTranslate('Enviando Mensagem "Pessoa Desligada"...'));
  try
    Enviar_Mensagem(CMTranslate('Pessoa'), CMTranslate('Desligada'));
    Enviar_Comando(CMD_BIP_LONGO);
    Result := true;
  except
    Result := false;
  end;
  AddLog(CMTranslate('Enviando Mensagem "Pessoa Desligada": ')+ BoolToStr(Result, true));
end;

function TCtrlModeloAcesso_Inner.Enviar_Mensagem_Pessoa_Afastada: boolean;
begin
  inherited Enviar_Mensagem_Pessoa_Afastada;
  AddLog(CMTranslate('Enviando Mensagem "Pessoa Afastada"...'));
  try
    Enviar_Mensagem(CMTranslate('Pessoa'), CMTranslate('Afastada'));
    Enviar_Comando(CMD_BIP_LONGO);
    Result := true;
  except
    Result := false;
  end;
  AddLog(CMTranslate('Enviando Mensagem "Pessoa Afastada": ')+ BoolToStr(Result, true));
end;

function TCtrlModeloAcesso_Inner.Enviar_Mensagem_Pessoa_Ferias: boolean;
begin
  inherited Enviar_Mensagem_Pessoa_Ferias;
  AddLog(CMTranslate('Enviando Mensagem "Pessoa em Gozo de Ferias"...'));
  try
    Enviar_Mensagem(CMTranslate('Pessoa em'), CMTranslate('Gozo de Ferias'));
    Enviar_Comando(CMD_BIP_LONGO);
    Result := true;
  except
    Result := false;
  end;
  AddLog(CMTranslate('Enviando Mensagem "Pessoa em Gozo de Ferias": ')+ BoolToStr(Result, true));
end;

function TCtrlModeloAcesso_Inner.Enviar_Mensagem_Cracha_Invalido: boolean;
begin
  inherited Enviar_Mensagem_Cracha_Invalido;
  AddLog(CMTranslate('Enviando Mensagem "Crachá Inválido"...'));
  try
    Enviar_Mensagem(CMTranslate('Cracha'), CMTranslate('Invalido'));
    Enviar_Comando(CMD_BIP_LONGO);
    Result := true;
  except
    Result := false;
  end;
  AddLog(CMTranslate('Enviando Mensagem "Crachá Inválido": ')+ BoolToStr(Result, true));
end;

function TCtrlModeloAcesso_Inner.Enviar_Comando(const NumComando: byte): boolean;
var
  iResultado: integer; // Resultado de cada tentativa 
  iTentativa: integer; // Número de tentativas
  iTamBuffer: integer; // Tamanho do buffer a ser transmitido (em Bytes)
begin
  Result := inherited Enviar_Comando(NumComando);
  if not(Result) then
    exit;

  try
    // Selecionar o tamanho do buffer
    case (NumComando) of
      CMD_ACIONA_RELE1_TEMPO,
      CMD_ACIONA_RELE2_TEMPO,
      CMD_ACIONA_RELE1_FIXO,
      CMD_ACIONA_RELE2_FIXO,
      CMD_DESACIONA_RELE1,
      CMD_DESACIONA_RELE2,
      CMD_BIP_CURTO,
      CMD_BIP_LONGO,
      CMD_LIBERA_SENTIDO_1,
      CMD_LIBERA_SENTIDO_2   : iTamBuffer := SIZE_CMD_DIRETO;
      CMD_CONFIG_INI         : iTamBuffer := SIZE_CONFIG_INI;
      CMD_MENSAGEM           : iTamBuffer := SIZE_MENSAGEM;
      CMD_CONFIG_ENTRADAS,
      CMD_RELOGIO            : iTamBuffer := SIZE_CONFIG_ENTRADAS;
      else                     iTamBuffer := 0;
    end;

    // Enviar o comando até 3 vezes no caso de falha
    iTentativa := 0;
    iResultado := 0;
    while (iResultado <> ENVIA_OK) and (iTentativa < 3) do
    begin
      iResultado := FEnvia_Dados(FNumInner, @FBufferTx, NumComando, iTamBuffer, 0);
      Inc(iTentativa);
    end;

    Result := (iResultado = ENVIA_OK);
  except
    on E: Exception do
    begin
      MessageInfo := CMTranslate('Ocorreu um erro ao enviar a mensagem.') +CR_LF+
        CMTranslate('Erro: ') +E.Message;
      AddLog('ERRO: ' +CR_LF+ MessageInfo);
      Result := false;
    end;
  end;

  // Limpar o Buffer de transmissão
  if (Result) then
    Limpar_Buffer(tpbTransmissao);
end;

// *****************************************************
// Enviar a Data e Hora para o Inner
// -----------------------------------------------------
procedure TCtrlModeloAcesso_Inner.Enviar_DataHora;
var
  wDia, wMes, wAno, wHora, wMin, wSeg, wMSeg: word;
begin
  DecodeDate(Date, wAno, wMes, wDia);
  DecodeTime(Time, wHora, wMin, wSeg, wMSeg);

  FBufferTx[0] := wDia;
  FBufferTx[1] := wMes;
  FBufferTx[2] := wAno - 2000;
  FBufferTx[3] := wHora;
  FBufferTx[4] := wMin;

  Enviar_Comando(CMD_RELOGIO);
end;

function TCtrlModeloAcesso_Inner.Receber_Dados: boolean;
begin
	Result := (FRecebe_Dados(FNumInner, @FBufferRx, CMD_RECEBE_DADOS, SIZE_RECEBE_DADOS, 0) = RECEBE_OK);
end;

function TCtrlModeloAcesso_Inner.Verificar_Existe_Dados: boolean;
begin
	Result := (FRecebe_Dados(FNumInner, @FBufferRx, CMD_PERGUNTA_DADOS, SIZE_PERGUNTA_DADOS, 0) = RECEBE_OK);
  if (Result) then
    Result := (FBufferRx[0] = POSSUI_DADOS_BUFFER);
end;

function TCtrlModeloAcesso_Inner.Interrogacao: string;
var
  c: byte;
  sAux: string[14];
begin
	Limpar_Buffer(tpbRecepcao);
  Result := '';

  if (Verificar_Existe_Dados) then
  begin
    if (Receber_Dados) then
    begin
      // Lê os 20 dígitos do cartão
      sAux := '';
      for c:=2 to 21 do
        if (FBufferRx[c] <> 255) then
          sAux := sAux + IntToStr(FBufferRx[c]);

      // Retornar qual foi o botão pressionado (Saída ou Entrada)
      case (FBufferRx[1]) of
        66 :
        begin
          AddLog(CMTranslate('Sentido: ENTRADA'));
          FSentidoPassagem := tpsEntrada;
        end;
        67 :
        begin
          AddLog(CMTranslate('Sentido: SAÍDA'));
          FSentidoPassagem := tpsSaida;
        end;
        else
        begin
          AddLog(CMTranslate('Sentido: NOS DOIS SENTIDOS'));
          FSentidoPassagem := tpsIndiferente;
        end;
      end;

      Result := sAux;
      AddLog(CMTranslate('Cartão: ') +sAux);

      Enviar_Mensagem_Padrao;
      Enviar_Comando(CMD_BIP_CURTO);
      Config_Entradas;
    end;
  end;

	Limpar_Buffer(tpbRecepcao);
  inherited Interrogacao;
end;

procedure TCtrlModeloAcesso_Inner.Limpar_Buffer(const Tipo: TTipoBuffer);
begin
  inherited;
	if (Tipo = tpbRecepcao) then
    FillChar(FBufferRx, TAM_BUF_RX, 0)
  else
    FillChar(FBufferTx, TAM_BUF_TX, 0);
end;

end.
