unit UCtrlTranffundos;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMClientDataSet,
     udbTranffundos, ucmTypes;

type
   TCtrlTranffundos = Class(TCmControlObject)
   private
     FdbTranffundos : TdbTranffundos;
     FCdsTransffundos : TCMClientDataSet;
     procedure SetCdsTransffundos(const Value: TCMClientDataSet);

   public
     property CdsTransffundos : TCMClientDataSet read FCdsTransffundos write SetCdsTransffundos;
     constructor Create; override;
     destructor Destroy; override;
     function AplicaAtualTransffundos: Boolean;

   protected
     procedure DoChangeDataBase; override;
   end;

implementation

{ TCtrlDsiponFinanc }

constructor TCtrlTranffundos.Create;
begin
  inherited Create;
  FdbTranffundos := TdbTranffundos.Create(Self);
end;

destructor TCtrlTranffundos.Destroy;
begin
  FdbTranffundos.Free;

  inherited;
end;


procedure TCtrlTranffundos.SetCdsTransffundos(const Value: TCMClientDataSet);
begin
  FCdsTransffundos := Value;
end;



function TCtrlTranffundos.AplicaAtualTransffundos: Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.AplicaAtualTransffundos(FCdsTransffundos.Data);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsTransffundos,FdbTranffundos,[],[]);
      if not Result then
      begin
        MessageInfo := FdbTranffundos.MessageInfo;
        Rollback;
      end
      else
        Commit;
    except
    on E:Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end; //on
  end;
end;



procedure TCtrlTranffundos.DoChangeDataBase;
begin
   inherited;
   FdbTranffundos.DataBaseName := DataBaseName;
end;


end.

