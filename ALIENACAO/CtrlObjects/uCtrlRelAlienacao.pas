{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 18795
Responsável : Daniel Simões
Data        : 31/01/2007
Descrição   : Exibe também as propostas no estoque.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlRelAlienacao;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes, uCMFileUtils;

Type
  TCtrlRelAlienacao = class(TCmControlObject)
  private
    function OraData(const dData : TDateTime) : String;

  public
    function SelecionaRelFolhaAlienacao(const fMes, fAno: Double;
                                        const iResponsavel, iAdministradora: Integer;
                                        const bContrato, bAcordo : Boolean): OLEVariant;

    function LookupContratosEstoque(const sSegmento : String; const iContrato : Integer; const iTipoRelat : Integer) : OleVariant;
    function SelecionaRelEstoqueFinanceiro(const sSegmento : String; const iContrato : Integer; const dData : TDateTime; const iTipoRelat : Integer) : OleVariant;
    function SelecionaTotalResiduo(const iContrato : Integer; const dData : TDateTime) : OleVariant;

    // Início Pendência 21462 - Marcos V. Topini
    function LookupAbonos(const iContrato : Integer;
                          const sSegmento : String;
                          const sDataIni  : String;
                          const sDataFim  : String;
                          const sTipoAbono          : String) : OleVariant;

    function LookupParcelas(const iParcFinancImov : Integer) : OleVariant;
    function LookupAtualizaInad(const iContrato : Integer; dDataInicio, dDataFinal: TDateTime) : OleVariant;


    // Fim Pendência 21462


  published

end;


implementation

uses uComunsImobiliario, uFuncAlienacao;

{ TCtrlRelAlienacao }


function TCtrlRelAlienacao.OraData(const dData : TDateTime) : String;
begin
   Result := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dData)) + ', ''DD/MM/YYYY'')';
end;


function TCtrlRelAlienacao.SelecionaRelFolhaAlienacao(const fMes, fAno: Double;
                                                      const iResponsavel, iAdministradora: Integer;
                                                      const bContrato, bAcordo : Boolean): OLEVariant;
var sSql, sParam, sCompetencia, sResponsavel : String;
    cdsTemp : TCMClientDataSet;
    sTipoContrato : String;
begin
  // Define Parâmetros
  sParam := ' AND TO_CHAR(P.DATAVENCIMENTO,''MM'')   = ' + FormatFloat(  '0#',fMes) + #13 +
            ' AND TO_CHAR(P.DATAVENCIMENTO,''YYYY'') = ' + FormatFloat('####',fAno) +#13;

  sTipoContrato := '';
  if bContrato then
  begin
     if sTipoContrato <> '' then sTipoContrato := sTipoContrato + ',';
     sTipoContrato := sTipoContrato + QuotedStr('C');
  end;

  if bAcordo then
  begin
     if sTipoContrato <> '' then sTipoContrato := sTipoContrato + ',';
     sTipoContrato := sTipoContrato + QuotedStr('A');
  end;

  if sTipoContrato <> '' then sParam := sParam + ' AND C.FLGTIPOCONTRATO IN (' + sTipoContrato + ')' + #13;

  if iAdministradora > 0 then sParam := sParam + ' AND C.IDADMINIMOVEL = ' + IntToStr(iAdministradora) +#13;
  if iResponsavel > 0    then begin
     sParam := sParam + ' AND C.IDRESPONSAVEL = ' + IntToStr(iResponsavel)    +#13;
     sResponsavel := ' PR.NOME AS NOME_RESPONSAVEL, '+#13;
  end else begin
     sResponsavel := ' ''< Todos >'' AS NOME_RESPONSAVEL, '+#13;
  end;

  sCompetencia := QuotedStr(ComunsImobiliario.Competencia(fMes, fAno));

  // Define Sql
  sSql := 'SELECT DISTINCT '+ #13 +
          '       PA.NOME AS NOME_ADMINISTRADORA, '+ #13 + sResponsavel +
          '       PC.NOME AS NOME_COMPRADOR,      '+ #13 +
          '       C.CONNUMERO,      '+ #13 +
          '       C.CONNOME,        '+ #13 +
          '       P.FLGTIPOLANC,    '+ #13 +
          '       P.FLGLANCINTEGRA, '+ #13 +
          '       P.NUMPARCELA,     '+ #13 +
          '       ' + sCompetencia + ' AS COMPETENCIA, '+ #13 +
          '       ''                    '' AS STATUS,      '+ #13 +
          '       P.DATAVENCIMENTO, '+ #13 +
          '       P.VLRPRESTACAO,   '+ #13 +
          '       C.FLGTIPOCONTRATO, '  + #13 +
          '       DECODE(C.FLGTIPOCONTRATO,''C'',''Alienação'', ' + #13 +
          '                                ''A'',''Acordo'') AS TIPOCONTRATO, ' + #13 +
          '       P.CODDOCUMENTO    '+ #13 +
          '  FROM PARCFINANCIMOV P, '+ #13 +
          '       CONDPAGIMOVEL CP, '+ #13 +
          '       CONTRATOIMOVEL C, '+ #13 +
          '       PESSOA PC, '+ #13 +
          '       PESSOA PA, '+ #13 +
          '       PESSOA PR  '+ #13 +
          ' WHERE P.IDCONDPAGIMOVEL   = CP.IDCONDINICIAL   '+ #13 +
          '   AND CP.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL '+ #13 +
          '   AND C.IDLOCATARIO = PC.IDPESSOA      '+ #13 +
          '   AND C.IDADMINIMOVEL = PA.IDPESSOA(+) '+ #13 +
          '   AND C.IDRESPONSAVEL = PR.IDPESSOA(+) '+ #13 +
          '   AND P.FLGTIPOLANC > 1 AND P.FLGTIPOLANC <> 11 '+ #13 + sParam +
          'ORDER BY NOME_ADMINISTRADORA, C.FLGTIPOCONTRATO, NOME_COMPRADOR ';

  try
     cdsTemp := TCMClientDataSet.Create( nil );
     cdsTemp.Data := GetDataPacket( sSql );

     // Preenche tipo de Parcela
     with cdsTemp do begin
        while not Eof do begin
           Edit;
           FieldByName('STATUS').AsString := FuncAlienacao.TipoParcela(
                                    FieldByName('FLGTIPOLANC').AsInteger,
                                    FieldByName('FLGLANCINTEGRA').AsInteger);
           Post;
           Next;
        end;
        First;
     end;
  finally
     Result := cdsTemp.Data;
     FreeAndNil( cdsTemp );
  end;
end;


function TCtrlRelAlienacao.SelecionaRelEstoqueFinanceiro(const sSegmento : String; const iContrato : Integer; const dData : TDateTime; const iTipoRelat : Integer) : OleVariant;
var
   sSQL  : String;
