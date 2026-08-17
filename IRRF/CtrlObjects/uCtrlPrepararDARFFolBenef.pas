//***************************************************************************************
//Rotina                : _ListaNatuRendimento
//N. WO...........      : 8385
//Data da Alteração:    : 07/03/2024
//Alteração Form:       :
//Responsável:          : Andre Imakawa
//Descrição.......      : Não verificar o campo FLGUSADONADCTF na consulta do rendimento
//***************************************************************************************
//Rotina                : _SelecionaMovDARF
//N. SIG..........      : 79320
//Data da Alteração:    : 05/12/2018
//Alteração Form:       : uCtrlPrepararDARFFolBenef
//Responsável:          : Everson Luiz Pereira da Cunha
//Descrição.......      : Alteração na query, para que não retorne os registros
//                        que já foram gravados na tabela IRRFFOLHABENEF na
//                        aba "Selecionar Movimento dos DARF's"
//***************************************************************************************
//Rotina                : _SelecionaMovDARF
//N. SIG..........      : 50508
//Data da Alteração:    : 11/09/2018
//Alteração Form:       : uCtrlPrepararDARFFolBenef
//Responsável:          : Fábio Sampaio
//Descrição.......      : Alteração na consulta para filtrar pela DATAPAGAMENTO
//                        ao invés do MESCOBRANCA.
//***************************************************************************************
//Rotina                : _SelecionaMovDARF
//N. SIG..........      : 50508
//Data da Alteração:    : 24/05/2018
//Alteração Form:       : uCtrlPrepararDARFFolBenef
//Responsável:          : Taffarel Sevaybriker
//Descrição.......      : Alteração na consulta para não filtrar pela data de referência
//                        devido a remoção do campo no form FPrepararDARFFolBenef.
//*******************************************************************************
//Rotina                : _SelecionaMovDARF
//N. SIG..........      : 53173.57973
//Data da Alteração:    : 18/01/2018
//Alteração Form:       : uCtrlPrepararDARFFolBenef
//Responsável:          : Cássio Florêncio Rovaroto
//Descrição.......      : Alteração na consulta que recupera os registro das rubricas,
//                        fazendo que se recupere os dados do plano previdenciário
//                        a partir do perfil de investimento.
//*******************************************************************************
//Rotina                : _SelecionaMovDARF, _SelecionaLancManualIRRF, _SelecionaMovPrepDARF
//N. SIG                : 61511
//Data da Alteração:    : 15/01/2018
//Responsável:          : Edilaine
//Descrição             : Ajuste campos Plano e IdPlanoPrev gravados na estrutura IRRFFOLHABENEF
//*******************************************************************************
//Rotina                : Geral
//N. SIG                : 47588
//Data da Alteração:    : 06/06/2017
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição             : NOVO - Inclusao de novas funções por conta da rotina
//                        de Lançamento Manual do IRRF
//*******************************************************************************
//Rotina                : SelecionaMovDARF
//N. SIG                : 49484
//Data da Alteração:    : 10/07/2017
//Alteração Form:       :
//Responsável:          : André Imakawa
//Descrição             : Não esta trazendo registros referente a devolução.
//*******************************************************************************
//Rotina                : Geral
//N. SIG                : 34742
//Data da Alteração:    : 06/12/2016
//Alteração Form:       : frmPrepararDARFFolBenef
//Responsável:          : Paulo Nobre
//Descrição             : Nova Funcionalidade
//*******************************************************************************
//
Unit uCtrlPrepararDARFFolBenef;

Interface

Uses Classes, Db, DbClient, SysUtils, contnrs, controls, adodb,
  UDiasUteis, umenserro, uSistema, uCmControlObject, uCmMath,
  uCmDbObject, uDataBase, uCMTypes, DBaseDados, Dialogs, Forms,
  comCtrls, dbTables, Wwquery, uCmSqlParams, math, CMwwQuery, FProgresso,
  Gauges, uFuncoesUteisIR;

