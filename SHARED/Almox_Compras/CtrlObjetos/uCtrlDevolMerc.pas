{-------------------------------------------------------------------------------
 Data       : 22.09.2006
 Autor      : Antonio Marcos (amf)
 Pendência  : 22574
 Descrição  : Criei uma nova function na uCtrlDevolMerc: function TotalArtigoDevolvido.
              Esta function controla o saldo na devolução do artigo.
----------------------------------------------------------------------------------}

unit uCtrlDevolMerc;

interface

Uses DB, uDataBase,  uCmControlObject, dbclient,uCmDbObject, DAlmoxarifado,
     sysUtils,jclMath,uCMMath, uCMTypes, uMidasUtil,Classes,uCtrlMovEstoque,
     uCtrlUnMedida, uCtrlLancamento, uCtrlDocumento,udbNota,udbItemNota,udbAgregNota,
     udbAgregItemNota, uCtrlRecebMerc, uCtrlListCAPCAR, uCtrlIntegracaoContabil,
     uListaCamposHistAlmox, uCtrlModeloHistorico;

Const
   MAX_DIFERENCA = 0.02;

   MSG_NAO_QTDEDEVOL            = ' Quantidade Devolvida Excede a disponível';
   MSG_NUMNOTA_NAO_PREENCH      = ' Número da nota não preenchido.';
   MSG_NAO_HA_ITEMNOTA          = ' Não há nehum item preenchido.';
   MSG_DATAEMISS_NAO_PREENCH    = ' Data de emissão não preenchida.';
   MSG_DATADEVOL_NAO_PREENCH    = ' Data de devolução não preenchida.';
   MSG_DATADEVOL_MAIOR          = ' Data de devolução não pode ser menor que a data de emissão ';
   MSG_TOTAL_NAO_BATE           = ' Total da Nota não confere. Verifique.';
   MSG_DEBITO_NAO_BATEU         = ' Débito não bateu com o crédito na contabilização. Provavelmente existe algum cadastro sem conta ou o cadastro de custos agregados não foi feito de maneira correta.Verifique.';
Type
  TCtrlDevolMerc = class(TCmControlObject)
   Protected
     Procedure AfterInitialize; Override;
     Procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
   private
    _DtmAlmox        : TDtmAlmoxarifado;
    _dbNota          : TdbNota;
    _dbItemNota      : TdbItemNota;
    _dbAgregItemNota : TdbAgregItemNota;
    _dbAgregNota     : TdbAgregNota;

    _MovEstoque         : TCtrlMovEstoque;
    _UnMedida           : TCtrlUnMedida;
    _Lancamento         : TCtrlLancamento;
    _RecebMerc          : TCtrlRecebMerc;
    _ListCAPCAR         : TCtrlListCAPCAR;
    _Documento          : TCtrlDocumento;
    _IntegracaoContabil : TCtrlIntegracaoContabil;
    _ModeloHist         : TCtrlModeloHistorico;

    _CdsAgregNota    : TClientDataSet;
    _CdsAgregItem    : TClientDataSet;
    _CdsAgregNFCompl : TClientDataSet;

    FCdsContab: TClientDataSet;
    FCdsItemDevol: TClientDataSet;
    FCdsDevol: TClientDataSet;
    FCdsNota: TClientDataSet;

    procedure SetCdsContab(const Value: TClientDataSet);
    procedure SetCdsItemDevol(const Value: TClientDataSet);
    procedure SetCdsDevol(const Value: TClientDataSet);
    procedure SetCdsNota(const Value: TClientDataSet);

    {**
       Insere os dados no CDSCONTAB para posterior gravação na contabilidade.
    **}
    Function InsereCdsContab(iPlano, UnidNegoc, CodSubConta : Double;sDebCre,sConta,sCentroCusto,sHistorico : String; Valor : Double) : Boolean;
    {**
      Gera os lancamento do almoxarifado no sistema de contabilidade
    **}
    Function  FazIntegraContab ( IdPessoa     : Integer;
                                 UsaPlanoPrev : Boolean;
                                 IdModulo     : Double;
                                 IdUsuario    : Double;
                                 IdPatro      : Double;
                                 IdPlanoPrev  : Double ) : Double ;
   {**
      Efetua o tratamento dos imposto da nota e dos itens
   **}
   Procedure FazRegra3;
  {**
      Efetua o tratamento dos imposto da nota complementar
   **}
   Procedure FazRegra3AgrNfCompl;
   {**
      Pega os impostos da Nota
   **}
   Function GetAgregDevol( IdNFRecebDevol : Double ) : OleVariant;
   {**
      Pega os impostos do Item da Nota
   **}
   Function GetAgregItemDevol( IdNFRecebDevol : Double ) : OleVariant;

   {**
      Lança no CAP o Alterador do Documento
   **}
   Function LancAlterdor( IdPessoa        : Integer;
                          IdUsuario       : Double;
                          CodAlterardor   : Double;
                          rAbateValor     : Double;
                          rTotImp         : Double;
                          rTotRefCalculo  : Double;
                          bUsaPlanoPatro  : Boolean) : Boolean;
   {**
     Validas os Dados da nota de Devolução
   **}
   Function ValidaDadosDevol : Boolean;
   {**
      Processa todos os calculos da nota fiscal
   **}
   Function ProcessaDevolucao( IdPessoa           : Double;
                               iUnidNegocPadrao   : Double;
                               var rAbateValor    : Double;
                               var rTotImp        : Double;
                               var rTotRefCalculo : Double;
                               IntegraContab      : Boolean;
                               IntegraLivro       : Boolean;
                               sCCustoPadrao      : String) : Boolean;
   {**
      Executa os processamento necessários para devolução do item da nota,
      tais como movimentações no estoque e gravação de imposotos
   **}
   function ProcessaItemDevol( IdPessoa,IdItensRecDev,PlnCodigo : Double ) : Boolean;

   public
     Property CdsDevol     : TClientDataSet read FCdsDevol write SetCdsDevol;
     Property CdsNota      : TClientDataSet read FCdsNota write SetCdsNota;
     Property CdsItemDevol : TClientDataSet read FCdsItemDevol write SetCdsItemDevol;
     Property CdsContab    : TClientDataSet read FCdsContab write SetCdsContab;

     Constructor Create;  Override;
     Destructor  Destroy; Override;
     {**
        Lista as notas disponíves para devolução
     **}
     Function ListDevolucao( IdNFRecebDevol : Double ) : OleVariant;
     {**
        Lista os agregados da nota complementar
     **}
     Function ListAgregNFCompl( IdNFRecebDevol : Double ) : OleVariant;
     {**
        Lista os itens da notas disponíves para devolução
     **}
     Function ListItemDevol( IdNFRecebDevol : Double ) : OleVariant;
     {**
        Verifia se há quantidade (Saldo) disponível para devolução
     **}
     Function verifQtdeDevol( IdPessoa        : Double;
                              IdNFRecebDevol  : Double;
                              CodAlmoxarifado : Double;
                              Data            : TDateTime;
                              CodArtigo       : String;
                              CodMedida       : String;
                              QtdeDevol       : Double;
                              QtdeReceb       : Double ) : Boolean;
     {**
        Pega a quantidade devolvida de um determinado por nota de devolução
     **}
     Function GetQtdeDevol ( IdNFRecebDevol  : Double;
                             CodArtigo       : String;
                             IdProdVari      : Double = 0 ) : Double;
     {**
       Lista a contabilização da Nota
     **}
     Function  ListContabilizacao( PlnCodigo : Double ): OleVariant;
     {**
        Efetua a gravação da devolução da /*do amf 22.09.2006 recebimento de*/ mercadoria
     **}
     Function Devolver( IdPessoa          : Integer;
                        UsaPlanoPrev      : Boolean;
                        IntegraContab     : Boolean;
                        IntegraLivro      : Boolean;
                        CodAlterador      : Double;
                        IdUsuario         : Double;
                        IdPatro           : Double;
                        IdPlanoPrev       : Double;
                        IdPrograma        : Double;
                        iUnidNegocPadrao  : Double;
                        sCCustoPadrao     : String) : Boolean;

     // Esta function verifica a quantidade total do artigo devolvido.
     function TotalArtigoDevolvido(IdNFRecebDevol  : Double;
                                   CodArtigo       : String;
                                   IdProdVari      : Double = 0 ) : Double;
   End;

implementation

{ TCtrlDevolMerc }

procedure TCtrlDevolMerc.AfterInitialize;
begin
  inherited;
  _MovEstoque.InitializeAs(Self);
  _Lancamento.InitializeAs(Self);
  _RecebMerc.InitializeAs(Self);
  _ListCAPCAR.InitializeAs(Self);
  _UnMedida.InitializeAs(Self);
  _Documento.InitializeAs(Self);
  _IntegracaoContabil.InitializeAs(Self);
  _ModeloHist.InitializeAs(Self);
end;

