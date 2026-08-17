inherited RptPontoPessoa: TRptPontoPessoa
  Left = 238
  Top = 195
  Width = 330
  Height = 288
  Caption = 'RptPontoPessoa'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
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
        Caption = 'TolEntrada'
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
        Name = 'TolEntrada'
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
        Caption = 'TolSaida'
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
        Name = 'TolSaida'
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
        Caption = 'Normal'
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
        Name = 'Normal'
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
        Caption = 'Extra'
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
        Name = 'Extra'
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
        Caption = 'Falta'
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
        Name = 'Falta'
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
        Caption = 'Atraso'
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
        Name = 'Atraso'
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
        Caption = 'Motivo'
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
        Name = 'Motivo'
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
        Caption = 'Observ'
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
        Name = 'Observ'
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
        Caption = 'Abono'
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
        Name = 'Abono'
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
        Caption = 'Ferias'
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
        Name = 'Ferias'
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
        Caption = 'Feriado'
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
        Name = 'Feriado'
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
        Caption = 'QuebaPag'
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
        Name = 'QuebaPag'
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
        Caption = 'ListaIdMotAbono'
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
        Name = 'ListaIdMotAbono'
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
        Caption = 'Resumo'
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
        Name = 'Resumo'
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
        Caption = 'HorasTrab'
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
        Name = 'HorasTrab'
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
        Caption = 'SaldoBanco'
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
        Name = 'SaldoBanco'
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
  object rpPontoPessoa: TppReport [2]
    AutoStop = False
    DataPipeline = ppPontoPessoa
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 253
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppPontoPessoa'
    object rpOcorrPessHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'rpOcorrPessLbl1'
        Caption = 'Relatório de Marcação de Ponto por Pessoa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 105304
        mmTop = 9790
        mmWidth = 73554
        BandType = 0
      end
      object rpOcorrPessLbl2: TppLabel
        UserName = 'rpOcorrPessLbl2'
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
        mmLeft = 243946
        mmTop = 6085
        mmWidth = 9790
        BandType = 0
      end
      object rpOcorrPessLbl3: TppLabel
        UserName = 'rpOcorrPessLbl3'
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
        mmLeft = 238390
        mmTop = 10319
        mmWidth = 15346
        BandType = 0
      end
      object rpOcorrPessDBTxt1: TppDBText
        UserName = 'rpTabCIDDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppPontoPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPontoPessoa'
        mmHeight = 4233
        mmLeft = 133615
        mmTop = 2381
        mmWidth = 17198
        BandType = 0
      end
      object rpOcorrPessSysVar1: TppSystemVariable
        UserName = 'rpTabCIDCalc1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 254530
        mmTop = 6085
        mmWidth = 23283
        BandType = 0
      end
      object rpOcorrPessSysVar2: TppSystemVariable
        UserName = 'rpTabCIDCalc2'
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
        mmLeft = 254530
        mmTop = 10319
        mmWidth = 23283
        BandType = 0
      end
      object rpOcorrPessLbl4: TppLabel
        UserName = 'rpOcorrPessLbl4'
        AutoSize = False
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 112713
        mmTop = 18521
        mmWidth = 15346
        BandType = 0
      end
      object rpOcorrPessLblDATAINI: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 128852
        mmTop = 18521
        mmWidth = 15875
        BandType = 0
      end
      object rpOcorrPessLbl5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 146315
        mmTop = 18521
        mmWidth = 7938
        BandType = 0
      end
      object rpOcorrPessLblDATAFINAL: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 155840
        mmTop = 18521
        mmWidth = 15875
        BandType = 0
      end
      object rpCartaoPontoDBTxt3: TppDBText
        UserName = 'rpCartaoPontoDBTxt3'
        DataField = 'ENDERECO'
        DataPipeline = ppPontoPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPontoPessoa'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 10054
        mmWidth = 94986
        BandType = 0
      end
      object rpCartaoPontoDBTxt4: TppDBText
        UserName = 'rpCartaoPontoDBTxt4'
        DataField = 'UF'
        DataPipeline = ppPontoPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPontoPessoa'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 17992
        mmWidth = 31485
        BandType = 0
      end
      object rpCartaoPontoDBTxt2: TppDBText
        UserName = 'rpCartaoPontoDBTxt2'
        DataField = 'CGC'
        DataPipeline = ppPontoPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPontoPessoa'
        mmHeight = 3175
        mmLeft = 10583
        mmTop = 4233
        mmWidth = 31485
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText10'
        DataField = 'CIDADE'
        DataPipeline = ppPontoPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPontoPessoa'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 14023
        mmWidth = 47625
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label40'
        Caption = 'CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 2117
        mmTop = 4233
        mmWidth = 7112
        BandType = 0
      end
    end
    object rpOcorrPessDtlBnd: TppDetailBand
      BeforePrint = rpOcorrPessDtlBndBeforePrint
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rpOcorrPessDBTxt6: TppDBText
        UserName = 'rpTabCIDDBTxt2'
        DataField = 'DESCRICAO'
        DataPipeline = ppPontoPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPontoPessoa'
        mmHeight = 2879
        mmLeft = 199496
        mmTop = 0
        mmWidth = 30427
        BandType = 4
      end
      object rpOcorrPessDBTxt7: TppDBText
        UserName = 'DBText7'
        DataField = 'SAIDA'
        DataPipeline = ppPontoPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPontoPessoa'
        mmHeight = 2879
        mmLeft = 67998
        mmTop = 0
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'HORAENTRA'
        DataPipeline = ppPontoPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPontoPessoa'
        mmHeight = 2879
        mmLeft = 27252
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'HORAINT1'
        DataPipeline = ppPontoPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPontoPessoa'
        mmHeight = 2879
        mmLeft = 44450
        mmTop = 0
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'HORAINT2'
        DataPipeline = ppPontoPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPontoPessoa'
        mmHeight = 2879
        mmLeft = 55827
        mmTop = 0
        mmWidth = 10583
        BandType = 4
      end
      object ppLblEntrada: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = '09:00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 92869
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppLblIntervalo: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = '12:00 - 13:00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2879
        mmLeft = 107686
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppLblSaida: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = '18:00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2879
        mmLeft = 126207
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'FALTAS'
        DataPipeline = ppPontoPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPontoPessoa'
        mmHeight = 2879
        mmLeft = 189971
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DATAREF'
        DataPipeline = ppPontoPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPontoPessoa'
        mmHeight = 2879
        mmLeft = 3175
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'OBSERVACAO'
        DataPipeline = ppPontoPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPontoPessoa'
        mmHeight = 2879
        mmLeft = 231775
        mmTop = 0
        mmWidth = 46567
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText8'
        DataField = 'ABONO'
        DataPipeline = ppPontoPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPontoPessoa'
        mmHeight = 2879
        mmLeft = 142346
        mmTop = 0
        mmWidth = 7144
        BandType = 4
      end
      object ppLblHoraExtra: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = '100'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 152665
        mmTop = 0
        mmWidth = 8996
        BandType = 4
      end
      object ppLblAtraso: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = '100'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 177271
        mmTop = 0
        mmWidth = 7938
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2381
        mmTop = 3440
        mmWidth = 277548
        BandType = 4
      end
      object ppLblAdNot: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = '100'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 164836
        mmTop = 0
        mmWidth = 8996
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpOcorrPessSmryBnd: TppSummaryBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpOcorrPessGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppPontoPessoa
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpOcorrPessGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppPontoPessoa'
      object rpOcorrPessGrpHdrBnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object rpOcorrPessLbl6: TppLabel
          UserName = 'rpTabCIDLbl4'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 1852
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object rpOcorrPessLbl7: TppLabel
          UserName = 'rpTabCIDLbl5'
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 25665
          mmTop = 1852
          mmWidth = 73290
          BandType = 3
          GroupNo = 0
        end
        object rpOcorrPessLbl8: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Cargo Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 100277
          mmTop = 1852
          mmWidth = 49213
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label39'
          AutoSize = False
          Caption = 'Centro de Custo Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 153723
          mmTop = 1852
          mmWidth = 49213
          BandType = 3
          GroupNo = 0
        end
      end
      object rpOcorrPessGrpFootBnd1: TppGroupFooterBand
        BeforePrint = rpOcorrPessGrpFootBnd1BeforePrint
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object rpOcorrPessLbl14: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Total de Pessoas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 2910
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object rpOcorrPessLbl15: TppLabel
          UserName = 'Label7'
          Caption = 'Tot. Acessos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          mmHeight = 3704
          mmLeft = 43656
          mmTop = 2910
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'NUMEMPREGADO'
          DataPipeline = ppPontoPessoa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpOcorrPessGrp1
          Transparent = True
          DataPipelineName = 'ppPontoPessoa'
          mmHeight = 3704
          mmLeft = 31485
          mmTop = 2910
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 2381
          mmTop = 529
          mmWidth = 277548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'FALTAS'
          DataPipeline = ppPontoPessoa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpOcorrPessGrp1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppPontoPessoa'
          mmHeight = 3440
          mmLeft = 189442
          mmTop = 2910
          mmWidth = 6615
          BandType = 5
          GroupNo = 0
        end
        object ppLblHoraExtraTotal: TppLabel
          UserName = 'Label25'
          AutoSize = False
          Caption = '100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 152665
          mmTop = 2910
          mmWidth = 8996
          BandType = 5
          GroupNo = 0
        end
        object ppLblAtrasoTotal: TppLabel
          UserName = 'Label26'
          AutoSize = False
          Caption = '100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 177271
          mmTop = 2910
          mmWidth = 7938
          BandType = 5
          GroupNo = 0
        end
        object ppLblAcessosTotal: TppLabel
          UserName = 'Label28'
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          mmHeight = 3440
          mmLeft = 66146
          mmTop = 2910
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object ppLblAdNotTotal: TppLabel
          UserName = 'Label34'
          AutoSize = False
          Caption = '100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 164836
          mmTop = 2910
          mmWidth = 8996
          BandType = 5
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label35'
          Caption = 'Tot. Hs. Trab. (min.):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 96838
          mmTop = 2910
          mmWidth = 32544
          BandType = 5
          GroupNo = 0
        end
        object ppLblHrTrbTotal: TppLabel
          UserName = 'Label36'
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 130175
          mmTop = 2910
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpOcorrPessGrp2: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppPontoPessoa
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppPontoPessoa'
      object rpOcorrPessGrpHdrBnd2: TppGroupHeaderBand
        BeforePrint = rpOcorrPessGrpHdrBnd2BeforePrint
        mmBottomOffset = 0
        mmHeight = 17463
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 6879
          mmLeft = 794
          mmTop = 0
          mmWidth = 279401
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrPessDBTxt3: TppDBText
          UserName = 'rpOcorrPessDBTxt3'
          DataField = 'MATRICULA'
          DataPipeline = ppPontoPessoa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppPontoPessoa'
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 1588
          mmWidth = 22754
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrPessDBTxt4: TppDBText
          UserName = 'rpOcorrPessDBTxt4'
          DataField = 'NOME'
          DataPipeline = ppPontoPessoa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppPontoPessoa'
          mmHeight = 3704
          mmLeft = 25665
          mmTop = 1588
          mmWidth = 73290
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrPessDBTxt5: TppDBText
          UserName = 'rpOcorrPessDBTxt5'
          DataField = 'CARGO'
          DataPipeline = ppPontoPessoa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppPontoPessoa'
          mmHeight = 3704
          mmLeft = 100277
          mmTop = 1588
          mmWidth = 50536
          BandType = 3
          GroupNo = 1
        end
        object ppRegCab: TppRegion
          UserName = 'RegCab'
          Pen.Color = clWhite
          Pen.Style = psClear
          mmHeight = 11642
          mmLeft = 0
          mmTop = 5556
          mmWidth = 280459
          BandType = 3
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpOcorrPessLbl9: TppLabel
            UserName = 'Label9'
            AutoSize = False
            Caption = 'Motivo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold, fsUnderline]
            Transparent = True
            mmHeight = 3440
            mmLeft = 199496
            mmTop = 12435
            mmWidth = 26988
            BandType = 3
            GroupNo = 1
          end
          object ppLabel4: TppLabel
            UserName = 'rpOcorrPessLbl101'
            AutoSize = False
            Caption = 'Entrada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold, fsUnderline]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3387
            mmLeft = 27252
            mmTop = 12435
            mmWidth = 15346
            BandType = 3
            GroupNo = 1
          end
          object rpOcorrPessLbl10: TppLabel
            UserName = 'rpOcorrPessLbl10'
            AutoSize = False
            Caption = 'Saída'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold, fsUnderline]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3440
            mmLeft = 73025
            mmTop = 12435
            mmWidth = 13229
            BandType = 3
            GroupNo = 1
          end
          object ppLabel6: TppLabel
            UserName = 'rpOcorrPessLbl102'
            AutoSize = False
            Caption = ' (Em Minutos)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3704
            mmLeft = 155840
            mmTop = 6615
            mmWidth = 27252
            BandType = 3
            GroupNo = 1
          end
          object ppLabel2: TppLabel
            UserName = 'Label1'
            Caption = 'Marcação'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 50536
            mmTop = 6614
            mmWidth = 12965
            BandType = 3
            GroupNo = 1
          end
          object ppLabel5: TppLabel
            UserName = 'Label8'
            Caption = 'Horário Normal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 105040
            mmTop = 6615
            mmWidth = 20638
            BandType = 3
            GroupNo = 1
          end
          object ppLine3: TppLine
            UserName = 'Line3'
            Weight = 0.75
            mmHeight = 1323
            mmLeft = 26988
            mmTop = 11112
            mmWidth = 63500
            BandType = 3
            GroupNo = 1
          end
          object ppLine4: TppLine
            UserName = 'Line4'
            Weight = 0.75
            mmHeight = 1323
            mmLeft = 92604
            mmTop = 11113
            mmWidth = 47361
            BandType = 3
            GroupNo = 1
          end
          object ppLabel7: TppLabel
            UserName = 'Label11'
            AutoSize = False
            Caption = 'Entrada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold, fsUnderline]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3440
            mmLeft = 92869
            mmTop = 12435
            mmWidth = 12965
            BandType = 3
            GroupNo = 1
          end
          object ppLabel10: TppLabel
            UserName = 'Label14'
            AutoSize = False
            Caption = 'Intervalo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold, fsUnderline]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3440
            mmLeft = 106627
            mmTop = 12435
            mmWidth = 17463
            BandType = 3
            GroupNo = 1
          end
          object ppLabel12: TppLabel
            UserName = 'rpOcorrPessLbl103'
            AutoSize = False
            Caption = 'Saída'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold, fsUnderline]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3440
            mmLeft = 125148
            mmTop = 12435
            mmWidth = 14552
            BandType = 3
            GroupNo = 1
          end
          object ppLabel11: TppLabel
            UserName = 'Label18'
            AutoSize = False
            Caption = 'Faltas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold, fsUnderline]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3440
            mmLeft = 188913
            mmTop = 12435
            mmWidth = 9260
            BandType = 3
            GroupNo = 1
          end
          object ppLabel13: TppLabel
            UserName = 'Label19'
            AutoSize = False
            Caption = 'Data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold, fsUnderline]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3440
            mmLeft = 2646
            mmTop = 12435
            mmWidth = 23813
            BandType = 3
            GroupNo = 1
          end
          object ppLine5: TppLine
            UserName = 'Line5'
            Weight = 0.75
            mmHeight = 1058
            mmLeft = 152400
            mmTop = 11113
            mmWidth = 34660
            BandType = 3
            GroupNo = 1
          end
          object ppLabel8: TppLabel
            UserName = 'Label12'
            AutoSize = False
            Caption = 'Intervalo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold, fsUnderline]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3440
            mmLeft = 45773
            mmTop = 12435
            mmWidth = 19050
            BandType = 3
            GroupNo = 1
          end
          object ppLabel9: TppLabel
            UserName = 'Label13'
            AutoSize = False
            Caption = 'Obsevação'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold, fsUnderline]
            Transparent = True
            mmHeight = 3440
            mmLeft = 231775
            mmTop = 12435
            mmWidth = 26988
            BandType = 3
            GroupNo = 1
          end
          object ppLabel14: TppLabel
            UserName = 'Label20'
            AutoSize = False
            Caption = 'Abono'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold, fsUnderline]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3440
            mmLeft = 141023
            mmTop = 12435
            mmWidth = 9790
            BandType = 3
            GroupNo = 1
          end
          object ppLabel15: TppLabel
            UserName = 'Label201'
            AutoSize = False
            Caption = 'H.Extra'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold, fsUnderline]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3440
            mmLeft = 152400
            mmTop = 12435
            mmWidth = 10848
            BandType = 3
            GroupNo = 1
          end
          object ppLabel16: TppLabel
            UserName = 'Label202'
            AutoSize = False
            Caption = 'Atraso'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold, fsUnderline]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3440
            mmLeft = 177536
            mmTop = 12435
            mmWidth = 9790
            BandType = 3
            GroupNo = 1
          end
          object ppLabel17: TppLabel
            UserName = 'Label31'
            AutoSize = False
            Caption = 'Ad.Not'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold, fsUnderline]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3440
            mmLeft = 164836
            mmTop = 12435
            mmWidth = 10848
            BandType = 3
            GroupNo = 1
          end
        end
        object lblSaldoBHAntes: TppLabel
          UserName = 'Label29'
          Caption = 'Saldo Banco de Horas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4022
          mmLeft = 205582
          mmTop = 1588
          mmWidth = 36068
          BandType = 3
          GroupNo = 1
        end
        object ppDBText8: TppDBText
          UserName = 'DBText9'
          DataField = 'SETOR'
          DataPipeline = ppPontoPessoa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppPontoPessoa'
          mmHeight = 3704
          mmLeft = 153723
          mmTop = 1588
          mmWidth = 50536
          BandType = 3
          GroupNo = 1
        end
      end
      object rpOcorrPessGrpFootBnd2: TppGroupFooterBand
        BeforePrint = rpOcorrPessGrpFootBnd2BeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 14817
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label10'
          Caption = 'Tot. Acessos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          mmHeight = 3704
          mmLeft = 43127
          mmTop = 1323
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'FALTAS'
          DataPipeline = ppPontoPessoa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpOcorrPessGrp2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppPontoPessoa'
          mmHeight = 3440
          mmLeft = 189442
          mmTop = 1323
          mmWidth = 6615
          BandType = 5
          GroupNo = 1
        end
        object ppLblHoraExtraPessoa: TppLabel
          UserName = 'Label23'
          AutoSize = False
          Caption = '100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 152665
          mmTop = 1323
          mmWidth = 8996
          BandType = 5
          GroupNo = 1
        end
        object ppLblAtrasoPessoa: TppLabel
          UserName = 'Label24'
          AutoSize = False
          Caption = '100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 177271
          mmTop = 1323
          mmWidth = 7938
          BandType = 5
          GroupNo = 1
        end
        object ppLblAcessosPessoa: TppLabel
          UserName = 'Label27'
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          mmHeight = 3440
          mmLeft = 66146
          mmTop = 1323
          mmWidth = 10054
          BandType = 5
          GroupNo = 1
        end
        object rpMarcacaoPontoAssinatura: TppMemo
          UserName = 'rpMarcacaoPontoAssinatura'
          Caption = 
            'Data  ___/___/____    ______________________________      ______' +
            '_________________________'#13#10'                                     ' +
            '         Assinatura do Empregado                         Assinat' +
            'ura do Empregador'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            
              'Data  ___/___/____    ______________________________      ______' +
              '_________________________'
            
              '                                              Assinatura do Empr' +
              'egado                         Assinatura do Empregador')
          Transparent = True
          mmHeight = 8731
          mmLeft = 15875
          mmTop = 5556
          mmWidth = 132027
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object lblSaldoBHApos: TppLabel
          UserName = 'Label30'
          Caption = 'Saldo no Banco de Horas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 199761
          mmTop = 1323
          mmWidth = 35348
          BandType = 5
          GroupNo = 1
        end
        object ppLblAdNotPessoa: TppLabel
          UserName = 'Label33'
          AutoSize = False
          Caption = '100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 164836
          mmTop = 1323
          mmWidth = 8996
          BandType = 5
          GroupNo = 1
        end
        object ppLabel19: TppLabel
          UserName = 'Label37'
          Caption = 'Tot. Hs. Trab. (min.):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 96838
          mmTop = 1323
          mmWidth = 32544
          BandType = 5
          GroupNo = 1
        end
        object ppLblHrTrbPessoa: TppLabel
          UserName = 'Label38'
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 130175
          mmTop = 1323
          mmWidth = 13229
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppPontoPessoa: TppBDEPipeline [3]
    DataSource = dsPontoPessoa
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'PontoPessoa'
    Left = 253
    Top = 48
    object ppPontoPessoappField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField2: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField4: TppField
      FieldAlias = 'IDHORARIO'
      FieldName = 'IDHORARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField5: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField6: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField7: TppField
      FieldAlias = 'SETOR'
      FieldName = 'SETOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField8: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField9: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField10: TppField
      FieldAlias = 'ESTADO'
      FieldName = 'ESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField11: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField12: TppField
      FieldAlias = 'CGC'
      FieldName = 'CGC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField13: TppField
      FieldAlias = 'MASCARA_CGC'
      FieldName = 'MASCARA_CGC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField14: TppField
      FieldAlias = 'ENTRADA'
      FieldName = 'ENTRADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField15: TppField
      FieldAlias = 'SAIDAINTERVALO'
      FieldName = 'SAIDAINTERVALO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField16: TppField
      FieldAlias = 'RETORNOINTERVALO'
      FieldName = 'RETORNOINTERVALO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField17: TppField
      FieldAlias = 'HORAENTRA'
      FieldName = 'HORAENTRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField18: TppField
      FieldAlias = 'HORAINT1'
      FieldName = 'HORAINT1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField19: TppField
      FieldAlias = 'HORAINT2'
      FieldName = 'HORAINT2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField20: TppField
      FieldAlias = 'HORASAIDA'
      FieldName = 'HORASAIDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField21: TppField
      FieldAlias = 'SAIDA'
      FieldName = 'SAIDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField22: TppField
      FieldAlias = 'DATAREF'
      FieldName = 'DATAREF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField23: TppField
      FieldAlias = 'FALTAS'
      FieldName = 'FALTAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField24: TppField
      FieldAlias = 'ABONO'
      FieldName = 'ABONO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField25: TppField
      FieldAlias = 'CODTIPOOCMED'
      FieldName = 'CODTIPOOCMED'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField26: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField27: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField28: TppField
      FieldAlias = 'NUMEMPREGADO'
      FieldName = 'NUMEMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppPontoPessoappField29: TppField
      FieldAlias = 'EMPRESA_1'
      FieldName = 'EMPRESA_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
  end
  object dsPontoPessoa: TwwDataSource [4]
    DataSet = CdsPontoPessoa
    Left = 253
    Top = 96
  end
  object sqlPontoPessoa: TCMSqlParams [5]
    SQL.Strings = (
      'SELECT'
      
        '  '#39'                                                             ' +
        '                                    '#39' AS EMPRESA,'
      '  F.IDPESSOA,'
      '  F.MATRICULA, F.IDHORARIO,'
      '  RTRIM(PF.NOME) AS NOME,'
      '  C.TITULO AS CARGO,'
      
        '  '#39'                                                             ' +
        '               '#39' AS SETOR,'
      '  '#39'                                             '#39' AS CIDADE,'
      
        '  '#39'                                                             ' +
        '                                    '#39' AS ENDERECO,'
      '  '#39'              '#39' AS ESTADO, '#39'      '#39' AS UF,'
      '  '#39'                                             '#39' AS CGC,'
      
        '  '#39'                                             '#39' AS MASCARA_CGC' +
        ','
      '  AF.ENTRADA, AF.SAIDAINTERVALO, AF.RETORNOINTERVALO,'
      '  TO_CHAR(AF.ENTRADA,'#39'HH24:MI'#39') AS HORAENTRA,'
      '  TO_CHAR(AF.SAIDAINTERVALO,'#39'HH24:MI'#39') AS HORAINT1,'
      '  TO_CHAR(AF.RETORNOINTERVALO,'#39'HH24:MI'#39') AS HORAINT2,'
      '  TO_CHAR(AF.SAIDA,'#39'HH24:MI'#39') AS HORASAIDA,'
      
        '  TO_CHAR(AF.SAIDA,'#39'DD/MM HH24:MI'#39') AS SAIDA, TO_DATE(TO_CHAR(AF' +
        '.ENTRADA,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39') AS DATAREF, 0 AS FALTAS,'
      '  DECODE(NVL(AF.FLGABONADO,0), 0, '#39'   '#39', '#39'Sim'#39') AS ABONO,'
      '  AF.CODTIPOOCMED, M.DESCRTIPOOCMED AS DESCRICAO, AF.OBSERVACAO,'
      '  0 AS NUMEMPREGADO, PF.RAZAOSOCIAL AS EMPRESA'
      'FROM'
      
        '  PESSOA PF, PESSOAFISICA PEFIS, FUNCIONARIO F, ACESSOFUNC AF, C' +
        'ARGO C,'
      '  (SELECT CODTIPOOCMED, DESCRTIPOOCMED FROM TIPOCMED'
      '    ) M'
      'WHERE'
      '  (PF.IDPESSOA         = -10329) AND'
      '  (AF.ENTRADA         >= TO_DATE('#39'01/07/2007'#39','#39'DD/MM/YYYY'#39')) AND'
      
        '  (AF.ENTRADA         <= TO_DATE('#39'31/07/2007'#39','#39'DD/MM/YYYY'#39')+1) A' +
        'ND'
      '  (PF.IDPESSOA         = F.IDPESSOA) AND'
      '  (PF.IDPESSOA         = PEFIS.IDPESSOA) AND'
      '  (PF.IDPESSOA         = AF.IDPESSOA) AND'
      '  (AF.CODTIPOOCMED     = M.CODTIPOOCMED(+)) AND'
      '  (AF.INDFUNCAO        = '#39'P'#39') AND'
      '  (F.IDCARGO           = C.IDCARGO(+))'
      'ORDER BY'
      '  UPPER(NOME), AF.ENTRADA'
      ' '
      ' ')
    ClientDataSet = CdsPontoPessoa
    Left = 253
    Top = 192
  end
  object CdsPontoPessoa: TCMClientDataSet [6]
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EMPRESA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 97
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CARGO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'SETOR'
        Attributes = [faFixed]
        DataType = ftString
        Size = 76
      end
      item
        Name = 'CIDADE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ENDERECO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 97
      end
      item
        Name = 'ESTADO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 14
      end
      item
        Name = 'UF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'CGC'
        Attributes = [faFixed]
        DataType = ftString
        Size = 45
      end
      item
        Name = 'MASCARA_CGC'
        Attributes = [faFixed]
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ENTRADA'
        DataType = ftDateTime
      end
      item
        Name = 'SAIDAINTERVALO'
        DataType = ftDateTime
      end
      item
        Name = 'RETORNOINTERVALO'
        DataType = ftDateTime
      end
      item
        Name = 'HORAENTRA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'HORAINT1'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'HORAINT2'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'HORASAIDA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'SAIDA'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'DATAREF'
        DataType = ftDateTime
      end
      item
        Name = 'FALTAS'
        DataType = ftFloat
      end
      item
        Name = 'ABONO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CODTIPOOCMED'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NUMEMPREGADO'
        DataType = ftFloat
      end
      item
        Name = 'EMPRESA_1'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'CdsAcessoPessoaIndex1'
        CaseInsFields = 'NOME'
        Fields = 'NOME;DATAREF; ENTRADA'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsAcessoPessoaIndex1'
    Params = <>
    StoreDefs = True
    AfterScroll = CdsPontoPessoaAfterScroll
    Left = 253
    Top = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpPontoPessoa
  end
  object CdsHorarioVariavel: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDLAYOUT'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'COLCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'COLCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'FLGMATRICULA'
        DataType = ftFloat
      end
      item
        Name = 'COLCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'FLGPOSSUIDEP'
        DataType = ftFloat
      end
      item
        Name = 'ULTIMPORT'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftString
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data2'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 98
    Top = 121
  end
  object CdsHorario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 102
    Top = 174
  end
  object CdsFeriados: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDLAYOUT'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'COLCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'COLCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'FLGMATRICULA'
        DataType = ftFloat
      end
      item
        Name = 'COLCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'FLGPOSSUIDEP'
        DataType = ftFloat
      end
      item
        Name = 'ULTIMPORT'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftString
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data2'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 22
    Top = 95
  end
  object CdsFerias: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDLAYOUT'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'COLCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'COLCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'FLGMATRICULA'
        DataType = ftFloat
      end
      item
        Name = 'COLCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'FLGPOSSUIDEP'
        DataType = ftFloat
      end
      item
        Name = 'ULTIMPORT'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftString
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data2'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 29
    Top = 146
  end
  object CdsFunc: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDLAYOUT'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'COLCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'COLCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'FLGMATRICULA'
        DataType = ftFloat
      end
      item
        Name = 'COLCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'FLGPOSSUIDEP'
        DataType = ftFloat
      end
      item
        Name = 'ULTIMPORT'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftString
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data2'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 56
    Top = 63
  end
  object CdsPontoPessoa2: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CONTA1'
        DataType = ftFloat
      end
      item
        Name = 'CONTA2'
        DataType = ftFloat
      end
      item
        Name = 'CONTA3'
        DataType = ftFloat
      end
      item
        Name = 'CONTA4'
        DataType = ftFloat
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CARGO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ENTRADA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SAIDAINTERVALO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RETORNOINTERVALO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SAIDA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EMPRESA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TITULO1'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TITULO2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TITULO3'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TITULO4'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NUMEMPREGADO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'CdsAcessoPessoaIndex1'
        CaseInsFields = 'NOME'
        Fields = 'NOME;DATAREF; ENTRADA'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsAcessoPessoaIndex1'
    Params = <>
    StoreDefs = True
    AfterScroll = CdsPontoPessoaAfterScroll
    Left = 167
    Top = 158
  end
  object sqlPontoPessoa2: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'                                                             ' +
        '                                    '#39' AS EMPRESA,'
      '  F.IDPESSOA,'
      '  F.MATRICULA, F.IDHORARIO,'
      '  RTRIM(PF.NOME) AS NOME,'
      '  C.TITULO AS CARGO,'
      
        '  '#39'                                                             ' +
        '               '#39' AS SETOR,'
      '  '#39'                                             '#39' AS CIDADE,'
      
        '  '#39'                                                             ' +
        '                                    '#39' AS ENDERECO,'
      '  '#39'              '#39' AS ESTADO, '#39'      '#39' AS UF,'
      '  '#39'                                             '#39' AS CGC,'
      
        '  '#39'                                             '#39' AS MASCARA_CGC' +
        ','
      '  AF.ENTRADA, AF.SAIDAINTERVALO, AF.RETORNOINTERVALO,'
      '  TO_CHAR(AF.ENTRADA,'#39'HH24:MI'#39') AS HORAENTRA,'
      '  TO_CHAR(AF.SAIDAINTERVALO,'#39'HH24:MI'#39') AS HORAINT1,'
      '  TO_CHAR(AF.RETORNOINTERVALO,'#39'HH24:MI'#39') AS HORAINT2,'
      '  TO_CHAR(AF.SAIDA,'#39'HH24:MI'#39') AS HORASAIDA,'
      
        '  TO_CHAR(AF.SAIDA,'#39'DD/MM HH24:MI'#39') AS SAIDA, TO_DATE(TO_CHAR(AF' +
        '.ENTRADA,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39') AS DATAREF, 0 AS FALTAS,'
      '  DECODE(NVL(AF.FLGABONADO,0), 0, '#39'   '#39', '#39'Sim'#39') AS ABONO,'
      '  AF.CODTIPOOCMED, M.DESCRTIPOOCMED AS DESCRICAO, AF.OBSERVACAO'
      'FROM'
      
        '  PESSOA PF, PESSOAFISICA PEFIS, FUNCIONARIO F, ACESSOFUNC AF, C' +
        'ARGO C,'
      '  (SELECT CODTIPOOCMED, DESCRTIPOOCMED FROM TIPOCMED'
      '    ) M'
      'WHERE'
      '  (PF.IDPESSOA         = -10329) AND'
      '  (AF.ENTRADA         >= TO_DATE('#39'01/07/2007'#39','#39'DD/MM/YYYY'#39')) AND'
      
        '  (AF.ENTRADA         <= TO_DATE('#39'31/07/2007'#39','#39'DD/MM/YYYY'#39')+1) A' +
        'ND'
      '  (PF.IDPESSOA         = F.IDPESSOA) AND'
      '  (PF.IDPESSOA         = PEFIS.IDPESSOA) AND'
      '  (PF.IDPESSOA         = AF.IDPESSOA) AND'
      '  (AF.CODTIPOOCMED     = M.CODTIPOOCMED(+)) AND'
      '  (AF.INDFUNCAO        = '#39'P'#39') AND'
      '  (F.IDCARGO           = C.IDCARGO(+))'
      'ORDER BY'
      '  UPPER(NOME), AF.ENTRADA')
    ClientDataSet = CdsPontoPessoa2
    Left = 165
    Top = 208
  end
  object CdsFunc2: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDLAYOUT'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'COLCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'COLCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'FLGMATRICULA'
        DataType = ftFloat
      end
      item
        Name = 'COLCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'FLGPOSSUIDEP'
        DataType = ftFloat
      end
      item
        Name = 'ULTIMPORT'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftString
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data2'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 112
    Top = 63
  end
  object CdsAfast: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDLAYOUT'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'COLCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'COLCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'FLGMATRICULA'
        DataType = ftFloat
      end
      item
        Name = 'COLCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'FLGPOSSUIDEP'
        DataType = ftFloat
      end
      item
        Name = 'ULTIMPORT'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftString
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data2'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 29
    Top = 202
  end
end
