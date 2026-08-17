CREATE OR REPLACE PROCEDURE CM.PR_MAPAMOVEMPTMO(pDataRefer IN VARCHAR2,
                                                pContratos IN VARCHAR2 DEFAULT NULL,
                                                pReprocessar IN number default 0,
                                                PINARQUIVO IN number,
                                                PNOTINARQUIVO IN number,
												pDataInicio IN VARCHAR2 DEFAULT NULL,
												pDataFim IN VARCHAR2 DEFAULT NULL) 
IS
	/* Histórico de alterações
	   26/11/2020 - Manoel Matias - SIG 103931 - Incluída função que busca percentual para provisão de perda
	   08/04/2022 - Marimar Soares/Ewerton - SIG 114151 - Inclusão dos campos (OrigemConcessao, SexoPartic, IdadePartic, UF, DataNasc)                                       
	   23/11/2023 - Leandro Pocebon - WO 4233 - Inclusão dos campos (DataInicio e DataFim do processamento para seleção)                                       
	*/
    MesAnoRefer      VARCHAR(7);
    DataRefer        DATE;
    DataReferDia1    DATE;
    DataReferAnt     DATE;
    DataReferAntDia1 DATE;
    AnoMesRefer      VARCHAR(7); --Taffarel - SIG66626

    --Informações principais
    PlanoContabil VARCHAR2(50);
    Patro VARCHAR2(6);
    CPF CHAR(18);
    OrigemConcessao VARCHAR(15);
    Matricula VARCHAR(7);
    DataCredito DATE;
    NomeBenef VARCHAR2(60);
    SitParticip VARCHAR2(50);
    SitContrato VARCHAR2(30);
    TxJuros NUMBER;
    NumParcelas INTEGER;
    TipoContrato VARCHAR2(60);
    SaldoAtual NUMBER;
    SaldoAnterior NUMBER;
    QuitSegRet NUMBER;
    AtuDiaCM NUMBER;
    AtuDiaJuros NUMBER;
    QuantPrest INTEGER;
    QuantPrestAnterior INTEGER;
    ValorPrest NUMBER;
    QuitBruto NUMBER;
    QuitLiquido NUMBER;
    QuitFGQC NUMBER;
    QuitDeFundGarant NUMBER;
    SaldoVencDevolucoes NUMBER;
    SaldoVencRecebimento NUMBER;
    Amortizacao NUMBER;
    IOF NUMBER;
    Seguro NUMBER;
    DataRepac DATE;
    ParcRepac INTEGER;
    TaxaRepac NUMBER;
    TipoSusp VARCHAR2(60);
    QuantSusp INTEGER;
    Liminar VARCHAR2(3);
    Liminar1 VARCHAR2(3);
    AjusteSaldoDev NUMBER;
    AjusteSaldoOutros NUMBER;
    AjusteSeguro NUMBER;
    QuitacaoDevolucaoFGQC NUMBER;
    AjusteSaldoVenc NUMBER;
    FundoGarantidor NUMBER;
    DevolFundoGarant NUMBER;
    AjustePrestacao NUMBER;
    EncargCorrMonet NUMBER;
    EncargJurosRem NUMBER;
    EncargMulta NUMBER;
    EncargJurosMora NUMBER;
    DevolucaoEncargos NUMBER;
    ValorSolicitado NUMBER;
    QuitacaoParcelas NUMBER;
    QuitacaoCM NUMBER;
    QuitacaoJurosRem NUMBER;
    QuitacaoJurosMora NUMBER;
    QuitacaoMulta NUMBER;
    QuitacaoCMDif NUMBER;
    QuitacaoJurRemDif NUMBER;
    QuitacaoJurMorDif NUMBER;
    QuitacaoMultaDif NUMBER;
    ComplSeg NUMBER;
    IncorpPrest NUMBER;
    IncorpSeg NUMBER;
    EstornJuros NUMBER;
    EstornCorr NUMBER;
    DevolSaldDev NUMBER;
    AjustSaldResid NUMBER;
    AjusteCM NUMBER;
    AjusteJuros NUMBER;
    AjusteMora NUMBER;
    AjusteMulta NUMBER;
    DespCorrecao NUMBER;
    DespJuros NUMBER;
    FGQCAbonado NUMBER;
    ValorConcedido NUMBER;
    EncargIOFCompl NUMBER;
    QuitaçãoIOFCompl NUMBER;
    QuitaçãoIOFComplDif NUMBER;
    PerdaEfetiva VARCHAR2(3);
    DataPerdaEfetiva DATE;
    SituacaoConsolidada VARCHAR(50);
    ContratosApoio NUMBER;
     SexoPartic VARCHAR(15);
     IdadePartic NUMBER;
     UF VARCHAR(3);
     DataNasc DATE;
     
    --Perfil de investimento
--Taffarel - SIG66626 - início
    PerfilInvest VARCHAR2(60);
    PerfilAnterior VARCHAR2(60) := '';
    PerfilAtual VARCHAR2(60) := '';
    SaldoDev NUMBER := NULL;
    SaldoVenc NUMBER := NULL;
    ProvPerdas NUMBER := NULL;
    Controle NUMBER;
