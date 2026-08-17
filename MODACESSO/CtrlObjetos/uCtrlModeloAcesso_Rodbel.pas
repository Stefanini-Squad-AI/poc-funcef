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
   uCMClientDataSet, prjProtocoloRB_TLB, uCtrlFuncoesRH, uCtrlModeloAcesso;

const
  // Códigos das partes das mensagens
  NUM_LEITOR = 0;
  START = #$FE;
  STOP = #$F0;

  // Comandos para o Leitor
  CMD_CONFIG_INI = 7;
 //* CMD_CONFIG_DIVERSOS = 35;
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
 // Respostas das mensagens enviadas ao leitor


   TComando = (
    Cmd_Tipo_Acionamento, Cmd_Config_Violacao, Cmd_Config_Diversos, Cmd_Config_Data,
   //* Cmd_Travar, Cmd_Liberar, Cmd_Dados_Nao_Aceitos,Cmd_Dados_Aceitos,
    Cmd_Bip_Liberado, Cmd_Bip_Negado);
    //* , Cmd_Mensagem,Cmd_Mensagem_Padrao


 

  TCtrlModeloAcesso_Rodbel = class(TCtrlModeloAcesso)
  protected
  //*  function  GetComando(const NumComando: Tcomando): string;
    function  GetStringStatus: string;
    function  Enviar_Comando(const NumComando: TComando): boolean;


    function  Receber_Dados: boolean; override;

    procedure SetMensagemPadrao(const Valor: string); override;
  private
    FObjPorta: TcRBDll;

    FBuffer: string;
    FCracha: string;
    FStatus: String;
    FMsg: string;
    
    FCrachaAnterior: string;
   

    FComando_Ultima_Leitura: Integer;    
    FUltimaMsg: FuncaoRelogio;

    function Enviar_Msg_Acesso_Negado(const Msg: string): boolean;
    function Enviar_Bip_Acesso_Liberado: boolean;
    function Enviar_Bip_Acesso_Negado: boolean;
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
    function  GetStringComando(const NumComando: Tcomando): string;

    function  Interrogacao: string; override;

    property Cracha: string read FCracha write FCracha;
    property Status: string read FStatus write FStatus;
  end;

implementation

uses  uSistema, uMensErro, uCmCustomCdbObject;


const
  MSG_FALHA_COMUNICACAO_DISP =
    'Ocorreu uma falha na comunicação com o Dispositivo:1'+
    'Verifique-o e tente novamente.';

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

{ TCtrlModeloAcesso_Rodbel }

constructor TCtrlModeloAcesso_Rodbel.Create;
begin
  inherited;
  FObjPorta := TcRBDll.Create(nil);
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

  Sleep(30);
  Result := Inicializar_Config;
  if not(Result) then
    exit;

  Sleep(30);
  Result := Enviar_Mensagem_Padrao;
  if not(Result) then
    exit;

  Sleep(30);
  Result := Enviar_Mensagem_Travar_Dispositivo;

  FComando_Ultima_Leitura := Cmd_Dados_Nao_Aceitos;
end;

function TCtrlModeloAcesso_Rodbel.Inicializar_Dispositivo: boolean;
begin
  AddLog('Abrindo porta ' +FPorta+ '...');

  Result := inherited Inicializar_Dispositivo;
  if (Result) then
  begin
    try
      // Caso a porta já esteja aberta, a mesma deve ser fechada
      if (FObjPorta.PortOpen) then
        FObjPorta.ClosePort;

      // Iniciar a porta com os valores padrão:
      // Velocidade da Comunicação = 9600
      // Paridade = N (Nenhuma)
      // Tamanho da palavra = 8
      // Número de Stop bits = 1
      FObjPorta.InitComPort(GetNumPorta, 9600, 'N', 8, '1');
      FDispositivo_Inicializado := true;
//      if not(FDispositivo_Inicializado) then
//        raise Exception.Create(CMTranslate('Não Foi Possível Abrir a Porta Indicada.') +CR_LF+
//          CMTranslate('Verifique se não há outro programa utilizando-a e tente novamente.'));
    except
      on E: Exception do
      begin
        MessageInfo := CMTranslate('Ocorreu um erro ao abrir porta de comunicação.') +
          CR_LF+ CMTranslate('Erro: ') + E.Message;
        FMsgErro := MessageInfo;
        FDispositivo_Inicializado := false;
      end;
    end;
  end;

  Result := FDispositivo_Inicializado;
  if (Result) then
    AddOkFinalUltimaLinhaLog
  else
    AddErroFinalUltimaLinhaLog;
end;

