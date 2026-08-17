inherited RptProcPrev: TRptProcPrev
  Left = 128
  Top = 146
  Width = 424
  Height = 339
  Caption = 'RptProcPrev'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'TituloRelatorio'
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
        Name = 'TituloRelatorio'
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
        Caption = 'SQL'
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
        Name = 'SQL'
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
        Caption = 'ImprimirLitis'
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
        Name = 'ImprimirLitis'
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
        Caption = 'ImprimirNumProcVara'
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
        Name = 'ImprimirNumProcVara'
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
        Caption = 'ExibirRelatRiscoMax'
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
        Name = 'ExibirRelatRiscoMax'
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
        Caption = 'OpcaoImpressao'
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
        Name = 'OpcaoImpressao'
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
        Caption = 'ImprimirEtapa'
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
        Name = 'ImprimirEtapa'
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
        Caption = 'ImprimirEtapaSel'
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
        Name = 'ImprimirEtapaSel'
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
        Caption = 'ImprimirObsEtapa'
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
        Name = 'ImprimirObsEtapa'
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
        Caption = 'ListaCodEtapa'
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
        Name = 'ListaCodEtapa'
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
        Caption = 'ImprimirObj'
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
        Name = 'ImprimirObj'
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
        Caption = 'ImprimirObjSel'
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
        Name = 'ImprimirObjSel'
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
        Caption = 'ListaCodObjeto'
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
        Name = 'ListaCodObjeto'
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
        Caption = 'ImprimirCabRod'
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
        Name = 'ImprimirCabRod'
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
        Caption = 'ImprimirResumo'
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
        Name = 'ImprimirResumo'
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
        Caption = 'ImprimirCargo'
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
        Name = 'ImprimirCargo'
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
    Report = rpProcPrev
  end
  object rpProcPrev: TppReport
    AutoStop = False
    DataPipeline = ppProcPrev
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relação de Processos'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 357
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppProcPrev'
    object rpProcPrevHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object rpProcPrevLbl7: TppLabel
        UserName = 'rpProcPrevLbl7'
        AutoSize = False
        Caption = 'Admissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 90488
        mmTop = 20373
        mmWidth = 15610
        BandType = 0
      end
      object rpProcPrevLbl1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Relação de Processos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 5027
        mmTop = 8202
        mmWidth = 275167
        BandType = 0
      end
      object rpProcPrevDBTxt1: TppDBText
        UserName = 'rpProcPrevDBTxt1'
        DataField = 'EMPRESA'
        DataPipeline = ppProcPrev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppProcPrev'
        mmHeight = 4233
        mmLeft = 5027
        mmTop = 2646
        mmWidth = 275167
        BandType = 0
      end
      object rpProcPrevLbl4: TppLabel
        UserName = 'rpProcPrevLbl4'
        AutoSize = False
        Caption = 'Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 20373
        mmWidth = 32808
        BandType = 0
      end
      object rpProcPrevLbl5: TppLabel
        UserName = 'rpProcPrevLbl5'
        AutoSize = False
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 38365
        mmTop = 20373
        mmWidth = 5292
        BandType = 0
      end
      object rpProcPrevLbl6: TppLabel
        UserName = 'rpProcPrevLbl6'
        AutoSize = False
        Caption = 'Contra Parte'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 44186
        mmTop = 20373
        mmWidth = 45773
        BandType = 0
      end
      object rpProcPrevLbl8: TppLabel
        UserName = 'rpProcPrevLbl8'
        AutoSize = False
        Caption = 'Demissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 106627
        mmTop = 20373
        mmWidth = 15610
        BandType = 0
      end
      object rpProcPrevLbl9: TppLabel
        UserName = 'rpProcPrevLbl9'
        AutoSize = False
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 20373
        mmWidth = 39158
        BandType = 0
      end
      object rpProcPrevLbl10: TppLabel
        UserName = 'rpProcPrevLbl10'
        AutoSize = False
        Caption = 'Nº Vara'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 138642
        mmTop = 20373
        mmWidth = 32808
        BandType = 0
      end
      object rpProcPrevLbl11: TppLabel
        UserName = 'rpProcPrevLbl11'
        AutoSize = False
        Caption = 'Data Notif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 20373
        mmWidth = 15875
        BandType = 0
      end
      object rpProcPrevLbl12: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Sit.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 188384
        mmTop = 20373
        mmWidth = 6350
        BandType = 0
      end
      object rpProcPrevLbl13: TppLabel
        UserName = 'rpProcPrevLbl13'
        AutoSize = False
        Caption = 'Risco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 195263
        mmTop = 15875
        mmWidth = 16404
        BandType = 0
      end
      object rpProcPrevLbl14: TppLabel
        UserName = 'rpProcPrevLbl14'
        AutoSize = False
        Caption = 'Máximo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 195263
        mmTop = 20373
        mmWidth = 16404
        BandType = 0
      end
      object rpProcPrevLbl16: TppLabel
        UserName = 'rpProcPrevLbl16'
        AutoSize = False
        Caption = 'Provável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 212196
        mmTop = 20373
        mmWidth = 16404
        BandType = 0
      end
      object rpProcPrevLbl15: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Risco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 212196
        mmTop = 15875
        mmWidth = 16404
        BandType = 0
      end
      object rpProcPrevLbl3: TppLabel
        UserName = 'rpProcPrevLbl3'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 215636
        mmTop = 6615
        mmWidth = 27517
        BandType = 0
      end
      object rpProcPrevLbl2: TppLabel
        UserName = 'rpProcPrevLbl2'
        AutoSize = False
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 215636
        mmTop = 2381
        mmWidth = 27517
        BandType = 0
      end
      object rpProcPrevSysVar1: TppSystemVariable
        UserName = 'rpProcPrevSysVar1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 243946
        mmTop = 2381
        mmWidth = 23283
        BandType = 0
      end
      object rpProcPrevSysVar2: TppSystemVariable
        UserName = 'rpProcPrevSysVar2'
        AutoSize = False
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 243946
        mmTop = 6615
        mmWidth = 23283
        BandType = 0
      end
      object rpProcPrevLbl17: TppLabel
        UserName = 'rpProcPrevLbl17'
        AutoSize = False
        Caption = 'Valor Real'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 229130
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object rpProcPrevLbl19: TppLabel
        UserName = 'rpProcPrevLbl19'
        AutoSize = False
        Caption = 's/Máximo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 246857
        mmTop = 20373
        mmWidth = 16404
        BandType = 0
      end
      object rpProcPrevLbl18: TppLabel
        UserName = 'rpProcPrevLbl18'
        AutoSize = False
        Caption = 'Economia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 246857
        mmTop = 15875
        mmWidth = 16404
        BandType = 0
      end
      object rpProcPrevLbl20: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Economia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 263790
        mmTop = 15875
        mmWidth = 16404
        BandType = 0
      end
      object rpProcPrevLbl21: TppLabel
        UserName = 'rpProcPrevLbl21'
        AutoSize = False
        Caption = 's/Provável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 263790
        mmTop = 20373
        mmWidth = 16404
        BandType = 0
      end
    end
    object rpProcPrevDtlBnd: TppDetailBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpProcPrevFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
    end
    object rpProcPrevSmryBnd: TppSummaryBand
      AfterPrint = rpProcPrevSmryBndAfterPrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpProcPrevSubRep4: TppSubReport
        UserName = 'rpProcPrevSubRep4'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        PrintBehavior = pbSection
        TraverseAllData = False
        DataPipelineName = 'ppProcPrev4'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpProcPrevChildRep4: TppChildReport
          AutoStop = False
          DataPipeline = ppProcPrev4
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Resumo por UF'
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
          Left = 232
          Top = 136
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppProcPrev4'
          object rpProcPrevSubRep4TitBnd: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 26458
            mmPrintPosition = 0
            object rpProcPrevSubRep4Shape1: TppShape
              UserName = 'rpProcPrevSubRep4Shape1'
              mmHeight = 10319
              mmLeft = 6350
              mmTop = 16140
              mmWidth = 185473
              BandType = 1
            end
            object rpProcPrevSubRep4Lbl1: TppLabel
              UserName = 'rpProcPrevSubRep4Lbl1'
              AutoSize = False
              Caption = 'Resumo por UF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 60061
              mmTop = 10319
              mmWidth = 77258
              BandType = 1
            end
            object rpProcPrevSubRep4DBTxt1: TppDBText
              UserName = 'rpProcPrevSubRep4DBTxt1'
              AutoSize = True
              DataField = 'EMPRESA'
              DataPipeline = ppProcPrev4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppProcPrev4'
              mmHeight = 4233
              mmLeft = 89959
              mmTop = 4763
              mmWidth = 17463
              BandType = 1
            end
            object rpProcPrevSubRep4Lbl2: TppLabel
              UserName = 'rpProcPrevSubRep4Lbl2'
              AutoSize = False
              Caption = 'Folha:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 146579
              mmTop = 5027
              mmWidth = 17992
              BandType = 1
            end
            object rpProcPrevSubRep4Lbl3: TppLabel
              UserName = 'rpProcPrevSubRep4Lbl3'
              AutoSize = False
              Caption = 'Emissão:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 146579
              mmTop = 9260
              mmWidth = 17992
              BandType = 1
            end
            object rpProcPrevSubRep4SysVar1: TppSystemVariable
              UserName = 'rpProcPrevSubRep4SysVar1'
              AutoSize = False
              VarType = vtPageSet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 165365
              mmTop = 5027
              mmWidth = 23283
              BandType = 1
            end
            object rpProcPrevSubRep4SysVar2: TppSystemVariable
              UserName = 'rpProcPrevSubRep4SysVar2'
              AutoSize = False
              VarType = vtPrintDateTime
              DisplayFormat = 'DD/MM/YYYY HH:MM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 165365
              mmTop = 9260
              mmWidth = 23283
              BandType = 1
            end
            object rpProcPrevSubRep4Lbl6: TppLabel
              UserName = 'rpProcPrevSubRep4Lbl6'
              AutoSize = False
              Caption = 'Risco Provável'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 42863
              mmTop = 22225
              mmWidth = 23548
              BandType = 1
            end
            object rpProcPrevSubRep4Lbl4: TppLabel
              UserName = 'rpProcPrevSubRep4Lbl4'
              AutoSize = False
              Caption = 'Unid. Federação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 7938
              mmTop = 17198
              mmWidth = 26194
              BandType = 1
            end
            object rpProcPrevSubRep4Lbl5: TppLabel
              UserName = 'rpProcPrevSubRep4Lbl5'
              AutoSize = False
              Caption = 'Qtde.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 25400
              mmTop = 22225
              mmWidth = 8467
              BandType = 1
            end
            object rpProcPrevSubRep4Lbl7: TppLabel
              UserName = 'rpProcPrevSubRep4Lbl7'
              AutoSize = False
              Caption = 'Risco Máximo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 75142
              mmTop = 22225
              mmWidth = 23548
              BandType = 1
            end
            object rpProcPrevSubRep4Lbl8: TppLabel
              UserName = 'Label3'
              AutoSize = False
              Caption = 'Valor Real'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 107950
              mmTop = 22225
              mmWidth = 23548
              BandType = 1
            end
            object rpProcPrevSubRep4Lbl9: TppLabel
              UserName = 'rpProcPrevSubRep4Lbl9'
              AutoSize = False
              Caption = 'Economia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 138907
              mmTop = 17198
              mmWidth = 50006
              BandType = 1
            end
            object rpProcPrevSubRep4Lbl10: TppLabel
              UserName = 'rpProcPrevLbl101'
              AutoSize = False
              Caption = 'Sobre Máximo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 138907
              mmTop = 22225
              mmWidth = 23813
              BandType = 1
            end
            object rpProcPrevSubRep4Lbl11: TppLabel
              UserName = 'Label4'
              AutoSize = False
              Caption = 'Sobre Provável'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 165100
              mmTop = 22225
              mmWidth = 23813
              BandType = 1
            end
            object rpProcPrevSubRep4Line1: TppLine
              UserName = 'rpProcPrevSubRep4Line1'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 38100
              mmTop = 16140
              mmWidth = 1323
              BandType = 1
            end
            object rpProcPrevSubRep4Line4: TppLine
              UserName = 'rpProcPrevSubRep4Line4'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 135732
              mmTop = 16140
              mmWidth = 1323
              BandType = 1
            end
            object rpProcPrevSubRep4Line2: TppLine
              UserName = 'rpProcPrevSubRep4Line2'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 70644
              mmTop = 16140
              mmWidth = 1323
              BandType = 1
            end
            object rpProcPrevSubRep4Line3: TppLine
              UserName = 'rpProcPrevSubRep4Line3'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 103188
              mmTop = 16140
              mmWidth = 1323
              BandType = 1
            end
          end
          object rpProcPrevSubRep4DtlBnd: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 8996
            mmPrintPosition = 0
            object rpProcPrevSubRep4ShapeShape2: TppShape
              UserName = 'rpProcPrevSubRep4ShapeShape2'
              mmHeight = 8996
              mmLeft = 6350
              mmTop = 0
              mmWidth = 185473
              BandType = 4
            end
            object rpProcPrevSubRep4DBTxt2: TppDBText
              UserName = 'rpProcPrevSubRep2DBTxt2'
              DataField = 'ESTADO'
              DataPipeline = ppProcPrev4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppProcPrev4'
              mmHeight = 2910
              mmLeft = 7938
              mmTop = 794
              mmWidth = 123561
              BandType = 4
            end
            object rpProcPrevSubRep4DBTxt4: TppDBText
              UserName = 'DBText201'
              DataField = 'VALRECLAMADO'
              DataPipeline = ppProcPrev4
              DisplayFormat = '#,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProcPrev4'
              mmHeight = 2910
              mmLeft = 42863
              mmTop = 5292
              mmWidth = 23548
              BandType = 4
            end
            object rpProcPrevSubRep4DBTxt3: TppDBText
              UserName = 'rpProcPrevSubRep3DBTxt2'
              DataField = 'QTDPROC'
              DataPipeline = ppProcPrev4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProcPrev4'
              mmHeight = 2910
              mmLeft = 19579
              mmTop = 5292
              mmWidth = 14288
              BandType = 4
            end
            object rpProcPrevSubRep4DBTxt5: TppDBText
              UserName = 'rpProcPrevSubRep4DBTxt5'
              DataField = 'VALESTIMADO'
              DataPipeline = ppProcPrev4
              DisplayFormat = '#,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProcPrev4'
              mmHeight = 2910
              mmLeft = 75142
              mmTop = 5292
              mmWidth = 23548
              BandType = 4
            end
            object rpProcPrevSubRep4DBTxt6: TppDBText
              UserName = 'rpProcPrevSubRep4DBTxt6'
              DataField = 'VALREAL'
              DataPipeline = ppProcPrev4
              DisplayFormat = '#,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProcPrev4'
              mmHeight = 2910
              mmLeft = 107950
              mmTop = 5292
              mmWidth = 23548
              BandType = 4
            end
            object rpProcPrevSubRep4Line5: TppLine
              UserName = 'rpProcPrevSubRep4Line5'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 38100
              mmTop = 5292
              mmWidth = 1323
              BandType = 4
            end
            object rpProcPrevSubRep4Line6: TppLine
              UserName = 'rpProcPrevSubRep4Line6'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 70644
              mmTop = 5292
              mmWidth = 1323
              BandType = 4
            end
            object rpProcPrevSubRep4Line7: TppLine
              UserName = 'rpProcPrevSubRep4Line7'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 103188
              mmTop = 5292
              mmWidth = 1323
              BandType = 4
            end
            object rpProcPrevSubRep4Line8: TppLine
              UserName = 'rpProcPrevSubRep4Line8'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 135732
              mmTop = 5292
              mmWidth = 1323
              BandType = 4
            end
            object rpProcPrevSubRep4DBTxt7: TppDBText
              UserName = 'rpProcPrevSubRep4DBTxt7'
              DataField = 'ECONRECLAMADO'
              DataPipeline = ppProcPrev4
              DisplayFormat = '#,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProcPrev4'
              mmHeight = 2910
              mmLeft = 138907
              mmTop = 5292
              mmWidth = 23813
              BandType = 4
            end
            object rpProcPrevSubRep4DBTxt8: TppDBText
              UserName = 'rpProcPrevSubRep4DBTxt8'
              DataField = 'ECONESTIMADO'
              DataPipeline = ppProcPrev4
              DisplayFormat = '#,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProcPrev4'
              mmHeight = 2910
              mmLeft = 165100
              mmTop = 5292
              mmWidth = 23813
              BandType = 4
            end
          end
          object rpProcPrevSubRep4Grp1: TppGroup
            BreakName = 'EMPRESA'
            DataPipeline = ppProcPrev4
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'rpProcPrevSubRep4Grp1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppProcPrev4'
            object rpProcPrevSubRep4GrpHdrBnd: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object rpProcPrevSubRep4GrpFootBnd: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 9525
              mmPrintPosition = 0
              object rpProcPrevSubRep4Shape3: TppShape
                UserName = 'rpProcPrevSubRep4Shape3'
                mmHeight = 9525
                mmLeft = 6350
                mmTop = 0
                mmWidth = 185473
                BandType = 5
                GroupNo = 0
              end
              object rpProcPrevSubRep4Lbl12: TppLabel
                UserName = 'Label5'
                AutoSize = False
                Caption = 'Totais'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 8202
                mmTop = 1058
                mmWidth = 12700
                BandType = 5
                GroupNo = 0
              end
              object rpProcPrevSubRep4DBCalc1: TppDBCalc
                UserName = 'rpProcPrevSubRep4DBCalc1'
                DataField = 'QTDPROC'
                DataPipeline = ppProcPrev4
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcPrevSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcPrev4'
                mmHeight = 3175
                mmLeft = 19579
                mmTop = 5556
                mmWidth = 14288
                BandType = 5
                GroupNo = 0
              end
              object rpProcPrevSubRep4DBCalc2: TppDBCalc
                UserName = 'rpProcPrevSubRep4DBCalc2'
                DataField = 'VALRECLAMADO'
                DataPipeline = ppProcPrev4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcPrevSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcPrev4'
                mmHeight = 3175
                mmLeft = 42863
                mmTop = 5556
                mmWidth = 23548
                BandType = 5
                GroupNo = 0
              end
              object rpProcPrevSubRep4DBCalc3: TppDBCalc
                UserName = 'rpProcPrevSubRep4DBCalc3'
                DataField = 'VALESTIMADO'
                DataPipeline = ppProcPrev4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcPrevSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcPrev4'
                mmHeight = 3175
                mmLeft = 75142
                mmTop = 5556
                mmWidth = 23548
                BandType = 5
                GroupNo = 0
              end
              object rpProcPrevSubRep4DBCalc4: TppDBCalc
                UserName = 'rpProcPrevSubRep4DBCalc4'
                DataField = 'VALREAL'
                DataPipeline = ppProcPrev4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcPrevSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcPrev4'
                mmHeight = 3175
                mmLeft = 107950
                mmTop = 5556
                mmWidth = 23548
                BandType = 5
                GroupNo = 0
              end
              object rpProcPrevSubRep4DBCalc5: TppDBCalc
                UserName = 'rpProcPrevSubRep4DBCalc5'
                DataField = 'ECONRECLAMADO'
                DataPipeline = ppProcPrev4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcPrevSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcPrev4'
                mmHeight = 3175
                mmLeft = 138907
                mmTop = 5556
                mmWidth = 23813
                BandType = 5
                GroupNo = 0
              end
              object rpProcPrevSubRep4DBCalc6: TppDBCalc
                UserName = 'rpProcPrevSubRep4DBCalc6'
                DataField = 'ECONESTIMADO'
                DataPipeline = ppProcPrev4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcPrevSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcPrev4'
                mmHeight = 3175
                mmLeft = 165100
                mmTop = 5556
                mmWidth = 23813
                BandType = 5
                GroupNo = 0
              end
              object rpProcPrevSubRep4Line9: TppLine
                UserName = 'rpProcPrevSubRep4Line9'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 9525
                mmLeft = 38100
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object rpProcPrevSubRep4Line10: TppLine
                UserName = 'rpProcPrevSubRep4Line10'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 9525
                mmLeft = 70644
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object rpProcPrevSubRep4Line11: TppLine
                UserName = 'rpProcPrevSubRep4Line11'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 9525
                mmLeft = 103188
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object rpProcPrevSubRep4Line12: TppLine
                UserName = 'rpProcPrevSubRep4Line12'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 9525
                mmLeft = 135732
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
    end
    object rpProcPrevGrp0: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppProcPrev
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'rpProcPrevGrp0'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppProcPrev'
      object rpProcPrevGrpHdrBnd0: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpProcPrevGrpFootBnd0: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rpProcPrevLbl22: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Total de Processos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 17198
          mmTop = 1852
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object rpProcPrevDBCalc1: TppDBCalc
          UserName = 'rpProcPrevDBCalc1'
          DataField = 'NUMPROCTRAB'
          DataPipeline = ppProcPrev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpProcPrevGrp0
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppProcPrev'
          mmHeight = 3175
          mmLeft = 48154
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpProcPrevLbl23: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Custo Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 175155
          mmTop = 1852
          mmWidth = 19579
          BandType = 5
          GroupNo = 0
        end
        object rpProcPrevDBCalc2: TppDBCalc
          UserName = 'rpProcPrevDBCalc2'
          BlankWhenZero = True
          DataField = 'RISCOMAXIMO'
          DataPipeline = ppProcPrev
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcPrevGrp0
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 195263
          mmTop = 2381
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object rpProcPrevDBCalc3: TppDBCalc
          UserName = 'rpProcPrevDBCalc3'
          BlankWhenZero = True
          DataField = 'RISCOPROVAVEL'
          DataPipeline = ppProcPrev
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcPrevGrp0
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 212196
          mmTop = 2381
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object rpProcPrevDBCalc4: TppDBCalc
          UserName = 'rpProcPrevDBCalc4'
          BlankWhenZero = True
          DataField = 'VALORREAL'
          DataPipeline = ppProcPrev
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcPrevGrp0
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 229130
          mmTop = 2381
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpProcPrevDBCalc5: TppDBCalc
          UserName = 'rpProcPrevDBCalc5'
          BlankWhenZero = True
          DataField = 'ECONOMIA1'
          DataPipeline = ppProcPrev
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcPrevGrp0
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 246857
          mmTop = 2381
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object rpProcPrevDBCalc6: TppDBCalc
          UserName = 'rpProcPrevDBCalc6'
          BlankWhenZero = True
          DataField = 'ECONOMIA2'
          DataPipeline = ppProcPrev
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcPrevGrp0
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 263790
          mmTop = 2381
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpProcPrevGrp1: TppGroup
      BreakName = 'NUMPROCTRAB'
      DataPipeline = ppProcPrev
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'rpProcPrevGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppProcPrev'
      object rpProcPrevGrpHdrBnd1: TppGroupHeaderBand
        BeforePrint = rpProcPrevGrpHdrBnd1BeforePrint
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object rpProcPrevShape1: TppShape
          UserName = 'rpProcPrevShape1'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 4498
          mmLeft = 3969
          mmTop = 0
          mmWidth = 277548
          BandType = 3
          GroupNo = 1
        end
        object rpProcPrevDBTxt2: TppDBText
          UserName = 'rpProcPrevDBTxt2'
          DataField = 'NUMPROCTRAB'
          DataPipeline = ppProcPrev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 5027
          mmTop = 794
          mmWidth = 32808
          BandType = 3
          GroupNo = 1
        end
        object rpProcPrevDBTxt3: TppDBText
          UserName = 'rpProcPrevDBTxt3'
          DataField = 'UF'
          DataPipeline = ppProcPrev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 38365
          mmTop = 794
          mmWidth = 5292
          BandType = 3
          GroupNo = 1
        end
        object rpProcPrevDBTxt4: TppDBText
          UserName = 'rpProcPrevDBTxt4'
          DataField = 'CONTRAPARTE'
          DataPipeline = ppProcPrev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 44186
          mmTop = 794
          mmWidth = 45773
          BandType = 3
          GroupNo = 1
        end
        object rpProcPrevDBTxt5: TppDBText
          UserName = 'rpProcPrevDBTxt5'
          DataField = 'NOMEVARA'
          DataPipeline = ppProcPrev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 90488
          mmTop = 794
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object rpProcPrevDBTxt6: TppDBText
          UserName = 'rpProcPrevDBTxt6'
          DataField = 'DATADEMISSAO'
          DataPipeline = ppProcPrev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 106627
          mmTop = 794
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object rpProcPrevDBTxt7: TppDBText
          UserName = 'rpProcPrevDBTxt7'
          DataField = 'PATROCINADORA'
          DataPipeline = ppProcPrev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 122767
          mmTop = 794
          mmWidth = 39158
          BandType = 3
          GroupNo = 1
        end
        object rpProcPrevDBTxt8: TppDBText
          UserName = 'rpProcPrevDBTxt8'
          DataField = 'NUMVARAJUSTICA'
          DataPipeline = ppProcPrev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 138642
          mmTop = 794
          mmWidth = 32808
          BandType = 3
          GroupNo = 1
        end
        object rpProcPrevDBTxt9: TppDBText
          UserName = 'rpProcPrevDBTxt9'
          DataField = 'DATANOTIF'
          DataPipeline = ppProcPrev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 171980
          mmTop = 794
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object rpProcPrevDBTxt10: TppDBText
          UserName = 'rpProcPrevDBTxt10'
          DataField = 'SITUACAO'
          DataPipeline = ppProcPrev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 188384
          mmTop = 794
          mmWidth = 6350
          BandType = 3
          GroupNo = 1
        end
        object rpProcPrevDBTxt11: TppDBText
          UserName = 'rpProcPrevDBTxt11'
          BlankWhenZero = True
          DataField = 'RISCOMAXIMO'
          DataPipeline = ppProcPrev
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 195263
          mmTop = 794
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object rpProcPrevDBTxtCARGO: TppDBText
          UserName = 'rpProcPrevDBTxtCARGO'
          DataField = 'CARGO'
          DataPipeline = ppProcPrev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 26988
          mmTop = 5556
          mmWidth = 58473
          BandType = 3
          GroupNo = 1
        end
        object rpProcPrevDBTxt12: TppDBText
          UserName = 'rpProcPrevDBTxt12'
          BlankWhenZero = True
          DataField = 'RISCOPROVAVEL'
          DataPipeline = ppProcPrev
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 212196
          mmTop = 794
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object rpProcPrevDBTxt13: TppDBText
          UserName = 'rpProcPrevDBTxt13'
          BlankWhenZero = True
          DataField = 'VALORREAL'
          DataPipeline = ppProcPrev
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 229130
          mmTop = 794
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object rpProcPrevDBTxt14: TppDBText
          UserName = 'rpProcPrevDBTxt14'
          BlankWhenZero = True
          DataField = 'ECONOMIA1'
          DataPipeline = ppProcPrev
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 246857
          mmTop = 794
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object rpProcPrevDBTxt15: TppDBText
          UserName = 'rpProcPrevDBTxt15'
          BlankWhenZero = True
          DataField = 'ECONOMIA2'
          DataPipeline = ppProcPrev
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcPrev'
          mmHeight = 2910
          mmLeft = 263790
          mmTop = 794
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
      end
      object rpProcPrevGrpFootBnd1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object rpProcPrevSubRep1: TppSubReport
          UserName = 'rpProcPrevSubRep1'
          ExpandAll = False
          KeepTogether = True
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppProcPrev1'
          mmHeight = 3704
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpProcPrevChildRep1: TppChildReport
            AutoStop = False
            DataPipeline = ppProcPrev1
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Relação de Processos'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 210000
            PrinterSetup.mmPaperWidth = 297000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utMillimeters
            Left = 232
            Top = 136
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppProcPrev1'
            object rpProcPrevSubRep1TitBnd: TppTitleBand
              BeforePrint = rpProcPrevSubRep1TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object rpProcPrevSubRep1Lbl1: TppLabel
                UserName = 'rpProcPrevSubRep1Lbl1'
                AutoSize = False
                Caption = 'Nome do Litisconsorte'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 26458
                mmTop = 265
                mmWidth = 40746
                BandType = 1
              end
              object rpProcPrevSubRep1Lbl2: TppLabel
                UserName = 'rpProcPrevSubRep1Lbl2'
                AutoSize = False
                Caption = 'Situação do Litisconsorte'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 125942
                mmTop = 265
                mmWidth = 40746
                BandType = 1
              end
            end
            object rpProcPrevSubRep1DtlBnd: TppDetailBand
              BeforePrint = rpProcPrevSubRep1TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object rpProcPrevSubRep1DBTxt1: TppDBText
                UserName = 'rpProcPrevSubRep1DBTxt1'
                DataField = 'LITISCONSORTE'
                DataPipeline = ppProcPrev1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppProcPrev1'
                mmHeight = 2910
                mmLeft = 26458
                mmTop = 265
                mmWidth = 96309
                BandType = 4
              end
              object rpProcPrevSubRep1DBTxt2: TppDBText
                UserName = 'rpProcPrevSubRep1DBTxt2'
                DataField = 'SITUACAO'
                DataPipeline = ppProcPrev1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppProcPrev1'
                mmHeight = 2910
                mmLeft = 125942
                mmTop = 265
                mmWidth = 100000
                BandType = 4
              end
            end
            object ppSummaryBand1: TppSummaryBand
              BeforePrint = rpProcPrevSubRep1TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 2646
              mmPrintPosition = 0
            end
          end
        end
        object rpProcPrevSubRep2: TppSubReport
          UserName = 'rpProcPrevSubRep2'
          ExpandAll = False
          KeepTogether = True
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = rpProcPrevSubRep1
          TraverseAllData = False
          DataPipelineName = 'ppProcPrev2'
          mmHeight = 3704
          mmLeft = 0
          mmTop = 3440
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpProcPrevChildRep2: TppChildReport
            AutoStop = False
            DataPipeline = ppProcPrev2
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Relação de Processos'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 210000
            PrinterSetup.mmPaperWidth = 297000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utMillimeters
            Left = 232
            Top = 136
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppProcPrev2'
            object rpProcPrevSubRep2TitBnd: TppTitleBand
              BeforePrint = rpProcPrevSubRep2TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object rpProcPrevSubRep2Lbl1: TppLabel
                UserName = 'rpProcPrevSubRep2Lbl1'
                AutoSize = False
                Caption = 'Tipo de Etapa ou Andamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 26458
                mmTop = 265
                mmWidth = 72231
                BandType = 1
              end
              object rpProcPrevSubRep2Lbl2: TppLabel
                UserName = 'rpProcPrevSubRep2Lbl2'
                AutoSize = False
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 102394
                mmTop = 265
                mmWidth = 19315
                BandType = 1
              end
              object ppLabel1: TppLabel
                UserName = 'Label1'
                AutoSize = False
                Caption = 'Seq.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 17727
                mmTop = 265
                mmWidth = 7408
                BandType = 1
              end
              object ppLabel2: TppLabel
                UserName = 'Label2'
                AutoSize = False
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 124619
                mmTop = 529
                mmWidth = 19315
                BandType = 1
              end
              object ppLabel3: TppLabel
                UserName = 'Label3'
                AutoSize = False
                Caption = 'Custas Judic.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 146844
                mmTop = 529
                mmWidth = 19315
                BandType = 1
              end
              object rpProcJudSubRep2Lbl3: TppLabel
                UserName = 'rpProcJudSubRep2Lbl3'
                Caption = 'Assunto Resumido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3175
                mmLeft = 168011
                mmTop = 529
                mmWidth = 23813
                BandType = 1
              end
            end
            object rpProcPrevSubRep2DtlBnd: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 20108
              mmPrintPosition = 0
              object rpProcPrevSubRep2DBTxt1: TppDBText
                UserName = 'rpProcPrevSubRep2DBTxt1'
                DataField = 'ETAPA'
                DataPipeline = ppProcPrev2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppProcPrev2'
                mmHeight = 2910
                mmLeft = 26458
                mmTop = 265
                mmWidth = 72231
                BandType = 4
              end
              object rpProcPrevSubRep2DBTxt2: TppDBText
                UserName = 'rpProcPrevSubRep2DBTxt2'
                DataField = 'DATAREALOCOR'
                DataPipeline = ppProcPrev2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppProcPrev2'
                mmHeight = 2910
                mmLeft = 102394
                mmTop = 265
                mmWidth = 19315
                BandType = 4
              end
              object rpProcPrevSubRep2DBMemo1: TppDBMemo
                UserName = 'rpProcPrevSubRep2DBMemo1'
                CharWrap = False
                DataField = 'OBSERVETAPA'
                DataPipeline = ppProcPrev2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Stretch = True
                Transparent = True
                DataPipelineName = 'ppProcPrev2'
                mmHeight = 15081
                mmLeft = 37306
                mmTop = 3704
                mmWidth = 120650
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
              object rpProcPrevSubRep2DBNumSeq: TppDBText
                UserName = 'rpProcPrevSubRep2DBNumSeq'
                DataField = 'NUMSEQ'
                DataPipeline = ppProcPrev2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcPrev2'
                mmHeight = 2910
                mmLeft = 15346
                mmTop = 265
                mmWidth = 7408
                BandType = 4
              end
              object rpProcJudSubRep2Valor: TppDBText
                UserName = 'DBText3'
                DataField = 'VALORREC'
                DataPipeline = ppProcPrev2
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcPrev2'
                mmHeight = 2910
                mmLeft = 124619
                mmTop = 265
                mmWidth = 19315
                BandType = 4
              end
              object ppDBText1: TppDBText
                UserName = 'DBText4'
                DataField = 'VALORCUSTAS'
                DataPipeline = ppProcPrev2
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcPrev2'
                mmHeight = 2910
                mmLeft = 146844
                mmTop = 265
                mmWidth = 19315
                BandType = 4
              end
              object rpProcJudSubRep2DBTxt3: TppDBText
                UserName = 'rpProcJudSubRep2DBTxt3'
                DataField = 'ASSUNTO'
                DataPipeline = ppProcPrev2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppProcPrev2'
                mmHeight = 2910
                mmLeft = 168011
                mmTop = 265
                mmWidth = 89429
                BandType = 4
              end
            end
            object rpProcPrevSubRep2SmryBnd: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 2646
              mmPrintPosition = 0
            end
          end
        end
        object rpProcPrevSubRep3: TppSubReport
          UserName = 'rpProcPrevSubRep3'
          ExpandAll = False
          KeepTogether = True
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = rpProcPrevSubRep2
          TraverseAllData = False
          DataPipelineName = 'ppProcPrev3'
          mmHeight = 3704
          mmLeft = 0
          mmTop = 6879
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpProcPrevChildRep3: TppChildReport
            AutoStop = False
            DataPipeline = ppProcPrev3
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Relação de Processos'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 210000
            PrinterSetup.mmPaperWidth = 297000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utMillimeters
            Left = 232
            Top = 136
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppProcPrev3'
            object rpProcPrevSubRep3TitBnd: TppTitleBand
              BeforePrint = rpProcPrevSubRep3TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object rpProcPrevSubRep3Lbl1: TppLabel
                UserName = 'rpProcPrevSubRep2Lbl1'
                AutoSize = False
                Caption = 'Tipo de Objeto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 26458
                mmTop = 265
                mmWidth = 72231
                BandType = 1
              end
              object rpProcPrevSubRep3Lbl2: TppLabel
                UserName = 'rpProcPrevSubRep2Lbl2'
                AutoSize = False
                Caption = 'Período de Ocorrência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 128323
                mmTop = 265
                mmWidth = 34396
                BandType = 1
              end
            end
            object rpProcPrevSubRep3DtlBnd: TppDetailBand
              BeforePrint = rpProcPrevSubRep3DtlBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object rpProcPrevSubRep3DBTxt1: TppDBText
                UserName = 'rpProcPrevSubRep2DBTxt2'
                DataField = 'OBJETO'
                DataPipeline = ppProcPrev3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppProcPrev3'
                mmHeight = 2910
                mmLeft = 26458
                mmTop = 265
                mmWidth = 72231
                BandType = 4
              end
              object rpProcPrevSubRep3DBTxt3: TppDBText
                UserName = 'DBText201'
                DataField = 'DATAFINAL'
                DataPipeline = ppProcPrev3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppProcPrev3'
                mmHeight = 2910
                mmLeft = 148432
                mmTop = 529
                mmWidth = 14288
                BandType = 4
              end
              object rpProcPrevSubRep3DBTxt2: TppDBText
                UserName = 'rpProcPrevSubRep3DBTxt2'
                DataField = 'DATAINICIO'
                DataPipeline = ppProcPrev3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppProcPrev3'
                mmHeight = 2910
                mmLeft = 128323
                mmTop = 265
                mmWidth = 14288
                BandType = 4
              end
              object rpProcPrevSubRep3LblRiscoMax: TppLabel
                UserName = 'rpProcPrevSubRep3LblRiscoMax'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 195263
                mmTop = 529
                mmWidth = 16404
                BandType = 4
              end
              object rpProcPrevSubRep3LblRiscoProv: TppLabel
                UserName = 'rpProcPrevSubRep3LblRiscoProv'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 212196
                mmTop = 529
                mmWidth = 16404
                BandType = 4
              end
              object rpProcPrevSubRep3LblValorReal: TppLabel
                UserName = 'rpProcPrevSubRep3LblValorReal'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 229130
                mmTop = 529
                mmWidth = 17198
                BandType = 4
              end
              object rpProcPrevSubRep3LblEconomia1: TppLabel
                UserName = 'rpProcPrevSubRep3LblEconomia1'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 246857
                mmTop = 529
                mmWidth = 16404
                BandType = 4
              end
              object rpProcPrevSubRep3LblEconomia2: TppLabel
                UserName = 'rpProcPrevSubRep3LblEconomia2'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 263790
                mmTop = 529
                mmWidth = 16404
                BandType = 4
              end
            end
            object rpProcPrevSubRep3SmryBnd: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 2626
              mmPrintPosition = 0
            end
          end
        end
      end
    end
  end
  object ppProcPrev: TppBDEPipeline
    DataSource = dsProcPrev
    UserName = 'ppProcPrev'
    Left = 357
    Top = 56
    object ppProcPrevppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppProcPrevppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPROCTRAB'
      FieldName = 'NUMPROCTRAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppProcPrevppField3: TppField
      FieldAlias = 'PROCJCJNUM'
      FieldName = 'PROCJCJNUM'
      FieldLength = 25
      DisplayWidth = 25
      Position = 2
    end
    object ppProcPrevppField4: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppProcPrevppField5: TppField
      FieldAlias = 'CONTRAPARTE'
      FieldName = 'CONTRAPARTE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 4
    end
    object ppProcPrevppField6: TppField
      FieldAlias = 'NOMEVARA'
      FieldName = 'NOMEVARA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 5
    end
    object ppProcPrevppField7: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppProcPrevppField8: TppField
      FieldAlias = 'DATADEMISSAO'
      FieldName = 'DATADEMISSAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object ppProcPrevppField9: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object ppProcPrevppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMVARAJUSTICA'
      FieldName = 'NUMVARAJUSTICA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppProcPrevppField11: TppField
      FieldAlias = 'DATANOTIF'
      FieldName = 'DATANOTIF'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppProcPrevppField12: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 11
    end
    object ppProcPrevppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'RISCOMAXIMO'
      FieldName = 'RISCOMAXIMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppProcPrevppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'RISCOPROVAVEL'
      FieldName = 'RISCOPROVAVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppProcPrevppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORREAL'
      FieldName = 'VALORREAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppProcPrevppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'ECONOMIA1'
      FieldName = 'ECONOMIA1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppProcPrevppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'ECONOMIA2'
      FieldName = 'ECONOMIA2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppProcPrevppField18: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 17
    end
    object ppProcPrevppField19: TppField
      FieldAlias = 'MOEDAPROCTRAB'
      FieldName = 'MOEDAPROCTRAB'
      FieldLength = 20
      DisplayWidth = 20
      Position = 18
    end
    object ppProcPrevppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDREGRA'
      FieldName = 'IDREGRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppProcPrevppField21: TppField
      FieldAlias = 'DATAEFETENC'
      FieldName = 'DATAEFETENC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 20
    end
    object ppProcPrevppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'INDTAXACONV'
      FieldName = 'INDTAXACONV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppProcPrevppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGSITPROC'
      FieldName = 'FLGSITPROC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
  end
  object dsProcPrev: TwwDataSource
    DataSet = qryProcPrev
    Left = 357
    Top = 104
  end
  object qryProcPrev: TwwQuery
    CachedUpdates = True
    AfterScroll = qryProcPrevAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  0 AS NUMPROCTRAB,'
      '  '#39'1234567890123456789012345'#39' AS PROCJCJNUM,'
      '  '#39'123456789012345678901234567890'#39' AS UF,'
      '  '#39'123456789012345678901234567890'#39' AS CONTRAPARTE,'
      '  '#39'123456789012345678901234567890'#39' AS NOMEVARA,'
      '  '#39'1234567890'#39' AS DATAADMISSAO,'
      '  '#39'1234567890'#39' AS DATADEMISSAO,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS PATROCINADORA,'
      '  0 AS NUMVARAJUSTICA,'
      '  '#39'1234567890'#39' AS DATANOTIF,'
      '  '#39'123'#39' AS SITUACAO,'
      '  0 AS RISCOMAXIMO,'
      '  0 AS RISCOPROVAVEL,'
      '  0 AS VALORREAL,'
      '  0 AS ECONOMIA1,'
      '  0 AS ECONOMIA2,'
      '  '#39'1234567890123456789012345678901234567890'#39' AS CARGO,'
      '  '#39'12345678901234567890'#39' AS MOEDAPROCTRAB,'
      '  0 AS IDREGRA,'
      '  '#39'1234567890'#39' AS DATAEFETENC,'
      '  0 AS INDTAXACONV,'
      '  0 AS FLGSITPROC'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ' ')
    UpdateObject = updProcPrev
    ValidateWithMask = True
    Left = 357
    Top = 152
  end
  object ppProcPrev1: TppBDEPipeline
    DataSource = dsProcPrev1
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'ppProcPrev1'
    Left = 36
    Top = 56
    object ppProcPrev1ppField1: TppField
      FieldAlias = 'LITISCONSORTE'
      FieldName = 'LITISCONSORTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppProcPrev1ppField2: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object dsProcPrev1: TwwDataSource
    DataSet = qryProcPrev1
    Left = 36
    Top = 104
  end
  object qryProcPrev1: TwwQuery
    AfterOpen = qryProcPrev1AfterOpen
    DatabaseName = 'BaseDados'
    DataSource = dsProcPrev
    SQL.Strings = (
      'SELECT'
      '  DECODE(P.TIPO,'#39'F'#39', P.NOME, P.RAZAOSOCIAL) AS LITISCONSORTE,'
      '  DECODE(C.IDMOTIVO,NULL,'#39'Normal'#39', M.DESCRICAO) AS SITUACAO'
      'FROM'
      '  PESSOA P, COPARTPROCTRAB C, MOTIVO M'
      'WHERE'
      '  (C.NUMPROCTRAB = :NUMPROCTRAB) AND'
      ''
      '  (C.IDPESSOA    = P.IDPESSOA) AND'
      '  (C.IDMOTIVO    = M.IDMOTIVO(+))'
      'ORDER BY'
      '  LITISCONSORTE')
    ValidateWithMask = True
    Left = 36
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
  end
  object updProcPrev: TUpdateSQL
    Left = 357
    Top = 200
  end
  object ppProcPrev2: TppBDEPipeline
    DataSource = dsProcPrev2
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'ppProcPrev2'
    Left = 112
    Top = 56
    object ppProcPrev2ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMSEQ'
      FieldName = 'NUMSEQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppProcPrev2ppField2: TppField
      FieldAlias = 'ETAPA'
      FieldName = 'ETAPA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 1
    end
    object ppProcPrev2ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORHONOR'
      FieldName = 'VALORHONOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppProcPrev2ppField4: TppField
      FieldAlias = 'DATAREALOCOR'
      FieldName = 'DATAREALOCOR'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object ppProcPrev2ppField5: TppField
      FieldAlias = 'ASSUNTO'
      FieldName = 'ASSUNTO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
    object ppProcPrev2ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPROCTRAB'
      FieldName = 'NUMPROCTRAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppProcPrev2ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODTIPORECURSO'
      FieldName = 'CODTIPORECURSO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppProcPrev2ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORREC'
      FieldName = 'VALORREC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppProcPrev2ppField9: TppField
      FieldAlias = 'OBSERVETAPA'
      FieldName = 'OBSERVETAPA'
      FieldLength = 1
      DataType = dtMemo
      DisplayWidth = 10
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppProcPrev2ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMAGEM'
      FieldName = 'IDIMAGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object VALORCUSTAS: TppField
      FieldAlias = 'VALORCUSTAS'
      FieldName = 'VALORCUSTAS'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
  end
  object dsProcPrev2: TwwDataSource
    DataSet = qryProcPrev2
    Left = 112
    Top = 104
  end
  object qryProcPrev2: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsProcPrev
    SQL.Strings = (
      'SELECT'
      '  E.NUMSEQ, T.DESCRICAO AS ETAPA, T.VALORHONOR,'
      '  E.DATAREALOCOR, E.ASSUNTO, E.NUMPROCTRAB,'
      '  E.CODTIPORECURSO, E.VALORREC, E.OBSERVETAPA,'
      '  E.IDIMAGEM, E.VALORCUSTAS'
      'FROM'
      '  ETAPAPROCTRAB E, TIPORECTRAB T'
      'WHERE'
      '  (E.NUMPROCTRAB    = :NUMPROCTRAB) AND'
      ''
      '  (E.CODTIPORECURSO = T.CODTIPORECURSO)'
      'ORDER BY'
      '  E.DATAREALOCOR')
    ValidateWithMask = True
    Left = 112
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
  end
  object ppProcPrev3: TppBDEPipeline
    DataSource = dsProcPrev3
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'ppProcPrev3'
    Left = 190
    Top = 56
  end
  object dsProcPrev3: TwwDataSource
    DataSet = qryProcPrev3
    Left = 190
    Top = 104
  end
  object qryProcPrev3: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsProcPrev
    SQL.Strings = (
      'SELECT'
      '  O.NUMPROCTRAB, O.CODTIPOOBJETO, O.VALORRECL,'
      '  O.PERCPROB, O.PERCORIG, O.VALORSENTENCA, O.INDVALOR,'
      '  O.DATAINICIO, O.DATAFINAL, T.DESCRICAO AS OBJETO'
      'FROM'
      '  OBJPROCTRAB O, TIPOOBJPROCTRAB T'
      'WHERE'
      '  (O.NUMPROCTRAB   = :NUMPROCTRAB) AND'
      ''
      '  (O.CODTIPOOBJETO = T.CODTIPOOBJETO)'
      'ORDER BY'
      '  O.NUMPROCTRAB, UPPER(T.DESCRICAO)')
    ValidateWithMask = True
    Left = 190
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
  end
  object ppProcPrev4: TppBDEPipeline
    DataSource = dsProcPrev4
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'ppProcPrev4'
    Left = 270
    Top = 56
    object ppProcPrev4ppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppProcPrev4ppField2: TppField
      FieldAlias = 'IDESTADO'
      FieldName = 'IDESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppProcPrev4ppField3: TppField
      FieldAlias = 'ESTADO'
      FieldName = 'ESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppProcPrev4ppField4: TppField
      FieldAlias = 'QTDPROC'
      FieldName = 'QTDPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppProcPrev4ppField5: TppField
      FieldAlias = 'VALRECLAMADO'
      FieldName = 'VALRECLAMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppProcPrev4ppField6: TppField
      FieldAlias = 'VALESTIMADO'
      FieldName = 'VALESTIMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppProcPrev4ppField7: TppField
      FieldAlias = 'VALREAL'
      FieldName = 'VALREAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppProcPrev4ppField8: TppField
      FieldAlias = 'ECONRECLAMADO'
      FieldName = 'ECONRECLAMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppProcPrev4ppField9: TppField
      FieldAlias = 'ECONESTIMADO'
      FieldName = 'ECONESTIMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object dsProcPrev4: TwwDataSource
    DataSet = qryProcPrev4
    Left = 270
    Top = 104
  end
  object qryProcPrev4: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  0 AS IDESTADO,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS ESTADO,'
      '  0 AS QTDPROC,'
      '  0 AS VALRECLAMADO,'
      '  0 AS VALESTIMADO,'
      '  0 AS VALREAL,'
      '  0 AS ECONRECLAMADO,'
      '  0 AS ECONESTIMADO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ' ')
    UpdateObject = updProcPrev4
    ValidateWithMask = True
    Left = 270
    Top = 152
  end
  object updProcPrev4: TUpdateSQL
    Left = 270
    Top = 200
  end
  object qryProcPrev1Aux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'Indefinido'#39' AS LITISCONSORTE,'
      '  '#39'Indefinida'#39' AS SITUACAO'
      'FROM'
      '  DUAL')
    ValidateWithMask = True
    Left = 36
    Top = 200
  end
  object CdsProcesso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 77
    Top = 264
  end
  object sqlProcesso: TCMSqlParams
    ClientDataSet = CdsProcesso
    Left = 152
    Top = 264
  end
  object CdsObj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 270
    Top = 264
  end
  object sqlObj: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  O.NUMPROCTRAB, O.CODTIPOOBJETO, O.VALORRECL,'
      '  O.PERCPROB, O.PERCORIG, O.VALORSENTENCA, O.INDVALOR,'
      '  O.DATAINICIO, O.DATAFINAL, T.DESCRICAO AS OBJETO'
      'FROM'
      '  OBJPROCTRAB O, TIPOOBJPROCTRAB T'
      'WHERE'
      '  (O.NUMPROCTRAB   = :NUMPROCTRAB) AND'
      '  (O.CODTIPOOBJETO = T.CODTIPOOBJETO)'
      'ORDER BY'
      '  UPPER(T.DESCRICAO)')
    ClientDataSet = CdsObj
    Left = 321
    Top = 264
  end
end
