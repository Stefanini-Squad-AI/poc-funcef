object DtmProvisaoComum: TDtmProvisaoComum
  OldCreateOrder = False
  Left = 42
  Top = 61
  Height = 479
  Width = 540
  object qryInsereHistProvisao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTPROVISAO'
      '  (IDHISTPROVISAO,'
      '   IDPLANPREVCTBPATR,'
      '   IDCARTEIRAXEVENTO,'
      '   IDCARTEIRAINVEST,'
      '   IDCARTEIRAGERENC,'
      '   IDOPERACAOINVEST,'
      '   DATAORIGEM,'
      '   DATAHISTPROVISAO,'
      '   VLRHISTPROVISAO,'
      '   SLDHISTPROVISAO,'
      '   IDOPERACAODIREITO)'
      'VALUES'
      '  (:IDHISTPROVISAO,'
      '   :IDPLANPREVCTBPATR,'
      '   :IDCARTEIRAXEVENTO,'
      '   :IDCARTEIRAINVEST,'
      '   :IDCARTEIRAGERENC,'
      '   :IDOPERACAOINVEST,'
      '   :DATAORIGEM,   '
      '   :DATAHISTPROVISAO,'
      '   :VLRHISTPROVISAO,'
      '   :SLDHISTPROVISAO,'
      '   :IDOPERACAODIREITO)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 212
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTPROVISAO'
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
        Name = 'DATAORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAHISTPROVISAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRHISTPROVISAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SLDHISTPROVISAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end>
  end
  object QryProvisaoNaoVenc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HP.IDOPERACAODIREITO,'
      '   HP.IDCARTEIRAINVEST,'
      '   HP.IDCARTEIRAGERENC,'
      '   HP.IDPLANPREVCTBPATR,'
      '   HP.IDCARTEIRAXEVENTO,'
      '   HP.VLRHISTPROVISAO,'
      '   HP.DATAHISTPROVISAO,'
      '   HP.IDOPERACAOINVEST,'
      '   EC.IDEVENTOCAIXACOTA'
      ''
      'FROM'
      '   HISTPROVISAO HP, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA EC'
      'WHERE'
      '   EC.IDEVENTOCAIXACOTA <> -13                   AND'
      '   HP.DATAHISTPROVISAO   >:DATAHISTPROVISAO      AND'
      '   CE.IDCARTEIRAXEVENTO  = HP.IDCARTEIRAXEVENTO  AND'
      '   EC.IDEVENTOCAIXACOTA  = CE.IDEVENTOCAIXACOTA  AND'
      '   HP.IDOPERACAOINVEST  IS NULL'
      'UNION'
      'SELECT'
      '   HP.IDOPERACAODIREITO,'
      '   HP.IDCARTEIRAINVEST,'
      '   HP.IDCARTEIRAGERENC,'
      '   HP.IDPLANPREVCTBPATR,'
      '   HP.IDCARTEIRAXEVENTO,'
      '   HP.VLRHISTPROVISAO,'
      '   HP.DATAHISTPROVISAO,'
      '   HP.IDOPERACAOINVEST,'
      '   EC.IDEVENTOCAIXACOTA'
      'FROM'
      
        '   HISTPROVISAO HP, OPERACAOINVEST OI, CARTEIRAXEVENTO CE, EVENT' +
        'OCAIXACOTA EC'
      'WHERE'
      '   EC.IDEVENTOCAIXACOTA <> -13                   AND'
      '   HP.DATAHISTPROVISAO   >:DATAHISTPROVISAO      AND'
      '   OI.DATAOPERACAO      <=:DATAHISTPROVISAO      AND'
      '   CE.IDCARTEIRAXEVENTO  = HP.IDCARTEIRAXEVENTO  AND'
      '   EC.IDEVENTOCAIXACOTA  = CE.IDEVENTOCAIXACOTA  AND'
      '   OI.IDOPERACAOINVEST   = HP.IDOPERACAOINVEST'
      'UNION'
      'SELECT'
      '   HP.IDOPERACAODIREITO,'
      '   HP.IDCARTEIRAINVEST,'
      '   HP.IDCARTEIRAGERENC,'
      '   HP.IDPLANPREVCTBPATR,'
      '   HP.IDCARTEIRAXEVENTO,'
      '   HP.VLRHISTPROVISAO,'
      '   HP.DATAHISTPROVISAO,'
      '   HP.IDOPERACAOINVEST,'
      '   EC.IDEVENTOCAIXACOTA'
      'FROM'
      
        '   HISTPROVISAO HP, OPERACAOINVEST OI, CARTEIRAXEVENTO CE, EVENT' +
        'OCAIXACOTA EC, TIPOOPERACAO TP'
      'WHERE'
      '   EC.IDEVENTOCAIXACOTA <> -13                   AND'
      '   HP.DATAHISTPROVISAO  >=:DATAHISTPROVISAO      AND'
      '   OI.DATAOPERACAO      <=:DATAHISTPROVISAO      AND'
      '   CE.IDCARTEIRAXEVENTO  = HP.IDCARTEIRAXEVENTO  AND'
      '   EC.IDEVENTOCAIXACOTA  = CE.IDEVENTOCAIXACOTA  AND'
      '   OI.IDOPERACAOINVEST   = HP.IDOPERACAOINVEST   AND'
      '   TP.IDTIPOINVEST       = OI.IDTIPOINVEST       AND'
      '   TP.IDTIPOOPERACAO     = OI.IDTIPOOPERACAO     AND'
      '   TP.TIPOMOVTO          = '#39'TRC'#39)
    ValidateWithMask = True
    Left = 76
    Top = 309
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAHISTPROVISAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAHISTPROVISAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAHISTPROVISAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAHISTPROVISAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAHISTPROVISAO'
        ParamType = ptInput
      end>
  end
  object qryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 76
    Top = 20
  end
  object QryBuscaOperacaoDireito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM   OPERACAODIREITO'
      'WHERE  IDOPERACAODIREITO = :IDOPERACAODIREITO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 76
    Top = 132
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end>
  end
  object QryProvisaoCPMFVencSint: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '     ('
      
        '     SELECT EC.IDEVENTOCAIXACOTA, HP.IDCARTEIRAINVEST, HP.IDCART' +
        'EIRAGERENC,'
      
        '            HP.IDOPERACAOINVEST, HP.IDOPERACAODIREITO, HP.IDPLAN' +
        'PREVCTBPATR,'
      '            SUM(VLRHISTPROVISAO) AS VLRHISTPROVISAO'
      '     FROM'
      '        HISTPROVISAO HP, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA EC'
      '     WHERE'
      '        EC.IDEVENTOCAIXACOTA  = -13                  AND'
      '        HP.DATAHISTPROVISAO   = :DATAHISTPROVISAO    AND'
      '        CE.IDCARTEIRAXEVENTO  = HP.IDCARTEIRAXEVENTO AND'
      '        EC.IDEVENTOCAIXACOTA  = CE.IDEVENTOCAIXACOTA'
      
        '     GROUP BY EC.IDEVENTOCAIXACOTA, HP.IDCARTEIRAINVEST, HP.IDCA' +
        'RTEIRAGERENC,'
      
        '              HP.IDOPERACAOINVEST, HP.IDOPERACAODIREITO, HP.IDPL' +
        'ANPREVCTBPATR)'
      'WHERE'
      '     VLRHISTPROVISAO > 0'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 76
    Top = 247
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAHISTPROVISAO'
        ParamType = ptInput
      end>
  end
  object QryBuscaOperCPMF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDCARTEIRAXEVENTO, STACPMF'
      
        'FROM    OPERACAOINVEST OP, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA E' +
        'C'
      'WHERE'
      '   OP.IDOPERACAOINVEST  =:IDOPERACAOINVEST          AND'
      ''
      '  (((:IDCARTEIRAINVEST IS NOT NULL)                 AND'
      '  (CE.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))       OR'
      '    (:IDCARTEIRAINVEST IS NULL) )                   AND'
      ''
      '  (((:IDCARTEIRAGERENC IS NOT NULL)                 AND'
      '  (CE.IDCARTEIRAGERENC  = :IDCARTEIRAGERENC))       OR'
      '    (:IDCARTEIRAGERENC IS NULL) )'#9'            AND'
      ''
      '   EC.IDTIPOOPERACAO    = OP.IDTIPOOPERACAO         AND'
      '   CE.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA'
      ' ')
    ValidateWithMask = True
    Left = 76
    Top = 188
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
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
      end>
  end
  object QryDeleteCPMFProv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      'HISTPROVISAO WHERE IDHISTPROVISAO IN ('
      'SELECT IDHISTPROVISAO'
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
      
        '      (HP.DATAORIGEM       = TO_DATE(:DATAORIGEM,'#39'DD/MM/YYYY'#39')) ' +
        'AND'
      
        '      (HP.DATAHISTPROVISAO = TO_DATE(:DATAHISTPROVISAO ,'#39'DD/MM/Y' +
        'YYY'#39')) AND'
      ''
      
        '      (CE.IDCARTEIRAXEVENTO = HP.IDCARTEIRAXEVENTO)             ' +
        'AND'
      ''
      
        '      (EC.IDEVENTOCAIXACOTA = CE.IDEVENTOCAIXACOTA)             ' +
        'AND'
      ''
      '      (EC.IDEVENTOCAIXACOTA = -13)'
      ')'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 212
    Top = 17
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
        Name = 'DATAORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAHISTPROVISAO'
        ParamType = ptInput
      end>
  end
  object QryDeleteHistCaixaCPMF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTCAIXA WHERE'
      'IDCARTEIRAXEVENTO =:IDCARTEIRAXEVENTO AND'
      'DATAHISTCAIXA     =:DATAHISTCAIXA'
      '')
    ValidateWithMask = True
    Left = 212
    Top = 76
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAXEVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DATAHISTCAIXA'
        ParamType = ptInput
      end>
  end
  object QryBuscaOperacaoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM  OPERACAOINVEST O, INVESTIMENTO I'
      'WHERE'
      '      O.IDOPERACAOINVEST = :IDOPERACAOINVEST AND'
      '      I.IDINVESTIMENTO   = O.IDINVESTIMENTO'
      '')
    ValidateWithMask = True
    Left = 76
    Top = 76
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptInput
      end>
  end
end
