{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 19/10/2005                                 }
{                                                       }
{*******************************************************}

unit uCtrlModeloAcesso_Rodbel;

interface

uses Windows, SysUtils, Controls, uCmDbObject, uCmControlObject, IvDictio,
  uCMTranslate, uCMClientDataSet, ComPort, uCtrlFuncoesRH, uCtrlModeloAcesso;

const
  // Códigos das partes das mensagens
  NUM_LEITOR = 0;
  START = #$FE;
  STOP = #$F0;

  // Comandos para o Leitor
  CMD_CONFIG_INI = 7;
  CMD_CONFIG_DIVERSOS = 35;
  CMD_DATA_HORA = 5;
  CMD_TRAVAR = 181; // Código fictício (somente para identificação interna no sistema)
  CMD_LIBERAR = 182; // Código fictício (somente para identificação interna no sistema)
  CMD_LIMPA_BUFFER = 11;
  CMD_DADOS_NAO_ACEITOS = 14;
  CMD_DADOS_ACEITOS = 15;
  CMD_SINAL_SONORO = 28;
  CMD_MENSAGEM = 17;
  CMD_MENSAGEM_PADRAO = 6;

  // Tamanho do Buffer para cada comando (em bytes)
  SIZE_CONFIG_INI = 1;
  SIZE_CONFIG_DIVERSOS = 8;
  SIZE_DATA_HORA = 7;
  SIZE_TRAVAR_LIBERAR = 1;
  SIZE_LIMPA_BUFFER = 0;
  SIZE_DADOS_NAO_ACEITOS = 0;
  SIZE_DADOS_ACEITOS = 0;
  SIZE_SINAL_SONORO = 1;
  SIZE_MENSAGEM = 16;
  SIZE_MENSAGEM_PADRAO = 17;
  
  // Descrição das mensagens das remotas para a central
  RET_ERRO_MEM = '13'; // Erro na memória
  RET_RESET_GERAL = '14'; // Reset geral
  RET_LEITORA_DESL = '15'; // Remota desligada
  RET_LEITORA_LIG = '16'; // Remota ligada
  RET_CONS_CARTAO_ENT = '30'; // Consulta cartão - entrada
  RET_CONS_SENHA_ENT = '31'; // Consulta por senha - entrada
  RET_CONS_CART_MESTR_ENT = '32'; // Consulta por cartão mestre - entrada
  RET_ACESSO_CONCLUIDO_ENT = '33'; // Acesso concluído - entrada
  RET_ACESSO_NAO_CONCLUIDO_ENT = '34'; // Acesso não concluído - entrada
  RET_LIB_LOCAL_ENT = '35'; // Liberação local - entrada
  RET_SENHA_INVALIDA_ENT = '36'; // Senha inválida - entrada
  RET_LEITURA_TECLADO = '37'; // Leitura do teclado
  RET_CONS_CARTAO_SAI = '50'; // Consulta cartão - saída
  RET_CONS_SENHA_SAI = '51'; // Consulta por senha - saída
  RET_CONS_CART_MESTR_SAI = '52'; // Consulta por cartão mestre - saída
  RET_ACESSO_CONCLUIDO_SAI = '53'; // Acesso concluído - saída
  RET_ACESSO_NAO_CONCLUIDO_SAI = '54'; // Acesso não concluído - saída
  RET_LIB_LOCAL_SAI = '55'; // Liberação local - saída
  RET_SENHA_INVALIDA_SAI = '56'; // Senha inválida - saída

  // Códigos dos Sinais Sonoros
  BIP_LONGO_1 = #0; // 1 longo - Acesso liberado
  BIP_LONGO_3 = #1; // 3 longos - Acesso negado
  BIP_CURTO_6 = #2; // 6 curtos - Atenção
  BIP_CONTINUO = #3; // contínuo - Alarme
  BIP_CURTO_1 = #4; // 1 curto - Leitura OK
  SILENCIO = #5; // silêncio

  // Tamanho do buffer de dados (em bytes)
  //TAM_BUF = 250;