procedure TCtrlModeloAcesso_Rodbel.Finalizar_Dispositivo;
begin
  AddLog('Fechando Porta ' +FPorta+ '...');

  if (FDispositivo_Inicializado) then
  begin
    FObjPorta.ClosePort;
    AddOkFinalUltimaLinhaLog;
    inherited;
  end
  else
  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
    FLog[FLog.Count-1] := FLog[FLog.Count-1] +CMTranslate('A Porta Já Está Fechada.');
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
  //*Result := Enviar_Comando(CMD_CONFIG_INI);
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
 //* Result := Enviar_Comando(CMD_CONFIG_INI);
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

function TCtrlModeloAcesso_Rodbel.GetStringComando(const NumComando: Tcomando): string;
begin
  case (NumComando) of
    Cmd_Tipo_Acionamento    : Result := 'Cmd_Tipo_Acionamento';
    Cmd_Config_Violacao     : Result := 'Cmd_Config_Violacao';
    Cmd_Config_Diversos     : Result := 'Cmd_Config_Diversos';
    Cmd_Config_Data         : Result := 'Cmd_Config_Data';
   //* Cmd_Travar              : Result := 'Cmd_Travar';
   //* Cmd_Liberar             : Result := 'Cmd_Liberar';
   //* Cmd_Dados_Nao_Aceitos   : Result := 'Cmd_Dados_Nao_Aceitos';
   //* Cmd_Dados_Aceitos       : Result := 'Cmd_Dados_Aceitos';
    Cmd_Bip_Liberado        : Result := 'Cmd_Bip_Liberado';
    Cmd_Bip_Negado          : Result := 'Cmd_Bip_Negado';
  //*  Cmd_Mensagem            : Result := 'Cmd_Mensagem';
  //*  Cmd_Mensagem_Padrao     : Result := 'Cmd_Mensagem_Padrao';
    else                      Result := '>> NENHUM <<';
  end;
end;

