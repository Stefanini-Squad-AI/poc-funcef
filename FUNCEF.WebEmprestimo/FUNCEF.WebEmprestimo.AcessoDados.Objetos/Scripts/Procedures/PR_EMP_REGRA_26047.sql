CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_26047( IDMUTUARIO_P NUMBER,
                                                IDCONTRATO_P NUMBER,
                                                IDTIPOCONTRATO_P INT,
                                                IDOPERACAO_P INT,
                                                DATACREDITO_P DATE,
                                                IDCONTRATOAQUITAR_P  VARCHAR2,
                                                IDTIPOSUSPENSAO_P INT,
                                                FLGQUITA_P INT,
                                                RESULTADO_P OUT NUMBER,
                                                RETORNO_P   OUT VARCHAR2) IS


BEGIN

PCK_EMP_REGRA_SUSPENSAO_R.PR_REGRA_26047( IDMUTUARIO_P,
                                          NVL(IDCONTRATO_P,-1),
                                          IDTIPOCONTRATO_P,
                                          IDOPERACAO_P,
                                          IDMUTUARIO_P,
                                          DATACREDITO_P,
                                          FLGQUITA_P,
                                          NVL(IDCONTRATOAQUITAR_P,'-1'),
                                          IDTIPOSUSPENSAO_P,
                                          RESULTADO_P,
                                          RETORNO_P);

END PR_EMP_REGRA_26047;
/
