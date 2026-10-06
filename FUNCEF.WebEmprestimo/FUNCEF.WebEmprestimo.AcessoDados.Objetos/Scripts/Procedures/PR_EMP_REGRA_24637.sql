CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_24637( IDMUTUARIO_P      NUMBER,
                                                IDCONTRATO_P      NUMBER,
                                                IDTIPOCONTRATO_P  INT,
                                                IDOPERACAO_P      INT,
                                                DATACREDITO_P     DATE,
                                                VALORSOLICITADO_P NUMBER,
                                                DATAPRIMEIRAPARCELA_P DATE,
                                                SALDODEVEDOR_P   NUMBER,
                                                RESULTADO_P   OUT NUMBER,
                                                RETORNO_P     OUT VARCHAR2) IS

V_DATACREDITO DATE;
V_VALORSOLICITADO NUMBER;
V_DATAPRIMEIRAPARCELA DATE;

BEGIN

IF IDCONTRATO_P IS NOT NULL THEN
   BEGIN
       SELECT C.DATACREDITO, C.VLRCONTRATO, C.DATAPRIMPARC INTO
              V_DATACREDITO, V_VALORSOLICITADO, V_DATAPRIMEIRAPARCELA
       FROM CONTRATOEMPTMO C WHERE C.IDCONTRATOEMPTMO = IDCONTRATO_P;
   END;
ELSE
   BEGIN
       V_DATACREDITO := DATACREDITO_P;
       V_VALORSOLICITADO := VALORSOLICITADO_P;
       V_DATAPRIMEIRAPARCELA :=DATAPRIMEIRAPARCELA_P;
   END;
END IF;


 PCK_EMP_REGRA_ITEMCONCESSAO_R.PR_REGRA_24637( IDMUTUARIO_P,
                                               NVL(IDCONTRATO_P,-1),
                                               IDTIPOCONTRATO_P,
                                               IDOPERACAO_P,
                                               V_DATACREDITO,
                                               V_DATAPRIMEIRAPARCELA,
                                               V_VALORSOLICITADO,
                                               SALDODEVEDOR_P,
                                               RESULTADO_P,
                                               RETORNO_P);

END PR_EMP_REGRA_24637;
/
