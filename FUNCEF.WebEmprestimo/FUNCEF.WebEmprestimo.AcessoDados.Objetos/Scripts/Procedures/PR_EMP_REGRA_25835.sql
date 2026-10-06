CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25835( IDMUTUARIO_P       NUMBER, 
												IDTITULAR_P        INT,	// alterado conforme e-mail											
                                                IDTIPOCONTRATO_P   INT,
                                                IDTIPOEMPRESTIMO_P INT,
                                                IDPLANO_P          INT,
                                                SITFUNDACAO_P      VARCHAR2,
                                                SALARIOBASE_P      NUMBER,
                                                IDCALCULO_P      int,      //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
											    USUARIO_P        VARCHAR2, //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL                                          
                                                RESULTADO_P    OUT NUMBER,
                                                RETORNO_P      OUT VARCHAR2) IS
BEGIN

PCK_EMP_REGRA_VLMAXIMO_R.PR_REGRA_25835( IDMUTUARIO_P,
                                         IDTITULAR_P, // alterado conforme e-mail
                                         IDTIPOEMPRESTIMO_P,
                                         1,
                                         IDTIPOEMPRESTIMO_P,
                                         IDPLANO_P,
                                         SITFUNDACAO_P,
                                         SALARIOBASE_P,
                                         NULL,
                                         IDCALCULO_P,
										 USUARIO_P,
                                         RESULTADO_P,
                                         RETORNO_P);
  
END PR_EMP_REGRA_25835;
/
