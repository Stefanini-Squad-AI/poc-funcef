inherited FrmFiltroGraficoSuplDescFolha: TFrmFiltroGraficoSuplDescFolha
  Left = 185
  Top = 185
  HelpContext = 180050
  Caption = 
    'Gráfico Demonstrativo de Valores Suplementação, Desconto e Líqui' +
    'do por Período'
  ClientHeight = 181
  ClientWidth = 546
  FormStyle = fsMDIChild
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 546
    Height = 142
    object Label2: TLabel [0]
      Left = 25
      Top = 19
      Width = 46
      Height = 13
      Caption = 'Período'
    end
    inherited RdoTipoFolha: TRadioGroup
      Top = 157
      ItemIndex = 1
      Visible = False
    end
    inherited RdoTipoFiltro: TRadioGroup
      Top = 149
      ItemIndex = 1
      Visible = False
    end
    inherited PnlPreviaouEfetivada: TPanel
      Left = 22
      Top = 34
      Width = 508
      Height = 71
      inherited PnlLoteouVersao: TPanel [0]
        Top = 22
        Height = 30
        Visible = False
        inherited dblkLoteouVersao: TwwDBLookupCombo
          Visible = False
        end
      end
      inherited PnlMesPagto: TPanel [1]
        Left = 4
        Top = 5
        Width = 500
        Height = 60
        inherited LblMesPagto: TLabel
          Left = 9
          Top = 5
          Width = 62
          Caption = 'Mês Inicial'
        end
        object Label1: TLabel [1]
          Left = 271
          Top = 5
          Width = 55
          Height = 13
          Caption = 'Mês Final'
        end
        inherited CmbMes: TComboBox
          Left = 271
          Top = 22
        end
        inherited SpnedAno: TSpinEdit
          Left = 424
          Top = 22
        end
        object spnedAnoIni: TSpinEdit
          Left = 162
          Top = 22
          Width = 66
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 2
          Value = 0
        end
        object CbMesIni: TComboBox
          Left = 9
          Top = 22
          Width = 145
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 3
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Março'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro'
            'Outubro'
            'Novembro'
            'Dezembro')
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 142
    Width = 546
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qrySuplDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   HST.MESCOBRANCA, '
      
        '   SUM(DECODE(PVD.FLGDESCONTO, 0, HST.VALORPROVENTO, 0, 0)) AS S' +
        'UPLEMENTACAO,'
      
        '   SUM(DECODE(PVD.FLGDESCONTO, 1, HST.VALORPROVENTO, 0, 0)) AS D' +
        'ESCONTO,'
      '   SUM(DECODE(PVD.FLGDESCONTO, 0, HST.VALORPROVENTO, 0, 0)) - '
      
        '   SUM(DECODE(PVD.FLGDESCONTO, 1, HST.VALORPROVENTO, 0, 0)) AS L' +
        'IQUIDO'
      'FROM HISTRUBSAL HST, PROVDESC PVD '
      'WHERE HST.VALORPROVENTO > 0                AND '
      '      PVD.IDPROVENTO   = HST.IDRUBRICA     AND '
      '      HST.IDMODULO IN (16, 18)             AND'
      '      HST.MESCOBRANCA BETWEEN '#39'2002/01'#39' AND '#39'2002/05'#39' '
      'GROUP BY HST.MESCOBRANCA'
      'ORDER BY HST.MESCOBRANCA')
    ValidateWithMask = True
    Left = 56
    Top = 104
  end
  object dsSuplDesc: TwwDataSource
    DataSet = qrySuplDesc
    Left = 112
    Top = 104
  end
  object ppSuplDesc: TppBDEPipeline
    DataSource = dsSuplDesc
    UserName = 'SuplDesc'
    Left = 176
    Top = 104
  end
  object RpSuplDesc: TppReport
    AutoStop = False
    DataPipeline = ppSuplDesc
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
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
    DeviceType = 'Screen'
    Left = 248
    Top = 104
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 139965
      mmPrintPosition = 0
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
        mmTop = 22754
        mmWidth = 17198
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 529
        mmTop = 36777
        mmWidth = 283369
        BandType = 0
      end
      object ppLabel181: TppLabel
        UserName = 'Label181'
        AutoSize = False
        Caption = 
          'Demostrativo Mensal de Valores de Suplementação, Descontos e Líq' +
          'uido da Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 61383
        mmTop = 32015
        mmWidth = 182034
        BandType = 0
      end
      object ppDPTeeChart1: TppDPTeeChart
        UserName = 'DPTeeChart1'
        mmHeight = 92075
        mmLeft = 17727
        mmTop = 39688
        mmWidth = 256117
        BandType = 0
        object ppDPTeeChartControl1: TppDPTeeChartControl
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
            'Gráfico Suplementação, Desconto, Líquido X Mês'
            '')
          LeftAxis.AxisValuesFormat = 'R$ #,##0.##'
          Legend.Alignment = laBottom
          Legend.ColorWidth = 15
          Legend.TextStyle = ltsPlain
          BevelOuter = bvNone
          Color = clWhite
          object Series1: TBarSeries
            Tag = 3
            Marks.ArrowLength = 20
            Marks.Visible = False
            DataSource = ppSuplDesc
            SeriesColor = clBlue
            Title = 'Suplementação'
            XLabelsSource = 'MESCOBRANCA'
            BarWidthPercent = 33
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
          object Series3: TBarSeries
            Tag = 3
            Marks.ArrowLength = 20
            Marks.Visible = False
            DataSource = ppSuplDesc
            SeriesColor = clGreen
            Title = 'Líquido'
            BarWidthPercent = 33
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'LIQUIDO'
          end
          object Series2: TBarSeries
            Tag = 3
            Marks.ArrowLength = 20
            Marks.Visible = False
            DataSource = ppSuplDesc
            SeriesColor = clRed
            Title = 'Descontos'
            XLabelsSource = 'MESCOBRANCA'
            BarWidthPercent = 33
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'DESCONTO'
          end
        end
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Mês Cobrança'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 3175
        mmLeft = 85725
        mmTop = 136525
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Suplementação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 3175
        mmLeft = 119592
        mmTop = 136525
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 3175
        mmLeft = 166159
        mmTop = 136790
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Descontos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 3175
        mmLeft = 198967
        mmTop = 136790
        mmWidth = 14023
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MESCOBRANCA'
        DataPipeline = ppSuplDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 85196
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'SUPLEMENTACAO'
        DataPipeline = ppSuplDesc
        DisplayFormat = '#.##0,##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 114036
        mmTop = 0
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'LIQUIDO'
        DataPipeline = ppSuplDesc
        DisplayFormat = '#.##0,##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 149225
        mmTop = 0
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DESCONTO'
        DataPipeline = ppSuplDesc
        DisplayFormat = '#.##0,##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 187325
        mmTop = 0
        mmWidth = 28310
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
        mmLeft = 257705
        mmTop = 529
        mmWidth = 26194
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
        mmTop = 529
        mmWidth = 283635
        BandType = 8
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 265
        mmTop = 529
        mmWidth = 283635
        BandType = 8
      end
      object ppLabel100: TppLabel
        UserName = 'Label100'
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
        mmWidth = 283635
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'MESCOBRANCA'
      DataPipeline = ppSuplDesc
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
