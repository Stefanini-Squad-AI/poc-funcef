CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_6485( IDMUTUARIO_P     INT,
                                               IDTIPOCONTRATO_P INT,
                                               RESULTADO_P    OUT NUMBER,
                                               RETORNO_P      OUT VARCHAR2) IS
                                              
BEGIN

     PCK_EMP_REGRA_RESERVA_R.PR_REGRA_6485( IDMUTUARIO_P,
                                             NULL,
                                             IDTIPOCONTRATO_P,
                                             1,
                                             RESULTADO_P,
                                             RETORNO_P); 


END PR_EMP_REGRA_6485;
/