constructor TCtrlDevolMerc.Create;
begin
  inherited;
  _DtmAlmox        := TDtmAlmoxarifado.Create(nil);
  _dbNota          := TDbNota.Create(Self);
  _dbItemNota      := TdbItemNota.Create(Self);
  _dbAgregItemNota := TdbAgregItemNota.Create(Self);
  _dbAgregNota     := TdbAgregNota.Create(Self);

  _MovEstoque := TCtrlMovEstoque.Create;
  _UnMedida   := TCtrlUnMedida.Create;
  _Lancamento := TCtrlLancamento.Create;
  _RecebMerc  := TCtrlRecebMerc.Create;
  _ListCAPCAR := TCtrlListCAPCAR.Create;

  _Documento          := TCtrlDocumento.Create;
  _IntegracaoContabil := TCtrlIntegracaoContabil.Create;
  _ModeloHist         := TCtrlModeloHistorico.Create;

  _CdsAgregNota    := TClientDataSet.Create(nil);
  _CdsAgregItem    := TClientDataSet.Create(nil);
  _CdsAgregNFCompl := TClientDataSet.Create(nil);
end;

destructor TCtrlDevolMerc.Destroy;
begin
  If IsAppServer Then
     FreeCds([FCdsDevol,FcdsNota,FCdsItemDevol,FCdsContab]);

  _DtmAlmox.Free;
  _dbNota.Free;
  _dbItemNota.Free;
  _dbAgregItemNota.Free;
  _dbAgregNota.Free;

  _MovEstoque.Free;
  _UnMedida.Free;
  _Lancamento.Free;
  _RecebMerc.Free;
  _ListCAPCAR.Free;

  _Documento.Free;
  _IntegracaoContabil.Free;
  _ModeloHist.Free;

  _CdsAgregNota.Free;
  _CdsAgregItem.Free;
  _CdsAgregNFCompl.Free;

  inherited;
end;

function TCtrlDevolMerc.Devolver(IdPessoa: Integer; UsaPlanoPrev,
  IntegraContab, IntegraLivro: Boolean; CodAlterador, IdUsuario, IdPatro, IdPlanoPrev,
  IdPrograma, iUnidNegocPadrao: Double; sCCustoPadrao: String): Boolean;
var
   PlnCodigo      : Double;
   rAbateValor    : Double;
   rTotImp        : Double;
   rTotRefCalculo : Double;
begin
   Result := True;
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.DevolverMerc( IdPessoa, UsaPlanoPrev,
                                                      IntegraContab,CodAlterador,
                                                      IdUsuario,IdPatro,
                                                      IdPlanoPrev,IdPrograma,iUnidNegocPadrao,
                                                      sCCustoPadrao,
                                                      FcdsNota.Data,
                                                      FcdsItemDevol.Data,
                                                      FCdsDevol.Data,
                                                      FCdsContab.Data );
         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;
            //-------------------------------------------------------------------------------------------------------------------
            // Faz a Validaçoes da informações inserida na nota
            //-------------------------------------------------------------------------------------------------------------------
            If Not ValidaDadosDevol Then
               Raise Exception.Create( MessageInfo );

            //-------------------------------------------------------------------------------------------------------------------
            // Faz todo o processamento de valor referente a nota
            //-------------------------------------------------------------------------------------------------------------------
            _CdsAgregNota.Data := GetAgregDevol( FcdsNota.FieldByName('IDNFRECEBDEVOL').AsFloat);
            _CdsAgregItem.Data := GetAgregItemDevol(FcdsNota.FieldByName('IDNFRECEBDEVOL').AsFloat);

            if not ProcessaDevolucao(IdPessoa,iUnidNegocPadrao,rAbateValor,rTotImp,rTotRefCalculo,IntegraContab,IntegraLivro,sCCustoPadrao) Then
               Raise Exception.Create( MessageInfo );

            //-------------------------------------------------------------------------------------------------------------------
            // Faz a Integração Contabil
            //-------------------------------------------------------------------------------------------------------------------
            PlnCodigo := 0;
            if IntegraContab then
               Begin
                  PlnCodigo := FazIntegraContab(IdPessoa, USaPlanoPrev, 5,IdUsuario,IdPatro,IdPlanoPrev );
                  If PlnCodigo <= 0  Then
                     Raise Exception.Create( MessageInfo );
               end;

            //-------------------------------------------------------------------------------------------------------------------
            // Lança alterador do DOCUMENTO assossiado a nota pricipal no Contas a Pagar
            //-------------------------------------------------------------------------------------------------------------------
            if Not FCdsNota.FieldByName('CODDOCUMENTO').isNull then
               Begin
                  IF Not LancAlterdor(IdPessoa,IdUsuario,CodAlterador, rAbateValor,rTotImp,rTotRefCalculo,USaPlanoPrev)
                  Then
                     Raise Exception.Create( MessageInfo );
               end;

            //-------------------------------------------------------------------------------------------------------------------
            // Grava a Nota de Devolução
            //-------------------------------------------------------------------------------------------------------------------
            CdsToDbObject(FcdsDevol,_dbNota);
            _dbNota.PLNCODIGO.AsFloat      := PlnCodigo;
            _dbNota.IDPESSOA.AsFloat       := IdPessoa;
            _dbNota.IDFORCLI.AsFloat       := FCdsNota.FieldByName('IDFORCLI').AsFloat;
            _dbNota.CODDOCUMENTO.AsFloat   := FCdsNota.FieldByName('CODDOCUMENTO').AsFloat;
            _dbNota.FLGTIPONOTA.AsString   := 'D';
            _dbNota.IDNFREFERENCIA.AsFloat := FCdsNota.FieldByName('IDNFRECEBDEVOL').AsFloat;

            If Not _dbNota.Insert Then
               Raise Exception.Create( _dbNota.MessageInfo );

            //-------------------------------------------------------------------------------------------------------------------
            // Grava o Item da Nota de Devolução
            //-------------------------------------------------------------------------------------------------------------------
            FcdsItemDevol.First;
            While Not FcdsItemDevol.Eof Do
               Begin
                  If Not IsFloatZero(FCdsItemDevol.FieldByName('QTDEDEV').AsFloat) then
                     Begin
                        CdsToDbObject(FcdsItemDevol,_dbItemNota);
                        _dbItemNota.IDNFRECEBDEVOL.AsFloat := _dbNota.IDNFRECEBDEVOL.AsFloat;
                        _dbItemNota.QTDERECEBDEVOL.AsFloat := FCdsItemDevol.FieldByName('QTDEDEV').AsFloat;
                        _dbItemNota.VLRESTOQUE.AsFloat     := FCdsItemDevol.FieldByName('VLRDEV').AsFloat;

                        If Not _dbItemNota.Insert Then
                           Raise Exception.Create( _dbItemNota.MessageInfo );

                        If Not ProcessaItemDevol(IdPessoa, _dbItemNota.IDITENSRECDEV.AsFloat,PlnCodigo ) Then
                           Raise Exception.Create( MessageInfo );
                     End;

                  FcdsItemDevol.Next;
               End;

            //-------------------------------------------------------------------------------------------------------------------
            // Grava efetivcamente os Impostos da Nota
            //-------------------------------------------------------------------------------------------------------------------
            _CdsAgregNota.First;
            While Not _CdsAgregNota.Eof Do
               Begin
                   If _CdsAgregNota.FieldByName('VLRAGREGDEV').AsFloat <> 0 Then
                      Begin
                         _dbAgregNota.IDNFRECEBDEVOL.AsFloat    := _dbNota.IDNFRECEBDEVOL.AsFloat;
                         _dbAgregNota.CODTIPOCUSTAGREG.AsFloat  := _CdsAgregNota.FieldByName('CODTIPOCUSTAGREG').AsFloat;
                         _dbAgregNota.ALIQUOTA.AsFloat          := _CdsAgregNota.FieldByName('ALIQUOTA').AsFloat;
                         _dbAgregNota.BASECALCULO.AsFloat       := _CdsAgregNota.FieldByName('VLRAGREGDEV').AsFloat;
                         _dbAgregNota.VLRAGREGADO.AsFloat       := _CdsAgregNota.FieldByName('BASEDEV').AsFloat;
                         _dbAgregNota.VLRRECUPERADO.AsFloat     := _CdsAgregNota.FieldByName('VLRRECUPDEV').AsFloat;

                         If Not _dbAgregNota.Insert Then
                            Raise Exception.Create( _dbAgregNota.MessageInfo );
                      End;

                   _CdsAgregNota.Next;
               End;





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

function TCtrlDevolMerc.FazIntegraContab(IdPessoa: Integer;
  UsaPlanoPrev: Boolean; IdModulo, IdUsuario, IdPatro,
  IdPlanoPrev: Double): Double;
Var
   rPlnCodigo : Double;
