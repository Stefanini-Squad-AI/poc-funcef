{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 18/10/2005                                 }
{                                                       }
{*******************************************************}

unit uCtrlModeloAcesso;

interface

uses Windows, Classes, SysUtils, Controls, uCmDbObject, uCmControlObject, IvDictio,
   uCMClientDataSet, uCtrlCustomRH, uCtrlFuncoesRH; 

const
  NAO_GERAR_LOG = 0;
  GERAR_LOG_SIMPLES = 1;
  GERAR_LOG_COMPLETO = 2;

type
  TTipoBuffer = (tpbTransmissao, tpbRecepcao);
  TFormaOperacao = (tpoEntradaSaida, tpoEntrada);
  TSentidoPassagem = (tpsSaida, tpsEntrada, tpsIndiferente);
  TSentidoGiro = (tsgSaida, tsgEntrada);

  TCtrlModeloAcesso = class(TCtrlCustomRH)
  protected
    FLog: TStringList;
    FGerarLog: integer;

    FNomeDLL: string;
    FPorta: string;
    FMensagemPadrao: string;

    FFormaOperacao: TFormaOperacao;
    FSentidoPassagem: TSentidoPassagem;
    FSentido1: TSentidoGiro;
    FSentido2: TSentidoGiro;
    FTempoMsg: integer;
    FTempoAcesso: integer;
    FVelocidade: integer;
    FColDocumento: integer;
    FTamDocumento: integer;

    FMsgErro: string;

    FDispositivo_Inicializado: boolean;

    FDLL: THandle; // Manipulador da DLL
    FFuncao: TFarProc; // Ponteiro temporário para cada função

    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;

    function TiraCaracterEspecial(const Str: string): string;
    function CodAscii(const Msg: string): string;
    function GetNumPorta: byte;

    procedure AddOkFinalUltimaLinhaLog;
    procedure AddErroFinalUltimaLinhaLog;

    function  Enviar_Comando(const NumComando: byte): boolean; virtual;
    function  Verificar_Existe_Dados: boolean; virtual;
    function  Receber_Dados: boolean; virtual;
    procedure Limpar_Buffer(const Tipo: TTipoBuffer); virtual;

    procedure SetMensagemPadrao(const Valor: string); virtual;
    procedure VerificarSentidoPassagem(const Msg: string); virtual;
  public
    constructor Create; override;
    destructor  Destroy; override;

    procedure AddLog(const Msg: string);

    function  CarregarFuncoesDLL: boolean; virtual;
    procedure LiberarFuncoesDLL; virtual;

    function  Inicializar(const Porta: string; const Velocidade: integer): boolean; virtual;
    procedure SetSentidoCatraca(const Sentido1, Sentido2: integer);

    function  Inicializar_Dispositivo: boolean; virtual;
    procedure Finalizar_Dispositivo; virtual;

    function  Inicializar_Config: boolean; virtual;
    procedure Config_Entradas; virtual;

    function  Enviar_Mensagem: boolean; virtual;
    function  Enviar_Mensagem_Padrao: boolean; virtual;

    function  Enviar_Mensagem_Cartao_Bloqueado: boolean; virtual;
    function  Enviar_Mensagem_Acessos_Excedidos: boolean; virtual;
    function  Enviar_Mensagem_Acessos_Fora_de_Hora: boolean; virtual;
    function  Enviar_Mensagem_Sentido_Invalido: boolean; virtual;
    function  Enviar_Mensagem_Libera_Acesso(const NumCartao: string;
      const Saldo: integer): boolean; virtual;
    function  Enviar_Mensagem_Travar_Dispositivo: boolean; virtual;
    function  Enviar_Mensagem_Destravar_Dispositivo: boolean; virtual;
    function  Enviar_Mensagem_Acesso_Dia_Folga: boolean; virtual;
    function  Enviar_Mensagem_Pessoa_Desligada: boolean; virtual;
    function  Enviar_Mensagem_Pessoa_Afastada: boolean; virtual;
    function  Enviar_Mensagem_Pessoa_Ferias: boolean; virtual;
    function  Enviar_Mensagem_Cracha_Invalido: boolean; virtual;

    function  Interrogacao: string; virtual;

    property NomeDLL: string read FNomeDLL;
    property ColDocumento: integer read FColDocumento write FColDocumento;
    property TamDocumento: integer read FTamDocumento write FTamDocumento;
    property MensagemPadrao: string read FMensagemPadrao write SetMensagemPadrao;
    property FormaOperacao: TFormaOperacao read FFormaOperacao write FFormaOperacao;
    property SentidoPassagem: TSentidoPassagem read FSentidoPassagem;
    property TempoMsg: integer read FTempoMsg write FTempoMsg;
    property TempoAcesso: integer read FTempoAcesso write FTempoAcesso;
    property Log: TStringList read FLog;
    property GerarLog: integer read FGerarLog write FGerarLog;
  end;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_DLL_NAO_ENC = 'Biblioteca :1 não encontrada.';
  MSG_ERRO_FUNC_NAO_ENC= 'Função :1 não encontrada.';

