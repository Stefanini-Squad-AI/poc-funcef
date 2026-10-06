CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25522( MATRICULA_P VARCHAR2,
                                                IDMUTUARIO_P NUMBER,
                                                IDCONTRATO_P NUMBER,
                                                IDTIPOCONTRATO_P INT,
                                                IDOPERACAO_P     INT,
                                                DATACREDITO_P    DATE,
                                                DATAINICIOANT_P DATE,
                                                DATAINICIO_P    DATE,
                                                EXCEPCIONAL_P   INT,
                                                IDTIPOSUSPENSAO_P INT,
                                                NUMPARCELASABERTO_P INT,
                                                RESULTADO_P OUT DATE,
                                                RETORNO_P OUT VARCHAR2) IS
                                                
IDPESSJUR_P NUMBER;  
FLGINTERNO_P CHAR(2);                                              

BEGIN

SELECT ELP.IDPESSJUR, SIP.FLGINTERNO INTO IDPESSJUR_P, FLGINTERNO_P  
FROM   ELEGPATRO ELP, SITPART SIP, PARTPREVPLAN PPP, DEPENTIT DEP
WHERE  DEP.MATRICULA = MATRICULA_P
AND    DEP.IDTITULAR = ELP.IDPESSOA 
AND    ELP.IDPESSOA = PPP.IDPESSOA
AND    ELP.IDPESSJUR = PPP.IDPESSJUR
AND    PPP.IDSITPART = SIP.IDSITPART
AND    PPP.FLGDESATIVADO   = 0;  

PCK_EMP_REGRA_SUSPENSAO_R.PR_REGRA_25522 ( IDMUTUARIO_P,
                                           NVL(IDCONTRATO_P,-1),
                                           IDTIPOCONTRATO_P,
                                           IDOPERACAO_P,
                                           IDMUTUARIO_P,
                                           IDPESSJUR_P,
                                           DATACREDITO_P,
                                           DATAINICIOANT_P,
                                           DATAINICIO_P,
                                           EXCEPCIONAL_P,
                                           IDTIPOSUSPENSAO_P,
                                           NUMPARCELASABERTO_P,
                                           FLGINTERNO_P,
                                           RESULTADO_P,
                                           RETORNO_P);                                                                 

END PR_EMP_REGRA_25522;
/
