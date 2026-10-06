CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25974(  IDMUTUARIO_P      INT,
                                                 IDCONTRATO_P      NUMBER,
                                                 IDOPERACAO_P      INT,
                                                 IDTIPOCONTRATO_P  INT,
                                                 VALORSOLICITADO_P NUMBER,
                                                 DATACREDITO_P     DATE,
                                                 DATAPRIMEIRAPARCELA_P DATE,
                                                 NUMPARCELAS_P         INT,
                                                 RESULTADO_P       OUT NUMBER,
                                                 RETORNO_P         OUT VARCHAR2) IS

BEGIN
      


PCK_EMP_REGRA_ITEMCONCESSAO_R.PR_REGRA_25974 ( IDMUTUARIO_P,
                                               NVL(IDCONTRATO_P,-1),
                                               IDTIPOCONTRATO_P,
                                               IDOPERACAO_P,
                                               DATACREDITO_P, 
                                               DATAPRIMEIRAPARCELA_P,
                                               VALORSOLICITADO_P,
                                               NUMPARCELAS_P,
                                               RESULTADO_P,
                                               RETORNO_P);

 
end PR_EMP_REGRA_25974;
/
