object DtmCaixaComum: TDtmCaixaComum
  OldCreateOrder = False
  Left = 88
  Top = 21
  Height = 540
  Width = 647
  object UpdValorizacao: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  DATAMOVCARTINV = :DATAMOVCARTINV,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  VLRCOTA = :VLRCOTA,'
      '  SALDO = :SALDO,'
      '  VLRAPLICACAO = :VLRAPLICACAO,'
      '  VLRRESGATE = :VLRRESGATE'
      'where'
      '  DATAMOVCARTINV = :OLD_DATAMOVCARTINV')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (DATAMOVCARTINV, QUANTIDADE, VLRCOTA, SALDO, VLRAPLICACAO, VLR' +
        'RESGATE)'
      'values'
      
        '  (:DATAMOVCARTINV, :QUANTIDADE, :VLRCOTA, :SALDO, :VLRAPLICACAO' +
        ', :VLRRESGATE)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  DATAMOVCARTINV = :OLD_DATAMOVCARTINV')
    Left = 192
    Top = 30
  end
  object dsValorizacao: TwwDataSource
    AutoEdit = False
    DataSet = QryValorizacao
    Left = 192
    Top = 19
  end
  object qryInsereHistCaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTCAIXA'
      '  (IDHISTCAIXA,'
      '   IDPLANPREVCTBPATR,'
      '   IDCARTEIRAXEVENTO,'
      '   IDCARTEIRAINVEST,'
      '   IDCARTEIRAGERENC,'
      '   IDOPERACAOINVEST,'
      '   DATAHISTCAIXA,'
      '   VLRHISTCAIXA,'
      '   SLDHISTCAIXA,'
      '   IDOPERACAODIREITO,'
      '   TIPMOVCAIXA,'
      '   DESCINVESTIMENTO)'
      'VALUES'
      '  (:IDHISTCAIXA,'
      '   :IDPLANPREVCTBPATR,'
      '   :IDCARTEIRAXEVENTO,'
      '   :IDCARTEIRAINVEST,'
      '   :IDCARTEIRAGERENC,'
      '   :IDOPERACAOINVEST,'
      '   :DATAHISTCAIXA,'
      '   :VLRHISTCAIXA,'
      '   :SLDHISTCAIXA,'
      '   :IDOPERACAODIREITO,'
      '   :TIPMOVCAIXA,'
      '   :DESCINVESTIMENTO)'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 192
    Top = 163
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTCAIXA'
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
        Name = 'IDOPERACAOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAHISTCAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRHISTCAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SLDHISTCAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPMOVCAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCINVESTIMENTO'
        ParamType = ptInput
      end>
  end
  object qrySaldoCaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM   HISTCAIXA HC'
      'WHERE  HC.IDHISTCAIXA IN'
      '          (SELECT MAX(IDHISTCAIXA)'
      '          FROM HISTCAIXA'
      '          WHERE DATAHISTCAIXA = (SELECT MAX(DATAHISTCAIXA)'
      '                                  FROM HISTCAIXA'
      '                                 WHERE (((:TIPOSINAL = '#39'<'#39')  AND'
      
        '                                          (DATAHISTCAIXA <  TO_D' +
        'ATE(:DATAHISTCAIXA,'#39'DD/MM/YYYY'#39')) )   OR'
      ''
      '                                        ((:TIPOSINAL = '#39'<='#39') AND'
      
        '                                          (DATAHISTCAIXA <= TO_D' +
        'ATE(:DATAHISTCAIXA,'#39'DD/MM/YYYY'#39')) ) ) AND'
      ''
      
        '                                       (((:TIPOMOV = 4)      AND' +
        ' (TIPMOVCAIXA = :TIPMOVCAIXA))'
      ''
      
        '                                    OR  ((:TIPOMOV = 4)      AND' +
        ' (TIPMOVCAIXA = :TIPMOVCAIXA))'
      ''
      
        '                                    OR  ((:TIPOMOV = 4)      AND' +
        ' (TIPMOVCAIXA IS NULL))'
      ''
      '                                    OR  ((:TIPOMOV = 4)))   AND'
      ''
      
        '              ((:IDCARTEIRAINVEST IS NULL) OR (IDCARTEIRAINVEST ' +
        '= :IDCARTEIRAINVEST))'
      ''
      
        '          AND ((:IDCARTEIRAGERENC IS NULL) OR (IDCARTEIRAGERENC ' +
        '= :IDCARTEIRAGERENC)) )'
      ''
      
        '          AND ((:TIPOMOV = 4)   AND (TIPMOVCAIXA = :TIPMOVCAIXA)' +
        ')'
      ''
      
        '          OR  ((:TIPOMOV = 4)   AND (TIPMOVCAIXA = :TIPMOVCAIXA)' +
        ')'
      ''
      '          OR  ((:TIPOMOV = 4)   AND (TIPMOVCAIXA IS NULL))'
      ''
      '          OR  ((:TIPOMOV = 4))) AND'
      ''
      
        '    ((:IDCARTEIRAINVEST IS NULL) OR (IDCARTEIRAINVEST = :IDCARTE' +
        'IRAINVEST))'
      ''
      
        'AND ((:IDCARTEIRAGERENC IS NULL) OR (IDCARTEIRAGERENC = :IDCARTE' +
        'IRAGERENC)))'
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 368
    ParamData = <
      item
        DataType = ftString
        Name = 'TIPOSINAL'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTCAIXA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPOSINAL'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTCAIXA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPOMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOVCAIXA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPOMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOVCAIXA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPOMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPOMOV'
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
        DataType = ftString
        Name = 'TIPOMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOVCAIXA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPOMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPMOVCAIXA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPOMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPOMOV'
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
      end>
  end
  object qryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 192
    Top = 86
  end
  object QryBuscaValorCaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '   HISTCAIXA HC, CARTEIRAXEVENTO CE'
      'WHERE'
      '   HC.IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR    AND'
      '   HC.IDCARTEIRAINVEST   = :IDCARTEIRAINVEST     AND'
      ''
      '  (((:IDCARTEIRAGERENC IS NOT NULL)              AND'
      '    (HC.IDCARTEIRAGERENC = :IDCARTEIRAGERENC))   OR'
      '    (:IDCARTEIRAGERENC IS NULL) )                AND'
      ''
      '   HC.DATAHISTCAIXA      = :DATAHISTCAIXA        AND'
      ''
      '   CE.IDEVENTOCAIXACOTA  = :IDEVENTOCAIXACOTA    AND'
      '   HC.IDCARTEIRAXEVENTO  = CE.IDCARTEIRAXEVENTO ')
    ValidateWithMask = True
    Left = 56
    Top = 6
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
        Name = 'DATAHISTCAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEVENTOCAIXACOTA'
        ParamType = ptInput
      end>
  end
  object QryHistOperRendaVar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NVL(SUM(MOVIMAQUI),0) AS MOVIMAQUI'
      'FROM HISTCARTINV'
      'WHERE'
      '    (DATAMOVCARTINV = TO_DATE(:DATAMOVCARTINV,'#39'DD/MM/YYYY'#39')) AND'
      ''
      ' (((:IDCARTEIRAGERENC IS NOT NULL)            AND'
      '   ( IDCARTEIRAGERENC = :IDCARTEIRAGERENC))   OR'
      '   (:IDCARTEIRAGERENC IS NULL) )              AND'
      ''
      '  ( TIPMOVCARTINV  = '#39'OPE'#39') '
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 257
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end>
  end
  object QryDeleteSaldoAtu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE  FROM HISTCAIXA'
      'WHERE'
      '     IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR  AND'
      ''
      '     IDCARTEIRAINVEST =:IDCARTEIRAINVEST    AND'
      ''
      ' (((:IDCARTEIRAGERENC IS NOT NULL)          AND'
      '    (IDCARTEIRAGERENC = :IDCARTEIRAGERENC)) OR'
      '   (:IDCARTEIRAGERENC IS NULL) )            AND'
      ''
      '     DATAHISTCAIXA    =:DATAHISTCAIXA       AND'
      ''
      '     TIPMOVCAIXA      = '#39'ATU'#39
      ' ')
    ValidateWithMask = True
    Left = 192
    Top = 211
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
        Name = 'DATAHISTCAIXA'
        ParamType = ptInput
      end>
  end
  object QryBuscaOperacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM HISTCAIXA'
      'WHERE'
      '      IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR   AND'
      '      IDCARTEIRAINVEST  =:IDCARTEIRAINVEST    AND'
      ''
      '  (((:IDCARTEIRAGERENC IS NOT NULL)           AND'
      '     (IDCARTEIRAGERENC  = :IDCARTEIRAGERENC)) OR'
      '    (:IDCARTEIRAGERENC IS NULL) )             AND'
      ''
      '      DATAHISTCAIXA     =:DATAHISTCAIXA       AND'
      ''
      '     (TIPMOVCAIXA       = '#39'OPE'#39')'
      '     '
      'ORDER BY IDHISTCAIXA'
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 57
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
        Name = 'DATAHISTCAIXA'
        ParamType = ptInput
      end>
  end
  object QryAtualizaSaldoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTCAIXA SET'
      '       SLDHISTCAIXA =:SLDHISTCAIXA'
      'WHERE  IDHISTCAIXA  =:IDHISTCAIXA')
    ValidateWithMask = True
    Left = 56
    Top = 209
    ParamData = <
      item
        DataType = ftFloat
        Name = 'SLDHISTCAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCAIXA'
        ParamType = ptInput
      end>
  end
  object QryBuscaEventoCaixaCota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EC.STACAIXA, EC.STASOMADIMINUI'
      'FROM     CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC'
      'WHERE CX.IDCARTEIRAXEVENTO =:IDCARTEIRAXEVENTO    AND'
      '      CX.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA')
    ValidateWithMask = True
    Left = 56
    Top = 107
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAXEVENTO'
        ParamType = ptUnknown
      end>
  end
  object QryVerRegSaldo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM    HISTCAIXA'
      'WHERE'
      '       IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR  AND'
      '       IDCARTEIRAINVEST  =:IDCARTEIRAINVEST   AND'
      ''
      '   (((:IDCARTEIRAGERENC IS NOT NULL)          AND'
      '     ( IDCARTEIRAGERENC  = :IDCARTEIRAGERENC)) OR'
      '     (:IDCARTEIRAGERENC IS NULL) )            AND'
      ''
      '       DATAHISTCAIXA     =:DATAHISTCAIXA      AND'
      ''
      '      ( TIPMOVCAIXA      =:TIPMOVCAIXA)'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 305
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
        Name = 'DATAHISTCAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPMOVCAIXA'
        ParamType = ptInput
      end>
  end
  object QryBuscaOperDespLiquidar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM (SELECT HC.HISTMOVCARTINV AS DESCRICAO,'
      '             IV.DESCINVESTIMENTO,'
      '             HC.VLRMOVCARTINV  AS VALOR,'
      '             0 AS IDTIPODESPINVEST,'
      '             HC.IDTIPOOPERACAO,'
      '             OI.IDOPERACAODIREITO,'
      '             HC.IDOPERACAOINVEST,'
      '             HC.IDCARTEIRAINVEST,'
      '             HC.IDCARTEIRAGERENC,'
      '             HC.IDPLANPREVCTBPATR,'
      '             1 AS REG'
      '      FROM   HISTCARTINV HC, OPERACAOINVEST OI, INVESTIMENTO IV'
      '      WHERE OI.DATAVENCOPER     = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')'
      '        AND HC.IDTIPOINVEST     = 2'
      '        AND HC.TIPMOVCARTINV    = '#39'OPE'#39
      '        AND (OI.IDOPERACAODIREITO IS NULL )'
      '        AND (OI.IDCARTEIRAGERENC IS NOT NULL)'
      '        AND (HC.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)'
      '        AND (IV.IDINVESTIMENTO   = OI.IDINVESTIMENTO)'
      ''
      '      UNION'
      ''
      '      SELECT DESCRICAO,'
      '             DESCINVESTIMENTO,'
      
        '             SUM(ROUND(((NVL(TOTDESP,0)/DECODE(NVL(TOTDESP,1),1,' +
        '1,NVL(TOTVLR,0))) * VLR),2)) AS VALOR,'
      '             -28 AS IDTIPODESPINVEST,'
      '               0 AS IDTIPOOPERACAO,'
      '             IDOPERACAODIREITO,'
      '             IDOPERACAOINVEST,'
      '             IDCARTEIRAINVEST,'
      '             IDCARTEIRAGERENC,'
      '             IDPLANPREVCTBPATR,'
      '             2 AS REG'
      '      FROM (SELECT '#39'DESPESAS'#39' AS DESCRICAO,'
      '                   IV.DESCINVESTIMENTO,'
      '                   OI.NUMDOCUMENTO,'
      '                   OI.VLROPERACAO AS VLR,'
      '                   OI.IDOPERACAODIREITO,'
      '                   OI.IDOPERACAOINVEST,'
      '                   OI.IDCARTEIRAINVEST,'
      '                   OI.IDCARTEIRAGERENC,'
      '                   OI.IDPLANPREVCTBPATR,'
      '                   (SELECT SUM(DP.VLRDESPOPER)'
      '                    FROM   DESPOPERINVEST DP, OPERACAOINVEST OII'
      '                    WHERE'
      '                          (OII.IDTIPOINVEST    = 2)'
      '                      AND (OII.IDCARTEIRAGERENC IS NOT NULL)'
      
        '                      AND (OII.NUMDOCUMENTO    = OI.NUMDOCUMENTO' +
        ')'
      
        '                      AND (DP.IDOPERACAOINVEST = OII.IDOPERACAOI' +
        'NVEST))*-1 AS TOTDESP,'
      '                   (SELECT SUM(OII.VLROPERACAO)'
      '                    FROM   OPERACAOINVEST OII'
      '                    WHERE'
      '                          (OII.IDTIPOINVEST    = 2)'
      '                      AND (OII.IDCARTEIRAGERENC IS NOT NULL)'
      
        '                      AND (OII.NUMDOCUMENTO    = OI.NUMDOCUMENTO' +
        ')) AS TOTVLR'
      '            FROM OPERACAOINVEST OI, INVESTIMENTO IV'
      '            WHERE'
      '                  (OI.IDTIPOINVEST     = 2)'
      
        '              AND (OI.IDCARTEIRAGERENC IS NOT NULL)             ' +
        '     '
      
        '              AND (OI.DATAVENCOPER     = TO_DATE(:DATA,'#39'DD/MM/YY' +
        'YY'#39'))'
      '              AND (IV.IDINVESTIMENTO   = OI.IDINVESTIMENTO))'
      
        '      GROUP BY DESCRICAO, DESCINVESTIMENTO, IDOPERACAODIREITO, I' +
        'DOPERACAOINVEST,'
      
        '               IDCARTEIRAINVEST, IDCARTEIRAGERENC, IDPLANPREVCTB' +
        'PATR)'
      
        'ORDER BY IDCARTEIRAINVEST, IDCARTEIRAGERENC, REG, DESCRICAO, IDP' +
        'LANPREVCTBPATR')
    ValidateWithMask = True
    Left = 56
    Top = 157
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptUnknown
      end>
  end
  object QryDeleteOperDesp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      'FROM HISTCAIXA'
      'WHERE'
      'IDHISTCAIXA IN'
      '('
      'SELECT IDHISTCAIXA'
      'FROM HISTCAIXA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC'
      'WHERE'
      '        HC.DATAHISTCAIXA     = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')'
      '  AND   HC.IDCARTEIRAXEVENTO = CX.IDCARTEIRAXEVENTO'
      '  AND   CX.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA'
      '  AND   HC.IDOPERACAOINVEST  IS NOT NULL'
      '  AND   HC.IDOPERACAODIREITO IS NULL'
      ''
      'UNION'
      ''
      'SELECT IDHISTCAIXA'
      'FROM HISTCAIXA HC, CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC'
      'WHERE'
      '        HC.DATAHISTCAIXA     = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')'
      '  AND   HC.IDCARTEIRAXEVENTO = CX.IDCARTEIRAXEVENTO'
      '  AND   CX.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA'
      '  AND   EC.IDTIPODESPINVEST IS NOT NULL'
      ''
      ')'
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 192
    Top = 261
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptUnknown
      end>
  end
  object QryValorizacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DATA, SUM(QUANTIDADE) AS QUANTIDADE, SUM(VLRCOTA) AS VLRC' +
        'OTA, SUM(SALDO) AS SALDO,'
      
        'SUM(SALDOCOT) AS SALDOCOT, SUM(VLRAPLICACAO) AS VLRAPLICACAO, SU' +
        'M(VLRRESGATE) AS VLRRESGATE,'
      'IDRELATORIO'
      'FROM ('
      
        '   SELECT SALDO.DATAMOVFUNDO AS DATA,0 AS QUANTIDADE, 0 AS VLRCO' +
        'TA, SALDO.SALDOVLRFUNDO AS SALDO,'
      
        '         (SALDO.SALDOVLRFUNDO - NVL(APL.VLRMOVFUNDO,0) + NVL(RES' +
        'G.VLRMOVFUNDO,0)) AS SALDOCOT,'
      
        '          NVL(APL.VLRMOVFUNDO,0) AS VLRAPLICACAO , NVL(RESG.VLRM' +
        'OVFUNDO,0) AS VLRRESGATE, 1 AS IDRELATORIO'
      '   FROM'
      
        '     (SELECT SUM(H1.SALDOQTDCOTAS) AS SALDOQTDCOTAS, SUM(H1.SALD' +
        'OVLRFUNDO) AS SALDOVLRFUNDO, H1.DATAMOVFUNDO'
      '      FROM HISTFUNDO H1'
      '      WHERE (H1.IDHISTFUNDO IN ('
      #9#9#9' SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                   FROM HISTFUNDO HF, FUNDOINVEST FI'
      '                   WHERE'
      
        '                         (HF.IDPLANPREVCTBPATR  = (:sPLANO))    ' +
        '  AND'
      
        #9#9#9' (HF.DATAMOVFUNDO      >= TO_DATE(:sDATAINI,'#39'DD/MM/YYYY'#39'))  A' +
        'ND'
      
        '                         (HF.DATAMOVFUNDO      <= TO_DATE(:sDATA' +
        'FIM,'#39'DD/MM/YYYY'#39')) AND'
      #9#9#9' (HF.TIPMOVFUNDO       <> '#39'PIR'#39')          AND'
      
        '                         (FI.IDTIPOFUNDOINVEST IN (:sTIPOINVEST)' +
        ') AND'
      '                         (HF.IDFUNDOINVEST = FI.IDFUNDOINVEST)'
      
        '                GROUP BY HF.IDPLANPREVCTBPATR, HF.IDFUNDOINVEST,' +
        ' HF.DATAAPLICACAO, HF.DATAMOVFUNDO)) AND'
      '            (H1.SALDOQTDCOTAS > 0)'
      '      GROUP BY H1.DATAMOVFUNDO) SALDO,'
      
        '     (SELECT DATAOPERACAO AS DATAMOVFUNDO, SUM(VLROPERACAO) AS V' +
        'LRMOVFUNDO'
      '      FROM  OPERACAOFUNDO HF, FUNDOINVEST FI'
      '      WHERE'
      
        '            HF.IDPLANPREVCTBPATR  =   (:sPLANO)                A' +
        'ND'
      
        '            HF.DATAOPERACAO >= TO_DATE(:sDATAINI,'#39'DD/MM/YYYY'#39') A' +
        'ND'
      
        '            HF.DATAOPERACAO <= TO_DATE(:sDATAFIM,'#39'DD/MM/YYYY'#39') A' +
        'ND'
      
        '            HF.IDTIPOOPERACAO IN      (:sOPERAPL)              A' +
        'ND'
      
        '            FI.IDTIPOFUNDOINVEST IN   (:sTIPOIFDONVEST)        A' +
        'ND'
      '            HF.IDFUNDOINVEST = FI.IDFUNDOINVEST'
      '      GROUP BY DATAOPERACAO  ) APL,'
      
        '     (SELECT DATAPEDIDO AS DATAMOVFUNDO, SUM(VLRPEDIDO) AS VLRMO' +
        'VFUNDO'
      '      FROM PEDIDOFUNDO HF, FUNDOINVEST FI'
      '      WHERE'
      
        '             HF.IDPLANPREVCTBPATR  =  (:sPLANO)                A' +
        'ND'
      
        '             HF.DATAPEDIDO  >= TO_DATE(:sDATAINI,'#39'DD/MM/YYYY'#39') A' +
        'ND'
      
        '             HF.DATAPEDIDO  <= TO_DATE(:sDATAFIM,'#39'DD/MM/YYYY'#39') A' +
        'ND'
      
        '             HF.IDTIPOOPERACAO IN     (:sOPERRESG)             A' +
        'ND'
      '   '#9'     FI.IDTIPOFUNDOINVEST IN  (:sTIPOIFDONVEST)        AND'
      '             HF.IDFUNDOINVEST = FI.IDFUNDOINVEST'
      '      GROUP BY DATAPEDIDO ) RESG'
      'WHERE'
      '   (APL.DATAMOVFUNDO(+)   = SALDO.DATAMOVFUNDO) AND'
      '   (RESG.DATAMOVFUNDO(+)  = SALDO.DATAMOVFUNDO)'
      
        'GROUP BY SALDO.DATAMOVFUNDO, APL.VLRMOVFUNDO, RESG.VLRMOVFUNDO, ' +
        'SALDO.SALDOVLRFUNDO, SALDO.SALDOQTDCOTAS'
      ')GROUP BY DATA, IDRELATORIO'
      ''
      ''
      ' '
      ' ')
    UpdateObject = UpdValorizacao
    ValidateWithMask = True
    Left = 192
    Top = 6
    ParamData = <
      item
        DataType = ftString
        Name = 'sPLANO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'sDATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'sDATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'sTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'sPLANO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'sDATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'sDATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'sOPERAPL'
        ParamType = ptResult
      end
      item
        DataType = ftUnknown
        Name = 'sTIPOIFDONVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sPLANO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'sDATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'sDATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'sOPERRESG'
        ParamType = ptResult
      end
      item
        DataType = ftUnknown
        Name = 'sTIPOIFDONVEST'
        ParamType = ptUnknown
      end>
    object QryValorizacaoDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object QryValorizacaoQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object QryValorizacaoVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
    end
    object QryValorizacaoSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object QryValorizacaoSALDOCOT: TFloatField
      FieldName = 'SALDOCOT'
    end
    object QryValorizacaoVLRAPLICACAO: TFloatField
      FieldName = 'VLRAPLICACAO'
    end
    object QryValorizacaoVLRRESGATE: TFloatField
      FieldName = 'VLRRESGATE'
    end
    object QryValorizacaoIDRELATORIO: TFloatField
      FieldName = 'IDRELATORIO'
    end
  end
end
