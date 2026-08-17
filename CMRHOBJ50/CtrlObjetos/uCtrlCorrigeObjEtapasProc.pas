// **************************************************************************************************
//Rotina..........: uCtrlCorrigeObjEtapasProc
//N. Sol..........: 49750
//N. Kintana......: 523171
//Data............: 29/09/2010
//Responsável.....: Paulo Nobre
//Descrição.......: Control elaborada especificamente para abrigar as rotinas de correção de Etapas
//                  e correção/contabilização de Objetos.
//                  Foi necessário a criação da tabela JUR_PROGRAMAXSUBPROGRAMA para expressar o
//                  o relacionamento do Programa (IdTipoProc) x Sub-Programa (TipCodigo)
//***************************************************************************************************
Unit uCtrlCorrigeObjEtapasProc;

Interface

Uses Classes, SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
   uCtrlCustomRH, uDbHstObjProcTrab, uDbObjProcTrab, uCtrlCustomProcTrab,
   uCtrlListTerceirosRH, uCtrlLancamento, uDbEtapaProcTrab, uCMMath, ColorCheckListBox,
   DBClient, Math, uCtrlHstEtapaProcTrab, Windows, Messages, Forms, Dialogs, Wwquery, uCtrlContab;

Type
   TCtrlCorrigeObjEtapasProc = Class(TCtrlCustomRH)

   Protected
      FCtrlLancamento: TCtrlLancamento;
      FCtrlListTerceirosRH: TCtrlListTerceirosRH;
      CtrlHstEtapaProcTrab: TCtrlHstEtapaProcTrab;
      CtrlContab: TCtrlContab;

      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
      Procedure AfterInitialize; Override;

   Private
      FDbEtapas: TDbEtapaProcTrab;
      FCds: TCMClientDataSet;
      FCtrlCustomProcTrab: TCtrlCustomProcTrab;
      FPlnCodigo: double;
   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Function AchouCotacao(iCodMoeda: Integer; sDataCotacao: String): Boolean;
      Function ListLitisconsorte(NumProcTrab: double): OleVariant;
      Function BuscaUltimoHistoricoObjeto(sNumProcTrab, sCodTipoObjeto, sDataCorrecao: String): OleVariant;
      Function DeletaHistorico(sNumProcTrab, sCodTipoObjeto, sDataCorrecao: String): Boolean;

      Function CorrigirEtapas(DataLim: String;
         IdEmpresa, IdModulo, IdUsuario: integer;
         Indice1, Indice2: integer; Juros1, Juros2: double; Desfazer: boolean;
         CdsGridEtapa: TCMClientDataSet): boolean;

      Function LocalizaParametrosContabeis(IndMateria, IndPrincipal,
         Tipo_De, IdEmpresa: integer; CodCentroCusto, TipoAcao, TipCodigo: String; Var sContaDEB, sContaCRE: String; dNumPlano: Double): Boolean;

      Function ContabilizaUsandoCriteriosDeRateios(
         sProcDe: String;
         sProcAte: String;
         sDataEncerramentoDe: String;
         iSomosParte: Integer;
         sListaProcPSp: String;
         iTipoLancamento: String;
         iAplica_se_A,
         idSegregaCriterio: Integer;
         sDescObjeto: String;
         iPrograma: LongInt;
         sSub_Programa: String;
         cTipoLanc: Char; IdEmpresa, iModuloOrigem,
         liUsuario, liCodPlano, liUnidNegoc, liSubContaDeb,
         liSubContaCre, iPlanoPrev, iPatro, liPlnCodigo: Double; iNumLan: LongInt;
         sDataLanc, sNumDoc, sHist1, sHist2, sHist3, sHist4, sHist5,
         cCCustd, cContad, cCCustc, cContac, sCodHist: String;
         dValLanc: double; bJunta, bUsaPlanoPatro: Boolean; Var dPlnCodigo: Double): Boolean;

      Function TrazDataSugerida(NumProcTrab: Double): TDateTime;

      Function AplicaCorrecaoMonetaria(ValHist: double; DataHist2: TDateTime; MoeCodigo: integer): double;

      Property PlnCodigo: double Read FPlnCodigo;
   End;

Implementation

Uses uCMTypes, uCtrlPadroes, uCtrlFuncoesRH;

Var
   _CdsUltimoHistoricoObjeto: TCMClientDataSet;
   dPlnCodigo: Double;

Constructor TCtrlCorrigeObjEtapasProc.Create;
Begin
   Inherited;
   FDbEtapas := TDbEtapaProcTrab.Create(Self);
   FCtrlCustomProcTrab := TCtrlCustomProcTrab.Create(0, '');
   FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create('', '', '');
   FCtrlLancamento := TCtrlLancamento.Create;
   CtrlHstEtapaProcTrab := TCtrlHstEtapaProcTrab.Create;
   CtrlHstEtapaProcTrab.InitializeAs(Padroes);
   CtrlContab := TCtrlContab.Create;
   CtrlContab.InitializeAs(Padroes);
End;

Destructor TCtrlCorrigeObjEtapasProc.Destroy;
Begin
   FreeAndNil(FCtrlLancamento);
   FreeAndNil(FCtrlListTerceirosRH);
   FreeAndNil(FCtrlCustomProcTrab);
   FreeAndNil(FDbEtapas);
   If (IsAppServer) Then
      FreeAndNil(FCds);
   Inherited;
End;

Procedure TCtrlCorrigeObjEtapasProc.OnCreateAppServer;
Begin
   Inherited;
End;

Procedure TCtrlCorrigeObjEtapasProc.AfterInitialize;
Begin
   Inherited;
   FCtrlCustomProcTrab.InitializeAs(Self);
   FCtrlListTerceirosRH.InitializeAs(Self);
   FCtrlLancamento.InitializeAs(Self);
End;

Procedure TCtrlCorrigeObjEtapasProc.DoChangeDataBase;
Begin
   Inherited;
   FDbEtapas.DataBaseName := DataBaseName;
End;

Function TCtrlCorrigeObjEtapasProc.TrazDataSugerida(NumProcTrab: Double): TDateTime;
Var
   _CdsAuxi: TCMClientDataSet;
   sQuery: String;
Begin
   _CdsAuxi := TCMClientDataSet.Create(Nil);
   sQuery := ' SELECT DECODE(DATAPREVOCORR, NULL, LAST_DAY(DATAREALOCOR), DECODE(DATAPREVOCORR, DATAREALOCOR, LAST_DAY(DATAREALOCOR), LAST_DAY(ADD_MONTHS(DATAPREVOCORR,1)))) AS DATASUGERIDA  ' + #13 +
      ' FROM ETAPAPROCTRAB WHERE ' + #13 +
      ' NUMPROCTRAB = ' + QuotedStr(FloatToStr(NumProcTrab)) + ' AND ' + #13 +
      ' DECODE(DATAPREVOCORR, NULL, LAST_DAY(DATAREALOCOR), DECODE(DATAPREVOCORR, DATAREALOCOR, LAST_DAY(DATAREALOCOR), LAST_DAY(ADD_MONTHS(DATAPREVOCORR,1)) )) = ' + #13 +
      ' (SELECT max(DECODE(a.DATAPREVOCORR, NULL, LAST_DAY(a.DATAREALOCOR), DECODE(a.DATAPREVOCORR,a.DATAREALOCOR, LAST_DAY(a.DATAREALOCOR), LAST_DAY(ADD_MONTHS(a.DATAPREVOCORR,1)) ))) ' + #13 +
      ' FROM ETAPAPROCTRAB a WHERE a.NUMPROCTRAB = ' + QuotedStr(FloatToStr(NumProcTrab)) + ')';
   _CdsAuxi.Data := GetDataPacket(sQuery);

   Result := _CdsAuxi.FieldByName('DATASUGERIDA').AsDateTime;

   FreeAndNil(_CdsAuxi);
End;

Function TCtrlCorrigeObjEtapasProc.DeletaHistorico(sNumProcTrab, sCodTipoObjeto, sDataCorrecao: String): Boolean;
Var
   sQuery: String;
Begin
   Result := False;
   sQuery := 'DELETE FROM HSTOBJPROCTRAB h1 WHERE ' + #13 +
      ' h1.NUMPROCTRAB = ' + QuotedStr(sNumProcTrab) + ' and ' + #13 +
      ' h1.CODTIPOOBJETO = ' + QuotedStr(sCodTipoObjeto) + ' and ' + #13 +
      ' h1.DATAAVAL >= ' + QuotedStr(sDataCorrecao) + ' and ' + #13 +
      ' h1.FLGTIPOLANCTO = ' + QuotedStr('C'); // Só exclui os lançados pela Correção
   Try
      ExecSQL(sQuery);
      Result := True;
   Except
      On E: Exception Do
         MessageInfo := E.Message;
   End;
End;

