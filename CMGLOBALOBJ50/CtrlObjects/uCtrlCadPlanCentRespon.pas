unit uCtrlCadPlanCentRespon;

interface

uses
   DB, uDataBase, SysUtils, DBClient, Provider, uCmDbObject, uCmControlObject,
   uMidasUtil, uDbPlanCentRespon, uCMTypes, Classes;

type
   TCtrlCadPlanCentRespon = class(TCmControlObject)

   protected

      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;


   private

      dbPlanCentRespon  : TDbPlanCentRespon;
      FCdsPlanCentRespon: TClientDataSet;

      procedure SetCdsPlanCentRespon(const Value: TClientDataSet);


   public

      constructor Create; override;
      destructor  Destroy; override;

      function  Grava : Boolean;

      function  Procurar(const IDPlanCentRespon: Integer): OleVariant;
      function  Lista(const IDPlanCentRespon: Integer): OleVariant;

      property  CdsPlanCentRespon: TClientDataSet read FCdsPlanCentRespon write SetCdsPlanCentRespon;
  end;



implementation


procedure TCtrlCadPlanCentRespon.DoChangeDataBase;
begin
   inherited;
   dbPlanCentRespon.DatabaseName   := DataBaseName;
end;



procedure TCtrlCadPlanCentRespon.OnCreateAppServer;
begin
   inherited;
   FCdsPlanCentRespon   := TClientDataSet.Create(nil);
end;



constructor TCtrlCadPlanCentRespon.Create;
begin
   inherited;
   dbPlanCentRespon    := TdbPlanCentRespon.Create(Self);
end;



destructor TCtrlCadPlanCentRespon.Destroy;
begin
   dbPlanCentRespon.Free;

   if isAppServer then
   begin
      FreeCds([FCdsPlanCentRespon]);
   end;
   inherited;
end;



function TCtrlCadPlanCentRespon.Grava: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoParamOrcamento(FCdsPlanCentRespon.Data);
      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      MessageInfo := '';
      try
         StartTransaction;
         Result := ApplyCDS(FCdsPlanCentRespon, dbPlanCentRespon,[],[]);

         if not(Result) then
         begin
            MessageInfo := dbPlanCentRespon.MessageInfo;
            Abort;
         end
         else
         begin
            Commit;
         end;
      except
         on E:Exception do
         begin
            Result := False;
            Rollback;
            MessageInfo := MessageInfo + E.Message;
         end;
      end;
   end;
end;



procedure TCtrlCadPlanCentRespon.SetCdsPlanCentRespon(const Value: TClientDataSet);
begin
   FCdsPlanCentRespon := Value;
end;



function TCtrlCadPlanCentRespon.Procurar(const IDPlanCentRespon: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '               + #13 +
   '   IDPLANCRESPON, '    + #13 +
   '   DESCPLANCRESPON, '  + #13 +
   '   IDPLANOANTERIOR, '  + #13 +
   '   DATAINI, '          + #13 +
   '   DATAFIM, '          + #13 +
   '   MASCARA '           + #13 +
   'FROM '                 + #13 +
   '   PLANCENTRESPON ';

   if IDPlanCentRespon > 0 then
   begin
      sSQL := sSQL         + #13 +
   'WHERE '                + #13 +
   '   IDPLANCRESPON = '   + IntToStr(IDPlanCentRespon);
   end;
   // P:21368 - 06/02/2006
   sSQL := sSQL + ' ORDER BY DESCPLANCRESPON ';
   Result := GetDataPacket(sSQL);
end;



function TCtrlCadPlanCentRespon.Lista(const IDPlanCentRespon: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '               + #13 +
   '   IDPLANCRESPON, '    + #13 +
   '   DESCPLANCRESPON, '  + #13 +
   '   IDPLANOANTERIOR, '  + #13 +
   '   DATAINI, '          + #13 +
   '   DATAFIM, '          + #13 +
   '   MASCARA '           + #13 +
   'FROM '                 + #13 +
   '   PLANCENTRESPON '    + #13 +
   'ORDER BY '             + #13 +
   '   DESCPLANCRESPON ';

   Result := GetDataPacket(sSQL);
end;



end.
