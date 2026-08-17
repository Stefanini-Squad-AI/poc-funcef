{---------------------------------------------------------------------------------
 Data       : 12.07.2006
 Autor      : Antonio Marcos Fernandes de Souza (amf)
 Pendências : 21380
 Descrição  : Corrigido o problema da exclusão do insumo.
---------------------------------------------------------------------------------
 Data       : 28/01/2005
 Autor      : André Tavares
 Pendências : 18602
 Descrição  :
---------------------------------------------------------------------------------
 Data       : 28/01/2005
 Autor      : Marchetti
 Pendências : 17949
 Descrição  : Inclusão de saldo quando insere produto novo
---------------------------------------------------------------------------------}

unit uCtrlArtigo;

interface

Uses DB, uDataBase,Classes, uCmControlObject, dbclient,uCmDbObject,
     sysUtils, uSistema,uDbProduto,uDbArtigo,uDbConver,uDbImpostos,
     uDbArtxContaxCC,Dialogs, uMidasUtil, uCmTypes,
     uCtrlImplantaSaldo;
Const
    MSG_UNID_JA_SCI      = ' Proibido apagar conversão. Esta unidade já foi usada em uma Solicitação de Compra';
    MSG_UNID_JA_FICHATEC = ' Proibido apagar conversão. Esta unidade já foi usada em uma Ficha Técnica';
Type

  TTipoArtigo = (taItemPDV,taMolhAcom,taInsumo,taOutros,taItemVenda, TaVazio);

  TTipoBloqueio =(tbTodos,tbCompra,tbRequisicao,tbAmbos);

  TCtrlArtigo = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
     procedure AfterInitialize; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbProduto       : TDbProduto;
    _DbArtigo        : TDbArtigo;
    _DbConver        : TDbConver;
    _DbImpostos      : TDbImpostos;
    _DbArtxContaxCC  : TDbArtxContaxCC;
    //-------------------------------------------------------------------------
    // ClientDataSet´s de ligação com a tela
    //-------------------------------------------------------------------------
    FcdsArtigo       : TClientDataSet;
    FcdsArtxContaxCC : TClientDataSet;
    FcdsConver       : TClientDataSet;
    FcdsProduto      : TClientDataSet;
    FcdsImpostos     : TClientDataSet;
    FcdsCorTamanho   : TClientDataSet;
    FcdsAtuUltCompra: TClientDataSet;

    FPessoa          : Int64;
    FCodCusteio      : Integer;
    FCodAlmoxa       : Integer;
    FCustoAlmoxa     : String;
    //

    CtrlImplantaSaldo : TCtrlImplantaSaldo;
    FCodArtigo: String;

    procedure SetcdsArtigo(const Value: TClientDataSet);
    procedure SetcdsArtxContaxCC(const Value: TClientDataSet);
    procedure SetcdsConver(const Value: TClientDataSet);
    procedure SetcdsProduto(const Value: TClientDataSet);
    procedure SetcdsImpostos(const Value: TClientDataSet);
    procedure SetcdsCorTamanho(const Value: TClientDataSet);
    procedure SetcdsAtuUltCompra(const Value: TClientDataSet);
    {**
       Verifica se pode excluir determinada unidade de medida, verificando
       se esta já foi usada em uma SCI
    **}
    Function ExisteUnidadeSCI( CodArtigo : String ) : Boolean;
    {**
       Verifica se pode excluir determinada unidade de medida, verificando
       se esta já foi usada em uma Ficha técnica
    **}
    Function ExisteUnidadeFichaTec( CodArtigo : String ) : Boolean;
    procedure SetCodArtigo(const Value: String);

  Public
     Property cdsProduto      : TClientDataSet read FcdsProduto write SetcdsProduto;
     Property cdsArtigo       : TClientDataSet read FcdsArtigo write SetcdsArtigo;
     Property cdsConver       : TClientDataSet read FcdsConver write SetcdsConver;
     Property cdsImpostos     : TClientDataSet read FcdsImpostos write SetcdsImpostos;
     Property cdsArtxContaxCC : TClientDataSet read FcdsArtxContaxCC write SetcdsArtxContaxCC;
     Property cdsCorTamanho   : TClientDataSet read FcdsCorTamanho write SetcdsCorTamanho;
     Property cdsAtuUltCompra : TClientDataSet read FcdsAtuUltCompra write SetcdsAtuUltCompra;


     Property Pessoa           : Int64         read FPessoa      write FPessoa;
     Property CodCusteio       : Integer       read FCodCusteio  write FCodCusteio;
     Property CodAlmoxa        : Integer       read FCodAlmoxa   write FCodAlmoxa;
     Property CustoAlmoxa      : String        read FCustoAlmoxa write FCustoAlmoxa;

     Property CodArtigo        : String read FCodArtigo write SetCodArtigo;

     //-------------------------------------------------------------------------
     // Métodos
     //-------------------------------------------------------------------------
     constructor Create;  Override;
     Destructor  Destroy; Override;
     //-------------------------------------------------------------------------
     // Metodos de Presistencia
     //-------------------------------------------------------------------------
     Function Gravar( Tipo : TTipoArtigo ) : Boolean;
     Function Excluir : Boolean;
     Function GravarOutros : Boolean; Virtual;
     Function ExcluirOutros : Boolean; Virtual;
     //-------------------------------------------------------------------------
     // Metodos de Regra de negócio
     //-------------------------------------------------------------------------

     function ListContabArtigo(IdPessoa : Integer; CodArtigo, CodGrupo: string) : OleVariant;
    {**
       Procura o Artigo
    **}
     Function GetArtigo( CodArtigo : String ) : OleVariant;
    {**
       Pega a conversão do Artigo
    **}
     Function GetConver( CodArtigo : String ) : OleVariant;
    {**
       Pega a conversão do Artigo
    **}
     Function GetImposto( CodArtigo : String; IdPessoa : Integer) : OleVariant;
    {**
       Busca a contabilização do Artigo sé por tipo ou por grupo
    **}
     Function GetContabilizacao( IdPessoa : Integer; CodArtigo,CodGrupo : String ) : OleVariant;
    {**
       Busca a Cor e Tamanho do Produto
    **}
     Function GetCorTamanho( CodProduto : String ) : OleVariant;
    {**
       Verifica se o código do artigo já existe
    **}
     Function  JaExisteProduto( CodProduto : String ) : Boolean;
    {**
       Verifica se o Artigo possui a unidade de medida
    **}
     Function  ExisteMedida( CodMedida : String ) :  Boolean;
    {**
       Verifica se o Artigo possui movimentação
    **}
     Function  ExisteMovimentacao( CodArtigo : String ) : Boolean;
    {**
       Verifica qual o último Artigo a ser cadastrado
    **}
     Function  UltArtigoCadastrado( Tipo : Integer ) : String;
    {**
       Gera uma lista de Artigo existentes
    **}
     Function  ListArtigo( TipoArtigo   : TTipoArtigo = taVazio;
                           SoAtivo      : Boolean = True;
                           CodGrupoProd : String = '';
                           TipoBloqueio : TTipoBloqueio = tbTodos) : OleVariant;
    {**
       Gera uma lista de Artigo disponível para aquele usuário
    **}
     Function  ListArtigoxUsuario(SoAtivo   : Boolean = True;
                                  IdPessoa  : Integer = 0;
                                  IdUsuario : Integer = 0 ) : OleVariant;
    {**
       Lista as Ultimas Compras feitas do artigo
     **}
     Function  ListUltCompra( CodArtigo : String ) : OleVariant;
     {**
       Pega o custo médio do artigo pela unidade de custeio
     **}
     Function  GetCustoMedio(CodArtigo : String; CodCusteio : Integer ) : Double;
     {**
        Pega os dados do artigo pelo código de barrar
     **}
     Function GetArtigoForBarra( CodBarra : String ) : OleVariant;
     {**
        Atualiza os valores de úrtima compra dos produtos
     **}
     Function AtualizaValUltCompra : Boolean;
     {**
        Fornece uma lista com o saldo em estoque do prouto em em todos
        os almoxarifados de uma empresa.
     **}
     Function  ListSaldoProduto( IdPessoa  : Integer;
                                 CodArtigo : String ) : OleVariant;
    {**
       Lista as Ultimas Compras feitas do artigo
     **}
     Function  GetUltCompra( IdPessoa  : Integer;
                             CodArtigo : String ) : OleVariant;
    {**
       Fornece o consumo médio do período por dia
    **}
     Function ListConsMedioDia( IdPessoa  : Integer;
                                CodArtigo : String;
                                Dia       : Integer;
                                DataIni   : TDateTime;
                                DataFim   : TDateTime ) : OleVariant;
    {**
       Fornece o consumo médio total no périodo
    **}
     Function ListConsMedioTotal( IdPessoa  : Integer;
                                  CodArtigo : String;
                                  DataIni   : TDateTime;
                                  DataFim   : TDateTime ) : OleVariant;
     {**
        Pega a localização do artigo no almoxarifado
     **}
     Function GetLocalizacao( CodAlmoxarifado : Integer;
                              CodArtigo       : String ) : String;
     {**
        Pega a Unidade de Custo Médio do Artigo
     **}
     Function GetCodMedCusto( CodArtigo : String ) : String;
     {**
        Pega o Ultimo artigo cadastrado deacordo com seu tipo
     **}
     Function GetUltArtigoCad( Tipo : TTipoArtigo ) : String;
     {**
        Verifica se o Produto Controla Validade
     **}
     Function ControloValidade( CodArtigo : String ) : Boolean;
     {**
        Pega o ID do grupo do Bem correspondente ao grupo de Produto
     **}
     Function GetGrupoBem( CodArtigo : String ) : Double;
  End;

