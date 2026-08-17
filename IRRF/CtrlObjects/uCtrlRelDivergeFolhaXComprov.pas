//******************************************************************************************
//N. Sol..........: 219009
//N. Kintana......: 2053987
//Data............: 26/11/2013
//Responsável.....: Marcio Sanches Spinosa SOL 219009 Kintana 2053987
//Descrição.......: Ajuste no sql de apresentação de dados
//******************************************************************************************
//N. Sol..........: 159720
//N. Kintana......: 1789355
//Data............: 23/10/2012
//Responsável.....: Paulo / Thiago / Fábio
//Descrição.......: Tela de filtro para a impressão do Relatório de
//                  Divergências - Folha x Comprovante Rendimento
//******************************************************************************************
Unit uCtrlRelDivergeFolhaXComprov;

Interface

Uses uCmControlObject, uCmDbObject,  ucmFileUtils, SysUtils, uCtrlFuncoesRH;

Type
   TCtrlRelDivergeFolhaXComprov = Class(TCmControlObject)
   Private
      CtrlFuncoesRH: TCtrlFuncoesRH;
   Protected
   Public
      Function Listar_CPF(Ano, DocumentosFormatados, NaturezasFormatadas, Totalizadores: String): OleVariant;
      Procedure Prepara_Folha_Comprovante(Ano, Totalizadores, NaturezasFormatados: String);
      Function Listar_Folha_Comprovante(CPF: String): OleVariant;
      Function Listar_Cabecalho(Ano, CPF: String): OleVariant;
   End;

Implementation

{ TCtrlRelDivergeFolhaXComprov }

Function TCtrlRelDivergeFolhaXComprov.Listar_Cabecalho(Ano, CPF: String): OleVariant;
Var
   tSql: String;
