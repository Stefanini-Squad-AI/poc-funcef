//******************************************************************************************
// N. Solicitação: WO23322           
// Dt Alteração..: 18/07/2025
// Responsável...: Paulo Nobre
// Descrição.....: Na função ListMovimFinanc, foi incluido no SQL a possibilidade de voltar
//                 a mostrar o nome da usuário que lançou o documento, pois este foi
//                 descaracterizado na tabela USUARIOSISTEMA.
//******************************************************************************************
//N. SIG..........: 132872
//Data............: 26/04/2023
//Responsável.....: Cássio Florencio Rovaroto
//Descrição.......: Inclusão de definição de registros financeiros a conciliar.
//******************************************************************************
//N. Sig..........: 96817/96822
//Data............: 18/03/2020
//Responsável.....: Ewerton Beltramini
//Descrição.......: Alteração na função MudaStatus - Acrescentada a variavel dDataLanc.
//******************************************************************************************
//N. Sol..........: 201700
//N. Kintana......: 1955228
//Data............: 13/03/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Controle de Bloqueio para lançamentos de SICOB D + 1 e SIVAT
//******************************************************************************************
//N. Sol..........: 31714/13162
//N. Kintana......: 1887925
//Data............: 18/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Acertando SQL para novos campos
//******************************************************************************************
//N. Sol..........: 31714/12942
//N. Kintana......: 1879169
//Data............: 07/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Acertando SQL para ListaMovimBloqueios
//*****************************************************************************************
//N. Sol..........: 31714/12862
//N. Kintana......: 1875635
//Data............: 29/11/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Acertando SQL para tirar o conceito do saldo anterior
//******************************************************************************************
//N. Sol..........: 31714_38358
//N. Kintana......: 523349_523362
//Data............: 11/07/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Alteração em funções para atender a NOVA Conciliação bancária
//******************************************************************************************
// Autor(a)    : Ricardo de Freitas Araújo
// Data        : 24/06/2011
// Rotina      : MudaStatus,AlteraDispFinancDocBaixado
// SOL_Kintana : 160219_1341178
// Descricao   : Adicionado controle transacional.
//******************************************************************************************
//N. Sol..........: 31714_38358
//N. Kintana......: 523349_523362
//Data............: 06/06/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão de rotinas para atender a nova Conciliação Bancária
//******************************************************************************************

Unit uCtrlMovimFinanc;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
   uDbMovimFinanc, uCtrlFinanc, uGeralFinanc, uCtrlListTercFinanc, uCMClientDataSet,
   uCtrlLancamento, uCtrlParamIntegra, uDbImpostoRetido, uCtrlImpostoRetido,
   uCtrlPadroes, uCMTypes, uCtrlMensagens, uCtrlSegregacao;

Type
   TOperacaoFinanc = (opInclusao, opAlteracao);

   TMovimFinanc = Record
      CodLancFinanc: Double;
      PlnCodigo: Double;
      IDNFLivro: Double;
      IDModulo: Double;
      HistPadFinan: Double;
      MoeCodigo: Double;
      IDUsuarioInclusao: Double;
      CodPortador: Double;
      ValorLancFinanc: Double;
      NumChqBordero: String;
      DataLancFinan: TDateTime;
      DataConciliacao: TDateTime;
      EntradaSaida: String;
      Historico: String;
      StatusConcilia: String;
      ValorOutraMoeda: Double;
      IDPessoa: Double;
      CodLancTransf: Double;
      LoteTransmissao: Double;
      DataDispFinanc: TDateTime;
   End;

   TRateioFinanc = Record
      IDPessoa: Double;
      IDEmpresa: Double;
      IDPrograma: Double;
      IDPlanoPrev: Double;
      IDRateioFinanc: Double;
      CodLancFinanc: Double;
      IDPatro: Double;
      CodCentroCusto: String;
      UnidNegoc: Double;
      CodTipRecDes: String;
      RecPag: String;
      CodCentroRespon: String;
      MoeCodigo: Double;
      Valor: Double;
      ValorOutraMoeda: Double;
      LoteTransmissao: Double;
      CodTipDoc: Double;
   End;

   TContabil = Record
      PlnCodigo: Double;
      LacNumLan: Double;
      LacDebCre: String;
      UnidNegoc: Double;
      IDPlanoPrev: Double;
      IDPatro: Double;
      IDElemDemonstrat: Double;
      HitCodHist: String;
      IDPessoa: Double;
      IDEmpresa: Double;
      IDModulo: Double;
      IDUsuarioInclusao: Double;
      CodCentroCusto: String;
      PlaConta: String;
      Plano: Double;
      LacTipo: String;
      LacNumDoc: String;
      LacHist1: String;
      LacHist2: String;
      LacHist3: String;
      LacHist4: String;
      LacHist5: String;
      LacValor: Double;
      LacTipConvOficial: String;
      LacValOficial: String;
      LacTipConvGer: String;
      LacValGerencial: Double;
      LacTipConvGeren1: String;
      LacValGeren1: Double;
      LacTipConvGeren2: String;
      LacValGeren2: Double;
      LacAtOutMoeda: String;
      LacOrigemAplic: String;
      TipCodigo: String;
      LacValHist: Double;
      CodSubConta: Double;
      LoteTransmissao: Double;
      DescCCusto: String;
      DescUnidNeg: String;
      IdSegregaCriter: Integer;
      DescPatro: String;
      DescPlanPrev: String;
      DescSegregaCriter: String;
   End;

   TCtrlMovimFinanc = Class(TCmControlObject)
   Private
      FCdsMovimFinanc: TCMClientDataSet;
      FCdsRateioFinanc: TCMClientDataSet;
      FCdsContabil: TCMClientDataSet;
      FDbImpostoRetido: TDbImpostoRetido;
      CtrlFinanc: TCtrlFinanc;
      CtrlLancamento: TCtrlLancamento;
      CtrlListTerceiros: TCtrlListTercFinanc;
      CtrlImpostoRetido: TCtrlImpostoRetido;
      CtrlPadroes: TCtrlPadroes;
      CtrlParamIntegra: TCtrlParamIntegra;
      GeralFinanc: TGeralFinanc;
      CtrlSegregacao: TCtrlSegregacao;

      F_rIDPessoa: Double;
      F_rIDModulo: Double;
      F_rIDUsuario: Double;
      F_bUsaPlanoPatro: Boolean;
      rTipoDoc: Double;
      FcodLancFinanc: int64;

      FFundacaoCidade: Integer;
      FFundacaoEstado: String;
      FFundacaoPais: Integer;

      Procedure SetcodLancFinanc(Const Value: int64);
   Public
      Property CdsMovimFinanc: TCMClientDataSet Read FCdsMovimFinanc Write FCdsMovimFinanc;
      Property CdsRateioFinanc: TCMClientDataSet Read FCdsRateioFinanc Write FCdsRateioFinanc;
      Property CdsContabil: TCMClientDataSet Read FCdsContabil Write FCdsContabil;

      Property codLancFinanc: int64 Read FcodLancFinanc Write SetcodLancFinanc;
      Property IDPessoa: Double Read F_rIDPessoa Write F_rIDPessoa;
      Property IDModulo: Double Read F_rIDModulo Write F_rIDModulo;
      Property IDUsuario: Double Read F_rIDUsuario Write F_rIDUsuario;
      Property UsaPlanoPatro: Boolean Read F_bUsaPlanoPatro Write F_bUsaPlanoPatro;

      Property fundacaoCidade: Integer Read FFundacaoCidade;
      Property fundacaoEstado: String Read FFundacaoEstado;
      Property fundacaoPais: Integer Read FFundacaoPais;

      Constructor Create(rIDPessoa, rIDModulo, rIDUsuario: Double; bUsaPlanoPatro: Boolean); Reintroduce;
      Destructor Destroy; Override;

      Procedure PreparaCtrl;

      Procedure OnCreateAppServer; Override;

      Function EstornoFinanceiro(dDataEstorno, dDataDisp: TDateTime; bRegNaoIdent: Boolean;
         Var rCodLancFinan: Double; rIDPlano: Double;
         bIntegraContabil: Boolean): Boolean;

      Function GravaFinanceiro(bRegNaoIdent: Boolean; Operacao: TOperacaoFinanc;
         rIDPlano: Double;
         bIntegraContabil, bCalcImposto: Boolean): Boolean;

      Function ExcluiFinanceiro(rCodLancFinan: Double): Boolean;

      Function GeraImpostoRateio(Var rImposto: Double): Boolean;
      Function VerificaRateio: Boolean;
      Function GeraContabilizacao(sContaBanco, sCCustoBanco: String; rSubContaBanco: Double;
         sContaNI, sCCustoNI: String; rSubContaNI: Double;
         bRegNaoIdent: Boolean; rIDPlano: Double): Boolean;

      Function GeraRegistroContabil(RegContabil: TContabil; rIDPlano: Double;
         bPartidaDobrada: Boolean): Boolean;

      Function VerificaContabilizacao(rIDPlano: Double; sContaBanco: String;
         rSubContaBanco: Double; iPlanoCC: Integer): Boolean;
      Function MudaStatus(rCodLancFinanc: Double; sStatus: String;
         dDataConc, dDataDisp, dDataLanc : TDateTime): OleVariant; //Ewerton Beltramini - SIG 96817/96822 - 18/03/2020 - Acrescentada a variavel: dDataLanc

      Function ListMovimFinanc(rCodLancFinanc: Double): OleVariant;

      Function ListMovimFinancConciliacao(Const rCodPortador, rIDPessoa: Double): OleVariant;

      Function ListRateioFinanc(rCodLancFinanc: Double): OleVariant;

      Function ListContabil(rCodLancContabil: Double): OleVariant;

      Function TestaRegularizado(rCodLancFinanc: Double): Boolean;

      Function AlteraDispFinancDocBaixado(sEntradaSaida: String; iCodLancFinanc: integer; dDataDisp: TDateTime): boolean;

      Function SaldoRateioFinanc(rCodLancFinanc: extended): OleVariant;

      Function getIdForCliBanco(icodportador: integer): integer;

      Function LancaCPMF(ovRateio: OleVariant): boolean;

      Function ListaMovimExtratoDiaConciliacao(Const pDataMov, pCodPortador, pConciliado, pSitConciliacao: String): OleVariant;
      Function ListaMovimFinanceiroConciliacao(Const pDataMov, pCodPortador, pConciliado: String): OleVariant;
      Function ListaMovimBloqueios(Const pDataMov, pCodPortador: String): OleVariant;

      function ListMovimFinancNulo: OleVariant;
      function ListRateioFinancNulo: OleVariant;
      function ListMovimBancario(pDataLanc: TDateTime): OleVariant;
   Protected
      Procedure DoChangeDataBase; Override;
      Procedure AfterInitialize; Override;
   End;

Implementation
{ TCtrlMovimFinanc }

Constructor TCtrlMovimFinanc.Create(rIDPessoa, rIDModulo, rIDUsuario: Double; bUsaPlanoPatro: Boolean);
Begin
   Inherited Create;

   F_rIDPessoa := rIDPessoa;
   F_rIDModulo := rIDModulo;
   F_rIDUsuario := rIDUsuario;
   F_bUsaPlanoPatro := bUsaPlanoPatro;

   CtrlFinanc := TCtrlFinanc.Create(rIDPessoa, rIDModulo, rIDUsuario, bUsaPlanoPatro);

   CtrlLancamento := TCtrlLancamento.Create;
   CtrlListTerceiros := TCtrlListTercFinanc.Create;
   CtrlImpostoRetido := TCtrlImpostoRetido.Create;
   CtrlPadroes := TCtrlPadroes.Create;
   CtrlParamIntegra := TCtrlParamIntegra.Create;

   GeralFinanc := TGeralFinanc.Create;
   FDbImpostoRetido := TDbImpostoRetido.Create(Self);
   CtrlSegregacao := TCtrlSegregacao.Create;
End;

Destructor TCtrlMovimFinanc.Destroy;
Begin
   If IsAppServer Then
      Begin
         FCdsMovimFinanc.Free;
         FCdsRateioFinanc.Free;
         FCdsContabil.Free;
      End;

   CtrlFinanc.Free;
   CtrlLancamento.Free;
   CtrlListTerceiros.Free;
   CtrlImpostoRetido.Free;
   CtrlPadroes.Free;
   CtrlParamIntegra.Free;
   FDbImpostoRetido.Free;
   GeralFinanc.Free;
   CtrlSegregacao.Free;

   Inherited;
