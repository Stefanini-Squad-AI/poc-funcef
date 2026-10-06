CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_24635(  IDMUTUARIO_P      INT,
                                                 IDCONTRATO_P      NUMBER,
                                                 IDOPERACAO_P      INT,
                                                 IDTIPOCONTRATO_P  INT,
                                                 DATAREFERENCIA_P  DATE,
                                                 VALORSOLICITADO_P NUMBER,
                                                 RESULTADO_P       OUT NUMBER,
                                                 RETORNO_P         OUT VARCHAR2) IS

BEGIN


PCK_EMP_REGRA_ITEMCONCESSAO_R.PR_REGRA_24635 ( IDMUTUARIO_P,
                                               NVL(IDCONTRATO_P,-1),
                                               IDTIPOCONTRATO_P,
                                               IDOPERACAO_P,
                                               DATAREFERENCIA_P,
                                               VALORSOLICITADO_P,
                                               RESULTADO_P,
                                               RETORNO_P);

 
end PR_EMP_REGRA_24635;
/
