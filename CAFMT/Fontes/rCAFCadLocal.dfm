inherited RptCAFCadLocal: TRptCAFCadLocal
  Left = 309
  Top = 224
  Width = 305
  Height = 149
  Caption = 'RptCAFCadLocal'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Cadastro de Localizações'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Centro de Custo'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CODCENTROCUSTO,NOME'
          'FROM CENTCUST'
          'WHERE (STATUSGRUPOCDC = '#39'A'#39')'
          'AND (ATIVO = '#39'S'#39')'
          'ORDER BY NOME')
        LookupSettings.Chave = 'CODCENTROCUSTO'
        LookupSettings.Display = 'NOME|CODCENTROCUSTO'
        LookupSettings.Descricao = 'Centro de Custo'
        LookupSettings.Tamanho = '40|10'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end
      item
        Caption = 'Tipos de Área'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDTIPOAREA,DESCTIPOAREA'
          'FROM TIPOAREA'
          'ORDER BY DESCTIPOAREA')
        LookupSettings.Chave = 'IDTIPOAREA'
        LookupSettings.Display = 'DESCTIPOAREA'
        LookupSettings.Descricao = 'Tipo de Área'
        LookupSettings.Tamanho = '50'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end
      item
        Caption = 'Endereço'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end>
    Formheight = 150
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 152
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    DataBaseName = 'BaseDados'
    Report = rpCadLocal
    Left = 88
  end
  object qryCadLocal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT L.NOME AS DESCLOCAL,'
      '       L.CODCENTROCUSTO,'
      '       L.ENDERECO,       '
      '       CC.NOME AS DESCCCUSTO,'
      '       PR.NOME AS NOMERESP,'
      '       TA.DESCTIPOAREA'
      'FROM   LOCALIZACAO L,'
      '       CENTCUST    CC,'
      '       PESSOA      PR,'
      '       TIPOAREA    TA'
      'WHERE (L.IDRESPONSAVEL  = PR.IDPESSOA(+))'
      ''
      ''
      ''
      '  AND (L.IDEMPRESA      = CC.IDEMPRESA(+))'
      '  AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (L.IDTIPOAREA     = TA.IDTIPOAREA(+))'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 24
    Top = 64
    object qryCadLocalDESCLOCAL: TStringField
      FieldName = 'DESCLOCAL'
      Size = 60
    end
    object qryCadLocalCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryCadLocalENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 120
    end
    object qryCadLocalDESCCCUSTO: TStringField
      FieldName = 'DESCCCUSTO'
      Size = 30
    end
    object qryCadLocalNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object qryCadLocalDESCTIPOAREA: TStringField
      FieldName = 'DESCTIPOAREA'
      Size = 30
    end
  end
  object dsCadLocal: TwwDataSource
    DataSet = qryCadLocal
    Left = 96
    Top = 64
  end
  object ppCadLocal: TppBDEPipeline
    DataSource = dsCadLocal
    UserName = 'CadLocal'
    Left = 168
    Top = 64
  end
  object rpCadLocal: TppReport
    AutoStop = False
    DataPipeline = ppCadLocal
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
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 240
    Top = 64
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29369
      mmPrintPosition = 0
      object ppLabel91: TppLabel
        UserName = 'ppLabel91'
        Caption = 'Cadastro de Localizações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 115888
        mmTop = 8731
        mmWidth = 52388
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'ppLine24'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284427
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'ppLabel92'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127265
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object rpCadLocalLabel1: TppLabel
        UserName = 'rpCadLocalLabel1'
        Caption = 'Localização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 19844
        mmWidth = 16669
        BandType = 0
      end
      object rpCadLocalLabel2: TppLabel
        UserName = 'rpCadLocalLabel2'
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 82286
        mmTop = 19844
        mmWidth = 18785
        BandType = 0
      end
      object rpCadLocalLabel3: TppLabel
        UserName = 'rpCadLocalLabel3'
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 185209
        mmTop = 19844
        mmWidth = 24077
        BandType = 0
      end
      object rpCadLocalLabel5: TppLabel
        UserName = 'rpCadLocalLabel5'
        Caption = 'Tipo de Área'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 51594
        mmTop = 19844
        mmWidth = 18521
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'ppLine25'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 28310
        mmWidth = 284427
        BandType = 0
      end
      object rpCadLocalLabel6: TppLabel
        UserName = 'rpCadLocalLabel6'
        Caption = 'Endereço'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 24077
        mmWidth = 13758
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object rpCadLocalDBText1: TppDBText
        UserName = 'rpCadLocalDBText1'
        DataField = 'DESCLOCAL'
        DataPipeline = ppCadLocal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 50271
        BandType = 4
      end
      object rpCadLocalDBText2: TppDBText
        UserName = 'rpCadLocalDBText2'
        DataField = 'NOMERESP'
        DataPipeline = ppCadLocal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 82021
        mmTop = 529
        mmWidth = 102129
        BandType = 4
      end
      object rpCadLocalDBText3: TppDBText
        UserName = 'rpCadLocalDBText3'
        DataField = 'CODCENTROCUSTO'
        DataPipeline = ppCadLocal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 185209
        mmTop = 529
        mmWidth = 24077
        BandType = 4
      end
      object rpCadLocalDBText4: TppDBText
        UserName = 'rpCadLocalDBText4'
        DataField = 'DESCCCUSTO'
        DataPipeline = ppCadLocal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 210344
        mmTop = 529
        mmWidth = 73819
        BandType = 4
      end
      object rpCadLocalDBText5: TppDBText
        UserName = 'rpCadLocalDBText5'
        DataField = 'DESCTIPOAREA'
        DataPipeline = ppCadLocal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 51594
        mmTop = 529
        mmWidth = 29633
        BandType = 4
      end
      object rpCadLocalDBText6: TppDBText
        UserName = 'rpCadLocalDBText6'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppCadLocal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 5027
        mmWidth = 15610
        BandType = 4
      end
      object rpCadLocalLine1: TppLine
        UserName = 'rpCadLocalLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 9525
        mmWidth = 284427
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine26: TppLine
        UserName = 'ppLine26'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284427
        BandType = 8
      end
      object ppLabel96: TppLabel
        UserName = 'ppLabel96'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1323
        mmWidth = 35983
        BandType = 8
      end
      object ppCalc27: TppSystemVariable
        UserName = 'Calc27'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 114829
        mmTop = 1323
        mmWidth = 54504
        BandType = 8
      end
      object ppCalc28: TppSystemVariable
        UserName = 'Calc28'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258234
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
  end
end
