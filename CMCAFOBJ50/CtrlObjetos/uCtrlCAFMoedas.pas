unit uCtrlCAFMoedas;

interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,  
     SysUtils, dbclient, Provider,   
     uDBCAFMoedas;

Type
   TCtrlCAFMoedas = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbCafMoedas : TDBCafMoedas;

      Fcds: TClientDataSet;
      procedure Setcds(const Value: TClientDataSet);

      function CMTranslate(sIgor : String) : String;

   Public
      property cds : TClientDataSet read Fcds write Setcds;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Metodos de Persistencia
      //----------------------------------------------------------------------------------
      function AplicaOperacao : Boolean;
      function Procurar(nIdPessoa, nMoeCodigo : Extended) : OleVariant;
      function ListaCafMoedas(nIdPessoa : Extended; nMoeCodigo : Extended = -1): OleVariant;
      function VerificaCafMoeda(nIdPessoa, nMoeCodigo : Extended;
                                iTipoMoeda : Integer; sTipoOperacao : String) : Boolean;

   end;

implementation

{ TCtrlCAFMoedas }

function TCtrlCAFMoedas.AplicaOperacao: Boolean;
Var
   sSql : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoCAFMOEDAS( Fcds.Data );
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;

         if not ApplyCds(Fcds,_dbCafMoedas,[],[]) then
            Raise Exception.Create(_dbCafMoedas.MessageInfo);

         if _dbCafMoedas.IDTIPOMOEDA.AsInteger = 1 then
         begin
            sSql := ' UPDATE PARAMETROSCAFMANUT ' +
                    ' SET MOEDAOFICIAL = ' + floattostr(_dbCafMoedas.MOECODIGO.AsFloat) +
                    ' WHERE IDPESSOA = ' + floattostr(_dbCafMoedas.IDPESSOA.AsFloat);
         end else
         if _dbCafMoedas.IDTIPOMOEDA.AsInteger = 2 then
         begin
            sSql := ' UPDATE PARAMETROSCAFMANUT ' +
                    ' SET MOEDAFISCAL = ' + floattostr(_dbCafMoedas.MOECODIGO.AsFloat) +
                    ' WHERE IDPESSOA = ' + floattostr(_dbCafMoedas.IDPESSOA.AsFloat);
         end else
         if _dbCafMoedas.IDTIPOMOEDA.AsInteger = 3 then
         begin
            sSql := ' UPDATE PARAMETROSCAFMANUT ' +
                    ' SET MOEDAGERENCIAL = ' + floattostr(_dbCafMoedas.MOECODIGO.AsFloat) +
                    ' WHERE IDPESSOA = ' + floattostr(_dbCafMoedas.IDPESSOA.AsFloat);
         end;
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);

         Commit;
         Result := True;
      except
         On E : Exception Do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

constructor TCtrlCAFMoedas.Create;
begin
   inherited;
   _dbCafMoedas := TdbCafMoedas.Create(Self);
   Fcds         := TClientDataSet.Create(nil);
end;

destructor TCtrlCAFMoedas.Destroy;
begin
   if Fcds.Active then
      Fcds.Close;

   Fcds := nil;
   Fcds.Free;

   _dbCafMoedas.Free;

   inherited;
end;

procedure TCtrlCAFMoedas.DoChangeDataBase;
begin
   inherited;
   _dbCafMoedas.DataBaseName := DataBaseName;
end;

function TCtrlCAFMoedas.Procurar(nIdPessoa, nMoeCodigo : Extended): OleVariant;
begin
   _dbCafMoedas.MOECODIGO.AsFloat := nMoeCodigo;
   _dbCafMoedas.IDPESSOA.AsFloat  := nIdPessoa;
   Result := GetDataPacket(_dbCafMoedas.sSQLSelect);
end;

procedure TCtrlCAFMoedas.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

