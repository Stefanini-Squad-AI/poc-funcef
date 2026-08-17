//***************************************************************************************
//Rotina                : _Gerar_DARF_Geral, RetornaIdLinhasSelecionadas,
//                        GetRateioLinhasIRRFFolhaBenef
//N. SIG                : 79711
//Data da Alteração:    : 14/12/2018
//Responsável:          : Cássio Florencio Rovaroto
//Descrição             : Alteração na formato de geração do arquivo DARF para natureza de
//                        rendimento não judiciais.
//***************************************************************************************
//Rotina                : _GerarDARF
//N. SIG                : 70172
//Data da Alteração:    : 15/06/2018
//Responsável:          : Taffarel Sevaybriker
//Descrição             : Ajuste no agrupamento da query de geração do rateio.
//*******************************************************************************
//Rotina                : _GerarDARF, _GravaCAP
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
//Descrição             : Inclusao do campo FLGTIPOINCLUSAO nas funções de carga dos CDS 
//*******************************************************************************
//Rotina                : Geral
//N. SIG                : 34742
//Data da Alteração:    : 17/01/2017
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição             : Foi feita uma nova versão baseado na funcionalidade anterior, onde a principal
//                        alteração será a substituição das tabelas LANCIRRF pela nova tabela IRRFFOLHABENEF
//----------------------------------------------------------------------------------------------------

// Flag - FLGTIPOGERADARF (Gerar Documentos por Plano Contábil)
// 1 - Não
// 2 - Sim

// Flag - FLGDOCDARFIRJUD (Gera Documento para DARFs de Dep. Judicial):
// 0 - Documentos Individuais
// 1 - Documento Único
// 2 - Documento por Estado/UF

Unit uCtrlGeraDARF_Novo;

Interface

Uses
  Classes, sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
  uCtrlDARF, uCtrUtilLancIRRF, uCtrlParamIntegra, uString, uCtrlDocumento, uCtrlPadroes, Forms,
  {$IFNDEF VERSAO0505}uCMTypes{$ENDIF}, FProgresso, uFuncoesUteisIR, fAguarde, uCMClientDataSet, dBaseDados;

Type
  TCtrlGeraDARF_Novo = Class(TCmControlObject)

  Private
    CdsAux1: TCMClientDataSet;
    CdsAux2: TCMClientDataSet;
    cdsMovSelDARF: TCMClientDataSet;
    cdsCCBaixasxDocum: TCMClientDataSet;
    cdsBuscaFornServ: TCMClientDataSet;
    cdsRateio: TCMClientDataSet;
    cdsParamIRRF: TCMClientDataSet;
    cdsCodRendGer: TCMClientDataSet;
    cdsNatureza: TCMClientDataSet;
    cdsDepJudicial: TCMClientDataSet;
    cdsParamGlobal: TCMClientDataSet;
    cdsLanc, cdsDoc, cdsRat: TCMClientDataSet;
    //
    CtrlDarf: TCtrlDARF;
    CtrlDocumento: TCtrlDocumento;
    //
    sqlText: TStringList;
    sPathArquivo: String;
    iCountLin: integer;
    iCountAtu: integer;
  Protected

    Procedure DoChangeDataBase; Override;
    Procedure AfterInitialize; Override;

  Public

    iPlanoPrev, iPatro, iPrograma: LongInt;
    sCodCentroCusto: String;
    sCodNatureza: String;
    sUnidNegoc: String;
    sContaContabRecDes: String;
    sCodtipRecdes: String;

    Constructor Create; Override;
    Destructor Destroy; Override;

    Procedure _AtualizaFrmProgresso(Var iContador: integer);

    Function _OraNumero(rNumero: Double): String;
    Function _SelMovDARF(IdPessoa: LongInt; DataFim, DataIni, CodNatureza, sSit: String): OleVariant;
    Function _ListCCBaixasxDocum(piCodDocumento: Integer): OleVariant;
    Function _ListaNatuRendimento: OleVariant;
    Function _SelDARF(pidDARF: Integer): OleVariant;

    Function _GerarDARF(IdPessoa,
      IdModulo,
      IdUsuario,
      IdEspAcesso: LongInt;
      cdsMovSelDARF: TCMClientDataSet;
      DataIni,
      DataFim,
      DataVenc,
      Obs,
      referencia,
      psCentroRespon,
      sValorTotalBase,
      sValorTotalIRRF: String;
      UsaPlanoPatro: Boolean;
      Var pCodDocumento: Double): Boolean;

    Function _GravarDARF(
      IdPessoa,
      iCodDarf: Integer;
      sDataIni,
      sDataFim,
      sDataVenc,
      sNatureza: String;
      dVlrTotalBase,
      dVlrTotalIRRF: Double): Boolean;

    Function _GravaCAP(IdPessoa,
      IdModulo,
      iCodDarf,
      IdUsuario,
      IdEspAcesso: LongInt;
      sCodNatureza,
      DataIni,
      DataFim,
      DataVenc,
      Obs,
      referencia,
      spContaContabRecdes,
      spCodTipRecdes: String;
      rValorDarf: Real;
      UsaPlanoPatro: Boolean;
      piDocIndividual,
      piIdBenefIRRF: Integer): Boolean;
    //Cássio Rovaroto - SIG nº 79711 - Início
    function _Gerar_DARF_Geral(IdPessoa,
      IdModulo,
      IdUsuario,
      IdEspAcesso: LongInt;
      cdsMovSelDARF: TCMClientDataSet;
      DataIni,
      DataFim,
      DataVenc,
      Obs,
      referencia,
      psCentroRespon,
      sValorTotalBase,
      sValorTotalIRRF: String;
      UsaPlanoPatro: Boolean;
      var pCodDocumento: Double): Boolean;

    function RetornaIdLinhasSelecionadas(cdsMovSelDARF: TCMClientDataSet): String;
    function GetRateioLinhasIRRFFolhaBenef(pWhere, pCodNatureza, pDataIniApu, pDataFimApu: String): OleVariant;
    //Cássio Rovaroto - SIG nº 79711 - Fim
  End;

Implementation
{ TCtrlGeraDARF_Novo }

Procedure TCtrlGeraDARF_Novo.AfterInitialize;
Begin
  Inherited;
  CtrlDarf.InitializeAs(Self);
End;

Procedure TCtrlGeraDARF_Novo.DoChangeDataBase;
Begin
  Inherited;
End;

Constructor TCtrlGeraDARF_Novo.Create;
Begin
  Inherited;
  CdsAux1 := TCMClientDataSet.Create(Nil);
  CdsAux2 := TCMClientDataSet.Create(Nil);
  cdsMovSelDARF := TCMClientDataSet.Create(Nil);
  cdsCCBaixasxDocum := TCMClientDataSet.Create(Nil);
  cdsBuscaFornServ := TCMClientDataSet.Create(Nil);
  cdsRateio := TCMClientDataSet.Create(Nil);
  cdsParamIRRF := TCMClientDataSet.Create(Nil);
  cdsCodRendGer := TCMClientDataSet.Create(Nil);
  cdsNatureza := TCMClientDataSet.create(Nil);
  cdsLanc := TCMClientDataSet.create(Nil);
  cdsDoc := TCMClientDataSet.create(Nil);
  cdsRat := TCMClientDataSet.create(Nil);
  cdsDepJudicial := TCMClientDataSet.create(Nil);
  cdsParamGlobal := TCMClientDataSet.create(Nil);

  CtrlDarf := TCtrlDARF.Create;
  CtrlDocumento := TCtrlDocumento.Create;
  CtrlDocumento.InitializeAs(Padroes);

  sqlText := TStringList.create;
  sPathArquivo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\LogMovDARF';

  iCountAtu := 0;
  iCountLin := 0;
End;

Destructor TCtrlGeraDARF_Novo.Destroy;
Begin
  Inherited;
  FreeAndNil(cdsAux1);
  FreeAndNil(cdsAux2);
  freeandnil(cdsMovSelDARF);
  FreeAndNil(cdsCCBaixasxDocum);
  FreeAndNil(cdsBuscaFornServ);
  FreeAndNil(cdsDepJudicial);
  FreeAndNil(cdsParamGlobal);
  FreeAndNil(cdsRateio);
  FreeAndNil(cdsParamIRRF);
  FreeAndNil(cdsCodRendGer);
  FreeAndNil(cdsNatureza);
  FreeAndNil(cdsLanc);
  FreeAndNil(cdsDoc);
  FreeAndNil(cdsRat);
  FreeAndNil(CtrlDarf);
  FreeAndNil(CtrlDocumento);
  FreeAndNil(sqlText);
End;

Function TCtrlGeraDARF_Novo._OraNumero(rNumero: Double): String;
Var sNumero: String;
  AuxDec: char;
Begin
  AuxDec := DecimalSeparator;
  DecimalSeparator := '.';
  sNumero := FloatToStr(rNumero);
  Result := sNumero;
  DecimalSeparator := AuxDec;
End;

Procedure TCtrlGeraDARF_Novo._AtualizaFrmProgresso(Var iContador: Integer);
Begin
  frmProgresso.AndaFormProgresso(iContador);

{  if iCountAtu = 1000 then
  begin
    iCountAtu := 0;

    if dtmBaseDados.dbBaseDados.InTransaction then
    begin
      dtmBaseDados.dbBaseDados.Commit;
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;
    //frmProgresso.EscondeFormProgresso;
    //frmProgresso.MostraFormProgresso('Aguarde ! Gerando DARF da Natureza -> ' + sCodNatureza, False, False, False, iContador, iCountLin);
  end;}
End;

Function TCtrlGeraDARF_Novo._ListaNatuRendimento: OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT CODNATUREZA, DESCRICAO, (DESCRICAO || '' - ('' || CODNATUREZA || '')'') AS DESCRICAOCOMPL      ' +
    'FROM NATURENDIMENTO                                                ' +
    'WHERE FLGUSADONADCTF = ''S''                                       ' +
    '      AND GRUPOTRIBUTO IS NOT NULL                                ' +
    'ORDER BY CODNATUREZA                                        ';

  Result := GetDataPacket(sSql);
End;

