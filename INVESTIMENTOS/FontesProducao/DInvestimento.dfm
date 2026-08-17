object dtmInvestimentos: TdtmInvestimentos
  OldCreateOrder = True
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object qrySaldoCaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT HC.IDCARTEIRAXEVENTO, HC.IDCARTEIRAINVEST, HC.IDCARTEIRAG' +
        'ERENC, HC.SLDHISTCAIXA AS SALDOCAIXA'
      'FROM   HISTCAIXA HC'
      'WHERE  HC.IDHISTCAIXA IN (SELECT MAX(IDHISTCAIXA)'
      '                      FROM HISTCAIXA'
      
        '                      WHERE DATAHISTCAIXA <= :DATAHISTCAIXA   AN' +
        'D'
      
        '                            IDPLANPREVCTBPATR = :IDPLANPREVCTBPA' +
        'TR'
      
        '                      GROUP BY IDCARTEIRAINVEST, IDCARTEIRAGEREN' +
        'C)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 24
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAHISTCAIXA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end>
    object qrySaldoCaixaIDCARTEIRAXEVENTO: TFloatField
      FieldName = 'IDCARTEIRAXEVENTO'
    end
    object qrySaldoCaixaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qrySaldoCaixaIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qrySaldoCaixaSALDOCAIXA: TFloatField
      FieldName = 'SALDOCAIXA'
    end
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
      '   IDOPERACAODIREITO)'
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
      '   :IDOPERACAODIREITO)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 136
    Top = 24
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
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
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
        ParamType = ptUnknown
      end>
  end
  object qrySaldoCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H1.IDCARTEIRAINVEST, H1.IDCARTEIRAGERENC, SUM(H1.SALDOVLR' +
        'INVCART) AS SALDOCARTEIRA'
      ''
      'FROM HISTCARTINV H1'
      ''
      'WHERE (H1.IDTIPOINVEST=2) AND'
      '      (H1.IDCARTEIRAINVEST = :IDCARTEIRAINVEST) AND'
      
        '      (((:IDCARTEIRAGERENC IS NOT NULL) AND (H1.IDCARTEIRAGERENC' +
        ' = :IDCARTEIRAGERENC)) OR'
      
        '        (:IDCARTEIRAGERENC IS NULL) AND (H1.IDCARTEIRAGERENC IS ' +
        'NULL)) AND'
      '      H1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR AND'
      '      H1.IDHISTCARTINV IN (SELECT MAX(H2.IDHISTCARTINV)'
      '                           FROM HISTCARTINV H2'
      '                           WHERE H2.IDTIPOINVEST = 2 AND'
      
        '                                 H2.IDCARTEIRAINVEST = :IDCARTEI' +
        'RAINVEST AND'
      
        '                                 (((:IDCARTEIRAGERENC IS NOT NUL' +
        'L) AND (H2.IDCARTEIRAGERENC = :IDCARTEIRAGERENC)) OR'
      
        '                                   (:IDCARTEIRAGERENC IS NULL) A' +
        'ND (H2.IDCARTEIRAGERENC IS NULL)) AND'
      
        '                                 H2.IDPLANPREVCTBPATR = :IDPLANP' +
        'REVCTBPATR AND'
      
        '                                 H2.DATAMOVCARTINV <= TO_DATE(:D' +
        'ATAMOVCARTINV,'#39'DD/MM/YYYY'#39') AND'
      
        '                                 H2.DATAMOVCARTINV = (SELECT MAX' +
        '(H3.DATAMOVCARTINV)'
      
        '                                                      FROM HISTC' +
        'ARTINV H3'
      
        '                                                      WHERE H3.I' +
        'DTIPOINVEST = 2 AND'
      
        '                                                            H3.I' +
        'DCARTEIRAINVEST = :IDCARTEIRAINVEST AND'
      
        '                                                            (((:' +
        'IDCARTEIRAGERENC IS NOT NULL) AND (H3.IDCARTEIRAGERENC = :IDCART' +
        'EIRAGERENC)) OR'
      
        '                                                              (:' +
        'IDCARTEIRAGERENC IS NULL) AND (H3.IDCARTEIRAGERENC IS NULL)) AND'
      
        '                                                            H3.I' +
        'DPLANPREVCTBPATR = :IDPLANPREVCTBPATR AND'
      
        '                                                            H3.D' +
        'ATAMOVCARTINV <= TO_DATE(:DATAMOVCARTINV,'#39'DD/MM/YYYY'#39') AND'
      
        '                                                            H3.I' +
        'DHISTCARTINV = H2.IDHISTCARTINV'
      
        '                                                      GROUP BY H' +
        '3.IDINVESTIMENTO,H3.IDCARTEIRAINVEST, H3.IDCARTEIRAGERENC)'
      
        '                           GROUP BY H2.IDINVESTIMENTO,H2.IDCARTE' +
        'IRAINVEST, H2.IDCARTEIRAGERENC) AND'
      '      H1.SALDOVLRINVCART > 0'
      'GROUP BY H1.IDCARTEIRAINVEST, H1.IDCARTEIRAGERENC')
    ValidateWithMask = True
    Left = 32
    Top = 88
    ParamData = <
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
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
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
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
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
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptResult
      end>
    object qrySaldoCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qrySaldoCarteiraIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qrySaldoCarteiraSALDOCARTEIRA: TFloatField
      FieldName = 'SALDOCARTEIRA'
    end
  end
  object qryCarteiraEventoCota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CE.IDCARTEIRAXEVENTO, '
      '       CE.IDCARTEIRAINVEST, CE.IDCARTEIRAGERENC, '
      
        '       DECODE(CE.IDCARTEIRAGERENC,NULL,CI.DESCCARTINVEST, CG.DES' +
        'CCARTGERENC) AS DESCCARTEIRA,'
      '       CE.IDEVENTOCAIXACOTA,'
      '       EC.DESCCAIXACOTA, EC.IDTIPOOPERACAO, EC.IDTIPOINVEST,'
      '       EC.STACAIXA, EC.STASOMADIMINUI,'
      '       EC.STACOTA, EC.STAATIVOPASSIVO, EC.STACOTIZA,'
      '       EC.IDREGRA'
      
        'FROM CARTEIRAXEVENTO CE, EVENTOCAIXACOTA EC, CARTEIRAINVEST CI, ' +
        'CARTEIRAGERENC CG'
      'WHERE CE.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA AND'
      '      CE.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST(+) AND'
      '      CE.IDCARTEIRAGERENC = CG.IDCARTEIRAGERENC(+) AND'
      '      CE.IDCARTEIRAINVEST = :IDCARTEIRAINVEST AND'
      
        '      (((:IDCARTEIRAGERENC IS NOT NULL) AND (CE.IDCARTEIRAGERENC' +
        ' = :IDCARTEIRAGERENC)) OR'
      
        '       ((:IDCARTEIRAGERENC IS NULL) AND (CE.IDCARTEIRAGERENC IS ' +
        'NULL))) AND'
      '      ((EC.STACOTA = '#39'S'#39') OR (CE.IDEVENTOCAIXACOTA < 0))'
      'ORDER BY IDEVENTOCAIXACOTA DESC'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 208
    ParamData = <
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
    object qryCarteiraEventoCotaIDCARTEIRAXEVENTO: TFloatField
      FieldName = 'IDCARTEIRAXEVENTO'
      Origin = 'BASEDADOS.CARTEIRAXEVENTO.IDCARTEIRAXEVENTO'
    end
    object qryCarteiraEventoCotaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAXEVENTO.IDCARTEIRAINVEST'
    end
    object qryCarteiraEventoCotaIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'BASEDADOS.CARTEIRAXEVENTO.IDCARTEIRAGERENC'
    end
    object qryCarteiraEventoCotaIDEVENTOCAIXACOTA: TFloatField
      FieldName = 'IDEVENTOCAIXACOTA'
      Origin = 'BASEDADOS.CARTEIRAXEVENTO.IDEVENTOCAIXACOTA'
    end
    object qryCarteiraEventoCotaDESCCAIXACOTA: TStringField
      FieldName = 'DESCCAIXACOTA'
      Origin = 'BASEDADOS.EVENTOCAIXACOTA.DESCCAIXACOTA'
      Size = 40
    end
    object qryCarteiraEventoCotaIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.EVENTOCAIXACOTA.IDTIPOOPERACAO'
    end
    object qryCarteiraEventoCotaIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.EVENTOCAIXACOTA.IDTIPOINVEST'
    end
    object qryCarteiraEventoCotaSTACAIXA: TStringField
      FieldName = 'STACAIXA'
      Origin = 'BASEDADOS.EVENTOCAIXACOTA.STACAIXA'
      FixedChar = True
      Size = 1
    end
    object qryCarteiraEventoCotaSTASOMADIMINUI: TStringField
      FieldName = 'STASOMADIMINUI'
      Origin = 'BASEDADOS.EVENTOCAIXACOTA.STASOMADIMINUI'
      FixedChar = True
      Size = 1
    end
    object qryCarteiraEventoCotaSTACOTA: TStringField
      FieldName = 'STACOTA'
      Origin = 'BASEDADOS.EVENTOCAIXACOTA.STACOTA'
      FixedChar = True
      Size = 1
    end
    object qryCarteiraEventoCotaSTAATIVOPASSIVO: TStringField
      FieldName = 'STAATIVOPASSIVO'
      Origin = 'BASEDADOS.EVENTOCAIXACOTA.STAATIVOPASSIVO'
      FixedChar = True
      Size = 1
    end
    object qryCarteiraEventoCotaSTACOTIZA: TStringField
      FieldName = 'STACOTIZA'
      Origin = 'BASEDADOS.EVENTOCAIXACOTA.STACOTIZA'
      FixedChar = True
      Size = 1
    end
    object qryCarteiraEventoCotaIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.EVENTOCAIXACOTA.IDREGRA'
    end
    object qryCarteiraEventoCotaDESCCARTEIRA: TStringField
      FieldName = 'DESCCARTEIRA'
      Size = 60
    end
  end
  object qryBuscaHistCota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC, HC.IDCARTEIRAXE' +
        'VENTO, HC.DATAHISTCOTA, HC.VLRHISTCOTA'
      'FROM   HISTCOTA HC, CARTEIRAXEVENTO CE'
      'WHERE  HC.IDHISTCOTA IN (SELECT MAX(IDHISTCOTA)'
      '                         FROM HISTCOTA'
      
        '                         WHERE DATAHISTCOTA <= TO_DATE(:DATAHIST' +
        'COTA,'#39'DD/MM/YYYY'#39') AND'
      
        '                               IDPLANPREVCTBPATR = :IDPLANPREVCT' +
        'BPATR AND'
      
        '                               IDCARTEIRAINVEST = :IDCARTEIRAINV' +
        'EST  AND'
      
        '                               (((:IDCARTEIRAGERENC IS NOT NULL)' +
        ' AND (IDCARTEIRAGERENC = :IDCARTEIRAGERENC)) OR'
      
        '                                ((:IDCARTEIRAGERENC IS NULL) AND' +
        ' (IDCARTEIRAGERENC IS NULL)))'
      
        '                         GROUP BY IDCARTEIRAINVEST, IDCARTEIRAGE' +
        'RENC) AND'
      '       HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO AND'
      '       CE.IDEVENTOCAIXACOTA = :IDEVENTOCAIXACOTA'
      'ORDER BY IDHISTCOTA DESC'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAHISTCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
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
      end
      item
        DataType = ftUnknown
        Name = 'IDEVENTOCAIXACOTA'
        ParamType = ptUnknown
      end>
    object qryBuscaHistCotaVLRHISTCOTA: TFloatField
      FieldName = 'VLRHISTCOTA'
    end
  end
  object qryInsereHistCota: TwwQuery
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
    Left = 144
    Top = 88
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
  object RegraCota: TRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 232
    Top = 24
  end
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
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTPROVISAO'
        ParamType = ptUnknown
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
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAHISTPROVISAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRHISTPROVISAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SLDHISTPROVISAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
  end
end