type
  TCtrlModeloAcesso_Rodbel = class(TCtrlModeloAcesso)
  protected
    function  GetComando(const NumComando: integer): string;
    function  Enviar_Comando(const NumComando: byte): boolean; override;

    function  Receber_Dados: boolean; override;
    procedure Limpar_Buffer; reintroduce;

    procedure SetMensagemPadrao(const Valor: string); override;
  private
    FObjPorta: TComPort;
    FComando_Ultima_Leitura: integer;

    FMsg: string;
    FBuffer: string;
    FCracha: string;
    FCrachaAnterior: string;
    FStatus: string;

    procedure Montar_Mensagem(const Msg: string);

    function  Enviar_Msg_Acesso_Negado(const Msg: string): boolean;
    procedure Enviar_Bit_Acesso_Liberado;
    procedure Enviar_Bit_Acesso_Negado;

    function  CheckSum(const Endereco, NumComando, Tamanho: integer; const Texto: string): string;
    function  Formatar_Entrada: boolean;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function  Inicializar(const Porta: string; const Velocidade: integer): boolean; override;

    function  Inicializar_Dispositivo: boolean; override;
    procedure Finalizar_Dispositivo; override;

    function  Inicializar_Config: boolean; override;

    function  Enviar_DataHora: boolean;
    function  Enviar_Mensagem_Padrao: boolean; override;

    function  Enviar_Mensagem_Travar_Dispositivo: boolean; override;
    function  Enviar_Mensagem_Destravar_Dispositivo: boolean; override;
    function  Enviar_Mensagem(const Msg: string): boolean; reintroduce;
    function  Enviar_Mensagem_Cartao_Bloqueado: boolean; override;
    function  Enviar_Mensagem_Acessos_Excedidos: boolean; override;
    function  Enviar_Mensagem_Acessos_Fora_de_Hora: boolean; override;
    function  Enviar_Mensagem_Libera_Acesso(const NumCartao: string;
      const Saldo: integer): boolean; override;
    function  Enviar_Mensagem_Acesso_Dia_Folga: boolean; override;
    function  Enviar_Mensagem_Pessoa_Desligada: boolean; override;
    function  Enviar_Mensagem_Pessoa_Afastada: boolean; override;
    function  Enviar_Mensagem_Cracha_Invalido: boolean; override;

    function  Interrogacao: string; override;

    property Cracha: string read FCracha write FCracha;
    property Status: string read FStatus write FStatus;
  end;

implementation

uses StrUtils, uSistema, uMensErro, uCmCustomCdbObject;

{ TCtrlModeloAcesso_Rodbel }

function NumStringToBCD(const inStr: string): string;
  function Pack(ch1, ch2: Char): Char;
  begin
    Assert((ch1 >= '0') and (ch1 <= '9'));
    Assert((ch2 >= '0') and (ch2 <= '9'));
    {Ord('0') is $30, so we can just use the low nybble of the character as value.}
    Result := Chr((Ord(ch1) and $F) or ((Ord(ch2) and $F) shl 4))
  end;
var
  i: Integer;
begin
  if Odd(Length(inStr)) then
    Result := NumStringToBCD('0' + instr)
  else
  begin
    SetLength(Result, Length(inStr) div 2);
    for i:=1 to Length(Result) do
      Result[i] := Pack(inStr[2 * i - 1], inStr[2 * i]);
  end;
end;

function BCDToNumString(const inStr: string): string;
  procedure UnPack(ch: Char; var ch1, ch2: Char);
  begin
    ch1 := Chr((Ord(ch) and $F) + $30);
    ch2 := Chr(((Ord(ch) shr 4) and $F) + $30);
    Assert((ch1 >= '0') and (ch1 <= '9'));
    Assert((ch2 >= '0') and (ch2 <= '9'));
  end;
var
  i: Integer;
begin
  SetLength(Result, Length(inStr) * 2);
  for i:=1 to Length(inStr) do
  try
    UnPack(inStr[i], Result[2 * i - 1], Result[2 * i]);
  except
  end;
end;

constructor TCtrlModeloAcesso_Rodbel.Create;
begin
  inherited;
  FObjPorta := TComPort.Create(nil);
  FCrachaAnterior := '';
end;

destructor TCtrlModeloAcesso_Rodbel.Destroy;
begin
  FObjPorta.Free;
  inherited;
end;

