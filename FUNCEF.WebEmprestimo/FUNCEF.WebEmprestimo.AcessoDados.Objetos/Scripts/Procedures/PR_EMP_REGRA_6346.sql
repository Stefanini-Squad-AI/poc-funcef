CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_6346( IDMUTUARIO_P     INT,
                                               IDTIPOCONTRATO_P INT,
                                               STATUS_P    OUT VARCHAR2,
                                               RETORNO_P   OUT VARCHAR2) IS
                                              
BEGIN

     PCK_EMP_REGRA_RETORNOFIXO_R.PR_REGRA_6346( IDMUTUARIO_P,
                                                NULL,
                                                IDTIPOCONTRATO_P,
                                                1,
                                                STATUS_P,
                                                RETORNO_P); 


END PR_EMP_REGRA_6346;
/
