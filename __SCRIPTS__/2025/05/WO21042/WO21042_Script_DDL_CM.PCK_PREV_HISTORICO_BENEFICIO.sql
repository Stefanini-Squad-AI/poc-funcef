CREATE OR REPLACE PACKAGE BODY CM.PCK_PREV_HISTORICO_BENEFICIO AS

/*01/10/2020	-	SIG 102646	-	Tiago Von		-			Ajuste na consulta para considerar benefícios concedidos retroativamente, cuja datafinal*/
/*																								também seja retoativa, ou seja, a datafinal é anterior à data de concessão do benefício    */
/*05/04/2022    -   SIG 124512  -   Tiago Von       -       	Inclusão da LINHASELECAO.DATAFINAL no Insert da procedure PR_GERAHISTORICOPERIODO, pois a procedure não esta inserindo a data final*/
/*                                                          									nos benefícios dos participantes que já possuem a datafinal. EX: (Filhos menores de 21)*/
/*                                                          									Ajuste realizado também na proccedure: PR_GRAVAHSTPERCGRUPO, uma vez que, a procedure duplica os registros já existentes na tabela HSTPERCGRUPO*/
/*02/05/2022    -   SIG 125281  -   Tiago Von       -       	Váriavel IN_IDPREPAROBENEF passada como parametro das procedures: PR_GERAHISTORICOPASSADO e PR_GRAVAHSTPERCGRUPO*/
/*                                                          									procedure PR_GERAHISTORICOPERIODO adaptada para tratar especificamente os casos de encerramento de benefícios*/
/*06/07/2022    -   SIG 126949  -   Tiago Von       -           Ajuste para considerar no Desdobramento os benefícios com DATAFIM futura. Inclusão:  or Hc.Datafim > sysdate*/
/*                                                              Comentado o not Exists da consulta utilizada como base na inclusão dos novos registros.*/
/*30/09/2022    -   SIG 129521  -   Tiago Von       -           Tratamento realizado para a rotina de falecimento realizada pelo cadastro/beneficio, pois além de estar apresentando erros, não estava realizando as operações corretamente.*/
/*                                                              Comentado o not Exists da consulta utilizada como base na inclusão dos novos registros.*/
/*02/05/2023    -   SIG 135320  -   Edilaine        -           Na Reversao está inserindo percentual sem respeitar o benefício selecionado .*/
/*07/05/2025    -   WO  21042   -   Leandro         -           Não estava colocando a datafim correta quando beneficio encerrado.*/
-------------------------------------------------------------------------------------------------------
PROCEDURE PR_GRAVAHSTPERCGRUPO (inidplanoprev        IN NUMBER,
                                infontepagadora      IN NUMBER,
                                inidpessjur          IN NUMBER,
                                inidtitular          IN NUMBER,
                                inidplanoorigem      IN NUMBER,
                                inseqproposta        IN NUMBER,
                                inflgentradasaida    IN CHAR,
                                indataalteracao      IN DATE,
                                inIdBeneficio        IN number default -1)   /*SIG135320 Edilaine */
AS
  dtIniPeriodo date;