function TCtrlModeloAcesso_Rodbel.Inicializar(const Porta: string;
  const Velocidade: integer): boolean;
begin
  Result := inherited Inicializar(Porta, Velocidade);
  if not(Result) then
    exit;

  Result := Inicializar_Dispositivo;
  if not(Result) then
    exit;

  Sleep(300);
  Result := Inicializar_Config;
  if not(Result) then
    exit;

  Sleep(300);
  Result := Enviar_Mensagem_Padrao;

  FComando_Ultima_Leitura := CMD_DADOS_NAO_ACEITOS;
end;

function TCtrlModeloAcesso_Rodbel.Inicializar_Dispositivo: boolean;
begin
  inherited Inicializar_Dispositivo;

  if not(FDispositivo_Inicializado) then
  begin
    if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
      FLog.Add('[' +TimeToStr(Time)+ '] - Abrindo porta ' +FPorta+ '...');

    try
      FObjPorta.DeviceName := FPorta;
      FObjPorta.Open;

      FDispositivo_Inicializado := true;
    except
      on E: Exception do
      begin
        MessageInfo := CMTranslate('Ocorreu um erro ao abrir porta de comunicação.') +
          CR_LF+ CMTranslate('Erro: ') + E.Message;
        FDispositivo_Inicializado := false;
      end;
    end;
  end;

  Limpar_Buffer;

  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
    FLog.Add('[' +TimeToStr(Time)+ '] - Porta Aberta: ' +UpperCase(BoolToStr(FObjPorta.Active, true)));

  Result := FDispositivo_Inicializado;
end;

procedure TCtrlModeloAcesso_Rodbel.Finalizar_Dispositivo;
begin
  if (FDispositivo_Inicializado) then
  begin
    FObjPorta.Close;

    if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
      FLog.Add('Porta Fechada: ' +UpperCase(BoolToStr(not(FObjPorta.Active), true)));
  end;
  inherited;
end;

function TCtrlModeloAcesso_Rodbel.Inicializar_Config: boolean;
begin
  Result := inherited Inicializar_Config;
  if not(Result) then
    exit;

  // Enviar a configuração do Tipo do Leitor
  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
    FLog.Add('[' +TimeToStr(Time)+ '] - Enviando configurações iniciais para o leitor...');

  FBuffer := NumStringToBCD('13'); // Catraca óptica bidirecional	independente do leitor
  Result := Enviar_Comando(CMD_CONFIG_INI);
  if not(Result) then
    exit;

  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
  begin
    FLog.Add('[' +TimeToStr(Time)+ '] - Configurações iniciais enviadas.');
    FLog.Add('Conteúdo: ' + CodAscii(FMsg));
  end;

{  Sleep(100);

  // Enviar a configuração de parâmetros diversos
  FBuffer :=
    #0 + // Tipo de Liberação Local da Entrada (Liberar Todos os Cartões)
    #0 + // Tipo de Liberação Local da Saída (Liberar Todos os Cartões)
    #0 + // Desabilitar Consulta por Senha
    #0 + // Desabilitar Consulta por Cartão Mestre
    #0 + // Entrar em Modo de Liberação Local, no Caso de Falha de Comunicação
    #0 + // Lista Local de Permissões
    #0 + // Número Exato de Dígitos do Cartão (00 - Aceita Qualquer Cartão)
    #0;  // Tipo de Leitor (Utilizar Sempre 00)
  Result := Enviar_Comando(CMD_CONFIG_DIVERSOS);
  if not(Result) then
    exit;}

  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
    FLog.Add('[' +TimeToStr(Time)+ '] - Enviando configurações diversas para o leitor...');

  FBuffer := #1;
  Result := Enviar_Comando(CMD_CONFIG_INI);
  if not(Result) then
    exit;

  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
  begin
    FLog.Add('[' +TimeToStr(Time)+ '] - Configurações diversas enviadas.');
    FLog.Add('Conteúdo: ' + CodAscii(FMsg));
  end;

  Sleep(300);

  // Enviar a Data e a Hora para o Leitor
  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
    FLog.Add('[' +TimeToStr(Time)+ '] - Enviando data e hora para o leitor...');

  Result := Enviar_DataHora;
  if not(Result) then
    exit;

  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
  begin
    FLog.Add('[' +TimeToStr(Time)+ '] - Data e hora enviados.');
    FLog.Add('Conteúdo: ' + CodAscii(FMsg));
  end;
