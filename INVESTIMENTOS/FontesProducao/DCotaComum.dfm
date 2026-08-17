object DtmCotaComum: TDtmCotaComum
  OldCreateOrder = False
  Left = 31
  Top = 40
  Height = 479
  Width = 741
  object QryBuscaValorCartRenVar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  SUM(SALDOVLRINVCART) AS SALDO'
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      '   (IDHISTCARTINV  IN'
      '     ('
      '      SELECT MAX(IDHISTCARTINV)'
      '      FROM HISTCARTINV'
      '      WHERE'
      '         (IDTIPOINVEST      = 2)                  AND'
      ''
      '         (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) AND '
      ''
      
        '      (((:IDCARTEIRAINVEST IS NOT NULL) AND (IDCARTEIRAINVEST = ' +
        ':IDCARTEIRAINVEST))    OR'
      '        (:IDCARTEIRAINVEST IS NULL) )   AND'
      ''
      
        '      (((:IDCARTEIRAGERENC IS NOT NULL) AND (IDCARTEIRAGERENC = ' +
        ':IDCARTEIRAGERENC))    OR'
      
        '       ((:IDCARTEIRAGERENC IS NULL)     AND (IDCARTEIRAGERENC IS' +
        ' NULL)) )              AND'
      ''
      '        ((DATAMOVCARTINV || IDINVESTIMENTO) IN'
      
        '                            (SELECT (MAX(DATAMOVCARTINV) || IDIN' +
        'VESTIMENTO)'
      '                             FROM HISTCARTINV'
      '                             WHERE'
      
        '                                 (IDTIPOINVEST = 2)             ' +
        '          AND'
      ''
      
        '                                 (IDPLANPREVCTBPATR = :IDPLANPRE' +
        'VCTBPATR) AND                                 '
      ''
      
        '                              (((:IDCARTEIRAINVEST IS NOT NULL) ' +
        'AND (IDCARTEIRAINVEST = :IDCARTEIRAINVEST))    OR'
      
        '                                (:IDCARTEIRAINVEST IS NULL) )   ' +
        'AND'
      ''
      
        '                              (((:IDCARTEIRAGERENC IS NOT NULL) ' +
        'AND (IDCARTEIRAGERENC = :IDCARTEIRAGERENC))    OR'
      
        '                               ((:IDCARTEIRAGERENC IS NULL)     ' +
        'AND (IDCARTEIRAGERENC IS NULL)) )              AND'
      ''
      
        '                                 (DATAMOVCARTINV <= TO_DATE(:DAT' +
        'A,'#39'DD/MM/YYYY'#39'))'
      '                             GROUP BY IDINVESTIMENTO) )'
      '      GROUP BY IDINVESTIMENTO))                   AND'
      '   (NVL(SALDOQTDEINVCART,0) > 0)')
    ValidateWithMask = True
    Left = 61
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end>
  end
  object QryTotalLiquidoBMF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(VALOR) AS SALDO, DATAVENCOPER'
      'FROM'
      '('
      '('
      'SELECT SUM(NVL(DOP.VLRDESPOPER,0)) AS VALOR, OP.DATAVENCOPER'
      ''
      'FROM '#9' OPERACAOINVEST OP, DESPOPERINVEST DOP, TIPODESPINVEST TD'
      ''
      'WHERE'
      '      (OP.DATAVENCOPER      > TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) AND'
      '      (OP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)          AND'
      ''
      '      (((:IDCARTEIRAINVEST IS NOT NULL)                    AND'
      '      (OP.IDCARTEIRAINVEST = :IDCARTEIRAINVEST))           OR'
      '        (:IDCARTEIRAINVEST IS NULL) )                      AND'
      ''
      '      (((:IDCARTEIRAGERENC IS NOT NULL)                    AND'
      '      (OP.IDCARTEIRAGERENC = IDCARTEIRAGERENC))            OR'
      '        (:IDCARTEIRAGERENC IS NULL) )                      AND'
      ''
      '     (DOP.IDOPERACAOINVEST  = OP.IDOPERACAOINVEST)         AND'
      '     (DOP.IDTIPODESPINVEST  = TD.IDTIPODESPINVEST)         AND'
      '     (DOP.IDTIPODESPINVEST IN (-20,-21))'
      'GROUP BY OP.DATAVENCOPER'
      ')'
      ''
      'UNION'
      ''
      'SELECT SUM(NVL(AJUSTE,0)) AS VALOR, DATAVENCOPER'
      'FROM'
      '('
      '('
      'SELECT'
      '       SUM(NVL(VLROPERACAO,0))*-1 AS AJUSTE, DATAVENCOPER'
      'FROM'
      '       OPERACAOINVEST'
      'WHERE'
      '      (DATAVENCOPER > TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) AND'
      '      (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)     AND'
      ''
      '   (((:IDCARTEIRAINVEST IS NOT NULL)               AND'
      '      (IDCARTEIRAINVEST = :IDCARTEIRAINVEST))      OR'
      '     (:IDCARTEIRAINVEST IS NULL) )                 AND'
      ''
      '   (((:IDCARTEIRAGERENC IS NOT NULL)               AND'
      '      (IDCARTEIRAGERENC = :IDCARTEIRAGERENC))      OR'
      '      (:IDCARTEIRAGERENC IS NULL) )                AND'
      ''
      '      (IDTIPOOPERACAO = -11)'
      'GROUP BY DATAVENCOPER'
      ')'
      'UNION'
      '('
      'SELECT'
      '       SUM(NVL(VLROPERACAO,0)) AS AJUSTE, DATAVENCOPER'
      'FROM'
      '       OPERACAOINVEST'
      'WHERE'
      '      (DATAVENCOPER > TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) AND'
      ''
      '      (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)     AND'
      ''
      '   (((:IDCARTEIRAINVEST IS NOT NULL)               AND'
      '      (IDCARTEIRAINVEST = :IDCARTEIRAINVEST))      OR'
      '     (:IDCARTEIRAINVEST IS NULL) )                 AND'
      ''
      '   (((:IDCARTEIRAGERENC IS NOT NULL)               AND'
      '      (IDCARTEIRAGERENC = :IDCARTEIRAGERENC))      OR'
      '      (:IDCARTEIRAGERENC IS NULL) )                 AND'
      ''
      '      (IDTIPOOPERACAO = -10)'
      'GROUP BY DATAVENCOPER'
      ')'
      ')'
      'GROUP BY DATAVENCOPER'
      ''
      'UNION'
      '('
      'SELECT SUM(NVL(VLRDESPOPER,0))*-1 AS VALOR, DATAVENCOPER'
      'FROM'
      '('
      
        'SELECT SUM(NVL(DOP.VLRDESPOPER,0)) AS VLRDESPOPER, OP.DATAVENCOP' +
        'ER'
      ''
      'FROM '#9'OPERACAOINVEST OP, DESPOPERINVEST DOP, TIPODESPINVEST TD'
      ''
      'WHERE'
      '      (OP.DATAVENCOPER      > TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))  AND'
      ''
      '      (OP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)           AND'
      ''
      '      (((:IDCARTEIRAINVEST IS NOT NULL)                     AND'
      '      (OP.IDCARTEIRAINVEST = :IDCARTEIRAINVEST))            OR'
      '        (:IDCARTEIRAINVEST IS NULL) )                       AND'
      ''
      '      (((:IDCARTEIRAGERENC IS NOT NULL)                     AND'
      '      (OP.IDCARTEIRAGERENC = :IDCARTEIRAGERENC))            OR'
      '        (:IDCARTEIRAGERENC IS NULL) )                       AND'
      ''
      '     (DOP.IDOPERACAOINVEST  = OP.IDOPERACAOINVEST)          AND'
      ''
      '     (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST)           AND'
      '     (DOP.IDTIPODESPINVEST NOT IN (-20,-21))'
      'GROUP BY OP.DATAVENCOPER'
      ')'
      'GROUP BY DATAVENCOPER'
      ')'
      ')'
      'GROUP BY DATAVENCOPER'
      '')
    ValidateWithMask = True
    Left = 191
    Top = 60
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end>
  end
  object QryTotalLiquidoRVariavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT VENDA, COMPRA, DESPESAS'
      'FROM (SELECT SUM(VLRMOVCARTINV)*-1 AS VENDA'
      '      FROM HISTCARTINV HC, OPERACAOINVEST OI, TIPOOPERACAO TP'
      '      WHERE'
      '            (OI.IDTIPOINVEST      = 2)'
      '       AND  (OI.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)'
      
        '       AND   ((:IDCARTEIRAINVEST IS NULL) OR (OI.IDCARTEIRAINVES' +
        'T = :IDCARTEIRAINVEST))'
      
        '       AND   ((:IDCARTEIRAGERENC IS NULL) OR (OI.IDCARTEIRAGEREN' +
        'C = :IDCARTEIRAGERENC))'
      
        '       AND  (OI.DATAOPERACAO     <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY' +
        #39'))'
      
        '       AND ((OI.DATAVENCOPER     >  TO_DATE(:DATAINI,'#39'DD/MM/YYYY' +
        #39'))  AND'
      
        '            (OI.DATAVENCOPER     <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY' +
        #39')))'
      '       AND  (OI.IDOPERACAODIREITO IS NULL)'
      '       AND  (HC.TIPMOVCARTINV    = '#39'OPE'#39')'
      '       AND  (HC.NATURMOVCARTINV  = '#39'D'#39')'
      '       AND  (HC.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)'
      '       AND  (TP.IDTIPOINVEST     = 2)'
      '       AND  (TP.IDTIPOOPERACAO   = OI.IDTIPOOPERACAO)'
      '       AND  (TP.FLGCORRET        = '#39'S'#39')       '
      '       AND  (HC.VLRMOVCARTINV    < 0) ) VENDA,'
      ''
      '     (SELECT SUM(VLRMOVCARTINV)*-1 AS COMPRA'
      '      FROM   HISTCARTINV HC,  OPERACAOINVEST OI, TIPOOPERACAO TP'
      '      WHERE'
      '            (OI.IDTIPOINVEST      = 2)'
      '       AND  (OI.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)'
      
        '       AND   ((:IDCARTEIRAINVEST IS NULL) OR (OI.IDCARTEIRAINVES' +
        'T = :IDCARTEIRAINVEST))'
      
        '       AND   ((:IDCARTEIRAGERENC IS NULL) OR (OI.IDCARTEIRAGEREN' +
        'C = :IDCARTEIRAGERENC))'
      
        '       AND  (OI.DATAOPERACAO     <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY' +
        #39'))'
      
        '       AND ((OI.DATAVENCOPER     >  TO_DATE(:DATAINI,'#39'DD/MM/YYYY' +
        #39'))  AND'
      
        '            (OI.DATAVENCOPER     <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY' +
        #39')))'
      '       AND  (OI.IDOPERACAODIREITO IS NULL)'
      '       AND  (HC.TIPMOVCARTINV      = '#39'OPE'#39')'
      '       AND  (HC.NATURMOVCARTINV    = '#39'A'#39')'
      '       AND  (HC.IDOPERACAOINVEST   = OI.IDOPERACAOINVEST)'
      '       AND  (TP.IDTIPOINVEST       = 2)'
      '       AND  (TP.IDTIPOOPERACAO     = OI.IDTIPOOPERACAO)'
      '       AND  (TP.FLGCORRET          = '#39'S'#39')       '
      '       AND  (HC.VLRMOVCARTINV      > 0) ) COMPRA,'
      ''
      '     (SELECT SUM(VLRMOVCARTINV)*-1 AS DESPESAS'
      '      FROM   HISTCARTINV HC,  OPERACAOINVEST OI'
      '      WHERE'
      '            (OI.IDTIPOINVEST     = 2)'
      '       AND  (OI.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)'
      
        '       AND   ((:IDCARTEIRAINVEST IS NULL) OR (OI.IDCARTEIRAINVES' +
        'T = :IDCARTEIRAINVEST))'
      
        '       AND   ((:IDCARTEIRAGERENC IS NULL) OR (OI.IDCARTEIRAGEREN' +
        'C = :IDCARTEIRAGERENC))'
      
        '       AND  (OI.DATAOPERACAO     <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY' +
        #39'))'
      
        '       AND ((OI.DATAVENCOPER     >  TO_DATE(:DATAINI,'#39'DD/MM/YYYY' +
        #39'))     AND'
      
        '            (OI.DATAVENCOPER     <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY' +
        #39')))'
      '       AND  (OI.IDOPERACAODIREITO IS NULL)'
      '       AND  (HC.TIPMOVCARTINV    = '#39'DOP'#39')'
      '       AND  (HC.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)) DESP'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 61
    Top = 285
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
  end
  object QryAplicacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT VLRHISTCAIXA AS SALDO'
      'FROM   HISTCAIXA HC,  EVENTOCAIXACOTA EC,  CARTEIRAXEVENTO CE'
      'WHERE'
      
        '   (HC.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)                AN' +
        'D'
      ''
      
        '  (((:IDCARTEIRAINVEST IS NOT NULL)                           AN' +
        'D'
      '   (HC.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))                OR'
      
        '    (:IDCARTEIRAINVEST IS NULL) )                             AN' +
        'D'
      ''
      
        '  (((:IDCARTEIRAGERENC IS NOT NULL)                           AN' +
        'D'
      '  (HC.IDCARTEIRAGERENC   = :IDCARTEIRAGERENC))                OR'
      
        '    (:IDCARTEIRAGERENC IS NULL) )                             AN' +
        'D   '
      ''
      
        '   (HC.DATAHISTCAIXA     = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))       AN' +
        'D'
      ''
      
        '   (HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO)              AN' +
        'D'
      ''
      
        '   (CE.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA)              AN' +
        'D'
      ''
      '   (CE.IDEVENTOCAIXACOTA = -9)'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 191
    Top = 228
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptInput
      end>
  end
  object QryResgate: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT VLRHISTCAIXA AS SALDO'
      'FROM   HISTCAIXA HC,  EVENTOCAIXACOTA EC,  CARTEIRAXEVENTO CE'
      'WHERE'
      '   (HC.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)          AND'
      ''
      '  (((:IDCARTEIRAINVEST IS NOT NULL)                     AND'
      '   (HC.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))          OR'
      '    (:IDCARTEIRAINVEST IS NULL) )                       AND'
      ''
      '  (((:IDCARTEIRAGERENC IS NOT NULL)                     AND'
      '  (HC.IDCARTEIRAGERENC   = :IDCARTEIRAGERENC))          OR'
      '    (:IDCARTEIRAGERENC IS NULL) )                       AND'
      ''
      '   (HC.DATAHISTCAIXA     = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) AND'
      ''
      '   (CE.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA)        AND'
      '   (HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO)        AND'
      '   (CE.IDEVENTOCAIXACOTA = -10)')
    ValidateWithMask = True
    Left = 191
    Top = 285
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptInput
      end>
  end
  object QryCarteiraGerenc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTEIRAINVEST, IDCARTEIRAGERENC, DESCCARTGERENC'
      'FROM'
      '   CARTEIRAGERENC'
      'ORDER BY DESCCARTGERENC'
      '')
    ValidateWithMask = True
    Left = 191
    Top = 172
  end
  object QryEventosCalcCota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HC.VLRHISTCOTA AS SALDO,'
      '   HC.IDCARTEIRAINVEST,'
      '   HC.IDCARTEIRAGERENC,'
      '   HC.IDPLANPREVCTBPATR,'
      '   ECC.IDEVENTOCAIXACOTA,'
      '   ECC.STACOTA,'
      '   ECC.STACOTIZA,'
      '   ECC.STAATIVOPASSIVO,'
      '   ECC.STACAIXA,'
      '   ECC.STASOMADIMINUI,'
      '   ECC.STACPMF'
      'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC'
      'WHERE'
      '   HC.DATAHISTCOTA       = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      ''
      '  (((:IDCARTEIRAINVEST IS NOT NULL)                    AND'
      '   (HC.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))         OR'
      '    (:IDCARTEIRAINVEST IS NULL) )                      AND'
      ''
      '  (((:IDCARTEIRAGERENC IS NOT NULL)                    AND'
      '  (HC.IDCARTEIRAGERENC   = :IDCARTEIRAGERENC))         OR'
      '    (:IDCARTEIRAGERENC IS NULL) )                      AND'
      ''
      '   CE.IDCARTEIRAXEVENTO  = HC.IDCARTEIRAXEVENTO        AND'
      '   ECC.IDEVENTOCAIXACOTA = CE.IDEVENTOCAIXACOTA        AND'
      '   ECC.IDEVENTOCAIXACOTA IN (-4,-5,-6,-9,-10,-11,-12)'
      ''
      'UNION'
      ''
      'SELECT'
      '   HC.VLRHISTCOTA AS SALDO,'
      '   HC.IDCARTEIRAINVEST,'
      '   HC.IDCARTEIRAGERENC,'
      '   HC.IDPLANPREVCTBPATR,'
      '   ECC.IDEVENTOCAIXACOTA,'
      '   ECC.STACOTA,'
      '   ECC.STACOTIZA,'
      '   ECC.STAATIVOPASSIVO,'
      '   ECC.STACAIXA,'
      '   ECC.STASOMADIMINUI,'
      '   ECC.STACPMF'
      ''
      'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC'
      'WHERE'
      '   HC.DATAHISTCOTA     = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      ''
      '  (((:IDCARTEIRAINVEST IS NOT NULL)                  AND'
      '   (HC.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))       OR'
      '    (:IDCARTEIRAINVEST IS NULL) )                    AND'
      ''
      '  (((:IDCARTEIRAGERENC IS NOT NULL)                  AND'
      '  (HC.IDCARTEIRAGERENC   = :IDCARTEIRAGERENC))       OR'
      '    (:IDCARTEIRAGERENC IS NULL) )                    AND'
      ''
      '   CE.IDCARTEIRAXEVENTO  = HC.IDCARTEIRAXEVENTO      AND'
      '   ECC.IDEVENTOCAIXACOTA = CE.IDEVENTOCAIXACOTA      AND'
      '   ECC.IDEVENTOCAIXACOTA IN (-7,-8)'
      ''
      'UNION'
      ''
      'SELECT'
      '   HC.VLRHISTCOTA AS SALDO,'
      '   HC.IDCARTEIRAINVEST,'
      '   HC.IDCARTEIRAGERENC,'
      '   HC.IDPLANPREVCTBPATR,'
      '   ECC.IDEVENTOCAIXACOTA,'
      '   ECC.STACOTA,'
      '   ECC.STACOTIZA,'
      '   ECC.STAATIVOPASSIVO,'
      '   ECC.STACAIXA,'
      '   ECC.STASOMADIMINUI,'
      '   ECC.STACPMF'
      ''
      'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC'
      'WHERE'
      '   HC.DATAHISTCOTA     = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      ''
      '  (((:IDCARTEIRAINVEST IS NOT NULL)                  AND'
      '   (HC.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))       OR'
      '    (:IDCARTEIRAINVEST IS NULL) )                    AND'
      ''
      '  (((:IDCARTEIRAGERENC IS NOT NULL)                  AND'
      '  (HC.IDCARTEIRAGERENC   = :IDCARTEIRAGERENC))       OR'
      '    (:IDCARTEIRAGERENC IS NULL) )                    AND'
      ''
      '   CE.IDCARTEIRAXEVENTO  = HC.IDCARTEIRAXEVENTO      AND'
      '   ECC.IDEVENTOCAIXACOTA = CE.IDEVENTOCAIXACOTA      AND'
      ''
      '  (ECC.STACOTA           = '#39'S'#39')                      AND'
      '  (ECC.STACOTIZA         = '#39'S'#39') ')
    ValidateWithMask = True
    Left = 191
    Top = 4
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaEventosCotas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT VLRHISTCOTA AS SALDO'
      'FROM    HISTCOTA HC, EVENTOCAIXACOTA ECC, CARTEIRAXEVENTO CXE'
      'WHERE'
      '     HC.IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR          AND'
      ''
      '  (((:IDCARTEIRAINVEST IS NOT NULL)                      AND'
      '    (HC.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))          OR'
      '    (:IDCARTEIRAINVEST IS NULL) )                        AND'
      ''
      '  (((:IDCARTEIRAGERENC IS NOT NULL)                      AND'
      '    (HC.IDCARTEIRAGERENC   = :IDCARTEIRAGERENC))         OR'
      '    (:IDCARTEIRAGERENC IS NULL) )                        AND'
      ''
      '     HC.DATAHISTCOTA       = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39') AND'
      ''
      '     ECC.IDEVENTOCAIXACOTA = :IDEVENTOCAIXACOTA          AND'
      ''
      '    (CXE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA)      AND'
      ''
      '    (HC.IDCARTEIRAXEVENTO  = CXE.IDCARTEIRAXEVENTO)')
    ValidateWithMask = True
    Left = 61
    Top = 172
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEVENTOCAIXACOTA'
        ParamType = ptInput
      end>
  end
  object QryPatroPlanPrevContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 61
    Top = 228
    object QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPLANPREVCTBPATR'
    end
    object QryPatroPlanPrevContabIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPLANOPREV'
    end
    object QryPatroPlanPrevContabIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPATRO'
    end
    object QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 113
    end
  end
  object QryBuscaCarteiraXevento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCARTEIRAXEVENTO'
      'FROM    CARTEIRAXEVENTO'
      'WHERE'
      '     IDEVENTOCAIXACOTA = :IDEVENTOCAIXACOTA          AND'
      ''
      '  (((:IDCARTEIRAINVEST IS NOT NULL)                  AND'
      '    (IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))         OR'
      '    (:IDCARTEIRAINVEST IS NULL) )                    AND'
      ''
      '  (((:IDCARTEIRAGERENC IS NOT NULL)                  AND'
      '    (IDCARTEIRAGERENC   = :IDCARTEIRAGERENC))        OR'
      '    (:IDCARTEIRAGERENC IS NULL) )'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 61
    Top = 113
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOCAIXACOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end>
  end
  object QryDeleteHistCota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTCOTA'
      'WHERE  DATAHISTCOTA >=TO_DATE(:DATAHISTCOTA,'#39'DD/MM/YYYY'#39')')
    ValidateWithMask = True
    Left = 439
    Top = 4
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAHISTCOTA'
        ParamType = ptResult
      end>
  end
  object QryInsereHistCota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTCOTA'
      '  (IDHISTCOTA,'
      '   IDCARTEIRAINVEST,'
      '   IDCARTEIRAGERENC,'
      '   IDPLANPREVCTBPATR,'
      '   IDCARTEIRAXEVENTO,'
      '   DATAHISTCOTA,'
      '   VLRHISTCOTA)'
      'VALUES'
      '  (:IDHISTCOTA,'
      '   :IDCARTEIRAINVEST,'
      '   :IDCARTEIRAGERENC,'
      '   :IDPLANPREVCTBPATR,'
      '   :IDCARTEIRAXEVENTO,'
      '   :DATAHISTCOTA,'
      '   :VLRHISTCOTA)')
    ValidateWithMask = True
    Left = 324
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAXEVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAHISTCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRHISTCOTA'
        ParamType = ptInput
      end>
  end
  object QryBuscaEventoPorTpOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM'
      ''
      '   EVENTOCAIXACOTA, CARTEIRAXEVENTO'
      ''
      'WHERE'
      ''
      
        '  (CARTEIRAXEVENTO.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST)       ' +
        '            AND'
      ''
      
        '  (EVENTOCAIXACOTA.IDEVENTOCAIXACOTA =  CARTEIRAXEVENTO.IDEVENTO' +
        'CAIXACOTA)  AND'
      ''
      
        '(((:IDTIPOOPERACAO IS NOT NULL)                                 ' +
        '            AND'
      
        '  (EVENTOCAIXACOTA.IDTIPOOPERACAO    = :IDTIPOOPERACAO))        ' +
        '            OR'
      
        '  (:IDTIPOOPERACAO IS NULL) )                                   ' +
        '            AND'
      ''
      
        '(((:IDCARTEIRAGERENC IS NOT NULL)                               ' +
        '            AND'
      
        '  (CARTEIRAXEVENTO.IDCARTEIRAGERENC  = :IDCARTEIRAGERENC))      ' +
        '            OR'
      '  (:IDCARTEIRAGERENC IS NULL) )'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 61
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end>
  end
  object QryTotalPagarReceber: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT VALORRECEBER AS RECEBER, (0) AS PAGAR'
      'FROM ('
      '     SELECT SUM(VALORRECEBER) AS VALORRECEBER FROM'
      '     (SELECT SUM(VLRHISTPROVISAO) AS VALORRECEBER'
      
        '      FROM HISTPROVISAO HP, OPERDIREITOXINV OXV, OPERACAODIREITO' +
        ' OP'
      '      WHERE'
      '            (HP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) '
      
        '        AND  ((:IDCARTEIRAINVEST IS NULL) OR (HP.IDCARTEIRAINVES' +
        'T = :IDCARTEIRAINVEST))'
      
        '        AND  ((:IDCARTEIRAGERENC IS NULL) OR (HP.IDCARTEIRAGEREN' +
        'C = :IDCARTEIRAGERENC))'
      '        AND (HP.IDOPERACAODIREITO NOT IN'
      '               (SELECT OP.IDOPERACAODIREITO'
      '                FROM OPERACAOINVEST OP'
      '                WHERE'
      
        '                      (IDTIPOINVEST      = 2)                  A' +
        'ND'
      
        '                      (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) A' +
        'ND'
      
        '                    ((:IDCARTEIRAINVEST IS NULL) OR (OP.IDCARTEI' +
        'RAINVEST = :IDCARTEIRAINVEST)) AND'
      
        '                    ((:IDCARTEIRAGERENC IS NULL) OR (OP.IDCARTEI' +
        'RAGERENC = :IDCARTEIRAGERENC)) AND'
      
        '                   (OP.DATAOPERACAO     <= TO_DATE(:DATAINI,'#39'DD/' +
        'MM/YYYY'#39')) AND'
      
        '                   (OP.IDTIPOOPERACAO   NOT IN (-70,-10070))   A' +
        'ND'
      
        '                   (OP.IDOPERACAODIREITO = HP.IDOPERACAODIREITO)' +
        '))'
      '        AND  (OP.IDTIPOINVEST      = 2)'
      
        '        AND  (OP.DATAOPER         <= TO_DATE(:DATAINI,'#39'DD/MM/YYY' +
        'Y'#39'))'
      '        AND  (OP.IDOPERACAODIREITO = HP.IDOPERACAODIREITO)'
      '        AND (OXV.IDOPERACAODIREITO = HP.IDOPERACAODIREITO)'
      '     ) )'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 61
    Top = 342
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end>
  end
  object QryCPMFDia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(VLRHISTPROVISAO) AS SALDO'
      'FROM   HISTPROVISAO HP, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA EC'
      'WHERE'
      
        '      (HP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)               ' +
        'AND'
      '      '
      
        '      (((:IDCARTEIRAINVEST IS NOT NULL)                         ' +
        'AND'
      
        '      (HP.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))               ' +
        'OR'
      
        '        (:IDCARTEIRAINVEST IS NULL) )                           ' +
        'AND'
      ''
      
        '      (((:IDCARTEIRAGERENC IS NOT NULL)                         ' +
        'AND'
      
        '      (HP.IDCARTEIRAGERENC  = :IDCARTEIRAGERENC))               ' +
        'OR'
      
        '        (:IDCARTEIRAGERENC IS NULL) )                           ' +
        'AND'
      ''
      
        '      (HP.DATAHISTPROVISAO  > TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))      ' +
        'AND'
      ''
      
        '      (HP.DATAORIGEM       <= TO_DATE(:DATA,'#39'DD/MM/YYYY'#39'))      ' +
        'AND'
      ''
      
        '      (CE.IDCARTEIRAXEVENTO = HP.IDCARTEIRAXEVENTO)             ' +
        'AND'
      ''
      
        '      (EC.IDEVENTOCAIXACOTA = CE.IDEVENTOCAIXACOTA)             ' +
        'AND'
      ''
      '      (EC.IDEVENTOCAIXACOTA = -13)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 191
    Top = 342
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end>
  end
  object QryCPMFDiaProvisao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(VLRHISTCAIXA) AS VLRHISTCAIXA'
      'FROM ('
      'SELECT '
      '    DECODE(STACPMF,'#39'S'#39','
      
        #9#9'DECODE(EC.STASOMADIMINUI,'#39'S'#39',SUM(ABS(VLRHISTCAIXA)),0),0) AS V' +
        'LRHISTCAIXA'
      'FROM HISTCAIXA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC'
      'WHERE'
      
        '      (HC.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)               ' +
        ' AND'
      ''
      
        '      (((:IDCARTEIRAINVEST IS NOT NULL)                         ' +
        ' AND'
      
        '      (HC.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))               ' +
        ' OR'
      
        '        (:IDCARTEIRAINVEST IS NULL) )                           ' +
        ' AND'
      ''
      
        '      (((:IDCARTEIRAGERENC IS NOT NULL)                         ' +
        ' AND'
      
        '      (HC.IDCARTEIRAGERENC  = :IDCARTEIRAGERENC))               ' +
        ' OR'
      
        '        (:IDCARTEIRAGERENC IS NULL) )                           ' +
        ' AND'
      ''
      
        '      (HC.DATAHISTCAIXA     = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) '#9' AND' +
        '        '
      ''
      '      (HC.IDCARTEIRAXEVENTO = CX.IDCARTEIRAXEVENTO)'#9#9' AND'
      '      (CX.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA)'
      ''
      'GROUP BY EC.STASOMADIMINUI, STACPMF'
      ''
      'UNION '
      ''
      'SELECT '
      '    DECODE(STACPMF,'#39'S'#39','
      
        '           DECODE(EC.STASOMADIMINUI,'#39'D'#39',SUM(ABS(VLRHISTCAIXA))*-' +
        '1,0),0) AS VLRHISTCAIXA'
      'FROM HISTCAIXA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC'
      'WHERE'
      
        '      (HC.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)               ' +
        ' AND'
      ''
      
        '      (((:IDCARTEIRAINVEST IS NOT NULL)                         ' +
        ' AND'
      
        '      (HC.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))               ' +
        ' OR'
      
        '        (:IDCARTEIRAINVEST IS NULL) )                           ' +
        ' AND'
      ''
      
        '      (((:IDCARTEIRAGERENC IS NOT NULL)                         ' +
        ' AND'
      
        '      (HC.IDCARTEIRAGERENC  = :IDCARTEIRAGERENC))               ' +
        ' OR'
      
        '        (:IDCARTEIRAGERENC IS NULL) )                           ' +
        ' AND'
      ''
      '      (HC.DATAHISTCAIXA     = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) '#9' AND'
      ''
      '      (HC.IDCARTEIRAXEVENTO = CX.IDCARTEIRAXEVENTO)'#9#9' AND'
      '      (CX.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA)'
      'GROUP BY EC.STASOMADIMINUI, STACPMF'
      ')')
    ValidateWithMask = True
    Left = 191
    Top = 113
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end>
  end
  object QryDeleteHistProvCPMFDia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTPROVISAO WHERE IDHISTPROVISAO IN'
      '('
      'SELECT IDHISTPROVISAO'
      'FROM   HISTPROVISAO HP, CARTEIRAXEVENTO CE,'
      '       EVENTOCAIXACOTA EC'
      'WHERE'
      
        '      (HP.DATAORIGEM        = TO_DATE(:DATAORIGEM,'#39'DD/MM/YYYY'#39'))' +
        ' AND'
      ''
      
        '      (CE.IDCARTEIRAXEVENTO = HP.IDCARTEIRAXEVENTO)             ' +
        ' AND'
      ''
      
        '      (EC.IDEVENTOCAIXACOTA = CE.IDEVENTOCAIXACOTA)             ' +
        ' AND'
      ''
      '      (EC.IDEVENTOCAIXACOTA = -13))'
      ' ')
    ValidateWithMask = True
    Left = 324
    Top = 57
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAORIGEM'
        ParamType = ptResult
      end>
  end
  object QryComposcaoPatrimonial: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 324
    Top = 108
  end
  object QryVerPosRendaVar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H1.IDTIPOINVEST, H1.IDPLANPREVCTBPATR, H1.IDCARTEIRAINVES' +
        'T, H1.IDCARTEIRAGERENC, H1.IDINVESTIMENTO,'
      '       H1.SALDOQTDEINVCART'
      'FROM'
      '   HISTCARTINV H1'
      'WHERE'
      '    (H1.IDHISTCARTINV  IN'
      '       (SELECT MAX(H2.IDHISTCARTINV)'
      '        FROM  HISTCARTINV H2'
      '        WHERE'
      
        '        ((H2.IDTIPOINVEST||H2.IDPLANPREVCTBPATR||H2.IDCARTEIRAIN' +
        'VEST||H2.IDCARTEIRAGERENC||H2.IDINVESTIMENTO||H2.DATAMOVCARTINV)' +
        ' IN'
      
        '            (SELECT (H3.IDTIPOINVEST||H3.IDPLANPREVCTBPATR||H3.I' +
        'DCARTEIRAINVEST||H3.IDCARTEIRAGERENC||H3.IDINVESTIMENTO||MAX(H3.' +
        'DATAMOVCARTINV))'
      '             FROM HISTCARTINV H3'
      '             WHERE'
      '                 (H3.IDTIPOINVEST      = 2)'
      
        '             AND  ((:IDPLANPREVCTBPATR IS NULL) OR (H3.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR))'
      '             AND (H3.IDCARTEIRAINVEST > 0)'
      
        '             AND  ((:IDCARTEIRAGERENC  IS NULL) OR (H3.IDCARTEIR' +
        'AGERENC  = :IDCARTEIRAGERENC))'
      '             AND (H3.IDINVESTIMENTO   > 0)'
      
        '             AND (H3.DATAMOVCARTINV   <= TO_DATE(:DATA,'#39'DD/MM/YY' +
        'YY'#39'))'
      
        '             GROUP BY H3.IDTIPOINVEST, H3.IDPLANPREVCTBPATR, H3.' +
        'IDCARTEIRAINVEST, H3.IDCARTEIRAGERENC, H3.IDINVESTIMENTO) )'
      '        GROUP BY H2.IDINVESTIMENTO))'
      'AND (NVL(H1.SALDOQTDEINVCART,0) > 0)'
      '')
    ValidateWithMask = True
    Left = 324
    Top = 164
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end>
  end
end
