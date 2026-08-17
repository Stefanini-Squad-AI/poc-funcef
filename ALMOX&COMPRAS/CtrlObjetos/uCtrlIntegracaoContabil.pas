unit uCtrlIntegracaoContabil;

interface

Uses DB, uDataBase, uCmControlObject,Classes,uCtrlAlmox, DAlmoxarifado,
     dbclient, sysutils,uSistema, uMidasUtil, uCMTypes, uCtrlMovEstoque,
     uCtrlLancamento,jclMath, uCtrlContaContabil,
     uListaCamposHistAlmox, uCtrlModeloHistorico;

Const
   MAX_DIFERENCA       = 2.00;
   ZERO                = 0.00;
   SQL_PARTIDA_DOBRADA = ' SELECT '+
                         '     P.PLNDATDIA, '+
                         '     L.PLANO, '+
                         '     L.PLACONTA AS CONTADEBITO, '+
                         '     L.CODSUBCONTA AS CODSUBCONTADEBITO, '+
                         '     L.CODCENTROCUSTO AS CODCENTROCUSTODEBITO, '+
                         '     L.PLACONTA AS CONTACREDITO, '+
                         '     L.CODSUBCONTA AS CODSUBCONTACREDITO, '+
                         '     L.CODCENTROCUSTO AS CODCENTROCUSTOCREDITO, '+
                         '     L.UNIDNEGOC, '+
                         '     L.LACNUMDOC, '+
                         '     L.LACVALOR, '+
                         '     L.LACVALHIST, '+
                         '     (L.LACHIST1||L.LACHIST2||L.LACHIST3||L.LACHIST4|| L.LACHIST5) AS HISTORICO '+
                         'FROM LANCAMENTO L,  '+
                         '     PLANILHA P  '+
                         'WHERE 1=2' ;
   //MENSAGENS
   MSG_POSTERIOR_DATAREP = 'Proibido rodar integração com data posterior a data represa ';
   MSG_NAO_DADOSINTEGRAR = 'Não há dados para Integração Contábil ';
   MSG_OBRIGATORIO_CC    = 'Obrigatório preecher o centro de custo da Conta ';
   MSG_DEBITO_NAO_BATE   = 'Débito não bate com o crédito. Diferença de ';
   MSG_INTEGRACAO_FIM    = 'Integração Contábil concluída ';
   MSG_EXCLUI_INTEGR_FIM = 'Exclusão da Integração Contábil concluída ';
   MSG_NAO_DADOS_EXCLUIR = 'Não há dados para Exclusão da Integração Contábil ';
   MSG_DIA               = 'Integração do Dia ';

Type
  TCtrlIntegracaoContabil = class(TCmControlObject)
  Protected
     Procedure AfterInitialize; Override;
  private
   _Almox         : TCtrlAlmox;
   _MovEstoque    : TCtrlMovEstoque;
   _Lancamento    : TCtrlLancamento;
   _ContaContabil : TCtrlContaContabil;
   _DtmAlmox      : TDtmAlmoxarifado;
   _ModeloHist    : TCtrlModeloHistorico;
  public
    Constructor Create; Override;
    Destructor  Destroy; Override;
    {**
       Gera uma lista com os movimentos de estoque não integrados no
       período determinado, por empresa.
    **}
    Function ListIntegraContab( IdPessoa : Integer;
                                DataIni  : TDateTime;
                                DataFim  : TDateTime ) : OleVariant;

   {**
      Pega a contabilização do artigo, para integração dos custo
   **}
   Function PegaContaContab( IdPessoa        : Integer;
                             CodArtigo       : String;
                             CodCentroCusto  : String;
                             CodAlmoxarifado : Integer;
                             CodGrupoProd    : String ) : OleVariant;

   {**
      Rotina responsável pela integração dos movimentos de estoque do
      almoxarifado com a contabilidade
   **}
   Function Integrar ( IdPessoa          : Integer;
                       DataIni           : TDateTime;
                       DataFim           : TDateTime;
                       ContabilizaTransf : Boolean;
                       UsaPlanoPrev      : Boolean;
                       IdModulo          : Double;
                       IdUsuario         : Double;
                       IdPatro           : Double;
                       IdPlanoPrev       : Double;
                       Bilhete           : String ) : Boolean;

   {**
      Rotina responsável pela integração dos movimentos de estoque do
      almoxarifado com a contabilidade
   **}
   Function IntegrarPartidaDobrada ( IdPessoa          : Integer;
                                     DataIni           : TDateTime;
                                     DataFim           : TDateTime;
                                     ContabilizaTransf : Boolean;
                                     UsaPlanoPrev      : Boolean;
                                     IdModulo          : Double;
                                     IdUsuario         : Double;
                                     IdPatro           : Double;
                                     IdPlanoPrev       : Double;
                                     Bilhete           : String ) : Boolean;
   {**
      Rotina responsável pela integração dos movimentos de estoque do
      almoxarifado com a contabilidade
   **}
   Function ExcluirItegrarcao ( IdPessoa          : Integer;
                                Data              : TDateTime;
                                UsaPlanoPrev      : Boolean;
                                IdModulo          : Double;
                                IdUsuario         : Double;
                                Bilhete           : String ) : Boolean;
  End;

implementation

{ TCtrlIntegracaoContabil }

procedure TCtrlIntegracaoContabil.AfterInitialize;
begin
  inherited;
  _MovEstoque.InitializeAs(self);
  _Almox.InitializeAs(self);
  _Lancamento.InitializeAs(self);
  _ContaContabil.InitializeAs(self);
  _ModeloHist.InitializeAs(self);
end;

constructor TCtrlIntegracaoContabil.Create;
begin
  inherited;
  _Almox         := TCtrlAlmox.Create;
  _DtmAlmox      := TDtmAlmoxarifado.Create(nil);
  _MovEstoque    := TCtrlMovEstoque.Create;
  _Lancamento    := TCtrlLancamento.Create;
  _ContaContabil := TCtrlContaContabil.Create;
  _ModeloHist    := TCtrlModeloHistorico.Create;
end;

destructor TCtrlIntegracaoContabil.Destroy;
begin
   _Almox.Free;
   _DtmAlmox.Free;
   _MovEstoque.Free;
   _Lancamento.Free;
   _ContaContabil.Free;
   _ModeloHist.Free;
  inherited;
end;

function TCtrlIntegracaoContabil.ExcluirItegrarcao(IdPessoa: Integer;
  Data: TDateTime; UsaPlanoPrev: Boolean; IdModulo, IdUsuario : Double; Bilhete: String): Boolean;
