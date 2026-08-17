inherited RptAtivCurso: TRptAtivCurso
  Left = 696
  Top = 242
  Width = 365
  Height = 309
  Caption = 'RptAtivCurso'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'ListaCurso'
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
        Name = 'ListaCurso'
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
        Caption = 'ListaEntid'
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
        Name = 'ListaEntid'
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
        Caption = 'DataIni'
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
        Name = 'DataIni'
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
        Caption = 'DataFim'
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
        Name = 'DataFim'
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
        Caption = 'IncPorConta'
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
        Name = 'IncPorConta'
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
        Caption = 'TipoCusto'
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
        Name = 'TipoCusto'
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
        Caption = 'TipoResumo'
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
        Name = 'TipoResumo'
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
        Caption = 'SeqRelat'
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
        Name = 'SeqRelat'
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
        Caption = 'FormaRelat'
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
        Name = 'FormaRelat'
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
        Caption = 'SelCurso1'
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
        Name = 'SelCurso1'
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
        Caption = 'SelCurso2'
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
        Name = 'SelCurso2'
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
        Caption = 'SelCurso3'
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
        Name = 'SelCurso3'
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
        Caption = 'SelCurso4'
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
        Name = 'SelCurso4'
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
        Caption = 'Consolida'
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
        Name = 'Consolida'
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
        Caption = 'Origem'
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
        Name = 'Origem'
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
        Caption = 'ExibeConteudo'
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
        Name = 'ExibeConteudo'
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
        Caption = 'Tipo'
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
        Name = 'Tipo'
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
        Caption = 'AvalAluno'
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
        Name = 'AvalAluno'
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
        Caption = 'Candidatos'
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
        Name = 'Candidatos'
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
        Caption = 'ListaAtiv'
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
        Name = 'ListaAtiv'
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
        Caption = 'NumRelat'
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
        Name = 'NumRelat'
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
    Report = rpAtivCurso
    ConnectionType = cntBDE
  end
  object sqlAtivCurso: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS PERIODO,'
      '  '#39'1234567890'#39' AS MATRICULA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPREGADO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CARGO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CENTROCUSTO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DESCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS LOCALCURSO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS OBSERVACAO,'
      '  1234567890 AS DUR_TOT,'
      '  1234567890 AS AVALTEOR,'
      '  1234567890 AS AVALPRAT,'
      '  1234567890 AS AVALCURSO,'
      '  '#39'1234567890'#39' AS AVALCURSOREL,'
      '  1234567890 AS CUSTO,'
      '  1234567890 AS IDCURSO,'
      '  0 AS PRESENCAS,'
      '  '#39'1234567890'#39' AS DATREINI,'
      '  '#39'1234567890'#39' AS DATREFIM,'
      '  '#39'1234567890'#39' AS DATAINI,'
      '  '#39'1234567890'#39' AS DATAFIM,'
      '  '#39'123456789012345'#39' AS STATUS,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENTIDADE'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ' '
      ' '
      ' ')
    ClientDataSet = CdsAtivCurso
    Left = 209
    Top = 181
  end
  object CdsAtivCurso: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 209
    Top = 137
    Data = {
      F00300009619E0BD010000001800000017000000000003000000F00307454D50
      5245534101004900000002000753554254595045020049000A00466978656443
      6861720005574944544802000200460007504552494F444F0100490000000200
      0753554254595045020049000A00466978656443686172000557494454480200
      02004600094D4154524943554C41010049000000020007535542545950450200
      49000A0046697865644368617200055749445448020002000A0009454D505245
      4741444F01004900000002000753554254595045020049000A00466978656443
      6861720005574944544802000200460005434152474F01004900000002000753
      554254595045020049000A004669786564436861720005574944544802000200
      46000B43454E54524F435553544F010049000000020007535542545950450200
      49000A0046697865644368617200055749445448020002004600094445534352
      4943414F01004900000002000753554254595045020049000A00466978656443
      686172000557494454480200020046000A4C4F43414C435552534F0100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      480200020046000A4F42534552564143414F0100490000000200075355425459
      5045020049000A00466978656443686172000557494454480200020046000744
      55525F544F540800040000000000084156414C54454F52080004000000000008
      4156414C505241540800040000000000094156414C435552534F080004000000
      00000C4156414C435552534F52454C0100490000000200075355425459504502
      0049000A0046697865644368617200055749445448020002000A000543555354
      4F0800040000000000074944435552534F08000400000000000950524553454E
      4341530800040000000000084441545245494E49010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002000A00
      08444154524546494D01004900000002000753554254595045020049000A0046
      697865644368617200055749445448020002000A000744415441494E49010049
      00000002000753554254595045020049000A0046697865644368617200055749
      445448020002000A00074441544146494D010049000000020007535542545950
      45020049000A0046697865644368617200055749445448020002000A00065354
      4154555301004900000002000753554254595045020049000A00466978656443
      68617200055749445448020002000F0008454E54494441444501004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      00020046000100044C4349440400010009080000}
  end
  object dsAtivCurso: TwwDataSource
    AutoEdit = False
    DataSet = CdsAtivCurso
    Left = 209
    Top = 92
  end
  object ppAtivCurso: TppBDEPipeline
    DataSource = dsAtivCurso
    UserName = 'ppAtivCurso'
    Left = 209
    Top = 46
    object ppAtivCursoppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 70
      DisplayWidth = 70
      Position = 0
    end
    object ppAtivCursoppField2: TppField
      FieldAlias = 'PERIODO'
      FieldName = 'PERIODO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 1
    end
    object ppAtivCursoppField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppAtivCursoppField4: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 3
    end
    object ppAtivCursoppField5: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 4
    end
    object ppAtivCursoppField6: TppField
      FieldAlias = 'CENTROCUSTO'
      FieldName = 'CENTROCUSTO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 5
    end
    object ppAtivCursoppField7: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 6
    end
    object ppAtivCursoppField8: TppField
      FieldAlias = 'LOCALCURSO'
      FieldName = 'LOCALCURSO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 7
    end
    object ppAtivCursoppField9: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 8
    end
    object ppAtivCursoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'DUR_TOT'
      FieldName = 'DUR_TOT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppAtivCursoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'AVALTEOR'
      FieldName = 'AVALTEOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppAtivCursoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'AVALPRAT'
      FieldName = 'AVALPRAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppAtivCursoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'AVALCURSO'
      FieldName = 'AVALCURSO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppAtivCursoppField14: TppField
      FieldAlias = 'AVALCURSOREL'
      FieldName = 'AVALCURSOREL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object ppAtivCursoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'CUSTO'
      FieldName = 'CUSTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppAtivCursoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCURSO'
      FieldName = 'IDCURSO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppAtivCursoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRESENCAS'
      FieldName = 'PRESENCAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppAtivCursoppField18: TppField
      FieldAlias = 'DATREINI'
      FieldName = 'DATREINI'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppAtivCursoppField19: TppField
      FieldAlias = 'DATREFIM'
      FieldName = 'DATREFIM'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object ppAtivCursoppField20: TppField
      FieldAlias = 'DATAINI'
      FieldName = 'DATAINI'
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object ppAtivCursoppField21: TppField
      FieldAlias = 'DATAFIM'
      FieldName = 'DATAFIM'
      FieldLength = 10
      DisplayWidth = 10
      Position = 20
    end
    object ppAtivCursoppField22: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 15
      DisplayWidth = 15
      Position = 21
    end
    object ppAtivCursoppField23: TppField
      FieldAlias = 'ENTIDADE'
      FieldName = 'ENTIDADE'
      FieldLength = 70
      DisplayWidth = 70
      Position = 22
    end
    object ppAtivCursoppField24: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppAtivCursoppField25: TppField
      FieldAlias = 'DESP_VIAG'
      FieldName = 'DESP_VIAG'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppAtivCursoppField26: TppField
      FieldAlias = 'DESP_ESTAD'
      FieldName = 'DESP_ESTAD'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppAtivCursoppField27: TppField
      FieldAlias = 'DESP_OUTR'
      FieldName = 'DESP_OUTR'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
  end
  object rpAtivCurso: TppReport
    AutoStop = False
    DataPipeline = ppAtivCurso
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 209
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppAtivCurso'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37835
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppAtivCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppAtivCurso'
        mmHeight = 5842
        mmLeft = 129757
        mmTop = 1058
        mmWidth = 24384
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Atividades de Treinamento por Curso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 104511
        mmTop = 9525
        mmWidth = 75406
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'PERIODO'
        DataPipeline = ppAtivCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppAtivCurso'
        mmHeight = 4191
        mmLeft = 133578
        mmTop = 17992
        mmWidth = 16214
        BandType = 0
      end
      object rpTabCursosLbl1: TppLabel
        UserName = 'rpBenefPorPessoaLbl1'
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
        mmLeft = 245798
        mmTop = 9790
        mmWidth = 9790
        BandType = 0
      end
      object rpTabCursosLbl2: TppLabel
        UserName = 'rpBenefPorPessoaLbl2'
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
        mmLeft = 240771
        mmTop = 14023
        mmWidth = 14817
        BandType = 0
      end
      object rpTabCursosCalc1: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 256382
        mmTop = 9790
        mmWidth = 7938
        BandType = 0
      end
      object rpTabCursosCalc2: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc2'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 256382
        mmTop = 14023
        mmWidth = 22225
        BandType = 0
      end
      object ppRegiaoCab1: TppRegion
        UserName = 'RegiaoCab1'
        Brush.Style = bsClear
        Pen.Color = clWhite
        Pen.Style = psClear
        Pen.Width = 0
        Transparent = True
        mmHeight = 6615
        mmLeft = 0
        mmTop = 31221
        mmWidth = 284428
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabelNome: TppLabel
          UserName = 'LabelNome'
          Caption = 'Empregado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 15610
          mmTop = 32544
          mmWidth = 19579
          BandType = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Empresa/Entidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 87313
          mmTop = 32279
          mmWidth = 30692
          BandType = 0
        end
        object ppLabel44: TppLabel
          UserName = 'Label44'
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 151607
          mmTop = 32279
          mmWidth = 10848
          BandType = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Início'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 174096
          mmTop = 32279
          mmWidth = 9260
          BandType = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 'Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 193411
          mmTop = 32279
          mmWidth = 8202
          BandType = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Horas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 210080
          mmTop = 32279
          mmWidth = 10054
          BandType = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 225161
          mmTop = 32279
          mmWidth = 10054
          BandType = 0
        end
        object ppLabelPresencas: TppLabel
          UserName = 'Label40'
          Caption = 'Presenças'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 236273
          mmTop = 32279
          mmWidth = 17727
          BandType = 0
        end
        object ppLabelResult: TppLabel
          UserName = 'LabelResult'
          Caption = 'Resultado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 255323
          mmTop = 32279
          mmWidth = 17198
          BandType = 0
        end
        object ppLabelAval: TppLabel
          UserName = 'LabelAval'
          Caption = 'Aval.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 274638
          mmTop = 32279
          mmWidth = 8202
          BandType = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 36777
          mmWidth = 283105
          BandType = 0
        end
      end
    end
    object rpAtivCursoDtlBnd: TppDetailBand
      BeforePrint = rpAtivCursoDtlBndBeforePrint
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DUR_TOT'
        DataPipeline = ppAtivCurso
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppAtivCurso'
        mmHeight = 3175
        mmLeft = 209286
        mmTop = 529
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CUSTO'
        DataPipeline = ppAtivCurso
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppAtivCurso'
        mmHeight = 3175
        mmLeft = 222780
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DATAINI'
        DataPipeline = ppAtivCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppAtivCurso'
        mmHeight = 3175
        mmLeft = 171186
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'DATAFIM'
        DataPipeline = ppAtivCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppAtivCurso'
        mmHeight = 3175
        mmLeft = 189707
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'ENTIDADE'
        DataPipeline = ppAtivCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppAtivCurso'
        mmHeight = 3175
        mmLeft = 87313
        mmTop = 529
        mmWidth = 61913
        BandType = 4
      end
      object rpAtivLblResultado: TppLabel
        UserName = 'rpAtivLblResultado'
        Caption = 'Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 256646
        mmTop = 529
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'MATRICULA'
        DataPipeline = ppAtivCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppAtivCurso'
        mmHeight = 3175
        mmLeft = 265
        mmTop = 529
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'EMPREGADO'
        DataPipeline = ppAtivCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppAtivCurso'
        mmHeight = 3175
        mmLeft = 15610
        mmTop = 529
        mmWidth = 70908
        BandType = 4
      end
      object ppDBTextAval: TppDBText
        UserName = 'DBTextAval'
        DataField = 'AVALCURSOREL'
        DataPipeline = ppAtivCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppAtivCurso'
        mmHeight = 3175
        mmLeft = 271992
        mmTop = 529
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PRESENCAS'
        DataPipeline = ppAtivCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppAtivCurso'
        mmHeight = 3175
        mmLeft = 240771
        mmTop = 529
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'STATUS'
        DataPipeline = ppAtivCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppAtivCurso'
        mmHeight = 3175
        mmLeft = 150284
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
    end
    object rpAtivCursoSmryBnd: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12435
      mmPrintPosition = 0
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'DUR_TOT'
        DataPipeline = ppAtivCurso
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppAtivCurso'
        mmHeight = 3175
        mmLeft = 203200
        mmTop = 3440
        mmWidth = 16669
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'CUSTO'
        DataPipeline = ppAtivCurso
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppAtivCurso'
        mmHeight = 3175
        mmLeft = 213519
        mmTop = 3440
        mmWidth = 22225
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Totais Gerais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 183357
        mmTop = 3440
        mmWidth = 17727
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        BlankWhenZero = True
        DataField = 'AVALCURSO'
        DataPipeline = ppAtivCurso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcAverage
        DataPipelineName = 'ppAtivCurso'
        mmHeight = 3175
        mmLeft = 264848
        mmTop = 3440
        mmWidth = 17198
        BandType = 7
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        TraverseAllData = False
        DataPipelineName = 'ppResumoTrein'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 8202
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppResumoTrein
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 144
          Top = 120
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppResumoTrein'
          object ppHeaderBand2: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 23283
            mmPrintPosition = 0
            object ppShape2: TppShape
              UserName = 'Shape2'
              Brush.Color = clSilver
              mmHeight = 8996
              mmLeft = 7673
              mmTop = 13494
              mmWidth = 189177
              BandType = 0
            end
            object ppLabel15: TppLabel
              UserName = 'Label13'
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1588
              mmTop = 8202
              mmWidth = 16669
              BandType = 0
            end
            object ppLabel16: TppLabel
              UserName = 'Label14'
              Caption = 'Realizados e Programados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 3704
              mmLeft = 8467
              mmTop = 13494
              mmWidth = 40746
              BandType = 0
            end
            object ppLabel17: TppLabel
              UserName = 'Label15'
              Caption = 'Realizados Não Programados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 3704
              mmLeft = 53181
              mmTop = 13494
              mmWidth = 44979
              BandType = 0
            end
            object ppLabel18: TppLabel
              UserName = 'Label16'
              Caption = 'Não Realizados Programados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 3704
              mmLeft = 101600
              mmTop = 13494
              mmWidth = 44979
              BandType = 0
            end
            object ppLabel19: TppLabel
              UserName = 'Label17'
              Caption = 'Não Realizados Não Program'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 3704
              mmLeft = 150284
              mmTop = 13494
              mmWidth = 44450
              BandType = 0
            end
            object ppLabel20: TppLabel
              UserName = 'Label18'
              Caption = 'Qtde'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 10583
              mmTop = 17992
              mmWidth = 7144
              BandType = 0
            end
            object ppLabel21: TppLabel
              UserName = 'Label19'
              Caption = 'Horas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 23019
              mmTop = 17992
              mmWidth = 8996
              BandType = 0
            end
            object ppLabel22: TppLabel
              UserName = 'Label20'
              Caption = 'Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 41540
              mmTop = 17992
              mmWidth = 8996
              BandType = 0
            end
            object ppLabel23: TppLabel
              UserName = 'Label21'
              Caption = 'Qtde'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 58473
              mmTop = 17992
              mmWidth = 7144
              BandType = 0
            end
            object ppLabel24: TppLabel
              UserName = 'Label22'
              Caption = 'Horas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 70908
              mmTop = 17992
              mmWidth = 8996
              BandType = 0
            end
            object ppLabel25: TppLabel
              UserName = 'Label201'
              Caption = 'Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 89429
              mmTop = 17992
              mmWidth = 8996
              BandType = 0
            end
            object ppLabel26: TppLabel
              UserName = 'Label24'
              Caption = 'Qtde'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 106627
              mmTop = 17992
              mmWidth = 7144
              BandType = 0
            end
            object ppLabel27: TppLabel
              UserName = 'Label25'
              Caption = 'Horas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 119063
              mmTop = 17992
              mmWidth = 8996
              BandType = 0
            end
            object ppLabel28: TppLabel
              UserName = 'Label202'
              Caption = 'Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 137584
              mmTop = 17992
              mmWidth = 8996
              BandType = 0
            end
            object ppLabel29: TppLabel
              UserName = 'Label27'
              Caption = 'Qtde'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 155046
              mmTop = 17992
              mmWidth = 7144
              BandType = 0
            end
            object ppLabel30: TppLabel
              UserName = 'Label28'
              Caption = 'Horas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 167482
              mmTop = 17992
              mmWidth = 8996
              BandType = 0
            end
            object ppLabel31: TppLabel
              UserName = 'Label203'
              Caption = 'Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 186002
              mmTop = 17992
              mmWidth = 8996
              BandType = 0
            end
            object ppLabel32: TppLabel
              UserName = 'Label31'
              Caption = 'Resumo da Atividade de Treinamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 14
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 5821
              mmLeft = 54504
              mmTop = 1588
              mmWidth = 88371
              BandType = 0
            end
            object ppLabel33: TppLabel
              UserName = 'Label32'
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
              mmLeft = 161925
              mmTop = 2117
              mmWidth = 9790
              BandType = 0
            end
            object ppLabel34: TppLabel
              UserName = 'Label33'
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
              mmLeft = 156898
              mmTop = 6350
              mmWidth = 14817
              BandType = 0
            end
            object ppSystemVariable1: TppSystemVariable
              UserName = 'SystemVariable1'
              VarType = vtPageSet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 172509
              mmTop = 2117
              mmWidth = 7938
              BandType = 0
            end
            object ppSystemVariable2: TppSystemVariable
              UserName = 'SystemVariable2'
              VarType = vtPrintDateTime
              DisplayFormat = 'DD/MM/YYYY HH:MM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 172509
              mmTop = 6350
              mmWidth = 22225
              BandType = 0
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 1588
              mmTop = 22754
              mmWidth = 194469
              BandType = 0
            end
            object rpResumoTreinLblPeriodo: TppLabel
              UserName = 'rpResumoTreinLblPeriodo'
              Caption = 'rpResumoTreinLblPeriodo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 76465
              mmTop = 8202
              mmWidth = 44450
              BandType = 0
            end
          end
          object rpResumoTreinDetalhe: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 17198
            mmPrintPosition = 0
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              AutoSize = True
              DataField = 'DESCRICAO'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 4233
              mmLeft = 1588
              mmTop = 529
              mmWidth = 20902
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              DataField = 'QT1'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 5556
              mmTop = 5292
              mmWidth = 12171
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'HR1'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 19050
              mmTop = 5292
              mmWidth = 12965
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'CT1'
              DataPipeline = ppResumoTrein
              DisplayFormat = '##,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 33073
              mmTop = 5292
              mmWidth = 17463
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'QT2'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 54240
              mmTop = 5292
              mmWidth = 12171
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'HR2'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 67733
              mmTop = 5292
              mmWidth = 12965
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              DataField = 'CT2'
              DataPipeline = ppResumoTrein
              DisplayFormat = '##,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 81492
              mmTop = 5292
              mmWidth = 17463
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              DataField = 'QT3'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 102659
              mmTop = 5292
              mmWidth = 12171
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              DataField = 'HR3'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 116152
              mmTop = 5292
              mmWidth = 12965
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'CT3'
              DataPipeline = ppResumoTrein
              DisplayFormat = '##,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 129911
              mmTop = 5292
              mmWidth = 17463
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              DataField = 'QT4'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 150284
              mmTop = 5292
              mmWidth = 12171
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              DataField = 'HR4'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 163777
              mmTop = 5292
              mmWidth = 12965
              BandType = 4
            end
            object ppDBText25: TppDBText
              UserName = 'DBText25'
              DataField = 'CT4'
              DataPipeline = ppResumoTrein
              DisplayFormat = '##,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 177536
              mmTop = 5292
              mmWidth = 17463
              BandType = 4
            end
            object rpResumoTreinRegDetalhe: TppRegion
              UserName = 'rpResumoTreinRegDetalhe'
              Pen.Color = clWhite
              Pen.Mode = pmWhite
              Pen.Style = psClear
              Pen.Width = 0
              mmHeight = 6615
              mmLeft = 794
              mmTop = 10583
              mmWidth = 196057
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppDBText26: TppDBText
                UserName = 'DBText26'
                DataField = 'QT5'
                DataPipeline = ppResumoTrein
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppResumoTrein'
                mmHeight = 3969
                mmLeft = 5556
                mmTop = 11642
                mmWidth = 12171
                BandType = 4
              end
              object ppDBText27: TppDBText
                UserName = 'DBText27'
                DataField = 'HR5'
                DataPipeline = ppResumoTrein
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppResumoTrein'
                mmHeight = 3969
                mmLeft = 19050
                mmTop = 11642
                mmWidth = 12965
                BandType = 4
              end
              object ppDBText28: TppDBText
                UserName = 'DBText28'
                DataField = 'CT5'
                DataPipeline = ppResumoTrein
                DisplayFormat = '##,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppResumoTrein'
                mmHeight = 3969
                mmLeft = 33073
                mmTop = 11642
                mmWidth = 17463
                BandType = 4
              end
              object ppDBText29: TppDBText
                UserName = 'DBText29'
                DataField = 'QT6'
                DataPipeline = ppResumoTrein
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppResumoTrein'
                mmHeight = 3969
                mmLeft = 54240
                mmTop = 11642
                mmWidth = 12171
                BandType = 4
              end
              object ppDBText30: TppDBText
                UserName = 'DBText30'
                DataField = 'HR6'
                DataPipeline = ppResumoTrein
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppResumoTrein'
                mmHeight = 3969
                mmLeft = 67733
                mmTop = 11642
                mmWidth = 12965
                BandType = 4
              end
              object ppDBText31: TppDBText
                UserName = 'DBText31'
                DataField = 'CT6'
                DataPipeline = ppResumoTrein
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppResumoTrein'
                mmHeight = 3969
                mmLeft = 81492
                mmTop = 11642
                mmWidth = 17463
                BandType = 4
              end
              object ppDBText32: TppDBText
                UserName = 'DBText201'
                DataField = 'QT7'
                DataPipeline = ppResumoTrein
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppResumoTrein'
                mmHeight = 3969
                mmLeft = 102659
                mmTop = 11642
                mmWidth = 12171
                BandType = 4
              end
              object ppDBText33: TppDBText
                UserName = 'DBText33'
                DataField = 'HR7'
                DataPipeline = ppResumoTrein
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppResumoTrein'
                mmHeight = 3969
                mmLeft = 116152
                mmTop = 11642
                mmWidth = 12965
                BandType = 4
              end
              object ppDBText34: TppDBText
                UserName = 'DBText34'
                DataField = 'CT7'
                DataPipeline = ppResumoTrein
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppResumoTrein'
                mmHeight = 3969
                mmLeft = 129911
                mmTop = 11642
                mmWidth = 17463
                BandType = 4
              end
              object ppDBText35: TppDBText
                UserName = 'DBText35'
                DataField = 'QT8'
                DataPipeline = ppResumoTrein
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppResumoTrein'
                mmHeight = 3969
                mmLeft = 150284
                mmTop = 11642
                mmWidth = 12171
                BandType = 4
              end
              object ppDBText36: TppDBText
                UserName = 'DBText36'
                DataField = 'HR8'
                DataPipeline = ppResumoTrein
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppResumoTrein'
                mmHeight = 3969
                mmLeft = 163777
                mmTop = 11642
                mmWidth = 12965
                BandType = 4
              end
              object ppDBText37: TppDBText
                UserName = 'DBText37'
                DataField = 'CT8'
                DataPipeline = ppResumoTrein
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppResumoTrein'
                mmHeight = 3969
                mmLeft = 177536
                mmTop = 11642
                mmWidth = 17463
                BandType = 4
              end
              object ppLine2: TppLine
                UserName = 'Line2'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 1588
                mmTop = 16140
                mmWidth = 194469
                BandType = 4
              end
            end
            object rpResumoTreinLinha1: TppLine
              UserName = 'rpResumoTreinLinha1'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 1588
              mmTop = 9525
              mmWidth = 194469
              BandType = 4
            end
          end
          object ppFooterBand1: TppFooterBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object rpResumoTreinSumario: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 30427
            mmPrintPosition = 0
            object rpResumoTreinSomaQ1: TppDBCalc
              UserName = 'rpResumoTreinSomaQ1'
              DataField = 'QT1'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 529
              mmTop = 7144
              mmWidth = 17198
              BandType = 7
            end
            object rpResumoTreinSomaH1: TppDBCalc
              UserName = 'rpResumoTreinSomaH1'
              DataField = 'HR1'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 14817
              mmTop = 7144
              mmWidth = 17198
              BandType = 7
            end
            object rpResumoTreinSomaC1: TppDBCalc
              UserName = 'rpResumoTreinSomaC1'
              DataField = 'CT1'
              DataPipeline = ppResumoTrein
              DisplayFormat = '##,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 29633
              mmTop = 7144
              mmWidth = 20638
              BandType = 7
            end
            object rpResumoTreinSomaQ2: TppDBCalc
              UserName = 'rpResumoTreinSomaQ2'
              DataField = 'QT2'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 49213
              mmTop = 7144
              mmWidth = 17198
              BandType = 7
            end
            object rpResumoTreinSomaH2: TppDBCalc
              UserName = 'rpResumoTreinSomaH2'
              DataField = 'HR2'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 63500
              mmTop = 7144
              mmWidth = 17198
              BandType = 7
            end
            object rpResumoTreinSomaC2: TppDBCalc
              UserName = 'rpResumoTreinSomaC2'
              DataField = 'CT2'
              DataPipeline = ppResumoTrein
              DisplayFormat = '##,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 78317
              mmTop = 7144
              mmWidth = 20638
              BandType = 7
            end
            object rpResumoTreinSomaQ3: TppDBCalc
              UserName = 'rpResumoTreinSomaQ3'
              DataField = 'QT3'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 97631
              mmTop = 7144
              mmWidth = 17198
              BandType = 7
            end
            object rpResumoTreinSomaH3: TppDBCalc
              UserName = 'rpResumoTreinSomaH3'
              DataField = 'HR3'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 111919
              mmTop = 7144
              mmWidth = 17198
              BandType = 7
            end
            object rpResumoTreinSomaC3: TppDBCalc
              UserName = 'rpResumoTreinSomaC3'
              DataField = 'CT3'
              DataPipeline = ppResumoTrein
              DisplayFormat = '##,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 126736
              mmTop = 7144
              mmWidth = 20638
              BandType = 7
            end
            object rpResumoTreinSomaQ4: TppDBCalc
              UserName = 'rpResumoTreinSomaQ4'
              DataField = 'QT4'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 145257
              mmTop = 7144
              mmWidth = 17198
              BandType = 7
            end
            object rpResumoTreinSomaH4: TppDBCalc
              UserName = 'rpResumoTreinSomaH4'
              DataField = 'HR4'
              DataPipeline = ppResumoTrein
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 159544
              mmTop = 7144
              mmWidth = 17198
              BandType = 7
            end
            object rpResumoTreinSomaC4: TppDBCalc
              UserName = 'rpResumoTreinSomaC4'
              DataField = 'CT4'
              DataPipeline = ppResumoTrein
              DisplayFormat = '##,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppResumoTrein'
              mmHeight = 3969
              mmLeft = 174361
              mmTop = 7144
              mmWidth = 20638
              BandType = 7
            end
            object ppLabel35: TppLabel
              UserName = 'Label30'
              Caption = 'Totais do Resumo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1588
              mmTop = 1852
              mmWidth = 30692
              BandType = 7
            end
            object rpResumoTreinRegSumario: TppRegion
              UserName = 'rpResumoTreinRegSumario'
              Pen.Mode = pmWhite
              mmHeight = 16933
              mmLeft = 794
              mmTop = 12435
              mmWidth = 196850
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppShape3: TppShape
                UserName = 'Shape3'
                mmHeight = 10583
                mmLeft = 7673
                mmTop = 17198
                mmWidth = 187325
                BandType = 7
              end
              object rpResumoTreinSomaQ5: TppDBCalc
                UserName = 'rpResumoTreinSomaQ5'
                DataField = 'QT5'
                DataPipeline = ppResumoTrein
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                OnCalc = rpResumoTreinSomaQ5Calc
                DataPipelineName = 'ppResumoTrein'
                mmHeight = 3969
                mmLeft = 529
                mmTop = 12170
                mmWidth = 17198
                BandType = 7
              end
              object rpResumoTreinSomaH5: TppDBCalc
                UserName = 'rpResumoTreinSomaH5'
                DataField = 'HR5'
                DataPipeline = ppResumoTrein
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                OnCalc = rpResumoTreinSomaH5Calc
                DataPipelineName = 'ppResumoTrein'
                mmHeight = 3969
                mmLeft = 14817
                mmTop = 12170
                mmWidth = 17198
                BandType = 7
              end
              object rpResumoTreinSomaC5: TppDBCalc
                UserName = 'rpResumoTreinSomaC5'
                DataField = 'CT5'
                DataPipeline = ppResumoTrein
                DisplayFormat = '##,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                OnCalc = rpResumoTreinSomaC5Calc
                DataPipelineName = 'ppResumoTrein'
                mmHeight = 3969
                mmLeft = 29633
                mmTop = 12170
                mmWidth = 20638
                BandType = 7
              end
              object rpResumoTreinPercQ2: TppLabel
                UserName = 'rpResumoTreinPercQ2'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 49213
                mmTop = 12170
                mmWidth = 17198
                BandType = 7
              end
              object rpResumoTreinPercH2: TppLabel
                UserName = 'rpResumoTreinPercH2'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 63500
                mmTop = 12170
                mmWidth = 17198
                BandType = 7
              end
              object rpResumoTreinPercC2: TppLabel
                UserName = 'rpResumoTreinPercC2'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 78317
                mmTop = 12170
                mmWidth = 20638
                BandType = 7
              end
              object rpResumoTreinPercQ3: TppLabel
                UserName = 'rpResumoTreinPercQ3'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 97631
                mmTop = 12170
                mmWidth = 17198
                BandType = 7
              end
              object rpResumoTreinPercH3: TppLabel
                UserName = 'rpResumoTreinPercH3'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 111919
                mmTop = 12170
                mmWidth = 17198
                BandType = 7
              end
              object rpResumoTreinPercC3: TppLabel
                UserName = 'rpResumoTreinPercC3'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 126736
                mmTop = 12170
                mmWidth = 20638
                BandType = 7
              end
              object rpResumoTreinPercQ4: TppLabel
                UserName = 'rpResumoTreinPercQ4'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 145257
                mmTop = 12170
                mmWidth = 17198
                BandType = 7
              end
              object rpResumoTreinPercH4: TppLabel
                UserName = 'rpResumoTreinPercH4'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 159544
                mmTop = 12170
                mmWidth = 17198
                BandType = 7
              end
              object rpResumoTreinPercC4: TppLabel
                UserName = 'rpResumoTreinPercC4'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 174361
                mmTop = 12170
                mmWidth = 20638
                BandType = 7
              end
              object ppLabel36: TppLabel
                UserName = 'Label34'
                Caption = 'Estas são as Legendas para a Linha do Orçamento (2a Linha)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 50006
                mmTop = 23019
                mmWidth = 97102
                BandType = 7
              end
              object ppLabel37: TppLabel
                UserName = 'Label35'
                Caption = 'Qrde     Horas         Custo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 10583
                mmTop = 17992
                mmWidth = 39952
                BandType = 7
              end
              object ppLabel38: TppLabel
                UserName = 'Label36'
                Caption = 'Percentuais Realizados'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 57415
                mmTop = 17992
                mmWidth = 36777
                BandType = 7
              end
              object ppLabel39: TppLabel
                UserName = 'Label37'
                Caption = '% Realizados+Programados'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 102394
                mmTop = 17992
                mmWidth = 44450
                BandType = 7
              end
              object ppLabel40: TppLabel
                UserName = 'Label38'
                Caption = 'Percentuais Totais'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 158221
                mmTop = 17992
                mmWidth = 29104
                BandType = 7
              end
            end
          end
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCRICAO'
      DataPipeline = ppAtivCurso
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppAtivCurso'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 33867
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 5556
          mmLeft = 0
          mmTop = 0
          mmWidth = 283105
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'DESCRICAO'
          DataPipeline = ppAtivCurso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppAtivCurso'
          mmHeight = 3969
          mmLeft = 12965
          mmTop = 529
          mmWidth = 136790
          BandType = 3
          GroupNo = 0
        end
        object ppRegiaoLocalConteudo: TppRegion
          UserName = 'RegiaoLocalConteudo'
          Stretch = True
          mmHeight = 20902
          mmLeft = 1852
          mmTop = 5821
          mmWidth = 280988
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabelLocal: TppLabel
            UserName = 'LabelLocal'
            Caption = 'Local do Curso:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 3440
            mmTop = 6879
            mmWidth = 26988
            BandType = 3
            GroupNo = 0
          end
          object ppLabel46: TppLabel
            UserName = 'Label46'
            Caption = 'Conteúdo Prog:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 3440
            mmTop = 16669
            mmWidth = 26723
            BandType = 3
            GroupNo = 0
          end
          object ppDBMemo2: TppDBMemo
            UserName = 'DBMemo2'
            CharWrap = False
            DataField = 'OBSERVACAO'
            DataPipeline = ppObserv
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = []
            ParentDataPipeline = False
            Stretch = True
            Transparent = True
            DataPipelineName = 'ppObserv'
            mmHeight = 4233
            mmLeft = 6615
            mmTop = 21431
            mmWidth = 274109
            BandType = 3
            GroupNo = 0
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmLeading = 0
          end
          object ppDBMemo1: TppDBMemo
            UserName = 'DBMemo1'
            CharWrap = False
            DataField = 'LOCALCURSO'
            DataPipeline = ppAtivCurso
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = []
            Stretch = True
            Transparent = True
            DataPipelineName = 'ppAtivCurso'
            mmHeight = 4233
            mmLeft = 6615
            mmTop = 11377
            mmWidth = 274109
            BandType = 3
            GroupNo = 0
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmLeading = 0
          end
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Curso:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 265
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object ppRegiaoCab2: TppRegion
          UserName = 'RegiaoCab2'
          Brush.Style = bsClear
          Pen.Color = clWhite
          Pen.Style = psClear
          Pen.Width = 0
          ShiftRelativeTo = ppRegiaoLocalConteudo
          Stretch = True
          Transparent = True
          mmHeight = 6615
          mmLeft = 0
          mmTop = 27252
          mmWidth = 284428
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabelNome2: TppLabel
            UserName = 'LabelNome1'
            Caption = 'Empregado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 15610
            mmTop = 28575
            mmWidth = 19579
            BandType = 3
            GroupNo = 0
          end
          object ppLabel5: TppLabel
            UserName = 'Label5'
            Caption = 'Empresa/Entidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 87313
            mmTop = 28310
            mmWidth = 30692
            BandType = 3
            GroupNo = 0
          end
          object ppLabel7: TppLabel
            UserName = 'Label7'
            Caption = 'Status'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 151342
            mmTop = 28310
            mmWidth = 10848
            BandType = 3
            GroupNo = 0
          end
          object ppLabel13: TppLabel
            UserName = 'Label101'
            Caption = 'Início'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 173832
            mmTop = 28310
            mmWidth = 9260
            BandType = 3
            GroupNo = 0
          end
          object ppLabel14: TppLabel
            UserName = 'Label3'
            Caption = 'Final'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 193146
            mmTop = 28310
            mmWidth = 8202
            BandType = 3
            GroupNo = 0
          end
          object ppLabel41: TppLabel
            UserName = 'Label41'
            Caption = 'Horas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 209815
            mmTop = 28310
            mmWidth = 10054
            BandType = 3
            GroupNo = 0
          end
          object ppLabel42: TppLabel
            UserName = 'Label42'
            Caption = 'Custo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 224896
            mmTop = 28310
            mmWidth = 10054
            BandType = 3
            GroupNo = 0
          end
          object ppLabelPresencas2: TppLabel
            UserName = 'Label401'
            Caption = 'Presenças'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 236009
            mmTop = 28310
            mmWidth = 17727
            BandType = 3
            GroupNo = 0
          end
          object ppLabelResult2: TppLabel
            UserName = 'LabelResult1'
            Caption = 'Resultado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 255059
            mmTop = 28310
            mmWidth = 17198
            BandType = 3
            GroupNo = 0
          end
          object ppLabelAval2: TppLabel
            UserName = 'LabelAval1'
            Caption = 'Aval.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 274109
            mmTop = 28310
            mmWidth = 8202
            BandType = 3
            GroupNo = 0
          end
          object ppLine4: TppLine
            UserName = 'Line4'
            Weight = 0.75
            mmHeight = 529
            mmLeft = 0
            mmTop = 32808
            mmWidth = 283105
            BandType = 3
            GroupNo = 0
          end
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Totais do Curso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 179917
          mmTop = 1852
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'DUR_TOT'
          DataPipeline = ppAtivCurso
          DisplayFormat = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppAtivCurso'
          mmHeight = 3175
          mmLeft = 203465
          mmTop = 1852
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'CUSTO'
          DataPipeline = ppAtivCurso
          DisplayFormat = '##,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppAtivCurso'
          mmHeight = 3175
          mmLeft = 213519
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          BlankWhenZero = True
          DataField = 'AVALCURSO'
          DataPipeline = ppAtivCurso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcAverage
          DataPipelineName = 'ppAtivCurso'
          mmHeight = 3175
          mmLeft = 264848
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppResumoTrein: TppBDEPipeline
    DataSource = dsResumoTrein
    UserName = 'ResumoTrein'
    Left = 290
    Top = 46
    object ppResumoTreinppField1: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField2: TppField
      FieldAlias = 'QT1'
      FieldName = 'QT1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField3: TppField
      FieldAlias = 'HR1'
      FieldName = 'HR1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField4: TppField
      FieldAlias = 'CT1'
      FieldName = 'CT1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField5: TppField
      FieldAlias = 'QT2'
      FieldName = 'QT2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField6: TppField
      FieldAlias = 'HR2'
      FieldName = 'HR2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField7: TppField
      FieldAlias = 'CT2'
      FieldName = 'CT2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField8: TppField
      FieldAlias = 'QT3'
      FieldName = 'QT3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField9: TppField
      FieldAlias = 'HR3'
      FieldName = 'HR3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField10: TppField
      FieldAlias = 'CT3'
      FieldName = 'CT3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField11: TppField
      FieldAlias = 'QT4'
      FieldName = 'QT4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField12: TppField
      FieldAlias = 'HR4'
      FieldName = 'HR4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField13: TppField
      FieldAlias = 'CT4'
      FieldName = 'CT4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField14: TppField
      FieldAlias = 'QT5'
      FieldName = 'QT5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField15: TppField
      FieldAlias = 'HR5'
      FieldName = 'HR5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField16: TppField
      FieldAlias = 'CT5'
      FieldName = 'CT5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField17: TppField
      FieldAlias = 'QT6'
      FieldName = 'QT6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField18: TppField
      FieldAlias = 'HR6'
      FieldName = 'HR6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField19: TppField
      FieldAlias = 'CT6'
      FieldName = 'CT6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField20: TppField
      FieldAlias = 'QT7'
      FieldName = 'QT7'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField21: TppField
      FieldAlias = 'HR7'
      FieldName = 'HR7'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField22: TppField
      FieldAlias = 'CT7'
      FieldName = 'CT7'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField23: TppField
      FieldAlias = 'QT8'
      FieldName = 'QT8'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField24: TppField
      FieldAlias = 'HR8'
      FieldName = 'HR8'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppResumoTreinppField25: TppField
      FieldAlias = 'CT8'
      FieldName = 'CT8'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
  end
  object dsResumoTrein: TwwDataSource
    AutoEdit = False
    DataSet = CdsResumoTrein
    Left = 290
    Top = 92
  end
  object CdsResumoTrein: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 290
    Top = 137
  end
  object sqlResumoTrein: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'1234567890123456789012345678901234567890'#39' AS DESCRICAO,'
      '  0 AS QT1, 0 AS HR1, 0 AS CT1,'
      '  0 AS QT2, 0 AS HR2, 0 AS CT2,'
      '  0 AS QT3, 0 AS HR3, 0 AS CT3,'
      '  0 AS QT4, 0 AS HR4, 0 AS CT4,'
      '  0 AS QT5, 0 AS HR5, 0 AS CT5,'
      '  0 AS QT6, 0 AS HR6, 0 AS CT6,'
      '  0 AS QT7, 0 AS HR7, 0 AS CT7,'
      '  0 AS QT8, 0 AS HR8, 0 AS CT8'
      ''
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ' '
      ' ')
    ClientDataSet = CdsResumoTrein
    Left = 290
    Top = 181
  end
  object ppObserv: TppBDEPipeline
    DataSource = dsObserv
    SkipWhenNoRecords = False
    UserName = 'ppObserv'
    Left = 95
    Top = 57
    object ppObservppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCURSO'
      FieldName = 'IDCURSO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppObservppField2: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 1
      DataType = dtMemo
      DisplayWidth = 10
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object dsObserv: TwwDataSource
    AutoEdit = False
    DataSet = CdsObserv
    Left = 95
    Top = 103
  end
  object CdsObserv: TCMClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'IDCURSO'
    MasterFields = 'IDCURSO'
    MasterSource = dsAtivCurso
    PacketRecords = 0
    Params = <>
    Left = 95
    Top = 148
    Data = {
      E32E00009619E0BD010000001800000002002E02000003000000810007494443
      5552534F08000400000000000A4F42534552564143414F04004B000000020007
      5355425459504502004900050054657874000557494454480200020001000200
      0D44454641554C545F4F5244455202008200010000000100044C434944040001
      00090800000004000000000000F03F0004000000000000004000040000000000
      0008400004000000000000104000040000000000001440000400000000000018
      4000040000000000001C40000400000000000020400004000000000000224000
      0400000000000024400004000000000000264000040000000000002840000400
      00000000002A4000040000000000002C40000400000000000030400004000000
      0000003140000400000000000032400004000000000000334000040000000000
      0034400004000000000000354000040000000000003640000400000000000037
      40000000000000000038404D010000436F6D706F7274616D656E746F20476572
      656E6369616C3A204173706563746F7320506573736F61697320782050726F66
      697373696F6E616973202D2052656C6163696F6E616D6E65746F20636F6D206F
      20677275706F3A20206C69646572616E63612C20437269617469766964616465
      2065206120546F6D616461206465204465636973616F202D204F20636F6D706F
      7274616D656E746F204F7267616E697A6163696F6E616C3A2041206F7267616E
      697A6163616F2065207375617320706572737065637469766173202C204F7320
      6D65746F646F732041646D696E69737472617469766F73206520612047657265
      6E63696120417475616C2C204173204D65746173204F7267616E697A6163696F
      6E6169732C20506C616E656A616D656E746F2065206F2050657266696C204765
      72656E6369616C2C204F206D6F6D656E746F20536F6369616C2E202000040000
      00000000394000040000000000003A4000040000000000003B40000400000000
      00003C4000040000000000003E4000040000000000003F400004000000000000
      4040000400000000008040400004000000000000424000040000000000804240
      0004000000000000434000040000000000804340000400000000000044400000
      0000000000804440EE000000506572736F6E616C696461646520652050657263
      6570633F6F2C204D6174757269646164652046756E63696F6E616C2065205069
      73636F6C6F676963613B20436F6E636569746F20646520436F6E666C69746F3B
      2042696E6F6D696F2052656C61633F657320506573736F6169732078204D6574
      617320506573736F6169733B204174727561633F6F204672656E746520616F20
      436F6E666C69746F3B20457374696C6F732064652041646D696E697374726163
      3F6F205369747563696F6E616C20646520436F6E666C69746F733B204175746F
      2D436F6E636569746F3B205265666C65783F6F2046696E616C2E000400000000
      0000454000040000000000804540000400000000000046400004000000000080
      4640000400000000000047400004000000000080474000040000000000004840
      0004000000000080484000040000000000004940000400000000008049400004
      0000000000004A4000040000000000804A4000040000000000004B4000000000
      000000804B405E0000005041434F544520444520435552534F53204445535449
      4E41444F5320414F204445494E46204520444550415254414D454E544F532045
      204153534553534F5249415320515545204150524553454E54454D204E454345
      535349444144452E00040000000000004C4000040000000000804C4000040000
      000000004D4000040000000000804D4000040000000000004E40000400000000
      00804E4000040000000000004F4000040000000000804F400004000000000000
      5040000400000000004050400004000000000080504000040000000000C05040
      000400000000004051400004000000000080514000040000000000C051400004
      0000000000005240000400000000004052400004000000000080524000000000
      000000C0524053010000506572636570633F6F2C2044696D656E733F65732043
      6F6D706F7274616D656E746169732C20504E4C206E6120436F6D756E69636163
      3F6F2C2050726F636573736F20646520436F6D756E696361633F6F2C200D0A4F
      73203420457374696C6F7320496D706F7274616E746573206E6120436F6D756E
      696361633F6F2C2050726F636573736F20437269617469766F2C20457374696C
      6F73206465204E65676F636961633F6F2C20436F6D6F204E65676F6369617220
      636F6D206361646120457374696C6F2C205175616C6964616465732C20417469
      7475646573204261736963617320646F204E65676F636961646F722C20466C65
      786962696C697A61633F6F2C20436C696D61732C204573747261746567696173
      20652054617469636173206465204E65676F636961633F6F2C204D617472697A
      204D414449202D2046617A6573206461204E65676F636961633F6F2E20000000
      000000000053400801000054656F726961732064652041444D2C204C69646572
      616E636120656D2066756E633F6F20646F732050726F636573736F7320646520
      4D7564616E63612C204573747261746567696173206465204E65676F63696163
      3F6F2C20546F6D6164612064652044656369733F6F2C204175746F2D44657365
      6E766F6C76696D656E746F2C204F20706170656C20457374726174656769636F
      2D476572656E6369616C206E6F732034204772616E646573204F626A65746976
      6F73206465204E65676F63696F3A20526563656974612C2050656E6574726163
      3F6F206465204D65726361646F2C2053617469736661633F6F20646520456D70
      72656761646F73206520436C69656E7465732E00040000000000405340000400
      0000000080534000040000000000C05340000400000000004054400004000000
      000080544000000000000000C05440EF000000436F6E636569746F7320476572
      6169732C204469666572656E63612043686566652065206C696465722C20436F
      6D6F204C6964657261722065204F7267616E697A6172205265756E693F657320
      50726F647574697661732C20506C616E656A616D656E746F2064652054726162
      616C686F2C20436F6D6F2056656E646572204964656961732C20436F6D6F2054
      72617461722050726F626C656D61732050726F66697373696F6E6169732C2043
      6F6D6F2054726162616C68617220656D204571756970652C2050726F6A65746F
      206465204C69646572616E63617320656D20746F646F73206F73204E69766569
      732E000400000000000055400004000000000040554000040000000000805540
      00040000000000C0554000040000000000005640000400000000004056400000
      0000000000805640B001000045737472657373652C2054656D706F2065205175
      616C69646164653A20436F6E636569746F732C20446566696E69633F65732065
      20546573746520506C656C696D696E6172202D20546162656C6120646F205465
      6D706F206520446961676E6F737469636F20646F732044657370657264696361
      646F726573202D20436F6D6F20436F6E7365677569722042656D204573746172
      2C2053617469736661633F6F206520457175696C696272696F20636F6D206D65
      6C686F722052656E64696D656E746F202D204E65636573736964616465732042
      696F707369636F73736F63696169732065206F7320706170656973206E6F2064
      6961206120646961202D204F2054656D706F20636F6D6F20756D612044696D65
      6E733F6F206461205175616C6964616465202D204F207175652066617A657220
      7061726120656C696D696E6172206F20646573706572646963696F20646F2074
      656D706F2C20496E76656E746172696F20646F2054656D706F2C20436F6D706F
      7274616D656E746F2045666963617A6573206520506C616E6F2064652041633F
      6F20702F20476572656E6369616D656E746F20646F2054656D706F2E00040000
      000000C056400004000000000000574000040000000000405740000400000000
      0080574000040000000000C05740000400000000000058400004000000000040
      58400004000000000080584000040000000000C0584000040000000000005940
      000400000000004059400004000000000080594000040000000000005A400004
      0000000000405A4000040000000000805A4000040000000000C05A4000040000
      000000005B4000040000000000405B4000040000000000805B40000400000000
      00C05B4000040000000000405C4000040000000000805C4000040000000000C0
      5C4000040000000000005D4000040000000000405D4000040000000000805D40
      00040000000000C05D4000040000000000805E4000040000000000C05E400004
      0000000000005F4000040000000000405F4000040000000000805F4000040000
      000000C05F400004000000000000604000040000000000206040000400000000
      00406040000400000000006060400004000000000080604000040000000000A0
      604000040000000000C0604000040000000000E0604000040000000000006140
      0004000000000020614000040000000000406140000400000000006061400004
      000000000080614000040000000000A0614000040000000000C0614000040000
      000000E061400004000000000000624000040000000000206240000400000000
      00406240000400000000006062400004000000000080624000040000000000A0
      624000000000000000C06240C7010000436F6E746578746F2064652041747561
      636F65732064617320456D707265736173202D20506C616E656A616D656E746F
      206520436F6E74726F6C65206E612044696E616D69636120646173204F726761
      6E697A61636F6573204D6F6465726E6173202D2053697374656D617320646520
      506C616E656A616D656E746F206520436F6E74726F6C6520456D707265736172
      69616C202D20446573656E686F2064652053697374656D617320652061205072
      617469636120646F20506C616E656A616D656E746F206520436F6E74726F6C65
      3A204D6F64656C6167656D206461204F7267616E697A6163616F2C2044696D65
      6E73616F2045737472617465676963612C2044696D656E73616F2050726F6772
      616D61746963612C2053697374656D6173204F7263616D656E746172696F7320
      2D204D656E73757261633F6F2C20436F6E74726F6C652065204176616C696163
      3F6F202D20496D706C656D656E7461633F6F2F41706572666569636F616D656E
      746F2064652053697374656D617320646520506C616E656A616D656E746F2065
      20436F6E74726F6C653A2042616C616E6365642053636F726563617264206520
      416C6176616E636120646520436F6E74726F6C652E202000040000000000E062
      4000040000000000006340000400000000002063400004000000000040634000
      0400000000006063400004000000000080634000040000000000A06340000400
      00000000C0634000040000000000E06340000400000000000064400004000000
      0000206440000400000000004064400004000000000060644000040000000000
      80644000040000000000A0644000040000000000C0644000040000000000E064
      4000000000000000006540090000004142524150502F524A0004000000000020
      6540000400000000004065400004000000000060654000040000000000806540
      00040000000000A0654000040000000000C0654000000000000000E065401500
      00004175646974F372696F20414252415050202D205350000400000000000066
      4000040000000000206640000400000000004066400004000000000060664000
      04000000000080664000040000000000A0664000040000000000C06640000400
      00000000E0664000040000000000006740000400000000002067400004000000
      0000406740000400000000006067400004000000000080674000040000000000
      A0674000040000000000C0674000040000000000E06740000400000000000068
      4000040000000000206840000400000000004068400004000000000060684000
      04000000000080684000040000000000A0684000040000000000C06840000400
      00000000E0684000040000000000006940000400000000002069400004000000
      0000406940000400000000006069400004000000000080694000040000000000
      A0694000040000000000C0694000040000000000E0694000040000000000006A
      4000040000000000206A4000040000000000406A4000040000000000606A4000
      040000000000806A4000040000000000A06A4000040000000000C06A40000400
      00000000E06A4000040000000000006B4000040000000000206B400004000000
      0000406B4000040000000000606B4000040000000000806B4000040000000000
      A06B4000040000000000C06B4000040000000000E06B4000040000000000006C
      4000040000000000206C4000040000000000406C4000040000000000606C4000
      040000000000806C4000040000000000A06C4000040000000000C06C40000400
      00000000E06C4000040000000000006D4000040000000000206D400004000000
      0000406D4000040000000000606D4000040000000000806D4000040000000000
      A06D4000040000000000C06D4000000000000000E06D401D0000004372696174
      6976616D656E7465202D205475726D6120666563686164610004000000000000
      6E4000040000000000206E4000040000000000406E4000040000000000606E40
      00040000000000806E4000040000000000A06E4000040000000000C06E400004
      0000000000E06E4000040000000000006F4000040000000000206F4000040000
      000000406F4000040000000000606F4000040000000000806F40000400000000
      00A06F4000000000000000C06F401D00000043524941544956414D454E544520
      2D205455524D41204645434841444100040000000000E06F4000040000000000
      0070400004000000000010704000000000000000207040C1010000466F726361
      73206465204D7564616E6361202D206F20676C6F62616C69736D6F2C20612064
      656C656761633F6F2065206173207465636E6F6C6F6769617320717565206166
      6574616D206173206F7267616E697A61633F65733B205175616C696461646520
      6520436F6D7065746974697669646164653A20457863656C656E6369613B204F
      2053697374656D61204F7267616E697A6163696F6E616C203A2050726F636573
      736F732C2050726F6A65746F732C20436F6E636569746F732C20436164656961
      20436C69656E7465207820466F726E656365646F722C20476573743F6F206465
      205265637572736F732C20436C69656E7465732028496E7465726E6F732C2053
      6F636965646164652C20436F6E74726F6C61646F7265732C205573756172696F
      73293B204369636C6F205044434120702F20476572656E6369616D656E746F20
      64652050726F636573736F732C2054726162616C68616E646F20636F6D204571
      7569706573206465204D656C686F7269612C20496D706F7274616E6369612064
      6120436F6D756E696361633F6F206520646120496E666F726D61633F6F3B2043
      69636C6F20646120414D503B2045737475646F206465204361736F2E00040000
      0000003070400004000000000040704000040000000000507040000400000000
      0060704000040000000000707040000400000000008070400004000000000090
      704000040000000000A0704000040000000000B0704000040000000000C07040
      00040000000000D0704000040000000000E0704000040000000000F070400004
      0000000000007140000400000000001071400004000000000020714000040000
      0000003071400004000000000040714000040000000000507140000400000000
      0060714000040000000000707140000400000000008071400004000000000090
      714000040000000000A0714000040000000000B0714000040000000000C07140
      00040000000000D0714000040000000000E0714000040000000000F071400004
      0000000000007240000400000000001072400004000000000020724000040000
      0000003072400004000000000040724000040000000000507240000400000000
      0060724000000000000000707240090100005072696D6569726F204469610D0A
      2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A2D20436F6E636569746F732042
      E17369636F7320646520507265766964EA6E63696120536F6369616C0D0A2D20
      4F2071756520E920507265766964EA6E63696120436F6D706C656D656E746172
      0D0A2D20507265766964EA6E63696120416265727461206F7520466563686164
      610D0A2D204578656D706C6F73207072E17469636F730D0A0D0A536567756E64
      6F204469610D0A2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A2D20546970
      6F7320646520506C616E6F730D0A2D2042656E6566ED63696F20446566696E69
      646F0D0A2D20436F6E747269627569E7E36F20446566696E6964610004000000
      00008072400004000000000090724000040000000000A0724000040000000000
      C0724000040000000000D0724000040000000000E0724000040000000000F072
      4000040000000000007340000400000000001073400004000000000020734000
      0400000000003073400004000000000040734000040000000000507340000400
      0000000060734000040000000000707340000400000000008073400004000000
      000090734000040000000000A0734000040000000000B0734000040000000000
      C0734000040000000000D0734000040000000000E0734000040000000000507F
      4000040000000000607F4000040000000000707F4000040000000000807F4000
      040000000000907F4000040000000000A07F4000040000000000B07F40000400
      00000000C07F4000040000000000D07F4000040000000000E07F400004000000
      0000F07F40000400000000000080400004000000000010804000040000000000
      1880400004000000000020804000040000000000288040000400000000003080
      4000040000000000388040000400000000004080400004000000000048804000
      0400000000005080400004000000000058804000040000000000608040000400
      0000000068804000040000000000708040000400000000007880400004000000
      000080804000040000000000888040000000000000009080404F000000504F53
      2047524144554143414F20454E47454E48415249412044452050414C4E454A41
      4D454E544F2F434F4E434C5553414F2045204150524553454E544143414F2044
      45204D4F4E4F4752414649410004000000000098804000040000000000A08040
      00040000000000A8804000040000000000B0804000040000000000B880400004
      0000000000C0804000040000000000C8804000040000000000D0804000040000
      000000D8804000040000000000E0804000040000000000E88040000400000000
      00F0804000040000000000F88040000400000000000081400004000000000008
      8140000400000000001081400004000000000018814000040000000000208140
      0004000000000028814000040000000000308140000400000000003881400004
      0000000000408140000400000000004881400004000000000050814000040000
      0000005881400004000000000060814000040000000000688140000400000000
      0070814000040000000000788140000400000000008081400004000000000088
      81400004000000000098814000000000000000B081404F000000504F53204752
      4144554143414F20454E47454E484152494120444520504C414E454A414D454E
      544F2F434F4E434C5553414F2045204150524553454E544143414F204445204D
      4F4E4F47524146494100040000000000C8814000040000000000D88140000400
      00000000E8814000040000000000F08140000400000000000882400004000000
      0000108240000400000000002882400004000000000030824000040000000000
      3882400004000000000048824000040000000000588240000400000000006882
      4000040000000000788240000400000000008882400004000000000090824000
      040000000000A0824000040000000000B8824000040000000000D08240000400
      00000000E0824000040000000000088340000400000000001083400004000000
      000018834000040000000000288340000000000000003883401600000050524F
      4D4F5649444F2050454C4120434254552F524A000000000000004083402F0000
      005245414C495A41433F4F20424F4C53412044452056414C4F52455320524A2F
      494D4620454449544F5241204C54444100040000000000488340000400000000
      0050834000040000000000588340000000000000006083401A00000053494E44
      494341544F20444F532042414E434F5320444F20524A00040000000000708340
      000400000000008083400004000000000090834000040000000000A883400004
      0000000000B8834000000000000000D08340200000005455524D412046454348
      414441202D203235205041525449434950414E54455300000000000000D88340
      130000005455524D415320464756202D2041424552544100040000000000E883
      4000000000000000088440100000005455524D41204142455254412046475600
      000000000000188440290000004553434F4C41205355504552494F5220444520
      50524F504147414E44412045204D41524B4554494E4700000000000000208440
      C200000053454E4143200D0A50524F434553534F532045204F5247414E495A41
      433F4F20444F204553464F52434F204445204D41524B4554494E472C20414E41
      4C4953452053574F542C20444546494E49433F4F20444520504F534943494F4E
      414D454E544F204520444120455354524154454749412044452050524F445554
      4F532C20494D504C454D454E5441433F4F20444520504C414E4F532044452041
      433F4F2C2053495354454D4153204445204156414C4941433F4F204520434F4E
      54524F4C452E0000000000000028844090000000434F4E434549544F2045204F
      5249454E5441433F4F204445204D41524B4554494E472C20434F4D504F525441
      4D454E544F20444F20434F4E53554D49444F522C205345474D454E5441433F4F
      204445204D45524341444F2C20434F4D504F53544F204D45524341444F4C4F47
      49434F202834502773292C204A4F474F53204445204E45474F43494F532E2053
      454E414300000000000000308440E6000000414D4249454E544520434F4D5045
      54495449564F2045204120455241204441205452414E5349544F524945444144
      452C20455441504153204441204D5544414E43412C204641544F524553204352
      495449434F53204445205355434553534F2C204D414E5554454E433F4F204520
      464F5254414C4543494D454E544F204441204D5544414E43412C204F20504150
      454C20474552454E4349414C204E4F2050524F434553534F204445204D554441
      4E43412C20434F4D4F20434F4E535452554952204F5247414E495A41433F4553
      20444520415052454E44495A4147454D202D2073656E61630000000000000040
      844026000000494E5445475241433F4F202D20434F4E53554C544F5249412045
      20545245494E414D454E544F000000000000005084401700000053454E414320
      2D20435552534F53204445205645523F4F000000000000006084401200000041
      53534F432E20425241532E204445205248000000000000007084401100000043
      4F4E53554C544F52494120444520524800040000000000888440000400000000
      0098844000000000000000B084403700000056414C4F5220444120494E534352
      49C7C34F2052243630302C3030202D20444553434F4E544F20434F4E43454449
      444F202D203330252E00040000000000C8844000040000000000D88440000000
      00000000E884401300000053454D494EC152494F204142524150502F53500004
      0000000000F8844000040000000000088540000000000000002085400E000000
      53454D494E4152494F202D205350000400000000003885400004000000000048
      8540000400000000005885400000000000000068854010000000436F6E677265
      73736F204C54522F5350000000000000007885400C00000053454D494EC15249
      4F205350000400000000008085400004000000000098854000000000000000A8
      85401300000053454D494EC152494F2053C34F205041554C4F00040000000000
      B8854000000000000000C8854012000000494E53435249C7C34F204752415455
      49544100040000000000D8854000000000000000F0854028000000446573636F
      6E746F206E6F2076616C6F72206461732064656D61697320696E73637269E7F5
      65732E00040000000000F88540000000000000001886405A00000053656D696E
      E172696F3A204D6178696D697A616E646F206F205375636573736F206E6F7320
      4E6567F363696F7320612070617274697220646F20496E76657374696D656E74
      6F206E6F204361706974616C2048756D616E6F2E200004000000000030864000
      00000000000048864067000000435552534F20444520444F4953204DD344554C
      4F53202D2041554449544F524941204520434F4E544142494C4944414445202D
      2050524F4D4F5649444F2050454C4120414E43455050204520434F4E53554C54
      4F525953204520434F4E53554C542E204C544441000400000000005086400000
      00000000006086402500000041554C4153204E412053414C4120444520545245
      494E414D454E544F204441205245464552000400000000007086400004000000
      00008086400004000000000090864000000000000000A0864031000000547265
      696E616D656E746F207061726120666F726D61E7E36F20646520627269676164
      6120646520696E63EA6E64696F2E00000000000000B0864017000000436F6E66
      6572EA6E63696120414252415050202D20535000040000000000C08640000400
      00000000E0864000000000000000F086401D0000004973656E746F2064652074
      61786120646520696E73637269E7E36F2E200004000000000018874000040000
      0000002887400004000000000038874000040000000000488740000400000000
      00608740000400000000007087400004000000000098874000040000000000B0
      874000040000000000B8874000000000000000C0874023000000353920444941
      5320444520435552534F202D20303320484F524153204449C152494153000400
      00000000D0874000040000000000E0874000040000000000F887400000000000
      00001088400C0000005346522D50524556495445430004000000000020884000
      0400000000003088400004000000000038884000040000000000488840000400
      00000000608840000000000000007088402E00000052415AC34F20534F434941
      4C3A204C4D20545245494E414D454E544F20454D50524553415249414C204C54
      44412E0004000000000080884000040000000000888840000400000000009088
      400004000000000098884000040000000000A0884000040000000000A8884000
      000000000000B0884018000000435552534F204F4E204C494E45202D20494E54
      45524E455400040000000000B8884000040000000000C0884000040000000000
      C8884000040000000000D0884000040000000000D8884000040000000000E088
      4000000000000000E888401D0000005265616C697A61646F206E6F2052696F20
      4F74686F6E2050616C61636500040000000000F0884000040000000000F88840
      0004000000000000894000040000000000088940000400000000001089400004
      0000000000188940000400000000002089400004000000000028894000040000
      0000003089400004000000000038894000040000000000408940000400000000
      00488940000000000000005089406D00000049435353202D20496E7374697475
      746F2043756C747572616C205365672E536F6369616C202D205265616C697A61
      646F20206E6F2061756469746F72696F2041425241505020576F647220547261
      64652043656E746572202D203230BA20616E6461722053C34F205041554C4F00
      04000000000058894000000000000000608940160000005265616C697A61646F
      20656D205265636966652D504500040000000000688940000400000000007089
      40000000000000007889401A0000005265616C697A61646F20656D20466F7274
      616C657A612D2043450000000000000080894032000000486F74656C2052696F
      204F74686F6E202D2041762E2041746CE26E746963612C3332363420436F7061
      636162616E612D524A000000000000008889403F0000005265616C697A61646F
      206E6F2061756469746F72696F2064612054454C4F532041762E20507265762E
      5661726761732C323930202D2043656E74726F2F524A00040000000000908940
      0004000000000098894000040000000000A0894000040000000000A889400004
      0000000000B0894000000000000000B889403E000000456D7072657361204942
      4320646F2042726173696C204C7464610D0A5265616C697A61646F206E6F2048
      6F74656C204365736172205061726B202D20535000040000000000C089400004
      0000000000C8894000040000000000D0894000040000000000D8894000040000
      000000E0894000040000000000E8894000040000000000F08940000000000000
      00F889404500000050726F6D6F7669646F2070656C6F2049424320646F204272
      6173696C2020456D0D0A43726F776E6520506C617A6120486F74656C202D2053
      414F205041554C4F202D20535000040000000000008A4000040000000000088A
      4000040000000000108A4000040000000000188A4000000000000000208A4044
      000000456D70726573613A204D414E54454C20452043454E54524F5320415554
      4F52495A41444F530D0A0D0A5265616C697A61646F20656D2053414F20504155
      4C4F202D20535000000000000000288A404B0000005265616C697A61E7E36F20
      3A2043455041442D43656E74726F2064652045737475646F7320652050657371
      756973617320652041646D696E6973747261E7E36F20656D204469726569746F
      00040000000000308A4000040000000000388A4000040000000000408A400000
      0000000000508A402F0000005265616C697A61646F20656D2053E36F20506175
      6C6F2C20486F74656C205368657261746F6E204D6F66617272656A0000000000
      0000608A40570000005265616C697A61646F206E6F20486F74656C204C65204D
      6572656469656E20436F7061636162616E61202D2041762E2041746C616E7469
      63612C31303230202D203337BA20616E6461722053616C616F2045746F696C65
      00040000000000688A4000040000000000708A4000040000000000788A400004
      0000000000808A4000040000000000888A4000040000000000908A4000040000
      000000A08A4000040000000000A88A4000040000000000B08A40000400000000
      00B88A4000040000000000C08A4000040000000000C88A4000040000000000D0
      8A4000040000000000D88A4000040000000000E08A4000040000000000E88A40
      00040000000000F08A4000040000000000F88A4000040000000000008B400004
      0000000000088B4000040000000000108B4000040000000000188B4000040000
      000000208B4000000000000000288B40670000004F20637572736F20666F6920
      6D696E6973747261646F2070656C612050756C73617220436F6E73756C746F72
      65732C2070617261206F7320656D7072656761646F732064612043656E747261
      6C206465204174656E64696D656E746F2F4449534547204741422E0000000000
      0000308B402E0000005265616C697A61646F2070656C6120444643202D20436F
      6E73756C746F726961206520547265696E616D656E746F00000000000000388B
      4076000000496E636C756920686F737065646167656D2C20616C696D656E7461
      E7E36F2C20706172746963697061E7E36F2C206D6174657269616C2065206365
      72746966696361646F2C2062696C6865746520616572656F2065207472616E73
      6665722E205265616C697A61E7E36F202049746170656D612D53430000000000
      0000408B40160000005265616C697A61646F206E6F2053454E41432F524A2E00
      000000000000488B408500000050726F6D6F7669646F2070656C612043425455
      202D20476572EA6E636961206465204D616365696F0D0A4F42533A2043555354
      4F20282031204B4720414C494D454E544F204EC34F2050455245434956454C29
      0D0A56616C6F7220726566206120706172746963697061E7E36F206461205245
      46455220282050616C65737472616E74652900000000000000508B4027000000
      5265616C697A61646F206E6F204772616E642043612764276F726F202D2053E3
      6F205061756C6F}
  end
  object sqlObserv: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDCURSO,'
      '  OBSERVACAO'
      'FROM'
      '  CURSO'
      'ORDER BY IDCURSO ')
    ClientDataSet = CdsObserv
    Left = 95
    Top = 200
  end
end
