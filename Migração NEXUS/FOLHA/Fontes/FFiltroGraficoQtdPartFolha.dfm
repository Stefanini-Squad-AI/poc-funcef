inherited FrmFiltroGraficoQtdPartFolha: TFrmFiltroGraficoQtdPartFolha
  Left = 162
  Top = 156
  HelpContext = 180047
  Caption = 
    'Filtro do Gráfico Estatístico de Participantes por Versão de Fol' +
    'ha'
  ClientHeight = 227
  ClientWidth = 537
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 537
    Height = 188
    inherited dblkPatroFolhaBenef: TwwDBLookupCombo
      OnChange = dblkPatroFolhaBenefChange
    end
  end
  inherited Dock971: TDock97
    Top = 188
    Width = 537
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 6
    Top = 6
  end
  inherited qryHistorico: TwwQuery
    Active = False
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HISTORICO,'
      '  MESREFERENCIA'
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'WHERE'
      '  FLGESTADO <> 2'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC'
      ' '
      ' ')
  end
  inherited qryPatroFolhaBenef: TwwQuery
    Left = 424
    Top = 120
  end
  object ppBDERelaQtdPartFolha: TppBDEPipeline
    DataSource = DSRelaQtdPartFolha
    UserName = 'BDERelaQtdPartFolha'
    Left = 147
    Top = 146
    object ppBDERelaQtdPartFolhappField1: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDERelaQtdPartFolhappField2: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppBDERelaQtdPartFolhappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTD'
      FieldName = 'QTD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
  end
  object ppRGraficoEstatPartFolha: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    Left = 113
    Top = 146
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand26: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 43392
      mmPrintPosition = 0
      object ppLabel103: TppLabel
        UserName = 'Label103'
        Caption = 'Gráfico Estatístico de Participantes Por Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 59267
        mmTop = 37571
        mmWidth = 92604
        BandType = 0
      end
      object ppLine65: TppLine
        UserName = 'Line65'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 529
        mmTop = 42863
        mmWidth = 196321
        BandType = 0
      end
      object ppDBImage10: TppDBImage
        UserName = 'DBImage10'
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
      object ppDBText48: TppDBText
        UserName = 'DBText48'
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
      object ppDBText49: TppDBText
        UserName = 'DBText49'
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
      object ppDBText50: TppDBText
        UserName = 'DBText50'
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
      object ppDBText51: TppDBText
        UserName = 'DBText51'
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
      object ppDBText52: TppDBText
        UserName = 'DBText52'
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
    end
    object ppDetailBand27: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 115359
      mmPrintPosition = 0
      object ppDPTeeChart1: TppDPTeeChart
        UserName = 'DPTeeChart1'
        mmHeight = 81492
        mmLeft = 7408
        mmTop = 32015
        mmWidth = 187061
        BandType = 4
        object ppDPTeeChartControl1: TppDPTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          Title.Text.Strings = (
            '')
          Legend.Alignment = laBottom
          BevelOuter = bvNone
          Color = clWhite
          object Series1: TBarSeries
            Tag = 3
            ColorEachPoint = True
            Marks.ArrowLength = 20
            Marks.Style = smsPercent
            Marks.Visible = True
            DataSource = ppBDERelaQtdPartFolha
            SeriesColor = clRed
            XLabelsSource = 'PLANO'
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'QTD'
          end
        end
      end
      object ppLabel102: TppLabel
        UserName = 'Label102'
        Caption = 'Patrocinadora: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 12435
        mmTop = 22225
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'PATRO'
        DataPipeline = ppBDERelaQtdPartFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 38894
        mmTop = 22225
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'HISTORICO'
        DataPipeline = ppVerFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 42333
        mmTop = 15081
        mmWidth = 19844
        BandType = 4
      end
      object ppLabel101: TppLabel
        UserName = 'Label101'
        Caption = 'Versão da Folha: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 12436
        mmTop = 15081
        mmWidth = 29633
        BandType = 4
      end
    end
    object ppFooterBand26: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLine72: TppLine
        UserName = 'Line72'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel104: TppLabel
        UserName = 'Label1001'
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
        mmTop = 1058
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
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
        mmTop = 1058
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
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
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryRelaQtdPartFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' PT.NOME PATRO,'
      ' PL.NOME PLANO,'
      ' COUNT(H.IDRUBRICA) QTD'
      'FROM HISTRUBSAL H,'
      '     PESSOA PT,'
      '     PLANPREV PL'
      'WHERE PL.IDPLANOPREV = H.IDPLANOPREV AND'
      '      PT.IDPESSOA = H.IDPESSJUR'
      '      and 1=2'
      'GROUP BY PT.NOME, PL.NOME'
      'ORDER BY PT.NOME, PL.NOME')
    ValidateWithMask = True
    Left = 219
    Top = 146
    object qryRelaQtdPartFolhaPATRO: TStringField
      FieldName = 'PATRO'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryRelaQtdPartFolhaPLANO: TStringField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
    object qryRelaQtdPartFolhaQTD: TFloatField
      FieldName = 'QTD'
      Origin = 'BASEDADOS.HISTRUBSAL.IDRUBRICA'
    end
  end
  object DSRelaQtdPartFolha: TwwDataSource
    DataSet = qryRelaQtdPartFolha
    Left = 179
    Top = 146
  end
  object qryVerFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      '  historico'
      'from hstFolhaBenef'
      'where idhstFolhaBenef = :idHstFolhaBenef'
      'order by historico')
    ValidateWithMask = True
    Left = 17
    Top = 130
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idHstFolhaBenef'
        ParamType = ptInput
      end>
  end
  object DSVerFolha: TwwDataSource
    DataSet = qryVerFolha
    Left = 49
    Top = 82
  end
  object ppVerFolha: TppBDEPipeline
    DataSource = DSVerFolha
    UserName = 'VerFolha'
    Left = 17
    Top = 154
    object ppVerFolhappField1: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
  end
end