Var
   SQL         : String;
   iMaxValor   : Integer;
   iProgresso  : Integer;
begin
Result := True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ExcluirItegrarcao(IdPessoa, Data, UsaPlanoPrev, IdModulo, IdUsuario, Bilhete );
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      Try
         StartTransaction;

         With _DtmAlmox Do
            Begin
               spListMovPlanilha.Prepare;
               spListMovPlanilha.ParamByName('DATA').AsDate        := Data;
               spListMovPlanilha.ParamByName('IDPESSOA').AsInteger := IdPessoa;

               Cds.Data := spListMovPlanilha.Data;

               iMaxValor  := Cds.RecordCount;
               iProgresso := 0;

               If Not Cds.IsEmpty Then
                  Begin
                     Cds.First;
                     While Not Cds.Eof Do
                        Begin
                           Inc ( iProgresso );
                           DoProgresso([Bilhete,iMaxValor,iProgresso,'Excluindo...']);

                           //----------------------------------------------------------------------------------
                           // Desessocia a os movimentos de estoque das planílhas contábeis
                           //----------------------------------------------------------------------------------
                           SQL := ' UPDATE MOVIMENT SET PLNCODIGO = NULL '+
                                  ' WHERE PLNCODIGO = '+Cds.FieldByName('PLNCODIGO').AsString;

                           If Not ExecSQL(SQL,True) Then
                              Raise Exception.Create( MessageInfo );

                           //----------------------------------------------------------------------------------
                           // exclui as planílhas contábeis
                           //----------------------------------------------------------------------------------
                           If Not _Lancamento.ExcluiLancaContab( IdUsuario,
                                                                 Cds.FieldByName('PLNCODIGO').AsFloat,
                                                                 IdModulo,0,UsaPlanoPrev,
                                                                 True)
                           Then
                              Raise Exception.Create( _Lancamento.MessageInfo );

                           Cds.Next;
                        End;
                     //---------------------------------------------------------------------------
                     // Volta a última data de integração contábil
                     //---------------------------------------------------------------------------
                     spAtuDataUltIntegra.Prepare;
                     spAtuDataUltIntegra.ParamByName('DATAULTINTEGRA').AsDate := Data-1;
                     spAtuDataUltIntegra.ParamByName('IDPESSOA').AsInteger    := IdPessoa;

                     IF Not ExecSQL( spAtuDataUltIntegra.SQLChanged, True ) Then
                        Raise Exception.Create( MessageInfo );

                     MessageInfo := MSG_EXCLUI_INTEGR_FIM;
                  End
               Else
                  MessageInfo := MSG_NAO_DADOS_EXCLUIR;
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

function TCtrlIntegracaoContabil.Integrar( IdPessoa : Integer; DataIni,
DataFim : TDateTime;ContabilizaTransf,UsaPlanoPrev : Boolean; IdModulo,
IdUsuario,IdPatro, IdPlanoPrev : Double;  Bilhete : String ): Boolean;
Var
   CdsContab     : TClientDataSet;
   CdsContaProd  : TClientDataSet;
   CdsMov        : TClientDataSet;
   iUnidNegoc    : Integer;
   sHistorico    : String;
   rTotContaDeb  : Double;
   rTotContaCre  : Double;
   rDifer        : Double;
   iMaxValor     : Integer;
   iProgresso    : Integer;
   dDataLanc     : TDateTime;
   iPlnCodigo    : Double;

Procedure InserirContab (iPlano : Integer; DataMov : TDateTime; sContaContabil, sCentroCusto, sDebCre,sTipoDC, sHist : String;
                         iUnidNegoc, iSubConta : Integer; rValorCorrente,
                         rValorMoeda : Double );
var bInsere : Boolean;
Begin
  If sContaContabil = '' then
     Exit;
  bInsere := True;
  CdsContab.First;
  While not CdsContab.Eof Do
     Begin
        If (cdsContab.FieldByName('PLACONTA').AsString = sContaContabil) AND
           (Trim(cdsContab.FieldByName('CODCENTROCUSTO').AsString) = Trim(sCentroCusto)) AND
           (cdsContab.FieldByName('UNIDNEGOC').AsInteger = iUnidNegoc) AND
           (cdsContab.FieldByName('CODSUBCONTA').AsInteger = iSubConta) AND
           (cdsContab.FieldByName('LACDEBCRE').AsString = sDebCre) AND
           (cdsContab.FieldByName('PLNDATDIA').AsDateTime = DataMov) AND
           (cdsContab.FieldByName('HISTORICO').AsString = sHist) AND
           (cdsContab.FieldByName('LACTIPO').AsString = sTipoDC)
        Then
           Begin
              bInsere := False;
              cdsContab.Edit;
              cdsContab.FieldByName('LACVALOR').AsFloat   := cdsContab.FieldByName('LACVALOR').AsFloat  + StrToFloat(Format('%17.2f',[rValorCorrente]));
              cdsContab.FieldByName('LACVALHIST').AsFloat := cdsContab.FieldByName('LACVALHIST').AsFloat+ StrToFloat(Format('%17.2f',[rValorMoeda]));
              cdsContab.Post;
              Break;
           End;
        CdsContab.Next;
     End;
  if bInsere then
     Begin
        CdsContab.Append;
        CdsContab.FieldByName('PLACONTA').AsString       := sContaContabil;
        CdsContab.FieldByName('PLANO').AsInteger         := iPlano;
        CdsContab.FieldByName('CODCENTROCUSTO').AsString := sCentroCusto;
        CdsContab.FieldByName('UNIDNEGOC').AsInteger     := iUnidNegoc;
        CdsContab.FieldByName('LACVALOR').AsFloat        := StrToFloat(Format('%17.2f',[rValorCorrente]));
        CdsContab.FieldByName('LACVALHIST').AsFloat      := StrToFloat(Format('%17.2f',[rValorMoeda]));
        CdsContab.FieldByName('HISTORICO').AsString      := sHist;
        CdsContab.FieldByName('LACHIST2').AsString       := '';
        CdsContab.FieldByName('LACHIST3').AsString       := '';
        CdsContab.FieldByName('LACHIST4').AsString       := '';
        CdsContab.FieldByName('LACHIST5').AsString       := '';
        CdsContab.FieldByName('PLNDATDIA').AsDateTime    := DataMov;
        CdsContab.FieldByName('LACNUMDOC').AsString      := DateToStr(DataMov);
        CdsContab.FieldByName('LACDEBCRE').AsString      := sDebCre;
        CdsContab.FieldByName('LACTIPO').AsString        := sTipoDC;
        CdsContab.FieldByName('CODSUBCONTA').AsInteger   := iSubConta;
        CdsContab.Post;
     end;
