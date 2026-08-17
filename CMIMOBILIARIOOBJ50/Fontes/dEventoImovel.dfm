object dtmEventoImovel: TdtmEventoImovel
  OldCreateOrder = False
  Left = 335
  Top = 216
  Height = 488
  Width = 752
  object qryMarcaRescisao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   CONTRATOIMOVEL C'
      'SET'
      '   FLGSTATUS = '#39'E'#39
      'WHERE'
      '   C.IDCONTRATOIMOVEL =:CONTRATO')
    ValidateWithMask = True
    Left = 184
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end>
  end
  object qryInsertEventoImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO'
      '   EVENTOIMOVEL'
      '   ('
      '   IDEVENTOIMOVEL,'
      '   IDIMOVEL,'
      '   EVIDATA,'
      '   EVICABECALHO,'
      '   EVIDESCRICAO,'
      '   IDUSUARIO,'
      '   IDCONTRATOIMOVEL,'
      '   FLGTIPOEVENTO,'
      '   EVIVLRANTERIOR,'
      '   EVIVLRAJUSTADO,'
      '   EVIDATAPROX,'
      '   EVIPERCENT,'
      '   EVIINDICEREAJUSTE,'
      '   IDTIPOEVENTOIMOB'
      '   )'
      'VALUES'
      '   ('
      '   :PIDEVENTOIMOVEL,'
      '   :PIDIMOVEL,'
      '   :PEVIDATA,'
      '   :PEVICABECALHO,'
      '   :PEVIDESCRICAO,'
      '   :PIDUSUARIO,'
      '   :PIDCONTRATOIMOVEL,'
      '   :PFLGTIPOEVENTO,'
      '   :PEVIVLRANTERIOR,'
      '   :PEVIVLRAJUSTADO,'
      '   :PEVIDATAPROX,'
      '   :PEVIPERCENT,'
      '   :PEVIINDICEREAJUSTE,'
      '   :PIDTIPOEVENTOIMOB'
      '   )')
    ValidateWithMask = True
    Left = 56
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEVENTOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PEVIDATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PEVICABECALHO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PEVIDESCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOEVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PEVIVLRANTERIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PEVIVLRAJUSTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PEVIDATAPROX'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PEVIPERCENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEVIINDICEREAJUSTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEVENTOIMOB'
        ParamType = ptUnknown
      end>
    object qryInsertEventoImovelIDREAJUSTECONIMO: TFloatField
      FieldName = 'IDREAJUSTECONIMO'
      Origin = 'REAJUSTECONIMO.IDREAJUSTECONIMO'
    end
    object qryInsertEventoImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'REAJUSTECONIMO.IDIMOVEL'
    end
    object qryInsertEventoImovelIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'REAJUSTECONIMO.IDCONTRATOIMOVEL'
    end
    object qryInsertEventoImovelIDTIPOEVENTOIMOB: TFloatField
      FieldName = 'IDTIPOEVENTOIMOB'
      Origin = 'BASEDADOS.EVENTOIMOVEL.IDTIPOEVENTOIMOB'
    end
    object qryInsertEventoImovelRCODATA: TDateTimeField
      FieldName = 'RCODATA'
      Origin = 'REAJUSTECONIMO.RCODATA'
    end
    object qryInsertEventoImovelFLGTIPOREAJUSTE: TStringField
      FieldName = 'FLGTIPOREAJUSTE'
      Origin = 'REAJUSTECONIMO.FLGTIPOREAJUSTE'
      Size = 1
    end
    object qryInsertEventoImovelRCOVLRALUGUEL: TFloatField
      FieldName = 'RCOVLRALUGUEL'
      Origin = 'REAJUSTECONIMO.RCOVLRALUGUEL'
    end
    object qryInsertEventoImovelRCOVLRCONTRATO: TFloatField
      FieldName = 'RCOVLRCONTRATO'
      Origin = 'REAJUSTECONIMO.RCOVLRCONTRATO'
    end
    object qryInsertEventoImovelRCOMOTIVO: TStringField
      FieldName = 'RCOMOTIVO'
      Origin = 'REAJUSTECONIMO.RCOMOTIVO'
      Size = 40
    end
    object qryInsertEventoImovelRCODATAPROXIMO: TDateTimeField
      FieldName = 'RCODATAPROXIMO'
      Origin = 'REAJUSTECONIMO.RCODATAPROXIMO'
    end
  end
  object qryEventoImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   E.IDEVENTOIMOVEL,'
      '   E.IDIMOVEL,'
      '   E.EVIDATA,'
      '   E.EVICABECALHO,'
      '   E.EVIDESCRICAO,'
      '   E.IDUSUARIO,'
      ''
      '   IM.IMONOME AS NOME_MESTRE, I.IMONOME AS NOME_IMOVEL,'
      '   (IM.IMONOME||'#39' - '#39'||I.IMONOME) AS IMOVEL_EXTENSO,'
      '   I.IMOCODIGO, I.IMOMATRICULA,'
      '   C.CONNUMERO, C.CONNOME,'
      ''
      '   U.NOMEUSUARIO,'
      '   PU.NOME'
      ''
      'FROM'
      '   PESSOA PU, EVENTOIMOVEL E,'
      '   IMOVEL I, IMOVEL IM,'
      '   CONTRATOIMOVEL C, USUARIOSISTEMA U'
      ''
      'WHERE'
      '   (((:PIMOVELNULL IS NOT NULL) AND (E.IDIMOVEL IS NULL))'
      '   OR ((:PIDIMOVEL IS NULL) OR (E.IDIMOVEL =:PIDIMOVEL)))'
      ''
      
        '   AND(((:PCONTRATONULL IS NOT NULL) AND (E.IDCONTRATOIMOVEL IS ' +
        'NULL))'
      
        '   OR ((:PIDCONTRATOIMOVEL IS NULL) OR (E.IDCONTRATOIMOVEL =:PID' +
        'CONTRATOIMOVEL)))'
      ''
      '   AND ( (:PEVIDATA IS NULL) OR (E.EVIDATA =:PEVIDATA) )'
      '   AND ( (:PEVIDATA IS NULL) OR (E.EVIDATA =:PEVIDATA) )'
      ''
      '   AND ( E.IDIMOVEL = I.IDIMOVEL(+) )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL(+) )'
      '   AND ( E.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )'
      '   AND ( E.IDUSUARIO = U.IDUSUARIO )'
      '   AND ( U.IDUSUARIO = PU.IDPESSOA )'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIMOVELNULL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCONTRATONULL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PEVIDATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PEVIDATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PEVIDATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PEVIDATA'
        ParamType = ptUnknown
      end>
    object qryEventoImovelIDEVENTOIMOVEL: TFloatField
      FieldName = 'IDEVENTOIMOVEL'
    end
    object qryEventoImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryEventoImovelEVIDATA: TDateTimeField
      FieldName = 'EVIDATA'
    end
    object qryEventoImovelEVICABECALHO: TStringField
      FieldName = 'EVICABECALHO'
      Size = 60
    end
    object qryEventoImovelEVIDESCRICAO: TMemoField
      FieldName = 'EVIDESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryEventoImovelIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
    end
    object qryEventoImovelNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryEventoImovelNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Size = 60
    end
    object qryEventoImovelIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryEventoImovelIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryEventoImovelIMOMATRICULA: TStringField
      FieldName = 'IMOMATRICULA'
    end
    object qryEventoImovelCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryEventoImovelCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryEventoImovelNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object qryEventoImovelNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object qryDeleteEventoImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '       EVENTOIMOVEL'
      'WHERE'
      
        '       ((:PIDEVENTOIMOVEL IS NULL) OR (IDEVENTOIMOVEL =:PIDEVENT' +
        'OIMOVEL))'
      '   AND ((:PIDIMOVEL IS NULL) OR (IDIMOVEL = :PIDIMOVEL))'
      
        '   AND ((:PTIPOEVENTO IS NULL) OR (FLGTIPOEVENTO = :PTIPOEVENTO)' +
        ')'
      '   AND ((:PEVIDATA IS NULL) OR (EVIDATA = :PEVIDATA))'
      '   AND ((:PVALOR IS NULL) OR (EVIVLRAJUSTADO = :PVALOR)) ')
    ValidateWithMask = True
    Left = 56
    Top = 28
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEVENTOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDEVENTOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PTIPOEVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PTIPOEVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PEVIDATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PEVIDATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALOR'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateEventoImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '   EVENTOIMOVEL'
      ''
      'WHERE'
      '   ( IDEVENTOIMOVEL =:PIDEVENTOIMOVEL )')
    ValidateWithMask = True
    Left = 56
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDEVENTOIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateSituacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   IMOVEL'
      '   '
      'SET'
      '   FLGSTATUS =:PFLGSTATUS,'
      '   FLGATIVO =:PFLGATIVO'
      ''
      'WHERE'
      '   ( IDIMOVEL =:PIDIMOVEL )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PFLGSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFLGATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryTipoEventoImob: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOEVENTOIMOB'
      '     , DESCRICAO'
      '     , FLGRAD'
      '     , FLGTIPOEVENTO'
      '     , DECODE(FLGTIPOEVENTO,'
      '              '#39'AC'#39', '#39'Acréscimo de Valores'#39','
      '              '#39'AD'#39', '#39'Aditivo Contratual'#39','
      '              '#39'AR'#39', '#39'Alteração Cadastral'#39','
      '              '#39'AQ'#39', '#39'Aquisição do Imóvel'#39','
      '              '#39'BB'#39', '#39'Baixa de Bem'#39','
      '              '#39'BD'#39', '#39'Baixa por Desmembramento'#39','
      '              '#39'BO'#39', '#39'Baixa por Encerramento de Obra'#39','
      '              '#39'BR'#39', '#39'Baixa por Remembramento'#39','
      '              '#39'CS'#39', '#39'Cancelamento da Suspensão'#39','
      '              '#39'CC'#39', '#39'Carta de Cobrança'#39','
      '              '#39'CD'#39', '#39'Confissão de Dívidas'#39','
      '              '#39'CA'#39', '#39'Contrato de Alienação'#39','
      '              '#39'DP'#39', '#39'Depreciação Inicial'#39','
      '              '#39'DM'#39', '#39'Desmembramento de Imóvel'#39','
      '              '#39'EC'#39', '#39'Encerramento Contratual'#39','
      '              '#39'ED'#39', '#39'Entrada por Desmembramento'#39','
      '              '#39'EO'#39', '#39'Entrada por Encerramento de Obra'#39','
      '              '#39'US'#39', '#39'Evento do Usuário'#39','
      '              '#39'PC'#39', '#39'Prorrogação Contratual'#39','
      '              '#39'RJ'#39', '#39'Reajuste Contratual'#39','
      '              '#39'RV'#39', '#39'Reavaliação Oficial do Imovel'#39','
      '              '#39'VM'#39', '#39'Reavaliação Valor de Mercado'#39','
      '              '#39'RD'#39', '#39'Recálculo de Cobrança'#39','
      '              '#39'RM'#39', '#39'Remembramento de Imóvel'#39','
      '              '#39'RE'#39', '#39'Renegociação Contratual'#39','
      '              '#39'RN'#39', '#39'Renovação Contratual'#39','
      '              '#39'RC'#39', '#39'Rescisão Contratual'#39','
      '              '#39'SU'#39', '#39'Suspensão Contratual'#39','
      '              '#39'TT'#39', '#39'Transferência de Tipo de Imóvel'#39
      '                   ) AS DESCTIPOINTERNO'
      '  FROM TIPOEVENTOIMOB'
      ' WHERE FLGTIPOEVENTO = :FLGTIPOEVENTO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 184
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'FLGTIPOEVENTO'
        ParamType = ptUnknown
      end>
    object qryTipoEventoImobIDTIPOEVENTOIMOB: TFloatField
      FieldName = 'IDTIPOEVENTOIMOB'
    end
    object qryTipoEventoImobDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryTipoEventoImobFLGRAD: TFloatField
      FieldName = 'FLGRAD'
    end
    object qryTipoEventoImobFLGTIPOEVENTO: TStringField
      FieldName = 'FLGTIPOEVENTO'
      FixedChar = True
      Size = 2
    end
    object qryTipoEventoImobDESCTIPOINTERNO: TStringField
      FieldName = 'DESCTIPOINTERNO'
      Size = 32
    end
  end
end
