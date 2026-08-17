inherited RptAvisoLan: TRptAvisoLan
  Left = 676
  Top = 167
  Width = 270
  Height = 226
  Caption = 'Aviso de Lançamento'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Aviso de Lançamento'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Data Da Planilha'
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
        Caption = 'Referência = Número da A.P.'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
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
        Caption = 'Planilha Inicial'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'MARCADO'
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
        Caption = 'Planilha Final'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'MARCADO'
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
        Caption = 'Planilha Alterada Nº 1'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'MARCADO'
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
        Caption = 'Planilha Alterada Nº 2'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'MARCADO'
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
        Caption = 'Planilha Alterada Nº 3'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'MARCADO'
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
        Caption = 'Planilha Alterada Nº 4'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'MARCADO'
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
        Caption = 'Planilha Alterada Nº 5'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'MARCADO'
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
        Caption = 'Planilha Alterada Nº 6'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'MARCADO'
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
        Caption = 'Planilha Alterada Nº 7'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'MARCADO'
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
        Caption = 'Planilha Alterada Nº 8'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'MARCADO'
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
        Caption = 'Planilha Alterada Nº 9'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'MARCADO'
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
        Caption = 'Plano Previdenciário'
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
        Name = 'Plano'
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
        Caption = 'Patrocinadora'
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
        Name = 'Patro'
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
        Caption = 'Referência'
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
        Name = 'RefCodInterno'
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
        Caption = 'SomenteAPsSelecionadas'
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
        Name = 'SomenteAPsSelecionadas'
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
    FormWidth = 450
    Left = 116
  end
  inherited DevRptCM: TExtraOptions
    Left = 48
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptAvisoLan
  end
  object rptAvisoLan: TppReport
    AutoStop = False
    DataPipeline = pplAvisoLan
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
    Template.FileName = 'C:\Reports2.txt'
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 181
    Top = 48
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAvisoLan'
    object ppHeaderBand16: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand11: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object rptAvisoLanLine15: TppLine
        UserName = 'rptAvisoLanLine15'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 14023
        mmLeft = 529
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object rptAvisoLanLine10: TppLine
        UserName = 'rptAvisoLanLine10'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 14023
        mmLeft = 11377
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'pplAvisoLanppField10'
        AutoSize = True
        DataField = 'NOMECENTCUST'
        DataPipeline = pplAvisoLan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAvisoLan'
        mmHeight = 3260
        mmLeft = 46038
        mmTop = 795
        mmWidth = 23876
        BandType = 4
      end
      object rptAvisoLanLine8: TppLine
        UserName = 'rptAvisoLanLine8'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 14023
        mmLeft = 45508
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object rptAvisoLanLine9: TppLine
        UserName = 'rptAvisoLanLine9'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 14023
        mmLeft = 70115
        mmTop = 0
        mmWidth = 3440
        BandType = 4
      end
      object rptAvisoLanLine12: TppLine
        UserName = 'rptAvisoLanLine12'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 14023
        mmLeft = 164571
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object rptAvisoLanDBText4: TppDBText
        UserName = 'rptAvisoLanDBText4'
        AutoSize = True
        DataField = 'LACVALOR'
        DataPipeline = pplAvisoLan
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAvisoLan'
        mmHeight = 3260
        mmLeft = 178330
        mmTop = 795
        mmWidth = 11007
        BandType = 4
      end
      object rptAvisoLanDBText5: TppDBText
        UserName = 'rptAvisoLanDBText5'
        DataField = 'LACDEBCRE'
        DataPipeline = pplAvisoLan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAvisoLan'
        mmHeight = 3704
        mmLeft = 190500
        mmTop = 794
        mmWidth = 5292
        BandType = 4
      end
      object rptAvisoLanLine16: TppLine
        UserName = 'rptAvisoLanLine16'
        ParentHeight = True
        Position = lpRight
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 14023
        mmLeft = 183621
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'ppDBText9'
        DataField = 'LACNUMLAN'
        DataPipeline = pplAvisoLan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAvisoLan'
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 795
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        AutoSize = True
        DataField = 'PLACONTA'
        DataPipeline = pplAvisoLan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAvisoLan'
        mmHeight = 3260
        mmLeft = 12435
        mmTop = 795
        mmWidth = 12531
        BandType = 4
      end
      object rptAvisoLanLine13: TppLine
        UserName = 'rptAvisoLanLine13'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 14023
        mmLeft = 189442
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 14023
        mmLeft = 105040
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object rptAvisoLanDBText3: TppDBText
        UserName = 'rptAvisoLanDBText3'
        DataField = 'NOMEPLANOPREV'
        DataPipeline = pplAvisoLan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'pplAvisoLan'
        mmHeight = 2910
        mmLeft = 70907
        mmTop = 795
        mmWidth = 34396
        BandType = 4
      end
      object rptAvisoLanDBMemo1: TppDBMemo
        UserName = 'rptAvisoLanDBMemo1'
        CharWrap = False
        DataField = 'HISTORICO'
        DataPipeline = pplAvisoLan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplAvisoLan'
        mmHeight = 3704
        mmLeft = 106098
        mmTop = 795
        mmWidth = 56092
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        KeepTogether = True
        CharWrap = False
        DataField = 'PLANOME'
        DataPipeline = pplAvisoLan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplAvisoLan'
        mmHeight = 3704
        mmLeft = 12700
        mmTop = 5027
        mmWidth = 32015
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        KeepTogether = True
        CharWrap = False
        DataField = 'NOMEPATRO'
        DataPipeline = pplAvisoLan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplAvisoLan'
        mmHeight = 4233
        mmLeft = 70907
        mmTop = 4498
        mmWidth = 33602
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand16: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object rptAvisoLanShape3: TppShape
        UserName = 'rptAvisoLanShape3'
        mmHeight = 15610
        mmLeft = 265
        mmTop = 529
        mmWidth = 196586
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'LblSistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 22754
        mmWidth = 70908
        BandType = 8
      end
      object rptAvisoLanLine17: TppLine
        UserName = 'rptAvisoLanLine17'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15610
        mmLeft = 92340
        mmTop = 529
        mmWidth = 13229
        BandType = 8
      end
      object rptAvisoLanLabel9: TppLabel
        UserName = 'rptAvisoLanLabel9'
        Caption = 'Preparado por:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 32279
        mmTop = 2117
        mmWidth = 21696
        BandType = 8
      end
      object rptAvisoLanDBText6: TppDBText
        UserName = 'rptAvisoLanDBText6'
        AutoSize = True
        DataField = 'NOMEUSUARIO'
        DataPipeline = pplAvisoLan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAvisoLan'
        mmHeight = 4911
        mmLeft = 28575
        mmTop = 8731
        mmWidth = 27940
        BandType = 8
      end
      object rptAvisoLanLabel10: TppLabel
        UserName = 'rptAvisoLanLabel10'
        Caption = 'Conferido por:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 136790
        mmTop = 2117
        mmWidth = 19727
        BandType = 8
      end
      object rptAvisoLanLine18: TppLine
        UserName = 'rptAvisoLanLine18'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 113242
        mmTop = 13229
        mmWidth = 66940
        BandType = 8
      end
      object ppCalc11: TppSystemVariable
        UserName = 'Calc11'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 84402
        mmTop = 22754
        mmWidth = 28575
        BandType = 8
      end
      object ppCalc17: TppSystemVariable
        UserName = 'Calc17'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 22754
        mmWidth = 26194
        BandType = 8
      end
    end
    object rptAvisoLanGroup1: TppGroup
      BreakName = 'PLNREFERENCIA'
      DataPipeline = pplAvisoLan
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rptAvisoLanGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAvisoLan'
      object rptAvisoLanGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 17992
        mmPrintPosition = 0
        object rptAvisoLanShape1: TppShape
          UserName = 'rptAvisoLanShape1'
          Visible = False
          mmHeight = 10848
          mmLeft = 0
          mmTop = 6350
          mmWidth = 196586
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'ppLabel2'
          Caption = 'AVISO DE LANÇAMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 16
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          Visible = False
          mmHeight = 6350
          mmLeft = 65617
          mmTop = 8467
          mmWidth = 66146
          BandType = 3
          GroupNo = 0
        end
        object rptAvisoLanLine1: TppLine
          UserName = 'rptAvisoLanLine1'
          Position = lpLeft
          Visible = False
          Weight = 0.75
          mmHeight = 10848
          mmLeft = 26723
          mmTop = 6350
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object rptAvisoLanLine2: TppLine
          UserName = 'rptAvisoLanLine2'
          Position = lpLeft
          Visible = False
          Weight = 0.75
          mmHeight = 10848
          mmLeft = 167217
          mmTop = 6350
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object rptAvisoLanLabel11: TppLabel
          UserName = 'rptAvisoLanLabel11'
          Caption = 'Referência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          mmHeight = 3704
          mmLeft = 167217
          mmTop = 7408
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
        object rptAvisoLanDBText7: TppDBText
          UserName = 'rptAvisoLanDBText7'
          AutoSize = True
          DataField = 'PLNREFERENCIA'
          DataPipeline = pplAvisoLan
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pplAvisoLan'
          mmHeight = 4191
          mmLeft = 186532
          mmTop = 11642
          mmWidth = 9737
          BandType = 3
          GroupNo = 0
        end
        object rptAvisoLanLabel12: TppLabel
          UserName = 'rptAvisoLanLabel12'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          mmHeight = 4233
          mmLeft = 167217
          mmTop = 11642
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          Tag = 1
          UserName = 'Label2'
          Caption = 'FUNCEF  - Fundação dos Economiários Federais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 5821
          mmLeft = 33073
          mmTop = 9525
          mmWidth = 126471
          BandType = 3
          GroupNo = 0
        end
      end
      object rptAvisoLanGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 1588
        mmPrintPosition = 0
        object ppMemoAvisoAP: TppMemo
          UserName = 'MemoAvisoAP'
          Caption = 'MemoAvisoAP'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            
              'Eventualmente, os totais a Débito / Crédito da planilha de OPERA' +
              'ÇÃO 5 podem não “zerar” em função de que existem outros lançamen' +
              'tos para a mesma planilha. Para visualizar todos os lançamentos,' +
              ' solicite novamente o relatório assinalando a caixa de verificaç' +
              'ão '#39'Visualizar todos os lançamentos contábeis das planilhas'#39)
          TextAlignment = taFullJustified
          Visible = False
          mmHeight = 794
          mmLeft = 1323
          mmTop = 794
          mmWidth = 194734
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PLNPLANIL'
      DataPipeline = pplAvisoLan
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAvisoLan'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 22754
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          mmHeight = 14552
          mmLeft = 529
          mmTop = 265
          mmWidth = 196321
          BandType = 3
          GroupNo = 1
        end
        object rptAvisoLanShape2: TppShape
          UserName = 'rptAvisoLanShape2'
          mmHeight = 8467
          mmLeft = 794
          mmTop = 14288
          mmWidth = 196321
          BandType = 3
          GroupNo = 1
        end
        object rptAvisoLanLine14: TppLine
          UserName = 'rptAvisoLanLine14'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8467
          mmLeft = 189442
          mmTop = 14288
          mmWidth = 8202
          BandType = 3
          GroupNo = 1
        end
        object rptAvisoLanLabel1: TppLabel
          UserName = 'rptAvisoLanLabel1'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 10848
          mmTop = 1323
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object rptAvisoLanDBText1: TppDBText
          UserName = 'rptAvisoLanDBText1'
          AutoSize = True
          DataField = 'PLNDATDIA'
          DataPipeline = pplAvisoLan
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAvisoLan'
          mmHeight = 3810
          mmLeft = 5821
          mmTop = 8202
          mmWidth = 15833
          BandType = 3
          GroupNo = 1
        end
        object rptAvisoLanLabel2: TppLabel
          UserName = 'rptAvisoLanLabel2'
          Caption = 'Planilha:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 157427
          mmTop = 10319
          mmWidth = 11906
          BandType = 3
          GroupNo = 1
        end
        object rptAvisoLanDBText2: TppDBText
          UserName = 'rptAvisoLanDBText2'
          AutoSize = True
          DataField = 'PLNPLANIL'
          DataPipeline = pplAvisoLan
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAvisoLan'
          mmHeight = 4191
          mmLeft = 175367
          mmTop = 10054
          mmWidth = 5630
          BandType = 3
          GroupNo = 1
        end
        object rptAvisoLanLine5: TppLine
          UserName = 'rptAvisoLanLine5'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8467
          mmLeft = 11377
          mmTop = 14288
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object rptAvisoLanLabel3: TppLabel
          UserName = 'rptAvisoLanLabel3'
          Caption = 'Ordem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 16669
          mmWidth = 10054
          BandType = 3
          GroupNo = 1
        end
        object rptAvisoLanLabel4: TppLabel
          UserName = 'rptAvisoLanLabel4'
          Caption = 'Conta Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 16669
          mmWidth = 21167
          BandType = 3
          GroupNo = 1
        end
        object rptAvisoLanLine6: TppLine
          UserName = 'rptAvisoLanLine6'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8467
          mmLeft = 45508
          mmTop = 14288
          mmWidth = 3175
          BandType = 3
          GroupNo = 1
        end
        object rptAvisoLanLine7: TppLine
          UserName = 'rptAvisoLanLine7'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8467
          mmLeft = 70115
          mmTop = 14288
          mmWidth = 2381
          BandType = 3
          GroupNo = 1
        end
        object rptAvisoLanLabel5: TppLabel
          UserName = 'rptAvisoLanLabel5'
          AutoSize = False
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 52388
          mmTop = 14817
          mmWidth = 14817
          BandType = 3
          GroupNo = 1
        end
        object rptAvisoLanLabel6: TppLabel
          UserName = 'rptAvisoLanLabel6'
          AutoSize = False
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3704
          mmLeft = 106098
          mmTop = 17198
          mmWidth = 14817
          BandType = 3
          GroupNo = 1
        end
        object rptAvisoLanLine11: TppLine
          UserName = 'rptAvisoLanLine11'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8467
          mmLeft = 164571
          mmTop = 14288
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object rptAvisoLanLabel7: TppLabel
          UserName = 'rptAvisoLanLabel7'
          Caption = 'Valores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 165365
          mmTop = 16669
          mmWidth = 10054
          BandType = 3
          GroupNo = 1
        end
        object rptAvisoLanLabel8: TppLabel
          UserName = 'rptAvisoLanLabel8'
          Caption = 'D/C'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 190765
          mmTop = 16669
          mmWidth = 4763
          BandType = 3
          GroupNo = 1
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8467
          mmLeft = 105040
          mmTop = 14023
          mmWidth = 4233
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Aviso de Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 16
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 6615
          mmLeft = 65881
          mmTop = 1588
          mmWidth = 57944
          BandType = 3
          GroupNo = 1
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 14288
          mmLeft = 27781
          mmTop = 265
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Referência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 157957
          mmTop = 529
          mmWidth = 28046
          BandType = 3
          GroupNo = 1
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'PLNREFERENCIA'
          DataPipeline = pplAvisoLan
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          SuppressRepeatedValues = True
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAvisoLan'
          mmHeight = 4191
          mmLeft = 186267
          mmTop = 3175
          mmWidth = 9737
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Nº. A.P'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 167217
          mmTop = 3704
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppLine5: TppLine
          Tag = 1
          UserName = 'Line5'
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 529
          mmTop = 6085
          mmWidth = 27252
          BandType = 3
          GroupNo = 1
        end
        object ppLine6: TppLine
          Tag = 1
          UserName = 'Line6'
          Weight = 0.75
          mmHeight = 2381
          mmLeft = 156634
          mmTop = 8731
          mmWidth = 40481
          BandType = 3
          GroupNo = 1
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 14288
          mmLeft = 156104
          mmTop = 265
          mmWidth = 28840
          BandType = 3
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 3440
          mmLeft = 70908
          mmTop = 14817
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 3440
          mmLeft = 70908
          mmTop = 18785
          mmWidth = 21960
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppLine36: TppLine
          UserName = 'ppLine36'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 265
          mmTop = 0
          mmWidth = 196586
          BandType = 5
          GroupNo = 1
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 265
          mmTop = 0
          mmWidth = 196586
          BandType = 5
          GroupNo = 1
        end
        object ppVariable1: TppVariable
          Tag = 1
          UserName = 'Variable1'
          CalcOrder = 0
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup1
          ResetType = veGroupEnd
          TextAlignment = taRightJustified
          mmHeight = 3260
          mmLeft = 177007
          mmTop = 1852
          mmWidth = 11938
          BandType = 5
          GroupNo = 1
        end
        object ppVariable2: TppVariable
          Tag = 1
          UserName = 'Variable2'
          CalcOrder = 1
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup1
          ResetType = veGroupEnd
          TextAlignment = taRightJustified
          mmHeight = 3260
          mmLeft = 177007
          mmTop = 6615
          mmWidth = 11938
          BandType = 5
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Total Débito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3704
          mmLeft = 143934
          mmTop = 1323
          mmWidth = 19315
          BandType = 5
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Total Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3704
          mmLeft = 143934
          mmTop = 6350
          mmWidth = 19315
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365069970726F636564757265205661726961
        626C65314F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A69662028206C417669736F4C616E5B274C41434445424352
        45275D203D2027442729205448454E200D0A56616C7565203A3D2056616C7565
        202B206C417669736F4C616E5B274C414356414C4F52275D3B200D0A0D0A0D0A
        0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609566172696162
        6C6531094576656E744E616D6506064F6E43616C63074576656E744944022100
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65324F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365069270726F636564757265205661726961
        626C65324F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A69662028206C417669736F4C616E5B274C41434445424352
        45275D203D2027432729205448454E200D0A56616C7565203A3D2056616C7565
        202B206C417669736F4C616E5B274C414356414C4F52275D3B0D0A0D0A656E64
        3B0D0A0D436F6D706F6E656E744E616D6506095661726961626C653209457665
        6E744E616D6506064F6E43616C63074576656E74494402210000}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object pplAvisoLan: TppBDEPipeline
    DataSource = dsAvisoLan
    UserName = 'lAvisoLan'
    Left = 149
    Top = 48
    object pplAvisoLanppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNREFERENCIA'
      FieldName = 'PLNREFERENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplAvisoLanppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMLANCTO'
      FieldName = 'NUMLANCTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplAvisoLanppField3: TppField
      FieldAlias = 'OPERACAO'
      FieldName = 'OPERACAO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 2
    end
    object pplAvisoLanppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplAvisoLanppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNPLANIL'
      FieldName = 'PLNPLANIL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplAvisoLanppField6: TppField
      FieldAlias = 'PLNDATDIA'
      FieldName = 'PLNDATDIA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object pplAvisoLanppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDUSUARIOINCLUSAO'
      FieldName = 'IDUSUARIOINCLUSAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplAvisoLanppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNTOTDEB'
      FieldName = 'PLNTOTDEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplAvisoLanppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNTOTCRE'
      FieldName = 'PLNTOTCRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplAvisoLanppField10: TppField
      FieldAlias = 'NOMEUSUARIO'
      FieldName = 'NOMEUSUARIO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 9
    end
    object pplAvisoLanppField11: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 10
    end
    object pplAvisoLanppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'LACNUMLAN'
      FieldName = 'LACNUMLAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplAvisoLanppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'LACVALOR'
      FieldName = 'LACVALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplAvisoLanppField14: TppField
      FieldAlias = 'LACDEBCRE'
      FieldName = 'LACDEBCRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 13
    end
    object pplAvisoLanppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplAvisoLanppField16: TppField
      FieldAlias = 'HITCODHIST'
      FieldName = 'HITCODHIST'
      FieldLength = 4
      DisplayWidth = 4
      Position = 15
    end
    object pplAvisoLanppField17: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 16
    end
    object pplAvisoLanppField18: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 204
      DisplayWidth = 204
      Position = 17
    end
    object pplAvisoLanppField19: TppField
      FieldAlias = 'NOMECENTCUST'
      FieldName = 'NOMECENTCUST'
      FieldLength = 30
      DisplayWidth = 30
      Position = 18
    end
    object pplAvisoLanppField20: TppField
      FieldAlias = 'PLANOME'
      FieldName = 'PLANOME'
      FieldLength = 40
      DisplayWidth = 40
      Position = 19
    end
    object pplAvisoLanppField21: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 20
    end
    object pplAvisoLanppField22: TppField
      FieldAlias = 'NOMEPLANOPREV'
      FieldName = 'NOMEPLANOPREV'
      FieldLength = 50
      DisplayWidth = 50
      Position = 21
    end
  end
  object dsAvisoLan: TwwDataSource
    DataSet = cdsAvisoLan
    Left = 85
    Top = 48
  end
  object cdsAvisoLan: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 48
    Data = {
      6B0800009619E0BD010000001800000016000700000003000000C3020D504C4E
      5245464552454E4349410800040000000000094E554D4C414E43544F08000400
      00000000084F5045524143414F01004900000002000753554254595045020049
      000A004669786564436861720005574944544802000200020009504C4E434F44
      49474F080004000000000009504C4E504C414E494C080004000000000009504C
      4E44415444494108000800000000001149445553554152494F494E434C555341
      4F080004000000000009504C4E544F54444542080004000000000009504C4E54
      4F5443524508000400000000000B4E4F4D455553554152494F01004900000001
      0005574944544802000200280008504C41434F4E544101004900000002000753
      554254595045020049000A004669786564436861720005574944544802000200
      1200094C41434E554D4C414E0800040000000000084C414356414C4F52080004
      0000000000094C41434445424352450100490000000200075355425459504502
      0049000A00466978656443686172000557494454480200020001000749445041
      54524F08000400000000000A484954434F444849535401004900000002000753
      554254595045020049000A004669786564436861720005574944544802000200
      04000E434F4443454E54524F435553544F010049000000020007535542545950
      45020049000A0046697865644368617200055749445448020002000A00094849
      53544F5249434F010049000000010005574944544802000200CC000C4E4F4D45
      43454E54435553540100490000000100055749445448020002001E0007504C41
      4E4F4D450100490000000100055749445448020002002800094E4F4D45504154
      524F0100490000000100055749445448020002003C000D4E4F4D45504C414E4F
      5052455601004900000001000557494454480200020032000100044C43494404
      000100090800000000000440110000000000C05DE14000000000043F13410132
      0000000064821A410000000000788C400000803DA4CCCC420000000000E07F40
      000000000088B340000000000088B340083231333130323033000000000000F0
      3F000000000088B3400143000000003A7637412E323030373131313220434D20
      534F4C55434F455320494E464F524D4154494341204C54444131204869737420
      2020074C45545241204305434F4D554D05434F4D554D00000004401100000000
      00C05DE14000000000043F134101320000000064821A410000000000788C4000
      00803DA4CCCC420000000000E07F40000000000088B340000000000088B34008
      35323831303130330000000000000040000000000088B3400144000000003A76
      37412E323030373131313220434D20534F4C55434F455320494E464F524D4154
      494341204C5444413120486973742020200B3133BA2053414C4152494F05434F
      4D554D05434F4D554D0000000440110000000000C05DE14000000000103F1341
      01340000000070821A410000000000808C400000803DA4CCCC420000000000E0
      7F400000000000C052400000000000C052400832313331303230330000000000
      00F03F0000000000C052400144000000003A7637415149525246202D2020464F
      524E454345444F5220446F632E203230303731313132203120434D20534F4C55
      434F455320494E464F524D4154494341204C544441204952524620464F524E45
      4345444F522020074C45545241204305434F4D554D05434F4D554D0000000440
      110000000000C05DE14000000000103F134101340000000070821A4100000000
      00808C400000803DA4CCCC420000000000E07F400000000000C0524000000000
      00C0524008323131313031303100000000000000400000000000804640014300
      000000000008405149525246202D2020464F524E454345444F5220446F632E20
      3230303731313132203120434D20534F4C55434F455320494E464F524D415449
      4341204C544441204952524620464F524E454345444F5220200B504C414E4F20
      524546455204434254551A4342545520436F6E747269627569E7E36F20446566
      696E6964610000000440110000000000C05DE14000000000103F134101340000
      000070821A410000000000808C400000803DA4CCCC420000000000E07F400000
      000000C052400000000000C05240083231313130313031000000000000084000
      00000000003E400143000000000000F03F5149525246202D2020464F524E4543
      45444F5220446F632E203230303731313132203120434D20534F4C55434F4553
      20494E464F524D4154494341204C544441204952524620464F524E454345444F
      5220200B504C414E4F2052454645520552464653411B524646534120436F6E74
      7269627569E7E36F20446566696E6964610000000440110000000000C05DE140
      000000001C3F13410135000000007C821A410000000000988C400000803DA4CC
      CC420000000000E07F40000000008029C540000000008029C540083231333130
      323033000000000000F03F00000000003DB3400144000000003A76374155444F
      4320454C4554524F4E49434F204EBA203336373330205265662E20506167616D
      656E746F20446F632E203230303731313132203120434D20534F4C55434F4553
      20494E464F524D4154494341204C5444412020074C45545241204305434F4D55
      4D05434F4D554D0000000440110000000000C05DE140000000001C3F13410135
      000000007C821A410000000000988C400000803DA4CCCC420000000000E07F40
      000000008029C540000000008029C54006313131313036000000000000004000
      0000008029C5400143000000003A763741485265662E20506167746F20646F20
      4C6F7465204EBA3A20333637333020466F726E656365646F723A20434D20534F
      4C55434F455320494E464F524D4154494341204C544441202020087461766172
      65733205434F4D554D05434F4D554D}
  end
  object sqlAvisoLan: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  DOC.NUMAPGR AS PLNREFERENCIA, '
      '  LDC.NUMLANCTO, LDC.OPERACAO, '
      
        '  PLN.PLNCODIGO, PLN.PLNPLANIL,  PLN.PLNDATDIA,       PLN.IDUSUA' +
        'RIOINCLUSAO, '
      '  PLN.PLNTOTDEB, PLN.PLNTOTCRE, '
      '  USU.NOMEUSUARIO,'
      
        '  LAN.PLACONTA,  LAN.LACNUMLAN,  LAN.LACVALOR,        LAN.LACDEB' +
        'CRE,  '
      '  LAN.IDPATRO,   LAN.HITCODHIST, LAN.CODCENTROCUSTO, '
      
        '  RTRIM(LAN.LACHIST1)||'#39' '#39'||RTRIM(LAN.LACHIST2)||'#39' '#39'||RTRIM(LAN.' +
        'LACHIST3)||'#39' '#39'|| '
      '  RTRIM(LAN.LACHIST4)||'#39' '#39'||RTRIM(LAN.LACHIST5) AS HISTORICO, '
      '  CDC.NOME AS NOMECENTCUST, '
      '  PLC.PLANOME AS PLANOME, '
      '  PESSPT.NOME AS NOMEPATRO, '
      '  PPC.NOME AS NOMEPLANOPREV '
      'FROM '
      '  DOCUMENTO DOC, LANCTODOCUM LDC, PLANILHA PLN, LANCAMENTO LAN, '
      '  PESSOA PESSPT, USUARIO USU,     CENTCUST CDC, PLANOCONTA PLC, '
      '  PLANPREVCONTABIL PPC '
      'WHERE '
      '      ( 1 = 1 ) '
      '  AND ( ( DOC.NUMAPGR IN (35566,35566 ) ) OR '
      
        '        ( ( DOC.NUMAPGR  >= 35566 ) AND           ( DOC.NUMAPGR ' +
        '<= 35566 ) ) )'
      
        '  AND ( ( DOC.CODDOCUMENTO =  LAN.CODDOCUMENTO ) OR ( LAN.CODDOC' +
        'UMENTO IS NULL) ) '
      '  AND ( DOC.CODDOCUMENTO      = LDC.CODDOCUMENTO ) '
      '  AND ( LDC.PLNCODIGO         = PLN.PLNCODIGO ) '
      '  AND ( PLN.IDUSUARIOINCLUSAO = USU.CODUSUARIO(+) ) '
      '  AND ( PLN.PLNCODIGO         = LAN.PLNCODIGO ) '
      '  AND ( LAN.IDPATRO           = PESSPT.IDPESSOA ) '
      '  AND ( LAN.IDPLANOPREV       = PPC.IDPLANOPREV ) '
      '  AND ( LAN.CODCENTROCUSTO    = CDC.CODCENTROCUSTO(+) ) '
      '  AND ( LAN.PLANO             = PLC.PLANO ) '
      '  AND ( LAN.PLACONTA          = PLC.PLACONTA ) '
      'ORDER BY '
      '  DOC.NUMAPGR, PLN.PLNPLANIL, LAN.LACNUMLAN')
    ClientDataSet = cdsAvisoLan
    Left = 56
    Top = 48
  end
  object sqlPlanilSRef: TCMSqlParams
    SQL.Strings = (
      
        'SELECT P.PLNCODIGO, L.CODDOCUMENTO, P.PLNPLANIL, D.NUMAPGR, P.PL' +
        'NREFERENCIA'
      'FROM LANCTODOCUM L, DOCUMENTO D, PLANILHA P'
      'WHERE (1 = 2)'
      ' ')
    ClientDataSet = cdsPlanilSRef
    Left = 56
    Top = 96
  end
  object cdsPlanilSRef: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 96
    Data = {
      860000009619E0BD010000001800000005000000000003000000860009504C4E
      434F4449474F08000400000000000C434F44444F43554D454E544F0800040000
      00000009504C4E504C414E494C0800040000000000074E554D41504752080004
      00000000000D504C4E5245464552454E43494108000400000000000100044C43
      49440400010009080000}
  end
end
