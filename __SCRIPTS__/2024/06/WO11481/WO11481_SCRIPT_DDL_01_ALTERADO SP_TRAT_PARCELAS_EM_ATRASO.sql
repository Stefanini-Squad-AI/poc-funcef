CREATE OR REPLACE PROCEDURE CM.SP_TRAT_PARCELAS_EM_ATRASO(
        pNumContrato IN NUMBER,
        pInArquivo IN NUMBER,
        pNotInArquivo IN NUMBER,
        pAnoMes IN VARCHAR,
        pAnoMesCobranca IN VARCHAR,
        pAnoMesCompetencia IN VARCHAR,
        pDataCalculo IN DATE,
        pNumParcela IN NUMBER,
        pOrigemRecurso IN VARCHAR2 DEFAULT NULL,
        pTipoProposta IN PLS_INTEGER DEFAULT 0,
        pTrataParcelaEnviada IN PLS_INTEGER DEFAULT 1
        ) IS

/***************************************************************
  =*= Histórico de Alterações =*=
- 28/06/2011 - 1.00b - Saulo C. Araújo - Fim da elaboração da procedure (Versão beta)
- 01/07/2011 - 1.01b - Saulo C. Araújo - O cursor principal agora é dinâmico, visando baixar o tempo de busca inicial
                                       - Ajustado forma de buscar o usuário que disparou o processo (Versão beta)
- 05/07/2011 - 1.02b - Saulo C. Araújo - Ajustado a taxa de juros para cálculo de juros remuneratórios (Versão beta)
- 06/07/2011 - 1.03b - Saulo C. Araújo - Ajustado a data prevista da prestação para cálculo de multa (Versão beta)
                                       - Inserido query para atualização de FGQC sem a parcela correlata em aberto
- 08/07/2011 - 1.04b - Saulo C. Araújo - Ajustado cálculo de datas para correção monetária anterior ao dia 20 do mês (versão beta).
- 11/07/2011 - 1.04  - Saulo C. Araújo - Versão final
- 02/08/2011 - 1.05  - Saulo C. Araújo - Adicionado tratamento de erro para INPC igual a zero
- 13/03/2012 - 1.06  - Saulo C. Araújo - Adicionado cálculo de IOF Complementar
- 04/12/2012 - 1.07  - Saulo C. Araújo - Inserido tratamento para evitar a inserção de encargos quando a prestação foi quitada (SOL 196274)
- 21/11/2013 - 1.08  - Saulo C. Araújo - Ajustado tanto parâmetros de entrada como query do cursor para permitir processamento por parcela (atender a funcionalidade Tratamento de Itens Não Recebidos).
- 03/07/2015 - 1.09  - Saulo C. Araújo - Procedure ajustada para utilizar a HISTMOVEMPTMO segregada
- 16/10/2015 - 1.10  - Saulo C. Araújo - Ajustada forma de inserir na HMETRATADIVERG a fim de garantir performance
- 12/07/2018 - 1.11  - Saulo C. Araújo - Criado parâmetro e condição para gravar a origem do recurso
- 26/07/2018 - 1.12  - Saulo C. Araújo - Criado processamento e lançamento do desconto quando houver campanha
- 18/12/2018 - 1.13  - Saulo C. Araújo - Insere bloqueio de concessão quando houver o tratamento para a proposta 2
- 16/06/2021 - 1.14  - Marimar Soares - SIG 116711 - Ajuste para não desfazer o envio de itens cuja data de vencimento é maior que a data do tratamento linhas 666 e 680
- 03/08/2023 - 1.15  - Manoel Matias da Rocha Filho - SIG 136726 Politica de renegociação de divida. Pontos de alteracao com o numero do sig
- 20/06/2034 - 1.16  - Leanro Pocebon - WO114811 - Parametro para tratar seleção de parcelas enviadas
**********************************************************************************************************************/
vVersao CONSTANT VARCHAR2(10) := '1.16';
/*SIG 136726 - inclusão das variáveis abaixo*/
QtdPeriodoAtraso PLS_INTEGER;
ValorSaldoDevedor  NUMBER :=0;
ValorDescParcela   NUMBER;
ValorDescFGQC      NUMBER;
ValorDescCorrMonet NUMBER;
ValorDescJurosRemu NUMBER;
ValorDescJurosMora NUMBER;
ValorDescMulta     NUMBER;
ValorDescIofCompl  NUMBER;
----
--Cria tipo para cursor dinâmico
TYPE CursorPrincipal IS REF CURSOR;

--Cria RECORD para receber itens do cursor
TYPE ValCursorTratParcelas_Type IS RECORD(Idcontratoemptmo  NUMBER,
                                          Idhistmovemptmo   NUMBER,
                                          Hmeparcela        INTEGER,
                                          Hmenumparcelas    INTEGER,
                                          Hmeparcelaalt     INTEGER,
                                          Hmevlrprevisto    NUMBER,
                                          Hmedataprevista   DATE,
                                          Hmedatavencto     DATE,
                                          Hmetxjuros        NUMBER,
                                          Idplanoorigem     INTEGER,
                                          Idtipocontremptmo INTEGER,
                                          Idpatro           INTEGER,
                                          DataCredito       DATE,
                                          ValorSolicitado   NUMBER,
                                          SistAmortizacao   VARCHAR2(5));
                                          
TYPE ValCursorTratFGQC_Type IS RECORD(Idcontratoemptmo  NUMBER,
                                      Idhistmovemptmo   NUMBER,
                                      Hmeparcela        INTEGER,
                                      Hmenumparcelas    INTEGER,
                                      Hmeparcelaalt     INTEGER,
                                      Hmevlrprevisto    NUMBER,
                                      Idtipocontremptmo INTEGER);


FUNCTION PMT(nTxJuros NUMBER,
             iNumParcelas INTEGER,
             nVlrPresente NUMBER) RETURN NUMBER IS
  nVlrPrestPrice NUMBER;
BEGIN
  nVlrPrestPrice := power((1+nTxJuros),iNumParcelas)*nTxJuros / (power(1+nTxJuros,iNumParcelas)-1) * nVlrPresente;
  RETURN nVlrPrestPrice;
END;

PROCEDURE INSEREITEM (iTIPOCONTRATO IN INTEGER,
                      nNUMCONTRATO IN NUMBER,
                      iNUMITEM IN INTEGER,
                      iPARCELA IN INTEGER,
                      nVALORITEM IN NUMBER,
                      nSALDODEV IN NUMBER,
                      iNUMPARCELAS IN INTEGER,
                      iPARCELAALT IN INTEGER
                     ) IS
  iIdRubrica INTEGER;
  nIdHistMovEmptmo NUMBER;
