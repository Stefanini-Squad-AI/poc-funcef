inherited RptGRCS: TRptGRCS
  Left = 253
  Top = 188
  Width = 253
  Height = 270
  Caption = 'RptGRCS'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'IdSindicato'
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
        Name = 'IdSindicato'
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
        Caption = 'ListaIdRubricaRemSel'
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
        Name = 'ListaIdRubricaRemSel'
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
        Caption = 'ListaIdRubricaContrib'
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
        Name = 'ListaIdRubricaContrib'
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
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpGRCS
    ConnectionType = cntBDE
  end
  object rpGRCS: TppReport
    AutoStop = False
    DataPipeline = ppGRCS
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Impresso GRCS'
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
    Left = 198
    Version = '5.5'
    mmColumnWidth = 284300
    object rpGRCSDtlBnd: TppDetailBand
      BeforePrint = rpGRCSDtlBndBeforePrint
      mmBottomOffset = 0
      mmHeight = 170657
      mmPrintPosition = 0
      object rpGRCSShape1: TppShape
        UserName = 'Shape1'
        Brush.Style = bsClear
        Shape = stRoundRect
        mmHeight = 40217
        mmLeft = 111919
        mmTop = 1323
        mmWidth = 78317
        BandType = 4
      end
      object rpGRCSShape6: TppShape
        UserName = 'Shape2'
        Brush.Style = bsClear
        Shape = stRoundRect
        mmHeight = 35190
        mmLeft = 8467
        mmTop = 68527
        mmWidth = 237067
        BandType = 4
      end
      object rpGRCSShape38: TppShape
        UserName = 'Shape3'
        mmHeight = 7673
        mmLeft = 8467
        mmTop = 87842
        mmWidth = 237067
        BandType = 4
      end
      object rpCRPagosImage1: TppImage
        UserName = 'Image1'
        Center = False
        MaintainAspectRatio = False
        Stretch = True
        Transparent = True
        Picture.Data = {
          07544269746D61701E220000424D1E2200000000000036040000280000005500
          0000570000000100080000000000E81D00000000000000000000000100000001
          0000C0C0C000000080000080000000808000800000008000800080800000C0C0
          C000C0DCC000F0C8A4005BEFFF00DFE7DF00BFE7EF0073EFFF00CFE7EF008FEF
          FF00DFE7EF00E7E7E700CFCFCF0097EFFF0087F7FF00AFEFFF00B7EFFF00C7EF
          FF00DFEFF700000083000083000000838300830000008300830083830000C3C3
          C300C3DFC300EFCBA7000B1B2B0000331B00001B4B006333000000332B000013
          7300333B130000431B00533B13003343130000432B00333B2B0000334B004B3B
          2B00001B8F00134B2B0023335300004B33001B433B004B4B1B0000532B002B4B
          330000337300004B43007353130000533B0023337300004B53001B4B4B000053
          430000338F001B4B53001B5B3B005353330073532B008F5B1300534B4B00135B
          430000633B002B534B00A75B13004B4B5300005B53004B534B007B631B005353
          4B009F6313000033AF0000536B008F5B2B004B535300135B5B00536333000B63
          5300A75B2B0073633300336B3B009F6323008F632B00AF6B1300635B4B002B63
          5300735B4B004B634B0033537300635B53004B4B4B008F6333004B5B63005B63
          4B0000636B00735B53001B636300A76B230053535300B76B230000539700875B
          53004B635B0053635B009F732300976B33008F732B00A76B3300003BCF00B773
          23008F73330000736B005B734B006B6B5300AF732B00A7733300006B7B001B6B
          730097733B000053B7001B736B00B78713004B735B00536B6B005B735B002B73
          6B0097734B00007B7300B77B33001B7B7300A77B43000053CF006B736B000000
          0000AF8733000B7397002B738F001387730033876B008F736B000073AF00335B
          CF00538773006B876B00005BE700006BCF00AF8F53006B7B8F003373B7000B8F
          97002B8F8F00006BE700978F7300138FA700008FAF004B978F003B73D7001B8F
          B700738F97005B7BBF00008FBF00AF9773001397AF000097B7002B97AF000B9F
          AF001B97B7001BA79F004B97AF0023A79F00979797000097CF006B97AF0043A7
          9F000BA7B7006BA797002B97CF00AF9F8F000097E7008F97B700BFAF73005397
          CF0000A7CF006B97CF002BAFB70097AF97001BA7D700A7A7A70013AFCF0053AF
          B7006BAFAF0000AFD700AFAF9F000BB7C7002BAFCF001BB7CF00C7B7970097AF
          B700B7AFAF000BB7DF0000B7E7001BB7DF00AFB7AF0053B7CF00B7B7AF002BB7
          E7006BB7CF00B7B7B700AFBFB70097B7CF00C7BFAF0013C7DF002BC7DF00AFB7
          CF0073B7E70043BFE7004BC7DF000BCFEF00BFC7BF0073CFD700CFCFB70033CF
          EF008FCFD700B7CFCF0053D7EF0073D7EF008FD7EF00B7D7EF000BEFFF001BEF
          FF00E7DFDF002BEFFF00CFDFE70013F7FF009FE7EF00AFE7EF00F0FBFF00A4A0
          A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF15A1EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF11FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBABBBAB886B88FFFFFFFFFFFFFFFF
          FFFF63508888ABBBBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFABAB7B6F4553505D5D65FFFFFFF6FFF6F6FFFFFF885D455D6B4A
          5B8888ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA25C7B45
          7F5A454A4A7C4573FFFFFFE1EAE7D5FFFF5E885D453A4A455D699F617B8895FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88534B9F495F495F5D5053455B53
          FFFFEDE3EFE391D8FFFF88454A4A5D5D5D99934C793A6BFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFBBAB4F43823F5547355C3A455B452553F8FFFFFFE3C6D22EB2
          FFFF63353A3A453A45505F353750533A455CB4BBFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D8E
          8E9F49915667353A445345453A438EBB88958E39522623329595BB8025453A45
          454A433A4550505D73AE457395FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888770875A447C3A3A3A45
          453A3A5C3A5C6428A794913B7E919FC049823766493A353A453A4550453A454A
          854253AE8778B4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF6587A05F49437C8C9544454525442A313566559149
          AE7FB857CC93B8DE378B39C29FB85744433A443A453A3A44714488CD9F596595
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF95713594B8573AABA2A1BB3A353549914CAF377BA37E897E7E9F57A0936A89
          7FA32E919FB55782AF6A7F35453A53A2ABA19D89854FAF857BBBFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF7BA53B49654971BB
          FFFFA24425AF3B68573BC06A5BAE554949858E8785856349994F8743626843C6
          9F9F91577BA02844B4A1A1595CA0B88B4588ABFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFF5D8568A04345FFFFFFFF3A4FA4681B4952
          B51B4937887BC3EAF218E9E3E3D2B5DBF618E6E6A27B6B4D5591AF42A5B82C93
          3795A1A1A2929F3A6BAA4995FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFAB658045864843FFFFFF8845AF57B1B17F49497B7BD61194EAEAEA
          16ECECD2E3E396D517EDEA13CC91DBD61212433AAE93919F9F47BDBBA1888873
          85B3AE3ABBFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF88596882
          4550ABFFFFBB43494D7E9F919F498ECACF0EFFF6A7C0ADB5DECC9E8D9B9B8152
          E1E7D3B5C0AA13FFFF12BB127137D11B9FD23992A2FFFFFFA5A443506B8CFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF885C94579F5688FFFF887B966A
          AD57793B98CF98425747A5F0A357594952916E52A99E816EAA7E498687A4ECDB
          5F5F87CF0B88598EA4579FAF4C4FFFFFFF5C455D5D6B88FFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFF86B7C6B5C893499FFFF78432CAF579F397B85292C2937
          3329232E6E8245506B883C511810972E7B5C737C85A4392C232C26577FC86143
          7B6EAF4C52C249FFFFFF455D6B506B95FFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FF8C6B6B507C59A8FFFFAB65A3CB529364CF161555232C3329332C26A45F4553
          44883C81ED10A92E59655C5B8E912E293926332C2C47EBE5675C4D9F96682B8C
          FFFFA2535D585D7D88FFFFFFFFFFFF000000FFFFFFFFFFFFA25B453A5D50BBFF
          FFFF455B7BA457359DF6EC98332C23292C292300915261A0AFA3278D9BA68D52
          B5A3A794AF9133292C363F262691EC15E8444E44575C7550FFFFFFBB5D3A5D5C
          7788FFFFFFFFFF000000FFFFFFFFFFA26BBB5E5DABFFFFFFFF888C4577595960
          E985573B33263326232626299BD296AA682E2EBCD796403224529F9BD1913326
          4C262C2E3B333F0F16CA5065446B5D58FFFFFFFFFF5B6B65445DB4FFFFFFFF00
          0000FFFFFFFF8E73FF5E7B5DABFFFFFFFF5E5D503A726B497E264C26333B2336
          292933263324A70F4D5C46F2F6DF9D444362EA0D2B2423262329392C224C2C7F
          ECD84F506B5C6B45FFFFFFFFFFA26B8E957B53BDFFFFFF000000FFFFFFFFA2FF
          FFFF5C53B4FFFFFFFFFF5350456B7BA8D3C052262C232326002326233333C7E9
          4943441218B46C442F6EECEC492633002C262C3B2C263391B5ADD5446B45455B
          FFFFFFFFFFFF885BFFFFC38EFFFFFF000000FFFFFFFFFFFFFFFFFFBBFFFFFFFF
          FF0B435C5350D5DBDE91B5A45226002C262C23262C377B7B442F2FF218DB8E35
          22439598432E332C332639262691B5D2B591EAA84E6B5344FFFFFFFFFFFFFF65
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF172B445D43EDB2
          96968D81AAD268002323232337456B6B5349B6EDF6B6A81237585B5D53534326
          2C262352D2C9918D962E68EB5F505B44FFFFFFFFFFFFFFA27BFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF984453EBD5496E968D8D8D51B5C0
          39263F2D75505D5B734FB618F6BDB6C52F505D5C45444D573352D2E396518D8D
          963D57AEE5357362E216FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF18A1A5D8B28B332EB58D383840409BB5B5A3923745536B
          658EEC1818C3B6F2A57B6550603EB2AFC0B5B58D8D8151A196AE0D1313E5C7EA
          13FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF0D0F13DBC74C22E351B54C2627308D9BB5AAAF8985D8E9EB15F218DB9DF2
          13E8E8B692B5DDB59B5151D2C92C519AAACC0D15130D130F13FFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17E857553F342E
          26C981BCDD392C2624408D8D81D1E3AEEA131618F6CFCFF21515B2C0E3AD81A1
          8DD2E3EEAF2E769B96EB0F131316141313FFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E423B332C2C26B2969681D2D2333B
          23262E408D3096D2AAB0EBEDF6C89DEDD596D2D2818DA1B5E3D2EEB833249A6E
          6E4CA01BD50D1314135EFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFC8A53B2C263B262427389B51E3FBB83F3B3B3F332E385181
          9BB5B5C7DBB4AEBAC9B5968D9BBCE3EEEFFBDD3F3B278D9152333F2668D5C7E5
          E5FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFE50F
          CF47232C33262E403852B551D2EFEE893357333B392C2E24519BAAD2C9C0D1C0
          968D8DD2E3EFEEEEEEEF573B2C308D81392C332C5757333B47CC15FFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF15160F1513A5483926262C3926
          2727AA8D9BEEEEEE3B3B333B4C3B4CB5C0B8A0916A527EA0ADC9C0D2E3EEF1EF
          E3933B3B268181B52626332C33263B96F116160D1717FFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF170D1613D857262C39332C4C262791B581B5D2EEEE
          DD39334C5796C05F38448877A2A26B737B6155B0CDD2E3F3AF483F3333516EA4
          33394C33332C7EEB150D0D160D141516FFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFF150F13C8332C3F232C3F262626396E9B81EFEFEEEEAD68AA9F494488
          E6A25B5DE4CE7C5DB4E6535C7B9FB8CC484836332E766E9126362633333355EB
          13131313130A0DF5FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF15150D98
          3F3B333B332633262E3B27B540E3EEEFF3B89F684450455BE45B45357B7B7B3A
          9588735088A25FAA7E3B3929408D7E3D2626333B263B236AC2D8ED0A0A1617FF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF140FB9577ED52C3326392326
          33333D918DC9FBEFD1AF4345E89C5D734FA0CBC2A4B8B8C29F4D906BCFE67856
          963D364C5251BC263326262957263B265791E71317140DFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFF150AEA13A52C2C23262623232C39918D96F1D2
          9F357550CA656793B25A44597450594E56A0914943886B7C7B963F3B408DB526
          33292C2C23362C2C6A1015130D16FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFF160F0F0F3B2E2E2E3F33263B3339918181E39F7B885B5D65928B5F
          5C5B6B5D5D7CABA2887B448768545D95CA86912E5181D12633393B333B2C573F
          3D8BD5E51413FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFE80A0D16
          15CC274038BD332C333BA7CC40817E37D412533AAA4225505D505D7C5D5DAB10
          11A245507B6843BB12787B966E919629363B33823329293B3F1B9FF41718FFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF161518150DEB62246E40ED5739
          A039AECC816E8B5B7DA262AA37775D7C7C7D5D5D53BB18F618AB5D835D4F9F5E
          736B8C4981B552A53B263F9187269FE30D1618140D0DFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFF18160D0FEBC75524382727EBC74CE834D5BF52A43A6B
          6B7B91435D6B5D7C5D505D5D6B8AABF2CEBB457C5D507155595B9C8E7EA491EA
          573F33BF872C3F6A851BE215E9D818FFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFE8151316E8872C262E2E243E87D587D8E815B29668A2AB4A8785505D6B5D7C
          5D5D6B8A5D5D5DA25B7C505D6B5D778E5F8812CA8796CCEDA53B57C847332C3B
          3B2E47D8161516F5EDFFFFFFFFFFFF000000FFFFFFFFFF181316170F0D6A5724
          3D263324268933AEF50D17B69F35BBCA889159505D504550835D5D50776B6B5C
          7C7C747C5D7C5D75877BBB9585A4B51513943362333B3F3933393F7EE20D0D15
          17FFFFFFFFFFFF000000FFFFFFFFFFFF17130D0DC733333B2636262C33294C3F
          D815E891395B8C5C92375D5D5D6B5D5D6B5D6B5D5D6B6B5D6B7C5D5D5D5D905D
          7B616B7D5BA733BA0FC857373926263F263F2C39871516130D0D0FFFFFFFFF00
          0000FFFFFFFFFFFFFF0F1315A52C3333332C2C26333926397ED8AAC0495B6B5C
          AA446B455D505D5D5D506B5D6B7C6B7C5D506B5D6B505D7C743F6B6B6BA06EB8
          CC15872C332C3333232C332C33960D0D0D16FFFFFFFFFF000000FFFFFFFFFFFF
          FF0C0DD55726392C3333233B2C3933392EC0B5AA49AB8871525D9CA243655D5D
          6B5D5D7C775D7C5D5D6B5D6B5D7C5D5D7C8744CFBB98AA96B5A7E52C2C3B332C
          26263B2C3B3FEB131515FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF42292326
          362623292C293F82B5A48D914310A292375BDBFF10885D506B506B835D7C5D7C
          5D505D505D5D5D505D5F56BD888EC981AAC0523B232C29362C2629362C3B9F0D
          0D18FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFE53B333B3339293336264C39B5
          B5768D9153A2658770A212F612535D6B5D5D5D5D7C5D735D7C7C5D5D5D5D7C5D
          5D87435D7D88D28D8DB5AF3D332C3B33333F263B3F33A0FFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFE5332C3329292C23363326B5C09A81395274505DA5
          6150BBD6AB885D5D5D505D5D6B5BCACA74725D906B505D5D778E4D907788E3E3
          9B8DB591333B2C3B29293333332C3FC7FFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFF5944C57333B2626332C33B5B58D81393B68598A44876777757590835D5D
          5D5D7C5D585D9DE9505D5D505D457C5D6DA537CAABA2D1F3E3768DB59F263F3B
          3B3F39338BA05752EDFFFFFFFFFFFF000000FFFFFFFFFFFFFF0E13B6D8473F29
          29272726B5A451812E4C337E59DFBB8E525D5D505D6B5D507C5D5D7C7C507D50
          6B5D7BCACA1245506B8567B6128EC9EFEEE38D8DB51B335748263F2CA3140AE8
          10FFFFFFFFFFFF000000FFFFFFFFFFFFFF130D0DE557263B2C273896B58D8126
          3F2C3B9149A2BB12525D6B5D5D5D5D5D5D5D5D5D5D5D5D7C5D5D7BF6FFAB7C7C
          7D94448C53A5D1F1EFE3D29B8DB5A43F333B3B3BA0151516FFFFFFFFFFFFFF00
          0000FFFFFFFFFFFF0C0F13130DC7573B3938B5B58D6E523B573B3F6E336B6B5D
          7E3A455D6B505D5D6B506B5D5D7C5D5D5D7CC3F210A2745DA27F6B6B53AEE3EF
          F1EFEED29B8DAAA43FA0A53B960F14130B5EFFFFFFFFFF000000FFFFFFFFFFFF
          0F0D0D0F0F13A53B39D1AD8D812E3F3B3B3F337E4C535D45705F457C5D6B5D7C
          5D5D5D5D7C5D5D5D5D7C7CBB8872505D8549CAAB44AEC0E3F3F1EEEED28D8DAF
          AF910DA56813151314F4FFFFFFFFFF000000FFFFFFFFFFFF1715130F0D148B4C
          B5A4515126573F4C89A4E3E3AD43BBE944A035507C5D5D7C5D7C5D7C5D5D6B50
          7C506B7C745D6B65AA9D11CE858939579FE7EEEFEEBC8D8DD1A4BFB2890F130F
          1316FFFFFFFFFF000000FFFFFFFFFFFFF50D161515155791C98D812E3F689FB8
          EFEEEFFBB5529CD65C8E5F5D5D5D6B5D6B59657D5D5D5D5D5D5D5D7C7C5D5DC8
          496DAB4492573B573B3389CBE3E3BC8D81E3A4C7E70D16161616F4FFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF150DC1A7B59B812E9FAFD2EEFBEEEEEEEFE3AA7A7C
          6B5C875A6B4A5D5BABED1F7B837C5D5D6B50455D5D509D8256506B69963B573B
          333F363B571BAF96819BC9AEE5150D1315FFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFEBA4E38D9A6E81D1E3DDF3E3F1EEEEF1FBCD575012AB437E5F585D6B
          DFF6F6885D7D7C5D7C5D5D5D7CA28B95D6735BB2683F3B3B573F683B3B572E52
          519A9BD2A4EC17FFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFD5E3AA96
          9B8D9BA19B8D819BC0D2E3E3E3EE965F88F2AB5049826B506BED1F595D505D72
          5D6B5D50859143CAE4729DA4333B573939392E6E818D8D9AA1A18D9BEAA4FFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFC8C9D2C0D2D2D2B5B59B9B9B
          9B8D8D8D9B9B96914D885B7C885F9F707B535D7C5D77775D6B80A2C293447772
          88A8B56E6E81768D8D8D9AA19BB59BB596C9C0D1D3E3A8FFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFE8E1EC4152249B917E96B5D2D2C0BCB59B9B8D81
          9F566B7CC3CA7B557EAE987B887B7BA8B794877A9DB4727C8EA481818D969B9B
          BCBCB5B5AC969191A7D2D2EAEAB6FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFF16EAA53B3940263357243D2E3891B5D2D2E3E396AA435DE9E45C7C
          5F6157B1A0A0C28757705C74BECA808ED2B5E3E3D2D1AA52522E3DA352393F4C
          D516160D15FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFE50F13EA
          5791DD4C3926394C2E523F243D246E9696AA7E52539C6B8012D96B7C877B7450
          CA1280728C88A7AA6E969BAE9F4C573B526896B2264C577EEC0D0D161517FFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFEC0F0D0F94B2C82633392C33
          39333F57333F6AD80DE8AE91AA847B88CEAB6B6B12D9729088CE7812A8B5AAAE
          0F1316A557877E899F0ADA263F333B910D0F0F1314FFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFF130D0DEBD5A4E53B3D3B3D3B392C393B3352CCE5
          1316ED91AA389182877B738C8C956B6BA285AFA39BB8AAED1316F4B8B3925FA0
          D8987F3B575233AE0D150D0D13160EFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFF0D0F0A130F0D17A53B5726393991AE967E33EB0D151614E8969B513D
          397EA3AACCC6C6C0A4C0D2769BB5EB1316131894573B57573B4C266A6A3F57C7
          17E715130A0D10FFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF1713EB150F
          0F150AEB873B3F3B332E2E96EBA587C8ECE8130F91D28D52333B333B39C0E3E3
          F1EFACA1B5C6EC161315B93B333B3329263B3349982C89EB0F170D14170F0DFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF5130F139839A057
          2E243840413B3F333D87D813E896B5813F573B573FE3EFF1F1F19B9BC9D51613
          E9A5574C3F3339393F3F3979877EEA14130D1515E8FFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E1715B3B013C757384026333B3333
          332C576AECBA969B523B33484CDEF1EFF1C69BB5D3EB0D176A3F573633362C23
          332C333B57E2131617FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF16150F160DE855AF523F3D3F3F333B3B92EA0FE8AD96
          9B5748573BD2EEEEE3AA81CCD3E5E80D0C0AEDCB493F363957335794E7170D0F
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF1515150F13EBDEEB87393F3B332C263B7ED8ECEBCCB58D523F3B89DDF1EF
          E78D9BB5ECBA6E9181C8ECCF333B3F2C333B3FE1170D1515FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF13150FF50D0F
          150FC83F3F3F3B2C4C3F3D3387A0A5C08D9648573BE3EFF1969BB5D715ECD5C1
          912EA05748392C333B3B7EEC13160F17FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF170F130D130F0D16EC943F683339
          3D3D523B683F7E91D28D6E3B3FD2F1D28D9BC0D5ECBA6E527E9133AE39265268
          573BE50D0D0D1513FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF0D150D0F0D13170A17C7573FC2A04C3B3F3F3B573FD8
          D29B6E574CE3EF8D9BB5D7968D6E52927EEC5FE9493F92B93BC717180D0D0DFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFEB0F0D13150F171314EC57A50FA73B393B573B52D89FD28D9157C6AA9A
          96B5EDD5D7EB8755D8B251C757C20DCF89160D17150D0D14FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF160CE81715F5
          FF1415130FE5EB150DD8873F5752A068EB9BA18157CD9B81C9E116E5C8AEC852
          EABA8DAC91EB168BE517FFE8ED130D13FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E130F150D13EB
          0D0D13EAA57EE5CCEAA4B58D4C918DB596EBD59B81E7D88DEAEBD1EDEC180D0F
          E85EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1713EC150F130F16EC0F15CCEB13
          0FD5AA818D408DE7C413E0BCD717D8C4EB16150F160D1617FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF0F0F0F0D0FEB150D0FEB16130FECEBB5A48D9A9BAA
          EB13131413170D170F0FF6EA18150DF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF13150F0FEB160D15150DEC150D0F13C7B58D8DB5D70D13171315131613
          15171516141315FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17EA150D0F
          1716170F0D0D130A0D17EC91AA96AD0D0D16150F170F1715E8FF1317135E13FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FEC0F16FFFFFFF41615150F
          0D1813D8D2C9EA0A0F150F14150F17FFE8FF101515FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF150D0F0A151317BAC6EC0F
          140F0A1513FFFFFFFFFFFFFFFF16FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF140D0D0D16FFFFD8FFFF170D0D1815FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE815150FFFFFFFFFFFFFFF151317F4FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF13
          FFFFFFFFFFFFFFFFFFFFED13FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000}
        mmHeight = 15875
        mmLeft = 8996
        mmTop = 3704
        mmWidth = 15875
        BandType = 4
      end
      object rpGRCSLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'MINISTÉRIO DO TRABALHO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 26988
        mmTop = 8731
        mmWidth = 28046
        BandType = 4
      end
      object rpGRCSLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'GUIA DE RECOLHIMENTO DA CONTRIBUIÇÃO SINDICAL  -  GRCS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 26988
        mmTop = 13229
        mmWidth = 65088
        BandType = 4
      end
      object rpGRCSShape2: TppShape
        UserName = 'Shape4'
        Brush.Style = bsClear
        Shape = stRoundRect
        mmHeight = 24077
        mmLeft = 189971
        mmTop = 1323
        mmWidth = 55563
        BandType = 4
      end
      object rpGRCSShape3: TppShape
        UserName = 'Shape5'
        Brush.Style = bsClear
        Shape = stRoundRect
        mmHeight = 16404
        mmLeft = 189971
        mmTop = 25135
        mmWidth = 55563
        BandType = 4
      end
      object rpGRCSShape5: TppShape
        UserName = 'Shape6'
        Brush.Style = bsClear
        Shape = stRoundRect
        mmHeight = 27517
        mmLeft = 8467
        mmTop = 41275
        mmWidth = 237067
        BandType = 4
      end
      object rpGRCSShape7: TppShape
        UserName = 'Shape7'
        Brush.Style = bsClear
        Shape = stRoundRect
        mmHeight = 23813
        mmLeft = 120121
        mmTop = 145786
        mmWidth = 125413
        BandType = 4
      end
      object rpGRCSShape8: TppShape
        UserName = 'Shape8'
        Brush.Style = bsClear
        Shape = stRoundRect
        mmHeight = 42598
        mmLeft = 150813
        mmTop = 103452
        mmWidth = 94721
        BandType = 4
      end
      object rpGRCSShape9: TppShape
        UserName = 'Shape9'
        Brush.Style = bsClear
        Shape = stRoundRect
        mmHeight = 50006
        mmLeft = 8467
        mmTop = 103452
        mmWidth = 70115
        BandType = 4
      end
      object rpGRCSShape10: TppShape
        UserName = 'Shape10'
        Brush.Style = bsClear
        Shape = stRoundRect
        mmHeight = 42598
        mmLeft = 74083
        mmTop = 103452
        mmWidth = 76994
        BandType = 4
      end
      object rpGRCSLine2: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 189971
        mmTop = 33867
        mmWidth = 55563
        BandType = 4
      end
      object rpGRCSLine1: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7144
        mmLeft = 227542
        mmTop = 34131
        mmWidth = 1323
        BandType = 4
      end
      object rpGRCSLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        mmHeight = 2910
        mmLeft = 120121
        mmTop = 167217
        mmWidth = 125413
        BandType = 4
      end
      object rpGRCSShape4: TppShape
        UserName = 'Shape11'
        Brush.Style = bsClear
        Shape = stRoundRect
        mmHeight = 9260
        mmLeft = 8467
        mmTop = 153194
        mmWidth = 111919
        BandType = 4
      end
      object rpGRCSShape11: TppShape
        UserName = 'Shape12'
        Brush.Style = bsClear
        Shape = stCircle
        mmHeight = 4000
        mmLeft = 113506
        mmTop = 2381
        mmWidth = 4000
        BandType = 4
      end
      object rpGRCSShape12: TppShape
        UserName = 'Shape13'
        Brush.Style = bsClear
        Shape = stCircle
        mmHeight = 4000
        mmLeft = 191030
        mmTop = 1852
        mmWidth = 4000
        BandType = 4
      end
      object rpGRCSShape13: TppShape
        UserName = 'Shape14'
        Brush.Style = bsClear
        Shape = stCircle
        mmHeight = 4000
        mmLeft = 190500
        mmTop = 25665
        mmWidth = 4000
        BandType = 4
      end
      object rpGRCSShape14: TppShape
        UserName = 'Shape15'
        Shape = stCircle
        mmHeight = 4000
        mmLeft = 190500
        mmTop = 34396
        mmWidth = 4000
        BandType = 4
      end
      object rpGRCSShape15: TppShape
        UserName = 'Shape16'
        Brush.Style = bsClear
        Shape = stCircle
        mmHeight = 4000
        mmLeft = 228071
        mmTop = 34396
        mmWidth = 4000
        BandType = 4
      end
      object rpGRCSShape16: TppShape
        UserName = 'Shape17'
        mmHeight = 8202
        mmLeft = 8467
        mmTop = 44979
        mmWidth = 237067
        BandType = 4
      end
      object rpGRCSShape18: TppShape
        UserName = 'Shape18'
        Brush.Style = bsClear
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 45508
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSShape19: TppShape
        UserName = 'Shape19'
        Brush.Style = bsClear
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 53446
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSShape20: TppShape
        UserName = 'Shape20'
        Brush.Style = bsClear
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 60590
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 8467
        mmTop = 60061
        mmWidth = 237067
        BandType = 4
      end
      object rpGRCSLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15081
        mmLeft = 189971
        mmTop = 44979
        mmWidth = 1323
        BandType = 4
      end
      object rpGRCSShape17: TppShape
        UserName = 'Shape21'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 190500
        mmTop = 45508
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSShape21: TppShape
        UserName = 'Shape22'
        Brush.Style = bsClear
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 190500
        mmTop = 53446
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15610
        mmLeft = 134144
        mmTop = 52917
        mmWidth = 1323
        BandType = 4
      end
      object rpGRCSLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7408
        mmLeft = 109538
        mmTop = 52917
        mmWidth = 2646
        BandType = 4
      end
      object rpGRCSLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8202
        mmLeft = 98161
        mmTop = 60325
        mmWidth = 1323
        BandType = 4
      end
      object rpGRCSShape22: TppShape
        UserName = 'Shape23'
        Brush.Style = bsClear
        Shape = stCircle
        mmHeight = 4000
        mmLeft = 110067
        mmTop = 53446
        mmWidth = 4000
        BandType = 4
      end
      object rpGRCSShape23: TppShape
        UserName = 'Shape24'
        Brush.Style = bsClear
        Shape = stCircle
        mmHeight = 4000
        mmLeft = 98690
        mmTop = 60590
        mmWidth = 4000
        BandType = 4
      end
      object rpGRCSShape24: TppShape
        UserName = 'Shape25'
        Brush.Style = bsClear
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 134673
        mmTop = 53446
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSShape25: TppShape
        UserName = 'Shape26'
        Shape = stCircle
        mmHeight = 4000
        mmLeft = 134673
        mmTop = 60590
        mmWidth = 4000
        BandType = 4
      end
      object rpGRCSLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8202
        mmLeft = 224367
        mmTop = 60325
        mmWidth = 1323
        BandType = 4
      end
      object rpGRCSShape26: TppShape
        UserName = 'Shape27'
        Brush.Style = bsClear
        Shape = stCircle
        mmHeight = 4000
        mmLeft = 224896
        mmTop = 60590
        mmWidth = 4000
        BandType = 4
      end
      object rpGRCSShape27: TppShape
        UserName = 'Shape28'
        mmHeight = 8202
        mmLeft = 8467
        mmTop = 72231
        mmWidth = 237067
        BandType = 4
      end
      object rpGRCSShape28: TppShape
        UserName = 'Shape29'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 72761
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSShape29: TppShape
        UserName = 'Shape30'
        Brush.Style = bsClear
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 80698
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSShape30: TppShape
        UserName = 'Shape31'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 88371
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLine10: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15346
        mmLeft = 189971
        mmTop = 72496
        mmWidth = 1323
        BandType = 4
      end
      object rpGRCSShape31: TppShape
        UserName = 'Shape32'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 190500
        mmTop = 72761
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSShape32: TppShape
        UserName = 'Shape33'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 190500
        mmTop = 80698
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLine11: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15081
        mmLeft = 134409
        mmTop = 80169
        mmWidth = 1323
        BandType = 4
      end
      object rpGRCSLine12: TppLine
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 109538
        mmTop = 80169
        mmWidth = 1323
        BandType = 4
      end
      object rpGRCSLine13: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7408
        mmLeft = 44715
        mmTop = 88106
        mmWidth = 1323
        BandType = 4
      end
      object rpGRCSShape33: TppShape
        UserName = 'Shape34'
        Brush.Style = bsClear
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 110067
        mmTop = 80963
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSShape34: TppShape
        UserName = 'Shape35'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 45244
        mmTop = 88371
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSShape35: TppShape
        UserName = 'Shape36'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 134938
        mmTop = 80963
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSShape36: TppShape
        UserName = 'Shape37'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 134938
        mmTop = 88371
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSShape37: TppShape
        UserName = 'Shape38'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 223573
        mmTop = 88371
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLine14: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7408
        mmLeft = 223044
        mmTop = 88106
        mmWidth = 1323
        BandType = 4
      end
      object rpGRCSLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'CPF OU CARIMBO PADRONIZADO DO CGC DO ESTABELECIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 118004
        mmTop = 2117
        mmWidth = 60061
        BandType = 4
      end
      object rpGRCSLabel5: TppLabel
        UserName = 'Label5'
        Caption = '1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 114829
        mmTop = 3175
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel6: TppLabel
        UserName = 'Label6'
        Caption = '2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 192352
        mmTop = 2646
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'RESERVADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 195527
        mmTop = 2117
        mmWidth = 11906
        BandType = 4
      end
      object rpGRCSLabel8: TppLabel
        UserName = 'Label8'
        Caption = '3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 192088
        mmTop = 26194
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'CPF OU CGC DO ESTABELECIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 194998
        mmTop = 25929
        mmWidth = 33867
        BandType = 4
      end
      object rpGRCSLabel10: TppLabel
        UserName = 'Label10'
        Caption = '4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 192088
        mmTop = 34925
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'DATA LIMITE DE PAGAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 194998
        mmTop = 34660
        mmWidth = 27517
        BandType = 4
      end
      object rpGRCSLabel12: TppLabel
        UserName = 'Label12'
        Caption = '5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 229659
        mmTop = 34925
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'EXERC.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 232569
        mmTop = 34660
        mmWidth = 7144
        BandType = 4
      end
      object rpGRCSLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'DADOS DA ENTIDADE SINDICAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 8467
        mmTop = 41804
        mmWidth = 237067
        BandType = 4
      end
      object rpGRCSLabel15: TppLabel
        UserName = 'Label15'
        Caption = '6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 10583
        mmTop = 46038
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'NOME DA ENTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 13758
        mmTop = 45773
        mmWidth = 18785
        BandType = 4
      end
      object rpGRCSLabel17: TppLabel
        UserName = 'Label17'
        Caption = '7'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 192088
        mmTop = 46038
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'CÓDIGO DA ENTIDADE SINDICAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 195263
        mmTop = 45773
        mmWidth = 29898
        BandType = 4
      end
      object rpGRCSLabel19: TppLabel
        UserName = 'Label19'
        Caption = '8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 10583
        mmTop = 53975
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'ENDEREÇO (rua, avenida, praça, etc.)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 13758
        mmTop = 53711
        mmWidth = 32544
        BandType = 4
      end
      object rpGRCSLabel21: TppLabel
        UserName = 'Label21'
        Caption = '9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 111654
        mmTop = 53975
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'NÚMERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 114829
        mmTop = 53711
        mmWidth = 7938
        BandType = 4
      end
      object rpGRCSLabel23: TppLabel
        UserName = 'Label23'
        Caption = '10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 135732
        mmTop = 53975
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'COMPLEMENTO (andar, sala, etc.)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 139700
        mmTop = 53711
        mmWidth = 29633
        BandType = 4
      end
      object rpGRCSLabel25: TppLabel
        UserName = 'Label25'
        Caption = '11'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 191294
        mmTop = 53975
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'CGC DA ENTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 194998
        mmTop = 53711
        mmWidth = 17463
        BandType = 4
      end
      object rpGRCSLabel27: TppLabel
        UserName = 'Label27'
        Caption = '12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 10054
        mmTop = 61119
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'BAIRRO ou DISTRITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 13758
        mmTop = 60854
        mmWidth = 19315
        BandType = 4
      end
      object rpGRCSLabel29: TppLabel
        UserName = 'Label29'
        Caption = '13'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 99748
        mmTop = 61119
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 103452
        mmTop = 61119
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel31: TppLabel
        UserName = 'Label31'
        Caption = '14'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 135732
        mmTop = 61119
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'MUNICÍPIO (CIDADE)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 139436
        mmTop = 60854
        mmWidth = 18256
        BandType = 4
      end
      object rpGRCSLabel33: TppLabel
        UserName = 'Label33'
        Caption = '15'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 225955
        mmTop = 61119
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'SIGLA UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 229394
        mmTop = 60854
        mmWidth = 8467
        BandType = 4
      end
      object rpGRCSLabel35: TppLabel
        UserName = 'Label35'
        AutoSize = False
        Caption = 'DADOS DO CONTRIBUINTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 8467
        mmTop = 69056
        mmWidth = 237067
        BandType = 4
      end
      object rpGRCSLabel36: TppLabel
        UserName = 'Label36'
        Caption = '16'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 10054
        mmTop = 73290
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'NOME / RAZÃO SOCIAL / DENOMINAÇÃO SOCIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 13758
        mmTop = 73025
        mmWidth = 43392
        BandType = 4
      end
      object rpGRCSLabel38: TppLabel
        UserName = 'Label38'
        Caption = '17'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 191294
        mmTop = 73290
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel39: TppLabel
        UserName = 'Label39'
        Caption = 'CÓDIGO DO ESTABELECIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 195792
        mmTop = 73025
        mmWidth = 29633
        BandType = 4
      end
      object rpGRCSLabel40: TppLabel
        UserName = 'Label40'
        Caption = '18'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 10054
        mmTop = 81227
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel41: TppLabel
        UserName = 'Label41'
        Caption = 'ENDEREÇO (rua, avenida, praça, etc.)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 13758
        mmTop = 80963
        mmWidth = 32544
        BandType = 4
      end
      object rpGRCSLabel42: TppLabel
        UserName = 'Label42'
        Caption = '19'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 111125
        mmTop = 81492
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'NÚMERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 115623
        mmTop = 80963
        mmWidth = 7938
        BandType = 4
      end
      object rpGRCSLabel44: TppLabel
        UserName = 'Label44'
        Caption = '20'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 135996
        mmTop = 81492
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel45: TppLabel
        UserName = 'Label45'
        Caption = 'COMPLEMENTO (andar, sala, etc.)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 140494
        mmTop = 80963
        mmWidth = 29633
        BandType = 4
      end
      object rpGRCSLabel46: TppLabel
        UserName = 'Label46'
        Caption = '21'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 191294
        mmTop = 81227
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel47: TppLabel
        UserName = 'Label47'
        Caption = 'DATA INÍCIO ATIVIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 195792
        mmTop = 80963
        mmWidth = 22225
        BandType = 4
      end
      object rpGRCSLabel48: TppLabel
        UserName = 'Label48'
        Caption = '22'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 10054
        mmTop = 88900
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel49: TppLabel
        UserName = 'Label49'
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 13758
        mmTop = 88636
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel50: TppLabel
        UserName = 'Label50'
        Caption = '23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 46302
        mmTop = 88900
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel51: TppLabel
        UserName = 'Label51'
        Caption = 'MUNICÍPIO (CIDADE)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 50800
        mmTop = 88636
        mmWidth = 18256
        BandType = 4
      end
      object rpGRCSLabel52: TppLabel
        UserName = 'Label52'
        Caption = '24'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 135996
        mmTop = 88900
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel53: TppLabel
        UserName = 'Label53'
        Caption = 'BAIRRO ou DISTRITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 140494
        mmTop = 88636
        mmWidth = 19315
        BandType = 4
      end
      object rpGRCSLabel54: TppLabel
        UserName = 'Label54'
        Caption = '25'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 224632
        mmTop = 88900
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel55: TppLabel
        UserName = 'Label55'
        Caption = 'SIGLA UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 228600
        mmTop = 88636
        mmWidth = 8467
        BandType = 4
      end
      object rpGRCSShape39: TppShape
        UserName = 'Shape39'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 95779
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel56: TppLabel
        UserName = 'Label56'
        Caption = '26'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 10054
        mmTop = 96309
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'ATIVIDADE DO CONTRIBUINTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 13758
        mmTop = 96044
        mmWidth = 28310
        BandType = 4
      end
      object rpGRCSShape40: TppShape
        UserName = 'Shape40'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 81227
        mmTop = 95779
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel58: TppLabel
        UserName = 'Label58'
        Caption = '27'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 82286
        mmTop = 96309
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel59: TppLabel
        UserName = 'Label59'
        Caption = 'CÓD. ATIVID.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 86254
        mmTop = 96044
        mmWidth = 11906
        BandType = 4
      end
      object rpGRCSLine15: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 80698
        mmTop = 95515
        mmWidth = 1323
        BandType = 4
      end
      object rpGRCSShape41: TppShape
        UserName = 'Shape41'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 101336
        mmTop = 95779
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel60: TppLabel
        UserName = 'Label60'
        Caption = '28'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 102394
        mmTop = 96309
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel61: TppLabel
        UserName = 'Label61'
        Caption = 'SUB-CÓDIGO ATIVID.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 106363
        mmTop = 96044
        mmWidth = 17727
        BandType = 4
      end
      object rpGRCSLine16: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 100806
        mmTop = 95515
        mmWidth = 1323
        BandType = 4
      end
      object rpGRCSShape42: TppShape
        UserName = 'Shape42'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 130704
        mmTop = 95779
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel62: TppLabel
        UserName = 'Label62'
        Caption = '29'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 131763
        mmTop = 96309
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel63: TppLabel
        UserName = 'Label63'
        Caption = 'CÓDIGO CBO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 136261
        mmTop = 96044
        mmWidth = 11377
        BandType = 4
      end
      object rpGRCSLine9: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 130175
        mmTop = 95515
        mmWidth = 1323
        BandType = 4
      end
      object rpGRCSShape43: TppShape
        UserName = 'Shape43'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 151342
        mmTop = 95779
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel64: TppLabel
        UserName = 'Label64'
        Caption = '30'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 152400
        mmTop = 96309
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel65: TppLabel
        UserName = 'Label65'
        Caption = 'TIPO DE ESTABELECIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 155840
        mmTop = 96044
        mmWidth = 24606
        BandType = 4
      end
      object rpGRCSLine17: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 150813
        mmTop = 95515
        mmWidth = 1323
        BandType = 4
      end
      object rpGRCSShape44: TppShape
        UserName = 'Shape44'
        mmHeight = 3175
        mmLeft = 155840
        mmTop = 98690
        mmWidth = 3440
        BandType = 4
      end
      object rpGRCSShape45: TppShape
        UserName = 'Shape45'
        mmHeight = 3175
        mmLeft = 159015
        mmTop = 98690
        mmWidth = 3440
        BandType = 4
      end
      object rpGRCSLabel66: TppLabel
        UserName = 'Label66'
        Caption = '01  ÚNICO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 159809
        mmTop = 99484
        mmWidth = 8467
        BandType = 4
      end
      object rpGRCSShape46: TppShape
        UserName = 'Shape46'
        mmHeight = 3175
        mmLeft = 170921
        mmTop = 98690
        mmWidth = 3440
        BandType = 4
      end
      object rpGRCSShape47: TppShape
        UserName = 'Shape47'
        mmHeight = 3175
        mmLeft = 174096
        mmTop = 98690
        mmWidth = 3440
        BandType = 4
      end
      object rpGRCSLabel67: TppLabel
        UserName = 'Label67'
        Caption = '02  PRINCIPAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 174890
        mmTop = 99484
        mmWidth = 12171
        BandType = 4
      end
      object rpGRCSShape48: TppShape
        UserName = 'Shape48'
        mmHeight = 3175
        mmLeft = 189971
        mmTop = 98690
        mmWidth = 3440
        BandType = 4
      end
      object rpGRCSShape49: TppShape
        UserName = 'Shape49'
        mmHeight = 3175
        mmLeft = 193146
        mmTop = 98690
        mmWidth = 3440
        BandType = 4
      end
      object rpGRCSLabel68: TppLabel
        UserName = 'Label68'
        Caption = '03  FILIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 193940
        mmTop = 99484
        mmWidth = 7938
        BandType = 4
      end
      object rpGRCSShape50: TppShape
        UserName = 'Shape50'
        mmHeight = 3175
        mmLeft = 204523
        mmTop = 98690
        mmWidth = 3440
        BandType = 4
      end
      object rpGRCSShape51: TppShape
        UserName = 'Shape51'
        mmHeight = 3175
        mmLeft = 207698
        mmTop = 98690
        mmWidth = 3440
        BandType = 4
      end
      object rpGRCSLabel69: TppLabel
        UserName = 'Label69'
        Caption = '04  OUTROS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 208492
        mmTop = 99484
        mmWidth = 10319
        BandType = 4
      end
      object rpGRCSShape52: TppShape
        UserName = 'Shape52'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 221457
        mmTop = 95779
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLine18: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 220663
        mmTop = 95515
        mmWidth = 1323
        BandType = 4
      end
      object rpGRCSLabel70: TppLabel
        UserName = 'Label70'
        Caption = '31'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 222250
        mmTop = 96309
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel71: TppLabel
        UserName = 'Label71'
        AutoSize = False
        Caption = 'Nº ESTABELECIMENTOS DA EMPRESA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 225690
        mmTop = 96044
        mmWidth = 16140
        BandType = 4
      end
      object rpGRCSLabel72: TppLabel
        UserName = 'Label72'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        mmHeight = 6350
        mmLeft = 74083
        mmTop = 139436
        mmWidth = 4233
        BandType = 4
      end
      object rpGRCSLine19: TppLine
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 13758
        mmLeft = 74083
        mmTop = 139436
        mmWidth = 2381
        BandType = 4
      end
      object rpGRCSLabel73: TppLabel
        UserName = 'Label73'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        mmHeight = 7144
        mmLeft = 72496
        mmTop = 103717
        mmWidth = 7408
        BandType = 4
      end
      object rpGRCSLine20: TppLine
        UserName = 'Line20'
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 74348
        mmTop = 110861
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLine21: TppLine
        UserName = 'Line21'
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 8467
        mmTop = 138377
        mmWidth = 237067
        BandType = 4
      end
      object rpGRCSLine22: TppLine
        UserName = 'Line22'
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 8467
        mmTop = 145786
        mmWidth = 97631
        BandType = 4
      end
      object rpGRCSLine23: TppLine
        UserName = 'Line23'
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 15346
        mmTop = 130175
        mmWidth = 229923
        BandType = 4
      end
      object rpGRCSLine24: TppLine
        UserName = 'Line24'
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 8467
        mmTop = 122238
        mmWidth = 237067
        BandType = 4
      end
      object rpGRCSLine25: TppLine
        UserName = 'Line25'
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 146579
        mmTop = 110861
        mmWidth = 4233
        BandType = 4
      end
      object rpGRCSLine26: TppLine
        UserName = 'Line26'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 34925
        mmLeft = 146579
        mmTop = 110861
        mmWidth = 2646
        BandType = 4
      end
      object rpGRCSLine27: TppLine
        UserName = 'Line27'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 38365
        mmLeft = 36513
        mmTop = 114829
        mmWidth = 2646
        BandType = 4
      end
      object rpGRCSLine28: TppLine
        UserName = 'Line28'
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 8996
        mmTop = 107156
        mmWidth = 236009
        BandType = 4
      end
      object rpGRCSLine29: TppLine
        UserName = 'Line29'
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 8467
        mmTop = 114565
        mmWidth = 237067
        BandType = 4
      end
      object rpGRCSLabel74: TppLabel
        UserName = 'Label74'
        AutoSize = False
        Caption = 'DADOS DE REFERÊNCIA DA CONTRIBUIÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 8467
        mmTop = 103981
        mmWidth = 128059
        BandType = 4
      end
      object rpGRCSShape54: TppShape
        UserName = 'Shape53'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 108215
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel75: TppLabel
        UserName = 'Label75'
        Caption = '32'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 10054
        mmTop = 108744
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSShape55: TppShape
        UserName = 'Shape54'
        mmHeight = 3704
        mmLeft = 13758
        mmTop = 109538
        mmWidth = 3704
        BandType = 4
      end
      object rpGRCSShape56: TppShape
        UserName = 'Shape55'
        mmHeight = 3704
        mmLeft = 17198
        mmTop = 109538
        mmWidth = 3704
        BandType = 4
      end
      object rpGRCSLabel76: TppLabel
        UserName = 'Label76'
        Caption = '01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 17992
        mmTop = 110067
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel77: TppLabel
        UserName = 'Label77'
        AutoSize = False
        Caption = 'ESTABELECIMENTO EMPREGADOR           ,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5556
        mmLeft = 21696
        mmTop = 108744
        mmWidth = 22225
        BandType = 4
      end
      object rpGRCSShape57: TppShape
        UserName = 'Shape56'
        mmHeight = 3704
        mmLeft = 47096
        mmTop = 109273
        mmWidth = 3704
        BandType = 4
      end
      object rpGRCSShape58: TppShape
        UserName = 'Shape57'
        mmHeight = 3704
        mmLeft = 50536
        mmTop = 109273
        mmWidth = 3704
        BandType = 4
      end
      object rpGRCSLabel78: TppLabel
        UserName = 'Label78'
        Caption = '02'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 51329
        mmTop = 109802
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel79: TppLabel
        UserName = 'Label79'
        AutoSize = False
        Caption = 'AUTÔNOMO / LIBERAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5556
        mmLeft = 55033
        mmTop = 108479
        mmWidth = 14552
        BandType = 4
      end
      object rpGRCSLabel80: TppLabel
        UserName = 'Label80'
        Caption = 'DV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 74877
        mmTop = 111390
        mmWidth = 2910
        BandType = 4
      end
      object rpGRCSShape59: TppShape
        UserName = 'Shape58'
        mmHeight = 3704
        mmLeft = 83079
        mmTop = 109273
        mmWidth = 3704
        BandType = 4
      end
      object rpGRCSShape60: TppShape
        UserName = 'Shape59'
        mmHeight = 3704
        mmLeft = 86519
        mmTop = 109273
        mmWidth = 3704
        BandType = 4
      end
      object rpGRCSLabel81: TppLabel
        UserName = 'Label81'
        Caption = 'OU         03'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 79904
        mmTop = 110331
        mmWidth = 9525
        BandType = 4
      end
      object rpGRCSLabel82: TppLabel
        UserName = 'Label82'
        AutoSize = False
        Caption = 'EMPREGADOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 91017
        mmTop = 111125
        mmWidth = 15610
        BandType = 4
      end
      object rpGRCSLabel83: TppLabel
        UserName = 'Label83'
        Caption = 'DV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 147373
        mmTop = 111390
        mmWidth = 2910
        BandType = 4
      end
      object rpGRCSShape61: TppShape
        UserName = 'Shape60'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 115094
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel84: TppLabel
        UserName = 'Label84'
        Caption = '33'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 10054
        mmTop = 115623
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel85: TppLabel
        UserName = 'Label85'
        AutoSize = False
        Caption = 'CAPITAL SOCIAL DA EMPRESA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 13758
        mmTop = 115623
        mmWidth = 18521
        BandType = 4
      end
      object rpGRCSLabel86: TppLabel
        UserName = 'Label86'
        Caption = '9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 75671
        mmTop = 117211
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel87: TppLabel
        UserName = 'Label87'
        Caption = '6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 75671
        mmTop = 124884
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel88: TppLabel
        UserName = 'Label88'
        Caption = '8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 75671
        mmTop = 133086
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel89: TppLabel
        UserName = 'Label89'
        Caption = '7'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 75671
        mmTop = 140759
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel90: TppLabel
        UserName = 'Label90'
        Caption = '3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 75671
        mmTop = 147638
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel91: TppLabel
        UserName = 'Label91'
        Caption = '2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 148167
        mmTop = 140759
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel92: TppLabel
        UserName = 'Label92'
        Caption = '3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 148167
        mmTop = 133086
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel93: TppLabel
        UserName = 'Label93'
        Caption = '5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 148167
        mmTop = 124884
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel94: TppLabel
        UserName = 'Label94'
        Caption = '8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 148167
        mmTop = 117211
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLine30: TppLine
        UserName = 'Line30'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 31221
        mmLeft = 103717
        mmTop = 114829
        mmWidth = 2646
        BandType = 4
      end
      object rpGRCSShape62: TppShape
        UserName = 'Shape61'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 78581
        mmTop = 115094
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel95: TppLabel
        UserName = 'Label95'
        Caption = '38'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 79640
        mmTop = 115623
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSShape63: TppShape
        UserName = 'Shape62'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 78581
        mmTop = 122767
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel97: TppLabel
        UserName = 'Label96'
        Caption = '39'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 79640
        mmTop = 123296
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel98: TppLabel
        UserName = 'Label97'
        AutoSize = False
        Caption = 'TOTAL DA REMUNERAÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5556
        mmLeft = 83344
        mmTop = 123296
        mmWidth = 17992
        BandType = 4
      end
      object rpGRCSShape64: TppShape
        UserName = 'Shape63'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 78581
        mmTop = 130704
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel99: TppLabel
        UserName = 'Label98'
        Caption = '40'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 79640
        mmTop = 131234
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel100: TppLabel
        UserName = 'Label99'
        AutoSize = False
        Caption = 'TOTAL DE EMPREGADOS DO ESTABELECIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 83344
        mmTop = 130704
        mmWidth = 20373
        BandType = 4
      end
      object rpGRCSShape65: TppShape
        UserName = 'Shape64'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 78581
        mmTop = 138907
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel101: TppLabel
        UserName = 'Label100'
        Caption = '41'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 79640
        mmTop = 139436
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel102: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Nº DE NÃO CONTRIBUINTES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5556
        mmLeft = 83344
        mmTop = 139436
        mmWidth = 17992
        BandType = 4
      end
      object rpGRCSLabel103: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'DADOS DA CONTRIBUIÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 150813
        mmTop = 103981
        mmWidth = 94721
        BandType = 4
      end
      object rpGRCSLabel104: TppLabel
        UserName = 'Label103'
        Caption = '3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 242094
        mmTop = 133615
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLine31: TppLine
        UserName = 'Line31'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 42598
        mmLeft = 239713
        mmTop = 103452
        mmWidth = 2646
        BandType = 4
      end
      object rpGRCSLabel105: TppLabel
        UserName = 'Label104'
        Caption = '9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 242094
        mmTop = 125413
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel106: TppLabel
        UserName = 'Label105'
        Caption = '6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 242094
        mmTop = 117740
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel107: TppLabel
        UserName = 'Label106'
        Caption = '8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 242094
        mmTop = 110596
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLabel108: TppLabel
        UserName = 'Label107'
        Caption = 'DV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 240507
        mmTop = 104511
        mmWidth = 2910
        BandType = 4
      end
      object rpGRCSLabel109: TppLabel
        UserName = 'Label108'
        Caption = '5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 242094
        mmTop = 140759
        mmWidth = 1058
        BandType = 4
      end
      object rpGRCSLine32: TppLine
        UserName = 'Line32'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 38365
        mmLeft = 176742
        mmTop = 107156
        mmWidth = 2646
        BandType = 4
      end
      object rpGRCSShape66: TppShape
        UserName = 'Shape65'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 151342
        mmTop = 107686
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel110: TppLabel
        UserName = 'Label109'
        Caption = '42'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 152400
        mmTop = 108215
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel111: TppLabel
        UserName = 'Label110'
        AutoSize = False
        Caption = 'VALOR DA CONTRIBUIÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5556
        mmLeft = 155840
        mmTop = 108479
        mmWidth = 17198
        BandType = 4
      end
      object rpGRCSShape67: TppShape
        UserName = 'Shape66'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 151342
        mmTop = 115094
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel112: TppLabel
        UserName = 'Label111'
        Caption = '43'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 152400
        mmTop = 115623
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel113: TppLabel
        UserName = 'Label112'
        AutoSize = False
        Caption = 'MULTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 155840
        mmTop = 117740
        mmWidth = 11377
        BandType = 4
      end
      object rpGRCSShape68: TppShape
        UserName = 'Shape67'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 151342
        mmTop = 122767
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel114: TppLabel
        UserName = 'Label113'
        Caption = '44'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 152400
        mmTop = 123031
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSShape69: TppShape
        UserName = 'Shape68'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 151342
        mmTop = 130704
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel116: TppLabel
        UserName = 'Label114'
        Caption = '45'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 152400
        mmTop = 130969
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel117: TppLabel
        UserName = 'Label115'
        AutoSize = False
        Caption = 'CORREÇÃO MONETÁRIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3175
        mmLeft = 155840
        mmTop = 133350
        mmWidth = 26194
        BandType = 4
      end
      object rpGRCSShape70: TppShape
        UserName = 'Shape69'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 151342
        mmTop = 138907
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel118: TppLabel
        UserName = 'Label116'
        Caption = '46'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 152400
        mmTop = 139171
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel119: TppLabel
        UserName = 'Label117'
        AutoSize = False
        Caption = 'TOTAL A RECOLHER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3175
        mmLeft = 155840
        mmTop = 141552
        mmWidth = 21431
        BandType = 4
      end
      object rpGRCSLabel120: TppLabel
        UserName = 'Label118'
        AutoSize = False
        Caption = 
          'OBSERVAÇÃO: SE AUTÔNOMO / LIBERAL PREENCHER, NO QUE SE REFERE A ' +
          '"DADOS DE REFERÊNCIA DA CONTRIBUIÇÃO", APENAS O CAMPO 37, QUE NE' +
          'STE CASO, EQUIVALE AO MAIOR VALOR DE REFERÊNCIA VIGENTE.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 6350
        mmLeft = 8467
        mmTop = 163248
        mmWidth = 110067
        BandType = 4
      end
      object rpGRCSShape71: TppShape
        UserName = 'Shape70'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 15610
        mmTop = 122767
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel121: TppLabel
        UserName = 'Label119'
        Caption = '34'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 16669
        mmTop = 123296
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel122: TppLabel
        UserName = 'Label120'
        AutoSize = False
        Caption = 'TOTAL DA EMPRESA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 6085
        mmLeft = 20373
        mmTop = 123296
        mmWidth = 12171
        BandType = 4
      end
      object rpGRCSShape72: TppShape
        UserName = 'Shape71'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 15610
        mmTop = 130704
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel123: TppLabel
        UserName = 'Label121'
        Caption = '35'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 16669
        mmTop = 131234
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel125: TppLabel
        UserName = 'Label122'
        AutoSize = False
        Caption = 'ESTABELECIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 15346
        mmTop = 135202
        mmWidth = 20638
        BandType = 4
      end
      object rpGRCSShape73: TppShape
        UserName = 'Shape72'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 138907
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel124: TppLabel
        UserName = 'Label123'
        Caption = '36'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 10054
        mmTop = 139436
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSShape74: TppShape
        UserName = 'Shape73'
        Brush.Style = bsClear
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 146050
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel127: TppLabel
        UserName = 'Label124'
        Caption = '37'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 10054
        mmTop = 146579
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel128: TppLabel
        UserName = 'Label125'
        AutoSize = False
        Caption = 'VALOR BASE DE CÁLCULO DA CONTRIBUIÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 13758
        mmTop = 146315
        mmWidth = 21960
        BandType = 4
      end
      object rpGRCSDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOME_SINDI'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 13758
        mmTop = 49213
        mmWidth = 174361
        BandType = 4
      end
      object rpGRCSDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ENDERECO_SINDI'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 13758
        mmTop = 56886
        mmWidth = 93663
        BandType = 4
      end
      object rpGRCSDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NUMERO_SINDI'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 1852
        mmLeft = 114829
        mmTop = 56886
        mmWidth = 16933
        BandType = 4
      end
      object rpGRCSDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'COMPLEMENTO_SINDI'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 139700
        mmTop = 56886
        mmWidth = 47625
        BandType = 4
      end
      object rpGRCSDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'BAIRRO_SINDI'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 13758
        mmTop = 65088
        mmWidth = 82550
        BandType = 4
      end
      object rpGRCSDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CEP_SINDI'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 103452
        mmTop = 65088
        mmWidth = 28310
        BandType = 4
      end
      object rpGRCSDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CIDADE_SINDI'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 139436
        mmTop = 65088
        mmWidth = 82286
        BandType = 4
      end
      object rpGRCSDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CNPJ_ESTAB'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 194998
        mmTop = 29633
        mmWidth = 46302
        BandType = 4
      end
      object rpGRCSDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'DATA_LIM_PAG'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 194998
        mmTop = 38100
        mmWidth = 27517
        BandType = 4
      end
      object rpGRCSDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'EXERCICIO'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 232569
        mmTop = 38100
        mmWidth = 11113
        BandType = 4
      end
      object rpGRCSDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'COD_SINDI'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 194998
        mmTop = 49213
        mmWidth = 47361
        BandType = 4
      end
      object rpGRCSDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'CNPJ_SINDI'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 194998
        mmTop = 56886
        mmWidth = 47361
        BandType = 4
      end
      object rpGRCSDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'UF_SINDI'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 229394
        mmTop = 65088
        mmWidth = 13494
        BandType = 4
      end
      object rpGRCSDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'UF_ESTAB'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 228600
        mmTop = 91811
        mmWidth = 13494
        BandType = 4
      end
      object rpGRCSDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'DATA_INI_ATIVID'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 195792
        mmTop = 84402
        mmWidth = 47361
        BandType = 4
      end
      object rpGRCSDBText17: TppDBText
        UserName = 'DBText16'
        DataField = 'CIDADE_ESTAB'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 50800
        mmTop = 91811
        mmWidth = 81756
        BandType = 4
      end
      object rpGRCSDBText18: TppDBText
        UserName = 'DBText17'
        DataField = 'NOME_ESTAB'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 13758
        mmTop = 76465
        mmWidth = 174096
        BandType = 4
      end
      object rpGRCSDBText19: TppDBText
        UserName = 'DBText18'
        DataField = 'ENDERECO_ESTAB'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 13758
        mmTop = 84402
        mmWidth = 93663
        BandType = 4
      end
      object rpGRCSDBText20: TppDBText
        UserName = 'DBText19'
        DataField = 'NUMERO_ESTAB'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 115623
        mmTop = 84402
        mmWidth = 17198
        BandType = 4
      end
      object rpGRCSDBText21: TppDBText
        UserName = 'DBText20'
        DataField = 'CEP_ESTAB'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 13758
        mmTop = 91811
        mmWidth = 29104
        BandType = 4
      end
      object rpGRCSDBText22: TppDBText
        UserName = 'DBText21'
        DataField = 'CNAE_NOME'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 13758
        mmTop = 99748
        mmWidth = 65617
        BandType = 4
      end
      object rpGRCSDBText23: TppDBText
        UserName = 'DBText22'
        DataField = 'CNAE_COD'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 86254
        mmTop = 99748
        mmWidth = 11906
        BandType = 4
      end
      object rpGRCSDBText26: TppDBText
        UserName = 'DBText24'
        DataField = 'COMPLEMENTO_ESTAB'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 140494
        mmTop = 84402
        mmWidth = 47361
        BandType = 4
      end
      object rpGRCSShape75: TppShape
        UserName = 'Shape74'
        Brush.Style = bsClear
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 120650
        mmTop = 146579
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel130: TppLabel
        UserName = 'Label126'
        Caption = '49'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 121709
        mmTop = 147109
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel131: TppLabel
        UserName = 'Label127'
        AutoSize = False
        Caption = 'AUTENTICAÇÃO MECÂNICA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3175
        mmLeft = 125148
        mmTop = 146579
        mmWidth = 31485
        BandType = 4
      end
      object rpGRCSShape76: TppShape
        UserName = 'Shape75'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 9260
        mmTop = 156104
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel132: TppLabel
        UserName = 'Label128'
        Caption = '47'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 10319
        mmTop = 156634
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel133: TppLabel
        UserName = 'Label129'
        AutoSize = False
        Caption = 'LOCAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2646
        mmLeft = 14023
        mmTop = 159015
        mmWidth = 7673
        BandType = 4
      end
      object rpGRCSLine33: TppLine
        UserName = 'Line33'
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 14023
        mmTop = 158221
        mmWidth = 50536
        BandType = 4
      end
      object rpGRCSShape77: TppShape
        UserName = 'Shape76'
        Shape = stCircle
        mmHeight = 3969
        mmLeft = 66940
        mmTop = 156104
        mmWidth = 3969
        BandType = 4
      end
      object rpGRCSLabel134: TppLabel
        UserName = 'Label130'
        Caption = '48'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 67998
        mmTop = 156634
        mmWidth = 2117
        BandType = 4
      end
      object rpGRCSLabel135: TppLabel
        UserName = 'Label131'
        AutoSize = False
        Caption = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2646
        mmLeft = 71702
        mmTop = 159015
        mmWidth = 6615
        BandType = 4
      end
      object rpGRCSLine34: TppLine
        UserName = 'Line34'
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 71702
        mmTop = 158221
        mmWidth = 47096
        BandType = 4
      end
      object rpGRCSDBText27: TppDBText
        UserName = 'DBText25'
        DataField = 'CIDADE_ESTAB'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 15081
        mmTop = 155046
        mmWidth = 48419
        BandType = 4
      end
      object rpGRCSDBText28: TppDBText
        UserName = 'DBText26'
        DataField = 'DATA'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 72496
        mmTop = 155046
        mmWidth = 44979
        BandType = 4
      end
      object rpGRCSDBText29: TppDBText
        UserName = 'DBText27'
        DataField = 'BAIRRO_ESTAB'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 140494
        mmTop = 91811
        mmWidth = 80698
        BandType = 4
      end
      object rpGRCSLabel129: TppLabel
        UserName = 'Label132'
        AutoSize = False
        Caption = 'DESTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 20373
        mmTop = 131763
        mmWidth = 8467
        BandType = 4
      end
      object rpGRCSMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 'Nº DE EMPREGADOS'#13#10'QUE CONTRIBUEM'#13#10'PARA ESTA'#13#10'ENTIDADE SINDICAL'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 4
        Font.Style = []
        Lines.Strings = (
          'Nº DE EMPREGADOS'
          'QUE CONTRIBUEM'
          'PARA ESTA'
          'ENTIDADE SINDICAL')
        Transparent = True
        mmHeight = 7144
        mmLeft = 83079
        mmTop = 115094
        mmWidth = 20638
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpGRCSMemo2: TppMemo
        UserName = 'Memo2'
        Caption = 'CAPITAL ATRIBUÍDO'#13#10'A ESTE'#13#10'ESTABELECIMENTO'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Lines.Strings = (
          'CAPITAL ATRIBUÍDO'
          'A ESTE'
          'ESTABELECIMENTO')
        Transparent = True
        mmHeight = 6879
        mmLeft = 13758
        mmTop = 138907
        mmWidth = 20638
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpGRCSDBText30: TppDBText
        UserName = 'DBText28'
        DataField = 'NUM_TOT_EMPREGADOS'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 106363
        mmTop = 133086
        mmWidth = 37835
        BandType = 4
      end
      object rpGRCSDBText31: TppDBText
        UserName = 'DBText29'
        DataField = 'NUM_ESTAB'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 225690
        mmTop = 99748
        mmWidth = 16140
        BandType = 4
      end
      object rpGRCSLabel115: TppLabel
        UserName = 'Label133'
        AutoSize = False
        Caption = 'JUROS DE MORA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 155840
        mmTop = 125413
        mmWidth = 19579
        BandType = 4
      end
      object rpGRCSImage3: TppImage
        UserName = 'Image4'
        MaintainAspectRatio = False
        Picture.Data = {
          07544269746D617092020000424D920200000000000076000000280000001100
          00002D00000001000400000000001C0200000000000000000000100000001000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00FFFFFFFFFFFFFFFFF0000000FFFFFFFFFFFFFFFFF0000000FFFFFFFFFF00
          000FF0000000FF000FFFFF0F0F0FF0000000F0FFF0FFFF0F0F0FF0000000F0FF
          F0FFFF0F0F0FF0000000FF000FFFFFF000FFF0000000FFFFFFFFFF0FFF0FF000
          0000FFFFFFFFFF0FFF0FF0000000FF00000FFFF0F0FFF0000000FF0F0FFFFFFF
          FFFFF0000000FF000FFFFFF000FFF0000000FFFFFFFFFF0FFF0FF0000000FFFF
          FFFFFF0FFF0FF0000000FF00000FFFF000FFF0000000FF0F0F0FFFFFFFFFF000
          0000FF0F0F0FFFFFFFFFF0000000FF0F0F0FFF00000FF0000000FFFFFFFFFFF0
          00FFF0000000FF00000FFF00000FF0000000FF0F0FFFFFFFFFFFF0000000FF00
          00FFFFF000FFF0000000FFFFFF0FFF0FFF0FF0000000FFFFFF0FF00FFF0FF000
          0000FFF000FFF0F000FFF0000000FF0F0FFFF0FFFFFFF0000000FFF000FFF000
          000FF0000000FFFFFF0FFF0000FFF0000000FFF000FFFFFFFF0FF0000000FF0F
          FF0FFF0000FFF0000000FF0FFF0FFF00000FF0000000FFF0F0FFFFFFFFFFF000
          0000FFFFFFFFFF00000FF0000000FFFFFF0FFFF000FFF0000000FF0F00FFFF0F
          FF0FF0000000FF00FFFFFF0FFF0FF0000000FFFF00FFFFF0F0FFF0000000FFFF
          FF0FFFFFFFFFF0000000FFF000FFFFFFFF0FF0000000FF0FFF0FFFF000FFF000
          0000FF0FFF0FFF0F0FFFF0000000FFF000FFFFF000FFF0000000FFFFFFFFFFFF
          FF0FF0000000FFFFFFFFFFFFFFFFF0000000FFFFFFFFFFFFFFFFF0000000}
        mmHeight = 15610
        mmLeft = 8731
        mmTop = 122767
        mmWidth = 6350
        BandType = 4
      end
      object rpGRCSLine35: TppLine
        UserName = 'Line35'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 16404
        mmLeft = 15081
        mmTop = 122238
        mmWidth = 2646
        BandType = 4
      end
      object rpGRCSDBText32: TppDBText
        UserName = 'DBText30'
        DataField = 'NUM_TOT_EMPR_CONTR'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 106363
        mmTop = 116946
        mmWidth = 37835
        BandType = 4
      end
      object rpGRCSDBText33: TppDBText
        UserName = 'DBText31'
        DataField = 'NUM_TOT_EMPR_NAO_CONTR'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 106363
        mmTop = 141023
        mmWidth = 37835
        BandType = 4
      end
      object rpGRCSDBText16: TppDBText
        UserName = 'DBText32'
        DataField = 'TOT_REM'
        DataPipeline = ppGRCS
        DisplayFormat = '#,0.00;#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 106363
        mmTop = 124884
        mmWidth = 37835
        BandType = 4
      end
      object rpGRCSDBText24: TppDBText
        UserName = 'DBText33'
        DataField = 'VAL_CONTRIB'
        DataPipeline = ppGRCS
        DisplayFormat = '#,0.00;#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 179917
        mmTop = 109802
        mmWidth = 56886
        BandType = 4
      end
      object rpGRCSLabelTotal: TppLabel
        UserName = 'Label137'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 179917
        mmTop = 141023
        mmWidth = 56886
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText34'
        DataField = 'MULTA'
        DataPipeline = ppGRCS
        DisplayFormat = '#,0.00;#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 179917
        mmTop = 116946
        mmWidth = 56886
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText35'
        DataField = 'JUROS'
        DataPipeline = ppGRCS
        DisplayFormat = '#,0.00;#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 179917
        mmTop = 124884
        mmWidth = 56886
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText36'
        DataField = 'CORRECAO_MONET'
        DataPipeline = ppGRCS
        DisplayFormat = '#,0.00;#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 179917
        mmTop = 133086
        mmWidth = 56886
        BandType = 4
      end
      object rpGRCSDBText34: TppDBText
        UserName = 'DBText37'
        DataField = 'TIPO_UNICO'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 155840
        mmTop = 98954
        mmWidth = 3175
        BandType = 4
      end
      object rpGRCSDBText35: TppDBText
        UserName = 'DBText38'
        DataField = 'TIPO_PRICIPAL'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 170921
        mmTop = 98954
        mmWidth = 3175
        BandType = 4
      end
      object rpGRCSDBText36: TppDBText
        UserName = 'DBText39'
        DataField = 'TIPO_FILIAL'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 189971
        mmTop = 98954
        mmWidth = 3175
        BandType = 4
      end
      object rpGRCSDBText37: TppDBText
        UserName = 'DBText40'
        DataField = 'TIPO_OUTROS'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 204523
        mmTop = 98954
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText23'
        DataField = 'CALC_ESTAB_EMPREGADOR'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 14288
        mmTop = 110067
        mmWidth = 2646
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText41'
        DataField = 'CALC_AUTONOMO'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 47625
        mmTop = 109802
        mmWidth = 2646
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText42'
        DataField = 'CALC_EMPREGADO'
        DataPipeline = ppGRCS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 83608
        mmTop = 109802
        mmWidth = 2646
        BandType = 4
      end
    end
    object rpGRCSSmryBnd: TppSummaryBand
      AfterPrint = rpGRCSSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'CNPJ_ESTAB'
      DataPipeline = ppGRCS
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'CNPJ_SINDI'
      DataPipeline = ppGRCS
      NewPage = True
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
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppGRCS: TppBDEPipeline
    DataSource = dsGRCS
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'GRCS'
    Left = 198
    Top = 48
    object ppGRCSppField1: TppField
      FieldAlias = 'NOME_ESTAB'
      FieldName = 'NOME_ESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField2: TppField
      FieldAlias = 'CNPJ_ESTAB'
      FieldName = 'CNPJ_ESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField3: TppField
      FieldAlias = 'ENDERECO_ESTAB'
      FieldName = 'ENDERECO_ESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField4: TppField
      FieldAlias = 'NUMERO_ESTAB'
      FieldName = 'NUMERO_ESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField5: TppField
      FieldAlias = 'COMPLEMENTO_ESTAB'
      FieldName = 'COMPLEMENTO_ESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField6: TppField
      FieldAlias = 'BAIRRO_ESTAB'
      FieldName = 'BAIRRO_ESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField7: TppField
      FieldAlias = 'CIDADE_ESTAB'
      FieldName = 'CIDADE_ESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField8: TppField
      FieldAlias = 'CEP_ESTAB'
      FieldName = 'CEP_ESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField9: TppField
      FieldAlias = 'UF_ESTAB'
      FieldName = 'UF_ESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField10: TppField
      FieldAlias = 'NOME_SINDI'
      FieldName = 'NOME_SINDI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField11: TppField
      FieldAlias = 'CNPJ_SINDI'
      FieldName = 'CNPJ_SINDI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField12: TppField
      FieldAlias = 'ENDERECO_SINDI'
      FieldName = 'ENDERECO_SINDI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField13: TppField
      FieldAlias = 'NUMERO_SINDI'
      FieldName = 'NUMERO_SINDI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField14: TppField
      FieldAlias = 'COMPLEMENTO_SINDI'
      FieldName = 'COMPLEMENTO_SINDI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField15: TppField
      FieldAlias = 'BAIRRO_SINDI'
      FieldName = 'BAIRRO_SINDI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField16: TppField
      FieldAlias = 'CIDADE_SINDI'
      FieldName = 'CIDADE_SINDI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField17: TppField
      FieldAlias = 'CEP_SINDI'
      FieldName = 'CEP_SINDI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField18: TppField
      FieldAlias = 'UF_SINDI'
      FieldName = 'UF_SINDI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField19: TppField
      FieldAlias = 'COD_SINDI'
      FieldName = 'COD_SINDI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField20: TppField
      FieldAlias = 'CNAE_NOME'
      FieldName = 'CNAE_NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField21: TppField
      FieldAlias = 'CNAE_COD'
      FieldName = 'CNAE_COD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField22: TppField
      FieldAlias = 'DATA_LIM_PAG'
      FieldName = 'DATA_LIM_PAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField23: TppField
      FieldAlias = 'EXERCICIO'
      FieldName = 'EXERCICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField24: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField25: TppField
      FieldAlias = 'DATA_INI_ATIVID'
      FieldName = 'DATA_INI_ATIVID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField26: TppField
      FieldAlias = 'NUM_TOT_EMPREGADOS'
      FieldName = 'NUM_TOT_EMPREGADOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField27: TppField
      FieldAlias = 'NUM_TOT_EMPR_CONTR'
      FieldName = 'NUM_TOT_EMPR_CONTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField28: TppField
      FieldAlias = 'NUM_TOT_EMPR_NAO_CONTR'
      FieldName = 'NUM_TOT_EMPR_NAO_CONTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField29: TppField
      FieldAlias = 'NUM_ESTAB'
      FieldName = 'NUM_ESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField30: TppField
      FieldAlias = 'INDTIPOEMPRESA'
      FieldName = 'INDTIPOEMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField31: TppField
      FieldAlias = 'TOT_REM'
      FieldName = 'TOT_REM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField32: TppField
      FieldAlias = 'VAL_CONTRIB'
      FieldName = 'VAL_CONTRIB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField33: TppField
      FieldAlias = 'JUROS'
      FieldName = 'JUROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField34: TppField
      FieldAlias = 'MULTA'
      FieldName = 'MULTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField35: TppField
      FieldAlias = 'CORRECAO_MONET'
      FieldName = 'CORRECAO_MONET'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField36: TppField
      FieldAlias = 'TIPO_UNICO'
      FieldName = 'TIPO_UNICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField37: TppField
      FieldAlias = 'TIPO_PRICIPAL'
      FieldName = 'TIPO_PRICIPAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField38: TppField
      FieldAlias = 'TIPO_FILIAL'
      FieldName = 'TIPO_FILIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField39: TppField
      FieldAlias = 'TIPO_OUTROS'
      FieldName = 'TIPO_OUTROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField40: TppField
      FieldAlias = 'CALC_ESTAB_EMPREGADOR'
      FieldName = 'CALC_ESTAB_EMPREGADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField41: TppField
      FieldAlias = 'CALC_AUTONOMO'
      FieldName = 'CALC_AUTONOMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppGRCSppField42: TppField
      FieldAlias = 'CALC_EMPREGADO'
      FieldName = 'CALC_EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
  end
  object dsGRCS: TwwDataSource
    DataSet = CdsGRCS
    Left = 198
    Top = 96
  end
  object sqlGRCS: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'1'#39' AS NOME_ESTAB,'
      '  '#39'1'#39' AS CNPJ_ESTAB,'
      '  '#39'1'#39' AS ENDERECO_ESTAB,'
      '  0 AS NUMERO_ESTAB,'
      '  '#39'1'#39' AS COMPLEMENTO_ESTAB,'
      '  '#39'1'#39' AS BAIRRO_ESTAB,'
      '  '#39'1'#39' AS CIDADE_ESTAB,'
      '  '#39'1'#39' AS CEP_ESTAB,'
      '  '#39'1'#39' AS UF_ESTAB,'
      '  '#39'1'#39' AS NOME_SINDI,'
      '  '#39'1'#39' AS CNPJ_SINDI,'
      '  '#39'1'#39' AS ENDERECO_SINDI,'
      '  0 AS NUMERO_SINDI,'
      '  '#39'1'#39' AS COMPLEMENTO_SINDI,'
      '  '#39'1'#39' AS BAIRRO_SINDI,'
      '  '#39'1'#39' AS CIDADE_SINDI,'
      '  '#39'1'#39' AS CEP_SINDI,'
      '  '#39'1'#39' AS UF_SINDI,'
      '  0 AS COD_SINDI,'
      '  '#39'1'#39' AS CNAE_NOME,'
      '  0 AS CNAE_COD,'
      '  '#39'1'#39' AS DATA_LIM_PAG,'
      '  '#39'1'#39' AS EXERCICIO,'
      '  '#39'1'#39' AS DATA,'
      '  '#39'1'#39' AS DATA_INI_ATIVID,'
      '  0 AS NUM_TOT_EMPREGADOS,'
      '  0 AS NUM_TOT_EMPR_CONTR,'
      '  0 AS NUM_TOT_EMPR_NAO_CONTR,'
      '  0 AS NUM_ESTAB,'
      '  0 AS INDTIPOEMPRESA,'
      '  0 AS TOT_REM,'
      '  0 AS VAL_CONTRIB,'
      '  0 AS JUROS,'
      '  0 AS MULTA,'
      '  0 AS CORRECAO_MONET,'
      '  '#39'X'#39' AS TIPO_UNICO,'
      '  '#39'X'#39' AS TIPO_PRICIPAL,'
      '  '#39'X'#39' AS TIPO_FILIAL,'
      '  '#39'X'#39' AS TIPO_OUTROS,'
      '  '#39'X'#39' AS CALC_ESTAB_EMPREGADOR,'
      '  '#39'X'#39' AS CALC_AUTONOMO,'
      '  '#39'X'#39' AS CALC_EMPREGADO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsGRCS
    Left = 198
    Top = 190
  end
  object CdsGRCS: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsGRCSAfterScroll
    Left = 198
    Top = 144
  end
end
