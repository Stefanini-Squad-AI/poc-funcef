inherited RptResFol: TRptResFol
  Left = 251
  Top = 215
  Width = 259
  Height = 266
  Caption = 'RptResFol'
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
        Caption = 'SelIntervalo'
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
        Name = 'SelIntervalo'
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
        Caption = 'MesInicial'
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
        Name = 'MesInicial'
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
        Caption = 'AnoInicial'
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
        Name = 'AnoInicial'
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
        Caption = 'MesFinal'
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
        Name = 'MesFinal'
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
        Caption = 'AnoFinal'
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
        Name = 'AnoFinal'
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
        Caption = 'ListaNomeTipoFolha'
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
        Name = 'ListaNomeTipoFolha'
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
        Caption = 'SelRubricaApoio'
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
        Name = 'SelRubricaApoio'
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
        Caption = 'ImprimeRodape'
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
        Name = 'ImprimeRodape'
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
        Caption = 'AgruparPor'
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
        Name = 'AgruparPor'
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
        Caption = 'ImprimeTipoProcesso'
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
        Name = 'ImprimeTipoProcesso'
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
        Caption = 'BuscaHist'
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
        Name = 'BuscaHist'
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
    Report = rpResFol
    ConnectionType = cntBDE
  end
  object rpResFol: TppReport
    AutoStop = False
    DataPipeline = ppResFol
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Resumo de Folha'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4350
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
    BeforePrint = rpResFolBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 202
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppResFol'
    object ResFolppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42863
      mmPrintPosition = 0
      object ResFolppLabel3: TppLabel
        UserName = 'ResFolppLabel3'
        Caption = 'RESUMO DA FOLHA DE PAGAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 64294
        mmTop = 16140
        mmWidth = 61913
        BandType = 0
      end
      object ResFolrpLabel1: TppLabel
        UserName = 'ResFolrpLabel1'
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
        mmLeft = 151077
        mmTop = 7408
        mmWidth = 10054
        BandType = 0
      end
      object ResFolrpLabel2: TppLabel
        UserName = 'ResFolrpLabel2'
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
        mmLeft = 146844
        mmTop = 11642
        mmWidth = 14288
        BandType = 0
      end
      object ResFolrpLabel3: TppLabel
        UserName = 'ResFolrpLabel3'
        AutoSize = False
        Caption = 'Mês de Ref:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 143140
        mmTop = 15875
        mmWidth = 17992
        BandType = 0
      end
      object ResFolrpLabel4: TppLabel
        UserName = 'ResFolrpLabel4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 38100
        mmWidth = 28310
        BandType = 0
      end
      object ResFolrpLabel6: TppLabel
        UserName = 'ResFolrpLabel6'
        AutoSize = False
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 32279
        mmTop = 38100
        mmWidth = 105304
        BandType = 0
      end
      object ResFolrpLabel7: TppLabel
        UserName = 'ResFolrpLabel7'
        AutoSize = False
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 186267
        mmTop = 38100
        mmWidth = 8202
        BandType = 0
      end
      object rpResFolLine2: TppLine
        UserName = 'rpResFolLine2'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 529
        mmLeft = 2381
        mmTop = 42333
        mmWidth = 190765
        BandType = 0
      end
      object rpResFolLabelTipoPag: TppLabel
        UserName = 'rpResFolLabelTipoPag'
        AutoSize = False
        Caption = 'Tipos de Folha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 2910
        mmTop = 29898
        mmWidth = 190765
        BandType = 0
      end
      object rpResFolDBText3: TppDBText
        UserName = 'rpResFolDBText3'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppResFol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppResFol'
        mmHeight = 3175
        mmLeft = 88371
        mmTop = 0
        mmWidth = 14023
        BandType = 0
      end
      object rpResFolDBText4: TppDBText
        UserName = 'rpResFolDBText4'
        AutoSize = True
        DataField = 'CGCCPF'
        DataPipeline = ppResFol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppResFol'
        mmHeight = 3175
        mmLeft = 60854
        mmTop = 5027
        mmWidth = 11906
        BandType = 0
      end
      object rpResFolDBText5: TppDBText
        UserName = 'rpResFolDBText5'
        AutoSize = True
        DataField = 'ESTADUALMUNICIPAL'
        DataPipeline = ppResFol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppResFol'
        mmHeight = 3175
        mmLeft = 103717
        mmTop = 5027
        mmWidth = 30163
        BandType = 0
      end
      object rpResFolDBText6: TppDBText
        UserName = 'rpResFolDBText6'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppResFol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppResFol'
        mmHeight = 3175
        mmLeft = 87313
        mmTop = 9790
        mmWidth = 16140
        BandType = 0
      end
      object rpGerencialChildReport1Label4: TppLabel
        UserName = 'rpGerencialChildReport1Label4'
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
        mmLeft = 156634
        mmTop = 3175
        mmWidth = 4498
        BandType = 0
      end
      object rpGerencialChildReport1DBText4: TppDBText
        UserName = 'rpGerencialChildReport1DBText4'
        DataField = 'UF'
        DataPipeline = ppResFol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppResFol'
        mmHeight = 3704
        mmLeft = 161925
        mmTop = 3175
        mmWidth = 31221
        BandType = 0
      end
      object rpResFolLabel7: TppLabel
        UserName = 'rpResFolLabel7'
        AutoSize = False
        Caption = 'Nº de Funcionários:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 130440
        mmTop = 24077
        mmWidth = 30692
        BandType = 0
      end
      object rpResFolDBText7: TppDBText
        UserName = 'rpResFolDBText7'
        DataField = 'QTDE_FUNCIONARIOS'
        DataPipeline = ppResFol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppResFol'
        mmHeight = 3704
        mmLeft = 161925
        mmTop = 24077
        mmWidth = 31221
        BandType = 0
      end
      object rpResFolLabel12: TppLabel
        UserName = 'rpResFolLabel12'
        AutoSize = False
        Caption = 'Qtde. Func.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 139700
        mmTop = 38100
        mmWidth = 44450
        BandType = 0
      end
      object ResFolrpCalc1: TppSystemVariable
        UserName = 'ResFolrpCalc1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161925
        mmTop = 7408
        mmWidth = 31221
        BandType = 0
      end
      object ResFolrpCalc2: TppSystemVariable
        UserName = 'ResFolrpCalc2'
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
        mmLeft = 161925
        mmTop = 11642
        mmWidth = 31221
        BandType = 0
      end
      object rpResFolDBTxtMES_REF_INI: TppDBText
        UserName = 'rpResFolDBTxtMES_REF_INI'
        DataField = 'MES_REF_INI'
        DataPipeline = ppResFol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResFol'
        mmHeight = 3704
        mmLeft = 161925
        mmTop = 15875
        mmWidth = 31221
        BandType = 0
      end
      object rpResFolDBTxtMES_REF_FIN: TppDBText
        UserName = 'rpResFolDBTxtMES_REF_FIN'
        DataField = 'MES_REF_FIN'
        DataPipeline = ppResFol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResFol'
        mmHeight = 3704
        mmLeft = 161925
        mmTop = 19844
        mmWidth = 31221
        BandType = 0
      end
      object rpResFolLblPROCESSO: TppLabel
        UserName = 'rpResFolLblPROCESSO'
        AutoSize = False
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 21960
        mmWidth = 43921
        BandType = 0
      end
    end
    object ResFolppDetailBand15: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ResFolrpDBText1: TppDBText
        UserName = 'ResFolrpDBText1'
        DataField = 'RUBRICA'
        DataPipeline = ppResFol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResFol'
        mmHeight = 3704
        mmLeft = 32279
        mmTop = 1323
        mmWidth = 105040
        BandType = 4
      end
      object ResFoldpDBtxtVALOR: TppDBText
        UserName = 'ResFoldpDBtxtVALOR'
        DataField = 'VALOR'
        DataPipeline = ppResFol
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppResFol'
        mmHeight = 3704
        mmLeft = 156898
        mmTop = 1323
        mmWidth = 36248
        BandType = 4
      end
      object rpResFolDBText2: TppDBText
        UserName = 'rpResFolDBText2'
        DataField = 'CODRUBRICA'
        DataPipeline = ppResFol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResFol'
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 1323
        mmWidth = 22490
        BandType = 4
      end
      object rpResFolDBText9: TppDBText
        UserName = 'rpResFolDBText9'
        DataField = 'QTDE_FUNC_RUB'
        DataPipeline = ppResFol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppResFol'
        mmHeight = 3704
        mmLeft = 139700
        mmTop = 1323
        mmWidth = 14817
        BandType = 4
      end
    end
    object ResFolppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
    end
    object ResFolrpSummaryBand1: TppSummaryBand
      AfterPrint = ResFolrpSummaryBand1AfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
    end
    object rpResFolGroup1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppResFol
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'rpResFolGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppResFol'
      object rpResFolGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpResFolGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 59531
        mmPrintPosition = 0
        object ResFolrpShape1: TppShape
          UserName = 'ResFolrpShape1'
          mmHeight = 16669
          mmLeft = 3440
          mmTop = 26194
          mmWidth = 106627
          BandType = 5
          GroupNo = 0
        end
        object ResFolrpShape2: TppShape
          UserName = 'ResFolrpShape2'
          mmHeight = 15081
          mmLeft = 3440
          mmTop = 42598
          mmWidth = 106627
          BandType = 5
          GroupNo = 0
        end
        object ResFolrpShape3: TppShape
          UserName = 'ResFolrpShape3'
          mmHeight = 16669
          mmLeft = 109802
          mmTop = 26194
          mmWidth = 84402
          BandType = 5
          GroupNo = 0
        end
        object ResFolrpShape4: TppShape
          UserName = 'ResFolrpShape4'
          mmHeight = 15081
          mmLeft = 109802
          mmTop = 42598
          mmWidth = 84402
          BandType = 5
          GroupNo = 0
        end
        object ResFolrpLabel10: TppLabel
          UserName = 'ResFolrpLabel10'
          Caption = 
            'Preparado por :                                               __' +
            '_/____/____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 5556
          mmTop = 27252
          mmWidth = 95779
          BandType = 5
          GroupNo = 0
        end
        object ResFolrpLabel11: TppLabel
          UserName = 'ResFolrpLabel11'
          AutoSize = False
          Caption = 'Conferido por:                                  ___/____/____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 111919
          mmTop = 27252
          mmWidth = 80169
          BandType = 5
          GroupNo = 0
        end
        object ResFolrpLabel12: TppLabel
          UserName = 'ResFolrpLabel12'
          Caption = 'Declaro que os favorecidos fazem jus ao presente pagamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 5556
          mmTop = 43656
          mmWidth = 94986
          BandType = 5
          GroupNo = 0
        end
        object ResFolrpLabel13: TppLabel
          UserName = 'ResFolrpLabel13'
          Caption = '____/____/____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 5556
          mmTop = 51594
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object ResFolrpLabel14: TppLabel
          UserName = 'ResFolrpLabel14'
          AutoSize = False
          Caption = 'Autorizo a Operação:                      ____/____/____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 111919
          mmTop = 43656
          mmWidth = 80169
          BandType = 5
          GroupNo = 0
        end
        object rpResFolLabel8: TppLabel
          UserName = 'rpResFolLabel8'
          AutoSize = False
          Caption = 'TOTAL GERAL DE PROVENTOS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105304
          mmTop = 8996
          mmWidth = 47361
          BandType = 5
          GroupNo = 0
        end
        object rpResFolLabel9: TppLabel
          UserName = 'rpResFolLabel9'
          AutoSize = False
          Caption = 'TOTAL GERAL DE DESCONTOS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105304
          mmTop = 13494
          mmWidth = 47361
          BandType = 5
          GroupNo = 0
        end
        object rpResFolLine1: TppLine
          UserName = 'rpResFolLine1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 165629
          mmTop = 19050
          mmWidth = 27517
          BandType = 5
          GroupNo = 0
        end
        object rpResFolLabel10: TppLabel
          UserName = 'rpResFolLabel10'
          AutoSize = False
          Caption = 'TOTAL GERAL LÍQUIDO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105304
          mmTop = 20902
          mmWidth = 47361
          BandType = 5
          GroupNo = 0
        end
        object rpResFolLine5: TppLine
          UserName = 'rpResFolLine5'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 2381
          mmTop = 0
          mmWidth = 190765
          BandType = 5
          GroupNo = 0
        end
        object rpResFolDBCalcTotalProventos: TppDBCalc
          UserName = 'rpResFolDBCalcSubTotalProventos1'
          DataField = 'VALORPROVENTO'
          DataPipeline = ppResFol
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpResFolGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResFol'
          mmHeight = 3704
          mmLeft = 156898
          mmTop = 9260
          mmWidth = 36248
          BandType = 5
          GroupNo = 0
        end
        object rpResFolDBCalcTotalDescontos: TppDBCalc
          UserName = 'rpResFolDBCalcSubTotalDescontos1'
          DataField = 'VALORDESCONTO'
          DataPipeline = ppResFol
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpResFolGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResFol'
          mmHeight = 3704
          mmLeft = 156898
          mmTop = 13758
          mmWidth = 36248
          BandType = 5
          GroupNo = 0
        end
        object rpResFolDBCalcTotal: TppDBCalc
          UserName = 'rpResFolDBCalcSubTotal1'
          DataField = 'VALORREAL'
          DataPipeline = ppResFol
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpResFolGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResFol'
          mmHeight = 3704
          mmLeft = 156898
          mmTop = 20902
          mmWidth = 36248
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ResFolppGroup3: TppGroup
      BreakName = 'NOMEGRUPO'
      DataPipeline = ppResFol
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'ResFolppGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppResFol'
      object ResFolppGroupHeaderBandCENTROCUSTO: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object rpResFolLabelNomeGrupo: TppLabel
          UserName = 'rpResFolLabelNomeGrupo'
          Caption = 'CENTRO DE CUSTO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 794
          mmWidth = 27781
          BandType = 3
          GroupNo = 1
        end
        object rpResFolDBTextNOMEGRUPO: TppDBText
          UserName = 'rpResFolDBTextNOMEGRUPO'
          AutoSize = True
          DataField = 'NOMEGRUPO'
          DataPipeline = ppResFol
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'ppResFol'
          mmHeight = 3440
          mmLeft = 30692
          mmTop = 794
          mmWidth = 18785
          BandType = 3
          GroupNo = 1
        end
        object rpResFolLabel4: TppLabel
          UserName = 'rpResFolLabel4'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 6350
          mmWidth = 28310
          BandType = 3
          GroupNo = 1
        end
        object rpResFolLabel5: TppLabel
          UserName = 'rpResFolLabel5'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 32279
          mmTop = 6350
          mmWidth = 105304
          BandType = 3
          GroupNo = 1
        end
        object rpResFolLine4: TppLine
          UserName = 'rpResFolLine4'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 2381
          mmTop = 10848
          mmWidth = 190765
          BandType = 3
          GroupNo = 1
        end
        object rpResFolLabel6: TppLabel
          UserName = 'rpResFolLabel6'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 186267
          mmTop = 6350
          mmWidth = 8202
          BandType = 3
          GroupNo = 1
        end
        object rpResFolLabel11: TppLabel
          UserName = 'rpResFolLabel11'
          Caption = 'Qtde. Func.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 6350
          mmWidth = 44450
          BandType = 3
          GroupNo = 1
        end
      end
      object ResFolppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 20638
        mmPrintPosition = 0
        object ResFolrpLabel5: TppLabel
          UserName = 'ResFolrpLabel5'
          AutoSize = False
          Caption = 'TOTAL DE PROVENTOS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105304
          mmTop = 3969
          mmWidth = 47361
          BandType = 5
          GroupNo = 1
        end
        object ResFolrpLabel8: TppLabel
          UserName = 'ResFolrpLabel8'
          AutoSize = False
          Caption = 'TOTAL DE DESCONTOS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105304
          mmTop = 8202
          mmWidth = 47361
          BandType = 5
          GroupNo = 1
        end
        object ResFolrpResfolLine3: TppLine
          UserName = 'ResFolrpResfolLine3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 165629
          mmTop = 13494
          mmWidth = 27517
          BandType = 5
          GroupNo = 1
        end
        object ResFolrpLabel9: TppLabel
          UserName = 'ResFolrpLabel9'
          AutoSize = False
          Caption = 'TOTAL LÍQUIDO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 105304
          mmTop = 15346
          mmWidth = 47361
          BandType = 5
          GroupNo = 1
        end
        object rpResFolDBCalcSubTotalProventos: TppDBCalc
          UserName = 'rpResFolDBCalcSubTotalProventos'
          DataField = 'VALORPROVENTO'
          DataPipeline = ppResFol
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ResFolppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResFol'
          mmHeight = 3704
          mmLeft = 156898
          mmTop = 3704
          mmWidth = 36248
          BandType = 5
          GroupNo = 1
        end
        object rpResFolDBCalcSubTotalDescontos: TppDBCalc
          UserName = 'rpResFolDBCalcSubTotalDescontos'
          DataField = 'VALORDESCONTO'
          DataPipeline = ppResFol
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ResFolppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResFol'
          mmHeight = 3704
          mmLeft = 156898
          mmTop = 8202
          mmWidth = 36248
          BandType = 5
          GroupNo = 1
        end
        object rpResFolDBCalcSubTotal: TppDBCalc
          UserName = 'rpResFolDBCalcSubTotal'
          DataField = 'VALORREAL'
          DataPipeline = ppResFol
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ResFolppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResFol'
          mmHeight = 3704
          mmLeft = 156898
          mmTop = 15346
          mmWidth = 36248
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ResFolppGroup4: TppGroup
      BreakName = 'PROVENTODESCONTO'
      DataPipeline = ppResFol
      OutlineSettings.CreateNode = True
      UserName = 'ResFolppGroup4'
      mmNewColumnThreshold = 11000
      mmNewPageThreshold = 0
      DataPipelineName = 'ppResFol'
      object ResFolppGroupHeaderBand4: TppGroupHeaderBand
        BeforePrint = ResFolppGroupHeaderBand4BeforePrint
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object rpResFolDBText1: TppDBText
          UserName = 'rpResFolDBText1'
          AutoSize = True
          DataField = 'PROVENTODESCONTO'
          DataPipeline = ppResFol
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'ppResFol'
          mmHeight = 3440
          mmLeft = 2381
          mmTop = 1058
          mmWidth = 32015
          BandType = 3
          GroupNo = 1
        end
      end
      object ResFolppGroupFooterBand4: TppGroupFooterBand
        BeforePrint = ResFolppGroupFooterBand4BeforePrint
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ResFolrpResfolLine2: TppLine
          UserName = 'ResFolrpResfolLine2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 2381
          mmTop = 529
          mmWidth = 190765
          BandType = 5
          GroupNo = 1
        end
        object ResFolrplbTotProvDesc: TppLabel
          UserName = 'ResFolrplbTotProvDesc'
          Caption = 'ResFolrplbTotProvDesc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 1852
          mmWidth = 29104
          BandType = 5
          GroupNo = 1
        end
        object rpResFolDBCalc1: TppDBCalc
          UserName = 'rpResFolDBCalc1'
          DataField = 'VALOR'
          DataPipeline = ppResFol
          DisplayFormat = '#,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ResFolppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResFol'
          mmHeight = 3704
          mmLeft = 156898
          mmTop = 1852
          mmWidth = 36248
          BandType = 5
          GroupNo = 1
        end
        object rpResFolLine3: TppLine
          UserName = 'rpResFolLine3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 2381
          mmTop = 6879
          mmWidth = 190765
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object ppResFol: TppBDEPipeline
    DataSource = dsResFol
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ResFol'
    Left = 202
    Top = 48
    object ppResFolppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppResFolppField2: TppField
      FieldAlias = 'CGCCPF'
      FieldName = 'CGCCPF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppResFolppField3: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppResFolppField4: TppField
      FieldAlias = 'ESTADUALMUNICIPAL'
      FieldName = 'ESTADUALMUNICIPAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppResFolppField5: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppResFolppField6: TppField
      FieldAlias = 'PROVENTODESCONTO'
      FieldName = 'PROVENTODESCONTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppResFolppField7: TppField
      FieldAlias = 'TIPOPROVDESC'
      FieldName = 'TIPOPROVDESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppResFolppField8: TppField
      FieldAlias = 'RUBRICA'
      FieldName = 'RUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppResFolppField9: TppField
      FieldAlias = 'CODRUBRICA'
      FieldName = 'CODRUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppResFolppField10: TppField
      FieldAlias = 'MES_REF_INI'
      FieldName = 'MES_REF_INI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppResFolppField11: TppField
      FieldAlias = 'MES_REF_FIN'
      FieldName = 'MES_REF_FIN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppResFolppField12: TppField
      FieldAlias = 'NOMEGRUPO'
      FieldName = 'NOMEGRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppResFolppField13: TppField
      FieldAlias = 'QTDE_FUNCIONARIOS'
      FieldName = 'QTDE_FUNCIONARIOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppResFolppField14: TppField
      FieldAlias = 'QTDE_FUNC_RUB'
      FieldName = 'QTDE_FUNC_RUB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppResFolppField15: TppField
      FieldAlias = 'VALORPROVENTO'
      FieldName = 'VALORPROVENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppResFolppField16: TppField
      FieldAlias = 'VALORDESCONTO'
      FieldName = 'VALORDESCONTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppResFolppField17: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppResFolppField18: TppField
      FieldAlias = 'VALORREAL'
      FieldName = 'VALORREAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppResFolppField19: TppField
      FieldAlias = 'NUM_REGISTRO'
      FieldName = 'NUM_REGISTRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
  end
  object dsResFol: TDataSource
    DataSet = CdsResFol
    Left = 202
    Top = 96
  end
  object sqlResFol: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  RPAD('#39'1'#39', 60, '#39'1'#39') AS EMPRESA,'
      '  RPAD('#39'1'#39', 25, '#39'1'#39') AS CGCCPF,'
      '  '#39'12'#39' AS UF,'
      '  RPAD('#39'1'#39', 25, '#39'1'#39') AS ESTADUALMUNICIPAL,'
      '  RPAD('#39'1'#39', 80, '#39'1'#39') AS ENDERECO,'
      '  RPAD('#39'1'#39', 09, '#39'1'#39') AS PROVENTODESCONTO,'
      '  0 AS TIPOPROVDESC,'
      '  RPAD('#39'1'#39', 60, '#39'1'#39') AS RUBRICA,'
      '  RPAD('#39'1'#39', 20, '#39'1'#39') AS CODRUBRICA,'
      '  RPAD('#39'1'#39', 20, '#39'1'#39') AS MES_REF_INI,'
      '  RPAD('#39'1'#39', 20, '#39'1'#39') AS MES_REF_FIN,'
      '  RPAD('#39'1'#39', 30, '#39'1'#39') AS NOMEGRUPO,'
      '  0 AS QTDE_FUNCIONARIOS,'
      '  0 AS QTDE_FUNC_RUB,'
      '  0 AS VALORPROVENTO,'
      '  0 AS VALORDESCONTO,'
      '  0 AS VALOR,'
      '  0 AS VALORREAL,'
      '  0 AS NUM_REGISTRO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsResFol
    Left = 202
    Top = 190
  end
  object CdsResFol: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CGCCPF'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'UF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ESTADUALMUNICIPAL'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'PROVENTODESCONTO'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'TIPOPROVDESC'
        DataType = ftFloat
      end
      item
        Name = 'RUBRICA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CODRUBRICA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MES_REF_INI'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MES_REF_FIN'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOMEGRUPO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'QTDE_FUNCIONARIOS'
        DataType = ftFloat
      end
      item
        Name = 'QTDE_FUNC_RUB'
        DataType = ftFloat
      end
      item
        Name = 'VALORPROVENTO'
        DataType = ftFloat
      end
      item
        Name = 'VALORDESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALORREAL'
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
    Params = <>
    StoreDefs = True
    AfterOpen = CdsResFolAfterOpen
    AfterScroll = CdsResFolAfterScroll
    Left = 202
    Top = 144
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 42
    Top = 101
  end
end
