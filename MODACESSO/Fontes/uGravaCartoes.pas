unit uGravaCartoes;

interface

uses
  Messages, SysUtils, Classes, Dialogs, Forms, Controls, sConnect, uCMTypes;

type
  TGravaCartoes = class(TObject)
  private
    FClientId: Integer;
    FSiceServer: OleVariant;
    FConecta: TSocketConnection;
    FGravadora: string;
    FRespostaGravacao: string;
    FMsgErro: string;

    FPararGravacao: boolean;

    function  RetornoGravacao: string;
    procedure EsperarRespostaGravadora;
    procedure ExibirMsg(const TipoMsg, Msg: string);
    procedure LerTipoGravadora;
  public
    constructor Create(ObjConexao: TSocketConnection);
    destructor  Destroy; override;

    class function IsChaveEletronicaAtiva(var Obj: TSocketConnection;
      const Estacao: string = ''): boolean;

    function GravaCartao(const Matricula: string): boolean;

    property MsgErro: string read FMsgErro;
    property PararGravacao: boolean read FPararGravacao write FPararGravacao;
  end;

var
  GravacaoChave: TGravaCartoes;
  ObjConexaoGravadora: TSocketConnection;

implementation

uses Windows, Registry, uMensErro, uSistema, uCtrlFuncoesRH;

const
  MSG_ERRO = '2';
  MSG_OK = '3';
  MSG_AVISO = '4';

class function TGravaCartoes.IsChaveEletronicaAtiva(var Obj: TSocketConnection;
  const Estacao: string): boolean;
begin
  Result := true;
  try
	  Obj := TSocketConnection.Create(nil);

    if (Estacao <> '') then
	    Obj.Host	:= Estacao
    else
	    Obj.Host	:= 'LOCALHOST';

    Obj.Servername := 'ChaveEletronica.dtmChaveEletronica';
    Obj.Connected := true;
  except
    Result := false;
    Obj := nil;
  end;
end;

constructor TGravaCartoes.Create(ObjConexao: TSocketConnection);
begin
  inherited Create;
  FConecta := ObjConexao;
  FSiceServer	:= FConecta.AppServer.SiceServer;
  FClientId := FSiceServer.RegistraCliente;
  LerTipoGravadora;
end;

destructor TGravaCartoes.Destroy;
begin
  FConecta.Connected := false;
	FConecta.Free;
  inherited;
end;

function TGravaCartoes.GravaCartao(const Matricula: string): boolean;
begin
  Result := true;
  try
    FSiceServer.GravaCartaoFuncionario(FClientId, FGravadora, Matricula);
    EsperarRespostaGravadora;
  except
    on E: Exception do
    begin
      FMsgErro := E.Message;
      Result := false;
    end;  
  end;
end;

function TGravaCartoes.RetornoGravacao: string;
var
  SL: TStringList;
begin
  if (FRespostaGravacao = '') then
  begin
    Result := '';
    exit;
  end;

  SL := TStringList.Create;
  try
    try
      SL.Text := FRespostaGravacao;
      ExibirMsg(SL.Values['TipoMsg'], SL.Values['Mensagem']);
      Result := SL.Values['TipoMsg'];
    finally
      SL.Free;
    end;
  except
    on E: Exception do
    begin
      Result := MSG_ERRO;
      FMsgErro := E.Message;
    end;
  end;
end;

procedure TGravaCartoes.EsperarRespostaGravadora;
var
  sRetorno: string;
begin
  repeat
    FRespostaGravacao := FSiceServer.GetResposta(FClientId);
    Application.ProcessMessages;
    sRetorno := RetornoGravacao;
  until (sRetorno = MSG_OK) or (sRetorno = MSG_ERRO) or (FPararGravacao);
end;

procedure TGravaCartoes.ExibirMsg(const TipoMsg, Msg: string);
begin
  if (TipoMsg = MSG_ERRO) then
  begin
    FMsgErro := Msg;
    MsgDlg(Msg, FU.CMTranslate('Erro'), mtError, [mbOk,mbHelp], 0);
  end
  else
  if (TipoMsg = MSG_OK) then
    MsgDlg(FU.CMTranslate('Cartão Gravado com Sucesso') +CR_LF+
           FU.CMTranslate('Clique em Ok para continuar.'),
           FU.CMTranslate('Sucesso'), mtInformation, [mbOk,mbHelp], 0)
  else
  if (TipoMsg = MSG_AVISO) then
  begin
    FMsgErro := Msg;
    MsgDlg(Msg, FU.CMTranslate('Aviso'), mtWarning, [mbOk,mbHelp], 0);
  end;  
end;

procedure TGravaCartoes.LerTipoGravadora;
begin
  FGravadora := FU.LerChaveRegistro(Sistema.NomeModulo, 'Gravadora');
  if (FGravadora = '') then
    FGravadora := '01';
end;

end.
