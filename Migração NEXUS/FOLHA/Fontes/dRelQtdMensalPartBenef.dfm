inherited dtmRelQtdMensalPartBenef: TdtmRelQtdMensalPartBenef
  Left = 368
  Top = 213
  Width = 211
  Height = 225
  Caption = 'dtmRelQtdMensalPartBenef'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 29
    Top = 56
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
    Left = 29
    Top = 106
  end
  inherited qryExemplo: TwwQuery
    Left = 29
    Top = 153
  end
  inherited rpExemplo: TppReport
    Left = 29
    Top = 8
  end
  object qryRelQtdPartBenefMes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  HRS.MESCOBRANCA,'
      '  PATRO.NOME AS PATRO,'
      '  PP.NOME AS PLANO,'
      '  BN.NOME AS BENEFICIO,'
      '  COUNT(HRS.IDPESSOA) AS QTDE'
      
        'FROM HISTRUBSAL HRS, BENEFPLANPREV BPP, BENEFICIO BN, PLANPREV P' +
        'P, PESSOA PATRO'
      'WHERE 1 = 2 AND '
      '  HRS.IDMODULO    = 18              AND'
      '  HRS.IDRUBRICA   = BPP.IDRUBRICA   AND'
      '  BPP.IDPLANOPREV = PP.IDPLANOPREV  AND'
      '  BN.IDBENEFICIO  = BPP.IDBENEFICIO AND'
      '  PATRO.IDPESSOA  = HRS.IDPESSJUR   AND'
      '  HRS.MESCOBRANCA = '#39'2002/06'#39' '
      'GROUP BY HRS.MESCOBRANCA, PP.NOME, BN.NOME, PATRO.NOME'
      ' ')
    ValidateWithMask = True
    Left = 121
    Top = 153
    object qryRelQtdPartBenefMesMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryRelQtdPartBenefMesPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryRelQtdPartBenefMesPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryRelQtdPartBenefMesBENEFICIO: TStringField
      FieldName = 'BENEFICIO'
      Size = 60
    end
    object qryRelQtdPartBenefMesQTDE: TFloatField
      FieldName = 'QTDE'
    end
  end
  object ppEstPartBenef: TppReport
    AutoStop = False
    DataPipeline = PPLEstPartBenef
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório Estatístico de Participantes Por Benefício'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 121
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand31: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34925
      mmPrintPosition = 0
      object ppDBImage12: TppDBImage
        UserName = 'DBImage101'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmRelFolha.ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 29633
        BandType = 0
      end
      object ppDBText127: TppDBText
        UserName = 'DBText127'
        DataField = 'NOME'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object ppDBText128: TppDBText
        UserName = 'DBText128'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText129: TppDBText
        UserName = 'DBText501'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText130: TppDBText
        UserName = 'DBText130'
        AutoSize = True
        DataField = 'BARCIDUF'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14552
        BandType = 0
      end
      object ppDBText131: TppDBText
        UserName = 'DBText131'
        DataField = 'CEP'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel121: TppLabel
        UserName = 'Label121'
        Caption = 'Relatório Estatístico de Participantes Por Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 59267
        mmTop = 29369
        mmWidth = 103452
        BandType = 0
      end
    end
    object ppDetailBand32: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText125: TppDBText
        UserName = 'DBText125'
        AutoSize = True
        DataField = 'PLANO'
        DataPipeline = PPLEstPartBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 12700
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText124: TppDBText
        UserName = 'DBText124'
        AutoSize = True
        DataField = 'BENEFICIO'
        DataPipeline = PPLEstPartBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 120915
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText126: TppDBText
        UserName = 'DBText126'
        AutoSize = True
        DataField = 'QTDE'
        DataPipeline = PPLEstPartBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 236009
        mmTop = 0
        mmWidth = 8731
        BandType = 4
      end
    end
    object ppFooterBand31: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable7'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257705
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 265
        mmWidth = 283634
        BandType = 8
      end
      object ppLabel122: TppLabel
        UserName = 'Label122'
        AutoSize = False
        Caption = 'Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 265
        mmWidth = 283898
        BandType = 8
      end
      object ppLine83: TppLine
        UserName = 'Line83'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 265
        mmWidth = 283899
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'QTDE'
        DataPipeline = PPLEstPartBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 223838
        mmTop = 3440
        mmWidth = 20902
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 222780
        mmTop = 3175
        mmWidth = 21960
        BandType = 7
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 204523
        mmTop = 3440
        mmWidth = 16933
        BandType = 7
      end
    end
    object ppGroup12: TppGroup
      BreakName = 'PATRO'
      DataPipeline = PPLEstPartBenef
      KeepTogether = True
      UserName = 'Group12'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand12: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppLabel117: TppLabel
          UserName = 'Label117'
          Caption = 'Patrocinadora: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 12700
          mmTop = 265
          mmWidth = 26194
          BandType = 3
          GroupNo = 1
        end
        object ppDBText123: TppDBText
          UserName = 'DBText123'
          AutoSize = True
          DataField = 'PATRO'
          DataPipeline = PPLEstPartBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 39158
          mmTop = 265
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object ppLine82: TppLine
          UserName = 'Line801'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 529
          mmTop = 265
          mmWidth = 283369
          BandType = 3
          GroupNo = 1
        end
        object ppLine80: TppLine
          UserName = 'Line80'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 529
          mmTop = 4763
          mmWidth = 283369
          BandType = 3
          GroupNo = 1
        end
        object ppLabel119: TppLabel
          UserName = 'Label119'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 4233
          mmLeft = 12700
          mmTop = 5292
          mmWidth = 9790
          BandType = 3
          GroupNo = 1
        end
        object ppLabel118: TppLabel
          UserName = 'Label118'
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 4233
          mmLeft = 120915
          mmTop = 5292
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object ppLabel116: TppLabel
          UserName = 'Label116'
          Caption = 'Mês Pagamento: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 223044
          mmTop = 265
          mmWidth = 29104
          BandType = 3
          GroupNo = 0
        end
        object ppDBText122: TppDBText
          UserName = 'DBText122'
          DataField = 'MESCOBRANCA'
          DataPipeline = PPLEstPartBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 253736
          mmTop = 265
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand12: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppLine81: TppLine
          UserName = 'Line81'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 222780
          mmTop = 0
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc18'
          AutoSize = True
          DataField = 'QTDE'
          DataPipeline = PPLEstPartBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 223838
          mmTop = 265
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Total '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 212725
          mmTop = 265
          mmWidth = 8731
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object PPLEstPartBenef: TppBDEPipeline
    DataSource = DSRelQtdPartBenefMes
    OpenDataSource = False
    UserName = 'PPLEstPartBenef'
    Left = 121
    Top = 56
    object PPLEstPartBenefppField1: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PPLEstPartBenefppField2: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PPLEstPartBenefppField3: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PPLEstPartBenefppField4: TppField
      FieldAlias = 'BENEFICIO'
      FieldName = 'BENEFICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PPLEstPartBenefppField5: TppField
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object DSRelQtdPartBenefMes: TwwDataSource
    DataSet = qryRelQtdPartBenefMes
    Left = 121
    Top = 106
  end
end
