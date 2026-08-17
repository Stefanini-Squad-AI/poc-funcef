inherited RptPPP: TRptPPP
  Left = 154
  Top = 174
  Width = 541
  Height = 239
  Caption = 'RptPPP'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'NomeAssinante'
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
        Name = 'NomeAssinante'
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
        Caption = 'DataInicial'
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
        Caption = 'DataFinal'
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
        Caption = 'CargoAssinante'
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
        Name = 'CargoAssinante'
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
        Caption = 'Observacao'
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
        Name = 'Observacao'
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
        Caption = 'ImprimirSecao3'
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
        Name = 'ImprimirSecao3'
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
    Left = 213
  end
  inherited DevRptCM: TExtraOptions
    Left = 97
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpPPP
    Left = 156
  end
  object dsPPP: TwwDataSource
    AutoEdit = False
    DataSet = sqlPPP
    Left = 299
    Top = 109
  end
  object ppPPP: TppBDEPipeline
    DataSource = dsPPP
    OpenDataSource = False
    UserName = 'PPP'
    Left = 298
    Top = 57
    object ppPPPppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppPPPppField2: TppField
      FieldAlias = 'CNAE'
      FieldName = 'CNAE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppPPPppField3: TppField
      FieldAlias = 'ASSINANTE'
      FieldName = 'ASSINANTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppPPPppField4: TppField
      FieldAlias = 'CARGOASSINANTE'
      FieldName = 'CARGOASSINANTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppPPPppField5: TppField
      FieldAlias = 'COORDENADOR'
      FieldName = 'COORDENADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppPPPppField6: TppField
      FieldAlias = 'PERIODO'
      FieldName = 'PERIODO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppPPPppField7: TppField
      FieldAlias = 'REGIME'
      FieldName = 'REGIME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppPPPppField8: TppField
      FieldAlias = 'BRPDH'
      FieldName = 'BRPDH'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppPPPppField9: TppField
      FieldAlias = 'CODCNAE'
      FieldName = 'CODCNAE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppPPPppField10: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppPPPppField11: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppPPPppField12: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppPPPppField13: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppPPPppField14: TppField
      FieldAlias = 'SEXO'
      FieldName = 'SEXO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppPPPppField15: TppField
      FieldAlias = 'NOMECENTROCUSTO'
      FieldName = 'NOMECENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppPPPppField16: TppField
      FieldAlias = 'TITULO'
      FieldName = 'TITULO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppPPPppField17: TppField
      FieldAlias = 'IDCARGO'
      FieldName = 'IDCARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppPPPppField18: TppField
      FieldAlias = 'DATACARGO'
      FieldName = 'DATACARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppPPPppField19: TppField
      FieldAlias = 'CGC'
      FieldName = 'CGC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppPPPppField20: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppPPPppField21: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppPPPppField22: TppField
      FieldAlias = 'JORNADAMENSAL'
      FieldName = 'JORNADAMENSAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppPPPppField23: TppField
      FieldAlias = 'CTPS'
      FieldName = 'CTPS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppPPPppField24: TppField
      FieldAlias = 'NIT'
      FieldName = 'NIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
  end
  object rpPPP: TppReport
    AutoStop = False
    DataPipeline = ppPPP
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 297
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object rpPPPHdrBand: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 14288
        mmLeft = 4498
        mmTop = 2647
        mmWidth = 188119
        BandType = 0
      end
      object rpGPSImage1: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D617036420000424D364200000000000036000000280000005800
          0000400000000100180000000000004200000000000000000000000000000000
          0000A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06BC8646BC8646BC8646BC8646BC8646
          BC8646BC8646BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06BC8646D2AD82D2AD82E5D7C1F3EBE0FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EBE0E9E2CF
          DFC8AADFC8AABC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06D2AD82E5D7C1F7F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFE9E2CFE5D7C1E5D7C1E5D7C1E5D7C1E5D7C1F7F6F1FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F1E5D7C1BC8646BC8646
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06BC8646DFC8AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E2CFB2C78FB2C78F
          85A84F4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F800185A84F85A84FB2C78FB2C78FE5D7C1F7F6F1FFFFFFFFFFFFFF
          FFFFFFFFFFF7F6F1E9E2CFDFC8AABC8646A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06BC8646E9E2CFFFFFFFFFFFFFFFFFFFF7F6F1B2C78F85A84F4F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          0185A84FB2C78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F1E9E2CFD2AD82BC
          8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFE5D7C185A84F4F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          B2C78FE5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE9E2CFBC8646A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06BC8646F7F6F1FFFFFFFFFFFFE5D7C185A84F4F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          8001B2C78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFDAF2FDDAF2FDFFFFFFFFFFFFFFFFFFE5D7C1BC8646A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06D2AD82F7F6F1FFFFFFF7F6F185A84F4F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F8001B2C78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8646BC8646BC8646BC
          8646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCE8FD2FB8FD7CD2FDBCE8FDFFFFFF
          FFFFFFFFFFFFE5D7C1BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFFFFFFFE9E2
          CF4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F8001E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2F
          B8FD2FB8FD7CD2FDBCE8FDFFFFFFFFFFFFFFFFFFDFC8AABC8646A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06BC8646FFFFFF
          FFFFFFB2C78F4F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F800185A84FF7F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDDAF2FDFFFFFFFFFFFFF7
          F6F1D2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06F7F6F1FFFFFFE5D7C14F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F800185A84FF7F6F1F3EBE0D2AD82D2AD82BC
          8646FFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06D2AD82FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD7CD2FDDAF2FDFFFFFFFFFFFFE9E2CFBC8646A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06E5D7C1FFFFFFF3EBE04F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F800185A84FF7F6F1FFFFFFBC86
          46A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A5
          5C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFFFFFFFFFFD2AD82A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06BC8646FFFFFFFFFFFF85A84F4F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F8001F3EBE0
          FFFFFFFFFFFFBC8646BC8646BC8646DFC8AAE5D7C1E5D7C1DFC8AAD2AD82E9E2
          CFE5D7C1E5D7C1D2AD82DFC8AAF3EBE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C
          D2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDDAF2FD
          FFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06DFC8AAFFFFFFE5D7C14F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          8001E9E2CFE5D7C1D2AD82E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06
          A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFD2AD82A55C06A55C06BC86
          46E9E2CFFFFFFFFFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFFFFF7F6F1BC8646A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFF
          FFFF85A84F4F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F8001B2C78FA55C06A55C06A55C06F3EBE0FFFFFFFFFFFFFFFFFFFF
          FFFFA55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFD2AD82
          A55C06A55C06A55C06D2AD82FFFFFFFFFFFFBCE8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDF7F6F1FFFFFFFFFFFFD2
          AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06BC8646FFFFFFF7F6F14F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F800185A84FDFC8AAA55C06A55C06A55C06FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFA55C06BC8646BC8646BC8646E9E2CFFFFFFFFFFFFFFF
          FFFFFFFFFFE5D7C1A55C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFBCE8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FDBCE8FDFFFFFFFFFFFFD2AD82A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06D2AD82FFFFFFDFC8AA4F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F800185A84FF7F6F1BC8646BC8646D2AD82
          DFC8AAE9E2CFDFC8AAD2AD82D2AD82F3EBE0FFFFFFFFFFFFFFFFFFFFFFFFE9E2
          CFBC8646D2AD82D2AD82D2AD82F3EBE0FFFFFFE9E2CFE5D7C1E9E2CFFFFFFFFF
          FFFFFFFFFFFFFFFF7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFFFFFFFDFC8AAA55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFB2C78F4F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F8001F7F6F1FFFFFFBC
          8646BC8646A55C06D2AD82A55C06A55C06A55C06A55C06E9E2CFFFFFFFFFFFFF
          FFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFF
          FFFFFFFFD2AD82A55C06BC8646BC8646FFFFFF7CD2FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFFFF
          DFC8AAA55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06DFC8AAFFFFFFB2
          C78F4F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001E9E2
          CFFFFFFFFFFFFFA55C06A55C06A55C06D2AD82A55C06A55C06A55C06A55C06FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06E5D7C1
          FFFFFFFFFFFFFFFFFFFFFFFFD2AD82A55C06A55C06A55C06F7F6F1FFFFFFBCE8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD7CD2FDFFFFFFFFFFFFDFC8AAA55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06DFC8AAFFFFFF85A84F4F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F8001E9E2CFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06D2AD82A55C06A55C
          06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A5
          5C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFDFC8AAA55C06A55C06A55C06
          E5D7C1FFFFFFFFFFFFBCE8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFFFFD2AD82A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06DFC8AAFFFFFFB2C78F4F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F800185A84FE9E2CFFFFFFFFFFFFFFFFFFFDFC8AABC8646BC8646BC8646
          E5D7C1D2AD82D2AD82E5D7C1D2AD82F7F6F1E5D7C1E5D7C1E5D7C1E5D7C1F3EB
          E0E5D7C1E5D7C1E5D7C1E5D7C1F7F6F1FFFFFFFFFFFFFFFFFFFFFFFFE9E2CFBC
          8646BC8646A55C06DFC8AAFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFF
          FFD2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06DFC8AAFFFFFFB2C78F4F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F8001B2C78FF7F6F1FFFFFFF3EBE0E5D7C1D2AD82F3EBE0FF
          FFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06D2AD82A55C06A55C06
          A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8646A55C06A55C
          06A55C06E5D7C1BC8646BC8646D2AD82E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFDA
          F2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FDBCE8FDFFFFFFFFFFFFBC8646A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFB2
          C78F4F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F800185A84FF3EBE0FFFFFFFFFFFFFFFFFFBC8646A55C
          06A55C06FFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06D2
          AD82A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BC8646A55C06A55C06A55C06E5D7C1A55C06A55C06A55C06D2AD82FFFFFFFFFF
          FFFFFFFFBC8646D2AD82FFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FDDAF2FDFFFFFFF7F6F1A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06D2AD82FFFFFFE5D7C14F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F8001B2C78FE9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFBC8646A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C
          06A55C06A55C06D2AD82A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBC8646A55C06A55C06A55C06DFC8AAA55C06A55C06A55C06
          D2AD82FFFFFFFFFFFFFFFFFFBC8646A55C06FFFFFFFFFFFF2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDF7F6F1FFFFFFDF
          C8AAA55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06BC8646FFFFFFFFFFFF4F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F8001FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFF
          DFC8AAA55C06A55C06A55C06BC8646D2AD82A55C06A55C06A55C06A55C06E5D7
          C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8646A55C06A55C06A55C06D2AD82A5
          5C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFBC8646A55C06E9E2CFFFFFFF
          FFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD7CD2FDFFFFFFFFFFFFBC8646A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06F7F6F1FFFFFF85A84F4F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F8001FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2AD82D2AD82E9E2CFFFFFFFFF
          FFFFF3EBE0E9E2CFE9E2CFD2AD82E5D7C1E5D7C1E9E2CFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE5D7C1E5D7C1E5D7C1E5D7C1F3EBE0DFC8AAD2AD82D2AD
          82D2AD82E9E2CFE5D7C1E5D7C1E5D7C1DFC8AAFFFFFFFFFFFFFFFFFFD2AD82BC
          8646E5D7C1FFFFFFFFFFFFDAF2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFF3EBE0A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06DFC8AAFF
          FFFFDFC8AA4F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F8001E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFE9E2CFBC8646BC8646FFFFFFFFFF
          FFFFFFFFBC8646A55C06A55C06BC8646D2AD82A55C06A55C06A55C06BC8646FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A55C06A55C06D2AD82
          BC8646A55C06A55C06A55C06D2AD82FFFFFFFFFFFFFFFFFFFFFFFFBC8646A55C
          06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7CD2FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDFFFFFFFFFFFFD2AD82
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06BC8646FFFFFFFFFFFF4F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F8001B2C78FFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06
          BC8646FFFFFFFFFFFFFFFFFFBC8646A55C06A55C06BC8646D2AD82A55C06A55C
          06A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A5
          5C06A55C06D2AD82BC8646A55C06A55C06A55C06D2AD82FFFFFFFFFFFFFFFFFF
          FFFFFFBC8646A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDBC
          E8FDFFFFFFF3EBE0A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06F3EBE0FFFFFFB2C78F4F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F8001F7F6F1FFFFFFFFFFFFFF
          FFFFE5D7C1A55C06BC8646FFFFFFFFFFFFFFFFFFBC8646A55C06A55C06BC8646
          D2AD82A55C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFA55C06A55C06A55C06A55C06D2AD82BC8646A55C06A55C06A55C06D2AD82FF
          FFFFFFFFFFFFFFFFFFFFFFBC8646A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FDFFFFFFFFFFFFBC8646A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFFFFFFF
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001B2C7
          8FFFFFFFFFFFFFFFFFFFF3EBE0BC8646D2AD82FFFFFFFFFFFFFFFFFFBC8646A5
          5C06A55C06BC8646D2AD82A55C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFA55C06A55C06A55C06A55C06D2AD82BC8646A55C06A55C
          06A55C06D2AD82FFFFFFFFFFFFFFFFFFFFFFFFBC8646A55C06A55C06E5D7C1FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFDFC8AAA55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06F3EBE0FFFFFFDFC8AA4F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F8001E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2AD82DFC8
          AAE9E2CFFFFFFFFFFFFFFFFFFFFFFFFFF3EBE0E5D7C1E5D7C1E5D7C1F7F6F1F3
          EBE0E5D7C1E5D7C1E5D7C1F7F6F1FFFFFFE5D7C1E5D7C1E5D7C1E5D7C1F3EBE0
          E5D7C1D2AD82D2AD82D2AD82E5D7C1E5D7C1E5D7C1E5D7C1E9E2CFFFFFFFFFFF
          FFFFFFFFD2AD82BC8646E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFF
          F7F6F1A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06BC8646FFFFFFFFFFFF85A84F4F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F8001F7F6F1FFFFFFFFFFFFFFFFFF
          FFFFFFA55C06A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFD2AD82A55C06A55C
          06A55C06BC8646D2AD82A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFA55C06A55C06A55C06A55C06DFC8AAA55C06A55C06A55C06
          BC8646FFFFFFFFFFFFFFFFFFBC8646A55C06E9E2CFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FDFFFFFFFFFFFFBC8646A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06DFC8AAFFFFFFF7F6F14F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F800185A84FF7
          F6F1FFFFFFFFFFFFFFFFFFBC8646A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFF
          E5D7C1A55C06A55C06A55C06A55C06E5D7C1A55C06A55C06A55C06A55C06E5D7
          C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A55C06A55C06E5D7C1A5
          5C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFA55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFDAF2FDBCE8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFD2AD82A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          F7F6F1FFFFFFE9E2CF4F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F800185A84FF7F6F1FFFFFFFFFFFFD2AD82A55C06BC8646FFFFFFFF
          FFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06E5D7C1A55C06A55C06
          A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A55C
          06A55C06E5D7C1A55C06A55C06A55C06D2AD82FFFFFFFFFFFFFFFFFFBC8646D2
          AD82FFFFFFDAF2FD7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFD2AD82A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06BC8646FFFFFFFFFFFFB2C78F4F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F800185A84FE9E2CFFFFFFFFFFFFFFFFF
          FFF3EBE0FFFFFFFFFFFFFFFFFFFFFFFFE9E2CFBC8646A55C06A55C06A55C06E5
          D7C1A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          A55C06A55C06A55C06A55C06DFC8AABC8646BC8646D2AD82E5D7C1FFFFFFE9E2
          CFF3EBE0FFFFFFFFFFFF7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FD
          FFFFFFD2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFFFFFFF85A84F4F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          E9E2CFFFFFFFFFFFFFFFFFFFE5D7C1A55C06BC8646BC8646DFC8AAD2AD82D2AD
          82D2AD82E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFF7F6F1F7F6F1E5D7C1E5D7C1E5
          D7C1E5D7C1F7F6F1E5D7C1E5D7C1D2AD82D2AD82F3EBE0FFFFFFFFFFFFFFFFFF
          F3EBE0A55C06A55C06D2AD82DAF2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD7CD2FDFFFFFFDFC8AAA55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD
          82FFFFFFFFFFFF85A84F4F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F8001B2C78FFFFFFFFFFFFFE9E2CFA55C06A55C06A55C06
          DFC8AAA55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6
          F1A55C06A55C06A55C06A55C06E5D7C1A55C06A55C06A55C06A55C06FFFFFFFF
          FFFFFFFFFFFFFFFFE5D7C1A55C06A55C06E5D7C12FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFDFC8AAA55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06DFC8AAFFFFFFFFFFFF85A84F4F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F8001B2C78FFFFFFFFFFFFFA5
          5C06A55C06A55C06D2AD82A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06E5D7C1A55C06A55C06A55C
          06A55C06FFFFFFFFFFFFFFFFFFFFFFFFD2AD82A55C06BC86462FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFDFC8AAA55C
          06A55C06A55C06A55C06D2AD82A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06DFC8AAFFFFFFFFFFFF85A84F
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          01B2C78FFFFFFFBC8646BC8646A55C06D2AD82BC8646A55C06A55C06A55C06F3
          EBE0FFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06D2AD82
          A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFF3EBE0F7F6F12FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FD
          FFFFFFD2AD82A55C06A55C06A55C06A55C06F7F6F1BC8646A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06DF
          C8AAFFFFFFFFFFFFB2C78F4F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F800185A84FFFFFFFFFFFFFFFFFFFFFFFFFE9E2CFE5D7
          C1E5D7C1D2AD82F3EBE0FFFFFFFFFFFFFFFFFFFFFFFFF3EBE0D2AD82D2AD82D2
          AD82D2AD82E5D7C1D2AD82D2AD82D2AD82DFC8AADFC8AABC8646BC8646D2AD82
          FFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FDBCE8FDFFFFFFD2AD82A55C06A55C06A55C06A55C06FFFFFFE5D7C1
          BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06D2AD82FFFFFFFFFFFFE5D7C14F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F8001B2C78FFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A55C06A55C06E9E2
          CFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06D2AD82A55C06A5
          5C06A55C06DFC8AA7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FDF7F6F1FFFFFFBC8646A55C06A55C06A55C06A5
          5C06FFFFFFFFFFFFD2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFFFFFFFF7F6
          F185A84F4F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          8001DFC8AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06
          A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFD2AD82A55C06A55C06A55C
          06D2AD82A55C06A55C06A55C067CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFFFFA55C06A55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFD2AD82A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          BC8646F7F6F1FFFFFFFFFFFFB2C78F4F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F8001F7F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFA55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFD2AD82
          A55C06A55C06BC8646DFC8AAD2AD82E5D7C1DAF2FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFF
          DFC8AAA55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFF3EBE0BC86
          46A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFE9E2CF85A84F4F8001
          4F80014F80014F80014F80014F80014F80014F800185A84FFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE9E2CFE5D7C1E5D7C1E5D7C1F3EBE0E5D7C1E5D7C1DF
          C8AADFC8AAF3EBE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7C
          D2FDFFFFFFFFFFFFBC8646A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFE9E2CFBC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFFF
          FFFFFFFFFFB2C78F4F80014F80014F80014F80014F80014F80014F80014F8001
          E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7
          C1A55C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FDDAF2FDFFFFFFE5D7C1A55C06A55C06A55C06A55C06A55C06A5
          5C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1BC8646A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06BC8646E9E2CFFFFFFFFFFFFFF3EBE085A84F4F80014F80014F80014F
          80014F80014F800185A84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE5D7C1A55C06A55C06A55C06D2AD82FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFF7F6F1BC8646A55C06A55C06A55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC8AABC
          8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06D2AD82F7F6F1FFFFFFFFFFFFE5D7
          C185A84F4F80014F80014F80014F80014F8001FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF3EBE0A55C06A55C06A55C06DFC8AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFFFFFFFBC8646A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFDFC8AABC8646A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06BC8646
          DFC8AAFFFFFFFFFFFFFFFFFFE5D7C185A84F4F80014F80014F8001E5D7C1FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1D2AD82D2AD82E5D7C1FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDDAF2FDFFFFFFFFFFFFBC
          8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC8AABC8646A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06BC8646E5D7C1FFFFFFFFFFFFFFFFFFE5D7C185A84F
          4F8001B2C78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCE8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDF7F6F1FFFF
          FFF7F6F1D2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC8AA
          BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06BC8646E5D7C1FF
          FFFFFFFFFFFFFFFFE9E2CFE5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCE8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDBCE8FD
          FFFFFFFFFFFFF7F6F1BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE5D7C1BC8646A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06BC8646E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF2FD7CD2FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDBC
          E8FDFFFFFFFFFFFFFFFFFFDFC8AAA55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E2CFBC8646A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06BC8646DFC8AAF3EBE0F7F6
          F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCE8FD7CD2FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDBCE8
          FDF7F6F1FFFFFFFFFFFFFFFFFFE5D7C1BC8646A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EB
          E0D2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06BC8646BC8646DFC8AAF3EBE0FFFFFFFFFFFFFFFFFFFFFFFFF7F6
          F1BCE8FD7CD2FD7CD2FD7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FD7CD2FDBCE8FDDAF2FD
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC8AABC8646A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFD2AD82BC8646A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82
          E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6
          F1BCE8FDDAF2FDDAF2FDBCE8FDBCE8FDDAF2FDFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7F6F1DFC8AABC8646A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1BC8646A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06BC8646D2AD82D2AD82E5D7C1E9E2CFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF3EBE0E5D7C1D2AD82D2AD82BC8646A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7F6F1D2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06BC8646BC8646BC8646BC8646BC8646BC8646
          BC8646BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1BC8646A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC8
          AABC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF7F6F1D2AD82BC8646A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EBE0D2AD82BC8646
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF7F6F1DFC8AABC8646A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06}
        mmHeight = 6350
        mmLeft = 94721
        mmTop = 3969
        mmWidth = 7673
        BandType = 0
      end
      object rpGPSLabel1: TppLabel
        UserName = 'Label3'
        Caption = 'PREVIDÊNCIA SOCIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 87577
        mmTop = 12700
        mmWidth = 22225
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 4498
        mmTop = 11642
        mmWidth = 188118
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label5'
        Caption = 'Perfil Profissiográfico Previdenciário - PPP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 55298
        mmTop = 17727
        mmWidth = 86519
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 47890
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 41010
        mmLeft = 4763
        mmTop = 7408
        mmWidth = 188119
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 4498
        mmTop = 27781
        mmWidth = 188119
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9260
        mmLeft = 116417
        mmTop = 27781
        mmWidth = 2381
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label11'
        Caption = 'CTPS (Nº, Série e UF)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 69321
        mmTop = 28575
        mmWidth = 28046
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 4763
        mmTop = 37042
        mmWidth = 188119
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label101'
        Caption = 'Data do Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 28575
        mmWidth = 25135
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label12'
        Caption = 'Sexo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 28575
        mmWidth = 6350
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 4763
        mmTop = 37306
        mmWidth = 188119
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 4498
        mmTop = 42069
        mmWidth = 188119
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 100277
        mmTop = 41804
        mmWidth = 2381
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CTPS'
        DataPipeline = ppPPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 69321
        mmTop = 32808
        mmWidth = 43921
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'SEXO'
        DataPipeline = ppPPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 32808
        mmWidth = 20373
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label4'
        Caption = 'NIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 155311
        mmTop = 18785
        mmWidth = 4498
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NIT'
        DataPipeline = ppPPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 155311
        mmTop = 23283
        mmWidth = 32808
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9790
        mmLeft = 116417
        mmTop = 17992
        mmWidth = 2381
        BandType = 4
      end
      object ppLabel32: TppLabel
        UserName = 'Label10'
        Caption = 'Data de Admissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 28575
        mmWidth = 22754
        BandType = 4
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = '5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 118534
        mmTop = 18785
        mmWidth = 1588
        BandType = 4
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = '6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 152136
        mmTop = 18785
        mmWidth = 1588
        BandType = 4
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = '9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 65088
        mmTop = 28575
        mmWidth = 1588
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'DATAADMISSAO'
        DataPipeline = ppPPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 124354
        mmTop = 32808
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'DATANASC'
        DataPipeline = ppPPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 32808
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = '7'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 7144
        mmTop = 28575
        mmWidth = 1588
        BandType = 4
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = '8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 38894
        mmTop = 28575
        mmWidth = 1588
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label13'
        Caption = '12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 5821
        mmTop = 38365
        mmWidth = 3175
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label14'
        Caption = 'CAT REGISTRADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 38365
        mmWidth = 24871
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label6'
        Caption = 'CNPJ do Domicílio Tributário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 8202
        mmWidth = 35719
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label7'
        Caption = '1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 7144
        mmTop = 8202
        mmWidth = 1588
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label8'
        Caption = 'CNAE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 155311
        mmTop = 8202
        mmWidth = 7938
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10848
        mmLeft = 150284
        mmTop = 7408
        mmWidth = 2381
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 4763
        mmTop = 17992
        mmWidth = 188119
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 4763
        mmTop = 17992
        mmWidth = 188119
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label9'
        Caption = 'Nome do Trabalhador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 18785
        mmWidth = 26988
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label15'
        Caption = '3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 152136
        mmTop = 8202
        mmWidth = 1588
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'EMPRESA'
        DataPipeline = ppPPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 50006
        mmTop = 12965
        mmWidth = 97896
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'EMPREGADO'
        DataPipeline = ppPPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 23283
        mmWidth = 102659
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CODCNAE'
        DataPipeline = ppPPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 155311
        mmTop = 12965
        mmWidth = 33338
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'CGC'
        DataPipeline = ppPPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 12965
        mmWidth = 35719
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = '4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 7144
        mmTop = 18785
        mmWidth = 1588
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8996
        mmLeft = 37571
        mmTop = 28046
        mmWidth = 2381
        BandType = 4
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        mmHeight = 6350
        mmLeft = 4763
        mmTop = 1058
        mmWidth = 188119
        BandType = 4
      end
      object ppLine82: TppLine
        UserName = 'Line82'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5556
        mmLeft = 11377
        mmTop = 1323
        mmWidth = 2381
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label202'
        Caption = 'I'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 7673
        mmTop = 2381
        mmWidth = 794
        BandType = 4
      end
      object ppLabel28: TppLabel
        UserName = 'Label204'
        Caption = 'SEÇÃO DE DADOS ADMINISTRATIVOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 13229
        mmTop = 2381
        mmWidth = 52123
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = '2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 50006
        mmTop = 8202
        mmWidth = 1588
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label17'
        Caption = 'Nome Empresarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 54240
        mmTop = 8202
        mmWidth = 23019
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10848
        mmLeft = 48419
        mmTop = 7408
        mmWidth = 2381
        BandType = 4
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'BR/PDH'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 122767
        mmTop = 18785
        mmWidth = 10848
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9790
        mmLeft = 150284
        mmTop = 17992
        mmWidth = 2381
        BandType = 4
      end
      object ppLabel30: TppLabel
        UserName = 'Label102'
        Caption = 'Regime Revezamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 157957
        mmTop = 28575
        mmWidth = 27781
        BandType = 4
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = '10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 118534
        mmTop = 28575
        mmWidth = 3175
        BandType = 4
      end
      object ppLabel62: TppLabel
        UserName = 'Label62'
        Caption = '11'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 152136
        mmTop = 28575
        mmWidth = 3175
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8996
        mmLeft = 63500
        mmTop = 28046
        mmWidth = 2381
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'Line102'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9260
        mmLeft = 150284
        mmTop = 27781
        mmWidth = 2381
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'BRPDH'
        DataPipeline = ppPPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 122767
        mmTop = 23283
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'REGIME'
        DataPipeline = ppPPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 157957
        mmTop = 32808
        mmWidth = 32808
        BandType = 4
      end
      object ppLabel64: TppLabel
        UserName = 'Label64'
        Caption = '12.1  Data do Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 66146
        mmTop = 43127
        mmWidth = 28310
        BandType = 4
      end
      object ppLabel76: TppLabel
        UserName = 'Label76'
        Caption = 'Número da CAT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 106892
        mmTop = 43127
        mmWidth = 20373
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'MATRICULA'
      DataPipeline = ppPPP
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 82815
        mmPrintPosition = 0
        object ppShape11: TppShape
          UserName = 'Shape11'
          mmHeight = 6350
          mmLeft = 4498
          mmTop = 66146
          mmWidth = 188119
          BandType = 5
          GroupNo = 0
        end
        object ppShape5: TppShape
          UserName = 'Shape5'
          mmHeight = 29898
          mmLeft = 4498
          mmTop = 9790
          mmWidth = 188119
          BandType = 5
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'ASSINANTE'
          DataPipeline = ppPPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 56356
          mmTop = 29633
          mmWidth = 87313
          BandType = 5
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'CIDADE'
          DataPipeline = ppPPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 56356
          mmTop = 15875
          mmWidth = 87313
          BandType = 5
          GroupNo = 0
        end
        object ppLine23: TppLine
          UserName = 'Line23'
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 56356
          mmTop = 28575
          mmWidth = 87313
          BandType = 5
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText101'
          DataField = 'CARGOASSINANTE'
          DataPipeline = ppPPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 56356
          mmTop = 34925
          mmWidth = 87313
          BandType = 5
          GroupNo = 0
        end
        object ppLine26: TppLine
          UserName = 'Line26'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 4763
          mmTop = 14817
          mmWidth = 188119
          BandType = 5
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label21'
          Caption = 'Representante Legal da Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 64294
          mmTop = 10848
          mmWidth = 41540
          BandType = 5
          GroupNo = 0
        end
        object ppShape3: TppShape
          UserName = 'Shape3'
          mmHeight = 25665
          mmLeft = 4498
          mmTop = 39688
          mmWidth = 188119
          BandType = 5
          GroupNo = 0
        end
        object ppMemo1: TppMemo
          UserName = 'Memo1'
          Caption = 'Memo1'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsItalic]
          Lines.Strings = (
            
              'Declaramos, para todos os fins de direito, que as informações pr' +
              'estadas neste documento são verídicas e foram transcritas'
            
              'fielmente dos registros administrativos, das demonstrações ambie' +
              'ntais e dos programas médicos de responsabilidade da empresa.'
            
              'É de nosso conhecimento que a prestação de informações falsas ne' +
              'ste documento constitui crime de falsificação de documento'
            
              'público, nos termos do art. 297 do Código Penal e, também, que t' +
              'ais informações são de caráter privativo do trabalhador,'
            
              'constituindo crime, nos termos da Lei nº 9.029/95, práticas disc' +
              'riminatórias decorrentes de sua exigibilidade por outrem, bem'
            
              'como de sua divulgação para terceiros, ressalvado quando exigida' +
              ' pelos órgãos públicos competentes.')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 23019
          mmLeft = 7938
          mmTop = 41010
          mmWidth = 181505
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppShape8: TppShape
          UserName = 'Shape8'
          mmHeight = 6350
          mmLeft = 4498
          mmTop = 2381
          mmWidth = 188119
          BandType = 5
          GroupNo = 0
        end
        object ppLine27: TppLine
          UserName = 'Line27'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 29633
          mmLeft = 55033
          mmTop = 9525
          mmWidth = 2381
          BandType = 5
          GroupNo = 0
        end
        object ppLine67: TppLine
          UserName = 'Line67'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 5821
          mmLeft = 11377
          mmTop = 2646
          mmWidth = 1852
          BandType = 5
          GroupNo = 0
        end
        object ppLabel85: TppLabel
          UserName = 'Label205'
          Caption = 'IV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 6615
          mmTop = 3969
          mmWidth = 2646
          BandType = 5
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label18'
          Caption = 'Data de Emissão do PPP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 13229
          mmTop = 10848
          mmWidth = 31485
          BandType = 5
          GroupNo = 0
        end
        object ppSystemVariable1: TppSystemVariable
          UserName = 'SystemVariable1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 20108
          mmTop = 25135
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label206'
          Caption = '(Carimbo)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 160602
          mmTop = 34925
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object ppLabel86: TppLabel
          UserName = 'Label207'
          Caption = 'RESPONSÁVEIS PELAS INFORMAÇÕES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 13229
          mmTop = 3969
          mmWidth = 54240
          BandType = 5
          GroupNo = 0
        end
        object ppLabel87: TppLabel
          UserName = 'Label87'
          Caption = '19'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 6350
          mmTop = 10848
          mmWidth = 3175
          BandType = 5
          GroupNo = 0
        end
        object ppLabel88: TppLabel
          UserName = 'Label88'
          Caption = '20'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 57679
          mmTop = 10848
          mmWidth = 3175
          BandType = 5
          GroupNo = 0
        end
        object ppLabel89: TppLabel
          UserName = 'Label89'
          Caption = 'V'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 6615
          mmTop = 67733
          mmWidth = 1852
          BandType = 5
          GroupNo = 0
        end
        object ppLine28: TppLine
          UserName = 'Line28'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 5821
          mmLeft = 10848
          mmTop = 66411
          mmWidth = 1852
          BandType = 5
          GroupNo = 0
        end
        object ppLabel90: TppLabel
          UserName = 'Label90'
          Caption = 'OBSERVAÇÕES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 12700
          mmTop = 67733
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppRegion4: TppRegion
          UserName = 'Region4'
          Stretch = True
          mmHeight = 9260
          mmLeft = 4498
          mmTop = 72496
          mmWidth = 188119
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpMemoObservacao: TppMemo
            UserName = 'rpMemoObservacao'
            CharWrap = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsItalic]
            Stretch = True
            Transparent = True
            mmHeight = 6615
            mmLeft = 7938
            mmTop = 73819
            mmWidth = 181505
            BandType = 5
            GroupNo = 0
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmLeading = 0
          end
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'EMPREGADO'
      DataPipeline = ppPPP
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 42333
        mmPrintPosition = 0
        object rpRequisitos: TppSubReport
          UserName = 'rpRequisitos'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = rpCargo
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 19579
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = ppRequisitos
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utScreenPixels
            Left = 168
            Top = 96
            Version = '5.5'
            mmColumnWidth = 0
            object ppTitleBand2: TppTitleBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 5556
              mmPrintPosition = 0
              object ppLabel49: TppLabel
                UserName = 'Label49'
                Caption = 'Requisitos da Função'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 14023
                mmTop = 794
                mmWidth = 27517
                BandType = 1
              end
              object ppLabel50: TppLabel
                UserName = 'Label50'
                Caption = '14.3'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 5821
                mmTop = 794
                mmWidth = 5556
                BandType = 1
              end
              object ppLine34: TppLine
                UserName = 'Line34'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5556
                mmLeft = 4498
                mmTop = 0
                mmWidth = 2381
                BandType = 1
              end
              object ppLine35: TppLine
                UserName = 'Line35'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5556
                mmLeft = 192617
                mmTop = 0
                mmWidth = 2381
                BandType = 1
              end
              object ppLine36: TppLine
                UserName = 'Line36'
                Weight = 0.75
                mmHeight = 1588
                mmLeft = 4498
                mmTop = 0
                mmWidth = 188119
                BandType = 1
              end
            end
            object ppDetailBand3: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
              object ppRegion1: TppRegion
                UserName = 'Region1'
                Stretch = True
                mmHeight = 6615
                mmLeft = 4498
                mmTop = 0
                mmWidth = 188384
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppDBText7: TppDBText
                  UserName = 'DBText7'
                  AutoSize = True
                  DataField = 'DESCRICAO'
                  DataPipeline = ppRequisitos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 11377
                  mmTop = 1323
                  mmWidth = 16933
                  BandType = 4
                end
              end
            end
            object ppSummaryBand2: TppSummaryBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 2117
              mmPrintPosition = 0
            end
          end
        end
        object rpCargo: TppSubReport
          UserName = 'rpCargo'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = rpEvolFunc
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 13229
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport3: TppChildReport
            AutoStop = False
            DataPipeline = ppCargos
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utScreenPixels
            Left = 176
            Top = 104
            Version = '5.5'
            mmColumnWidth = 0
            object ppTitleBand3: TppTitleBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 23813
              mmPrintPosition = 0
              object ppLine22: TppLine
                UserName = 'Line202'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 3969
                mmLeft = 10319
                mmTop = 2646
                mmWidth = 2381
                BandType = 1
              end
              object ppLabel51: TppLabel
                UserName = 'Label51'
                Caption = '14    PROFISSIOGRAFIA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 4233
                mmLeft = 5821
                mmTop = 2646
                mmWidth = 40217
                BandType = 1
              end
              object ppLine33: TppLine
                UserName = 'Line33'
                Weight = 0.75
                mmHeight = 1588
                mmLeft = 4498
                mmTop = 7408
                mmWidth = 188119
                BandType = 1
              end
              object ppDBText9: TppDBText
                UserName = 'DBText9'
                DataField = 'TITULO'
                DataPipeline = ppPPP
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 54769
                mmTop = 11906
                mmWidth = 136790
                BandType = 1
              end
              object ppLabel52: TppLabel
                UserName = 'Label52'
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 12700
                mmTop = 7938
                mmWidth = 5821
                BandType = 1
              end
              object ppLabel53: TppLabel
                UserName = 'Label53'
                Caption = '14.1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 5821
                mmTop = 7938
                mmWidth = 5556
                BandType = 1
              end
              object ppRegion2: TppRegion
                UserName = 'Region2'
                Stretch = True
                mmHeight = 7938
                mmLeft = 4498
                mmTop = 15875
                mmWidth = 188384
                BandType = 1
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppDBMemo2: TppDBMemo
                  UserName = 'DBMemo2'
                  CharWrap = False
                  DataField = 'DESCRICAO'
                  DataPipeline = ppCargos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  Stretch = True
                  Transparent = True
                  mmHeight = 5027
                  mmLeft = 11377
                  mmTop = 17198
                  mmWidth = 179652
                  BandType = 1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmLeading = 0
                end
              end
              object ppLine37: TppLine
                UserName = 'Line37'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 14552
                mmLeft = 4498
                mmTop = 1058
                mmWidth = 2381
                BandType = 1
              end
              object ppLine38: TppLine
                UserName = 'Line38'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 14817
                mmLeft = 192617
                mmTop = 1058
                mmWidth = 2381
                BandType = 1
              end
              object ppLine39: TppLine
                UserName = 'Line39'
                Weight = 0.75
                mmHeight = 1588
                mmLeft = 4498
                mmTop = 1058
                mmWidth = 188119
                BandType = 1
              end
              object ppLine75: TppLine
                UserName = 'Line75'
                Weight = 0.75
                mmHeight = 1588
                mmLeft = 4498
                mmTop = 15610
                mmWidth = 188119
                BandType = 1
              end
              object ppLabel91: TppLabel
                UserName = 'Label91'
                Caption = '14.2'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 47890
                mmTop = 7938
                mmWidth = 5556
                BandType = 1
              end
              object ppLabel92: TppLabel
                UserName = 'Label92'
                Caption = 'Descrição das Atividades:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 54769
                mmTop = 7938
                mmWidth = 31750
                BandType = 1
              end
              object ppDBText31: TppDBText
                UserName = 'DBText31'
                DataField = 'DATACARGO'
                DataPipeline = ppPPP
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 12700
                mmTop = 11642
                mmWidth = 17198
                BandType = 1
              end
            end
            object ppDetailBand4: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppSummaryBand3: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 2117
              mmPrintPosition = 0
            end
          end
        end
        object rpEvolFunc: TppSubReport
          UserName = 'rpEvolFunc'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = rpCAT
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 6350
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport4: TppChildReport
            AutoStop = False
            DataPipeline = ppEvolFunc
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utScreenPixels
            Left = 248
            Top = 120
            Version = '5.5'
            mmColumnWidth = 0
            object ppTitleBand4: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 11377
              mmPrintPosition = 0
              object ppLabel17: TppLabel
                UserName = 'Label1'
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 10583
                mmTop = 6879
                mmWidth = 4498
                BandType = 1
              end
              object ppLabel19: TppLabel
                UserName = 'Label2'
                Caption = 'Setor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 43656
                mmTop = 6879
                mmWidth = 5027
                BandType = 1
              end
              object ppLabel20: TppLabel
                UserName = 'Label20'
                Caption = 'Cargo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 81227
                mmTop = 6879
                mmWidth = 5821
                BandType = 1
              end
              object ppLabel47: TppLabel
                UserName = 'Label47'
                Caption = 'Função'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 125148
                mmTop = 6879
                mmWidth = 7144
                BandType = 1
              end
              object ppLabel48: TppLabel
                UserName = 'Label48'
                Caption = 'CBO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 169598
                mmTop = 6879
                mmWidth = 4498
                BandType = 1
              end
              object ppLabel54: TppLabel
                UserName = 'Label54'
                Caption = '13.1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 5821
                mmTop = 6879
                mmWidth = 4233
                BandType = 1
              end
              object ppLabel55: TppLabel
                UserName = 'Label55'
                Caption = '13.3'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 38629
                mmTop = 6879
                mmWidth = 4233
                BandType = 1
              end
              object ppLabel56: TppLabel
                UserName = 'Label56'
                Caption = '13.4'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 76465
                mmTop = 6879
                mmWidth = 4233
                BandType = 1
              end
              object ppLabel57: TppLabel
                UserName = 'Label57'
                Caption = '13.5'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 120386
                mmTop = 6879
                mmWidth = 4233
                BandType = 1
              end
              object ppLabel58: TppLabel
                UserName = 'Label58'
                Caption = '13.6'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 164836
                mmTop = 6879
                mmWidth = 4233
                BandType = 1
              end
              object ppLine40: TppLine
                UserName = 'Line40'
                Weight = 0.75
                mmHeight = 1588
                mmLeft = 4498
                mmTop = 5292
                mmWidth = 188119
                BandType = 1
              end
              object ppLine41: TppLine
                UserName = 'Line41'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 11377
                mmLeft = 4498
                mmTop = 0
                mmWidth = 2381
                BandType = 1
              end
              object ppLine43: TppLine
                UserName = 'Line43'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 11377
                mmLeft = 192617
                mmTop = 0
                mmWidth = 2381
                BandType = 1
              end
              object ppLine45: TppLine
                UserName = 'Line402'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 4498
                mmTop = 11113
                mmWidth = 188119
                BandType = 1
              end
              object ppLine52: TppLine
                UserName = 'Line52'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 6085
                mmLeft = 19050
                mmTop = 5292
                mmWidth = 2381
                BandType = 1
              end
              object ppLine53: TppLine
                UserName = 'Line53'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 6085
                mmLeft = 75406
                mmTop = 5292
                mmWidth = 2381
                BandType = 1
              end
              object ppLine54: TppLine
                UserName = 'Line54'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 6085
                mmLeft = 119592
                mmTop = 5292
                mmWidth = 2381
                BandType = 1
              end
              object ppLine55: TppLine
                UserName = 'Line55'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 6085
                mmLeft = 163777
                mmTop = 5292
                mmWidth = 2381
                BandType = 1
              end
              object ppLabel38: TppLabel
                UserName = 'Label38'
                Caption = '13'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 5821
                mmTop = 1323
                mmWidth = 3175
                BandType = 1
              end
              object ppLabel39: TppLabel
                UserName = 'Label39'
                Caption = 'LOTAÇÃO E ATRIBUIÇÃO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 11377
                mmTop = 1323
                mmWidth = 34131
                BandType = 1
              end
              object ppLine21: TppLine
                UserName = 'Line404'
                Weight = 0.75
                mmHeight = 1588
                mmLeft = 4498
                mmTop = 0
                mmWidth = 188119
                BandType = 1
              end
              object ppLine25: TppLine
                UserName = 'Line25'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 6085
                mmLeft = 37571
                mmTop = 5027
                mmWidth = 2381
                BandType = 1
              end
              object ppLabel93: TppLabel
                UserName = 'Label93'
                Caption = '13.2'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 20108
                mmTop = 6879
                mmWidth = 4233
                BandType = 1
              end
              object ppLabel94: TppLabel
                UserName = 'Label94'
                Caption = 'CNPJ/CEI'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 24871
                mmTop = 6879
                mmWidth = 9525
                BandType = 1
              end
              object ppLine69: TppLine
                UserName = 'Line69'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 6085
                mmLeft = 176213
                mmTop = 5292
                mmWidth = 2381
                BandType = 1
              end
              object ppLabel95: TppLabel
                UserName = 'Label95'
                Caption = '13.7'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 177271
                mmTop = 6879
                mmWidth = 4233
                BandType = 1
              end
              object ppLabel96: TppLabel
                UserName = 'Label96'
                Caption = 'Cod.GFIP'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 182034
                mmTop = 6879
                mmWidth = 9525
                BandType = 1
              end
            end
            object ppDetailBand5: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object ppDBText23: TppDBText
                UserName = 'DBText23'
                DataField = 'DATAALTERFUNC'
                DataPipeline = ppEvolFunc
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 6085
                mmTop = 794
                mmWidth = 12171
                BandType = 4
              end
              object ppDBText24: TppDBText
                UserName = 'DBText24'
                DataField = 'SETOR'
                DataPipeline = ppEvolFunc
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 38629
                mmTop = 794
                mmWidth = 35454
                BandType = 4
              end
              object ppDBText25: TppDBText
                UserName = 'DBText25'
                DataField = 'TITULO'
                DataPipeline = ppEvolFunc
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 76465
                mmTop = 794
                mmWidth = 42863
                BandType = 4
              end
              object ppDBText26: TppDBText
                UserName = 'DBText26'
                DataField = 'FUNCAO'
                DataPipeline = ppEvolFunc
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 120386
                mmTop = 794
                mmWidth = 42863
                BandType = 4
              end
              object ppDBText27: TppDBText
                UserName = 'DBText27'
                DataField = 'CBO'
                DataPipeline = ppEvolFunc
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 164836
                mmTop = 794
                mmWidth = 10848
                BandType = 4
              end
              object ppLine44: TppLine
                UserName = 'Line401'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 4498
                mmTop = 4233
                mmWidth = 188119
                BandType = 4
              end
              object ppLine46: TppLine
                UserName = 'Line46'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 192617
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine47: TppLine
                UserName = 'Line47'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 4498
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine48: TppLine
                UserName = 'Line48'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 163777
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine49: TppLine
                UserName = 'Line49'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 119592
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine50: TppLine
                UserName = 'Line50'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 75406
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine51: TppLine
                UserName = 'Line51'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 19050
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine68: TppLine
                UserName = 'Line501'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 37571
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppDBText34: TppDBText
                UserName = 'DBText34'
                DataField = 'CNPJ'
                DataPipeline = ppEvolFunc
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2381
                mmLeft = 20108
                mmTop = 794
                mmWidth = 16404
                BandType = 4
              end
              object ppLine70: TppLine
                UserName = 'Line70'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 176213
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppDBText35: TppDBText
                UserName = 'DBText35'
                DataField = 'GFIP'
                DataPipeline = ppPPP
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 2381
                mmLeft = 177271
                mmTop = 794
                mmWidth = 13758
                BandType = 4
              end
            end
            object ppSummaryBand4: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 2117
              mmPrintPosition = 0
            end
          end
        end
        object rpAgentes: TppSubReport
          UserName = 'rpAgentes'
          ExpandAll = True
          NewPrintJob = False
          ShiftRelativeTo = rpRequisitos
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 25929
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppAgentes
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utScreenPixels
            Left = 152
            Top = 120
            Version = '5.5'
            mmColumnWidth = 0
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 15610
              mmPrintPosition = 0
              object ppShape7: TppShape
                UserName = 'Shape7'
                mmHeight = 5027
                mmLeft = 4498
                mmTop = 265
                mmWidth = 188384
                BandType = 1
              end
              object ppLabel24: TppLabel
                UserName = 'Label12'
                Caption = 'SEÇÃO DE REGISTROS AMBIENTAIS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 12965
                mmTop = 1058
                mmWidth = 50006
                BandType = 1
              end
              object ppLabel65: TppLabel
                UserName = 'Label65'
                Caption = 'Período'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 12700
                mmTop = 10848
                mmWidth = 9790
                BandType = 1
              end
              object ppLabel66: TppLabel
                UserName = 'Label66'
                Caption = 'Agente (Tipo / Fator)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 32015
                mmTop = 10848
                mmWidth = 25665
                BandType = 1
              end
              object ppLabel67: TppLabel
                UserName = 'Label203'
                Caption = 'Intensidade'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 83344
                mmTop = 10848
                mmWidth = 14023
                BandType = 1
              end
              object ppLabel68: TppLabel
                UserName = 'Label68'
                Caption = 'Técnica Utilizada'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 110067
                mmTop = 10848
                mmWidth = 20902
                BandType = 1
              end
              object ppLabel69: TppLabel
                UserName = 'Label69'
                Caption = 'Proteção EPI/EPC'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 156104
                mmTop = 10848
                mmWidth = 23019
                BandType = 1
              end
              object ppLabel70: TppLabel
                UserName = 'Label70'
                Caption = '15.1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 5821
                mmTop = 10848
                mmWidth = 5556
                BandType = 1
              end
              object ppLabel71: TppLabel
                UserName = 'Label71'
                Caption = '15.2'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 25135
                mmTop = 10848
                mmWidth = 5556
                BandType = 1
              end
              object ppLabel72: TppLabel
                UserName = 'Label72'
                Caption = '15.3'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 76465
                mmTop = 10848
                mmWidth = 5556
                BandType = 1
              end
              object ppLabel73: TppLabel
                UserName = 'Label73'
                Caption = '15.4'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 102659
                mmTop = 10848
                mmWidth = 5556
                BandType = 1
              end
              object ppLabel74: TppLabel
                UserName = 'Label74'
                Caption = '15.5'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 150284
                mmTop = 10848
                mmWidth = 5556
                BandType = 1
              end
              object ppLine29: TppLine
                UserName = 'Line403'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 4498
                mmTop = 15081
                mmWidth = 188119
                BandType = 1
              end
              object ppLine60: TppLine
                UserName = 'Line60'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 9790
                mmLeft = 4498
                mmTop = 5292
                mmWidth = 2381
                BandType = 1
              end
              object ppLine61: TppLine
                UserName = 'Line61'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 8996
                mmLeft = 10319
                mmTop = 529
                mmWidth = 2381
                BandType = 1
              end
              object ppLine62: TppLine
                UserName = 'Line62'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 10319
                mmLeft = 192617
                mmTop = 5027
                mmWidth = 2381
                BandType = 1
              end
              object ppLine63: TppLine
                UserName = 'Line63'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 24342
                mmTop = 10054
                mmWidth = 2381
                BandType = 1
              end
              object ppLine64: TppLine
                UserName = 'Line64'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 75406
                mmTop = 10054
                mmWidth = 2381
                BandType = 1
              end
              object ppLine65: TppLine
                UserName = 'Line65'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 101600
                mmTop = 10054
                mmWidth = 2381
                BandType = 1
              end
              object ppLine66: TppLine
                UserName = 'Line66'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 149225
                mmTop = 10054
                mmWidth = 2381
                BandType = 1
              end
              object ppLabel40: TppLabel
                UserName = 'Label702'
                Caption = 'II'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 6085
                mmTop = 1058
                mmWidth = 1323
                BandType = 1
              end
              object ppLine24: TppLine
                UserName = 'Line24'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 4498
                mmTop = 9790
                mmWidth = 188119
                BandType = 1
              end
              object ppLabel41: TppLabel
                UserName = 'Label703'
                Caption = '15'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 5556
                mmTop = 5821
                mmWidth = 3175
                BandType = 1
              end
              object ppLabel42: TppLabel
                UserName = 'Label42'
                Caption = 'EXPOSIÇÃO A FATORES DE RISCOS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 12435
                mmTop = 5821
                mmWidth = 49742
                BandType = 1
              end
            end
            object ppDetailBand2: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object ppShape6: TppShape
                UserName = 'Shape6'
                mmHeight = 4763
                mmLeft = 4498
                mmTop = 0
                mmWidth = 188119
                BandType = 4
              end
              object ppDBText14: TppDBText
                UserName = 'DBText10'
                DataField = 'DESCRICAO'
                DataPipeline = ppAgentes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 25135
                mmTop = 794
                mmWidth = 48948
                BandType = 4
              end
              object ppDBText15: TppDBText
                UserName = 'DBText11'
                DataField = 'TECNICA'
                DataPipeline = ppAgentes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 102659
                mmTop = 794
                mmWidth = 46038
                BandType = 4
              end
              object ppDBText16: TppDBText
                UserName = 'DBText12'
                DataField = 'EPIEPC'
                DataPipeline = ppAgentes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 150284
                mmTop = 794
                mmWidth = 41010
                BandType = 4
              end
              object ppDBText18: TppDBText
                UserName = 'DBText18'
                DataField = 'PERIODO'
                DataPipeline = ppAgentes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 5821
                mmTop = 794
                mmWidth = 17198
                BandType = 4
              end
              object ppDBText21: TppDBText
                UserName = 'DBText21'
                DataField = 'GRADUACAO'
                DataPipeline = ppAgentes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 83344
                mmTop = 794
                mmWidth = 4233
                BandType = 4
              end
              object ppLine71: TppLine
                UserName = 'Line71'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4763
                mmLeft = 75406
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine72: TppLine
                UserName = 'Line72'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4763
                mmLeft = 24342
                mmTop = 265
                mmWidth = 2381
                BandType = 4
              end
              object ppLine73: TppLine
                UserName = 'Line73'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4763
                mmLeft = 101600
                mmTop = 265
                mmWidth = 2381
                BandType = 4
              end
              object ppLine74: TppLine
                UserName = 'Line74'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4763
                mmLeft = 149225
                mmTop = 265
                mmWidth = 2381
                BandType = 4
              end
              object ppLabel25: TppLabel
                UserName = 'Label25'
                Caption = '(1 a 4)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 89165
                mmTop = 794
                mmWidth = 7938
                BandType = 4
              end
            end
            object ppSummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 20108
              mmPrintPosition = 0
              object ppShape10: TppShape
                UserName = 'Shape10'
                mmHeight = 5027
                mmLeft = 4498
                mmTop = 0
                mmWidth = 188384
                BandType = 7
              end
              object ppLabel43: TppLabel
                UserName = 'Label43'
                Caption = '16'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 6085
                mmTop = 794
                mmWidth = 3175
                BandType = 7
              end
              object ppLine30: TppLine
                UserName = 'Line30'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4498
                mmLeft = 10319
                mmTop = 265
                mmWidth = 2381
                BandType = 7
              end
              object ppLabel44: TppLabel
                UserName = 'Label44'
                Caption = 'RESPONSÁVEL PELOS REGISTROS AMBIENTAIS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 12965
                mmTop = 794
                mmWidth = 66411
                BandType = 7
              end
              object ppLabel45: TppLabel
                UserName = 'Label45'
                Caption = 'Período'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 12700
                mmTop = 5821
                mmWidth = 9790
                BandType = 7
              end
              object ppLabel46: TppLabel
                UserName = 'Label46'
                Caption = 'NIT/CNPJ/CPF'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 54769
                mmTop = 5821
                mmWidth = 19315
                BandType = 7
              end
              object ppLabel77: TppLabel
                UserName = 'Label77'
                Caption = 'Nome'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 83344
                mmTop = 5821
                mmWidth = 7673
                BandType = 7
              end
              object ppLabel81: TppLabel
                UserName = 'Label704'
                Caption = '16.1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 5821
                mmTop = 5821
                mmWidth = 5556
                BandType = 7
              end
              object ppLabel82: TppLabel
                UserName = 'Label82'
                Caption = '16.2'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 47890
                mmTop = 5821
                mmWidth = 5556
                BandType = 7
              end
              object ppLabel83: TppLabel
                UserName = 'Label83'
                Caption = '16.3'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 76465
                mmTop = 5821
                mmWidth = 5556
                BandType = 7
              end
              object ppLine31: TppLine
                UserName = 'Line31'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 4498
                mmTop = 9790
                mmWidth = 188119
                BandType = 7
              end
              object ppLine32: TppLine
                UserName = 'Line602'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 15610
                mmLeft = 4498
                mmTop = 265
                mmWidth = 2381
                BandType = 7
              end
              object ppLine42: TppLine
                UserName = 'Line42'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 15610
                mmLeft = 192617
                mmTop = 265
                mmWidth = 2381
                BandType = 7
              end
              object ppLine56: TppLine
                UserName = 'Line56'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 11377
                mmLeft = 46831
                mmTop = 4763
                mmWidth = 2381
                BandType = 7
              end
              object ppLine57: TppLine
                UserName = 'Line57'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 11377
                mmLeft = 75406
                mmTop = 4763
                mmWidth = 2381
                BandType = 7
              end
              object ppLine58: TppLine
                UserName = 'Line58'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 4498
                mmTop = 15875
                mmWidth = 188119
                BandType = 7
              end
              object ppDBText5: TppDBText
                UserName = 'DBText5'
                DataField = 'RESPONSAVEL'
                DataPipeline = ppPPRA
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                WordWrap = True
                mmHeight = 3175
                mmLeft = 76994
                mmTop = 11113
                mmWidth = 113771
                BandType = 7
              end
              object ppDBText33: TppDBText
                UserName = 'DBText33'
                DataField = 'PERIODO'
                DataPipeline = ppPPP
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 6350
                mmTop = 11113
                mmWidth = 38629
                BandType = 7
              end
              object ppDBText36: TppDBText
                UserName = 'DBText36'
                DataField = 'NIT'
                DataPipeline = ppPPRA
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 47890
                mmTop = 11113
                mmWidth = 26194
                BandType = 7
              end
            end
          end
        end
        object rpExames: TppSubReport
          UserName = 'rpExames'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = rpAgentes
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 31485
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport5: TppChildReport
            AutoStop = False
            DataPipeline = ppExames
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utScreenPixels
            Left = 264
            Top = 136
            Version = '5.5'
            mmColumnWidth = 0
            object ppTitleBand5: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 17198
              mmPrintPosition = 0
              object ppLabel59: TppLabel
                UserName = 'Label59'
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 12965
                mmTop = 12700
                mmWidth = 6085
                BandType = 1
              end
              object ppLabel60: TppLabel
                UserName = 'Label60'
                Caption = 'Tipo / Natureza / Responsável'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 34131
                mmTop = 12700
                mmWidth = 37306
                BandType = 1
              end
              object ppLabel61: TppLabel
                UserName = 'Label201'
                Caption = 'Indicação dos Resultados'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 109802
                mmTop = 12700
                mmWidth = 31485
                BandType = 1
              end
              object ppLabel63: TppLabel
                UserName = 'Label63'
                Caption = '17.2'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 26988
                mmTop = 12700
                mmWidth = 5556
                BandType = 1
              end
              object ppShape4: TppShape
                UserName = 'Shape4'
                mmHeight = 5821
                mmLeft = 4498
                mmTop = 529
                mmWidth = 188384
                BandType = 1
              end
              object ppLabel26: TppLabel
                UserName = 'Label26'
                Caption = 'SEÇÃO DE RESULTADOS DE MONITORAÇÃO BIOLÓGICA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 13758
                mmTop = 1588
                mmWidth = 78581
                BandType = 1
              end
              object ppLabel75: TppLabel
                UserName = 'Label701'
                Caption = '17.1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 5821
                mmTop = 12700
                mmWidth = 5556
                BandType = 1
              end
              object ppLabel78: TppLabel
                UserName = 'Label78'
                Caption = '17.3'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 102659
                mmTop = 12700
                mmWidth = 5556
                BandType = 1
              end
              object ppLine76: TppLine
                UserName = 'Line601'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 10848
                mmLeft = 4498
                mmTop = 6085
                mmWidth = 2381
                BandType = 1
              end
              object ppLine77: TppLine
                UserName = 'Line77'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 11113
                mmLeft = 11906
                mmTop = 794
                mmWidth = 2381
                BandType = 1
              end
              object ppLine78: TppLine
                UserName = 'Line78'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 11113
                mmLeft = 192617
                mmTop = 6085
                mmWidth = 2381
                BandType = 1
              end
              object ppLine79: TppLine
                UserName = 'Line79'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 26194
                mmTop = 11906
                mmWidth = 2381
                BandType = 1
              end
              object ppLine81: TppLine
                UserName = 'Line81'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 101600
                mmTop = 11906
                mmWidth = 2381
                BandType = 1
              end
              object ppLine80: TppLine
                UserName = 'Line80'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 4498
                mmTop = 16933
                mmWidth = 188119
                BandType = 1
              end
              object ppLine59: TppLine
                UserName = 'Line801'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 4498
                mmTop = 11906
                mmWidth = 188119
                BandType = 1
              end
              object ppLabel79: TppLabel
                UserName = 'Label79'
                Caption = 'EXAMES MÉDICOS CLÍNICOS E COMPLEMENTARES'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 13758
                mmTop = 7408
                mmWidth = 71173
                BandType = 1
              end
              object ppLabel80: TppLabel
                UserName = 'Label80'
                Caption = 'III'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 5821
                mmTop = 1588
                mmWidth = 2117
                BandType = 1
              end
              object ppLabel84: TppLabel
                UserName = 'Label84'
                Caption = '17'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 5821
                mmTop = 7144
                mmWidth = 3175
                BandType = 1
              end
              object lblCFM1715: TppLabel
                UserName = 'lblCFM1715'
                Caption = '(Omitidos cf resolução CFM Nº 1715, de 8 de janeiro de 2004)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 90752
                mmTop = 7408
                mmWidth = 82286
                BandType = 1
              end
            end
            object ppDetailBand6: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 11642
              mmPrintPosition = 0
              object ppRegion3: TppRegion
                UserName = 'Region3'
                Stretch = True
                mmHeight = 11642
                mmLeft = 4498
                mmTop = 0
                mmWidth = 188384
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppDBText28: TppDBText
                  UserName = 'DBText28'
                  DataField = 'DATAREAL'
                  DataPipeline = ppExames
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 7673
                  mmTop = 1323
                  mmWidth = 17198
                  BandType = 4
                end
                object ppDBText29: TppDBText
                  UserName = 'DBText29'
                  DataField = 'DESCRTIPOOCMED'
                  DataPipeline = ppExames
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 26988
                  mmTop = 1323
                  mmWidth = 73819
                  BandType = 4
                end
                object ppDBText30: TppDBText
                  UserName = 'DBText30'
                  DataField = 'RESULTADO'
                  DataPipeline = ppExames
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 102659
                  mmTop = 1323
                  mmWidth = 88636
                  BandType = 4
                end
                object ppDBMemo3: TppDBMemo
                  UserName = 'DBMemo3'
                  CharWrap = False
                  DataField = 'OBSERVACAO'
                  DataPipeline = ppExames
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Stretch = True
                  Transparent = True
                  mmHeight = 4233
                  mmLeft = 102659
                  mmTop = 5292
                  mmWidth = 88636
                  BandType = 4
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmLeading = 0
                end
              end
            end
            object ppSummaryBand5: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 1852
              mmPrintPosition = 0
            end
          end
        end
        object rpResponsavelExames: TppSubReport
          UserName = 'rpResponsavelExames'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = rpExames
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 37042
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport6: TppChildReport
            AutoStop = False
            DataPipeline = ppExames
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utScreenPixels
            Left = 256
            Top = 128
            Version = '5.5'
            mmColumnWidth = 0
            object ppTitleBand6: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 11113
              mmPrintPosition = 0
              object ppLabel97: TppLabel
                UserName = 'Label97'
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 12965
                mmTop = 6615
                mmWidth = 6085
                BandType = 1
              end
              object ppLabel98: TppLabel
                UserName = 'Label601'
                Caption = 'NIT/CNPJ/CPF'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 34131
                mmTop = 6615
                mmWidth = 19315
                BandType = 1
              end
              object ppLabel99: TppLabel
                UserName = 'Label99'
                Caption = 'Nome'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 109802
                mmTop = 6615
                mmWidth = 7673
                BandType = 1
              end
              object ppLabel100: TppLabel
                UserName = 'Label100'
                Caption = '18.2'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 26988
                mmTop = 6615
                mmWidth = 5556
                BandType = 1
              end
              object ppLabel101: TppLabel
                UserName = 'Label1'
                Caption = '18.1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 5821
                mmTop = 6615
                mmWidth = 5556
                BandType = 1
              end
              object ppLabel102: TppLabel
                UserName = 'Label2'
                Caption = '18.4'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 102659
                mmTop = 6615
                mmWidth = 5556
                BandType = 1
              end
              object ppLine83: TppLine
                UserName = 'Line83'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 10848
                mmLeft = 4498
                mmTop = 0
                mmWidth = 2381
                BandType = 1
              end
              object ppLine84: TppLine
                UserName = 'Line84'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 11113
                mmLeft = 11906
                mmTop = 0
                mmWidth = 2381
                BandType = 1
              end
              object ppLine85: TppLine
                UserName = 'Line85'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 11113
                mmLeft = 192617
                mmTop = 0
                mmWidth = 2381
                BandType = 1
              end
              object ppLine86: TppLine
                UserName = 'Line86'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 25135
                mmTop = 5821
                mmWidth = 2381
                BandType = 1
              end
              object ppLine87: TppLine
                UserName = 'Line87'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 101600
                mmTop = 5821
                mmWidth = 2381
                BandType = 1
              end
              object ppLine88: TppLine
                UserName = 'Line88'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 4498
                mmTop = 10583
                mmWidth = 188119
                BandType = 1
              end
              object ppLabel103: TppLabel
                UserName = 'Label103'
                Caption = 'RESPONSÁVEL PELA MONITORAÇÃO BIOLÓGICA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 12965
                mmTop = 2117
                mmWidth = 67733
                BandType = 1
              end
              object ppLabel104: TppLabel
                UserName = 'Label104'
                Caption = '18'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 5821
                mmTop = 2117
                mmWidth = 3175
                BandType = 1
              end
              object ppLine89: TppLine
                UserName = 'Line89'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 4498
                mmTop = 0
                mmWidth = 188119
                BandType = 1
              end
              object ppLabel105: TppLabel
                UserName = 'Label105'
                Caption = 'Reg. Cons. de Classe'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 73025
                mmTop = 6615
                mmWidth = 27517
                BandType = 1
              end
              object ppLabel106: TppLabel
                UserName = 'Label1001'
                Caption = '18.3'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 65881
                mmTop = 6615
                mmWidth = 5556
                BandType = 1
              end
              object ppLine90: TppLine
                UserName = 'Line90'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 64823
                mmTop = 5821
                mmWidth = 2381
                BandType = 1
              end
            end
            object ppDetailBand7: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
              object ppRegion5: TppRegion
                UserName = 'Region5'
                Stretch = True
                mmHeight = 6615
                mmLeft = 4498
                mmTop = 0
                mmWidth = 188384
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppDBText37: TppDBText
                  UserName = 'DBText37'
                  DataField = 'DATAREAL'
                  DataPipeline = ppExames
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 6085
                  mmTop = 1852
                  mmWidth = 17198
                  BandType = 4
                end
                object ppDBText40: TppDBText
                  UserName = 'DBText40'
                  DataField = 'EXAMINADOR'
                  DataPipeline = ppExames
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 102658
                  mmTop = 1587
                  mmWidth = 84667
                  BandType = 4
                end
                object ppLine91: TppLine
                  UserName = 'Line91'
                  Position = lpLeft
                  Weight = 0.75
                  mmHeight = 6350
                  mmLeft = 25135
                  mmTop = 264
                  mmWidth = 2381
                  BandType = 4
                end
                object ppLine92: TppLine
                  UserName = 'Line901'
                  Position = lpLeft
                  Weight = 0.75
                  mmHeight = 6350
                  mmLeft = 64823
                  mmTop = 264
                  mmWidth = 2381
                  BandType = 4
                end
                object ppLine93: TppLine
                  UserName = 'Line93'
                  Position = lpLeft
                  Weight = 0.75
                  mmHeight = 6350
                  mmLeft = 101600
                  mmTop = 264
                  mmWidth = 2381
                  BandType = 4
                end
                object ppDBText17: TppDBText
                  UserName = 'DBText17'
                  DataField = 'NIT'
                  DataPipeline = ppExames
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 31485
                  mmTop = 1852
                  mmWidth = 26458
                  BandType = 4
                end
              end
            end
            object ppSummaryBand6: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 1852
              mmPrintPosition = 0
            end
          end
        end
        object rpCAT: TppSubReport
          UserName = 'rpCAT'
          ExpandAll = False
          NewPrintJob = False
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport7: TppChildReport
            AutoStop = False
            DataPipeline = ppCAT
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utScreenPixels
            Left = 264
            Top = 104
            Version = '5.5'
            mmColumnWidth = 0
            object ppTitleBand7: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand8: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 6350
              mmPrintPosition = 0
              object ppDBText38: TppDBText
                UserName = 'DBText38'
                DataField = 'DATAREAL'
                DataPipeline = ppCAT
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 70115
                mmTop = 1323
                mmWidth = 17198
                BandType = 4
              end
              object ppDBText39: TppDBText
                UserName = 'DBText39'
                DataField = 'NUMEROCAT'
                DataPipeline = ppCAT
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 111654
                mmTop = 1323
                mmWidth = 17198
                BandType = 4
              end
              object ppLine18: TppLine
                UserName = 'Line18'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 6085
                mmLeft = 100277
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine95: TppLine
                UserName = 'Line95'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 6085
                mmLeft = 4763
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine96: TppLine
                UserName = 'Line96'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 6085
                mmLeft = 192617
                mmTop = 0
                mmWidth = 1588
                BandType = 4
              end
              object ppLine97: TppLine
                UserName = 'Line97'
                Weight = 0.75
                mmHeight = 529
                mmLeft = 5027
                mmTop = 6350
                mmWidth = 187590
                BandType = 4
              end
            end
            object ppSummaryBand7: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
    end
  end
  object ppCargos: TppBDEPipeline
    DataSource = dsCargos
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'ppCargos'
    Left = 25
    Top = 56
  end
  object dsCargos: TwwDataSource
    DataSet = sqlCargos
    Left = 25
    Top = 104
  end
  object ppPPRA: TppBDEPipeline
    DataSource = dsPPRA
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ppPPRA'
    Left = 85
    Top = 56
    object ppPPRAppField1: TppField
      FieldAlias = 'IDAVAL'
      FieldName = 'IDAVAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppPPRAppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppPPRAppField3: TppField
      FieldAlias = 'TEXTOCOMPL'
      FieldName = 'TEXTOCOMPL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppPPRAppField4: TppField
      FieldAlias = 'DATAAVAL'
      FieldName = 'DATAAVAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppPPRAppField5: TppField
      FieldAlias = 'IDEMPRESA'
      FieldName = 'IDEMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppPPRAppField6: TppField
      FieldAlias = 'IDHORARIO'
      FieldName = 'IDHORARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppPPRAppField7: TppField
      FieldAlias = 'IDCARGO'
      FieldName = 'IDCARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppPPRAppField8: TppField
      FieldAlias = 'IDESTAB'
      FieldName = 'IDESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppPPRAppField9: TppField
      FieldAlias = 'RESPONSAVEL'
      FieldName = 'RESPONSAVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object dsPPRA: TwwDataSource
    DataSet = sqlPPRA
    Left = 85
    Top = 104
  end
  object ppAgentes: TppBDEPipeline
    DataSource = dsAgentes
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'Agentes'
    Left = 152
    Top = 58
    object ppAgentesppField1: TppField
      FieldAlias = 'PERIODO'
      FieldName = 'PERIODO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppAgentesppField2: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppAgentesppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppAgentesppField4: TppField
      FieldAlias = 'TIPOAGENTE'
      FieldName = 'TIPOAGENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppAgentesppField5: TppField
      FieldAlias = 'MEIOPROPAGACAO'
      FieldName = 'MEIOPROPAGACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppAgentesppField6: TppField
      FieldAlias = 'MEIOCONTAMINACAO'
      FieldName = 'MEIOCONTAMINACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object dsAgentes: TwwDataSource
    DataSet = sqlAgentes
    Left = 152
    Top = 109
  end
  object sqlCargos: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPPP
    SQL.Strings = (
      'SELECT'
      ' DESCRICAO'
      'FROM'
      ' CARGO'
      'WHERE'
      ' (IDCARGO = :IDCARGO)')
    ValidateWithMask = True
    Left = 24
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCARGO'
        ParamType = ptUnknown
      end>
  end
  object sqlPPRA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' IDAVAL,          '
      ' DESCRICAO,'
      ' TEXTOCOMPL,'
      ' DATAAVAL,'
      ' IDEMPRESA,'
      ' IDHORARIO,'
      ' IDCARGO,'
      ' IDESTAB,'
      ' '#39'11111111111111'#39' AS NIT,'
      
        ' '#39'111111111111111111111111111111111111111111111111111'#39' AS RESPON' +
        'SAVEL'
      'FROM'
      ' PPRAAVAL'
      'WHERE'
      ' IDAVAL = 1'
      ' ')
    ValidateWithMask = True
    Left = 88
    Top = 160
  end
  object sqlAgentes: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPPRA
    SQL.Strings = (
      'SELECT'
      '    DECODE(PA.INDPERIODO,1,'#39'Habitual'#39','#39'Ocasional'#39') AS PERIODO,'
      '    (CASE WHEN PR.INDTIPO = 1 THEN '#39'Q'#39
      '         WHEN PR.INDTIPO = 2 THEN '#39'B'#39
      '         WHEN PR.INDTIPO = 3 THEN '#39'F'#39
      '         WHEN PR.INDTIPO = 4 THEN '#39'E'#39
      '         ELSE '#39'M'#39
      '    END) || '#39'-'#39' || PR.DESCRICAO AS DESCRICAO,  '
      '    PA.GRADUACAO, CB.DESCRICAO AS EPIEPC,'
      '    PC.DESCRICAO AS TECNICA'
      '    FROM'
      '      PPRAAGENTEAVAL PA, PPRAAGENTERISCO PR, PPRAMEDIDAS PM,'
      '      CLASSEDEBEM CB, PPRAACOES PC'
      '    WHERE'
      '        (PA.IDAVAL   = :IDAVAL)'
      '    AND (PA.IDAGENTERISCO = PR.IDAGENTERISCO)'
      '    AND (PA.IDAVAL        = PM.IDAVAL(+))'
      '    AND (PM.IDCLASSEBEM   = CB.IDCLASSEBEM(+))'
      '    AND (PM.IDACOES       = PC.IDACOES(+))'
      '    ORDER BY UPPER(PR.DESCRICAO)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 152
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDAVAL'
        ParamType = ptUnknown
      end>
  end
  object sqlPPP: TwwQuery
    AfterScroll = sqlPPPAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PJ.RAZAOSOCIAL AS EMPRESA,'
      '  '#39'1111111111111111111111111111111111111111111'#39'  AS CNAE,'
      '  '#39'1111111111111111111111111111111111111111111'#39'  AS ASSINANTE,'
      
        '  '#39'1111111111111111111111111111111111111111111'#39'  AS CARGOASSINAN' +
        'TE,'
      '  '#39'1111111111111111111111111111111111111111111'#39'  AS COORDENADOR,'
      '  '#39'1111111111111111111111111111111111111111111'#39'  AS PERIODO,'
      '  '#39'1111111111111111111111111111111111111111111'#39'  AS REGIME,'
      '  '#39'1111111111111'#39' AS BRPDH,'
      '  0 AS CODCNAE,'
      '  PF.NOME AS EMPREGADO,'
      '  F.MATRICULA, F.DATAADMISSAO, PFIS.DATANASC,'
      '  DECODE(PFIS.SEXO,'#39'M'#39','#39'Masculino'#39','#39'Feminino'#39') AS SEXO,'
      '  CC.NOME AS NOMECENTROCUSTO,'
      '  C.TITULO, C.IDCARGO, F.DATACARGO,'
      '  PJ.NUMDOCUMENTO AS CGC, '
      
        '  TRIM(CIDADES.NOME) || '#39', '#39' || TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39') AS' +
        ' CIDADE,'
      
        '  RTRIM(END.LOGRADOURO) ||'#39', '#39'|| END.NUMERO || DECODE(END.COMPLE' +
        'MENTO,NULL,NULL,'#39' - '#39' ||'
      
        '    RTRIM(END.COMPLEMENTO)) ||'#39' - '#39'|| RTRIM(END.BAIRRO) ||'#39' - '#39'|' +
        '| RTRIM(CIDADES.NOME) ||'
      
        '    '#39' - CEP:'#39' || RTRIM(SUBSTR(END.CEP,1,5)) ||'#39'-'#39'|| RTRIM(SUBSTR' +
        '(END.CEP,6,3)) AS ENDERECO,'
      '  HT.JORNADAMENSAL,'
      '  CTPS.NUM AS CTPS,'
      '  NIT.NUM AS NIT'
      'FROM'
      '  PESSOA PJ, PESSOA PF, ENDPESS END, PESSOAFISICA PFIS,'
      '  FUNCIONARIO F, CARGO C, CIDADES, HORATRAB HT,'
      '  CENTCUST CC,'
      '  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM'
      '   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO'
      '   WHERE (TDO.SIGLADOCUMENTO = '#39'CTPS:'#39') AND'
      '         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND'
      '         (DP.IDPESSOA        = F.IDPESSOA)) CTPS,'
      '  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM'
      '   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO'
      '   WHERE (TDO.SIGLADOCUMENTO = '#39'NIT:'#39') AND'
      '         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND'
      '         (DP.IDPESSOA        = F.IDPESSOA)) NIT'
      ''
      'WHERE'
      
        '  (F.IDPESSOA IN (10509,1530491,10356,10525,1527097,1354549,1718' +
        '9,10043,1544941,10143,10494,10438,10250,10108,10173,10447,10220,' +
        '10071,10276,10145,1542489,1416913,10191,10425,1536515,10359,1024' +
        '0,10457,10329,1212660,1526257,10183,10015,10451,10139,10396,1012' +
        '1,10547,10085,10236,10530,10003,10502,10299,1545140,1532141,1036' +
        '7,10519,1523419,10231,10534,10012,1545702,10505,10493,1542491,10' +
        '221,10512,10368,10274,10116,10459,1543713,10277,10537,10097,1009' +
        '3,10333,1539446,10543,10186,10084,10342,1526023,10375,10176,1046' +
        '7,10503,10323,10150,10393,10192,10229,10305,10507,10365,10477,10' +
        '395,10331,10290,10488,10006,10222,10485,10025,10034,10103,10069,' +
        '10112,10275,10051,10194,10188,10224,1213504,10101,10055,10344,10' +
        '002,10362,10104,1526241,10206,10541,10409,1523497,10538,10070,10' +
        '434,1525856,10363,10007,10429,10259,10307,10513,10185,10149,1000' +
        '8,1543760,10164,10369,1525867,10141,10445,10453,10540,10433)) AN' +
        'D'
      '  (PJ.IDPESSOA       = F.IDESTAB) AND'
      '  (PF.IDPESSOA       = F.IDPESSOA) AND'
      '  (PF.IDPESSOA       = PFIS.IDPESSOA) AND'
      '  (C.IDCARGO         = F.IDCARGO) AND'
      '  (HT.IDHORARIO      = F.IDHORARIO) AND'
      '  (F.IDPESSOA        = CTPS.IDPESSOA(+)) AND'
      '  (F.IDPESSOA        = NIT.IDPESSOA(+)) AND'
      '  (PJ.IDPESSOA       = END.IDPESSOA(+)) AND'
      '  (PJ.IDENDCOMERCIAL = END.IDENDERECO(+)) AND'
      '  (END.IDCIDADES     = CIDADES.IDCIDADES(+)) AND'
      '  (F.IDEMPRESA       = CC.IDEMPRESA(+)) AND'
      '  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+))'
      'ORDER BY EMPRESA, EMPREGADO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 297
    Top = 160
  end
  object ppRequisitos: TppBDEPipeline
    DataSource = dsRequisitos
    CloseDataSource = True
    UserName = 'Requisitos'
    Left = 217
    Top = 56
    object ppRequisitosppField1: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object dsRequisitos: TwwDataSource
    DataSet = sqlRequisitos
    Left = 217
    Top = 104
  end
  object sqlRequisitos: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPPP
    SQL.Strings = (
      'SELECT'
      '  1 AS TIPO, '#39'Curso......: '#39' || C.DESCRICAO AS DESCRICAO'
      'FROM'
      '  CURSO C, CURSOREQ R'
      'WHERE'
      '  (R.IDCARGO = :IDCARGO) AND'
      '  (C.IDCURSO = R.IDCURSO)'
      'UNION SELECT'
      '  2 AS TIPO, '#39'Experiência: '#39' || T.DESCRICAO ||'
      
        '  DECODE(TEMPOEXPER,NULL,'#39#39','#39' '#39' || TO_CHAR(TEMPOEXPER) || '#39' Mese' +
        's'#39') AS DESCRICAO'
      'FROM'
      '  TABEXPER T, EXPREQER R'
      'WHERE'
      '  (R.IDCARGO = :IDCARGO) AND'
      '  (T.IDEXPER = R.IDEXPER)'
      'UNION SELECT'
      '  3 AS TIPO, '#39'Avaliação..: '#39' || T.DESCRTIPOAVAL AS DESCRICAO'
      'FROM'
      '  TIPOAVAL T, AVALCARGO R'
      'WHERE'
      '  (R.IDCARGO = :IDCARGO) AND'
      '  (T.CODTIPOAVAL = R.CODTIPOAVAL)'
      'ORDER BY 1, 2')
    ValidateWithMask = True
    Left = 216
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCARGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDCARGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDCARGO'
        ParamType = ptUnknown
      end>
  end
  object ppExames: TppBDEPipeline
    DataSource = dsExames
    CloseDataSource = True
    UserName = 'Exames'
    Left = 363
    Top = 55
  end
  object dsExames: TwwDataSource
    DataSet = qryExames
    Left = 363
    Top = 104
  end
  object qryExames: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPPP
    SQL.Strings = (
      'SELECT'
      '  HM.IDPESSOA, HM.DATAREAL,'
      '  DECODE(NVL(TM.AVALMIN,0),0,'
      '    CASE WHEN HM.OBSERVACAO IS NULL THEN '#39'Ver abaixo'#39
      '         ELSE '#39'Normal'#39
      '    END,'
      '  DECODE(TRUNC(NVL(HM.AVALIACAO,0)/NVL(TM.AVALMIN,0)),0,'
      '    CASE WHEN HM.OBSERVACAO IS NULL THEN '#39'Ver abaixo'#39
      '         ELSE '#39'Normal'#39
      '    END,'
      '    '#39'Normal'#39
      ')) AS RESULTADO, P.NUMDOCUMENTO AS NIT,'
      '  TM.DESCRTIPOOCMED, HM.OBSERVACAO, HM.EXAMINADOR'
      'FROM'
      '  HSTASMED HM, PESSOA P, TIPOCMED TM'
      'WHERE'
      '  (HM.IDPESSOA     = :IDPESSOA) AND'
      '  (HM.IDEXAMINADOR = P.IDPESSOA(+)) AND'
      '  (HM.DATAREAL IS NOT NULL)   AND'
      '  (TM.FLGTIPOCOR = 0)                 AND'
      '  (HM.CODTIPOOCMED = TM.CODTIPOOCMED)'
      'ORDER BY'
      '  HM.DATAREAL DESC'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 363
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object ppEvolFunc: TppBDEPipeline
    DataSource = dsEvolFunc
    CloseDataSource = True
    UserName = 'EvolFunc'
    Left = 476
    Top = 56
  end
  object dsEvolFunc: TwwDataSource
    DataSet = qryEvolFunc
    Left = 476
    Top = 104
  end
  object qryEvolFunc: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPPP
    SQL.Strings = (
      'SELECT MIN(E.DATAALTERFUNC) AS DATAALTERFUNC, C.TITULO,'
      '  DECODE(C2.TITULO,NULL,'#39'NA'#39',C2.TITULO) AS FUNCAO,'
      '  CC.NOME AS SETOR, E.IDPESSOA, E.IDEMPRESA, E.CODCENTROCUSTO,'
      '  E.IDCARGO, E.IDFUNCAO, C.CBO2002 AS CBO,'
      '  P.NUMDOCUMENTO AS CNPJ'
      'FROM EVOLFUNC E, PESSOA P, CARGO C, CARGO C2, CENTCUST CC,'
      '(SELECT DISTINCT'
      '   IDPESSOA, IDEMPRESA, CODCENTROCUSTO,'
      '   IDCARGO, IDFUNCAO'
      ' FROM EVOLFUNC'
      ' WHERE IDPESSOA = :IDPESSOA) H'
      'WHERE'
      ' E.IDPESSOA       = :IDPESSOA AND'
      ' E.IDPESSOA       = H.IDPESSOA AND'
      ' E.IDEMPRESA      = H.IDEMPRESA AND'
      ' E.CODCENTROCUSTO = H.CODCENTROCUSTO AND'
      ' E.IDEMPRESA      = P.IDPESSOA AND'
      ' E.IDCARGO        = H.IDCARGO  AND'
      ' NVL(E.IDFUNCAO,0)= NVL(H.IDFUNCAO,0) AND'
      ' E.IDEMPRESA      = CC.IDEMPRESA(+) AND'
      ' E.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) AND'
      ' E.IDCARGO        = C.IDCARGO  AND'
      ' E.IDFUNCAO       = C2.IDCARGO(+)'
      'GROUP BY E.IDPESSOA, E.IDEMPRESA, E.CODCENTROCUSTO,'
      '  E.IDCARGO, E.IDFUNCAO, C.TITULO,'
      '  C2.TITULO, CC.NOME, C.CBO2002,'
      '  P.NUMDOCUMENTO'
      'ORDER BY'
      '  DATAALTERFUNC DESC'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 476
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object ppCAT: TppBDEPipeline
    DataSource = dsCAT
    CloseDataSource = True
    UserName = 'CAT'
    Left = 419
    Top = 56
  end
  object dsCAT: TwwDataSource
    DataSet = qryCAT
    Left = 419
    Top = 105
  end
  object qryCAT: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPPP
    SQL.Strings = (
      'SELECT'
      '  HM.DATAREAL,'
      '  TO_CHAR(HM.IDPESSOA) || '#39'/'#39' || TO_CHAR(HM.NUMSEQ) AS NUMEROCAT'
      'FROM'
      '  HSTASMED HM, TIPOCMED TM'
      'WHERE'
      '  (HM.IDPESSOA     = :IDPESSOA) AND'
      '  (HM.DATAREAL IS NOT NULL)   AND'
      '  (TM.FLGACIDTRAB = 1)        AND'
      '  (HM.CODTIPOOCMED = TM.CODTIPOOCMED)'
      'ORDER BY'
      '  HM.DATAREAL DESC'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 419
    Top = 153
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