function TCtrlModeloAcesso_Rodbel.GetStringStatus: string;
begin
  //*case (FStatus) of
   //*  ErroMemoria           : Result := 'ErroMemoria';
   //*  ResetGeral            : Result := 'ResetGeral';
   //*  RemotaDesligada       : Result := 'RemotaDesligada';
    //* RemotaLigada          : Result := 'RemotaLigada';
   //*  ViolacaoEntrada       : Result := 'ViolacaoEntrada';
    //* ViolacaoSaida         : Result := 'ViolacaoSaida';
    //* ConCartaoEntrada      : Result := 'ConCartaoEntrada';
    //* ConSenhaEntrada       : Result := 'ConSenhaEntrada';
     //*ConMestreEntrada      : Result := 'ConMestreEntrada';
     //*AcConcluidoEntrada    : Result := 'AcConcluidoEntrada';
     //*AcNaoConcluidoEntrada : Result := 'AcNaoConcluidoEntrada';
    //* LibLocalEntrada       : Result := 'LibLocalEntrada';
    //* SenhaInvalidaEntrada  : Result := 'SenhaInvalidaEntrada';
     //*LeituraTeclado        : Result := 'LeituraTeclado';
    //* ConCartaoSaida        : Result := 'ConCartaoSaida';
    //* ConSenhaSaida         : Result := 'ConSenhaSaida';
     //*ConMestreSaida        : Result := 'ConMestreSaida';
    //* AcConcluidoSaida      : Result := 'AcConcluidoSaida';
    //* AcNaoConcluidoSaida   : Result := 'AcNaoConcluidoSaida';
    //* LibLocalSaida         : Result := 'LibLocalSaida';
    //* SenhaInvalidaSaida    : Result := 'SenhaInvalidaSaida';
    //*else                    Result := '>> NENHUM <<';
  //*end;
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Comando(const NumComando: TComando): boolean;
begin
  // Enviar a mensagem ao leitor
  try
    case (NumComando) of
      Cmd_Tipo_Acionamento  : FObjPorta.rtTipoAcionamento(NUM_LEITOR, CatracaBidirecionalIndepSensor);
      Cmd_Config_Violacao   : FObjPorta.rtTipoViolacao(NUM_LEITOR, NaoSinaliza, NaoSinaliza);
      Cmd_Config_Diversos   : FObjPorta.rtParametros(NUM_LEITOR, LiberaTodosCartoes, LiberaTodosCartoes, Desabilitada, Desabilitada, ListaBloqueios, 0);
      Cmd_Config_Data       : FObjPorta.rtAtualizaData(NUM_LEITOR);
     //* Cmd_Travar            : FObjPorta.rtEnviaLiberacao(NUM_LEITOR, NaoLiberaAcesso, '', '', LiberaEntrada);
     //* Cmd_Liberar           : FObjPorta.rtEnviaLiberacao(NUM_LEITOR, LiberaAcesso, '', '', LiberaAmbos);
     //* Cmd_Dados_Nao_Aceitos : FObjPorta.rtColetaMantendo(NUM_LEITOR);
     //* Cmd_Dados_Aceitos     : FObjPorta.rtColetaEliminando(NUM_LEITOR);
      Cmd_Bip_Liberado      : FObjPorta.rtEnviaSinalSonoro(NUM_LEITOR, AcessoLiberado);
      Cmd_Bip_Negado        : FObjPorta.rtEnviaSinalSonoro(NUM_LEITOR, AcessoNegado);
     //* Cmd_Mensagem          : FObjPorta.rtEnviaMsg(NUM_LEITOR, FBuffer);
     //* Cmd_Mensagem_Padrao   : FObjPorta.baProgramaMsg(NUM_LEITOR, Padrao, FMensagemPadrao);
    end;
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
  
  // Receber resposta do leitor caso exista
  if (Result) then
    Result := Receber_Dados;

  //*if (FGerarLog = GERAR_LOG_COMPLETO) or (NumComando in [Cmd_Travar, Cmd_Liberar]) then
  //*  FLog.Add(
  //*    '[' +TimeToStr(Time)+ IFF(Result, ' >>OK<< ', ' >>ERRO<< ')+ '] '+
  //*    'Msg(' +GetStringComando(NumComando)+ '): Retorno = '+
   //*   IFF(not(Result), MessageInfo,
   //*     IFF(Trim(FBuffer)='', CMTranslate('NADA'), FBuffer)));
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Mensagem_Travar_Dispositivo: boolean;
begin
  AddLog('Travando Dispositivo...');

  //*Result := Enviar_Comando(Cmd_Travar);
  if (Result) then
    AddOkFinalUltimaLinhaLog
  else
    AddErroFinalUltimaLinhaLog;
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Mensagem_Destravar_Dispositivo: boolean;
begin
  AddLog('Liberando Dispositivo...');

 //* Result := Enviar_Comando(Cmd_Liberar);
  if (Result) then
    AddOkFinalUltimaLinhaLog
  else
    AddErroFinalUltimaLinhaLog;
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Mensagem(const Msg: string): boolean;
begin
  AddLog('Enviando Mensagem: "' +Msg+ '"...');

  Result := inherited Enviar_Mensagem;
  if (Result) then
  begin
    // Formatar a mensagem
    FBuffer := Alinha(Msg, SIZE_MENSAGEM, 'E', ' ');
    // Enviar a mensagem à leitora
    //*Result := Enviar_Comando(Cmd_Mensagem);
  end;

  if (Result) then
    AddOkFinalUltimaLinhaLog
  else
    AddErroFinalUltimaLinhaLog;
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Bip_Acesso_Liberado: boolean;
begin
  AddLog('Enviando BIP de Acesso Liberado...');

  Result := Enviar_Comando(Cmd_Bip_Liberado);
  if (Result) then
    AddOkFinalUltimaLinhaLog
  else
    AddErroFinalUltimaLinhaLog;
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Bip_Acesso_Negado: boolean;
begin
  AddLog('Enviando BIP de Acesso Negado...');

  Result := Enviar_Comando(Cmd_Bip_Negado);
  if (Result) then
    AddOkFinalUltimaLinhaLog
  else
    AddErroFinalUltimaLinhaLog;
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Mensagem_Padrao: boolean;
begin
  AddLog('Enviando Mensagem Padrão: "' +FMensagemPadrao+ '"...');

  Result := inherited Enviar_Mensagem_Padrao;
  if (Result) then
  begin
    // Formatar a mensagem
    FBuffer := #0 + FMensagemPadrao;
    // Enviar a mensagem ao leitor
    //*Result := Enviar_Comando(Cmd_Mensagem_Padrao);
  end;
  
  if (Result) then
    AddOkFinalUltimaLinhaLog
  else
    AddErroFinalUltimaLinhaLog;
end;

function TCtrlModeloAcesso_Rodbel.Enviar_Msg_Acesso_Negado(const Msg: string): boolean;
begin
  AddLog('Enviando Mensagem de Acesso Negado: "' +Msg+ '"...');

  Result := Enviar_Bip_Acesso_Negado;
  Sleep(25);
  if (Result) then
  begin
    Result := Enviar_Mensagem_Travar_Dispositivo;
    if (Result) then
    begin
      Result := Enviar_Mensagem(Msg);
{      if (Result) then
      begin
        Sleep(FTempoMsg);
        Result := Enviar_Mensagem_Padrao;
      end;}
    end;
  end;
      
  if (Result) then
    AddOkFinalUltimaLinhaLog
  else
    AddErroFinalUltimaLinhaLog;
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
  sMsg: string;