BEGIN
  SELECT DISTINCT ixt.idproventon
  INTO iIdRubrica
  FROM itemxtipocontr ixt
  WHERE ixt.iditememptmo = iNUMITEM
  AND   ixt.idtipocontremptmo = iTIPOCONTRATO;
  
  SELECT seqhistmovemptmo.nextval
  INTO nIdHistMovEmptmo
  FROM dual;

  INSERT INTO HMEENCARGOS (IDHISTMOVEMPTMO,
                           IDCONTRATOEMPTMO,
                           IDITEMEMPTMO,
                           PARCELA,
                           PARCELAALT,
                           NUMPARCELAS,
                           ORIGEM,
                           FORMACOBRANCA,
                           TIPOFOLHA,
                           SEQCOBRANCA,
                           NATUREZAITEM,
                           DATAPREVISTA,
                           DATAEFETIVA,
                           DATAVENCTO,
                           VLRPREVISTO,
                           VLREFETIVO,
                           SALDODEV,
                           FLGENVIO,
                           FLGBAIXADO,
                           FLGBAIXAMANUAL,
                           RECPAG,
                           IDRUBRICA,
                           DATARECEB,
                           FLGQUITABONOESTORNO,
                           DATAQUITABONOESTORNO,
                           VLRBASE,
                           FLGENTRADAMANUAL,
                           VERSAO,
                           TRGDTINCLUSAO,
                           TRGUSERINCLUSAO)
       VALUES (nIdHistMovEmptmo, --IDHISTMOVEMPTMO
               nNUMCONTRATO, --IDCONTRATOEMPTMO
               iNUMITEM, --IDITEMEMPTMO
               iPARCELA, --PARCELA
               iPARCELAALT, --PARCELAALT
               iNUMPARCELAS, --NUMPARCELAS
               4, --ORIGEM
               'C', --FORMACOBRANCA
               NULL, --TIPOFOLHA
               1, --SEQCOBRANCA
               1, --NATUREZAITEM
               pDataCalculo, --DATAPREVISTA
               NULL, --DATAEFETIVA
               pDataCalculo, --DATAVENCTO
               nVALORITEM, --VLRPREVISTO
               NULL, --VLREFETIVO
               nSALDODEV, --SALDODEV
               0, --FLGENVIO
               0, --FLGBAIXADO
               0, --FLGBAIXAMANUAL
               'R', --RECPAG
               iIdRubrica, --IDRUBRICA
               NULL, --DATARECEB
               0, --FLGQUITABONOESTORNO
               NULL, --DATAQUITABONOESTORNO
               NULL, --VLRBASE
               0, --FLGENTRADAMANUAL
               vVersao, --VERSAO
               SYSDATE, --TRGDTINCLUSAO
               USER); --TRGUSERINCLUSAO
       
  IF pOrigemRecurso IS NOT NULL THEN
    INSERT INTO HMEORIGEMRECURSO (IDHISTMOVEMPTMO,IDTIPORECURSO,ORIGEMRECURSO)
           VALUES (nIdHistMovEmptmo,
                   1,
                   pOrigemRecurso);
  END IF;
END;

FUNCTION BUSCA_QTDE_MESES_ATRASO RETURN PLS_INTEGER IS
  vMenorDataParc DATE;
  vMaiorDataParc DATE;
  vQtdeMesesAtraso PLS_INTEGER;
BEGIN
  --Busca a maior e menor data das prestações inadimplentes
  SELECT MIN(h.dataprevista), MAX(h.dataprevista)
  INTO vMenorDataParc, vMaiorDataParc
  FROM hmeprestacao h
  WHERE h.idcontratoemptmo = pNumContrato
  AND   h.dataprevista <= pDataCalculo
  AND   h.iditememptmo = 13
  AND   h.flgquitabonoestorno = 0
  AND   h.vlrefetivo IS NULL
  AND   h.dataefetiva IS NULL
  AND   h.origem = 1
  AND   h.vlrprevisto > 0
  AND   (h.idtiposuspemptmo IS NULL OR 1 = (SELECT ts.flgemaberto
                                            FROM tiposuspemptmo ts
                                            WHERE ts.idtiposuspemptmo = h.idtiposuspemptmo));    
              
  vQtdeMesesAtraso := floor(months_between(pDataCalculo, vMenorDataParc));
  --Verifica se todas as prestações estão prescritas
  IF vQtdeMesesAtraso > 60 AND floor(months_between(pDataCalculo, vMaiorDataParc)) > 60 THEN
    vQtdeMesesAtraso := -1;
  END IF;
  
  RETURN vQtdeMesesAtraso;
END BUSCA_QTDE_MESES_ATRASO;

PROCEDURE INSERE_BLOQUEIO_CONCESSAO IS
  vIdPessoa NUMBER;
BEGIN
  SELECT idbenef
  INTO vIdPessoa
  FROM cm.contratoemptmo 
  WHERE idcontratoemptmo = pNumContrato;
  
  INSERT INTO cm.suspconcessao (IDPESSOA,
                                SUCDATAINICIO,
                                SUCDATAFINAL,
                                SUCMOTIVOSUSP,
                                TRGDTINCLUSAO,
                                TRGUSERINCLUSAO,
                                FLGSTATUS,
                                FLGPRAZOINDETERMINADO,
                                IDSUCEMPTMO,
                                IDMOTIVOSUSPCONCESSAO,
                                IDCONTRATOEMPTMO ) 
              VALUES(vIdPessoa, 
                     TRUNC(SYSDATE), 
                     NULL, 
                     'Bloqueio automático sem prazo por adesão à Política de Recuperação de Crédito.',
                     SYSDATE, 
                     USER, 
                     'A', 
                     'S', 
                     cm.seqsuspconcessao.nextval, 
                     21,  
                     pNumContrato);
                     
END INSERE_BLOQUEIO_CONCESSAO;