begin
   Result     := -1;
   rPlnCodigo := 0;
   Try
      FCdsContab.First;
      While Not FCdsContab.Eof Do
         Begin
            If Not ( FloatsEqual(FCdsContab.FieldByName('LACVALOR').AsFloat, ZERO ) ) Then
               If FCdsContab.FieldByName('LACDEBCRE').AsString = 'D' Then
                  Begin
                     If Not _Lancamento.InsereLancaContab( '0',IdPessoa,IdModulo, IdUsuario,
                                                           FCdsContab.FieldByName('PLANO').AsInteger,
                                                           FCdsContab.FieldByName('UNIDNEGOC').AsInteger,
                                                           FCdsContab.FieldByName('CODSUBCONTA').AsInteger,0,
                                                           IdPlanoPrev,IdPatro,
                                                           rPlnCodigo,0,
                                                           FormatDateTime('dd/mm/yyyy',FCdsDevol.FieldByName('DATAENTDEVOL').AsDateTime),
                                                           FCdsContab.FieldByName('LACNUMDOC').AsString,
                                                           FCdsContab.FieldByName('HISTORICO').AsString,
                                                           '','','','','03',
                                                           FCdsContab.FieldByName('CODCENTROCUSTO').AsString,
                                                           FCdsContab.FieldByName('PLACONTA').AsString,
                                                           '','','',
                                                           FCdsContab.FieldByName('LACVALOR').AsFloat,False,UsaPlanoPrev)
                     Then
                        Raise Exception.Create( _Lancamento.MessageInfo );
                     rPlnCodigo := _Lancamento.RetornoPlnCodigo;
                  End
               Else
                  Begin
                     If Not _Lancamento.InsereLancaContab( '1',IdPessoa,IdModulo, IdUsuario,
                                                           FCdsContab.FieldByName('PLANO').AsInteger,
                                                           FCdsContab.FieldByName('UNIDNEGOC').AsInteger,0,
                                                           FCdsContab.FieldByName('CODSUBCONTA').AsInteger,
                                                           IdPlanoPrev,IdPatro,
                                                           rPlnCodigo,0,
                                                           FormatDateTime('dd/mm/yyyy',FCdsDevol.FieldByName('DATAENTDEVOL').AsDateTime),
                                                           FCdsContab.FieldByName('LACNUMDOC').AsString,
                                                           FCdsContab.FieldByName('HISTORICO').AsString,
                                                           '','','','','03',
                                                           '','',
                                                           FCdsContab.FieldByName('CODCENTROCUSTO').AsString,
                                                           FCdsContab.FieldByName('PLACONTA').AsString,
                                                           '',
                                                           FCdsContab.FieldByName('LACVALOR').AsFloat,False,UsaPlanoPrev )
                     Then
                        Raise Exception.Create( _Lancamento.MessageInfo );
                     rPlnCodigo := _Lancamento.RetornoPlnCodigo;
                  End;
            FCdsContab.Next;

            Result := rPlnCodigo;
         End;
   Except
      On E:Exception Do
       Begin
          Result := -1;
          MessageInfo := E.Message;
       End;
   End;
end;

procedure TCtrlDevolMerc.FazRegra3;
begin
   With _CdsAgregNota Do
      Begin
        First;
        While not Eof Do
           Begin
              Edit;
              FieldByName('VLRRECUPDEV').AsFloat := 0;
              FieldByName('VLRAGREGDEV').AsFloat := ( FCdsDevol.FieldByName('VLRNOTAFISCAL').AsFloat * FieldByName('VLRAGREGADO').AsFloat ) / FCdsNota.FieldByName('VLRNOTAFISCAL').AsFloat;

              If FieldByName('BASECALCULO').AsFloat > 0 Then
                 FieldByName('BASEDEV').AsFloat := ( FCdsDevol.FieldByName('VLRNOTAFISCAL').AsFloat * FieldByName('BASECALCULO').AsFloat ) / FCdsNota.FieldByName('VLRNOTAFISCAL').AsFloat;
              Post;
              Next;
           End;
      End;
  FCdsItemDevol.First;
  While not FCdsItemDevol.EOF do
  Begin
     _CdsAgregItem.First;
     While not _CdsAgregItem.EOF do
     Begin
        if _CdsAgregItem.FieldByName('IDITENSRECDEV').AsInteger = FCdsItemDevol.FieldByName('IDITENSRECDEV').AsInteger then
        Begin
           _CdsAgregItem.Edit;
           _CdsAgregItem.FieldByName('VLRRECUPDEV').AsFloat := 0;
           _CdsAgregItem.FieldByName('VLRAGREGDEV').AsFloat := ( FCdsItemDevol.FieldByName('QTDEDEV').AsFloat * _CdsAgregItem.FieldByName('VLRAGREGADO').AsFloat ) / FCdsItemDevol.FieldByName('QTDERECEBDEVOL').AsFloat;

           If _CdsAgregItem.FieldByName('BASECALCULO').AsFloat > 0 Then
              _CdsAgregItem.FieldByName('BASEDEV').AsFloat := ( FCdsItemDevol.FieldByName('QTDEDEV').AsFloat * _CdsAgregItem.FieldByName('BASECALCULO').AsFloat ) / FCdsItemDevol.FieldByName('QTDERECEBDEVOL').AsFloat;

           _CdsAgregItem.Post;
        end;
        _CdsAgregItem.Next;
     end;
     FCdsItemDevol.Next;
  End;

end;

procedure TCtrlDevolMerc.FazRegra3AgrNfCompl;
begin
   With _CdsAgregNFCompl Do
      Begin
        First;
        While not Eof Do
           Begin
              Edit;
              FieldByName('VLRRECUPDEV').AsFloat := 0;
              FieldByName('VLRAGREGDEV').AsFloat := ( CdsDevol.FieldByName('VLRNOTAFISCAL').AsFloat * FieldByName('VLRAGREGADO').AsFloat ) / CdsNota.FieldByName('VLRNOTAFISCAL').AsFloat;

              If FieldByName('BASECALCULO').AsFloat > 0 Then
                 FieldByName('BASEDEV').AsFloat := ( CdsDevol.FieldByName('VLRNOTAFISCAL').AsFloat * FieldByName('BASECALCULO').AsFloat ) / CdsNota.FieldByName('VLRNOTAFISCAL').AsFloat;
              Post;
              Next;
           End;
      End;
end;

function TCtrlDevolMerc.GetAgregDevol(IdNFRecebDevol: Double): OleVariant;
begin
   with _DtmAlmox Do
      Begin
         spGetAgregDevol.Prepare;
         spGetAgregDevol.ParamByName('IDNFRECEBDEVOL').AsFloat := IdNFRecebDevol;

         Result := spGetAgregDevol.Data;
     End;
end;

function TCtrlDevolMerc.GetAgregItemDevol(
  IdNFRecebDevol: Double): OleVariant;
begin
   with _DtmAlmox Do
      Begin
         spGetAgregDevol.Prepare;
         spGetAgregDevol.ParamByName('IDNFRECEBDEVOL').AsFloat := IdNFRecebDevol;

         Result := spGetAgregDevol.Data;
     End;

end;

function TCtrlDevolMerc.GetQtdeDevol(IdNFRecebDevol: Double;
  CodArtigo: String; IdProdVari: Double): Double;
Var
   SQL : String;
begin
   CodArtigo := Copy(CodArtigo + '                ',1,14);

   SQL := ' SELECT I.QTDERECEBDEVOL AS QTDE '+
          ' FROM ITENSRECEBDEVOL I , NFRECEBDEVOL N '+
          ' WHERE  ( N.IDNFREFERENCIA = '+ FloatToStr( IdNFRecebDevol )+ ')'+
          '    AND ( I.CODARTIGO  =  '+QuotedStr(CodArtigo)+')';
   If IdProdVari > 0 Then
      SQL := SQL + '    AND ( I.IDPRODVARI =  '+FloatToStr( IDProdVari )+')';

   SQL := SQL + '    AND ( N.FLGTIPONOTA = ''D'')'+
                '    AND ( N.IDNFRECEBDEVOL = I.IDNFRECEBDEVOL )';

   _Cds.Data := GetDataPacket( SQL );

   Result := _Cds.FieldByName('QTDE').AsFloat;
end;

function TCtrlDevolMerc.InsereCdsContab(iPlano, UnidNegoc,
  CodSubConta: Double; sDebCre, sConta, sCentroCusto, sHistorico: String;
  Valor: Double): Boolean;
