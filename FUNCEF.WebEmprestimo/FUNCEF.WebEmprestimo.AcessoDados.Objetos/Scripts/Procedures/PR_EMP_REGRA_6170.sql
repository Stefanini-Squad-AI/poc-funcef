CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_6170(IDMUTUARIO_P     int,
											  IDTITULAR_P      INT,	// xavier alterar a assinatura da regra 6170 conforme e-mail
                                              IDTIPOCONTRATO_P int,
                                              IDPLANO_P    int, // xavier alterar a assinatura da regra 6170 conforme e-mail
											  SITFUNDACAO_P    varchar2, // xavier alterar a assinatura da regra 6170 conforme e-mail
                                              IDPATRO_P        int, // xavier alterar a assinatura da regra 6170 conforme e-mail
                                              DATAASSINATURA_P date,
                                              EXCEPCIONAL_P    int,   
                                              IDCALCULO_P      int,      //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
											  USUARIO_P        VARCHAR2, //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL                                          
                                              DATACREDITO_P    out date, 
                                              RETORNO_P        out varchar2) is                                                                                                                                          
                                              
                                              
      
      PCK_EMP_REGRA_DATACREDITO_R.PR_REGRA_6170( IDMUTUARIO_P,   												 
                                                 IDTIPOCONTRATO_P,                                                 
                                                 1,
                                                 null,
                                                 DATAASSINATURA_P,   
                                                 TO_NUMBER(TO_CHAR(SYSDATE,'HH24mi')),  
                                                 null,                                                                                                                                                   
                                                 EXCEPCIONAL_P,
                                                 IDCALCULO_P,
                                                 USUARIO_P,                 
                                                 DATACREDITO_P,
                                                 RETORNO_P);
                                                   
END PR_EMP_REGRA_6170;
/