Type
  TCtrlPrepararDARFFolBenef = Class(tCmControlObject)
  Private
    sPathArquivo: String;

    CdsAux1: TClientDataSet;
    qryAux1: TwwQuery;
    sqlText: TStringList;
  Public

    Constructor Create; Override;
    Destructor Destroy; Override;

    // Funções Básicas de Apoio
    Procedure _AtualizaFrmProgresso(Var iContador: integer);
    Function _PrepararFloat(sString: String): String;
    Function _ConverteListas(Const pListaPessoas: TStringList): String;
    Function _TiraMascara(wTexto: String): String;
    Function _TrocaTexto(sString: String; sOld: String; sNew: String; bInsensitive: boolean = true): String;
    Function _CompletaEspacoDir(sNome: String; iTam: integer): String;
    Function _CompletaZeroEsq(sNome: String; iTam: integer): String;
    Function _ValidaCPF(sDocum: String): Boolean;
    Function _ValidaCNPJ(sDocum: String): Boolean;
    Function _SomaDig(sDocum: String; iTotDig, iPot: integer): integer;
    //
    // Lista das Naturezas de Rendimento disponíveis
    Function _ListaNatuRendimento: OleVariant;
    // Lista os últimos 5 anos de Versões da Folha de Benefícios disponíveis
    Function _ListaVersoesFolha: OleVariant;
    // Paulo Nobre - SIG 47588 - Inicio
    Function _ListPlanoPrev: OleVariant; // Lista os planos prevs
    Function _ListPatrocinadora: OleVariant; // Lista as pratrocinadoras
    // Paulo Nobre - SIG 47588 - Fim
  //
    Function _SelecionaMovDARF(
      pNatureza,
      pVersaoFolha,
      pPerCob,
      pPerRef,
      pCPF: String): OleVariant;

    Function _SelecionaMovPrepDARF(
      pNatureza,
      pVersaoFolha: String;
      pDataIni,
      pDataFim: TDateTime): OleVariant;

    Function _ExisteLancamentoGravado(
      pNatureza,
      pVersaoFolha,
      pPerCob,
      pPerRef: String): Boolean;

    Function _ApagaMovGravadoDARF(
      pNatureza,
      pVersaoFolha: String;
      pDataIni,
      pDataFim: TDateTime): Boolean;

    // Paulo Nobre - SIG 47588 - Inicio
    Function _SelecionaLancManualIRRF(
      pNatureza,
      pVersaoFolha: String;
      pDataIni,
      pDataFim: TDateTime): String;

    Function _ValidaPlanoPatro(iIdPlano, iIdPatro: Integer): Boolean;
    Function _ListaPlanoPatro(Const iIdPlanoPrev: Integer = -1; Const iIdPatro: integer = -1; Const iIDPLANPREVCTBPATR: Integer = -1): OleVariant;

    // Paulo Nobre - SIG 47588 - Fim

  Protected
    Procedure DoChangeDataBase; Override;
    Procedure AfterInitialize; Override;
  End;

Implementation

{ TCtrlPrepararDARFFolBenef }

Procedure TCtrlPrepararDARFFolBenef.AfterInitialize;
Begin
  Inherited;
End;

Procedure TCtrlPrepararDARFFolBenef.DoChangeDataBase;
Begin
  Inherited;
End;

Constructor TCtrlPrepararDARFFolBenef.Create;
Begin
  Inherited;
  CdsAux1 := TClientDataSet.Create(Nil);
  qryAux1 := TwwQuery.Create(Nil);
  qryAux1.DatabaseName := 'BaseDados';

  sqlText := TStringList.create;
  sPathArquivo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\LogMovDARF';
End;

Destructor TCtrlPrepararDARFFolBenef.Destroy;
Begin
  Inherited;
  CdsAux1.Close;
  qryAux1.Close;

  FreeAndNil(CdsAux1);
  FreeAndNil(qryAux1);
  FreeAndNil(sqlText);
End;

//////////////////////////////// INÍCIO FUNÇÕES BÁSICAS /////////////////////////////////

Function TCtrlPrepararDARFFolBenef._ValidaCPF(sDocum: String): boolean;
Var idvo1, idvo2, idv1, idv2, iSoma, iResto: integer;
Begin
  If length(sDocum) <> 11 Then
    Result := false
  Else
    Begin
      If strtoFloat(sDocum) = 0 Then
        Result := false
      Else
        Begin
          idvo1 := StrToInt(sDocum[10]);
          idvo2 := StrToInt(sDocum[11]);

          //Calcula o digito verificador 1
          iSoma := _SomaDig(sDocum, 9, 10);
          iResto := iSoma Mod 11;
          If (iResto <= 1) Then
            idv1 := 0
          Else
            idv1 := 11 - iResto;

          //Calcula o digito verificador 2
          iSoma := _SomaDig(sDocum, 9, 11);
          iSoma := iSoma + (idv1 * 2);

          iResto := iSoma Mod 11;
          If (iResto <= 1) Then
            idv2 := 0
          Else
            idv2 := 11 - iResto;

          Result := ((idv1 = idvo1) And (idv2 = idvo2));
        End;
    End;
End;

Function TCtrlPrepararDARFFolBenef._ValidaCNPJ(sDocum: String): boolean;
Var iSoma, idvo1, idvo2, idv1, idv2, iResto: integer;
Begin
  If length(sDocum) <> 14 Then
    Result := false
  Else
    Begin
      If strtoFloat(sDocum) = 0 Then
        Result := false
      Else
        Begin
          idvo1 := StrToInt(sDocum[13]);
          idvo2 := StrToInt(sDocum[14]);

          //Calcula o digito verificador 1
          iSoma := _SomaDig(sDocum, 12, 5);
          iResto := iSoma Mod 11;
          If (iResto <= 1) Then
            idv1 := 0
          Else
            idv1 := 11 - iResto;

          // Calcula o digito verificador 2
          iSoma := _SomaDig(sDocum, 12, 6);
          iSoma := iSoma + (idv1 * 2);

          iResto := iSoma Mod 11;
          If (iResto <= 1) Then
            idv2 := 0
          Else
            idv2 := 11 - iResto;

          Result := ((idv1 = idvo1) And (idv2 = idvo2));
        End;
    End;
