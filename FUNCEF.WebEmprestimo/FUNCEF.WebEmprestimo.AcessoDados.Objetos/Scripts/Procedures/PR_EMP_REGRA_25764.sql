CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25764( IDMUTUARIO_P         NUMBER,
                                                IDTIPOCONTRATO_P     INT,
                                                DATAASSINATURA_P     DATE,
                                                RESULTADO_P      OUT NUMBER,
                                                RETORNO_P        OUT VARCHAR2) IS

BEGIN

PCK_EMP_REGRA_VLMAXIMO_R.PR_REGRA_25764( IDMUTUARIO_P,
                                         -1,
                                         IDTIPOCONTRATO_P,
                                         1,
                                         DATAASSINATURA_P,
                                         RESULTADO_P,
                                         RETORNO_P);

END PR_EMP_REGRA_25764;
/
