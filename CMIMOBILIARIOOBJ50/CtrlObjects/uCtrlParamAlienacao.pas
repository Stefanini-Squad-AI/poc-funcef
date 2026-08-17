unit uCtrlParamAlienacao;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE PARAMETROS DE ALIENACAO  ( MT )
//
//      Módulo          :  Alienacao
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  26/08/2002
//      Data de Término :  26/08/2002
//
// -----------------------------------------------------------------------------

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet, uCMTypes,
     uDbParamAlienacao;

type TCtrlParamAlienacao = class(TCMControlObject)

     private
       FCdsParamAlienacao: TCMClientDataSet;
       FDbParamAlienacao : TDbParamAlienacao;
       procedure SetCdsParamAlienacao(const Value: TCMClientDataSet);
       procedure SetDbParamAlienacao (const Value: TDbParamAlienacao);

     protected
       procedure AfterInitialize;   Override;
       procedure OnCreateAppServer; Override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       property DbParamAlienacao  : TDbParamAlienacao read FDbParamAlienacao  write SetDbParamAlienacao;
       property CdsParamAlienacao : TCMClientDataSet  read FCdsParamAlienacao write SetCdsParamAlienacao;

       function SelecionaParamAlienacao (const iIdEmpresa:Integer = -1) : OLEVariant;
       function GravaParamAlienacao : Boolean;

     published

end;

implementation

{ TCtrlParamAlienacao }

constructor TCtrlParamAlienacao.Create;
begin
  inherited;
  // Cria os DbOjbects
  FDbParamAlienacao  := TDBParamAlienacao.Create( Self );
end;

destructor TCtrlParamAlienacao.Destroy;
begin
  // Destrói os DbObjects criados
  FDbParamAlienacao.Free;
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then FCdsParamAlienacao.Free;
  inherited;
end;

procedure TCtrlParamAlienacao.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsParamAlienacao := TCMClientDataSet.Create( nil );
end;

procedure TCtrlParamAlienacao.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbParamAlienacao.DataBaseName := DataBaseName;
end;

function TCtrlParamAlienacao.GravaParamAlienacao: Boolean;
var sMsg : String;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaParamAlienacao( CdsParamAlienacao.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsParamAlienacao, DbParamAlienacao, [], [] );
      sMsg   := DbParamAlienacao.MessageInfo;

      if not Result then raise Exception.Create( sMsg );
      Commit;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


function TCtrlParamAlienacao.SelecionaParamAlienacao(const iIdEmpresa:Integer): OLEVariant;
var sSql : String;
begin
  // Executa o sql e retorna o pacote de dados
  sSql := 'SELECT * FROM PARAMALIENACAO ';
  if iIdEmpresa <> -1 then sSql := sSql + ' WHERE IDPESSOA = ' + IntToStr(iIdEmpresa);
  Result := GetDataPacket( sSql );
end;

procedure TCtrlParamAlienacao.SetCdsParamAlienacao(const Value: TCMClientDataSet);
begin
  FCdsParamAlienacao := Value;
end;

procedure TCtrlParamAlienacao.SetDbParamAlienacao(const Value: TDbParamAlienacao);
begin
  FDbParamAlienacao := Value;
end;


end.