begin
   Result := True;
   FCdsContab.First;
   While (not FCdsContab.Eof) do
   Begin
      if (FCdsContab.FieldByName('PLACONTA').AsString=sConta) AND
         (FCdsContab.FieldByName('CODCENTROCUSTO').AsString=sCentroCusto) AND
         (FCdsContab.FieldByName('UNIDNEGOC').AsFloat=UnidNegoc) AND
         (FCdsContab.FieldByName('CODSUBCONTA').AsFloat=CodSubConta) AND
         (FCdsContab.FieldByName('LACDEBCRE').AsString=sDebCre) AND
         (FCdsContab.FieldByName('HISTORICO').AsString=sHistorico) then
      Begin
         FCdsContab.Edit;
         FCdsContab.FieldByName('LACVALOR').AsFloat:=FCdsContab.FieldByName('LACVALOR').AsFloat+Valor;
         FCdsContab.Post;
         exit;
      End;
      FCdsContab.Next;
   End;
   FCdsContab.Append;
   FCdsContab.FieldByName('PLACONTA').AsString       := sConta;
   FCdsContab.FieldByName('PLANO').AsFloat           := iPlano;
   FCdsContab.FieldByName('CODCENTROCUSTO').AsString := sCentroCusto;
   FCdsContab.FieldByName('UNIDNEGOC').AsFloat       := UnidNegoc;
   FCdsContab.FieldByName('LACVALOR').AsFloat        := Valor;
   FCdsContab.FieldByName('HISTORICO').AsString      := sHistorico;
   FCdsContab.FieldByName('LACNUMDOC').AsString      := trim(FCdsDevol.FieldByName('NUMNF').AsString)+'/'+trim(FCdsDevol.FieldByName('COMPLNF').AsString);
   FCdsContab.FieldByName('LACDEBCRE').AsString      := sDebCre;
   FCdsContab.FieldByName('CODSUBCONTA').AsFloat     := CodSubConta;
   If sDebCre = 'D' then
      FCdsContab.FieldByName('LACTIPO').AsString := '0'
   Else
      FCdsContab.FieldByName('LACTIPO').AsString := '1';
   FCdsContab.Post;
end;

function TCtrlDevolMerc.LancAlterdor(IdPessoa: Integer; IdUsuario,CodAlterardor,
  rAbateValor, rTotImp, rTotRefCalculo: Double; bUsaPlanoPatro: Boolean): Boolean;
begin
   Result := True;
   Try
      _Documento.Prepare(OpLanctoDocum,odlAlterador,sdocAberto);

      _Documento.UsaPlanoPatro := bUsaPlanoPatro;

      _Documento.Lanctodocum.SetValues(FCdsDevol.FieldByName('DATAENTDEVOL').asDateTime,FCdsNota.FieldByName('CODDOCUMENTO').AsInteger,0,
                                      (FCdsDevol.FieldByName('VLRNOTAFISCAL').AsFloat-rAbateValor-rTotImp),0,
                                       FCdsDevol.FieldByName('VLRNOTAFISCAL').AsFloat-rAbateValor,
                                       0,FCdsNota.FieldByName('PLNCODIGO').AsInteger,0,trunc(IdUsuario),
                                       Trunc(IdPessoa),0,0,0,0,Trunc(CodAlterardor),'4 ',
                                         '','','','','','','','D', 5, 0, bUsaPlanoPatro);

      If Not _Documento.Insert Then
         Raise Exception.Create( _Documento.MessageInfo );

   Except
      On E:Exception Do
         Begin
            Result := False;
            MessageInfo := E.Message;
         End;
   End;
end;

function TCtrlDevolMerc.ListContabilizacao(PlnCodigo: Double): OleVariant;
begin
   With _DtmAlmox Do
      Begin
         spListContab.Prepare;
         spListContab.ParamByName('PLNCODIGO').AsFloat := PlnCodigo;

         Result := spListContab.Data;
      End;
end;

function TCtrlDevolMerc.ListDevolucao(IdNFRecebDevol: Double): OleVariant;
begin
  with _DtmAlmox Do
    Begin
       splistRecMerc.Prepare;
       splistRecMerc.ParamByName('IDNFRECEBDEVOL').AsFloat := IdNFRecebDevol;

       Result := spListRecMerc.Data;
    End;
end;

function TCtrlDevolMerc.ListItemDevol(IdNFRecebDevol: Double): OleVariant;
begin
  with _DtmAlmox Do
    Begin
       spListItemDevol.Prepare;
       spListItemDevol.ParamByName('IDNFRECEBDEVOL').AsFloat := IdNFRecebDevol;

       Result := spListItemDevol.Data;
    End;
end;

function TCtrlDevolMerc.ListAgregNFCompl(IdNFRecebDevol: Double): OleVariant;
begin
  with _DtmAlmox Do
    Begin
       spAgregNFComplDevol.Prepare;
       spAgregNFComplDevol.ParamByName('IDNFRECEBDEVOL').AsFloat := IdNFRecebDevol;
       Result := spAgregNFComplDevol.Data;
    End;
end;

procedure TCtrlDevolMerc.OnCreateAppServer;
begin
  inherited;
  FCdsDevol     := TClientDataSet.Create( nil );
  FcdsNota      := TClientDataSet.Create( nil );
  FCdsItemDevol := TClientDataSet.Create( nil );
  FCdsContab    := TClientDataSet.Create( nil );
end;

function TCtrlDevolMerc.ProcessaDevolucao(IdPessoa,
  iUnidNegocPadrao: Double; var rAbateValor, rTotImp,
  rTotRefCalculo: Double; IntegraContab, IntegraLivro: Boolean;
  sCCustoPadrao: String): Boolean;
var rTotal           : Double;
    rTotContaDeb     : Double;
    rTotContaCre     : Double;
    rAbateVlrCompl   : Double;
    rTotRec          : Double;
    rValRecup        : Double;
    rValRef          : Double;
    rDifer           : Double;
    rResto           : Double;
    sHistorico       : String;
    sNomeForn        : String;
    sNomeFantForn    : String;
    sContaForn       : String;
    sCCustoForn      : String;
    sCCustoGrava     : String;
    iSubContaForn    : Double;
    iUnidNegocForn   : Double;
    iPlanoForn       : Double;
    sContaEntrada    : String;
    iUnidNegGrava    : Double;
    iSubContaEntrada : Integer;
    sNomeTipoDoc     : String;
    sNumOC           : String;
    sCodDoc          : String;
