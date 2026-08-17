{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 25/03/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlSeguranca;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbSeguranca;

Type
  TCtrlSeguranca = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbSeguranca: TDbSeguranca;
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
    function ListaSeguranca: OleVariant;
    Function Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlSeguranca.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarSeguranca( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbSeguranca, [], [] );
        Msg    := _DbSeguranca.MessageInfo;

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

constructor TCtrlSeguranca.Create;
begin
  inherited;
  _DbSeguranca := TDbSeguranca.Create(Self);
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlSeguranca.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbSeguranca.Free;

  inherited;
end;

procedure TCtrlSeguranca.DoChangeDataBase;
begin
  inherited;
  _DbSeguranca.DataBaseName := DatabaseName;
end;

function TCtrlSeguranca.ListaSeguranca: OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT IDEMPRESA, TEMPOTRAVA, TAMMINSENHA, TAMHISTORICOSENHA, SENHASUPER, ' +
                'FLGVALSENHANOME, FLGSENHANUMEROS, FLGSENHALETRAS, FLGREPETESENHA, ' +
                'FLGALTSENHASUPER, DIASTROCASENHA ' +
           'FROM SEGURANCA';
  Result := GetDataPacket( Sql );
end;

procedure TCtrlSeguranca.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

