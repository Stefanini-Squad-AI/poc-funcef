//******************************************************************************
//Data	    : 17/08/2007
//Código    : Al_1
//Pendencia : 25728
//SOL       : 63282
//Motivo(S) : Ajuste para quando não houver acesso cadastrado buscar todas as
//              carteiras.
//******************************************************************************
unit uCtrlAcessoCarteira;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uCMClientDataSet, uCtrlRendaVariavel, uCtrlPadroes,
     uDBGrupoAcessoXCart,
     uCMFileUtils {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TTipoOper = set of (Inclusao, Alteracao, Exclusao, Browse);
   TCtrlAcessoCarteira = Class(TCmControlObject)
   private
      // -- Objetos Externos --------------------------------------
      CtrlRendaVariavel: TCtrlRendaVariavel;

      // -- Objetos Internos --------------------------------------
      FcdsGrupoXCart: TClientDataSet;
      FDbGrupoXCart: TDbGrupoAcessoXCart;

      FOperacao: TTipoOper;
      FGrupoAtual: Integer;
      FNomeGrupoAtual: String;
      FSQLCarteiras: String;

      // -- Propriedades dos Objetos Internos ---------------------
      procedure SetcdsGrupoXCart(const Value: TClientDataSet);
      procedure SetDbGrupoXCart(const Value: TDbGrupoAcessoXCart);

      // -- Propriedades Externas ---------------------------------
      procedure SetOperacao(const Value: TTipoOper);
      procedure SetGrupoAtual(const Value: Integer);
      procedure SetNomeGrupoAtual(const Value: String);
      procedure SetSQLCarteiras(const Value: String);

   public

      // -- Propriedades dos Objetos Internos ---------------------
      property cdsGrupoXCart: TClientDataSet read FcdsGrupoXCart write SetcdsGrupoXCart;
      property DbGrupoXCart: TDbGrupoAcessoXCart read FDbGrupoXCart write SetDbGrupoXCart;


      // -- Propriedades Externas ---------------------------------
      property Operacao: TTipoOper read FOperacao write SetOperacao;
      property GrupoAtual: Integer read FGrupoAtual write SetGrupoAtual;
      property NomeGrupoAtual: String read FNomeGrupoAtual write SetNomeGrupoAtual;

      property SQLCarteiras: String read FSQLCarteiras write SetSQLCarteiras;

      // -- Métodos Externos --------------------------------------
      function ListaGrupos(iGrupo: Integer = -1): OleVariant;
      function ListaGrupoXCart(iGrupo: Integer): OleVariant;
      function ListaCarteiras(iGrupo: Integer = -1): OleVariant;

      function ListaGrupoXUsu(iGrupo: Integer): OleVariant;
      function ListaUsuarios(iGrupo: Integer = -1): OleVariant;

      function ListaCartAutorizada(iUsuario: Integer = -1; iGrupo: Integer = -1): OleVariant;


      function GravaGrupoXCart(iGrupo: Integer = -1): Boolean;

      // -- Métodos Internos---------------------------------------
      constructor Create; override;
      destructor Destroy; override;
      procedure OnCreateAppServer; override;

   protected
      procedure DoChangeDataBase; override;

   end;

implementation

{TCtrlCustodia}

constructor TCtrlAcessoCarteira.Create;
begin
   inherited;
   FDbGrupoXCart := TDbGrupoAcessoXCart.Create(Self);
   // Cria e Inicializa a Control Renda Variável
   CtrlRendaVariavel := TCtrlRendaVariavel.Create;
   CtrlRendaVariavel.InitializeAs(Padroes);
end;

destructor TCtrlAcessoCarteira.Destroy;
begin
   FreeAndNil(FDbGrupoXCart);
   FreeAndNil(CtrlRendaVariavel);
   if IsAppServer then FreeAndNil(FcdsGrupoXCart);
   inherited;
end;

procedure TCtrlAcessoCarteira.OnCreateAppServer;
begin
   inherited;
   FcdsGrupoXCart := TClientDataSet.Create(nil);
end;

procedure TCtrlAcessoCarteira.DoChangeDataBase;
begin
   inherited;
   FDbGrupoXCart.DataBaseName := DataBaseName;
end;

procedure TCtrlAcessoCarteira.SetcdsGrupoXCart(const Value: TClientDataSet);
begin
  FcdsGrupoXCart := Value;
end;

procedure TCtrlAcessoCarteira.SetDbGrupoXCart(const Value: TDbGrupoAcessoXCart);
begin
  FDbGrupoXCart := Value;
end;

procedure TCtrlAcessoCarteira.SetOperacao(const Value: TTipoOper);
begin
  FOperacao := Value;
end;

procedure TCtrlAcessoCarteira.SetGrupoAtual(const Value: Integer);
begin
  FGrupoAtual := Value;
end;

procedure TCtrlAcessoCarteira.SetNomeGrupoAtual(const Value: String);
begin
  FNomeGrupoAtual := Value;
end;

procedure TCtrlAcessoCarteira.SetSQLCarteiras(const Value: String);
begin
  FSQLCarteiras := Value;
end;

function TCtrlAcessoCarteira.ListaGrupos(iGrupo: Integer = -1): OleVariant;
var sSQL: String;
begin
   sSql := 'SELECT IDGRUPO, NOMEGRUPO, DESCRICAO ' + #13 +
           'FROM GRUPOACESSO ' + #13;
   if iGrupo >= 0 then
      sSql := sSql + 'WHERE IDGRUPO = ' + IntToStr(iGrupo) + #13;
   sSql := sSql + 'ORDER BY NOMEGRUPO';
   Result := GetDataPacket(sSql);
end;

function TCtrlAcessoCarteira.ListaGrupoXCart(iGrupo: Integer): OleVariant;
var sSQL: String;
begin
   sSql := 'SELECT C.DESCCARTINVEST, G.IDGRUPO, G.IDCARTEIRAINVEST, G.IDGRUPOACESSOXCART ' + #13 +
           'FROM GRUPOACESSOXCART G, CARTEIRAINVEST C ' + #13 +
           'WHERE G.IDCARTEIRAINVEST = C.IDCARTEIRAINVEST ' + #13 +
           '  AND G.IDGRUPO = ' + IntToStr(iGrupo) + #13 +
           'ORDER BY C.DESCCARTINVEST';
   Result := GetDataPacket(sSql);
end;

function TCtrlAcessoCarteira.ListaCarteiras(iGrupo: Integer): OleVariant;
var sSQL: String;
begin
   sSql := 'SELECT C.DESCCARTINVEST, G.IDGRUPO, C.IDCARTEIRAINVEST, G.IDGRUPOACESSOXCART ' + #13 +
           'FROM CARTEIRAINVEST C, ' + #13 +
           '     (SELECT IDGRUPOACESSOXCART, IDCARTEIRAINVEST, IDGRUPO ' + #13 +
           '      FROM GRUPOACESSOXCART ' + #13 +
           '      WHERE IDGRUPO = ' + IntToStr(iGrupo) + ') G ' + #13 +
           'WHERE C.IDCARTEIRAINVEST = G.IDCARTEIRAINVEST(+) ' + #13 +
           '  AND G.IDGRUPO IS NULL ' + #13 +
           'ORDER BY C.DESCCARTINVEST';
   Result := GetDataPacket(sSql);
end;




function TCtrlAcessoCarteira.ListaGrupoXUsu(iGrupo: Integer): OleVariant;
var sSQL: String;
begin
   sSql := 'SELECT U.NOMEUSUARIO, G.IDGRUPOCARTEIRA, G.IDUSUARIO ' + #13 +
           'FROM GRUPOCARTXUSU G, USUARIOSISTEMA U ' + #13 +
           'WHERE G.IDUSUARIO = U.IDUSUARIO ' + #13 +
           '  AND IDGRUPOCARTEIRA = ' + IntToStr(iGrupo) + #13 +
           'ORDER BY U.NOMEUSUARIO';
   Result := GetDataPacket(sSql);
end;

function TCtrlAcessoCarteira.ListaUsuarios(iGrupo: Integer = -1): OleVariant;
var sSQL: String;
begin
   sSql := 'SELECT U.NOMEUSUARIO, G.IDGRUPOCARTEIRA, U.IDUSUARIO ' + #13 +
           'FROM USUARIOSISTEMA U, ' + #13 +
           '     (SELECT IDUSUARIO, IDGRUPOCARTEIRA ' + #13 +
           '      FROM GRUPOCARTXUSU ' + #13 +
           '      WHERE IDGRUPOCARTEIRA = ' + IntToStr(iGrupo) + ') G ' + #13 +
           'WHERE U.IDUSUARIO = G.IDUSUARIO(+) ' + #13 +
           '  AND G.IDGRUPOCARTEIRA IS NULL ' + #13 +
           'ORDER BY U.NOMEUSUARIO';
   Result := GetDataPacket(sSql);
end;

function TCtrlAcessoCarteira.ListaCartAutorizada(iUsuario: Integer = -1; iGrupo: Integer = -1): OleVariant;
var sSQL: String;
begin
   sSql := 'SELECT CT.IDCARTEIRAINVEST, CT.DESCCARTINVEST, CT.IDGESTORCARTEIRA, CT.FLGCARTPROP, CT.FLGCALCDIARIO, CT.DATAINICIO,' + #13 +
           '       CT.FLGTRATALOTE, CT.IDPLANOPREV, CT.IDPATROCINADORA, CT.IDTIPOINVEST, CT.IDMERCADO, CT.FLGORDMOVINV, CT.DATAULTFECH, ' + #13 +
           '       CT.IDDAIEACART, CT.FLGCARTLASTRO, CT.FLGCARTTERC, CT.IDCONSELHINVEST, CT.FLGCONTABILIZA, 0 AS IDCARTEIRAGERENC ' + #13 +
           'FROM CARTEIRAINVEST CT, ' + #13 +
           '     GRUPOACESSOXCART GC, ' + #13 +
           '     (SELECT DISTINCT IDGRUPO ' + #13 +
           '      FROM GRUPOUSU ';
   if iGrupo > 0 then
   begin
      sSQL := sSql + #13 +
           '      WHERE IDGRUPO = ' + IntToStr(iGrupo);
      if iUsuario > 0 then
         sSQL := sSql + #13 +
           '        AND IDUSUARIO = ' + IntToStr(iUsuario);

   end
   else if iUsuario > 0 then
      sSQL := sSql + #13 +
           '      WHERE IDUSUARIO = ' + IntToStr(iUsuario);

   sSQL := sSql + ') GU ' + #13 +
           'WHERE CT.IDCARTEIRAINVEST = GC.IDCARTEIRAINVEST(+) ' + #13 +
           '  AND GC.IDGRUPO = GU.IDGRUPO(+) ' + #13 +
           '  AND GC.IDGRUPO = GU.IDGRUPO(+) ' + #13 +
           '  AND GC.IDGRUPO = GU.IDGRUPO(+) ' + #13 +
           //AL_1 - Se não houver nenhum acesso cadastrado, seleciona todas as carteiras
           '  AND (((EXISTS (SELECT IDGRUPOACESSOXCART FROM GRUPOACESSOXCART)) AND (GU.IDGRUPO IS NOT NULL)) OR ' + #13 +
           '     ((NOT EXISTS (SELECT IDGRUPOACESSOXCART FROM GRUPOACESSOXCART)) AND (GU.IDGRUPO IS NULL))) ' + #13 +
           'ORDER BY CT.DESCCARTINVEST';
   FSQLCarteiras := sSql;
   Result := GetDataPacket(sSql);
end;

function TCtrlAcessoCarteira.GravaGrupoXCart(iGrupo: Integer): Boolean;
var bComita, bCdsLocal: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravaGrupoXCart(iGrupo);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try // Finally

         MessageInfo := '';

         try // Except

            if not InTransaction then
            begin
               bComita := True;
               StartTransaction;
            end
            else
               bComita := False;

            Result := ApplyCds(cdsGrupoXCart, DbGrupoXCart,[],[]);
            if not Result then
               Raise Exception.Create(DbGrupoXCart.MessageInfo);

            if bComita then
               Commit
         except
            on E:Exception do
            begin
               Result := False;
               if bComita then
                  Rollback;
               MessageInfo := E.Message;
            end;
         end;
      finally
      end;
   end;
end;

end.