Function TCtrlCorrigeObjEtapasProc.BuscaUltimoHistoricoObjeto(sNumProcTrab, sCodTipoObjeto, sDataCorrecao: String): OleVariant;
Var
   _CdsAuxi: TCMClientDataSet;
   sQuery: String;
Begin
   _CdsAuxi := TCMClientDataSet.Create(Nil);
   sQuery := 'SELECT h1.IDHSTOBJPROCTRAB, h1.VALORRECL, h1.PERCPROB, h1.VALORSENTENCA, h1.JUROS, h1.CORRECAO, h1.OBSERVACAO, h1.INDVALOR, ' + #13 +
      ' h1.DATAINICIO, h1.DATAFINAL, h1.PERCORIG, h1.DATAAVAL, h1.FLGCONTABVLPRINC, h1.IDTIPOPROC, h1.TIPCODIGO, h1.FLGCONTABENCERRADO ' + #13 +
      ' FROM HSTOBJPROCTRAB h1 WHERE ' + #13 +
      //      ' h1.NUMPROCTRAB = ' + QuotedStr(sNumProcTrab) + ' and ' + #13 +
//      ' h1.CODTIPOOBJETO = ' + QuotedStr(sCodTipoObjeto) + ' and ' + #13 +
   ' h1.IDHSTOBJPROCTRAB = (select max(h3.IDHSTOBJPROCTRAB) from HSTOBJPROCTRAB h3 where ' + #13 +
      '                        h3.NUMPROCTRAB = ' + QuotedStr(sNumProcTrab) + ' and ' + #13 +
      '                        h3.CODTIPOOBJETO = ' + QuotedStr(sCodTipoObjeto) + 'and ' + #13 +
      '                        h3.FLGTIPOLANCTO = ''C'' and ' + #13 + // só busca os Lançados pela Correção
   '                        (h3.JUROS IS NOT NULL AND h3.JUROS > 0) and ' + #13 +
      '                        h3.DATAAVAL < ' + QuotedStr(sDataCorrecao) + ' )';
   _CdsAuxi.Data := GetDataPacket(sQuery);
   Result := _CdsAuxi.Data;
   FreeAndNil(_CdsAuxi);
End;

Function TCtrlCorrigeObjEtapasProc.ListLitisconsorte(NumProcTrab: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  DECODE(P.TIPO,''F'',P.NOME,P.RAZAOSOCIAL) AS NOME, C.IDPESSOA, C.NUMPROCTRAB' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA P, COPARTPROCTRAB C' + CR_LF +
      'WHERE' + CR_LF +
      '  (C.NUMPROCTRAB = ' + FloatToStr(NumProcTrab) + ') AND' + CR_LF +
      '  (C.IDPESSOA    = P.IDPESSOA)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  UPPER(NOME)');
End;

Function TCtrlCorrigeObjEtapasProc.AchouCotacao(iCodMoeda: Integer; sDataCotacao: String): Boolean;
Var
   _CdsAuxi: TCMClientDataSet;
   sQuery: String;
   Year, Month, Day: Word;
Begin

   DecodeDate(StrToDate(sDataCotacao), Year, Month, Day);
   sDataCotacao := FormatFloat('00', Month) + IntToStr(Year);
   _CdsAuxi := TCMClientDataSet.Create(Nil);
   sQuery := 'SELECT * FROM COTACAOMOEDA WHERE ' + #13 +
      ' MOECODIGO = ' + QuotedStr(IntToStr(iCodMoeda)) + ' AND ' + #13 +
      ' COTMESREF = ' + QuotedStr(sDataCotacao);
   _CdsAuxi.Data := GetDataPacket(sQuery);
   If _CdsAuxi.Eof Then
      Result := False
   Else
      Result := True;

   FreeAndNil(_CdsAuxi);
End;

Function TCtrlCorrigeObjEtapasProc.CorrigirEtapas(DataLim: String;
   IdEmpresa, IdModulo, IdUsuario: integer;
   Indice1, Indice2: integer; Juros1, Juros2: double; Desfazer: boolean; CdsGridEtapa: TCMClientDataSet): boolean;
Var
   _CdsAux3: TCmClientDataSet;
   _CdsEtapa: TCmClientDataSet;

   dJuros_ao_Mes, dFator_Juros_Diario, dValor, dValor2, dJuros1, dJuros2: double;
   sDataRef, Sinal: String;
   iIndice1, iIndice2, iQtd_Dias_Mes: Integer;
   dQtd_Dias_Calculo: Real;
