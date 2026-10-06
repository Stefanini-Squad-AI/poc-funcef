CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25662( IDTITULAR_P INT,
												SITFUNDACAO_P VARCHAR2,
												IDSITPART_P INT,
												IDPATRO_P  INT,
												IDTIPOCONTRATO_P INT,
												IDOPERACAO_P     INT,
												IDPLANO_P        INT,
												IDPLANOCONTABIL_P INT,
												EXCEPCIONAL_P INT,
												FLGINTERNET_P INT,
												IDCALCULO_P      int,      //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
											    USUARIO_P        VARCHAR2, //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL                                          
                                                RESULTADO_P OUT VARCHAR2,
												RETORNO_P OUT VARCHAR2) IS
                                                
                                                

BEGIN

PCK_EMP_REGRA_ELEGIBILIDADE_R.PR_REGRA_25662 ( IDTITULAR_P,
											   SITFUNDACAO_P,
											   IDSITPART_P,
											   IDPATRO_P,
											   IDTIPOCONTRATO_P,
											   IDOPERACAO_P,
											   IDPLANO_P,
											   IDPLANOCONTABIL_P,
											   EXCEPCIONAL_P,
											   FLGINTERNET_P,
											   IDCALCULO_P,
											   USUARIO_P, 
											   RESULTADO_P,
											   RETORNO_P);                                                                 

END PR_EMP_REGRA_25662;
/
