inherited RptEtqProduto: TRptEtqProduto
  Width = 276
  Height = 146
  Caption = 'Etiqueta dos Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Etiqueta dos Produtos'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Almoxarifado'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CODALMOXARIFADO, DESCALMOX'
          'FROM ALMOX'
          'WHERE IDPESSOA = 1'
          'ORDER BY DESCALMOX ')
        LookupSettings.Chave = 'CODALMOXARIFADO'
        LookupSettings.Display = 'DESCALMOX'
        LookupSettings.Descricao = 'Almoxarifado'
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = True
        Name = 'Almoxarifado'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end
      item
        Caption = 'Item (Opcional)'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          
            ' SELECT (P.DESCPROD || '#39' '#39' || T.DESCTAMANHO || '#39' '#39' || C.DESCCOR)' +
            ' AS DESCRICAO,'
          '       A.CODARTIGO '
          'FROM ARTIGO A, TAMANHO T, PRODUTO P, COR C'
          'WHERE P.CODPRODUTO = A.CODPRODUTO '
          'AND A.CODCOR = C.CODCOR(+) '
          'AND A.CODTAMANHO = T.CODTAMANHO(+) '
          'Order By DESCRICAO')
        LookupSettings.Chave = 'CODARTIGO'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Item'
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        Name = 'Item'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end
      item
        Caption = 'Grupo de Produtos (opcional)'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DESCGRUPOPROD, CODGRUPOPROD'
          'FROM GRUPPROD'
          'WHERE STATUSGRUPO = '#39'A'#39
          'ORDER BY DESCGRUPOPROD')
        LookupSettings.Chave = 'CODGRUPOPROD'
        LookupSettings.Display = 'DESCGRUPOPROD'
        LookupSettings.Descricao = 'Grupo de Produtos'
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        Name = 'Grupo'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end
      item
        Caption = 'Ordenação'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Alfabética'
          'Código')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 50
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        Name = 'Ordem'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end>
    Formheight = 208
    FormWidth = 480
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptEtqProduto
    Left = 84
  end
  object bdeEtqProduto: TppBDEPipeline
    DataSource = dsEtqProduto
    UserName = 'lExemplo1'
    Left = 84
    Top = 60
    object bdeEtqProdutoppField1: TppField
      FieldAlias = 'CODARTIGO'
      FieldName = 'CODARTIGO'
      FieldLength = 14
      DisplayWidth = 14
      Position = 0
    end
    object bdeEtqProdutoppField2: TppField
      FieldAlias = 'CODGRUPOPROD'
      FieldName = 'CODGRUPOPROD'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object bdeEtqProdutoppField3: TppField
      FieldAlias = 'CODMEDCUSTO'
      FieldName = 'CODMEDCUSTO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 2
    end
    object bdeEtqProdutoppField4: TppField
      FieldAlias = 'DESCGRUPOPROD'
      FieldName = 'DESCGRUPOPROD'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object bdeEtqProdutoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'ESTMINUSADO'
      FieldName = 'ESTMINUSADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object bdeEtqProdutoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'ESTMAXIMO'
      FieldName = 'ESTMAXIMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object bdeEtqProdutoppField7: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
  end
  object dsEtqProduto: TwwDataSource
    DataSet = CdsEtqProduto
    Left = 140
    Top = 60
  end
  object RptEtqProduto: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '6350'
      '105001')
    DataPipeline = bdeEtqProduto
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 20
    Top = 60
    Version = '5.5'
    mmColumnWidth = 98650
    object ppColumnHeaderBand1: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand31: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppDBText97: TppDBText
        UserName = 'DBText97'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = bdeEtqProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 17727
        mmTop = 5292
        mmWidth = 16669
        BandType = 4
      end
      object ppLabel227: TppLabel
        UserName = 'Label227'
        AutoSize = False
        Caption = 'Descrição:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 5292
        mmWidth = 15875
        BandType = 4
      end
      object ppLabel228: TppLabel
        UserName = 'Label228'
        AutoSize = False
        Caption = 'Código:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText98: TppDBText
        UserName = 'DBText98'
        DataField = 'CODARTIGO'
        DataPipeline = bdeEtqProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 1323
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel229: TppLabel
        UserName = 'Label229'
        AutoSize = False
        Caption = 'Grupo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 9790
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText99: TppDBText
        UserName = 'DBText99'
        DataField = 'CODGRUPOPROD'
        DataPipeline = bdeEtqProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 12965
        mmTop = 9790
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText100: TppDBText
        UserName = 'DBText100'
        AutoSize = True
        DataField = 'DESCGRUPOPROD'
        DataPipeline = bdeEtqProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 30956
        mmTop = 9790
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText101: TppDBText
        UserName = 'DBText101'
        DataField = 'CODMEDCUSTO'
        DataPipeline = bdeEtqProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 67998
        mmTop = 1588
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel230: TppLabel
        UserName = 'Label230'
        AutoSize = False
        Caption = 'Unidade de Medida:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 37042
        mmTop = 1323
        mmWidth = 29104
        BandType = 4
      end
      object ppLabel286: TppLabel
        UserName = 'Label286'
        AutoSize = False
        Caption = 'Estoque Mínimo : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 14288
        mmWidth = 26194
        BandType = 4
      end
      object ppLabel287: TppLabel
        UserName = 'Label287'
        AutoSize = False
        Caption = 'Estoque Máximo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 47625
        mmTop = 14288
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText141: TppDBText
        UserName = 'DBText141'
        DataField = 'ESTMINUSADO'
        DataPipeline = bdeEtqProduto
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 29369
        mmTop = 14288
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText142: TppDBText
        UserName = 'DBText142'
        DataField = 'ESTMAXIMO'
        DataPipeline = bdeEtqProduto
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 74083
        mmTop = 14288
        mmWidth = 21696
        BandType = 4
      end
    end
    object ppColumnFooterBand1: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object SqlEtqProduto: TCMSqlParams
    ClientDataSet = CdsEtqProduto
    Left = 196
    Top = 8
  end
  object CdsEtqProduto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 196
    Top = 60
  end
end
