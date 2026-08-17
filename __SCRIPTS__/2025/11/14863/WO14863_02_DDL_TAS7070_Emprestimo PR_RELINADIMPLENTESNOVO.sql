/* PAULO NOBRE - 18/11/2025
   TAS000000007070
   ALTERAÇÃO PARA APAGAR TODO MOVIMENTO DA TABELA: CM.RELESPECIALEMPTMONOVO 
   ANTERIOR A DATA DE REFERENCIA INFORMADA
*/
CREATE OR REPLACE PROCEDURE "PR_RELINADIMPLENTESNOVO" (pDataLimite       IN DATE,
                                                   pIdBenef          IN VARCHAR2,
                                                   pIdContratoEmptmo IN VARCHAR2,
                                                   pCodDocumento     IN VARCHAR2,
                                                   pContratoAd       IN CHAR,
                                                   pNomeRelatorio    IN VARCHAR2,
                                                   pIdForm           IN INTEGER) AS
  -----------------------
  --Declaração de tipos--
  -----------------------
  TYPE REF_CURSOR IS REF CURSOR;
  TYPE CONTRATOS_RECORD IS RECORD(idcontratoemptmo NUMBER,
                                  idbenef NUMBER,
                                  idpessoa NUMBER);
  ---------------------------
  --Declaração de variáveis--
  ---------------------------
  cContratos REF_CURSOR;
  rContratos CONTRATOS_RECORD;
  vDtLimiteInad DATE := pDataLimite;
  vQuery VARCHAR2(32767);
  vOrdem PLS_INTEGER := 0;
     /*mutuário*/
  vMatricula VARCHAR2(7);
  vNome      VARCHAR2(60);
  vCPF       VARCHAR2(11);
  vSituacao  VARCHAR2(50);
  vDataMorte DATE;
     /*contrato*/
  vModalidade    VARCHAR2(60);
  vPlanoContabil VARCHAR2(50);
  vPatro         VARCHAR2(60);
  vDataAssin     DATE;
  vTipoSuspContr VARCHAR2(60);
  vPrazo         PLS_INTEGER;
  vTxJuros       NUMBER;
     /*inadimplência*/
  vItem             VARCHAR2(40);
  vQtdeDiasAtraso   PLS_INTEGER;
  vCorrMonet        NUMBER;
  vJurosRem         NUMBER;
  vJurosMora        NUMBER;
  vMulta            NUMBER;
  vIOFCompl         NUMBER;
  vVlrParcCorrigida NUMBER;
  vSaldoDev         NUMBER;
  vFormaCobra       VARCHAR2(19);
  vTipoSusp         VARCHAR2(60);
     /*sintético*/
  vDiasAtrasoTotal   PLS_INTEGER;
  vDtPrimeiraInad    DATE;
  vValorParcTotal    NUMBER := 0;
  vVlrCorrMonetTotal NUMBER := 0;
  vVlrJurosRemTotal  NUMBER := 0;
  vVlrMultaTotal     NUMBER := 0;
  vVlrJurosMoraToral NUMBER := 0;
  vVlrIOFComplTotal  NUMBER := 0;
  vValorTotal        NUMBER := 0;
  --Declaração de cursores
  CURSOR inadimplencia(pNumContrato NUMBER) IS
    SELECT idcontratoemptmo,
           parcela,
           iditememptmo,
           numparcelas,
           dataprevista,
           vlrparcela,
           idhistmovemptmo,
           qtdeitens,
           ROWNUM
    FROM (SELECT hp.idcontratoemptmo,
                 hp.parcela,
                 hp.iditememptmo,
                 MIN(hp.numparcelas) AS numparcelas,
                 MIN(hp.dataprevista) AS dataprevista,
                 SUM(hp.vlrprevisto) AS vlrparcela,
                 MIN(hp.idhistmovemptmo) AS idhistmovemptmo,
                 COUNT(hp.idhistmovemptmo) AS qtdeitens
          FROM hmeprestacao hp
          WHERE hp.idcontratoemptmo = pNumContrato
          AND   hp.naturezaitem > 0
          AND   hp.dataprevista <= vDtLimiteInad
          AND   (hp.dataefetiva IS NULL OR hp.dataefetiva > vDtLimiteInad )
          AND   (hp.vlrefetivo IS NULL OR hp.dataefetiva > vDtLimiteInad )
          AND   hp.flgquitabonoestorno = 0
          --AND   (hp.flgquitabonoestorno = 0 OR NVL(hp.dataquitabonoestorno, vDtLimiteInad + 1) > vDtLimiteInad )
          AND   (hp.idtiposuspemptmo IS NULL OR 1 = (SELECT ts.flgemaberto FROM tiposuspemptmo ts
                                                     WHERE ts.idtiposuspemptmo = hp.idtiposuspemptmo))
          GROUP BY hp.idcontratoemptmo,
                   hp.parcela,
                   hp.iditememptmo
          UNION ALL
          SELECT hac.idcontratoemptmo,
                 hac.parcela,
                 hac.iditememptmo,
                 MIN(hac.numparcelas) AS numparcelas,
                 MIN(hac.dataprevista) AS dataprevista,
                 SUM(hac.vlrprevisto) AS vlrparcela,
                 MIN(hac.idhistmovemptmo) AS idhistmovemptmo,
                 COUNT(hac.idhistmovemptmo) AS qtdeitens
          FROM hmeajustecobranca hac
          WHERE hac.idcontratoemptmo = pNumContrato
          AND   hac.dataprevista <= vDtLimiteInad
          AND   (hac.dataefetiva IS NULL OR hac.dataefetiva > vDtLimiteInad )
          AND   (hac.vlrefetivo IS NULL OR hac.dataefetiva > vDtLimiteInad )
          AND   hac.flgquitabonoestorno = 0
          --AND   (hac.flgquitabonoestorno = 0 OR NVL(hac.dataquitabonoestorno, vDtLimiteInad + 1) > vDtLimiteInad )
          GROUP BY hac.idcontratoemptmo,
                   hac.parcela,
                   hac.iditememptmo
          ORDER BY dataprevista, parcela, iditememptmo)
  ;
