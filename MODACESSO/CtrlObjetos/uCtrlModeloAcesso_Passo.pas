{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 20/10/2005                                 }
{                                                       }
{*******************************************************}

unit uCtrlModeloAcesso_Passo;

interface

uses Windows, SysUtils, Controls, uCmDbObject, uCmControlObject, IvDictio,
   uCMClientDataSet, uCtrlFuncoesRH, uCtrlModeloAcesso;

const
  // Tamanho do Buffer para cada comando (em bytes)
  SIZE_MENSAGEM = 31;

type
  TStartCom = function: integer; stdcall;
  TEndCom = function: integer; stdcall;
  TCommError = function: byte; stdcall;
  TSendToTerm = function (NumTerm: integer; Dados: string): integer; stdcall;
  TReadFromTerm = function (NumTerm: integer; Dados: string): integer; stdcall;

  TCtrlModeloAcesso_Passo = class(TCtrlModeloAcesso)
  private
    FBuffer: string;

    // Variáveis que irão guardar as funções da DLL
    FStartCom: TStartCom; // Função que abre a porta de comunicação
    FEndCom: TEndCom; // Função que finaliza a porta de comunicação
    FCommError: TCommError; // Função que informa o erro na comunicação com a catraca
    FSendToTerm: TSendToTerm; // Função que envia comandos à catraca
    FReadFromTerm: TReadFromTerm; // Função que recebe dados da catraca
  protected
    function  Receber_Dados: boolean; override;
    procedure Limpar_Buffer; reintroduce;
    procedure Montar_Mensagem(const Msg: string);
    function  Enviar_Mensagem(const Msg: string): boolean; reintroduce;

    procedure VerificarSentidoPassagem(const Msg: string); override;

    function  Formatar_Entrada: boolean;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function CarregarFuncoesDLL: boolean; override;

    function  Inicializar(const Porta: string; const Velocidade: integer): boolean; override;

    function  Inicializar_Dispositivo: boolean; override;
    procedure Finalizar_Dispositivo; override;

    function  Enviar_Mensagem_Padrao: boolean; override;
    function  Enviar_Mensagem_Cartao_Bloqueado: boolean; override;
    function  Enviar_Mensagem_Acessos_Excedidos: boolean; override;
    function  Enviar_Mensagem_Acessos_Fora_de_Hora: boolean; override;
    function  Enviar_Mensagem_Sentido_Invalido: boolean; override;
    function  Enviar_Mensagem_Libera_Acesso(const NumCartao: string;
      const Saldo: integer): boolean; override;
    function  Enviar_Mensagem_Acesso_Dia_Folga: boolean; override;
    function  Enviar_Mensagem_Pessoa_Desligada: boolean; override;
    function  Enviar_Mensagem_Pessoa_Afastada: boolean; override;
    function  Enviar_Mensagem_Cracha_Invalido: boolean; override;

    function  Interrogacao: string; override;
  end;

implementation

uses  uMensErro;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_ERRO_ABRE_PORTA_COM = 'Erro :1 ao abrir porta de comunicação.';
  MSG_ERRO_GENERICO = 'O erro nº :1 ocorreu.';

{ TCtrlModeloAcesso_Passo }

constructor TCtrlModeloAcesso_Passo.Create;
begin
  inherited;
  FNomeDLL := 'ca100.dll';
end;

destructor TCtrlModeloAcesso_Passo.Destroy;
begin
  inherited;
end;

