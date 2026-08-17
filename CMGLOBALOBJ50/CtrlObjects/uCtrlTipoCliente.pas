{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 30/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlTipoCliente;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbTipoCliente;

Type
  TCtrlTipoCliente = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbTipoCliente: TDbTipoCliente;
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
    Function  ListaTipoCliente( IdTipoCliente: Double = 0 ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlTipoCliente.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarTipoCliente( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbTipoCliente, [], [] );
        Msg    := _DbTipoCliente.MessageInfo;

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

constructor TCtrlTipoCliente.Create;
begin
  inherited;
  _DbTipoCliente := TDbTipoCliente.Create(Self);
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlTipoCliente.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbTipoCliente.Free;

  inherited;
end;

procedure TCtrlTipoCliente.DoChangeDataBase;
begin
  inherited;
  _DbTipoCliente.DataBaseName := DatabaseName;
end;

function TCtrlTipoCliente.ListaTipoCliente( IdTipoCliente: Double ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT IDTIPOCLIENTE, DESCRICAO ' +
         'FROM TIPOCLIENTE ';

  If IdTipoCliente <> 0 Then
     Sql := Sql + 'WHERE IDTIPOCLIENTE = ' + FloatToStr( IdTipoCliente )
  Else
     Sql := Sql + 'ORDER BY DESCRICAO';

  Result := GetDataPacket( Sql );
end;

procedure TCtrlTipoCliente.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

