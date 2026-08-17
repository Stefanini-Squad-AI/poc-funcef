inherited rptBalanceteCxCC: TrptBalanceteCxCC
  Left = 372
  Top = 250
  Width = 351
  Height = 260
  Caption = 'Balancete de Contas x Centros de Custo'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Balancete de Contas x Centros de Custo'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Exercício'
        Controle = tcLookupCombo
        TipodeDado = tdReal
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
        Caption = 'Colunas de Valores'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Movimentação  '
          'Débito e Crédito                 '
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
        MostraComboCompara = False
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
        Caption = 'Quebra por Grupo'
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
        Name = 'Quebra por Grupo'
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
        Caption = 'Conta contábil e Centro de Custo com máscara'
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
        Name = 'Conta contábil e Centro de Custo com máscara'
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
        Caption = 'Imprimir SOMENTE Contas contra sua natureza'
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
        Name = 'Imprimir SOMENTE Contas contra sua natureza'
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
        Caption = 'Imprime Saldos dos Cent.Custo somente nas Contas Analíticas'
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
        Name = 'Imprime Saldos dos Cent.Custo somente nas Contas Analíticas'
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
        Caption = 'Pagina Inicial'
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
        TextDefault = '1'
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Pagina Inicial'
        SpinEditSettings.MaxValue = 99999
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
        Width = 60
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
        Caption = 'Desconsiderar o Encerramento de Resultado'
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
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    OnParamControlExit = CmpRptCMParamControlExit
    OnParamControlEnter = CmpRptCMParamControlEnter
    Formheight = 540
    FormWidth = 450
    Left = 176
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptBalCxCC
    LabelEmpresa = LblEmpresa
    LabelSistema = lblSistema
  end
  object dsBalCxCC: TwwDataSource
    DataSet = cdsBalCxCC
    Left = 80
    Top = 72
  end
  object pplBalCxCC: TppBDEPipeline
    DataSource = dsBalCxCC
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lBalCxCC'
    Left = 141
    Top = 72
    object pplBalCxCCppField1: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 0
    end
    object pplBalCxCCppField2: TppField
      FieldAlias = 'CODEXTERNO'
      FieldName = 'CODEXTERNO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object pplBalCxCCppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLAGRAU'
      FieldName = 'PLAGRAU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplBalCxCCppField4: TppField
      FieldAlias = 'PLATIPO'
      FieldName = 'PLATIPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object pplBalCxCCppField5: TppField
      FieldAlias = 'PLACONCORRESP'
      FieldName = 'PLACONCORRESP'
      FieldLength = 18
      DisplayWidth = 18
      Position = 4
    end
    object pplBalCxCCppField6: TppField
      FieldAlias = 'PLANATUREZA'
      FieldName = 'PLANATUREZA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object pplBalCxCCppField7: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object pplBalCxCCppField8: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object pplBalCxCCppField9: TppField
      FieldAlias = 'NOMEINDENTADO'
      FieldName = 'NOMEINDENTADO'
      FieldLength = 150
      DisplayWidth = 150
      Position = 8
    end
    object pplBalCxCCppField10: TppField
      FieldAlias = 'DEBCREANT'
      FieldName = 'DEBCREANT'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object pplBalCxCCppField11: TppField
      FieldAlias = 'DEBCRESALDO'
      FieldName = 'DEBCRESALDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 10
    end
    object pplBalCxCCppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOABS'
      FieldName = 'SALDOABS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplBalCxCCppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANTABS'
      FieldName = 'SALDOANTABS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplBalCxCCppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOVABS'
      FieldName = 'MOVABS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplBalCxCCppField15: TppField
      FieldAlias = 'MOVDC'
      FieldName = 'MOVDC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 14
    end
    object pplBalCxCCppField16: TppField
      FieldAlias = 'GRAU'
      FieldName = 'GRAU'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object pplBalCxCCppField17: TppField
      FieldAlias = 'CONTA'
      FieldName = 'CONTA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 16
    end
    object pplBalCxCCppField18: TppField
      FieldAlias = 'PLANOMEOUTLING'
      FieldName = 'PLANOMEOUTLING'
      FieldLength = 40
      DisplayWidth = 40
      Position = 17
    end
    object pplBalCxCCppField19: TppField
      FieldAlias = 'PLANOME'
      FieldName = 'PLANOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 18
    end
    object pplBalCxCCppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEB'
      FieldName = 'DEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplBalCxCCppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'CRED'
      FieldName = 'CRED'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplBalCxCCppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV'
      FieldName = 'MOV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplBalCxCCppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANT'
      FieldName = 'SALDOANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplBalCxCCppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
  end
  object rptBalCxCC: TppReport
    AutoStop = False
    DataPipeline = pplBalCxCC
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14350
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
    Left = 205
    Top = 72
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplBalCxCC'
    object ppHeaderBand2: TppHeaderBand
      BeforePrint = ppHeaderBand2BeforePrint
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object ppLblTituloBalCxCC: TppLabel
        UserName = 'ppLblTituloBalCxCC'
        Caption = 'Balancete Contas x Centros de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 106363
        mmTop = 8731
        mmWidth = 75671
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'ppLine5'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19315
        mmWidth = 284300
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
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
      object ppLine6: TppLine
        UserName = 'ppLine6'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27252
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'ppLabel11'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 39423
        mmTop = 22225
        mmWidth = 8467
        BandType = 0
      end
      object ppLblTituloBalCxCC2: TppLabel
        UserName = 'ppLblTituloBalCxCC2'
        Caption = 'ppLblTitulo2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 14552
        mmWidth = 15081
        BandType = 0
      end
      object rptBalCxCCLabel2: TppLabel
        UserName = 'rptBalCxCCLabel2'
        Caption = 'Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5292
        mmTop = 22225
        mmWidth = 8467
        BandType = 0
      end
      object rptBalCxCCLabel1: TppLabel
        UserName = 'rptBalCxCCLabel1'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 257176
        mmTop = 22225
        mmWidth = 16140
        BandType = 0
      end
      object txtMovBalCxCC: TppLabel
        UserName = 'txtMovBalCxCC'
        Caption = 'Movimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 228336
        mmTop = 22225
        mmWidth = 16404
        BandType = 0
      end
      object txtCredBalCxCC: TppLabel
        UserName = 'txtCredBalCxCC'
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 206640
        mmTop = 22225
        mmWidth = 10848
        BandType = 0
      end
      object txtDebBalCxCC: TppLabel
        UserName = 'txtDebBalCxCC'
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 180446
        mmTop = 22225
        mmWidth = 9260
        BandType = 0
      end
      object txtSaldoAntBalCxCC: TppLabel
        UserName = 'txtSaldoAntBalCxCC'
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 140759
        mmTop = 22225
        mmWidth = 20902
        BandType = 0
      end
    end
    object bndDetBalCxCC: TppDetailBand
      BeforePrint = bndDetBalCxCCBeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object dbtxtContaBalCxCC: TppDBText
        UserName = 'dbtxtContaBalCxCC'
        DataField = 'PLACONTA'
        DataPipeline = pplBalCxCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'pplBalCxCC'
        mmHeight = 3704
        mmLeft = 4498
        mmTop = 794
        mmWidth = 29633
        BandType = 4
      end
      object rptBalCxCCDBText2: TppDBText
        UserName = 'rptBalCxCCDBText2'
        DataField = 'GRAU'
        DataPipeline = pplBalCxCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'pplBalCxCC'
        mmHeight = 3704
        mmLeft = 11113
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object dbtxtNomeContaBalCxCC: TppDBText
        UserName = 'dbtxtNomeContaBalCxCC'
        DataField = 'NOMEINDENTADO'
        DataPipeline = pplBalCxCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'pplBalCxCC'
        mmHeight = 3704
        mmLeft = 39423
        mmTop = 794
        mmWidth = 93927
        BandType = 4
      end
      object rptBalCxCCDBText5: TppDBText
        UserName = 'rptBalCxCCDBText5'
        DataField = 'NOME'
        DataPipeline = pplBalCxCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplBalCxCC'
        mmHeight = 3704
        mmLeft = 52388
        mmTop = 794
        mmWidth = 45508
        BandType = 4
      end
      object dbtxtSaldoAntBalCxCC: TppDBText
        UserName = 'dbtxtSaldoAntBalCxCC'
        DataField = 'SALDOANTABS'
        DataPipeline = pplBalCxCC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalCxCC'
        mmHeight = 3704
        mmLeft = 135202
        mmTop = 794
        mmWidth = 26458
        BandType = 4
      end
      object dbtxtSaldoAntDCBalCxCC: TppDBText
        UserName = 'dbtxtSaldoAntDCBalCxCC'
        DataField = 'DEBCREANT'
        DataPipeline = pplBalCxCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplBalCxCC'
        mmHeight = 3704
        mmLeft = 162454
        mmTop = 794
        mmWidth = 3440
        BandType = 4
      end
      object dbtxtDebBalCxCC: TppDBText
        UserName = 'dbtxtDebBalCxCC'
        DataField = 'DEB'
        DataPipeline = pplBalCxCC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalCxCC'
        mmHeight = 3704
        mmLeft = 168011
        mmTop = 794
        mmWidth = 26194
        BandType = 4
      end
      object dbtxtCredBalCxCC: TppDBText
        UserName = 'dbtxtCredBalCxCC'
        DataField = 'CRED'
        DataPipeline = pplBalCxCC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalCxCC'
        mmHeight = 3704
        mmLeft = 195263
        mmTop = 794
        mmWidth = 26194
        BandType = 4
      end
      object dbtxtMovBalCxCC: TppDBText
        UserName = 'dbtxtMovBalCxCC'
        DataField = 'MOVABS'
        DataPipeline = pplBalCxCC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalCxCC'
        mmHeight = 3704
        mmLeft = 222780
        mmTop = 794
        mmWidth = 23813
        BandType = 4
      end
      object dbtxtMovDCBalCxCC: TppDBText
        UserName = 'dbtxtMovDCBalCxCC'
        DataField = 'MOVDC'
        DataPipeline = pplBalCxCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplBalCxCC'
        mmHeight = 3704
        mmLeft = 247121
        mmTop = 794
        mmWidth = 3440
        BandType = 4
      end
      object rptBalCxCCDBText9: TppDBText
        UserName = 'rptBalCxCCDBText9'
        DataField = 'SALDOABS'
        DataPipeline = pplBalCxCC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalCxCC'
        mmHeight = 3704
        mmLeft = 251090
        mmTop = 794
        mmWidth = 23019
        BandType = 4
      end
      object rptBalCxCCDBText10: TppDBText
        UserName = 'rptBalCxCCDBText10'
        DataField = 'DEBCRESALDO'
        DataPipeline = pplBalCxCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplBalCxCC'
        mmHeight = 3704
        mmLeft = 274638
        mmTop = 794
        mmWidth = 3440
        BandType = 4
      end
      object dbtxtCCustBalCxCC: TppDBText
        UserName = 'dbtxtCCustBalCxCC'
        DataField = 'CODEXTERNO'
        DataPipeline = pplBalCxCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplBalCxCC'
        mmHeight = 3704
        mmLeft = 30427
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      BeforePrint = ppFooterBand2BeforePrint
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'ppLine7'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object lblSistema: TppLabel
        UserName = 'lblSistema'
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
        mmTop = 1588
        mmWidth = 79375
        BandType = 8
      end
      object rptRazaoAnalLabel17: TppLabel
        UserName = 'rptRazaoAnalLabel17'
        Caption = 'Página'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 131234
        mmTop = 1588
        mmWidth = 9525
        BandType = 8
      end
      object lblContBalCxCC: TppLabel
        UserName = 'lblContBalCxCC'
        AutoSize = False
        Caption = 'lblContBalCxCC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 1588
        mmWidth = 11113
        BandType = 8
      end
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 248444
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object lblCalcBalCxCC: TppSystemVariable
        UserName = 'lblCalcBalCxCC1'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 86254
        mmTop = 1588
        mmWidth = 1588
        BandType = 8
      end
    end
    object rptBalCxCCGroup1: TppGroup
      BreakName = 'GRAU'
      DataPipeline = pplBalCxCC
      OutlineSettings.CreateNode = True
      UserName = 'rptBalCxCCGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplBalCxCC'
      object rptBalCxCCGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rptBalCxCCGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object cdsBalCxCC: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 72
    Data = {
      4B0300009619E0BD0100000018000000180000000000030000004B0308504C41
      434F4E544101004900000002000753554254595045020049000A004669786564
      43686172000557494454480200020012000A434F4445585445524E4F01004900
      000002000753554254595045020049000A004669786564436861720005574944
      5448020002000A0007504C4147524155080004000000000007504C415449504F
      01004900000002000753554254595045020049000A0046697865644368617200
      0557494454480200020001000D504C41434F4E434F5252455350010049000000
      01000557494454480200020012000B504C414E41545552455A41010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      0200020001000E434F4443454E54524F435553544F0100490000000100055749
      445448020002000A00044E4F4D45010049000000010005574944544802000200
      1E000D4E4F4D45494E44454E5441444F01004900000002000753554254595045
      020049000A004669786564436861720005574944544802000200960009444542
      435245414E5401004900000002000753554254595045020049000A0046697865
      6443686172000557494454480200020001000B44454243524553414C444F0100
      4900000002000753554254595045020049000A00466978656443686172000557
      494454480200020001000853414C444F41425308000400000000000B53414C44
      4F414E544142530800040000000000064D4F564142530800040000000000054D
      4F56444301004900000002000753554254595045020049000A00466978656443
      6861720005574944544802000200010004475241550100490000000100055749
      44544802000200010005434F4E54410100490000000100055749445448020002
      003C000E504C414E4F4D454F55544C494E470100490000000100055749445448
      02000200280007504C414E4F4D45010049000000010005574944544802000200
      3C0003444542080004000000000004435245440800040000000000034D4F5608
      000400000000000853414C444F414E5408000400000000000553414C444F0800
      04000000000002000D44454641554C545F4F5244455202008200020000000100
      0700044C4349440400010009080000}
  end
  object sqlBalCxCC: TCMSqlParams
    SQL.Strings = (
      
        'SELECT  /*+ RULE */                                             ' +
        '   '
      
        '   U.PLACONTA, codexterno, U.PLAGRAU, U.PLATIPO, U.PLACONCORRESP' +
        ',            '
      
        '   U.PLANATUREZA, U.CODCENTROCUSTO, U.NOME,                     ' +
        ' '
      
        '   ('#39'12345678901234567890123456789012345678901234567890123456789' +
        '0123456789012345678901234567890123456789012345678901234567890123' +
        '456789012345678901234567890'#39') AS NOMEINDENTADO,  '
      
        '   ('#39' '#39') AS DEBCREANT, ('#39' '#39') AS DEBCRESALDO, (0) AS SALDOABS, (0' +
        ') AS SALDOANTABS,  '
      '   (0) AS MOVABS, ('#39' '#39') AS MOVDC,                              '
      
        '   U.GRAU, U.CONTA, U.PLANOMEOUTLING, U.PLANOME,                ' +
        ' '
      
        '   U.DEB,U.CRED, U.MOV,                                         ' +
        ' '
      
        '   U.SALDOANT, U.SALDO FROM (                                   ' +
        ' '
      
        'SELECT                                                          ' +
        ' '
      '   s.codexterno,'
      
        '   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,           ' +
        ' '
      '   C.PLANATUREZA, ('#39' '#39') AS CODCENTROCUSTO,                     '
      '   ('#39' '#39') AS NOME,                                              '
      '   SUBSTR(C.PLACONTA, 1, 1) AS GRAU,     '
      
        '   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLAN' +
        'OMEOUTLING,'
      
        '   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,     ' +
        '      '
      
        '   S.DEB,                                                       ' +
        ' '
      
        '   S.CRED,                                                      ' +
        ' '
      
        '   S.MOV,                                                       ' +
        ' '
      
        '   SA.SALDOANT, SS.SALDO                                        ' +
        ' '
      
        'FROM                                                            ' +
        ' '
      '    PLANOCONTA C, '
      
        '     (SELECT P.PLANOME, P.PLACONTA, P.PLANO, P.PLATIPO, P.PLAINA' +
        'TIVA'
      
        '      FROM  PLANOCONTAPER P,                                    ' +
        '          '
      
        '         (SELECT PLACONTA, PLANO, MIN(TO_CHAR(PEREXERCICIO)||DEC' +
        'ODE(LENGTH(NVL(PERNUMERO,0)),1,'#39'0'#39
      
        '                                    ||TO_CHAR(NVL(PERNUMERO,0)),' +
        'TO_CHAR(NVL(PERNUMERO,0)))) AS PERNUMERO'
      '          FROM PLANOCONTAPER'
      
        '          WHERE (TO_CHAR(PEREXERCICIO)||DECODE(LENGTH(NVL(PERNUM' +
        'ERO,0)),1,'#39'0'#39'||TO_CHAR(NVL(PERNUMERO,0)),'
      '                 TO_CHAR(NVL(PERNUMERO,0))) >= '#39'200404'#39')'
      '            AND (IDPESSOA = 1)'
      '          GROUP BY  PLACONTA, PLANO) PX'
      '      WHERE (P.PLACONTA = PX.PLACONTA)'
      '        AND (P.PLANO = PX.PLANO)'
      '        AND (P.IDPESSOA = 1)'
      
        '        AND (TO_CHAR(P.PEREXERCICIO)||DECODE(LENGTH(NVL(P.PERNUM' +
        'ERO,0)),1,'#39'0'#39'||'
      
        '             TO_CHAR(NVL(P.PERNUMERO,0)),TO_CHAR(NVL(P.PERNUMERO' +
        ',0))) = PX.PERNUMERO))  PD, '
      '                                    '
      '     (SELECT PLACONTA, '
      '      SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) '
      
        '        - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALD' +
        'OANT'
      '      FROM PLANOSALDO                                        '
      
        '      WHERE                                                     ' +
        '   '
      '        (PEREXERCICIO =2004) AND         '
      '        ((PERNUMERO < 4) OR (PERNUMERO IS NULL)) AND '
      '        '
      '   --     (CODCENTROCUSTO >= '#39'0101      '#39') AND '
      '   --     (IDEMPRESA =1) AND '
      '   --     (CODCENTROCUSTO <= '#39'0105        '#39') AND '
      '   --     (IDEMPRESA =1) AND        '
      '        (IDPESSOA =1) AND         '
      '        (PLANO =4) AND                          '
      
        '        (RTRIM(PLACONTA) >= RTRIM('#39'0'#39')) AND                     ' +
        ' '
      
        '        (RTRIM(PLACONTA) <= RTRIM('#39'999999999999999999'#39'))        ' +
        '                  '
      
        '      GROUP BY PLACONTA   ) SA,                                 ' +
        '             '
      
        '                                                                ' +
        '         '
      '     (SELECT ps.PLACONTA, ps.codcentrocusto,  cc.codexterno,'
      
        '        SUM(PLSDEBITOCORRENTE) AS DEB,                          ' +
        '      '
      
        '        SUM(PLSCREDITOCOR) AS CRED,                             ' +
        '      '
      
        '        SUM(DECODE(PLSTIPO, '#39'A'#39', PLSDEBITOCORRENTE, 0)) AS DEBA,' +
        '    '
      
        '        SUM(DECODE(PLSTIPO, '#39'A'#39', PLSCREDITOCOR, 0)) AS CREDA,   ' +
        '    '
      
        '       (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV     ' +
        '     '
      
        '      FROM PLANOSALDO ps, centcust cc                           ' +
        '                           '
      
        '      WHERE                                                     ' +
        '           '
      '       (PEREXERCICIO =2004) AND         '
      '       (PERNUMERO BETWEEN 4 AND 6) AND  '
      '--       (CODCENTROCUSTO >= '#39'0101      '#39') AND '
      '--       (IDEMPRESA =1) AND '
      '--       (CODCENTROCUSTO <= '#39'0105        '#39') AND '
      '--       (IDEMPRESA =1) AND '
      '       (cc.codexterno >= '#39'0101'#39') and'
      '       (cc.codexterno <= '#39'0105'#39') and'
      '       (cc.idplancentcust = 1 ) and'
      '       (ps.codcentrocusto = cc.codcentrocusto) and'
      '       (IDPESSOA =1) AND '
      '       (PLANO =4) AND   '
      '       (RTRIM(PLACONTA) >= RTRIM('#39'0'#39')) AND              '
      
        '       (RTRIM(PLACONTA) <= RTRIM('#39'999999999999999999'#39'))         ' +
        '         '
      
        '      GROUP BY ps.PLACONTA, ps.codcentrocusto, cc.codexterno ) S' +
        ',                                       '
      
        '                                                                ' +
        ' '
      
        '   (SELECT                                                      ' +
        ' '
      
        '       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBIT' +
        'OCORRENTE) '
      
        '                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCO' +
        'R)) AS SALDO'
      '    FROM PLANOSALDO                                           '
      '    WHERE                                                     '
      '       (PEREXERCICIO =2004) AND      '
      '       ((PERNUMERO <= 6) OR (PERNUMERO IS NULL)) AND '
      '--        (CODCENTROCUSTO >= '#39'0101      '#39') AND '
      '--       (IDEMPRESA =1) AND   '
      ' --      (CODCENTROCUSTO <= '#39'0105        '#39') AND '
      '--       (IDEMPRESA =1) AND                           '
      '       (IDPESSOA =1) AND '
      '       (PLANO =4) AND                  '
      '       (RTRIM(PLACONTA) >= RTRIM('#39'0'#39')) AND              '
      
        '       (RTRIM(PLACONTA) <= RTRIM('#39'999999999999999999'#39'))         ' +
        '         '
      
        '    GROUP BY PLACONTA  ) SS                                     ' +
        '  '
      
        '                                                                ' +
        ' '
      
        'WHERE                                                           ' +
        ' '
      
        '    (S.PLACONTA(+) = C.PLACONTA) AND                            ' +
        ' '
      
        '    (SA.PLACONTA(+) = C.PLACONTA) AND                           ' +
        ' '
      
        '    (SS.PLACONTA(+) = C.PLACONTA) AND                           ' +
        ' '
      ''
      '   -- (s.CODexterno) >= RTRIM('#39'0101'#39') AND'
      
        '   -- (s.CODexterno) <= RTRIM('#39'0105'#39') and                       ' +
        '     '
      ''
      
        '    (PD.PLACONTA(+) = C.PLACONTA) AND                           ' +
        ' '
      
        '    (PD.PLANO(+) = C.PLANO) AND                                 ' +
        ' '
      '    (C.PLANO =4) AND                      '
      '    (RTRIM(C.PLACONTA) >= RTRIM('#39'0'#39')) AND                  '
      
        '    (RTRIM(C.PLACONTA) <= RTRIM('#39'999999999999999999'#39'))          ' +
        '            '
      
        'GROUP BY                                                        ' +
        ' '
      
        '    C.PLACONTA, SA.SALDOANT, SS.SALDO, s.codexterno,            ' +
        '               '
      
        '    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                        ' +
        ' '
      
        '    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOM' +
        'E), C.PLACONCORRESP,                '
      
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
      
        'HAVING ((DECODE(NVL(S.DEB,0),0,                                 ' +
        ' '
      
        '       (DECODE(NVL(S.CRED,0),0,                                 ' +
        ' '
      
        '       (DECODE(NVL(SS.SALDO,0),0,                               ' +
        ' '
      
        '       (DECODE(NVL(SA.SALDOANT,0),0,'#39'0'#39','#39'1'#39')),'#39'1'#39')),'#39'1'#39')),'#39'1'#39')) ' +
        '= '#39'1'#39') '
      'UNION all                                                      '
      
        'SELECT                                                          ' +
        ' '
      '   cc.codexterno,'
      
        '   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,           ' +
        ' '
      
        '   C.PLANATUREZA, S.CODCENTROCUSTO, CC.NOME,                    ' +
        ' '
      '   SUBSTR(C.PLACONTA, 1, 1) AS GRAU,     '
      
        '   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLAN' +
        'OMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLAN' +
        'OME,           '
      
        '   M.DEB, M.CRED, M.MOV,                                        ' +
        ' '
      
        '   SA.SALDOANT,                                                 ' +
        ' '
      
        '   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)' +
        ' '
      
        '   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO' +
        ' '
      
        'FROM                                                            ' +
        ' '
      
        '   PLANOSALDO S, CENTCUST CC, PLANOCONTA C,                     ' +
        ' '
      
        '(SELECT P.PLANOME, P.PLACONTA, P.PLANO, P.PLATIPO, P.PLAINATIVA ' +
        '  FROM  PLANOCONTAPER P,'
      
        '   (SELECT PLACONTA, PLANO, MIN(TO_CHAR(PEREXERCICIO)||DECODE(LE' +
        'NGTH(NVL(PERNUMERO,0)),1,'#39'0'#39'||'
      
        '                                TO_CHAR(NVL(PERNUMERO,0)),TO_CHA' +
        'R(NVL(PERNUMERO,0)))) AS PERNUMERO'
      '    FROM PLANOCONTAPER'
      
        '    WHERE (TO_CHAR(PEREXERCICIO)||DECODE(LENGTH(NVL(PERNUMERO,0)' +
        '),1,'#39'0'#39'||'
      
        '           TO_CHAR(NVL(PERNUMERO,0)),TO_CHAR(NVL(PERNUMERO,0))) ' +
        '>= '#39'200404'#39')'
      '      AND (IDPESSOA = 1)'
      '    GROUP BY  PLACONTA, PLANO) PX'
      ' WHERE (P.PLACONTA = PX.PLACONTA)'
      '   AND (P.PLANO = PX.PLANO)'
      '   AND (P.IDPESSOA = 1)'
      
        '   AND (TO_CHAR(P.PEREXERCICIO)||DECODE(LENGTH(NVL(P.PERNUMERO,0' +
        ')),1,'#39'0'#39'||'
      
        '        TO_CHAR(NVL(P.PERNUMERO,0)),TO_CHAR(NVL(P.PERNUMERO,0)))' +
        ' = PX.PERNUMERO))  PD, '
      
        '   (SELECT                                                      ' +
        ' '
      
        '       PLACONTA,                                                ' +
        ' '
      
        '       CODCENTROCUSTO,SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLS' +
        'DEBITOCORRENTE)    '
      
        '                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCO' +
        'R)) AS SALDOANT '
      
        '    FROM PLANOSALDO                                             ' +
        ' '
      '    WHERE (PLANO =4) AND                                    '
      '          (PEREXERCICIO =2004) AND                         '
      '          ((PERNUMERO <4) OR (PERNUMERO IS NULL)) AND  '
      '          (IDPESSOA =1) AND                              '
      '  --     (RTRIM(CODCENTROCUSTO) >= RTRIM('#39'0101'#39') AND        '
      '  --     (IDEMPRESA =1)) AND                             '
      '  --     (RTRIM(CODCENTROCUSTO) <= RTRIM('#39'0105'#39') AND        '
      ' --      (IDEMPRESA =1)) AND                             '
      '          (RTRIM(PLACONTA) >= RTRIM('#39'0'#39')) AND              '
      
        '          (RTRIM(PLACONTA) <= RTRIM('#39'999999999999999999'#39'))      ' +
        '            '
      
        '    GROUP BY PLACONTA,CODCENTROCUSTO ) SA,                      ' +
        ' '
      
        '   (SELECT                                                      ' +
        ' '
      
        '       PLACONTA,CODCENTROCUSTO,                                 ' +
        ' '
      
        '       SUM(PLSDEBITOCORRENTE) AS DEB,                           ' +
        ' '
      
        '       SUM(PLSCREDITOCOR) AS CRED,                              ' +
        ' '
      
        '       (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV     ' +
        ' '
      
        '    FROM PLANOSALDO                                             ' +
        ' '
      '    WHERE (PLANO =4) AND                                    '
      '          (PERNUMERO BETWEEN 4 AND 6) AND    '
      '          (PEREXERCICIO =2004) AND                         '
      '          (IDPESSOA =1) AND                              '
      '   --    (RTRIM(CODCENTROCUSTO) >= RTRIM('#39'0101'#39') AND        '
      '   --    (IDEMPRESA =1)) AND                             '
      '   --    (RTRIM(CODCENTROCUSTO) <= RTRIM('#39'0105'#39') AND        '
      '   --    (IDEMPRESA =1)) AND                             '
      '          (RTRIM(PLACONTA) >= RTRIM('#39'0'#39')) AND              '
      
        '          (RTRIM(PLACONTA) <= RTRIM('#39'999999999999999999'#39'))      ' +
        '            '
      
        '    GROUP BY PLACONTA, CODCENTROCUSTO ) M                       ' +
        ' '
      
        'WHERE                                                           ' +
        ' '
      ' --(RTRIM(S.CODCENTROCUSTO) >= RTRIM('#39'0101'#39') AND         '
      '--- (S.IDEMPRESA =1)) AND                              '
      ' --(RTRIM(S.CODCENTROCUSTO) <= RTRIM('#39'0105'#39') AND         '
      ' --(S.IDEMPRESA =1)) AND                              '
      '    (S.IDPESSOA =1) AND                               '
      '    (S.IDEMPRESA =1) AND'
      ''
      '    (CODexterno) >= RTRIM('#39'0101'#39') AND'
      
        '    (CODexterno) <= RTRIM('#39'0105'#39') and                           ' +
        ' '
      '    (cc.idplancentcust = 1 ) and'
      ''
      '    (C.PLATIPO = '#39'A'#39') AND                                   '
      '    (RTRIM(C.PLACONTA) >= RTRIM('#39'0'#39')) AND                  '
      
        '    (RTRIM(C.PLACONTA) <= RTRIM('#39'999999999999999999'#39')) AND      ' +
        '            '
      
        '    (SA.PLACONTA(+)       = S.PLACONTA) AND                     ' +
        ' '
      
        '    (SA.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND               ' +
        ' '
      
        '    (M.PLACONTA(+)        = S.PLACONTA) AND                     ' +
        ' '
      
        '    (M.CODCENTROCUSTO(+)  = S.CODCENTROCUSTO) AND               ' +
        ' '
      '    (S.PLANO =4) AND                                        '
      '    (S.PEREXERCICIO =2004) AND                             '
      '    ((S.PERNUMERO <=6) OR (S.PERNUMERO IS NULL)) AND   '
      '    (S.IDPESSOA =1) AND                                  '
      
        '    (CC.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND               ' +
        '    '
      
        '    (CC.IDEMPRESA = S.IDEMPRESA) AND                            ' +
        ' '
      
        '    (PD.PLACONTA(+) = C.PLACONTA) AND                           ' +
        ' '
      
        '    (PD.PLANO(+) = C.PLANO) AND                                 ' +
        ' '
      
        '    (S.PLACONTA = C.PLACONTA) AND                               ' +
        ' '
      
        '    (S.PLANO = C.PLANO)                                         ' +
        ' '
      
        'GROUP BY                                                        ' +
        ' '
      
        '   codexterno, C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP' +
        ',            '
      
        '   S.CODCENTROCUSTO, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME' +
        '), CC.NOME, C.PLANATUREZA,          '
      
        '   M.DEB,M.CRED,M.MOV, C.PLANOMEOUTLING,                        ' +
        ' '
      
        '   SA.SALDOANT  ) U                                             ' +
        ' '
      'WHERE ((U.DEB <> 0) OR (U.CRED <> 0) OR (U.SALDOANT <> 0)) '
      
        'ORDER BY U.PLACONTA, U.CODCENTROCUSTO                           ' +
        ' '
      '')
    ClientDataSet = cdsBalCxCC
    Left = 264
    Top = 72
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 26
    Top = 151
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '   PERNUMERO'
      'FROM '
      '   PERIODO '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND '
      '   (PEREXERCICIO=:PEREXERCICIO) AND '
      '   (PERNUMERO BETWEEN :PERNUMEROINI AND :PERNUMEROFIM) AND '
      '   ((PERBLOQUE IS NULL) OR (PERBLOQUE = '#39'N'#39'))'
      '')
    ClientDataSet = cdsAux
    Left = 82
    Top = 151
  end
  object cdsTitulos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 136
  end
  object sqlTitulos: TCMSqlParams
    ClientDataSet = cdsTitulos
    Left = 240
    Top = 136
  end
end
