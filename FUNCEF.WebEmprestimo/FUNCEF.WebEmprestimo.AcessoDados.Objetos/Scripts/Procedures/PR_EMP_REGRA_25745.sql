CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25745(  IDMUTUARIO_P      INT,
                                                 IDCONTRATO_P      NUMBER,
                                                 IDOPERACAO_P      INT,
                                                 IDTIPOCONTRATO_P  INT,
                                                 DATACREDITO_P     DATE,
                                                 DATAPRIMEIRAPARCELA_P DATE,
                                                 DATAASSINATURA_P      DATE,
                                                 RESULTADO_P       OUT NUMBER,
                                                 RETORNO_P         OUT VARCHAR2) IS

BEGIN


PCK_EMP_REGRA_ITEMCONCESSAO_R.PR_REGRA_25745 ( IDMUTUARIO_P,
                                               NVL(IDCONTRATO_P,-1),
                                               IDTIPOCONTRATO_P,
                                               IDOPERACAO_P,
                                               DATACREDITO_P,
                                               DATAPRIMEIRAPARCELA_P,
                                               DATAASSINATURA_P,
                                               RESULTADO_P,
                                               RETORNO_P);

 
end PR_EMP_REGRA_25745;
/
