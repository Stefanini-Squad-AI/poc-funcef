unit uCtrlParamIndicadores;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE PARÂMETROS DE INDICADORES  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  15/05/2002
//      Data de Término :  16/05/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      GravaParamIndicadores     -  Ins,Alt,Del cadastro de Parâmetros         ( TLB )
//      SelecionaParamIndicadores -  Abre o registro de parâmetros
// -----------------------------------------------------------------------------

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDbParamIndicadores;

type TCtrlParamIndicadores = class(TCMControlObject)

     private
    FCdsParamIndicadores: TCMClientDataSet;
    FDbParamIndicadores: TDbParamIndicadores;
    procedure SetCdsParamIndicadores(const Value: TCMClientDataSet);
    procedure SetDbParamIndicadores(const Value: TDbParamIndicadores);

     protected
       procedure AfterInitialize; Override;
       procedure OnCreateAppServer; Override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       property DbParamIndicadores  : TDbParamIndicadores read FDbParamIndicadores write SetDbParamIndicadores;
       property CdsParamIndicadores : TCMClientDataSet read FCdsParamIndicadores write SetCdsParamIndicadores;

       function GravaParamIndicadores : Boolean;
       function SelecionaParamIndicadores(const iIdPessoa:Integer ) : OLEVariant;

     published

end;

implementation

{ TCtrlParamIndicadores }

procedure TCtrlParamIndicadores.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbParamIndicadores.DataBaseName := DataBaseName;
end;

constructor TCtrlParamIndicadores.Create;
begin
  inherited;
  // Cria os DbOjbects
  FDbParamIndicadores := TDbParamIndicadores.Create( Self );
end;

destructor TCtrlParamIndicadores.Destroy;
begin
  // Destrói os DbObjects criados
  FDbParamIndicadores.Free;
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then FCdsParamIndicadores.Free;
  inherited;
end;

procedure TCtrlParamIndicadores.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsParamIndicadores := TCMClientDataSet.Create( nil );
end;

function TCtrlParamIndicadores.GravaParamIndicadores: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaParamIndicadores( CdsParamIndicadores.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsParamIndicadores, DbParamIndicadores, [], [] );
      if not Result then raise Exception.Create( DbParamIndicadores.MessageInfo );
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

function TCtrlParamIndicadores.SelecionaParamIndicadores(const iIdPessoa: Integer): OLEVariant;
begin
  // Transfere o id do grupo para o DbObject, e executa o Sql padrão
  FDbParamIndicadores.Idpessoa.AsInteger := iIdPessoa;
  Result := GetDataPacket( FDbParamIndicadores.SSqlSelect );
end;

procedure TCtrlParamIndicadores.SetCdsParamIndicadores(
  const Value: TCMClientDataSet);
begin
  FCdsParamIndicadores := Value;
end;

procedure TCtrlParamIndicadores.SetDbParamIndicadores(
  const Value: TDbParamIndicadores);
begin
  FDbParamIndicadores := Value;
end;

end.
