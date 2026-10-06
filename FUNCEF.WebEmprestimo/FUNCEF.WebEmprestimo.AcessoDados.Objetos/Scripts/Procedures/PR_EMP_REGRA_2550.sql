CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_2550( IDMUTUARIO_P     INT,
                                               IDTIPOCONTRATO_P INT,
                                               DATAREFERENCIA_P DATE,
                                               NUMPARCELAS_P    INT,
                                               RESULTADO_P    OUT NUMBER,
                                               RETORNO_P      OUT VARCHAR2) IS
                                              
BEGIN

     PCK_EMP_REGRA_TAXAJUROS_R.PR_REGRA_2550( IDMUTUARIO_P,
                                              NULL,
                                              IDTIPOCONTRATO_P,
                                              1,
                                              DATAREFERENCIA_P,
                                              NUMPARCELAS_P,
                                              RESULTADO_P,
                                              RETORNO_P); 


END PR_EMP_REGRA_2550;
/
