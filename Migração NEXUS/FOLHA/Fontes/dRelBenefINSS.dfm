inherited dtmRelBenefINSS: TdtmRelBenefINSS
  Left = 315
  Top = 195
  Width = 181
  Height = 228
  Caption = 'dtmRelBenefINSS'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 23
    Top = 52
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
    Left = 23
    Top = 100
  end
  inherited qryExemplo: TwwQuery
    Left = 23
    Top = 151
  end
  inherited rpExemplo: TppReport
    Left = 23
    Top = 4
  end
  object qryRelBenefINSS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PATRO.NOME AS PATRO,'
      '  HST.MES,'
      '  PP.NOME AS PLANO,'
      '  BN.NOME AS BENEFICIO,'
      '  SUM(HST.VLBENEFPGTO) AS SUPLEMENTACAO'
      
        'FROM HSTBENEFBFCIARIO HST, BENEFPLANPREV BPP, PLANPREV PP, BENEF' +
        'ICIO BN, PESSOA PATRO'
      'WHERE HST.MES BETWEEN '#39'2001/01'#39'  AND  '#39'2001/12'#39' AND'
      '      BPP.FLGREFERENCIA = 1             AND'
      '      BPP.IDBENEFICIO = 29              AND'
      '      BPP.IDPLANOPREV = 16              AND'
      '      BPP.IDBENEFICIO = HST.IDBENEFICIO AND'
      '      BPP.IDPLANOPREV = HST.IDPLANOPREV AND'
      '      BPP.IDPLANOPREV = PP.IDPLANOPREV  AND'
      '      BPP.IDBENEFICIO = BN.IDBENEFICIO  AND'
      '      HST.VLBENEFPGTO > 0  AND'
      '      HST.FLGDEVOLUCAO <> 1 AND'
      '      PATRO.IDPESSOA  = HST.IDPESSJUR'
      'GROUP BY HST.MES, PP.NOME, BN.NOME, PATRO.NOME'
      'ORDER BY HST.MES ASC')
    ValidateWithMask = True
    Left = 104
    Top = 151
  end
  object dsRelBenefINSS: TwwDataSource
    DataSet = qryRelBenefINSS
    Left = 104
    Top = 100
  end
  object ppRelBenefINSS: TppBDEPipeline
    DataSource = dsRelBenefINSS
    UserName = 'RelBenefINSS'
    Left = 104
    Top = 52
    object ppRelBenefINSSppField1: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppRelBenefINSSppField2: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 7
      DisplayWidth = 7
      Position = 1
    end
    object ppRelBenefINSSppField3: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppRelBenefINSSppField4: TppField
      FieldAlias = 'BENEFICIO'
      FieldName = 'BENEFICIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppRelBenefINSSppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUPLEMENTACAO'
      FieldName = 'SUPLEMENTACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object rpRelBenefINSS: TppReport
    AutoStop = False
    DataPipeline = ppRelBenefINSS
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Valor Mensal do Benefício de INSS'
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
    Left = 104
    Top = 4
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35983
      mmPrintPosition = 0
      object ppLabel184: TppLabel
        UserName = 'Label184'
        Caption = 'Demostrativo Mensal de Valores de Benefícios do INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 47890
        mmTop = 30691
        mmWidth = 111390
        BandType = 0
      end
      object ppLine85: TppLine
        UserName = 'Line85'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 35718
        mmWidth = 196321
        BandType = 0
      end
      object rpRelaEntSaiFolhaDBImage1: TppDBImage
        UserName = 'rpRelaEntSaiFolhaDBImage1'
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
      object rpRelaEntSaiFolhaDBText7: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText7'
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
      object rpRelaEntSaiFolhaDBText10: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText10'
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
        mmWidth = 14288
        BandType = 0
      end
      object rpRelaEntSaiFolhaDBText9: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText9'
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
        mmWidth = 15875
        BandType = 0
      end
      object rpRelaEntSaiFolhaDBText8: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText8'
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
        mmWidth = 25929
        BandType = 0
      end
      object rpRelaEntSaiFolhaDBText1: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText1'
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
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'SUPLEMENTACAO'
        DataPipeline = ppRelBenefINSS
        DisplayFormat = '#.#0,##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 62177
        mmTop = 0
        mmWidth = 26195
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MES'
        DataPipeline = ppRelBenefINSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 21430
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel4: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema1'
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
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
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
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
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
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'BENEFICIO'
      DataPipeline = ppRelBenefINSS
      KeepTogether = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 23813
        mmPrintPosition = 0
        object ppLabel183: TppLabel
          UserName = 'Label183'
          Caption = 'Benefício: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 21431
          mmTop = 11113
          mmWidth = 18256
          BandType = 3
          GroupNo = 2
        end
        object ppDBText135: TppDBText
          UserName = 'DBText135'
          AutoSize = True
          DataField = 'BENEFICIO'
          DataPipeline = ppRelBenefINSS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 40217
          mmTop = 11113
          mmWidth = 62177
          BandType = 3
          GroupNo = 2
        end
        object ppLabel175: TppLabel
          UserName = 'Label175'
          Caption = 'Mês de Cobrança'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 4233
          mmLeft = 21431
          mmTop = 19315
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
        object ppLabel176: TppLabel
          UserName = 'Label176'
          Caption = 'Suplementação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 4233
          mmLeft = 62177
          mmTop = 19315
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Plano: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 21696
          mmTop = 6085
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Patrocinadora: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 21960
          mmTop = 1058
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = ppRelBenefINSS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 34131
          mmTop = 6085
          mmWidth = 67469
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'PATRO'
          DataPipeline = ppRelBenefINSS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 48683
          mmTop = 1058
          mmWidth = 38629
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 529
          mmTop = 16933
          mmWidth = 196321
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 96309
        mmPrintPosition = 0
        object ppDPTeeChart1: TppDPTeeChart
          UserName = 'DPTeeChart1'
          mmHeight = 82286
          mmLeft = 19315
          mmTop = 14288
          mmWidth = 160073
          BandType = 5
          GroupNo = 0
          object ppDPTeeChartControl1: TppDPTeeChartControl
            Left = 0
            Top = 0
            Width = 400
            Height = 250
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Title.Text.Strings = (
              'Valor Total X Mês'
              '')
            Legend.Alignment = laBottom
            Legend.ColorWidth = 20
            Legend.TextStyle = ltsPlain
            BevelOuter = bvNone
            Color = clWhite
            object Series1: TBarSeries
              Tag = 3
              ColorEachPoint = True
              Marks.ArrowLength = 20
              Marks.Visible = False
              DataSource = ppRelBenefINSS
              SeriesColor = clRed
              ValueFormat = '#,#0.##'
              XLabelsSource = 'MES'
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'SUPLEMENTACAO'
            end
          end
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 47625
          mmTop = 265
          mmWidth = 41010
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'SUPLEMENTACAO'
          DataPipeline = ppRelBenefINSS
          DisplayFormat = '#.#0,##'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 62442
          mmTop = 795
          mmWidth = 26195
          BandType = 5
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Total: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 47625
          mmTop = 794
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