Begin
   Result := False;
   _CdsEtapa := TCmClientDataSet.Create(Nil);
   _CdsAux3 := TCmClientDataSet.Create(Nil);

   Sinal := ' <= ';
   If (Desfazer) Then
      Sinal := ' >= ';

   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.CorrigirEtapas(FCds.Data, DataLim,
            IdEmpresa, IdModulo, IdUsuario, Desfazer);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         // Correção dos Valores dos Recursos e Custas
         Try
            StartTransaction;
            _CdsEtapa.Data := CdsGridEtapa.Data; //William Santos / Paulo Nobre KINTANA 763777 SOL 132498 - FIM
            _CdsEtapa.first;
            While (Not _CdsEtapa.EOF) Do // Faz o loop das etapas selecionadas
               Begin
                  // Índice,Juros e valor dos Recursos
                  iIndice1 := IFF(Indice1 > 0, Indice1, _CdsEtapa.FieldByName('INDICETAPA').asInteger);
                  dJuros1 := IFF(Juros1 > 0, Juros1, _CdsEtapa.FieldByName('JUROSETAPA').asFloat);
                  dValor := _CdsEtapa.FieldByName('VALORREC').asFloat;

                  // Índice,Juros e valor das Custas  //William Santos / Paulo Nobre KINTANA 763777 SOL 132498
                  iIndice2 := Indice2;
                  dJuros2 := IFF(Juros2 > 0, Juros2, _CdsEtapa.FieldByName('TAXAJUROS').asFloat);
                  dValor2 := _CdsEtapa.FieldByName('VALORCUSTAS').asFloat;

                  //---Emerson KT 522312  SOL 112596 inicio--//
                  If (Desfazer) Then
                     Begin
                        //--Selecionar o histórico mais recente
                        _CdsAux3.Data := CtrlHstEtapaProcTrab.BuscaHistoricoUltimo(_CdsEtapa.FieldByName('NUMPROCTRAB').asFloat,
                           _CdsEtapa.FieldByName('NUMSEQ').asString);

                        //--verifica se tem registro para fazer a atualizacao e delecao--//
                        If Not _CdsAux3.Eof Then
                           Begin
                              // Atualiza a Etapa com o Histórico mais Recente
                              _CdsEtapa.Edit;
                              _CdsEtapa.FieldByName('VALORREC').asFloat := _CdsAux3.FieldByName('VALORATU').asFloat;
                              _CdsEtapa.FieldByName('VALORCUSTAS').asFloat := _CdsAux3.FieldByName('VALORATUCUSTAS').asFloat;
                              _CdsEtapa.FieldByName('DATAPREVOCORR').asString := _CdsAux3.FieldByName('DATAATU').asString;
                              _CdsEtapa.Post;

                              // Exclui os Históricos com mês da Data da Ocorrência (sDataRef) > Ao mês da data informada (Datalim)
                              CtrlHstEtapaProcTrab.DeletaHistorico(_CdsAux3.FieldByName('NUMPROCTRAB').asString,
                                 _CdsAux3.FieldByName('NUMSEQ').asString,
                                 _CdsAux3.FieldByName('DATAATU').asString);
                           End;
                     End
                  Else
                     Begin
                        If (iIndice1 > 0) And (dJuros1 > 0) Then //--só faz se o recurso tem cotacao--//
                           Begin
                              If _CdsEtapa.FieldByName('DATAPREVOCORR').asString = '' Then // Se 1ª vez, então data da correção = data da ocorrência
                                 sDataRef := FormatDateTime('DD/MM/YYYY', _CdsEtapa.FieldByName('DATAREALOCOR').asDateTime)
                              Else
                                 sDataRef := FormatDateTime('DD/MM/YYYY', _CdsEtapa.FieldByName('DATAPREVOCORR').asDateTime);

                              // Garantir o cálculo acumulativo dos processos
                              If StrToDate(sDataRef) <= StrToDate(Datalim) Then
                                 Begin
                                    // Calcula Valor Principal
                                    If (_CdsEtapa.FieldByName('VALORREC').asFloat > 0) Then
                                       Begin
                                          // Verifica se tem cotacao
                                          If Not AchouCotacao(iIndice1, DataLim) Then
                                             Begin
                                                Application.MessageBox('Não foi possível localizar o Índice de Correção' + #13 +
                                                   'para o mês da data informada.', 'Atenção !', MB_DEFBUTTON1 + MB_ICONEXCLAMATION);
                                                rollback;
                                                Result := false;
                                                exit;
                                             End;

                                          dJuros_ao_Mes := 0;
                                          dFator_Juros_Diario := 0;
                                          dQtd_Dias_Calculo := 0;
                                          iQtd_Dias_Mes := 0;
                                          dValor := 0.00;

                                          // Valor Original Corrigido PELO ÍNDICE até Datalim SEM O JUROS
                                          dValor := FCtrlCustomProcTrab.GetValorPeriodo(
                                             _CdsEtapa.FieldByName('VALORREC').asFloat,
                                             StrToDate(Copy(sDataRef, 1, Length(ShortDateFormat))),
                                             StrToDate(DataLim),
                                             iIndice1,
                                             0,
                                             _CdsEtapa.FieldByName('NUMPROCTRAB').asFloat,
                                             0);

                                          //  dValor   = Valor original corrigido somente com o Índice (ex.: TR mensal)
                                          //  dJuros1  = Taxa de Juros
                                          //  sDataRef = Data da última correção do Recurso
                                          //  Datalim  = Data limite para o Cálculo

                                          //  1º passo: Traz o percentual de juros, de acordo com período escolhido,
                                          //  para o momento presente cuja base é sempre Mensal

                                          If _CdsEtapa.FieldByName('INDJUROS').asInteger = 0 Then // Mensal
                                             dJuros_ao_Mes := power(((dJuros1 / 100) + 1), (1 / 1));

                                          If _CdsEtapa.FieldByName('INDJUROS').asInteger = 1 Then // Trimestral
                                             dJuros_ao_Mes := power(((dJuros1 / 100) + 1), (1 / 3));

                                          If _CdsEtapa.FieldByName('INDJUROS').asInteger = 2 Then // Semestral
                                             dJuros_ao_Mes := power(((dJuros1 / 100) + 1), (1 / 6));

                                          If _CdsEtapa.FieldByName('INDJUROS').asInteger = 3 Then // Anual
                                             dJuros_ao_Mes := power(((dJuros1 / 100) + 1), (1 / 12));

                                          //  2º passo: Achando o Fator de Correção diária (Pró-rata)
                                          iQtd_Dias_Mes := TrazUltDiaMes(ExtraiMes(StrToDate(Datalim)), ExtraiAno(StrToDate(Datalim)));
                                          dFator_Juros_Diario := (power((dJuros_ao_Mes), (1 / iQtd_Dias_Mes)) - 1);

                                          //  3º passo: Calculando a correção do valor pelo fator pró-rata;
                                          dQtd_Dias_Calculo := StrToDate(Datalim) - StrToDate(sDataRef);
                                          dValor := dValor + (dValor * dFator_Juros_Diario * dQtd_Dias_Calculo);
                                       End;

                                    // Calcula Custas
                                    If (_CdsEtapa.FieldByName('VALORCUSTAS').asFloat > 0) Then
                                       Begin
                                          dJuros_ao_Mes := 0;
                                          dFator_Juros_Diario := 0;
                                          dValor2 := 0.00;

                                          // Valor Original Corrigido PELO ÍNDICE até Datalim SEM O JUROS
                                          dValor2 := FCtrlCustomProcTrab.GetValorPeriodo(
                                             _CdsEtapa.FieldByName('VALORCUSTAS').asFloat,
                                             StrToDate(Copy(sDataRef, 1, Length(ShortDateFormat))),
                                             StrToDate(DataLim),
                                             iIndice2, 0, _CdsEtapa.FieldByName('NUMPROCTRAB').asFloat, 0);

                                          //  1º passo: Traz o percentual de juros, para o momento presente cuja base é sempre Mensal
                                          dJuros_ao_Mes := power(((dJuros2 / 100) + 1), (1 / 1));

                                          //  2º passo: Achando o Fator de Correção diária (Pró-rata)
                                          dFator_Juros_Diario := (power((dJuros_ao_Mes), (1 / iQtd_Dias_Mes)) - 1);

                                          //  3º passo: Calculando a correção do valor pelo fator pró-rata;
                                          dValor2 := dValor2 + (dValor2 * dFator_Juros_Diario * dQtd_Dias_Calculo);
                                       End;

                                    // William / Paulo Sol 133001 Kintana 77169 - 26/03/2010
                                    If (_CdsEtapa.FieldByName('VALORREC').asFloat <> dValor) Or
                                       (_CdsEtapa.FieldByName('VALORCUSTAS').asFloat <> dValor2) Then
                                       Begin
                                          //---Emerson Emerson KT 522312  SOL 112596 inicio
                                          If CtrlHstEtapaProcTrab.PodeInserirHstEtapaProcTrab(_CdsEtapa) Then
                                             Begin
                                                // Inserindo na tabela de histórico
                                                CtrlHstEtapaProcTrab.InserirHstetapaproctrab(_CdsEtapa);
                                             End;
                                          //---Emerson Emerson KT 522312  SOL 112596 fim

                                          // Atualizar Etapa na tabela Etapaprotrab
                                          _CdsEtapa.Edit;
                                          _CdsEtapa.FieldByName('VALORREC').asFloat := dValor;
                                          _CdsEtapa.FieldByName('VALORCUSTAS').asFloat := dValor2;
                                          _CdsEtapa.FieldByName('DATAPREVOCORR').asString := DataLim;
                                          _CdsEtapa.Post;
                                       End;
                                 End;
                           End;
                     End;

                  _CdsEtapa.Next;

               End;

            If Not InTransaction Then
               StartTransaction;

            Result := ApplyCds(_CdsEtapa, FDbEtapas, [], []);

            If Not (Result) Then
               Raise Exception.Create(FDbEtapas.MessageInfo);

            Commit;
            Result := true;
         Except
            On E: Exception Do
               Begin
                  Rollback;
                  Result := false;
                  MessageInfo := E.Message;
               End;
         End;
         FreeAndNil(_CdsAux3);
         FreeAndNil(_CdsEtapa);
      End;
End;

Function TCtrlCorrigeObjEtapasProc.LocalizaParametrosContabeis(
   IndMateria, IndPrincipal, Tipo_De, IdEmpresa: integer;
   CodCentroCusto, TipoAcao, TipCodigo: String; Var sContaDEB, sContaCRE: String; dNumPlano: Double): Boolean;
Var qryAux: Twwquery;
Begin
   Result := True;
   qryAux := Twwquery.Create(Nil);
   qryAux.DataBaseName := 'BaseDados';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT C.IDPLANO1, C.IDPLANO2, C.CONTADEBITO, C.CONTACREDITO ');
   qryAux.SQL.Add('FROM CONTABJURID C                                 ');
   qryAux.SQL.Add('WHERE                                              ');
   qryAux.SQL.Add('C.INDPRINCIPAL      = ' + IntToStr(IndPrincipal));
   qryAux.SQL.Add('AND C.INDMATERIA    = ' + IntToStr(IndMateria));
   qryAux.SQL.Add('AND C.IDTIPOPROC_DE = ' + IntToStr(Tipo_De));
   qryAux.SQL.Add('AND C.TIPCODIGO     = ' + QuotedStr(TipCodigo));
   If IdEmpresa <> 0 Then
      qryAux.SQL.Add('AND C.IDEMPRESA  = ' + IntToStr(IdEmpresa));
   If CodCentroCusto <> '' Then
      qryAux.SQL.Add('AND C.CODCENTROCUSTO = ' + QuotedStr(CodCentroCusto));
   If TipoAcao <> '' Then
      qryAux.SQL.Add(' AND C.INDOPERACAO = ' + QuotedStr(TipoAcao));
   qryAux.Open;
   If qryAux.EOF Then
      Result := False
   Else
      Begin
         sContaDEB := qryAux.fieldbyname('CONTADEBITO').asString;
         sContaCRE := qryAux.fieldbyname('CONTACREDITO').asString;
         dNumPlano := qryAux.fieldbyname('IDPLANO2').asFloat;
      End;

   FreeAndNil(qryAux);
End;

Function TCtrlCorrigeObjEtapasProc.AplicaCorrecaoMonetaria(ValHist: double; DataHist2: TDateTime; MoeCodigo: integer): double;
Var
   _CdsAuxiliar1: Twwquery;
   sPercValor, sPeriodo: String;
   dTaxa1, dTaxa2, dFator: double;
   iConta: integer;