End;

Function TCtrlPrepararDARFFolBenef._SomaDig(sDocum: String; iTotDig, iPot: integer): integer;
Var i: integer;
Begin
  Result := 0;
  For i := 1 To iTotDig Do
    Begin
      Result := Result + (StrToInt(sDocum[i]) * iPot);
      Dec(iPot);
      If iPot = 1 Then
        iPot := 9;
    End;
End;

Function TCtrlPrepararDARFFolBenef._PrepararFloat(sString: String): String;
Begin
  Result := sString;
  Result := _TrocaTexto(Result, '.', DecimalSeparator);
  Result := _TrocaTexto(Result, ',', DecimalSeparator);
End;

Function TCtrlPrepararDARFFolBenef._ConverteListas(Const pListaPessoas: TStringList): String;
Var I: Integer;
Begin
  For i := 0 To pListaPessoas.Count - 1 Do
    result := result + quotedstr(pListaPessoas[i]) + ',';

  Result := Copy(Result, 1, Length(Result) - 1);
End;

Function TCtrlPrepararDARFFolBenef._TiraMascara(wTexto: String): String;
Var wCon, wCC: Integer;
  wRet, wParte: String;
Begin
  wRet := '';
  wCC := Length(wTexto);
  For wCon := 1 To wCC Do
    Begin
      wParte := copy(wTexto, wCon, 1);
      If (wParte <> '-') And
        (wParte <> '/') And
        (wParte <> '.') And
        (wParte <> '"') And
        (wParte <> '*') Then
        wRet := wRet + wParte;
    End;
  _TiraMascara := wRet;
End;

Function TCtrlPrepararDARFFolBenef._TrocaTexto(sString: String; sOld: String; sNew: String; bInsensitive: boolean = true): String;
Var
  iPosition: integer;
  sTemp: String;
Begin
  iPosition := 1;
  sTemp := '';
  While (iPosition > 0) Do
    Begin
      If bInsensitive Then
        iPosition := AnsiPos(UpperCase(sOld), UpperCase(sString))
      Else
        iPosition := AnsiPos(sOld, sString);
      If (iPosition > 0) Then
        Begin
          sTemp := sTemp + copy(sString, 1, iPosition - 1) + sNew;
          sString := copy(sString, iPosition + Length(sOld), Length(sString));
        End;
    End;
  sTemp := sTemp + sString;
  Result := (sTemp);
End;

Procedure TCtrlPrepararDARFFolBenef._AtualizaFrmProgresso(Var iContador: Integer);
Begin
  inc(iContador);
  frmProgresso.AndaFormProgresso(iContador);
  Application.ProcessMessages;
End;

Function TCtrlPrepararDARFFolBenef._CompletaEspacoDir(sNome: String; iTam: integer): String;
Var i, k: integer;
  Espacos: String;
Begin
  If Length(sNome) > iTam Then
    sNome := Copy(sNome, 1, iTam);

  sNome := trim(sNome);
  i := length(sNome);
  Espacos := '';
  For k := 1 To (iTam - i) Do
    Espacos := Espacos + ' ';

  Result := sNome + Espacos;
End;

Function TCtrlPrepararDARFFolBenef._CompletaZeroEsq(sNome: String; iTam: integer): String;
Var i, k: integer;
Begin
  If Length(sNome) > iTam Then
    sNome := Copy(sNome, 1, iTam);

  sNome := trim(sNome);
  i := length(sNome);
  Result := '';
  For k := 1 To (iTam - i) Do
    Result := Result + '0';
  Result := Result + sNome;
End;

//////////////////////////////// FIM FUNÇÕES BÁSICAS /////////////////////////////////

Function TCtrlPrepararDARFFolBenef._ListaNatuRendimento: OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT CODNATUREZA, DESCRICAO, (DESCRICAO || '' - ('' || CODNATUREZA || '')'') AS DESCRICAOCOMPL      ' +
    'FROM NATURENDIMENTO                                                ' +
    //'WHERE FLGUSADONADCTF = ''S''                                       ' +  //Andre Imakawa - WO8385
    '      WHERE GRUPOTRIBUTO IS NOT NULL                                ' +   //Andre Imakawa - WO8385
    'ORDER BY CODNATUREZA                                        ';

  Result := GetDataPacket(sSql);
End;

