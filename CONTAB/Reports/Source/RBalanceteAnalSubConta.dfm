inherited RptBalanceteAnalSubConta: TRptBalanceteAnalSubConta
  Left = 350
  Top = 250
  Width = 560
  Height = 410
  Caption = 'Relatório de Balancete'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Balancete'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Exercício'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT'
          '   PEREXERCICIO'
          'FROM'
          '   PERIODO'
          'WHERE'
          '   (IDPESSOA = 1)'
          'ORDER BY  PEREXERCICIO')
        LookupSettings.Chave = 'PEREXERCICIO'
        LookupSettings.Display = 'PEREXERCICIO'
        LookupSettings.Descricao = 'Exercício'
        LookupSettings.Tamanho = '10'
        CheckBoxSetings.ValueChecked = 'False'
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Exercício'
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
        Caption = 'Período Inicial'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT  '
          '   PERNUMERO, '
          '   PERNOME,'
          '   PEREXERCICIO '
          'FROM '
          '   PERIODO '
          'ORDER BY '
          '   PEREXERCICIO,'
          '   PERNUMERO')
        LookupSettings.Chave = 'PERNUMERO'
        LookupSettings.Display = 'PEREXERCNOME'
        LookupSettings.Descricao = 'Período Inicial'
        LookupSettings.Tamanho = '30'
        CheckBoxSetings.ValueChecked = 'False'
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Período Inicial'
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
        Caption = 'Período Final'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT  '
          '   PERNUMERO, '
          '   PERNOME,'
          '   PEREXERCICIO '
          'FROM '
          '   PERIODO '
          'ORDER BY '
          '   PEREXERCICIO,'
          '   PERNUMERO')
        LookupSettings.Chave = 'PERNUMERO'
        LookupSettings.Display = 'PEREXERCNOME'
        LookupSettings.Descricao = 'Período Final'
        LookupSettings.Tamanho = '30'
        CheckBoxSetings.ValueChecked = 'False'
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Período Final'
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
        Caption = 'Conta Inicial'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '     PLACONTA,'
          '     PLANOME,'
          '     PLANOMEOUTLING'
          'FROM'
          '     PLANOCONTA'
          'ORDER BY PLACONTA')
        LookupSettings.Chave = 'PLACONTA'
        LookupSettings.Display = 'PLACONTA|PLANOME'
        LookupSettings.Descricao = 'Conta|Descrição'
        LookupSettings.Tamanho = '20|40'
        CheckBoxSetings.ValueChecked = 'False'
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
        Name = 'Conta Inicial'
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
        Caption = 'Conta Final'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '     PLACONTA,'
          '     PLANOME,'
          '     PLANOMEOUTLING'
          'FROM'
          '     PLANOCONTA'
          'ORDER BY PLACONTA')
        LookupSettings.Chave = 'PLACONTA'
        LookupSettings.Display = 'PLACONTA|PLANOME'
        LookupSettings.Descricao = 'Conta|Descrição'
        LookupSettings.Tamanho = '20|40'
        CheckBoxSetings.ValueChecked = 'False'
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
        Name = 'Conta Final'
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
        Caption = 'Centro de Custo Inicial'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   CODCENTROCUSTO,'
          '   NOME'
          'FROM'
          '   CENTCUST'
          'ORDER BY NOME')
        LookupSettings.Chave = 'CODCENTROCUSTO'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Centro de Custo'
        LookupSettings.Tamanho = '40'
        CheckBoxSetings.ValueChecked = 'False'
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
        Name = 'Centro de Custo Inicial'
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
        Caption = 'Centro de Custo Final'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   CODCENTROCUSTO,'
          '   NOME'
          'FROM'
          '   CENTCUST'
          'ORDER BY NOME')
        LookupSettings.Chave = 'CODCENTROCUSTO'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Centro de Custo'
        LookupSettings.Tamanho = '40'
        CheckBoxSetings.ValueChecked = 'False'
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
        Name = 'Centro de Custo Final'
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
        Caption = 'Atividade/Projeto'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   UNIDNEGOC,'
          '   NOME,'
          '   UNECODIGO'
          'FROM'
          '   UNIDNEGOCIO'
          'ORDER BY NOME')
        LookupSettings.Chave = 'UNIDNEGOC'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Atividade/Projeto'
        LookupSettings.Tamanho = '40'
        CheckBoxSetings.ValueChecked = 'False'
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
        Name = 'Atividade/Projeto'
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
        Caption = 'Data Inicial'
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
        Name = 'Data Inicial'
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
        Caption = 'Data Final'
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
        Name = 'Data Final'
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
        Caption = 'Conta contábil com máscara'
        Controle = tcCheckBox
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Conta contábil com máscara'
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
        Caption = 'Quebra página por Grupo'
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
        Name = 'Quebra página por Grupo'
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
        Caption = 'Imprimir em outro Idioma'
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
        Name = 'Imprimir em outro Idioma'
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
        Caption = 'Imprimir Contas até o Grau'
        Controle = tcSpinEdit
        TipodeDado = tdInteger
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
        Name = 'Imprimir Contas até o Grau'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 1
        SpinEditSettings.Increment = 1
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
        Width = 40
      end
      item
        Caption = 'Conta Correspondente'
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
        Name = 'Conta Correspondente'
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
        Caption = 'Espaçamento entre Contas Sin.'
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
        Name = 'Espaçamento entre Contas Sin.'
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
        Caption = 'Indenta Contas'
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
        Name = 'Indenta Contas'
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
        Caption = 'Imprimir somente contas contra sua natureza'
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
        Name = 'Imprimir somente contas contra sua natureza'
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
        Caption = 'Imprimir página de Totalizadores'
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
        Name = 'Imprimir página de Totalizadores'
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
        Caption = 'Desconsiderar o Encerramento de Resultado'
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
        Name = 'Desconsiderar o Encerramento de Resultado'
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
        Caption = 'Desconsiderar as contas Estatísticas'
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
        Name = 'Desconsiderar as contas Estatísticas'
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
        Caption = 'Colunas de Valores'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Movimentação'
          'Débito e Crédito'
          'Ambos')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 1
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
        Name = 'Colunas de Valores'
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
        Caption = 'Imprimir Somente as Contas Movimentadas'
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
        Name = 'Imprimir Somente as Contas Movimentadas'
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
        Caption = 'Página Inicial'
        Controle = tcSpinEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
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
        TextDefault = '1'
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Página Inicial'
        SpinEditSettings.MaxValue = 1
        SpinEditSettings.MinValue = 1
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 1
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
        Width = 40
      end
      item
        Caption = 'Título'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
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
        Name = 'Título'
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
        Width = 250
      end
      item
        Caption = 'Sub-Título'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
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
        Name = 'Sub-Título'
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
        Width = 250
      end
      item
        Caption = 'Código do Plano Previdenciário'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '   IDPLANOPREV, '
          '   NOME'
          'FROM'
          '   PLANPREVCONTABIL'
          'ORDER BY NOME')
        LookupSettings.Chave = 'IDPLANOPREV'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Plano Previdenciário'
        LookupSettings.Tamanho = '40'
        CheckBoxSetings.ValueChecked = 'False'
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
        ListBoxSettings.MultiSelect = True
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbOwnerDrawFixed
        ListBoxSettings.height = 90
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Código do Plano Previdenciário'
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
        Width = 250
      end
      item
        Caption = 'Código do Patrocinador'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   PA.IDPESSOA, '
          '   PE.NOME, '
          '   '#39'N'#39' AS MARCA'
          'FROM'
          '   PESSOA PE,'
          '   PATRO PA'
          'WHERE'
          '   (PA.IDPESSOA = PE.IDPESSOA)'
          'ORDER BY PE.NOME')
        LookupSettings.Chave = 'IDPESSOA'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Patrocinador'
        LookupSettings.Tamanho = '40'
        CheckBoxSetings.ValueChecked = 'False'
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
        ListBoxSettings.MultiSelect = True
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbOwnerDrawFixed
        ListBoxSettings.height = 90
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Código do Patrocinador'
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
        Width = 250
      end
      item
        Caption = 'Código Atividade/Projeto'
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
        Name = 'Código Atividade/Projeto'
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
        Width = 250
      end
      item
        Caption = 'Quebra por plano SPC'
        Controle = tcCheckBox
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
        Caption = 'Quebra por Plano e Patrocinadora'
        Controle = tcCheckBox
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
        Caption = 'Somente Contas Contra Sua Natureza'
        Controle = tcCheckBox
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
        Caption = 'Mostra Relatório Expandido'
        Controle = tcCheckBox
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
        Name = 'bExpandido'
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
        Caption = 'Quebra por Subconta'
        Controle = tcCheckBox
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
        Caption = 'Mostra Relatório Expandido (Analíticas)'
        Controle = tcCheckBox
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
        Name = 'bExpandidoAnalitica'
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
        Caption = 'Somente Contas Padrão da Secretaria'
        Controle = tcEdit
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
    BeforeExecute = CmpRptCMBeforeExecute
    OnParamControlExit = CmpRptCMParamControlExit
    OnParamControlEnter = CmpRptCMParamControlEnter
    Formheight = 600
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 32
    Top = 116
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptBalancete
    Left = 32
    Top = 60
  end
  object dsBalancete: TwwDataSource
    DataSet = cdsBalancete
    Left = 273
    Top = 119
  end
  object rptBalancete: TppReport
    AutoStop = False
    DataPipeline = ppBalancete
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
    BeforePrint = rptBalanceteBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 184
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197380
    DataPipelineName = 'ppBalancete'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28840
      mmPrintPosition = 0
      object lblCodConta: TppLabel
        UserName = 'lblCodConta'
        Caption = 'Cód. Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 2921
        mmLeft = 1058
        mmTop = 24077
        mmWidth = 12996
        BandType = 0
      end
      object lblNomeConta: TppLabel
        UserName = 'lblNomeConta'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 2921
        mmLeft = 48154
        mmTop = 24077
        mmWidth = 6816
        BandType = 0
      end
      object txtSaldoAntBal: TppLabel
        UserName = 'txtSaldoAntBal'
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 2921
        mmLeft = 186002
        mmTop = 24077
        mmWidth = 16806
        BandType = 0
      end
      object txtDebBal: TppLabel
        UserName = 'txtDebBal'
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 2921
        mmLeft = 213784
        mmTop = 24077
        mmWidth = 7578
        BandType = 0
      end
      object txtCredBal: TppLabel
        UserName = 'txtCredBal'
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 2921
        mmLeft = 228336
        mmTop = 24077
        mmWidth = 8551
        BandType = 0
      end
      object txtMovBal: TppLabel
        UserName = 'txtMovBal'
        Caption = 'Movimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 2921
        mmLeft = 242623
        mmTop = 24077
        mmWidth = 12869
        BandType = 0
      end
      object txtSaldoBal: TppLabel
        UserName = 'txtSaldoBal'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 2921
        mmLeft = 263261
        mmTop = 24077
        mmWidth = 13377
        BandType = 0
      end
      object ppLblTituloBalancete: TppLabel
        UserName = 'ppLblTituloBalancete'
        Caption = 'Balancete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 130969
        mmTop = 7408
        mmWidth = 19844
        BandType = 0
      end
      object lblNomeEmpresa: TppLabel
        UserName = 'lblNomeEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127000
        mmTop = 265
        mmWidth = 28046
        BandType = 0
      end
      object rptBalanceteLabel8: TppLabel
        UserName = 'rptBalanceteLabel8'
        Caption = 'rptBalanceteLabel8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 18256
        mmWidth = 24342
        BandType = 0
      end
      object ppLblTituloBalancete2: TppLabel
        UserName = 'ppLblTituloBalancete2'
        Caption = 'ppLblTitulo2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 12965
        mmWidth = 15346
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21960
        mmWidth = 284300
        BandType = 0
      end
    end
    object bndDetBalancete: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object ppSubReport: TppSubReport
        OnPrint = ppSubReportPrint
        UserName = 'SubReport'
        DrillDownComponent = ppRegion
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDetalheSubconta'
        mmHeight = 4763
        mmLeft = 0
        mmTop = 3969
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDetalheSubconta
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
          Left = 344
          Top = 256
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppDetalheSubconta'
          object ppTitleBandSub: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppLabel1: TppLabel
              UserName = 'Label1'
              Caption = 'Cód. Subconta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 2910
              mmLeft = 16933
              mmTop = 529
              mmWidth = 17198
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'Label2'
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 2910
              mmLeft = 48154
              mmTop = 529
              mmWidth = 6879
              BandType = 1
            end
            object lblPatro: TppLabel
              UserName = 'lblPatro'
              Caption = 'Patrocinadora'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 2910
              mmLeft = 97102
              mmTop = 529
              mmWidth = 16404
              BandType = 1
            end
            object lblPlano: TppLabel
              UserName = 'lblPatro1'
              Caption = 'Plano Previdenciário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 2910
              mmLeft = 135467
              mmTop = 529
              mmWidth = 24077
              BandType = 1
            end
            object lblCodSpc: TppLabel
              UserName = 'lblCodSpc'
              Caption = 'Código SPC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 2910
              mmLeft = 96838
              mmTop = 529
              mmWidth = 14023
              BandType = 1
            end
          end
          object ppDetailBandSub: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 2646
            mmPrintPosition = 0
            object ppDBText1: TppDBText
              UserName = 'dbtxtNomeContaBal1'
              DataField = 'CODSUBCONTA'
              DataPipeline = ppDetalheSubconta
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDetalheSubconta'
              mmHeight = 2498
              mmLeft = 16933
              mmTop = 265
              mmWidth = 17463
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              AutoSize = True
              DataField = 'SALDOANTABS'
              DataPipeline = ppDetalheSubconta
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDetalheSubconta'
              mmHeight = 2498
              mmLeft = 198702
              mmTop = 0
              mmWidth = 4149
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'dbtxtSaldoAntDCBal1'
              DataField = 'DEBCREANT'
              DataPipeline = ppDetalheSubconta
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDetalheSubconta'
              mmHeight = 2381
              mmLeft = 203730
              mmTop = 0
              mmWidth = 3440
              BandType = 4
            end
            object dbtxtDebSub: TppDBText
              UserName = 'dbtxtDebBal2'
              AutoSize = True
              DataField = 'DEB'
              DataPipeline = ppDetalheSubconta
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDetalheSubconta'
              mmHeight = 2498
              mmLeft = 217223
              mmTop = 265
              mmWidth = 4149
              BandType = 4
            end
            object dbtxtCredSub: TppDBText
              UserName = 'dbtxtCredBal1'
              AutoSize = True
              DataField = 'CRED'
              DataPipeline = ppDetalheSubconta
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDetalheSubconta'
              mmHeight = 2498
              mmLeft = 232654
              mmTop = 265
              mmWidth = 4149
              BandType = 4
            end
            object dbtxtMovAbs: TppDBText
              UserName = 'dbtxtMovBal1'
              AutoSize = True
              DataField = 'MOVABS'
              DataPipeline = ppDetalheSubconta
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDetalheSubconta'
              mmHeight = 2498
              mmLeft = 251439
              mmTop = 265
              mmWidth = 4149
              BandType = 4
            end
            object dbtxtMovDc: TppDBText
              UserName = 'dbtxtMovDCBal1'
              DataField = 'MOVDC'
              DataPipeline = ppDetalheSubconta
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDetalheSubconta'
              mmHeight = 2498
              mmLeft = 256382
              mmTop = 265
              mmWidth = 3440
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'dbtxtSaldoBal1'
              AutoSize = True
              DataField = 'SALDOABS'
              DataPipeline = ppDetalheSubconta
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDetalheSubconta'
              mmHeight = 2498
              mmLeft = 272341
              mmTop = 265
              mmWidth = 4149
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'dbtxtSaldoDCBal1'
              DataField = 'DEBCRESALDO'
              DataPipeline = ppDetalheSubconta
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDetalheSubconta'
              mmHeight = 2498
              mmLeft = 277548
              mmTop = 265
              mmWidth = 2910
              BandType = 4
            end
            object dbtxtPatro: TppDBText
              UserName = 'DBText1'
              DataField = 'PATRO'
              DataPipeline = ppDetalheSubconta
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDetalheSubconta'
              mmHeight = 2498
              mmLeft = 97102
              mmTop = 0
              mmWidth = 36248
              BandType = 4
            end
            object dbtxtPlano: TppDBText
              UserName = 'DBText3'
              DataField = 'PLANOPREV'
              DataPipeline = ppDetalheSubconta
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDetalheSubconta'
              mmHeight = 2498
              mmLeft = 135467
              mmTop = 0
              mmWidth = 49742
              BandType = 4
            end
            object dbtxtCodspc: TppDBText
              UserName = 'dbtxtCodspc'
              DataField = 'CODSPC'
              DataPipeline = ppDetalheSubconta
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDetalheSubconta'
              mmHeight = 2381
              mmLeft = 97367
              mmTop = 0
              mmWidth = 14817
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText4'
              DataField = 'NOMESUBCONTA'
              DataPipeline = ppDetalheSubconta
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDetalheSubconta'
              mmHeight = 2381
              mmLeft = 48154
              mmTop = 0
              mmWidth = 46302
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup4: TppGroup
            BreakName = 'CODSPC'
            DataPipeline = ppDetalheSubconta
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group4'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppDetalheSubconta'
            object ppGroupHeaderBand4: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand4: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
          object ppGroup6: TppGroup
            BreakName = 'CODSUBCONTA'
            DataPipeline = ppDetalheSubconta
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group6'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppDetalheSubconta'
            object ppGroupHeaderBand6: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand6: TppGroupFooterBand
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
      object ppRegion: TppRegion
        UserName = 'Region'
        Caption = 'Region'
        Pen.Style = psClear
        Stretch = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 284692
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object dbtxtCorrespBal: TppDBText
          UserName = 'dbtxtCorrespBal'
          DataField = 'PLACONCORRESP'
          DataPipeline = ppBalancete
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          Visible = False
          DataPipelineName = 'ppBalancete'
          mmHeight = 2646
          mmLeft = 1323
          mmTop = 529
          mmWidth = 42069
          BandType = 4
        end
        object dbtxtContaBal: TppDBText
          UserName = 'dbtxtContaBal'
          DataField = 'PLACONTA'
          DataPipeline = ppBalancete
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBalancete'
          mmHeight = 2381
          mmLeft = 1058
          mmTop = 794
          mmWidth = 42069
          BandType = 4
        end
        object dbtxtSaldoAntBal: TppDBText
          UserName = 'dbtxtDebBal1'
          AutoSize = True
          DataField = 'SALDOANTABS'
          DataPipeline = ppBalancete
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBalancete'
          mmHeight = 2498
          mmLeft = 190500
          mmTop = 794
          mmWidth = 12446
          BandType = 4
        end
        object dbtxtSaldoAntDCBal: TppDBText
          UserName = 'dbtxtSaldoAntDCBal'
          DataField = 'DEBCREANT'
          DataPipeline = ppBalancete
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBalancete'
          mmHeight = 2381
          mmLeft = 203730
          mmTop = 794
          mmWidth = 3440
          BandType = 4
        end
        object dbtxtDebBal: TppDBText
          UserName = 'dbtxtDebBal'
          AutoSize = True
          DataField = 'DEB'
          DataPipeline = ppBalancete
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBalancete'
          mmHeight = 2498
          mmLeft = 211932
          mmTop = 794
          mmWidth = 9483
          BandType = 4
        end
        object dbtxtCredBal: TppDBText
          UserName = 'dbtxtCredBal'
          AutoSize = True
          DataField = 'CRED'
          DataPipeline = ppBalancete
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBalancete'
          mmHeight = 2498
          mmLeft = 227278
          mmTop = 794
          mmWidth = 9483
          BandType = 4
        end
        object dbtxtMovBal: TppDBText
          UserName = 'dbtxtMovBal'
          AutoSize = True
          DataField = 'MOVABS'
          DataPipeline = ppBalancete
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBalancete'
          mmHeight = 2498
          mmLeft = 246063
          mmTop = 794
          mmWidth = 9483
          BandType = 4
        end
        object dbtxtMovDCBal: TppDBText
          UserName = 'dbtxtMovDCBal'
          DataField = 'MOVDC'
          DataPipeline = ppBalancete
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBalancete'
          mmHeight = 2498
          mmLeft = 256382
          mmTop = 794
          mmWidth = 3440
          BandType = 4
        end
        object dbtxtSaldoBal: TppDBText
          UserName = 'dbtxtSaldoBal'
          AutoSize = True
          DataField = 'SALDOABS'
          DataPipeline = ppBalancete
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBalancete'
          mmHeight = 2498
          mmLeft = 264055
          mmTop = 794
          mmWidth = 12446
          BandType = 4
        end
        object dbtxtSaldoDCBal: TppDBText
          UserName = 'dbtxtSaldoDCBal'
          DataField = 'DEBCRESALDO'
          DataPipeline = ppBalancete
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBalancete'
          mmHeight = 2498
          mmLeft = 277548
          mmTop = 794
          mmWidth = 2910
          BandType = 4
        end
        object dbtxtNomeContaBal: TppDBText
          UserName = 'dbtxtNomeContaBal'
          DataField = 'NOMEINDENTADO'
          DataPipeline = ppBalancete
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBalancete'
          mmHeight = 2381
          mmLeft = 48154
          mmTop = 794
          mmWidth = 48419
          BandType = 4
        end
        object rptBalanceteDBText3: TppDBText
          UserName = 'rptBalanceteDBText3'
          DataField = 'GRAU'
          DataPipeline = ppBalancete
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          Visible = False
          DataPipelineName = 'ppBalancete'
          mmHeight = 2381
          mmLeft = 18785
          mmTop = 1058
          mmWidth = 6879
          BandType = 4
        end
      end
    end
    object ppFooterBand2: TppFooterBand
      BeforePrint = ppFooterBand2BeforePrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rptBalanceteLabel1: TppLabel
        UserName = 'rptBalanceteLabel1'
        Caption = 'Página'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 131498
        mmTop = 794
        mmWidth = 10054
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1852
        mmLeft = 0
        mmTop = 0
        mmWidth = 283898
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 218017
        mmTop = 794
        mmWidth = 4498
        BandType = 8
      end
      object lblNomeSistema: TppLabel
        UserName = 'lblNomeSistema'
        AutoSize = False
        Caption = 'Contabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 794
        mmWidth = 79375
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 257176
        mmTop = 794
        mmWidth = 26289
        BandType = 8
      end
      object lblContador: TppLabel
        UserName = 'lblContador'
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 142346
        mmTop = 794
        mmWidth = 1566
        BandType = 8
      end
    end
    object bndSumarioBal: TppSummaryBand
      NewPage = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 97102
      mmPrintPosition = 0
      object memBalSaldoAnt: TppMemo
        UserName = 'memBalSaldoAnt'
        Caption = 'memBalSaldoAnt'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 37571
        mmLeft = 88106
        mmTop = 14817
        mmWidth = 33602
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memBalDeb: TppMemo
        UserName = 'memBalDeb'
        Caption = 'memBalDeb'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 37571
        mmLeft = 127529
        mmTop = 14817
        mmWidth = 33602
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memBalCre: TppMemo
        UserName = 'memBalCre'
        Caption = 'memBalCre'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 37571
        mmLeft = 162454
        mmTop = 15081
        mmWidth = 33602
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memBalMov: TppMemo
        UserName = 'memBalMov'
        Caption = 'memBalMov'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 37571
        mmLeft = 197115
        mmTop = 15081
        mmWidth = 33602
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memBalSaldo: TppMemo
        UserName = 'memBalSaldo'
        Caption = 'memBalSaldo'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 37571
        mmLeft = 236273
        mmTop = 15081
        mmWidth = 33602
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memBalDesc: TppMemo
        UserName = 'memBalDesc'
        Caption = 'memBalDesc'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 37571
        mmLeft = 47890
        mmTop = 14817
        mmWidth = 38629
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memBalDCSaldoAnt: TppMemo
        UserName = 'memBalDCSaldoAnt'
        Caption = 'memBalDCSaldoAnt'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 37571
        mmLeft = 122238
        mmTop = 14817
        mmWidth = 3969
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memBalDCMov: TppMemo
        UserName = 'memBalDCMov'
        Caption = 'memBalDCMov'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 37571
        mmLeft = 231246
        mmTop = 15081
        mmWidth = 3440
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memBalDCSaldo: TppMemo
        UserName = 'memBalDCSaldo'
        Caption = 'memBalDCSaldo'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 37571
        mmLeft = 270405
        mmTop = 15081
        mmWidth = 3440
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptBalanceteLabel2: TppLabel
        UserName = 'rptBalanceteLabel2'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 247386
        mmTop = 9525
        mmWidth = 19579
        BandType = 7
      end
      object rptBalanceteLabel3: TppLabel
        UserName = 'rptBalanceteLabel3'
        Caption = 'Movimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 208757
        mmTop = 9525
        mmWidth = 18521
        BandType = 7
      end
      object rptBalanceteLabel4: TppLabel
        UserName = 'rptBalanceteLabel4'
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 179652
        mmTop = 9525
        mmWidth = 12171
        BandType = 7
      end
      object rptBalanceteLabel5: TppLabel
        UserName = 'rptBalanceteLabel5'
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 144992
        mmTop = 9525
        mmWidth = 10848
        BandType = 7
      end
      object rptBalanceteLabel6: TppLabel
        UserName = 'rptBalanceteLabel6'
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 94456
        mmTop = 9260
        mmWidth = 24342
        BandType = 7
      end
      object rptBalanceteLine1: TppLine
        UserName = 'rptBalanceteLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1852
        mmLeft = 87842
        mmTop = 5292
        mmWidth = 185738
        BandType = 7
      end
      object rptBalanceteLabel7: TppLabel
        UserName = 'rptBalanceteLabel7'
        Caption = '  TOTAIS  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        mmHeight = 4233
        mmLeft = 167482
        mmTop = 3440
        mmWidth = 16933
        BandType = 7
      end
      object ppLine7: TppLine
        UserName = 'ppLine7'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 7
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'PLACONTA'
      DataPipeline = ppBalancete
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBalancete'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'CODSPC'
      DataPipeline = ppBalancete
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBalancete'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PLANOPREV'
      DataPipeline = ppBalancete
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBalancete'
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
      BreakName = 'PATRO'
      DataPipeline = ppBalancete
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBalancete'
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
    object ppParameterList1: TppParameterList
    end
  end
  object CdsBalTot: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspBalTot'
    Left = 196
    Top = 120
  end
  object ppBalancete: TppDBPipeline
    DataSource = dsBalancete
    UserName = 'Balancete'
    Left = 96
    Top = 58
    object ppBalanceteppField1: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 0
    end
    object ppBalanceteppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLAGRAU'
      FieldName = 'PLAGRAU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBalanceteppField3: TppField
      FieldAlias = 'PLATIPO'
      FieldName = 'PLATIPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object ppBalanceteppField4: TppField
      FieldAlias = 'PLACONCORRESP'
      FieldName = 'PLACONCORRESP'
      FieldLength = 18
      DisplayWidth = 18
      Position = 3
    end
    object ppBalanceteppField5: TppField
      FieldAlias = 'PLANATUREZA'
      FieldName = 'PLANATUREZA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object ppBalanceteppField6: TppField
      FieldAlias = 'GRAU'
      FieldName = 'GRAU'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object ppBalanceteppField7: TppField
      FieldAlias = 'CONTA'
      FieldName = 'CONTA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object ppBalanceteppField8: TppField
      FieldAlias = 'PLANOMEOUTLING'
      FieldName = 'PLANOMEOUTLING'
      FieldLength = 40
      DisplayWidth = 40
      Position = 7
    end
    object ppBalanceteppField9: TppField
      FieldAlias = 'PLANOME'
      FieldName = 'PLANOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object ppBalanceteppField10: TppField
      FieldAlias = 'NOMEINDENTADO'
      FieldName = 'NOMEINDENTADO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object ppBalanceteppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEB'
      FieldName = 'DEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppBalanceteppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'CRED'
      FieldName = 'CRED'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppBalanceteppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBA'
      FieldName = 'DEBA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppBalanceteppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'CREDA'
      FieldName = 'CREDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppBalanceteppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV'
      FieldName = 'MOV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppBalanceteppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANT'
      FieldName = 'SALDOANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppBalanceteppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppBalanceteppField18: TppField
      FieldAlias = 'MOVDC'
      FieldName = 'MOVDC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 17
    end
    object ppBalanceteppField19: TppField
      FieldAlias = 'DEBCRESALDO'
      FieldName = 'DEBCRESALDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 18
    end
    object ppBalanceteppField20: TppField
      FieldAlias = 'DEBCREANT'
      FieldName = 'DEBCREANT'
      FieldLength = 1
      DisplayWidth = 1
      Position = 19
    end
    object ppBalanceteppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANTABS'
      FieldName = 'SALDOANTABS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppBalanceteppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOABS'
      FieldName = 'SALDOABS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppBalanceteppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOVABS'
      FieldName = 'MOVABS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppBalanceteppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppBalanceteppField25: TppField
      FieldAlias = 'PLANOPREV'
      FieldName = 'PLANOPREV'
      FieldLength = 50
      DisplayWidth = 50
      Position = 24
    end
    object ppBalanceteppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppBalanceteppField27: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 26
    end
    object ppBalanceteppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODSPC'
      FieldName = 'CODSPC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
  end
  object sqlTotalizador: TCMSqlParams
    ClientDataSet = CdsBalTot
    Left = 272
    Top = 64
  end
  object cdsTitulos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 176
  end
  object sqlTitulos: TCMSqlParams
    OnFormartParam = sqlTitulosFormartParam
    ClientDataSet = cdsTitulos
    Left = 40
    Top = 176
  end
  object ppDetalheSubconta: TppDBPipeline
    DataSource = DsEspelho
    UserName = 'DetalheSubconta'
    Left = 440
    Top = 242
    object ppDetalheSubcontappField1: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField2: TppField
      FieldAlias = 'CODSUBCONTA'
      FieldName = 'CODSUBCONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField3: TppField
      FieldAlias = 'NOMESUBCONTA'
      FieldName = 'NOMESUBCONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField4: TppField
      FieldAlias = 'PLAGRAU'
      FieldName = 'PLAGRAU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField5: TppField
      FieldAlias = 'PLATIPO'
      FieldName = 'PLATIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField6: TppField
      FieldAlias = 'GRAU'
      FieldName = 'GRAU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField7: TppField
      FieldAlias = 'PLACONCORRESP'
      FieldName = 'PLACONCORRESP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField8: TppField
      FieldAlias = 'PLANATUREZA'
      FieldName = 'PLANATUREZA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField9: TppField
      FieldAlias = 'CONTA'
      FieldName = 'CONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField10: TppField
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField11: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField12: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField13: TppField
      FieldAlias = 'PLANOPREV'
      FieldName = 'PLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField14: TppField
      FieldAlias = 'CODSPC'
      FieldName = 'CODSPC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField15: TppField
      FieldAlias = 'NOMEINDENTADO'
      FieldName = 'NOMEINDENTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField16: TppField
      FieldAlias = 'DEB'
      FieldName = 'DEB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField17: TppField
      FieldAlias = 'CRED'
      FieldName = 'CRED'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField18: TppField
      FieldAlias = 'MOV'
      FieldName = 'MOV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField19: TppField
      FieldAlias = 'SALDOANT'
      FieldName = 'SALDOANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField20: TppField
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField21: TppField
      FieldAlias = 'DEBA'
      FieldName = 'DEBA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField22: TppField
      FieldAlias = 'CREDA'
      FieldName = 'CREDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField23: TppField
      FieldAlias = 'MOVDC'
      FieldName = 'MOVDC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField24: TppField
      FieldAlias = 'DEBCRESALDO'
      FieldName = 'DEBCRESALDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField25: TppField
      FieldAlias = 'DEBCREANT'
      FieldName = 'DEBCREANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField26: TppField
      FieldAlias = 'SALDOANTABS'
      FieldName = 'SALDOANTABS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField27: TppField
      FieldAlias = 'SALDOABS'
      FieldName = 'SALDOABS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppDetalheSubcontappField28: TppField
      FieldAlias = 'MOVABS'
      FieldName = 'MOVABS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
  end
  object DsEspelho: TwwDataSource
    DataSet = cdsDetalheSubcontas
    Left = 441
    Top = 191
  end
  object cdsBalancete: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 232
    Data = {
      821600009619E0BD01000000180000001C001A00000003000000000308504C41
      434F4E544101004900000002000753554254595045020049000A004669786564
      436861720005574944544802000200120007504C414752415508000400000000
      0007504C415449504F01004900000002000753554254595045020049000A0046
      6978656443686172000557494454480200020001000D504C41434F4E434F5252
      45535001004900000001000557494454480200020012000B504C414E41545552
      455A4101004900000002000753554254595045020049000A0046697865644368
      6172000557494454480200020001000447524155010049000000010005574944
      544802000200010005434F4E5441010049000000010005574944544802000200
      3C000E504C414E4F4D454F55544C494E47010049000000010005574944544802
      000200280007504C414E4F4D450100490000000100055749445448020002003C
      000D4E4F4D45494E44454E5441444F0100490000000100055749445448020002
      003C000344454208000400000000000443524544080004000000000004444542
      4108000400000000000543524544410800040000000000034D4F560800040000
      0000000853414C444F414E5408000400000000000553414C444F080004000000
      0000054D4F56444301004900000001000557494454480200020001000B444542
      43524553414C444F010049000000010005574944544802000200010009444542
      435245414E5401004900000001000557494454480200020001000B53414C444F
      414E5441425308000400000000000853414C444F414253080004000000000006
      4D4F5641425308000400000000000B4944504C414E4F50524556080004000000
      000009504C414E4F505245560100490000000100055749445448020002003200
      074944504154524F080004000000000005504154524F01004900000001000557
      49445448020002003C0006434F44535043080004000000000002000D44454641
      554C545F4F5244455202008200030000001B0019000100044C43494404000100
      0908000000404000000000000132000000000000F03F01530143013207504153
      5349564F075041535349564F075041535349564FAE47E17A34E0D240EC51B81E
      CDAFF340000000000000000000000000000000000000000080EFEDC0713D0AF7
      BFAE5641713D0AF7E0725641014301440144713D0AF7BFAE5641713D0AF7E072
      56410000000080EFED40000000000000F03F104F50455241C7D5455320434F4D
      554E5300000000E06DE8401242524153494C2054454C45434F4D20532F410000
      0000000000000040400000000000023231000000000000004001530143013214
      45584947CD56454C204F5045524143494F4E414C1445584947CD56454C204F50
      45524143494F4E414C1445584947CD56454C204F5045524143494F4E414CAE47
      E17A34E0D240EC51B81ECDAFF340000000000000000000000000000000000000
      000080EFEDC0713D0AF7BFAE5641713D0AF7E0725641014301440144713D0AF7
      BFAE5641713D0AF7E07256410000000080EFED40000000000000F03F104F5045
      5241C7D5455320434F4D554E5300000000E06DE8401242524153494C2054454C
      45434F4D20532F41000000000000000000404000150000000132000000000000
      F03F015301430132075041535349564F075041535349564F075041535349564F
      00000000000000000000000000000000EC51B854CCBEB4C1EC51B854CCBEB4C1
      012001430143EC51B854CCBEB441EC51B854CCBEB44100000000000000000000
      0000008040400D504C414E4F204272545052455600000000E06DE84012425241
      53494C2054454C45434F4D20532F410000000000000000004040001500000002
      323100000000000000400153014301321445584947CD56454C204F5045524143
      494F4E414C1445584947CD56454C204F5045524143494F4E414C1445584947CD
      56454C204F5045524143494F4E414C000000000000000000000000000000003D
      0AD77B93618E413D0AD77B93618E410120014401443D0AD77B93618E413D0AD7
      7B93618E41000000000000000000000000008040400D504C414E4F2042725450
      52455600000000E06DE8401242524153494C2054454C45434F4D20532F410000
      00000000000000404000150000000132000000000000F03F0153014301320750
      41535349564F075041535349564F075041535349564F00000000000000000000
      0000000000007B14AE3F792265417B14AE3F792265410120014401447B14AE3F
      792265417B14AE3F79226541000000000000000000000000000010400D504C41
      4E4F204252545052455600000000E06DE8401242524153494C2054454C45434F
      4D20532F41000000000000000000404000150000000232310000000000000040
      0153014301321445584947CD56454C204F5045524143494F4E414C1445584947
      CD56454C204F5045524143494F4E414C1445584947CD56454C204F5045524143
      494F4E414C00000000000000000000000000000000D7A3700550226641D7A370
      0550226641012001440144D7A3700550226641D7A37005502266410000000000
      00000000000000000010400D504C414E4F204252545052455600000000E06DE8
      401242524153494C2054454C45434F4D20532F41000000000000000000404000
      150000000132000000000000F03F015301430132075041535349564F07504153
      5349564F075041535349564F000000000000000000000000000000005C8FC265
      D6BC65C15C8FC265D6BC65C10120014301435C8FC265D6BC65415C8FC265D6BC
      6541000000000000000000000000000030401F504C414E4F2044452042454E45
      46CD43494F5320414C5445524E415449564F00000000E06DE840124252415349
      4C2054454C45434F4D20532F4100000000000000000040400015000000023231
      00000000000000400153014301321445584947CD56454C204F5045524143494F
      4E414C1445584947CD56454C204F5045524143494F4E414C1445584947CD5645
      4C204F5045524143494F4E414C00000000000000000000000000000000EC51B8
      5E93386141EC51B85E93386141012001440144EC51B85E93386141EC51B85E93
      386141000000000000000000000000000030401F504C414E4F2044452042454E
      4546CD43494F5320414C5445524E415449564F00000000E06DE8401242524153
      494C2054454C45434F4D20532F41000000000000000000404000150000000132
      000000000000F03F015301430132075041535349564F075041535349564F0750
      41535349564F000000000000000000000000000000003D0AD7BBF2DB60413D0A
      D7BBF2DB60410120014401443D0AD7BBF2DB60413D0AD7BBF2DB604100000000
      0000000000000000000008400B545245494E414D454E544F00000000E06DE840
      1242524153494C2054454C45434F4D20532F4100000000000000000040400015
      00000002323100000000000000400153014301321445584947CD56454C204F50
      45524143494F4E414C1445584947CD56454C204F5045524143494F4E414C1445
      584947CD56454C204F5045524143494F4E414C00000000000000000000000000
      0000003D0AD7BBF2DB60413D0AD7BBF2DB60410120014401443D0AD7BBF2DB60
      413D0AD7BBF2DB6041000000000000000000000000000008400B545245494E41
      4D454E544F00000000E06DE8401242524153494C2054454C45434F4D20532F41
      000000000000000000404000150000000132000000000000F03F015301430132
      075041535349564F075041535349564F075041535349564F0000000000000000
      000000000000000085EB51B8FEF7C0C085EB51B8FEF7C0C001200143014385EB
      51B8FEF7C04085EB51B8FEF7C0400000000000000000000000000000F03F104F
      50455241C7D5455320434F4D554E5300000000806DE8400B43454C554C415220
      4352540000000000000000004040001500000002323100000000000000400153
      014301321445584947CD56454C204F5045524143494F4E414C1445584947CD56
      454C204F5045524143494F4E414C1445584947CD56454C204F5045524143494F
      4E414C0000000000000000000000000000000085EB51B8FEF7C0C085EB51B8FE
      F7C0C001200143014385EB51B8FEF7C04085EB51B8FEF7C04000000000000000
      00000000000000F03F104F50455241C7D5455320434F4D554E5300000000806D
      E8400B43454C554C415220435254000000000000000000404000000000000132
      000000000000F03F015301430132075041535349564F075041535349564F0750
      41535349564F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D7A3703D8ADEC340D7A3703D8ADEC3400120
      01440144D7A3703D8ADEC340D7A3703D8ADEC340000000000000000000000000
      008040400D504C414E4F204272545052455600000000806DE8400B43454C554C
      4152204352540000000000000000004040000000000002323100000000000000
      400153014301321445584947CD56454C204F5045524143494F4E414C14455849
      47CD56454C204F5045524143494F4E414C1445584947CD56454C204F50455241
      43494F4E414C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D7A3703D8ADEC340D7A3703D8ADEC3400120
      01440144D7A3703D8ADEC340D7A3703D8ADEC340000000000000000000000000
      008040400D504C414E4F204272545052455600000000806DE8400B43454C554C
      415220435254000000000000000000404000150000000132000000000000F03F
      015301430132075041535349564F075041535349564F075041535349564F0000
      0000000000000000000000000000A4703D0AD52772C1A4703D0AD52772C10120
      01430143A4703D0AD5277241A4703D0AD5277241000000000000000000000000
      000030401F504C414E4F2044452042454E4546CD43494F5320414C5445524E41
      5449564F00000000806DE8400B43454C554C4152204352540000000000000000
      004040001500000002323100000000000000400153014301321445584947CD56
      454C204F5045524143494F4E414C1445584947CD56454C204F5045524143494F
      4E414C1445584947CD56454C204F5045524143494F4E414C0000000000000000
      0000000000000000EC51B81E2965F1C0EC51B81E2965F1C0012001430143EC51
      B81E2965F140EC51B81E2965F140000000000000000000000000000030401F50
      4C414E4F2044452042454E4546CD43494F5320414C5445524E415449564F0000
      0000806DE8400B43454C554C4152204352540000000000000000004040001500
      00000132000000000000F03F015301430132075041535349564F075041535349
      564F075041535349564F00000000000000000000000000000000AE47E17AF4B1
      E140AE47E17AF4B1E140012001440144AE47E17AF4B1E140AE47E17AF4B1E140
      000000000000000000000000000008400B545245494E414D454E544F00000000
      806DE8400B43454C554C41522043525400000000000000000040400015000000
      02323100000000000000400153014301321445584947CD56454C204F50455241
      43494F4E414C1445584947CD56454C204F5045524143494F4E414C1445584947
      CD56454C204F5045524143494F4E414C00000000000000000000000000000000
      AE47E17AF4B1E140AE47E17AF4B1E140012001440144AE47E17AF4B1E140AE47
      E17AF4B1E140000000000000000000000000000008400B545245494E414D454E
      544F00000000806DE8400B43454C554C41522043525400000000000000000040
      4000150000000132000000000000F03F015301430132075041535349564F0750
      41535349564F075041535349564F0000000000000000000000000000000048E1
      7A85FA6293C148E17A85FA6293C101200143014348E17A85FA62934148E17A85
      FA629341000000000000000000000000008040400D504C414E4F204272545052
      4556000000000000F03F1046554E444143414F20425254505245560000000000
      0000000040400015000000023231000000000000004001530143013214455849
      47CD56454C204F5045524143494F4E414C1445584947CD56454C204F50455241
      43494F4E414C1445584947CD56454C204F5045524143494F4E414C0000000000
      000000000000000000000048E17A85FA6293C148E17A85FA6293C10120014301
      4348E17A85FA62934148E17A85FA629341000000000000000000000000008040
      400D504C414E4F2042725450524556000000000000F03F1046554E444143414F
      2042525450524556000000000000000000404000150000000132000000000000
      F03F015301430132075041535349564F075041535349564F075041535349564F
      00000000000000000000000000000000B81E85EBD1FEC6C0B81E85EBD1FEC6C0
      012001430143B81E85EBD1FEC640B81E85EBD1FEC64000000000000000000000
      0000000010400D504C414E4F2042525450524556000000000000F03F1046554E
      444143414F204252545052455600000000000000000040400015000000023231
      00000000000000400153014301321445584947CD56454C204F5045524143494F
      4E414C1445584947CD56454C204F5045524143494F4E414C1445584947CD5645
      4C204F5045524143494F4E414C00000000000000000000000000000000B81E85
      EBD1FEC6C0B81E85EBD1FEC6C0012001430143B81E85EBD1FEC640B81E85EBD1
      FEC640000000000000000000000000000010400D504C414E4F20425254505245
      56000000000000F03F1046554E444143414F2042525450524556000000000000
      000000404000150000000132000000000000F03F015301430132075041535349
      564F075041535349564F075041535349564F0000000000000000000000000000
      0000CDCCCCCCB2FA07C1CDCCCCCCB2FA07C1012001430143CDCCCCCCB2FA0741
      CDCCCCCCB2FA0741000000000000000000000000000030401F504C414E4F2044
      452042454E4546CD43494F5320414C5445524E415449564F000000000000F03F
      1046554E444143414F2042525450524556000000000000000000404000150000
      0002323100000000000000400153014301321445584947CD56454C204F504552
      4143494F4E414C1445584947CD56454C204F5045524143494F4E414C14455849
      47CD56454C204F5045524143494F4E414C000000000000000000000000000000
      00CDCCCCCCB2FA07C1CDCCCCCCB2FA07C1012001430143CDCCCCCCB2FA0741CD
      CCCCCCB2FA0741000000000000000000000000000030401F504C414E4F204445
      2042454E4546CD43494F5320414C5445524E415449564F000000000000F03F10
      46554E444143414F204252545052455600000000000000000040400015000000
      0132000000000000F03F015301430132075041535349564F075041535349564F
      075041535349564F00000000000000000000000000000000295C8F16678171C1
      295C8F16678171C1012001430143295C8F1667817141295C8F16678171410000
      00000000000000000000000008400B545245494E414D454E544F000000000000
      F03F1046554E444143414F204252545052455600000000000000000040400015
      00000002323100000000000000400153014301321445584947CD56454C204F50
      45524143494F4E414C1445584947CD56454C204F5045524143494F4E414C1445
      584947CD56454C204F5045524143494F4E414C00000000000000000000000000
      000000295C8F16678171C1295C8F16678171C1012001430143295C8F16678171
      41295C8F1667817141000000000000000000000000000008400B545245494E41
      4D454E544F000000000000F03F1046554E444143414F20425254505245560000
      000000000000}
  end
  object cdsDetalheSubcontas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 144
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT                         '
      
        '   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUR' +
        'EZA, '
      '   SUBSTR(C.PLACONTA, 1, 1) AS GRAU,     '
      
        '   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLAN' +
        'OMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLAN' +
        'OME,           '
      
        '   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS NOMEINDENTADO' +
        ', '
      '   NVL(S.DEB,0) as DEB,                    '
      '   NVL(S.CRED,0) as CRED,                  '
      '   S.DEBA,                                 '
      '   S.CREDA,                                '
      '   S.MOV,                                  '
      
        '   NVL(SA.SALDOANT,0) as SALDOANT, NVL(SS.SALDO,0) AS SALDO,    ' +
        '                                    '
      
        '   DECODE(NVL(S.MOV,0), 0, '#39' '#39', DECODE(SIGN(S.MOV),             ' +
        '      '
      '   -1, '#39'C'#39', '#39'D'#39' )) AS MOVDC,                                 '
      
        '   DECODE(NVL(SS.SALDO,0), 0, '#39' '#39', DECODE(SIGN(SS.SALDO),       ' +
        '      '
      '   -1, '#39'C'#39', '#39'D'#39' )) AS DEBCRESALDO,                           '
      
        '   DECODE(NVL(SA.SALDOANT,0), 0, '#39' '#39', DECODE(SIGN(SA.SALDOANT), ' +
        '      '
      '   -1, '#39'C'#39', '#39'D'#39' )) AS DEBCREANT,                             '
      
        '   ABS(NVL(SA.SALDOANT,0)) as SALDOANTABS, ABS(NVL(SS.SALDO,0)) ' +
        'as SALDOABS,   '
      
        '   ABS(NVL(S.MOV,0)) AS MOVABS                                  ' +
        '     '
      
        '   ,S.IDPLANOPREV, PPC.NOME AS PLANOPREV, S.IDPATRO, P.NOME AS P' +
        'ATRO ,'
      '   0 as codspc'
      
        'FROM                                                            ' +
        ' '
      
        '    PLANOCONTA C,                                               ' +
        ' '
      ' PESSOA P, PLANPREVCONTABIL PPC, '
      
        '(SELECT P.PLANOME, P.PLACONTA, P.PLANO, P.PLATIPO, P.PLAINATIVA ' +
        '  FROM  PLANOCONTAPER P,             (SELECT PLACONTA, PLANO, MI' +
        'N(TO_CHAR(PEREXERCICIO)||DECODE(LENGTH(NVL(PERNUMERO,0)),1,'#39'0'#39'||' +
        'TO_CHAR(NVL(PERNUMERO,0)),TO_CHAR(NVL(PERNUMERO,0)))) AS PERNUME' +
        'RO              FROM PLANOCONTAPER              WHERE (TO_CHAR(P' +
        'EREXERCICIO)||DECODE(LENGTH(NVL(PERNUMERO,0)),1,'#39'0'#39'||TO_CHAR(NVL' +
        '(PERNUMERO,0)),TO_CHAR(NVL(PERNUMERO,0))) >= '#39'200401'#39')          ' +
        '      AND (IDPESSOA = 1)              GROUP BY  PLACONTA, PLANO)' +
        ' PX   WHERE (P.PLACONTA = PX.PLACONTA)     AND (P.PLANO = PX.PLA' +
        'NO)           AND (P.IDPESSOA = 1)     AND (TO_CHAR(P.PEREXERCIC' +
        'IO)||DECODE(LENGTH(NVL(P.PERNUMERO,0)),1,'#39'0'#39'||TO_CHAR(NVL(P.PERN' +
        'UMERO,0)),TO_CHAR(NVL(P.PERNUMERO,0))) = PX.PERNUMERO))  PD, '
      ' (SELECT  PATRO.PLACONTA, SUM(PLNSALDO.SALDOANT) AS SALDOANT '
      '    , PATRO.IDPATRO, PATRO.IDPLANOPREV '
      'FROM  '
      
        '         (SELECT PS.PLACONTA, SUM(DECODE(PS.PLSDEBITOCORRENTE, N' +
        'ULL, 0, PS.PLSDEBITOCORRENTE) - DECODE(PS.PLSCREDITOCOR, NULL, 0' +
        ', PS.PLSCREDITOCOR)) AS SALDOANT '
      '               , PS.IDPLANOPREV, PS.IDPATRO '
      '           FROM PLANOSALDO PS '
      '           WHERE (PS.PEREXERCICIO = 2004) AND '
      
        '                 ((PS.PERNUMERO < 1) OR (PS.PERNUMERO IS NULL)) ' +
        'AND '
      '                 (PS.IDPESSOA = 1) AND '
      '                 (PS.PLANO = 2) AND '
      '                 (PS.PLACONTA >= '#39'2                 '#39') AND '
      '                 (PS.PLACONTA <= '#39'21                '#39') '
      '            GROUP BY PS.PLACONTA '
      '                 , PS.IDPLANOPREV, PS.IDPATRO '
      '          )PLNSALDO '
      '      ,  ( SELECT PC.PLACONTA, PP.IDPLANOPREV, PP.IDPATRO '
      '           FROM PLANPREVCONTABPATRO PP, PLANOCONTA PC '
      
        '           WHERE PP.IDPATRO IS NOT NULL AND PP.IDPLANOPREV IS NO' +
        'T NULL AND '
      '                 (PC.PLANO = 2) AND '
      '                 (PC.PLACONTA >= '#39'2                 '#39') AND '
      '                 (PC.PLACONTA <= '#39'21                '#39') '
      '        GROUP BY PC.PLACONTA, PP.IDPATRO, PP.IDPLANOPREV '
      '          ) PATRO '
      ' WHERE  1=1 '
      ' AND PATRO.PLACONTA = PLNSALDO.PLACONTA(+) '
      ' AND PATRO.IDPATRO = PLNSALDO.IDPATRO(+) '
      ' AND  PATRO.IDPLANOPREV = PLNSALDO.IDPLANOPREV(+) '
      ' GROUP BY PATRO.PLACONTA '
      ' , PATRO.IDPLANOPREV, PATRO.IDPATRO '
      ') SA, '
      
        '                                                                ' +
        ' '
      
        ' (SELECT PPP.*, SALDO.DEB, SALDO.CRED, SALDO.DEBA, SALDO.CREDA, ' +
        'SALDO.MOV '
      
        '  FROM  (SELECT PPC.IDPLANOPREV, PT.IDPESSOA AS IDPATRO, PL.PLAN' +
        'O, PL.PLACONTA '
      '        FROM PLANPREVCONTABIL PPC, PATRO PT, PLANOCONTA PL '
      '        WHERE (PL.PLANO =2)   '
      
        '        GROUP BY PPC.IDPLANOPREV, PT.IDPESSOA, PL.PLANO, PL.PLAC' +
        'ONTA) PPP, '
      '       (SELECT P.IDPLANOPREV, P.IDPATRO, P.PLANO, P.PLACONTA, '
      '               SUM(P.PLSDEBITOCORRENTE) AS DEB, '
      '               SUM(P.PLSCREDITOCOR) AS CRED, '
      
        '               SUM(DECODE(P.PLSTIPO, '#39'A'#39', P.PLSDEBITOCORRENTE, 0' +
        ')) AS DEBA, '
      
        '               SUM(DECODE(P.PLSTIPO, '#39'A'#39', P.PLSCREDITOCOR, 0)) A' +
        'S CREDA, '
      
        '               (SUM(P.PLSDEBITOCORRENTE) - SUM(P.PLSCREDITOCOR))' +
        ' AS MOV '
      '        FROM PLANOSALDO P '
      '        WHERE (P.PEREXERCICIO =2004) AND       '
      '        (P.PERNUMERO BETWEEN 1 AND 1) AND  '
      '        (P.IDPESSOA =1) AND '
      '        (P.PLANO =2) AND   '
      '        (P.PLACONTA >= '#39'2                 '#39') AND              '
      '        (P.PLACONTA <= '#39'21                '#39')                  '
      
        '        GROUP BY P.IDPLANOPREV, P.IDPATRO, P.PLANO, P.PLACONTA )' +
        ' SALDO '
      ' WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND '
      '       PPP.IDPATRO     = SALDO.IDPATRO(+) AND     '
      '       PPP.PLANO       = SALDO.PLANO(+) AND       '
      '       PPP.PLACONTA    = SALDO.PLACONTA(+) ) S,   '
      
        '                                                                ' +
        ' '
      '   (SELECT                                                 '
      
        '       PPC.PLACONTA, SUM(DECODE(PS.PLSDEBITOCORRENTE, NULL, 0, P' +
        'S.PLSDEBITOCORRENTE) '
      
        '                   - DECODE(PS.PLSCREDITOCOR, NULL, 0, PS.PLSCRE' +
        'DITOCOR)) AS SALDO'
      ', PPC.IDPLANOPREV, PPC.IDPATRO '
      '    FROM PLANOSALDO PS'
      ',(SELECT P.IDPLANOPREV, '
      '         PL.PLACONTA, '
      '         PT.IDPESSOA AS IDPATRO '
      
        '   FROM PLANPREVCONTABIL P, PATRO PT, PLANOCONTA PL WHERE  PL.PL' +
        'ANO = 2) PPC '
      '    WHERE  '
      '          (PS.PEREXERCICIO =2004) AND      '
      '          ((PS.PERNUMERO <=1) OR (PS.PERNUMERO IS NULL)) AND '
      '  (PPC.IDPLANOPREV = PS.IDPLANOPREV(+)) AND '
      '  (PPC.IDPATRO = PS.IDPATRO(+)) AND '
      '  (PPC.PLACONTA = PS.PLACONTA(+)) AND '
      '          (PS.IDPESSOA =1) AND '
      '          (PS.PLANO =2) AND   '
      
        '          (PS.PLACONTA >= '#39'2                 '#39') AND             ' +
        ' '
      
        '          (PS.PLACONTA <= '#39'21                '#39')                 ' +
        ' '
      '    GROUP BY PPC.PLACONTA '
      ' , PPC.IDPLANOPREV, PPC.IDPATRO '
      ' ) SS '
      '                                      '
      'WHERE                                 '
      '    (S.PLACONTA(+) = C.PLACONTA) AND  '
      '    (SA.PLACONTA(+) = C.PLACONTA) AND '
      '    (SS.PLACONTA(+) = C.PLACONTA) AND '
      '    (PD.PLACONTA(+) = C.PLACONTA) AND '
      '    (PD.PLANO(+) = C.PLANO) AND       '
      '    (S.IDPLANOPREV = SA.IDPLANOPREV)AND   '
      '    (SS.IDPLANOPREV = S.IDPLANOPREV) AND  '
      '    (S.IDPATRO = SA.IDPATRO) AND          '
      '    (SS.IDPATRO = S.IDPATRO) AND          '
      '    (C.PLAGRAU <= 8) AND                          '
      '    (C.PLANO =2) AND                             '
      '    (C.PLACONTA >= '#39'2                 '#39') AND '
      '    (C.PLACONTA <= '#39'21                '#39') '
      
        ' AND P.IDPESSOA = S.IDPATRO AND PPC.IDPLANOPREV = S.IDPLANOPREV ' +
        'AND '
      ' SS.IDPATRO = S.IDPATRO AND SS.IDPLANOPREV = S.IDPLANOPREV '
      
        'GROUP BY                                                        ' +
        ' '
      
        '    C.PLACONTA, SA.SALDOANT, SS.SALDO,                          ' +
        ' '
      
        '    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                        ' +
        ' '
      
        '    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOM' +
        'E), C.PLACONCORRESP, '
      
        '    S.DEB,                                                      ' +
        ' '
      
        '    S.CRED,                                                     ' +
        ' '
      
        '    S.DEBA,                                                     ' +
        ' '
      
        '    S.CREDA,                                                    ' +
        ' '
      
        '    S.MOV                                                       ' +
        ' '
      ', S.IDPLANOPREV, PPC.NOME, S.IDPATRO, P.NOME '
      
        'HAVING ((DECODE(NVL(S.DEB,0),0,                                 ' +
        ' '
      
        '       (DECODE(NVL(S.CRED,0),0,                                 ' +
        ' '
      
        '       (DECODE(NVL(SS.SALDO,0),0,                               ' +
        ' '
      
        '       (DECODE(NVL(SA.SALDOANT,0),0,'#39'0'#39','#39'1'#39')),'#39'1'#39')),'#39'1'#39')),'#39'1'#39')) ' +
        '= '#39'1'#39') '
      ' ORDER BY PATRO, PLANOPREV,  C.PLACONTA')
    ClientDataSet = cdsBalancete
    Left = 276
    Top = 288
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   sub.PLACONTA,'
      '   nvl(sub.codsubconta, 0) as codsubconta,'
      
        '  '#39'                                                             ' +
        '                             '#39' as nomesubconta,'
      '   sub.PLAGRAU,'
      '   sub.PLATIPO,'
      '   SUBSTR(sub.PLACONTA, 1, 1) AS GRAU,'
      '   sub.PLACONCORRESP,'
      '   sub.PLANATUREZA,'
      '   sub.PLANOME as conta,'
      '   sub.idpatro,'
      '   sub.patro,'
      '   sub.idplanoprev,'
      '   sub.nome as planoprev,'
      '   sub.codspc,'
      '   sub.PLANOME AS NOMEINDENTADO,'
      '   nvl(SUM(dcm.deb), 0) AS DEB,'
      '   nvl(SUM(dcm.cred), 0) AS CRED,'
      '   nvl(SUM(dcm.mov), 0) AS MOV,'
      '   nvl(SA.SALDOANT, 0) as saldoant,'
      '   nvl(SS.SALDO, 0) as saldo,'
      '   nvl(sum(dcm.DEBA), 0) as deba,'
      '   nvl(sum(dcm.CREDA), 0) as creda,'
      
        '   DECODE(NVL(sum(dcm.MOV),0), 0, '#39' '#39', DECODE(SIGN(sum(dcm.MOV))' +
        ', -1, '#39'C'#39', '#39'D'#39' )) AS MOVDC,'
      
        '   DECODE(NVL(SS.SALDO,0), 0, '#39' '#39', DECODE(SIGN(SS.SALDO), -1, '#39'C' +
        #39', '#39'D'#39' )) AS DEBCRESALDO,'
      
        '   DECODE(NVL(SA.SALDOANT,0), 0, '#39' '#39', DECODE(SIGN(SA.SALDOANT), ' +
        '-1, '#39'C'#39', '#39'D'#39' )) AS DEBCREANT,'
      '   NVL(SA.SALDOANT,0) as SALDOANTABS,'
      '   NVL(SS.SALDO,0) as SALDOABS,'
      '   NVL(sum(dcm.MOV),0) AS MOVABS'
      'FROM'
      ' (                                '
      
        '   select c.plano, c.plagrau, c.PLANATUREZA, c.PLATIPO, c.PLACON' +
        'CORRESP,'
      
        '   c.placonta, nvl(sub.codsubconta, 0) as codsubconta, c.planome' +
        ','
      
        '   pp.idplanoprev, pp.idpatro, pp.patro, pp.codspc, pp.nome, PS.' +
        'PEREXERCICIO, PS.PERNUMERO'
      '   from planoconta c, subconta sub, planosaldo PS,'
      '   ('
      '     select'
      '       patro.idpessoa as idpatro,'
      '       p.nome as patro,'
      '       pc.idplanoprev,'
      '       pc.nome,'
      
        '       decode(nvl(pc.idplanoprevprev, 0), 0, pc.codspc, pp.codig' +
        'ospc) as codspc'
      '     from planprevcontabil pc, planprev pp, patro, pessoa p'
      
        '     where pc.idplanoprevprev = pp.idplanoprev and patro.idpesso' +
        'a = p.idpessoa'
      '     union'
      '     select'
      '       patro.idpessoa as idpatro,'
      '       p.nome as patro,'
      '       pp.idplanoprev,'
      '       pp.nome,'
      '       pp.codspc'
      '     from planprevcontabil pp, patro, pessoa p'
      
        '     where idplanoprevprev is null and patro.idpessoa = p.idpess' +
        'oa'
      '   ) pp'
      '   WHERE c.PLANO = PS.PLANO(+) AND'
      '         c.PLACONTA = PS.PLACONTA(+) AND'
      '         sub.CODSUBCONTA(+) = ps.CODSUBCONTA AND'
      '         PP.IDPLANOPREV = PS.IDPLANOPREV AND'
      '         PP.IDPATRO = PS.IDPATRO'
      
        '   group by  c.placonta, c.plagrau, c.PLANATUREZA, c.PLATIPO, c.' +
        'PLACONCORRESP, sub.codsubconta,'
      
        '             c.plano, c.planome, pp.idpatro, pp.patro, pp.idplan' +
        'oprev,'
      '             pp.codspc, pp.nome, PS.PEREXERCICIO, PS.PERNUMERO'
      ' )sub,'
      ''
      '('
      '  select'
      
        '     s.plano, s.PLACONTA, nvl(s.codsubconta, 0) as codsubconta, ' +
        's.pernumero, s.perexercicio,'
      '     nvl(SUM(S.PLSDEBITOCORRENTE), 0) AS DEB,'
      '     nvl(SUM(S.PLSCREDITOCOR), 0) AS CRED,'
      
        '     nvl((SUM(S.PLSDEBITOCORRENTE) - SUM(S.PLSCREDITOCOR)), 0) A' +
        'S MOV,'
      
        '     SUM(DECODE(s.PLSTIPO, '#39'A'#39', s.PLSDEBITOCORRENTE, 0)) AS DEBA' +
        ','
      '     SUM(DECODE(s.PLSTIPO, '#39'A'#39', s.PLSCREDITOCOR, 0)) AS CREDA,'
      '     s.idpatro,'
      '     s.idplanoprev'
      '  from planosaldo s'
      '  where'
      '    (s.PLANO = 2) AND'
      '    (S.PEREXERCICIO(+) =2004) AND'
      '    (S.PERNUMERO(+) =1) AND'
      '    (S.IDPESSOA(+) =1) AND'
      '    (s.PLACONTA >= '#39'2                 '#39') AND'
      '    (s.PLACONTA <= '#39'21               '#39')'
      
        '  group by s.plano, s.PLACONTA, nvl(s.codsubconta, 0), s.pernume' +
        'ro, s.perexercicio, s.idpatro, s.idplanoprev'
      ')dcm,'
      ''
      ' (SELECT'
      '       PLACONTA,'
      '       plano,'
      '       nvl(codsubconta, 0) as codsubconta,'
      '       perexercicio,'
      '       pernumero,'
      '       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)'
      
        '                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCO' +
        'R)) AS SALDOANT,'
      '       idpatro,'
      '       idplanoprev'
      '    FROM PLANOSALDO'
      '    WHERE (PLANO = 2) AND'
      '          (PEREXERCICIO = 2004) AND'
      '          ((PERNUMERO <1) OR (PERNUMERO IS NULL)) AND'
      '          (PLACONTA >= '#39'2                 '#39') AND'
      '          (PLACONTA <= '#39'21               '#39')'
      
        '    GROUP BY PLACONTA , codsubconta, plano, perexercicio, pernum' +
        'ero, idpatro, idplanoprev'
      '    ) SA,'
      ''
      '   (SELECT'
      '       PLACONTA,'
      '       plano,'
      '       nvl(codsubconta, 0) as codsubconta,'
      '       perexercicio,'
      '       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)'
      
        '                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCO' +
        'R)) AS SALDO,'
      '       idpatro,'
      '       idplanoprev  '
      '    FROM PLANOSALDO'
      '    WHERE (PLANO = 2) AND                                     '
      '          (PEREXERCICIO = 2004) AND'
      '          ((PERNUMERO <=1) OR (PERNUMERO IS NULL)) AND'
      '          (PLACONTA >= '#39'2                 '#39') AND'
      '          (PLACONTA <= '#39'21               '#39')'
      '    GROUP BY PLACONTA, codsubconta, plano, perexercicio,'
      '       idpatro,'
      '       idplanoprev'
      '   ) SS'
      ''
      'WHERE'
      '    (SA.PLANO(+) = sub.PLANO) AND'
      '    (SA.PLACONTA(+) = sub.PLACONTA) AND'
      '    (sa.codsubconta(+)  = sub.codsubconta)  and'
      '    (sa.perexercicio(+) = sub.perexercicio) and'
      '    (sa.idpatro(+) = sub.idpatro) and'
      '    (sa.idplanoprev(+) = sub.idplanoprev) and'
      ''
      '    (ss.plano(+)  = sub.plano)  and'
      '    (SS.PLACONTA(+) = sub.PLACONTA) AND'
      '    (ss.codsubconta(+)  = sub.codsubconta)  and'
      '    (ss.perexercicio(+) = sub.perexercicio) and'
      '    (ss.idpatro(+) = sub.idpatro) and'
      '    (ss.idplanoprev(+) = sub.idplanoprev) and'
      ''
      '    (dcm.PLANO(+) = sub.plano) AND'
      '    (dcm.PEREXERCICIO(+) = sub.PEREXERCICIO) AND'
      '    (dcm.PERNUMERO(+) = sub.PERNUMERO) AND'
      '    (dcm.PLACONTA(+) >= sub.placonta) AND'
      '    (dcm.PLACONTA(+) <= sub.placonta) and'
      '    (dcm.idpatro(+) = sub.idpatro) and'
      '    (dcm.idplanoprev(+) = sub.idplanoprev) and'
      ''
      '    (Sub.PEREXERCICIO(+) = 2004) AND'
      '    (sub.PLACONTA >= '#39'2                 '#39') AND'
      '    (sub.PLACONTA <= '#39'21               '#39')'
      ''
      'GROUP BY'
      
        '    sub.PLACONTA, sub.codsubconta, sub.plagrau, sub.platipo, sub' +
        '.PLACONCORRESP, sub.PLANATUREZA, SA.SALDOANT, SS.SALDO,'
      
        '    sub.PLANOME, sub.idpatro, sub.patro, sub.idplanoprev, sub.co' +
        'dspc, sub.nome'
      
        'ORDER BY sub.idpatro, sub.idplanoprev, sub.PLACONTA , sub.codsub' +
        'conta'
      ' ')
    ClientDataSet = cdsDetalheSubcontas
    Left = 436
    Top = 304
  end
end
