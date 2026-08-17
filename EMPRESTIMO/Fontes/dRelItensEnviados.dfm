inherited dtmRelItensEnviados: TdtmRelItensEnviados
  Left = 411
  Top = 251
  Width = 293
  Height = 161
  Caption = 'dtmRelItensEnviados'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
    Top = 80
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplExemploppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  inherited dsExemplo: TwwDataSource
    Left = 32
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 32
    Top = 56
  end
  inherited rpExemplo: TppReport
    Left = 32
    Top = 8
  end
  object pplItensEnviados: TppBDEPipeline
    DataSource = dsItensEnviados
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 120
    Top = 80
    object pplItensEnviadosppField1: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField3: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField4: TppField
      FieldAlias = 'DESCPLANO'
      FieldName = 'DESCPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField5: TppField
      FieldAlias = 'IDTIPOCONTREMPTMO'
      FieldName = 'IDTIPOCONTREMPTMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField6: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField7: TppField
      FieldAlias = 'TOTALCONCMES'
      FieldName = 'TOTALCONCMES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField8: TppField
      FieldAlias = 'VLRCONCMES'
      FieldName = 'VLRCONCMES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField9: TppField
      FieldAlias = 'TOTALPARCMES'
      FieldName = 'TOTALPARCMES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField10: TppField
      FieldAlias = 'VLRPARCMES'
      FieldName = 'VLRPARCMES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField11: TppField
      FieldAlias = 'TOTALPARCATR'
      FieldName = 'TOTALPARCATR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField12: TppField
      FieldAlias = 'VLRPARCATR'
      FieldName = 'VLRPARCATR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField13: TppField
      FieldAlias = 'TOTALENC'
      FieldName = 'TOTALENC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField14: TppField
      FieldAlias = 'VLRENCARGO'
      FieldName = 'VLRENCARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField15: TppField
      FieldAlias = 'TOTALAMO'
      FieldName = 'TOTALAMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField16: TppField
      FieldAlias = 'VLRAMORT'
      FieldName = 'VLRAMORT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField17: TppField
      FieldAlias = 'TOTALQUI'
      FieldName = 'TOTALQUI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField18: TppField
      FieldAlias = 'VLRQUITACAO'
      FieldName = 'VLRQUITACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField19: TppField
      FieldAlias = 'TOTALQUM'
      FieldName = 'TOTALQUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplItensEnviadosppField20: TppField
      FieldAlias = 'VLRQUITMORT'
      FieldName = 'VLRQUITMORT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
  end
  object dsItensEnviados: TwwDataSource
    DataSet = qryItensEnviados
    Left = 120
    Top = 68
  end
  object qryItensEnviados1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PAT.NOME,'
      '   PLA.NOME DESCPLANO,'
      '   TCE.TCEDESCRICAO,'
      '   NVL(CM.TOTALCONCMES, 0) TOTALCONCMES,'
      '   NVL(CM.VLRCONCMES, 0)   VLRCONCMES,'
      '   NVL(PM.TOTALPARCMES, 0) TOTALPARCMES,'
      '   NVL(PM.VLRPARCMES, 0)   VLRPARCMES,'
      '   NVL(PA.TOTALPARCATR, 0) TOTALPARCATR,'
      '   NVL(PA.VLRPARCATR, 0)   VLRPARCATR,'
      '   NVL(ENC.TOTALENC, 0)    TOTALENC,'
      '   NVL(ENC.VLRENCARGO, 0)  VLRENCARGO,'
      '   NVL(AMO.TOTALAMO, 0)    TOTALAMO,'
      '   NVL(AMO.VLRAMORT, 0)    VLRAMORT,'
      '   NVL(QUI.TOTALQUI, 0)    TOTALQUI,'
      '   NVL(QUI.VLRQUITACAO, 0) VLRQUITACAO,'
      '   NVL(QUM.TOTALQUM, 0)    TOTALQUM,'
      '   NVL(QUM.VLRQUITMORT, 0) VLRQUITMORT'
      ''
      'FROM'
      '   PESSOA PAT,'
      '   HISTMOVEMPTMO H,'
      '   CONTRATOEMPTMO C,'
      '   TIPOCONTREMPTMO TCE,'
      '   PLANPREV PLA,'
      ''
      '   ('
      '   SELECT'
      '      H.IDHISTMOVEMPTMO,'
      '      COUNT(H.IDCONTRATOEMPTMO) AS TOTALCONCMES,'
      '      SUM(HMEVLRPREVISTO) AS VLRCONCMES'
      '   FROM'
      '      HISTMOVEMPTMO H, CONTRATOEMPTMO C'
      '   WHERE'
      '          FLGENVIO            IS NULL'
      '      AND C.IDCONTRQUITACAO   IS NULL'
      '      AND H.HMETIPOMOV        = 0'
      '      AND H.HMECENTRALIZA     = 1'
      '      AND H.FLGESTORNADO      IS NULL'
      '      AND H.HMEANOCOBRANCA    =:PHMEANOCOBRANCA'
      '      AND H.HMEMESCOBRANCA    =:PHMEMESCOBRANCA'
      '      AND H.HMEANOCOMPETENCIA = H.HMEANOCOBRANCA'
      '      AND H.HMEMESCOMPETENCIA = H.HMEMESCOBRANCA'
      '      AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      H.IDHISTMOVEMPTMO'
      '   ) CM,'
      ''
      '   ('
      '   SELECT'
      '      H.IDHISTMOVEMPTMO,'
      '      COUNT(H.IDCONTRATOEMPTMO) AS TOTALPARCMES,'
      '      SUM(HMEVLRPREVISTO) AS VLRPARCMES'
      '   FROM'
      '      HISTMOVEMPTMO H, CONTRATOEMPTMO C'
      '   WHERE'
      '          FLGENVIO            IS NULL'
      '      AND C.IDCONTRQUITACAO   IS NULL'
      '      AND H.HMETIPOMOV        IN (1, 6, 7)'
      '      AND H.HMECENTRALIZA     = 1'
      '      AND H.FLGESTORNADO      IS NULL'
      '      AND H.HMEANOCOBRANCA    =:PHMEANOCOBRANCA'
      '      AND H.HMEMESCOBRANCA    =:PHMEMESCOBRANCA'
      '      AND H.HMEANOCOMPETENCIA = H.HMEANOCOBRANCA'
      '      AND H.HMEMESCOMPETENCIA = H.HMEMESCOBRANCA'
      '      AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      H.IDHISTMOVEMPTMO'
      '   ) PM,'
      ''
      '   ('
      '   SELECT'
      '      H.IDHISTMOVEMPTMO,'
      '      COUNT(H.IDCONTRATOEMPTMO) AS TOTALPARCATR,'
      '      SUM(HMEVLRPREVISTO) AS VLRPARCATR'
      '   FROM'
      '      HISTMOVEMPTMO H, CONTRATOEMPTMO C'
      '   WHERE'
      '          FLGENVIO            IS NULL'
      '      AND C.IDCONTRQUITACAO   IS NULL'
      '      AND H.HMETIPOMOV        IN (1, 6, 7)'
      '      AND H.HMECENTRALIZA     = 1'
      '      AND H.FLGESTORNADO      IS NULL'
      '      AND H.HMEANOCOBRANCA    =:PHMEANOCOBRANCA'
      '      AND H.HMEMESCOBRANCA    =:PHMEMESCOBRANCA'
      
        '      AND (RTRIM(LTRIM(H.HMEANOCOMPETENCIA)) || RTRIM(LTRIM(HMEM' +
        'ESCOMPETENCIA))) < (RTRIM(LTRIM(H.HMEANOCOBRANCA)) || RTRIM(LTRI' +
        'M(H.HMEMESCOBRANCA)))'
      '      AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      H.IDHISTMOVEMPTMO'
      '   ) PA,'
      ''
      '   ('
      '   SELECT'
      '      H.IDHISTMOVEMPTMO,'
      '      COUNT(H.IDCONTRATOEMPTMO) AS TOTALENC,'
      '      SUM(HMEVLRPREVISTO) AS VLRENCARGO'
      '   FROM'
      '      HISTMOVEMPTMO H, CONTRATOEMPTMO C'
      '   WHERE'
      '          FLGENVIO            IS NULL'
      '      AND C.IDCONTRQUITACAO   IS NULL'
      '      AND HMETIPOMOV          = 4'
      '      AND HMECENTRALIZA       = 0'
      '      AND FLGESTORNADO        IS NULL'
      '      AND H.HMEANOCOBRANCA    =:PHMEANOCOBRANCA'
      '      AND H.HMEMESCOBRANCA    =:PHMEMESCOBRANCA'
      '      AND H.HMEANOCOMPETENCIA = H.HMEANOCOBRANCA'
      '      AND H.HMEMESCOMPETENCIA = H.HMEMESCOBRANCA'
      '      AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      H.IDHISTMOVEMPTMO'
      '   ) ENC,'
      ''
      '   ('
      '   SELECT'
      '      H.IDHISTMOVEMPTMO,'
      '      COUNT(H.IDCONTRATOEMPTMO) AS TOTALAMO,'
      '      SUM(HMEVLRPREVISTO) AS VLRAMORT'
      '   FROM'
      '      HISTMOVEMPTMO H, CONTRATOEMPTMO C'
      '   WHERE'
      '          FLGENVIO            IS NULL'
      '      AND C.IDCONTRQUITACAO   IS NULL'
      '      AND HMETIPOMOV          = 2'
      '      AND HMECENTRALIZA       = 1'
      '      AND FLGESTORNADO        IS NULL'
      '      AND H.HMEANOCOBRANCA    =:PHMEANOCOBRANCA'
      '      AND H.HMEMESCOBRANCA    =:PHMEMESCOBRANCA'
      '      AND H.HMEANOCOMPETENCIA = H.HMEANOCOBRANCA'
      '      AND H.HMEMESCOMPETENCIA = H.HMEMESCOBRANCA'
      '      AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      H.IDHISTMOVEMPTMO'
      '   ) AMO,'
      ''
      '   ('
      '   SELECT'
      '      H.IDHISTMOVEMPTMO,'
      '      COUNT(H.IDCONTRATOEMPTMO) AS TOTALQUI,'
      '      SUM(HMEVLRPREVISTO) AS VLRQUITACAO'
      '   FROM'
      '      HISTMOVEMPTMO H, CONTRATOEMPTMO C'
      '   WHERE'
      '          FLGENVIO            IS NULL'
      '      AND C.IDCONTRQUITACAO   IS NULL'
      '      AND HMETIPOMOV          = 3'
      '      AND HMECENTRALIZA       = 1'
      '      AND FLGESTORNADO        IS NULL'
      '      AND H.HMEANOCOBRANCA    =:PHMEANOCOBRANCA'
      '      AND H.HMEMESCOBRANCA    =:PHMEMESCOBRANCA'
      '      AND H.HMEANOCOMPETENCIA = H.HMEANOCOBRANCA'
      '      AND H.HMEMESCOMPETENCIA = H.HMEMESCOBRANCA'
      '      AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      H.IDHISTMOVEMPTMO'
      '   ) QUI,'
      ''
      '   ('
      '   SELECT'
      '      H.IDHISTMOVEMPTMO,'
      '      COUNT(H.IDCONTRATOEMPTMO) AS TOTALQUM,'
      '      SUM(HMEVLRPREVISTO) AS VLRQUITMORT'
      '   FROM'
      '      HISTMOVEMPTMO H, CONTRATOEMPTMO C'
      '   WHERE'
      '          FLGENVIO            IS NULL'
      '      AND C.IDCONTRQUITACAO   IS NULL'
      '      AND HMETIPOMOV          = 3'
      '      AND HMEORIGEM           = 8'
      '      AND HMECENTRALIZA       = 1'
      '      AND FLGESTORNADO        IS NULL'
      '      AND H.HMEANOCOBRANCA    =:PHMEANOCOBRANCA'
      '      AND H.HMEMESCOBRANCA    =:PHMEMESCOBRANCA'
      '      AND H.HMEANOCOMPETENCIA = H.HMEANOCOBRANCA'
      '      AND H.HMEMESCOMPETENCIA = H.HMEMESCOBRANCA'
      '      AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO'
      '   GROUP BY'
      '      H.IDHISTMOVEMPTMO'
      '   ) QUM'
      ''
      'WHERE'
      '       H.IDHISTMOVEMPTMO   = PM.IDHISTMOVEMPTMO(+)'
      '   AND H.IDHISTMOVEMPTMO   = CM.IDHISTMOVEMPTMO(+)'
      '   AND H.IDHISTMOVEMPTMO   = PA.IDHISTMOVEMPTMO(+)'
      '   AND H.IDHISTMOVEMPTMO   = ENC.IDHISTMOVEMPTMO(+)'
      '   AND H.IDHISTMOVEMPTMO   = AMO.IDHISTMOVEMPTMO(+)'
      '   AND H.IDHISTMOVEMPTMO   = QUI.IDHISTMOVEMPTMO(+)'
      '   AND H.IDHISTMOVEMPTMO   = QUM.IDHISTMOVEMPTMO(+)'
      '   AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO'
      '   AND C.IDPATRO           = PAT.IDPESSOA'
      '   AND C.IDPLANOPREV       = PLA.IDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'
      ''
      'ORDER BY'
      '   PAT.NOME, PLA.NOME, TCE.TCEDESCRICAO')
    ValidateWithMask = True
    Left = 216
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
        Value = '2002'
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
        Value = '1'
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
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end>
    object qryItensEnviados1NOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryItensEnviados1TCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryItensEnviados1TOTALPARCMES: TFloatField
      FieldName = 'TOTALPARCMES'
    end
    object qryItensEnviados1TOTALPARCATR: TFloatField
      FieldName = 'TOTALPARCATR'
    end
    object qryItensEnviados1TOTALENC: TFloatField
      FieldName = 'TOTALENC'
    end
    object qryItensEnviados1TOTALAMO: TFloatField
      FieldName = 'TOTALAMO'
    end
    object qryItensEnviados1TOTALQUI: TFloatField
      FieldName = 'TOTALQUI'
    end
    object qryItensEnviados1TOTALQUM: TFloatField
      FieldName = 'TOTALQUM'
    end
    object qryItensEnviados1VLRPARCMES: TFloatField
      FieldName = 'VLRPARCMES'
    end
    object qryItensEnviados1VLRPARCATR: TFloatField
      FieldName = 'VLRPARCATR'
    end
    object qryItensEnviados1VLRENCARGO: TFloatField
      FieldName = 'VLRENCARGO'
    end
    object qryItensEnviados1VLRAMORT: TFloatField
      FieldName = 'VLRAMORT'
    end
    object qryItensEnviados1VLRQUITACAO: TFloatField
      FieldName = 'VLRQUITACAO'
    end
    object qryItensEnviados1VLRQUITMORT: TFloatField
      FieldName = 'VLRQUITMORT'
    end
    object qryItensEnviados1DESCPLANO: TStringField
      FieldName = 'DESCPLANO'
      Size = 50
    end
    object qryItensEnviados1TOTALCONCMES: TFloatField
      FieldName = 'TOTALCONCMES'
    end
    object qryItensEnviados1VLRCONCMES: TFloatField
      FieldName = 'VLRCONCMES'
    end
  end
  object rptItensEnviados: TppReport
    AutoStop = False
    DataPipeline = pplItensEnviados
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Rel. Itens Enviados'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 296863
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 120
    Top = 8
    Version = '5.5'
    mmColumnWidth = 270405
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Valores Enviados (sintético por Evento por Patrocinadora)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 11113
        mmTop = 8731
        mmWidth = 248444
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 11113
        mmTop = 794
        mmWidth = 248444
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Mês de Cobrança:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 18521
        mmWidth = 32279
        BandType = 0
      end
      object ppLabel872: TppLabel
        OnPrint = ppLabel872Print
        UserName = 'Label872'
        Caption = 'Janeiro/2002'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 32279
        mmTop = 18521
        mmWidth = 20373
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object rptContrato: TppShape
        OnPrint = rptContratoPrint
        UserName = 'rptContrato'
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 3175
        mmLeft = 4233
        mmTop = 0
        mmWidth = 270405
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'TOTALPARCMES'
        DataPipeline = pplItensEnviados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 125942
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'TOTALENC'
        DataPipeline = pplItensEnviados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 180711
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'TOTALAMO'
        DataPipeline = pplItensEnviados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 204523
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'TOTALQUI'
        DataPipeline = pplItensEnviados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 233098
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'TOTALQUM'
        DataPipeline = pplItensEnviados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 259292
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'TOTALPARCATR'
        DataPipeline = pplItensEnviados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 154517
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplItensEnviados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        mmHeight = 3175
        mmLeft = 6615
        mmTop = 0
        mmWidth = 49213
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRPARCMES'
        DataPipeline = pplItensEnviados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 108744
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLRPARCATR'
        DataPipeline = pplItensEnviados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 138907
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VLRENCARGO'
        DataPipeline = pplItensEnviados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'VLRAMORT'
        DataPipeline = pplItensEnviados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 191294
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'VLRQUITACAO'
        DataPipeline = pplItensEnviados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 217488
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'VLRQUITMORT'
        DataPipeline = pplItensEnviados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 246063
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'VLRCONCMES'
        DataPipeline = pplItensEnviados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 76994
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'TOTALCONCMES'
        DataPipeline = pplItensEnviados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 92604
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 270405
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 3175
        mmWidth = 23019
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 87842
        mmTop = 3175
        mmWidth = 94986
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 238919
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 6350
        mmLeft = 71438
        mmTop = 6879
        mmWidth = 199232
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 3704
        mmWidth = 270405
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'TOTALPARCMES'
        DataPipeline = pplItensEnviados
        DisplayFormat = '(#####,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 124619
        mmTop = 7938
        mmWidth = 11377
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        DataField = 'TOTALPARCATR'
        DataPipeline = pplItensEnviados
        DisplayFormat = '(#####,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 154782
        mmTop = 7938
        mmWidth = 9790
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'TOTALENC'
        DataPipeline = pplItensEnviados
        DisplayFormat = '(#####,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 180975
        mmTop = 7673
        mmWidth = 9790
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc13'
        DataField = 'TOTALAMO'
        DataPipeline = pplItensEnviados
        DisplayFormat = '(#####,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 207169
        mmTop = 7673
        mmWidth = 7408
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'TOTALQUI'
        DataPipeline = pplItensEnviados
        DisplayFormat = '(#####,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 233363
        mmTop = 7673
        mmWidth = 9790
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc15'
        DataField = 'TOTALQUM'
        DataPipeline = pplItensEnviados
        DisplayFormat = '(#####,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 261938
        mmTop = 7673
        mmWidth = 7408
        BandType = 7
      end
      object ppDBCalc31: TppDBCalc
        UserName = 'DBCalc31'
        DataField = 'VLRPARCMES'
        DataPipeline = pplItensEnviados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 104511
        mmTop = 7938
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc32: TppDBCalc
        UserName = 'DBCalc32'
        DataField = 'VLRPARCATR'
        DataPipeline = pplItensEnviados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 137848
        mmTop = 7938
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc33: TppDBCalc
        UserName = 'DBCalc33'
        DataField = 'VLRENCARGO'
        DataPipeline = pplItensEnviados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 166423
        mmTop = 7673
        mmWidth = 14817
        BandType = 7
      end
      object ppDBCalc34: TppDBCalc
        UserName = 'DBCalc34'
        DataField = 'VLRAMORT'
        DataPipeline = pplItensEnviados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 192617
        mmTop = 7673
        mmWidth = 14817
        BandType = 7
      end
      object ppDBCalc35: TppDBCalc
        UserName = 'DBCalc35'
        DataField = 'VLRQUITACAO'
        DataPipeline = pplItensEnviados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 216430
        mmTop = 7673
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc36: TppDBCalc
        UserName = 'DBCalc301'
        DataField = 'VLRQUITMORT'
        DataPipeline = pplItensEnviados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 245005
        mmTop = 7673
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Total Geral:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 53181
        mmTop = 7938
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc55: TppDBCalc
        UserName = 'DBCalc55'
        DataField = 'VLRCONCMES'
        DataPipeline = pplItensEnviados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 72761
        mmTop = 7938
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc56: TppDBCalc
        UserName = 'DBCalc101'
        DataField = 'TOTALCONCMES'
        DataPipeline = pplItensEnviados
        DisplayFormat = '(#####,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 92869
        mmTop = 7938
        mmWidth = 9790
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = pplItensEnviados
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 8467
          mmLeft = 0
          mmTop = 1058
          mmWidth = 270405
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 9260
          mmWidth = 270405
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Encargos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 177800
          mmTop = 5821
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Amortizações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 196057
          mmTop = 5821
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Antecipadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 226484
          mmTop = 5821
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label2'
          Caption = 'por Morte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 256117
          mmTop = 5821
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Parcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 152929
          mmTop = 2646
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'NOME'
          DataPipeline = pplItensEnviados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 529
          mmTop = 5821
          mmWidth = 75936
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Parcelas do Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 113771
          mmTop = 5821
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Anteriores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 150548
          mmTop = 5821
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Quitações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 255588
          mmTop = 2646
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label101'
          Caption = 'Quitações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 229394
          mmTop = 2646
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Concessões'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 85990
          mmTop = 5821
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 24077
        mmPrintPosition = 0
        object rptContratosAdminAnalShape1: TppShape
          UserName = 'rptContratosAdminAnalShape1'
          Pen.Width = 2
          mmHeight = 6350
          mmLeft = 71438
          mmTop = 9525
          mmWidth = 199232
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'TOTALENC'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 180975
          mmTop = 10583
          mmWidth = 9790
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'TOTALAMO'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 207169
          mmTop = 10583
          mmWidth = 7408
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'TOTALQUI'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 233363
          mmTop = 10583
          mmWidth = 9790
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'TOTALQUM'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 261938
          mmTop = 10583
          mmWidth = 7408
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'TOTALPARCATR'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 154782
          mmTop = 10583
          mmWidth = 9790
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'TOTALPARCMES'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 124619
          mmTop = 10583
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc25: TppDBCalc
          UserName = 'DBCalc25'
          DataField = 'VLRPARCMES'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 104511
          mmTop = 10583
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc26: TppDBCalc
          UserName = 'DBCalc26'
          DataField = 'VLRPARCATR'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 137848
          mmTop = 10583
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc27: TppDBCalc
          UserName = 'DBCalc27'
          DataField = 'VLRENCARGO'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 166423
          mmTop = 10583
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc28: TppDBCalc
          UserName = 'DBCalc28'
          DataField = 'VLRAMORT'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 192617
          mmTop = 10583
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc29: TppDBCalc
          UserName = 'DBCalc29'
          DataField = 'VLRQUITACAO'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 216430
          mmTop = 10583
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc30: TppDBCalc
          UserName = 'DBCalc30'
          DataField = 'VLRQUITMORT'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 245005
          mmTop = 10583
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 6879
          mmWidth = 270405
          BandType = 5
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Total da Patrocinadora:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 37306
          mmTop = 10583
          mmWidth = 34131
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc53: TppDBCalc
          UserName = 'DBCalc53'
          DataField = 'VLRCONCMES'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 72761
          mmTop = 10583
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc54: TppDBCalc
          UserName = 'DBCalc54'
          DataField = 'TOTALCONCMES'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 92869
          mmTop = 10583
          mmWidth = 9790
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCPLANO'
      DataPipeline = pplItensEnviados
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'DESCPLANO'
          DataPipeline = pplItensEnviados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3440
          mmLeft = 2646
          mmTop = 2646
          mmWidth = 79640
          BandType = 3
          GroupNo = 1
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 2117
          mmTop = 5821
          mmWidth = 268553
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object ppShape3: TppShape
          UserName = 'Shape3'
          mmHeight = 5292
          mmLeft = 71702
          mmTop = 2910
          mmWidth = 198702
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'TOTALPARCATR'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 154782
          mmTop = 3704
          mmWidth = 9790
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'TOTALENC'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 180975
          mmTop = 3704
          mmWidth = 9790
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc19: TppDBCalc
          UserName = 'DBCalc19'
          DataField = 'TOTALAMO'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 207169
          mmTop = 3704
          mmWidth = 7408
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'DBCalc20'
          DataField = 'TOTALQUI'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 233363
          mmTop = 3704
          mmWidth = 9790
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc21: TppDBCalc
          UserName = 'DBCalc21'
          DataField = 'TOTALQUM'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 261938
          mmTop = 3704
          mmWidth = 7408
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'TOTALPARCMES'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 124619
          mmTop = 3704
          mmWidth = 11377
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'VLRPARCMES'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 104511
          mmTop = 3704
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'VLRPARCATR'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 137848
          mmTop = 3704
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc18'
          DataField = 'VLRENCARGO'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 166423
          mmTop = 3704
          mmWidth = 14817
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc22: TppDBCalc
          UserName = 'DBCalc22'
          DataField = 'VLRAMORT'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 192617
          mmTop = 3704
          mmWidth = 14817
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc23: TppDBCalc
          UserName = 'DBCalc23'
          DataField = 'VLRQUITACAO'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 216430
          mmTop = 3704
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc24: TppDBCalc
          UserName = 'DBCalc24'
          DataField = 'VLRQUITMORT'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 245005
          mmTop = 3704
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 2117
          mmTop = 0
          mmWidth = 268553
          BandType = 5
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label1'
          Caption = 'Total do Plano:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 48683
          mmTop = 3704
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc51: TppDBCalc
          UserName = 'DBCalc51'
          DataField = 'VLRCONCMES'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 72761
          mmTop = 3704
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc52: TppDBCalc
          UserName = 'DBCalc52'
          DataField = 'TOTALCONCMES'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 92869
          mmTop = 3704
          mmWidth = 9790
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'TCEDESCRICAO'
      DataPipeline = pplItensEnviados
      KeepTogether = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          Visible = False
          Weight = 0.75
          mmHeight = 4763
          mmLeft = 0
          mmTop = 0
          mmWidth = 268553
          BandType = 5
          GroupNo = 2
        end
        object ppShape5: TppShape
          OnPrint = rptContratoPrint
          UserName = 'Shape5'
          ParentHeight = True
          Pen.Color = clWhite
          mmHeight = 4763
          mmLeft = 2117
          mmTop = 0
          mmWidth = 268553
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc37: TppDBCalc
          UserName = 'DBCalc37'
          DataField = 'TOTALPARCMES'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 124619
          mmTop = 529
          mmWidth = 11377
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc38: TppDBCalc
          UserName = 'DBCalc38'
          DataField = 'VLRPARCMES'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 104511
          mmTop = 529
          mmWidth = 20373
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc39: TppDBCalc
          UserName = 'DBCalc39'
          DataField = 'TOTALPARCATR'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 154782
          mmTop = 529
          mmWidth = 9790
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc40: TppDBCalc
          UserName = 'DBCalc40'
          DataField = 'VLRPARCATR'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 137848
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc41: TppDBCalc
          UserName = 'DBCalc41'
          DataField = 'TOTALENC'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 180975
          mmTop = 529
          mmWidth = 9790
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc42: TppDBCalc
          UserName = 'DBCalc42'
          DataField = 'VLRENCARGO'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 166423
          mmTop = 529
          mmWidth = 14817
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc43: TppDBCalc
          UserName = 'DBCalc43'
          DataField = 'TOTALAMO'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 207169
          mmTop = 529
          mmWidth = 7408
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc44: TppDBCalc
          UserName = 'DBCalc44'
          DataField = 'VLRAMORT'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 192617
          mmTop = 529
          mmWidth = 14817
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc45: TppDBCalc
          UserName = 'DBCalc201'
          DataField = 'TOTALQUI'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 233363
          mmTop = 529
          mmWidth = 9790
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc46: TppDBCalc
          UserName = 'DBCalc46'
          DataField = 'VLRQUITACAO'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 216430
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc47: TppDBCalc
          UserName = 'DBCalc47'
          DataField = 'TOTALQUM'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 261938
          mmTop = 529
          mmWidth = 7408
          BandType = 5
          GroupNo = 2
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplItensEnviados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 5821
          mmTop = 529
          mmWidth = 52388
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc48: TppDBCalc
          UserName = 'DBCalc48'
          DataField = 'VLRQUITMORT'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 245005
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc49: TppDBCalc
          UserName = 'DBCalc49'
          DataField = 'VLRCONCMES'
          DataPipeline = pplItensEnviados
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 72761
          mmTop = 529
          mmWidth = 20373
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc50: TppDBCalc
          UserName = 'DBCalc50'
          DataField = 'TOTALCONCMES'
          DataPipeline = pplItensEnviados
          DisplayFormat = '(#,0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 92869
          mmTop = 529
          mmWidth = 9790
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryItensEnviados: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      
        '   0                                                            ' +
        '  AS IDPESSOA,'
      
        '   '#39'                                                            ' +
        #39' AS NOME,'
      
        '   0                                                            ' +
        '  AS IDPLANOPREV,'
      
        '   '#39'                                                  '#39'         ' +
        '  AS DESCPLANO,'
      
        '   0                                                            ' +
        '  AS IDTIPOCONTREMPTMO,'
      
        '   '#39'                                                            ' +
        #39' AS TCEDESCRICAO,'
      
        '   0                                                            ' +
        '  AS TOTALCONCMES,'
      
        '   0                                                            ' +
        '  AS VLRCONCMES,'
      
        '   0                                                            ' +
        '  AS TOTALPARCMES,'
      
        '   0                                                            ' +
        '  AS VLRPARCMES,'
      
        '   0                                                            ' +
        '  AS TOTALPARCATR,'
      
        '   0                                                            ' +
        '  AS VLRPARCATR,'
      
        '   0                                                            ' +
        '  AS TOTALENC,'
      
        '   0                                                            ' +
        '  AS VLRENCARGO,'
      
        '   0                                                            ' +
        '  AS TOTALAMO,'
      
        '   0                                                            ' +
        '  AS VLRAMORT,'
      
        '   0                                                            ' +
        '  AS TOTALQUI,'
      
        '   0                                                            ' +
        '  AS VLRQUITACAO,'
      
        '   0                                                            ' +
        '  AS TOTALQUM,'
      
        '   0                                                            ' +
        '  AS VLRQUITMORT'
      'FROM'
      '   DUAL'
      'WHERE 1 = 2'
      '')
    UpdateObject = UpdateSQL
    ValidateWithMask = True
    Left = 120
    Top = 56
    object qryItensEnviadosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryItensEnviadosNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 60
    end
    object qryItensEnviadosIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryItensEnviadosDESCPLANO: TStringField
      FieldName = 'DESCPLANO'
      FixedChar = True
      Size = 50
    end
    object qryItensEnviadosIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryItensEnviadosTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qryItensEnviadosTOTALCONCMES: TFloatField
      FieldName = 'TOTALCONCMES'
    end
    object qryItensEnviadosVLRCONCMES: TFloatField
      FieldName = 'VLRCONCMES'
    end
    object qryItensEnviadosTOTALPARCMES: TFloatField
      FieldName = 'TOTALPARCMES'
    end
    object qryItensEnviadosVLRPARCMES: TFloatField
      FieldName = 'VLRPARCMES'
    end
    object qryItensEnviadosTOTALPARCATR: TFloatField
      FieldName = 'TOTALPARCATR'
    end
    object qryItensEnviadosVLRPARCATR: TFloatField
      FieldName = 'VLRPARCATR'
    end
    object qryItensEnviadosTOTALENC: TFloatField
      FieldName = 'TOTALENC'
    end
    object qryItensEnviadosVLRENCARGO: TFloatField
      FieldName = 'VLRENCARGO'
    end
    object qryItensEnviadosTOTALAMO: TFloatField
      FieldName = 'TOTALAMO'
    end
    object qryItensEnviadosVLRAMORT: TFloatField
      FieldName = 'VLRAMORT'
    end
    object qryItensEnviadosTOTALQUI: TFloatField
      FieldName = 'TOTALQUI'
    end
    object qryItensEnviadosVLRQUITACAO: TFloatField
      FieldName = 'VLRQUITACAO'
    end
    object qryItensEnviadosTOTALQUM: TFloatField
      FieldName = 'TOTALQUM'
    end
    object qryItensEnviadosVLRQUITMORT: TFloatField
      FieldName = 'VLRQUITMORT'
    end
  end
  object UpdateSQL: TUpdateSQL
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (IDPESSOA, NOME, IDPLANOPREV, DESCPLANO, IDTIPOCONTREMPTMO, '
      'TCEDESCRICAO, '
      '   TOTALCONCMES, VLRCONCMES, TOTALPARCMES, VLRPARCMES, '
      'TOTALPARCATR, VLRPARCATR, '
      '   TOTALENC, VLRENCARGO, TOTALAMO, VLRAMORT, TOTALQUI, '
      'VLRQUITACAO, TOTALQUM, '
      '   VLRQUITMORT)'
      'values'
      
        '  (:IDPESSOA, :NOME, :IDPLANOPREV, :DESCPLANO, :IDTIPOCONTREMPTM' +
        'O, '
      ':TCEDESCRICAO, '
      '   :TOTALCONCMES, :VLRCONCMES, :TOTALPARCMES, :VLRPARCMES, '
      ':TOTALPARCATR, '
      '   :VLRPARCATR, :TOTALENC, :VLRENCARGO, :TOTALAMO, :VLRAMORT, '
      ':TOTALQUI, '
      '   :VLRQUITACAO, :TOTALQUM, :VLRQUITMORT)')
    Left = 216
    Top = 56
  end
end
