CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_21701( IDMUTUARIO_P      NUMBER,
                                                IDCONTRATO_P      NUMBER,
                                                IDTIPOCONTRATO_P  INT,
                                                IDOPERACAO_P      INT,
                                                IDCONTRATOAQUITAR_P VARCHAR2,
                                                DATACREDITO_P     DATE,
                                                DATAREFERENCIA_P  DATE,
                                                NUMPARCELAS_P     INT,
                                                PARCELAATUAL_P    INT,
                                                TAXAJUROS_P       NUMBER,
                                                SALDODEVEDOR_P    NUMBER,     
                                                RESULTADO_P   OUT NUMBER,
                                                RETORNO_P     OUT VARCHAR2) IS


BEGIN


 PCK_EMP_REGRA_ITEMCONCESSAO_R.PR_REGRA_21701( IDMUTUARIO_P,
                                               NVL(IDCONTRATO_P,-1),
                                               IDTIPOCONTRATO_P,
                                               IDOPERACAO_P,
                                               IDCONTRATOAQUITAR_P,
                                               DATACREDITO_P,
                                               DATAREFERENCIA_P,
                                               NUMPARCELAS_P,
                                               PARCELAATUAL_P,
                                               TAXAJUROS_P,
                                               SALDODEVEDOR_P,
                                               RESULTADO_P,
                                               RETORNO_P);

END PR_EMP_REGRA_21701;
/
