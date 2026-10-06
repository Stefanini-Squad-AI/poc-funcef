CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_6193( IDCONTRATO_P NUMBER,
                                                DATAAMORTIZACAO_P DATE,
                                                DATAEVENTO_P DATE,
                                                NOVOPRAZO_P INT,
                                                RESULTADO_P OUT NUMBER,
                                                RETORNO_P   OUT VARCHAR2) IS              


IDMUTUARIO_P NUMBER;
IDTIPOCONTRATO_P INT;
DATACREDITO_P    DATE;
                                               
BEGIN

SELECT C.IDBENEF, C.IDTIPOCONTREMPTMO, C.DATACREDITO INTO
       IDMUTUARIO_P, IDTIPOCONTRATO_P, DATACREDITO_P
FROM CONTRATOEMPTMO C WHERE C.IDCONTRATOEMPTMO = IDCONTRATO_P;

  
PCK_EMP_REGRA_AMORTIZACAO_R.PR_REGRA_6193( IDMUTUARIO_P,
                                           IDCONTRATO_P,   
                                           IDTIPOCONTRATO_P,
                                           5,
                                           DATAAMORTIZACAO_P,
                                           DATACREDITO_P,
                                           DATAEVENTO_P,
                                           NOVOPRAZO_P,
                                           RESULTADO_P,
                                           RETORNO_P);

END PR_EMP_REGRA_6193;
/
