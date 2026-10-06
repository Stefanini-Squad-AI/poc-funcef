CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25082( IDCONTRATO_P NUMBER,
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

PCK_EMP_REGRA_ITEMQUITACAO_R.PR_REGRA_25082( IDMUTUARIO_P,
                                             IDCONTRATO_P,
                                             IDTIPOCONTRATO_P,
                                             IDOPERACAO_P,
                                             DATAQUITACAO_P,
                                             RESULTADO_P,
                                             RETORNO_P);
                                             
END PR_EMP_REGRA_25082;
/
