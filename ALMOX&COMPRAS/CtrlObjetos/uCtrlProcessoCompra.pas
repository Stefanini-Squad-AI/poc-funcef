// Alterações:
{ --------------------------------------------------------------------------------------------------
Data      : 20.09.2007
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 26385
Descrição : Previne problemas caso o RAD esteja ativo e não exista tipo de processo vinculado ao mesmo.
---------------------------------------------------------------------------------
Data      : 04.12.2006
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 23860
Descrição : Implementação RAD+
---------------------------------------------------------------------------------
Rotina    : Excluir
Data      : 07/10/2004
Autor     : Marchetti
Pendência : 12109
Descrição : Exclusao do processo RAD quando excluir processo de compra
---------------------------------------------------------------------------------------------------}
unit uCtrlProcessoCompra;

interface
Uses DB, uDataBase,uCmDbObject, uCmControlObject, sysUtils,
     dbclient,uSistema,Classes, uDbProcesso, uDbCotacoes,
     uDbItemSoli, uDbArtxForn, uDbProcxArt, uCtrlUnMedida,
     uMidasUtil, uCMTypes , uCtrlRAD, uCtrlRADPlus, uModulo;
Const
    MSG_NAO_ITENS_SELECT = 'Não há itens selecionados. ';
Type

  TGrupos = record
    sGrupo : string;
    fValor : extended;
  end;

  TCtrlProcessoCompra = class(TCmControlObject)
  Protected
    procedure AfterInitialize; Override;
    procedure DoChangeDataBase; Override;
    procedure OnCreateAppServer; Override;
    procedure OnApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean);  Override;
  private

    aGrupos : array of TGrupos;

    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbProcesso      : TDbProcesso;
    _DbCotacoes      : TDbCotacoes;
    _DbItemSoli      : TDbItemSoli;
    _DbArtxForn      : TDbArtxForn;
    _DbProcxArt      : TDbProcxArt;
    //-------------------------------------------------------------------------
    // Componentes de uso interno
    //-------------------------------------------------------------------------
    _UnMedida         : TCtrlUnMedida;
    _RAD              : TCtrlRAD;
    RADPlus           : TCtrlRADPlus;

    //-------------------------------------------------------------------------
    FcdsItemSoli: TClientDataSet;
    FcdsProcesso: TClientDataSet;
    FcdsCotacao: TClientDataSet;
    FcdsNovoForn: TClientDataSet;

    procedure SetcdsItemSoli(const Value: TClientDataSet);
    procedure SetcdsProcesso(const Value: TClientDataSet);
    procedure SetcdsCotacao(const Value: TClientDataSet);
    procedure SetcdsNovoForn(const Value: TClientDataSet);
    {**
       Exclui os dados da Cotação
    **}
    Function ExcluiDadosCotacao( CodProcesso : Double;
                                 IdProcxArt  : Double;
                                 IdForCli    : Double = 0 ) : Boolean;
    {**
       Grava os dados para autorização no R.A.D.
    **}
    Function GravaRAD( IdPessoa, CodProcesso, IdUsuario : Double; sGrupoProd : string ) : Boolean;

  Public
    Property cdsProcesso : TClientDataSet read FcdsProcesso write SetcdsProcesso;
    Property cdsItemSoli : TClientDataSet read FcdsItemSoli write SetcdsItemSoli;
    Property cdsCotacao  : TClientDataSet read FcdsCotacao write SetcdsCotacao;
    Property cdsNovoForn : TClientDataSet read FcdsNovoForn write SetcdsNovoForn;

    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;

    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------

    function StatusProcesso(CodProcesso: Double): string;


    {**
       Grava as Solicitações no banco de dados
    **}
    Function Gravar( IdPessoa  : Double;
                     IdUsuario : Double ) : Boolean;
    {**
       Apaga as Solicitações  no banco de dados
    **}
    Function Excluir : Boolean;
    {**
       Busca as Solicitações  existentes.
    **}
    Function Procurar( CodProcesso : Double ) : OleVariant;
    {**
       Pega o conjuto de dados dos fornecedores que já cotaram
       alguma vez os itens do Processo de Compra.
     **}
    Function  GetFornecedoresCotacao( CodProcesso,IdProcxArt : Double; CodArtigo : String ) : OleVariant;
    {**
       Pega o conjuto de dados contendo os itens da solicitação
       de compra que já foram atribuidos ao Processo de Compra.
     **}
    Function  GetItensAtribuidos( CodProcesso : Double ) : OleVariant;
    {**
       Pega o  conjuto de dados contendo os itens do processo
       de compra que já estão em cotação
     **}
    Function  GetCotacao( CodProcesso : Double ) : OleVariant;
    {**
       Pega a estrutura para adicionar um novo fornecedor
     **}
    Function  GetNovoFornecedor : OleVariant;

  End;

implementation

var Modulo : TModulo;

{ TCtrlProcessoCompra }

procedure TCtrlProcessoCompra.AfterInitialize;
begin
  inherited;
  _UnMedida.InitializeAs(Self);

  _RAD.InitializeAs(Self);
  _RAD.OpenTransaction := False;

  RADPlus.InitializeAs(Self);
  RADPlus.OpenTransaction := false;
  RADPlus.InitializeAs(Self);
  RADPlus.OpenTransaction := false;

end;

