CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_22552( IDMUTUARIO_P      NUMBER,
                                                IDCONTRATO_P      NUMBER,
                                                IDTIPOCONTRATO_P  INT,
                                                IDOPERACAO_P      INT,
                                                DATAREFERENCIA_P  DATE,
                                                NUMPARCELAS_P     INT,
                                                SALDODEVEDOR_P    NUMBER,
                                                DATAATUALIZA_P    DATE,
                                                RESULTADO_P   OUT NUMBER,
                                                RETORNO_P     OUT VARCHAR2) IS
BEGIN                                                

 PCK_EMP_REGRA_ITEMCONCESSAO_R.PR_REGRA_22552( IDMUTUARIO_P,
                                               NVL(IDCONTRATO_P,-1),
                                               IDTIPOCONTRATO_P,         
                                               IDOPERACAO_P,
                                               DATAREFERENCIA_P,
                                               NUMPARCELAS_P,
                                               SALDODEVEDOR_P,
                                               DATAATUALIZA_P,
                                               RESULTADO_P,
                                               RETORNO_P);
                                               
END PR_EMP_REGRA_22552;
/