begin
   Result := True;
   Try
     FCdsContab.First;
     While not FCdsContab.EOF do
        FCdsContab.Delete;
     //
     _Cds.Data := _ListCAPCAR.ListaDadosForn(IdPessoa,FCdsNota.FieldByName('IDFORCLI').AsFloat);
     sNomeForn     := _Cds.FieldByName('RAZAOSOCIAL').AsString;
     sNomeFantForn := _Cds.FieldByName('NOME').AsString;
     sContaForn    := _Cds.FieldByName('CONTACFORN').AsString;
     sCCustoForn   := _Cds.FieldByName('CODCENTROCUSTO').AsString;
     iSubContaForn := _Cds.FieldByName('CODSUBCONTA').AsFloat;
     iUnidNegocForn:= _Cds.FieldByName('UNIDNEGOC').AsFloat;
     iPlanoForn    := _Cds.FieldByName('PLANO').AsFloat;

     //------------------------------------------------------------------------------------------------------------
     // Pega a descrição  do tipo de documento
     //------------------------------------------------------------------------------------------------------------
     sCodDoc := FCdsNota.FieldByName('CODDOCUMENTO').AsString;
     IF Trim( sCodDoc ) <> '' Then
        Begin
           _Cds.Data    := GetDataPacket( ' SELECT T.DESCRICAO FROM TIPODOCRECPAG T, DOCUMENTO D '+
                                          ' WHERE D.CODDOCUMENTO = '+ sCodDoc +' AND D.CODTIPDOC = T.CODTIPDOC');
           sNomeTipoDoc := _Cds.FieldByName('DESCRICAO').AsString;
        End
     Else
         sNomeTipoDoc := '';
     //
     FazRegra3;
     //
     //Verificando Total da Nota
     rTotal        :=0;
     rTotContaDeb  :=0;
     rTotContaCre  :=0;
     rTotRefCalculo:=0;
     rAbateValor   :=0;
     rAbateVlrCompl:=0;
     rTotImp       :=0;
     rTotRec       :=0;
     rValRecup     :=0;
     //
     FCdsItemDevol.First;
     While not FCdsItemDevol.EOF do
        Begin
           rTotal:=rTotal + (FCdsItemDevol.FieldByName('QTDEDEV').AsFloat*FCdsItemDevol.FieldByName('VLRUNITARIO').AsFloat);
           rTotRefCalculo:=rTotRefCalculo + (FCdsItemDevol.FieldByName('QTDEDEV').AsFloat*FCdsItemDevol.FieldByName('VLRUNITARIO').AsFloat);
           FCdsItemDevol.Next;
        end;
     //
     _CdsAgregNota.First;
     While not _CdsAgregNota.EOF Do
        Begin
           If (_CdsAgregNota.FieldByName('CODTRATFISCE').AsString = '3') or
              (_CdsAgregNota.FieldByName('CODTRATFISCE').AsString = '4') then
              Begin
                 rTotal :=rTotal  + _CdsAgregNota.FieldByName('VLRAGREGDEV').AsFloat;
                 rTotImp:=rTotImp + _CdsAgregNota.FieldByName('VLRAGREGDEV').AsFloat;
                 rTotRec:=rTotRec + _CdsAgregNota.FieldByName('VLRRECUPDEV').AsFloat;
              end;
           If (_CdsAgregNota.FieldByName('CODTRATFISCE').AsString = '6') then
              rTotal:=rTotal - _CdsAgregNota.FieldByName('VLRAGREGDEV').AsFloat;
           //
           _Cds.Data := _RecebMerc.ListaImposto(IdPessoa,_CdsAgregNota.FieldByName('CODTIPOCUSTAGREG').AsFloat);
           //
           sHistorico:='Devolução '+trim(_Cds.FieldByName('DESCCUSTAGREG').AsString)+
                       ' s/ NF. '+trim(FCdsDevol.FieldByName('NUMNF').AsString)+'/'+trim(FCdsDevol.FieldByName('COMPLNF').AsString)+' '+trim(sNomeForn);

           sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,5,3,
                                            sHistorico,
                                            [ FCdsNota.FieldByName('NUMNF').AsString,
                                              FCdsNota.FieldByName('COMPLNF').AsString,
                                              _Cds.FieldByName('DESCCUSTAGREG').AsString,
                                              sNomeForn,
                                              sNomeFantForn,
                                              '0'
                                             ]);
           //
           If (_CdsAgregNota.FieldByName('CODTRATFISCE').AsString = '1') or
              (_CdsAgregNota.FieldByName('CODTRATFISCE').AsString = '5') or
              (_CdsAgregNota.FieldByName('CODTRATFISCE').AsString = '7') then
              Begin
                 InsereCdsContab(_Cds.FieldByName('PLANO').AsFloat, _Cds.FieldByName('UNIDNEGOC').AsFloat,
                                 _Cds.FieldByName('CODSUBCONTA').AsFloat,'D',_Cds.FieldByName('PLACONTA').AsString,
                                 _Cds.FieldByName('CODCENTROCUSTO').AsString,sHistorico,
                                 _CdsAgregNota.FieldByName('VLRAGREGDEV').AsFloat);
                 If (_CdsAgregNota.FieldByName('CODTRATFISCE').AsString = '7') then
                    rAbateValor:=rAbateValor+_CdsAgregNota.FieldByName('VLRAGREGDEV').AsFloat;
                 If (_CdsAgregNota.FieldByName('CODTRATFISCE').AsString = '5') then
                    Begin
                       _CdsAgregNFCompl.Data := ListAgregNFCompl(_CdsAgregNota.FieldByName('IDNFCOMPLEMENTAR').AsFloat);
                       //
                       FazRegra3AgrNfCompl;
                       //
                       _CdsAgregNFCompl.First;
                       While not _CdsAgregNFCompl.EOF do
                          Begin
                             _Cds.Data := _RecebMerc.ListaImposto(IdPessoa,_CdsAgregNFCompl.FieldByName('CODTIPOCUSTAGREG').AsFloat);
                             //
                             sHistorico:='Devolução '+trim(_Cds.FieldByName('DESCCUSTAGREG').AsString)+
                                         ' s/ NF. '+trim(FCdsDevol.FieldByName('NUMNF').AsString)+'/'+trim(FCdsDevol.FieldByName('COMPLNF').AsString)+' '+trim(sNomeForn);

                             sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,5,3,
                                                              sHistorico,
                                                              [ FCdsDevol.FieldByName('NUMNF').AsString,
                                                                FCdsDevol.FieldByName('COMPLNF').AsString,
                                                                _Cds.FieldByName('DESCCUSTAGREG').AsString,
                                                                sNomeForn,
                                                                sNomeFantForn,
                                                                '0'
                                                               ]);

                             If (_CdsAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '1') or
                                (_CdsAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '5') then
                                Begin
                                   InsereCdsContab(_Cds.FieldByName('PLANO').AsFloat, _Cds.FieldByName('UNIDNEGOC').AsFloat,
                                                   _Cds.FieldByName('CODSUBCONTA').AsFloat,'D',_Cds.FieldByName('PLACONTA').AsString,
                                                   _Cds.FieldByName('CODCENTROCUSTO').AsString,sHistorico,
                                                   _CdsAgregNFCompl.FieldByName('VLRAGREGDEV').AsFloat);
                                End;
                             //
                             If (_CdsAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '2') or
                                (_CdsAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '3') then
                                Begin
                                   //Contabilização dos Agregados da Nota que Recuperam Imposto
                                   FCdsItemDevol.First;
                                   While not FCdsItemDevol.EOF do
                                      Begin
                                         rValRef := (FCdsItemDevol.FieldByName('QTDEDEV').AsFloat*FCdsItemDevol.FieldByName('VLRUNITARIO').AsFloat);
                                         If FCdsItemDevol.FieldByName('CONSUMOREVENDA').AsString = 'R' then
                                            Begin
                                               rValRecup:=(_CdsAgregNFCompl.FieldByName('VLRAGREGDEV').AsFloat*rValRef/rTotRefCalculo);
                                               //
                                               _CdsAgregNFCompl.Edit;
                                               _CdsAgregNFCompl.FieldByName('VLRRECUPDEV').AsFloat:=_CdsAgregNFCompl.FieldByName('VLRRECUPDEV').AsFloat+rValRecup;
                                               _CdsAgregNFCompl.Post;
                                               //
                                               InsereCdsContab(_Cds.FieldByName('PLANO').AsFloat, _Cds.FieldByName('UNIDNEGOC').AsFloat,
                                                               _Cds.FieldByName('CODSUBCONTA').AsFloat,'C',_Cds.FieldByName('PLACONTA').AsString,
                                                               _Cds.FieldByName('CODCENTROCUSTO').AsString,sHistorico, rValRecup);
                                            end;
                                         FCdsItemDevol.Next;
                                      end;
                                end;
                             _CdsAgregNFCompl.Next;
                          end;
                    end;
              end;

           If (_CdsAgregNota.FieldByName('CODTRATFISCE').AsString = '2') or
              (_CdsAgregNota.FieldByName('CODTRATFISCE').AsString = '3') then
               Begin
                  //Contabilização dos Agregados da Nota que Recuperam Imposto
                  FCdsItemDevol.First;
                  While not FCdsItemDevol.EOF do
                  Begin
                     rValRef := (FCdsItemDevol.FieldByName('QTDEDEV').AsFloat * FCdsItemDevol.FieldByName('VLRUNITARIO').AsFloat);

                     if FCdsItemDevol.FieldByName('CONSUMOREVENDA').AsString = 'R' then
                     Begin
                        rValRecup:=(_CdsAgregNota.FieldByName('VLRAGREGDEV').AsFloat*rValRef/rTotRefCalculo);
                        _CdsAgregNota.Edit;
                        _CdsAgregNota.FieldByName('VLRRECUPDEV').AsFloat := _CdsAgregNota.FieldByName('VLRRECUPDEV').AsFloat+rValRecup;
                        _CdsAgregNota.Post;

                        InsereCdsContab(_Cds.FieldByName('PLANO').AsFloat, _Cds.FieldByName('UNIDNEGOC').AsFloat,
                                        _Cds.FieldByName('CODSUBCONTA').AsFloat,'C',_Cds.FieldByName('PLACONTA').AsString,
                                        _Cds.FieldByName('CODCENTROCUSTO').AsString,sHistorico, rValRecup);

                     end;
                     FCdsItemDevol.Next;
                  end;
               end;
           _CdsAgregNota.Next;
        End;

     _CdsAgregItem.First;
     While not _CdsAgregItem.EOF do
     Begin
        if (_CdsAgregItem.FieldByName('CODTRATFISCE').AsString = '7') then
        Begin
           _Cds.Data := _RecebMerc.ListaImposto(IdPessoa,_CdsAgregItem.FieldByName('CODTIPOCUSTAGREG').AsFloat);
           //
           sHistorico:='Devolução '+trim(_Cds.FieldByName('DESCCUSTAGREG').AsString)+
                       ' s/ NF. '+trim(FCdsDevol.FieldByName('NUMNF').AsString)+'/'+trim(FCdsDevol.FieldByName('COMPLNF').AsString)+' '+trim(sNomeForn);

           sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,5,3,
                                            sHistorico,
                                            [ FCdsDevol.FieldByName('NUMNF').AsString,
                                              FCdsDevol.FieldByName('COMPLNF').AsString,
                                              _Cds.FieldByName('DESCCUSTAGREG').AsString,
                                              sNomeForn,
                                              sNomeFantForn,
                                              '0'
                                             ]);

           InsereCdsContab(_Cds.FieldByName('PLANO').AsFloat, _Cds.FieldByName('UNIDNEGOC').AsFloat,
                           _Cds.FieldByName('CODSUBCONTA').AsFloat,'D',_Cds.FieldByName('PLACONTA').AsString,
                           _Cds.FieldByName('CODCENTROCUSTO').AsString,sHistorico, rValRecup);

            rAbateValor := rAbateValor + _CdsAgregNota.FieldByName('VLRAGREGDEV').AsFloat;
        end;
        if (_CdsAgregItem.FieldByName('CODTRATFISCE').AsString = '3') or
           (_CdsAgregItem.FieldByName('CODTRATFISCE').AsString = '4') then
           Begin
              rTotal  := rTotal  + _CdsAgregItem.FieldByName('VLRAGREGDEV').AsFloat;
              rTotImp := rTotImp + _CdsAgregItem.FieldByName('VLRAGREGDEV').AsFloat;
              rTotRec := rTotRec + _CdsAgregItem.FieldByName('VLRRECUPDEV').AsFloat;
           end;
         if (_CdsAgregItem.FieldByName('CODTRATFISCE').AsString = '6') then
             rTotal := rTotal - _CdsAgregItem.FieldByName('VLRAGREGDEV').AsFloat;

        _CdsAgregItem.Next;
     end;
     rResto := (rTotal - FCdsDevol.FieldByName('VLRNOTAFISCAL').AsFloat );
     if Format('%17.2f',[rTotal]) <> Format('%17.2f',[FCdsDevol.FieldByName('VLRNOTAFISCAL').AsFloat]) then
       If Abs(rResto) > MAX_DIFERENCA Then
          Raise Exception.Create(MSG_TOTAL_NAO_BATE);

     //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     //Inserindo na Contabilidade o Valor a pagar da Nota
     //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     sCCustoGrava := sCCustoForn;
     if sCCustoGrava = '' then
        sCCustoGrava := sCCustoPadrao;

     sNumOC := '';

     FCdsItemDevol.First;
     While not FCdsItemDevol.EOF do
        Begin
            If Not FCdsItemDevol.FieldByName('NUMOC').IsNull Then
               If sNumOC <> '' Then
                  sNumOC := sNumOC + ', ' + FCdsItemDevol.FieldByName('NUMOC').AsString
               Else
                  sNumOC := FCdsItemDevol.FieldByName('NUMOC').AsString;

            FCdsItemDevol.Next;
        End;

     sHistorico:='NF. '+trim(FCdsDevol.FieldByName('NUMNF').AsString)+'/'+trim(FCdsNota.FieldByName('COMPLNF').AsString)+' '+trim(sNomeForn)+' ref. Devolução NF. '+trim(FCdsNota.FieldByName('NUMNF').AsString)+'/'+Trim(FCdsNota.FieldByName('COMPLNF').AsString)+' '+trim(trim(sNomeForn));

     sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,5,1,
                                      sHistorico,
                                      [ FCdsDevol.FieldByName('NUMNF').AsString,
                                        FCdsDevol.FieldByName('COMPLNF').AsString,
                                        FCdsNota.FieldByName('NUMNF').AsString,
                                        FCdsNota.FieldByName('COMPLNF').AsString,
                                        sNomeTipoDoc,
                                        sNomeForn,
                                        sNomeFantForn,
                                        sNumOC
                                       ]);

     InsereCdsContab(iPlanoForn,iUnidNegocPadrao,iSubContaForn,'D',sContaForn,
                     sCCustoGrava,sHistorico,
                     (FCdsDevol.FieldByName('VLRNOTAFISCAL').AsFloat-rAbateValor));

     //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     //Calculando o Valor do Estoque de Cada Item
     //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     FCdsItemDevol.First;
     While not FCdsItemDevol.EOF do
        Begin
           if Not IsFloatZero(FCdsItemDevol.FieldByName('QTDEDEV').AsFloat) then
              Begin
                 _CdsAgregItem.First;
                 While not _CdsAgregItem.EOF do
                    Begin
                       if _CdsAgregItem.FieldByName('IDITENSRECDEV').AsInteger = FCdsItemDevol.FieldByName('IDITENSRECDEV').AsInteger then
                          Begin
                             if (_CdsAgregItem.FieldByName('CODTRATFISCE').AsString = '1') then
                                Begin
                                   _Cds.Data := _RecebMerc.ListaImposto(IdPessoa,_CdsAgregItem.FieldByName('CODTIPOCUSTAGREG').AsFloat);
                                   //
                                   sHistorico := 'Devolução '+trim(_Cds.FieldByName('DESCCUSTAGREG').AsString)+
                                                 ' s/ NF. '+trim(FCdsDevol.FieldByName('NUMNF').AsString)+'/'+trim(FCdsDevol.FieldByName('COMPLNF').AsString)+' '+trim(sNomeForn);

                                   sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,5,3,
                                                                    sHistorico,
                                                                    [ FCdsDevol.FieldByName('NUMNF').AsString,
                                                                      FCdsDevol.FieldByName('COMPLNF').AsString,
                                                                      _Cds.FieldByName('DESCCUSTAGREG').AsString,
                                                                      sNomeForn,
                                                                      sNomeFantForn,
                                                                      '0'
                                                                     ]);

                                   InsereCdsContab(_Cds.FieldByName('PLANO').AsFloat, _Cds.FieldByName('UNIDNEGOC').AsFloat,
                                                   _Cds.FieldByName('CODSUBCONTA').AsFloat,'D',_Cds.FieldByName('PLACONTA').AsString,
                                                   _Cds.FieldByName('CODCENTROCUSTO').AsString,sHistorico, rValRecup);

                                end;
                             if FCdsItemDevol.FieldByName('CONSUMOREVENDA').AsString = 'R' then
                                Begin
                                   if (_CdsAgregItem.FieldByName('CODTRATFISCE').AsString = '2') or
                                      (_CdsAgregItem.FieldByName('CODTRATFISCE').AsString = '3') then
                                      Begin
                                         _Cds.Data := _RecebMerc.ListaImposto(IdPessoa,_CdsAgregItem.FieldByName('CODTIPOCUSTAGREG').AsFloat);
                                         //
                                         sHistorico := 'Devolução '+trim(_Cds.FieldByName('DESCCUSTAGREG').AsString)+
                                                       ' s/ NF. '+trim(FCdsDevol.FieldByName('NUMNF').AsString)+'/'+trim(FCdsDevol.FieldByName('COMPLNF').AsString)+' '+trim(sNomeForn);

                                         sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,5,3,
                                                                          sHistorico,
                                                                          [ FCdsDevol.FieldByName('NUMNF').AsString,
                                                                            FCdsDevol.FieldByName('COMPLNF').AsString,
                                                                            _Cds.FieldByName('DESCCUSTAGREG').AsString,
                                                                            sNomeForn,
                                                                            sNomeFantForn,
                                                                            '0'
                                                                           ]);

                                         _CdsAgregItem.Edit;
                                         _CdsAgregItem.FieldByName('VLRRECUPDEV').AsFloat := _CdsAgregItem.FieldByName('VLRAGREGDEV').AsFloat;
                                         _CdsAgregItem.Post;

                                         InsereCdsContab(_Cds.FieldByName('PLANO').AsFloat, _Cds.FieldByName('UNIDNEGOC').AsFloat,
                                                         _Cds.FieldByName('CODSUBCONTA').AsFloat,'D',_Cds.FieldByName('PLACONTA').AsString,
                                                         _Cds.FieldByName('CODCENTROCUSTO').AsString,sHistorico, _CdsAgregItem.FieldByName('VLRAGREGDEV').AsFloat);
                                      End;
                                End;
                          End;
                       _CdsAgregItem.Next;
                    End;
                 //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                 //Contabilizando o valor do estoque
                 //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                  _Cds.Data := _IntegracaoContabil.PegaContaContab(Trunc(IdPessoa), FCdsItemDevol.FieldByName('CODARTIGO').AsString,
                                                                   FCdsItemDevol.FieldByName('CODCENTROCUSTO').AsString,
                                                                   FCdsItemDevol.FieldByName('CODALMOXARIFADO').AsInteger,
                                                                   FCdsItemDevol.FieldByName('CODGRUPOPROD').AsString);
                  if FCdsItemDevol.FieldByName('FLGDESTINO').AsString = 'C' then
                     begin
                        sContaEntrada    := _Cds.FieldByName('CONTASAIDA').AsString;
                        iSubContaEntrada := _Cds.FieldByName('SUBCONTASAIDA').AsInteger;
                     end
                  else
                     begin
                        sContaEntrada    := _Cds.FieldByName('CONTAENTRADA').AsString;
                        iSubContaEntrada := _Cds.FieldByName('SUBCONTAENTRADA').AsInteger;
                     end;

                  sHistorico := 'NF. '+trim(FCdsDevol.FieldByName('NUMNF').AsString)+'/'+trim(FCdsNota.FieldByName('COMPLNF').AsString)+' '+trim(sNomeForn)+' ref. Devolução NF. '+trim(FCdsNota.FieldByName('NUMNF').AsString)+'/'+Trim(FCdsNota.FieldByName('COMPLNF').AsString)+' '+trim(trim(sNomeForn));

                  sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,5,1,
                                                   sHistorico,
                                                   [ FCdsDevol.FieldByName('NUMNF').AsString,
                                                     FCdsDevol.FieldByName('COMPLNF').AsString,
                                                     FCdsNota.FieldByName('NUMNF').AsString,
                                                     FCdsNota.FieldByName('COMPLNF').AsString,
                                                     sNomeTipoDoc,
                                                     sNomeForn,
                                                     sNomeFantForn,
                                                     sNumOC
                                                    ]);

                  sCCustoGrava := FCdsItemDevol.FieldByName('CODCENTROCUSTO').AsString;
                  if sCCustoGrava = '' Then
                     sCCustoGrava := sCCustoPadrao;
                  //
                  InsereCdsContab(_cds.FieldByName('PLANO').AsFloat,_cds.FieldByName('UNIDNEGOC').AsFloat,
                                  iSubContaEntrada,'C', sContaEntrada, sCCustoGrava,sHistorico,
                                  FCdsItemDevol.FieldByName('VLRDEV').AsFloat);
               End;
           FCdsItemDevol.Next;
        End;
     //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     //Verifica se o valor total da Nota bate
     //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     FCdsContab.First;
     While not FCdsContab.EOF do
     Begin
        if FCdsContab.FieldByName('LACDEBCRE').AsString = 'D' then
           rTotContaDeb := rTotContaDeb + FCdsContab.FieldByName('LACVALOR').AsFloat
        else
           rTotContaCre := rTotContaCre + FCdsContab.FieldByName('LACVALOR').AsFloat;
        FCdsContab.Next;
     end;

     if Format('%17.2f',[rTotContaDeb]) <> Format('%17.2f',[rTotContaCre]) then
        begin
          rDifer:=(rTotContaCre - rTotContaDeb);
          if (rDifer >= -MAX_DIFERENCA) and (rDifer <= MAX_DIFERENCA) then
             Begin
                sHistorico := 'NF. '+trim(FCdsDevol.FieldByName('NUMNF').AsString)+'/'+trim(FCdsNota.FieldByName('COMPLNF').AsString)+' '+trim(sNomeForn)+' ref. Devolução NF. '+trim(FCdsNota.FieldByName('NUMNF').AsString)+'/'+Trim(FCdsNota.FieldByName('COMPLNF').AsString)+' '+trim(trim(sNomeForn));

                sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,5,1,
                                                 sHistorico,
                                                 [ FCdsDevol.FieldByName('NUMNF').AsString,
                                                   FCdsDevol.FieldByName('COMPLNF').AsString,
                                                   FCdsNota.FieldByName('NUMNF').AsString,
                                                   FCdsNota.FieldByName('COMPLNF').AsString,
                                                   sNomeTipoDoc,
                                                   sNomeForn,
                                                   sNomeFantForn,
                                                   sNumOC
                                                  ]);

                FCdsItemDevol.First;
                While not FCdsItemDevol.EOF do
                   Begin
                      if Not IsFloatZero(FCdsItemDevol.FieldByName('QTDEDEV').AsFloat) Then
                         Begin
                            //Contabilizando o valor do estoque
                            _Cds.Data := _IntegracaoContabil.PegaContaContab(Trunc(IdPessoa), FCdsItemDevol.FieldByName('CODARTIGO').AsString,
                                                                             FCdsItemDevol.FieldByName('CODCENTROCUSTO').AsString,
                                                                             FCdsItemDevol.FieldByName('CODALMOXARIFADO').AsInteger,
                                                                             FCdsItemDevol.FieldByName('CODGRUPOPROD').AsString);

                            if FCdsItemDevol.FieldByName('FLGDESTINO').AsString = 'C' then
                               begin
                                  sContaEntrada    := _Cds.FieldByName('CONTASAIDA').AsString;
                                  iSubContaEntrada := _Cds.FieldByName('SUBCONTASAIDA').AsInteger;
                               end
                            else
                               begin
                                  sContaEntrada    := _Cds.FieldByName('CONTAENTRADA').AsString;
                                  iSubContaEntrada := _Cds.FieldByName('SUBCONTAENTRADA').AsInteger;
                               end;

                            sCCustoGrava := FCdsItemDevol.FieldByName('CODCENTROCUSTO').AsString;
                            if sCCustoGrava = '' Then
                               sCCustoGrava := sCCustoPadrao;

                            If rDifer > 0 then
                               InsereCdsContab(_cds.FieldByName('PLANO').AsFloat,_cds.FieldByName('UNIDNEGOC').AsFloat,
                                               iSubContaEntrada,'D', sContaEntrada, sCCustoGrava,sHistorico,
                                                rDifer)
                            Else
                               InsereCdsContab(_cds.FieldByName('PLANO').AsFloat,_cds.FieldByName('UNIDNEGOC').AsFloat,
                                               iSubContaEntrada,'C', sContaEntrada, sCCustoGrava,sHistorico,
                                                rDifer);

                            FCdsItemDevol.Edit;
                            FCdsItemDevol.FieldByName('VLRDEV').AsFloat := FCdsItemDevol.FieldByName('VLRDEV').AsFloat+rDifer;
                            FCdsItemDevol.Post;
                            Break;
                         End;
                      FCdsItemDevol.Next;
                   End;
             End
          Else
             Raise Exception.Create( MSG_DEBITO_NAO_BATEU );
        End;
   Except
      On E:Exception Do
         Begin
            Result := False;
            MessageInfo := E.Message;
         End;
   End;
