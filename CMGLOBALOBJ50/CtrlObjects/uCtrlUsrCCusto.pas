{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 18/03/2002                             }
{                                                       }
{*******************************************************}
// 19/01/2006  P: 15255 ---------------------------------------
// Foi adicionado o CODEXTERNO nas querys criadas nas funções ListaUsrCodCCusto
// e ListaUsrCodCCustoUsr. Foi adicionado também em ambas as querys o parâmetro
// IdPlanCentCust, para poder filtrar a lista de Códigos de centro de custo pelo
// plano vigente...
// -----------------------------------------------------------------------------
// 03/11/2003 - pendência 15151 - inclui o nome completo do usuário na query

unit uCtrlUsrCCusto;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbUsrCCusto, Classes;

Type
  TCtrlUsrCCusto = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbUsrCCusto: TDbUsrCCusto;
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

    { 18/08/2003 (Pendência 14624)
      Recupera o código do centro de custo junto com o nome.}
    Function ListaUsrCodCCusto( IdEmpresa: Double = 0; IdUsuario: Double = 0; IdPessoa: Double = 0; IdCentroCusto: String = ''; iOrdem: Integer = 0;
                                IdPlanCentCust: Extended = 0 ): OleVariant;


    Function ListaUsrCCusto( IdEmpresa: Double = 0; IdUsuario: Double = 0; IdPessoa: Double = 0; IdCentroCusto: String = ''; iOrdem: Integer = 0 ): OleVariant;


    function ListaUsrCCustoUsr( IdEmpresa: Double = 0; IdUsuario: Double = 0;
                                iOrdem: Integer = 0 ): OleVariant;

    { 18/08/2003 (Pendência 14624)
      Recupera o código do centro de custo junto com o nome.}
    function ListaUsrCodCCustoUsr( IdEmpresa: Double = 0; IdUsuario: Double = 0; iOrdem: Integer = 0; IdPlanCentCust: Extended = 0): OleVariant;

    Function Gravar: Boolean;
    function ListaUsuariosNotInCC(const pCODCENTROCUSTO, pIdEmpresa : integer): OleVariant;
    function ListaUsuariosInCC(const pCODCENTROCUSTO, pIdEmpresa : integer): OleVariant;
    Procedure ExcluiUSCCUSTO( pIDUSUARIO,  pCODCENTROCUSTO, pIDEMPRESA : String );
    Procedure IncluiUSCCUSTO( pIDUSUARIO,  pCODCENTROCUSTO, pIDEMPRESA : String );
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlUsrCCusto.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarUsrCCusto( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbUsrCCusto, [], [] );
        Msg    := _DbUsrCCusto.MessageInfo;

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

constructor TCtrlUsrCCusto.Create;
begin
  inherited;
  _DbUsrCCusto := TDbUsrCCusto.Create(Self);
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlUsrCCusto.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbUsrCCusto.Free;

  inherited;
end;

procedure TCtrlUsrCCusto.DoChangeDataBase;
begin
  inherited;
  _DbUsrCCusto.DataBaseName := DatabaseName;
end;