End;

Procedure TCtrlMovimFinanc.DoChangeDataBase;
Begin
   Inherited;
   FDbImpostoRetido.DataBaseName := DataBaseName;
End;

Procedure TCtrlMovimFinanc.AfterInitialize;
Var _Cdsaux: TClientDataSet;
Begin
   Inherited;
   CtrlFinanc.InitializeAs(Self);
   CtrlLancamento.InitializeAs(Self);
   CtrlImpostoRetido.InitializeAs(Self);
   CtrlPadroes.InitializeAs(Self);
   CtrlParamIntegra.InitializeAs(Self);
   GeralFinanc.InitializeAs(Self);

   CtrlFinanc.OpenTransaction := False;
   CtrlLancamento.OpenTransaction := False;
   CtrlImpostoRetido.OpenTransaction := False;
   CtrlPadroes.OpenTransaction := False;
   GeralFinanc.OpenTransaction := False;
   If (F_rIDPessoa <> 0) Then PreparaCtrl; //Não executará para cnsServer

   CtrlSegregacao.InitializeAs(self);
   If F_rIDPessoa = 0 Then Begin
         Try
            _Cdsaux := TClientDataSet.Create(Nil);
            _Cdsaux.Data := GetDataPacket('SELECT IDPESSOA FROM EMPRESAPROP');
            F_rIDPessoa := _Cdsaux.FieldByName('IDPESSOA').AsInteger;
         Finally
            _Cdsaux.Free
         End;
      End;

   CtrlSegregacao.GetParams(trunc(F_rIDPessoa));
End;

Procedure TCtrlMovimFinanc.PreparaCtrl;
Begin
   With TCMClientDataSet.Create(Nil) Do
      Try
         Data := GetDataPacket('SELECT CODTIPDOC ' +
            'FROM PARALMOX ' +
            'WHERE (IDPESSOA = ' + FloatToStr(F_rIDPessoa) + ') ');
         rTipoDoc := 0;
         If Not (IsEmpty) Then rTipoDoc := FieldByName('CODTIPDOC').AsFloat;
      Finally
         Free;
      End;

   CtrlParamIntegra.GetParams(Trunc(F_rIDPessoa), 0, 'INTEGRACONTAB', 'PARAMFINANC', tiSistema);
End;

Procedure TCtrlMovimFinanc.OnCreateAppServer;
Begin
   Inherited;
   FCdsMovimFinanc := TCMClientDataSet.Create(Nil);
   FCdsRateioFinanc := TCMClientDataSet.Create(Nil);
   FCdsContabil := TCMClientDataSet.Create(Nil);
End;

Function TCtrlMovimFinanc.ListMovimFinanc(rCodLancFinanc: Double): OleVariant;
Begin
   // Paulo Nobre - WO23322 - Inicio
//   Result := GetDataPacket('SELECT M.*, P.DESCRICAO AS DESCPORTADOR, U.NOMEUSUARIO' +
   Result := GetDataPacket('SELECT M.*, P.DESCRICAO AS DESCPORTADOR, PE.RAZAOSOCIAL AS NOMEUSUARIO ' +
      'FROM MOVIMFINANC M, PORTADORCONTA P, USUARIOSISTEMA U, PESSOA PE ' +
      'WHERE (M.CODLANCFINANC = ' + FloatToStr(rCodLancFinanc) + ') AND ' +
      '      (M.CODPORTADOR=P.CODPORTADOR) AND ' +
      '      ((RTRIM(M.TRGUSERINCLUSAO)=RTRIM(''CM''||TO_CHAR(U.IDUSUARIO))) OR  ' +
      '      ((M.TRGUSERINCLUSAO=''PJTOTALP'') AND ' +
      '      (U.IDUSUARIO = ' + IntToStr(Sistema.IdUsuario) + '))) AND ' +
      '      (U.IDUSUARIO = PE.IDPESSOA) ');
   // Paulo Nobre - WO23322 - Fim
End;

Function TCtrlMovimFinanc.ListMovimFinancConciliacao(Const rCodPortador, rIDPessoa: Double): OleVariant;
Var
   sSQL: String;
Begin
   _Cds.Data := GetDataPacket('SELECT EXIBELANCNAOIDENT FROM PARAMFINANC');

   sSQL := 'SELECT * ' +
      'FROM ' +
      '   MOVIMFINANC ' +
      'WHERE ' +
      '   ( CODPORTADOR        = ' + FloatToStr(rCodPortador) + ' ) ' +
      '   AND ( IDPESSOA       = ' + FloatToStr(rIDPessoa) + ' ) ';

   If (_Cds.FieldByName('EXIBELANCNAOIDENT').AsString = 'S') Then
      sSQL := sSQL + '   AND (STATUSCONCILIA IN (''N'',''I'', ''P'')) '
   Else
      sSQL := sSQL + '   AND (STATUSCONCILIA IN (''N'', ''P'')) ';

   sSQL := sSQL + 'ORDER BY ' +
      '   DATALANCFINAN, NUMCHQBORDERO ';

   Result := GetDataPacket(sSQL);
End;

Function TCtrlMovimFinanc.ListRateioFinanc(rCodLancFinanc: Double): OleVariant;
Begin
   Result := GetDataPacket('SELECT ' + #13 +
      '   R.IDPESSOA, ' + #13 +
      '   R.CODLANCFINANC, ' + #13 +
      '   R.UNIDNEGOC, ' + #13 +
      '   R.CODTIPRECDES, ' + #13 +
      '   R.RECPAG, ' + #13 +
      '   R.CODCENTRORESPON, ' + #13 +
      '   R.MOECODIGO, ' + #13 +
      '   R.VALOR, ' + #13 +
      '   R.VALOROUTRAMOEDA, ' + #13 +
      '   R.LOTETRANSMISSAO, ' + #13 +
      '   R.TRGDTINCLUSAO, ' + #13 +
      '   R.TRGUSERINCLUSAO, ' + #13 +
      '   R.IDEMPRESA, ' + #13 +
      '   R.CODCENTROCUSTO, ' + #13 +
      '   CC.CODEXTERNO AS CODCENTROCUSTO, ' + #13 +
      '   R.IDRATEIOFINANC, ' + #13 +
      '   R.IDPROGRAMA, ' + #13 +
      '   R.IDPLANOPREV, ' + #13 +
      '   R.IDPATRO, ' + #13 +
      '   R.CODTIPDOC, ' + #13 +
      '   R.IDSEGREGACRITER,' + #13 +
      '   U.NOME AS DESCUNIDNEG, ' + #13 +
      '   C.NOME AS DESCCRESPON, ' + #13 +
      '   T.DESCRICAO, ' + #13 +
      '   PRG.CODPROGRAMA, PRG.DESCPROGRAMA, ' + #13 +
      '   PTR.NOME AS NOME_PATRO, PLC.NOME AS NOME_PLANO, ' + #13 +
      '   I.MOESIGLA ' + #13 +
      'FROM ' + #13 +
      '   RATEIOFINANC    R, ' + #13 +
      '   UNIDNEGOCIO     U, ' + #13 +
      '   CENTRESPON      C, ' + #13 +
      '   CENTCUST CC, ' + #13 +
      '   TIPORECEBDESEMB T, ' + #13 +
      '   PESSOA          PTR, ' + #13 +
      '   PLANPREVCONTABIL        PLC, ' + #13 +
      '   PROGRAMA        PRG, ' + #13 +
      '   MOEDA           I ' + #13 +
      'WHERE ' + #13 +
      '       ( R.CODLANCFINANC   = ' + FloatToStr(rCodLancFinanc) + ' ) ' + #13 +
      '   AND ( R.CODTIPRECDES    = T.CODTIPRECDES ) ' + #13 +
      '   AND ( R.RECPAG          = T.RECPAG ) ' + #13 +
      '   AND ( R.IDPESSOA        = T.IDPESSOA ) ' + #13 +
      '   AND ( R.UNIDNEGOC       = U.UNIDNEGOC ) ' + #13 +
      '   AND ( R.IDPESSOA        = U.IDPESSOA ) ' + #13 +
      '   AND ( R.MOECODIGO       = I.MOECODIGO(+) ) ' + #13 +
      '  AND (R.CODCENTROCUSTO =  CC.CODCENTROCUSTO(+))' + #13 +
      '   AND ( R.CODCENTRORESPON = C.CODCENTRORESPON(+) ) ' + #13 +
      '   AND ( R.IDPROGRAMA      = PRG.IDPROGRAMA(+) ) ' + #13 +
      '   AND ( R.IDPLANOPREV     = PLC.IDPLANOPREV(+) ) ' + #13 +
      '   AND ( R.IDPATRO         = PTR.IDPESSOA(+) ) ' + #13 +
      '   AND ( R.IDPESSOA        = C.IDPESSOA ) ');
End;

Function TCtrlMovimFinanc.ListContabil(rCodLancContabil: Double): OleVariant;
Begin
   Result := GetDataPacket('SELECT ' +
      '   LC.*, ' +
      '   U.NOME AS DESCUNIDNEG,  ' +
      '   CC.NOME AS DESCCCUSTO,  ' +
      '   P.PLANOME AS DESCPLANO, ' +
      '   PP.NOME AS NOMEPATRO, ' +
      '   PB.NOME AS DESCPLANOPREV, ' +
      '   S.DESCRICAO DESCSEGREGACRITER ' +
      'FROM ' +
      '   LANCAMENTO LC, ' +
      '   UNIDNEGOCIO U, ' +
      '   CENTCUST CC, ' +
      '   PLANOCONTA P, ' +
      '   SEGREGACRITER S, ' +
      '   PLANPREVCONTABIL PB, ' +
      '   PATRO PT, ' +
      '   PESSOA PP ' +
      'WHERE ' +
      '   (LC.PLANO = P.PLANO) AND ' +
      '   (LC.PLACONTA = P.PLACONTA) AND ' +
      '   (LC.PLNCODIGO = ' + FloatToStr(rCodLancContabil) + ')  AND ' +
      '   (LC.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND ' +
      '   (LC.IDEMPRESA = CC.IDEMPRESA(+)) AND ' +
      '   (LC.IDPESSOA = U.IDPESSOA(+)) AND ' +
      '   (LC.UNIDNEGOC = U.UNIDNEGOC(+)) AND ' +
      '   (LC.IDSEGREGACRITER = S.IDSEGREGACRITER(+)) AND ' +
      '   (LC.IDPLANOPREV = PB.IDPLANOPREV(+) ) AND ' +
      '   (LC.IDPATRO = PT.IDPESSOA(+) ) AND ' +
      '   (PT.IDPESSOA = PP.IDPESSOA(+) )');
End;

Function TCtrlMovimFinanc.EstornoFinanceiro(dDataEstorno, dDataDisp: TDateTime; bRegNaoIdent: Boolean;
   Var rCodLancFinan: Double; rIDPlano: Double;
   bIntegraContabil: Boolean): Boolean;
Begin
   MessageInfo := '';
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.EstornoFinanceiro(dDataEstorno,
            dDataDisp,
            rCodLancFinan,
            rIDPlano,
            bIntegraContabil,
            bRegNaoIdent,
            F_rIDPessoa,
            F_rIDModulo,
            F_rIDUsuario,
            F_bUsaPlanoPatro);

         If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         StartTransaction;
         Try
            Result := CtrlFinanc.EstornoFinanceiro(dDataEstorno, dDataDisp, bRegNaoIdent, rCodLancFinan,
               F_rIDPessoa, F_rIDModulo, F_rIDUsuario,
               rIDPlano,
               bIntegraContabil);

            //pendência 26934 - 11/12/2007 - exclui o lançamento de cpmf do movim. finan. estornado.
            result := ctrlImpostoRetido.Excluir(trunc(rCodLancFinan));

            If Not Result Then
               Begin
                  MessageInfo := CtrlFinanc.MessageInfo;
                  Rollback;
               End
            Else
               Commit;
         Except
            On E: Exception Do
               Begin
                  Result := False;
                  Rollback;
                  MessageInfo := E.Message;
               End;
         End;
      End;
End;

Function TCtrlMovimFinanc.GravaFinanceiro(bRegNaoIdent: Boolean; Operacao: TOperacaoFinanc;
   rIDPlano: Double;
   bIntegraContabil, bCalcImposto: Boolean): Boolean;