end;

procedure TCtrlModeloAcesso_Rodbel.SetMensagemPadrao(const Valor: string);
begin
  FMensagemPadrao := Alinha(Valor, SIZE_MENSAGEM, 'E', ' ');
end;

function TCtrlModeloAcesso_Rodbel.GetComando(const NumComando: integer): string;
begin
  case (NumComando) of
    CMD_CONFIG_INI          : Result := 'CMD_CONFIG_INI';
    CMD_CONFIG_DIVERSOS     : Result := 'CMD_CONFIG_DIVERSOS';
    CMD_DATA_HORA           : Result := 'CMD_DATA_HORA';
    CMD_TRAVAR              : Result := 'CMD_TRAVAR';
    CMD_LIBERAR             : Result := 'CMD_LIBERAR';
    CMD_LIMPA_BUFFER        : Result := 'CMD_LIMPA_BUFFER';
    CMD_DADOS_NAO_ACEITOS   : Result := 'CMD_DADOS_NAO_ACEITOS';
    CMD_DADOS_ACEITOS       : Result := 'CMD_DADOS_ACEITOS';
    CMD_SINAL_SONORO        : Result := 'CMD_SINAL_SONORO';
    CMD_MENSAGEM            : Result := 'CMD_MENSAGEM';
    CMD_MENSAGEM_PADRAO     : Result := 'CMD_MENSAGEM_PADRAO';
    else                      Result := '>> NENHUM <<';
  end;
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Comando(const NumComando: byte): boolean;
var
  sStatusMsg: string;
  sCheckSum: string;
  iNumComando: byte;
  iTamBuffer: byte; // Tamanho do buffer a ser transmitido (em Bytes)