begin
  // Montagem da mensagem
  sMsg := Copy(NumCartao, FColDocumento, FTamDocumento);
  if (Saldo > 0) then
    sMsg := CMTranslate('Saldo ')+ IntToStr(Saldo) +' '+ sMsg
  else
    sMsg := CMTranslate('Liberado ')+ sMsg;

  AddLog('Enviando Mensagem de Acesso Liberado: "' +sMsg+ '"...');

  Result := Enviar_Bip_Acesso_Liberado;
  Sleep(25);
  if (Result) then
  begin
    Result := Enviar_Mensagem_Destravar_Dispositivo;
    if (Result) then
    begin
      Result := Enviar_Mensagem(sMsg);
{      if (Result) then
      begin
        Sleep(FTempoAcesso);
        Result := Enviar_Mensagem_Padrao;
      end;}
    end;
  end;
      
  if (Result) then
    AddOkFinalUltimaLinhaLog
  else
    AddErroFinalUltimaLinhaLog;
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

function TCtrlModeloAcesso_Rodbel.Receber_Dados: boolean;
var
  iRetornoDados: integer;
begin
  try
    AddLog('Recebendo Dados...');

    FUltimaMsg := MensagemNaoTemDados;
    FBuffer := '';
    FCracha := '';
    //*FStatus := RemotaLigada;
    Result := inherited Receber_Dados;
    if (Result) then
    begin
      iRetornoDados := FObjPorta.chegaramDadosRelogio(NUM_LEITOR);
      if (iRetornoDados = OK) then
      begin
        FUltimaMsg := FObjPorta.getFuncaoRelogio(NUM_LEITOR);
        if (FUltimaMsg = MensagemTemDados) then
        begin
          FBuffer := FObjPorta.getDadosRelogio(NUM_LEITOR);
          // Obter somente os dados do crachá da mensagem de retorno
          FCracha := Copy(FBuffer, 1, 16);
          // Obter o status da mensagem de retorno
       //*   FStatus := TStatusMsg(StrToInt(Copy(FBuffer, 27, 2)));
        end
        else
          Result := false;
      end
      else
      if (iRetornoDados = Erro) then
        raise Exception.Create(CMTranslateMsg(MSG_FALHA_COMUNICACAO_DISP, [CR_LF]));
        //if not(Inicializar(FPorta, FVelocidade)) then
        //  raise Exception.Create(MessageInfo);
    end;

    if (Result) then
      AddOkFinalUltimaLinhaLog
    else
      AddErroFinalUltimaLinhaLog;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlModeloAcesso_Rodbel.Interrogacao: string;
var
  sLog: string;
begin
  inherited Interrogacao;

  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
    sLog := Replicate('-',30) +CR_LF+ '[' +TimeToStr(Time)+ '] - Interrogação'
  else
    sLog := '';

  // Ler passada do crachá
  //*if not(Enviar_Comando(FComando_Ultima_Leitura)) then
  begin
    if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
     //* sLog := sLog +CR_LF+ '[' +TimeToStr(Time)+ '] - Erro ao enviar o comando ' +
      //*  GetStringComando(FComando_Ultima_Leitura);

    exit;
  end;

  FSentidoPassagem := tpsIndiferente;

  // Tratamento dos dados recebidos
  if (FUltimaMsg = MensagemTemDados) then
  begin
    // Travar a passagem enquanto o cartão não é verificado
    Enviar_Mensagem_Travar_Dispositivo;

    if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
      sLog := sLog +CR_LF+
        '[' +TimeToStr(Time)+ '] - Resposta Ok, não vazia' +CR_LF+
        'Buffer: ' + FBuffer +' - Crachá: '+ FCracha +' - Status: '+ GetStringStatus;

    // Caso receba um crachá preenchido totalmente com ZEROS,
    // indicar como se nada tivesse sido recebido
    if (FCracha = Replicate('0',16)) then
    begin
      sLog := sLog +CR_LF+
        'Resposta não enviada para a tela do sistema. Status: "' +GetStringStatus +'"';
      FBuffer := '';
      FCracha := '';
      //*FStatus := RemotaLigada;
      FUltimaMsg := MensagemNaoTemDados;
    end;

    FComando_Ultima_Leitura := Cmd_Dados_Aceitos;
  end
  else
  begin
    if (FGerarLog = GERAR_LOG_COMPLETO) then
      sLog := sLog +CR_LF+ '[' +TimeToStr(Time)+ '] - Resposta: "' +GetStringStatus +'"';

    FComando_Ultima_Leitura := Cmd_Dados_Nao_Aceitos;
  end;

  Result := FCracha;

  // Se o Log for completo, adicionar as linhas ao mesmo. Se for o incompleto, só adicionar
  // estas linhas caso tenha sido lido algum Crachá.
  if (FGerarLog = GERAR_LOG_COMPLETO) or
     ((FGerarLog = GERAR_LOG_SIMPLES) and (FCracha <> '')) then
    FLog.Add(sLog);
end;

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
  //*Result := Enviar_Comando(CMD_DATA_HORA);
end;

end.
