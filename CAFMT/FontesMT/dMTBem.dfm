object dtmMTBem: TdtmMTBem
  OldCreateOrder = False
  Left = 132
  Top = 85
  Height = 454
  Width = 612
  object sqlMovContabBem: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO, VBEM.MOECOD' +
        'IGO, VBEM.IDTAXADEP,'
      ''
      '   SUM(VBEM.VALBEMACUM + VBEM.VALACRESACUM -'
      
        '       VBEM.BXVALBEMACUM + VBEM.BXVALACRESACUM)                 ' +
        '        AS VALORG,'
      '   SUM(VBEM.VALCMBEMACUM + VBEM.VALCMACRESACUM  -'
      
        '       VBEM.BXVALCMBEMACUM - VBEM.BXVALCMACRESACUM)             ' +
        '        AS CMBEM,'
      '   SUM(VBEM.VALDEPBEMACUM + VBEM.VALDEPACRESACUM -'
      
        '       VBEM.BXVALDEPBEMACUM - VBEM.BXVALDEPACRESACUM)           ' +
        '        AS DEPLANC,'
      '   SUM(VBEM.VALCMDEPBEMACUM + VBEM.VALCMDEPACRESACUM -'
      
        '       VBEM.BXVALCMDEPBEMACUM - VBEM.BXVALCMDEPACRESACUM)       ' +
        '        AS CMDEP,'
      ''
      
        '   SUM(VBEM.VALREAVACUM - VBEM.BXVALREAVACUM)                   ' +
        '        AS REAVVALORG,'
      
        '   SUM(VBEM.VALCMREAVACUM - VBEM.BXVALCMREAVACUM)               ' +
        '        AS REAVCMBEM,'
      
        '   SUM(VBEM.VALDEPREAVACUM - VBEM.BXVALDEPREAVACUM)             ' +
        '        AS REAVDEPLANC,'
      
        '   SUM(VBEM.VALCMDEPREAVACUM - VBEM.BXVALCMDEPREAVACUM)         ' +
        '        AS REAVCMDEP,'
      ''
      
        '   SUM(VBEM.VALULTREAVACUM - VBEM.BXVALULTREAVACUM)             ' +
        '        AS ULTREAVVALORG,'
      
        '   SUM(VBEM.VALULTCMREAVACUM - VBEM.BXVALULTCMREAVACUM)         ' +
        '        AS ULTREAVCMBEM,'
      
        '   SUM(VBEM.VALULTDEPREAVACUM - VBEM.BXVALULTDEPREAVACUM)       ' +
        '        AS ULTREAVDEPLANC,'
      
        '   SUM(VBEM.VALULTCMDEPREAVACUM - VBEM.BXVALULTCMDEPREAVACUM)   ' +
        '        AS ULTREAVCMDEP'
      ''
      'FROM'
      '  ('
      '   (SELECT /* CUSTO */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           HM.IDTAXADEP,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,01,NVL(VM.VALOR,0),'
      '                                            41,NVL(VM.VALOR,0),'
      
        '                                            07,NVL(VM.VALOR,0),0' +
        ')) AS  VALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,09,NVL(VM.VALOR,0),'
      
        '                                            49,NVL(VM.VALOR,0),0' +
        ')) AS  VALACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(VM.VALOR,0),'
      
        '                                            42,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,34,NVL(VM.VALOR,0),'
      
        '                                            50,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,06,NVL(VM.VALOR,0),'
      
        '                                            13,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,37,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALACRESACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,25,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,38,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMDEPREAVACUM'
      '    FROM HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :PIDBEM)'
      '      AND (HM.IDPESSOA = :PIDPESSOA)'
      '      AND (HM.DATAMOVIMENTACAO >= :PDATASLD)'
      '      AND (HM.IDTAXADEP IS NULL)'
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,HM.IDTAXADEP) UNION'
      ''
      '   (SELECT /* DEPRECIACAO */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           HM.IDTAXADEP,'
      
        '           (0)                                                  ' +
        '   AS  VALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(VM.VALOR,0),'
      '                                            17,NVL(VM.VALOR,0),'
      
        '                                            43,NVL(VM.VALOR,0),0' +
        ')) AS  VALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,35,NVL(VM.VALOR,0),'
      
        '                                            51,NVL(VM.VALOR,0),0' +
        ')) AS  VALDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,21,NVL(VM.VALOR,0),'
      
        '                                            44,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,36,NVL(VM.VALOR,0),'
      
        '                                            52,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMACRESACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,24,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,39,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALDEPACRESACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,26,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,40,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMDEPREAVACUM'
      '    FROM HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :PIDBEM)'
      '      AND (HM.IDPESSOA = :PIDPESSOA)'
      '      AND (HM.DATAMOVIMENTACAO >= :PDATASLD)'
      '      AND (HM.IDTAXADEP = :PIDTAXADEP)'
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,HM.IDTAXADEP) UNION'
      ''
      '   (SELECT /* CUSTO REAVALIACAO */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           HM.IDTAXADEP,'
      
        '           (0)                                                  ' +
        '   AS  VALBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(VM.VALOR,0),'
      '                                            32,NVL(VM.VALOR,0),'
      
        '                                            45,NVL(VM.VALOR,0),0' +
        ')) AS  VALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(VM.VALOR,0),'
      
        '                                            46,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALBEMACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMBEMACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMDEPREAVACUM'
      
        '    FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R, VLRHISTMOVBEM ' +
        'VM'
      '    WHERE (HM.IDBEM = :PIDBEM)'
      '      AND (HM.IDPESSOA = :PIDPESSOA)'
      '      AND (HM.DATAMOVIMENTACAO >= :PDATASLD)'
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (R.FLGULTREAVAL = 0)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,HM.IDTAXADEP) UNION'
      ''
      '   (SELECT /* DEPRECIACAO REAVALIACAO */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           HM.IDTAXADEP,'
      
        '           (0)                                                  ' +
        '   AS  VALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(VM.VALOR,0),'
      '                                            33,NVL(VM.VALOR,0),'
      
        '                                            47,NVL(VM.VALOR,0),0' +
        ')) AS  VALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,19,NVL(VM.VALOR,0),'
      
        '                                            48,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPBEMACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPBEMACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMDEPREAVACUM'
      
        '    FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R, VLRHISTMOVBEM ' +
        'VM'
      '    WHERE (HM.IDBEM = :PIDBEM)'
      '      AND (HM.IDPESSOA = :PIDPESSOA)'
      '      AND (HM.DATAMOVIMENTACAO >= :PDATASLD)'
      '      AND (HM.IDTAXADEP = :PIDTAXADEP)'
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (R.FLGULTREAVAL = 0)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,HM.IDTAXADEP) UNION'
      ''
      '   (SELECT /* CUSTO ULTIMA REAVALIACAO */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           HM.IDTAXADEP,'
      
        '           (0)                                                  ' +
        '   AS  VALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(VM.VALOR,0),'
      '                                            32,NVL(VM.VALOR,0),'
      
        '                                            45,NVL(VM.VALOR,0),0' +
        ')) AS  VALULTREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(VM.VALOR,0),'
      
        '                                            46,NVL(VM.VALOR,0),0' +
        ')) AS  VALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMDEPREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALULTREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMDEPREAVACUM'
      
        '    FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R, VLRHISTMOVBEM ' +
        'VM'
      '    WHERE (HM.IDBEM = :PIDBEM)'
      '      AND (HM.IDPESSOA = :PIDPESSOA)'
      '      AND (HM.DATAMOVIMENTACAO >= :PDATASLD)'
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (R.FLGULTREAVAL = 1)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,HM.IDTAXADEP) UNION'
      ''
      '   (SELECT /* DEPRECIACAO ULTIMA REAVALIACAO */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           HM.IDTAXADEP,'
      
        '           (0)                                                  ' +
        '   AS  VALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(VM.VALOR,0),'
      '                                            33,NVL(VM.VALOR,0),'
      
        '                                            47,NVL(VM.VALOR,0),0' +
        ')) AS  VALULTDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,19,NVL(VM.VALOR,0),'
      
        '                                            48,NVL(VM.VALOR,0),0' +
        ')) AS  VALULTCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALULTDEPREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALULTCMDEPREAVACUM'
      
        '    FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R, VLRHISTMOVBEM ' +
        'VM'
      '    WHERE (HM.IDBEM = :PIDBEM)'
      '      AND (HM.IDPESSOA = :PIDPESSOA)'
      '      AND (HM.DATAMOVIMENTACAO >= :PDATASLD)'
      '      AND (HM.IDTAXADEP = :PIDTAXADEP)'
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (R.FLGULTREAVAL = 1)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,HM.IDTAXADEP)'
      '  )  VBEM'
      ''
      
        'GROUP BY VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO, VBEM.' +
        'MOECODIGO, VBEM.IDTAXADEP'
      '')
    Left = 143
    Top = 22
  end
  object sqlSaldoContabBem: TCMSqlParams
    SQL.Strings = (
      'SELECT SCB.IDBEM, SCB.IDPESSOA, SCB.DATASLDBEM, SCB.MOECODIGO,'
      '       SCB.VALORG, SCB.CMBEM,'
      '       SCB.REAVVALORG, SCB.REAVCMBEM,'
      '       SCB.ULTREAVVALORG, SCB.ULTREAVCMBEM,'
      '       SCB.IDGRUPO, SCB.IDLOCALIZACAO, SCB.IDRESPONSAVEL'
      'FROM SALDOCONTABBEM SCB,'
      '     (SELECT IDBEM, IDPESSOA, MOECODIGO, MAX(DATASLDBEM) AS DATA'
      '      FROM SALDOCONTABBEM'
      '      WHERE (IDBEM = :IDBEM)'
      '        AND (IDPESSOA = :IDPESSOA)'
      '        AND (MOECODIGO = :MOECODIGO)'
      '        AND (DATASLDBEM <= :DATASLD)'
      '      GROUP BY IDBEM, IDPESSOA, MOECODIGO) DTAMAX'
      'WHERE (SCB.IDBEM = :IDBEM)'
      '  AND (SCB.IDPESSOA = :IDPESSOA)'
      '  AND (SCB.MOECODIGO = :MOECODIGO)'
      '  AND (SCB.IDBEM = DTAMAX.IDBEM)'
      '  AND (SCB.IDPESSOA = DTAMAX.IDPESSOA)'
      '  AND (SCB.MOECODIGO = DTAMAX.MOECODIGO)'
      '  AND (SCB.DATASLDBEM = DTAMAX.DATA)'
      'ORDER BY DATASLDBEM'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 40
    Top = 22
  end
  object sqlSldCtbBemxDep: TCMSqlParams
    SQL.Strings = (
      
        'SELECT SCB.IDBEM, SCB.IDPESSOA, SCB.MOECODIGO, SCB.IDSLDCTBBEMXD' +
        'EP, SCB.DATASLDBEM, '
      '       SCB.DEPLANC, SCB.CMDEP,'
      '       SCB.REAVDEPLANC, SCB.REAVCMDEP,'
      '       SCB.ULTREAVDEPLANC, SCB.ULTREAVCMDEP'
      'FROM SLDCTBBEMXDEP SCB,'
      
        '     (SELECT IDBEM, IDPESSOA, MOECODIGO, IDSLDCTBBEMXDEP, MAX(DA' +
        'TASLDBEM) AS DATA'
      '      FROM SLDCTBBEMXDEP'
      '      WHERE (IDBEM = :IDBEM)'
      '        AND (IDPESSOA = :IDPESSOA)'
      '        AND (MOECODIGO = :MOECODIGO)'
      '        AND (IDSLDCTBBEMXDEP = :IDTAXADEP)'
      '        AND (DATASLDBEM <= :DATASLD)'
      
        '      GROUP BY IDBEM, IDPESSOA, MOECODIGO, IDSLDCTBBEMXDEP) DTAM' +
        'AX'
      'WHERE (SCB.IDBEM = :IDBEM)'
      '  AND (SCB.IDPESSOA = :IDPESSOA)'
      '  AND (SCB.MOECODIGO = :MOECODIGO)'
      '  AND (SCB.IDSLDCTBBEMXDEP = :IDTAXADEP)'
      '  AND (SCB.IDBEM = DTAMAX.IDBEM)'
      '  AND (SCB.IDPESSOA = DTAMAX.IDPESSOA)'
      '  AND (SCB.DATASLDBEM = DTAMAX.DATA)'
      '  AND (SCB.MOECODIGO = DTAMAX.MOECODIGO)'
      '  AND (SCB.IDSLDCTBBEMXDEP = DTAMAX.IDSLDCTBBEMXDEP)'
      'ORDER BY SCB.IDSLDCTBBEMXDEP, SCB.DATASLDBEM'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 40
    Top = 9
  end
  object sqlMovTransf: TCMSqlParams
    SQL.Strings = (
      'SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO, DATAMOVIMENTACAO,'
      '       IDGRUPANT, IDLOCALANT, IDRESPANT'
      'FROM HISTORICOMOVIMENTACAO'
      'WHERE (IDBEM    = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '  AND ((IDTIPOMOVIMENTACAO = 05) OR'
      '       (IDTIPOMOVIMENTACAO = 11) OR'
      '       (IDTIPOMOVIMENTACAO = 12))'
      'ORDER BY DATAMOVIMENTACAO DESC, IDMOVIMENTACAO DESC'
      '')
    Left = 144
    Top = 8
  end
  object sqlRateioPatroxBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT PPB.IDBEM,PPB.IDPESSOA,PPB.IDPLANOPREV,PPB.IDPATRO,PPB.PP' +
        'BPERCRATEIO,'
      '       P.NOME AS NOMEPATRO, PLANO.NOME AS NOMEPLANOPREV '
      'FROM PLANOPATROXBEM PPB,'
      '     PLANPREVCONTABIL PLANO,'
      '     PATRO,'
      '     PESSOA P'
      'WHERE (PPB.IDBEM = :IDBEM)'
      '  AND (PPB.IDPESSOA = :IDPESSOA)'
      '  AND (PPB.IDPLANOPREV = PLANO.IDPLANOPREV(+))'
      '  AND (PPB.IDPATRO = PATRO.IDPESSOA(+))'
      '  AND (PATRO.IDPESSOA = P.IDPESSOA(+))'
      ''
      ' ')
    Left = 241
    Top = 22
  end
  object sqlBemxDep: TCMSqlParams
    SQL.Strings = (
      'SELECT BD.IDBEM, BD.IDPESSOA, BD.MOECODIGO, M.MOEDESC,'
      '       BD.IDBEMXDEP, BD.TAXADEP, GD.DESCTAXADEP,'
      '       BD.DEPLANC, BD.CMDEP'
      'FROM BEMXDEP BD,'
      '     MOEDA M,'
      '     BEM B,'
      '     GRUPOTAXADEP GD'
      'WHERE (BD.IDPESSOA = :IDPESSOA)'
      '  AND (BD.IDBEM = :IDBEM)'
      '  AND (BD.MOECODIGO = :MOECODIGO)'
      '  AND (BD.MOECODIGO = M.MOECODIGO)'
      '  AND (BD.IDBEM     = B.IDBEM)'
      '  AND (BD.IDPESSOA  = B.IDPESSOA)'
      '  AND (B.IDGRUPO    = GD.IDGRUPO)'
      '  AND (B.IDPESSOA   = GD.IDPESSOA)'
      '  AND (BD.IDBEMXDEP = GD.IDTAXADEP)'
      '')
    Left = 240
    Top = 8
  end
  object sqlDeprecBemxDep: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IDBEM, IDPESSOA, MOECODIGO, IDBEMXDEP, TAXADEP, DEPLANC, ' +
        'CMDEP'
      'FROM BEMXDEP'
      'WHERE (IDBEM = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '  AND (MOECODIGO = :MOECODIGO)'
      ' ')
    Left = 48
    Top = 108
  end
  object sqlDeprecBemxMoeda: TCMSqlParams
    SQL.Strings = (
      'SELECT IDBEM, IDPESSOA, MOECODIGO, VALORG, CMBEM'
      'FROM BEMXMOEDA'
      'WHERE (IDBEM = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '')
    Left = 48
    Top = 93
  end
  object sqlDeprecBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT B.IDBEM, B.IDPESSOA, B.IDMODULO, B.BAIXATOTAL, B.UNIDNEGO' +
        'C, B.DTAINCLUSAO, B.FLGDEPREC,'
      
        '       B.DATAULTDEP, B.IDGRUPO, B.DESBEM, B.IDCONJUNTO, B.DATAIN' +
        'ICIODEP,'
      
        '       NVL(B.CODSUBCONTA,0) AS CODSUBCONTA, B.PLACA, C.IDLOCALIZ' +
        'ACAO, C.IDRESPONSAVEL,'
      '       G.NOME AS DESCGRUPO'
      'FROM   BEM B,'
      '       GRUPO G,'
      '       CONJUNTO C'
      'WHERE (B.IDPESSOA = :PIDPESSOA)'
      '  AND ((B.BAIXATOTAL <> '#39'S'#39') OR (B.BAIXATOTAL IS NULL))'
      
        '  AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (B.CONTROLE = '#39'T'#39')'
      '  AND (B.REGISTRO = '#39'I'#39')'
      '  AND (B.DATAINICIODEP <= :PDATAMOV)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      'ORDER BY B.IDGRUPO, B.IDBEM'
      ' '
      ' '
      ' '
      ' ')
    Left = 48
    Top = 80
  end
  object sqlDeprecReavalxDep: TCMSqlParams
    SQL.Strings = (
      
        'SELECT R.IDBEM, R.IDPESSOA, RD.IDREAVALIACAO, RD.MOECODIGO, RD.I' +
        'DREAVALXDEP,'
      '       RD.TAXADEP, RD.DEPLANC, RD.CMDEP'
      'FROM REAVALXDEP RD,'
      '     REAVALIACAO R'
      'WHERE (R.IDBEM = :IDBEM)'
      '  AND (R.IDPESSOA = :IDPESSOA)'
      '  AND (RD.MOECODIGO = :MOECODIGO)'
      '  AND (R.IDREAVALIACAO = RD.IDREAVALIACAO)')
    Left = 167
    Top = 107
  end
  object sqlDeprecReavalxMoeda: TCMSqlParams
    SQL.Strings = (
      
        'SELECT R.IDBEM, R.IDPESSOA, RM.IDREAVALIACAO, RM.MOECODIGO, RM.V' +
        'ALORG, RM.CMBEM'
      'FROM REAVALXMOEDA RM,'
      '     REAVALIACAO R'
      'WHERE (R.IDBEM = :IDBEM)'
      '  AND (R.IDPESSOA = :IDPESSOA)'
      '  AND (R.IDREAVALIACAO = RM.IDREAVALIACAO)'
      '')
    Left = 166
    Top = 93
  end
  object sqlDeprecReavaliacao: TCMSqlParams
    SQL.Strings = (
      
        'SELECT R.IDBEM, R.IDPESSOA, R.DATAREAVALIACAO, R.DATAULTDEP, R.F' +
        'LGULTREAVAL,'
      '       R.IDREAVALIACAO, R.IDMOVIMENTACAO, R.FLGDEPREC, B.PLACA,'
      
        '       B.IDGRUPO, B.DESBEM, B.DATAINICIODEP, B.IDCONJUNTO, B.UNI' +
        'DNEGOC,'
      
        '       NVL(B.CODSUBCONTA,0) AS CODSUBCONTA, C.IDLOCALIZACAO,C.ID' +
        'RESPONSAVEL,'
      '       G.NOME AS DESCGRUPO'
      'FROM   BEM B,'
      '       REAVALIACAO R,'
      '       GRUPO G,'
      '       CONJUNTO C'
      'WHERE (B.IDPESSOA =  :PIDPESSOA)'
      '  AND ((R.FLGDEPREC = 0) OR (R.FLGDEPREC IS NULL))'
      '  AND ((B.BAIXATOTAL = '#39'N'#39') OR (B.BAIXATOTAL IS NULL))'
      
        '  AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (R.DATAREAVALIACAO <= :PDATAMOV )'
      '  AND (B.CONTROLE   = '#39'T'#39')'
      '  AND (B.REGISTRO   = '#39'I'#39')'
      '  AND (R.IDBEM      = B.IDBEM)'
      '  AND (R.IDPESSOA   = B.IDPESSOA)'
      '  AND (B.IDGRUPO    = G.IDGRUPO)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      ''
      ' '
      ' '
      ' ')
    Left = 166
    Top = 80
  end
  object sqlDeprecAcrescValorxDep: TCMSqlParams
    SQL.Strings = (
      
        'SELECT A.IDBEM, A.IDPESSOA, AD.IDACRESCIMO, AD.MOECODIGO, AD.IDA' +
        'CRESCIMOXDEP,'
      '       AD.TAXADEP, AD.DEPLANC, AD.CMDEP'
      'FROM ACRESCVALORXDEP AD,'
      '     ACRESCIMOVALOR A'
      'WHERE (A.IDBEM = :IDBEM)'
      '  AND (A.IDPESSOA = :IDPESSOA)'
      '  AND (AD.MOECODIGO = :MOECODIGO)'
      '  AND (A.IDACRESCIMO = AD.IDACRESCIMO)'
      '')
    Left = 304
    Top = 107
  end
  object sqlDeprecAcrescValorxMoeda: TCMSqlParams
    SQL.Strings = (
      
        'SELECT A.IDBEM, A.IDPESSOA, AV.IDACRESCIMO, AV.MOECODIGO, AV.VAL' +
        'ORG, AV.CMBEM'
      'FROM ACRESCVALORXMOEDA AM,'
      '     ACRESCIMOVALOR A'
      'WHERE (A.IDBEM = :IDBEM)'
      '  AND (A.IDPESSOA = :IDPESSOA)'
      '  AND (A.IDACRESCIMO = AM.IDACRESCIMO)'
      '')
    Left = 304
    Top = 93
  end
  object sqlDeprecAcrescimoValor: TCMSqlParams
    SQL.Strings = (
      
        'SELECT A.IDBEM, A.IDPESSOA, A.DATAACRESCIMO, A.DATAULTDEP, A.IDA' +
        'CRESCIMO,'
      
        '       A.IDMOVIMENTACAO, A.FLGDEPREC, B.UNIDNEGOC, NVL(B.CODSUBC' +
        'ONTA,0) AS CODSUBCONTA,'
      
        '       B.PLACA, B.IDGRUPO, B.DESBEM, B.DATAINICIODEP, B.IDCONJUN' +
        'TO,'
      '       C.IDLOCALIZACAO, C.IDRESPONSAVEL, G.NOME AS DESCGRUPO'
      'FROM   BEM B,'
      '       ACRESCIMOVALOR A,'
      '       GRUPO G,'
      '       CONJUNTO C'
      'WHERE (B.IDPESSOA      =  :PIDPESSOA)'
      '  AND ((A.FLGDEPREC = 0) OR (A.FLGDEPREC IS NULL))'
      '  AND ((B.BAIXATOTAL    = '#39'N'#39') OR (B.BAIXATOTAL IS NULL))'
      
        '  AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (A.DATAACRESCIMO <= :PDATAMOV)'
      '  AND (B.CONTROLE      = '#39'T'#39')'
      '  AND (B.REGISTRO      = '#39'I'#39')'
      '  AND (A.IDBEM         = B.IDBEM)'
      '  AND (A.IDPESSOA      = B.IDPESSOA)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      ''
      ''
      ' ')
    Left = 304
    Top = 79
  end
end
