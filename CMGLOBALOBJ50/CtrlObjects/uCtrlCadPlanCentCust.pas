unit uCtrlCadPlanCentCust;

interface

uses
   DB, uDataBase, SysUtils, DBClient, Provider, uCmDbObject, uCmControlObject,
   uMidasUtil, uDbPlancentcust, uCMTypes, Classes;

type
   TCtrlCadPlanCentCust = class(TCmControlObject)

   protected

      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;


   private

      dbPlancentcust  : TDbPlancentcust;
      FCdsPlancentcust: TClientDataSet;

      procedure SetCdsPlancentcust(const Value: TClientDataSet);


   public

      constructor Create; override;
      destructor  Destroy; override;

      function  Grava : Boolean;

      function  Procurar(const IDPlanCentCust: Integer): OleVariant;
      function  Lista(const IDPlanCentCust: Integer): OleVariant;

      property  CdsPlanCentCust: TClientDataSet read FCdsPlancentcust write SetCdsPlancentcust;
  end;



implementation



procedure TCtrlCadPlanCentCust.DoChangeDataBase;
begin
   inherited;
   dbPlancentcust.DatabaseName := DataBaseName;
end;



procedure TCtrlCadPlanCentCust.OnCreateAppServer;
begin
   inherited;
   FCdsPlancentcust := TClientDataSet.Create(nil);
end;



constructor TCtrlCadPlanCentCust.Create;
begin
   inherited;
   dbPlancentcust := TdbPlancentcust.Create(Self);
end;



destructor TCtrlCadPlanCentCust.Destroy;
begin
   dbPlancentcust.Free;

   if isAppServer then
   begin
      FreeCds([FCdsPlancentcust]);
   end;

   inherited;

end;



function TCtrlCadPlanCentCust.Grava: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoParamOrcamento(FCdsPlancentcust.Data);
      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      MessageInfo := '';
      try
         StartTransaction;
         Result := ApplyCDS(FCdsPlancentcust, dbPlancentcust,[],[]);

         if not(Result) then
         begin
            MessageInfo := dbPlancentcust.MessageInfo;
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



procedure TCtrlCadPlanCentCust.SetCdsPlancentcust(const Value: TClientDataSet);
begin
   FCdsPlancentcust := Value;
end;



function TCtrlCadPlanCentCust.Procurar(const IDPlanCentCust: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '               + #13 +
   '   IDPLANCENTCUST, '   + #13 +
   '   DESCPLANCENTCUST, ' + #13 +
   '   IDPLANOANTERIOR, '  + #13 +
   '   DATAINI, '          + #13 +
   '   DATAFIM, '          + #13 +
   '   MASCARA '           + #13 +
   'FROM '                 + #13 +
   '   PLANCENTCUST ';

   if IDPlanCentCust > 0 then
   begin
      sSQL := sSQL         + #13 +
   'WHERE '                + #13 +
   '   IDPLANCENTCUST = '  + IntToStr(IDPlanCentCust);
   end;
   // P:21368 - 31/01/2006
   sSQL := sSQL + ' ORDER BY DESCPLANCENTCUST ';
   Result := GetDataPacket(sSQL);
end;



function TCtrlCadPlanCentCust.Lista(const IDPlanCentCust: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '               + #13 +
   '   IDPLANCENTCUST, '   + #13 +
   '   DESCPLANCENTCUST, ' + #13 +
   '   IDPLANOANTERIOR, '  + #13 +
   '   DATAINI, '          + #13 +
   '   DATAFIM, '          + #13 +
   '   MASCARA '           + #13 +
   'FROM '                 + #13 +
   '   PLANCENTCUST '      + #13 +
   'ORDER BY '             + #13 +
   '   DESCPLANCENTCUST ';

   Result := GetDataPacket(sSQL);
end;



end.