--Taffarel - SIG66626 - fim

    --Inadimplência
    DataPrevistaInad DATE;
    VlrPrevistoInad NUMBER;
    VlrInadPrescrita NUMBER;
    EncargosInad NUMBER;
    QuantInad INTEGER;
    TotalInad NUMBER;
    PercProv NUMBER;
    VlrProvPerd NUMBER;
    QuitacaoInad NUMBER;
    ValorInadMesAtual NUMBER;
    ValorInadAnt NUMBER;
    PercProvPerdAnt NUMBER;
    VlrProvPerdAnt NUMBER;
    SaldoProvRegistradoAnt NUMBER;
    InpcContrato NUMBER;

    --IOF
    VlrIOFApropriado NUMBER;
    VlrIOFPago NUMBER;
    VlrIOFAbonado NUMBER;
    VlrIOFRecolhido NUMBER;
    VerificaQuitacaoMesAnterior NUMBER; 
    
    contador  number;

     iCommit NUMBER := 1; --Controla a quantidade de linhas comitadas

    pContrato NUMBER := to_NUMBER(pContratos);
    DifDias INTEGER := 0; -- para percentual de provisão de perdas

    pINARQUIVOAD NUMBER := to_NUMBER(PINARQUIVO);
    pNOTINARQUIVOAD NUMBER := to_NUMBER(PNOTINARQUIVO);
    
    CURSOR inadimplencia(varNumContrato NUMBER) IS
       SELECT
          MIN(dataprevista) AS DATAPREVISTA,
          SUM(VLRPREVISTO) AS VALORPREVISTO,
          SUM(encargos) AS ENCARGOS,
          SUM(quant) AS QUANTIDADE,
          PARCELA
       FROM (
               SELECT
                  MIN(hme.dataprevista) AS DATAPREVISTA,
                  SUM(hme.vlrprevisto) AS VLRPREVISTO,
                  0 AS ENCARGOS,
                  COUNT(*) AS QUANT,
                  hme.parcela AS PARCELA
               FROM HMEALL hme
               WHERE hme.idcontratoemptmo = varNumContrato
               AND   hme.tipomov IN (1,2,6,7,3)
               AND   hme.naturezaitem > 0
               AND   hme.dataprevista <= DATAREFER
               AND   (hme.dataefetiva IS NULL OR hme.dataefetiva > DATAREFER)
               AND   (hme.vlrefetivo IS NULL OR hme.dataefetiva > DATAREFER)
               AND   (hme.flgquitabonoestorno = 0 OR hme.flgquitabonoestorno IN (1,2) AND hme.dataquitabonoestorno > DATAREFER)
               AND   (hme.idtiposuspemptmo IS NULL OR 1 = (SELECT ts.flgemaberto
                                                           FROM tiposuspemptmo ts
                                                           WHERE ts.idtiposuspemptmo = hme.idtiposuspemptmo))
               AND   (hme.iditememptmo <> 50 OR (hme.iditememptmo = 50 and 0 = (SELECT itc.itctratasaldodev
                                                                                FROM itemxtipocontr itc
                                                                                     JOIN contratoemptmo c ON c.idtipocontremptmo = itc.idtipocontremptmo
                                                                                WHERE itc.iditememptmo = hme.iditememptmo
                                                                                AND   c.idcontratoemptmo = hme.idcontratoemptmo)))
               GROUP BY hme.parcela
              UNION ALL
               SELECT
                  MIN(hme.dataprevista) AS DATAPREVISTA,
                  0 AS VLRPREVISTO,
                  NVL(SUM(HME.VLRPREVISTO),0) AS ENCARGOS,
                  0 AS QUANT,
                  hme.parcela AS PARCELA
               FROM HMEENCARGOS hme
               WHERE hme.idcontratoemptmo = varNumContrato
               AND   hme.iditememptmo <> 121
               AND   hme.naturezaitem > 0
               AND   hme.dataprevista <= DATAREFER
               AND   (hme.dataefetiva IS NULL OR hme.dataefetiva > DATAREFER)
               AND   (hme.vlrefetivo IS NULL OR hme.dataefetiva > DATAREFER)
               AND   (hme.flgquitabonoestorno = 0 OR hme.flgquitabonoestorno IN (1,2) AND hme.dataquitabonoestorno > DATAREFER)
               GROUP BY hme.parcela
            )
            GROUP BY PARCELA
            ORDER BY DATAPREVISTA;

        inad inadimplencia%ROWTYPE;

  BEGIN
 
	insert into cm.mapamov_controle values (pDataRefer, 'Início', sysdate, user);

    /********Selecione o mês/ano desejado para o processamento********/
    MesAnoRefer := to_char(to_date(pDataRefer,'DD/MM/YYYY'),'MM/YYYY');
    /*****************************************************************/

    DataReferDia1    := to_date('01/'||MesAnoRefer,'DD/MM/YYYY');
    DataRefer        := last_day(DataReferDia1);

   insert into cm.mapamov_controle values (pDataRefer, 'Data referencia: ' || pDataRefer, sysdate, user);
   insert into cm.mapamov_controle values (pDataRefer, 'Parametro Perido: ' || pDataInicio || ' - ' || pDataFim, sysdate, user);
	
	/* Quando informado periodo para processameno */
	IF ((pDataInicio IS NOT NULL) AND (pDataFim IS NOT NULL))	THEN

		insert into cm.mapamov_controle values (pDataRefer, 'Perido: ' || pDataInicio || ' - ' || pDataFim, sysdate, user);

		DataReferDia1    := to_date(pDataInicio,'DD/MM/YYYY');
		DataRefer        := to_date(pDataFim,'DD/MM/YYYY');
	END IF;
	/***********************************************/
	
    DataReferAnt     := ADD_MONTHS(DataRefer, -1);
    DataReferAntDia1 := ADD_MONTHS(DataReferDia1, -1);
    ContratosApoio   := 0;

    /********Selecione o mês/ano desejado para o processamento********/
    AnoMesRefer := to_char(to_date(pDataRefer,'DD/MM/YYYY'),'YYYY/MM'); --Taffarel - SIG66626
    /*****************************************************************/
	
	/* Remove dados da tabela temporária */
	--EXECUTE IMMEDIATE 'TRUNCATE TABLE CM.MAPAMOV_PARCELAS';
	
    /* Caso o mapa seja executado para apenas 1 contrato limpa as informações referentes
       a este contrato na tabela do mapa e atualiza a tabela temporária */
    IF pContrato IS NOT NULL THEN --Contrato único
      DELETE FROM MAPAMOVEMPTMO M
      WHERE M.DATAREF = DATAREFER
      AND IDCONTRATOEMPTMO = pContrato;
      
      DELETE FROM CM.CONTRATOS_MAPAMOVEMPTMO WHERE IDCONTRATOEMPTMO = pContrato; 
      
      COMMIT;

  
      BEGIN
        SELECT C.IDCONTRATOEMPTMO
        INTO ContratosApoio
        FROM CM.CONTRATOS_MAPAMOVEMPTMO C
        WHERE C.IDCONTRATOEMPTMO = pContrato
        AND C.FLGPROCESSADO = 1;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          ContratosApoio := 1;
      END;
      
      
      SELECT COUNT(*) into VerificaQuitacaoMesAnterior FROM HMEALL H  --xxxx
      join contratoemptmo c on c.IDCONTRATOEMPTMO=h.IDCONTRATOEMPTMO 
      WHERE H.IDCONTRATOEMPTMO=pcontrato and c.flgsituacao='Q' and h.dataprevista<=DataReferAnt AND iditememptmo=17;
      
      IF VerificaQuitacaoMesAnterior=0  THEN 
      	IF ContratosApoio = pContrato THEN
       	 UPDATE CM.CONTRATOS_MAPAMOVEMPTMO
       	 SET FLGPROCESSADO = NULL
       	 WHERE IDCONTRATOEMPTMO = pContrato;
      	ELSE
       	 INSERT INTO CM.CONTRATOS_MAPAMOVEMPTMO C
       	 VALUES (pContrato, NULL, NULL, NULL, NULL, NULL);
      	END IF;
      	COMMIT;      
      END IF; 
	
	ELSIF pReprocessar = 1 THEN --Processar contratos não processador
	   insert into cm.mapamov_controle values (pDataRefer, 'Executar contratos não processados', sysdate, user);

      DELETE /*+ Parallel(80) */
      FROM MAPAMOVEMPTMO M
      WHERE M.DATAREF = DATAREFER and 
	  exists (select 1
      		  from cm.contratos_mapamovemptmo cm
      		  where cm.flgProcessado is null and
      		  		cm.idcontratoemptmo = m.idcontratoemptmo);
	  COMMIT;
	 
    ELSE -- Caso pContrato não seja preenchido executa o mapa completo
      /* Remove as informações processadas para o mês de referência */
	  insert into cm.mapamov_controle values (pDataRefer, 'Apaga mapa anterior', sysdate, user);

      DELETE /*+ Parallel(80) */
      FROM MAPAMOVEMPTMO M
      WHERE M.DATAREF = DATAREFER;

      /* Limpa a tabela temporária */
      EXECUTE IMMEDIATE 'TRUNCATE TABLE CM.CONTRATOS_MAPAMOVEMPTMO';
    
    COMMIT;

      /* Inclui a relação de contratos a serem processados na tabela temporária */
      /* 1a parte (contratos com lançamentos no mês) */
	  insert into cm.mapamov_controle values (pDataRefer, 'Insere contratos 1', sysdate, user);
	  commit;
	  
      INSERT INTO cm.contratos_mapamovemptmo (idcontratoemptmo) SELECT DISTINCT H.IDCONTRATOEMPTMO   --Parte 1
                                                                FROM HMEALL H
                                                                WHERE h.DATAPREVISTA BETWEEN DataReferDia1 
                                                                                     AND     DataRefer
                                                                AND   H.FLGQUITABONOESTORNO < 3
                                                                AND   to_char(H.dataprevista,'MM') = to_char(DataRefer,'MM')
                                                                AND   to_char(H.dataprevista,'YYYY') = to_char(DataRefer,'YYYY');



                                                     
      /* 2a parte (contratos com abonos e quitações no mês)*/
	  insert into cm.mapamov_controle values (pDataRefer, 'Insere contratos 2', sysdate, user);
	  commit;
	  
      INSERT INTO cm.contratos_mapamovemptmo (idcontratoemptmo) SELECT DISTINCT IDCONTRATOEMPTMO --Parte 2
                                                                FROM HMEALL h
                                                                WHERE h.DATAQUITABONOESTORNO BETWEEN DataReferDia1
                                                                                              AND     DataRefer
                                                                AND   h.FLGQUITABONOESTORNO IN (1,2)
                                                                AND   h.TIPOMOV in (1,2,4,7);
                                                                
                                                           

      /* Parte 3 */
      --contratos com itens em aberto de períodos anteriores no mês (Exceto prestação)
	  insert into cm.mapamov_controle values (pDataRefer, 'Insere contratos 3', sysdate, user);
	  commit;
	  	  
      INSERT INTO cm.contratos_mapamovemptmo (idcontratoemptmo) -- Parte 3
      	SELECT DISTINCT h.idcontratoemptmo --3a Parte
        FROM HMEALL h
        WHERE h.dataprevista < DataReferDia1
        	  AND   h.TIPOMOV IN (2,3,4,6,7)
			  AND   h.naturezaitem > 0
              AND   (h.flgquitabonoestorno = 0 OR h.dataquitabonoestorno > DataReferAnt)
              AND   (h.dataefetiva IS NULL OR h.dataefetiva > DataReferAnt)
              AND   (h.vlrprevisto > 0 OR h.vlrprevisto < 0 AND h.tipomov = 4);
              
          

      /* Parte 4 */
      --contratos com itens em aberto de períodos anteriores no mês (Somente prestação)
	  insert into cm.mapamov_controle values (pDataRefer, 'Insere contratos 4', sysdate, user);
	  commit;
	  	  
      INSERT INTO cm.contratos_mapamovemptmo (idcontratoemptmo) --Parte 4
      	WITH tiposusp AS (SELECT ts.idtiposuspemptmo
        				  FROM tiposuspemptmo ts
                          WHERE nvl(ts.flgemaberto,0) = 1)
        SELECT DISTINCT h.idcontratoemptmo
		FROM hmeprestacao h
        WHERE h.dataprevista <= DataReferAnt
        	  AND   h.iditememptmo IN (13,99)
              AND   h.vlrprevisto > 0
              AND   (h.dataquitabonoestorno > DataReferAnt OR h.dataefetiva > DataReferAnt)
              AND   (h.idtiposuspemptmo IS NULL OR h.idtiposuspemptmo = (SELECT ts.idtiposuspemptmo
              														 	 FROM tiposusp ts
                                                                         WHERE ts.idtiposuspemptmo = h.idtiposuspemptmo))
																		 UNION
																		 SELECT DISTINCT h.idcontratoemptmo
																		 FROM hmeprestacao h
																		 WHERE h.flgquitabonoestorno = 0
																			   AND   h.dataefetiva IS NULL
																			   AND   h.dataprevista <= DataReferAnt
																			   AND   h.iditememptmo IN (13,99)
																			   AND   h.vlrprevisto > 0
																			   AND   (h.idtiposuspemptmo IS NULL OR h.idtiposuspemptmo = (SELECT ts.idtiposuspemptmo
                                                                                                                           				  FROM tiposusp ts
																																		  WHERE ts.idtiposuspemptmo = h.idtiposuspemptmo));
																																		  
  
     																																		  
      /* Parte 5 (contratos com algum valor de provisão para perdas)*/
	  insert into cm.mapamov_controle values (pDataRefer, 'Insere contratos 5', sysdate, user);
	  commit;
	  	  
      INSERT INTO cm.contratos_mapamovemptmo (idcontratoemptmo) --Parte 5
	      WITH contremptmo AS (SELECT idcontratoemptmo
	      					   FROM CONTRATOEMPTMO
	                           WHERE flgsituacao <> 'C'),
			    itensAtu AS (  SELECT  idcontratoemptmo , VLR  FROM ( SELECT idcontratoemptmo, 
	           					   SUM(DECODE(iditememptmo, 56, vlrprevisto, -vlrprevisto)) AS VLR
	                               FROM HMEATUDIARIA
	                               WHERE dataprevista BETWEEN TO_DATE('31/12/2004','DD/MM/YYYY') AND DataRefer
										 AND   iditememptmo IN (56,129)
	                                     AND   flgestornado = 0
	                            GROUP BY idcontratoemptmo)
	                                      WHERE NVL (VLR,null) <> 0),
	           itensQuit AS (SELECT idcontratoemptmo, 
	           						SUM(vlrprevisto) VLR
	                         FROM HMEQUITACAO
	                         WHERE dataprevista BETWEEN TO_DATE('31/12/2004','DD/MM/YYYY') AND DataRefer
								   AND   iditememptmo = 71
	                               AND   flgestornado = 0
	                         GROUP BY idcontratoemptmo)
	      SELECT DISTINCT c.idcontratoemptmo
	      FROM contremptmo c
	      LEFT JOIN itensAtu ia ON c.idcontratoemptmo = ia.idcontratoemptmo
	      LEFT JOIN itensQuit iq ON c.idcontratoemptmo = iq.idcontratoemptmo
	      WHERE  NVL(ia.vlr,0) - NVL(iq.vlr,0) <>  0;
		     	      
	  /* Remoção dos contratos inseridos em duplicidade */
	  insert into cm.mapamov_controle values (pDataRefer, 'Remove Duplicidade', sysdate, user);

      DELETE FROM cm.contratos_mapamovemptmo t1
      WHERE EXISTS (SELECT 1
                    FROM cm.contratos_mapamovemptmo t2
                    WHERE t2.idcontratoemptmo = t1.idcontratoemptmo
                    AND   t2.rowid > t1.rowid);
      COMMIT;
    /* Fim da inclusão dos contratos */
    END IF;

	insert into cm.mapamov_controle values (pDataRefer, 'Início Cursor Principal', sysdate, user);
	commit;
	  
    /* Execução do cursor principal */
    FOR cPrincipal IN (SELECT DISTINCT IDCONTRATOEMPTMO
                       FROM CM.CONTRATOS_MAPAMOVEMPTMO
                       WHERE (pContrato IS NULL OR idcontratoemptmo = pContrato)
                       /* Inicio SIG 123193 Ferrari (ContratoAD) */
			           AND ( (pINARQUIVOAD  IS NULL) OR (pINARQUIVOAD IS NOT NULL AND IDCONTRATOEMPTMO IN 
			           (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD)) )
			           AND ( (pNOTINARQUIVOAD         IS NULL) OR (pNOTINARQUIVOAD IS 
			        NOT NULL AND IDCONTRATOEMPTMO NOT IN (SELECT IDCONTRATOEMPTMO 
			        FROM CM.CONTRATOAD)) )
			        /* Fim SIG 123193 Ferrari (ContratoAD) */
			           AND   flgprocessado IS NULL
                       ORDER BY 1)
    LOOP
      icommit := icommit + 1;

      --Seleciona plano contábil
      -- Início SIG 63636
      -- Início SIG 60409
      IF TO_DATE(pDataRefer,'DD/MM/YYYY') <= TO_DATE('31/12/2017','DD/MM/YYYY') THEN
        BEGIN
          SELECT  planprevcontabil.nome
          INTO PlanoContabil
          FROM vwmigracontratoep, planprevcontabil
          WHERE vwmigracontratoep.idcontratoemptmo = cPrincipal.idcontratoemptmo
          AND   vwmigracontratoep.DATAMIGRA = (SELECT MAX(vw.DATAMIGRA)
                                               FROM VWMIGRACONTRATOEP vw
                                               WHERE vw.IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo
                                               AND   vw.DATAMIGRA <= DataRefer)
          AND vwmigracontratoep.IDPLANOCONTATU = planprevcontabil.idplanoprev;
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            NULL;
        END;
      ELSE
        BEGIN
          SELECT PPC.NOME
          INTO PlanoContabil
          FROM CONTRATOEMPTMO CON
               JOIN PERFILINVXELEG PIE ON CON.IDPESSOA = PIE.IDPESSOA
                                       AND DECODE(CON.IDPLANOPREV,19,66,79,66,CON.IDPLANOPREV) = PIE.IDPLANOPREV
               JOIN PERFILINVEST PI ON NVL(CON.IDPERFILINVEST,PIE.IDPERFILINVEST) = PI.IDPERFILINVEST
               JOIN PLANPREVCONTABIL PPC ON PI.IDPLANPREVCONTAB = PPC.IDPLANOPREV
          WHERE CON.IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo
          AND   PIE.DTINICIO <= DataRefer
          AND   (PIE.DTFIM IS NULL OR PIE.DTFIM > DataRefer);
        EXCEPTION
          WHEN TOO_MANY_ROWS THEN
            PlanoContabil := PlanoContabil;
          WHEN NO_DATA_FOUND THEN
            BEGIN
              SELECT  planprevcontabil.nome
              INTO PlanoContabil
              FROM vwmigracontratoep, planprevcontabil
              WHERE vwmigracontratoep.idcontratoemptmo = cPrincipal.idcontratoemptmo
              AND   vwmigracontratoep.DATAMIGRA = (SELECT MAX(vw.DATAMIGRA)
                                                   FROM VWMIGRACONTRATOEP vw
                                                   WHERE vw.IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo
                                                   AND   vw.DATAMIGRA <= DataRefer)
              AND vwmigracontratoep.IDPLANOCONTATU = planprevcontabil.idplanoprev;
            EXCEPTION
              WHEN NO_DATA_FOUND THEN
                NULL;
            END;
        END;
      END IF;
      -- Término SIG 60409
      -- Término SIG 63636
      --Seleciona informações principais
      BEGIN
        SELECT d.matricula, --1
               c.datacredito, --2
               p.nome, --3
               CASE --4 Situação do mutuário
                 WHEN c.idpessoa = c.idbenef THEN (SELECT DISTINCT max(sp.descricao)
                                                   FROM partprevplan ppp
                                                        JOIN sitpart sp ON sp.idsitpart = ppp.idsitpart
                                                   WHERE ppp.idpessoa = c.idbenef
                                                   --AND c.idplanoprev = ppp.idplanoprev
                                                   AND   (ppp.idsitplanoprev = 25 
                                                          OR
                                                         (ppp.idplanoprev =(SELECT MAX(ppp2.idplanoprev)
                                                                            FROM partprevplan ppp2
                                                                            WHERE ppp2.flgdesativado = 0
                                                                            AND   ppp2.idpessoa = ppp.idpessoa)
                                                          AND NOT EXISTS (SELECT 1 FROM partprevplan ppp2
                                                                          WHERE ppp2.idpessoa = ppp.idpessoa
                                                                          AND   ppp2.idsitplanoprev = 25))
                                                          OR
                                                         (ppp.flgdesativado = 1
                                                          AND NOT EXISTS (SELECT 1 FROM partprevplan ppp1
                                                                          WHERE ppp1.idpessoa = ppp.idpessoa
                                                                          AND ppp1.flgdesativado = 0)
                                                          AND ppp.idplanoprev = (SELECT MAX(ppp1.idplanoprev)
                                                                                 FROM partprevplan ppp1
                                                                                 WHERE ppp1.idpessoa = ppp.idpessoa
                                                                                 AND   nvl(ppp1.datacancelamento,TRIM(SYSDATE)) = (SELECT nvl(MAX(ppp2.datacancelamento),TRIM(SYSDATE))
                                                                                                                                   FROM partprevplan ppp2
                                                                                                                                   WHERE ppp2.idpessoa = ppp1.idpessoa)
                                                                                 AND   NOT EXISTS (SELECT 1 FROM partprevplan ppp2
                                                                                                   WHERE ppp2.idpessoa = ppp1.idpessoa
                                                                                                   AND   ppp2.idsitplanoprev = 25)))))
                 WHEN pf.datamorte IS NOT NULL THEN 'PENSIONISTA (FALECIDO)'
                 ELSE 'PENSIONISTA'
               END,
               --5 Situação do contrato
               decode(c.flgsituacao,'A', 'CONTRATO ATIVO',
                                    'C', 'CONTRATO CANCELADO',
                                    'E', 'CONTRATO ENCERRADO',
                                    'Q', 'CONTRATO QUITADO',
                                    'R', 'CONTRATO REFINANCIADO',
                                    'S', 'CONTRATO SUSPENSO',
                                    'P', 'CONTRATO PENDENTE DE LIBERACAO',
                                    'K', 'CONTRATO PENDENTE DE QUITACAO'),
               c.txjuros, --6
               c.numparcelas, --7
               tc.tcedescricao, --8
               DECODE(c.idpatro,1,'FUNCEF','CAIXA') , --77 Patro
               p.Numdocumento,  --100 CPF
              CASE
               WHEN c.flginternet = 1 AND c.codautoemp IS NULL THEN 'INTERNET'
               ELSE 'FUNCEF'
                 END, --101
                  DECODE(pf.sexo,'F','Feminino','Masculino'), --102
                 trunc (to_char(DataRefer - pf.datanasc)/365.25),  --103
                MAX( NVL(ci.uf,ci.codestado)), -- 104
                   pf.datanasc --105
                
               INTO Matricula, --1
             DataCredito, --2
             NomeBenef, --3
             SitParticip, --4
             SitContrato, --5
             TxJuros, --6
             NumParcelas, --7
             TipoContrato, --8
             Patro, --77
             CPF, --100
             OrigemConcessao, --101
             SexoPartic, --102
            IdadePartic, --103 
            UF, --104
            DataNasc --105
        FROM contratoemptmo c
             INNER JOIN tipocontremptmo tc ON tc.idtipocontremptmo = c.idtipocontremptmo
             INNER JOIN pessoa p ON p.idpessoa = c.idbenef
             INNER JOIN pessoafisica pf ON pf.idpessoa = c.idbenef
             LEFT  JOIN depentit d ON d.idpessoa = c.idbenef
                                   AND d.idtitular = c.idpessoa
           LEFT JOIN endpess ep ON ep.idpessoa=p.idpessoa
           LEFT JOIN cidades ci     ON ci.idcidades = ep.idcidades       
          WHERE 
           c.idcontratoemptmo = cPrincipal.idcontratoemptmo
                 GROUP BY 
                      d.matricula, 
               c.datacredito,
               p.nome,
                c.idpessoa ,
                 c.idbenef,
                pf.datamorte ,
                 c.flgsituacao,
                 c.txjuros, 
               c.numparcelas,
               tc.tcedescricao, 
               c.idpatro,
               c.flginternet,
                c.codautoemp,
               p.Numdocumento,
               pf.sexo,
               pf.datanasc;
           EXCEPTION
        WHEN NO_DATA_FOUND THEN
          NULL;
      END;

      --9 Saldo Atual
      SaldoAtual := NVL(CM.PCK_EMPRESTIMO.FN_SALDODEVEDOR(cPrincipal.idcontratoemptmo , DataRefer), 0);
      
      --10 Saldo Anterior
      SaldoAnterior := NVL(CM.PCK_EMPRESTIMO.FN_SALDODEVEDOR(cPrincipal.idcontratoemptmo , DataReferAnt),0);
      
      --11 Quitações com seguro retido
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO QuitSegRet
      FROM hmequitacao h
      WHERE h.iditememptmo = 115 
      AND   h.dataprevista BETWEEN DataReferDia1
                           AND     DataRefer
      AND   h.idcontratoemptmo = cPrincipal.idcontratoemptmo
      AND   h.flgestornado = 0;
      
      --12 Atualização diária - correção monetária
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO AtuDiaCM
      FROM hmeatudiaria h
      WHERE h.idcontratoemptmo = cPrincipal.idcontratoemptmo
      AND   h.dataprevista BETWEEN DataReferDia1
                           AND     DataRefer
      AND   h.iditememptmo = 4
      AND   h.flgestornado = 0;
      
      --13 Atualização diária - juros
      SELECT SUM(h.vlrprevisto)
      INTO AtuDiaJuros
      FROM hmeatudiaria h
      WHERE h.idcontratoemptmo = cPrincipal.idcontratoemptmo
      AND   h.dataprevista BETWEEN DataReferDia1
                           AND     DataRefer
      AND   h.iditememptmo = 23
      AND   h.flgestornado = 0;
      
      --14 Prestações Remanescentes - mês atual
