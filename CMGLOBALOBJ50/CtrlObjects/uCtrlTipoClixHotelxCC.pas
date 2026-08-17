{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 18/03/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlTipoClixHotelxCC;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbTipoClixHotelxCC;

Type
  TCtrlTipoClixHotelxCC = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbTipoClixHotelxCC: TDbTipoClixHotelxCC;
    Fcds: TClientDataSet;
    procedure SetCds(const Value: TClientDataSet);

  Public
    Property Cds: TClientDataSet read Fcds write SetCds;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    Function ListaTipoClixHotelxCC( IdTipoCliente: Double = 0;
                                    IdPessoa: Double = 0; Plano: Double = 0;
                                    PlaConta: String = ''; PlaContaCre: String = '' ): OleVariant;
    function ExisteRelacao( IdTipoCliente, IdPessoa: Double ): Boolean;
    Function Gravar: Boolean;
  End;

implementation

Uses uCmTypes;

constructor TCtrlTipoClixHotelxCC.Create;
begin
  inherited;
  _DbTipoClixHotelxCC := TDbTipoClixHotelxCC.Create(Self);
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlTipoClixHotelxCC.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbTipoClixHotelxCC.Free;

  inherited;
end;

procedure TCtrlTipoClixHotelxCC.DoChangeDataBase;
begin
  inherited;
  _DbTipoClixHotelxCC.DataBaseName := DatabaseName;
end;

procedure TCtrlTipoClixHotelxCC.SetCds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlTipoClixHotelxCC.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarTipoClixHotelxCC( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbTipoClixHotelxCC, [], [] );
        Msg    := _DbTipoClixHotelxCC.MessageInfo;

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

function TCtrlTipoClixHotelxCC.ListaTipoClixHotelxCC( IdTipoCliente: Double;
                               IdPessoa: Double; Plano: Double;
                               PlaConta: String; PlaContaCre: String ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT X.IDTIPOCLIENTE, X.IDPESSOA, X.PLANO, X.PLACONTA, X.PLACONTACRE, ' +
                'X.CODCENTROCUSTO, X.IDEMPRESA, ' +
                'T.DESCRICAO, E.NOMEEMPRESA, C.PLANOME, P.PLANOME AS PLANOMECRE, ' +
                'N.NOME AS NOMECCUSTO ' +
           'FROM TIPOCLIXHOTELXCC X, TIPOCLIENTE T, EMPRESAPROP E, PLANOCONTA C, PLANOCONTA P, CENTCUST N ' +
          'WHERE ';

  If IdTipoCliente <> 0 Then
     Sql := Sql + 'X.IDTIPOCLIENTE = ' + FloatToStr( IdTipoCliente ) + ' AND ';

  If IdPessoa <> 0 Then
     Sql := Sql + 'X.IDPESSOA = ' + FloatToStr( IdPessoa ) + ' AND ';

  If Plano <> 0 Then
     Sql := Sql + 'X.PLANO = ' + FloatToStr( Plano ) + ' AND ';

  If PlaConta <> '' Then
     Sql := Sql + 'X.PLACONTA = ' + QuotedStr( PlaConta ) + ' AND ';

  If PlaContaCre <> '' Then
     Sql := Sql + 'X.PLACONTACRE = ' + QuotedStr( PlaContaCre ) + ' AND ';

  Sql := Sql + 'X.IDTIPOCLIENTE = T.IDTIPOCLIENTE(+) AND ' +
               'X.IDPESSOA = E.IDPESSOA(+) AND ' +
               'X.CODCENTROCUSTO = N.CODCENTROCUSTO(+) AND ' +
               'X.IDEMPRESA = N.IDEMPRESA(+) AND ' +
               '( X.PLANO = C.PLANO(+) AND X.PLACONTA = C.PLACONTA(+) ) AND ' +
               '( X.PLANO = P.PLANO(+) AND X.PLACONTACRE = P.PLACONTA(+) ) ' +
               'ORDER BY T.DESCRICAO';

  Result := GetDataPacket( Sql );
end;

function TCtrlTipoClixHotelxCC.ExisteRelacao( IdTipoCliente, IdPessoa: Double ): Boolean;
var
  sql: String;
  _Cds: TClientDataset;
begin
  Result := False;
  _Cds := TClientDataset.Create( Nil );
  Sql := 'SELECT IDTIPOCLIENTE, IDPESSOA ' +
           'FROM TIPOCLIXHOTELXCC ' +
          'WHERE IDTIPOCLIENTE = ' + FloatToStr( IdTipoCliente ) + ' AND ' +
                'IDPESSOA = ' + FloatToStr( IdPessoa );

  _Cds.Data := GetDataPacket( Sql );
  Result := ( Not _Cds.IsEmpty );
  _Cds.Close;
  _Cds.Free;
end;

end.

