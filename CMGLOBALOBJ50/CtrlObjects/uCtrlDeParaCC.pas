unit uCtrlDeParaCC;

interface

uses
   DB, uDataBase, SysUtils, DBClient, Provider, uCmDbObject, uCmControlObject,
   uMidasUtil, uDBDeParaCC, uCMTypes, Classes;

type
   TCtrlDeParaCC = class(TCmControlObject)

   protected

      procedure DoChangeDataBase; override;
      procedure OnCReateAppServer; override;


   private

      dbDeParaCC : TdbDeParaCC;
      FCdsDeParaCC: TClientDataSet;

      procedure SetCdsDeParaCC(const Value: TClientDataSet);


   public

      constructor Create; override;
      destructor  Destroy; override;

      function  Grava : Boolean;
      function  Insert(const IDPlanoCCIni : Int64;
                       const IDPlanoCCFim : Int64;
                       const CodCCIni     : String;
                       const CodCCFim     : String;
                       const IDEmpresa    : Int64
                       ) : Boolean;

      function  Delete(const IDPlanoCCIni : Int64;
                       const IDPlanoCCFim : Int64
                       ) : Boolean;

      function  Procurar(const IDDeParaCC   : Integer = 0;
                         const IDEmpresaProp: Integer = 0
                        ): OleVariant;

      property  CdsDeParaCC: TClientDataSet read FCdsDeParaCC write SetCdsDeParaCC;
  end;



implementation



procedure TCtrlDeParaCC.DoChangeDataBase;
begin
   inherited;
   dbDeParaCC.DatabaseName := DataBaseName;
end;



procedure TCtrlDeParaCC.OnCreateAppServer;
begin
   inherited;
   FCdsDeParaCC := TClientDataSet.Create(nil);
end;



constructor TCtrlDeParaCC.Create;
begin
   inherited;
   dbDeParaCC := TdbDeParaCC.Create(Self);
end;



destructor TCtrlDeParaCC.Destroy;
begin
   dbDeParaCC.Free;

   if isAppServer then
   begin
      FreeCds([FCdsDeParaCC]);
   end;
   inherited;
end;



function TCtrlDeParaCC.Grava: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoParamOrcamento(FCdsDeParaCC.Data);
      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      MessageInfo := '';
      try
         StartTransaction;
         Result := ApplyCDS(FCdsDeParaCC, dbDeParaCC,[],[]);

         if not(Result) then
         begin
            MessageInfo := dbDeParaCC.MessageInfo;
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



function TCtrlDeParaCC.Procurar(const IDDeParaCC   : Integer = 0;
                                const IDEmpresaProp: Integer = 0
                               ): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '               + #13 +
   '   IDDEPARACC, '       + #13 +
   '   IDEMPRESAPROP, '    + #13 +
   '   IDPLANCCINI, '      + #13 +
   '   CODCCINI, '         + #13 +
   '   IDPLANCCFIM, '      + #13 +
   '   CODCCFIM '          + #13 +
   'FROM '                 + #13 +
   '   DEPARACC ';

   if IDDeParaCC > 0 then
   begin
      sSQL := sSQL         + #13 +
   'WHERE '                + #13 +
   '   IDDEPARACC = '  + IntToStr(IDDeParaCC);
   end;

   Result := GetDataPacket(sSQL);
end;



procedure TCtrlDeParaCC.SetCdsDeParaCC(const Value: TClientDataSet);
begin
   FCdsDeParaCC := Value;
end;



function TCtrlDeParaCC.Insert(const IDPlanoCCIni : Int64;
                              const IDPlanoCCFim : Int64;
                              const CodCCIni     : String;
                              const CodCCFim     : String;
                              const IDEmpresa    : Int64
                              ) : Boolean;
var
    sSQL : String;
begin
   Result := True;
   try
      StartTransaction;
      sSQL :=
      'INSERT INTO DEPARACC (IDDEPARACC, IDPLANCCINI, IDPLANCCFIM, CODCCINI, CODCCFIM, IDEMPRESAPROP) ' +
      'VALUES      (SEQDEPARACC.NEXTVAL, ' +
      IntToStr(IDPlanoCCIni) + ',' +
      IntToStr(IDPlanoCCFim) + ',' +
      QuotedStr(Trim(CodCCIni)) + ',' +
      QuotedStr(Trim(CodCCFim)) + ',' +
      IntToStr(IDEmpresa) + ')';
      ExecSql(sSQL);
      Commit;
   except
      RollBack;
      Result := False;
   end;
end;



function TCtrlDeParaCC.Delete(const IDPlanoCCIni : Int64;
                              const IDPlanoCCFim : Int64
                              ) : Boolean;
var
    sSQL : String;
begin
   Result := True;
   try
      StartTransaction;
      sSQL :=
      'DELETE FROM DEPARACC WHERE IDPLANCCINI = ' + IntToStr(IDPlanoCCIni) + ' AND IDPLANCCFIM = ' + IntToStr(IDPlanoCCFim);
      ExecSql(sSQL);
      Commit;
   except
      RollBack;
      Result := False;
   end;
end;


end.