BEGIN
  vQuery :=
    'SELECT c.idcontratoemptmo,' || CHR(13) ||
    '       c.idbenef,' || CHR(13) ||
    '       c.idpessoa' || CHR(13) ||
    'FROM contratoemptmo c' || CHR(13) ||
    'WHERE c.flgsituacao NOT IN (''C'',''Q'')' || CHR(13) ||
    'AND   c.datacredito <= to_date('''|| to_char(vDtLimiteInad,'DD/MM/YYYY') ||''',''DD/MM/YYYY'')';
  IF pContratoAd = 'S' THEN
    vQuery := vQuery || CHR(13) ||
    'AND   c.idcontratoemptmo IN (SELECT idcontratoemptmo FROM cm.contratoad)';
  END IF;
  IF pIdBenef <> '-1' THEN
    vQuery := vQuery || CHR(13) ||
    'AND   c.idbenef IN (' || pIdBenef || ')';
  END IF;
  IF pIdContratoEmptmo <> '-1' THEN
    vQuery := vQuery || CHR(13) ||
    'AND   c.idcontratoemptmo IN (' || pIdContratoEmptmo || ')';
  END IF;
  vQuery := vQuery || CHR(13) ||
    'ORDER BY c.idcontratoemptmo';
  BEGIN
  DELETE FROM CM.RELESPECIALEMPTMONOVO
  WHERE codrelatorio = pIdForm
  AND   referencia <= vDtLimiteInad;  -- Paulo Nobre - TAS000000007070
  EXCEPTION
  WHEN OTHERS THEN
  	DBMS_OUTPUT.PUT_LINE('Erro ao excluir tabela');
  END;
  COMMIT;
  OPEN cContratos FOR vQuery;
  LOOP
    FETCH cContratos INTO rContratos;
    EXIT WHEN cContratos%NOTFOUND;
    vValorParcTotal := 0;
    vVlrCorrMonetTotal := 0;
    vVlrJurosRemTotal := 0;
    vVlrMultaTotal := 0;
    vVlrJurosMoraToral := 0;
    vVlrIOFComplTotal := 0;
    vValorTotal := 0;
    FOR inad IN inadimplencia(rContratos.idcontratoemptmo) LOOP
      IF inad.rownum = 1 THEN
        --Busca informações do mutuário
        BEGIN
        SELECT d.matricula,
               p.nome,
               RTRIM(p.numdocumento),
               pf.datamorte
        INTO vMatricula,
             vNome,
             vCPF,
             vDataMorte
        FROM depentit d
             JOIN pessoa p ON p.idpessoa = d.idpessoa
             JOIN pessoafisica pf ON pf.idpessoa = d.idpessoa
        WHERE d.idpessoa = rContratos.idbenef
        AND   d.idtitular = rContratos.idpessoa;
        EXCEPTION
        WHEN OTHERS THEN
        	vMatricula := NULL;
            vNome := NULL;
            vCPF := NULL;
            vDataMorte := NULL;
        END;
        IF rContratos.idpessoa <> rContratos.idbenef THEN
           vSituacao := 'PENSIONISTA';
        ELSE
           BEGIN
               SELECT sp.descricao
               INTO vSituacao
               FROM partprevplan ppp, sitpart sp
               WHERE ppp.idsitpart = sp.idsitpart
               AND   ppp.idpessoa = rContratos.idbenef
               AND   ppp.idplanoprev = (SELECT MAX(part.idplanoprev)
                                        FROM partprevplan part
                                        WHERE part.idpessoa = ppp.idpessoa
                                        AND   part.idsitplanoprev <> 3);
           EXCEPTION
             WHEN OTHERS THEN
               SELECT sp.descricao
               INTO vSituacao
               FROM partprevplan ppp, sitpart sp
               WHERE ppp.idsitpart = sp.idsitpart
               AND   ppp.idpessoa = rContratos.idbenef
               AND   ppp.idplanoprev = (SELECT MAX(part.idplanoprev)
                                        FROM partprevplan part
                                        WHERE part.idpessoa = ppp.idpessoa);
           END;
        END IF;
        --Busca informações do contrato
        SELECT tc.tcedescricao,
               ppc.nome,
               p.nome,
               c.dataassinatura,
               ts.tsedescricao,
               c.numparcelas,
               c.txjuros
        INTO vModalidade,
             vPlanoContabil,
             vPatro,
             vDataAssin,
             vTipoSuspContr,
             vPrazo,
             vTxJuros
        FROM contratoemptmo c
             JOIN tipocontremptmo tc ON tc.idtipocontremptmo = c.idtipocontremptmo
             JOIN planprevcontabil ppc ON ppc.idplanoprev = c.idplanoorigem
             JOIN pessoa p ON p.idpessoa = c.idpatro
             LEFT JOIN tiposuspemptmo ts ON ts.idtiposuspemptmo = c.idtiposuspemptmo
        WHERE c.idcontratoemptmo = rContratos.idcontratoemptmo;
        vDtPrimeiraInad := inad.dataprevista;
      END IF;
      SELECT i.itedescricao
      INTO vItem
      FROM itememptmo i
      WHERE i.iditememptmo = inad.iditememptmo;
      vQtdeDiasAtraso := vDtLimiteInad - inad.dataprevista;
      IF inad.iditememptmo = 13 THEN
        SELECT NVL(SUM(he.vlrprevisto),0)
        INTO vCorrMonet
        FROM hmeencargos he
        WHERE he.idcontratoemptmo = rContratos.idcontratoemptmo
        AND   he.parcela = inad.parcela
        AND   he.iditememptmo = 42
        AND   he.dataprevista <= vDtLimiteInad
        AND   (he.flgquitabonoestorno = 0 OR he.dataquitabonoestorno > vDtLimiteInad )
        AND   (he.vlrefetivo IS NULL OR he.dataefetiva > vDtLimiteInad )
        AND   (he.dataefetiva IS NULL OR he.dataefetiva > vDtLimiteInad );
        SELECT NVL(SUM(he.vlrprevisto),0)
        INTO vJurosRem
        FROM hmeencargos he
        WHERE he.idcontratoemptmo = rContratos.idcontratoemptmo
        AND   he.parcela = inad.parcela
        AND   he.iditememptmo = 43
        AND   he.dataprevista <= vDtLimiteInad
        AND   (he.flgquitabonoestorno = 0 OR he.dataquitabonoestorno > vDtLimiteInad )
        AND   (he.vlrefetivo IS NULL OR he.dataefetiva > vDtLimiteInad )
        AND   (he.dataefetiva IS NULL OR he.dataefetiva > vDtLimiteInad );
        SELECT NVL(SUM(he.vlrprevisto),0)
        INTO vMulta
        FROM hmeencargos he
        WHERE he.idcontratoemptmo = rContratos.idcontratoemptmo
        AND   he.parcela = inad.parcela
        AND   he.iditememptmo = 44
        AND   he.dataprevista <= vDtLimiteInad
        AND   (he.flgquitabonoestorno = 0 OR he.dataquitabonoestorno > vDtLimiteInad )
        AND   (he.vlrefetivo IS NULL OR he.dataefetiva > vDtLimiteInad )
        AND   (he.dataefetiva IS NULL OR he.dataefetiva > vDtLimiteInad );
        SELECT NVL(SUM(he.vlrprevisto),0)
        INTO vJurosMora
        FROM hmeencargos he
        WHERE he.idcontratoemptmo = rContratos.idcontratoemptmo
        AND   he.parcela = inad.parcela
        AND   he.iditememptmo = 46
        AND   he.dataprevista <= vDtLimiteInad
        AND   (he.flgquitabonoestorno = 0 OR he.dataquitabonoestorno > vDtLimiteInad )
        AND   (he.vlrefetivo IS NULL OR he.dataefetiva > vDtLimiteInad )
        AND   (he.dataefetiva IS NULL OR he.dataefetiva > vDtLimiteInad );
        SELECT NVL(SUM(he.vlrprevisto),0)
        INTO vIOFCompl
        FROM hmeencargos he
        WHERE he.idcontratoemptmo = rContratos.idcontratoemptmo
        AND   he.parcela = inad.parcela
        AND   he.iditememptmo = 121
        AND   he.dataprevista <= vDtLimiteInad
        AND   (he.flgquitabonoestorno = 0 OR he.dataquitabonoestorno > vDtLimiteInad )
        AND   (he.vlrefetivo IS NULL OR he.dataefetiva > vDtLimiteInad )
        AND   (he.dataefetiva IS NULL OR he.dataefetiva > vDtLimiteInad );
      ELSE
        vCorrMonet := 0;
        vJurosRem := 0;
        vJurosMora := 0;
        vMulta := 0;
        vIOFCompl := 0;
      END IF;
      --Info para sintético
      vValorParcTotal := vValorParcTotal + inad.vlrparcela;
      vVlrCorrMonetTotal := vVlrCorrMonetTotal + vCorrMonet;
      vVlrJurosRemTotal := vVlrJurosRemTotal + vJurosRem;
      vVlrMultaTotal := vVlrMultaTotal + vMulta;
      vVlrJurosMoraToral := vVlrJurosMoraToral + vJurosMora;
      vVlrIOFComplTotal := vVlrIOFComplTotal + vIOFCompl;
      vVlrParcCorrigida := inad.vlrparcela + vCorrMonet + vJurosRem + vJurosMora + vMulta + vIOFCompl;
      vSaldoDev := NVL(CM.PCK_EMPRESTIMO.FN_SALDODEVEDOR(rContratos.idcontratoemptmo, inad.dataprevista),0);
      BEGIN
        SELECT ts.tsedescricao
        INTO vTipoSusp
        FROM tiposuspemptmo ts
        WHERE ts.idtiposuspemptmo = (SELECT hp.idtiposuspemptmo
                                     FROM hmeprestacao hp
                                     WHERE hp.idhistmovemptmo = inad.idhistmovemptmo);
      EXCEPTION
        WHEN no_data_found THEN
          vTipoSusp := NULL;
      END;
      BEGIN
        SELECT DECODE(hx.formacobranca, 'C', 'Financeiro',
                                       'F', 'Folha') ||
               DECODE(hx.tipofolha, 'B', ' de Beneficios',
                                   'P', ' Patrocinadora')
        INTO vFormaCobra
        FROM (SELECT h.formacobranca,
                     h.tipofolha,
                     h.dataenvio
              FROM histenvioemptmo h
              WHERE h.idhistmovemptmo = inad.idhistmovemptmo
              ORDER BY h.dataenvio DESC) hx
        WHERE ROWNUM = 1;
      EXCEPTION
        WHEN no_data_found THEN
          vFormaCobra := NULL;
      END;
      vOrdem := vOrdem + 1;
      INSERT INTO CM.RELESPECIALEMPTMONOVO VALUES (pIdForm,
                                               pNomeRelatorio,
                                               'Detalhes',
                                               rContratos.idcontratoemptmo,
                                               vMatricula,
                                               vNome,
                                               vCPF,
                                               vModalidade,
                                               vSituacao,
                                               vPlanoContabil,
                                               vPatro,
                                               vPrazo,
                                               vTxJuros,
                                               vDataAssin,
                                               vTipoSusp,
                                               inad.parcela,
                                               inad.numparcelas,
                                               vQtdeDiasAtraso,
                                               inad.dataprevista,
                                               vItem,
                                               inad.vlrparcela,
                                               vCorrMonet,
                                               vMulta,
                                               vJurosMora,
                                               vJurosRem,
                                               vIOFCompl,
                                               vVlrParcCorrigida,
                                               vSaldoDev,
                                               vDataMorte,
                                               vFormaCobra,
                                               USER,
                                               SYSDATE,
                                               vDtLimiteInad);
    END LOOP;
    IF vValorParcTotal > 0 THEN
      vOrdem := vOrdem + 1;
      vDiasAtrasoTotal := vDtLimiteInad - vDtPrimeiraInad;
      vValorTotal := vValorParcTotal + vVlrCorrMonetTotal + vVlrJurosRemTotal + vVlrMultaTotal + vVlrJurosMoraToral + vVlrIOFComplTotal;
      vSaldoDev := NVL(CM.PCK_EMPRESTIMO.FN_SALDODEVEDOR(rContratos.idcontratoemptmo, vDtLimiteInad),0);
      INSERT INTO CM.RELESPECIALEMPTMONOVO VALUES (pIdForm,
                                               pNomeRelatorio,
                                               'Sintético',
                                               rContratos.idcontratoemptmo,
                                               vMatricula,
                                               vNome,
                                               vCPF,
                                               vModalidade,
                                               vSituacao,
                                               vPlanoContabil,
                                               vPatro,
                                               vPrazo,
                                               vTxJuros,
                                               vDataAssin,
                                               vTipoSuspContr,
                                               NULL,
                                               NULL,
                                               vDiasAtrasoTotal,
                                               vDtPrimeiraInad,
                                               NULL,
                                               vValorParcTotal,
                                               vVlrCorrMonetTotal,
                                               vVlrMultaTotal,
                                               vVlrJurosMoraToral,
                                               vVlrJurosRemTotal,
                                               vVlrIOFComplTotal,
                                               vValorTotal,
                                               vSaldoDev,
                                               vDataMorte,
                                               NULL,
                                               USER,
                                               SYSDATE,
                                               vDtLimiteInad);
    END IF;
    IF vOrdem MOD 1000 = 0 THEN
      COMMIT;
    END IF;
  END LOOP;
  COMMIT;
END;
