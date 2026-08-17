inherited dtmRelEstatSuplBenef: TdtmRelEstatSuplBenef
  Left = 348
  Top = 202
  Width = 172
  Height = 220
  Caption = 'dtmRelEstatSuplBenef'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 18
    Top = 51
  end
  inherited dsExemplo: TwwDataSource
    Left = 18
    Top = 99
  end
  inherited qryExemplo: TwwQuery
    Left = 18
    Top = 148
  end
  inherited rpExemplo: TppReport
    Left = 18
    Top = 4
  end
  object QryEstatSuplBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HST.MESCOBRANCA,'
      '   BN.NOME AS BENEFICIO,'
      
        '   sum(decode(pvd.flgdesconto, 0, hst.valorprovento, 0, 0)) as s' +
        'uplementacaoes,'
      '   COUNT(BPP.IDBENEFICIO) AS QTDE'
      
        ' FROM HISTRUBSAL HST, PROVDESC PVD, BENEFPLANPREV BPP, BENEFICIO' +
        ' BN'
      ' WHERE'
      '   HST.IDMODULO = 18                AND'
      '   HST.VALORPROVENTO > 0            AND'
      '   PVD.IDPROVENTO  = HST.IDRUBRICA  AND'
      '   BPP.IDRUBRICA   = HST.IDRUBRICA  AND'
      '   BPP.IDBENEFICIO = BN.IDBENEFICIO '
      'AND HST.MESCOBRANCA BETWEEN '#39'2001/01'#39' AND '#39'2001/12'#39
      'AND BPP.IDBENEFICIO IN (4) '
      ''
      'GROUP BY '
      '    HST.MESCOBRANCA, '
      '    BN.NOME'
      'ORDER BY HST.MESCOBRANCA ASC')
    ValidateWithMask = True
    Left = 98
    Top = 148
    object QryEstatSuplBenefMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object QryEstatSuplBenefBENEFICIO: TStringField
      FieldName = 'BENEFICIO'
      Size = 60
    end
    object QryEstatSuplBenefSUPLEMENTACAOES: TFloatField
      FieldName = 'SUPLEMENTACAOES'
    end
    object QryEstatSuplBenefQTDE: TFloatField
      FieldName = 'QTDE'
    end
  end
  object DSEstatSuplBenef: TwwDataSource
    DataSet = QryEstatSuplBenef
    Left = 98
    Top = 99
  end
  object PipeEstatSuplBenef: TppBDEPipeline
    DataSource = DSEstatSuplBenef
    UserName = 'PipeEstatSuplBenef'
    Left = 98
    Top = 51
    object PipeEstatSuplBenefppField1: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 0
    end
    object PipeEstatSuplBenefppField2: TppField
      FieldAlias = 'BENEFICIO'
      FieldName = 'BENEFICIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object PipeEstatSuplBenefppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUPLEMENTACAOES'
      FieldName = 'SUPLEMENTACAOES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object PipeEstatSuplBenefppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
  end
  object pprEstatSuplBenef: TppReport
    AutoStop = False
    DataPipeline = PipeEstatSuplBenef
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório Estatístico de Suplementação por Benefício'
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 98
    Top = 4
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand33: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35454
      mmPrintPosition = 0
      object ppLabel181: TppLabel
        UserName = 'Label181'
        Caption = 'Demostrativo de Quantidades e Valores de Suplementações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 47625
        mmTop = 30427
        mmWidth = 111125
        BandType = 0
      end
      object ppDBText145: TppDBText
        UserName = 'DBText1401'
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
        mmLeft = 47361
        mmTop = 23548
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText146: TppDBText
        UserName = 'DBText146'
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
        mmLeft = 47361
        mmTop = 19315
        mmWidth = 14288
        BandType = 0
      end
      object ppDBText147: TppDBText
        UserName = 'DBText147'
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
        mmLeft = 47361
        mmTop = 15346
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText148: TppDBText
        UserName = 'DBText148'
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
        mmLeft = 47361
        mmTop = 10848
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText149: TppDBText
        UserName = 'DBText149'
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
        mmLeft = 39158
        mmTop = 4233
        mmWidth = 153988
        BandType = 0
      end
      object ppDBImage14: TppDBImage
        UserName = 'DBImage14'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmRelFolha.ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 5821
        mmTop = 3969
        mmWidth = 29633
        BandType = 0
      end
    end
    object ppDetailBand34: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText142: TppDBText
        UserName = 'DBText142'
        AutoSize = True
        DataField = 'MESCOBRANCA'
        DataPipeline = PipeEstatSuplBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 37835
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText143: TppDBText
        UserName = 'DBText143'
        AutoSize = True
        DataField = 'QTDE'
        DataPipeline = PipeEstatSuplBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 93134
        mmTop = 265
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText144: TppDBText
        UserName = 'DBText144'
        AutoSize = True
        DataField = 'SUPLEMENTACAOES'
        DataPipeline = PipeEstatSuplBenef
        DisplayFormat = '###,###,###,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 137054
        mmTop = 265
        mmWidth = 28840
        BandType = 4
      end
    end
    object ppFooterBand33: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable9'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 196850
        BandType = 8
      end
      object ppLine84: TppLine
        UserName = 'Line84'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 265
        mmWidth = 196850
        BandType = 8
      end
      object ppLabel164: TppLabel
        UserName = 'Label164'
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
        mmTop = 529
        mmWidth = 196850
        BandType = 8
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable10'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup21: TppGroup
      BreakName = 'BENEFICIO'
      DataPipeline = PipeEstatSuplBenef
      KeepTogether = True
      UserName = 'Group21'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand21: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14023
        mmPrintPosition = 0
        object ppLabel168: TppLabel
          UserName = 'Label168'
          Caption = 'Mês Cobrança'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 4233
          mmLeft = 37835
          mmTop = 9790
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppLabel177: TppLabel
          UserName = 'Label177'
          Caption = 'Benefício: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 37835
          mmTop = 1058
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppDBText141: TppDBText
          UserName = 'DBText141'
          AutoSize = True
          DataField = 'BENEFICIO'
          DataPipeline = PipeEstatSuplBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 57944
          mmTop = 1058
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
        object ppLabel179: TppLabel
          UserName = 'Label179'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 4233
          mmLeft = 82021
          mmTop = 9790
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object ppLabel180: TppLabel
          UserName = 'Label180'
          Caption = 'Suplementação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 4233
          mmLeft = 139700
          mmTop = 9790
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
        object ppLine88: TppLine
          UserName = 'Line88'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 529
          mmTop = 529
          mmWidth = 196321
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand21: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 157957
        mmPrintPosition = 0
        object ppLine89: TppLine
          UserName = 'Line89'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 82021
          mmTop = 265
          mmWidth = 19579
          BandType = 5
          GroupNo = 0
        end
        object ppLine90: TppLine
          UserName = 'Line90'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 139700
          mmTop = 265
          mmWidth = 26194
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc21: TppDBCalc
          UserName = 'DBCalc201'
          AutoSize = True
          DataField = 'SUPLEMENTACAOES'
          DataPipeline = PipeEstatSuplBenef
          DisplayFormat = '###,###,###,###.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 126471
          mmTop = 794
          mmWidth = 39423
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc22: TppDBCalc
          UserName = 'DBCalc22'
          AutoSize = True
          DataField = 'QTDE'
          DataPipeline = PipeEstatSuplBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 83344
          mmTop = 794
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDPTeeChart2: TppDPTeeChart
          UserName = 'DPTeeChart2'
          mmHeight = 68527
          mmLeft = 37836
          mmTop = 17727
          mmWidth = 103452
          BandType = 5
          GroupNo = 0
          object ppDPTeeChartControl2: TppDPTeeChartControl
            Left = 0
            Top = 0
            Width = 400
            Height = 250
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Title.Text.Strings = (
              'Quantidade X Mês'
              '')
            Legend.Visible = False
            BevelOuter = bvNone
            Color = clWhite
            object Series2: TBarSeries
              Tag = 3
              ColorEachPoint = True
              Marks.ArrowLength = 20
              Marks.Visible = False
              DataSource = PipeEstatSuplBenef
              SeriesColor = clRed
              XLabelsSource = 'MESCOBRANCA'
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'QTDE'
            end
          end
        end
        object ppDPTeeChart3: TppDPTeeChart
          UserName = 'DPTeeChart3'
          mmHeight = 68527
          mmLeft = 37836
          mmTop = 89959
          mmWidth = 103452
          BandType = 5
          GroupNo = 0
          object ppDPTeeChartControl3: TppDPTeeChartControl
            Left = 0
            Top = 0
            Width = 400
            Height = 250
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Title.Text.Strings = (
              'Valores X Mês'
              '')
            Legend.Visible = False
            BevelOuter = bvNone
            Color = clWhite
            object BarSeries1: TBarSeries
              Tag = 3
              ColorEachPoint = True
              Marks.ArrowLength = 20
              Marks.Visible = False
              DataSource = PipeEstatSuplBenef
              SeriesColor = clRed
              XLabelsSource = 'MESCOBRANCA'
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'SUPLEMENTACAOES'
            end
          end
        end
      end
    end
  end
end
