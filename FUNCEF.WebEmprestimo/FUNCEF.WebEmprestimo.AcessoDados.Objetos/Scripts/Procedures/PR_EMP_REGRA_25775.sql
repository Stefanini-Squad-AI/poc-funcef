CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25775( IDMUTUARIO_P      NUMBER,
                                                IDCONTRATO_P      NUMBER,
                                                IDTIPOCONTRATO_P  INT,
                                                IDOPERACAO_P      INT,
                                                IDCONTRATOAQUITAR_P VARCHAR2,
                                                DATACREDITO_P     DATE,
                                                TAXAJUROS_P       NUMBER,
                                                NUMPARCELAS_P     INT,
                                                SALDOANTERIOR_P   NUMBER,
                                                RESULTADO_P   OUT NUMBER,
                                                RETORNO_P     OUT VARCHAR2) IS

V_DATACREDITO DATE;
V_VALORSOLICITADO NUMBER;
V_TAXAJUROS NUMBER;

BEGIN

IF IDCONTRATO_P IS NOT NULL THEN
   BEGIN
       SELECT C.DATACREDITO, C.VLRCONTRATO, C.TXJUROS INTO
              V_DATACREDITO, V_VALORSOLICITADO, V_TAXAJUROS
       FROM CONTRATOEMPTMO C WHERE C.IDCONTRATOEMPTMO = IDCONTRATO_P;
   END;
ELSE
   BEGIN
       V_DATACREDITO := DATACREDITO_P;
       V_TAXAJUROS := TAXAJUROS_P;
   END;
END IF;


 PCK_EMP_REGRA_ITEMCONCESSAO_R.PR_REGRA_25775( IDMUTUARIO_P,
                                               NVL(IDCONTRATO_P,-1),
                                               IDTIPOCONTRATO_P,
                                               IDOPERACAO_P,
                                               IDCONTRATOAQUITAR_P,
                                               V_DATACREDITO,
                                               V_TAXAJUROS,
                                               NUMPARCELAS_P,
                                               SALDOANTERIOR_P,
                                               RESULTADO_P,
                                               RETORNO_P);

END PR_EMP_REGRA_25775;
/