Var
   rCodLancFinancAux: Double;
   rPlnCodigoAux: Double;
   rTotalImposto: Double;
   sOperacao: String;
   sEntradaSaidaAux: String;
   cdsRegNI: TCMClientDataSet;
   fIdRelacionani: Double;
Begin
   MessageInfo := '';
   fIdRelacionani := 0;

   If ConnectionSide = cnsClient Then
      Begin
         Case Operacao Of
            opInclusao: sOperacao := 'I';
            opAlteracao: sOperacao := 'A';
         End;

         Result := Connection.AppServer.GravaFinanceiro(FCdsMovimFinanc.Data,
            FCdsRateioFinanc.Data,
            FCdsContabil.Data,
            bRegNaoIdent,
            sOperacao,
            rIDPlano,
            bIntegraContabil,
            bCalcImposto,
            F_rIDPessoa,
            F_rIDModulo,
            F_rIDUsuario,
            F_bUsaPlanoPatro);

         If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Try

         //Verifica o Rateio
         Result := VerificaRateio;
         If Not (Result) Then Exit;

         If ((FCdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString = 'X') Or
            (FCdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString = 'I')) And
            (FCdsMovimFinanc.FieldByName('DATACONCILIACAO').IsNull) Then
            FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime :=
               FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime;

         If (FCdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString = 'N') Or
            (FCdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString = 'C') Then
            FCdsMovimFinanc.FieldByName('DATACONCILIACAO').Clear;

         //Inclusão ou Regulraização de Lançamentos
         If (Operacao = opInclusao) Then
            Begin
               StartTransaction;
               Try
                  If bRegNaoIdent Then
                     Begin
                        cdsRegNI := TCMClientDataSet.Create(Nil);
                        Try
                           //Gera Relacionaods vazio
                           cdsRegNI.Data := GetDataPacket(CtrlFinanc.sSqlRelacionados);

                           //Estorna Lancamento Antigo
                           rCodLancFinancAux := FCdsMovimFinanc.FieldByName('CODLANCFINANC').AsFloat;
                           Result := CtrlFinanc.EstornoFinanceiro(
                              FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime,
                              FCdsMovimFinanc.FieldByName('DATADISPFINANC').AsDateTime,
                              True,
                              rCodLancFinancAux,
                              F_rIDPessoa,
                              F_rIDModulo,
                              F_rIDUsuario,
                              rIDPlano,
                              bIntegraContabil);
                           If Not (Result) Then
                              Begin
                                 MessageInfo := CtrlFinanc.MessageInfo;
                                 Rollback;
                                 Exit;
                              End;

                           //Muda Status do Lançamento antigo
                           Result := CtrlFinanc.MudaStatusConcilia('X',
                              FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime,
                              FCdsMovimFinanc.FieldByName('CODLANCFINANC').AsFloat);
                           If Not (Result) Then
                              Begin
                                 MessageInfo := CtrlFinanc.MessageInfo;
                                 Rollback;
                                 Exit;
                              End;

                           //Muda os StatusConciliação do Estorno
                           Result := CtrlFinanc.MudaStatusConcilia('J',
                              FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime,
                              rCodLancFinancAux);
                           If Not (Result) Then
                              Begin
                                 MessageInfo := CtrlFinanc.MessageInfo;
                                 Rollback;
                                 Exit;
                              End;

                           //Lança movimento de conciliação
                           rCodLancFinancAux := 0;
                           rPlnCodigoAux := 0;
                           Result := CtrlFinanc.LancaFinanceiro(
                              CdsContabil.Data,
                              F_rIDModulo,
                              FCdsMovimFinanc.FieldByName('HISTPADFINAN').AsFloat,
                              FCdsMovimFinanc.FieldByName('MOECODIGO').AsFloat,
                              F_rIDUsuario,
                              FCdsMovimFinanc.FieldByName('CODPORTADOR').AsFloat,
                              F_rIDPessoa,
                              FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat,
                              FCdsMovimFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat,
                              FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime,
                              FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime,
                              FCdsMovimFinanc.FieldByName('DATADISPFINANC').AsDateTime,
                              FCdsMovimFinanc.FieldByName('NUMCHQBORDERO').AsString,
                              FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString,
                              FCdsMovimFinanc.FieldByName('HISTORICO').AsString,
                              'J', rCodLancFinancAux, rPlnCodigoAux, rIDPlano,
                              bIntegraContabil);
                           If Not (Result) Then
                              Begin
                                 MessageInfo := CtrlFinanc.MessageInfo;
                                 Rollback;
                                 Exit;
                              End;

                           fIdRelacionani := GetSequence('RELACIONANI');

                           cdsRegNI.Append;

                           cdsRegNI.FieldByName('IDRELACIONANI').AsFloat := fIdRelacionani;

                           cdsRegNI.FieldByName('CODLANCFINANC').AsFloat := FCdsMovimFinanc.FieldByName('CODLANCFINANC').AsFloat;
                           cdsRegNI.FieldByName('DATADISP').AsDateTime := FCdsMovimFinanc.FieldByName('DATADISPFINANC').AsDateTime;
                           cdsRegNI.FieldByName('FLGNI').AsString := 'I';
                           cdsRegNI.FieldByName('FLGMARCADO').AsString := 'N';
                           cdsRegNI.Post;

                           cdsRegNI.Append;

                           cdsRegNI.FieldByName('IDRELACIONANI').AsFloat := fIdRelacionani;

                           cdsRegNI.FieldByName('IDMODORIGEMREGU').AsFloat := 9;

                           cdsRegNI.FieldByName('CODLANCFINANC').AsFloat := rCodLancFinancAux;
                           cdsRegNI.FieldByName('DATADISP').AsDateTime := FCdsMovimFinanc.FieldByName('DATADISPFINANC').AsDateTime;
                           cdsRegNI.FieldByName('FLGNI').AsString := 'N';
                           cdsRegNI.FieldByName('FLGMARCADO').AsString := 'N';
                           cdsRegNI.Post;

                           //Grava Relacionados
                           Result := CtrlFinanc.GravaRelacionados(cdsRegNI.Data);
                           If Not (Result) Then
                              Begin
                                 MessageInfo := CtrlFinanc.MessageInfo;
                                 Rollback;
                                 Exit;
                              End

                        Finally
                           cdsRegNI.Free;
                        End;
                     End //Fim Regularização
                  Else
                     Begin
                        rPlnCodigoAux := 0;
                        rCodLancFinancAux := 0;

                        Result := CtrlFinanc.LancaFinanceiro(
                           FCdsContabil.Data, F_rIDModulo,
                           FCdsMovimFinanc.FieldByName('HISTPADFINAN').AsFloat,
                           FCdsMovimFinanc.FieldByName('MOECODIGO').AsFloat,
                           F_rIDUsuario,
                           FCdsMovimFinanc.FieldByName('CODPORTADOR').AsFloat,
                           F_rIDPessoa,
                           FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat,
                           FCdsMovimFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat,
                           FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime,
                           FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime,
                           FCdsMovimFinanc.FieldByName('DATADISPFINANC').AsDateTime,
                           FCdsMovimFinanc.FieldByName('NUMCHQBORDERO').AsString,
                           FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString,
                           FCdsMovimFinanc.FieldByName('HISTORICO').AsString,
                           FCdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString,
                           rCodLancFinancAux, rPlnCodigoAux, rIDPlano,
                           bIntegraContabil);

                        If Not (Result) Then
                           Begin
                              MessageInfo := CtrlFinanc.MessageInfo;
                              Rollback;
                              Exit;
                           End;
                     End;
                  If (FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat = 0) And
                     (FCdsMovimFinanc.FieldByName('HISTPADFINAN').AsFloat = 11) Then //'Transferência Entre Planos'
                     Begin
                        Result := ExecSQL('UPDATE MOVIMFINANC SET CODLANCTRANSF = ' + FloatToStr(rCodLancFinancAux) +
                           ' WHERE (CODLANCFINANC = ' + FloatToStr(rCodLancFinancAux) + ')');

                        If Not (Result) Then
                           Begin
                              MessageInfo := 'O banco de dados não conseguiu atualizar o campo MOVIMFINANC.CODLANCTRANSF!';
                              Rollback;
                              Exit;
                           End;
                     End;

                  FCdsRateioFinanc.First;
                  While Not (FCdsRateioFinanc.EOF) Do
                     Begin

                        //=========== Final Imposto Retido ============================

                        Result := CtrlFinanc.LancaRateioFinanc(
                           FCdsRateioFinanc.FieldByName('UNIDNEGOC').AsFloat,
                           FCdsRateioFinanc.FieldByName('MOECODIGO').AsFloat,
                           F_rIDPessoa,
                           FCdsMovimFinanc.FieldByName('CODPORTADOR').AsFloat,
                           FCdsRateioFinanc.FieldByName('VALOR').AsFloat,
                           FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat,
                           FCdsRateioFinanc.FieldByName('CODTIPRECDES').AsString,
                           FCdsRateioFinanc.FieldByName('RECPAG').AsString,
                           FCdsRateioFinanc.FieldByName('CODCENTRORESPON').AsString,
                           FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime,
                           rCodLancFinancAux,
                           FCdsRateioFinanc.FieldByName('CODCENTROCUSTO').AsString,
                           FCdsRateioFinanc.FieldByName('IDPROGRAMA').AsFloat,
                           FCdsRateioFinanc.FieldByName('IDPATRO').AsFloat,
                           FCdsRateioFinanc.FieldByName('IDPLANOPREV').AsFloat,
                           FCdsRateioFinanc.FieldByName('CODTIPDOC').AsFloat,
                           rIDPlano,
                           FCdsRateioFinanc.FieldByName('IDSEGREGACRITER').AsInteger);
                        If Not (Result) Then
                           Begin
                              MessageInfo := CtrlFinanc.MessageInfo;
                              Rollback;
                              Exit;
                           End;

                        FCdsRateioFinanc.Next;
                     End;

                  //Grava LOG
                  If (Operacao = opInclusao) Then
                     Result := CtrlPadroes.GravaLogOperacoes(F_rIDPessoa, F_rIDModulo, F_rIDUsuario,
                        'Inclusão no Movimento Financeiro', False)
                  Else
                     Result := CtrlPadroes.GravaLogOperacoes(F_rIDPessoa, F_rIDModulo, F_rIDUsuario,
                        'Alteração no Movimento Financeiro', False);
                  If Not (Result) Then
                     Begin
                        MessageInfo := CtrlPadroes.MessageInfo;
                        Rollback;
                     End
                  Else

                     FcodLancFinanc := trunc(rCodLancFinancAux);
                  If bCalcImposto Then
                     Begin
                        result := LancaCPMF(FCdsRateioFinanc.Data);
                        If Not result Then
                           MessageInfo := CtrlPadroes.MessageInfo;
                     End; //if

                  Commit;

               Except
                  On E: Exception Do
                     Begin
                        Result := False;
                        Rollback;
                        MessageInfo := E.Message;
                     End;
               End;
            End;

         //Alteração de Lançamentos
         If (Operacao = opAlteracao) Then
            Begin
               StartTransaction;
               Try
                  rPlnCodigoAux := FCdsMovimFinanc.FieldByName('PLNCODIGO').AsFloat;
                  rCodLancFinancAux := FCdsMovimFinanc.FieldByName('CODLANCFINANC').AsFloat;
                  Result := CtrlFinanc.AlteraFinanceiro(
                     FCdsContabil.Data,
                     FCdsMovimFinanc.FieldByName('HISTPADFINAN').AsFloat,
                     F_rIDModulo,
                     FCdsMovimFinanc.FieldByName('MOECODIGO').AsFloat,
                     F_rIDUsuario,
                     FCdsMovimFinanc.FieldByName('CODPORTADOR').AsFloat,
                     F_rIDPessoa,
                     FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat,
                     FCdsMovimFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat,
                     FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime,
                     FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime,
                     FCdsMovimFinanc.FieldByName('NUMCHQBORDERO').AsString,
                     FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString,
                     FCdsMovimFinanc.FieldByName('HISTORICO').AsString,
                     FCdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString,
                     rPlnCodigoAux, rCodLancFinancAux,
                     CtrlParamIntegra.Plano, bIntegraContabil);

                  If Not (Result) Then
                     Begin
                        MessageInfo := CtrlFinanc.MessageInfo;
                        Rollback;
                        Exit;
                     End;

                  Result := CtrlFinanc.ExcluiRateioFinanc(rCodLancFinancAux);

                  FCdsRateioFinanc.First;
                  While Not (FCdsRateioFinanc.EOF) Do
                     Begin
                        Result := CtrlFinanc.LancaRateioFinanc(
                           FCdsRateioFinanc.FieldByName('UNIDNEGOC').AsFloat,
                           FCdsRateioFinanc.FieldByName('MOECODIGO').AsFloat,
                           F_rIDPessoa,
                           FCdsMovimFinanc.FieldByName('CODPORTADOR').AsFloat,
                           FCdsRateioFinanc.FieldByName('VALOR').AsFloat,
                           FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat,
                           FCdsRateioFinanc.FieldByName('CODTIPRECDES').AsString,
                           FCdsRateioFinanc.FieldByName('RECPAG').AsString,
                           FCdsRateioFinanc.FieldByName('CODCENTRORESPON').AsString,
                           FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime,
                           rCodLancFinancAux,
                           FCdsRateioFinanc.FieldByName('CODCENTROCUSTO').AsString,
                           FCdsRateioFinanc.FieldByName('IDPROGRAMA').AsFloat,
                           FCdsRateioFinanc.FieldByName('IDPATRO').AsFloat,
                           FCdsRateioFinanc.FieldByName('IDPLANOPREV').AsFloat,
                           FCdsRateioFinanc.FieldByName('CODTIPDOC').AsFloat,
                           CtrlParamIntegra.Plano,
                           FCdsRateioFinanc.FieldByName('IDSEGREGACRITER').AsInteger);
                        If Not (Result) Then
                           Begin
                              MessageInfo := CtrlFinanc.MessageInfo;
                              Rollback;
                              Exit;
                           End;
                        FCdsRateioFinanc.Next;
                     End;

                  FCdsMovimFinanc.Edit;
                  FCdsMovimFinanc.FieldByName('PLNCODIGO').AsFloat := rPlnCodigoAux;
                  FCdsMovimFinanc.Post;

                  If bCalcImposto Then
                     Begin
                        result := ctrlImpostoRetido.Excluir(trunc(rCodLancFinancAux));
                        If Not result Then
                           Raise Exception.Create(ctrlImpostoRetido.MessageInfo);

                        result := LancaCPMF(FCdsRateioFinanc.Data);

                        If Not result Then
                           Raise Exception.Create(self.MessageInfo);
                     End; //if

                  Commit;

               Except
                  On E: Exception Do
                     Begin
                        Result := False;
                        Rollback;
                        MessageInfo := E.Message;
                     End;
               End;
            End;

         If Result And bRegNaoIdent Then
            Begin
               With TCtrlMensagens.Create Do
                  Begin
                     Try
                        InitializeAs(Self);
                        EnviaMensagemContexto(trunc(F_rIDUsuario), 1,
                           ['CODLANCFINANC',
                           'DATACONCILIA',
                              'VALOR'],
                              [FCdsMovimFinanc.FieldByName('CODLANCFINANC').AsString,
                           FormatDateTime('dd/mm/yyyy', FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime),
                              FormatFloat('#,##0.00', FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat)]);
                     Finally
                        Free;
                     End;
                  End;
            End;

      Except
         On E: Exception Do
            Begin
               Result := False;
               MessageInfo := E.Message;
            End;
      End;
