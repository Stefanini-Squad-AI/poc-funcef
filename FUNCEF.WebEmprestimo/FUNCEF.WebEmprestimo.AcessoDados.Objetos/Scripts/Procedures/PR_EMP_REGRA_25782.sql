CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25782( MATRICULA_P       VARCHAR2,
												   IDMUTUARIO_P      INT, //BRUNO AZEVEDO - ALTERA플O NA ASSINATURA CONFORME E-MAIL
												   IDTITULAR_P       INT, //BRUNO AZEVEDO - ALTERA플O NA ASSINATURA CONFORME E-MAIL
											       IDPLANO_P         INT, //BRUNO AZEVEDO - ALTERA플O NA ASSINATURA CONFORME E-MAIL
											       SITFUNDACAO_P     VARCHAR2, //BRUNO AZEVEDO - ALTERA플O NA ASSINATURA CONFORME E-MAIL
											       IDPESSJUR_P       INT, //BRUNO AZEVEDO - ALTERA플O NA ASSINATURA CONFORME E-MAIL
											       IDCONTRATOAQUITAR_P  VARCHAR2, //BRUNO AZEVEDO - ALTERA플O NA ASSINATURA CONFORME E-MAIL
											       IDTIPOCONTRATO_P  NUMBER,
											       DATASOLICITACAO_P DATE,
												   IDOPERACAO_P      INT,
                                                   IDCALCULO_P      int,      //BRUNO AZEVEDO - ALTERA플O NA ASSINATURA CONFORME E-MAIL
											       USUARIO_P        VARCHAR2, //BRUNO AZEVEDO - ALTERA플O NA ASSINATURA CONFORME E-MAIL                                          
                                                   RESULTADO_P   OUT NUMBER,
                                                   RETORNO_P     OUT VARCHAR2) IS

IDPESSJUR_P       NUMBER;
IDMUTUARIO_P      NUMBER;
NUMDEPIRRF_P      INT;
IDTIPOSUSPENSAO_P INT;

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

BEGIN
  SELECT H.IDTIPOSUSPEMPTMO INTO IDTIPOSUSPENSAO_P
  FROM HISTSUSPCOBEP H, CONTRATOEMPTMO C
  WHERE  H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO
  AND    C.IDBENEF = IDMUTUARIO_P
  AND    H.FLGSTATUS = 'A';
EXCEPTION
      WHEN OTHERS THEN
           IDTIPOSUSPENSAO_P := -1;
END;


PCK_EMP_REGRA_MARGEM_R.PR_REGRA_25782( IDMUTUARIO_P,
                                       NVL(IDCONTRATO_P,-1),
                                       IDTIPOCONTRATO_P,
                                       IDOPERACAO_P,
                                       IDPESSJUR_P,
                                       IDMUTUARIO_P,
                                       DATASOLICITACAO_P,
                                       TOTALPARCELAS_P,
                                       FLGQUITA_P,
                                       IDTIPOSUSPENSAO_P,
                                       NUMDEPIRRF_P,
                                       IDCALCULO_P,
									   USUARIO_P,
                                       RESULTADO_P,
                                       RETORNO_P);

END PR_EMP_REGRA_25782;
/
