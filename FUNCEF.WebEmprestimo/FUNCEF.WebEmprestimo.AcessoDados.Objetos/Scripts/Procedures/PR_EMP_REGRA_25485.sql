CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25485( MATRICULA_P VARCHAR2,
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


PCK_EMP_REGRA_SALBASE_R.PR_REGRA_25485 ( IDMUTUARIO_P,
                                         NVL(IDCONTRATO_P,-1),
                                         IDTIPOCONTRATO_P,
                                         IDOPERACAO_P,
                                         IDPESSJUR_P,
                                         IDMUTUARIO_P,
                                         DATASOLICITACAO_P,
                                         RESULTADO_P,
                                         RETORNO_P);                                                                 

  
END PR_EMP_REGRA_25485;
/