constructor TCtrlProcessoCompra.Create;
begin
  inherited;
  _UnMedida    := TCtrlUnMedida.Create;
  _RAD         := TCtrlRAD.Create;

  RADPlus          := TCtrlRADPlus.Create;

  //
  _DbProcesso  := TDbProcesso.Create(Self);
  _DbCotacoes  := TDbCotacoes.Create(Self);
  _DbItemSoli  := TDbItemSoli.Create(Self);
  _DbArtxForn  := TDbArtxForn.Create(Self);
  _DbProcxArt  := TDbProcxArt.Create(Self);

end;

destructor TCtrlProcessoCompra.Destroy;
begin
   if IsAppServer Then
      FreeCds([FcdsItemSoli,FcdsProcesso,FcdsCotacao,FcdsNovoForn]);

   _UnMedida.Free;
   _RAD.Free;

   FreeAndNil(RADPlus);

   _DbProcesso.Free;
   _DbCotacoes.Free;
   _DbItemSoli.Free;
   _DbArtxForn.Free;
   _DbProcxArt.Free;

   inherited;
end;

procedure TCtrlProcessoCompra.DoChangeDataBase;
begin
  inherited;
  _DbProcesso.DataBaseName := DataBaseName;
  _DbCotacoes.DataBaseName := DataBaseName;
  _DbItemSoli.DataBaseName := DataBaseName;
  _DbArtxForn.DataBaseName := DataBaseName;
  _DbProcxArt.DataBaseName := DataBaseName;

end;

function TCtrlProcessoCompra.ExcluiDadosCotacao(CodProcesso, IdProcxArt,
  IdForCli: Double): Boolean;
Var
   Sql     : String;
   sWhere  : String;
begin
   Result := True;
   Try
      sWhere := ' WHERE (CODPROCESSO = '+FloatToStr(CodProcesso)+')'+
                '   AND (IDPROCXART  = '+FloatToStr(IdProcxArt)+')';
      If IdForCli > 0 Then
         sWhere := sWhere + '  AND (IDFORCLI = '+ FloatToStr(IdForCli)+ ')';

     Sql := ' DELETE FROM PRAZOPGTO '+ sWhere;
     If Not ExecSQL( Sql ) Then
        Raise Exception.Create( MessageInfo );

     Sql := ' DELETE FROM PRAZOENTREGA '+ sWhere;
     If Not ExecSQL( Sql ) Then
        Raise Exception.Create( MessageInfo );

     Sql := ' DELETE FROM VALORAGREGCOT '+ sWhere;
     If Not ExecSQL( Sql ) Then
        Raise Exception.Create( MessageInfo );

     Sql := ' DELETE FROM COTACOES '+ sWhere;
     If Not ExecSQL( Sql ) Then
        Raise Exception.Create( MessageInfo );
   Except
      On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
   End;
end;

function TCtrlProcessoCompra.Excluir: Boolean;
Var
   SQL            : String;
   CodProcesso    : Double;
   iIDProcessoRad : Double;
Begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluirProcessoCompra( FcdsProcesso.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try

           StartTransaction;

           Try
              FcdsProcesso.StatusFilter := [usDeleted];
              CodProcesso    := FcdsProcesso.FieldByName('CODPROCESSO').AsFloat;

              _cds.Data := GetDataPacket('SELECT IDPROCESSO FROM PROCESSO WHERE CODPROCESSO = ' + FcdsProcesso.FieldByName('CODPROCESSO').AsString);
              iIDProcessoRad := _cds.FieldByName('IDPROCESSO').AsFloat;
           Finally
               FcdsProcesso.StatusFilter := [];
           End;

           if iIDProcessoRad > 0 then
           begin
              _RAD.ExcluirProcesso(iIDProcessoRAD, True);
           end;

           SQL := 'SELECT CODPROCESSO,IDPROCXART FROM PROCXART WHERE (CODPROCESSO ='+FloatToStr( CodProcesso )+')';

           _Cds.Data := GetDataPacket( SQL );

           _Cds.First;
           While Not _Cds.Eof Do
              Begin
                 //------------------------------------------------------------------------------
                 // Exclui cotação do Item
                 //------------------------------------------------------------------------------
                 If Not ExcluiDadosCotacao(_Cds.FieldByName('CODPROCESSO').AsFloat,
                                           _Cds.FieldByName('IDPROCXART').AsFloat)
                 Then
                    Raise Exception.Create( MessageInfo );

                 //------------------------------------------------------------------------------
                 // Retorna o item para pedente (não associado a nenhum processo de compra)
                 //------------------------------------------------------------------------------
                 SQL := ' UPDATE ITEMSOLI SET CODPROCESSO = NULL ,IDPROCXART  = NULL '+
                        ' WHERE (CODPROCESSO = '+FloatToStr(_Cds.FieldByName('CODPROCESSO').AsFloat)+')'+
                        '   AND (IDPROCXART  = '+FloatToStr(_Cds.FieldByName('IDPROCXART').AsFloat)+')';
                  If Not ExecSQL( SQL ) Then
                     Raise Exception.Create( MessageInfo );

                 //------------------------------------------------------------------------------
                 SQL := ' DELETE FROM PROCXART '+
                        ' WHERE (CODPROCESSO = '+FloatToStr(_Cds.FieldByName('CODPROCESSO').AsFloat)+')'+
                        '   AND (IDPROCXART  = '+FloatToStr(_Cds.FieldByName('IDPROCXART').AsFloat)+')';
                 If Not ExecSQL( SQL ) Then
                    Raise Exception.Create( MessageInfo );

                 _Cds.Next;
              End;

           // Processo
           Result := ApplyCds(FcdsProcesso,_DbProcesso,[],[] );
           If Not Result Then Raise Exception.Create( _DbProcesso.MessageInfo );

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

function TCtrlProcessoCompra.GetCotacao(CodProcesso: Double): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT IDPROCXART, IDFORCLI, CODPROCESSO, PROPOSTA, QTDEFORNECIDA, '+
          '        CODMEDIDA, STATUS '+
          ' FROM COTACOES '+
          ' WHERE (CODPROCESSO = '+FloatToStr(CodProcesso) +' ) ';

   Result := GetDataPacket(SQL);
end;

function TCtrlProcessoCompra.GetFornecedoresCotacao( CodProcesso, IdProcxArt : Double; CodArtigo : String ): OleVariant;
Var
   SQL     : TStringList;
   cdsAux  : TClientDataSet;
begin
   SQL    := TStringList.Create;
   cdsAux := TClientDataSet.Create(nil);
   Try
      SQL.Clear;
      SQL.Append(' SELECT                   ');
      SQL.Append('      C.IDFORCLI,         ');
      SQL.Append('      C.IDPROCXART,       ');
      SQL.Append('      C.CODPROCESSO,      ');
      SQL.Append('      PXA.CODARTIGO,      ');
      SQL.Append('      C.PROPOSTA,         ');
      SQL.Append('      C.QTDEFORNECIDA,    ');
      SQL.Append('      C.CODMEDIDA,        ');
      SQL.Append('      P.RAZAOSOCIAL,      ');
      SQL.Append('      (''S'') AS STATUS   ');
      SQL.Append(' FROM                     ');
      SQL.Append('     PESSOA P,            ');
      SQL.Append('     COTACOES C,          ');
      SQL.Append('     PROCXART PXA         ');
      SQL.Append(' WHERE                    ');
      SQL.Append('       (C.CODPROCESSO = '+FloatToStr(CodProcesso)+') ');
      SQL.Append('   AND (C.IDPROCXART = '+FloatToStr(IdProcxArt)+') ');
      SQL.Append('   AND (C.IDPROCXART = PXA.IDPROCXART)   ');
      SQL.Append('   AND (C.CODPROCESSO = PXA.CODPROCESSO) ');
      SQL.Append('   AND (C.IDFORCLI = P.IDPESSOA)         ');

      _cds.Data := GetDataPacket( SQL.Text );

      SQL.Clear;
      SQL.Append(' SELECT                         ');
      SQL.Append('        AXF.IDFORCLI,           ');
      SQL.Append('        (0) AS IDPROCXART,      ');
      SQL.Append('        (0) AS CODPROCESSO,     ');
      SQL.Append('        AXF.CODARTIGO,          ');
      SQL.Append('        (1) AS PROPOSTA,        ');
      SQL.Append('        (0) AS QTDEFORNECIDA,   ');
      SQL.Append('        P.RAZAOSOCIAL,          ');
      If _cds.IsEmpty Then
          SQL.Append('        (''S'') AS STATUS  ')
      Else
          SQL.Append('        (''N'') AS STATUS  ');
      SQL.Append(' FROM                           ');
      SQL.Append('        PESSOA P,               ');
      SQL.Append('        ARTXFORN AXF            ');
      SQL.Append(' WHERE                          ');
      SQL.Append('        (AXF.CODARTIGO = '+QuotedStr(Copy(CodArtigo+'                   ',1,14))+') ');
      SQL.Append('    AND (AXF.IDFORCLI = P.IDPESSOA)   ');
      SQL.Append(' ORDER BY P.RAZAOSOCIAL  ');

      cdsAux.Data := GetDataPacket( SQL.Text );

      cdsAux.First;
      While Not cdsAux.Eof Do
        Begin
           //# Colocar o teste de restrição do fornecedor
           If Not _cds.Locate('IDFORCLI',cdsAux.FieldByName('IDFORCLI').asFloat,[]) Then
              Begin
                 _cds.Append;
                 _cds.FieldByName('IDFORCLI').asFloat      := cdsAux.FieldByName('IDFORCLI').asFloat;
                 _cds.FieldByName('IDPROCXART').asFloat    := cdsAux.FieldByName('IDPROCXART').asFloat;
                 _cds.FieldByName('CODPROCESSO').asFloat   := cdsAux.FieldByName('CODPROCESSO').asFloat;
                 _cds.FieldByName('CODARTIGO').asString    := cdsAux.FieldByName('CODARTIGO').asString;
                 _cds.FieldByName('PROPOSTA').asInteger    := cdsAux.FieldByName('PROPOSTA').asInteger;
                 _cds.FieldByName('QTDEFORNECIDA').asFloat := cdsAux.FieldByName('QTDEFORNECIDA').asFloat;
                 _cds.FieldByName('RAZAOSOCIAL').asString  := cdsAux.FieldByName('RAZAOSOCIAL').asString;
                 _cds.FieldByName('STATUS').asString       := cdsAux.FieldByName('STATUS').asString;
                 _cds.Post;
              End;
           cdsAux.Next;
        End;

      Result := _cds.Data;
   Finally
      SQL.Free;
      cdsAux.Free;
   End;
end;

function TCtrlProcessoCompra.GetItensAtribuidos( CodProcesso: Double): OleVariant;
Var
   SQL : String;
begin
   If CodProcesso = 0 Then
      CodProcesso := -1;

   SQL := ' SELECT                '+
          '      IT.NUMSOLCOMPRA, '+
          '      IT.CODARTIGO,    '+
          '      IT.CODMEDIDA,    '+
          '      IT.QTDEPEDIDA,   '+
          '      SUBSTR(DECODE(IT.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI),1,60) AS DESCRICAO,'+
          '      IT.IDITEMSOLI,   '+

          '      P.CODGRUPOPROD,  '+

          '      SC.DATAENTREGA,  '+
          '      IT.CODPROCESSO,  '+
          '      P.CODMEDCUSTO,   '+
          '      IT.IDPROCXART,   '+

          '      (C.CUSTOMEDIO*CF.FATOR/CO.FATOR) AS VALORUNIT,                  '+
          '      (C.CUSTOMEDIO*CF.FATOR/CO.FATOR) * IT.QTDEPEDIDA AS VALORTOTAL, '+

          '      IT.IDPRODVARI    '+
          ' FROM                  '+
          '      ITEMSOLI IT,     '+
          '      SOLICOMP SC,     '+
          '      PRODUTO P,       '+
          '      ARTIGO A,        '+

          '      CUSTOMED C,      '+
          '      CONVER CO,       '+
          '      CONVER CF,       '+

          '      PRODVARI PV      '+
          ' WHERE                 '+
          '       (IT.CODPROCESSO = '+FloatToStr(CodProcesso)+') '+
          '   AND (IT.NUMSOLCOMPRA = SC.NUMSOLCOMPRA) '+
          '   AND (IT.CODARTIGO = A.CODARTIGO)        '+

          '   AND (A.CODARTIGO      = C.CODARTIGO(+)) '+
          '   AND (P.CODPRODUTO     = CO.CODPRODUTO)  '+
          '   AND (P.CODMEDCUSTO    = CO.CODMEDIDA)   '+
          '   AND (P.CODPRODUTO     = CF.CODPRODUTO)  '+
          '   AND (IT.CODMEDIDA     = CF.CODMEDIDA)   '+

          '   AND (A.CODPRODUTO = P.CODPRODUTO)       '+
          '   AND (IT.IDPRODVARI = PV.IDPRODVARI(+))  '+
          ' ORDER BY DESCRICAO, SC.DATAENTREGA        ';

   Result := GetDataPacket(SQL);

end;

function TCtrlProcessoCompra.GetNovoFornecedor: OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT CODARTIGO,'+
          '       IDFORCLI, '+
          '       (0)     AS IDPROCXART,  '+
          '       (''                                                            '') AS RAZAOSOLCIAL,'+
          '       (''                                                            '') AS DESCRICAO,   '+
          '       (0)     AS QTDE,        '+
          '       (''       '') AS UNIDADE,     '+
          '       (''N'') AS ATRIBUIDO    '+
          ' FROM ARTXFORN WHERE (1=2) ';

   Result := GetDataPacket(SQL);
end;

function TCtrlProcessoCompra.Gravar( IdPessoa,IdUsuario : Double ): Boolean;
Var
   Msg        : String;
   CodArtigo  : String;
   SQL        : String;
   IdProdVari : Integer;
   bAchou     : Boolean;
   bmMarca    : TbookMark;
   i : integer;
   fMaior : extended;
   sGrupoProd, sGrupo, sAux : string;
   bEnc : boolean;
Begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarProcessoCompra (IdPessoa,IdUsuario, FcdsProcesso.Data, FcdsItemSoli.Data, FcdsCotacao.Data, FcdsNovoForn.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           If FcdsItemSoli.IsEmpty Then
              Raise Exception.Create( MSG_NAO_ITENS_SELECT );

           //Processo
           Result := ApplyCds(FcdsProcesso,_DbProcesso,[],[] );
           Msg    := _DbProcesso.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           sGrupoProd := '';
           SetLength( aGrupos, 0 );
           FcdsItemSoli.First;
           while not FcdsItemSoli.Eof do
           begin
             sAux := Modulo.LeGrupoProd( FcdsItemSoli.FieldByName('CODARTIGO').AsString );
             bEnc := False;
             for i := 0 to High( aGrupos ) do
             begin
               if aGrupos[i].sGrupo = sAux then
               begin
                 aGrupos[i].fValor := aGrupos[i].fValor + FcdsItemSoli.FieldByName('VALORTOTAL').AsFloat;
                 bEnc := True;
                 break;
               end;
             end;
             if not bEnc then
             begin
               SetLength( aGrupos, length( aGrupos ) + 1 );
               aGrupos[High(aGrupos)].sGrupo := sAux;
               aGrupos[High(aGrupos)].fValor := FcdsItemSoli.FieldByName('VALORTOTAL').AsFloat;
             end;
             FcdsItemSoli.Next;
           end;
           fMaior := aGrupos[0].fValor;
           sGrupo := aGrupos[0].sGrupo;
           for i := 0 to High( aGrupos ) do
           begin
             if aGrupos[i].fValor > fMaior then
             begin
               fMaior := aGrupos[i].fValor;
               sGrupo := aGrupos[i].sGrupo;
             end;
           end;
           sGrupoProd := sGrupo;

           //---------------------------------------------------------------------------------------------------
           //Gera Processo de autorisação no R.A.D.
           //---------------------------------------------------------------------------------------------------
            IF Not GravaRAD(IdPessoa,_DbProcesso.CodProcesso.AsFloat,IdUsuario,sGrupoProd) Then
               Raise Exception.Create(MessageInfo);

           //---------------------------------------------------------------------------------------------------
           //Cria tabela temporária para  processar Procxart
           //---------------------------------------------------------------------------------------------------
           SQL := 'SELECT  CODPROCESSO, IDPROCXART, CODARTIGO, IDPRODVARI, QTDEPEDIDA, CODMEDIDA,DATANECESSIDADE FROM PROCXART WHERE (1=2) ';
           _cds.Data := GetDataPacket(SQL);

           //itemSoli
           FcdsItemSoli.First;
           While Not FcdsItemSoli.Eof Do
              Begin
                 //Verifica se o item esta atribuido a cotação (PROCXART)
                 If FcdsItemSoli.FieldByName('IDPROCXART').AsFloat < 0 Then
                    Begin
                       //Processando ProcxArt
                       //Verifica se é o mesmo item para poder juntar as Quantidades
                       IdProdVari := FcdsItemSoli.FieldByName('IDPRODVARI').AsInteger;
                       CodArtigo  := FcdsItemSoli.FieldByName('CODARTIGO').AsString;

                       If IdProdVari > 0   Then
                          bAchou := _cds.Locate('CODARTIGO;IDPRODVARI',VarArrayOf([codArtigo,IdProdVari]),[])
                       Else
                          bAchou := _cds.Locate('CODARTIGO',codArtigo,[]);

                       If Not bAchou Then
                          Begin
                             _cds.Append;
                             _cds.FieldbyName('CODPROCESSO').AsFloat        := _DbProcesso.CodProcesso.AsFloat;
                             _cds.FieldbyName('CODARTIGO').AsString         := FcdsItemSoli.FieldByName('CODARTIGO').AsString;
                             _cds.FieldbyName('IDPRODVARI').AsInteger       := FcdsItemSoli.FieldByName('IDPRODVARI').AsInteger;
                             _cds.FieldbyName('QTDEPEDIDA').AsFloat         := _UnMedida.QtdeToUnCustoMedio(FcdsItemSoli.FieldByName('CODARTIGO').AsString,FcdsItemSoli.FieldByName('CODMEDIDA').AsString,FcdsItemSoli.FieldByName('QTDEPEDIDA').AsFloat );
                             _cds.FieldbyName('CODMEDIDA').AsString         := FcdsItemSoli.FieldByName('CODMEDCUSTO').AsString;
                             _cds.FieldbyName('DATANECESSIDADE').AsDateTime := FcdsItemSoli.FieldByName('DATAENTREGA').AsDateTime;
                             _cds.FieldbyName('IDPROCXART').AsFloat         := FcdsItemSoli.FieldByName('IDPROCXART').AsFloat;
                             _cds.Post;
                          End
                       Else
                          Begin
                              If Not _cds.IsEmpty Then
                                 Begin
                                    _cds.Edit;
                                    _cds.FieldbyName('QTDEPEDIDA').AsFloat := _cds.FieldbyName('QTDEPEDIDA').AsFloat + _UnMedida.QtdeToUnCustoMedio(FcdsItemSoli.FieldByName('CODARTIGO').AsString,FcdsItemSoli.FieldByName('CODMEDIDA').AsString,FcdsItemSoli.FieldByName('QTDEPEDIDA').AsFloat );

                                    If FcdsItemSoli.FieldByName('DATAENTREGA').AsDateTime <  _cds.FieldbyName('DATANECESSIDADE').AsDateTime Then
                                       _cds.FieldbyName('DATANECESSIDADE').AsDateTime := FcdsItemSoli.FieldByName('DATAENTREGA').AsDateTime;
                                    _cds.Post;

                                    // Para juntar os itens na Solicitação
                                    FcdsItemSoli.Edit;
                                    FcdsItemSoli.FieldByName('IDPROCXART').AsFloat := _cds.FieldByName('IDPROCXART').AsFloat;
                                    FcdsItemSoli.Post;

                                 End;
                          End;
                       //
                    End;
                 FcdsItemSoli.Next;
              End;
           // Verifica se foi adicionado um novo produto na lista do processo
           _cds.First;
           While Not _cds.Eof Do
              Begin
                 // Grava ProcxArt
                 _DBProcxArt.CodProcesso.AsFloat        := _DbProcesso.CodProcesso.AsFloat;
                 _DBProcxArt.CodArtigo.AsString         := _cds.FieldByName('CODARTIGO').AsString;
                 _DBProcxArt.IdprodVari.AsInteger       := _cds.FieldByName('IDPRODVARI').AsInteger;
                 _DBProcxArt.QtdePedida.AsFloat         := _cds.FieldByName('QTDEPEDIDA').AsFloat;
                 _DBProcxArt.CodMedida.AsString         := _cds.FieldByName('CODMEDIDA').AsString;
                 _DBProcxArt.DataNecessidade.AsDateTime := _cds.FieldByName('DATANECESSIDADE').AsDateTime;
                 Result := _DBProcxArt.Insert;
                 Msg    := _DBProcxArt.MessageInfo;
                 If Not Result Then Raise Exception.Create(Msg);
                //--------------------------------------------------------------------------------------
                // Grava Cotação DOS ITENS INSERIDORS
                //--------------------------------------------------------------------------------------
                 //Filtra os fornecedores daquele item
                 FcdsCotacao.StatusFilter := [usInserted];
                 Try
                     FcdsCotacao.Filtered := False;
                     FcdsCotacao.Filter   := 'IDPROCXART = '+_cds.FieldByName('IDPROCXART').asString;
                     FcdsCotacao.Filtered := True;
                     FcdsCotacao.First;
                     While Not FcdsCotacao.Eof Do
                        Begin
                           If FcdsCotacao.FieldByName('STATUS').AsString = 'S' Then
                              Begin
                                 _DbCotacoes.CodProcesso.AsFloat   := _DbProcesso.CodProcesso.AsFloat;
                                 _DbCotacoes.IdProcxArt.AsFloat    := _DBProcxArt.IdProcxArt.AsFloat;
                                 _DbCotacoes.IdForCli.AsFloat      := FcdsCotacao.FieldByName('IDFORCLI').asFloat;
                                 _DbCotacoes.Proposta.AsInteger    := 1;
                                 _DbCotacoes.QtdeFornecida.AsFloat := _DBProcxArt.QtdePedida.AsFloat;
                                 _DbCotacoes.CodMedida.AsString    := _DBProcxArt.CodMedida.AsString;
                                 Result := _DbCotacoes.Insert;
                                 Msg    := _DbCotacoes.MessageInfo;
                                 If Not Result Then Raise Exception.Create(Msg);
                              End;
                           FcdsCotacao.Delete;
                        End;
                 Finally
                    FcdsCotacao.StatusFilter := [];
                 End;
                //--------------------------------------------------------------------------------------
                // Associa o item de cotacao ao procxArt
                //--------------------------------------------------------------------------------------
                 FcdsItemSoli.First;
                 While Not FcdsItemSoli.Eof Do
                    Begin
                       If FcdsItemSoli.FieldByName('IDPROCXART').AsFloat = _cds.FieldByName('IDPROCXART').AsFloat Then
                          Begin
                             FcdsItemSoli.Edit;
                             FcdsItemSoli.FieldByName('CODPROCESSO').AsFloat := _DbProcesso.CodProcesso.AsFloat;
                             FcdsItemSoli.FieldByName('IDPROCXART').AsFloat  := _DbProcxArt.IdProcxArt.AsFloat;
                             FcdsItemSoli.Post;
                          End;
                       FcdsItemSoli.Next;
                    End;
                //--------------------------------------------------------------------------------------
                 _cds.Next;
              End;
          //--------------------------------------------------------------------------------------
          // Grava Cotação DOS ITENS ALTERADOS
          //--------------------------------------------------------------------------------------
          Try
              FcdsCotacao.StatusFilter := [usInserted];
              FcdsCotacao.First;
              While Not FcdsCotacao.Eof Do
                 Begin
                    If (FcdsCotacao.FieldByName('CODPROCESSO').AsFloat <= 0 ) And (FcdsCotacao.FieldByName('STATUS').AsString = 'S') Then
                       Begin
                          _DBProcxArt.CodProcesso.AsFloat := FcdsItemSoli.FieldByName('CODPROCESSO').AsFloat;
                          _DBProcxArt.IdProcxArt.AsFloat  := FcdsCotacao.FieldByName('IDPROCXART').AsFloat;
                          _DBProcxArt.LoadFromDb;

                          _DbCotacoes.CodProcesso.AsFloat   := _DBProcxArt.CodProcesso.AsFloat;
                          _DbCotacoes.IdProcxArt.AsFloat    := _DBProcxArt.IdProcxArt.AsFloat;
                          _DbCotacoes.IdForCli.AsFloat      := FcdsCotacao.FieldByName('IDFORCLI').asFloat;
                          _DbCotacoes.Proposta.AsInteger    := 1;
                          _DbCotacoes.QtdeFornecida.AsFloat := _DBProcxArt.QtdePedida.AsFloat;
                          _DbCotacoes.CodMedida.AsString    := _DBProcxArt.CodMedida.AsString;
                          Result := _DbCotacoes.Insert;
                          Msg    := _DbCotacoes.MessageInfo;
                          If Not Result Then Raise
                             Exception.Create(Msg);
                             
                          //Não é possível editar um registro com o StausFilter alterado. Para
                          //efetivação de tal procedimento, após a localização do artigo a ser
                          //alterado, foi ponterado o BookMark do mesmo, retirado o StatusFilter,
                          //efetuada a alteração, adicionado novamente o StatusFilter e em seguida
                          //ponterado o registro pelo BookMark para garantir o posicionamento do
                          //Cds no While.

                          bmMarca := FcdsCotacao.GetBookmark;
                          FcdsCotacao.StatusFilter := [];
                          FcdsCotacao.GotoBookmark(bmMarca);

                          FcdsCotacao.Edit;
                          FcdsCotacao.FieldByName('CODPROCESSO').AsFloat := _DBProcxArt.CodProcesso.AsFloat;
                          FcdsCotacao.Post;

                          FcdsCotacao.StatusFilter := [usInserted];
                          FcdsCotacao.GotoBookmark(bmMarca);
                          FcdsCotacao.FreeBookmark(bmMarca);

                       End;
                    FcdsCotacao.Next;
                 End;
           Finally
               FcdsCotacao.StatusFilter := [];
           End;
           Try
              FcdsCotacao.StatusFilter := [usModified];
              FcdsCotacao.First;
              While Not FcdsCotacao.Eof Do
                 Begin
                    If (FcdsCotacao.FieldByName('CODPROCESSO').AsFloat < 0 ) And (FcdsCotacao.FieldByName('STATUS').AsString = 'S') Then
                       Begin
                          // Busca os dados para o novo fornecedor
                          _DBProcxArt.CodProcesso.AsFloat := FcdsItemSoli.FieldByName('CODPROCESSO').AsFloat;
                          _DBProcxArt.IdProcxArt.AsFloat  := FcdsCotacao.FieldByName('IDPROCXART').AsFloat;
                          _DBProcxArt.LoadFromDb;

                          _DbCotacoes.CodProcesso.AsFloat   := _DBProcxArt.CodProcesso.AsFloat;
                          _DbCotacoes.IdProcxArt.AsFloat    := _DBProcxArt.IdProcxArt.AsFloat;
                          _DbCotacoes.IdForCli.AsFloat      := FcdsCotacao.FieldByName('IDFORCLI').asFloat;
                          _DbCotacoes.Proposta.AsInteger    := 1;
                          _DbCotacoes.QtdeFornecida.AsFloat := _DBProcxArt.QtdePedida.AsFloat;
                          _DbCotacoes.CodMedida.AsString    := _DBProcxArt.CodMedida.AsString;
                          Result := _DbCotacoes.Insert;
                          Msg    := _DbCotacoes.MessageInfo;
                          If Not Result Then Raise Exception.Create(Msg);
                       End
                    Else
                    If (FcdsCotacao.FieldByName('CODPROCESSO').AsFloat > 0 ) And (FcdsCotacao.FieldByName('STATUS').AsString = 'N') Then
                       Begin
                          If Not ExcluiDadosCotacao(FcdsCotacao.FieldByName('CODPROCESSO').AsFloat,
                                                    FcdsCotacao.FieldByName('IDPROCXART').AsFloat
                                                    FcdsCotacao.FieldByName('IDFORCLI').AsFloat)
                          Then
                             Raise Exception.Create( MessageInfo );
                       End;
                    FcdsCotacao.Next;
                 End;
           Finally
               FcdsCotacao.StatusFilter := [];
           End;
           //----------------------------------------------------------------------
           // Atualiza os itens da solicitação, marcando-os com
           // já em processo de compra
           //----------------------------------------------------------------------
           Try
              FcdsItemSoli.StatusFilter := [usModified];
              FcdsItemSoli.First;
              While Not FcdsItemSoli.Eof Do
                 Begin
                    SQL := ' UPDATE ITEMSOLI SET CODPROCESSO = '+FloatToStr(FcdsItemSoli.FieldByName('CODPROCESSO').AsFloat)+
                           '                    ,IDPROCXART  = '+FloatToStr(FcdsItemSoli.FieldByName('IDPROCXART').AsFloat)+
                           ' WHERE (IDITEMSOLI = '+FloatToStr(FcdsItemSoli.FieldByName('IDITEMSOLI').AsFloat)+' ) ';
                     If Not ExecSQL( SQL ) Then
                        Raise Exception.Create( MessageInfo );

                    FcdsItemSoli.Next;
                 End;
           Finally
               FcdsItemSoli.StatusFilter := [];
           End;
           //----------------------------------------------------------------------
           // Exclui os itens já em processo de compra
           //----------------------------------------------------------------------
           Try
              FcdsItemSoli.StatusFilter := [usDeleted];
              FcdsItemSoli.First;
              While Not FcdsItemSoli.Eof Do
                 Begin
                    //------------------------------------------------------------------------------
                    // Exclui cotação do Item
                    //------------------------------------------------------------------------------
                    If Not ExcluiDadosCotacao(FcdsItemSoli.FieldByName('CODPROCESSO').AsFloat,
                                              FcdsItemSoli.FieldByName('IDPROCXART').AsFloat)
                    Then
                       Raise Exception.Create( MessageInfo );
                    //------------------------------------------------------------------------------
                    // Retorna o item para pedente (não associado a nenhum processo de compra)
                    //------------------------------------------------------------------------------
                    SQL := ' UPDATE ITEMSOLI SET CODPROCESSO = NULL ,IDPROCXART  = NULL '+
                           ' WHERE (CODPROCESSO = '+FloatToStr(FcdsItemSoli.FieldByName('CODPROCESSO').AsFloat)+')'+
                           '   AND (IDPROCXART  = '+FloatToStr(FcdsItemSoli.FieldByName('IDPROCXART').AsFloat)+')';
                     If Not ExecSQL( SQL ) Then
                        Raise Exception.Create( MessageInfo );

                    Sql := ' DELETE FROM PROCXART '+
                           ' WHERE (CODPROCESSO = '+FloatToStr(FcdsItemSoli.FieldByName('CODPROCESSO').AsFloat)+')'+
                           '   AND (IDPROCXART  = '+FloatToStr(FcdsItemSoli.FieldByName('IDPROCXART').AsFloat)+')';
                    If Not ExecSQL( Sql ) Then
                       Raise Exception.Create( MessageInfo );

                    FcdsItemSoli.Next;
                 End;
           Finally
               FcdsItemSoli.StatusFilter := [];
           End;

           //----------------------------------------------------------------------
           // Adiciona na tabela ArtxForn caso tenha se adicionado um novo forncedor.
           // No próximo processo de compra ele já vem como default para o artigo
           //----------------------------------------------------------------------
            Result := ApplyCds(FcdsNovoForn,_DbArtxForn,[],[]);
            Msg    := _DbArtxForn.MessageInfo;
            If Not Result Then Raise Exception.Create(Msg);

           Commit;

           MessageInfo := _DbProcesso.CodProcesso.AsString;

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

function TCtrlProcessoCompra.GravaRAD( IdPessoa, CodProcesso,IdUsuario : Double; sGrupoProd : string ): Boolean;
Var
   IdProcesso : Double;
   SQL        : String;
begin
   Result := True;
   Try
     SQL := ' SELECT IDPROCESSO FROM PROCESSO '+
            ' WHERE  (CODPROCESSO = ' + FloatToStr(CodProcesso)+') ';

     _Cds.Data := GetDataPacket(SQL);

     if _Cds.FieldByName('IDPROCESSO').IsNull then
     begin
        
        if (Sistema.UsaRAD) then
        begin
          if (Sistema.VersaoRAD = '+') then
          begin
              RADPlus.InicializaPropriedades;
              RADPlus.IdEventoGerador  := 4;
              RADPlus.IdEmpresa        := Trunc(IdPessoa);
              RADPlus.IdUsuario        := Trunc(IdUsuario);
              RADPlus.CodGrupoProd     := sGrupoProd;
              RADPlus.OBS              := 'Cotação do Processo de Compra Nº '+ FloatToStr( CodProcesso );

              IdProcesso := RADPlus.IniciarProcesso;

              If IdProcesso = 0 Then
              begin
                 if ( radPlus.RecuperaTipoProcesso(4, sistema.IdEmpresa)  = 0 ) then
                      Result := true
                  else
                      Raise Exception.Create( RADPlus.MessageInfo );
              end;
          end
          else
          begin
            _RAD.TipoProcesso := _RAD.GetTipoProcesso( 4 , Trunc(IdPessoa) ); // É fixa a referência

            if _RAD.TipoProcesso > 0 then
            begin
              _RAD.IdPessoa        := Trunc(IdPessoa);
              _RAD.IdUsuario       := Trunc(IdUsuario);
              _RAD.OBS             := 'Cotação do Processo de Compra Nº '+ FloatToStr( CodProcesso );

              IdProcesso := _RAD.IniciarProcesso;

              if IdProcesso < 0 then
                 Raise Exception.Create( _RAD.MessageInfo );
            end;
          end;
        end;

        { Atualiza apenas caso tenha sido criado o processo RAD}
        if IdProcesso > 0 then
        begin
          SQL := ' UPDATE PROCESSO SET IDPROCESSO = '+FloatToStr(IdProcesso)+
                 ' WHERE  (CODPROCESSO = '+FloatToStr(CodProcesso)+') ';

          If Not ExecSQL( SQL ,True ) Then
            Raise Exception.Create( MessageInfo );
        end;
     end;
   Except
      On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
   End;

end;

procedure TCtrlProcessoCompra.OnApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; var Accept: Boolean);

begin

end;

procedure TCtrlProcessoCompra.OnCreateAppServer;
begin
  inherited;
  FcdsItemSoli := TClientDataSet.Create(nil);
  FcdsProcesso := TClientDataSet.Create(nil);
  FcdsCotacao  := TClientDataSet.Create(nil);
  FcdsNovoForn := TClientDataSet.Create(nil);
end;

Function TCtrlProcessoCompra.Procurar( CodProcesso : Double ) : OleVariant;
Begin
   _DbProcesso.CodProcesso.AsFloat := CodProcesso;

   Result := GetDataPacket( _DbProcesso.SSqlSelect );
end;

procedure TCtrlProcessoCompra.SetcdsCotacao(const Value: TClientDataSet);
begin
  FcdsCotacao := Value;
end;

procedure TCtrlProcessoCompra.SetcdsItemSoli(const Value: TClientDataSet);
begin
  FcdsItemSoli := Value;
end;

procedure TCtrlProcessoCompra.SetcdsNovoForn(const Value: TClientDataSet);
begin
  FcdsNovoForn := Value;
end;

procedure TCtrlProcessoCompra.SetcdsProcesso(const Value: TClientDataSet);
begin
  FcdsProcesso := Value;
end;

function TCtrlProcessoCompra.StatusProcesso(CodProcesso: Double): string;
// Função que retorna o STATUS do PROCESSO
var
  CdsAux: TClientDataSet;
  sSql : string;

begin
  try
    CdsAux := TClientDataSet.Create(nil);

    sSql := 'SELECT STATUS ' +
            '  FROM PROCESSO ' +
            ' WHERE CODPROCESSO = ' + FloatToStr(CodProcesso);

    CdsAux.Data := GetDataPacket(sSql);
  finally
    FreeAndNil(CdsAux);
  end;
end;

end.