Begin
   tSql :=
      '-- SQL PARA SOMENTE O CABEÇALHO' + #13#10 +
      'SELECT SUBSTR(H.MESCOBRANCA, 1, 4) AS ANO,' + #13#10 +
      '       P.NUMDOCUMENTO AS CPF,' + #13#10 +
      '       D.MATRICULA,' + #13#10 +
      '       D.IDPESSOA,' + #13#10 +
      '       pf.Datamolestiagrave,' + #13#10 +
      '       pf.Datafimmolestia,' + #13#10 +
      '       pf.datamorte,' + #13#10 +
      '       DATA_FUNCEF.DATA AS DIB_FUNCEF,' + #13#10 +
      '       DATA_INSS.DATA AS DIB_INSS,' + #13#10 +
      '       P.NOME AS NOME,' + #13#10 +
      '       PF.DATANASC,' + #13#10 +
      '       TRUNC((MONTHS_BETWEEN(''31/12/' + Ano + ''', PF.DATANASC) / 12), 0) AS IDADE_DEZ,' + #13#10 +
      '       SITPROCESSO,' + #13#10 +
      '       TO_CHAR(DATAINICIO, ''DD/MM/YYYY'') DATAINICIO,' + #13#10 +
      '       TO_CHAR(DATAFINAL, ''DD/MM/YYYY'') DATAFINAL,' + #13#10 +
      '       TO_CHAR(PERCACAO) PERACAO,' + #13#10 +
      '       TO_CHAR(FLGFAZDEPOSITO) FLGFAZDEPOSITO,' + #13#10 +
      '       TIPOACAO' + #13#10 +
      '  FROM PROVDESC PR,' + #13#10 +
      '       HISTRUBSAL H,' + #13#10 +
      '       DEPENTIT D,' + #13#10 +
      '       PESSOA P,' + #13#10 +
      '       PESSOAFISICA PF,' + #13#10 +
      '       (SELECT MIN(BF2.DATAINICIOINSS) AS DATA, IDPESSOA' + #13#10 +
      '          FROM BENEFBFCIARIO BF2' + #13#10 +
      '         WHERE FONTEPAGADORA = 2' + #13#10 +
      '           AND BF2.IDPESSOA = IDPESSOA' + #13#10 +
      '         GROUP BY IDPESSOA) DATA_INSS,' + #13#10 +
      '       (SELECT MIN(BF2.DATAINICIOFUND) AS DATA, IDPESSOA' + #13#10 +
      '          FROM BENEFBFCIARIO BF2' + #13#10 +
      '         WHERE FONTEPAGADORA = 1' + #13#10 +
      '           AND BF2.IDPESSOA = IDPESSOA' + #13#10 +
      '         GROUP BY IDPESSOA) DATA_FUNCEF,' + #13#10 +
      '       (SELECT P.IDPESSOA,' + #13#10 +
      '               decode(P.SITPROCESSO,' + #13#10 +
      '                      0,' + #13#10 +
      '                      ''Ação Judicial em Liminar'',' + #13#10 +
      '                      1,' + #13#10 +
      '                      ''Ação Judicial Julgada Ganha'',' + #13#10 +
      '                      2,' + #13#10 +
      '                      ''Ação Judicial Julgada Perdida'',' + #13#10 +
      '                      ''NÃO CADASTRADA'') AS SITPROCESSO,' + #13#10 +
      '               P.DATAINICIO,' + #13#10 +
      '               P.DATAFINAL,' + #13#10 +
      '               P.PERCACAO,' + #13#10 +
      '               DECODE(P.FLGFAZDEPOSITO, 1, ''SIM'', ''NAO'') FLGFAZDEPOSITO,' + #13#10 +
      '               DECODE(P.TIPOACAO,' + #13#10 +
      '                      1,' + #13#10 +
      '                      ''Bitributação'',' + #13#10 +
      '                      0,' + #13#10 +
      '                      ''Correção de Tabela de IRRF'',' + #13#10 +
      '                      ''Outro Tipo Ação'') AS TIPOACAO' + #13#10 +
      '          FROM PROCJUD P' + #13#10 +
      '         WHERE IDPROCJUD = (SELECT MAX(IDPROCJUD)' + #13#10 +
      '                              FROM PROCJUD P2' + #13#10 +
      '                             WHERE P2.IDPESSOA = P.IDPESSOA)) PROC' + #13#10 +
      ' WHERE PR.FLGTPRUBRICA LIKE ''%B%''' + #13#10 +
      '   AND H.IDRUBRICA = PR.IDPROVENTO' + #13#10 +
      '   AND (decode(h.idtitular, h.idpessoa, h.idpessoa, h.IDRESPONSAVEL) =' + #13#10 +
      '       d.idpessoa OR h.idtitular = d.idpessoa)' + #13#10 +
      '   AND H.IDTITULAR = D.IDTITULAR' + #13#10 +
      '   AND D.IDPESSOA = P.IDPESSOA' + #13#10 +
      '   AND H.IDRESPONSAVEL = P.IDPESSOA' + #13#10 +
      '   AND P.IDPESSOA = PF.IDPESSOA' + #13#10 +
      '   AND DECODE(PR.IDPROVENTO,' + #13#10 +
      '              36914,' + #13#10 +
      '              H.VALORINFO,' + #13#10 +
      '              38389,' + #13#10 +
      '              H.VALORINFO,' + #13#10 +
      '              36952,' + #13#10 +
      '              999,' + #13#10 +
      '              38390,' + #13#10 +
      '              H.VALORINFO,' + #13#10 +
      '              H.VALORPROVENTO) > 0' + #13#10 +
      '   AND NVL(H.FLGESTORNO, 0) = 0' + #13#10 +
      '   AND DATA_INSS.IDPESSOA(+) = H.IDPESSOA' + #13#10 +
      '   AND DATA_FUNCEF.IDPESSOA(+) = H.IDPESSOA' + #13#10 +
      '   AND h.idmodulo = 18' + #13#10 +
      '   AND h.flgpensaoalim <> 2' + #13#10 +
      '   AND PROC.IDPESSOA(+) = P.IDPESSOA' + #13#10 +
      '   AND SUBSTR(H.MESCOBRANCA, 1, 4) = ' + QuotedStr(Ano) + #13#10 +
      '   AND P.NUMDOCUMENTO = ' + QuotedStr(Cpf) + #13#10 +
      ' GROUP BY SUBSTR(H.MESCOBRANCA, 1, 4),' + #13#10 +
      '          P.NUMDOCUMENTO,' + #13#10 +
      '          D.MATRICULA,' + #13#10 +
      '          D.IDPESSOA,' + #13#10 +
      '          pf.Datamolestiagrave,' + #13#10 +
      '          pf.Datafimmolestia,' + #13#10 +
      '          pf.datamorte,' + #13#10 +
      '          DATA_FUNCEF.DATA,' + #13#10 +
      '          DATA_INSS.DATA,' + #13#10 +
      '          P.NOME,' + #13#10 +
      '          PF.DATANASC,' + #13#10 +
      '          TRUNC((MONTHS_BETWEEN(''31/12/' + Ano + ''', PF.DATANASC) / 12), 0),' + #13#10 +
      '          SITPROCESSO,' + #13#10 +
      '          TO_CHAR(DATAINICIO, ''DD/MM/YYYY''),' + #13#10 +
      '          TO_CHAR(DATAFINAL, ''DD/MM/YYYY''),' + #13#10 +
      '          TO_CHAR(PERCACAO),' + #13#10 +
      '          TO_CHAR(FLGFAZDEPOSITO),' + #13#10 +
      '          TIPOACAO' + #13#10 +
      ' ORDER BY CPF, DATA_FUNCEF.DATA' + #13#10;

//   CMDebugToFile(#13#10 + tSQL + #13#10);

   Result := GetDataPacket(tSql);
End;

Function TCtrlRelDivergeFolhaXComprov.Listar_CPF(Ano, DocumentosFormatados,
   NaturezasFormatadas, Totalizadores: String): OleVariant;
Var
   tSQL: String;
Begin
   tSQL := 'insert into RelDivFolXCompCPF' + #13#10 +
      '  (NUMDOCUMENTO, ANO, GRUPO, DSCGRUPO, ANOVIGENCIA, IDINFORME, IDTOTALIZARELDIVERGENCIA)' + #13#10 +

   '(SELECT CPF.NUMDOCUMENTO, GR.ANO, GR.GRUPO, GR.DSCGRUPO,' + #13#10 +
      '        GR.ANOVIGENCIA, GR.IDINFORME, GR.IDTOTALIZARELDIVERGENCIA' + #13#10 +
      '   FROM (SELECT DISTINCT TRIM(B.NUMDOCUMENTO) NUMDOCUMENTO ' + #13#10 +
      '           FROM LANCIRRF A, ' + #13#10 +
      '                PESSOA B ' + #13#10 +
      '          WHERE A.DATALANCAMENTO BETWEEN ''01/01/' + Ano + ''' AND ''31/12/' + Ano + '''' + #13#10 +
      '            AND A.IDMODULO = 18 ' + #13#10 +
      '            AND A.IDBENEFIRRF = B.IDPESSOA(+) ' + #13#10 +
      '            AND B.NUMDOCUMENTO IS NOT NULL ' + #13#10 +
      '            AND A.CODNATUREZA IN ( ' + NaturezasFormatadas + ' )' + #13#10;

   If Trim(DocumentosFormatados) <> '' Then
      tSQL := tSQL +
         ' AND ' + CtrlFuncoesRH.QuebrarListaFiltro(1, '(B.NUMDOCUMENTO', DocumentosFormatados, 500) + #13#10; // Paulo em 23/05/2013

   tSQL := tSQL +
      '         ) CPF,' + #13#10 +
      '        (SELECT DISTINCT ' + QuotedStr(Ano) + ' as ANO,' + #13#10 +
      '                GRL.IDGrupoRubrica as GRUPO,' + #13#10 +
      '                GR.DESCRICAO as DSCGRUPO,' + #13#10 +
      '                GRL.ANOVIGENCIA,' + #13#10 +
      '                GRL.IDINFORME,' + #13#10 +
      '                GRL.IDTOTALIZARELDIVERGENCIA' + #13#10 +
      '           FROM GrupoRubricaXLinhasInforme GRL, GrupoRubrica GR,' + #13#10 +
      '                (SELECT IDINFORME, MAX(ANOVIGENCIA) as ANOVIGENCIA' + #13#10 +
      '                   FROM GrupoRubricaXLinhasInforme' + #13#10 +
      '                  WHERE ANOVIGENCIA <= ' + QuotedStr(Ano) + #13#10 +
      '                  GROUP BY IDINFORME) VIG' + #13#10 +
      '          WHERE GRL.IDINFORME = VIG.IDINFORME' + #13#10 +
      '            AND  GRL.ANOVIGENCIA = VIG.ANOVIGENCIA' + #13#10 +
      '            AND  GRL.IDGrupoRubrica = GR.IDGrupoRubrica(+)' + #13#10;

   If Trim(Totalizadores) <> '' Then
      tSQL := tSQL +
         '            AND NOT GRL.IDTOTALIZARELDIVERGENCIA IN ( ' + Totalizadores + ' )' + #13#10;

   tSQL := tSQL +
      '         ) GR)' + #13#10;

//   CMDebugToFile(#13#10 + tSQL + #13#10);

   ExecSQL('delete from RelDivFolXCompCPF');
   ExecSQL(tSQL);

   Result := GetDataPacket('select distinct TRIM(NUMDOCUMENTO) AS CPF from RelDivFolXCompCPF');
End;

Procedure TCtrlRelDivergeFolhaXComprov.Prepara_Folha_Comprovante(
   Ano, Totalizadores, NaturezasFormatados: String);
Var
   tSql: String;
Begin
   tSql :=
      '--SQL GERAL (FOLHA - COMPROVANTE)' + #13#10 +
      'SELECT ' + #13#10 +
      '       INF.NOMEINFORME as DESCRICAO_FOLHA,' + #13#10 +
      '       INF.NOMEINFORME as DESCRICAO_COMPROVANTE,' + #13#10 +
      '       INF.NOMEINFORME as NOME,' + #13#10 +
      '       TMP.NUMDOCUMENTO as MATRICULA,' + #13#10 +
      '       ' + QuotedStr(IntToStr(StrToInt(Ano) + 1)) + ' as ANO_CALENDARIO,' + #13#10 +
      '       TMP.NUMDOCUMENTO as SEGUNDAMATRICULA,' + #13#10 +
      '       TO_CHAR(SYSDATE, ''DD/MM/YYYY'') as DATANASC,' + #13#10 +
      '       0 as IDADE_DEZ2004,' + #13#10 +
      '       0 as PERACAO,' + #13#10 +
      '       ''   '' as FLGFAZDEPOSITO,' + #13#10 +
      '       TO_CHAR(SYSDATE, ''DD/MM/YYYY'') as DATAINICIO,' + #13#10 +
      '       TO_CHAR(SYSDATE, ''DD/MM/YYYY'') as DATAFINAL,' + #13#10 +
      '       TO_CHAR(SYSDATE, ''DD/MM/YYYY'') as DIB_FUNCEF,' + #13#10 +
      '       TO_CHAR(SYSDATE, ''DD/MM/YYYY'') as DIB_INSS,' + #13#10 +
      '       TO_CHAR(SYSDATE, ''DD/MM/YYYY'') as DATAMORTE,' + #13#10 +
      '       INF.NOMEINFORME as TIPOACAO,' + #13#10 +
      '       INF.NOMEINFORME as SITPROCESSO,' + #13#10 +
      '       TMP.ANO,' + #13#10 +
      '       TRIM(TMP.NUMDOCUMENTO) as CPF,' + #13#10 +
      '       TMP.GRUPO,' + #13#10 +
      '       TMP.DSCGRUPO,' + #13#10 +
      '       NVL(FOL.TOTAL_RUBRICA, 0) as TOTAL_RUBRICA,' + #13#10 +
      '       TMP.ANOVIGENCIA,' + #13#10 +
      '       TMP.IDINFORME,' + #13#10 +
      '       INF.NOMEINFORME,' + #13#10 +
      '       NVL(COMP.VALOR_COMPROVANTE, 0) as VALOR_COMPROVANTE,' + #13#10 +
      '       TOT.DESCRICAO,' + #13#10 +
      '       TOT.ORDEMIMP,' + #13#10 +
      '       0 AS DIFERENCA' + #13#10 +    
      'FROM RelDivFolXCompCPF TMP,' + #13#10 +

      '-- SQL DA FOLHA' + #13#10 +

      '       (SELECT SUBSTR(H.MESCOBRANCA, 1, 4) AS ANO,' + #13#10 +
      '               TRIM(P.NUMDOCUMENTO) NUMDOCUMENTO,' + #13#10 +
      '               PR.IDGRUPORUBRICA as GRUPO,' + #13#10 +
      '               SUM(decode(h.valorprovento,' + #13#10 +
      '                          NULL,' + #13#10 +
      '                          (decode(h.Flgtipodesc,' + #13#10 +
      '                                  ''K'',' + #13#10 +
      '                                  (decode(pr.flgdesconto,' + #13#10 +
      '                                          0,' + #13#10 +
      '                                          h.valorinfo,' + #13#10 +
      '                                          -h.valorinfo)),' + #13#10 +
      '                                  (decode(pr.flgdesconto,' + #13#10 +
      '                                          0,' + #13#10 +
      '                                          h.valorprovento,' + #13#10 +
      '                                          -h.valorprovento)))),' + #13#10 +
      '                          (decode(pr.flgdesconto,' + #13#10 +
      '                                  0,' + #13#10 +
      '                                  h.valorprovento,' + #13#10 +
      '                                  -h.valorprovento)))) as TOTAL_RUBRICA' + #13#10 +
      '          FROM PROVDESC     PR,' + #13#10 +
      '               HISTRUBSAL   H,' + #13#10 +
      '               DEPENTIT     D,' + #13#10 +
      '               PESSOA       P,' + #13#10 +
      '               PESSOAFISICA PF' + #13#10 +
      '         WHERE PR.FLGTPRUBRICA LIKE ''%B%''' + #13#10 +
      '           AND H.IDRUBRICA = PR.IDPROVENTO' + #13#10 +
      '           AND (decode(H.IDTITULAR, H.IDPESSOA, H.IDPESSOA, H.IDRESPONSAVEL) =' + #13#10 +
      '               D.IDPESSOA OR H.IDTITULAR = D.IDPESSOA)' + #13#10 +
      '           AND H.IDTITULAR = D.IDTITULAR' + #13#10 +
      '           AND D.IDPESSOA = P.IDPESSOA' + #13#10 +
      '           AND H.IDRESPONSAVEL = P.IDPESSOA' + #13#10 +
      '           AND P.IDPESSOA = PF.IDPESSOA' + #13#10 +
      '           AND DECODE(PR.IDPROVENTO,' + #13#10 +
      '                      36914,' + #13#10 +
      '                      H.VALORINFO,' + #13#10 +
      '                      38389,' + #13#10 +
      '                      H.VALORINFO,' + #13#10 +
      '                      36952,' + #13#10 +
      '                      999,' + #13#10 +
      '                      38390,' + #13#10 +
      '                      H.VALORINFO,' + #13#10 +
      '                      H.VALORPROVENTO) <> 0' + #13#10 +
      '           AND NVL(H.FLGESTORNO, 0) = 0' + #13#10 +
      '           AND H.IDMODULO = 18' + #13#10 +
      '           AND H.FLGPENSAOALIM <> 2' + #13#10 +
      '           AND SUBSTR(H.MESCOBRANCA, 1, 4) = ' + QuotedStr(Ano) + #13#10 +
      '           AND TRIM(P.NUMDOCUMENTO) in (select distinct NUMDOCUMENTO from RelDivFolXCompCPF)' + #13#10 +
      '           AND PR.IDGRUPORUBRICA in (select distinct GRUPO from RelDivFolXCompCPF)' + #13#10 +
      '         GROUP BY SUBSTR(H.MESCOBRANCA, 1, 4),' + #13#10 +
      '                  P.NUMDOCUMENTO,' + #13#10 +
      '                  PR.IDGRUPORUBRICA,' + #13#10 +
      '                  P.NOME) FOL,' + #13#10 +

      '       -- SQL DO COMPROVANTE' + #13#10 +

      '       (SELECT A.ANO_PAGTO, A.CPF, A.IDINFORME, A.VALOR_COMPROVANTE' + #13#10 +
      '          FROM (SELECT X.ANO_PAGTO, X.CPF, X.IDINFORME, ' + #13#10 +
      '                       SUM(X.VLRREAL) AS VALOR_COMPROVANTE' + #13#10 +
      '                  FROM (SELECT DJ.ANO_PAGTO,' + #13#10 +
      '                               TRIM(P.NUMDOCUMENTO) AS CPF,' + #13#10 +
      '                               DJ.IDINFORME,' + #13#10 +
      '                               P.IDPESSOA,' + #13#10 +
      '                               P.TIPO,' + #13#10 +
      '                               DJ.FLGPENSAOALIM,' + #13#10 +
      '                               DJ.VLRREAL' + #13#10 +
      '                          FROM PESSOA P,' + #13#10 +
      '                               PESSOA PT,' + #13#10 +
      '                               NATURENDIMENTO NAT,' + #13#10 +
      '                               (SELECT XB.IDBENEFIRRF,' + #13#10 +
      //Marcio Sanches Spinosa SOL 219009 Kintana 2053987 - Inicio