implementation

{ TCtrlArtigo }

procedure TCtrlArtigo.AfterInitialize;
begin
  inherited;
  CtrlImplantaSaldo := TCtrlImplantaSaldo.Create;
  CtrlImplantaSaldo.InitializeAs(Self);
end;



function TCtrlArtigo.Gravar( Tipo : TTipoArtigo ): Boolean;
Var
   Msg       : String;
   SQL       : String;
   sCodChave : String;
   Estado    : TDataSetState;
   sProduto  : String;
   sCodCusto : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarArtigo(Tipo,
                                                 FcdsArtigo.Data,
                                                 FcdsArtxContaxCC.Data,
                                                 FcdsConver.Data,
                                                 FcdsImpostos.Data,
                                                 FcdsProduto.Data,
                                                 FcdsCorTamanho.Data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           Estado := FcdsProduto.State;

           StartTransaction;

           sProduto  := FCdsProduto.FieldByName('CODARTIGO').AsString;
           sCodCusto := FCdsProduto.FieldByName('CODMEDCUSTO').AsString;

         //-- Grava Tabela PRODUTO --------------------------------------------------------------------------------
           Result := ApplyCds(FcdsProduto,_DbProduto,[],[]);
           Msg    := _DbProduto.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);
         //-- Grava Tabela ARTIGO --------------------------------------------------------------------------------
           FcdsArtigo.Edit;
           FcdsArtigo.FieldByName('CODTIPOARTIGO').AsString := IntToStr(Integer(Tipo));
           FcdsArtigo.Post;
           Result := ApplyCds(FcdsArtigo,_DbArtigo,[],[]);
           Msg    := _DbArtigo.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);
         //-- Grava Tabela CONVER --------------------------------------------------------------------------------
           FcdsConver.First;
           While Not FcdsConver.Eof Do
              Begin
                 FcdsConver.Edit;
                 FcdsConver.FieldByName('CODPRODUTO').AsString := Trim(_DbArtigo.CodProduto.AsString);
                 FcdsConver.Post;
                 FcdsConver.Next;
              End;
           Result := ApplyCds(FcdsConver,_DbConver,[],[]);
           Msg    := _DbConver.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);
         //---------------------------------------------------------------------------------------------------------
         // Verifica da Exclusão de Unidade de Medida
         //---------------------------------------------------------------------------------------------------------
           If ExisteUnidadeSCI(FcdsArtigo.FieldByName('CODARTIGO').AsString) Then
              Raise Exception.Create( MSG_UNID_JA_SCI );

           If ExisteUnidadeFichaTec(FcdsArtigo.FieldByName('CODARTIGO').AsString) Then
              Raise Exception.Create( MSG_UNID_JA_FICHATEC );

         //-- Grava Tabela IMPOSTOS --------------------------------------------------------------------------------
           Result := ApplyCds(FcdsImpostos,_DbImpostos,[],[]);
           Msg    := _DbImpostos.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);
         //-- Grava Tabela ARTXCONTAXCC --------------------------------------------------------------------------------
           //---------------------------------------------------------------------------------------------
           // Exclui a contabilização por artigo caso aja
           //---------------------------------------------------------------------------------------------
           sCodChave := Copy(FcdsArtxContaxCC.FieldByName('CODARTIGO').AsString + '                 ',1,14);

           if trim(sCodChave) = '' then
             sCodChave := Copy(FCodArtigo + '                 ',1,14);

           SQL := 'DELETE FROM ARTXCONTAXCC '+
                  ' WHERE (CODARTIGO = '+QuotedStr(sCodChave)+')'+
                  '   AND (IDPESSOA = '+IntToStr(FcdsArtxContaxCC.FieldByName('IDPESSOA').AsInteger)+')';

           IF Not ExecSQL(SQL) Then
              Raise Exception.Create( MessageInfo );
           //---------------------------------------------------------------------------------------------
           // Exclui a contabilização por grupo caso aja
           //---------------------------------------------------------------------------------------------
           FcdsArtxContaxCC.First;
           repeat
             sCodChave := Copy(FcdsArtxContaxCC.FieldByName('CODGRUPOPROD').AsString + '                 ',1,10);
             FcdsArtxContaxCC.next;
           until (trim(sCodChave) <> '') or (FcdsArtxContaxCC.eof);

           SQL := 'DELETE FROM ARTXCONTAXCC '+
                  ' WHERE (CODGRUPOPROD = '+QuotedStr(sCodChave)+')'+
                  '   AND (IDPESSOA = '+IntToStr(FcdsArtxContaxCC.FieldByName('IDPESSOA').AsInteger)+')';

           IF Not ExecSQL(SQL) Then
              Raise Exception.Create( MessageInfo );

           //---------------------------------------------------------------------------------------------
           // Efetua as gravaçõesa da contabilização
           //---------------------------------------------------------------------------------------------
           FcdsArtxContaxCC.First;
           While Not FcdsArtxContaxCC.Eof Do
              Begin

                 If Not FcdsArtxContaxCC.FieldByName('CODARTIGO').IsNull Then
                    Begin
                       CdsToDbObject(FcdsArtxContaxCC,_DbArtxContaxCC);
                       If Not _DbArtxContaxCC.Insert Then
                          Raise Exception.Create( _DbArtxContaxCC.MessageInfo );
                    End
                 Else
                 If Not FcdsArtxContaxCC.FieldByName('CODGRUPOPROD').IsNull Then
                    Begin
                       CdsToDbObject(FcdsArtxContaxCC,_DbArtxContaxCC);
                       If Not _DbArtxContaxCC.Insert Then
                          Raise Exception.Create( _DbArtxContaxCC.MessageInfo );
                    End;

                 FcdsArtxContaxCC.Next;
              End;

         //-- Grava Tabela Cor e Tamanho --------------------------------------------------------------------------------
           FcdsCorTamanho.First;
           While  Not FcdsCorTamanho.Eof Do
              Begin
                  FcdsCorTamanho.Edit;
                  FcdsCorTamanho.FieldByName('CODARTIGO').AsString := Trim(FcdsCorTamanho.FieldByName('CODPRODUTO').AsString) +
                                                                      Trim(FcdsCorTamanho.FieldByName('CODCOR').AsString) +
                                                                      Trim(FcdsCorTamanho.FieldByName('CODTAMANHO').AsString);
                  FcdsCorTamanho.Post;
                  FcdsCorTamanho.Next;
              End;
           Result := ApplyCds(FcdsCorTamanho,_DbArtigo,[],[]);
           Msg    := _DbArtigo.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // Para gravação dos filhos
           If Not GravarOutros Then
              Exception.Create(MessageInfo);

           Commit;

           if Estado = dsInsert then
           begin
              CtrlImplantaSaldo.implantarSaldo(FPessoa,
                                               0,
                                               0,
                                               FCodCusteio,
                                               FCodAlmoxa,
                                               sProduto,
                                               sCodCusto,
                                               FCustoAlmoxa,
                                               -1,
                                               0);
           end;

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