End;
Function TestaConta( sConta, sHist, sCodCentroCusto, sDebCre, sTipoDC : String;
                     iCodSubConta : Integer; rValor : Double ) : Boolean;
Begin
   Result := True;
   Try
      _ContaContabil.TestaContaContabil( CdsContaProd.FieldByName('PLANO').AsFloat,0,
                                         0,0,sConta,
                                         False,False );

      If (_ContaContabil.ObrigaCentroCusto = 'S') And ( Trim(sCodCentroCusto) = '' ) Then
         Raise Exception.Create('Lancamento Nº '+ CdsMov.FieldByName('IDMOV').AsString + ' '+ MSG_OBRIGATORIO_CC + _ContaContabil.NomeConta + ' Produto : ' + CdsMov.FieldByName('CODARTIGO').AsString);

      If Not CdsMov.FieldByName('UNIDNEGOC').IsNull Then
         iUnidNegoc := CdsMov.FieldByName('UNIDNEGOC').AsInteger
      Else
         iUnidNegoc := CdsContaProd.FieldByName('UNIDNEGOC').AsInteger;

      //----------------------------------------------------------------------------------------
      //Alimenta o Cds que vai gerar a integração
      //----------------------------------------------------------------------------------------
      InserirContab(CdsContaProd.FieldByName('PLANO').AsInteger,
                    CdsMov.FieldByName('DATAMOV').AsDateTime,
                    sConta,
                    sCodCentroCusto,
                    sDebCre,sTipoDC,sHist,
                    iUnidNegoc,
                    iCodSubConta,
                    rValor,0 );
   Except
      On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
   End;
End;