BEGIN
  if inflgentradasaida = 'E' then
    dtIniPeriodo := indataalteracao;
  else
    dtIniPeriodo := indataalteracao + 1;
  end if;
  update Hstpercgrupo Hc
  set    Hc.Datafim = dtIniPeriodo - 1
  where (Hc.Idplanoprev = Inidplanoprev or (Hc.Idplanoprev in (2, 66) and Inidplanoprev in (2, 66)))
        and Hc.Fontepagadora = Infontepagadora
        and Hc.Idpessjur = Inidpessjur
        and Hc.Idtitular = Inidtitular
        and Hc.Seqproposta = Inseqproposta
        and (Hc.Datafim is null or Hc.Datafim > sysdate)-- ; -- SIG 124512 Tiago Von -- SIG 126949 Tiago Von
        -- SIG 124512 Tiago Von - INICIO
        and exists (select 1 from bfciariotitplan be 
                        where   be.idpessoa = hc.idpessoa
                        and     be.idtitular = hc.idtitular
                        and     be.idpessjur = hc.idpessjur
                        and     be.idbeneficio = hc.idbeneficio
                        and     be.idplanoprev = hc.idplanoprev
                        and     be.idplanoorigem = hc.idplanoorigem
                        and     be.seqproposta = hc.seqproposta
                        and     be.percentual <> hc.percentual);
        -- SIG 124512 Tiago Von - FIM
  insert into HSTPERCGRUPO HC (IDHSTPERCGRUPO,IDPESSJUR,IDPLANOPREV,IDTITULAR,IDPESSOA,IDBENEFICIO,DATAINICIO,
                               DATAFIM,PERCENTUAL,FONTEPAGADORA,TRGDTINCLUSAO,TRGUSERINCLUSAO,NUMEROPROCESSO,IDPLANOORIGEM,SEQPROPOSTA)
        select SEQHSTPERCGRUPO.NEXTVAL,
               BF.IDPESSJUR,
               BF.IDPLANOPREV,
               BF.IDTITULAR,
               BF.IDPESSOA,
               BF.IDBENEFICIO,
               dtIniPeriodo DATAINICIO,
               --null DATAFIM,      -- SIG 124512 Tiago Von
               bf.datafinal DATAFIM,-- SIG 124512 Tiago Von
         NVL(bt.Percentual,0) PERCENTUAL,
               BF.FONTEPAGADORA,
               sysdate,
               user,
               BF.NUMEROPROCESSO,
               BF.IDPLANOORIGEM,
               BF.SEQPROPOSTA
        from BENEFBFCIARIO BF
        inner join Bfciariotitplan bt on BF.IDPESSJUR = bt.IDPESSJUR and
                                         BF.IDTITULAR = bt.IDTITULAR and
                                         BF.IDPLANOORIGEM = bt.IDPLANOORIGEM and
                                         BF.IDPESSOA = bt.IDPESSOA and
                                         BF.SEQPROPOSTA = bt.SEQPROPOSTA and
                                         BF.IDPLANOPREV = bt.IDPLANOPREV and
                                         BF.IDBENEFICIO = bt.IDBENEFICIO
        where BF.IDTPPAGTOBENEFIC = 1 and
              BF.FONTEPAGADORA = infontepagadora and
              BF.IDPESSJUR = inidpessjur and
              (BF.IDPLANOPREV = inidplanoprev OR (inidplanoprev IN (2,66) AND BF.IDPLANOPREV IN (2,66))) AND
              BF.IDPESSOA <> BF.IDTITULAR and
              BF.IDTITULAR = inidtitular and
              BF.DATAINICIO <= dtIniPeriodo and
              (inIdBeneficio = -1 OR BF.IDBENEFICIO = inIdBeneficio) and  /*SIG135320 Edilaine */
              -- SIG 124512 Tiago Von - INICIO
              -- SIG 126949 Tiago Von INICIO 
              /*
              not exists (select 1 from hstpercgrupo HST 
                            	where 	hst.idpessoa = bf.IDPESSOA
                            	and	   	hst.idtitular = bf.idtitular
                            	and		hst.idpessjur = bt.idpessjur
                            	and		hst.idplanoprev = bf.idplanoprev
                                and		hst.idbeneficio = bf.idbeneficio
                            	and		hst.idplanoorigem = bf.idplanoorigem
                                and     hst.seqproposta = bf.seqproposta
                                and     hst.datainicio = bf.datainicio 
                                and    (hst.datafim = bf.datafinal or hst.datafim < sysdate )) and */
              -- SIG 126949 Tiago Von FIM 
              not exists (select 1 from hstpercgrupo HST 
                            	where 	hst.idpessoa = bt.IDPESSOA
                            	and	   	hst.idtitular = bt.idtitular
                            	and		hst.idpessjur = bt.idpessjur
                            	and		hst.idplanoprev = bt.idplanoprev
                                and		hst.idbeneficio = bt.idbeneficio
                            	and		hst.idplanoorigem = bt.idplanoorigem
                                and     hst.seqproposta = bt.seqproposta
                                and     hst.percentual = bf.percentual) and                  
              -- SIG 124512 Tiago Von - FIM
              NVL(BF.DATAFINAL, dtIniPeriodo) >= dtIniPeriodo;
 END;
-------------------------------------------------------------------------------------------------------
PROCEDURE PR_GERAHISTORICOPASSADO(inidtitular IN pessoa.idpessoa%TYPE,
                                  in_flgconcessao IN NUMBER DEFAULT 0,
                                  IN_IDPREPAROBENEF IN NUMBER DEFAULT 0 -- SIG 125281 TIAGO VON
                                  )
