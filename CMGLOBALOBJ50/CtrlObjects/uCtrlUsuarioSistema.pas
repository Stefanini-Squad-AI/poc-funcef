{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 22/03/2002                             }
{                                                       }
{*******************************************************}
//******************************************************************************************
//N. Sol..........: 228736/17139  
//N. Kintana......: 761996
//Data............: 27/04/2015
//Responsável.....: Felipe A. Santos    
//Descrição.......: Bloqueio de Usuário para lançar trecho na solicitação de destacamento
//******************************************************************************************

unit uCtrlUsuarioSistema;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbUsuarioSistema;

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
    Function  ListaGrupoAcesso(IdGrupo: Double = 0) : OleVariant; // Felipe A. Santos SOL 228736/17139 PPM 761996
    Function  ListaGrupoUsu(IdGrupo: Double; bBloqueado : Boolean) : OleVariant; // Felipe A. Santos SOL 228736/17139 PPM 761996
    Function  GravarFlgDispDestac(FiltroIdUsuario, UsuarioLiberado: string) : Boolean; // Felipe A. Santos SOL 228736/17139 PPM 761996
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

constructor TCtrlUsuarioSistema.Create;
begin
  inherited;
  _DbUsuarioSistema := TDbUsuarioSistema.Create(Self);
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

// Felipe A. Santos SOL 228736/17139 PPM 761996 - início
function TCtrlUsuarioSistema.GravarFlgDispDestac(FiltroIdUsuario,
  UsuarioLiberado: string): Boolean;
var
  sql: String;
begin
  sql := 'UPDATE USUARIOSISTEMA SET '+
         '  FLGDISPDESTAC = ' + QuotedStr(UsuarioLiberado) +
         ' WHERE  ' + FiltroIdUsuario;

  try
     StartTransaction;

     Result := ExecSQL(sql);

     Commit;
  except
    on e : Exception do
    begin
      Result := False;
      Rollback;
      MessageInfo := e.Message;
    end;
  end;
end;

function TCtrlUsuarioSistema.ListaGrupoAcesso(IdGrupo: Double): OleVariant;
var
  sql: String;
begin
  sql := 'SELECT * FROM GRUPOACESSO';

  if (IdGrupo <> 0)  then
     sql := sql + ' WHERE IDGRUPO = ' + FloatToStr(IdGrupo);

  sql := sql + ' ORDER BY NOMEGRUPO';

  Result := GetDataPacket(sql);
end;


function TCtrlUsuarioSistema.ListaGrupoUsu(IdGrupo: Double; bBloqueado : Boolean): OleVariant;
var
  sql: String;
begin
  sql := 'SELECT USU.NOMEUSUARIO, ' +
         '       USU.IDUSUARIO ' +
         '  FROM USUARIOSISTEMA USU, GRUPOUSU GRU ' +
         ' WHERE USU.IDUSUARIO = GRU.IDUSUARIO ' +
         '   AND GRU.IDGRUPO = ' + FloatToStr(IdGrupo);

  if bBloqueado then
    sql := sql + ' AND FLGDISPDESTAC = ''N'''
  else
    sql := sql + ' AND FLGDISPDESTAC = ''S''';


  sql := sql + ' ORDER BY USU.NOMEUSUARIO';

  Result := GetDataPacket(sql);
end;
// Felipe A. Santos SOL 228736/17139 PPM 761996 - fim

function TCtrlUsuarioSistema.ListaUsuarioSistema( IdUsuario: Double ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT U.VALIDADESENHA, U.SENHAPERMANENTE, U.SENHAAUTORIZ, U.SENHA, ' +
         'U.NOMEUSUARIO, U.NAOMUDASENHA, U.MUDARSENHA, U.IDUSUARIO, U.IDESPACESSO, ' +
         'U.FLGAUSENTE, U.DESCRICAO, U.DESATIVADO, U.BLOQUEADO, P.NOME ' +
         'FROM USUARIOSISTEMA U, PESSOA P ' +
         'WHERE ';

  If IdUsuario <> 0 Then
     Sql := Sql + 'U.IDUSUARIO = ' + FloatToStr( IdUsuario ) + ' AND ';

  Sql := Sql + 'U.IDUSUARIO = P.IDPESSOA(+)';

  If IdUsuario = 0 Then
     Sql := Sql + ' ORDER BY U.NOMEUSUARIO';

  Result := GetDataPacket( Sql );
end;

procedure TCtrlUsuarioSistema.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

