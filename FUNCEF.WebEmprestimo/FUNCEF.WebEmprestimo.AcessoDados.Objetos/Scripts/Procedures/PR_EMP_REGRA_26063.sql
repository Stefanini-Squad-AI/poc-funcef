CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_26063( IDMUTUARIO_P         NUMBER,
                                                IDTITULAR_P          INT, // alteração solicitada conforme e-mail 
                                                IDTIPOCONTRATO_P     INT,
                                                IDOPERACAO_P         INT,
                                                IDTIPOEMPRESTIMO_P   INT,
                                                IDPLANO_P            INT,
                                                IDCONTRATOAQUITAR_P  VARCHAR2,
                                                NUMPARCELAS_P        INT,
                                                SALDODEVEDOR_P       NUMBER,
                                                TAXAJUROS_P          NUMBER,
                                                VALORMARGEM_P        NUMBER,
                                                QTDMESES_P           INT,
                                                DATACREDITO_P        DATE,
                                                VALORSOLICITADO_P    NUMBER,
                                                EXCEPCIONAL_P        INT,
                                                IDCALCULO_P      int,      //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
											    USUARIO_P        VARCHAR2, //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL                                          
                                                RESULTADO_P      OUT NUMBER,
                                                RETORNO_P        OUT VARCHAR2) IS
BEGIN

PCK_EMP_REGRA_VLMAXIMO_R.PR_REGRA_26063 ( IDMUTUARIO_P,
                                         IDTITULAR_P, // alteração solicitada conforme e-mail 
                                         IDTIPOCONTRATO_P,
                                         IDOPERACAO_P,
                                         IDMUTUARIO_P,
                                         IDTIPOEMPRESTIMO_P,
                                         IDPLANO_P,
                                         EXCEPCIONAL_P,
                                         IDCONTRATOAQUITAR_P,
                                         NUMPARCELAS_P,
                                         DATACREDITO_P,
                                         QTDMESES_P,
                                         SALDODEVEDOR_P,
                                         VALORMARGEM_P,
                                         TAXAJUROS_P,
                                         VALORSOLICITADO_P,
                                         IDCALCULO_P,
										 USUARIO_P,
                                         RESULTADO_P,
                                         RETORNO_P);

END PR_EMP_REGRA_26063;
/