AS
  VAR_DATAINICIO DATE;
  VAR_DATAFIM DATE;
  VAR_DATACORRENTE DATE;
  VAR_QUANT_ATU INTEGER;
  VAR_QUANT_ANT INTEGER;
  VAR_PERCENT_ATU NUMBER;
BEGIN
  for crTitularPlano in (select distinct bf.IDPLANOPREV,
                                         bf.IDPESSJUR,
                                         bf.IDTITULAR,
                                         bf.IDPLANOORIGEM,
                                         bf.SEQPROPOSTA,
                                         --bf.FONTEPAGADORA,
                                         min(bf.DataInicio) DataInicio
                         from benefbfciario bf
                         where bf.IdTpPagtoBenefic = 1 and
                               bf.idtitular = inIdTitular and
                               bf.IdPlanPrevContab in (2,28,66,74,75) and
                              -- (datafinal is null or datafinal > sysdate) -- SIG 102646 Tiago Von
                               ((datafinal is null or datafinal > sysdate) or (datafinal <= sysdate and to_char(dataconcessao,'mm/yyyy') >=  to_char(sysdate,'mm/yyyy'))) -- SIG 102646 Tiago Von
                         group by bf.IDPLANOPREV,
                                  bf.IDPESSJUR,
                                  bf.IDTITULAR,
                                  bf.IDPLANOORIGEM,
                                  bf.SEQPROPOSTA--,
                                  --bf.FONTEPAGADORA
                                  )
   loop
   -- SIG 125281 TIAGO VON - INICIO
   -- DELETE FROM HSTPERCGRUPO WHERE IDTITULAR = inIdTitular;
   IF IN_IDPREPAROBENEF <> -4 THEN
     DELETE FROM HSTPERCGRUPO WHERE IDTITULAR = inIdTitular;
   END IF;
   -- SIG 125281 TIAGO VON - FIM
   -- PR_GERAHISTORICOPERIODO(inidtitular,crTitularPlano.DataInicio,SYSDATE,in_flgconcessao);  										-- SIG 125281 TIAGO VON
   PR_GERAHISTORICOPERIODO(inidtitular,crTitularPlano.DataInicio,SYSDATE,in_flgconcessao,IN_IDPREPAROBENEF); 	-- SIG 125281 TIAGO VON
     /*PR_GRAVAHSTPERCGRUPO(
                            crTitularPlano.IDPLANOPREV,
                            crTitularPlano.FONTEPAGADORA,
                            crTitularPlano.IDPESSJUR,
                            crTitularPlano.IDTITULAR,
                            crTitularPlano.IDPLANOORIGEM,
                            crTitularPlano.SEQPROPOSTA,
                            'E',
                            crTitularPlano.DataInicio
                         );*/
   end loop;
    END;
-------------------------------------------------------------------------------------------------------
PROCEDURE PR_GERAHISTORICOPERIODO(inidtitular IN pessoa.idpessoa%TYPE,
                                  indatainicio IN DATE,
                                  indatafim IN DATE,
                                  in_flgconcessao IN NUMBER DEFAULT 0,
                                  IN_IDPREPAROBENEF IN NUMBER DEFAULT 0 -- SIG 125281 TIAGO VON
                                  )
