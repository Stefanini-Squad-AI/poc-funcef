CREATE OR REPLACE PROCEDURE cm.PR_EMP_REGRA_25530( IDCONTRATO_P NUMBER,
                                                   IDTIPOCONTRATO_P NUMBER,
                                                   IDMUTUARIO_P  NUMBER,
                                                   IDTITULAR_P NUMBER,
                                                   IDPATRO_P NUMBER,
                                                   IDOPERACAO_P  INT,
                                                   IDTIPOSUSPENSAO_P NUMBER,
                                                   DATAINICIOSUSP_P DATE,
                                                   EXCEPCIONAL_P     INT,
                                                   QTDMESES_P        INT,
                                                   FLGINTERNO_P   VARCHAR2,
                                                   IDCALCULO_P    PLS_INTEGER,
                                                   USUARIO_P      VARCHAR2,
                                                   RESULTADO_P OUT DATE,
                                                   RETORNO_P   OUT VARCHAR2) IS
  vNumParcAberto INTEGER;

BEGIN

  SELECT COUNT(HMEPARCELA)
  INTO vNumParcAberto
  FROM HISTMOVEMPTMO HME
  WHERE HME.IDCONTRATOEMPTMO      = IDCONTRATO_P
  AND   HME.FLGBAIXADO            = 0
  AND   HME.HMEDATAEFETIVA        IS NULL
  AND   HME.HMEVLREFETIVO         IS NULL
  AND   HME.HMEDATAPREVISTA      <= trunc(SYSDATE)
  AND  (HME.HMEANOCOMPETENCIA    <> to_number(to_char(SYSDATE,'YYYY'))
        OR
        HME.HMEMESCOMPETENCIA    <> to_number(to_char(SYSDATE,'MM')))
  AND   HME.HMETIPOMOV            NOT IN (0, 5, 8)
  AND   HME.HMEVLRPREVISTO        > 0
  AND  (HME.HMECENTRALIZA        = 1 OR HME.HMEDESTACADO = 1)
  AND   NVL(HME.FLGESTORNADO, 0)  = 0
  AND   NVL(HME.FLGQUITADO, 0)    = 0
  AND   NVL(HME.FLGABONADO, 0)    = 0
  AND   NVL(HME.FLGSUSPENSAO, 0)  = 0;


PCK_EMP_REGRA_SUSPENSAO_R.PR_REGRA_25530( IDMUTUARIO_P,
                                          IDTITULAR_P,
                                          IDPATRO_P,
                                          IDCONTRATO_P,
                                          IDTIPOCONTRATO_P,
                                          IDOPERACAO_P,
                                          IDTIPOSUSPENSAO_P,
                                          DATAINICIOSUSP_P,
                                          EXCEPCIONAL_P,
                                          vNumParcAberto,
                                          FLGINTERNO_P,
                                          QTDMESES_P,
                                          IDCALCULO_P,
                                          USUARIO_P,
                                          RESULTADO_P,
                                          RETORNO_P);

END PR_EMP_REGRA_25530;


