inherited frmRptConfIRRFAna: TfrmRptConfIRRFAna
  Left = 331
  Top = 136
  Width = 408
  Height = 177
  Caption = 'frmRptConfIRRFAna'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Conferência do IRRF'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Beneficiário'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT E.IDFORCLI, P.RAZAOSOCIAL'
          '  FROM PESSOA P, EMPRESAFORN E'
          ' WHERE E.IDFORCLI = P.IDPESSOA')
        LookupSettings.Chave = 'IDFORCLI'
        LookupSettings.Display = 'RAZAOSOCIAL'
        LookupSettings.Descricao = 'Razão Social'
        LookupSettings.Tamanho = '50'
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
        Name = 'dblcBeneficiario'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end
      item
        Caption = 'Data Inicial'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
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
        Name = 'edtData'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end
      item
        Caption = 'Data Final'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
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
        Name = 'edtFinal'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end>
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpConfIRRFAna
    LabelEmpresa = ppLabel60
    ConnectionType = cntBDE
  end
  object dsConfIRRFAna: TwwDataSource
    DataSet = cdsConfIRRFAna
    Left = 128
    Top = 81
  end
  object pplConfIRRFAna: TppBDEPipeline
    DataSource = dsConfIRRFAna
    UserName = 'lConfDIRF1'
    Left = 212
    Top = 81
    object pplConfIRRFAnappField1: TppField
      FieldAlias = 'DATALANCAMENTO'
      FieldName = 'DATALANCAMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 0
    end
    object pplConfIRRFAnappField2: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 1
    end
    object pplConfIRRFAnappField3: TppField
      FieldAlias = 'CODNATUREZA'
      FieldName = 'CODNATUREZA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 2
    end
    object pplConfIRRFAnappField4: TppField
      FieldAlias = 'FLGFOLHA'
      FieldName = 'FLGFOLHA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object pplConfIRRFAnappField5: TppField
      FieldAlias = 'NOMEBENEF'
      FieldName = 'NOMEBENEF'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplConfIRRFAnappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBENEFIRRF'
      FieldName = 'IDBENEFIRRF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplConfIRRFAnappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRBASE'
      FieldName = 'VLRBASE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplConfIRRFAnappField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPIS'
      FieldName = 'VLRPIS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplConfIRRFAnappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIRRF'
      FieldName = 'VLRIRRF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplConfIRRFAnappField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRINSS'
      FieldName = 'VLRINSS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplConfIRRFAnappField11: TppField
      FieldAlias = 'NOMEINFORME'
      FieldName = 'NOMEINFORME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
    object pplConfIRRFAnappField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRLANC'
      FieldName = 'VLRLANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplConfIRRFAnappField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDLANCIRRF'
      FieldName = 'IDLANCIRRF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplConfIRRFAnappField14: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 13
    end
    object pplConfIRRFAnappField15: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 14
    end
    object pplConfIRRFAnappField16: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
  end
  object rpConfIRRFAna: TppReport
    AutoStop = False
    DataPipeline = pplConfIRRFAna
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 209815
    PrinterSetup.PaperSize = 0
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 312
    Top = 81
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22225
      mmPrintPosition = 0
      object ppLabel59: TppLabel
        UserName = 'ppLabel14'
        Caption = 'Conferência do IRRF - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 66675
        mmTop = 8731
        mmWidth = 63500
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'ppLine7'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'ppLabel15'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84402
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'ppLabel19'
        Caption = 'Beneficiário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 27252
        mmTop = 17992
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'rpConfDIRFLabel1'
        Caption = 'CNPJ/CPF Benef.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 17992
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'rpConfDIRFLabel3'
        Caption = 'Rend.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 110067
        mmTop = 17992
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'rpConfDIRFLabel4'
        Caption = 'Deduções'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 128852
        mmTop = 17992
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'rpConfDIRFLabel5'
        Caption = 'IRRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 17992
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'rpConfDIRFLabel18'
        Caption = 'PIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 167482
        mmTop = 17992
        mmWidth = 4498
        BandType = 0
      end
      object lblConfIRRFAnaPeriodo: TppLabel
        UserName = 'Label2'
        Caption = 'Período: 01/01/2001 a 31/12/2001'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 11642
        mmWidth = 42333
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'NOMEINFORME'
        DataPipeline = pplConfIRRFAna
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 9525
        mmTop = 265
        mmWidth = 65088
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'VLRLANC'
        DataPipeline = pplConfIRRFAna
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 76729
        mmTop = 265
        mmWidth = 22490
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 195527
        BandType = 8
      end
      object ppLabel84: TppLabel
        UserName = 'ppLabel26'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 195527
        BandType = 8
      end
      object ppLine15: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197115
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 252942
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppVariable1: TppVariable
        UserName = 'Variable1'
        CalcOrder = 0
        DataType = dtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160073
        mmTop = 3175
        mmWidth = 35983
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DATALANCAMENTO'
      DataPipeline = pplConfIRRFAna
      UserName = 'rpConfDIRFGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppDBText18: TppDBText
          UserName = 'rpConfDIRFDBText5'
          AutoSize = True
          DataField = 'DATALANCAMENTO'
          DataPipeline = pplConfIRRFAna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5292
          mmLeft = 48948
          mmTop = 1323
          mmWidth = 41540
          BandType = 3
          GroupNo = 0
        end
        object ppLabel86: TppLabel
          UserName = 'Label1'
          Caption = 'Data do Lançamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5292
          mmLeft = 4233
          mmTop = 1323
          mmWidth = 43392
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'CODNATUREZA'
      DataPipeline = pplConfIRRFAna
      UserName = 'rpConfDIRFGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLine16: TppLine
          UserName = 'rpConfDIRFLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197115
          BandType = 3
          GroupNo = 1
        end
        object ppLabel85: TppLabel
          UserName = 'rpConfDIRFLabel2'
          Caption = 'Natureza do Rendimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 28840
          mmTop = 1323
          mmWidth = 33602
          BandType = 3
          GroupNo = 1
        end
        object ppDBText57: TppDBText
          UserName = 'rpConfDIRFDBText1'
          DataField = 'CODNATUREZA'
          DataPipeline = pplConfIRRFAna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 66675
          mmTop = 1323
          mmWidth = 9790
          BandType = 3
          GroupNo = 1
        end
        object ppDBText58: TppDBText
          UserName = 'rpConfDIRFDBText2'
          AutoSize = True
          DataField = 'DESCRICAO'
          DataPipeline = pplConfIRRFAna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 77523
          mmTop = 1323
          mmWidth = 16669
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'IDBENEFIRRF'
      DataPipeline = pplConfIRRFAna
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 1588
        mmPrintPosition = 0
        object ppLine14: TppLine
          UserName = 'rpConfDIRFLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 529
          mmWidth = 197115
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'IDLANCIRRF'
      DataPipeline = pplConfIRRFAna
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBText23: TppDBText
          UserName = 'rpConfDIRFDBText4'
          DataField = 'NUMDOCUMENTO'
          DataPipeline = pplConfIRRFAna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 529
          mmTop = 265
          mmWidth = 26723
          BandType = 3
          GroupNo = 3
        end
        object ppDBText19: TppDBText
          UserName = 'ppDBText1'
          DataField = 'NOMEBENEF'
          DataPipeline = pplConfIRRFAna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 28310
          mmTop = 265
          mmWidth = 65088
          BandType = 3
          GroupNo = 3
        end
        object ppDBText20: TppDBText
          UserName = 'DBText1'
          DataField = 'VLRBASE'
          DataPipeline = pplConfIRRFAna
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 94721
          mmTop = 265
          mmWidth = 22490
          BandType = 3
          GroupNo = 3
        end
        object ppDBText21: TppDBText
          UserName = 'DBText21'
          DataField = 'VLRINSS'
          DataPipeline = pplConfIRRFAna
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 118004
          mmTop = 265
          mmWidth = 22490
          BandType = 3
          GroupNo = 3
        end
        object ppDBText22: TppDBText
          UserName = 'DBText22'
          DataField = 'VLRIRRF'
          DataPipeline = pplConfIRRFAna
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 141817
          mmTop = 265
          mmWidth = 22490
          BandType = 3
          GroupNo = 3
        end
        object ppDBText24: TppDBText
          UserName = 'DBText24'
          DataField = 'VLRPIS'
          DataPipeline = pplConfIRRFAna
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 165629
          mmTop = 265
          mmWidth = 22490
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = :IDPESSOA')
    ClientDataSet = cdsAux
    Left = 256
    Top = 8
  end
  object sqlConfIRRFAna: TCMSqlParams
    SQL.Strings = (
      'SELECT L.DATALANCAMENTO, L.PLACONTA, L.CODNATUREZA,'
      '       L.FLGFOLHA, P.RAZAOSOCIAL AS NOMEBENEF, L.IDBENEFIRRF,'
      '       L.VLRBASE, L.VLRPIS, L.VLRIRRF, L.VLRINSS,'
      '       I.NOMEINFORME, LI.VLRLANC, L.IDLANCIRRF,'
      '       N.DESCRICAO, P.NUMDOCUMENTO, P.TIPO, P.RAZAOSOCIAL'
      
        'FROM PESSOA P, LANCIRRF L, LANCXINFORME LI, INFORME I, NATURENDI' +
        'MENTO N'
      'WHERE (P.IDPESSOA = L.IDBENEFIRRF)'
      '  AND (SUBSTR(L.NUMDOCUMENTO,1,8) = :NUMDOCUMENTO)'
      '  AND (L.DATALANCAMENTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '  AND (L.DATALANCAMENTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '  AND (P.RAZAOSOCIAL LIKE :PNOMEBENEF)'
      '  AND (L.CODNATUREZA = N.CODNATUREZA)'
      '  AND (L.IDLANCIRRF = LI.IDLANCIRRF(+))'
      '  AND (LI.IDINFORME = I.IDINFORME(+))'
      
        'ORDER BY L.DATALANCAMENTO, L.CODNATUREZA, P.RAZAOSOCIAL, L.IDBEN' +
        'EFIRRF, L.IDLANCIRRF'
      '')
    ClientDataSet = cdsConfIRRFAna
    Left = 280
    Top = 40
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 8
  end
  object cdsConfIRRFAna: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 8
  end
end