end;

function TCtrlDevolMerc.ProcessaItemDevol(IdPessoa,IdItensRecDev, PlnCodigo: Double): Boolean;
Var
   IdMovEntrada : Double;
   IdMov        : Double;
   CdsAgregItem : TClientDataSet;
   SQL          : String;
Begin
   Result       := True;
   Try
      //-------------------------------------------------------------------------------------------------------------------
      // Gera a Movimentação de Estoque
      //-------------------------------------------------------------------------------------------------------------------
      IdMovEntrada := 0;
      IdMov        := 0;

      If (FCdsItemDevol.FieldByName('FLGDESTINO').AsString = 'E') Or (FCdsItemDevol.FieldByName('FLGDESTINO').AsString = 'C') Then
         Begin
            IF FCdsItemDevol.FieldByName('FLGDESTINO').AsString = 'C' Then
               Begin
                  IdMov := _MovEstoque.GeraMovimento(tlEntrada,
                                                     Trunc(IdPessoa),
                                                     _dbItemNota.VLRESTOQUE.AsFloat,
                                                     _dbItemNota.QTDERECEBDEVOL.AsFloat,
                                                     FCdsItemDevol.FieldByName('CODCUSTEIO').AsInteger,
                                                     FCdsItemDevol.FieldByName('CODALMOXARIFADO').AsInteger,
                                                     _dbItemNota.CODARTIGO.AsString,
                                                     '',
                                                     'P',
                                                     _dbItemNota.CODMEDIDA.AsString,
                                                     _dbItemNota.DATAVALIDADE.AsDateTime,
                                                     _dbNota.DATAENTDEVOL.AsDateTime,
                                                     _dbNota.NUMNF.AsString+'/'+_dbNota.COMPLNF.AsString,
                                                     _dbItemNota.CODCENTROCUSTO.AsString,
                                                     _dbNota.IDPESSOA.AsInteger,
                                                     -1,
                                                     _dbItemNota.UNIDNEGOC.AsInteger);
                   If IdMov < 0 Then
                      Raise Exception.Create( _MovEstoque.MessageInfo );
               End;

             IdMovEntrada :=  _MovEstoque.GeraMovimento(tlEntrada,
                                                        Trunc(IdPessoa),
                                                        FCdsItemDevol.FieldByName('VLRDEV').AsFloat*-1,
                                                        FCdsItemDevol.FieldByName('QTDEDEV').AsFloat*-1,
                                                        FCdsItemDevol.FieldByName('CODCUSTEIO').AsInteger,
                                                        FCdsItemDevol.FieldByName('CODALMOXARIFADO').AsInteger,
                                                        _dbItemNota.CODARTIGO.AsString,
                                                        '',
                                                        'K',
                                                        _dbItemNota.CODMEDIDA.AsString,
                                                        _dbItemNota.DATAVALIDADE.AsDateTime,
                                                        _dbNota.DATAENTDEVOL.AsDateTime,
                                                        _dbNota.NUMNF.AsString+'/'+_dbNota.COMPLNF.AsString,
                                                        '',
                                                        -1,
                                                        -1,
                                                        _dbItemNota.UNIDNEGOC.AsInteger);
             If IdMovEntrada < 0 Then
                Raise Exception.Create( _MovEstoque.MessageInfo );


             IF FCdsItemDevol.FieldByName('FLGDESTINO').AsString = 'C' Then
                // Na devolução o idmoventrada é invertido
                If Not _MovEstoque.UpdMovimento(IdMovEntrada, IdMov ,Trunc(plnCodigo)) Then
                   Raise Exception.Create( _MovEstoque.MessageInfo );

         End;

         SQL := ' UPDATE ITENSRECEBDEVOL SET IDMOV = '+ FloatToStr(IdMovEntrada)+
                ' WHERE (IDITENSRECDEV = '+FloatToStr(IdItensRecDev)+')';
         If Not ExecSQL (SQL,True) Then
            Raise Exception.Create( MessageInfo );
      //-------------------------------------------------------------------------------------------------------------------
      // Gera os imposto da nota de Devolução
      //-------------------------------------------------------------------------------------------------------------------
      _CdsAgregItem.Filter   := 'IDITENSRECDEV ='+CdsItemDevol.FieldByName('IDITENSRECDEV').AsString ;
      _CdsAgregItem.Filtered := True;
      Try
         _CdsAgregItem.First;
         While Not _CdsAgregItem.Eof Do
            Begin
                If _CdsAgregItem.FieldByName('VLRAGREGDEV').AsFloat <> 0 Then
                   Begin
                      _dbAgregItemNota.IDITENSRECDEV.AsFloat     := IdItensRecDev;
                      _dbAgregItemNota.ICODTIPOCUSTAGREG.AsFloat := _CdsAgregItem.FieldByName('CODTIPOCUSTAGREG').AsFloat;
                      _dbAgregItemNota.IALIQUOTA.AsFloat         := _CdsAgregItem.FieldByName('ALIQUOTA').AsFloat;
                      _dbAgregItemNota.IBASECALCULO.AsFloat      := _CdsAgregItem.FieldByName('VLRAGREGDEV').AsFloat;
                      _dbAgregItemNota.IVLRAGREGADO.AsFloat      := _CdsAgregItem.FieldByName('BASEDEV').AsFloat;
                      _dbAgregItemNota.IVLRRECUPERADO.AsFloat    := _CdsAgregItem.FieldByName('VLRRECUPDEV').AsFloat;

                      If Not _dbAgregItemNota.Insert Then
                         Raise Exception.Create( _dbAgregItemNota.MessageInfo );
                   End;

                _CdsAgregItem.Next;
            End;
      Finally
         _CdsAgregItem.Filter   := '';
         _CdsAgregItem.Filtered := False;
      End;

   Except
      On E:Exception Do
         Begin
            Result := False;
            MessageInfo := E.Message;
         End;
   End;
