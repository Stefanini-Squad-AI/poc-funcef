inherited RptPrevisaoFerias: TRptPrevisaoFerias
  Left = 204
  Top = 219
  Width = 298
  Height = 266
  Caption = 'RptPrevisaoFerias'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'NomeEmpresa'
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
        Name = 'NomeEmpresa'
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
        Caption = 'SelDataLimite'
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
        Name = 'SelDataLimite'
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
        Caption = 'DataLimiteInicial'
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
        Name = 'DataLimiteInicial'
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
        Caption = 'DataLimiteFinal'
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
        Name = 'DataLimiteFinal'
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
        Caption = 'DataRef'
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
        Name = 'DataRef'
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
        Caption = 'ExibeDataProgramada'
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
        Name = 'ExibeDataProgramada'
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
        Caption = 'ListaCodCCusto'
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
        Name = 'ListaCodCCusto'
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
        Caption = 'Ordenacao'
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
        Name = 'Ordenacao'
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
        Caption = 'FeriasReduzidas'
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
        Name = 'FeriasReduzidas'
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
    Report = rpPrevisaoFerias
    ConnectionType = cntBDE
  end
  object rpPrevisaoFerias: TppReport
    AutoStop = False
    DataPipeline = ppPrevisaoFerias
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 224
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppPrevisaoFerias'
    object rpPrevisaoFeriasHdrBnd1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object rpPrevisaoFeriasLbl1: TppLabel
        UserName = 'rpPrevisaoFeriasLbl1'
        AutoSize = False
        Caption = 'RELATÓRIO DE PREVISÃO DE FÉRIAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 9525
        mmWidth = 103717
        BandType = 0
      end
      object rpPrevisaoFeriasDBTxt1: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt1'
        DataField = 'ESTAB'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 794
        mmWidth = 102923
        BandType = 0
      end
      object rpPrevisaoFeriasDBTxt2: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt2'
        DataField = 'CGC'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 5556
        mmWidth = 38365
        BandType = 0
      end
      object rpPrevisaoFeriasDBTxt3: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt3'
        DataField = 'ESTADUALMUNICIPAL'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 9525
        mmWidth = 38365
        BandType = 0
      end
      object rpPrevisaoFeriasDBTxt4: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt4'
        DataField = 'ENDERECO'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 14288
        mmWidth = 144198
        BandType = 0
      end
      object rpPrevisaoFeriasLine1: TppLine
        UserName = 'rpPrevisaoFeriasLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 794
        mmTop = 20108
        mmWidth = 195792
        BandType = 0
      end
      object rpPrevisaoFeriasLbl3: TppLabel
        UserName = 'rpPrevisaoFeriasLbl3'
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
        mmLeft = 147902
        mmTop = 6615
        mmWidth = 19844
        BandType = 0
      end
      object rpPrevisaoFeriasLbl4: TppLabel
        UserName = 'rpPrevisaoFeriasLbl4'
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
        mmLeft = 147902
        mmTop = 10848
        mmWidth = 19844
        BandType = 0
      end
      object rpPrevisaoFeriasLbl2: TppLabel
        UserName = 'rpPrevisaoFeriasLbl2'
        AutoSize = False
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 2117
        mmWidth = 19844
        BandType = 0
      end
      object rpPrevisaoFeriasDBTxt5: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt5'
        DataField = 'UF'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3704
        mmLeft = 168540
        mmTop = 2117
        mmWidth = 23548
        BandType = 0
      end
      object rpPrevisaoFeriasLbl5: TppLabel
        UserName = 'rpPrevisaoFeriasLbl5'
        AutoSize = False
        Caption = 'Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 15081
        mmWidth = 19844
        BandType = 0
      end
      object rpPrevisaoFeriasDBTxt6: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt6'
        DataField = 'DATA_REF'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3704
        mmLeft = 168540
        mmTop = 15081
        mmWidth = 23548
        BandType = 0
      end
      object rpPrevisaoFeriasSysVar1: TppSystemVariable
        UserName = 'rpPrevisaoFeriasSysVar1'
        AutoSize = False
        VarType = vtPageSet
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 168540
        mmTop = 6615
        mmWidth = 23548
        BandType = 0
      end
      object rpPrevisaoFeriasSysVar2: TppSystemVariable
        UserName = 'rpPrevisaoFeriasSysVar2'
        AutoSize = False
        VarType = vtDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 168540
        mmTop = 10848
        mmWidth = 23548
        BandType = 0
      end
    end
    object rpPrevisaoFeriasDtlBnd1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object rpPrevisaoFeriasDBTxt9: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt9'
        DataField = 'MATRICULA'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3175
        mmLeft = 794
        mmTop = 1852
        mmWidth = 12435
        BandType = 4
      end
      object rpPrevisaoFeriasDBTxt10: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt10'
        DataField = 'EMPREGADO'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3175
        mmLeft = 14552
        mmTop = 1852
        mmWidth = 63000
        BandType = 4
      end
      object rpPrevisaoFeriasMemo1: TppMemo
        UserName = 'Memo1'
        Caption = '___ / ___ / ____'#13#10
        CharWrap = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Lines.Strings = (
          '___ / ___ / _____')
        TabStopPositions.Strings = (
          '0')
        Transparent = True
        mmHeight = 4233
        mmLeft = 162719
        mmTop = 2117
        mmWidth = 20108
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpPrevisaoFeriasDBTxt14: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt14'
        DataField = 'ULT_FERIAS'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3175
        mmLeft = 130969
        mmTop = 1852
        mmWidth = 12700
        BandType = 4
      end
      object rpPrevisaoFeriasDBTxt11: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt11'
        DataField = 'PER_AQUIS_INI'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3175
        mmLeft = 86519
        mmTop = 1852
        mmWidth = 12700
        BandType = 4
      end
      object rpPrevisaoFeriasDBTxt12: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt12'
        DataField = 'PER_AQUIS_FIN'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3175
        mmLeft = 101600
        mmTop = 1852
        mmWidth = 12700
        BandType = 4
      end
      object rpPrevisaoFeriasDBTxt13: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt13'
        DataField = 'DATA_LIMITE'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3175
        mmLeft = 116417
        mmTop = 1852
        mmWidth = 12700
        BandType = 4
      end
      object rpPrevisaoFeriasDBTxt15: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt15'
        DataField = 'FERIAS_VENC'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3175
        mmLeft = 145521
        mmTop = 1852
        mmWidth = 6879
        BandType = 4
      end
      object rpPrevisaoFeriasDBTxt16: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt16'
        DataField = 'FERIAS_PROP'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3175
        mmLeft = 153988
        mmTop = 1852
        mmWidth = 6879
        BandType = 4
      end
      object rpPrevisaoFeriasDBTxt17: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt17'
        DataField = 'DIA_DT_PROG'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3175
        mmLeft = 163248
        mmTop = 1323
        mmWidth = 3704
        BandType = 4
      end
      object rpPrevisaoFeriasDBTxt18: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt18'
        DataField = 'MES_DT_PROG'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3175
        mmLeft = 169598
        mmTop = 1323
        mmWidth = 3704
        BandType = 4
      end
      object rpPrevisaoFeriasDBTxt19: TppDBText
        UserName = 'rpPrevisaoFeriasDBTxt19'
        DataField = 'ANO_DT_PROG'
        DataPipeline = ppPrevisaoFerias
        DisplayFormat = '9999;0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3175
        mmLeft = 175948
        mmTop = 1323
        mmWidth = 6085
        BandType = 4
      end
      object rpPrevisaoFeriasLbl18: TppLabel
        UserName = 'rpPrevisaoFeriasLbl18'
        AutoSize = False
        Caption = '|_______|'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 184680
        mmTop = 2117
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'DBText1'
        DataField = 'SALDOFERIAS'
        DataPipeline = ppPrevisaoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPrevisaoFerias'
        mmHeight = 3175
        mmLeft = 78317
        mmTop = 1852
        mmWidth = 6879
        BandType = 4
      end
    end
    object rpPrevisaoFeriasFootBnd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
    end
    object rpPrevisaoFeriasSmryBnd: TppSummaryBand
      AfterPrint = rpPrevisaoFeriasSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
    end
    object rpPrevisaoFeriasGrp1: TppGroup
      BreakName = 'NOMECENTROCUSTO'
      DataPipeline = ppPrevisaoFerias
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpPrevisaoFeriasGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppPrevisaoFerias'
      object rpPrevisaoFeriasGrpHdrBnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object rpPrevisaoFeriasLbl6: TppLabel
          UserName = 'rpPrevisaoFeriasLbl6'
          AutoSize = False
          Caption = 'Centro de Custo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 794
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object rpPrevisaoFeriasDBTxt8: TppDBText
          UserName = 'rpPrevisaoFeriasDBTxt8'
          AutoSize = True
          DataField = 'NOMECENTROCUSTO'
          DataPipeline = ppPrevisaoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'ppPrevisaoFerias'
          mmHeight = 3175
          mmLeft = 41540
          mmTop = 794
          mmWidth = 30427
          BandType = 3
          GroupNo = 0
        end
        object rpPrevisaoFeriasLine2: TppLine
          UserName = 'rpPrevisaoFeriasLine2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 794
          mmTop = 10848
          mmWidth = 195792
          BandType = 3
          GroupNo = 0
        end
        object rpPrevisaoFeriasLbl7: TppLabel
          UserName = 'rpPrevisaoFeriasLbl7'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 794
          mmTop = 7408
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object rpPrevisaoFeriasLbl8: TppLabel
          UserName = 'rpPrevisaoFeriasLbl8'
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 14817
          mmTop = 7408
          mmWidth = 63000
          BandType = 3
          GroupNo = 0
        end
        object ProvisaoFeriasrpLblAvos1: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Período Aquisitivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 86519
          mmTop = 3969
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object rpPrevisaoFeriasLbl10: TppLabel
          UserName = 'rpPrevisaoFeriasLbl10'
          AutoSize = False
          Caption = 'Data Limite'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 116417
          mmTop = 7408
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpPrevisaoFeriasLbl13: TppLabel
          UserName = 'rpPrevisaoFeriasLbl13'
          AutoSize = False
          Caption = 'Venc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 145521
          mmTop = 7408
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object rpPrevisaoFeriasLbl15: TppLabel
          UserName = 'rpPrevisaoFeriasLbl15'
          AutoSize = False
          Caption = 'Prop.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 154252
          mmTop = 7408
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object rpPrevisaoFeriasLbl16: TppLabel
          UserName = 'rpPrevisaoFeriasLbl16'
          AutoSize = False
          Caption = 'Data Program.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 162719
          mmTop = 7408
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object rpPrevisaoFeriasLbl11: TppLabel
          UserName = 'rpPrevisaoFeriasLbl11'
          AutoSize = False
          Caption = 'Ult. Fer.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 130969
          mmTop = 7408
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpPrevisaoFeriasDBTxt7: TppDBText
          UserName = 'rpPrevisaoFeriasDBTxt7'
          DataField = 'CODCENTROCUSTO'
          DataPipeline = ppPrevisaoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppPrevisaoFerias'
          mmHeight = 3704
          mmLeft = 26458
          mmTop = 794
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object rpPrevisaoFeriasLbl9: TppLabel
          UserName = 'rpPrevisaoFeriasLbl9'
          AutoSize = False
          Caption = 'de                 até'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 86519
          mmTop = 7408
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object rpPrevisaoFeriasLbl12: TppLabel
          UserName = 'rpPrevisaoFeriasLbl12'
          AutoSize = False
          Caption = 'Fer.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 145521
          mmTop = 3704
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object rpPrevisaoFeriasLbl17: TppLabel
          UserName = 'rpPrevisaoFeriasLbl17'
          AutoSize = False
          Caption = 'Qtde. Dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 184680
          mmTop = 7408
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object rpPrevisaoFeriasLbl14: TppLabel
          UserName = 'rpPrevisaoFeriasLbl14'
          AutoSize = False
          Caption = 'Fer.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 154252
          mmTop = 3704
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object ppLabel56: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 78581
          mmTop = 3704
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object ppLabel57: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 78581
          mmTop = 7408
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
      end
      object rpPrevisaoFeriasGrpFootBnd1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rpPrevisaoFeriasLine3: TppLine
          UserName = 'rpPrevisaoFeriasLine3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1852
          mmLeft = 794
          mmTop = 529
          mmWidth = 195792
          BandType = 5
          GroupNo = 0
        end
        object rpPrevisaoFeriasLbl19: TppLabel
          UserName = 'rpPrevisaoFeriasLbl19'
          AutoSize = False
          Caption = 'Nº de Funcionários:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 2117
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object rpPrevisaoFeriasDBCalc1: TppDBCalc
          UserName = 'rpPrevisaoFeriasDBCalc1'
          DataField = 'EMPREGADO'
          DataPipeline = ppPrevisaoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpPrevisaoFeriasGrp1
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppPrevisaoFerias'
          mmHeight = 3704
          mmLeft = 30692
          mmTop = 2117
          mmWidth = 37835
          BandType = 5
          GroupNo = 0
        end
        object rpPrevisaoFeriasDBCalc2: TppDBCalc
          UserName = 'rpPrevisaoFeriasDBCalc2'
          DataField = 'FERIAS_VENC'
          DataPipeline = ppPrevisaoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpPrevisaoFeriasGrp1
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppPrevisaoFerias'
          mmHeight = 3704
          mmLeft = 145257
          mmTop = 2117
          mmWidth = 6879
          BandType = 5
          GroupNo = 0
        end
        object rpPrevisaoFeriasDBCalc3: TppDBCalc
          UserName = 'rpPrevisaoFeriasDBCalc3'
          DataField = 'FERIAS_PROP'
          DataPipeline = ppPrevisaoFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpPrevisaoFeriasGrp1
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppPrevisaoFerias'
          mmHeight = 3704
          mmLeft = 153723
          mmTop = 2117
          mmWidth = 6879
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppPrevisaoFerias: TppBDEPipeline
    DataSource = dsPrevisaoFerias
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'PrevisaoFerias'
    Left = 224
    Top = 48
  end
  object dsPrevisaoFerias: TwwDataSource
    DataSet = CdsPrevisaoFerias
    Left = 224
    Top = 96
  end
  object sqlPrevisaoFerias: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ESTAB,'
      '  '#39'12345678901234567890'#39' AS CGC,'
      '  '#39'12345678901234567890'#39' AS ESTADUALMUNICIPAL,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENDERECO,'
      '  '#39'12345678901234567890'#39' AS UF,'
      '  '#39'12345678901234567890'#39' AS MATRICULA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPREGADO,'
      '  '#39'12345678901234567890'#39' AS CODCENTROCUSTO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS NOMECENTROCUSTO,'
      '  '#39'1234567890'#39' AS DATAADMISSAO,'
      '  '#39'1234567890'#39' AS DT_FERIAS_EM_ABERTO,'
      '  '#39'1234567890'#39' AS DT_FERIAS,'
      '  '#39'1234567890'#39' AS ULT_FERIAS,'
      '  '#39'1234567890'#39' AS DATA_REF,'
      '  '#39'1234567890'#39' AS PER_AQUIS_INI,'
      '  '#39'1234567890'#39' AS PER_AQUIS_FIN,'
      '  '#39'1234567890'#39' AS DATA_LIMITE,'
      '  '#39'12'#39' AS DIA_DT_PROG,'
      '  '#39'12'#39' AS MES_DT_PROG,'
      '  '#39'1234'#39' AS ANO_DT_PROG,'
      '  0 AS FERIAS_VENC,'
      '  0 AS FERIAS_PROP,'
      '  0 AS SALDOFERIAS,'
      '  0 AS NUM_REGISTRO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsPrevisaoFerias
    Left = 224
    Top = 190
  end
  object CdsPrevisaoFerias: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EMPRESA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'ESTAB'
        Attributes = [faFixed]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'CGC'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ESTADUALMUNICIPAL'
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
        Name = 'UF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MATRICULA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EMPREGADO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOMECENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'DATAADMISSAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DT_FERIAS_EM_ABERTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DT_FERIAS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ULT_FERIAS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DATA_REF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PER_AQUIS_INI'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PER_AQUIS_FIN'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DATA_LIMITE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DIA_DT_PROG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'MES_DT_PROG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ANO_DT_PROG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'FERIAS_VENC'
        DataType = ftFloat
      end
      item
        Name = 'FERIAS_PROP'
        DataType = ftFloat
      end
      item
        Name = 'SALDOFERIAS'
        DataType = ftFloat
      end
      item
        Name = 'NUM_REGISTRO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'Index1'
        Fields = 'NUM_REGISTRO'
      end>
    IndexName = 'Index1'
    Params = <>
    StoreDefs = True
    AfterScroll = CdsPrevisaoFeriasAfterScroll
    Left = 224
    Top = 144
  end
end
