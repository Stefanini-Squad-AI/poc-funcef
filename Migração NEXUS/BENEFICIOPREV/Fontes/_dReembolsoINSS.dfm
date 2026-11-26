object dtmReembolsoINSS: TdtmReembolsoINSS
  OldCreateOrder = False
  Left = 109
  Top = 269
  Height = 403
  Width = 696
  object qryConcINSS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CIN.MESREFERENCIA,'
      '  CIN.CODDOCCAP, CIN.CODDOCCAR,'
      '  CIN.DATAPROCESSAMENTO, CIN.QTDEBENEFINSS, CIN.VALORTOTINSS'
      'FROM'
      '  CONCINSS CIN'
      'WHERE'
      
        '  (:PMESREFERENCIA IS NULL OR CIN.MESREFERENCIA = :PMESREFERENCI' +
        'A)'
      'ORDER BY'
      '  CIN.MESREFERENCIA DESC'
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
      end>
  end
end