//      '                                       XB.CODNATUREZA,' + #13#10 +
                                  ' CASE WHEN XB.CODNATUREZA = ''0561'' AND LI.FONTEPAGADORA = 1 THEN ''3540'' ' + #13#10 +
                                  ' WHEN XB.CODNATUREZA = ''0561'' AND LI.FONTEPAGADORA = 2 THEN ''3533'' ' + #13#10 +
                                  ' ELSE XB.CODNATUREZA END CODNATUREZA, '+ #13#10 +
     //Marcio Sanches Spinosa SOL 219009 Kintana 2053987 - Fim
      '                                       IE.CODINFORME,' + #13#10 +
      '                                       XB.IDPATRO,' + #13#10 +
      '                                       XB.FLGPENSAOALIM,' + #13#10 +
      '                                       TO_CHAR(XB.DATAPAGAMENTO, ''YYYY'') ANO_PAGTO,' + #13#10 +
      '                                       IE.IDINFORME,' + #13#10 +
      '                                       SUM(DECODE(IE.FLGNATUREZA,' + #13#10 +
      '                                                  ''N'',' + #13#10 +
      '                                                  (LI.VLRLANC * -1),' + #13#10 +
      '                                                  LI.VLRLANC)) AS VLRREAL' + #13#10 +
      '                                  FROM LANCIRRF XB, INFORME IE, LANCXINFORME LI' + #13#10 +
      '                                 WHERE (XB.FLGPENSAOALIM = 0)' + #13#10 +
      '                                   AND (LI.IDLANCIRRF = XB.IDLANCIRRF)' + #13#10 +
      '                                   AND (LI.FLGTIPOREG <> ''D'')' + #13#10 +
      '                                   AND (LI.IDINFORME = IE.IDINFORME)' + #13#10 +
      '                                   AND (XB.DATAPAGAMENTO BETWEEN' + #13#10 +
      '                                       TO_DATE(''01/01/' + Ano + ''', ''DD/MM/YYYY'') AND' + #13#10 +
      '                                       TO_DATE(''31/12/' + Ano + ''', ''DD/MM/YYYY''))' + #13#10 +
      '                                   AND (XB.CODNATUREZA IN ( ' + NaturezasFormatados + ' ))' + #13#10 +
      '                                 GROUP BY XB.IDBENEFIRRF,' + #13#10 +
      '                                          XB.CODNATUREZA,' + #13#10 +
      '                                          IE.CODINFORME,' + #13#10 +
      '                                          XB.IDPATRO,' + #13#10 +
      '                                          XB.FLGPENSAOALIM,' + #13#10 +
      '                                          TO_CHAR(XB.DATAPAGAMENTO, ''YYYY''),' + #13#10 +
      '                                          IE.IDINFORME) DJ' + #13#10 +
      '                         WHERE (P.TIPO = ''F'')' + #13#10 +
      '                           AND (NAT.CODNATUREZA = DJ.CODNATUREZA)' + #13#10 +
      '                           AND (DJ.IDBENEFIRRF = P.IDPESSOA)' + #13#10 +
      '                           AND (PT.IDPESSOA = DJ.IDPATRO)' + #13#10 +
      '                           AND RTRIM(LTRIM(DECODE(LENGTH(RTRIM(LTRIM(P.NUMDOCUMENTO))),' + #13#10 +
      '                                                  11,' + #13#10 +
      '                                                  P.NUMDOCUMENTO,' + #13#10 +
      '                                                  ''00000000000''))) <>' + #13#10 +
      '                               ''00000000000''' + #13#10 +
      //Marcio Sanches Spinosa SOL 219009 Kintana 2053987 - Inicio
      '                      /*   GROUP BY DJ.ANO_PAGTO,' + #13#10 +
      '                                  P.NUMDOCUMENTO,' + #13#10 +
      '                                  DJ.IDINFORME,' + #13#10 +
      '                                  dj.VLRREAL,' + #13#10 +
      '                                  P.IDPESSOA,' + #13#10 +
      '                                  P.TIPO,' + #13#10 +
      '                                  DJ.FLGPENSAOALIM */) X ' + #13#10 +
      //Marcio Sanches Spinosa SOL 219009 Kintana 2053987 - Fim
      '                 WHERE X.ANO_PAGTO = ' + QuotedStr(Ano) + #13#10 +
      '                   AND TRIM(X.CPF) in (select distinct NUMDOCUMENTO from RelDivFolXCompCPF)' + #13#10 +
      '                   AND X.IDINFORME in (select distinct IDINFORME from RelDivFolXCompCPF)' + #13#10 +
      '                 GROUP BY X.CPF, X.ANO_PAGTO, X.IDINFORME) A ) COMP,' + #13#10 +
      '       TOTALIZARELDIVERGENCIA TOT,' + #13#10 +
      '       INFORME INF ' + #13#10 +

   ' WHERE TMP.NUMDOCUMENTO = FOL.NUMDOCUMENTO(+)' + #13#10 +
      '   AND TMP.ANO = FOL.ANO(+)' + #13#10 +
      '   AND TMP.GRUPO = FOL.GRUPO(+)' + #13#10 +
      '   AND TMP.NUMDOCUMENTO = COMP.CPF(+)' + #13#10 +
      '   AND TMP.ANO = COMP.ANO_PAGTO(+)' + #13#10 +
      '   AND TMP.IDINFORME = COMP.IDINFORME(+)' + #13#10 +
      '   AND TMP.IDTOTALIZARELDIVERGENCIA = TOT.IDTOTALIZARELDIVERGENCIA' + #13#10 +
      '   AND TMP.ANOVIGENCIA = INF.ANOVIGENCIA' + #13#10 +
      '   AND TMP.IDINFORME = INF.IDINFORME' + #13#10;

   If Trim(Totalizadores) <> '' Then
      Begin
         tSql := tSql +
            '   AND NOT TMP.IDTOTALIZARELDIVERGENCIA IN ( ' + Totalizadores + ' ) ' + #13#10;
      End;

   tSQL := 'insert into RelDivFolXCompDet' + #13#10 + tSQL;

