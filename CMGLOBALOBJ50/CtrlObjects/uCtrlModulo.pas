{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 08/04/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlModulo;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbModulo;

Type
  TCtrlModulo = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbModulo: TDbModulo;
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
    Function  ListaModulo( IdModulo: Double = 0 ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlModulo.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarModulo( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbModulo, [], [] );
        Msg    := _DbModulo.MessageInfo;

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

constructor TCtrlModulo.Create;
begin
  inherited;
  _DbModulo := TDbModulo.Create(Self);
  FCds    := TClientDataSet.Create( nil );
end;

destructor TCtrlModulo.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbModulo.Free;

  inherited;
end;

procedure TCtrlModulo.DoChangeDataBase;
begin
  inherited;
  _DbModulo.DataBaseName := DatabaseName;
end;

function TCtrlModulo.ListaModulo( IdModulo: Double ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT IDMODULO, NOMEMODULO, DESCRICAOMODULO, SERVERNAME, NOMEPROJETO, ' +
         'PATHFONTES, DIRFONTES, DIRDADOS, CHAVEREGISTRO, OLDVERSAO, FLGGRUPODESENV ' +
         'FROM MODULO';

  If IdModulo <> 0 Then
     Sql := Sql + ' AND IDMODULO = ' + FloatToStr( IdModulo );

  Sql := Sql + ' ORDER BY NOMEMODULO';
  Result := GetDataPacket( Sql );
end;

procedure TCtrlModulo.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

