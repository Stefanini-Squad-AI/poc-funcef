CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25762( IDMUTUARIO_P         NUMBER,
                                                IDCONTRATO_P         NUMBER,
                                                IDTIPOCONTRATO_P     INT,
                                                IDOPERACAO_P         INT,
                                                DATAASSINATURA_P     DATE,
                                                DATACREDITO_P        DATE,
                                                DATAPRIMEIRAPARCELA_P DATE,
                                                RESULTADO_P      OUT NUMBER,
                                                RETORNO_P        OUT VARCHAR2) IS
                                                
BEGIN

PCK_EMP_REGRA_VLMAXIMO_R.PR_REGRA_25762( IDMUTUARIO_P,
                                         NVL(IDCONTRATO_P,-1),
                                         IDTIPOCONTRATO_P,
                                         IDOPERACAO_P,
                                         DATACREDITO_P,
                                         DATAPRIMEIRAPARCELA_P,
                                         DATAASSINATURA_P,
                                         RESULTADO_P,
                                         RETORNO_P);
  
END PR_EMP_REGRA_25762;
/
