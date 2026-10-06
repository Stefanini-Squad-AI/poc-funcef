CREATE OR REPLACE PROCEDURE cm.PR_EMP_REGRA_25789(IDPESSOA_P NUMBER,
                                                  IDTITULAR_P NUMBER,
                                                  IDTIPOCONTRATO_P INT,
                                                  IDOPERACAO_P     INT,
                                                  DATAATUALIZA_P    DATE,
                                                  IDTIPOEMPRESTIMO_P INT,
                                                  IDCALCULO_P  PLS_INTEGER,
                                                  USUARIO_P   VARCHAR2,
                                                  RESULTADO_P OUT VARCHAR2,
                                                  RETORNO_P OUT VARCHAR2) IS

BEGIN

PCK_EMP_REGRA_TIPOCONTRATO_R.PR_REGRA_25789(IDPESSOA_P,
                                            IDTITULAR_P,
                                            IDTIPOCONTRATO_P,
                                            IDOPERACAO_P,
                                            IDCALCULO_P,
                                            USUARIO_P,
                                            RESULTADO_P,
                                            RETORNO_P);

END PR_EMP_REGRA_25789;