constructor TCtrlArtigo.Create;
begin
  inherited;
  //Classe de Presistencias
  _DbProduto       := TDbProduto.Create(Self);
  _DbArtigo        := TDbArtigo.Create(Self);
  _DbConver        := TDbConver.Create(Self);
  _DbImpostos      := TDbImpostos.Create(Self);
  _DbArtxContaxCC  := TDbArtxContaxCC.Create(Self);

End;

destructor TCtrlArtigo.Destroy;
begin
   CtrlImplantaSaldo.Free;
  _DbProduto.Free;
  _DbArtigo.Free;
  _DbConver.Free;
  _DbImpostos.Free;
  _DbArtxContaxCC.Free;

  //Client´s Dataset´s
  IF IsAppServer Then
     FreeCds([FcdsArtigo, FcdsArtxContaxCC,FcdsConver,
              FcdsImpostos, FcdsProduto,FcdsCorTamanho,FcdsAtuUltCompra]);

  inherited;
end;

procedure TCtrlArtigo.DoChangeDataBase;
begin
  inherited;
  _DbProduto.DataBaseName      := DataBaseName;
  _DbArtigo.DataBaseName       := DataBaseName;
  _DbConver.DataBaseName       := DataBaseName;
  _DbImpostos.DataBaseName     := DataBaseName;
  _DbArtxContaxCC.DataBaseName := DataBaseName;
end;

function TCtrlArtigo.Excluir: Boolean;
Var
   SQL        : String;
   CodProduto : String;
   CodArtigo  : String;
