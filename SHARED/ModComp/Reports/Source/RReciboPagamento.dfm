inherited RptReciboPagamento: TRptReciboPagamento
  Left = 230
  Top = 195
  Width = 309
  Height = 269
  Caption = 'RptReciboPagamento'
  OldCreateOrder = True
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
        Caption = 'DoisRecPorFolha'
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
        Name = 'DoisRecPorFolha'
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
      end
      item
        Caption = 'ImprimirDuplicado'
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
        Name = 'ImprimirDuplicado'
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
        Caption = 'ListaIdMotivo'
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
        Name = 'ListaIdMotivo'
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
        Caption = 'NumDepIRRF'
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
        Name = 'NumDepIRRF'
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
    Report = rpReciboPagamento
    ConnectionType = cntBDE
  end
  object rpReciboPagamento: TppReport
    AutoStop = False
    DataPipeline = ppReciboPagamento
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Recibo de Pagamento'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4500
    PrinterSetup.mmMarginLeft = 4500
    PrinterSetup.mmMarginRight = 4500
    PrinterSetup.mmMarginTop = 4500
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 224
    Version = '5.5'
    mmColumnWidth = 206000
    object ppDetailBand10: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpReciboPagamentoSmryBnd: TppSummaryBand
      AfterPrint = rpReciboPagamentoSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object ppGroup10: TppGroup
      BreakName = 'PAGINA'
      DataPipeline = ppReciboPagamento
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand10: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand10BeforePrint
        mmBottomOffset = 0
        mmHeight = 134144
        mmPrintPosition = 0
        object shpReciboPagamento12: TppShape
          UserName = 'Shape1'
          mmHeight = 8467
          mmLeft = 794
          mmTop = 117211
          mmWidth = 174361
          BandType = 3
          GroupNo = 0
        end
        object shpReciboPagamento3: TppShape
          UserName = 'Shape2'
          mmHeight = 124619
          mmLeft = 179388
          mmTop = 794
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object lnReciboPagamento7: TppLine
          UserName = 'Line1'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 29369
          mmLeft = 192088
          mmTop = 92075
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
        end
        object lnReciboPagamento5: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 2381
          mmLeft = 186796
          mmTop = 103188
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object lnReciboPagamento6: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 2381
          mmLeft = 186532
          mmTop = 111919
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object lnReciboPagamento4: TppLine
          UserName = 'Line4'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 85725
          mmLeft = 192088
          mmTop = 5027
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
        end
        object shpReciboPagamento1: TppShape
          UserName = 'Shape3'
          mmHeight = 15610
          mmLeft = 794
          mmTop = 794
          mmWidth = 174361
          BandType = 3
          GroupNo = 0
        end
        object shpReciboPagamento2: TppShape
          UserName = 'Shape4'
          mmHeight = 8996
          mmLeft = 794
          mmTop = 16140
          mmWidth = 174361
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoNOME: TppLabel
          UserName = 'Label1'
          Caption = 'Nome:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 26988
          mmTop = 16669
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoCARGO: TppLabel
          UserName = 'Label2'
          Caption = 'Cargo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 1588
          mmTop = 20902
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoC_CUSTO: TppLabel
          UserName = 'Label3'
          Caption = 'Centro de Custo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 75936
          mmTop = 20902
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoEMPRESA: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'EMPRESA'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 92075
          mmTop = 1588
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCGC: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'CGC'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 70908
          mmTop = 6350
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoINSCRICAO: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'INSCRICAO'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 115094
          mmTop = 6350
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoMATRICULA: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'MATRICULA'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 8467
          mmTop = 16669
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoEMPREGADO: TppDBText
          UserName = 'DBText5'
          AutoSize = True
          DataField = 'EMPREGADO'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 35983
          mmTop = 16669
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCARGO: TppDBText
          UserName = 'DBText6'
          AutoSize = True
          DataField = 'CARGO'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 11113
          mmTop = 20902
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoENDERECO: TppDBText
          UserName = 'DBText7'
          AutoSize = True
          DataField = 'ENDERECO'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 91017
          mmTop = 11113
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoC_CUSTO: TppDBText
          UserName = 'DBText8'
          AutoSize = True
          DataField = 'C_CUSTO'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 98425
          mmTop = 20902
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoMES_REF: TppLabel
          UserName = 'Label4'
          Caption = 'Mês Ref:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 130969
          mmTop = 16669
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoCOD: TppLabel
          UserName = 'Label5'
          Caption = 'Cód:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1588
          mmTop = 16669
          mmWidth = 5821
          BandType = 3
          GroupNo = 0
        end
        object shpReciboPagamento4: TppShape
          UserName = 'Shape5'
          mmHeight = 5027
          mmLeft = 794
          mmTop = 30692
          mmWidth = 174361
          BandType = 3
          GroupNo = 0
        end
        object shpReciboPagamento6: TppShape
          UserName = 'Shape6'
          mmHeight = 69850
          mmLeft = 104511
          mmTop = 35454
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object shpReciboPagamento5: TppShape
          UserName = 'Shape7'
          mmHeight = 69850
          mmLeft = 794
          mmTop = 35454
          mmWidth = 88900
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoCODIGO: TppLabel
          UserName = 'Label6'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 7938
          mmTop = 31750
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoDESCRICAO: TppLabel
          UserName = 'Label7'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 47361
          mmTop = 31750
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoREF: TppLabel
          UserName = 'Label8'
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 90752
          mmTop = 31750
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoPROV: TppLabel
          UserName = 'Label9'
          Caption = 'Vencimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 114565
          mmTop = 31750
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoDESC: TppLabel
          UserName = 'Label10'
          Caption = 'Descontos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 151342
          mmTop = 31750
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object lnReciboPagamento3: TppLine
          UserName = 'Line5'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 74348
          mmLeft = 138642
          mmTop = 30692
          mmWidth = 3704
          BandType = 3
          GroupNo = 0
        end
        object lnReciboPagamento1: TppLine
          UserName = 'Line6'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 89429
          mmTop = 30956
          mmWidth = 3704
          BandType = 3
          GroupNo = 0
        end
        object lnReciboPagamento2: TppLine
          UserName = 'Line7'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 104511
          mmTop = 30956
          mmWidth = 3704
          BandType = 3
          GroupNo = 0
        end
        object shpReciboPagamento7: TppShape
          UserName = 'Shape8'
          mmHeight = 12435
          mmLeft = 794
          mmTop = 105040
          mmWidth = 103981
          BandType = 3
          GroupNo = 0
        end
        object shpReciboPagamento8: TppShape
          UserName = 'Shape9'
          mmHeight = 7673
          mmLeft = 104511
          mmTop = 105040
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object shpReciboPagamento10: TppShape
          UserName = 'Shape10'
          mmHeight = 7673
          mmLeft = 138642
          mmTop = 105040
          mmWidth = 36513
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoTOT_PROV: TppLabel
          UserName = 'Label11'
          Caption = 'Total de Vencimentos: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 107950
          mmTop = 105834
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoTOT_DESC: TppLabel
          UserName = 'Label12'
          Caption = 'Total de Descontos: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 145257
          mmTop = 105834
          mmWidth = 24606
          BandType = 3
          GroupNo = 0
        end
        object shpReciboPagamento11: TppShape
          UserName = 'Shape11'
          mmHeight = 5027
          mmLeft = 138642
          mmTop = 112448
          mmWidth = 36513
          BandType = 3
          GroupNo = 0
        end
        object shpReciboPagamento9: TppShape
          UserName = 'Shape12'
          mmHeight = 5027
          mmLeft = 104511
          mmTop = 112448
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoTOT_LIQ: TppLabel
          UserName = 'Label13'
          Caption = 'Total Líquido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 113242
          mmTop = 112977
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoBASE_IRRF: TppLabel
          UserName = 'Label14'
          Caption = 'Base do IRRF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 84138
          mmTop = 118004
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoFGTS_MES: TppLabel
          UserName = 'Label15'
          Caption = 'FGTS do Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 65088
          mmTop = 118004
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoBASE_FGTS: TppLabel
          UserName = 'Label16'
          Caption = 'Base FGTS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 47361
          mmTop = 118004
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoBASE_INSS: TppLabel
          UserName = 'Label17'
          Caption = 'Base INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 27781
          mmTop = 118004
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoSAL_BASE: TppLabel
          UserName = 'Label18'
          Caption = 'Salário Base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 3704
          mmTop = 118004
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoDESCONTO1: TppDBText
          UserName = 'DBText9'
          BlankWhenZero = True
          DataField = 'DESCONTO1'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 37042
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoDESCONTO2: TppDBText
          UserName = 'DBText10'
          BlankWhenZero = True
          DataField = 'DESCONTO2'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 41540
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoDESCONTO3: TppDBText
          UserName = 'DBText11'
          BlankWhenZero = True
          DataField = 'DESCONTO3'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 46038
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoDESCONTO4: TppDBText
          UserName = 'DBText12'
          BlankWhenZero = True
          DataField = 'DESCONTO4'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 50536
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoDESCONTO5: TppDBText
          UserName = 'DBText13'
          BlankWhenZero = True
          DataField = 'DESCONTO5'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 55033
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoDESCONTO6: TppDBText
          UserName = 'DBText14'
          BlankWhenZero = True
          DataField = 'DESCONTO6'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 59531
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoDESCONTO7: TppDBText
          UserName = 'DBText15'
          BlankWhenZero = True
          DataField = 'DESCONTO7'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 64029
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoDESCONTO8: TppDBText
          UserName = 'DBText16'
          BlankWhenZero = True
          DataField = 'DESCONTO8'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 68527
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoDESCONTO9: TppDBText
          UserName = 'DBText17'
          BlankWhenZero = True
          DataField = 'DESCONTO9'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 73025
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoDESCONTO10: TppDBText
          UserName = 'DBText18'
          BlankWhenZero = True
          DataField = 'DESCONTO10'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 77523
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoDESCONTO11: TppDBText
          UserName = 'DBText19'
          BlankWhenZero = True
          DataField = 'DESCONTO11'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 82021
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoDESCONTO12: TppDBText
          UserName = 'DBText20'
          BlankWhenZero = True
          DataField = 'DESCONTO12'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 86519
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoDESCONTO13: TppDBText
          UserName = 'DBText21'
          BlankWhenZero = True
          DataField = 'DESCONTO13'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 91017
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoDESCONTO14: TppDBText
          UserName = 'DBText22'
          BlankWhenZero = True
          DataField = 'DESCONTO14'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 95515
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoDESCONTO15: TppDBText
          UserName = 'DBText23'
          BlankWhenZero = True
          DataField = 'DESCONTO15'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 100013
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoPROVENTO1: TppDBText
          UserName = 'DBText24'
          BlankWhenZero = True
          DataField = 'PROVENTO1'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105569
          mmTop = 37042
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoPROVENTO2: TppDBText
          UserName = 'DBText25'
          BlankWhenZero = True
          DataField = 'PROVENTO2'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105569
          mmTop = 41540
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoPROVENTO3: TppDBText
          UserName = 'DBText26'
          BlankWhenZero = True
          DataField = 'PROVENTO3'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105569
          mmTop = 46038
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoPROVENTO4: TppDBText
          UserName = 'DBText27'
          BlankWhenZero = True
          DataField = 'PROVENTO4'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105569
          mmTop = 50536
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoPROVENTO5: TppDBText
          UserName = 'DBText28'
          BlankWhenZero = True
          DataField = 'PROVENTO5'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105569
          mmTop = 55033
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoPROVENTO6: TppDBText
          UserName = 'DBText29'
          BlankWhenZero = True
          DataField = 'PROVENTO6'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105569
          mmTop = 59531
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoPROVENTO7: TppDBText
          UserName = 'DBText30'
          BlankWhenZero = True
          DataField = 'PROVENTO7'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105569
          mmTop = 64029
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoPROVENTO8: TppDBText
          UserName = 'DBText31'
          BlankWhenZero = True
          DataField = 'PROVENTO8'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105569
          mmTop = 68527
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoPROVENTO9: TppDBText
          UserName = 'DBText32'
          BlankWhenZero = True
          DataField = 'PROVENTO9'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105569
          mmTop = 73025
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoPROVENTO10: TppDBText
          UserName = 'DBText33'
          BlankWhenZero = True
          DataField = 'PROVENTO10'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105569
          mmTop = 77523
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoPROVENTO11: TppDBText
          UserName = 'DBText34'
          BlankWhenZero = True
          DataField = 'PROVENTO11'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105569
          mmTop = 82021
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoPROVENTO12: TppDBText
          UserName = 'DBText35'
          BlankWhenZero = True
          DataField = 'PROVENTO12'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105569
          mmTop = 86519
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoPROVENTO13: TppDBText
          UserName = 'DBText36'
          BlankWhenZero = True
          DataField = 'PROVENTO13'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105569
          mmTop = 91017
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoPROVENTO14: TppDBText
          UserName = 'DBText37'
          BlankWhenZero = True
          DataField = 'PROVENTO14'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105569
          mmTop = 95515
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoPROVENTO15: TppDBText
          UserName = 'DBText38'
          BlankWhenZero = True
          DataField = 'PROVENTO15'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105569
          mmTop = 100013
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoREFERENCIA1: TppDBText
          UserName = 'DBText39'
          DataField = 'REFERENCIA1'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 90488
          mmTop = 37042
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoREFERENCIA2: TppDBText
          UserName = 'DBText40'
          DataField = 'REFERENCIA2'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 90488
          mmTop = 41540
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoREFERENCIA3: TppDBText
          UserName = 'DBText41'
          DataField = 'REFERENCIA3'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 90488
          mmTop = 46038
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoREFERENCIA4: TppDBText
          UserName = 'DBText42'
          DataField = 'REFERENCIA4'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 90488
          mmTop = 50536
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoREFERENCIA5: TppDBText
          UserName = 'DBText43'
          DataField = 'REFERENCIA5'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 90488
          mmTop = 55033
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoREFERENCIA6: TppDBText
          UserName = 'DBText44'
          DataField = 'REFERENCIA6'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 90488
          mmTop = 59531
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoREFERENCIA7: TppDBText
          UserName = 'DBText45'
          DataField = 'REFERENCIA7'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 90488
          mmTop = 64029
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoREFERENCIA8: TppDBText
          UserName = 'DBText46'
          DataField = 'REFERENCIA8'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 90488
          mmTop = 68527
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoREFERENCIA9: TppDBText
          UserName = 'DBText47'
          DataField = 'REFERENCIA9'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 90488
          mmTop = 73025
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoREFERENCIA10: TppDBText
          UserName = 'DBText48'
          DataField = 'REFERENCIA10'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 90488
          mmTop = 77523
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoREFERENCIA11: TppDBText
          UserName = 'DBText49'
          DataField = 'REFERENCIA11'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 90488
          mmTop = 82021
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoREFERENCIA12: TppDBText
          UserName = 'DBText50'
          DataField = 'REFERENCIA12'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 90488
          mmTop = 86519
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoREFERENCIA13: TppDBText
          UserName = 'DBText51'
          DataField = 'REFERENCIA13'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 90488
          mmTop = 91017
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoREFERENCIA14: TppDBText
          UserName = 'DBText52'
          DataField = 'REFERENCIA14'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 90488
          mmTop = 95515
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoREFERENCIA15: TppDBText
          UserName = 'DBText53'
          DataField = 'REFERENCIA15'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 90488
          mmTop = 100013
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoRUBRICA1: TppDBText
          UserName = 'DBText54'
          DataField = 'RUBRICA1'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 37042
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoRUBRICA2: TppDBText
          UserName = 'DBText55'
          DataField = 'RUBRICA2'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 41540
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoRUBRICA3: TppDBText
          UserName = 'DBText56'
          DataField = 'RUBRICA3'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 46038
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoRUBRICA4: TppDBText
          UserName = 'DBText57'
          DataField = 'RUBRICA4'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 50536
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoRUBRICA5: TppDBText
          UserName = 'DBText58'
          DataField = 'RUBRICA5'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 55033
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoRUBRICA6: TppDBText
          UserName = 'DBText59'
          DataField = 'RUBRICA6'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 59531
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoRUBRICA7: TppDBText
          UserName = 'DBText60'
          DataField = 'RUBRICA7'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 64029
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoRUBRICA8: TppDBText
          UserName = 'DBText61'
          DataField = 'RUBRICA8'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 68527
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoRUBRICA9: TppDBText
          UserName = 'DBText62'
          DataField = 'RUBRICA9'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 73025
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoRUBRICA10: TppDBText
          UserName = 'DBText63'
          DataField = 'RUBRICA10'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 77523
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoRUBRICA11: TppDBText
          UserName = 'DBText64'
          DataField = 'RUBRICA11'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 82021
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoRUBRICA12: TppDBText
          UserName = 'DBText65'
          DataField = 'RUBRICA12'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 86519
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoRUBRICA13: TppDBText
          UserName = 'DBText66'
          DataField = 'RUBRICA13'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 91017
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoRUBRICA14: TppDBText
          UserName = 'DBText67'
          DataField = 'RUBRICA14'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 95515
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoRUBRICA15: TppDBText
          UserName = 'DBText68'
          DataField = 'RUBRICA15'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17992
          mmTop = 100013
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCODRUBRICA1: TppDBText
          UserName = 'DBText69'
          DataField = 'CODRUBRICA1'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 37042
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCODRUBRICA2: TppDBText
          UserName = 'DBText70'
          DataField = 'CODRUBRICA2'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 41540
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCODRUBRICA3: TppDBText
          UserName = 'DBText71'
          DataField = 'CODRUBRICA3'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 46038
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCODRUBRICA4: TppDBText
          UserName = 'DBText72'
          DataField = 'CODRUBRICA4'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 50536
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCODRUBRICA5: TppDBText
          UserName = 'DBText73'
          DataField = 'CODRUBRICA5'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 55033
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCODRUBRICA6: TppDBText
          UserName = 'DBText74'
          DataField = 'CODRUBRICA6'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 59531
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCODRUBRICA7: TppDBText
          UserName = 'DBText75'
          DataField = 'CODRUBRICA7'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 64029
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCODRUBRICA8: TppDBText
          UserName = 'DBText76'
          DataField = 'CODRUBRICA8'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 68527
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCODRUBRICA9: TppDBText
          UserName = 'DBText77'
          DataField = 'CODRUBRICA9'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 73025
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCODRUBRICA10: TppDBText
          UserName = 'DBText78'
          DataField = 'CODRUBRICA10'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 77523
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCODRUBRICA11: TppDBText
          UserName = 'DBText79'
          DataField = 'CODRUBRICA11'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 82021
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCODRUBRICA12: TppDBText
          UserName = 'DBText80'
          DataField = 'CODRUBRICA12'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 86519
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCODRUBRICA13: TppDBText
          UserName = 'DBText81'
          DataField = 'CODRUBRICA13'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 91017
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCODRUBRICA14: TppDBText
          UserName = 'DBText82'
          DataField = 'CODRUBRICA14'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 95515
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoCODRUBRICA15: TppDBText
          UserName = 'DBText83'
          DataField = 'CODRUBRICA15'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 100013
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoFOLHA: TppDBText
          UserName = 'DBText84'
          DataField = 'FOLHA'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 1588
          mmTop = 11377
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoSAL_BASE: TppDBText
          UserName = 'DBText85'
          DataField = 'SALBASE'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 121444
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoBASE_INSS: TppDBText
          UserName = 'DBText86'
          DataField = 'BASEINSS'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 23283
          mmTop = 121179
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoBASE_FGTS: TppDBText
          UserName = 'DBText87'
          DataField = 'BASEFGTS'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 43656
          mmTop = 121444
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoFGTS_MES: TppDBText
          UserName = 'DBText88'
          DataField = 'FGTSMES'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 64029
          mmTop = 121444
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoBASE_IRRF: TppDBText
          UserName = 'DBText89'
          DataField = 'BASEIRRF'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 83344
          mmTop = 121444
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoTOT_PROVENTOS: TppDBText
          UserName = 'DBText90'
          DataField = 'TOT_PROVENTOS'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 106098
          mmTop = 108479
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoTOT_DESCONTOS: TppDBText
          UserName = 'DBText91'
          DataField = 'TOT_DESCONTOS'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 140494
          mmTop = 108479
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoTOT_GERAL: TppDBText
          UserName = 'DBText92'
          DataField = 'TOT_GERAL'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 140494
          mmTop = 113242
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object dbtxtReciboPagamentoMES_REF: TppDBText
          UserName = 'DBText93'
          DataField = 'MES_REF'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 143404
          mmTop = 16669
          mmWidth = 30427
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText94'
          DataField = 'FUNCAO'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 109273
          mmWidth = 99484
          BandType = 3
          GroupNo = 0
        end
        object lblNumDepIRRF: TppLabel
          UserName = 'Label20'
          Caption = 'Nº Dep IRRF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 103981
          mmTop = 118004
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object rpReciboPagamentoNUMDEPIRRF: TppDBText
          UserName = 'DBText95'
          DataField = 'NUMDEPIRRF'
          DataPipeline = ppReciboPagamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 103717
          mmTop = 121444
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object lblReciboPagamentoBASEPREV: TppLabel
          UserName = 'Label21'
          Caption = 'Base Prev Priv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 120650
          mmTop = 118004
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpReciboPagamentoBASEPREV: TppDBText
          UserName = 'DBText96'
          DataField = 'BASEPREVPRIV'
          DataPipeline = ppReciboPagamento
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 121179
          mmTop = 121444
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand10: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppReciboPagamento: TppBDEPipeline
    DataSource = dsReciboPagamento
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ReciboPagamento'
    Left = 224
    Top = 48
    object ppReciboPagamentoppField1: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppReciboPagamentoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAGINA'
      FieldName = 'PAGINA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppReciboPagamentoppField3: TppField
      FieldAlias = 'FOLHA'
      FieldName = 'FOLHA'
      FieldLength = 17
      DisplayWidth = 17
      Position = 2
    end
    object ppReciboPagamentoppField4: TppField
      FieldAlias = 'MES_REF'
      FieldName = 'MES_REF'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object ppReciboPagamentoppField5: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 4
    end
    object ppReciboPagamentoppField6: TppField
      FieldAlias = 'C_CUSTO'
      FieldName = 'C_CUSTO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 5
    end
    object ppReciboPagamentoppField7: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppReciboPagamentoppField8: TppField
      FieldAlias = 'FUNCAO'
      FieldName = 'FUNCAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppReciboPagamentoppField9: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object ppReciboPagamentoppField10: TppField
      FieldAlias = 'CGC'
      FieldName = 'CGC'
      FieldLength = 25
      DisplayWidth = 25
      Position = 9
    end
    object ppReciboPagamentoppField11: TppField
      FieldAlias = 'INSCRICAO'
      FieldName = 'INSCRICAO'
      FieldLength = 25
      DisplayWidth = 25
      Position = 10
    end
    object ppReciboPagamentoppField12: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 80
      DisplayWidth = 80
      Position = 11
    end
    object ppReciboPagamentoppField13: TppField
      FieldAlias = 'CODRUBRICA1'
      FieldName = 'CODRUBRICA1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object ppReciboPagamentoppField14: TppField
      FieldAlias = 'RUBRICA1'
      FieldName = 'RUBRICA1'
      FieldLength = 60
      DisplayWidth = 60
      Position = 13
    end
    object ppReciboPagamentoppField15: TppField
      FieldAlias = 'REFERENCIA1'
      FieldName = 'REFERENCIA1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
    object ppReciboPagamentoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO1'
      FieldName = 'PROVENTO1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppReciboPagamentoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO1'
      FieldName = 'DESCONTO1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppReciboPagamentoppField18: TppField
      FieldAlias = 'CODRUBRICA2'
      FieldName = 'CODRUBRICA2'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppReciboPagamentoppField19: TppField
      FieldAlias = 'RUBRICA2'
      FieldName = 'RUBRICA2'
      FieldLength = 60
      DisplayWidth = 60
      Position = 18
    end
    object ppReciboPagamentoppField20: TppField
      FieldAlias = 'REFERENCIA2'
      FieldName = 'REFERENCIA2'
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object ppReciboPagamentoppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO2'
      FieldName = 'PROVENTO2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppReciboPagamentoppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO2'
      FieldName = 'DESCONTO2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppReciboPagamentoppField23: TppField
      FieldAlias = 'CODRUBRICA3'
      FieldName = 'CODRUBRICA3'
      FieldLength = 10
      DisplayWidth = 10
      Position = 22
    end
    object ppReciboPagamentoppField24: TppField
      FieldAlias = 'RUBRICA3'
      FieldName = 'RUBRICA3'
      FieldLength = 60
      DisplayWidth = 60
      Position = 23
    end
    object ppReciboPagamentoppField25: TppField
      FieldAlias = 'REFERENCIA3'
      FieldName = 'REFERENCIA3'
      FieldLength = 10
      DisplayWidth = 10
      Position = 24
    end
    object ppReciboPagamentoppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO3'
      FieldName = 'PROVENTO3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppReciboPagamentoppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO3'
      FieldName = 'DESCONTO3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppReciboPagamentoppField28: TppField
      FieldAlias = 'CODRUBRICA4'
      FieldName = 'CODRUBRICA4'
      FieldLength = 10
      DisplayWidth = 10
      Position = 27
    end
    object ppReciboPagamentoppField29: TppField
      FieldAlias = 'RUBRICA4'
      FieldName = 'RUBRICA4'
      FieldLength = 60
      DisplayWidth = 60
      Position = 28
    end
    object ppReciboPagamentoppField30: TppField
      FieldAlias = 'REFERENCIA4'
      FieldName = 'REFERENCIA4'
      FieldLength = 10
      DisplayWidth = 10
      Position = 29
    end
    object ppReciboPagamentoppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO4'
      FieldName = 'PROVENTO4'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object ppReciboPagamentoppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO4'
      FieldName = 'DESCONTO4'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppReciboPagamentoppField33: TppField
      FieldAlias = 'CODRUBRICA5'
      FieldName = 'CODRUBRICA5'
      FieldLength = 10
      DisplayWidth = 10
      Position = 32
    end
    object ppReciboPagamentoppField34: TppField
      FieldAlias = 'RUBRICA5'
      FieldName = 'RUBRICA5'
      FieldLength = 60
      DisplayWidth = 60
      Position = 33
    end
    object ppReciboPagamentoppField35: TppField
      FieldAlias = 'REFERENCIA5'
      FieldName = 'REFERENCIA5'
      FieldLength = 10
      DisplayWidth = 10
      Position = 34
    end
    object ppReciboPagamentoppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO5'
      FieldName = 'PROVENTO5'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object ppReciboPagamentoppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO5'
      FieldName = 'DESCONTO5'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object ppReciboPagamentoppField38: TppField
      FieldAlias = 'CODRUBRICA6'
      FieldName = 'CODRUBRICA6'
      FieldLength = 10
      DisplayWidth = 10
      Position = 37
    end
    object ppReciboPagamentoppField39: TppField
      FieldAlias = 'RUBRICA6'
      FieldName = 'RUBRICA6'
      FieldLength = 60
      DisplayWidth = 60
      Position = 38
    end
    object ppReciboPagamentoppField40: TppField
      FieldAlias = 'REFERENCIA6'
      FieldName = 'REFERENCIA6'
      FieldLength = 10
      DisplayWidth = 10
      Position = 39
    end
    object ppReciboPagamentoppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO6'
      FieldName = 'PROVENTO6'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object ppReciboPagamentoppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO6'
      FieldName = 'DESCONTO6'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 41
    end
    object ppReciboPagamentoppField43: TppField
      FieldAlias = 'CODRUBRICA7'
      FieldName = 'CODRUBRICA7'
      FieldLength = 10
      DisplayWidth = 10
      Position = 42
    end
    object ppReciboPagamentoppField44: TppField
      FieldAlias = 'RUBRICA7'
      FieldName = 'RUBRICA7'
      FieldLength = 60
      DisplayWidth = 60
      Position = 43
    end
    object ppReciboPagamentoppField45: TppField
      FieldAlias = 'REFERENCIA7'
      FieldName = 'REFERENCIA7'
      FieldLength = 10
      DisplayWidth = 10
      Position = 44
    end
    object ppReciboPagamentoppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO7'
      FieldName = 'PROVENTO7'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object ppReciboPagamentoppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO7'
      FieldName = 'DESCONTO7'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object ppReciboPagamentoppField48: TppField
      FieldAlias = 'CODRUBRICA8'
      FieldName = 'CODRUBRICA8'
      FieldLength = 10
      DisplayWidth = 10
      Position = 47
    end
    object ppReciboPagamentoppField49: TppField
      FieldAlias = 'RUBRICA8'
      FieldName = 'RUBRICA8'
      FieldLength = 60
      DisplayWidth = 60
      Position = 48
    end
    object ppReciboPagamentoppField50: TppField
      FieldAlias = 'REFERENCIA8'
      FieldName = 'REFERENCIA8'
      FieldLength = 10
      DisplayWidth = 10
      Position = 49
    end
    object ppReciboPagamentoppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO8'
      FieldName = 'PROVENTO8'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 50
    end
    object ppReciboPagamentoppField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO8'
      FieldName = 'DESCONTO8'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 51
    end
    object ppReciboPagamentoppField53: TppField
      FieldAlias = 'CODRUBRICA9'
      FieldName = 'CODRUBRICA9'
      FieldLength = 10
      DisplayWidth = 10
      Position = 52
    end
    object ppReciboPagamentoppField54: TppField
      FieldAlias = 'RUBRICA9'
      FieldName = 'RUBRICA9'
      FieldLength = 60
      DisplayWidth = 60
      Position = 53
    end
    object ppReciboPagamentoppField55: TppField
      FieldAlias = 'REFERENCIA9'
      FieldName = 'REFERENCIA9'
      FieldLength = 10
      DisplayWidth = 10
      Position = 54
    end
    object ppReciboPagamentoppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO9'
      FieldName = 'PROVENTO9'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 55
    end
    object ppReciboPagamentoppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO9'
      FieldName = 'DESCONTO9'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 56
    end
    object ppReciboPagamentoppField58: TppField
      FieldAlias = 'CODRUBRICA10'
      FieldName = 'CODRUBRICA10'
      FieldLength = 10
      DisplayWidth = 10
      Position = 57
    end
    object ppReciboPagamentoppField59: TppField
      FieldAlias = 'RUBRICA10'
      FieldName = 'RUBRICA10'
      FieldLength = 60
      DisplayWidth = 60
      Position = 58
    end
    object ppReciboPagamentoppField60: TppField
      FieldAlias = 'REFERENCIA10'
      FieldName = 'REFERENCIA10'
      FieldLength = 10
      DisplayWidth = 10
      Position = 59
    end
    object ppReciboPagamentoppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO10'
      FieldName = 'PROVENTO10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 60
    end
    object ppReciboPagamentoppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO10'
      FieldName = 'DESCONTO10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 61
    end
    object ppReciboPagamentoppField63: TppField
      FieldAlias = 'CODRUBRICA11'
      FieldName = 'CODRUBRICA11'
      FieldLength = 10
      DisplayWidth = 10
      Position = 62
    end
    object ppReciboPagamentoppField64: TppField
      FieldAlias = 'RUBRICA11'
      FieldName = 'RUBRICA11'
      FieldLength = 60
      DisplayWidth = 60
      Position = 63
    end
    object ppReciboPagamentoppField65: TppField
      FieldAlias = 'REFERENCIA11'
      FieldName = 'REFERENCIA11'
      FieldLength = 10
      DisplayWidth = 10
      Position = 64
    end
    object ppReciboPagamentoppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO11'
      FieldName = 'PROVENTO11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 65
    end
    object ppReciboPagamentoppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO11'
      FieldName = 'DESCONTO11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object ppReciboPagamentoppField68: TppField
      FieldAlias = 'CODRUBRICA12'
      FieldName = 'CODRUBRICA12'
      FieldLength = 10
      DisplayWidth = 10
      Position = 67
    end
    object ppReciboPagamentoppField69: TppField
      FieldAlias = 'RUBRICA12'
      FieldName = 'RUBRICA12'
      FieldLength = 60
      DisplayWidth = 60
      Position = 68
    end
    object ppReciboPagamentoppField70: TppField
      FieldAlias = 'REFERENCIA12'
      FieldName = 'REFERENCIA12'
      FieldLength = 10
      DisplayWidth = 10
      Position = 69
    end
    object ppReciboPagamentoppField71: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO12'
      FieldName = 'PROVENTO12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 70
    end
    object ppReciboPagamentoppField72: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO12'
      FieldName = 'DESCONTO12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 71
    end
    object ppReciboPagamentoppField73: TppField
      FieldAlias = 'CODRUBRICA13'
      FieldName = 'CODRUBRICA13'
      FieldLength = 10
      DisplayWidth = 10
      Position = 72
    end
    object ppReciboPagamentoppField74: TppField
      FieldAlias = 'RUBRICA13'
      FieldName = 'RUBRICA13'
      FieldLength = 60
      DisplayWidth = 60
      Position = 73
    end
    object ppReciboPagamentoppField75: TppField
      FieldAlias = 'REFERENCIA13'
      FieldName = 'REFERENCIA13'
      FieldLength = 10
      DisplayWidth = 10
      Position = 74
    end
    object ppReciboPagamentoppField76: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO13'
      FieldName = 'PROVENTO13'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 75
    end
    object ppReciboPagamentoppField77: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO13'
      FieldName = 'DESCONTO13'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 76
    end
    object ppReciboPagamentoppField78: TppField
      FieldAlias = 'CODRUBRICA14'
      FieldName = 'CODRUBRICA14'
      FieldLength = 10
      DisplayWidth = 10
      Position = 77
    end
    object ppReciboPagamentoppField79: TppField
      FieldAlias = 'RUBRICA14'
      FieldName = 'RUBRICA14'
      FieldLength = 60
      DisplayWidth = 60
      Position = 78
    end
    object ppReciboPagamentoppField80: TppField
      FieldAlias = 'REFERENCIA14'
      FieldName = 'REFERENCIA14'
      FieldLength = 10
      DisplayWidth = 10
      Position = 79
    end
    object ppReciboPagamentoppField81: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO14'
      FieldName = 'PROVENTO14'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 80
    end
    object ppReciboPagamentoppField82: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO14'
      FieldName = 'DESCONTO14'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 81
    end
    object ppReciboPagamentoppField83: TppField
      FieldAlias = 'CODRUBRICA15'
      FieldName = 'CODRUBRICA15'
      FieldLength = 10
      DisplayWidth = 10
      Position = 82
    end
    object ppReciboPagamentoppField84: TppField
      FieldAlias = 'RUBRICA15'
      FieldName = 'RUBRICA15'
      FieldLength = 60
      DisplayWidth = 60
      Position = 83
    end
    object ppReciboPagamentoppField85: TppField
      FieldAlias = 'REFERENCIA15'
      FieldName = 'REFERENCIA15'
      FieldLength = 10
      DisplayWidth = 10
      Position = 84
    end
    object ppReciboPagamentoppField86: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO15'
      FieldName = 'PROVENTO15'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 85
    end
    object ppReciboPagamentoppField87: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO15'
      FieldName = 'DESCONTO15'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 86
    end
    object ppReciboPagamentoppField88: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALBASE'
      FieldName = 'SALBASE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 87
    end
    object ppReciboPagamentoppField89: TppField
      Alignment = taRightJustify
      FieldAlias = 'BASEINSS'
      FieldName = 'BASEINSS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 88
    end
    object ppReciboPagamentoppField90: TppField
      Alignment = taRightJustify
      FieldAlias = 'BASEFGTS'
      FieldName = 'BASEFGTS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 89
    end
    object ppReciboPagamentoppField91: TppField
      Alignment = taRightJustify
      FieldAlias = 'FGTSMES'
      FieldName = 'FGTSMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 90
    end
    object ppReciboPagamentoppField92: TppField
      Alignment = taRightJustify
      FieldAlias = 'BASEIRRF'
      FieldName = 'BASEIRRF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 91
    end
    object ppReciboPagamentoppField93: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMDEPIRRF'
      FieldName = 'NUMDEPIRRF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 92
    end
    object ppReciboPagamentoppField94: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_PROVENTOS'
      FieldName = 'TOT_PROVENTOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 93
    end
    object ppReciboPagamentoppField95: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_DESCONTOS'
      FieldName = 'TOT_DESCONTOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 94
    end
    object ppReciboPagamentoppField96: TppField
      FieldAlias = 'TOT_GERAL'
      FieldName = 'TOT_GERAL'
      FieldLength = 20
      DisplayWidth = 20
      Position = 95
    end
    object ppReciboPagamentoppField97: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORMARGEM1'
      FieldName = 'VALORMARGEM1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 96
    end
    object ppReciboPagamentoppField98: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORMARGEM2'
      FieldName = 'VALORMARGEM2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 97
    end
    object ppReciboPagamentoppField99: TppField
      Alignment = taRightJustify
      FieldAlias = 'BASEPREVPRIV'
      FieldName = 'BASEPREVPRIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 98
    end
  end
  object dsReciboPagamento: TwwDataSource
    DataSet = CdsReciboPagamento
    Left = 224
    Top = 96
  end
  object sqlReciboPagamento: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPREGADO,'
      '  0 AS PAGINA,'
      '  '#39'12345678901234567'#39' AS FOLHA,'
      '  '#39'12345678901234567890'#39' AS MES_REF,'
      '  '#39'1234567890123'#39' AS MATRICULA,'
      '  '#39'123456789012345678901234567890'#39' AS C_CUSTO,'
      '  '#39'12345678901234567890123456789012345678901234567890'#39' AS CARGO,'
      
        '  '#39'12345678901234567890123456789012345678901234567890'#39' AS FUNCAO' +
        ','
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  '#39'1234567890123456789012345'#39' AS CGC,'
      '  '#39'1234567890123456789012345'#39' AS INSCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '2345678901234567890'#39' AS ENDERECO,'
      '  /* 1º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA1,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA1,'
      '  '#39'1234567890'#39' AS REFERENCIA1,'
      '  0 AS PROVENTO1,'
      '  0 AS DESCONTO1,'
      '  /* 2º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA2,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA2,'
      '  '#39'1234567890'#39' AS REFERENCIA2,'
      '  0 AS PROVENTO2,'
      '  0 AS DESCONTO2,'
      '  /* 3º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA3,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA3,'
      '  '#39'1234567890'#39' AS REFERENCIA3,'
      '  0 AS PROVENTO3,'
      '  0 AS DESCONTO3,'
      '  /* 4º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA4,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA4,'
      '  '#39'1234567890'#39' AS REFERENCIA4,'
      '  0 AS PROVENTO4,'
      '  0 AS DESCONTO4,'
      '  /* 5º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA5,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA5,'
      '  '#39'1234567890'#39' AS REFERENCIA5,'
      '  0 AS PROVENTO5,'
      '  0 AS DESCONTO5,'
      '  /* 6º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA6,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA6,'
      '  '#39'1234567890'#39' AS REFERENCIA6,'
      '  0 AS PROVENTO6,'
      '  0 AS DESCONTO6,'
      '  /* 7º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA7,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA7,'
      '  '#39'1234567890'#39' AS REFERENCIA7,'
      '  0 AS PROVENTO7,'
      '  0 AS DESCONTO7,'
      '  /* 8º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA8,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA8,'
      '  '#39'1234567890'#39' AS REFERENCIA8,'
      '  0 AS PROVENTO8,'
      '  0 AS DESCONTO8,'
      '  /* 9º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA9,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA9,'
      '  '#39'1234567890'#39' AS REFERENCIA9,'
      '  0 AS PROVENTO9,'
      '  0 AS DESCONTO9,'
      '  /* 10º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA10,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA10,'
      '  '#39'1234567890'#39' AS REFERENCIA10,'
      '  0 AS PROVENTO10,'
      '  0 AS DESCONTO10,'
      '  /* 11º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA11,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA11,'
      '  '#39'1234567890'#39' AS REFERENCIA11,'
      '  0 AS PROVENTO11,'
      '  0 AS DESCONTO11,'
      '  /* 12º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA12,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA12,'
      '  '#39'1234567890'#39' AS REFERENCIA12,'
      '  0 AS PROVENTO12,'
      '  0 AS DESCONTO12,'
      '  /* 13º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA13,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA13,'
      '  '#39'1234567890'#39' AS REFERENCIA13,'
      '  0 AS PROVENTO13,'
      '  0 AS DESCONTO13,'
      '  /* 14º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA14,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA14,'
      '  '#39'1234567890'#39' AS REFERENCIA14,'
      '  0 AS PROVENTO14,'
      '  0 AS DESCONTO14,'
      '  /* 15º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA15,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA15,'
      '  '#39'1234567890'#39' AS REFERENCIA15,'
      '  0 AS PROVENTO15,'
      '  0 AS DESCONTO15,'
      '  /* OUTROS DADOS */'
      '  0 AS SALBASE,'
      '  0 AS BASEINSS,'
      '  0 AS BASEFGTS,'
      '  0 AS FGTSMES,'
      '  0 AS BASEIRRF,'
      '  0 AS NUMDEPIRRF,'
      '  0 AS TOT_PROVENTOS,'
      '  0 AS TOT_DESCONTOS,'
      '  '#39'12345678901234567890'#39' AS TOT_GERAL,'
      '  0 AS VALORMARGEM1, 0 AS VALORMARGEM2, 0 AS BASEPREVPRIV'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)'
      ' ')
    ClientDataSet = CdsReciboPagamento
    Left = 224
    Top = 190
  end
  object CdsReciboPagamento: TCMClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EMPREGADO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PAGINA'
        DataType = ftFloat
      end
      item
        Name = 'FOLHA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 17
      end
      item
        Name = 'MES_REF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MATRICULA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 13
      end
      item
        Name = 'C_CUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CARGO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'FUNCAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'EMPRESA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CGC'
        Attributes = [faFixed]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'INSCRICAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'ENDERECO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 80
      end
      item
        Name = 'CODRUBRICA1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO1'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO1'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO3'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO3'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO4'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO4'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO5'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO5'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA6'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA6'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA6'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO6'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO6'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA7'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA7'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA7'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO7'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO7'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA8'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA8'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA8'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO8'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO8'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA9'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA9'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA9'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO9'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO9'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA10'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA10'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA10'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO10'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO10'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA11'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA11'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA11'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO11'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO11'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA12'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA12'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA12'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO12'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO12'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA13'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA13'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA13'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO13'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO13'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA14'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA14'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA14'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO14'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO14'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA15'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA15'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA15'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO15'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO15'
        DataType = ftFloat
      end
      item
        Name = 'SALBASE'
        DataType = ftFloat
      end
      item
        Name = 'BASEINSS'
        DataType = ftFloat
      end
      item
        Name = 'BASEFGTS'
        DataType = ftFloat
      end
      item
        Name = 'FGTSMES'
        DataType = ftFloat
      end
      item
        Name = 'BASEIRRF'
        DataType = ftFloat
      end
      item
        Name = 'NUMDEPIRRF'
        DataType = ftFloat
      end
      item
        Name = 'TOT_PROVENTOS'
        DataType = ftFloat
      end
      item
        Name = 'TOT_DESCONTOS'
        DataType = ftFloat
      end
      item
        Name = 'TOT_GERAL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VALORMARGEM1'
        DataType = ftFloat
      end
      item
        Name = 'VALORMARGEM2'
        DataType = ftFloat
      end
      item
        Name = 'BASEPREVPRIV'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'IndicePrimario'
        Fields = 'EMPRESA;EMPREGADO'
      end>
    Params = <>
    StoreDefs = True
    AfterOpen = CdsReciboPagamentoAfterOpen
    AfterScroll = CdsReciboPagamentoAfterScroll
    Left = 224
    Top = 144
    Data = {
      5C0F00009619E0BD0100000018000000630000000000030000005C0F09454D50
      52454741444F01004900000002000753554254595045020049000A0046697865
      644368617200055749445448020002003C0006504147494E4108000400000000
      0005464F4C484101004900000002000753554254595045020049000A00466978
      65644368617200055749445448020002001100074D45535F5245460100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      48020002001400094D4154524943554C41010049000000020007535542545950
      45020049000A0046697865644368617200055749445448020002000D0007435F
      435553544F01004900000002000753554254595045020049000A004669786564
      4368617200055749445448020002001E0005434152474F010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      0032000646554E43414F01004900000002000753554254595045020049000A00
      4669786564436861720005574944544802000200320007454D50524553410100
      4900000002000753554254595045020049000A00466978656443686172000557
      49445448020002003C0003434743010049000000020007535542545950450200
      49000A004669786564436861720005574944544802000200190009494E534352
      4943414F01004900000002000753554254595045020049000A00466978656443
      6861720005574944544802000200190008454E44455245434F01004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      00020050000B434F445255425249434131010049000000020007535542545950
      45020049000A0046697865644368617200055749445448020002000A00085255
      42524943413101004900000002000753554254595045020049000A0046697865
      644368617200055749445448020002003C000B5245464552454E434941310100
      4900000002000753554254595045020049000A00466978656443686172000557
      49445448020002000A000950524F56454E544F31080004000000000009444553
      434F4E544F3108000400000000000B434F445255425249434132010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      020002000A000852554252494341320100490000000200075355425459504502
      0049000A0046697865644368617200055749445448020002003C000B52454645
      52454E4349413201004900000002000753554254595045020049000A00466978
      65644368617200055749445448020002000A000950524F56454E544F32080004
      000000000009444553434F4E544F3208000400000000000B434F445255425249
      43413301004900000002000753554254595045020049000A0046697865644368
      617200055749445448020002000A000852554252494341330100490000000200
      0753554254595045020049000A00466978656443686172000557494454480200
      02003C000B5245464552454E4349413301004900000002000753554254595045
      020049000A0046697865644368617200055749445448020002000A000950524F
      56454E544F33080004000000000009444553434F4E544F330800040000000000
      0B434F4452554252494341340100490000000200075355425459504502004900
      0A0046697865644368617200055749445448020002000A000852554252494341
      3401004900000002000753554254595045020049000A00466978656443686172
      00055749445448020002003C000B5245464552454E4349413401004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      0002000A000950524F56454E544F34080004000000000009444553434F4E544F
      3408000400000000000B434F4452554252494341350100490000000200075355
      4254595045020049000A0046697865644368617200055749445448020002000A
      0008525542524943413501004900000002000753554254595045020049000A00
      46697865644368617200055749445448020002003C000B5245464552454E4349
      413501004900000002000753554254595045020049000A004669786564436861
      7200055749445448020002000A000950524F56454E544F350800040000000000
      09444553434F4E544F3508000400000000000B434F4452554252494341360100
      4900000002000753554254595045020049000A00466978656443686172000557
      49445448020002000A0008525542524943413601004900000002000753554254
      595045020049000A0046697865644368617200055749445448020002003C000B
      5245464552454E4349413601004900000002000753554254595045020049000A
      0046697865644368617200055749445448020002000A000950524F56454E544F
      36080004000000000009444553434F4E544F3608000400000000000B434F4452
      5542524943413701004900000002000753554254595045020049000A00466978
      65644368617200055749445448020002000A0008525542524943413701004900
      000002000753554254595045020049000A004669786564436861720005574944
      5448020002003C000B5245464552454E43494137010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002000A00
      0950524F56454E544F37080004000000000009444553434F4E544F3708000400
      000000000B434F44525542524943413801004900000002000753554254595045
      020049000A0046697865644368617200055749445448020002000A0008525542
      524943413801004900000002000753554254595045020049000A004669786564
      4368617200055749445448020002003C000B5245464552454E43494138010049
      00000002000753554254595045020049000A0046697865644368617200055749
      445448020002000A000950524F56454E544F3808000400000000000944455343
      4F4E544F3808000400000000000B434F44525542524943413901004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      0002000A00085255425249434139010049000000020007535542545950450200
      49000A0046697865644368617200055749445448020002003C000B5245464552
      454E4349413901004900000002000753554254595045020049000A0046697865
      644368617200055749445448020002000A000950524F56454E544F3908000400
      0000000009444553434F4E544F3908000400000000000C434F44525542524943
      41313001004900000002000753554254595045020049000A0046697865644368
      617200055749445448020002000A000952554252494341313001004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      0002003C000C5245464552454E43494131300100490000000200075355425459
      5045020049000A0046697865644368617200055749445448020002000A000A50
      524F56454E544F313008000400000000000A444553434F4E544F313008000400
      000000000C434F44525542524943413131010049000000020007535542545950
      45020049000A0046697865644368617200055749445448020002000A00095255
      4252494341313101004900000002000753554254595045020049000A00466978
      65644368617200055749445448020002003C000C5245464552454E4349413131
      01004900000002000753554254595045020049000A0046697865644368617200
      055749445448020002000A000A50524F56454E544F313108000400000000000A
      444553434F4E544F313108000400000000000C434F4452554252494341313201
      004900000002000753554254595045020049000A004669786564436861720005
      5749445448020002000A00095255425249434131320100490000000200075355
      4254595045020049000A0046697865644368617200055749445448020002003C
      000C5245464552454E4349413132010049000000020007535542545950450200
      49000A0046697865644368617200055749445448020002000A000A50524F5645
      4E544F313208000400000000000A444553434F4E544F31320800040000000000
      0C434F4452554252494341313301004900000002000753554254595045020049
      000A0046697865644368617200055749445448020002000A0009525542524943
      41313301004900000002000753554254595045020049000A0046697865644368
      617200055749445448020002003C000C5245464552454E434941313301004900
      000002000753554254595045020049000A004669786564436861720005574944
      5448020002000A000A50524F56454E544F313308000400000000000A44455343
      4F4E544F313308000400000000000C434F445255425249434131340100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      48020002000A0009525542524943413134010049000000020007535542545950
      45020049000A0046697865644368617200055749445448020002003C000C5245
      464552454E434941313401004900000002000753554254595045020049000A00
      46697865644368617200055749445448020002000A000A50524F56454E544F31
      3408000400000000000A444553434F4E544F313408000400000000000C434F44
      52554252494341313501004900000002000753554254595045020049000A0046
      697865644368617200055749445448020002000A000952554252494341313501
      004900000002000753554254595045020049000A004669786564436861720005
      5749445448020002003C000C5245464552454E43494131350100490000000200
      0753554254595045020049000A00466978656443686172000557494454480200
      02000A000A50524F56454E544F313508000400000000000A444553434F4E544F
      313508000400000000000753414C424153450800040000000000084241534549
      4E53530800040000000000084241534546475453080004000000000007464754
      534D4553080004000000000008424153454952524608000400000000000A4E55
      4D4445504952524608000400000000000D544F545F50524F56454E544F530800
      0400000000000D544F545F444553434F4E544F53080004000000000009544F54
      5F474552414C01004900000002000753554254595045020049000A0046697865
      6443686172000557494454480200020014000C56414C4F524D415247454D3108
      000400000000000C56414C4F524D415247454D3208000400000000000C424153
      45505245565052495608000400000000000100044C4349440400010009080000}
  end
end
