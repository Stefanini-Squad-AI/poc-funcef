CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_24800( IDMUTUARIO_P     INT,
                                                IDTIPOCONTRATO_P INT,
                                                DATAREFERENCIA_P DATE,
                                                IDCALCULO_P      int,      //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
											    USUARIO_P        VARCHAR2, //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL                                          
                                                RESULTADO_P    OUT NUMBER,
                                                RETORNO_P      OUT VARCHAR2) IS
                                              
BEGIN

     PCK_EMP_REGRA_TAXAJUROS_R.PR_REGRA_24800( IDMUTUARIO_P,
                                              NULL,
                                              IDTIPOCONTRATO_P,
                                              1,
                                              DATAREFERENCIA_P,
                                              IDCALCULO_P,
											  USUARIO_P,
                                              RESULTADO_P,
                                              RETORNO_P); 


END PR_EMP_REGRA_24800;
/