begin
Result := True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.IntegrarContab( IdPessoa, DataIni, DataFim, ContabilizaTransf,UsaPlanoPrev, IdModulo, IdUsuario, IdPatro, IdPlanoPrev, Bilhete );
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      CdsMov       := TClientDataSet.Create(nil);
      CdsContab    := TClientDataSet.Create(nil);
      CdsContaProd := TClientDataSet.Create(nil);

      Try
         Try
            StartTransaction;

            If DataFim > _MovEstoque.GetDataRepresa( IdPessoa ) Then
               Raise Exception.Create( MSG_POSTERIOR_DATAREP );

            With _DtmAlmox Do
               Begin
                  spListIntegraContab.Prepare;
                  spListIntegraContab.ParamByName('DATAINI').AsDate     := DataIni;
                  spListIntegraContab.ParamByName('DATAFIM').AsDate     := DataFim;
                  spListIntegraContab.ParamByName('IDPESSOA').AsInteger := IdPessoa;

                  CdsMov.Data := spListIntegraContab.Data;

                  iProgresso := 0;
                  If Not CdsMov.IsEmpty Then
                     Begin
                        iMaxValor := CdsMov.RecordCount;

                        CdsContab.Data := GetDataPacket('SELECT P.PLNDATDIA, L.*, (L.LACHIST1||L.LACHIST2||L.LACHIST3||L.LACHIST4|| L.LACHIST5) AS HISTORICO '+
                                                        ' FROM LANCAMENTO L, PLANILHA P WHERE 1=2');

                        CdsMov.First;
                        While Not CdsMov.Eof Do
                           Begin
                              Inc ( iProgresso );
                              DoProgresso([Bilhete,iMaxValor,iProgresso,'Preparando para Integrar']);

                              If Not( FloatsEqual(CdsMov.FieldByName('VALORMOV').AsFloat, ZERO) ) Then
                                 Begin
                                    CdsContaProd.Data := PegaContaContab(IdPessoa,
                                                                         CdsMov.FieldByName('CODARTIGO').AsString,
                                                                         CdsMov.FieldByName('CODCENTROCUSTO').AsString,
                                                                         CdsMov.FieldByName('CODALMOXARIFADO').AsInteger,
                                                                         CdsMov.FieldByName('CODGRUPOPROD').AsString );
                                    If (CdsMov.FieldByName('CODALMOXTRANSF').isNull) or
                                       ((not CdsMov.FieldByName('CODALMOXTRANSF').isNull) And
                                       (CdsMov.FieldByName('CODCUSTEIO').AsInteger <> CdsMov.FieldByName('CODCUSTRANSF').AsInteger) And
                                       ((CdsMov.FieldByName('CONTABIL').AsString <> 'T') or
                                       (CdsMov.FieldByName('CONTABIL').isNull)))
                                    Then
                                       Begin
                                          //------------------------------------------------------------------------
                                          // Testa Conta de Saída
                                          //------------------------------------------------------------------------
                                          sHistorico := 'Custo nesta data';

                                          sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,5,5,
                                                                           sHistorico,
                                                                           [CdsMov.FieldByName('ALMOXORIGEM').AsString,
                                                                            CdsMov.FieldByName('NOMECENTROCUSTO').AsString,
                                                                            CdsMov.FieldByName('CODCENTROCUSTO').AsString ]);

                                          If Not TestaConta(CdsContaProd.FieldByName('CONTASAIDA').AsString,sHistorico,
                                                            CdsMov.FieldByName('CODCENTROCUSTO').AsString,'D','0',
                                                            CdsContaProd.FieldByName('SUBCONTASAIDA').AsInteger,
                                                            (CdsMov.FieldByName('VALORMOV').AsFloat* -1) )
                                          Then
                                             Raise Exception.Create( MessageInfo );
                                          //------------------------------------------------------------------------
                                          // Testa Conta de Entrada
                                          //------------------------------------------------------------------------
                                          If Not TestaConta(CdsContaProd.FieldByName('CONTAENTRADA').AsString,sHistorico,
                                                            CdsMov.FieldByName('CODCENTROCUSTO').AsString,'C','1',
                                                            CdsContaProd.FieldByName('SUBCONTAENTRADA').AsInteger,
                                                            (CdsMov.FieldByName('VALORMOV').AsFloat* -1) )
                                          Then
                                             Raise Exception.Create( MessageInfo );
                                       End
                                    Else
                                    //------------------------------------------------------------------------
                                    // Contabilização das Trnsferências
                                    //------------------------------------------------------------------------
                                    If ContabilizaTransf Then
                                       Begin
                                          If CdsMov.FieldByName('VALORMOV').AsFloat < 0 Then
                                             Begin
                                                sHistorico := 'Transferência do '+CdsMov.FieldByName('ALMOXDESTINO').AsString+' p/ o '+ CdsMov.FieldByName('ALMOXORIGEM').AsString;

                                                sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,5,4,
                                                                                 sHistorico,
                                                                                 [CdsMov.FieldByName('ALMOXORIGEM').AsString,
                                                                                  CdsMov.FieldByName('ALMOXDESTINO').AsString]);

                                                If Not TestaConta(CdsContaProd.FieldByName('CONTAENTRADA').AsString,sHistorico,
                                                                  CdsMov.FieldByName('CODCENTROCUSTODESTINO').AsString,'C','1',
                                                                  CdsContaProd.FieldByName('SUBCONTAENTRADA').AsInteger,
                                                                  Abs(CdsMov.FieldByName('VALORMOV').AsFloat) )
                                                Then
                                                  Raise Exception.Create( MessageInfo );
                                             End
                                          Else
                                             Begin
                                                sHistorico := 'Transferência do '+CdsMov.FieldByName('ALMOXORIGEM').AsString+' p/ o '+ CdsMov.FieldByName('ALMOXDESTINO').AsString;

                                                sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,5,4,
                                                                                 sHistorico,
                                                                                 [CdsMov.FieldByName('ALMOXORIGEM').AsString,
                                                                                  CdsMov.FieldByName('ALMOXDESTINO').AsString]);

                                                If Not TestaConta(CdsContaProd.FieldByName('CONTAENTRADA').AsString,sHistorico,
                                                                  CdsMov.FieldByName('CODCENTROCUSTODESTINO').AsString,'D','0',
                                                                  CdsContaProd.FieldByName('SUBCONTAENTRADA').AsInteger,
                                                                  Abs(CdsMov.FieldByName('VALORMOV').AsFloat) )
                                                Then
                                                  Raise Exception.Create( MessageInfo );
                                             End
                                       End;
                                 End;
                              CdsMov.Next;
                           End;
                        //---------------------------------------------------------------------------
                        // Lançamento na Contabilidade (integrgação contabil propriamente dita)
                        //---------------------------------------------------------------------------
                        rTotContaDeb := 0;
                        rTotContaCre := 0;
                        CdsContab.First;
                        dDataLanc := CdsContab.FieldByName('PLNDATDIA').asDateTime;
                        While Not CdsContab.Eof Do
                           Begin
                              if CdsContab.FieldByName('LACDEBCRE').AsString = 'D' then
                                 rTotContaDeb := rTotContaDeb + CdsContab.FieldByName('LACVALOR').AsFloat
                              else
                                 rTotContaCre := rTotContaCre + CdsContab.FieldByName('LACVALOR').AsFloat;
                              CdsContab.Next;
                              //----------------------------------------------------------------------------------------------------------------------
                              // Testa o total dia a dia
                              //----------------------------------------------------------------------------------------------------------------------
                              if (dDataLanc <> CdsContab.FieldByName('PLNDATDIA').asDateTime) or (CdsContab.Eof) Then
                                 Begin
                                    If Not ( FloatsEqual(rTotContaDeb, rTotContaCre) ) Then
                                       Begin
                                          rDifer := (rTotContaDeb - rTotContaCre);
                                          If ( rDifer >= -MAX_DIFERENCA ) And ( rDifer <= MAX_DIFERENCA ) Then
                                             Begin
                                                if not CdsContab.Bof then
                                                   CdsContab.Prior;
                                                CdsContab.Edit;
                                                CdsContab.FieldByName('LACVALOR').AsFloat := CdsContab.FieldByName('LACVALOR').AsFloat - rDifer;
                                                CdsContab.Post;
                                                CdsContab.Next;
                                             End
                                          Else
                                             Begin
                                                Raise Exception.Create( MSG_DIA +FormatDateTime('dd/mm/yyyy',dDataLanc)+' '+ MSG_DEBITO_NAO_BATE + Format('%17.2f',[rDifer]) );
                                             End;
                                       End;
                                    rTotContaDeb := 0;
                                    rTotContaCre := 0;
                                    dDataLanc := CdsContab.FieldByName('PLNDATDIA').asDateTime;
                                 end;
                           End;


                        iMaxValor  := CdsContab.RecordCount;
                        iProgresso := 0;
                        dDataLanc  := -1;
                        iPlnCodigo := 0;
                        CdsContab.First;
                        While Not CdsContab.Eof Do
                           Begin
                              if CdsContab.FieldByName('PLNDATDIA').AsDateTime <> dDataLanc then
                                 Begin
                                    iPlnCodigo := 0;
                                    dDataLanc  := CdsContab.FieldByName('PLNDATDIA').AsDateTime;
                                 end;
                              Inc ( iProgresso );
                              DoProgresso([Bilhete,iMaxValor,iProgresso,'Integrando...']);

                              If Not ( FloatsEqual(CdsContab.FieldByName('LACVALOR').AsFloat, ZERO ) ) Then
                                 Begin
                                    If CdsContab.FieldByName('LACDEBCRE').AsString = 'D' Then
                                       Begin
                                          If Not _Lancamento.InsereLancaContab( '0',IdPessoa,IdModulo, IdUsuario,
                                                                                CdsContab.FieldByName('PLANO').AsInteger,
                                                                                CdsContab.FieldByName('UNIDNEGOC').AsInteger,
                                                                                CdsContab.FieldByName('CODSUBCONTA').AsInteger,0,
                                                                                IdPlanoPrev,IdPatro,
                                                                                iPlnCodigo,0,
                                                                                FormatDateTime('dd/mm/yyyy',CdsContab.FieldByName('PLNDATDIA').AsDateTime),
                                                                                CdsContab.FieldByName('LACNUMDOC').AsString,
                                                                                CdsContab.FieldByName('HISTORICO').AsString,
                                                                                '','','','','03',
                                                                                CdsContab.FieldByName('CODCENTROCUSTO').AsString,
                                                                                CdsContab.FieldByName('PLACONTA').AsString,
                                                                                '','','',
                                                                                CdsContab.FieldByName('LACVALOR').AsFloat,False,UsaPlanoPrev)
                                          Then
                                             Raise Exception.Create( MSG_DIA+FormatDateTime('dd/mm/yyyy',CdsContab.FieldByName('PLNDATDIA').AsDateTime)+#13#13+_Lancamento.MessageInfo );
                                          iPlnCodigo := _Lancamento.RetornoPlnCodigo;
                                       End
                                    Else
                                       Begin
                                          If Not _Lancamento.InsereLancaContab( '1',IdPessoa,IdModulo, IdUsuario,
                                                                                CdsContab.FieldByName('PLANO').AsInteger,
                                                                                CdsContab.FieldByName('UNIDNEGOC').AsInteger,0,
                                                                                CdsContab.FieldByName('CODSUBCONTA').AsInteger,
                                                                                IdPlanoPrev,IdPatro,
                                                                                iPlnCodigo,0,
                                                                                FormatDateTime('dd/mm/yyyy',CdsContab.FieldByName('PLNDATDIA').AsDateTime),
                                                                                CdsContab.FieldByName('LACNUMDOC').AsString,
                                                                                CdsContab.FieldByName('HISTORICO').AsString,
                                                                                '','','','','03',
                                                                                '','',
                                                                                CdsContab.FieldByName('CODCENTROCUSTO').AsString,
                                                                                CdsContab.FieldByName('PLACONTA').AsString,
                                                                                '',
                                                                                CdsContab.FieldByName('LACVALOR').AsFloat,False,UsaPlanoPrev )
                                          Then
                                             Raise Exception.Create( MSG_DIA+FormatDateTime('dd/mm/yyyy',CdsContab.FieldByName('PLNDATDIA').AsDateTime)+#13#13+_Lancamento.MessageInfo );
                                          iPlnCodigo := _Lancamento.RetornoPlnCodigo;
                                       End;

                                 End;
                              CdsContab.Next;
                              If ( iPlnCodigo <> 0 ) And ((CdsContab.FieldByName('PLNDATDIA').AsDateTime <> dDataLanc) or (CdsContab.Eof) ) then
                                 Begin
                                    With _DtmAlmox Do
                                       Begin
                                          //---------------------------------------------------------------------------
                                          // Associa os Lançamentos contábeis com a movimentação de estoque
                                          //---------------------------------------------------------------------------
                                          spAtuIntegraContab.Prepare;
                                          spAtuIntegraContab.ParamByName('PLNCODIGO').AsFloat   := iPlnCodigo;
                                          spAtuIntegraContab.ParamByName('DATAREF').AsDate      := dDataLanc;
                                          spAtuIntegraContab.ParamByName('IDPESSOA').AsInteger  := IdPessoa;

                                          IF Not ExecSQL( spAtuIntegraContab.SQLChanged, True ) Then
                                             Raise Exception.Create( MessageInfo );
                                       end;
                                    iPlnCodigo := 0;
                                 end;
                           End;
                           //---------------------------------------------------------------------------
                           // Atualiza a última data de integração contábil
                           //---------------------------------------------------------------------------
                           spAtuDataUltIntegra.Prepare;
                           spAtuDataUltIntegra.ParamByName('DATAULTINTEGRA').AsDate := DataFim;
                           spAtuDataUltIntegra.ParamByName('IDPESSOA').AsInteger    := IdPessoa;

                           IF Not ExecSQL( spAtuDataUltIntegra.SQLChanged, True ) Then
                              Raise Exception.Create( MessageInfo );

                           MessageInfo := MSG_INTEGRACAO_FIM ;
                     End
                  else
                     MessageInfo := MSG_NAO_DADOSINTEGRAR ;
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
      Finally
         CdsMov.Free;
         CdsContab.Free;
         CdsContaProd.Free;
      End;
   End;

end;

function TCtrlIntegracaoContabil.ListIntegraContab(IdPessoa: Integer;
  DataIni, DataFim: TDateTime): OleVariant;
begin
   With _DtmAlmox Do
      Begin
         spListIntegraContab.Prepare;

         spListIntegraContab.ParamByName('DATAINI').AsDate     := DataIni;
         spListIntegraContab.ParamByName('DATAFIM').AsDate     := DataFim;
         spListIntegraContab.ParamByName('IDPESSOA').AsInteger := IdPessoa;

         Result := spListIntegraContab.Data;
      End;
end;

function TCtrlIntegracaoContabil.PegaContaContab(IdPessoa: Integer;
  CodArtigo, CodCentroCusto: String; CodAlmoxarifado: Integer;
  CodGrupoProd: String): OleVariant;
Var
   sSelect : String;
   sWhere  : String;
begin
   CodArtigo      := Copy(CodArtigo + '                    ',1,14);
   CodCentroCusto := Copy(CodCentroCusto + '                    ',1,10);
   CodGrupoProd   := Copy(CodGrupoProd + '                    ',1,10);
   Try
//---------------------------------------------------------------------------------------------
      sSelect := 'SELECT CONTAENTRADA,CONTASAIDA,SUBCONTAENTRADA,SUBCONTASAIDA,UNIDNEGOC, PLANO '+
                 'FROM ARTXCONTAXCC WHERE ';

      sWhere := '     (CODARTIGO = '+QuotedStr(CodArtigo)+') '+
                ' AND (IDPESSOA = '+IntToStr(IdPessoa)+')'+
                ' AND (CODCENTROCUSTO = '+QuotedStr(CodCentroCusto)+')'+
                ' AND (CODALMOXARIFADO = '+IntToStr(CodAlmoxarifado)+')';

      _Cds.Data :=  GetDataPacket( sSelect + sWhere );

      If Not _Cds.IsEmpty Then
         Exit;
//---------------------------------------------------------------------------------------------
      sWhere := '     (CODARTIGO = '+QuotedStr(CodArtigo)+') '+
                ' AND (IDPESSOA = '+IntToStr(IdPessoa)+')'+
                ' AND (CODCENTROCUSTO = '+QuotedStr(CodCentroCusto)+')'+
                ' AND (CODALMOXARIFADO IS NULL )';

       _Cds.Data :=  GetDataPacket( sSelect + sWhere );

       If Not _Cds.IsEmpty Then
          Exit;
//---------------------------------------------------------------------------------------------
      sWhere := '     (CODARTIGO = '+QuotedStr(CodArtigo)+') '+
                ' AND (IDPESSOA = '+IntToStr(IdPessoa)+')'+
                ' AND (CODCENTROCUSTO IS NULL )'+
                ' AND (CODALMOXARIFADO = '+IntToStr(CodAlmoxarifado)+')';

       _Cds.Data :=  GetDataPacket( sSelect + sWhere );

       If Not _Cds.IsEmpty Then
          Exit;
//---------------------------------------------------------------------------------------------
      sWhere := '     (CODARTIGO = '+QuotedStr(CodArtigo)+') '+
                ' AND (IDPESSOA = '+IntToStr(IdPessoa)+')';

       _Cds.Data :=  GetDataPacket( sSelect + sWhere );

       If Not _Cds.IsEmpty Then
          Exit;
//---------------------------------------------------------------------------------------------
      sWhere := '     (CODGRUPOPROD = '+QuotedStr(CodGrupoProd)+') '+
                ' AND (IDPESSOA = '+IntToStr(IdPessoa)+')'+
                ' AND (CODCENTROCUSTO = '+QuotedStr(CodCentroCusto)+')'+
                ' AND (CODALMOXARIFADO = '+IntToStr(CodAlmoxarifado)+')';

      _Cds.Data :=  GetDataPacket( sSelect + sWhere );

      If Not _Cds.IsEmpty Then
         Exit;
//---------------------------------------------------------------------------------------------
      sWhere := '     (CODGRUPOPROD = '+QuotedStr(CodGrupoProd)+') '+
                ' AND (IDPESSOA = '+IntToStr(IdPessoa)+')'+
                ' AND (CODCENTROCUSTO = '+QuotedStr(CodCentroCusto)+')'+
                ' AND (CODALMOXARIFADO IS NULL )';

       _Cds.Data :=  GetDataPacket( sSelect + sWhere );

       If Not _Cds.IsEmpty Then
          Exit;
//---------------------------------------------------------------------------------------------
      sWhere := '     (CODGRUPOPROD = '+QuotedStr(CodGrupoProd)+') '+
                ' AND (IDPESSOA = '+IntToStr(IdPessoa)+')'+
                ' AND (CODCENTROCUSTO IS NULL )'+
                ' AND (CODALMOXARIFADO = '+IntToStr(CodAlmoxarifado)+')';

       _Cds.Data :=  GetDataPacket( sSelect + sWhere );

       If Not _Cds.IsEmpty Then
          Exit;
//---------------------------------------------------------------------------------------------
      sWhere := '     (CODGRUPOPROD = '+QuotedStr(CodGrupoProd)+') '+
                ' AND (IDPESSOA = '+IntToStr(IdPessoa)+')';

       _Cds.Data :=  GetDataPacket( sSelect + sWhere );

   Finally
      Result := _Cds.Data;
   End;
end;


Function TCtrlIntegracaoContabil.IntegrarPartidaDobrada(IdPessoa: Integer;
  DataIni, DataFim: TDateTime; ContabilizaTransf, UsaPlanoPrev: Boolean;
  IdModulo, IdUsuario, IdPatro, IdPlanoPrev: Double;
  Bilhete: String): Boolean;
Var
   CdsContab     : TClientDataSet;
   CdsContaProd  : TClientDataSet;
   CdsMov        : TClientDataSet;
   iUnidNegoc    : Integer;
   sHistorico    : String;
   iMaxValor     : Integer;
   iProgresso    : Integer;
   dDataLanc     : TDateTime;
   iPlnCodigo    : Double;

Procedure InserirContab ( iPlano              : Integer;
                          DataMov             : TDateTime;
                          sContaDebito        : String;
                          iSubContaDebito     : Integer;
                          sCentroCustoDebito  : String;
                          sContaCredito       : String;
                          iSubContaCredito    : Integer;
                          sCentroCustoCredito : String;
                          sHist               : String;
                          iUnidNegoc          : Integer;
                          rValorCorrente      : Double;
                          rValorMoeda         : Double );
var bInsere : Boolean;
Begin
  If (sContaDebito = '') Or ( sContaCredito = '') then
     Exit;
  bInsere := True;
  CdsContab.First;
  While not CdsContab.Eof Do
     Begin
        If (cdsContab.FieldByName('CONTADEBITO').AsString = sContaDebito) AND
           (Trim(cdsContab.FieldByName('CODCENTROCUSTODEBITO').AsString) = Trim(sCentroCustoDebito)) AND
           (cdsContab.FieldByName('CODSUBCONTADEBITO').AsInteger = iSubContaDebito) AND
           (cdsContab.FieldByName('CONTACREDITO').AsString = sContaCredito) AND
           (Trim(cdsContab.FieldByName('CODCENTROCUSTOCREDITO').AsString) = Trim(sCentroCustoCredito)) AND
           (cdsContab.FieldByName('CODSUBCONTACREDITO').AsInteger = iSubContaCredito) AND
           (cdsContab.FieldByName('PLNDATDIA').AsDateTime = DataMov) AND
           (cdsContab.FieldByName('HISTORICO').AsString = sHist) AND
           (cdsContab.FieldByName('UNIDNEGOC').AsInteger = iUnidNegoc)
        Then
           Begin
              bInsere := False;
              cdsContab.Edit;
              cdsContab.FieldByName('LACVALOR').AsFloat   := cdsContab.FieldByName('LACVALOR').AsFloat  + StrToFloat(Format('%17.2f',[rValorCorrente]));
              cdsContab.FieldByName('LACVALHIST').AsFloat := cdsContab.FieldByName('LACVALHIST').AsFloat+ StrToFloat(Format('%17.2f',[rValorMoeda]));
              cdsContab.Post;
              Break;
           End;
        CdsContab.Next;
     End;
  if bInsere then
     Begin
        CdsContab.Append;
        CdsContab.FieldByName('PLANO').AsInteger                := iPlano;
        CdsContab.FieldByName('CONTADEBITO').AsString           := sContaDebito;
        cdsContab.FieldByName('CODCENTROCUSTODEBITO').AsString  := sCentroCustoDebito;
        CdsContab.FieldByName('CODSUBCONTADEBITO').AsInteger    := iSubContaDebito;
        CdsContab.FieldByName('CONTACREDITO').AsString          := sContaCredito;
        cdsContab.FieldByName('CODCENTROCUSTOCREDITO').AsString := sCentroCustoCredito;
        CdsContab.FieldByName('CODSUBCONTACREDITO').AsInteger   := iSubContaCredito;
        CdsContab.FieldByName('UNIDNEGOC').AsInteger            := iUnidNegoc;
        CdsContab.FieldByName('LACVALOR').AsFloat               := StrToFloat(Format('%17.2f',[rValorCorrente]));
        CdsContab.FieldByName('LACVALHIST').AsFloat             := StrToFloat(Format('%17.2f',[rValorMoeda]));
        CdsContab.FieldByName('HISTORICO').AsString             := sHist;
        CdsContab.FieldByName('PLNDATDIA').AsDateTime           := DataMov;
        CdsContab.FieldByName('LACNUMDOC').AsString             := DateToStr(DataMov);
        CdsContab.Post;
     end;
End;
Function TestaConta( sContaDebito           : String;
                     iCodSubContaDebito     : Integer;
                     sCodCentroCustoDebito  : String;
                     sContaCredito          : String;
                     iCodSubContaCredito    : Integer;
                     sCodCentroCustoCredito : String;
                     sHist                  : String;
                     rValor                 : Double ) : Boolean;
Begin
   Result := True;
   Try
     //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     // Testa a Conta de Débito
     //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      _ContaContabil.TestaContaContabil( CdsContaProd.FieldByName('PLANO').AsFloat,0,0,0,
                                         sContaDebito,
                                         False,False );

      If (_ContaContabil.ObrigaCentroCusto = 'S') And ( Trim(sCodCentroCustoDebito) = '' ) Then
         Raise Exception.Create('Lancamento Nº '+ CdsMov.FieldByName('IDMOV').AsString + ' '+ MSG_OBRIGATORIO_CC + _ContaContabil.NomeConta + ' Produto : ' + CdsMov.FieldByName('CODARTIGO').AsString);

     //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     // Testa a Conta de Crédito
     //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      _ContaContabil.TestaContaContabil( CdsContaProd.FieldByName('PLANO').AsFloat,0,0,0,
                                         sContaCredito,
                                         False,False );

      If (_ContaContabil.ObrigaCentroCusto = 'S') And ( Trim(sCodCentroCustoCredito) = '' ) Then
         Raise Exception.Create('Lancamento Nº '+ CdsMov.FieldByName('IDMOV').AsString + ' '+ MSG_OBRIGATORIO_CC + _ContaContabil.NomeConta + ' Produto : ' + CdsMov.FieldByName('CODARTIGO').AsString);

      If Not CdsMov.FieldByName('UNIDNEGOC').IsNull Then
         iUnidNegoc := CdsMov.FieldByName('UNIDNEGOC').AsInteger
      Else
         iUnidNegoc := CdsContaProd.FieldByName('UNIDNEGOC').AsInteger;

      //----------------------------------------------------------------------------------------
      //Alimenta o Cds que vai gerar a integração
      //----------------------------------------------------------------------------------------
      InserirContab(CdsContaProd.FieldByName('PLANO').AsInteger,
                    CdsMov.FieldByName('DATAMOV').AsDateTime,
                    sContaDebito,
                    iCodSubContaDebito,
                    sCodCentroCustoDebito,
                    sContaCredito,
                    iCodSubContaCredito,
                    sCodCentroCustoCredito,
                    sHist,
                    iUnidNegoc,
                    rValor,0 );
   Except
      On E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
   End;