End;

Function TCtrlMovimFinanc.ExcluiFinanceiro(rCodLancFinan: Double): Boolean;
Begin
   MessageInfo := '';
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.ExcluiFinanceiro(rCodLancFinan,
            F_rIDPessoa,
            F_rIDModulo,
            F_rIDUsuario,
            F_bUsaPlanoPatro);

         If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;

            result := ctrlImpostoRetido.Excluir(trunc(rCodLancFinan));
            If Not result Then
               Raise Exception.Create(ctrlImpostoRetido.MessageInfo);

            //Exclui Lançamento
            Result := CtrlFinanc.ExcluiFinanceiro(rCodLancFinan);
            If Not (Result) Then
               Begin
                  MessageInfo := CtrlFinanc.MessageInfo;
                  Rollback;
               End
            Else
               Begin
                  //Grava LOG
                  Result := CtrlPadroes.GravaLogOperacoes(F_rIDPessoa, F_rIDModulo, F_rIDUsuario,
                     'Exclusão no Movimento Financeiro', False);
                  If Not (Result) Then
                     Begin
                        MessageInfo := CtrlPadroes.MessageInfo;
                        Rollback;
                     End
                  Else
                     Commit;
               End;
         Except
            On E: Exception Do
               Begin
                  MessageInfo := E.Message;
                  Result := False;
                  Rollback;
               End;
         End;
      End;
End;

Function TCtrlMovimFinanc.GeraImpostoRateio(Var rImposto: Double): Boolean;
Var
   rTotalImposto: Double;
   rValorCheckBanco: Double;
   sIntegraBackRecPag: String;
   cdsRateioFinancAux: TClientDataSet;
Begin
   Result := True;
   MessageInfo := '';
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.GeraImpostoRateio(rImposto,
            F_rIDPessoa,
            F_rIDModulo,
            F_rIDUsuario,
            F_bUsaPlanoPatro);

         If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            cdsRateioFinancAux := TCMClientDataSet.Create(Nil);
            Try
               //=========== Início Imposto Retido ============================
               rTotalImposto := 0;
               If (FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString = 'E') Then
                  sIntegraBackRecPag := 'R'
               Else
                  sIntegraBackRecPag := 'P';

               //Copia Dados do Movimento Financeiro
               cdsRateioFinancAux.Data := FCdsRateioFinanc.Data;

               //Cálculo e Lançamento das linhas de Imposto
               cdsRateioFinancAux.First;
               While Not (cdsRateioFinancAux.Eof) Do
                  Begin
                     CtrlImpostoRetido.DataProgramada :=
                        FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime;
                     CtrlImpostoRetido.OperacaoDocumento := '2 ';
                     CtrlImpostoRetido.IdForCli := 0;
                     CtrlImpostoRetido.CodDocumento := 0;
                     CtrlImpostoRetido.NumLancto := 0;
                     CtrlImpostoRetido.ValorLancto := cdsRateioFinancAux.FieldByName('VALOR').AsFloat;
                     CtrlImpostoRetido.ValorLiquido := cdsRateioFinancAux.FieldByName('VALOR').AsFloat;
                     CtrlImpostoRetido.DataLancto := FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime;
                     CtrlImpostoRetido.DataEmissao := FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime;

                     If (sIntegraBackRecPag = 'R') Then
                        Begin
                           If (cdsRateioFinancAux.FieldByName('RECPAG').AsString = 'R') Then
                              CtrlImpostoRetido.DebCre := 'D'
                           Else
                              CtrlImpostoRetido.DebCre := 'C';
                        End
                     Else
                        Begin
                           If (cdsRateioFinancAux.FieldByName('RECPAG').AsString = 'D') Then
                              CtrlImpostoRetido.DebCre := 'C'
                           Else
                              CtrlImpostoRetido.DebCre := 'D';
                        End;

                     CtrlImpostoRetido.IdEmpresa := Trunc(F_rIDPessoa);
                     CtrlImpostoRetido.IdModulo := Trunc(F_rIDModulo);
                     CtrlImpostoRetido.IdUsuario := Trunc(F_rIDUsuario);
                     CtrlImpostoRetido.UsaPlanoPatro := F_bUsaPlanoPatro;
                     CtrlImpostoRetido.IntegraContab := CtrlParamIntegra.IntegraContab;
                     CtrlImpostoRetido.IdPlanoConta := CtrlParamIntegra.Plano;

                     With TCMClientDataSet.Create(Nil) Do
                        Try
                           Data := GetDataPacket('SELECT PACDOBRADA FROM PARAMCONTAB WHERE (IDPESSOA = ' +
                              FloatToStr(F_rIDPessoa) + ') ');
                           CtrlImpostoRetido.PartidaDobrada := (FieldByName('PACDOBRADA').AsString = 'S');
                        Finally
                           Free;
                        End;

                     CtrlImpostoRetido.CodTipRecDes := cdsRateioFinancAux.FieldByName('CODTIPRECDES').AsString;
                     CtrlImpostoRetido.RecPag := cdsRateioFinancAux.FieldByName('RECPAG').AsString[1];
                     CtrlImpostoRetido.MomentoLancamento := mlLancamento;
                     CtrlImpostoRetido.CodTipoDoc := Trunc(rTipoDoc);
                     CtrlImpostoRetido.Incluir;

                     If Not (CtrlImpostoRetido.CdsSimulacao.IsEmpty) Then
                        Begin
                           CtrlImpostoRetido.CdsSimulacao.First;
                           While Not (CtrlImpostoRetido.CdsSimulacao.Eof) Do
                              Begin
                                 With TCMClientDataSet.Create(Nil) Do
                                    Try
                                       Data := GetDataPacket('SELECT CODTIPRECDES, RECPAG ' +
                                          'FROM TIPOAGRE ' +
                                          'WHERE (CODTIPRECDES IS NOT NULL) AND ' +
                                          '      (CODTIPOCUSTAGREG = ' +
                                          IntToStr(CtrlImpostoRetido.CdsSimulacao.FieldByName('IDIMPOSTO').AsInteger) + ')');

                                       If Not (IsEmpty) Then
                                          Begin
                                             //Limpa qryContabil
                                             FCdsContabil.EmptyDataSet;
                                             rTotalImposto := rTotalImposto +
                                                CtrlImpostoRetido.CdsSimulacao.FieldByName('VALORIMPOSTO').AsFloat;

                                             FCdsRateioFinanc.Append;
                                             FCdsRateioFinanc.FieldByName('IDPESSOA').AsFloat :=
                                                cdsRateioFinancAux.FieldByName('IDPESSOA').AsFloat;
                                             FCdsRateioFinanc.FieldByName('UNIDNEGOC').AsFloat :=
                                                cdsRateioFinancAux.FieldByName('UNIDNEGOC').AsFloat;
                                             FCdsRateioFinanc.FieldByName('RECPAG').AsString :=
                                                FieldByName('RECPAG').AsString;
                                             FCdsRateioFinanc.FieldByName('CODCENTRORESPON').AsString :=
                                                cdsRateioFinancAux.FieldByName('CODCENTRORESPON').AsString;
                                             FCdsRateioFinanc.FieldByName('CODTIPRECDES').AsString :=
                                                FieldByName('CODTIPRECDES').AsString;
                                             FCdsRateioFinanc.FieldByName('VALOR').AsFloat :=
                                                CtrlImpostoRetido.CdsSimulacao.FieldByName('VALORIMPOSTO').AsFloat;
                                             FCdsRateioFinanc.FieldByName('CODCENTROCUSTO').AsString :=
                                                cdsRateioFinancAux.FieldByName('CODCENTROCUSTO').AsString;
                                             FCdsRateioFinanc.FieldByName('IDEMPRESA').AsFloat :=
                                                cdsRateioFinancAux.FieldByName('IDEMPRESA').AsFloat;
                                             FCdsRateioFinanc.FieldByName('IDPATRO').AsFloat :=
                                                cdsRateioFinancAux.FieldByName('IDPATRO').AsFloat;
                                             FCdsRateioFinanc.FieldByName('IDPROGRAMA').AsFloat :=
                                                cdsRateioFinancAux.FieldByName('IDPROGRAMA').AsFloat;
                                             FCdsRateioFinanc.FieldByName('IDPLANOPREV').AsFloat :=
                                                cdsRateioFinancAux.FieldByName('IDPLANOPREV').AsFloat;
                                             FCdsRateioFinanc.FieldByName('CODTIPDOC').AsFloat :=
                                                cdsRateioFinancAux.FieldByName('CODTIPDOC').AsFloat;
                                             FCdsRateioFinanc.Post;
                                          End;
                                    Finally
                                       Free;
                                    End;
                                 CtrlImpostoRetido.CdsSimulacao.Next;
                              End;
                        End;
                     cdsRateioFinancAux.Next;
                  End;

               rImposto := rTotalImposto;
               //=========== Final Imposto Retido ============================
            Finally
               cdsRateioFinancAux.Free;
            End;
         Except
            On E: Exception Do
               Begin
                  Result := False;
                  MessageInfo := E.Message;
               End;
         End;
      End;
