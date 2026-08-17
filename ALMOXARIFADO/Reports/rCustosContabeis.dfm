inherited rptCustosContabeis: TrptCustosContabeis
  Left = 227
  Top = 229
  Width = 343
  Height = 156
  Caption = 'Custos Contábeis'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Custos Contábeis'
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
        Caption = 'Conta Contabil'
        Controle = tcProcuraCC
        TipodeDado = tdString
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
        MostraComboCompara = True
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
        Caption = 'Centro de Custo'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '     CODCENTROCUSTO,'
          '      NOME'
          'FROM '
          '      CENTCUST'
          'WHERE '
          '   ( IDEMPRESA = 1)'
          'ORDER BY 2')
        LookupSettings.Chave = 'CODCENTROCUSTO'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'NOME'
        LookupSettings.Tamanho = '40'
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
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Centro de Custo'
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
        Name = 'Utilizar Conta de'
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
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 270
    FormWidth = 400
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptCustContab
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
    Left = 84
  end
  object dsCustContab: TwwDataSource
    DataSet = CdsCustContab
    Left = 144
    Top = 60
  end
  object bdeCustContab: TppBDEPipeline
    DataSource = dsCustContab
    UserName = 'bdeCustContab'
    Left = 84
    Top = 60
    object bdeCustContabppField1: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object bdeCustContabppField2: TppField
      FieldAlias = 'IDMOV'
      FieldName = 'IDMOV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object bdeCustContabppField3: TppField
      FieldAlias = 'ALMOXDESINO'
      FieldName = 'ALMOXDESINO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object bdeCustContabppField4: TppField
      FieldAlias = 'ALMOXORIGEM'
      FieldName = 'ALMOXORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object bdeCustContabppField5: TppField
      FieldAlias = 'CODARTIGO'
      FieldName = 'CODARTIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object bdeCustContabppField6: TppField
      FieldAlias = 'CODCUSTEIO'
      FieldName = 'CODCUSTEIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object bdeCustContabppField7: TppField
      FieldAlias = 'CONTA'
      FieldName = 'CONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object bdeCustContabppField8: TppField
      FieldAlias = 'CONTANOME'
      FieldName = 'CONTANOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object bdeCustContabppField9: TppField
      FieldAlias = 'CODCUSTRANSF'
      FieldName = 'CODCUSTRANSF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object bdeCustContabppField10: TppField
      FieldAlias = 'DESCARTIGO'
      FieldName = 'DESCARTIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object bdeCustContabppField11: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object bdeCustContabppField12: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object bdeCustContabppField13: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object bdeCustContabppField14: TppField
      FieldAlias = 'CODMOV'
      FieldName = 'CODMOV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object bdeCustContabppField15: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object bdeCustContabppField16: TppField
      FieldAlias = 'DESCMOV'
      FieldName = 'DESCMOV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object bdeCustContabppField17: TppField
      FieldAlias = 'NOMECC'
      FieldName = 'NOMECC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
  end
  object RptCustContab: TppReport
    AutoStop = False
    DataPipeline = bdeCustContab
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 24
    Top = 60
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeCustContab'
    object ppHeaderBand15: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32015
      mmPrintPosition = 0
      object ppLabel71: TppLabel
        UserName = 'ppLabel71'
        Caption = 'CUSTOS CONTÁBEIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6879
        mmLeft = 113242
        mmTop = 7938
        mmWidth = 58208
        BandType = 0
      end
      object ppLine27: TppLine
        UserName = 'ppLine27'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 31750
        mmWidth = 284300
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
        mmLeft = 128059
        mmTop = 1058
        mmWidth = 28046
        BandType = 0
      end
      object RptCustContabLine2: TppLine
        UserName = 'RptCustContabLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24342
        mmWidth = 284300
        BandType = 0
      end
      object RptCustContabLabel5: TppLabel
        UserName = 'RptCustContabLabel5'
        Caption = 'ARTIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 22490
        mmTop = 27517
        mmWidth = 10848
        BandType = 0
      end
      object RptCustContabLabel6: TppLabel
        UserName = 'RptCustContabLabel6'
        Caption = 'Nº DOCUMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 73554
        mmTop = 27517
        mmWidth = 21696
        BandType = 0
      end
      object RptCustContabLabel7: TppLabel
        UserName = 'RptCustContabLabel7'
        Caption = 'CENTRO DE CUSTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 99219
        mmTop = 27517
        mmWidth = 26723
        BandType = 0
      end
      object RptCustContabLabel8: TppLabel
        UserName = 'RptCustContabLabel8'
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 164042
        mmTop = 27517
        mmWidth = 9525
        BandType = 0
      end
      object RptCustContabLabel9: TppLabel
        UserName = 'RptCustContabLabel9'
        Caption = 'ORIGEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 186532
        mmTop = 27517
        mmWidth = 11113
        BandType = 0
      end
      object RptCustContabLabel10: TppLabel
        UserName = 'RptCustContabLabel10'
        Caption = 'DESTINO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 207963
        mmTop = 27252
        mmWidth = 11906
        BandType = 0
      end
      object RptCustContabLabel11: TppLabel
        UserName = 'RptCustContabLabel11'
        Caption = 'HISTÓRICO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 232834
        mmTop = 27252
        mmWidth = 15346
        BandType = 0
      end
      object lblPerCust: TppLabel
        UserName = 'lblPerCust'
        AutoSize = False
        Caption = 'lblPerCust'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 120915
        mmTop = 15346
        mmWidth = 42333
        BandType = 0
      end
      object RptCustContabLabel14: TppLabel
        UserName = 'RptCustContabLabel14'
        Caption = '  ALMOXARIFADO  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        mmHeight = 3175
        mmLeft = 190500
        mmTop = 22754
        mmWidth = 25135
        BandType = 0
      end
      object RptCustContabLine6: TppLine
        UserName = 'RptCustContabLine6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7408
        mmLeft = 150813
        mmTop = 24342
        mmWidth = 4763
        BandType = 0
      end
      object RptCustContabLine7: TppLine
        UserName = 'RptCustContabLine7'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7408
        mmLeft = 227278
        mmTop = 24606
        mmWidth = 4763
        BandType = 0
      end
      object RptCustContabLabel15: TppLabel
        UserName = 'RptCustContabLabel15'
        Caption = 'Centro de Custo : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 529
        mmTop = 19844
        mmWidth = 24077
        BandType = 0
      end
      object LbCentCust: TppLabel
        UserName = 'LbCentCust'
        Caption = 'Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 27517
        mmTop = 19844
        mmWidth = 7673
        BandType = 0
      end
    end
    object ppDetailBand13: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object RptCustContabDBText5: TppDBText
        UserName = 'RptCustContabDBText5'
        DataField = 'CODARTIGO'
        DataPipeline = bdeCustContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeCustContab'
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object RptCustContabDBText6: TppDBText
        UserName = 'RptCustContabDBText6'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = bdeCustContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeCustContab'
        mmHeight = 3704
        mmLeft = 73025
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object RptCustContabDBText7: TppDBText
        UserName = 'RptCustContabDBText7'
        DataField = 'CODCENTROCUSTO'
        DataPipeline = bdeCustContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeCustContab'
        mmHeight = 3704
        mmLeft = 99219
        mmTop = 265
        mmWidth = 14023
        BandType = 4
      end
      object RptCustContabDBText8: TppDBText
        UserName = 'RptCustContabDBText8'
        DataField = 'VALOR'
        DataPipeline = bdeCustContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeCustContab'
        mmHeight = 3704
        mmLeft = 151607
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object RptCustContabDBText9: TppDBText
        UserName = 'RptCustContabDBText9'
        DataField = 'ALMOXORIGEM'
        DataPipeline = bdeCustContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'bdeCustContab'
        mmHeight = 3704
        mmLeft = 181505
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object RptCustContabDBText10: TppDBText
        UserName = 'RptCustContabDBText10'
        DataField = 'ALMOXDESINO'
        DataPipeline = bdeCustContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'bdeCustContab'
        mmHeight = 3704
        mmLeft = 204259
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object RptCustContabDBText11: TppDBText
        UserName = 'RptCustContabDBText11'
        AutoSize = True
        DataField = 'DESCMOV'
        DataPipeline = bdeCustContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeCustContab'
        mmHeight = 3175
        mmLeft = 232834
        mmTop = 265
        mmWidth = 14288
        BandType = 4
      end
      object RptCustContabDBText13: TppDBText
        UserName = 'RptCustContabDBText13'
        DataField = 'DESCARTIGO'
        DataPipeline = bdeCustContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeCustContab'
        mmHeight = 3704
        mmLeft = 24077
        mmTop = 265
        mmWidth = 47625
        BandType = 4
      end
      object RptCustContabDBText14: TppDBText
        UserName = 'RptCustContabDBText14'
        DataField = 'CODMOV'
        DataPipeline = bdeCustContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'bdeCustContab'
        mmHeight = 3704
        mmLeft = 228865
        mmTop = 265
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText96: TppDBText
        UserName = 'DBText96'
        DataField = 'NOMECC'
        DataPipeline = bdeCustContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        DataPipelineName = 'bdeCustContab'
        mmHeight = 3440
        mmLeft = 115623
        mmTop = 265
        mmWidth = 34131
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine29: TppLine
        UserName = 'ppLine29'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
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
        mmLeft = 265
        mmTop = 794
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc28: TppSystemVariable
        UserName = 'Calc28'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 122238
        mmTop = 794
        mmWidth = 39688
        BandType = 8
      end
      object ppCalc29: TppSystemVariable
        UserName = 'Calc29'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 248180
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptCustContabGroup1: TppGroup
      BreakName = 'CONTA'
      DataPipeline = bdeCustContab
      OutlineSettings.CreateNode = True
      UserName = 'RptCustContabGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeCustContab'
      object RptCustContabGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object RptCustContabDBText1: TppDBText
          UserName = 'RptCustContabDBText1'
          DataField = 'CONTA'
          DataPipeline = bdeCustContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeCustContab'
          mmHeight = 3704
          mmLeft = 21431
          mmTop = 1588
          mmWidth = 43127
          BandType = 3
          GroupNo = 0
        end
        object RptCustContabLabel1: TppLabel
          UserName = 'RptCustContabLabel1'
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
        object RptCustContabDBText12: TppDBText
          UserName = 'RptCustContabDBText12'
          DataField = 'CONTANOME'
          DataPipeline = bdeCustContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeCustContab'
          mmHeight = 3704
          mmLeft = 66675
          mmTop = 1588
          mmWidth = 63500
          BandType = 3
          GroupNo = 0
        end
        object RptCustContabLine3: TppLine
          UserName = 'RptCustContabLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object RptCustContabLine5: TppLine
          UserName = 'RptCustContabLine5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 6615
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object RptCustContabGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object RptCustContabLabel12: TppLabel
          UserName = 'RptCustContabLabel12'
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
        object RptCustContabLabel13: TppLabel
          UserName = 'RptCustContabLabel13'
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
        object RptCustContabDBCalc2: TppDBCalc
          UserName = 'RptCustContabDBCalc2'
          DataField = 'VALOR'
          DataPipeline = bdeCustContab
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = RptCustContabGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeCustContab'
          mmHeight = 3704
          mmLeft = 153723
          mmTop = 1852
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object RptCustContabLine4: TppLine
          UserName = 'RptCustContabLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object RptCustContabGroup2: TppGroup
      BreakName = 'DATA'
      DataPipeline = bdeCustContab
      OutlineSettings.CreateNode = True
      UserName = 'RptCustContabGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeCustContab'
      object RptCustContabGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object RptCustContabDBText2: TppDBText
          UserName = 'RptCustContabDBText2'
          DataField = 'DATA'
          DataPipeline = bdeCustContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'bdeCustContab'
          mmHeight = 3440
          mmLeft = 19844
          mmTop = 1588
          mmWidth = 28575
          BandType = 3
          GroupNo = 1
        end
        object RptCustContabLabel2: TppLabel
          UserName = 'RptCustContabLabel2'
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
        object RptCustContabLine1: TppLine
          UserName = 'RptCustContabLine1'
          Style = lsDouble
          Weight = 0.75
          mmHeight = 2646
          mmLeft = 11377
          mmTop = 5821
          mmWidth = 26194
          BandType = 3
          GroupNo = 1
        end
      end
      object RptCustContabGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object RptCustContabLabel3: TppLabel
          UserName = 'RptCustContabLabel3'
          Caption = 'Total  em '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 111390
          mmTop = 1058
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object RptCustContabDBText3: TppDBText
          UserName = 'RptCustContabDBText3'
          AutoSize = True
          DataField = 'DATA'
          DataPipeline = bdeCustContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'bdeCustContab'
          mmHeight = 3440
          mmLeft = 127529
          mmTop = 1058
          mmWidth = 7938
          BandType = 5
          GroupNo = 1
        end
        object RptCustContabDBCalc1: TppDBCalc
          UserName = 'RptCustContabDBCalc1'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = bdeCustContab
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = RptCustContabGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeCustContab'
          mmHeight = 3175
          mmLeft = 153988
          mmTop = 1058
          mmWidth = 19844
          BandType = 5
          GroupNo = 1
        end
        object RptCustContabLabel4: TppLabel
          UserName = 'RptCustContabLabel4'
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 143669
          mmTop = 1058
          mmWidth = 794
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object CdsCustContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 60
  end
  object SqlParCustContab: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '       M.IDMOV,'
      '       M.CODALMOXTRANSF As ALMOXDESINO,'
      '       M.CODALMOXARIFADO As ALMOXORIGEM,'
      '       M.CODARTIGO,'
      '       A.CODCUSTEIO,'
      '       '#39'                  '#39' As CONTA,'
      '       '#39'                                        '#39' As CONTANOME,'
      '       T.CODCUSTEIO AS CODCUSTRANSF,'
      '       P.DESCPROD AS DESCARTIGO,'
      '       P.CODGRUPOPROD,'
      '       M.DATAMOV As DATA,'
      '       round(M.VALORMOV, 2) As VALOR,'
      '       M.CODCENTROCUSTO,'
      '       M.CODTIPOMOV As CODMOV,'
      '       M.NUMDOCUMENTO,'
      '       TM.DESCRESUMIDA As DESCMOV,'
      '       CC.NOME AS NOMECC'
      '  FROM'
      '       MOVIMENT M,'
      '       ALMOX A,'
      '       PRODUTO P,'
      '       ARTIGO AR,'
      '       ALMOX T,'
      '       TIPOMOV TM,'
      '       CENTCUST CC'
      ' WHERE (M.CODTIPOMOV <> '#39'A'#39')'
      '   AND (M.CODTIPOMOV <> '#39'K'#39')'
      '   AND (M.CODTIPOMOV <> '#39'Z'#39')'
      '   AND (M.DATAMOV BETWEEN :pDataIni AND :pDataFim)'
      '   AND (M.IDPESSOA = :pIdSistema)'
      '   AND (A.CONTABIL = '#39'T'#39')'
      '   AND (M.CODALMOXARIFADO = A.CODALMOXARIFADO)'
      '   AND (M.CODALMOXTRANSF = T.CODALMOXARIFADO(+))'
      '   AND ( (M.CODALMOXTRANSF IS NULL) OR'
      
        '         ( (M.CODALMOXTRANSF IS NOT NULL) AND ( A.CODCUSTEIO <> ' +
        'T.CODCUSTEIO)'
      '            AND ((T.CONTABIL <> '#39'T'#39') OR (T.CONTABIL IS NULL))))'
      '   AND (M.CODTIPOMOV = TM.CODTIPOMOV )'
      '   AND (M.CODARTIGO = AR.CODARTIGO)'
      '   AND (M.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '   AND (M.IDPESSOA = CC.IDEMPRESA)'
      '   AND (AR.CODPRODUTO = P.CODPRODUTO)'
      ' '
      ' ')
    ClientDataSet = CdsCustContab
    Left = 216
    Top = 8
  end
  object SqlAux: TCMSqlParams
    ClientDataSet = CdsAux
    Left = 276
    Top = 8
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 276
    Top = 60
  end
end
