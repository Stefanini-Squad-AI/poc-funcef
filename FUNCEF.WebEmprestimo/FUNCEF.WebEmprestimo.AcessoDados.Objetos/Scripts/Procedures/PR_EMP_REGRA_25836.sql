CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25836(  IDMUTUARIO_P      INT,
                                                 IDCONTRATO_P      NUMBER,
                                                 IDOPERACAO_P      INT,
                                                 IDCONTRATOAQUITAR_P VARCHAR2,
                                                 IDTIPOCONTRATO_P  INT,
                                                 VALORSOLICITADO_P NUMBER,
                                                 DATACREDITO_P     DATE,
                                                 RESULTADO_P       OUT NUMBER,
                                                 RETORNO_P         OUT VARCHAR2) IS

BEGIN
      


PCK_EMP_REGRA_ITEMCONCESSAO_R.PR_REGRA_25836 ( IDMUTUARIO_P,
                                               NVL(IDCONTRATO_P,-1),
                                               IDTIPOCONTRATO_P,
                                               IDOPERACAO_P,
                                               IDCONTRATOAQUITAR_P,
                                               DATACREDITO_P, 
                                               VALORSOLICITADO_P,
                                               RESULTADO_P,
                                               RETORNO_P);

 
end PR_EMP_REGRA_25836;
/