End;

Function TCtrlMovimFinanc.VerificaRateio: Boolean;
Var
   rTotalRateioOM: Double;
   rTotalRateio: Double;
Begin
   Result := True;
   rTotalRateio := 0;
   rTotalRateioOM := 0;
   MessageInfo := '';
   FCdsRateioFinanc.First;
   While Not (FCdsRateioFinanc.Eof) Do
      Begin
         If ((FCdsRateioFinanc.FieldByName('RECPAG').AsString = 'R') And
            (FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString = 'E')) Or
            ((FCdsRateioFinanc.FieldByName('RECPAG').AsString = 'P') And
            (FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString = 'S')) Then
            Begin
               rTotalRateio := rTotalRateio + FCdsRateioFinanc.FieldByName('VALOR').AsFloat;
               rTotalRateioOM := rTotalRateioOM + FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat;
            End
         Else
            Begin
               rTotalRateio := rTotalRateio - FCdsRateioFinanc.FieldByName('VALOR').AsFloat;
               rTotalRateioOM := rTotalRateioOM - FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat;
            End;
         FCdsRateioFinanc.Next;
      End;

   If (FormatFloat('#,##0.00', abs(rTotalRateio)) <>
      FormatFloat('#,##0.00', abs(FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat))) Then
      Begin
         Result := False;
         MessageInfo := 'Total do Rateio não bate com o Valor do Lançamento';
         Exit;
      End;

   If (FormatFloat('#,##0.00', abs(rTotalRateioOM)) <>
      FormatFloat('#,##0.00', abs(FCdsMovimFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat))) Then
      Begin
         Result := False;
         MessageInfo := 'Total do Rateio em outra moeda não bate com o ' +
            'Valor do Lançamento em outra moeda';
         Exit;
      End;
End;

Function TCtrlMovimFinanc.GeraContabilizacao(sContaBanco, sCCustoBanco: String;
   rSubContaBanco: Double;
   sContaNI, sCCustoNI: String;
   rSubContaNI: Double;
   bRegNaoIdent: Boolean;
   rIDPlano: Double): Boolean;
Var
   RegContabil: Array[1..2] Of TContabil;
   rLacNumLan: Double;
   iIdSegregaCriter: integer;
   sContaSegregaCriter: String;
   _CdsLocal: TClientDataSet;
   bPartidaDobrada: boolean;
Begin
   Result := True;

   //Recupera o flag que indica se há partida dobrada ou não.
   With TCMClientDataSet.Create(Nil) Do
      Try
         Data := GetDataPacket('SELECT PACDOBRADA FROM PARAMCONTAB WHERE (IDPESSOA = ' + FloatToStr(F_rIDPessoa) + ') ');
         bPartidaDobrada := (UpperCase(FieldByName('PACDOBRADA').AsString) = 'S');
      Finally
         Free;
      End;

   MessageInfo := '';
   rLacNumLan := 1;
   Try
      FcdsContabil.First;
      If (FcdsContabil.IsEmpty) And (FCdsMovimFinanc.FieldByName('CODPORTADOR').asFloat <> 0) Then
         Begin
            FCdsRateioFinanc.First;
            While Not (FCdsRateioFinanc.Eof) Do
               Begin
                  RegContabil[1].PlaConta := sContaBanco;
                  RegContabil[1].CodCentroCusto := sCCustoBanco;
                  RegContabil[1].DescUnidNeg := FCdsRateioFinanc.FieldByName('DESCUNIDNEG').AsString;
                  RegContabil[1].UnidNegoc := FCdsRateioFinanc.FieldByName('UNIDNEGOC').AsFloat;
                  RegContabil[1].CodSubConta := rSubContaBanco;
                  RegContabil[1].LacValor := FCdsRateioFinanc.FieldByName('VALOR').AsFloat;
                  RegContabil[1].LacValHist := FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat;
                  RegContabil[1].IDPatro := FCdsRateioFinanc.FieldByName('IDPATRO').AsFloat;
                  RegContabil[1].IDPlanoPrev := FCdsRateioFinanc.FieldByName('IDPLANOPREV').AsFloat;
                  RegContabil[1].LacNumDoc := FCdsMovimFinanc.FieldByName('NUMCHQBORDERO').AsString;
                  RegContabil[1].LacNumLan := rLacNumLan;
                  RegContabil[1].DescPatro := FCdsRateioFinanc.FieldByName('NOME_PATRO').AsString;
                  RegContabil[1].DescPlanPrev := FCdsRateioFinanc.FieldByName('NOME_PLANO').AsString;

                  //Distribui o Histórico pelas 5 linhas disponíveis
                  GeralFinanc.ArrumaHistorico((FCdsMovimFinanc.FieldByName('HISTORICO').AsString + ' - ' +
                     FCdsMovimFinanc.FieldByName('DESCPORTADOR').AsString),
                     RegContabil[1].LacHist1, RegContabil[1].LacHist2,
                     RegContabil[1].LacHist3, RegContabil[1].LacHist4,
                     RegContabil[1].LacHist5);

                  If (FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString = 'S') Then
                     Begin
                        RegContabil[1].LacDebCre := 'C';
                        RegContabil[1].LacTipo := '1';

                        If (FCdsRateioFinanc.FieldByName('RECPAG').AsString = 'R') Then
                           Begin
                              RegContabil[1].LacValor := -RegContabil[1].LacValor;
                              RegContabil[1].LacValHist := -RegContabil[1].LacValHist;
                           End;
                     End
                  Else
                     Begin
                        RegContabil[1].LacDebCre := 'D';
                        RegContabil[1].LacTipo := '0';

                        If (FCdsRateioFinanc.FieldByName('RECPAG').AsString = 'P') Then
                           Begin
                              RegContabil[1].LacValor := -RegContabil[1].LacValor;
                              RegContabil[1].LacValHist := -RegContabil[1].LacValHist;
                           End;
                     End;

                  RegContabil[2].IDPatro := FCdsRateioFinanc.FieldByName('IDPATRO').AsFloat;
                  RegContabil[2].IDPlanoPrev := FCdsRateioFinanc.FieldByName('IDPLANOPREV').AsFloat;
                  RegContabil[2].LacNumDoc := FCdsMovimFinanc.FieldByName('NUMCHQBORDERO').AsString;
                  RegContabil[2].LacNumLan := rLacNumLan;
                  RegContabil[2].LacHist1 := RegContabil[1].LacHist1;
                  RegContabil[2].LacHist2 := RegContabil[1].LacHist2;
                  RegContabil[2].LacHist3 := RegContabil[1].LacHist3;
                  RegContabil[2].LacHist4 := RegContabil[1].LacHist4;
                  RegContabil[2].LacHist5 := RegContabil[1].LacHist5;
                  RegContabil[2].DescPatro := RegContabil[1].DescPatro;
                  RegContabil[2].DescPlanPrev := RegContabil[1].DescPlanPrev;

                  If (FCdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString = 'I') And
                     Not (bRegNaoIdent) Then
                     Begin
                        RegContabil[2].PlaConta := sContaNI;
                        RegContabil[2].CodCentroCusto := sCCustoNI;
                        RegContabil[2].CodSubConta := rSubContaNI;
                        RegContabil[2].LacValor := FCdsRateioFinanc.FieldByName('VALOR').AsFloat;
                        RegContabil[2].LacValHist := FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat;

                        If (FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString = 'S') Then
                           Begin
                              RegContabil[2].LacDebCre := 'D';
                              RegContabil[2].LacTipo := '0';
                           End
                        Else
                           Begin
                              RegContabil[2].LacDebCre := 'C';
                              RegContabil[2].LacTipo := '1';
                           End;
                     End
                  Else
                     Begin
                        RegContabil[2].CodCentroCusto := FCdsRateioFinanc.FieldByName('CODCENTROCUSTO').AsString;
                        RegContabil[2].DescUnidNeg := FCdsRateioFinanc.FieldByName('DESCUNIDNEG').AsString;

                        RegContabil[2].PlaConta := CtrlLancamento.BuscaContaContabil(Trunc(F_rIDPessoa),
                           FCdsRateioFinanc.FieldByName('IDPROGRAMA').AsInteger,
                           FCdsRateioFinanc.FieldByName('CODTIPRECDES').AsString,
                           FCdsRateioFinanc.FieldByName('CODCENTROCUSTO').AsString,
                           FCdsRateioFinanc.FieldByName('RECPAG').AsString);

                        RegContabil[2].UnidNegoc := FCdsRateioFinanc.FieldByName('UNIDNEGOC').AsFloat;
                        RegContabil[2].CodSubConta := 0;
                        RegContabil[2].LacValor := FCdsRateioFinanc.FieldByName('VALOR').AsFloat;
                        RegContabil[2].LacValHist := FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat;

                        If (FCdsRateioFinanc.FieldByName('RECPAG').AsString = 'R') Then
                           Begin
                              RegContabil[2].LacDebCre := 'C';
                              RegContabil[2].LacTipo := '1';
                           End
                        Else
                           Begin
                              RegContabil[2].LacDebCre := 'D';
                              RegContabil[2].LacTipo := '0';
                           End;
                     End;

                  iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(trunc(rIDPlano),
                     trunc(RegContabil[2].IDPlanoPrev),
                     trunc(RegContabil[2].IDPatro),
                     RegContabil[2].PlaConta,
                     sContaSegregaCriter);
                  // não foi encontrado critério na conta contrária a banco, procurar no banco
                  If iIdSegregaCriter = -1 Then
                     iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(trunc(rIDPlano),
                        trunc(RegContabil[1].IDPlanoPrev),
                        trunc(RegContabil[1].IDPatro),
                        RegContabil[1].PlaConta,
                        sContaSegregaCriter);
                  RegContabil[1].IdSegregaCriter := iIdSegregaCriter;
                  RegContabil[2].IdSegregaCriter := iIdSegregaCriter;

                  FCdsRateioFinanc.Edit;
                  FCdsRateioFinanc.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
                  FCdsRateioFinanc.Post;

                  If iIdSegregaCriter = -1 Then Begin
                        RegContabil[1].DescSegregaCriter := '';
                        RegContabil[2].DescSegregaCriter := '';
                     End Else Begin
                        Try
                           _CdsLocal := TClientDataSet.Create(Nil);
                           _CdsLocal.Data := CtrlSegregacao.ListaSegregaCriter(iIdSegregaCriter);
                           RegContabil[1].DescSegregaCriter := _CdsLocal.FieldByName('DESCRICAO').AsString;
                           RegContabil[2].DescSegregaCriter := RegContabil[1].DescSegregaCriter;
                        Finally
                           _CdsLocal.Free;
                        End;
                     End;

                  Result := GeraRegistroContabil(RegContabil[1], rIDPlano,
                     bPartidaDobrada);

                  If Not (Result) Then Exit;

                  Result := GeraRegistroContabil(RegContabil[2], rIDPlano,
                     bPartidaDobrada);

                  If Not (Result) Then Exit;

                  rLacNumLan := rLacNumLan + 1;
                  FCdsRateioFinanc.Next;
               End;
         End;
   Except
      On E: Exception Do
         Begin
            Result := False;
            MessageInfo := E.Message;
         End;
   End;
End;

Function TCtrlMovimFinanc.GeraRegistroContabil(RegContabil: TContabil; rIDPlano: Double;
   bPartidaDobrada: Boolean): Boolean;
Var
   sDescContaAux: String;
   sSubContaAux: String;
   bObrigaCCustoAux: Boolean;
   cdsAux: TCMClientDataSet;
   sDescCCustoAux: String;