end;

procedure TCtrlDevolMerc.SetCdsContab(const Value: TClientDataSet);
begin
  FCdsContab := Value;
end;

procedure TCtrlDevolMerc.SetCdsDevol(const Value: TClientDataSet);
begin
  FCdsDevol := Value;
end;

procedure TCtrlDevolMerc.SetCdsItemDevol(const Value: TClientDataSet);
begin
  FCdsItemDevol := Value;
end;

procedure TCtrlDevolMerc.SetCdsNota(const Value: TClientDataSet);
begin
  FCdsNota := Value;
end;

function TCtrlDevolMerc.ValidaDadosDevol: Boolean;
Var
   iContador : Integer;
begin
  iContador := 0;
  Result := True;
  Try
     If FcdsDevol.FieldByName('NUMNF').IsNull Then
        Raise Exception.Create( MSG_NUMNOTA_NAO_PREENCH );

     If FcdsDevol.FieldByName('DATAEMISNF').IsNull Then
        Raise Exception.Create( MSG_DATAEMISS_NAO_PREENCH );

     If FcdsDevol.FieldByName('DATAENTDEVOL').IsNull Then
        Raise Exception.Create( MSG_DATADEVOL_NAO_PREENCH );

     If FcdsDevol.FieldByName('DATAENTDEVOL').AsDateTime > FCdsDevol.FieldByName('DATAENTDEVOL').AsDateTime Then
        Raise Exception.Create( MSG_DATADEVOL_MAIOR );

     FCdsItemDevol.First;
     While not FCdsItemDevol.EOF do
     Begin
         if Not IsFloatZero(FCdsItemDevol.FieldByName('QTDEDEV').AsFloat) then
            Begin
               If (Not VerifQtdeDevol(FCdsNota.FieldByName('IDPESSOA').AsFloat,
                                      FCdsNota.FieldByName('IDNFRECEBDEVOL').AsFloat,
                                      FCdsItemDevol.FieldByName('CODALMOXARIFADO').AsInteger,
                                      FCdsDevol.FieldByName('DATAENTDEVOL').AsFloat,
                                      FCdsItemDevol.FieldByName('CODARTIGO').AsString,
                                      FCdsItemDevol.FieldByName('CODMEDIDA').AsString,
                                      FCdsItemDevol.FieldByName('QTDEDEV').AsFloat,
                                      FCdsItemDevol.FieldByName('QTDERECEBDEVOL').AsFloat )) And (FCdsItemDevol.FieldByName('FLGDESTINO').AsString = 'E')
               Then
                  Begin
                     Raise Exception.Create(FCdsItemDevol.FieldByName('DESCPROD').AsString + MSG_NAO_QTDEDEVOL );
                  End;
               inc(iContador);
            end;
        FCdsItemDevol.Next;
     end;

     If iContador = 0  Then
        Raise Exception.Create( MSG_NAO_HA_ITEMNOTA );

  Except
     On E:Exception Do
      Begin
         Result := False;
         MessageInfo := E.Message;
      End;
  End;

