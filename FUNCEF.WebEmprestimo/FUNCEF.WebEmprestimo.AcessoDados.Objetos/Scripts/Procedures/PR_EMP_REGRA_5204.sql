CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_5204( IDMUTUARIO_P     INT,
                                                IDTIPOCONTRATO_P INT,
                                                EXCEPCIONAL_P    INT,
                                                DATAASSINATURA_P DATE,
                                                RESULTADO_P    OUT NUMBER,
                                                RETORNO_P      OUT VARCHAR2) IS
                                              
BEGIN

     PCK_EMP_REGRA_PRAZOCONTRATO_R.PR_REGRA_5204( IDMUTUARIO_P,
                                                   NULL,
                                                   IDTIPOCONTRATO_P,
                                                   1,
                                                   IDMUTUARIO_P,
                                                   EXCEPCIONAL_P,
                                                   DATAASSINATURA_P,
                                                   RESULTADO_P,
                                                   RETORNO_P); 


END PR_EMP_REGRA_5204;
/
