{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
unit uCtrlSindicato;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbSindicato, uSistema;

Type
  TCtrlSindicato = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbSindicato: TDbSindicato;
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
    Function  ListaSindicato( IdSindicato: Double = 0 ): OleVariant;
    Procedure Procurar( IdSindicato: Double = 0 );
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
  Uses uCmTypes;
{$ENDIF}

constructor TCtrlSindicato.Create;
begin
  inherited;
  _DbSindicato := TDbSindicato.Create(Self);
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlSindicato.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbSindicato.Free;

  inherited;
end;

procedure TCtrlSindicato.DoChangeDataBase;
begin
  inherited;
  _DbSindicato.DataBaseName := DatabaseName;
end;

function TCtrlSindicato.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarSindicato( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbSindicato, [], [] );
        Msg    := _DbSindicato.MessageInfo;

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

procedure TCtrlSindicato.Procurar(IdSindicato: Double);
begin
  If ConnectionSide = cnsClient Then Begin
     Connection.AppServer.ProcurarSindicato( IdSindicato );
  End Else Begin
     _DbSindicato.IdPessoa.AsFloat := IdSindicato;
  End;
end;

function TCtrlSindicato.ListaSindicato( IdSindicato: Double ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT S.IDPESSOA, S.REGISTROMT, S.PISOSALARIAL, S.MOECODIGO, S.MESBASE, ' +
         'S.MESCONTRIBUICAO, P.NOME ' +
         'FROM SINDICATO S, PESSOA P ' +
         'WHERE P.IDPESSOA = S.IDPESSOA ';

  If IdSindicato <> 0 Then
     Sql := Sql + 'AND S.IDPESSOA = ' + FloatToStr( IdSindicato ) + ' ';

  Sql := Sql + 'ORDER BY P.NOME';
  Result := GetDataPacket( Sql );
end;

procedure TCtrlSindicato.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