implementation

{ TCtrlModeloAcesso }

constructor TCtrlModeloAcesso.Create;
begin
  inherited;
  FLog := TStringList.Create;

  FNomeDLL := '';
end;

destructor TCtrlModeloAcesso.Destroy;
begin
  FLog.Free;
  inherited;
end;

procedure TCtrlModeloAcesso.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlModeloAcesso.DoChangeDataBase;
begin
  inherited;
end;

function TCtrlModeloAcesso.TiraCaracterEspecial(const Str: string): string;
var
  sAux: string;
  c: integer;
begin
  sAux := '';
  for c:=1 to Length(Str) do
    if (Ord(Str[c]) in [32..126]) then
      sAux := sAux + Str[c];
  Result := sAux;
end;

function TCtrlModeloAcesso.CodAscii(const Msg: string): string;
var
  c: integer;
begin
  Result := '';
  if (Msg <> '') then
    for c:=1 to Length(Msg) do
      Result := Result + '#'+IntToStr(Ord(Msg[c]));
end;

function TCtrlModeloAcesso.GetNumPorta: byte;
var
  c: byte;
  sPorta: string;
begin
  sPorta := '';
  for c:=1 to Length(FPorta) do
    if (FPorta[c] in ['0'..'9']) then
      sPorta := sPorta + FPorta[c];
  Result := StrInt(sPorta);
end;

procedure TCtrlModeloAcesso.AddLog(const Msg: string);
begin
  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
    FLog.Add('[' +FormatDateTime('hh:nn:ss', Time)+ '] - ' + Msg);
end;

procedure TCtrlModeloAcesso.AddOkFinalUltimaLinhaLog;
begin
  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
    FLog[FLog.Count-1] := FLog[FLog.Count-1] + ' OK';
end;

procedure TCtrlModeloAcesso.AddErroFinalUltimaLinhaLog;
begin
  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
    FLog[FLog.Count-1] := FLog[FLog.Count-1] +' ERRO'+ IFF(FMsgErro='','',' (' +FMsgErro+')');
end;

procedure TCtrlModeloAcesso.SetMensagemPadrao(const Valor: string);
begin
  FMensagemPadrao := Valor;
end;

procedure TCtrlModeloAcesso.VerificarSentidoPassagem(const Msg: string);
begin
  FSentidoPassagem := tpsIndiferente;
end;

function TCtrlModeloAcesso.CarregarFuncoesDLL: boolean;
begin
  if (Trim(FNomeDLL) <> '') then
  begin
    FDLL := LoadLibrary(PAnsiChar(FNomeDLL));
    Result := (FDLL > 0);
    if not(Result) then
      MessageInfo := CMTranslateMsg(MSG_DLL_NAO_ENC, [FNomeDLL]);
  end
  else
  begin
    MessageInfo := CMTranslate('DLL não identificada.');
    Result := false;
  end;
end;

procedure TCtrlModeloAcesso.LiberarFuncoesDLL;
begin
  if (FDLL > 0) then
    FreeLibrary(FDLL);
end;

function TCtrlModeloAcesso.Inicializar(const Porta: string;
  const Velocidade: integer): boolean;
begin
  if (FGerarLog in [GERAR_LOG_SIMPLES, GERAR_LOG_COMPLETO]) then
    FLog.Add(CMTranslate('Data do Log: ' + FormatDateTime('dd/mm/yyyy', Date)) + CR_LF);

  FPorta := UpperCase(Porta);
  FVelocidade := Velocidade;
  FDispositivo_Inicializado := false;
  Result := true;
