DROP PROCEDURE SPRSALDOCONTABBEM;
DROP PUBLIC SYNONYM SPRSALDOCONTABBEM;

CREATE PROCEDURE SPRSALDOCONTABBEM (PIDBEM          IN SALDOCONTABBEM.IDBEM%TYPE,
                                    PIDPESSOA       IN SALDOCONTABBEM.IDPESSOA%TYPE,
                                    PDATASLDBEM     IN SALDOCONTABBEM.DATASLDBEM%TYPE,
                                    PVALORG         IN SALDOCONTABBEM.VALORG%TYPE,
                                    PCMBEM          IN SALDOCONTABBEM.CMBEM%TYPE,
                                    PDEPLANC        IN SALDOCONTABBEM.DEPLANC%TYPE,
                                    PCMDEP          IN SALDOCONTABBEM.CMDEP%TYPE,
                                    PREAVVALORG     IN SALDOCONTABBEM.REAVVALORG%TYPE,
                                    PREAVCMBEM      IN SALDOCONTABBEM.REAVCMBEM%TYPE,
                                    PREAVDEPLANC    IN SALDOCONTABBEM.REAVDEPLANC%TYPE,
                                    PREAVCMDEP      IN SALDOCONTABBEM.REAVCMDEP%TYPE,
                                    PULTREAVVALORG  IN SALDOCONTABBEM.ULTREAVVALORG%TYPE,
                                    PULTREAVCMBEM   IN SALDOCONTABBEM.ULTREAVCMBEM%TYPE,
                                    PULTREAVDEPLANC IN SALDOCONTABBEM.ULTREAVDEPLANC%TYPE,
                                    PULTREAVCMDEP   IN SALDOCONTABBEM.ULTREAVCMDEP%TYPE,
                                    PIDGRUPO        IN SALDOCONTABBEM.IDGRUPO%TYPE,
                                    PIDLOCALIZACAO  IN SALDOCONTABBEM.IDLOCALIZACAO%TYPE,
                                    PIDRESPONSAVEL  IN SALDOCONTABBEM.IDRESPONSAVEL%TYPE,
                                    PCODMOV         IN INTEGER) IS

   IIDBEM           INTEGER;
   IIDPESSOA        NUMBER;
   DDATASLD         DATE;
   IIDGRUPO         INTEGER;
   IIDLOCALIZACAO   INTEGER;
   IIDRESPONSAVEL   INTEGER;
   DDATAMOV         DATE;

   CURSOR SALDOBEM IS
   SELECT SCB.IDBEM, SCB.IDPESSOA, SCB.DATASLDBEM,
          SCB.VALORG, SCB.CMBEM, SCB.DEPLANC, SCB.CMDEP,
          SCB.REAVVALORG, SCB.REAVCMBEM, SCB.REAVDEPLANC, SCB.REAVCMDEP,
          SCB.ULTREAVVALORG, SCB.ULTREAVCMBEM, SCB.ULTREAVDEPLANC, SCB.ULTREAVCMDEP,
          SCB.IDGRUPO, SCB.IDLOCALIZACAO, SCB.IDRESPONSAVEL
   FROM SALDOCONTABBEM SCB,
        (SELECT IDBEM, MAX(DATASLDBEM) AS DATA
         FROM SALDOCONTABBEM
         WHERE (IDBEM = IIDBEM)
           AND (IDPESSOA = IIDPESSOA)
           AND (DATASLDBEM <= DDATASLD)
         GROUP BY IDBEM) DTAMAX
   WHERE (SCB.IDBEM = IIDBEM)
     AND (SCB.IDPESSOA = IIDPESSOA)
     AND (SCB.IDBEM = DTAMAX.IDBEM)
     AND (SCB.DATASLDBEM = DTAMAX.DATA);

   RSALDOBEM        SALDOBEM%ROWTYPE;

   CURSOR MOVCONTABBEM IS
   SELECT
      VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO,
      SUM(VBEM.VALBEMACUM + VBEM.VALACRESACUM -
          VBEM.BXVALBEMACUM - VBEM.BXVALACRESACUM)                         AS VALORG,
      SUM(VBEM.VALCMBEMACUM + VBEM.VALCMACRESACUM  -
          VBEM.BXVALCMBEMACUM  - VBEM.BXVALCMACRESACUM)                    AS CMBEM,
      SUM(VBEM.VALDEPBEMACUM  + VBEM.VALDEPACRESACUM -
          VBEM.BXVALDEPBEMACUM  - VBEM.BXVALDEPACRESACUM)                  AS DEPLANC,
      SUM(VBEM.VALCMDEPBEMACUM + VBEM.VALCMDEPACRESACUM -
          VBEM.BXVALCMDEPBEMACUM - VBEM.BXVALCMDEPACRESACUM)               AS CMDEP,
      SUM(VBEM.VALREAVACUM - VBEM.BXVALREAVACUM)                           AS REAVVALORG,
      SUM(VBEM.VALCMREAVACUM - VBEM.BXVALCMREAVACUM)                       AS REAVCMBEM,
      SUM(VBEM.VALDEPREAVACUM - VBEM.BXVALDEPREAVACUM)                     AS REAVDEPLANC,
      SUM(VBEM.VALCMDEPREAVACUM - VBEM.BXVALCMDEPREAVACUM)                 AS REAVCMDEP,
      SUM(VBEM.VALULTREAVACUM - VBEM.BXVALULTREAVACUM)                     AS ULTREAVVALORG,
      SUM(VBEM.VALULTCMREAVACUM - VBEM.BXVALULTCMREAVACUM)                 AS ULTREAVCMBEM,
      SUM(VBEM.VALULTDEPREAVACUM - VBEM.BXVALULTDEPREAVACUM)               AS ULTREAVDEPLANC,
      SUM(VBEM.VALULTCMDEPREAVACUM - VBEM.BXVALULTCMDEPREAVACUM)           AS ULTREAVCMDEP
   FROM
     ((SELECT HM.IDBEM,
              HM.IDPESSOA,
              HM.DATAMOVIMENTACAO,
              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,01,NVL(HM.VALOFI,0),
                                               41,NVL(HM.VALOFI,0),
                                               07,NVL(HM.VALOFI,0),0)) AS  VALBEMACUM,
              (0)                                                      AS  VALREAVACUM,
              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,09,NVL(HM.VALOFI,0),
                                               49,NVL(HM.VALOFI,0),0)) AS  VALACRESACUM,
              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(HM.VALOFI,0),
                                               42,NVL(HM.VALOFI,0),0)) AS  VALCMBEMACUM,
              (0)                                                      AS  VALCMREAVACUM,
              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,34,NVL(HM.VALOFI,0),
                                               50,NVL(HM.VALOFI,0),0)) AS  VALCMACRESACUM,
              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(HM.VALOFI,0),
                                               17,NVL(HM.VALOFI,0),
                                               43,NVL(HM.VALOFI,0),0)) AS  VALDEPBEMACUM,
              (0)                                                      AS  VALDEPREAVACUM,
              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,35,NVL(HM.VALOFI,0),
                                               51,NVL(HM.VALOFI,0),0)) AS  VALDEPACRESACUM,
              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,21,NVL(HM.VALOFI,0),
                                               44,NVL(HM.VALOFI,0),0)) AS  VALCMDEPBEMACUM,
              (0)                                                      AS  VALCMDEPREAVACUM,
              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,36,NVL(HM.VALOFI,0),
                                               52,NVL(HM.VALOFI,0),0)) AS  VALCMDEPACRESACUM,
              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,06,NVL(HM.VALOFI,0),
                                               13,NVL(HM.VALOFI,0),0)) AS  BXVALBEMACUM,
              (0)                                                      AS  BXVALREAVACUM,
              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,37,NVL(HM.VALOFI,0),0)) AS  BXVALACRESACUM,
              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,25,NVL(HM.VALOFI,0),0)) AS  BXVALCMBEMACUM,
              (0)                                                      AS  BXVALCMREAVACUM,
              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,38,NVL(HM.VALOFI,0),0)) AS  BXVALCMACRESACUM,
              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,24,NVL(HM.VALOFI,0),0)) AS  BXVALDEPBEMACUM,
              (0)                                                      AS  BXVALDEPREAVACUM,
              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,39,NVL(HM.VALOFI,0),0)) AS  BXVALDEPACRESACUM,
              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,26,NVL(HM.VALOFI,0),0)) AS  BXVALCMDEPBEMACUM,
              (0)                                                      AS  BXVALCMDEPREAVACUM,
              SUM(DECODE(HM.IDTIPOMOVIMENTACAO,40,NVL(HM.VALOFI,0),0)) AS  BXVALCMDEPACRESACUM,
              (0)                                                      AS  VALULTREAVACUM,
              (0)                                                      AS  VALULTCMREAVACUM,
              (0)                                                      AS  VALULTDEPREAVACUM,
              (0)                                                      AS  VALULTCMDEPREAVACUM,
              (0)                                                      AS  BXVALULTREAVACUM,
              (0)                                                      AS  BXVALULTCMREAVACUM,
              (0)                                                      AS  BXVALULTDEPREAVACUM,
              (0)                                                      AS  BXVALULTCMDEPREAVACUM
       FROM HISTORICOMOVIMENTACAO HM
       WHERE (HM.IDBEM = IIDBEM)
         AND (HM.DATAMOVIMENTACAO >= DDATASLD)
       GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO) UNION
      ((SELECT
               HM.IDBEM,
               HM.IDPESSOA,
               HM.DATAMOVIMENTACAO,
               (0)                                                      AS  VALBEMACUM,
               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(HM.VALOFI,0),
                                                32,NVL(HM.VALOFI,0),
                                                45,NVL(HM.VALOFI,0),0)) AS  VALREAVACUM,
               (0)                                                      AS  VALACRESACUM,
               (0)                                                      AS  VALCMBEMACUM,
               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM.VALOFI,0),
                                                46,NVL(HM.VALOFI,0),0)) AS  VALCMREAVACUM,
               (0)                                                      AS  VALCMACRESACUM,
               (0)                                                      AS  VALDEPBEMACUM,
               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM.VALOFI,0),
                                                33,NVL(HM.VALOFI,0),
                                                47,NVL(HM.VALOFI,0),0)) AS  VALDEPREAVACUM,
               (0)                                                      AS  VALDEPACRESACUM,
               (0)                                                      AS  VALCMDEPBEMACUM,
               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,19,NVL(HM.VALOFI,0),
                                                48,NVL(HM.VALOFI,0),0)) AS  VALCMDEPREAVACUM,
               (0)                                                      AS  VALCMDEPACRESACUM,
               (0)                                                      AS  BXVALBEMACUM,
               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(HM.VALOFI,0),0)) AS  BXVALREAVACUM,
               (0)                                                      AS  BXVALACRESACUM,
               (0)                                                      AS  BXVALCMBEMACUM,
               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(HM.VALOFI,0),0)) AS  BXVALCMREAVACUM,
               (0)                                                      AS  BXVALCMACRESACUM,
               (0)                                                      AS  BXVALDEPBEMACUM,
               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(HM.VALOFI,0),0)) AS  BXVALDEPREAVACUM,
               (0)                                                      AS  BXVALDEPACRESACUM,
               (0)                                                      AS  BXVALCMDEPBEMACUM,
               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(HM.VALOFI,0),0)) AS  BXVALCMDEPREAVACUM,
               (0)                                                      AS  BXVALCMDEPACRESACUM,
               (0)                                                      AS  VALULTREAVACUM,
               (0)                                                      AS  VALULTCMREAVACUM,
               (0)                                                      AS  VALULTDEPREAVACUM,
               (0)                                                      AS  VALULTCMDEPREAVACUM,
               (0)                                                      AS  BXVALULTREAVACUM,
               (0)                                                      AS  BXVALULTCMREAVACUM,
               (0)                                                      AS  BXVALULTDEPREAVACUM,
               (0)                                                      AS  BXVALULTCMDEPREAVACUM
        FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R
        WHERE (HM.IDBEM = IIDBEM)
          AND (HM.DATAMOVIMENTACAO >= DDATASLD)
          AND (R.FLGULTREAVAL = 0)
          AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))
        GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO) UNION
       (SELECT
               HM.IDBEM,
               HM.IDPESSOA,
               HM.DATAMOVIMENTACAO,
               (0)                                                      AS  VALBEMACUM,
               (0)                                                      AS  VALREAVACUM,
               (0)                                                      AS  VALACRESACUM,
               (0)                                                      AS  VALCMBEMACUM,
               (0)                                                      AS  VALCMREAVACUM,
               (0)                                                      AS  VALCMACRESACUM,
               (0)                                                      AS  VALDEPBEMACUM,
               (0)                                                      AS  VALDEPREAVACUM,
               (0)                                                      AS  VALDEPACRESACUM,
               (0)                                                      AS  VALCMDEPBEMACUM,
               (0)                                                      AS  VALCMDEPREAVACUM,
               (0)                                                      AS  VALCMDEPACRESACUM,
               (0)                                                      AS  BXVALBEMACUM,
               (0)                                                      AS  BXVALREAVACUM,
               (0)                                                      AS  BXVALACRESACUM,
               (0)                                                      AS  BXVALCMBEMACUM,
               (0)                                                      AS  BXVALCMREAVACUM,
               (0)                                                      AS  BXVALCMACRESACUM,
               (0)                                                      AS  BXVALDEPBEMACUM,
               (0)                                                      AS  BXVALDEPREAVACUM,
               (0)                                                      AS  BXVALDEPACRESACUM,
               (0)                                                      AS  BXVALCMDEPBEMACUM,
               (0)                                                      AS  BXVALCMDEPREAVACUM,
               (0)                                                      AS  BXVALCMDEPACRESACUM,
               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(HM.VALOFI,0),
                                                32,NVL(HM.VALOFI,0),
                                                45,NVL(HM.VALOFI,0),0)) AS  VALULTREAVACUM,
               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM.VALOFI,0),
                                                46,NVL(HM.VALOFI,0),0)) AS  VALULTCMREAVACUM,
               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM.VALOFI,0),
                                                33,NVL(HM.VALOFI,0),
                                                47,NVL(HM.VALOFI,0),0)) AS  VALULTDEPREAVACUM,
               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,19,NVL(HM.VALOFI,0),
                                                48,NVL(HM.VALOFI,0),0)) AS  VALULTCMDEPREAVACUM,
               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(HM.VALOFI,0),0)) AS  BXVALULTREAVACUM,
               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(HM.VALOFI,0),0)) AS  BXVALULTCMREAVACUM,
               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(HM.VALOFI,0),0)) AS  BXVALULTDEPREAVACUM,
               SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(HM.VALOFI,0),0)) AS  BXVALULTCMDEPREAVACUM
        FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R
        WHERE (HM.IDBEM = IIDBEM)
          AND (HM.DATAMOVIMENTACAO >= DDATASLD)
          AND (R.FLGULTREAVAL = 1)
          AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))
        GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO))
     )  VBEM
   GROUP BY VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO;

   RMOVCONTABBEM    MOVCONTABBEM%ROWTYPE;

   CURSOR MOVTRANSF IS
   SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO, DATAMOVIMENTACAO,
          IDGRUPANT, IDLOCALANT, IDRESPANT
   FROM HISTORICOMOVIMENTACAO
   WHERE (IDBEM    = IIDBEM)
     AND (IDPESSOA = IIDPESSOA)
     AND ((IDTIPOMOVIMENTACAO = 05) OR
          (IDTIPOMOVIMENTACAO = 11) OR
          (IDTIPOMOVIMENTACAO = 12))
   ORDER BY DATAMOVIMENTACAO DESC, IDMOVIMENTACAO;

   RMOVTRANSF       MOVTRANSF%ROWTYPE;

   CURSOR SCBTRANSF IS
   SELECT IDBEM, IDPESSOA, DATASLDBEM, IDGRUPO, IDLOCALIZACAO, IDRESPONSAVEL
   FROM SALDOCONTABBEM SC
   WHERE (IDBEM    = IIDBEM)
     AND (IDPESSOA = IIDPESSOA)
   ORDER BY DATASLDBEM DESC;

   RSCBTRANSF       SCBTRANSF%ROWTYPE;

