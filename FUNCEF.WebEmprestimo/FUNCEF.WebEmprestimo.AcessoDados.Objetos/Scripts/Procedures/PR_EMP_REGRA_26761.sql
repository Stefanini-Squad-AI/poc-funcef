CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_26761(IDCONTRATO_P NUMBER,
                                                  IDMUTUARIO_P INT,
                                                  IDTITULAR_P  INT,
                                                  IDTIPOCONTRATO_P INT,
                                                  TAXAJUROS_P   NUMBER,
                                                  IDITEMEMPTMO_P INT,
                                                  IDOPERACAO_P INT,
                                                  DATAQUITACAO_P DATE,
                                                  IDCALCULO_P     PLS_INTEGER,
                                                  USUARIO_P       VARCHAR2,
                                                  RESULTADO_P OUT NUMBER,
                                                  RETORNO_P   OUT VARCHAR2)
 IS

BEGIN

PCK_EMP_REGRA_ITEMCONCESSAO_R.PR_REGRA_26761(CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_26761(IDCONTRATO_P,
                                                  IDMUTUARIO_P,
                                                  IDTITULAR_P,
                                                  IDTIPOCONTRATO_P,
                                                  TAXAJUROS_P,
                                                  IDITEMEMPTMO_P,
                                                  IDOPERACAO_P,
                                                  DATAQUITACAO_P,
                                                  IDCALCULO_P,
                                                  USUARIO_P,
                                                  RESULTADO_P,
                                                  RETORNO_P
);
END PR_EMP_REGRA_26761;