begin
   sSQL :=
   'SELECT PF.IDPARCFINANCIMOV, '                                                                                          + #13 +
   '       PF.IDCONDPAGIMOVEL, '                                                                                           + #13 +
   '       PF.CODDOCUMENTO, '                                                                                              + #13 +
   '       CP.IDCONTRATOIMOVEL, '                                                                                          + #13 +
   '       CI.CONNUMERO, '                                                                                                 + #13 +
   '       CI.CONNOME, '                                                                                                   + #13 +
   '       IM.SEGMENTO, '                                                                                                  + #13 +
   '       NVL(CD2.CONCILIADOC, ''N'') AS FLGCONCILIADO, '+#13+
   '       ''                         '' AS CAL_TIPO, '                                                                    + #13 +
   '       (CI.CONNUMERO || '' - '' || CI.CONNOME) AS NOMECONTRATO, '                                                      + #13 +
   '       P.RAZAOSOCIAL, '                                                                                                + #13 +
   '       DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || ''/'' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA,    '+ #13 +
   '       DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO) AS DATAVENCIMENTO, '                                + #13 +
   '       PF.DATALIMITE, '                                                                                                + #13 +
   '       DECODE(PF.FLGTIPOLANC,9,PF.VLRAMORTIZACAO,PF.VLRPRESTACAO) AS VLRPRESTACAO, '                                   + #13 +
   '       PF.FLGTIPOLANC, '                                                                                               + #13 +
   '       PF.NUMPARCELA AS NUMPARC, '                                                                                     + #13 +
   '       DECODE(PF.IDREPACTUA, NULL, PF.FLGLANCINTEGRA, '+#13+
   '              DECODE(CD2.FLGTIPO, NULL,               '+#13+
   '                     DECODE(PF.CODDOCUMENTO, NULL,    '+#13+
   '                            DECODE(NVL(PF.VLRPAGO,0), 0, 0, 3), 2), 5) ) AS FLGLANCINTEGRA, '+#13+

   '       PP.DATAPAGAMENTO, '                                                                                             + #13 +
   '       NVL(PF.FLGRESIDUOINCORP,''N'') AS FLGRESIDUOINCORP, '                                                           + #13 +
   '       ALT.TOT_ALTERADOR, '                                                                                            + #13 +
   '       CR.DATACOBRES,         '                                                                                        + #13 +
   '       ROUND(NVL(PP.VLRPAGO,0),2) AS VLRPAGO, '                                                                        + #13 +
   '       PF.DATAPAGAMENTO - PF.DATALIMITE AS DIASDIF, '                                                                  + #13 +
   '       CMA.VLRCORRIGIDOATRASO AS VLRCMATRASO, '                                                                        + #13 +
   '       MA.VLRMULTAATRASO AS VLRMULTAATRASO, '                                                                          + #13 +
   '       JA.VLRMORAATRASO AS VLRMORAATRASO, '                                                                            + #13 +
   '       CMS.VLRCORRIGIDOSALDO AS VLRCMCORRIG, '                                                                         + #13 +
   '       MS.VLRMULTASALDO    AS VLRMULTACORRIG, '                                                                        + #13 +
   '       JS.VLRMORASALDO AS VLRJUROSCORRIG, '                                                                            + #13 +
   '       NVL(PF.VLRRESIDUO,0) AS VLRRESIDUO,   '                                                                         + #13 +
   '       NVL(AR.VLRRESIDUOCORRIG,0) AS VLRRESIDUOCORRIG,   '                                                             + #13 +
   '       NVL(CMA.VLRCORRIGIDOATRASO,0) + NVL(CMS.VLRCORRIGIDOSALDO,0) AS TOT_CORRECAO, '                                 + #13 +
   '       NVL(MA.VLRMULTAATRASO,0) + NVL(MS.VLRMULTASALDO,0)   AS TOT_MULTA, '                                            + #13 +
   '       NVL(JA.VLRMORAATRASO,0) + NVL(JS.VLRMORASALDO,0) AS TOT_JUROS, '                                                + #13 +
   '       NVL(PF.VLRPRESTACAO,0) + '                                                                                      + #13 +
   '          NVL(CMA.VLRCORRIGIDOATRASO, 0 ) + '                                                                          + #13 +
   '          NVL(MA.VLRMULTAATRASO, 0 ) + '                                                                               + #13 +
   '          NVL(JA.VLRMORAATRASO, 0 ) + '                                                                                + #13 +
   '          NVL(CMS.VLRCORRIGIDOSALDO,0) + '                                                                             + #13 +
   '          NVL(MS.VLRMULTASALDO,0) + '                                                                                  + #13 +
   '          NVL(JS.VLRMORASALDO,0) + '                                                                                   + #13 +
   '          NVL(ALT.TOT_ALTERADOR,0) - NVL(ABONO.TOT_ABONO,0) AS VLRDEVIDO, '                                            + #13 +
   '       ROUND(NVL(PF.VLRPRESTACAO,0) + '                                                                                + #13 +
   '          NVL(CMA.VLRCORRIGIDOATRASO, 0 ) + '                                                                          + #13 +
   '          NVL(MA.VLRMULTAATRASO, 0 ) + '                                                                               + #13 +
   '          NVL(JA.VLRMORAATRASO, 0 ) - '                                                                                + #13 +
   '          NVL(PP.VLRPAGO, 0 ) + '                                                                                      + #13 +
   '          NVL(CMS.VLRCORRIGIDOSALDO,0) + '                                                                             + #13 +
   '          NVL(MS.VLRMULTASALDO,0) + '                                                                                  + #13 +
   '          NVL(JS.VLRMORASALDO,0) + '                                                                                   + #13 +
   '          NVL(ALT.TOT_ALTERADOR,0) - NVL(ABONO.TOT_ABONO,0),2) AS VLRDIF '                                             + #13 +
   'FROM '                                                                                                                 + #13 +
   '    PARCFINANCIMOV PF, '                                                                                               + #13 +
   '    CONDPAGIMOVEL  CP, '                                                                                               + #13 +
   '    CONTRATOIMOVEL CI, '                                                                                               + #13 +
   '    PESSOA P, '                                                                                                        + #13 +

   '       (  SELECT IDPARCFINANCIMOV, DATA, FLGTIPO,                  '+#13+
   '                 DECODE(FLGTIPO,''M'', DECODE(QTDE,3,''S'',''P''), '+#13+
   '                                ''J'', DECODE(QTDE,3,''S'',''P''), '+#13+
   '                                ''C'', DECODE(QTDE,3,''S'',''P''), '+#13+
   '                                CONCILIADOC ) AS CONCILIADOC       '+#13+
   '            FROM '+#13+
   '                 ( SELECT C.IDPARCFINANCIMOV,                                   '+#13+
   '                          DECODE(C.FLGTIPO, NULL, NULL,                         '+#13+
   '                                 ''R'', ''S'', ''T'', ''S'', ''M'',''P'',''J'',''P'',''C'',''P'', '+#13+
   '                                 ''A'', ''C'', P.FLGCONCILIADO ) AS CONCILIADOC,'+#13+
   '                          MAX(C.DATA) AS DATA, MAX(C.FLGTIPO) AS FLGTIPO, COUNT(*) AS QTDE '+#13+
   '                     FROM CONCILIADOC C, PARCFINANCIMOV P                       '+#13+
   '                    WHERE C.IDPARCFINANCIMOV = P.IDPARCFINANCIMOV               '+#13+
   '                      AND C.FLGTIPO IN(''R'',''T'', ''A'',''M'',''J'',''C'')    '+#13+
   '                      AND C.DATA <= ' + OraData(dData)                          +#13+
   '                      AND ( C.FLGTIPO IN (''T'',''R'') OR                       '+#13+
   '                            NOT EXISTS ( SELECT 1 FROM CONCILIADOC              '+#13+
   '                                          WHERE FLGTIPO IN (''T'',''R'')        '+#13+
   '                                            AND IDPARCFINANCIMOV = C.IDPARCFINANCIMOV ) ) '+#13+
   '                    GROUP BY C.IDPARCFINANCIMOV,                                '+#13+
   '                             DECODE(C.FLGTIPO, NULL, NULL,                      '+#13+
   '                                 ''R'', ''S'', ''T'', ''S'', ''M'',''P'',''J'',''P'',''C'',''P'', '+#13+
   '                                 ''A'', ''C'', P.FLGCONCILIADO ) ) ) CD2,       '+#13+

   '    ( '                                                                                                                + #13 +
   '     SELECT IDPARCCOBRADA, DATACOBRANCA AS DATACOBRES '                                                                + #13 +
   '     FROM PARCEXTRAIMOV '                                                                                              + #13 +
   '     WHERE FLGTIPOCOBRANCA = ''R'' '                                                                                   + #13 +
   '    ) CR, '                                                                                                            + #13 +
   '    ( '                                                                                                                + #13 +
   '     SELECT /*+ INDEX(D) INDEX(LD) INDEX(C) INDEX(PA) */ '                                                             + #13 +
   '         LD.CODDOCUMENTO, T.CODTIPIMOVEL, '                                                                            + #13 +
   '         SUM( DECODE(LD.DEBCRE,''D'', LD.VALOR, (LD.VALOR * -1)) ) AS TOT_ALTERADOR '                                  + #13 +
   '     FROM '                                                                                                            + #13 +
   '         LANCTODOCUM LD, '                                                                                             + #13 +
   '         DOCUMENTO D, '                                                                                                + #13 +
   '         PARAMALIENACAO PA, '                                                                                          + #13 +
   '         PARCFINANCIMOV P, '                                                                                           + #13 +
   '         CONDPAGIMOVEL C, '                                                                                            + #13 +
   '         TIPOIMOVEL T, '                                                                                               + #13 +
   '         ('                                                                                                            + #13 +
   '          SELECT DISTINCT'                                                                                             + #13 +
   '              C.IDCONTRATOIMOVEL,'                                                                                     + #13 +
   '              I.CODTIPIMOVEL'                                                                                          + #13 +
   '          FROM'                                                                                                        + #13 +
   '              CONTRATOIMOVEL C,'                                                                                       + #13 +
   '              CONTRATOXIMOVEL CXI,'                                                                                    + #13 +
   '              IMOVEL I'                                                                                                + #13 +
   '          WHERE'                                                                                                       + #13 +
   '              CXI.IDIMOVEL = I.IDIMOVEL'                                                                               + #13 +
   '          AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'                                                               + #13 +
   '          AND C.FLGTIPOCONTRATO = ''C'''                                                                               + #13;

   if iContrato > 0 then
      sSQL := sSQL + '          AND C.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                           + #13;

   sSQL := sSQL +
   '         ) TC'                                                                                                         + #13 +
   '     WHERE'                                                                                                            + #13 +
   '         RTRIM(LD.OPERACAO) = ''4'''                                                                                   + #13 +
   '     AND LD.CODALTERADOR <> PA.CODALTERADORCPMF'                                                                       + #13 +
   '         AND (LD.CODALTERADOR <> PA.CODALTERADORADRES OR ' + #13 +
   '              LD.CODALTERADOR = PA.CODALTERADORADRES AND EXISTS (SELECT 1 ' + #13 +
   '                                                                 FROM CONCILIADOC ' + #13 +
   '                                                                 WHERE IDDOCUMENTO = LD.CODDOCUMENTO ' + #13 +
   '                                                                 AND   NUMLANCTO   = LD.NUMLANCTO ' + #13 +
   '                                                                 AND   DATA        <= ' + OraData(dData) + ')) ' + #13 + 
   '     AND PA.IDPESSOA = 1'                                                                                              + #13 +
   '     AND LD.CODDOCUMENTO = D.CODDOCUMENTO'                                                                             + #13 +
   '     AND D.CODDOCUMENTO = P.CODDOCUMENTO'                                                                              + #13 +
   '     AND P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL'                                                                        + #13 +
   '     AND C.IDCONTRATOIMOVEL = TC.IDCONTRATOIMOVEL'                                                                     + #13 +
   '     AND TC.CODTIPIMOVEL = T.CODTIPIMOVEL'                                                                             + #13 +
   '     AND LD.DATALANCTO <= ' + OraData(dData)                                                                           + #13 +
   '     AND ( PA.IDOPERATUALCM IS NULL OR ( LD.CODALTERADOR <> T.CODALTCMAL AND'                                          + #13 +
   '                                         LD.CODALTERADOR <> T.CODALTJRAL AND'                                          + #13 +
   '                                         LD.CODALTERADOR <> T.CODALTMTAL ) )'                                          + #13 +
   '     AND D.IDMODULO = 135'                                                                                             + #13;

   if iContrato > 0 then
      sSQL := sSQL + '          AND C.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                           + #13;

   sSQL := sSQL +
   '     GROUP BY LD.CODDOCUMENTO, T.CODTIPIMOVEL'                                                                         + #13 +
   '    )  ALT,'                                                                                                           + #13 +
   '    ('                                                                                                                 + #13 +
   '     SELECT /*+ INDEX(L) INDEX(P) */'                                                                                  + #13 +
   '         L.IDPARCFINANCIMOV,'                                                                                          + #13 +
   '         SUM(L.VLRACUM) AS VLRRESIDUOCORRIG'                                                                           + #13 +
   '     FROM'                                                                                                             + #13 +
   '         LANCOPERDIAIMOB L,'                                                                                           + #13 +
   '         PARAMALIENACAO P,'                                                                                            + #13 +
   '         ('                                                                                                            + #13 +
   '          SELECT'                                                                                                      + #13 +
   '              L2.IDPARCFINANCIMOV,'                                                                                    + #13 +
   '              MAX(L2.DATAOPER) AS DTAPUR'                                                                              + #13 +
   '          FROM'                                                                                                        + #13 +
   '              LANCOPERDIAIMOB L2,'                                                                                     + #13 +
   '              PARAMALIENACAO P2'                                                                                       + #13 +
   '          WHERE P2.IDPESSOA = 1'                                                                                       + #13 +
   '          AND L2.IDMODULO = 135'                                                                                       + #13 +
   '          AND L2.IDOPERACAO = P2.IDOPERATUALRES'                                                                       + #13 +
   '          AND L2.DATAOPER <= ' + OraData(dData)                                                                        + #13;

   if iContrato > 0 then
      sSQL := sSQL + '          AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                          + #13;

   sSQL := sSQL +
   '          GROUP BY L2.IDPARCFINANCIMOV ) D'                                                                            + #13 +
   '     WHERE L.DATAOPER = D.DTAPUR'                                                                                      + #13 +
   '     AND L.IDPARCFINANCIMOV = D.IDPARCFINANCIMOV'                                                                      + #13 +
   '     AND P.IDPESSOA = 1'                                                                                               + #13 +
   '     AND L.IDMODULO = 135'                                                                                             + #13 +
   '     AND L.IDOPERACAO = P.IDOPERATUALRES'                                                                              + #13;

   if iContrato > 0 then
      sSQL := sSQL + '     AND L.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                                + #13;

   sSQL := sSQL +
   '     GROUP BY L.IDPARCFINANCIMOV'                                                                                      + #13 +
   '    ) AR,'                                                                                                             + #13 +
   '    ('                                                                                                                 + #13 +
   '     SELECT /*+ INDEX(LD) INDEX(RP) INDEX (C) */'                                                                      + #13 +
   '         IDPARCFINANCIMOV,'                                                                                            + #13 +
   '         DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO,'                     + #13 +
   '         DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM(LD.VALOR) ) AS VLRPAGO'                                      + #13 +
   '     FROM'                                                                                                             + #13 +
   '         PARCFINANCIMOV P,'                                                                                            + #13 +
   '         LANCTODOCUM LD,'                                                                                              + #13 +
   '         RECBTOPAGTO RP,'                                                                                              + #13 +
   '         CONDPAGIMOVEL C'                                                                                              + #13 +
   '     WHERE'                                                                                                            + #13 +
   '         P.CODDOCUMENTO  = LD.CODDOCUMENTO(+)'                                                                         + #13 +
   '     AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+)'                                                                         + #13 +
   '     AND LD.NUMLANCTO    = RP.NUMLANCTO(+)'                                                                            + #13 +
   '     AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO <= ' + OraData(dData)+ ' ) OR'                                 + #13 +
   '          (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPERACAO) = ''5'' OR LD.CODALTERADOR = 215 )'                     + #13 +
   '                                      AND LD.ESTORNO IS NULL'                                                          + #13 +
   '                                      AND LD.DATALANCTO <= '  + OraData(dData) + ') )'                                 + #13 +
   '     AND P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL'                                                                        + #13;

   if iContrato > 0 then
      sSQL := sSQL + '     AND C.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                                + #13;

   sSQL := sSQL +
   '     GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO'                                                                        + #13 +
   '    ) PP,'                                                                                                             + #13 +
   '    ('                                                                                                                 + #13 +
   '     SELECT /*+ INDEX(A) */ A.IDCONDINICIAL  AS IDCONDINICIAL,'                                                        + #13 +
   '         A.NUMPARCELAS AS NUMPARCELAS,'                                                                                + #13 +
   '         A.DATAINI,'                                                                                                   + #13 +
   '         A.IDCONDPAGIMOVEL'                                                                                            + #13 +
   '     FROM'                                                                                                             + #13 +
   '         CONDPAGIMOVEL A,'                                                                                             + #13 +
   '         ('                                                                                                            + #13 +
   '          SELECT /*+ INDEX(CONDPAGIMOVEL) */'                                                                          + #13 +
   '              IDCONDINICIAL,'                                                                                          + #13 +
   '              MAX(DATAINI) AS DATAINI'                                                                                 + #13 +
   '          FROM CONDPAGIMOVEL'                                                                                          + #13;

   if iContrato > 0 then
      sSQL := sSQL + '          WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                                + #13;

   sSQL := sSQL +
   '          GROUP BY IDCONDINICIAL) B'                                                                                   + #13 +
   '     WHERE B.IDCONDINICIAL = A.IDCONDINICIAL'                                                                          + #13 +
   '     AND B.DATAINI       = A.DATAINI'                                                                                  + #13;

   if iContrato > 0 then
      sSQL := sSQL + '     AND A.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                                + #13;

   sSQL := sSQL +
   '    ) CPFINAL,'                                                                                                        + #13 +
   '    ('                                                                                                                 + #13 +
   '     SELECT'                                                                                                           + #13 +
   '         D1.IDPARCFINANCIMOV,'                                                                                         + #13 +
   '         D2.DTAPUR,'                                                                                                   + #13 +
   '         D1.VLRCORRIGIDOATRASO'                                                                                        + #13 +
   '     FROM'                                                                                                             + #13 +
   '         ('                                                                                                            + #13 +
   '          SELECT /*+ INDEX(L) INDEX(P) */'                                                                             + #13 +
   '              L.IDPARCFINANCIMOV,'                                                                                     + #13 +
   '              L.DATAOPER,'                                                                                             + #13 +
   '              SUM(L.VLRACUM) AS VLRCORRIGIDOATRASO'                                                                    + #13 +
   '          FROM'                                                                                                        + #13 +
   '              LANCOPERDIAIMOB L,'                                                                                      + #13 +
   '              PARAMALIENACAO P'                                                                                        + #13 +
   '          WHERE'                                                                                                       + #13 +
   '              (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                                                                   + #13 +
   '          AND ( L.IDOPERACAO = P.IDOPERATUALCM )'                                                                      + #13 +
   '          AND L.DATABAIXA IS NOT NULL'                                                                                 + #13;

   if iContrato > 0 then
      sSQL := sSQL + '          AND L.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                           + #13;

   sSQL := sSQL +
   '          GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER'                                                                     + #13 +
   '         ) D1,'                                                                                                        + #13 +
   '         ('                                                                                                            + #13 +
   '          SELECT /*+ INDEX(L2) INDEX(P2) */'                                                                           + #13 +
   '              L2.IDPARCFINANCIMOV,'                                                                                    + #13 +
   '              MAX(L2.DATAOPER) AS DTAPUR'                                                                              + #13 +
   '          FROM'                                                                                                        + #13 +
   '              LANCOPERDIAIMOB L2,'                                                                                     + #13 +
   '              PARAMALIENACAO P2'                                                                                       + #13 +
   '          WHERE'                                                                                                       + #13 +
   '              (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                                                                   + #13 +
   '          AND ( L2.IDOPERACAO = P2.IDOPERATUALCM )'                                                                    + #13 +
   '          AND ( DATAOPER <= ' + OraData(dData) + ')'                                                                   + #13 +
   '          AND L2.DATABAIXA IS NOT NULL'                                                                                + #13;

   if iContrato > 0 then
      sSQL := sSQL + '          AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                          + #13;

   sSQL := sSQL +
   '          GROUP BY L2.IDPARCFINANCIMOV'                                                                                + #13 +
   '         ) D2'                                                                                                         + #13 +
   '     WHERE'                                                                                                            + #13 +
   '         D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV'                                                                    + #13 +
   '     AND D1.DATAOPER = D2.DTAPUR'                                                                                      + #13 +
   '    ) CMA,'                                                                                                            + #13 +
   '    ('                                                                                                                 + #13 +
   '      SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTAATRASO'                                                        + #13 +
   '      FROM ( SELECT /*+ INDEX(L) INDEX(P) */'                                                                          + #13 +
   '                 L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMULTAATRASO'                                     + #13 +
   '             FROM LANCOPERDIAIMOB L, PARAMALIENACAO P'                                                                 + #13 +
   '             WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                                                              + #13 +
   '             AND ( L.IDOPERACAO = P.IDOPERATUALMULTA )'                                                                + #13 +
   '             AND L.DATABAIXA IS NOT NULL'                                                                              + #13;

   if iContrato > 0 then
      sSQL := sSQL + '          AND L.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                           + #13;

   sSQL := sSQL +
   '             GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,'                                                            + #13 +
   '           ( SELECT /*+ INDEX(L2) INDEX(P2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR'                         + #13 +
   '             FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2'                                                               + #13 +
   '             WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                                                              + #13 +
   '             AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA )'                                                              + #13 +
   '             AND ( DATAOPER <= ' + OraData(dData) + ')'                                                                + #13 +
   '             AND L2.DATABAIXA IS NOT NULL'                                                                             + #13;

   if iContrato > 0 then
      sSQL := sSQL + '          AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                          + #13;

   sSQL := sSQL +
   '             GROUP BY L2.IDPARCFINANCIMOV ) D2'                                                                        + #13 +
   '      WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV'                                                                 + #13 +
   '      AND D1.DATAOPER = D2.DTAPUR'                                                                                     + #13 +
   '    ) MA,'                                                                                                             + #13 +
   '    ('                                                                                                                 + #13 +
   '     SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORAATRASO'                                                          + #13 +
   '     FROM ( SELECT /*+ INDEX(L) INDEX(P) */'                                                                           + #13 +
   '                L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMORAATRASO'                                       + #13 +
   '            FROM LANCOPERDIAIMOB L, PARAMALIENACAO P'                                                                  + #13 +
   '            WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                                                               + #13 +
   '            AND ( L.IDOPERACAO = P.IDOPERATUALJUROS )'                                                                 + #13 +
   '            AND L.DATABAIXA IS NOT NULL'                                                                               + #13;

   if iContrato > 0 then
      sSQL := sSQL + '          AND L.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                           + #13;

   sSQL := sSQL +
   '            GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,'                                                             + #13 +
   '          ( SELECT /*+ INDEX(L2) INDEX(P2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR'                          + #13 +
   '            FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2'                                                                + #13 +
   '            WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                                                               + #13 +
   '            AND L2.IDOPERACAO = P2.IDOPERATUALJUROS '                                                                  + #13 +
   '            AND DATAOPER <= ' + OraData(dData)                                                                         + #13 +
   '            AND L2.DATABAIXA IS NOT NULL '                                                                             + #13;

   if iContrato > 0 then
      sSQL := sSQL + '            AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                        + #13;

   sSQL := sSQL +
   '            GROUP BY L2.IDPARCFINANCIMOV ) D2'                                                                         + #13 +
   '     WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV'                                                                  + #13 +
   '     AND D1.DATAOPER = D2.DTAPUR'                                                                                      + #13 +
   '    ) JA,'                                                                                                             + #13 +
   '    ('                                                                                                                 + #13 +
   '      SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRCORRIGIDOSALDO'                                                     + #13 +
   '      FROM ( SELECT /*+ INDEX(L) INDEX(P) */'                                                                          + #13 +
   '                  L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRCORRIGIDOSALDO'                                 + #13 +
   '             FROM LANCOPERDIAIMOB L, PARAMALIENACAO P'                                                                 + #13 +
   '             WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                                                              + #13 +
   '             AND ( L.IDOPERACAO = P.IDOPERATUALCM )'                                                                   + #13 +
   '             AND L.DATABAIXA IS NULL'                                                                                  + #13;

   if iContrato > 0 then
      sSQL := sSQL + '             AND L.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                         + #13;

   sSQL := sSQL +
   '             GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,'                                                            + #13 +
   '           ( SELECT /*+ INDEX(L2) INDEX(P2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR'                         + #13 +
   '             FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2'                                                               + #13 +
   '             WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                                                              + #13 +
   '             AND  L2.IDOPERACAO = P2.IDOPERATUALCM '                                                                   + #13 +
   '             AND  DATAOPER <= ' + OraData(dData)                                                                       + #13 +
   '             AND L2.DATABAIXA IS NULL'                                                                                 + #13;

   if iContrato > 0 then
      sSQL := sSQL + '             AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                       + #13;

   sSQL := sSQL +
   '             GROUP BY L2.IDPARCFINANCIMOV ) D2'                                                                        + #13 +
   '      WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV'                                                                 + #13 +
   '             AND D1.DATAOPER = D2.DTAPUR'                                                                              + #13 +
   '    ) CMS,'                                                                                                            + #13 +
   '    ('                                                                                                                 + #13 +
   '      SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTASALDO'                                                         + #13 +
   '      FROM ( SELECT /*+ INDEX(L) INDEX(P) */'                                                                          + #13 +
   '                 L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMULTASALDO'                                      + #13 +
   '             FROM LANCOPERDIAIMOB L, PARAMALIENACAO P'                                                                 + #13 +
   '             WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                                                              + #13 +
   '             AND ( L.IDOPERACAO = P.IDOPERATUALMULTA )'                                                                + #13 +
   '             AND L.DATABAIXA IS NULL'                                                                                  + #13;

   if iContrato > 0 then
      sSQL := sSQL + '             AND L.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                        + #13;

   sSQL := sSQL +
   '             GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,'                                                            + #13 +
   '           ( SELECT /*+ INDEX(L2) INDEX(P2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR'                         + #13 +
   '             FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2'                                                               + #13 +
   '             WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                                                              + #13 +
   '             AND L2.IDOPERACAO = P2.IDOPERATUALMULTA'                                                                  + #13 +
   '             AND DATAOPER <= ' + OraData(dData)                                                                        + #13 +
   '             AND L2.DATABAIXA IS NULL'                                                                                 + #13;

   if iContrato > 0 then
      sSQL := sSQL + '             AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                       + #13;

   sSQL := sSQL +
   '             GROUP BY L2.IDPARCFINANCIMOV ) D2'                                                                        + #13 +
   '      WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV'                                                                 + #13 +
   '      AND D1.DATAOPER = D2.DTAPUR'                                                                                     + #13 +
   '    ) MS,'                                                                                                             + #13 +
   '    ('                                                                                                                 + #13 +
   '     SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORASALDO'                                                           + #13 +
   '     FROM ( SELECT /*+ INDEX(L) INDEX(P) */'                                                                           + #13 +
   '                L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMORASALDO'                                        + #13 +
   '            FROM LANCOPERDIAIMOB L, PARAMALIENACAO P'                                                                  + #13 +
   '            WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                                                               + #13 +
   '            AND ( L.IDOPERACAO = P.IDOPERATUALJUROS )'                                                                 + #13 +
   '            AND L.DATABAIXA IS NULL'                                                                                   + #13;

   if iContrato > 0 then
      sSQL := sSQL + '             AND L.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                        + #13;

   sSQL := sSQL +
   '            GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,'                                                             + #13 +
   '          ( SELECT /*+ INDEX(L2) INDEX(P2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR'                          + #13 +
   '            FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2'                                                                + #13 +
   '            WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                                                               + #13 +
   '            AND L2.IDOPERACAO = P2.IDOPERATUALJUROS'                                                                   + #13 +
   '            AND DATAOPER <= ' + OraData(dData)                                                                         + #13 +
   '            AND L2.DATABAIXA IS NULL'                                                                                  + #13;

   if iContrato > 0 then
      sSQL := sSQL + '             AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                       + #13;

   sSQL := sSQL +
   '            GROUP BY L2.IDPARCFINANCIMOV ) D2'                                                                         + #13 +
   '     WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV'                                                                  + #13 +
   '     AND D1.DATAOPER = D2.DTAPUR'                                                                                      + #13 +
   '    ) JS,'                                                                                                             + #13 +
   '    ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_ABONO'                                                             + #13 +
   '    FROM ( SELECT /*+ INDEX(L) INDEX(P) */'                                                                            + #13 +
   '               L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS TOT_ABONO'                                            + #13 +
   '           FROM LANCOPERDIAIMOB L, PARAMALIENACAO P'                                                                   + #13 +
   '           WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                                                                + #13 +
   '             AND L.IDMODULO = 135'                                                                                     + #13 +
   '             AND ( L.IDOPERACAO = P.IDOPERABONOMULTA OR'                                                               + #13 +
   '                   L.IDOPERACAO = P.IDOPERABONOJUROS OR'                                                               + #13 +
   '                   L.IDOPERACAO = P.IDOPERABONOCM )'                                                                   + #13;

   if iContrato > 0 then
      sSQL := sSQL + '             AND L.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                       + #13;

   sSQL := sSQL +
   '           GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,'                                                              + #13 +
   '        ( SELECT /*+ INDEX(L2) INDEX(P2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR'                            + #13 +
   '            FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2'                                                                + #13 +
   '           WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                                                                + #13 +
   '             AND L2.IDMODULO = 135'                                                                                    + #13 +
   '             AND ( L2.IDOPERACAO = P2.IDOPERABONOMULTA OR'                                                             + #13 +
   '                   L2.IDOPERACAO = P2.IDOPERABONOJUROS OR'                                                             + #13 +
   '                   L2.IDOPERACAO = P2.IDOPERABONOCM )'                                                                 + #13 +
   '             AND DATAOPER <= '+ OraData(dData)                                                                         + #13;

   if iContrato > 0 then
      sSQL := sSQL + '             AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                       + #13;

   sSQL := sSQL +
   '          GROUP BY L2.IDPARCFINANCIMOV ) D2'                                                                           + #13 +
   '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV'                                                               + #13 +
   '          AND D1.DATAOPER = D2.DTAPUR'                                                                                 + #13 +
   '    ) ABONO,'                                                                                                          + #13 +
   '    ( SELECT DISTINCT'                                                                                                 + #13 +
   '             CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,'                                                                + #13 +
   '             M.IMONOME   AS NOMEMESTRE,'                                                                               + #13 +
   '             M.IDIMOVEL  AS IDIMOVELMESTRE,'                                                                           + #13 +
   '             C.UF        AS UF,'                                                                                       + #13 +
   '             TRIM(I.CODTIPIMOVEL) AS SEGMENTO'                                                                         + #13 +
   '        FROM CONTRATOXIMOVEL CXI,'                                                                                     + #13 +
   '             IMOVEL I,'                                                                                                + #13 +
   '             IMOVEL M,'                                                                                                + #13 +
   '             CIDADES C'                                                                                                + #13 +
   '       WHERE CXI.IDIMOVEL = I.IDIMOVEL'                                                                                + #13 +
   '        AND  M.IDCIDADES = C.IDCIDADES(+)'                                                                             + #13 +
   '        AND  I.IDIMOVELMESTRE = M.IDIMOVEL'                                                                            + #13;

   if iContrato > 0 then
      sSQL := sSQL + '        AND CXI.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                           + #13;

   sSQL := sSQL +
   '       ) IM'                                                                                                           + #13 +
   '  WHERE (PF.FLGTIPOLANC IN (1,2,3,4,5,6,7,8,9,10,12))'                                                                         + #13 +
   '    AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)'                                                                     + #13 +
   '    AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'                                                                   + #13 +
   '    AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)'                                                                 + #13 +
   '    AND (PP.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'                                                                + #13 +
   '    AND (PF.IDPARCFINANCIMOV = MA.IDPARCFINANCIMOV(+))'                                                                + #13 +
   '    AND (PF.IDPARCFINANCIMOV = JA.IDPARCFINANCIMOV(+))'                                                                + #13 +
   '    AND (PF.IDPARCFINANCIMOV = CMA.IDPARCFINANCIMOV(+))'                                                               + #13 +
   '    AND (PF.IDPARCFINANCIMOV = MS.IDPARCFINANCIMOV(+))'                                                                + #13 +
   '    AND (PF.IDPARCFINANCIMOV = JS.IDPARCFINANCIMOV(+))'                                                                + #13 +
   '    AND (PF.IDPARCFINANCIMOV = CMS.IDPARCFINANCIMOV(+))'                                                               + #13 +
   '    AND (PF.IDPARCFINANCIMOV = ABONO.IDPARCFINANCIMOV(+))'                                                             + #13 +
   '    AND (AR.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'                                                                + #13 +
   '    AND (CR.IDPARCCOBRADA(+)    = PF.IDPARCFINANCIMOV)'                                                                + #13 +
   '    AND (ALT.CODDOCUMENTO(+) = PF.CODDOCUMENTO)'                                                                       + #13 +
   '    AND (CD2.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '                                                              + #13 +
   '    AND (P.IDPESSOA(+) = CI.IDLOCATARIO)'                                                                              + #13 +
   '    AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)'                                                                + #13 +
   '    AND ( (PF.DATAVENCIMENTO IS NULL) OR (PF.DATAVENCIMENTO <= '+ OraData(dData) +') OR'                               + #13 +
   '          (PP.DATAPAGAMENTO <= ' + OraData(dData) + ') )'                                                              + #13;

   if iContrato > 0 then
       sSQL := sSQL + '    AND ( CP.IDCONTRATOIMOVEL = ' + IntToStr(iContrato) + ') ' + #13;