Begin
   Try
      Result := ValHist;
      _CdsAuxiliar1 := Twwquery.Create(Nil);
      _CdsAuxiliar1.DataBaseName := 'BaseDados';
      If (MoeCodigo > 0) Then
         Begin
            _CdsAuxiliar1.Close;
            _CdsAuxiliar1.SQL.Clear;
            _CdsAuxiliar1.SQL.Add('SELECT COTVALOR, COTDATA ');
            _CdsAuxiliar1.SQL.Add('FROM  COTACAOMOEDA ');
            _CdsAuxiliar1.SQL.Add('WHERE MOECODIGO = ' + IntToStr(MoeCodigo) + ' AND ');
            _CdsAuxiliar1.SQL.Add(' COTMESREF = TO_CHAR(TO_DATE(' + quotedstr(datetostr(DataHist2)) + '), ''MM'') || TO_CHAR(TO_DATE(' + quotedstr(datetostr(DataHist2)) + '), ''YYYY'') ');
            _CdsAuxiliar1.SQL.Add('ORDER BY COTDATA ');
            _CdsAuxiliar1.Open;
            If Not (_CdsAuxiliar1.IsEmpty) Then
               Begin
                  dFator := _CdsAuxiliar1.FieldByName('COTVALOR').asFloat / 100;
                  Result := Result + (Result * dFator);
               End;
         End;
   Finally
      If Assigned(_CdsAuxiliar1) Then
         _CdsAuxiliar1.Free;
   End;
End;

//*****************************************************************************************
// *********** Função para contabilizar usando critérios de rateio ************************
//*****************************************************************************************

Function TCtrlCorrigeObjEtapasProc.ContabilizaUsandoCriteriosDeRateios(
   sProcDe: String;
   sProcAte: String;
   sDataEncerramentoDe: String;
   iSomosParte: Integer;
   sListaProcPSp: String;
   iTipoLancamento: String;
   iAplica_se_A,
   idSegregaCriterio: Integer;
   sDescObjeto: String;
   iPrograma: LongInt; // Programa
   sSub_Programa: String; // Sub-Programa
   cTipoLanc: Char; IdEmpresa, iModuloOrigem,
   liUsuario, liCodPlano, liUnidNegoc, liSubContaDeb,
   liSubContaCre, iPlanoPrev, iPatro, liPlnCodigo: Double; iNumLan: LongInt;
   sDataLanc, sNumDoc, sHist1, sHist2, sHist3, sHist4, sHist5,
   cCCustd, cContad, cCCustc, cContac, sCodHist: String;
   dValLanc: double; bJunta, bUsaPlanoPatro: Boolean; Var dPlnCodigo: Double): Boolean;
Var
   dValorSegregado, dValorSegrega, dValorCadaLitis, dValorTotalPlano: Double;
   iQtd, iQtdItensSegrega, iQtdTotalLitis, iPlanoSegrega, iPatroSegrega: Integer;
   sContaDEB, sContaCRE: String;
   dNumPlano: Double;
   qrySegregacao: Twwquery;