Begin
   Result := True;
   MessageInfo := '';
   Try
      If (RegContabil.PlaConta = '') Then Exit;

      FCdsContabil.First;

      //Testa se há partida dobrada. Se houver, contabiliza novo crédito.
      If (Not bPartidaDobrada) And
         (FCdsContabil.Locate
         ('PLACONTA;CODCENTROCUSTO;UNIDNEGOC;CODSUBCONTA;LACDEBCRE;LACTIPO;' +
         'IDSEGREGACRITER;IDPLANOPREV;IDPATRO',
         VarArrayOf([RegContabil.PlaConta,
         RegContabil.CodCentroCusto,
            RegContabil.UnidNegoc,
            RegContabil.CodSubConta,
            RegContabil.LacDebCre,
            RegContabil.LacTipo,
            RegContabil.IdSegregaCriter,
            RegContabil.IdPlanoPrev,
            RegContabil.IdPatro]), [loCaseInsensitive])) Then
         Begin
            FCdsContabil.Edit;
            FCdsContabil.FieldByName('LACVALOR').AsFloat :=
               FCdsContabil.FieldByName('LACVALOR').AsFloat + RegContabil.LacValor;
            FCdsContabil.FieldByName('LACVALHIST').AsFloat :=
               FCdsContabil.FieldByName('LACVALHIST').AsFloat + RegContabil.LacValHist;
            FCdsContabil.Post;
            If (FCdsContabil.FieldByName('LACVALOR').AsFloat = 0) Then FCdsContabil.Delete;
         End

      Else
         Begin
            Result := GeralFinanc.BuscaDadosConta(RegContabil.PlaConta, rIDPlano, False,
               sDescContaAux, sSubContaAux, bObrigaCCustoAux);
            If Not (Result) Then
               Begin
                  MessageInfo := GeralFinanc.MessageInfo;
                  Exit;
               End;

            //Testa Centro de Custo
            sDescCCustoAux := '';
            If (RegContabil.CodCentroCusto <> '') Then
               Begin
                  cdsAux := TCMClientDataSet.Create(Nil);
                  Try
                     cdsAux.Data := GetDataPacket('SELECT NOME FROM CENTCUST ' +
                        'WHERE (CODCENTROCUSTO  = ''' + RegContabil.CodCentroCusto + ''') AND ' +
                        '      (IDEMPRESA = ' + FloatToStr(F_rIDPessoa) + ') AND ' +
                        '      ((ATIVO = ''S'') OR (ATIVO IS NULL)) ');
                     If cdsAux.IsEmpty Then
                        Begin
                           Result := False;
                           MessageInfo := 'Centro de Custo ' + RegContabil.CodCentroCusto + ' Não Cadastrado. Verifique.';
                           Exit;
                        End;
                     sDescCCustoAux := cdsAux.FieldByName('NOME').AsString;
                  Finally
                     cdsAux.Free;
                  End;
               End;

            FCdsContabil.Append;
            FCdsContabil.FieldByName('PLACONTA').AsString := RegContabil.PlaConta;
            FCdsContabil.FieldByName('PLANO').AsFloat := rIDPlano;
            FCdsContabil.FieldByName('CODCENTROCUSTO').AsString := RegContabil.CodCentroCusto;
            FCdsContabil.FieldByName('DESCCCUSTO').AsString := sDescCCustoAux;
            FCdsContabil.FieldByName('DESCPLANO').AsString := sDescContaAux;
            FCdsContabil.FieldByName('UNIDNEGOC').AsFloat := RegContabil.UnidNegoc;
            FCdsContabil.FieldByName('DESCUNIDNEG').AsString := RegContabil.DescUnidNeg;
            FCdsContabil.FieldByName('LACVALOR').AsFloat := RegContabil.LacValor;
            FCdsContabil.FieldByName('LACVALHIST').AsFloat := RegContabil.LacValHist;
            FCdsContabil.FieldByName('LACHIST1').AsString := RegContabil.LacHist1;
            FCdsContabil.FieldByName('LACHIST2').AsString := RegContabil.LacHist2;
            FCdsContabil.FieldByName('LACHIST3').AsString := RegContabil.LacHist3;
            FCdsContabil.FieldByName('LACHIST4').AsString := RegContabil.LacHist4;
            FCdsContabil.FieldByName('LACHIST5').AsString := RegContabil.LacHist5;
            FCdsContabil.FieldByName('LACNUMDOC').AsString := RegContabil.LacNumDoc;
            FCdsContabil.FieldByName('LACDEBCRE').AsString := RegContabil.LacDebCre;
            FCdsContabil.FieldByName('LACTIPO').AsString := RegContabil.LacTipo;
            FCdsContabil.FieldByName('IDPATRO').AsFloat := RegContabil.IDPatro;
            FCdsContabil.FieldByName('IDPLANOPREV').AsFloat := RegContabil.IDPlanoPrev;
            //O Campo LACNUMLAN será usado como identificador de um par de registros na Partida Dobrada
            FCdsContabil.FieldByName('LACNUMLAN').AsFloat := RegContabil.LacNumLan;
            FCdsContabil.FieldByName('IDSEGREGACRITER').AsInteger := RegContabil.IdSegregaCriter;
            FCdsContabil.FieldByName('DESCPLANOPREV').AsString := RegContabil.DescPlanPrev;
            FCdsContabil.FieldByName('NOMEPATRO').AsString := RegContabil.DescPatro;
            FCdsContabil.FieldByName('DESCSEGREGACRITER').AsString := RegContabil.DescSegregaCriter;

            If (RegContabil.CodSubConta <> 0) Then
               FCdsContabil.FieldByName('CODSUBCONTA').AsFloat := RegContabil.CodSubConta;
            FCdsContabil.Post;
         End;
   Except
      On E: Exception Do
         Begin
            Result := False;
            MessageInfo := E.Message;
         End;
   End;
End;

Function TCtrlMovimFinanc.VerificaContabilizacao(rIDPlano: Double; sContaBanco: String;
   rSubContaBanco: Double; iPlanoCC: Integer): Boolean;
Var
   rValorCheckBanco: Double;
   rValorCheckContab: Double;
   rTotalContab: Double;
   rValorBanco: Double;
   sDescContaAux: String;
   sSubContaAux: String;
   bObrigaCCustoAux: Boolean;
   cdsAux: TCMClientDataSet;
Begin
   Result := True;
   MessageInfo := '';
   rValorCheckContab := 0;
   cdsAux := TCMClientDataSet.Create(Nil);
   Try
      Try
         If FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString = 'S' Then
            rValorCheckBanco := -FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat
         Else
            rValorCheckBanco := FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat;
         rTotalContab := 0;
         rValorBanco := 0;
         FCdsContabil.First;
         While Not (FCdsContabil.Eof) Do
            Begin
               If (FCdsContabil.FieldByName('LACDEBCRE').IsNull) Or
                  (FCdsContabil.FieldByName('PLACONTA').IsNull) Or
                  (FCdsContabil.FieldByName('UNIDNEGOC').IsNull) Or
                  (FCdsContabil.FieldByName('LACVALOR').AsFloat = 0) Then
                  Begin
                     Result := False;
                     MessageInfo := 'Faltam alguns dados para completar a Contabilização. Verifique';
                     Exit;
                  End;

               Result := GeralFinanc.BuscaDadosConta(FcdsContabil.FieldByName('PLACONTA').AsString,
                  FcdsContabil.FieldByName('PLANO').AsFloat,
                  False, sDescContaAux, sSubContaAux, bObrigaCCustoAux);
               If Not (Result) Then
                  Begin
                     MessageInfo := GeralFinanc.MessageInfo;
                     Exit;
                  End;

               If sDescContaAux = '' Then Exit;

               //Crítica de falta de Centro de Custo de Contas que o Obrigam
               If (bObrigaCCustoAux) And (FCdsContabil.FieldByName('CODCENTROCUSTO').isNull) Then
                  Begin
                     cdsAux.Data := CtrlListTerceiros.ListCentroCustoxConta(F_rIDPessoa, rIDPlano,
                        FCdsContabil.FieldByName('PLACONTA').AsString, iPlanoCC);

                     If Not (cdsAux.IsEmpty) And (cdsAux.RecordCount = 1) Then
                        Begin
                           FCdsContabil.Edit;
                           FCdsContabil.FieldByName('CODCENTROCUSTO').AsString :=
                              cdsAux.FieldByName('CODCENTROCUSTO').AsString;
                           FCdsContabil.Post;
                        End
                     Else
                        Begin
                           Result := False;
                           MessageInfo := 'Obrigatório preencher o Centro de Custo da Conta ' +
                              FcdsContabil.FieldByName('PLACONTA').AsString;
                           Exit;
                        End;
                  End;

               If (FcdsContabil.FieldByName('LACDEBCRE').AsString = 'D') Then
                  rTotalContab := rTotalContab + FcdsContabil.FieldByName('LACVALOR').AsFloat
               Else
                  rTotalContab := rTotalContab - FcdsContabil.FieldByName('LACVALOR').AsFloat;

               If (FcdsContabil.FieldByName('PLACONTA').AsString = Trim(sContaBanco)) And
                  (FcdsContabil.FieldByName('CODSUBCONTA').AsFloat = rSubContaBanco) Then
                  Begin
                     If (FcdsContabil.FieldByName('LACDEBCRE').AsString = 'D') Then
                        rValorBanco := rValorBanco + FcdsContabil.FieldByName('LACVALOR').AsFloat
                     Else
                        rValorBanco := rValorBanco - FcdsContabil.FieldByName('LACVALOR').AsFloat;
                  End;
               FcdsContabil.Next;
            End;

         If FormatFloat('#,##0.00', abs(rTotalContab)) <> FormatFloat('#,##0.00', abs(rValorCheckContab)) Then
            Begin
               Result := False;
               MessageInfo := 'Total do Débito não bate com o Total do Crédito na Contabilização. Verifique';
               Exit;
            End;

         If FormatFloat('#,##0.00', abs(rValorBanco)) <> FormatFloat('#,##0.00', abs(rValorCheckBanco)) Then
            Begin
               Result := False;
               MessageInfo := 'O valor contabilizado na conta do banco deve ser igual ao valor do ' +
                  'lançamento. Verifique';
               Exit;
            End;
      Finally
         cdsAux.Free;
      End;
   Except
      On E: Exception Do
         Begin
            Result := False;
            MessageInfo := E.Message;
         End;
   End;
End;

Function TCtrlMovimFinanc.MudaStatus(rCodLancFinanc: Double;
   sStatus: String; dDataConc, dDataDisp, dDataLanc: TDateTime): OleVariant;    //Ewerton Beltramini - SIG 96817/96822 - 18/03/2020 - Acrescentada a variavel: dDataLanc
Var
   sSql : String;

Begin
   MessageInfo := '';


   //Ricardo - SOL 160219 - KTN 1341178
   StartTransaction;

   sSql := 'UPDATE MovimFinanc ' + 'SET STATUSCONCILIA = ''' + sStatus + ''', ';

   //Ewerton Beltramini - SIG 96817/96822 - 18/03/2020 - Inicio...
   If (dDataLanc <> 0) Then
      sSql := sSql + '    DATALANCFINAN = TO_DATE(''' +
         FormatDateTime('dd/mm/yyyy', dDataLanc) + ''',''dd/mm/yyyy''), ';
   //Ewerton Beltramini - SIG 96817/96822 - 18/03/2020 - Fim.

   If (dDataConc <> 0) Then
      sSql := sSql + '    DATACONCILIACAO = TO_DATE(''' +
         FormatDateTime('dd/mm/yyyy', dDataConc) + ''',''dd/mm/yyyy''), '
   Else
      sSql := sSql + '    DATACONCILIACAO = NULL, ';

   If (dDataDisp <> 0) Then
      sSql := sSql + '    DATADISPFINANC = TO_DATE(''' +
         FormatDateTime('dd/mm/yyyy', dDataDisp) + ''',''dd/mm/yyyy'') '
   Else
      sSql := sSql + '    DATADISPFINANC = NULL ';

   sSql := sSql + 'WHERE (CODLANCFINANC = ' + FloatToStr(rCodLancFinanc) + ') ';

   Result := ExecSQL(sSql);

   //Ricardo - SOL 160219 - KTN 1341178
   Commit;
End;

Function TCtrlMovimFinanc.AlteraDispFinancDocBaixado(sEntradaSaida: String; iCodLancFinanc: integer; dDataDisp: TDateTime): boolean;
Var
   cdsAux: TCMClientDataSet;
   sSql: String;
   STATUSCONCILIA: String;
Begin
   Result := True;

   MessageInfo := '';
   If (sEntradaSaida = 'E') And (Trim(DateToStr(dDataDisp)) <> '') Then // CAR
      Begin
         cdsAux := TCMClientDataSet.Create(Nil);
         Try
            cdsAux.Data := GetDataPacket('SELECT CODDOCUMENTO ' +
               'FROM RECBTOPAGTO ' +
               'WHERE (CODLANCFINANC = ' + IntToStr(iCodLancFinanc) + ') ');
            If cdsAux.IsEmpty Then
               Begin
                  Result := False;
                  MessageInfo := 'Documento não Encontrado. Verifique.';
                  Exit;
               End;

            //Ricardo - SOL 160219 - KTN 1341178
            StartTransaction;

            sSql := 'UPDATE DOCUMENTO SET DATADISPONIB  = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dDataDisp) + ''',''dd/mm/yyyy'') ';
            sSql := sSql + 'WHERE CODDOCUMENTO = ' + cdsAux.FieldByName('CODDOCUMENTO').AsString;

            Result := ExecSQL(sSql);

            //Ricardo - SOL 160219 - KTN 1341178
            Commit;

         Finally
            cdsAux.Free;
         End;
      End;
