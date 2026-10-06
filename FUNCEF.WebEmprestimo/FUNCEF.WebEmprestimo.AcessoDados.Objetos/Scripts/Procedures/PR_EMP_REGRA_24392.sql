CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_24392( IDCONTRATO_P NUMBER,
                                                DATAAMORTIZACAO_P DATE,
                                                VALORAMORTIZACAO_P NUMBER,
                                                NOVOPRAZO_P        INT,          
                                                RESULTADO_P OUT NUMBER,
                                                RETORNO_P   OUT VARCHAR2) IS              


IDMUTUARIO_P NUMBER;
IDTIPOCONTRATO_P INT;
                                               
BEGIN

SELECT C.IDBENEF, C.IDTIPOCONTREMPTMO INTO
       IDMUTUARIO_P, IDTIPOCONTRATO_P
FROM CONTRATOEMPTMO C WHERE C.IDCONTRATOEMPTMO = IDCONTRATO_P;

  
PCK_EMP_REGRA_AMORTIZACAO_R.PR_REGRA_24392( IDMUTUARIO_P,
                                            IDCONTRATO_P,   
                                            IDTIPOCONTRATO_P,
                                            5,
                                            DATAAMORTIZACAO_P,
                                            SYSDATE,
                                            VALORAMORTIZACAO_P,
                                            NOVOPRAZO_P,
                                            RESULTADO_P,
                                            RETORNO_P);

END PR_EMP_REGRA_24392;
/
