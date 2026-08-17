unit uCtrlReferenciaContr;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet, uDbReferenciaContr
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlReferenciaContr = Class(TCmControlObject)

   private
      FDbReferenciaContr  : TDbReferenciaContr;
      FCdsReferenciaContr : TCMClientDataSet;
   public
      property CdsReferenciaContr: TCMClientDataSet read FCdsReferenciaContr write FCdsReferenciaContr;

      constructor Create; override;
      destructor Destroy; override;

      function ListReferenciaContr(rIdRefContr: Double): OleVariant;
      function AplicaReferenciaContr: Boolean;

      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrlReferenciaContr }

constructor TCtrlReferenciaContr.Create;
begin
   inherited;
   FDbReferenciaContr:=TDbReferenciaContr.Create(Self);
end;

procedure TCtrlReferenciaContr.OnCreateAppServer;
begin
   inherited;
   FCdsReferenciaContr:=TCMClientDataSet.Create(nil);
end;

destructor TCtrlReferenciaContr.Destroy;
begin
   FDbReferenciaContr.Free;
   if IsAppServer then FCdsReferenciaContr.Free;
   inherited;
end;

procedure TCtrlReferenciaContr.AfterInitialize;
begin
   inherited;
end;

procedure TCtrlReferenciaContr.DoChangeDataBase;
begin
   inherited;
   FDbReferenciaContr.DataBaseName:=DataBaseName;
end;

function TCtrlReferenciaContr.ListReferenciaContr(rIdRefContr: Double): OleVariant;
var
   sSql: String;
begin
   sSql:='SELECT * FROM REFERENCIACONTR ';
   if (rIdRefContr<>0) then
      sSql:=sSql+'WHERE (IDREFCONTR = '+ FloatToStr(rIdRefContr)+') ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlReferenciaContr.AplicaReferenciaContr: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaReferenciaContr(FCdsReferenciaContr.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          Result:=ApplyCds(FCdsReferenciaContr,FDbReferenciaContr,[],[]);
          if not Result then
           begin
              MessageInfo := FDbReferenciaContr.MessageInfo;
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
       end;
    end;
end;

end.