begin
  Result := inherited Enviar_Comando(NumComando);
  if not(Result) then
    exit;
  
  iNumComando := NumComando;
  // Selecionar o tamanho do buffer
  case (iNumComando) of
    CMD_CONFIG_INI          : iTamBuffer := SIZE_CONFIG_INI;
    CMD_CONFIG_DIVERSOS     : iTamBuffer := SIZE_CONFIG_DIVERSOS;
    CMD_DATA_HORA           : iTamBuffer := SIZE_DATA_HORA;
    CMD_TRAVAR              :
    begin
      iNumComando := 18;
      FBuffer := string(#0);
      iTamBuffer := SIZE_TRAVAR_LIBERAR;
    end;
    CMD_LIBERAR             :
    begin
      iNumComando := 18;
      FBuffer := string(#1);
      iTamBuffer := SIZE_TRAVAR_LIBERAR;
    end;
    CMD_LIMPA_BUFFER        :
    begin
      iTamBuffer := SIZE_LIMPA_BUFFER;
      FBuffer := '';
    end;
    CMD_DADOS_NAO_ACEITOS   :
    begin
      iTamBuffer := SIZE_DADOS_NAO_ACEITOS;
      FBuffer := '';
    end;
    CMD_DADOS_ACEITOS       :
    begin
      iTamBuffer := SIZE_DADOS_ACEITOS;
      FBuffer := '';
    end;
    CMD_SINAL_SONORO        : iTamBuffer := SIZE_SINAL_SONORO;
    CMD_MENSAGEM            : iTamBuffer := SIZE_MENSAGEM;
    CMD_MENSAGEM_PADRAO     : iTamBuffer := SIZE_MENSAGEM_PADRAO;
    else iTamBuffer := 0;
  end;

  try
    // Montar o Check-Sum da mensagem a ser enviada
    sCheckSum := CheckSum(NUM_LEITOR, iNumComando, iTamBuffer, FBuffer);

    // Montar o comando propriamente dito na forma descrita abaixo:
    // Número do Leitor + Código do Comando + Tamanho da Mensagem + Dados da Mensagem
    FMsg := Chr(NUM_LEITOR) + Chr(iNumComando)+ Chr(iTamBuffer) + FBuffer;

    // Adicionar os caracteres de controle e segurança da mensagem
    FMsg := START + FMsg + sCheckSum + STOP;

    // Enviar a mensagem para o Leitor
    FObjPorta.WriteString(FMsg);

    sStatusMsg := 'OK';
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
      sStatusMsg := 'ERRO';
    end;
  end;

  // Receber resposta do leitor caso exista
  if (Result) then
    Result := Receber_Dados;

  if (FGerarLog = GERAR_LOG_COMPLETO) or (NumComando in [CMD_TRAVAR, CMD_LIBERAR]) then
    FLog.Add(
      '[' +sStatusMsg+ '] '+
      'Msg(' +GetComando(NumComando)+ ',' +IntToStr(iTamBuffer)+ '): ' +CodAscii(FMsg)+ ' - '+
      'Retorno = '+ IFF(Trim(FBuffer)='', CMTranslate('NADA'),
        CodAscii(FBuffer) +' ('+ BCDToNumString(FBuffer) +')'));
end;

// *****************************************************
// Montar a mensagem a ser exibida pelo leitor
// -----------------------------------------------------
// Msg: Mensagem que será mostrada
procedure TCtrlModeloAcesso_Rodbel.Montar_Mensagem(const Msg: string);
begin
  FBuffer := Alinha(Msg, SIZE_MENSAGEM, 'E', ' ');
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Mensagem_Travar_Dispositivo: boolean;
begin
  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
    FLog.Add('Travando Dispositivo');
  Result := Enviar_Comando(CMD_TRAVAR);
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Mensagem_Destravar_Dispositivo: boolean;
begin
  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
    FLog.Add('Liberando Dispositivo');
  Result := Enviar_Comando(CMD_LIBERAR);
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Mensagem(const Msg: string): boolean;
begin
  Result := inherited Enviar_Mensagem;
  if not(Result) then
    exit;

  // Formatar a mensagem
  Montar_Mensagem(Msg);
  // Enviar a mensagem à leitora
  Result := Enviar_Comando(CMD_MENSAGEM);

  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
    FLog.Add('[' +TimeToStr(Time)+ '] - Mensagem enviada: "' +Msg+ '"');
end;

procedure TCtrlModeloAcesso_Rodbel.Enviar_Bit_Acesso_Liberado;
begin
  FBuffer := BIP_LONGO_1;
  Enviar_Comando(CMD_SINAL_SONORO);
end;

procedure TCtrlModeloAcesso_Rodbel.Enviar_Bit_Acesso_Negado;
begin
  FBuffer := BIP_LONGO_3;
  Enviar_Comando(CMD_SINAL_SONORO);
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Mensagem_Padrao: boolean;
begin
  Result := inherited Enviar_Mensagem_Padrao;
  if not(Result) then
    exit;
  
  // Formatar a mensagem
  FBuffer := #0 + FMensagemPadrao;
  // Enviar a mensagem ao leitor
  Result := Enviar_Comando(CMD_MENSAGEM_PADRAO);

  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
    FLog.Add('[' +TimeToStr(Time)+ '] - Mensagem padrão enviada: "' +FMensagemPadrao+ '"');
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Msg_Acesso_Negado(const Msg: string): boolean;
begin
  Result := Enviar_Mensagem_Travar_Dispositivo;
  if not(Result) then
    exit;

  Result := Enviar_Mensagem(Msg);
  if not(Result) then
    exit;

  Sleep(FTempoMsg);
  Result := Enviar_Mensagem_Padrao;
  if not(Result) then
    exit;

  Sleep(25);
  Enviar_Bit_Acesso_Negado;
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Mensagem_Cartao_Bloqueado: boolean;
begin
  Result := Enviar_Msg_Acesso_Negado('Cartao Bloqueado');
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Mensagem_Acessos_Excedidos: boolean;
begin
  Result := Enviar_Msg_Acesso_Negado('Acessos Excedidos');
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Mensagem_Acessos_Fora_de_Hora: boolean;
begin
  Result := Enviar_Msg_Acesso_Negado('Acesso Fora Hora');
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Mensagem_Libera_Acesso(const NumCartao: string;
  const Saldo: integer): boolean;
var
  sNumCartao: string;
begin
  Result := Enviar_Mensagem_Destravar_Dispositivo;
  if not(Result) then
    exit;

  sNumCartao := Copy(NumCartao, FColDocumento, FTamDocumento);

  if (Saldo > 0) then
    Result := Enviar_Mensagem(CMTranslate('Saldo ')+ IntToStr(Saldo) +' '+ sNumCartao)
  else
    Result := Enviar_Mensagem(CMTranslate('Liberado ')+ sNumCartao);
  if not(Result) then
    exit;

  Sleep(FTempoAcesso);
  Result := Enviar_Mensagem_Padrao;
  if not(Result) then
    exit;

  Sleep(25);
  Enviar_Bit_Acesso_Liberado;
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Mensagem_Acesso_Dia_Folga: boolean;
begin
  Result := Enviar_Msg_Acesso_Negado('Acesso Dia Folga');
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Mensagem_Pessoa_Desligada: boolean;
begin
  Result := Enviar_Msg_Acesso_Negado('Pessoa Desligada');
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Mensagem_Pessoa_Afastada: boolean;
begin
  Result := Enviar_Msg_Acesso_Negado('Pessoa Afastada');
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Mensagem_Cracha_Invalido: boolean;
begin
  Result := Enviar_Msg_Acesso_Negado('Cracha Invalido');
end;

// *****************************************************
// Enviar a Data e Hora para o leitor
// -----------------------------------------------------
function TCtrlModeloAcesso_Rodbel.Enviar_DataHora: boolean;
var
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

  FBuffer := NumStringToBCD(
    IntToStr(iDia1 * 16 + iDia2) +
    IntToStr(iMes1 * 16 + iMes2) +
    IntToStr(iAno1 * 16 + iAno2) +
    IntToStr(DayOfWeek(Date) * 16 + iAnoB) +
    IntToStr(iHor1 * 16 + iHor2) +
    IntToStr(iMin1 * 16 + iMin2) +
    IntToStr(iSeg1 * 16 + iSeg2));
  Result := Enviar_Comando(CMD_DATA_HORA);
end;

function TCtrlModeloAcesso_Rodbel.Receber_Dados: boolean;
var
  cCaracterLido: char;
begin
  inherited Receber_Dados;
  FBuffer := '';
  try
    while (FObjPorta.InputCount <> 0) do
    begin
      cCaracterLido := FObjPorta.ReadChar;
      FBuffer := FBuffer + string(cCaracterLido);
    end;
    FBuffer := Trim(FBuffer);
    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;

function TCtrlModeloAcesso_Rodbel.Interrogacao: string;
var
  iGerarLog: integer;
  sLog: string;
begin
  inherited Interrogacao;
  Result := '';
  sLog := '';
  FCracha := '';

  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
    sLog := Replicate('-',30) +CR_LF+ '[' +TimeToStr(Time)+ '] - Interrogacao';

  // Função de transmissão da mensagem
  if not(Enviar_Comando(FComando_Ultima_Leitura)) then
  begin
    if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
      sLog := sLog +CR_LF+ '[' +TimeToStr(Time)+ '] - Erro ao enviar o comando ' +
        GetComando(FComando_Ultima_Leitura);

    exit;
  end;

  FSentidoPassagem := tpsIndiferente;

  // Tratamento dos dados recebidos do leitor
  if (FBuffer <> '') then
  begin
    if (Pos(#254, FBuffer) > 0) then
    begin
      if (Length(FBuffer) = 20) and (Formatar_Entrada) then // Resposta Ok, não vazia
      begin
        iGerarLog := FGerarLog;
        FGerarLog := NAO_GERAR_LOG;
        Enviar_Mensagem_Travar_Dispositivo; // Travar a passagem enquanto o cartão não é verificado
        FGerarLog := iGerarLog;

        if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
          sLog := sLog +CR_LF+
            '[' +TimeToStr(Time)+ '] - Resposta Ok, não vazia' +CR_LF+
            'Buffer: ' + FBuffer +' - Crachá: '+ FCracha +' - Status: '+ FStatus;

        if (FCracha = Replicate('0',16)) or
           ((FCrachaAnterior = FCracha) and
            ((FStatus = RET_ACESSO_CONCLUIDO_ENT) or (FStatus = RET_ACESSO_CONCLUIDO_ENT))) then
        begin
          sLog := sLog +CR_LF+
            'Resposta não enviada para a tela do sistema. Status: "' +FStatus +'"';
          FBuffer := '';
          FCracha := '';
          FStatus := '';
        end
        else
          FCrachaAnterior := FCracha;

        FComando_Ultima_Leitura := CMD_DADOS_ACEITOS;
      end
      else // Resposta Ok, vazia
      begin
        iGerarLog := FGerarLog;
        FGerarLog := NAO_GERAR_LOG;
        Enviar_Mensagem(FMensagemPadrao);
        FGerarLog := iGerarLog;

        FComando_Ultima_Leitura := CMD_DADOS_NAO_ACEITOS;

        if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
          sLog := sLog +CR_LF+ '[' +TimeToStr(Time)+ '] - Resposta Ok, vazia';
      end;
    end
    else // Erro na resposta
    begin
      FComando_Ultima_Leitura := CMD_DADOS_NAO_ACEITOS;

      if (FGerarLog = GERAR_LOG_COMPLETO) then
        sLog := sLog +CR_LF+ '[' +TimeToStr(Time)+ '] - Erro na resposta';
    end;
  end
  else // Não há resposta
  begin
    iGerarLog := FGerarLog;
    FGerarLog := NAO_GERAR_LOG;
    Enviar_Mensagem_Padrao;
    FGerarLog := iGerarLog;

    FComando_Ultima_Leitura := CMD_DADOS_NAO_ACEITOS;

    if (FGerarLog = GERAR_LOG_COMPLETO) then
      sLog := sLog +CR_LF+ '[' +TimeToStr(Time)+ '] - Sem resposta';
  end;

  Result := FCracha;

  // Se o Log for completo, adicionar as linhas ao mesmo. Se for o incompleto, só adicionar
  // estas linhas caso tenha sido lido algum Crachá. 
  if (FGerarLog = GERAR_LOG_COMPLETO) or
     ((FGerarLog = GERAR_LOG_SIMPLES) and (FCracha <> '')) then
    FLog.Add(sLog);
end;

function TCtrlModeloAcesso_Rodbel.Formatar_Entrada: boolean;
var
  sAux: string;
  nVl1, nVl2, nVl3, c: integer;
begin
  sAux := '';
  for c:=2 to 18 do
  begin
    nVl1 := Ord(Copy(FBuffer,c,1)[1]);
    if (nVl1 < 16) then
    begin
      sAux := sAux + FormatFloat('00', nVl1);
      if (c <> 3) and (c <> 4) and (nVl1 > 9) then
      begin
        Result := false;
        exit;
      end;
    end
    else
    begin
      nVl2 := Round(nVl1 / 16);
      nVl3 := (nVl1 mod 16);
      if (c <> 3) and (c <> 4) and (nVl2 > 9) or (nVl3 > 9) then
      begin
        Result := false;
        exit;
      end;

      sAux := sAux + FormatFloat('0',nVl2) + FormatFloat('0',nVl3);
    end;
  end;

  // Obter somente os dados do crachá da mensagem de retorno
  FCracha := Copy(sAux, 7, 16);
  // Obter o número do crachá de acordo com o especificado na tela de parâmetros
  //FCracha := Copy(FCracha, FColDocumento, FTamDocumento);
  // Obter o status da mensagem de retorno
  FStatus := Copy(sAux, 33, 2);
  
  Result := true;
end;

procedure TCtrlModeloAcesso_Rodbel.Limpar_Buffer;
begin
  FBuffer := '';
  Enviar_Comando(CMD_LIMPA_BUFFER);
end;

function TCtrlModeloAcesso_Rodbel.CheckSum(const Endereco, NumComando, Tamanho: integer;
  const Texto: string): string;
var
  iCheck, c: integer;
  bCheck: byte;
begin
  iCheck := (Endereco xor NumComando);
  iCheck := (iCheck xor Tamanho);
  for c:=1 to Length(Texto) do
    iCheck := (iCheck xor Ord(Texto[c]));

  bCheck := (iCheck and Ord(Chr($7F)));
  Result := Chr(bCheck);
end;

end.
