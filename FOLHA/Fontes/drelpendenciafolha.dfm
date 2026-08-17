inherited DtmRelPendencia: TDtmRelPendencia
  Left = 397
  Top = 88
  Width = 276
  Height = 246
  Caption = 'DtmRelPendencia'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 25
    Top = 71
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
    Left = 25
    Top = 119
  end
  inherited qryExemplo: TwwQuery
    Left = 25
    Top = 162
  end
  inherited rpExemplo: TppReport
    Left = 25
    Top = 11
  end
  object qryRelPendencia: TwwQuery
    BeforeOpen = qryRelPendenciaBeforeOpen
    AfterOpen = qryRelPendenciaAfterOpen
    AfterClose = qryRelPendenciaAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '0  AS IDHSTFOLHABENEF,'
      #39' '#39' AS HISTORICO,'
      ' '#39' '#39' AS MATRICULA,'
      ' '#39' '#39' AS RECEBEDOR,'
      ' '#39' '#39' AS MESANOREF,'
      '0 AS IDRUBRICA,'
      #39' '#39' AS DESCRUBRICA,'
      ' 0 AS VALORPROVENTO,'
      ' 0 AS VALORRECEBIDO,'
      '0 AS DIFERENCA'
      'FROM DUAL'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 115
    Top = 162
  end
  object rpRelPendencia: TppReport
    AutoStop = False
    DataPipeline = plRelPendencia
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Rubricas de desconto pendentes de processamento'
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
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpRelPendenciaBeforePrint
    DeviceType = 'Screen'
    Left = 115
    Top = 11
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand27: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36777
      mmPrintPosition = 0
      object ppLabelTitulo: TppLabel
        UserName = 'LabelTitulo'
        Caption = 'RUBRICAS DE DESCONTO PENDENTES DE PROCESSAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 39158
        mmTop = 29898
        mmWidth = 108215
        BandType = 0
      end
      object ppDbTextEmpresa: TppDBText
        UserName = 'DbTextEmpresa'
        DataField = 'NOME'
        DataPipeline = ppFundacao
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
      object ppDbTextCep: TppDBText
        UserName = 'DbTextCep'
        DataField = 'CEP'
        DataPipeline = ppFundacao
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
      object ppDbTextRSocial: TppDBText
        UserName = 'DbTextRSocial'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
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
      object ppDbImageEmpresa: TppDBImage
        UserName = 'DbImageEmpresa'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDbTextEndereco: TppDBText
        UserName = 'DbTextEndereco'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppFundacao
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
      object ppDbTextBairro: TppDBText
        UserName = 'DbTextBairro'
        AutoSize = True
        DataField = 'BARCIDUF'
        DataPipeline = ppFundacao
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
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27781
        mmWidth = 284300
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 35719
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand28: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDbTextMatricula: TppDBText
        UserName = 'DbTextMatricula'
        DataField = 'MATRICULA'
        DataPipeline = plRelPendencia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 794
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
      object ppDbTextRecebedor: TppDBText
        UserName = 'DbTextRecebedor'
        DataField = 'RECEBEDOR'
        DataPipeline = plRelPendencia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 19844
        mmTop = 265
        mmWidth = 74877
        BandType = 4
      end
      object ppDbTextMesRef: TppDBText
        UserName = 'DbTextMesRef'
        DataField = 'MESANOREF'
        DataPipeline = plRelPendencia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 179388
        mmTop = 265
        mmWidth = 14552
        BandType = 4
      end
      object ppDbTextValorProvento: TppDBText
        UserName = 'DbTextValorProvento'
        DataField = 'VALORPROVENTO'
        DataPipeline = plRelPendencia
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3970
        mmLeft = 194734
        mmTop = 265
        mmWidth = 26458
        BandType = 4
      end
      object ppDbTextValorRecebido: TppDBText
        UserName = 'DbTextValorRecebido'
        DataField = 'VALORRECEBIDO'
        DataPipeline = plRelPendencia
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3970
        mmLeft = 221986
        mmTop = 265
        mmWidth = 26458
        BandType = 4
      end
      object ppDbTextRubrica: TppDBText
        UserName = 'DbTextRubrica'
        DataField = 'IDRUBRICA'
        DataPipeline = plRelPendencia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 95515
        mmTop = 265
        mmWidth = 12172
        BandType = 4
      end
      object ppDBTextDescRubrica: TppDBText
        UserName = 'DbTextRecebedor1'
        DataField = 'DESCRUBRICA'
        DataPipeline = plRelPendencia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 108479
        mmTop = 265
        mmWidth = 68263
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DbTextValorRecebido1'
        DataField = 'DIFERENCA'
        DataPipeline = plRelPendencia
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3970
        mmLeft = 249503
        mmTop = 265
        mmWidth = 26458
        BandType = 4
      end
    end
    object ppFooterBand27: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLine62: TppLine
        UserName = 'ppLine62'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabelNomeSistema: TppLabel
        UserName = 'LabelNomeSistema'
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
        mmTop = 2910
        mmWidth = 280194
        BandType = 8
      end
      object ppCalcPagina: TppSystemVariable
        UserName = 'CalcPagina'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130969
        mmTop = 2910
        mmWidth = 18785
        BandType = 8
      end
      object ppCalc24: TppSystemVariable
        UserName = 'Calc24'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 246857
        mmTop = 2910
        mmWidth = 30692
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDHSTFOLHABENEF'
      DataPipeline = plRelPendencia
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppLabelMatricula: TppLabel
          UserName = 'LabelMatricula'
          AutoSize = False
          Caption = 'Matricula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 794
          mmTop = 7144
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppLabelRecebedor: TppLabel
          UserName = 'LabelRecebedor'
          AutoSize = False
          Caption = 'Nome do Recebedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 19844
          mmTop = 7144
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object ppLabelMesRef: TppLabel
          UserName = 'LabelMesRef'
          AutoSize = False
          Caption = 'Mês Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 179388
          mmTop = 7408
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppLabelValorProvento: TppLabel
          UserName = 'LabelValorProvento'
          AutoSize = False
          Caption = 'Valor Processado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 194998
          mmTop = 7408
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLabelValorRecebido: TppLabel
          UserName = 'LabelValorRecebido'
          AutoSize = False
          Caption = 'Valor Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 222250
          mmTop = 7408
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
        end
        object ppLabelVersao: TppLabel
          UserName = 'LabelVersao'
          AutoSize = False
          Caption = 'Versão: '
          Color = clScrollBar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3175
          mmLeft = 794
          mmTop = 1588
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppDBTextVersao: TppDBText
          UserName = 'DBTextVersao'
          AutoSize = True
          Color = clScrollBar
          DataField = 'HISTORICO'
          DataPipeline = plRelPendencia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3175
          mmLeft = 13494
          mmTop = 1588
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppLabelRubrica: TppLabel
          UserName = 'LabelRubrica'
          AutoSize = False
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 95515
          mmTop = 7408
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabelDescRubrica: TppLabel
          UserName = 'LabelRecebedor1'
          AutoSize = False
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 108479
          mmTop = 7408
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'LabelValorRecebido1'
          AutoSize = False
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 249503
          mmTop = 7408
          mmWidth = 26459
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Quantidade: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 3969
          mmTop = 2646
          mmWidth = 17992
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalcQuant: TppDBCalc
          UserName = 'DBCalcQuant'
          DataField = 'IDRUBRICA'
          DataPipeline = plRelPendencia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3175
          mmLeft = 22754
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALORPROVENTO'
          DataPipeline = plRelPendencia
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 194734
          mmTop = 5027
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VALORRECEBIDO'
          DataPipeline = plRelPendencia
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 221986
          mmTop = 5027
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'DIFERENCA'
          DataPipeline = plRelPendencia
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 249238
          mmTop = 5027
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'LabelValorProvento1'
          AutoSize = False
          Caption = 'Total Processado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 194734
          mmTop = 1058
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Total Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 221986
          mmTop = 1058
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Total Diferenca'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 249238
          mmTop = 1058
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object plRelPendencia: TppBDEPipeline
    DataSource = dsRelPendencia
    SkipWhenNoRecords = False
    UserName = 'plRelPendencia'
    Left = 115
    Top = 71
    object plRelPendenciappField1: TppField
      FieldAlias = 'IDHSTFOLHABENEF'
      FieldName = 'IDHSTFOLHABENEF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object plRelPendenciappField2: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object plRelPendenciappField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object plRelPendenciappField4: TppField
      FieldAlias = 'RECEBEDOR'
      FieldName = 'RECEBEDOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object plRelPendenciappField5: TppField
      FieldAlias = 'MESANOREF'
      FieldName = 'MESANOREF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object plRelPendenciappField6: TppField
      FieldAlias = 'IDRUBRICA'
      FieldName = 'IDRUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object plRelPendenciappField7: TppField
      FieldAlias = 'DESCRUBRICA'
      FieldName = 'DESCRUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object plRelPendenciappField8: TppField
      FieldAlias = 'VALORPROVENTO'
      FieldName = 'VALORPROVENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object plRelPendenciappField9: TppField
      FieldAlias = 'VALORRECEBIDO'
      FieldName = 'VALORRECEBIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object plRelPendenciappField10: TppField
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsRelPendencia: TwwDataSource
    DataSet = qryRelPendencia
    Left = 115
    Top = 119
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME          , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO        , E.COMPLEMENTO, E.BAIRRO    ,'
      '       C.NOME AS CIDADE, C.CODESTADO  , E.CEP       , I.IMAGEM, '
      '       (E.LOGRADOURO||'#39', '#39'||E.NUMERO) AS ENDERECO   ,'
      '       (E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO) AS BARCIDUF'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 207
    Top = 162
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 2002
      end>
    object qryFundacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryFundacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryFundacaoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryFundacaoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryFundacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryFundacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryFundacaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryFundacaoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryFundacaoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryFundacaoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryFundacaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 70
    end
    object qryFundacaoBARCIDUF: TStringField
      FieldName = 'BARCIDUF'
      Size = 79
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 207
    Top = 119
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 207
    Top = 71
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField11: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField12: TppField
      FieldAlias = 'BARCIDUF'
      FieldName = 'BARCIDUF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
end