// Daniel - 18795 - Início -----------------------------------------------------
   if iTipoRelat = 0 then
       sSQL := sSQL + '   AND ( CI.FLGTIPOCONTRATO  = ''C'' OR CI.FLGTIPOCONTRATO = ''P'' ) ' + #13
   else
       sSQL := sSQL + '   AND ( CI.FLGTIPOCONTRATO  = ''A'' OR CI.FLGTIPOCONTRATO = ''P'' ) ' + #13;
// Daniel - 18795 - Fim --------------------------------------------------------

   if sSegmento <> '' then
       sSQL := sSQL + '    AND ( IM.SEGMENTO = ' + QuotedStr(sSegmento) + ') ' + #13;

   sSQL := sSQL +
   '  ORDER BY IM.SEGMENTO, CI.CONNUMERO, PF.IDCONDPAGIMOVEL, DATAVENCIMENTO, PF.FLGTIPOLANC, NUMPARCELA' + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlRelAlienacao.LookupContratosEstoque(const sSegmento: String; const iContrato: Integer; const iTipoRelat : Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT DISTINCT '                                                                   + #13 +
   '       CI.IDCONTRATOIMOVEL, '                                                       + #13 +
   '       CI.CONNUMERO, '                                                              + #13 +
   '       CI.CONNOME, '                                                                + #13 +
   '       P.RAZAOSOCIAL, '                                                             + #13 +
   '       IM.SEGMENTO,  '                                                              + #13 +
   '       0 AS VALOR, '                                                                + #13 +
   '       0 AS SALDOINICIAL, '                                                         + #13 +
   '       0 AS CORR_INAD, '                                                            + #13 +
   '       0 AS JUROS_INAD, '                                                           + #13 +
   '       0 AS MULTA_INAD, '                                                           + #13 +
   '       0 AS RESIDUO, '                                                              + #13 +
   '       0 AS JUROS_MES, '                                                            + #13 +
   '       0 AS CORRRESID_MES, '                                                        + #13 +
   '       0 AS CORRSALDO_MES, '                                                        + #13 +
   '       0 AS RECEBIMENTOS, '                                                         + #13 +
   '       0 AS SALDOFINAL '                                                            + #13 +
   '  FROM '                                                                            + #13 +
   '       CONTRATOIMOVEL CI, '                                                         + #13 +
   '       PESSOA P, '                                                                  + #13 +

   '       ( SELECT DISTINCT '                                                          + #13 +
   '                CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '                         + #13 +
   '                M.IMONOME            AS NOMEMESTRE, '                               + #13 +
   '                M.IDIMOVEL           AS IDIMOVEL, '                                 + #13 +
   '                I.CODTIPIMOVEL       AS SEGMENTO '                                  + #13 +
   '           FROM CONTRATOXIMOVEL CXI, '                                              + #13 +
   '                IMOVEL I, '                                                         + #13 +
   '                IMOVEL M '                                                          + #13 +
   '          WHERE CXI.IDIMOVEL = I.IDIMOVEL '                                         + #13 +
   '            AND I.IDIMOVELMESTRE = M.IDIMOVEL '                                     + #13 +
   '       ) IM '                                                                       + #13 +

   ' WHERE  (P.IDPESSOA(+) = CI.IDLOCATARIO) '                                          + #13 +
   '    AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL) '                            + #13 +
   '    AND (CI.FLGSTATUS = ''V'' ) '                                                   + #13;

   if iContrato > 0 then
       sSQL := sSQL + '   AND ( CI.IDCONTRATOIMOVEL = ' + IntToStr(iContrato) + ') ' + #13;

// Daniel - 18795 - Início -----------------------------------------------------
   if iTipoRelat = 0 then
       sSQL := sSQL + '   AND ( CI.FLGTIPOCONTRATO  = ''C'' OR CI.FLGTIPOCONTRATO  = ''P'' ) ' + #13
   else
       sSQL := sSQL + '   AND ( CI.FLGTIPOCONTRATO  = ''A'' OR CI.FLGTIPOCONTRATO  = ''P'' ) ' + #13;
// Daniel - 18795 - Fim --------------------------------------------------------

   if sSegmento <> '' then
      sSQL := sSQL + '    AND ( IM.SEGMENTO = ' + QuotedStr(sSegmento) + ') ' + #13;

    sSQL := sSQL +
   '  ORDER BY IM.SEGMENTO, CI.CONNUMERO ' + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlRelAlienacao.SelecionaTotalResiduo(const iContrato: Integer; const dData: TDateTime): OleVariant;
var
   sSQL : String;
begin
   sSQL := sSQL +
   'SELECT /*+ INDEX (L) */                 '                                                                  + #13 +
   '      L.IDCONTRATOIMOVEL, NVL(SUM(L.VLRACUM),0) AS VLRRESIDUOCORRIG   '                                    + #13 +
   ' FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,                     '                                           + #13 +
   '      ( SELECT MAX(L2.DATAOPER) AS DTAPUR '                                                                + #13 +
   '          FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2      '                                                + #13 +
   '         WHERE P2.IDPESSOA = 1 '                                                                           + #13 +
   '           AND L2.IDMODULO = 135'                                                                          + #13 +
   '           AND ( L2.IDOPERACAO = P2.IDOPERATUALRES )      '                                                + #13 +
   '           AND ( DATAOPER <= '+ OraData(dData) + ')'                                                       + #13;

   if iContrato > 0 then
      sSQL := sSQL + '           AND L2.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                             + #13;

   sSQL := sSQL +
   '          ) D                         '                                                                    + #13 +
   'WHERE L.DATAOPER = D.DTAPUR                      '                                                         + #13 +
   '  AND P.IDPESSOA = 1                   '                                                                   + #13 +
   '  AND L.IDMODULO = 135'                                                                                    + #13 +
   '  AND ( L.IDOPERACAO = P.IDOPERATUALRES )        '                                                         + #13;

   if iContrato > 0 then
      sSQL := sSQL + '  AND L.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                                       + #13;

   sSQL := sSQL + 'GROUP BY L.IDCONTRATOIMOVEL '                                                               + #13;

   Result := GetDataPacket(sSQL);
end;


function TCtrlRelAlienacao.LookupAbonos(const iContrato  : Integer;
                                        const sSegmento  : String;
                                        const sDataIni   : String;
                                        const sDataFim   : String;
                                        const sTipoAbono : String): OleVariant;
var sSql, sParam : String;
begin
  sParam := '';
  If iContrato         > 0   then sParam := sParam + ' AND CI.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)   + #13;
  If Trim(sSegmento)  <> ''  then sParam := sParam + ' AND SE.CODTIPIMOVEL     = ' + QuotedStr(sSegmento)  + #13;
  If Trim(sTipoAbono) <> ''  then sParam := sParam + ' AND CD.FLGTIPO          = ' + QuotedStr(sTipoAbono) + #13;
  If (trim(sDataIni)  <> '') and (trim(sDataFim) <> '') then
    sParam := sParam + ' AND CD.DATA BETWEEN ' + QuotedStr(sDataIni) + ' AND ' + QuotedStr(sDataFim)  + #13;

   sSQL := sSQL +
   'SELECT /* Relat. de abonos */            '                                                 + #13 +
   '       SE.CODTIPIMOVEL,                  '                                                 + #13 +
   '       SE.DESCTIPOIMOVEL,                '                                                 + #13 +
   '       CI.IDCONTRATOIMOVEL,              '                                                 + #13 +
   '       CI.CONNUMERO,                     '                                                 + #13 +
   '       CI.CONNOME,                       '                                                 + #13 +
   '       P.NUMPARCELA,                     '                                                 + #13 +
   '       CD.IDPARCFINANCIMOV,              '                                                 + #13 +
   '       CD.DATA,                          '                                                 + #13 +
   '       CD.TRGDTINCLUSAO,                 '                                                 + #13 +
   '       PU.NOME AS NOME_USUARIO,          '                                                 + #13 +
   '       CD.FLGTIPO,                       '                                                 + #13 +
   '       DECODE(CD.FLGTIPO, ''E'', ''Resíduo'', '                                            + #13 +
   '                          ''T'', ''Inadimplência Total'', '                                + #13 +
   '                          ''M'', ''Multa'',               '                                + #13 +
   '                          ''J'', ''Juros'',               '                                + #13 +
   '                          ''C'', ''Correção Monetária'',  '                                + #13 +
   '                          ''R'', ''Repactuação Contratual'', '                             + #13 +
   '                          ''A'', ''Geração de Cobrança'' ) AS DSC_ABONO, '                 + #13 +
   '       ROUND(CD.DIFVLR,2) AS VLR_ABONO,                                  '                 + #13 +
   '       CD.MOTIVO                                                         '                 + #13 +
   '  FROM CONCILIADOC CD, PARCFINANCIMOV P, CONDPAGIMOVEL CP, CONTRATOIMOVEL CI, PESSOA PU, ' + #13 +
   '       ( SELECT DISTINCT CXI.IDCONTRATOIMOVEL, I.CODTIPIMOVEL, T.DESCTIPOIMOVEL          ' + #13 +
   '           FROM CONTRATOXIMOVEL CXI, IMOVEL I, TIPOIMOVEL T                              ' + #13 +
   '          WHERE I.CODTIPIMOVEL = T.CODTIPIMOVEL                                          ' + #13 +
   '            AND CXI.IDIMOVEL = I.IDIMOVEL ) SE                                           ' + #13 +
   ' WHERE CD.IDPARCFINANCIMOV = P.IDPARCFINANCIMOV                                          ' + #13 +
   '   AND CD.IDUSUARIO        = PU.IDPESSOA                                                 ' + #13 +
   '   AND P.IDCONDPAGIMOVEL   = CP.IDCONDPAGIMOVEL                                          ' + #13 +
   '   AND CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL                                         ' + #13 +
   '   AND CI.IDCONTRATOIMOVEL = SE.IDCONTRATOIMOVEL                                         ' + #13 +
   '   AND CD.IDPARCFINANCIMOV IS NOT NULL ' + sParam                                          + #13 +
   'ORDER BY CODTIPIMOVEL, CONNUMERO, DATA                                                   ' + #13;

   Result := GetDataPacket(sSQL);

end;


function TCtrlRelAlienacao.LookupParcelas(const iParcFinancImov: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL := 'SELECT * FROM PARCFINANCIMOV ' + #13 +
           'WHERE IDPARCFINANCIMOV = ' + IntToStr(iParcFinancImov);

   Result := GetDataPacket(sSQL);
end;



function TCtrlRelAlienacao.LookupAtualizaInad(const iContrato: Integer; dDataInicio, dDataFinal: TDateTime): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                                     + #13 +
   '    VLRCORRIGIDOCM,'                                                        + #13 +
   '    VLRCORRIGIDOMULTA,'                                                     + #13 +
   '    VLRCORRIGIDOJUROS,'                                                     + #13 +
   '    VLRCORRIGIDORES,'                                                       + #13 +
   '    VLRPAGO'                                                                + #13 +
   'FROM'                                                                       + #13 +
   '    ('                                                                      + #13 +
   '     SELECT /*+ INDEX(L) INDEX(P) */'                                       + #13 +
   '         SUM(L.VLRDIA) AS VLRCORRIGIDOCM'                                   + #13 +
   '     FROM'                                                                  + #13 +
   '         LANCOPERDIAIMOB L,'                                                + #13 +
   '         PARAMALIENACAO P'                                                  + #13 +
   '     WHERE'                                                                 + #13 +
   '         (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                             + #13 +
   '     AND L.IDOPERACAO = P.IDOPERATUALCM'                                    + #13 +
   '     AND DATAOPER > ' + OraData(dDataInicio)                                + #13 +
   '     AND DATAOPER <= ' + OraData(dDataFinal)                                + #13 +
   '     AND L.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                       + #13 +
   '    ) CM,'                                                                  + #13 +
   '   ('                                                                       + #13 +
   '     SELECT /*+ INDEX(L) INDEX(P) */'                                       + #13 +
   '         SUM(L.VLRDIA) AS VLRCORRIGIDOMULTA'                                + #13 +
   '     FROM'                                                                  + #13 +
   '         LANCOPERDIAIMOB L,'                                                + #13 +
   '         PARAMALIENACAO P'                                                  + #13 +
   '     WHERE'                                                                 + #13 +
   '         (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                             + #13 +
   '     AND L.IDOPERACAO = P.IDOPERATUALMULTA'                                 + #13 +
   '     AND DATAOPER > ' + OraData(dDataInicio)                                + #13 +
   '     AND DATAOPER <= ' + OraData(dDataFinal)                                + #13 +
   '     AND L.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                       + #13 +
   '    ) MULTA,'                                                               + #13 +
   '    ('                                                                      + #13 +
   '     SELECT /*+ INDEX(L) INDEX(P) */'                                       + #13 +
   '         SUM(L.VLRDIA) AS VLRCORRIGIDOJUROS'                                + #13 +
   '     FROM'                                                                  + #13 +
   '         LANCOPERDIAIMOB L,'                                                + #13 +
   '         PARAMALIENACAO P'                                                  + #13 +
   '     WHERE'                                                                 + #13 +
   '         (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                             + #13 +
   '     AND L.IDOPERACAO = P.IDOPERATUALJUROS'                                 + #13 +
   '     AND DATAOPER > ' + OraData(dDataInicio)                                + #13 +
   '     AND DATAOPER <= ' + OraData(dDataFinal)                                + #13 +
   '     AND L.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                       + #13 +
   '    ) JUROS,'                                                               + #13 +
   '    ('                                                                      + #13 +
   '     SELECT /*+ INDEX(L) INDEX(P) */'                                       + #13 +
   '         SUM(L.VLRDIA) AS VLRCORRIGIDORES'                                  + #13 +
   '     FROM'                                                                  + #13 +
   '         LANCOPERDIAIMOB L,'                                                + #13 +
   '         PARAMALIENACAO P'                                                  + #13 +
   '     WHERE'                                                                 + #13 +
   '         (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'                             + #13 +
   '     AND L.IDOPERACAO = P.IDOPERATUALRES'                                   + #13 +
   '     AND DATAOPER > ' + OraData(dDataInicio)                                + #13 +
   '     AND DATAOPER <= ' + OraData(dDataFinal)                                + #13 +
   '     AND L.IDCONTRATOIMOVEL = ' + IntToStr(iContrato)                       + #13 +
   '    ) CR,'                                                                  + #13 +
   '   (' + #13 +
   '     SELECT /*+ INDEX(LD) INDEX(RP) INDEX (C) */' + #13 +
   '      SUM(DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM(LD.VALOR))) AS VLRPAGO' + #13 +
   '  FROM' + #13 +
   '      PARCFINANCIMOV P,' + #13 +
   '      LANCTODOCUM LD,' + #13 +
   '      RECBTOPAGTO RP,' + #13 +
   '      CONDPAGIMOVEL C' + #13 +
   '  WHERE' + #13 +
   '      P.CODDOCUMENTO  = LD.CODDOCUMENTO(+)' + #13 +
   '  AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+)' + #13 +
   '  AND LD.NUMLANCTO    = RP.NUMLANCTO(+)' + #13 +
   '  AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO > ' + OraData(dDataInicio) + ' AND DATAPAGAMENTO < = ' + OraData(dDataFinal) + ' ) OR' + #13 +
   '       (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPERACAO) = ''5'' OR LD.CODALTERADOR = 215 )' + #13 +
   '                                   AND LD.ESTORNO IS NULL' + #13 +
   '                                   AND LD.DATALANCTO > ' + OraData(dDataInicio) + ' AND LD.DATALANCTO <= '+ OraData(dDataFinal) + ' ) )' + #13 +
   '  AND P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL' + #13 +
   '  AND C.IDCONTRATOIMOVEL = ' + IntToStr(iContrato) + #13 +
   '  GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO) PP' + #13;

   Result := GetDataPacket(sSQL);
end;



end.

