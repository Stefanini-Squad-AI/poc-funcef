inherited RptAutPag: TRptAutPag
  Left = 535
  Top = 197
  Width = 542
  Height = 426
  Caption = 'RptAutPag'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Aprovação de Documentos - Modelo 2'
    Params = <
      item
        Caption = 'Doc'
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
        MostraComboCompara = False
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
        Caption = 'Centro Responsabilidade'
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
        MostraComboCompara = False
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
        Caption = 'Data Inclusao'
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
        MostraComboCompara = False
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
        Caption = 'Status do Documento'
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
        MostraComboCompara = False
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
        Caption = 'Data Inclusao Fim'
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
        Caption = 'Data Lancamento Inicio'
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
        Caption = 'Data Lancamento Fim'
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
        Caption = 'Data Vencimento Inicio'
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
        Caption = 'Data Vencimento  Fim'
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
        Caption = 'Data Programada  Inicio'
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
        Caption = 'Data Programada  Fim'
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
        Caption = 'Conta Caixa x Forma de Pag'
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
        Caption = 'Tipo de Documento'
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
        Caption = 'Modulo de Lancamento'
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
        Caption = 'Usuario Lancamento'
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
        Caption = 'Numero Documento Inicio'
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
        Caption = 'Numero Documento Fim'
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
        Caption = 'Valor Moeda Inicio'
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
        Caption = 'Valor Moeda Fim'
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
        Caption = 'Favorecido'
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
        Caption = 'Data Emissao Inicio'
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
        Caption = 'Data Emissao Fim'
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
    Left = 188
  end
  inherited DevRptCM: TExtraOptions
    Left = 360
    Top = 24
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = Rptautpagdoc
    Left = 48
  end
  object Dsautpagdoc: TwwDataSource
    DataSet = CdsDemGestAutPag
    Left = 362
    Top = 72
  end
  object Ppautpagdoc: TppBDEPipeline
    DataSource = Dsautpagdoc
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'Ppautpagdoc'
    Left = 452
    Top = 16
    object PpautpagdocppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMFATURA'
      FieldName = 'NUMFATURA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object PpautpagdocppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object PpautpagdocppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object PpautpagdocppField4: TppField
      FieldAlias = 'REFERENCIA'
      FieldName = 'REFERENCIA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object PpautpagdocppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object PpautpagdocppField6: TppField
      FieldAlias = 'COMPLDOCUMENTO'
      FieldName = 'COMPLDOCUMENTO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 5
    end
    object PpautpagdocppField7: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object PpautpagdocppField8: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 7
    end
    object PpautpagdocppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object PpautpagdocppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOROUTRAMOEDA'
      FieldName = 'VALOROUTRAMOEDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object PpautpagdocppField11: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
    object PpautpagdocppField12: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 11
    end
    object PpautpagdocppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRATEIO'
      FieldName = 'VALORRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object PpautpagdocppField14: TppField
      FieldAlias = 'DESCTDR'
      FieldName = 'DESCTDR'
      FieldLength = 35
      DisplayWidth = 35
      Position = 13
    end
    object PpautpagdocppField15: TppField
      FieldAlias = 'NOMEAP'
      FieldName = 'NOMEAP'
      FieldLength = 25
      DisplayWidth = 25
      Position = 14
    end
    object PpautpagdocppField16: TppField
      FieldAlias = 'NOMECR'
      FieldName = 'NOMECR'
      FieldLength = 30
      DisplayWidth = 30
      Position = 15
    end
    object PpautpagdocppField17: TppField
      FieldAlias = 'NOMECC'
      FieldName = 'NOMECC'
      FieldLength = 30
      DisplayWidth = 30
      Position = 16
    end
    object PpautpagdocppField49: TppField
      FieldAlias = 'NOMEMODULO'
      FieldName = 'NOMEMODULO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 17
    end
    object PpautpagdocppField18: TppField
      FieldAlias = 'OBS'
      FieldName = 'OBS'
      FieldLength = 1000
      DataType = dtMemo
      DisplayWidth = 10
      Position = 18
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField19: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object PpautpagdocppField20: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 20
    end
    object PpautpagdocppField21: TppField
      FieldAlias = 'CONTACORRENTE'
      FieldName = 'CONTACORRENTE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 21
    end
    object PpautpagdocppField22: TppField
      FieldAlias = 'FLGDOCBANCARIO'
      FieldName = 'FLGDOCBANCARIO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 22
    end
    object PpautpagdocppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLACRE'
      FieldName = 'VLACRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object PpautpagdocppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLDEC'
      FieldName = 'VLDEC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object PpautpagdocppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLIMP'
      FieldName = 'VLIMP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object PpautpagdocppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLLIQ'
      FieldName = 'VLLIQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object PpautpagdocppField27: TppField
      FieldAlias = 'TRGUSERINCLUSAO'
      FieldName = 'TRGUSERINCLUSAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 27
    end
    object PpautpagdocppField28: TppField
      FieldAlias = 'NOMEUSUARIO'
      FieldName = 'NOMEUSUARIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 28
    end
    object PpautpagdocppField29: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 29
    end
    object PpautpagdocppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTVALORBRUTO'
      FieldName = 'TOTVALORBRUTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object PpautpagdocppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTVALORDEDUCOES'
      FieldName = 'TOTVALORDEDUCOES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object PpautpagdocppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTVALORACRESCIMO'
      FieldName = 'TOTVALORACRESCIMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object PpautpagdocppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTVALORIMPOSTO'
      FieldName = 'TOTVALORIMPOSTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object PpautpagdocppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTVALORAPAGAR'
      FieldName = 'TOTVALORAPAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object PpautpagdocppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALORBRUTO'
      FieldName = 'SUMVALORBRUTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object PpautpagdocppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALORDEDUCOES'
      FieldName = 'SUMVALORDEDUCOES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object PpautpagdocppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALORACRESCIMO'
      FieldName = 'SUMVALORACRESCIMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object PpautpagdocppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALORIMPOSTO'
      FieldName = 'SUMVALORIMPOSTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object PpautpagdocppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALORAPAGAR'
      FieldName = 'SUMVALORAPAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object PpautpagdocppField40: TppField
      FieldAlias = 'NUMIMOVEL'
      FieldName = 'NUMIMOVEL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 40
    end
    object PpautpagdocppField41: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 41
    end
    object PpautpagdocppField42: TppField
      FieldAlias = 'DESCPLANO'
      FieldName = 'DESCPLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 42
    end
    object PpautpagdocppField43: TppField
      FieldAlias = 'DESCPROGRAMA'
      FieldName = 'DESCPROGRAMA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 43
    end
    object PpautpagdocppField44: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 44
    end
    object PpautpagdocppField45: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 45
    end
    object PpautpagdocppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFORCLI'
      FieldName = 'IDFORCLI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object PpautpagdocppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOLANCTOLIQ'
      FieldName = 'VALOLANCTOLIQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 47
    end
    object PpautpagdocppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALOLANCTOLIQ'
      FieldName = 'SUMVALOLANCTOLIQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object PpautpagdocppField50: TppField
      FieldAlias = 'FDO'
      FieldName = 'FDO'
      FieldLength = 500
      DataType = dtMemo
      DisplayWidth = 500
      Position = 49
    end
    object ppCODDOSSIE: TppField
      FieldAlias = 'CODDOSSIE'
      FieldName = 'CODDOSSIE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 50
    end
  end
  object Rptautpagdoc: TppReport
    AutoStop = False
    DataPipeline = Ppautpagdoc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RptSlip'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 15000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
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
    Left = 456
    Top = 72
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'Ppautpagdoc'
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel51: TppLabel
        UserName = 'ppLabel51'
        Caption = 'FUNCEF - Fundação dos Economiários Federais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 33338
        mmTop = 1058
        mmWidth = 122238
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'ppLabel53'
        Caption = 'AUTORIZAÇÃO DE PAGAMENTO - AP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 57150
        mmTop = 7938
        mmWidth = 75406
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText28: TppDBText
        UserName = 'ppDBText28'
        DataField = 'NOMEAP'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 265
        mmTop = 0
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'ppDBText61'
        DataField = 'NOMECC'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 25929
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'ppDBText62'
        DataField = 'DESCTDR'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 0
        mmWidth = 60061
        BandType = 4
      end
      object ppDBText76: TppDBText
        UserName = 'ppDBText76'
        DataField = 'VALORRATEIO'
        DataPipeline = Ppautpagdoc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 172509
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'ppDBText77'
        DataField = 'DESCPLANO'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 111125
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText78: TppDBText
        UserName = 'ppDBText78'
        DataField = 'NOMEPATRO'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 133615
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText79: TppDBText
        UserName = 'ppDBText79'
        DataField = 'DESCPROGRAMA'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 154000
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLabel54: TppLabel
        UserName = 'ppLabel54'
        Caption = 'Contas a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 0
        mmTop = 3704
        mmWidth = 20616
        BandType = 8
      end
      object ppCalc21: TppSystemVariable
        UserName = 'Calc21'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 3969
        mmWidth = 18785
        BandType = 8
      end
      object ppCalc22: TppSystemVariable
        UserName = 'Calc22'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 164042
        mmTop = 3969
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'CODDOCUMENTO'
      DataPipeline = Ppautpagdoc
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'Ppautpagdoc'
      object ppGroupHeaderBand8: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 42069
        mmPrintPosition = 0
        object ppLine27: TppLine
          UserName = 'ppLine27'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 10583
          mmWidth = 189971
          BandType = 3
          GroupNo = 0
        end
        object ppLine30: TppLine
          UserName = 'ppLine30'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 54504
          mmTop = 1588
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object ppLine31: TppLine
          UserName = 'ppLine31'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 105040
          mmTop = 1588
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
        object ppLine32: TppLine
          UserName = 'ppLine32'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 189971
          mmTop = 1588
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine33: TppLine
          UserName = 'ppLine33'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 130440
          mmTop = 1588
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object ppLabel55: TppLabel
          UserName = 'ppLabel55'
          Caption = 'Nº da AP  / Centro Responsabilidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 1852
          mmWidth = 52123
          BandType = 3
          GroupNo = 0
        end
        object ppLabel56: TppLabel
          UserName = 'ppLabel56'
          Caption = 'Processo Nº'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 55298
          mmTop = 2117
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppLabel72: TppLabel
          UserName = 'ppLabel72'
          Caption = 'Vencimento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 105834
          mmTop = 2117
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel80: TppLabel
          UserName = 'ppLabel80'
          AutoSize = False
          Caption = 'Documento             Compl.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 131234
          mmTop = 2117
          mmWidth = 37042
          BandType = 3
          GroupNo = 0
        end
        object ppDBText80: TppDBText
          UserName = 'ppDBText80'
          DataField = 'NUMAPGR'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 1058
          mmTop = 6350
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppDBText81: TppDBText
          UserName = 'ppDBText81'
          DataField = 'NOMECR'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 18785
          mmTop = 6350
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object ppDBText82: TppDBText
          UserName = 'ppDBText82'
          DataField = 'REFERENCIA'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 55298
          mmTop = 6350
          mmWidth = 43127
          BandType = 3
          GroupNo = 0
        end
        object ppDBText88: TppDBText
          UserName = 'ppDBText88'
          DataField = 'DATAPROGRAMADA'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 105569
          mmTop = 6350
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppDBText89: TppDBText
          UserName = 'ppDBText89'
          DataField = 'COMPLDOCUMENTO'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 158750
          mmTop = 6350
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppDBText90: TppDBText
          UserName = 'ppDBText90'
          DataField = 'NODOCUMENTO'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 131234
          mmTop = 6350
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppLine34: TppLine
          UserName = 'ppLine34'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 265
          mmTop = 1588
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object ppLabel81: TppLabel
          UserName = 'ppLabel81'
          Caption = 'Beneficiário'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 11642
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppLabel82: TppLabel
          UserName = 'ppLabel82'
          Caption = 'Nome/Razão Social'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 15875
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppLine35: TppLine
          UserName = 'ppLine35'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 11906
          mmLeft = 265
          mmTop = 12171
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine36: TppLine
          UserName = 'ppLine36'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 11906
          mmLeft = 151342
          mmTop = 11906
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppLine37: TppLine
          UserName = 'ppLine37'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 23813
          mmWidth = 189971
          BandType = 3
          GroupNo = 0
        end
        object ppDBText91: TppDBText
          UserName = 'ppDBText91'
          DataField = 'RAZAOSOCIAL'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 19579
          mmWidth = 148696
          BandType = 3
          GroupNo = 0
        end
        object ppDBText92: TppDBText
          UserName = 'ppDBText92'
          DataField = 'NUMDOCUMENTO'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          OnFormat = ppDBText92Format
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 152665
          mmTop = 19579
          mmWidth = 36777
          BandType = 3
          GroupNo = 0
        end
        object ppLine38: TppLine
          UserName = 'ppLine38'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 11906
          mmLeft = 189971
          mmTop = 12171
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLabel83: TppLabel
          UserName = 'ppLabel83'
          Caption = 'CPF/CGC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 152665
          mmTop = 15875
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppLabel86: TppLabel
          UserName = 'ppLabel86'
          Caption = 'Valor Bruto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 16933
          mmTop = 26988
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel105: TppLabel
          UserName = 'ppLabel105'
          Caption = 'Deduções'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 60590
          mmTop = 26458
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel106: TppLabel
          UserName = 'ppLabel106'
          Caption = 'Acréscimo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 99484
          mmTop = 26458
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel107: TppLabel
          UserName = 'ppLabel107'
          Caption = 'Imposto de Renda'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 128323
          mmTop = 26458
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppLabel110: TppLabel
          UserName = 'ppLabel110'
          AutoSize = False
          Caption = 'Valor Líquido a Pagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 157427
          mmTop = 26458
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
        end
        object ppLine39: TppLine
          UserName = 'ppLine39'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 35454
          mmWidth = 189971
          BandType = 3
          GroupNo = 0
        end
        object ppLine40: TppLine
          UserName = 'ppLine40'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 265
          mmTop = 26194
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine41: TppLine
          UserName = 'ppLine41'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 189971
          mmTop = 26194
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine42: TppLine
          UserName = 'ppLine42'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 153723
          mmTop = 26194
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine43: TppLine
          UserName = 'ppLine43'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 115623
          mmTop = 26194
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine44: TppLine
          UserName = 'ppLine44'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 75142
          mmTop = 26194
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine45: TppLine
          UserName = 'ppLine45'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 35190
          mmTop = 26194
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object ppLabel111: TppLabel
          UserName = 'ppLabel111'
          Caption = 'Atividade / Projeto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 265
          mmTop = 38365
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppLabel112: TppLabel
          UserName = 'ppLabel112'
          Caption = 'Centro de Custo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 25929
          mmTop = 38365
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppLabel113: TppLabel
          UserName = 'ppLabel113'
          Caption = 'Tipo de Desembolso'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 48948
          mmTop = 38365
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppLabel114: TppLabel
          UserName = 'ppLabel114'
          Caption = 'Valor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 172509
          mmTop = 38365
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppDBText93: TppDBText
          UserName = 'ppDBText93'
          DataField = 'VLLIQ'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 154517
          mmTop = 30956
          mmWidth = 34660
          BandType = 3
          GroupNo = 0
        end
        object ppDBText97: TppDBText
          UserName = 'ppDBText97'
          DataField = 'VLIMP'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 116152
          mmTop = 30956
          mmWidth = 37042
          BandType = 3
          GroupNo = 0
        end
        object ppDBText98: TppDBText
          UserName = 'ppDBText98'
          DataField = 'VLACRE'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 76200
          mmTop = 30956
          mmWidth = 38894
          BandType = 3
          GroupNo = 0
        end
        object ppDBText99: TppDBText
          UserName = 'ppDBText99'
          DataField = 'VLDEC'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 36513
          mmTop = 30956
          mmWidth = 37835
          BandType = 3
          GroupNo = 0
        end
        object ppDBText100: TppDBText
          UserName = 'ppDBText100'
          DataField = 'VALOR'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 1058
          mmTop = 30956
          mmWidth = 33602
          BandType = 3
          GroupNo = 0
        end
        object ppLabel117: TppLabel
          UserName = 'ppLabel117'
          Caption = 'Programa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 154000
          mmTop = 38365
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Plano'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3344
          mmLeft = 111125
          mmTop = 38365
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Patrocinadora'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3344
          mmLeft = 133615
          mmTop = 38365
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'ppLine301'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 168805
          mmTop = 1588
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object plblDossie: TppLabel
          UserName = 'plblDossie'
          Caption = 'Cód. Dossiê'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 171186
          mmTop = 1852
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object pdbtxtCODDOSSIE: TppDBText
          UserName = 'pdbtxtCODDOSSIE'
          DataField = 'CODDOSSIE'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 169334
          mmTop = 6350
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 171186
        mmPrintPosition = 0
        object ppRegion1: TppRegion
          UserName = 'ppRegion1'
          Brush.Style = bsClear
          Caption = 'ppRegion1'
          Pen.Color = clWhite
          ShiftRelativeTo = ppRegion5
          Stretch = True
          Transparent = True
          mmHeight = 82286
          mmLeft = 265
          mmTop = 42863
          mmWidth = 189971
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel118: TppLabel
            UserName = 'ppLabel118'
            Caption = 'Á Tesouraria.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 1059
            mmTop = 48683
            mmWidth = 22490
            BandType = 5
            GroupNo = 0
          end
          object ppLabel119: TppLabel
            UserName = 'ppLabel119'
            Caption = 'Autorizo o pagamento.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 1059
            mmTop = 55298
            mmWidth = 38365
            BandType = 5
            GroupNo = 0
          end
          object ppLine46: TppLine
            UserName = 'ppLine46'
            Weight = 0.75
            mmHeight = 1323
            mmLeft = 794
            mmTop = 86254
            mmWidth = 86254
            BandType = 5
            GroupNo = 0
          end
          object ppLabel120: TppLabel
            UserName = 'ppLabel120'
            Caption = 'Data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 794
            mmTop = 87048
            mmWidth = 7673
            BandType = 5
            GroupNo = 0
          end
          object ppLabel121: TppLabel
            UserName = 'ppLabel121'
            Caption = 'Assinatura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 4233
            mmLeft = 9261
            mmTop = 87048
            mmWidth = 77788
            BandType = 5
            GroupNo = 0
          end
          object ppLabel123: TppLabel
            UserName = 'ppLabel123'
            Caption = 'Recebido em : _______/_______/_______'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 103188
            mmTop = 60854
            mmWidth = 66411
            BandType = 5
            GroupNo = 0
          end
          object ppLabel124: TppLabel
            UserName = 'ppLabel124'
            Caption = 'Ass. / Carimbo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 4233
            mmLeft = 103188
            mmTop = 87048
            mmWidth = 86254
            BandType = 5
            GroupNo = 0
          end
          object ppLine47: TppLine
            UserName = 'ppLine47'
            Weight = 0.75
            mmHeight = 1323
            mmLeft = 103188
            mmTop = 86254
            mmWidth = 86254
            BandType = 5
            GroupNo = 0
          end
          object ppLine48: TppLine
            UserName = 'ppLine48'
            ParentWidth = True
            Weight = 0.75
            mmHeight = 1588
            mmLeft = 265
            mmTop = 46831
            mmWidth = 189971
            BandType = 5
            GroupNo = 0
          end
          object ppLine49: TppLine
            UserName = 'ppLine49'
            Weight = 0.75
            mmHeight = 1323
            mmLeft = 1059
            mmTop = 116946
            mmWidth = 86254
            BandType = 5
            GroupNo = 0
          end
          object ppLabel125: TppLabel
            UserName = 'ppLabel125'
            Caption = 'Ass. / Carimbo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 4233
            mmLeft = 1059
            mmTop = 119063
            mmWidth = 86254
            BandType = 5
            GroupNo = 0
          end
          object ppLabel127: TppLabel
            UserName = 'ppLabel127'
            Caption = 'Feito Por:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 1059
            mmTop = 112448
            mmWidth = 16404
            BandType = 5
            GroupNo = 0
          end
          object ppLabel128: TppLabel
            UserName = 'ppLabel128'
            Caption = 'Conferido Por:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 103188
            mmTop = 112448
            mmWidth = 24342
            BandType = 5
            GroupNo = 0
          end
          object ppLine50: TppLine
            UserName = 'ppLine50'
            Weight = 0.75
            mmHeight = 1323
            mmLeft = 103188
            mmTop = 116946
            mmWidth = 86254
            BandType = 5
            GroupNo = 0
          end
          object ppLabel129: TppLabel
            UserName = 'ppLabel129'
            Caption = 'Ass. / Carimbo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 4233
            mmLeft = 103188
            mmTop = 119063
            mmWidth = 86254
            BandType = 5
            GroupNo = 0
          end
          object ppDBText101: TppDBText
            UserName = 'ppDBText101'
            AutoSize = True
            DataField = 'NOMEUSUARIO'
            DataPipeline = Ppautpagdoc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = []
            Transparent = True
            DataPipelineName = 'Ppautpagdoc'
            mmHeight = 4022
            mmLeft = 17728
            mmTop = 112448
            mmWidth = 26543
            BandType = 5
            GroupNo = 0
          end
          object ppCalc29: TppSystemVariable
            UserName = 'Calc29'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 4233
            mmLeft = 1588
            mmTop = 81756
            mmWidth = 16933
            BandType = 5
            GroupNo = 0
          end
        end
        object ppRegion2: TppRegion
          UserName = 'ppRegion2'
          Brush.Style = bsClear
          Caption = 'ppRegion2'
          Pen.Style = psClear
          ShiftRelativeTo = ppRegFDO
          Stretch = True
          Transparent = True
          mmHeight = 12171
          mmLeft = 0
          mmTop = 10319
          mmWidth = 189971
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel130: TppLabel
            UserName = 'ppLabel130'
            Caption = 'Observação:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3969
            mmLeft = 794
            mmTop = 17727
            mmWidth = 17727
            BandType = 5
            GroupNo = 0
          end
          object ppDBMemo1: TppDBMemo
            UserName = 'ppDBMemo1'
            CharWrap = True
            DataField = 'OBS'
            DataPipeline = Ppautpagdoc
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 9
            Font.Style = []
            Stretch = True
            Transparent = True
            DataPipelineName = 'Ppautpagdoc'
            mmHeight = 3969
            mmLeft = 21696
            mmTop = 17727
            mmWidth = 166423
            BandType = 5
            GroupNo = 0
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmLeading = 0
          end
        end
        object ppRegion4: TppRegion
          UserName = 'ppRegion4'
          Caption = 'ppRegion4'
          Pen.Color = clWhite
          ShiftRelativeTo = ppRegion2
          Stretch = True
          mmHeight = 15610
          mmLeft = 0
          mmTop = 21960
          mmWidth = 190000
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel131: TppLabel
            UserName = 'ppLabel131'
            Caption = 'Forma de Pagamento:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3969
            mmLeft = 794
            mmTop = 32543
            mmWidth = 30956
            BandType = 5
            GroupNo = 0
          end
          object ppDBText102: TppDBText
            UserName = 'ppDBText102'
            DataField = 'DESCRICAO'
            DataPipeline = Ppautpagdoc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            DataPipelineName = 'Ppautpagdoc'
            mmHeight = 3969
            mmLeft = 39688
            mmTop = 32543
            mmWidth = 148432
            BandType = 5
            GroupNo = 0
          end
        end
        object ppRegion5: TppRegion
          UserName = 'ppRegion5'
          Brush.Style = bsClear
          Caption = 'ppRegion5'
          Pen.Style = psClear
          ShiftRelativeTo = ppRegion4
          Stretch = True
          Transparent = True
          mmHeight = 6350
          mmLeft = 0
          mmTop = 37042
          mmWidth = 190000
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppDBText104: TppDBText
            UserName = 'ppDBText104'
            DataField = 'NUMBANCO'
            DataPipeline = Ppautpagdoc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            DataPipelineName = 'Ppautpagdoc'
            mmHeight = 3969
            mmLeft = 13758
            mmTop = 38365
            mmWidth = 49742
            BandType = 5
            GroupNo = 0
          end
          object ppLabel132: TppLabel
            UserName = 'ppLabel132'
            Caption = 'Banco:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 794
            mmTop = 38365
            mmWidth = 10583
            BandType = 5
            GroupNo = 0
          end
          object ppLabel133: TppLabel
            UserName = 'ppLabel133'
            Caption = 'Agência:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3969
            mmLeft = 66146
            mmTop = 38365
            mmWidth = 12965
            BandType = 5
            GroupNo = 0
          end
          object ppDBText105: TppDBText
            UserName = 'ppDBText105'
            DataField = 'NUMAGENCIA'
            DataPipeline = Ppautpagdoc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            DataPipelineName = 'Ppautpagdoc'
            mmHeight = 3969
            mmLeft = 82815
            mmTop = 38365
            mmWidth = 37571
            BandType = 5
            GroupNo = 0
          end
          object ppLabel136: TppLabel
            UserName = 'ppLabel136'
            Caption = 'Conta:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3969
            mmLeft = 128323
            mmTop = 38365
            mmWidth = 9525
            BandType = 5
            GroupNo = 0
          end
          object ppDBText106: TppDBText
            UserName = 'ppDBText106'
            DataField = 'CONTACORRENTE'
            DataPipeline = Ppautpagdoc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            DataPipelineName = 'Ppautpagdoc'
            mmHeight = 3969
            mmLeft = 143140
            mmTop = 38365
            mmWidth = 45244
            BandType = 5
            GroupNo = 0
          end
        end
        object ppRegFDO: TppRegion
          UserName = 'ppRegFDO'
          Brush.Style = bsClear
          Caption = 'ppRegFDO'
          Pen.Style = psClear
          Stretch = True
          Transparent = True
          mmHeight = 10848
          mmLeft = 0
          mmTop = 265
          mmWidth = 189971
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel4: TppLabel
            UserName = 'Label4'
            Caption = 'FDO/Baixas'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4106
            mmLeft = 794
            mmTop = 5556
            mmWidth = 18415
            BandType = 5
            GroupNo = 0
          end
          object ppdbFDO: TppDBMemo
            UserName = 'ppdbFDO'
            CharWrap = False
            DataField = 'FDO'
            DataPipeline = Ppautpagdoc
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 9
            Font.Style = []
            Stretch = True
            Transparent = True
            DataPipelineName = 'Ppautpagdoc'
            mmHeight = 3969
            mmLeft = 21696
            mmTop = 5556
            mmWidth = 155840
            BandType = 5
            GroupNo = 0
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmLeading = 0
          end
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'CODDOCUMENTO'
      DataPipeline = Ppautpagdoc
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'Ppautpagdoc'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object SubDocumAR: TppSubReport
          UserName = 'SubDocumAR'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'PpDocumFilhoAP'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 190000
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = PpDocumFilhoAP
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'RptSlip'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 15000
            PrinterSetup.mmMarginLeft = 10000
            PrinterSetup.mmMarginRight = 10000
            PrinterSetup.mmMarginTop = 10000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Left = 288
            Top = 224
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'PpDocumFilhoAP'
            object ppDetailBand2: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4233
              mmPrintPosition = 0
              object ppLabel15: TppLabel
                UserName = 'Label15'
                Caption = 'CAR:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 2646
                mmLeft = 265
                mmTop = 0
                mmWidth = 5292
                BandType = 4
              end
              object ppDBText13: TppDBText
                UserName = 'DBText13'
                DataField = 'CARDOCUMENTO'
                DataPipeline = PpDocumFilhoAR
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'PpDocumFilhoAR'
                mmHeight = 2381
                mmLeft = 10848
                mmTop = 0
                mmWidth = 24606
                BandType = 4
              end
              object ppDBText16: TppDBText
                UserName = 'DBText16'
                DataField = 'DESCRICAO'
                DataPipeline = PpDocumFilhoAR
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'PpDocumFilhoAR'
                mmHeight = 2381
                mmLeft = 39000
                mmTop = 0
                mmWidth = 52652
                BandType = 4
              end
              object ppDBText17: TppDBText
                UserName = 'DBText17'
                DataField = 'DESCPLANO'
                DataPipeline = PpDocumFilhoAR
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'PpDocumFilhoAR'
                mmHeight = 2381
                mmLeft = 106090
                mmTop = 0
                mmWidth = 52917
                BandType = 4
              end
              object ppLabel26: TppLabel
                UserName = 'Label26'
                Caption = '0,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2381
                mmLeft = 184680
                mmTop = 0
                mmWidth = 4233
                BandType = 4
              end
              object ppLine2: TppLine
                UserName = 'Line2'
                Weight = 0.75
                mmHeight = 1058
                mmLeft = 265
                mmTop = 3175
                mmWidth = 189648
                BandType = 4
              end
            end
            object ppSummaryBand2: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroup3: TppGroup
              BreakName = 'CODDOCUMENTO'
              DataPipeline = PpDocumFilhoAP
              OutlineSettings.CreateNode = True
              UserName = 'Group3'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'PpDocumFilhoAP'
              object ppGroupHeaderBand3: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroupFooterBand3: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 3175
                mmPrintPosition = 0
                object ppDBCalc2: TppDBCalc
                  OnPrint = ppDBCalc2Print
                  UserName = 'DBCalc2'
                  DataField = 'VALORRESERVAOLD'
                  DataPipeline = PpDocumFilhoAP
                  DisplayFormat = '#,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ResetGroup = ppGroup3
                  TextAlignment = taRightJustified
                  Transparent = True
                  Visible = False
                  DataPipelineName = 'PpDocumFilhoAP'
                  mmHeight = 3175
                  mmLeft = 139700
                  mmTop = 0
                  mmWidth = 51594
                  BandType = 5
                  GroupNo = 0
                end
                object ppDBText14: TppDBText
                  UserName = 'DBText14'
                  DataField = 'NOME'
                  DataPipeline = PpDocumFilhoAR
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ParentDataPipeline = False
                  Transparent = True
                  Visible = False
                  DataPipelineName = 'PpDocumFilhoAR'
                  mmHeight = 3704
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 25400
                  BandType = 5
                  GroupNo = 0
                end
                object ppLabel16: TppLabel
                  UserName = 'Label16'
                  Caption = 'Valor'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Times New Roman'
                  Font.Size = 10
                  Font.Style = [fsBold]
                  Transparent = True
                  Visible = False
                  mmHeight = 4233
                  mmLeft = 130440
                  mmTop = 0
                  mmWidth = 8731
                  BandType = 5
                  GroupNo = 0
                end
                object ppLabel20: TppLabel
                  UserName = 'Label20'
                  Caption = 'Plano Fin.'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Times New Roman'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  Visible = False
                  mmHeight = 3704
                  mmLeft = 26988
                  mmTop = 0
                  mmWidth = 13494
                  BandType = 5
                  GroupNo = 0
                end
                object ppLabel21: TppLabel
                  UserName = 'Label21'
                  Caption = 'Patro. Fin.'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Times New Roman'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  Visible = False
                  mmHeight = 3704
                  mmLeft = 41275
                  mmTop = 0
                  mmWidth = 14288
                  BandType = 5
                  GroupNo = 0
                end
                object ppLabel22: TppLabel
                  UserName = 'Label101'
                  Caption = 'Plano Ori.'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Times New Roman'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  Visible = False
                  mmHeight = 3704
                  mmLeft = 56621
                  mmTop = 0
                  mmWidth = 16404
                  BandType = 5
                  GroupNo = 0
                end
                object ppLabel23: TppLabel
                  UserName = 'Label23'
                  Caption = 'Patro. Ori.'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Times New Roman'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  Visible = False
                  mmHeight = 3704
                  mmLeft = 74083
                  mmTop = 0
                  mmWidth = 16140
                  BandType = 5
                  GroupNo = 0
                end
                object ppLabel24: TppLabel
                  UserName = 'Label24'
                  Caption = 'Programa'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Times New Roman'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  Visible = False
                  mmHeight = 3704
                  mmLeft = 91811
                  mmTop = 0
                  mmWidth = 13494
                  BandType = 5
                  GroupNo = 0
                end
                object ppLabel25: TppLabel
                  UserName = 'Label25'
                  Caption = 'Valor'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Times New Roman'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  Visible = False
                  mmHeight = 3704
                  mmLeft = 107421
                  mmTop = 0
                  mmWidth = 7673
                  BandType = 5
                  GroupNo = 0
                end
              end
            end
          end
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'CODDOCUMENTO'
      DataPipeline = Ppautpagdoc
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'Ppautpagdoc'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppSubDocumFilhoAP: TppSubReport
          UserName = 'SubDocumFilhoAP'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'PpDocumFilhoAP'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 190000
          BandType = 5
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = PpDocumFilhoAP
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'RptSlip'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 15000
            PrinterSetup.mmMarginLeft = 10000
            PrinterSetup.mmMarginRight = 10000
            PrinterSetup.mmMarginTop = 10000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Left = 256
            Top = 192
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'PpDocumFilhoAP'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 13229
              mmPrintPosition = 0
              object ppLabel5: TppLabel
                UserName = 'Label5'
                Caption = 'Atividade / Projeto'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Times New Roman'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                Visible = False
                mmHeight = 3704
                mmLeft = 3440
                mmTop = 4233
                mmWidth = 25400
                BandType = 1
              end
              object ppLabel6: TppLabel
                UserName = 'Label6'
                Caption = 'Centro de Custo'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Times New Roman'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                Visible = False
                mmHeight = 3704
                mmLeft = 29104
                mmTop = 4233
                mmWidth = 22754
                BandType = 1
              end
              object ppLabel7: TppLabel
                UserName = 'Label7'
                Caption = 'Tipo de Desembolso'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Times New Roman'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                Visible = False
                mmHeight = 3704
                mmLeft = 52917
                mmTop = 4233
                mmWidth = 26988
                BandType = 1
              end
              object ppLabel8: TppLabel
                UserName = 'Label8'
                Caption = 'Plano Fin.'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Times New Roman'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                Visible = False
                mmHeight = 3704
                mmLeft = 80698
                mmTop = 4233
                mmWidth = 13494
                BandType = 1
              end
              object ppLabel9: TppLabel
                UserName = 'Label9'
                Caption = 'Patro. Fin.'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Times New Roman'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                Visible = False
                mmHeight = 3704
                mmLeft = 95515
                mmTop = 4233
                mmWidth = 14288
                BandType = 1
              end
              object ppLabel10: TppLabel
                UserName = 'Label10'
                Caption = 'Plano Ori.'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Times New Roman'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                Visible = False
                mmHeight = 3704
                mmLeft = 110067
                mmTop = 4233
                mmWidth = 16404
                BandType = 1
              end
              object ppLabel11: TppLabel
                UserName = 'Label11'
                Caption = 'Patro. Ori.'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Times New Roman'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                Visible = False
                mmHeight = 3704
                mmLeft = 126736
                mmTop = 4233
                mmWidth = 16140
                BandType = 1
              end
              object ppDBCalc1: TppDBCalc
                OnPrint = ppDBCalc1Print
                UserName = 'DBCalc1'
                DataField = 'VALORRESERVAOLD'
                DataPipeline = PpDocumFilhoAP
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                Visible = False
                DataPipelineName = 'PpDocumFilhoAP'
                mmHeight = 3175
                mmLeft = 146579
                mmTop = 4233
                mmWidth = 41540
                BandType = 1
              end
            end
            object ppDetailBand1: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3969
              mmPrintPosition = 0
              object ppLabel3: TppLabel
                UserName = 'Label3'
                Caption = 'CAP:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 2646
                mmLeft = 265
                mmTop = 1000
                mmWidth = 5027
                BandType = 4
              end
              object ppDBText12: TppDBText
                UserName = 'DBText12'
                DataField = 'CAPDOCUMENTO'
                DataPipeline = PpDocumFilhoAP
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'PpDocumFilhoAP'
                mmHeight = 2381
                mmLeft = 10848
                mmTop = 1000
                mmWidth = 25400
                BandType = 4
              end
              object ppDBText5: TppDBText
                UserName = 'DBText5'
                DataField = 'DESCRICAO'
                DataPipeline = PpDocumFilhoAP
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'PpDocumFilhoAP'
                mmHeight = 2381
                mmLeft = 39000
                mmTop = 1000
                mmWidth = 53446
                BandType = 4
              end
              object ppDBText6: TppDBText
                UserName = 'DBText6'
                DataField = 'DESCPLANO'
                DataPipeline = PpDocumFilhoAP
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'PpDocumFilhoAP'
                mmHeight = 2381
                mmLeft = 106098
                mmTop = 1000
                mmWidth = 64294
                BandType = 4
              end
              object ppLabel14: TppLabel
                UserName = 'Label14'
                Caption = '0,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 6
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2646
                mmLeft = 184680
                mmTop = 1058
                mmWidth = 4233
                BandType = 4
              end
              object ppLine1: TppLine
                UserName = 'Line1'
                Weight = 0.75
                mmHeight = 1323
                mmLeft = 265
                mmTop = 0
                mmWidth = 189971
                BandType = 4
              end
            end
            object raCodeModule1: TraCodeModule
              ProgramStream = {00}
            end
          end
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object CdsDemGestAutPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspGestAutPag'
    Left = 48
    Top = 56
    object CdsDemGestAutPagNUMFATURA: TFloatField
      FieldName = 'NUMFATURA'
    end
    object CdsDemGestAutPagCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object CdsDemGestAutPagNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
    object CdsDemGestAutPagREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object CdsDemGestAutPagNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object CdsDemGestAutPagCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object CdsDemGestAutPagDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object CdsDemGestAutPagNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object CdsDemGestAutPagVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsDemGestAutPagVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
    end
    object CdsDemGestAutPagRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object CdsDemGestAutPagDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object CdsDemGestAutPagVALORRATEIO: TFloatField
      FieldName = 'VALORRATEIO'
    end
    object CdsDemGestAutPagDESCTDR: TStringField
      FieldName = 'DESCTDR'
      Size = 35
    end
    object CdsDemGestAutPagNOMEAP: TStringField
      FieldName = 'NOMEAP'
      Size = 25
    end
    object CdsDemGestAutPagNOMECR: TStringField
      FieldName = 'NOMECR'
      FixedChar = True
      Size = 30
    end
    object CdsDemGestAutPagNOMECC: TStringField
      FieldName = 'NOMECC'
      Size = 30
    end
    object CdsDemGestAutPagOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1000
    end
    object CdsDemGestAutPagNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      FixedChar = True
      Size = 10
    end
    object CdsDemGestAutPagNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object CdsDemGestAutPagCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      FixedChar = True
      Size = 15
    end
    object CdsDemGestAutPagFLGDOCBANCARIO: TStringField
      FieldName = 'FLGDOCBANCARIO'
      FixedChar = True
      Size = 1
    end
    object CdsDemGestAutPagVLACRE: TFloatField
      FieldName = 'VLACRE'
    end
    object CdsDemGestAutPagVLDEC: TFloatField
      FieldName = 'VLDEC'
    end
    object CdsDemGestAutPagVLIMP: TFloatField
      FieldName = 'VLIMP'
    end
    object CdsDemGestAutPagVLLIQ: TFloatField
      FieldName = 'VLLIQ'
    end
    object CdsDemGestAutPagTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object CdsDemGestAutPagNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
      Size = 60
    end
    object CdsDemGestAutPagTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object CdsDemGestAutPagTOTVALORBRUTO: TFloatField
      FieldName = 'TOTVALORBRUTO'
    end
    object CdsDemGestAutPagTOTVALORDEDUCOES: TFloatField
      FieldName = 'TOTVALORDEDUCOES'
    end
    object CdsDemGestAutPagTOTVALORACRESCIMO: TFloatField
      FieldName = 'TOTVALORACRESCIMO'
    end
    object CdsDemGestAutPagTOTVALORIMPOSTO: TFloatField
      FieldName = 'TOTVALORIMPOSTO'
    end
    object CdsDemGestAutPagTOTVALORAPAGAR: TFloatField
      FieldName = 'TOTVALORAPAGAR'
    end
    object CdsDemGestAutPagSUMVALORBRUTO: TFloatField
      FieldName = 'SUMVALORBRUTO'
    end
    object CdsDemGestAutPagSUMVALORDEDUCOES: TFloatField
      FieldName = 'SUMVALORDEDUCOES'
    end
    object CdsDemGestAutPagSUMVALORACRESCIMO: TFloatField
      FieldName = 'SUMVALORACRESCIMO'
    end
    object CdsDemGestAutPagSUMVALORIMPOSTO: TFloatField
      FieldName = 'SUMVALORIMPOSTO'
    end
    object CdsDemGestAutPagSUMVALORAPAGAR: TFloatField
      FieldName = 'SUMVALORAPAGAR'
    end
    object CdsDemGestAutPagNUMIMOVEL: TStringField
      FieldName = 'NUMIMOVEL'
      Size = 60
    end
    object CdsDemGestAutPagNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object CdsDemGestAutPagDESCPLANO: TStringField
      FieldName = 'DESCPLANO'
      Size = 50
    end
    object CdsDemGestAutPagDESCPROGRAMA: TStringField
      FieldName = 'DESCPROGRAMA'
      Size = 60
    end
    object CdsDemGestAutPagDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object CdsDemGestAutPagDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object CdsDemGestAutPagIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object CdsDemGestAutPagVALOLANCTOLIQ: TFloatField
      FieldName = 'VALOLANCTOLIQ'
    end
    object CdsDemGestAutPagSUMVALOLANCTOLIQ: TFloatField
      FieldName = 'SUMVALOLANCTOLIQ'
    end
    object CdsDemGestAutPagNOMEMODULO: TStringField
      FieldName = 'NOMEMODULO'
      Size = 60
    end
    object CdsDemGestAutPagFDO: TMemoField
      FieldName = 'FDO'
      BlobType = ftMemo
      Size = 500
    end
    object CdsDemGestAutPagCODDOSSIE: TStringField
      FieldName = 'CODDOSSIE'
      Size = 10
    end
  end
  object SqlAutPagDoc: TCMSqlParams
    SQL.Strings = (
      
        '-- VERIFICAR QryModeloAutPag NO DTMCAPCAR POIS ESTA É A QRY OFIC' +
        'IAL'
      'SELECT'
      '  NUMFATURA,'
      '  CODDOCUMENTO,'
      '  NUMAPGR,'
      '  REFERENCIA,'
      '  NODOCUMENTO,'
      '  COMPLDOCUMENTO,'
      '  DATAVENCTO,'
      '  DATAEMISSAO,'
      '  DATAPROGRAMADA,'
      '  NUMDOCUMENTO,'
      '  VALOR,'
      '  VALOROUTRAMOEDA,'
      '  RAZAOSOCIAL,'
      '  DESCRICAO,'
      '  VALORRATEIO,'
      '  DESCTDR,'
      '  NOMEAP,'
      '  NOMECR,'
      '  NOMECC,'
      '  OBS,'
      '  FLGDOCBANCARIO,'
      '  VLACRE,'
      '  VLDEC,'
      '  VLIMP,'
      '  VLLIQ,'
      '  TRGUSERINCLUSAO,'
      
        '  TO_DATE(TO_CHAR(TRGDTINCLUSAO, '#39'DD/MM/YYYY'#39'), '#39'DD/MM/YYYY'#39') AS' +
        ' TRGDTINCLUSAO,'
      '  (0) AS TOTVALORBRUTO,'
      '  (0) AS TOTVALORDEDUCOES,'
      '  (0) AS TOTVALORACRESCIMO,'
      '  (0) AS TOTVALORIMPOSTO,'
      '  (0) AS TOTVALORAPAGAR,'
      '  (0) AS SUMVALORBRUTO,'
      '  (0) AS SUMVALORDEDUCOES,'
      '  (0) AS SUMVALORACRESCIMO,'
      '  (0) AS SUMVALORIMPOSTO,'
      '  (0) AS SUMVALORAPAGAR,'
      '  NUMIMOVEL,'
      '  NOMEPATRO,'
      '  DESCPLANO,'
      '  DESCPROGRAMA,'
      '  IDFORCLI,'
      '  (0) AS VALOLANCTOLIQ,'
      '  (0) AS SUMVALOLANCTOLIQ,'
      '  SUBSTR(OBS, 1,500) AS FDO, '
      '  CODDOSSIE'
      'FROM'
      '  ('
      '    SELECT'
      '      D.NUMFATURA,'
      '      D.CODDOCUMENTO,'
      '      D.NUMAPGR,'
      '      D.REFERENCIA,'
      '      D.NODOCUMENTO,'
      '      D.COMPLDOCUMENTO,'
      '      D.DATAVENCTO,'
      '      D.DATAEMISSAO,'
      '      D.DATAPROGRAMADA,'
      '      P.NUMDOCUMENTO,'
      '      D.CODDOSSIE,'
      '      L.VALOR,'
      '      L.VALOROUTRAMOEDA,'
      '      P.RAZAOSOCIAL,'
      '      F.DESCRICAO,'
      '      RD.VALOR AS VALORRATEIO,'
      '      TDR.DESCRICAO AS DESCTDR,'
      '      AP.NOME AS NOMEAP,'
      '      CR.NOME AS NOMECR,'
      '      CC.NOME AS NOMECC,'
      '      D.OBS,'
      '      F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,'
      '      (0) AS VLACRE,'
      '      (0) AS VLDEC,'
      '      (0) AS VLIMP,'
      '      (0) AS VLLIQ,'
      '      D.TRGUSERINCLUSAO,'
      '      D.TRGDTINCLUSAO,'
      '      RD.NUMIMOVEL,'
      '      PATRO.NOME AS NOMEPATRO,'
      '      PLANO.NOME AS DESCPLANO,'
      '      PROGRAMA.DESCPROGRAMA,'
      '      D.IDFORCLI'
      '    FROM'
      '      PESSOA P,'
      '      PESSOA PATRO,'
      '      DOCUMENTO D,'
      '      LANCTODOCUM L,'
      '      FORMARECPAG F,'
      '      CENTCUST CC,'
      '      RATEIODOCUM RD,'
      '      UNIDNEGOCIO AP,'
      '      CENTRESPON CR,'
      '      TIPORECEBDESEMB TDR,'
      '      PLANPREVCONTABIL PLANO,'
      '      PROGRAMA'
      '    WHERE'
      '-- #ADF1'
      
        '-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSUL' +
        'TA'
      '      D.CODTIPDOC IN'
      '      ('
      '        SELECT'
      '          CODTIPDOC'
      '        FROM'
      '          TIPODOCRECPAG A'
      '        WHERE'
      '          A.RECPAG = :RECPAG AND'
      '          NOT EXISTS'
      '          ('
      '            SELECT'
      '              *'
      '            FROM'
      '              USUARIOXTPDOCTO B'
      '            WHERE'
      '              RECPAG = :RECPAG AND'
      '              B.IDUSUARIO = :IDUSUARIO'
      '          )'
      '        UNION'
      '          SELECT'
      '            CODTIPDOC'
      '          FROM'
      '            TIPODOCRECPAG A'
      '          WHERE'
      '            A.RECPAG = :RECPAG AND'
      '            EXISTS'
      '            ('
      '              SELECT'
      '                *'
      '              FROM'
      '                USUARIOXTPDOCTO B'
      '              WHERE'
      '                RECPAG = :RECPAG AND'
      '                A.CODTIPDOC = B.CODTIPDOC AND'
      '                B.IDUSUARIO = :IDUSUARIO'
      '            )'
      '      ) AND'
      '      (L.ESTORNO IS NULL) AND'
      '      (D.RECPAG = :RECPAG) AND'
      '      (D.IDPESSOA = :IDPESSOA) AND'
      '      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '      (D.OPERACAO = L.OPERACAO) AND'
      '      (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND'
      '      (P.IDPESSOA = D.IDFORCLI) AND'
      '      (D.CODFORMA = F.CODFORMA(+)) AND'
      '      (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND'
      '      (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND'
      '      (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND'
      '      (TDR.RECPAG(+) = RD.RECPAG) AND'
      '      (TDR.IDPESSOA(+) = RD.IDPESSOA) AND'
      '      (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND'
      '      (AP.IDPESSOA(+) = RD.IDPESSOA) AND'
      '      (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND'
      '      (CR.IDPESSOA(+) = RD.IDPESSOA) AND'
      '      (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND'
      '      (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND'
      '      (PATRO.IDPESSOA(+) = RD.IDPATRO)'
      '    UNION'
      '      SELECT'
      '        Q1.NUMFATURA,'
      '        Q1.CODDOCUMENTO,'
      '        Q1.NUMAPGR,'
      '        Q1.REFERENCIA,'
      '        Q1.NODOCUMENTO,'
      '        Q1.COMPLDOCUMENTO,'
      '        Q1.DATAVENCTO,'
      '        Q1.DATAEMISSAO,'
      '        Q1.DATAPROGRAMADA,'
      '        Q1.NUMDOCUMENTO,'
      '        Q1.CODDOSSIE,'
      '        Q1.VALOR,'
      '        Q1.VALOROUTRAMOEDA,'
      '        Q1.RAZAOSOCIAL,'
      '        Q1.DESCRICAO,'
      '        SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALORRATEIO,'
      '        Q2.DESCTDR,'
      '        Q2.NOMEAP,'
      '        Q2.NOMECR,'
      '        Q2.NOMECC,'
      '        Q1.OBS,'
      '        Q1.FLGDOCBANCARIO ,'
      '        (0) AS VLACRE,'
      '        (0) AS VLDEC,'
      '        (0) AS VLIMP,'
      '        (0) AS VLLIQ,'
      '        Q1.TRGUSERINCLUSAO,'
      '        Q1.TRGDTINCLUSAO,'
      '        Q2.NUMIMOVEL,'
      '        Q2.NOMEPATRO,'
      '        Q2.DESCPLANO,'
      '        Q2.DESCPROGRAMA,'
      '        Q1.IDFORCLI'
      '      FROM'
      '        ('
      '          SELECT'
      '            DOC.NUMFATURA,'
      '            DOC.CODDOCUMENTO,'
      '            DOC.NUMAPGR,'
      '            DOC.REFERENCIA,'
      '            DOC.NODOCUMENTO,'
      '            DOC.COMPLDOCUMENTO,'
      '            DOC.DATAVENCTO,'
      '            DOC.DATAEMISSAO,'
      '            DOC.DATAPROGRAMADA,'
      '            P.NUMDOCUMENTO,'
      '            DOC.CODDOSSIE,'
      '            LAN.VALOR,'
      '            LAN.VALOROUTRAMOEDA,'
      '            P.RAZAOSOCIAL,'
      '            F.DESCRICAO,'
      '            DOC.OBS,'
      '            F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,'
      '            (0) AS VLACRE,'
      '            (0) AS VLDEC,'
      '            (0) AS VLIMP,'
      '            (0) AS VLLIQ,'
      '            DOC.TRGUSERINCLUSAO,'
      '            DOC.TRGDTINCLUSAO,'
      '            DOC.IDFORCLI'
      '          FROM'
      '            PESSOA P,'
      '            DOCUMENTO DOC,'
      '            LANCTODOCUM LAN,'
      '            FORMARECPAG F'
      '          WHERE'
      '-- #ADF2'
      
        '-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSUL' +
        'TA'
      '            DOC.CODTIPDOC IN'
      '            ('
      '              SELECT'
      '                CODTIPDOC'
      '              FROM'
      '                TIPODOCRECPAG A'
      '              WHERE'
      '                A.RECPAG = :RECPAG AND'
      '                NOT EXISTS'
      '                ('
      '                  SELECT'
      '                    *'
      '                  FROM'
      '                    USUARIOXTPDOCTO B'
      '                  WHERE'
      '                    RECPAG = :RECPAG AND'
      '                    B.IDUSUARIO = :IDUSUARIO'
      '                )'
      '              UNION'
      '                SELECT'
      '                  CODTIPDOC'
      '                FROM'
      '                  TIPODOCRECPAG A'
      '                WHERE'
      '                  A.RECPAG = :RECPAG AND'
      '                EXISTS'
      '                ('
      '                  SELECT'
      '                    *'
      '                  FROM'
      '                    USUARIOXTPDOCTO B'
      '                  WHERE'
      '                    RECPAG = :RECPAG AND'
      '                    A.CODTIPDOC = B.CODTIPDOC AND'
      '                    B.IDUSUARIO = :IDUSUARIO'
      '                )'
      '            ) AND'
      '            (LAN.ESTORNO IS NULL) AND'
      '            (DOC.RECPAG = :RECPAG) AND'
      '            (DOC.IDPESSOA = :IDPESSOA) AND'
      '            (P.IDPESSOA = DOC.IDFORCLI) AND'
      '            (DOC.CODFORMA = F.CODFORMA(+)) AND'
      '            (RTRIM(LAN.OPERACAO) IN ('#39'3'#39','#39'13'#39')) AND'
      '            (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)'
      '        ) Q1,'
      '        ('
      '          SELECT'
      '            D.NUMFATURA,'
      '            RD.VALOR,'
      '            TDR.DESCRICAO AS DESCTDR,'
      '            AP.NOME AS NOMEAP,'
      '            CR.NOME AS NOMECR,'
      '            CC.NOME AS NOMECC,'
      '            RD.NUMIMOVEL,'
      '            PATRO.NOME AS NOMEPATRO,'
      '            PLANO.NOME AS DESCPLANO,'
      '            PROGRAMA.DESCPROGRAMA'
      '          FROM'
      '            PESSOA PATRO,'
      '            DOCUMENTO D,'
      '            RATEIODOCUM RD,'
      '            CENTCUST CC,'
      '            UNIDNEGOCIO AP,'
      '            CENTRESPON CR,'
      '            TIPORECEBDESEMB TDR,'
      '            PLANPREVCONTABIL PLANO,'
      '            PROGRAMA'
      '          WHERE'
      '-- #ADF3'
      
        '-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSUL' +
        'TA'
      '            (D.RECPAG = :RECPAG) AND'
      '            (D.IDPESSOA = :IDPESSOA) AND'
      '            (D.NUMFATURA IS NOT NULL) AND'
      '            (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND'
      '            (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND'
      '            (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND'
      '            (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND'
      '            (TDR.RECPAG(+) = RD.RECPAG) AND'
      '            (TDR.IDPESSOA(+) = RD.IDPESSOA) AND'
      '            (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND'
      '            (AP.IDPESSOA(+) = RD.IDPESSOA) AND'
      '            (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND'
      '            (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND'
      '            (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND'
      '            (PATRO.IDPESSOA(+) = RD.IDPATRO) AND'
      '            (CR.IDPESSOA(+) = RD.IDPESSOA)'
      '        ) Q2,'
      '        ('
      '          SELECT'
      '            D.NUMFATURA,'
      '            SUM(L.VALOR) AS VALOR'
      '          FROM'
      '            LANCTODOCUM L,'
      '            DOCUMENTO D'
      '          WHERE'
      '            (L.ESTORNO IS NULL) AND'
      '            (D.RECPAG= :RECPAG) AND'
      '            (D.IDPESSOA = :IDPESSOA) AND'
      '            (RTRIM(L.OPERACAO) IN ('#39'1'#39','#39'11'#39')) AND'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '            (D.OPERACAO = L.OPERACAO) AND'
      '            (D.NUMFATURA IS NOT NULL)'
      '          GROUP BY'
      '            D.NUMFATURA'
      '        ) Q3'
      '      WHERE'
      '        (Q1.NUMFATURA = Q2.NUMFATURA) AND'
      '        (Q3.NUMFATURA = Q2.NUMFATURA)'
      '      GROUP BY'
      '        Q1.NUMFATURA,'
      '        Q1.CODDOCUMENTO,'
      '        Q1.NUMAPGR,'
      '        Q1.REFERENCIA,'
      '        Q1.NODOCUMENTO,'
      '        Q1.COMPLDOCUMENTO,'
      '        Q1.DATAVENCTO,'
      '        Q1.DATAEMISSAO,'
      '        Q1.DATAPROGRAMADA,'
      '        Q1.NUMDOCUMENTO,'
      '        Q1.CODDOSSIE,'
      '        Q1.VALOR,'
      '        Q1.VALOROUTRAMOEDA,'
      '        Q1.RAZAOSOCIAL,'
      '        Q1.DESCRICAO,'
      '        Q2.DESCTDR,'
      '        Q2.NOMEAP,'
      '        Q2.NOMECR,'
      '        Q2.NOMECC,'
      '        Q1.OBS,'
      '        Q1.FLGDOCBANCARIO,'
      '        Q1.TRGUSERINCLUSAO,'
      '        Q1.TRGDTINCLUSAO,'
      '        Q2.NUMIMOVEL,'
      '        Q2.NOMEPATRO,'
      '        Q2.DESCPLANO,'
      '        Q2.DESCPROGRAMA,'
      '        Q1.IDFORCLI'
      '  )')
    ClientDataSet = CdsAutPagDoc
    Left = 188
    Top = 106
  end
  object CdsAutPagDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 104
  end
  object SqlDemGestAutPag: TCMSqlParams
    SQL.Strings = (
      ' SELECT'
      '   D.NUMFATURA,'
      '   D.CODDOCUMENTO,'
      '   D.NUMAPGR,'
      '   D.REFERENCIA,'
      '   D.NODOCUMENTO,'
      '   D.COMPLDOCUMENTO,'
      '   D.DATAVENCTO,'
      '   D.DATAEMISSAO,'
      '   D.DATAPROGRAMADA,'
      '   P.NUMDOCUMENTO,'
      '   L.VALOR,'
      '   L.VALOROUTRAMOEDA,'
      '   P.RAZAOSOCIAL,'
      '   F.DESCRICAO,'
      '   RD.VALOR AS VALORRATEIO,'
      '   TDR.DESCRICAO AS DESCTDR,'
      '   AP.NOME AS NOMEAP,'
      '   CR.NOME AS NOMECR,'
      '   CC.NOME AS NOMECC,'
      '   D.OBS,'
      '   F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,'
      '   (0) AS VLACRE,'
      '   (0) AS VLDEC,'
      '   (0) AS VLIMP,'
      '   (0) AS VLLIQ,'
      '   D.TRGUSERINCLUSAO,'
      
        '   TO_DATE(TO_CHAR(D.TRGDTINCLUSAO, '#39'DD/MM/YYYY'#39'), '#39'DD/MM/YYYY'#39')' +
        ' AS TRGDTINCLUSAO,'
      '   RD.NUMIMOVEL,                                           '
      '   PATRO.NOME AS NOMEPATRO,                                '
      '   PLANO.NOME AS DESCPLANO,'
      '   PROGRAMA.DESCPROGRAMA,'
      '   D.IDFORCLI,'
      '  (0) AS TOTVALORBRUTO,'
      '  (0) AS TOTVALORDEDUCOES,'
      '  (0) AS TOTVALORACRESCIMO,'
      '  (0) AS TOTVALORIMPOSTO,'
      '  (0) AS TOTVALORAPAGAR,'
      '  (0) AS SUMVALORBRUTO,'
      '  (0) AS SUMVALORDEDUCOES,'
      '  (0) AS SUMVALORACRESCIMO,'
      '  (0) AS SUMVALORIMPOSTO,'
      '  (0) AS SUMVALORAPAGAR,'
      '  (0) AS VALOLANCTOLIQ,'
      '  (0) AS SUMVALOLANCTOLIQ,'
      '  ('#39'          '#39') AS NUMBANCO,'
      '  ('#39'               '#39') AS NUMAGENCIA,'
      '  ('#39'               '#39') AS CONTACORRENTE,'
      
        '  ('#39'                                                            ' +
        #39') AS NOMEUSUARIO,'
      
        '  ('#39'                                                            ' +
        #39') AS NOMEMODULO,'
      '  SUBSTR(D.OBS, 1,500) AS FDO,'
      '  '#39'          '#39' AS CODDOSSIE '
      ' FROM'
      '   PESSOA P,'
      '   PESSOA PATRO,'
      '   DOCUMENTO D,'
      '   LANCTODOCUM L,'
      '   FORMARECPAG F,'
      '   CENTCUST CC,'
      '   RATEIODOCUM RD,'
      '   UNIDNEGOCIO AP,'
      '   CENTRESPON CR,'
      '   TIPORECEBDESEMB TDR,'
      '   PLANPREVCONTABIL PLANO,'
      '   PROGRAMA'
      ' WHERE'
      '   1=2'
      ' '
      ' ')
    ClientDataSet = CdsDemGestAutPag
    Left = 188
    Top = 56
  end
  object SqlNomeUsuario: TCMSqlParams
    SQL.Strings = (
      'SELECT NOMEUSUARIO '
      'FROM USUARIOSISTEMA '
      'WHERE IDUSUARIO = :IDUSUARIO')
    ClientDataSet = CdsNomeUsuario
    Left = 188
    Top = 152
  end
  object CdsNomeUsuario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 152
  end
  object CdsBuscaContaDocForn: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 344
  end
  object SqlBuscaContaDocForn: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   DECODE(C.TIPOCONTA,'#39'1'#39','#39'Conta Corrente'#39','
      '   DECODE(C.TIPOCONTA,'#39'2'#39','#39'Cartão Salário'#39','
      
        '   DECODE(C.TIPOCONTA,'#39'3'#39','#39'Conta Poupança'#39','#39#39'))) AS DESCTIPOCONT' +
        'A,'
      
        '   C.CONTACORRENTE, B.NUMBANCO, A.NUMAGENCIA, C.TIPOCONTA, C.IDC' +
        'BANCARIA,'
      
        '   DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOMEAGE' +
        'NCIA,'
      
        '   DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOMEBAN' +
        'CO,'
      '   B.MASCARACC,'
      '   B.MASCARAAGENCIA'
      'FROM'
      
        '   PESSOA PA, PESSOA PB, DOCUMENTO D, CONTABANCARIA C, AGENCIABA' +
        'NCARIA A, BANCO B'
      'WHERE'
      '   (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '   (C.IDPESSOA = D.IDFORCLI)  AND'
      '   (C.FLGCONTAPREF = 1)       AND'
      '   (C.IDAGENCIA = A.IDPESSOA) AND'
      '   (A.IDBANCO   = B.IDPESSOA) AND'
      '   (A.IDPESSOA = PA.IDPESSOA) AND'
      '   (B.IDPESSOA = PB.IDPESSOA)'
      ' ')
    ClientDataSet = CdsBuscaContaDocForn
    Left = 188
    Top = 344
  end
  object CdsBuscaContaDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 296
  end
  object SqlBuscaContaDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT DECODE(C.TIPOCONTA,'#39'1'#39','#39'Conta Corrente'#39','
      '       DECODE(C.TIPOCONTA,'#39'2'#39','#39'Cartão Salário'#39','
      
        '       DECODE(C.TIPOCONTA,'#39'3'#39','#39'Conta Poupança'#39','#39#39'))) AS DESCTIPO' +
        'CONTA,'
      '       C.CONTACORRENTE,'
      '       B.NUMBANCO,'
      '       A.NUMAGENCIA,'
      '       C.TIPOCONTA,'
      '       C.IDCBANCARIA,'
      
        '       DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOM' +
        'EAGENCIA,'
      
        '       DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOM' +
        'EBANCO,'
      '       B.MASCARACC,'
      '       B.MASCARAAGENCIA'
      'FROM'
      
        '   PESSOA PA, PESSOA PB, DOCUMENTO D, CONTABANCARIA C, AGENCIABA' +
        'NCARIA A, BANCO B'
      'WHERE'
      '   (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '   (C.IDAGENCIA = A.IDPESSOA)  AND'
      '   (A.IDBANCO   = B.IDPESSOA) AND'
      '   (A.IDPESSOA = PA.IDPESSOA) AND'
      '   (B.IDPESSOA = PB.IDPESSOA) AND'
      '   (D.IDCBANCARIA = C.IDCBANCARIA) '
      ' ')
    ClientDataSet = CdsBuscaContaDoc
    Left = 188
    Top = 296
  end
  object CdsAlteraParcOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 248
  end
  object SqlAlteraParcOrigem: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  (Q2.VALACRE * (Q3.VALORPARCELAS))/(Q1.VALORIGINAL + Q2.VALACRE' +
        ' - Q2.VALDECR - Q2.VALIMP) AS VALACRE,'
      
        '  (Q2.VALDECR * (Q3.VALORPARCELAS))/(Q1.VALORIGINAL + Q2.VALACRE' +
        ' - Q2.VALDECR - Q2.VALIMP) AS VALDECR,'
      
        '  (Q2.VALIMP * (Q3.VALORPARCELAS))/(Q1.VALORIGINAL + Q2.VALACRE ' +
        '- Q2.VALDECR - Q2.VALIMP) AS VALIMP,'
      '  Q3.CODDOCUMENTO  '
      'FROM'
      '   (SELECT'
      '     D.CODDOCUMENTO,'
      '     L.VALOR AS VALORPARCELAS'
      '    FROM'
      '     DOCUMENTO D, LANCTODOCUM L'
      '    WHERE'
      '     (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '     (D.OPERACAO = L.OPERACAO) AND'
      '     (D.CODDOCUMENTO= L.CODDOCUMENTO) AND'
      '     (RTRIM(D.OPERACAO) IN ('#39'3'#39','#39'13'#39')) AND'
      '     (L.ESTORNO IS NULL)) Q3,'
      '   (SELECT'
      '     SUM(L.VALOR) AS VALORIGINAL'
      '    FROM'
      '     DOCUMENTO D, LANCTODOCUM L'
      '    WHERE'
      '     (D.NUMFATURA=:NUMFATURA) AND'
      '     (D.OPERACAO = L.OPERACAO) AND'
      '     (D.CODDOCUMENTO= L.CODDOCUMENTO) AND'
      '     (RTRIM(D.OPERACAO) NOT IN ('#39'3'#39','#39'13'#39')) AND'
      '     (L.ESTORNO IS NULL)) Q1,'
      '   (SELECT'
      '      SUM(VALACRE) AS VALACRE ,'
      '      SUM(VALDECR) AS VALDECR ,'
      '      SUM(VALIMP)  AS VALIMP'
      '    FROM'
      '      (SELECT'
      '         DECODE(L.DEBCRE,'#39'C'#39',SUM(L.VALOR)) AS VALACRE,'
      '         DECODE(L.DEBCRE,'#39'D'#39',SUM(L.VALOR)) AS VALDECR,'
      '         0 AS VALIMP'
      '       FROM'
      '         DOCUMENTO D, LANCTODOCUM L'
      '       WHERE'
      '         (D.NUMFATURA=:NUMFATURA) AND'
      '         (RTRIM(D.OPERACAO) NOT IN ('#39'3'#39','#39'13'#39')) AND'
      '         (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '         (RTRIM(L.OPERACAO)='#39'4'#39') AND'
      '         (CODALTERADOR NOT IN'
      '           (SELECT'
      '              CODALTERADOR'
      '            FROM'
      '              ALTXIMPOSTO'
      '            WHERE'
      '              CODIMPOSTO = 1))'
      '       GROUP BY'
      '         L.DEBCRE'
      '      UNION ALL'
      '      SELECT'
      '        0 AS VALACRE,'
      '        0 AS VALDECR,'
      '        SUM(L.VALOR) AS VALIMP'
      '      FROM'
      '        DOCUMENTO D, LANCTODOCUM L, ALTXIMPOSTO AL'
      '      WHERE'
      '        (D.NUMFATURA=:NUMFATURA) AND'
      '        (L.CODDOCUMENTO=D.CODDOCUMENTO) AND'
      '        (RTRIM(D.OPERACAO) NOT IN ('#39'3'#39','#39'13'#39')) AND'
      '        (RTRIM(L.OPERACAO)='#39'4'#39') AND'
      '        (L.CODALTERADOR = AL.CODALTERADOR) AND'
      '        (AL.CODIMPOSTO = 1))) Q2'
      '')
    ClientDataSet = CdsAlteraParcOrigem
    Left = 188
    Top = 248
  end
  object CdsAutPagDocAlt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 200
  end
  object SqlAutPagDocAlt: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   SUM(VALACRE) AS VALACRE, SUM(VALDECR) AS VALDECR, SUM(VALIMP)' +
        ' AS VALIMP'
      'FROM'
      '  (SELECT'
      '      DECODE(L.DEBCRE,'#39'C'#39',SUM(L.VALOR)) AS VALACRE,'
      '      DECODE(L.DEBCRE,'#39'D'#39',SUM(L.VALOR)) AS VALDECR,'
      '      (0) AS VALIMP'
      '   FROM'
      '      LANCTODOCUM L'
      '   WHERE'
      
        '      (L.CODDOCUMENTO=:CODDOCUMENTO) AND (RTRIM(L.OPERACAO)='#39'4'#39')' +
        ' AND'
      '      (CODALTERADOR NOT IN'
      '         (SELECT'
      '             CODALTERADOR'
      '          FROM'
      '             ALTXIMPOSTO'
      '          WHERE'
      '             CODIMPOSTO = 1))'
      '   GROUP BY DEBCRE'
      '   UNION'
      '   SELECT'
      '      (0) AS VALACRE, (0) AS VALDECR, '
      
        '      SUM(DECODE(l.debcre, '#39'D'#39', (L.VALOR), (-l.VALOR))) AS VALIM' +
        'P'
      '  FROM LANCTODOCUM L'
      '   WHERE'
      
        '      (L.CODDOCUMENTO=:CODDOCUMENTO) AND (RTRIM(L.OPERACAO)='#39'4'#39')' +
        ' AND'
      
        '      (CODALTERADOR IN (SELECT CODALTERADOR FROM ALTXIMPOSTO WHE' +
        'RE CODIMPOSTO = 1)))'
      ' ')
    ClientDataSet = CdsAutPagDocAlt
    Left = 188
    Top = 200
  end
  object SqlDocumFilhosAP: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '       R.CODDOCUMENTO,DF.NODOCUMENTO as CAPDOCUMENTO,'
      '       R.CODTIPRECDES,'
      '       R.RECPAG,'
      '       R.IDPESSOA,'
      '       R.IDRESERVAORCAMEN,'
      '       R.CODCENTRORESPON,'
      '       C.CODEXTERNO as CODEXTERNOCR,'
      '       R.UNIDNEGOC,'
      '       R.MOECODIGO,'
      '       R.VALOR,'
      '       R.VALOROUTRAMOEDA,'
      '       t.PLACONTACREDITO,'
      '       R.IDUSUARIOINCLUSAO,'
      '       U.NOME,'
      '       C.NOME,'
      '       R.CODCENTROCUSTO,'
      '       CC.CODEXTERNO as CODEXTERNOCC,'
      '       R.IDRATEIODOCUM,'
      '       T.DESCRICAO,'
      '       I.MOESIGLA,'
      '       CC.NOME AS NOMECENTROCUSTO,'
      '       R.PLANO,'
      '       R.IDPATRO,'
      '       R.IDPROGRAMA,'
      '       PROGRAMA.FLGTIPOPROGRAMA,'
      '       R.NUMIMOVEL,'
      '       PATRO.NOME AS NOMEPATRO,'
      '       PLANO.NOME AS DESCPLANO,'
      '       PROGRAMA.DESCPROGRAMA,'
      '       T.HITCODHIST,'
      '       R.IDPLANOPREV,'
      '       RESERVAORCAMEN.NUMRESERVA,'
      '       T.FLGOBRIGARESERVA,'
      '       RESERVAORCAMEN.NUMRESERVA AS NUMRESERVAOLD,'
      '       R.VALOR AS VALORRESERVAOLD,'
      '       R.VLRRESORCAMEN,'
      '       -1 AS IDSEGREGACRITER,'
      '       0 AS CODSUBCONTA,'
      '       0 AS CODSUBCONTAPASS,'
      '       IDPLANOVIRTUAL,'
      '       IDSEGREGACONTR,'
      '       T.FLGOBRQTDECOTAS,'
      '       R.IDPATROORIGEM,'
      '       R.IDPLANOORIGEM,'
      '       PATROORIGEM.NOME AS NOMEPATROORIGEM,'
      '       PLANOORIGEM.NOME AS DESCPLANOORIGEM'
      '  FROM RATEIODOCUM R,'
      '       UNIDNEGOCIO U,'
      '       CENTRESPON C,'
      '       TIPORECEBDESEMB T,'
      '       MOEDA I,'
      '       CENTCUST CC,'
      '       PESSOA PATRO,'
      '       PLANPREVCONTABIL PLANO,'
      '       PROGRAMA,'
      '       RESERVAORCAMEN,'
      '       PESSOA PATROORIGEM,'
      '       PLANPREVCONTABIL PLANOORIGEM,'
      '       DOCUMENTO DOC,'
      '       DOCUMXDOCUM DXD, DOCUMENTO DF'
      ' WHERE (DOC.CODDOCUMENTO = 421999)'
      ''
      '   AND (T.CODTIPRECDES = R.CODTIPRECDES)'
      '   AND (DF.CODDOCUMENTO = R.CODDOCUMENTO)'
      '   AND (T.RECPAG = R.RECPAG)'
      '   AND (T.IDPESSOA = R.IDPESSOA)'
      '   AND (U.UNIDNEGOC = R.UNIDNEGOC)'
      '   AND (U.IDPESSOA = R.IDPESSOA)'
      '   AND (I.MOECODIGO(+) = R.MOECODIGO)'
      '   AND (C.CODCENTRORESPON(+) = R.CODCENTRORESPON)'
      '   AND (CC.IDEMPRESA(+) = R.IDPESSOA)'
      '   AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '   AND (C.IDPESSOA(+) = R.IDPESSOA)'
      '   AND (PLANO.IDPLANOPREV(+) = R.IDPLANOPREV)'
      '   AND (PROGRAMA.IDPROGRAMA(+) = R.IDPROGRAMA)'
      '   AND (PATRO.IDPESSOA(+) = R.IDPATRO)'
      '   AND (RESERVAORCAMEN.IDRESERVAORCAMEN(+) = R.IDRESERVAORCAMEN)'
      '   AND (PLANOORIGEM.IDPLANOPREV(+) = R.IDPLANOORIGEM)'
      '   AND (PATROORIGEM.IDPESSOA(+) = R.IDPATROORIGEM)'
      '      '
      '   AND DXD.IDDOCUMENTOPAI = DOC.CODDOCUMENTO'
      '   AND DXD.IDDOCUMENTO = R.CODDOCUMENTO'
      '  AND 1 = 2'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsDocumFilhosAP
    Left = 460
    Top = 224
  end
  object CdsDocumFilhosAP: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'CAPDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'IDRESERVAORCAMEN'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CODEXTERNOCR'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'PLACONTACREDITO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'IDUSUARIOINCLUSAO'
        DataType = ftFloat
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NOME_1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CODEXTERNOCC'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIODOCUM'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NOMECENTROCUSTO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PLANO'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'FLGTIPOPROGRAMA'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NUMIMOVEL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NOMEPATRO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DESCPLANO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DESCPROGRAMA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'HITCODHIST'
        Attributes = [faFixed]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'NUMRESERVA'
        DataType = ftFloat
      end
      item
        Name = 'FLGOBRIGARESERVA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUMRESERVAOLD'
        DataType = ftFloat
      end
      item
        Name = 'VALORRESERVAOLD'
        DataType = ftFloat
      end
      item
        Name = 'VLRRESORCAMEN'
        DataType = ftFloat
      end
      item
        Name = 'IDSEGREGACRITER'
        DataType = ftFloat
      end
      item
        Name = 'CODSUBCONTA'
        DataType = ftFloat
      end
      item
        Name = 'CODSUBCONTAPASS'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOVIRTUAL'
        DataType = ftFloat
      end
      item
        Name = 'IDSEGREGACONTR'
        DataType = ftFloat
      end
      item
        Name = 'FLGOBRQTDECOTAS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IDPATROORIGEM'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOORIGEM'
        DataType = ftFloat
      end
      item
        Name = 'NOMEPATROORIGEM'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DESCPLANOORIGEM'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 360
    Top = 224
    object CdsDocumFilhosAPCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object CdsDocumFilhosAPCAPDOCUMENTO: TFloatField
      FieldName = 'CAPDOCUMENTO'
    end
    object CdsDocumFilhosAPCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object CdsDocumFilhosAPRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object CdsDocumFilhosAPIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsDocumFilhosAPIDRESERVAORCAMEN: TFloatField
      FieldName = 'IDRESERVAORCAMEN'
    end
    object CdsDocumFilhosAPCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object CdsDocumFilhosAPCODEXTERNOCR: TStringField
      FieldName = 'CODEXTERNOCR'
      FixedChar = True
      Size = 10
    end
    object CdsDocumFilhosAPUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object CdsDocumFilhosAPMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object CdsDocumFilhosAPVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsDocumFilhosAPVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
    end
    object CdsDocumFilhosAPPLACONTACREDITO: TStringField
      FieldName = 'PLACONTACREDITO'
      FixedChar = True
      Size = 18
    end
    object CdsDocumFilhosAPIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
    end
    object CdsDocumFilhosAPNOME: TStringField
      FieldName = 'NOME'
      Size = 25
    end
    object CdsDocumFilhosAPNOME_1: TStringField
      FieldName = 'NOME_1'
      FixedChar = True
      Size = 30
    end
    object CdsDocumFilhosAPCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object CdsDocumFilhosAPCODEXTERNOCC: TStringField
      FieldName = 'CODEXTERNOCC'
      FixedChar = True
      Size = 10
    end
    object CdsDocumFilhosAPIDRATEIODOCUM: TFloatField
      FieldName = 'IDRATEIODOCUM'
    end
    object CdsDocumFilhosAPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object CdsDocumFilhosAPMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object CdsDocumFilhosAPNOMECENTROCUSTO: TStringField
      FieldName = 'NOMECENTROCUSTO'
      Size = 30
    end
    object CdsDocumFilhosAPPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object CdsDocumFilhosAPIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object CdsDocumFilhosAPIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
    end
    object CdsDocumFilhosAPFLGTIPOPROGRAMA: TStringField
      FieldName = 'FLGTIPOPROGRAMA'
      Size = 3
    end
    object CdsDocumFilhosAPNUMIMOVEL: TStringField
      FieldName = 'NUMIMOVEL'
      Size = 60
    end
    object CdsDocumFilhosAPNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object CdsDocumFilhosAPDESCPLANO: TStringField
      FieldName = 'DESCPLANO'
      Size = 50
    end
    object CdsDocumFilhosAPDESCPROGRAMA: TStringField
      FieldName = 'DESCPROGRAMA'
      Size = 60
    end
    object CdsDocumFilhosAPHITCODHIST: TStringField
      FieldName = 'HITCODHIST'
      FixedChar = True
      Size = 4
    end
    object CdsDocumFilhosAPIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object CdsDocumFilhosAPNUMRESERVA: TFloatField
      FieldName = 'NUMRESERVA'
    end
    object CdsDocumFilhosAPFLGOBRIGARESERVA: TStringField
      FieldName = 'FLGOBRIGARESERVA'
      FixedChar = True
      Size = 1
    end
    object CdsDocumFilhosAPNUMRESERVAOLD: TFloatField
      FieldName = 'NUMRESERVAOLD'
    end
    object CdsDocumFilhosAPVALORRESERVAOLD: TFloatField
      FieldName = 'VALORRESERVAOLD'
    end
    object CdsDocumFilhosAPVLRRESORCAMEN: TFloatField
      FieldName = 'VLRRESORCAMEN'
    end
    object CdsDocumFilhosAPIDSEGREGACRITER: TFloatField
      FieldName = 'IDSEGREGACRITER'
    end
    object CdsDocumFilhosAPCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object CdsDocumFilhosAPCODSUBCONTAPASS: TFloatField
      FieldName = 'CODSUBCONTAPASS'
    end
    object CdsDocumFilhosAPIDPLANOVIRTUAL: TFloatField
      FieldName = 'IDPLANOVIRTUAL'
    end
    object CdsDocumFilhosAPIDSEGREGACONTR: TFloatField
      FieldName = 'IDSEGREGACONTR'
    end
    object CdsDocumFilhosAPFLGOBRQTDECOTAS: TStringField
      FieldName = 'FLGOBRQTDECOTAS'
      FixedChar = True
      Size = 1
    end
    object CdsDocumFilhosAPIDPATROORIGEM: TFloatField
      FieldName = 'IDPATROORIGEM'
    end
    object CdsDocumFilhosAPIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object CdsDocumFilhosAPNOMEPATROORIGEM: TStringField
      FieldName = 'NOMEPATROORIGEM'
      Size = 60
    end
    object CdsDocumFilhosAPDESCPLANOORIGEM: TStringField
      FieldName = 'DESCPLANOORIGEM'
      Size = 50
    end
  end
  object PpDocumFilhoAP: TppBDEPipeline
    DataSource = DsDocumFilhoAP
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'PpDocumFilhoAP'
    Left = 460
    Top = 176
    object PpDocumFilhoAPppField1: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField2: TppField
      FieldAlias = 'CAPDOCUMENTO'
      FieldName = 'CAPDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField3: TppField
      FieldAlias = 'CODTIPRECDES'
      FieldName = 'CODTIPRECDES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField4: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField5: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField6: TppField
      FieldAlias = 'IDRESERVAORCAMEN'
      FieldName = 'IDRESERVAORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField7: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField8: TppField
      FieldAlias = 'CODEXTERNOCR'
      FieldName = 'CODEXTERNOCR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField9: TppField
      FieldAlias = 'UNIDNEGOC'
      FieldName = 'UNIDNEGOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField10: TppField
      FieldAlias = 'MOECODIGO'
      FieldName = 'MOECODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField11: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField12: TppField
      FieldAlias = 'VALOROUTRAMOEDA'
      FieldName = 'VALOROUTRAMOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField13: TppField
      FieldAlias = 'PLACONTACREDITO'
      FieldName = 'PLACONTACREDITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField14: TppField
      FieldAlias = 'IDUSUARIOINCLUSAO'
      FieldName = 'IDUSUARIOINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField15: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField16: TppField
      FieldAlias = 'NOME_1'
      FieldName = 'NOME_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField17: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField18: TppField
      FieldAlias = 'CODEXTERNOCC'
      FieldName = 'CODEXTERNOCC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField19: TppField
      FieldAlias = 'IDRATEIODOCUM'
      FieldName = 'IDRATEIODOCUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField20: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField21: TppField
      FieldAlias = 'MOESIGLA'
      FieldName = 'MOESIGLA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField22: TppField
      FieldAlias = 'NOMECENTROCUSTO'
      FieldName = 'NOMECENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField23: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField24: TppField
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField25: TppField
      FieldAlias = 'IDPROGRAMA'
      FieldName = 'IDPROGRAMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField26: TppField
      FieldAlias = 'FLGTIPOPROGRAMA'
      FieldName = 'FLGTIPOPROGRAMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField27: TppField
      FieldAlias = 'NUMIMOVEL'
      FieldName = 'NUMIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField28: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField29: TppField
      FieldAlias = 'DESCPLANO'
      FieldName = 'DESCPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField30: TppField
      FieldAlias = 'DESCPROGRAMA'
      FieldName = 'DESCPROGRAMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField31: TppField
      FieldAlias = 'HITCODHIST'
      FieldName = 'HITCODHIST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField32: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField33: TppField
      FieldAlias = 'NUMRESERVA'
      FieldName = 'NUMRESERVA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField34: TppField
      FieldAlias = 'FLGOBRIGARESERVA'
      FieldName = 'FLGOBRIGARESERVA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField35: TppField
      FieldAlias = 'NUMRESERVAOLD'
      FieldName = 'NUMRESERVAOLD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField36: TppField
      FieldAlias = 'VALORRESERVAOLD'
      FieldName = 'VALORRESERVAOLD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField37: TppField
      FieldAlias = 'VLRRESORCAMEN'
      FieldName = 'VLRRESORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField38: TppField
      FieldAlias = 'IDSEGREGACRITER'
      FieldName = 'IDSEGREGACRITER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField39: TppField
      FieldAlias = 'CODSUBCONTA'
      FieldName = 'CODSUBCONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField40: TppField
      FieldAlias = 'CODSUBCONTAPASS'
      FieldName = 'CODSUBCONTAPASS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField41: TppField
      FieldAlias = 'IDPLANOVIRTUAL'
      FieldName = 'IDPLANOVIRTUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField42: TppField
      FieldAlias = 'IDSEGREGACONTR'
      FieldName = 'IDSEGREGACONTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField43: TppField
      FieldAlias = 'FLGOBRQTDECOTAS'
      FieldName = 'FLGOBRQTDECOTAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField44: TppField
      FieldAlias = 'IDPATROORIGEM'
      FieldName = 'IDPATROORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField45: TppField
      FieldAlias = 'IDPLANOORIGEM'
      FieldName = 'IDPLANOORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField46: TppField
      FieldAlias = 'NOMEPATROORIGEM'
      FieldName = 'NOMEPATROORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoAPppField47: TppField
      FieldAlias = 'DESCPLANOORIGEM'
      FieldName = 'DESCPLANOORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
  end
  object DsDocumFilhoAP: TwwDataSource
    DataSet = CdsDocumFilhosAP
    Left = 362
    Top = 176
  end
  object SqlDocumFilhoAR: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '       R.CODDOCUMENTO,DF.NODOCUMENTO as CARDOCUMENTO,'
      '       R.CODTIPRECDES,'
      '       R.RECPAG,'
      '       R.IDPESSOA,'
      '       R.IDRESERVAORCAMEN,'
      '       R.CODCENTRORESPON,'
      '       C.CODEXTERNO as CODEXTERNOCR,'
      '       R.UNIDNEGOC,'
      '       R.MOECODIGO,'
      '       R.VALOR,'
      '       R.VALOROUTRAMOEDA,'
      '       t.PLACONTACREDITO,'
      '       R.IDUSUARIOINCLUSAO,'
      '       U.NOME,'
      '       C.NOME,'
      '       R.CODCENTROCUSTO,'
      '       CC.CODEXTERNO as CODEXTERNOCC,'
      '       R.IDRATEIODOCUM,'
      '       T.DESCRICAO,'
      '       I.MOESIGLA,'
      '       CC.NOME AS NOMECENTROCUSTO,'
      '       R.PLANO,'
      '       R.IDPATRO,'
      '       R.IDPROGRAMA,'
      '       PROGRAMA.FLGTIPOPROGRAMA,'
      '       R.NUMIMOVEL,'
      '       PATRO.NOME AS NOMEPATRO,'
      '       PLANO.NOME AS DESCPLANO,'
      '       PROGRAMA.DESCPROGRAMA,'
      '       T.HITCODHIST,'
      '       R.IDPLANOPREV,'
      '       RESERVAORCAMEN.NUMRESERVA,'
      '       T.FLGOBRIGARESERVA,'
      '       RESERVAORCAMEN.NUMRESERVA AS NUMRESERVAOLD,'
      '       R.VALOR AS VALORRESERVAOLD,'
      '       R.VLRRESORCAMEN,'
      '       -1 AS IDSEGREGACRITER,'
      '       0 AS CODSUBCONTA,'
      '       0 AS CODSUBCONTAPASS,'
      '       IDPLANOVIRTUAL,'
      '       IDSEGREGACONTR,'
      '       T.FLGOBRQTDECOTAS,'
      '       R.IDPATROORIGEM,'
      '       R.IDPLANOORIGEM,'
      '       PATROORIGEM.NOME AS NOMEPATROORIGEM,'
      '       PLANOORIGEM.NOME AS DESCPLANOORIGEM'
      '  FROM RATEIODOCUM R,'
      '       UNIDNEGOCIO U,'
      '       CENTRESPON C,'
      '       TIPORECEBDESEMB T,'
      '       MOEDA I,'
      '       CENTCUST CC,'
      '       PESSOA PATRO,'
      '       PLANPREVCONTABIL PLANO,'
      '       PROGRAMA,'
      '       RESERVAORCAMEN,'
      '       PESSOA PATROORIGEM,'
      '       PLANPREVCONTABIL PLANOORIGEM,'
      '       DOCUMENTO DOC,'
      '       DOCUMXDOCUM DXD, DOCUMENTO DF'
      ' WHERE (DOC.CODDOCUMENTO = 421999)'
      '      '
      '   AND (T.CODTIPRECDES = R.CODTIPRECDES)'
      '   AND (DF.CODDOCUMENTO = R.CODDOCUMENTO)'
      '   AND (T.RECPAG = R.RECPAG)'
      '   AND (T.IDPESSOA = R.IDPESSOA)'
      '   AND (U.UNIDNEGOC = R.UNIDNEGOC)'
      '   AND (U.IDPESSOA = R.IDPESSOA)'
      '   AND (I.MOECODIGO(+) = R.MOECODIGO)'
      '   AND (C.CODCENTRORESPON(+) = R.CODCENTRORESPON)'
      '   AND (CC.IDEMPRESA(+) = R.IDPESSOA)'
      '   AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '   AND (C.IDPESSOA(+) = R.IDPESSOA)'
      '   AND (PLANO.IDPLANOPREV(+) = R.IDPLANOPREV)'
      '   AND (PROGRAMA.IDPROGRAMA(+) = R.IDPROGRAMA)'
      '   AND (PATRO.IDPESSOA(+) = R.IDPATRO)'
      '   AND (RESERVAORCAMEN.IDRESERVAORCAMEN(+) = R.IDRESERVAORCAMEN)'
      '   AND (PLANOORIGEM.IDPLANOPREV(+) = R.IDPLANOORIGEM)'
      '   AND (PATROORIGEM.IDPESSOA(+) = R.IDPATROORIGEM)'
      '      '
      '   AND DXD.IDDOCUMENTOPAI = DOC.CODDOCUMENTO'
      '   AND DXD.IDDOCUMENTO = R.CODDOCUMENTO'
      '  AND 1 = 2'
      ' '
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = CdsDocumFilhosAR
    Left = 468
    Top = 328
  end
  object CdsDocumFilhosAR: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 328
    object CdsDocumFilhosARCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object CdsDocumFilhosARCARDOCUMENTO: TFloatField
      FieldName = 'CARDOCUMENTO'
    end
    object CdsDocumFilhosARCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object CdsDocumFilhosARRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object CdsDocumFilhosARIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsDocumFilhosARIDRESERVAORCAMEN: TFloatField
      FieldName = 'IDRESERVAORCAMEN'
    end
    object CdsDocumFilhosARCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object CdsDocumFilhosARCODEXTERNOCR: TStringField
      FieldName = 'CODEXTERNOCR'
      FixedChar = True
      Size = 10
    end
    object CdsDocumFilhosARUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object CdsDocumFilhosARMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object CdsDocumFilhosARVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsDocumFilhosARVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
    end
    object CdsDocumFilhosARPLACONTACREDITO: TStringField
      FieldName = 'PLACONTACREDITO'
      FixedChar = True
      Size = 18
    end
    object CdsDocumFilhosARIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
    end
    object CdsDocumFilhosARNOME: TStringField
      FieldName = 'NOME'
      Size = 25
    end
    object CdsDocumFilhosARNOME_1: TStringField
      FieldName = 'NOME_1'
      FixedChar = True
      Size = 30
    end
    object CdsDocumFilhosARCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object CdsDocumFilhosARCODEXTERNOCC: TStringField
      FieldName = 'CODEXTERNOCC'
      FixedChar = True
      Size = 10
    end
    object CdsDocumFilhosARIDRATEIODOCUM: TFloatField
      FieldName = 'IDRATEIODOCUM'
    end
    object CdsDocumFilhosARDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object CdsDocumFilhosARMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object CdsDocumFilhosARNOMECENTROCUSTO: TStringField
      FieldName = 'NOMECENTROCUSTO'
      Size = 30
    end
    object CdsDocumFilhosARPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object CdsDocumFilhosARIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object CdsDocumFilhosARIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
    end
    object CdsDocumFilhosARFLGTIPOPROGRAMA: TStringField
      FieldName = 'FLGTIPOPROGRAMA'
      Size = 3
    end
    object CdsDocumFilhosARNUMIMOVEL: TStringField
      FieldName = 'NUMIMOVEL'
      Size = 60
    end
    object CdsDocumFilhosARNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object CdsDocumFilhosARDESCPLANO: TStringField
      FieldName = 'DESCPLANO'
      Size = 50
    end
    object CdsDocumFilhosARDESCPROGRAMA: TStringField
      FieldName = 'DESCPROGRAMA'
      Size = 60
    end
    object CdsDocumFilhosARHITCODHIST: TStringField
      FieldName = 'HITCODHIST'
      FixedChar = True
      Size = 4
    end
    object CdsDocumFilhosARIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object CdsDocumFilhosARNUMRESERVA: TFloatField
      FieldName = 'NUMRESERVA'
    end
    object CdsDocumFilhosARFLGOBRIGARESERVA: TStringField
      FieldName = 'FLGOBRIGARESERVA'
      FixedChar = True
      Size = 1
    end
    object CdsDocumFilhosARNUMRESERVAOLD: TFloatField
      FieldName = 'NUMRESERVAOLD'
    end
    object CdsDocumFilhosARVALORRESERVAOLD: TFloatField
      FieldName = 'VALORRESERVAOLD'
    end
    object CdsDocumFilhosARVLRRESORCAMEN: TFloatField
      FieldName = 'VLRRESORCAMEN'
    end
    object CdsDocumFilhosARIDSEGREGACRITER: TFloatField
      FieldName = 'IDSEGREGACRITER'
    end
    object CdsDocumFilhosARCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object CdsDocumFilhosARCODSUBCONTAPASS: TFloatField
      FieldName = 'CODSUBCONTAPASS'
    end
    object CdsDocumFilhosARIDPLANOVIRTUAL: TFloatField
      FieldName = 'IDPLANOVIRTUAL'
    end
    object CdsDocumFilhosARIDSEGREGACONTR: TFloatField
      FieldName = 'IDSEGREGACONTR'
    end
    object CdsDocumFilhosARFLGOBRQTDECOTAS: TStringField
      FieldName = 'FLGOBRQTDECOTAS'
      FixedChar = True
      Size = 1
    end
    object CdsDocumFilhosARIDPATROORIGEM: TFloatField
      FieldName = 'IDPATROORIGEM'
    end
    object CdsDocumFilhosARIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object CdsDocumFilhosARNOMEPATROORIGEM: TStringField
      FieldName = 'NOMEPATROORIGEM'
      Size = 60
    end
    object CdsDocumFilhosARDESCPLANOORIGEM: TStringField
      FieldName = 'DESCPLANOORIGEM'
      Size = 50
    end
  end
  object PpDocumFilhoAR: TppBDEPipeline
    DataSource = DsDocumFilhoAR
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'PpDocumFilhoAR'
    Left = 460
    Top = 280
    object PpDocumFilhoARppField1: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField2: TppField
      FieldAlias = 'CARDOCUMENTO'
      FieldName = 'CARDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField3: TppField
      FieldAlias = 'CODTIPRECDES'
      FieldName = 'CODTIPRECDES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField4: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField5: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField6: TppField
      FieldAlias = 'IDRESERVAORCAMEN'
      FieldName = 'IDRESERVAORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField7: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField8: TppField
      FieldAlias = 'CODEXTERNOCR'
      FieldName = 'CODEXTERNOCR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField9: TppField
      FieldAlias = 'UNIDNEGOC'
      FieldName = 'UNIDNEGOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField10: TppField
      FieldAlias = 'MOECODIGO'
      FieldName = 'MOECODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField11: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField12: TppField
      FieldAlias = 'VALOROUTRAMOEDA'
      FieldName = 'VALOROUTRAMOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField13: TppField
      FieldAlias = 'PLACONTACREDITO'
      FieldName = 'PLACONTACREDITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField14: TppField
      FieldAlias = 'IDUSUARIOINCLUSAO'
      FieldName = 'IDUSUARIOINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField15: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField16: TppField
      FieldAlias = 'NOME_1'
      FieldName = 'NOME_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField17: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField18: TppField
      FieldAlias = 'CODEXTERNOCC'
      FieldName = 'CODEXTERNOCC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField19: TppField
      FieldAlias = 'IDRATEIODOCUM'
      FieldName = 'IDRATEIODOCUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField20: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField21: TppField
      FieldAlias = 'MOESIGLA'
      FieldName = 'MOESIGLA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField22: TppField
      FieldAlias = 'NOMECENTROCUSTO'
      FieldName = 'NOMECENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField23: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField24: TppField
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField25: TppField
      FieldAlias = 'IDPROGRAMA'
      FieldName = 'IDPROGRAMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField26: TppField
      FieldAlias = 'FLGTIPOPROGRAMA'
      FieldName = 'FLGTIPOPROGRAMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField27: TppField
      FieldAlias = 'NUMIMOVEL'
      FieldName = 'NUMIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField28: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField29: TppField
      FieldAlias = 'DESCPLANO'
      FieldName = 'DESCPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField30: TppField
      FieldAlias = 'DESCPROGRAMA'
      FieldName = 'DESCPROGRAMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField31: TppField
      FieldAlias = 'HITCODHIST'
      FieldName = 'HITCODHIST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField32: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField33: TppField
      FieldAlias = 'NUMRESERVA'
      FieldName = 'NUMRESERVA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField34: TppField
      FieldAlias = 'FLGOBRIGARESERVA'
      FieldName = 'FLGOBRIGARESERVA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField35: TppField
      FieldAlias = 'NUMRESERVAOLD'
      FieldName = 'NUMRESERVAOLD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField36: TppField
      FieldAlias = 'VALORRESERVAOLD'
      FieldName = 'VALORRESERVAOLD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField37: TppField
      FieldAlias = 'VLRRESORCAMEN'
      FieldName = 'VLRRESORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField38: TppField
      FieldAlias = 'IDSEGREGACRITER'
      FieldName = 'IDSEGREGACRITER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField39: TppField
      FieldAlias = 'CODSUBCONTA'
      FieldName = 'CODSUBCONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField40: TppField
      FieldAlias = 'CODSUBCONTAPASS'
      FieldName = 'CODSUBCONTAPASS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField41: TppField
      FieldAlias = 'IDPLANOVIRTUAL'
      FieldName = 'IDPLANOVIRTUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField42: TppField
      FieldAlias = 'IDSEGREGACONTR'
      FieldName = 'IDSEGREGACONTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField43: TppField
      FieldAlias = 'FLGOBRQTDECOTAS'
      FieldName = 'FLGOBRQTDECOTAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField44: TppField
      FieldAlias = 'IDPATROORIGEM'
      FieldName = 'IDPATROORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField45: TppField
      FieldAlias = 'IDPLANOORIGEM'
      FieldName = 'IDPLANOORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField46: TppField
      FieldAlias = 'NOMEPATROORIGEM'
      FieldName = 'NOMEPATROORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object PpDocumFilhoARppField47: TppField
      FieldAlias = 'DESCPLANOORIGEM'
      FieldName = 'DESCPLANOORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
  end
  object DsDocumFilhoAR: TwwDataSource
    DataSet = CdsDocumFilhosAR
    Left = 370
    Top = 280
  end
end