/*
	  SELECT MIN(NUMPARCELAS)
	  INTO QuantPrest
	  from cm.mapamov_parcelas
	  where idcontratoemptmo = cPrincipal.idcontratoemptmo ;
*/      
--	Trecho removido devido a queda de performance com o Tibero
      SELECT NVL(MIN(H.NUMPARCELAS),0)
      INTO QuantPrest
      FROM hmeall h
      WHERE h.flgquitabonoestorno < 3
      AND   h.tipomov IN (0, 1)
      AND   h.dataprevista >= CASE
                                WHEN h.iditememptmo = 6 THEN DataReferAntDia1
                                ELSE DataReferDia1
                              END
      AND   h.dataprevista <= DataRefer
      AND   h.iditememptmo IN (13,6)
      AND   h.seqcobranca = 1
      AND   h.idcontratoemptmo = cPrincipal.idcontratoemptmo
      AND   NOT EXISTS (SELECT 1 FROM hmequitacao h1
                        WHERE h1.idcontratoemptmo = h.idcontratoemptmo 
                        AND   h1.idcontratoemptmo = cPrincipal.idcontratoemptmo 
                        AND   h1.iditememptmo = 17 
                        AND   h1.flgestornado = 0 
                        AND   h1.dataprevista BETWEEN DataReferDia1 AND DataRefer);
    
  
      --15 Prestações Remanescentes - mês anterior
      SELECT NVL(MIN(H.NUMPARCELAS),0)
      INTO QuantPrestAnterior
      FROM hmeprestacao h
      WHERE h.flgquitabonoestorno < 3
      AND   h.dataprevista = TO_DATE(('20/' || TO_CHAR(DataReferAnt,'MM/YYYY')), 'DD/MM/YYYY')
      AND   h.IDITEMEMPTMO = 13
      AND   h.SEQCOBRANCA = 1
      AND   h.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --16 Valor prestação atual
      SELECT ((SELECT NVL(SUM(H.VLRPREVISTO),0)
               FROM hmeprestacao h
                    JOIN contratoemptmo c on c.idcontratoemptmo = h.idcontratoemptmo 
                    JOIN tipocontremptmo t on t.idtipocontremptmo = c.idtipocontremptmo
               WHERE h.flgquitabonoestorno < 3
               AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
               AND   h.naturezaitem < 2
               AND   h.SEQCOBRANCA = 1
               AND   t.idtipocontremptmo NOT IN (21)
               AND   h.iditememptmo NOT IN (99,104,61) --Não considerar o item de devolução de FGQC
               AND   (h.IdTipoSuspEmptmo IS NULL OR 1 = (SELECT ts.flgemaberto FROM tiposuspemptmo ts
                                                         WHERE ts.idtiposuspemptmo = h.idtiposuspemptmo))
               AND   h.idcontratoemptmo = cPrincipal.idcontratoemptmo) 
              +
               (SELECT nvl(SUM(H.VLRPREVISTO),0)
                FROM hmeprestacao h
                     JOIN contratoemptmo c ON c.idcontratoemptmo = h.idcontratoemptmo 
                     JOIN tipocontremptmo t ON t.idtipocontremptmo = c.idtipocontremptmo
                WHERE h.flgquitabonoestorno < 3
                AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
                AND   h.naturezaitem < 2
                AND   h.SEQCOBRANCA = 1
                AND   t.idtipocontremptmo=21
                AND   h.iditememptmo NOT IN (99,104) --Não considerar o item de devolução de FGQC
                AND   (h.IdTipoSuspEmptmo IS NULL OR 1 = (SELECT ts.flgemaberto FROM tiposuspemptmo ts
                                                          WHERE ts.idtiposuspemptmo = h.idtiposuspemptmo))
                AND   h.idcontratoemptmo = cPrincipal.idcontratoemptmo))
      INTO ValorPrest
      FROM dual;
      
      --17 Quitação valor bruto
      SELECT nvl(SUM(H.VLRPREVISTO),0)
      INTO QuitBruto
      FROM hmequitacao H
      WHERE H.flgestornado = 0
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO = 35
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --18 Quitação valor líquido
      SELECT nvl(SUM(H.VLRPREVISTO),0)
      INTO QuitLiquido
      FROM hmequitacao H
      WHERE H.flgestornado = 0
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO = 17
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --19 Quitação com fundo garantidor
      SELECT nvl(SUM(H.VLRPREVISTO),0)
      INTO QuitFGQC
      FROM hmequitacao H
      WHERE H.flgestornado = 0
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO = 112
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --20 Quitação de fundo garantidor
      SELECT nvl(SUM(H.VLRPREVISTO),0)
      INTO QuitDeFundGarant
      FROM hmequitacao H
      WHERE H.flgestornado = 0
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO = 113
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --21 Saldo vencido - devoluções
      SELECT NVL(SUM(vlrprevisto),0)
      INTO SaldoVencDevolucoes
      FROM hmeall h
      WHERE H.flgquitabonoestorno < 3
      AND H.TIPOMOV IN (1,7)
      AND h.dataefetiva BETWEEN DataReferDia1 AND DataRefer
      AND h.iditememptmo in (13,51)
      AND h.vlrprevisto < 0
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --22 Saldo vencido - recebimento
      SELECT NVL(SUM(h.vlrefetivo),0)
      INTO SaldoVencRecebimento
      FROM hmeall h
      WHERE H.flgquitabonoestorno < 3
      AND H.TIPOMOV IN (1,2,4,7)
      AND h.vlrprevisto > 0 --buscar somente valores positivos
      AND h.dataefetiva BETWEEN DataReferDia1 AND DataRefer
      AND h.iditememptmo IN (13, 30, 31, 42, 43, 44, 46, 50, 99)
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --23 Amortização
      SELECT NVL(SUM(vlrprevisto),0)
      INTO Amortizacao
      FROM hmeamortizacao h
      WHERE H.flgquitabonoestorno < 3
      AND h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND iditememptmo = 7
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --24 IOF
      SELECT NVL(SUM(H.VLRPREVISTO),0)
      INTO IOF
      FROM hmeall H
      WHERE H.flgquitabonoestorno < 3
      AND H.TIPOMOV IN (2,7)
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO in (30,82)
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --25 Seguro
      SELECT NVL(SUM(CASE
                        WHEN H.IDITEMEMPTMO IN (25,29) THEN H.VLRPREVISTO*(-1)
                        ELSE H.VLRPREVISTO
                     END),0)
      INTO Seguro
      FROM hmeall H
      WHERE H.flgquitabonoestorno < 3
      AND H.TIPOMOV IN (2,3,7,8)
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO in (31,50,72,77,25,29,51)
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --26 Tipo de suspensão
      BEGIN
        SELECT ts.tsedescricao
        INTO TipoSusp
        FROM hmeprestacao h1
             JOIN tiposuspemptmo ts ON ts.idtiposuspemptmo = h1.idtiposuspemptmo
        WHERE h1.idhistmovemptmo = (SELECT MAX(h.idhistmovemptmo)
                                    FROM hmeprestacao h
                                    WHERE h.idcontratoemptmo = cPrincipal.idcontratoemptmo
                                    AND   h.iditememptmo = 13
                                    AND   h.idtiposuspemptmo is not null
                                    AND   H.flgquitabonoestorno < 3
                                    AND   h.dataprevista <= DataRefer);
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          TipoSusp := NULL;
      END;
      
      --27 Quantidade de prestações suspensas
      SELECT COUNT(H.IDHISTMOVEMPTMO)
      INTO QuantSusp
      FROM hmeprestacao H
      WHERE H.flgquitabonoestorno < 3
      AND   h.IDITEMEMPTMO = 13
      AND   H.DATAPREVISTA <= DataRefer
      AND   H.IDTIPOSUSPEMPTMO IS NOT NULL
      AND   H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --28 Liminar
      BEGIN
        SELECT DISTINCT 'SIM'
        INTO Liminar
        FROM HISTSUSPCOBEP H, TIPOSUSPEMPTMO T
        WHERE H.HSCINICIOSUSP <= DataRefer
        AND   (H.HSCFINALSUSP  >= DataRefer OR H.HSCFINALSUSP IS NULL)
        AND   H.FLGSTATUS <> 'C'
        AND   H.IDTIPOSUSPEMPTMO = T.IDTIPOSUSPEMPTMO
        AND   T.FLGCOBRJUDICIAL = 1
        AND   H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          Liminar := 'NÃO';
      END;
      
      --29 Liminar 1
      BEGIN
        SELECT DISTINCT 'SIM'
        INTO Liminar1
        FROM CONTRATOEMPTMO C, TIPOSUSPEMPTMO T
        WHERE C.DATAINICIOSUSP <= DataRefer
        AND   (C.DATAFIMSUSP  >= DataRefer OR C.DATAFIMSUSP IS NULL)
        AND   C.IDTIPOSUSPEMPTMO = T.IDTIPOSUSPEMPTMO
        AND   T.FLGCOBRJUDICIAL = 1
        AND   C.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          Liminar1 := 'NÃO';
      END;
      
      --30 Ajuste Saldo Devedor
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO AjusteSaldoDev
      FROM hmeall h
      WHERE H.flgquitabonoestorno < 3
      AND   h.TIPOMOV IN (6,7,8)
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo in (80,52,58,59,75,76,83,84,91,96,97,102,103,50,68,72)
      AND   H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --31 Ajuste de saldo outros
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO AjusteSaldoOutros
      FROM hmeall h
      WHERE H.flgquitabonoestorno < 3
      AND   h.TIPOMOV IN (7,8)
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo in (54,98)
      AND   H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --32 Ajuste seguro
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO AjusteSeguro
      FROM hmeall h
      WHERE H.flgquitabonoestorno < 3
      AND   h.TIPOMOV IN (7,8)
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo in (50,51,77,50,68,72)
      AND   H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --33 Ajuste Cobranca alterada para QuitacaoDevolucaoFGQC - Alteração solicitada pelo SIG 121779
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO QuitacaoDevolucaoFGQC
      FROM Hmequitacao h
      WHERE  H.flgestornado=0
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo in (124)
      AND   H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
     
      --34 Ajuste de saldo vencido
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO AjusteSaldoVenc
      FROM hmeall h
      WHERE H.flgquitabonoestorno < 3
      AND   h.TIPOMOV IN (7,8)
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo IN (50,51,52)
      AND   H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --35 Fundo garantidor
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO FundoGarantidor
      FROM hmeall h
      WHERE H.flgquitabonoestorno < 3
      AND   h.TIPOMOV IN (1,7)
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo IN (99,104)
      AND   h.seqcobranca <> 2
      AND   H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --36 Devolução de Fundo Garantidor (sequencial 2)
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO DevolFundoGarant
      FROM hmeall h
      WHERE H.flgquitabonoestorno < 3
      AND   h.TIPOMOV IN (1,7)
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo in (99,104)
      AND   h.seqcobranca = 2
      AND   H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --37 Ajuste de prestação
      SELECT NVL(SUM(vlrprevisto),0)
      INTO AjustePrestacao
      FROM (SELECT vlrprevisto
            FROM hmeencargos h
            WHERE --nvl(flgestornado,0) = 0
                  H.flgquitabonoestorno = 2
            AND   dataquitabonoestorno BETWEEN DataReferDia1 AND DataRefer
            AND   h.idcontratoemptmo = cPrincipal.idcontratoemptmo
            UNION ALL
            SELECT vlrprevisto
            FROM hmeprestacao h
            WHERE H.flgquitabonoestorno = 3
            AND   dataquitabonoestorno BETWEEN DataReferDia1 AND DataRefer
            AND   NATUREZAITEM = 2
            AND   h.idcontratoemptmo = cPrincipal.idcontratoemptmo
            AND EXISTS (SELECT hcontab.plncodigoestorno
                        FROM hmecontabilizacao hcontab
                        WHERE hcontab.idhistmovemptmo = h.idhistmovemptmo)
            UNION ALL
            SELECT vlrprevisto
            FROM hmeencargos h
            WHERE H.flgquitabonoestorno = 3
            AND   dataquitabonoestorno BETWEEN DataReferDia1 AND DataRefer
            AND   NATUREZAITEM < 2
            AND   h.idcontratoemptmo = cPrincipal.idcontratoemptmo
            AND   EXISTS (SELECT hcontab.plncodigoestorno
                          FROM hmecontabilizacao hcontab
                          WHERE hcontab.idhistmovemptmo = h.idhistmovemptmo));
      
      /*INÍCIO - encargos mês*/
      --38 Correção monetária
      SELECT NVL(SUM(HME.VLRPREVISTO),0)
      INTO EncargCorrMonet
      FROM hmeencargos  HME
      WHERE HME.IDITEMEMPTMO = 42
      AND HME.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND Hme.flgquitabonoestorno < 3
      AND hme.seqcobranca = 1
      AND hme.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --39 Juros remuneratórios
      SELECT NVL(SUM(HME.VLRPREVISTO),0)
      INTO EncargJurosRem
      FROM hmeencargos  HME
      WHERE HME.IDITEMEMPTMO = 43
      AND HME.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND Hme.flgquitabonoestorno < 3
      AND hme.seqcobranca = 1
      AND hme.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --40 Multa
      SELECT NVL(SUM(HME.VLRPREVISTO),0)
      INTO EncargMulta
      FROM hmeencargos  HME
      WHERE HME.IDITEMEMPTMO = 44
      AND HME.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND Hme.flgquitabonoestorno < 3
      AND hme.seqcobranca = 1
      AND hme.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --41 Juros moratórios
      SELECT NVL(SUM(HME.VLRPREVISTO),0)
      INTO EncargJurosMora
      FROM hmeencargos  HME
      WHERE HME.IDITEMEMPTMO = 46
      AND HME.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND Hme.flgquitabonoestorno < 3
      AND hme.seqcobranca = 1
      AND hme.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      /*FIM - encargos mês*/
      
      --42 Devolução de encargos
      SELECT NVL(SUM(hme.vlrprevisto),0)
      INTO DevolucaoEncargos
      FROM hmeencargos HME
      WHERE HME.DATAEFETIVA BETWEEN DataReferDia1 AND DataRefer
      AND Hme.flgquitabonoestorno < 3
      AND HME.VLRPREVISTO < 0
      AND HME.VLREFETIVO IS NOT NULL
      AND hme.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --43 Valor solicitado
      SELECT NVL(SUM(VLRPREVISTO),0)
      INTO ValorSolicitado
      FROM hmeconcessao
      WHERE IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo
      AND IDITEMEMPTMO = 22
      AND flgestornado = 0
      AND dataprevista BETWEEN DataReferDia1 AND DataRefer;
      /*INÍCIO - quitação de parcelas e encargos*/
      
      --44 Quitação de Parcelas
      SELECT SUM(H.VLRPREVISTO)
      INTO QuitacaoParcelas
      FROM hmequitacao H
      WHERE H.flgestornado = 0
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO = 36
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --45 Quitação de correção monetária
      SELECT NVL(SUM(H.VLRPREVISTO),0)
      INTO QuitacaoCM
      FROM hmequitacao H
      WHERE H.flgestornado = 0
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO = 39
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --46 Quitação de juros remuneratórios
      SELECT NVL(SUM(H.VLRPREVISTO),0)
      INTO QuitacaoJurosRem
      FROM hmequitacao H
      WHERE H.flgestornado = 0
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO = 38
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --47 Quitação de juros moratórios
      SELECT NVL(SUM(H.VLRPREVISTO),0)
      INTO QuitacaoJurosMora
      FROM hmequitacao H
      WHERE H.flgestornado = 0
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO = 40
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --48 Quitação de multa
      SELECT NVL(SUM(H.VLRPREVISTO),0)
      INTO QuitacaoMulta
      FROM hmequitacao H
      WHERE H.flgestornado = 0
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO = 37
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --49 Quitação de correção monetária (diferença)
      SELECT NVL(SUM(H.VLRPREVISTO),0)
      INTO QuitacaoCMDif
      FROM hmequitacao H
      WHERE H.flgestornado = 0
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO = 87
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --50 Quitação de juros remuneratórios (diferença)
      SELECT NVL(SUM(H.VLRPREVISTO),0)
      INTO QuitacaoJurRemDif
      FROM hmequitacao H
      WHERE H.flgestornado = 0
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO = 88
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --51 Quitação de juros moratórios (diferença)
      SELECT NVL(SUM(H.VLRPREVISTO),0)
      INTO QuitacaoJurMorDif
      FROM hmequitacao H
      WHERE H.flgestornado = 0
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO = 89
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --52 Quitação de multa (diferença)
      SELECT NVL(SUM(H.VLRPREVISTO),0)
      INTO QuitacaoMultaDif
      FROM hmequitacao H
      WHERE H.flgestornado = 0
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO = 90
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      /*FIM - quitação de parcelas e encargos*/
      
      --\*INICIO - Itens de ajuste de saldo devedor*\
      --53 Complemento de seguro
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO ComplSeg
      FROM hmeajustecobranca h
      WHERE H.flgquitabonoestorno < 3
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo = 50
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --54 Incorporação de prestação
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO IncorpPrest
      FROM hmeajustesaldodev h
      WHERE H.flgestornado = 0
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo = 52
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --55 Incorporação de seguro
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO IncorpSeg
      FROM hmeajustesaldodev h
      WHERE H.flgestornado = 0
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo = 72
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --56 Estorno de juros
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO EstornJuros
      FROM hmeajustesaldodev h
      WHERE H.flgestornado = 0
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo = 75
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --57 Estorno de correção monetária
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO EstornCorr
      FROM hmeajustesaldodev h
      WHERE H.flgestornado = 0
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo = 76
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --58 Devolução de saldo devedor
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO DevolSaldDev
      FROM hmeajustecobranca h
      WHERE H.flgquitabonoestorno < 3
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo = 80
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --59 Ajuste de saldo residual
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO AjustSaldResid
      FROM hmeajustesaldodev h
      WHERE H.flgestornado = 0
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo = 84
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --60 Ajuste de correção monetária
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO AjusteCM
      FROM hmeajustesaldodev h
      WHERE H.flgestornado = 0
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo = 96
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --61 Ajuste de juros remuneratórios
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO AjusteJuros
      FROM hmeajustesaldodev h
      WHERE H.flgestornado = 0
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo = 97
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --62 Ajuste de juros moratórios
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO AjusteMora
      FROM hmeajustesaldodev h
      WHERE H.flgestornado = 0
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo = 102
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --63 Ajuste de multa
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO AjusteMulta
      FROM hmeajustesaldodev h
      WHERE H.flgestornado = 0
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo = 103
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      /*FIM - Itens de ajuste de saldo devedor*/
      
      /*INICIO - Itens de ajuste de cobrança*/
      --64 Despesa de correção monetária
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO DespCorrecao
      FROM hmeajustecobranca h
      WHERE H.flgquitabonoestorno = 0
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND h.iditememptmo = 94
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --65 Despesa de juros
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO DespJuros
      FROM hmeajustecobranca h
      WHERE H.flgquitabonoestorno = 0
      AND   h.dataprevista BETWEEN DataReferDia1 AND DataRefer
      AND h.iditememptmo = 95
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      /*FIM - Itens de ajuste de cobrança*/
      
      --66 Fundo Garantidor Abonado
      SELECT NVL(SUM(h.vlrprevisto),0)
      INTO FGQCAbonado
      FROM hmeprestacao h
      WHERE H.flgquitabonoestorno = 2
      AND   h.dataquitabonoestorno BETWEEN DataReferDia1 AND DataRefer
      AND   h.iditememptmo = 99
      AND   H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --67 Valor Concedido
      SELECT NVL(SUM(VLRPREVISTO),0)
      INTO ValorConcedido
      FROM hmeconcessao
      WHERE IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo
      AND IDITEMEMPTMO = 22
      AND flgestornado = 0;
      
      --68 IOF Complementar - Parcela em atraso (encargo)
      SELECT NVL(SUM(H.VLRPREVISTO),0)
      INTO EncargIOFCompl
      FROM hmeencargos H
      WHERE H.flgquitabonoestorno < 3
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO = 121
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --69 Quitação de IOF Complementar
      SELECT NVL(SUM(H.VLRPREVISTO),0)
      INTO QuitaçãoIOFCompl
      FROM hmequitacao H
      WHERE H.flgestornado = 0
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO = 122
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      
      --70 Quitação de IOF Complementar - diferença
      SELECT NVL(SUM(H.VLRPREVISTO),0)
      INTO QuitaçãoIOFComplDif
      FROM hmequitacao H
      WHERE H.flgestornado = 0
      AND H.DATAPREVISTA BETWEEN DataReferDia1 AND DataRefer
      AND H.IDITEMEMPTMO = 123
      AND H.idcontratoemptmo = cPrincipal.idcontratoemptmo;
      --71 Valor de IOF Apropriado
      SELECT ((SELECT nvl(SUM(h.vlrprevisto),0)
               FROM hmequitacao H
               WHERE h.idcontratoemptmo = cPrincipal.idcontratoemptmo
               AND   h.iditememptmo = 123
               AND   H.flgestornado = 0
               AND   h.dataprevista BETWEEN DataReferDia1
                                    AND     DataRefer)
              +
              (SELECT nvl(SUM(h.vlrprevisto),0)
               FROM hmeencargos H
               WHERE h.idcontratoemptmo = cPrincipal.idcontratoemptmo
               AND   h.iditememptmo = 121
               AND   H.flgquitabonoestorno < 2
               AND   (h.dataquitabonoestorno > DataReferAnt OR H.DATAQUITABONOestorno IS NULL)
               AND   (h.vlrefetivo IS NULL OR h.dataefetiva > DataReferAnt)
               AND   h.dataprevista <= DataRefer)
              +
              (SELECT nvl(SUM(h.vlrprevisto),0)
               FROM hmeencargos H
               WHERE h.idcontratoemptmo = cPrincipal.idcontratoemptmo
               AND   h.iditememptmo = 121
               AND   H.flgquitabonoestorno = 2
               AND   h.dataquitabonoestorno > DataReferAnt
               AND   h.dataprevista <= DataRefer))
      INTO VlrIOFApropriado
      FROM dual;
      
      --72 Valor de IOF Pago
      SELECT ((SELECT NVL(SUM(h.vlrprevisto),0)
               FROM hmequitacao H
               WHERE h.idcontratoemptmo = cPrincipal.idcontratoemptmo
               AND   h.iditememptmo = 122
               AND   H.flgestornado = 0
               AND   h.dataprevista BETWEEN DataReferDia1
                                    AND     DataRefer)
              +
              (SELECT nvl(SUM(h.vlrprevisto),0)
               FROM hmeencargos H
               WHERE h.idcontratoemptmo = cPrincipal.idcontratoemptmo
               AND   h.iditememptmo = 121
               AND   (h.dataefetiva IS NOT NULL OR h.dataefetiva > DataRefer)
               AND   H.flgquitabonoestorno < 3
               AND   h.dataefetiva BETWEEN DataReferDia1
                                   AND     DataRefer)) * -1
      INTO VlrIOFPago
      FROM dual;
      
      --73 Valor de IOF Abonado
      SELECT NVL(SUM(h.vlrprevisto),0) * -1
      INTO VlrIOFAbonado
      FROM hmeencargos H
      WHERE h.idcontratoemptmo = cPrincipal.idcontratoemptmo
      AND   h.iditememptmo = 121
      AND   (h.dataefetiva IS NULL OR h.dataefetiva > to_date('30/09/2012','DD/MM/YYYY'))
      AND   H.flgquitabonoestorno = 2
      AND   h.dataquitabonoestorno BETWEEN DataReferDia1
                                   AND     DataRefer;
      
      --74 Valor de IOF Recolhido
      SELECT ((SELECT NVL(SUM(h.vlrprevisto),0)
               FROM hmeencargos H
                    JOIN hmeimpostos hi ON hi.idhistmovemptmo = h.idhistmovemptmo
                    JOIN lancirrf l ON l.idlancirrf = hi.idlancirrf
               WHERE h.idcontratoemptmo = cPrincipal.idcontratoemptmo
               AND   h.iditememptmo = 121
               AND   H.flgquitabonoestorno < 3
               AND   l.datalancamento BETWEEN DataReferDia1
                                      AND     DataRefer) 
              +
              (SELECT NVL(SUM(h.vlrprevisto),0)
               FROM hmequitacao h
                    JOIN hmeimpostos hi ON hi.idhistmovemptmo = h.idhistmovemptmo
                    JOIN lancirrf l ON l.idlancirrf = hi.idlancirrf
               WHERE h.idcontratoemptmo = cPrincipal.idcontratoemptmo
               AND   h.iditememptmo = 122
               AND   H.flgestornado = 0
               AND   l.datalancamento BETWEEN DataReferDia1
                                      AND     DataRefer))
      INTO VlrIOFRecolhido
      FROM dual;
      
      --75 Perda efetiva
      BEGIN
        SELECT DISTINCT 'Sim'
        INTO PerdaEfetiva
        FROM hmeajustesaldodev h
        WHERE h.idcontratoemptmo = cPrincipal.idcontratoemptmo
        AND   h.iditememptmo IN (126,127)
        AND   h.flgestornado = 0
        AND   (NOT EXISTS (SELECT 1 FROM hmeajustesaldodev h1
                           WHERE h1.idcontratoemptmo = h.idcontratoemptmo
                           AND   h1.idcontratoemptmo = cPrincipal.idcontratoemptmo
                           AND   h1.iditememptmo  in ( 130,155)
                           AND   h.flgestornado = 0
                           AND   h1.dataprevista > h.dataprevista)
               OR
               EXISTS (SELECT 1 FROM hmeajustesaldodev h1
                       WHERE h1.idcontratoemptmo = h.idcontratoemptmo
                       AND   h1.idcontratoemptmo = cPrincipal.idcontratoemptmo
                       AND   h1.iditememptmo in ( 130,155)
                       AND   h.flgestornado = 0
                       AND   h1.dataprevista > last_day(to_date('01/' ||  MesAnoRefer, 'DD/MM/YYYY'))));
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          PerdaEfetiva := 'Não';
      END;
      
      --76 Data de entrada em perda efetiva
      SELECT MAX(h.dataprevista)
      INTO DataPerdaEfetiva
      FROM hmeajustesaldodev h
      WHERE h.idcontratoemptmo = cPrincipal.idcontratoemptmo
      AND   h.iditememptmo IN (126,127)
      AND   h.flgestornado = 0
      AND   (NOT EXISTS (SELECT 1 FROM hmeajustesaldodev h1
                         WHERE h1.idcontratoemptmo = h.idcontratoemptmo
                         AND   h1.idcontratoemptmo = cPrincipal.idcontratoemptmo   
                         AND   h1.iditememptmo in ( 130,155)
                         AND   h.flgestornado = 0
                         AND   h1.dataprevista > h.dataprevista)
             OR
             EXISTS (SELECT 1 FROM hmeajustesaldodev h1
                     WHERE h1.idcontratoemptmo = h.idcontratoemptmo
                     AND   h1.idcontratoemptmo = cPrincipal.idcontratoemptmo
                     AND   h1.iditememptmo in ( 130,155)
                     AND   h.flgestornado = 0
                     AND   h1.dataprevista > last_day(to_date('01/' ||  MesAnoRefer, 'DD/MM/YYYY'))));
                     
      --78 INPC Contratação
      BEGIN
        SELECT cm.cotvalor
        INTO InpcContrato
        FROM contratoemptmo cc
             JOIN moeda md ON cc.moecodigo  = md.moecodigo
             JOIN cotacaomoeda cm ON cm.moecodigo  = md.moecodigo
        WHERE cm.cotdata  = '01/'|| NVL(to_char(cc.dataassinatura,'mm/yyyy'),'01/1900')
        AND   cc.idcontratoemptmo = cPrincipal.idcontratoemptmo
        AND   rownum = 1;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          InpcContrato := NULL;
      END;
      
      --Repactuação
      BEGIN
        SELECT h.dataprevista,
               h.numparcelas,
               CON.txjuros
        INTO DataRepac,
             ParcRepac,
             TaxaRepac
        FROM HMEAMORTIZACAO h
             INNER JOIN CONTRATOEMPTMO CON ON h.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO
        WHERE idhistmovemptmo = (SELECT MAX(idhistmovemptmo)
                                 FROM HMEAMORTIZACAO h
                                 WHERE FLGQUITABONOESTORNO < 3
                                 AND   dataprevista <= DataRefer
                                 AND   vlrprevisto = 0
                                 AND   H.idcontratoemptmo = cPrincipal.idcontratoemptmo);
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          DataRepac := NULL;
          ParcRepac := NULL;
          TaxaRepac := NULL;
      END;
        
        
      /*Inadimplência*/
      --Busca valores de inadimplência total
      OPEN inadimplencia(cPrincipal.idcontratoemptmo);
      LOOP
        FETCH inadimplencia INTO inad;
        EXIT WHEN inadimplencia%NOTFOUND;
        
        IF inadimplencia%ROWCOUNT = 1 THEN
          DataPrevistaInad := inad.DATAPREVISTA;
          VlrPrevistoInad := 0;
          EncargosInad := 0;
          QuantInad := 0;
          VlrInadPrescrita := 0;
        END IF;

        VlrPrevistoInad := VlrPrevistoInad + inad.VALORPREVISTO;
        EncargosInad := EncargosInad + inad.ENCARGOS;
        QuantInad := QuantInad + inad.QUANTIDADE;

        --Armazena valor de inadimplência prescrita
        IF inad.DATAPREVISTA < add_months(SYSDATE,-60)-1 THEN
          VlrInadPrescrita := VlrInadPrescrita + inad.VALORPREVISTO + inad.ENCARGOS;
        END IF;
      END LOOP;

      IF inadimplencia%ROWCOUNT = 0 THEN
        DataPrevistaInad := NULL;
        VlrPrevistoInad := 0;
        EncargosInad := 0;
        QuantInad := 0;
        TotalInad := 0;
        VlrInadPrescrita := 0;
      ELSE
        TotalInad := EncargosInad + VlrPrevistoInad;
      END IF;

      CLOSE inadimplencia;

      --inadimplencia mes atual
      SELECT SUM(VLRPREVISTO)
      INTO ValorInadMesAtual
      FROM (
              SELECT HME.VLRPREVISTO
              FROM HMEALL HME
              WHERE hme.idcontratoemptmo = cPrincipal.idcontratoemptmo
              AND   HME.TIPOMOV IN (1,2,6,7)
              AND   hme.dataprevista BETWEEN DataReferDia1 AND DataRefer
              AND   NATUREZAITEM > 0
              AND   (HME.DATAEFETIVA IS NULL OR HME.DATAEFETIVA > DataRefer)
              AND   (HME.VLREFETIVO IS NULL OR HME.DATAEFETIVA > DataRefer)
              AND   (HME.FLGQUITABONOESTORNO = 0 OR (HME.FLGQUITABONOESTORNO IN (1,2)
                                                     AND HME.DATAQUITABONOESTORNO > DATAREFER))
              AND   (hme.idtiposuspemptmo IS NULL OR 1 = (SELECT ts.flgemaberto
                                                          FROM tiposuspemptmo ts
                                                               WHERE ts.idtiposuspemptmo = hme.idtiposuspemptmo))
              AND   (HME.IDITEMEMPTMO <> 50 OR (HME.IDITEMEMPTMO = 50 AND
                                                0 = (SELECT itc.itctratasaldodev
                                                     FROM itemxtipocontr itc
                                                          JOIN contratoemptmo c ON c.idtipocontremptmo = itc.idtipocontremptmo
                                                     WHERE itc.iditememptmo = hme.iditememptmo
                                                     AND   c.idcontratoemptmo = hme.idcontratoemptmo)))
              UNION ALL
              SELECT HME.VLRPREVISTO
              FROM HMEENCARGOS HME
              WHERE hme.idcontratoemptmo = cPrincipal.idcontratoemptmo
              AND HME.IDITEMEMPTMO <> 121
              AND hme.dataprevista BETWEEN DataReferDia1 AND DataRefer
              AND HME.NATUREZAITEM > 0
              AND (HME.DATAEFETIVA IS NULL OR HME.DATAEFETIVA > DataRefer)
              AND (HME.VLREFETIVO IS NULL OR HME.DATAEFETIVA > DataRefer)
              AND (HME.FLGQUITABONOESTORNO = 0 OR (HME.FLGQUITABONOESTORNO IN (1,2) AND HME.DATAQUITABONOESTORNO > DATAREFER)));

      --Quitações inadimplentes
      SELECT NVL(SUM(HME.VLRPREVISTO),0)
      INTO QuitacaoInad
      FROM hmequitacao  HME
      WHERE HME.IDITEMEMPTMO = 17
            AND HME.DATAPREVISTA <= DataRefer
            AND (HME.DATAEFETIVA IS NULL OR HME.DATAEFETIVA > DataRefer)
            AND (HME.VLREFETIVO IS NULL OR HME.DATAEFETIVA > DataRefer)
            AND HME.flgESTORNADO = 0
            AND HME.IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo ;

      --Inadimplência acumulada até mês anterior
      SELECT nvl(SUM(VLRPREVISTO) + SUM(encargos),0)
      INTO ValorInadAnt
      FROM (
                SELECT SUM(HME.VLRPREVISTO) AS VLRPREVISTO,
                       0 AS encargos
                FROM HMEALL HME
                WHERE HME.TIPOMOV IN (1,2,6,7)
                AND   HME.NATUREZAITEM > 0
                AND   HME.DATAPREVISTA <= DATAREFERANT
                AND   (HME.DATAEFETIVA IS NULL OR HME.DATAEFETIVA > DATAREFERANT)
                AND   (HME.VLREFETIVO IS NULL OR HME.DATAEFETIVA > DATAREFERANT)
                AND   (HME.FLGQUITABONOESTORNO = 0 OR (HME.FLGQUITABONOESTORNO IN (1,2) AND HME.DATAQUITABONOESTORNO > DATAREFERANT))
                AND   (hme.IDTIPOSUSPEMPTMO IS NULL OR 1 = (SELECT ts.flgemaberto FROM tiposuspemptmo ts WHERE ts.idtiposuspemptmo = hme.idtiposuspemptmo))
                AND   HME.IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo
                AND   (HME.IDITEMEMPTMO <> 50 OR (HME.IDITEMEMPTMO = 50 AND 0 = (SELECT itc.itctratasaldodev
                                                                                 FROM itemxtipocontr itc
                                                                                      JOIN contratoemptmo c ON c.idtipocontremptmo = itc.idtipocontremptmo
                                                                                 WHERE itc.iditememptmo = hme.iditememptmo
                                                                                 AND c.idcontratoemptmo = hme.idcontratoemptmo)))
               UNION ALL
               SELECT 0 AS VLRPREVISTO,
                      NVL(SUM(HME.VLRPREVISTO),0) as encargos
               FROM HMEENCARGOS HME
               WHERE HME.IDITEMEMPTMO <> 121
               AND   HME.NATUREZAITEM > 0
               AND   HME.DATAPREVISTA <= DATAREFERANT
               AND   (HME.DATAEFETIVA IS NULL OR HME.DATAEFETIVA > DATAREFERANT)
               AND   (HME.VLREFETIVO  IS NULL OR HME.DATAEFETIVA > DATAREFERANT)
               AND   (HME.FLGQUITABONOESTORNO = 0 OR (HME.FLGQUITABONOESTORNO IN (1,2) AND HME.DATAQUITABONOESTORNO > DATAREFERANT))
               AND   HME.IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo);

        --Percentual de provisão para perdas
        /*Busca os percentuais sobre os valores dos créditos vencidos e vincendos - Provisões de perdas*/
        /*PercProv := CASE
                       WHEN DataPrevistaInad IS NULL THEN 0
                       WHEN TRUNC((DataRefer - DataPrevistaInad)) < 61 THEN 0
                       WHEN TRUNC((DataRefer - DataPrevistaInad)) < 121 THEN 0.25
                       WHEN TRUNC((DataRefer - DataPrevistaInad)) < 241 THEN 0.50
                       WHEN TRUNC((DataRefer - DataPrevistaInad)) < 361 THEN 0.75
                       ELSE 1
                    END;
         */         
        IF DataPrevistaInad IS NULL THEN 
        	PercProv := 0;
        ELSE
        	DifDias := TRUNC((DataRefer - DataPrevistaInad));
			PercProv := CM.FN_EMP_PERCENTUAL_PROVISAO_PERDA(DifDias);
        END IF;
		
      --Provisão para perdas atual VlrProvPerd
      BEGIN
        SELECT SUM(DECODE(hme.iditememptmo,56,hme.vlrprevisto,-hme.vlrprevisto))
        INTO VlrProvPerd
        FROM hmeall hme
        WHERE hme.idcontratoemptmo = cPrincipal.idcontratoemptmo
              AND hme.iditememptmo IN (56,71,129)
              AND hme.dataprevista BETWEEN TO_DATE('31/12/2004','DD/MM/YYYY') AND DataRefer
              AND hme.flgquitabonoestorno < 3;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          VlrProvPerd := 0;
      END;

      -- Recupera o campo SALDOPROVREGISTRADO do mês anterior
      BEGIN
        SELECT m.SaldoProvRegistrado
        INTO SaldoProvRegistradoAnt
        FROM MAPAMOVEMPTMO m
        WHERE m.idcontratoemptmo = cPrincipal.idcontratoemptmo
              AND m.dataref = DataReferAnt;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          SaldoProvRegistradoAnt := 0;
      END;

       --Provisão para perdas anterior
      BEGIN
        SELECT m.percprov,
               m.saldoprov
        INTO PercProvPerdAnt,
             VlrProvPerdAnt
        FROM MAPAMOVEMPTMO m
        WHERE m.idcontratoemptmo = cPrincipal.idcontratoemptmo
              AND m.dataref = DataReferAnt;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          PercProvPerdAnt := 0;
          VlrProvPerdAnt := 0;
      END;

      --SituacaoConsolidada
      BEGIN
        SELECT
          CASE
             WHEN sp.idsitpart in (11,12,4, 15, 38, 39, 37, 36, 70, 26) THEN
                  'APOSENTADO'
             WHEN sp.idsitpart in (1,33,83,6, 75,87,89,102,106,112) THEN
                  'ATIVO'
             WHEN sp.idsitpart in (2, 3, 77, 41, 65) THEN
                  'AUTOPATROCINADO'
             WHEN sp.idsitpart in (58, 63) THEN
                  'BPD - BENEFICIO PROPORCIONAL DIFERIDO'
             WHEN sp.idsitpart in (7, 10,8,9,52,50,54,96,100, 45) THEN
                  'CANCELADO'
             WHEN sp.idsitpart in (116, 93, 114, 25, 91, 104, 108) THEN
                  'APOSENTADO'
             WHEN SitParticip in ('PENSIONISTA', 'ASSISTIDO', 'APOSENTADO T. DE CONTRIBUIÇÃO') THEN
                  'ASSISTIDO'
             WHEN SitParticip in ('MIGRADO', 'SALDADO', 'AGUARDANDO TRANSFERENCIA DO SALDO DE CONTA') THEN
                  'ATIVO'
             WHEN SitParticip in ('MANUTENÇÃO DO SALDO DE CONTA') THEN
                  'AUTOPATROCINIO'
             WHEN SitParticip in ('CANCELADO', 'PENSIONISTA (FALECIDO)', 'CANCELADO (SALDADO)') THEN
                  'CANCELADO'
             ELSE SitParticip
          END
        INTO SituacaoConsolidada
        FROM sitpart sp
        WHERE sp.descricao = SitParticip;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          SituacaoConsolidada := 'PENSIONISTA';
      END;

