CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25837( IDMUTUARIO_P NUMBER,
                                                IDTITULAR_P INT, // alteração solicitada conforme e-mail 
                                                IDTIPOCONTRATO_P INT,
                                                IDOPERACAO_P     INT,
                                                DATACREDITO_P    DATE,
                                                IDCALCULO_P      int,      //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
											    USUARIO_P        VARCHAR2, //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL                                          
                                                RESULTADO_P OUT DATE,
                                                RETORNO_P OUT VARCHAR2) IS

BEGIN

PCK_EMP_REGRA_DATAPARCELA_R.PR_REGRA_25837 ( IDMUTUARIO_P,
                                             IDTITULAR_P, // alteração solicitada conforme e-mail 
                                             IDTIPOCONTRATO_P,
                                             IDOPERACAO_P,
                                             DATACREDITO_P,
                                             IDCALCULO_P,
										     USUARIO_P,
                                             RESULTADO_P,
                                             RETORNO_P);                                                                 

END PR_EMP_REGRA_25837;
/
