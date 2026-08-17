CREATE OR REPLACE PACKAGE CM.PCK_CTB_CALC_PRAZOMEDIOPOND IS

  -------------------------------------------------------------------------
  --      S U M Á R I O      D A       F U N C I O N A L I D A D E       --
  -------------------------------------------------------------------------
  -- Área responsável(s).......: PREVIDÊNCIÁRIO
  -- Modulo responsável(s).....: CONTRIBUIÇÃO
  -- Dependências..............: ContribuiçãoPrev
  -------------------------------------------------------------------------
  -- Tipo objeto...............: PACKAGE
  -- Nome objeto...............: PCK_CTB_CALC_PRAZOMEDIOPOND
  -- Objetivo da funcionalidade: Reunir todas as rotinas para o calculo do prazo
  -- Integra com modulo(s).....: medio ponderado
  -- Inf. da funcionalidade....:
  -------------------------------------------------------------------------
  -- Data da criação...........: 22/02/2009
  -- Desenvolvedor.............: Daniel Begnami
  -------------------------------------------------------------------------


  -- Procedure PRINCIPAL: Realiza o calculo do prazo medio ponderado
  PROCEDURE PR_CALC_PMP(inIDPessJur    IN ELEGPATRO.IDPESSJUR%TYPE DEFAULT NULL,
                        inIDPessoa     IN ELEGPATRO.IDPESSOA%TYPE DEFAULT NULL,
                        inListaBenef   IN LISTAFOLHABENEFDET.IDLISTA%TYPE DEFAULT NULL,
                        inREB          IN PLS_INTEGER DEFAULT 1,
                        inNOVOPLANO    IN PLS_INTEGER DEFAULT 1,
--                        inDataPrevista IN DATE DEFAULT NULL,
                        inTipoOpcaoIR  IN CHAR DEFAULT 'R',
                        inDataPagamento IN DATE DEFAULT SYSDATE,
                        inMatricula VARCHAR2,
                        outERRO        OUT VARCHAR,
                        inIDTitular    IN DEPENTIT.IDTITULAR%TYPE DEFAULT -1,    /*20491*/
                        inTipoCalculo  IN PLS_INTEGER DEFAULT 2                 /*WO9102*/                        
                        );


end;