{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 18/03/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlUsrMoeda;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbUsrMoeda, uCtrlParamGlobal, usistema, uctrlPadroes;

Type
  TCtrlUsrMoeda = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbUsrMoeda: TDbUsrMoeda;
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
    Function ListaUsrMoeda( IdUsuario: Double = 0; IdMoeda: Double = 0 ): OleVariant;
    function ListaUsrMoedaUsr( IdUsuario: Double ): OleVariant;
    Function Gravar: Boolean;
  End;

implementation

Uses uCmTypes;

function TCtrlUsrMoeda.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarUsrMoeda( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbUsrMoeda, [], [] );
        Msg    := _DbUsrMoeda.MessageInfo;

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

constructor TCtrlUsrMoeda.Create;
begin
  inherited;
  _DbUsrMoeda := TDbUsrMoeda.Create(Self);
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlUsrMoeda.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbUsrMoeda.Free;

  inherited;
end;

procedure TCtrlUsrMoeda.DoChangeDataBase;
begin
  inherited;
  _DbUsrMoeda.DataBaseName := DatabaseName;
end;

// Lista Usuários por Moeda
function TCtrlUsrMoeda.ListaUsrMoeda( IdUsuario: Double = 0; IdMoeda: Double = 0 ): OleVariant;
var
  cdsParam : tclientDataset;
  ctrlParamGlobal : TctrlParamGlobal;
  sql: String;
begin
  Sql := 'SELECT X.IDUSUARIO, X.MOECODIGO, U.NOMEUSUARIO, M.MOEDESC, M.MOESIGLA ' +
         'FROM USUARIOXMOEDA X, MOEDA M, USUARIOSISTEMA U ' +
         'WHERE ';

  If idUsuario <> 0 Then
     Sql := Sql + 'X.IDUSUARIO = ' + FloatToStr( IdUsuario ) + ' AND ';

  If IdMoeda <> 0 Then
     Sql := Sql + 'X.MOECODIGO = ' + FloatToStr( IdMoeda ) + ' AND ';

  Sql := Sql + 'X.MOECODIGO = M.MOECODIGO AND ' +
               'X.IDUSUARIO = U.IDUSUARIO ';

  //inicio - pendência 18778 - 13/09/2005
  cdsParam := tclientDataset.Create(nil);
  ctrlParamGlobal := TCtrlParamGlobal.Create;
  ctrlParamGlobal.Initializeas(Padroes);
  cdsParam.data := ctrlParamGlobal.ListaParamGlobal(sistema.idempresa);
  //fim -  pendência 18778 - 13/09/2005


  //inicio - pendência 18778 - 13/09/2005
  if cdsParam.fieldByName('FLGORDENASIGLA').asInteger = 1 then
  begin
    If idUsuario = 0 Then
       If IdMoeda = 0 Then
          Sql := Sql + ' ORDER BY U.NOMEUSUARIO, M.MOESIGLA '
       Else
          Sql := Sql + ' ORDER BY U.NOMEUSUARIO '
    Else
       If IdMoeda = 0 Then
          Sql := Sql + ' ORDER BY M.MOESIGLA ';
  end
  //fim - pendência 18778 - 13/09/2005

  else begin
    If idUsuario = 0 Then
       If IdMoeda = 0 Then
          Sql := Sql + ' ORDER BY U.NOMEUSUARIO, M.MOEDESC '
       Else
          Sql := Sql + ' ORDER BY U.NOMEUSUARIO '
    Else
       If IdMoeda = 0 Then
          Sql := Sql + ' ORDER BY M.MOEDESC ';
  end;

  //inicio  - pendência 18778 - 13/09/2005
  cdsParam.free;
  ctrlParamGlobal.free;
  //fim -  pendência 18778 - 13/09/2005


  Result := GetDataPacket( Sql );
end;

// Lista Moedas do usuario
function TCtrlUsrMoeda.ListaUsrMoedaUsr( IdUsuario: Double ): OleVariant;
var
  cdsParam : tclientDataset;
  ctrlParamGlobal : TctrlParamGlobal;
  sql: String;
begin
  Sql := 'SELECT MOECODIGO, MOEDESC, MOESIGLA ' +
            'FROM MOEDA ' +
           'WHERE MOECODIGO NOT IN ' +
                  '( SELECT MOECODIGO ' +
                      'FROM USUARIOXMOEDA ' +
                     'WHERE IDUSUARIO = ' + FloatToStr( IdUsuario ) + ' ) ';

  //inicio - pendência 18778 - 13/09/2005
  cdsParam := tclientDataset.Create(nil);
  ctrlParamGlobal := TCtrlParamGlobal.Create;
  ctrlParamGlobal.Initializeas(Padroes);
  cdsParam.data := ctrlParamGlobal.ListaParamGlobal(sistema.idempresa);
  //fim -  pendência 18778 - 13/09/2005

  if cdsParam.fieldByName('FLGORDENASIGLA').asInteger = 1 then //  pendência 18778 - 13/09/2005
    sql := sql + ' ORDER BY MOESIGLA '
  else
    sql := sql + 'ORDER BY MOEDESC ';

  //inicio - pendência 18778 - 13/09/2005
  cdsParam.free;
  ctrlParamGlobal.free;
  //fim -  pendência 18778 - 13/09/2005

  Result := GetDataPacket( Sql );
end;

procedure TCtrlUsrMoeda.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

