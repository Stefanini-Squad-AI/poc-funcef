CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25730( IDMUTUARIO_P  INT,
											  	IDTITULAR_P        INT, // Xavier SOL 171546
                                                IDTIPOCONTRATO_P INT,
                                                EXCEPCIONAL_P    INT,
                                                DATAASSINATURA_P DATE,
                                                IDCALCULO_P      int,      //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
											    USUARIO_P        VARCHAR2, //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL                                          
                                                RESULTADO_P    OUT NUMBER,
                                                RETORNO_P      OUT VARCHAR2) IS
                                              
BEGIN

     PCK_EMP_REGRA_PRAZOCONTRATO_R.PR_REGRA_25730( IDMUTUARIO_P,
                                                   IDTITULAR_P,  // Xavier SOL 171546
                                                   IDTIPOCONTRATO_P,
                                                   1,
                                                   IDMUTUARIO_P,
                                                   EXCEPCIONAL_P,
                                                   DATAASSINATURA_P,
                                                   IDCALCULO_P,
												   USUARIO_P,
                                                   RESULTADO_P,
                                                   RETORNO_P); 


END PR_EMP_REGRA_25730;
/