BEGIN
   IIDBEM    := PIDBEM;
   IIDPESSOA := PIDPESSOA;
   DDATASLD  := PDATASLDBEM;
   ---------------------------------------------------------------------------------------
   -- CASO SEJA ESTORNO, REMOVER OS SALDOS POSTERIORES                                  --
   ---------------------------------------------------------------------------------------
   IF PCODMOV = 2 THEN
      DELETE FROM SALDOCONTABBEM
      WHERE (IDBEM = IIDBEM)
        AND (IDPESSOA = IIDPESSOA)
        AND (DATASLDBEM >= DDATASLD);
   END IF;
   ---------------------------------------------------------------------------------------
   -- VERIFICA O SALDO NA DATA                                                          --
   ---------------------------------------------------------------------------------------
   OPEN SALDOBEM;
   IF SALDOBEM%ISOPEN THEN
      FETCH SALDOBEM INTO RSALDOBEM;
      IF SALDOBEM%NOTFOUND THEN
         RSALDOBEM.IDBEM          := 0;
         RSALDOBEM.VALORG         := 0;
         RSALDOBEM.CMBEM          := 0;
         RSALDOBEM.DEPLANC        := 0;
         RSALDOBEM.CMDEP          := 0;
         RSALDOBEM.REAVVALORG     := 0;
         RSALDOBEM.REAVCMBEM      := 0;
         RSALDOBEM.REAVDEPLANC    := 0;
         RSALDOBEM.REAVCMDEP      := 0;
         RSALDOBEM.ULTREAVVALORG  := 0;
         RSALDOBEM.ULTREAVCMBEM   := 0;
         RSALDOBEM.ULTREAVDEPLANC := 0;
         RSALDOBEM.ULTREAVCMDEP   := 0;
      END IF;
      CLOSE SALDOBEM;
   ELSE
      RSALDOBEM.IDBEM          := 0;
      RSALDOBEM.VALORG         := 0;
      RSALDOBEM.CMBEM          := 0;
      RSALDOBEM.DEPLANC        := 0;
      RSALDOBEM.CMDEP          := 0;
      RSALDOBEM.REAVVALORG     := 0;
      RSALDOBEM.REAVCMBEM      := 0;
      RSALDOBEM.REAVDEPLANC    := 0;
      RSALDOBEM.REAVCMDEP      := 0;
      RSALDOBEM.ULTREAVVALORG  := 0;
      RSALDOBEM.ULTREAVCMBEM   := 0;
      RSALDOBEM.ULTREAVDEPLANC := 0;
      RSALDOBEM.ULTREAVCMDEP   := 0;
   END IF;
   IIDGRUPO       := PIDGRUPO;
   IIDLOCALIZACAO := PIDLOCALIZACAO;
   IIDRESPONSAVEL := PIDRESPONSAVEL;
   ---------------------------------------------------------------------------------------
   -- ATUALIZA SALDO                                                                    --
   ---------------------------------------------------------------------------------------
   IF PCODMOV = 0 THEN -- MOVIMENTAÇÕES, EXCETO REAVALIAÇÃO --
      IF RSALDOBEM.DATASLDBEM = PDATASLDBEM THEN
         UPDATE SALDOCONTABBEM
         SET VALORG         = RSALDOBEM.VALORG         + PVALORG         ,
             CMBEM          = RSALDOBEM.CMBEM          + PCMBEM          ,
             DEPLANC        = RSALDOBEM.DEPLANC        + PDEPLANC        ,
             CMDEP          = RSALDOBEM.CMDEP          + PCMDEP          ,
             REAVVALORG     = RSALDOBEM.REAVVALORG     + PREAVVALORG     ,
             REAVCMBEM      = RSALDOBEM.REAVCMBEM      + PREAVCMBEM      ,
             REAVDEPLANC    = RSALDOBEM.REAVDEPLANC    + PREAVDEPLANC    ,
             REAVCMDEP      = RSALDOBEM.REAVCMDEP      + PREAVCMDEP      ,
             ULTREAVVALORG  = RSALDOBEM.ULTREAVVALORG  + PULTREAVVALORG  ,
             ULTREAVCMBEM   = RSALDOBEM.ULTREAVCMBEM   + PULTREAVCMBEM   ,
             ULTREAVDEPLANC = RSALDOBEM.ULTREAVDEPLANC + PULTREAVDEPLANC ,
             ULTREAVCMDEP   = RSALDOBEM.ULTREAVCMDEP   + PULTREAVCMDEP   ,
             IDGRUPO        = IIDGRUPO,
             IDLOCALIZACAO  = IIDLOCALIZACAO,
             IDRESPONSAVEL  = IIDRESPONSAVEL
         WHERE (IDBEM      = PIDBEM)
           AND (IDPESSOA   = PIDPESSOA)
           AND (DATASLDBEM = PDATASLDBEM);
      ELSE
         INSERT INTO SALDOCONTABBEM (IDBEM, IDPESSOA, DATASLDBEM,
                                     VALORG,CMBEM,DEPLANC,CMDEP,
                                     REAVVALORG,REAVCMBEM,REAVDEPLANC,REAVCMDEP,
                                     ULTREAVVALORG,ULTREAVCMBEM,ULTREAVDEPLANC,ULTREAVCMDEP,
                                     IDGRUPO, IDLOCALIZACAO, IDRESPONSAVEL)
                             VALUES (PIDBEM, PIDPESSOA, PDATASLDBEM,
                                     RSALDOBEM.VALORG         + PVALORG        ,
                                     RSALDOBEM.CMBEM          + PCMBEM         ,
                                     RSALDOBEM.DEPLANC        + PDEPLANC       ,
                                     RSALDOBEM.CMDEP          + PCMDEP         ,
                                     RSALDOBEM.REAVVALORG     + PREAVVALORG    ,
                                     RSALDOBEM.REAVCMBEM      + PREAVCMBEM     ,
                                     RSALDOBEM.REAVDEPLANC    + PREAVDEPLANC   ,
                                     RSALDOBEM.REAVCMDEP      + PREAVCMDEP     ,
                                     RSALDOBEM.ULTREAVVALORG  + PULTREAVVALORG ,
                                     RSALDOBEM.ULTREAVCMBEM   + PULTREAVCMBEM  ,
                                     RSALDOBEM.ULTREAVDEPLANC + PULTREAVDEPLANC,
                                     RSALDOBEM.ULTREAVCMDEP   + PULTREAVCMDEP  ,
                                     IIDGRUPO, IIDLOCALIZACAO, IIDRESPONSAVEL);
      END IF;
   ELSIF PCODMOV = 1 THEN   -- REAVALIAÇÃO --
      IF RSALDOBEM.DATASLDBEM = PDATASLDBEM THEN
         UPDATE SALDOCONTABBEM
         SET VALORG         = RSALDOBEM.VALORG      + PVALORG,
             CMBEM          = RSALDOBEM.CMBEM       + PCMBEM,
             DEPLANC        = RSALDOBEM.DEPLANC     + PDEPLANC,
             CMDEP          = RSALDOBEM.CMDEP       + PCMDEP,
             REAVVALORG     = RSALDOBEM.REAVVALORG  + RSALDOBEM.ULTREAVVALORG,
             REAVCMBEM      = RSALDOBEM.REAVCMBEM   + RSALDOBEM.ULTREAVCMBEM,
             REAVDEPLANC    = RSALDOBEM.REAVDEPLANC + RSALDOBEM.ULTREAVDEPLANC,
             REAVCMDEP      = RSALDOBEM.REAVCMDEP   + RSALDOBEM.ULTREAVCMDEP,
             ULTREAVVALORG  = PULTREAVVALORG,
             ULTREAVCMBEM   = PULTREAVCMBEM  ,
             ULTREAVDEPLANC = PULTREAVDEPLANC,
             ULTREAVCMDEP   = PULTREAVCMDEP,
             IDGRUPO        = IIDGRUPO,
             IDLOCALIZACAO  = IIDLOCALIZACAO,
             IDRESPONSAVEL  = IIDRESPONSAVEL
         WHERE (IDBEM = PIDBEM)
           AND (IDPESSOA = PIDPESSOA)
           AND (DATASLDBEM = PDATASLDBEM);
      ELSE
         INSERT INTO SALDOCONTABBEM (IDBEM, IDPESSOA, DATASLDBEM,
                                     VALORG,CMBEM,DEPLANC,CMDEP,
                                     REAVVALORG,REAVCMBEM,REAVDEPLANC,REAVCMDEP,
                                     ULTREAVVALORG,ULTREAVCMBEM,ULTREAVDEPLANC,ULTREAVCMDEP,
                                     IDGRUPO, IDLOCALIZACAO, IDRESPONSAVEL)
                             VALUES (PIDBEM, PIDPESSOA, PDATASLDBEM,
                                     RSALDOBEM.VALORG      + PVALORG,
                                     RSALDOBEM.CMBEM       + PCMBEM,
                                     RSALDOBEM.DEPLANC     + PDEPLANC,
                                     RSALDOBEM.CMDEP       + PCMDEP,
                                     RSALDOBEM.REAVVALORG  + RSALDOBEM.ULTREAVVALORG,
                                     RSALDOBEM.REAVCMBEM   + RSALDOBEM.ULTREAVCMBEM,
                                     RSALDOBEM.REAVDEPLANC + RSALDOBEM.ULTREAVDEPLANC,
                                     RSALDOBEM.REAVCMDEP   + RSALDOBEM.ULTREAVCMDEP,
                                     PULTREAVVALORG ,
                                     PULTREAVCMBEM  ,
                                     PULTREAVDEPLANC,
                                     PULTREAVCMDEP  ,
                                     IIDGRUPO, IIDLOCALIZACAO, IIDRESPONSAVEL);
      END IF;
   ELSIF PCODMOV = 2 THEN   -- ESTORNOS --
      ------------------------------------------------------------------------------------
      -- PROCESSA OS SALDOS DIARIOS DO BEM                                              --
      ------------------------------------------------------------------------------------
      OPEN MOVCONTABBEM;
      IF MOVCONTABBEM%ISOPEN THEN
         FETCH MOVCONTABBEM INTO RMOVCONTABBEM;
         WHILE NOT MOVCONTABBEM%NOTFOUND LOOP
            RSALDOBEM.VALORG         := RSALDOBEM.VALORG         + RMOVCONTABBEM.VALORG;
            RSALDOBEM.CMBEM          := RSALDOBEM.CMBEM          + RMOVCONTABBEM.CMBEM;
            RSALDOBEM.DEPLANC        := RSALDOBEM.DEPLANC        + RMOVCONTABBEM.DEPLANC;
            RSALDOBEM.CMDEP          := RSALDOBEM.CMDEP          + RMOVCONTABBEM.CMDEP;
            RSALDOBEM.REAVVALORG     := RSALDOBEM.REAVVALORG     + RMOVCONTABBEM.REAVVALORG;
            RSALDOBEM.REAVCMBEM      := RSALDOBEM.REAVCMBEM      + RMOVCONTABBEM.REAVCMBEM;
            RSALDOBEM.REAVDEPLANC    := RSALDOBEM.REAVDEPLANC    + RMOVCONTABBEM.REAVDEPLANC;
            RSALDOBEM.REAVCMDEP      := RSALDOBEM.REAVCMDEP      + RMOVCONTABBEM.REAVCMDEP;
            RSALDOBEM.ULTREAVVALORG  := RSALDOBEM.ULTREAVVALORG  + RMOVCONTABBEM.ULTREAVVALORG;
            RSALDOBEM.ULTREAVCMBEM   := RSALDOBEM.ULTREAVCMBEM   + RMOVCONTABBEM.ULTREAVCMBEM;
            RSALDOBEM.ULTREAVDEPLANC := RSALDOBEM.ULTREAVDEPLANC + RMOVCONTABBEM.ULTREAVDEPLANC;
            RSALDOBEM.ULTREAVCMDEP   := RSALDOBEM.ULTREAVCMDEP   + RMOVCONTABBEM.ULTREAVCMDEP;
            ------------------------------------------------------------------------------
            INSERT INTO SALDOCONTABBEM (IDBEM, IDPESSOA, DATASLDBEM,
                                        VALORG, CMBEM, DEPLANC, CMDEP,
                                        REAVVALORG, REAVCMBEM, REAVDEPLANC, REAVCMDEP,
                                        ULTREAVVALORG, ULTREAVCMBEM, ULTREAVDEPLANC, ULTREAVCMDEP)
                                VALUES (RMOVCONTABBEM.IDBEM,
                                        RMOVCONTABBEM.IDPESSOA,
                                        RMOVCONTABBEM.DATAMOVIMENTACAO,
                                        RSALDOBEM.VALORG, RSALDOBEM.CMBEM, RSALDOBEM.DEPLANC, RSALDOBEM.CMDEP,
                                        RSALDOBEM.REAVVALORG, RSALDOBEM.REAVCMBEM, RSALDOBEM.REAVDEPLANC, RSALDOBEM.REAVCMDEP,
                                        RSALDOBEM.ULTREAVVALORG, RSALDOBEM.ULTREAVCMBEM, RSALDOBEM.ULTREAVDEPLANC, RSALDOBEM.ULTREAVCMDEP);
            ------------------------------------------------------------------------------
            FETCH MOVCONTABBEM INTO RMOVCONTABBEM;
         END LOOP;
      END IF;
      ------------------------------------------------------------------------------------
      -- PROCESSA TRANSFERENCIAS                                                        --
      ------------------------------------------------------------------------------------
      OPEN SCBTRANSF;
      IF SCBTRANSF%ISOPEN THEN
         FETCH SCBTRANSF INTO RSCBTRANSF;
         WHILE NOT SCBTRANSF%NOTFOUND LOOP
            ------------------------------------------------------------------------------
            -- Dados anteriores                                                         --
            ------------------------------------------------------------------------------
            OPEN MOVTRANSF;
            IF MOVTRANSF%ISOPEN THEN
               FETCH MOVTRANSF INTO RMOVTRANSF;
               WHILE (NOT SCBTRANSF%NOTFOUND) AND (RSCBTRANSF.IDBEM = IIDBEM) AND
                                                  (RSCBTRANSF.IDPESSOA = IIDPESSOA) LOOP
                  ------------------------------------------------------------------------
                  -- Atualiza os dados na tabela SALDOCONTABBEM                         --
                  ------------------------------------------------------------------------
                  UPDATE SALDOCONTABBEM
                  SET IDGRUPO        = IIDGRUPO,
                      IDLOCALIZACAO  = IIDLOCALIZACAO,
                      IDRESPONSAVEL  = IIDRESPONSAVEL
                  WHERE (IDBEM      = RSCBTRANSF.IDBEM)
                    AND (IDPESSOA   = RSCBTRANSF.IDPESSOA)
                    AND (DATASLDBEM = RSCBTRANSF.DATASLDBEM);
                  ------------------------------------------------------------------------
                  -- Verifica mudança de grupo, localização ou responsável de bem       --
                  ------------------------------------------------------------------------
                  IF RSCBTRANSF.DATASLDBEM = RMOVTRANSF.DATAMOVIMENTACAO THEN
                     DDATAMOV := RMOVTRANSF.DATAMOVIMENTACAO;
                     WHILE (NOT MOVTRANSF%NOTFOUND) AND
                           (RMOVTRANSF.DATAMOVIMENTACAO = DDATAMOV) LOOP
                        IF RMOVTRANSF.IDGRUPANT IS NOT NULL THEN
                           IIDGRUPO := RMOVTRANSF.IDGRUPANT;
                        END IF;
                        IF RMOVTRANSF.IDLOCALANT IS NOT NULL THEN
                           IIDLOCALIZACAO := RMOVTRANSF.IDLOCALANT;
                        END IF;
                        IF RMOVTRANSF.IDRESPANT IS NOT NULL THEN
                           IIDRESPONSAVEL := RMOVTRANSF.IDRESPANT;
                        END IF;
                        ------------------------------------------------------------------
                        FETCH MOVTRANSF INTO RMOVTRANSF;
                     END LOOP;
                  END IF;   
                  ------------------------------------------------------------------------
                  FETCH SCBTRANSF INTO RSCBTRANSF;
               END LOOP;
            END IF;
         END LOOP;
      END IF;
   END IF;
END;
/
CREATE PUBLIC SYNONYM SPRSALDOCONTABBEM FOR CM.SPRSALDOCONTABBEM;

