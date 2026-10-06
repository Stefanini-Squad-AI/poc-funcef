CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25234( MATRICULA_P       VARCHAR2,
                                                IDCONTRATO_P      NUMBER,
                                                IDTIPOCONTRATO_P  NUMBER,
                                                DATASOLICITACAO_P DATE,
                                                SALARIOBASE_P     NUMBER,
                                                NUMPARCELAS_P     INT,
                                                IDOPERACAO_P      INT,
                                                RESULTADO_P   OUT NUMBER,
                                                RETORNO_P     OUT VARCHAR2) IS

IDPESSJUR_P       NUMBER;
IDMUTUARIO_P      NUMBER;                                                   
NUMDEPIRRF_P      INT;       
                                          
                                                  
BEGIN

SELECT ELP.IDPESSJUR, DEP.IDPESSOA, NVL(PEF.NUMDEPIRRF,0) AS NUMDEPIRRF INTO
       IDPESSJUR_P, IDMUTUARIO_P, NUMDEPIRRF_P
FROM   ELEGPATRO ELP, PESSOAFISICA PEF, DEPENTIT DEP, PARTPREVPLAN PPP  
WHERE  PEF.IDPESSOA (+) = ELP.IDPESSOA
AND    DEP.IDTITULAR = ELP.IDPESSOA
AND    ELP.IDPESSOA = PPP.IDPESSOA
AND    ELP.IDPESSJUR = PPP.IDPESSJUR
AND    PPP.FLGDESATIVADO   = 0
AND    DEP.MATRICULA = MATRICULA_P;

PCK_EMP_REGRA_MARGEM_R.PR_REGRA_25234 ( IDMUTUARIO_P,
                                        NVL(IDCONTRATO_P,-1),
                                        IDTIPOCONTRATO_P,
                                        IDOPERACAO_P,
                                        IDPESSJUR_P,
                                        IDMUTUARIO_P,
                                        DATASOLICITACAO_P,
                                        SALARIOBASE_P,
                                        NUMPARCELAS_P,                   
                                        NUMDEPIRRF_P,
                                        RESULTADO_P,
                                        RETORNO_P);
  
END PR_EMP_REGRA_25234;
/
