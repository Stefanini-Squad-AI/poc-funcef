CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_26055( IDMUTUARIO_P    INT,
                                                  IDTITULAR_P     INT,
                                                  IDTIPOCONTRATO_P  INT,
                                                  IDOPERACAO_P      INT,
                                                  DATACREDITO_P     DATE,
                                                  DATAPRIMEIRAPARCELA_P DATE,
                                                  DATAEVENTO_P  DATE,
                                                  IDTIPOSUSPENSAO_P INT,
                                                  TAXAJUROS_P       NUMBER,
                                                  SALDODEVEDOR_P    NUMBER,
                                                  NUMPARCELAS_P     INT,
                                                  IDCALCULO_P    PLS_INTEGER,
                                                  USUARIO_P      VARCHAR2,
                                                  RESULTADO_P   OUT NUMBER,
                                                  RETORNO_P     OUT VARCHAR2) IS

V_DATACREDITO DATE;
V_VALORPRIMEIRAPARCELA NUMBER;
V_DATAPRIMEIRAPARCELA DATE;
V_TAXAJUROS NUMBER;
V_IDTIPOSUSPENSAO INT;

BEGIN

IF IDCONTRATO_P IS NOT NULL THEN
   BEGIN
       SELECT C.DATACREDITO, C.VLRPARCELA, C.TXJUROS, C.DATAPRIMPARC, C.IDTIPOSUSPEMPTMO INTO
              V_DATACREDITO, V_VALORPRIMEIRAPARCELA, V_TAXAJUROS, V_DATAPRIMEIRAPARCELA, V_IDTIPOSUSPENSAO
       FROM CONTRATOEMPTMO C WHERE C.IDCONTRATOEMPTMO = IDCONTRATO_P;
   END;
ELSE
   BEGIN
       V_DATACREDITO := DATACREDITO_P;
       V_VALORPRIMEIRAPARCELA := VALORPRIMEIRAPARCELA_P;
       V_DATAPRIMEIRAPARCELA := DATAPRIMEIRAPARCELA_P;
       V_TAXAJUROS := TAXAJUROS_P;
       V_IDTIPOSUSPENSAO := IDTIPOSUSPENSAO_P;
   END;
END IF;


 PCK_EMP_REGRA_ITEMCONCESSAO_R.PR_REGRA_26055( IDMUTUARIO_P,
                                               NVL(IDCONTRATO_P,-1),
                                               IDTIPOCONTRATO_P,
                                               IDOPERACAO_P,
                                               IDCONTRATOAQUITAR_P,
                                               V_DATACREDITO,
                                               NUMPARCELAS_P,
                                               V_IDTIPOSUSPENSAO,
                                               V_VALORPRIMEIRAPARCELA,
                                               V_DATAPRIMEIRAPARCELA,
                                               SALDOANTERIOR_P,                                                      
                                               V_TAXAJUROS,
                                               RESULTADO_P,
                                               RETORNO_P);

END PR_EMP_REGRA_26055;
/
