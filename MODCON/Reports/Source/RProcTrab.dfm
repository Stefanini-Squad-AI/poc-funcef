inherited RptProcTrab: TRptProcTrab
  Left = 126
  Top = 178
  Width = 506
  Height = 340
  Caption = 'RptProcTrab'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
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
        Caption = 'ImprimirSomenteProcAbertos'
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
        Name = 'ImprimirSomenteProcAbertos'
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
        Caption = 'ImprimirRateio'
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
        Name = 'ImprimirRateio'
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
      end>
    Left = 144
  end
  inherited DevRptCM: TExtraOptions
    Left = 28
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpProcTrab
    Left = 87
  end
  object CdsProcesso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 60
    Top = 264
  end
  object sqlProcesso: TCMSqlParams
    ClientDataSet = CdsProcesso
    Left = 135
    Top = 264
  end
  object CdsObj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 221
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
    Left = 272
    Top = 264
  end
  object rpProcTrab: TppReport
    AutoStop = False
    DataPipeline = ppProcTrab
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
    BeforePrint = rpProcTrabBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 446
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppProcTrab'
    object rpProcTrabHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object rpProcTrabLbl9: TppLabel
        UserName = 'rpProcTrabLbl9'
        AutoSize = False
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 131234
        mmTop = 20373
        mmWidth = 44450
        BandType = 0
      end
      object rpProcTrabLbl7: TppLabel
        UserName = 'rpProcTrabLbl7'
        AutoSize = False
        Caption = 'Admissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 98954
        mmTop = 20373
        mmWidth = 15610
        BandType = 0
      end
      object rpProcTrabLbl1: TppLabel
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
        mmLeft = 2646
        mmTop = 8202
        mmWidth = 279665
        BandType = 0
      end
      object rpProcTrabDBTxt1: TppDBText
        UserName = 'rpProcTrabDBTxt1'
        DataField = 'EMPRESA'
        DataPipeline = ppProcTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppProcTrab'
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 2646
        mmWidth = 279665
        BandType = 0
      end
      object rpProcTrabLbl4: TppLabel
        UserName = 'rpProcTrabLbl4'
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
        mmLeft = 3704
        mmTop = 20373
        mmWidth = 34131
        BandType = 0
      end
      object rpProcTrabLbl5: TppLabel
        UserName = 'rpProcTrabLbl5'
        AutoSize = False
        Caption = 'Vara'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 39158
        mmTop = 20373
        mmWidth = 13758
        BandType = 0
      end
      object rpProcTrabLbl6: TppLabel
        UserName = 'rpProcTrabLbl6'
        AutoSize = False
        Caption = 'Reclamante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 53711
        mmTop = 20373
        mmWidth = 44715
        BandType = 0
      end
      object rpProcTrabLbl8: TppLabel
        UserName = 'rpProcTrabLbl8'
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
        mmLeft = 115094
        mmTop = 20373
        mmWidth = 15610
        BandType = 0
      end
      object rpProcTrabLbl11: TppLabel
        UserName = 'rpProcTrabLbl11'
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
        mmLeft = 176213
        mmTop = 20373
        mmWidth = 16404
        BandType = 0
      end
      object rpProcTrabLbl12: TppLabel
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
        mmLeft = 193146
        mmTop = 20373
        mmWidth = 6350
        BandType = 0
      end
      object rpProcTrabLbl13: TppLabel
        UserName = 'rpProcTrabLbl13'
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
        mmLeft = 200025
        mmTop = 15875
        mmWidth = 15875
        BandType = 0
      end
      object rpProcTrabLbl14: TppLabel
        UserName = 'rpProcTrabLbl14'
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
        mmLeft = 200025
        mmTop = 20373
        mmWidth = 15875
        BandType = 0
      end
      object rpProcTrabLbl16: TppLabel
        UserName = 'rpProcTrabLbl16'
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
        mmLeft = 216430
        mmTop = 20373
        mmWidth = 15875
        BandType = 0
      end
      object rpProcTrabLbl15: TppLabel
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
        mmLeft = 216430
        mmTop = 15875
        mmWidth = 15875
        BandType = 0
      end
      object rpProcTrabLbl3: TppLabel
        UserName = 'rpProcTrabLbl3'
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
      object rpProcTrabLbl2: TppLabel
        UserName = 'rpProcTrabLbl2'
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
      object rpProcTrabSysVar1: TppSystemVariable
        UserName = 'rpProcTrabSysVar1'
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
      object rpProcTrabSysVar2: TppSystemVariable
        UserName = 'rpProcTrabSysVar2'
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
      object rpProcTrabLbl17: TppLabel
        UserName = 'rpProcTrabLbl17'
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
        mmLeft = 232834
        mmTop = 20373
        mmWidth = 15875
        BandType = 0
      end
      object rpProcTrabLbl19: TppLabel
        UserName = 'rpProcTrabLbl19'
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
        mmLeft = 249238
        mmTop = 20373
        mmWidth = 15875
        BandType = 0
      end
      object rpProcTrabLbl18: TppLabel
        UserName = 'rpProcTrabLbl18'
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
        mmLeft = 249238
        mmTop = 15875
        mmWidth = 15875
        BandType = 0
      end
      object rpProcTrabLbl20: TppLabel
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
        mmLeft = 265642
        mmTop = 15875
        mmWidth = 15875
        BandType = 0
      end
      object rpProcTrabLbl21: TppLabel
        UserName = 'rpProcTrabLbl21'
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
        mmLeft = 265642
        mmTop = 20373
        mmWidth = 15875
        BandType = 0
      end
    end
    object rpProcTrabDtlBnd: TppDetailBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpProcTrabFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
    end
    object rpProcTrabSmryBnd: TppSummaryBand
      AfterPrint = rpProcTrabSmryBndAfterPrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object rpProcTrabSubRep4: TppSubReport
        UserName = 'rpProcTrabSubRep4'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        PrintBehavior = pbSection
        TraverseAllData = False
        DataPipelineName = 'ppProcTrab4'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2117
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpProcTrabChildRep4: TppChildReport
          AutoStop = False
          DataPipeline = ppProcTrab4
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
          DataPipelineName = 'ppProcTrab4'
          object rpProcTrabSubRep4TitBnd: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 26458
            mmPrintPosition = 0
            object rpProcTrabSubRep4Shape1: TppShape
              UserName = 'rpProcTrabSubRep4Shape1'
              mmHeight = 10319
              mmLeft = 6350
              mmTop = 16140
              mmWidth = 185473
              BandType = 1
            end
            object rpProcTrabSubRep4Lbl1: TppLabel
              UserName = 'rpProcTrabSubRep4Lbl1'
              AutoSize = False
              Caption = 'Resumo por Unidade'
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
            object rpProcTrabSubRep4DBTxt1: TppDBText
              UserName = 'rpProcTrabSubRep4DBTxt1'
              AutoSize = True
              DataField = 'EMPRESA'
              DataPipeline = ppProcTrab4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppProcTrab4'
              mmHeight = 4233
              mmLeft = 89959
              mmTop = 4763
              mmWidth = 17198
              BandType = 1
            end
            object rpProcTrabSubRep4Lbl2: TppLabel
              UserName = 'rpProcTrabSubRep4Lbl2'
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
            object rpProcTrabSubRep4Lbl3: TppLabel
              UserName = 'rpProcTrabSubRep4Lbl3'
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
            object rpProcTrabSubRep4SysVar1: TppSystemVariable
              UserName = 'rpProcTrabSubRep4SysVar1'
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
            object rpProcTrabSubRep4SysVar2: TppSystemVariable
              UserName = 'rpProcTrabSubRep4SysVar2'
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
            object rpProcTrabSubRep4Lbl6: TppLabel
              UserName = 'rpProcTrabSubRep4Lbl6'
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
              mmLeft = 42863
              mmTop = 22225
              mmWidth = 23548
              BandType = 1
            end
            object rpProcTrabSubRep4Lbl4: TppLabel
              UserName = 'rpProcTrabSubRep4Lbl4'
              AutoSize = False
              Caption = 'Unidade'
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
            object rpProcTrabSubRep4Lbl5: TppLabel
              UserName = 'rpProcTrabSubRep4Lbl5'
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
            object rpProcTrabSubRep4Lbl7: TppLabel
              UserName = 'rpProcTrabSubRep4Lbl7'
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
              mmLeft = 75142
              mmTop = 22225
              mmWidth = 23548
              BandType = 1
            end
            object rpProcTrabSubRep4Lbl8: TppLabel
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
            object rpProcTrabSubRep4Lbl9: TppLabel
              UserName = 'rpProcTrabSubRep4Lbl9'
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
            object rpProcTrabSubRep4Lbl10: TppLabel
              UserName = 'rpProcTrabLbl101'
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
            object rpProcTrabSubRep4Lbl11: TppLabel
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
            object rpProcTrabSubRep4Line1: TppLine
              UserName = 'rpProcTrabSubRep4Line1'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 38100
              mmTop = 16140
              mmWidth = 1323
              BandType = 1
            end
            object rpProcTrabSubRep4Line4: TppLine
              UserName = 'rpProcTrabSubRep4Line4'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 135732
              mmTop = 16140
              mmWidth = 1323
              BandType = 1
            end
            object rpProcTrabSubRep4Line2: TppLine
              UserName = 'rpProcTrabSubRep4Line2'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 70644
              mmTop = 16140
              mmWidth = 1323
              BandType = 1
            end
            object rpProcTrabSubRep4Line3: TppLine
              UserName = 'rpProcTrabSubRep4Line3'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 103188
              mmTop = 16140
              mmWidth = 1323
              BandType = 1
            end
          end
          object rpProcTrabSubRep4DtlBnd: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 8996
            mmPrintPosition = 0
            object rpProcTrabSubRep4ShapeShape2: TppShape
              UserName = 'rpProcTrabSubRep4ShapeShape2'
              mmHeight = 8996
              mmLeft = 6350
              mmTop = 0
              mmWidth = 185473
              BandType = 4
            end
            object rpProcTrabSubRep4DBTxt2: TppDBText
              UserName = 'rpProcTrabSubRep2DBTxt2'
              DataField = 'UNIDADE'
              DataPipeline = ppProcTrab4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppProcTrab4'
              mmHeight = 2910
              mmLeft = 7938
              mmTop = 794
              mmWidth = 123561
              BandType = 4
            end
            object rpProcTrabSubRep4DBTxt4: TppDBText
              UserName = 'DBText201'
              DataField = 'VALRECLAMADO'
              DataPipeline = ppProcTrab4
              DisplayFormat = '#,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProcTrab4'
              mmHeight = 2910
              mmLeft = 42863
              mmTop = 5292
              mmWidth = 23548
              BandType = 4
            end
            object rpProcTrabSubRep4DBTxt3: TppDBText
              UserName = 'rpProcTrabSubRep3DBTxt2'
              DataField = 'QTDPROC'
              DataPipeline = ppProcTrab4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProcTrab4'
              mmHeight = 2910
              mmLeft = 19579
              mmTop = 5292
              mmWidth = 14288
              BandType = 4
            end
            object rpProcTrabSubRep4DBTxt5: TppDBText
              UserName = 'rpProcTrabSubRep4DBTxt5'
              DataField = 'VALESTIMADO'
              DataPipeline = ppProcTrab4
              DisplayFormat = '#,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProcTrab4'
              mmHeight = 2910
              mmLeft = 75142
              mmTop = 5292
              mmWidth = 23548
              BandType = 4
            end
            object rpProcTrabSubRep4DBTxt6: TppDBText
              UserName = 'rpProcTrabSubRep4DBTxt6'
              DataField = 'VALREAL'
              DataPipeline = ppProcTrab4
              DisplayFormat = '#,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProcTrab4'
              mmHeight = 2910
              mmLeft = 107950
              mmTop = 5292
              mmWidth = 23548
              BandType = 4
            end
            object rpProcTrabSubRep4Line5: TppLine
              UserName = 'rpProcTrabSubRep4Line5'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 38100
              mmTop = 5292
              mmWidth = 1323
              BandType = 4
            end
            object rpProcTrabSubRep4Line6: TppLine
              UserName = 'rpProcTrabSubRep4Line6'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 70644
              mmTop = 5292
              mmWidth = 1323
              BandType = 4
            end
            object rpProcTrabSubRep4Line7: TppLine
              UserName = 'rpProcTrabSubRep4Line7'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 103188
              mmTop = 5292
              mmWidth = 1323
              BandType = 4
            end
            object rpProcTrabSubRep4Line8: TppLine
              UserName = 'rpProcTrabSubRep4Line8'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 135732
              mmTop = 5292
              mmWidth = 1323
              BandType = 4
            end
            object rpProcTrabSubRep4DBTxt7: TppDBText
              UserName = 'rpProcTrabSubRep4DBTxt7'
              DataField = 'ECONRECLAMADO'
              DataPipeline = ppProcTrab4
              DisplayFormat = '#,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProcTrab4'
              mmHeight = 2910
              mmLeft = 138907
              mmTop = 5292
              mmWidth = 23813
              BandType = 4
            end
            object rpProcTrabSubRep4DBTxt8: TppDBText
              UserName = 'rpProcTrabSubRep4DBTxt8'
              DataField = 'ECONESTIMADO'
              DataPipeline = ppProcTrab4
              DisplayFormat = '#,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppProcTrab4'
              mmHeight = 2910
              mmLeft = 165100
              mmTop = 5292
              mmWidth = 23813
              BandType = 4
            end
          end
          object rpProcTrabSubRep4Grp1: TppGroup
            BreakName = 'EMPRESA'
            DataPipeline = ppProcTrab4
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'rpProcTrabSubRep4Grp1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppProcTrab4'
            object rpProcTrabSubRep4GrpHdrBnd: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object rpProcTrabSubRep4GrpFootBnd: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 9525
              mmPrintPosition = 0
              object rpProcTrabSubRep4Shape3: TppShape
                UserName = 'rpProcTrabSubRep4Shape3'
                mmHeight = 9525
                mmLeft = 6350
                mmTop = 0
                mmWidth = 185473
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4Lbl12: TppLabel
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
              object rpProcTrabSubRep4DBCalc1: TppDBCalc
                UserName = 'rpProcTrabSubRep4DBCalc1'
                DataField = 'QTDPROC'
                DataPipeline = ppProcTrab4
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcTrabSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcTrab4'
                mmHeight = 3175
                mmLeft = 19579
                mmTop = 5556
                mmWidth = 14288
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4DBCalc2: TppDBCalc
                UserName = 'rpProcTrabSubRep4DBCalc2'
                DataField = 'VALRECLAMADO'
                DataPipeline = ppProcTrab4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcTrabSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcTrab4'
                mmHeight = 3175
                mmLeft = 42863
                mmTop = 5556
                mmWidth = 23548
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4DBCalc3: TppDBCalc
                UserName = 'rpProcTrabSubRep4DBCalc3'
                DataField = 'VALESTIMADO'
                DataPipeline = ppProcTrab4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcTrabSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcTrab4'
                mmHeight = 3175
                mmLeft = 75142
                mmTop = 5556
                mmWidth = 23548
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4DBCalc4: TppDBCalc
                UserName = 'rpProcTrabSubRep4DBCalc4'
                DataField = 'VALREAL'
                DataPipeline = ppProcTrab4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcTrabSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcTrab4'
                mmHeight = 3175
                mmLeft = 107950
                mmTop = 5556
                mmWidth = 23548
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4DBCalc5: TppDBCalc
                UserName = 'rpProcTrabSubRep4DBCalc5'
                DataField = 'ECONRECLAMADO'
                DataPipeline = ppProcTrab4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcTrabSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcTrab4'
                mmHeight = 3175
                mmLeft = 138907
                mmTop = 5556
                mmWidth = 23813
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4DBCalc6: TppDBCalc
                UserName = 'rpProcTrabSubRep4DBCalc6'
                DataField = 'ECONESTIMADO'
                DataPipeline = ppProcTrab4
                DisplayFormat = '#,###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpProcTrabSubRep4Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcTrab4'
                mmHeight = 3175
                mmLeft = 165100
                mmTop = 5556
                mmWidth = 23813
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4Line9: TppLine
                UserName = 'rpProcTrabSubRep4Line9'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 9525
                mmLeft = 38100
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4Line10: TppLine
                UserName = 'rpProcTrabSubRep4Line10'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 9525
                mmLeft = 70644
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4Line11: TppLine
                UserName = 'rpProcTrabSubRep4Line11'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 9525
                mmLeft = 103188
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object rpProcTrabSubRep4Line12: TppLine
                UserName = 'rpProcTrabSubRep4Line12'
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
    object rpProcTrabGrp0: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppProcTrab
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'rpProcTrabGrp0'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppProcTrab'
      object rpProcTrabGrpHdrBnd0: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpProcTrabGrpFootBnd0: TppGroupFooterBand
        BeforePrint = rpProcTrabGrpFootBnd0BeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object rpProcTrabLbl22: TppLabel
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
        object rpProcTrabDBCalc1: TppDBCalc
          UserName = 'rpProcTrabDBCalc1'
          DataField = 'NUMPROC'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpProcTrabGrp0
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppProcTrab'
          mmHeight = 3704
          mmLeft = 48154
          mmTop = 1852
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabLbl23: TppLabel
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
          mmLeft = 179917
          mmTop = 1852
          mmWidth = 19579
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabDBCalc2: TppDBCalc
          UserName = 'rpProcTrabDBCalc2'
          DataField = 'RISCOMAXIMO'
          DataPipeline = ppProcTrab
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcTrabGrp0
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 200025
          mmTop = 2381
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabDBCalc3: TppDBCalc
          UserName = 'rpProcTrabDBCalc3'
          DataField = 'RISCOPROVAVEL'
          DataPipeline = ppProcTrab
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcTrabGrp0
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 216430
          mmTop = 2381
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabDBCalc4: TppDBCalc
          UserName = 'rpProcTrabDBCalc4'
          DataField = 'VALORREAL'
          DataPipeline = ppProcTrab
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcTrabGrp0
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 232834
          mmTop = 2381
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabDBCalc5: TppDBCalc
          UserName = 'rpProcTrabDBCalc5'
          DataField = 'ECONOMIA1'
          DataPipeline = ppProcTrab
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcTrabGrp0
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 249238
          mmTop = 2381
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabDBCalc6: TppDBCalc
          UserName = 'rpProcTrabDBCalc6'
          DataField = 'ECONOMIA2'
          DataPipeline = ppProcTrab
          DisplayFormat = '#,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = rpProcTrabGrp0
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 265642
          mmTop = 2381
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rpProcTrabSubRepRateio: TppSubReport
          UserName = 'rpProcTrabSubRepRateio'
          ExpandAll = False
          KeepTogether = True
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppProcTrab5'
          mmHeight = 3704
          mmLeft = 0
          mmTop = 6879
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpProcTrabChildRepRateio: TppChildReport
            AutoStop = False
            DataPipeline = ppProcTrab5
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
            Left = 216
            Top = 72
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppProcTrab5'
            object rpProcTrabSubRepRateioTitBnd1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object rpProcTrabSubRepRateioLbl1: TppLabel
                UserName = 'Label1'
                AutoSize = False
                Caption = 'Rateio de Custos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 26458
                mmTop = 529
                mmWidth = 27781
                BandType = 1
              end
            end
            object rpProcTrabSubRepRateioDtlBnd1: TppDetailBand
              BeforePrint = rpProcTrabSubRepRateioDtlBnd1BeforePrint
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object rpProcTrabSubRepRateioDBTxt1: TppDBText
                UserName = 'rpProcTrabSubRepRateioDBTxt1'
                DataField = 'EMPRESA'
                DataPipeline = ppProcTrab5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppProcTrab5'
                mmHeight = 3175
                mmLeft = 26988
                mmTop = 265
                mmWidth = 73819
                BandType = 4
              end
              object rpProcTrabSubRepRateioDBTxt2: TppDBText
                UserName = 'rpProcTrabSubRepRateioDBTxt2'
                DataField = 'RISCOMAXIMO'
                DataPipeline = ppProcTrab5
                DisplayFormat = '###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcTrab5'
                mmHeight = 2910
                mmLeft = 200025
                mmTop = 265
                mmWidth = 15875
                BandType = 4
              end
              object rpProcTrabSubRepRateioDBTxt3: TppDBText
                UserName = 'rpProcTrabSubRepRateioDBTxt3'
                DataField = 'RISCOPROVAVEL'
                DataPipeline = ppProcTrab5
                DisplayFormat = '###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcTrab5'
                mmHeight = 2910
                mmLeft = 216430
                mmTop = 265
                mmWidth = 15875
                BandType = 4
              end
              object rpProcTrabSubRepRateioDBTxt4: TppDBText
                UserName = 'rpProcTrabSubRepRateioDBTxt4'
                DataField = 'VALORREAL'
                DataPipeline = ppProcTrab5
                DisplayFormat = '###,###,##0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcTrab5'
                mmHeight = 2910
                mmLeft = 232834
                mmTop = 265
                mmWidth = 15875
                BandType = 4
              end
            end
          end
        end
      end
    end
    object rpProcTrabGrp1: TppGroup
      BreakName = 'NUMPROCTRAB'
      DataPipeline = ppProcTrab
      OutlineSettings.CreateNode = True
      UserName = 'rpProcTrabGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppProcTrab'
      object rpProcTrabGrpHdrBnd1: TppGroupHeaderBand
        BeforePrint = rpProcTrabGrpHdrBnd1BeforePrint
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object rpProcTrabShape1: TppShape
          UserName = 'rpProcTrabShape1'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 4498
          mmLeft = 2646
          mmTop = 0
          mmWidth = 279665
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt2: TppDBText
          UserName = 'rpProcTrabDBTxt2'
          DataField = 'PROCJCJNUM'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 3440
          mmTop = 529
          mmWidth = 34131
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt3: TppDBText
          UserName = 'rpProcTrabDBTxt3'
          DataField = 'JCJ'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 38894
          mmTop = 529
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt4: TppDBText
          UserName = 'rpProcTrabDBTxt4'
          DataField = 'RECLAMANTE'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 53446
          mmTop = 529
          mmWidth = 44715
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt5: TppDBText
          UserName = 'rpProcTrabDBTxt5'
          DataField = 'DATAADMISSAO'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 98690
          mmTop = 529
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt6: TppDBText
          UserName = 'rpProcTrabDBTxt6'
          DataField = 'DATADESLIGAMENTO'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 114829
          mmTop = 529
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt7: TppDBText
          UserName = 'rpProcTrabDBTxt7'
          DataField = 'UNIDADE'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 131234
          mmTop = 529
          mmWidth = 44450
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt9: TppDBText
          UserName = 'rpProcTrabDBTxt9'
          DataField = 'DATANOTIF'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 176213
          mmTop = 529
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt10: TppDBText
          UserName = 'rpProcTrabDBTxt10'
          DataField = 'SITUACAO'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 193146
          mmTop = 529
          mmWidth = 6350
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt11: TppDBText
          UserName = 'rpProcTrabDBTxt11'
          DataField = 'RISCOMAXIMO'
          DataPipeline = ppProcTrab
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 200025
          mmTop = 529
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxtCARGO: TppDBText
          UserName = 'rpProcTrabDBTxtCARGO'
          DataField = 'CARGO'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 26723
          mmTop = 5292
          mmWidth = 58473
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt12: TppDBText
          UserName = 'rpProcTrabDBTxt12'
          DataField = 'RISCOPROVAVEL'
          DataPipeline = ppProcTrab
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 216430
          mmTop = 529
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt13: TppDBText
          UserName = 'rpProcTrabDBTxt13'
          DataField = 'VALORREAL'
          DataPipeline = ppProcTrab
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 232834
          mmTop = 529
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt14: TppDBText
          UserName = 'rpProcTrabDBTxt14'
          DataField = 'ECONOMIA1'
          DataPipeline = ppProcTrab
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 249238
          mmTop = 529
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object rpProcTrabDBTxt15: TppDBText
          UserName = 'rpProcTrabDBTxt15'
          DataField = 'ECONOMIA2'
          DataPipeline = ppProcTrab
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 2910
          mmLeft = 265642
          mmTop = 529
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
      end
      object rpProcTrabGrpFootBnd2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpProcTrabGrp2: TppGroup
      BreakName = 'NUMPROCTRAB'
      DataPipeline = ppProcTrab
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'rpProcTrabGrp2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppProcTrab'
      object rpProcTrabGrpHdrBnd2: TppGroupHeaderBand
        BeforePrint = rpProcTrabGrpHdrBnd2BeforePrint
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object rpProcTrabLbl24: TppLabel
          UserName = 'rpProcTrabLbl24'
          AutoSize = False
          Caption = 'Rateio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsItalic]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 81227
          mmTop = 1323
          mmWidth = 19315
          BandType = 3
          GroupNo = 2
        end
        object rpProcTrabDBTxt16: TppDBText
          UserName = 'rpProcTrabDBTxt16'
          DataField = 'EMPRESA_RATEIO'
          DataPipeline = ppProcTrab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 3440
          mmLeft = 106098
          mmTop = 1323
          mmWidth = 78581
          BandType = 3
          GroupNo = 2
        end
        object rpProcTrabDBTxt17: TppDBText
          UserName = 'rpProcTrabDBTxt17'
          DataField = 'RISCOMAXIMO_RATEIO'
          DataPipeline = ppProcTrab
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 3440
          mmLeft = 200025
          mmTop = 1323
          mmWidth = 15875
          BandType = 3
          GroupNo = 2
        end
        object rpProcTrabDBTxt18: TppDBText
          UserName = 'rpProcTrabDBTxt18'
          DataField = 'RISCOPROVAVEL_RATEIO'
          DataPipeline = ppProcTrab
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 3440
          mmLeft = 216430
          mmTop = 1323
          mmWidth = 15875
          BandType = 3
          GroupNo = 2
        end
        object rpProcTrabDBTxt19: TppDBText
          UserName = 'rpProcTrabDBTxt19'
          DataField = 'VALORREAL_RATEIO'
          DataPipeline = ppProcTrab
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppProcTrab'
          mmHeight = 3440
          mmLeft = 232834
          mmTop = 1323
          mmWidth = 15875
          BandType = 3
          GroupNo = 2
        end
      end
      object rpProcTrabGrpFootBnd1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object rpProcTrabSubRep1: TppSubReport
          UserName = 'rpProcTrabSubRep1'
          ExpandAll = False
          KeepTogether = True
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppProcTrab1'
          mmHeight = 3704
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpProcTrabChildRep1: TppChildReport
            AutoStop = False
            DataPipeline = ppProcTrab1
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
            DataPipelineName = 'ppProcTrab1'
            object rpProcTrabSubRep1TitBnd: TppTitleBand
              BeforePrint = rpProcTrabSubRep1TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object rpProcTrabSubRep1Lbl1: TppLabel
                UserName = 'rpProcTrabSubRep1Lbl1'
                AutoSize = False
                Caption = 'Nome do Litisconsorte ou Testemunha'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 26458
                mmTop = 265
                mmWidth = 52123
                BandType = 1
              end
              object rpProcTrabSubRep1Lbl2: TppLabel
                UserName = 'rpProcTrabSubRep1Lbl2'
                AutoSize = False
                Caption = 'Situação'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 177800
                mmTop = 265
                mmWidth = 40746
                BandType = 1
              end
              object ppLabel1: TppLabel
                UserName = 'Label1'
                AutoSize = False
                Caption = 'Categoria'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 129382
                mmTop = 265
                mmWidth = 40746
                BandType = 1
              end
            end
            object rpProcTrabSubRep1DtlBnd: TppDetailBand
              BeforePrint = rpProcTrabSubRep1TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object rpProcTrabSubRep1DBTxt1: TppDBText
                UserName = 'rpProcTrabSubRep1DBTxt1'
                DataField = 'LITISCONSORTE'
                DataPipeline = ppProcTrab1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppProcTrab1'
                mmHeight = 2910
                mmLeft = 26458
                mmTop = 265
                mmWidth = 96309
                BandType = 4
              end
              object rpProcTrabSubRep1DBTxt2: TppDBText
                UserName = 'rpProcTrabSubRep1DBTxt2'
                DataField = 'SITUACAO'
                DataPipeline = ppProcTrab1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppProcTrab1'
                mmHeight = 2910
                mmLeft = 177800
                mmTop = 265
                mmWidth = 100013
                BandType = 4
              end
              object ppDBText1: TppDBText
                UserName = 'DBText1'
                DataField = 'CATEGORIA'
                DataPipeline = ppProcTrab1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppProcTrab1'
                mmHeight = 2910
                mmLeft = 129382
                mmTop = 265
                mmWidth = 41804
                BandType = 4
              end
            end
            object rpProcTrabSubRep1SmryBnd1: TppSummaryBand
              BeforePrint = rpProcTrabSubRep1TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 2646
              mmPrintPosition = 0
            end
          end
        end
        object rpProcTrabSubRep2: TppSubReport
          UserName = 'rpProcTrabSubRep2'
          ExpandAll = False
          KeepTogether = True
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = rpProcTrabSubRep1
          TraverseAllData = False
          DataPipelineName = 'ppProcTrab2'
          mmHeight = 3704
          mmLeft = 0
          mmTop = 3440
          mmWidth = 284300
          BandType = 5
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpProcTrabChildRep2: TppChildReport
            AutoStop = False
            DataPipeline = ppProcTrab2
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
            DataPipelineName = 'ppProcTrab2'
            object rpProcTrabSubRep2TitBnd: TppTitleBand
              BeforePrint = rpProcTrabSubRep2TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object rpProcTrabSubRep2Lbl1: TppLabel
                UserName = 'rpProcTrabSubRep2Lbl1'
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
              object rpProcTrabSubRep2Lbl2: TppLabel
                UserName = 'rpProcTrabSubRep2Lbl2'
                AutoSize = False
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic, fsUnderline]
                Transparent = True
                mmHeight = 3704
                mmLeft = 102659
                mmTop = 265
                mmWidth = 19315
                BandType = 1
              end
              object ppLabel2: TppLabel
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
                mmWidth = 6085
                BandType = 1
              end
              object ppLabel3: TppLabel
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
              object ppLabel4: TppLabel
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
                mmLeft = 148432
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
                mmLeft = 169598
                mmTop = 529
                mmWidth = 23813
                BandType = 1
              end
            end
            object rpProcTrabSubRep2DtlBnd: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 20108
              mmPrintPosition = 0
              object rpProcTrabSubRep2DBTxt1: TppDBText
                UserName = 'rpProcTrabSubRep2DBTxt1'
                DataField = 'ETAPA'
                DataPipeline = ppProcTrab2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppProcTrab2'
                mmHeight = 2910
                mmLeft = 26458
                mmTop = 265
                mmWidth = 72231
                BandType = 4
              end
              object rpProcTrabSubRep2DBTxt2: TppDBText
                UserName = 'rpProcTrabSubRep2DBTxt2'
                DataField = 'DATAREALOCOR'
                DataPipeline = ppProcTrab2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppProcTrab2'
                mmHeight = 2910
                mmLeft = 102659
                mmTop = 265
                mmWidth = 19315
                BandType = 4
              end
              object rpProcTrabSubRep2DBMemo1: TppDBMemo
                UserName = 'rpProcTrabSubRep2DBMemo1'
                CharWrap = False
                DataField = 'OBSERVETAPA'
                DataPipeline = ppProcTrab2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Stretch = True
                Transparent = True
                DataPipelineName = 'ppProcTrab2'
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
              object ppDBText2: TppDBText
                UserName = 'DBText2'
                DataField = 'NUMSEQ'
                DataPipeline = ppProcTrab2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcTrab2'
                mmHeight = 2910
                mmLeft = 15081
                mmTop = 265
                mmWidth = 7408
                BandType = 4
              end
              object rpProcJudSubRep2Valor: TppDBText
                UserName = 'DBText3'
                DataField = 'VALORREC'
                DataPipeline = ppProcTrab2
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcTrab2'
                mmHeight = 2910
                mmLeft = 124619
                mmTop = 265
                mmWidth = 19315
                BandType = 4
              end
              object ppDBText3: TppDBText
                UserName = 'DBText4'
                DataField = 'VALORCUSTAS'
                DataPipeline = ppProcTrab2
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppProcTrab2'
                mmHeight = 2910
                mmLeft = 148432
                mmTop = 265
                mmWidth = 19315
                BandType = 4
              end
              object rpProcJudSubRep2DBTxt3: TppDBText
                UserName = 'rpProcJudSubRep2DBTxt3'
                DataField = 'ASSUNTO'
                DataPipeline = ppProcTrab2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppProcTrab2'
                mmHeight = 2910
                mmLeft = 169598
                mmTop = 265
                mmWidth = 84138
                BandType = 4
              end
            end
            object rpProcTrabSubRep2SmryBnd: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 2646
              mmPrintPosition = 0
            end
          end
        end
        object rpProcTrabSubRep3: TppSubReport
          UserName = 'rpProcTrabSubRep3'
          ExpandAll = False
          KeepTogether = True
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = rpProcTrabSubRep2
          TraverseAllData = False
          DataPipelineName = 'ppProcTrab3'
          mmHeight = 3704
          mmLeft = 0
          mmTop = 6879
          mmWidth = 284300
          BandType = 5
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpProcTrabChildRep3: TppChildReport
            AutoStop = False
            DataPipeline = ppProcTrab3
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
            DataPipelineName = 'ppProcTrab3'
            object rpProcTrabSubRep3TitBnd: TppTitleBand
              BeforePrint = rpProcTrabSubRep3TitBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object rpProcTrabSubRep3Lbl1: TppLabel
                UserName = 'rpProcTrabSubRep2Lbl1'
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
            end
            object rpProcTrabSubRep3DtlBnd: TppDetailBand
              BeforePrint = rpProcTrabSubRep3DtlBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object rpProcTrabSubRep3DBTxt1: TppDBText
                UserName = 'rpProcTrabSubRep2DBTxt2'
                DataField = 'OBJETO'
                DataPipeline = ppProcTrab3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppProcTrab3'
                mmHeight = 2910
                mmLeft = 26458
                mmTop = 265
                mmWidth = 72231
                BandType = 4
              end
              object rpProcTrabSubRep3LblRiscoMax: TppLabel
                UserName = 'rpProcTrabSubRep3LblRiscoMax'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 200025
                mmTop = 529
                mmWidth = 15875
                BandType = 4
              end
              object rpProcTrabSubRep3LblRiscoProv: TppLabel
                UserName = 'rpProcTrabSubRep3LblRiscoProv'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 216430
                mmTop = 529
                mmWidth = 15875
                BandType = 4
              end
              object rpProcTrabSubRep3LblValorReal: TppLabel
                UserName = 'rpProcTrabSubRep3LblValorReal'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 232834
                mmTop = 529
                mmWidth = 15875
                BandType = 4
              end
              object rpProcTrabSubRep3LblEconomia1: TppLabel
                UserName = 'rpProcTrabSubRep3LblEconomia1'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 249238
                mmTop = 529
                mmWidth = 15875
                BandType = 4
              end
              object rpProcTrabSubRep3LblEconomia2: TppLabel
                UserName = 'rpProcTrabSubRep3LblEconomia2'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 265642
                mmTop = 529
                mmWidth = 15875
                BandType = 4
              end
            end
            object rpProcTrabSubRep3SmryBnd: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 2626
              mmPrintPosition = 0
            end
          end
        end
      end
    end
  end
  object ppProcTrab: TppBDEPipeline
    DataSource = dsProcTrab
    UserName = 'ppProcTrab'
    Left = 446
    Top = 56
    object ppProcTrabppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppProcTrabppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPROCTRAB'
      FieldName = 'NUMPROCTRAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppProcTrabppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPROC'
      FieldName = 'NUMPROC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppProcTrabppField4: TppField
      FieldAlias = 'PROCJCJNUM'
      FieldName = 'PROCJCJNUM'
      FieldLength = 25
      DisplayWidth = 25
      Position = 3
    end
    object ppProcTrabppField5: TppField
      FieldAlias = 'JCJ'
      FieldName = 'JCJ'
      FieldLength = 25
      DisplayWidth = 25
      Position = 4
    end
    object ppProcTrabppField6: TppField
      FieldAlias = 'RECLAMANTE'
      FieldName = 'RECLAMANTE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 5
    end
    object ppProcTrabppField7: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppProcTrabppField8: TppField
      FieldAlias = 'DATADESLIGAMENTO'
      FieldName = 'DATADESLIGAMENTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object ppProcTrabppField9: TppField
      FieldAlias = 'UNIDADE'
      FieldName = 'UNIDADE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object ppProcTrabppField10: TppField
      FieldAlias = 'DATANOTIF'
      FieldName = 'DATANOTIF'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object ppProcTrabppField11: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 10
    end
    object ppProcTrabppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'RISCOMAXIMO'
      FieldName = 'RISCOMAXIMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppProcTrabppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'RISCOPROVAVEL'
      FieldName = 'RISCOPROVAVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppProcTrabppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORREAL'
      FieldName = 'VALORREAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppProcTrabppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'ECONOMIA1'
      FieldName = 'ECONOMIA1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppProcTrabppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'ECONOMIA2'
      FieldName = 'ECONOMIA2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppProcTrabppField17: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 16
    end
    object ppProcTrabppField18: TppField
      FieldAlias = 'TIPOENCER'
      FieldName = 'TIPOENCER'
      FieldLength = 16
      DisplayWidth = 16
      Position = 17
    end
    object ppProcTrabppField19: TppField
      FieldAlias = 'MOEDAPROCTRAB'
      FieldName = 'MOEDAPROCTRAB'
      FieldLength = 20
      DisplayWidth = 20
      Position = 18
    end
    object ppProcTrabppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDREGRA'
      FieldName = 'IDREGRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppProcTrabppField21: TppField
      FieldAlias = 'DATAEFETENC'
      FieldName = 'DATAEFETENC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 20
    end
    object ppProcTrabppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'INDTAXACONV'
      FieldName = 'INDTAXACONV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppProcTrabppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGSITPROC'
      FieldName = 'FLGSITPROC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppProcTrabppField24: TppField
      FieldAlias = 'EMPRESA_RATEIO'
      FieldName = 'EMPRESA_RATEIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 23
    end
    object ppProcTrabppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'RISCOMAXIMO_RATEIO'
      FieldName = 'RISCOMAXIMO_RATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppProcTrabppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'RISCOPROVAVEL_RATEIO'
      FieldName = 'RISCOPROVAVEL_RATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppProcTrabppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORREAL_RATEIO'
      FieldName = 'VALORREAL_RATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
  end
  object dsProcTrab: TwwDataSource
    DataSet = qryProcTrab
    Left = 446
    Top = 104
  end
  object qryProcTrab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  0 AS NUMPROCTRAB,'
      '  0 AS NUMPROC,'
      '  '#39'1234567890123456789012345'#39' AS PROCJCJNUM,'
      '  '#39'1234567890123456789012345'#39' AS JCJ,'
      '  '#39'123456789012345678901234567890'#39' AS RECLAMANTE,'
      '  '#39'1234567890'#39' AS DATAADMISSAO,'
      '  '#39'1234567890'#39' AS DATADESLIGAMENTO,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS UNIDADE,'
      '  '#39'1234567890'#39' AS DATANOTIF,'
      '  '#39'123'#39' AS SITUACAO,'
      '  0 AS RISCOMAXIMO,'
      '  0 AS RISCOPROVAVEL,'
      '  0 AS VALORREAL,'
      '  0 AS ECONOMIA1,'
      '  0 AS ECONOMIA2,'
      '  '#39'1234567890123456789012345678901234567890'#39' AS CARGO,'
      '  '#39'1234567890123456'#39' AS TIPOENCER,'
      '  0 AS MOEDAPROCTRAB,'
      '  0 AS IDREGRA,'
      '  '#39'1234567890'#39' AS DATAEFETENC,'
      '  0 AS INDTAXACONV,'
      '  0 AS FLGSITPROC,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA_RATEIO,'
      '  0 AS RISCOMAXIMO_RATEIO,'
      '  0 AS RISCOPROVAVEL_RATEIO,'
      '  0 AS VALORREAL_RATEIO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updProcTrab
    ValidateWithMask = True
    Left = 446
    Top = 152
  end
  object ppProcTrab1: TppBDEPipeline
    DataSource = dsProcTrab1
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'ppProcTrab1'
    Left = 28
    Top = 56
    object ppProcTrab1ppField1: TppField
      FieldAlias = 'LITISCONSORTE'
      FieldName = 'LITISCONSORTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppProcTrab1ppField2: TppField
      FieldAlias = 'CATEGORIA'
      FieldName = 'CATEGORIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppProcTrab1ppField3: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  object dsProcTrab1: TwwDataSource
    DataSet = qryProcTrab1
    Left = 28
    Top = 104
  end
  object qryProcTrab1: TwwQuery
    AfterOpen = qryProcTrab1AfterOpen
    DatabaseName = 'BaseDados'
    DataSource = dsProcTrab
    SQL.Strings = (
      'SELECT'
      '  DECODE(P.TIPO,'#39'F'#39', P.NOME, P.RAZAOSOCIAL) AS LITISCONSORTE,'
      '  DECODE(NVL(C.INDTESTEMUNHA,0),0,'#39'Listisconsorte'#39',1,'
      '       '#39'Testemunha C.Parte'#39','#39'Nossa Testemunha'#39') AS CATEGORIA,'
      '  DECODE(C.IDMOTIVO,NULL,'#39'Normal'#39', M.DESCRICAO) AS SITUACAO'
      'FROM'
      '  PESSOA P, COPARTPROCTRAB C, MOTIVO M'
      'WHERE'
      '  (C.NUMPROCTRAB = :NUMPROC) AND'
      ''
      '  (C.IDPESSOA    = P.IDPESSOA) AND'
      '  (C.IDMOTIVO    = M.IDMOTIVO(+))'
      'ORDER BY'
      '  LITISCONSORTE')
    ValidateWithMask = True
    Left = 28
    Top = 152
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end>
  end
  object qryProcTrab1Aux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'Indefinido'#39' AS LITISCONSORTE,'
      '  '#39'Indefinida'#39' AS CATEGORIA,'
      '  '#39'Indefinida'#39' AS SITUACAO'
      'FROM'
      '  DUAL')
    ValidateWithMask = True
    Left = 28
    Top = 200
  end
  object updProcTrab: TUpdateSQL
    Left = 446
    Top = 200
  end
  object ppProcTrab2: TppBDEPipeline
    DataSource = dsProcTrab2
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'ppProcTrab2'
    Left = 111
    Top = 56
  end
  object dsProcTrab2: TwwDataSource
    DataSet = qryProcTrab2
    Left = 111
    Top = 104
  end
  object qryProcTrab2: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsProcTrab
    SQL.Strings = (
      'SELECT'
      '  E.NUMSEQ, T.DESCRICAO AS ETAPA, T.VALORHONOR,'
      '  E.DATAREALOCOR, E.ASSUNTO, E.NUMPROCTRAB,'
      '  E.CODTIPORECURSO, E.VALORREC, E.OBSERVETAPA,'
      '  E.IDIMAGEM, E.VALORCUSTAS'
      'FROM'
      '  ETAPAPROCTRAB E, TIPORECTRAB T'
      'WHERE'
      '  (E.NUMPROCTRAB    = :NUMPROC) AND'
      ''
      '  (E.CODTIPORECURSO = T.CODTIPORECURSO)'
      'ORDER BY'
      '  E.DATAREALOCOR')
    ValidateWithMask = True
    Left = 111
    Top = 152
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end>
  end
  object ppProcTrab3: TppBDEPipeline
    DataSource = dsProcTrab3
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'ppProcTrab3'
    Left = 194
    Top = 56
  end
  object dsProcTrab3: TwwDataSource
    DataSet = qryProcTrab3
    Left = 194
    Top = 104
  end
  object qryProcTrab3: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsProcTrab
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
    Left = 194
    Top = 152
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
  end
  object ppProcTrab4: TppBDEPipeline
    DataSource = dsProcTrab4
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ppProcTrab4'
    Left = 280
    Top = 56
    object ppProcTrab4ppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField2: TppField
      FieldAlias = 'IDESTAB'
      FieldName = 'IDESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField3: TppField
      FieldAlias = 'UNIDADE'
      FieldName = 'UNIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField4: TppField
      FieldAlias = 'QTDPROC'
      FieldName = 'QTDPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField5: TppField
      FieldAlias = 'VALRECLAMADO'
      FieldName = 'VALRECLAMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField6: TppField
      FieldAlias = 'VALESTIMADO'
      FieldName = 'VALESTIMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField7: TppField
      FieldAlias = 'VALREAL'
      FieldName = 'VALREAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField8: TppField
      FieldAlias = 'ECONRECLAMADO'
      FieldName = 'ECONRECLAMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppProcTrab4ppField9: TppField
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
  object dsProcTrab4: TwwDataSource
    DataSet = qryProcTrab4
    Left = 280
    Top = 104
  end
  object qryProcTrab4: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  0 AS IDESTAB,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS UNIDADE,'
      '  0 AS QTDPROC,'
      '  0 AS VALRECLAMADO,'
      '  0 AS VALESTIMADO,'
      '  0 AS VALREAL,'
      '  0 AS ECONRECLAMADO,'
      '  0 AS ECONESTIMADO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    UpdateObject = updProcTrab4
    ValidateWithMask = True
    Left = 280
    Top = 152
  end
  object updProcTrab4: TUpdateSQL
    Left = 280
    Top = 200
  end
  object ppProcTrab5: TppBDEPipeline
    DataSource = dsProcTrab5
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ProcTrab5'
    Left = 366
    Top = 56
    object ppProcTrab5ppField1: TppField
      FieldAlias = 'IDFILIALPESSOA'
      FieldName = 'IDFILIALPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppProcTrab5ppField2: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppProcTrab5ppField3: TppField
      FieldAlias = 'RISCOMAXIMO'
      FieldName = 'RISCOMAXIMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppProcTrab5ppField4: TppField
      FieldAlias = 'RISCOPROVAVEL'
      FieldName = 'RISCOPROVAVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppProcTrab5ppField5: TppField
      FieldAlias = 'VALORREAL'
      FieldName = 'VALORREAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppProcTrab5ppField6: TppField
      FieldAlias = 'ECONOMIA1'
      FieldName = 'ECONOMIA1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppProcTrab5ppField7: TppField
      FieldAlias = 'ECONOMIA2'
      FieldName = 'ECONOMIA2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object dsProcTrab5: TwwDataSource
    DataSet = qryProcTrab5
    Left = 366
    Top = 104
  end
  object qryProcTrab5: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  0 AS IDFILIALPESSOA,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  0 AS RISCOMAXIMO,'
      '  0 AS RISCOPROVAVEL,'
      '  0 AS VALORREAL'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    UpdateObject = updProcTrab5
    ValidateWithMask = True
    Left = 366
    Top = 152
  end
  object updProcTrab5: TUpdateSQL
    Left = 366
    Top = 200
  end
  object CdsRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 356
    Top = 264
  end
  object sqlRateio: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  R.IDFILIALPESSOA, R.IDPESSOA, R.DATABASE, R.TIPORATEIO, R.PERI' +
        'ODO,'
      
        '  R.PERCENT1, R.VALORBASE1, R.PERCENT2, R.VALORBASE2, R.PERCENT3' +
        ','
      
        '  R.VALORBASE3, R.PERCENT4, R.VALORBASE4, R.PERCENT5, R.VALORBAS' +
        'E5,'
      '  P.NOME'
      'FROM'
      '  PESSOA P, RATEIOPROCTRAB R'
      'WHERE'
      '  (R.IDPESSOA = P.IDPESSOA)'
      'ORDER BY'
      '  R.IDPESSOA')
    ClientDataSet = CdsRateio
    Left = 415
    Top = 264
  end
end
