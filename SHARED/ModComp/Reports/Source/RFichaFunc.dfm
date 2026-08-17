inherited RptFichaFunc: TRptFichaFunc
  Left = 476
  Top = 129
  Width = 780
  Height = 451
  Caption = 'RptFichaFunc'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'ListaIdPessoa'
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
        Name = 'ListaIdPessoa'
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
        Caption = 'ImprimirDocumentacao'
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
        Name = 'ImprimirDocumentacao'
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
        Caption = 'ImprimirUltEmpregos'
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
        Name = 'ImprimirUltEmpregos'
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
        Caption = 'ImprimirTreinamento'
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
        Name = 'ImprimirTreinamento'
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
        Caption = 'ImprimirExperiencias'
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
        Name = 'ImprimirExperiencias'
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
        Caption = 'ImprimirAvaliacoes'
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
        Name = 'ImprimirAvaliacoes'
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
        Caption = 'ImprimirOcorrMedicas'
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
        Name = 'ImprimirOcorrMedicas'
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
        Caption = 'ImprimirEvolFunc'
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
        Name = 'ImprimirEvolFunc'
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
        Caption = 'ImprimirBenefSociais'
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
        Name = 'ImprimirBenefSociais'
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
        Caption = 'ImprimirFerias'
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
        Name = 'ImprimirFerias'
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
        Caption = 'ImprimirDependentes'
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
        Name = 'ImprimirDependentes'
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
        Caption = 'ImprimirContribSindical'
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
        Name = 'ImprimirContribSindical'
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
        Caption = 'ImprimirSitFunc'
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
        Name = 'ImprimirSitFunc'
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
        Caption = 'ImprimirAvalHay'
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
        Name = 'ImprimirAvalHay'
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
        Caption = 'ImprimirAdvertenciaSuspensao'
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
        Name = 'ImprimirAdvertenciaSuspensao'
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
        Caption = 'ImprimirOBS'
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
        Name = 'ImprimirOBS'
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
        Caption = 'ImprimirDescCargo'
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
        Name = 'ImprimirDescCargo'
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
        Caption = 'ImprimirCargoAlternativo'
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
        Name = 'ImprimirCargoAlternativo'
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
        Caption = 'MesRef'
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
        Caption = 'IncluirRodape'
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
        Name = 'IncluirRodape'
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
    Report = rpFichaFunc
    ConnectionType = cntBDE
  end
  object rpFichaFunc: TppReport
    AutoStop = False
    DataPipeline = ppFichaFunc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
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
    Left = 213
    Top = 6
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppFichaFunc'
    object rpFichaFuncHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 40746
      mmPrintPosition = 0
      object rpFichaFuncLbl1: TppLabel
        UserName = 'rpFichaFuncLbl1'
        Caption = 'Ficha Funcional'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 81227
        mmTop = 794
        mmWidth = 34925
        BandType = 0
      end
      object rpFichaFuncDBTxt1: TppDBText
        UserName = 'rpFichaFuncDBTxt1'
        DataField = 'EMPRESA'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 5821
        mmLeft = 8467
        mmTop = 7673
        mmWidth = 180446
        BandType = 0
      end
      object rpFichaFuncLine1: TppLine
        UserName = 'rpFichaFuncLine1'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 8467
        mmTop = 29633
        mmWidth = 180446
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Endereço:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 9260
        mmTop = 16140
        mmWidth = 13758
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'LOGRAJ'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 25400
        mmTop = 16140
        mmWidth = 8340
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'BAIRROJ'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 9260
        mmTop = 20373
        mmWidth = 6985
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'CEPJ'
        DataPipeline = ppFichaFunc
        DisplayFormat = '00000\-999;0;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 81492
        mmTop = 20373
        mmWidth = 11642
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'NUMEROJ'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 103188
        mmTop = 16140
        mmWidth = 6985
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'CIDADEJ'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 103188
        mmTop = 20373
        mmWidth = 12827
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'COMPLEJ'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 117475
        mmTop = 16140
        mmWidth = 6985
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'UFJ'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3704
        mmLeft = 142875
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label2'
        Caption = 'CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 8996
        mmTop = 25400
        mmWidth = 8467
        BandType = 0
      end
      object rpFichaFuncDbCNPJ: TppDBText
        UserName = 'rpFichaFuncDbCNPJ'
        AutoSize = True
        DataField = 'CNPJ'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 19315
        mmTop = 25400
        mmWidth = 21929
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Atividade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 102923
        mmTop = 25400
        mmWidth = 13229
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'CNAE'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 117475
        mmTop = 25400
        mmWidth = 15028
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 160867
        mmTop = 1852
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 146844
        mmTop = 2117
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label72'
        Caption = 'Nome...........:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 8467
        mmTop = 32544
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText59: TppDBText
        UserName = 'DBText601'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 27517
        mmTop = 32808
        mmWidth = 39031
        BandType = 0
      end
    end
    object rpFichaFuncDtlBnd: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 65617
      mmPrintPosition = 0
      object rpFichaFuncLabel4: TppLabel
        UserName = 'rpFichaFuncLabel4'
        Caption = 'Endereço:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 8467
        mmTop = 2910
        mmWidth = 13758
        BandType = 4
      end
      object rpFichaFuncLabel1: TppLabel
        UserName = 'rpFichaFuncLabel1'
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 8467
        mmTop = 11377
        mmWidth = 12435
        BandType = 4
      end
      object rpFichaFuncLabel2: TppLabel
        UserName = 'rpFichaFuncLabel2'
        Caption = 'Estabelecimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 8467
        mmTop = 24342
        mmWidth = 23019
        BandType = 4
      end
      object rpFichaFuncLabel3: TppLabel
        UserName = 'rpFichaFuncLabel3'
        Caption = 'Cargo Atual:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 8467
        mmTop = 28575
        mmWidth = 16669
        BandType = 4
      end
      object rpFichaFuncLabel6: TppLabel
        UserName = 'rpFichaFuncLabel6'
        Caption = 'Centro de Custo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 92340
        mmTop = 24342
        mmWidth = 22490
        BandType = 4
      end
      object rpFichaFuncLabel7: TppLabel
        UserName = 'rpFichaFuncLabel7'
        Caption = 'Salário Atual:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 96838
        mmTop = 28575
        mmWidth = 18256
        BandType = 4
      end
      object rpFichaFuncDBText1: TppDBText
        UserName = 'rpFichaFuncDBText1'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3175
        mmLeft = 24606
        mmTop = 2910
        mmWidth = 76729
        BandType = 4
      end
      object rpFichaFuncDBText2: TppDBText
        UserName = 'rpFichaFuncDBText2'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 8467
        mmTop = 7144
        mmWidth = 6985
        BandType = 4
      end
      object rpFichaFuncDBText3: TppDBText
        UserName = 'rpFichaFuncDBText3'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFichaFunc
        DisplayFormat = '00000\-999;0;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 80698
        mmTop = 7144
        mmWidth = 11642
        BandType = 4
      end
      object rpFichaFuncDBText4: TppDBText
        UserName = 'rpFichaFuncDBText4'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 102394
        mmTop = 2910
        mmWidth = 6985
        BandType = 4
      end
      object rpFichaFuncDBText5: TppDBText
        UserName = 'rpFichaFuncDBText5'
        DataField = 'CIDADE'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3175
        mmLeft = 102394
        mmTop = 7144
        mmWidth = 38365
        BandType = 4
      end
      object rpFichaFuncDBText6: TppDBText
        UserName = 'rpFichaFuncDBText6'
        AutoSize = True
        DataField = 'COMPLEMENTO'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 116681
        mmTop = 2910
        mmWidth = 6985
        BandType = 4
      end
      object rpFichaFuncDBText7: TppDBText
        UserName = 'rpFichaFuncDBText7'
        DataField = 'ESTAB'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3175
        mmLeft = 33602
        mmTop = 24342
        mmWidth = 57415
        BandType = 4
      end
      object rpFichaFuncDBText8: TppDBText
        UserName = 'rpFichaFuncDBText8'
        DataField = 'CARGO'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3175
        mmLeft = 26723
        mmTop = 28575
        mmWidth = 67998
        BandType = 4
      end
      object rpFichaFuncDBText10: TppDBText
        UserName = 'rpFichaFuncDBText10'
        DataField = 'C_CUSTO'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3175
        mmLeft = 116417
        mmTop = 24342
        mmWidth = 72761
        BandType = 4
      end
      object rpFichaFuncDBText11: TppDBText
        UserName = 'rpFichaFuncDBText11'
        AutoSize = True
        DataField = 'SALARIOATUAL'
        DataPipeline = ppFichaFunc
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 116417
        mmTop = 28575
        mmWidth = 8636
        BandType = 4
      end
      object rpFichaFuncDBText12: TppDBText
        UserName = 'rpFichaFuncDBText12'
        AutoSize = True
        DataField = 'TIPOPAGAMENTO'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 140494
        mmTop = 28575
        mmWidth = 15409
        BandType = 4
      end
      object rpFichaFuncDBText14: TppDBText
        UserName = 'rpFichaFuncDBText14'
        AutoSize = True
        DataField = 'DDI'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 23813
        mmTop = 11377
        mmWidth = 4995
        BandType = 4
      end
      object rpFichaFuncDBText15: TppDBText
        UserName = 'rpFichaFuncDBText15'
        AutoSize = True
        DataField = 'DDD'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 34131
        mmTop = 11377
        mmWidth = 6138
        BandType = 4
      end
      object rpFichaFuncDBText16: TppDBText
        UserName = 'rpFichaFuncDBText16'
        AutoSize = True
        DataField = 'TELEFONE'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 46567
        mmTop = 11377
        mmWidth = 6985
        BandType = 4
      end
      object rpFichaFuncDBText17: TppDBText
        UserName = 'rpFichaFuncDBText17'
        DataField = 'CODESTADO'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 7144
        mmWidth = 17198
        BandType = 4
      end
      object rpFichaFuncLbl5: TppLabel
        UserName = 'rpFichaFuncLbl5'
        Caption = 'Situação......:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 8467
        mmTop = 32808
        mmWidth = 17198
        BandType = 4
      end
      object rpFichaFuncDBTxt6: TppDBText
        UserName = 'rpFichaFuncDBTxt6'
        AutoSize = True
        DataField = 'SITUACAO'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 26723
        mmTop = 32808
        mmWidth = 74295
        BandType = 4
      end
      object rpFichaFuncLbl10: TppLabel
        UserName = 'rpFichaFuncLbl10'
        Caption = 'Vínculo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 103981
        mmTop = 32808
        mmWidth = 11377
        BandType = 4
      end
      object rpFichaFuncDBTxt11: TppDBText
        UserName = 'rpFichaFuncDBTxt11'
        AutoSize = True
        DataField = 'VINCULO'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 116417
        mmTop = 32808
        mmWidth = 29633
        BandType = 4
      end
      object rpFichaFuncLbl6: TppLabel
        UserName = 'rpFichaFuncLbl6'
        Caption = 'Admissão...:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 8467
        mmTop = 20108
        mmWidth = 16669
        BandType = 4
      end
      object rpFichaFuncDBTxt7: TppDBText
        UserName = 'rpFichaFuncDBTxt7'
        AutoSize = True
        DataField = 'DATAADMISSAO'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 26723
        mmTop = 20108
        mmWidth = 14139
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 102659
        mmTop = 20108
        mmWidth = 12171
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 116417
        mmTop = 20108
        mmWidth = 6265
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 8202
        mmTop = 16404
        mmWidth = 180446
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Demissão...:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 8467
        mmTop = 37306
        mmWidth = 16764
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        AutoSize = True
        DataField = 'DATADEMISSAOFLAG'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 26723
        mmTop = 37306
        mmWidth = 14139
        BandType = 4
      end
      object ppLabel25: TppLabel
        UserName = 'rpFichaFuncLbl102'
        Caption = 'Carga Horária:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 140494
        mmTop = 20108
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        AutoSize = True
        DataField = 'JORNADAMENSAL'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 161396
        mmTop = 20108
        mmWidth = 4699
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 8202
        mmTop = 41010
        mmWidth = 180446
        BandType = 4
      end
      object ppRegiaoDemitido: TppRegion
        UserName = 'RegiaoDemitido'
        mmHeight = 9525
        mmLeft = 8202
        mmTop = 43392
        mmWidth = 180446
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel26: TppLabel
          UserName = 'Label26'
          Caption = 'Data Desligamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 18785
          mmTop = 47890
          mmWidth = 26194
          BandType = 4
        end
        object ppDBText30: TppDBText
          UserName = 'DBText30'
          AutoSize = True
          DataField = 'DATADEMISSAO'
          DataPipeline = ppFichaFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppFichaFunc'
          mmHeight = 3260
          mmLeft = 46567
          mmTop = 47890
          mmWidth = 14139
          BandType = 4
        end
        object ppDBText31: TppDBText
          UserName = 'DBText201'
          AutoSize = True
          DataField = 'MOTIVODESLIG'
          DataPipeline = ppFichaFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppFichaFunc'
          mmHeight = 3260
          mmLeft = 84931
          mmTop = 47890
          mmWidth = 67564
          BandType = 4
        end
        object ppLabel31: TppLabel
          UserName = 'Label201'
          Caption = 'Motivo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 74083
          mmTop = 47890
          mmWidth = 9790
          BandType = 4
        end
        object ppLabel33: TppLabel
          UserName = 'Label33'
          Caption = 'Demitido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 9525
          mmTop = 43392
          mmWidth = 11906
          BandType = 4
        end
      end
      object ppLabel29: TppLabel
        UserName = 'rpFichaFuncLbl103'
        Caption = 'Horário:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 103717
        mmTop = 37306
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        AutoSize = True
        DataField = 'NOMEHORARIO'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3260
        mmLeft = 116417
        mmTop = 37306
        mmWidth = 14944
        BandType = 4
      end
      object ppRegiaoDescCargo: TppRegion
        UserName = 'RegiaoDescCargo'
        Stretch = True
        mmHeight = 10848
        mmLeft = 7938
        mmTop = 54504
        mmWidth = 180446
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel41: TppLabel
          UserName = 'Label41'
          Caption = 'Descrição das Funções'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 9260
          mmTop = 55298
          mmWidth = 30956
          BandType = 4
        end
        object rpFichaFuncDbDescCargo: TppDBMemo
          UserName = 'rpFichaFuncDbDescCargo'
          CharWrap = False
          DataField = 'DESCRCARGO'
          DataPipeline = ppFichaFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          DataPipelineName = 'ppFichaFunc'
          mmHeight = 4498
          mmLeft = 9525
          mmTop = 59531
          mmWidth = 176742
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
      object rpFichaFuncLblNivel: TppLabel
        UserName = 'rpFichaFuncLblNivel'
        Caption = 'Nível:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 173832
        mmTop = 28575
        mmWidth = 7673
        BandType = 4
      end
      object rpFichaFuncDbNivel: TppDBText
        UserName = 'rpFichaFuncDbNivel'
        DataField = 'NIVELINDIV1'
        DataPipeline = ppFichaFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFunc'
        mmHeight = 3175
        mmLeft = 182563
        mmTop = 28575
        mmWidth = 5821
        BandType = 4
      end
    end
    object rpFichaFuncFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Assinatura do Empregador: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 9260
        mmTop = 1058
        mmWidth = 37571
        BandType = 8
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 9260
        mmTop = 12435
        mmWidth = 79375
        BandType = 8
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Assinatura do Empregado: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 103452
        mmTop = 1058
        mmWidth = 36248
        BandType = 8
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 103452
        mmTop = 12435
        mmWidth = 79375
        BandType = 8
      end
    end
    object rpFichaFuncSmryBnd: TppSummaryBand
      AfterPrint = rpFichaFuncSmryBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 2646
      mmPrintPosition = 0
    end
    object rpFichaFuncGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppFichaFunc
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'rpFichaFuncGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppFichaFunc'
      object rpFichaFuncGrpHdrBnd: TppGroupHeaderBand
        BeforePrint = rpFichaFuncGrpHdrBndBeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 65881
        mmPrintPosition = 0
        object rpFichaFuncLbl2: TppLabel
          UserName = 'rpFichaFuncLbl2'
          Caption = 'Nome...........:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 9260
          mmTop = 3969
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object rpFichaFuncDBTxt2: TppDBText
          UserName = 'rpFichaFuncDBTxt2'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = ppFichaFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppFichaFunc'
          mmHeight = 3260
          mmLeft = 28310
          mmTop = 3969
          mmWidth = 39031
          BandType = 3
          GroupNo = 0
        end
        object rpFichaFuncDBTxt3: TppDBText
          UserName = 'rpFichaFuncDBTxt3'
          AutoSize = True
          DataField = 'DATANASC'
          DataPipeline = ppFichaFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppFichaFunc'
          mmHeight = 3260
          mmLeft = 28310
          mmTop = 1323
          mmWidth = 14139
          BandType = 3
          GroupNo = 0
        end
        object rpFichaFuncDBTxt4: TppDBText
          UserName = 'rpFichaFuncDBTxt4'
          AutoSize = True
          DataField = 'NOMEPAI'
          DataPipeline = ppFichaFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppFichaFunc'
          mmHeight = 3260
          mmLeft = 28310
          mmTop = 10319
          mmWidth = 8340
          BandType = 3
          GroupNo = 0
        end
        object rpFichaFuncDBTxt5: TppDBText
          UserName = 'rpFichaFuncDBTxt5'
          AutoSize = True
          DataField = 'NOMEMAE'
          DataPipeline = ppFichaFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppFichaFunc'
          mmHeight = 3260
          mmLeft = 28310
          mmTop = 14817
          mmWidth = 8340
          BandType = 3
          GroupNo = 0
        end
        object rpFichaFuncLbl3: TppLabel
          UserName = 'rpFichaFuncLbl3'
          Caption = 'Nascimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 9260
          mmTop = 1323
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object rpFichaFuncLbl4: TppLabel
          UserName = 'rpFichaFuncLbl4'
          Caption = 'Filiação........:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 9260
          mmTop = 10319
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object rpFichaFuncLbl8: TppLabel
          UserName = 'rpFichaFuncLbl8'
          Caption = 'Sexo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 48154
          mmTop = 1323
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object rpFichaFuncLbl9: TppLabel
          UserName = 'rpFichaFuncLbl9'
          Caption = 'Estado Civil:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 94456
          mmTop = 1323
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rpFichaFuncDBTxt9: TppDBText
          UserName = 'rpFichaFuncDBTxt9'
          AutoSize = True
          DataField = 'SEXO'
          DataPipeline = ppFichaFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppFichaFunc'
          mmHeight = 3260
          mmLeft = 57150
          mmTop = 1323
          mmWidth = 12742
          BandType = 3
          GroupNo = 0
        end
        object rpFichaFuncDBTxt10: TppDBText
          UserName = 'rpFichaFuncDBTxt10'
          AutoSize = True
          DataField = 'ESTCIVIL'
          DataPipeline = ppFichaFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppFichaFunc'
          mmHeight = 3260
          mmLeft = 113242
          mmTop = 1323
          mmWidth = 9610
          BandType = 3
          GroupNo = 0
        end
        object rpFichaFuncLine2: TppLine
          UserName = 'rpFichaFuncLine2'
          Pen.Width = 2
          Position = lpBottom
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 8467
          mmTop = 46302
          mmWidth = 180446
          BandType = 3
          GroupNo = 0
        end
        object rpFichaFuncLabel5: TppLabel
          UserName = 'rpFichaFuncLabel5'
          Caption = 'Profissão......:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 8731
          mmTop = 21960
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object rpFichaFuncDBText9: TppDBText
          UserName = 'rpFichaFuncDBText9'
          DataField = 'PROFISSAO'
          DataPipeline = ppFichaFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppFichaFunc'
          mmHeight = 3175
          mmLeft = 28310
          mmTop = 21960
          mmWidth = 64823
          BandType = 3
          GroupNo = 0
        end
        object rpFichaFuncLabel8: TppLabel
          UserName = 'rpFichaFuncLabel8'
          Caption = 'Grau Instr.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 96309
          mmTop = 22225
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rpFichaFuncDBText13: TppDBText
          UserName = 'rpFichaFuncDBText13'
          AutoSize = True
          DataField = 'GRINSTR'
          DataPipeline = ppFichaFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppFichaFunc'
          mmHeight = 3260
          mmLeft = 113242
          mmTop = 21960
          mmWidth = 42757
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label1'
          Caption = 'Naturalidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 8467
          mmTop = 29369
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'NATURALIDADE'
          DataPipeline = ppFichaFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppFichaFunc'
          mmHeight = 3260
          mmLeft = 28046
          mmTop = 29369
          mmWidth = 18330
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Nacionalidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 90752
          mmTop = 29369
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          AutoSize = True
          DataField = 'NACIONALIDADE'
          DataPipeline = ppFichaFunc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppFichaFunc'
          mmHeight = 3260
          mmLeft = 112977
          mmTop = 29369
          mmWidth = 11811
          BandType = 3
          GroupNo = 0
        end
        object ppRegiaoEstrangeiro: TppRegion
          UserName = 'RegiaoEstrangeiro'
          mmHeight = 18785
          mmLeft = 8467
          mmTop = 41804
          mmWidth = 180446
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel13: TppLabel
            UserName = 'Label13'
            Caption = 'Data Chegada:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 21167
            mmTop = 46831
            mmWidth = 19579
            BandType = 3
            GroupNo = 0
          end
          object ppDBText17: TppDBText
            UserName = 'DBText17'
            AutoSize = True
            DataField = 'ANOCHEGADA'
            DataPipeline = ppFichaFunc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'ppFichaFunc'
            mmHeight = 3260
            mmLeft = 42069
            mmTop = 46831
            mmWidth = 20151
            BandType = 3
            GroupNo = 0
          end
          object ppDBText20: TppDBText
            UserName = 'DBText20'
            AutoSize = True
            DataField = 'NATURALIZADO'
            DataPipeline = ppFichaFunc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'ppFichaFunc'
            mmHeight = 3260
            mmLeft = 141288
            mmTop = 46831
            mmWidth = 5165
            BandType = 3
            GroupNo = 0
          end
          object ppLabel15: TppLabel
            UserName = 'Label15'
            Caption = 'Carteira:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 20902
            mmTop = 51329
            mmWidth = 11642
            BandType = 3
            GroupNo = 0
          end
          object ppDBText21: TppDBText
            UserName = 'DBText21'
            AutoSize = True
            DataField = 'MOD19NUMERO'
            DataPipeline = ppFichaFunc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'ppFichaFunc'
            mmHeight = 3260
            mmLeft = 35190
            mmTop = 51329
            mmWidth = 22225
            BandType = 3
            GroupNo = 0
          end
          object ppLabel16: TppLabel
            UserName = 'Label16'
            Caption = 'Cônjuge Brasileiro:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 113506
            mmTop = 51065
            mmWidth = 25665
            BandType = 3
            GroupNo = 0
          end
          object ppDBText22: TppDBText
            UserName = 'DBText22'
            AutoSize = True
            DataField = 'CASADOBRASILEIRO'
            DataPipeline = ppFichaFunc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'ppFichaFunc'
            mmHeight = 3260
            mmLeft = 141288
            mmTop = 51329
            mmWidth = 5165
            BandType = 3
            GroupNo = 0
          end
          object ppLabel17: TppLabel
            UserName = 'Label17'
            Caption = 'Decreto:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 21167
            mmTop = 55563
            mmWidth = 11377
            BandType = 3
            GroupNo = 0
          end
          object ppDBText23: TppDBText
            UserName = 'DBText23'
            AutoSize = True
            DataField = 'DECRETONATURALIZACAO'
            DataPipeline = ppFichaFunc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'ppFichaFunc'
            mmHeight = 3260
            mmLeft = 35190
            mmTop = 55563
            mmWidth = 37380
            BandType = 3
            GroupNo = 0
          end
          object ppLabel19: TppLabel
            UserName = 'rpFichaFuncLbl101'
            Caption = 'Filhos Brasileiros:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 114829
            mmTop = 55563
            mmWidth = 24342
            BandType = 3
            GroupNo = 0
          end
          object ppDBText25: TppDBText
            UserName = 'DBText25'
            AutoSize = True
            DataField = 'FILHOSBRASILEIROS'
            DataPipeline = ppFichaFunc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'ppFichaFunc'
            mmHeight = 3260
            mmLeft = 141288
            mmTop = 55563
            mmWidth = 5165
            BandType = 3
            GroupNo = 0
          end
          object ppLabel20: TppLabel
            UserName = 'Label20'
            Caption = 'Naturalizado:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 121444
            mmTop = 46831
            mmWidth = 17727
            BandType = 3
            GroupNo = 0
          end
          object ppLabel21: TppLabel
            UserName = 'Label21'
            Caption = 'Reg.Geral:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 66675
            mmTop = 51329
            mmWidth = 14288
            BandType = 3
            GroupNo = 0
          end
          object ppDBText26: TppDBText
            UserName = 'DBText26'
            AutoSize = True
            DataField = 'MOD19REGISTRO'
            DataPipeline = ppFichaFunc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'ppFichaFunc'
            mmHeight = 3260
            mmLeft = 82286
            mmTop = 51329
            mmWidth = 24511
            BandType = 3
            GroupNo = 0
          end
          object ppLabel22: TppLabel
            UserName = 'Label22'
            Caption = 'Estrangeiro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 9790
            mmTop = 42333
            mmWidth = 15610
            BandType = 3
            GroupNo = 0
          end
        end
        object ppDBImage1: TppDBImage
          UserName = 'DBImage1'
          MaintainAspectRatio = False
          DataField = 'IMAGEM'
          DataPipeline = ppFichaFunc
          GraphicType = 'Bitmap'
          DataPipelineName = 'ppFichaFunc'
          mmHeight = 52652
          mmLeft = 135996
          mmTop = 529
          mmWidth = 41804
          BandType = 3
          GroupNo = 0
        end
      end
      object rpFichaFuncGrpFootBnd: TppGroupFooterBand
        BeforePrint = rpFichaFuncGrpFootBndBeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 51594
        mmPrintPosition = 0
        object rpFichaFuncSubReport1: TppSubReport
          UserName = 'rpFichaFuncSubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          TraverseAllData = False
          DataPipelineName = 'ppFichaFunc1'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 0
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpFichaFuncCR1: TppChildReport
            AutoStop = False
            DataPipeline = ppFichaFunc1
            PassSetting = psTwoPass
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 4350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297128
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppFichaFunc1'
            object rpFichaFuncSubReport1DtlBnd: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object rpFichaFuncSubReport1DBTxt1: TppDBText
                UserName = 'rpFichaFuncSubReport1DBTxt1'
                DataField = 'NOMEDOCUMENTO'
                DataPipeline = ppFichaFunc1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc1'
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 794
                mmWidth = 47625
                BandType = 4
              end
              object rpFichaFuncSubReport1DBTxt2: TppDBText
                OnPrint = rpFichaFuncSubReport1DBTxt2Print
                UserName = 'rpFichaFuncSubReport1DBTxt2'
                DataField = 'NUMDOCUMENTO'
                DataPipeline = ppFichaFunc1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc1'
                mmHeight = 3704
                mmLeft = 59267
                mmTop = 794
                mmWidth = 29104
                BandType = 4
              end
              object rpFichaFuncSubReport1DBTxt3: TppDBText
                UserName = 'rpFichaFuncSubReport1DBTxt3'
                DataField = 'ORGAO'
                DataPipeline = ppFichaFunc1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc1'
                mmHeight = 3704
                mmLeft = 90223
                mmTop = 794
                mmWidth = 25665
                BandType = 4
              end
              object rpFichaFuncSubReport1DBTxt4: TppDBText
                UserName = 'rpFichaFuncSubReport1DBTxt4'
                DataField = 'UF'
                DataPipeline = ppFichaFunc1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc1'
                mmHeight = 3704
                mmLeft = 118004
                mmTop = 794
                mmWidth = 9260
                BandType = 4
              end
              object rpFichaFuncSubReport1DBTxt5: TppDBText
                UserName = 'rpFichaFuncSubReport1DBTxt5'
                DataField = 'DATAEMISSAO'
                DataPipeline = ppFichaFunc1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc1'
                mmHeight = 3704
                mmLeft = 129382
                mmTop = 794
                mmWidth = 25135
                BandType = 4
              end
            end
            object rpFichaFuncGrp1: TppGroup
              BreakName = 'IDPESSOA'
              DataPipeline = ppFichaFunc1
              OutlineSettings.CreateNode = True
              UserName = 'rpFichaFuncGrp1'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppFichaFunc1'
              object rpFichaFuncSubReport1GrpHdrBnd: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 9790
                mmPrintPosition = 0
                object rpFichaFuncSubReport1Lbl1: TppLabel
                  UserName = 'rpFichaFuncSubReport1Lbl1'
                  AutoSize = False
                  Caption = 'Tipo de Documento'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 9260
                  mmTop = 5292
                  mmWidth = 47625
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport1Lbl2: TppLabel
                  UserName = 'rpFichaFuncSubReport1Lbl2'
                  AutoSize = False
                  Caption = 'Número'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 59267
                  mmTop = 5292
                  mmWidth = 29104
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport1Lbl3: TppLabel
                  UserName = 'rpFichaFuncSubReport1Lbl3'
                  AutoSize = False
                  Caption = 'Emissor'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 90223
                  mmTop = 5292
                  mmWidth = 25665
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport1Lbl4: TppLabel
                  UserName = 'rpFichaFuncSubReport1Lbl4'
                  AutoSize = False
                  Caption = 'UF'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 118004
                  mmTop = 5292
                  mmWidth = 9260
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport1Lbl5: TppLabel
                  UserName = 'rpFichaFuncSubReport1Lbl5'
                  AutoSize = False
                  Caption = 'Emissão'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 129382
                  mmTop = 5292
                  mmWidth = 25135
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel68: TppLabel
                  UserName = 'Label68'
                  Caption = 'DOCUMENTAÇÃO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 9260
                  mmTop = 1323
                  mmWidth = 24606
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpFichaFuncSubReport1GrpFootBnd: TppGroupFooterBand
                Visible = False
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
            object raCodeModule1: TraCodeModule
              ProgramStream = {00}
            end
          end
        end
        object rpFichaFuncSubReport2: TppSubReport
          UserName = 'rpFichaFuncSubReport2'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          ShiftRelativeTo = rpFichaFuncSubReport1
          TraverseAllData = False
          DataPipelineName = 'ppFichaFunc2'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 3969
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpFichaFuncCR2: TppChildReport
            AutoStop = False
            DataPipeline = ppFichaFunc2
            PassSetting = psTwoPass
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 4350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297128
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppFichaFunc2'
            object rpFichaFuncSubReport2DtlBnd: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 11113
              mmPrintPosition = 0
              object rpFichaFuncSubReport2DBTxt1: TppDBText
                UserName = 'rpFichaFuncSubReport2DBTxt1'
                DataField = 'EMPRESA'
                DataPipeline = ppFichaFunc2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc2'
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 794
                mmWidth = 57150
                BandType = 4
              end
              object rpFichaFuncSubReportDBTxt2: TppDBText
                UserName = 'rpFichaFuncSubReportDBTxt2'
                DataField = 'ULTSALARIO'
                DataPipeline = ppFichaFunc2
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppFichaFunc2'
                mmHeight = 3704
                mmLeft = 68263
                mmTop = 794
                mmWidth = 21960
                BandType = 4
              end
              object rpFichaFuncSubReport2DBTxt3: TppDBText
                UserName = 'rpFichaFuncSubReport2DBTxt3'
                DataField = 'DAT_ADMIS'
                DataPipeline = ppFichaFunc2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc2'
                mmHeight = 3704
                mmLeft = 93134
                mmTop = 794
                mmWidth = 18785
                BandType = 4
              end
              object rpFichaFuncSubReport2DBTxt4: TppDBText
                UserName = 'rpFichaFuncSubReport2DBTxt4'
                DataField = 'DATADEM'
                DataPipeline = ppFichaFunc2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc2'
                mmHeight = 3704
                mmLeft = 114829
                mmTop = 794
                mmWidth = 18785
                BandType = 4
              end
              object rpFichaFuncSubReport2DBTxt5: TppDBText
                UserName = 'rpFichaFuncSubReport2DBTxt5'
                DataField = 'MOTIVO'
                DataPipeline = ppFichaFunc2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc2'
                mmHeight = 3704
                mmLeft = 135996
                mmTop = 794
                mmWidth = 57150
                BandType = 4
              end
              object rpFichaFuncSubReport2DBTxt6: TppDBText
                UserName = 'rpFichaFuncSubReport2DBTxt6'
                DataField = 'CARGO'
                DataPipeline = ppFichaFunc2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc2'
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 5292
                mmWidth = 57150
                BandType = 4
              end
            end
            object rpFichaFuncGrp2: TppGroup
              BreakName = 'IDPESSOA'
              DataPipeline = ppFichaFunc2
              OutlineSettings.CreateNode = True
              UserName = 'rpFichaFuncGrp2'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppFichaFunc2'
              object rpFichaFuncSubReport2GrpHdrBnd: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 9790
                mmPrintPosition = 0
                object rpFichaFuncSubReport2Lbl1: TppLabel
                  UserName = 'rpFichaFuncSubReport2Lbl1'
                  AutoSize = False
                  Caption = 'Empresa / Cargo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 9260
                  mmTop = 5556
                  mmWidth = 57150
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport2Lbl2: TppLabel
                  UserName = 'rpFichaFuncSubReport2Lbl2'
                  AutoSize = False
                  Caption = 'Último Salário'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 68263
                  mmTop = 5556
                  mmWidth = 21960
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport2Lbl3: TppLabel
                  UserName = 'rpFichaFuncSubReport2Lbl3'
                  AutoSize = False
                  Caption = 'Admissão'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 93134
                  mmTop = 5556
                  mmWidth = 18785
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport2Lbl4: TppLabel
                  UserName = 'rpFichaFuncSubReport2Lbl4'
                  AutoSize = False
                  Caption = 'Demissão'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 114829
                  mmTop = 5556
                  mmWidth = 18785
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport2Lbl5: TppLabel
                  UserName = 'rpFichaFuncSubReport2Lbl5'
                  AutoSize = False
                  Caption = 'Motivo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 135996
                  mmTop = 5556
                  mmWidth = 57150
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel67: TppLabel
                  UserName = 'Label67'
                  Caption = 'EMPREGOS ANTERIORES'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 9260
                  mmTop = 1323
                  mmWidth = 35454
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpFichaFuncSubReport2GrpFootBnd: TppGroupFooterBand
                Visible = False
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
        object rpFichaFuncSubReport3: TppSubReport
          UserName = 'rpFichaFuncSubReport3'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          ShiftRelativeTo = rpFichaFuncSubReport2
          TraverseAllData = False
          DataPipelineName = 'ppFichaFunc3'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 7938
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpFichaFuncCR3: TppChildReport
            AutoStop = False
            DataPipeline = ppFichaFunc3
            PassSetting = psTwoPass
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 4350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297128
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppFichaFunc3'
            object rpFichaFuncSubReport3DtlBnd: TppDetailBand
              BeforePrint = rpFichaFuncSubReport3DtlBndBeforePrint
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 11377
              mmPrintPosition = 0
              object rpFichaFuncSubReport3DBTxt1: TppDBText
                UserName = 'rpFichaFuncSubReport3DBTxt1'
                DataField = 'DESCRICAO'
                DataPipeline = ppFichaFunc3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc3'
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 794
                mmWidth = 103188
                BandType = 4
              end
              object rpFichaFuncSubReport3DBTxt2: TppDBText
                UserName = 'rpFichaFuncSubReport3DBTxt2'
                DataField = 'DATREINI'
                DataPipeline = ppFichaFunc3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc3'
                mmHeight = 3704
                mmLeft = 116417
                mmTop = 794
                mmWidth = 15875
                BandType = 4
              end
              object rpFichaFuncSubReport3DBTxt3: TppDBText
                UserName = 'rpFichaFuncSubReport3DBTxt3'
                DataField = 'DATREFIM'
                DataPipeline = ppFichaFunc3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc3'
                mmHeight = 3704
                mmLeft = 134938
                mmTop = 794
                mmWidth = 14817
                BandType = 4
              end
              object rpFichaFuncSubReport3DBTxt4: TppDBText
                UserName = 'rpFichaFuncSubReport3DBTxt4'
                DataField = 'DUR_TOT'
                DataPipeline = ppFichaFunc3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppFichaFunc3'
                mmHeight = 3704
                mmLeft = 153459
                mmTop = 794
                mmWidth = 8467
                BandType = 4
              end
            end
            object rpFichaFuncGrp3: TppGroup
              BreakName = 'IDPESSOA'
              DataPipeline = ppFichaFunc3
              OutlineSettings.CreateNode = True
              UserName = 'rpFichaFuncGrp3'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppFichaFunc3'
              object rpFichaFuncSubReport3GrpHdrBnd: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 9525
                mmPrintPosition = 0
                object rpFichaFuncSubReport3Lbl1: TppLabel
                  UserName = 'rpFichaFuncSubReport3Lbl1'
                  AutoSize = False
                  Caption = 'Curso'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 9260
                  mmTop = 5556
                  mmWidth = 103188
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport3Lbl2: TppLabel
                  UserName = 'rpFichaFuncSubReport3Lbl2'
                  AutoSize = False
                  Caption = 'Início'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 116417
                  mmTop = 5556
                  mmWidth = 15875
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport3Lbl3: TppLabel
                  UserName = 'rpFichaFuncSubReport3Lbl3'
                  AutoSize = False
                  Caption = 'Final'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 134938
                  mmTop = 5556
                  mmWidth = 14817
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport3Lbl4: TppLabel
                  UserName = 'rpFichaFuncSubReport3Lbl4'
                  AutoSize = False
                  Caption = 'Horas'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 153459
                  mmTop = 5556
                  mmWidth = 8467
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel66: TppLabel
                  UserName = 'Label66'
                  Caption = 'HISTÓRICO DE TREINAMENTO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 9260
                  mmTop = 1588
                  mmWidth = 41540
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpFichaFuncSubReport3GrpFootBnd: TppGroupFooterBand
                Visible = False
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
        object rpFichaFuncSubReport4: TppSubReport
          UserName = 'rpFichaFuncSubReport4'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          ShiftRelativeTo = rpFichaFuncSubReport3
          TraverseAllData = False
          DataPipelineName = 'ppFichaFunc4'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 11906
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpFichaFuncCR4: TppChildReport
            AutoStop = False
            DataPipeline = ppFichaFunc4
            PassSetting = psTwoPass
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 4350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297128
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppFichaFunc4'
            object rpFichaFuncSubReport4DtlBnd: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object rpFichaFuncSubReportDBText1: TppDBText
                UserName = 'rpFichaFuncSubReportDBText1'
                DataField = 'DESCRICAO'
                DataPipeline = ppFichaFunc4
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc4'
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 794
                mmWidth = 115888
                BandType = 4
              end
              object rpFichaFuncSubReportDBText2: TppDBText
                UserName = 'rpFichaFuncSubReportDBText2'
                DataField = 'DAT_INI'
                DataPipeline = ppFichaFunc4
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc4'
                mmHeight = 3704
                mmLeft = 133086
                mmTop = 794
                mmWidth = 14817
                BandType = 4
              end
              object rpFichaFuncSubReportDBText3: TppDBText
                UserName = 'rpFichaFuncSubReportDBText3'
                DataField = 'DAT_FIM'
                DataPipeline = ppFichaFunc4
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc4'
                mmHeight = 3704
                mmLeft = 155311
                mmTop = 794
                mmWidth = 14817
                BandType = 4
              end
            end
            object rpFichaFuncGrp4: TppGroup
              BreakName = 'IDPESSOA'
              DataPipeline = ppFichaFunc4
              OutlineSettings.CreateNode = True
              UserName = 'rpFichaFuncGrp4'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppFichaFunc4'
              object rpFichaFuncSubReport4GrpHdrBnd: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 8996
                mmPrintPosition = 0
                object rpFichaFuncSubReport4Lbl1: TppLabel
                  UserName = 'rpFichaFuncSubReport4Lbl1'
                  AutoSize = False
                  Caption = 'Tipo de Experiência'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 9260
                  mmTop = 5027
                  mmWidth = 115888
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport4Lbl2: TppLabel
                  UserName = 'rpFichaFuncSubReport4Lbl2'
                  AutoSize = False
                  Caption = 'Início'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 133086
                  mmTop = 5027
                  mmWidth = 14817
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport4Lbl3: TppLabel
                  UserName = 'rpFichaFuncSubReport4Lbl3'
                  AutoSize = False
                  Caption = 'Final'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 155311
                  mmTop = 5027
                  mmWidth = 14817
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel65: TppLabel
                  UserName = 'Label65'
                  Caption = 'HISTÓRICO DE EXPERIÊNCIAS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 9260
                  mmTop = 1058
                  mmWidth = 41804
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpFichaFuncSubReport4GrpFootBnd: TppGroupFooterBand
                Visible = False
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
        object rpFichaFuncSubReport5: TppSubReport
          UserName = 'rpFichaFuncSubReport5'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          ShiftRelativeTo = rpFichaFuncSubReport4
          TraverseAllData = False
          DataPipelineName = 'ppFichaFunc5'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 15875
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpFichaFuncCR5: TppChildReport
            AutoStop = False
            DataPipeline = ppFichaFunc5
            PassSetting = psTwoPass
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 4350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297128
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppFichaFunc5'
            object rpFichaFuncSubReport5DtlBnd: TppDetailBand
              BeforePrint = rpFichaFuncSubReport5DtlBndBeforePrint
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 11113
              mmPrintPosition = 0
              object rpFichaFuncSubReport5DBTxt1: TppDBText
                UserName = 'rpFichaFuncSubReport5DBTxt1'
                DataField = 'DESCRTIPOAVAL'
                DataPipeline = ppFichaFunc5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc5'
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 794
                mmWidth = 93927
                BandType = 4
              end
              object rpFichaFuncSubReport5DBTxt2: TppDBText
                UserName = 'rpFichaFuncSubReport5DBTxt2'
                DataField = 'DATAREAL'
                DataPipeline = ppFichaFunc5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc5'
                mmHeight = 3704
                mmLeft = 119856
                mmTop = 794
                mmWidth = 14817
                BandType = 4
              end
              object rpFichaFuncSubReport5DBTxt3: TppDBText
                UserName = 'rpFichaFuncSubReport5DBTxt3'
                DataField = 'AVALIACAO'
                DataPipeline = ppFichaFunc5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppFichaFunc5'
                mmHeight = 3704
                mmLeft = 136261
                mmTop = 794
                mmWidth = 14817
                BandType = 4
              end
              object rpFichaFuncSubReport5DBMemo1: TppDBMemo
                UserName = 'rpFichaFuncSubReport5DBMemo1'
                CharWrap = False
                DataField = 'COMENT'
                DataPipeline = ppFichaFunc5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Stretch = True
                Transparent = True
                DataPipelineName = 'ppFichaFunc5'
                mmHeight = 4498
                mmLeft = 9260
                mmTop = 5556
                mmWidth = 167217
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
              object rpFichaFuncSubReport5DBTxt4: TppDBText
                UserName = 'rpFichaFuncSubReport5DBTxt4'
                DataField = 'AVALIADOR'
                DataPipeline = ppFichaFunc5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc5'
                mmHeight = 3704
                mmLeft = 153459
                mmTop = 794
                mmWidth = 34396
                BandType = 4
              end
            end
            object rpFichaFuncGrp5: TppGroup
              BreakName = 'IDPESSOA'
              DataPipeline = ppFichaFunc5
              OutlineSettings.CreateNode = True
              UserName = 'rpFichaFuncGrp5'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppFichaFunc5'
              object rpFichaFuncSubReport5GrpHdrBnd: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 9790
                mmPrintPosition = 0
                object rpFichaFuncSubReport5Lbl1: TppLabel
                  UserName = 'rpFichaFuncSubReport5Lbl1'
                  AutoSize = False
                  Caption = 'Teste, Entrevista, Avaliação'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 9260
                  mmTop = 5292
                  mmWidth = 93927
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport5Lbl2: TppLabel
                  UserName = 'rpFichaFuncSubReport5Lbl2'
                  AutoSize = False
                  Caption = 'Data'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 119856
                  mmTop = 5292
                  mmWidth = 14817
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport5Lbl3: TppLabel
                  UserName = 'rpFichaFuncSubReport5Lbl3'
                  AutoSize = False
                  Caption = 'Avaliação'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 136261
                  mmTop = 5292
                  mmWidth = 14817
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport5Lbl4: TppLabel
                  UserName = 'rpFichaFuncSubReport5Lbl4'
                  AutoSize = False
                  Caption = 'Avaliador'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 153459
                  mmTop = 5292
                  mmWidth = 34396
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel64: TppLabel
                  UserName = 'Label64'
                  Caption = 'HISTÓRICO DE AVALIAÇÕES'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 9260
                  mmTop = 1058
                  mmWidth = 39158
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpFichaFuncSubReport5GrpFootBnd: TppGroupFooterBand
                Visible = False
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
        object rpFichaFuncSubReport6: TppSubReport
          UserName = 'rpFichaFuncSubReport6'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          ShiftRelativeTo = rpFichaFuncSubReport5
          TraverseAllData = False
          DataPipelineName = 'ppFichaFunc6'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 19844
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpFichaFuncCR6: TppChildReport
            AutoStop = False
            DataPipeline = ppFichaFunc6
            PassSetting = psTwoPass
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 4350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297128
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppFichaFunc6'
            object rpFichaFuncSubReport6DtlBnd: TppDetailBand
              BeforePrint = rpFichaFuncSubReport6DtlBndBeforePrint
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 10848
              mmPrintPosition = 0
              object rpFichaFuncSubReport6DBTxt1: TppDBText
                UserName = 'rpFichaFuncSubReport6DBTxt1'
                DataField = 'DESCRTIPOOCMED'
                DataPipeline = ppFichaFunc6
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc6'
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 794
                mmWidth = 93927
                BandType = 4
              end
              object rpFichaFuncSubReport6DBTxt2: TppDBText
                UserName = 'rpFichaFuncSubReport6DBTxt2'
                DataField = 'DATAREAL'
                DataPipeline = ppFichaFunc6
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc6'
                mmHeight = 3704
                mmLeft = 156104
                mmTop = 794
                mmWidth = 14817
                BandType = 4
              end
              object rpFichaFuncSubReport6DBMemo1: TppDBMemo
                UserName = 'rpFichaFuncSubReport6DBMemo1'
                CharWrap = False
                DataField = 'OBSERVACAO'
                DataPipeline = ppFichaFunc6
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Stretch = True
                Transparent = True
                DataPipelineName = 'ppFichaFunc6'
                mmHeight = 4233
                mmLeft = 16404
                mmTop = 5556
                mmWidth = 167217
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
              object ppDBText57: TppDBText
                UserName = 'DBText57'
                DataField = 'LICENCA'
                DataPipeline = ppFichaFunc6
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppFichaFunc6'
                mmHeight = 3704
                mmLeft = 119063
                mmTop = 794
                mmWidth = 14817
                BandType = 4
              end
            end
            object rpFichaFuncGrp6: TppGroup
              BreakName = 'IDPESSOA'
              DataPipeline = ppFichaFunc6
              OutlineSettings.CreateNode = True
              UserName = 'rpFichaFuncGrp6'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppFichaFunc6'
              object rpFichaFuncSubReport6GrpHdrBnd: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 9525
                mmPrintPosition = 0
                object rpFichaFuncSubReport6Lbl1: TppLabel
                  UserName = 'rpFichaFuncSubReport6Lbl1'
                  AutoSize = False
                  Caption = 'Tipo de Ocorrência Médica'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 9260
                  mmTop = 5556
                  mmWidth = 93927
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport6Lbl2: TppLabel
                  UserName = 'rpFichaFuncSubReport6Lbl2'
                  AutoSize = False
                  Caption = 'Data'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 156104
                  mmTop = 5556
                  mmWidth = 14817
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel63: TppLabel
                  UserName = 'Label63'
                  Caption = 'EXAMES E OCORRÊNCIAS MÉDICAS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 9260
                  mmTop = 1323
                  mmWidth = 50006
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel70: TppLabel
                  UserName = 'Label70'
                  AutoSize = False
                  Caption = 'Qtde. Dias'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 119063
                  mmTop = 5556
                  mmWidth = 14817
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpFichaFuncSubReport6GrpFootBnd: TppGroupFooterBand
                Visible = False
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
        object rpFichaFuncSubReport7: TppSubReport
          UserName = 'rpFichaFuncSubReport7'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          ShiftRelativeTo = rpFichaFuncSubReport6
          TraverseAllData = False
          DataPipelineName = 'ppFichaFunc7'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 23813
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpFichaFuncCR7: TppChildReport
            AutoStop = False
            DataPipeline = ppFichaFunc7
            PassSetting = psTwoPass
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 4350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297128
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppFichaFunc7'
            object rpFichaFuncSubReport7DtlBnd: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object rpFichaFuncSubReport7DBTxt1: TppDBText
                UserName = 'rpFichaFuncSubReport7DBTxt1'
                DataField = 'DESCRICAO'
                DataPipeline = ppFichaFunc7
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc7'
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 794
                mmWidth = 51858
                BandType = 4
              end
              object rpFichaFuncSubReport7DBTxt2: TppDBText
                UserName = 'rpFichaFuncSubReport7DBTxt2'
                DataField = 'DATAALTERFUNC'
                DataPipeline = ppFichaFunc7
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc7'
                mmHeight = 3704
                mmLeft = 62971
                mmTop = 794
                mmWidth = 14817
                BandType = 4
              end
              object rpFichaFuncSubReport7DBTxt3: TppDBText
                UserName = 'rpFichaFuncSubReport7DBTxt3'
                DataField = 'TITULO'
                DataPipeline = ppFichaFunc7
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc7'
                mmHeight = 3704
                mmLeft = 79375
                mmTop = 794
                mmWidth = 32279
                BandType = 4
              end
              object rpFichaFuncSubReport7DBTxt4: TppDBText
                UserName = 'rpFichaFuncSubReport7DBTxt4'
                DataField = 'SALARIO'
                DataPipeline = ppFichaFunc7
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppFichaFunc7'
                mmHeight = 3704
                mmLeft = 146844
                mmTop = 794
                mmWidth = 19315
                BandType = 4
              end
              object rpFichaFuncSubReport7DBTxt5: TppDBText
                UserName = 'rpFichaFuncSubReport7DBTxt5'
                DataField = 'PERC_REAJ'
                DataPipeline = ppFichaFunc7
                DisplayFormat = '###,###,##0.00 %'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppFichaFunc7'
                mmHeight = 3704
                mmLeft = 170921
                mmTop = 794
                mmWidth = 15875
                BandType = 4
              end
              object ppDBText60: TppDBText
                UserName = 'DBText60'
                DataField = 'FUNCAO'
                DataPipeline = ppFichaFunc7
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppFichaFunc7'
                mmHeight = 3704
                mmLeft = 114829
                mmTop = 1058
                mmWidth = 29104
                BandType = 4
              end
            end
            object rpFichaFuncGrp7: TppGroup
              BreakName = 'IDPESSOA'
              DataPipeline = ppFichaFunc7
              OutlineSettings.CreateNode = True
              UserName = 'rpFichaFuncGrp7'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppFichaFunc7'
              object rpFichaFuncSubReport7GrpHdrBnd: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 9260
                mmPrintPosition = 0
                object rpFichaFuncSubReport7Lbl1: TppLabel
                  UserName = 'rpFichaFuncSubReport7Lbl1'
                  AutoSize = False
                  Caption = 'Tipo de Alteração Funcional'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 9260
                  mmTop = 5292
                  mmWidth = 51858
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport7Lbl2: TppLabel
                  UserName = 'rpFichaFuncSubReport7Lbl2'
                  AutoSize = False
                  Caption = 'Data'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 62971
                  mmTop = 5292
                  mmWidth = 14817
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport7Lbl3: TppLabel
                  UserName = 'rpFichaFuncSubReport7Lbl3'
                  AutoSize = False
                  Caption = 'Cargo Ocupado'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 79375
                  mmTop = 5292
                  mmWidth = 32279
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport7Lbl4: TppLabel
                  UserName = 'rpFichaFuncSubReport7Lbl4'
                  AutoSize = False
                  Caption = 'Salário'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 146844
                  mmTop = 5292
                  mmWidth = 19315
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport7Lbl5: TppLabel
                  UserName = 'rpFichaFuncSubReport7Lbl5'
                  AutoSize = False
                  Caption = 'Perc. Reaj.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 170921
                  mmTop = 5292
                  mmWidth = 15875
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel62: TppLabel
                  UserName = 'Label62'
                  Caption = 'EVOLUÇÃO FUNCIONAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 9525
                  mmTop = 1323
                  mmWidth = 33073
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel73: TppLabel
                  UserName = 'Label73'
                  AutoSize = False
                  Caption = 'Função'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 114565
                  mmTop = 5292
                  mmWidth = 29898
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpFichaFuncSubReport7FootBnd: TppGroupFooterBand
                Visible = False
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
        object rpFichaFuncSubReport8: TppSubReport
          UserName = 'rpFichaFuncSubReport8'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          ShiftRelativeTo = rpFichaFuncSubReport7
          TraverseAllData = False
          DataPipelineName = 'ppFichaFunc8'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 27781
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpFichaFuncCR8: TppChildReport
            AutoStop = False
            DataPipeline = ppFichaFunc8
            PassSetting = psTwoPass
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 4350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297128
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppFichaFunc8'
            object rpFichaFuncSubReport8DtlBnd: TppDetailBand
              BeforePrint = rpFichaFuncSubReport8DtlBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object rpFichaFuncSubReport8DBTxt1: TppDBText
                UserName = 'rpFichaFuncSubReport8DBTxt1'
                DataField = 'DESCRICAO'
                DataPipeline = ppFichaFunc8
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc8'
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 794
                mmWidth = 89959
                BandType = 4
              end
              object rpFichaFuncSubReport8DBTxt2: TppDBText
                UserName = 'rpFichaFuncSubReport8DBTxt2'
                DataField = 'ANOMESINICIO'
                DataPipeline = ppFichaFunc8
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc8'
                mmHeight = 3704
                mmLeft = 104246
                mmTop = 794
                mmWidth = 14817
                BandType = 4
              end
              object rpFichaFuncSubReport8DBTxt3: TppDBText
                UserName = 'rpFichaFuncSubReport8DBTxt3'
                DataField = 'PARCELAS'
                DataPipeline = ppFichaFunc8
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppFichaFunc8'
                mmHeight = 3704
                mmLeft = 124354
                mmTop = 794
                mmWidth = 12435
                BandType = 4
              end
              object rpFichaFuncSubReport8Lbl5: TppLabel
                UserName = 'rpFichaFuncSubReport8Lbl5'
                AutoSize = False
                Caption = 'rpFichaFuncSubReport8Lbl5'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 142082
                mmTop = 794
                mmWidth = 28310
                BandType = 4
              end
            end
            object rpFichaFuncGrp8: TppGroup
              BreakName = 'IDPESSOA'
              DataPipeline = ppFichaFunc8
              OutlineSettings.CreateNode = True
              UserName = 'rpFichaFuncGrp8'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppFichaFunc8'
              object rpFichaFuncSubReport8GrpHdrBnd: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 8996
                mmPrintPosition = 0
                object rpFichaFuncSubReport8Lbl1: TppLabel
                  UserName = 'rpFichaFuncSubReport8Lbl1'
                  AutoSize = False
                  Caption = 'Tipo de Benefício'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 9260
                  mmTop = 5027
                  mmWidth = 89959
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport8Lbl2: TppLabel
                  UserName = 'rpFichaFuncSubReport8Lbl2'
                  AutoSize = False
                  Caption = 'Data Início'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 104246
                  mmTop = 5027
                  mmWidth = 14817
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport8Lbl3: TppLabel
                  UserName = 'rpFichaFuncSubReport8Lbl3'
                  AutoSize = False
                  Caption = 'Parcelas'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 124354
                  mmTop = 5027
                  mmWidth = 12435
                  BandType = 3
                  GroupNo = 0
                end
                object rpFichaFuncSubReport8Lbl4: TppLabel
                  UserName = 'rpFichaFuncSubReport8Lbl4'
                  AutoSize = False
                  Caption = 'Valor do Benefício'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 142082
                  mmTop = 5027
                  mmWidth = 28310
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel61: TppLabel
                  UserName = 'Label61'
                  Caption = 'BENEFÍCIOS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 9260
                  mmTop = 1058
                  mmWidth = 17198
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpFichaFuncSubReport8GrpFootBnd: TppGroupFooterBand
                Visible = False
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
        object rpFichaFuncSubReport9: TppSubReport
          UserName = 'rpFichaFuncSubReport9'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          ShiftRelativeTo = rpFichaFuncSubReport8
          TraverseAllData = False
          DataPipelineName = 'ppFichaFunc9'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 31750
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpFichaFuncCR9: TppChildReport
            AutoStop = False
            DataPipeline = ppFichaFunc9
            PassSetting = psTwoPass
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 4350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297128
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppFichaFunc9'
            object rpFichaFuncSubReport9DtlBnd: TppDetailBand
              BeforePrint = rpFichaFuncSubReport5DtlBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object ppDBText33: TppDBText
                UserName = 'rpFichaFuncSubReport5DBTxt1'
                DataField = 'INIPERIODOFERIAS'
                DataPipeline = ppFichaFunc9
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc9'
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 529
                mmWidth = 15346
                BandType = 4
              end
              object ppDBText34: TppDBText
                UserName = 'rpFichaFuncSubReport5DBTxt2'
                DataField = 'INIGOZOFERIAS'
                DataPipeline = ppFichaFunc9
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc9'
                mmHeight = 3704
                mmLeft = 72231
                mmTop = 529
                mmWidth = 15346
                BandType = 4
              end
              object ppDBText35: TppDBText
                UserName = 'rpFichaFuncSubReport5DBTxt3'
                DataField = 'ABONO'
                DataPipeline = ppFichaFunc9
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppFichaFunc9'
                mmHeight = 3704
                mmLeft = 166688
                mmTop = 529
                mmWidth = 11906
                BandType = 4
              end
              object ppDBText49: TppDBText
                UserName = 'DBText49'
                DataField = 'FIMPERIODOFERIAS'
                DataPipeline = ppFichaFunc9
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc9'
                mmHeight = 3704
                mmLeft = 25400
                mmTop = 529
                mmWidth = 15346
                BandType = 4
              end
              object ppDBText50: TppDBText
                UserName = 'DBText50'
                DataField = 'FIMGOZOFERIAS'
                DataPipeline = ppFichaFunc9
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc9'
                mmHeight = 3704
                mmLeft = 89959
                mmTop = 529
                mmWidth = 15346
                BandType = 4
              end
              object ppDBText36: TppDBText
                UserName = 'DBText36'
                AutoSize = True
                DataField = 'DIASFERIAS'
                DataPipeline = ppFichaFunc9
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppFichaFunc9'
                mmHeight = 3260
                mmLeft = 116550
                mmTop = 794
                mmWidth = 16933
                BandType = 4
              end
              object ppDBText58: TppDBText
                UserName = 'DBText58'
                AutoSize = True
                DataField = 'DIASABONO'
                DataPipeline = ppFichaFunc9
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppFichaFunc9'
                mmHeight = 3260
                mmLeft = 140383
                mmTop = 794
                mmWidth = 16891
                BandType = 4
              end
            end
            object rpFichaFuncGrp9: TppGroup
              BreakName = 'IDPESSOA'
              DataPipeline = ppFichaFunc9
              OutlineSettings.CreateNode = True
              UserName = 'rpFichaFuncGrp9'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppFichaFunc9'
              object rpFichaFuncSubReport9GrpHdrBnd: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 8996
                mmPrintPosition = 0
                object ppLabel30: TppLabel
                  UserName = 'rpFichaFuncSubReport5Lbl1'
                  AutoSize = False
                  Caption = 'Período Aqusitivo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 9260
                  mmTop = 5027
                  mmWidth = 33867
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel32: TppLabel
                  UserName = 'rpFichaFuncSubReport5Lbl2'
                  AutoSize = False
                  Caption = 'Período de Gozo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 72231
                  mmTop = 5027
                  mmWidth = 35983
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel34: TppLabel
                  UserName = 'rpFichaFuncSubReport5Lbl3'
                  AutoSize = False
                  Caption = 'Abono'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 166688
                  mmTop = 5027
                  mmWidth = 11906
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel60: TppLabel
                  UserName = 'Label60'
                  Caption = 'FÉRIAS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 9260
                  mmTop = 794
                  mmWidth = 10054
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel35: TppLabel
                  UserName = 'Label35'
                  Caption = 'Dias Férias'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 119063
                  mmTop = 5027
                  mmWidth = 15346
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel71: TppLabel
                  UserName = 'Label71'
                  Caption = 'Dias Abono'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 142875
                  mmTop = 5027
                  mmWidth = 18256
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpFichaFuncSubReport9GrpFootBnd: TppGroupFooterBand
                Visible = False
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
        object rpFichaFuncSubReport10: TppSubReport
          UserName = 'rpFichaFuncSubReport10'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          ShiftRelativeTo = rpFichaFuncSubReport9
          TraverseAllData = False
          DataPipelineName = 'ppFichaFunc10'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 35719
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpFichaFuncCR10: TppChildReport
            AutoStop = False
            DataPipeline = ppFichaFunc10
            PassSetting = psTwoPass
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 4350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297128
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppFichaFunc10'
            object rpFichaFuncSubReport10DtlBnd: TppDetailBand
              BeforePrint = rpFichaFuncSubReport6DtlBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object ppDBText37: TppDBText
                UserName = 'rpFichaFuncSubReport6DBTxt1'
                DataField = 'NOME'
                DataPipeline = ppFichaFunc10
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc10'
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 794
                mmWidth = 70644
                BandType = 4
              end
              object ppDBText38: TppDBText
                UserName = 'rpFichaFuncSubReport6DBTxt2'
                DataField = 'DATANASC'
                DataPipeline = ppFichaFunc10
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppFichaFunc10'
                mmHeight = 3704
                mmLeft = 100013
                mmTop = 794
                mmWidth = 21431
                BandType = 4
              end
              object ppDBText39: TppDBText
                UserName = 'rpFichaFuncSubReport6DBTxt3'
                DataField = 'ESTCIVIL'
                DataPipeline = ppFichaFunc10
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc10'
                mmHeight = 3704
                mmLeft = 124354
                mmTop = 794
                mmWidth = 26458
                BandType = 4
              end
              object ppDBText40: TppDBText
                UserName = 'rpFichaFuncSubReport6DBTxt4'
                AutoSize = True
                DataField = 'PARENTESCO'
                DataPipeline = ppFichaFunc10
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc10'
                mmHeight = 3175
                mmLeft = 153459
                mmTop = 794
                mmWidth = 40746
                BandType = 4
              end
              object ppDBText51: TppDBText
                UserName = 'DBText51'
                DataField = 'SEXO'
                DataPipeline = ppFichaFunc10
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppFichaFunc10'
                mmHeight = 3704
                mmLeft = 84667
                mmTop = 794
                mmWidth = 12700
                BandType = 4
              end
            end
            object rpFichaFuncGrp10: TppGroup
              BreakName = 'IDTITULAR'
              DataPipeline = ppFichaFunc10
              OutlineSettings.CreateNode = True
              UserName = 'rpFichaFuncGrp10'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppFichaFunc10'
              object rpFichaFuncSubReport10GrpHdrBnd: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 9790
                mmPrintPosition = 0
                object ppLabel36: TppLabel
                  UserName = 'rpFichaFuncSubReport6Lbl1'
                  AutoSize = False
                  Caption = 'Nome do Dependente'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 9260
                  mmTop = 5556
                  mmWidth = 70644
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel37: TppLabel
                  UserName = 'rpFichaFuncSubReport6Lbl2'
                  AutoSize = False
                  Caption = 'Nascimento'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 100013
                  mmTop = 5556
                  mmWidth = 21431
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel38: TppLabel
                  UserName = 'rpFichaFuncSubReport6Lbl3'
                  AutoSize = False
                  Caption = 'Est.Civil'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 124354
                  mmTop = 5556
                  mmWidth = 26458
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel39: TppLabel
                  UserName = 'rpFichaFuncSubReport6Lbl4'
                  AutoSize = False
                  Caption = 'Parentesco'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 153459
                  mmTop = 5556
                  mmWidth = 40481
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel50: TppLabel
                  UserName = 'Label50'
                  AutoSize = False
                  Caption = 'Sexo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 84667
                  mmTop = 5556
                  mmWidth = 12700
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel59: TppLabel
                  UserName = 'Label59'
                  Caption = 'DEPENDENTES'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 9260
                  mmTop = 1588
                  mmWidth = 21431
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpFichaFuncSubReport10GrpFootBnd: TppGroupFooterBand
                Visible = False
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
        object rpFichaFuncSubReport11: TppSubReport
          UserName = 'rpFichaFuncSubReport11'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          ShiftRelativeTo = rpFichaFuncSubReport10
          TraverseAllData = False
          DataPipelineName = 'ppFichaFunc11'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 39688
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpFichaFuncCR11: TppChildReport
            AutoStop = False
            DataPipeline = ppFichaFunc11
            PassSetting = psTwoPass
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 4350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297128
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppFichaFunc11'
            object rpFichaFuncSubReport11DtlBnd: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object ppDBText41: TppDBText
                UserName = 'rpFichaFuncSubReport7DBTxt1'
                DataField = 'MES'
                DataPipeline = ppFichaFunc11
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppFichaFunc11'
                mmHeight = 3969
                mmLeft = 9260
                mmTop = 794
                mmWidth = 38365
                BandType = 4
              end
              object ppDBText43: TppDBText
                UserName = 'rpFichaFuncSubReport7DBTxt3'
                DataField = 'NOME'
                DataPipeline = ppFichaFunc11
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc11'
                mmHeight = 3704
                mmLeft = 50006
                mmTop = 794
                mmWidth = 110861
                BandType = 4
              end
              object ppDBText44: TppDBText
                UserName = 'rpFichaFuncSubReport7DBTxt4'
                DataField = 'VALORPROVENTO'
                DataPipeline = ppFichaFunc11
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppFichaFunc11'
                mmHeight = 3704
                mmLeft = 163777
                mmTop = 794
                mmWidth = 21696
                BandType = 4
              end
            end
            object rpFichaFuncGrp11: TppGroup
              BreakName = 'IDPESSOA'
              DataPipeline = ppFichaFunc11
              OutlineSettings.CreateNode = True
              UserName = 'rpFichaFuncGrp11'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppFichaFunc11'
              object rpFichaFuncSubReport11GrpHdrBnd: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 8202
                mmPrintPosition = 0
                object ppLabel40: TppLabel
                  UserName = 'rpFichaFuncSubReport7Lbl1'
                  AutoSize = False
                  Caption = 'Ano/Mês da Contribuição'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 9260
                  mmTop = 4233
                  mmWidth = 38365
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel42: TppLabel
                  UserName = 'rpFichaFuncSubReport7Lbl3'
                  AutoSize = False
                  Caption = 'Sindicato'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 50006
                  mmTop = 4233
                  mmWidth = 110861
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel43: TppLabel
                  UserName = 'rpFichaFuncSubReport7Lbl4'
                  AutoSize = False
                  Caption = 'Valor'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 163777
                  mmTop = 4233
                  mmWidth = 21696
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel58: TppLabel
                  UserName = 'Label58'
                  Caption = 'CONTRIBUIÇÃO SINDICAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 9260
                  mmTop = 265
                  mmWidth = 35719
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpFichaFuncSubReport11GrpFootBnd: TppGroupFooterBand
                Visible = False
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
        object rpFichaFuncSubReport12: TppSubReport
          UserName = 'rpFichaFuncSubReport12'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          ShiftRelativeTo = rpFichaFuncSubReport11
          TraverseAllData = False
          DataPipelineName = 'ppFichaFunc12'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 43656
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpFichaFuncCR12: TppChildReport
            AutoStop = False
            DataPipeline = ppFichaFunc12
            PassSetting = psTwoPass
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 4350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297128
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppFichaFunc12'
            object rpFichaFuncSubReport12DtlBnd: TppDetailBand
              BeforePrint = rpFichaFuncSubReport8DtlBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object ppDBText46: TppDBText
                UserName = 'rpFichaFuncSubReport8DBTxt1'
                DataField = 'SITUACAO'
                DataPipeline = ppFichaFunc12
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc12'
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 794
                mmWidth = 89959
                BandType = 4
              end
              object ppDBText47: TppDBText
                UserName = 'rpFichaFuncSubReport8DBTxt2'
                DataField = 'DATASITFUNC'
                DataPipeline = ppFichaFunc12
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppFichaFunc12'
                mmHeight = 3704
                mmLeft = 101071
                mmTop = 794
                mmWidth = 19844
                BandType = 4
              end
              object ppDBText48: TppDBText
                UserName = 'rpFichaFuncSubReport8DBTxt3'
                DataField = 'MOTIVO'
                DataPipeline = ppFichaFunc12
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppFichaFunc12'
                mmHeight = 3704
                mmLeft = 122767
                mmTop = 794
                mmWidth = 69056
                BandType = 4
              end
            end
            object rpFichaFuncGrp12: TppGroup
              BreakName = 'IDPESSOA'
              DataPipeline = ppFichaFunc12
              OutlineSettings.CreateNode = True
              UserName = 'rpFichaFuncGrp12'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppFichaFunc12'
              object rpFichaFuncSubReport12GrpHdrBnd: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 9525
                mmPrintPosition = 0
                object ppLabel45: TppLabel
                  UserName = 'rpFichaFuncSubReport8Lbl1'
                  AutoSize = False
                  Caption = 'Situação'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 9260
                  mmTop = 5027
                  mmWidth = 89959
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel46: TppLabel
                  UserName = 'rpFichaFuncSubReport8Lbl2'
                  AutoSize = False
                  Caption = 'Data Início'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 101071
                  mmTop = 5027
                  mmWidth = 19844
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel47: TppLabel
                  UserName = 'rpFichaFuncSubReport8Lbl3'
                  AutoSize = False
                  Caption = 'Motivo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 122767
                  mmTop = 5027
                  mmWidth = 69056
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel57: TppLabel
                  UserName = 'Label57'
                  Caption = 'ALTERAÇÕES NA SITUAÇÃO FUNCIONAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 9260
                  mmTop = 794
                  mmWidth = 56356
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpFichaFuncSubReport12GrpFootBnd: TppGroupFooterBand
                Visible = False
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
        object rpFichaFuncSubReport13: TppSubReport
          UserName = 'rpFichaFuncSubReport13'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          ShiftRelativeTo = rpFichaFuncSubReport12
          TraverseAllData = False
          DataPipelineName = 'ppFichaFunc13'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 47625
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppFichaFunc13
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 4350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297128
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Left = 280
            Top = 168
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppFichaFunc13'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 22490
              mmPrintPosition = 0
              object ppDBText1: TppDBText
                UserName = 'DBText1'
                DataField = 'IDADE'
                DataPipeline = ppFichaFunc13
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 32544
                mmTop = 6350
                mmWidth = 42863
                BandType = 1
              end
              object ppLabel1: TppLabel
                UserName = 'Label1'
                Caption = 'Idade:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 9260
                mmTop = 6350
                mmWidth = 7673
                BandType = 1
              end
              object ppLabel2: TppLabel
                UserName = 'Label2'
                Caption = 'Tempo de Casa:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 97896
                mmTop = 6350
                mmWidth = 20638
                BandType = 1
              end
              object ppDBText2: TppDBText
                UserName = 'DBText2'
                DataField = 'TEMPOCASA'
                DataPipeline = ppFichaFunc13
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 129117
                mmTop = 6350
                mmWidth = 58473
                BandType = 1
              end
              object ppLabel4: TppLabel
                UserName = 'Label4'
                Caption = 'Tempo no Cargo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 9260
                mmTop = 11906
                mmWidth = 21696
                BandType = 1
              end
              object ppDBText3: TppDBText
                UserName = 'DBText3'
                DataField = 'TEMPOCASA'
                DataPipeline = ppFichaFunc13
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 32544
                mmTop = 11906
                mmWidth = 58473
                BandType = 1
              end
              object ppLabel5: TppLabel
                UserName = 'Label5'
                Caption = 'Tempo na Lotação:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 97896
                mmTop = 11906
                mmWidth = 24077
                BandType = 1
              end
              object ppDBText8: TppDBText
                UserName = 'DBText8'
                DataField = 'TEMPOCASA'
                DataPipeline = ppFichaFunc13
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 129117
                mmTop = 11906
                mmWidth = 58473
                BandType = 1
              end
              object ppDBText9: TppDBText
                UserName = 'DBText9'
                DataField = 'VIGENCIA'
                DataPipeline = ppFichaFunc13
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 108479
                mmTop = 17463
                mmWidth = 24606
                BandType = 1
              end
              object ppLabel7: TppLabel
                UserName = 'Label3'
                Caption = 'Mes Referência da Remuneração:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 64294
                mmTop = 17463
                mmWidth = 42333
                BandType = 1
              end
              object ppLabel10: TppLabel
                UserName = 'Label10'
                Caption = 'Categoria da Remuneração'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3440
                mmLeft = 9260
                mmTop = 19050
                mmWidth = 36248
                BandType = 1
              end
              object ppLabel14: TppLabel
                UserName = 'Label14'
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3440
                mmLeft = 179388
                mmTop = 19050
                mmWidth = 7144
                BandType = 1
              end
              object ppLabel18: TppLabel
                UserName = 'Label18'
                Caption = 'AVALIAÇÃO HAY'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3440
                mmLeft = 9260
                mmTop = 1323
                mmWidth = 22754
                BandType = 1
              end
            end
            object ppDetailBand1: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3175
              mmPrintPosition = 0
              object ppDBText11: TppDBText
                UserName = 'DBText11'
                DataField = 'CATEGORIAREM'
                DataPipeline = ppFichaFunc13
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 9260
                mmTop = 0
                mmWidth = 143934
                BandType = 4
              end
              object ppDBText19: TppDBText
                UserName = 'DBText19'
                DataField = 'VALORREM'
                DataPipeline = ppFichaFunc13
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 165365
                mmTop = 0
                mmWidth = 21167
                BandType = 4
              end
            end
            object ppSummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 30956
              mmPrintPosition = 0
              object ppDBCalc1: TppDBCalc
                UserName = 'DBCalc1'
                DataField = 'VALORREM'
                DataPipeline = ppFichaFunc13
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 165365
                mmTop = 1058
                mmWidth = 21167
                BandType = 7
              end
              object ppLabel44: TppLabel
                UserName = 'Label44'
                Caption = 'Grupo Funcional:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 9260
                mmTop = 6879
                mmWidth = 20902
                BandType = 7
              end
              object ppDBText24: TppDBText
                UserName = 'DBText24'
                DataField = 'GRUPOFUNCIONAL'
                DataPipeline = ppFichaFunc13
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 32279
                mmTop = 6879
                mmWidth = 63236
                BandType = 7
              end
              object ppLabel48: TppLabel
                UserName = 'Label48'
                Caption = 'Data Ult. Alteração:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 97896
                mmTop = 6879
                mmWidth = 24077
                BandType = 7
              end
              object ppDBText27: TppDBText
                UserName = 'DBText27'
                DataField = 'DATAULTIMAALTERACAO'
                DataPipeline = ppFichaFunc13
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 129117
                mmTop = 6879
                mmWidth = 39952
                BandType = 7
              end
              object ppLabel49: TppLabel
                UserName = 'Label49'
                Caption = 'Pontos Hay:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 9260
                mmTop = 11906
                mmWidth = 15081
                BandType = 7
              end
              object ppDBText42: TppDBText
                UserName = 'DBText42'
                DataField = 'PONTOSHAY'
                DataPipeline = ppFichaFunc13
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 32015
                mmTop = 11906
                mmWidth = 13229
                BandType = 7
              end
              object ppLabel51: TppLabel
                UserName = 'Label51'
                Caption = 'Valor Hay:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 78052
                mmTop = 11906
                mmWidth = 12965
                BandType = 7
              end
              object ppDBText45: TppDBText
                UserName = 'DBText45'
                DataField = 'PONTOSHAY'
                DataPipeline = ppFichaFunc13
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 97367
                mmTop = 11906
                mmWidth = 29104
                BandType = 7
              end
              object ppLabel52: TppLabel
                UserName = 'Label52'
                Caption = 'IP:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 152400
                mmTop = 11906
                mmWidth = 3440
                BandType = 7
              end
              object ppDBText52: TppDBText
                UserName = 'DBText52'
                DataField = 'IP'
                DataPipeline = ppFichaFunc13
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 158486
                mmTop = 11906
                mmWidth = 29104
                BandType = 7
              end
              object ppLabel53: TppLabel
                UserName = 'Label53'
                Caption = 'Salário Atual:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 9260
                mmTop = 17727
                mmWidth = 16404
                BandType = 7
              end
              object ppDBText53: TppDBText
                UserName = 'DBText53'
                DataField = 'SALARIOATUAL'
                DataPipeline = ppFichaFunc13
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 32015
                mmTop = 17727
                mmWidth = 29104
                BandType = 7
              end
              object ppLabel54: TppLabel
                UserName = 'Label54'
                Caption = 'Salário Anterior:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 9260
                mmTop = 23283
                mmWidth = 19844
                BandType = 7
              end
              object ppDBText54: TppDBText
                UserName = 'DBText54'
                DataField = 'SALARIOANTERIOR'
                DataPipeline = ppFichaFunc13
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 32015
                mmTop = 23283
                mmWidth = 29104
                BandType = 7
              end
              object ppLabel55: TppLabel
                UserName = 'Label55'
                Caption = 'Cargo Atual:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 68792
                mmTop = 17727
                mmWidth = 15346
                BandType = 7
              end
              object ppDBText55: TppDBText
                UserName = 'DBText55'
                DataField = 'CARGOATUAL'
                DataPipeline = ppFichaFunc13
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 97102
                mmTop = 17727
                mmWidth = 91017
                BandType = 7
              end
              object ppLabel56: TppLabel
                UserName = 'Label56'
                Caption = 'Cargo Anterior:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 68792
                mmTop = 23283
                mmWidth = 18785
                BandType = 7
              end
              object ppDBText56: TppDBText
                UserName = 'DBText56'
                DataField = 'CARGOANTERIOR'
                DataPipeline = ppFichaFunc13
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppFichaFunc13'
                mmHeight = 3175
                mmLeft = 97102
                mmTop = 23283
                mmWidth = 91017
                BandType = 7
              end
              object ppLine6: TppLine
                UserName = 'Line2'
                Weight = 0.75
                mmHeight = 529
                mmLeft = 165365
                mmTop = 265
                mmWidth = 21167
                BandType = 7
              end
              object ppLabel69: TppLabel
                UserName = 'Label69'
                Caption = 'Remuneração Total:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 134673
                mmTop = 1058
                mmWidth = 26723
                BandType = 7
              end
            end
          end
        end
        object rpFichaFuncSubReport14: TppSubReport
          UserName = 'rpFichaFuncSubReport14'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          ShiftRelativeTo = rpFichaFuncSubReport12
          TraverseAllData = False
          DataPipelineName = 'ppFichaFunc14'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 51329
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpFichaFuncCR14: TppChildReport
            AutoStop = False
            DataPipeline = ppFichaFunc14
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 4350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297128
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Left = 408
            Top = 184
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppFichaFunc14'
            object rpFichaFuncSubReport14DtlBnd: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 3969
              mmPrintPosition = 0
              object ppDBText62: TppDBText
                UserName = 'DBText601'
                DataField = 'DATAADVSUSP'
                DataPipeline = ppFichaFunc14
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppFichaFunc14'
                mmHeight = 3704
                mmLeft = 70379
                mmTop = 265
                mmWidth = 23813
                BandType = 4
              end
              object ppDBText61: TppDBText
                UserName = 'DBText61'
                DataField = 'MOTIVO'
                DataPipeline = ppFichaFunc14
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                Visible = False
                WordWrap = True
                DataPipelineName = 'ppFichaFunc14'
                mmHeight = 3175
                mmLeft = 98954
                mmTop = 265
                mmWidth = 68792
                BandType = 4
              end
              object ppDBText63: TppDBText
                UserName = 'DBText63'
                DataField = 'DATAATO'
                DataPipeline = ppFichaFunc14
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppFichaFunc14'
                mmHeight = 3704
                mmLeft = 41540
                mmTop = 265
                mmWidth = 20902
                BandType = 4
              end
              object ppDBText64: TppDBText
                UserName = 'DBText64'
                DataField = 'TIPO'
                DataPipeline = ppFichaFunc14
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppFichaFunc14'
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 0
                mmWidth = 20902
                BandType = 4
              end
              object ppDBMemo1: TppDBMemo
                UserName = 'DBMemo1'
                CharWrap = False
                DataField = 'MOTIVO'
                DataPipeline = ppFichaFunc14
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Stretch = True
                Transparent = True
                DataPipelineName = 'ppFichaFunc14'
                mmHeight = 3440
                mmLeft = 98954
                mmTop = 265
                mmWidth = 84138
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
            end
            object ppGroup2: TppGroup
              BreakName = 'IDPESSOA'
              DataPipeline = ppFichaFunc14
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group2'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppFichaFunc14'
              object ppGroupHeaderBand1: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 11906
                mmPrintPosition = 0
                object ppLabel74: TppLabel
                  UserName = 'Label74'
                  AutoSize = False
                  Caption = 'Data Ato'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 41804
                  mmTop = 5556
                  mmWidth = 19844
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel75: TppLabel
                  UserName = 'Label75'
                  AutoSize = False
                  Caption = 'Motivo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3387
                  mmLeft = 98954
                  mmTop = 5821
                  mmWidth = 69056
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel76: TppLabel
                  UserName = 'Label76'
                  AutoSize = False
                  Caption = 'Data Adv/ Susp.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 70644
                  mmTop = 5556
                  mmWidth = 23813
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel77: TppLabel
                  UserName = 'Label77'
                  AutoSize = False
                  Caption = 'Tipo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 9260
                  mmTop = 5556
                  mmWidth = 19844
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel78: TppLabel
                  UserName = 'Label78'
                  AutoSize = False
                  Caption = 'ADVERTÊNCIAS OU SUSPENSÕES'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsUnderline]
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 9260
                  mmTop = 794
                  mmWidth = 48683
                  BandType = 3
                  GroupNo = 0
                end
              end
              object ppGroupFooterBand1: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
            object raCodeModule2: TraCodeModule
              ProgramStream = {00}
            end
          end
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppFichaFunc: TppBDEPipeline
    DataSource = dsFichaFunc
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ppFichaFunc'
    Left = 279
    Top = 5
    object ppFichaFuncppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 43
      DisplayWidth = 43
      Position = 0
    end
    object ppFichaFuncppField2: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFichaFuncppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFichaFuncppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMAGEM'
      FieldName = 'IDIMAGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppFichaFuncppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppFichaFuncppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'NIVELINDIV1'
      FieldName = 'NIVELINDIV1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppFichaFuncppField7: TppField
      FieldAlias = 'CNPJ'
      FieldName = 'CNPJ'
      FieldLength = 18
      DisplayWidth = 18
      Position = 6
    end
    object ppFichaFuncppField8: TppField
      FieldAlias = 'CNAE'
      FieldName = 'CNAE'
      FieldLength = 81
      DisplayWidth = 81
      Position = 7
    end
    object ppFichaFuncppField9: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 8
    end
    object ppFichaFuncppField10: TppField
      FieldAlias = 'NACIONALIDADE'
      FieldName = 'NACIONALIDADE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 9
    end
    object ppFichaFuncppField11: TppField
      FieldAlias = 'NATURALIDADE'
      FieldName = 'NATURALIDADE'
      FieldLength = 54
      DisplayWidth = 54
      Position = 10
    end
    object ppFichaFuncppField12: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object ppFichaFuncppField13: TppField
      FieldAlias = 'NOMEPAI'
      FieldName = 'NOMEPAI'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
    object ppFichaFuncppField14: TppField
      FieldAlias = 'NOMEMAE'
      FieldName = 'NOMEMAE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 13
    end
    object ppFichaFuncppField15: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
    object ppFichaFuncppField16: TppField
      FieldAlias = 'TIPOSIT'
      FieldName = 'TIPOSIT'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object ppFichaFuncppField17: TppField
      FieldAlias = 'DATAOPCAOFGTS'
      FieldName = 'DATAOPCAOFGTS'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 16
    end
    object ppFichaFuncppField18: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppFichaFuncppField19: TppField
      FieldAlias = 'DATADEMISSAO'
      FieldName = 'DATADEMISSAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object ppFichaFuncppField20: TppField
      FieldAlias = 'DATADEMISSAOFLAG'
      FieldName = 'DATADEMISSAOFLAG'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 19
    end
    object ppFichaFuncppField21: TppField
      FieldAlias = 'MOTIVODESLIG'
      FieldName = 'MOTIVODESLIG'
      FieldLength = 50
      DisplayWidth = 50
      Position = 20
    end
    object ppFichaFuncppField22: TppField
      FieldAlias = 'ANOCHEGADA'
      FieldName = 'ANOCHEGADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 21
    end
    object ppFichaFuncppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDESTRANGEIRO'
      FieldName = 'IDESTRANGEIRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppFichaFuncppField24: TppField
      FieldAlias = 'NATURALIZADO'
      FieldName = 'NATURALIZADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 23
    end
    object ppFichaFuncppField25: TppField
      FieldAlias = 'CASADOBRASILEIRO'
      FieldName = 'CASADOBRASILEIRO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 24
    end
    object ppFichaFuncppField26: TppField
      FieldAlias = 'FILHOSBRASILEIROS'
      FieldName = 'FILHOSBRASILEIROS'
      FieldLength = 3
      DisplayWidth = 3
      Position = 25
    end
    object ppFichaFuncppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'DECRETONATURALIZACAO'
      FieldName = 'DECRETONATURALIZACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppFichaFuncppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOD19NUMERO'
      FieldName = 'MOD19NUMERO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object ppFichaFuncppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOD19REGISTRO'
      FieldName = 'MOD19REGISTRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object ppFichaFuncppField30: TppField
      FieldAlias = 'SEXO'
      FieldName = 'SEXO'
      FieldLength = 9
      DisplayWidth = 9
      Position = 29
    end
    object ppFichaFuncppField31: TppField
      FieldAlias = 'ESTCIVIL'
      FieldName = 'ESTCIVIL'
      FieldLength = 22
      DisplayWidth = 22
      Position = 30
    end
    object ppFichaFuncppField32: TppField
      FieldAlias = 'VINCULO'
      FieldName = 'VINCULO'
      FieldLength = 32
      DisplayWidth = 32
      Position = 31
    end
    object ppFichaFuncppField33: TppField
      FieldAlias = 'LOGRAJ'
      FieldName = 'LOGRAJ'
      FieldLength = 200
      DisplayWidth = 200
      Position = 32
    end
    object ppFichaFuncppField34: TppField
      FieldAlias = 'BAIRROJ'
      FieldName = 'BAIRROJ'
      FieldLength = 200
      DisplayWidth = 200
      Position = 33
    end
    object ppFichaFuncppField35: TppField
      FieldAlias = 'CEPJ'
      FieldName = 'CEPJ'
      FieldLength = 8
      DisplayWidth = 8
      Position = 34
    end
    object ppFichaFuncppField36: TppField
      FieldAlias = 'NUMEROJ'
      FieldName = 'NUMEROJ'
      FieldLength = 8
      DisplayWidth = 8
      Position = 35
    end
    object ppFichaFuncppField37: TppField
      FieldAlias = 'CIDADEJ'
      FieldName = 'CIDADEJ'
      FieldLength = 50
      DisplayWidth = 50
      Position = 36
    end
    object ppFichaFuncppField38: TppField
      FieldAlias = 'UFJ'
      FieldName = 'UFJ'
      FieldLength = 3
      DisplayWidth = 3
      Position = 37
    end
    object ppFichaFuncppField39: TppField
      FieldAlias = 'COMPLEJ'
      FieldName = 'COMPLEJ'
      FieldLength = 200
      DisplayWidth = 200
      Position = 38
    end
    object ppFichaFuncppField40: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 39
    end
    object ppFichaFuncppField41: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 40
    end
    object ppFichaFuncppField42: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 41
    end
    object ppFichaFuncppField43: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 42
    end
    object ppFichaFuncppField44: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 43
    end
    object ppFichaFuncppField45: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 44
    end
    object ppFichaFuncppField46: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 45
    end
    object ppFichaFuncppField47: TppField
      FieldAlias = 'ESTAB'
      FieldName = 'ESTAB'
      FieldLength = 60
      DisplayWidth = 60
      Position = 46
    end
    object ppFichaFuncppField48: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 47
    end
    object ppFichaFuncppField49: TppField
      FieldAlias = 'DESCRCARGO'
      FieldName = 'DESCRCARGO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 48
    end
    object ppFichaFuncppField50: TppField
      FieldAlias = 'PROFISSAO'
      FieldName = 'PROFISSAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 49
    end
    object ppFichaFuncppField51: TppField
      FieldAlias = 'C_CUSTO'
      FieldName = 'C_CUSTO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 50
    end
    object ppFichaFuncppField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALARIOATUAL'
      FieldName = 'SALARIOATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 51
    end
    object ppFichaFuncppField53: TppField
      FieldAlias = 'TIPOPAGAMENTO'
      FieldName = 'TIPOPAGAMENTO'
      FieldLength = 12
      DisplayWidth = 12
      Position = 52
    end
    object ppFichaFuncppField54: TppField
      FieldAlias = 'GRINSTR'
      FieldName = 'GRINSTR'
      FieldLength = 30
      DisplayWidth = 30
      Position = 53
    end
    object ppFichaFuncppField55: TppField
      FieldAlias = 'DDI'
      FieldName = 'DDI'
      FieldLength = 6
      DisplayWidth = 6
      Position = 54
    end
    object ppFichaFuncppField56: TppField
      FieldAlias = 'DDD'
      FieldName = 'DDD'
      FieldLength = 7
      DisplayWidth = 7
      Position = 55
    end
    object ppFichaFuncppField57: TppField
      FieldAlias = 'TELEFONE'
      FieldName = 'TELEFONE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 56
    end
    object ppFichaFuncppField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'JORNADAMENSAL'
      FieldName = 'JORNADAMENSAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 57
    end
    object ppFichaFuncppField59: TppField
      FieldAlias = 'NOMEHORARIO'
      FieldName = 'NOMEHORARIO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 58
    end
  end
  object dsFichaFunc: TwwDataSource
    DataSet = qryFichaFunc
    Left = 348
    Top = 5
  end
  object ppIMG: TppBDEPipeline
    DataSource = dsIMG
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'IMG'
    Left = 524
    Top = 296
  end
  object dsIMG: TwwDataSource
    DataSet = CdsIMG
    Left = 524
    Top = 244
  end
  object ppFichaFunc1: TppBDEPipeline
    DataSource = dsFichaFunc1
    UserName = 'FichaFunc1'
    Left = 25
    Top = 56
  end
  object dsFichaFunc1: TwwDataSource
    DataSet = qryFichaFunc1
    Left = 25
    Top = 104
  end
  object ppFichaFunc2: TppBDEPipeline
    DataSource = dsFichaFunc2
    CloseDataSource = True
    UserName = 'FichaFunc2'
    Left = 106
    Top = 56
  end
  object dsFichaFunc2: TwwDataSource
    DataSet = qryFichaFunc2
    Left = 106
    Top = 104
  end
  object ppFichaFunc3: TppBDEPipeline
    DataSource = dsFichaFunc3
    CloseDataSource = True
    UserName = 'FichaFunc3'
    Left = 189
    Top = 56
    object ppFichaFunc3ppField1: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppFichaFunc3ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'TEMAVAL'
      FieldName = 'TEMAVAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppFichaFunc3ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TEMAVPR'
      FieldName = 'TEMAVPR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppFichaFunc3ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'AVALIACAO'
      FieldName = 'AVALIACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppFichaFunc3ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'AVALPRAT'
      FieldName = 'AVALPRAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppFichaFunc3ppField6: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 1
      DataType = dtMemo
      DisplayWidth = 10
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppFichaFunc3ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppFichaFunc3ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCURSO'
      FieldName = 'IDCURSO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppFichaFunc3ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMSEQ'
      FieldName = 'NUMSEQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppFichaFunc3ppField10: TppField
      FieldAlias = 'DATREINI'
      FieldName = 'DATREINI'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object ppFichaFunc3ppField11: TppField
      FieldAlias = 'DATREFIM'
      FieldName = 'DATREFIM'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 10
    end
    object ppFichaFunc3ppField12: TppField
      FieldAlias = 'DATPLINI'
      FieldName = 'DATPLINI'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object ppFichaFunc3ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'AVALCURSO'
      FieldName = 'AVALCURSO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppFichaFunc3ppField14: TppField
      FieldAlias = 'DATPLFIM'
      FieldName = 'DATPLFIM'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object ppFichaFunc3ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'DUR_TEOR'
      FieldName = 'DUR_TEOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppFichaFunc3ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'DUR_PRAT'
      FieldName = 'DUR_PRAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppFichaFunc3ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'DUR_TOT'
      FieldName = 'DUR_TOT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppFichaFunc3ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGCONTROLE'
      FieldName = 'FLGCONTROLE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppFichaFunc3ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGAVALCURS'
      FieldName = 'FLGAVALCURS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppFichaFunc3ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGAVALTEOR'
      FieldName = 'FLGAVALTEOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppFichaFunc3ppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'AVALTEOR'
      FieldName = 'AVALTEOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppFichaFunc3ppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGAVALPRAT'
      FieldName = 'FLGAVALPRAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppFichaFunc3ppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'AVALPRAT_1'
      FieldName = 'AVALPRAT_1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppFichaFunc3ppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppFichaFunc3ppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESP_VIAG'
      FieldName = 'DESP_VIAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppFichaFunc3ppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESP_ESTAD'
      FieldName = 'DESP_ESTAD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppFichaFunc3ppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESP_OUTR'
      FieldName = 'DESP_OUTR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppFichaFunc3ppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDENTIDINSTR'
      FieldName = 'IDENTIDINSTR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object ppFichaFunc3ppField29: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 28
    end
    object ppFichaFunc3ppField30: TppField
      FieldAlias = 'TRGUSERINCLUSAO'
      FieldName = 'TRGUSERINCLUSAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 29
    end
    object ppFichaFunc3ppField31: TppField
      FieldAlias = 'LOCALCURSO'
      FieldName = 'LOCALCURSO'
      FieldLength = 80
      DisplayWidth = 80
      Position = 30
    end
    object ppFichaFunc3ppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINSTRUTOR'
      FieldName = 'IDINSTRUTOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppFichaFunc3ppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPROCESSO'
      FieldName = 'IDPROCESSO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object ppFichaFunc3ppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDMODULO'
      FieldName = 'IDMODULO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppFichaFunc3ppField35: TppField
      FieldAlias = 'DATAHORA'
      FieldName = 'DATAHORA'
      FieldLength = 1000
      DataType = dtMemo
      DisplayWidth = 10
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppFichaFunc3ppField36: TppField
      FieldAlias = 'INSTRUTORES'
      FieldName = 'INSTRUTORES'
      FieldLength = 1000
      DataType = dtMemo
      DisplayWidth = 10
      Position = 35
      Searchable = False
      Sortable = False
    end
  end
  object dsFichaFunc3: TwwDataSource
    DataSet = qryFichaFunc3
    Left = 189
    Top = 104
  end
  object ppFichaFunc4: TppBDEPipeline
    DataSource = dsFichaFunc4
    CloseDataSource = True
    UserName = 'FichaFunc4'
    Left = 271
    Top = 56
  end
  object dsFichaFunc4: TwwDataSource
    DataSet = qryFichaFunc4
    Left = 271
    Top = 104
  end
  object ppFichaFunc5: TppBDEPipeline
    DataSource = dsFichaFunc5
    CloseDataSource = True
    UserName = 'FichaFunc5'
    Left = 352
    Top = 56
    object ppFichaFunc5ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppFichaFunc5ppField2: TppField
      FieldAlias = 'DATAREAL'
      FieldName = 'DATAREAL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object ppFichaFunc5ppField3: TppField
      FieldAlias = 'AVALIADOR'
      FieldName = 'AVALIADOR'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppFichaFunc5ppField4: TppField
      FieldAlias = 'COMENT'
      FieldName = 'COMENT'
      FieldLength = 1
      DataType = dtMemo
      DisplayWidth = 10
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppFichaFunc5ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'AVALIACAO'
      FieldName = 'AVALIACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppFichaFunc5ppField6: TppField
      FieldAlias = 'DESCRTIPOAVAL'
      FieldName = 'DESCRTIPOAVAL'
      FieldLength = 30
      DisplayWidth = 30
      Position = 5
    end
  end
  object dsFichaFunc5: TwwDataSource
    DataSet = qryFichaFunc5
    Left = 352
    Top = 104
  end
  object ppFichaFunc6: TppBDEPipeline
    DataSource = dsFichaFunc6
    CloseDataSource = True
    UserName = 'FichaFunc6'
    Left = 435
    Top = 55
  end
  object dsFichaFunc6: TwwDataSource
    DataSet = qryFichaFunc6
    Left = 435
    Top = 104
  end
  object ppFichaFunc7: TppBDEPipeline
    DataSource = dsFichaFunc7
    CloseDataSource = True
    UserName = 'FichaFunc7'
    Left = 518
    Top = 56
  end
  object dsFichaFunc7: TwwDataSource
    DataSet = qryFichaFunc7
    Left = 518
    Top = 104
  end
  object ppFichaFunc8: TppBDEPipeline
    DataSource = dsFichaFunc8
    CloseDataSource = True
    UserName = 'FichaFunc8'
    Left = 25
    Top = 200
  end
  object dsFichaFunc8: TwwDataSource
    DataSet = qryFichaFunc8
    Left = 25
    Top = 248
  end
  object ppFichaFunc9: TppBDEPipeline
    DataSource = dsFichaFunc9
    CloseDataSource = True
    UserName = 'FichaFunc9'
    Left = 106
    Top = 200
  end
  object dsFichaFunc9: TwwDataSource
    DataSet = qryFichaFunc9
    Left = 106
    Top = 248
  end
  object ppFichaFunc10: TppBDEPipeline
    DataSource = dsFichaFunc10
    CloseDataSource = True
    UserName = 'FichaFunc10'
    Left = 189
    Top = 200
  end
  object dsFichaFunc10: TwwDataSource
    DataSet = qryFichaFunc10
    Left = 189
    Top = 248
  end
  object ppFichaFunc11: TppBDEPipeline
    DataSource = dsFichaFunc11
    CloseDataSource = True
    UserName = 'FichaFunc11'
    Left = 271
    Top = 200
  end
  object dsFichaFunc11: TwwDataSource
    DataSet = qryFichaFunc11
    Left = 271
    Top = 248
  end
  object ppFichaFunc12: TppBDEPipeline
    DataSource = dsFichaFunc12
    CloseDataSource = True
    UserName = 'FichaFunc12'
    Left = 352
    Top = 200
    object ppFichaFunc12ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppFichaFunc12ppField2: TppField
      FieldAlias = 'DATASITFUNC'
      FieldName = 'DATASITFUNC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object ppFichaFunc12ppField3: TppField
      FieldAlias = 'MOTIVO'
      FieldName = 'MOTIVO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppFichaFunc12ppField4: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
  end
  object dsFichaFunc12: TwwDataSource
    DataSet = qryFichaFunc12
    Left = 352
    Top = 248
  end
  object CdsIMG: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 524
    Top = 208
  end
  object qryFichaFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ('#39'FUNCEF - Fundação dos Economiários Federais'#39') AS EMPRESA,'
      '  IMA.IMAGEM, '
      '  RTRIM(PF.NOME) AS NOME,'
      '  PF.IDIMAGEM, PF.IDPESSOA, F.NIVELINDIV1,'
      
        '  PJ.NUMDOCUMENTO AS CNPJ, TO_CHAR(FIL.IDCATCNAE)||'#39'-'#39'||TO_CHAR(' +
        'FIL.IDITEMCNAE) AS CNAE,'
      '  F.MATRICULA, PAIS.NOMENACIONALIDADE AS NACIONALIDADE,'
      '  TRIM(CIDADES.NOME) || '#39'-'#39' || PEFIS.CODESTADO AS NATURALIDADE,'
      '  PEFIS.DATANASC, PEFIS.NOMEPAI, PEFIS.NOMEMAE,'
      '  RTRIM(ST.DESCRICAO) AS SITUACAO, ST.TIPOSIT, F.DATAOPCAOFGTS,'
      '  TO_CHAR(F.DATAADMISSAO,'#39'DD/MM/YYYY'#39') AS DATAADMISSAO,'
      '  TO_CHAR(F.DATADESLIGAMENTO,'#39'DD/MM/YYYY'#39') AS DATADEMISSAO,'
      
        '  DECODE(ST.TIPOSIT, '#39'D'#39', DATADESLIGAMENTO, NULL) AS DATADEMISSA' +
        'OFLAG,'
      '  MO.DESCRICAO AS MOTIVODESLIG,'
      '  EST.ANOCHEGADA, EST.IDPESSOA AS IDESTRANGEIRO,'
      
        '  DECODE(NVL(EST.FLGNATURALIZADO,0),0,'#39'Não'#39','#39'Sim'#39') AS NATURALIZA' +
        'DO,'
      
        '  DECODE(NVL(EST.FLGCASADOBRASILEIRO,0),0,'#39'Não'#39','#39'Sim'#39') AS CASADO' +
        'BRASILEIRO,'
      
        '  DECODE(NVL(EST.FLGFILHOSBRASILEIROS,0),0,'#39'Não'#39','#39'Sim'#39') AS FILHO' +
        'SBRASILEIROS,'
      '  EST.DECRETONATURALIZACAO, EST.MOD19NUMERO, EST.MOD19REGISTRO,'
      '  DECODE(PEFIS.SEXO,'#39'F'#39','#39'Feminino'#39','#39'M'#39','#39'Masculino'#39','#39#39') AS SEXO,'
      
        '  DECODE(PEFIS.ESTCIVIL,'#39'S'#39','#39'Solteir'#39' || DECODE(PEFIS.SEXO,'#39'F'#39','#39 +
        'a'#39','#39'o'#39'),'
      '    '#39'C'#39','#39'Casad'#39' || DECODE(PEFIS.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      '    '#39'D'#39','#39'Divorciad'#39' || DECODE(PEFIS.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      
        '    '#39'J'#39','#39'Divorciad'#39' || DECODE(PEFIS.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39') || '#39' Judic' +
        'ialmente'#39','
      '    '#39'E'#39','#39'Desquitad'#39' || DECODE(PEFIS.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      '    '#39'V'#39','#39'Viúv'#39' || DECODE(PEFIS.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      '    '#39'O'#39','#39'Outro'#39') AS ESTCIVIL,'
      '  DECODE(F.TIPOCONTRATO, '#39'E'#39','#39'Efetivo'#39', '#39'S'#39','#39'Efetivo Especial'#39','
      '    '#39'T'#39','#39'Temporário'#39', '#39'G'#39','#39'Estagiário'#39', '#39'3'#39','#39'Terceiro'#39','
      '    '#39'P'#39','#39'Proprietário'#39', '#39'A'#39','#39'Autônomo'#39', '#39'Indefinido'#39') ||'
      '    DECODE(F.DATAFIMCONTRATO,NULL,'#39#39','#39' (Até '#39' ||'
      '    TO_CHAR(F.DATAFIMCONTRATO,'#39'DD/MM/YYYY'#39')) AS VINCULO,'
      
        '  EJ.LOGRADOURO AS LOGRAJ, EJ.BAIRRO AS BAIRROJ, EJ.CEP AS CEPJ,' +
        ' EJ.NUMERO AS NUMEROJ,'
      
        '  CJ.NOME AS CIDADEJ,EJ.CODESTADO AS UFJ, EJ.COMPLEMENTO AS COMP' +
        'LEJ,'
      '  E.LOGRADOURO, E.BAIRRO, E.CEP, E.NUMERO, CI.NOME AS CIDADE,'
      
        '  E.CODESTADO, E.COMPLEMENTO, PJ.NOME AS ESTAB, C.TITULO AS CARG' +
        'O,'
      '  ('#39' '#39') AS DESCRCARGO,'
      
        '  PR.DESCRICAO AS PROFISSAO, CC.NOME AS C_CUSTO, NVL(F.SALARIOAT' +
        'UAL,0) AS SALARIOATUAL,'
      '  DECODE(F.TIPOPAGAMENTO, NULL,'#39#39','
      
        '    '#39'('#39' || DECODE(F.TIPOPAGAMENTO, '#39'H'#39','#39'Horista'#39', '#39'D'#39','#39'Diarista'#39 +
        ','
      '    '#39'M'#39', '#39'Mensalista'#39', '#39'T'#39','#39'Tarefa'#39') || '#39')'#39') AS TIPOPAGAMENTO,'
      '  GR.DESCRICAO AS GRINSTR,'
      
        '  DECODE(RTRIM(TELEFONE.DDI),NULL,'#39#39','#39'('#39'||RTRIM(TELEFONE.DDI)||'#39 +
        ')'#39') AS DDI,'
      
        '  DECODE(RTRIM(TELEFONE.DDD),NULL,'#39#39','#39'('#39'||RTRIM(TELEFONE.DDD)||'#39 +
        ')'#39') AS DDD,'
      
        '  RTRIM(TELEFONE.NUMERO) AS TELEFONE, HT.JORNADAMENSAL, HT.NOMEH' +
        'ORARIO '
      'FROM'
      
        '  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E, ENDPESS E' +
        'J, FUNCIONARIO F,'
      
        '  SITFUNC ST, FILIALPESSOA FIL, CIDADES CI, CIDADES, CIDADES CJ,' +
        ' CARGO C,'
      
        '  PROFISS PR, CENTCUST CC, GRINSTR GR, IMAGENS IMA, PAIS, ESTRAN' +
        'GEIRO EST, HORATRAB HT, MOTIVO MO,'
      
        '  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.DDI, TE.NUMER' +
        'O'
      '   FROM'
      '     TELENDPESS TE,'
      '     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO'
      '      FROM     TELENDPESS'
      '      GROUP BY IDENDERECO) END'
      '   WHERE'
      '     (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE'
      'WHERE'
      '  (F.IDPESSOA           = 1383676) AND'
      '  (PF.IDPESSOA          = PEFIS.IDPESSOA) AND'
      '  (PF.IDPESSOA          = F.IDPESSOA) AND'
      '  (ST.IDSITFUNC         = F.IDSITFUNC) AND'
      '  (F.IDESTAB            = PJ.IDPESSOA) AND'
      '  (F.IDESTAB            = FIL.IDFILIALPESSOA) AND'
      '  (F.IDMOTIVODESLIGRAIS = MO.IDMOTIVO(+)) AND'
      '  (PF.IDPESSOA          = EST.IDPESSOA(+)) AND'
      '  (PEFIS.IDPAIS         = PAIS.IDPAIS(+)) AND'
      '  (PEFIS.IDCIDADES      = CIDADES.IDCIDADES(+)) AND'
      '  (F.IDCARGO           = C.IDCARGO(+)) AND'
      '  (F.IDHORARIO         = HT.IDHORARIO(+)) AND'
      '  (PEFIS.IDPROFISS     = PR.IDPROFISS(+)) AND'
      '  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO(+)) AND'
      '  (F.IDEMPRESA         = CC.IDEMPRESA(+)) AND'
      '  (PEFIS.IDGRINSTR     = GR.IDGRINSTR(+)) AND'
      '  (PJ.IDPESSOA         = EJ.IDPESSOA(+)) AND'
      '  (PJ.IDENDCOMERCIAL   = EJ.IDENDERECO(+)) AND'
      '  (EJ.IDCIDADES        = CJ.IDCIDADES(+)) AND'
      '  (PF.IDPESSOA         = E.IDPESSOA(+)) AND'
      '  (PF.IDENDRESIDENCIAL = E.IDENDERECO(+)) AND'
      '  (E.IDCIDADES         = CI.IDCIDADES(+)) AND'
      '  (PF.IDIMAGEM         = IMA.IDIMAGEM(+)) AND'
      '  (PF.IDENDRESIDENCIAL = TELEFONE.IDENDERECO(+))'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 433
    Top = 5
    object qryFichaFuncEMPRESA: TStringField
      FieldName = 'EMPRESA'
      FixedChar = True
      Size = 43
    end
    object qryFichaFuncIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryFichaFuncNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryFichaFuncIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
    end
    object qryFichaFuncIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryFichaFuncNIVELINDIV1: TFloatField
      FieldName = 'NIVELINDIV1'
    end
    object qryFichaFuncCNPJ: TStringField
      FieldName = 'CNPJ'
      FixedChar = True
      Size = 18
    end
    object qryFichaFuncCNAE: TStringField
      FieldName = 'CNAE'
      Size = 81
    end
    object qryFichaFuncMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryFichaFuncNACIONALIDADE: TStringField
      FieldName = 'NACIONALIDADE'
      Size = 30
    end
    object qryFichaFuncNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
      Size = 54
    end
    object qryFichaFuncDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object qryFichaFuncNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Size = 50
    end
    object qryFichaFuncNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Size = 50
    end
    object qryFichaFuncSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 60
    end
    object qryFichaFuncTIPOSIT: TStringField
      FieldName = 'TIPOSIT'
      FixedChar = True
      Size = 1
    end
    object qryFichaFuncDATAOPCAOFGTS: TDateTimeField
      FieldName = 'DATAOPCAOFGTS'
    end
    object qryFichaFuncDATAADMISSAO: TStringField
      FieldName = 'DATAADMISSAO'
      Size = 10
    end
    object qryFichaFuncDATADEMISSAO: TStringField
      FieldName = 'DATADEMISSAO'
      Size = 10
    end
    object qryFichaFuncDATADEMISSAOFLAG: TDateTimeField
      FieldName = 'DATADEMISSAOFLAG'
    end
    object qryFichaFuncMOTIVODESLIG: TStringField
      FieldName = 'MOTIVODESLIG'
      Size = 50
    end
    object qryFichaFuncANOCHEGADA: TDateTimeField
      FieldName = 'ANOCHEGADA'
    end
    object qryFichaFuncIDESTRANGEIRO: TFloatField
      FieldName = 'IDESTRANGEIRO'
    end
    object qryFichaFuncNATURALIZADO: TStringField
      FieldName = 'NATURALIZADO'
      Size = 3
    end
    object qryFichaFuncCASADOBRASILEIRO: TStringField
      FieldName = 'CASADOBRASILEIRO'
      Size = 3
    end
    object qryFichaFuncFILHOSBRASILEIROS: TStringField
      FieldName = 'FILHOSBRASILEIROS'
      Size = 3
    end
    object qryFichaFuncDECRETONATURALIZACAO: TFloatField
      FieldName = 'DECRETONATURALIZACAO'
    end
    object qryFichaFuncMOD19NUMERO: TFloatField
      FieldName = 'MOD19NUMERO'
    end
    object qryFichaFuncMOD19REGISTRO: TFloatField
      FieldName = 'MOD19REGISTRO'
    end
    object qryFichaFuncSEXO: TStringField
      FieldName = 'SEXO'
      Size = 9
    end
    object qryFichaFuncESTCIVIL: TStringField
      FieldName = 'ESTCIVIL'
      Size = 22
    end
    object qryFichaFuncVINCULO: TStringField
      FieldName = 'VINCULO'
      Size = 32
    end
    object qryFichaFuncLOGRAJ: TStringField
      FieldName = 'LOGRAJ'
      Size = 200
    end
    object qryFichaFuncBAIRROJ: TStringField
      FieldName = 'BAIRROJ'
      Size = 200
    end
    object qryFichaFuncCEPJ: TStringField
      FieldName = 'CEPJ'
      Size = 8
    end
    object qryFichaFuncNUMEROJ: TStringField
      FieldName = 'NUMEROJ'
      Size = 8
    end
    object qryFichaFuncCIDADEJ: TStringField
      FieldName = 'CIDADEJ'
      Size = 50
    end
    object qryFichaFuncUFJ: TStringField
      FieldName = 'UFJ'
      FixedChar = True
      Size = 3
    end
    object qryFichaFuncCOMPLEJ: TStringField
      FieldName = 'COMPLEJ'
      Size = 200
    end
    object qryFichaFuncLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 200
    end
    object qryFichaFuncBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 200
    end
    object qryFichaFuncCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryFichaFuncNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryFichaFuncCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryFichaFuncCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryFichaFuncCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 200
    end
    object qryFichaFuncESTAB: TStringField
      FieldName = 'ESTAB'
      Size = 60
    end
    object qryFichaFuncCARGO: TStringField
      FieldName = 'CARGO'
      Size = 40
    end
    object qryFichaFuncDESCRCARGO: TStringField
      FieldName = 'DESCRCARGO'
      FixedChar = True
      Size = 1
    end
    object qryFichaFuncPROFISSAO: TStringField
      FieldName = 'PROFISSAO'
      Size = 60
    end
    object qryFichaFuncC_CUSTO: TStringField
      FieldName = 'C_CUSTO'
      Size = 30
    end
    object qryFichaFuncSALARIOATUAL: TFloatField
      FieldName = 'SALARIOATUAL'
    end
    object qryFichaFuncTIPOPAGAMENTO: TStringField
      FieldName = 'TIPOPAGAMENTO'
      Size = 12
    end
    object qryFichaFuncGRINSTR: TStringField
      FieldName = 'GRINSTR'
      Size = 30
    end
    object qryFichaFuncDDI: TStringField
      FieldName = 'DDI'
      Size = 6
    end
    object qryFichaFuncDDD: TStringField
      FieldName = 'DDD'
      Size = 7
    end
    object qryFichaFuncTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object qryFichaFuncJORNADAMENSAL: TFloatField
      FieldName = 'JORNADAMENSAL'
    end
    object qryFichaFuncNOMEHORARIO: TStringField
      FieldName = 'NOMEHORARIO'
      Size = 40
    end
  end
  object qryFichaFunc1: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsFichaFunc
    SQL.Strings = (
      'SELECT '
      '  DO.IDPESSOA, TDO.NOMEDOCUMENTO, DO.NUMDOCUMENTO,'
      '  TDO.MASCARA, DO.ORGAO, E.CODESTADO as UF, DO.DATAEMISSAO'
      'FROM'
      '  DOCPESSOA DO, TIPODOCPESSOA TDO, ESTADO E'
      'WHERE'
      '  (DO.IDESTADO     = E.IDESTADO (+)  ) AND'
      '  (DO.IDPESSOA    = :IDPESSOA) AND'
      '  (DO.IDDOCUMENTO = TDO.IDDOCUMENTO)'
      'ORDER BY'
      '  NOMEDOCUMENTO'
      ' ')
    ValidateWithMask = True
    Left = 25
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryFichaFunc2: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsFichaFunc
    SQL.Strings = (
      'SELECT'
      
        '  UL.IDPESSOA, UL.NUMSEQ, UL.EMPRESA, UL.ULTSALARIO, UL.DAT_ADMI' +
        'S,'
      '  UL.DATADEM, MO.DESCRICAO AS MOTIVO, C.TITULO AS CARGO'
      'FROM'
      '  CARGO C, MOTIVO MO, ULTEMPR UL'
      'WHERE'
      '  (UL.IDPESSOA = :IDPESSOA) AND'
      '  (UL.IDCARGO  = C.IDCARGO(+)) AND'
      '  (UL.IDMOTIVO = MO.IDMOTIVO(+))'
      'ORDER BY'
      '  UL.NUMSEQ'
      ' ')
    ValidateWithMask = True
    Left = 106
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryFichaFunc3: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsFichaFunc
    SQL.Strings = (
      'SELECT'
      
        '  C.DESCRICAO, C.TEMAVAL, C.TEMAVPR, C.AVALIACAO, C.AVALPRAT, C.' +
        'OBSERVACAO,'
      '  H.*'
      'FROM'
      '  HSTTRN H, CURSO C'
      'WHERE'
      '  (H.IDPESSOA = :IDPESSOA) AND'
      '  (H.IDCURSO  = C.IDCURSO)'
      'ORDER BY'
      '  H.DATREINI DESC'
      ' ')
    ValidateWithMask = True
    Left = 189
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryFichaFunc4: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsFichaFunc
    SQL.Strings = (
      'SELECT'
      '  IDPESSOA, DAT_INI, DAT_FIM, DESCRICAO'
      'FROM'
      '  HSTEXPER HS, TABEXPER TB'
      'WHERE'
      '  (HS.IDPESSOA = :IDPESSOA) AND'
      '  (HS.IDEXPER  = TB.IDEXPER)'
      'ORDER BY'
      '  HS.DAT_INI DESC'
      ' ')
    ValidateWithMask = True
    Left = 271
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryFichaFunc5: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsFichaFunc
    SQL.Strings = (
      'SELECT'
      '  HA.IDPESSOA, HA.DATAREAL, HA.AVALIADOR,'
      '  HA.COMENT, HA.AVALIACAO, TA.DESCRTIPOAVAL'
      'FROM'
      '  HSTAVAL HA, TIPOAVAL TA'
      'WHERE'
      '  (HA.IDPESSOA    = :IDPESSOA) AND'
      '  (HA.CODTIPOAVAL = TA.CODTIPOAVAL)'
      'ORDER BY'
      '  HA.DATAREAL DESC'
      ' ')
    ValidateWithMask = True
    Left = 352
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryFichaFunc6: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsFichaFunc
    SQL.Strings = (
      'SELECT'
      '  HM.IDPESSOA, HM.DATAREAL, HM.EXAMINADOR, HM.LICENCA, '
      '  HM.AVALIACAO, TM.DESCRTIPOOCMED, HM.OBSERVACAO'
      'FROM'
      '  HSTASMED HM, TIPOCMED TM'
      'WHERE'
      '  (HM.IDPESSOA     = :IDPESSOA) AND'
      '  (HM.CODTIPOOCMED = TM.CODTIPOOCMED)'
      'ORDER BY'
      '  HM.DATAREAL DESC'
      ' ')
    ValidateWithMask = True
    Left = 435
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryFichaFunc7: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsFichaFunc
    SQL.Strings = (
      'SELECT'
      '  EF.IDPESSOA, EF.DATAALTERFUNC, EF.SALARIO,'
      '  EF.PERC_REAJ, MO.DESCRICAO, CA.TITULO, CAR.TITULO AS FUNCAO'
      'FROM'
      '  EVOLFUNC EF'
      '  INNER JOIN CARGO CA ON (EF.IDCARGO  = CA.IDCARGO)'
      '  INNER JOIN MOTIVO MO ON (EF.IDMOTIVO = MO.IDMOTIVO)'
      '  LEFT JOIN CARGO CAR ON (CAR.IDCARGO = EF.IDFUNCAO)'
      'WHERE '
      '  (EF.IDPESSOA = :IDPESSOA) '
      ''
      'ORDER BY'
      '  EF.DATAALTERFUNC DESC, EF.TRGDTINCLUSAO DESC'
      ' ')
    ValidateWithMask = True
    Left = 518
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryFichaFunc9: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsFichaFunc
    SQL.Strings = (
      ''
      '  SELECT IDPESSOA,'
      '       NUMSEQ,'
      '       INIPERIODOFERIAS,'
      
        '       TO_CHAR(ADD_MONTHS(INIPERIODOFERIAS, 12) - 1, '#39'DD/MM/YYYY' +
        #39') AS FIMPERIODOFERIAS,'
      '       INIGOZOFERIAS,'
      '       FIMGOZOFERIAS,'
      '       DECODE(FLGABONO,0,'#39'Não'#39','#39'Sim'#39') AS ABONO,'
      '       DECODE(FLGOCORRIDA,0,'#39'Não'#39','#39'Sim'#39') AS PROCESSADA,       '
      
        '       TO_NUMBER(FIMGOZOFERIAS - INIGOZOFERIAS) + 1 AS DIASFERIA' +
        'S,'
      '       QTDIASABONO as DIASABONO'
      '  FROM FERIAS'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY'
      '  INIGOZOFERIAS DESC')
    ValidateWithMask = True
    Left = 106
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryFichaFunc10: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsFichaFunc
    SQL.Strings = (
      'SELECT'
      '  DT.IDTITULAR, P.IDPESSOA, P.NOME,'
      '  PF.DATANASC, DP.DESCRICAO AS PARENTESCO,'
      '  DECODE(PF.SEXO,'#39'F'#39','#39'Feminino'#39','#39'M'#39','#39'Masculino'#39','#39#39') AS SEXO,'
      
        '  DECODE(PF.ESTCIVIL,'#39'S'#39','#39'Solteir'#39' || DECODE(PF.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39 +
        '),'
      '  '#39'C'#39','#39'Casad'#39' || DECODE(PF.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      '  '#39'D'#39','#39'Separad'#39' || DECODE(PF.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      
        '  '#39'J'#39','#39'Separad'#39' || DECODE(PF.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39') || '#39' Judicialment' +
        'e'#39','
      '  '#39'E'#39','#39'Desquitad'#39' || DECODE(PF.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      '  '#39'V'#39','#39'Viúv'#39' || DECODE(PF.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      '  '#39'O'#39','#39'Outro'#39') AS ESTCIVIL'
      'FROM'
      '  PESSOA P, PESSOAFISICA PF, DEPENTIT DT, DEPEN DP'
      'WHERE'
      '  (DT.IDTITULAR      = :IDPESSOA) AND'
      '  (P.IDPESSOA        = PF.IDPESSOA) AND'
      '  (P.IDPESSOA        = DT.IDPESSOA) AND'
      '  (DT.IDDEPENDENCIA  = DP.IDDEPENDENCIA) AND'
      '  (DP.IDDEPENDENCIA <> '#39'PRP'#39')'
      'ORDER BY'
      '  PF.DATANASC ')
    ValidateWithMask = True
    Left = 189
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryFichaFunc11: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsFichaFunc
    SQL.Strings = (
      'SELECT'
      '  H.IDPESSOA, H.MES, H.VALORPROVENTO, P.NOME'
      'FROM'
      '  HISTRUBSAL H, PESSOA P, PESSOAFISICA PF, PROVDESC PD'
      'WHERE'
      '  (H.IDPESSOA   = :IDPESSOA) AND'
      '  (H.IDPESSOA   = PF.IDPESSOA) AND'
      '  (PD.CODRUBCLT = '#39'50019'#39') AND'
      '  (H.IDRUBRICA  = PD.IDPROVENTO) AND'
      '  (PF.IDSINDICATO = P.IDPESSOA(+))'
      'ORDER BY'
      '  H.MES DESC')
    ValidateWithMask = True
    Left = 271
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryFichaFunc12: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsFichaFunc
    SQL.Strings = (
      'SELECT'
      '  HS.IDPESSOA, HS.DATASITFUNC,'
      '  MO.DESCRICAO AS MOTIVO,'
      '  SF.DESCRICAO AS SITUACAO'
      'FROM'
      '  HSTSITFUNC HS, SITFUNC SF, MOTIVO MO'
      'WHERE'
      '  (HS.IDPESSOA     = :IDPESSOA) AND'
      '  (HS.IDSITFUNC    = SF.IDSITFUNC) AND'
      '  (HS.IDMOTIVOOFIC = MO.IDMOTIVO(+)) '
      'ORDER BY'
      '  HS.DATASITFUNC DESC')
    ValidateWithMask = True
    Left = 352
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryFichaFunc8: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsFichaFunc
    SQL.Strings = (
      'SELECT'
      '  RI.*, PD.DESCRICAO, PD.IDBENEFSALAR'
      'FROM'
      '  RUBRICAINDIV RI, PROVDESC PD'
      'WHERE'
      '  (RI.IDPESSOA      = :IDPESSOA) AND'
      '  (PD.IDBENEFSALAR IS NOT NULL) AND'
      '  (RI.IDRUBRICA     = PD.IDPROVENTO)'
      'ORDER BY'
      '  RI.ANOMESINICIO DESC'
      ' ')
    ValidateWithMask = True
    Left = 25
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object ppFichaFunc13: TppBDEPipeline
    DataSource = dsFichaFunc13
    CloseDataSource = True
    UserName = 'FichaFunc13'
    Left = 435
    Top = 201
  end
  object dsFichaFunc13: TwwDataSource
    DataSet = qryFichaFunc13
    Left = 435
    Top = 250
  end
  object qryFichaFunc13: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsFichaFunc
    SQL.Strings = (
      'SELECT DISTINCT'
      '--  CABEÇALHO (IDENTIFICAÇÃO)'
      
        '       SUBSTR(TO_CHAR(TRUNC(MONTHS_BETWEEN(SYSDATE, PF.DATANASC)' +
        '/12)) || '#39' Anos e '#39' ||'
      '       TO_CHAR(TRUNC(MONTHS_BETWEEN(SYSDATE, PF.DATANASC)) -'
      
        '       TRUNC(MONTHS_BETWEEN(SYSDATE, PF.DATANASC)/12)*12) || '#39' M' +
        'eses'#39',1,18) AS IDADE,'
      
        '       SUBSTR(TO_CHAR(TRUNC(MONTHS_BETWEEN(SYSDATE, F.DATAADMISS' +
        'AO)/12)) || '#39' Anos e '#39' ||'
      '       TO_CHAR(TRUNC(MONTHS_BETWEEN(SYSDATE, F.DATAADMISSAO)) -'
      
        '       TRUNC(MONTHS_BETWEEN(SYSDATE, F.DATAADMISSAO)/12)*12) || ' +
        #39' Meses'#39',1,18) AS TEMPOCASA,'
      '       F.DATACARGO,'
      
        '       SUBSTR(TO_CHAR(TRUNC(MONTHS_BETWEEN(SYSDATE, F.DATACARGO)' +
        '/12)) || '#39' Anos e '#39' ||'
      '       TO_CHAR(TRUNC(MONTHS_BETWEEN(SYSDATE, F.DATACARGO)) -'
      
        '       TRUNC(MONTHS_BETWEEN(SYSDATE, F.DATACARGO)/12)*12) || '#39' M' +
        'eses'#39',1,18) AS TEMPOCARGO,'
      '       F.DATALOTACAO,'
      
        '       SUBSTR(TO_CHAR(TRUNC(MONTHS_BETWEEN(SYSDATE, F.DATALOTACA' +
        'O)/12)) || '#39' Anos e '#39' ||'
      '       TO_CHAR(TRUNC(MONTHS_BETWEEN(SYSDATE, F.DATALOTACAO)) -'
      
        '       TRUNC(MONTHS_BETWEEN(SYSDATE, F.DATALOTACAO)/12)*12) || '#39 +
        ' Meses'#39',1,18) AS TEMPOLOTACAO,'
      
        '--  CABEÇALHO DO GRUPO MATRICULA (O GRUPO DEVE TER MUDANÇA DE PÁ' +
        'GINA)'
      
        '       SUBSTR(REM.MES,6,2) || '#39'/'#39' || SUBSTR(REM.MES,1,4) AS VIGE' +
        'NCIA,'
      '--  DETALHE (RUBRICAS DE REMUNERAÇÃO)'
      '       REM.CATEGORIAREM, REM.VALORREM,'
      '--  RODAPÉ DO GRUPO MATRICULA (SOMA DO CAMPO VALORREM)'
      '--  RODAPÉ (INFORMAÇÕES HAY E ULTIMA ALTERAÇÃO REGISTRADA)'
      '       G.DESCGRPFUNC AS GRUPOFUNCIONAL,'
      '       C.PONTOSHAY,'
      
        '       ROUND((C.PONTOSHAY * T.MULTIPLICADOR + T.PARCELA) * G.FAT' +
        'ORHAY / 13, 2) AS VALORHAY,'
      '       ROUND(F.SALARIOATUAL /'
      
        '       ROUND((C.PONTOSHAY * T.MULTIPLICADOR + T.PARCELA) * G.FAT' +
        'ORHAY / 13, 2), 2) AS IP,'
      
        '       GREATEST(F.DATASALARIO, F.DATACARGO, F.DATALOTACAO) AS DA' +
        'TAULTIMAALTERACAO,'
      '       HST.SALARIOANTERIOR, HST.CARGOANTERIOR,'
      '       F.SALARIOATUAL, C.TITULO AS CARGOATUAL'
      'FROM   PESSOA P, PESSOAFISICA PF, FUNCIONARIO F,'
      '       CARGO C, GRUPFUNC G,'
      
        '       (SELECT EVOL.IDPESSOA, EVOL.SALARIO AS SALARIOANTERIOR, C' +
        '.TITULO AS CARGOANTERIOR'
      '        FROM   EVOLFUNC EVOL, CARGO C,'
      
        '          (SELECT MAX(E.DATAALTERFUNC) AS DATAALTERFUNC, E.IDPES' +
        'SOA'
      '           FROM   EVOLFUNC E, FUNCIONARIO F'
      '           WHERE'
      
        '            (E.DATAALTERFUNC < GREATEST(F.DATASALARIO, F.DATACAR' +
        'GO, F.DATALOTACAO)) AND'
      '            (E.IDPESSOA     = F.IDPESSOA)'
      '           GROUP BY E.IDPESSOA) HST2'
      '        WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND'
      '               (EVOL.IDCARGO       = C.IDCARGO) AND'
      '               (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST,'
      '       (SELECT H.IDPESSOA, H.MES,'
      '               SUBSTR(P.DESCRICAO,1,50) AS CATEGORIAREM,'
      
        '               H.VALORPROVENTO*DECODE(P.FLGDESCONTO,1,-1,1) AS V' +
        'ALORREM'
      '        FROM   HISTRUBSAL H, PROVDESC P'
      '        WHERE  (H.MES       = :MES) AND'
      '               (H.IDRUBRICA IN (171,6,125)) AND'
      '               (H.IDRUBRICA = P.IDPROVENTO)) REM,'
      '       (SELECT H.MULTIPLICADOR, H.PARCELA, C.IDCARGO'
      '        FROM TABELAHAY H, CARGO C'
      '        WHERE (LIMITE = (SELECT MIN(LIMITE)'
      '                         FROM   TABELAHAY'
      '                         WHERE  (LIMITE >= C.PONTOSHAY)))) T'
      'WHERE  F.IDPESSOA     = :IDPESSOA'
      'AND    F.IDPESSOA     = P.IDPESSOA'
      'AND    F.IDPESSOA     = PF.IDPESSOA'
      'AND    F.IDCARGO      = C.IDCARGO'
      'AND    C.IDCARGO      = T.IDCARGO'
      'AND    F.IDPESSOA     = REM.IDPESSOA'
      'AND    C.CODGRPFUNC   = G.CODGRPFUNC(+)'
      'AND    F.IDPESSOA     = HST.IDPESSOA(+)'
      'ORDER BY VALORREM DESC'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 435
    Top = 298
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object ppFichaFunc14: TppBDEPipeline
    DataSource = dsFichaFunc14
    CloseDataSource = True
    UserName = 'FichaFunc14'
    Left = 587
    Top = 201
    object ppFichaFunc14ppField1: TppField
      FieldAlias = 'IDADVERTSUSP'
      FieldName = 'IDADVERTSUSP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFichaFunc14ppField2: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFichaFunc14ppField3: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppFichaFunc14ppField4: TppField
      FieldAlias = 'DATAATO'
      FieldName = 'DATAATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppFichaFunc14ppField5: TppField
      FieldAlias = 'DATAADVSUSP'
      FieldName = 'DATAADVSUSP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppFichaFunc14ppField6: TppField
      FieldAlias = 'MOTIVO'
      FieldName = 'MOTIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppFichaFunc14ppField7: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
  end
  object dsFichaFunc14: TwwDataSource
    DataSet = qryFichaFunc14
    Left = 587
    Top = 250
  end
  object qryFichaFunc14: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsFichaFunc
    SQL.Strings = (
      'SELECT ADS.IDADVERTSUSP,'
      '       ADS.IDPESSOA,'
      
        '       DECODE(ADS.TIPO, '#39'A'#39', '#39'Advertência'#39','#39'S'#39', '#39'Suspensão'#39',NULL' +
        ', '#39#39') as TIPO,'
      '       ADS.DATAATO,'
      '       ADS.DATAADVSUSP,'
      '       ADS.MOTIVO'
      'FROM PESSOA PES'
      'INNER JOIN  ADVERTSUSP ADS ON (ADS.IDPESSOA = PES.IDPESSOA)'
      'WHERE PES.IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 587
    Top = 298
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryFichaFunc14IDADVERTSUSP: TFloatField
      FieldName = 'IDADVERTSUSP'
    end
    object qryFichaFunc14IDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryFichaFunc14TIPO: TStringField
      FieldName = 'TIPO'
      Size = 11
    end
    object qryFichaFunc14DATAATO: TDateTimeField
      FieldName = 'DATAATO'
    end
    object qryFichaFunc14DATAADVSUSP: TDateTimeField
      FieldName = 'DATAADVSUSP'
    end
    object qryFichaFunc14MOTIVO: TMemoField
      FieldName = 'MOTIVO'
      BlobType = ftMemo
      Size = 300
    end
  end
end
