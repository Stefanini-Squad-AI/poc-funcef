unit uCtrlGrupoProd;

interface

Uses DB, uDataBase,uCmDbObject, uCmControlObject,uDbGrupoProd,
     uDbUsuxGrupProd, sysUtils, dbclient, uSistema, uMidasUtil,
     uCmTypes;
Const
   MSG_NAO_DELETE_GRUPOSINT = 'Não é possível excluir este grupo, pois existem grupos analíticos a ele. ';

Type
  TTipoGrupo = (tgTodos, tgAnaliticos, tgSinteticos);

  TCtrlGrupoProd = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
     _DbGrupoProd    : TDbGrupoProd;
     _DbUsuxGrupProd : TDbUsuxGrupProd;
    //-------------------------------------------------------------------------
    // Componentes de uso interno
    //-------------------------------------------------------------------------
    Fcds: TClientDataSet;

    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
   {**
      Grava o Grupos de Produto vindo da inteface
    **}
    Function  Grava : Boolean;
   {**
     Deleta o Grupo de Produto Informado
   **}
    Function  Excluir : Boolean;
   {**
      Informa os Grupos de Produto cadastrados
    **}
    Function Procurar( CodGrupoProd : String = '' ) : OleVariant;
   {**
      Verifica se o Grupo de Produto já existe
   **}
    Function JaExisteGrupo( CodGrupoProd : String ) : Boolean;
   {**
      Verifica se o Grupo de Produto possui sub-grupos
   **}
    Function PossuiSubGrupo( CodGrupoProd : String ) : Boolean;
   {**
      Lista os Grupo de Produto existentes
   **}
    Function ListGrupoProd( TipoGrupo : TTipoGrupo = tgTodos ) : OleVariant;
   {**
      Lista os Grupo de Produto atribuidos aos usuário
   **}
    Function ListGrupoAtribUsu( IdUsuario,IdPessoa : Double ) : OleVariant;
   {**
      Lista os Grupo de Produto não atribuidos aos usuário
   **}
    Function ListGrupoNaoAtribUsu( IdUsuario,IdPessoa : Double ) : OleVariant;
   {**
      Grava o Grupos de Produto ao determinado usuário
    **}
    Function AtribuiUsuxGrupo : OleVariant;

  End;

implementation

{ TCtrlGrupoProd }

function TCtrlGrupoProd.AtribuiUsuxGrupo: OleVariant;
Var
   Msg : String; 
begin
   Result := True;
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.AtribuiUsuxGrupo( Fcds.Data );
         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;

            Result := ApplyCds(fcds,_DbUsuxGrupProd,[],[]);
            Msg    := _DbUsuxGrupProd.MessageInfo;
            If Not Result Then Raise Exception.Create(Msg);
         

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

constructor TCtrlGrupoProd.Create;
begin
  inherited;
  _DbGrupoProd    := TDbGrupoProd.Create(Self);
  _DbUsuxGrupProd := TDbUsuxGrupProd.Create(Self);
end;

destructor TCtrlGrupoProd.Destroy;
begin
  If IsAppServer then
     FreeCds([Fcds]);

  _DbUsuxGrupProd.Free;
  _DbGrupoProd.Free;

  inherited;
end;

procedure TCtrlGrupoProd.DoChangeDataBase;
begin
  inherited;
  _DbGrupoProd.DataBaseName    := DataBaseName;
  _DbUsuxGrupProd.DataBaseName := DataBaseName;
end;

function TCtrlGrupoProd.Excluir : Boolean;
Var
   Msg : String;