end;

function TCtrlDevolMerc.verifQtdeDevol(IdPessoa,IdNFRecebDevol, CodAlmoxarifado: Double;
  Data : TDateTime; CodArtigo, CodMedida: String; QtdeDevol,QtdeReceb: Double): Boolean;
Var
   rQtde : Double;
   SQL   : String;
begin
   Result := True;
   Try
      CodArtigo := Copy(CodArtigo + '                        ',1,14);

      rQtde     := _UnMedida.QtdeToUnCustoMedio(CodArtigo,CodMedida,QtdeDevol);

      If _MovEstoque.InfoSaldo(Trunc(IdPessoa),CodArtigo,Trunc(CodAlmoxarifado), Data ) < rQtde Then
         Raise Exception.Create( MSG_NAO_QTDEDEVOL );

      SQL := ' SELECT SUM(I.QTDERECEBDEVOL) AS QTDE '+
             ' FROM ITENSRECEBDEVOL I , NFRECEBDEVOL N '+
             ' WHERE  ( N.IDNFREFERENCIA = '+ FloatToStr(IdNFRecebDevol)+ ')'+
             '    AND ( I.CODARTIGO = '+QuotedStr(CodArtigo)+')'+
             '    AND ( N.FLGTIPONOTA = ''D'')'+
             '    AND ( N.IDNFRECEBDEVOL = I.IDNFRECEBDEVOL )';

      _Cds.Data := GetDataPacket( SQL );

      If (Not _Cds.IsEmpty) And ( Not _Cds.FieldByName('Qtde').IsNull) Then
         rQtde := (StrToFloat(FormatFloat('#0.00000',QtdeReceb)) -  StrToFloat(FormatFloat('#0.00000',_Cds.FieldByName('QTDE').AsFloat))) -  StrToFloat(FormatFloat('#0.00000',rQtde))
      Else
         rQtde := StrToFloat(FormatFloat('#0.00000',QtdeReceb)) - StrToFloat(FormatFloat('#0.00000',rQtde));

      If rQtde < 0 Then
         Raise Exception.Create( MSG_NAO_QTDEDEVOL );

   Except
      On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
   End;

end;

procedure TCtrlDevolMerc.DoChangeDataBase;
begin
  inherited;
  _dbNota.DataBaseName          := DataBaseName;
  _dbItemNota.DataBaseName      := DataBaseName;
  _dbAgregItemNota.DataBaseName := DataBaseName;
  _dbAgregNota.DataBaseName     := DataBaseName;

end;

function TCtrlDevolMerc.TotalArtigoDevolvido(IdNFRecebDevol: Double;
  CodArtigo: String; IdProdVari: Double): Double;
Var
   SQL : String;
   cdsTotArtigo: TClientDataSet;
begin

   cdsTotArtigo := TClientDataSet.Create(nil);
   CodArtigo := Copy(CodArtigo + '                ',1,14);

   SQL := ' SELECT NVL(SUM(I.QTDERECEBDEVOL), 0) AS QTDE'+
          ' FROM ITENSRECEBDEVOL I , NFRECEBDEVOL N '+
          ' WHERE  ( N.IDNFREFERENCIA = '+ FloatToStr( IdNFRecebDevol )+ ')'+
          '    AND ( I.CODARTIGO  =  '+QuotedStr(CodArtigo)+')';
   If IdProdVari > 0 Then
      SQL := SQL + '    AND ( I.IDPRODVARI =  '+FloatToStr( IDProdVari )+')';

   SQL := SQL + '    AND ( N.FLGTIPONOTA = ''D'')'+
                '    AND ( N.IDNFRECEBDEVOL = I.IDNFRECEBDEVOL )';

   cdsTotArtigo.Data := GetDataPacket( SQL );
   Result := cdsTotArtigo.FieldByName('QTDE').AsFloat;

   FreeAndNil(cdsTotArtigo);
end;

end.
