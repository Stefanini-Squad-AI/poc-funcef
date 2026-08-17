{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 18/10/2005                                 }
{                                                       }
{*******************************************************}

unit uModeloAcesso;

interface

uses SysUtils, Controls, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate,
  uCMClientDataSet, uCtrlCustomRH;

type
  TCtrlModeloAcesso = class(TCtrlCustomRH)
  protected
    FNomeDLL: string;
    FMensagem: string;

    FDLL: THandle; // Manipulador da DLL
    FFuncao: TFarProc; // Ponteiro temporário para cada função

    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  public
    constructor Create;

    function CarregarFuncoesDLL: boolean;

    procedure Inicializar_Serial;
    procedure Finalizar_Serial;

    procedure Inicializar_Config;
    procedure Config_Entradas;

    function  Enviar_Mensagem: integer;
    function  Enviar_Comando: integer;

    function  Receber_Dados: integer;

    procedure Interrogacao;

    procedure Limpar_Buffer;

    property NomeDLL: string read FNomeDLL;
  end;

implementation

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_ERRO_FUNC_NAO_ENC = 'Função ":1" não encontrada na Biblioteca: :2';
  MSG_DLL_NAO_ENC = 'Biblioteca :1 não encontrada.';
  MSG_SALDO = ' Saldo :1 .';
  MSG_SALDO_AUTOM = ' Saldo Antes de Passar :1 .';
  MSG_ACESSOS_PERM = 'Acessos Permitidos (:1) Excedidos.';
  MSG_ERRO_ABRE_PORTA_COM = 'Erro :1 ao abrir porta de comunicação.';

{ TCtrlModeloAcesso }

constructor TCtrlModeloAcesso.Create;
begin
  FNomeDLL := '';
end;

procedure TCtrlModeloAcesso.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlModeloAcesso.DoChangeDataBase;
begin
  inherited;
end;

function TCtrlModeloAcesso.CarregarFuncoesDLL: boolean;
begin
  if (Trim(FNomeDLL) <> '') then
  begin
    FDLL := LoadLibrary(FNomeDLL);
    Result := (FDLL > 0);
  end
  else
  begin
    FMensagem := CMTranslateMsg(MSG_DLL_NAO_ENC, [FNomeDLL]);
    Result := false;
  end;
end;

procedure TCtrlModeloAcesso.Inicializar_Serial;
begin
end;

procedure TCtrlModeloAcesso.Finalizar_Serial;
begin
end;

procedure TCtrlModeloAcesso.Inicializar_Config;
begin
end;

procedure TCtrlModeloAcesso.Config_Entradas;
begin
end;

function  TCtrlModeloAcesso.Enviar_Mensagem: integer;
begin
  Result := RETORNO_NORMAL;
end;

function  TCtrlModeloAcesso.Enviar_Comando: integer;
begin
  Result := RETORNO_NORMAL;
end;

function TCtrlModeloAcesso.Receber_Dados: integer;
begin
  Result := RETORNO_NORMAL;
end;

procedure TCtrlModeloAcesso.Interrogacao;
begin
end;

procedure TCtrlModeloAcesso.Limpar_Buffer;
begin
end;

end.