End;

begin
Result := True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.IntegrarContab( IdPessoa, DataIni, DataFim, ContabilizaTransf,UsaPlanoPrev, IdModulo, IdUsuario, IdPatro, IdPlanoPrev, Bilhete );
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      CdsMov       := TClientDataSet.Create(nil);
      CdsContab    := TClientDataSet.Create(nil);
      CdsContaProd := TClientDataSet.Create(nil);

      Try
         Try
            StartTransaction;

            If DataFim > _MovEstoque.GetDataRepresa( IdPessoa ) Then
               Raise Exception.Create( MSG_POSTERIOR_DATAREP );

            With _DtmAlmox Do
               Begin
                  spListIntegraContab.Prepare;
                  spListIntegraContab.ParamByName('DATAINI').AsDate     := DataIni;
                  spListIntegraContab.ParamByName('DATAFIM').AsDate     := DataFim;
                  spListIntegraContab.ParamByName('IDPESSOA').AsInteger := IdPessoa;

                  CdsMov.Data := spListIntegraContab.Data;

                  iProgresso := 0;
                  If Not CdsMov.IsEmpty Then
                     Begin
                        iMaxValor := CdsMov.RecordCount;

                        CdsContab.Data := GetDataPacket( SQL_PARTIDA_DOBRADA );

                        CdsMov.First;
                        While Not CdsMov.Eof Do
                           Begin
                              Inc ( iProgresso );
                              DoProgresso([Bilhete,iMaxValor,iProgresso,'Preparando para Integrar']);

                              If Not( FloatsEqual(CdsMov.FieldByName('VALORMOV').AsFloat, ZERO) ) Then
                                 Begin
                                    CdsContaProd.Data := PegaContaContab(IdPessoa,
                                                                         CdsMov.FieldByName('CODARTIGO').AsString,
                                                                         CdsMov.FieldByName('CODCENTROCUSTO').AsString,
                                                                         CdsMov.FieldByName('CODALMOXARIFADO').AsInteger,
                                                                         CdsMov.FieldByName('CODGRUPOPROD').AsString );
                                    If (CdsMov.FieldByName('CODALMOXTRANSF').isNull) or
                                       ((not CdsMov.FieldByName('CODALMOXTRANSF').isNull) And
                                       (CdsMov.FieldByName('CODCUSTEIO').AsInteger <> CdsMov.FieldByName('CODCUSTRANSF').AsInteger) And
                                       ((CdsMov.FieldByName('CONTABIL').AsString <> 'T') or
                                       (CdsMov.FieldByName('CONTABIL').isNull)))
                                    Then
                                       Begin
                                          //------------------------------------------------------------------------
                                          // Testa Conta de Saída e Entrada
                                          //------------------------------------------------------------------------
                                          sHistorico := 'Custo nesta data';

                                          sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,5,5,
                                                                           sHistorico,
                                                                           [CdsMov.FieldByName('ALMOXORIGEM').AsString,
                                                                            CdsMov.FieldByName('NOMECENTROCUSTO').AsString,
                                                                            CdsMov.FieldByName('CODCENTROCUSTO').AsString ]);
                                                                            
                                          If Not TestaConta( CdsContaProd.FieldByName('CONTASAIDA').AsString,
                                                             CdsContaProd.FieldByName('SUBCONTASAIDA').AsInteger,
                                                             CdsMov.FieldByName('CODCENTROCUSTO').AsString,
                                                             CdsContaProd.FieldByName('CONTAENTRADA').AsString,
                                                             CdsContaProd.FieldByName('SUBCONTAENTRADA').AsInteger,
                                                             CdsMov.FieldByName('CODCENTROCUSTO').AsString,
                                                             sHistorico,(CdsMov.FieldByName('VALORMOV').AsFloat* -1) )
                                          Then
                                             Raise Exception.Create( MessageInfo );
                                       End
                                    Else
                                    //------------------------------------------------------------------------
                                    // Contabilização das Transferências
                                    //------------------------------------------------------------------------
                                    If ContabilizaTransf Then
                                       Begin
                                          If CdsMov.FieldByName('VALORMOV').AsFloat < 0 Then
                                             Begin
                                                sHistorico := 'Transferência do '+CdsMov.FieldByName('ALMOXDESTINO').AsString+' p/ o '+ CdsMov.FieldByName('ALMOXORIGEM').AsString +#13+
                                                              'Transferência do '+CdsMov.FieldByName('ALMOXORIGEM').AsString+' p/ o '+ CdsMov.FieldByName('ALMOXDESTINO').AsString;

                                                sHistorico := GetHistoricoAlmox( _ModeloHist,IdPessoa,5,4,
                                                                                 sHistorico,
                                                                                 [CdsMov.FieldByName('ALMOXORIGEM').AsString,
                                                                                  CdsMov.FieldByName('ALMOXDESTINO').AsString]);                                                              

                                                If Not TestaConta(CdsContaProd.FieldByName('CONTAENTRADA').AsString,
                                                                  CdsContaProd.FieldByName('SUBCONTAENTRADA').AsInteger,
                                                                  CdsMov.FieldByName('CODCENTROCUSTODESTINO').AsString,
                                                                  CdsContaProd.FieldByName('CONTAENTRADA').AsString,
                                                                  CdsContaProd.FieldByName('SUBCONTAENTRADA').AsInteger,
                                                                  CdsMov.FieldByName('CODCENTROCUSTODESTINO').AsString,
                                                                  sHistorico,
                                                                  Abs(CdsMov.FieldByName('VALORMOV').AsFloat) )
                                                Then
                                                  Raise Exception.Create( MessageInfo );
                                             End;
                                      End;
                                 End;
                              CdsMov.Next;
                           End;
                        //---------------------------------------------------------------------------
                        // Lançamento na Contabilidade (integrgação contabil propriamente dita)
                        //---------------------------------------------------------------------------
                        iMaxValor  := CdsContab.RecordCount;
                        iProgresso := 0;
                        dDataLanc  := -1;
                        iPlnCodigo := 0;
                        CdsContab.First;
                        While Not CdsContab.Eof Do
                           Begin
                              if CdsContab.FieldByName('PLNDATDIA').AsDateTime <> dDataLanc then
                                 Begin
                                    iPlnCodigo := 0;
                                    dDataLanc  := CdsContab.FieldByName('PLNDATDIA').AsDateTime;
                                 end;
                              Inc ( iProgresso );
                              DoProgresso([Bilhete,iMaxValor,iProgresso,'Integrando...']);

                              If Not ( FloatsEqual(CdsContab.FieldByName('LACVALOR').AsFloat, ZERO ) ) Then
                                 Begin
                                    If Not _Lancamento.InsereLancaContab( '2',IdPessoa,IdModulo, IdUsuario,
                                                                          CdsContab.FieldByName('PLANO').AsInteger,
                                                                          CdsContab.FieldByName('UNIDNEGOC').AsInteger,
                                                                          CdsContab.FieldByName('CODSUBCONTADEBITO').AsInteger,
                                                                          CdsContab.FieldByName('CODSUBCONTACREDITO').AsInteger,
                                                                          IdPlanoPrev,IdPatro,
                                                                          iPlnCodigo,0,
                                                                          FormatDateTime('dd/mm/yyyy',CdsContab.FieldByName('PLNDATDIA').AsDateTime),
                                                                          CdsContab.FieldByName('LACNUMDOC').AsString,
                                                                          CdsContab.FieldByName('HISTORICO').AsString,
                                                                          '','','','','03',
                                                                          CdsContab.FieldByName('CODCENTROCUSTODEBITO').AsString,
                                                                          CdsContab.FieldByName('CONTADEBITO').AsString,
                                                                          CdsContab.FieldByName('CODCENTROCUSTOCREDITO').AsString,
                                                                          CdsContab.FieldByName('CONTACREDITO').AsString,'',
                                                                          CdsContab.FieldByName('LACVALOR').AsFloat,False,UsaPlanoPrev)
                                    Then
                                       Raise Exception.Create( MSG_DIA+FormatDateTime('dd/mm/yyyy',CdsContab.FieldByName('PLNDATDIA').AsDateTime)+#13#13+_Lancamento.MessageInfo );

                                    iPlnCodigo := _Lancamento.RetornoPlnCodigo;
                                 End;

                              CdsContab.Next;

                              If ( iPlnCodigo <> 0 ) And ((CdsContab.FieldByName('PLNDATDIA').AsDateTime <> dDataLanc) or (CdsContab.Eof) ) then
                                 Begin
                                    With _DtmAlmox Do
                                       Begin
                                          //---------------------------------------------------------------------------
                                          // Associa os Lançamentos contábeis com a movimentação de estoque
                                          //---------------------------------------------------------------------------
                                          spAtuIntegraContab.Prepare;
                                          spAtuIntegraContab.ParamByName('PLNCODIGO').AsFloat   := iPlnCodigo;
                                          spAtuIntegraContab.ParamByName('DATAREF').AsDate      := dDataLanc;
                                          spAtuIntegraContab.ParamByName('IDPESSOA').AsInteger  := IdPessoa;

                                          IF Not ExecSQL( spAtuIntegraContab.SQLChanged, True ) Then
                                             Raise Exception.Create( MessageInfo );
                                       end;
                                    iPlnCodigo := 0;
                                 end;
                           End;
                           //---------------------------------------------------------------------------
                           // Atualiza a última data de integração contábil
                           //---------------------------------------------------------------------------
                           spAtuDataUltIntegra.Prepare;
                           spAtuDataUltIntegra.ParamByName('DATAULTINTEGRA').AsDate := DataFim;
                           spAtuDataUltIntegra.ParamByName('IDPESSOA').AsInteger    := IdPessoa;

                           IF Not ExecSQL( spAtuDataUltIntegra.SQLChanged, True ) Then
                              Raise Exception.Create( MessageInfo );

                           MessageInfo := MSG_INTEGRACAO_FIM ;
                     End
                  else
                     MessageInfo := MSG_NAO_DADOSINTEGRAR ;
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
      Finally
         CdsMov.Free;
         CdsContab.Free;
         CdsContaProd.Free;
      End;
   End;
end;



end.
