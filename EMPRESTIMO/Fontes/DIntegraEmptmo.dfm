object dtmIntegraEmptmo: TdtmIntegraEmptmo
  OldCreateOrder = False
  Left = 65532
  Top = 65532
  Height = 580
  Width = 808
  object qryRemarcaEnvio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      'SET'
      '   HME.FLGENVIO      = 0,'
      '   HME.CODDOCUMENTO  = NULL'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '   AND HME.FLGBAIXADO         = 0'
      
        '   AND ( (:PHMEFORMACOBRANCA  IS NULL) OR (HME.HMEFORMACOBRANCA ' +
        '  =:PHMEFORMACOBRANCA) )'
      
        '   AND ( (:PHMEANOCOBRANCA    IS NULL) OR (HME.HMEANOCOBRANCA   ' +
        '  =:PHMEANOCOBRANCA) )'
      
        '   AND ( (:PHMEMESCOBRANCA    IS NULL) OR (HME.HMEMESCOBRANCA   ' +
        '  =:PHMEMESCOBRANCA) )'
      
        '   AND ( (:PHMEPARCELA        IS NULL) OR (HME.HMEPARCELA       ' +
        '  =:PHMEPARCELA) )'
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEFORMACOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEFORMACOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end>
  end
  object qryExcluiTMPDESC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '   TMPDESC'
      'WHERE'
      '       ( IDMODULO       = 15 )'
      #9'AND ( IDDESCONTO     =:PIDESCONTO )'
      
        '   AND ( (:PMESCOBRANCA IS NULL) OR (MESCOBRANCA =:PMESCOBRANCA)' +
        ' )'
      
        '   AND ( (:PREFERENCIA  IS NULL) OR (REFERENCIA  =:PREFERENCIA) ' +
        ')')
    ValidateWithMask = True
    Left = 56
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PREFERENCIA'
        ParamType = ptInput
      end>
  end
  object qryDocumentosExclusao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.CODDOCUMENTO'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '   AND HME.FLGBAIXADO         = 0'
      
        '   AND ( (:PHMEANOCOBRANCA    IS NULL) OR (HME.HMEANOCOBRANCA  =' +
        ':PHMEANOCOBRANCA) )'
      
        '   AND ( (:PHMEMESCOBRANCA    IS NULL) OR (HME.HMEMESCOBRANCA  =' +
        ':PHMEMESCOBRANCA) )'
      
        '   AND ( (:PHMEPARCELA        IS NULL) OR (HME.HMEPARCELA      =' +
        ':PHMEPARCELA) )')
    ValidateWithMask = True
    Left = 56
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end>
    object qryDocumentosExclusaoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.CODDOCUMENTO'
    end
  end
  object qryExcluiFinanceiro: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 56
    Top = 200
  end
end
