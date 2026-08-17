inherited RptCAFBalPatGrp: TRptCAFBalPatGrp
  Left = 143
  Top = 133
  Width = 538
  Height = 356
  Caption = 'Balancete Patrimonial por Grupo Contábil'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Balancete Patrimonial por Grupo Contábil'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Periodo Atualizado até'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
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
        MostraComboCompara = True
        Required = True
        Name = 'Periodo Atualizado até'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
      end
      item
        Caption = 'Grupo Contábil'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CLASSE, NOME, IDGRUPO'
          'FROM GRUPO'
          'WHERE TIPO = '#39'A'#39
          'ORDER BY CLASSE')
        LookupSettings.Chave = 'IDGRUPO'
        LookupSettings.Display = 'NOME|CLASSE'
        LookupSettings.Descricao = 'Grupo Contábil|Código'
        LookupSettings.Tamanho = '40|8'
        CheckBoxSetings.ValueChecked = 'False'
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
        MostraComboCompara = True
        Required = False
        Name = 'Grupo Contábil'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
      end
      item
        Caption = 'Grupos Contábeis dos Bens'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Patrimoniais'
          'Investimentos Imobiliários'
          'Ambos')
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 65
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
        MostraComboCompara = True
        Required = False
        Name = 'Grupos Contábeis dos Bens'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
      end
      item
        Caption = 'Incluir Bens com Controle Físico'
        Controle = tcCheckBox
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
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
        MostraComboCompara = True
        Required = False
        Name = 'Incluir Bens com Controle Físico'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
      end
      item
        Caption = 'Exibe os Grupos sem Valor'
        Controle = tcCheckBox
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
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
        MostraComboCompara = True
        Required = False
        Name = 'Exibe os Grupos sem Valor'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
      end>
    Formheight = 242
    Left = 28
  end
  inherited DevRptCM: TExtraOptions
    Left = 96
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    ChangeConnectionType = CrmRptCMChangeConnectionType
    ChangeConnection = CrmRptCMChangeConnection
    DataBaseName = 'BaseDados'
    Report = rpBalPatGrp
    LabelEmpresa = ppLabel67
    LabelSistema = ppLabel68
    Left = 155
  end
  object qryBalPatGrp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPO,'
      '       CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS DEPMES,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM GRUPO'
      'WHERE (IDGRUPO IS NULL)'
      'ORDER BY CLASSE')
    ValidateWithMask = True
    Left = 392
    Top = 88
  end
  object dsBalPatGrp: TwwDataSource
    DataSet = cdsBalPatGrp
    Left = 432
    Top = 33
  end
  object ppBalPatGrp: TppBDEPipeline
    DataSource = dsBalPatGrp
    UserName = 'BalPatGrp'
    Left = 432
    Top = 20
    object ppBalPatGrpppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRUPO'
      FieldName = 'IDGRUPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppBalPatGrpppField2: TppField
      FieldAlias = 'CLASSE'
      FieldName = 'CLASSE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppBalPatGrpppField3: TppField
      FieldAlias = 'DESCGRUPO'
      FieldName = 'DESCGRUPO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppBalPatGrpppField4: TppField
      FieldAlias = 'S_A'
      FieldName = 'S_A'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object ppBalPatGrpppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORG'
      FieldName = 'VALORG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBalPatGrpppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMBEM'
      FieldName = 'CMBEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBalPatGrpppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPLANC'
      FieldName = 'DEPLANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppBalPatGrpppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMDEP'
      FieldName = 'CMDEP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppBalPatGrpppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCTB'
      FieldName = 'VALCTB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppBalPatGrpppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPMES'
      FieldName = 'DEPMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object rpBalPatGrp: TppReport
    AutoStop = False
    DataPipeline = ppBalPatGrp
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 16510
    PrinterSetup.mmMarginRight = 16510
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 432
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppLabel66: TppLabel
        UserName = 'ppLabel66'
        Caption = 'Balancete Patrimonial por Grupo Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 81492
        mmTop = 8731
        mmWidth = 101865
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'ppLine17'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29369
        mmWidth = 264107
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'ppLabel67'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 116946
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object rpBalPatGrpLabel1: TppLabel
        UserName = 'rpBalPatGrpLabel1'
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 24342
        mmWidth = 7938
        BandType = 0
      end
      object rpBalPatGrpLabel2: TppLabel
        UserName = 'rpBalPatGrpLabel2'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 24342
        mmWidth = 12965
        BandType = 0
      end
      object rpBalPatGrpLabel3: TppLabel
        UserName = 'rpBalPatGrpLabel3'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 93398
        mmTop = 24342
        mmWidth = 5292
        BandType = 0
      end
      object rpBalPatGrpLabel4: TppLabel
        UserName = 'rpBalPatGrpLabel4'
        Caption = 'Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 115888
        mmTop = 24342
        mmWidth = 12700
        BandType = 0
      end
      object rpBalPatGrpLabel5: TppLabel
        UserName = 'rpBalPatGrpLabel5'
        Caption = 'Corr. Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 138113
        mmTop = 24342
        mmWidth = 19579
        BandType = 0
      end
      object rpBalPatGrpLabel6: TppLabel
        UserName = 'rpBalPatGrpLabel6'
        Caption = 'Depreciação Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 24342
        mmWidth = 25135
        BandType = 0
      end
      object rpBalPatGrpLabel7: TppLabel
        UserName = 'rpBalPatGrpLabel7'
        Caption = 'C.M.Deprec.Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 213519
        mmTop = 24342
        mmWidth = 23813
        BandType = 0
      end
      object rpBalPatGrpLabel8: TppLabel
        UserName = 'rpBalPatGrpLabel8'
        Caption = 'Valor Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 243153
        mmTop = 24342
        mmWidth = 21167
        BandType = 0
      end
      object rpBalPatGrpLabel9: TppLabel
        UserName = 'rpBalPatGrpLabel9'
        Caption = 'Movimentação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 214842
        mmTop = 9525
        mmWidth = 28840
        BandType = 0
      end
      object rpBalPatGrpLabel10: TppLabel
        UserName = 'rpBalPatGrpLabel10'
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 243417
        mmTop = 9525
        mmWidth = 20108
        BandType = 0
      end
      object rpBalPatGrpLabel11: TppLabel
        UserName = 'rpBalPatGrpLabel11'
        Caption = 'Deprec.Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 191559
        mmTop = 24342
        mmWidth = 19579
        BandType = 0
      end
      object rpBalPatGrpLabel12: TppLabel
        UserName = 'rpBalPatGrpLabel12'
        Caption = 'Imobilizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 120386
        mmTop = 15875
        mmWidth = 23283
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object rpBalPatGrpDBText1: TppDBText
        UserName = 'rpBalPatGrpDBText1'
        DataField = 'CLASSE'
        DataPipeline = ppBalPatGrp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object rpBalPatGrpDBText2: TppDBText
        UserName = 'rpBalPatGrpDBText2'
        DataField = 'DESCGRUPO'
        DataPipeline = ppBalPatGrp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 25135
        mmTop = 529
        mmWidth = 66675
        BandType = 4
      end
      object rpBalPatGrpDBText4: TppDBText
        UserName = 'rpBalPatGrpDBText4'
        BlankWhenZero = True
        DataField = 'VALORG'
        DataPipeline = ppBalPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 100277
        mmTop = 529
        mmWidth = 28310
        BandType = 4
      end
      object rpBalPatGrpDBText5: TppDBText
        UserName = 'rpBalPatGrpDBText5'
        BlankWhenZero = True
        DataField = 'CMBEM'
        DataPipeline = ppBalPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129382
        mmTop = 529
        mmWidth = 28310
        BandType = 4
      end
      object rpBalPatGrpDBText6: TppDBText
        UserName = 'rpBalPatGrpDBText6'
        BlankWhenZero = True
        DataField = 'DEPLANC'
        DataPipeline = ppBalPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 529
        mmWidth = 28310
        BandType = 4
      end
      object rpBalPatGrpDBText7: TppDBText
        UserName = 'rpBalPatGrpDBText7'
        BlankWhenZero = True
        Color = clSilver
        DataField = 'CMDEP'
        DataPipeline = ppBalPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 211932
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object rpBalPatGrpDBText8: TppDBText
        UserName = 'rpBalPatGrpDBText8'
        BlankWhenZero = True
        DataField = 'VALCTB'
        DataPipeline = ppBalPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 237067
        mmTop = 529
        mmWidth = 27252
        BandType = 4
      end
      object rpBalPatGrpDBText3: TppDBText
        UserName = 'rpBalPatGrpDBText3'
        DataField = 'S_A'
        DataPipeline = ppBalPatGrp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 92075
        mmTop = 529
        mmWidth = 7408
        BandType = 4
      end
      object rpBalPatGrpDBText9: TppDBText
        UserName = 'rpBalPatGrpDBText9'
        BlankWhenZero = True
        DataField = 'DEPMES'
        DataPipeline = ppBalPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 187590
        mmTop = 529
        mmWidth = 23548
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine18: TppLine
        UserName = 'ppLine18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 264107
        BandType = 8
      end
      object ppLabel68: TppLabel
        UserName = 'ppLabel68'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 2910
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc17: TppSystemVariable
        UserName = 'Calc17'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 112448
        mmTop = 2910
        mmWidth = 39158
        BandType = 8
      end
      object ppCalc18: TppSystemVariable
        UserName = 'Calc18'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 237596
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryParamCaf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MASCCODGRUPO, IDPESSOA'
      'FROM    PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 32
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryBalPatGrp1: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPO,'
      '       CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS DEPMES,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM GRUPO'
      'ORDER BY CLASSE')
    ValidateWithMask = True
    Left = 32
    Top = 184
  end
  object qryGrpAnaliticos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDGRUPO, G.CLASSE,'
      
        '       SUM(SB.VALORG + SB.REAVVALORG + SB.ULTREAVVALORG)     AS ' +
        'VALORG0,'
      
        '       SUM(SB.CMBEM + SB.REAVCMBEM + SB.ULTREAVCMBEM)        AS ' +
        'CMBEM0,'
      '       SUM(NVL(ATU.VALDEPBEM,0) + NVL(ATU.VALDEPREAV,0) +'
      
        '           NVL(ATU.VALDEPULTREAV,0))                         AS ' +
        'DEPLANCATU0,'
      
        '       SUM(SB.DEPLANC + SB.REAVDEPLANC + SB.ULTREAVDEPLANC)  AS ' +
        'DEPLANC0,'
      
        '       SUM(SB.CMDEP + SB.REAVCMDEP + SB.ULTREAVCMDEP)        AS ' +
        'CMDEP0,'
      '       SUM(SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +'
      '           SB.REAVVALORG + SB.REAVCMBEM -'
      '           SB.REAVDEPLANC - SB.REAVCMDEP +'
      '           SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '           SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)              AS ' +
        'VALCTB0'
      ''
      'FROM (SELECT SCB.IDBEM, SCB.DATASLDBEM,'
      '             SCB.VALORG,  SCB.REAVVALORG,  SCB.ULTREAVVALORG,'
      '             SCB.CMBEM,   SCB.REAVCMBEM,   SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP,   SCB.REAVCMDEP,   SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB,'
      ''
      '     (SELECT ATX.IDBEM, ATX.DATAMOVIMENTACAO,'
      
        '             SUM(ATX.VLCMBEM) AS VALCMBEM, SUM(ATX.VLCMREAV) AS ' +
        'VALCMREAV,'
      
        '             SUM(ATX.VLDEPBEM) AS VALDEPBEM, SUM(ATX.VLDEPREAV) ' +
        'AS VALDEPREAV,'
      
        '             SUM(ATX.VLCMULTREAV) AS VALCMULTREAV, SUM(ATX.VLDEP' +
        'ULTREAV) AS VALDEPULTREAV'
      '      FROM ((SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                    HM.IDBEM,'
      '                    HM.DATAMOVIMENTACAO,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     42,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     34,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     50,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLCMBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLCMREAV,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     17,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     43,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     35,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     51,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLDEPBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLCMULTREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM'
      
        '             WHERE ((HM.DATAMOVIMENTACAO >= :PDATAINI) AND (HM.D' +
        'ATAMOVIMENTACAO <= :PDATASLD))'
      '             GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '             ((SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALCMULTREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      
        '               WHERE ((HM.DATAMOVIMENTACAO >= :PDATAINI) AND (HM' +
        '.DATAMOVIMENTACAO <= :PDATASLD))'
      '                 AND (R.FLGULTREAVAL = 0)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '              (SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMULTREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      
        '               WHERE ((HM.DATAMOVIMENTACAO >= :PDATAINI) AND (HM' +
        '.DATAMOVIMENTACAO <= :PDATASLD))'
      '                 AND (R.FLGULTREAVAL = 1)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO))) ATX'
      '      GROUP BY ATX.IDBEM, ATX.DATAMOVIMENTACAO) ATU,'
      ''
      '     BEM B, GRUPO G'
      ''
      'WHERE (B.DATAINICIODEP <= :PDATASLD)'
      ''
      ''
      ''
      '  AND (B.IDGRUPO = G.IDGRUPO(+))'
      '  AND (B.IDBEM = SB.IDBEM)'
      '  AND (B.IDBEM = ATU.IDBEM(+))'
      'GROUP BY B.IDGRUPO, G.CLASSE'
      '')
    ValidateWithMask = True
    Left = 208
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end>
  end
  object qryGrpSinteticos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CLASSE, NOME, IDGRUPO'
      'FROM GRUPO'
      'WHERE (TIPO = '#39'S'#39')'
      'ORDER BY CLASSE')
    ValidateWithMask = True
    Left = 208
    Top = 184
  end
  object dspBalPatGrp: TDataSetProvider
    DataSet = qryBalPatGrp
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 432
    Top = 149
  end
  object adoqryBalPatGrp: TADOQuery
    Parameters = <>
    Left = 472
    Top = 88
  end
  object adoqryParamCAF: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'SELECT MASCCODGRUPO, IDPESSOA'
      'FROM    PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)')
    Left = 112
    Top = 64
  end
  object adoqryGrpAnaliticos: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'SELECT B.IDGRUPO, G.CLASSE,'
      
        '       SUM(SB.VALORG + SB.REAVVALORG + SB.ULTREAVVALORG)     AS ' +
        'VALORG0,'
      
        '       SUM(SB.CMBEM + SB.REAVCMBEM + SB.ULTREAVCMBEM)        AS ' +
        'CMBEM0,'
      '       SUM(NVL(ATU.VALDEPBEM,0) + NVL(ATU.VALDEPREAV,0) +'
      
        '           NVL(ATU.VALDEPULTREAV,0))                         AS ' +
        'DEPLANCATU0,'
      
        '       SUM(SB.DEPLANC + SB.REAVDEPLANC + SB.ULTREAVDEPLANC)  AS ' +
        'DEPLANC0,'
      
        '       SUM(SB.CMDEP + SB.REAVCMDEP + SB.ULTREAVCMDEP)        AS ' +
        'CMDEP0,'
      '       SUM(SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +'
      '           SB.REAVVALORG + SB.REAVCMBEM -'
      '           SB.REAVDEPLANC - SB.REAVCMDEP +'
      '           SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '           SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)              AS ' +
        'VALCTB0'
      ''
      'FROM (SELECT SCB.IDBEM, SCB.DATASLDBEM,'
      '             SCB.VALORG,  SCB.REAVVALORG,  SCB.ULTREAVVALORG,'
      '             SCB.CMBEM,   SCB.REAVCMBEM,   SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP,   SCB.REAVCMDEP,   SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB,'
      ''
      '     (SELECT ATX.IDBEM, ATX.DATAMOVIMENTACAO,'
      
        '             SUM(ATX.VLCMBEM) AS VALCMBEM, SUM(ATX.VLCMREAV) AS ' +
        'VALCMREAV,'
      
        '             SUM(ATX.VLDEPBEM) AS VALDEPBEM, SUM(ATX.VLDEPREAV) ' +
        'AS VALDEPREAV,'
      
        '             SUM(ATX.VLCMULTREAV) AS VALCMULTREAV, SUM(ATX.VLDEP' +
        'ULTREAV) AS VALDEPULTREAV'
      '      FROM ((SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                    HM.IDBEM,'
      '                    HM.DATAMOVIMENTACAO,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     42,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     34,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     50,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLCMBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLCMREAV,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     17,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     43,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     35,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     51,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLDEPBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLCMULTREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM'
      
        '             WHERE ((HM.DATAMOVIMENTACAO >= :PDATAINI) AND (HM.D' +
        'ATAMOVIMENTACAO <= :PDATASLD))'
      '             GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '             ((SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALCMULTREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      
        '               WHERE ((HM.DATAMOVIMENTACAO >= :PDATAINI) AND (HM' +
        '.DATAMOVIMENTACAO <= :PDATASLD))'
      '                 AND (R.FLGULTREAVAL = 0)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '              (SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMULTREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      
        '               WHERE ((HM.DATAMOVIMENTACAO >= :PDATAINI) AND (HM' +
        '.DATAMOVIMENTACAO <= :PDATASLD))'
      '                 AND (R.FLGULTREAVAL = 1)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO))) ATX'
      '      GROUP BY ATX.IDBEM, ATX.DATAMOVIMENTACAO) ATU,'
      ''
      '     BEM B, GRUPO G'
      ''
      'WHERE (B.DATAINICIODEP <= :PDATASLD)'
      ''
      ''
      ''
      '  AND (B.IDGRUPO = G.IDGRUPO(+))'
      '  AND (B.IDBEM = SB.IDBEM)'
      '  AND (B.IDBEM = ATU.IDBEM(+))'
      'GROUP BY B.IDGRUPO, G.CLASSE')
    Left = 304
    Top = 64
  end
  object adoqryGrpSinteticos: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'SELECT CLASSE, NOME, IDGRUPO'
      'FROM GRUPO'
      'WHERE (TIPO = '#39'S'#39')'
      'ORDER BY CLASSE')
    Left = 304
    Top = 184
  end
  object adoqryBalPatGrp1: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'SELECT IDGRUPO,'
      '       CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS DEPMES,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM GRUPO'
      'ORDER BY CLASSE')
    Left = 120
    Top = 184
  end
  object cdsBalPatGrp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBalPatGrp'
    Left = 432
    Top = 136
  end
  object dspBalPatGrp1: TDataSetProvider
    DataSet = adoqryBalPatGrp1
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 244
  end
  object cdsBalPatGrp1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBalPatGrp1'
    Left = 72
    Top = 230
  end
  object dspGrpAnaliticos: TDataSetProvider
    DataSet = qryGrpAnaliticos
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 248
    Top = 128
  end
  object cdsGrpAnaliticos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrpAnaliticos'
    Left = 248
    Top = 115
  end
  object dspParamCAF: TDataSetProvider
    DataSet = qryParamCaf
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 128
  end
  object cdsParamCAF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParamCAF'
    Left = 72
    Top = 115
  end
  object dspGrpSinteticos: TDataSetProvider
    DataSet = cdsGrpSinteticos
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 251
    Top = 246
  end
  object cdsGrpSinteticos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrpSinteticos'
    Left = 251
    Top = 233
  end
end
