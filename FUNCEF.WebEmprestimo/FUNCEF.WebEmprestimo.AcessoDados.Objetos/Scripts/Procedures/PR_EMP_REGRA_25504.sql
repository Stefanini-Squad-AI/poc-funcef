CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25504(  IDMUTUARIO_P      INT,
                                                 IDCONTRATO_P      NUMBER,
                                                 IDTIPOCONTRATO_P  INT,
                                                 IDOPERACAO_P       INT,
                                                 IDCONTRATOAQUITAR_P VARCHAR2,
                                                 DATACREDITO_P     DATE,
                                                 SALDOANTERIOR_P   NUMBER,
                                                 VALORSOLICITADO_P NUMBER,
                                                 RESULTADO_P       OUT NUMBER,
                                                 RETORNO_P         OUT VARCHAR2) IS

BEGIN


PCK_EMP_REGRA_ITEMCONCESSAO_R.PR_REGRA_25504( IDMUTUARIO_P,
                                              NVL(IDCONTRATO_P,-1),
                                              IDTIPOCONTRATO_P,
                                              IDOPERACAO_P,
                                              IDCONTRATOAQUITAR_P,
                                              DATACREDITO_P,
                                              SALDOANTERIOR_P,
                                              VALORSOLICITADO_P,
                                              RESULTADO_P,
                                              RETORNO_P);


END PR_EMP_REGRA_25504;
/