function TCtrlModeloAcesso_Passo.CarregarFuncoesDLL: boolean;
begin
  Result := inherited CarregarFuncoesDLL;
  if (Result) then
  begin
    Result := false;

    FFuncao := GetProcAddress(FDLL, PChar('StartCom'));
    if (Assigned(FFuncao)) then
      FStartCom := TStartCom(FFuncao)
    else
    begin
      MessageInfo := CMTranslateMsg(MSG_ERRO_FUNC_NAO_ENC, ['StartCom', FNomeDLL]);
      exit;
    end;

    FFuncao := GetProcAddress(FDLL, PChar('EndCom'));
    if (Assigned(FFuncao)) then
      FEndCom := TEndCom(FFuncao)
    else
    begin
      MessageInfo := CMTranslateMsg(MSG_ERRO_FUNC_NAO_ENC, ['EndCom', FNomeDLL]);
      exit;
    end;

    FFuncao := GetProcAddress(FDLL, PChar('CommError'));
    if (Assigned(FFuncao)) then
      FCommError := TCommError(FFuncao)
    else
    begin
      MessageInfo := CMTranslateMsg(MSG_ERRO_FUNC_NAO_ENC, ['CommError', FNomeDLL]);
      exit;
    end;

    FFuncao := GetProcAddress(FDLL, PChar('SendToTerm'));
    if (Assigned(FFuncao)) then
      FSendToTerm := TSendToTerm(FFuncao)
    else
    begin
      MessageInfo := CMTranslateMsg(MSG_ERRO_FUNC_NAO_ENC, ['SendToTerm', FNomeDLL]);
      exit;
    end;

    FFuncao := GetProcAddress(FDLL, PChar('ReadFromTerm'));
    if (Assigned(FFuncao)) then
      FReadFromTerm := TReadFromTerm(FFuncao)
    else
    begin
      MessageInfo := CMTranslateMsg(MSG_ERRO_FUNC_NAO_ENC, ['ReadFromTerm', FNomeDLL]);
      exit;
    end;

    Result := true;
  end;
end;

function TCtrlModeloAcesso_Passo.Inicializar(const Porta: string;
  const Velocidade: integer): boolean;
begin
  Result := inherited Inicializar(Porta, Velocidade);
  if not(Result) then
    exit;

  Result := Inicializar_Dispositivo;
  if not(Result) then
    exit;

  Result := Enviar_Mensagem_Padrao;
end;

function TCtrlModeloAcesso_Passo.Inicializar_Dispositivo: boolean;
var
  iErro: integer;
begin
  inherited Inicializar_Dispositivo;

  if not(FDispositivo_Inicializado) then
  begin
    iErro := FStartCom();
    FDispositivo_Inicializado := (iErro = 0);
    if not(FDispositivo_Inicializado) then
    begin
      MessageInfo := CMTranslateMsg(MSG_ERRO_ABRE_PORTA_COM, [IntToStr(iErro)]);
      case (iErro) of
        2 : MessageInfo := MessageInfo +CR_LF+ CMTranslate('>> Porta não encontrada <<');
        5 : MessageInfo := MessageInfo +CR_LF+ CMTranslate('>> Porta ocupada <<');
      end;
    end;
  end;

  Limpar_Buffer;
  Result := FDispositivo_Inicializado;
end;

procedure TCtrlModeloAcesso_Passo.Finalizar_Dispositivo;
begin
  if (FDLL > 0) then
    FEndCom();
  inherited;
end;

procedure TCtrlModeloAcesso_Passo.Montar_Mensagem(const Msg: string);
begin
  FBuffer := Alinha(Msg, SIZE_MENSAGEM, 'E', ' ');
end;

function TCtrlModeloAcesso_Passo.Enviar_Mensagem(const Msg: string): boolean;
var
  iErro: integer;
begin
  inherited Enviar_Mensagem;
  try
    // Formatar a mensagem
    Montar_Mensagem(Msg);
    // Enviar a mensagem à leitora
    iErro := FSendToTerm(0, Msg);
    if (iErro <> 0) then
      raise Exception.Create(CMTranslateMsg(MSG_ERRO_GENERICO, [IntToStr(iErro)]))
    else
      Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;

function TCtrlModeloAcesso_Passo.Enviar_Mensagem_Padrao: boolean;
begin
  Result := Enviar_Mensagem(FMensagemPadrao);
end;

function TCtrlModeloAcesso_Passo.Enviar_Mensagem_Cartao_Bloqueado: boolean;
begin
  Result := Enviar_Mensagem(CMTranslate('    Horario         Bloqueado  '));
end;                                 // '1...5....0....5X...5....0....5X

function TCtrlModeloAcesso_Passo.Enviar_Mensagem_Acessos_Excedidos: boolean;
begin
  Result := Enviar_Mensagem(CMTranslate('    Acessos         Excedidos  '));