--Taffarel - SIG66626 - início
      SELECT MAX(NOME)
      INTO PerfilInvest
      FROM (SELECT NVL((SELECT DISTINCT PI.NOME
                        FROM PERFILINVEST PI 
                             JOIN CONTRATOEMPTMO CON ON PI.IDPERFILINVEST = CON.IDPERFILINVEST
                        WHERE CON.IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo),
                       (SELECT DISTINCT MAX (PI.NOME) 
                        FROM PERFILINVXELEG PIE
                             JOIN CONTRATOEMPTMO CON ON PIE.IDPESSOA = CON.IDPESSOA
                                                     AND PIE.IDPLANOPREV = CON.IDPLANOPREV
                             JOIN PERFILINVEST PI ON PIE.IDPERFILINVEST = PI.IDPERFILINVEST
                                                  AND PIE.IDPLANOPREV = PI.IDPLANOPREV
                        WHERE CON.IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo
                        AND   PIE.DTINICIO <= DataRefer
                        AND   (PIE.DTFIM IS NULL OR PIE.DTFIM > DataRefer) 
                        AND   PIE.DTINICIO = (SELECT MAX(DTINICIO) 
                                              FROM PERFILINVXELEG
                                              WHERE IDPESSOA = PIE.IDPESSOA
                                              AND   DTINICIO <= DataRefer))) AS NOME 
            FROM DUAL);

      BEGIN
        SELECT CONTROLE
        INTO Controle
        FROM (SELECT MAX(TR.IDTRANSPERFILINVEST) AS CONTROLE
              FROM TRANSPERFILINVEST TR
              WHERE TR.IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo
              AND TR.MESANOCOMPET = AnoMesRefer);
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          Controle := 0;
      END;

      --Hébio - SIG66626 - início
      PerfilAnterior := NULL;
      PerfilAtual := NULL;
      SaldoDev := NULL;
      SaldoVenc := NULL;
      ProvPerdas := NULL;
      --Hébio - SIG66626 - fim

      IF (Controle <> 0) THEN
        SELECT MAX(NOME)
        INTO PerfilAnterior
        FROM (SELECT DISTINCT ANT.NOME 
              FROM TRANSPERFILINVEST T
                   JOIN PERFILINVEST ANT ON ANT.IDPERFILINVEST = T.IDPERFILINVESTANT
                   --JOIN PERFILINVEST ATU ON ATU.IDPERFILINVEST = T.IDPERFILINVESTATU
                   JOIN CONTRATOEMPTMO CON ON CON.IDCONTRATOEMPTMO = T.IDCONTRATOEMPTMO
              WHERE T.MESANOCOMPET = AnoMesRefer
              AND T.IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo);

        SELECT MAX(NOME)
        INTO PerfilAtual
        FROM (SELECT DISTINCT ATU.NOME
              FROM TRANSPERFILINVEST T
                   --JOIN PERFILINVEST ANT ON ANT.IDPERFILINVEST = T.IDPERFILINVESTANT
                   JOIN PERFILINVEST ATU ON ATU.IDPERFILINVEST = T.IDPERFILINVESTATU
                   JOIN CONTRATOEMPTMO CON ON CON.IDCONTRATOEMPTMO = T.IDCONTRATOEMPTMO
              WHERE T.MESANOCOMPET = AnoMesRefer
              AND T.IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo);
        
        BEGIN
          SELECT DISTINCT SALDODEVED
          INTO SaldoDev
          FROM (SELECT NVL((SELECT DISTINCT HME.vlrprevisto --Por algum motivo houve inserção duplicada (Alguém que criou o processo precisa revisar)
                            FROM hmeajustesaldodev HME
                                 JOIN ITEMXTIPOCONTR ITC ON ITC.IDITEMEMPTMO = HME.IDITEMEMPTMO
                                                         AND ITC.FLGTRANSPERFIL = 'E'
                                                         AND ITC.FLGTIPOITEM = 1
                            WHERE HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO
                            AND   ITC.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO
                            AND   HME.dataprevista = DataRefer), 0) AS SALDODEVED
                FROM TRANSPERFILINVEST T
                     JOIN PERFILINVEST ANT ON ANT.IDPERFILINVEST = T.IDPERFILINVESTANT
                     JOIN PERFILINVEST ATU ON ATU.IDPERFILINVEST = T.IDPERFILINVESTATU
                     JOIN CONTRATOEMPTMO CON ON CON.IDCONTRATOEMPTMO = T.IDCONTRATOEMPTMO
                WHERE T.MESANOCOMPET = AnoMesRefer
                AND CON.IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo);
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            SaldoDev := 0;
        END;
        
        BEGIN
          SELECT DISTINCT SALDOVENCI
          INTO  SaldoVenc
          FROM (SELECT NVL((SELECT DISTINCT HME.vlrprevisto --Por algum motivo houve inserção duplicada (Alguém que criou o processo precisa revisar)
                            FROM hmeajustesaldodev HME
                                 JOIN ITEMXTIPOCONTR ITC ON ITC.IDITEMEMPTMO = HME.IDITEMEMPTMO
                                                         AND ITC.FLGTRANSPERFIL = 'E'
                                                         AND ITC.FLGTIPOITEM = 2
                            WHERE HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO
                            AND   ITC.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO
                            AND   HME.dataprevista = DataRefer), 0) AS SALDOVENCI
                FROM TRANSPERFILINVEST T
                     JOIN PERFILINVEST ANT ON ANT.IDPERFILINVEST = T.IDPERFILINVESTANT
                     JOIN PERFILINVEST ATU ON ATU.IDPERFILINVEST = T.IDPERFILINVESTATU
                     JOIN CONTRATOEMPTMO CON ON CON.IDCONTRATOEMPTMO = T.IDCONTRATOEMPTMO
                WHERE T.MESANOCOMPET = AnoMesRefer
                AND CON.IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo);
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            SaldoVenc := 0;
        END;
        
        BEGIN
          SELECT DISTINCT PROVEPERD
          INTO ProvPerdas
          FROM (SELECT NVL((SELECT DISTINCT HME.vlrprevisto --Por algum motivo houve inserção duplicada (Alguém que criou o processo precisa revisar)
                            FROM hmeajustesaldodev HME
                                 JOIN ITEMXTIPOCONTR ITC ON ITC.IDITEMEMPTMO = HME.IDITEMEMPTMO
                                                         AND ITC.FLGTRANSPERFIL = 'E'
                                                         AND ITC.FLGTIPOITEM = 3
                            WHERE HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO
                            AND   ITC.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO
                            AND   HME.dataprevista = DataRefer), 0) AS PROVEPERD
                FROM TRANSPERFILINVEST T
                     JOIN PERFILINVEST ANT ON ANT.IDPERFILINVEST = T.IDPERFILINVESTANT
                     JOIN PERFILINVEST ATU ON ATU.IDPERFILINVEST = T.IDPERFILINVESTATU
                     JOIN CONTRATOEMPTMO CON ON CON.IDCONTRATOEMPTMO = T.IDCONTRATOEMPTMO
                WHERE T.MESANOCOMPET = AnoMesRefer
                AND CON.IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo);
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            ProvPerdas := 0;
        END;

      END IF;
