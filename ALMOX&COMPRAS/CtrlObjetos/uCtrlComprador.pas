unit uCtrlComprador;

interface

Uses DB, uDataBase,uCmDbObject, uCmControlObject,uDbGrpxComp,
     sysUtils, dbclient, uSistema, uMidasUtil,Classes, uCMTypes;

Type
  TCtrlComprador = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
     _DbGrpxComp : TDbGrpxComp;
    //-------------------------------------------------------------------------
    // Componentes de uso interno
    //-------------------------------------------------------------------------
     Fcds: TClientDataSet;
    {**
      Verifica se o usuario já é comprador
     **}
    Function  EComprador( idComprador : Double ) : Boolean;
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
      Atribui os grupo de produto para o comprador
    **}
    Function  AtribuirGrupos( IdComprador : Double ) : Boolean;
   {**
      Informa os grupos que não forma associados ao comprador
    **}
    Function  ListGrupoDisponivel( IdComprador : Double ) : OleVariant;
   {**
      Informa os Compradore existentes
    **}
    Function  ListComprador : OleVariant;
   {**
      Verifica se o comprador pode compra o determinado produto
    **}
    Function  PodeCompra( IdComprador : Double; CodArtigo : String ) : Boolean;
   {**
      Procurar o determinado Comprador
    **}
    Function  Procurar( IdComprador : Double = 0 ) : OleVariant;
   {**
      Informa os Compradore existentes
    **}
    Function  ListItensAssociados(IdComprador,IdPessoa : Double) : OleVariant;

    function ListaArtigosOCSemCotacao(IdComprador,IdPessoa: Double): OleVariant;
  End;

implementation

{ TCtrlComprador }

