unit uCtrlAditamentos;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet, uDbAditamento
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlAditamentos = Class(TCmControlObject)

   private
      FDbAditamento  : TDbAditamento;
      FCdsAditamento : TCMClientDataSet;
   public
      property CdsAditamento: TCMClientDataSet read FCdsAditamento write FCdsAditamento;

      constructor Create; override;
      destructor Destroy; override;

      function ListAditamento(rIDAditamento, rIDContrato: Double): OleVariant;
      function AplicaAtualAditamento: Boolean;

      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
   end;


implementation

{ TCtrlCorrecoesContratuais }

constructor TCtrlAditamentos.Create;
begin
   inherited;
   FDbAditamento:=TDbAditamento.Create(Self);
end;

destructor TCtrlAditamentos.Destroy;
begin
   FDbAditamento.Free;
   if IsAppServer then FCdsAditamento.Free;
   inherited;
end;

procedure TCtrlAditamentos.OnCreateAppServer;
begin
   inherited;
   FCdsAditamento:=TCMClientDataSet.Create(nil);
end;

procedure TCtrlAditamentos.DoChangeDataBase;
begin
   inherited;
   FDbAditamento.DataBaseName:=DataBaseName;
end;

function TCtrlAditamentos.AplicaAtualAditamento: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualAditamento(FCdsAditamento.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          Result:=ApplyCds(FCdsAditamento ,FDbAditamento,[],[]);

          if not Result then
           begin
              MessageInfo := FDbAditamento.MessageInfo;
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

function TCtrlAditamentos.ListAditamento(rIDAditamento, rIDContrato: Double): OleVariant;
var
   sSql: String;
begin
   sSql:='SELECT * '+
         'FROM ADITAMENTO '+
         'WHERE (IDCONTRATO = '+FloatToStr(rIDContrato)+') ';
   if (rIDAditamento<>0) then
      sSql:=sSql+'      AND (IDADITAMENTO = '+FloatToStr(rIDAditamento)+') ';
   Result:=GetDataPacket(sSql);
end;

end.
