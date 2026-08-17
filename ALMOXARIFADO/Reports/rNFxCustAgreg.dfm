inherited RptNFxCustAgreg: TRptNFxCustAgreg
  Left = 381
  Top = 163
  Width = 274
  Height = 147
  Caption = 'Notas x Custos Agregados'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Notas x Custos Agregados'
    DataBaseName = 'BaseDados'
    Params = <
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DataInicial'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DataFinal'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Agregado'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CODTIPOCUSTAGREG, DESCCUSTAGREG'
          'FROM TIPOAGRE'
          'WHERE (FLGINCIDERECEB = '#39'S'#39')'
          '    AND (CODTRATFISCE < '#39'8'#39' )'
          'ORDER by DESCCUSTAGREG')
        LookupSettings.Chave = 'CODTIPOCUSTAGREG'
        LookupSettings.Display = 'DESCCUSTAGREG'
        LookupSettings.Descricao = 'Agregado'
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
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Agregado'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Tipo de Notas'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Recebimento'
          'Devolução')
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
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Tipo'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 204
    FormWidth = 480
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptNFxCustAgreg
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
    Left = 84
  end
  object dsNFxCustAgreg: TwwDataSource
    DataSet = CdsNFxCustAgreg
    Left = 140
    Top = 60
  end
  object bdeNFxCustAgreg: TppBDEPipeline
    DataSource = dsNFxCustAgreg
    UserName = 'bdeNFxCustAgreg'
    Left = 84
    Top = 60
    object bdeNFxCustAgregppField1: TppField
      FieldAlias = 'DATAENTDEVOL'
      FieldName = 'DATAENTDEVOL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 0
    end
    object bdeNFxCustAgregppField2: TppField
      FieldAlias = 'DATAEMISNF'
      FieldName = 'DATAEMISNF'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object bdeNFxCustAgregppField3: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object bdeNFxCustAgregppField4: TppField
      FieldAlias = 'NOTANUM'
      FieldName = 'NOTANUM'
      FieldLength = 46
      DisplayWidth = 46
      Position = 3
    end
    object bdeNFxCustAgregppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRNOTAFISCAL'
      FieldName = 'VLRNOTAFISCAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object bdeNFxCustAgregppField6: TppField
      FieldAlias = 'FLGTIPONOTA'
      FieldName = 'FLGTIPONOTA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object bdeNFxCustAgregppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'ALIQUOTA'
      FieldName = 'ALIQUOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object bdeNFxCustAgregppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'BASE'
      FieldName = 'BASE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object bdeNFxCustAgregppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object bdeNFxCustAgregppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'RECUP'
      FieldName = 'RECUP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object bdeNFxCustAgregppField11: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
    object bdeNFxCustAgregppField12: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 11
    end
  end
  object RptNFxCustAgreg: TppReport
    AutoStop = False
    DataPipeline = bdeNFxCustAgreg
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 24
    Top = 60
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand24: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object ppLabel129: TppLabel
        UserName = 'ppLabel129'
        Caption = 'Notas x Custos Agregados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 71438
        mmTop = 8731
        mmWidth = 54240
        BandType = 0
      end
      object ppLine60: TppLine
        UserName = 'ppLine60'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19844
        mmWidth = 197300
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object LbPer11: TppLabel
        UserName = 'LbPer11'
        Caption = 'De 01/01/1998 a 01/01/1999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 78052
        mmTop = 14552
        mmWidth = 41275
        BandType = 0
      end
      object RptNFxCustAgregLabel1: TppLabel
        UserName = 'RptNFxCustAgregLabel1'
        Caption = 'Item/Nota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 26723
        mmTop = 21960
        mmWidth = 12435
        BandType = 0
      end
      object RptNFxCustAgregLabel2: TppLabel
        UserName = 'RptNFxCustAgregLabel2'
        Caption = 'Descrição do Agregado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 42598
        mmTop = 21960
        mmWidth = 33867
        BandType = 0
      end
      object RptNFxCustAgregLabel3: TppLabel
        UserName = 'RptNFxCustAgregLabel3'
        Caption = 'Aliquota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 95250
        mmTop = 21960
        mmWidth = 11906
        BandType = 0
      end
      object RptNFxCustAgregLabel4: TppLabel
        UserName = 'RptNFxCustAgregLabel4'
        Caption = 'Valor da Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 116946
        mmTop = 21960
        mmWidth = 19844
        BandType = 0
      end
      object RptNFxCustAgregLabel5: TppLabel
        UserName = 'RptNFxCustAgregLabel5'
        Caption = 'Valor do Agregado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 141817
        mmTop = 21960
        mmWidth = 24606
        BandType = 0
      end
      object RptNFxCustAgregLabel6: TppLabel
        UserName = 'RptNFxCustAgregLabel6'
        Caption = 'Valor Recuperado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 170127
        mmTop = 21960
        mmWidth = 25929
        BandType = 0
      end
      object RptNFxCustAgregLine1: TppLine
        UserName = 'RptNFxCustAgregLine1'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 26723
        mmWidth = 197300
        BandType = 0
      end
    end
    object DetNFxCustAgreg: TppDetailBand
      BeforePrint = DetNFxCustAgregBeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptNFxCustAgregDBText1: TppDBText
        UserName = 'RptNFxCustAgregDBText1'
        DataField = 'DESCRICAO'
        DataPipeline = bdeNFxCustAgreg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 42598
        mmTop = 0
        mmWidth = 47361
        BandType = 4
      end
      object RptNFxCustAgregDBText3: TppDBText
        UserName = 'RptNFxCustAgregDBText3'
        DataField = 'BASE'
        DataPipeline = bdeNFxCustAgreg
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 109273
        mmTop = 0
        mmWidth = 27517
        BandType = 4
      end
      object RptNFxCustAgregDBText4: TppDBText
        UserName = 'RptNFxCustAgregDBText4'
        DataField = 'VALOR'
        DataPipeline = bdeNFxCustAgreg
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 138907
        mmTop = 0
        mmWidth = 27517
        BandType = 4
      end
      object RptNFxCustAgregDBText2: TppDBText
        UserName = 'RptNFxCustAgregDBText2'
        DataField = 'RECUP'
        DataPipeline = bdeNFxCustAgreg
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168540
        mmTop = 0
        mmWidth = 27517
        BandType = 4
      end
      object RptNFxCustAgregDBText5: TppDBText
        UserName = 'RptNFxCustAgregDBText5'
        AutoSize = True
        DataField = 'ALIQUOTA'
        DataPipeline = bdeNFxCustAgreg
        DisplayFormat = '0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 92869
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object RptNFxCustAgregDBText6: TppDBText
        UserName = 'RptNFxCustAgregDBText6'
        AutoSize = True
        DataField = 'TIPO'
        DataPipeline = bdeNFxCustAgreg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 23813
        mmTop = 0
        mmWidth = 6615
        BandType = 4
      end
    end
    object ppFooterBand24: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
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
        mmLeft = 0
        mmTop = 529
        mmWidth = 23019
        BandType = 8
      end
      object ppLine62: TppLine
        UserName = 'ppLine62'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppCalc46: TppSystemVariable
        UserName = 'Calc46'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 80169
        mmTop = 529
        mmWidth = 37042
        BandType = 8
      end
      object ppCalc47: TppSystemVariable
        UserName = 'Calc47'
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
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand7: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel223: TppLabel
        UserName = 'Label223'
        Caption = 'Total dos Agregados :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 95250
        mmTop = 794
        mmWidth = 29104
        BandType = 7
      end
      object ppLine98: TppLine
        UserName = 'ppLine601'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
      end
      object ppDBCalc21: TppDBCalc
        UserName = 'DBCalc21'
        DataField = 'VALOR'
        DataPipeline = bdeNFxCustAgreg
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 149225
        mmTop = 529
        mmWidth = 17198
        BandType = 7
      end
    end
    object ppGroup10: TppGroup
      BreakName = 'DATAENTDEVOL'
      DataPipeline = bdeNFxCustAgreg
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand8: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppDBText60: TppDBText
          UserName = 'ppDBText60'
          AutoSize = True
          DataField = 'DATAENTDEVOL'
          DataPipeline = bdeNFxCustAgreg
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 27252
          mmTop = 2117
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
        end
        object ppLabel154: TppLabel
          UserName = 'ppLabel154'
          Caption = 'Data de Entrada :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 794
          mmTop = 2117
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppLine61: TppLine
          UserName = 'ppLine61'
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 5821
          mmWidth = 43656
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object RptNFxCustAgregGroup1: TppGroup
      BreakName = 'RAZAOSOCIAL'
      DataPipeline = bdeNFxCustAgreg
      UserName = 'RptNFxCustAgregGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptNFxCustAgregGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppDBText48: TppDBText
          UserName = 'ppDBText48'
          DataField = 'RAZAOSOCIAL'
          DataPipeline = bdeNFxCustAgreg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 21167
          mmTop = 794
          mmWidth = 65088
          BandType = 3
          GroupNo = 1
        end
        object ppDBText50: TppDBText
          UserName = 'ppDBText50'
          AutoSize = True
          DataField = 'NOTANUM'
          DataPipeline = bdeNFxCustAgreg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 94456
          mmTop = 794
          mmWidth = 14288
          BandType = 3
          GroupNo = 1
        end
        object ppDBText57: TppDBText
          UserName = 'ppDBText57'
          DataField = 'VLRNOTAFISCAL'
          DataPipeline = bdeNFxCustAgreg
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 132557
          mmTop = 794
          mmWidth = 29633
          BandType = 3
          GroupNo = 1
        end
        object ppDBText59: TppDBText
          UserName = 'ppDBText59'
          DataField = 'FLGTIPONOTA'
          DataPipeline = bdeNFxCustAgreg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 173038
          mmTop = 794
          mmWidth = 6350
          BandType = 3
          GroupNo = 1
        end
        object ppLabel145: TppLabel
          UserName = 'ppLabel145'
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2910
          mmTop = 794
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object ppLabel147: TppLabel
          UserName = 'ppLabel147'
          Caption = 'Nº :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 88900
          mmTop = 794
          mmWidth = 4498
          BandType = 3
          GroupNo = 1
        end
        object ppLabel149: TppLabel
          UserName = 'ppLabel149'
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 122767
          mmTop = 794
          mmWidth = 8467
          BandType = 3
          GroupNo = 1
        end
        object ppLabel151: TppLabel
          UserName = 'ppLabel151'
          Caption = 'Tipo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 164571
          mmTop = 794
          mmWidth = 7144
          BandType = 3
          GroupNo = 1
        end
      end
      object RptNFxCustAgregGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object SqlNFxCustAgreg: TCMSqlParams
    ClientDataSet = CdsNFxCustAgreg
    Left = 196
    Top = 8
  end
  object CdsNFxCustAgreg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 196
    Top = 60
  end
end
