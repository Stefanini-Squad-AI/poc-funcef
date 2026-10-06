CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_5099( IDMUTUARIO_P NUMBER,
                                               IDCONTRATO_P NUMBER,
                                               IDTIPOCONTRATO_P INT,
                                               IDOPERACAO_P     INT,
                                               DATASOLICITACAO_P DATE,
                                               VALORSOLICITADO_P NUMBER,
                                               RESULTADO_P OUT VARCHAR2,
                                               RETORNO_P OUT VARCHAR2) IS
BEGIN

PCK_EMP_REGRA_LIMITE_R.PR_REGRA_5099( IDMUTUARIO_P,
                                      NVL(IDCONTRATO_P,-1),
                                      IDTIPOCONTRATO_P,
                                      IDOPERACAO_P,
                                      DATASOLICITACAO_P,
                                      VALORSOLICITADO_P,
                                      RESULTADO_P,
                                      RETORNO_P);                                                                 

  
END PR_EMP_REGRA_5099;
/