--Taffarel - SIG66626 - fim

      --Insere os dados na tabela
      INSERT INTO MAPAMOVEMPTMO
             VALUES (
                      cPrincipal.idcontratoemptmo , --1 A
                      Matricula, --2 B
                      NomeBenef, --3 C
                      PlanoContabil, --4 D
                      Patro, --5 E
                      SitParticip, --6 F
                      SituacaoConsolidada,--7 G *
                      SitContrato, --8 H
                      TipoContrato, --9 I
                      DataCredito, --10 J
                      DataRepac, --11 K
                      NVL(TaxaRepac,TxJuros), --12 L
                      NVL(ParcRepac,Numparcelas), --13 M
                      ValorSolicitado, --14 N
                      SaldoAnterior + ValorInadAnt, --15 O
                      SaldoAnterior, --16 P
                      ValorInadAnt, --17 Q *
                      QuantPrestAnterior, --18 R
                      ValorPrest, --19 S
                      EncargCorrMonet, --20 T
                      EncargJurosRem, --21 U
                      EncargJurosMora, --22 V
                      EncargMulta, --23 W
                      SaldoVencDevolucoes, --24 X
                      AjustePrestacao, --25 Y
                      DevolucaoEncargos, --26 Z
                      IOF, --27 AA
                      Seguro, --28 AB
                      AtuDiaCM, --29 AC
                      AtuDiaJuros, --30 AD
                      AjusteSaldoDev, --31 AE
                      Amortizacao, --32 AF
                      QuitBruto, --33 AG
                      QuitLiquido, --34 AH
                      SaldoAtual + TotalInad - QuitacaoInad, --35 AI
                      SaldoAtual, --36 *
                      QuantPrest, --37 AK
                      TotalInad - QuitacaoInad, --38 AL
                      QuantInad, --39 AM
                      ValorInadMesAtual, --40 AN
                      QuitacaoInad, --41 AO
                      NVL(DataRefer - DataPrevistaInad,0), --42 AP
                      PercProv, --43 AQ
                      (SaldoAtual + TotalInad) * PercProv, --44 AR
                      VlrProvPerd, --45 AS
                      NVL(Liminar,NVL(Liminar1,'NÃO')), --45 AT
                      TipoSusp, --47 AU
                      QuantSusp, --48 AV
                      QuitacaoParcelas, --49 AW
                      QuitacaoCM, --50 AX
                      QuitacaoJurosRem, --51 AY
                      QuitacaoJurosMora, --52 AZ
                      QuitacaoMulta, --53 BA
                      QuitacaoCMDif, --54 BB
                      QuitacaoJurRemDif, --55 BC
                      QuitacaoJurMorDif, --56 BD
                      QuitacaoMultaDif, --57 BE
                      DataRefer, --58 BF
                      SaldoProvRegistradoAnt, --59 BG
                      AjusteSaldoOutros, --60 BH
                      AjusteSeguro, --61 BI
                      QuitacaoDevolucaoFGQC, --62 BJ
                      AjusteSaldoVenc, --63 BK
                      FundoGarantidor, --64 BL
                      SaldoVencRecebimento, --65 BM
                      QuitFGQC, --66 BN
                      QuitDeFundGarant, --67 BO
                      QuitSegRet, --68 BP
                      PercProvPerdAnt, --69 BQ
                      VlrProvPerdAnt, --70 BR
                      DevolFundoGarant, --71 BS
                      ComplSeg, --72 BT
                      IncorpPrest, --73 BU
                      IncorpSeg, --74 BV
                      EstornJuros, --75 BW
                      EstornCorr, --76 BX
                      DevolSaldDev, --77 BY
                      AjustSaldResid, --78 BZ
                      AjusteCM, --79 CA
                      AjusteJuros, --80 CB
                      AjusteMora, --81 CC
                      AjusteMulta, --82 CD
                      DespCorrecao, --83 CE
                      DespJuros, --84 CF
                      FGQCAbonado, --85 CG
                      VlrInadPrescrita, --86 CH
                      ValorConcedido, --87 CI
                      EncargIOFCompl, --88 CJ
                      QuitaçãoIOFCompl, --89 CK
                      QuitaçãoIOFComplDif, --90 CL
                      VlrIOFApropriado, --91 CM
                      VlrIOFPago, --92 CN
                      VlrIOFAbonado, --93 CO
                      VlrIOFRecolhido, --94 CP
                      PerdaEfetiva, --95 CQ
                      DataPerdaEfetiva, --96 CR
                      USER, --97
                      SYSDATE, --98
                      --Taffarel - SIG66626 - início
                      PerfilInvest,
                      PerfilAnterior,
                      PerfilAtual,
                      SaldoDev,
                      SaldoVenc,
                      ProvPerdas,
                      --Taffarel - SIG66626 - fim
                      InpcContrato, --99
                     CPF, --100
                     OrigemConcessao, --101
                      SexoPartic, --102
                      IdadePartic, --103
                     UF,  --105
                      DataNasc, --104
                     --Leandro - WO4233 - inicio
					DataReferDia1,
					DataRefer
                     --Leandro - WO4233 - fim
                     
                    );

      UPDATE CM.CONTRATOS_MAPAMOVEMPTMO
      SET flgprocessado = 1
      WHERE IDCONTRATOEMPTMO = cPrincipal.idcontratoemptmo;

      IF MOD(icommit, 200) = 0 THEN
        COMMIT;
      END IF;

    END LOOP;

	insert into cm.mapamov_controle values (pDataRefer, 'Fim do processo', sysdate, user);
    COMMIT;
    
END PR_MAPAMOVEMPTMO;