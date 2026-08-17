inherited rptBalanceteColMesCC: TrptBalanceteColMesCC
  Left = 248
  Top = 173
  Width = 493
  Height = 361
  Caption = 'Balancete Colunado por Centro de Custo'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Balancete Colunado por Centro de Custo'
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
        Caption = 'Data Limite'
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
        Name = 'Data Limite'
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
        Caption = 'Imprime com Centavos'
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
        Name = 'Imprime com Centavos'
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
        Caption = 'Imprimir Número da Conta'
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
        Name = 'Imprimir Número da Conta'
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
        Caption = 'Desconsiderar Encerramento de Resultado'
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
    OnParamControlEnter = CmpRptCMParamControlEnter
    Formheight = 560
    Left = 148
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptBalanceteColMesCC
    LabelEmpresa = LblEmpresa
    LabelSistema = lblsistema
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 88
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 88
  end
  object sqlPlanoPrev: TCMSqlParams
    ClientDataSet = cdsPlano
    Left = 168
    Top = 88
  end
  object sqlPatro: TCMSqlParams
    ClientDataSet = cdsPatro
    Left = 232
    Top = 88
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
  object sqlTitulos: TCMSqlParams
    ClientDataSet = cdsTitulos
    Left = 232
    Top = 152
  end
  object cdsTitulos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 160
    Top = 152
  end
  object cdsAux1: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 8
  end
  object sqlAux1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   PERNUMERO'
      'FROM '
      '   PERIODO '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND '
      '   (PEREXERCICIO=:PEREXERCICIO) AND '
      '   (PERNUMERO BETWEEN :PERNUMEROINI AND :PERNUMEROFIM) AND '
      '   ((PERBLOQUE IS NULL) OR (PERBLOQUE = '#39'N'#39'))')
    ClientDataSet = cdsAux1
    Left = 320
    Top = 8
  end
  object rptBalanceteColMesCC: TppReport
    AutoStop = False
    DataPipeline = pplBalanceteColMesCC
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
    Left = 394
    Top = 238
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplBalanceteColMesCC'
    object ppHeaderBand17: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41275
      mmPrintPosition = 0
      object ppLine37: TppLine
        UserName = 'ppLine60'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1852
        mmLeft = 0
        mmTop = 32808
        mmWidth = 284300
        BandType = 0
      end
      object pplPer1Col: TppLabel
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
      object pplPer2Col: TppLabel
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
      object pplPer3Col: TppLabel
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
      object pplPer4Col: TppLabel
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
      object pplPer5Col: TppLabel
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
      object pplPer6Col: TppLabel
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
      object pplPer7Col: TppLabel
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
      object pplPer8Col: TppLabel
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
      object ppDBImage2: TppDBImage
        UserName = 'ppDBImage2'
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
      object pplPer9Col: TppLabel
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
      object pplPer10Col: TppLabel
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
      object pplPer11Col: TppLabel
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
      object pplPer12Col: TppLabel
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
      object ppLabel75Col: TppLabel
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
      object LblEmpresa: TppLabel
        UserName = 'lblEmpresa'
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
      object pplTituloCol: TppLabel
        UserName = 'pplTituloCol'
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
      object lblFiltroCol2: TppLabel
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
      object lblFiltroCol1: TppLabel
        UserName = 'lblFiltroCol1'
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
      object ppLine42: TppLine
        UserName = 'Line42'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 40746
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object dbpplPer1Col: TppDBText
        UserName = 'DBText1'
        DataField = 'PER1'
        DataPipeline = pplBalanceteColMesCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalanceteColMesCC'
        mmHeight = 3175
        mmLeft = 50006
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer2Col: TppDBText
        UserName = 'dbpplPer2Col'
        DataField = 'PER2'
        DataPipeline = pplBalanceteColMesCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalanceteColMesCC'
        mmHeight = 3175
        mmLeft = 67469
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer3Col: TppDBText
        UserName = 'dbpplPer3Col'
        DataField = 'PER3'
        DataPipeline = pplBalanceteColMesCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalanceteColMesCC'
        mmHeight = 3175
        mmLeft = 84931
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer4Col: TppDBText
        UserName = 'DBText101'
        DataField = 'PER4'
        DataPipeline = pplBalanceteColMesCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalanceteColMesCC'
        mmHeight = 3175
        mmLeft = 102394
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer5Col: TppDBText
        UserName = 'dbpplPer5Col'
        DataField = 'PER5'
        DataPipeline = pplBalanceteColMesCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalanceteColMesCC'
        mmHeight = 3175
        mmLeft = 119856
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer6Col: TppDBText
        UserName = 'dbpplPer6Col'
        DataField = 'PER6'
        DataPipeline = pplBalanceteColMesCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalanceteColMesCC'
        mmHeight = 3175
        mmLeft = 137319
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer7Col: TppDBText
        UserName = 'dbpplPer7Col'
        DataField = 'PER7'
        DataPipeline = pplBalanceteColMesCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalanceteColMesCC'
        mmHeight = 3175
        mmLeft = 154782
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer8Col: TppDBText
        UserName = 'dbpplPer8Col'
        DataField = 'PER8'
        DataPipeline = pplBalanceteColMesCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalanceteColMesCC'
        mmHeight = 3175
        mmLeft = 172244
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer9Col: TppDBText
        UserName = 'dbpplPer9Col'
        DataField = 'PER9'
        DataPipeline = pplBalanceteColMesCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalanceteColMesCC'
        mmHeight = 3175
        mmLeft = 189707
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer10Col: TppDBText
        UserName = 'dbpplPer10Col'
        DataField = 'PER10'
        DataPipeline = pplBalanceteColMesCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalanceteColMesCC'
        mmHeight = 3175
        mmLeft = 207169
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer11Col: TppDBText
        UserName = 'dbpplPer11Col'
        DataField = 'PER11'
        DataPipeline = pplBalanceteColMesCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalanceteColMesCC'
        mmHeight = 3175
        mmLeft = 224632
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPer12Col: TppDBText
        UserName = 'dbpplPer12Col'
        DataField = 'PER12'
        DataPipeline = pplBalanceteColMesCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalanceteColMesCC'
        mmHeight = 3175
        mmLeft = 242094
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object dbpplPerTotCol: TppDBText
        UserName = 'dbpplPerTotCol'
        DataField = 'TOTPER'
        DataPipeline = pplBalanceteColMesCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalanceteColMesCC'
        mmHeight = 3175
        mmLeft = 259821
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'NOME'
        DataPipeline = pplBalanceteColMesCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplBalanceteColMesCC'
        mmHeight = 3175
        mmLeft = 3969
        mmTop = 529
        mmWidth = 44186
        BandType = 4
      end
    end
    object ppFooterBand17: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 20108
      mmPrintPosition = 0
      object ppLine41: TppLine
        UserName = 'ppLine37'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object lblsistema: TppLabel
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
        mmWidth = 197909
        BandType = 8
      end
      object Col19: TppSystemVariable
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
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppGroup6: TppGroup
      BreakName = 'PLACONTA'
      DataPipeline = pplBalanceteColMesCC
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplBalanceteColMesCC'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText8: TppDBText
          UserName = 'rptBalanceteColMesCCDBText1'
          DataField = 'PLANOME'
          DataPipeline = pplBalanceteColMesCC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplBalanceteColMesCC'
          mmHeight = 3175
          mmLeft = 38894
          mmTop = 1058
          mmWidth = 44186
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'PLACONTA'
          DataPipeline = pplBalanceteColMesCC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplBalanceteColMesCC'
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 1058
          mmWidth = 35454
          BandType = 3
          GroupNo = 0
        end
        object ppLine40: TppLine
          UserName = 'ppLine61'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'PER1'
          DataPipeline = pplBalanceteColMesCC
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBalanceteColMesCC'
          mmHeight = 3175
          mmLeft = 50006
          mmTop = 1058
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object ppLabel64: TppLabel
          UserName = 'Label1'
          Caption = 'Total da Conta:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 25135
          mmTop = 1323
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object ppLine43: TppLine
          UserName = 'Line43'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'PER2'
          DataPipeline = pplBalanceteColMesCC
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBalanceteColMesCC'
          mmHeight = 3175
          mmLeft = 67469
          mmTop = 1058
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'PER3'
          DataPipeline = pplBalanceteColMesCC
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBalanceteColMesCC'
          mmHeight = 3175
          mmLeft = 84931
          mmTop = 1058
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'PER4'
          DataPipeline = pplBalanceteColMesCC
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBalanceteColMesCC'
          mmHeight = 3175
          mmLeft = 102394
          mmTop = 1058
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'PER5'
          DataPipeline = pplBalanceteColMesCC
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBalanceteColMesCC'
          mmHeight = 3175
          mmLeft = 119856
          mmTop = 1058
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'PER6'
          DataPipeline = pplBalanceteColMesCC
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBalanceteColMesCC'
          mmHeight = 3175
          mmLeft = 137319
          mmTop = 1058
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'PER7'
          DataPipeline = pplBalanceteColMesCC
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBalanceteColMesCC'
          mmHeight = 3175
          mmLeft = 154782
          mmTop = 1058
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'PER8'
          DataPipeline = pplBalanceteColMesCC
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBalanceteColMesCC'
          mmHeight = 3175
          mmLeft = 172244
          mmTop = 1058
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'PER9'
          DataPipeline = pplBalanceteColMesCC
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBalanceteColMesCC'
          mmHeight = 3175
          mmLeft = 189707
          mmTop = 1058
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'PER10'
          DataPipeline = pplBalanceteColMesCC
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBalanceteColMesCC'
          mmHeight = 3175
          mmLeft = 207169
          mmTop = 1058
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'PER11'
          DataPipeline = pplBalanceteColMesCC
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBalanceteColMesCC'
          mmHeight = 3175
          mmLeft = 224632
          mmTop = 1058
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'PER12'
          DataPipeline = pplBalanceteColMesCC
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBalanceteColMesCC'
          mmHeight = 3175
          mmLeft = 242094
          mmTop = 1058
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'TOTPER'
          DataPipeline = pplBalanceteColMesCC
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplBalanceteColMesCC'
          mmHeight = 3175
          mmLeft = 259821
          mmTop = 1058
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object pplBalanceteColMesCC: TppBDEPipeline
    DataSource = dsBalanceteColMesCC
    UserName = 'lBalanceteColMesCC'
    Left = 286
    Top = 238
    object pplBalanceteColMesCCppField1: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField2: TppField
      FieldAlias = 'PLANOME'
      FieldName = 'PLANOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField3: TppField
      FieldAlias = 'PLANOMEOUTLING'
      FieldName = 'PLANOMEOUTLING'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField4: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField5: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField6: TppField
      FieldAlias = 'NOMEINDENTADO'
      FieldName = 'NOMEINDENTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField7: TppField
      FieldAlias = 'PER1'
      FieldName = 'PER1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField8: TppField
      FieldAlias = 'PER2'
      FieldName = 'PER2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField9: TppField
      FieldAlias = 'PER3'
      FieldName = 'PER3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField10: TppField
      FieldAlias = 'PER4'
      FieldName = 'PER4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField11: TppField
      FieldAlias = 'PER5'
      FieldName = 'PER5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField12: TppField
      FieldAlias = 'PER6'
      FieldName = 'PER6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField13: TppField
      FieldAlias = 'PER7'
      FieldName = 'PER7'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField14: TppField
      FieldAlias = 'PER8'
      FieldName = 'PER8'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField15: TppField
      FieldAlias = 'PER9'
      FieldName = 'PER9'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField16: TppField
      FieldAlias = 'PER10'
      FieldName = 'PER10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField17: TppField
      FieldAlias = 'PER11'
      FieldName = 'PER11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField18: TppField
      FieldAlias = 'PER12'
      FieldName = 'PER12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplBalanceteColMesCCppField19: TppField
      FieldAlias = 'TOTPER'
      FieldName = 'TOTPER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
  end
  object dsBalanceteColMesCC: TwwDataSource
    DataSet = cdsBalanceteColMesCC
    Left = 166
    Top = 238
  end
  object sqlBalanceteColMesCC: TCMSqlParams
    SQL.Strings = (
      
        'SELECT UU.PLACONTA, UU.PLANOME, UU.PLANOMEOUTLING, UU.CODCENTROC' +
        'USTO, UU.NOME,'
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
      
        'SELECT U.PLACONTA, C.PLANOME, C.PLANOMEOUTLING, CC.CODCENTROCUST' +
        'O, CC.NOME,'
      
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
      'SELECT PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA,'
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
      'GROUP BY PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA'
      'UNION ALL'
      'SELECT PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA,'
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
      'GROUP BY PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA'
      'UNION ALL'
      'SELECT PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA,'
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
      'GROUP BY PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA'
      'UNION ALL'
      'SELECT PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA,'
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
      'GROUP BY PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA'
      'UNION ALL'
      'SELECT PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA,'
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
      'GROUP BY PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA'
      'UNION ALL'
      'SELECT PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA,'
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
      'GROUP BY PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA'
      'UNION ALL'
      'SELECT PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA,'
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
      'GROUP BY PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA'
      'UNION ALL'
      'SELECT PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA,'
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
      'GROUP BY PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA'
      'UNION ALL'
      'SELECT PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA,'
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
      'GROUP BY PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA'
      'UNION ALL'
      'SELECT PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA,'
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
      'GROUP BY PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA'
      'UNION ALL'
      'SELECT PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA,'
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
      'GROUP BY PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA'
      'UNION ALL'
      'SELECT PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA,'
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
      'GROUP BY PLACONTA, PLANO, CODCENTROCUSTO, IDEMPRESA'
      ') U,'
      'PLANOCONTA C, CENTCUST CC'
      'WHERE (U.PLACONTA = C.PLACONTA)'
      '  AND (U.PLANO = C.PLANO)'
      '  AND (U.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '  AND (U.IDEMPRESA = CC.IDEMPRESA)'
      '  AND (C.PLAGRAU <= 6)'
      
        'GROUP BY U.PLACONTA, C.PLANOME, C.PLAGRAU, CC.CODCENTROCUSTO, CC' +
        '.NOME,'
      '         C.PLANOMEOUTLING,  C.PLANATUREZA ) UU'
      'ORDER BY UU.PLACONTA, UU.CODCENTROCUSTO')
    ClientDataSet = cdsBalanceteColMesCC
    Left = 224
    Top = 288
  end
  object cdsBalanceteColMesCC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 240
  end
  object dsEmpresaProp: TwwDataSource
    DataSet = cdsEmpresaProp
    Left = 336
    Top = 97
  end
  object pplEmpresaProp: TppBDEPipeline
    DataSource = dsEmpresaProp
    UserName = 'lEmpresaProp'
    Left = 392
    Top = 96
  end
  object cdsEmpresaProp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 147
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
    Left = 336
    Top = 146
  end
end
