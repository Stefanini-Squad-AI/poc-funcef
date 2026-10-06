CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_24863( IDCONTRATO_P NUMBER,
												IDOPERACAO_P INT,
                                                DATAQUITACAO_P DATE,
                                                VALORPREVISTO_P NUMBER,
                                                RESULTADO_P OUT NUMBER,
                                                RETORNO_P   OUT VARCHAR2 ) IS
                                               
IDMUTUARIO_P INT;
IDTIPOCONTRATO_P INT;
TAXAJUROS_P NUMBER;
                                               
BEGIN
  

SELECT C.IDBENEF, C.IDTIPOCONTREMPTMO, C.TXJUROS 
 INTO  IDMUTUARIO_P, IDTIPOCONTRATO_P, TAXAJUROS_P     
FROM CONTRATOEMPTMO C WHERE C.IDCONTRATOEMPTMO = IDCONTRATO_P;

PCK_EMP_REGRA_ITEMQUITACAO_R.PR_REGRA_24863( IDMUTUARIO_P,
                                             IDCONTRATO_P,
                                             IDTIPOCONTRATO_P,
                                             IDOPERACAO_P,
                                             SYSDATE,
                                             DATAQUITACAO_P,
                                             TAXAJUROS_P,
                                             VALORPREVISTO_P,
                                             RESULTADO_P,
                                             RETORNO_P);
                                             
END PR_EMP_REGRA_24863;
/
