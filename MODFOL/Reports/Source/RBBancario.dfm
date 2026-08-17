inherited RptBBancario: TRptBBancario
  Left = 252
  Top = 183
  Width = 286
  Height = 283
  Caption = 'RptBBancario'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'ListaIdEstab'
        Controle = tcEdit
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
        Name = 'ListaIdEstab'
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
        Caption = 'ListaIdFunc'
        Controle = tcEdit
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
        Name = 'ListaIdFunc'
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
        Caption = 'TipoContrato'
        Controle = tcEdit
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
        Name = 'TipoContrato'
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
        Caption = 'SitFunc'
        Controle = tcEdit
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
        Name = 'SitFunc'
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
        Caption = 'Mes'
        Controle = tcEdit
        TipodeDado = tdInteger
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
        Name = 'Mes'
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
        Caption = 'Ano'
        Controle = tcEdit
        TipodeDado = tdInteger
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
        Name = 'Ano'
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
        Caption = 'IdTipoFolha'
        Controle = tcEdit
        TipodeDado = tdReal
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
        Name = 'IdTipoFolha'
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
        Caption = 'NomeTipoFolha'
        Controle = tcEdit
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
        Name = 'NomeTipoFolha'
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
        Caption = 'Previa'
        Controle = tcEdit
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Previa'
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
        Caption = 'DataCredito'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DataCredito'
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
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpRBBancario
    ConnectionType = cntBDE
  end
  object ppRBBancarioSub: TppBDEPipeline
    DataSource = dsRBBancarioSub
    OpenDataSource = False
    RefreshAfterPost = True
    SkipWhenNoRecords = False
    UserName = 'RBBancarioSub'
    Left = 110
    Top = 61
    object ppRBBancarioSubppField1: TppField
      FieldAlias = 'NUM_FUNC'
      FieldName = 'NUM_FUNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioSubppField2: TppField
      FieldAlias = 'CODAGENCIA'
      FieldName = 'CODAGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioSubppField3: TppField
      FieldAlias = 'NOMEAGENCIA'
      FieldName = 'NOMEAGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioSubppField4: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioSubppField5: TppField
      FieldAlias = 'NUMCONTABANCO'
      FieldName = 'NUMCONTABANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioSubppField6: TppField
      FieldAlias = 'LIQUIDO'
      FieldName = 'LIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object dsRBBancarioSub: TwwDataSource
    DataSet = CdsRBBancarioSub
    Left = 110
    Top = 113
  end
  object rpRBBancario: TppReport
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    CachePages = True
    DeviceType = 'Screen'
    Left = 211
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand5: TppHeaderBand
      BeforePrint = ppHeaderBand5BeforePrint
      mmBottomOffset = 0
      mmHeight = 36777
      mmPrintPosition = 0
      object rpRBBancarioLabel5: TppLabel
        UserName = 'Label1'
        Caption = 'Mês de Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 137584
        mmTop = 25929
        mmWidth = 32279
        BandType = 0
      end
      object rpRBBancarioLabel6: TppLabel
        UserName = 'Label2'
        Caption = 'BORDERÔ BANCÁRIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 76729
        mmTop = 18256
        mmWidth = 28310
        BandType = 0
      end
      object rpTPagamento: TppLabel
        UserName = 'Label3'
        Caption = 'Tipo de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 57679
        mmTop = 25929
        mmWidth = 33073
        BandType = 0
      end
      object rpRBBancarioDBText5: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'EMPRESA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 83873
        mmTop = 1323
        mmWidth = 13758
        BandType = 0
      end
      object rpRBBancarioDBText6: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CGCCPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 59796
        mmTop = 6615
        mmWidth = 11906
        BandType = 0
      end
      object rpRBBancarioDBText7: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'ESTADUALMUNICIPAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 97896
        mmTop = 6615
        mmWidth = 30427
        BandType = 0
      end
      object rpRBBancarioDBText8: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'ENDERECO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 82815
        mmTop = 12171
        mmWidth = 16140
        BandType = 0
      end
      object rpRBBancariolbMes: TppLabel
        UserName = 'Label4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 26194
        mmWidth = 23283
        BandType = 0
      end
      object rpRBBancarioLabel13: TppLabel
        UserName = 'Label5'
        Caption = 'Crédito em:  _____/_____/_______'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 137584
        mmTop = 31485
        mmWidth = 55298
        BandType = 0
      end
      object rpRBBancarioChildReport1Label1: TppLabel
        UserName = 'Label6'
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 157692
        mmTop = 9790
        mmWidth = 13229
        BandType = 0
      end
      object rpRBBancarioChildReport1Calc1: TppCalc
        UserName = 'Calc1'
        CalcType = ctPrintDateTime
        CustomType = dtDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 9790
        mmWidth = 22225
        BandType = 0
      end
      object rpRBBancarioChildReport1Label4: TppLabel
        UserName = 'Label7'
        Caption = 'Página:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 160602
        mmTop = 5556
        mmWidth = 10319
        BandType = 0
      end
      object rpRBBancarioChildReport1Label5: TppLabel
        UserName = 'Label8'
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 1323
        mmWidth = 4233
        BandType = 0
      end
      object rpRBBancarioChildReport1DBText6: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'UF'
        DataPipeline = ppRBBancario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 171715
        mmTop = 1323
        mmWidth = 3704
        BandType = 0
      end
      object rpRBBancarioChildReport1Calc2: TppCalc
        UserName = 'Calc2'
        CalcType = ctPageSetDesc
        CustomType = dtString
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 171715
        mmTop = 5556
        mmWidth = 7408
        BandType = 0
      end
      object rpRBBancarioDBText3: TppDBText
        UserName = 'DBText6'
        BlankWhenZero = True
        DataField = 'DIA_CREDITO'
        DisplayFormat = '00;0 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 160073
        mmTop = 31221
        mmWidth = 7938
        BandType = 0
      end
      object rpRBBancarioDBText4: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'MES_CREDITO'
        DisplayFormat = '00;0 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 31221
        mmWidth = 7938
        BandType = 0
      end
      object rpRBBancarioDBText17: TppDBText
        UserName = 'DBText8'
        BlankWhenZero = True
        DataField = 'ANO_CREDITO'
        DisplayFormat = '0000;0 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 181240
        mmTop = 31221
        mmWidth = 10848
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4200
      mmPrintPosition = 0
      object rpRBBancarioDBText1: TppDBText
        UserName = 'DBText14'
        DataField = 'EMPREGADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 45508
        mmTop = 265
        mmWidth = 96573
        BandType = 4
      end
      object rpRBBancarioDBText2: TppDBText
        UserName = 'DBText15'
        DataField = 'MATRICULA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24077
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object rpRBBancarioDBText11: TppDBText
        UserName = 'DBText16'
        DataField = 'CONTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 143669
        mmTop = 265
        mmWidth = 28310
        BandType = 4
      end
      object rpRBBancarioDBText14: TppDBText
        UserName = 'DBText17'
        DataField = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object rpRBBancarioDBText15: TppDBText
        UserName = 'DBText18'
        DataField = 'LIQUIDO'
        DisplayFormat = '#,0.00;#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 173567
        mmTop = 265
        mmWidth = 23019
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'BANCO'
      NewPage = True
      ResetPageNo = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5200
        mmPrintPosition = 0
        object rpRBBancarioLabel11: TppLabel
          UserName = 'Label9'
          Caption = 'Código do Banco:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 529
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
        object rpRBBancarioDBText9: TppDBText
          UserName = 'DBText9'
          AutoSize = True
          DataField = 'NUMBANCO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3704
          mmLeft = 26988
          mmTop = 529
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object rpRBBancarioLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Banco:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 49213
          mmTop = 529
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object rpRBBancarioDBText10: TppDBText
          UserName = 'DBText10'
          AutoSize = True
          DataField = 'BANCO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4233
          mmLeft = 59531
          mmTop = 529
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object rpRBBancarioSubReport1: TppSubReport
          OnPrint = rpRBBancarioSubReport1Print
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          PrintBehavior = pbSection
          ResetPageNo = False
          TraverseAllData = False
          mmHeight = 3969
          mmLeft = 0
          mmTop = 1058
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpRBBancarioChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppRBBancarioSub
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
            Version = '5.5'
            mmColumnWidth = 0
            object rpRBBancarioChildReport1HeaderBand1: TppHeaderBand
              BeforePrint = rpRBBancarioChildReport1HeaderBand1BeforePrint
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 48419
              mmPrintPosition = 0
              object rpRBBancarioChildReport1LabelCODIGO: TppLabel
                UserName = 'rpRBBancarioChildReport1LabelCODIGO'
                Caption = 'Código'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 2910
                mmTop = 42863
                mmWidth = 9525
                BandType = 0
              end
              object rpRBBancarioChildReport1LabelVALOR: TppLabel
                UserName = 'rpRBBancarioChildReport1LabelVALOR'
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 145257
                mmTop = 42863
                mmWidth = 7673
                BandType = 0
              end
              object rpRBBancarioChildReport1LabelNUMFUNC: TppLabel
                UserName = 'rpRBBancarioChildReport1LabelNUMFUNC'
                Caption = 'Número de Funcionários'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 160073
                mmTop = 42863
                mmWidth = 35719
                BandType = 0
              end
              object rpRBBancarioChildReport1LabelAGENCIA: TppLabel
                UserName = 'rpRBBancarioChildReport1LabelAGENCIA'
                Caption = 'Agência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 30692
                mmTop = 42863
                mmWidth = 11642
                BandType = 0
              end
              object rpRBBancarioChildReport1DBText3: TppDBText
                UserName = 'rpRBBancarioChildReport1DBText3'
                DataField = 'BANCO'
                DataPipeline = ppRBBancario
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 64558
                mmTop = 16933
                mmWidth = 129911
                BandType = 0
              end
              object rpRBBancarioChildReport1Label6: TppLabel
                UserName = 'rpRBBancarioChildReport1Label6'
                AutoSize = False
                Caption = 'Banco:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 49213
                mmTop = 16933
                mmWidth = 14288
                BandType = 0
              end
              object rpRBBancarioChildReport1DBText4: TppDBText
                UserName = 'rpRBBancarioChildReport1DBText4'
                DataField = 'NUMBANCO'
                DataPipeline = ppRBBancario
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 29633
                mmTop = 16933
                mmWidth = 18521
                BandType = 0
              end
              object rpRBBancarioChildReport1Label7: TppLabel
                UserName = 'rpRBBancarioChildReport1Label7'
                AutoSize = False
                Caption = 'Código Banco:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 2910
                mmTop = 16933
                mmWidth = 25665
                BandType = 0
              end
              object rpRBBancarioChildReport1DBText5: TppDBText
                UserName = 'rpRBBancarioChildReport1DBText5'
                AutoSize = True
                DataField = 'EMPRESA'
                DataPipeline = ppRBBancario
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 91811
                mmTop = 1323
                mmWidth = 13758
                BandType = 0
              end
              object rpRBBancarioChildReport1LabelMESDE: TppLabel
                UserName = 'rpRBBancarioChildReport1LabelMESDE'
                Caption = 'Relação de Créditos por Agência do mês de '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 51329
                mmTop = 8996
                mmWidth = 74877
                BandType = 0
              end
              object rpRBBancarioChildReport1Memo1: TppMemo
                UserName = 'rpRBBancarioChildReport1Memo1'
                Caption = 'rpRBBancarioChildReport1Memo1'
                CharWrap = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'MS Sans Serif'
                Font.Size = 10
                Font.Style = []
                Lines.Strings = (
                  
                    'Solicitamos à V. Sa., efetuar através de suas agências abaixo re' +
                    'lacionadas créditos em conta-corrente conforme relações anexas n' +
                    'umeradas debitando os respectivos valores em nossa conta nº')
                Stretch = True
                Transparent = True
                mmHeight = 9790
                mmLeft = 9260
                mmTop = 29104
                mmWidth = 178859
                BandType = 0
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
              object rpRBBancarioChildReport1Line1: TppLine
                UserName = 'rpRBBancarioChildReport1Line1'
                Pen.Width = 2
                Weight = 1.5
                mmHeight = 1058
                mmLeft = 2117
                mmTop = 47890
                mmWidth = 193940
                BandType = 0
              end
              object rpRBBancarioChildReport1Label8: TppLabel
                UserName = 'rpRBBancarioChildReport1Label8'
                Caption = 'Emissão:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 157692
                mmTop = 9790
                mmWidth = 13229
                BandType = 0
              end
              object rpRBBancarioChildReport1Label9: TppLabel
                UserName = 'rpRBBancarioChildReport1Label9'
                Caption = 'Página:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 160602
                mmTop = 5556
                mmWidth = 10319
                BandType = 0
              end
              object rpRBBancarioChildReport1Label10: TppLabel
                UserName = 'rpRBBancarioChildReport1Label10'
                Caption = 'UF:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 166688
                mmTop = 1323
                mmWidth = 4233
                BandType = 0
              end
              object rpRBBancarioChildReport1DBText7: TppDBText
                UserName = 'rpRBBancarioChildReport1DBText7'
                AutoSize = True
                DataField = 'UF'
                DataPipeline = ppRBBancario
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 171715
                mmTop = 1323
                mmWidth = 3704
                BandType = 0
              end
              object rpRBBancarioChildReport1Label11: TppLabel
                UserName = 'rpRBBancarioChildReport1Label11'
                Caption = 'de'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 176477
                mmTop = 5556
                mmWidth = 3175
                BandType = 0
              end
              object rpRBBancarioChildReport1DBText8: TppDBText
                UserName = 'rpRBBancarioChildReport1DBText8'
                DataField = 'NUMCONTABANCO'
                DataPipeline = ppRBBancarioSub
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'MS Sans Serif'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 139700
                mmTop = 33073
                mmWidth = 47361
                BandType = 0
              end
              object rpRBBancarioChildReport1Calc3: TppSystemVariable
                UserName = 'rpRBBancarioChildReport1Calc3'
                VarType = vtPrintDateTime
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 171715
                mmTop = 9790
                mmWidth = 22225
                BandType = 0
              end
              object rpRBBancarioChildReport1Calc6: TppSystemVariable
                UserName = 'rpRBBancarioChildReport1Calc6'
                VarType = vtPageCount
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 171715
                mmTop = 5556
                mmWidth = 1588
                BandType = 0
              end
              object rpRBBancarioChildReport1Calc4: TppSystemVariable
                UserName = 'rpRBBancarioChildReport1Calc4'
                VarType = vtPageCount
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 180711
                mmTop = 5556
                mmWidth = 1588
                BandType = 0
              end
              object ppLabel1: TppLabel
                UserName = 'Label1'
                AutoSize = False
                Caption = 'Código Agência:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 2910
                mmTop = 21696
                mmWidth = 25665
                BandType = 0
              end
              object ppDBText1: TppDBText
                UserName = 'DBText1'
                DataField = 'CODAGENCIA_BANCO'
                DataPipeline = ppRBBancarioSub
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 29633
                mmTop = 21696
                mmWidth = 18521
                BandType = 0
              end
              object ppLabel2: TppLabel
                UserName = 'Label2'
                AutoSize = False
                Caption = 'Agência:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 49213
                mmTop = 21696
                mmWidth = 14288
                BandType = 0
              end
              object ppDBText2: TppDBText
                UserName = 'DBText2'
                DataField = 'NOMEAGENCIA_BANCO'
                DataPipeline = ppRBBancarioSub
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 64558
                mmTop = 21696
                mmWidth = 129911
                BandType = 0
              end
            end
            object rpRBBancarioChildReport1DetailBand1: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object rpRBBancarioChildReport1FooterBand1: TppFooterBand
              Visible = False
              mmBottomOffset = 0
              mmHeight = 4233
              mmPrintPosition = 0
            end
            object rpRBBancarioChildReport1SummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 43127
              mmPrintPosition = 0
              object rpRBBancarioChildReport1LabelVALTOT: TppLabel
                UserName = 'rpRBBancarioChildReport1LabelVALTOT'
                Caption = 'Valor Total:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 109009
                mmTop = 1323
                mmWidth = 16404
                BandType = 7
              end
              object rpRBBancarioChildReport1DBCalc3: TppDBCalc
                UserName = 'rpRBBancarioChildReport1DBCalc3'
                OnGetText = rpRBBancarioChildReport1DBCalc3GetText
                DataField = 'LIQUIDO'
                DataPipeline = ppRBBancarioSub
                DisplayFormat = '#,0.00;#,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'MS Sans Serif'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 128059
                mmTop = 1588
                mmWidth = 25135
                BandType = 7
              end
              object rpRBBancarioChildReport1Line2: TppLine
                UserName = 'rpRBBancarioChildReport1Line2'
                Pen.Width = 2
                Weight = 1.5
                mmHeight = 1058
                mmLeft = 1852
                mmTop = 17463
                mmWidth = 193940
                BandType = 7
              end
              object rpRBBancarioChildReport1Line3: TppLine
                UserName = 'rpRBBancarioChildReport1Line3'
                Weight = 0.75
                mmHeight = 1058
                mmLeft = 17198
                mmTop = 35454
                mmWidth = 49742
                BandType = 7
              end
              object rpRBBancarioChildReport1Line4: TppLine
                UserName = 'rpRBBancarioChildReport1Line4'
                Weight = 0.75
                mmHeight = 1058
                mmLeft = 129117
                mmTop = 35454
                mmWidth = 49742
                BandType = 7
              end
              object rpRBBancarioChildReport1Label2: TppLabel
                UserName = 'rpRBBancarioChildReport1Label2'
                Caption = 'Diretor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 36248
                mmTop = 37835
                mmWidth = 10054
                BandType = 7
              end
              object rpRBBancarioChildReport1Label3: TppLabel
                UserName = 'rpRBBancarioChildReport1Label3'
                Caption = 'Diretor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 149490
                mmTop = 37835
                mmWidth = 10054
                BandType = 7
              end
              object rpRBBancarioChildReport1Line5: TppLine
                UserName = 'rpRBBancarioChildReport1Line5'
                Weight = 1
                mmHeight = 1058
                mmLeft = 2117
                mmTop = 0
                mmWidth = 193940
                BandType = 7
              end
              object rpRBBancarioChildReport1Extenso: TppLabel
                OnPrint = rpRBBancarioChildReport1ExtensoPrint
                UserName = 'rpRBBancarioChildReport1Extenso'
                AutoSize = False
                Caption = 'rpRBBancarioChildReport1Extenso'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                WordWrap = True
                mmHeight = 7673
                mmLeft = 1852
                mmTop = 6350
                mmWidth = 151342
                BandType = 7
              end
              object rpRBBancarioChildReport1DBCalc5: TppDBCalc
                UserName = 'rpRBBancarioChildReport1DBCalc5'
                DataField = 'NUM_FUNC'
                DataPipeline = ppRBBancarioSub
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'MS Sans Serif'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3440
                mmLeft = 159015
                mmTop = 1588
                mmWidth = 35719
                BandType = 7
              end
            end
            object rpRBBancarioChildReport1Group1: TppGroup
              BreakName = 'CODAGENCIA'
              DataPipeline = ppRBBancarioSub
              UserName = 'rpRBBancarioChildReport1Group1'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              object rpRBBancarioChildReport1GroupHeaderBand1: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object rpRBBancarioChildReport1GroupFooterBand1: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 5292
                mmPrintPosition = 0
                object rpRBBancarioChildReport1DBText1: TppDBText
                  UserName = 'rpRBBancarioChildReport1DBText1'
                  DataField = 'CODAGENCIA'
                  DataPipeline = ppRBBancarioSub
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'MS Sans Serif'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 1852
                  mmTop = 1058
                  mmWidth = 23813
                  BandType = 5
                  GroupNo = 0
                end
                object rpRBBancarioChildReport1DBText2: TppDBText
                  UserName = 'rpRBBancarioChildReport1DBText2'
                  DataField = 'NOMEAGENCIA'
                  DataPipeline = ppRBBancarioSub
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'MS Sans Serif'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 30427
                  mmTop = 1058
                  mmWidth = 95250
                  BandType = 5
                  GroupNo = 0
                end
                object rpRBBancarioChildReport1DBCalc1: TppDBCalc
                  UserName = 'rpRBBancarioChildReport1DBCalc1'
                  DataField = 'LIQUIDO'
                  DataPipeline = ppRBBancarioSub
                  DisplayFormat = '#,0.00;#,0.00'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'MS Sans Serif'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  ResetGroup = rpRBBancarioChildReport1Group1
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 128323
                  mmTop = 1058
                  mmWidth = 24871
                  BandType = 5
                  GroupNo = 0
                end
                object rpRBBancarioChildReport1DBText9: TppDBText
                  UserName = 'rpRBBancarioChildReport1DBText9'
                  DataField = 'NUM_FUNC'
                  DataPipeline = ppRBBancarioSub
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'MS Sans Serif'
                  Font.Size = 8
                  Font.Style = []
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 159015
                  mmTop = 1058
                  mmWidth = 35719
                  BandType = 5
                  GroupNo = 0
                end
              end
            end
          end
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'BANCO'
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 28575
        mmPrintPosition = 0
        object rpRBBancarioMemo1: TppMemo
          UserName = 'Memo1'
          Caption = 'VALOR A SER DEPOSITADO R$:'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Lines.Strings = (
            'VALOR A SER DEPOSITADO R$:')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 7673
          mmLeft = 3704
          mmTop = 7408
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpRBBancarioDBCalc2: TppDBCalc
          UserName = 'DBCalc1'
          OnGetText = rpRBBancarioDBCalc2GetText
          AutoSize = True
          DataField = 'LIQUIDO'
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 32015
          mmTop = 7408
          mmWidth = 22490
          BandType = 5
          GroupNo = 1
        end
        object rpRBBancarioExtenso: TppLabel
          OnPrint = rpRBBancarioExtensoPrint
          UserName = 'Label19'
          AutoSize = False
          Caption = 'rpRBBancarioExtenso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 7673
          mmLeft = 60590
          mmTop = 7408
          mmWidth = 133086
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'NOMEAGENCIA'
      KeepTogether = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 17198
        mmPrintPosition = 0
        object rpRBBancarioLabel7: TppLabel
          UserName = 'Label11'
          Caption = 'CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 12171
          mmWidth = 5556
          BandType = 3
          GroupNo = 2
        end
        object rpRBBancarioLabel8: TppLabel
          UserName = 'Label12'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 45508
          mmTop = 12171
          mmWidth = 8467
          BandType = 3
          GroupNo = 2
        end
        object rpRBBancarioLabel9: TppLabel
          UserName = 'Label13'
          Caption = 'Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 143669
          mmTop = 12171
          mmWidth = 8467
          BandType = 3
          GroupNo = 2
        end
        object rpRBBancarioLabel12: TppLabel
          UserName = 'Label14'
          Caption = 'Endereço:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 10583
          mmTop = 6879
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
        object rpRBBancarioLabel2: TppLabel
          UserName = 'Label15'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 24077
          mmTop = 12171
          mmWidth = 13229
          BandType = 3
          GroupNo = 2
        end
        object rpRBBancarioLabel3: TppLabel
          UserName = 'Label16'
          Caption = 'Código Agência :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 2381
          mmTop = 2646
          mmWidth = 22754
          BandType = 3
          GroupNo = 2
        end
        object rpRBBancarioLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Valor Creditado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 173832
          mmTop = 12171
          mmWidth = 22754
          BandType = 3
          GroupNo = 2
        end
        object rpRBBancarioDBText13: TppDBText
          UserName = 'DBText11'
          AutoSize = True
          DataField = 'ENDERECOAGENCIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 26194
          mmTop = 6879
          mmWidth = 28840
          BandType = 3
          GroupNo = 2
        end
        object rpRBBancarioDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'CODAGENCIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 26194
          mmTop = 2910
          mmWidth = 17727
          BandType = 3
          GroupNo = 2
        end
        object rpRBBancarioLabel1: TppLabel
          UserName = 'Label18'
          Caption = 'Agência :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 45244
          mmTop = 2910
          mmWidth = 13229
          BandType = 3
          GroupNo = 2
        end
        object rpRBBancarioDBText16: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'NOMEAGENCIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 59267
          mmTop = 2910
          mmWidth = 21167
          BandType = 3
          GroupNo = 2
        end
        object rpRBBancarioLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 794
          mmTop = 16669
          mmWidth = 195792
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'EMPREGADO'
      KeepTogether = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppRBBancario: TppBDEPipeline
    DataSource = dsRBBancario
    OpenDataSource = False
    RefreshAfterPost = True
    SkipWhenNoRecords = False
    UserName = 'RBBancario'
    Left = 211
    Top = 61
    object ppRBBancarioppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField2: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField3: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField4: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField5: TppField
      FieldAlias = 'CPF'
      FieldName = 'CPF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField6: TppField
      FieldAlias = 'CODAGENCIA'
      FieldName = 'CODAGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField7: TppField
      FieldAlias = 'NOMEAGENCIA'
      FieldName = 'NOMEAGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField8: TppField
      FieldAlias = 'CONTA'
      FieldName = 'CONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField9: TppField
      FieldAlias = 'DIA_CREDITO'
      FieldName = 'DIA_CREDITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField10: TppField
      FieldAlias = 'MES_CREDITO'
      FieldName = 'MES_CREDITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField11: TppField
      FieldAlias = 'ANO_CREDITO'
      FieldName = 'ANO_CREDITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField12: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField13: TppField
      FieldAlias = 'BANCO'
      FieldName = 'BANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField14: TppField
      FieldAlias = 'ESTADUALMUNICIPAL'
      FieldName = 'ESTADUALMUNICIPAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField15: TppField
      FieldAlias = 'CGCCPF'
      FieldName = 'CGCCPF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField16: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField17: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField18: TppField
      FieldAlias = 'ENDERECOAGENCIA'
      FieldName = 'ENDERECOAGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField19: TppField
      FieldAlias = 'LIQUIDO'
      FieldName = 'LIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField20: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppRBBancarioppField21: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
  end
  object dsRBBancario: TwwDataSource
    DataSet = CdsRBBancario
    Left = 211
    Top = 113
  end
  object sqlRBBancario: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'1234567890123'#39' AS MATRICULA,'
      '  LPAD('#39'1'#39',60,'#39'1'#39') AS EMPRESA,'
      '  LPAD('#39'1'#39',60,'#39'1'#39') AS EMPREGADO,'
      '  LPAD('#39'1'#39',18,'#39'1'#39') AS CPF,'
      '  '#39'123456789012345'#39' AS CODAGENCIA ,'
      '  LPAD('#39'1'#39',60,'#39'1'#39') NOMEAGENCIA,'
      '  '#39'123456789012345'#39' AS CONTA,'
      '  0 AS DIA_CREDITO,'
      '  0 AS MES_CREDITO,'
      '  0 AS ANO_CREDITO,'
      '  '#39'1234567890'#39' NUMBANCO,'
      '  LPAD('#39'1'#39',60,'#39'1'#39') AS BANCO,'
      '  LPAD('#39'1'#39',18,'#39'1'#39') AS ESTADUALMUNICIPAL,'
      '  LPAD('#39'1'#39',18,'#39'1'#39') AS CGCCPF,'
      '  '#39'123'#39' AS UF,'
      '  LPAD('#39'1'#39',300,'#39'1'#39') AS ENDERECO,'
      '  LPAD('#39'1'#39',300,'#39'1'#39') AS ENDERECOAGENCIA,'
      '  0 AS LIQUIDO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsRBBancario
    Left = 212
    Top = 208
  end
  object CdsRBBancario: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsRBBancarioIndex1'
        Fields = 'BANCO;NOMEAGENCIA;EMPREGADO'
      end>
    IndexName = 'CdsRBBancarioIndex1'
    Params = <>
    StoreDefs = True
    AfterScroll = CdsRBBancarioAfterScroll
    Left = 212
    Top = 160
  end
  object sqlRBBancarioSub: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  0 AS NUM_FUNC,'
      '  '#39'123456789012345'#39' AS CODAGENCIA_BANCO,'
      '  LPAD('#39'1'#39',60,'#39'1'#39') AS NOMEAGENCIA_BANCO,'
      '  '#39'123456789012345'#39' AS CODAGENCIA,'
      '  LPAD('#39'1'#39',60,'#39'1'#39') AS NOMEAGENCIA,'
      '  '#39'123456789012345'#39' AS NUMBANCO,'
      '  '#39'123456789012345'#39' AS NUMCONTABANCO,'
      '  0 AS LIQUIDO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsRBBancarioSub
    Left = 108
    Top = 208
  end
  object CdsRBBancarioSub: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 108
    Top = 160
  end
  object ExtensoCM: TExtensoCM
    DescricaoMoeda.Singular = 'Real'
    DescricaoMoeda.Plural = 'Reais'
    TamanhoLinha = 0
    Idioma = iePortugues
    CompletaExtenso = False
    Left = 24
    Top = 72
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  0 AS NUM_FUNC,'
      '  '#39'123456789012345'#39' AS CODAGENCIA,'
      '  LPAD('#39'1'#39',60,'#39'1'#39') AS NOMEAGENCIA,'
      '  '#39'123456789012345'#39' AS NUMBANCO,'
      '  '#39'123456789012345'#39' AS NUMCONTABANCO,'
      '  0 AS LIQUIDO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsAux
    Left = 24
    Top = 192
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 24
    Top = 144
  end
end
