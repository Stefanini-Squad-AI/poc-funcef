unit uCtrlContasFundos;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     udbCpAtivo, uCMClientDataSet, UCMTypes, 
     Dialogs, uCtrlPadroes, uDbCpconta, UFuncaoGeral;

type
   TCtrlContasFundos = Class(TCmControlObject)
   private

    dbCpConta: TDbCpConta;

   public
      Cds: TCMClientDataSet;
      CdsCarrega: TCMClientDataSet;

      Function CarregaContasFundos: OleVariant;
      Function GravaDadosConta: Boolean;
      Constructor Create; override;
      Destructor Destroy; override;

      function VerificaNome( iIdCpConta : integer; sNome : string ): Boolean;

      function ContasPorAtivo( iIDCPATIVO : integer; fVlCota : extended = 0 ) : OLEVariant;

   protected
      procedure DoChangeDataBase; override;
   end;


implementation

constructor TCtrlContasFundos.Create;
begin
  inherited;
  dbCpConta:= TDbCpConta.Create(self);
  Cds:= TCMClientDataSet.Create(nil);
  CdsCarrega:= TCMClientDataSet.Create(nil);

end;

destructor TCtrlContasFundos.Destroy;
begin
  dbCpConta.Free;

  if IsAppServer then
     Cds.Free;
     CdsCarrega.Free;
  inherited;
end;

procedure TCtrlContasFundos.DoChangeDataBase;
begin
  inherited;
  dbCpConta.DataBaseName := databasename;

end;

function TCtrlContasFundos.GravaDadosConta: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.GravaDadosConta;
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          Result:=ApplyCds(Cds, dbCpConta, [],[]);

          if not(Result) then
              Raise Exception.Create(dbCpConta.MessageInfo);

           Commit;
           Result:= True;
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


function TCtrlContasFundos.CarregaContasFundos: OleVariant;
Var
  sSQL: String;
begin
  sSQL:= 'SELECT                                                          '+
         '   CP.IDCPCONTA, CP.NOME, CP.DESCRICAO, CP.IDCPATIVO, A.NOME,   '+
         '   CP.COTASABERT                                                '+
         'FROM                                                            '+
         '   CPCONTA CP, CPATIVO A                                        '+
         'WHERE                                                           '+
         '   CP.IDCPATIVO = A.IDCPATIVO';                                 
  Result:=GetDataPacket(sSQL);
end;


function TCtrlContasFundos.VerificaNome( iIdCpConta : integer; sNome : string ): Boolean;
begin
  CdsCarrega.Data := GetDataPacket('SELECT IDCPCONTA, NOME, DESCRICAO, IDCPATIVO, '+
   ' COTASABERT FROM CPCONTA WHERE UPPER(NOME) = ' + UpperCase(QuotedStr(sNome) +
   ' AND IDCPCONTA <> ' + IntToStr( iIdCpConta ) ) );
  Result:= CdsCarrega.IsEmpty;
end;


function TCtrlContasFundos.ContasPorAtivo( iIDCPATIVO : integer; fVlCota : extended = 0 ) : OLEVariant;
var
  s, sSQL : String;
  FuncaoGeral : TFuncaoGeral;
begin
  s := ''; 
  if fVlCota > 0 then
  begin
    FuncaoGeral := TFuncaoGeral.Create;
    try
      s := ' * ' + FuncaoGeral.OraNumero( fVlCota );
    finally
      FuncaoGeral.Free;
    end;
  end;

  sSQL := ' select IDCPCONTA, NOME, DESCRICAO, IDCPATIVO, ' +
   ' COTASABERT, COTASABERT ' + s + ' as VLABERT ' +
   ' from CPCONTA where IDCPATIVO = ' + IntToStr( iIDCPATIVO );
   
  Result := GetDataPacket( sSQL );
end;

end.
