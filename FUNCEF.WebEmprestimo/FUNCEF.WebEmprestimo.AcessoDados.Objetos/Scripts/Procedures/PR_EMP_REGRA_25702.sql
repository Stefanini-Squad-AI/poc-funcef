CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25702( IDMUTUARIO_P NUMBER,
                                                IDCONTRATO_P NUMBER,
                                                IDTIPOCONTRATO_P INT,
                                                IDOPERACAO_P     INT,
                                                DATACREDITO_P    DATE,
                                                DATAPRIMEIRAPARCELA_P DATE,
                                                TAXAJUROS_P           NUMBER,           
                                                VALORSOLICITADO_P     NUMBER,
                                                SALDOANTERIOR_P       NUMBER,
                                                NUMPARCELAS_P         INT,
                                                RESULTADO_P OUT NUMBER,
                                                RETORNO_P OUT VARCHAR2) IS

BEGIN

PCK_EMP_REGRA_ITEMCONCESSAO_R.PR_REGRA_25702 ( IDMUTUARIO_P,
                                               NVL(IDCONTRATO_P,-1),
                                               IDTIPOCONTRATO_P,
                                               IDOPERACAO_P,
                                               DATACREDITO_P,
                                               DATAPRIMEIRAPARCELA_P,
                                               --TAXAJUROS_P,
                                               VALORSOLICITADO_P, 
                                               --SALDOANTERIOR_P,
                                               --NUMPARCELAS_P,
                                               RESULTADO_P,
                                               RETORNO_P);                                                                 

END PR_EMP_REGRA_25702;
/