AS
  cursor cSelecao is
    SELECT bf.IDPLANOPREV, bf.IDBENEFICIO, bf.NUMEROPROCESSO, bf.IDPESSJUR,
           bf.IDTITULAR, bf.IDPLANOORIGEM, bf.IDPESSOA, bf.SEQPROPOSTA,
           bf.VALORTOTAL, bf.VALORATUAL, bf.VALORCALCULADO,bf.DATAINICIOFUND,
           BF.DIBBENEFANT, BF.IDPLANPREVCONTAB, D.MATRICULA,
           BF.DATAINICIO, BF.DATAFINAL, BF.FONTEPAGADORA,
           BT.PERCENTUAL, BF.DATACONCESSAO, BF.DATAENCERRAMENTO  -- SIG 125281 Tiago Von
           , BF.IDSITBENEFICIO  -- SIG 129521 TIAGO VON
    FROM depentit d
         JOIN benefbfciario bf ON d.idpessoa = bf.idpessoa AND
                                  d.idtitular = bf.idtitular
         JOIN Bfciariotitplan bt on BF.IDPESSJUR = bt.IDPESSJUR and
                                    BF.IDTITULAR = bt.IDTITULAR and
                                    BF.IDPLANOORIGEM = bt.IDPLANOORIGEM and
                                    BF.IDPESSOA = bt.IDPESSOA and
                                    BF.SEQPROPOSTA = bt.SEQPROPOSTA and
                                    BF.IDPLANOPREV = bt.IDPLANOPREV and
                                    BF.IDBENEFICIO = bt.IDBENEFICIO
    WHERE bf.Idtppagtobenefic = 1 AND
          (inidtitular IS NULL OR inidtitular = bf.idtitular) AND
          BF.IDTITULAR <> BF.IDPESSOA AND
          (BF.DATAFINAL >= INDATAINICIO OR BF.DATAFINAL IS NULL) AND
          BF.IDPLANPREVCONTAB IN (2,28,66,74,75);

  VAR_DATAINICIO DATE;
  VAR_DATAFIM DATE;
  VAR_DATACORRENTE DATE;
  VAR_QUANT_ATU INTEGER;
  VAR_QUANT_ANT INTEGER;
  VAR_PERCENT_ATU NUMBER;
  VAR_DATAFIM_BENEF DATE;
  VAR_DATA_ENC DATE; -- SIG 125281 TIAGO VON
  VAR_DATA_FINAL_ENC DATE; 	-- SIG 129521 TIAGO VON
  VAR_ULT_ENC_TITULAR DATE; 	-- SIG 129521 TIAGO VON

