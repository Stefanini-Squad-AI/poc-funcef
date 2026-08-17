object DmRegra: TDmRegra
  OldCreateOrder = True
  Left = 354
  Top = 249
  Height = 150
  Width = 215
  object QryBuscaRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA, T.SQLREGRA, T.DESCREGRA'
      'FROM '
      '  REGRA R, TIPOREGRA T'
      'WHERE'
      '  R.IDREGRA     = :IDREGRA      AND '
      '  R.IDTIPOREGRA = T.IDTIPOREGRA')
    ValidateWithMask = True
    Left = 32
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDREGRA'
        ParamType = ptUnknown
      end>
  end
end
