CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25208( IDMUTUARIO_P     INT,
                                                IDTIPOCONTRATO_P INT,
                                                IDPLANO_P        INT,
                                                STATUS_P    OUT VARCHAR2,
                                                RETORNO_P   OUT VARCHAR2) IS
                                              
BEGIN

      PCK_EMP_REGRA_ELEGIBILIDADE_R.PR_REGRA_25208( IDMUTUARIO_P,
                                                    -1,
                                                    IDTIPOCONTRATO_P,
                                                    1,
                                                    IDMUTUARIO_P,
                                                    IDPLANO_P,
                                                    STATUS_P,
                                                    RETORNO_P); 


END PR_EMP_REGRA_25208;
/
