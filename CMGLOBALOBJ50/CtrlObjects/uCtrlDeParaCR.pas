unit uCtrlDeParaCR;

interface

uses
   DB, uDataBase, SysUtils, DBClient, Provider, uCmDbObject, uCmControlObject,
   uMidasUtil, uDBDeParaCR, uCMTypes, Classes;

type
   TCtrlDeParaCR = class(TCmControlObject)

   protected

      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;


   private

      dbDeParaCR : TdbDeParaCR;
      FCdsDeParaCR: TClientDataSet;

      procedure SetCdsDeParaCR(const Value: TClientDataSet);


   public

      constructor Create; override;
      destructor  Destroy; override;

      function  Grava: Boolean;
      function  Insert(const IDPlanoCRIni : Int64;
                       const IDPlanoCRFim : Int64;
                       const CodCRIni     : String;
                       const CodCRFim     : String;
                       const IDEmpresa    : Int64
                       ) : Boolean;

      function  Delete(const IDPlanoCRIni : Int64;
                       const IDPlanoCRFim : Int64
                       ) : Boolean;

      function  Procurar(const IDDeParaCR   : Integer = 0;
                         const IDEmpresaProp: Integer = 0
                        ): OleVariant;

      property  CdsDeParaCR: TClientDataSet read FCdsDeParaCR write SetCdsDeParaCR;
  end;



implementation



procedure TCtrlDeParaCR.DoChangeDataBase;
begin
   inherited;
   dbDeParaCR.DatabaseName := DataBaseName;
end;



procedure TCtrlDeParaCR.OnCreateAppServer;
begin
   inherited;
   FCdsDeParaCR := TClientDataSet.Create(nil);
end;



constructor TCtrlDeParaCR.Create;
begin
   inherited;
   dbDeParaCR := TdbDeParaCR.Create(Self);
end;



destructor TCtrlDeParaCR.Destroy;
begin
   dbDeParaCR.Free;

   if isAppServer then
   begin
      FreeCds([FCdsDeParaCR]);
   end;
   inherited;
end;



function TCtrlDeParaCR.Grava: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoParamOrcamento(FCdsDeParaCR.Data);
      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      MessageInfo := '';
      try
         StartTransaction;
         Result := ApplyCDS(FCdsDeParaCR, dbDeParaCR,[],[]);

         if not(Result) then
         begin
            MessageInfo := dbDeParaCR.MessageInfo;
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



function TCtrlDeParaCR.Procurar(const IDDeParaCR   : Integer = 0;
                                const IDEmpresaProp: Integer = 0
                               ): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '               + #13 +
   '   IDDEPARACR, '       + #13 +
   '   IDEMPRESAPROP, '    + #13 +
   '   IDPLANCRINI, '      + #13 +
   '   CODCRINI, '         + #13 +
   '   IDPLANCRFIM, '      + #13 +
   '   CODCRFIM '          + #13 +
   'FROM '                 + #13 +
   '   DEPARACR '          + #13 +
   'WHERE '                + #13 +
   '   IDEMPRESAPROP  = '  + IntToStr(IDEmpresaProp);

   if IDDeParaCR > 0 then sSQL := sSQL + #13 +
   '   AND IDDEPARACR = '  + IntToStr(IDDeParaCR);

   Result := GetDataPacket(sSQL);
end;



procedure TCtrlDeParaCR.SetCdsDeParaCR(const Value: TClientDataSet);
begin
   FCdsDeParaCR := Value;
end;


function TCtrlDeParaCR.Insert(const IDPlanoCRIni : Int64;
                              const IDPlanoCRFim : Int64;
                              const CodCRIni     : String;
                              const CodCRFim     : String;
                              const IDEmpresa    : Int64
                              ) : Boolean;
var
    sSQL : String;
begin
   Result := True;
   try
      StartTransaction;
      sSQL :=
      'INSERT INTO DEPARACR (IDDEPARACR, IDPLANCRINI, IDPLANCRFIM, CODCRINI, CODCRFIM, IDEMPRESAPROP) ' +
      'VALUES      (SEQDEPARACR.NEXTVAL, ' +
      IntToStr(IDPlanoCRIni) + ',' +
      IntToStr(IDPlanoCRFim) + ',' +
      QuotedStr(Trim(CodCRIni)) + ',' +
      QuotedStr(Trim(CodCRFim)) + ',' +
      IntToStr(IDEmpresa) + ')';
      ExecSql(sSQL);
      Commit;
   except
      RollBack;
      Result := False;
   end;
end;



function TCtrlDeParaCR.Delete(const IDPlanoCRIni : Int64;
                              const IDPlanoCRFim : Int64
                              ) : Boolean;
var
    sSQL : String;
begin
   Result := True;
   try
      StartTransaction;
      sSQL :=
      'DELETE FROM DEPARACR WHERE IDPLANCRINI = ' + IntToStr(IDPlanoCRIni) + ' AND IDPLANCRFIM = ' + IntToStr(IDPlanoCRFim);
      ExecSql(sSQL);
      Commit;
   except
      RollBack;
      Result := False;
   end;
end;


end.
