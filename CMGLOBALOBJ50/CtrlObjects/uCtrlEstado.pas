{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 22/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlEstado;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbEstado;

Type
  TCtrlEstado = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbEstado: TDbEstado;
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
    Function  ListaEstado( IdPais: Double = 0; IdEstado: Double = 0 ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

constructor TCtrlEstado.Create;
begin
  inherited;
  _DbEstado := TDbEstado.Create(Self);
  FCds    := TClientDataSet.Create( nil );
end;

destructor TCtrlEstado.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbEstado.Free;

  inherited;
end;

procedure TCtrlEstado.DoChangeDataBase;
begin
  inherited;
  _DbEstado.DataBaseName := DatabaseName;
end;

function TCtrlEstado.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarEstado( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbEstado, [], [] );
        Msg    := _DbEstado.MessageInfo;

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

function TCtrlEstado.ListaEstado( IdPais: Double; IdEstado: Double ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT E.IDESTADO, E.NOMEESTADO, E.CODESTADO, P.IDPAIS, P.NOMEPAIS ' +
         'FROM ESTADO E, PAIS P ' +
         'WHERE ';

  If idpais <> 0 Then
     Sql := Sql + 'E.IDPAIS = ' + FloatToStr( IdPais ) + ' AND ';

  If idEstado <> 0 Then
     Sql := Sql + 'E.IDESTADO = ' + FloatToStr( IdEstado ) + ' AND ';

  Sql := Sql + 'E.IDPAIS = P.IDPAIS ' +
               'ORDER BY P.NOMEPAIS, E.NOMEESTADO';
  Result := GetDataPacket( Sql );
end;

procedure TCtrlEstado.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.