End;

Function TCtrlMovimFinanc.TestaRegularizado(rCodLancFinanc: Double): Boolean;
Begin
   With TCMClientDataSet.Create(Nil) Do
      Try
         Data := GetDataPacket('SELECT * FROM RELACIONANI ' +
            'WHERE (CODLANCFINANC = ' + FloatTosTr(rCodLancFinanc) + ') ');
         Result := Not (IsEmpty);
      Finally
         Free;
      End;
End;

Function TCtrlMovimFinanc.SaldoRateioFinanc(rCodLancFinanc: extended): OleVariant;
Begin
   Result := GetDataPacket('SELECT  SUM (R.VALOR) As TOTVALORMOEDA,  ' + #13 +
      '        SUM(R.VALOROUTRAMOEDA) as TOTVALOROUTRAMOEDA ' + #13 +
      'FROM ' + #13 +
      '   RATEIOFINANC    R, ' + #13 +
      '   UNIDNEGOCIO     U, ' + #13 +
      '   CENTRESPON      C, ' + #13 +
      '   CENTCUST CC, ' + #13 +
      '   TIPORECEBDESEMB T, ' + #13 +
      '   PESSOA          PTR, ' + #13 +
      '   PLANPREVCONTABIL        PLC, ' + #13 +
      '   PROGRAMA        PRG, ' + #13 +
      '   MOEDA           I    ' + #13 +
      'WHERE ' + #13 +
      '       ( R.CODLANCFINANC   = ' + FloatToStr(rCodLancFinanc) + ' ) ' + #13 +
      '   AND ( R.CODTIPRECDES    = T.CODTIPRECDES ) ' + #13 +
      '   AND ( R.RECPAG          = T.RECPAG ) ' + #13 +
      '   AND ( R.IDPESSOA        = T.IDPESSOA ) ' + #13 +
      '   AND ( R.UNIDNEGOC       = U.UNIDNEGOC ) ' + #13 +
      '   AND ( R.IDPESSOA        = U.IDPESSOA ) ' + #13 +
      '   AND ( R.MOECODIGO       = I.MOECODIGO(+) ) ' + #13 +
      '   AND (CC.CODCENTROCUSTO = R.CODCENTROCUSTO) ' + #13 +
      '   AND ( R.CODCENTRORESPON = C.CODCENTRORESPON ) ' + #13 +
      '   AND ( R.IDPROGRAMA      = PRG.IDPROGRAMA(+) ) ' + #13 +
      '   AND ( R.IDPLANOPREV     = PLC.IDPLANOPREV(+) ) ' + #13 +
      '   AND ( R.IDPATRO         = PTR.IDPESSOA(+) ) ' + #13 +
      '   AND ( R.IDPESSOA        = C.IDPESSOA ) ');
End;

Function TCtrlMovimFinanc.getIdForCliBanco(icodportador: integer): integer;
Begin
   result := 0;
   _cds.data := getDataPacket('SELECT IDBANCO FROM PORTADORCONTA WHERE CODPORTADOR = ' + intToStr(icodportador));
   result := _cds.fieldByName('IDBANCO').asInteger;
End;

Function TCtrlMovimFinanc.LancaCPMF(ovRateio: OleVariant): boolean;
Var codTipoRecDes: integer;

   Function GetCodCpmf: integer; //pega através do rateio o código do imposto de cpmf a ser lançado
   Var cdsRateio: TclientDataset;
      sSql: String;
   Begin
      result := 0;
      cdsRateio := TclientDataset.Create(Nil);
      cdsRateio.data := ovRateio;
      Try
         cdsRateio.First;
         While Not cdsRateio.Eof Do
            Begin
               sSql := ' SELECT TR.CODTIPOCUSTAGREG FROM TIPRECDESXTIPAGRE TR, TIPOAGRE TA ' +
                  ' WHERE TR.IDPESSOA = ' + FloatToStr(F_rIDPessoa) + ' AND ' +
                  //pendência 26934 - coloquei o filtro recpag para diferenciar desembolso de recebimento, pois em alguns casos ambos tem o mesmo código
               '       TR.RECPAG = ' + quotedStr(cdsRateio.fieldByName('RECPAG').asString) + ' AND ' +
                  '       TA.CODIMPOSTO = 20 AND ' + //cpmf
               '       TR.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG ';

               If trim(cdsRateio.FieldByName('CODTIPRECDES').asString) <> '' Then
                  sSql := sSql + ' AND TR.CODTIPRECDES = ' + quotedStr(cdsRateio.FieldByName('CODTIPRECDES').asString);

               If trim(cdsRateio.FieldByName('CODCENTROCUSTO').asString) <> '' Then
                  sSql := sSql + ' AND TR.CODCENTROCUSTO = ' + quotedStr(cdsRateio.FieldByName('CODCENTROCUSTO').asString);

               If cdsRateio.FieldByName('IDPROGRAMA').asInteger <> 0 Then
                  sSql := sSql + ' AND TR.IDPROGRAMA = ' + cdsRateio.FieldByName('IDPROGRAMA').asString;

               _cds.data := getDataPacket(sSql);

               If _cds.IsEmpty Then //retira o programa do filtro
                  Begin
                     sSql := ' SELECT TR.CODTIPOCUSTAGREG FROM TIPRECDESXTIPAGRE TR, TIPOAGRE TA ' +
                        ' WHERE TR.IDPESSOA = ' + FloatToStr(F_rIDPessoa) + ' AND ' +
                        //pendência 26934 - coloquei o filtro recpag para diferenciar desembolso de recebimento, pois em alguns casos ambos tem o mesmo código
                     '       TR.RECPAG = ' + quotedStr(cdsRateio.fieldByName('RECPAG').asString) + ' AND ' +
                        '       TA.CODIMPOSTO = 20 AND ' + //cpmf
                     '       TR.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG AND ' +
                        '       TR.IDPROGRAMA IS NULL ';

                     If trim(cdsRateio.FieldByName('CODTIPRECDES').asString) <> '' Then
                        sSql := sSql + ' AND TR.CODTIPRECDES = ' + quotedStr(cdsRateio.FieldByName('CODTIPRECDES').asString);

                     If trim(cdsRateio.FieldByName('CODCENTROCUSTO').asString) <> '' Then
                        sSql := sSql + ' AND TR.CODCENTROCUSTO = ' + quotedStr(cdsRateio.FieldByName('CODCENTROCUSTO').asString);

                     _cds.data := getDataPacket(sSql);

                  End;

               If _cds.IsEmpty Then //retira o programa e o centro de custo do filtro
                  Begin
                     sSql := ' SELECT TR.CODTIPOCUSTAGREG FROM TIPRECDESXTIPAGRE TR, TIPOAGRE TA ' +
                        ' WHERE TR.IDPESSOA = ' + FloatToStr(F_rIDPessoa) + ' AND ' +
                        //pendência 26934 - coloquei o filtro recpag para diferenciar desembolso de recebimento, pois em alguns casos ambos tem o mesmo código
                     '       TR.RECPAG = ' + quotedStr(cdsRateio.fieldByName('RECPAG').asString) + ' AND ' +
                        '       TA.CODIMPOSTO = 20 AND ' + //cpmf
                     '       TR.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG AND ' +
                        '       TR.CODCENTROCUSTO IS NULL AND ' +
                        '       TR.IDPROGRAMA IS NULL ';

                     If trim(cdsRateio.FieldByName('CODTIPRECDES').asString) <> '' Then
                        sSql := sSql + ' AND TR.CODTIPRECDES = ' + quotedStr(cdsRateio.FieldByName('CODTIPRECDES').asString);

                     _cds.data := getDataPacket(sSql);
                  End;

               If _cds.FieldByName('CODTIPOCUSTAGREG').asInteger > 0 Then
                  Begin
                     result := _cds.FieldByName('CODTIPOCUSTAGREG').asInteger;
                     break;
                  End;

               cdsRateio.Next;
            End; //while
      Finally
         cdsRateio.free;
      End;
   End;

Begin
   result := true;
   ctrlImpostoRetido.CodPortConta := FCdsMovimFinanc.FieldByName('CODPORTADOR').asInteger;
   ctrlImpostoRetido.IDEmpresa := trunc(F_rIDPessoa);
   codTipoRecDes := GetCodCpmf;

   If codTipoRecDes > 0 Then
      Begin
         Try
            //Cálculo da CPMF
            ctrlImpostoRetido.CodPortForma := 0;
            ctrlImpostoRetido.UsaPlanoPatro := true;
            ctrlImpostoRetido.PartidaDobrada := paramIntegra.PartidaDobrada;
            ctrlImpostoRetido.IdPlanoConta := paramIntegra.Plano;
            ctrlImpostoRetido.IntegraContab := paramIntegra.IntegraContab;
            ctrlImpostoRetido.IdEmpresa := trunc(F_rIDPessoa);
            ctrlImpostoRetido.NumLote := 0;
            ctrlImpostoRetido.NumLoteManual := 0;
            ctrlImpostoRetido.bImpostoSemDocOrigem := true;
            ctrlImpostoRetido.ovRateioPlanoPatro := FCdsRateioFinanc.Data;

            ctrlImpostoRetido.SegregaOrComum := ctrlSegregacao.SegregaOrComum;
            ctrlImpostoRetido.SegregaOrAdm := ctrlSegregacao.SegregaOrAdm;
            ctrlImpostoRetido.SegregaVirtual := ctrlSegregacao.SegregaVirtual;
            ctrlImpostoRetido.PlanoPrevComum := ctrlSegregacao.PlanoPrevComum;
            ctrlImpostoRetido.PlanoPrevAdm := ctrlSegregacao.PlanoPrevAdm;

            ctrlImpostoRetido.RecPag := 'P';
            ctrlImpostoRetido.IdUsuario := trunc(F_rIDUsuario);
            ctrlImpostoRetido.IdEspAcesso := sistema.idespacesso;
            ctrlImpostoRetido.IdModulo := trunc(F_rIDModulo);
            ctrlImpostoRetido.DataProgramada := FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime;
            ctrlImpostoRetido.OperacaoDocumento := '2';
            ctrlImpostoRetido.IdForCli := getIdForCliBanco(FCdsMovimFinanc.FieldByName('CODPORTADOR').asInteger);

            ctrlImpostoRetido.CodDocumento := 0;
            ctrlImpostoRetido.NumLancto := 0;
            ctrlImpostoRetido.ValorLancto := FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat;
            ctrlImpostoRetido.ValorLiquido := FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat;
            ctrlImpostoRetido.DataLancto := FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime;
            ctrlImpostoRetido.DataEmissao := FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime;
            ctrlImpostoRetido.DebCre := 'C';
            ctrlImpostoRetido.MomentoLancamento := mlBaixa;
            ctrlImpostoRetido.CodTipRecDes := '';
            ctrlImpostoRetido.CodLancFinanc := FcodLancFinanc;

            ctrlImpostoRetido.Incluir(codTipoRecDes);
         Except
            self.messageInfo := ctrlImpostoRetido.MessageInfo;
            Raise Exception.Create(self.MessageInfo);
            result := false;
         End; //try
      End //if
End;

Procedure TCtrlMovimFinanc.SetcodLancFinanc(Const Value: int64);
Begin
   FcodLancFinanc := Value;
End;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Novas funções da Conciliação Bancária - Sol  31714_38358  Kintana 523349_523362 - Paulo Nobre
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//