end;                                 // '1...5....0....5X...5....0....5X

function TCtrlModeloAcesso_Passo.Enviar_Mensagem_Acessos_Fora_de_Hora: boolean;
begin
  Result := Enviar_Mensagem(CMTranslate('   Acesso        Fora de Hora  '));
end;                                 // '1...5....0....5X...5....0....5X

function TCtrlModeloAcesso_Passo.Enviar_Mensagem_Sentido_Invalido: boolean;
begin
  Result := Enviar_Mensagem(CMTranslate('Sentido passagem   Invalido    '));
end;                                 // '1...5....0....5X...5....0....5X

function TCtrlModeloAcesso_Passo.Enviar_Mensagem_Libera_Acesso(const NumCartao: string;
  const Saldo: integer): boolean;
begin
  if (Saldo > 0) then
    Result :=
      Enviar_Mensagem(CMTranslate('LIBERADA: Saldo ')+ IntToStr(Saldo) +' '+ NumCartao)
  else
    Result :=
      Enviar_Mensagem(CMTranslate('LIBERADA ') +' '+ NumCartao);
end;

function TCtrlModeloAcesso_Passo.Enviar_Mensagem_Acesso_Dia_Folga: boolean;
begin
  Result := Enviar_Mensagem(CMTranslate('   Acesso em     Dia de Folga  '));
end;                                 // '1...5....0....5X...5....0....5X

function TCtrlModeloAcesso_Passo.Enviar_Mensagem_Pessoa_Desligada: boolean;
begin
  Result := Enviar_Mensagem(CMTranslate('     Pessoa        Desligada   '));
end;                                 // '1...5....0....5X...5....0....5X

function TCtrlModeloAcesso_Passo.Enviar_Mensagem_Pessoa_Afastada: boolean;
begin
  Result := Enviar_Mensagem(CMTranslate('     Pessoa        Afastada    '));
end;                                 // '1...5....0....5X...5....0....5X

function TCtrlModeloAcesso_Passo.Enviar_Mensagem_Cracha_Invalido: boolean;
begin
  Result := Enviar_Mensagem(CMTranslate('     Cracha        Invalido    '));
end;                                 // '1...5....0....5X...5....0....5X

procedure TCtrlModeloAcesso_Passo.VerificarSentidoPassagem(const Msg: string); 
var
  sSentido: string;
begin
  sSentido := UpperCase(Copy(Msg, 10, 1));
  if (Msg = 'S') or (Msg = 'D') then
    FSentidoPassagem := tpsSaida
  else
  if (Msg = 'E') then
    FSentidoPassagem := tpsEntrada
  else
    FSentidoPassagem := tpsIndiferente;
end;

function TCtrlModeloAcesso_Passo.Receber_Dados: boolean;
begin
  inherited Receber_Dados;
  Limpar_Buffer;
  Result := (FReadFromTerm(0, FBuffer) = 0);
end;

function TCtrlModeloAcesso_Passo.Interrogacao: string;
begin
  if (FCommError() <> 0) then
  begin
    MessageInfo := CMTranslate('Ocorreu um erro durante a comunicação com o Leitor.');
    exit;
  end;

  if (Receber_Dados) then
    Formatar_Entrada;

  Result := FBuffer;
  inherited Interrogacao;
end;

procedure TCtrlModeloAcesso_Passo.Limpar_Buffer;
begin
  FBuffer := '';
end;

function TCtrlModeloAcesso_Passo.Formatar_Entrada: boolean;
var
  sComando: string;
begin
  sComando := UpperCase(Copy(FBuffer,1,1));
  try
    if (sComando = 'C') or (sComando = 'G') then
    begin
      // FALTA TRATAR DIREÇÃO CORRETAMENTE
      VerificarSentidoPassagem(FBuffer);

      // Obter somente o número do documento
      FBuffer := Trim(Copy(FBuffer, FColDocumento, FTamDocumento));
    end
    else
      raise Exception.Create('Entrada inválida, o Comando deve ser Checar ou Gravar.');

    Result := true;
  except
    on E: Exception do
    begin
      Limpar_Buffer;
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;

end.
