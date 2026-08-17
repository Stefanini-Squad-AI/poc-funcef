object DtmObjRAD: TDtmObjRAD
  OldCreateOrder = False
  Left = 162
  Top = 146
  Height = 375
  Width = 544
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 8
  end
  object spFinalizaEtapa: TCMSqlParams
    SQL.Strings = (
      'UPDATE RADINSTETAPA SET'
      '     DATAFIMETAPA = :DATAFIMETAPA'
      '    ,IDANDAMENTO =  :IDANDAMENTO'
      'WHERE  (IDPROCESSO = :IDPROCESSO)'
      '   AND (IDETAPA    = :IDETAPA)')
    Left = 32
    Top = 56
  end
  object spFinalizaProc: TCMSqlParams
    SQL.Strings = (
      'UPDATE RADINSTPROCESSO SET'
      '     DATAFIMPROCESSO = :DATAFIMPROCESSO'
      '    ,FLGOK = :FLGOK'
      'WHERE  (IDPROCESSO = :IDPROCESSO )')
    Left = 32
    Top = 104
  end
  object spBuscaTipoEtapa: TCMSqlParams
    SQL.Strings = (
      'SELECT IDTIPOETAPA,'
      '       DATAFIMPREV '
      'FROM               '
      '     RADINSTETAPA'
      'WHERE (IDETAPA = :IDETAPA)')
    Left = 32
    Top = 152
  end
  object spEtapaFinal: TCMSqlParams
    SQL.Strings = (
      'SELECT                     '
      '     TEP.FLGFINAL          '
      'FROM                       '
      '     RADINSTETAPA IE,      '
      '     RADTIPOETAPA TE,      '
      '     RADTIPOETAPAXPROC TEP '
      'WHERE                      '
      '      (IE.IDETAPA     = :IDETAPA )'
      '  AND (IE.IDTIPOETAPA = TE.IDTIPOETAPA)     '
      '  AND (IE.IDTIPOETAPA = TEP.IDTIPOETAPA)    '
      ' ')
    Left = 32
    Top = 200
  end
  object spEtapaRetorno: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     TE.FLGRETORETAPA'
      'FROM                 '
      '     RADINSTETAPA IE, '
      '     RADTIPOETAPA TE  '
      'WHERE'
      '      (IE.IDETAPA     = :IDETAPA)'
      '  AND (IE.IDTIPOETAPA = TE.IDTIPOETAPA)     '
      ' ')
    Left = 32
    Top = 248
  end
end
