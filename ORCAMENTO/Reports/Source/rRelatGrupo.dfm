inherited rptRelatGrupo: TrptRelatGrupo
  Left = 294
  Top = 96
  Width = 705
  Height = 425
  Caption = 'rptRelatGrupo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Orçado x Realizado por Grupo'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Plano Orcamentario'
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
        Name = 'PlanoOrcamentario'
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
        Caption = 'Exercicio'
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
        Name = 'Exercicio'
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
        Caption = 'Periodo Inicial'
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
        Name = 'PeriodoInicial'
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
        Caption = 'Periodo Final'
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
        Name = 'PeriodoFinal'
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
        Caption = 'Periodo Orcado'
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
        Name = 'PeriodoOrcado'
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
        Caption = 'Grupo Inicial'
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
        Name = 'GrupoInicial'
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
        Caption = 'Grupo Final'
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
        Name = 'GrupoFinal'
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
        Caption = 'Posicao Inicial Grupo'
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
        Name = 'PosInicialGrupo'
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
        Caption = 'Posicao Final Grupo'
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
        Name = 'PosFimGrupo'
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
        Caption = 'Centro de Responsabilidade'
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
        Name = 'CentroResponbilidade'
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
        Caption = 'Moeda'
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
        Name = 'Moeda'
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
        Caption = 'Grau'
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
        Name = 'Grau'
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
        Caption = 'Cenario'
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
        Name = 'Cenario'
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
        Caption = 'Considerar Valores'
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
        Name = 'ConsiderarValores'
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
        Caption = 'Indicar valores negativos por'
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
        Name = 'Indicarvaloresnegativos'
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
        Caption = 'Usuario por centro de'
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
        Name = 'UsuarioCentroDe'
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
        Caption = 'Imprimir valores Zerados'
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
        Name = 'ImprimirValoresZerados'
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
        Caption = 'Centro de Custa'
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
        Name = 'CentroCusta'
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
        Caption = 'Atividade / projeto'
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
        Name = 'Atividadeprojeto'
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
        Caption = 'Plano Previdenciario'
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
        Caption = 'Programa'
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
        Name = 'Programa'
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
        Caption = 'Tipo Despesa'
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
        Name = 'TipoDespesa'
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
        Caption = 'Caminho Excel'
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
        Name = 'CaminhoExcel'
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
        Caption = 'Tipo de Valores'
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
        Name = 'TipoValores'
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
        Caption = 'Imprimir Valores Sem'
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
        Name = 'VlrSem'
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
        Caption = 'Nome do Filtro Valores Sem'
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
    FormWidth = 450
    Left = 464
  end
  inherited DevRptCM: TExtraOptions
    Left = 248
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = ppReport1
    Left = 315
  end
  object dsRelatGrupo: TwwDataSource
    DataSet = cdsRelatGrupo
    Left = 390
    Top = 119
  end
  object pplRelatGrupo: TppBDEPipeline
    DataSource = dsRelatGrupo
    UserName = 'lRelatGrupo'
    Left = 390
    Top = 63
    object pplRelatGrupoppField1: TppField
      FieldAlias = 'CODGRUPOORC'
      FieldName = 'CODGRUPOORC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField2: TppField
      FieldAlias = 'NOMEGRUPOORCAMEN'
      FieldName = 'NOMEGRUPOORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField3: TppField
      FieldAlias = 'FLGANALSINT'
      FieldName = 'FLGANALSINT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField4: TppField
      FieldAlias = 'EXE01'
      FieldName = 'EXE01'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField5: TppField
      FieldAlias = 'PER01'
      FieldName = 'PER01'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField6: TppField
      FieldAlias = 'ORC01'
      FieldName = 'ORC01'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField7: TppField
      FieldAlias = 'REA01'
      FieldName = 'REA01'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField8: TppField
      FieldAlias = 'EXE02'
      FieldName = 'EXE02'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField9: TppField
      FieldAlias = 'PER02'
      FieldName = 'PER02'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField10: TppField
      FieldAlias = 'ORC02'
      FieldName = 'ORC02'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField11: TppField
      FieldAlias = 'REA02'
      FieldName = 'REA02'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField12: TppField
      FieldAlias = 'EXE03'
      FieldName = 'EXE03'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField13: TppField
      FieldAlias = 'PER03'
      FieldName = 'PER03'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField14: TppField
      FieldAlias = 'ORC03'
      FieldName = 'ORC03'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField15: TppField
      FieldAlias = 'REA03'
      FieldName = 'REA03'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField16: TppField
      FieldAlias = 'EXE04'
      FieldName = 'EXE04'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField17: TppField
      FieldAlias = 'PER04'
      FieldName = 'PER04'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField18: TppField
      FieldAlias = 'ORC04'
      FieldName = 'ORC04'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField19: TppField
      FieldAlias = 'REA04'
      FieldName = 'REA04'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField20: TppField
      FieldAlias = 'EXE05'
      FieldName = 'EXE05'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField21: TppField
      FieldAlias = 'PER05'
      FieldName = 'PER05'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField22: TppField
      FieldAlias = 'ORC05'
      FieldName = 'ORC05'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField23: TppField
      FieldAlias = 'REA05'
      FieldName = 'REA05'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField24: TppField
      FieldAlias = 'EXE06'
      FieldName = 'EXE06'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField25: TppField
      FieldAlias = 'PER06'
      FieldName = 'PER06'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField26: TppField
      FieldAlias = 'ORC06'
      FieldName = 'ORC06'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField27: TppField
      FieldAlias = 'REA06'
      FieldName = 'REA06'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField28: TppField
      FieldAlias = 'EXE07'
      FieldName = 'EXE07'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField29: TppField
      FieldAlias = 'PER07'
      FieldName = 'PER07'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField30: TppField
      FieldAlias = 'ORC07'
      FieldName = 'ORC07'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField31: TppField
      FieldAlias = 'REA07'
      FieldName = 'REA07'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField32: TppField
      FieldAlias = 'EXE08'
      FieldName = 'EXE08'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField33: TppField
      FieldAlias = 'PER08'
      FieldName = 'PER08'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField34: TppField
      FieldAlias = 'ORC08'
      FieldName = 'ORC08'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField35: TppField
      FieldAlias = 'REA08'
      FieldName = 'REA08'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField36: TppField
      FieldAlias = 'EXE09'
      FieldName = 'EXE09'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField37: TppField
      FieldAlias = 'PER09'
      FieldName = 'PER09'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField38: TppField
      FieldAlias = 'ORC09'
      FieldName = 'ORC09'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField39: TppField
      FieldAlias = 'REA09'
      FieldName = 'REA09'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField40: TppField
      FieldAlias = 'EXE10'
      FieldName = 'EXE10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField41: TppField
      FieldAlias = 'PER10'
      FieldName = 'PER10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField42: TppField
      FieldAlias = 'ORC10'
      FieldName = 'ORC10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField43: TppField
      FieldAlias = 'REA10'
      FieldName = 'REA10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField44: TppField
      FieldAlias = 'EXE11'
      FieldName = 'EXE11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField45: TppField
      FieldAlias = 'PER11'
      FieldName = 'PER11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField46: TppField
      FieldAlias = 'ORC11'
      FieldName = 'ORC11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField47: TppField
      FieldAlias = 'REA11'
      FieldName = 'REA11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField48: TppField
      FieldAlias = 'EXE12'
      FieldName = 'EXE12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField49: TppField
      FieldAlias = 'PER12'
      FieldName = 'PER12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField50: TppField
      FieldAlias = 'ORC12'
      FieldName = 'ORC12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object pplRelatGrupoppField51: TppField
      FieldAlias = 'REA12'
      FieldName = 'REA12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
  end
  object sqlCompSaldoC: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  U.PERIODO, U.EXERCICIO, U.FLGSINALGRUPO,'
      '  SUM(U.VLRORCADOS) AS VLRORCADOS,'
      '  SUM(U.VLRREALIZADOS) AS VLRREALIZADOS,'
      '  SUM(U.VLRORCADO) AS VLRORCADO,'
      '  SUM(U.VLRREALIZADO) AS VLRREALIZADO'
      'FROM'
      '  (SELECT'
      '     S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO,'
      '     :SINAL1'
      '   FROM'
      '     CONTASORCAMEN C,'
      '     GRUPOORCAMEN G,'
      '     SALDOORCADO S'
      '   WHERE'
      '     (G.IDGRUPOORCAMEN IN (:GRUPO)) AND'
      '     ((C.FLGATIVA = '#39'A'#39') OR (C.FLGATIVA IS NULL)) AND'
      '     (S.EXERCICIO = :EXERCICIO) AND'
      '     (S.PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND'
      '     (S.IDPESSOA = :IDPESSOA) AND'
      '     (S.IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '     :USUARIO'
      '     :CRESP'
      '     :CCUSTO'
      '     :ATIVPROJ'
      '     :PPREV'
      '     :PATRO'
      '     :PARAMETRO1'
      '     :PARAMETRO2'
      '     :PARAMETRO3'
      '     :PARAMETRO4'
      '     (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND'
      '     (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND'
      '     (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND'
      '     (G.IDPLANOORCAMEN = S.IDPLANOORCAMEN)'
      '     GROUP BY'
      '     S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO'
      '   UNION ALL'
      '   SELECT'
      '     S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO,'
      '     :SINAL2'
      '   FROM'
      '     GRUPOORCAMEN G,'
      '     CONTASORCAMEN C,'
      '     VALORESCENARIO S'
      '   WHERE'
      '     (G.IDGRUPOORCAMEN IN (:GRUPO)) AND'
      '     ((C.FLGATIVA = '#39'A'#39') OR (C.FLGATIVA IS NULL)) AND'
      '     (S.EXERCICIO = :EXERCICIO) AND'
      '     (S.PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND'
      '     (S.IDPESSOA = :IDPESSOA) AND'
      '     (S.IDCENARIOORCAMEN = :IDCENARIO) AND'
      '     (G.IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '     :USUARIO'
      '     :CRESP'
      '     :CCUSTO'
      '     :ATIVPROJ'
      '     :PPREV'
      '     :PATRO'
      '     :PARAMETRO1'
      '     :PARAMETRO2'
      '     :PARAMETRO3'
      '     :PARAMETRO4'
      '     (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND'
      '     (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND'
      '     (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND'
      '     (G.IDPLANOORCAMEN = S.IDPLANOORCAMEN)'
      '   GROUP BY'
      '     S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO  ) U'
      'GROUP BY'
      '  U.PERIODO, U.EXERCICIO, U.FLGSINALGRUPO'
      'ORDER  BY'
      '  U.EXERCICIO, U.PERIODO'
      '')
    ClientDataSet = cdsCompSaldoC
    Left = 48
    Top = 136
  end
  object cdsCompSaldoC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 128
    Top = 112
  end
  object sqlPeriodos: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PERIODO, NOMEPERIODO, DATAINIPERIODO, DATAFIMPERIODO'
      'FROM '
      '  PERIODOORCAMEN'
      'WHERE'
      '  (IDPESSOA = :IDPESSOA) AND'
      '  (EXERCICIO = :EXERCICIO) AND'
      '  (PERIODO >= :PERIODOINI) AND'
      '  (PERIODO <= :PERIODOFIM)'
      'ORDER BY'
      '  PERIODO'
      ' ')
    ClientDataSet = cdsPeriodos
    Left = 200
    Top = 88
  end
  object cdsPeriodos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 240
    Top = 88
  end
  object sqlRelatGrupo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  G.CODGRUPOORC, G.NOMEGRUPOORCAMEN,'
      '  0 AS ORC01, 0 AS REA01,'
      '  0 AS ORC02, 0 AS REA02,'
      '  0 AS ORC03, 0 AS REA03,'
      '  0 AS ORC04, 0 AS REA04,'
      '  0 AS ORC05, 0 AS REA05,'
      '  0 AS ORC06, 0 AS REA06,'
      '  0 AS TOTORC, 0 AS TOTREA,'
      '  0 AS PERORC, 0 AS PERREA'
      'FROM'
      '  GRUPOORCAMEN G,'
      '   CONTASORCAMEN C'
      'WHERE'
      '  (LENGTH(RTRIM(G.CODGRUPOORC)) <= :NUMDIGGRAU) AND'
      '  (G.CODGRUPOORC >= :CODGRUPOINI) AND'
      '  (G.CODGRUPOORC <= :CODGRUPOFIM) AND'
      '  :CCUSTO'
      '  (G.IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '  (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)'
      'ORDER BY'
      '  G.CODGRUPOORC'
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsRelatGrupo_Antigo
    Left = 376
    Top = 336
  end
  object cdsRelatGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 392
    Top = 168
  end
  object sqlGrupoOrc: TCMSqlParams
    SQL.Strings = (
      'SELECT IDGRUPOORCAMEN'
      'FROM GRUPOORCAMEN'
      'WHERE (CODGRUPOORC LIKE :CODGRUPOORC) '
      'AND IDPLANOORCAMEN = :IDPLANOORCAMEN')
    ClientDataSet = cdsGrupoOrc
    Left = 200
    Top = 120
  end
  object cdsGrupoOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 240
    Top = 120
  end
  object sqlCResp: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODCENTRORESPON, NOME'
      'FROM'
      '  CENTRESPON'
      'WHERE'
      
        '  (IDPESSOA = :IDPESSOA) AND (CODCENTRORESPON = :CODCENTRORESPON' +
        ')')
    ClientDataSet = cdsCResp
    Left = 48
    Top = 176
  end
  object cdsCResp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 152
    Top = 152
  end
  object sqlMoeda: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  MOECODIGO, MOEDESC'
      'FROM'
      '  MOEDA'
      'WHERE'
      '  (MOEINATIVO = '#39'A'#39') AND (MOECODIGO = :MOECODIGO)')
    ClientDataSet = cdsMoeda
    Left = 48
    Top = 224
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 152
    Top = 192
  end
  object sqlCCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODCENTROCUSTO, NOME'
      'FROM'
      '  CENTCUST'
      'WHERE'
      '  (IDEMPRESA = :IDPESSOA) AND (CODCENTROCUSTO = :CODCENTROCUSTO)')
    ClientDataSet = cdsCCusto
    Left = 200
    Top = 160
  end
  object cdsCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 240
    Top = 160
  end
  object sqlAtivProj: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  UNIDNEGOC, NOME'
      'FROM'
      '  UNIDNEGOCIO'
      'WHERE'
      '  (IDPESSOA = :IDPESSOA) AND (UNIDNEGOC = :UNIDNEGOC)')
    ClientDataSet = cdsAtivProj
    Left = 200
    Top = 192
  end
  object cdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 96
    Top = 184
  end
  object sqlCenario: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  IDCENARIOORCAMEN, NOMECENARIO'
      'FROM'
      '  CENARIOORCAMEN'
      'WHERE'
      '  (IDCENARIOORCAMEN = :IDCENARIOORCAMEN)')
    ClientDataSet = cdsCenario
    Left = 48
    Top = 312
  end
  object cdsCenario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 152
    Top = 272
  end
  object sqlPPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDPLANOPREV, NOME'
      'FROM'
      '  PLANPREVCONTABIL'
      'WHERE'
      '  IDPLANOPREV = :IDPLANOPREV')
    ClientDataSet = cdsPPrev
    Left = 200
    Top = 232
  end
  object cdsPPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 240
    Top = 232
  end
  object sqlPatro: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PA.IDPESSOA, PE.NOME'
      'FROM'
      '  PESSOA PE, PATRO PA'
      'WHERE'
      '  (PA.IDPESSOA = PE.IDPESSOA) AND (PA.IDPESSOA = :IDPESSOA)')
    ClientDataSet = cdsPatro
    Left = 200
    Top = 288
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 240
    Top = 272
  end
  object sqlGrupoIni: TCMSqlParams
    SQL.Strings = (
      'SELECT CODGRUPOORC, NOMEGRUPOORCAMEN'
      'FROM GRUPOORCAMEN'
      'WHERE IDPLANOORCAMEN = :IDPLANOORCAMEN'
      'ORDER BY CODGRUPOORC')
    ClientDataSet = cdsGrupoIni
    Left = 48
    Top = 272
  end
  object cdsGrupoIni: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 152
    Top = 232
  end
  object cdsRelatGrupo_Antigo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 488
    Top = 288
  end
  object ppReport1: TppReport
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
    Left = 176
    Top = 8
    Version = '7.04'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object cdsRelatGrupo_BKP: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 520
    Top = 208
    object StringField1: TStringField
      FieldName = 'CODGRUPOORC'
    end
    object StringField2: TStringField
      FieldName = 'NOMEGRUPOORCAMEN'
      Size = 100
    end
    object StringField3: TStringField
      FieldName = 'FLGANALSINT'
      Size = 1
    end
    object IntegerField1: TIntegerField
      FieldName = 'EXE01'
    end
    object IntegerField2: TIntegerField
      FieldName = 'PER01'
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'ORC01'
    end
    object CurrencyField2: TCurrencyField
      FieldName = 'REA01'
    end
    object IntegerField3: TIntegerField
      FieldName = 'EXE02'
    end
    object IntegerField4: TIntegerField
      FieldName = 'PER02'
    end
    object CurrencyField3: TCurrencyField
      FieldName = 'ORC02'
    end
    object CurrencyField4: TCurrencyField
      FieldName = 'REA02'
    end
    object IntegerField5: TIntegerField
      FieldName = 'EXE03'
    end
    object IntegerField6: TIntegerField
      FieldName = 'PER03'
    end
    object CurrencyField5: TCurrencyField
      FieldName = 'ORC03'
    end
    object CurrencyField6: TCurrencyField
      FieldName = 'REA03'
    end
    object IntegerField7: TIntegerField
      FieldName = 'EXE04'
    end
    object IntegerField8: TIntegerField
      FieldName = 'PER04'
    end
    object CurrencyField7: TCurrencyField
      FieldName = 'ORC04'
    end
    object CurrencyField8: TCurrencyField
      FieldName = 'REA04'
    end
    object IntegerField9: TIntegerField
      FieldName = 'EXE05'
    end
    object IntegerField10: TIntegerField
      FieldName = 'PER05'
    end
    object CurrencyField9: TCurrencyField
      FieldName = 'ORC05'
    end
    object CurrencyField10: TCurrencyField
      FieldName = 'REA05'
    end
    object IntegerField11: TIntegerField
      FieldName = 'EXE06'
    end
    object IntegerField12: TIntegerField
      FieldName = 'PER06'
    end
    object CurrencyField11: TCurrencyField
      FieldName = 'ORC06'
    end
    object CurrencyField12: TCurrencyField
      FieldName = 'REA06'
    end
    object IntegerField13: TIntegerField
      FieldName = 'EXE07'
    end
    object IntegerField14: TIntegerField
      FieldName = 'PER07'
    end
    object CurrencyField13: TCurrencyField
      FieldName = 'ORC07'
    end
    object CurrencyField14: TCurrencyField
      FieldName = 'REA07'
    end
    object IntegerField15: TIntegerField
      FieldName = 'EXE08'
    end
    object IntegerField16: TIntegerField
      FieldName = 'PER08'
    end
    object CurrencyField15: TCurrencyField
      FieldName = 'ORC08'
    end
    object CurrencyField16: TCurrencyField
      FieldName = 'REA08'
    end
    object IntegerField17: TIntegerField
      FieldName = 'EXE09'
    end
    object IntegerField18: TIntegerField
      FieldName = 'PER09'
    end
    object CurrencyField17: TCurrencyField
      FieldName = 'ORC09'
    end
    object CurrencyField18: TCurrencyField
      FieldName = 'REA09'
    end
    object IntegerField19: TIntegerField
      FieldName = 'EXE10'
    end
    object IntegerField20: TIntegerField
      FieldName = 'PER10'
    end
    object CurrencyField19: TCurrencyField
      FieldName = 'ORC10'
    end
    object CurrencyField20: TCurrencyField
      FieldName = 'REA10'
    end
    object IntegerField21: TIntegerField
      FieldName = 'EXE11'
    end
    object IntegerField22: TIntegerField
      FieldName = 'PER11'
    end
    object CurrencyField21: TCurrencyField
      FieldName = 'ORC11'
    end
    object CurrencyField22: TCurrencyField
      FieldName = 'REA11'
    end
    object IntegerField23: TIntegerField
      FieldName = 'EXE12'
    end
    object IntegerField24: TIntegerField
      FieldName = 'PER12'
    end
    object CurrencyField23: TCurrencyField
      FieldName = 'ORC12'
    end
    object CurrencyField24: TCurrencyField
      FieldName = 'REA12'
    end
    object StringField4: TStringField
      FieldName = 'PERIODO_DESCR01'
    end
    object StringField5: TStringField
      FieldName = 'PERIODO_DESCR02'
    end
    object StringField6: TStringField
      FieldName = 'PERIODO_DESCR03'
    end
    object StringField7: TStringField
      FieldName = 'PERIODO_DESCR04'
    end
    object StringField8: TStringField
      FieldName = 'PERIODO_DESCR05'
    end
    object StringField9: TStringField
      FieldName = 'PERIODO_DESCR06'
    end
    object StringField10: TStringField
      FieldName = 'PERIODO_DESCR07'
    end
    object StringField11: TStringField
      FieldName = 'PERIODO_DESCR08'
    end
    object StringField12: TStringField
      FieldName = 'PERIODO_DESCR09'
    end
    object StringField13: TStringField
      FieldName = 'PERIODO_DESCR10'
    end
    object StringField14: TStringField
      FieldName = 'PERIODO_DESCR11'
    end
    object StringField15: TStringField
      FieldName = 'PERIODO_DESCR12'
    end
    object CurrencyField25: TCurrencyField
      FieldName = 'VAR01'
    end
    object CurrencyField26: TCurrencyField
      FieldName = 'VAR02'
    end
    object CurrencyField27: TCurrencyField
      FieldName = 'VAR03'
    end
    object CurrencyField28: TCurrencyField
      FieldName = 'VAR04'
    end
    object CurrencyField29: TCurrencyField
      FieldName = 'VAR05'
    end
    object CurrencyField30: TCurrencyField
      FieldName = 'VAR06'
    end
    object CurrencyField31: TCurrencyField
      FieldName = 'VAR07'
    end
    object CurrencyField32: TCurrencyField
      FieldName = 'VAR08'
    end
    object CurrencyField33: TCurrencyField
      FieldName = 'VAR09'
    end
    object CurrencyField34: TCurrencyField
      FieldName = 'VAR10'
    end
    object CurrencyField35: TCurrencyField
      FieldName = 'VAR11'
    end
    object CurrencyField36: TCurrencyField
      FieldName = 'VAR12'
    end
  end
  object rpRelatGrupo: TppReport
    AutoStop = False
    DataPipeline = pplRelatGrupo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 368301
    PrinterSetup.PaperSize = 256
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
    Left = 386
    Top = 16
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplRelatGrupo'
    object ppHeaderBand25: TppHeaderBand
      BeforePrint = ppHeaderBand25BeforePrint
      mmBottomOffset = 0
      mmHeight = 39952
      mmPrintPosition = 0
      object plblTitulo: TppLabel
        UserName = 'plblTitulo'
        Caption = 'Orçado x Realizado por Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 147109
        mmTop = 8467
        mmWidth = 61383
        BandType = 0
      end
      object plblEmpresa: TppLabel
        UserName = 'plblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1588
        mmWidth = 355601
        BandType = 0
      end
      object plbl25: TppLabel
        UserName = 'plbl25'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 794
        mmTop = 31750
        mmWidth = 8731
        BandType = 0
      end
      object plbl26: TppLabel
        UserName = 'plbl26'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 14816
        mmTop = 31750
        mmWidth = 11906
        BandType = 0
      end
      object ppLine64: TppLine
        UserName = 'ppLine64'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 34925
        mmWidth = 355601
        BandType = 0
      end
      object plblmes01: TppLabel
        UserName = 'plblmes01'
        AutoSize = False
        Caption = 'Mes01'
        Color = clScrollBar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 65617
        mmTop = 32015
        mmWidth = 52652
        BandType = 0
      end
      object plbl33: TppLabel
        UserName = 'plbl33'
        Caption = 'Exercício:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 795
        mmTop = 2910
        mmWidth = 13229
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 30956
        mmWidth = 355601
        BandType = 0
      end
      object plbl1: TppLabel
        UserName = 'ppLabel2301'
        Caption = 'Período Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 795
        mmTop = 6879
        mmWidth = 20447
        BandType = 0
      end
      object plbl2: TppLabel
        UserName = 'plbl2'
        Caption = 'Período Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 795
        mmTop = 10848
        mmWidth = 19008
        BandType = 0
      end
      object plbl3: TppLabel
        UserName = 'plbl3'
        Caption = 'Grupo Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 795
        mmTop = 14817
        mmWidth = 18373
        BandType = 0
      end
      object plbl4: TppLabel
        UserName = 'plbl4'
        Caption = 'Grupo Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 795
        mmTop = 19315
        mmWidth = 16933
        BandType = 0
      end
      object plblExercicio: TppLabel
        UserName = 'ppLabel2302'
        Caption = 'XXXXXXXXXXXX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 22860
        mmTop = 2910
        mmWidth = 30427
        BandType = 0
      end
      object plblPeriodoIni: TppLabel
        UserName = 'plblPeriodoIni'
        Caption = 'XXXXXXXXXXXX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 22860
        mmTop = 6879
        mmWidth = 30427
        BandType = 0
      end
      object plblPeriodoFim: TppLabel
        UserName = 'plblPeriodoFim'
        Caption = 'XXXXXXXXXXXX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 22860
        mmTop = 11113
        mmWidth = 30427
        BandType = 0
      end
      object plblGrupoIni: TppLabel
        UserName = 'plblGrupoIni'
        Caption = 'XXXXXXXXXXXX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 22860
        mmTop = 15081
        mmWidth = 30427
        BandType = 0
      end
      object plblGrupoFim: TppLabel
        UserName = 'plblGrupoFim'
        Caption = 'XXXXXXXXXXXX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 22860
        mmTop = 19315
        mmWidth = 30427
        BandType = 0
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 14288
        mmTop = 31221
        mmWidth = 7408
        BandType = 0
      end
      object linha_mes: TppLine
        UserName = 'linha_mes'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 65088
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'linha_mes1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 119063
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 173832
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 228600
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object plbl28: TppLabel
        UserName = 'plbl28'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 288132
        mmTop = 31750
        mmWidth = 52652
        BandType = 0
      end
      object ppLine31: TppLine
        UserName = 'Line31'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 285486
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object plbl34: TppLabel
        UserName = 'Label1'
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 65881
        mmTop = 35719
        mmWidth = 16933
        BandType = 0
      end
      object plbl47: TppLabel
        UserName = 'Label2'
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 83344
        mmTop = 35719
        mmWidth = 16933
        BandType = 0
      end
      object plbl48: TppLabel
        UserName = 'Label3'
        Caption = 'Variação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 101071
        mmTop = 35719
        mmWidth = 16933
        BandType = 0
      end
      object plblmes02: TppLabel
        UserName = 'plblmes02'
        AutoSize = False
        Caption = 'Mes02'
        Color = clScrollBar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 120386
        mmTop = 32015
        mmWidth = 52652
        BandType = 0
      end
      object plblmes03: TppLabel
        UserName = 'plblmes03'
        AutoSize = False
        Caption = 'Mes03'
        Color = clScrollBar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 175419
        mmTop = 32015
        mmWidth = 52652
        BandType = 0
      end
      object plblmes04: TppLabel
        UserName = 'plblmes04'
        AutoSize = False
        Caption = 'Mes04'
        Color = clScrollBar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 229130
        mmTop = 32015
        mmWidth = 52652
        BandType = 0
      end
      object plbl49: TppLabel
        UserName = 'Label7'
        Caption = 'Variação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 156104
        mmTop = 35983
        mmWidth = 16933
        BandType = 0
      end
      object plbl50: TppLabel
        UserName = 'Label8'
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 137584
        mmTop = 35983
        mmWidth = 16933
        BandType = 0
      end
      object plbl51: TppLabel
        UserName = 'Label9'
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 120121
        mmTop = 35983
        mmWidth = 16933
        BandType = 0
      end
      object plbl52: TppLabel
        UserName = 'Label10'
        Caption = 'Variação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 210609
        mmTop = 36248
        mmWidth = 16933
        BandType = 0
      end
      object plbl53: TppLabel
        UserName = 'Label11'
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 192882
        mmTop = 36248
        mmWidth = 16933
        BandType = 0
      end
      object plbl54: TppLabel
        UserName = 'Label12'
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 175419
        mmTop = 36248
        mmWidth = 16933
        BandType = 0
      end
      object plbl55: TppLabel
        UserName = 'Label13'
        Caption = 'Variação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 265642
        mmTop = 36248
        mmWidth = 16933
        BandType = 0
      end
      object plbl56: TppLabel
        UserName = 'Label14'
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 246857
        mmTop = 36248
        mmWidth = 16933
        BandType = 0
      end
      object plbl57: TppLabel
        UserName = 'Label15'
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 229394
        mmTop = 36248
        mmWidth = 16933
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7620
        mmLeft = 65088
        mmTop = 34396
        mmWidth = 13229
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 83079
        mmTop = 35189
        mmWidth = 13229
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 100542
        mmTop = 34925
        mmWidth = 13229
        BandType = 0
      end
      object ppLine22: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 119063
        mmTop = 35189
        mmWidth = 13229
        BandType = 0
      end
      object ppLine23: TppLine
        UserName = 'Line20'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 137319
        mmTop = 35189
        mmWidth = 13229
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'Line202'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 155840
        mmTop = 35189
        mmWidth = 13229
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'Line22'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 173832
        mmTop = 35189
        mmWidth = 13229
        BandType = 0
      end
      object ppLine26: TppLine
        UserName = 'Line23'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 192352
        mmTop = 35189
        mmWidth = 13229
        BandType = 0
      end
      object ppLine27: TppLine
        UserName = 'Line24'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 210344
        mmTop = 35189
        mmWidth = 13229
        BandType = 0
      end
      object ppLine28: TppLine
        UserName = 'Line25'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 228600
        mmTop = 35189
        mmWidth = 13229
        BandType = 0
      end
      object ppLine32: TppLine
        UserName = 'Line26'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 246328
        mmTop = 34925
        mmWidth = 13229
        BandType = 0
      end
      object ppLine67: TppLine
        UserName = 'Line67'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 264584
        mmTop = 34925
        mmWidth = 13229
        BandType = 0
      end
      object ppLine68: TppLine
        UserName = 'Line68'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7620
        mmLeft = 285486
        mmTop = 34660
        mmWidth = 13229
        BandType = 0
      end
      object ppLine69: TppLine
        UserName = 'Line69'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 39158
        mmWidth = 355601
        BandType = 0
      end
      object ppLine71: TppLine
        UserName = 'Line71'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 14288
        mmTop = 35189
        mmWidth = 13229
        BandType = 0
      end
      object plbl24: TppLabel
        UserName = 'Label4'
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 287603
        mmTop = 36248
        mmWidth = 16933
        BandType = 0
      end
      object ppLine74: TppLine
        UserName = 'Line74'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 306653
        mmTop = 35190
        mmWidth = 13229
        BandType = 0
      end
      object plbl35: TppLabel
        UserName = 'Label5'
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 309828
        mmTop = 36248
        mmWidth = 16933
        BandType = 0
      end
      object ppLine75: TppLine
        UserName = 'Line75'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 329142
        mmTop = 34925
        mmWidth = 13229
        BandType = 0
      end
      object plbl36: TppLabel
        UserName = 'Label6'
        Caption = 'Variação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 330730
        mmTop = 36248
        mmWidth = 16933
        BandType = 0
      end
      object ppLblVlrSem: TppLabel
        UserName = 'Label16'
        Caption = 'Valores Sem:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 794
        mmTop = 23548
        mmWidth = 20108
        BandType = 0
      end
      object ppVlrSem: TppLabel
        UserName = 'Label17'
        Caption = 'XXXXXXXXXXXX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 22754
        mmTop = 23548
        mmWidth = 30692
        BandType = 0
      end
    end
    object ppDetailBand25: TppDetailBand
      BeforePrint = ppDetailBand25BeforePrint
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object shpCorZebra: TppShape
        UserName = 'shpCorZebra'
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 284163
        BandType = 4
      end
      object plblDBcodgrupo: TppDBText
        UserName = 'ppDBText92'
        DataField = 'CODGRUPOORC'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 794
        mmTop = 265
        mmWidth = 13229
        BandType = 4
      end
      object plblDBnomegrupo: TppDBText
        UserName = 'ppDBText95'
        DataField = 'NOMEGRUPOORCAMEN'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 14817
        mmTop = 265
        mmWidth = 42333
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'ppDBText96'
        DataField = 'ORC01'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 65352
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText97: TppDBText
        UserName = 'ppDBText97'
        DataField = 'REA01'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 82815
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText98: TppDBText
        UserName = 'ppDBText98'
        DataField = 'VAR01'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 101072
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5080
        mmLeft = 14288
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 65088
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 3704
        mmWidth = 355601
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5080
        mmLeft = 100541
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText23'
        DataField = 'REA_TOTAL'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 310886
        mmTop = 264
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText24'
        DataField = 'VAR_TOTAL'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 331524
        mmTop = 264
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText25'
        DataField = 'ORC_TOTAL'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 288396
        mmTop = 264
        mmWidth = 16933
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5080
        mmLeft = 83078
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5080
        mmLeft = 119063
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText1'
        DataField = 'ORC02'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 119856
        mmTop = 264
        mmWidth = 16933
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5080
        mmLeft = 137318
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText2'
        DataField = 'REA02'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 137584
        mmTop = 264
        mmWidth = 16933
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5080
        mmLeft = 155840
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText3'
        DataField = 'VAR02'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 156104
        mmTop = 264
        mmWidth = 16933
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5080
        mmLeft = 173833
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText4'
        DataField = 'ORC03'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 174890
        mmTop = 264
        mmWidth = 16933
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5080
        mmLeft = 192352
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText5'
        DataField = 'REA03'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 192883
        mmTop = 264
        mmWidth = 16933
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5080
        mmLeft = 210343
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText6'
        DataField = 'VAR03'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 210873
        mmTop = 264
        mmWidth = 16933
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5080
        mmLeft = 228600
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText7'
        DataField = 'ORC04'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 228865
        mmTop = 264
        mmWidth = 16933
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5080
        mmLeft = 246327
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText8'
        DataField = 'REA04'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 246858
        mmTop = 264
        mmWidth = 16933
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5080
        mmLeft = 264584
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText9'
        DataField = 'VAR04'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 265642
        mmTop = 264
        mmWidth = 16933
        BandType = 4
      end
      object ppLine70: TppLine
        UserName = 'Line70'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 285486
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine72: TppLine
        UserName = 'Line701'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 306652
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine73: TppLine
        UserName = 'Line73'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 329141
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
    end
    object ppFooterBand25: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppCalc48: TppSystemVariable
        UserName = 'Calc48'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 2646
        mmWidth = 280194
        BandType = 8
      end
      object plblSistema: TppLabel
        UserName = 'plblSistema'
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
        mmTop = 2646
        mmWidth = 280194
        BandType = 8
      end
      object ppLine77: TppLine
        UserName = 'ppLine77'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1323
        mmWidth = 355601
        BandType = 8
      end
      object ppCalc49: TppSystemVariable
        UserName = 'Calc49'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 283105
        mmTop = 2381
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 58738
      mmPrintPosition = 0
      object plbl27: TppLabel
        UserName = 'plbl27'
        Caption = 'Parâmetros Utilizados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 1852
        mmTop = 1588
        mmWidth = 36915
        BandType = 7
      end
      object ppMemoFiltrosutilizados: TppMemo
        UserName = 'MemoFiltrosutilizados'
        Caption = 'MemoFiltrosutilizados'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 49742
        mmLeft = 1058
        mmTop = 6879
        mmWidth = 305859
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
  end
  object rpReltaGrupo_BKP: TppReport
    AutoStop = False
    DataPipeline = pplRelatGrupo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 322527
    PrinterSetup.PaperSize = 256
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
    Left = 578
    Top = 104
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplRelatGrupo'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35454
      mmPrintPosition = 0
      object plbl5: TppLabel
        UserName = 'plblTitulo'
        Caption = 'Orçado x Realizado por Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 111565
        mmTop = 8731
        mmWidth = 61299
        BandType = 0
      end
      object plbl6: TppLabel
        UserName = 'plblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object plbl7: TppLabel
        UserName = 'plbl25'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 794
        mmTop = 31750
        mmWidth = 8731
        BandType = 0
      end
      object plbl8: TppLabel
        UserName = 'plbl26'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 14816
        mmTop = 31750
        mmWidth = 11906
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine64'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 35189
        mmWidth = 309827
        BandType = 0
      end
      object plbl9: TppLabel
        UserName = 'plblmes01'
        AutoSize = False
        Caption = 'Mes01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 65617
        mmTop = 32015
        mmWidth = 16933
        BandType = 0
      end
      object plbl10: TppLabel
        UserName = 'plblmes02'
        AutoSize = False
        Caption = 'Mes02'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 84138
        mmTop = 32015
        mmWidth = 16933
        BandType = 0
      end
      object plbl11: TppLabel
        UserName = 'plblmes03'
        AutoSize = False
        Caption = 'Mes03'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 102923
        mmTop = 32015
        mmWidth = 16933
        BandType = 0
      end
      object plbl12: TppLabel
        UserName = 'plblmes04'
        AutoSize = False
        Caption = 'Mes04'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 121179
        mmTop = 32015
        mmWidth = 16933
        BandType = 0
      end
      object plbl13: TppLabel
        UserName = 'plblmes05'
        AutoSize = False
        Caption = 'Mes05'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 139171
        mmTop = 32015
        mmWidth = 16933
        BandType = 0
      end
      object plbl14: TppLabel
        UserName = 'plblmes06'
        AutoSize = False
        Caption = 'Mes06'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 157427
        mmTop = 32015
        mmWidth = 16933
        BandType = 0
      end
      object plbl15: TppLabel
        UserName = 'plbl33'
        Caption = 'Exercício:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 795
        mmTop = 2910
        mmWidth = 13229
        BandType = 0
      end
      object plbl16: TppLabel
        UserName = 'plblmes07'
        AutoSize = False
        Caption = 'Mes07'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 175684
        mmTop = 32015
        mmWidth = 16933
        BandType = 0
      end
      object plbl17: TppLabel
        UserName = 'plblmes08'
        AutoSize = False
        Caption = 'Mes08'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 193675
        mmTop = 32015
        mmWidth = 16933
        BandType = 0
      end
      object plbl18: TppLabel
        UserName = 'plblmes09'
        AutoSize = False
        Caption = 'Mes09'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 211932
        mmTop = 32015
        mmWidth = 16933
        BandType = 0
      end
      object plbl19: TppLabel
        UserName = 'plblmes10'
        AutoSize = False
        Caption = 'Mes10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 230453
        mmTop = 32015
        mmWidth = 16933
        BandType = 0
      end
      object plbl20: TppLabel
        UserName = 'plblmes11'
        AutoSize = False
        Caption = 'Mes11'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 248973
        mmTop = 32015
        mmWidth = 16933
        BandType = 0
      end
      object plbl21: TppLabel
        UserName = 'plblmes12'
        AutoSize = False
        Caption = 'Mes12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 267229
        mmTop = 32015
        mmWidth = 16933
        BandType = 0
      end
      object ppLine33: TppLine
        UserName = 'Line13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 30956
        mmWidth = 309827
        BandType = 0
      end
      object plbl22: TppLabel
        UserName = 'ppLabel2301'
        Caption = 'Período Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 795
        mmTop = 6879
        mmWidth = 20447
        BandType = 0
      end
      object plbl23: TppLabel
        UserName = 'plbl2'
        Caption = 'Período Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 795
        mmTop = 10848
        mmWidth = 19008
        BandType = 0
      end
      object plbl29: TppLabel
        UserName = 'plbl3'
        Caption = 'Grupo Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 795
        mmTop = 14817
        mmWidth = 18373
        BandType = 0
      end
      object plbl30: TppLabel
        UserName = 'plbl4'
        Caption = 'Grupo Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 795
        mmTop = 19315
        mmWidth = 16933
        BandType = 0
      end
      object plbl31: TppLabel
        UserName = 'ppLabel2302'
        Caption = 'XXXXXXXXXXXX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 22860
        mmTop = 2910
        mmWidth = 30427
        BandType = 0
      end
      object plbl32: TppLabel
        UserName = 'plblPeriodoIni'
        Caption = 'XXXXXXXXXXXX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 22860
        mmTop = 6879
        mmWidth = 30427
        BandType = 0
      end
      object plbl37: TppLabel
        UserName = 'plblPeriodoFim'
        Caption = 'XXXXXXXXXXXX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 22860
        mmTop = 11113
        mmWidth = 30427
        BandType = 0
      end
      object plbl38: TppLabel
        UserName = 'plblGrupoIni'
        Caption = 'XXXXXXXXXXXX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 22860
        mmTop = 15081
        mmWidth = 30427
        BandType = 0
      end
      object plbl39: TppLabel
        UserName = 'plblGrupoFim'
        Caption = 'XXXXXXXXXXXX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 22860
        mmTop = 19315
        mmWidth = 30427
        BandType = 0
      end
      object ppLine34: TppLine
        UserName = 'Line29'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 14288
        mmTop = 31221
        mmWidth = 7408
        BandType = 0
      end
      object ppLine35: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 57415
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object ppLine36: TppLine
        UserName = 'linha_mes'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 65088
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object plbl40: TppLabel
        UserName = 'plbl24'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 58473
        mmTop = 31750
        mmWidth = 5292
        BandType = 0
      end
      object ppLine37: TppLine
        UserName = 'linha_mes1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 83312
        mmTop = 31222
        mmWidth = 13229
        BandType = 0
      end
      object ppLine38: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 101865
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object ppLine39: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 120386
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object ppLine40: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 138642
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object ppLine41: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 156634
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object ppLine42: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 174890
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object ppLine43: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 193146
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object ppLine44: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 211138
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object ppLine45: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 229659
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object ppLine46: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 248180
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object ppLine47: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 266436
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object plbl41: TppLabel
        UserName = 'plbl28'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 288132
        mmTop = 31750
        mmWidth = 16933
        BandType = 0
      end
      object ppLine48: TppLine
        UserName = 'Line31'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 285486
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      BeforePrint = ppDetailBand25BeforePrint
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'shpCorZebra'
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 284163
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'ppDBText92'
        DataField = 'CODGRUPOORC'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 794
        mmTop = 265
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'ppDBText95'
        DataField = 'NOMEGRUPOORCAMEN'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 14817
        mmTop = 265
        mmWidth = 42333
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'ppDBText96'
        DataField = 'ORC01'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 65881
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'ppDBText97'
        DataField = 'ORC02'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 84402
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'ppDBText98'
        DataField = 'ORC03'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 103188
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'ppDBText99'
        DataField = 'ORC04'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 121444
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'ppDBText100'
        DataField = 'ORC05'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 139436
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'ppDBText101'
        DataField = 'ORC06'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 157692
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'ppDBText102'
        DataField = 'ORC07'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 175948
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'ppDBText103'
        DataField = 'ORC08'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 193940
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'ppDBText104'
        DataField = 'ORC09'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 212196
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'ppDBText105'
        DataField = 'ORC11'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 248974
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'ppDBText106'
        DataField = 'ORC10'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 230453
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'ppDBText107'
        DataField = 'ORC12'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 267229
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppLine49: TppLine
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11684
        mmLeft = 57414
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine50: TppLine
        UserName = 'Line30'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11684
        mmLeft = 14288
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine51: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11684
        mmLeft = 65088
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText1'
        DataField = 'REA01'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 65881
        mmTop = 3440
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText2'
        DataField = 'REA02'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 84402
        mmTop = 3440
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'DBText3'
        DataField = 'REA03'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 103188
        mmTop = 3440
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText4'
        DataField = 'REA04'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 121444
        mmTop = 3440
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText47: TppDBText
        UserName = 'ppDBText1001'
        DataField = 'REA05'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 139436
        mmTop = 3440
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'DBText5'
        DataField = 'REA06'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 157692
        mmTop = 3440
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'DBText6'
        DataField = 'REA07'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 175948
        mmTop = 3440
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'DBText7'
        DataField = 'REA08'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 193940
        mmTop = 3440
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'DBText8'
        DataField = 'REA09'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 212196
        mmTop = 3440
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'DBText9'
        DataField = 'REA10'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 230453
        mmTop = 3440
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'DBText10'
        DataField = 'REA11'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 248973
        mmTop = 3440
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'DBText11'
        DataField = 'REA12'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 267230
        mmTop = 3440
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText55: TppDBText
        UserName = 'DBText12'
        DataField = 'VAR01'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 65881
        mmTop = 6350
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'DBText13'
        DataField = 'VAR02'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 84402
        mmTop = 6350
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'DBText14'
        DataField = 'VAR03'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 103188
        mmTop = 6350
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText15'
        DataField = 'VAR04'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 121444
        mmTop = 6350
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'DBText16'
        DataField = 'VAR05'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 139436
        mmTop = 6350
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText17'
        DataField = 'VAR06'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 157692
        mmTop = 6350
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'DBText18'
        DataField = 'VAR07'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 175948
        mmTop = 6350
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'DBText19'
        DataField = 'VAR08'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 193940
        mmTop = 6350
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText20'
        DataField = 'VAR09'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 212196
        mmTop = 6350
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'DBText21'
        DataField = 'VAR10'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 230453
        mmTop = 6350
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'DBText102'
        DataField = 'VAR11'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 248973
        mmTop = 6615
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'DBText22'
        DataField = 'VAR12'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 267230
        mmTop = 6615
        mmWidth = 16933
        BandType = 4
      end
      object plbl42: TppLabel
        UserName = 'plbl34'
        Caption = 'Orc:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 58738
        mmTop = 0
        mmWidth = 5080
        BandType = 4
      end
      object plbl43: TppLabel
        UserName = 'plbl35'
        Caption = 'Rea:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 59002
        mmTop = 3175
        mmWidth = 5334
        BandType = 4
      end
      object plbl44: TppLabel
        UserName = 'plbl36'
        Caption = 'Var:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 59002
        mmTop = 6350
        mmWidth = 4699
        BandType = 4
      end
      object ppLine52: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 9525
        mmWidth = 309827
        BandType = 4
      end
      object ppLine53: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11684
        mmLeft = 83312
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine54: TppLine
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11684
        mmLeft = 101864
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine55: TppLine
        UserName = 'Line20'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11684
        mmLeft = 120386
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine56: TppLine
        UserName = 'Line201'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11684
        mmLeft = 138641
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine57: TppLine
        UserName = 'Line22'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11684
        mmLeft = 156634
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine58: TppLine
        UserName = 'Line23'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11684
        mmLeft = 174890
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine59: TppLine
        UserName = 'Line24'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11684
        mmLeft = 193147
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine60: TppLine
        UserName = 'Line25'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11684
        mmLeft = 211138
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine61: TppLine
        UserName = 'Line26'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11684
        mmLeft = 229660
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine62: TppLine
        UserName = 'Line27'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11684
        mmLeft = 248179
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine63: TppLine
        UserName = 'Line28'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11684
        mmLeft = 266436
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine65: TppLine
        UserName = 'Line32'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11642
        mmLeft = 285486
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText67: TppDBText
        UserName = 'DBText23'
        DataField = 'REA_TOTAL'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 287867
        mmTop = 3704
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText68: TppDBText
        UserName = 'DBText24'
        DataField = 'VAR_TOTAL'
        DataPipeline = pplRelatGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 287867
        mmTop = 6879
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText69: TppDBText
        UserName = 'DBText25'
        DataField = 'ORC_TOTAL'
        DataPipeline = pplRelatGrupo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatGrupo'
        mmHeight = 2381
        mmLeft = 287867
        mmTop = 529
        mmWidth = 16933
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc48'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 2646
        mmWidth = 280194
        BandType = 8
      end
      object plbl45: TppLabel
        UserName = 'plblSistema'
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
        mmTop = 2646
        mmWidth = 280194
        BandType = 8
      end
      object ppLine66: TppLine
        UserName = 'ppLine77'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1323
        mmWidth = 309827
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc49'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 283105
        mmTop = 2381
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 58738
      mmPrintPosition = 0
      object plbl46: TppLabel
        UserName = 'plbl27'
        Caption = 'Parâmetros Utilizados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 1852
        mmTop = 1588
        mmWidth = 36915
        BandType = 7
      end
      object ppMemo1: TppMemo
        UserName = 'MemoFiltrosutilizados'
        Caption = 'MemoFiltrosutilizados'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 49742
        mmLeft = 1323
        mmTop = 6879
        mmWidth = 305859
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
  end
end