Begin
   qrySegregacao := Twwquery.Create(Nil);
   Result := True;
   // ******************************************************
   // PROGRAMA INVESTIMENTO - Financiamento Habitacional ou
   //			      Investimento Imobiliário ou
   //			      A Classificar
   // ******************************************************
   If (iPrograma = 2) And ((sSub_Programa = '40') Or (sSub_Programa = '41') Or (sSub_Programa = '49')) Then
      Begin
         iQtd := 1;
         iQtdItensSegrega := 0;
         dValorSegregado := 0.00;
         dValorSegrega := 0.00;
         // Achando a quantidade de Planos para o cálculo do rateio
         qrySegregacao.DataBaseName := 'BaseDados';
         qrySegregacao.Close;
         qrySegregacao.SQL.Clear;
         qrySegregacao.SQL.Add('SELECT COUNT(*) QTDITEMS                                    ');
         qrySegregacao.SQL.Add('FROM SEGREGACOTACAO CT, SEGREGADATA SD                      ');
         qrySegregacao.SQL.Add('WHERE CT.IDSEGREGADATA = SD.IDSEGREGADATA                   ');
         qrySegregacao.SQL.Add('   AND SD.IDSEGREGACRITER = ' + quotedstr(inttostr(IdSegregaCriterio)));
         qrySegregacao.SQL.Add('   AND TO_DATE( ' + quotedstr(sDataLanc) + ', ''DD/MM/YYYY'') BETWEEN SD.DATAINI AND SD.DATAFIM  ');
         qrySegregacao.Open;
         If Not qrySegregacao.EOF Then
            Begin
               iQtdItensSegrega := qrySegregacao.fieldbyname('QTDITEMS').asInteger;

               qrySegregacao.Close;
               qrySegregacao.SQL.Clear;
               qrySegregacao.SQL.Add('SELECT CT.IDSEGREGADATA, CT.IDSEGREGACOTACAO,               ');
               qrySegregacao.SQL.Add('       CT.IDPLANOPREV, CT.IDPATRO, CT.COTACAO,              ');
               qrySegregacao.SQL.Add('       SD.DATAFIM, SD.DATAINI, CR.DESCRICAO                 ');
               qrySegregacao.SQL.Add('FROM SEGREGACOTACAO CT, SEGREGADATA SD, SEGREGACRITER CR    ');
               qrySegregacao.SQL.Add('WHERE CT.IDSEGREGADATA = SD.IDSEGREGADATA                   ');
               qrySegregacao.SQL.Add('   AND SD.IDSEGREGACRITER = CR.IDSEGREGACRITER              ');
               qrySegregacao.SQL.Add('   AND SD.IDSEGREGACRITER = ' + quotedstr(inttostr(IdSegregaCriterio)));
               qrySegregacao.SQL.Add('   AND TO_DATE( ' + quotedstr(sDataLanc) + ', ''DD/MM/YYYY'') BETWEEN SD.DATAINI AND SD.DATAFIM  ');
               qrySegregacao.Open;
               While Not qrySegregacao.EOF Do
                  Begin
                     // Macete usado para evitar as diferenças de arredondamento por conta das dízimas
                     If iQtd < iQtdItensSegrega Then
                        Begin
                           dValorSegregado := RoundCM((dValLanc * qrySegregacao.fieldbyname('COTACAO').asFloat) / 100, 2);
                           dValorSegrega := dValorSegrega + dValorSegregado;
                           inc(iQtd);
                        End
                     Else
                        dValorSegregado := dValLanc - dValorSegrega; // Acha o valor do último pela diferença

                     // Localizando a parâmetrização contábil adequada
                     If LocalizaParametrosContabeis(
                        0, // Matéria
                        iAplica_se_A, // 0 -> Principal; 1 -> Correção Monetária; 2 -> Juros
                        iPrograma, // Progama
                        0, // Empresa
                        '', // Centro Custo
                        '', // Tipo da Acao
                        sSub_Programa, sContaDEB, sContaCRE, dNumPlano) Then
                        Begin
                           // Provisionando ou Estornando
                           dValorSegregado := IFF(iTipoLancamento = 'P', Abs(dValorSegregado), Abs(dValorSegregado) * -1);

                           If FCtrlLancamento.InsereLancaContab(
                              cTipoLanc, // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
                              IdEmpresa, // Empresa
                              iModuloOrigem, // Módulo de Origem  (719)
                              liUsuario, // Usuário Ativo
                              dNumPlano, // Plano de Contas
                              liUnidNegoc, // Unidade de Negócio
                              liSubContaDeb, // Sub-Conta de Débito
                              liSubContaCre, // Sub-Conta de Crédito
                              qrySegregacao.fieldbyname('IDPLANOPREV').asInteger, // iPlanoPrev
                              qrySegregacao.fieldbyname('IDPATRO').asInteger, // iPatro
                              dPlnCodigo, // Número da Planilha
                              iNumLan, // Número do Lançamento
                              sDataLanc, // Data da Correção
                              Copy(sDataLanc, 7, 4) + Copy(sDataLanc, 3, 3), // Número do Documento
                              sHist1, // 1ª Linha do Histórico
                              sHist2, // 2ª Linha do Histórico
                              sHist3, // 3ª Linha do Histórico
                              sHist4, // 4ª Linha do Histórico
                              sDescObjeto, // 5ª Linha do Histórico
                              sSub_Programa, // Sub-Programa (TIPCODIGO)
                              cCCustd, // Centro de Custo para Débito
                              sContaDEB, // Conta para Débito
                              cCCustc, // Centro de Custo para Crédito
                              sContaCRE, // Conta para Crédito
                              sCodHist, // Código do Histórico Padrão
                              dValorSegregado,
                              bJunta, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
                              bUsaPlanoPatro, // Indica se usa Plano da Patrocinadora
                              ) Then
                              dPlnCodigo := FCtrlLancamento.RetornoPlnCodigo
                           Else
                              Begin
                                 Raise Exception.Create(FCtrlLancamento.MessageInfo);
                                 Result := False;
                              End;
                        End
                     Else
                        Begin
                           Raise Exception.Create('Parametrização Contábil do(a) ' + sHist1 + ' / ' + sHist2 + ' - ' +
                              IFF(iAplica_se_A = 0, '" Valor Principal"', IFF(iAplica_se_A = 1, '" Correção Monetária"', '" Juros"')) +
                              ' Não Localizada !');
                           Result := False;
                        End;

                     qrySegregacao.Next;

                  End;
            End;
      End;

   // ********************************************************
   // PROGRAMA INVESTIMENTO - Renda Fixa ou Renda Variável ou
   //			      Estruturado ou Exterior
   // ********************************************************
   If (iPrograma = 2) And ((sSub_Programa = '43') Or (sSub_Programa = '44') Or (sSub_Programa = '45') Or (sSub_Programa = '46')) Then
      Begin
         iQtd := 1;
         iQtdItensSegrega := 0;
         dValorSegregado := 0.00;
         dValorSegrega := 0.00;
         // Achando a quantidade de Planos para o cálculo do rateio
         qrySegregacao.DataBaseName := 'BaseDados';
         qrySegregacao.Close;
         qrySegregacao.SQL.Clear;
         qrySegregacao.SQL.add('SELECT COUNT(*) QTDITEMS     ');
         qrySegregacao.SQL.add('FROM JURIDICORATEIOCONTABIL  ');
         qrySegregacao.SQL.ADD('WHERE PROGRAMA = ' + FloatToStr(iPrograma));
         qrySegregacao.SQL.ADD('      AND SUB_PROGRAMA  = ' + quotedStr(sSub_Programa));
         qrySegregacao.Open;
         If Not qrySegregacao.EOF Then
            Begin
               iQtdItensSegrega := qrySegregacao.fieldbyname('QTDITEMS').asInteger;

               qrySegregacao.Close;
               qrySegregacao.SQL.Clear;
               qrySegregacao.SQL.Add('SELECT J.PERCRATEIO, P.IDPLANOPREV, P.IDPATRO        ');
               qrySegregacao.SQL.add('FROM JURIDICORATEIOCONTABIL J, PLANPREVCONTABPATRO P   ');
               qrySegregacao.SQL.ADD('WHERE J.PROGRAMA      = ' + FloatToStr(iPrograma));
               qrySegregacao.SQL.ADD('      AND J.SUB_PROGRAMA  = ' + quotedStr(sSub_Programa));
               qrySegregacao.SQL.ADD('      AND J.IDPLANPREVCTBPATR = P.IDPLANPREVCTBPATR ');
               qrySegregacao.Open;
               While Not qrySegregacao.EOF Do
                  Begin
                     // Macete usado para evitar as diferenças de arredondamento por conta das dízimas
                     If iQtd < iQtdItensSegrega Then
                        Begin
                           dValorSegregado := RoundCM((dValLanc * qrySegregacao.fieldbyname('PERCRATEIO').asFloat) / 100, 2);
                           dValorSegrega := dValorSegrega + dValorSegregado;
                           inc(iQtd);
                        End
                     Else
                        dValorSegregado := dValLanc - dValorSegrega; // Acha o valor do último pela diferença

                     // Localizando a parâmetrização contábil adequada
                     If LocalizaParametrosContabeis(
                        0, // Matéria
                        iAplica_se_A, // 0 -> Principal; 1 -> Correção Monetária; 2 -> Juros
                        iPrograma, // Progama
                        0, // Empresa
                        '', // Centro Custo
                        '', // Tipo da Acao
                        sSub_Programa, sContaDEB, sContaCRE, dNumPlano) Then
                        Begin
                           // Provisionando ou Estornando
                           dValorSegregado := IFF(iTipoLancamento = 'P', Abs(dValorSegregado), Abs(dValorSegregado) * -1);

                           If FCtrlLancamento.InsereLancaContab(
                              cTipoLanc, // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
                              IdEmpresa, // Empresa
                              iModuloOrigem, // Módulo de Origem  (719)
                              liUsuario, // Usuário Ativo
                              dNumPlano, // Plano de Contas
                              liUnidNegoc, // Unidade de Negócio
                              liSubContaDeb, // Sub-Conta de Débito
                              liSubContaCre, // Sub-Conta de Crédito
                              qrySegregacao.fieldbyname('IDPLANOPREV').asInteger, // iPlanoPrev
                              qrySegregacao.fieldbyname('IDPATRO').asInteger, // iPatro
                              dPlnCodigo, // Número da Planilha
                              iNumLan, // Número do Lançamento
                              sDataLanc, // Data da Correção
                              Copy(sDataLanc, 7, 4) + Copy(sDataLanc, 3, 3), // Número do Documento
                              sHist1, // 1ª Linha do Histórico
                              sHist2, // 2ª Linha do Histórico
                              sHist3, // 3ª Linha do Histórico
                              sHist4, // 4ª Linha do Histórico
                              sDescObjeto, // 5ª Linha do Histórico
                              sSub_Programa, // Sub-Programa (TIPCODIGO)
                              cCCustd, // Centro de Custo para Débito
                              sContaDEB, // Conta para Débito
                              cCCustc, // Centro de Custo para Crédito
                              sContaCRE, // Conta para Crédito
                              sCodHist, // Código do Histórico Padrão
                              dValorSegregado,
                              bJunta, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
                              bUsaPlanoPatro, // Indica se usa Plano da Patrocinadora
                              ) Then
                              dPlnCodigo := FCtrlLancamento.RetornoPlnCodigo
                           Else
                              Begin
                                 Raise Exception.Create(FCtrlLancamento.MessageInfo);
                                 Result := False;
                              End;
                        End
                     Else
                        Begin
                           Raise Exception.Create('Parametrização Contábil do(a) ' + sHist1 + ' / ' + sHist2 + ' - ' +
                              IFF(iAplica_se_A = 0, '" Valor Principal"', IFF(iAplica_se_A = 1, '" Correção Monetária"', '" Juros"')) +
                              ' Não Localizada !');
                           Result := False;
                        End;

                     qrySegregacao.Next;

                  End;
            End;
      End;

   // ********************************************
   // PROGRAMA INVESTIMENTO   - Empréstimo ou
   // PROGRAMA ADMINISTRATIVO - Administrativo ou
   // PROGRAMA PREVIDENCIAL   - Previdencial
   // ********************************************
   If ((iPrograma = 2) And (sSub_Programa = '42')) Or
      ((iPrograma = 3) And (sSub_Programa = '48')) Or
      ((iPrograma = 4) And (sSub_Programa = '47')) Then
      Begin
         iQtdTotalLitis := 0;
         dValorCadaLitis := 0.00;
         dValorTotalPlano := 0.00;
         // Achando a quantidade de Litis para ser usada no cálculo do rateio
         qrySegregacao.DataBaseName := 'BaseDados';
         qrySegregacao.Close;
         qrySegregacao.SQL.Clear;
         qrySegregacao.SQL.Add('SELECT SUM(QTD_TOTAL_PESSOAS) QTD_TOTAL_PESSOAS                ');
         qrySegregacao.SQL.Add('FROM (                                                         '); // Selecionando as Litis
         qrySegregacao.SQL.Add('SELECT COUNT(*) QTD_TOTAL_PESSOAS                              ');
         qrySegregacao.SQL.Add('FROM OBJPROCTRAB O, COPARTPROCTRAB C, VWPLANPREVCTBPATR VW  ');
         qrySegregacao.SQL.Add('WHERE O.NUMPROCTRAB = C.NUMPROCTRAB			       ');
         qrySegregacao.SQL.Add('      AND O.IDTIPOPROC  = ' + quotedstr(inttostr(iPrograma)));
         qrySegregacao.SQL.Add('      AND O.TIPCODIGO   = ' + quotedstr(sSub_Programa));
         qrySegregacao.SQL.Add('      AND NVL(O.VALORRECL,0) > 0          ');
         qrySegregacao.SQL.Add('      AND NVL(O.PERCORIG,0) > 0           ');
         qrySegregacao.SQL.Add('      AND NVL(O.PERCPROB,0) > 11.0000     '); // Regra Contabil
         qrySegregacao.SQL.Add('      AND O.DATAAVAL IS NOT NULL AND O.DATAAVAL <= ' + QuotedStr(sDataLanc));
         qrySegregacao.SQL.Add('      AND TRUNC(O.TRGDTINCLUSAO) <= ' + QuotedStr(sDataLanc));

         If (StrToFloat(sProcDe) > 0) And (sProcAte <> '9999999999') Then
            qrySegregacao.SQL.Add('      AND ' + QuebrarListaFiltro(1, '(O.NUMPROCTRAB  ', sListaProcPSp, 500))
         Else
            Begin
               qrySegregacao.SQL.Add(' And O.NUMPROCTRAB IN (SELECT PT.NUMPROCTRAB ');
               qrySegregacao.SQL.Add('                       FROM PROCESSOTRAB PT  ');
               qrySegregacao.SQL.Add('                       WHERE (PT.FLGSITPROC = 0) OR ');
               qrySegregacao.SQL.Add('                             (PT.FLGSITPROC = 1 AND PT.DATAEFETENC >= ' + QuotedStr(sDataEncerramentoDe) + ') '); // Encerrado
               Case (iSomosParte) Of
                  0: qrySegregacao.SQL.Add('                        AND (PT.FLGPARTEATIVA = 1) )');
                  1: qrySegregacao.SQL.Add('                        AND (PT.FLGPARTEATIVA = 0) )'); // Passiva
                  2: qrySegregacao.SQL.Add('                        AND (PT.FLGPARTEATIVA = 2) ) ');
                  3: qrySegregacao.SQL.Add('      ) ');
               End;
            End;

         qrySegregacao.SQL.Add('      AND C.IDPLANPREVCTBPATR = VW.IDPLANPREVCTBPATR           ');
         qrySegregacao.SQL.Add('      AND C.IDMOTIVO IS NULL                                   ');
         qrySegregacao.SQL.Add('      AND C.IDPLANPREVCTBPATR IS NOT NULL                      '); // Somente Litis com Plano/Patro
         qrySegregacao.SQL.Add('      AND C.INDTESTEMUNHA <> 3                                 '); // Sem a CEF
         qrySegregacao.SQL.Add('UNION                                                          ');
         qrySegregacao.SQL.Add('SELECT COUNT(*) QTD_TOTAL_PESSOAS                              '); // Selecionando o Reclamante/Contra-parte
         qrySegregacao.SQL.Add('FROM PROCESSOTRAB PT, OBJPROCTRAB O, PESSOA P2, PARTPREVPLAN PR, PLANPREV PL   ');
         qrySegregacao.SQL.Add('WHERE PT.NUMPROCTRAB = O.NUMPROCTRAB 			       ');
         qrySegregacao.SQL.Add('      AND PT.IDRECLAMANTE = PR.IDPESSOA (+)                   ');
         qrySegregacao.SQL.Add('      AND PT.IDMOTIVO IS NULL                                 ');
         qrySegregacao.SQL.Add('      AND PT.FLGSITPROC = ' + inttostr(IFF(iTipoLancamento = 'P', 0, 1))); // Provisão = aberto / Estorno = Encerrado
         qrySegregacao.SQL.Add('      AND O.IDTIPOPROC  = ' + quotedstr(inttostr(iPrograma)));
         qrySegregacao.SQL.Add('      AND O.TIPCODIGO   = ' + quotedstr(sSub_Programa));
         qrySegregacao.SQL.Add('      AND NVL(O.VALORRECL,0) > 0         ');
         qrySegregacao.SQL.Add('      AND NVL(O.PERCORIG,0) > 0          ');
         qrySegregacao.SQL.Add('      AND NVL(O.PERCPROB,0) > 11.0000    '); // Regra Contabil
         qrySegregacao.SQL.Add('      AND O.DATAAVAL IS NOT NULL AND O.DATAAVAL <= ' + QuotedStr(sDataLanc));
         qrySegregacao.SQL.Add('      AND TRUNC(O.TRGDTINCLUSAO) <= ' + QuotedStr(sDataLanc));
         If (StrToFloat(sProcDe) > 0) And (sProcAte <> '9999999999') Then
            qrySegregacao.SQL.Add('      AND ' + QuebrarListaFiltro(1, '(O.NUMPROCTRAB  ', sListaProcPSp, 500))
         Else
            Begin
               qrySegregacao.SQL.Add(' And O.NUMPROCTRAB IN (SELECT PT.NUMPROCTRAB ');
               qrySegregacao.SQL.Add('                       FROM PROCESSOTRAB PT  ');
               qrySegregacao.SQL.Add('                       WHERE (PT.FLGSITPROC = 0) OR ');
               qrySegregacao.SQL.Add('                             (PT.FLGSITPROC = 1 AND PT.DATAEFETENC >= ' + QuotedStr(sDataEncerramentoDe) + ') '); // Encerrado
               Case (iSomosParte) Of
                  0: qrySegregacao.SQL.Add('                        AND (PT.FLGPARTEATIVA = 1) )');
                  1: qrySegregacao.SQL.Add('                        AND (PT.FLGPARTEATIVA = 0) )'); // Passiva
                  2: qrySegregacao.SQL.Add('                        AND (PT.FLGPARTEATIVA = 2) ) ');
                  3: qrySegregacao.SQL.Add('      ) ');
               End;
            End;
         qrySegregacao.SQL.Add('      AND PR.IDPESSJUR   = P2.IDPESSOA                        ');
         qrySegregacao.SQL.Add('      AND PR.IDPLANOPREV = PL.IDPLANOPREV                     ');
         qrySegregacao.SQL.Add('      AND PR.FLGDESATIVADO = 0                                '); // Ativo
         qrySegregacao.SQL.Add('     )                                                        ');
         qrySegregacao.Open;
         If qrySegregacao.FieldByName('QTD_TOTAL_PESSOAS').asInteger > 0 Then
            Begin
               iQtdTotalLitis := qrySegregacao.FieldByName('QTD_TOTAL_PESSOAS').asInteger;

               // Achando o valor de cada uma das Pessoas
               dValorCadaLitis := dValLanc / iQtdTotalLitis;

               // Localizando a qtd de Pessoas agrupadas por Plano/Patro
               qrySegregacao.Close;
               qrySegregacao.SQL.Clear;
               qrySegregacao.SQL.Add('SELECT IDPLANOPREV, IDPATRO, SUM(QTD_PESSOAS_PLANO) QTD_PESSOAS_POR_PLANO  ');
               qrySegregacao.SQL.Add('FROM (                                                                     ');

               // PROGRAMA PREVIDENCIAL ou PROGRAMA INVESTIMENTO EMPRÉSTIMO
               If ((iPrograma = 4) And (sSub_Programa = '47')) Or
                  ((iPrograma = 2) And (sSub_Programa = '42')) Then
                  Begin
                     qrySegregacao.SQL.Add('SELECT DECODE(VW.IDPLANOPREV, 19, 66, DECODE(VW.IDPLANOPREV, 79, 66, DECODE(VW.IDPLANOPREV, 29, 66, VW.IDPLANOPREV ))) IDPLANOPREV,     '); // Litis
                     qrySegregacao.SQL.Add('       91008 IDPATRO,          ');
                  End
               Else // PROGRAMA ADMINISTRATIVO  (3 / 48)
                  Begin
                     qrySegregacao.SQL.Add('SELECT ' + inttostr(FCtrlListTerceirosRH.GetIdPlanoPrev(IdEmpresa)) + ' IDPLANOPREV,   '); // PGA (110)
                     qrySegregacao.SQL.Add('       ' + inttostr(FCtrlListTerceirosRH.GetIdPatro(IdEmpresa)) + ' IDPATRO,           '); // PGA (1117723)
                  End;
               qrySegregacao.SQL.Add('             COUNT(*) QTD_PESSOAS_PLANO                              ');
               qrySegregacao.SQL.Add('FROM OBJPROCTRAB O, COPARTPROCTRAB C, VWPLANPREVCTBPATR VW     ');
               qrySegregacao.SQL.Add('WHERE O.NUMPROCTRAB = C.NUMPROCTRAB			     ');
               qrySegregacao.SQL.Add('      AND O.IDTIPOPROC  = ' + quotedstr(inttostr(iPrograma)));
               qrySegregacao.SQL.Add('      AND O.TIPCODIGO   = ' + quotedstr(sSub_Programa));
               qrySegregacao.SQL.Add('      AND NVL(O.VALORRECL,0) > 0           ');
               qrySegregacao.SQL.Add('      AND NVL(O.PERCORIG,0) > 0            ');
               qrySegregacao.SQL.Add('      AND NVL(O.PERCPROB,0) > 11.0000      '); // Regra Contabil
               qrySegregacao.SQL.Add('      AND O.DATAAVAL IS NOT NULL AND O.DATAAVAL <= ' + QuotedStr(sDataLanc));
               qrySegregacao.SQL.Add('      AND TRUNC(O.TRGDTINCLUSAO) <= ' + QuotedStr(sDataLanc));
               If (StrToFloat(sProcDe) > 0) And (sProcAte <> '9999999999') Then
                  qrySegregacao.SQL.Add('      AND ' + QuebrarListaFiltro(1, '(O.NUMPROCTRAB  ', sListaProcPSp, 500))
               Else
                  Begin
                     qrySegregacao.SQL.Add(' And O.NUMPROCTRAB IN (SELECT PT.NUMPROCTRAB ');
                     qrySegregacao.SQL.Add('                       FROM PROCESSOTRAB PT  ');
                     qrySegregacao.SQL.Add('                       WHERE (PT.FLGSITPROC = 0) OR ');
                     qrySegregacao.SQL.Add('                             (PT.FLGSITPROC = 1 AND PT.DATAEFETENC >= ' + QuotedStr(sDataEncerramentoDe) + ') '); // Encerrado
                     Case (iSomosParte) Of
                        0: qrySegregacao.SQL.Add('                        AND (PT.FLGPARTEATIVA = 1) )');
                        1: qrySegregacao.SQL.Add('                        AND (PT.FLGPARTEATIVA = 0) )'); // Passiva
                        2: qrySegregacao.SQL.Add('                        AND (PT.FLGPARTEATIVA = 2) ) ');
                        3: qrySegregacao.SQL.Add('      ) ');
                     End;
                  End;
               qrySegregacao.SQL.Add('      AND C.IDPLANPREVCTBPATR = VW.IDPLANPREVCTBPATR      ');
               qrySegregacao.SQL.Add('      AND C.IDMOTIVO IS NULL                              ');
               qrySegregacao.SQL.Add('      AND C.IDPLANPREVCTBPATR IS NOT NULL                 '); // Somente Litis com Plano/Patro
               qrySegregacao.SQL.Add('      AND C.INDTESTEMUNHA <> 3                            '); // Sem a CEF
               qrySegregacao.SQL.Add('GROUP BY DECODE(VW.IDPLANOPREV, 19, 66, DECODE(VW.IDPLANOPREV, 79, 66, DECODE(VW.IDPLANOPREV, 29, 66, VW.IDPLANOPREV ))),  ');
               qrySegregacao.SQL.Add('         91008                                            ');

               qrySegregacao.SQL.Add('UNION                                                     ');

               // PROGRAMA PREVIDENCIAL ou PROGRAMA INVESTIMENTO EMPRÉSTIMO
               If ((iPrograma = 4) And (sSub_Programa = '47')) Or
                  ((iPrograma = 2) And (sSub_Programa = '42')) Then
                  Begin
                     qrySegregacao.SQL.Add('SELECT DECODE(PL.IDPLANOPREV, 19, 66, DECODE(PL.IDPLANOPREV, 79, 66, DECODE(PL.IDPLANOPREV, 29, 66, PL.IDPLANOPREV))) IDPLANOPREV,  '); // Selecionando o Reclamante / Contra-Parte
                     qrySegregacao.SQL.Add('       91008 IDPATRO,  ');
                  End
               Else // PROGRAMA ADMINISTRATIVO (3 / 48)
                  Begin
                     qrySegregacao.SQL.Add('SELECT ' + inttostr(FCtrlListTerceirosRH.GetIdPlanoPrev(IdEmpresa)) + ' IDPLANOPREV,   '); // PGA (110)
                     qrySegregacao.SQL.Add('       ' + inttostr(FCtrlListTerceirosRH.GetIdPatro(IdEmpresa)) + ' IDPATRO,           '); // PGA (1117723)
                  End;
               qrySegregacao.SQL.Add('           COUNT(*) QTD_PESSOAS_PLANO                            ');
               qrySegregacao.SQL.Add('FROM PROCESSOTRAB PT, OBJPROCTRAB O, PESSOA P2, PARTPREVPLAN PR, PLANPREV PL   ');
               qrySegregacao.SQL.Add('WHERE PT.NUMPROCTRAB = O.NUMPROCTRAB 				 ');
               qrySegregacao.SQL.Add('      AND PT.IDMOTIVO IS NULL                       ');
               qrySegregacao.SQL.Add('      AND PT.IDRECLAMANTE = PR.IDPESSOA(+)          '); // Selecionando o Reclamante/Contra-parte
               qrySegregacao.SQL.Add('      AND PT.FLGSITPROC = ' + inttostr(IFF(iTipoLancamento = 'P', 0, 1))); // Provisão = aberto / Estorno = Encerrado
               qrySegregacao.SQL.Add('      AND O.IDTIPOPROC  = ' + quotedstr(inttostr(iPrograma)));
               qrySegregacao.SQL.Add('      AND O.TIPCODIGO   = ' + quotedstr(sSub_Programa));
               qrySegregacao.SQL.Add('      AND NVL(O.VALORRECL,0) > 0     ');
               qrySegregacao.SQL.Add('      AND NVL(O.PERCORIG,0) > 0      ');
               qrySegregacao.SQL.Add('      AND NVL(O.PERCPROB,0) > 11.0000 '); // Regra Contabil
               qrySegregacao.SQL.Add('      AND O.DATAAVAL IS NOT NULL AND O.DATAAVAL <= ' + QuotedStr(sDataLanc));
               qrySegregacao.SQL.Add('      AND TRUNC(O.TRGDTINCLUSAO) <= ' + QuotedStr(sDataLanc));
               If (StrToFloat(sProcDe) > 0) And (sProcAte <> '9999999999') Then
                  qrySegregacao.SQL.Add('      AND ' + QuebrarListaFiltro(1, '(O.NUMPROCTRAB  ', sListaProcPSp, 500))
               Else
                  Begin
                     qrySegregacao.SQL.Add(' And O.NUMPROCTRAB IN (SELECT PT.NUMPROCTRAB ');
                     qrySegregacao.SQL.Add('                       FROM PROCESSOTRAB PT  ');
                     qrySegregacao.SQL.Add('                       WHERE (PT.FLGSITPROC = 0) OR ');
                     qrySegregacao.SQL.Add('                             (PT.FLGSITPROC = 1 AND PT.DATAEFETENC >= ' + QuotedStr(sDataEncerramentoDe) + ') '); // Encerrado
                     Case (iSomosParte) Of
                        0: qrySegregacao.SQL.Add('                        AND (PT.FLGPARTEATIVA = 1) )');
                        1: qrySegregacao.SQL.Add('                        AND (PT.FLGPARTEATIVA = 0) )'); // Passiva
                        2: qrySegregacao.SQL.Add('                        AND (PT.FLGPARTEATIVA = 2) ) ');
                        3: qrySegregacao.SQL.Add('      ) ');
                     End;
                  End;
               qrySegregacao.SQL.Add('      AND PR.IDPESSJUR    = P2.IDPESSOA             ');
               qrySegregacao.SQL.Add('      AND PR.IDPLANOPREV  = PL.IDPLANOPREV          ');
               qrySegregacao.SQL.Add('      AND PR.FLGDESATIVADO = 0                      '); // Ativo
               qrySegregacao.SQL.Add('GROUP BY DECODE(PL.IDPLANOPREV, 19, 66, DECODE(PL.IDPLANOPREV, 79, 66, DECODE(PL.IDPLANOPREV, 29, 66, PL.IDPLANOPREV))),  ');
               qrySegregacao.SQL.Add('         91008                                      ');
               qrySegregacao.SQL.Add(' )                                                  ');
               qrySegregacao.SQL.Add('GROUP BY IDPLANOPREV, IDPATRO                       ');
               qrySegregacao.Open;
               While Not qrySegregacao.EOF Do
                  Begin
                     // Achando o valor total de cada Plano
                     dValorTotalPlano := dValorCadaLitis * qrySegregacao.FieldByName('QTD_PESSOAS_POR_PLANO').asFloat;

                     // Localizando a parâmetrização contábil adequada
                     If LocalizaParametrosContabeis(
                        0, // Matéria
                        iAplica_se_A, // 0 -> Principal; 1 -> Correção Monetária; 2 -> Juros
                        iPrograma, // Progama
                        0, // Empresa
                        '', // Centro Custo
                        '', // Tipo da Acao
                        sSub_Programa, sContaDEB, sContaCRE, dNumPlano) Then
                        Begin
                           // Provisionando ou Estornando
                           dValorTotalPlano := IFF(iTipoLancamento = 'P', Abs(dValorTotalPlano), Abs(dValorTotalPlano) * -1);

                           If FCtrlLancamento.InsereLancaContab(
                              cTipoLanc, // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
                              IdEmpresa, // Empresa
                              iModuloOrigem, // Módulo de Origem
                              liUsuario, // Usuário Ativo
                              dNumPlano, // Plano de Contas
                              liUnidNegoc, // Unidade de Negócio
                              liSubContaDeb, // Sub-Conta de Débito
                              liSubContaCre, // Sub-Conta de Crédito
                              qrySegregacao.fieldbyname('IDPLANOPREV').asInteger, // Plano de Rateio
                              qrySegregacao.fieldbyname('IDPATRO').asInteger, // Patrocinadora de Rateio
                              dPlnCodigo, // Número da Planilha
                              iNumLan, // Número do Lançamento
                              sDataLanc, // Data da Correção
                              Copy(sDataLanc, 7, 4) + Copy(sDataLanc, 3, 3), // Número do Documento
                              sHist1, // 1ª Linha do Histórico
                              sHist2, // 2ª Linha do Histórico
                              sHist3, // 3ª Linha do Histórico
                              sHist4, // 4ª Linha do Histórico
                              sDescObjeto, // 5ª Linha do Histórico
                              sSub_Programa, // Sub-Programa (TIPCODIGO)
                              cCCustd, // Centro de Custo para Débito
                              sContaDEB, // Conta para Débito
                              cCCustc, // Centro de Custo para Crédito
                              sContaCRE, // Conta para Crédito
                              sCodHist, // Código do Histórico Padrão
                              dValorTotalPlano,
                              bJunta, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
                              bUsaPlanoPatro, // Indica se usa Plano da Patrocinadora
                              ) Then
                              dPlnCodigo := FCtrlLancamento.RetornoPlnCodigo
                           Else
                              Begin
                                 Raise Exception.Create(FCtrlLancamento.MessageInfo);
                                 Result := False;
                              End;
                        End
                     Else
                        Begin
                           Raise Exception.Create('Parametrização Contábil do(a) ' + sHist1 + ' / ' + sHist2 + ' - ' +
                              IFF(iAplica_se_A = 0, '" Valor Principal"', IFF(iAplica_se_A = 1, '" Correção Monetária"', '" Juros"')) +
                              ' Não Localizada !');
                           Result := False;
                        End;

                     qrySegregacao.Next;

                  End;
            End;
      End;

   FreeAndNil(qrySegregacao);
