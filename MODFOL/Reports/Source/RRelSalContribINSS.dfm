inherited RptRelSalContribINSS: TRptRelSalContribINSS
  Left = 183
  Top = 197
  Width = 439
  Height = 331
  Caption = 'RptRelSalContribINSS'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'IdEstab'
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
        Name = 'IdEstab'
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
        Caption = 'IdFunc'
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
        Name = 'IdFunc'
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
        Caption = 'LimitadoPorData'
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
        Name = 'LimitadoPorData'
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
        Caption = 'QuantMeses'
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
        Name = 'QuantMeses'
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
        Caption = 'UltimoDiaTrab'
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
        Name = 'UltimoDiaTrab'
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
        Caption = 'SelRubricaPorIncid'
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
        Name = 'SelRubricaPorIncid'
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
        Caption = 'ListaIdRubrica'
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
        Name = 'ListaIdRubrica'
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
        Caption = 'IdRubricaSalParteFixa'
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
        Name = 'IdRubricaSalParteFixa'
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
        Caption = 'ImprimirRelReqBenefIncap'
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
        Name = 'ImprimirRelReqBenefIncap'
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
        Caption = 'ImprimirRelAtestAfastTrab'
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
        Name = 'ImprimirRelAtestAfastTrab'
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
        Caption = 'PessoaGozaBenef'
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
        Name = 'PessoaGozaBenef'
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
        Caption = 'PessoaPossuiOutraAtiv'
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
        Name = 'PessoaPossuiOutraAtiv'
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
        Caption = 'ListaPreNomeFilhos'
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
        Name = 'ListaPreNomeFilhos'
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
        Caption = 'ListaDataNascFilhos'
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
        Name = 'ListaDataNascFilhos'
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
        Caption = 'ListaTipoFolha'
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
        Name = 'ListaTipoFolha'
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
    Report = rpRelSalContrib
    ConnectionType = cntBDE
  end
  object rpRelSalContrib: TppReport
    AutoStop = False
    DataPipeline = ppRelSalContrib
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relação dos Salários de Contribuição'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 364
    Top = 8
    Version = '7.04'
    mmColumnWidth = 284300
    DataPipelineName = 'ppRelSalContrib'
    object rpRelSalContribHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 61383
      mmPrintPosition = 0
      object rpRelSalContribImage: TppImage
        UserName = 'rpRelSalContribImage'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D617036420000424D364200000000000036000000280000005800
          000040000000010018000000000000420000120B0000120B0000000000000000
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
        mmHeight = 7673
        mmLeft = 10848
        mmTop = 6350
        mmWidth = 14817
        BandType = 0
      end
      object rpRelSalContribLbl1: TppLabel
        UserName = 'rpRelSalContribLbl1'
        AutoSize = False
        Caption = 'INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 22
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 9260
        mmLeft = 26723
        mmTop = 6085
        mmWidth = 19844
        BandType = 0
      end
      object rpRelSalContribLbl2: TppLabel
        UserName = 'rpRelSalContribLbl2'
        AutoSize = False
        Caption = 'INSTITUTO NACIONAL DO SEGURO SOCIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 10054
        mmTop = 17463
        mmWidth = 40481
        BandType = 0
      end
      object rpRelSalContribLbl3: TppLabel
        UserName = 'rpRelSalContribLbl3'
        AutoSize = False
        Caption = 'RELAÇÃO DOS SALÁRIOS DE CONTRIBUIÇÃO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 26723
        mmTop = 21431
        mmWidth = 94721
        BandType = 0
      end
      object rpRelSalContribShape1: TppShape
        UserName = 'rpRelSalContribShape1'
        mmHeight = 33073
        mmLeft = 9790
        mmTop = 27517
        mmWidth = 256117
        BandType = 0
      end
      object rpRelSalContribLine4: TppLine
        UserName = 'rpRelSalContribLine4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 33073
        mmLeft = 205317
        mmTop = 27517
        mmWidth = 2117
        BandType = 0
      end
      object rpRelSalContribLine1: TppLine
        UserName = 'rpRelSalContribLine1'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 10054
        mmTop = 35719
        mmWidth = 255853
        BandType = 0
      end
      object rpRelSalContribLine2: TppLine
        UserName = 'rpRelSalContribLine2'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 10054
        mmTop = 43921
        mmWidth = 255853
        BandType = 0
      end
      object rpRelSalContribLine3: TppLine
        UserName = 'rpRelSalContribLine3'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 10054
        mmTop = 52123
        mmWidth = 255853
        BandType = 0
      end
      object rpRelSalContribLine5: TppLine
        UserName = 'rpRelSalContribLine5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8202
        mmLeft = 77523
        mmTop = 52123
        mmWidth = 2117
        BandType = 0
      end
      object rpRelSalContribLine6: TppLine
        UserName = 'rpRelSalContribLine6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8202
        mmLeft = 145257
        mmTop = 52123
        mmWidth = 2117
        BandType = 0
      end
      object rpRelSalContribLbl4: TppLabel
        UserName = 'rpRelSalContribLbl4'
        AutoSize = False
        Caption = 'EMPRESA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 28310
        mmWidth = 13758
        BandType = 0
      end
      object rpRelSalContribLbl5: TppLabel
        UserName = 'rpRelSalContribLbl5'
        AutoSize = False
        Caption = 'Nº CNPJ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 206905
        mmTop = 28310
        mmWidth = 15610
        BandType = 0
      end
      object rpRelSalContribLbl6: TppLabel
        UserName = 'rpRelSalContribLbl6'
        AutoSize = False
        Caption = 'ENDERECO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 36513
        mmWidth = 18256
        BandType = 0
      end
      object rpRelSalContribLbl7: TppLabel
        UserName = 'rpRelSalContribLbl7'
        AutoSize = False
        Caption = 'MATR. INSS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 206905
        mmTop = 36513
        mmWidth = 20373
        BandType = 0
      end
      object rpRelSalContribLbl8: TppLabel
        UserName = 'rpRelSalContribLbl8'
        AutoSize = False
        Caption = 'NOME DO SEGURADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 44715
        mmWidth = 33338
        BandType = 0
      end
      object rpRelSalContribLbl9: TppLabel
        UserName = 'rpRelSalContribLbl9'
        AutoSize = False
        Caption = 'Nº CPF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 206905
        mmTop = 44715
        mmWidth = 13758
        BandType = 0
      end
      object rpRelSalContribLbl10: TppLabel
        UserName = 'rpRelSalContribLbl10'
        AutoSize = False
        Caption = 'DOC. INSCRIÇÃO - Nº E SÉRIE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 52917
        mmWidth = 53975
        BandType = 0
      end
      object rpRelSalContribLbl11: TppLabel
        UserName = 'rpRelSalContribLbl11'
        AutoSize = False
        Caption = 'DATA ADMISSÃO/INÍCIO CONTRIBUIÇÃO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 79111
        mmTop = 52917
        mmWidth = 59267
        BandType = 0
      end
      object rpRelSalContribLbl12: TppLabel
        UserName = 'rpRelSalContribLbl12'
        AutoSize = False
        Caption = 'DATA DESLIGAMENTO DA EMPRESA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 146844
        mmTop = 52917
        mmWidth = 53711
        BandType = 0
      end
      object rpRelSalContribLbl13: TppLabel
        UserName = 'rpRelSalContribLbl13'
        AutoSize = False
        Caption = 'Nº PIS/PASEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 206905
        mmTop = 52917
        mmWidth = 23019
        BandType = 0
      end
      object rpRelSalContribDBTxt1: TppDBText
        UserName = 'rpRelSalContribDBTxt1'
        DataField = 'EMPRESA'
        DataPipeline = ppRelSalContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 32279
        mmWidth = 181505
        BandType = 0
      end
      object rpRelSalContribDBTxt3: TppDBText
        UserName = 'rpRelSalContribDBTxt3'
        DataField = 'ENDERECO'
        DataPipeline = ppRelSalContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 40481
        mmWidth = 181505
        BandType = 0
      end
      object rpRelSalContribDBTxt5: TppDBText
        UserName = 'rpRelSalContribDBTxt5'
        DataField = 'EMPREGADO'
        DataPipeline = ppRelSalContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 48683
        mmWidth = 181505
        BandType = 0
      end
      object rpRelSalContribDBTxt7: TppDBText
        UserName = 'rpRelSalContribDBTxt7'
        DataField = 'INCRICAO'
        DataPipeline = ppRelSalContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 56886
        mmWidth = 53975
        BandType = 0
      end
      object rpRelSalContribDBTxt8: TppDBText
        UserName = 'rpRelSalContribDBTxt8'
        DataField = 'DATAADMISSAO'
        DataPipeline = ppRelSalContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3175
        mmLeft = 79111
        mmTop = 56886
        mmWidth = 59267
        BandType = 0
      end
      object rpRelSalContribDBTxt9: TppDBText
        UserName = 'rpRelSalContribDBTxt9'
        DataField = 'DATADESLIGAMENTO'
        DataPipeline = ppRelSalContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3175
        mmLeft = 146844
        mmTop = 56886
        mmWidth = 53711
        BandType = 0
      end
      object rpRelSalContribDBTxt2: TppDBText
        UserName = 'rpRelSalContribDBTxt2'
        DataField = 'CNPJ'
        DataPipeline = ppRelSalContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3175
        mmLeft = 206905
        mmTop = 32279
        mmWidth = 53975
        BandType = 0
      end
      object rpRelSalContribDBTxt10: TppDBText
        UserName = 'rpRelSalContribDBTxt10'
        DataField = 'PIS'
        DataPipeline = ppRelSalContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3175
        mmLeft = 206905
        mmTop = 56886
        mmWidth = 53975
        BandType = 0
      end
      object rpRelSalContribDBTxt6: TppDBText
        UserName = 'rpRelSalContribDBTxt6'
        DataField = 'CPF'
        DataPipeline = ppRelSalContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3175
        mmLeft = 206905
        mmTop = 48683
        mmWidth = 53975
        BandType = 0
      end
    end
    object rpRelSalContribDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 86254
      mmPrintPosition = 0
      object rpRelSalContribShape2: TppShape
        UserName = 'rpRelSalContribShape2'
        mmHeight = 85990
        mmLeft = 9790
        mmTop = 265
        mmWidth = 256117
        BandType = 4
      end
      object rpRelSalContribLine7: TppLine
        UserName = 'rpRelSalContribLine7'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 26458
        mmTop = 6879
        mmWidth = 239184
        BandType = 4
      end
      object rpRelSalContribLine8: TppLine
        UserName = 'rpRelSalContribLine8'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 13494
        mmWidth = 256117
        BandType = 4
      end
      object rpRelSalContribLine9: TppLine
        UserName = 'rpRelSalContribLine9'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 19050
        mmWidth = 256117
        BandType = 4
      end
      object rpRelSalContribLine10: TppLine
        UserName = 'rpRelSalContribLine10'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 24606
        mmWidth = 256117
        BandType = 4
      end
      object rpRelSalContribLine11: TppLine
        UserName = 'rpRelSalContribLine11'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 30427
        mmWidth = 256117
        BandType = 4
      end
      object rpRelSalContribLine12: TppLine
        UserName = 'Line101'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 35983
        mmWidth = 256117
        BandType = 4
      end
      object rpRelSalContribLine13: TppLine
        UserName = 'rpRelSalContribLine13'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 41540
        mmWidth = 256117
        BandType = 4
      end
      object rpRelSalContribLine14: TppLine
        UserName = 'rpRelSalContribLine14'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 47096
        mmWidth = 256117
        BandType = 4
      end
      object rpRelSalContribLine15: TppLine
        UserName = 'rpRelSalContribLine15'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 52652
        mmWidth = 256117
        BandType = 4
      end
      object rpRelSalContribLine16: TppLine
        UserName = 'Line102'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 58208
        mmWidth = 256117
        BandType = 4
      end
      object rpRelSalContribLine17: TppLine
        UserName = 'rpRelSalContribLine17'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 63765
        mmWidth = 256117
        BandType = 4
      end
      object rpRelSalContribLine18: TppLine
        UserName = 'rpRelSalContribLine18'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 69321
        mmWidth = 256117
        BandType = 4
      end
      object rpRelSalContribLine19: TppLine
        UserName = 'rpRelSalContribLine19'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 74877
        mmWidth = 256117
        BandType = 4
      end
      object rpRelSalContribLine20: TppLine
        UserName = 'rpRelSalContribLine20'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 80433
        mmWidth = 256117
        BandType = 4
      end
      object rpRelSalContribLine21: TppLine
        UserName = 'rpRelSalContribLine21'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 85990
        mmLeft = 26194
        mmTop = 265
        mmWidth = 2117
        BandType = 4
      end
      object rpRelSalContribLine22: TppLine
        UserName = 'rpRelSalContribLine22'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 85990
        mmLeft = 56886
        mmTop = 265
        mmWidth = 2117
        BandType = 4
      end
      object rpRelSalContribLine23: TppLine
        UserName = 'rpRelSalContribLine23'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 85990
        mmLeft = 74083
        mmTop = 265
        mmWidth = 2117
        BandType = 4
      end
      object rpRelSalContribLine24: TppLine
        UserName = 'rpRelSalContribLine24'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 85990
        mmLeft = 104775
        mmTop = 265
        mmWidth = 2117
        BandType = 4
      end
      object rpRelSalContribLine25: TppLine
        UserName = 'rpRelSalContribLine25'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 85990
        mmLeft = 121973
        mmTop = 265
        mmWidth = 2117
        BandType = 4
      end
      object rpRelSalContribLine26: TppLine
        UserName = 'rpRelSalContribLine26'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 85990
        mmLeft = 152665
        mmTop = 265
        mmWidth = 2117
        BandType = 4
      end
      object rpRelSalContribLine27: TppLine
        UserName = 'rpRelSalContribLine27'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 85990
        mmLeft = 169863
        mmTop = 265
        mmWidth = 2117
        BandType = 4
      end
      object rpRelSalContribLine28: TppLine
        UserName = 'rpRelSalContribLine28'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 85990
        mmLeft = 200555
        mmTop = 265
        mmWidth = 2117
        BandType = 4
      end
      object rpRelSalContribLine29: TppLine
        UserName = 'rpRelSalContribLine29'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 85990
        mmLeft = 217753
        mmTop = 265
        mmWidth = 2117
        BandType = 4
      end
      object rpRelSalContribLbl14: TppLabel
        UserName = 'rpRelSalContribLbl14'
        AutoSize = False
        Caption = '1 - MÊS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 5292
        mmWidth = 13494
        BandType = 4
      end
      object rpRelSalContribLbl17: TppLabel
        UserName = 'rpRelSalContribLbl17'
        AutoSize = False
        Caption = 'RECOLHI.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 57150
        mmTop = 8467
        mmWidth = 16933
        BandType = 4
      end
      object rpRelSalContribLbl18: TppLabel
        UserName = 'rpRelSalContribLbl18'
        AutoSize = False
        Caption = 'ANO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 75406
        mmTop = 1852
        mmWidth = 8731
        BandType = 4
      end
      object rpRelSalContribLbl20: TppLabel
        UserName = 'rpRelSalContribLbl20'
        AutoSize = False
        Caption = 'RECOLHI.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 105040
        mmTop = 8467
        mmWidth = 16933
        BandType = 4
      end
      object rpRelSalContribLbl21: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = 'ANO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 123296
        mmTop = 1852
        mmWidth = 8731
        BandType = 4
      end
      object rpRelSalContribLbl23: TppLabel
        UserName = 'rpRelSalContribLbl23'
        AutoSize = False
        Caption = 'RECOLHI.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 152929
        mmTop = 8467
        mmWidth = 16933
        BandType = 4
      end
      object rpRelSalContribLbl24: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'ANO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 171186
        mmTop = 1852
        mmWidth = 8731
        BandType = 4
      end
      object rpRelSalContribLbl26: TppLabel
        UserName = 'rpRelSalContribLbl26'
        AutoSize = False
        Caption = 'RECOLHI.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 200819
        mmTop = 8467
        mmWidth = 16933
        BandType = 4
      end
      object rpRelSalContribLbl27: TppLabel
        UserName = 'Label203'
        AutoSize = False
        Caption = 'ANO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 219075
        mmTop = 1852
        mmWidth = 8731
        BandType = 4
      end
      object rpRelSalContribLbl16: TppLabel
        UserName = 'rpRelSalContribLbl16'
        AutoSize = False
        Caption = 'VALOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 26458
        mmTop = 8467
        mmWidth = 30427
        BandType = 4
      end
      object rpRelSalContribLbl29: TppLabel
        UserName = 'Label204'
        AutoSize = False
        Caption = 'RECOLHI.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 248709
        mmTop = 8467
        mmWidth = 16933
        BandType = 4
      end
      object rpRelSalContribLbl19: TppLabel
        UserName = 'rpRelSalContribLbl19'
        AutoSize = False
        Caption = 'VALOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 74348
        mmTop = 8467
        mmWidth = 30427
        BandType = 4
      end
      object rpRelSalContribLbl22: TppLabel
        UserName = 'rpRelSalContribLbl22'
        AutoSize = False
        Caption = 'VALOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 122238
        mmTop = 8467
        mmWidth = 30427
        BandType = 4
      end
      object rpRelSalContribLbl25: TppLabel
        UserName = 'rpRelSalContribLbl25'
        AutoSize = False
        Caption = 'VALOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 170127
        mmTop = 8467
        mmWidth = 30427
        BandType = 4
      end
      object rpRelSalContribLbl28: TppLabel
        UserName = 'rpRelSalContribLbl28'
        AutoSize = False
        Caption = 'VALOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 218017
        mmTop = 8467
        mmWidth = 30427
        BandType = 4
      end
      object rpRelSalContribLbl30: TppLabel
        UserName = 'rpRelSalContribLbl30'
        AutoSize = False
        Caption = 'JAN.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 14552
        mmWidth = 13494
        BandType = 4
      end
      object rpRelSalContribLbl31: TppLabel
        UserName = 'rpRelSalContribLbl31'
        AutoSize = False
        Caption = 'FEV.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 20108
        mmWidth = 13494
        BandType = 4
      end
      object rpRelSalContribLbl32: TppLabel
        UserName = 'rpRelSalContribLbl32'
        AutoSize = False
        Caption = 'MAR.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 25665
        mmWidth = 13494
        BandType = 4
      end
      object rpRelSalContribLbl33: TppLabel
        UserName = 'rpRelSalContribLbl33'
        AutoSize = False
        Caption = 'ABR.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 31485
        mmWidth = 13494
        BandType = 4
      end
      object rpRelSalContribLbl34: TppLabel
        UserName = 'rpRelSalContribLbl34'
        AutoSize = False
        Caption = 'MAI.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 37042
        mmWidth = 13494
        BandType = 4
      end
      object rpRelSalContribLbl35: TppLabel
        UserName = 'rpRelSalContribLbl35'
        AutoSize = False
        Caption = 'JUN.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 11642
        mmTop = 42598
        mmWidth = 13494
        BandType = 4
      end
      object rpRelSalContribLbl36: TppLabel
        UserName = 'rpRelSalContribLbl36'
        AutoSize = False
        Caption = 'JUL.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 48154
        mmWidth = 13494
        BandType = 4
      end
      object rpRelSalContribLbl37: TppLabel
        UserName = 'rpRelSalContribLbl37'
        AutoSize = False
        Caption = 'AGO.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 53711
        mmWidth = 13494
        BandType = 4
      end
      object rpRelSalContribLbl38: TppLabel
        UserName = 'rpRelSalContribLbl38'
        AutoSize = False
        Caption = 'SET.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 59267
        mmWidth = 13494
        BandType = 4
      end
      object rpRelSalContribLbl39: TppLabel
        UserName = 'rpRelSalContribLbl39'
        AutoSize = False
        Caption = 'OUT.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 64823
        mmWidth = 13494
        BandType = 4
      end
      object rpRelSalContribLbl40: TppLabel
        UserName = 'rpRelSalContribLbl40'
        AutoSize = False
        Caption = 'NOV.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 70379
        mmWidth = 13494
        BandType = 4
      end
      object rpRelSalContribLbl41: TppLabel
        UserName = 'rpRelSalContribLbl41'
        AutoSize = False
        Caption = 'DEZ.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 75936
        mmWidth = 13494
        BandType = 4
      end
      object rpRelSalContribLbl42: TppLabel
        UserName = 'rpRelSalContribLbl42'
        AutoSize = False
        Caption = 'TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 81492
        mmWidth = 13494
        BandType = 4
      end
      object rpRelSalContribShape3: TppShape
        UserName = 'rpRelSalContribShape3'
        Brush.Color = 13158600
        mmHeight = 5821
        mmLeft = 56886
        mmTop = 80433
        mmWidth = 17463
        BandType = 4
      end
      object rpRelSalContribShape4: TppShape
        UserName = 'rpRelSalContribShape4'
        Brush.Color = 13158600
        mmHeight = 5821
        mmLeft = 104775
        mmTop = 80433
        mmWidth = 17463
        BandType = 4
      end
      object rpRelSalContribShape5: TppShape
        UserName = 'rpRelSalContribShape5'
        Brush.Color = 13158600
        mmHeight = 5821
        mmLeft = 152665
        mmTop = 80433
        mmWidth = 17463
        BandType = 4
      end
      object rpRelSalContribShape6: TppShape
        UserName = 'rpRelSalContribShape6'
        Brush.Color = 13158600
        mmHeight = 5821
        mmLeft = 200555
        mmTop = 80433
        mmWidth = 17463
        BandType = 4
      end
      object rpRelSalContribShape7: TppShape
        UserName = 'rpRelSalContribShape7'
        Brush.Color = 13158600
        mmHeight = 5821
        mmLeft = 248444
        mmTop = 80433
        mmWidth = 17463
        BandType = 4
      end
      object rpRelSalContribLbl15: TppLabel
        UserName = 'rpRelSalContribLbl15'
        AutoSize = False
        Caption = 'ANO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 27517
        mmTop = 1852
        mmWidth = 8731
        BandType = 4
      end
      object rpRelSalContribLine30: TppLine
        UserName = 'rpRelSalContribLine30'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 85990
        mmLeft = 248444
        mmTop = 265
        mmWidth = 1852
        BandType = 4
      end
      object rpRelSalContribDBTxt13: TppDBText
        UserName = 'rpRelSalContribDBTxt13'
        DataField = 'VAL_2_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 20108
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt12: TppDBText
        UserName = 'rpRelSalContribDBTxt12'
        DataField = 'VAL_1_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 27781
        mmTop = 14552
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt15: TppDBText
        UserName = 'rpRelSalContribDBTxt15'
        DataField = 'VAL_4_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 31485
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt14: TppDBText
        UserName = 'rpRelSalContribDBTxt14'
        DataField = 'VAL_3_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 25665
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt17: TppDBText
        UserName = 'rpRelSalContribDBTxt17'
        DataField = 'VAL_6_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 42598
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt16: TppDBText
        UserName = 'rpRelSalContribDBTxt16'
        DataField = 'VAL_5_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 37042
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt19: TppDBText
        UserName = 'rpRelSalContribDBTxt19'
        DataField = 'VAL_8_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 53711
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt18: TppDBText
        UserName = 'rpRelSalContribDBTxt18'
        DataField = 'VAL_7_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 48154
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt21: TppDBText
        UserName = 'rpRelSalContribDBTxt21'
        DataField = 'VAL_10_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 64823
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt20: TppDBText
        UserName = 'rpRelSalContribDBTxt20'
        DataField = 'VAL_9_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 59267
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt23: TppDBText
        UserName = 'rpRelSalContribDBTxt23'
        DataField = 'VAL_12_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 75936
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt22: TppDBText
        UserName = 'rpRelSalContribDBTxt22'
        DataField = 'VAL_11_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 70379
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt11: TppDBText
        UserName = 'rpRelSalContribDBTxt11'
        DataField = 'ANO_1'
        DataPipeline = ppRelSalContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 37306
        mmTop = 1852
        mmWidth = 17727
        BandType = 4
      end
      object rpRelSalContribDBTxt38: TppDBText
        UserName = 'rpRelSalContribDBTxt38'
        DataField = 'VAL_1_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 75936
        mmTop = 14552
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt39: TppDBText
        UserName = 'rpRelSalContribDBTxt39'
        DataField = 'VAL_2_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 75936
        mmTop = 20108
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt40: TppDBText
        UserName = 'rpRelSalContribDBTxt40'
        DataField = 'VAL_3_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 75936
        mmTop = 25665
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt41: TppDBText
        UserName = 'rpRelSalContribDBTxt41'
        DataField = 'VAL_4_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 75936
        mmTop = 31485
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt42: TppDBText
        UserName = 'rpRelSalContribDBTxt42'
        DataField = 'VAL_5_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 75936
        mmTop = 37042
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt43: TppDBText
        UserName = 'rpRelSalContribDBTxt43'
        DataField = 'VAL_6_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 75936
        mmTop = 42598
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt44: TppDBText
        UserName = 'rpRelSalContribDBTxt44'
        DataField = 'VAL_7_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 75936
        mmTop = 48154
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt45: TppDBText
        UserName = 'rpRelSalContribDBTxt45'
        DataField = 'VAL_8_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 75936
        mmTop = 53711
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt46: TppDBText
        UserName = 'DBText201'
        DataField = 'VAL_9_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 75936
        mmTop = 59267
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt47: TppDBText
        UserName = 'rpRelSalContribDBTxt47'
        DataField = 'VAL_10_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 75936
        mmTop = 64823
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt48: TppDBText
        UserName = 'rpRelSalContribDBTxt48'
        DataField = 'VAL_11_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 75936
        mmTop = 70379
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt49: TppDBText
        UserName = 'rpRelSalContribDBTxt49'
        DataField = 'VAL_12_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 75936
        mmTop = 75936
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt37: TppDBText
        UserName = 'rpRelSalContribDBTxt37'
        DataField = 'ANO_2'
        DataPipeline = ppRelSalContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 85196
        mmTop = 1852
        mmWidth = 17727
        BandType = 4
      end
      object rpRelSalContribDBTxt64: TppDBText
        UserName = 'rpRelSalContribDBTxt64'
        DataField = 'VAL_1_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 14552
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt65: TppDBText
        UserName = 'rpRelSalContribDBTxt65'
        DataField = 'VAL_2_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 20108
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt66: TppDBText
        UserName = 'rpRelSalContribDBTxt66'
        DataField = 'VAL_3_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 25665
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt67: TppDBText
        UserName = 'rpRelSalContribDBTxt67'
        DataField = 'VAL_4_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 31485
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt68: TppDBText
        UserName = 'rpRelSalContribDBTxt68'
        DataField = 'VAL_5_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 37042
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt69: TppDBText
        UserName = 'rpRelSalContribDBTxt69'
        DataField = 'VAL_6_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 42598
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt70: TppDBText
        UserName = 'rpRelSalContribDBTxt70'
        DataField = 'VAL_7_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 48154
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt71: TppDBText
        UserName = 'rpRelSalContribDBTxt71'
        DataField = 'VAL_8_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 53711
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt72: TppDBText
        UserName = 'DBText202'
        DataField = 'VAL_9_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 59267
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt76: TppDBText
        UserName = 'rpRelSalContribDBTxt76'
        DataField = 'VAL_10_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 64823
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt77: TppDBText
        UserName = 'rpRelSalContribDBTxt77'
        DataField = 'VAL_11_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 70379
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt78: TppDBText
        UserName = 'rpRelSalContribDBTxt78'
        DataField = 'VAL_12_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 75936
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt63: TppDBText
        UserName = 'rpRelSalContribDBTxt63'
        DataField = 'ANO_3'
        DataPipeline = ppRelSalContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 133086
        mmTop = 1852
        mmWidth = 17727
        BandType = 4
      end
      object rpRelSalContribDBTxt92: TppDBText
        UserName = 'rpRelSalContribDBTxt92'
        DataField = 'ANO_4'
        DataPipeline = ppRelSalContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 180975
        mmTop = 1852
        mmWidth = 17727
        BandType = 4
      end
      object rpRelSalContribDBTxt93: TppDBText
        UserName = 'rpRelSalContribDBTxt93'
        DataField = 'VAL_1_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 14552
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt94: TppDBText
        UserName = 'rpRelSalContribDBTxt94'
        DataField = 'VAL_2_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 20108
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt95: TppDBText
        UserName = 'rpRelSalContribDBTxt95'
        DataField = 'VAL_3_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 25665
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt96: TppDBText
        UserName = 'DBText401'
        DataField = 'VAL_4_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 31485
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt97: TppDBText
        UserName = 'rpRelSalContribDBTxt97'
        DataField = 'VAL_5_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 37042
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt98: TppDBText
        UserName = 'rpRelSalContribDBTxt98'
        DataField = 'VAL_6_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 42598
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt99: TppDBText
        UserName = 'rpRelSalContribDBTxt99'
        DataField = 'VAL_7_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 48154
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt100: TppDBText
        UserName = 'rpRelSalContribDBTxt100'
        DataField = 'VAL_8_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 53711
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt101: TppDBText
        UserName = 'rpRelSalContribDBTxt101'
        DataField = 'VAL_9_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 59267
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt102: TppDBText
        UserName = 'rpRelSalContribDBTxt102'
        DataField = 'VAL_10_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 64823
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt103: TppDBText
        UserName = 'rpRelSalContribDBTxt103'
        DataField = 'VAL_11_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 70379
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt104: TppDBText
        UserName = 'rpRelSalContribDBTxt104'
        DataField = 'VAL_12_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 75936
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt118: TppDBText
        UserName = 'rpRelSalContribDBTxt118'
        DataField = 'ANO_5'
        DataPipeline = ppRelSalContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 228865
        mmTop = 1852
        mmWidth = 17727
        BandType = 4
      end
      object rpRelSalContribDBTxt119: TppDBText
        UserName = 'rpRelSalContribDBTxt119'
        DataField = 'VAL_1_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 219605
        mmTop = 14552
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt120: TppDBText
        UserName = 'rpRelSalContribDBTxt120'
        DataField = 'VAL_2_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 219605
        mmTop = 20108
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt121: TppDBText
        UserName = 'rpRelSalContribDBTxt121'
        DataField = 'VAL_3_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 219605
        mmTop = 25665
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt122: TppDBText
        UserName = 'DBText402'
        DataField = 'VAL_4_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 219605
        mmTop = 31485
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt123: TppDBText
        UserName = 'rpRelSalContribDBTxt123'
        DataField = 'VAL_5_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 219605
        mmTop = 37042
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt124: TppDBText
        UserName = 'rpRelSalContribDBTxt124'
        DataField = 'VAL_6_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 219605
        mmTop = 42598
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt125: TppDBText
        UserName = 'rpRelSalContribDBTxt125'
        DataField = 'VAL_7_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 219605
        mmTop = 48154
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt126: TppDBText
        UserName = 'rpRelSalContribDBTxt126'
        DataField = 'VAL_8_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 219605
        mmTop = 53711
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt127: TppDBText
        UserName = 'rpRelSalContribDBTxt127'
        DataField = 'VAL_9_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 219605
        mmTop = 59267
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt128: TppDBText
        UserName = 'rpRelSalContribDBTxt128'
        DataField = 'VAL_10_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 219605
        mmTop = 64823
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt129: TppDBText
        UserName = 'rpRelSalContribDBTxt129'
        DataField = 'VAL_11_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 219605
        mmTop = 70379
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt130: TppDBText
        UserName = 'rpRelSalContribDBTxt130'
        DataField = 'VAL_12_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 219605
        mmTop = 75936
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt24: TppDBText
        UserName = 'rpRelSalContribDBTxt24'
        DataField = 'TOTAL_ANO_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 81492
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt50: TppDBText
        UserName = 'rpRelSalContribDBTxt50'
        DataField = 'TOTAL_ANO_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 75936
        mmTop = 81492
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt79: TppDBText
        UserName = 'rpRelSalContribDBTxt79'
        DataField = 'TOTAL_ANO_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 81492
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt105: TppDBText
        UserName = 'rpRelSalContribDBTxt105'
        DataField = 'TOTAL_ANO_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 81492
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt131: TppDBText
        UserName = 'rpRelSalContribDBTxt131'
        DataField = 'TOTAL_ANO_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 219605
        mmTop = 81492
        mmWidth = 27252
        BandType = 4
      end
      object rpRelSalContribDBTxt25: TppDBText
        UserName = 'rpRelSalContribDBTxt25'
        DataField = 'RECOLHIMENTO_1_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 14552
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt26: TppDBText
        UserName = 'rpRelSalContribDBTxt26'
        DataField = 'RECOLHIMENTO_2_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 20108
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt27: TppDBText
        UserName = 'rpRelSalContribDBTxt27'
        DataField = 'RECOLHIMENTO_3_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 25665
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt28: TppDBText
        UserName = 'rpRelSalContribDBTxt28'
        DataField = 'RECOLHIMENTO_4_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 31485
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt29: TppDBText
        UserName = 'rpRelSalContribDBTxt29'
        DataField = 'RECOLHIMENTO_5_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 37042
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt30: TppDBText
        UserName = 'rpRelSalContribDBTxt30'
        DataField = 'RECOLHIMENTO_6_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 42598
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt31: TppDBText
        UserName = 'rpRelSalContribDBTxt31'
        DataField = 'RECOLHIMENTO_7_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 48154
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt32: TppDBText
        UserName = 'rpRelSalContribDBTxt32'
        DataField = 'RECOLHIMENTO_8_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 53711
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt33: TppDBText
        UserName = 'DBText203'
        DataField = 'RECOLHIMENTO_9_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 59267
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt34: TppDBText
        UserName = 'rpRelSalContribDBTxt34'
        DataField = 'RECOLHIMENTO_10_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 64823
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt35: TppDBText
        UserName = 'rpRelSalContribDBTxt35'
        DataField = 'RECOLHIMENTO_11_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 70379
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt36: TppDBText
        UserName = 'rpRelSalContribDBTxt36'
        DataField = 'RECOLHIMENTO_12_1'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 75936
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt51: TppDBText
        UserName = 'rpRelSalContribDBTxt51'
        DataField = 'RECOLHIMENTO_1_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 14552
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt52: TppDBText
        UserName = 'DBText101'
        DataField = 'RECOLHIMENTO_2_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 20108
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt53: TppDBText
        UserName = 'rpRelSalContribDBTxt53'
        DataField = 'RECOLHIMENTO_3_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 25665
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt54: TppDBText
        UserName = 'rpRelSalContribDBTxt54'
        DataField = 'RECOLHIMENTO_4_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 31485
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt55: TppDBText
        UserName = 'rpRelSalContribDBTxt55'
        DataField = 'RECOLHIMENTO_5_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 37042
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt56: TppDBText
        UserName = 'rpRelSalContribDBTxt56'
        DataField = 'RECOLHIMENTO_6_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 42598
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt57: TppDBText
        UserName = 'rpRelSalContribDBTxt57'
        DataField = 'RECOLHIMENTO_7_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 48154
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt58: TppDBText
        UserName = 'rpRelSalContribDBTxt58'
        DataField = 'RECOLHIMENTO_8_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 53711
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt59: TppDBText
        UserName = 'rpRelSalContribDBTxt59'
        DataField = 'RECOLHIMENTO_9_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 59267
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt60: TppDBText
        UserName = 'rpRelSalContribDBTxt60'
        DataField = 'RECOLHIMENTO_10_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 64823
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt61: TppDBText
        UserName = 'DBText4'
        DataField = 'RECOLHIMENTO_11_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 70379
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt62: TppDBText
        UserName = 'DBText901'
        DataField = 'RECOLHIMENTO_12_2'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 75936
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt106: TppDBText
        UserName = 'rpRelSalContribDBTxt106'
        DataField = 'RECOLHIMENTO_1_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 14552
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt107: TppDBText
        UserName = 'rpRelSalContribDBTxt107'
        DataField = 'RECOLHIMENTO_2_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 20108
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt108: TppDBText
        UserName = 'rpRelSalContribDBTxt108'
        DataField = 'RECOLHIMENTO_3_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 25665
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt109: TppDBText
        UserName = 'rpRelSalContribDBTxt109'
        DataField = 'RECOLHIMENTO_4_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 31485
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt110: TppDBText
        UserName = 'rpRelSalContribDBTxt110'
        DataField = 'RECOLHIMENTO_5_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 37042
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt111: TppDBText
        UserName = 'rpRelSalContribDBTxt111'
        DataField = 'RECOLHIMENTO_6_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 42598
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt112: TppDBText
        UserName = 'rpRelSalContribDBTxt112'
        DataField = 'RECOLHIMENTO_7_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 48154
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt113: TppDBText
        UserName = 'rpRelSalContribDBTxt113'
        DataField = 'RECOLHIMENTO_8_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 53711
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt114: TppDBText
        UserName = 'rpRelSalContribDBTxt114'
        DataField = 'RECOLHIMENTO_9_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 59267
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt115: TppDBText
        UserName = 'DBText1001'
        DataField = 'RECOLHIMENTO_10_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 64823
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt116: TppDBText
        UserName = 'rpRelSalContribDBTxt116'
        DataField = 'RECOLHIMENTO_11_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 70379
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt117: TppDBText
        UserName = 'rpRelSalContribDBTxt117'
        DataField = 'RECOLHIMENTO_12_4'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 75936
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt91: TppDBText
        UserName = 'DBText902'
        DataField = 'RECOLHIMENTO_12_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 75936
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt90: TppDBText
        UserName = 'rpRelSalContribDBTxt90'
        DataField = 'RECOLHIMENTO_11_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 70379
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt89: TppDBText
        UserName = 'rpRelSalContribDBTxt89'
        DataField = 'RECOLHIMENTO_10_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 64823
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt88: TppDBText
        UserName = 'rpRelSalContribDBTxt88'
        DataField = 'RECOLHIMENTO_9_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 59267
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt87: TppDBText
        UserName = 'rpRelSalContribDBTxt87'
        DataField = 'RECOLHIMENTO_8_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 53711
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt86: TppDBText
        UserName = 'rpRelSalContribDBTxt86'
        DataField = 'RECOLHIMENTO_7_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 48154
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt85: TppDBText
        UserName = 'rpRelSalContribDBTxt85'
        DataField = 'RECOLHIMENTO_6_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 42598
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt84: TppDBText
        UserName = 'rpRelSalContribDBTxt84'
        DataField = 'RECOLHIMENTO_5_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 37042
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt83: TppDBText
        UserName = 'rpRelSalContribDBTxt83'
        DataField = 'RECOLHIMENTO_4_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 31485
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt82: TppDBText
        UserName = 'rpRelSalContribDBTxt82'
        DataField = 'RECOLHIMENTO_3_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 25665
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt81: TppDBText
        UserName = 'DBText102'
        DataField = 'RECOLHIMENTO_2_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 20108
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt80: TppDBText
        UserName = 'rpRelSalContribDBTxt80'
        DataField = 'RECOLHIMENTO_1_3'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 14552
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt132: TppDBText
        UserName = 'rpRelSalContribDBTxt132'
        DataField = 'RECOLHIMENTO_1_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 249238
        mmTop = 14552
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt133: TppDBText
        UserName = 'rpRelSalContribDBTxt133'
        DataField = 'RECOLHIMENTO_2_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 249238
        mmTop = 20108
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt134: TppDBText
        UserName = 'rpRelSalContribDBTxt134'
        DataField = 'RECOLHIMENTO_3_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 249238
        mmTop = 25665
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt135: TppDBText
        UserName = 'rpRelSalContribDBTxt135'
        DataField = 'RECOLHIMENTO_4_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 249238
        mmTop = 31485
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt136: TppDBText
        UserName = 'rpRelSalContribDBTxt136'
        DataField = 'RECOLHIMENTO_5_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 249238
        mmTop = 37042
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt137: TppDBText
        UserName = 'rpRelSalContribDBTxt137'
        DataField = 'RECOLHIMENTO_6_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 249238
        mmTop = 42598
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt138: TppDBText
        UserName = 'rpRelSalContribDBTxt138'
        DataField = 'RECOLHIMENTO_7_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 249238
        mmTop = 48154
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt139: TppDBText
        UserName = 'DBText1101'
        DataField = 'RECOLHIMENTO_8_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 249238
        mmTop = 53711
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt140: TppDBText
        UserName = 'rpRelSalContribDBTxt140'
        DataField = 'RECOLHIMENTO_9_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 249238
        mmTop = 59267
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt141: TppDBText
        UserName = 'rpRelSalContribDBTxt141'
        DataField = 'RECOLHIMENTO_10_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 249238
        mmTop = 64823
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt142: TppDBText
        UserName = 'rpRelSalContribDBTxt142'
        DataField = 'RECOLHIMENTO_11_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 249238
        mmTop = 70379
        mmWidth = 15875
        BandType = 4
      end
      object rpRelSalContribDBTxt143: TppDBText
        UserName = 'rpRelSalContribDBTxt143'
        DataField = 'RECOLHIMENTO_12_5'
        DataPipeline = ppRelSalContrib
        DisplayFormat = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 249238
        mmTop = 75936
        mmWidth = 15875
        BandType = 4
      end
    end
    object rpRelSalContribFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 19844
      mmPrintPosition = 0
      object rpRelSalContribLine31: TppLine
        UserName = 'rpRelSalContribLine31'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 9525
        mmWidth = 120650
        BandType = 8
      end
      object rpRelSalContribLbl43: TppLabel
        UserName = 'rpRelSalContribLbl43'
        AutoSize = False
        Caption = 'LOCALIDADE E DATA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 9790
        mmTop = 13494
        mmWidth = 120650
        BandType = 8
      end
      object rpRelSalContribLbl44: TppLabel
        UserName = 'rpRelSalContribLbl44'
        AutoSize = False
        Caption = 'ASSINATURA DO RESPONSÁVEL E CARIMBO DA EMPRESA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 145257
        mmTop = 13494
        mmWidth = 120650
        BandType = 8
      end
      object rpRelSalContribLine32: TppLine
        UserName = 'rpRelSalContribLine32'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 145257
        mmTop = 9525
        mmWidth = 120650
        BandType = 8
      end
      object rpRelSalContribLblLOCAL_DATA1: TppLabel
        UserName = 'rpRelSalContribLblLOCAL_DATA1'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 9790
        mmTop = 3969
        mmWidth = 120650
        BandType = 8
      end
    end
    object rpRelSalContribSmryBnd: TppSummaryBand
      AfterPrint = rpRelSalContribSmryBndAfterPrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 16140
      mmPrintPosition = 0
      object rpRelSalContribSubRep1: TppSubReport
        UserName = 'rpRelSalContribSubRep1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        PrintBehavior = pbSection
        ResetPageNo = False
        TraverseAllData = False
        DataPipelineName = 'ppRelSalContrib1'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 265
        mmWidth = 283770
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpRelSalContribChildRep1: TppChildReport
          AutoStop = False
          DataPipeline = ppRelSalContrib1
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relação dos Salários de Contribuição'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6615
          PrinterSetup.mmMarginLeft = 6615
          PrinterSetup.mmMarginRight = 6615
          PrinterSetup.mmMarginTop = 6615
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 88
          Top = 48
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppRelSalContrib1'
          object rpRelSalContribSubRep1HdrBnd: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 36248
            mmPrintPosition = 0
            object rpRelSalContribSubRep1Shape1: TppShape
              UserName = 'rpRelSalContribSubRep1Shape1'
              mmHeight = 4233
              mmLeft = 9790
              mmTop = 32015
              mmWidth = 256117
              BandType = 0
            end
            object rpRelSalContribSubRep1Line1: TppLine
              UserName = 'rpRelSalContribSubRep1Line1'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 58473
              mmTop = 32279
              mmWidth = 2117
              BandType = 0
            end
            object rpRelSalContribSubRep1Lbl2: TppLabel
              UserName = 'rpRelSalContribSubRep1Lbl2'
              AutoSize = False
              Caption = '2 - MÊS/ANO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 11906
              mmTop = 32279
              mmWidth = 44715
              BandType = 0
            end
            object rpRelSalContribSubRep1Lbl3: TppLabel
              UserName = 'rpRelSalContribSubRep1Lbl3'
              AutoSize = False
              Caption = 'MOTIVO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 60325
              mmTop = 32279
              mmWidth = 165894
              BandType = 0
            end
            object rpRelSalContribSubRep1Lbl1: TppLabel
              UserName = 'rpRelSalContribSubRep1Lbl1'
              AutoSize = False
              Caption = 'AUMENTOS SALARIAIS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 9790
              mmTop = 26988
              mmWidth = 256117
              BandType = 0
            end
            object rpRelSalContribSubRep1Image: TppImage
              UserName = 'rpRelSalContribSubRep1Image'
              MaintainAspectRatio = False
              Stretch = True
              Picture.Data = {
                07544269746D617036420000424D364200000000000036000000280000005800
                000040000000010018000000000000420000120B0000120B0000000000000000
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
              mmHeight = 7673
              mmLeft = 10848
              mmTop = 8467
              mmWidth = 14817
              BandType = 0
            end
            object rpRelSalContribSubRep1Lbl7: TppLabel
              UserName = 'rpRelSalContribSubRep1Lbl7'
              AutoSize = False
              Caption = 'INSS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 22
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 9260
              mmLeft = 26723
              mmTop = 8202
              mmWidth = 19844
              BandType = 0
            end
            object rpRelSalContribSubRep1Lbl8: TppLabel
              UserName = 'rpRelSalContribSubRep1Lbl8'
              AutoSize = False
              Caption = 'INSTITUTO NACIONAL DO SEGURO SOCIAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              mmHeight = 2117
              mmLeft = 10054
              mmTop = 19579
              mmWidth = 40481
              BandType = 0
            end
            object rpRelSalContribSubRep1Line2: TppLine
              UserName = 'rpRelSalContribSubRep1Line2'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 227807
              mmTop = 32279
              mmWidth = 2117
              BandType = 0
            end
            object rpRelSalContribSubRep1Lbl4: TppLabel
              UserName = 'rpRelSalContribSubRep1Lbl4'
              AutoSize = False
              Caption = 'PERC.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 229659
              mmTop = 32279
              mmWidth = 34660
              BandType = 0
            end
          end
          object rpRelSalContribSubRep1DtlBnd: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object rpRelSalContribSubRep1Line7: TppLine
              UserName = 'rpRelSalContribSubRep1Line7'
              Position = lpBottom
              Weight = 0.75
              mmHeight = 2117
              mmLeft = 9790
              mmTop = 2381
              mmWidth = 256117
              BandType = 4
            end
            object rpRelSalContribSubRep1Line4: TppLine
              UserName = 'rpRelSalContribSubRep1Line4'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 58473
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object rpRelSalContribSubRep1Line5: TppLine
              UserName = 'rpRelSalContribSubRep1Line5'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 227807
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object rpRelSalContribSubRep1DBTxt1: TppDBText
              UserName = 'rpRelSalContribSubRep1DBTxt1'
              DataField = 'MESANO'
              DataPipeline = ppRelSalContrib1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib1'
              mmHeight = 3704
              mmLeft = 11906
              mmTop = 265
              mmWidth = 44715
              BandType = 4
            end
            object rpRelSalContribSubRep1DBTxt2: TppDBText
              UserName = 'rpRelSalContribSubRep1DBTxt2'
              DataField = 'MOTIVO'
              DataPipeline = ppRelSalContrib1
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppRelSalContrib1'
              mmHeight = 3704
              mmLeft = 60325
              mmTop = 265
              mmWidth = 165894
              BandType = 4
            end
            object rpRelSalContribSubRep1DBTxt3: TppDBText
              UserName = 'rpRelSalContribSubRep1DBTxt3'
              DataField = 'PERC_REAJ'
              DataPipeline = ppRelSalContrib1
              DisplayFormat = '#,###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppRelSalContrib1'
              mmHeight = 3704
              mmLeft = 229659
              mmTop = 265
              mmWidth = 34660
              BandType = 4
            end
            object rpRelSalContribSubRep1Line3: TppLine
              UserName = 'rpRelSalContribSubRep1Line3'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 9790
              mmTop = 0
              mmWidth = 1588
              BandType = 4
            end
            object rpRelSalContribSubRep1Line6: TppLine
              UserName = 'rpRelSalContribSubRep1Line6'
              Position = lpRight
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 263790
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
          end
          object rpRelSalContribSubRep1SmryBnd: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 19844
            mmPrintPosition = 0
            object rpRelSalContribSubRep1Line8: TppLine
              UserName = 'rpRelSalContribSubRep1Line8'
              Weight = 0.75
              mmHeight = 2117
              mmLeft = 9790
              mmTop = 9525
              mmWidth = 120650
              BandType = 7
            end
            object rpRelSalContribSubRep1Lbl5: TppLabel
              UserName = 'rpRelSalContribLbl501'
              AutoSize = False
              Caption = 'LOCALIDADE E DATA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 9790
              mmTop = 13494
              mmWidth = 120650
              BandType = 7
            end
            object rpRelSalContribSubRep1Lbl6: TppLabel
              UserName = 'Label501'
              AutoSize = False
              Caption = 'ASSINATURA DO RESPONSÁVEL E CARIMBO DA EMPRESA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 145257
              mmTop = 13494
              mmWidth = 120650
              BandType = 7
            end
            object rpRelSalContribSubRep1Line9: TppLine
              UserName = 'Line401'
              Weight = 0.75
              mmHeight = 2117
              mmLeft = 145257
              mmTop = 9525
              mmWidth = 120650
              BandType = 7
            end
            object rpRelSalContribSubRep1LblLOCAL_DATA: TppLabel
              UserName = 'rpRelSalContribSubRep1LblLOCAL_DATA'
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 9790
              mmTop = 3969
              mmWidth = 120650
              BandType = 7
            end
          end
        end
      end
      object rpRelSalContribSubRep2: TppSubReport
        UserName = 'rpRelSalContribSubRep2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        PrintBehavior = pbSection
        ResetPageNo = False
        TraverseAllData = False
        DataPipelineName = 'ppRelSalContrib2'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3704
        mmWidth = 283770
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppRelSalContrib2
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relação dos Salários de Contribuição ao INSS'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6615
          PrinterSetup.mmMarginLeft = 6615
          PrinterSetup.mmMarginRight = 6615
          PrinterSetup.mmMarginTop = 6615
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 88
          Top = 48
          Version = '7.04'
          mmColumnWidth = 284300
          DataPipelineName = 'ppRelSalContrib2'
          object rpRelSalContribSubRep2HdrBnd: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 34396
            mmPrintPosition = 0
            object rpRelSalContribSubRep2Lbl1: TppLabel
              UserName = 'rpRelSalContribSubRepLbl1'
              AutoSize = False
              Caption = 'DISCRIMINAÇÃO DAS PARCELAS DO SALÁRIO-CONTRIBUIÇÃO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 7144
              mmTop = 25665
              mmWidth = 269082
              BandType = 0
            end
            object rpRelSalContribSubRep2Image: TppImage
              UserName = 'rpRelSalContribImage2'
              MaintainAspectRatio = False
              Stretch = True
              Picture.Data = {
                07544269746D617036420000424D364200000000000036000000280000005800
                000040000000010018000000000000420000120B0000120B0000000000000000
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
              mmHeight = 7673
              mmLeft = 10848
              mmTop = 6615
              mmWidth = 14817
              BandType = 0
            end
            object rpRelSalContribSubRep2Lbl7: TppLabel
              UserName = 'rpRelSalContribSubRep2Lbl7'
              AutoSize = False
              Caption = 'INSS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 22
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 9260
              mmLeft = 26723
              mmTop = 6350
              mmWidth = 19844
              BandType = 0
            end
            object rpRelSalContribSubRep2Lbl8: TppLabel
              UserName = 'rpRelSalContribSubRep2Lbl8'
              AutoSize = False
              Caption = 'INSTITUTO NACIONAL DO SEGURO SOCIAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              mmHeight = 2117
              mmLeft = 10054
              mmTop = 17727
              mmWidth = 40481
              BandType = 0
            end
          end
          object rpRelSalContribSubRep2DtlBnd: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppLine9: TppLine
              UserName = 'rpRelSalContribSubRepLine4'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 76729
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppDBText1: TppDBText
              UserName = 'rpRelSalContribSubRepDBTxt1'
              DataField = 'RUBRICA'
              DataPipeline = ppRelSalContrib2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppRelSalContrib2'
              mmHeight = 3704
              mmLeft = 8467
              mmTop = 265
              mmWidth = 66940
              BandType = 4
            end
            object ppLine12: TppLine
              UserName = 'rpRelSalContribSubRepLine3'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 7144
              mmTop = 0
              mmWidth = 1588
              BandType = 4
            end
            object ppLine13: TppLine
              UserName = 'rpRelSalContribSubRepLine6'
              Position = lpRight
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 274903
              mmTop = 0
              mmWidth = 1323
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText1'
              DataField = 'VAL_ABS_01'
              DataPipeline = ppRelSalContrib2
              DisplayFormat = '#,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppRelSalContrib2'
              mmHeight = 3704
              mmLeft = 78317
              mmTop = 265
              mmWidth = 13229
              BandType = 4
            end
            object ppDBText39: TppDBText
              UserName = 'DBText39'
              DataField = 'VAL_ABS_02'
              DataPipeline = ppRelSalContrib2
              DisplayFormat = '#,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppRelSalContrib2'
              mmHeight = 3704
              mmLeft = 94986
              mmTop = 265
              mmWidth = 13229
              BandType = 4
            end
            object ppDBText42: TppDBText
              UserName = 'DBText42'
              DataField = 'VAL_ABS_03'
              DataPipeline = ppRelSalContrib2
              DisplayFormat = '#,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppRelSalContrib2'
              mmHeight = 3704
              mmLeft = 111654
              mmTop = 265
              mmWidth = 13229
              BandType = 4
            end
            object ppDBText43: TppDBText
              UserName = 'DBText43'
              DataField = 'VAL_ABS_04'
              DataPipeline = ppRelSalContrib2
              DisplayFormat = '#,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppRelSalContrib2'
              mmHeight = 3704
              mmLeft = 128323
              mmTop = 265
              mmWidth = 13229
              BandType = 4
            end
            object ppDBText44: TppDBText
              UserName = 'DBText44'
              DataField = 'VAL_ABS_05'
              DataPipeline = ppRelSalContrib2
              DisplayFormat = '#,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppRelSalContrib2'
              mmHeight = 3704
              mmLeft = 144992
              mmTop = 265
              mmWidth = 13229
              BandType = 4
            end
            object ppDBText45: TppDBText
              UserName = 'DBText45'
              DataField = 'VAL_ABS_06'
              DataPipeline = ppRelSalContrib2
              DisplayFormat = '#,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppRelSalContrib2'
              mmHeight = 3704
              mmLeft = 161661
              mmTop = 265
              mmWidth = 13229
              BandType = 4
            end
            object ppDBText46: TppDBText
              UserName = 'DBText46'
              DataField = 'VAL_ABS_07'
              DataPipeline = ppRelSalContrib2
              DisplayFormat = '#,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppRelSalContrib2'
              mmHeight = 3704
              mmLeft = 178330
              mmTop = 265
              mmWidth = 13229
              BandType = 4
            end
            object ppDBText47: TppDBText
              UserName = 'DBText47'
              DataField = 'VAL_ABS_08'
              DataPipeline = ppRelSalContrib2
              DisplayFormat = '#,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppRelSalContrib2'
              mmHeight = 3704
              mmLeft = 194998
              mmTop = 265
              mmWidth = 13229
              BandType = 4
            end
            object ppDBText48: TppDBText
              UserName = 'DBText48'
              DataField = 'VAL_ABS_09'
              DataPipeline = ppRelSalContrib2
              DisplayFormat = '#,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppRelSalContrib2'
              mmHeight = 3704
              mmLeft = 211667
              mmTop = 265
              mmWidth = 13229
              BandType = 4
            end
            object ppDBText50: TppDBText
              UserName = 'DBText50'
              DataField = 'VAL_ABS_10'
              DataPipeline = ppRelSalContrib2
              DisplayFormat = '#,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppRelSalContrib2'
              mmHeight = 3704
              mmLeft = 228336
              mmTop = 265
              mmWidth = 13229
              BandType = 4
            end
            object ppDBText54: TppDBText
              UserName = 'DBText501'
              DataField = 'VAL_ABS_11'
              DataPipeline = ppRelSalContrib2
              DisplayFormat = '#,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppRelSalContrib2'
              mmHeight = 3704
              mmLeft = 245005
              mmTop = 265
              mmWidth = 13229
              BandType = 4
            end
            object ppDBText55: TppDBText
              UserName = 'DBText55'
              DataField = 'VAL_ABS_12'
              DataPipeline = ppRelSalContrib2
              DisplayFormat = '#,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppRelSalContrib2'
              mmHeight = 3704
              mmLeft = 261409
              mmTop = 265
              mmWidth = 13229
              BandType = 4
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 93134
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine16: TppLine
              UserName = 'Line16'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 109802
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine19: TppLine
              UserName = 'Line19'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 126471
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine23: TppLine
              UserName = 'Line23'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 143140
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine26: TppLine
              UserName = 'Line26'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 159809
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine29: TppLine
              UserName = 'Line29'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 176477
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine32: TppLine
              UserName = 'Line32'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 193146
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine35: TppLine
              UserName = 'Line35'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 209815
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine38: TppLine
              UserName = 'Line38'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 226484
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine41: TppLine
              UserName = 'Line41'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 243153
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine44: TppLine
              UserName = 'Line44'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 259557
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine46: TppLine
              UserName = 'Line46'
              Position = lpBottom
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 7144
              mmTop = 3175
              mmWidth = 269082
              BandType = 4
            end
          end
          object rpRelSalContribSubRep2SmryBnd: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 19844
            mmPrintPosition = 0
            object ppLine14: TppLine
              UserName = 'rpRelSalContribSubRepLine8'
              Weight = 0.75
              mmHeight = 2117
              mmLeft = 7144
              mmTop = 9525
              mmWidth = 120650
              BandType = 7
            end
            object rpRelSalContribSubRep2Lbl5: TppLabel
              UserName = 'rpRelSalContribLbl501'
              AutoSize = False
              Caption = 'LOCALIDADE E DATA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 7144
              mmTop = 13494
              mmWidth = 120650
              BandType = 7
            end
            object rpRelSalContribSubRep2Lbl6: TppLabel
              UserName = 'Label501'
              AutoSize = False
              Caption = 'ASSINATURA DO RESPONSÁVEL E CARIMBO DA EMPRESA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 155575
              mmTop = 13494
              mmWidth = 120650
              BandType = 7
            end
            object ppLine15: TppLine
              UserName = 'Line401'
              Weight = 0.75
              mmHeight = 2117
              mmLeft = 155575
              mmTop = 9525
              mmWidth = 120650
              BandType = 7
            end
            object rpRelSalContribSubRep2LblLOCAL_DATA: TppLabel
              UserName = 'rpRelSalContribSubRep2LblLOCAL_DATA'
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 7144
              mmTop = 3969
              mmWidth = 120650
              BandType = 7
            end
          end
          object rpRelSalContribSubRep2Grp1: TppGroup
            BreakName = 'ANO'
            DataPipeline = ppRelSalContrib2
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'rpRelSalContribSubRep2Grp1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppRelSalContrib2'
            object ppGroupHeaderBand2: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object ppShape1: TppShape
                UserName = 'rpRelSalContribSubRepShape1'
                mmHeight = 4233
                mmLeft = 7144
                mmTop = 265
                mmWidth = 269082
                BandType = 3
                GroupNo = 0
              end
              object ppLine6: TppLine
                UserName = 'rpRelSalContribSubRepLine1'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 76729
                mmTop = 265
                mmWidth = 1323
                BandType = 3
                GroupNo = 0
              end
              object rpRelSalContribSubRep2Lbl2: TppLabel
                UserName = 'rpRelSalContribSubRepLbl2'
                AutoSize = False
                Caption = 
                  '                               ANO:                             ' +
                  '      MÊS:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 8467
                mmTop = 529
                mmWidth = 66940
                BandType = 3
                GroupNo = 0
              end
              object ppLine1: TppLine
                UserName = 'Line1'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 93134
                mmTop = 265
                mmWidth = 1323
                BandType = 3
                GroupNo = 0
              end
              object ppLine11: TppLine
                UserName = 'Line11'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 109802
                mmTop = 265
                mmWidth = 1323
                BandType = 3
                GroupNo = 0
              end
              object ppLine18: TppLine
                UserName = 'Line18'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 126471
                mmTop = 265
                mmWidth = 1323
                BandType = 3
                GroupNo = 0
              end
              object ppLine22: TppLine
                UserName = 'Line22'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 143140
                mmTop = 265
                mmWidth = 1323
                BandType = 3
                GroupNo = 0
              end
              object ppLine25: TppLine
                UserName = 'Line25'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 159809
                mmTop = 265
                mmWidth = 1323
                BandType = 3
                GroupNo = 0
              end
              object ppLine28: TppLine
                UserName = 'Line28'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 176477
                mmTop = 265
                mmWidth = 1323
                BandType = 3
                GroupNo = 0
              end
              object ppLine31: TppLine
                UserName = 'Line31'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 193146
                mmTop = 265
                mmWidth = 1323
                BandType = 3
                GroupNo = 0
              end
              object ppLine34: TppLine
                UserName = 'Line34'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 209815
                mmTop = 265
                mmWidth = 1323
                BandType = 3
                GroupNo = 0
              end
              object ppLine37: TppLine
                UserName = 'Line37'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 226484
                mmTop = 265
                mmWidth = 1323
                BandType = 3
                GroupNo = 0
              end
              object ppLine40: TppLine
                UserName = 'Line40'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 243153
                mmTop = 265
                mmWidth = 1323
                BandType = 3
                GroupNo = 0
              end
              object ppLine43: TppLine
                UserName = 'Line43'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 259557
                mmTop = 265
                mmWidth = 1323
                BandType = 3
                GroupNo = 0
              end
              object ppDBText53: TppDBText
                UserName = 'DBText53'
                DataField = 'ANO'
                DataPipeline = ppRelSalContrib2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                DataPipelineName = 'ppRelSalContrib2'
                mmHeight = 3704
                mmLeft = 40481
                mmTop = 529
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object ppLabel7: TppLabel
                UserName = 'Label1'
                AutoSize = False
                Caption = 'Jan'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 78317
                mmTop = 529
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object ppLabel8: TppLabel
                UserName = 'Label8'
                AutoSize = False
                Caption = 'Fev'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 94986
                mmTop = 529
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object ppLabel9: TppLabel
                UserName = 'Label9'
                AutoSize = False
                Caption = 'Mar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 111654
                mmTop = 529
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object ppLabel10: TppLabel
                UserName = 'Label10'
                AutoSize = False
                Caption = 'Abr'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 128323
                mmTop = 529
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object ppLabel11: TppLabel
                UserName = 'Label2'
                AutoSize = False
                Caption = 'Mai'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 144992
                mmTop = 529
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object ppLabel12: TppLabel
                UserName = 'Label12'
                AutoSize = False
                Caption = 'Jun'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 161661
                mmTop = 529
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object ppLabel14: TppLabel
                UserName = 'Label101'
                AutoSize = False
                Caption = 'Out'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 228336
                mmTop = 529
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object ppLabel23: TppLabel
                UserName = 'Label23'
                AutoSize = False
                Caption = 'Nov'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 245005
                mmTop = 529
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object ppLabel25: TppLabel
                UserName = 'Label25'
                AutoSize = False
                Caption = 'Dez'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 261409
                mmTop = 529
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object ppLabel26: TppLabel
                UserName = 'Label26'
                AutoSize = False
                Caption = 'Set'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 211667
                mmTop = 529
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object ppLabel31: TppLabel
                UserName = 'Label31'
                AutoSize = False
                Caption = 'Ago'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 194998
                mmTop = 529
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object ppLabel32: TppLabel
                UserName = 'Label32'
                AutoSize = False
                Caption = 'Jul'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 178330
                mmTop = 529
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand2: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 10054
              mmPrintPosition = 0
              object ppLabel3: TppLabel
                UserName = 'Label3'
                AutoSize = False
                Caption = 'TOTAL'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 8467
                mmTop = 265
                mmWidth = 66940
                BandType = 5
                GroupNo = 0
              end
              object ppLine21: TppLine
                UserName = 'Line21'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 76729
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc2: TppDBCalc
                UserName = 'DBCalc1'
                DataField = 'VAL_01'
                DataPipeline = ppRelSalContrib2
                DisplayFormat = '#,###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ResetGroup = rpRelSalContribSubRep2Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppRelSalContrib2'
                mmHeight = 2910
                mmLeft = 78317
                mmTop = 529
                mmWidth = 13229
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc3: TppDBCalc
                UserName = 'DBCalc3'
                DataField = 'VAL_02'
                DataPipeline = ppRelSalContrib2
                DisplayFormat = '#,###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ResetGroup = rpRelSalContribSubRep2Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppRelSalContrib2'
                mmHeight = 2910
                mmLeft = 94986
                mmTop = 529
                mmWidth = 13229
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc4: TppDBCalc
                UserName = 'DBCalc4'
                DataField = 'VAL_03'
                DataPipeline = ppRelSalContrib2
                DisplayFormat = '#,###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ResetGroup = rpRelSalContribSubRep2Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppRelSalContrib2'
                mmHeight = 2910
                mmLeft = 111654
                mmTop = 529
                mmWidth = 13229
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc5: TppDBCalc
                UserName = 'DBCalc5'
                DataField = 'VAL_04'
                DataPipeline = ppRelSalContrib2
                DisplayFormat = '#,###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ResetGroup = rpRelSalContribSubRep2Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppRelSalContrib2'
                mmHeight = 2910
                mmLeft = 128323
                mmTop = 529
                mmWidth = 13229
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc6: TppDBCalc
                UserName = 'DBCalc6'
                DataField = 'VAL_05'
                DataPipeline = ppRelSalContrib2
                DisplayFormat = '#,###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ResetGroup = rpRelSalContribSubRep2Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppRelSalContrib2'
                mmHeight = 2910
                mmLeft = 144992
                mmTop = 529
                mmWidth = 13229
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc7: TppDBCalc
                UserName = 'DBCalc7'
                DataField = 'VAL_06'
                DataPipeline = ppRelSalContrib2
                DisplayFormat = '#,###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ResetGroup = rpRelSalContribSubRep2Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppRelSalContrib2'
                mmHeight = 2910
                mmLeft = 161661
                mmTop = 529
                mmWidth = 13229
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc8: TppDBCalc
                UserName = 'DBCalc8'
                DataField = 'VAL_07'
                DataPipeline = ppRelSalContrib2
                DisplayFormat = '#,###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ResetGroup = rpRelSalContribSubRep2Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppRelSalContrib2'
                mmHeight = 2910
                mmLeft = 178330
                mmTop = 529
                mmWidth = 13229
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc9: TppDBCalc
                UserName = 'DBCalc9'
                DataField = 'VAL_08'
                DataPipeline = ppRelSalContrib2
                DisplayFormat = '#,###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ResetGroup = rpRelSalContribSubRep2Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppRelSalContrib2'
                mmHeight = 2910
                mmLeft = 194998
                mmTop = 529
                mmWidth = 13229
                BandType = 5
                GroupNo = 0
              end
              object ppLine7: TppLine
                UserName = 'Line7'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 93134
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object ppLine17: TppLine
                UserName = 'Line17'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 109802
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object ppLine20: TppLine
                UserName = 'Line20'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 126471
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object ppLine24: TppLine
                UserName = 'Line24'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 143140
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object ppLine27: TppLine
                UserName = 'Line27'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 159809
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object ppLine30: TppLine
                UserName = 'Line30'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 176477
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object ppLine33: TppLine
                UserName = 'Line33'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 193146
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object ppLine36: TppLine
                UserName = 'Line36'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 209815
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object ppLine39: TppLine
                UserName = 'Line39'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 226484
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc11: TppDBCalc
                UserName = 'DBCalc101'
                DataField = 'VAL_10'
                DataPipeline = ppRelSalContrib2
                DisplayFormat = '#,###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ResetGroup = rpRelSalContribSubRep2Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppRelSalContrib2'
                mmHeight = 2910
                mmLeft = 228336
                mmTop = 529
                mmWidth = 13229
                BandType = 5
                GroupNo = 0
              end
              object ppLine42: TppLine
                UserName = 'Line42'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 243153
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc12: TppDBCalc
                UserName = 'DBCalc12'
                DataField = 'VAL_11'
                DataPipeline = ppRelSalContrib2
                DisplayFormat = '#,###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ResetGroup = rpRelSalContribSubRep2Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppRelSalContrib2'
                mmHeight = 2910
                mmLeft = 245005
                mmTop = 529
                mmWidth = 13229
                BandType = 5
                GroupNo = 0
              end
              object ppLine45: TppLine
                UserName = 'Line45'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 259557
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc13: TppDBCalc
                UserName = 'DBCalc13'
                DataField = 'VAL_12'
                DataPipeline = ppRelSalContrib2
                DisplayFormat = '#,###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ResetGroup = rpRelSalContribSubRep2Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppRelSalContrib2'
                mmHeight = 2910
                mmLeft = 261409
                mmTop = 529
                mmWidth = 13229
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc10: TppDBCalc
                UserName = 'DBCalc10'
                DataField = 'VAL_09'
                DataPipeline = ppRelSalContrib2
                DisplayFormat = '#,###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ResetGroup = rpRelSalContribSubRep2Grp1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppRelSalContrib2'
                mmHeight = 2910
                mmLeft = 211667
                mmTop = 529
                mmWidth = 13229
                BandType = 5
                GroupNo = 0
              end
              object ppLine8: TppLine
                UserName = 'Line8'
                Position = lpBottom
                Weight = 0.75
                mmHeight = 1323
                mmLeft = 7144
                mmTop = 2910
                mmWidth = 269082
                BandType = 5
                GroupNo = 0
              end
              object ppLine47: TppLine
                UserName = 'Line47'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 7144
                mmTop = 0
                mmWidth = 1588
                BandType = 5
                GroupNo = 0
              end
              object ppLine48: TppLine
                UserName = 'Line48'
                Position = lpRight
                Weight = 0.75
                mmHeight = 4233
                mmLeft = 274903
                mmTop = 0
                mmWidth = 1323
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
      object rpRelSalContribSubRep3: TppSubReport
        UserName = 'rpRelSalContribSubRep3'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        PrintBehavior = pbSection
        ResetPageNo = False
        TraverseAllData = False
        Visible = False
        DataPipelineName = 'ppRelSalContrib3'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 7144
        mmWidth = 283770
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppRelSalContrib3
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relação dos Salários de Contribuição'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6615
          PrinterSetup.mmMarginLeft = 6615
          PrinterSetup.mmMarginRight = 6615
          PrinterSetup.mmMarginTop = 6615
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 264
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppRelSalContrib3'
          object rpRelSalContribSubRep3HdrBnd: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 166159
            mmPrintPosition = 0
            object rpRelSalContribSubRep3Shape3: TppShape
              UserName = 'Shape1'
              mmHeight = 72761
              mmLeft = 14817
              mmTop = 34396
              mmWidth = 172773
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl46: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl46'
              AutoSize = False
              Caption = '______ NÃO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 169598
              mmTop = 75936
              mmWidth = 17198
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl47: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl47'
              AutoSize = False
              Caption = '______ NÃO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 169598
              mmTop = 94456
              mmWidth = 17198
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl35: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl35'
              AutoSize = False
              Caption = '______ SIM. Nº B/'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 115359
              mmTop = 94456
              mmWidth = 25135
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl33: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl33'
              AutoSize = False
              Caption = '______ SIM. V. DECLARAÇÃO ANEXA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 115359
              mmTop = 75936
              mmWidth = 50271
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl10: TppLabel
              UserName = 'Label401'
              AutoSize = False
              Caption = '____ MASC.       ____ FEM'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 146844
              mmTop = 47890
              mmWidth = 39952
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt5: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt5'
              DataField = 'MASCULINO'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 147638
              mmTop = 47625
              mmWidth = 4763
              BandType = 4
            end
            object rpRelSalContribSubRep3Img1: TppImage
              UserName = 'rpRelSalContribSubRep1Image1'
              MaintainAspectRatio = False
              Stretch = True
              Picture.Data = {
                07544269746D617036420000424D364200000000000036000000280000005800
                000040000000010018000000000000420000120B0000120B0000000000000000
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
              mmHeight = 7673
              mmLeft = 22225
              mmTop = 10583
              mmWidth = 14817
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl1: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl1'
              AutoSize = False
              Caption = 'PREVIDÊNCIA SOCIAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2117
              mmLeft = 9525
              mmTop = 20373
              mmWidth = 40481
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl2: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl2'
              AutoSize = False
              Caption = 'INSTITUTO NACIONAL DO SEGURO SOCIAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2117
              mmLeft = 9525
              mmTop = 23548
              mmWidth = 40481
              BandType = 4
            end
            object rpRelSalContribSubRep3Line1: TppLine
              UserName = 'rpRelSalContribSubRep3Line1'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 14817
              mmTop = 43127
              mmWidth = 172773
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl5: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl5'
              AutoSize = False
              Caption = 'NOME'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 15610
              mmTop = 34925
              mmWidth = 129911
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt1: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt1'
              DataField = 'EMPREGADO'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 15610
              mmTop = 39158
              mmWidth = 129911
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl3: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl3'
              AutoSize = False
              Caption = 'REQUERIMENTO DE BENEFÍCIO POR INCAPACIDADE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 9525
              mmTop = 29633
              mmWidth = 72496
              BandType = 4
            end
            object rpRelSalContribSubRep3Shape1: TppShape
              UserName = 'Shape2'
              mmHeight = 4233
              mmLeft = 9525
              mmTop = 34396
              mmWidth = 5556
              BandType = 4
            end
            object rpRelSalContribSubRep3Shape2: TppShape
              UserName = 'rpRelSalContribSubRep3Shape2'
              mmHeight = 68792
              mmLeft = 9525
              mmTop = 38365
              mmWidth = 5556
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl4: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl4'
              AutoSize = False
              Caption = '1'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 10319
              mmTop = 34660
              mmWidth = 3969
              BandType = 4
            end
            object rpRelSalContribSubRep3Line2: TppLine
              UserName = 'Line103'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 14817
              mmTop = 51858
              mmWidth = 172773
              BandType = 4
            end
            object rpRelSalContribSubRep3Line5: TppLine
              UserName = 'Line104'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 14817
              mmTop = 60590
              mmWidth = 172773
              BandType = 4
            end
            object rpRelSalContribSubRep3Line4: TppLine
              UserName = 'rpRelSalContribSubRep3Line4'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 25929
              mmLeft = 146050
              mmTop = 34660
              mmWidth = 1323
              BandType = 4
            end
            object rpRelSalContribSubRep3Line6: TppLine
              UserName = 'rpRelSalContribSubRep3Line6'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 54769
              mmLeft = 41540
              mmTop = 52123
              mmWidth = 1323
              BandType = 4
            end
            object rpRelSalContribSubRep3Line8: TppLine
              UserName = 'rpRelSalContribSubRep3Line8'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 54769
              mmLeft = 114565
              mmTop = 52123
              mmWidth = 1323
              BandType = 4
            end
            object rpRelSalContribSubRep3Line3: TppLine
              UserName = 'rpRelSalContribSubRep3Line3'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 8467
              mmLeft = 128323
              mmTop = 43392
              mmWidth = 1323
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl6: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl6'
              AutoSize = False
              Caption = 'DATA DE NASCIMENTO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 146844
              mmTop = 34925
              mmWidth = 39952
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl7: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl7'
              AutoSize = False
              Caption = 'RESIDÊNCIA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 15610
              mmTop = 43656
              mmWidth = 112184
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl8: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl8'
              AutoSize = False
              Caption = 'CEP'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 129117
              mmTop = 43656
              mmWidth = 16404
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl9: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl9'
              AutoSize = False
              Caption = 'SEXO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 146844
              mmTop = 43656
              mmWidth = 39952
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl11: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl11'
              AutoSize = False
              Caption = 'NACIONALIDADE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 15610
              mmTop = 52388
              mmWidth = 25400
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl12: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl12'
              AutoSize = False
              Caption = 'DOC. INSCRIÇÃO - Nº SÉRIE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 42333
              mmTop = 52388
              mmWidth = 36513
              BandType = 4
            end
            object rpRelSalContribSubRep3Line7: TppLine
              UserName = 'rpRelSalContribSubRep3Line7'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 8467
              mmLeft = 79375
              mmTop = 52123
              mmWidth = 1323
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl13: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl13'
              AutoSize = False
              Caption = 'Nº PIS/PASEP'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 80169
              mmTop = 52388
              mmWidth = 33867
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl14: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl14'
              AutoSize = False
              Caption = 'CPF'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 115359
              mmTop = 52388
              mmWidth = 30163
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl15: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl15'
              AutoSize = False
              Caption = 'Nº DEPENDENTES P/ I. RENDA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 146844
              mmTop = 52388
              mmWidth = 39952
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt2: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt2'
              DataField = 'DATANASC'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 146844
              mmTop = 39158
              mmWidth = 39952
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt3: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt3'
              DataField = 'ENDERECO'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 15610
              mmTop = 47890
              mmWidth = 112184
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt4: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt4'
              DataField = 'CEP'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 129117
              mmTop = 47890
              mmWidth = 16404
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt7: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt7'
              DataField = 'NACIONALIDADE'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 15610
              mmTop = 56621
              mmWidth = 25400
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt8: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt8'
              DataField = 'INCRICAO'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 42333
              mmTop = 56621
              mmWidth = 36513
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt9: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt9'
              DataField = 'PIS'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 80169
              mmTop = 56621
              mmWidth = 33867
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt10: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt10'
              DataField = 'CPF'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 115359
              mmTop = 56621
              mmWidth = 30163
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt11: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt11'
              DataField = 'NUMDEPIRRF'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 146844
              mmTop = 56621
              mmWidth = 39952
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl16: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl16'
              AutoSize = False
              Caption = 'ESTADO CIVIL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 15610
              mmTop = 61119
              mmWidth = 25400
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl21: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl21'
              AutoSize = False
              Caption = 'SITUAÇÃO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 42333
              mmTop = 61119
              mmWidth = 71702
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl17: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl17'
              AutoSize = False
              Caption = '______ SOLTEIRO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 15610
              mmTop = 69321
              mmWidth = 25400
              BandType = 4
            end
            object rpRelSalContribSubRep3Mem1: TppMemo
              UserName = 'rpRelSalContribSubRep3Mem1'
              Caption = 
                'TEM OUTRA ATIVIDADE COM VINCULAÇÃO À PREVIDÊNCIA SOCIAL URBANA?'#13 +
                #10
              CharWrap = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Lines.Strings = (
                'TEM OUTRA ATIVIDADE COM VINCULAÇÃO À PREVIDÊNCIA SOCIAL URBANA?')
              Transparent = True
              mmHeight = 8996
              mmLeft = 115359
              mmTop = 61119
              mmWidth = 71438
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object rpRelSalContribSubRep3Lbl18: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl18'
              AutoSize = False
              Caption = '______ CASADO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 15610
              mmTop = 75671
              mmWidth = 25400
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl19: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl19'
              AutoSize = False
              Caption = '______ VIÚVO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 15610
              mmTop = 82021
              mmWidth = 25400
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl20: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl20'
              AutoSize = False
              Caption = '______ DESQ./DIV.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 15610
              mmTop = 88371
              mmWidth = 25400
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt12: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt12'
              DataField = 'SOLTEIRO'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 17198
              mmTop = 69056
              mmWidth = 6615
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt13: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt13'
              DataField = 'CASADO'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 17198
              mmTop = 75406
              mmWidth = 6615
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt14: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt14'
              DataField = 'VIUVO'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 17198
              mmTop = 81756
              mmWidth = 6615
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt15: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt15'
              DataField = 'DESQUITADO_DIVORCIADO'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 17198
              mmTop = 88106
              mmWidth = 6615
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl22: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl22'
              AutoSize = False
              Caption = '_____ EMPREGADO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 42333
              mmTop = 66146
              mmWidth = 36777
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl23: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl23'
              AutoSize = False
              Caption = '_____ TRAB. AVULSO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 42333
              mmTop = 72231
              mmWidth = 36777
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl24: TppLabel
              UserName = 'Label502'
              AutoSize = False
              Caption = '_____ EMPRESÁRIO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 42333
              mmTop = 78317
              mmWidth = 36777
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl25: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl25'
              AutoSize = False
              Caption = '_____ EMPR. DOMÉSTICO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 42333
              mmTop = 84667
              mmWidth = 36777
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt16: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt16'
              DataField = 'SIT_EMPREGADO'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 43127
              mmTop = 65881
              mmWidth = 6615
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt17: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt17'
              DataField = 'SIT_EMPRESARIO'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 43127
              mmTop = 78052
              mmWidth = 6615
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl26: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl26'
              AutoSize = False
              Caption = '_____ FACULTATIVO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 42333
              mmTop = 90752
              mmWidth = 36777
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl27: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl27'
              AutoSize = False
              Caption = '_____ EQUIPARADO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 42333
              mmTop = 96838
              mmWidth = 36777
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl28: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl28'
              AutoSize = False
              Caption = '            A AUTÔNOMO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 42333
              mmTop = 102394
              mmWidth = 36777
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl29: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl29'
              AutoSize = False
              Caption = '_____ SEG. ESPECIAL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 79904
              mmTop = 66146
              mmWidth = 34131
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl30: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl30'
              AutoSize = False
              Caption = '_____ AUTÔNOMO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 79904
              mmTop = 72231
              mmWidth = 34131
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl31: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl31'
              AutoSize = False
              Caption = '_____ OPTANTE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 79904
              mmTop = 78317
              mmWidth = 34131
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl32: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl32'
              AutoSize = False
              Caption = '            LEI Nº 6.184/74'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 79904
              mmTop = 83873
              mmWidth = 34131
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt18: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt18'
              DataField = 'SIT_AUTONOMO'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 80698
              mmTop = 71967
              mmWidth = 6615
              BandType = 4
            end
            object rpRelSalContribSubRep3Shape4: TppShape
              UserName = 'rpRelSalContribSubRep3Shape4'
              mmHeight = 30427
              mmLeft = 149490
              mmTop = 106892
              mmWidth = 38100
              BandType = 4
            end
            object rpRelSalContribSubRep3Line9: TppLine
              UserName = 'rpRelSalContribSubRep3Line9'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 149754
              mmTop = 116946
              mmWidth = 37571
              BandType = 4
            end
            object rpRelSalContribSubRep3Line10: TppLine
              UserName = 'rpRelSalContribSubRep3Line10'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 149754
              mmTop = 128059
              mmWidth = 37571
              BandType = 4
            end
            object rpRelSalContribSubRep3Line13: TppLine
              UserName = 'rpRelSalContribSubRep3Line13'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 33338
              mmTop = 126736
              mmWidth = 91811
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl36: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl36'
              AutoSize = False
              Caption = 'ASSINATURA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 33338
              mmTop = 128059
              mmWidth = 91811
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl37: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl37'
              AutoSize = False
              Caption = 'USO DO INSS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 150284
              mmTop = 112977
              mmWidth = 36513
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl38: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl38'
              AutoSize = False
              Caption = 'ÓRGÃO PAGADOR'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 150284
              mmTop = 117475
              mmWidth = 36513
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl39: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl39'
              AutoSize = False
              Caption = 'ÓRGÃO MANTENEDOR'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 150284
              mmTop = 128588
              mmWidth = 36513
              BandType = 4
            end
            object rpRelSalContribSubRep3Shape5: TppShape
              UserName = 'rpRelSalContribSubRep3Shape5'
              mmHeight = 18785
              mmLeft = 14817
              mmTop = 137054
              mmWidth = 172773
              BandType = 4
            end
            object rpRelSalContribSubRep3Line11: TppLine
              UserName = 'rpRelSalContribSubRep3Line11'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 14817
              mmTop = 146315
              mmWidth = 172773
              BandType = 4
            end
            object rpRelSalContribSubRep3Shape6: TppShape
              UserName = 'rpRelSalContribSubRep3Shape6'
              mmHeight = 18785
              mmLeft = 149490
              mmTop = 137054
              mmWidth = 6879
              BandType = 4
            end
            object rpRelSalContribSubRep3Line12: TppLine
              UserName = 'rpRelSalContribSubRep3Line12'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 9260
              mmLeft = 115094
              mmTop = 146315
              mmWidth = 1323
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl40: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl40'
              AutoSize = False
              Caption = 'NOME DO PROCURADOR OU CURADOR'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 15610
              mmTop = 137584
              mmWidth = 133350
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl42: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl42'
              AutoSize = False
              Caption = 'ENDEREÇO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 15610
              mmTop = 146844
              mmWidth = 98954
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl43: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl43'
              AutoSize = False
              Caption = 'CEP'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 115888
              mmTop = 146844
              mmWidth = 33073
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl41: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl41'
              AutoSize = False
              Caption = 'DATA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 156898
              mmTop = 137584
              mmWidth = 29898
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl44: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl44'
              AutoSize = False
              Caption = 'RUBRICA E Nº MATRIC.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 156898
              mmTop = 146844
              mmWidth = 29898
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt6: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt6'
              DataField = 'FEMININO'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 169863
              mmTop = 47625
              mmWidth = 4763
              BandType = 4
            end
            object rpRelSalContribSubRep3Shape7: TppShape
              UserName = 'rpRelSalContribSubRep3Shape7'
              mmHeight = 3704
              mmLeft = 9525
              mmTop = 160338
              mmWidth = 178065
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl45: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl45'
              AutoSize = False
              Caption = 'DSS-8022'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2646
              mmLeft = 10319
              mmTop = 160867
              mmWidth = 14288
              BandType = 4
            end
            object rpRelSalContribSubRep3Img2: TppImage
              UserName = 'Image1'
              MaintainAspectRatio = False
              Picture.Data = {
                07544269746D61704A010000424D4A010000000000003E000000280000001000
                00004300000001000100000000000C010000C40E0000C40E0000020000000000
                000000000000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000F1DF0000EEEF
                0000EEEF0000EEEF0000F71F0000FFFF0000FFFF0000E00F0000EEEF0000EEEF
                0000EEEF0000EFEF0000FFFF0000FFFF0000F01F0000EFEF0000EFEF0000EEEF
                0000EEDF0000F60F0000FFFF0000FFFF0000E01F0000FFEF0000FFEF0000FFEF
                0000FFEF0000E01F0000FFFF0000FFFF0000E00F0000EEFF0000EEFF0000EEFF
                0000EEFF0000F10F0000FFFF0000FFCF0000FE3F0000F9BF0000E7BF0000F9BF
                0000FE3F0000FFCF0000FFFF0000E00F0000EFEF0000EFEF0000EFEF0000F7DF
                0000F83F0000FFFF0000FFFF0000F01F0000EFEF0000EFEF0000EFEF0000EFEF
                0000F01F0000FFFF0000FFFF0000FFFF0000FFFF0000}
              mmHeight = 66940
              mmLeft = 10319
              mmTop = 39158
              mmWidth = 3969
              BandType = 4
            end
            object rpRelSalContribSubRep3Img3: TppImage
              UserName = 'Image2'
              MaintainAspectRatio = False
              Picture.Data = {
                07544269746D61700A0F0000424D0A0F00000000000036000000280000001100
                0000490000000100180000000000D40E0000C40E0000C40E0000000000000000
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF000000000000000000000000000000000000000000000000000000FFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
                FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000
                0000000000000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
                FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFF
                000000000000000000000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
                0000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
                000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000
                00000000000000000000000000000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
                0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
                0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000FFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000
                00FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF000000000000000000000000000000000000000000000000000000
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
              mmHeight = 17992
              mmLeft = 150813
              mmTop = 137319
              mmWidth = 3969
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt23: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt23'
              DataField = 'LOCAL_DATA'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3969
              mmLeft = 33338
              mmTop = 112184
              mmWidth = 91811
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt19: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt19'
              DataField = 'POSSUI_VINC'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 115359
              mmTop = 75671
              mmWidth = 9525
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt20: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt20'
              DataField = 'NAO_POSSUI_VINC'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 169598
              mmTop = 75671
              mmWidth = 9525
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt21: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt21'
              DataField = 'POSSUI_BENEF'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 115359
              mmTop = 94192
              mmWidth = 9525
              BandType = 4
            end
            object rpRelSalContribSubRep3DBTxt22: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt22'
              DataField = 'NAO_POSSUI_BENEF'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3440
              mmLeft = 169598
              mmTop = 94192
              mmWidth = 9525
              BandType = 4
            end
            object rpRelSalContribSubRep3Lbl34: TppLabel
              UserName = 'Label601'
              AutoSize = False
              Caption = 'ESTÁ EM GOZO DE BENEFÍCIO?'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 115359
              mmTop = 86784
              mmWidth = 43127
              BandType = 4
            end
          end
        end
      end
      object rpRelSalContribSubRep4: TppSubReport
        UserName = 'rpRelSalContribSubRep4'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        PrintBehavior = pbSection
        ResetPageNo = False
        TraverseAllData = False
        DataPipelineName = 'ppRelSalContrib'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 10583
        mmWidth = 283770
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = ppRelSalContrib
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relação dos Salários de Contribuição'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6615
          PrinterSetup.mmMarginLeft = 6615
          PrinterSetup.mmMarginRight = 6615
          PrinterSetup.mmMarginTop = 6615
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 264
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppRelSalContrib'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 166159
            mmPrintPosition = 0
            object rpRelSalContribSubRep4Shape11: TppShape
              UserName = 'rpRelSalContribSubRep4Shape11'
              mmHeight = 5292
              mmLeft = 10054
              mmTop = 81492
              mmWidth = 178065
              BandType = 1
            end
            object rpRelSalContribSubRep4Shape5: TppShape
              UserName = 'rpRelSalContribSubRep4Shape5'
              mmHeight = 5292
              mmLeft = 10054
              mmTop = 51329
              mmWidth = 178065
              BandType = 1
            end
            object rpRelSalContribSubRep4Shape6: TppShape
              UserName = 'rpRelSalContribSubRep4Shape6'
              mmHeight = 5292
              mmLeft = 10054
              mmTop = 56356
              mmWidth = 178065
              BandType = 1
            end
            object rpRelSalContribSubRep4Shape7: TppShape
              UserName = 'rpRelSalContribSubRep4Shape7'
              mmHeight = 5292
              mmLeft = 10054
              mmTop = 61383
              mmWidth = 178065
              BandType = 1
            end
            object rpRelSalContribSubRep4Shape8: TppShape
              UserName = 'rpRelSalContribSubRep4Shape8'
              mmHeight = 5292
              mmLeft = 10054
              mmTop = 66411
              mmWidth = 178065
              BandType = 1
            end
            object rpRelSalContribSubRep4Shape9: TppShape
              UserName = 'rpRelSalContribSubRep4Shape9'
              mmHeight = 5292
              mmLeft = 10054
              mmTop = 71438
              mmWidth = 178065
              BandType = 1
            end
            object rpRelSalContribSubRep4Shape10: TppShape
              UserName = 'rpRelSalContribSubRep4Shape10'
              mmHeight = 5292
              mmLeft = 10054
              mmTop = 76465
              mmWidth = 178065
              BandType = 1
            end
            object rpRelSalContribSubRep4Shape3: TppShape
              UserName = 'rpRelSalContribSubRep3Shape2'
              mmHeight = 33602
              mmLeft = 10054
              mmTop = 12965
              mmWidth = 5556
              BandType = 1
            end
            object rpRelSalContribSubRep4Shape1: TppShape
              UserName = 'Shape1'
              mmHeight = 37571
              mmLeft = 15346
              mmTop = 8996
              mmWidth = 172773
              BandType = 1
            end
            object rpRelSalContribSubRep4Shape4: TppShape
              UserName = 'rpRelSalContribSubRep4Shape4'
              mmHeight = 5292
              mmLeft = 10054
              mmTop = 46302
              mmWidth = 178065
              BandType = 1
            end
            object rpRelSalContribSubRep4Line1: TppLine
              UserName = 'rpRelSalContribSubRep3Line1'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 15346
              mmTop = 17727
              mmWidth = 172773
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl3: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl5'
              AutoSize = False
              Caption = 'EMPREGADOR'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 16140
              mmTop = 9525
              mmWidth = 129911
              BandType = 1
            end
            object rpRelSalContribSubRep4DBTxt1: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt1'
              DataField = 'EMPRESA'
              DataPipeline = ppRelSalContrib
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRelSalContrib'
              mmHeight = 3440
              mmLeft = 16140
              mmTop = 13758
              mmWidth = 129911
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl1: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl3'
              AutoSize = False
              Caption = 'ATESTADO DE AFASTAMENTO DO TRABALHO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 10054
              mmTop = 3175
              mmWidth = 177800
              BandType = 1
            end
            object rpRelSalContribSubRep4Shape2: TppShape
              UserName = 'Shape2'
              mmHeight = 4233
              mmLeft = 10054
              mmTop = 8996
              mmWidth = 5556
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl2: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl4'
              AutoSize = False
              Caption = '3'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 10848
              mmTop = 9260
              mmWidth = 3969
              BandType = 1
            end
            object rpRelSalContribSubRep4Line2: TppLine
              UserName = 'rpRelSalContribSubRep4Line2'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 15346
              mmTop = 26458
              mmWidth = 172773
              BandType = 1
            end
            object rpRelSalContribSubRep4Line5: TppLine
              UserName = 'rpRelSalContribSubRep4Line5'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 10054
              mmTop = 41275
              mmWidth = 177800
              BandType = 1
            end
            object rpRelSalContribSubRep4Line3: TppLine
              UserName = 'rpRelSalContribSubRep4Line3'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 17198
              mmLeft = 146579
              mmTop = 9260
              mmWidth = 1323
              BandType = 1
            end
            object rpRelSalContribSubRep4Line4: TppLine
              UserName = 'rpRelSalContribSubRep4Line4'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 14552
              mmLeft = 53711
              mmTop = 26723
              mmWidth = 1323
              BandType = 1
            end
            object ppLine53: TppLine
              UserName = 'rpRelSalContribSubRep3Line8'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 39952
              mmLeft = 61648
              mmTop = 46567
              mmWidth = 794
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl4: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl6'
              AutoSize = False
              Caption = 'Nº CNPJ'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 147373
              mmTop = 9525
              mmWidth = 39952
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl5: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl7'
              AutoSize = False
              Caption = 'ENDEREÇO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 16140
              mmTop = 18256
              mmWidth = 129911
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl6: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl9'
              AutoSize = False
              Caption = 'Nº MATRÍCULA INSS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 147373
              mmTop = 18256
              mmWidth = 39952
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl7: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl11'
              AutoSize = False
              Caption = 'ÚLTIMO DIA DE TRABALHO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 16140
              mmTop = 26988
              mmWidth = 37042
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl9: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl12'
              AutoSize = False
              Caption = 'AFASTAMENTO POR:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 54504
              mmTop = 26988
              mmWidth = 36513
              BandType = 1
            end
            object rpRelSalContribSubRep4DBTxt2: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt2'
              DataField = 'CNPJ'
              DataPipeline = ppRelSalContrib
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRelSalContrib'
              mmHeight = 3440
              mmLeft = 147373
              mmTop = 13758
              mmWidth = 39952
              BandType = 1
            end
            object rpRelSalContribSubRep4DBTxt3: TppDBText
              UserName = 'rpRelSalContribSubRep3DBTxt3'
              DataField = 'ENDERECO'
              DataPipeline = ppRelSalContrib
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRelSalContrib'
              mmHeight = 3440
              mmLeft = 16140
              mmTop = 22490
              mmWidth = 129911
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl8: TppLabel
              UserName = 'rpRelSalContribSubRep3Lbl16'
              AutoSize = False
              Caption = 'DO SEGURADO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 16140
              mmTop = 30956
              mmWidth = 37042
              BandType = 1
            end
            object rpRelSalContribSubRep4Img1: TppImage
              UserName = 'Image1'
              MaintainAspectRatio = False
              Picture.Data = {
                07544269746D6170DE100000424DDE1000000000000036000000280000001100
                0000520000000100180000000000A8100000C40E0000C40E0000000000000000
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
                0000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0000
                00FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000
                00FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000
                00FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
                0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
                000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
                0000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0000
                00FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000
                00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF
                FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
                0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0000
                00FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000
                00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                000000000000FFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
                0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
                FFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0000
                00FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000
                00FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                00FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF000000000000000000000000000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0000
                00FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000
                00FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF0000000000000000000000000000
                00FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
                0000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFF000000000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
                00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
                00FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
                000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
                00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000
                000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0000
                00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000
                00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
                000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
                FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0000
                00FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFF
                FF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF00}
              mmHeight = 26723
              mmLeft = 10848
              mmTop = 13758
              mmWidth = 3969
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl11: TppLabel
              UserName = 'rpRelSalContribSubRep4Lbl11'
              AutoSize = False
              Caption = 'DEPENDENTES PARA SALÁRIO FAMÍLIA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 16140
              mmTop = 42069
              mmWidth = 171186
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl13: TppLabel
              UserName = 'rpRelSalContribSubRep4Lbl13'
              AutoSize = False
              Caption = 'DATA DE NASCIMENTO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 62706
              mmTop = 47096
              mmWidth = 35454
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl12: TppLabel
              UserName = 'rpRelSalContribSubRep4Lbl12'
              AutoSize = False
              Caption = 'PRENOME DOS FILHOS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 11113
              mmTop = 47096
              mmWidth = 49742
              BandType = 1
            end
            object rpRelSalContribSubRep4DBTxt5: TppDBText
              UserName = 'rpRelSalContribSubRep4DBTxt5'
              DataField = 'MOTIVO'
              DataPipeline = ppRelSalContrib
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'ppRelSalContrib'
              mmHeight = 3440
              mmLeft = 55827
              mmTop = 33867
              mmWidth = 129911
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl10: TppLabel
              UserName = 'rpRelSalContribSubRep4Lbl10'
              AutoSize = False
              Caption = '4'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 10848
              mmTop = 42069
              mmWidth = 3969
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl14: TppLabel
              UserName = 'rpRelSalContribSubRep4Lbl14'
              AutoSize = False
              Caption = 'PRENOME DOS FILHOS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 100013
              mmTop = 47096
              mmWidth = 49477
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl15: TppLabel
              UserName = 'rpRelSalContribSubRep4Lbl15'
              AutoSize = False
              Caption = 'DATA DE NASCIMENTO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 151607
              mmTop = 47096
              mmWidth = 35454
              BandType = 1
            end
            object ppLine57: TppLine
              UserName = 'Line57'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 39952
              mmLeft = 98954
              mmTop = 46567
              mmWidth = 794
              BandType = 1
            end
            object ppLine60: TppLine
              UserName = 'Line60'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 39952
              mmLeft = 150548
              mmTop = 46567
              mmWidth = 794
              BandType = 1
            end
            object rpRelSalContribSubRep4LblPreNome1: TppLabel
              UserName = 'rpRelSalContribSubRep4LblPreNome1'
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 11113
              mmTop = 52123
              mmWidth = 49742
              BandType = 1
            end
            object rpRelSalContribSubRep4LblPreNome2: TppLabel
              UserName = 'rpRelSalContribSubRep4LblPreNome2'
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 11113
              mmTop = 57150
              mmWidth = 49742
              BandType = 1
            end
            object rpRelSalContribSubRep4LblPreNome3: TppLabel
              UserName = 'rpRelSalContribSubRep4LblPreNome3'
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 11113
              mmTop = 62177
              mmWidth = 49742
              BandType = 1
            end
            object rpRelSalContribSubRep4LblPreNome4: TppLabel
              UserName = 'rpRelSalContribSubRep4LblPreNome4'
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 11113
              mmTop = 67204
              mmWidth = 49742
              BandType = 1
            end
            object rpRelSalContribSubRep4LblPreNome5: TppLabel
              UserName = 'rpRelSalContribSubRep4LblPreNome5'
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 11113
              mmTop = 72231
              mmWidth = 49742
              BandType = 1
            end
            object rpRelSalContribSubRep4LblPreNome6: TppLabel
              UserName = 'rpRelSalContribSubRep4LblPreNome6'
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 11113
              mmTop = 77258
              mmWidth = 49742
              BandType = 1
            end
            object rpRelSalContribSubRep4LblDataNasc1: TppLabel
              UserName = 'rpRelSalContribSubRep4LblDataNasc1'
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 62706
              mmTop = 52123
              mmWidth = 35454
              BandType = 1
            end
            object rpRelSalContribSubRep4LblDataNasc2: TppLabel
              UserName = 'rpRelSalContribSubRep4LblDataNasc2'
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 62706
              mmTop = 57150
              mmWidth = 35454
              BandType = 1
            end
            object rpRelSalContribSubRep4LblDataNasc3: TppLabel
              UserName = 'rpRelSalContribSubRep4LblDataNasc3'
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 62706
              mmTop = 62177
              mmWidth = 35454
              BandType = 1
            end
            object rpRelSalContribSubRep4LblDataNasc4: TppLabel
              UserName = 'rpRelSalContribSubRep4LblDataNasc4'
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 62706
              mmTop = 67204
              mmWidth = 35454
              BandType = 1
            end
            object rpRelSalContribSubRep4LblDataNasc5: TppLabel
              UserName = 'rpRelSalContribSubRep4LblDataNasc5'
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 62706
              mmTop = 72231
              mmWidth = 35454
              BandType = 1
            end
            object rpRelSalContribSubRep4LblDataNasc6: TppLabel
              UserName = 'rpRelSalContribSubRep4LblDataNasc6'
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 62706
              mmTop = 77258
              mmWidth = 35454
              BandType = 1
            end
            object rpRelSalContribSubRep4LblPreNome7: TppLabel
              UserName = 'rpRelSalContribSubRep4LblPreNome7'
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 11113
              mmTop = 82286
              mmWidth = 49742
              BandType = 1
            end
            object rpRelSalContribSubRep4LblDataNasc7: TppLabel
              UserName = 'rpRelSalContribSubRep4LblDataNasc7'
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 62706
              mmTop = 82286
              mmWidth = 35454
              BandType = 1
            end
            object rpRelSalContribSubRep4Line6: TppLine
              UserName = 'rpRelSalContribSubRep4Line6'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 87842
              mmTop = 112713
              mmWidth = 100277
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl16: TppLabel
              UserName = 'rpRelSalContribSubRep4Lbl16'
              AutoSize = False
              Caption = 'ASSINATURA DO RESPONSÁVEL E CARIMBO DO CNPJ DA EMPRESA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 87842
              mmTop = 114036
              mmWidth = 100277
              BandType = 1
            end
            object rpRelSalContribSubRep4Line8: TppLine
              UserName = 'rpRelSalContribSubRep3Line11'
              Position = lpBottom
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 10054
              mmTop = 155575
              mmWidth = 178065
              BandType = 1
            end
            object rpRelSalContribSubRep4Shape12: TppShape
              UserName = 'rpRelSalContribSubRep3Shape7'
              mmHeight = 3704
              mmLeft = 10054
              mmTop = 159544
              mmWidth = 178065
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl18: TppLabel
              UserName = 'rpRelSalContribSubRep4Lbl18'
              AutoSize = False
              Caption = 'DSS-8022v'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2646
              mmLeft = 10848
              mmTop = 160073
              mmWidth = 14288
              BandType = 1
            end
            object rpRelSalContribSubRep4DBTxt6: TppDBText
              UserName = 'rpRelSalContribSubRep4DBTxt6'
              DataField = 'LOCAL_DATA'
              DataPipeline = ppRelSalContrib3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRelSalContrib3'
              mmHeight = 3175
              mmLeft = 10054
              mmTop = 115359
              mmWidth = 72496
              BandType = 1
            end
            object rpRelSalContribSubRep4Memo1: TppMemo
              UserName = 'rpRelSalContribSubRep4Memo1'
              Caption = 
                '1 - O requerimento deve ser sem rasuras e preenchido de preferên' +
                'cia à máquina.'#13#10'2 - No caso de segurado empregado, a empresa é r' +
                'esponsável pelo preenchimento dos campos 3 e 4.'#13#10'3 - Quando se t' +
                'ratar de autônomo, facultativo, empregado doméstico ou segurado ' +
                'desempregado não serão preenchidos os campos 3 e 4.'#13#10'4 - No mês ' +
                'do afastamento do trabalho a empresaefetuará o pagamento integra' +
                'l do Salário-Família, e o INSS fará o mesmo no mês de cessação d' +
                'o benefício, evitando-se, assim, cálculo de valores fracionários' +
                '.'#13#10
              CharWrap = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Lines.Strings = (
                
                  '1 - O requerimento deve ser sem rasuras e preenchido de preferên' +
                  'cia à máquina.'
                
                  '2 - No caso de segurado empregado, a empresa é responsável pelo ' +
                  'preenchimento dos campos 3 e 4.'
                
                  '3 - Quando se tratar de autônomo, facultativo, empregado domésti' +
                  'co ou segurado desempregado não serão preenchidos os campos 3 e ' +
                  '4.'
                
                  '4 - No mês do afastamento do trabalho a empresaefetuará o pagame' +
                  'nto integral do Salário-Família, e o INSS fará o mesmo no mês de' +
                  ' cessação do benefício, evitando-se, assim, cálculo de valores f' +
                  'racionários.')
              TextAlignment = taFullJustified
              Transparent = True
              mmHeight = 19050
              mmLeft = 10054
              mmTop = 134144
              mmWidth = 178065
              BandType = 1
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object rpRelSalContribSubRep4Line7: TppLine
              UserName = 'rpRelSalContribSubRep4Line7'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 10054
              mmTop = 125942
              mmWidth = 178065
              BandType = 1
            end
            object rpRelSalContribSubRep4Lbl17: TppLabel
              UserName = 'rpRelSalContribSubRep4Lbl17'
              AutoSize = False
              Caption = 'INSTRUÇÕES'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 10054
              mmTop = 127265
              mmWidth = 178065
              BandType = 1
            end
            object rpRelSalContribSubRep4LblUltDiaTrab: TppLabel
              UserName = 'rpRelSalContribSubRep4LblUltDiaTrab'
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 16140
              mmTop = 36777
              mmWidth = 37042
              BandType = 1
            end
          end
          object rpRelSalContribSubRep4DtlBnd: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppRelSalContrib: TppBDEPipeline
    DataSource = dsRelSalContrib
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'ppRelSalContrib'
    Left = 364
    Top = 64
    object ppRelSalContribppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField2: TppField
      FieldAlias = 'CNPJ'
      FieldName = 'CNPJ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField3: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField4: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField5: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField6: TppField
      FieldAlias = 'INCRICAO'
      FieldName = 'INCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField7: TppField
      FieldAlias = 'CPF'
      FieldName = 'CPF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField8: TppField
      FieldAlias = 'PIS'
      FieldName = 'PIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField9: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField10: TppField
      FieldAlias = 'DATADESLIGAMENTO'
      FieldName = 'DATADESLIGAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField11: TppField
      FieldAlias = 'MOTIVO'
      FieldName = 'MOTIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField12: TppField
      FieldAlias = 'ANO_1'
      FieldName = 'ANO_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField13: TppField
      FieldAlias = 'VAL_1_1'
      FieldName = 'VAL_1_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField14: TppField
      FieldAlias = 'RECOLHIMENTO_1_1'
      FieldName = 'RECOLHIMENTO_1_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField15: TppField
      FieldAlias = 'VAL_2_1'
      FieldName = 'VAL_2_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField16: TppField
      FieldAlias = 'RECOLHIMENTO_2_1'
      FieldName = 'RECOLHIMENTO_2_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField17: TppField
      FieldAlias = 'VAL_3_1'
      FieldName = 'VAL_3_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField18: TppField
      FieldAlias = 'RECOLHIMENTO_3_1'
      FieldName = 'RECOLHIMENTO_3_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField19: TppField
      FieldAlias = 'VAL_4_1'
      FieldName = 'VAL_4_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField20: TppField
      FieldAlias = 'RECOLHIMENTO_4_1'
      FieldName = 'RECOLHIMENTO_4_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField21: TppField
      FieldAlias = 'VAL_5_1'
      FieldName = 'VAL_5_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField22: TppField
      FieldAlias = 'RECOLHIMENTO_5_1'
      FieldName = 'RECOLHIMENTO_5_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField23: TppField
      FieldAlias = 'VAL_6_1'
      FieldName = 'VAL_6_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField24: TppField
      FieldAlias = 'RECOLHIMENTO_6_1'
      FieldName = 'RECOLHIMENTO_6_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField25: TppField
      FieldAlias = 'VAL_7_1'
      FieldName = 'VAL_7_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField26: TppField
      FieldAlias = 'RECOLHIMENTO_7_1'
      FieldName = 'RECOLHIMENTO_7_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField27: TppField
      FieldAlias = 'VAL_8_1'
      FieldName = 'VAL_8_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField28: TppField
      FieldAlias = 'RECOLHIMENTO_8_1'
      FieldName = 'RECOLHIMENTO_8_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField29: TppField
      FieldAlias = 'VAL_9_1'
      FieldName = 'VAL_9_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField30: TppField
      FieldAlias = 'RECOLHIMENTO_9_1'
      FieldName = 'RECOLHIMENTO_9_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField31: TppField
      FieldAlias = 'VAL_10_1'
      FieldName = 'VAL_10_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField32: TppField
      FieldAlias = 'RECOLHIMENTO_10_1'
      FieldName = 'RECOLHIMENTO_10_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField33: TppField
      FieldAlias = 'VAL_11_1'
      FieldName = 'VAL_11_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField34: TppField
      FieldAlias = 'RECOLHIMENTO_11_1'
      FieldName = 'RECOLHIMENTO_11_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField35: TppField
      FieldAlias = 'VAL_12_1'
      FieldName = 'VAL_12_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField36: TppField
      FieldAlias = 'RECOLHIMENTO_12_1'
      FieldName = 'RECOLHIMENTO_12_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField37: TppField
      FieldAlias = 'TOTAL_ANO_1'
      FieldName = 'TOTAL_ANO_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField38: TppField
      FieldAlias = 'ANO_2'
      FieldName = 'ANO_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField39: TppField
      FieldAlias = 'VAL_1_2'
      FieldName = 'VAL_1_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField40: TppField
      FieldAlias = 'RECOLHIMENTO_1_2'
      FieldName = 'RECOLHIMENTO_1_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField41: TppField
      FieldAlias = 'VAL_2_2'
      FieldName = 'VAL_2_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField42: TppField
      FieldAlias = 'RECOLHIMENTO_2_2'
      FieldName = 'RECOLHIMENTO_2_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField43: TppField
      FieldAlias = 'VAL_3_2'
      FieldName = 'VAL_3_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField44: TppField
      FieldAlias = 'RECOLHIMENTO_3_2'
      FieldName = 'RECOLHIMENTO_3_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField45: TppField
      FieldAlias = 'VAL_4_2'
      FieldName = 'VAL_4_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField46: TppField
      FieldAlias = 'RECOLHIMENTO_4_2'
      FieldName = 'RECOLHIMENTO_4_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField47: TppField
      FieldAlias = 'VAL_5_2'
      FieldName = 'VAL_5_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField48: TppField
      FieldAlias = 'RECOLHIMENTO_5_2'
      FieldName = 'RECOLHIMENTO_5_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField49: TppField
      FieldAlias = 'VAL_6_2'
      FieldName = 'VAL_6_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField50: TppField
      FieldAlias = 'RECOLHIMENTO_6_2'
      FieldName = 'RECOLHIMENTO_6_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField51: TppField
      FieldAlias = 'VAL_7_2'
      FieldName = 'VAL_7_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField52: TppField
      FieldAlias = 'RECOLHIMENTO_7_2'
      FieldName = 'RECOLHIMENTO_7_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField53: TppField
      FieldAlias = 'VAL_8_2'
      FieldName = 'VAL_8_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField54: TppField
      FieldAlias = 'RECOLHIMENTO_8_2'
      FieldName = 'RECOLHIMENTO_8_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField55: TppField
      FieldAlias = 'VAL_9_2'
      FieldName = 'VAL_9_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField56: TppField
      FieldAlias = 'RECOLHIMENTO_9_2'
      FieldName = 'RECOLHIMENTO_9_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField57: TppField
      FieldAlias = 'VAL_10_2'
      FieldName = 'VAL_10_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField58: TppField
      FieldAlias = 'RECOLHIMENTO_10_2'
      FieldName = 'RECOLHIMENTO_10_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField59: TppField
      FieldAlias = 'VAL_11_2'
      FieldName = 'VAL_11_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 58
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField60: TppField
      FieldAlias = 'RECOLHIMENTO_11_2'
      FieldName = 'RECOLHIMENTO_11_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 59
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField61: TppField
      FieldAlias = 'VAL_12_2'
      FieldName = 'VAL_12_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 60
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField62: TppField
      FieldAlias = 'RECOLHIMENTO_12_2'
      FieldName = 'RECOLHIMENTO_12_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 61
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField63: TppField
      FieldAlias = 'TOTAL_ANO_2'
      FieldName = 'TOTAL_ANO_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 62
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField64: TppField
      FieldAlias = 'ANO_3'
      FieldName = 'ANO_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 63
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField65: TppField
      FieldAlias = 'VAL_1_3'
      FieldName = 'VAL_1_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 64
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField66: TppField
      FieldAlias = 'RECOLHIMENTO_1_3'
      FieldName = 'RECOLHIMENTO_1_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 65
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField67: TppField
      FieldAlias = 'VAL_2_3'
      FieldName = 'VAL_2_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 66
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField68: TppField
      FieldAlias = 'RECOLHIMENTO_2_3'
      FieldName = 'RECOLHIMENTO_2_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 67
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField69: TppField
      FieldAlias = 'VAL_3_3'
      FieldName = 'VAL_3_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 68
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField70: TppField
      FieldAlias = 'RECOLHIMENTO_3_3'
      FieldName = 'RECOLHIMENTO_3_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 69
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField71: TppField
      FieldAlias = 'VAL_4_3'
      FieldName = 'VAL_4_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 70
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField72: TppField
      FieldAlias = 'RECOLHIMENTO_4_3'
      FieldName = 'RECOLHIMENTO_4_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 71
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField73: TppField
      FieldAlias = 'VAL_5_3'
      FieldName = 'VAL_5_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 72
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField74: TppField
      FieldAlias = 'RECOLHIMENTO_5_3'
      FieldName = 'RECOLHIMENTO_5_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 73
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField75: TppField
      FieldAlias = 'VAL_6_3'
      FieldName = 'VAL_6_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 74
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField76: TppField
      FieldAlias = 'RECOLHIMENTO_6_3'
      FieldName = 'RECOLHIMENTO_6_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 75
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField77: TppField
      FieldAlias = 'VAL_7_3'
      FieldName = 'VAL_7_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 76
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField78: TppField
      FieldAlias = 'RECOLHIMENTO_7_3'
      FieldName = 'RECOLHIMENTO_7_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 77
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField79: TppField
      FieldAlias = 'VAL_8_3'
      FieldName = 'VAL_8_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 78
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField80: TppField
      FieldAlias = 'RECOLHIMENTO_8_3'
      FieldName = 'RECOLHIMENTO_8_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 79
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField81: TppField
      FieldAlias = 'VAL_9_3'
      FieldName = 'VAL_9_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 80
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField82: TppField
      FieldAlias = 'RECOLHIMENTO_9_3'
      FieldName = 'RECOLHIMENTO_9_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 81
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField83: TppField
      FieldAlias = 'VAL_10_3'
      FieldName = 'VAL_10_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 82
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField84: TppField
      FieldAlias = 'RECOLHIMENTO_10_3'
      FieldName = 'RECOLHIMENTO_10_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 83
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField85: TppField
      FieldAlias = 'VAL_11_3'
      FieldName = 'VAL_11_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 84
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField86: TppField
      FieldAlias = 'RECOLHIMENTO_11_3'
      FieldName = 'RECOLHIMENTO_11_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 85
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField87: TppField
      FieldAlias = 'VAL_12_3'
      FieldName = 'VAL_12_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 86
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField88: TppField
      FieldAlias = 'RECOLHIMENTO_12_3'
      FieldName = 'RECOLHIMENTO_12_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 87
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField89: TppField
      FieldAlias = 'TOTAL_ANO_3'
      FieldName = 'TOTAL_ANO_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 88
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField90: TppField
      FieldAlias = 'ANO_4'
      FieldName = 'ANO_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 89
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField91: TppField
      FieldAlias = 'VAL_1_4'
      FieldName = 'VAL_1_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 90
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField92: TppField
      FieldAlias = 'RECOLHIMENTO_1_4'
      FieldName = 'RECOLHIMENTO_1_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 91
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField93: TppField
      FieldAlias = 'VAL_2_4'
      FieldName = 'VAL_2_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 92
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField94: TppField
      FieldAlias = 'RECOLHIMENTO_2_4'
      FieldName = 'RECOLHIMENTO_2_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 93
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField95: TppField
      FieldAlias = 'VAL_3_4'
      FieldName = 'VAL_3_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 94
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField96: TppField
      FieldAlias = 'RECOLHIMENTO_3_4'
      FieldName = 'RECOLHIMENTO_3_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 95
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField97: TppField
      FieldAlias = 'VAL_4_4'
      FieldName = 'VAL_4_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 96
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField98: TppField
      FieldAlias = 'RECOLHIMENTO_4_4'
      FieldName = 'RECOLHIMENTO_4_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 97
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField99: TppField
      FieldAlias = 'VAL_5_4'
      FieldName = 'VAL_5_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 98
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField100: TppField
      FieldAlias = 'RECOLHIMENTO_5_4'
      FieldName = 'RECOLHIMENTO_5_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 99
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField101: TppField
      FieldAlias = 'VAL_6_4'
      FieldName = 'VAL_6_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 100
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField102: TppField
      FieldAlias = 'RECOLHIMENTO_6_4'
      FieldName = 'RECOLHIMENTO_6_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 101
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField103: TppField
      FieldAlias = 'VAL_7_4'
      FieldName = 'VAL_7_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 102
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField104: TppField
      FieldAlias = 'RECOLHIMENTO_7_4'
      FieldName = 'RECOLHIMENTO_7_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 103
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField105: TppField
      FieldAlias = 'VAL_8_4'
      FieldName = 'VAL_8_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 104
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField106: TppField
      FieldAlias = 'RECOLHIMENTO_8_4'
      FieldName = 'RECOLHIMENTO_8_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 105
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField107: TppField
      FieldAlias = 'VAL_9_4'
      FieldName = 'VAL_9_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 106
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField108: TppField
      FieldAlias = 'RECOLHIMENTO_9_4'
      FieldName = 'RECOLHIMENTO_9_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 107
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField109: TppField
      FieldAlias = 'VAL_10_4'
      FieldName = 'VAL_10_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 108
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField110: TppField
      FieldAlias = 'RECOLHIMENTO_10_4'
      FieldName = 'RECOLHIMENTO_10_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 109
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField111: TppField
      FieldAlias = 'VAL_11_4'
      FieldName = 'VAL_11_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 110
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField112: TppField
      FieldAlias = 'RECOLHIMENTO_11_4'
      FieldName = 'RECOLHIMENTO_11_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 111
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField113: TppField
      FieldAlias = 'VAL_12_4'
      FieldName = 'VAL_12_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 112
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField114: TppField
      FieldAlias = 'RECOLHIMENTO_12_4'
      FieldName = 'RECOLHIMENTO_12_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 113
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField115: TppField
      FieldAlias = 'TOTAL_ANO_4'
      FieldName = 'TOTAL_ANO_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 114
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField116: TppField
      FieldAlias = 'ANO_5'
      FieldName = 'ANO_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 115
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField117: TppField
      FieldAlias = 'VAL_1_5'
      FieldName = 'VAL_1_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 116
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField118: TppField
      FieldAlias = 'RECOLHIMENTO_1_5'
      FieldName = 'RECOLHIMENTO_1_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 117
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField119: TppField
      FieldAlias = 'VAL_2_5'
      FieldName = 'VAL_2_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 118
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField120: TppField
      FieldAlias = 'RECOLHIMENTO_2_5'
      FieldName = 'RECOLHIMENTO_2_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 119
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField121: TppField
      FieldAlias = 'VAL_3_5'
      FieldName = 'VAL_3_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 120
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField122: TppField
      FieldAlias = 'RECOLHIMENTO_3_5'
      FieldName = 'RECOLHIMENTO_3_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 121
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField123: TppField
      FieldAlias = 'VAL_4_5'
      FieldName = 'VAL_4_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 122
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField124: TppField
      FieldAlias = 'RECOLHIMENTO_4_5'
      FieldName = 'RECOLHIMENTO_4_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 123
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField125: TppField
      FieldAlias = 'VAL_5_5'
      FieldName = 'VAL_5_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 124
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField126: TppField
      FieldAlias = 'RECOLHIMENTO_5_5'
      FieldName = 'RECOLHIMENTO_5_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 125
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField127: TppField
      FieldAlias = 'VAL_6_5'
      FieldName = 'VAL_6_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 126
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField128: TppField
      FieldAlias = 'RECOLHIMENTO_6_5'
      FieldName = 'RECOLHIMENTO_6_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 127
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField129: TppField
      FieldAlias = 'VAL_7_5'
      FieldName = 'VAL_7_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 128
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField130: TppField
      FieldAlias = 'RECOLHIMENTO_7_5'
      FieldName = 'RECOLHIMENTO_7_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 129
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField131: TppField
      FieldAlias = 'VAL_8_5'
      FieldName = 'VAL_8_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 130
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField132: TppField
      FieldAlias = 'RECOLHIMENTO_8_5'
      FieldName = 'RECOLHIMENTO_8_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 131
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField133: TppField
      FieldAlias = 'VAL_9_5'
      FieldName = 'VAL_9_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 132
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField134: TppField
      FieldAlias = 'RECOLHIMENTO_9_5'
      FieldName = 'RECOLHIMENTO_9_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 133
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField135: TppField
      FieldAlias = 'VAL_10_5'
      FieldName = 'VAL_10_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 134
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField136: TppField
      FieldAlias = 'RECOLHIMENTO_10_5'
      FieldName = 'RECOLHIMENTO_10_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 135
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField137: TppField
      FieldAlias = 'VAL_11_5'
      FieldName = 'VAL_11_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 136
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField138: TppField
      FieldAlias = 'RECOLHIMENTO_11_5'
      FieldName = 'RECOLHIMENTO_11_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 137
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField139: TppField
      FieldAlias = 'VAL_12_5'
      FieldName = 'VAL_12_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 138
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField140: TppField
      FieldAlias = 'RECOLHIMENTO_12_5'
      FieldName = 'RECOLHIMENTO_12_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 139
      Searchable = False
      Sortable = False
    end
    object ppRelSalContribppField141: TppField
      FieldAlias = 'TOTAL_ANO_5'
      FieldName = 'TOTAL_ANO_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 140
      Searchable = False
      Sortable = False
    end
  end
  object dsRelSalContrib: TwwDataSource
    DataSet = CdsRelSalContrib
    Left = 364
    Top = 112
  end
  object ppRelSalContrib1: TppBDEPipeline
    DataSource = dsRelSalContrib1
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'ppRelSalContrib1'
    Left = 36
    Top = 64
  end
  object dsRelSalContrib1: TwwDataSource
    DataSet = CdsRelSalContrib1
    Left = 36
    Top = 112
  end
  object ppRelSalContrib2: TppBDEPipeline
    DataSource = dsRelSalContrib2
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'ppRelSalContrib2'
    Left = 141
    Top = 64
    object ppRelSalContrib2ppField1: TppField
      FieldAlias = 'RUBRICA'
      FieldName = 'RUBRICA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppRelSalContrib2ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANO'
      FieldName = 'ANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppRelSalContrib2ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_ABS_01'
      FieldName = 'VAL_ABS_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppRelSalContrib2ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_ABS_02'
      FieldName = 'VAL_ABS_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppRelSalContrib2ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_ABS_03'
      FieldName = 'VAL_ABS_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppRelSalContrib2ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_ABS_04'
      FieldName = 'VAL_ABS_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppRelSalContrib2ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_ABS_05'
      FieldName = 'VAL_ABS_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppRelSalContrib2ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_ABS_06'
      FieldName = 'VAL_ABS_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppRelSalContrib2ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_ABS_07'
      FieldName = 'VAL_ABS_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppRelSalContrib2ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_ABS_08'
      FieldName = 'VAL_ABS_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppRelSalContrib2ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_ABS_09'
      FieldName = 'VAL_ABS_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppRelSalContrib2ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_ABS_10'
      FieldName = 'VAL_ABS_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppRelSalContrib2ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_ABS_11'
      FieldName = 'VAL_ABS_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppRelSalContrib2ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_ABS_12'
      FieldName = 'VAL_ABS_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppRelSalContrib2ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_01'
      FieldName = 'VAL_01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppRelSalContrib2ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_02'
      FieldName = 'VAL_02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppRelSalContrib2ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_03'
      FieldName = 'VAL_03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppRelSalContrib2ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_04'
      FieldName = 'VAL_04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppRelSalContrib2ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_05'
      FieldName = 'VAL_05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppRelSalContrib2ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_06'
      FieldName = 'VAL_06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppRelSalContrib2ppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_07'
      FieldName = 'VAL_07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppRelSalContrib2ppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_08'
      FieldName = 'VAL_08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppRelSalContrib2ppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_09'
      FieldName = 'VAL_09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppRelSalContrib2ppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_10'
      FieldName = 'VAL_10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppRelSalContrib2ppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_11'
      FieldName = 'VAL_11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppRelSalContrib2ppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_12'
      FieldName = 'VAL_12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
  end
  object dsRelSalContrib2: TwwDataSource
    DataSet = CdsRelSalContrib2
    Left = 141
    Top = 112
  end
  object ppRelSalContrib3: TppBDEPipeline
    DataSource = dsRelSalContrib3
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'ppRelSalContrib3'
    Left = 256
    Top = 64
    object ppRelSalContrib3ppField1: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppRelSalContrib3ppField2: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppRelSalContrib3ppField3: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 2
    end
    object ppRelSalContrib3ppField4: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppRelSalContrib3ppField5: TppField
      FieldAlias = 'MASCULINO'
      FieldName = 'MASCULINO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object ppRelSalContrib3ppField6: TppField
      FieldAlias = 'FEMININO'
      FieldName = 'FEMININO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object ppRelSalContrib3ppField7: TppField
      FieldAlias = 'NACIONALIDADE'
      FieldName = 'NACIONALIDADE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
    object ppRelSalContrib3ppField8: TppField
      FieldAlias = 'INCRICAO'
      FieldName = 'INCRICAO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object ppRelSalContrib3ppField9: TppField
      FieldAlias = 'PIS'
      FieldName = 'PIS'
      FieldLength = 20
      DisplayWidth = 20
      Position = 8
    end
    object ppRelSalContrib3ppField10: TppField
      FieldAlias = 'CPF'
      FieldName = 'CPF'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object ppRelSalContrib3ppField11: TppField
      FieldAlias = 'NUMDEPIRRF'
      FieldName = 'NUMDEPIRRF'
      FieldLength = 2
      DisplayWidth = 2
      Position = 10
    end
    object ppRelSalContrib3ppField12: TppField
      FieldAlias = 'SOLTEIRO'
      FieldName = 'SOLTEIRO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 11
    end
    object ppRelSalContrib3ppField13: TppField
      FieldAlias = 'CASADO'
      FieldName = 'CASADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
    object ppRelSalContrib3ppField14: TppField
      FieldAlias = 'VIUVO'
      FieldName = 'VIUVO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 13
    end
    object ppRelSalContrib3ppField15: TppField
      FieldAlias = 'DESQUITADO_DIVORCIADO'
      FieldName = 'DESQUITADO_DIVORCIADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 14
    end
    object ppRelSalContrib3ppField16: TppField
      FieldAlias = 'SIT_EMPREGADO'
      FieldName = 'SIT_EMPREGADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object ppRelSalContrib3ppField17: TppField
      FieldAlias = 'SIT_EMPRESARIO'
      FieldName = 'SIT_EMPRESARIO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object ppRelSalContrib3ppField18: TppField
      FieldAlias = 'SIT_AUTONOMO'
      FieldName = 'SIT_AUTONOMO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 17
    end
    object ppRelSalContrib3ppField19: TppField
      FieldAlias = 'POSSUI_VINC'
      FieldName = 'POSSUI_VINC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 18
    end
    object ppRelSalContrib3ppField20: TppField
      FieldAlias = 'NAO_POSSUI_VINC'
      FieldName = 'NAO_POSSUI_VINC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 19
    end
    object ppRelSalContrib3ppField21: TppField
      FieldAlias = 'POSSUI_BENEF'
      FieldName = 'POSSUI_BENEF'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
    end
    object ppRelSalContrib3ppField22: TppField
      FieldAlias = 'NAO_POSSUI_BENEF'
      FieldName = 'NAO_POSSUI_BENEF'
      FieldLength = 1
      DisplayWidth = 1
      Position = 21
    end
    object ppRelSalContrib3ppField23: TppField
      FieldAlias = 'LOCAL_DATA'
      FieldName = 'LOCAL_DATA'
      FieldLength = 140
      DisplayWidth = 140
      Position = 22
    end
  end
  object dsRelSalContrib3: TwwDataSource
    DataSet = CdsRelSalContrib3
    Left = 256
    Top = 112
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsAuxIndex'
        DescFields = 'SAL_PARTE_FIXA'
        Fields = 'ANO;SAL_PARTE_FIXA;NOM_RUBRICA;MES'
        Options = [ixDescending]
      end>
    Params = <>
    StoreDefs = True
    Left = 274
    Top = 8
  end
  object sqlAux: TCMSqlParams
    ClientDataSet = CdsAux
    Left = 230
    Top = 8
  end
  object CdsRelSalContrib: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EMPRESA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CNPJ'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ENDERECO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'CIDADE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EMPREGADO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'INCRICAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CPF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PIS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATAADMISSAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DATADESLIGAMENTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOTIVO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'ANO_1'
        DataType = ftFloat
      end
      item
        Name = 'VAL_1_1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_1_1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_2_1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_2_1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_3_1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_3_1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_4_1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_4_1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_5_1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_5_1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_6_1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_6_1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_7_1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_7_1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_8_1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_8_1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_9_1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_9_1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_10_1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_10_1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_11_1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_11_1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_12_1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_12_1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TOTAL_ANO_1'
        DataType = ftFloat
      end
      item
        Name = 'ANO_2'
        DataType = ftFloat
      end
      item
        Name = 'VAL_1_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_1_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_2_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_2_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_3_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_3_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_4_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_4_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_5_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_5_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_6_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_6_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_7_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_7_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_8_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_8_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_9_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_9_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_10_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_10_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_11_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_11_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_12_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_12_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TOTAL_ANO_2'
        DataType = ftFloat
      end
      item
        Name = 'ANO_3'
        DataType = ftFloat
      end
      item
        Name = 'VAL_1_3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_1_3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_2_3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_2_3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_3_3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_3_3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_4_3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_4_3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_5_3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_5_3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_6_3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_6_3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_7_3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_7_3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_8_3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_8_3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_9_3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_9_3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_10_3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_10_3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_11_3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_11_3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_12_3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_12_3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TOTAL_ANO_3'
        DataType = ftFloat
      end
      item
        Name = 'ANO_4'
        DataType = ftFloat
      end
      item
        Name = 'VAL_1_4'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_1_4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_2_4'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_2_4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_3_4'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_3_4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_4_4'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_4_4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_5_4'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_5_4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_6_4'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_6_4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_7_4'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_7_4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_8_4'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_8_4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_9_4'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_9_4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_10_4'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_10_4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_11_4'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_11_4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_12_4'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_12_4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TOTAL_ANO_4'
        DataType = ftFloat
      end
      item
        Name = 'ANO_5'
        DataType = ftFloat
      end
      item
        Name = 'VAL_1_5'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_1_5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_2_5'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_2_5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_3_5'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_3_5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_4_5'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_4_5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_5_5'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_5_5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_6_5'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_6_5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_7_5'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_7_5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_8_5'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_8_5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_9_5'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_9_5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_10_5'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_10_5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_11_5'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_11_5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VAL_12_5'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RECOLHIMENTO_12_5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TOTAL_ANO_5'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 364
    Top = 160
  end
  object sqlRelSalContrib: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  '#39'12345678901234567890'#39' AS CNPJ,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENDERECO,'
      '  '#39'12345678901234567890'#39' AS CIDADE,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPREGADO,'
      '  '#39'12345678901234567890'#39' AS INCRICAO,'
      '  '#39'12345678901234567890'#39' AS CPF,'
      '  '#39'12345678901234567890'#39' AS PIS,'
      '  '#39'1234567890'#39' AS DATAADMISSAO,'
      '  '#39'1234567890'#39' AS DATADESLIGAMENTO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS MOTIVO,  '
      '  0 AS ANO_1,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_1_1,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_1_1,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_2_1,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_2_1,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_3_1,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_3_1,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_4_1,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_4_1,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_5_1,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_5_1,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_6_1,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_6_1,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_7_1,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_7_1,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_8_1,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_8_1,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_9_1,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_9_1,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_10_1, '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_10_1,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_11_1, '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_11_1,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_12_1, '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_12_1,'
      '  0 AS TOTAL_ANO_1,'
      ''
      '  0 AS ANO_2,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_1_2,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_1_2,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_2_2,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_2_2,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_3_2,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_3_2,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_4_2,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_4_2,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_5_2,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_5_2,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_6_2,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_6_2,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_7_2,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_7_2,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_8_2,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_8_2,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_9_2,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_9_2,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_10_2, '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_10_2,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_11_2, '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_11_2,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_12_2, '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_12_2,'
      '  0 AS TOTAL_ANO_2,'
      '  0 AS ANO_3,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_1_3,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_1_3,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_2_3,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_2_3,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_3_3,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_3_3,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_4_3,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_4_3,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_5_3,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_5_3,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_6_3,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_6_3,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_7_3,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_7_3,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_8_3,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_8_3,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_9_3,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_9_3,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_10_3, '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_10_3,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_11_3, '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_11_3,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_12_3, '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_12_3,'
      '  0 AS TOTAL_ANO_3,'
      '  0 AS ANO_4,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_1_4,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_1_4,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_2_4,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_2_4,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_3_4,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_3_4,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_4_4,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_4_4,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_5_4,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_5_4,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_6_4,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_6_4,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_7_4,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_7_4,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_8_4,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_8_4,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_9_4,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_9_4,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_10_4, '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_10_4,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_11_4, '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_11_4,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_12_4, '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_12_4,'
      '  0 AS TOTAL_ANO_4,'
      '  0 AS ANO_5,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_1_5,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_1_5,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_2_5,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_2_5,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_3_5,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_3_5,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_4_5,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_4_5,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_5_5,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_5_5,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_6_5,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_6_5,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_7_5,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_7_5,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_8_5,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_8_5,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_9_5,  '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_9_5,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_10_5, '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_10_5,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_11_5, '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_11_5,'
      
        ' CAST(0 AS VARCHAR(20)) AS VAL_12_5, '#39'1234567890'#39' AS RECOLHIMENT' +
        'O_12_5,'
      '  0 AS TOTAL_ANO_5'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsRelSalContrib
    Left = 364
    Top = 208
  end
  object CdsRelSalContrib1: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 36
    Top = 160
  end
  object CdsRelSalContrib2: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsRelSalContrib2Index1'
        Fields = 'ANO'
      end>
    IndexName = 'CdsRelSalContrib2Index1'
    Params = <>
    StoreDefs = True
    Left = 141
    Top = 160
  end
  object CdsRelSalContrib3: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 256
    Top = 160
  end
  object sqlRelSalContrib2: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA,'
      '  0 AS ANO,'
      '  0 AS VAL_ABS_01, 0 AS VAL_ABS_02, 0 AS VAL_ABS_03,'
      '  0 AS VAL_ABS_04, 0 AS VAL_ABS_05, 0 AS VAL_ABS_06,'
      '  0 AS VAL_ABS_07, 0 AS VAL_ABS_08, 0 AS VAL_ABS_09,'
      '  0 AS VAL_ABS_10, 0 AS VAL_ABS_11, 0 AS VAL_ABS_12,'
      '  0 AS VAL_01, 0 AS VAL_02, 0 AS VAL_03,'
      '  0 AS VAL_04, 0 AS VAL_05, 0 AS VAL_06,'
      '  0 AS VAL_07, 0 AS VAL_08, 0 AS VAL_09,'
      '  0 AS VAL_10, 0 AS VAL_11, 0 AS VAL_12'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsRelSalContrib2
    Left = 141
    Top = 208
  end
  object sqlRelSalContrib3: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPREGADO,'
      '  '#39'1234567890'#39' AS DATANASC,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENDERECO,'
      '  '#39'1234567890'#39' AS CEP,'
      '  '#39'1'#39' AS MASCULINO,'
      '  '#39'1'#39' AS FEMININO,'
      '  '#39'123456789012345678901234567890'#39' AS NACIONALIDADE,'
      '  '#39'12345678901234567890'#39' AS INCRICAO,'
      '  '#39'12345678901234567890'#39' AS PIS,'
      '  '#39'12345678901234567890'#39' AS CPF,'
      '  '#39'12'#39' AS NUMDEPIRRF,'
      '  -- Estado Civil'
      '  '#39'1'#39' AS SOLTEIRO,'
      '  '#39'1'#39' AS CASADO,'
      '  '#39'1'#39' AS VIUVO,'
      '  '#39'1'#39' AS DESQUITADO_DIVORCIADO,'
      '  -- Situação'
      '  '#39'1'#39' AS SIT_EMPREGADO,'
      '  '#39'1'#39' AS SIT_EMPRESARIO,'
      '  '#39'1'#39' AS SIT_AUTONOMO,'
      
        '  -- Indicador de outra atividade com vinculação à Previdência S' +
        'ocial Urbana'
      '  '#39'1'#39' AS POSSUI_VINC,'
      '  '#39'1'#39' AS NAO_POSSUI_VINC,'
      '  -- Está em gozo de  benefício?'
      '  '#39'1'#39' AS POSSUI_BENEF,'
      '  '#39'1'#39' AS NAO_POSSUI_BENEF,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' ||'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS LOCAL_DATA'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsRelSalContrib3
    Left = 256
    Top = 208
  end
  object sqlRelSalContrib1: TCMSqlParams
    ClientDataSet = CdsRelSalContrib1
    Left = 36
    Top = 208
  end
end
