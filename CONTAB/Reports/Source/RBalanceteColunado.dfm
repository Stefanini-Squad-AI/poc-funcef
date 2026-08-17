inherited RptBalanceteColunado: TRptBalanceteColunado
  Left = 291
  Top = 136
  Width = 437
  Height = 343
  Caption = 'Relatório Balancete Colunado'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Balancete Colunado'
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
        TipodeDado = tdReal
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
        Caption = 'Imprimir em outro Idioma'
        Controle = tcCheckBox
        TipodeDado = tdString
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
        Caption = 'Considera Movimento'
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
        Name = 'Considera Movimento'
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
        Caption = 'Desconsiderar as contas Estatísticas'
        Controle = tcCheckBox
        TipodeDado = tdString
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
        Caption = 'Plano Previdenciário'
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
        Name = 'Plano Previdenciário'
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
        Caption = 'Patrocinadora'
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
        Name = 'Patrocinadora'
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
        Caption = 'Imprime Centavos'
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
        Name = 'Imprime Centavos'
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
        Caption = 'Imprime Numero da Conta'
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
        Caption = 'Titulo'
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
        Name = 'Titulo'
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
        Width = 240
      end
      item
        Caption = 'Sub-Título'
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
        Width = 250
      end
      item
        Caption = 'Desconsiderar o Encerramento de Resultado'
        Controle = tcCheckBox
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
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    AfterExecute = CmpRptCMAfterExecute
    OnParamControlExit = CmpRptCMParamControlExit
    OnParamControlEnter = CmpRptCMParamControlEnter
    Formheight = 480
    Left = 18
    Top = 52
  end
  inherited DevRptCM: TExtraOptions
    Top = 4
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpBalancete
    LabelEmpresa = ppLabel76
    LabelSistema = ppLabel85
    Left = 24
    Top = 112
  end
  object dsBalancete: TwwDataSource
    DataSet = CdsBalancete
    Left = 240
    Top = 273
  end
  object ppBalancete: TppDBPipeline
    DataSource = dsBalancete
    UserName = 'Balancete'
    Left = 80
    Top = 67
    object ppBalanceteppField1: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBalanceteppField2: TppField
      FieldAlias = 'PLANOME'
      FieldName = 'PLANOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBalanceteppField3: TppField
      FieldAlias = 'PLANOMEOUTLING'
      FieldName = 'PLANOMEOUTLING'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBalanceteppField4: TppField
      FieldAlias = 'NOMEINDENTADO'
      FieldName = 'NOMEINDENTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBalanceteppField5: TppField
      FieldAlias = 'PER1'
      FieldName = 'PER1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBalanceteppField6: TppField
      FieldAlias = 'PER2'
      FieldName = 'PER2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBalanceteppField7: TppField
      FieldAlias = 'PER3'
      FieldName = 'PER3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBalanceteppField8: TppField
      FieldAlias = 'PER4'
      FieldName = 'PER4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBalanceteppField9: TppField
      FieldAlias = 'PER5'
      FieldName = 'PER5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBalanceteppField10: TppField
      FieldAlias = 'PER6'
      FieldName = 'PER6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBalanceteppField11: TppField
      FieldAlias = 'PER7'
      FieldName = 'PER7'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBalanceteppField12: TppField
      FieldAlias = 'PER8'
      FieldName = 'PER8'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBalanceteppField13: TppField
      FieldAlias = 'PER9'
      FieldName = 'PER9'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBalanceteppField14: TppField
      FieldAlias = 'PER10'
      FieldName = 'PER10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBalanceteppField15: TppField
      FieldAlias = 'PER11'
      FieldName = 'PER11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBalanceteppField16: TppField
      FieldAlias = 'PER12'
      FieldName = 'PER12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppBalanceteppField17: TppField
      FieldAlias = 'TOTPER'
      FieldName = 'TOTPER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
  end
  object rpBalancete: TppReport
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 112
    Top = 2
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBalancete'
    object ppHeaderBand19: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41275
      mmPrintPosition = 0
      object ppLine35: TppLine
        UserName = 'ppLine60'
        Pen.Width = 3
        Weight = 2.25
        mmHeight = 1852
        mmLeft = 0
        mmTop = 32808
        mmWidth = 284428
        BandType = 0
      end
      object ppLine38: TppLine
        UserName = 'ppLine61'
        Pen.Width = 3
        Weight = 2.25
        mmHeight = 1852
        mmLeft = 0
        mmTop = 39423
        mmWidth = 284428
        BandType = 0
      end
      object pplPer1: TppLabel
        UserName = 'pplbl13'
        AutoSize = False
        Caption = 'Janeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 49213
        mmTop = 34660
        mmWidth = 18521
        BandType = 0
      end
      object pplPer2: TppLabel
        UserName = 'pplbl14'
        AutoSize = False
        Caption = 'Fevereiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 67469
        mmTop = 34660
        mmWidth = 17727
        BandType = 0
      end
      object pplPer3: TppLabel
        UserName = 'pplbl15'
        AutoSize = False
        Caption = 'Março'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 84931
        mmTop = 34660
        mmWidth = 17727
        BandType = 0
      end
      object pplPer4: TppLabel
        UserName = 'pplbl16'
        AutoSize = False
        Caption = 'Abril'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 102394
        mmTop = 34660
        mmWidth = 17727
        BandType = 0
      end
      object pplPer5: TppLabel
        UserName = 'pplbl17'
        AutoSize = False
        Caption = 'Maio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 119856
        mmTop = 34660
        mmWidth = 17727
        BandType = 0
      end
      object pplPer6: TppLabel
        UserName = 'pplbl18'
        AutoSize = False
        Caption = 'Junho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 137319
        mmTop = 34660
        mmWidth = 17727
        BandType = 0
      end
      object pplPer7: TppLabel
        UserName = 'pplbl19'
        AutoSize = False
        Caption = 'Julho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 154782
        mmTop = 34660
        mmWidth = 17727
        BandType = 0
      end
      object pplPer8: TppLabel
        UserName = 'pplbl20'
        AutoSize = False
        Caption = 'Agosto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 172244
        mmTop = 34660
        mmWidth = 17727
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'ppDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplEmpresaProp
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresaProp'
        mmHeight = 28310
        mmLeft = 1058
        mmTop = 529
        mmWidth = 30427
        BandType = 0
      end
      object pplPer9: TppLabel
        UserName = 'pplbl21'
        AutoSize = False
        Caption = 'Setembro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 189707
        mmTop = 34660
        mmWidth = 17727
        BandType = 0
      end
      object pplPer10: TppLabel
        UserName = 'pplbl22'
        AutoSize = False
        Caption = 'Outubro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 207169
        mmTop = 34660
        mmWidth = 17727
        BandType = 0
      end
      object pplPer11: TppLabel
        UserName = 'pplbl23'
        AutoSize = False
        Caption = 'Novembro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 224632
        mmTop = 34660
        mmWidth = 17727
        BandType = 0
      end
      object pplPer12: TppLabel
        UserName = 'pplbl24'
        AutoSize = False
        Caption = 'Dezembro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 242094
        mmTop = 34660
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'rptDemonstrativo5Label1'
        AutoSize = False
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 260880
        mmTop = 34660
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'ppLabel71'
        AutoSize = False
        Caption = 'Empresa 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 33867
        mmTop = 529
        mmWidth = 247121
        BandType = 0
      end
      object pplTitulo: TppLabel
        UserName = 'ppLabel128'
        AutoSize = False
        Caption = 'Título 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 33867
        mmTop = 8731
        mmWidth = 247121
        BandType = 0
      end
      object lblFiltro2: TppLabel
        UserName = 'txtFiltro5'
        AutoSize = False
        Caption = 'Filtro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33867
        mmTop = 23019
        mmWidth = 247121
        BandType = 0
      end
      object lblFiltro1: TppLabel
        UserName = 'lblFiltro1'
        AutoSize = False
        Caption = 'Filtro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33867
        mmTop = 18521
        mmWidth = 247121
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText7: TppDBText
        UserName = 'rptBalanceteColMesCCDBText1'
        DataField = 'NOMEINDENTADO'
        DataPipeline = ppBalancete
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBalancete'
        mmHeight = 3175
        mmLeft = 2646
        mmTop = 529
        mmWidth = 44186
        BandType = 4
      end
      object dbpplPer1: TppDBText
        UserName = 'DBText1'
        DataField = 'PER1'
        DataPipeline = ppBalancete
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalancete'
        mmHeight = 3175
        mmLeft = 50006
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer2: TppDBText
        UserName = 'dbpplPer2'
        DataField = 'PER2'
        DataPipeline = ppBalancete
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalancete'
        mmHeight = 3175
        mmLeft = 67469
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer3: TppDBText
        UserName = 'dbpplPer3'
        DataField = 'PER3'
        DataPipeline = ppBalancete
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalancete'
        mmHeight = 3175
        mmLeft = 84931
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer4: TppDBText
        UserName = 'DBText101'
        DataField = 'PER4'
        DataPipeline = ppBalancete
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalancete'
        mmHeight = 3175
        mmLeft = 102394
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer5: TppDBText
        UserName = 'dbpplPer5'
        DataField = 'PER5'
        DataPipeline = ppBalancete
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalancete'
        mmHeight = 3175
        mmLeft = 119856
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer6: TppDBText
        UserName = 'dbpplPer6'
        DataField = 'PER6'
        DataPipeline = ppBalancete
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalancete'
        mmHeight = 3175
        mmLeft = 137319
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer7: TppDBText
        UserName = 'dbpplPer7'
        DataField = 'PER7'
        DataPipeline = ppBalancete
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalancete'
        mmHeight = 3175
        mmLeft = 154782
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer8: TppDBText
        UserName = 'dbpplPer8'
        DataField = 'PER8'
        DataPipeline = ppBalancete
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalancete'
        mmHeight = 3175
        mmLeft = 172244
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer9: TppDBText
        UserName = 'dbpplPer9'
        DataField = 'PER9'
        DataPipeline = ppBalancete
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalancete'
        mmHeight = 3175
        mmLeft = 189707
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer10: TppDBText
        UserName = 'dbpplPer10'
        DataField = 'PER10'
        DataPipeline = ppBalancete
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalancete'
        mmHeight = 3175
        mmLeft = 207169
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer11: TppDBText
        UserName = 'dbpplPer11'
        DataField = 'PER11'
        DataPipeline = ppBalancete
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalancete'
        mmHeight = 3175
        mmLeft = 224632
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer12: TppDBText
        UserName = 'dbpplPer12'
        DataField = 'PER12'
        DataPipeline = ppBalancete
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalancete'
        mmHeight = 3175
        mmLeft = 242094
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPerTot: TppDBText
        UserName = 'dbpplPerTot'
        DataField = 'TOTPER'
        DataPipeline = ppBalancete
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBalancete'
        mmHeight = 3175
        mmLeft = 259821
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
    end
    object ppFooterBand19: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10319
      mmPrintPosition = 0
      object ppLabel85: TppLabel
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 276490
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc19'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 276226
        BandType = 8
      end
      object ppLine39: TppLine
        UserName = 'ppLine37'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc21'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 250561
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object BandaSumario: TppSummaryBand
      NewPage = True
      mmBottomOffset = 0
      mmHeight = 65088
      mmPrintPosition = 0
      object rptBalanceteLine1: TppLine
        UserName = 'rptBalanceteLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1852
        mmLeft = 36513
        mmTop = 5292
        mmWidth = 247121
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
        mmLeft = 151871
        mmTop = 3440
        mmWidth = 16933
        BandType = 7
      end
      object memDescricao: TppMemo
        UserName = 'memDescricao'
        Caption = 'memDescricao'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 40481
        mmLeft = 265
        mmTop = 18256
        mmWidth = 28310
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memCol1: TppMemo
        UserName = 'memCol1'
        Caption = 'memCol1'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 40481
        mmLeft = 29898
        mmTop = 18256
        mmWidth = 19050
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object pplPer1T: TppLabel
        UserName = 'lPer1T'
        AutoSize = False
        Caption = 'Janeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 29898
        mmTop = 13229
        mmWidth = 19050
        BandType = 7
      end
      object memCol2: TppMemo
        UserName = 'memCol2'
        Caption = 'memCol2'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 40481
        mmLeft = 49213
        mmTop = 18256
        mmWidth = 19050
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object pplPer2T: TppLabel
        UserName = 'lPer1T1'
        AutoSize = False
        Caption = 'Fevereiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 49213
        mmTop = 13229
        mmWidth = 19050
        BandType = 7
      end
      object memCol3: TppMemo
        UserName = 'memCol3'
        Caption = 'memCol3'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 40481
        mmLeft = 68527
        mmTop = 18256
        mmWidth = 19050
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object pplPer3T: TppLabel
        UserName = 'lPer1T2'
        AutoSize = False
        Caption = 'Março'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 68527
        mmTop = 13229
        mmWidth = 19050
        BandType = 7
      end
      object memCol4: TppMemo
        UserName = 'memCol4'
        Caption = 'memCol4'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 40481
        mmLeft = 87842
        mmTop = 18256
        mmWidth = 19050
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memCol5: TppMemo
        UserName = 'memCol5'
        Caption = 'memCol5'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 40481
        mmLeft = 107156
        mmTop = 18256
        mmWidth = 19050
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memCol6: TppMemo
        UserName = 'memCol6'
        Caption = 'memCol6'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 40481
        mmLeft = 126471
        mmTop = 18256
        mmWidth = 19050
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memCol7: TppMemo
        UserName = 'memCol7'
        Caption = 'memCol7'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 40481
        mmLeft = 145786
        mmTop = 18256
        mmWidth = 19050
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memCol8: TppMemo
        UserName = 'memCol8'
        Caption = 'memCol8'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 40481
        mmLeft = 165100
        mmTop = 18256
        mmWidth = 19050
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memCol9: TppMemo
        UserName = 'memCol9'
        Caption = 'memCol9'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 40481
        mmLeft = 184415
        mmTop = 18256
        mmWidth = 19050
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memCol10: TppMemo
        UserName = 'memCol10'
        Caption = 'memCol10'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 40481
        mmLeft = 203730
        mmTop = 18256
        mmWidth = 19050
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memCol11: TppMemo
        UserName = 'memCol11'
        Caption = 'memCol11'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 40481
        mmLeft = 223044
        mmTop = 18256
        mmWidth = 19050
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memCol12: TppMemo
        UserName = 'memCol12'
        Caption = 'memCol12'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 40481
        mmLeft = 242359
        mmTop = 18256
        mmWidth = 19050
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object pplPer6T: TppLabel
        UserName = 'lPer6T'
        AutoSize = False
        Caption = 'Junho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 126471
        mmTop = 13229
        mmWidth = 19050
        BandType = 7
      end
      object pplPer5T: TppLabel
        UserName = 'lPer5T'
        AutoSize = False
        Caption = 'Maio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 107156
        mmTop = 13229
        mmWidth = 19050
        BandType = 7
      end
      object pplPer4T: TppLabel
        UserName = 'lPer1T3'
        AutoSize = False
        Caption = 'Abril'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 87842
        mmTop = 13229
        mmWidth = 19050
        BandType = 7
      end
      object pplPer7T: TppLabel
        UserName = 'lPer7T'
        AutoSize = False
        Caption = 'Julho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 145786
        mmTop = 13229
        mmWidth = 19050
        BandType = 7
      end
      object pplPer9T: TppLabel
        UserName = 'lPer9T'
        AutoSize = False
        Caption = 'Setembro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 184415
        mmTop = 13229
        mmWidth = 19050
        BandType = 7
      end
      object pplPer10T: TppLabel
        UserName = 'lPer10T'
        AutoSize = False
        Caption = 'Outubro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 203730
        mmTop = 13229
        mmWidth = 19050
        BandType = 7
      end
      object pplPer11T: TppLabel
        UserName = 'lPer11T'
        AutoSize = False
        Caption = 'Novembro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 223044
        mmTop = 13229
        mmWidth = 19050
        BandType = 7
      end
      object pplPer12T: TppLabel
        UserName = 'lPer12T'
        AutoSize = False
        Caption = 'Dezembro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 242359
        mmTop = 13229
        mmWidth = 19050
        BandType = 7
      end
      object pplPer8T: TppLabel
        UserName = 'lPer8T'
        AutoSize = False
        Caption = 'Agosto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 165100
        mmTop = 13229
        mmWidth = 19050
        BandType = 7
      end
      object memColTot: TppMemo
        UserName = 'memColTot'
        Caption = 'memColTot'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 40481
        mmLeft = 264848
        mmTop = 17992
        mmWidth = 19050
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object pplTotal: TppLabel
        UserName = 'lPer12T1'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 264848
        mmTop = 12965
        mmWidth = 19050
        BandType = 7
      end
    end
  end
  object sqlBalancete: TCMSqlParams
    SQL.Strings = (
      'SELECT UU.PLACONTA, UU.PLANOME, UU.PLANOMEOUTLING,'
      '       UU.NOMEINDENTADO,'
      '       UU.PER1,'
      '       UU.PER2,'
      '       UU.PER3,'
      '       UU.PER4,'
      '       UU.PER5,'
      '       UU.PER6,'
      '       UU.PER7,'
      '       UU.PER8,'
      '       UU.PER9,'
      '       UU.PER10,'
      '       UU.PER11,'
      '       UU.PER12,'
      
        '       (NVL(UU.PER1,0) + NVL(UU.PER2,0) + NVL(UU.PER3,0) + NVL(U' +
        'U.PER4,0)  + NVL(UU.PER5,0)  + NVL(UU.PER6,0) +'
      
        '        NVL(UU.PER7,0) + NVL(UU.PER8,0) + NVL(UU.PER9,0) + NVL(U' +
        'U.PER10,0) + NVL(UU.PER11,0) + NVL(UU.PER12,0)) AS TOTPER'
      'FROM ('
      'SELECT U.PLACONTA, C.PLANOME, C.PLANOMEOUTLING,'
      
        '   SUBSTR(LPAD('#39' '#39', ((C.PLAGRAU - 1) * 3)) || C.PLANOME, 1, 150)' +
        ' AS NOMEINDENTADO,'
      
        '       DECODE(SIGN(SUM(U.PER1)),-1,DECODE(C.PLANATUREZA,'#39'D'#39',SUM(' +
        'U.PER1),SUM(U.PER1)*-1),DECODE(C.PLANATUREZA,'#39'D'#39',SUM(U.PER1),SUM' +
        '(U.PER1)*-1)) AS PER1,'
      
        '       DECODE(SIGN(SUM(U.PER2)),-1,DECODE(C.PLANATUREZA,'#39'D'#39',SUM(' +
        'U.PER2),SUM(U.PER2)*-1),DECODE(C.PLANATUREZA,'#39'D'#39',SUM(U.PER2),SUM' +
        '(U.PER1)*-1)) AS PER2,'
      
        '       DECODE(SIGN(SUM(U.PER3)),-1,DECODE(C.PLANATUREZA,'#39'D'#39',SUM(' +
        'U.PER3),SUM(U.PER3)*-1),DECODE(C.PLANATUREZA,'#39'D'#39',SUM(U.PER3),SUM' +
        '(U.PER3)*-1)) AS PER3,'
      
        '       DECODE(SIGN(SUM(U.PER4)),-1,DECODE(C.PLANATUREZA,'#39'D'#39',SUM(' +
        'U.PER4),SUM(U.PER4)*-1),DECODE(C.PLANATUREZA,'#39'D'#39',SUM(U.PER4),SUM' +
        '(U.PER4)*-1)) AS PER4,'
      
        '       DECODE(SIGN(SUM(U.PER5)),-1,DECODE(C.PLANATUREZA,'#39'D'#39',SUM(' +
        'U.PER5),SUM(U.PER5)*-1),DECODE(C.PLANATUREZA,'#39'D'#39',SUM(U.PER5),SUM' +
        '(U.PER5)*-1)) AS PER5,'
      
        '       DECODE(SIGN(SUM(U.PER6)),-1,DECODE(C.PLANATUREZA,'#39'D'#39',SUM(' +
        'U.PER6),SUM(U.PER6)*-1),DECODE(C.PLANATUREZA,'#39'D'#39',SUM(U.PER6),SUM' +
        '(U.PER6)*-1)) AS PER6,'
      
        '       DECODE(SIGN(SUM(U.PER7)),-1,DECODE(C.PLANATUREZA,'#39'D'#39',SUM(' +
        'U.PER7),SUM(U.PER7)*-1),DECODE(C.PLANATUREZA,'#39'D'#39',SUM(U.PER7),SUM' +
        '(U.PER7)*-1)) AS PER7,'
      
        '       DECODE(SIGN(SUM(U.PER8)),-1,DECODE(C.PLANATUREZA,'#39'D'#39',SUM(' +
        'U.PER8),SUM(U.PER8)*-1),DECODE(C.PLANATUREZA,'#39'D'#39',SUM(U.PER8),SUM' +
        '(U.PER8)*-1)) AS PER8,'
      
        '       DECODE(SIGN(SUM(U.PER9)),-1,DECODE(C.PLANATUREZA,'#39'D'#39',SUM(' +
        'U.PER9),SUM(U.PER9)*-1),DECODE(C.PLANATUREZA,'#39'D'#39',SUM(U.PER9),SUM' +
        '(U.PER9)*-1)) AS PER9,'
      
        '       DECODE(SIGN(SUM(U.PER10)),-1,DECODE(C.PLANATUREZA,'#39'D'#39',SUM' +
        '(U.PER10),SUM(U.PER10)*-1),DECODE(C.PLANATUREZA,'#39'D'#39',SUM(U.PER10)' +
        ',SUM(U.PER10)*-1)) AS PER10,'
      
        '       DECODE(SIGN(SUM(U.PER11)),-1,DECODE(C.PLANATUREZA,'#39'D'#39',SUM' +
        '(U.PER11),SUM(U.PER11)*-1),DECODE(C.PLANATUREZA,'#39'D'#39',SUM(U.PER11)' +
        ',SUM(U.PER11)*-1)) AS PER11,'
      
        '       DECODE(SIGN(SUM(U.PER12)),-1,DECODE(C.PLANATUREZA,'#39'D'#39',SUM' +
        '(U.PER12),SUM(U.PER12)*-1),DECODE(C.PLANATUREZA,'#39'D'#39',SUM(U.PER12)' +
        ',SUM(U.PER12)*-1)) AS PER12'
      'FROM'
      '('
      'SELECT PLACONTA, PLANO,'
      '       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER1,'
      '       (0) AS PER2,'
      '       (0) AS PER3,'
      '       (0) AS PER4,'
      '       (0) AS PER5,'
      '       (0) AS PER6,'
      '       (0) AS PER7,'
      '       (0) AS PER8,'
      '       (0) AS PER9,'
      '       (0) AS PER10,'
      '       (0) AS PER11,'
      '       (0) AS PER12'
      'FROM PLANOSALDO'
      'WHERE  (PEREXERCICIO =2001) AND'
      '       (PERNUMERO = 1) AND'
      '          (IDPESSOA =1) AND'
      '          (PLANO =1) AND'
      '          (PLACONTA >= '#39'0                 '#39') AND'
      '          (PLACONTA <= '#39'999999999999999999'#39')'
      'GROUP BY PLACONTA,PLANO'
      'UNION ALL'
      'SELECT PLACONTA, PLANO,'
      '       (0) AS PER1,'
      '       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER2,'
      '       (0) AS PER3,'
      '       (0) AS PER4,'
      '       (0) AS PER5,'
      '       (0) AS PER6,'
      '       (0) AS PER7,'
      '       (0) AS PER8,'
      '       (0) AS PER9,'
      '       (0) AS PER10,'
      '       (0) AS PER11,'
      '       (0) AS PER12'
      'FROM PLANOSALDO'
      'WHERE  (PEREXERCICIO =2001) AND'
      '       (PERNUMERO = 2) AND'
      '          (IDPESSOA =1) AND'
      '          (PLANO =1) AND'
      '          (PLACONTA >= '#39'0                 '#39') AND'
      '          (PLACONTA <= '#39'999999999999999999'#39')'
      'GROUP BY PLACONTA, PLANO'
      'UNION ALL'
      'SELECT PLACONTA, PLANO,'
      '       (0) AS PER1,'
      '       (0) AS PER2,'
      '       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER3,'
      '       (0) AS PER4,'
      '       (0) AS PER5,'
      '       (0) AS PER6,'
      '       (0) AS PER7,'
      '       (0) AS PER8,'
      '       (0) AS PER9,'
      '       (0) AS PER10,'
      '       (0) AS PER11,'
      '       (0) AS PER12'
      'FROM PLANOSALDO'
      'WHERE  (PEREXERCICIO =2001) AND'
      '       (PERNUMERO = 3) AND'
      '          (IDPESSOA =1) AND'
      '          (PLANO =1) AND'
      '          (PLACONTA >= '#39'0                 '#39') AND'
      '          (PLACONTA <= '#39'999999999999999999'#39')'
      'GROUP BY PLACONTA, PLANO'
      'UNION ALL'
      'SELECT PLACONTA, PLANO,'
      '       (0) AS PER1,'
      '       (0) AS PER2,'
      '       (0) AS PER3,'
      '       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER4,'
      '       (0) AS PER5,'
      '       (0) AS PER6,'
      '       (0) AS PER7,'
      '       (0) AS PER8,'
      '       (0) AS PER9,'
      '       (0) AS PER10,'
      '       (0) AS PER11,'
      '       (0) AS PER12'
      'FROM PLANOSALDO'
      'WHERE  (PEREXERCICIO =2001) AND'
      '       (PERNUMERO = 4) AND'
      '          (IDPESSOA =1) AND'
      '          (PLANO =1) AND'
      '          (PLACONTA >= '#39'0                 '#39') AND'
      '          (PLACONTA <= '#39'999999999999999999'#39')'
      'GROUP BY PLACONTA, PLANO'
      'UNION ALL'
      'SELECT PLACONTA, PLANO,'
      '       (0) AS PER1,'
      '       (0) AS PER2,'
      '       (0) AS PER3,'
      '       (0) AS PER4,'
      '       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER5,'
      '       (0) AS PER6,'
      '       (0) AS PER7,'
      '       (0) AS PER8,'
      '       (0) AS PER9,'
      '       (0) AS PER10,'
      '       (0) AS PER11,'
      '       (0) AS PER12'
      'FROM PLANOSALDO'
      'WHERE  (PEREXERCICIO =2001) AND'
      '       (PERNUMERO = 5) AND'
      '          (IDPESSOA =1) AND'
      '          (PLANO =1) AND'
      '          (PLACONTA >= '#39'0                 '#39') AND'
      '          (PLACONTA <= '#39'999999999999999999'#39')'
      'GROUP BY PLACONTA, PLANO'
      'UNION ALL'
      'SELECT PLACONTA, PLANO,'
      '       (0) AS PER1,'
      '       (0) AS PER2,'
      '       (0) AS PER3,'
      '       (0) AS PER4,'
      '       (0) AS PER5,'
      '       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER6,'
      '       (0) AS PER7,'
      '       (0) AS PER8,'
      '       (0) AS PER9,'
      '       (0) AS PER10,'
      '       (0) AS PER11,'
      '       (0) AS PER12'
      'FROM PLANOSALDO'
      'WHERE  (PEREXERCICIO =2001) AND'
      '       (PERNUMERO = 6) AND'
      '          (IDPESSOA =1) AND'
      '          (PLANO =1) AND'
      '          (PLACONTA >= '#39'0                 '#39') AND'
      '          (PLACONTA <= '#39'999999999999999999'#39')'
      'GROUP BY PLACONTA, PLANO'
      'UNION ALL'
      'SELECT PLACONTA, PLANO,'
      '       (0) AS PER1,'
      '       (0) AS PER2,'
      '       (0) AS PER3,'
      '       (0) AS PER4,'
      '       (0) AS PER5,'
      '       (0) AS PER6,'
      '       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER7,'
      '       (0) AS PER8,'
      '       (0) AS PER9,'
      '       (0) AS PER10,'
      '       (0) AS PER11,'
      '       (0) AS PER12'
      'FROM PLANOSALDO'
      'WHERE  (PEREXERCICIO =2001) AND'
      '       (PERNUMERO = 7) AND'
      '          (IDPESSOA =1) AND'
      '          (PLANO =1) AND'
      '          (PLACONTA >= '#39'0                 '#39') AND'
      '          (PLACONTA <= '#39'999999999999999999'#39')'
      'GROUP BY PLACONTA, PLANO'
      'UNION ALL'
      'SELECT PLACONTA, PLANO,'
      '       (0) AS PER1,'
      '       (0) AS PER2,'
      '       (0) AS PER3,'
      '       (0) AS PER4,'
      '       (0) AS PER5,'
      '       (0) AS PER6,'
      '       (0) AS PER7,'
      '       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER8,'
      '       (0) AS PER9,'
      '       (0) AS PER10,'
      '       (0) AS PER11,'
      '       (0) AS PER12'
      'FROM PLANOSALDO'
      'WHERE  (PEREXERCICIO =2001) AND'
      '       (PERNUMERO = 8) AND'
      '          (IDPESSOA =1) AND'
      '          (PLANO =1) AND'
      '          (PLACONTA >= '#39'0                 '#39') AND'
      '          (PLACONTA <= '#39'999999999999999999'#39')'
      'GROUP BY PLACONTA, PLANO'
      'UNION ALL'
      'SELECT PLACONTA, PLANO,'
      '       (0) AS PER1,'
      '       (0) AS PER2,'
      '       (0) AS PER3,'
      '       (0) AS PER4,'
      '       (0) AS PER5,'
      '       (0) AS PER6,'
      '       (0) AS PER7,'
      '       (0) AS PER8,'
      '       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER9,'
      '       (0) AS PER10,'
      '       (0) AS PER11,'
      '       (0) AS PER12'
      'FROM PLANOSALDO'
      'WHERE  (PEREXERCICIO =2001) AND'
      '       (PERNUMERO = 9) AND'
      '          (IDPESSOA =1) AND'
      '          (PLANO =1) AND'
      '          (PLACONTA >= '#39'0                 '#39') AND'
      '          (PLACONTA <= '#39'999999999999999999'#39')'
      'GROUP BY PLACONTA, PLANO'
      'UNION ALL'
      'SELECT PLACONTA, PLANO,'
      '       (0) AS PER1,'
      '       (0) AS PER2,'
      '       (0) AS PER3,'
      '       (0) AS PER4,'
      '       (0) AS PER5,'
      '       (0) AS PER6,'
      '       (0) AS PER7,'
      '       (0) AS PER8,'
      '       (0) AS PER9,'
      '       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER10,'
      '       (0) AS PER11,'
      '       (0) AS PER12'
      'FROM PLANOSALDO'
      'WHERE  (PEREXERCICIO =2001) AND'
      '       (PERNUMERO = 10) AND'
      '          (IDPESSOA =1) AND'
      '          (PLANO =1) AND'
      '          (PLACONTA >= '#39'0                 '#39') AND'
      '          (PLACONTA <= '#39'999999999999999999'#39')'
      'GROUP BY PLACONTA, PLANO'
      'UNION ALL'
      'SELECT PLACONTA, PLANO,'
      '       (0) AS PER1,'
      '       (0) AS PER2,'
      '       (0) AS PER3,'
      '       (0) AS PER4,'
      '       (0) AS PER5,'
      '       (0) AS PER6,'
      '       (0) AS PER7,'
      '       (0) AS PER8,'
      '       (0) AS PER9,'
      '       (0) AS PER10,'
      '       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER11,'
      '       (0) AS PER12'
      'FROM PLANOSALDO'
      'WHERE  (PEREXERCICIO =2001) AND'
      '       (PERNUMERO = 11) AND'
      '          (IDPESSOA =1) AND'
      '          (PLANO =1) AND'
      '          (PLACONTA >= '#39'0                 '#39') AND'
      '          (PLACONTA <= '#39'999999999999999999'#39')'
      'GROUP BY PLACONTA, PLANO'
      'UNION ALL'
      'SELECT PLACONTA, PLANO,'
      '       (0) AS PER1,'
      '       (0) AS PER2,'
      '       (0) AS PER3,'
      '       (0) AS PER4,'
      '       (0) AS PER5,'
      '       (0) AS PER6,'
      '       (0) AS PER7,'
      '       (0) AS PER8,'
      '       (0) AS PER9,'
      '       (0) AS PER10,'
      '       (0) AS PER11,'
      '       SUM(PLSDEBITOCORRENTE-PLSCREDITOCOR) AS PER12'
      'FROM PLANOSALDO'
      'WHERE  (PEREXERCICIO =2001) AND'
      '       (PERNUMERO = 12) AND'
      '          (IDPESSOA =1) AND'
      '          (PLANO =1) AND'
      '          (PLACONTA >= '#39'0                 '#39') AND'
      '          (PLACONTA <= '#39'999999999999999999'#39')'
      'GROUP BY PLACONTA, PLANO'
      ') U,'
      'PLANOCONTA C'
      'WHERE (U.PLACONTA = C.PLACONTA)'
      '  AND (U.PLANO = C.PLANO)'
      '  AND (C.PLAGRAU <= 6)'
      'GROUP BY U.PLACONTA, C.PLANOME, C.PLAGRAU,'
      '         C.PLANOMEOUTLING,  C.PLANATUREZA ) UU'
      'ORDER BY UU.PLACONTA')
    ClientDataSet = CdsBalancete
    Left = 112
    Top = 184
  end
  object CdsBalancete: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 272
  end
  object sqlAux: TCMSqlParams
    ClientDataSet = cdsAux
    Left = 232
    Top = 216
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 224
  end
  object sqlTitulos: TCMSqlParams
    ClientDataSet = cdsTitulos
    Left = 232
    Top = 136
  end
  object sqlEmpresaProp: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   I.IMAGEM'
      'FROM'
      '   PESSOA P, IMAGENS I'
      'WHERE'
      '   P.IDPESSOA =:IDPESSOA AND'
      '   P.IDIMAGEM = I.IDIMAGEM(+)'
      '')
    ClientDataSet = cdsEmpresaProp
    Left = 176
    Top = 18
  end
  object cdsEmpresaProp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 19
  end
  object dsEmpresaProp: TwwDataSource
    DataSet = cdsEmpresaProp
    Left = 176
    Top = 73
  end
  object pplEmpresaProp: TppBDEPipeline
    DataSource = dsEmpresaProp
    UserName = 'lEmpresaProp'
    Left = 240
    Top = 72
  end
  object cdsTitulos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 136
  end
  object cdsTot: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 208
  end
  object sqlTot: TCMSqlParams
    ClientDataSet = cdsTot
    Left = 32
    Top = 256
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 192
  end
  object sqlPatro: TCMSqlParams
    ClientDataSet = cdsPatro
    Left = 368
    Top = 136
  end
  object sqlPlanoPrev: TCMSqlParams
    ClientDataSet = cdsPlano
    Left = 368
    Top = 80
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 248
  end
end