function TCtrlCAFMoedas.ListaCafMoedas(nIdPessoa, nMoeCodigo : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT CM.MOECODIGO, CM.IDPESSOA, CM.IDTIPOMOEDA, ' + #13 +
           '        M.MOEDESC, ' + #13 +
           '        DECODE(CM.IDTIPOMOEDA, 1, ''OFICIAL''  , ' + #13 +
           '        DECODE(CM.IDTIPOMOEDA, 2, ''FISCAL''   , ' + #13 +
           '        DECODE(CM.IDTIPOMOEDA, 3, ''GERENCIAL'', ''''))) AS DESCTIPOMOEDA ' + #13 +
           ' FROM CAFMOEDAS CM, ' + #13 +
           '      MOEDA M ' + #13 +
           ' WHERE CM.IDPESSOA = ' + floattostr(nIdPessoa) + #13;
   //-------------------------------------------------------------------------------------
   if nMoeCodigo <> -1 then
      sSql := sSql + '   AND CM.MOECODIGO = ' + floattostr(nMoeCodigo) + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND CM.MOECODIGO = M.MOECODIGO ' + #13 +
                  ' ORDER BY CM.IDTIPOMOEDA ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

function TCtrlCAFMoedas.VerificaCafMoeda(nIdPessoa, nMoeCodigo : Extended;
                                         iTipoMoeda : Integer; sTipoOperacao : String) : Boolean;
var
   sSql : String;

begin
   Result := True;
   //-------------------------------------------------------------------------------------
   if sTipoOperacao = 'I' then     // Inserir
   begin
      //----------------------------------------------------------------------------------
      // Verifica se já existe moeda oficial ou fiscal cadastradas
      //----------------------------------------------------------------------------------
      if (iTipoMoeda = 1) or (iTipoMoeda = 2) then
      begin
         sSql := ' SELECT CM.MOECODIGO, M.MOEDESC ' + #13 +
                 ' FROM CAFMOEDAS CM, ' + #13 +
                 '      MOEDA M ' + #13 +
                 ' WHERE CM.IDTIPOMOEDA = ' + inttostr(iTipoMoeda) + #13 +
                 '   AND CM.IDPESSOA = ' + floattostr(nIdPessoa) + #13 +
                 '   AND CM.MOECODIGO = M.MOECODIGO ' + #13;
         _cds.Data := GetDataPacket( sSql );
         if _cds.RecordCount <> 0 then
         begin
            if iTipoMoeda = 1 then
               MessageInfo := CMTranslate(' A Moeda ') + trim(_cds.FieldByName('MOEDESC').AsString) + CMTranslate(' já foi definida como Moeda Oficial.')
            else
               MessageInfo := CMTranslate(' A Moeda ') + trim(_cds.FieldByName('MOEDESC').AsString) + CMTranslate(' já foi definida como Moeda Fiscal.');
            //----------------------------------------------------------------------------
            Result := False;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Verifica se a moeda já foi cadastrada no CAF
      //----------------------------------------------------------------------------------
      sSql := ' SELECT CM.IDTIPOMOEDA, M.MOEDESC ' + #13 +
              ' FROM CAFMOEDAS CM, ' + #13 +
              '      MOEDA M ' + #13 +
              ' WHERE CM.MOECODIGO = ' + floattostr(nMoeCodigo) + #13 +
              '   AND CM.IDPESSOA = ' + floattostr(nIdPessoa) + #13 +
              '   AND CM.MOECODIGO = M.MOECODIGO ' + #13;
      _cds.Data := GetDataPacket( sSql );
      if _cds.RecordCount <> 0 then
      begin
         if _cds.FieldByName('IDTIPOMOEDA').AsInteger = 1 then
         begin
            MessageInfo := CMTranslate(' A Moeda ') + trim(_cds.FieldByName('MOEDESC').AsString) + CMTranslate(' já foi definida como Moeda Oficial.');
         end else
         if _cds.FieldByName('IDTIPOMOEDA').AsInteger = 2 then
         begin
            MessageInfo := CMTranslate(' A Moeda ') + trim(_cds.FieldByName('MOEDESC').AsString) + CMTranslate(' já foi definida como Moeda Fiscal.');
         end else
            MessageInfo := CMTranslate(' A Moeda ') + trim(_cds.FieldByName('MOEDESC').AsString) + CMTranslate(' já foi definida como Moeda Gerencial.');
         //-------------------------------------------------------------------------------
         Result := False;
      end;
   end;
end;

function TCtrlCAFMoedas.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

end.

