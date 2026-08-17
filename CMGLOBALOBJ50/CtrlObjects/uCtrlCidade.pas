{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 22/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlCidade;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbCidade;

Type
  TCtrlCidade = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbCidade: TDbCidade;
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
    Function  ListaCidade( IdPais: Double = 0; IdEstado: Double = 0; IdCidade: Double = 0 ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

constructor TCtrlCidade.Create;
begin
  inherited;
  _DbCidade := TDbCidade.Create(Self);
  FCds := TClientDataSet.Create(nil);
end;

destructor TCtrlCidade.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbCidade.Free;

  inherited;
end;

procedure TCtrlCidade.DoChangeDataBase;
begin
  inherited;
  _DbCidade.DataBaseName := DatabaseName;
end;

function TCtrlCidade.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarCidade( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbCidade, [], [] );
        Msg    := _DbCidade.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Commit;
     except
        On E:Exception Do
        Begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;

function TCtrlCidade.ListaCidade( IdPais: Double; IdEstado: Double; IdCidade: Double ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT C.IDCIDADES, C.NOME, E.NOMEESTADO, E.IDESTADO, P.IDPAIS, C.UF, ' +
                'P.NOMEPAIS, C.NUMSEED, C.IDICONE, C.CODESTADO, C.CODMUNICIPIO, ' +
                'C.DDD, C.CODIGO_SABRE, CODMUNICIPIOIBGE, C.NOME AS NOMEPAIS ' +
           'FROM CIDADES C, ESTADO E, PAIS P ' +
          'WHERE ';

  If idCidade <> 0 Then
     Sql := Sql + 'C.IDCIDADES = ' + FloatToStr( IdCidade ) + ' AND ';

  If idEstado <> 0 Then
     Sql := Sql + 'E.IDESTADO = ' + FloatToStr( IdEstado ) + ' AND ';

  If idpais <> 0 Then
     Sql := Sql + 'P.IDPAIS = ' + FloatToStr( IdPais ) + ' AND ';

  Sql := Sql + 'C.IDESTADO = E.IDESTADO AND ' +
               'E.IDPAIS = P.IDPAIS ' +
               'ORDER BY P.NOMEPAIS, E.NOMEESTADO, C.NOME';
  Result := GetDataPacket( Sql );
end;

procedure TCtrlCidade.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