function TCtrlComprador.AtribuirGrupos( IdComprador : Double ) : Boolean;
Var
   SQL  : String;
   Msg  : String;
   bDelteComprador : Boolean;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.AtribuirGrupos( IdComprador, Fcds.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           bDelteComprador := fCds.IsEmpty;
           // Verificase é comprador
           If ( IdComprador > 0 ) And (Not EComprador(IdComprador)) Then
              Begin
                 SQL := 'INSERT INTO COMPRADOR( IDPESSOA ) VALUES ('+FloatToStr(IdComprador)+' )';
                 If Not ExecSQL(SQL , True)  Then
                   Abort;
              End;

           Result := ApplyCds(Fcds,_DbGrpxComp,[],[] );
           Msg    := _DbGrpxComp.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           If (bDelteComprador) And (IdComprador > 0 ) Then
              Begin
                 SQL := 'DELETE FROM COMPRADOR WHERE (IDPESSOA ='+FloatToStr(IdComprador)+' )';
                 If Not ExecSQL(SQL , True) Then
                   Abort;
              End;

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

constructor TCtrlComprador.Create;
begin
  inherited;
  _DbGrpxComp := TDbGrpxComp.Create(Self);
end;

destructor TCtrlComprador.Destroy;
begin
  If IsAppServer Then
     FreeCds([Fcds]);

  _DbGrpxComp.Free;

  inherited;
end;

procedure TCtrlComprador.DoChangeDataBase;
begin
  inherited;
  _DbGrpxComp.DataBaseName := DataBaseName;
end;

function TCtrlComprador.EComprador(idComprador: Double): Boolean;
Var
   SQL : String;
begin
   SQL := 'SELECT IDPESSOA FROM COMPRADOR WHERE (IDPESSOA ='+FloatToStr(idComprador)+' )';

   _cds.Data := GetDataPacket(SQL);

   Result := Not _cds.IsEmpty;

end;




function TCtrlComprador.ListaArtigosOCSemCotacao(IdComprador,
  IdPessoa: Double): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Append('SELECT ');
      SQL.Append('       (RTRIM(IT.CODARTIGO) || TO_CHAR(IT.IDPRODVARI)|| TO_CHAR(SC.NUMSOLCOMPRA)) AS CHAVE,');
      SQL.Append('       SC.NUMSOLCOMPRA,                    ');
      SQL.Append('       IT.IDITEMSOLI,                      ');
      SQL.Append('       IT.CODARTIGO,                       ');
      SQL.Append('       IT.CODMEDIDA,                       ');
      SQL.Append('       (IT.QTDEPENDENTE) AS QTDEPEDIDA,    ');
      SQL.Append('       P.CODMEDCUSTO,                      ');
      SQL.Append('       SUBSTR(DECODE(IT.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI),1,60) AS DESCRICAO, ');
      SQL.Append('       IT.IDPRODVARI,             ');
      SQL.Append('       IT.OBSITEMSOLIC,           ');
      SQL.Append('       P.CODPRODUTO,              ');
      SQL.Append('       P.CODGRUPOPROD             ');
      SQL.Append('FROM                              ');
      SQL.Append('       SOLICOMP SC,               ');
      SQL.Append('       ITEMSOLI IT,               ');
      SQL.Append('       ARTIGO A,                  ');
      SQL.Append('       PRODUTO P,                 ');
      SQL.Append('       PRODVARI PV,               ');
      SQL.Append('       RADINSTPROCESSO RP         ');
      SQL.Append('WHERE                             ');
      SQL.Append('       (IT.CODPROCESSO IS NULL )  ');
      SQL.Append('   AND (IT.IDPROCXART IS NULL)    ');
      SQL.Append('   AND (SC.IDPESSOA     = '+FloatToStr(IdPessoa)+')');
      SQL.Append('   AND (IT.IDCOMPRADOR  = '+FloatToStr(IdComprador)+')');
      SQL.Append('   AND (IT.QTDEPENDENTE > 0)      ');
      SQL.Append('   AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)  ');
      SQL.Append('   AND (IT.IDITEMSOLI NOT IN (SELECT IDITEMSOLI FROM SCITEMOC))');
      SQL.Append('   AND (IT.CODARTIGO    = A.CODARTIGO)      ');
      SQL.Append('   AND (A.CODPRODUTO    = P.CODPRODUTO)     ');
      SQL.Append('   AND (IT.IDPRODVARI   = PV.IDPRODVARI(+)) ');
      SQL.Append('   AND (RP.IDPROCESSO(+)= SC.IDPROCESSO)    ');
      SQL.Append('   AND ((SC.IDPROCESSO IS NULL) OR ((RP.FLGOK = ''S'') AND (SC.IDPROCESSO IS NOT NULL))) ');
      SQL.Append('ORDER BY DESCRICAO ');
      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;




function TCtrlComprador.ListComprador: OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT             '+
          '       C.IDPESSOA,  '+
          '       U.NOMEUSUARIO AS NOME '+
          ' FROM               '+
          '       COMPRADOR C, '+
          '       USUARIOSISTEMA U '+
          ' WHERE              '+
          '    ( C.IDPESSOA = U.IDUSUARIO)'+
          'ORDER BY 2 ';

   Result := GetDataPacket( SQL );
end;

function TCtrlComprador.ListGrupoDisponivel(IdComprador: Double): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT             '+
          '      CODGRUPOPROD, '+
          '      DESCGRUPOPROD,'+
          '      STATUSGRUPO   '+
          ' FROM               '+
          '     GRUPPROD       '+
          ' WHERE              '+
          '    (CODGRUPOPROD NOT IN '+
          '    (SELECT CODGRUPOPROD FROM GRPXCOMP WHERE ( IDCOMPRADOR = '+FloatToStr( IdComprador )+') ) ) '+
          ' ORDER BY CODGRUPOPROD    ';

   Result := GetDataPacket( SQL );
end;

function TCtrlComprador.ListItensAssociados(IdComprador,IdPessoa: Double): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Append('SELECT ');
      SQL.Append('       (RTRIM(IT.CODARTIGO) || TO_CHAR(IT.IDPRODVARI)|| TO_CHAR(SC.NUMSOLCOMPRA)) AS CHAVE,');
      SQL.Append('       SC.NUMSOLCOMPRA,                    ');
      SQL.Append('       IT.IDITEMSOLI,                      ');
      SQL.Append('       IT.CODARTIGO,                       ');
      SQL.Append('       IT.CODMEDIDA,                       ');
      SQL.Append('       (IT.QTDEPENDENTE) AS QTDEPEDIDA,    ');
      SQL.Append('       P.CODMEDCUSTO,                      ');
      SQL.Append('       SUBSTR(DECODE(IT.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI),1,60) AS DESCRICAO, ');
      SQL.Append('       IT.IDPRODVARI,             ');
      SQL.Append('       IT.OBSITEMSOLIC,           ');
      SQL.Append('       P.CODPRODUTO,              ');
      SQL.Append('       P.CODGRUPOPROD             ');
      SQL.Append('FROM                              ');
      SQL.Append('       SOLICOMP SC,               ');
      SQL.Append('       ITEMSOLI IT,               ');
      SQL.Append('       ARTIGO A,                  ');
      SQL.Append('       PRODUTO P,                 ');
      SQL.Append('       PRODVARI PV,               ');
      SQL.Append('       RADINSTPROCESSO RP         ');
      SQL.Append('WHERE                             ');
      SQL.Append('       (IT.CODPROCESSO IS NULL )  ');
      SQL.Append('   AND (IT.IDPROCXART IS NULL)    ');
      SQL.Append('   AND (SC.IDPESSOA     = '+FloatToStr(IdPessoa)+')');
      SQL.Append('   AND (IT.IDCOMPRADOR  = '+FloatToStr(IdComprador)+')');
      SQL.Append('   AND (IT.QTDEPENDENTE > 0)      ');
      SQL.Append('   AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA)  ');
      SQL.Append('   AND (IT.CODARTIGO    = A.CODARTIGO)      ');
      SQL.Append('   AND (A.CODPRODUTO    = P.CODPRODUTO)     ');
      SQL.Append('   AND (IT.IDPRODVARI   = PV.IDPRODVARI(+)) ');
      SQL.Append('   AND (RP.IDPROCESSO(+)= SC.IDPROCESSO)    ');
      SQL.Append('   AND ((SC.IDPROCESSO IS NULL) OR ((RP.FLGOK = ''S'') AND (SC.IDPROCESSO IS NOT NULL))) ');
      SQL.Append('ORDER BY DESCRICAO ');
      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;

end;

procedure TCtrlComprador.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

function TCtrlComprador.PodeCompra(IdComprador: Double; CodArtigo: String): Boolean;
Var
   SQL : String;
begin
   CodArtigo := Copy(CodArtigo+'                   ',1,14);

   SQL := ' SELECT               '+
          '      GXP.IDCOMPRADOR '+
          '  FROM                '+
          '      GRPXCOMP GXP,   '+
          '      PRODUTO P,      '+
          '      ARTIGO A        '+
          '  WHERE               '+
          '        (GXP.IDCOMPRADOR = '+FloatToStr(IdComprador)+') '+
          '    AND (A.CODARTIGO = '+QuotedStr(CodArtigo)+') '+
          '    AND (GXP.CODGRUPOPROD = P.CODGRUPOPROD)'+
          '    AND (P.CODPRODUTO = A.CODPRODUTO)      ';

   _Cds.Data := GetDataPacket( SQL );

   Result := Not _Cds.IsEmpty;
end;

Function TCtrlComprador.Procurar(IdComprador: Double) : OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Append('SELECT                   ');
      SQL.Append('      GXC.IDCOMPRADOR,   ');
      SQL.Append('      GXC.CODGRUPOPROD,  ');
      SQL.Append('      GRP.DESCGRUPOPROD, ');
      SQL.Append('      GRP.STATUSGRUPO    ');
      SQL.Append('FROM                     ');
      SQL.Append('      GRPXCOMP GXC,      ');
      SQL.Append('      GRUPPROD GRP       ');
      SQL.Append('WHERE                    ');
      SQL.Append('      (GXC.IDCOMPRADOR = '+FloatToStr(idComprador)+') ');
      SQL.Append('  AND (GXC.CODGRUPOPROD = GRP.CODGRUPOPROD)');
      SQL.Append('ORDER BY GXC.CODGRUPOPROD  ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

procedure TCtrlComprador.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;


end.
