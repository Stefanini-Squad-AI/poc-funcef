CREATE OR REPLACE PROCEDURE cm.PR_EMP_REGRA_24823( IDCONTRATO_P NUMBER,
                                                   IDTIPOCONTRATO_P NUMBER,
                                                   IDMUTUARIO_P  NUMBER,
                                                   IDTITULAR_P NUMBER,
                                                   IDPATRO_P NUMBER,
                                                   IDOPERACAO_P  INT,
                                                   IDTIPOSUSPENSAO_P NUMBER,
                                                   DATAINICIOSUSP_P DATE,
                                                   EXCEPCIONAL_P     INT,
                                                   QTDMESES_P        INT,
                                                   FLGINTERNO_P   VARCHAR2,
                                                   IDCALCULO_P    PLS_INTEGER,
                                                   USUARIO_P      VARCHAR2,
                                                   RESULTADO_P OUT DATE,
                                                   RETORNO_P   OUT VARCHAR2) IS

BEGIN

PCK_EMP_REGRA_SUSPENSAO_R.PR_REGRA_24823( IDMUTUARIO_P,
                                          IDTITULAR_P,
                                          IDPATRO_P,
                                          IDCONTRATO_P,
                                          IDTIPOCONTRATO_P,
                                          IDOPERACAO_P,
                                          IDTIPOSUSPENSAO_P,
                                          DATAINICIOSUSP_P,
                                          EXCEPCIONAL_P,
                                          FLGINTERNO_P,
                                          QTDMESES_P,
                                          IDCALCULO_P,
                                          USUARIO_P,
                                          RESULTADO_P,
                                          RETORNO_P);

END PR_EMP_REGRA_24823;
