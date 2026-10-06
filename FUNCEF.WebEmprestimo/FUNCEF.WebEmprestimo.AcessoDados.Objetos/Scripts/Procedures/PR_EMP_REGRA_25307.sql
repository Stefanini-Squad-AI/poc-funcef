CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25307(   IDMUTUARIO_P INT,
													  IDCONTRATO_P NUMBER,             
													  IDTIPOCONTRATO_P INT,
													  IDOPERACAO_P     INT,
													  IDCONTRATOAQUITAR_P VARCHAR2,
													  DATACREDITO_P DATE,
													  VALORMAXIMO_P NUMBER,
													  VALORMARGEM_P NUMBER,
													  TAXAJUROS_P   NUMBER,
													  NUMPARCELAS_P  INT,
													  VALORSOLICITADO_P NUMBER,
													  FINANCIAMENTO_P   INT,
													  EXCEPCIONAL_P     INT,
													  RESULTADO_P   OUT NUMBER,
													  RETORNO_P     OUT VARCHAR2) IS
BEGIN

PCK_EMP_REGRA_ITEMCONCESSAO_R.PR_REGRA_25307( IDMUTUARIO_P,
                                              NVL(IDCONTRATO_P,-1),
                                              IDTIPOCONTRATO_P,
                                              IDOPERACAO_P,
                                              IDCONTRATOAQUITAR_P,
                                              DATACREDITO_P,
                                              VALORMAXIMO_P,
                                              VALORMARGEM_P,
                                              TAXAJUROS_P,
                                              NUMPARCELAS_P,
                                              VALORSOLICITADO_P,
                                              FINANCIAMENTO_P,
                                              EXCEPCIONAL_P,
                                              RESULTADO_P,
                                              RETORNO_P);
END PR_EMP_REGRA_25307;
/