begin
  Result := True;
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluirArtigo(FcdsArtigo.Data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // Para exclusâo dos filhos
           If Not  ExcluirOutros Then
              Exception.Create(MessageInfo);

           FcdsArtigo.StatusFilter := [usDeleted];
           CodProduto := Copy(FcdsArtigo.FieldByName('CODPRODUTO').AsString+'     ',1,6);
           CodArtigo  := Copy(FcdsArtigo.FieldByName('CODARTIGO').AsString+'             ',1,14);
           FcdsArtigo.StatusFilter := [];

         //-- Excluir Tabela ARTXCONTAXCC --------------------------------------------------------------------------------
           SQL := 'DELETE FROM ARTXCONTAXCC WHERE (CODARTIGO ='+QuotedStr(CodArtigo)+')';
           If Not ExecSQL(SQL) Then
              Raise Exception.Create(MessageInfo);

           SQL := 'DELETE FROM SALDO WHERE (CODARTIGO ='+QuotedStr(CodArtigo)+')';
           If Not ExecSQL(SQL) Then
              Raise Exception.Create(MessageInfo);

           SQL := 'DELETE FROM CUSTOMED WHERE (CODARTIGO ='+QuotedStr(CodArtigo)+')';
           If Not ExecSQL(SQL) Then
              Raise Exception.Create(MessageInfo);

           SQL := 'DELETE FROM MOVIMENT WHERE (CODARTIGO ='+QuotedStr(CodArtigo)+')';
           If Not ExecSQL(SQL) Then
              Raise Exception.Create(MessageInfo);

         //-- Excluir Tabela Cor e Tamanho e ARTIGO --------------------------------------------------------------------------------
           SQL := 'DELETE FROM ARTIGO WHERE (CODPRODUTO ='+QuotedStr(CodProduto)+')';
           If Not ExecSQL(SQL) Then
              Raise Exception.Create(MessageInfo);
         //-- Excluir Tabela CONVER --------------------------------------------------------------------------------
           SQL := 'DELETE FROM CONVER WHERE (CODPRODUTO ='+QuotedStr(CodProduto)+')';
           If Not ExecSQL(SQL) Then
              Raise Exception.Create(MessageInfo);
         //-- Excluir Tabela IMPOSTOS --------------------------------------------------------------------------------
           SQL := 'DELETE FROM IMPOSTOSXPRODUTOS WHERE (CODPRODUTO ='+QuotedStr(CodProduto)+')';
           If Not ExecSQL(SQL) Then
              Raise Exception.Create(MessageInfo);
         //-- Excluir Tabela PRODUTO --------------------------------------------------------------------------------
           SQL := 'DELETE FROM PRODUTO WHERE (CODPRODUTO ='+QuotedStr(CodProduto)+')';
           If Not ExecSQL(SQL) Then
              Raise Exception.Create(MessageInfo);

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


function TCtrlArtigo.ExisteMedida( CodMedida : String ): Boolean;
begin
  Result := False;
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExisteMedida( CodMedida, FcdsConver.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           FcdsConver.DisableControls;
           FcdsConver.First;
           While not FcdsConver.Eof do
           Begin
              if Trim(FcdsConver.FieldByName('CODMEDIDA').AsString) = Trim(CodMedida) then
                 Begin
                    Result := True;
                    Break;
                 end;
              FcdsConver.Next;
           end;
        Finally
           FcdsConver.EnableControls;
        End;
     End;
end;

function TCtrlArtigo.ExisteMovimentacao(CodArtigo: String): Boolean;
Var
   SQL : String;
begin
   CodArtigo :=  Copy(Trim(CodArtigo)+'                    ',1,14);
   //
   SQL:= ' SELECT CODARTIGO FROM MOVIMENT'+
         ' WHERE (CODARTIGO = '+QuotedStr(CodArtigo)+')';

   _cds.Data := GetDataPacket(SQL);

   Result := Not _cds.IsEmpty ;
end;

Function TCtrlArtigo.GetArtigo(CodArtigo: String ) : OleVariant;
Var
   SQL : TStringList;
begin
   CodArtigo := Copy(CodArtigo+'                         ',1,6);
   //----------------------------------------------------------------------
   // Query Principal
   //----------------------------------------------------------------------
   Sql := TStringList.Create;
   Try
      Sql.Clear;
      Sql.Append('SELECT   ');
      Sql.Append('     P.CODPRODUTO,      ');
      Sql.Append('     P.CODGRUPOPROD,    ');
      Sql.Append('     P.CODMEDCUSTO,     ');
      Sql.Append('     P.DESCPROD,        ');
      Sql.Append('     P.CODMEDANALISE,   ');
      Sql.Append('     P.CLASSCONTABIL,   ');
      Sql.Append('     P.CONSUMOREVENDA,  ');
      Sql.Append('     P.CREDITOIMPOSTO,  ');
      Sql.Append('     P.LOTEVALIDADE,    ');
      Sql.Append('     P.TEMCORTAM,       ');
      Sql.Append('     P.ITEMESTOCAVEL,   ');
      Sql.Append('     P.DESCRCOMPL,      ');
      Sql.Append('     P.CODMENORMED,     ');
      Sql.Append('     P.ISENTOOUTROS,    ');
      Sql.Append('     P.CODFISCALPADRAO, ');
      Sql.Append('     P.FLGVARIAVEL,     ');
      Sql.Append('     P.SITUACAOTRIB,    ');
      Sql.Append('     A.CODARTIGO,       ');
      Sql.Append('     A.CODPRODUTO,      ');
      Sql.Append('     A.CODCOR,          ');
      Sql.Append('     A.CODTAMANHO,      ');
      Sql.Append('     A.CODTIPOARTIGO,   ');
      Sql.Append('     A.EXISTEFT,        ');
      Sql.Append('     A.FLGBLOQUEADO,    ');
      Sql.Append('     A.FLGATIVO,        ');
      Sql.Append('     A.CODBARRA         ');
      Sql.Append('FROM             ');
      Sql.Append('      PRODUTO P, ');
      Sql.Append('      ARTIGO A   ');
      Sql.Append('WHERE            ');
      Sql.Append('       (P.CODPRODUTO =  '+QuotedStr(CodArtigo)+') ');
      Sql.Append('  AND  (P.CODPRODUTO = A.CODARTIGO) ');

      Result := GetDataPacket( SQL.Text );
   Finally
      sql.Free;
   End;
end;


function TCtrlArtigo.JaExisteProduto(CodProduto: String): Boolean;
Var
   SQL : String;
begin
   CodProduto := Copy(Trim(CodProduto)+'       ',1,6);
   //
   SQL := ' SELECT CODPRODUTO FROM PRODUTO '+
          ' WHERE (CODPRODUTO ='+QuotedStr(CodProduto)+')';

   _cds.Data := GetDataPacket(SQL);

   Result := Not _cds.IsEmpty;
end;


function TCtrlArtigo.ListArtigo( TipoArtigo : TTipoArtigo; SoAtivo : Boolean;CodGrupoProd : String;
                                 TipoBloqueio : TTipoBloqueio) : OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT               '+
          '       A.CODARTIGO,   '+
          '       P.CODMEDCUSTO, '+
          '       P.CODPRODUTO,  '+
          '      (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO) AS DESCRICAO,'+
          '       A.CODBARRA,  '+
          '       A.VALULTCOMPRA, '+
          '       A.CODCOR,       '+
          '       A.CODTAMANHO,   '+
          '       A.CODTIPOARTIGO,'+
          '       A.FLGBLOQUEADO, '+
          '       A.FLGATIVO,     '+
          '       P.CONSUMOREVENDA, '+
          '       P.CODGRUPOPROD, '+
          '       P.CODFISCALPADRAO, '+
          '       P.FLGVARIAVEL, '+
          '       G.CODTIPRECDES, '+
          '       G.RECPAG, '+
          '       G.IDPESSOA '+
          ' FROM  '+
          '       PRODUTO P, '+
          '       ARTIGO A,  '+
          '       GRUPPROD G '+
          ' WHERE (1=1)      ';

    If SoAtivo Then
       SQL := SQL + ' AND (A.FLGATIVO = ''S'') ';
    Case TipoBloqueio Of
       tbCompra      : SQL := SQL + ' AND ((A.FLGBLOQUEADO <> ''C'')  AND (A.FLGBLOQUEADO <> ''A'')) ';
       tbRequisicao  : SQL := SQL + ' AND ((A.FLGBLOQUEADO <> ''R'')  AND (A.FLGBLOQUEADO <> ''A'')) ';
       tbAmbos       : SQL := SQL + ' AND (A.FLGBLOQUEADO = ''L'') ';
    End;

   If TipoArtigo <> taVazio Then
      SQL := SQL + 'AND (A.CODTIPOARTIGO ='+IntToStr(Integer(TipoArtigo))+') ';

  If Trim(CodGrupoProd) <> '' Then
      SQL := SQL + 'AND (P.CODGRUPOPROD ='+QuotedStr(CodGrupoProd)+') ';

   SQL := SQL + '   AND ( A.CODPRODUTO = P.CODPRODUTO) '+
                '   AND (P.CODGRUPOPROD = G.CODGRUPOPROD) '+
                ' ORDER BY DESCRICAO                   ';
   //
   Result := GetDataPacket( SQL );
end;

function TCtrlArtigo.ListUltCompra(CodArtigo: String): OleVariant;
Var
   SQL : TStringList;
begin
  CodArtigo := Copy(CodArtigo +'                 ',1,14);
  SQL := TStringList.Create;
  Try
     SQL.Append(' SELECT                                          ');
     SQL.Append('    P.RAZAOSOCIAL,                               ');
     SQL.Append('    NF.DATAENTDEVOL,                             ');
     SQL.Append('    I.QTDERECEBDEVOL,                            ');
     SQL.Append('    (I.VLRESTOQUE/I.QTDERECEBDEVOL) AS VALUNEST, ');
     SQL.Append('    I.VLRUNITARIO,                               ');
     SQL.Append('    I.CODMEDIDA                                  ');
     SQL.Append(' FROM                                            ');
     SQL.Append('    PESSOA P,                                    ');
     SQL.Append('    ITENSRECEBDEVOL I,                           ');
     SQL.Append('    NFRECEBDEVOL NF                              ');
     SQL.Append(' WHERE                                           ');
     SQL.Append('       (I.CODARTIGO = '+QuotedStr(CodArtigo)+')  ');
     SQL.Append('   AND (NF.FLGTIPONOTA = ''R'')                  ');
     SQL.Append('   AND (NF.IDNFRECEBDEVOL = I.IDNFRECEBDEVOL)    ');
     SQL.Append('   AND (NF.IDFORCLI = P.IDPESSOA)                ');
     SQL.Append('ORDER BY NF.DATAENTDEVOL DESC                    ');

     Result := GetDataPacket( SQL.Text );
  Finally
     SQL.Free;
  End;

end;

procedure TCtrlArtigo.SetcdsArtigo(const Value: TClientDataSet);
begin
  FcdsArtigo := Value;
end;

procedure TCtrlArtigo.SetcdsArtxContaxCC(const Value: TClientDataSet);
begin
  FcdsArtxContaxCC := Value;
end;

procedure TCtrlArtigo.SetcdsConver(const Value: TClientDataSet);
begin
  FcdsConver := Value;
end;

procedure TCtrlArtigo.SetcdsImpostos(const Value: TClientDataSet);
begin
  FcdsImpostos := Value;
end;

procedure TCtrlArtigo.SetcdsProduto(const Value: TClientDataSet);
begin
  FcdsProduto := Value;
end;

Function TCtrlArtigo.GetContabilizacao( IdPessoa : Integer; CodArtigo,CodGrupo : String ) : OleVariant;
Var
   SQL : String;
begin
   CodArtigo := Copy(CodArtigo+'                    ',1,14);

   SQL := 'SELECT '+
          '     CODARTIGO,   '+
          '     IDARTXCONTAXCC,  '+
          '     IDPESSOA,        '+
          '     PLANO,           '+
          '     UNIDNEGOC,       '+
          '     IDEMPRESA,       '+
          '     CODCENTROCUSTO,  '+
          '     CONTAENTRADA,    '+
          '     SUBCONTAENTRADA, '+
          '     CONTASAIDA,      '+
          '     SUBCONTASAIDA,   '+
          '     CODGRUPOPROD,    '+
          '     CODALMOXARIFADO  '+
          ' FROM ARTXCONTAXCC    '+
          ' WHERE (CODARTIGO = '+QuotedStr(CodArtigo)+')'+
          '   AND (IDPESSOA = '+IntToStr(IdPessoa)+')';

   _Cds.Data := GetDataPacket( SQL );

   IF _Cds.IsEmpty Then
      Begin
         CodGrupo := Copy(CodGrupo+'                    ',1,10);
         SQL := 'SELECT '+
                '     CODARTIGO,   '+
                '     IDARTXCONTAXCC,  '+
                '     IDPESSOA,        '+
                '     PLANO,           '+
                '     UNIDNEGOC,       '+
                '     IDEMPRESA,       '+
                '     CODCENTROCUSTO,  '+
                '     CONTAENTRADA,    '+
                '     SUBCONTAENTRADA, '+
                '     CONTASAIDA,      '+
                '     SUBCONTASAIDA,   '+
                '     CODGRUPOPROD,    '+
                '     CODALMOXARIFADO  '+
                ' FROM ARTXCONTAXCC    '+
                ' WHERE    (CODGRUPOPROD = '+QuotedStr(CodGrupo)+')'+
                '      AND (IDPESSOA = '+IntToStr(IdPessoa)+')';

         _Cds.Data := GetDataPacket( SQL );
      End;

    Result := _Cds.Data;
end;

function TCtrlArtigo.UltArtigoCadastrado( Tipo : Integer ): String;
Var
   SQL : String;
begin
   SQL:= '  SELECT P.CODPRODUTO '+
         '  FROM '+
         '      ARTIGO A, '+
         '      PRODUTO P, '+
         '      ( SELECT MAX(TRGDTINCLUSAO) AS MAXDATA '+
         '        FROM ARTIGO '+
         '        WHERE (CODTIPOARTIGO = '+IntToStr(Tipo)+') '+
         '      ) MAX '+
         '  WHERE '+
         '      (A.TRGDTINCLUSAO = MAX.MAXDATA) '+
         '  AND (A.CODPRODUTO = P.CODPRODUTO) ';

    _cds.Data := GetDataPacket(SQL);

    If Not _cds.IsEmpty Then
       Result := _cds.FieldByName('CODPRODUTO').asString;
end;

procedure TCtrlArtigo.OnCreateAppServer;
begin
  inherited;
  FcdsArtigo       := TClientDataSet.Create(nil);
  FcdsArtxContaxCC := TClientDataSet.Create(nil);
  FcdsConver       := TClientDataSet.Create(nil);
  FcdsImpostos     := TClientDataSet.Create(nil);
  FcdsProduto      := TClientDataSet.Create(nil);
  FcdsCorTamanho   := TClientDataSet.Create(nil);
  FcdsAtuUltCompra := TClientDataSet.Create(nil);
end;

function TCtrlArtigo.GetConver(CodArtigo: String): OleVariant;
Var
   SQL : TStringList;
begin
  CodArtigo := Copy(CodArtigo +'              ',1,14);
  SQL := TStringList.Create;
  Try
     Sql.Clear;
     Sql.Append(' SELECT            ');
     Sql.Append('    C.CODPRODUTO,  ');
     Sql.Append('    C.CODMEDIDA,   ');
     Sql.Append('    C.FATOR,       ');
     Sql.Append('    P.CODMENORMED  ');
     Sql.Append('FROM               ');
     Sql.Append('          CONVER C,');
     Sql.Append('          PRODUTO P');
     Sql.Append('WHERE              ');
     Sql.Append('       (P.CODPRODUTO = '+QuotedStr(CodArtigo)+') ');
     Sql.Append('   AND (P.CODPRODUTO = C.CODPRODUTO)      ');

     Result := GetDataPacket(SQL.Text);
  Finally
     Sql.Free;
  End;
end;

function TCtrlArtigo.GetImposto(CodArtigo: String; IdPessoa: Integer): OleVariant;
Var
   SQL : TStringList;
begin
  CodArtigo := Copy(CodArtigo +'              ',1,14);
  SQL := TStringList.Create;
  Try
     Sql.Clear;
     Sql.Append('SELECT                    ');
     Sql.Append('    I.CODPRODUTO,         ');
     Sql.Append('    I.CODTIPOCUSTAGREG,   ');
     Sql.Append('    I.CODESTADO,          ');
     Sql.Append('    I.IDPAIS,             ');
     Sql.Append('    I.IDPESSOA,           ');
     Sql.Append('    I.PERCIMPOSTO,        ');
     Sql.Append('    I.PERCBASEIMP,        ');
     Sql.Append('    T.DESCCUSTAGREG       ');
     Sql.Append('FROM                      ');
     Sql.Append('    IMPOSTOSXPRODUTOS I,  ');
     Sql.Append('    TIPOAGRE T            ');
     Sql.Append('WHERE                     ');
     Sql.Append('     (I.CODPRODUTO = '+QuotedStr(CodArtigo)+') ');
     Sql.Append(' AND (I.IDPESSOA = '+IntToStr(IdPessoa)+' )      ');
     Sql.Append(' AND (I.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG) ');

     Result := GetDataPacket(SQL.Text);
  Finally
     Sql.Free;
  End;

end;

function TCtrlArtigo.GetCorTamanho(CodProduto: String): OleVariant;
Var
   SQL : TStringList;
begin
  CodProduto := Copy(CodProduto +'              ',1,6);
  SQL := TStringList.Create;
  Try
     Sql.Clear;
     Sql.Append('SELECT A.CODARTIGO,     ');
     Sql.Append('       A.CODPRODUTO,    ');
     Sql.Append('       A.CODCOR,        ');
     Sql.Append('       A.CODTAMANHO,    ');
     Sql.Append('       A.CODTIPOARTIGO, ');
     Sql.Append('       A.CODBARRA,      ');
     Sql.Append('       A.FLGATIVO,      ');
     Sql.Append('       T.DESCTAMANHO,   ');
     Sql.Append('       C.DESCCOR        ');
     Sql.Append(' FROM  ARTIGO A,        ');
     Sql.Append('       COR C,           ');
     Sql.Append('       TAMANHO T,       ');
     Sql.Append('       PRODUTO P        ');
     Sql.Append(' WHERE                  ');
     Sql.Append('      (A.CODPRODUTO = '+ QuotedStr( CodProduto )+ ')');
     Sql.Append('  AND (A.CODCOR  =  C.CODCOR)        ');
     Sql.Append('  AND (A.CODTAMANHO  =  T.CODTAMANHO)');
     Sql.Append('  AND (A.CODPRODUTO = P.CODPRODUTO) ');

     Result := GetDataPacket(SQL.Text);
  Finally
     Sql.Free;
  End;

end;

procedure TCtrlArtigo.SetcdsCorTamanho(const Value: TClientDataSet);
begin
  FcdsCorTamanho := Value;
end;

function TCtrlArtigo.GetCustoMedio(CodArtigo: String;
  CodCusteio: Integer): Double;
Var
   SQL : String;
begin
  CodArtigo :=  Copy(  CodArtigo + '                 ',1,14);

  SQL := ' SELECT CUSTOMEDIO ' +
         ' FROM CUSTOMED ' +
         ' WHERE (CODARTIGO = '+ QuotedStr(CodArtigo)+ ' ) ' +
         '   AND (CODCUSTEIO = ' + IntToStr(CodCusteio)+')';

  _cds.Data  := GetDataPacket(SQL);
  
  Result := _cds.FieldByName('CUSTOMEDIO').AsFloat;
end;

function TCtrlArtigo.GetArtigoForBarra(CodBarra: String): OleVariant;
Var
   SQL : TStringList;
begin
   Sql := TStringList.Create;
   Try
      Sql.Clear;
      Sql.Append('SELECT   ');
      Sql.Append('     P.CODPRODUTO,      ');
      Sql.Append('     P.CODGRUPOPROD,    ');
      Sql.Append('     P.CODMEDCUSTO,     ');
      Sql.Append('     P.DESCPROD,        ');
      Sql.Append('     P.CODMEDANALISE,   ');
      Sql.Append('     P.CLASSCONTABIL,   ');
      Sql.Append('     P.CONSUMOREVENDA,  ');
      Sql.Append('     P.CREDITOIMPOSTO,  ');
      Sql.Append('     P.LOTEVALIDADE,    ');
      Sql.Append('     P.TEMCORTAM,       ');
      Sql.Append('     P.ITEMESTOCAVEL,   ');
      Sql.Append('     P.DESCRCOMPL,      ');
      Sql.Append('     P.CODMENORMED,     ');
      Sql.Append('     P.ISENTOOUTROS,    ');
      Sql.Append('     P.CODFISCALPADRAO, ');
      Sql.Append('     P.FLGVARIAVEL,     ');
      Sql.Append('     P.SITUACAOTRIB,    ');
      Sql.Append('     A.CODARTIGO,       ');
      Sql.Append('     A.CODPRODUTO,      ');
      Sql.Append('     A.CODCOR,          ');
      Sql.Append('     A.CODTAMANHO,      ');
      Sql.Append('     A.CODTIPOARTIGO,   ');
      Sql.Append('     A.EXISTEFT,        ');
      Sql.Append('     A.FLGBLOQUEADO,    ');
      Sql.Append('     A.FLGATIVO         ');
      Sql.Append('FROM             ');
      Sql.Append('      PRODUTO P, ');
      Sql.Append('      ARTIGO A   ');
      Sql.Append('WHERE            ');
      Sql.Append('       (A.CODBARRA =  '+QuotedStr(CodBarra)+') ');
      Sql.Append('  AND  (A.CODPRODUTO = P.CODPRODUTO) ');

      Result := GetDataPacket( SQL.Text );
   Finally
      sql.Free;
   End;
end;

function TCtrlArtigo.AtualizaValUltCompra : Boolean;
Var
   Msg : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.AtualizaValUltCompra();
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsAtuUltCompra,_DbArtigo,[],[]);
           Msg    := _DbArtigo.MessageInfo;
           If Not Result Then
              Raise Exception.Create(Msg); 

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

procedure TCtrlArtigo.SetcdsAtuUltCompra(const Value: TClientDataSet);
begin
  FcdsAtuUltCompra := Value;
end;

function TCtrlArtigo.ListArtigoxUsuario(SoAtivo: Boolean; IdPessoa,
  IdUsuario: Integer): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      Sql.Clear;
      Sql.Add(' SELECT                 ');
      Sql.Add('       UN.CODARTIGO,    ');
      Sql.Add('       UN.CODMEDCUSTO,  ');
      Sql.Add('       UN.CODPRODUTO,   ');
      Sql.Add('       UN.DESCRICAO,    ');
      Sql.Add('       UN.CODBARRA,     ');
      Sql.Add('       UN.VALULTCOMPRA, ');
      Sql.Add('       UN.CODCOR,       ');
      Sql.Add('       UN.CODTAMANHO,   ');
      Sql.Add('       UN.CODTIPOARTIGO,');
      Sql.Add('       UN.FLGBLOQUEADO, ');
      Sql.Add('       UN.FLGATIVO      ');
      Sql.Add(' FROM                  ');
      Sql.Add(' (                     ');
      Sql.Add(' SELECT                ');
      Sql.Add('       A.CODARTIGO,    ');
      Sql.Add('       P.CODMEDCUSTO,  ');
      Sql.Add('       P.CODPRODUTO,   ');
      Sql.Add('      (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO) AS DESCRICAO,');
      Sql.Add('       A.CODBARRA,     ');
      Sql.Add('       A.VALULTCOMPRA, ');
      Sql.Add('       A.CODCOR,       ');
      Sql.Add('       A.CODTAMANHO,   ');
      Sql.Add('       A.CODTIPOARTIGO,');
      Sql.Add('       A.FLGBLOQUEADO, ');
      Sql.Add('       A.FLGATIVO      ');
      Sql.Add(' FROM                  ');
      Sql.Add('        ARTIGO A,      ');
      Sql.Add('        PRODUTO P      ');
      Sql.Add(' WHERE                 ');
      Sql.Add('        (((A.FLGBLOQUEADO <> ''R'') AND (A.FLGBLOQUEADO <> ''A'')) OR (A.FLGBLOQUEADO IS NULL))');

      If SoAtivo Then
         Sql.Add('    AND ( A.FLGATIVO = ''S'')');

      Sql.Add('    AND ( A.CODPRODUTO = P.CODPRODUTO)                    ');
      Sql.Add('    AND (NOT EXISTS (SELECT 1 FROM USUXGRUPPROD           ');
      Sql.Add('                     WHERE  (IDUSUARIO = '+IntToStr(IdUsuario)+')  ');
      Sql.Add('                        AND (IDPESSOA = '+IntToStr(IdPessoa)+'))) ');
      Sql.Add(' UNION ALL               ');
      Sql.Add('   SELECT                ');
      Sql.Add('       A.CODARTIGO,    ');
      Sql.Add('       P.CODMEDCUSTO,  ');
      Sql.Add('       P.CODPRODUTO,   ');
      Sql.Add('      (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO) AS DESCRICAO,');
      Sql.Add('       A.CODBARRA,     ');
      Sql.Add('       A.VALULTCOMPRA, ');
      Sql.Add('       A.CODCOR,       ');
      Sql.Add('       A.CODTAMANHO,   ');
      Sql.Add('       A.CODTIPOARTIGO,');
      Sql.Add('       A.FLGBLOQUEADO, ');
      Sql.Add('       A.FLGATIVO      ');
      Sql.Add('   FROM                   ');
      Sql.Add('       ARTIGO A,          ');
      Sql.Add('       PRODUTO P,         ');
      Sql.Add('       USUXGRUPPROD UXG   ');
      Sql.Add('   WHERE                  ');
      Sql.Add('           (((A.FLGBLOQUEADO <> ''R'')  AND (A.FLGBLOQUEADO <> ''A'')) OR (A.FLGBLOQUEADO IS NULL))');

      If SoAtivo Then
         Sql.Add('    AND ( A.FLGATIVO = ''S'')');

      Sql.Add('       AND (UXG.IDUSUARIO = '+IntToStr(IdUsuario)+')  ');
      Sql.Add('       AND (UXG.IDPESSOA = '+IntToStr(IdPessoa)+')   ');
      Sql.Add('       AND (P.CODGRUPOPROD = UXG.CODGRUPOPROD)            ');
      Sql.Add('       AND (A.CODPRODUTO = P.CODPRODUTO )                 ');
      Sql.Add(' ) UN   ');
      Sql.Add(' ORDER BY UN.DESCRICAO ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlArtigo.ListSaldoProduto(IdPessoa: Integer;
  CodArtigo: String): OleVariant;
Var
   SQL : TStringList;
begin
   CodArtigo := Copy(CodArtigo+'                        ',1,14 );
   SQL := TStringList.Create;
   Try
      Sql.Clear;
      Sql.Add(' SELECT                 ');
      Sql.Add('      A.DESCALMOX,      ');
      Sql.Add('      S.SALDOQTDE,      ');
      Sql.Add('      C.CUSTOMEDIO,     ');
      Sql.Add('      (S.SALDOQTDE * C.CUSTOMEDIO) AS VALOREST');
      Sql.Add(' FROM          ');
      Sql.Add('    ALMOX A,   ');
      Sql.Add('    SALDO S,   ');
      Sql.Add('    CUSTOMED C ');
      Sql.Add(' WHERE         ');
      Sql.Add('      (S.CODARTIGO = '+QuotedStr(CodArtigo)+') ');
      Sql.Add('  AND (C.CODARTIGO = '+QuotedStr(CodArtigo)+')');
      Sql.Add('  AND (S.IDPESSOA = '+IntToStr(IdPessoa)+') ');
      Sql.Add('  AND (A.CODALMOXARIFADO  = S.CODALMOXARIFADO) ');
      Sql.Add('  AND (A.CODCUSTEIO  = C.CODCUSTEIO)');
      Sql.Add(' ORDER BY A.DESCALMOX ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlArtigo.GetUltCompra(IdPessoa: Integer;
  CodArtigo: String): OleVariant;
Var
   SQL : TStringList;
begin
   CodArtigo := Copy(CodArtigo+'                        ',1,14 );
   SQL := TStringList.Create;
   Try
      Sql.Clear;
      Sql.Add('SELECT           ');
      Sql.Add('     CODARTIGO,  ');
      Sql.Add('     DATAULTCOMP,');
      Sql.Add('     FORMECEDOR, ');
      Sql.Add('     QTDE ,      ');
      Sql.Add('     UNID,       ');
      Sql.Add('     VALUNIT,    ');
      Sql.Add('     IDPESSOA,   ');
      Sql.Add('     PRAZO,      ');
      Sql.Add('     PERIODO     ');
      Sql.Add('FROM             ');
      Sql.Add('     VWULTCOMPRA ');
      Sql.Add('WHERE            ');
      Sql.Add('       (CODARTIGO = '+QuotedStr(CodArtigo)+') ');
      Sql.Add('    AND (IDPESSOA = '+IntToStr(IdPessoa)+') ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlArtigo.ListConsMedioDia(IdPessoa: Integer; CodArtigo: String;
  Dia: Integer; DataIni, DataFim: TDateTime): OleVariant;
Var
   SQL : TStringList;
begin
   CodArtigo := Copy(CodArtigo+'                        ',1,14 );

   SQL := TStringList.Create;
   Try
      Sql.Clear;
      Sql.Add('SELECT           ');
      Sql.Add('      M.CODARTIGO AS CODARTIGO, ');
      Sql.Add('      ROUND(ABS(SUM(M.QTDEMOV))/'+IntToStr(Dia)+',2)  AS CONSUMO ');
      Sql.Add('FROM  ');
      Sql.Add('      MOVIMENT M');
      Sql.Add('WHERE ');
      Sql.Add('       (M.CODARTIGO = '+QuotedStr(CodArtigo)+') ');
      Sql.Add('   AND (M.DATAMOV >= TO_DATE('''+DateToStr(DataIni)+''',''DD/MM/YYYY'')) ');
      Sql.Add('   AND (M.DATAMOV <= TO_DATE('''+DateToStr(DataFim)+''',''DD/MM/YYYY'')) ');
      Sql.Add('   AND (M.CODTIPOMOV NOT IN (''A'',''K'',''Z'') ) ');
      Sql.Add('   AND (M.IDPESSOA = '+IntToStr(IdPessoa)+')');
      Sql.Add('   AND (M.QTDEMOV < 0 )  ');
      Sql.Add('   AND (M.VALORMOV < 0 ) ');
      Sql.Add('GROUP BY M.CODARTIGO     ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlArtigo.ListConsMedioTotal(IdPessoa: Integer; CodArtigo: String;
  DataIni, DataFim: TDateTime): OleVariant;
Var
   SQL : TStringList;
begin
   CodArtigo := Copy(CodArtigo+'                        ',1,14 );

   SQL := TStringList.Create;
   Try
      Sql.Clear;
      Sql.Add('SELECT           ');
      Sql.Add('      M.CODARTIGO AS CODARTIGO, ');
      Sql.Add('      ROUND(ABS(SUM(M.QTDEMOV)),2)  AS CONSUMO ');
      Sql.Add('FROM  ');
      Sql.Add('      MOVIMENT M');
      Sql.Add('WHERE ');
      Sql.Add('       (M.CODARTIGO = '+QuotedStr(CodArtigo)+') ');
      Sql.Add('   AND (M.DATAMOV >= TO_DATE('''+DateToStr(DataIni)+''',''DD/MM/YYYY'') ) ');
      Sql.Add('   AND (M.DATAMOV <= TO_DATE('''+DateToStr(DataFim)+''',''DD/MM/YYYY'') ) ');
      Sql.Add('   AND (M.CODTIPOMOV NOT IN (''A'',''K'',''Z'') ) ');
      Sql.Add('   AND (M.IDPESSOA = '+IntToStr(IdPessoa)+')');
      Sql.Add('   AND (M.QTDEMOV < 0 )  ');
      Sql.Add('   AND (M.VALORMOV < 0 ) ');
      Sql.Add('GROUP BY M.CODARTIGO     ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlArtigo.ExcluirOutros: Boolean;
begin
   Result := True;
end;

function TCtrlArtigo.GravarOutros: Boolean;
begin
   Result := True;
end;

function TCtrlArtigo.GetLocalizacao(CodAlmoxarifado: Integer;
  CodArtigo: String): String;
Var
   SQL : String;
Begin
   CodArtigo := Copy(CodArtigo +'                               ',1,14);

   SQL := ' SELECT LOCALIZACAO '+
          ' FROM SALDO ' +
          ' WHERE  (RTRIM(CODARTIGO) = '+QuotedStr(CodArtigo)+') '+
          '    AND (CODALMOXARIFADO = '+IntToStr(CodAlmoxarifado)+')';

   _cds.Data := GetDataPacket(SQL);

   Result := _cds.fieldByName('LOCALIZACAO').AsString;

end;

function TCtrlArtigo.GetCodMedCusto(CodArtigo: String): String;
Var
  SQL : String;
begin
   CodArtigo := Copy(CodArtigo+'                ',1,14);

   SQL := ' SELECT P.CODMEDCUSTO '+
          ' FROM PRODUTO P, ARTIGO A '+
          ' WHERE (A.CODARTIGO = '+QuotedStr(CodArtigo)+') '+
          '   AND (A.CODPRODUTO = P.CODPRODUTO) ';

   _Cds.Data := GetDataPacket(SQL);

   Result := _Cds.fieldByName('CODMEDCUSTO').AsString;
end;

function TCtrlArtigo.GetUltArtigoCad(Tipo: TTipoArtigo): String;
Var
   SQL : String;
begin
   SQL :=  '  SELECT P.CODPRODUTO '+
           '  FROM '+
           '      ARTIGO A, '+
           '      PRODUTO P, '+
           '      ( SELECT MAX(TRGDTINCLUSAO) AS MAXDATA '+
           '        FROM ARTIGO '+
           '        WHERE (CODTIPOARTIGO = '+IntToStr(Integer(Tipo))+') '+
           '      ) MAX '+
           '  WHERE '+
           '      (A.TRGDTINCLUSAO = MAX.MAXDATA) '+
           '  AND (A.CODPRODUTO = P.CODPRODUTO) ';

   _Cds.Data := GetDataPacket(SQL);

   Result := _Cds.FieldByName('CODPRODUTO').AsString;
end;



function TCtrlArtigo.ControloValidade(CodArtigo: String): Boolean;
Var
   SQL : String;
begin
   Result := False;

   CodArtigo := Copy(CodArtigo+'                 ',1,6);

   SQL := 'SELECT LOTEVALIDADE FROM PRODUTO '+
          'WHERE (CODPRODUTO = '+QuotedStr(CodArtigo)+')';

   _Cds.Data := GetDataPacket(SQL);

   If Not _Cds.IsEmpty Then
      Result := _Cds.FieldByName('LOTEVALIDADE').AsString = 'T';
end;

function TCtrlArtigo.ExisteUnidadeSCI(CodArtigo: String): Boolean;
Var
   SQL        : String;
   CodProduto : String;
begin
   CodArtigo  := Copy(CodArtigo +'               ',1,14);
   CodProduto := Copy(CodArtigo,1,6);

   SQL := ' SELECT I.CODMEDIDA FROM ITEMSOLI I '+
          ' WHERE (I.CODARTIGO = '+QuotedStr( CodArtigo )+') '+
          '   AND (NOT EXISTS (SELECT X.CODMEDIDA FROM CONVER X '+
          '        WHERE (X.CODPRODUTO = '+QuotedStr( CodArtigo )+') '+
          '          AND (X.CODMEDIDA = I.CODMEDIDA))) ';

    _Cds.Data := GetDataPacket( SQL );

    Result := Not _Cds.IsEmpty;
end;

function TCtrlArtigo.ExisteUnidadeFichaTec(CodArtigo: String): Boolean;
Var
   SQL        : String;
   CodProduto : String;
begin
   CodArtigo  := Copy(CodArtigo +'               ',1,14);
   CodProduto := Copy(CodArtigo,1,6);

   SQL := ' SELECT I.CODMEDIDA FROM FICHTECN  I '+
          ' WHERE (I.CODARTIGOSEC  = '+QuotedStr( CodArtigo )+') '+
          '   AND (NOT EXISTS (SELECT X.CODMEDIDA FROM CONVER X '+
          '        WHERE (X.CODPRODUTO = '+QuotedStr( CodArtigo )+') '+
          '          AND (X.CODMEDIDA = I.CODMEDIDA))) ';

    _Cds.Data := GetDataPacket( SQL );

    Result := Not _Cds.IsEmpty;
end;


function TCtrlArtigo.GetGrupoBem(CodArtigo: String): Double;
Var
   SQL : TStrings;
begin
    CodArtigo := Copy(CodArtigo +'                 ',1,14);

    SQL := TStringList.Create;
    Try
       SQL.Add(' SELECT G.IDGRUPO ');
       SQL.Add(' FROM ARTIGO A, PRODUTO P,GRUPPROD G ');
       SQL.Add(' WHERE  (A.CODARTIGO = '+QuotedStr( CodArtigo )+') ');
       SQL.Add('    AND (A.CODPRODUTO = P.CODPRODUTO) ');
       SQL.Add('    AND (P.CODGRUPOPROD = G.CODGRUPOPROD) ');

       _Cds.Data := GetDataPacket(SQL.Text);

       Result :=  _Cds.FieldByName('IDGRUPO').AsFloat;

    Finally
       SQL.Free;
    End;
end;

// lista a contabilização do Grupo juntamente com a
// contabilizacao do produdo em particular.
function TCtrlArtigo.ListContabArtigo(IdPessoa : Integer; CodArtigo, CodGrupo: string): OleVariant;
var sql: string;
begin
   CodArtigo := Copy(CodArtigo+'                    ',1,14);
   CodGrupo  := Copy(CodGrupo+'                    ',1,10);

   SQL := 'SELECT '+
          '     CODARTIGO,   '+
          '     IDARTXCONTAXCC,  '+
          '     IDPESSOA,        '+
          '     PLANO,           '+
          '     UNIDNEGOC,       '+
          '     IDEMPRESA,       '+
          '     CODCENTROCUSTO,  '+
          '     CONTAENTRADA,    '+
          '     SUBCONTAENTRADA, '+
          '     CONTASAIDA,      '+
          '     SUBCONTASAIDA,   '+
          '     CODGRUPOPROD,    '+
          '     CODALMOXARIFADO  '+
          ' FROM ARTXCONTAXCC    '+
          ' WHERE (CODARTIGO = '+QuotedStr(CodArtigo)+')'+
          '   AND (IDPESSOA = '+IntToStr(IdPessoa)+') AND CODGRUPOPROD IS NULL '+
          ' UNION SELECT '+
          '     CODARTIGO,   '+
          '     IDARTXCONTAXCC,  '+
          '     IDPESSOA,        '+
          '     PLANO,           '+
          '     UNIDNEGOC,       '+
          '     IDEMPRESA,       '+
          '     CODCENTROCUSTO,  '+
          '     CONTAENTRADA,    '+
          '     SUBCONTAENTRADA, '+
          '     CONTASAIDA,      '+
          '     SUBCONTASAIDA,   '+
          '     CODGRUPOPROD,    '+
          '     CODALMOXARIFADO  '+
          ' FROM ARTXCONTAXCC    '+
          ' WHERE    (CODGRUPOPROD = '+QuotedStr(CodGrupo)+')'+
          '      AND (IDPESSOA = '+IntToStr(IdPessoa)+')';

    Result := GetDataPacket( SQL );
end;

procedure TCtrlArtigo.SetCodArtigo(const Value: String);
begin
  FCodArtigo := Value;
end;

end.