Function TCtrlMovimFinanc.ListaMovimExtratoDiaConciliacao(Const pDataMov, pCodPortador, pConciliado, pSitConciliacao: String): OleVariant;
Var sSQL: String;
Begin
   sSQL := 'SELECT * FROM MOVEXTRATOBANCARIO WHERE ';
   sSQL := sSQL + ' DATAEXTRATO = ' + QuotedStr(pDataMov);
   sSQL := sSQL + ' AND CODPORTADOR = ' + pCodPortador;
   If pSitConciliacao <> '' Then
      sSQL := sSQL + ' AND SITCONCILIACAO = ' + QuotedStr(pSitConciliacao);
   If pConciliado <> '' Then
      Begin
         sSQL := sSQL + ' AND CONCILIADO = ' + QuotedStr(pConciliado);
         If pConciliado = 'N' Then
            sSQL := sSQL + ' ORDER BY CODPORTADOR, TIPOLANCTO, VALORLANCTO DESC '
         Else
            sSQL := sSQL + ' ORDER BY CODPORTADOR, IDLANCCONCILIADO, TIPOLANCTO, VALORLANCTO DESC ';
      End;

   Result := GetDataPacket(sSQL);
End;

Function TCtrlMovimFinanc.ListaMovimFinanceiroConciliacao(Const pDataMov, pCodPortador, pConciliado: String): OleVariant;
Var sSQL: String;
Begin
   sSQL := 'SELECT M.CODLANCFINANC,  ';
   sSQL := sSQL + ' M.NUMCHQBORDERO,   ';
   sSQL := sSQL + ' M.DATALANCFINAN, ';
   sSQL := sSQL + ' M.ENTRADASAIDA,  ';
   sSQL := sSQL + ' M.HISTORICO,    ';
   sSQL := sSQL + ' M.CONCILIADO,    ';
   sSQL := sSQL + ' M.IDLANCCONCILIADO,    ';
   sSQL := sSQL + ' M.SITBLOQUEIOLANC,    ';
   sSQL := sSQL + ' M.DATADISPFINANC,    ';
   sSQL := sSQL + ' M.HISTPADFINAN,    ';
   sSQL := sSQL + ' M.DATADESBLOQUEIO,    ';
   sSQL := sSQL + ' DECODE(M.ENTRADASAIDA, ''S'', -M.VALORLANCFINAN, M.VALORLANCFINAN) AS VALORLANCFINAN  ';
   sSQL := sSQL + ' FROM MOVIMFINANC M    ';
   sSQL := sSQL + ' WHERE M.CODPORTADOR = ' + pCodPortador;
   sSQL := sSQL + '       AND M.VALORLANCFINAN <> 0 ';
   If pConciliado = 'N' Then // Não
      Begin
         sSQL := sSQL + ' AND M.DATALANCFINAN <= ' + QuotedStr(pDataMov);
         sSQL := sSQL + ' AND M.CONCILIADO IN (''N'', ''Z'') '; //  Não conciliado e Não conciliado no dia
         sSQL := sSQL + ' ORDER BY M.DATALANCFINAN, M.ENTRADASAIDA, M.VALORLANCFINAN DESC ';
      End
   Else // Sim
      Begin
         sSQL := sSQL + ' AND M.DATALANCFINAN = ' + QuotedStr(pDataMov);
         sSQL := sSQL + ' AND M.CONCILIADO IN (''S'', ''D'' )'; // Conciliado normal e Definitivo
         sSQL := sSQL + ' ORDER BY M.IDLANCCONCILIADO, M.DATALANCFINAN, M.ENTRADASAIDA, M.VALORLANCFINAN DESC ';
      End;

   Result := GetDataPacket(sSQL);
End;

Function TCtrlMovimFinanc.ListaMovimBloqueios(Const pDataMov, pCodPortador: String): OleVariant;
Var sSQL: String;
Begin
   // Sol..........: 31714/12942 - Paulo Nobre
   sSQL := ' SELECT * FROM (                     ';
   sSQL := sSQL + ' SELECT ''C'' AS TIPOBLOQ,     ';
   sSQL := sSQL + '     M.CODLANCFINANC,            ';
   sSQL := sSQL + '     M.DATALANCFINAN DATALANC,    ';
   sSQL := sSQL + '     M.CODPORTADOR,           ';
   sSQL := sSQL + '     M.SITBLOQUEIOLANC SITBLOQDESBLOQ,   ';
   sSQL := sSQL + '     M.NUMCHQBORDERO NUMDOCUMENTO,    ';
   sSQL := sSQL + '     M.ENTRADASAIDA,              ';
   sSQL := sSQL + '     M.VALORLANCFINAN,                ';
   sSQL := sSQL + '     M.HISTORICO,                   ';
   sSQL := sSQL + '     M.DATADISPFINANC DATADISPONIB,    ';
   sSQL := sSQL + '     M.HISTPADFINAN,                 ';
   sSQL := sSQL + '     -1 IDPLANPREVCTBPATR,             ';
   sSQL := sSQL + '     NULL CODCENTRORESPON,             ';
   sSQL := sSQL + '     M.IDLANCCONCILIADO,      ';
   sSQL := sSQL + '     M.DATADESBLOQUEIO            ';
   sSQL := sSQL + ' FROM MOVIMFINANC M ';
   sSQL := sSQL + ' WHERE DATALANCFINAN <= ' + QuotedStr(pDataMov);
   sSQL := sSQL + '       AND M.CODPORTADOR = ' + pCodPortador;
   sSQL := sSQL + '       AND M.SITBLOQUEIOLANC = 1 '; // Bloqueado
   sSQL := sSQL + '       AND M.HISTPADFINAN = 14   '; // Cheques
   sSQL := sSQL + ' UNION                    ';
   // SOL 201700 Kintana 1955228 - Paulo Nobre
   sSQL := sSQL + ' SELECT ''O'' AS TIPOBLOQ,     ';
   sSQL := sSQL + '     M.CODLANCFINANC,            ';
   sSQL := sSQL + '     M.DATALANCFINAN DATALANC,    ';
   sSQL := sSQL + '     M.CODPORTADOR,           ';
   sSQL := sSQL + '     M.SITBLOQUEIOLANC SITBLOQDESBLOQ,   ';
   sSQL := sSQL + '     M.NUMCHQBORDERO NUMDOCUMENTO,    ';
   sSQL := sSQL + '     M.ENTRADASAIDA,              ';
   sSQL := sSQL + '     M.VALORLANCFINAN,                ';
   sSQL := sSQL + '     M.HISTORICO,                   ';
   sSQL := sSQL + '     M.DATADISPFINANC DATADISPONIB,    ';
   sSQL := sSQL + '     M.HISTPADFINAN,                 ';
   sSQL := sSQL + '     -1 IDPLANPREVCTBPATR,             ';
   sSQL := sSQL + '     NULL CODCENTRORESPON,             ';
   sSQL := sSQL + '     M.IDLANCCONCILIADO,      ';
   sSQL := sSQL + '     M.DATADESBLOQUEIO            ';
   sSQL := sSQL + ' FROM MOVIMFINANC M ';
   sSQL := sSQL + ' WHERE DATALANCFINAN <= ' + QuotedStr(pDataMov);
   sSQL := sSQL + '       AND M.CODPORTADOR = ' + pCodPortador;
   sSQL := sSQL + '       AND M.SITBLOQUEIOLANC = 1 '; // Bloqueado
   sSQL := sSQL + '       AND M.HISTPADFINAN IN (19, 20)   '; // SICOB D+1 e SIVAT
   sSQL := sSQL + ' UNION                 ';
   sSQL := sSQL + ' SELECT ''J'' AS TIPOBLOQ,   '; // Bloqueios Judiciais
   sSQL := sSQL + '     0 CODLANCFINANC,         ';
   sSQL := sSQL + '     M.DATALANCTO DATALANC, ';
   sSQL := sSQL + '     M.CODPORTADOR,          ';
   sSQL := sSQL + '     M.SITBLOQDESBLOQ,         ';
   sSQL := sSQL + '     M.NUMDOCUMENTO,         ';
   sSQL := sSQL + '     M.TIPOLANCTO ENTRADASAIDA,  ';
   sSQL := sSQL + '     ABS(M.VALORLANCTO) AS VALORLANCFINAN,  ';
   sSQL := sSQL + '     M.HISTORICO,             ';
   sSQL := sSQL + '     M.DATADISPONIB,          ';
   sSQL := sSQL + '     0 HISTPADFINAN,                ';
   sSQL := sSQL + '     M.IDPLANPREVCTBPATR,             ';
   sSQL := sSQL + '     M.CODCENTRORESPON,             ';
   sSQL := sSQL + '     0 IDLANCCONCILIADO,      ';
   sSQL := sSQL + '     NULL DATADESBLOQUEIO            ';
   sSQL := sSQL + ' FROM MOVFINBLOQJUDICIAIS M          ';
   sSQL := sSQL + ' WHERE M.DATALANCTO <= ' + QuotedStr(pDataMov);
   sSQL := sSQL + '       AND M.CODPORTADOR = ' + pCodPortador;
   sSQL := sSQL + ' )                                     ';
   sSQL := sSQL + ' ORDER BY CODPORTADOR, TIPOBLOQ, DATALANC ';
   Result := GetDataPacket(sSQL);
End;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function TCtrlMovimFinanc.ListMovimFinancNulo: OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT IDMODULO,          ' +#13#10+
          '       HISTPADFINAN,      ' +#13#10+
          '       IDUSUARIOINCLUSAO, ' +#13#10+
          '       CODPORTADOR,       ' +#13#10+
          '       VALORLANCFINAN,    ' +#13#10+
          '       VALOROUTRAMOEDA,   ' +#13#10+
          '       NUMCHQBORDERO,     ' +#13#10+
          '       DATALANCFINAN,     ' +#13#10+
          '       ENTRADASAIDA,      ' +#13#10+
          '       HISTORICO,         ' +#13#10+
          '       STATUSCONCILIA,    ' +#13#10+
          '       IDPESSOA,          ' +#13#10+
          '       CONCILIADO,        ' +#13#10+
          '       DATADISPFINANC,    ' +#13#10+
          '       DATACONCILIACAO,   ' +#13#10+
          '       MOECODIGO          ' +#13#10+
          '  FROM MOVIMFINANC        ' +#13#10+
          ' WHERE CODLANCFINANC = -1 ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlMovimFinanc.ListRateioFinancNulo: OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT IDPESSOA,         ' +#13#10+
          '       CODLANCFINANC,    ' +#13#10+
          '       UNIDNEGOC,        ' +#13#10+
          '       CODTIPRECDES,     ' +#13#10+
          '       RECPAG,           ' +#13#10+
          '       CODCENTRORESPON,  ' +#13#10+
          '       VALOR,            ' +#13#10+
          '       VALOROUTRAMOEDA,  ' +#13#10+
          '       IDEMPRESA,        ' +#13#10+
          '       CODCENTROCUSTO,   ' +#13#10+
          '       IDPROGRAMA,       ' +#13#10+
          '       IDPLANOPREV,      ' +#13#10+
          '       IDPATRO,          ' +#13#10+
          '       CODTIPDOC,        ' +#13#10+
          '       MOECODIGO,        ' +#13#10+
          '       IDSEGREGACRITER   ' +#13#10+
          '  FROM RATEIOFINANC      ' +#13#10+
          ' WHERE CODLANCFINANC = -1';
          
  Result := GetDataPacket(sSQL);
end;

function TCtrlMovimFinanc.ListMovimBancario(pDataLanc: TDateTime): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT 0 AS SEL, IDMOVEXTRATOBANCARIO, HISTORICO, NUMDOCUMENTO, ' +#13#10+
          '       TIPOLANCTO,                                              ' +#13#10+
          '       DECODE(TIPOLANCTO, ''C'', ''Credor'', ''Devedor'') AS TIPOLANCTO_T, ' +#13#10+
          '       VALORLANCTO,                                             ' +#13#10+
          '       LTRIM(REPLACE(TO_CHAR(ABS(VALORLANCTO), ''999999999990D00''), ''.'', '','')) AS VALOR_T,' +#13#10+
          '       DATAEXTRATO                                              ' +#13#10+
          '  FROM MOVEXTRATOBANCARIO                                       ' +#13#10+
          ' WHERE CONCILIADO  =  ''N''                                     ' +#13#10+
          '   AND DATAEXTRATO = ' + QuotedStr(DateToStr((pDataLanc)));
  Result := GetDataPacket(sSQL);
end;

End.

