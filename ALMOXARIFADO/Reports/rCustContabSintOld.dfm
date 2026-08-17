inherited RptCustContabSint: TRptCustContabSint
  Left = 371
  Top = 224
  Width = 304
  Height = 153
  Caption = 'Custos Contábeis Sintético'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Custos Contábeis Sintético'
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
        Caption = 'Conta Contábil'
        Controle = tcProcuraCC
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'Select PlaConta, PlaNome, PlaNomeOutling '
          'From PlanoConta '
          'Order By PlaConta')
        LookupSettings.Chave = 'PlaConta'
        LookupSettings.Display = 'PlaConta|PlaNome'
        LookupSettings.Descricao = 'Conta|Nome'
        LookupSettings.Tamanho = '0|0'
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
        Name = 'ContaContabil'
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
        Caption = 'Resumido'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
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
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Resumido'
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
        Caption = 'Utilizar Conta de'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Entrada'
          'Saída')
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
        Name = 'Conta'
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
    Formheight = 290
    FormWidth = 480
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptCustContabSint
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
    Left = 84
  end
  object dsCustContabSint: TwwDataSource
    DataSet = CdsCustContabSint
    Left = 140
    Top = 60
  end
  object bdeCustContabSint: TppBDEPipeline
    DataSource = dsCustContabSint
    UserName = 'bdeCustContabSint'
    Left = 80
    Top = 60
    object bdeCustContabSintppField1: TppField
      FieldAlias = 'CODGRUPOPROD'
      FieldName = 'CODGRUPOPROD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object bdeCustContabSintppField2: TppField
      FieldAlias = 'DESCGRUPOPROD'
      FieldName = 'DESCGRUPOPROD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object bdeCustContabSintppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object bdeCustContabSintppField4: TppField
      FieldAlias = 'CODARTIGO'
      FieldName = 'CODARTIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object bdeCustContabSintppField5: TppField
      FieldAlias = 'DATAMOV'
      FieldName = 'DATAMOV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object bdeCustContabSintppField6: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object bdeCustContabSintppField7: TppField
      FieldAlias = 'CONTA'
      FieldName = 'CONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object bdeCustContabSintppField8: TppField
      FieldAlias = 'CONTANOME'
      FieldName = 'CONTANOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object bdeCustContabSintppField9: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object bdeCustContabSintppField10: TppField
      FieldAlias = 'DESCARTIGO'
      FieldName = 'DESCARTIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object RptCustContabSint: TppReport
    AutoStop = False
    DataPipeline = bdeCustContabSint
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 209815
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 24
    Top = 60
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand22: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32015
      mmPrintPosition = 0
      object ppLabel118: TppLabel
        UserName = 'ppLabel118'
        Caption = 'CUSTOS CONTÁBEIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6350
        mmLeft = 70379
        mmTop = 7938
        mmWidth = 56356
        BandType = 0
      end
      object ppLine47: TppLine
        UserName = 'ppLine47'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 31750
        mmWidth = 197115
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
        mmLeft = 84402
        mmTop = 1058
        mmWidth = 28046
        BandType = 0
      end
      object ppLine50: TppLine
        UserName = 'ppLine50'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3440
        mmLeft = 0
        mmTop = 24342
        mmWidth = 197115
        BandType = 0
      end
      object LbGrupo: TppLabel
        UserName = 'LbGrupo'
        Caption = 'GRUPO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 22490
        mmTop = 26458
        mmWidth = 9790
        BandType = 0
      end
      object LbCentCust3: TppLabel
        UserName = 'LbCentCust3'
        Caption = 'CENTRO DE CUSTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99219
        mmTop = 26458
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel127: TppLabel
        UserName = 'ppLabel127'
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 148432
        mmTop = 26458
        mmWidth = 10054
        BandType = 0
      end
      object lbPer14: TppLabel
        UserName = 'lbPer14'
        AutoSize = False
        Caption = 'lbPer14'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 77258
        mmTop = 15346
        mmWidth = 42333
        BandType = 0
      end
    end
    object ppDetailBand18: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand22: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine53: TppLine
        UserName = 'ppLine53'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197115
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
        mmLeft = 265
        mmTop = 794
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc42: TppSystemVariable
        UserName = 'Calc42'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 78581
        mmTop = 794
        mmWidth = 39688
        BandType = 8
      end
      object ppCalc43: TppSystemVariable
        UserName = 'Calc43'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169863
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'CONTA'
      DataPipeline = bdeCustContabSint
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppDBText51: TppDBText
          UserName = 'ppDBText51'
          DataField = 'CONTA'
          DataPipeline = bdeCustContabSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 21431
          mmTop = 1588
          mmWidth = 28575
          BandType = 3
          GroupNo = 0
        end
        object ppLabel134: TppLabel
          UserName = 'ppLabel134'
          Caption = 'CONTA : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 3704
          mmTop = 1588
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppDBText52: TppDBText
          UserName = 'ppDBText52'
          DataField = 'CONTANOME'
          DataPipeline = bdeCustContabSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 54240
          mmTop = 1588
          mmWidth = 63500
          BandType = 3
          GroupNo = 0
        end
        object ppLine54: TppLine
          UserName = 'ppLine54'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 197115
          BandType = 3
          GroupNo = 0
        end
        object ppLine55: TppLine
          UserName = 'ppLine55'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 6615
          mmWidth = 197115
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLabel135: TppLabel
          UserName = 'ppLabel135'
          Caption = 'Total da Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 100806
          mmTop = 1852
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
        object ppLabel136: TppLabel
          UserName = 'ppLabel136'
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 123296
          mmTop = 1852
          mmWidth = 794
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'ppDBCalc13'
          DataField = 'VALOR'
          DataPipeline = bdeCustContabSint
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 138377
          mmTop = 1852
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppLine56: TppLine
          UserName = 'ppLine56'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'DATAMOV'
      DataPipeline = bdeCustContabSint
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object CabecCustContabSint: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBText53: TppDBText
          UserName = 'ppDBText53'
          DataField = 'DATAMOV'
          DataPipeline = bdeCustContabSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 19844
          mmTop = 1588
          mmWidth = 28575
          BandType = 3
          GroupNo = 1
        end
        object ppLabel137: TppLabel
          UserName = 'ppLabel137'
          Caption = 'Em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 14288
          mmTop = 1588
          mmWidth = 4498
          BandType = 3
          GroupNo = 1
        end
        object ppLine57: TppLine
          UserName = 'ppLine57'
          Style = lsDouble
          Weight = 0.75
          mmHeight = 2646
          mmLeft = 11377
          mmTop = 4763
          mmWidth = 26194
          BandType = 3
          GroupNo = 1
        end
      end
      object RodapeCustContabSint: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel138: TppLabel
          UserName = 'ppLabel138'
          Caption = 'Total  em '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 91017
          mmTop = 1058
          mmWidth = 14288
          BandType = 5
          GroupNo = 1
        end
        object ppDBText54: TppDBText
          UserName = 'ppDBText54'
          AutoSize = True
          DataField = 'DATAMOV'
          DataPipeline = bdeCustContabSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 107156
          mmTop = 1058
          mmWidth = 14288
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'ppDBCalc14'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = bdeCustContabSint
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 138642
          mmTop = 1058
          mmWidth = 19844
          BandType = 5
          GroupNo = 1
        end
        object ppLabel139: TppLabel
          UserName = 'ppLabel139'
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 123296
          mmTop = 1058
          mmWidth = 794
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object RptCustContabSintGroup1: TppGroup
      BreakName = 'CODARTIGO'
      DataPipeline = bdeCustContabSint
      UserName = 'RptCustContabSintGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptCustContabSintGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RptCustContabSintGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppDBText40: TppDBText
          UserName = 'ppDBText40'
          DataField = 'CODARTIGO'
          DataPipeline = bdeCustContabSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 0
          mmWidth = 22225
          BandType = 5
          GroupNo = 2
        end
        object ppDBText49: TppDBText
          UserName = 'ppDBText49'
          DataField = 'DESCARTIGO'
          DataPipeline = bdeCustContabSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 23548
          mmTop = 0
          mmWidth = 47625
          BandType = 5
          GroupNo = 2
        end
        object ppDBText44: TppDBText
          UserName = 'ppDBText44'
          DataField = 'CODCENTROCUSTO'
          DataPipeline = bdeCustContabSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 98690
          mmTop = 0
          mmWidth = 22225
          BandType = 5
          GroupNo = 2
        end
        object RptCustContabSintDBCalc1: TppDBCalc
          UserName = 'RptCustContabSintDBCalc1'
          DataField = 'VALOR'
          DataPipeline = bdeCustContabSint
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = RptCustContabSintGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 142346
          mmTop = 265
          mmWidth = 15875
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object SqlCustContabSint: TCMSqlParams
    SQL.Strings = (
      'SELECT G.CODGRUPOPROD, G.DESCGRUPOPROD, C.NOME, M.CODARTIGO,'
      'TO_DATE('#39'1/10/2002'#39', '#39'DD/MM/YYYY'#39') AS DATAMOV, '
      
        'M.CODCENTROCUSTO, '#39'                '#39' As CONTA, '#39'                ' +
        '                        '#39' As CONTANOME, SUM( M.VALORMOV ) AS VAL' +
        'OR, '
      ' ('#39'                                       '#39')  AS DESCARTIGO '
      
        'FROM MOVIMENT M, ALMOX A, PRODUTO P, ARTIGO AR, ALMOX T, GRUPPRO' +
        'D G, CENTCUST C WHERE ( M.CODTIPOMOV <> '#39'A'#39' ) AND ( M.CODTIPOMOV' +
        ' <> '#39'K'#39' ) AND ( M.CODTIPOMOV <> '#39'Z'#39' ) '
      'AND ( M.FLGENTRADACUSTO <> '#39'S'#39' ) '
      
        'AND ( M.DATAMOV BETWEEN TO_DATE( '#39'1/10/2002'#39', '#39'DD/MM/YYYY'#39' ) AND' +
        ' TO_DATE( '#39'20/11/2002'#39', '#39'DD/MM/YYYY'#39' ) ) AND ( M.IDPESSOA = 2 ) ' +
        'AND ( A.CONTABIL = '#39'T'#39' ) AND ( M.CODALMOXARIFADO = A.CODALMOXARI' +
        'FADO ) AND ( M.CODALMOXTRANSF = T.CODALMOXARIFADO(+) ) AND ( ( M' +
        '.CODALMOXTRANSF IS NULL ) OR ( ( M.CODALMOXTRANSF IS NOT NULL ) ' +
        'AND ( A.CODCUSTEIO <> T.CODCUSTEIO ) AND ( ( T.CONTABIL <> '#39'T'#39' )' +
        ' OR ( T.CONTABIL IS NULL ) ) ) ) AND ( M.CODARTIGO = AR.CODARTIG' +
        'O ) AND ( AR.CODPRODUTO = P.CODPRODUTO ) AND ( P.CODGRUPOPROD = ' +
        'G.CODGRUPOPROD ) AND ( M.CODCENTROCUSTO = C.CODCENTROCUSTO ) AND' +
        ' ( M.IDEMPRESA = C.IDEMPRESA ) GROUP BY G.CODGRUPOPROD, G.DESCGR' +
        'UPOPROD, C.NOME, M.CODARTIGO, '
      'M.CODCENTROCUSTO '
      ' ')
    ClientDataSet = CdsProcess
    Left = 192
    Top = 8
  end
  object CdsCustContabSint: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 60
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 60
  end
  object CdsProcess: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 8
  end
end