begin
   If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluirGrupoProd( Fcds.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(fcds,_DbGrupoProd,[],[]);
           Msg    := _DbGRupoProd.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

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

function TCtrlGrupoProd.Grava: Boolean;
Var
   Msg : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravaGrupoProd( Fcds.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(fcds,_DbGrupoProd,[],[]);
           Msg    := _DbGrupoProd.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

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

function TCtrlGrupoProd.JaExisteGrupo(CodGrupoProd: String): Boolean;
Var
   SQL : String;
begin
   CodGrupoProd := Copy( Trim(CodGrupoProd) + '                  ',1,10);

   SQL := 'SELECT CODGRUPOPROD FROM GRUPPROD WHERE (CODGRUPOPROD = '+QuotedStr( CodGrupoProd )+')';

   _cds.Data :=  GetDataPacket( SQL );

   Result := Not _cds.IsEmpty;

end;

function TCtrlGrupoProd.ListGrupoAtribUsu(IdUsuario,IdPessoa: Double): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT '+
          '     UXG.IDUSUARIO,    '+
          '     UXG.CODGRUPOPROD, '+
          '     UXG.IDPESSOA,     '+
          '     GRP.DESCGRUPOPROD '+
          'FROM                   '+
          '     USUXGRUPPROD UXG, '+
          '     GRUPPROD GRP      '+
          'WHERE '+
          '       (UXG.IDUSUARIO = '+FloatToStr(IdUsuario)+') '+
          '   AND (UXG.IDPESSOA  = '+FloatToStr(IdPessoa)+') '+
          '   AND (UXG.CODGRUPOPROD = GRP.CODGRUPOPROD) '+
          'ORDER BY GRP.DESCGRUPOPROD ';

   Result := GetDataPacket( SQL );

end;

function TCtrlGrupoProd.ListGrupoNaoAtribUsu(IdUsuario,
  IdPessoa: Double): OleVariant;
Var
   SQL : String;
begin
   SQL := 'SELECT '+
          '     CODGRUPOPROD, '+
          '     DESCGRUPOPROD '+
          'FROM '+
          '      GRUPPROD '+
          'WHERE '+
          '      (CODGRUPOPROD NOT IN ( SELECT CODGRUPOPROD FROM USUXGRUPPROD '+
          '                               WHERE  (IDUSUARIO = '+FloatToStr(IdUsuario)+' ) '+
          '                                  AND (IDPESSOA = '+FloatToStr(IdPessoa)+')  )) '+
          'ORDER BY DESCGRUPOPROD ';

   Result := GetDataPacket( SQL );

end;

function TCtrlGrupoProd.ListGrupoProd(TipoGrupo: TTipoGrupo): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT              '+
          '       CODGRUPOPROD, '+
          '       DESCGRUPOPROD '+
          '  FROM               '+
          '       GRUPPROD      '+
          '  WHERE (1=1)        ';
   If  TipoGrupo = tgAnaliticos Then
      SQL := SQL + '  AND (STATUSGRUPO = ''A'') '
   Else
   If  TipoGrupo = tgSinteticos Then
      SQL := SQL + '  AND (STATUSGRUPO = ''S'') ';

   SQL := SQL + '  ORDER BY CODGRUPOPROD  ';

   Result := GetDataPacket( SQL );

end;

procedure TCtrlGrupoProd.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

function TCtrlGrupoProd.PossuiSubGrupo(CodGrupoProd: String): Boolean;
Var
   SQL : String;
begin
   CodGrupoProd := Copy( Trim(CodGrupoProd) + '                  ',1,10);

   SQL :=  ' SELECT CODGRUPOPROD FROM GRUPPROD '+
           '  WHERE (CODGRUPOPROD LIKE '+QuotedStr( Trim(CodGrupoProd) )+' || ''%'' ) '+
           '    AND (CODGRUPOPROD <> '+QuotedStr( CodGrupoProd )+')';

   _Cds.Data := GetDataPacket( SQL );

   Result := Not _Cds.IsEmpty;
end;

Function TCtrlGrupoProd.Procurar(CodGrupoProd: String) : OleVariant;
begin
   CodGrupoProd := Copy(CodGrupoProd+'                       ',1,10);

   If  Trim(CodGrupoProd) <> '' Then
      _DbGrupoProd.CodGrupoProd.AsString := CodGrupoProd
   Else
      _DbGrupoProd.CodGrupoProd.AsString := '';

   Result := GetDataPacket( _DbGrupoProd.SSqlSelect );
end;

procedure TCtrlGrupoProd.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.
