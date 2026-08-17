inherited RptGPS: TRptGPS
  Left = 252
  Top = 179
  Width = 263
  Height = 266
  Caption = 'RptGPS'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'IdEmpresa'
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
        Name = 'IdEmpresa'
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
        Caption = 'MesRef'
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
        Name = 'MesRef'
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
        Caption = 'AnoRef'
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
        Name = 'AnoRef'
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
        Caption = 'ListaIdTipoFolha'
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
        Name = 'ListaIdTipoFolha'
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
        Caption = 'Juros'
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
        Name = 'Juros'
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
        Caption = 'PercentJuros'
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
        Name = 'PercentJuros'
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
        Caption = 'Multa'
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
        Name = 'Multa'
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
        Caption = 'PercentMulta'
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
        Name = 'PercentMulta'
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
        Caption = 'TipoInformacao'
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
        Name = 'TipoInformacao'
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
        Caption = 'GPS13Salario'
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
        Name = 'GPS13Salario'
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
        Caption = 'CodPagamento'
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
        Name = 'CodPagamento'
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
        Caption = 'ValorAdicionalLinha6'
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
        Name = 'ValorAdicionalLinha6'
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
        Caption = 'ValorAdicionalLinha7'
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
        Name = 'ValorAdicionalLinha7'
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
        Caption = 'ValorAdicionalLinha8'
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
        Name = 'ValorAdicionalLinha8'
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
        Caption = 'DescrAdicionalLinha7'
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
        Name = 'DescrAdicionalLinha7'
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
        Caption = 'DescrAdicionalLinha8'
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
        Name = 'DescrAdicionalLinha8'
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
        Caption = 'SomaAdicionalLinha6'
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
        Name = 'SomaAdicionalLinha6'
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
        Caption = 'SomaAdicionalLinha7'
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
        Name = 'SomaAdicionalLinha7'
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
        Caption = 'SomaAdicionalLinha8'
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
        Name = 'SomaAdicionalLinha8'
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
        Caption = 'ImprimeAtualizacaoMonet'
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
        Name = 'ImprimeAtualizacaoMonet'
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
        Caption = 'ImprimeTotal'
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
        Name = 'ImprimeTotal'
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
        Caption = 'ImprimeFormulario'
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
        Name = 'ImprimeFormulario'
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
        Caption = 'ImprimeEmDuasVias'
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
        Name = 'ImprimeEmDuasVias'
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
        Caption = 'DataPagamento'
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
        Name = 'DataPagamento'
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
        Caption = 'DataVencimento'
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
        Name = 'DataVencimento'
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
        Caption = 'MoeCodigo'
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
        Name = 'MoeCodigo'
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
        Caption = 'CotacaoMoedaDataPag'
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
        Name = 'CotacaoMoedaDataPag'
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
        Caption = 'CotacaoMoedaDataVenc'
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
        Name = 'CotacaoMoedaDataVenc'
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
        Caption = 'NomeTabela'
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
        Name = 'NomeTabela'
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
    Report = rpGPS
    ConnectionType = cntBDE
  end
  object rpGPS: TppReport
    AutoStop = False
    DataPipeline = ppGPS
    OnStartPage = rpGPSStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 7000
    PrinterSetup.mmMarginLeft = 7000
    PrinterSetup.mmMarginRight = 7000
    PrinterSetup.mmMarginTop = 7000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AfterPrint = rpGPSAfterPrint
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 206
    Version = '5.5'
    mmColumnWidth = 197300
    object rpGPSDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 210873
      mmPrintPosition = 0
      object rpGPSShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 74613
        mmLeft = 0
        mmTop = 0
        mmWidth = 172773
        BandType = 4
      end
      object rpGPSShape2: TppShape
        UserName = 'Shape4'
        mmHeight = 74613
        mmLeft = 86519
        mmTop = 0
        mmWidth = 42333
        BandType = 4
      end
      object rpGPSShape4: TppShape
        UserName = 'Shape5'
        Brush.Style = bsClear
        mmHeight = 7408
        mmLeft = 86519
        mmTop = 26194
        mmWidth = 86254
        BandType = 4
      end
      object rpGPSShape5: TppShape
        UserName = 'Shape6'
        Brush.Style = bsClear
        mmHeight = 8202
        mmLeft = 0
        mmTop = 40217
        mmWidth = 172773
        BandType = 4
      end
      object rpGPSShape3: TppShape
        UserName = 'Shape3'
        Brush.Style = bsClear
        mmHeight = 7144
        mmLeft = 86519
        mmTop = 6085
        mmWidth = 86254
        BandType = 4
      end
      object rpGPSShape6: TppShape
        UserName = 'Shape2'
        mmHeight = 17500
        mmLeft = 0
        mmTop = 75671
        mmWidth = 172773
        BandType = 4
      end
      object rpGPSLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8202
        mmLeft = 31221
        mmTop = 40217
        mmWidth = 1323
        BandType = 4
      end
      object rpGPSLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 66940
        mmWidth = 172773
        BandType = 4
      end
      object rpGPSLine1: TppLine
        UserName = 'Line6'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 19579
        mmWidth = 172509
        BandType = 4
      end
      object rpGPSLabel3: TppLabel
        UserName = 'Label1'
        Caption = 'GUIA DA PREVIDÊNCIA SOCIAL - GPS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 15875
        mmTop = 12965
        mmWidth = 44450
        BandType = 4
      end
      object rpGPSLabel1: TppLabel
        UserName = 'Label2'
        Caption = 'MINISTÉRIO DA PREVIDÊNCIA E ASSISTÊNCIA SOCIAL - MPAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 12435
        mmTop = 2646
        mmWidth = 63236
        BandType = 4
      end
      object rpGPSLabel2: TppLabel
        UserName = 'Label3'
        Caption = 'INSTITUTO NACIONA DE SEGURO SOCIAL - INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 12435
        mmTop = 5821
        mmWidth = 49213
        BandType = 4
      end
      object rpGPSLabel4: TppLabel
        UserName = 'Label4'
        Caption = '1. NOME OU RAZÃO SOCIAL / FONE / ENDEREÇO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 794
        mmTop = 20638
        mmWidth = 50006
        BandType = 4
      end
      object rpGPSLabel5: TppLabel
        UserName = 'Label5'
        Caption = '2. VENCIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 794
        mmTop = 41540
        mmWidth = 16404
        BandType = 4
      end
      object rpGPSLabel6: TppLabel
        UserName = 'Label6'
        Caption = '(Uso exclusivo INSS)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 794
        mmTop = 44979
        mmWidth = 19844
        BandType = 4
      end
      object rpGPSLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 
          'ATENÇÃO: É vedada a utilização de GPS para recolhimento de  rece' +
          'ita  de  valor  inferior  ao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 1058
        mmTop = 51858
        mmWidth = 83344
        BandType = 4
      end
      object rpGPSLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 
          'estipulado em Resolução publicada pelo INSS. A receita que resul' +
          'tar valor inferior deverá ser'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 1058
        mmTop = 55298
        mmWidth = 83344
        BandType = 4
      end
      object rpGPSLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 
          'adicionada à contribuição ou importância correspondente nos mese' +
          's subseqüentes, até que o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 1058
        mmTop = 58738
        mmWidth = 83344
        BandType = 4
      end
      object rpGPSLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'total seja igual ou superior ao valor mínimo.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 1058
        mmTop = 62177
        mmWidth = 42863
        BandType = 4
      end
      object rpGPSLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'INSTRUÇÕES DE PREENCHIMENTO NO VERSO.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 14023
        mmTop = 69321
        mmWidth = 48683
        BandType = 4
      end
      object rpGPSLabel21: TppLabel
        UserName = 'Label12'
        Caption = '12. AUTENTICAÇÃO BANCÁRIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 67469
        mmTop = 77258
        mmWidth = 31221
        BandType = 4
      end
      object rpGPSLabel12: TppLabel
        UserName = 'Label13'
        Caption = '3. CÓDIGO DE PAGAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 1588
        mmWidth = 28310
        BandType = 4
      end
      object rpGPSLabel13: TppLabel
        UserName = 'Label14'
        Caption = '4. COMPETÊNCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 7938
        mmWidth = 17727
        BandType = 4
      end
      object rpGPSLabel14: TppLabel
        UserName = 'Label15'
        Caption = '5. IDENTIFICADOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 14552
        mmWidth = 18521
        BandType = 4
      end
      object rpGPSLabel15: TppLabel
        UserName = 'Label16'
        Caption = '6. VALOR DO INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 21431
        mmWidth = 18785
        BandType = 4
      end
      object rpGPSLabel17: TppLabel
        UserName = 'Label18'
        Caption = '8.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 35454
        mmWidth = 1852
        BandType = 4
      end
      object rpGPSLabel18: TppLabel
        UserName = 'Label19'
        Caption = '9. VALOR DE OUTRAS ENTIDADES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 43127
        mmWidth = 34925
        BandType = 4
      end
      object rpGPSLabel19: TppLabel
        UserName = 'Label20'
        Caption = '10. ATM / MULTA E JUROS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 56886
        mmWidth = 26723
        BandType = 4
      end
      object rpGPSLabel20: TppLabel
        UserName = 'Label21'
        Caption = '11. TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 69586
        mmWidth = 10054
        BandType = 4
      end
      object rpGPSDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'EMPRESA'
        DataPipeline = ppGPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 24606
        mmWidth = 84931
        BandType = 4
      end
      object rpGPSImage1: TppImage
        UserName = 'Image1'
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
        mmLeft = 1588
        mmTop = 1852
        mmWidth = 7673
        BandType = 4
      end
      object rpGPSDBText2: TppDBText
        OnPrint = rpGPSDBText2Print
        UserName = 'DBText2'
        DataField = 'RUA'
        DataPipeline = ppGPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 28310
        mmWidth = 84931
        BandType = 4
      end
      object rpGPSDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'BAIRRO'
        DataPipeline = ppGPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 32015
        mmWidth = 39688
        BandType = 4
      end
      object rpGPSDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CIDADE'
        DataPipeline = ppGPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 45244
        mmTop = 32015
        mmWidth = 40481
        BandType = 4
      end
      object rpGPSLblMes1: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 7938
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSDBText6: TppDBText
        UserName = 'DBText5'
        DataField = 'CGC'
        DataPipeline = ppGPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 14552
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSLblINSS1: TppLabel
        OnPrint = rpGPSLblINSS1Print
        UserName = 'rpGPSLblINSS1'
        AutoSize = False
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 21167
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSLbl7Valor1: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 28575
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSLbl71: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 89429
        mmTop = 28575
        mmWidth = 38100
        BandType = 4
      end
      object rpGPSLbl81: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 89429
        mmTop = 35454
        mmWidth = 38100
        BandType = 4
      end
      object rpGPSLbl8Valor1: TppLabel
        UserName = 'rpGPSLbl8Valor1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 35454
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSLblMultaJuros1: TppLabel
        OnPrint = rpGPSLblMultaJuros1Print
        UserName = 'rpGPSLblMultaJuros1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 57415
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSLblTotal1: TppLabel
        UserName = 'rpGPSLblTotal1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 69321
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSLblTerceiros1: TppLabel
        OnPrint = rpGPSLblTerceiros1Print
        UserName = 'rpGPSLblTerceiros1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 43127
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSLblCodPag1: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 1588
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSDBText5: TppDBText
        OnPrint = rpGPSDBText5Print
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'TELEFONE'
        DataPipeline = ppGPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 2381
        mmLeft = 794
        mmTop = 35719
        mmWidth = 11113
        BandType = 4
      end
      object rpGPSLabel16: TppLabel
        UserName = 'Label17'
        Caption = '7.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 28575
        mmWidth = 1852
        BandType = 4
      end
      object rpGPSShape7: TppShape
        UserName = 'Shape7'
        mmHeight = 74613
        mmLeft = 0
        mmTop = 114565
        mmWidth = 172773
        BandType = 4
      end
      object rpGPSShape8: TppShape
        UserName = 'Shape8'
        mmHeight = 74613
        mmLeft = 86519
        mmTop = 114565
        mmWidth = 42333
        BandType = 4
      end
      object rpGPSShape10: TppShape
        UserName = 'Shape9'
        Brush.Style = bsClear
        mmHeight = 7408
        mmLeft = 86519
        mmTop = 140759
        mmWidth = 86254
        BandType = 4
      end
      object rpGPSShape11: TppShape
        UserName = 'Shape10'
        Brush.Style = bsClear
        mmHeight = 8202
        mmLeft = 0
        mmTop = 154782
        mmWidth = 172773
        BandType = 4
      end
      object rpGPSShape9: TppShape
        UserName = 'Shape11'
        Brush.Style = bsClear
        mmHeight = 7144
        mmLeft = 86519
        mmTop = 120650
        mmWidth = 86254
        BandType = 4
      end
      object rpGPSShape12: TppShape
        UserName = 'Shape12'
        mmHeight = 17463
        mmLeft = 0
        mmTop = 190236
        mmWidth = 172773
        BandType = 4
      end
      object rpGPSLine5: TppLine
        UserName = 'rpGPSLine5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8202
        mmLeft = 31221
        mmTop = 154782
        mmWidth = 1323
        BandType = 4
      end
      object rpGPSLine6: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 181505
        mmWidth = 172773
        BandType = 4
      end
      object rpGPSLine4: TppLine
        UserName = 'Line5'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 134144
        mmWidth = 172509
        BandType = 4
      end
      object rpGPSLabel24: TppLabel
        UserName = 'Label32'
        Caption = 'GUIA DA PREVIDÊNCIA SOCIAL - GPS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 15875
        mmTop = 127529
        mmWidth = 44450
        BandType = 4
      end
      object rpGPSLabel22: TppLabel
        UserName = 'Label33'
        Caption = 'MINISTÉRIO DA PREVIDÊNCIA E ASSISTÊNCIA SOCIAL - MPAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 12435
        mmTop = 117211
        mmWidth = 63236
        BandType = 4
      end
      object rpGPSLabel23: TppLabel
        UserName = 'Label34'
        Caption = 'INSTITUTO NACIONA DE SEGURO SOCIAL - INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 12435
        mmTop = 120386
        mmWidth = 49213
        BandType = 4
      end
      object rpGPSLabel25: TppLabel
        UserName = 'Label35'
        Caption = '1. NOME OU RAZÃO SOCIAL / FONE / ENDEREÇO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 794
        mmTop = 135202
        mmWidth = 50006
        BandType = 4
      end
      object rpGPSLabel26: TppLabel
        UserName = 'Label36'
        Caption = '2. VENCIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 794
        mmTop = 156104
        mmWidth = 16404
        BandType = 4
      end
      object rpGPSLabel27: TppLabel
        UserName = 'Label37'
        Caption = '(Uso exclusivo INSS)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 794
        mmTop = 159544
        mmWidth = 19844
        BandType = 4
      end
      object rpGPSLabel28: TppLabel
        UserName = 'Label38'
        AutoSize = False
        Caption = 
          'ATENÇÃO: É vedada a utilização de GPS para recolhimento de  rece' +
          'ita  de  valor  inferior  ao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 1058
        mmTop = 166423
        mmWidth = 83344
        BandType = 4
      end
      object rpGPSLabel29: TppLabel
        UserName = 'Label39'
        AutoSize = False
        Caption = 
          'estipulado em Resolução publicada pelo INSS. A receita que resul' +
          'tar valor inferior deverá ser'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 1058
        mmTop = 169863
        mmWidth = 83344
        BandType = 4
      end
      object rpGPSLabel30: TppLabel
        UserName = 'Label103'
        AutoSize = False
        Caption = 
          'adicionada à contribuição ou importância correspondente nos mese' +
          's subseqüentes, até que o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 1058
        mmTop = 173302
        mmWidth = 83344
        BandType = 4
      end
      object rpGPSLabel31: TppLabel
        UserName = 'Label104'
        AutoSize = False
        Caption = 'total seja igual ou superior ao valor mínimo.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 1058
        mmTop = 176742
        mmWidth = 42863
        BandType = 4
      end
      object rpGPSLabel32: TppLabel
        UserName = 'Label40'
        Caption = 'INSTRUÇÕES DE PREENCHIMENTO NO VERSO.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 14023
        mmTop = 183886
        mmWidth = 48683
        BandType = 4
      end
      object rpGPSLabel42: TppLabel
        UserName = 'Label41'
        Caption = '12. AUTENTICAÇÃO BANCÁRIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 67469
        mmTop = 191823
        mmWidth = 31221
        BandType = 4
      end
      object rpGPSLabel33: TppLabel
        UserName = 'Label42'
        Caption = '3. CÓDIGO DE PAGAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 116152
        mmWidth = 28310
        BandType = 4
      end
      object rpGPSLabel34: TppLabel
        UserName = 'Label43'
        Caption = '4. COMPETÊNCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 122502
        mmWidth = 17727
        BandType = 4
      end
      object rpGPSLabel35: TppLabel
        UserName = 'Label44'
        Caption = '5. IDENTIFICADOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 129117
        mmWidth = 18521
        BandType = 4
      end
      object rpGPSLabel36: TppLabel
        UserName = 'Label45'
        Caption = '6. VALOR DO INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 135996
        mmWidth = 18785
        BandType = 4
      end
      object rpGPSLabel38: TppLabel
        UserName = 'Label46'
        Caption = '8.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 150019
        mmWidth = 1852
        BandType = 4
      end
      object rpGPSLabel39: TppLabel
        UserName = 'Label47'
        Caption = '9. VALOR DE OUTRAS ENTIDADES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 157692
        mmWidth = 34925
        BandType = 4
      end
      object rpGPSLabel40: TppLabel
        UserName = 'Label201'
        Caption = '10. ATM / MULTA E JUROS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 171450
        mmWidth = 26723
        BandType = 4
      end
      object rpGPSLabel41: TppLabel
        UserName = 'Label48'
        Caption = '11. TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 184150
        mmWidth = 10054
        BandType = 4
      end
      object rpGPSDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'EMPRESA'
        DataPipeline = ppGPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 139171
        mmWidth = 84931
        BandType = 4
      end
      object rpGPSImage2: TppImage
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
        mmLeft = 1588
        mmTop = 116417
        mmWidth = 7673
        BandType = 4
      end
      object rpGPSDBText8: TppDBText
        OnPrint = rpGPSDBText2Print
        UserName = 'DBText8'
        DataField = 'RUA'
        DataPipeline = ppGPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 142875
        mmWidth = 84931
        BandType = 4
      end
      object rpGPSDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'BAIRRO'
        DataPipeline = ppGPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 146579
        mmWidth = 39688
        BandType = 4
      end
      object rpGPSDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CIDADE'
        DataPipeline = ppGPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 45244
        mmTop = 146579
        mmWidth = 40481
        BandType = 4
      end
      object rpGPSLblMes2: TppLabel
        UserName = 'rpGPSLblMes2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 122502
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSDBText12: TppDBText
        UserName = 'DBText11'
        DataField = 'CGC'
        DataPipeline = ppGPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 129117
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSLblINSS2: TppLabel
        UserName = 'rpGPSLblINSS2'
        AutoSize = False
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 135732
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSLbl7Valor2: TppLabel
        UserName = 'rpGPSLbl7Valor2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 143140
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSLbl72: TppLabel
        UserName = 'rpGPSLbl7'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 89429
        mmTop = 143140
        mmWidth = 38100
        BandType = 4
      end
      object rpGPSLbl82: TppLabel
        UserName = 'rpGPSLbl82'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 89429
        mmTop = 150019
        mmWidth = 38100
        BandType = 4
      end
      object rpGPSLbl8Valor2: TppLabel
        UserName = 'rpGPSLbl8Valor2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 150019
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSLblMultaJuros2: TppLabel
        UserName = 'rpGPSLblMultaJuros2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 171980
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSLblTotal2: TppLabel
        UserName = 'rpGPSLblTotal2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 183886
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSLblTerceiros2: TppLabel
        UserName = 'rpGPSLblTerceiros2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 157692
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSLblCodPag2: TppLabel
        UserName = 'rpGPSLblCodPag2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 116152
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSDBText11: TppDBText
        OnPrint = rpGPSDBText5Print
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'TELEFONE'
        DataPipeline = ppGPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 2381
        mmLeft = 794
        mmTop = 150284
        mmWidth = 11113
        BandType = 4
      end
      object rpGPSLabel37: TppLabel
        UserName = 'Label58'
        Caption = '7.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 87313
        mmTop = 143140
        mmWidth = 1852
        BandType = 4
      end
    end
    object rpGPSSmryBnd: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 1000
      mmPrintPosition = 0
    end
    object rpGPSGrp: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppGPS
      NewPage = True
      UserName = 'rpGPSGrp'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpGPSGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpGPSGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppGPS: TppBDEPipeline
    DataSource = dsGPS
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'GPS'
    Left = 206
    Top = 48
  end
  object dsGPS: TwwDataSource
    DataSet = CdsGPS
    Left = 206
    Top = 96
  end
  object sqlGPS: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'1'#39' AS ESTAB,'
      '  '#39'2'#39' AS MATRICULA,'
      '  '#39'3'#39' AS LOGRADOURO,'
      '  '#39'4'#39' AS CIDADE,'
      '  '#39'5'#39' AS BAIRRO,'
      '  '#39'6'#39' AS CEP,'
      '  '#39'7'#39' AS ESTCIVIL,'
      '  '#39'8'#39' AS CTPS,'
      '  '#39'9'#39' AS CTPS_UF,'
      '  '#39'0'#39' AS CPF,'
      '  '#39'1'#39' AS TELEFONE,'
      '  '#39'2'#39' AS UF,'
      '  '#39'3'#39' AS EMPREGADO,'
      '  '#39'4'#39' AS DEPENDENTE,'
      '  '#39'5'#39' AS DATANASC,'
      '  '#39'6'#39' AS DEPENDENCIA'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)'
      ' ')
    ClientDataSet = CdsGPS
    Left = 206
    Top = 190
  end
  object CdsGPS: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsGPSAfterOpen
    AfterScroll = CdsGPSAfterScroll
    Left = 206
    Top = 144
  end
end
