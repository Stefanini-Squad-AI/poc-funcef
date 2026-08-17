// Alterações:
{----------------------------------------------------------------------------------------------
Nº SOL......: 190498    SOL 190498 KTN 1969004
Nº KINTANA..: 1969004
Data........: 22/11/2013
Responsável.: Felipe A. Santos
Descrição...: Adicionado o campo Código da sub-despesa, também adicionado no procurar.
{----------------------------------------------------------------------------------------------
Nº SOL......: 172383-7761
Nº KINTANA..: 1556947
Data........: 24/02/2012
Responsável.: Edilaine Ferraresi
Descrição...: Adicionado novo item de menu  -> Cadastros ->  Fornecedores/Sub-Despesas
----------------------------------------------------------------------------------------------}

unit uCtrlDespesaOrcamentaria;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils,wwQuery, provider,
  uDbDespesaOrcamentaria, uDbDespesaOrcxCCusto, uCMTypes;

Type
  TCtrlDespesaOrcamentaria = class(TCmControlObject)

  Protected
    procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;

  private
    _dbDespesaOrcamentaria: TdbDespesaOrcamentaria;
    _dbDespesaOrcxCCusto :  TDbDespesaxCCusto;
    FCdsDespesaOrc: TClientDataSet;
    FCdsDespesaxCC: TClientDataSet;
    procedure SetCdsDespesaOrc(const Value: TClientDataSet);
    procedure SetCdsDespesaxCC(const Value: TClientDataSet);
    procedure ApagaCentroCusto(idDespesa : integer);

  public
      Constructor Create; Override;
      Destructor  Destroy; Override;

      function GravaDespesaOrcamentaria(var iIdOperacao : integer; iIdPessoa : integer) : Boolean;
      function AplicaOperacaoDespesaOrc : Boolean;
      function Procurar(idDespesaOrc : Double): OleVariant; overload;
      function Procurar(sSubDespesa : string): Integer; overload;

      function ListaDespesaxCC(idDespesaOrc : integer): OleVariant;
      function ListaCentroCusto(nIdDespesaOrc: integer) : OleVariant;
      function ListaFornecedor(nIdForn : Extended = -1): OleVariant;
      function ListaDespesa(nIdDespesaOrc : integer = -1): OleVariant;
      function GetIdDespesaOrc : integer;

      property CdsDespesaOrc: TClientDataSet read FCdsDespesaOrc write SetCdsDespesaOrc;
      property CdsDespesaxCC: TClientDataSet read FCdsDespesaxCC write SetCdsDespesaxCC;
      property IdDespesaOrc: integer read GetIdDespesaOrc;// Felipe A. Santos SOL 190498 KTN 1969004
  end;


implementation

{ TCtrlDespesaOrcamentaria }


function TCtrlDespesaOrcamentaria.GravaDespesaOrcamentaria(
  var iIdOperacao: integer; iIdPessoa : integer): Boolean;
begin
   try

     StartTransaction;

     // Felipe A. Santos SOL 190498 KTN 1969004
     {if iIdOperacao = -1 then
     begin
       iIdOperacao := GetSequence('SEQDESPESAORC');

       FCdsDespesaOrc.Edit;
       FCdsDespesaOrc.FieldByName('IDDespesaOrc').AsFloat := iIdOperacao;
       FCdsDespesaOrc.FieldByName('IDPessoa').AsInteger   := iIdPessoa;
       FCdsDespesaOrc.Post;
     end;
      }

     FCdsDespesaOrc.Edit;
     FCdsDespesaOrc.FieldByName('IDDespesaOrc').AsFloat := iIdOperacao;
     FCdsDespesaOrc.FieldByName('IDPessoa').AsInteger   := iIdPessoa;
     FCdsDespesaOrc.Post;

     // Felipe A. Santos  SOL 190498 KTN 1969004- fim

     ApagaCentroCusto( iIdOperacao );

     FCdsDespesaxCC.First;
     while not FCdsDespesaxCC.eof do
     begin
       FCdsDespesaxCC.edit;
       FCdsDespesaxCC.FieldByName('IDDespesaOrc').AsFloat := iIdOperacao;
       FCdsDespesaxCC.Post;

       FCdsDespesaxCC.next;
     end;


     Result := ApplyCds(FCdsDespesaOrc,_dbDespesaOrcamentaria,[],[]);
     if not Result then
        raise Exception.Create(_dbDespesaOrcamentaria.MessageInfo);

     if Result then
     begin
       Result := ApplyCds(FCdsDespesaxCC,_dbDespesaOrcxCCusto,[],[]);

       if not Result then
          raise Exception.Create(_dbDespesaOrcxCCusto.MessageInfo);
     end;

     Commit;

   except
      On E:Exception Do
      Begin
         Result := False;
         Rollback;
         MessageInfo := MessageInfo + E.Message;
      End;
   end;

end;


function TCtrlDespesaOrcamentaria.AplicaOperacaoDespesaOrc : Boolean;
begin
   If ConnectionSide = cnsClient then begin
     Result := Connection.AppServer.AplicaOperacaoDespesaOrc(FCdsDespesaOrc.Data);
     If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
     MessageInfo := '';
     Try
        StartTransaction;
        Result := ApplyCDS(FCdsDespesaOrc, _DbDespesaOrcamentaria,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbDespesaOrcamentaria.MessageInfo;
            Abort;
         End Else
            Commit;
      Except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := MessageInfo + E.Message;
         End;
      End;
   End;

end;

constructor TCtrlDespesaOrcamentaria.Create;
begin
  inherited;

  _dbDespesaOrcamentaria := TdbDespesaOrcamentaria.Create( Self );
  _dbDespesaOrcxCCusto   := TDbDespesaxCCusto.Create( Self );

end;

destructor TCtrlDespesaOrcamentaria.Destroy;
begin
  inherited;

  _dbDespesaOrcamentaria.Free;
  _dbDespesaOrcxCCusto.Free;

  If ( isAppServer ) Then Begin

    FCdsDespesaOrc.Free;
    FCdsDespesaxCC.Free;
  End;
end;

procedure TCtrlDespesaOrcamentaria.DoChangeDataBase;
begin
  inherited;

  _dbDespesaOrcamentaria.DatabaseName := DataBaseName;
  _dbDespesaOrcxCCusto.DatabaseName   := DataBaseName;
end;


function TCtrlDespesaOrcamentaria.ListaCentroCusto(nIdDespesaOrc: integer): OleVariant;
var
  sqltxt : String;
begin
  sqltxt := 'SELECT IDEMPRESA, ' +
            '       CODCENTROCUSTO, ' +
            '       trim(NOME) || decode(STATUSGRUPOCDC,''S'','' *'','''') || ' +
            '                     decode(ATIVO, ''S'', '''', '' (Inativo)'') as NOME ' +
            '  from CENTCUST ' +
            ' where ATIVO = ''S'' ';

  if nIdDespesaOrc > 0 then
     sqlTxt := sqlTxt + ' and CODCENTROCUSTO not in '+
                        '  (select CODCENTROCUSTO '+
                        '     from DESPESAORCXCCUSTO '+
                        '     where IDDESPESAORC = '+IntToStr(nIdDespesaOrc)+') ';

  sqlTxt := sqlTxt + ' order by NOME, CODCENTROCUSTO ';

  Result := GetDataPacket( sqlTxt );
end;


function TCtrlDespesaOrcamentaria.ListaDespesa(
  nIdDespesaOrc: integer): OleVariant;
var
  sqltxt : String;
begin

   sqlTxt := 'SELECT D.IDDESPESAORC, '+
             '       D.IDGRUPOORCAMEN, '+
             '       G.NOMEGRUPOORCAMEN, '+
             '       D.IDFORNECEDOR, '+
             '       P.NOME, '+
             '       D.FLGSTATUSDESPESA, '+
             '       DECODE(D.FLGSTATUSDESPESA, ''I'', ''INATIVO'', ''ATIVO'') AS STATUS, '+
             '       D.NATUREZA, '+
             '       D.SUBDESPESA, '+
             '       D.ACAO, '+
             '       D.DESCRICAO, '+
             '       D.IDPESSOA '+
             '  FROM '+
             '       DESPESAORCAMENTARIA D, ' +
             '       GRUPOORCAMEN G, ' +
             '       PESSOA P ' +
             ' WHERE D.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN(+) '+
             '   AND D.IDFORNECEDOR = P.IDPESSOA(+) '+
             '   AND D.IDDESPESAORC = '+IntToStr(nIdDespesaOrc);

   Result := GetDataPacket( sqltxt );
end;

function TCtrlDespesaOrcamentaria.ListaDespesaxCC(
  idDespesaOrc: integer): OleVariant;
var
  sqltxt : String;
begin

   sqlTxt := 'SELECT D.IDDESPESAORC, ' +
             '       CC.IDEMPRESA, '+
             '       CC.CODCENTROCUSTO, ' +
             '       trim(CC.NOME) || decode(CC.STATUSGRUPOCDC,''S'','' *'','''') || ' +
             '                        decode(CC.ATIVO, ''S'', '''', '' (Inativo)'') as NOME ' +
             '  from CENTCUST CC, DESPESAORCXCCUSTO D ' +
             ' where D.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) '+
             '   and D.IDDESPESAORC = '+IntToStr(idDespesaOrc);

   sqlTxt := sqlTxt + ' order by CC.NOME, CC.CODCENTROCUSTO ';

   Result := GetDataPacket( sqlTxt );

end;


function TCtrlDespesaOrcamentaria.ListaFornecedor(
  nIdForn: Extended): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT P.NOME, P.IDPESSOA, P.RAZAOSOCIAL, ' + #13 +
           ' F.IDFORCLI, F.CODSUBCONTA '                 + #13 +
           ' FROM EMPRESAFORN F, '                       + #13 +
           '      PESSOA P '                             + #13 ;
   //-------------------------------------------------------------------------------------
   if nIdForn <> -1 then
   begin
      sSql := sSql + '   WHERE (P.IDPESSOA = ' + floattostr(nIdForn) + ') AND ' + #13;
   end else
   begin
      sSql := sSql + '   WHERE '+ #13;
   end;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '         (F.IDFORCLI = P.IDPESSOA) '+ #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;


procedure TCtrlDespesaOrcamentaria.OnCreateAppServer;
begin
  inherited;

  FCdsDespesaOrc := TClientDataSet.Create(nil);
  FCdsDespesaxCC := TClientDataSet.Create(nil);
end;


function TCtrlDespesaOrcamentaria.Procurar(
  idDespesaOrc: Double): OleVariant;
begin
   _DbDespesaOrcamentaria.IdDespesaOrc.AsFloat := idDespesaOrc;
   Result := GetDataPacket(_DbDespesaOrcamentaria.SSqlSelect);
end;

procedure TCtrlDespesaOrcamentaria.SetCdsDespesaOrc(
  const Value: TClientDataSet);
begin
  FCdsDespesaOrc := Value;
end;

procedure TCtrlDespesaOrcamentaria.SetCdsDespesaxCC(
  const Value: TClientDataSet);
begin
  FCdsDespesaxCC := Value;
end;

function TCtrlDespesaOrcamentaria.Procurar(sSubDespesa: string): Integer;
var
  CdsLocal : TClientDataSet;
  sqltxt   : String;
begin
   CdsLocal := TClientDataSet.Create(Nil);

   sqlTxt := 'SELECT IDDESPESAORC '+
             '  FROM DESPESAORCAMENTARIA ' +
             ' WHERE LOWER(SUBDESPESA) = '+QuotedStr( Trim(AnsiLowerCase(sSubDespesa)) );

   try
      CdsLocal.Data := GetDataPacket( sqltxt );

      if cdsLocal.eof then
         result := -1
      else
         Result := CdsLocal.Fields[0].AsInteger;
    Finally
     CdsLocal.Free;
    End;

end;

procedure TCtrlDespesaOrcamentaria.ApagaCentroCusto(idDespesa : integer);
var
  sSQL : string;
begin
  sSql := 'DELETE FROM DESPESAORCXCCUSTO '+
          ' WHERE IDDESPESAORC = ' + IntToStr(idDespesa);

  ExecSQL(sSql);
end;

function TCtrlDespesaOrcamentaria.GetIdDespesaOrc: integer;
begin
   Result := GetSequence('SEQDESPESAORC');
end;

end.