End;

End.

{// *************************************************
// PROGRAMA INVESTIMENTO - Investimento Imobiliário
// *************************************************
qryAux1.DataBaseName := 'BaseDados';
qryAux1.Close;
qryAux1.SQL.Clear;
qryAux1.SQL.Add('SELECT EP.IDIMOVEL               ');
qryAux1.SQL.Add('FROM ETAPAPROCTRAB EP            ');
qryAux1.SQL.Add('WHERE EP.NUMPROCTRAB = ' + quotedstr(sNumProcTrab));
qryAux1.SQL.Add('      AND EP.CODTIPORECURSO = 1030  '); // Penhorado
qryAux1.Open;
While Not qryAux1.EOF Do
   Begin
      // achando a quantidade de Imóveis para ser usada no cálculo do rateio
      iQtd := 1;
      qrySegregacao.DataBaseName := 'BaseDados';
      qrySegregacao.Close;
      qrySegregacao.SQL.Clear;
      qrySegregacao.SQL.Add('SELECT COUNT(*) QTD_TOTAL_IMOB     ');
      qrySegregacao.SQL.Add('FROM ETAPAPROCTRAB EP,             ');
      qrySegregacao.SQL.Add('     PLANOPATROXVIGENCIAIMOB P1    ');
      qrySegregacao.SQL.Add('WHERE EP.NUMPROCTRAB = ' + quotedstr(sNumProcTrab));
      qrySegregacao.SQL.Add('      AND EP.CODTIPORECURSO = 1030   '); // Penhorado
      qrySegregacao.SQL.Add('      AND p1.IDIMOVEL = EP.IDIMOVEL  ');
      qrySegregacao.SQL.Add('      AND P1.IDIMOVEL = ' + quotedstr(qryAux1.FieldByName('IDIMOVEL').asString));
      qrySegregacao.SQL.Add('      AND P1.DATAVIGENCIA = (SELECT MAX(p2.DATAVIGENCIA)       ');
      qrySegregacao.SQL.Add('                             FROM PLANOPATROXVIGENCIAIMOB P2   ');
      qrySegregacao.SQL.Add('                             WHERE P2.IDIMOVEL = P1.IDIMOVEL)  ');
      qrySegregacao.SQL.Add('GROUP BY P1.IDIMOVEL, P1.IDPLANOPREV, P1.IDPATRO, P1.PERCENTRATEIO  ');
      qrySegregacao.Open;

      iQtdItensSegrega := qrySegregacao.fieldbyname('QTD_TOTAL_IMOB').asInteger;

      qrySegregacao.DataBaseName := 'BaseDados';
      qrySegregacao.Close;
      qrySegregacao.SQL.Clear;
      qrySegregacao.SQL.Add('SELECT P1.IDIMOVEL, P1.IDPLANOPREV, P1.IDPATRO, P1.PERCENTRATEIO  ');
      qrySegregacao.SQL.Add('FROM ETAPAPROCTRAB EP,             ');
      qrySegregacao.SQL.Add('     PLANOPATROXVIGENCIAIMOB P1    ');
      qrySegregacao.SQL.Add('WHERE EP.NUMPROCTRAB = ' + quotedstr(sNumProcTrab));
      qrySegregacao.SQL.Add('      AND EP.CODTIPORECURSO = 1030   '); // Penhorado
      qrySegregacao.SQL.Add('      AND p1.IDIMOVEL = EP.IDIMOVEL  ');
      qrySegregacao.SQL.Add('      AND P1.IDIMOVEL = ' + quotedstr(qryAux1.FieldByName('IDIMOVEL').asString));
      qrySegregacao.SQL.Add('      AND P1.DATAVIGENCIA = (SELECT MAX(p2.DATAVIGENCIA)       ');
      qrySegregacao.SQL.Add('                             FROM PLANOPATROXVIGENCIAIMOB P2   ');
      qrySegregacao.SQL.Add('                             WHERE P2.IDIMOVEL = P1.IDIMOVEL)  ');
      qrySegregacao.SQL.Add('GROUP BY P1.IDIMOVEL, P1.IDPLANOPREV, P1.IDPATRO, P1.PERCENTRATEIO  ');
      qrySegregacao.Open;
      While Not qrySegregacao.EOF Do
         Begin
            If iQtd < iQtdItensSegrega Then
               Begin
                  dValorSegregado := ((dValorLancamento * qrySegregacao.fieldbyname('PERCENTRATEIO').asFloat) / 100);
                  dValorSegrega := dValorSegrega + dValorSegregado;
                  inc(iQtd);
               End
            Else
               dValorSegregado := dValorLancamento - dValorSegrega;

            // Localizando a parâmetrização contábil adequada
            If LocalizaParametrosContabeis(
               0, // Matéria
               iAplica_se_A, // 0 -> Principal; 1 -> Correção Monetária; 2 -> Juros
               iPrograma, // Progama
               0, // Empresa
               '', // Centro Custo
               '', // Tipo da Acao
               sSub_Programa, sContaDEB, sContaCRE, dNumPlano) Then // Sub-Programas
               Begin
                  // Provisionando ou Estornando
                  dValorSegregado := IFF(iTipoLancamento = 'P', Abs(dValorSegregado), Abs(dValorSegregado) * -1);

                  If FCtrlLancamento.InsereLancaContab(
                     cTipoLanc, // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
                     IdEmpresa, // Empresa
                     iModuloOrigem, // Módulo de Origem  (719)
                     liUsuario, // Usuário Ativo
                     dNumPlano, // Plano de Contas
                     liUnidNegoc, // Unidade de Negócio
                     liSubContaDeb, // Sub-Conta de Débito
                     liSubContaCre, // Sub-Conta de Crédito
                     qrySegregacao.fieldbyname('IDPLANOPREV').asInteger,
                     qrySegregacao.fieldbyname('IDPATRO').asInteger,
                     dPlnCodigo, // Número da Planilha
                     iNumLan, // Número do Lançamento
                     sDataLanc, // Data da Correção
                     Copy(sDataLanc, 7, 4) + Copy(sDataLanc, 3, 3), // Número do Documento
                     sHist1, // 1ª Linha do Histórico
                     sHist2, // 2ª Linha do Histórico
                     sHist3, // 3ª Linha do Histórico
                     sHist4, // 4ª Linha do Histórico
                     sDescObjeto, // 5ª Linha do Histórico
                     sSub_Programa, // Sub-Programa (TIPCODIGO)
                     cCCustd, // Centro de Custo para Débito
                     sContaDEB, // Conta para Débito
                     cCCustc, // Centro de Custo para Crédito
                     sContaCRE, // Conta para Crédito
                     sCodHist, // Código do Histórico Padrão
                     dValorSegregado,
                     bJunta, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
                     bUsaPlanoPatro, // Indica se usa Plano da Patrocinadora
                     ) Then
                     dPlnCodigo := FCtrlLancamento.RetornoPlnCodigo
                  Else
                     Begin
                        Raise Exception.Create(FCtrlLancamento.MessageInfo);
                        Result := False;
                     End;
               End
            Else
               Begin
                  Raise Exception.Create('Parametrização Contábil do(a) ' + sHist1 + ' / ' + sHist2 + ' - '
                     IFF(iAplica_se_A = 0, '" Valor Principal"', IFF(iAplica_se_A = 1, '" Correção Monetária"', '" Juros"')) +
                     ' Não Localizada !');
                  Result := False;
               End;

            qrySegregacao.Next;

         End;

      qryAux1.Next;

   End;   }

//****************************************************

// Memória de cálculo passada pela Contabilidade em 14/06/2011 pelo Sr. Igor

//Cálculo Correto - processo 3860

//Saldo em 12/2010	A	 15.210.840,00
//Principal 	B	          1.000.000,00
//Correção Acum.	C	  7.266.761,00
//Juros Acumulado	D	  6.944.079,00
//Índice TRN Jan/11	E       	0,0715%
//Qtde mês JUROS	F	            85

//Cálculo Correção
//=(B+C)*E	G	              5.910,73
//Cálculo JUROS
//=(B+C+G)*F%-D	H	             87.691,97

//Saldo em 01/2011 = A+G+H = I   15.304.442,71
//PercOrig = (I/B) * 100              1.530,44