// Lista Usuários por centro de custo
function TCtrlUsrCCusto.ListaUsrCCusto( IdEmpresa: Double; IdUsuario: Double;
                        IdPessoa: Double; IdCentroCusto: String; iOrdem: Integer ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT U.CODCENTROCUSTO, C.NOME, U.IDPESSOA, E.NOMEEMPRESA, U.IDUSUARIO, ' +
                'S.NOMEUSUARIO, U.IDEMPRESA ' +
           'FROM USCCUSTO U, CENTCUST C, USUARIOSISTEMA S, EMPRESAPROP E ' +
          'WHERE ';

  If IdEmpresa <> 0 Then
     Sql := Sql + 'U.IDEMPRESA = ' + FloatToStr( IdEmpresa ) + ' AND ';

  If idUsuario <> 0 Then
     Sql := Sql + 'U.IDUSUARIO = ' + FloatToStr( IdUsuario ) + ' AND ';

  If IdPessoa <> 0 Then
     Sql := Sql + 'U.IDPESSOA = ' + FloatToStr( IdPessoa ) + ' AND ';

  If IdCentroCusto <> '' Then
     Sql := Sql + 'U.CODCENTROCUSTO = ' + QuotedStr( IdCentroCusto ) + ' AND ';

  Sql := Sql + 'U.IDEMPRESA = C.IDEMPRESA AND ' +
               'U.CODCENTROCUSTO = C.CODCENTROCUSTO AND ' +
               'U.IDUSUARIO = S.IDUSUARIO AND ' +
               'U.IDPESSOA = E.IDPESSOA ';

  Case iOrdem Of
       0: Sql := Sql + 'ORDER BY C.NOME';
       1: Sql := Sql + 'ORDER BY U.CODCENTROCUSTO';
  End;

  Result := GetDataPacket( Sql );
end;

// Lista centro de custo por usuario
function TCtrlUsrCCusto.ListaUsrCCustoUsr( IdEmpresa: Double; IdUsuario: Double;
                                            iOrdem: Integer ): OleVariant;
var
  sql: String;
begin
   Sql := 'SELECT CODCENTROCUSTO, IDEMPRESA, NOME ' +
           'FROM CENTCUST ' +
          'WHERE IDEMPRESA = ' + FloatToStr( IdEmpresa ) + ' ' +
            'AND STATUSGRUPOCDC = ''A'' ' +
            'AND ( CODCENTROCUSTO NOT IN ' +
                  '( SELECT CODCENTROCUSTO ' +
                      'FROM USCCUSTO ' +
                     'WHERE IDUSUARIO = ' + FloatToStr( IdUsuario ) + ' ' +
                       'AND IDEMPRESA = ' + FloatToStr( IdEmpresa ) + ' ) ) ';

  Case IOrdem Of
       0: Sql := Sql + 'ORDER BY NOME';
       1: Sql := Sql + 'ORDER BY CODCENTROCUSTO';
  End;

  Result := GetDataPacket( Sql );
end;

procedure TCtrlUsrCCusto.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

// início - pendência 14449
//Lista os usuários que não estao no centro de custo passado como parâmetro
function TCtrlUsrCCusto.ListaUsuariosNotInCC(const pCODCENTROCUSTO, pIdEmpresa : integer): OleVariant;
begin
//  pendência 15151 - inclui o nome completo do usuário na query
  result := GetDataPacket(' SELECT '+
                          '   U.IDUSUARIO, U.NOMEUSUARIO, P.NOME '+
                          ' FROM USUARIOSISTEMA U, PESSOA P '+
                          ' WHERE P.IDPESSOA = U.IDUSUARIO AND U.IDUSUARIO NOT IN   '+
                          ' (SELECT IDUSUARIO FROM USCCUSTO WHERE CODCENTROCUSTO = '+ IntToStr(pCODCENTROCUSTO)+
                          '  AND IDEMPRESA  = ' + IntToStr(pIdEmpresa)  + ')'+
                          ' ORDER BY NOMEUSUARIO ');
end;


//Lista os usuários que estão no centro de Custo passado como parâmetro
function TCtrlUsrCCusto.ListaUsuariosInCC(const pCODCENTROCUSTO, pIdEmpresa : integer): OleVariant;
begin
// pendência 15151 - inclui o nome completo do usuário na query
  result := GetDataPacket(' SELECT '+
                          '   P.NOME, U.IDUSUARIO, U.NOMEUSUARIO, UC.IDUSUARIO, UC.CODCENTROCUSTO, UC.IDEMPRESA '+
                          ' FROM USUARIOSISTEMA U, USCCUSTO UC, PESSOA P'+
                          ' WHERE U.IDUSUARIO = UC.IDUSUARIO AND UC.CODCENTROCUSTO = '+ IntToStr(pCODCENTROCUSTO)+
                          '       AND UC.IDEMPRESA  = ' + IntToStr(pIdEmpresa) +
                          '       AND P.IDPESSOA = U.IDUSUARIO '+
                          ' ORDER BY U.NOMEUSUARIO ');
end;


// exclui uma pessoa no centro de custo
Procedure TCtrlUsrCCusto.ExcluiUSCCUSTO( pIDUSUARIO,
                                         pCODCENTROCUSTO,
                                         pIDEMPRESA         : String );
Var
  SqlLocal : TStringList;

Begin

  SqlLocal   := TStringList.Create;
  Try
    SqlLocal   := TStringList.Create;
    SqlLocal.Add( 'DELETE FROM' );
    SqlLocal.Add( '  USCCUSTO' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  IDUSUARIO  = ' + pIDUSUARIO  + ' AND' );
    SqlLocal.Add( '  CODCENTROCUSTO = ' + QuotedStr( pCODCENTROCUSTO ) + ' AND' );
    SqlLocal.Add( '  IDEMPRESA        = ' + pIDEMPRESA );

    ExecSQL( SqlLocal.Text );
  Finally

    SqlLocal.Free;
  End;
End;

// inclui uma pessoa no centro de custo
Procedure TCtrlUsrCCusto.IncluiUSCCUSTO( pIDUSUARIO,
                                         pCODCENTROCUSTO,
                                         pIDEMPRESA         : String );

Var
  SqlLocal : TStringList;

Begin

  SqlLocal   := TStringList.Create;
  Try
    SqlLocal   := TStringList.Create;
    SqlLocal.Add( 'INSERT INTO' );
    SqlLocal.Add( '  USCCUSTO' );
    SqlLocal.Add( '  ( IDUSUARIO, CODCENTROCUSTO, IDPESSOA, IDEMPRESA )' );
    SqlLocal.Add( 'VALUES' );
    SqlLocal.Add( '  ( ' + pIDUSUARIO + ', ' + QuotedStr( pCODCENTROCUSTO ) + ', ' + pIDEMPRESA + ', ' + pIDEMPRESA + ')' );

    ExecSQL( SqlLocal.Text );
  Finally

    SqlLocal.Free;
  End;
End;

// Fim pendência 14449


{ 18/08/2003 (Pendência 14624)
  Recupera o código do centro de custo junto com o nome.}
function TCtrlUsrCCusto.ListaUsrCodCCustoUsr(IdEmpresa, IdUsuario: Double; iOrdem: Integer; IdPlanCentCust: Extended): OleVariant;
var
  sql: String;
begin
//   em 18/01/2006 - P: 15255
   Sql := 'SELECT CODEXTERNO, CODCENTROCUSTO, IDEMPRESA, ltrim( rtrim( CODEXTERNO ) ) || '' - '' || NOME as NOME ' +
           'FROM CENTCUST ' +
          'WHERE IDEMPRESA = ' + FloatToStr( IdEmpresa ) + ' ' +
            'AND STATUSGRUPOCDC = ''A'' ' +
            'AND IDPLANCENTCUST = ' + FormatFloat('#0', IdPlanCentCust ) + ' ' +
            'AND ( CODCENTROCUSTO NOT IN ' +
                  '( SELECT CODCENTROCUSTO ' +
                      'FROM USCCUSTO ' +
                     'WHERE IDUSUARIO = ' + FloatToStr( IdUsuario ) + ' ' +
                       'AND IDEMPRESA = ' + FloatToStr( IdEmpresa ) + ' ) ) ';


  Case IOrdem Of
       0: Sql := Sql + 'ORDER BY NOME';
       1: Sql := Sql + 'ORDER BY CODEXTERNO';
  End;

  Result := GetDataPacket( Sql );
end;

{ 18/08/2003 (Pendência 14624)
  Recupera o código do centro de custo junto com o nome.}
function TCtrlUsrCCusto.ListaUsrCodCCusto(IdEmpresa, IdUsuario, IdPessoa: Double; IdCentroCusto: String; iOrdem: Integer;
                                          IdPlanCentCust: Extended): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT c.CODEXTERNO, U.CODCENTROCUSTO, ltrim( rtrim( c.CODEXTERNO ) ) || '' - '' || c.NOME as NOME, U.IDPESSOA, E.NOMEEMPRESA, U.IDUSUARIO, ' +
                'S.NOMEUSUARIO, U.IDEMPRESA ' +
           'FROM USCCUSTO U, CENTCUST C, USUARIOSISTEMA S, EMPRESAPROP E ' +
          'WHERE ';

  If IdEmpresa <> 0 Then
     Sql := Sql + 'U.IDEMPRESA = ' + FloatToStr( IdEmpresa ) + ' AND ';

  If idUsuario <> 0 Then
     Sql := Sql + 'U.IDUSUARIO = ' + FloatToStr( IdUsuario ) + ' AND ';

  If IdPessoa <> 0 Then
     Sql := Sql + 'U.IDPESSOA = ' + FloatToStr( IdPessoa ) + ' AND ';

  If IdCentroCusto <> '' Then
     Sql := Sql + 'U.CODCENTROCUSTO = ' + QuotedStr( IdCentroCusto ) + ' AND ';

  If IdPlanCentCust <> 0 Then
     Sql := Sql + 'C.IDPLANCENTCUST = ' + FormatFloat('#0', IdPlanCentCust ) + ' AND ';

  Sql := Sql + 'U.IDEMPRESA = C.IDEMPRESA AND ' +
               'U.CODCENTROCUSTO = C.CODCENTROCUSTO AND ' +
               'U.IDUSUARIO = S.IDUSUARIO AND ' +
               'U.IDPESSOA = E.IDPESSOA ';

  Case iOrdem Of
       0: Sql := Sql + 'ORDER BY C.NOME';
       1: Sql := Sql + 'ORDER BY C.CODEXTERNO';
  End;

  Result := GetDataPacket( Sql );
end;

end.

