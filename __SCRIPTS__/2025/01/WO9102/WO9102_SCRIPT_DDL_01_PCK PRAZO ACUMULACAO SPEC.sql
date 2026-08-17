CREATE OR REPLACE PACKAGE CM.PCK_CTB_CALC_PRAZOACUMULACAO IS

  -------------------------------------------------------------------------
  --      S U M Á R I O      D A       F U N C I O N A L I D A D E       --
  -------------------------------------------------------------------------
  -- Área responsável(s).......: PREVIDÊNCIÁRIO
  -- Modulo responsável(s).....: CONTRIBUIÇÃO
  -- Dependências..............: ContribuiçãoPrev
  -------------------------------------------------------------------------
  -- Tipo objeto...............: PACKAGE
  -- Nome objeto...............: PCK_CTB_CALC_PRAZOACUMULACAO
  -- Objetivo da funcionalidade: Reunir todas as rotinas para o calculo de acumulação
  -- Integra com modulo(s).....: Contribuição
  -- Inf. da funcionalidade....:
  -------------------------------------------------------------------------
  -- Data da criação...........: 25/09/2009
  -- Desenvolvedor.............: Daniel Begnami
  -------------------------------------------------------------------------


  -- Procedure PRINCIPAL: Realiza o calculo do prazo de acumulação
  PROCEDURE PR_CALC_PRAZO_ACUMULACAO(inIDPessJur    IN ELEGPATRO.IDPESSJUR%TYPE DEFAULT NULL,
                                     inIDPessoa     IN ELEGPATRO.IDPESSOA%TYPE DEFAULT NULL,
                                     inListaBenef   IN LISTAFOLHABENEFDET.IDLISTA%TYPE DEFAULT NULL,
                                     inREB          IN PLS_INTEGER DEFAULT 1,
                                     inNOVOPLANO    IN PLS_INTEGER DEFAULT 1,
                                     inDataPrevista IN DATE DEFAULT NULL,
                                     inTipoOpcaoIR  IN CHAR DEFAULT 'R',
                                     inMatricula    IN VARCHAR2,
                                     inIDTitular    IN DEPENTIT.IDTITULAR%TYPE DEFAULT NULL, /* FELIPE A. SANTOS SOL 254124 PPM 793415 */
                                     outERRO        OUT VARCHAR,
                                     inSeqResgate   IN PLS_INTEGER DEFAULT -1,    /*20491*/
                                     inTipoCalculo  IN PLS_INTEGER DEFAULT 2,     /*WO9102*/                                  
                                     inIdBeneficio     IN PLS_INTEGER DEFAULT -1  /*WO9102*/                                                                       
                                     );

  -- Procedure PRINCIPAL: Realiza o calculo do prazo de acumulação
  PROCEDURE PR_CALC_PRAZO_ACUMULACAO(inIDPessJur       IN ELEGPATRO.IDPESSJUR%TYPE,
                                     inIDPessoa        IN ELEGPATRO.IDPESSOA%TYPE,
                                     inREB             IN PLS_INTEGER DEFAULT 1,
                                     inNOVOPLANO       IN PLS_INTEGER DEFAULT 1,
                                     inDataPrevista    IN DATE DEFAULT NULL,
                                     inTipoOpcaoIR     IN CHAR DEFAULT 'R',
                                     inMatricula       IN VARCHAR2,
                                     inIDTitular       IN DEPENTIT.IDTITULAR%TYPE DEFAULT NULL, /* FELIPE A. SANTOS SOL 254124 PPM 793415 */
                                     outTotalNovoPlano OUT NUMBER,
                                     outTotalREB       OUT NUMBER,
                                     outERRO           OUT VARCHAR,
                                     inSeqResgate      IN PLS_INTEGER DEFAULT -1,   /*20491*/
                                     inTipoCalculo     IN PLS_INTEGER DEFAULT 2,    /*WO9102*/
                                     inIdBeneficio     IN PLS_INTEGER DEFAULT -1    /*WO9102*/                                                                       
                                     );

  -- A T E N Ç Ã O
  -- Função compartilhada com o pacote -> PCK_CTB_CALC_PRAZO_MEDIO_POND
  FUNCTION FN_MontaQueryPessoasAProcessar(inIDPessJur  IN ELEGPATRO.IDPESSJUR%TYPE DEFAULT NULL,
                                          inIDPessoa   IN ELEGPATRO.IDPESSOA%TYPE DEFAULT NULL,
                                          inListaBenef IN LISTAFOLHABENEFDET.IDLISTA%TYPE DEFAULT NULL,
                                          inREB        IN PLS_INTEGER DEFAULT 1,
                                          inNOVOPLANO  IN PLS_INTEGER DEFAULT 1) RETURN VARCHAR2;

  /*20491*/                                          
  FUNCTION FN_VerificaTitularFalecido(inIDTitular   IN ELEGPATRO.IDPESSOA%TYPE DEFAULT NULL,
                                      inIDPlanoPrev IN PLANPREV.IDPLANOPREV%TYPE
                                      ) RETURN PLS_INTEGER;                                         
                                          

end;