CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_24631( IDMUTUARIO_P NUMBER,
                                                IDCONTRATO_P NUMBER,
                                                IDTIPOCONTRATO_P INT,
                                                IDOPERACAO_P     INT,
                                                RESULTADO_P OUT VARCHAR2,
                                                RETORNO_P OUT VARCHAR2) IS
BEGIN

PCK_EMP_REGRA_LIMITE_R.PR_REGRA_24631( IDMUTUARIO_P,
                                       NVL(IDCONTRATO_P,-1),
                                       IDTIPOCONTRATO_P,
                                       IDOPERACAO_P,
                                       RESULTADO_P,
                                       RETORNO_P);                                                                 

  
END PR_EMP_REGRA_24631;
/
