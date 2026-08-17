inherited RptArtxConta: TRptArtxConta
  Width = 263
  Height = 152
  Caption = 'Artigos x Contas Contábeis'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Artigos x Contas Contábeis'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Grupo de Produtos'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CODGRUPOPROD, DESCGRUPOPROD'
          'FROM GRUPPROD'
          'ORDER BY 2')
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
      end>
    Formheight = 120
    FormWidth = 480
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptArtxConta
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
    Left = 84
  end
  object dsArtxConta: TwwDataSource
    DataSet = CdsArtxConta
    Left = 140
    Top = 64
  end
  object bdeArtxConta: TppBDEPipeline
    DataSource = dsArtxConta
    UserName = 'bdeArtxConta'
    Left = 84
    Top = 64
  end
  object RptArtxConta: TppReport
    AutoStop = False
    DataPipeline = bdeArtxConta
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    DeviceType = 'Screen'
    Left = 24
    Top = 64
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object ppLabel68: TppLabel
        UserName = 'ppLabel68'
        Caption = 'ARTIGOS X  CONTAS CONTÁBEIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 107421
        mmTop = 8731
        mmWidth = 69321
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LBEMPRESA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 126736
        mmTop = 1588
        mmWidth = 30956
        BandType = 0
      end
      object RptArtxContaLabel1: TppLabel
        UserName = 'RptArtxContaLabel1'
        Caption = 'Conta de Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3440
        mmLeft = 85725
        mmTop = 17463
        mmWidth = 25400
        BandType = 0
      end
      object RptArtxContaLabel2: TppLabel
        UserName = 'RptArtxContaLabel2'
        Caption = 'Conta de Saída'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3440
        mmLeft = 157427
        mmTop = 17463
        mmWidth = 22225
        BandType = 0
      end
      object RptArtxContaLabel3: TppLabel
        UserName = 'RptArtxContaLabel3'
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3440
        mmLeft = 227013
        mmTop = 17463
        mmWidth = 23019
        BandType = 0
      end
      object RptArtxContaLabel4: TppLabel
        UserName = 'RptArtxContaLabel4'
        Caption = 'Artigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 17463
        mmWidth = 9260
        BandType = 0
      end
      object RptArtxContaLabel5: TppLabel
        UserName = 'RptArtxContaLabel5'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3440
        mmLeft = 20373
        mmTop = 17463
        mmWidth = 14288
        BandType = 0
      end
      object RptArtxContaLine3: TppLine
        UserName = 'RptArtxContaLine3'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15081
        mmWidth = 284300
        BandType = 0
      end
    end
    object DetArtxConta: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object RptArtxContaDBText4: TppDBText
        UserName = 'RptArtxContaDBText4'
        DataField = 'CONTAENTRADA'
        DataPipeline = bdeArtxConta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 265
        mmWidth = 67998
        BandType = 4
      end
      object RptArtxContaDBText5: TppDBText
        UserName = 'RptArtxContaDBText5'
        DataField = 'CONTASAIDA'
        DataPipeline = bdeArtxConta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 157427
        mmTop = 265
        mmWidth = 67998
        BandType = 4
      end
      object RptArtxContaDBText6: TppDBText
        UserName = 'RptArtxContaDBText6'
        DataField = 'CENTCUST'
        DataPipeline = bdeArtxConta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 227013
        mmTop = 265
        mmWidth = 52917
        BandType = 4
      end
      object RptArtxContaDBText3: TppDBText
        UserName = 'RptArtxContaDBText3'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = bdeArtxConta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 20373
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
      object RptArtxContaDBText2: TppDBText
        UserName = 'RptArtxContaDBText2'
        AutoSize = True
        DataField = 'CODARTIGO'
        DataPipeline = bdeArtxConta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine28: TppLine
        UserName = 'ppLine28'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 529
        mmTop = 529
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc26: TppSystemVariable
        UserName = 'Calc26'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 113771
        mmTop = 529
        mmWidth = 56621
        BandType = 8
      end
      object ppCalc27: TppSystemVariable
        UserName = 'Calc27'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 241830
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptArtxContaGroup1: TppGroup
      BreakName = 'CODGRUPOPROD'
      DataPipeline = bdeArtxConta
      UserName = 'RptArtxContaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object CabecGrpArtxConta: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object RptArtxContaLine2: TppLine
          UserName = 'RptArtxContaLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6615
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object RptArtxContaDBText1: TppDBText
          UserName = 'RptArtxContaDBText1'
          DataField = 'DESCGRUPO'
          DataPipeline = bdeArtxConta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 2117
          mmWidth = 66675
          BandType = 3
          GroupNo = 0
        end
        object RptArtxContaLine1: TppLine
          UserName = 'RptArtxContaLine1'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object RptArtxContaGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object SqlArtxConta: TCMSqlParams
    ClientDataSet = CdsArtxConta
    Left = 192
    Top = 8
  end
  object CdsArtxConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 64
  end
end
