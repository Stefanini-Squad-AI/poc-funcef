unit uCtrlPaisAlex;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase,
  DbClient, uCMTypes, uCMClientDataSet, Classes, uDbEstadoAlex, uDbPaisAlex;

type
  TCtrlPaisAlex = class(TCmControlObject)

  protected
    procedure DoChangeDataBase; override;

    procedure AfterInitialize; override;

  private
    FCdsPaisAlex: TCmClientDataSet;
    FDbPaisAlex: TDbPaisAlex;
    FCdsEstadoAlex: TCMClientDataSet;
    FDbEstadoAlex: TDbEstadoAlex;
    procedure SetCdsPaisAlex(const Value: TCmClientDataSet);
    procedure SetDbPaisAlex(const Value: TDbPaisAlex);
    procedure SetCdsEstadoAlex(const Value: TCMClientDataSet);
    procedure SetDbEstadoAlex(const Value: TDbEstadoAlex);

  public

    constructor Create; override;
    destructor  Destroy; override;

    function    Gravar : Boolean;
    function    Excluir: Boolean;

    property DbPaisAlex: TDbPaisAlex read FDbPaisAlex write SetDbPaisAlex;
    property DbEstadoAlex: TDbEstadoAlex read FDbEstadoAlex write SetDbEstadoAlex;
    property CdsPaisAlex: TCmClientDataSet read FCdsPaisAlex write SetCdsPaisAlex;
    property CdsEstadoAlex: TCMClientDataSet read FCdsEstadoAlex write SetCdsEstadoAlex;

    function Seleciona ( iIdPais: integer): OleVariant;
    function SelecionaEstado ( iIdPais: integer): OleVariant;


  end;


implementation

{ TCtrlPaisAlex }

procedure TCtrlPaisAlex.AfterInitialize;
begin
  inherited;

end;

constructor TCtrlPaisAlex.Create;
begin
  inherited;
  FDbEstadoAlex  := TDbEstadoAlex.Create ( self );
  FDbPaisAlex    := TDbPaisAlex.Create (self);
  FCdsEstadoAlex := TCMClientDataSet.Create ( nil );
  FCdsPaisAlex   := TCMClientDataSet.Create (nil);

end;

destructor TCtrlPaisAlex.Destroy;
begin
  FreeAndNil (FDbEstadoAlex);
  FreeAndNil (FDbPaisAlex);
  FreeAndNil (FCdsEstadoAlex);
  FreeAndNil (FCdsPaisAlex);
  inherited;

end;

procedure TCtrlPaisAlex.DoChangeDataBase;
begin
  inherited;
  FDbEstadoAlex.DataBaseName := DataBaseName;
  FDbPaisAlex.DataBaseName   := DataBaseName;

end;

function TCtrlPaisAlex.Excluir: Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.Excluir;
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Try

      FCdsEstadoAlex.First;

      while not FCdsEstadoAlex.eof do FCdsEstadoAlex.Delete;

      StartTransaction;

      Result := ApplyCds (FCdsEstadoAlex, FDbEstadoAlex, [], [] );
      if not Result then
        Raise Exception.Create (FDbEstadoAlex.MessageInfo);

      Result := ApplyCds (FCdsPaisAlex, FDbPaisAlex, [], [] );
      if not Result then
        Raise Exception.Create (FDbPaisAlex.MessageInfo);

      Commit;
    except
      on E:Exception do
      begin
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlPaisAlex.Gravar: Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.Gravar;
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Try
      StartTransaction;

      Result := ApplyCds (FCdsPaisAlex, FDbPaisAlex, [], [] );
      if not Result then
        Raise Exception.Create (FDbPaisAlex.MessageInfo);

      Result := ApplyCds (FCdsEstadoAlex, FDbEstadoAlex, [FDbPaisAlex.Idpais], [FDbEstadoAlex. Idpais] );
      if not Result then
        Raise Exception.Create (FDbEstadoAlex.MessageInfo);

      Commit;
    except
      on E:Exception do
      begin
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlPaisAlex.Seleciona(iIdPais: integer): OleVariant;
begin
  result := GetDataPacket ('select * from pais where idpais = ' + IntToStr(iIdPais));
end;

function TCtrlPaisAlex.SelecionaEstado(iIdPais: integer): OleVariant;
begin
  result := GetDataPacket ('select * from estado where idpais = ' + IntToStr(iIdPais));
end;

procedure TCtrlPaisAlex.SetCdsEstadoAlex(const Value: TCMClientDataSet);
begin
  FCdsEstadoAlex := Value;
end;

procedure TCtrlPaisAlex.SetCdsPaisAlex(const Value: TCmClientDataSet);
begin
  FCdsPaisAlex := Value;
end;

procedure TCtrlPaisAlex.SetDbEstadoAlex(const Value: TDbEstadoAlex);
begin
  FDbEstadoAlex := Value;
end;

procedure TCtrlPaisAlex.SetDbPaisAlex(const Value: TDbPaisAlex);
begin
  FDbPaisAlex := Value;
end;

end.
