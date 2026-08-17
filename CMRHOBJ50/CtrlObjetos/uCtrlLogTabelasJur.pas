{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 01/04/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlLogTabelasJur;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbLogTabelas;

Type
  TCtrlLogTabelasJur = class(TCmControlObject)
  Public
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    function  ListaCamposTabela( tabela: String ): OleVariant;
    Function  ListaLogtabelas( IdLogTabela: Double = 0; DataLimite: TDateTime = 0;
              Linhas: Integer = 0 ): OleVariant;
    function  ListaAltExcLogTabelas( tabela, scoluna, datalogi, datalogf,
              svaloranterior, svaloratual, usuario, arquivo, operacao, NumProc: String ): OleVariant;
  End;

implementation
{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlLogTabelasJur.ListaCamposTabela( tabela: String ): OleVariant;
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

function TCtrlLogTabelasJur.ListaAltExcLogTabelas( tabela, scoluna, datalogi, datalogf,
         svaloranterior, svaloratual, usuario, arquivo, Operacao, NumProc: String ): OleVariant;
var
  bsel: Boolean;
  Sql: String;
begin
  operacao := UpperCase( operacao );
  bsel := False;
  sql  := sql + 'SELECT * FROM ( ';

  If ( operacao = 'I' ) Or ( operacao = 'T' ) Or ( operacao = '' ) Then Begin
     SQl := SQl + 'SELECT P.TRGDTINCLUSAO AS DATAHORA, TO_CHAR(P.NUMPROCTRAB) AS CHAVEPRIMARIA,'+
                  '''PROCESSOTRAB'' AS ARQUIVO, U.NOMEUSUARIO AS USUARIO, ''I'' AS OPERACAO, ' +
                  '''INCLUSÃO'' AS DESCOPERACAO, ''NUMPROCTRAB'' AS NOMECAMPO, '+
                  'TO_CHAR(P.NUMPROCTRAB) AS VALORATUAL, '''' AS VALORANTERIOR ' +
                  'FROM PROCESSOTRAB P, USUARIOSISTEMA U ';

     If NumProc = '' Then
       SQl := SQl + 'WHERE (1 = 1)'
     else
       SQl := SQl + 'WHERE (P.NUMPROCTRAB = '+NumProc+')';

     SQl := SQl + ' AND (U.IDUSUARIO = SUBSTR(P.TRGUSERINCLUSAO,3,18))';

     If datalogi <> '' Then
        sql := sql + ' AND ( SUBSTR( P.TRGDTINCLUSAO, 1, 10 ) >= TO_DATE( ' +
                     QuotedStr( Trim( datalogi ) ) + ', ''DD/MM/YYYY'' ) )';

     If datalogf <> '' Then
        sql := sql + ' AND ( SUBSTR( P.TRGDTINCLUSAO, 1, 10 ) <= TO_DATE( ' +
                     QuotedStr( Trim( datalogf ) ) + ', ''DD/MM/YYYY'' ) )';

     If usuario <> '' Then
        sql := sql + ' AND UPPER( RTRIM( P.TRGUSERINCLUSAO ) ) = ' +
                     QuotedStr( 'CM' + UpperCase( Trim( usuario ) ) );

     bsel := True;
  End;

  If ( operacao = 'U' ) Or ( operacao = 'T' ) Or ( operacao = '' ) Then Begin
     If bsel Then
        sql := sql + ' UNION ALL ';

     SQl := SQl + 'SELECT P.DATAHORA, SUBSTR(P.CHAVEPRIMARIA,14,25) AS CHAVEPRIMARIA, P.ARQUIVO,'+
                  'U.NOMEUSUARIO AS USUARIO, P.OPERACAO, ' +
                  '''ALTERAÇÃO'' AS DESCOPERACAO, P.NOMECAMPO, P.VALORATUAL, P.VALORANTERIOR ' +
                  'FROM ' + tabela + ' P, USUARIOSISTEMA U ' +
                  'WHERE (P.OPERACAO = ''U'')';

     If NumProc <> '' Then
       SQl := SQl + ' AND (TRIM(SUBSTR(P.CHAVEPRIMARIA,14,25)) = '+QuotedStr(NumProc)+')';

     SQl := SQl + ' AND (U.IDUSUARIO = SUBSTR(P.USUARIO,3,18))';

     If datalogi <> '' Then
        sql := sql + ' AND ( SUBSTR( DATAHORA, 1, 10 ) >= TO_DATE( ' +
                     QuotedStr( Trim( datalogi ) ) + ', ''DD/MM/YYYY'' ) )';

     If datalogf <> '' Then
        sql := sql + ' AND ( SUBSTR( DATAHORA, 1, 10 ) <= TO_DATE( ' +
                     QuotedStr( Trim( datalogf ) ) + ', ''DD/MM/YYYY'' ) )';

     If scoluna <> '' Then
        sql := sql + ' AND UPPER( RTRIM( NOMECAMPO ) ) = ' +
                     QuotedStr( UpperCase( Trim( scoluna ) ) );

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

     sql := sql + 'SELECT DISTINCT P.DATAHORA, SUBSTR(P.CHAVEPRIMARIA,14,25) AS '+
                  'CHAVEPRIMARIA, P.ARQUIVO, U.NOMEUSUARIO AS USUARIO, ' +
                  'P.OPERACAO, ''EXCLUSÃO'' AS DESCOPERACAO, '''' AS NOMECAMPO, ' +
                  ''''' AS VALORATUAL, '''' AS VALORANTERIOR ' +
                  'FROM ' + tabela + ' P, USUARIOSISTEMA U ' +
                  'WHERE (OPERACAO = ''D'')';

     If NumProc <> '' Then
       SQl := SQl + ' AND (TRIM(SUBSTR(P.USUARIO,14,25)) = '+QuotedStr(NumProc)+')';

     SQl := SQl + ' AND (U.IDUSUARIO = SUBSTR(P.USUARIO,3,18))';

     If datalogi <> '' Then
        sql := sql + ' AND ( SUBSTR( DATAHORA, 1, 10 ) >= TO_DATE( ' +
                     QuotedStr( Trim( datalogi ) ) + ', ''DD/MM/YYYY'' ) )';

     If datalogf <> '' Then
        sql := sql + ' AND ( SUBSTR( DATAHORA, 1, 10 ) <= TO_DATE( ' +
                     QuotedStr( Trim( datalogf ) ) + ', ''DD/MM/YYYY'' ) )';

     If scoluna <> '' Then
        sql := sql + ' AND UPPER( RTRIM( NOMECAMPO ) ) = ' +
                     QuotedStr( UpperCase( Trim( scoluna ) ) );

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

//     bsel := True;
  End;

  sql := sql + ' ) ORDER BY DATAHORA, ARQUIVO';
  Result := GetDataPacket( Sql );
end;

function TCtrlLogTabelasJur.ListaLogTabelas( IdLogTabela: Double; DataLimite: TDateTime;
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

end.