BEGIN 
  /* SIG 125281 TIAGO VON - INICIO
  DELETE
  FROM HSTPERCGRUPO HC
  WHERE HC.IDTITULAR = inidtitular and
        HC.DATAINICIO BETWEEN indatainicio and indatafim;

  UPDATE    HSTPERCGRUPO HC
  SET       HC.DATAFIM = NULL
  WHERE     HC.IDTITULAR = inidtitular and
            HC.DATAFIM BETWEEN indatainicio and indatafim;*/
            
  IF IN_IDPREPAROBENEF <> -4 THEN
     DELETE
     FROM  HSTPERCGRUPO HC
     WHERE HC.IDTITULAR = inidtitular and
           HC.DATAINICIO BETWEEN indatainicio and indatafim;

     UPDATE    HSTPERCGRUPO HC
     SET       HC.DATAFIM = NULL
     WHERE     HC.IDTITULAR = inidtitular and
               HC.DATAFIM BETWEEN indatainicio and indatafim;
   END IF;
   -- SIG 125281 TIAGO VON - FIM
   
  for LinhaSelecao in cSelecao
  loop
      VAR_DATAINICIO    := greatest(indatainicio,linhaselecao.datainicio);
      VAR_DATAFIM       := indatafim;
      VAR_DATAFIM_BENEF := LEAST(NVL(LINHASELECAO.DATAFINAL,TO_CHAR(indatafim,'DD/MM/YYYY')),TO_CHAR(indatafim,'DD/MM/YYYY'));
      VAR_DATACORRENTE  := VAR_DATAINICIO;
      
  IF IN_IDPREPAROBENEF <> -4 THEN -- SIG 125281 TIAGO VON 
  
      SELECT COUNT(DISTINCT idpessoa)
       INTO VAR_QUANT_ANT
      FROM BENEFBFCIARIO BF
      WHERE BF.IDTPPAGTOBENEFIC = 1 AND
            BF.FONTEPAGADORA = LINHASELECAO.FONTEPAGADORA AND
            BF.IDPESSJUR = LINHASELECAO.IDPESSJUR AND
            ((LINHASELECAO.IDPLANOPREV IN (2,66) AND BF.IDPLANOPREV IN (2,66)) OR
            (BF.IDPLANOPREV = LINHASELECAO.IDPLANOPREV)) AND
            BF.IDPESSOA <> BF.IDTITULAR AND
            BF.IDTITULAR = LINHASELECAO.IDTITULAR AND
            BF.DATAINICIO <= VAR_DATACORRENTE AND
            NVL(BF.DATAFINAL,SYSDATE) >= indatainicio-1;

      LOOP
          EXIT WHEN VAR_DATACORRENTE = VAR_DATAFIM_BENEF;
              SELECT COUNT(DISTINCT idpessoa)
                     INTO VAR_QUANT_ATU
              FROM BENEFBFCIARIO BF
              WHERE BF.IDTPPAGTOBENEFIC = 1 AND
                    BF.FONTEPAGADORA = LINHASELECAO.FONTEPAGADORA AND
                    BF.IDPESSJUR = LINHASELECAO.IDPESSJUR AND
                    ((LINHASELECAO.IDPLANOPREV IN (2,66) AND BF.IDPLANOPREV IN (2,66)) OR
                     (BF.IDPLANOPREV = LINHASELECAO.IDPLANOPREV)) AND
                    BF.IDPESSOA <> BF.IDTITULAR AND
                    BF.IDTITULAR = LINHASELECAO.IDTITULAR AND
                    BF.DATAINICIO <= VAR_DATACORRENTE AND
                    NVL(BF.DATAFINAL,indatafim+1) >= VAR_DATACORRENTE;

              IF VAR_QUANT_ANT <> VAR_QUANT_ATU OR VAR_DATACORRENTE = LINHASELECAO.DATAINICIO THEN
                IF VAR_QUANT_ATU <> 0 THEN
                  IF in_flgconcessao = 1 THEN
                    VAR_PERCENT_ATU := LINHASELECAO.PERCENTUAL;
                  ELSE
                    VAR_PERCENT_ATU := ROUND((100/VAR_QUANT_ATU),4);
                  END IF;
                ELSE
                  VAR_PERCENT_ATU := 0;
                END IF;

                --WO21042 LEANDRO - INICIO  
                IF IN_IDPREPAROBENEF = -9 THEN
                  UPDATE  HSTPERCGRUPO HC
                  SET     HC.DATAFIM = VAR_DATACORRENTE-1
                  WHERE   HC.IDPLANOPREV = LINHASELECAO.IDPLANOPREV AND
                          HC.IDBENEFICIO = LINHASELECAO.IDBENEFICIO AND
                          HC.NUMEROPROCESSO = LINHASELECAO.NUMEROPROCESSO AND
                          HC.IDPESSJUR = LINHASELECAO.IDPESSJUR AND
                          HC.IDTITULAR = LINHASELECAO.IDTITULAR AND
                          HC.IDPLANOORIGEM = LINHASELECAO.IDPLANOORIGEM AND
                          HC.IDPESSOA = LINHASELECAO.IDPESSOA AND
                          HC.SEQPROPOSTA = LINHASELECAO.SEQPROPOSTA AND
                          (HC.DATAFIM IS NULL OR HC.DATAFIM >= VAR_DATACORRENTE); 
                ELSE         
                  UPDATE  HSTPERCGRUPO HC
                  SET     HC.DATAFIM = VAR_DATACORRENTE-1
                  WHERE   HC.IDPLANOPREV = LINHASELECAO.IDPLANOPREV AND
                          HC.IDBENEFICIO = LINHASELECAO.IDBENEFICIO AND
                          HC.NUMEROPROCESSO = LINHASELECAO.NUMEROPROCESSO AND
                          HC.IDPESSJUR = LINHASELECAO.IDPESSJUR AND
                          HC.IDTITULAR = LINHASELECAO.IDTITULAR AND
                          HC.IDPLANOORIGEM = LINHASELECAO.IDPLANOORIGEM AND
                          HC.IDPESSOA = LINHASELECAO.IDPESSOA AND
                          HC.SEQPROPOSTA = LINHASELECAO.SEQPROPOSTA AND
                          HC.DATAFIM IS NULL ;
                END IF;       
                --WO21042 LEANDRO - FIM

                 IF VAR_PERCENT_ATU <> 0 THEN
                  INSERT INTO HSTPERCGRUPO HC (IDHSTPERCGRUPO,IDPESSJUR,IDPLANOPREV,IDTITULAR,
                                               IDPESSOA,IDBENEFICIO,DATAINICIO,DATAFIM,PERCENTUAL,
                                               FONTEPAGADORA,TRGDTINCLUSAO,TRGUSERINCLUSAO,NUMEROPROCESSO,
                                               IDPLANOORIGEM,SEQPROPOSTA)
                  VALUES (SEQHSTPERCGRUPO.NEXTVAL, LINHASELECAO.IDPESSJUR, LINHASELECAO.IDPLANOPREV, LINHASELECAO.IDTITULAR,
                          --LINHASELECAO.IDPESSOA, LINHASELECAO.IDBENEFICIO, VAR_DATACORRENTE, null, VAR_PERCENT_ATU,                   							-- SIG 124512 Tiago Von
                          LINHASELECAO.IDPESSOA, LINHASELECAO.IDBENEFICIO, VAR_DATACORRENTE, LINHASELECAO.DATAFINAL, VAR_PERCENT_ATU,   	-- SIG 124512 Tiago Von
                          LINHASELECAO.FONTEPAGADORA, SYSDATE, USER, LINHASELECAO.NUMEROPROCESSO,
                          LINHASELECAO.IDPLANOORIGEM, LINHASELECAO.SEQPROPOSTA);
                END IF;
              END IF;

              VAR_QUANT_ANT := VAR_QUANT_ATU;
              VAR_DATACORRENTE := TO_DATE(VAR_DATACORRENTE+1);

            END LOOP;

            IF VAR_DATACORRENTE = LINHASELECAO.DATAFINAL THEN

                UPDATE  HSTPERCGRUPO HC
                SET     HC.DATAFIM = LINHASELECAO.DATAFINAL
                WHERE   HC.IDPLANOPREV = LINHASELECAO.IDPLANOPREV AND
                        HC.IDBENEFICIO = LINHASELECAO.IDBENEFICIO AND
                        HC.NUMEROPROCESSO = LINHASELECAO.NUMEROPROCESSO AND
                        HC.IDPESSJUR = LINHASELECAO.IDPESSJUR AND
                        HC.IDTITULAR = LINHASELECAO.IDTITULAR AND
                        HC.IDPLANOORIGEM = LINHASELECAO.IDPLANOORIGEM AND
                        HC.IDPESSOA = LINHASELECAO.IDPESSOA AND
                        HC.SEQPROPOSTA = LINHASELECAO.SEQPROPOSTA AND
                        HC.DATAFIM IS NULL;
            END IF;
            
  ELSE  -- SIG 125281 TIAGO VON INICIO
        
             SELECT COUNT(DISTINCT idpessoa)
               INTO VAR_QUANT_ATU
               FROM BENEFBFCIARIO BF
              WHERE BF.IDTPPAGTOBENEFIC = 1 AND
                    BF.IDSITBENEFICIO = 1 AND
                    BF.FONTEPAGADORA = LINHASELECAO.FONTEPAGADORA AND
                    BF.IDPESSJUR = LINHASELECAO.IDPESSJUR AND
                    ((LINHASELECAO.IDPLANOPREV IN (2,66) AND BF.IDPLANOPREV IN (2,66)) OR
                    (BF.IDPLANOPREV = LINHASELECAO.IDPLANOPREV)) AND
                    BF.IDPESSOA <> BF.IDTITULAR AND
                    BF.IDTITULAR = LINHASELECAO.IDTITULAR AND
                    BF.DATAINICIO >= VAR_DATACORRENTE AND
                    (BF.DATAENCERRAMENTO IS NULL OR BF.DATAFINAL IS NULL);
            
            -- Busca a datafinal da ultima movimentação de encerramento de benefício
            begin      -- SIG 129521 TIAGO VON       
                SELECT  DATAFINAL
                INTO    VAR_DATA_ENC
                FROM 	MOVBENEF M
                WHERE 	M.IDTITULAR   = LINHASELECAO.IDTITULAR
                AND 	M.IDBENEFICIO = LINHASELECAO.IDBENEFICIO
                AND 	M.IDPLANOPREV = LINHASELECAO.IDPLANOPREV
                AND 	M.TIPOMOV = 4
                AND 	M.IDMOVBENEF = (SELECT  MAX(IDMOVBENEF)
                                        FROM 	MOVBENEF MOV
                                        WHERE 	MOV.IDTITULAR   = M.IDTITULAR
                                        AND 	MOV.IDBENEFICIO = M.IDBENEFICIO
                                        AND 	MOV.IDPLANOPREV = M.IDPLANOPREV
                                        AND 	MOV.TIPOMOV     = M.TIPOMOV);
            -- SIG 129521 TIAGO VON - INICIO  
            -- TRATMENTO REALIZADO PARA QUANDO NÃO É ENCONTRADO EVENTO DE FALECIMENTO PARA O PARTICIPANTE(TITULAR/PENSIONISTA).                      
            exception                               
                when no_data_found then
                    VAR_DATA_ENC := to_char(to_date('01/01/1900'),'dd/mm/yyyy');
            end;
            
            /* Passo criado para alterar o valor da váriavel VAR_DATA_ENC preenchida na EXCEPTION anteior */
            IF to_char(to_date(VAR_DATA_ENC),'dd/mm/yyyy') = '01/01/1900' AND LINHASELECAO.IDSITBENEFICIO <> 1 THEN
                 VAR_DATA_ENC := LINHASELECAO.DATAENCERRAMENTO;
            END IF;
            
            /* Passo criado para buscar a ultima DATAFINAL do beneficio FUNCEF que não esta ATIVO, pois há grupos em que os pensionistas recebem benefícios funcef diferentes (idbeneficio diferente) um do outro */
            IF to_char(to_date(VAR_DATA_ENC),'dd/mm/yyyy') = '01/01/1900' AND LINHASELECAO.IDSITBENEFICIO = 1 THEN
                SELECT  MAX(BF.DATAFINAL)
                INTO    VAR_ULT_ENC_TITULAR
                FROM    BENEFBFCIARIO BF
                WHERE   BF.IDTITULAR = LINHASELECAO.IDTITULAR
                AND     BF.IDPLANOPREV = LINHASELECAO.IDPLANOPREV
                AND     BF.FONTEPAGADORA = 1
                AND     BF.IDTPPAGTOBENEFIC = 1
                AND     BF.IDSITBENEFICIO <> 1;
                
                VAR_DATA_ENC := VAR_ULT_ENC_TITULAR;
               
            END IF;
            -- SIG 129521 TIAGO VON - FIM
            
            --IF VAR_QUANT_ATU >= 0 THEN    -- SIG 129521 TIAGO VON
            IF VAR_QUANT_ATU > 0 THEN        -- SIG 129521 TIAGO VON
               VAR_PERCENT_ATU := ROUND((100/VAR_QUANT_ATU),4);
            ELSE
               VAR_PERCENT_ATU := 0;
            END IF;

                UPDATE  HSTPERCGRUPO HC
                SET     HC.DATAFIM = VAR_DATA_ENC 
                WHERE   HC.IDPLANOPREV = LINHASELECAO.IDPLANOPREV AND
                        HC.IDBENEFICIO = LINHASELECAO.IDBENEFICIO AND
                        HC.NUMEROPROCESSO = LINHASELECAO.NUMEROPROCESSO AND
                        HC.IDPESSJUR = LINHASELECAO.IDPESSJUR AND
                        HC.IDTITULAR = LINHASELECAO.IDTITULAR AND
                        HC.IDPLANOORIGEM = LINHASELECAO.IDPLANOORIGEM AND
                        HC.IDPESSOA = LINHASELECAO.IDPESSOA AND
                        HC.SEQPROPOSTA = LINHASELECAO.SEQPROPOSTA AND
                        (HC.DATAFIM IS NULL OR HC.DATAFIM >= VAR_DATA_ENC);
                        
                 IF (VAR_PERCENT_ATU > 0 AND LINHASELECAO.DATAENCERRAMENTO IS NULL) THEN
                 
                 VAR_DATA_ENC := to_char(to_date(VAR_DATA_ENC) + 1,'dd/mm/yyyy'); -- SIG 129521 TIAGO VON
                 
                  INSERT INTO HSTPERCGRUPO HC (IDHSTPERCGRUPO,IDPESSJUR,IDPLANOPREV,IDTITULAR,
                                               IDPESSOA,IDBENEFICIO,DATAINICIO,DATAFIM,PERCENTUAL,
                                               FONTEPAGADORA,TRGDTINCLUSAO,TRGUSERINCLUSAO,NUMEROPROCESSO,
                                               IDPLANOORIGEM,SEQPROPOSTA)
                  VALUES (SEQHSTPERCGRUPO.NEXTVAL, LINHASELECAO.IDPESSJUR, LINHASELECAO.IDPLANOPREV, LINHASELECAO.IDTITULAR,
                          LINHASELECAO.IDPESSOA, LINHASELECAO.IDBENEFICIO, VAR_DATA_ENC, LINHASELECAO.DATAFINAL, VAR_PERCENT_ATU,
                          LINHASELECAO.FONTEPAGADORA, SYSDATE, USER, LINHASELECAO.NUMEROPROCESSO,
                          LINHASELECAO.IDPLANOORIGEM, LINHASELECAO.SEQPROPOSTA);
                 END IF;
        
        END IF;  -- SIG 125281 TIAGO VON FIM
        END LOOP;
    END;
END PCK_PREV_HISTORICO_BENEFICIO;