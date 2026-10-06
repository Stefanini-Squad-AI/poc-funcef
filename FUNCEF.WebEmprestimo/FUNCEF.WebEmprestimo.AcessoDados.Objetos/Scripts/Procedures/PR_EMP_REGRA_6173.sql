CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_6173( IDCONTRATO_P NUMBER,
											      IDOPERACAO_P INT,
                                                  DATAQUITACAO_P DATE,
                                                  RESULTADO_P OUT NUMBER,
                                                  RETORNO_P   OUT VARCHAR2 ) IS

IDMUTUARIO_P NUMBER;
IDTIPOCONTRATO_P INT;

BEGIN


SELECT C.IDBENEF, C.IDTIPOCONTREMPTMO
 INTO  IDMUTUARIO_P, IDTIPOCONTRATO_P
FROM CONTRATOEMPTMO C WHERE C.IDCONTRATOEMPTMO = IDCONTRATO_P;

PCK_EMP_REGRA_ITEMQUITACAO_R.PR_REGRA_6173( IDMUTUARIO_P,
                                            IDCONTRATO_P,
                                            IDTIPOCONTRATO_P,
                                            DATAQUITACAO_P,
                                            IDOPERACAO_P,
                                            RESULTADO_P,
                                            RETORNO_P);

END PR_EMP_REGRA_6173;
/
