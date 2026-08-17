unit uCtrlBemCotacao;

interface

Uses DB, uCmDbObject, uCmControlObject, SysUtils, uCMTypes, dbclient,
     Provider, uDBBemCotacao;

Type
   TCtrlBemCotacao = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbBemCotacao : TDbBemCotacao;

      Fcds: TClientDataSet;
      procedure Setcds(const Value: TClientDataSet);


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
      function ProcurarBemCotacao(nEmpresaProp, nBem, nBemCotacao : Extended): OleVariant;
      function ListaBemCotacao(nEmpresaProp, nBem : Extended; nBemCotacao: Extended = -1): OleVariant;
      function Ultima(nEmpresaProp, nBem : Extended; var dDataCotacao : TDateTime) : Extended;
      function Valor(nEmpresaProp, nBem : Extended; dDataCotacao : TDateTime) : Extended;
   end;

implementation

{ TCtrlBemCotacao }

constructor TCtrlBemCotacao.Create;
begin
   inherited;
   _dbBemCotacao := TDbBemCotacao.Create(Self);
   Fcds := TClientDataSet.Create(nil);
end;

destructor TCtrlBemCotacao.Destroy;
begin
   if Fcds.Active then Fcds.Close;
   Fcds := nil;
   Fcds.Free;
   _dbBemCotacao.Free;
   inherited;
end;

procedure TCtrlBemCotacao.DoChangeDataBase;
begin
   inherited;
   _dbBemCotacao.DataBaseName := DataBaseName;
end;

procedure TCtrlBemCotacao.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

function TCtrlBemCotacao.ProcurarBemCotacao(nEmpresaProp, nBem, nBemCotacao: Extended): OleVariant;
begin
   _dbBemCotacao.IDBEM.AsFloat := nBem;
   _dbBemCotacao.IDPESSOA.AsFloat := nEmpresaProp;
   _dbBemCotacao.IDBEMCOTACAO.AsFloat := nBemCotacao;
   Result := GetDataPacket(_dbBemCotacao.sSQLSelect);
end;

function TCtrlBemCotacao.ListaBemCotacao(nEmpresaProp, nBem, nBemCotacao : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT BC.IDBEM, BC.IDPESSOA, ' + #13 +
           '        BC.IDBEMCOTACAO, BC.DATACOTACAO, BC.VALORCOTACAO, '+ #13 +
           '        B.PLACA, B.DESBEM '+ #13 +
           ' FROM BEMCOTACAO BC, ' + #13 +
           '      BEM B '+ #13 +
           ' WHERE BC.IDPESSOA = ' + floattostr(nEmpresaProp) + #13 +
           '   AND BC.IDBEM = ' + floattostr(nBem) + #13;
   //-------------------------------------------------------------------------------------
   if nBemCotacao <> -1 then
      sSql := sSql + ' AND BC.IDBEMCOTACAO = ' + floattostr(nBemCotacao) + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND BC.IDBEM = B.IDBEM ' + #13;
   sSql := sSql + '   AND BC.IDPESSOA = B.IDPESSOA ' + #13;
   sSql := sSql + ' ORDER BY BC.DATACOTACAO DESC, BC.IDBEMCOTACAO DESC ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlBemCotacao.Ultima(nEmpresaProp, nBem : Extended; var dDataCotacao : TDateTime) : Extended;
var
   sSql : String;

begin
   sSql := ' SELECT BC.DATACOTACAO, BC.VALORCOTACAO ' + #13 +
           ' FROM BEMCOTACAO BC, ' + #13 +
           '      (SELECT MAX(DATACOTACAO) AS ULTDATA '+ #13 +
           '       FROM BEMCOTACAO BC2 '+ #13 +
           '       WHERE BC2.IDPESSOA = ' + floattostr(nEmpresaProp) + #13 +
           '         AND BC2.IDBEM = ' + floattostr(nBem) + ') UC ' + #13 +
           ' WHERE BC.IDBEM = ' + floattostr(nBem) + #13 +
           '   AND BC.IDPESSOA = ' + floattostr(nEmpresaProp) + #13 +
           '   AND UC.ULTDATA = BC.DATACOTACAO '+ #13 ;
   _cds.Data := GetDataPacket(sSql);
   //-------------------------------------------------------------------------------------
   if _cds.IsEmpty then
   begin
      Result := 0;
      dDataCotacao := -1;
   end else
   begin
      Result := _cds.FieldByName('VALORCOTACAO').AsFloat;
      dDataCotacao := _cds.FieldByName('DATACOTACAO').AsDateTime;
   end;
end;

function TCtrlBemCotacao.Valor(nEmpresaProp, nBem : Extended; dDataCotacao : TDateTime) : Extended;
var
   sSql : String;

begin
   sSql := ' SELECT BC.DATACOTACAO, BC.VALORCOTACAO ' + #13 +
           ' FROM BEMCOTACAO BC, ' + #13 +
           '      (SELECT MAX(DATACOTACAO) AS ULTDATA '+ #13 +
           '       FROM BEMCOTACAO BC2 '+ #13 +
           '       WHERE BC2.DATACOTACAO <= TO_DATE(' + #39 + FormatDateTime('DD/MM/YYYY',dDataCotacao) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')' + #13 +
           '         AND BC2.IDBEM = ' + floattostr(nBem) + #13 +
           '         AND BC2.IDPESSOA = ' + floattostr(nEmpresaProp) + ') UC ' + #13 +
           ' WHERE BC.IDBEM = ' + floattostr(nBem) + #13 +
           '   AND BC.IDPESSOA = ' + floattostr(nEmpresaProp) + #13 +
           '   AND UC.ULTDATA = BC.DATACOTACAO '+ #13 ;
   _cds.Data := GetDataPacket(sSql);
   //-------------------------------------------------------------------------------------
   if _cds.IsEmpty then
      Result := 0
   else
      Result := _cds.FieldByName('VALORCOTACAO').AsFloat;
end;

function TCtrlBemCotacao.AplicaOperacao: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoBEMCOTACAO(Fcds.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;

         if not ApplyCds(Fcds,_dbBemCotacao,[],[]) then
            Raise Exception.Create(_dbBemCotacao.MessageInfo);

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

end.

