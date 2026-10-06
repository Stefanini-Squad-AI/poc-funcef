CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25207( IDMUTUARIO_P     INT,
                                                IDTIPOCONTRATO_P INT,
                                                IDCONTRATO_P     INT, // SOL 151964 Fernando Xavier
                                                RESULTADO_P    OUT NUMBER,
                                                RETORNO_P      OUT VARCHAR2) IS
                                              
BEGIN

     PCK_EMP_REGRA_SALBASE_R.PR_REGRA_25207( IDMUTUARIO_P,
                                             IDCONTRATO_P, // SOL 151964 Fernando Xavier,
                                             IDTIPOCONTRATO_P,
                                             1,
                                             IDMUTUARIO_P,
                                             RESULTADO_P,
                                             RETORNO_P); 


END PR_EMP_REGRA_25207;
/
