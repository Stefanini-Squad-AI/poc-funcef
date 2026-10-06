CREATE OR REPLACE PROCEDURE CM.PR_EMP_REGRA_25791(  IDMUTUARIO_P      INT,
                                                 IDCONTRATO_P      NUMBER,
                                                 IDOPERACAO_P      INT,
                                                 IDPATROCINADORA_P INT,                  
                                                 IDTIPOCONTRATO_P  INT,
                                                 SALARIOBASE_P     NUMBER,
                                                 VALORSOLICITADO_P NUMBER,
                                                 RESULTADO_P       OUT NUMBER,
                                                 RETORNO_P         OUT VARCHAR2) IS

FLGINTERNO_P CHAR(2);

BEGIN

   IF IDCONTRATO_P IS NOT NULL THEN           
      BEGIN
          SELECT SIP.FLGINTERNO INTO FLGINTERNO_P
          FROM CONTRATOEMPTMO CON, ELEGPATRO ELP, SITPART SIP, PARTPREVPLAN PPP
          WHERE  CON.IDPESSOA = ELP.IDPESSOA
          AND    ELP.IDPESSOA = PPP.IDPESSOA
          AND    PPP.IDSITPART = SIP.IDSITPART
          AND    CON.IDCONTRATOEMPTMO = IDCONTRATO_P
          AND    PPP.FLGDESATIVADO   = 0;
      END;
   ELSE
      BEGIN
          SELECT DISTINCT SIP.FLGINTERNO INTO FLGINTERNO_P
          FROM ELEGPATRO ELP, SITPART SIP, PARTPREVPLAN PPP, DEPENTIT DEP
          WHERE  DEP.IDTITULAR = ELP.IDPESSOA 
          AND    ELP.IDPESSOA = PPP.IDPESSOA
          AND    PPP.IDSITPART = SIP.IDSITPART
          AND    DEP.IDPESSOA = IDMUTUARIO_P
          AND    PPP.FLGDESATIVADO   = 0;

      END;
      
   END IF;            


PCK_EMP_REGRA_ITEMCONCESSAO_R.PR_REGRA_25791 ( IDMUTUARIO_P,
                                               NVL(IDCONTRATO_P,-1),
                                               IDTIPOCONTRATO_P,
                                               IDOPERACAO_P,
                                               IDPATROCINADORA_P,
                                               IDMUTUARIO_P, 
                                               --VALORSOLICITADO_P,
                                               SALARIOBASE_P,
                                               FLGINTERNO_P,
                                               RESULTADO_P,
                                               RETORNO_P);

 
end PR_EMP_REGRA_25791;
/
