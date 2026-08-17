inherited dtmRelOrcamentoCivil: TdtmRelOrcamentoCivil
  Left = 277
  Top = 174
  Width = 342
  Height = 151
  Caption = 'dtmRelOrcamentoCivil'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'idImovel'
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
        Caption = 'iAno'
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
        Caption = 'flgReceita'
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
        Caption = 'flgDespesa'
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
        Caption = 'flgPrevisto'
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
        Caption = 'flgRealizado'
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
        Caption = 'flgDesemp'
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
        Caption = 'iOrdem'
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
        Caption = 'bSeparador'
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
        Caption = 'bCorLinha'
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
        Caption = 'iCorLinha'
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
        Caption = 'iMesIni'
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
        Name = 'iMesIni'
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
        Caption = 'iQtdeMeses'
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
        Name = 'iQtdeMeses'
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
        Caption = 'sMesIni'
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
        Name = 'sMesIni'
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
        Caption = 'sMesFim'
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
        Name = 'sMesFim'
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
    Report = ppOrcamentoCivil
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    Data = {
      6E0A00009619E0BD010000001800000017000A00000003000000E20108494449
      4D4F56454C080004000000000007494D4F4E4F4D450100490000000100055749
      445448020002003C000B4944494E44494341444F5208000400000000000E414E
      4F434F4D504554454E43494108000400000000000D4944475250415055524143
      414F08000400000000000A4453435F43435553544F0100490000000100055749
      445448020002003C000D4453435F494E44494341444F52010049000000010005
      5749445448020002003C000D4453435F5449504F56414C4F5201004900000001
      000557494454480200020008000D4453435F5449504F4C414E43410100490000
      00010005574944544802000200040005564C523031080004000000000005564C
      523032080004000000000005564C523033080004000000000005564C52303408
      0004000000000005564C523035080004000000000005564C5230360800040000
      00000005564C523037080004000000000005564C523038080004000000000005
      564C523039080004000000000005564C523130080004000000000005564C5231
      31080004000000000005564C523132080004000000000006564C52414E540800
      04000000000008564C524D4544494108000400000000000100044C4349440400
      0100090800000000000000000000000000002C93400E4E6F7274652053686F70
      70696E6700000000000014400000000000449F4000000000000000400D434F4E
      54524F4C41444F52494118494D504F53544F532C2054415841532045204F5554
      524153084445535045534153045052455600000000807FC240000000000000C8
      4000000000807FC24000000000807FC24000000000807FC24000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000807FE84000000000000000
      000000000000000000000000002C93400E4E6F7274652053686F7070696E6700
      000000000014400000000000449F4000000000000000400D434F4E54524F4C41
      444F52494118494D504F53544F532C2054415841532045204F55545241530844
      45535045534153045245414C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000002C93400E4E6F7274652053686F7070696E67000000000000
      F03F0000000000449F4000000000000000400D434F4E54524F4C41444F524941
      164D4154455249414C20444520455343524954D352494F084445535045534153
      0450524556000000000036B840000000000036B840000000000036B840000000
      000036B840000000000036B840000000000036B840000000000036B840000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000402FE54000000000000000000000000000000000000000
      002C93400E4E6F7274652053686F7070696E67000000000000F03F0000000000
      449F4000000000000000400D434F4E54524F4C41444F524941164D4154455249
      414C20444520455343524954D352494F084445535045534153045245414C0000
      00000088B3400000000000A0B44000000000002CBA40000000000078BE400000
      0000000000000000000000000000000000000036B84000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008040DE4000000000000000000000000000000000000000002C93400E4E6F
      7274652053686F7070696E6700000000000018400000000000449F4000000000
      0000F03F105355504552494E54454E44454E4349411F545245494E414D454E54
      4F202F2041504F494F204F5045524143494F4E414C0844455350455341530450
      5245560000000000409F4000000000000000000000000000409F400000000000
      0000000000000000409F4000000000000000000000000000409F400000000000
      0000000000000000409F4000000000000000000000000000409F400000000000
      000000000000000070C74000000000000000000000000000000000000000002C
      93400E4E6F7274652053686F7070696E6700000000000018400000000000449F
      40000000000000F03F105355504552494E54454E44454E4349411F545245494E
      414D454E544F202F2041504F494F204F5045524143494F4E414C084445535045
      534153045245414C000000000000000000000000000000000000000000F09E40
      00000000000000000000000000CCA04000000000000000000000000000409F40
      0000000000000000000000000070974000000000000000000000000000000000
      00000000000000000000000000CEBD4000000000000000000000000000000000
      000000002C93400E4E6F7274652053686F7070696E6700000000000020400000
      000000449F400000000000001C400852454345495441530F4F55545241532052
      4543454954415308524543454954415304505245560000000000709740000000
      0000709740000000000070974000000000007097400000000000000000000000
      0000709740000000000000000000000000007097400000000000709740000000
      000000000000000000000000000000000000000000000000000082C440000000
      00000000000000000000000000000000002C93400E4E6F7274652053686F7070
      696E6700000000000020400000000000449F400000000000001C400852454345
      495441530F4F5554524153205245434549544153085245434549544153045245
      414C0000000000B098400000000000B09D400000000000C09240000000000070
      9740000000000000000000000000000000000000000000609840000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000003CBE4000000000000000000000000000000000000000002C93
      400E4E6F7274652053686F7070696E670000000000001C400000000000449F40
      0000000000001C400852454345495441532252454345495441532046494E202F
      20434D202F204A55524F53202F204D554C544153085245434549544153045052
      45560000000000C082400000000000C082400000000000C082400000000000C0
      82400000000000C082400000000000C082400000000000C08240000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000068B04000000000000000000000000000000000000000002C93
      400E4E6F7274652053686F7070696E670000000000001C400000000000449F40
      0000000000001C400852454345495441532252454345495441532046494E202F
      20434D202F204A55524F53202F204D554C544153085245434549544153045245
      414C000000000060884000000000002894400000000000208240000000000040
      8F40000000000000000000000000000000000000000000007E40000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000022B0400000000000000000}
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      '/* SELECT ORÇAMENTO */'
      ''
      'SELECT IM.IDIMOVEL,'
      '       IM.IMONOME,'
      '       I.IDINDICADOR,'
      '       CCI.ANOCOMPETENCIA,'
      '       GA.IDGRPAPURACAO,'
      '       GA.DESCRICAO AS DSC_CCUSTO,'
      '       I.DESCRICAO  AS DSC_INDICADOR,'
      
        '       DECODE(I.TIPOVALOR,'#39'R'#39','#39'RECEITAS'#39','#39'DESPESAS'#39') AS DSC_TIPO' +
        'VALOR,'
      '       DECODE(CCI.TIPOLANCA,'#39'P'#39','#39'PREV'#39','#39'REAL'#39') AS DSC_TIPOLANCA,'
      '       NVL(AP01.VLRAPURACAONUM,0) AS VLR01,'
      '       NVL(AP02.VLRAPURACAONUM,0) AS VLR02,'
      '       NVL(AP03.VLRAPURACAONUM,0) AS VLR03,'
      '       NVL(AP04.VLRAPURACAONUM,0) AS VLR04,'
      '       NVL(AP05.VLRAPURACAONUM,0) AS VLR05,'
      '       NVL(AP06.VLRAPURACAONUM,0) AS VLR06,'
      '       NVL(AP07.VLRAPURACAONUM,0) AS VLR07,'
      '       NVL(AP08.VLRAPURACAONUM,0) AS VLR08,'
      '       NVL(AP09.VLRAPURACAONUM,0) AS VLR09,'
      '       NVL(AP10.VLRAPURACAONUM,0) AS VLR10,'
      '       NVL(AP11.VLRAPURACAONUM,0) AS VLR11,'
      '       NVL(AP12.VLRAPURACAONUM,0) AS VLR12,'
      '       NVL(APANT.VLRAPURACAONUM,0) AS VLRANT,'
      '       0 AS VLRMEDIA'
      ''
      'FROM'
      '       IMOVEL IM,'
      '       INDINDICADOR I,'
      '       INDGRPAPURACAO GA,'
      '       ('
      
        '        SELECT DISTINCT AP.IDIMOVEL, AP.IDGRPAPURACAO, AP.IDINDI' +
        'CADOR, GI.TIPOLANCA, AP.ANOCOMPETENCIA'
      
        '          FROM INDAPURACAO AP, INDGRPINDICADOR GI, INDSUBTIPOIND' +
        'ICADOR ST'
      '         WHERE AP.IDINDICADOR = GI.IDINDICADOR'
      '           AND GI.IDSUBTIPO = ST.IDSUBTIPO'
      '           AND ST.IDREPORTS = 3435'
      '           AND AP.ANOCOMPETENCIA = 2001'
      '        ) CCI,'
      '       ('
      
        '        SELECT IDINDICADOR, IDGRPAPURACAO, TIPOLANCA, VLRAPURACA' +
        'ONUM'
      '          FROM INDAPURACAO'
      '         WHERE MESCOMPETENCIA = 1'
      '           AND ANOCOMPETENCIA = 2001'
      '        ) AP01,'
      '       ('
      
        '       SELECT IDINDICADOR, IDGRPAPURACAO, TIPOLANCA, VLRAPURACAO' +
        'NUM'
      '         FROM INDAPURACAO'
      '        WHERE MESCOMPETENCIA = 2'
      '          AND ANOCOMPETENCIA = 2001'
      '       ) AP02,'
      '       ('
      
        '       SELECT IDINDICADOR, IDGRPAPURACAO, TIPOLANCA, VLRAPURACAO' +
        'NUM'
      '         FROM INDAPURACAO'
      '        WHERE MESCOMPETENCIA = 3'
      '          AND ANOCOMPETENCIA = 2001'
      '       ) AP03,'
      '       ('
      
        '       SELECT IDINDICADOR, IDGRPAPURACAO, TIPOLANCA, VLRAPURACAO' +
        'NUM'
      '         FROM INDAPURACAO'
      '        WHERE MESCOMPETENCIA = 4'
      '          AND ANOCOMPETENCIA = 2001'
      '       ) AP04,'
      '       ('
      
        '       SELECT IDINDICADOR, IDGRPAPURACAO, TIPOLANCA, VLRAPURACAO' +
        'NUM'
      '         FROM INDAPURACAO'
      '        WHERE MESCOMPETENCIA = 5'
      '          AND ANOCOMPETENCIA = 2001'
      '       ) AP05,'
      '       ('
      
        '       SELECT IDINDICADOR, IDGRPAPURACAO, TIPOLANCA, VLRAPURACAO' +
        'NUM'
      '         FROM INDAPURACAO'
      '        WHERE MESCOMPETENCIA = 6'
      '          AND ANOCOMPETENCIA = 2001'
      '       ) AP06,'
      '       ('
      
        '       SELECT IDINDICADOR, IDGRPAPURACAO, TIPOLANCA, VLRAPURACAO' +
        'NUM'
      '         FROM INDAPURACAO'
      '        WHERE MESCOMPETENCIA = 7'
      '          AND ANOCOMPETENCIA = 2001'
      '       ) AP07,'
      '       ('
      
        '       SELECT IDINDICADOR, IDGRPAPURACAO, TIPOLANCA, VLRAPURACAO' +
        'NUM'
      '         FROM INDAPURACAO'
      '        WHERE MESCOMPETENCIA = 8'
      '          AND ANOCOMPETENCIA = 2001'
      '       ) AP08,'
      '       ('
      
        '       SELECT IDINDICADOR, IDGRPAPURACAO, TIPOLANCA, VLRAPURACAO' +
        'NUM'
      '         FROM INDAPURACAO'
      '        WHERE MESCOMPETENCIA = 9'
      '          AND ANOCOMPETENCIA = 2001'
      '       ) AP09,'
      '       ('
      
        '       SELECT IDINDICADOR, IDGRPAPURACAO, TIPOLANCA, VLRAPURACAO' +
        'NUM'
      '         FROM INDAPURACAO'
      '        WHERE MESCOMPETENCIA = 10'
      '          AND ANOCOMPETENCIA = 2001'
      '       ) AP10,'
      '       ('
      
        '       SELECT IDINDICADOR, IDGRPAPURACAO, TIPOLANCA, VLRAPURACAO' +
        'NUM'
      '         FROM INDAPURACAO'
      '        WHERE MESCOMPETENCIA = 11'
      '          AND ANOCOMPETENCIA = 2001'
      '       ) AP11,'
      '       ('
      
        '       SELECT IDINDICADOR, IDGRPAPURACAO, TIPOLANCA, VLRAPURACAO' +
        'NUM'
      '         FROM INDAPURACAO'
      '        WHERE MESCOMPETENCIA = 12'
      '          AND ANOCOMPETENCIA = 2001'
      '       ) AP12,'
      '       ('
      
        '       SELECT IDINDICADOR, IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLR' +
        'APURACAONUM,0)) AS VLRAPURACAONUM'
      '         FROM INDAPURACAO'
      '        WHERE ANOCOMPETENCIA = 2001'
      '        GROUP BY IDINDICADOR, IDGRPAPURACAO, TIPOLANCA'
      '       ) APANT'
      ''
      ''
      'WHERE CCI.IDINDICADOR    = I.IDINDICADOR'
      '  AND CCI.IDGRPAPURACAO  = GA.IDGRPAPURACAO'
      '  AND CCI.IDIMOVEL       = IM.IDIMOVEL'
      '  AND CCI.IDGRPAPURACAO  = AP01.IDGRPAPURACAO(+)'
      '  AND CCI.IDINDICADOR    = AP01.IDINDICADOR(+)'
      '  AND CCI.TIPOLANCA      = AP01.TIPOLANCA(+)'
      '  AND CCI.IDGRPAPURACAO  = AP02.IDGRPAPURACAO(+)'
      '  AND CCI.IDINDICADOR    = AP02.IDINDICADOR(+)'
      '  AND CCI.TIPOLANCA      = AP02.TIPOLANCA(+)'
      '  AND CCI.IDGRPAPURACAO  = AP03.IDGRPAPURACAO(+)'
      '  AND CCI.IDINDICADOR    = AP03.IDINDICADOR(+)'
      '  AND CCI.TIPOLANCA      = AP03.TIPOLANCA(+)'
      '  AND CCI.IDGRPAPURACAO  = AP04.IDGRPAPURACAO(+)'
      '  AND CCI.IDINDICADOR    = AP04.IDINDICADOR(+)'
      '  AND CCI.TIPOLANCA      = AP04.TIPOLANCA(+)'
      '  AND CCI.IDGRPAPURACAO  = AP05.IDGRPAPURACAO(+)'
      '  AND CCI.IDINDICADOR    = AP05.IDINDICADOR(+)'
      '  AND CCI.TIPOLANCA      = AP05.TIPOLANCA(+)'
      '  AND CCI.IDGRPAPURACAO  = AP06.IDGRPAPURACAO(+)'
      '  AND CCI.IDINDICADOR    = AP06.IDINDICADOR(+)'
      '  AND CCI.TIPOLANCA      = AP06.TIPOLANCA(+)'
      '  AND CCI.IDGRPAPURACAO  = AP07.IDGRPAPURACAO(+)'
      '  AND CCI.IDINDICADOR    = AP07.IDINDICADOR(+)'
      '  AND CCI.TIPOLANCA      = AP07.TIPOLANCA(+)'
      '  AND CCI.IDGRPAPURACAO  = AP08.IDGRPAPURACAO(+)'
      '  AND CCI.IDINDICADOR    = AP08.IDINDICADOR(+)'
      '  AND CCI.TIPOLANCA      = AP08.TIPOLANCA(+)'
      '  AND CCI.IDGRPAPURACAO  = AP09.IDGRPAPURACAO(+)'
      '  AND CCI.IDINDICADOR    = AP09.IDINDICADOR(+)'
      '  AND CCI.TIPOLANCA      = AP09.TIPOLANCA(+)'
      '  AND CCI.IDGRPAPURACAO  = AP10.IDGRPAPURACAO(+)'
      '  AND CCI.IDINDICADOR    = AP10.IDINDICADOR(+)'
      '  AND CCI.TIPOLANCA      = AP10.TIPOLANCA(+)'
      '  AND CCI.IDGRPAPURACAO  = AP11.IDGRPAPURACAO(+)'
      '  AND CCI.IDINDICADOR    = AP11.IDINDICADOR(+)'
      '  AND CCI.TIPOLANCA      = AP11.TIPOLANCA(+)'
      '  AND CCI.IDGRPAPURACAO  = AP12.IDGRPAPURACAO(+)'
      '  AND CCI.IDINDICADOR    = AP12.IDINDICADOR(+)'
      '  AND CCI.TIPOLANCA      = AP12.TIPOLANCA(+)'
      '  AND CCI.IDGRPAPURACAO  = APANT.IDGRPAPURACAO(+)'
      '  AND CCI.IDINDICADOR    = APANT.IDINDICADOR(+)'
      '  AND CCI.TIPOLANCA      = APANT.TIPOLANCA(+)'
      ''
      ''
      '-- ORDER BY TIPOVALOR, DSC_CCUSTO, DSC_INDICADOR'
      ' ORDER BY TIPOVALOR, DSC_INDICADOR, DSC_CCUSTO'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = nil
  end
  inherited ds: TDataSource
    Left = 107
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 184
    Top = 64
    object pplppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplppField2: TppField
      FieldAlias = 'IMONOME'
      FieldName = 'IMONOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINDICADOR'
      FieldName = 'IDINDICADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOCOMPETENCIA'
      FieldName = 'ANOCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRPAPURACAO'
      FieldName = 'IDGRPAPURACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplppField6: TppField
      FieldAlias = 'DSC_CCUSTO'
      FieldName = 'DSC_CCUSTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplppField7: TppField
      FieldAlias = 'DSC_INDICADOR'
      FieldName = 'DSC_INDICADOR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object pplppField8: TppField
      FieldAlias = 'DSC_TIPOVALOR'
      FieldName = 'DSC_TIPOVALOR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 7
    end
    object pplppField9: TppField
      FieldAlias = 'DSC_TIPOLANCA'
      FieldName = 'DSC_TIPOLANCA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 8
    end
    object pplppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR01'
      FieldName = 'VLR01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR02'
      FieldName = 'VLR02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR03'
      FieldName = 'VLR03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR04'
      FieldName = 'VLR04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR05'
      FieldName = 'VLR05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR06'
      FieldName = 'VLR06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR07'
      FieldName = 'VLR07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR08'
      FieldName = 'VLR08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR09'
      FieldName = 'VLR09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR10'
      FieldName = 'VLR10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR11'
      FieldName = 'VLR11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR12'
      FieldName = 'VLR12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRANT'
      FieldName = 'VLRANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMEDIA'
      FieldName = 'VLRMEDIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
  end
  object ppOrcamentoCivil: TppReport
    AutoStop = False
    DataPipeline = ppl
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 264
    Top = 64
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppl'
    object ppOrcamentoHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object lblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284428
        BandType = 0
      end
      object ppOrcamentoLabel42: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Orçamento - Condomínio Civil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8466
        mmWidth = 284428
        BandType = 0
      end
      object ppLogoTipo: TppImage
        UserName = 'ppLogoTipo'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15610
        mmLeft = 265
        mmTop = 0
        mmWidth = 15611
        BandType = 0
      end
    end
    object ppOrcamentoDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object pplSeparador: TppLine
        OnPrint = pplSeparadorPrint
        UserName = 'lSeparador'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppsCor: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor'
        Brush.Color = clLime
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        StretchWithParent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDscDetalhe: TppDBText
        UserName = 'ppDscDetalhe'
        DataField = 'DSC_INDICADOR'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 2646
        mmTop = 0
        mmWidth = 46302
        BandType = 4
      end
      object ppOrcamentoDBText3: TppDBText
        UserName = 'OrcamentoDBText3'
        DataField = 'DSC_TIPOLANCA'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 49742
        mmTop = 0
        mmWidth = 7938
        BandType = 4
      end
      object ppOrcamentoDBText4: TppDBText
        UserName = 'OrcamentoDBText4'
        DataField = 'VLR01'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 58473
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText5: TppDBText
        UserName = 'OrcamentoDBText5'
        DataField = 'VLR05'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 113506
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText6: TppDBText
        UserName = 'OrcamentoDBText6'
        DataField = 'VLR02'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 72231
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText7: TppDBText
        UserName = 'OrcamentoDBText7'
        DataField = 'VLR03'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 85990
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText8: TppDBText
        UserName = 'OrcamentoDBText8'
        DataField = 'VLR04'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 99748
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText9: TppDBText
        UserName = 'OrcamentoDBText9'
        DataField = 'VLR06'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 127265
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText10: TppDBText
        UserName = 'OrcamentoDBText10'
        DataField = 'VLR09'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 168540
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText11: TppDBText
        UserName = 'OrcamentoDBText11'
        DataField = 'VLR07'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 141023
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText12: TppDBText
        UserName = 'OrcamentoDBText12'
        DataField = 'VLR08'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 154782
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText13: TppDBText
        UserName = 'DBText101'
        DataField = 'VLR10'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 182298
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText14: TppDBText
        UserName = 'DBText102'
        DataField = 'VLR11'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 196057
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText15: TppDBText
        UserName = 'DBText103'
        DataField = 'VLR12'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 210080
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object vTot: TppVariable
        UserName = 'vTot'
        AutoSize = False
        CalcOrder = 0
        DataType = dtExtended
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 223309
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'VLRANT'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 256911
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object vVar: TppVariable
        UserName = 'vVar'
        AutoSize = False
        CalcOrder = 1
        DataType = dtExtended
        DisplayFormat = '0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 274109
        mmTop = 0
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'VLRMEDIA'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 241036
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
    end
    object ppOrcamentoFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppOrcamentoSystemVariable7: TppSystemVariable
        UserName = 'Calc2'
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
        mmWidth = 283898
        BandType = 8
      end
      object lblSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 283898
        BandType = 8
      end
      object ppOrcamentoSystemVariable8: TppSystemVariable
        UserName = 'OrcamentoSystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257705
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppOrcamentoLine5: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppOrcamentoSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'IDIMOVEL'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'IMONOME'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 5292
          mmLeft = 0
          mmTop = 529
          mmWidth = 110067
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Competência: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 241036
          mmTop = 794
          mmWidth = 29104
          BandType = 3
          GroupNo = 0
        end
        object ppDBText18: TppDBText
          UserName = 'DBText18'
          DataField = 'ANOCOMPETENCIA'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 4233
          mmLeft = 270140
          mmTop = 794
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 21696
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 4763
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'LÍQUIDO A DISTRIBUIR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8731
          mmTop = 7673
          mmWidth = 30692
          BandType = 5
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 17727
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label202'
          Caption = 'PREV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 50271
          mmTop = 5821
          mmWidth = 7408
          BandType = 5
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'REAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 50271
          mmTop = 9790
          mmWidth = 7408
          BandType = 5
          GroupNo = 0
        end
        object vTGP1: TppVariable
          UserName = 'vTGP1'
          AutoSize = False
          CalcOrder = 0
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 58473
          mmTop = 5821
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGR1: TppVariable
          UserName = 'vTGR1'
          AutoSize = False
          CalcOrder = 1
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 58473
          mmTop = 9790
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGP2: TppVariable
          UserName = 'vTGP2'
          AutoSize = False
          CalcOrder = 2
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 72231
          mmTop = 5821
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGR2: TppVariable
          UserName = 'vTGR2'
          AutoSize = False
          CalcOrder = 3
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 72231
          mmTop = 9790
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGP3: TppVariable
          UserName = 'vTGP3'
          AutoSize = False
          CalcOrder = 4
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 85990
          mmTop = 5821
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGR3: TppVariable
          UserName = 'vTGR3'
          AutoSize = False
          CalcOrder = 5
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 85990
          mmTop = 9790
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGP4: TppVariable
          UserName = 'vTGP4'
          AutoSize = False
          CalcOrder = 6
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 99748
          mmTop = 5821
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGR4: TppVariable
          UserName = 'vTGR4'
          AutoSize = False
          CalcOrder = 7
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 99748
          mmTop = 9790
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGP5: TppVariable
          UserName = 'vTGP5'
          AutoSize = False
          CalcOrder = 8
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 113506
          mmTop = 5821
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGR5: TppVariable
          UserName = 'vTGR5'
          AutoSize = False
          CalcOrder = 9
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 113506
          mmTop = 9790
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGP6: TppVariable
          UserName = 'vTGP6'
          AutoSize = False
          CalcOrder = 10
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 5821
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGR6: TppVariable
          UserName = 'vTGR6'
          AutoSize = False
          CalcOrder = 11
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 9790
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGP7: TppVariable
          UserName = 'vTGP7'
          AutoSize = False
          CalcOrder = 12
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 141023
          mmTop = 5821
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGR7: TppVariable
          UserName = 'vTGR7'
          AutoSize = False
          CalcOrder = 13
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 141023
          mmTop = 9790
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGP8: TppVariable
          UserName = 'vTGP8'
          AutoSize = False
          CalcOrder = 14
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 154782
          mmTop = 5821
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGR8: TppVariable
          UserName = 'vTGR8'
          AutoSize = False
          CalcOrder = 15
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 154782
          mmTop = 9790
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGP9: TppVariable
          UserName = 'vTGP9'
          AutoSize = False
          CalcOrder = 16
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 168540
          mmTop = 5821
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGR9: TppVariable
          UserName = 'vTGR9'
          AutoSize = False
          CalcOrder = 17
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 168540
          mmTop = 9790
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGP10: TppVariable
          UserName = 'vTGP10'
          AutoSize = False
          CalcOrder = 18
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 182298
          mmTop = 5821
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGR10: TppVariable
          UserName = 'vTGR10'
          AutoSize = False
          CalcOrder = 19
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 182298
          mmTop = 9790
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGP11: TppVariable
          UserName = 'vTGP11'
          AutoSize = False
          CalcOrder = 20
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 196057
          mmTop = 5821
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGR11: TppVariable
          UserName = 'vTGR11'
          AutoSize = False
          CalcOrder = 21
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 196057
          mmTop = 9790
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGP12: TppVariable
          UserName = 'vTGP12'
          AutoSize = False
          CalcOrder = 22
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 210080
          mmTop = 5821
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGR12: TppVariable
          UserName = 'vTGR12'
          AutoSize = False
          CalcOrder = 23
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 210080
          mmTop = 9790
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGRTot: TppVariable
          UserName = 'vTGRTot'
          AutoSize = False
          CalcOrder = 24
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 223309
          mmTop = 9790
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object vTGPTot: TppVariable
          UserName = 'vTGPTot'
          AutoSize = False
          CalcOrder = 25
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 223309
          mmTop = 5821
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object vTGPAnt: TppVariable
          UserName = 'vTGPAnt'
          AutoSize = False
          CalcOrder = 26
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 256911
          mmTop = 5821
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object vTGRAnt: TppVariable
          UserName = 'vTGRAnt'
          AutoSize = False
          CalcOrder = 27
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 256911
          mmTop = 9790
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object vTGPVar: TppVariable
          UserName = 'vTGPVar'
          AutoSize = False
          CalcOrder = 28
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 274109
          mmTop = 5821
          mmWidth = 10319
          BandType = 5
          GroupNo = 0
        end
        object vTGRVar: TppVariable
          UserName = 'vTGRVar'
          AutoSize = False
          CalcOrder = 29
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 274109
          mmTop = 9790
          mmWidth = 10319
          BandType = 5
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label23'
          Caption = '% Var'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 50006
          mmTop = 13494
          mmWidth = 7938
          BandType = 5
          GroupNo = 0
        end
        object pVarGG1: TppVariable
          UserName = 'pVarGG1'
          AutoSize = False
          CalcOrder = 30
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 58473
          mmTop = 13494
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object pVarGG2: TppVariable
          UserName = 'pVarGG2'
          AutoSize = False
          CalcOrder = 31
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 72231
          mmTop = 13494
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object pVarGG3: TppVariable
          UserName = 'pVarGG3'
          AutoSize = False
          CalcOrder = 32
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 85990
          mmTop = 13494
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object pVarGG4: TppVariable
          UserName = 'pVarGG4'
          AutoSize = False
          CalcOrder = 33
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 99748
          mmTop = 13494
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object pVarGG5: TppVariable
          UserName = 'pVarGG5'
          AutoSize = False
          CalcOrder = 34
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 113506
          mmTop = 13494
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object pVarGG6: TppVariable
          UserName = 'pVarGG6'
          AutoSize = False
          CalcOrder = 35
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 127265
          mmTop = 13494
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object pVarGG7: TppVariable
          UserName = 'pVarGG7'
          AutoSize = False
          CalcOrder = 36
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 141023
          mmTop = 13494
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object pVarGG8: TppVariable
          UserName = 'pVarGG8'
          AutoSize = False
          CalcOrder = 37
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 154782
          mmTop = 13494
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object pVarGG9: TppVariable
          UserName = 'pVarGG9'
          AutoSize = False
          CalcOrder = 38
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 168540
          mmTop = 13494
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object pVarGG10: TppVariable
          UserName = 'pVarGG10'
          AutoSize = False
          CalcOrder = 39
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 182298
          mmTop = 13494
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object pVarGG11: TppVariable
          UserName = 'pVarGG11'
          AutoSize = False
          CalcOrder = 40
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 196057
          mmTop = 13494
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object pVarGG12: TppVariable
          UserName = 'pVarGG12'
          AutoSize = False
          CalcOrder = 41
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 210080
          mmTop = 13494
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object pVarGGT: TppVariable
          UserName = 'pVarGGT'
          AutoSize = False
          CalcOrder = 42
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 226484
          mmTop = 13494
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object pVarGGM: TppVariable
          UserName = 'pVarGGM'
          AutoSize = False
          CalcOrder = 43
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 241036
          mmTop = 13758
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object pVarGGA: TppVariable
          UserName = 'pVarGGA'
          AutoSize = False
          CalcOrder = 44
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 258763
          mmTop = 13494
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTGPM: TppVariable
          UserName = 'vTGPM'
          AutoSize = False
          CalcOrder = 45
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 241036
          mmTop = 5821
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object vTGRM: TppVariable
          UserName = 'vTGRM'
          AutoSize = False
          CalcOrder = 46
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 241036
          mmTop = 9790
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DSC_TIPOVALOR'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 17992
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'DSC_TIPOVALOR'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 4763
          mmLeft = 0
          mmTop = 1058
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLine1: TppLine
          UserName = 'OrcamentoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 8996
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppOrcamentoLabel1: TppLabel
          UserName = 'OrcamentoLabel1'
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 51858
          mmTop = 11642
          mmWidth = 5821
          BandType = 3
          GroupNo = 1
        end
        object ppMes1: TppLabel
          UserName = 'Mes1'
          Caption = 'JAN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 65881
          mmTop = 11642
          mmWidth = 5556
          BandType = 3
          GroupNo = 1
        end
        object ppMes2: TppLabel
          UserName = 'Mes2'
          Caption = 'FEV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 79640
          mmTop = 11642
          mmWidth = 5556
          BandType = 3
          GroupNo = 1
        end
        object ppMes11: TppLabel
          UserName = 'Mes11'
          Caption = 'NOV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 202936
          mmTop = 11642
          mmWidth = 6085
          BandType = 3
          GroupNo = 1
        end
        object ppMes10: TppLabel
          UserName = 'Mes10'
          Caption = 'OUT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 189442
          mmTop = 11642
          mmWidth = 5821
          BandType = 3
          GroupNo = 1
        end
        object ppMes3: TppLabel
          UserName = 'Mes3'
          Caption = 'MAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 92604
          mmTop = 11642
          mmWidth = 6350
          BandType = 3
          GroupNo = 1
        end
        object ppMes4: TppLabel
          UserName = 'Mes4'
          Caption = 'ABR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 106627
          mmTop = 11642
          mmWidth = 6085
          BandType = 3
          GroupNo = 1
        end
        object ppMes5: TppLabel
          UserName = 'Mes5'
          Caption = 'MAI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 121444
          mmTop = 11642
          mmWidth = 5027
          BandType = 3
          GroupNo = 1
        end
        object ppMes6: TppLabel
          UserName = 'Mes6'
          Caption = 'JUN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 134673
          mmTop = 11642
          mmWidth = 5556
          BandType = 3
          GroupNo = 1
        end
        object ppMes7: TppLabel
          UserName = 'Mes7'
          Caption = 'JUL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 148696
          mmTop = 11642
          mmWidth = 5292
          BandType = 3
          GroupNo = 1
        end
        object ppMes8: TppLabel
          UserName = 'Label12'
          Caption = 'AGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 161396
          mmTop = 11642
          mmWidth = 6350
          BandType = 3
          GroupNo = 1
        end
        object ppMes9: TppLabel
          UserName = 'Label13'
          Caption = 'SET'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 175948
          mmTop = 11642
          mmWidth = 5556
          BandType = 3
          GroupNo = 1
        end
        object ppMes12: TppLabel
          UserName = 'Label14'
          Caption = 'DEZ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 217488
          mmTop = 11642
          mmWidth = 5556
          BandType = 3
          GroupNo = 1
        end
        object ppOrcamentoLine2: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 17198
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 232834
          mmTop = 11642
          mmWidth = 6615
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Período Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 6879
          mmLeft = 261409
          mmTop = 9525
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Perc. Var'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 6879
          mmLeft = 275961
          mmTop = 9525
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object ppLabel17: TppLabel
          UserName = 'Label25'
          AutoSize = False
          Caption = 'Média entre: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 234950
          mmTop = 0
          mmWidth = 29104
          BandType = 3
          GroupNo = 1
        end
        object pplMesIni: TppLabel
          UserName = 'Label26'
          AutoSize = False
          Caption = 'Janeiro '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 264584
          mmTop = 0
          mmWidth = 19050
          BandType = 3
          GroupNo = 1
        end
        object pplMesFim: TppLabel
          UserName = 'Label27'
          AutoSize = False
          Caption = 'Dezembro '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 264584
          mmTop = 3704
          mmWidth = 19050
          BandType = 3
          GroupNo = 1
        end
        object ppLabel16: TppLabel
          UserName = 'Label24'
          Caption = 'Média Mensal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 6879
          mmLeft = 246328
          mmTop = 9260
          mmWidth = 9525
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 13494
        mmPrintPosition = 0
        object ppOrcamentoLabel18: TppLabel
          UserName = 'Label19'
          Caption = 'TOTAL GERAL DE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 3440
          mmTop = 2646
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
        object ppOrcamentoLabel19: TppLabel
          UserName = 'Label20'
          Caption = 'PREV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 50271
          mmTop = 1058
          mmWidth = 7408
          BandType = 5
          GroupNo = 0
        end
        object ppOrcamentoLabel20: TppLabel
          UserName = 'Label201'
          Caption = 'REAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 50271
          mmTop = 4763
          mmWidth = 7408
          BandType = 5
          GroupNo = 0
        end
        object vTP1: TppVariable
          UserName = 'vTP1'
          AutoSize = False
          CalcOrder = 0
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 58473
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTR1: TppVariable
          UserName = 'vTR1'
          AutoSize = False
          CalcOrder = 1
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 58473
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTP2: TppVariable
          UserName = 'vTP2'
          AutoSize = False
          CalcOrder = 2
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 72231
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTR2: TppVariable
          UserName = 'vTR2'
          AutoSize = False
          CalcOrder = 3
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 72231
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTP3: TppVariable
          UserName = 'vTP3'
          AutoSize = False
          CalcOrder = 4
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 85990
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTR3: TppVariable
          UserName = 'vTR3'
          AutoSize = False
          CalcOrder = 5
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 85990
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTP4: TppVariable
          UserName = 'vTP4'
          AutoSize = False
          CalcOrder = 6
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 99748
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTR4: TppVariable
          UserName = 'vTR4'
          AutoSize = False
          CalcOrder = 7
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 99748
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTP5: TppVariable
          UserName = 'vTP5'
          AutoSize = False
          CalcOrder = 8
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 113506
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTR5: TppVariable
          UserName = 'vTR5'
          AutoSize = False
          CalcOrder = 9
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 113506
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTP6: TppVariable
          UserName = 'vTP6'
          AutoSize = False
          CalcOrder = 10
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTR6: TppVariable
          UserName = 'vTR6'
          AutoSize = False
          CalcOrder = 11
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTP7: TppVariable
          UserName = 'vTP7'
          AutoSize = False
          CalcOrder = 12
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 141023
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTR7: TppVariable
          UserName = 'vTR7'
          AutoSize = False
          CalcOrder = 13
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 141023
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTP8: TppVariable
          UserName = 'vTP8'
          AutoSize = False
          CalcOrder = 14
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 154782
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTR8: TppVariable
          UserName = 'vTR8'
          AutoSize = False
          CalcOrder = 15
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 154782
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTP9: TppVariable
          UserName = 'vTP9'
          AutoSize = False
          CalcOrder = 16
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 168540
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTR9: TppVariable
          UserName = 'vTR9'
          AutoSize = False
          CalcOrder = 17
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 168540
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTP10: TppVariable
          UserName = 'vTP10'
          AutoSize = False
          CalcOrder = 18
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 182298
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTR10: TppVariable
          UserName = 'vTR10'
          AutoSize = False
          CalcOrder = 19
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 182298
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTP11: TppVariable
          UserName = 'vTP11'
          AutoSize = False
          CalcOrder = 20
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 196057
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTR11: TppVariable
          UserName = 'vTR11'
          AutoSize = False
          CalcOrder = 21
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 196057
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTP12: TppVariable
          UserName = 'vTP12'
          AutoSize = False
          CalcOrder = 22
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 210080
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTR12: TppVariable
          UserName = 'vTR12'
          AutoSize = False
          CalcOrder = 23
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 210080
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vTPTot: TppVariable
          UserName = 'vTPTot'
          AutoSize = False
          CalcOrder = 24
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 223309
          mmTop = 1323
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object vTRTot: TppVariable
          UserName = 'vTRTot'
          AutoSize = False
          CalcOrder = 25
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 223309
          mmTop = 4763
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object vTPAnt: TppVariable
          UserName = 'vTPAnt'
          AutoSize = False
          CalcOrder = 26
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 256911
          mmTop = 1323
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object vTRAnt: TppVariable
          UserName = 'vTRAnt'
          AutoSize = False
          CalcOrder = 27
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 256911
          mmTop = 4763
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'DSC_TIPOVALOR'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 29104
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppOrcamentoLine7: TppLine
          UserName = 'OrcamentoLine7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppOrcamentoLine8: TppLine
          UserName = 'OrcamentoLine8'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 12700
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object vTPVar: TppVariable
          UserName = 'vTPVar'
          AutoSize = False
          CalcOrder = 28
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 274109
          mmTop = 1323
          mmWidth = 10319
          BandType = 5
          GroupNo = 0
        end
        object vTRVar: TppVariable
          UserName = 'vTRVar'
          AutoSize = False
          CalcOrder = 29
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 274109
          mmTop = 4763
          mmWidth = 10319
          BandType = 5
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label22'
          Caption = '% Var'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 50006
          mmTop = 8467
          mmWidth = 7938
          BandType = 5
          GroupNo = 1
        end
        object pVarG1: TppVariable
          UserName = 'pVarG1'
          AutoSize = False
          CalcOrder = 30
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 58473
          mmTop = 8467
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object pVarG2: TppVariable
          UserName = 'pVarG2'
          AutoSize = False
          CalcOrder = 31
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 72231
          mmTop = 8467
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object pVarG3: TppVariable
          UserName = 'pVarG3'
          AutoSize = False
          CalcOrder = 32
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 85990
          mmTop = 8467
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object pVarG4: TppVariable
          UserName = 'pVarG4'
          AutoSize = False
          CalcOrder = 33
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 99748
          mmTop = 8467
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object pVarG5: TppVariable
          UserName = 'pVarG5'
          AutoSize = False
          CalcOrder = 34
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 113506
          mmTop = 8467
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object pVarG6: TppVariable
          UserName = 'pVarG6'
          AutoSize = False
          CalcOrder = 35
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 127265
          mmTop = 8467
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object pVarG7: TppVariable
          UserName = 'pVarG7'
          AutoSize = False
          CalcOrder = 36
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 141023
          mmTop = 8467
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object pVarG8: TppVariable
          UserName = 'pVarG8'
          AutoSize = False
          CalcOrder = 37
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 154782
          mmTop = 8467
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object pVarG9: TppVariable
          UserName = 'pVarG9'
          AutoSize = False
          CalcOrder = 38
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 168540
          mmTop = 8467
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object pVarG10: TppVariable
          UserName = 'pVarG10'
          AutoSize = False
          CalcOrder = 39
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 182298
          mmTop = 8467
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object pVarG11: TppVariable
          UserName = 'pVarG11'
          AutoSize = False
          CalcOrder = 40
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 196057
          mmTop = 8467
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object pVarG12: TppVariable
          UserName = 'pVarG12'
          AutoSize = False
          CalcOrder = 41
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 210080
          mmTop = 8467
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object pVarGT: TppVariable
          UserName = 'pVarGT'
          AutoSize = False
          CalcOrder = 42
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 226484
          mmTop = 8467
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object pVarGM: TppVariable
          UserName = 'pVarGM'
          AutoSize = False
          CalcOrder = 43
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 241036
          mmTop = 8731
          mmWidth = 14817
          BandType = 5
          GroupNo = 1
        end
        object pVarGA: TppVariable
          UserName = 'pVarGA'
          AutoSize = False
          CalcOrder = 44
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 258763
          mmTop = 8467
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object vTPM: TppVariable
          UserName = 'vTPM'
          AutoSize = False
          CalcOrder = 45
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 241036
          mmTop = 1323
          mmWidth = 14817
          BandType = 5
          GroupNo = 1
        end
        object vTRM: TppVariable
          UserName = 'vTRM'
          AutoSize = False
          CalcOrder = 46
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 241036
          mmTop = 4763
          mmWidth = 14817
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGrpQuebra: TppGroup
      BreakName = 'DSC_CCUSTO'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      UserName = 'GrpQuebra'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppOrcamentoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDscQuebra: TppDBText
          UserName = 'DscQuebra'
          DataField = 'DSC_CCUSTO'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 0
          mmWidth = 46831
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLine3: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 3704
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppOrcamentoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 14023
        mmPrintPosition = 0
        object ppOrcamentoLine4: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppOrcamentoLine6: TppLine
          UserName = 'OrcamentoLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 13229
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppOrcamentoLabel15: TppLabel
          UserName = 'Label16'
          Caption = 'T O T A L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 30692
          mmTop = 3175
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object ppOrcamentoLabel16: TppLabel
          UserName = 'Label17'
          Caption = 'REAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 50006
          mmTop = 4763
          mmWidth = 7673
          BandType = 5
          GroupNo = 0
        end
        object ppOrcamentoLabel17: TppLabel
          UserName = 'Label18'
          Caption = 'PREV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 50271
          mmTop = 1058
          mmWidth = 7408
          BandType = 5
          GroupNo = 0
        end
        object vP1: TppVariable
          UserName = 'vP1'
          AutoSize = False
          CalcOrder = 0
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 58473
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vR1: TppVariable
          UserName = 'vR1'
          AutoSize = False
          CalcOrder = 1
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 58473
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vP2: TppVariable
          UserName = 'vP2'
          AutoSize = False
          CalcOrder = 2
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 72231
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vR2: TppVariable
          UserName = 'vR2'
          AutoSize = False
          CalcOrder = 3
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 72231
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vP3: TppVariable
          UserName = 'vP3'
          AutoSize = False
          CalcOrder = 4
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 85990
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vR3: TppVariable
          UserName = 'vR3'
          AutoSize = False
          CalcOrder = 5
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 85990
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vP4: TppVariable
          UserName = 'vP4'
          AutoSize = False
          CalcOrder = 6
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 99748
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vR4: TppVariable
          UserName = 'vR4'
          AutoSize = False
          CalcOrder = 7
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 99748
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vP5: TppVariable
          UserName = 'vP5'
          AutoSize = False
          CalcOrder = 8
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 113506
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vR5: TppVariable
          UserName = 'vR5'
          AutoSize = False
          CalcOrder = 9
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 113506
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vP6: TppVariable
          UserName = 'vP6'
          AutoSize = False
          CalcOrder = 10
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vR6: TppVariable
          UserName = 'vR6'
          AutoSize = False
          CalcOrder = 11
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vP7: TppVariable
          UserName = 'vP7'
          AutoSize = False
          CalcOrder = 12
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 141023
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vR7: TppVariable
          UserName = 'vR7'
          AutoSize = False
          CalcOrder = 13
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 141023
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vP8: TppVariable
          UserName = 'vP8'
          AutoSize = False
          CalcOrder = 14
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 154782
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vR8: TppVariable
          UserName = 'vR8'
          AutoSize = False
          CalcOrder = 15
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 154782
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vP9: TppVariable
          UserName = 'vP9'
          AutoSize = False
          CalcOrder = 16
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 168540
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vR9: TppVariable
          UserName = 'vR9'
          AutoSize = False
          CalcOrder = 17
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 168540
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vP10: TppVariable
          UserName = 'vP10'
          AutoSize = False
          CalcOrder = 18
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 182298
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vR10: TppVariable
          UserName = 'vR10'
          AutoSize = False
          CalcOrder = 19
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 182298
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vP11: TppVariable
          UserName = 'vP11'
          AutoSize = False
          CalcOrder = 20
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 196057
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vR11: TppVariable
          UserName = 'vR11'
          AutoSize = False
          CalcOrder = 21
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 196057
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vP12: TppVariable
          UserName = 'vP12'
          AutoSize = False
          CalcOrder = 22
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 210080
          mmTop = 1323
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vR12: TppVariable
          UserName = 'vR12'
          AutoSize = False
          CalcOrder = 23
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 210080
          mmTop = 4763
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object vPTot: TppVariable
          UserName = 'vPTot'
          AutoSize = False
          CalcOrder = 24
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 223309
          mmTop = 1323
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object vRTot: TppVariable
          UserName = 'vRTot'
          AutoSize = False
          CalcOrder = 25
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 223309
          mmTop = 4763
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object vPAnt: TppVariable
          UserName = 'vPAnt'
          AutoSize = False
          CalcOrder = 26
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 256911
          mmTop = 1323
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object vRAnt: TppVariable
          UserName = 'vRAnt'
          AutoSize = False
          CalcOrder = 27
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 256911
          mmTop = 4763
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object vPVar: TppVariable
          UserName = 'vPVar'
          AutoSize = False
          CalcOrder = 28
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 274109
          mmTop = 1323
          mmWidth = 10319
          BandType = 5
          GroupNo = 1
        end
        object vRVar: TppVariable
          UserName = 'vRVar'
          AutoSize = False
          CalcOrder = 29
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 274109
          mmTop = 4763
          mmWidth = 10319
          BandType = 5
          GroupNo = 1
        end
        object vPM: TppVariable
          UserName = 'vPM'
          AutoSize = False
          CalcOrder = 30
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 241036
          mmTop = 1323
          mmWidth = 14817
          BandType = 5
          GroupNo = 2
        end
        object vRM: TppVariable
          UserName = 'vRM'
          AutoSize = False
          CalcOrder = 31
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 241036
          mmTop = 5292
          mmWidth = 14817
          BandType = 5
          GroupNo = 2
        end
        object ppLabel13: TppLabel
          UserName = 'Label21'
          Caption = '% Var'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 50006
          mmTop = 8731
          mmWidth = 7938
          BandType = 5
          GroupNo = 2
        end
        object pVarT1: TppVariable
          UserName = 'pVarT1'
          AutoSize = False
          CalcOrder = 32
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 58473
          mmTop = 8731
          mmWidth = 12965
          BandType = 5
          GroupNo = 2
        end
        object pVarT2: TppVariable
          UserName = 'pVarT2'
          AutoSize = False
          CalcOrder = 33
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 72231
          mmTop = 8731
          mmWidth = 12965
          BandType = 5
          GroupNo = 2
        end
        object pVarT3: TppVariable
          UserName = 'pVarT3'
          AutoSize = False
          CalcOrder = 34
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 85990
          mmTop = 8731
          mmWidth = 12965
          BandType = 5
          GroupNo = 2
        end
        object pVarT4: TppVariable
          UserName = 'pVarT4'
          AutoSize = False
          CalcOrder = 35
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 99748
          mmTop = 8731
          mmWidth = 12965
          BandType = 5
          GroupNo = 2
        end
        object pVarT5: TppVariable
          UserName = 'pVarT5'
          AutoSize = False
          CalcOrder = 36
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 113506
          mmTop = 8731
          mmWidth = 12965
          BandType = 5
          GroupNo = 2
        end
        object pVarT6: TppVariable
          UserName = 'pVarT6'
          AutoSize = False
          CalcOrder = 37
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 127265
          mmTop = 8731
          mmWidth = 12965
          BandType = 5
          GroupNo = 2
        end
        object pVarT7: TppVariable
          UserName = 'pVarT7'
          AutoSize = False
          CalcOrder = 38
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 141023
          mmTop = 8731
          mmWidth = 12965
          BandType = 5
          GroupNo = 2
        end
        object pVarT8: TppVariable
          UserName = 'pVarT8'
          AutoSize = False
          CalcOrder = 39
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 154782
          mmTop = 8731
          mmWidth = 12965
          BandType = 5
          GroupNo = 2
        end
        object pVarT9: TppVariable
          UserName = 'pVarT9'
          AutoSize = False
          CalcOrder = 40
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 168540
          mmTop = 8731
          mmWidth = 12965
          BandType = 5
          GroupNo = 2
        end
        object pVarT10: TppVariable
          UserName = 'pVarT10'
          AutoSize = False
          CalcOrder = 41
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 182298
          mmTop = 8731
          mmWidth = 12965
          BandType = 5
          GroupNo = 2
        end
        object pVarT11: TppVariable
          UserName = 'pVarT11'
          AutoSize = False
          CalcOrder = 42
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 196057
          mmTop = 8731
          mmWidth = 12965
          BandType = 5
          GroupNo = 2
        end
        object pVarT12: TppVariable
          UserName = 'pVarT12'
          AutoSize = False
          CalcOrder = 43
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 210080
          mmTop = 8731
          mmWidth = 12965
          BandType = 5
          GroupNo = 2
        end
        object pVarTT: TppVariable
          UserName = 'pVarTT'
          AutoSize = False
          CalcOrder = 44
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 226484
          mmTop = 8731
          mmWidth = 12965
          BandType = 5
          GroupNo = 2
        end
        object pVarTM: TppVariable
          UserName = 'pVarTM'
          AutoSize = False
          CalcOrder = 45
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 241036
          mmTop = 8996
          mmWidth = 14817
          BandType = 5
          GroupNo = 2
        end
        object pVarTA: TppVariable
          UserName = 'pVarTA'
          AutoSize = False
          CalcOrder = 46
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 258763
          mmTop = 8731
          mmWidth = 12965
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDINDICADOR'
      DataPipeline = ppl
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppsCor2: TppShape
          OnPrint = ppsCorPrint
          UserName = 'ppsCor2'
          Brush.Color = clLime
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          StretchWithParent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 3
        end
        object ppLabel12: TppLabel
          UserName = 'Label15'
          Caption = '% Var'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 50006
          mmTop = 529
          mmWidth = 7673
          BandType = 5
          GroupNo = 3
        end
        object pVar1: TppVariable
          UserName = 'pVar1'
          AutoSize = False
          CalcOrder = 0
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 58473
          mmTop = 529
          mmWidth = 12965
          BandType = 5
          GroupNo = 3
        end
        object pVar2: TppVariable
          UserName = 'pVar2'
          AutoSize = False
          CalcOrder = 1
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 72231
          mmTop = 529
          mmWidth = 12965
          BandType = 5
          GroupNo = 3
        end
        object pVar3: TppVariable
          UserName = 'pVar3'
          AutoSize = False
          CalcOrder = 2
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 85990
          mmTop = 529
          mmWidth = 12965
          BandType = 5
          GroupNo = 3
        end
        object pVar4: TppVariable
          UserName = 'pVar4'
          AutoSize = False
          CalcOrder = 3
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 99748
          mmTop = 529
          mmWidth = 12965
          BandType = 5
          GroupNo = 3
        end
        object pVar5: TppVariable
          UserName = 'pVar5'
          AutoSize = False
          CalcOrder = 4
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 113506
          mmTop = 529
          mmWidth = 12965
          BandType = 5
          GroupNo = 3
        end
        object pVar6: TppVariable
          UserName = 'pVar6'
          AutoSize = False
          CalcOrder = 5
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 529
          mmWidth = 12965
          BandType = 5
          GroupNo = 3
        end
        object pVar7: TppVariable
          UserName = 'pVar7'
          AutoSize = False
          CalcOrder = 6
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 141023
          mmTop = 529
          mmWidth = 12965
          BandType = 5
          GroupNo = 3
        end
        object pVar8: TppVariable
          UserName = 'pVar8'
          AutoSize = False
          CalcOrder = 7
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 154782
          mmTop = 529
          mmWidth = 12965
          BandType = 5
          GroupNo = 3
        end
        object pVar9: TppVariable
          UserName = 'pVar9'
          AutoSize = False
          CalcOrder = 8
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 168540
          mmTop = 529
          mmWidth = 12965
          BandType = 5
          GroupNo = 3
        end
        object pVar10: TppVariable
          UserName = 'pVar10'
          AutoSize = False
          CalcOrder = 9
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 182298
          mmTop = 529
          mmWidth = 12965
          BandType = 5
          GroupNo = 3
        end
        object pVar11: TppVariable
          UserName = 'pVar11'
          AutoSize = False
          CalcOrder = 10
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 196057
          mmTop = 529
          mmWidth = 12965
          BandType = 5
          GroupNo = 3
        end
        object pVar12: TppVariable
          UserName = 'pVar12'
          AutoSize = False
          CalcOrder = 11
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 210079
          mmTop = 529
          mmWidth = 12965
          BandType = 5
          GroupNo = 3
        end
        object pVarT: TppVariable
          UserName = 'pVarT'
          AutoSize = False
          CalcOrder = 12
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 226485
          mmTop = 529
          mmWidth = 12965
          BandType = 5
          GroupNo = 3
        end
        object pVarM: TppVariable
          UserName = 'pVarM'
          AutoSize = False
          CalcOrder = 13
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 241036
          mmTop = 529
          mmWidth = 14817
          BandType = 5
          GroupNo = 3
        end
        object pVarA: TppVariable
          UserName = 'pVarA'
          AutoSize = False
          CalcOrder = 14
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 258763
          mmTop = 529
          mmWidth = 12965
          BandType = 5
          GroupNo = 3
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060D54726156617250726F6772616D094368696C645479706502110B50726F
        6772616D4E616D6506095661726961626C65730B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365064470726F6365647572652056
        61726961626C65733B0D0A7661720D0A20202073447363446574616C6865203A
        20537472696E673B0D0A626567696E0D0A0D0A656E643B0D0A0001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D65061044657461696C
        41667465725072696E740B50726F6772616D54797065070B747450726F636564
        75726506536F757263650C970F000070726F6365647572652044657461696C41
        667465725072696E743B0D0A626567696E0D0A20202069662070704473634465
        74616C68652E446174614669656C64203D20274453435F494E44494341444F52
        27207468656E0D0A202020202020202073447363446574616C6865203A3D2070
        706C5B274453435F494E44494341444F52275D0D0A202020656C736520734473
        63446574616C6865203A3D2070706C5B274453435F43435553544F275D3B0D0A
        2020200D0A20202069662070706C5B274453435F5449504F4C414E4341275D20
        3D20275052455627207468656E20626567696E0D0A2020202020207650312E41
        73457874656E646564203A3D207650312E4173457874656E646564202B207070
        6C5B27564C523031275D3B0D0A2020202020207650322E4173457874656E6465
        64203A3D207650322E4173457874656E646564202B2070706C5B27564C523032
        275D3B0D0A2020202020207650332E4173457874656E646564203A3D20765033
        2E4173457874656E646564202B2070706C5B27564C523033275D3B0D0A202020
        2020207650342E4173457874656E646564203A3D207650342E4173457874656E
        646564202B2070706C5B27564C523034275D3B0D0A2020202020207650352E41
        73457874656E646564203A3D207650352E4173457874656E646564202B207070
        6C5B27564C523035275D3B0D0A2020202020207650362E4173457874656E6465
        64203A3D207650362E4173457874656E646564202B2070706C5B27564C523036
        275D3B0D0A2020202020207650372E4173457874656E646564203A3D20765037
        2E4173457874656E646564202B2070706C5B27564C523037275D3B0D0A202020
        2020207650382E4173457874656E646564203A3D207650382E4173457874656E
        646564202B2070706C5B27564C523038275D3B0D0A2020202020207650392E41
        73457874656E646564203A3D207650392E4173457874656E646564202B207070
        6C5B27564C523039275D3B0D0A202020202020765031302E4173457874656E64
        6564203A3D20765031302E4173457874656E646564202B2070706C5B27564C52
        3130275D3B0D0A202020202020765031312E4173457874656E646564203A3D20
        765031312E4173457874656E646564202B2070706C5B27564C523131275D3B0D
        0A202020202020765031322E4173457874656E646564203A3D20765031322E41
        73457874656E646564202B2070706C5B27564C523132275D3B0D0A2020202020
        207650416E742E4173457874656E646564203A3D207650416E742E4173457874
        656E646564202B2070706C5B27564C52414E54275D3B2020202020200D0A2020
        202020207650546F742E4173457874656E646564203A3D207650546F742E4173
        457874656E646564202B2076546F742E4173457874656E6465643B0D0A202020
        20202076504D2E4173457874656E6465642020203A3D2076504D2E4173457874
        656E646564202B2070706C5B27564C524D45444941275D3B2020202020202020
        0D0A0D0A20202020202070566172312E4173457874656E64656420203A3D2070
        706C5B27564C523031275D3B0D0A20202020202070566172322E417345787465
        6E64656420203A3D2070706C5B27564C523032275D3B0D0A2020202020207056
        6172332E4173457874656E64656420203A3D2070706C5B27564C523033275D3B
        0D0A20202020202070566172342E4173457874656E64656420203A3D2070706C
        5B27564C523034275D3B0D0A20202020202070566172352E4173457874656E64
        656420203A3D2070706C5B27564C523035275D3B0D0A20202020202070566172
        362E4173457874656E64656420203A3D2070706C5B27564C523036275D3B0D0A
        20202020202070566172372E4173457874656E64656420203A3D2070706C5B27
        564C523037275D3B0D0A20202020202070566172382E4173457874656E646564
        20203A3D2070706C5B27564C523038275D3B0D0A20202020202070566172392E
        4173457874656E64656420203A3D2070706C5B27564C523039275D3B0D0A2020
        202020207056617231302E4173457874656E646564203A3D2070706C5B27564C
        523130275D3B2020202020200D0A2020202020207056617231312E4173457874
        656E646564203A3D2070706C5B27564C523131275D3B2020202020200D0A2020
        202020207056617231322E4173457874656E646564203A3D2070706C5B27564C
        523132275D3B2020202020202020202020200D0A20202020202070566172542E
        4173457874656E64656420203A3D2076546F742E4173457874656E6465643B20
        20202020202020202020200D0A20202020202070566172412E4173457874656E
        64656420203A3D2070706C5B27564C52414E54275D3B20202020202020202020
        20202020202020200D0A202020202020705661724D2E4173457874656E646564
        20203A3D2070706C5B27564C524D45444941275D3B2020202020202020202020
        202020202020202020202020200D0A2020202020200D0A202020656E6420656C
        736520626567696E0D0A2020202020207652312E4173457874656E646564203A
        3D207652312E4173457874656E646564202B2070706C5B27564C523031275D3B
        0D0A2020202020207652322E4173457874656E646564203A3D207652322E4173
        457874656E646564202B2070706C5B27564C523032275D3B0D0A202020202020
        7652332E4173457874656E646564203A3D207652332E4173457874656E646564
        202B2070706C5B27564C523033275D3B0D0A2020202020207652342E41734578
        74656E646564203A3D207652342E4173457874656E646564202B2070706C5B27
        564C523034275D3B0D0A2020202020207652352E4173457874656E646564203A
        3D207652352E4173457874656E646564202B2070706C5B27564C523035275D3B
        0D0A2020202020207652362E4173457874656E646564203A3D207652362E4173
        457874656E646564202B2070706C5B27564C523036275D3B0D0A202020202020
        7652372E4173457874656E646564203A3D207652372E4173457874656E646564
        202B2070706C5B27564C523037275D3B0D0A2020202020207652382E41734578
        74656E646564203A3D207652382E4173457874656E646564202B2070706C5B27
        564C523038275D3B0D0A2020202020207652392E4173457874656E646564203A
        3D207652392E4173457874656E646564202B2070706C5B27564C523039275D3B
        0D0A202020202020765231302E4173457874656E646564203A3D20765231302E
        4173457874656E646564202B2070706C5B27564C523130275D3B0D0A20202020
        2020765231312E4173457874656E646564203A3D20765231312E417345787465
        6E646564202B2070706C5B27564C523131275D3B0D0A20202020202076523132
        2E4173457874656E646564203A3D20765231322E4173457874656E646564202B
        2070706C5B27564C523132275D3B0D0A2020202020207652416E742E41734578
        74656E646564203A3D207652416E742E4173457874656E646564202B2070706C
        5B27564C52414E54275D3B2020202020202020202020200D0A20202020202076
        524D2E4173457874656E6465642020203A3D2076524D2E4173457874656E6465
        642020202B2070706C5B27564C524D45444941275D3B20202020202020202020
        20202020202020200D0A2020202020207652546F742E4173457874656E646564
        203A3D207652546F742E4173457874656E646564202B2076546F742E41734578
        74656E6465643B0D0A2020202020200D0A20202020202070566172312E417345
        7874656E64656420203A3D20313030202D20282870706C5B27564C523031275D
        202A2031303029202F2070566172312E4173457874656E646564293B0D0A2020
        2020202070566172322E4173457874656E64656420203A3D20313030202D2028
        2870706C5B27564C523032275D202A2031303029202F2070566172322E417345
        7874656E646564293B0D0A20202020202070566172332E4173457874656E6465
        6420203A3D20313030202D20282870706C5B27564C523033275D202A20313030
        29202F2070566172332E4173457874656E646564293B0D0A2020202020207056
        6172342E4173457874656E64656420203A3D20313030202D20282870706C5B27
        564C523034275D202A2031303029202F2070566172342E4173457874656E6465
        64293B0D0A20202020202070566172352E4173457874656E64656420203A3D20
        313030202D20282870706C5B27564C523035275D202A2031303029202F207056
        6172352E4173457874656E646564293B0D0A20202020202070566172362E4173
        457874656E64656420203A3D20313030202D20282870706C5B27564C52303627
        5D202A2031303029202F2070566172362E4173457874656E646564293B202020
        2020200D0A20202020202070566172372E4173457874656E64656420203A3D20
        313030202D20282870706C5B27564C523037275D202A2031303029202F207056
        6172372E4173457874656E646564293B0D0A20202020202070566172382E4173
        457874656E64656420203A3D20313030202D20282870706C5B27564C52303827
        5D202A2031303029202F2070566172382E4173457874656E646564293B0D0A20
        202020202070566172392E4173457874656E64656420203A3D20313030202D20
        282870706C5B27564C523039275D202A2031303029202F2070566172392E4173
        457874656E646564293B0D0A2020202020207056617231302E4173457874656E
        646564203A3D20313030202D20282870706C5B27564C523130275D202A203130
        3029202F207056617231302E4173457874656E646564293B0D0A202020202020
        7056617231312E4173457874656E646564203A3D20313030202D20282870706C
        5B27564C523131275D202A2031303029202F207056617231312E417345787465
        6E646564293B2020202020200D0A2020202020207056617231322E4173457874
        656E646564203A3D20313030202D20282870706C5B27564C523132275D202A20
        31303029202F207056617231322E4173457874656E646564293B202020202020
        0D0A20202020202070566172542E4173457874656E64656420203A3D20313030
        202D20282876546F742E4173457874656E646564202A2031303029202F207056
        6172542E4173457874656E646564293B2020202020200D0A2020202020207056
        6172412E4173457874656E64656420203A3D20313030202D20282870706C5B27
        564C52414E54275D202A2031303029202F2070566172412E4173457874656E64
        6564293B2020202020202020202020200D0A202020202020705661724D2E4173
        457874656E64656420203A3D20313030202D20282870706C5B27564C524D4544
        4941275D202A2031303029202F20705661724D2E4173457874656E646564293B
        2020202020202020202020202020202020200D0A202020656E643B2020200D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65060644657461696C09457665
        6E744E616D65060A41667465725072696E74074576656E74494402170001060F
        5472614576656E7448616E646C65720B50726F6772616D4E616D650611446574
        61696C4265666F72655072696E740B50726F6772616D54797065070B74745072
        6F63656475726506536F757263650CE302000070726F63656475726520446574
        61696C4265666F72655072696E743B0D0A626567696E0D0A2020206966207070
        447363446574616C68652E446174614669656C64203D20274453435F494E4449
        4341444F5227207468656E20626567696E2020200D0A20202020206966207344
        7363446574616C6865203D2070706C5B274453435F494E44494341444F52275D
        207468656E0D0A202020202020202020207070447363446574616C68652E5669
        7369626C65203A3D2046616C73650D0A2020202020656C736520707044736344
        6574616C68652E56697369626C65203A3D20547275653B0D0A202020656E6420
        656C736520626567696E0D0A202020202069662073447363446574616C686520
        3D2070706C5B274453435F43435553544F275D207468656E0D0A202020202020
        202020207070447363446574616C68652E56697369626C65203A3D2046616C73
        650D0A2020202020656C7365207070447363446574616C68652E56697369626C
        65203A3D20547275653B0D0A202020656E643B20200D0A2020200D0A20202076
        546F742E4173457874656E646564203A3D2070706C5B27564C523031275D202B
        2070706C5B27564C523032275D202B2070706C5B27564C523033275D202B0D0A
        2020202020202020202020202020202020202020202070706C5B27564C523034
        275D202B2070706C5B27564C523035275D202B2070706C5B27564C523036275D
        202B0D0A2020202020202020202020202020202020202020202070706C5B2756
        4C523037275D202B2070706C5B27564C523038275D202B2070706C5B27564C52
        3039275D202B0D0A202020202020202020202020202020202020202020207070
        6C5B27564C523130275D202B2070706C5B27564C523131275D202B2070706C5B
        27564C523132275D3B0D0A202020765661722E4173457874656E646564203A3D
        202831202D202876546F742E4173457874656E646564202F2070706C5B27564C
        52414E54275D29202F203130303B0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65060644657461696C094576656E744E616D65060B4265666F72655072
        696E74074576656E74494402180001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D6506234F7263616D656E746F47726F7570466F6F74
        657242616E643141667465725072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F757263650C620A000070726F63656475726520
        4F7263616D656E746F47726F7570466F6F74657242616E643141667465725072
        696E743B0D0A626567696E0D0A202020765450312E4173457874656E64656420
        3A3D20765450312E4173457874656E646564202B207650312E4173457874656E
        6465643B0D0A202020765452312E4173457874656E646564203A3D2076545231
        2E4173457874656E646564202B207652312E4173457874656E6465643B0D0A20
        2020765450322E4173457874656E646564203A3D20765450322E417345787465
        6E646564202B207650322E4173457874656E6465643B0D0A202020765452322E
        4173457874656E646564203A3D20765452322E4173457874656E646564202B20
        7652322E4173457874656E6465643B0D0A202020765450332E4173457874656E
        646564203A3D20765450332E4173457874656E646564202B207650332E417345
        7874656E6465643B0D0A202020765452332E4173457874656E646564203A3D20
        765452332E4173457874656E646564202B207652332E4173457874656E646564
        3B0D0A202020765450342E4173457874656E646564203A3D20765450342E4173
        457874656E646564202B207650342E4173457874656E6465643B0D0A20202076
        5452342E4173457874656E646564203A3D20765452342E4173457874656E6465
        64202B207652342E4173457874656E6465643B0D0A202020765450352E417345
        7874656E646564203A3D20765450352E4173457874656E646564202B20765035
        2E4173457874656E6465643B0D0A202020765452352E4173457874656E646564
        203A3D20765452352E4173457874656E646564202B207652352E417345787465
        6E6465643B0D0A202020765450362E4173457874656E646564203A3D20765450
        362E4173457874656E646564202B207650362E4173457874656E6465643B0D0A
        202020765452362E4173457874656E646564203A3D20765452362E4173457874
        656E646564202B207652362E4173457874656E6465643B0D0A20202076545037
        2E4173457874656E646564203A3D20765450372E4173457874656E646564202B
        207650372E4173457874656E6465643B0D0A202020765452372E417345787465
        6E646564203A3D20765452372E4173457874656E646564202B207652372E4173
        457874656E6465643B0D0A202020765450382E4173457874656E646564203A3D
        20765450382E4173457874656E646564202B207650382E4173457874656E6465
        643B0D0A202020765452382E4173457874656E646564203A3D20765452382E41
        73457874656E646564202B207652382E4173457874656E6465643B0D0A202020
        765450392E4173457874656E646564203A3D20765450392E4173457874656E64
        6564202B207650392E4173457874656E6465643B0D0A202020765452392E4173
        457874656E646564203A3D20765452392E4173457874656E646564202B207652
        392E4173457874656E6465643B0D0A20202076545031302E4173457874656E64
        6564203A3D2076545031302E4173457874656E646564202B20765031302E4173
        457874656E6465643B0D0A20202076545231302E4173457874656E646564203A
        3D2076545231302E4173457874656E646564202B20765231302E417345787465
        6E6465643B0D0A20202076545031312E4173457874656E646564203A3D207654
        5031312E4173457874656E646564202B20765031312E4173457874656E646564
        3B0D0A20202076545231312E4173457874656E646564203A3D2076545231312E
        4173457874656E646564202B20765231312E4173457874656E6465643B0D0A20
        202076545031322E4173457874656E646564203A3D2076545031322E41734578
        74656E646564202B20765031322E4173457874656E6465643B0D0A2020207654
        5231322E4173457874656E646564203A3D2076545231322E4173457874656E64
        6564202B20765231322E4173457874656E6465643B0D0A202020765450416E74
        2E4173457874656E646564203A3D20765450416E742E4173457874656E646564
        202B207650416E742E4173457874656E6465643B2020200D0A20202076545241
        6E742E4173457874656E646564203A3D20765452416E742E4173457874656E64
        6564202B207652416E742E4173457874656E6465643B2020202020200D0A2020
        20765450546F742E4173457874656E646564203A3D20765450546F742E417345
        7874656E646564202B207650546F742E4173457874656E6465643B2020200D0A
        202020765452546F742E4173457874656E646564203A3D20765452546F742E41
        73457874656E646564202B207652546F742E4173457874656E6465643B202020
        200D0A2020207654504D2E4173457874656E6465642020203A3D207654504D2E
        4173457874656E646564202B2076504D2E4173457874656E6465643B2020200D
        0A2020207654524D2E4173457874656E6465642020203A3D207654524D2E4173
        457874656E646564202B2076524D2E4173457874656E6465643B20200D0A2020
        200D0A20202073447363446574616C6865202020203A3D2027273B0D0A202020
        7650312E4173457874656E646564203A3D20303B0D0A2020207652312E417345
        7874656E646564203A3D20303B0D0A2020207650322E4173457874656E646564
        203A3D20303B0D0A2020207652322E4173457874656E646564203A3D20303B0D
        0A2020207650332E4173457874656E646564203A3D20303B0D0A202020765233
        2E4173457874656E646564203A3D20303B2020200D0A2020207650342E417345
        7874656E646564203A3D20303B0D0A2020207652342E4173457874656E646564
        203A3D20303B0D0A2020207650352E4173457874656E646564203A3D20303B0D
        0A2020207652352E4173457874656E646564203A3D20303B0D0A202020765036
        2E4173457874656E646564203A3D20303B0D0A2020207652362E417345787465
        6E646564203A3D20303B2020200D0A2020207650372E4173457874656E646564
        203A3D20303B0D0A2020207652372E4173457874656E646564203A3D20303B0D
        0A2020207650382E4173457874656E646564203A3D20303B0D0A202020765238
        2E4173457874656E646564203A3D20303B0D0A2020207650392E417345787465
        6E646564203A3D20303B0D0A2020207652392E4173457874656E646564203A3D
        20303B2020200D0A202020765031302E4173457874656E646564203A3D20303B
        0D0A202020765231302E4173457874656E646564203A3D20303B0D0A20202076
        5031312E4173457874656E646564203A3D20303B0D0A202020765231312E4173
        457874656E646564203A3D20303B0D0A202020765031322E4173457874656E64
        6564203A3D20303B0D0A202020765231322E4173457874656E646564203A3D20
        303B200D0A2020207650416E742E4173457874656E646564203A3D20303B0D0A
        2020207652416E742E4173457874656E646564203A3D20303B2020200D0A2020
        207650546F742E4173457874656E646564203A3D20303B200D0A202020765254
        6F742E4173457874656E646564203A3D20303B200D0A20202076504D2E417345
        7874656E6465642020203A3D20303B200D0A20202076524D2E4173457874656E
        6465642020203A3D20303B200D0A20200D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D6506194F7263616D656E746F47726F7570466F6F74657242616E64
        31094576656E744E616D65060A41667465725072696E74074576656E74494402
        170001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        061A47726F7570466F6F74657242616E643141667465725072696E740B50726F
        6772616D54797065070B747450726F63656475726506536F757263650C081200
        0070726F6365647572652047726F7570466F6F74657242616E64314166746572
        5072696E743B0D0A626567696E0D0A20202069662070706C5B274453435F5449
        504F56414C4F52275D203D2027444553504553415327207468656E2062656769
        6E0D0A20202020202076544750312E4173457874656E646564203A3D20765447
        50312E4173457874656E646564202B20765450312E4173457874656E6465643B
        0D0A20202020202076544752312E4173457874656E646564203A3D2076544752
        312E4173457874656E646564202B20765452312E4173457874656E6465643B0D
        0A20202020202076544750322E4173457874656E646564203A3D207654475032
        2E4173457874656E646564202B20765450322E4173457874656E6465643B0D0A
        20202020202076544752322E4173457874656E646564203A3D2076544752322E
        4173457874656E646564202B20765452322E4173457874656E6465643B0D0A20
        202020202076544750332E4173457874656E646564203A3D2076544750332E41
        73457874656E646564202B20765450332E4173457874656E6465643B0D0A2020
        2020202076544752332E4173457874656E646564203A3D2076544752332E4173
        457874656E646564202B20765452332E4173457874656E6465643B0D0A202020
        20202076544750342E4173457874656E646564203A3D2076544750342E417345
        7874656E646564202B20765450342E4173457874656E6465643B0D0A20202020
        202076544752342E4173457874656E646564203A3D2076544752342E41734578
        74656E646564202B20765452342E4173457874656E6465643B0D0A2020202020
        2076544750352E4173457874656E646564203A3D2076544750352E4173457874
        656E646564202B20765450352E4173457874656E6465643B0D0A202020202020
        76544752352E4173457874656E646564203A3D2076544752352E417345787465
        6E646564202B20765452352E4173457874656E6465643B0D0A20202020202076
        544750362E4173457874656E646564203A3D2076544750362E4173457874656E
        646564202B20765450362E4173457874656E6465643B0D0A2020202020207654
        4752362E4173457874656E646564203A3D2076544752362E4173457874656E64
        6564202B20765452362E4173457874656E6465643B0D0A202020202020765447
        50372E4173457874656E646564203A3D2076544750372E4173457874656E6465
        64202B20765450372E4173457874656E6465643B0D0A20202020202076544752
        372E4173457874656E646564203A3D2076544752372E4173457874656E646564
        202B20765452372E4173457874656E6465643B0D0A2020202020207654475038
        2E4173457874656E646564203A3D2076544750382E4173457874656E64656420
        2B20765450382E4173457874656E6465643B0D0A20202020202076544752382E
        4173457874656E646564203A3D2076544752382E4173457874656E646564202B
        20765452382E4173457874656E6465643B0D0A20202020202076544750392E41
        73457874656E646564203A3D2076544750392E4173457874656E646564202B20
        765450392E4173457874656E6465643B0D0A20202020202076544752392E4173
        457874656E646564203A3D2076544752392E4173457874656E646564202B2076
        5452392E4173457874656E6465643B0D0A2020202020207654475031302E4173
        457874656E646564203A3D207654475031302E4173457874656E646564202B20
        76545031302E4173457874656E6465643B0D0A2020202020207654475231302E
        4173457874656E646564203A3D207654475231302E4173457874656E64656420
        2B2076545231302E4173457874656E6465643B0D0A2020202020207654475031
        312E4173457874656E646564203A3D207654475031312E4173457874656E6465
        64202B2076545031312E4173457874656E6465643B0D0A202020202020765447
        5231312E4173457874656E646564203A3D207654475231312E4173457874656E
        646564202B2076545231312E4173457874656E6465643B0D0A20202020202076
        54475031322E4173457874656E646564203A3D207654475031322E4173457874
        656E646564202B2076545031322E4173457874656E6465643B0D0A2020202020
        207654475231322E4173457874656E646564203A3D207654475231322E417345
        7874656E646564202B2076545231322E4173457874656E6465643B0D0A202020
        20202076544750416E742E4173457874656E646564203A3D2076544750416E74
        2E4173457874656E646564202B20765450416E742E4173457874656E6465643B
        0D0A20202020202076544752416E742E4173457874656E646564203A3D207654
        4752416E742E4173457874656E646564202B20765452416E742E417345787465
        6E6465643B0D0A202020202020765447504D2E4173457874656E646564202020
        3A3D20765447504D2E4173457874656E646564202B207654504D2E4173457874
        656E6465643B0D0A202020202020765447524D2E4173457874656E6465642020
        203A3D20765447524D2E4173457874656E646564202B207654524D2E41734578
        74656E6465643B0D0A20202020200D0A202020656E6420656C73652062656769
        6E0D0A20202020202076544750312E4173457874656E646564203A3D20765447
        50312E4173457874656E646564202D20765450312E4173457874656E6465643B
        0D0A20202020202076544752312E4173457874656E646564203A3D2076544752
        312E4173457874656E646564202D20765452312E4173457874656E6465643B0D
        0A20202020202076544750322E4173457874656E646564203A3D207654475032
        2E4173457874656E646564202D20765450322E4173457874656E6465643B0D0A
        20202020202076544752322E4173457874656E646564203A3D2076544752322E
        4173457874656E646564202D20765452322E4173457874656E6465643B0D0A20
        202020202076544750332E4173457874656E646564203A3D2076544750332E41
        73457874656E646564202D20765450332E4173457874656E6465643B0D0A2020
        2020202076544752332E4173457874656E646564203A3D2076544752332E4173
        457874656E646564202D20765452332E4173457874656E6465643B0D0A202020
        20202076544750342E4173457874656E646564203A3D2076544750342E417345
        7874656E646564202D20765450342E4173457874656E6465643B0D0A20202020
        202076544752342E4173457874656E646564203A3D2076544752342E41734578
        74656E646564202D20765452342E4173457874656E6465643B0D0A2020202020
        2076544750352E4173457874656E646564203A3D2076544750352E4173457874
        656E646564202D20765450352E4173457874656E6465643B0D0A202020202020
        76544752352E4173457874656E646564203A3D2076544752352E417345787465
        6E646564202D20765452352E4173457874656E6465643B0D0A20202020202076
        544750362E4173457874656E646564203A3D2076544750362E4173457874656E
        646564202D20765450362E4173457874656E6465643B0D0A2020202020207654
        4752362E4173457874656E646564203A3D2076544752362E4173457874656E64
        6564202D20765452362E4173457874656E6465643B0D0A202020202020765447
        50372E4173457874656E646564203A3D2076544750372E4173457874656E6465
        64202D20765450372E4173457874656E6465643B0D0A20202020202076544752
        372E4173457874656E646564203A3D2076544752372E4173457874656E646564
        202D20765452372E4173457874656E6465643B0D0A2020202020207654475038
        2E4173457874656E646564203A3D2076544750382E4173457874656E64656420
        2D20765450382E4173457874656E6465643B0D0A20202020202076544752382E
        4173457874656E646564203A3D2076544752382E4173457874656E646564202D
        20765452382E4173457874656E6465643B0D0A20202020202076544750392E41
        73457874656E646564203A3D2076544750392E4173457874656E646564202D20
        765450392E4173457874656E6465643B0D0A20202020202076544752392E4173
        457874656E646564203A3D2076544752392E4173457874656E646564202D2076
        5452392E4173457874656E6465643B0D0A2020202020207654475031302E4173
        457874656E646564203A3D207654475031302E4173457874656E646564202D20
        76545031302E4173457874656E6465643B0D0A2020202020207654475231302E
        4173457874656E646564203A3D207654475231302E4173457874656E64656420
        2D2076545231302E4173457874656E6465643B0D0A2020202020207654475031
        312E4173457874656E646564203A3D207654475031312E4173457874656E6465
        64202D2076545031312E4173457874656E6465643B0D0A202020202020765447
        5231312E4173457874656E646564203A3D207654475231312E4173457874656E
        646564202D2076545231312E4173457874656E6465643B0D0A20202020202076
        54475031322E4173457874656E646564203A3D207654475031322E4173457874
        656E646564202D2076545031322E4173457874656E6465643B0D0A2020202020
        207654475231322E4173457874656E646564203A3D207654475231322E417345
        7874656E646564202D2076545231322E4173457874656E6465643B0D0A202020
        20202076544750416E742E4173457874656E646564203A3D2076544750416E74
        2E4173457874656E646564202D20765450416E742E4173457874656E6465643B
        0D0A20202020202076544752416E742E4173457874656E646564203A3D207654
        4752416E742E4173457874656E646564202D20765452416E742E417345787465
        6E6465643B0D0A202020202020765447504D2E4173457874656E646564202020
        3A3D20765447504D2E4173457874656E646564202D207654504D2E4173457874
        656E6465643B0D0A202020202020765447524D2E4173457874656E6465642020
        203A3D20765447524D2E4173457874656E646564202D207654524D2E41734578
        74656E6465643B0D0A2020202020200D0A202020656E643B2020200D0A200D0A
        202020765450312E4173457874656E646564203A3D20303B0D0A202020765450
        322E4173457874656E646564203A3D20303B2020200D0A202020765450332E41
        73457874656E646564203A3D20303B0D0A202020765450342E4173457874656E
        646564203A3D20303B2020200D0A202020765450352E4173457874656E646564
        203A3D20303B0D0A202020765450362E4173457874656E646564203A3D20303B
        2020200D0A202020765450372E4173457874656E646564203A3D20303B0D0A20
        2020765450382E4173457874656E646564203A3D20303B2020200D0A20202076
        5450392E4173457874656E646564203A3D20303B0D0A20202076545031302E41
        73457874656E646564203A3D20303B2020200D0A20202076545031312E417345
        7874656E646564203A3D20303B2020200D0A20202076545031322E4173457874
        656E646564203A3D20303B2020200D0A202020765450546F742E417345787465
        6E646564203A3D20303B2020200D0A202020765450416E742E4173457874656E
        646564203A3D20303B2020200D0A2020207654504D2E4173457874656E646564
        203A3D20303B2020202020200D0A2020200D0A202020765452312E4173457874
        656E646564203A3D20303B0D0A202020765452322E4173457874656E64656420
        3A3D20303B2020200D0A202020765452332E4173457874656E646564203A3D20
        303B0D0A202020765452342E4173457874656E646564203A3D20303B2020200D
        0A202020765452352E4173457874656E646564203A3D20303B0D0A2020207654
        52362E4173457874656E646564203A3D20303B2020200D0A202020765452372E
        4173457874656E646564203A3D20303B0D0A202020765452382E417345787465
        6E646564203A3D20303B2020200D0A202020765452392E4173457874656E6465
        64203A3D20303B0D0A20202076545231302E4173457874656E646564203A3D20
        303B2020200D0A20202076545231312E4173457874656E646564203A3D20303B
        2020200D0A20202076545231322E4173457874656E646564203A3D20303B2020
        200D0A202020765452546F742E4173457874656E646564203A3D20303B202020
        0D0A202020765452416E742E4173457874656E646564203A3D20303B2020200D
        0A2020207654524D2E4173457874656E646564203A3D20303B2020200D0A2020
        200D0A656E643B0D0A0D436F6D706F6E656E744E616D65061047726F7570466F
        6F74657242616E6431094576656E744E616D65060A41667465725072696E7407
        4576656E74494402170001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D6506244F7263616D656E746F47726F7570466F6F7465724261
        6E64314265666F72655072696E740B50726F6772616D54797065070B74745072
        6F63656475726506536F757263650C4D05000070726F636564757265204F7263
        616D656E746F47726F7570466F6F74657242616E64314265666F72655072696E
        743B0D0A626567696E0D0A20202076505661722E4173457874656E646564203A
        3D202831202D20287650546F742E4173457874656E646564202F207650416E74
        2E4173457874656E64656429202F203130303B0D0A20202076525661722E4173
        457874656E646564203A3D202831202D20287652546F742E4173457874656E64
        6564202F207652416E742E4173457874656E64656429202F203130303B0D0A20
        20200D0A2020207056617254312E4173457874656E64656420203A3D20313030
        202D2028287652312E4173457874656E646564202A2031303029202F20765031
        2E4173457874656E646564293B0D0A2020207056617254322E4173457874656E
        64656420203A3D20313030202D2028287652322E4173457874656E646564202A
        2031303029202F207650322E4173457874656E646564293B0D0A202020705661
        7254332E4173457874656E64656420203A3D20313030202D2028287652332E41
        73457874656E646564202A2031303029202F207650332E4173457874656E6465
        64293B0D0A2020207056617254342E4173457874656E64656420203A3D203130
        30202D2028287652342E4173457874656E646564202A2031303029202F207650
        342E4173457874656E646564293B0D0A2020207056617254352E417345787465
        6E64656420203A3D20313030202D2028287652352E4173457874656E64656420
        2A2031303029202F207650352E4173457874656E646564293B0D0A2020207056
        617254362E4173457874656E64656420203A3D20313030202D2028287652362E
        4173457874656E646564202A2031303029202F207650362E4173457874656E64
        6564293B0D0A2020207056617254372E4173457874656E64656420203A3D2031
        3030202D2028287652372E4173457874656E646564202A2031303029202F2076
        50372E4173457874656E646564293B0D0A2020207056617254382E4173457874
        656E64656420203A3D20313030202D2028287652382E4173457874656E646564
        202A2031303029202F207650382E4173457874656E646564293B0D0A20202070
        56617254392E4173457874656E64656420203A3D20313030202D202828765239
        2E4173457874656E646564202A2031303029202F207650392E4173457874656E
        646564293B0D0A202020705661725431302E4173457874656E646564203A3D20
        313030202D202828765231302E4173457874656E646564202A2031303029202F
        20765031302E4173457874656E646564293B0D0A202020705661725431312E41
        73457874656E646564203A3D20313030202D202828765231312E417345787465
        6E646564202A2031303029202F20765031312E4173457874656E646564293B0D
        0A202020705661725431322E4173457874656E646564203A3D20313030202D20
        2828765231322E4173457874656E646564202A2031303029202F20765031322E
        4173457874656E646564293B0D0A2020207056617254542E4173457874656E64
        656420203A3D20313030202D2028287652546F742E4173457874656E64656420
        2A2031303029202F207650546F742E4173457874656E646564293B0D0A202020
        7056617254412E4173457874656E64656420203A3D20313030202D2028287652
        416E742E4173457874656E646564202A2031303029202F207650416E742E4173
        457874656E646564293B0D0A20202070566172544D2E4173457874656E646564
        20203A3D20313030202D20282876524D2E4173457874656E646564202A203130
        3029202F2076504D2E4173457874656E646564293B2020200D0A656E643B0D0A
        0D436F6D706F6E656E744E616D6506194F7263616D656E746F47726F7570466F
        6F74657242616E6431094576656E744E616D65060B4265666F72655072696E74
        074576656E74494402180001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D65061B47726F7570466F6F74657242616E64314265666F72
        655072696E740B50726F6772616D54797065070B747450726F63656475726506
        536F757263650C6505000070726F6365647572652047726F7570466F6F746572
        42616E64314265666F72655072696E743B0D0A626567696E0D0A202020765450
        5661722E4173457874656E646564203A3D202831202D2028765450546F742E41
        73457874656E646564202F20765450416E742E4173457874656E64656429202F
        203130303B0D0A2020207654525661722E4173457874656E646564203A3D2028
        31202D2028765452546F742E4173457874656E646564202F20765452416E742E
        4173457874656E64656429202F203130303B0D0A2020200D0A20202070566172
        47312E4173457874656E64656420203A3D20313030202D202828765452312E41
        73457874656E646564202A2031303029202F20765450312E4173457874656E64
        6564293B0D0A2020207056617247322E4173457874656E64656420203A3D2031
        3030202D202828765452322E4173457874656E646564202A2031303029202F20
        765450322E4173457874656E646564293B0D0A2020207056617247332E417345
        7874656E64656420203A3D20313030202D202828765452332E4173457874656E
        646564202A2031303029202F20765450332E4173457874656E646564293B0D0A
        2020207056617247342E4173457874656E64656420203A3D20313030202D2028
        28765452342E4173457874656E646564202A2031303029202F20765450342E41
        73457874656E646564293B0D0A2020207056617247352E4173457874656E6465
        6420203A3D20313030202D202828765452352E4173457874656E646564202A20
        31303029202F20765450352E4173457874656E646564293B0D0A202020705661
        7247362E4173457874656E64656420203A3D20313030202D202828765452362E
        4173457874656E646564202A2031303029202F20765450362E4173457874656E
        646564293B0D0A2020207056617247372E4173457874656E64656420203A3D20
        313030202D202828765452372E4173457874656E646564202A2031303029202F
        20765450372E4173457874656E646564293B0D0A2020207056617247382E4173
        457874656E64656420203A3D20313030202D202828765452382E417345787465
        6E646564202A2031303029202F20765450382E4173457874656E646564293B0D
        0A2020207056617247392E4173457874656E64656420203A3D20313030202D20
        2828765452392E4173457874656E646564202A2031303029202F20765450392E
        4173457874656E646564293B0D0A202020705661724731302E4173457874656E
        646564203A3D20313030202D20282876545231302E4173457874656E64656420
        2A2031303029202F2076545031302E4173457874656E646564293B0D0A202020
        705661724731312E4173457874656E646564203A3D20313030202D2028287654
        5231312E4173457874656E646564202A2031303029202F2076545031312E4173
        457874656E646564293B0D0A202020705661724731322E4173457874656E6465
        64203A3D20313030202D20282876545231322E4173457874656E646564202A20
        31303029202F2076545031322E4173457874656E646564293B0D0A2020207056
        617247542E4173457874656E64656420203A3D20313030202D20282876545254
        6F742E4173457874656E646564202A2031303029202F20765450546F742E4173
        457874656E646564293B0D0A2020207056617247412E4173457874656E646564
        20203A3D20313030202D202828765452416E742E4173457874656E646564202A
        2031303029202F20765450416E742E4173457874656E646564293B0D0A202020
        70566172474D2E4173457874656E64656420203A3D20313030202D2028287654
        524D2E4173457874656E646564202A2031303029202F207654504D2E41734578
        74656E646564293B0D0A656E643B0D0A0D436F6D706F6E656E744E616D650610
        47726F7570466F6F74657242616E6431094576656E744E616D65060B4265666F
        72655072696E74074576656E74494402180001060F5472614576656E7448616E
        646C65720B50726F6772616D4E616D65061B47726F7570466F6F74657242616E
        64324265666F72655072696E740B50726F6772616D54797065070B747450726F
        63656475726506536F757263650CD508000070726F6365647572652047726F75
        70466F6F74657242616E64324265666F72655072696E743B0D0A626567696E0D
        0A20202076544750546F742E4173457874656E646564203A3D2076544750312E
        4173457874656E646564202B2076544750322E4173457874656E646564202B0D
        0A2020202020202020202020202020202020202020202020202076544750332E
        4173457874656E646564202B2076544750342E4173457874656E646564202B0D
        0A2020202020202020202020202020202020202020202020202076544750352E
        4173457874656E646564202B2076544750362E4173457874656E646564202B0D
        0A2020202020202020202020202020202020202020202020202076544750372E
        4173457874656E646564202B2076544750382E4173457874656E646564202B0D
        0A2020202020202020202020202020202020202020202020202076544750392E
        4173457874656E646564202B207654475031302E4173457874656E646564202B
        0D0A202020202020202020202020202020202020202020202020207654475031
        312E4173457874656E646564202B207654475031322E4173457874656E646564
        3B0D0A202020202020202020202020202020202020202020202020200D0A2020
        2076544752546F742E4173457874656E646564203A3D2076544752312E417345
        7874656E646564202B2076544752322E4173457874656E646564202B0D0A2020
        202020202020202020202020202020202020202020202076544752332E417345
        7874656E646564202B2076544752342E4173457874656E646564202B0D0A2020
        202020202020202020202020202020202020202020202076544752352E417345
        7874656E646564202B2076544752362E4173457874656E646564202B0D0A2020
        202020202020202020202020202020202020202020202076544752372E417345
        7874656E646564202B2076544752382E4173457874656E646564202B0D0A2020
        202020202020202020202020202020202020202020202076544752392E417345
        7874656E646564202B207654475231302E4173457874656E646564202B0D0A20
        2020202020202020202020202020202020202020202020207654475231312E41
        73457874656E646564202B207654475231322E4173457874656E6465643B0D0A
        202020202020202020202020202020202020202020202020200D0A2020207654
        47505661722E4173457874656E646564203A3D202831202D202876544750546F
        742E4173457874656E646564202F2076544750416E742E4173457874656E6465
        6429202F203130303B0D0A202020765447525661722E4173457874656E646564
        203A3D202831202D202876544752546F742E4173457874656E646564202F2076
        544752416E742E4173457874656E64656429202F203130303B0D0A2020200D0A
        202020705661724747312E4173457874656E64656420203A3D20313030202D20
        282876544752312E4173457874656E646564202A2031303029202F2076544750
        312E4173457874656E646564293B0D0A202020705661724747322E4173457874
        656E64656420203A3D20313030202D20282876544752322E4173457874656E64
        6564202A2031303029202F2076544750322E4173457874656E646564293B0D0A
        202020705661724747332E4173457874656E64656420203A3D20313030202D20
        282876544752332E4173457874656E646564202A2031303029202F2076544750
        332E4173457874656E646564293B0D0A202020705661724747342E4173457874
        656E64656420203A3D20313030202D20282876544752342E4173457874656E64
        6564202A2031303029202F2076544750342E4173457874656E646564293B0D0A
        202020705661724747352E4173457874656E64656420203A3D20313030202D20
        282876544752352E4173457874656E646564202A2031303029202F2076544750
        352E4173457874656E646564293B0D0A202020705661724747362E4173457874
        656E64656420203A3D20313030202D20282876544752362E4173457874656E64
        6564202A2031303029202F2076544750362E4173457874656E646564293B0D0A
        202020705661724747372E4173457874656E64656420203A3D20313030202D20
        282876544752372E4173457874656E646564202A2031303029202F2076544750
        372E4173457874656E646564293B0D0A202020705661724747382E4173457874
        656E64656420203A3D20313030202D20282876544752382E4173457874656E64
        6564202A2031303029202F2076544750382E4173457874656E646564293B0D0A
        202020705661724747392E4173457874656E64656420203A3D20313030202D20
        282876544752392E4173457874656E646564202A2031303029202F2076544750
        392E4173457874656E646564293B0D0A20202070566172474731302E41734578
        74656E646564203A3D20313030202D2028287654475231302E4173457874656E
        646564202A2031303029202F207654475031302E4173457874656E646564293B
        0D0A20202070566172474731312E4173457874656E646564203A3D2031303020
        2D2028287654475231312E4173457874656E646564202A2031303029202F2076
        54475031312E4173457874656E646564293B0D0A20202070566172474731322E
        4173457874656E646564203A3D20313030202D2028287654475231322E417345
        7874656E646564202A2031303029202F207654475031322E4173457874656E64
        6564293B0D0A202020705661724747542E4173457874656E64656420203A3D20
        313030202D20282876544752546F742E4173457874656E646564202A20313030
        29202F2076544750546F742E4173457874656E646564293B0D0A202020705661
        724747412E4173457874656E64656420203A3D20313030202D20282876544752
        416E742E4173457874656E646564202A2031303029202F2076544750416E742E
        4173457874656E646564293B0D0A2020207056617247474D2E4173457874656E
        64656420203A3D20313030202D202828765447524D2E4173457874656E646564
        202A2031303029202F20765447504D2E4173457874656E646564293B2020200D
        0A656E643B0D0A0D436F6D706F6E656E744E616D65061047726F7570466F6F74
        657242616E6432094576656E744E616D65060B4265666F72655072696E740745
        76656E74494402180000}
    end
  end
end
