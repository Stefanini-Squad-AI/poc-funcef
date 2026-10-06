CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25478( IDMUTUARIO_P NUMBER,
                                               IDCONTRATO_P NUMBER,
                                               IDTIPOCONTRATO_P INT,
                                               IDOPERACAO_P     INT,
                                               IDITEMEMPTMO_P   INT,
                                               DATAEFETIVA_P    DATE,
                                               DATAPREVISTA_P    DATE,
                                               DATAEVENTO_P      DATE,
                                               IDCALCULO_P      int,      //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
											   USUARIO_P        VARCHAR2, //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL                                          
                                               RESULTADO_P OUT NUMBER,
                                               RETORNO_P OUT VARCHAR2) IS
BEGIN

PCK_EMP_REGRA_MARCAQUITADO_R.PR_REGRA_25478 ( IDMUTUARIO_P,
                                             NVL(IDCONTRATO_P,-1),
                                             IDTIPOCONTRATO_P,
                                             IDOPERACAO_P,
                                             IDITEMEMPTMO_P,
                                             DATAEFETIVA_P,
                                             DATAPREVISTA_P,
                                             DATAEVENTO_P,
                                             IDCALCULO_P,
										     USUARIO_P,
                                             RESULTADO_P,
                                             RETORNO_P);                                                                 

  
END PR_EMP_REGRA_25478;
/