--Corpo da Procedure
BEGIN
  DECLARE
    nIdUsuario NUMBER;

    dDataVencimento DATE;
    nFGQC NUMBER;
    nCorrecaoMonetaria NUMBER;
    nCorrMonetCalculada NUMBER;
    nCorrMonetLancada NUMBER;
    nJurosRem NUMBER;
    nJurRemCalculado NUMBER;
    nJurRemLancado NUMBER;
    nMulta NUMBER;
    nMultaCalculada NUMBER;
    nMultaLancada NUMBER;
    nJurosMor NUMBER;
    nJurosMorCalculado NUMBER;
    nJurosMorLancado NUMBER;
    nIOFCompl NUMBER;
    nIOFComplCalculado NUMBER;
    nIOFComplLancado NUMBER;
    nSaldoDevedor NUMBER;
    nNumContratoAnterior NUMBER;

    iFlagQuitado INTEGER;

    --Cursor dinâmico
    vQryAtualizaParcelas VARCHAR2(32767);
    atualizar_parcelas CursorPrincipal;

    vQryAtualizaFGQC VARCHAR2(32767);
    atualizar_FGQCs CursorPrincipal;

    --Itens recuperados do cursor dinâmico
    tratParcelas ValCursorTratParcelas_Type;
    tratFGQC     ValCursorTratFGQC_Type;
    
    --Percentuais de desconto
    vPercParcela   NUMBER;
    vPercFGQC      NUMBER;
    vPercCorrMonet NUMBER;
    vPercJurosRemu NUMBER;
    vPercJurosMora NUMBER;
    vPercMulta     NUMBER;
    vPercIofCompl  NUMBER;
    --Meses de atraso do contrato (para buscar desconto para campanha)
    vQtdMesesAtraso PLS_INTEGER := NULL;
    --Valores do desconto
    nDescontoParcela   NUMBER;
    nDescontoFGQC      NUMBER;
    nDescontoCorrMonet NUMBER;
    nDescontoJurosRemu NUMBER;
    nDescontoJurosMora NUMBER;
    nDescontoMulta     NUMBER;
    nDescontoIofCompl  NUMBER;
    --Acumuladores para registrar desconto da campanha
    nTotalParcela   NUMBER := 0;
    nTotalFGQC      NUMBER := 0;
    nTotalCorrMonet NUMBER := 0;
    nTotalJurosRemu NUMBER := 0;
    nTotalJurosMora NUMBER := 0;
    nTotalMulta     NUMBER := 0;
    nTotalIofCompl  NUMBER := 0;

  BEGIN
    IF substr(USER,1,2) = 'CM' THEN
      nIdUsuario := to_number(substr(USER,3));
    ELSE
      nIdUsuario := NULL;
    END IF;
    --Monta query do cursor dinâmico
    vQryAtualizaParcelas :=
        'SELECT hp.idcontratoemptmo,' || chr(13) ||
        '       hp.idhistmovemptmo,' || chr(13) ||
        '       hp.parcela,' || chr(13) ||
        '       hp.numparcelas,' || chr(13) ||
        '       hp.parcelaalt,' || chr(13) ||
        '       hp.vlrprevisto,' || chr(13) ||
        '       hp.dataprevista,' || chr(13) ||
        '       hp.datavencto,' || chr(13) ||
        '       c.txjuros,' || chr(13) ||
        '       c.idplanoorigem,' || chr(13) ||
        '       c.idtipocontremptmo,' || chr(13) ||
        '       c.idpatro,' || chr(13) ||
        '       c.datacredito,' || chr(13) ||
        '       (SELECT SUM(hc.vlrprevisto) FROM hmeconcessao hc' || chr(13) ||
        '        WHERE hc.idcontratoemptmo = hp.idcontratoemptmo' || chr(13) ||
        '        AND   hc.iditememptmo = 22' || chr(13) ||
        '        AND   NVL(hc.flgestornado,0) = 0) AS VALORSOLICITADO,' || chr(13) ||
        '       CASE' || chr(13) ||
        '         WHEN c.idtipocontremptmo IN (89, 95) THEN ''SAC''' || chr(13) ||
        '         ELSE ''PRICE''' || chr(13) ||
        '       END AS SISTAMORTIZACAO' || chr(13) ||
        'FROM hmeprestacao hp' || chr(13) ||
        '     JOIN contratoemptmo  c ON c.idcontratoemptmo = hp.idcontratoemptmo' || chr(13) ||
        'WHERE c.flgsituacao NOT IN (''Q'',''C'',''K'')' || chr(13) ||
        'AND   hp.naturezaitem = 2' || chr(13) ||
        'AND   hp.iditememptmo = 13' || chr(13) ||
        'AND   hp.recpag = ''R''' || chr(13) ||
        'AND   hp.vlrefetivo IS NULL' || chr(13) ||
        'AND   hp.dataefetiva IS NULL' || chr(13) ||
        'AND   hp.flgbaixado = 0' || chr(13) ||        
        'AND   hp.vlrprevisto > 0' || chr(13) ||
        'AND   hp.flgquitabonoestorno = 0' || chr(13) ||
        'AND   hp.datavencto < to_date(''' || to_char(pDataCalculo,'DD/MM/YYYY') || ''',''DD/MM/YYYY'')' || chr(13) ||
        
        'AND   (hp.idtiposuspemptmo IS NULL OR 1 = (SELECT ts.flgemaberto ' || chr(13) ||
        '                                           FROM tiposuspemptmo ts ' || chr(13) ||
        '                                           WHERE ts.idtiposuspemptmo = hp.idtiposuspemptmo)) ' ; -- Leandro WO114811  || chr(13) ||
        -- Lendro WO11481 - inicio      
        IF pTrataParcelaEnviada = 1 THEN
          vQryAtualizaParcelas := vQryAtualizaParcelas || chr(13) || 'AND 0 < (SELECT COUNT(*) FROM histenvioemptmo he ' || chr(13) ||
		                          '          WHERE he.IDHISTMOVEMPTMO = hp.idhistmovemptmo) ';
		END IF;                          
        -- Lendro WO11481 - fim      
        
    IF pTipoProposta = 0 THEN
      vQryAtualizaParcelas := vQryAtualizaParcelas || chr(13) || 'AND   to_char(hp.datavencto,''YYYYMM'') < ' || pAnoMes;
    END IF;
    IF pNumParcela > 0 THEN
      vQryAtualizaParcelas := vQryAtualizaParcelas || chr(13) || 'AND   hp.parcela = ' || to_char(pNumParcela);
    END IF;
    IF pNumContrato > 0 THEN
      vQryAtualizaParcelas := vQryAtualizaParcelas || chr(13) || 'AND   c.idcontratoemptmo = ' || pNumContrato;
    END IF;
    IF pInArquivo > 0 THEN
      vQryAtualizaParcelas := vQryAtualizaParcelas || chr(13) || 'AND   c.idcontratoemptmo IN (SELECT idcontratoemptmo FROM carga.contratoad)';
    END IF;
    IF pNotInArquivo > 0 THEN
      vQryAtualizaParcelas := vQryAtualizaParcelas || chr(13) || 'AND   c.idcontratoemptmo NOT IN (SELECT idcontratoemptmo FROM carga.contratoad)';
    END IF;
    IF pAnoMesCobranca <> '-1' THEN
      vQryAtualizaParcelas := vQryAtualizaParcelas || chr(13) || 'AND   to_char(hp.datavencto,''YYYYMM'') = ' || pAnoMesCobranca;
    END IF;
    IF pAnoMesCompetencia <> '-1' THEN
      vQryAtualizaParcelas := vQryAtualizaParcelas || chr(13) || 'AND   to_char(hp.dataprevista,''YYYYMM'') = ' || pAnoMesCompetencia;
    END IF;
    vQryAtualizaParcelas := vQryAtualizaParcelas || chr(13) || 'ORDER BY hp.idcontratoemptmo, hp.parcela';

    nNumContratoAnterior := 0;
    --Abre cursor dinâmico
    OPEN atualizar_parcelas FOR vQryAtualizaParcelas;
    LOOP
      FETCH atualizar_parcelas INTO tratParcelas;
      EXIT WHEN atualizar_parcelas%NOTFOUND;
      --Confirma se não houve alteração no vencimento durante o processo ou se a prestação foi quitada
      SELECT hp.datavencto, hp.flgquitabonoestorno
      INTO dDataVencimento, iFlagQuitado
      FROM hmeprestacao hp
      WHERE hp.idhistmovemptmo = tratParcelas.Idhistmovemptmo;

      IF dDataVencimento = tratParcelas.Hmedatavencto AND iFlagQuitado = 0 THEN
        IF nNumContratoAnterior <> tratParcelas.Idcontratoemptmo THEN
          nNumContratoAnterior := tratParcelas.Idcontratoemptmo;
          --Busca o saldo devedor na data de lançamento dos encargos
          nSaldoDevedor := NVL(CM.PCK_EMPRESTIMO.FN_SALDODEVEDOR(tratParcelas.Idcontratoemptmo,pDataCalculo),0);
        END IF;

        --Calcula o valor da correção monetária
        nCorrMonetCalculada := CM.FN_EMP_CALC_CORRECAO_MONETARIA(tratParcelas.Hmedataprevista,
                                                                 tratParcelas.Hmevlrprevisto,
                                                                 pDataCalculo);
        --Calcula o valor do juros remuneratórios
        nJurRemCalculado := CM.FN_EMP_CALC_JUR_REMUNERATORIO(tratParcelas.Hmedataprevista,
                                                             tratParcelas.Hmevlrprevisto,
                                                             nCorrMonetCalculada,
                                                             tratParcelas.Hmetxjuros,
                                                             pDataCalculo);
        --Calcula o valor da multa
        nMultaCalculada := CM.FN_EMP_CALC_MULTA(tratParcelas.Hmedataprevista,
                                                tratParcelas.Hmevlrprevisto);
        --Calcula o valor do juros moratórios
        nJurosMorCalculado := CM.FN_EMP_CALC_JUROS_MORATORIOS(tratParcelas.Hmedataprevista,
                                                              tratParcelas.Hmevlrprevisto,
                                                              pDataCalculo);
        --Calcula o valor do IOF Complementar
        nIOFComplCalculado := CM.FN_EMP_CALC_IOF_COMPLEMENTAR(tratParcelas.Hmedataprevista,
                                                              tratParcelas.DataCredito,
                                                              tratParcelas.HmeParcela,
                                                              tratParcelas.HmeNumParcelas,
                                                              tratParcelas.HmeTxjuros, /*Retira /100*/
                                                              tratParcelas.ValorSolicitado,
                                                              pDataCalculo,
                                                              tratParcelas.SistAmortizacao);
        
        --Busca o valor de correção monetária já lançada
        SELECT nvl(SUM(he.vlrprevisto),0)
        INTO nCorrMonetLancada
        FROM hmeencargos he
        WHERE he.idcontratoemptmo = tratParcelas.Idcontratoemptmo
        AND   he.parcela = tratParcelas.Hmeparcela
        AND   he.iditememptmo = 42
        AND   he.vlrefetivo IS NULL
        AND   he.dataefetiva IS NULL
        AND   he.flgquitabonoestorno = 0;

        --Busca o valor de juros remuneratórios já lançado
        SELECT nvl(SUM(he.vlrprevisto),0)
        INTO nJurRemLancado
        FROM hmeencargos he
        WHERE he.idcontratoemptmo = tratParcelas.Idcontratoemptmo
        AND   he.parcela = tratParcelas.Hmeparcela
        AND   he.iditememptmo = 43
        AND   he.vlrefetivo IS NULL
        AND   he.dataefetiva IS NULL
        AND   he.flgquitabonoestorno = 0;

        --Busca o valor de multa já lançada
        SELECT nvl(SUM(he.vlrprevisto),0)
        INTO nMultaLancada
        FROM hmeencargos he
        WHERE he.idcontratoemptmo = tratParcelas.Idcontratoemptmo
        AND   he.parcela = tratParcelas.Hmeparcela
        AND   he.iditememptmo = 44
        AND   he.vlrefetivo IS NULL
        AND   he.dataefetiva IS NULL
        AND   he.flgquitabonoestorno = 0;

        --Busca o valor de juros moratórios já lançado
        SELECT nvl(SUM(he.vlrprevisto),0)
        INTO nJurosMorLancado
        FROM hmeencargos he
        WHERE he.idcontratoemptmo = tratParcelas.Idcontratoemptmo
        AND   he.parcela = tratParcelas.Hmeparcela
        AND   he.iditememptmo = 46
        AND   he.vlrefetivo IS NULL
        AND   he.dataefetiva IS NULL
        AND   he.flgquitabonoestorno = 0;

        --Busca o valor de IOF complementar já lançado
        SELECT nvl(SUM(he.vlrprevisto),0)
        INTO nIOFComplLancado
        FROM hmeencargos he
        WHERE he.idcontratoemptmo = tratParcelas.Idcontratoemptmo
        AND   he.parcela = tratParcelas.Hmeparcela
        AND   he.iditememptmo = 121
        AND   he.vlrefetivo IS NULL
        AND   he.dataefetiva IS NULL
        AND   he.flgquitabonoestorno = 0;

        --Insere os itens de encargos
        --Correção monetária
        nCorrecaoMonetaria := nCorrMonetCalculada - nCorrMonetLancada;
        IF nCorrecaoMonetaria <> 0 THEN
          INSEREITEM(tratParcelas.Idtipocontremptmo,
                     tratParcelas.Idcontratoemptmo,
                     42,
                     tratParcelas.Hmeparcela,
                     nCorrecaoMonetaria,
                     nSaldoDevedor,
                     tratParcelas.Hmenumparcelas,
                     tratParcelas.Hmeparcelaalt);
        END IF;
        --Juros Remuneratórios
        nJurosRem := nJurRemCalculado - nJurRemLancado;
        IF nJurosRem <> 0 THEN
          INSEREITEM(tratParcelas.Idtipocontremptmo,
                     tratParcelas.Idcontratoemptmo,
                     43,
                     tratParcelas.Hmeparcela,
                     nJurosRem,
                     nSaldoDevedor,
                     tratParcelas.Hmenumparcelas,
                     tratParcelas.Hmeparcelaalt);
        END IF;
        --Multa
        nMulta := nMultaCalculada - nMultaLancada;
        IF nMulta <> 0 THEN
          INSEREITEM(tratParcelas.Idtipocontremptmo,
                     tratParcelas.Idcontratoemptmo,
                     44,
                     tratParcelas.Hmeparcela,
                     nMulta,
                     nSaldoDevedor,
                     tratParcelas.Hmenumparcelas,
                     tratParcelas.Hmeparcelaalt);
        END IF;
        --Juros Moratórios
        nJurosMor := nJurosMorCalculado - nJurosMorLancado;
        IF nJurosMor <> 0 THEN
          INSEREITEM(tratParcelas.Idtipocontremptmo,
                     tratParcelas.Idcontratoemptmo,
                     46,
                     tratParcelas.Hmeparcela,
                     nJurosMor,
                     nSaldoDevedor,
                     tratParcelas.Hmenumparcelas,
                     tratParcelas.Hmeparcelaalt);
        END IF;
        --IOF Complementar
        nIOFCompl := nIOFComplCalculado - nIOFComplLancado;
        IF nIOFCompl <> 0 THEN
          INSEREITEM(tratParcelas.Idtipocontremptmo,
                     tratParcelas.Idcontratoemptmo,
                     121,
                     tratParcelas.Hmeparcela,
                     nIOFCompl,
                     nSaldoDevedor,
                     tratParcelas.Hmenumparcelas,
                     tratParcelas.Hmeparcelaalt);
        END IF;
        
        --Busca os itens de desconto (Atenção: só calcula o desconto caso tenha sido informado o número do contrato, ou seja, não deve ser calculado desconto em lote)
        IF pTipoProposta > 0 AND pNumContrato IS NOT NULL THEN
          
          IF vQtdMesesAtraso IS NULL THEN
            vQtdMesesAtraso := BUSCA_QTDE_MESES_ATRASO;

            /*SIG 136726 - inclusão da linha baixo*/
            QtdPeriodoAtraso :=  CM.PCK_EMPRESTIMO.FN_BUSCA_QTD_DIAS_ATRASO(pNumContrato, pDataCalculo);

            /*SIG 136726 - Alteração da variável vQtdMesesAtraso pela QtdPeriodoAtraso*/
            --Busca os percentuais de desconto
            vPercParcela := CM.PCK_EMPRESTIMO.FN_BUSCA_PERCENTUAL_DESCONTO(13,pTipoProposta, QtdPeriodoAtraso)/100;
            vPercFGQC := CM.PCK_EMPRESTIMO.FN_BUSCA_PERCENTUAL_DESCONTO(99, pTipoProposta, QtdPeriodoAtraso)/100;
            vPercCorrMonet := CM.PCK_EMPRESTIMO.FN_BUSCA_PERCENTUAL_DESCONTO(42, pTipoProposta, QtdPeriodoAtraso)/100;
            vPercJurosRemu := CM.PCK_EMPRESTIMO.FN_BUSCA_PERCENTUAL_DESCONTO(43, pTipoProposta, QtdPeriodoAtraso)/100;
            vPercJurosMora := CM.PCK_EMPRESTIMO.FN_BUSCA_PERCENTUAL_DESCONTO(46, pTipoProposta, QtdPeriodoAtraso)/100;
            vPercMulta := CM.PCK_EMPRESTIMO.FN_BUSCA_PERCENTUAL_DESCONTO(44, pTipoProposta, QtdPeriodoAtraso)/100;
            vPercIofCompl := CM.PCK_EMPRESTIMO.FN_BUSCA_PERCENTUAL_DESCONTO(121, pTipoProposta, QtdPeriodoAtraso)/100;           
          END IF;        
          
          nDescontoParcela := ROUND(vPercParcela * tratParcelas.Hmevlrprevisto, 2) * -1;
          IF nDescontoParcela < 0 THEN
            INSEREITEM(tratParcelas.Idtipocontremptmo,
                       tratParcelas.Idcontratoemptmo,
                       146,
                       tratParcelas.Hmeparcela,
                       nDescontoParcela,
                       nSaldoDevedor,
                       tratParcelas.Hmenumparcelas,
                       tratParcelas.Hmeparcelaalt);
          END IF;
          
          --Busca o valor do FGQC da parcela em processamento
          BEGIN
            SELECT hp.vlrprevisto
            INTO nFGQC
            FROM hmeprestacao hp
            WHERE hp.iditememptmo = 99
            AND   hp.naturezaitem = 1
            AND   hp.idcontratoemptmo = tratParcelas.Idcontratoemptmo
            AND   hp.parcela = tratParcelas.hmeparcela
            AND   hp.vlrefetivo IS NULL
            AND   hp.dataefetiva IS NULL
            AND   hp.flgquitabonoestorno = 0
           AND   hp.dataprevista < pDataCalculo
            AND  hp.datavencto <= pDataCalculo
            AND   hp.flgbaixado = 0
            AND   hp.recpag = 'R'
            AND  hp.flgenvio=0
            AND   hp.vlrprevisto > 0;
          EXCEPTION
            WHEN NO_DATA_FOUND THEN 
              nFGQC := 0;
          END;
          nDescontoFGQC := ROUND(vPercFGQC * nFGQC, 2) * -1;
          IF nDescontoFGQC < 0 THEN
            INSEREITEM(tratParcelas.Idtipocontremptmo,
                       tratParcelas.Idcontratoemptmo,
                       147,
                       tratParcelas.Hmeparcela,
                       nDescontoFGQC,
                       nSaldoDevedor,
                       tratParcelas.Hmenumparcelas,
                       tratParcelas.Hmeparcelaalt);
          END IF;
          
          nDescontoCorrMonet := ROUND(vPercCorrMonet * nCorrMonetCalculada, 2) * -1;
          IF nDescontoCorrMonet < 0 THEN
            INSEREITEM(tratParcelas.Idtipocontremptmo,
                       tratParcelas.Idcontratoemptmo,
                       148,
                       tratParcelas.Hmeparcela,
                       nDescontoCorrMonet,
                       nSaldoDevedor,
                       tratParcelas.Hmenumparcelas,
                       tratParcelas.Hmeparcelaalt);
          END IF;
          nDescontoJurosRemu := ROUND(vPercJurosRemu * nJurRemCalculado, 2) * -1;
          IF nDescontoJurosRemu < 0 THEN
            INSEREITEM(tratParcelas.Idtipocontremptmo,
                       tratParcelas.Idcontratoemptmo,
                       149,
                       tratParcelas.Hmeparcela,
                       nDescontoJurosRemu,
                       nSaldoDevedor,
                       tratParcelas.Hmenumparcelas,
                       tratParcelas.Hmeparcelaalt);
          END IF;
          nDescontoJurosMora := ROUND(vPercJurosMora * nJurosMorCalculado, 2) * -1;
          IF nDescontoJurosMora < 0 THEN
            INSEREITEM(tratParcelas.Idtipocontremptmo,
                       tratParcelas.Idcontratoemptmo,
                       150,
                       tratParcelas.Hmeparcela,
                       nDescontoJurosMora,
                       nSaldoDevedor,
                       tratParcelas.Hmenumparcelas,
                       tratParcelas.Hmeparcelaalt);
          END IF;                 
          nDescontoMulta := ROUND(vPercMulta * nMultaCalculada, 2) * -1;
          IF nDescontoMulta < 0 THEN
            INSEREITEM(tratParcelas.Idtipocontremptmo,
                       tratParcelas.Idcontratoemptmo,
                       151,
                       tratParcelas.Hmeparcela,
                       nDescontoMulta,
                       nSaldoDevedor,
                       tratParcelas.Hmenumparcelas,
                       tratParcelas.Hmeparcelaalt);
          END IF;
          nDescontoIofCompl := ROUND(vPercIofCompl * nIOFComplCalculado, 2) * -1;
          IF nDescontoIofCompl < 0 THEN
            INSEREITEM(tratParcelas.Idtipocontremptmo,
                       tratParcelas.Idcontratoemptmo,
                       152,
                       tratParcelas.Hmeparcela,
                       nDescontoIofCompl,
                       nSaldoDevedor,
                       tratParcelas.Hmenumparcelas,
                       tratParcelas.Hmeparcelaalt);
          END IF;
          
          nTotalParcela   := nTotalParcela + tratParcelas.hmevlrprevisto;
          nTotalFGQC      := nTotalFGQC + nFGQC;
          nTotalCorrMonet := nTotalCorrMonet + nCorrMonetCalculada;
          nTotalJurosRemu := nTotalJurosRemu + nJurRemCalculado;
          nTotalJurosMora := nTotalJurosMora +nJurosMorCalculado;
          nTotalMulta     := nTotalMulta + nMultaCalculada;
          nTotalIofCompl  := nTotalIofCompl + nIOFComplCalculado;
        END IF;

        --Segunda confirmação de alteração da data de vencimento ou quitação da parcela
        SELECT hp.datavencto, hp.flgquitabonoestorno
        INTO dDataVencimento, iFlagQuitado
        FROM hmeprestacao hp
        WHERE hp.idhistmovemptmo = tratParcelas.Idhistmovemptmo;

        IF dDataVencimento = tratParcelas.Hmedatavencto AND iFlagQuitado = 0 THEN
          --Atualiza os itens já existentes
          --Parcela e FGQC
          UPDATE hmeprestacao hp
          SET   hp.datavencto = pDataCalculo,
                hp.flgenvio = 0,
                hp.formacobranca = 'C',
                hp.tipofolha = NULL
          WHERE hp.idcontratoemptmo = tratParcelas.Idcontratoemptmo
          AND   hp.parcela = tratParcelas.Hmeparcela
          AND   hp.dataprevista < pDataCalculo
          AND  hp.datavencto <= pDataCalculo
          AND   hp.naturezaitem > 0
          AND   hp.dataefetiva IS NULL
          AND   hp.vlrefetivo IS NULL
          AND  hp.flgenvio=0
          AND   hp.flgquitabonoestorno = 0;
          --Encargos
          UPDATE hmeencargos he
          SET   he.datavencto = pDataCalculo,
                he.flgenvio = 0,
                he.formacobranca = 'C',
                he.tipofolha = NULL
          WHERE he.idcontratoemptmo = tratParcelas.Idcontratoemptmo
          AND   he.parcela = tratParcelas.Hmeparcela
          AND   he.dataprevista < pDataCalculo
          AND  he.datavencto <= pDataCalculo
          AND   he.naturezaitem > 0
          AND   he.dataefetiva IS NULL
          AND   he.vlrefetivo IS NULL
          AND   he.flgquitabonoestorno = 0;
          --Limpa envio
          UPDATE hmeenvio hev
          SET   hev.coddocumento = NULL,
                hev.idtmpdesc = NULL
          WHERE hev.idhistmovemptmo IN (SELECT hp.idhistmovemptmo
                                        FROM hmeprestacao hp
                                        WHERE hp.idcontratoemptmo = tratParcelas.Idcontratoemptmo
                                        AND   hp.parcela = tratParcelas.Hmeparcela
                                        AND   hp.datavencto = pDataCalculo
                                        AND   hp.flgenvio = 0
                                        AND   hp.flgquitabonoestorno = 0
                                        UNION ALL
                                        SELECT he.idhistmovemptmo
                                        FROM hmeencargos he
                                        WHERE he.idcontratoemptmo = tratParcelas.Idcontratoemptmo
                                        AND   he.parcela = tratParcelas.Hmeparcela
                                        AND   he.datavencto = pDataCalculo
                                        AND   he.flgenvio = 0
                                        AND   he.flgquitabonoestorno = 0);
          --Marca a data do tratamento
          UPDATE hmetratadiverg ht
          SET ht.datatratindiv = decode(pNumParcela,0,NULL,SYSDATE),
              ht.datadivergtrat = decode(pNumParcela,0,SYSDATE,NULL),
              ht.idusuarioindiv = decode(pNumParcela,0,NULL,nIdUsuario),
              ht.idusuariodiverg = decode(pNumParcela,0,nIdUsuario,NULL),
              ht.flgtratindiv = decode(pNumParcela,0,0,1),
              ht.flgdivergtrat = decode(pNumParcela,0,1,0)
          WHERE ht.idhistmovemptmo = tratParcelas.Idhistmovemptmo;

          IF SQL%ROWCOUNT = 0 THEN
            INSERT INTO hmetratadiverg (idhistmovemptmo,
                                        flgtratindiv,
                                        flgdivergtrat,
                                        idusuarioindiv,
                                        idusuariodiverg,
                                        datatratindiv,
                                        datadivergtrat)
                 VALUES (tratParcelas.Idhistmovemptmo,
                         decode(pNumParcela,0,0,1),
                         decode(pNumParcela,0,1,0),
                         decode(pNumParcela,0,NULL,nIdUsuario),
                         decode(pNumParcela,0,nIdUsuario,NULL),
                         decode(pNumParcela,0,NULL,SYSDATE),
                         decode(pNumParcela,0,SYSDATE,NULL));
          END IF;

          /*MERGE INTO hmetratadiverg ht --(comando alterado para INSERT/UPDATE/SQL%ROWCOUNT devido a Problemas de performance)
          USING (SELECT hp.idhistmovemptmo
                 FROM hmeprestacao hp
                 WHERE hp.idcontratoemptmo = tratParcelas.Idcontratoemptmo
                 AND   hp.parcela = tratParcelas.Hmeparcela
                 AND   hp.datavencto = pDataCalculo
                 AND   hp.flgenvio = 0
                 AND   hp.flgquitabonoestorno = 0
                 UNION ALL
                 SELECT he.idhistmovemptmo
                 FROM hmeencargos he
                 WHERE he.idcontratoemptmo = tratParcelas.Idcontratoemptmo
                 AND   he.parcela = tratParcelas.Hmeparcela
                 AND   he.datavencto = pDataCalculo
                 AND   he.flgenvio = 0
                 AND   he.flgquitabonoestorno = 0) hme
          ON (ht.idhistmovemptmo = hme.idhistmovemptmo)
          WHEN MATCHED THEN UPDATE SET ht.datadivergtrat = SYSDATE
          WHEN NOT MATCHED THEN INSERT VALUES (hme.IDHISTMOVEMPTMO,
                                               NULL,
                                               NULL,
                                               1,
                                               NULL,
                                               nIdUsuario,
                                               NULL,
                                               SYSDATE,
                                               NULL,
                                               NULL,
                                               NULL);*/

          INSERT INTO logtotalprev (IDLOGTOTALPREV,
                                    IDMODULO,
                                    DESCOPERACAO,
                                    IDUSUARIO,
                                    DATA,
                                    IDPESQUISA1,
                                    IDPESQUISA2,
                                    ORIGEM,
                                    VERSAO,
                                    IDPESQUISA3)
               VALUES (seqlogtotalprev.nextval,
                       15,
                       'Atualiza Histórico e Limpa CodDocumento - parcela ' || to_char(tratParcelas.Hmeparcela),
                       nIdUsuario,
                       SYSDATE,
                       tratParcelas.Idcontratoemptmo,
                       NULL,
                       4,
                       vVersao,
                       NULL);
          COMMIT;
        ELSE
          ROLLBACK;
        END IF;
      END IF;
    END LOOP;
    
    --Atualiza os itens de FGQC de parcelas que não possuem prestações em aberto
    vQryAtualizaFGQC :=
        'SELECT hp.idcontratoemptmo,' || chr(13) ||
        '       hp.idhistmovemptmo,' || chr(13) ||
        '       hp.parcela,' || chr(13) ||
        '       hp.numparcelas,' || chr(13) ||
        '       hp.parcelaalt,' || chr(13) ||
        '       hp.vlrprevisto,' || chr(13) ||
        '       c.idtipocontremptmo' || chr(13) ||
        'FROM hmeprestacao hp' || chr(13) ||
        '     JOIN contratoemptmo c ON c.idcontratoemptmo = hp.idcontratoemptmo' || chr(13) ||
        'WHERE NOT EXISTS (SELECT 1 FROM contratoemptmo c ' || chr(13) ||
        '                  WHERE c.flgsituacao IN (''Q'',''C'',''K'') ' || chr(13) ||
        '                  AND   c.idcontratoemptmo = hp.idcontratoemptmo) ' || chr(13) ||
        'AND   hp.naturezaitem = 1 ' || chr(13) ||
        'AND   hp.iditememptmo = 99 ' || chr(13) ||
        'AND   hp.vlrefetivo IS NULL ' || chr(13) ||
        'AND   hp.dataefetiva IS NULL ' || chr(13) ||
        'AND   hp.flgbaixado = 0 ' || chr(13) ||
        'AND   hp.recpag = ''R'' ' || chr(13) ||
        'AND   hp.vlrprevisto > 0 ' || chr(13) ||
         'AND   hp.flgenvio= 0 ' || chr(13) ||
         'AND   hp.flgquitabonoestorno = 0 ' || chr(13) ||
        'AND   hp.datavencto < to_date(''' || to_char(pDataCalculo,'DD/MM/YYYY') || ''',''DD/MM/YYYY'') ' || chr(13) ||
        'AND   (hp.idtiposuspemptmo IS NULL OR 1 = (SELECT ts.flgemaberto ' || chr(13) ||
        '                                           FROM tiposuspemptmo ts ' || chr(13) ||
        '                                           WHERE ts.idtiposuspemptmo = hp.idtiposuspemptmo)) ' || chr(13) ||
        'AND 0 < (SELECT COUNT(*) FROM histenvioemptmo he ' || chr(13) ||
		'          WHERE he.IDHISTMOVEMPTMO = hp.idhistmovemptmo) ';
        
    IF pTipoProposta = 0 THEN
      vQryAtualizaParcelas := vQryAtualizaParcelas || chr(13) || 'AND   to_char(hp.datavencto,''YYYYMM'') < ' || pAnoMes;
    END IF;
    IF pNumParcela > 0 THEN
      vQryAtualizaFGQC := vQryAtualizaFGQC || chr(13) || 'AND   hp.parcela = ' || to_char(pNumParcela);
    END IF;
    IF pNumContrato > 0 THEN
      vQryAtualizaFGQC := vQryAtualizaFGQC || chr(13) || 'AND   hp.idcontratoemptmo = ' || pNumContrato;
    END IF;
    IF pInArquivo > 0 THEN
      vQryAtualizaFGQC := vQryAtualizaFGQC || chr(13) || 'AND   hp.idcontratoemptmo IN (SELECT idcontratoemptmo FROM carga.contratoad)';
    END IF;
    IF pNotInArquivo > 0 THEN
      vQryAtualizaFGQC := vQryAtualizaFGQC || chr(13) || 'AND   hp.idcontratoemptmo NOT IN (SELECT idcontratoemptmo FROM carga.contratoad)';
    END IF;
    IF pAnoMesCobranca <> '-1' THEN
      vQryAtualizaFGQC := vQryAtualizaFGQC || chr(13) || 'AND   to_char(hp.datavencto,''YYYYMM'') = ' || pAnoMesCobranca;
    END IF;
    IF pAnoMesCompetencia <> '-1' THEN
      vQryAtualizaFGQC := vQryAtualizaFGQC || chr(13) || 'AND   to_char(hp.dataprevista,''YYYYMM'') = ' || pAnoMesCompetencia;
    END IF;
    vQryAtualizaFGQC := vQryAtualizaFGQC || chr(13) || 'ORDER BY hp.idcontratoemptmo, hp.parcela';

    OPEN atualizar_FGQCs FOR vQryAtualizaFGQC;
    LOOP
      FETCH atualizar_FGQCs INTO tratFGQC;
      EXIT WHEN atualizar_FGQCs%NOTFOUND;
        --Retira informações de envio
        UPDATE hmeenvio he
        SET   he.coddocumento = NULL,
              he.idtmpdesc = NULL
        WHERE he.idhistmovemptmo = tratFGQC.idhistmovemptmo;
                --Altera vencimento do item
        UPDATE hmeprestacao hp
        SET   hp.datavencto = pDataCalculo,
              hp.flgenvio = 0,
              hp.formacobranca = 'C',
              hp.tipofolha = NULL
        WHERE hp.idhistmovemptmo = tratFGQC.idhistmovemptmo;
        --Insere desconto
        IF pTipoProposta > 0 AND pNumContrato IS NOT NULL THEN
          IF vQtdMesesAtraso IS NULL THEN
            vQtdMesesAtraso := BUSCA_QTDE_MESES_ATRASO;
            vPercFGQC := CM.PCK_EMPRESTIMO.FN_BUSCA_PERCENTUAL_DESCONTO(99, pTipoProposta, vQtdMesesAtraso)/100;
          END IF;
          nDescontoFGQC := ROUND(vPercFGQC * tratFGQC.Hmevlrprevisto, 2) * -1;
          IF nDescontoParcela < 0 THEN
            INSEREITEM(tratFGQC.Idtipocontremptmo,
                       tratFGQC.Idcontratoemptmo,
                       147,
                       tratFGQC.Hmeparcela,
                       nDescontoFGQC,
                       nSaldoDevedor,
                       tratFGQC.Hmenumparcelas,
                       tratFGQC.Hmeparcelaalt);
          END IF;
          nTotalFGQC := nTotalFGQC + tratFGQC.Hmevlrprevisto;
        END IF;
    END LOOP;
    --Registra o valor de desconto para o contrato (Campanha de Recuperação de Crédito)
    IF pTipoProposta > 0 THEN
      IF pNumContrato IS NOT NULL THEN
            ValorSaldoDevedor := CM.PCK_AA_FUNCAO_EMPTMO.FN_BUSCA_SALDO_DEVEDOR(pNumContrato, pDataCalculo);           
            
            ValorDescParcela   := ROUND(nTotalParcela * vPercParcela,2);
			ValorDescFGQC      := ROUND(nTotalFGQC * vPercFGQC,2);
			ValorDescCorrMonet := ROUND(nTotalCorrMonet * vPercCorrMonet,2);
			ValorDescJurosRemu := ROUND(nTotalJurosRemu * vPercJurosRemu,2); 
			ValorDescJurosMora := ROUND(nTotalJurosMora * vPercJurosMora,2);
			ValorDescMulta     := ROUND(nTotalMulta * vPercMulta,2);
			ValorDescIofCompl  := ROUND(nTotalIofCompl * vPercIofCompl,2);
           
		    /*SIG 136726 - Inclusao nos inserts as colunas: QTDDIASATRASO, VALORDESCONTO e VALORSALDODEVEDOR */           
	        INSERT INTO CM.DESCONTOCAMPANHAEMPTMO (IDCONTRATOEMPTMO,DATAOPERACAO,IDITEMEMPTMO,PERCDESCONTO,VALORNOMINAL,
	                                               TIPOPROPOSTA,MESESATRASO, QTDDIASATRASO, VALORDESCONTO, VALORSALDODEVEDOR)
	                    VALUES (pNumContrato,pDataCalculo,13,vPercParcela,nTotalParcela,pTipoProposta,vQtdMesesAtraso, 
	                    QtdPeriodoAtraso,ValorDescParcela,ValorSaldoDevedor);
	                    
	        INSERT INTO CM.DESCONTOCAMPANHAEMPTMO (IDCONTRATOEMPTMO,DATAOPERACAO,IDITEMEMPTMO,PERCDESCONTO,VALORNOMINAL,
	                                               TIPOPROPOSTA,MESESATRASO, QTDDIASATRASO, VALORDESCONTO, VALORSALDODEVEDOR)
	                    VALUES (pNumContrato,pDataCalculo,99,vPercFGQC,nTotalFGQC,pTipoProposta,vQtdMesesAtraso, 
	                            QtdPeriodoAtraso,ValorDescFGQC,ValorSaldoDevedor);
	                            
	        INSERT INTO CM.DESCONTOCAMPANHAEMPTMO (IDCONTRATOEMPTMO,DATAOPERACAO,IDITEMEMPTMO,PERCDESCONTO,VALORNOMINAL,
	                                               TIPOPROPOSTA,MESESATRASO, QTDDIASATRASO, VALORDESCONTO, VALORSALDODEVEDOR)
	                    VALUES (pNumContrato,pDataCalculo,42,vPercCorrMonet,nTotalCorrMonet,pTipoProposta,vQtdMesesAtraso, 
	                            QtdPeriodoAtraso,ValorDescCorrMonet,ValorSaldoDevedor);
	                            
	        INSERT INTO CM.DESCONTOCAMPANHAEMPTMO (IDCONTRATOEMPTMO,DATAOPERACAO,IDITEMEMPTMO,PERCDESCONTO,VALORNOMINAL,
	                                               TIPOPROPOSTA,MESESATRASO, QTDDIASATRASO, VALORDESCONTO, VALORSALDODEVEDOR)
	                    VALUES (pNumContrato,pDataCalculo,43,vPercJurosRemu,nTotalJurosRemu,pTipoProposta,vQtdMesesAtraso, 
	                            QtdPeriodoAtraso,ValorDescJurosRemu,ValorSaldoDevedor);
	                            
	        INSERT INTO CM.DESCONTOCAMPANHAEMPTMO (IDCONTRATOEMPTMO,DATAOPERACAO,IDITEMEMPTMO,PERCDESCONTO,VALORNOMINAL,
	                                               TIPOPROPOSTA,MESESATRASO, QTDDIASATRASO, VALORDESCONTO, VALORSALDODEVEDOR)
	                    VALUES (pNumContrato,pDataCalculo,46,vPercJurosMora,nTotalJurosMora,pTipoProposta,vQtdMesesAtraso, 
	                            QtdPeriodoAtraso,ValorDescJurosMora,ValorSaldoDevedor);
	                            
	        INSERT INTO CM.DESCONTOCAMPANHAEMPTMO (IDCONTRATOEMPTMO,DATAOPERACAO,IDITEMEMPTMO,PERCDESCONTO,VALORNOMINAL,
	                                               TIPOPROPOSTA,MESESATRASO, QTDDIASATRASO, VALORDESCONTO, VALORSALDODEVEDOR)
	                    VALUES (pNumContrato,pDataCalculo,44,vPercMulta,nTotalMulta,pTipoProposta,vQtdMesesAtraso, 
	                            QtdPeriodoAtraso,ValorDescMulta,ValorSaldoDevedor);
	                            
	        INSERT INTO CM.DESCONTOCAMPANHAEMPTMO (IDCONTRATOEMPTMO,DATAOPERACAO,IDITEMEMPTMO,PERCDESCONTO,VALORNOMINAL,
	                                               TIPOPROPOSTA,MESESATRASO, QTDDIASATRASO, VALORDESCONTO, VALORSALDODEVEDOR)
	                    VALUES (pNumContrato,pDataCalculo,121,vPercIofCompl,nTotalIofCompl,pTipoProposta,vQtdMesesAtraso, 
	                            QtdPeriodoAtraso,ValorDescIofCompl,ValorSaldoDevedor);
      END IF;
      --WO8160 - Retirado bloqueio por ser inserido projeto do Autoatendimento.
      --INSERE_BLOQUEIO_CONCESSAO;
    END IF;
    
    COMMIT;
  END;
END;