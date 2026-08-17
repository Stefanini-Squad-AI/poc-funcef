inherited rptEnvDocContab: TrptEnvDocContab
  Left = 413
  Top = 184
  Width = 560
  Height = 326
  Caption = 'rptEnvDocContab'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 40
    Top = 56
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'DataIni'
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
        Caption = 'DataFim'
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
        Caption = 'NumAP'
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
        Caption = 'VlrLiquido'
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
        Caption = 'IdEnvio'
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
        Caption = 'Encaminhado'
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
        Caption = 'Não Encaminhado'
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
        Caption = 'Data Envio'
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
        Caption = 'TipoData'
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
        Caption = 'Código do Lancamento'
        Controle = tcMemo
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
        Name = 'CODLANCFINANC'
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
        Caption = 'ArquivoMovimento'
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
        Name = 'ArquivoMovimento'
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
        Caption = 'ArquivoDocumento'
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
        Name = 'ArquivoDocumento'
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
    Report = ppReport1
    ConnectionType = cntBDE
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 200
    Top = 8
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38629
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'ShapDrill1'
        Brush.Color = clInactiveBorder
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 0
        mmTop = 33867
        mmWidth = 197644
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Envio de Documentos para a contabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 5821
        mmLeft = 53711
        mmTop = 7144
        mmWidth = 109009
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        DataField = 'IMAGEM'
        DataPipeline = ppBDECabecario
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppBDECabecario'
        mmHeight = 23813
        mmLeft = 529
        mmTop = 1588
        mmWidth = 45508
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Sistema de Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 84138
        mmTop = 34396
        mmWidth = 29104
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 529
        mmTop = 34396
        mmWidth = 12277
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Dt Finan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 115888
        mmTop = 34396
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Dt Disp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 135467
        mmTop = 34396
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Chq / Borderô'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 34396
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 188648
        mmTop = 34396
        mmWidth = 7112
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'DTENVIO'
        DataPipeline = ppBDECabecario
        DisplayFormat = 'DD/MM/YYYY HH:MM '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDECabecario'
        mmHeight = 2910
        mmLeft = 43392
        mmTop = 30163
        mmWidth = 36248
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'CODENVIO'
        DataPipeline = ppBDECabecario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDECabecario'
        mmHeight = 2910
        mmLeft = 13759
        mmTop = 30163
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'USUENVIO'
        DataPipeline = ppBDECabecario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDECabecario'
        mmHeight = 2879
        mmLeft = 13759
        mmTop = 26195
        mmWidth = 71438
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Usuário:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 26195
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Código:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 29898
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 36248
        mmTop = 29898
        mmWidth = 5969
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppSubRprtDocumento: TppSubReport
        OnPrint = ppSubRprtDocumentoPrint
        UserName = 'SubRprtDocumento'
        DrillDownComponent = ppShapDrill
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDBDocumento'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 5819
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDBDocumento
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 192
          Top = 120
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBDocumento'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppShape3: TppShape
              UserName = 'Shape3'
              Brush.Color = cl3DLight
              Pen.Style = psClear
              mmHeight = 4763
              mmLeft = 2381
              mmTop = 264
              mmWidth = 195527
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              Caption = 'N° Documento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3439
              mmLeft = 31750
              mmTop = 1270
              mmWidth = 19578
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label11'
              Caption = 'Cliente \ Fornecedor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3439
              mmLeft = 53975
              mmTop = 1270
              mmWidth = 30427
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Valor Pago'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3439
              mmLeft = 157427
              mmTop = 1270
              mmWidth = 17198
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'Valor Bruto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 180711
              mmTop = 1270
              mmWidth = 15875
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label101'
              Caption = 'N° AP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3439
              mmLeft = 136525
              mmTop = 1270
              mmWidth = 7673
              BandType = 1
            end
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = 'N° Planilha Contab.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3439
              mmLeft = 3175
              mmTop = 1270
              mmWidth = 26195
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              DataField = 'NODOCUMENTO'
              DataPipeline = ppDBDocumento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBDocumento'
              mmHeight = 3175
              mmLeft = 32015
              mmTop = 0
              mmWidth = 19579
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'NOME'
              DataPipeline = ppDBDocumento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBDocumento'
              mmHeight = 3175
              mmLeft = 53711
              mmTop = 0
              mmWidth = 81492
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'VLRLIQUIDO'
              DataPipeline = ppDBDocumento
              DisplayFormat = '#,##0.00;(#,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBDocumento'
              mmHeight = 3175
              mmLeft = 153194
              mmTop = 0
              mmWidth = 21431
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText101'
              DataField = 'VLRBRUTO'
              DataPipeline = ppDBDocumento
              DisplayFormat = '#,##0.00;(#,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBDocumento'
              mmHeight = 3175
              mmLeft = 175419
              mmTop = 0
              mmWidth = 21167
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'NUMAPGR'
              DataPipeline = ppDBDocumento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBDocumento'
              mmHeight = 3175
              mmLeft = 136525
              mmTop = 0
              mmWidth = 16404
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'PLNPLANIL'
              DataPipeline = ppDBDocumento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBDocumento'
              mmHeight = 3175
              mmLeft = 3175
              mmTop = 0
              mmWidth = 26458
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2117
            mmPrintPosition = 0
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
      object ppShapDrill: TppShape
        UserName = 'ShapDrill'
        Brush.Color = clInfoBk
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 529
        mmWidth = 197644
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'HISTORICO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 1323
        mmWidth = 82021
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATALANCFINAN'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 115888
        mmTop = 1323
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DATADISPFINANC'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 135467
        mmTop = 1323
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VALORLANCFINAN'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 173567
        mmTop = 1323
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NUMCHQBORDERO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 153988
        mmTop = 1323
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'NOMEMODULO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 83608
        mmTop = 1323
        mmWidth = 29898
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 265
        mmLeft = 0
        mmTop = 794
        mmWidth = 196586
        BandType = 8
      end
      object ppLabel22: TppLabel
        UserName = 'ppLabel22'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2117
        mmWidth = 196057
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 2117
        mmWidth = 17198
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 92340
        mmTop = 1852
        mmWidth = 16341
        BandType = 8
      end
    end
    object daDataModule1: TdaDataModule
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DsMovimento
    UserName = 'DBPipeline1'
    Left = 450
    Top = 168
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'SELECIONADO'
      FieldName = 'SELECIONADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORLANCFINAN'
      FieldName = 'VALORLANCFINAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'NUMCHQBORDERO'
      FieldName = 'NUMCHQBORDERO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'DATALANCFINAN'
      FieldName = 'DATALANCFINAN'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'ENTRADASAIDA'
      FieldName = 'ENTRADASAIDA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'DATADISPFINANC'
      FieldName = 'DATADISPFINANC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDENVIODOCUMENTO'
      FieldName = 'IDENVIODOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODLANCFINANC'
      FieldName = 'CODLANCFINANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'NOMEMODULO'
      FieldName = 'NOMEMODULO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'PORTADORCONTA'
      FieldName = 'PORTADORCONTA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
  end
  object DsMovimento: TDataSource
    AutoEdit = False
    DataSet = CdsMovimento
    Left = 200
    Top = 160
  end
  object SQLMovimento: TCMSqlParams
    SQL.Strings = (
      'SELECT (0) AS SELECIONADO'
      
        '      ,DECODE(MOV.IDENVIODOCUMENTO, NULL,'#39'Não Encaminhado'#39', '#39'Enc' +
        'aminhado'#39') AS STATUS'
      '      ,MOV.HISTORICO'
      '      ,MOV.VALORLANCFINAN'
      '      ,MOV.NUMCHQBORDERO'
      '      ,MOV.DATALANCFINAN'
      '      ,MOV.ENTRADASAIDA'
      '      ,MOV.DATADISPFINANC'
      '      ,MOV.IDENVIODOCUMENTO'
      '      ,MOV.CODLANCFINANC'
      '      ,MOD.NOMEMODULO'
      '      ,PORT.DESCRICAO AS PORTADORCONTA'
      '      ,0 AS PLNCODIGO'
      'FROM MOVIMFINANC MOV, MODULO MOD, PORTADORCONTA PORT'
      'WHERE MOV.IDPESSOA = 1'
      ' AND MOV.IDMODULO = MOD.IDMODULO'
      ' AND MOV.CODPORTADOR = PORT.CODPORTADOR'
      ' AND MOV.DATALANCFINAN >= TO_DATE('#39'01/02/2008'#39','#39'DD/MM/YYYY'#39')'
      ' AND MOV.DATALANCFINAN <= TO_DATE('#39'26/03/2008'#39','#39'DD/MM/YYYY'#39')'
      ' AND MOV.IDENVIODOCUMENTO IS NULL'
      ' AND MOV.CODLANCFINANC IN (133420,133403,133440)'
      ''
      ' ')
    ClientDataSet = CdsMovimento
    Left = 32
    Top = 160
  end
  object CdsMovimento: TCMClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'SELECIONADO'
        DataType = ftFloat
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'VALORLANCFINAN'
        DataType = ftFloat
      end
      item
        Name = 'NUMCHQBORDERO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DATALANCFINAN'
        DataType = ftDateTime
      end
      item
        Name = 'ENTRADASAIDA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATADISPFINANC'
        DataType = ftDateTime
      end
      item
        Name = 'IDENVIODOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'VALORDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'PLANILHA'
        DataType = ftFloat
      end
      item
        Name = 'PLNCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'NOMEMODULO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PORTADORCONTA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    Left = 120
    Top = 160
    object CdsMovimentoSELECIONADO: TFloatField
      FieldName = 'SELECIONADO'
    end
    object CdsMovimentoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 15
    end
    object CdsMovimentoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 60
    end
    object CdsMovimentoVALORLANCFINAN: TFloatField
      FieldName = 'VALORLANCFINAN'
    end
    object CdsMovimentoNUMCHQBORDERO: TStringField
      FieldName = 'NUMCHQBORDERO'
      FixedChar = True
      Size = 15
    end
    object CdsMovimentoDATALANCFINAN: TDateTimeField
      FieldName = 'DATALANCFINAN'
    end
    object CdsMovimentoENTRADASAIDA: TStringField
      FieldName = 'ENTRADASAIDA'
      FixedChar = True
      Size = 1
    end
    object CdsMovimentoDATADISPFINANC: TDateTimeField
      FieldName = 'DATADISPFINANC'
    end
    object CdsMovimentoIDENVIODOCUMENTO: TFloatField
      FieldName = 'IDENVIODOCUMENTO'
    end
    object CdsMovimentoCODLANCFINANC: TFloatField
      FieldName = 'CODLANCFINANC'
    end
    object CdsMovimentoNOMEMODULO: TStringField
      FieldName = 'NOMEMODULO'
      FixedChar = True
      Size = 50
    end
    object CdsMovimentoPORTADORCONTA: TStringField
      FieldName = 'PORTADORCONTA'
      Size = 50
    end
  end
  object ppBDECabecario: TppBDEPipeline
    DataSource = dsCabecario
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'Cabecario'
    Left = 296
    Top = 8
    object ppBDECabecarioppField1: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDECabecarioppField2: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDECabecarioppField3: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDECabecarioppField4: TppField
      FieldAlias = 'USUENVIO'
      FieldName = 'USUENVIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDECabecarioppField5: TppField
      FieldAlias = 'DTENVIO'
      FieldName = 'DTENVIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDECabecarioppField6: TppField
      FieldAlias = 'CODENVIO'
      FieldName = 'CODENVIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object sqlCabecario: TCMSqlParams
    SQL.Strings = (
      
        'SELECT RAZAOSOCIAL, NUMDOCUMENTO, IMAGEM, USUENVIO, DTENVIO, COD' +
        'ENVIO'
      'FROM ('
      'SELECT'
      '  P.RAZAOSOCIAL, P.NUMDOCUMENTO, I.IMAGEM, 1 AS REG'
      'FROM'
      '  PESSOA P, IMAGENS I'
      'WHERE'
      '  ( I.IDIMAGEM = P.IDIMAGEM ) AND'
      '  (P.IDPESSOA = 1)'
      '   ),('
      '   SELECT E.TRGDTINCLUSAO    AS DTENVIO'
      '         ,E.IDENVIODOCUMENTO AS CODENVIO'
      '         ,P.NOME             AS USUENVIO'
      '         ,1                AS REG2'
      '   FROM ENVIODOCUMENTO E, PESSOA P'
      '   WHERE E.IDUSUARIO  = P.IDPESSOA'
      '     AND E.IDENVIODOCUMENTO = 3'
      '   )'
      'WHERE REG = REG2'
      ''
      ' ')
    ClientDataSet = cdsCabecario
    Left = 32
    Top = 104
  end
  object cdsCabecario: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'RAZAOSOCIAL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NUMDOCUMENTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'IMAGEM'
        DataType = ftBlob
        Size = 1
      end
      item
        Name = 'USUENVIO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DTENVIO'
        DataType = ftDateTime
      end
      item
        Name = 'CODENVIO'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    Left = 120
    Top = 104
  end
  object dsCabecario: TwwDataSource
    DataSet = cdsCabecario
    Left = 200
    Top = 104
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 280
    Top = 104
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  (0) AS SELECIONADO,'
      
        '  DECODE(MOV.IDENVIODOCUMENTO, NULL,'#39'Não Encaminhado'#39', '#39'Encaminh' +
        'ado'#39') AS STATUS,'
      '  MOV.HISTORICO,'
      '  MOV.VALORLANCFINAN,'
      '  MOV.NUMCHQBORDERO,'
      '  MOV.DATALANCFINAN,'
      '  MOV.ENTRADASAIDA,'
      '  MOV.DATADISPFINANC,'
      '  MOV.IDENVIODOCUMENTO,'
      '  MOV.CODLANCFINANC,'
      '  0 AS DOCUMENTO,'
      '  0 AS VALORDOCUMENTO,'
      '  0 AS PLANILHA,'
      '  0 as PLNCODIGO,'
      
        '  '#39'12345678901234567890123456789012345678901234567890'#39'  AS NOMEM' +
        'ODULO,'
      
        '  '#39'12345678901234567890123456789012345678901234567890'#39'  AS PORTA' +
        'DORCONTA'
      'FROM MOVIMFINANC MOV'
      'WHERE ( MOV.IDPESSOA = 1 )'
      ' AND MOV.DATALANCFINAN >= TO_DATE('#39'14/03/2008'#39','#39'DD/MM/YYYY'#39')'
      ' AND MOV.DATALANCFINAN <= TO_DATE('#39'18/03/2008'#39','#39'DD/MM/YYYY'#39')'
      ' and 1 = 2'
      '')
    Left = 360
    Top = 104
  end
  object ppDBDocumento: TppDBPipeline
    DataSource = DsDocumento
    UserName = 'DBDocumento'
    Left = 448
    Top = 216
    object ppDBDocumentoppField1: TppField
      FieldAlias = 'VLRBRUTO'
      FieldName = 'VLRBRUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBDocumentoppField2: TppField
      FieldAlias = 'VLRLIQUIDO'
      FieldName = 'VLRLIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBDocumentoppField3: TppField
      FieldAlias = 'NUMLOTE'
      FieldName = 'NUMLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBDocumentoppField4: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBDocumentoppField5: TppField
      FieldAlias = 'CODLANCFINANC'
      FieldName = 'CODLANCFINANC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBDocumentoppField6: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBDocumentoppField7: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBDocumentoppField8: TppField
      FieldAlias = 'IDFORCLI'
      FieldName = 'IDFORCLI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBDocumentoppField9: TppField
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDBDocumentoppField10: TppField
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDBDocumentoppField11: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDBDocumentoppField12: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDBDocumentoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNPLANIL'
      FieldName = 'PLNPLANIL'
      FieldLength = 10
      DataType = dtExtended
      DisplayWidth = 10
      Position = 12
    end
  end
  object CdsDocumento: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'SELECIONADO'
        DataType = ftFloat
      end
      item
        Name = 'VALORLIQUIDO'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'CODDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'IDFORCLI'
        DataType = ftFloat
      end
      item
        Name = 'NODOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'NUMAPGR'
        DataType = ftFloat
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RAZAOSOCIAL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PLNPLANIL'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'PrvDocumento'
    StoreDefs = True
    Left = 120
    Top = 216
    object CdsDocumentoVLRBRUTO: TFloatField
      FieldName = 'VLRBRUTO'
    end
    object CdsDocumentoVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
    end
    object CdsDocumentoNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
    end
    object CdsDocumentoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 6
    end
    object CdsDocumentoCODLANCFINANC: TFloatField
      FieldName = 'CODLANCFINANC'
    end
    object CdsDocumentoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object CdsDocumentoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsDocumentoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object CdsDocumentoNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object CdsDocumentoNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
    object CdsDocumentoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CdsDocumentoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object CdsDocumentoSELECIONADO: TFloatField
      FieldName = 'SELECIONADO'
    end
    object CdsDocumentoPLNPLANIL: TFloatField
      FieldName = 'PLNPLANIL'
    end
  end
  object QryDocumento: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT (0) as Selecionado,'
      
        '  SUM( DECODE( DOC.RECPAG, '#39'R'#39', DECODE( LDC.DEBCRE, '#39'D'#39', LDC.VAL' +
        'OR, -LDC.VALOR ),'
      
        '             DECODE( LDC.DEBCRE, '#39'C'#39', LDC.VALOR, -LDC.VALOR ) ) ' +
        ') AS VALORLIQUIDO,'
      '  MVC.CODLANCFINANC,'
      '  DOC.CODDOCUMENTO,'
      '  DOC.IDPESSOA,'
      '  DOC.IDFORCLI,'
      '  DOC.NODOCUMENTO,'
      '  DOC.NUMAPGR,'
      '  PES.NOME,'
      '  PES.RAZAOSOCIAL,'
      '  PLN.PLNPLANIL'
      'FROM'
      
        '  MOVIMFINANC MVC, DOCUMENTO DOC, LANCTODOCUM LDC, RECBTOPAGTO R' +
        'EC, PESSOA PES, PLANILHA PLN'
      'WHERE MVC.CODLANCFINANC        = 132220'
      '  AND DOC.CODDOCUMENTO         = 336740'
      '  AND MVC.CODLANCFINANC        = REC.CODLANCFINANC'
      '  AND REC.CODDOCUMENTO         = LDC.CODDOCUMENTO'
      '  AND LDC.CODDOCUMENTO         = DOC.CODDOCUMENTO'
      '  AND DOC.IDFORCLI             = PES.IDPESSOA'
      '  AND LDC.PLNCODIGO            = PLN.PLNCODIGO'
      '  AND LDC.OPERACAO IN (4,2)'
      'GROUP BY'
      '  MVC.CODLANCFINANC,'
      '  DOC.CODDOCUMENTO,'
      '  DOC.IDPESSOA,'
      '  DOC.IDFORCLI,'
      '  DOC.NODOCUMENTO,'
      '  DOC.NUMAPGR,'
      '  PES.NOME,'
      '  PES.RAZAOSOCIAL,'
      '  PLN.PLNPLANIL'
      ''
      ''
      ''
      ''
      ' ')
    Left = 360
    Top = 216
  end
  object PrvDocumento: TDataSetProvider
    DataSet = QryDocumento
    Constraints = True
    Left = 280
    Top = 216
  end
  object DsDocumento: TDataSource
    DataSet = CdsDocumento
    Left = 200
    Top = 216
  end
  object SQLDocumento: TCMSqlParams
    SQL.Strings = (
      
        'SELECT SUM(DECODE(LDC.OPERACAO, DOC.OPERACAO, LDC.VALOR, 0)) VLR' +
        'BRUTO,'
      
        '       SUM(DECODE(LDC.NUMLOTEMANUAL,NULL,0, LDC.VALOR))VLRLIQUID' +
        'O,'
      '       REC.NUMLOTE,'
      '       '#39'Manual'#39' tipo,'
      '       PLN.PLNPLANIL,'
      '       MVC.CODLANCFINANC'
      '      ,DOC.CODDOCUMENTO'
      '      ,DOC.IDPESSOA'
      '      ,DOC.IDFORCLI'
      '      ,DOC.NODOCUMENTO'
      '      ,DOC.NUMAPGR'
      '      ,PES.NOME'
      '      ,PES.RAZAOSOCIAL'
      
        'FROM MOVIMFINANC MVC, DOCUMENTO DOC, LANCTODOCUM LDC, RECBTOPAGT' +
        'O REC, PESSOA PES, PLANILHA PLN'
      'WHERE MVC.IDPESSOA = 1'
      '  AND MVC.CODLANCFINANC = REC.CODLANCFINANC'
      '  AND LDC.CODDOCUMENTO  = REC.CODDOCUMENTO'
      '  AND LDC.CODDOCUMENTO  = DOC.CODDOCUMENTO'
      '  AND DOC.IDFORCLI      = PES.IDPESSOA'
      '  AND LDC.PLNCODIGO     = LDC.PLNCODIGO'
      '--  AND MVC.DATALANCFINAN >= TO_DATE('#39'15/01/2008'#39','#39'DD/MM/YYYY'#39')'
      '--  AND MVC.DATALANCFINAN <= TO_DATE('#39'16/01/2008'#39','#39'DD/MM/YYYY'#39')'
      '--  AND MVC.IDENVIODOCUMENTO IS NULL'
      
        '  AND ((REC.NUMLOTE = LDC.NUMLOTEMANUAL) OR (DOC.OPERACAO = LDC.' +
        'OPERACAO))'
      ''
      '   AND MVC.CODLANCFINANC IN (133100)'
      ''
      'GROUP BY REC.NUMLOTE'
      '        ,MVC.CODLANCFINANC'
      '        ,LDC.PLNCODIGO'
      '        ,DOC.CODDOCUMENTO'
      '        ,DOC.IDPESSOA'
      '        ,DOC.IDFORCLI'
      '        ,DOC.NODOCUMENTO'
      '        ,DOC.NUMAPGR'
      '        ,PES.NOME'
      '        ,PES.RAZAOSOCIAL'
      'UNION ALL'
      ''
      
        'SELECT LOTX.VALOR AS VLRLIQUIDO, LDC.VALOR AS VALORBRUTO, LOT.NU' +
        'MLOTE,'
      '       '#39'Lote'#39' tipo,'
      '       PLN.PLNPLANIL'
      '      ,MVC.CODLANCFINANC'
      '      ,DOC.CODDOCUMENTO'
      '      ,DOC.IDPESSOA'
      '      ,DOC.IDFORCLI'
      '      ,DOC.NODOCUMENTO'
      '      ,DOC.NUMAPGR'
      '      ,PES.NOME'
      '      ,PES.RAZAOSOCIAL'
      
        'FROM MOVIMFINANC MVC, LOTEPAGTO LOT, LOTEXDOCUM LOTX, DOCUMENTO ' +
        'DOC, LANCTODOCUM LDC, PESSOA PES, PLANILHA PLN'
      'WHERE MVC.IDPESSOA = 1'
      '  AND MVC.CODLANCFINANC = LOT.CODLANCFINANC'
      '  AND LOT.NUMLOTE       = LOTX.NUMLOTE'
      '  AND LOTX.CODDOCUMENTO  = DOC.CODDOCUMENTO'
      '  AND DOC.CODDOCUMENTO  = LDC.CODDOCUMENTO'
      '  AND DOC.OPERACAO      = LDC.OPERACAO'
      '  AND DOC.IDFORCLI      = PES.IDPESSOA'
      '  AND MVC.PLNCODIGO     = PLN.PLNCODIGO'
      '-- AND MVC.DATALANCFINAN >= TO_DATE('#39'01/02/2008'#39','#39'DD/MM/YYYY'#39')'
      '-- AND MVC.DATALANCFINAN <= TO_DATE('#39'26/03/2008'#39','#39'DD/MM/YYYY'#39')'
      ' AND MVC.IDENVIODOCUMENTO IS NULL'
      ' AND MVC.CODLANCFINANC IN (133020)'
      ' '
      ' ')
    ClientDataSet = CdsDocumento
    Left = 32
    Top = 216
  end
end
