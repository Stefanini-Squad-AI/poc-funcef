object DtmMoviment: TDtmMoviment
  OldCreateOrder = True
  OnCreate = DtmMovimentCreate
  OnDestroy = DtmMovimentDestroy
  Left = 28
  Top = 110
  Height = 479
  Width = 741
  object qryInfoSaldoRep: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    SALDOQTDE'
      'FROM'
      '    SALDO'
      'WHERE'
      '      (CODARTIGO = :pCODARTIGO)'
      '  AND (CODALMOXARIFADO  = :pCODALMOXARIFADO)'
      '')
    ValidateWithMask = True
    Left = 179
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end>
    object qryInfoSaldoRepSALDOQTDE: TFloatField
      FieldName = 'SALDOQTDE'
    end
  end
  object qryInfoSaldoMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     M.SALDOQTDEMOV'
      ' FROM'
      '     MOVIMENT M,'
      '     ( SELECT MAX(M.IDMOV) AS IDMOV'
      '       FROM'
      '          MOVIMENT M,'
      '          (SELECT MAX(DATAMOV) AS DATAMOV'
      '           FROM MOVIMENT'
      '           WHERE'
      '                  (CODARTIGO = :pCODARTIGO)'
      '              AND (DATAMOV <= :pDATAMOV)'
      '              AND (CODALMOXARIFADO  = :pCODALMOXARIFADO)'
      '           ) SUB1'
      '       WHERE'
      '            (CODARTIGO = :pCODARTIGO)'
      '        AND (CODALMOXARIFADO  = :pCODALMOXARIFADO)'
      '        AND (M.DATAMOV = SUB1.DATAMOV)'
      '      ) AUX'
      ' WHERE'
      '      (CODARTIGO = :pCODARTIGO)'
      '  AND (CODALMOXARIFADO  = :pCODALMOXARIFADO)'
      '  AND (M.IDMOV = AUX.IDMOV)')
    ValidateWithMask = True
    Left = 179
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODALMOXARIFADO'
        ParamType = ptUnknown
      end>
    object qryInfoSaldoMovSALDOQTDEMOV: TFloatField
      FieldName = 'SALDOQTDEMOV'
    end
  end
end
