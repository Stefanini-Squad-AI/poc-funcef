{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 01/04/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlLogTabelas;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbLogTabelas;

Type
  TCtrlLogTabelas = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbLogTabelas: TDbLogTabelas;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds: TClientDataSet read Fcds write Setcds;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    Function  ApagarLogTabelas( DataLimite: TDateTime; bSalva: Boolean = True ): Boolean;
    function  ListaCamposTabela( tabela: String ): OleVariant;
    Function  ListaLogtabelas( IdLogTabela: Double = 0; DataLimite: TDateTime = 0;
              Linhas: Integer = 0 ): OleVariant;
    function  ListaAltExcLogTabelas( tabela, scoluna, datalogi, datalogf,
              svaloranterior, svaloratual, usuario, arquivo, operacao: String ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation
{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}
function TCtrlLogTabelas.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarLogTabelas( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbLogTabelas, [], [] );
        Msg    := _DbLogTabelas.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Commit;
     Except
        On E:Exception Do
        Begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;

constructor TCtrlLogTabelas.Create;
begin
  inherited;
  _DbLogTabelas := TDbLogTabelas.Create(Self);
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlLogTabelas.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbLogTabelas.Free;

  inherited;
end;

procedure TCtrlLogTabelas.DoChangeDataBase;
begin
  inherited;
  _DbLogTabelas.DataBaseName := DatabaseName;
end;

function TCtrlLogTabelas.ListaCamposTabela( tabela: String ): OleVariant;
begin
  Try
     Result := GetDataPacket( 'SELECT * FROM ' + UpperCase( Trim( tabela ) ) + ' WHERE 1 = 2' );
  Except
     On E:Exception Do
     Begin
        MessageInfo := E.Message;
     End;
  End;
end;

function TCtrlLogTabelas.ListaLogTabelas( IdLogTabela: Double; DataLimite: TDateTime;
         Linhas: Integer ): OleVariant;
var
  bwhere: Boolean;
  sql: String;
begin
  sql := 'SELECT IDLOGTABELA, ARQUIVO, NOMECAMPO, CHAVEPRIMARIA, VALORATUAL, ' +
                'VALORANTERIOR, OPERACAO, USUARIO, DATAHORA, LOTETRANSMISSAO ' +
           'FROM LOGTABELAS';
  bwhere := False;

  If DataLimite <> 0 Then Begin
     Sql := Sql + ' WHERE DATAHORA <= TO_DATE( ' + QuotedStr( DateToStr( DataLimite ) ) + ', ''DD/MM/YYYY'' )';
     bwhere := True;
  End;

  If IdLogTabela <> 0 Then Begin
     If Not bwhere Then
        Sql := Sql + ' WHERE'
     Else
        Sql := Sql + ' AND';

     Sql := Sql + ' IDLOGTABELA = ' + FloatToStr( IdLogTabela );
  End;

  If Linhas <> 0 Then Begin
     If Not bwhere Then
        Sql := Sql + ' WHERE'
     Else
        Sql := Sql + ' AND';

     Sql := Sql + ' ROWNUM <= ' + IntToStr( linhas );
  End;

  Result := GetDataPacket( Sql );
end;

function TCtrlLogTabelas.ListaAltExcLogTabelas( tabela, scoluna, datalogi, datalogf,
         svaloranterior, svaloratual, usuario, arquivo, Operacao: String ): OleVariant;
var
  bsel: Boolean;
  Sql: String;
begin
  operacao := UpperCase( operacao );
  bsel := False;
  sql  := sql + 'SELECT * FROM ( ';

  If ( operacao = 'I' ) Or ( operacao = 'T' ) Or ( operacao = '' ) Then Begin
     SQl := SQl + 'SELECT DATAHORA, CHAVEPRIMARIA, ARQUIVO, USUARIO, OPERACAO, ' +
                  '''INCLUSÃO'' AS DESCOPERACAO, NOMECAMPO, VALORATUAL, VALORANTERIOR ' +
                  'FROM ' + tabela + ' ' +
                  'WHERE (OPERACAO = ''I'')';

     If datalogi <> '' Then
        sql := sql + ' AND ( SUBSTR( DATAHORA, 1, 10 ) >= TO_DATE( ' +
                     QuotedStr( Trim( datalogi ) ) + ', ''DD/MM/YYYY'' ) )';

     If datalogf <> '' Then
        sql := sql + ' AND ( SUBSTR( DATAHORA, 1, 10 ) <= TO_DATE( ' +
                     QuotedStr( Trim( datalogf ) ) + ', ''DD/MM/YYYY'' ) )';

     If scoluna <> '' Then Begin
        sql := sql + ' AND UPPER( RTRIM( NOMECAMPO ) ) = ' +
                     QuotedStr( UpperCase( Trim( scoluna ) ) );

        If svaloranterior = '' Then
           sql := sql + ' AND VALORANTERIOR IS NOT NULL';
     End;

     If svaloranterior <> '' Then
        sql := sql + ' AND UPPER( RTRIM( VALORANTERIOR ) ) = ' +
                     QuotedStr( UpperCase( Trim( svalorAnterior ) ) );

     If svaloratual <> '' Then
        sql := sql + ' AND UPPER( RTRIM( VALORATUAL ) ) = ' +
                     QuotedStr( UpperCase( Trim( svaloratual ) ) );

     If arquivo <> '' Then
        sql := sql + ' AND UPPER( RTRIM( ARQUIVO ) ) = ' +
                     QuotedStr( UpperCase( Trim( arquivo ) ) );

     If usuario <> '' Then
        sql := sql + ' AND UPPER( RTRIM( USUARIO ) ) = ' +
                     QuotedStr( 'CM' + UpperCase( Trim( usuario ) ) );

     bsel := True;
  End;

  If ( operacao = 'U' ) Or ( operacao = 'T' ) Or ( operacao = '' ) Then Begin
     If bsel Then
        sql := sql + ' UNION ALL ';

     SQl := SQl + 'SELECT DATAHORA, CHAVEPRIMARIA, ARQUIVO, USUARIO, OPERACAO, ' +
                  '''ALTERAÇÃO'' AS DESCOPERACAO, NOMECAMPO, VALORATUAL, VALORANTERIOR ' +
                  'FROM ' + tabela + ' ' +
                  'WHERE (OPERACAO = ''U'')';

     If datalogi <> '' Then
        sql := sql + ' AND ( SUBSTR( DATAHORA, 1, 10 ) >= TO_DATE( ' +
                     QuotedStr( Trim( datalogi ) ) + ', ''DD/MM/YYYY'' ) )';

     If datalogf <> '' Then
        sql := sql + ' AND ( SUBSTR( DATAHORA, 1, 10 ) <= TO_DATE( ' +
                     QuotedStr( Trim( datalogf ) ) + ', ''DD/MM/YYYY'' ) )';

     If scoluna <> '' Then Begin
        sql := sql + ' AND UPPER( RTRIM( NOMECAMPO ) ) = ' +
                     QuotedStr( UpperCase( Trim( scoluna ) ) );

        If svaloranterior = '' Then
           sql := sql + ' AND VALORANTERIOR IS NOT NULL';
     End;

     If svaloranterior <> '' Then
        sql := sql + ' AND UPPER( RTRIM( VALORANTERIOR ) ) = ' +
                     QuotedStr( UpperCase( Trim( svalorAnterior ) ) );

     If svaloratual <> '' Then
        sql := sql + ' AND UPPER( RTRIM( VALORATUAL ) ) = ' +
                     QuotedStr( UpperCase( Trim( svaloratual ) ) );

     If arquivo <> '' Then
        sql := sql + ' AND UPPER( RTRIM( ARQUIVO ) ) = ' +
                     QuotedStr( UpperCase( Trim( arquivo ) ) );

     If usuario <> '' Then
        sql := sql + ' AND UPPER( RTRIM( USUARIO ) ) = ' +
                     QuotedStr( 'CM' + UpperCase( Trim( usuario ) ) );

     bsel := True;
  End;

  If ( operacao = 'D' ) Or ( operacao = 'T' ) Or ( operacao = '' ) Then Begin
     If bsel Then
        sql := sql + ' UNION ALL ';

     sql := sql + 'SELECT DISTINCT DATAHORA, CHAVEPRIMARIA, ARQUIVO, USUARIO, ' +
                  'OPERACAO, ''EXCLUSÃO'' AS DESCOPERACAO, '''' AS NOMECAMPO, ' +
                  ''''' AS VALORATUAL, '''' AS VALORANTERIOR ' +
                  'FROM ' + tabela + ' ' +
                  'WHERE (OPERACAO = ''D'')';

     If datalogi <> '' Then
        sql := sql + ' AND ( SUBSTR( DATAHORA, 1, 10 ) >= TO_DATE( ' +
                     QuotedStr( Trim( datalogi ) ) + ', ''DD/MM/YYYY'' ) )';

     If datalogf <> '' Then
        sql := sql + ' AND ( SUBSTR( DATAHORA, 1, 10 ) <= TO_DATE( ' +
                     QuotedStr( Trim( datalogf ) ) + ', ''DD/MM/YYYY'' ) )';

     If scoluna <> '' Then Begin
        sql := sql + ' AND UPPER( RTRIM( NOMECAMPO ) ) = ' +
                     QuotedStr( UpperCase( Trim( scoluna ) ) );

        If svaloranterior = '' Then
           sql := sql + ' AND VALORANTERIOR IS NOT NULL';
     End;

     If svaloranterior <> '' Then
        sql := sql + ' AND UPPER( RTRIM( VALORANTERIOR ) ) = ' +
                     QuotedStr( UpperCase( Trim( svalorAnterior ) ) );

     If svaloratual <> '' Then
        sql := sql + ' AND UPPER( RTRIM( VALORATUAL ) ) = ' +
                     QuotedStr( UpperCase( Trim( svaloratual ) ) );

     If arquivo <> '' Then
        sql := sql + ' AND UPPER( RTRIM( ARQUIVO ) ) = ' +
                     QuotedStr( UpperCase( Trim( arquivo ) ) );

     If usuario <> '' Then
        sql := sql + ' AND UPPER( RTRIM( USUARIO ) ) = ' +
                     QuotedStr( 'CM' + UpperCase( Trim( usuario ) ) );

  End;

  sql := sql + ' ) ORDER BY DATAHORA, ARQUIVO';
  Result := GetDataPacket( Sql );
end;

function TCtrlLogTabelas.ApagarLogTabelas( DataLimite: TDateTime; bSalva: Boolean = True ): Boolean;
var
  sql: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.ApagarLogTabelas( DataLimite, bSalva );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := True;

        If bsalva Then Begin
           Sql := 'INSERT INTO LOGTABELASINDX( IDLOGTABELA, DATAHORA, CHAVEPRIMARIA, ARQUIVO, ' +
                         'USUARIO, OPERACAO, NOMECAMPO, VALORATUAL, VALORANTERIOR, LOTETRANSMISSAO ) ' +
                  'SELECT IDLOGTABELA, DATAHORA, CHAVEPRIMARIA, ARQUIVO, USUARIO, ' +
                         'OPERACAO, NOMECAMPO, VALORATUAL, VALORANTERIOR, LOTETRANSMISSAO ' +
                    'FROM LOGTABELAS ' +
                   'WHERE DATAHORA <= TO_DATE( ' + QuotedStr( DateToStr( datalimite ) ) + ', ''DD/MM/YYYY'' )';
           Result := ExecSQL( sql );
        End;

        If Result Then Begin
           sql := 'DELETE FROM LOGTABELAS ' +
                   'WHERE DATAHORA <= TO_DATE( ' + QuotedStr( DateToStr( datalimite ) ) + ', ''DD/MM/YYYY'' )';
           Result := ExecSQL( sql );
        End;

        If Result Then
           Commit
        Else
           RollBack;
     Except
        Result := False;
        RollBack;
        Raise;
     End;
  End;
end;

procedure TCtrlLogTabelas.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

