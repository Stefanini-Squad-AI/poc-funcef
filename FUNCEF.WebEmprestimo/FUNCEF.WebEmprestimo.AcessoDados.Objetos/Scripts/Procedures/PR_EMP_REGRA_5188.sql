CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_5188( IDCONTRATO_P NUMBER,
                                                RESULTADO_P OUT NUMBER,
                                                RETORNO_P   OUT VARCHAR2) IS              


IDMUTUARIO_P NUMBER;
IDTIPOCONTRATO_P INT;
                                               
BEGIN

SELECT C.IDBENEF, C.IDTIPOCONTREMPTMO INTO
       IDMUTUARIO_P, IDTIPOCONTRATO_P
FROM CONTRATOEMPTMO C WHERE C.IDCONTRATOEMPTMO = IDCONTRATO_P;

  
PCK_EMP_REGRA_AMORTIZACAO_R.PR_REGRA_5188( IDMUTUARIO_P,
                                            IDCONTRATO_P,   
                                            IDTIPOCONTRATO_P,
                                            5,
                                            RESULTADO_P,
                                            RETORNO_P);

END PR_EMP_REGRA_5188;
/