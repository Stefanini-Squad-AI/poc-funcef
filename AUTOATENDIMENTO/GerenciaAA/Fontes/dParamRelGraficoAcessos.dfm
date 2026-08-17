inherited dtmParamRelGraficoAcessos: TdtmParamRelGraficoAcessos
  Height = 234
  Caption = 'dtmParamRelGraficoAcessos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 77
    Top = 152
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
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
    Left = 47
    Top = 152
  end
  inherited qryExemplo: TwwQuery
    Left = 18
    Top = 152
  end
  inherited rpExemplo: TppReport
    Left = 106
    Top = 152
    DataPipelineName = 'pplExemplo'
  end
  object ppReport: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 16
    Top = 8
    Version = '7.04'
    mmColumnWidth = 284300
    DataPipelineName = 'ppBDEPipeline'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 196321
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Gráfico de Acessos por Página'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 1588
        mmTop = 22225
        mmWidth = 279665
        BandType = 0
      end
      object tcBarras: TppDPTeeChart
        UserName = 'tcBarras'
        mmHeight = 139171
        mmLeft = 6879
        mmTop = 41275
        mmWidth = 274373
        BandType = 0
        object ppDPTeeChartControl1: TppDPTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          MarginBottom = 1
          MarginLeft = 1
          MarginRight = 1
          MarginTop = 1
          Title.Text.Strings = (
            '')
          BottomAxis.Grid.Color = clSilver
          LeftAxis.ExactDateTime = False
          LeftAxis.Grid.Color = clSilver
          LeftAxis.MinorGrid.Color = clGray
          Legend.Visible = False
          RightAxis.Grid.Color = clSilver
          TopAxis.Grid.Color = clSilver
          BevelOuter = bvNone
          Color = clWhite
          object Series1: THorizBarSeries
            Tag = 3
            ColorEachPoint = True
            Marks.ArrowLength = 20
            Marks.Frame.Color = clGray
            Marks.Style = smsValue
            Marks.Visible = True
            DataSource = ppBDEPipeline
            PercentFormat = '##0.0 %'
            SeriesColor = clRed
            ShowInLegend = False
            Title = 'SeriesBarra'
            ValueFormat = '0'
            XLabelsSource = 'DESCPAGINA'
            BarStyle = bsRectGradient
            XValues.DateTime = False
            XValues.Name = 'Bar'
            XValues.Multiplier = 1
            XValues.Order = loNone
            XValues.ValueSource = 'QTDEACESSOS'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loNone
          end
        end
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppBDEPipelineFund
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppBDEPipelineFund'
        mmHeight = 17727
        mmLeft = 2117
        mmTop = 1058
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppBDEPipelineFund
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEPipelineFund'
        mmHeight = 5821
        mmLeft = 25929
        mmTop = 3969
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppBDEPipelineFund
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEPipelineFund'
        mmHeight = 4233
        mmLeft = 25929
        mmTop = 10848
        mmWidth = 25400
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 2646
        mmLeft = 5556
        mmTop = 188384
        mmWidth = 275432
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Gerência do Auto-Atendimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5821
        mmTop = 189442
        mmWidth = 275167
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 254265
        mmTop = 189442
        mmWidth = 26194
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 1588
        mmTop = 28840
        mmWidth = 279665
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 30956
        mmWidth = 12965
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = 'lblPeriodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 16933
        mmTop = 31222
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Interface:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 103452
        mmTop = 30955
        mmWidth = 14288
        BandType = 0
      end
      object lblInterface: TppLabel
        UserName = 'lblPeriodo1'
        Caption = 'lblInterface'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 119856
        mmTop = 31222
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Usuário:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 199761
        mmTop = 30955
        mmWidth = 12435
        BandType = 0
      end
      object lblUsuario: TppLabel
        UserName = 'lblUsuario'
        Caption = 'lblUsuario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 214048
        mmTop = 31222
        mmWidth = 12435
        BandType = 0
      end
      object lblMesmaSessao: TppLabel
        UserName = 'lblUsuario1'
        Caption = '* Considerando páginas acessadas na mesma sessão várias vezes.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 178065
        mmTop = 182298
        mmWidth = 102923
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Total de Acessos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5821
        mmTop = 182298
        mmWidth = 27252
        BandType = 0
      end
      object lblTotal: TppLabel
        UserName = 'lblTotal'
        Caption = '123456'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 34131
        mmTop = 182563
        mmWidth = 9525
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object ppBDEPipeline: TppBDEPipeline
    DataSource = ds
    UserName = 'BDEPipeline'
    Left = 96
    Top = 8
    object ppBDEPipelineppField1: TppField
      FieldAlias = 'DESCPAGINA'
      FieldName = 'DESCPAGINA'
      FieldLength = 100
      DisplayWidth = 100
      Position = 0
    end
    object ppBDEPipelineppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEACESSOS'
      FieldName = 'QTDEACESSOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
  end
  object cds: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 8
    Data = {
      010100009619E0BD01000000180000000200050000000300000072000A444553
      43504147494E4101004900000001000557494454480200020064000B51544445
      41434553534F53080004000000000002000D44454641554C545F4F5244455202
      008200010000000200044C434944040001000908000000001054656D706F2064
      65205365727669E76F000000000000F03F00000E506172616D657472697A61E7
      E36F000000000000004000000850617263656C61730000000000000040000017
      496E73637269E7E36F20656D20456D7072E97374696D6F000000000000084000
      001B53656C65E7E36F206465205469706F20646520436F6E747261746F000000
      0000001C40}
    object cdsDESCPAGINA: TStringField
      DisplayLabel = 'Página'
      FieldName = 'DESCPAGINA'
      Size = 100
    end
    object cdsQTDEACESSOS: TFloatField
      DisplayLabel = 'Qtde. Acessos'
      FieldName = 'QTDEACESSOS'
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 224
    Top = 8
  end
  object cdsFundacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 80
    object cdsFundacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsFundacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object cdsFundacaoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object cdsFundacaoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object cdsFundacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object cdsFundacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object cdsFundacaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsFundacaoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object cdsFundacaoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdsFundacaoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
  end
  object ppBDEPipelineFund: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'BDEPipelineFund'
    Left = 160
    Top = 80
    object ppBDEPipelineFundppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineFundppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineFundppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineFundppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineFundppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineFundppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineFundppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineFundppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineFundppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineFundppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsFundacao: TDataSource
    DataSet = cdsFundacao
    Left = 96
    Top = 80
  end
end