//   CMDebugToFile(#13#10 + tSQL + #13#10);

   ExecSQL('delete from RelDivFolXCompDet');
   ExecSQL(tSQL);

End;

Function TCtrlRelDivergeFolhaXComprov.Listar_Folha_Comprovante(CPF: String): OleVariant;
Var
   tSQL: String;
Begin
   tSQL := 'select a.*, c.rVALOR_COMPROVANTE, r.rTOTAL_RUBRICA' + #13#10 +
      '  from RelDivFolXCompDet a,' + #13#10 +
      '       (select CPF, ORDEMIMP, sum(VALOR_COMPROVANTE) as rVALOR_COMPROVANTE' + #13#10 +
      '          from RelDivFolXCompDet' + #13#10 +
      '         group by CPF, ORDEMIMP) c,' + #13#10 +
      '       (select CPF, ORDEMIMP, sum(TOTAL_RUBRICA) as rTOTAL_RUBRICA' + #13#10 +
      '          from (select distinct CPF, ORDEMIMP, GRUPO, TOTAL_RUBRICA' + #13#10 +
      '                  from RelDivFolXCompDet)' + #13#10 +
      '         group by CPF, ORDEMIMP) r' + #13#10 +
      ' where a.cpf = c.cpf' + #13#10 +
      '   and a.ORDEMIMP = c.ORDEMIMP' + #13#10 +
      '   and a.cpf = r.cpf' + #13#10 +
      '   and a.ORDEMIMP = r.ORDEMIMP' + #13#10;

   If trim(CPF) <> '' Then
      tSQL := tSQL +
         '   and a.CPF = ' + QuotedStr(CPF) + #13#10;

   tSQL := tSQL +
      '   and (a.TOTAL_RUBRICA + a.VALOR_COMPROVANTE) <> 0' + #13#10 +
      ' order by a.CPF, a.ORDEMIMP, a.GRUPO' + #13#10;

//   CMDebugToFile(#13#10 + tSQL + #13#10);

   Result := GetDataPacket(tSQL);
End;

End.

