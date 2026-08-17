{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 22/03/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlUsuarioSistema;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbUsuarioSistema, uSistema;

Type
  TCtrlUsuarioSistema = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbUsuarioSistema: TDbUsuarioSistema;
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
    Function  ListaUsuarioSistema( IdUsuario: Double = 0 ): OleVariant;
    Procedure Procurar( IdUsuario: Double = 0 );
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

constructor TCtrlUsuarioSistema.Create;
begin
  inherited;
  _DbUsuarioSistema := TDbUsuarioSistema.Create;
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlUsuarioSistema.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbUsuarioSistema.Free;

  inherited;
end;

procedure TCtrlUsuarioSistema.DoChangeDataBase;
begin
  inherited;
  _DbUsuarioSistema.DataBaseName := DatabaseName;
end;

function TCtrlUsuarioSistema.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarUsuarioSistema( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbUsuarioSistema, [], [] );
        Msg    := _DbUsuarioSistema.MessageInfo;

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

procedure TCtrlUsuarioSistema.Procurar( IdUsuario: Double );
begin
  If ConnectionSide = cnsClient Then Begin
     Connection.AppServer.ProcurarUsuarioSistema( IdUsuario );
  End Else Begin
     _DbUsuarioSistema.IdUsuario.AsFloat := IdUsuario;
  End;
end;

function TCtrlUsuarioSistema.ListaUsuarioSistema( IdUsuario: Double ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT U.VALIDADESENHA, U.SENHAPERMANENTE, U.SENHAAUTORIZ, U.SENHA, ' +
         'U.NOMEUSUARIO, U.NAOMUDASENHA, U.MUDARSENHA, U.IDUSUARIO, U.IDESPACESSO, ' +
         'U.FLGAUSENTE, U.DESCRICAO, U.DESATIVADO, U.BLOQUEADO, P.NOME ' +
         'FROM USUARIOSISTEMA U, PESSOA P ' +
         'WHERE P.IDPESSOA(+) = U.IDUSUARIO ';

  If IdUsuario <> 0 Then
     Sql := Sql + 'AND U.IDUSUARIO = ' + FloatToStr( IdUsuario )
  Else
     Sql := Sql + 'ORDER BY U.NOMEUSUARIO';
     
  Result := GetDataPacket( Sql );
end;

procedure TCtrlUsuarioSistema.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

