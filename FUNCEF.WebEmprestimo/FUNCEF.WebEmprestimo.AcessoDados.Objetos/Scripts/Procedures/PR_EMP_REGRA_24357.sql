create or replace procedure CM.PR_EMP_REGRA_24357( IDMUTUARIO_P NUMBER,
                                                   IDCONTRATO_P NUMBER,
                                                   IDTIPOCONTRATO_P INT,
                                                   IDOPERACAO_P INT,
                                                   RESULTADO_P OUT NUMBER,
                                                   RETORNO_P OUT VARCHAR2 ) is
begin

  PCK_EMP_REGRA_ITEMCONCESSAO_R.PR_REGRA_24357( IDMUTUARIO_P,
                                                NVL(IDCONTRATO_P,-1),
                                                IDTIPOCONTRATO_P,
                                                IDOPERACAO_P,
                                                RESULTADO_P,
                                                RETORNO_P);
  
end PR_EMP_REGRA_24357;
/
