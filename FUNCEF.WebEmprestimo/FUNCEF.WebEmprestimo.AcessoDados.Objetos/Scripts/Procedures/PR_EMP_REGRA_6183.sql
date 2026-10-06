CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_6183( IDMUTUARIO_P NUMBER,
                                               IDCONTRATO_P NUMBER,
                                               IDTIPOCONTRATO_P INT,
                                               IDOPERACAO_P     INT,
                                               DATACREDITO_P    DATE,
                                               DATAREFERENCIA_P DATE,
                                               DATAATUALIZA_P   DATE,
                                               TAXAJUROS_P      NUMBER,
                                               NUMPARCELAS_P    INT,
                                               SALDODEVEDOR_P   NUMBER,
                                               SALDOANTERIOR_P  NUMBER,
                                               RESULTADO_P OUT NUMBER,
                                               RETORNO_P OUT VARCHAR2) IS
BEGIN

pck_emp_regra_itemconcessao_r.pr_regra_6183( IDMUTUARIO_P,
                                             NVL(IDCONTRATO_P,-1),
                                             IDTIPOCONTRATO_P,
                                             IDOPERACAO_P,
                                             DATACREDITO_P,
                                             DATAREFERENCIA_P,
                                             DATAATUALIZA_P,
                                             TAXAJUROS_P,
                                             NUMPARCELAS_P,
                                             SALDODEVEDOR_P,
                                             SALDODEVEDOR_P,
                                             SALDOANTERIOR_P,
                                             RESULTADO_P,
                                             RETORNO_P);                                                                 

  
END PR_EMP_REGRA_6183;
/