Function TCtrlGeraDARF_Novo._SelMovDARF(IdPessoa: Integer; DataFim, DataIni, CodNatureza, sSit: String): OleVariant;
Var sSQL: String;
Begin
  sSQL := ' SELECT L.FLGDOCDARFIRJUD ' + #13#10 +
    ' FROM EMPRESAFORN E,' + #13#10 +
    '      PARAMIRRF L ' + #13#10 +
    ' WHERE (L.IDPESSOA = ' + IntToStr(IdPessoa) + ') ' + #13#10 +
    '   AND (E.IDPESSOA = L.IDPESSOA) ' + #13#10 +
    '   AND (E.IDFORCLI = L.IDFORCLI) ';

  cdsParamIRRF.Data := GetDataPacket(sSQL);

  If ((CodNatureza <> '7431') And (CodNatureza <> '7416')) Then
    Begin // NÃO É DEP. JUDICIAL
      sSQL := 'SELECT DECODE(I.FLGREGEXCLUIDO, ''N'',''S'', ''N'') AS FLGDARF, ' + #13#10 +
        '  I.IDLANCIRRFFOLHABENEF, ' + #13#10 +
        '  I.DATAPAGAMENTO AS DATALANCAMENTO,' + #13#10 +
        '  I.IDDARF,' + #13#10 +
        '  I.CODDOCUMENTO,' + #13#10 +
        '  I.IDPESSOA,' + #13#10 +
        '  I.CODNATUREZA,' + #13#10 +
        '  I.CODNATUREZA,' + #13#10 +
        '  I.NUMDOCUMENTO,' + #13#10 +
        '  I.CODTIPRECDES,' + #13#10 +
        '  I.PLACONTA AS PLACONTARECDES,' + #13#10 +
        '  I.VLRBASE,' + #13#10 +
        '  I.VLRIMPOSTO AS VLRIRRF,' + #13#10 +
        '  I.CODCENTROCUSTO,' + #13#10 +
        '  I.CODCENTRORESPON,' + #13#10 +
        '  I.PLANO,' + #13#10 +
        '  I.PLACONTA,' + #13#10 +
        '  I.IDPATRO,' + #13#10 +
        '  I.IDPLANOPREV,' + #13#10 +
        '  NVL(PP.IDPLANOPREVPREV, I.IDPLANOPREV) AS IDPLANOPREVPREV,' + #13#10 +
        '  I.IDPROGRAMA,' + #13#10 +
        '  I.IDMOTIVO, ' + #13#10 +
        '  I.IDHSTFOLHABENEF,  ' +
        '  I.FLGREGEXCLUIDO,' + #13#10 +
        '  I.FLGTIPOINCLUSAO,' + #13#10 +       // Paulo Nobre - SIG 47588
        '  ''18'' AS IDMODULO,' + #13#10 + // Folha de Beneficios
      '  P.RAZAOSOCIAL AS NOMEBENEFICIARIO,' + #13#10 +
        '  M.DESCRICAO AS DESCMOTIVO,' + #13#10 +
        '  PP.NOME AS NOMEPLANOPREV,' + #13#10 +
        '  PT.NOME AS NOMEPATRO,' + #13#10 +
        '  T.DESCRICAO AS TIPODESEMBOLSO ' + #13#10;
       //Cássio
      sSQL := sSQL + '  , I.IDDARF ' +#13#10;
       //Cássio - Fim

      sSQL := sSQL + 'FROM ' + #13#10 +
        '  IRRFFOLHABENEF I,' + #13#10 +
        '  MOTIVO M,' + #13#10 +
        '  PESSOA P,' + #13#10 +
        '  PLANPREVCONTABIL PP,' + #13#10 +
        '  PESSOA PT,' + #13#10 +
        '  TIPORECEBDESEMB T ' + #13#10;

      sSQL := sSQL + 'WHERE I.CODNATUREZA = ''' + CodNatureza + ''' ' + #13#10 +
        '       AND I.DATAPAGAMENTO BETWEEN TO_DATE(''' + DataIni + ''',''DD/MM/YYYY'') ' + #13#10 +
        '       AND TO_DATE(''' + DataFim + ''',''DD/MM/YYYY'')  ' + #13#10 +
        '       AND (I.IDMOTIVO = M.IDMOTIVO(+)) ' + #13#10 +
        '       AND (I.IDPESSOA = P.IDPESSOA(+)) ' + #13#10 +
        '       AND I.IDPLANOPREV  = PP.IDPLANOPREV(+) ' + #13#10 +
        '       AND I.IDPATRO      = PT.IDPESSOA(+)    ' + #13#10 +
        '       AND I.CODTIPRECDES = T.CODTIPRECDES(+) ' + #13#10 +
        '       AND T.RECPAG(+)    = ''P''             ' + #13#10 +
        '       AND (ROUND(I.VLRIMPOSTO,2) <> 0) ' + #13#10;

      If sSit = '0' Then
        sSQL := sSQL + '       AND I.IDDARF IS NULL ' + #13#10
      Else
        sSQL := sSQL + '       AND I.IDDARF IS NOT NULL ' + #13#10;

      sSQL := sSQL + 'ORDER BY I.FLGTIPOINCLUSAO DESC, I.IDDARF, I.IDHSTFOLHABENEF, P.RAZAOSOCIAL ';   // Paulo Nobre - SIG 47588
    End
  Else
    Begin // É DEP. JUDICIAL
      sSQL := 'SELECT DECODE(I.FLGREGEXCLUIDO, ''N'',''S'', ''N'') AS FLGDARF, ' + #13#10 +
        'I.IDLANCIRRFFOLHABENEF,' + #13#10 +
        'I.DATAPAGAMENTO AS DATALANCAMENTO,' + #13#10 +
        'I.IDDARF,' + #13#10 +
        'I.CODDOCUMENTO,' + #13#10 +
        'I.IDPESSOA,' + #13#10 +
        'I.CODNATUREZA,' + #13#10 +
        'I.NUMDOCUMENTO,' + #13#10 +
        'I.CODTIPRECDES,' + #13#10 +
        'I.PLACONTA AS PLACONTARECDES,' + #13#10 +
        'I.VLRBASE,' + #13#10 +
        'I.VLRIMPOSTO AS VLRIRRF,' + #13#10 +
        'I.CODCENTROCUSTO,' + #13#10 +
        'I.CODCENTRORESPON,' + #13#10 +
        'I.PLANO,' + #13#10 +
        'I.PLACONTA,' + #13#10 +
        'I.IDPATRO,' + #13#10 +
        'I.IDPLANOPREV,' + #13#10 +
        'I.IDMOTIVO,' + #13#10 +
        'I.IDHSTFOLHABENEF,' + #13#10 +
        'NVL(PP.IDPLANOPREVPREV, I.IDPLANOPREV) AS IDPLANOPREVPREV,' + #13#10 +
        'I.IDPROGRAMA,' + #13#10 +
        ' I.FLGREGEXCLUIDO,' + #13#10 +
        ' I.FLGTIPOINCLUSAO,' + #13#10 +       // Paulo Nobre - SIG 47588
        ' ''18'' AS IDMODULO,' + #13#10 + // Folha de Beneficios
      '  P.RAZAOSOCIAL AS NOMEBENEFICIARIO,' + #13#10 +
        '  M.DESCRICAO AS DESCMOTIVO,' + #13#10 +
        '  PP.NOME AS NOMEPLANOPREV,' + #13#10 +
        '  PT.NOME AS NOMEPATRO,' + #13#10 +
        'T.DESCRICAO AS TIPODESEMBOLSO' + #13#10;

      If cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger = 2 Then // Documento por Estado/UF
        sSQL := sSQL + ', NVL(PJ.UFSECAO, ''99'') AS UFSECAO ' + #13#10
      Else
        sSQL := sSQL + ', ''  '' As UFSECAO ' + #13#10;

      sSQL := sSQL + 'FROM ' + #13#10 +
        'IRRFFOLHABENEF I,' + #13#10 +
        'MOTIVO M,' + #13#10 +
        'PESSOA P,' + #13#10 +
        'PLANPREVCONTABIL PP,' + #13#10 +
        'PESSOA PT,' + #13#10 +
        'TIPORECEBDESEMB T ' + #13#10;

      If cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger = 2 Then // Documento por Estado/UF
        sSQL := sSQL + ' , PROCJUD PJ ' + #13#10;

      sSQL := sSQL + ' WHERE I.CODNATUREZA = ''' + CodNatureza + ''' ' + #13#10 +
        '  AND I.DATAPAGAMENTO BETWEEN TO_DATE(''' + DataIni + ''',''DD/MM/YYYY'') ' + #13#10 +
        '  AND TO_DATE(''' + DataFim + ''',''DD/MM/YYYY'') ' + #13#10 +
        '  AND I.CODTIPRECDES = T.CODTIPRECDES(+)  ' + #13#10 +
        '  AND (I.IDPESSOA = P.IDPESSOA) ' + #13#10 +
        '  AND (I.IDMOTIVO = M.IDMOTIVO(+)) ' + #13#10 +
        '  AND I.IDPLANOPREV  = PP.IDPLANOPREV(+) ' + #13#10 +
        '  AND I.IDPATRO      = PT.IDPESSOA(+)    ' + #13#10 +
        '  AND (ROUND(I.VLRIMPOSTO,2) <> 0) ' + #13#10 +
        '  AND T.RECPAG(+) = ''P''  ' + #13#10;

      If cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger = 2 Then // Documento por Estado/UF
        sSQL := sSQL + ' AND ( PJ.IDPROCJUD = I.IDPROCJUD )' + #13#10;

      If sSit = '0' Then
        sSQL := sSQL + '       AND I.IDDARF IS NULL ' + #13#10
      Else
        sSQL := sSQL + '       AND I.IDDARF IS NOT NULL ' + #13#10;

      sSQL := sSQL + 'ORDER BY I.FLGTIPOINCLUSAO DESC, I.IDDARF, I.IDHSTFOLHABENEF, P.RAZAOSOCIAL ';   // Paulo Nobre - SIG 47588
    End;

//  sqlText.Clear;
//  sqlText.add(sSql);
//  sqlText.SaveToFile(sPathArquivo + '\SQL_SelMovGravadoDARF.txt');

  Result := GetDataPacket(sSQL);
End;

Function TCtrlGeraDARF_Novo._GerarDARF(
  IdPessoa,
  IdModulo,
  IdUsuario,
  IdEspAcesso: Integer;
  cdsMovSelDARF: TCMClientDataSet;
  DataIni,
  DataFim,
  DataVenc,
  Obs,
  referencia,
  psCentroRespon,
  sValorTotalBase,
  sValorTotalIRRF: String;
  UsaPlanoPatro: Boolean;
  Var pCodDocumento: Double): Boolean;
Var
  sSQL: String;
  bDepJudicial, bGravaDARFSomenteUmaVez: Boolean;
  rvaltmp2, dVlrTotalBase, dVlrTotalIRRF: Double;
  sSQLTmp: String;
  sUltIdBenefIrrf: String;
  sGuardaUFSecao: String;
  sCRGravacao: String;
  iIdPlanoPrev: Integer;
  iContador: Integer;
  iIdDARF: LongInt;
Begin
  Result := True;

  iIdDARF := 0;
  iPatro := 0;
  iPrograma := 0;
  iPlanoPrev := 0;
  sUltIdBenefIrrf := '';
  sCodNatureza := '';
  sCodtipRecdes := '';
  sContaContabRecDes := '';
  bDepJudicial := False;

  bGravaDARFSomenteUmaVez := True;
  dVlrTotalBase := StringToFloat(sValorTotalBase);
  dVlrTotalIRRF := StringToFloat(sValorTotalIRRF);

  Try
    cdsDepJudicial.Data := GetDataPacket('SELECT 0 AS IDDARF, ''RJ'' AS UFSECAO FROM DARF WHERE IDDARF = -1 ');
    cdsParamGlobal.Data := GetDataPacket('SELECT * FROM PARAMGLOBAL WHERE IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
    cdsRateio.Data := CtrlDarf.ProcurarRateio(-1);
    cdsCCBaixasxDocum.Data := _ListCCBaixasxDocum(-1);

    sSQL :=
      'SELECT ' + #13 +
      '  L.IDFORCLI, L.CODTIPRECDES, ' + #13 +
      '  E.PLANO, E.CODSUBCONTA, E.CODCENTROCUSTO, E.CONTACFORN, ' + #13 +
      '  L.CODTIPDOC, L.CODCENTRORESPON, L.UNIDNEGOC, ' + #13 +
      '  L.FLGDOCDARFIRJUD, ' + #13 +
      '  L.FLGTIPOGERADARF ' + #13 +
      'FROM ' + #13 +
      '  EMPRESAFORN E, ' + #13 +
      '  PARAMIRRF   L  ' + #13 +
      'WHERE L.IDPESSOA = ' + IntToStr(IdPessoa) + #13 +
      '      AND E.IDPESSOA = L.IDPESSOA ' + #13 +
      '      AND E.IDFORCLI = L.IDFORCLI ';

    cdsParamIRRF.Data := GetDataPacket(sSQL);

    // -------------------------------------------------------------------------------------------
    If cdsParamIRRF.FieldByName('UNIDNEGOC').AsString <> '' Then
      sUnidNegoc := cdsParamIRRF.FieldByName('UNIDNEGOC').AsString
    Else
      If cdsParamGlobal.FieldByName('UNIDNEGOC').AsString <> '' Then
        sUnidNegoc := cdsParamGlobal.FieldByName('UNIDNEGOC').AsString
      Else
        sUnidNegoc := '-1';
    // -------------------------------------------------------------------------------------------

    iIdPlanoPrev := -1;
    If cdsParamIRRF.FieldByName('FLGTIPOGERADARF').AsString = '2' Then // 2 = SIM - Gerar Documentos por Plano Contábil ?
      Begin
        cdsMovSelDARF.IndexFieldNames := 'IDPLANOPREVPREV';
        cdsMovSelDARF.First;
        iIdPlanoPrev := cdsMovSelDARF.FieldByName('IDPLANOPREVPREV').AsInteger;
      End;

    // -------------------------------------------------------------------------------------------

    cdsMovSelDARF.First;
    iCountLin := cdsMovSelDARF.RecordCount;
    iContador := 0;
    frmProgresso.MostraFormProgresso('Aguarde ! Gerando DARF da Natureza -> ' + cdsMovSelDARF.FieldByName('CODNATUREZA').AsString, True, False, True, 0, cdsMovSelDARF.RecordCount);
    //Application.ProcessMessages;
   //frmAguarde.pbAguarde.Visible := false;
   //frmAguarde.Mostra('Aguarde ! Gerando DARF da Natureza -> ' + cdsMovSelDARF.FieldByName('CODNATUREZA').AsString + '... ');

    While Not cdsMovSelDARF.EOF Do
      Begin
        sCRGravacao := cdsMovSelDARF.FieldByName('CODCENTRORESPON').AsString;
        If psCentroRespon <> '' Then
          sCRGravacao := psCentroRespon;

        // Todas as Natureza menos as de deposito judicial
        If ((cdsMovSelDARF.FieldByName('CODNATUREZA').AsString <> '7431') And
          (cdsMovSelDARF.FieldByName('CODNATUREZA').AsString <> '7416')) Then
          Begin
            // Gravar o DARF somente uma vez dentro do loop
            If bGravaDARFSomenteUmaVez Then
              Begin
                sCodNatureza := cdsMovSelDARF.FieldByName('CODNATUREZA').AsString;
                iPatro := cdsMovSelDARF.FieldByName('IDPATRO').AsInteger;
                iPlanoPrev := cdsMovSelDARF.FieldByName('IDPLANOPREV').AsInteger;
                iPrograma := cdsMovSelDARF.FieldByName('IDPROGRAMA').AsInteger;
                sContaContabRecdes := cdsMovSelDARF.FieldByName('PLACONTARECDES').AsString;
                sCodTipRecdes := cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString;

                // Pegando o número do DARF
                iIdDARF := getSequence('DARF');

                // Atualizando a Tabela DARF
                If Not _GravarDARF(
                  IdPessoa,
                  iIdDARF,
                  DataIni,
                  DataFim,
                  DataVenc,
                  sCodNatureza,
                  dVlrTotalBase,
                  dVlrTotalIRRF) Then
                  Begin
                    Result := False;
                    frmProgresso.EscondeFormProgresso;
                    Exit;
                  End;

                bGravaDARFSomenteUmaVez := False;
              End;

            // Atualizando a Tabela IRRFFOLHABENEF com o DARF gerado
            //With CdsAux2 Do
            //  Begin
            //    sSql := 'UPDATE IRRFFOLHABENEF SET IDDARF = ' + IntToStr(iIdDARF) + ' WHERE IDLANCIRRFFOLHABENEF = ' + cdsMovSelDARF.FieldByName('IDLANCIRRFFOLHABENEF').AsString;
            //    ExecSQL(Ssql);
            //    Inc(iCountAtu);
            //  End;

//            cdsMovSelDARF.Edit;
//            cdsMovSelDARF.FieldByName('IDDARF').asInteger := iIdDARF;
//            cdsMovSelDARF.Post;
            //
            // Gerando os Rateios
            //
            //Taffarel - SIG70172 - início
                  //If cdsRateio.Locate('IDPATRO;IDPLANOPREV;CODCENTROCUSTO;CODTIPRECDES;IDPROGRAMA',
                    //VarArrayOf([cdsMovSelDARF.FieldByName('IDPATRO').AsInteger,
                    //cdsMovSelDARF.FieldByName('IDPLANOPREV').AsInteger,
                      //cdsMovSelDARF.FieldByName('CODCENTROCUSTO').AsString,
                      //cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString,
                      //cdsMovSelDARF.FieldByName('IDPROGRAMA').AsInteger]), []) Then
            If cdsRateio.Locate('IDPATRO;IDPLANOPREV;CODTIPRECDES',
               VarArrayOf([cdsMovSelDARF.FieldByName('IDPATRO').AsString,
                           cdsMovSelDARF.FieldByName('IDPLANOPREV').AsString,
                           Trim(cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString)]), [loCaseInsensitive]) Then
            //Taffarel - SIG70172 - fim
              Begin
                cdsRateio.Edit;
                cdsRateio.FieldByName('VALOR').AsFloat := cdsRateio.FieldByName('VALOR').AsFloat + cdsMovSelDARF.FieldByName('VLRIRRF').AsFloat;
                cdsRateio.Post;
              End
            Else
              Begin
                cdsRateio.Insert;
                cdsRateio.FieldByName('VALOR').AsFloat := cdsMovSelDARF.FieldByName('VLRIRRF').AsFloat;
                cdsRateio.FieldByName('IDPATRO').AsFloat := cdsMovSelDARF.FieldByName('IDPATRO').AsFloat;
                cdsRateio.FieldByName('IDPLANOPREV').AsFloat := cdsMovSelDARF.FieldByName('IDPLANOPREV').AsFloat;
                cdsRateio.FieldByName('CODCENTROCUSTO').AsString := cdsMovSelDARF.FieldByName('CODCENTROCUSTO').AsString;
                cdsRateio.FieldByName('CODCENTRORESPON').AsString := sCRGravacao;
                cdsRateio.FieldByName('IDPROGRAMA').AsFloat := cdsMovSelDARF.FieldByName('IDPROGRAMA').AsFloat;
                cdsRateio.Fieldbyname('CODTIPRECDES').asstring := Trim(cdsMovSelDARF.fieldbyname('CODTIPRECDES').asstring);   //edilaine - SIG70172
                cdsRateio.FieldByName('PLANO').AsInteger := cdsMovSelDARF.FieldByName('PLANO').AsInteger;      //edilaine - SIG61511
                cdsRateio.Post;
              End;
          End
        Else // DEPÓSITO JUDICIAL. OS DARFS DEVEM SER GERADOS INDIVIDUALMENTE POR BENEFICIÁRIO
          Begin
            bDepJudicial := true;

            If sUltIdBenefIrrf <> cdsMovSelDARF.FieldByName('IDPESSOA').AsString Then
              iIdDARF := getSequence('DARF'); // Pegando o número do DARF

            // Atualizando a Tabela DARF
            If Not _GravarDARF(
              IdPessoa,
              iIdDARF,
              DataIni,
              DataFim,
              DataVenc,
              cdsMovSelDARF.FieldByName('CODNATUREZA').AsString,
              cdsMovSelDARF.FieldByName('VLRBASE').AsFloat,
              cdsMovSelDARF.FieldByName('VLRIRRF').AsFloat) Then
              Begin
                Result := False;
                frmProgresso.EscondeFormProgresso;
                Exit;
              End;

            // Atualizando a Tabela IRRFFOLHABENEF com o DARF gerado
            //With CdsAux2 Do
            //  Begin
            //    sSql := 'UPDATE IRRFFOLHABENEF SET IDDARF = ' + IntToStr(iIdDARF) + ' WHERE IDLANCIRRFFOLHABENEF = ' + cdsMovSelDARF.FieldByName('IDLANCIRRFFOLHABENEF').AsString;
            //    ExecSQL(Ssql);
            //  End;
            //

            // -----------------------------------------------------------------------------------
            Case cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger Of
              0: Begin // Documentos Individuais
                  rvaltmp2 := cdsMovSelDARF.FieldByName('VLRIRRF').AsFloat;
                  sUltIdBenefIrrf := cdsMovSelDARF.FieldByName('IDPESSOA').AsString;
                  sCodNatureza := cdsMovSelDARF.FieldByName('CODNATUREZA').AsString;
                  sContaContabrecdes := cdsMovSelDARF.FieldByName('PLACONTARECDES').AsString;
                  sCodtiprecdes := cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString;
                  sCodCentroCusto := cdsMovSelDARF.FieldByName('CODCENTROCUSTO').AsString;
                  iPatro := cdsMovSelDARF.FieldByName('IDPATRO').AsInteger;
                  iPlanoPrev := cdsMovSelDARF.FieldByName('IDPLANOPREV').AsInteger;
                  iPrograma := cdsMovSelDARF.FieldByName('IDPROGRAMA').AsInteger;

                  //
                  // Gerando os Rateios
                  //
                  //Taffarel - SIG70172 - início
                  //If cdsRateio.Locate('IDPATRO;IDPLANOPREV;CODCENTROCUSTO;CODTIPRECDES;IDPROGRAMA',
                    //VarArrayOf([cdsMovSelDARF.FieldByName('IDPATRO').AsInteger,
                    //cdsMovSelDARF.FieldByName('IDPLANOPREV').AsInteger,
                      //cdsMovSelDARF.FieldByName('CODCENTROCUSTO').AsString,
                      //cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString,
                      //cdsMovSelDARF.FieldByName('IDPROGRAMA').AsInteger]), []) Then
                    If cdsRateio.Locate('IDPATRO;IDPLANOPREV;CODTIPRECDES',
                          VarArrayOf([cdsMovSelDARF.FieldByName('IDPATRO').AsString,
                                      cdsMovSelDARF.FieldByName('IDPLANOPREV').AsString,
                                      Trim(cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString)]), [loCaseInsensitive]) Then
                   //Taffarel - SIG79172 - fim
                    Begin
                      cdsRateio.Edit;
                      cdsRateio.FieldByName('VALOR').AsFloat := cdsRateio.FieldByName('VALOR').AsFloat + cdsMovSelDARF.FieldByName('VLRIRRF').AsFloat;
                      cdsRateio.Post;
                    End
                  Else
                    Begin
                      cdsRateio.Insert;
                      cdsRateio.FieldByName('VALOR').AsFloat := cdsMovSelDARF.FieldByName('VLRIRRF').AsFloat;
                      cdsRateio.FieldByName('IDPATRO').AsFloat := cdsMovSelDARF.FieldByName('IDPATRO').AsFloat;
                      cdsRateio.FieldByName('IDPLANOPREV').AsFloat := cdsMovSelDARF.FieldByName('IDPLANOPREV').AsFloat;
                      cdsRateio.FieldByName('CODCENTROCUSTO').AsString := cdsMovSelDARF.FieldByName('CODCENTROCUSTO').AsString;
                      cdsRateio.FieldByName('CODCENTRORESPON').AsString := sCRGravacao;
                      cdsRateio.FieldByName('IDPROGRAMA').AsFloat := cdsMovSelDARF.FieldByName('IDPROGRAMA').AsFloat;
                      cdsRateio.Fieldbyname('CODTIPRECDES').asstring := Trim(cdsMovSelDARF.fieldbyname('CODTIPRECDES').asstring);   //edilaine - SIG79172
                      cdsRateio.FieldByName('PLANO').AsInteger := cdsMovSelDARF.FieldByName('PLANO').AsInteger;      //edilaine - SIG61511
                      cdsRateio.Post;
                    End;
                End;

              1: Begin // Documento Único
                  cdsDepJudicial.Insert;
                  cdsDepJudicial.FieldByName('IDDARF').AsInteger := iIdDARF;
                  cdsDepJudicial.Post;
                  sUltIdBenefIrrf := cdsMovSelDARF.FieldByName('IDPESSOA').AsString;
                  sCodtiprecdes := cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString;
                End;

              2: Begin // Documento por Estado/UF
                  cdsDepJudicial.Insert;
                  cdsDepJudicial.FieldByName('IDDARF').AsInteger := iIdDARF;
                  cdsDepJudicial.FieldByName('UFSECAO').AsString := cdsMovSelDARF.FieldByName('UFSECAO').AsString;
                  cdsDepJudicial.Post;

                  sUltIdBenefIrrf := cdsMovSelDARF.FieldByName('IDPESSOA').AsString;
                  sCodtiprecdes := cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString;
                End;
            End;
            // -----------------------------------------------------------------------------------

          End;

        //
        // Insere no cdsCCBaixasxDocum, para testar Múltiplas Contas de Baixa
        //
        If ((cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger = 1) And // Documento Único
          ((cdsMovSelDARF.FieldByName('CODNATUREZA').AsString = '7416') Or
          (cdsMovSelDARF.FieldByName('CODNATUREZA').AsString = '7431'))) Or
          ((cdsMovSelDARF.FieldByName('CODNATUREZA').AsString <> '7416') And
          (cdsMovSelDARF.FieldByName('CODNATUREZA').AsString <> '7431')) Then
          Begin
            If cdsMovSelDARF.FieldByName('PLACONTARECDES').AsString <> '' Then
              Begin
                If cdsCCBaixasxDocum.Locate('IDPATRO;IDPLANOPREV;PLACONTA',
                  VarArrayOf([cdsMovSelDARF.FieldByName('IDPATRO').AsInteger,
                  cdsMovSelDARF.FieldByName('IDPLANOPREV').AsInteger,
                    cdsMovSelDARF.FieldByName('PLACONTARECDES').AsString]), []) Then
                  Begin
                    cdsCCBaixasxDocum.Edit;
                    cdsCCBaixasxDocum.FieldByName('VALOR').AsFloat := cdsCCBaixasxDocum.FieldByName('VALOR').AsFloat + cdsMovSelDARF.FieldByName('VLRIRRF').AsFloat;
                    cdsCCBaixasxDocum.Post;
                  End
                Else
                  Begin
                    If (cdsCCBaixasxDocum.FieldByName('IDPLANOPREV').AsInteger <> cdsMovSelDARF.FieldByName('IDPLANOPREV').AsInteger) Or
                      (cdsCCBaixasxDocum.FieldByName('IDPATRO').AsInteger <> cdsMovSelDARF.FieldByName('IDPATRO').AsInteger) Or
                      (cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString <> cdsMovSelDARF.FieldByName('PLACONTARECDES').AsString) Then
                      Begin
                        cdsCCBaixasxDocum.Insert;
                        cdsCCBaixasxDocum.FieldByName('IDPLANOPREV').AsInteger := cdsMovSelDARF.FieldByName('IDPLANOPREV').AsInteger;
                        cdsCCBaixasxDocum.FieldByName('IDPATRO').AsInteger := cdsMovSelDARF.FieldByName('IDPATRO').AsInteger;
                        cdsCCBaixasxDocum.FieldByName('IDPESSOA').AsInteger := cdsMovSelDARF.FieldByName('IDPESSOA').AsInteger;
                        cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString := cdsMovSelDARF.FieldByName('PLACONTARECDES').AsString;
                        cdsCCBaixasxDocum.FieldByName('UNIDNEGOC').AsString := sUnidNegoc;
                        cdsCCBaixasxDocum.FieldByName('PLANO').AsInteger := cdsMovSelDARF.FieldByName('PLANO').AsInteger;
                        cdsCCBaixasxDocum.FieldByName('VALOR').AsFloat := cdsMovSelDARF.FieldByName('VLRIRRF').AsFloat;
                        cdsCCBaixasxDocum.Post;
                      End;
                  End;
              End;
          End;

        cdsMovSelDARF.Next;
        Inc(iContador);
        _AtualizaFrmProgresso(iContador);

        If ((cdsMovSelDARF.FieldByName('CODNATUREZA').AsString <> '7416') And
          (cdsMovSelDARF.FieldByName('CODNATUREZA').AsString <> '7431')) And
          (cdsParamIRRF.FieldByName('FLGTIPOGERADARF').AsString = '2') Then // SIM - Gerar Documentos por Plano Contábil
          Begin
            If (iIdDARF <> 0) And
              ((iIdPlanoPrev <> cdsMovSelDARF.FieldByName('IDPLANOPREVPREV').AsInteger) Or
              (cdsMovSelDARF.EOF)) Then
              Begin
                If Not _GravaCAP(IdPessoa,
                  IdModulo,
                  iIdDARF,
                  IdUsuario,
                  IdEspAcesso,
                  sCodNatureza,
                  DataIni,
                  DataFim,
                  DataVenc,
                  Obs,
                  referencia,
                  sContaContabRecdes,
                  sCodtiprecdes,
                  dVlrTotalIRRF,
                  UsaPlanoPatro,
                  1,
                  0) Then
                  Begin
                    Result := False;
                    frmProgresso.EscondeFormProgresso;
                    Exit;
                  End;

                cdsRateio.Data := CtrlDarf.ProcurarRateio(-1);
                cdsCCBaixasxDocum.Data := _ListCCBaixasxDocum(-1);

                iIdPlanoPrev := cdsMovSelDARF.FieldByName('IDPLANOPREVPREV').AsInteger;

                sSQLTmp := 'UPDATE DARF SET CODDOCUMENTO = ' + FloatToStr(CtrlDarf.CodDocumento);
                sSQLtmp := sSQLtmp + ' WHERE IDDARF = ' + IntToStr(iIdDARF);

                pCodDocumento := CtrlDarf.CodDocumento; // Variavel que será passada de volta ao form chamador

                iIdDARF := getSequence('DARF');

                If Not ExecSQL(sSQLtmp) Then
                  Begin
                    Result := False;
                    frmProgresso.EscondeFormProgresso;
                    Exit;
                  End;
              End;
          End;

          

        // Natureza de Depositos Judiciais
        If ((cdsMovSelDARF.FieldByName('CODNATUREZA').AsString = '7416') Or
          (cdsMovSelDARF.FieldByName('CODNATUREZA').AsString = '7431')) Then
          Begin
            If cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger = 0 Then // Documentos Individuais
              Begin
                If (iIdDARF <> 0) And
                  ((sUltIdBenefIrrf <> cdsMovSelDARF.FieldByName('IDPESSOA').AsString) Or
                  (cdsMovSelDARF.EOF)) Then
                  Begin
                    If Not _GravaCAP(IdPessoa,
                      IdModulo,
                      iIdDARF,
                      IdUsuario,
                      IdEspAcesso,
                      sCodNatureza,
                      DataIni,
                      DataFim,
                      DataVenc,
                      Obs,
                      referencia,
                      sContaContabRecdes,
                      sCodtiprecdes,
                      dVlrTotalIRRF,
                      UsaPlanoPatro,
                      0,
                      StrToInt(sUltIdBenefIrrf)) Then
                      Begin
                        Result := False;
                        frmProgresso.EscondeFormProgresso;
                        Exit;
                      End;

                    cdsRateio.Data := CtrlDarf.ProcurarRateio(-1);
                    cdsCCBaixasxDocum.Data := _ListCCBaixasxDocum(-1);

                    sSQLTmp := 'UPDATE DARF SET CODDOCUMENTO = ' + FloatToStr(CtrlDarf.CodDocumento);
                    sSQLtmp := sSQLtmp + ' WHERE IDDARF = ' + IntToStr(iIdDARF);

                    pCodDocumento := CtrlDarf.CodDocumento; // Variavel que será passada de volta ao form chamador

                    If Not ExecSQL(sSQLtmp) Then
                      Begin
                        Result := False;
                        frmProgresso.EscondeFormProgresso;
                        Exit;
                      End;
                  End;
              End;
          End;
      End;

    // -------------------------------------------------------------------------------------------

    If bDepJudicial Then
      Begin
        Case cdsParamIRRF.FieldByName('FLGDOCDARFIRJUD').AsInteger Of
          1: Begin // Documento Único
              sCodNatureza := '$';
              sContaContabrecdes := '$';
              sCodTipRecdes := '$';
              iPlanoPrev := -100;
              sCodCentroCusto := '$';
              iPatro := -100;
              iPrograma := -100;
              rValtmp2 := 0;

              cdsRateio.Data := CtrlDarf.ProcurarRateio(-1);

              cdsMovSelDARF.First;
              While Not (cdsMovSelDARF.EOF) Do
                Begin
                  rvaltmp2 := cdsMovSelDARF.FieldByName('VLRIRRF').AsFloat;
                  sCodNatureza := cdsMovSelDARF.FieldByName('CODNATUREZA').AsString;
                  sContaContabrecdes := cdsMovSelDARF.FieldByName('PLACONTARECDES').AsString;
                  sCodtiprecdes := cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString;
                  sCodCentroCusto := cdsMovSelDARF.FieldByName('CODCENTROCUSTO').AsString;
                  iPatro := cdsMovSelDARF.FieldByName('IDPATRO').AsInteger;
                  iPlanoPrev := cdsMovSelDARF.FieldByName('IDPLANOPREV').AsInteger;
                  iPrograma := cdsMovSelDARF.FieldByName('IDPROGRAMA').AsInteger;

                  //
                  // Gerando os Rateios
                  //
                  //Taffarel - SIG70172 - início
                  //If cdsRateio.Locate('IDPATRO;IDPLANOPREV;CODCENTROCUSTO;CODTIPRECDES;IDPROGRAMA',
                    //VarArrayOf([cdsMovSelDARF.FieldByName('IDPATRO').AsInteger,
                    //cdsMovSelDARF.FieldByName('IDPLANOPREV').AsInteger,
                      //cdsMovSelDARF.FieldByName('CODCENTROCUSTO').AsString,
                      //cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString,
                      //cdsMovSelDARF.FieldByName('IDPROGRAMA').AsInteger]), []) Then
                    If cdsRateio.Locate('IDPATRO;IDPLANOPREV;CODTIPRECDES',
                         VarArrayOf([cdsMovSelDARF.FieldByName('IDPATRO').AsString,
                                     cdsMovSelDARF.FieldByName('IDPLANOPREV').AsString,
                                     Trim(cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString)]), []) Then
                   //Taffarel - SIG70712 - fim
                    Begin
                      cdsRateio.Edit;
                      cdsRateio.FieldByName('VALOR').AsFloat := cdsRateio.FieldByName('VALOR').AsFloat + rvaltmp2;
                      cdsRateio.Post;
                    End
                  Else
                    Begin
                      cdsRateio.Insert;
                      cdsRateio.FieldByName('VALOR').AsFloat := rvaltmp2;
                      cdsRateio.FieldByName('IDPATRO').AsFloat := cdsMovSelDARF.FieldByName('IDPATRO').AsFloat;
                      cdsRateio.FieldByName('IDPLANOPREV').AsFloat := cdsMovSelDARF.FieldByName('IDPLANOPREV').AsFloat;
                      cdsRateio.FieldByName('CODCENTROCUSTO').AsString := cdsMovSelDARF.FieldByName('CODCENTROCUSTO').AsString;
                      cdsRateio.FieldByName('CODCENTRORESPON').AsString := sCRGravacao;
                      cdsRateio.FieldByName('IDPROGRAMA').AsFloat := cdsMovSelDARF.FieldByName('IDPROGRAMA').AsFloat;
                      cdsRateio.fieldbyname('CODTIPRECDES').asstring := Trim(cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString);   //edilaine - SIG70712
                      cdsRateio.FieldByName('PLANO').AsInteger := cdsMovSelDARF.FieldByName('PLANO').AsInteger;      //edilaine - SIG61511
                      cdsRateio.Post;
                    End;

                  cdsMovSelDARF.Next;
                End;

              If Not cdsParamIrrf.IsEmpty Then
                Begin
                  If Not _GravaCAP(IdPessoa,
                    IdModulo,
                    iIdDARF,
                    IdUsuario,
                    IdEspAcesso,
                    sCodNatureza,
                    DataIni,
                    DataFim,
                    DataVenc,
                    Obs,
                    referencia,
                    sContaContabRecdes,
                    sCodtiprecdes,
                    dVlrTotalIRRF,
                    UsaPlanoPatro,
                    1,
                    0) Then
                    Begin
                      Result := False;
                      frmProgresso.EscondeFormProgresso;
                      Exit;
                    End;
                End;

              cdsDepJudicial.First;
              While Not cdsDepJudicial.EOF Do
                Begin
                  sSQLTmp := 'UPDATE DARF SET CODDOCUMENTO = ' + FloatToStr(CtrlDarf.CodDocumento);
                  sSQLtmp := sSQLtmp + ' WHERE IDDARF = ' + cdsDepJudicial.FieldByName('IDDARF').AsString;

                  pCodDocumento := CtrlDarf.CodDocumento; // Variavel que será passada de volta ao form chamador

                  If Not ExecSQL(sSQLtmp) Then
                    Begin
                      Result := False;
                      frmProgresso.EscondeFormProgresso;
                      Exit;
                    End;

                  cdsDepJudicial.Next;
                End;

              If pCodDocumento <> 0 Then
                Begin
                  // Atualizando a Tabela IRRFFOLHABENEF com o CODDOCUMENTO gerado
                  cdsMovSelDARF.First;
                  While Not cdsMovSelDARF.EOF Do
                    Begin
                      sSQLTmp := 'UPDATE IRRFFOLHABENEF SET CODDOCUMENTO = ' + floattostr(pCodDocumento);
                      sSQLTmp := sSQLTmp + '      , IDDARF = ' + IntToStr(iIdDARF);
                      sSQLtmp := sSQLtmp + 'WHERE IDLANCIRRFFOLHABENEF = ' + cdsMovSelDARF.FieldByName('IDLANCIRRFFOLHABENEF').AsString;
                      ExecSQL(sSQLtmp);

                      cdsMovSelDARF.Next;
                    End;
                End;

            End;
          2: Begin // Documento por Estado/UF
              sCodNatureza := '$';
              sContaContabrecdes := '$';
              sCodTipRecdes := '$';
              iPlanoPrev := -100;
              sCodCentroCusto := '$';
              iPatro := -100;
              iPrograma := -100;
              rValtmp2 := 0;

              cdsRateio.Data := CtrlDarf.ProcurarRateio(-1);
              cdsCCBaixasxDocum.Data := _ListCCBaixasxDocum(-1);

              cdsMovSelDARF.IndexFieldNames := 'UFSECAO';
              cdsMovSelDARF.First;
              sGuardaUFSecao := cdsMovSelDARF.FieldByName('UFSECAO').AsString;

              While Not cdsMovSelDARF.EOF Do
                Begin
                  rvaltmp2 := cdsMovSelDARF.FieldByName('VLRIRRF').AsFloat;
                  sCodNatureza := cdsMovSelDARF.FieldByName('CODNATUREZA').AsString;
                  sContaContabrecdes := cdsMovSelDARF.FieldByName('PLACONTARECDES').AsString;
                  sCodtiprecdes := cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString;
                  sCodCentroCusto := cdsMovSelDARF.FieldByName('CODCENTROCUSTO').AsString;
                  iPatro := cdsMovSelDARF.FieldByName('IDPATRO').AsInteger;
                  iPlanoPrev := cdsMovSelDARF.FieldByName('IDPLANOPREV').AsInteger;
                  iPrograma := cdsMovSelDARF.FieldByName('IDPROGRAMA').AsInteger;

                  //
                  // Gerando os Rateios
                  //
                  //Taffarel - SIG70172 - início
                  //If cdsRateio.Locate('IDPATRO;IDPLANOPREV;CODCENTROCUSTO;CODTIPRECDES;IDPROGRAMA',
                    //VarArrayOf([cdsMovSelDARF.FieldByName('IDPATRO').AsInteger,
                    //cdsMovSelDARF.FieldByName('IDPLANOPREV').AsInteger,
                      //cdsMovSelDARF.FieldByName('CODCENTROCUSTO').AsString,
                      //cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString,
                      //cdsMovSelDARF.FieldByName('IDPROGRAMA').AsInteger]), []) Then
                    If cdsRateio.Locate('IDPATRO;IDPLANOPREV;CODTIPRECDES',
                           VarArrayOf([cdsMovSelDARF.FieldByName('IDPATRO').AsString,
                                       cdsMovSelDARF.FieldByName('IDPLANOPREV').AsString,
                                       Trim(cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString)]), []) Then
                   //Taffarel - SIG70712 - fim
                    Begin
                      cdsRateio.Edit;
                      cdsRateio.FieldByName('VALOR').AsFloat := cdsRateio.FieldByName('VALOR').AsFloat + rvaltmp2;
                      cdsRateio.Post;
                    End
                  Else
                    Begin
                      cdsRateio.Insert;
                      cdsRateio.FieldByName('VALOR').AsFloat := rvaltmp2;
                      cdsRateio.FieldByName('IDPATRO').AsFloat := cdsMovSelDARF.FieldByName('IDPATRO').AsFloat;
                      cdsRateio.FieldByName('IDPLANOPREV').AsFloat := cdsMovSelDARF.FieldByName('IDPLANOPREV').AsFloat;
                      cdsRateio.FieldByName('CODCENTROCUSTO').AsString := cdsMovSelDARF.FieldByName('CODCENTROCUSTO').AsString;
                      cdsRateio.FieldByName('CODCENTRORESPON').AsString := sCRGravacao;
                      cdsRateio.FieldByName('IDPROGRAMA').AsFloat := cdsMovSelDARF.FieldByName('IDPROGRAMA').AsFloat;
                      cdsRateio.fieldbyname('CODTIPRECDES').asstring := Trim(cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString);     //edilaine - SIG70712
                      cdsRateio.FieldByName('PLANO').AsInteger := cdsMovSelDARF.FieldByName('PLANO').AsInteger;      //edilaine - SIG61511
                      cdsRateio.Post;
                    End;

                  //
                  // Insere no cdsCCBaixasxDocum, para testar Múltiplas Contas de Baixa
                  //
                  If cdsCCBaixasxDocum.Locate('IDPATRO;IDPLANOPREV;PLACONTA',
                    VarArrayOf([cdsMovSelDARF.FieldByName('IDPATRO').AsInteger,
                    cdsMovSelDARF.FieldByName('IDPLANOPREV').AsInteger,
                      cdsMovSelDARF.FieldByName('PLACONTARECDES').AsString]), []) Then
                    Begin
                      cdsCCBaixasxDocum.Edit;
                      cdsCCBaixasxDocum.FieldByName('VALOR').AsFloat := cdsCCBaixasxDocum.FieldByName('VALOR').AsFloat + cdsMovSelDARF.FieldByName('VLRIRRF').AsFloat;
                      cdsCCBaixasxDocum.Post;
                    End
                  Else
                    Begin
                      If (cdsCCBaixasxDocum.FieldByName('IDPLANOPREV').AsInteger <> cdsMovSelDARF.FieldByName('IDPLANOPREV').AsInteger) Or
                        (cdsCCBaixasxDocum.FieldByName('IDPATRO').AsInteger <> cdsMovSelDARF.FieldByName('IDPATRO').AsInteger) Or
                        (cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString <> cdsMovSelDARF.FieldByName('PLACONTARECDES').AsString) Then
                        Begin
                          cdsCCBaixasxDocum.Insert;
                          cdsCCBaixasxDocum.FieldByName('IDPLANOPREV').AsInteger := cdsMovSelDARF.FieldByName('IDPLANOPREV').AsInteger;
                          cdsCCBaixasxDocum.FieldByName('IDPATRO').AsInteger := cdsMovSelDARF.FieldByName('IDPATRO').AsInteger;
                          cdsCCBaixasxDocum.FieldByName('IDPESSOA').AsInteger := cdsMovSelDARF.FieldByName('IDPESSOA').AsInteger;
                          cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString := cdsMovSelDARF.FieldByName('PLACONTARECDES').AsString;
                          cdsCCBaixasxDocum.FieldByName('UNIDNEGOC').AsString := sUnidNegoc;
                          cdsCCBaixasxDocum.FieldByName('PLANO').AsInteger := cdsMovSelDARF.FieldByName('PLANO').AsInteger;
                          cdsCCBaixasxDocum.FieldByName('VALOR').AsFloat := cdsMovSelDARF.FieldByName('VLRIRRF').AsFloat;
                          cdsCCBaixasxDocum.Post;
                        End;
                    End;

                  cdsMovSelDARF.Next;

                  If (sGuardaUFSecao <> cdsMovSelDARF.FieldByName('UFSECAO').AsString) Or
                    (cdsMovSelDARF.EOF) Then
                    Begin
                      If Not cdsParamIrrf.IsEmpty Then
                        Begin
                          If cdsDepJudicial.Locate('UFSECAO', sGuardaUFSecao, []) Then
                            Begin
                              iIdDARF := cdsDepJudicial.FieldByName('IDDARF').AsInteger;

                              If Not _GravaCAP(IdPessoa,
                                IdModulo,
                                iIdDARF,
                                IdUsuario,
                                IdEspAcesso,
                                sCodNatureza,
                                DataIni,
                                DataFim,
                                DataVenc,
                                Obs,
                                referencia,
                                sContaContabRecdes,
                                sCodtiprecdes,
                                dVlrTotalIRRF,
                                UsaPlanoPatro,
                                1,
                                0) Then
                                Begin
                                  Result := False;
                                  frmProgresso.EscondeFormProgresso;
                                  Exit;
                                End;

                              cdsDepJudicial.First;

                              While Not cdsDepJudicial.EOF Do
                                Begin
                                  sSQLTmp := 'UPDATE DARF SET CODDOCUMENTO = ' + FloatToStr(CtrlDarf.CodDocumento);
                                  sSQLtmp := sSQLtmp + ' WHERE IDDARF = ' + cdsDepJudicial.FieldByName('IDDARF').AsString;

                                  pCodDocumento := CtrlDarf.CodDocumento; // Variavel que será passada de volta ao form chamador

                                  If cdsDepJudicial.FieldByName('UFSECAO').AsString = sGuardaUFSecao Then
                                    Begin
                                      If Not ExecSQL(sSQLtmp) Then
                                        Begin
                                          Result := False;
                                          frmProgresso.EscondeFormProgresso;
                                          Exit;
                                        End;
                                    End;

                                  cdsDepJudicial.Next;
                                End;

                              If pCodDocumento <> 0 Then
                                Begin
                                  // Atualizando a Tabela IRRFFOLHABENEF com o CODDOCUMENTO gerado
                                  cdsMovSelDARF.First;
                                  While Not cdsMovSelDARF.EOF Do
                                    Begin
                                      sSQLTmp := 'UPDATE IRRFFOLHABENEF SET CODDOCUMENTO = ' + floattostr(pCodDocumento);
                                      sSQLTmp := sSQLTmp + '      , IDDARF = ' + IntToStr(iIdDARF);
                                      sSQLtmp := sSQLtmp + 'WHERE IDLANCIRRFFOLHABENEF = ' + cdsMovSelDARF.FieldByName('IDLANCIRRFFOLHABENEF').AsString;
                                      ExecSQL(sSQLtmp);

                                      cdsMovSelDARF.Next;
                                    End;
                                End;
                            End;

                          cdsRateio.Data := CtrlDarf.ProcurarRateio(-1);
                          cdsCCBaixasxDocum.Data := _ListCCBaixasxDocum(-1);
                          sGuardaUFSecao := cdsMovSelDARF.FieldByName('UFSECAO').AsString
                        End;
                    End;
                End;
            End;
        End;
      End
    Else
      Begin
        // Para gravar o ultimo registro.
        If (Not cdsParamIrrf.IsEmpty) And (dVlrTotalIRRF <> 0) Then
          Begin
            If Not _GravaCAP(IdPessoa,
              IdModulo,
              iIdDARF,
              IdUsuario,
              IdEspAcesso,
              sCodNatureza,
              DataIni,
              DataFim,
              DataVenc,
              Obs,
              referencia,
              sContaContabRecDes,
              sCodtiprecdes,
              dVlrTotalIRRF,
              UsaPlanoPatro,
              1,
              0) Then
              Begin
                Result := False;
                Raise Exception.Create(messageinfo);
              End;

            pCodDocumento := CtrlDarf.CodDocumento; // Variavel que será passada de volta ao form chamador

            If pCodDocumento <> 0 Then
              Begin
                // Atualizando a Tabela IRRFFOLHABENEF com o CODDOCUMENTO gerado
                cdsMovSelDARF.First;
                While Not cdsMovSelDARF.EOF Do
                  Begin
                    sSQLTmp := 'UPDATE IRRFFOLHABENEF SET CODDOCUMENTO = ' + floattostr(pCodDocumento);
                    sSQLTmp := sSQLTmp + '      , IDDARF = ' + IntToStr(iIdDARF);
                    sSQLtmp := sSQLtmp + 'WHERE IDLANCIRRFFOLHABENEF = ' + cdsMovSelDARF.FieldByName('IDLANCIRRFFOLHABENEF').AsString;
                    ExecSQL(sSQLtmp);

                    cdsMovSelDARF.Next;
                  End;
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
 frmProgresso.EscondeFormProgresso;
End;

Function TCtrlGeraDARF_Novo._GravarDARF(
  IdPessoa,
  iCodDarf: Integer;
  sDataIni,
  sDataFim,
  sDataVenc,
  sNatureza: String;
  dVlrTotalBase,
  dVlrTotalIRRF: Double): Boolean;
Var
  sVlrTotalBase, sVlrTotalIRRF, sNumDocumento, sPercIRRF, Ssql: String;
Begin
  Try
    Result := True;
    sPercIRRF := '0';
    Ssql := 'SELECT NUMDOCUMENTO ' +
      '  FROM PESSOA ' +
      ' WHERE IDPESSOA = ' + IntToStr(IdPessoa);
    cdsAux1.data := GetDataPacket(Ssql);
    sNumDocumento := cdsAux1.FieldByName('NUMDOCUMENTO').AsString;

    sVlrTotalBase := _OraNumero(dVlrTotalBase);
    sVlrTotalIRRF := _OraNumero(dVlrTotalIRRF);

    Ssql := 'SELECT IDDARF,VLRIRRF,VLRTOTAL,VLRBASECALCULO ' +
      '  FROM DARF WHERE IDDARF = ' + IntToStr(iCodDarf);
    CdsAux1.data := GetDataPacket(Ssql);
    If CdsAux1.IsEmpty Then
      Begin
        With CdsAux2 Do
          Begin

            sSql := 'INSERT INTO DARF (IDDARF,IDPESSOA,CODNATUREZA,NUMDOCUMENTO,' +
              'DATAINIAPURACAO,DATAFINALAPURACAO,DATAVENCDARF,DATAEMISDARF,VLRBASECALCULO,' +
              'PERCIRRF,VLRIRRF,VLRTOTAL ';
            Ssql := Ssql + ') VALUES (';
            sSql := sSql + InttoStr(iCodDarf) + ',' + IntToStr(IdPessoa);
            sSql := sSql + ',''' + sNatureza + ''',''' + sNumDocumento + ''',';
            sSql := sSql + 'TO_DATE(''' + sDataIni + ''',''dd/mm/yyyy''),';
            sSql := sSql + 'TO_DATE(''' + sDataFim + ''',''dd/mm/yyyy''),';
            sSql := sSql + 'TO_DATE(''' + sDataVenc + ''',''dd/mm/yyyy''),';
            sSql := sSql + 'TO_DATE(''' + sDataFim + ''',''dd/mm/yyyy''),';
            sSql := sSql + sVlrTotalBase + ',' + sPercIRRF + ',' + sVlrTotalIRRF + ',' + sVlrTotalIRRF;
            Ssql := Ssql + ')';
            ExecSQL(Ssql);
          End;
      End
    Else
      Begin
        With CdsAux2 Do
          Begin
            sSql := 'UPDATE DARF SET VLRIRRF = VLRIRRF + ' + sVlrTotalIRRF + ', VLRBASECALCULO = VLRBASECALCULO + ' + sVlrTotalBase;
            sSql := sSql + ', VLRTOTAL = VLRTOTAL + ' + sVlrTotalIRRF + ' WHERE IDDARF = ' + IntToStr(iCodDarf);
            ExecSQL(Ssql);
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

Function TCtrlGeraDARF_Novo._GravaCAP(IdPessoa, IdModulo, iCodDarf, IdUsuario,
  IdEspAcesso: integer; sCodNatureza, DataIni,
  DataFim, DataVenc, Obs, referencia,
  spContaContabRecdes, spCodtiprecdes: String;
  rValorDarf: Real; UsaPlanoPatro: Boolean;
  piDocIndividual, piIdBenefIRRF: Integer): Boolean;
Var
  IdPatro, IdPrograma, IdPlanoPrev, iPlano,
    iSubContaCli, PlnCodigo, iCodForn, iCodForma: LongInt;
  sSQL, sContaCliFor, sCCustoCliFor, ssCodTipRecDes: String;
  iIdRamoTipoFor: Integer;
Begin
  CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
  CtrlDocumento.IdEspAcesso := IdEspAcesso;
  CtrlDocumento.IdUsuario := IdUsuario;

  Result := True;
  sSQL := 'SELECT ' +
    'TRD.IDPESSOA, ' +
    'TRD.RECPAG, ' +
    'TRD.CODTIPRECDES, ' +
    'TRD.PLANO AS PLANOFORN, ' +
    'EPF.CODSUBCONTA, ' +
    'EPF.CODCENTROCUSTO, ' +
    'NAT.IDFORCLI ' +
    'FROM ' +
    'TIPORECEBDESEMB TRD, ' +
    'NATURENDIMENTO NAT, ' +
    'EMPRESAFORN EPF ' +
    'WHERE ' +
    'TRD.RECPAG = ''P'' AND ' +
    'TRD.ATIVO = ''S''  AND ' +
    'TRD.IDPESSOA = ' + IntToStr(IdPessoa) + ' AND ' +
    'TRD.IDPESSOA = NAT.IDPESSOA AND ' +
    'NAT.CODNATUREZA = ' + quotedStr(Espaco(sCodNatureza, 4)) + ' AND ' +
    'TRD.CODTIPRECDES = ' + quotedStr(spCodtiprecdes) + ' AND ' +
    'EPF.IDFORCLI = NAT.IDFORCLI AND ' +
    'EPF.IDPESSOA = NAT.IDPESSOA ';

  cdsCodRendGer.Data := GetDataPacket(sSQL);

  If cdsCodRendGer.IsEmpty Then
    Begin
      iCodForn := cdsParamIRRF.FieldByName('IDFORCLI').AsInteger;
      iSubContaCli := cdsParamIRRF.fieldbyname('CODSUBCONTA').asinteger;
      sCCustoCliFor := cdsParamIRRF.fieldbyname('CODCENTROCUSTO').asstring;
      ssCodTipRecDes := cdsParamIRRF.fieldbyname('CODTIPRECDES').asstring;
      iPlano := cdsParamIRRF.fieldbyname('PLANO').asinteger;
    End
  Else
    Begin
      iCodForn := cdsCodRendGer.FieldByName('IDFORCLI').AsInteger;
      iSubContaCli := cdsCodRendGer.fieldbyname('CODSUBCONTA').asinteger;
      sCCustoCliFor := cdsCodRendGer.fieldbyname('CODCENTROCUSTO').asstring;
      ssCodTipRecDes := cdsCodRendGer.fieldbyname('CODTIPRECDES').asstring;
      iPlano := cdsCodRendGer.fieldbyname('PLANOFORN').asInteger;
    End;
  sContaClifor := spContaContabRecdes;
  //
  sSQL := 'SELECT CODFORMA ' +
    '  FROM NATURENDIMENTO ' +
    ' WHERE CODNATUREZA = ' + quotedstr(sCodNatureza) +
    '   AND CODFORMA IS NOT NULL ';
  cdsNatureza.Data := GetDataPacket(sSQL);

  iCodForma := -1;
  If Not cdsNatureza.IsEmpty Then
    iCodForma := cdsNatureza.FieldByName('CODFORMA').AsInteger;
  //
  If ((sCodNatureza = '7416') Or (sCodNatureza = '7431')) And
    (piDocIndividual = 0) Then
    Begin
      iCodForn := piIdBenefIRRF;

      sSQL := ' SELECT TIPOFAVASSISTIDOS FROM PARAMAPREV ';
      cdsBuscaFornServ.Data := GetDataPacket(sSQL);

      iIdRamoTipoFor := cdsBuscaFornServ.FieldByName('TIPOFAVASSISTIDOS').AsInteger;

      sSQL :=
        'SELECT F.IDPESSOA ' +
        'FROM EMPRESAFORN E, FORNSERV F ' +
        'WHERE E.IDFORCLI = F.IDPESSOA ' +
        '  AND F.IDPESSOA = ' + IntToStr(piIdBenefIRRF);
      cdsBuscaFornServ.Data := GetDataPacket(sSQL);

      If cdsBuscaFornServ.IsEmpty Then
        CtrlDocumento.ForCli.Inserir(
          piIdBenefIRRF,
          Sistema.IdEmpresa,
          -1,
          iPlano,
          iIdRamoTipoFor,
          '',
          '',
          '',
          '',
          tfcFornecedor);
    End;

  //inserir documento
  cdsDoc.Data := CtrlDarf.ProcurarDocumento(-1);
  cdsDoc.insert;
  cdsDoc.fieldByname('IDMODULO').AsInteger := IdModulo;
  cdsDoc.fieldByname('PLANO').AsInteger := iPlano;
  cdsDoc.fieldByname('PLACONTA').Asstring := sContaClifor;
  cdsDoc.fieldByname('CODCENTROCUSTO').Asstring := sCCustoCliFor;
  cdsDoc.fieldByname('IDPESSOA').AsInteger := IdPessoa;
  cdsDoc.fieldByname('IDEMPRESA').AsInteger := IdPessoa;
  cdsDoc.fieldByname('IDFORCLI').AsInteger := iCodForn;
  cdsDoc.fieldByname('CODTIPDOC').AsInteger := cdsParamIrrf.FieldByName('CODTIPDOC').AsInteger;
  cdsDoc.fieldByname('RECPAG').Asstring := 'P';
  cdsDoc.fieldByname('NODOCUMENTO').AsInteger := iCodDarf;
  cdsDoc.fieldByname('COMPLDOCUMENTO').AsString := IntToStr(IdModulo);
  cdsDoc.fieldByname('DATAEMISSAO').Asstring := DataFim;
  cdsDoc.fieldByname('DATAVENCTO').Asstring := DataVenc;
  cdsDoc.fieldByname('DATAPROGRAMADA').Asstring := DataVenc;
  cdsDoc.fieldByname('OBS').ASstring := Obs;
  cdsDoc.fieldByname('REFERENCIA').Asstring := referencia;
  cdsDoc.fieldByname('OPERACAO').Asstring := '2';
  cdsDoc.fieldByname('IDUSUARIOINCLUSAO').AsInteger := IdUsuario;
  cdsDoc.fieldByname('UNIDNEGOC').AsString := sUnidNegoc;
  cdsDoc.fieldByname('CODSUBCONTA').AsInteger := iSubContaCli;
  If iCodForma > 0 Then
    cdsDoc.fieldByname('CODFORMA').AsInteger := iCodForma;
  cdsDoc.fieldByname('EMISBLOQ').Asstring := 'N';
  cdsDoc.Post;
  //
  PlnCodigo := -1;
  //
  //inserir lançamento
  cdsLanc.Data := CtrlDarf.ProcurarLancamentos(-1);
  cdsLanc.insert;
  cdsLanc.FieldByname('PLNCODIGO').AsInteger := PlnCodigo;
  cdsLanc.FieldByname('DATALANCTO').Asstring := DataFim;
  cdsLanc.FieldByname('VALOR').AsFloat := rValorDarf;
  cdsLanc.FieldByname('DEBCRE').Asstring := 'C';
  cdsLanc.FieldByname('OPERACAO').Asstring := '2';
  cdsLanc.FieldByname('HISTORICOCOMPL').Asstring := 'Código: ' + sCodNatureza + '  Período: ' + DataIni + ' a ' + DataFim;
  cdsLanc.FieldByname('IDUSUARIOINCLUSAO').AsInteger := IdUsuario;
  cdsLanc.FieldByname('UNIDNEGOC').AsString := sUnidNegoc;
  cdsLanc.Post;
  //
  cdsRat.Data := CtrlDarf.ProcurarRateio(-1);
  //
  If UsaPlanoPatro Then
    Begin
      IdPatro := iPatro;
      IdPrograma := iPrograma;
      IdPlanoPrev := iPlanoPrev;
      If (IdPatro = 1117723) And (IdPlanoPrev <= 0) Then
        IdPlanoPrev := 110;

      cdsRat.Data := CtrlDarf.ProcurarRateio(-1);
      cdsRateio.First; //esse é o cds dá função que chamou.
      While Not cdsRateio.EOF Do
        Begin
          //inserir rateio
          cdsRat.Insert;
          cdsRat.fieldByname('CODTIPRECDES').Asstring := cdsRateio.fieldbyname('CODTIPRECDES').asstring;
          cdsRat.fieldByname('RECPAG').Asstring := 'P';
          cdsRat.fieldByname('IDPESSOA').Asinteger := IdPessoa;
          cdsRat.fieldByname('VALOR').AsFloat := cdsRateio.fieldByname('VALOR').AsFloat;
          cdsRat.fieldByname('IDUSUARIOINCLUSAO').AsInteger := IdUsuario;
          cdsRat.fieldByname('UNIDNEGOC').Asstring := sUnidNegoc;
          cdsRat.fieldByname('CODCENTROCUSTO').Asstring := cdsRateio.fieldByname('CODCENTROCUSTO').AsString;
          cdsRat.fieldByname('CODCENTRORESPON').Asstring := cdsRateio.fieldByname('CODCENTRORESPON').AsString;
          cdsRat.FieldByName('PLANO').AsInteger := cdsRateio.FieldByName('PLANO').AsInteger;      //edilaine - SIG61511

          If IdPatro > 0 Then
            cdsRat.fieldByname('IDPATRO').AsInteger := cdsRateio.fieldByname('IDPATRO').AsInteger;
          If IdPrograma > 0 Then
            cdsRat.fieldByname('IDPROGRAMA').AsInteger := cdsRateio.fieldByname('IDPROGRAMA').AsInteger;
          If (IdPlanoPrev > 0) And (cdsRateio.fieldByname('IDPLANOPREV').AsInteger > 0) Then
            cdsRat.fieldByname('IDPLANOPREV').AsInteger := cdsRateio.fieldByname('IDPLANOPREV').AsInteger
          Else If IdPatro = 1117723 Then
            cdsRat.fieldByname('IDPLANOPREV').AsInteger := 110
          Else
            cdsRat.fieldByname('IDPLANOPREV').AsInteger := -1;
          cdsRat.post;
          cdsRateio.next;
        End;
    End
  Else
    Begin
      IdPatro := -1;
      IdPrograma := -1;
      IdPlanoPrev := -1;

      //inserir rateio
      cdsRat.Data := CtrlDarf.ProcurarRateio(-1);
      cdsRat.Insert;
      cdsRat.fieldByname('CODTIPRECDES').Asstring := ssCodTipRecDes;
      cdsRat.fieldByname('RECPAG').Asstring := 'P';
      cdsRat.fieldByname('IDPESSOA').Asinteger := IdPessoa;
      cdsRat.fieldByname('VALOR').AsFloat := rValorDarf;
      cdsRat.fieldByname('IDUSUARIOINCLUSAO').AsInteger := IdUsuario;
      cdsRat.fieldByname('UNIDNEGOC').Asstring := sUnidNegoc;
      cdsRat.fieldByname('CODCENTROCUSTO').Asstring := cdsRateio.fieldByname('CODCENTROCUSTO').AsString;
      cdsRat.fieldByname('CODCENTRORESPON').Asstring := cdsRateio.fieldByname('CODCENTRORESPON').AsString;
      cdsRat.FieldByName('PLANO').AsInteger := cdsRateio.FieldByName('PLANO').AsInteger;      //edilaine - SIG61511
      cdsRat.post;
    End;
  //

  If Not CtrlDarf.GravarDocumento(
    cdsDoc.Data,
    cdsLanc.Data,
    cdsRat.Data,
    cdsCCBaixasxDocum.Data,
    'I',
    IdEspAcesso,
    IdUsuario) Then
    Begin
      Result := False;
      MessageInfo := Ctrldarf.MessageInfo;
      Exit;
    End;

  If UsaPlanoPatro Then
    Begin
      sSQL := 'UPDATE DARF SET CODDOCUMENTO = ' + FloatToStr(CtrlDarf.CodDocumento);
      If IdPatro <= 0 Then
        sSQL := sSQL + ', IDPATRO = NULL'
      Else
        sSQL := sSQL + ', IDPATRO = ' + IntToStr(IdPatro);
      If IdPrograma <= 0 Then
        sSQL := sSQL + ', IDPROGRAMA = NULL'
      Else
        sSQL := sSQL + ', IDPROGRAMA = ' + IntToStr(IdPrograma);
      If IdPlanoPrev <= 0 Then
        sSQL := sSQL + ', IDPLANOPREV = NULL'
      Else
        sSQL := sSQL + ', IDPLANOPREV = ' + IntToStr(IdPlanoPrev);
      sSQL := sSQL + ' WHERE IDDARF = ' + IntToStr(iCodDarf);
      If Not ExecSQL(sSQL) Then
        Begin
          Result := False;
          Exit;
        End;
    End
  Else
    Begin
      If Not ExecSQL('UPDATE DARF SET CODDOCUMENTO = ' + FloatToStr(CtrlDarf.CodDocumento) + ' WHERE IDDARF = ' + IntToStr(iCodDarf)) Then
        Begin
          Result := False;
          Exit;
        End;
    End;
End;

Function TCtrlGeraDARF_Novo._ListCCBaixasxDocum(piCodDocumento: Integer): OleVariant;
Begin
  Result := GetDataPacket('SELECT * FROM CCBAIXASXDOCUM WHERE CODDOCUMENTO = ' + IntToStr(piCodDocumento));
End;

Function TCtrlGeraDARF_Novo._SelDARF(pidDARF: Integer): OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT D.IDDARF, ' +
    'D.CODDOCUMENTO,        ' +
    'D.NUMDOCUMENTO,        ' +
    'D.CODNATUREZA,         ' +
    'D.DATAINIAPURACAO,     ' +
    'D.DATAFINALAPURACAO,   ' +
    'D.DATAVENCDARF,        ' +
    'D.REFERENCIA,          ' +
    'D.VLRIRRF,             ' +
    'D.VLRMULTA,            ' +
    'D.VLRJUROS,            ' +
    'D.VLRTOTAL,            ' +
    'D.DATAEMISDARF,        ' +
    'D.TRGDTINCLUSAO,       ' +
    'D.TRGUSERINCLUSAO,     ' +
    'P.NOME                 ' +
    'FROM DARF D, PESSOA P  ' +
    'WHERE D.IDDARF = ' + IntToStr(pidDARF) +
    '      AND TRIM(SUBSTR(D.TRGUSERINCLUSAO, 3, 10)) = P.IDPESSOA ';

  Result := GetDataPacket(sSql);
End;

function TCtrlGeraDARF_Novo._Gerar_DARF_Geral(IdPessoa, IdModulo,
  IdUsuario, IdEspAcesso: Integer; cdsMovSelDARF: TCMClientDataSet;
  DataIni, DataFim, DataVenc, Obs, referencia, psCentroRespon,
  sValorTotalBase, sValorTotalIRRF: String; UsaPlanoPatro: Boolean;
  var pCodDocumento: Double): Boolean;
var
  sSQL, sWhere: String;
  bGravaDARFSomenteUmaVez: Boolean;
  dValTmp, dVlrTotalBase, dVlrTotalIRRF: Double;
  sSQLTmp, sUltIdBenefIrrf, sGuardaUFSecao, sCRGravacao, sPlaContaLin: String;
  iIdPlanoPrev, iContador, iIdPatroLin, iIdPlanoPrevLin : Integer;
  iIdDARF: LongInt;
  cdsAux: TCMClientDataSet;
begin
  Result := True;
  cdsAux := TCMClientDataSet.Create(nil);
  try

    iIdDARF := 0;
    iPatro := 0;
    iPrograma := 0;
    iPlanoPrev := 0;
    sUltIdBenefIrrf := '';
    sCodNatureza := '';
    sCodtipRecdes := '';
    sContaContabRecDes := '';
    iIdPlanoPrev := -1;
    iIdPatroLin := 0;
    iIdPlanoPrevLin := 0;
    sPlaContaLin := '';

    bGravaDARFSomenteUmaVez := True;
    dVlrTotalBase := StringToFloat(sValorTotalBase);
    dVlrTotalIRRF := StringToFloat(sValorTotalIRRF);

    sCRGravacao := cdsMovSelDARF.FieldByName('CODCENTRORESPON').AsString;
    if psCentroRespon <> '' Then
      sCRGravacao := psCentroRespon;

    try
      cdsParamGlobal.Data := GetDataPacket('SELECT * FROM PARAMGLOBAL WHERE IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
      cdsRateio.Data := CtrlDarf.ProcurarRateio(-1);
      cdsCCBaixasxDocum.Data := _ListCCBaixasxDocum(-1);

      sSQL := 'SELECT L.IDFORCLI, L.CODTIPRECDES,                             ' + #13 +
              '       E.PLANO, E.CODSUBCONTA, E.CODCENTROCUSTO, E.CONTACFORN, ' + #13 +
              '       L.CODTIPDOC, L.CODCENTRORESPON, L.UNIDNEGOC,            ' + #13 +
              '       L.FLGDOCDARFIRJUD, L.FLGTIPOGERADARF                    ' + #13 +
              '  FROM EMPRESAFORN E                                           ' + #13 +
              '  JOIN PARAMIRRF   L  ON E.IDPESSOA = L.IDPESSOA               ' + #13 +
              '   AND E.IDFORCLI = L.IDFORCLI                                 ' + #13 +
              ' WHERE L.IDPESSOA = ' + IntToStr(IdPessoa)                        ;
      cdsParamIRRF.Data := GetDataPacket(sSQL);

      if cdsParamIRRF.FieldByName('UNIDNEGOC').AsString <> EmptyStr then
        sUnidNegoc := cdsParamIRRF.FieldByName('UNIDNEGOC').AsString
      else
        if cdsParamGlobal.FieldByName('UNIDNEGOC').AsString <> EmptyStr Then
          sUnidNegoc := cdsParamGlobal.FieldByName('UNIDNEGOC').AsString
        else
          sUnidNegoc := '-1';

      if cdsParamIRRF.FieldByName('FLGTIPOGERADARF').AsString = '2' then // 2 = SIM - Gerar Documentos por Plano Contábil ?
      begin
        cdsMovSelDARF.IndexFieldNames := 'IDPLANOPREVPREV';
        cdsMovSelDARF.First;
        iIdPlanoPrev := cdsMovSelDARF.FieldByName('IDPLANOPREVPREV').AsInteger;
      end;

      sWhere := RetornaIdLinhasSelecionadas(cdsMovSelDARF);

      cdsMovSelDARF.First;
      iContador := 0;

      cdsAux.Data := GetRateioLinhasIRRFFolhaBenef(sWhere, cdsMovSelDARF.FieldByName('CODNATUREZA').AsString, DataIni, DataFim);

      frmProgresso.MostraFormProgresso('Aguarde, gerando rateio para as linhas do DARF...' , True, False, True, 0, cdsAux.RecordCount);
      while not cdsAux.Eof do
      begin
       if (iIdPlanoPrevLin <> cdsAux.FieldByName('IDPLANOPREV').AsInteger) or
          (iIdPatroLin <> cdsAux.FieldByName('IDPATRO').AsInteger) then
        begin
          cdsRateio.Insert;
          cdsRateio.FieldByName('VALOR').AsFloat := cdsAux.FieldByName('VLRIRRF').AsFloat;
          cdsRateio.FieldByName('IDPATRO').AsFloat := cdsAux.FieldByName('IDPATRO').AsFloat;
          cdsRateio.FieldByName('IDPLANOPREV').AsFloat := cdsAux.FieldByName('IDPLANOPREV').AsFloat;
          cdsRateio.FieldByName('CODCENTROCUSTO').AsString := cdsAux.FieldByName('CODCENTROCUSTO').AsString;
          cdsRateio.FieldByName('CODCENTRORESPON').AsString := sCRGravacao;
          cdsRateio.FieldByName('IDPROGRAMA').AsFloat := cdsAux.FieldByName('IDPROGRAMA').AsFloat;
          cdsRateio.Fieldbyname('CODTIPRECDES').asstring := Trim(cdsAux.FieldByName('CODTIPRECDES').AsString);
          cdsRateio.FieldByName('PLANO').AsInteger := cdsAux.FieldByName('PLANO').AsInteger;
          cdsRateio.Post;
        end
        else
        begin
          cdsRateio.Edit;
          cdsRateio.FieldByName('VALOR').AsFloat := cdsRateio.FieldByName('VALOR').AsFloat + cdsAux.FieldByName('VLRIRRF').AsFloat;
          cdsRateio.Post;
        end;
        iIdPlanoPrevLin := cdsAux.FieldByName('IDPLANOPREV').AsInteger;
        iIdPatroLin := cdsAux.FieldByName('IDPATRO').AsInteger;

        inc(iContador);
        frmProgresso.AndaFormProgresso(iContador);

        cdsAux.Next;
      end;
      iIdPatroLin := 0;
      iIdPlanoPrevLin := 0;

      iContador := 0;
      frmProgresso.EscondeFormProgresso;

      cdsAux.First;
      cdsAux.IndexFieldNames := 'IDPATRO;IDPLANOPREV;PLACONTARECDES';
      cdsAux.First;

      frmProgresso.MostraFormProgresso('Aguarde, gerando definição de contas para baixa...' , True, False, True, 0, cdsAux.RecordCount);
      while not cdsAux.Eof do
      begin
        if (iIdPatroLin <> cdsAux.FieldByName('IDPATRO').AsInteger) or
           (iIdPlanoPrevLin <> cdsAux.FieldByName('IDPLANOPREV').AsInteger) or
          (sPlaContaLin <> cdsAux.FieldByName('PLACONTARECDES').AsString) then
        begin
          cdsCCBaixasxDocum.Insert;
          cdsCCBaixasxDocum.FieldByName('IDPLANOPREV').AsInteger := cdsAux.FieldByName('IDPLANOPREV').AsInteger;
          cdsCCBaixasxDocum.FieldByName('IDPATRO').AsInteger := cdsAux.FieldByName('IDPATRO').AsInteger;
          cdsCCBaixasxDocum.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
          cdsCCBaixasxDocum.FieldByName('PLACONTA').AsString := cdsAux.FieldByName('PLACONTARECDES').AsString;
          cdsCCBaixasxDocum.FieldByName('UNIDNEGOC').AsString := sUnidNegoc;
          cdsCCBaixasxDocum.FieldByName('PLANO').AsInteger := cdsAux.FieldByName('PLANO').AsInteger;
          cdsCCBaixasxDocum.FieldByName('VALOR').AsFloat := cdsAux.FieldByName('VLRIRRF').AsFloat;
          cdsCCBaixasxDocum.Post;
        end
        else
        begin
          cdsRateio.Edit;
          cdsRateio.FieldByName('VALOR').AsFloat := cdsRateio.FieldByName('VALOR').AsFloat + cdsAux.FieldByName('VLRIRRF').AsFloat;
          cdsRateio.Post;
        end;
        iIdPatroLin := cdsAux.FieldByName('IDPATRO').AsInteger;
        iIdPlanoPrevLin := cdsAux.FieldByName('IDPLANOPREV').AsInteger;
        sPlaContaLin := cdsAux.FieldByName('PLACONTARECDES').AsString;

        inc(iContador);
        frmProgresso.AndaFormProgresso(iContador);
        cdsAux.Next;
      end;
      iIdPatroLin := 0;
      iIdPlanoPrevLin := 0;
      sPlaContaLin := EmptyStr;

      iContador := 0;
      frmProgresso.EscondeFormProgresso;

      cdsMovSelDARF.IndexFieldNames := 'IDLANCIRRFFOLHABENEF';
      cdsMovSelDARF.First;

      // Gravar o DARF somente uma vez dentro do loop
      if bGravaDARFSomenteUmaVez then
      begin
        frmProgresso.MostraFormProgresso('Gerando DARF da Natureza -> ' + cdsMovSelDARF.FieldByName('CODNATUREZA').AsString, False, False, True, 0, 1);
        sCodNatureza := cdsMovSelDARF.FieldByName('CODNATUREZA').AsString;
        iPatro := cdsMovSelDARF.FieldByName('IDPATRO').AsInteger;
        iPlanoPrev := cdsMovSelDARF.FieldByName('IDPLANOPREV').AsInteger;
        iPrograma := cdsMovSelDARF.FieldByName('IDPROGRAMA').AsInteger;
        sContaContabRecdes := cdsMovSelDARF.FieldByName('PLACONTARECDES').AsString;
        sCodTipRecdes := cdsMovSelDARF.FieldByName('CODTIPRECDES').AsString;

        // Pegando o número do DARF
        iIdDARF := getSequence('DARF');

        // Atualizando a Tabela DARF
        if not _GravarDARF(IdPessoa,
                           iIdDARF,
                           DataIni,
                           DataFim,
                           DataVenc,
                           sCodNatureza,
                           dVlrTotalBase,
                           dVlrTotalIRRF) Then
        begin
          Result := False;
          frmProgresso.EscondeFormProgresso;
          Exit;
        end;
        cdsRateio.First;
        cdsCCBaixasxDocum.First;

        if (cdsParamIRRF.FieldByName('FLGTIPOGERADARF').AsString = '2') then
        begin
          frmProgresso.MostraFormProgresso('Verificando linhas para gerar documentos DARF por plano contábil...', False, False, True, 0, cdsMovSelDARF.RecordCount);
          while not cdsMovSelDARF.Eof do
          begin
            if (iIdDARF <> 0) And
               ((iIdPlanoPrev <> cdsMovSelDARF.FieldByName('IDPLANOPREVPREV').AsInteger) Or
                (cdsMovSelDARF.EOF)) Then
            begin
              if Not _GravaCAP(IdPessoa,
                               IdModulo,
                               iIdDARF,
                               IdUsuario,
                               IdEspAcesso,
                               sCodNatureza,
                               DataIni,
                               DataFim,
                               DataVenc,
                               Obs,
                               referencia,
                               sContaContabRecdes,
                               sCodtiprecdes,
                               dVlrTotalIRRF,
                               UsaPlanoPatro,
                               1, 0) then
              begin
                Result := False;
                frmProgresso.EscondeFormProgresso;
                Exit;
              end;

              cdsRateio.Data := CtrlDarf.ProcurarRateio(-1);
              cdsCCBaixasxDocum.Data := _ListCCBaixasxDocum(-1);

              iIdPlanoPrev := cdsMovSelDARF.FieldByName('IDPLANOPREVPREV').AsInteger;

              sSQLTmp := 'UPDATE DARF SET CODDOCUMENTO = ' + FloatToStr(CtrlDarf.CodDocumento);
              sSQLtmp := sSQLtmp + ' WHERE IDDARF = ' + IntToStr(iIdDARF);

              pCodDocumento := CtrlDarf.CodDocumento; // Variavel que será passada de volta ao form chamador

              iIdDARF := getSequence('DARF');

              if Not ExecSQL(sSQLtmp) then
              begin
                Result := False;
                frmProgresso.EscondeFormProgresso;
                Exit;
              end;
              inc(iContador);
              frmProgresso.AndaFormProgresso(iContador);
              cdsMovSelDARF.Next;

            end;
          end;
          frmProgresso.EscondeFormProgresso;
          iContador:= 0;
        end;

        if (cdsParamIRRF.FieldByName('FLGTIPOGERADARF').AsString <> '2') and not(cdsParamIrrf.IsEmpty) and (dVlrTotalIRRF <> 0) then
        Begin
          if not _GravaCAP(IdPessoa,
                           IdModulo,
                           iIdDARF,
                           IdUsuario,
                           IdEspAcesso,
                           sCodNatureza,
                           DataIni,
                           DataFim,
                           DataVenc,
                           Obs,
                           referencia,
                           sContaContabRecDes,
                           sCodtiprecdes,
                           dVlrTotalIRRF,
                           UsaPlanoPatro,
                           1,
                           0) then
          begin
            Result := False;
            Raise Exception.Create(messageinfo);
          end;

          pCodDocumento := CtrlDarf.CodDocumento; // Variavel que será passada de volta ao form chamador

          if pCodDocumento <> 0 Then
          begin
            // Atualizando a Tabela IRRFFOLHABENEF com o CODDOCUMENTO gerado
            cdsMovSelDARF.First;
            frmProgresso.MostraFormProgresso('Atualizando dados dos movimentos de DARF selecionados...', False, False, True, 0, cdsMovSelDARF.RecordCount);

            while Not cdsMovSelDARF.EOF do
            begin
              if (cdsMovSelDARF.fieldByname('FLGREGEXCLUIDO').asString = 'N') and
                 (cdsMovSelDARF.fieldByname('FLGDARF').asString = 'S') then
              begin
                sSQLTmp := 'UPDATE IRRFFOLHABENEF SET CODDOCUMENTO = ' + floattostr(pCodDocumento);
                sSQLTmp := sSQLTmp + '      , IDDARF = ' + IntToStr(iIdDARF);
                sSQLtmp := sSQLtmp + 'WHERE IDLANCIRRFFOLHABENEF = ' + cdsMovSelDARF.FieldByName('IDLANCIRRFFOLHABENEF').AsString;
                ExecSQL(sSQLtmp);
              end;

              Inc(iContador);
              frmProgresso.AndaFormProgresso(iContador);
              cdsMovSelDARF.Next;
            end;
          end;
          iContador := 0;
          frmProgresso.EscondeFormProgresso;
        end;
      end;

    except
      on e: Exception do
      begin
        Result := False;
        MessageInfo := e.Message;
      end;
    end;
  finally
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlGeraDARF_Novo.RetornaIdLinhasSelecionadas(
  cdsMovSelDARF: TCMClientDataSet): String;
var
  s: string;  i: integer;begin  Result := EmptyStr;  s:=  EmptyStr;  i:= 0;  cdsMovSelDARF.First;  frmProgresso.MostraFormProgresso('Aguarde, recuperando dados dos movimentos de DARF selecionados...' , True, False, True, 0, cdsMovSelDARF.RecordCount);  while Not cdsMovSelDARF.EOF Do  begin    if (cdsMovSelDARF.fieldByname('FLGREGEXCLUIDO').asString = 'S') and       (cdsMovSelDARF.fieldByname('FLGDARF').asString = 'N') then       if s = EmptyStr then        s :=  '(' + cdsMovSelDARF.fieldByname('IDLANCIRRFFOLHABENEF').asString       else        s := s + ',' + cdsMovSelDARF.fieldByname('IDLANCIRRFFOLHABENEF').asString;     cdsMovSelDARF.Next;     Inc(i);     frmProgresso.AndaFormProgresso(i);  end;                                   if s <> EmptyStr then    Result := s + ')';  frmProgresso.EscondeFormProgresso;end;

function TCtrlGeraDARF_Novo.GetRateioLinhasIRRFFolhaBenef(
  pWhere, pCodNatureza, pDataIniApu, pDataFimApu: String): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT IDPATRO,                           ' +#13#10+
          '	      IDPLANOPREV,                       ' +#13#10+
          '	      CODCENTROCUSTO,                    ' +#13#10+
          '	      IDPROGRAMA,                        ' +#13#10+
          '	      CODTIPRECDES,                      ' +#13#10+
          '	      PLANO,                             ' +#13#10+
          '	      PLACONTA  AS PLACONTARECDES,       ' +#13#10+
          '	      SUM(VLRIMPOSTO) AS VLRIRRF         ' +#13#10+
          '  FROM IRRFFOLHABENEF                     ' +#13#10+
          ' WHERE CODNATUREZA = ' + QuotedStr(pCodNatureza) +#13#10+
          '   AND DATAPAGAMENTO >= TO_DATE(' + QuotedStr(pDataIniApu) + ', ''DD/MM/YYYY'') ' +#13#10+
          '   AND DATAPAGAMENTO <= TO_DATE(' + QuotedStr(pDataFimApu) + ', ''DD/MM/YYYY'') ' +#13#10;
  if pWhere <> EmptyStr then
    sSQL :=  sSQL + ' AND IDLANCIRRFFOLHABENEF NOT IN ' + pWhere  +#13#10;

  sSQL := sSQL + 
          ' GROUP BY IDPATRO,                        ' +#13#10+
          '	         IDPLANOPREV,                    ' +#13#10+
          '	         CODCENTROCUSTO,                 ' +#13#10+
          '	         IDPROGRAMA,                     ' +#13#10+
          '	         CODTIPRECDES,                   ' +#13#10+
          '	         PLANO,                          ' +#13#10+
          '	         PLACONTA                        ' ;
  Result := GetDataPacket(sSQL);
end;

End.