Function TCtrlPrepararDARFFolBenef._ListaVersoesFolha: OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT * FROM (' +
    ' SELECT 0 ORDEM, ''Selecione Versão da Folha'' AS HISTORICO, -1 AS IDHSTFOLHABENEF, NULL DATAPREVPAGTO, '''' MESREFERENCIA ' +
    ' FROM DUAL                    ' +
    'UNION ALL                     ' +
    ' SELECT 1 ORDEM, IDHSTFOLHABENEF || ''-'' || HISTORICO AS HISTORICO, IDHSTFOLHABENEF, DATAPREVPAGTO, MESREFERENCIA ' +
    ' FROM HSTFOLHABENEF                  ' +
    ' WHERE DATAPREVPAGTO IS NOT NULL     ' +
    '       AND FLGTIPOFOLHA = ''0''      ' + // Folhas Normais
  '         AND TO_CHAR(DATAPREVPAGTO, ''YYYY'') >= TO_CHAR(SYSDATE, ''YYYY'') - 1)' + // Sempre mantendo a seleção do último ano fiscal
  ' ORDER BY ORDEM, IDHSTFOLHABENEF DESC ';

  Result := GetDataPacket(sSql);
End;

Function TCtrlPrepararDARFFolBenef._SelecionaMovDARF(
  pNatureza,
  pVersaoFolha,
  pPerCob,
  pPerRef,
  pCPF: String): OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT ''S'' MARCADO,                     ' + #13#10 +
    'H.IDHSTFOLHABENEF,                              ' + #13#10 +
    'H.NUMDOCUMENTO,                                 ' + #13#10 +
    'H.IDRESPONSAVEL,                                ' + #13#10 +
    'H.MESCOBRANCA,                                  ' + #13#10 +
    'H.MES,                                          ' + #13#10 +
    'H.IDPESSOA,                                     ' + #13#10 +
    'H.IDPESSJUR,                                    ' + #13#10 +
    'H.IDPROCJUD,                                    ' + #13#10 +
    'NVL(PE.RAZAOSOCIAL, PE.NOME) NOME,              ' + #13#10 +
    'H.CODIRRFDARF,                                  ' + #13#10 +
    'H.DATAPAGAMENTO,                                ' + #13#10 +
    'H.CODPROVDESC,                                  ' + #13#10 +
    'H.IDMOTIVO,                                     ' + #13#10 +
    'DECODE(H.FLGDESCONTO, 1, H.VALORPROVENTO, (H.VALORPROVENTO * -1)) AS VALORPROVENTO,   ' + #13#10 +
    'H.VALORINFO,                                    ' + #13#10 +
    'H.IDINFORME,                                    ' + #13#10 +
    'H.FONTEPAGADORA,                                ' + #13#10 +
    'H.FLGTIPODESC,                                  ' + #13#10 +
    //Cássio Rovaroto - SIG nº 53173.57973 - Início
    //'H.IDPLANOCONTABIL,                              ' + #13#10 +
    'PI.IDPLANPREVCONTAB AS IDPLANOCONTABIL,         ' + #13#10 +
    //Cássio Rovaroto - SIG nº 53173.57973 - Fim
    'PC.NOME AS NOMEPLANO,                           ' + #13#10 +
    'H.IDPATRO,                                      ' + #13#10 +
    'PA.NOME AS NOMEPATRO,                           ' + #13#10 +
    'DECODE(H.FLGTIPODESC, ''I'', DECODE(TRIM(RX.CODTIPRECDESFAV),'''', H.CODTIPRECDES, RX.CODTIPRECDESFAV),    ' + #13#10 +
    '  DECODE(TRIM(H.CODTIPRECDES),'''', RX.CODTIPRECDES, H.CODTIPRECDES)) AS CODTIPRECDES,                     ' + #13#10 +
    'H.IDPLANOPREV,                                                                                             ' + #13#10 +
    'DECODE(P.FLGDESCONTO, 0, NVL(H.PLACONTAD, RX.PLACONTAD), NVL(H.PLACONTAC, RX.PLACONTAC)) AS PLACONTAC,     ' + #13#10 +
    'M.DESCRICAO,                                    ' + #13#10 +
    'P.DESCRICAO DESCPROVENTO,                       ' + #13#10 +
    'CR.VALORPARAM AS CODCENTROCUSTO,                ' + #13#10 +
    'H.CODCENTRORESPON,                              ' + #13#10 +
    'PR.IDPROGRAMA AS IDPROGRAMA,                    ' + #13#10 +
    'P.DESCRICAO DESCPROVENTO                        ' + #13#10 +
    ', H.PLANO                                       ' + #13#10 +     //edilaine - SIG61511
    'FROM HISTRUBSAL H                               ' + #13#10 +
    'JOIN PROVDESC P ON P.CODPROVDESC = H.CODPROVDESC                                            ' + #13#10 +
    'JOIN PESSOA PE ON PE.IDPESSOA = H.IDPESSOA                                                  ' + #13#10 +
    'JOIN PLANPREVCONTABIL PC ON PC.IDPLANOPREV = H.IDPLANOCONTABIL                              ' + #13#10 +
    'JOIN MOTIVO M ON M.IDMOTIVO = H.IDMOTIVO                                                    ' + #13#10 +
    'JOIN PESSOA PA ON PA.IDPESSOA = H.IDPATRO                                                   ' + #13#10 +
    'JOIN (SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''CODCCUSTOFINAN'') CR ON 1 = 1   ' + #13#10 +
    'JOIN PROGRAMA PR ON PR.FLGTIPOPROGRAMA = ''PRE''                                            ' + #13#10 +
	// Paulo Nobre - SIG 47588 -inicio
	//'JOIN INFORME I ON I.IDINFORME  = H.IDINFORME                                                ' + #13#10 +    // Andre Imakawa - SIG 49484
    'JOIN INFORME I ON I.IDINFORME = H.IDINFORME AND I.FLGIRRF =  ''S''                          ' + #13#10 +  
	// Paulo Nobre - SIG 47588 -fim
    //Cássio Rovaroto - SIG nº 53173.57973 - Início
    'JOIN PERFILINVEST PI ON PI.IDPERFILINVEST = H.IDPERFILINVEST                                ' + #13#10 +
    //Cássio Rovaroto - SIG nº 53173.57973 - Fim
    'INNER JOIN RUBRICAXPLANO RX ON (H.IDPATRO = RX.IDPESSJUR)                                   ' + #13#10 +
    '                     AND (H.IDRUBRICA = RX.IDRUBRICA)                                       ' + #13#10 +
    '                     AND (H.IDPLANOPREV = RX.IDPLANOPREV)                                   ' + #13#10 +
    'WHERE H.CODIRRFDARF = ' + quotedstr(pNatureza) + #13#10;

  If pVersaoFolha <> '-1' Then
    sSql := sSql + '      AND H.IDHSTFOLHABENEF  = ' + quotedstr(pVersaoFolha) + #13#10
  Else
    Begin
      // Alterado por FHBS - 11/09/2018 - SIG50508
      //sSql := sSql + '      AND H.MESCOBRANCA = ' + quotedstr(pPerCob) + #13#10;
      sSql := sSql + '      AND H.DATAPAGAMENTO >= TO_DATE(' + quotedstr(pPerCob) + ',''YYYY/MM'')' + #13#10;
      sSql := sSql + '      AND H.DATAPAGAMENTO <= LAST_DAY(TO_DATE(' + quotedstr(pPerCob) + ',''YYYY/MM'')) ' + #13#10;
      sSql := sSql + '      AND H.IDHSTFOLHABENEF  IS NOT NULL ' + #13#10;
      // Fim - Alterado por FHBS - 11/09/2018 - SIG50508
      //sSql := sSql + '      AND H.MES = ' + quotedstr(pPerRef) + #13#10;  //Taffarel - SIG50508
    End;

  If pCPF <> EmptyStr Then
    sSql := sSql + '      AND H.NUMDOCUMENTO = ' + quotedstr(pCPF) + #13#10;

  sSql := sSql + '      AND H.FLGIRRF = 0                     ' + #13#10 +
//    '      AND H.FLGTIPODESC = ''I''                          ' + #13#10 +  //  Andre Imakawa - SIG 49484/Paulo Nobre - SIG 47588
    '      AND I.FLGIRRF = ''S''                              ' + #13#10 + // Andre Imakawa - SIG 49484
    '      AND H.IDMODULO = 18                                ' + #13#10 + // Módulo Folha de Benefícios

    //Everson Cunha - SIG79320 (Repassado pelo Rafael Vasconcelos COSIS) - Início
    //Mesmo após Gravar (cm.IRRFFOLHABENEF) os registros ainda estavam sendo visualizados na aba de "Selecionar Movimento"
    'AND NOT EXISTS ( SELECT 1                                       ' + #13#10 +
    '                       FROM IRRFFOLHABENEF IR                   ' + #13#10 +
    '                      WHERE IR.IDPESSOA=H.IDRESPONSAVEL         ' + #13#10 +
    '                        AND IR.IDHSTFOLHABENEF=H.IDHSTFOLHABENEF' + #13#10 +
    '                        AND IR.CODNATUREZA=H.CODIRRFDARF        ' + #13#10 +
    '                        AND IR.FLGREGEXCLUIDO = ''N''           ' + #13#10 +
    '                        AND IR.IDMOTIVO = H.IDMOTIVO            ' + #13#10 +
    '                        AND IR.IDINFORME = H.IDINFORME   )      ' + #13#10 +
    //Everson Cunha - SIG79320 (Repassado pelo Rafael Vasconcelos COSIS) - Fim

  'ORDER BY H.IDHSTFOLHABENEF,                                ' + #13#10 +
    '       PE.RAZAOSOCIAL                                    ' + #13#10;
//  sqlText.Clear;
//  sqlText.add(sSql);
//  sqlText.SaveToFile(sPathArquivo + '\SQL_SelMovDARF.txt');

  Result := GetDataPacket(sSql);
End;

Function TCtrlPrepararDARFFolBenef._SelecionaMovPrepDARF(
  pNatureza,
  pVersaoFolha: String;
  pDataIni,
  pDataFim: TDateTime): OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT I.IDLANCIRRFFOLHABENEF,           ' + #13#10 +
    'I.IDHSTFOLHABENEF,                             ' + #13#10 +
    'RTRIM(I.NUMDOCUMENTO) NUMDOCUMENTO,            ' + #13#10 +
    'I.IDPESSOA,                                    ' + #13#10 +
    'NVL(PE.RAZAOSOCIAL, PE.NOME) NOME,             ' + #13#10 +
    'I.CODNATUREZA,                                 ' + #13#10 +
    'I.IDPATRO,                                     ' + #13#10 +
    'I.IDPLANOPREV,                                 ' + #13#10 +
    'I.IDMOTIVO,                                    ' + #13#10 +
    'I.IDINFORME,                                   ' + #13#10 +
    'I.IDDARF,                                      ' + #13#10 +
    'I.CODDOCUMENTO,                                ' + #13#10 +
    'I.IDPROCJUD,                                   ' + #13#10 +
    'I.CODTIPRECDES,                                ' + #13#10 +
    'I.CODPROVDESC,                                 ' + #13#10 +
    'I.FONTEPAGADORA,                               ' + #13#10 +
    'I.PLANO,                                       ' + #13#10 +
    'I.PLACONTA,                                    ' + #13#10 +
    'I.MESCOBRANCA,                                 ' + #13#10 +
    'I.MESREFERENCIA,                               ' + #13#10 +
    'I.DATAPAGAMENTO,                               ' + #13#10 +
    'I.DATAVENCIMENTO,                              ' + #13#10 +
    'I.VLRIMPOSTO,                                  ' + #13#10 +
    'I.VLRBASE,                                     ' + #13#10 +
    'I.FLGREGEXCLUIDO,                              ' + #13#10 +
    'I.FLGTIPOFOLHA,                                ' + #13#10 +
    'I.IDPROGRAMA,                                  ' + #13#10 +
    'I.CODCENTROCUSTO,                              ' + #13#10 +
    'I.CODCENTRORESPON,                             ' + #13#10 +
    // Paulo Nobre - SIG 47588 - Inicio
  'I.FLGTIPOINCLUSAO,                             ' + #13#10 +
    // Paulo Nobre - SIG 47588 - Fim
  'PC.NOME AS NOMEPLANO,                          ' + #13#10 +
    'PA.NOME AS NOMEPATRO                           ' + #13#10 +
    'FROM IRRFFOLHABENEF I                          ' + #13#10 +
    'JOIN PESSOA PE ON PE.IDPESSOA = I.IDPESSOA     ' + #13#10 +
    //'JOIN PLANPREVCONTABIL PC ON PC.IDPLANOPREV = I.PLANO     ' + #13#10 +        //edilaine - SIG61511
    'JOIN PLANPREVCONTABIL PC ON PC.IDPLANOPREV = I.IDPLANOPREV ' + #13#10 +        //edilaine - SIG61511
    'JOIN PESSOA PA ON PA.IDPESSOA = I.IDPATRO              ' + #13#10 +
    'WHERE I.CODNATUREZA = ' + quotedstr(pNatureza) + #13#10;

  If pVersaoFolha <> '-1' Then
    sSql := sSql + '      AND I.IDHSTFOLHABENEF  = ' + quotedstr(pVersaoFolha) + #13#10
  Else
    Begin
      sSql := sSql + '      AND (I.DATAPAGAMENTO >= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataIni)) + ',''dd/mm/yyyy'')' + #13#10 +
        '      AND I.DATAPAGAMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataFim)) + ',''dd/mm/yyyy'')' + ')' + #13#10;
    End;

  //sSql := sSql + 'ORDER BY I.CODNATUREZA, I.IDHSTFOLHABENEF, I.NUMDOCUMENTO   ' + #13#10;// Paulo Nobre - SIG 47588 
  sSql := sSql + 'ORDER BY I.CODNATUREZA, I.IDHSTFOLHABENEF, I.FLGTIPOINCLUSAO DESC, I.IDDARF DESC, I.NUMDOCUMENTO   ' + #13#10; // Paulo Nobre - SIG 47588 
//  sqlText.Clear;
//  sqlText.add(sSql);
//  sqlText.SaveToFile(sPathArquivo + '\SQL_SelMovPrepDARF.txt');

  Result := GetDataPacket(sSql);
End;

Function TCtrlPrepararDARFFolBenef._ExisteLancamentoGravado(
  pNatureza,
  pVersaoFolha,
  pPerCob,
  pPerRef: String): Boolean;
Var qryAux: TwwQuery;
Begin
  qryAux := TwwQuery.Create(Nil);
  qryAux.DatabaseName := 'BaseDados';
  qryAux.Close;
  With qryAux.Sql Do
    Begin
      Clear;
      Add('SELECT CODNATUREZA ');
      Add('FROM IRRFFOLHABENEF ');
      Add('WHERE CODNATUREZA = ' + quotedstr(pNatureza));
      Add('      AND IDHSTFOLHABENEF  = ' + quotedstr(pVersaoFolha));
      Add('      AND MESCOBRANCA = ' + quotedstr(pPerCob));
      Add('      AND MESREFERENCIA = ' + quotedstr(pPerRef));
    End;
  qryAux.Open;
  Result := Not qryAux.isEmpty; // Encontrado lançamento
  FreeAndNil(qryAux);
End;

Function TCtrlPrepararDARFFolBenef._ApagaMovGravadoDARF(
  pNatureza,
  pVersaoFolha: String;
  pDataIni,
  pDataFim: TDateTime): Boolean;
Var qryAux: TwwQuery;
Begin
  qryAux := TwwQuery.Create(Nil);
  qryAux.DatabaseName := 'BaseDados';
  qryAux.Close;
  With qryAux.Sql Do
    Begin
      Clear;
      Add('DELETE FROM IRRFFOLHABENEF ');
      Add('WHERE CODNATUREZA = ' + quotedstr(pNatureza));

      If pVersaoFolha <> '-1' Then
        Add('   AND IDHSTFOLHABENEF  = ' + quotedstr(pVersaoFolha))
      Else
        Begin
          Add('   AND (DATAPAGAMENTO >= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataIni)) + ',''dd/mm/yyyy'')');
          Add('   AND DATAPAGAMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataFim)) + ',''dd/mm/yyyy'')' + ')');
        End;
    End;

  qryAux.ExecSQL;
  Result := qryAux.isEmpty;
  FreeAndNil(qryAux);
End;

// Paulo Nobre - SIG 47588 - Inicio

Function TCtrlPrepararDARFFolBenef._SelecionaLancManualIRRF(
  pNatureza,
  pVersaoFolha: String;
  pDataIni,
  pDataFim: TDateTime): String;
Var sSql: String;
Begin
  sSql := 'SELECT I.IDLANCIRRFFOLHABENEF,           ' + #13#10 +
    'I.IDHSTFOLHABENEF,                             ' + #13#10 +
    'RTRIM(I.NUMDOCUMENTO) NUMDOCUMENTO,            ' + #13#10 +
    'I.IDPESSOA,                                    ' + #13#10 +
    'NVL(PE.RAZAOSOCIAL, PE.NOME) NOME,             ' + #13#10 +
    'I.CODNATUREZA,                                 ' + #13#10 +
    'I.IDPATRO,                                     ' + #13#10 +
    'I.IDPLANOPREV,                                 ' + #13#10 +
    'I.IDMOTIVO,                                    ' + #13#10 +
    'I.IDINFORME,                                   ' + #13#10 +
    'I.IDDARF,                                      ' + #13#10 +
    'I.CODDOCUMENTO,                                ' + #13#10 +
    'I.IDPROCJUD,                                   ' + #13#10 +
    'I.CODTIPRECDES,                                ' + #13#10 +
    'I.CODPROVDESC,                                 ' + #13#10 +
    'I.FONTEPAGADORA,                               ' + #13#10 +
    'I.PLANO,                                       ' + #13#10 +
    'I.PLACONTA,                                    ' + #13#10 +
    'I.MESCOBRANCA,                                 ' + #13#10 +
    'I.MESREFERENCIA,                               ' + #13#10 +
    'I.DATAPAGAMENTO,                               ' + #13#10 +
    'I.DATAVENCIMENTO,                              ' + #13#10 +
    'I.VLRIMPOSTO,                                  ' + #13#10 +
    'I.VLRBASE,                                     ' + #13#10 +
    'I.FLGREGEXCLUIDO,                              ' + #13#10 +
    'I.FLGTIPOFOLHA,                                ' + #13#10 +
    'I.IDPROGRAMA,                                  ' + #13#10 +
    'I.CODCENTROCUSTO,                              ' + #13#10 +
    'I.CODCENTRORESPON,                             ' + #13#10 +
    'I.FLGTIPOINCLUSAO,                             ' + #13#10 +
    'PC.NOME AS NOMEPLANO,                          ' + #13#10 +
    'PA.NOME AS NOMEPATRO                           ' + #13#10 +
    'FROM IRRFFOLHABENEF I                          ' + #13#10 +
    'JOIN PESSOA PE ON PE.IDPESSOA = I.IDPESSOA     ' + #13#10 +
    //'JOIN PLANPREVCONTABIL PC ON PC.IDPLANOPREV = I.PLANO     ' + #13#10 +        //edilaine - SIG61511
    'JOIN PLANPREVCONTABIL PC ON PC.IDPLANOPREV = I.IDPLANOPREV ' + #13#10 +        //edilaine - SIG61511
    'JOIN PESSOA PA ON PA.IDPESSOA = I.IDPATRO              ' + #13#10 +
    'WHERE I.CODNATUREZA = ' + quotedstr(pNatureza) + #13#10;

  If pVersaoFolha <> '-1' Then
    sSql := sSql + '      AND I.IDHSTFOLHABENEF  = ' + quotedstr(pVersaoFolha) + #13#10
  Else
    Begin
      sSql := sSql + '      AND (I.DATAPAGAMENTO >= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataIni)) + ',''dd/mm/yyyy'')' + #13#10 +
        '      AND I.DATAPAGAMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataFim)) + ',''dd/mm/yyyy'')' + ')' + #13#10;
    End;

  sSql := sSql + '      AND I.FLGTIPOINCLUSAO = ''M'' ' + #13#10;               

  sSql := sSql + 'ORDER BY I.NUMDOCUMENTO   ' + #13#10;        
//  sqlText.Clear;
//  sqlText.add(sSql);
//  sqlText.SaveToFile(sPathArquivo + '\SQL_SelLancManualIRRF.txt');

  Result := sSql;
End;

Function TCtrlPrepararDARFFolBenef._ListPlanoPrev: OleVariant;
Var
  sSQL: String;
Begin
  sSQL := 'SELECT IDPLANOPREV, NOME ' +
    'FROM PLANPREVCONTABIL ' +
    'WHERE NVL(ATIVO,''S'') = ''S''  ' +
    'ORDER BY NOME ';
  Result := GetDataPacket(sSQL);
End;

Function TCtrlPrepararDARFFolBenef._ListPatrocinadora: OleVariant;
Var
  sSQL: String;
Begin
  sSQL := 'SELECT P.NOME, PT.IDPESSOA ' +
    '  FROM PESSOA P, PATRO PT ' +
    ' WHERE (P.IDPESSOA = PT.IDPESSOA)';
  Result := GetDataPacket(sSQL);
End;

Function TCtrlPrepararDARFFolBenef._ValidaPlanoPatro(iIdPlano, iIdPatro: Integer): Boolean;
Var
  cdsAux: TClientDataSet;
Begin
  cdsAux := TClientDataSet.Create(Nil);

  Try
    cdsAux.Data := _ListaPlanoPatro(iIdPlano, iIDPatro, -1);
    Result := Not (cdsAux.IsEmpty);
  Finally
    cdsAux.Free;
  End;

End;

Function TCtrlPrepararDARFFolBenef._ListaPlanoPatro(Const iIdPlanoPrev: Integer = -1;
  Const iIdPatro: integer = -1;
  Const iIDPLANPREVCTBPATR: Integer = -1
  ): OLEVariant;
Var
  sSql, sParam: String;
Begin
  sParam := '';
  If iIdPlanoPrev <> -1 Then sParam := sParam + '   AND PCP.IDPLANOPREV       = ' + IntToStr(iIdPlanoPrev) + #13;
  If iIdpatro <> -1 Then sParam := sParam + '   AND PCP.IDPATRO           = ' + IntToStr(iIdPatro) + #13;
  If iIDPLANPREVCTBPATR <> -1 Then sParam := sParam + '   AND PCP.IDPLANPREVCTBPATR = ' + IntToStr(iIDPLANPREVCTBPATR) + #13;

  sSql :=
    'SELECT ' + #13 +
    '    PES.NOME AS NOMEPATRO, ' + #13 +
    '    PLP.NOME AS NOMEPLANO, ' + #13 +
    '    PCP.IDPLANPREVCTBPATR, ' + #13 +
    '    PCP.IDPATRO,           ' + #13 +
    '    PCP.IDPLANOPREV        ' + #13 +
    'FROM                       ' + #13 +
    '    PESSOA PES,            ' + #13 +
    '    PLANPREVCONTABIL PLP,  ' + #13 +
    '    PLANPREVCONTABPATRO PCP ' + #13 +
    'WHERE ' + #13 +
    '    PLP.IDPLANOPREV = PCP.IDPLANOPREV ' + #13 +
    'AND PES.IDPESSOA    = PCP.IDPATRO     ' + #13 +
    'AND PLP.ATIVO = ''S''';

  If sParam <> '' Then sSQL := sSQL + sParam;

  Result := GetDataPacket(sSql);
End;

// Paulo Nobre - SIG 47588 - Fim

End.

