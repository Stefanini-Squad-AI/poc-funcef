unit uCtrlEstadoAlex;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase,
  DbClient, uCMTypes, uCMClientDataSet, Classes, uDbEstadoAlex ;

type
  TCtrlEstadoAlex = class(TCmControlObject)

  protected
    procedure DoChangeDataBase; override;

    procedure AfterInitialize; override;

  private
    FCdsEstadoAlex: TCmClientDataSet;
    FDbEstadoAlex: TDbEstadoAlex;
    procedure SetCdsEstadoAlex(const Value: TCmClientDataSet);
    procedure SetDbEstadoAlex(const Value: TDbEstadoAlex);

  public

    constructor Create; override;
    destructor  Destroy; override;
    function    Gravar : Boolean;

    function Inserir: boolean;
    function Alterar: boolean;
    function Excluir(const iIdEstado: integer): boolean;

    property DbEstadoAlex: TDbEstadoAlex read FDbEstadoAlex write SetDbEstadoAlex;
    property CdsEstadoAlex: TCmClientDataSet read FCdsEstadoAlex write SetCdsEstadoAlex;

    function Seleciona ( iIdEstado: integer): OleVariant;
    function SelecionaPais : OleVariant;

  end;

implementation

{ TCtrlEstadoAlex }

procedure TCtrlEstadoAlex.AfterInitialize;
begin
  inherited;

end;

function TCtrlEstadoAlex.Alterar: boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.Inserir ( CdsEstadoAlex.data) ;
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Try
      CdsToDbObject (CdsEstadoAlex, DbEstadoAlex);

      StartTransaction;
      Result := DbEstadoAlex.Update;

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

constructor TCtrlEstadoAlex.Create;
begin
  inherited;
  FDbEstadoAlex  := TDbEstadoAlex.Create ( self );
  FCdsEstadoAlex := TCMClientDataSet.Create ( nil );
end;

destructor TCtrlEstadoAlex.Destroy;
begin
  FreeAndNil (FcdsEstadoAlex);
  FreeAndNil (fDbEstadoAlex);
  inherited;

end;

procedure TCtrlEstadoAlex.DoChangeDataBase;
begin
  inherited;
  FDbEstadoAlex.DataBaseName := DataBaseName;
end;

function TCtrlEstadoAlex.Excluir(const iIdEstado: integer): boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.Excluir(iIdEstado);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Try
      FDbEstadoAlex.Idestado.AsInteger := iIdEstado;

      StartTransaction;
      Result := FDbEstadoAlex.Delete;

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

function TCtrlEstadoAlex.Gravar: Boolean;
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
      Result := ApplyCds (CdsEstadoAlex, DbEstadoAlex, [], [] );
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

function TCtrlEstadoAlex.Inserir: boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.Inserir ( CdsEstadoAlex.data) ;
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Try
      CdsToDbObject (CdsEstadoAlex, DbEstadoAlex);

      StartTransaction;
      Result := DbEstadoAlex.Insert;

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

function TCtrlEstadoAlex.Seleciona(iIdEstado: integer): OleVariant;
var sSql: string;
begin
   sSql := 'select * from estado e, pais p where e.idpais = p.idpais';

   if iIdEstado <> 0 then
     sSql := sSql + ' and e.idestado = ' + IntToStr (iIdEstado);

   result := GetDataPacket (sSql);
end;

function TCtrlEstadoAlex.SelecionaPais: OleVariant;
begin
  Result := GetDataPacket('select * from pais');
end;

procedure TCtrlEstadoAlex.SetCdsEstadoAlex(const Value: TCmClientDataSet);
begin
  FCdsEstadoAlex := Value;
end;

procedure TCtrlEstadoAlex.SetDbEstadoAlex(const Value: TDbEstadoAlex);
begin
  FDbEstadoAlex := Value;
end;

end.
