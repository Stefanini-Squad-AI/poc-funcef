/* assinatura da regra alterada conforme e-mail nova */
CREATE OR REPLACE PROCEDURE cm.PR_EMP_REGRA_26116(IDMUTUARIO_P INT,
                                                  IDTITULAR_P INT,
                                                  SITFUNDACAO_P VARCHAR2,
                                                  IDPATRO_P INT,
                                                  IDPLANOPREV_P INT,
                                                  IDTIPOCONTRATO_P INT,
                                                  IDOPERACAO_P     INT,
                                                  DATASOLICITACAO_P  DATE,
                                                  IDCALCULO_P      int,      //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
											      USUARIO_P        VARCHAR2, //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL                                          
                                                  RESULTADO_P OUT NUMBER,
                                                  RETORNO_P OUT VARCHAR2) IS


BEGIN

PCK_EMP_REGRA_SALBASE_R.PR_REGRA_26116 (IDMUTUARIO_P,
                                        IDTITULAR_P,
                                        SITFUNDACAO_P,
                                        IDPLANOPREV_P,
                                        IDTIPOCONTRATO_P,
                                        IDOPERACAO_P,
                                        IDPATRO_P,
                                        DATASOLICITACAO_P,
                                        IDCALCULO_P,
                                        USUARIO_P,  
                                        RESULTADO_P,
                                        RETORNO_P);


END PR_EMP_REGRA_26116;

// assinatura da regra alterada conforme e-mail antiga
/*CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_26116( MATRICULA_P VARCHAR2,
                                               IDCONTRATO_P NUMBER,
                                               IDTIPOCONTRATO_P INT,
                                               IDOPERACAO_P     INT,
                                               DATASOLICITACAO_P  DATE,
                                               RESULTADO_P OUT NUMBER,
                                               RETORNO_P OUT VARCHAR2) IS

IDPESSJUR_P       NUMBER;
IDMUTUARIO_P      NUMBER;                                                 
                                               
BEGIN


SELECT ELP.IDPESSJUR, DEP.IDPESSOA INTO
       IDPESSJUR_P, IDMUTUARIO_P
FROM   ELEGPATRO ELP, DEPENTIT DEP, PARTPREVPLAN PPP
WHERE  DEP.IDTITULAR = ELP.IDPESSOA
AND    ELP.IDPESSOA = PPP.IDPESSOA
AND    ELP.IDPESSJUR = PPP.IDPESSJUR
AND    PPP.FLGDESATIVADO   = 0
AND    DEP.MATRICULA = MATRICULA_P;


PCK_EMP_REGRA_SALBASE_R.PR_REGRA_26116 ( IDMUTUARIO_P,
                                         NVL(IDCONTRATO_P,-1),
                                         IDTIPOCONTRATO_P,
                                         IDOPERACAO_P,
                                         IDPESSJUR_P,
                                         IDMUTUARIO_P,
                                         DATASOLICITACAO_P,
                                         RESULTADO_P,
                                         RETORNO_P);                                                                 

  
END PR_EMP_REGRA_26116;
/
*/