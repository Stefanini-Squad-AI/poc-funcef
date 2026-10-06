CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_21711( IDCONTRATO_P NUMBER,
                                                DATAAMORTIZACAO_P DATE,
                                                VALORAMORTIZACAO_P NUMBER,
                                                RESULTADO_P OUT NUMBER,
                                                RETORNO_P   OUT VARCHAR2) IS              


IDMUTUARIO_P NUMBER;
IDTIPOCONTRATO_P INT;
                                               
BEGIN

SELECT C.IDBENEF, C.IDTIPOCONTREMPTMO INTO
       IDMUTUARIO_P, IDTIPOCONTRATO_P
FROM CONTRATOEMPTMO C WHERE C.IDCONTRATOEMPTMO = IDCONTRATO_P;

  
PCK_EMP_REGRA_AMORTIZACAO_R.PR_REGRA_21711( IDMUTUARIO_P,
                                            IDCONTRATO_P,   
                                            IDTIPOCONTRATO_P,
                                            5,
                                            DATAAMORTIZACAO_P,
                                            VALORAMORTIZACAO_P,
                                            RESULTADO_P,
                                            RETORNO_P);

END PR_EMP_REGRA_21711;
/
