inherited dtmMTBem: TdtmMTBem
  OldCreateOrder = True
  Left = 65532
  Top = 65532
  Height = 580
  Width = 808
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
      '           VM.IDTAXADEP,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,01,NVL(VM.VALOR,0),'
      '                                            03,NVL(VM.VALOR,0),'
      '                                            41,NVL(VM.VALOR,0),'
      '                                            10,NVL(VM.VALOR,0),'
      '                                            07,NVL(VM.VALOR,0),'
      
        '                                            81,NVL(VM.VALOR,0),0' +
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
      '                                            16,NVL(VM.VALOR,0),'
      '                                            13,NVL(VM.VALOR,0),'
      
        '                                            83,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,37,NVL(VM.VALOR,0),'
      
        '                                            91,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,25,NVL(VM.VALOR,0),'
      
        '                                            84,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,38,NVL(VM.VALOR,0),'
      
        '                                            92,NVL(VM.VALOR,0),0' +
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
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (VM.IDTAXADEP = 0)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,VM.IDTAXADEP) UNION'
      ''
      '   (SELECT /* DEPRECIACAO */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
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
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,24,NVL(VM.VALOR,0),'
      
        '                                            85,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,39,NVL(VM.VALOR,0),'
      
        '                                            93,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,26,NVL(VM.VALOR,0),'
      
        '                                            86,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,40,NVL(VM.VALOR,0),'
      
        '                                            94,NVL(VM.VALOR,0),0' +
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
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (VM.IDTAXADEP = :PIDTAXADEP)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,VM.IDTAXADEP) UNION'
      ''
      '   (SELECT /* CUSTO REAVALIACAO */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
        '           (0)                                                  ' +
        '   AS  VALBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(VM.VALOR,0),'
      '                                            32,NVL(VM.VALOR,0),'
      '                                            82,NVL(VM.VALOR,0),'
      
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
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(VM.VALOR,0),'
      
        '                                            87,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(VM.VALOR,0),'
      
        '                                            88,NVL(VM.VALOR,0),0' +
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
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (R.FLGULTREAVAL = 0)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,VM.IDTAXADEP) UNION'
      ''
      '   (SELECT /* DEPRECIACAO REAVALIACAO */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
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
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(VM.VALOR,0),'
      
        '                                            89,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(VM.VALOR,0),'
      
        '                                            90,NVL(VM.VALOR,0),0' +
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
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (VM.IDTAXADEP = :PIDTAXADEP)'
      '      AND (R.FLGULTREAVAL = 0)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,VM.IDTAXADEP) UNION'
      ''
      '   (SELECT /* CUSTO ULTIMA REAVALIACAO */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
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
      '                                            82,NVL(VM.VALOR,0),'
      
        '                                            45,NVL(VM.VALOR,0),0' +
        ')) AS  VALULTREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(VM.VALOR,0),'
      
        '                                            46,NVL(VM.VALOR,0),0' +
        ')) AS  VALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(VM.VALOR,0),'
      
        '                                            87,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALULTREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(VM.VALOR,0),'
      
        '                                            88,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMDEPREAVACUM'
      
        '    FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R, VLRHISTMOVBEM ' +
        'VM'
      '    WHERE (HM.IDBEM = :PIDBEM)'
      '      AND (HM.IDPESSOA = :PIDPESSOA)'
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (R.FLGULTREAVAL = 1)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,VM.IDTAXADEP) UNION'
      ''
      '   (SELECT /* DEPRECIACAO ULTIMA REAVALIACAO */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
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
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(VM.VALOR,0),'
      
        '                                            89,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALULTDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(VM.VALOR,0),'
      
        '                                            90,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALULTCMDEPREAVACUM'
      
        '    FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R, VLRHISTMOVBEM ' +
        'VM'
      '    WHERE (HM.IDBEM = :PIDBEM)'
      '      AND (HM.IDPESSOA = :PIDPESSOA)'
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (VM.IDTAXADEP = :PIDTAXADEP)'
      '      AND (R.FLGULTREAVAL = 1)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,VM.IDTAXADEP)'
      '  )  VBEM'
      ''
      
        'GROUP BY VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO, VBEM.' +
        'MOECODIGO, VBEM.IDTAXADEP'
      '')
    Left = 127
    Top = 27
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
      'ORDER BY SCB.DATASLDBEM'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 24
    Top = 27
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
    Left = 24
    Top = 14
  end
  object sqlMovTransf: TCMSqlParams
    SQL.Strings = (
      
        'SELECT HM.IDMOVIMENTACAO, HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENT' +
        'ACAO,'
      '       HM.IDGRUPANT, HM.IDLOCALANT, HM.IDRESPANT,'
      '       G.IDGRUPO, L.IDLOCALIZACAO, R.IDRESPONSAVEL'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     PLANOGRUPO G,'
      '     LOCALIZACAO L,'
      '     RESPONSAVEL R'
      'WHERE (HM.IDBEM = :IDBEM)'
      '  AND (HM.IDPESSOA = :IDPESSOA)'
      '  AND ((HM.IDTIPOMOVIMENTACAO = 05) OR'
      '       (HM.IDTIPOMOVIMENTACAO = 11) OR'
      '       (HM.IDTIPOMOVIMENTACAO = 12))'
      '  AND (HM.IDGRUPANT = G.IDGRUPO(+))'
      '  AND (HM.IDPESSOA = G.IDPESSOA(+))'
      '  AND (HM.IDLOCALANT = L.IDLOCALIZACAO(+))'
      '  AND (HM.IDPESSOA = L.IDPESSOA(+))'
      '  AND (HM.IDRESPANT = R.IDRESPONSAVEL(+))'
      'ORDER BY DATAMOVIMENTACAO DESC, IDMOVIMENTACAO'
      '')
    Left = 128
    Top = 13
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
    Left = 225
    Top = 27
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
    Left = 224
    Top = 13
  end
  object sqlProRataAcrescValorxDep: TCMSqlParams
    SQL.Strings = (
      'SELECT AD.IDACRESCIMO, AD.MOECODIGO, AD.IDACRESCIMOXDEP,'
      '       AD.TAXADEP, AD.DEPLANC, AD.CMDEP,'
      '       AD.DATAULTDEP, AD.DATAULTCM, AD.FLGDEPREC'
      'FROM ACRESCVALORXDEP AD'
      'WHERE (AD.IDACRESCIMO = :IDACRESCIMO)'
      '  AND (AD.MOECODIGO = :MOECODIGO)')
    Left = 208
    Top = 115
  end
  object sqlProRataAcrescValorxMoeda: TCMSqlParams
    SQL.Strings = (
      'SELECT AM.IDACRESCIMO, AM.MOECODIGO,'
      '       AM.VALORG, AM.CMBEM, AM.DATAULTCM'
      'FROM ACRESCVALORXMOEDA AM'
      'WHERE (AM.IDACRESCIMO = :IDACRESCIMO)')
    Left = 208
    Top = 101
  end
  object sqlProRataReavalxDep: TCMSqlParams
    SQL.Strings = (
      'SELECT RD.IDREAVALIACAO, RD.MOECODIGO, RD.IDREAVALXDEP,'
      '       RD.TAXADEP, RD.DEPLANC, RD.CMDEP,'
      '       RD.DATAULTDEP, RD.DATAULTCM, RD.FLGDEPREC'
      'FROM REAVALXDEP RD'
      'WHERE (RD.IDREAVALIACAO = :IDREAVALIACAO)'
      '  AND (RD.MOECODIGO = :MOECODIGO)')
    Left = 47
    Top = 114
  end
  object sqlProRataReavalxMoeda: TCMSqlParams
    SQL.Strings = (
      'SELECT RM.IDREAVALIACAO, RM.MOECODIGO,'
      '       RM.VALORG, RM.CMBEM, RM.DATAULTCM'
      'FROM REAVALXMOEDA RM'
      'WHERE (RM.IDREAVALIACAO = :IDREAVALIACAO)'
      '')
    Left = 46
    Top = 100
  end
  object sqlFechamentoReavalxDep: TCMSqlParams
    SQL.Strings = (
      
        'SELECT R.IDBEM, R.IDPESSOA, RD.IDREAVALIACAO, RD.MOECODIGO, RD.I' +
        'DREAVALXDEP,'
      '       RD.TAXADEP, RD.DEPLANC, RD.CMDEP,'
      '       RD.DATAULTDEP, RD.DATAULTCM, RD.FLGDEPREC'
      'FROM REAVALXDEP RD,'
      '     REAVALIACAO R'
      'WHERE (R.IDBEM = :IDBEM)'
      '  AND (R.IDPESSOA = :IDPESSOA)'
      '  AND (RD.MOECODIGO = :MOECODIGO)'
      '  AND (R.IDREAVALIACAO = RD.IDREAVALIACAO)')
    Left = 47
    Top = 88
  end
  object sqlFechamentoReavalxMoeda: TCMSqlParams
    SQL.Strings = (
      'SELECT R.IDBEM, R.IDPESSOA, RM.IDREAVALIACAO, RM.MOECODIGO,'
      '       RM.VALORG, RM.CMBEM, RM.DATAULTCM'
      'FROM REAVALXMOEDA RM,'
      '     REAVALIACAO R'
      'WHERE (R.IDBEM = :IDBEM)'
      '  AND (R.IDPESSOA = :IDPESSOA)'
      '  AND (R.IDREAVALIACAO = RM.IDREAVALIACAO)'
      '')
    Left = 46
    Top = 74
  end
  object sqlFechamentoAcrescValorxDep: TCMSqlParams
    SQL.Strings = (
      
        'SELECT A.IDBEM, A.IDPESSOA, AD.IDACRESCIMO, AD.MOECODIGO, AD.IDA' +
        'CRESCIMOXDEP,'
      '       AD.TAXADEP, AD.DEPLANC, AD.CMDEP,'
      '       AD.DATAULTDEP, AD.DATAULTCM, AD.FLGDEPREC'
      'FROM ACRESCVALORXDEP AD,'
      '     ACRESCIMOVALOR A'
      'WHERE (A.IDBEM = :IDBEM)'
      '  AND (A.IDPESSOA = :IDPESSOA)'
      '  AND (AD.MOECODIGO = :MOECODIGO)'
      '  AND (A.IDACRESCIMO = AD.IDACRESCIMO)'
      '')
    Left = 208
    Top = 88
  end
  object sqlFechamentoAcrescValorxMoeda: TCMSqlParams
    SQL.Strings = (
      'SELECT A.IDBEM, A.IDPESSOA, AM.IDACRESCIMO, AM.MOECODIGO,'
      '       AM.VALORG, AM.CMBEM, AM.DATAULTCM'
      'FROM ACRESCVALORXMOEDA AM,'
      '     ACRESCIMOVALOR A'
      'WHERE (A.IDBEM = :IDBEM)'
      '  AND (A.IDPESSOA = :IDPESSOA)'
      '  AND (A.IDACRESCIMO = AM.IDACRESCIMO)')
    Left = 208
    Top = 74
  end
  object sqlRemSldCtbxDep: TCMSqlParams
    SQL.Strings = (
      'DELETE FROM SLDCTBBEMXDEP'
      'WHERE IDBEM = :IDBEM'
      '  AND IDPESSOA = :IDPESSOA'
      '')
    Left = 39
    Top = 224
  end
  object sqlRemSaldoContab: TCMSqlParams
    SQL.Strings = (
      'DELETE FROM SALDOCONTABBEM'
      'WHERE IDBEM = :IDBEM'
      '  AND IDPESSOA = :IDPESSOA'
      '')
    Left = 39
    Top = 209
  end
  object sqlRemSaldoContabBem: TCMSqlParams
    SQL.Strings = (
      'DELETE FROM SALDOCONTABBEM SCB'
      'WHERE (EXISTS (SELECT B.IDBEM'
      '               FROM BEM B,'
      '                    GRUPO G,'
      '                    PLANOGRUPO PG'
      '               WHERE (G.FLGIMOVEL = :PFLGIMOVEL)'
      ''
      ''
      '                 AND (B.IDPESSOA   = :IDPESSOA)'
      '                 AND (PG.IDPESSOA  = :IDPESSOA)'
      '                 AND (B.IDGRUPO    = G.IDGRUPO)'
      '                 AND (G.IDGRUPO    = PG.IDGRUPO)'
      '                 AND (SCB.IDBEM    = B.IDBEM(+))'
      '                 AND (SCB.IDPESSOA = B.IDPESSOA(+)) ))'
      ' ')
    Left = 40
    Top = 196
  end
  object sqlRemSldCtbBemxDep: TCMSqlParams
    SQL.Strings = (
      'DELETE FROM SLDCTBBEMXDEP SCB'
      'WHERE (EXISTS (SELECT B.IDBEM'
      '               FROM BEM B,'
      '                    GRUPO G,'
      '                    PLANOGRUPO PG'
      '               WHERE (G.FLGIMOVEL = :PFLGIMOVEL)'
      ''
      ''
      '                 AND (B.IDPESSOA   = :IDPESSOA)'
      '                 AND (PG.IDPESSOA  = :IDPESSOA)'
      '                 AND (B.IDGRUPO    = G.IDGRUPO)'
      '                 AND (G.IDGRUPO    = PG.IDGRUPO)'
      '                 AND (SCB.IDBEM    = B.IDBEM(+))'
      '                 AND (SCB.IDPESSOA = B.IDPESSOA(+)) ))'
      ' ')
    Left = 40
    Top = 183
  end
  object sqlRemSaldoContabGrupo: TCMSqlParams
    SQL.Strings = (
      'DELETE /*+ RULE */'
      'FROM SALDOCONTABBEM SCB'
      'WHERE (SCB.IDBEM, SCB.IDPESSOA) IN (SELECT B.IDBEM, B.IDPESSOA'
      '                                    FROM BEM B'
      '                                    WHERE B.IDGRUPO = :IDGRUPO'
      '                                      AND B.IDPESSOA = :IDPESSOA'
      '                                      AND B."IDBEM" >= -1E38)'
      '')
    Left = 40
    Top = 170
  end
  object sqlRemSldCtbGrupoxDep: TCMSqlParams
    SQL.Strings = (
      'DELETE /*+ RULE */'
      'FROM SLDCTBBEMXDEP SCB'
      'WHERE (SCB.IDBEM, SCB.IDPESSOA) IN (SELECT B.IDBEM, B.IDPESSOA'
      '                                    FROM BEM B'
      '                                    WHERE B.IDGRUPO = :IDGRUPO'
      '                                      AND B.IDPESSOA = :IDPESSOA'
      '                                      AND B."IDBEM" >= -1E38)'
      ''
      '/*DELETE FROM SLDCTBBEMXDEP SCB'
      'WHERE (EXISTS (SELECT B.IDBEM, B.IDPESSOA'
      '               FROM BEM B'
      '               WHERE B.IDGRUPO = :IDGRUPO'
      '                 AND B.IDPESSOA = :IDPESSOA'
      '                 AND SCB.IDBEM = B.IDBEM'
      '                 AND SCB.IDPESSOA = B.IDPESSOA)) */'
      '')
    Left = 40
    Top = 157
  end
  object sqlRemSaldoContabConj: TCMSqlParams
    SQL.Strings = (
      'DELETE FROM SALDOCONTABBEM SCB'
      'WHERE (EXISTS (SELECT B.IDBEM'
      '               FROM BEM B,'
      '                    GRUPO G,'
      '                    PLANOGRUPO PG'
      '               WHERE (G.FLGIMOVEL  = :PFLGIMOVEL)'
      '                 AND (B.IDCONJUNTO = :PIDCONJUNTO)'
      '                 AND (B.IDPESSOA   = :IDPESSOA)'
      '                 AND (PG.IDPESSOA  = :IDPESSOA)'
      '                 AND (B.IDGRUPO    = G.IDGRUPO)'
      '                 AND (G.IDGRUPO    = PG.IDGRUPO)'
      '                 AND (SCB.IDBEM    = B.IDBEM(+))'
      '                 AND (SCB.IDPESSOA = B.IDPESSOA(+)) ))'
      ' '
      ' '
      '')
    Left = 40
    Top = 145
  end
  object sqlRemSldCtbConjxDep: TCMSqlParams
    SQL.Strings = (
      'DELETE FROM SLDCTBBEMXDEP SCB'
      'WHERE (EXISTS (SELECT B.IDBEM'
      '               FROM BEM B,'
      '                    GRUPO G,'
      '                    PLANOGRUPO PG'
      '               WHERE (G.FLGIMOVEL  = :PFLGIMOVEL)'
      '                 AND (B.IDCONJUNTO = :PIDCONJUNTO)'
      '                 AND (B.IDPESSOA   = :IDPESSOA)'
      '                 AND (PG.IDPESSOA  = :IDPESSOA)'
      '                 AND (B.IDGRUPO    = G.IDGRUPO)'
      '                 AND (G.IDGRUPO    = PG.IDGRUPO)'
      '                 AND (SCB.IDBEM    = B.IDBEM(+))'
      '                 AND (SCB.IDPESSOA = B.IDPESSOA(+)) ))'
      ' '
      ' '
      'DELETE FROM SLDCTBBEMXDEP SCB'
      'WHERE ( EXISTS ( SELECT B.IDBEM'
      '                 FROM LEFT OUTER JOIN BEM B'
      '                      ON  ( SCB.IDBEM = B.IDBEM )'
      '                      AND ( SCB.IDPESSOA = B.IDPESSOA )'
      '                 WHERE ( G.FLGIMOVEL = :PFLGIMOVEL )'
      '                   AND ( B.IDCONJUNTO = :PIDCONJUNTO )'
      '                   AND ( B.IDPESSOA=:IDPESSOA )'
      '                   AND ( PG.IDPESSOA=:IDPESSOA )'
      '                   AND ( B.IDGRUPO=G.IDGRUPO )'
      '                   AND ( G.IDGRUPO=PG.IDGRUPO ) ) )'
      ''
      '')
    Left = 40
    Top = 132
  end
  object sqlUpdSCBTransf: TCMSqlParams
    SQL.Strings = (
      'update SALDOCONTABBEM'
      'set'
      '  IDGRUPO = :IDGRUPO,'
      '  IDLOCALIZACAO = :IDLOCALIZACAO,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL'
      'where'
      '  IDBEM = :IDBEM and'
      '  IDPESSOA = :IDPESSOA and'
      '  DATASLDBEM = :DATASLDBEM')
    Left = 161
    Top = 301
  end
  object sqlRCMovTransf: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */ IDBEM,'
      '       IDPESSOA,'
      '       DATAMOVIMENTACAO,'
      '       IDMOVIMENTACAO,'
      '       IDTIPOMOVIMENTACAO,'
      '       IDGRUPANT,'
      '       IDLOCALANT,'
      '       IDRESPANT'
      '  FROM HISTORICOMOVIMENTACAO'
      ' WHERE IDBEM + 0 = :IDBEM'
      '   AND (IDTIPOMOVIMENTACAO = 05'
      '         OR IDTIPOMOVIMENTACAO = 11'
      '         OR IDTIPOMOVIMENTACAO = 12)'
      '   AND IDPESSOA = :IDPESSOA'
      ' ORDER BY DATAMOVIMENTACAO DESC,'
      '          IDMOVIMENTACAO DESC'
      '')
    Left = 161
    Top = 285
  end
  object sqlSCBTransf: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */ SC.IDBEM,'
      '       SC.IDPESSOA,'
      '       SC.DATASLDBEM,'
      '       SC.IDGRUPO,'
      '       SC.IDLOCALIZACAO,'
      '       SC.IDRESPONSAVEL'
      'FROM SALDOCONTABBEM SC,'
      '     BEM B,'
      '     GRUPO G'
      'WHERE G.FLGIMOVEL = :PFLGIMOVEL'
      ''
      ''
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND SC.IDPESSOA = :IDPESSOA'
      '  AND SC.IDBEM = B.IDBEM'
      '  AND SC.IDPESSOA = B.IDPESSOA'
      '  AND B.IDGRUPO = G.IDGRUPO'
      '  AND B."IDBEM" >= -1E38'
      'ORDER BY SC.IDBEM, SC.IDPESSOA, SC.DATASLDBEM DESC'
      '')
    Left = 161
    Top = 271
  end
  object sqlRCInsSldCtbBemxDep: TCMSqlParams
    SQL.Strings = (
      'INSERT INTO SLDCTBBEMXDEP (IDBEM,'
      '                           IDPESSOA,'
      '                           DATASLDBEM,'
      '                           MOECODIGO,'
      '                           IDSLDCTBBEMXDEP,'
      '                           DEPLANC,'
      '                           CMDEP,'
      '                           REAVDEPLANC,'
      '                           REAVCMDEP,'
      '                           ULTREAVDEPLANC,'
      '                           ULTREAVCMDEP)'
      '                   VALUES (:IDBEM,'
      '                           :IDPESSOA,'
      '                           :DATASLDBEM,'
      '                           :MOECODIGO,'
      '                           :IDSLDCTBBEMXDEP,'
      '                           :DEPLANC,'
      '                           :CMDEP,'
      '                           :REAVDEPLANC,'
      '                           :REAVCMDEP,'
      '                           :ULTREAVDEPLANC,'
      '                           :ULTREAVCMDEP)'
      '')
    Left = 160
    Top = 257
  end
  object sqlRCInsSaldoContabBem: TCMSqlParams
    SQL.Strings = (
      'INSERT INTO SALDOCONTABBEM (IDBEM,'
      '                            IDPESSOA,'
      '                            DATASLDBEM,'
      '                            MOECODIGO,'
      '                            VALORG,'
      '                            CMBEM,'
      '                            REAVVALORG,'
      '                            REAVCMBEM,'
      '                            ULTREAVVALORG,'
      '                            ULTREAVCMBEM,'
      '                            IDGRUPO,'
      '                            IDLOCALIZACAO,'
      '                            IDRESPONSAVEL)'
      '                    VALUES (:IDBEM,'
      '                            :IDPESSOA,'
      '                            :DATASLDBEM,'
      '                            :MOECODIGO,'
      '                            :VALORG,'
      '                            :CMBEM,'
      '                            :REAVVALORG,'
      '                            :REAVCMBEM,'
      '                            :ULTREAVVALORG,'
      '                            :ULTREAVCMBEM,'
      '                            :IDGRUPO,'
      '                            :IDLOCALIZACAO,'
      '                            :IDRESPONSAVEL)'
      '')
    Left = 160
    Top = 243
  end
  object sqlRCMovContabBem: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '   VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO,'
      ''
      
        '   SUM(VBEM.VALBEMACUM + VBEM.VALACRESACUM - VBEM.BXVALBEMACUM -' +
        ' VBEM.BXVALACRESACUM)                     AS VALORG,'
      
        '   SUM(VBEM.VALCMBEMACUM + VBEM.VALCMACRESACUM - VBEM.BXVALCMBEM' +
        'ACUM - VBEM.BXVALCMACRESACUM)             AS CMBEM,'
      
        '   SUM(VBEM.VALDEPBEMACUM + VBEM.VALDEPACRESACUM - VBEM.BXVALDEP' +
        'BEMACUM - VBEM.BXVALDEPACRESACUM)         AS DEPLANC,'
      
        '   SUM(VBEM.VALCMDEPBEMACUM + VBEM.VALCMDEPACRESACUM - VBEM.BXVA' +
        'LCMDEPBEMACUM - VBEM.BXVALCMDEPACRESACUM) AS CMDEP,'
      ''
      
        '   SUM(VBEM.VALREAVACUM - VBEM.BXVALREAVACUM)           AS REAVV' +
        'ALORG,'
      
        '   SUM(VBEM.VALCMREAVACUM - VBEM.BXVALCMREAVACUM)       AS REAVC' +
        'MBEM,'
      
        '   SUM(VBEM.VALDEPREAVACUM - VBEM.BXVALDEPREAVACUM)     AS REAVD' +
        'EPLANC,'
      
        '   SUM(VBEM.VALCMDEPREAVACUM - VBEM.BXVALCMDEPREAVACUM) AS REAVC' +
        'MDEP,'
      ''
      
        '   SUM(VBEM.VALULTREAVACUM - VBEM.BXVALULTREAVACUM)           AS' +
        ' ULTREAVVALORG,'
      
        '   SUM(VBEM.VALULTCMREAVACUM - VBEM.BXVALULTCMREAVACUM)       AS' +
        ' ULTREAVCMBEM,'
      
        '   SUM(VBEM.VALULTDEPREAVACUM - VBEM.BXVALULTDEPREAVACUM)     AS' +
        ' ULTREAVDEPLANC,'
      
        '   SUM(VBEM.VALULTCMDEPREAVACUM - VBEM.BXVALULTCMDEPREAVACUM) AS' +
        ' ULTREAVCMDEP'
      ''
      'FROM'
      '  ('
      '   (SELECT'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
        '           TO_DATE(TO_CHAR(HM.DATAMOVIMENTACAO,'#39'DD/MM/YYYY'#39'),'#39'DD' +
        '/MM/YYYY'#39') AS DATAMOVIMENTACAO,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,05,NVL(VM.VALOR,0),'
      '                                            11,NVL(VM.VALOR,0),'
      '                                            12,NVL(VM.VALOR,0),'
      
        '                                            04,NVL(VM.VALOR,0),0' +
        ')) AS  VALBEMACUM,'
      '           (0) AS  VALREAVACUM,'
      '           (0) AS  VALACRESACUM,'
      '           (0) AS  VALCMBEMACUM,'
      '           (0) AS  VALCMREAVACUM,'
      '           (0) AS  VALCMACRESACUM,'
      '           (0) AS  VALDEPBEMACUM,'
      '           (0) AS  VALDEPREAVACUM,'
      '           (0) AS  VALDEPACRESACUM,'
      '           (0) AS  VALCMDEPBEMACUM,'
      '           (0) AS  VALCMDEPREAVACUM,'
      '           (0) AS  VALCMDEPACRESACUM,'
      '           (0) AS  BXVALBEMACUM,'
      '           (0) AS  BXVALREAVACUM,'
      '           (0) AS  BXVALACRESACUM,'
      '           (0) AS  BXVALCMBEMACUM,'
      '           (0) AS  BXVALCMREAVACUM,'
      '           (0) AS  BXVALCMACRESACUM,'
      '           (0) AS  BXVALDEPBEMACUM,'
      '           (0) AS  BXVALDEPREAVACUM,'
      '           (0) AS  BXVALDEPACRESACUM,'
      '           (0) AS  BXVALCMDEPBEMACUM,'
      '           (0) AS  BXVALCMDEPREAVACUM,'
      '           (0) AS  BXVALCMDEPACRESACUM,'
      '           (0) AS  VALULTREAVACUM,'
      '           (0) AS  VALULTCMREAVACUM,'
      '           (0) AS  VALULTDEPREAVACUM,'
      '           (0) AS  VALULTCMDEPREAVACUM,'
      '           (0) AS  BXVALULTREAVACUM,'
      '           (0) AS  BXVALULTCMREAVACUM,'
      '           (0) AS  BXVALULTDEPREAVACUM,'
      '           (0) AS  BXVALULTCMDEPREAVACUM'
      '    FROM HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :PIDBEM)'
      '      AND (HM.IDPESSOA = :PIDPESSOA)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,VM.MOECODIGO,VM.IDTAXADEP,TO_D' +
        'ATE(TO_CHAR(HM.DATAMOVIMENTACAO,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39')) UNI' +
        'ON'
      ''
      '   (SELECT'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
        '           TO_DATE(TO_CHAR(HM.DATAMOVIMENTACAO,'#39'DD/MM/YYYY'#39'),'#39'DD' +
        '/MM/YYYY'#39') AS DATAMOVIMENTACAO,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,01,NVL(VM.VALOR,0),'
      '                                            03,NVL(VM.VALOR,0),'
      '                                            07,NVL(VM.VALOR,0),'
      '                                            10,NVL(VM.VALOR,0),'
      '                                            81,NVL(VM.VALOR,0),'
      
        '                                            41,NVL(VM.VALOR,0),0' +
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
      '                                            16,NVL(VM.VALOR,0),'
      '                                            13,NVL(VM.VALOR,0),'
      
        '                                            83,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,37,NVL(VM.VALOR,0),'
      
        '                                            91,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,25,NVL(VM.VALOR,0),'
      
        '                                            84,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,38,NVL(VM.VALOR,0),'
      
        '                                            92,NVL(VM.VALOR,0),0' +
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
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,VM.MOECODIGO,VM.IDTAXADEP,TO_D' +
        'ATE(TO_CHAR(HM.DATAMOVIMENTACAO,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39')) UNI' +
        'ON'
      ''
      '   (SELECT'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
        '           TO_DATE(TO_CHAR(HM.DATAMOVIMENTACAO,'#39'DD/MM/YYYY'#39'),'#39'DD' +
        '/MM/YYYY'#39') AS DATAMOVIMENTACAO,'
      
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
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,24,NVL(VM.VALOR,0),'
      
        '                                            85,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,39,NVL(VM.VALOR,0),'
      
        '                                            93,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,26,NVL(VM.VALOR,0),'
      
        '                                            86,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,40,NVL(VM.VALOR,0),'
      
        '                                            94,NVL(VM.VALOR,0),0' +
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
      '      AND (VM.IDTAXADEP = :PIDTAXADEP)'
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,VM.MOECODIGO,VM.IDTAXADEP,TO_D' +
        'ATE(TO_CHAR(HM.DATAMOVIMENTACAO,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39')) UNI' +
        'ON'
      ''
      '   (SELECT'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
        '           TO_DATE(TO_CHAR(HM.DATAMOVIMENTACAO,'#39'DD/MM/YYYY'#39'),'#39'DD' +
        '/MM/YYYY'#39') AS DATAMOVIMENTACAO,'
      
        '           (0)                                                  ' +
        '   AS  VALBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(VM.VALOR,0),'
      '                                            32,NVL(VM.VALOR,0),'
      '                                            45,NVL(VM.VALOR,0),'
      
        '                                            82,NVL(VM.VALOR,0),0' +
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
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(VM.VALOR,0),'
      
        '                                            87,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(VM.VALOR,0),'
      
        '                                            88,NVL(VM.VALOR,0),0' +
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
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (R.FLGULTREAVAL = 0)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,VM.MOECODIGO,VM.IDTAXADEP,TO_D' +
        'ATE(TO_CHAR(HM.DATAMOVIMENTACAO,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39')) UNI' +
        'ON'
      ''
      '   (SELECT'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
        '           TO_DATE(TO_CHAR(HM.DATAMOVIMENTACAO,'#39'DD/MM/YYYY'#39'),'#39'DD' +
        '/MM/YYYY'#39') AS DATAMOVIMENTACAO,'
      
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
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(VM.VALOR,0),'
      
        '                                            89,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(VM.VALOR,0),'
      
        '                                            90,NVL(VM.VALOR,0),0' +
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
      '      AND (VM.IDTAXADEP = :PIDTAXADEP)'
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (R.FLGULTREAVAL = 0)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,VM.MOECODIGO,VM.IDTAXADEP,TO_D' +
        'ATE(TO_CHAR(HM.DATAMOVIMENTACAO,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39')) UNI' +
        'ON'
      ''
      '   (SELECT'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
        '           TO_DATE(TO_CHAR(HM.DATAMOVIMENTACAO,'#39'DD/MM/YYYY'#39'),'#39'DD' +
        '/MM/YYYY'#39') AS DATAMOVIMENTACAO,'
      
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
      '                                            45,NVL(VM.VALOR,0),'
      
        '                                            82,NVL(VM.VALOR,0),0' +
        ')) AS  VALULTREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(VM.VALOR,0),'
      
        '                                            46,NVL(VM.VALOR,0),0' +
        ')) AS  VALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(VM.VALOR,0),'
      
        '                                            87,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALULTREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(VM.VALOR,0),'
      
        '                                            88,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMDEPREAVACUM'
      
        '    FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R, VLRHISTMOVBEM ' +
        'VM'
      '    WHERE (HM.IDBEM = :PIDBEM)'
      '      AND (HM.IDPESSOA = :PIDPESSOA)'
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (R.FLGULTREAVAL = 1)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,VM.MOECODIGO,VM.IDTAXADEP,TO_D' +
        'ATE(TO_CHAR(HM.DATAMOVIMENTACAO,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39')) UNI' +
        'ON'
      ''
      '   (SELECT'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
        '           TO_DATE(TO_CHAR(HM.DATAMOVIMENTACAO,'#39'DD/MM/YYYY'#39'),'#39'DD' +
        '/MM/YYYY'#39') AS DATAMOVIMENTACAO,'
      
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
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(VM.VALOR,0),'
      
        '                                            89,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALULTDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(VM.VALOR,0),'
      
        '                                            90,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALULTCMDEPREAVACUM'
      
        '    FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R, VLRHISTMOVBEM ' +
        'VM'
      '    WHERE (HM.IDBEM = :PIDBEM)'
      '      AND (HM.IDPESSOA = :PIDPESSOA)'
      '      AND (VM.IDTAXADEP = :PIDTAXADEP)'
      '      AND (VM.MOECODIGO = :PMOECODIGO)'
      '      AND (R.FLGULTREAVAL = 1)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,VM.MOECODIGO,VM.IDTAXADEP,TO_D' +
        'ATE(TO_CHAR(HM.DATAMOVIMENTACAO,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39'))'
      '  )  VBEM'
      ''
      'GROUP BY VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO'
      ''
      ' '
      ' ')
    Left = 159
    Top = 229
  end
  object sqlRCBemxDep: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ BD.IDBEM, BD.IDPESSOA, BD.MOECODIGO, M.MOEDES' +
        'C,'
      '       BD.IDBEMXDEP, BD.TAXADEP, GD.DESCTAXADEP,'
      
        '       BD.DEPLANC, BD.CMDEP, BD.DATAULTDEP, BD.FLGDEPREC, BD.DAT' +
        'AULTCM'
      'FROM BEMXDEP BD,'
      '     MOEDA M,'
      '     BEM B,'
      '     GRUPOTAXADEP GD'
      'WHERE BD.IDPESSOA  = :IDPESSOA'
      '  AND BD.IDBEM     = :IDBEM'
      '  AND BD.MOECODIGO = :MOECODIGO'
      '  AND BD.MOECODIGO = M.MOECODIGO'
      '  AND BD.IDBEM     = B.IDBEM'
      '  AND BD.IDPESSOA  = B.IDPESSOA'
      '  AND B.IDGRUPO    = GD.IDGRUPO'
      '  AND B.IDPESSOA   = GD.IDPESSOA'
      '  AND BD.IDBEMXDEP = GD.IDTAXADEP'
      'ORDER BY BD.IDBEMXDEP')
    Left = 160
    Top = 215
  end
  object sqlRCBemxMoeda: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ BM.IDBEM, BM.IDPESSOA, BM.MOECODIGO, M.MOEDES' +
        'C,'
      '       BM.VALORG, BM.CMBEM, BM.DATAULTCM'
      'FROM BEMXMOEDA BM,'
      '     MOEDA M'
      'WHERE BM.IDPESSOA  = :IDPESSOA'
      '  AND BM.IDBEM     = :IDBEM'
      '  AND BM.MOECODIGO = M.MOECODIGO'
      'ORDER BY BM.MOECODIGO')
    Left = 160
    Top = 201
  end
  object sqlRCBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ BD.IDPESSOA, BD.IDBEM, BD.MOECODIGO, BD.IDBEM' +
        'XDEP,'
      '       B.IDGRUPO, C.IDLOCALIZACAO, C.IDRESPONSAVEL'
      'FROM BEMXDEP BD,'
      '     BEM B,'
      '     PLANOGRUPO PG,'
      '     GRUPO G,'
      '     CONJUNTO C'
      'WHERE G.FLGIMOVEL = :FLGIMOVEL'
      '  AND B.IDPESSOA = :IDPESSOA'
      ''
      ''
      '  AND PG.IDPESSOA = :IDPESSOA'
      '  AND C.IDPESSOA = :IDPESSOA'
      '  AND BD.IDPESSOA = :IDPESSOA'
      '  AND BD.IDBEM = B.IDBEM'
      '  AND BD.IDPESSOA = B.IDPESSOA'
      '  AND B.IDGRUPO = PG.IDGRUPO'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      '  AND B.IDCONJUNTO = C.IDCONJUNTO'
      '  AND B.IDPESSOA = C.IDPESSOA'
      'ORDER BY BD.IDBEM, BD.MOECODIGO, BD.IDBEMXDEP'
      '')
    Left = 160
    Top = 187
  end
  object sqlRCMovAcrescxDep: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ A.IDBEM, AD.IDACRESCIMO, AD.MOECODIGO, AD.IDA' +
        'CRESCIMOXDEP, AD.DEPLANC, AD.CMDEP,'
      
        '       (NVL(DEPACRESCACUM.VALDEPACRESCACUM,0) - NVL(BXDEPACRESCA' +
        'CUM.BXVALDEPACRESCACUM,0)) AS DEPLANC0,'
      
        '       (NVL(CMDEPACRESCACUM.VALCMDEPACRESCACUM,0) - NVL(BXCMDEPA' +
        'CRESCACUM.BXVALCMDEPACRESCACUM,0)) AS CMDEP0'
      ''
      
        'FROM ACRESCVALORXDEP AD, ACRESCIMOVALOR A, BEM B, GRUPO G, PLANO' +
        'GRUPO PG,'
      ''
      
        '   (SELECT HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAXADEP, SUM(NV' +
        'L(VM.VALOR,0)) AS VALDEPACRESCACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 35) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 51))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAXADEP) DEPA' +
        'CRESCACUM,'
      ''
      
        '   (SELECT HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAXADEP, SUM(NV' +
        'L(VM.VALOR,0)) AS VALCMDEPACRESCACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 36) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 52))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAXADEP) CMDE' +
        'PACRESCACUM,'
      ''
      
        '   (SELECT HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAXADEP, SUM(NV' +
        'L(VM.VALOR,0)) AS BXVALDEPACRESCACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 39) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 93))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAXADEP) BXDE' +
        'PACRESCACUM,'
      ''
      
        '   (SELECT HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAXADEP, SUM(NV' +
        'L(VM.VALOR,0)) AS BXVALCMDEPACRESCACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 40) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 94)) '
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAXADEP) BXCM' +
        'DEPACRESCACUM'
      ''
      'WHERE (A.DATAACRESCIMO <= :PDATAMOV)'
      '  AND (A.IDPESSOA  = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.FLGIMOVEL = :PFLGIMOVEL)'
      ''
      ''
      '  AND (AD.IDACRESCIMO = A.IDACRESCIMO)'
      '  AND (A.IDBEM = B.IDBEM)'
      '  AND (A.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      '  AND (AD.IDACRESCIMO = DEPACRESCACUM.IDREAVALACRESC(+))'
      '  AND (AD.MOECODIGO = DEPACRESCACUM.MOECODIGO(+))'
      '  AND (AD.IDACRESCIMOXDEP = DEPACRESCACUM.IDTAXADEP(+))'
      '  AND (AD.IDACRESCIMO = CMDEPACRESCACUM.IDREAVALACRESC(+))'
      '  AND (AD.MOECODIGO = CMDEPACRESCACUM.MOECODIGO(+))'
      '  AND (AD.IDACRESCIMOXDEP = CMDEPACRESCACUM.IDTAXADEP(+))'
      '  AND (AD.IDACRESCIMO = BXDEPACRESCACUM.IDREAVALACRESC(+))'
      '  AND (AD.MOECODIGO = BXDEPACRESCACUM.MOECODIGO(+))'
      '  AND (AD.IDACRESCIMOXDEP = BXDEPACRESCACUM.IDTAXADEP(+))'
      '  AND (AD.IDACRESCIMO = BXCMDEPACRESCACUM.IDREAVALACRESC(+))'
      '  AND (AD.MOECODIGO = BXCMDEPACRESCACUM.MOECODIGO(+))'
      '  AND (AD.IDACRESCIMOXDEP = BXCMDEPACRESCACUM.IDTAXADEP(+))'
      ''
      
        'ORDER BY A.IDBEM, AD.IDACRESCIMO, AD.MOECODIGO, AD.IDACRESCIMOXD' +
        'EP'
      '')
    Left = 288
    Top = 257
  end
  object sqlRCMovAcrescimo: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ A.IDBEM, AM.IDACRESCIMO, AM.MOECODIGO, AM.VAL' +
        'ORG, AM.CMBEM,'
      
        '       (NVL(ACRESCACUM.VALACRESCACUM,0) - NVL(BXACRESCACUM.BXVAL' +
        'ACRESCACUM,0)) AS VALORG0,'
      
        '       (NVL(CMACRESCACUM.VALCMACRESCACUM,0) - NVL(BXCMACRESCACUM' +
        '.BXVALCMACRESCACUM,0)) AS CMBEM0'
      ''
      
        'FROM ACRESCVALORXMOEDA AM, ACRESCIMOVALOR A, BEM B, GRUPO G, PLA' +
        'NOGRUPO PG,'
      ''
      
        '   (SELECT HM.IDREAVALACRESC, VM.MOECODIGO, SUM(NVL(VM.VALOR,0))' +
        ' AS VALACRESCACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 09) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 49))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO) ACRESCACUM,'
      ''
      
        '   (SELECT HM.IDREAVALACRESC, VM.MOECODIGO, SUM(NVL(VM.VALOR,0))' +
        ' AS VALCMACRESCACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 34) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 50))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO) CMACRESCACUM,'
      ''
      
        '   (SELECT HM.IDREAVALACRESC, VM.MOECODIGO, SUM(NVL(VM.VALOR,0))' +
        ' AS BXVALACRESCACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 37) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 91))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO) BXACRESCACUM,'
      ''
      
        '   (SELECT HM.IDREAVALACRESC, VM.MOECODIGO, SUM(NVL(VM.VALOR,0))' +
        ' AS BXVALCMACRESCACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 38) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 92))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO) BXCMACRESCACUM'
      ''
      'WHERE (A.DATAACRESCIMO <= :PDATAMOV)'
      '  AND (A.IDPESSOA  = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.FLGIMOVEL = :PFLGIMOVEL)'
      ''
      ''
      '  AND (AM.IDACRESCIMO = A.IDACRESCIMO)'
      '  AND (A.IDBEM = B.IDBEM)'
      '  AND (A.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      '  AND (AM.IDACRESCIMO   = ACRESCACUM.IDREAVALACRESC(+))'
      '  AND (AM.MOECODIGO     = ACRESCACUM.MOECODIGO(+))'
      '  AND (AM.IDACRESCIMO = CMACRESCACUM.IDREAVALACRESC(+))'
      '  AND (AM.MOECODIGO     = CMACRESCACUM.MOECODIGO(+))'
      '  AND (AM.IDACRESCIMO = BXACRESCACUM.IDREAVALACRESC(+))'
      '  AND (AM.MOECODIGO     = BXACRESCACUM.MOECODIGO(+))'
      '  AND (AM.IDACRESCIMO = BXCMACRESCACUM.IDREAVALACRESC(+))'
      '  AND (AM.MOECODIGO     = BXCMACRESCACUM.MOECODIGO(+))'
      ''
      'ORDER BY A.IDBEM, AM.IDACRESCIMO, AM.MOECODIGO'
      '')
    Left = 288
    Top = 244
  end
  object sqlRCMovReavalxDep: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ R.IDBEM, RD.IDREAVALIACAO, RD.MOECODIGO, RD.I' +
        'DREAVALXDEP, RD.DEPLANC, RD.CMDEP,'
      
        '       (NVL(DEPREAVACUM.VALDEPREAVACUM,0) - NVL(BXDEPREAVACUM.BX' +
        'VALDEPREAVACUM,0)) AS DEPLANC0,'
      
        '       (NVL(CMDEPREAVACUM.VALCMDEPREAVACUM,0) - NVL(BXCMDEPREAVA' +
        'CUM.BXVALCMDEPREAVACUM,0)) AS CMDEP0'
      ''
      
        'FROM REAVALXDEP RD, REAVALIACAO R, BEM B, GRUPO G, PLANOGRUPO PG' +
        ','
      ''
      
        '   (SELECT /*+ RULE */ HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAX' +
        'ADEP, SUM(NVL(VM.VALOR,0)) AS VALDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 33) OR (HM.IDTIPOMOVIMENTACAO = 47))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAXADEP) DEPR' +
        'EAVACUM,'
      ''
      
        '   (SELECT /*+ RULE */ HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAX' +
        'ADEP, SUM(NVL(VM.VALOR,0)) AS VALCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 19) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 48))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAXADEP) CMDE' +
        'PREAVACUM,'
      ''
      
        '   (SELECT /*+ RULE */ HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAX' +
        'ADEP, SUM(NVL(VM.VALOR,0)) AS BXVALDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 27) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 89))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAXADEP) BXDE' +
        'PREAVACUM,'
      ''
      
        '   (SELECT /*+ RULE */ HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAX' +
        'ADEP, SUM(NVL(VM.VALOR,0)) AS BXVALCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 29) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 90))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAXADEP) BXCM' +
        'DEPREAVACUM'
      ''
      'WHERE (R.DATAREAVALIACAO <= :PDATAMOV)'
      '  AND (R.IDPESSOA  = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.FLGIMOVEL = :PFLGIMOVEL)'
      ''
      ''
      '  AND (RD.IDREAVALIACAO = R.IDREAVALIACAO)'
      '  AND (R.IDBEM = B.IDBEM)'
      '  AND (R.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      '  AND (RD.IDREAVALIACAO = DEPREAVACUM.IDREAVALACRESC(+))'
      '  AND (RD.MOECODIGO     = DEPREAVACUM.MOECODIGO(+))'
      '  AND (RD.IDREAVALXDEP  = DEPREAVACUM.IDTAXADEP(+))'
      '  AND (RD.IDREAVALIACAO = CMDEPREAVACUM.IDREAVALACRESC(+))'
      '  AND (RD.MOECODIGO     = CMDEPREAVACUM.MOECODIGO(+))'
      '  AND (RD.IDREAVALXDEP  = CMDEPREAVACUM.IDTAXADEP(+))'
      '  AND (RD.IDREAVALIACAO = BXDEPREAVACUM.IDREAVALACRESC(+))'
      '  AND (RD.MOECODIGO     = BXDEPREAVACUM.MOECODIGO(+))'
      '  AND (RD.IDREAVALXDEP  = BXDEPREAVACUM.IDTAXADEP(+))'
      '  AND (RD.IDREAVALIACAO = BXCMDEPREAVACUM.IDREAVALACRESC(+))'
      '  AND (RD.MOECODIGO     = BXCMDEPREAVACUM.MOECODIGO(+))'
      '  AND (RD.IDREAVALXDEP  = BXCMDEPREAVACUM.IDTAXADEP(+))'
      ''
      
        'ORDER BY R.IDBEM, RD.IDREAVALIACAO, RD.MOECODIGO, RD.IDREAVALXDE' +
        'P'
      '')
    Left = 288
    Top = 230
  end
  object sqlRCMovReavaliacao: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ R.IDBEM, RM.IDREAVALIACAO, RM.MOECODIGO, RM.V' +
        'ALORG, RM.CMBEM,'
      
        '       (NVL(REAVACUM.VALREAVACUM,0) - NVL(BXREAVACUM.BXVALREAVAC' +
        'UM,0)) AS VALORG0,'
      
        '       (NVL(CMREAVACUM.VALCMREAVACUM,0) - NVL(BXCMREAVACUM.BXVAL' +
        'CMREAVACUM,0)) AS CMBEM0'
      ''
      
        'FROM REAVALXMOEDA RM, REAVALIACAO R, BEM B, GRUPO G, PLANOGRUPO ' +
        'PG,'
      ''
      
        '   (SELECT /*+ RULE */ HM.IDREAVALACRESC, VM.MOECODIGO, SUM(NVL(' +
        'VM.VALOR,0)) AS VALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 08) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 32) OR (HM.IDTIPOMOVIMENTACAO = 45) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 82))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO) REAVACUM,'
      ''
      
        '   (SELECT /*+ RULE */ HM.IDREAVALACRESC, VM.MOECODIGO, SUM(NVL(' +
        'VM.VALOR,0)) AS VALCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 22) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 46))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO) CMREAVACUM,'
      ''
      
        '   (SELECT /*+ RULE */ HM.IDREAVALACRESC, VM.MOECODIGO, SUM(NVL(' +
        'VM.VALOR,0)) AS BXVALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 20) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 87))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO) BXREAVACUM,'
      ''
      
        '   (SELECT /*+ RULE */ HM.IDREAVALACRESC, VM.MOECODIGO, SUM(NVL(' +
        'VM.VALOR,0)) AS BXVALCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 28) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 88))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO) BXCMREAVACUM'
      ''
      'WHERE (R.DATAREAVALIACAO <= :PDATAMOV)'
      '  AND (R.IDPESSOA  = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.FLGIMOVEL = :PFLGIMOVEL)'
      ''
      ''
      '  AND (RM.IDREAVALIACAO = R.IDREAVALIACAO)'
      '  AND (R.IDBEM = B.IDBEM)'
      '  AND (R.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      '  AND (RM.IDREAVALIACAO = REAVACUM.IDREAVALACRESC(+))'
      '  AND (RM.MOECODIGO = REAVACUM.MOECODIGO(+))'
      '  AND (RM.IDREAVALIACAO = CMREAVACUM.IDREAVALACRESC(+))'
      '  AND (RM.MOECODIGO = CMREAVACUM.MOECODIGO(+))'
      '  AND (RM.IDREAVALIACAO = BXREAVACUM.IDREAVALACRESC(+))'
      '  AND (RM.MOECODIGO = BXREAVACUM.MOECODIGO(+))'
      '  AND (RM.IDREAVALIACAO = BXCMREAVACUM.IDREAVALACRESC(+))'
      '  AND (RM.MOECODIGO = BXCMREAVACUM.MOECODIGO(+))'
      ''
      'ORDER BY R.IDBEM, RM.IDREAVALIACAO, RM.MOECODIGO'
      '')
    Left = 288
    Top = 216
  end
  object sqlRCMovBemxDep: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ BD.IDPESSOA, BD.IDBEM, BD.MOECODIGO, BD.IDBEM' +
        'XDEP, BD.DEPLANC, BD.CMDEP,'
      
        '       (NVL(DEPBEMACUM.VALDEPBEMACUM,0) - NVL(BXDEPBEMACUM.BXVAL' +
        'DEPBEMACUM,0)) AS DEPLANC0,'
      
        '       (NVL(CMDEPBEMACUM.VALCMDEPBEMACUM,0) - NVL(BXCMDEPBEMACUM' +
        '.BXVALCMDEPBEMACUM,0)) AS CMDEP0'
      ''
      'FROM BEMXDEP BD, BEM B, GRUPO G, PLANOGRUPO PG,'
      ''
      
        '   (SELECT /*+ RULE */ HM.IDBEM, VM.MOECODIGO, VM.IDTAXADEP, SUM' +
        '(NVL(VM.VALOR,0)) AS VALDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 14) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 17) OR (HM.IDTIPOMOVIMENTACAO = 43))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, VM.MOECODIGO, VM.IDTAXADEP) DEPBEMACUM,'
      ''
      
        '   (SELECT /*+ RULE */ HM.IDBEM, VM.MOECODIGO, VM.IDTAXADEP, SUM' +
        '(NVL(VM.VALOR,0)) AS VALCMDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 21) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 44))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, VM.MOECODIGO, VM.IDTAXADEP) CMDEPBEMACUM,'
      ''
      
        '   (SELECT /*+ RULE */ HM.IDBEM, VM.MOECODIGO, VM.IDTAXADEP, SUM' +
        '(NVL(VM.VALOR,0)) AS BXVALDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 24) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 85))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, VM.MOECODIGO, VM.IDTAXADEP) BXDEPBEMACUM,'
      ''
      
        '   (SELECT /*+ RULE */ HM.IDBEM, VM.MOECODIGO, VM.IDTAXADEP, SUM' +
        '(NVL(VM.VALOR,0)) AS BXVALCMDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 26) OR OR (HM.IDTIPOMOVIMEN' +
        'TACAO = 86))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDBEM, VM.MOECODIGO, VM.IDTAXADEP) BXCMDEPBEMACU' +
        'M'
      ''
      'WHERE (B.DATAINICIODEP <= :PDATAMOV)'
      '  AND (BD.IDPESSOA = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.FLGIMOVEL = :PFLGIMOVEL)'
      ''
      ''
      '  AND (BD.IDBEM     = B.IDBEM)'
      '  AND (BD.IDPESSOA  = B.IDPESSOA)'
      '  AND (B.IDGRUPO    = G.IDGRUPO)'
      '  AND (G.IDGRUPO    = PG.IDGRUPO)'
      '  AND (BD.IDBEM     = DEPBEMACUM.IDBEM(+))'
      '  AND (BD.MOECODIGO = DEPBEMACUM.MOECODIGO(+))'
      '  AND (BD.IDBEMXDEP = DEPBEMACUM.IDTAXADEP(+))'
      '  AND (BD.IDBEM     = CMDEPBEMACUM.IDBEM(+))'
      '  AND (BD.MOECODIGO = CMDEPBEMACUM.MOECODIGO(+))'
      '  AND (BD.IDBEMXDEP = CMDEPBEMACUM.IDTAXADEP(+))'
      '  AND (BD.IDBEM     = BXDEPBEMACUM.IDBEM(+))'
      '  AND (BD.MOECODIGO = BXDEPBEMACUM.MOECODIGO(+))'
      '  AND (BD.IDBEMXDEP = BXDEPBEMACUM.IDTAXADEP(+))'
      '  AND (BD.IDBEM     = BXCMDEPBEMACUM.IDBEM(+))'
      '  AND (BD.MOECODIGO = BXDEPBEMACUM.MOECODIGO(+))'
      '  AND (BD.IDBEMXDEP = BXDEPBEMACUM.IDTAXADEP(+))'
      ''
      'ORDER BY BD.IDBEM, BD.MOECODIGO, BD.IDBEMXDEP'
      '')
    Left = 288
    Top = 202
  end
  object sqlRCMovBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ BM.IDPESSOA, BM.IDBEM, BM.MOECODIGO, BM.VALOR' +
        'G, BM.CMBEM,'
      
        '       (NVL(BEMACUM.VALBEMACUM,0) - NVL(BXBEMACUM.BXVALBEMACUM,0' +
        ')) AS VALORG0,'
      
        '       (NVL(CMBEMACUM.VALCMBEMACUM,0) - NVL(BXCMBEMACUM.BXVALCMB' +
        'EMACUM,0)) AS CMBEM0'
      ''
      'FROM BEMXMOEDA BM, BEM B, GRUPO G, PLANOGRUPO PG,'
      ''
      
        '   (SELECT /*+ RULE */ HM.IDBEM, VM.MOECODIGO, SUM(NVL(VM.VALOR,' +
        '0)) AS VALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 01) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 41) OR'
      
        '            (HM.IDTIPOMOVIMENTACAO = 07) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 10) OR (HM.IDTIPOMOVIMENTACAO = 81))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, VM.MOECODIGO) BEMACUM,'
      ''
      
        '   (SELECT /*+ RULE */ HM.IDBEM, VM.MOECODIGO, SUM(NVL(VM.VALOR,' +
        '0)) AS VALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 15) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 42))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, VM.MOECODIGO) CMBEMACUM,'
      ''
      
        '   (SELECT /*+ RULE */ HM.IDBEM, VM.MOECODIGO, SUM(NVL(VM.VALOR,' +
        '0)) AS BXVALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 06) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 13) OR (HM.IDTIPOMOVIMENTACAO = 16) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 83))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, VM.MOECODIGO) BXBEMACUM,'
      ''
      
        '   (SELECT /*+ RULE */ HM.IDBEM, VM.MOECODIGO, SUM(NVL(VM.VALOR,' +
        '0)) AS BXVALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '    WHERE  ((HM.IDTIPOMOVIMENTACAO = 25) OR (HM.IDTIPOMOVIMENTAC' +
        'AO = 84))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, VM.MOECODIGO) BXCMBEMACUM'
      ''
      'WHERE (B.DATAINICIODEP <= :PDATAMOV)'
      '  AND (BM.IDPESSOA = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.FLGIMOVEL = :PFLGIMOVEL)'
      ''
      ''
      '  AND (BM.IDBEM     = B.IDBEM)'
      '  AND (BM.IDPESSOA  = B.IDPESSOA)'
      '  AND (B.IDGRUPO    = G.IDGRUPO)'
      '  AND (G.IDGRUPO    = PG.IDGRUPO)'
      '  AND (BM.IDBEM     = BEMACUM.IDBEM(+))'
      '  AND (BM.MOECODIGO = BEMACUM.MOECODIGO(+))'
      '  AND (BM.IDBEM     = CMBEMACUM.IDBEM(+))'
      '  AND (BM.MOECODIGO = CMBEMACUM.MOECODIGO(+))'
      '  AND (BM.IDBEM     = BXBEMACUM.IDBEM(+))'
      '  AND (BM.MOECODIGO = BXBEMACUM.MOECODIGO(+))'
      '  AND (BM.IDBEM     = BXCMBEMACUM.IDBEM(+))'
      '  AND (BM.MOECODIGO = BXCMBEMACUM.MOECODIGO(+))'
      ''
      'ORDER BY BM.IDBEM, BM.MOECODIGO'
      ''
      ''
      ''
      'SELECT BM.IDPESSOA, BM.IDBEM, BM.MOECODIGO, BM.VALORG, BM.CMBEM,'
      
        '      ( ( CASE WHEN BEMACUM.VALBEMACUM IS NULL THEN 0 ELSE BEMAC' +
        'UM.VALBEMACUM END ) -'
      
        '        ( CASE WHEN BXBEMACUM.BXVALBEMACUM IS NULL THEN 0 ELSE B' +
        'XBEMACUM.BXVALBEMACUM END ) ) AS VALORG0,'
      
        '      ( ( CASE WHEN CMBEMACUM.VALCMBEMACUM IS NULL THEN 0 ELSE C' +
        'MBEMACUM.VALCMBEMACUM END ) -'
      
        '        ( CASE WHEN BXCMBEMACUM.BXVALCMBEMACUM IS NULL THEN 0 EL' +
        'SE BXCMBEMACUM.BXVALCMBEMACUM END ) ) AS CMBEM0'
      ''
      
        'FROM (BEMXMOEDA BM LEFT OUTER JOIN BEMACUM ON ( BM.IDBEM = BEMAC' +
        'UM.IDBEM ) AND ( BM.MOECODIGO = BEMACUM.MOECODIGO ))'
      ''
      ''
      ''
      
        '                                 AND ( BM.IDBEM = CMBEMACUM.IDBE' +
        'M )'
      
        '                                 AND ( BM.MOECODIGO = CMBEMACUM.' +
        'MOECODIGO )'
      
        '                                 AND ( BM.IDBEM = BXBEMACUM.IDBE' +
        'M )'
      
        '                                 AND ( BM.MOECODIGO = BXBEMACUM.' +
        'MOECODIGO )'
      
        '                                 AND ( BM.IDBEM = BXCMBEMACUM.ID' +
        'BEM )'
      
        '                                 AND ( BM.MOECODIGO = BXCMBEMACU' +
        'M.MOECODIGO ),'
      ''
      
        '   (SELECT HM.IDBEM, VM.MOECODIGO, SUM((CASE WHEN VM.VALOR IS NU' +
        'LL THEN 0 ELSE VM.VALOR END)) AS VALBEMACUM'
      
        '    FROM HISTORICOMOVIMENTACAO HM LEFT OUTER JOIN VLRHISTMOVBEM ' +
        'VM ON (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO)'
      
        '    WHERE ((HM.IDTIPOMOVIMENTACAO = 01) OR (HM.IDTIPOMOVIMENTACA' +
        'O = 41) OR (HM.IDTIPOMOVIMENTACAO = 07) OR'
      
        '           (HM.IDTIPOMOVIMENTACAO = 10) OR (HM.IDTIPOMOVIMENTACA' +
        'O = 81))'
      '      AND (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '    GROUP BY HM.IDBEM, VM.MOECODIGO) BEMACUM,'
      ''
      
        '   (SELECT HM.IDBEM, VM.MOECODIGO, SUM((CASE WHEN VM.VALOR IS NU' +
        'LL THEN 0 ELSE VM.VALOR END)) AS VALCMBEMACUM'
      
        '    FROM HISTORICOMOVIMENTACAO HM LEFT OUTER JOIN VLRHISTMOVBEM ' +
        'VM ON (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO)'
      
        '    WHERE ((HM.IDTIPOMOVIMENTACAO = 15) OR (HM.IDTIPOMOVIMENTACA' +
        'O = 42))'
      '      AND (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '    GROUP BY HM.IDBEM, VM.MOECODIGO) CMBEMACUM,'
      ''
      
        '   (SELECT HM.IDBEM, VM.MOECODIGO, SUM((CASE WHEN VM.VALOR IS NU' +
        'LL THEN 0 ELSE VM.VALOR END)) AS BXVALBEMACUM'
      
        '    FROM HISTORICOMOVIMENTACAO HM LEFT OUTER JOIN VLRHISTMOVBEM ' +
        'VM ON (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO)'
      
        '    WHERE ((HM.IDTIPOMOVIMENTACAO = 06) OR (HM.IDTIPOMOVIMENTACA' +
        'O = 13) OR'
      
        '           (HM.IDTIPOMOVIMENTACAO = 16) OR (HM.IDTIPOMOVIMENTACA' +
        'O = 83))'
      '      AND (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '    GROUP BY HM.IDBEM, VM.MOECODIGO) BXBEMACUM,'
      ''
      
        '   (SELECT HM.IDBEM, VM.MOECODIGO, SUM((CASE WHEN VM.VALOR IS NU' +
        'LL THEN 0 ELSE VM.VALOR END)) AS BXVALCMBEMACUM'
      
        '    FROM HISTORICOMOVIMENTACAO HM LEFT OUTER JOIN VLRHISTMOVBEM ' +
        'VM ON (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO)'
      
        '    WHERE ((HM.IDTIPOMOVIMENTACAO = 25) OR (HM.IDTIPOMOVIMENTACA' +
        'O = 84))'
      '      AND (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '    GROUP BY HM.IDBEM, VM.MOECODIGO) BXCMBEMACUM,'
      ''
      '    BEM B, GRUPO G, PLANOGRUPO PG'
      ''
      'WHERE (B.DATAINICIODEP <= :PDATAMOV)'
      '  AND (BM.IDPESSOA = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.FLGIMOVEL = :PFLGIMOVEL)'
      ''
      ''
      '  AND (BM.IDBEM     = B.IDBEM)'
      '  AND (BM.IDPESSOA  = B.IDPESSOA)'
      '  AND (B.IDGRUPO    = G.IDGRUPO)'
      '  AND (G.IDGRUPO    = PG.IDGRUPO)'
      ''
      'ORDER BY BM.IDBEM, BM.MOECODIGO'
      '')
    Left = 288
    Top = 188
  end
  object sqlAtuAcrescxDep: TCMSqlParams
    SQL.Strings = (
      'UPDATE ACRESCVALORXDEP'
      'SET DEPLANC = :DEPLANC,'
      '    CMDEP   = :CMDEP'
      'WHERE (IDACRESCIMO     = :IDACRESCIMO)'
      '  AND (MOECODIGO       = :MOECODIGO)'
      '  AND (IDACRESCIMOXDEP = :IDTAXADEP)')
    Left = 368
    Top = 147
  end
  object sqlAtuAcrescimo: TCMSqlParams
    SQL.Strings = (
      'UPDATE ACRESCVALORXMOEDA'
      'SET VALORG = :VALORG,'
      '    CMBEM  = :CMBEM'
      'WHERE (IDACRESCIMO = :IDACRESCIMO)'
      '  AND (MOECODIGO = :MOECODIGO)'
      '')
    Left = 368
    Top = 134
  end
  object sqlAtuReavalxDep: TCMSqlParams
    SQL.Strings = (
      'UPDATE REAVALXDEP'
      'SET DEPLANC = :DEPLANC,'
      '    CMDEP   = :CMDEP'
      'WHERE (IDREAVALIACAO = :IDREAVALIACAO)'
      '  AND (MOECODIGO     = :MOECODIGO)'
      '  AND (IDREAVALXDEP  = :IDTAXADEP)'
      ''
      '')
    Left = 368
    Top = 120
  end
  object sqlAtuReavaliacao: TCMSqlParams
    SQL.Strings = (
      'UPDATE REAVALXMOEDA'
      'SET VALORG = :VALORG,'
      '    CMBEM  = :CMBEM'
      'WHERE (IDREAVALIACAO = :IDREAVALIACAO)'
      '  AND (MOECODIGO = :MOECODIGO)'
      '')
    Left = 368
    Top = 106
  end
  object sqlAtuBemxDep: TCMSqlParams
    SQL.Strings = (
      'UPDATE BEMXDEP'
      'SET DEPLANC = :DEPLANC,'
      '    CMDEP   = :CMDEP'
      'WHERE (IDBEM = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '  AND (MOECODIGO = :MOECODIGO)'
      '  AND (IDBEMXDEP = :IDTAXADEP)')
    Left = 368
    Top = 92
  end
  object sqlAtuBem: TCMSqlParams
    SQL.Strings = (
      'UPDATE BEMXMOEDA'
      'SET VALORG = :VALORG,'
      '    CMBEM  = :CMBEM'
      'WHERE (IDBEM = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '  AND (MOECODIGO = :MOECODIGO)')
    Left = 368
    Top = 78
  end
  object sqlSaldoContabilBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ SB.IDBEM, SB.IDPESSOA, SB.DATASLDBEM, SB.MOEC' +
        'ODIGO, SB.IDSLDCTBBEMXDEP,'
      '       SB.IDGRUPO, SB.IDLOCALIZACAO, SB.IDRESPONSAVEL,'
      '       SB.VALORG,         SB.CMBEM,'
      '       SB.DEPLANC,        SB.CMDEP,'
      '       SB.REAVVALORG,     SB.REAVCMBEM,'
      '       SB.REAVDEPLANC,    SB.REAVCMDEP,'
      '       SB.ULTREAVVALORG,  SB.ULTREAVCMBEM,'
      '       SB.ULTREAVDEPLANC, SB.ULTREAVCMDEP,'
      ''
      
        '       (NVL(ATU.VALCMBEM,0) + NVL(ATU.VALCMREAV,0))   AS CMBEMAT' +
        'U,'
      
        '       (NVL(ATU.VALDEPBEM,0) + NVL(ATU.VALDEPREAV,0)) AS DEPLANC' +
        'ATU,'
      ''
      '       NVL(ATU.VALCMULTREAV,0)  AS VALULTCMREAVATU,'
      '       NVL(ATU.VALDEPULTREAV,0) AS VALULTDEPREAVATU'
      ''
      
        'FROM (SELECT SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM, SCB1.MO' +
        'ECODIGO, SCD1.IDSLDCTBBEMXDEP,'
      '             SCB1.VALORG, SCB1.REAVVALORG, SCB1.ULTREAVVALORG,'
      '             SCB1.CMBEM, SCB1.REAVCMBEM, SCB1.ULTREAVCMBEM,'
      
        '             SCD1.DEPLANC, SCD1.REAVDEPLANC, SCD1.ULTREAVDEPLANC' +
        ','
      '             SCD1.CMDEP, SCD1.REAVCMDEP, SCD1.ULTREAVCMDEP,'
      
        '             SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVE' +
        'L'
      '      FROM SALDOCONTABBEM SCB1,'
      '           SLDCTBBEMXDEP SCD1,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE DATASLDBEM <= :DATASLD'
      '              AND :MOECODIGO = MOECODIGO'
      '              AND :IDPESSOA = IDPESSOA'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE :IDBEM = SCB1.IDBEM'
      '        AND :IDPESSOA = SCB1.IDPESSOA'
      '        AND :MOECODIGO = SCB1.MOECODIGO'
      '        AND :IDTAXADEP = SCD1.IDSLDCTBBEMXDEP'
      '        AND DTAMAX.DATA = SCB1.DATASLDBEM'
      '        AND DTAMAX.IDBEM = SCB1.IDBEM'
      '        AND SCD1.IDBEM = SCB1.IDBEM'
      '        AND SCD1.IDPESSOA = SCB1.IDPESSOA'
      '        AND SCD1.MOECODIGO = SCB1.MOECODIGO'
      '        AND SCD1.DATASLDBEM = SCB1.DATASLDBEM'
      '        AND DTAMAX.IDBEM = :IDBEM'
      '        AND SCD1.IDBEM = :IDBEM'
      '        AND SCD1.IDPESSOA = :IDPESSOA'
      '        AND SCD1.MOECODIGO = :MOECODIGO'
      '        AND SCD1.DATASLDBEM = DTAMAX.DATA'
      '        AND SCD1.IDBEM = DTAMAX.IDBEM) SB,'
      '       (SELECT ATX.IDBEM, ATX.DATAMOVIMENTACAO,'
      
        '               SUM(ATX.VLCMBEM) AS VALCMBEM, SUM(ATX.VLCMREAV) A' +
        'S VALCMREAV,'
      
        '               SUM(ATX.VLDEPBEM) AS VALDEPBEM, SUM(ATX.VLDEPREAV' +
        ') AS VALDEPREAV,'
      
        '               SUM(ATX.VLCMULTREAV) AS VALCMULTREAV, SUM(ATX.VLD' +
        'EPULTREAV) AS VALDEPULTREAV'
      '          FROM (SELECT HM1.IDBEM, HM1.DATAMOVIMENTACAO,'
      
        '                       SUM(DECODE(HM1.IDTIPOMOVIMENTACAO, 15, NV' +
        'L(VM1.VALOR, 0),'
      
        '                                                          34, NV' +
        'L(VM1.VALOR, 0),'
      
        '                                                          50, NV' +
        'L(VM1.VALOR, 0), 0)) AS VLCMBEM,'
      
        '                                                                ' +
        '                   0 AS VLCMREAV,'
      
        '                                                                ' +
        '                   0 AS VLDEPBEM,'
      
        '                                                                ' +
        '                   0 AS VLDEPREAV,'
      
        '                                                                ' +
        '                   0 AS VLCMULTREAV,'
      
        '                                                                ' +
        '                   0 AS VLDEPULTREAV'
      '                FROM HISTORICOMOVIMENTACAO HM1,'
      '                     VLRHISTMOVBEM VM1'
      '                WHERE :IDBEM = HM1.IDBEM'
      '                  AND :IDPESSOA = HM1.IDPESSOA'
      '                  AND HM1.DATAMOVIMENTACAO = :DATASLD'
      '                  AND :MOECODIGO = VM1.MOECODIGO'
      
        '                  AND HM1.IDMOVIMENTACAO = VM1.IDMOVIMENTACAO (+' +
        ')'
      '                GROUP BY HM1.IDBEM, HM1.DATAMOVIMENTACAO'
      '                UNION'
      '                SELECT HM2.IDBEM, HM2.DATAMOVIMENTACAO,'
      
        '                                                                ' +
        '                   0 AS VLCMBEM,'
      
        '                                                                ' +
        '                   0 AS VLCMREAV,'
      
        '                       SUM(DECODE(HM2.IDTIPOMOVIMENTACAO, 14, NV' +
        'L(VM2.VALOR, 0),'
      
        '                                                          17, NV' +
        'L(VM2.VALOR, 0),'
      
        '                                                          35, NV' +
        'L(VM2.VALOR, 0), 0)) AS VLDEPBEM,'
      
        '                                                                ' +
        '                   0 AS VLDEPREAV,'
      
        '                                                                ' +
        '                   0 AS VLCMULTREAV,'
      
        '                                                                ' +
        '                   0 AS VLDEPULTREAV'
      '                FROM HISTORICOMOVIMENTACAO HM2,'
      '                     VLRHISTMOVBEM VM2'
      '                WHERE :IDBEM = HM2.IDBEM'
      '                  AND :IDPESSOA = HM2.IDPESSOA'
      '                  AND HM2.DATAMOVIMENTACAO = :DATASLD'
      '                  AND :MOECODIGO = VM2.MOECODIGO'
      '                  AND :IDTAXADEP = VM2.IDTAXADEP'
      
        '                  AND HM2.IDMOVIMENTACAO = VM2.IDMOVIMENTACAO (+' +
        ')'
      '                GROUP BY HM2.IDBEM, HM2.DATAMOVIMENTACAO'
      '                UNION'
      '                SELECT HM3.IDBEM, HM3.DATAMOVIMENTACAO,'
      
        '                                                                ' +
        '                   0 AS VALCMBEM,'
      
        '                       SUM(DECODE(HM3.IDTIPOMOVIMENTACAO, 22, NV' +
        'L(VM3.VALOR, 0), 0)) AS VALCMREAV,'
      
        '                                                                ' +
        '                   0 AS VALDEPBEM,'
      
        '                                                                ' +
        '                   0 AS VALDEPREAV,'
      
        '                                                                ' +
        '                   0 AS VALCMULTREAV,'
      
        '                                                                ' +
        '                   0 AS VALDEPULTREAV'
      '                FROM HISTORICOMOVIMENTACAO HM3,'
      '                     VLRHISTMOVBEM VM3,'
      '                     REAVALIACAO R1'
      '                WHERE :IDBEM = HM3.IDBEM'
      '                  AND :IDPESSOA = HM3.IDPESSOA'
      '                  AND HM3.DATAMOVIMENTACAO = :DATASLD'
      '                  AND :MOECODIGO = VM3.MOECODIGO'
      '                  AND 0 = R1.FLGULTREAVAL'
      
        '                  AND HM3.IDMOVIMENTACAO = VM3.IDMOVIMENTACAO (+' +
        ')'
      '                  AND HM3.IDREAVALACRESC = R1.IDREAVALIACAO (+)'
      '                GROUP BY HM3.IDBEM, HM3.DATAMOVIMENTACAO'
      '                UNION'
      '                SELECT HM4.IDBEM, HM4.DATAMOVIMENTACAO,'
      
        '                                                                ' +
        '                   0 AS VALCMBEM,'
      
        '                                                                ' +
        '                   0 AS VALCMREAV,'
      
        '                                                                ' +
        '                   0 AS VALDEPBEM,'
      
        '                       SUM(DECODE(HM4.IDTIPOMOVIMENTACAO, 18, NV' +
        'L(VM4.VALOR, 0),'
      
        '                                                          33, NV' +
        'L(VM4.VALOR, 0), 0)) AS VALDEPREAV,'
      
        '                                                                ' +
        '                   0 AS VALCMULTREAV,'
      
        '                                                                ' +
        '                   0 AS VALDEPULTREAV'
      '                FROM HISTORICOMOVIMENTACAO HM4,'
      '                     VLRHISTMOVBEM VM4,'
      '                     REAVALIACAO R2'
      '                WHERE :IDBEM = HM4.IDBEM'
      '                  AND :IDPESSOA = HM4.IDPESSOA'
      '                  AND HM4.DATAMOVIMENTACAO = :DATASLD'
      '                  AND :MOECODIGO = VM4.MOECODIGO'
      '                  AND :IDTAXADEP = VM4.IDTAXADEP'
      '                  AND 0 = R2.FLGULTREAVAL'
      
        '                  AND HM4.IDMOVIMENTACAO = VM4.IDMOVIMENTACAO (+' +
        ')'
      '                  AND HM4.IDREAVALACRESC = R2.IDREAVALIACAO (+)'
      '                GROUP BY HM4.IDBEM, HM4.DATAMOVIMENTACAO'
      '                UNION'
      '                SELECT HM5.IDBEM, HM5.DATAMOVIMENTACAO,'
      
        '                                                                ' +
        '                   0 AS VALCMBEM,'
      
        '                                                                ' +
        '                   0 AS VALCMREAV,'
      
        '                                                                ' +
        '                   0 AS VALDEPBEM,'
      
        '                                                                ' +
        '                   0 AS VALDEPREAV,'
      
        '                       SUM(DECODE(HM5.IDTIPOMOVIMENTACAO, 22, NV' +
        'L(VM5.VALOR, 0), 0)) AS VALCMULTREAV,'
      
        '                                                                ' +
        '                   0 AS VALDEPULTREAV'
      '                FROM HISTORICOMOVIMENTACAO HM5,'
      '                     VLRHISTMOVBEM VM5,'
      '                     REAVALIACAO R3'
      '                WHERE :IDBEM = HM5.IDBEM'
      '                  AND :IDPESSOA = HM5.IDPESSOA'
      '                  AND HM5.DATAMOVIMENTACAO = :DATASLD'
      '                  AND :MOECODIGO = VM5.MOECODIGO'
      '                  AND 1 = R3.FLGULTREAVAL'
      
        '                  AND HM5.IDMOVIMENTACAO = VM5.IDMOVIMENTACAO (+' +
        ')'
      '                  AND HM5.IDREAVALACRESC = R3.IDREAVALIACAO (+)'
      '                GROUP BY HM5.IDBEM, HM5.DATAMOVIMENTACAO'
      '                UNION'
      '                SELECT HM6.IDBEM, HM6.DATAMOVIMENTACAO,'
      
        '                                                                ' +
        '                   0 AS VALCMBEM,'
      
        '                                                                ' +
        '                   0 AS VALCMREAV,'
      
        '                                                                ' +
        '                   0 AS VALDEPBEM,'
      
        '                                                                ' +
        '                   0 AS VALDEPREAV,'
      
        '                                                                ' +
        '                   0 AS VALCMULTREAV,'
      
        '                       SUM(DECODE(HM6.IDTIPOMOVIMENTACAO, 18, NV' +
        'L(VM6.VALOR, 0),'
      
        '                                                          33, NV' +
        'L(VM6.VALOR, 0), 0)) AS VALDEPULTREAV'
      '                FROM HISTORICOMOVIMENTACAO HM6,'
      '                     VLRHISTMOVBEM VM6,'
      '                     REAVALIACAO R4'
      '                WHERE :IDBEM = HM6.IDBEM'
      '                  AND :IDPESSOA = HM6.IDPESSOA'
      '                  AND HM6.DATAMOVIMENTACAO = :DATASLD'
      '                  AND :MOECODIGO = VM6.MOECODIGO'
      '                  AND :IDTAXADEP = VM6.IDTAXADEP'
      '                  AND 1 = R4.FLGULTREAVAL'
      
        '                  AND HM6.IDMOVIMENTACAO = VM6.IDMOVIMENTACAO (+' +
        ')'
      '                  AND HM6.IDREAVALACRESC = R4.IDREAVALIACAO (+)'
      '                GROUP BY HM6.IDBEM, HM6.DATAMOVIMENTACAO) ATX'
      '         GROUP BY ATX.IDBEM, ATX.DATAMOVIMENTACAO) ATU'
      'WHERE :IDBEM = SB.IDBEM'
      '  AND :IDPESSOA = SB.IDPESSOA'
      '  AND :MOECODIGO = SB.MOECODIGO'
      '  AND :IDTAXADEP = SB.IDSLDCTBBEMXDEP'
      '  AND SB.IDBEM = ATU.IDBEM (+)'
      '  AND SB.DATASLDBEM = ATU.DATAMOVIMENTACAO (+)'
      '')
    Left = 344
    Top = 27
  end
  object sqlAtualizaPlnCodigo: TCMSqlParams
    SQL.Strings = (
      'UPDATE HISTORICOMOVIMENTACAO  '
      'SET PLNCODIGO = :PLNCODIGO'
      'WHERE IDMOVIMENTACAO = :IDMOVIMENTACAO')
    Left = 558
    Top = 106
  end
  object sqlHistMovBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ HM.DATAMOVIMENTACAO, TM.DESCTIPOMOVIMENTACAO,' +
        ' VM.VALOR,'
      
        '       SB.IDGRUPO, SB.IDLOCALIZACAO, SB.IDRESPONSAVEL, HM.IDMOVI' +
        'MENTACAO'
      ''
      'FROM (SELECT IDBEM, IDPESSOA, DATASLDBEM,'
      '             IDGRUPO, IDLOCALIZACAO, IDRESPONSAVEL'
      '      FROM SALDOCONTABBEM'
      '      WHERE IDBEM = :IDBEM'
      '        AND IDPESSOA = :IDPESSOA'
      '        AND DATASLDBEM <= :DATAMOV'
      '        AND MOECODIGO = :MOECODIGO) SB,'
      '     VLRHISTMOVBEM VM,'
      '     TIPOMOVIMENTACAO TM,'
      '     HISTORICOMOVIMENTACAO HM'
      'WHERE HM.IDBEM = :IDBEM'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND HM.DATAMOVIMENTACAO <= :DATAMOV'
      '  AND (VM.MOECODIGO = :MOECODIGO OR VM.MOECODIGO IS NULL)'
      
        '  AND (VM.IDTAXADEP = :IDTAXADEP OR VM.IDTAXADEP = 0 OR VM.IDTAX' +
        'ADEP IS NULL)'
      '  AND TM.IDTIPOMOVIMENTACAO = HM.IDTIPOMOVIMENTACAO + 0'
      '  AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO (+)'
      '  AND SB.IDBEM = HM.IDBEM'
      '  AND SB.IDPESSOA = HM.IDPESSOA'
      '  AND SB.DATASLDBEM = HM.DATAMOVIMENTACAO'
      ' ORDER BY HM.DATAMOVIMENTACAO, HM.IDMOVIMENTACAO'
      ''
      ''
      '')
    Left = 558
    Top = 93
  end
  object sqlBensPendentesxRateio: TCMSqlParams
    SQL.Strings = (
      'SELECT IDBENSPENDENTES,'
      '       IDPESSOA,'
      '       (0.00) AS IDBEM,'
      '       (0) AS IDPLANOPREV,'
      '       (0) AS IDPATRO,'
      '       (0.00) AS PPBPERCRATEIO,'
      
        '       ('#39'                                        '#39') AS NOMEPATRO' +
        ','
      
        '       ('#39'                                        '#39') AS NOMEPLANO' +
        'PREV'
      'FROM BENSPENDENTES'
      'WHERE IDPESSOA = :PIDPESSOA'
      '  AND IDFORNSERV = :PIDFORNSERV'
      '  AND LTRIM(RTRIM(IDNOTA)) = :PIDNOTA'
      '')
    Left = 512
    Top = 42
  end
  object sqlBensPendentesxDep: TCMSqlParams
    SQL.Strings = (
      'SELECT IDBENSPENDENTES,'
      '       IDPESSOA,'
      '       (0.00) AS IDBEM,'
      '       (0) AS MOECODIGO,'
      '       ('#39'                              '#39') AS MOEDESC,'
      '       (0) AS IDBEMXDEP,'
      '       (0.000000) AS TAXADEP,'
      '       ('#39'                              '#39') AS DESCTAXADEP,'
      '       (0.00) AS DEPLANC,'
      '       (0.00) AS CMDEP,'
      '       DTAINCLUSAO AS DATAULTDEP,'
      '       DTAINCLUSAO AS DATAULTCM,'
      '       (0) AS FLGDEPREC'
      ''
      'FROM BENSPENDENTES'
      'WHERE IDPESSOA = :PIDPESSOA'
      '  AND IDFORNSERV = :PIDFORNSERV'
      '  AND LTRIM(RTRIM(IDNOTA)) = :PIDNOTA'
      ''
      ''
      '')
    Left = 512
    Top = 27
  end
  object sqlBensPendentes: TCMSqlParams
    SQL.Strings = (
      
        'SELECT BP.IDPESSOA, BP.IDBENSPENDENTES, BP.IDFORNSERV, BP.IDNOTA' +
        ', BP.IDITENSRECDEV, BP.PLACA, BP.DESBEM,'
      
        '       BP.VALORG, BP.IDMODULO, BP.IDGRUPO, BP.IDCLASSEBEM, BP.ID' +
        'CONJUNTO, BP.IDSITUACAO,'
      
        '       BP.CONTROLE, BP.COMPLNOTA, BP.DTANOTA, BP.DTAINCLUSAO, BP' +
        '.NUMSERIE,'
      '       (0) AS IDTERCEIRO,'
      '       (0) AS UNIDNEGOC,'
      '       (0) AS CODSUBCONTA,'
      '       ('#39'I'#39') AS REGISTRO,'
      '       (0.00) AS VALHISTORICO,'
      '       DTAINCLUSAO AS DATAINICIODEP,'
      '       DTAINCLUSAO AS DATAULTDEP,'
      '       DTAINCLUSAO AS DTACONTAB,'
      '       ('#39'                              '#39') AS IDOPCIONAL,'
      '       (0) AS ALTERADO,'
      '       ('#39'                              '#39') AS PROCESSOAQUIS,'
      '       ('#39'                              '#39') AS EMPENHOAQUIS,'
      
        '       ('#39'                                                       ' +
        '     '#39') AS PUBAUTOR,'
      
        '       ('#39'                                                       ' +
        '     '#39') AS PUBEDITORA,'
      '       (0) AS PUBANO,'
      '       S.DESCSITUACAO,'
      '       (0) AS FLGBEMINTCONTAB,'
      '       ('#39'N'#39') AS BAIXATOTAL'
      ''
      'FROM BENSPENDENTES BP,'
      '     SITUACAO S'
      'WHERE BP.IDPESSOA = :PIDPESSOA'
      '  AND BP.IDFORNSERV = :PIDFORNSERV'
      '  AND LTRIM(RTRIM(BP.IDNOTA)) = :PIDNOTA'
      '  AND BP.IDSITUACAO = S.IDSITUACAO(+)'
      ''
      ''
      ''
      ' ')
    Left = 512
    Top = 13
  end
  object sqlTransfHistMovBem: TCMSqlParams
    SQL.Strings = (
      'UPDATE HISTORICOMOVIMENTACAO'
      'SET TRFVALORG      = :TRFVALORG     ,'
      '    TRFCMBEM       = :TRFCMBEM      ,'
      '    TRFDEPLANC     = :TRFDEPLANC    ,'
      '    TRFCMDEP       = :TRFCMDEP      ,'
      '    TRFREAVVALORG  = :TRFREAVVALORG ,'
      '    TRFREAVCMBEM   = :TRFREAVCMBEM  ,'
      '    TRFREAVDEPLANC = :TRFREAVDEPLANC,'
      '    TRFREAVCMDEP   = :TRFREAVCMDEP  ,'
      '    TRFAVVALORG    = :TRFAVVALORG   ,'
      '    TRFAVCMBEM     = :TRFAVCMBEM    ,'
      '    TRFAVDEPLANC   = :TRFAVDEPLANC  ,'
      '    TRFAVCMDEP     = :TRFAVCMDEP'
      'WHERE (IDMOVIMENTACAO = :IDMOVIMENTACAO)')
    Left = 512
    Top = 93
  end
  object sqlRegDataRetSaidaTemp: TCMSqlParams
    SQL.Strings = (
      'UPDATE SAIDATEMPBENS'
      'SET STBDATARETORNO = :STBDATARETORNO'
      'WHERE (IDBEM    = :IDBEM)'
      '  AND (IDSAIDATEMPORARIA = :IDSAIDATEMPORARIA)'
      '  AND (IDPESSOA = :IDPESSOA)')
    Left = 514
    Top = 146
  end
  object sqlSetaFlgSaidaTempBem: TCMSqlParams
    SQL.Strings = (
      'UPDATE BEM'
      'SET FLGSAIDATEMP = :FLGSAIDATEMP'
      'WHERE (IDBEM    = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)')
    Left = 512
    Top = 131
  end
  object sqlExecutaTermoSaidaTemp: TCMSqlParams
    SQL.Strings = (
      'UPDATE SAIDATEMPORARIA'
      'SET STPFLGEXEC = :STPFLGEXEC,'
      '    STPDATA = :STPDATA'
      'WHERE (IDSAIDATEMPORARIA = :IDSAIDATEMPORARIA)'
      '  AND (IDPESSOA = :IDPESSOA)')
    Left = 512
    Top = 151
  end
  object sqlRemItensInvBens: TCMSqlParams
    SQL.Strings = (
      'DELETE ITENSINVBENS'
      'where (IDINVENTARIOBENS = :IDINVENTARIOBENS)'
      '  and (IDEMPRESA        = :IDEMPRESA)')
    Left = 515
    Top = 265
  end
  object sqlBensEscravos: TCMSqlParams
    SQL.Strings = (
      'SELECT IDPESSOA, IDBEM, PLACA'
      'FROM BEM'
      'WHERE SUBSTR(TO_CHAR(PLACA), 1, :TAM) = :PLACABASE'
      '  AND PLACA <> :PLACAMESTRE'
      '  AND IDPESSOA = :IDPESSOA'
      'ORDER BY PLACA'
      '   ')
    Left = 514
    Top = 251
  end
  object sqlInvInsPlaca: TCMSqlParams
    SQL.Strings = (
      'INSERT INTO ITENSINVBENS'
      '(IDINVENTARIOBENS,IDEMPRESA,IIBPLACA,IIBIDBEM,IIBFLGPLACA,'
      ' IIBLOCALATUAL,IIBCONJUNTOATUAL,'
      ' IIBLOCALNOVO,IIBCONJUNTONOVO,IIBFLGSITFISICA)'
      'VALUES'
      '(:IDINVENTARIOBENS,:IDEMPRESA,:IIBPLACA,:IIBIDBEM,:IIBFLGPLACA,'
      ' :IIBLOCALATUAL,:IIBCONJUNTOATUAL,'
      ' :IIBLOCALNOVO,:IIBCONJUNTONOVO,:IIBFLGSITFISICA)')
    Left = 514
    Top = 237
  end
  object sqlImportacaoResultado: TCMSqlParams
    SQL.Strings = (
      'update ITENSINVBENS'
      'set'
      '  IIBFLGPLACA     = :IIBFLGPLACA,'
      '  IIBLOCALNOVO    = :IIBLOCALNOVO,'
      '  IIBCONJUNTONOVO = :IIBCONJUNTONOVO,'
      '  IIBFLGSITFISICA = :IIBFLGSITFISICA'
      'where (IDINVENTARIOBENS = :IDINVENTARIOBENS)'
      '  and (IDEMPRESA        = :IDEMPRESA)'
      '  and (IIBPLACA         = :IIBPLACA)')
    Left = 514
    Top = 223
  end
  object sqlBensNaLocalizacao: TCMSqlParams
    SQL.Strings = (
      'SELECT B.IDBEM,'
      '       B.IDPESSOA,'
      '       B.PLACA,'
      '       B.DESBEM,'
      '       B.IDCLASSEBEM,'
      '       C.IDCONJUNTO,'
      '       C.DESCCONJUNTO,'
      '       L.IDLOCALIZACAO,'
      '       L.NOME AS DESCLOCAL,'
      '       CB.CODHIERARQ,'
      '       CB.DESCRICAO AS DESCCLASSE'
      'FROM CONJUNTO C,'
      '     LOCALIZACAO L,'
      '     BEM B,'
      '     CLASSEDEBEM CB,'
      '     PLANOGRUPO PG,'
      '     GRUPO G'
      'WHERE C.IDLOCALIZACAO = :IDLOCALIZACAO'
      '  AND C.IDPESSOA = :IDPESSOA'
      '  AND G.FLGIMOVEL = 0'
      '  AND B.BAIXATOTAL <> '#39'S'#39
      '  AND C.IDLOCALIZACAO = L.IDLOCALIZACAO'
      '  AND C.IDPESSOA = L.IDPESSOA'
      '  AND C.IDCONJUNTO = B.IDCONJUNTO'
      '  AND C.IDPESSOA = B.IDPESSOA'
      '  AND B.IDCLASSEBEM = CB.IDCLASSEBEM'
      '  AND B.IDPESSOA = PG.IDPESSOA'
      '  AND B.IDGRUPO = PG.IDGRUPO'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      'ORDER BY B.PLACA'
      '')
    Left = 400
    Top = 407
  end
  object sqlItensInvBens: TCMSqlParams
    SQL.Strings = (
      'SELECT I.IDINVENTARIOBENS,'
      '       I.IDEMPRESA,'
      '       I.IIBPLACA,'
      '       I.IIBIDBEM,'
      '       I.IIBFLGPLACA,'
      '       I.IIBLOCALATUAL,'
      '       I.IIBCONJUNTOATUAL,'
      '       I.IIBLOCALNOVO,'
      '       I.IIBCONJUNTONOVO,'
      '       I.IIBFLGSITFISICA,'
      '       B.PLACA,'
      
        '       DECODE(B.DESBEM,NULL,'#39'PLACA NÃO CADASTRADA'#39',B.DESBEM) AS ' +
        'DESBEM,'
      '       B.IDBEM,'
      '       B.IDPESSOA,'
      '       C.IDCONJUNTO,'
      '       C.DESCCONJUNTO,'
      '       L.IDLOCALIZACAO,'
      '       L.NOME AS DESCLOCAL,'
      '       G.NOME AS DESCGRUPO,'
      '       CB.IDCLASSEBEM,'
      '       CB.CODHIERARQ,'
      '       CB.DESCRICAO AS DESCCLASSE,'
      '       ('#39'                    '#39') AS RESULTADO'
      'FROM ITENSINVBENS I,'
      '     BEM B,'
      '     CONJUNTO C,'
      '     LOCALIZACAO L,'
      '     CLASSEDEBEM CB,'
      '     GRUPO G'
      'WHERE I.IDINVENTARIOBENS = :IDINVENTARIOBENS'
      '  AND I.IDEMPRESA = :IDEMPRESA'
      '  AND I.IIBIDBEM = B.IDBEM'
      '  AND I.IDEMPRESA = B.IDPESSOA'
      '  AND B.IDCLASSEBEM = CB.IDCLASSEBEM'
      '  AND B.IDPESSOA = C.IDPESSOA'
      '  AND B.IDGRUPO = G.IDGRUPO'
      '  AND B.IDCONJUNTO = C.IDCONJUNTO'
      '  AND C.IDLOCALIZACAO = L.IDLOCALIZACAO'
      '  AND C.IDPESSOA = L.IDPESSOA'
      'ORDER BY C.IDLOCALIZACAO, B.IDCLASSEBEM, B.PLACA'
      '')
    Left = 514
    Top = 197
  end
  object sqlSaldoContabilGrupo: TCMSqlParams
    SQL.Strings = (
      
        'SELECT SB.IDGRUPO, G.CLASSE, COUNT(*) AS QUANT, SB.MOECODIGO, SB' +
        '.IDSLDCTBBEMXDEP,'
      ''
      
        '       ROUND(SUM(NVL(SB.VALORG,0) + NVL(SB.REAVVALORG,0) + NVL(S' +
        'B.ULTREAVVALORG,0)),2)       AS VALORG0,'
      
        '       ROUND(SUM(NVL(SB.CMBEM,0) + NVL(SB.REAVCMBEM,0) + NVL(SB.' +
        'ULTREAVCMBEM,0)),2)          AS CMBEM0,'
      
        '       ROUND(SUM(NVL(ATU.VALCMBEM,0) + NVL(ATU.VALCMREAV,0) + NV' +
        'L(ATU.VALCMULTREAV,0)),2)    AS CMBEMATU0,'
      
        '       ROUND(SUM(NVL(ATU.VALDEPBEM,0) + NVL(ATU.VALDEPREAV,0) + ' +
        'NVL(ATU.VALDEPULTREAV,0)),2) AS DEPLANCATU0,'
      
        '       ROUND(SUM(NVL(SB.DEPLANC,0) + NVL(SB.REAVDEPLANC,0) + NVL' +
        '(SB.ULTREAVDEPLANC,0)),2)    AS DEPLANC0,'
      
        '       ROUND(SUM(NVL(SB.CMDEP,0) + NVL(SB.REAVCMDEP,0) + NVL(SB.' +
        'ULTREAVCMDEP,0)),2)          AS CMDEP0,'
      '       ROUND(SUM(NVL(SB.VALORG,0) + NVL(SB.CMBEM,0) -'
      '                 NVL(SB.DEPLANC,0) - NVL(SB.CMDEP,0)+'
      '                 NVL(SB.REAVVALORG,0) + NVL(SB.REAVCMBEM,0) -'
      '                 NVL(SB.REAVDEPLANC,0) - NVL(SB.REAVCMDEP,0) +'
      
        '                 NVL(SB.ULTREAVVALORG,0) + NVL(SB.ULTREAVCMBEM,0' +
        ') -'
      
        '                 NVL(SB.ULTREAVDEPLANC,0) - NVL(SB.ULTREAVCMDEP,' +
        '0)),2)                       AS VALCTB0'
      ''
      
        'FROM (SELECT SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM, SCB1.MO' +
        'ECODIGO, SCD1.IDSLDCTBBEMXDEP,'
      
        '             SCB1.VALORG,  SCB1.REAVVALORG,    SCB1.ULTREAVVALOR' +
        'G,'
      
        '             SCB1.CMBEM,   SCB1.REAVCMBEM,     SCB1.ULTREAVCMBEM' +
        ','
      
        '             SCD1.DEPLANC, SCD1.REAVDEPLANC,   SCD1.ULTREAVDEPLA' +
        'NC,'
      
        '             SCD1.CMDEP,   SCD1.REAVCMDEP,     SCD1.ULTREAVCMDEP' +
        ','
      
        '             SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVE' +
        'L'
      '      FROM SALDOCONTABBEM SCB1,'
      '           SLDCTBBEMXDEP  SCD1,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :DATASLD)'
      '              AND (MOECODIGO = :MOECODIGO)'
      '              AND (IDPESSOA = :IDPESSOA)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB1.IDPESSOA        = :IDPESSOA)'
      '        AND (SCB1.MOECODIGO       = :MOECODIGO)'
      '        AND (SCD1.IDSLDCTBBEMXDEP = :IDTAXADEP)'
      '        AND (SCB1.DATASLDBEM      = DTAMAX.DATA)'
      '        AND (SCB1.IDBEM           = DTAMAX.IDBEM)'
      '        AND (SCB1.IDBEM           = SCD1.IDBEM)'
      '        AND (SCB1.IDPESSOA        = SCD1.IDPESSOA)'
      '        AND (SCB1.MOECODIGO       = SCD1.MOECODIGO)'
      '        AND (SCB1.DATASLDBEM      = SCD1.DATASLDBEM) ) SB,'
      ''
      '     (SELECT ATX.IDBEM, ATX.DATAMOVIMENTACAO,'
      
        '             SUM(ATX.VLCMBEM) AS VALCMBEM, SUM(ATX.VLCMREAV) AS ' +
        'VALCMREAV,'
      
        '             SUM(ATX.VLDEPBEM) AS VALDEPBEM, SUM(ATX.VLDEPREAV) ' +
        'AS VALDEPREAV,'
      
        '             SUM(ATX.VLCMULTREAV) AS VALCMULTREAV, SUM(ATX.VLDEP' +
        'ULTREAV) AS VALDEPULTREAV'
      '      FROM ((SELECT HM.IDBEM,     /* C.M. CUSTO */'
      '                    HM.DATAMOVIMENTACAO,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(VM.V' +
        'ALOR,0),'
      
        '                                                     34,NVL(VM.V' +
        'ALOR,0),'
      
        '                                                     50,NVL(VM.V' +
        'ALOR,0),0)) AS  VLCMBEM,'
      
        '                    (0)                                         ' +
        '            AS  VLCMREAV,'
      
        '                    (0)                                         ' +
        '            AS  VLDEPBEM,'
      
        '                    (0)                                         ' +
        '            AS  VLDEPREAV,'
      
        '                    (0)                                         ' +
        '            AS  VLCMULTREAV,'
      
        '                    (0)                                         ' +
        '            AS  VLDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM,'
      '                  VLRHISTMOVBEM VM'
      '             WHERE (HM.IDPESSOA         = :IDPESSOA)'
      
        '               AND ((HM.DATAMOVIMENTACAO >= :DATAINI) AND (HM.DA' +
        'TAMOVIMENTACAO <= :DATASLD))'
      '               AND (VM.MOECODIGO        = :MOECODIGO)'
      '               AND (HM.IDMOVIMENTACAO   = VM.IDMOVIMENTACAO(+))'
      '             GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '            (SELECT HM.IDBEM,     /* DEPRECIACAO CUSTO */'
      '                    HM.DATAMOVIMENTACAO,'
      
        '                    (0)                                         ' +
        '            AS  VLCMBEM,'
      
        '                    (0)                                         ' +
        '            AS  VLCMREAV,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(VM.V' +
        'ALOR,0),'
      
        '                                                     17,NVL(VM.V' +
        'ALOR,0),'
      
        '                                                     35,NVL(VM.V' +
        'ALOR,0),0)) AS  VLDEPBEM,'
      
        '                    (0)                                         ' +
        '            AS  VLDEPREAV,'
      
        '                    (0)                                         ' +
        '            AS  VLCMULTREAV,'
      
        '                    (0)                                         ' +
        '            AS  VLDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM,'
      '                  VLRHISTMOVBEM VM'
      '             WHERE (HM.IDPESSOA         = :IDPESSOA)'
      
        '               AND ((HM.DATAMOVIMENTACAO >= :DATAINI) AND (HM.DA' +
        'TAMOVIMENTACAO <= :DATASLD))'
      '               AND (VM.MOECODIGO        = :MOECODIGO)'
      '               AND (VM.IDTAXADEP        = :IDTAXADEP)'
      '               AND (HM.IDMOVIMENTACAO   = VM.IDMOVIMENTACAO(+))'
      '             GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      
        '            (SELECT HM.IDBEM,     /* C.M. REAVALIACOES ANTERIORE' +
        'S */'
      '                    HM.DATAMOVIMENTACAO,'
      
        '                    (0)                                         ' +
        '            AS  VALCMBEM,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(VM.V' +
        'ALOR,0),0)) AS  VALCMREAV,'
      
        '                    (0)                                         ' +
        '            AS  VALDEPBEM,'
      
        '                    (0)                                         ' +
        '            AS  VALDEPREAV,'
      
        '                    (0)                                         ' +
        '            AS  VALCMULTREAV,'
      
        '                    (0)                                         ' +
        '            AS  VALDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM,'
      '                  VLRHISTMOVBEM VM,'
      '                  REAVALIACAO R'
      '             WHERE (HM.IDPESSOA         = :IDPESSOA)'
      
        '               AND ((HM.DATAMOVIMENTACAO >= :DATAINI) AND (HM.DA' +
        'TAMOVIMENTACAO <= :DATASLD))'
      '               AND (VM.MOECODIGO        = :MOECODIGO)'
      '               AND (R.FLGULTREAVAL      = 0)'
      '               AND (HM.IDMOVIMENTACAO   = VM.IDMOVIMENTACAO(+))'
      '               AND (HM.IDREAVALACRESC   = R.IDREAVALIACAO(+))'
      '             GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      
        '            (SELECT HM.IDBEM,     /* DEPRECIACAO REAVALIACOES AN' +
        'TERIORES */'
      '                    HM.DATAMOVIMENTACAO,'
      
        '                    (0)                                         ' +
        '             AS VALCMBEM,'
      
        '                    (0)                                         ' +
        '             AS VALCMREAV,'
      
        '                    (0)                                         ' +
        '             AS VALDEPBEM,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(VM.V' +
        'ALOR,0),'
      
        '                                                     33,NVL(VM.V' +
        'ALOR,0),0))  AS VALDEPREAV,'
      
        '                    (0)                                         ' +
        '             AS VALCMULTREAV,'
      
        '                    (0)                                         ' +
        '             AS VALDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM,'
      '                  VLRHISTMOVBEM VM,'
      '                  REAVALIACAO R'
      '             WHERE (HM.IDPESSOA         = :IDPESSOA)'
      
        '               AND ((HM.DATAMOVIMENTACAO >= :DATAINI) AND (HM.DA' +
        'TAMOVIMENTACAO <= :DATASLD))'
      '               AND (VM.MOECODIGO        = :MOECODIGO)'
      '               AND (VM.IDTAXADEP        = :IDTAXADEP)'
      '               AND (R.FLGULTREAVAL      = 0)'
      '               AND (HM.IDMOVIMENTACAO   = VM.IDMOVIMENTACAO(+))'
      '               AND (HM.IDREAVALACRESC   = R.IDREAVALIACAO(+))'
      '             GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '            (SELECT HM.IDBEM,   /* C.M. REAVALIACOES ATUAIS */'
      '                    HM.DATAMOVIMENTACAO,'
      
        '                    (0)                                         ' +
        '             AS VALCMBEM,'
      
        '                    (0)                                         ' +
        '             AS VALCMREAV,'
      
        '                    (0)                                         ' +
        '             AS VALDEPBEM,'
      
        '                    (0)                                         ' +
        '             AS VALDEPREAV,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(VM.V' +
        'ALOR,0),0))  AS VALCMULTREAV,'
      
        '                    (0)                                         ' +
        '             AS VALDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM,'
      '                  VLRHISTMOVBEM VM,'
      '                  REAVALIACAO R'
      '             WHERE (HM.IDPESSOA         = :IDPESSOA)'
      
        '               AND ((HM.DATAMOVIMENTACAO >= :DATAINI) AND (HM.DA' +
        'TAMOVIMENTACAO <= :DATASLD))'
      '               AND (VM.MOECODIGO        = :MOECODIGO)'
      '               AND (R.FLGULTREAVAL      = 1)'
      '               AND (HM.IDMOVIMENTACAO   = VM.IDMOVIMENTACAO(+))'
      '               AND (HM.IDREAVALACRESC   = R.IDREAVALIACAO(+))'
      '             GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      
        '            (SELECT HM.IDBEM,   /* DEPRECIACAO REAVALIACOES ATUA' +
        'IS */'
      '                    HM.DATAMOVIMENTACAO,'
      
        '                    (0)                                         ' +
        '             AS VALCMBEM,'
      
        '                    (0)                                         ' +
        '             AS VALCMREAV,'
      
        '                    (0)                                         ' +
        '             AS VALDEPBEM,'
      
        '                    (0)                                         ' +
        '             AS VALDEPREAV,'
      
        '                    (0)                                         ' +
        '             AS VALCMULTREAV,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(VM.V' +
        'ALOR,0),'
      
        '                                                     33,NVL(VM.V' +
        'ALOR,0),0))  AS VALDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM,'
      '                  VLRHISTMOVBEM VM,'
      '                  REAVALIACAO R'
      '             WHERE (HM.IDPESSOA         = :IDPESSOA)'
      
        '               AND ((HM.DATAMOVIMENTACAO >= :DATAINI) AND (HM.DA' +
        'TAMOVIMENTACAO <= :DATASLD))'
      '               AND (VM.MOECODIGO        = :MOECODIGO)'
      '               AND (VM.IDTAXADEP        = :IDTAXADEP)'
      '               AND (R.FLGULTREAVAL      = 1)'
      '               AND (HM.IDMOVIMENTACAO   = VM.IDMOVIMENTACAO(+))'
      '               AND (HM.IDREAVALACRESC   = R.IDREAVALIACAO(+))'
      '             GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) ) ATX'
      ''
      '      GROUP BY ATX.IDBEM, ATX.DATAMOVIMENTACAO) ATU,'
      ''
      '      GRUPO G, BEM B'
      ''
      'WHERE (SB.IDPESSOA        = :IDPESSOA)'
      '  AND (SB.MOECODIGO       = :MOECODIGO)'
      '  AND (SB.IDSLDCTBBEMXDEP = :IDTAXADEP)'
      ''
      '  AND (G.FLGIMOVEL = 0)'
      '  AND (B.CONTROLE = '#39'T'#39')'
      '  AND (SB.IDGRUPO         = G.IDGRUPO)'
      '  AND (SB.IDBEM           = B.IDBEM)'
      '  AND (SB.IDPESSOA        = B.IDPESSOA)'
      '  AND (SB.IDBEM           = ATU.IDBEM(+))'
      '  AND (SB.DATASLDBEM      = ATU.DATAMOVIMENTACAO(+))'
      'GROUP BY SB.IDGRUPO, G.CLASSE')
    Left = 344
    Top = 13
  end
  object sqlCafObraRateio: TCMSqlParams
    SQL.Strings = (
      'SELECT R.IDCAFOBRA, R.IDPESSOA, R.IDEMPRESA, R.CODCENTROCUSTO,'
      '       R.PARTICIPACAO, CC.NOME AS DESCCCUSTO'
      'FROM CAFOBRARATEIO R,'
      '     CENTCUST CC'
      'WHERE R.IDCAFOBRA = :IDCAFOBRA'
      '  AND R.IDPESSOA = :IDPESSOA'
      '  AND R.CODCENTROCUSTO = CC.CODCENTROCUSTO'
      '  AND R.IDEMPRESA = CC.IDEMPRESA'
      'ORDER BY R.PARTICIPACAO, CC.CODCENTROCUSTO'
      '')
    Left = 400
    Top = 171
  end
  object sqlBaixaAtuAcresc: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */ AM.VALORG, AM.CMBEM, AD.DEPLANC, AD.CMDEP,'
      
        '       (NVL(ACRESACUM.VALACRESACUM,0) - NVL(BXACRESACUM.BXVALACR' +
        'ESACUM,0)) AS VALORG0,'
      
        '       (NVL(CMACRESACUM.VALCMACRESACUM,0) - NVL(BXCMACRESACUM.BX' +
        'VALCMACRESACUM,0)) AS CMBEM0,'
      
        '       (NVL(DEPACRESACUM.VALDEPACRESACUM,0) - NVL(BXDEPACRESACUM' +
        '.BXVALDEPACRESACUM,0)) AS DEPLANC0,'
      
        '       (NVL(CMDEPACRESACUM.VALCMDEPACRESACUM,0) - NVL(BXCMDEPACR' +
        'ESACUM.BXVALCMDEPACRESACUM,0)) AS CMDEP0'
      ''
      'FROM ACRESCIMOVALOR A, ACRESCVALORXMOEDA AM, ACRESCVALORXDEP AD,'
      ''
      
        '   (SELECT HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.VALOR,0)) AS ' +
        'VALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDREAVALACRESC = :IDACRESCIMO)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (09,49))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, HM.IDREAVALACRESC) ACRESACUM,'
      ''
      
        '   (SELECT HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.VALOR,0)) AS ' +
        'VALCMACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDREAVALACRESC = :IDACRESCIMO)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (34,50))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, HM.IDREAVALACRESC) CMACRESACUM,'
      ''
      
        '   (SELECT HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.VALOR,0)) AS ' +
        'VALDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDREAVALACRESC = :IDACRESCIMO)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (35,51))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, HM.IDREAVALACRESC) DEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.VALOR,0)) AS ' +
        'VALCMDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDREAVALACRESC = :IDACRESCIMO)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (36,52))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, HM.IDREAVALACRESC) CMDEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.VALOR,0)) AS ' +
        'BXVALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDREAVALACRESC = :IDACRESCIMO)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (37,91))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, HM.IDREAVALACRESC) BXACRESACUM,'
      ''
      
        '   (SELECT HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.VALOR,0)) AS ' +
        'BXVALCMACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDREAVALACRESC = :IDACRESCIMO)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (38,92))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, HM.IDREAVALACRESC) BXCMACRESACUM,'
      ''
      
        '   (SELECT HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.VALOR,0)) AS ' +
        'BXVALDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDREAVALACRESC = :IDACRESCIMO)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (39,93))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, HM.IDREAVALACRESC) BXDEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.VALOR,0)) AS ' +
        'BXVALCMDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDREAVALACRESC = :IDACRESCIMO)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (40,94))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, HM.IDREAVALACRESC) BXCMDEPACRESACUM'
      ''
      'WHERE (A.IDBEM = :IDBEM)'
      '  AND (A.IDPESSOA = :IDPESSOA)'
      '  AND (A.IDACRESCIMO = :IDACRESCIMO)'
      '  AND (A.DATAACRESCIMO <= :DATAMOV)'
      '  AND (AM.MOECODIGO = :MOECODIGO)'
      '  AND (AD.IDACRESCIMOXDEP = :IDTAXADEP)'
      '  AND (A.IDACRESCIMO = AM.IDACRESCIMO)'
      '  AND (A.IDACRESCIMO = AD.IDACRESCIMO(+))'
      '  AND (A.IDBEM = ACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = ACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = CMACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = CMACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = DEPACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = DEPACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = CMDEPACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = CMDEPACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = BXACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = BXACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = BXCMACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = BXCMACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = BXDEPACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = BXDEPACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = BXCMDEPACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = BXCMDEPACRESACUM.IDREAVALACRESC(+))'
      '')
    Left = 557
    Top = 42
  end
  object sqlBaixaAtuReaval: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */ RM.VALORG, RM.CMBEM, RD.DEPLANC, RD.CMDEP,'
      
        '       (NVL(REAVACUM.VALREAVACUM,0) - NVL(BXREAVACUM.BXVALREAVAC' +
        'UM,0)) AS VALORG0,'
      
        '       (NVL(CMREAVACUM.VALCMREAVACUM,0) - NVL(BXCMREAVACUM.BXVAL' +
        'CMREAVACUM,0)) AS CMBEM0,'
      
        '       (NVL(DEPREAVACUM.VALDEPREAVACUM,0) - NVL(BXDEPREAVACUM.BX' +
        'VALDEPREAVACUM,0)) AS DEPLANC0,'
      
        '       (NVL(CMDEPREAVACUM.VALCMDEPREAVACUM,0) - NVL(BXCMDEPREAVA' +
        'CUM.BXVALCMDEPREAVACUM,0)) AS CMDEP0'
      ''
      'FROM REAVALIACAO R, REAVALXMOEDA RM, REAVALXDEP RD,'
      ''
      
        '   (SELECT HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.VALOR,0)) AS ' +
        'VALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDREAVALACRESC = :IDREAVALIACAO)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (08,32,45,82))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, HM.IDREAVALACRESC) REAVACUM,'
      ''
      
        '   (SELECT HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.VALOR,0)) AS ' +
        'VALCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDREAVALACRESC = :IDREAVALIACAO)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, HM.IDREAVALACRESC) CMREAVACUM,'
      ''
      
        '   (SELECT HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.VALOR,0)) AS ' +
        'VALDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDREAVALACRESC = :IDREAVALIACAO)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (18,33,47))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, HM.IDREAVALACRESC) DEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.VALOR,0)) AS ' +
        'VALCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDREAVALACRESC = :IDREAVALIACAO)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, HM.IDREAVALACRESC) CMDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.VALOR,0)) AS ' +
        'BXVALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDREAVALACRESC = :IDREAVALIACAO)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (20,87))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, HM.IDREAVALACRESC) BXREAVACUM,'
      ''
      
        '   (SELECT HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.VALOR,0)) AS ' +
        'BXVALCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDREAVALACRESC = :IDREAVALIACAO)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (28,88))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, HM.IDREAVALACRESC) BXCMREAVACUM,'
      ''
      
        '   (SELECT HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.VALOR,0)) AS ' +
        'BXVALDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDREAVALACRESC = :IDREAVALIACAO)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (27,89))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, HM.IDREAVALACRESC) BXDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDBEM, HM.IDREAVALACRESC, SUM(NVL(VM.VALOR,0)) AS ' +
        'BXVALCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDREAVALACRESC = :IDREAVALIACAO)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (29,90))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM, HM.IDREAVALACRESC) BXCMDEPREAVACUM'
      ''
      'WHERE (R.IDBEM = :IDBEM)'
      '  AND (R.IDPESSOA = :IDPESSOA)'
      '  AND (R.IDREAVALIACAO = :IDREAVALIACAO)'
      '  AND (R.DATAREAVALIACAO <= :DATAMOV)'
      '  AND (RM.MOECODIGO = :MOECODIGO)'
      '  AND (RD.IDREAVALXDEP = :IDTAXADEP)'
      '  AND (R.IDREAVALIACAO = RM.IDREAVALIACAO)'
      '  AND (R.IDREAVALIACAO = RD.IDREAVALIACAO(+))'
      '  AND (R.IDBEM = REAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = REAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = CMREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = CMREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = DEPREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = DEPREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = CMDEPREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = CMDEPREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = BXREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = BXCMREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXCMREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = BXDEPREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXDEPREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = BXCMDEPREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXCMDEPREAVACUM.IDREAVALACRESC(+))'
      ''
      ' '
      '')
    Left = 557
    Top = 28
  end
  object sqlBaixaAtuBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ BM.VALORG, BM.CMBEM, BD.DEPLANC, BD.CMDEP, B.' +
        'PLACA,'
      
        '       (NVL(BEMACUM.VALBEMACUM,0) - NVL(BXBEMACUM.BXVALBEMACUM,0' +
        ')) AS VALORG0,'
      
        '       (NVL(CMBEMACUM.VALCMBEMACUM,0) - NVL(BXCMBEMACUM.BXVALCMB' +
        'EMACUM,0)) AS CMBEM0,'
      
        '       (NVL(DEPBEMACUM.VALDEPBEMACUM,0) - NVL(BXDEPBEMACUM.BXVAL' +
        'DEPBEMACUM,0)) AS DEPLANC0,'
      
        '       (NVL(CMDEPBEMACUM.VALCMDEPBEMACUM,0) - NVL(BXCMDEPBEMACUM' +
        '.BXVALCMDEPBEMACUM,0)) AS CMDEP0'
      ''
      'FROM BEM B, BEMXMOEDA BM, BEMXDEP BD,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (01,03,81,41,07))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BEMACUM,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (15,42))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) CMBEMACUM,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (14,17,43))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) DEPBEMACUM,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALCMDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (21,44))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) CMDEPBEMACUM,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (06,13,16,83))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXBEMACUM,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (25,84))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXCMBEMACUM,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (24,85))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXDEPBEMACUM,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALCMDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.IDTIPOMOVIMENTACAO IN (26,86))'
      '      AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXCMDEPBEMACUM'
      ''
      'WHERE (B.IDBEM = :IDBEM)'
      '  AND (B.IDPESSOA = :IDPESSOA)'
      '  AND (BM.MOECODIGO = :MOECODIGO)'
      '  AND (BD.IDBEMXDEP = :IDTAXADEP)'
      '  AND (B.DATAINICIODEP <= :DATAMOV)'
      '  AND (B.IDBEM = BM.IDBEM)'
      '  AND (B.IDPESSOA = BM.IDPESSOA)'
      '  AND (B.IDBEM = BD.IDBEM(+))'
      '  AND (B.IDPESSOA = BD.IDPESSOA(+))'
      '  AND (B.IDBEM = BEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPBEMACUM.IDBEM(+))'
      '')
    Left = 558
    Top = 14
  end
  object sqlMovBaixaAcresc: TCMSqlParams
    SQL.Strings = (
      
        'SELECT HM.IDMOVIMENTACAO, HM.IDREAVALACRESC, HM.IDTIPOMOVIMENTAC' +
        'AO,'
      '       HM.PROPBAIXA, HM.TIPDEPPRORATA, HM.PLNCODIGO,'
      '       VM.MOECODIGO, VM.IDTAXADEP, VM.VALOR'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     VLRHISTMOVBEM VM'
      'WHERE HM.IDBEM = :IDBEM'
      '  AND HM.DATAMOVIMENTACAO = :DATAMOV'
      '  AND HM.IDREAVALACRESC = :IDREAVALACRESC'
      
        '  AND (HM.IDTIPOMOVIMENTACAO = 37 OR HM.IDTIPOMOVIMENTACAO = 38 ' +
        'OR HM.IDTIPOMOVIMENTACAO = 39 OR'
      
        '       HM.IDTIPOMOVIMENTACAO = 40 OR HM.IDTIPOMOVIMENTACAO = 91 ' +
        'OR HM.IDTIPOMOVIMENTACAO = 92 OR'
      '       HM.IDTIPOMOVIMENTACAO = 93 OR HM.IDTIPOMOVIMENTACAO = 94)'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+)'
      'ORDER BY HM.IDTIPOMOVIMENTACAO, VM.MOECODIGO, VM.IDTAXADEP'
      '')
    Left = 557
    Top = 162
  end
  object sqlMovBaixaReaval: TCMSqlParams
    SQL.Strings = (
      
        'SELECT HM.IDMOVIMENTACAO, HM.IDREAVALACRESC, HM.IDTIPOMOVIMENTAC' +
        'AO,'
      '       HM.PROPBAIXA, HM.TIPDEPPRORATA, HM.PLNCODIGO,'
      '       VM.MOECODIGO, VM.IDTAXADEP, VM.VALOR'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     VLRHISTMOVBEM VM'
      'WHERE HM.IDBEM = :IDBEM'
      '  AND HM.DATAMOVIMENTACAO = :DATAMOV'
      '  AND HM.IDREAVALACRESC = :IDREAVALACRESC'
      
        '  AND (HM.IDTIPOMOVIMENTACAO = 20 OR HM.IDTIPOMOVIMENTACAO = 28 ' +
        'OR HM.IDTIPOMOVIMENTACAO = 27 OR'
      
        '       HM.IDTIPOMOVIMENTACAO = 29 OR HM.IDTIPOMOVIMENTACAO = 87 ' +
        'OR HM.IDTIPOMOVIMENTACAO = 88 OR'
      '       HM.IDTIPOMOVIMENTACAO = 89 OR HM.IDTIPOMOVIMENTACAO = 90)'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+)'
      'ORDER BY HM.IDTIPOMOVIMENTACAO, VM.MOECODIGO, VM.IDTAXADEP')
    Left = 557
    Top = 148
  end
  object sqlMovBaixaBem: TCMSqlParams
    SQL.Strings = (
      'SELECT HM.IDMOVIMENTACAO, HM.PLNCODIGO, HM.IDTIPOMOVIMENTACAO,'
      
        '       HM.PROPBAIXA, HM.TIPDEPPRORATA, VM.MOECODIGO, VM.IDTAXADE' +
        'P, VM.VALOR'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     VLRHISTMOVBEM VM'
      'WHERE HM.IDBEM = :IDBEM'
      '  AND HM.DATAMOVIMENTACAO = :DATAMOV'
      
        '  AND (HM.IDTIPOMOVIMENTACAO = 06 OR HM.IDTIPOMOVIMENTACAO = 13 ' +
        'OR HM.IDTIPOMOVIMENTACAO = 16 OR'
      
        '       HM.IDTIPOMOVIMENTACAO = 25 OR HM.IDTIPOMOVIMENTACAO = 24 ' +
        'OR HM.IDTIPOMOVIMENTACAO = 26 OR'
      
        '       HM.IDTIPOMOVIMENTACAO = 83 OR HM.IDTIPOMOVIMENTACAO = 84 ' +
        'OR HM.IDTIPOMOVIMENTACAO = 85 OR'
      '       HM.IDTIPOMOVIMENTACAO = 86)'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+)'
      'ORDER BY HM.IDTIPOMOVIMENTACAO, VM.MOECODIGO, VM.IDTAXADEP'
      '')
    Left = 558
    Top = 134
  end
  object sqlRegistraBemTotal: TCMSqlParams
    SQL.Strings = (
      'UPDATE BEM'
      'SET CONTROLE        = '#39'T'#39','
      '    IDGRUPO         = :IDGRUPO,'
      '    CODSUBCONTA     = :CODSUBCONTA,'
      '    UNIDNEGOC       = :UNIDNEGOC,'
      '    VALHISTORICO    = :VALHISTORICO,'
      '    VALDEPINI       = 0,'
      '    DATAINICIODEP   = :DATAINICIODEP,'
      '    DATAULTDEP      = :DATAINICIODEP,'
      '    FLGBEMINTCONTAB = :FLGBEMINTCONTAB,'
      '    DTACONTAB       = :DTACONTAB '
      'WHERE (IDBEM    = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)')
    Left = 558
    Top = 262
  end
  object sqlMovReavalBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT HM.IDMOVIMENTACAO, HM.PLNCODIGO, HM.IDTIPOMOVIMENTACAO, H' +
        'M.IDREAVALACRESC,'
      
        '       HM.TIPDEPPRORATA, HR.MOECODIGO, HR.IDTAXADEP, HR.TAXADEPA' +
        'NT'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     HMBREAVAL HR'
      'WHERE HM.IDBEM = :IDBEM'
      '  AND HM.DATAMOVIMENTACAO = :DATAMOV'
      
        '  AND (HM.IDTIPOMOVIMENTACAO = 08 OR HM.IDTIPOMOVIMENTACAO = 53 ' +
        'OR HM.IDTIPOMOVIMENTACAO = 54)'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND HM.IDMOVIMENTACAO = HR.IDMOVIMENTACAO(+)'
      'ORDER BY HM.IDTIPOMOVIMENTACAO, HR.MOECODIGO, HR.IDTAXADEP'
      '')
    Left = 558
    Top = 310
  end
  object sqlListaSelBaixaBens: TCMSqlParams
    SQL.Strings = (
      'SELECT SBB.IDSELBAIXA, SBB.IDBEM, SBB.IDPESSOA,'
      
        '       SBB.IDCONJATUAL, SBB.IDLOCALATUAL, SBB.IDRESPATUAL, SBB.I' +
        'DGRUPATUAL,'
      
        '       SBB.IDCONJUNTO, SBB.IDLOCALIZACAO, SBB.IDRESPONSAVEL, SBB' +
        '.IDGRUPO,'
      '       SBB.SBBVALVENDA,'
      '       B.PLACA, B.DESBEM, C.DESCCONJUNTO,'
      '       G.NOME AS DESCGRUPO,'
      '       L.NOME AS DESCLOCAL, R.NOME AS NOMERESP,'
      '       B.IDCONJUNTO AS IDCONJUNTOATUAL,'
      '       B.IDGRUPO AS IDGRUPOATUAL,'
      '       C.IDLOCALIZACAO AS IDLOCALIZACAOATUAL,'
      '       C.IDRESPONSAVEL AS IDRESPONSAVELATUAL,'
      '       B.IDCLASSEBEM, B.BAIXATOTAL,'
      '       SCB.VALORG,'
      '       (SCB.VALORG + SCB.CMBEM -'
      '        SCD.DEPLANC - SCD.CMDEP +'
      '        SCB.REAVVALORG + SCB.REAVCMBEM -'
      '        SCD.REAVDEPLANC - SCD.REAVCMDEP +'
      '        SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM -'
      '        SCD.ULTREAVDEPLANC - SCD.ULTREAVCMDEP) AS VALCTB'
      ''
      'FROM SELBAIXABENS SBB,'
      '     BEM B, CONJUNTO C, GRUPO G, LOCALIZACAO L, PESSOA R,'
      '     SALDOCONTABBEM SCB, SLDCTBBEMXDEP SCD,'
      '     (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '      FROM SALDOCONTABBEM'
      '      WHERE (DATASLDBEM <= :DATASLDBEM)'
      '        AND (MOECODIGO = :MOECODIGO)'
      '        AND (IDPESSOA = :IDPESSOA)'
      '      GROUP BY IDBEM) DTAMAX'
      ''
      'WHERE (SBB.IDSELBAIXA = :IDSELBAIXA)'
      '  AND (SBB.IDPESSOA = :IDPESSOA)'
      '  AND (SCB.MOECODIGO = :MOECODIGO)'
      '  AND (SCD.IDSLDCTBBEMXDEP = :IDTAXADEP)'
      '  AND (SBB.IDBEM       = B.IDBEM)'
      '  AND (SBB.IDPESSOA    = B.IDPESSOA)'
      '  AND (B.IDCONJUNTO    = C.IDCONJUNTO)'
      '  AND (B.IDPESSOA      = C.IDPESSOA)'
      '  AND (B.IDGRUPO       = G.IDGRUPO)'
      '  AND (C.IDLOCALIZACAO = L.IDLOCALIZACAO)'
      '  AND (C.IDPESSOA      = L.IDPESSOA)'
      '  AND (C.IDRESPONSAVEL = R.IDPESSOA)'
      '  AND (SBB.IDBEM       = SCB.IDBEM)'
      '  AND (SBB.IDPESSOA    = SCB.IDPESSOA)'
      '  AND (SCB.IDBEM       = DTAMAX.IDBEM)'
      '  AND (SCB.DATASLDBEM  = DTAMAX.DATA)'
      '  AND (SCB.IDBEM       = SCD.IDBEM)'
      '  AND (SCB.IDPESSOA    = SCD.IDPESSOA)'
      '  AND (SCB.MOECODIGO   = SCD.MOECODIGO)'
      '  AND (SCB.DATASLDBEM  = SCD.DATASLDBEM)'
      ''
      'ORDER BY B.PLACA'
      '')
    Left = 558
    Top = 214
  end
  object sqlExisteMovimentacao: TCMSqlParams
    SQL.Strings = (
      'SELECT HM.DATAMOVIMENTACAO'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     BEM B,'
      '     GRUPO G,'
      '     PLANOGRUPO PG'
      
        'WHERE ((G.FLGIMOVEL = :FLGIMOVELINI) OR (G.FLGIMOVEL = :FLGIMOVE' +
        'LFIM))'
      '  AND (HM.DATAMOVIMENTACAO > :DATAMOV)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 01)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 03)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 32)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 17)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 04)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 67)'
      '  AND (HM.IDTIPOMOVIMENTACAO <> 68)'
      '  AND (HM.IDPESSOA = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (HM.IDBEM  = B.IDBEM)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      ''
      ' '
      ' '
      ' ')
    Left = 184
    Top = 131
  end
  object sqlVerificaContaxCC: TCMSqlParams
    SQL.Strings = (
      'SELECT PLANO, PLACONTA, CODCENTROCUSTO, IDEMPRESA'
      'FROM CONTASXCC'
      'WHERE (PLANO = :PLANO)'
      '  AND (RTRIM(PLACONTA) = :PLACONTA)'
      '  AND (RTRIM(CODCENTROCUSTO) = :CODCENTROCUSTO)'
      '  AND (IDEMPRESA = :IDEMPRESA)'
      '')
    Left = 400
    Top = 219
  end
  object sqlNewDataUltFec: TCMSqlParams
    SQL.Strings = (
      'UPDATE PLANOGRUPO'
      'SET DATAULTFEC = :DATAULTDEP'
      'WHERE (IDGRUPO = :IDGRUPO)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '')
    Left = 400
    Top = 268
  end
  object sqlIniciaMTDep: TCMSqlParams
    SQL.Strings = (
      'INSERT INTO SLDCTBBEMXDEP (IDBEM,'
      '                           IDPESSOA,'
      '                           DATASLDBEM,'
      '                           MOECODIGO,'
      '                           IDSLDCTBBEMXDEP,'
      '                           DEPLANC,'
      '                           CMDEP,'
      '                           REAVDEPLANC,'
      '                           REAVCMDEP,'
      '                           ULTREAVDEPLANC,'
      '                           ULTREAVCMDEP)'
      '                   VALUES (:IDBEM,'
      '                           :IDPESSOA,'
      '                           :DATASLDBEM,'
      '                           :MOECODIGO,'
      '                           :IDSLDCTBBEMXDEP,'
      '                           :DEPLANC,'
      '                           :CMDEP,'
      '                           :REAVDEPLANC,'
      '                           :REAVCMDEP,'
      '                           :ULTREAVDEPLANC,'
      '                           :ULTREAVCMDEP)'
      '')
    Left = 520
    Top = 328
  end
  object sqlIniciaMTMoeda: TCMSqlParams
    SQL.Strings = (
      'INSERT INTO SALDOCONTABBEM (IDBEM,'
      '                            IDPESSOA,'
      '                            DATASLDBEM,'
      '                            MOECODIGO,'
      '                            VALORG,'
      '                            CMBEM,'
      '                            REAVVALORG,'
      '                            REAVCMBEM,'
      '                            ULTREAVVALORG,'
      '                            ULTREAVCMBEM,'
      '                            IDGRUPO,'
      '                            IDLOCALIZACAO,'
      '                            IDRESPONSAVEL)'
      '                    VALUES (:IDBEM,'
      '                            :IDPESSOA,'
      '                            :DATASLDBEM,'
      '                            :MOECODIGO,'
      '                            :VALORG,'
      '                            :CMBEM,'
      '                            :REAVVALORG,'
      '                            :REAVCMBEM,'
      '                            :ULTREAVVALORG,'
      '                            :ULTREAVCMBEM,'
      '                            :IDGRUPO,'
      '                            :IDLOCALIZACAO,'
      '                            :IDRESPONSAVEL)'
      '')
    Left = 520
    Top = 314
  end
  object sqlHMBReaval: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IDMOVIMENTACAO, MOECODIGO, IDTAXADEP, TAXADEPANT, VALORLA' +
        'UDO'
      'FROM HMBREAVAL'
      'WHERE IDMOVIMENTACAO = :IDMOVIMENTACAO'
      '')
    Left = 558
    Top = 358
  end
  object sqlRemHistMovBem: TCMSqlParams
    SQL.Strings = (
      'DELETE FROM HISTORICOMOVIMENTACAO'
      'WHERE IDBEM = :IDBEM'
      '  AND DATAMOVIMENTACAO = :DATAMOV'
      '  AND (IDTIPOMOVIMENTACAO = 15 OR IDTIPOMOVIMENTACAO = 22 OR'
      '       IDTIPOMOVIMENTACAO = 34 OR IDTIPOMOVIMENTACAO = 14 OR'
      '       IDTIPOMOVIMENTACAO = 18 OR IDTIPOMOVIMENTACAO = 35 OR'
      '       IDTIPOMOVIMENTACAO = 21 OR IDTIPOMOVIMENTACAO = 19 OR'
      '       IDTIPOMOVIMENTACAO = 36)'
      '  AND (TIPDEPPRORATA = 0 OR TIPDEPPRORATA = 1)'
      '  AND IDPESSOA = :IDPESSOA'
      '')
    Left = 400
    Top = 343
  end
  object sqlRemVlrHistMovBem: TCMSqlParams
    SQL.Strings = (
      'DELETE FROM VLRHISTMOVBEM VM'
      'WHERE ( EXISTS (SELECT /*+ RULE */ HM.IDMOVIMENTACAO'
      '                FROM HISTORICOMOVIMENTACAO HM'
      '                WHERE (HM.IDBEM = :IDBEM)'
      '                  AND (HM.DATAMOVIMENTACAO = :DATAMOV)'
      
        '                  AND ((HM.IDTIPOMOVIMENTACAO = 15) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 22) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 34) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 14) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 35) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 21) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 19) OR'
      '                       (HM.IDTIPOMOVIMENTACAO = 36))'
      
        '                  AND ((HM.TIPDEPPRORATA = 0) OR (HM.TIPDEPPRORA' +
        'TA = 1))'
      '                  AND (HM.IDPESSOA = :IDPESSOA)'
      '                  AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ))'
      '')
    Left = 401
    Top = 327
  end
  object sqlRCMovAcresxDep2: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ A.IDBEM, AD.IDACRESCIMO, AD.MOECODIGO, AD.IDA' +
        'CRESCIMOXDEP, AD.DEPLANC, AD.CMDEP,'
      
        '       (NVL(SB.VALDEPACRESACUM,0)   - NVL(SB.BXVALDEPACRESACUM,0' +
        ')) AS DEPLANC0,'
      
        '       (NVL(SB.VALCMDEPACRESACUM,0) - NVL(SB.BXVALCMDEPACRESACUM' +
        ',0)) AS CMDEP0'
      ''
      
        'FROM ACRESCVALORXDEP AD, ACRESCIMOVALOR A, BEM B, GRUPO G, PLANO' +
        'GRUPO PG,'
      '     (SELECT HM.IDREAVALACRESC,'
      '             VM.MOECODIGO,'
      '             VM.IDTAXADEP,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,35,NVL(VM.VALOR,0)' +
        ','
      
        '                                              51,NVL(VM.VALOR,0)' +
        ',0)) AS  VALDEPACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,36,NVL(VM.VALOR,0)' +
        ','
      
        '                                              52,NVL(VM.VALOR,0)' +
        ',0)) AS  VALCMDEPACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,39,NVL(VM.VALOR,0)' +
        ',93,NVL(VM.VALOR,0),0)) AS  BXVALDEPACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,40,NVL(VM.VALOR,0)' +
        ',94,NVL(VM.VALOR,0),0)) AS  BXVALCMDEPACRESACUM'
      '      FROM HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '      WHERE (HM.IDTIPOMOVIMENTACAO = 35 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 51 OR HM.IDTIPOMOVIMENTACAO = 36 OR HM.IDTIPOMOVIMENTACAO = 9' +
        '3 OR'
      
        '             HM.IDTIPOMOVIMENTACAO = 52 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 39 OR HM.IDTIPOMOVIMENTACAO = 40 OR HM.IDTIPOMOVIMENTACAO = 9' +
        '4)'
      ''
      '        AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '        AND (HM.IDPESSOA = :IDPESSOA)'
      '        AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAXADEP) SB'
      ''
      'WHERE (A.DATAACRESCIMO <= :DATAMOV)'
      '  AND (A.IDPESSOA  = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.FLGIMOVEL = :FLGIMOVEL)'
      ''
      ''
      '  AND (AD.IDACRESCIMO = A.IDACRESCIMO)'
      '  AND (A.IDBEM = B.IDBEM)'
      '  AND (A.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      '  AND (AD.IDACRESCIMO = SB.IDREAVALACRESC(+))'
      '  AND (AD.MOECODIGO = SB.MOECODIGO(+))'
      '  AND (AD.IDACRESCIMOXDEP = SB.IDTAXADEP(+))'
      ''
      
        'ORDER BY A.IDBEM, AD.IDACRESCIMO, AD.MOECODIGO, AD.IDACRESCIMOXD' +
        'EP'
      '')
    Left = 272
    Top = 378
  end
  object sqlRCMovAcresxMoeda2: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ A.IDBEM, AM.IDACRESCIMO, AM.MOECODIGO, AM.VAL' +
        'ORG, AM.CMBEM,'
      
        '       (NVL(SB.VALACRESACUM,0)   - NVL(SB.BXVALACRESACUM,0))   A' +
        'S VALORG0,'
      
        '       (NVL(SB.VALCMACRESACUM,0) - NVL(SB.BXVALCMACRESACUM,0)) A' +
        'S CMBEM0'
      ''
      
        'FROM ACRESCVALORXMOEDA AM, ACRESCIMOVALOR A, BEM B, GRUPO G, PLA' +
        'NOGRUPO PG,'
      '     (SELECT HM.IDREAVALACRESC,'
      '             VM.MOECODIGO,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,09,NVL(VM.VALOR,0)' +
        ','
      
        '                                              49,NVL(VM.VALOR,0)' +
        ',0)) AS  VALACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,34,NVL(VM.VALOR,0)' +
        ','
      
        '                                              50,NVL(VM.VALOR,0)' +
        ',0)) AS  VALCMACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,37,NVL(VM.VALOR,0)' +
        ', 91,NVL(VM.VALOR,0),0)) AS  BXVALACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,38,NVL(VM.VALOR,0)' +
        ', 92,NVL(VM.VALOR,0),0)) AS  BXVALCMACRESACUM'
      '      FROM HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '      WHERE (HM.IDTIPOMOVIMENTACAO = 09 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 49 OR HM.IDTIPOMOVIMENTACAO = 34 OR HM.IDTIPOMOVIMENTACAO = 9' +
        '1 OR'
      
        '             HM.IDTIPOMOVIMENTACAO = 50 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 37 OR HM.IDTIPOMOVIMENTACAO = 38 OR HM.IDTIPOMOVIMENTACAO = 9' +
        '2)'
      ''
      '        AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '        AND (HM.IDPESSOA = :IDPESSOA)'
      '        AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO) SB'
      ''
      'WHERE (A.DATAACRESCIMO <= :DATAMOV)'
      '  AND (A.IDPESSOA  = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.FLGIMOVEL = :FLGIMOVEL)'
      ''
      ''
      '  AND (AM.IDACRESCIMO = A.IDACRESCIMO)'
      '  AND (A.IDBEM = B.IDBEM)'
      '  AND (A.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      '  AND (AM.IDACRESCIMO = SB.IDREAVALACRESC(+))'
      '  AND (AM.MOECODIGO = SB.MOECODIGO(+))'
      ''
      'ORDER BY A.IDBEM, AM.IDACRESCIMO, AM.MOECODIGO'
      ''
      ''
      ''
      ''
      '')
    Left = 272
    Top = 364
  end
  object sqlRCMovReavalxDep2: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ R.IDBEM, RD.IDREAVALIACAO, RD.MOECODIGO, RD.I' +
        'DREAVALXDEP, RD.DEPLANC, RD.CMDEP,'
      
        '       (NVL(SB.VALDEPREAVACUM,0)   - NVL(SB.BXVALDEPREAVACUM,0))' +
        ' AS DEPLANC0,'
      
        '       (NVL(SB.VALCMDEPREAVACUM,0) - NVL(SB.BXVALCMDEPREAVACUM,0' +
        ')) AS CMDEP0'
      ''
      
        'FROM REAVALXDEP RD, REAVALIACAO R, BEM B, GRUPO G, PLANOGRUPO PG' +
        ','
      '     (SELECT HM.IDREAVALACRESC,'
      '             VM.MOECODIGO,'
      '             VM.IDTAXADEP,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(VM.VALOR,0)' +
        ','
      
        '                                              33,NVL(VM.VALOR,0)' +
        ','
      
        '                                              47,NVL(VM.VALOR,0)' +
        ',0)) AS  VALDEPREAVACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,19,NVL(VM.VALOR,0)' +
        ','
      
        '                                              48,NVL(VM.VALOR,0)' +
        ',0)) AS  VALCMDEPREAVACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(VM.VALOR,0)' +
        ', 89,NVL(VM.VALOR,0),0)) AS  BXVALDEPREAVACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(VM.VALOR,0)' +
        ', 90,NVL(VM.VALOR,0),0)) AS  BXVALCMDEPREAVACUM'
      '      FROM HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '      WHERE (HM.IDTIPOMOVIMENTACAO = 18 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 33 OR HM.IDTIPOMOVIMENTACAO = 47 OR'
      
        '             HM.IDTIPOMOVIMENTACAO = 19 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 48 OR HM.IDTIPOMOVIMENTACAO = 27 OR'
      
        '             HM.IDTIPOMOVIMENTACAO = 29 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 89 OR HM.IDTIPOMOVIMENTACAO = 90)'
      ''
      '        AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '        AND (HM.IDPESSOA = :IDPESSOA)'
      '        AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO, VM.IDTAXADEP) SB'
      ''
      'WHERE (R.DATAREAVALIACAO <= :DATAMOV)'
      '  AND (R.IDPESSOA  = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.FLGIMOVEL = :FLGIMOVEL)'
      ''
      ''
      '  AND (RD.IDREAVALIACAO = R.IDREAVALIACAO)'
      '  AND (R.IDBEM = B.IDBEM)'
      '  AND (R.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      '  AND (RD.IDREAVALIACAO = SB.IDREAVALACRESC(+))'
      '  AND (RD.MOECODIGO = SB.MOECODIGO(+))'
      '  AND (RD.IDREAVALXDEP = SB.IDTAXADEP(+))'
      ''
      
        'ORDER BY R.IDBEM, RD.IDREAVALIACAO, RD.MOECODIGO, RD.IDREAVALXDE' +
        'P'
      '')
    Left = 272
    Top = 350
  end
  object sqlRCMovReavalxMoeda2: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ R.IDBEM, RM.IDREAVALIACAO, RM.MOECODIGO, RM.V' +
        'ALORG, RM.CMBEM,'
      
        '       (NVL(SB.VALREAVACUM,0) - NVL(SB.BXVALREAVACUM,0)) AS VALO' +
        'RG0,'
      
        '       (NVL(SB.VALCMREAVACUM,0) - NVL(SB.BXVALCMREAVACUM,0)) AS ' +
        'CMBEM0'
      ''
      
        'FROM REAVALXMOEDA RM, REAVALIACAO R, BEM B, GRUPO G, PLANOGRUPO ' +
        'PG,'
      '     (SELECT HM.IDREAVALACRESC,'
      '             VM.MOECODIGO,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(VM.VALOR,0)' +
        ', 82,NVL(VM.VALOR,0),'
      
        '                                              32,NVL(VM.VALOR,0)' +
        ','
      
        '                                              45,NVL(VM.VALOR,0)' +
        ',0)) AS VALREAVACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(VM.VALOR,0)' +
        ','
      
        '                                              46,NVL(VM.VALOR,0)' +
        ',0)) AS VALCMREAVACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(VM.VALOR,0)' +
        ', 87,NVL(VM.VALOR,0),0)) AS BXVALREAVACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(VM.VALOR,0)' +
        ', 88,NVL(VM.VALOR,0),0)) AS BXVALCMREAVACUM'
      '      FROM HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '      WHERE (HM.IDTIPOMOVIMENTACAO = 08 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 32 OR HM.IDTIPOMOVIMENTACAO = 45 OR HM.IDTIPOMOVIMENTACAO = 8' +
        '2 OR'
      
        '             HM.IDTIPOMOVIMENTACAO = 22 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 46 OR HM.IDTIPOMOVIMENTACAO = 20 OR HM.IDTIPOMOVIMENTACAO = 8' +
        '7 OR'
      
        '             HM.IDTIPOMOVIMENTACAO = 28 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 88)'
      ''
      '        AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '        AND (HM.IDPESSOA = :IDPESSOA)'
      '        AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      GROUP BY HM.IDREAVALACRESC, VM.MOECODIGO) SB'
      ''
      'WHERE (R.DATAREAVALIACAO <= :DATAMOV)'
      '  AND (R.IDPESSOA  = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.FLGIMOVEL = :FLGIMOVEL)'
      ''
      ''
      '  AND (RM.IDREAVALIACAO = R.IDREAVALIACAO)'
      '  AND (R.IDBEM = B.IDBEM)'
      '  AND (R.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      '  AND (RM.IDREAVALIACAO = SB.IDREAVALACRESC(+))'
      '  AND (RM.MOECODIGO = SB.MOECODIGO(+))'
      ''
      'ORDER BY R.IDBEM, RM.IDREAVALIACAO, RM.MOECODIGO'
      ''
      ' ')
    Left = 272
    Top = 336
  end
  object sqlRCMovBemxDep2: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ BD.IDPESSOA, BD.IDBEM, BD.MOECODIGO, BD.IDBEM' +
        'XDEP, BD.DEPLANC, BD.CMDEP,'
      
        '       (NVL(SB.VALDEPBEMACUM,0)   - NVL(SB.BXVALDEPBEMACUM,0)) A' +
        'S DEPLANC0,'
      
        '       (NVL(SB.VALCMDEPBEMACUM,0) - NVL(SB.BXVALCMDEPBEMACUM,0))' +
        ' AS CMDEP0'
      ''
      'FROM BEMXDEP BD, BEM B, GRUPO G, PLANOGRUPO PG,'
      '     (SELECT HM.IDBEM,'
      '             VM.MOECODIGO,'
      '             VM.IDTAXADEP,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(VM.VALOR,0)' +
        ','
      
        '                                              17,NVL(VM.VALOR,0)' +
        ','
      
        '                                              43,NVL(VM.VALOR,0)' +
        ',0)) AS  VALDEPBEMACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,21,NVL(VM.VALOR,0)' +
        ','
      
        '                                              44,NVL(VM.VALOR,0)' +
        ',0)) AS  VALCMDEPBEMACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,24,NVL(VM.VALOR,0)' +
        ', 85,NVL(VM.VALOR,0),0)) AS  BXVALDEPBEMACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,26,NVL(VM.VALOR,0)' +
        ', 86,NVL(VM.VALOR,0),0)) AS  BXVALCMDEPBEMACUM'
      '      FROM HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '      WHERE (HM.IDTIPOMOVIMENTACAO = 14 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 17 OR HM.IDTIPOMOVIMENTACAO = 43 OR HM.IDTIPOMOVIMENTACAO = 8' +
        '5 OR'
      
        '             HM.IDTIPOMOVIMENTACAO = 21 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 44 OR HM.IDTIPOMOVIMENTACAO = 24 OR HM.IDTIPOMOVIMENTACAO = 8' +
        '6 OR'
      '             HM.IDTIPOMOVIMENTACAO = 26)'
      ''
      '        AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '        AND (HM.IDPESSOA = :IDPESSOA)'
      '        AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      GROUP BY HM.IDBEM, VM.MOECODIGO, VM.IDTAXADEP) SB'
      ''
      'WHERE (B.DATAINICIODEP <= :DATAMOV)'
      '  AND (BD.IDPESSOA = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.FLGIMOVEL = :FLGIMOVEL)'
      ''
      ''
      '  AND (BD.IDBEM     = B.IDBEM)'
      '  AND (BD.IDPESSOA  = B.IDPESSOA)'
      '  AND (B.IDGRUPO    = G.IDGRUPO)'
      '  AND (G.IDGRUPO    = PG.IDGRUPO)'
      '  AND (BD.IDBEM     = SB.IDBEM(+))'
      '  AND (BD.MOECODIGO = SB.MOECODIGO(+))'
      '  AND (BD.IDBEMXDEP = SB.IDTAXADEP(+))'
      ''
      'ORDER BY BD.IDBEM, BD.MOECODIGO'
      ''
      '')
    Left = 272
    Top = 322
  end
  object sqlRCMovBemxMoeda2: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ BM.IDPESSOA, BM.IDBEM, BM.MOECODIGO, BM.VALOR' +
        'G, BM.CMBEM,'
      
        '       (NVL(SB.VALBEMACUM,0)   - NVL(SB.BXVALBEMACUM,0)) AS VALO' +
        'RG0,'
      
        '       (NVL(SB.VALCMBEMACUM,0) - NVL(SB.BXVALCMBEMACUM,0)) AS CM' +
        'BEM0'
      ''
      'FROM BEMXMOEDA BM, BEM B, GRUPO G, PLANOGRUPO PG,'
      '     (SELECT HM.IDBEM,'
      '             VM.MOECODIGO,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,01,NVL(VM.VALOR,0)' +
        ', 03,NVL(VM.VALOR,0), 81,NVL(VM.VALOR,0),'
      
        '                                              41,NVL(VM.VALOR,0)' +
        ','
      
        '                                              10,NVL(VM.VALOR,0)' +
        ','
      
        '                                              07,NVL(VM.VALOR,0)' +
        ',0)) AS  VALBEMACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(VM.VALOR,0)' +
        ','
      
        '                                              42,NVL(VM.VALOR,0)' +
        ',0)) AS  VALCMBEMACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,06,NVL(VM.VALOR,0)' +
        ','
      
        '                                              16,NVL(VM.VALOR,0)' +
        ', 83,NVL(VM.VALOR,0),'
      
        '                                              13,NVL(VM.VALOR,0)' +
        ',0)) AS  BXVALBEMACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,25,NVL(VM.VALOR,0)' +
        ', 84,NVL(VM.VALOR,0),0)) AS  BXVALCMBEMACUM'
      '      FROM HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      
        '      WHERE (HM.IDTIPOMOVIMENTACAO = 01 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 41 OR HM.IDTIPOMOVIMENTACAO = 07 OR HM.IDTIPOMOVIMENTACAO = 8' +
        '1 OR'
      
        '             HM.IDTIPOMOVIMENTACAO = 15 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 42 OR HM.IDTIPOMOVIMENTACAO = 06 OR HM.IDTIPOMOVIMENTACAO = 8' +
        '3 OR'
      
        '             HM.IDTIPOMOVIMENTACAO = 13 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 25 OR HM.IDTIPOMOVIMENTACAO = 10 OR HM.IDTIPOMOVIMENTACAO = 8' +
        '4 OR'
      
        '             HM.IDTIPOMOVIMENTACAO = 16 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 03)'
      ''
      '        AND (HM.DATAMOVIMENTACAO <= :DATAMOV)'
      '        AND (HM.IDPESSOA = :IDPESSOA)'
      '        AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      GROUP BY HM.IDBEM, VM.MOECODIGO) SB'
      ''
      'WHERE (B.DATAINICIODEP <= :DATAMOV)'
      '  AND (BM.IDPESSOA = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.FLGIMOVEL = :FLGIMOVEL)'
      ''
      ''
      '  AND (BM.IDBEM     = B.IDBEM)'
      '  AND (BM.IDPESSOA  = B.IDPESSOA)'
      '  AND (B.IDGRUPO    = G.IDGRUPO)'
      '  AND (G.IDGRUPO    = PG.IDGRUPO)'
      '  AND (BM.IDBEM     = SB.IDBEM(+))'
      '  AND (BM.MOECODIGO = SB.MOECODIGO(+))'
      ''
      'ORDER BY BM.IDBEM, BM.MOECODIGO'
      '')
    Left = 272
    Top = 308
  end
  object sqlSaldoContabReavalA: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '   VBEM.IDBEM, VBEM.IDPESSOA, VBEM.IDREAVALACRESC,'
      ''
      
        '   SUM(VBEM.VALREAVACUM      - VBEM.BXVALREAVACUM)      AS VALOR' +
        'G,'
      
        '   SUM(VBEM.VALCMREAVACUM    - VBEM.BXVALCMREAVACUM)    AS CMBEM' +
        ','
      
        '   SUM(VBEM.VALDEPREAVACUM   - VBEM.BXVALDEPREAVACUM)   AS DEPLA' +
        'NC,'
      '   SUM(VBEM.VALCMDEPREAVACUM - VBEM.BXVALCMDEPREAVACUM) AS CMDEP'
      ''
      'FROM'
      '  ('
      '   (SELECT'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.IDREAVALACRESC,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      '           HM.DATAMOVIMENTACAO,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(VM.VALOR,0),'
      '                                            32,NVL(VM.VALOR,0),'
      '                                            82,NVL(VM.VALOR,0),'
      
        '                                            45,NVL(VM.VALOR,0),0' +
        ')) AS  VALREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(VM.VALOR,0),'
      
        '                                            46,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(VM.VALOR,0),'
      
        '                                            87,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(VM.VALOR,0),'
      
        '                                            88,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPREAVACUM'
      '    FROM HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.DATAMOVIMENTACAO <= :DATASLD)'
      '      AND (HM.IDREAVALACRESC = :IDREAVALIACAO)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.IDREAVALACRESC,VM.MOECODIGO' +
        ',VM.IDTAXADEP,HM.DATAMOVIMENTACAO) UNION'
      ''
      '   (SELECT'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.IDREAVALACRESC,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      '           HM.DATAMOVIMENTACAO,'
      
        '           (0)                                                  ' +
        '   AS  VALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(VM.VALOR,0),'
      '                                            33,NVL(VM.VALOR,0),'
      
        '                                            47,NVL(VM.VALOR,0),0' +
        ')) AS  VALDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,19,NVL(VM.VALOR,0),'
      
        '                                            48,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(VM.VALOR,0),'
      
        '                                            89,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(VM.VALOR,0),'
      
        '                                            90,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMDEPREAVACUM'
      '    FROM HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.DATAMOVIMENTACAO <= :DATASLD)'
      '      AND (HM.IDREAVALACRESC = :IDREAVALIACAO)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.IDREAVALACRESC,VM.MOECODIGO' +
        ',VM.IDTAXADEP,HM.DATAMOVIMENTACAO)'
      '  )  VBEM'
      ''
      'GROUP BY VBEM.IDBEM, VBEM.IDPESSOA, VBEM.IDREAVALACRESC'
      '')
    Left = 39
    Top = 293
  end
  object sqlSaldoContabBemA: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '   VBEM.IDBEM, VBEM.IDPESSOA,'
      ''
      
        '   SUM(VBEM.VALBEMACUM + VBEM.VALACRESACUM - VBEM.BXVALBEMACUM -' +
        ' VBEM.BXVALACRESACUM)                     AS VALORG,'
      
        '   SUM(VBEM.VALCMBEMACUM + VBEM.VALCMACRESACUM - VBEM.BXVALCMBEM' +
        'ACUM - VBEM.BXVALCMACRESACUM)             AS CMBEM,'
      
        '   SUM(VBEM.VALDEPBEMACUM + VBEM.VALDEPACRESACUM - VBEM.BXVALDEP' +
        'BEMACUM - VBEM.BXVALDEPACRESACUM)         AS DEPLANC,'
      
        '   SUM(VBEM.VALCMDEPBEMACUM + VBEM.VALCMDEPACRESACUM - VBEM.BXVA' +
        'LCMDEPBEMACUM - VBEM.BXVALCMDEPACRESACUM) AS CMDEP'
      ''
      'FROM'
      '  ('
      '   (SELECT'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      '           HM.DATAMOVIMENTACAO,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,01,NVL(VM.VALOR,0),'
      '                                            07,NVL(VM.VALOR,0),'
      '                                            10,NVL(VM.VALOR,0),'
      '                                            81,NVL(VM.VALOR,0),'
      
        '                                            41,NVL(VM.VALOR,0),0' +
        ')) AS  VALBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,09,NVL(VM.VALOR,0),'
      
        '                                            49,NVL(VM.VALOR,0),0' +
        ')) AS  VALACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(VM.VALOR,0),'
      
        '                                            42,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,34,NVL(VM.VALOR,0),'
      
        '                                            50,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,06,NVL(VM.VALOR,0),'
      '                                            83,NVL(VM.VALOR,0),'
      '                                            16,NVL(VM.VALOR,0),'
      
        '                                            13,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,37,NVL(VM.VALOR,0),'
      
        '                                            91,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,25,NVL(VM.VALOR,0),'
      
        '                                            84,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,38,NVL(VM.VALOR,0),'
      
        '                                            92,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPACRESACUM'
      '    FROM HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.DATAMOVIMENTACAO <= :DATASLD)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,VM.MOECODIGO,VM.IDTAXADEP,HM.D' +
        'ATAMOVIMENTACAO) UNION'
      ''
      '   (SELECT'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      '           HM.DATAMOVIMENTACAO,'
      
        '           (0)                                                  ' +
        '   AS  VALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(VM.VALOR,0),'
      '                                            17,NVL(VM.VALOR,0),'
      
        '                                            43,NVL(VM.VALOR,0),0' +
        ')) AS  VALDEPBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,35,NVL(VM.VALOR,0),'
      
        '                                            51,NVL(VM.VALOR,0),0' +
        ')) AS  VALDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,21,NVL(VM.VALOR,0),'
      
        '                                            44,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMDEPBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,36,NVL(VM.VALOR,0),'
      
        '                                            52,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,24,NVL(VM.VALOR,0),'
      
        '                                            85,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALDEPBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,39,NVL(VM.VALOR,0),'
      
        '                                            93,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,26,NVL(VM.VALOR,0),'
      
        '                                            86,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMDEPBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,40,NVL(VM.VALOR,0),'
      
        '                                            94,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMDEPACRESACUM'
      '    FROM HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (HM.DATAMOVIMENTACAO <= :DATASLD)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,VM.MOECODIGO,VM.IDTAXADEP,HM.D' +
        'ATAMOVIMENTACAO) )  VBEM'
      ''
      'GROUP BY VBEM.IDBEM, VBEM.IDPESSOA'
      '')
    Left = 39
    Top = 277
  end
  object sqlRemHistMovBemFec: TCMSqlParams
    SQL.Strings = (
      'DELETE FROM HISTORICOMOVIMENTACAO HM'
      'WHERE (HM.IDBEM = :IDBEM)'
      '  AND (HM.DATAMOVIMENTACAO = :DATAMOV)'
      
        '  AND ((HM.IDTIPOMOVIMENTACAO = 15) OR (HM.IDTIPOMOVIMENTACAO = ' +
        '22) OR'
      
        '       (HM.IDTIPOMOVIMENTACAO = 34) OR (HM.IDTIPOMOVIMENTACAO = ' +
        '14) OR'
      
        '       (HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIPOMOVIMENTACAO = ' +
        '35) OR'
      
        '       (HM.IDTIPOMOVIMENTACAO = 21) OR (HM.IDTIPOMOVIMENTACAO = ' +
        '19) OR'
      '       (HM.IDTIPOMOVIMENTACAO = 36))'
      '  AND (HM.TIPDEPPRORATA = 2)'
      '  AND (HM.IDPESSOA = :IDPESSOA)'
      '')
    Left = 520
    Top = 391
  end
  object sqlRemVlrHistMovBemFec: TCMSqlParams
    SQL.Strings = (
      'DELETE FROM VLRHISTMOVBEM VM'
      'WHERE ( EXISTS (SELECT /*+ RULE */ HM.IDMOVIMENTACAO'
      '                FROM HISTORICOMOVIMENTACAO HM'
      '                WHERE (HM.IDBEM = :IDBEM)'
      '                  AND (HM.DATAMOVIMENTACAO = :DATAMOV)'
      
        '                  AND ((HM.IDTIPOMOVIMENTACAO = 15) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 22) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 34) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 14) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 35) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 21) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 19) OR'
      '                       (HM.IDTIPOMOVIMENTACAO = 36))'
      '                  AND (HM.TIPDEPPRORATA = 2)'
      '                  AND (HM.IDPESSOA = :IDPESSOA)'
      '                  AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ))'
      '')
    Left = 521
    Top = 375
  end
  object sqlAux: TCMSqlParams
    Left = 39
    Top = 341
  end
  object sqlParamCAFxContab: TCMSqlParams
    SQL.Strings = (
      'SELECT TMG.IDPESSOA, TMG.IDGRUPO, TMG.IDTIPOMOVIMENTACAO,'
      '       G.CLASSE, G.CLASSE AS CODGRUPO, G.NOME AS DESCGRUPO,'
      '       TM.DESCTIPOMOVIMENTACAO, CTMG.TIPOLANCAMENTO,'
      '       CTMG.PLANO, CTMG.PLACONTA, CTMG.FLGSEGREGA,'
      '       P.DESCPLANO, PC.PLANOME, CTMG.IDCONTASTIPOSMOV,'
      
        '       CTMG.IDEMPRESA, CTMG.CODCENTROCUSTO, CC.NOME AS DESCCCUST' +
        'O'
      'FROM TIPOSMOVIMENTOGRUPOS TMG,'
      '     CONTASTIPOSMOVIMENTOGRUPOS CTMG,'
      '     GRUPO G,'
      '     TIPOMOVIMENTACAO TM,'
      '     PLANO P,'
      '     PLANOCONTA PC,'
      '     CENTCUST CC'
      'WHERE TMG.IDPESSOA = 0'
      ''
      ''
      ''
      '  AND TMG.IDPESSOA = CTMG.IDPESSOA'
      '  AND TMG.IDGRUPO = CTMG.IDGRUPO'
      '  AND TMG.IDTIPOMOVIMENTACAO = CTMG.IDTIPOMOVIMENTACAO'
      '  AND CTMG.IDGRUPO = G.IDGRUPO'
      '  AND CTMG.IDTIPOMOVIMENTACAO = TM.IDTIPOMOVIMENTACAO'
      '  AND CTMG.PLANO = P.PLANO'
      '  AND CTMG.PLANO = PC.PLANO'
      '  AND CTMG.PLACONTA = PC.PLACONTA'
      '  AND CTMG.IDEMPRESA = CC.IDEMPRESA(+)'
      '  AND CTMG.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)'
      
        'ORDER BY G.CLASSE, TMG.IDTIPOMOVIMENTACAO, CTMG.TIPOLANCAMENTO D' +
        'ESC'
      ' ')
    Left = 127
    Top = 374
  end
  object sqlMontaContab: TCMSqlParams
    SQL.Strings = (
      'SELECT PLANO, LACDEBCRE,'
      '       RTRIM(PLACONTA) AS PLACONTA,'
      '       RTRIM(PLACONTA) AS PLACONTADEB,'
      '       RTRIM(PLACONTA) AS PLACONTACRE,'
      '       LACVALOR,'
      '       RTRIM(CODCENTROCUSTO) AS CODCENTROCUSTO,'
      '       RTRIM(CODCENTROCUSTO) AS CODCENTROCUSTODEB,'
      '       RTRIM(CODCENTROCUSTO) AS CODCENTROCUSTOCRE,'
      '       LACHIST1, LACHIST2,'
      '       CODSUBCONTA,'
      '       (0) AS CODSUBCONTADEB,'
      '       (0) AS CODSUBCONTACRE,'
      '       UNIDNEGOC, IDPLANOPREV, IDPATRO,'
      '       ('#39' '#39') AS PLATIPCONVOFIDEB,'
      '       ('#39' '#39') AS PLATIPCONVGERDEB,'
      '       ('#39' '#39') AS PLATIPCONVOFICRE,'
      '       ('#39' '#39') AS PLATIPCONVGERCRE,'
      '       LACNUMDOC, LACHIST3,'
      '       LACHIST4, LACHIST5,'
      '       LACVALOFICIAL, LACVALGERENCIAL,'
      '       (0) AS IDSEGREGACRITER'
      'FROM LANCAMENTO'
      'WHERE PLNCODIGO = 0'
      ''
      ' '
      ' ')
    Left = 127
    Top = 358
  end
  object sqlCorrGrupoBem: TCMSqlParams
    SQL.Strings = (
      'SELECT HM.IDMOVIMENTACAO, HM.PLNCODIGO, HM.IDTIPOMOVIMENTACAO,'
      '       VM.MOECODIGO, VM.IDTAXADEP, VM.VALOR'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     VLRHISTMOVBEM VM'
      'WHERE HM.IDBEM = :IDBEM'
      '  AND HM.DATAMOVIMENTACAO = :DATAMOV'
      '  AND HM.IDTIPOMOVIMENTACAO = 17'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+)'
      'ORDER BY HM.IDTIPOMOVIMENTACAO, VM.MOECODIGO, VM.IDTAXADEP'
      '')
    Left = 408
    Top = 325
  end
  object sqlBensNoConjunto: TCMSqlParams
    SQL.Strings = (
      
        'SELECT B.IDBEM, B.IDPESSOA, B.PLACA, B.IDGRUPO, B.IDCONJUNTO, C.' +
        'IDLOCALIZACAO, C.IDRESPONSAVEL'
      'FROM CONJUNTO C,'
      '     BEM B'
      'WHERE C.IDCONJUNTO = :IDCONJUNTO'
      '  AND C.IDPESSOA = :IDPESSOA'
      '  AND B.BAIXATOTAL <> '#39'S'#39
      '  AND C.IDCONJUNTO = B.IDCONJUNTO'
      '  AND C.IDPESSOA = B.IDPESSOA'
      'ORDER BY B.PLACA'
      ''
      ' '
      ' ')
    Left = 400
    Top = 393
  end
  object sqlParamCAFxContab2: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IDGRUPO, IDTIPOMOVIMENTACAO, TIPOLANCAMENTO, IDEMPRESA, C' +
        'ODCENTROCUSTO,'
      '       PLACONTA, FLGSEGREGA, IDCONTASTIPOSMOV'
      'FROM CONTASTIPOSMOVIMENTOGRUPOS'
      'WHERE PLANO = :PLANO'
      '  AND IDPESSOA = :IDPESSOA'
      
        'ORDER BY IDGRUPO, IDTIPOMOVIMENTACAO, TIPOLANCAMENTO, IDEMPRESA,' +
        ' CODCENTROCUSTO'
      ''
      ' ')
    Left = 134
    Top = 421
  end
  object sqlListaSelReavalBens: TCMSqlParams
    SQL.Strings = (
      'SELECT SBB.IDSELBAIXA, SBB.IDBEM, SBB.IDPESSOA,'
      
        '       SBB.VIDAUTIL, SBB.VALORLAUDO, SBB.TIPDEPPRORATA, SBB.OBSR' +
        'EAVAL,'
      '       B.PLACA, B.DESBEM, B.BAIXATOTAL,'
      '       L.NOME AS DESCLOCAL, G.NOME AS DESCGRUPO'
      'FROM SELBAIXABENS SBB,'
      '     BEM B,'
      '     CONJUNTO C,'
      '     LOCALIZACAO L,'
      '     GRUPO G'
      'WHERE SBB.IDSELBAIXA = :IDSELBAIXA'
      '  AND SBB.IDPESSOA = :IDPESSOA'
      '  AND SBB.IDBEM = B.IDBEM'
      '  AND SBB.IDPESSOA = B.IDPESSOA'
      '  AND B.IDGRUPO = G.IDGRUPO'
      '  AND B.IDCONJUNTO = C.IDCONJUNTO'
      '  AND B.IDPESSOA = C.IDPESSOA'
      '  AND C.IDLOCALIZACAO = L.IDLOCALIZACAO'
      '  AND C.IDPESSOA = L.IDPESSOA'
      'ORDER BY B.PLACA'
      '')
    Left = 133
    Top = 422
  end
end
