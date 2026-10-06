create or replace procedure CM.PR_EMP_REGRA_25209( IDMUTUARIO_P NUMBER,
                                                IDCONTRATO_P NUMBER,
                                                IDTIPOCONTRATO_P INT,
                                                IDOPERACAO_P INT,
                                                DATAASSINATURA_P DATE,
                                                SALDODEVEDOR_P NUMBER,
                                                RESULTADO_P   OUT NUMBER,
                                                RETORNO_P     OUT VARCHAR2) is
begin

  PCK_EMP_REGRA_ITEMCONCESSAO_R.PR_REGRA_25209( IDMUTUARIO_P,
                                                NVL(IDCONTRATO_P,-1),
                                                IDTIPOCONTRATO_P,
                                                IDOPERACAO_P,
                                                DATAASSINATURA_P,
                                                SALDODEVEDOR_P,
                                                RESULTADO_P,
                                                RETORNO_P);       
end PR_EMP_REGRA_25209;
/