end;

procedure TCtrlModeloAcesso.SetSentidoCatraca(const Sentido1, Sentido2: integer);
begin
  FSentido1 := TSentidoGiro(Sentido1);
  FSentido2 := TSentidoGiro(Sentido2);
end;

function TCtrlModeloAcesso.Inicializar_Dispositivo: boolean;
begin
  Result := true;
end;

procedure TCtrlModeloAcesso.Finalizar_Dispositivo;
begin
end;

// *****************************************************
// Enviar configurações iniciais para o Equipamento
// -----------------------------------------------------
function TCtrlModeloAcesso.Inicializar_Config: boolean;
begin
  Result := true;
end;

// *****************************************************
// Enviar configuração de entrada para o Equipamento
// -----------------------------------------------------
procedure TCtrlModeloAcesso.Config_Entradas;
begin
end;

// *****************************************************
// Enviar a Mensagem Fixa (PADRÃO) para o Equipamento
// -----------------------------------------------------
function TCtrlModeloAcesso.Enviar_Mensagem_Padrao: boolean;
begin
  Result := true;
end;

// *****************************************************
// Enviar mensagens para o Equipamento
// -----------------------------------------------------
// Linha1: Primeira linha da mensagem
// Linha2: Segunda linha da mensagem
function TCtrlModeloAcesso.Enviar_Mensagem: boolean;
begin
  Result := true;
end;

function TCtrlModeloAcesso.Enviar_Mensagem_Cartao_Bloqueado: boolean;
begin
  Result := true;
end;

function TCtrlModeloAcesso.Enviar_Mensagem_Acessos_Excedidos: boolean;
begin
  Result := true;
end;

function TCtrlModeloAcesso.Enviar_Mensagem_Acessos_Fora_de_Hora: boolean;
begin
  Result := true;
end;

function TCtrlModeloAcesso.Enviar_Mensagem_Sentido_Invalido: boolean;
begin
  Result := true;
end;

function TCtrlModeloAcesso.Enviar_Mensagem_Libera_Acesso(const NumCartao: string;
  const Saldo: integer): boolean;
begin
  Result := true;
end;

function TCtrlModeloAcesso.Enviar_Mensagem_Travar_Dispositivo: boolean;
begin
  Result := true;
end;

function TCtrlModeloAcesso.Enviar_Mensagem_Destravar_Dispositivo: boolean;
begin
  Result := true;
end;

function TCtrlModeloAcesso.Enviar_Mensagem_Acesso_Dia_Folga: boolean;
begin
  Result := true;
end;

function TCtrlModeloAcesso.Enviar_Mensagem_Pessoa_Desligada: boolean;
begin
  Result := true;
end;

function TCtrlModeloAcesso.Enviar_Mensagem_Pessoa_Afastada: boolean;
begin
  Result := true;
end;

function TCtrlModeloAcesso.Enviar_Mensagem_Pessoa_Ferias: boolean;
begin
  Result := true;
end;

function TCtrlModeloAcesso.Enviar_Mensagem_Cracha_Invalido: boolean;
begin
  Result := true;
end;

// *****************************************************
// Enviar comandos para o Equipamento
// -----------------------------------------------------
// NumComando: Código do comando a ser enviado
// TipoBuffer: Indica usará o Buffer de Entrada ou de Saída
function TCtrlModeloAcesso.Enviar_Comando(const NumComando: byte): boolean;
begin
  Result := true;
end;

// *****************************************************
// Receber dados do Polling do Equipamento
// -----------------------------------------------------
function TCtrlModeloAcesso.Verificar_Existe_Dados: boolean; 
begin
  Result := true;
end;

// *****************************************************
// Receber dados do Polling do Equipamento
// -----------------------------------------------------
function TCtrlModeloAcesso.Receber_Dados: boolean;
begin
  Result := true;
end;

function TCtrlModeloAcesso.Interrogacao: string;
begin
  Result := '';
end;

procedure TCtrlModeloAcesso.Limpar_Buffer(const Tipo: TTipoBuffer);
begin
end;

end.
