inherited rptBalanceteAnalAPCC: TrptBalanceteAnalAPCC
  Left = 366
  Top = 293
  Width = 412
  Height = 275
  Caption = 'Balancete Analítico de Centros de Custo por Atividade/Projeto'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Balancete Analítico de Centros de Custo por Atividade/Projeto'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Exercício'
        Controle = tcLookupCombo
        TipodeDado = tdString
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
        TipodeDado = tdString
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
        TipodeDado = tdString
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
        Caption = 'Atividade/Projeto Inicial'
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
        Name = 'Atividade/Projeto Inicial'
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
        Caption = 'Atividade/Projeto Final'
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
        Name = 'Atividade/Projeto Final'
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
        Caption = 'Imprimir em outro Idioma'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'false'
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
        Caption = 'Indenta Contas'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'false'
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
        Caption = 'Imprime Saldos das Ativ./Proj. somente nas Contas Analíticas'
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
        Name = 'Imprime Saldos das Ativ./Proj. somente nas Contas Analíticas'
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
        Caption = 'Imprime a Atividade/Projeto Sintética'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'false'
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
        Name = 'Imprime a Atividade/Projeto Sintética'
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
        Width = 260
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
        Width = 260
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
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    OnParamControlExit = CmpRptCMParamControlExit
    OnParamControlEnter = CmpRptCMParamControlEnter
    Formheight = 500
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rptBalAnalAPCC
    LabelEmpresa = LblEmpresa
    LabelSistema = lblSistema
  end
  object dsBalAnalAPCC: TwwDataSource
    DataSet = cdsBalAnalAPCC
    Left = 109
    Top = 88
  end
  object pplBalAnalAPCC: TppBDEPipeline
    DataSource = dsBalAnalAPCC
    UserName = 'lBalAnalAPCC'
    Left = 285
    Top = 88
    object pplBalAnalAPCCppField1: TppField
      FieldAlias = 'CODEXTERNO'
      FieldName = 'CODEXTERNO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object pplBalAnalAPCCppField2: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 1
    end
    object pplBalAnalAPCCppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLAGRAU'
      FieldName = 'PLAGRAU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplBalAnalAPCCppField4: TppField
      FieldAlias = 'PLATIPO'
      FieldName = 'PLATIPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object pplBalAnalAPCCppField5: TppField
      FieldAlias = 'PLACONCORRESP'
      FieldName = 'PLACONCORRESP'
      FieldLength = 18
      DisplayWidth = 18
      Position = 4
    end
    object pplBalAnalAPCCppField6: TppField
      FieldAlias = 'PLANATUREZA'
      FieldName = 'PLANATUREZA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object pplBalAnalAPCCppField7: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object pplBalAnalAPCCppField8: TppField
      FieldAlias = 'DEBCREANT'
      FieldName = 'DEBCREANT'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
    object pplBalAnalAPCCppField9: TppField
      FieldAlias = 'DEBCRESALDO'
      FieldName = 'DEBCRESALDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object pplBalAnalAPCCppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOABS'
      FieldName = 'SALDOABS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplBalAnalAPCCppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANTABS'
      FieldName = 'SALDOANTABS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplBalAnalAPCCppField12: TppField
      FieldAlias = 'NOMEINDENTADO'
      FieldName = 'NOMEINDENTADO'
      FieldLength = 150
      DisplayWidth = 150
      Position = 11
    end
    object pplBalAnalAPCCppField13: TppField
      FieldAlias = 'CONTA'
      FieldName = 'CONTA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 12
    end
    object pplBalAnalAPCCppField14: TppField
      FieldAlias = 'PLANOMEOUTLING'
      FieldName = 'PLANOMEOUTLING'
      FieldLength = 40
      DisplayWidth = 40
      Position = 13
    end
    object pplBalAnalAPCCppField15: TppField
      FieldAlias = 'PLANOME'
      FieldName = 'PLANOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
    object pplBalAnalAPCCppField16: TppField
      FieldAlias = 'NOMECC'
      FieldName = 'NOMECC'
      FieldLength = 30
      DisplayWidth = 30
      Position = 15
    end
    object pplBalAnalAPCCppField17: TppField
      FieldAlias = 'UNECODIGO'
      FieldName = 'UNECODIGO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 16
    end
    object pplBalAnalAPCCppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'UNIDNEGOC'
      FieldName = 'UNIDNEGOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplBalAnalAPCCppField19: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 25
      DisplayWidth = 25
      Position = 18
    end
    object pplBalAnalAPCCppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEB'
      FieldName = 'DEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplBalAnalAPCCppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'CRED'
      FieldName = 'CRED'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplBalAnalAPCCppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV'
      FieldName = 'MOV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplBalAnalAPCCppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANT'
      FieldName = 'SALDOANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplBalAnalAPCCppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
  end
  object rptBalAnalAPCC: TppReport
    AutoStop = False
    DataPipeline = pplBalAnalAPCC
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
    Left = 333
    Top = 88
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplBalAnalAPCC'
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object pplblTituloBalAnalAPCC: TppLabel
        UserName = 'pplblTituloBalAnalAPCC'
        Caption = 'Balancete Analítico por Centros de Custo e Atividade/Projeto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 80963
        mmTop = 8731
        mmWidth = 122767
        BandType = 0
      end
      object rptBalAnalAPCCLine1: TppLine
        UserName = 'rptBalAnalAPCCLine1'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19315
        mmWidth = 284300
        BandType = 0
      end
      object rptBalAnalAPCCLine2: TppLine
        UserName = 'rptBalAnalAPCCLine2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27252
        mmWidth = 284300
        BandType = 0
      end
      object rptBalAnalAPCCLabel2: TppLabel
        UserName = 'rptBalAnalAPCCLabel2'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 38894
        mmTop = 22225
        mmWidth = 8467
        BandType = 0
      end
      object pplblTituloBalAnalAPCC2: TppLabel
        UserName = 'pplblTituloBalAnalAPCC2'
        Caption = 'ppLblTitulo2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 14552
        mmWidth = 15081
        BandType = 0
      end
      object rptBalAnalAPCCLabel4: TppLabel
        UserName = 'rptBalAnalAPCCLabel4'
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 166423
        mmTop = 21960
        mmWidth = 20902
        BandType = 0
      end
      object rptBalAnalAPCCLabel5: TppLabel
        UserName = 'rptBalAnalAPCCLabel5'
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
      object rptBalAnalAPCCLabel6: TppLabel
        UserName = 'rptBalAnalAPCCLabel6'
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 104511
        mmTop = 22225
        mmWidth = 24077
        BandType = 0
      end
      object rptBalAnalAPCCLabel7: TppLabel
        UserName = 'rptBalAnalAPCCLabel7'
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 209021
        mmTop = 21960
        mmWidth = 9260
        BandType = 0
      end
      object rptBalAnalAPCCLabel8: TppLabel
        UserName = 'rptBalAnalAPCCLabel8'
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 234421
        mmTop = 21960
        mmWidth = 10848
        BandType = 0
      end
      object rptBalAnalAPCCLabel9: TppLabel
        UserName = 'rptBalAnalAPCCLabel9'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 255853
        mmTop = 21960
        mmWidth = 16140
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
    end
    object ppDetailBand7: TppDetailBand
      BeforeGenerate = ppDetailBand7BeforeGenerate
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object rptBalAnalAPCCDBText12: TppDBText
        UserName = 'rptBalAnalAPCCDBText12'
        DataField = 'NOME'
        DataPipeline = pplBalAnalAPCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplBalAnalAPCC'
        mmHeight = 3704
        mmLeft = 121709
        mmTop = 794
        mmWidth = 38365
        BandType = 4
      end
      object dbtxtContaBalAPCC: TppDBText
        UserName = 'dbtxtContaBalAPCC'
        DataField = 'PLACONTA'
        DataPipeline = pplBalAnalAPCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'pplBalAnalAPCC'
        mmHeight = 3704
        mmLeft = 4498
        mmTop = 794
        mmWidth = 32544
        BandType = 4
      end
      object dbtxtNomeContaBalAPCC: TppDBText
        UserName = 'dbtxtNomeContaBalAPCC'
        DataField = 'NOMEINDENTADO'
        DataPipeline = pplBalAnalAPCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'pplBalAnalAPCC'
        mmHeight = 3704
        mmLeft = 38629
        mmTop = 794
        mmWidth = 63500
        BandType = 4
      end
      object dbtxtCCBalAPCC: TppDBText
        UserName = 'dbtxtCCBalAPCC'
        DataField = 'CODEXTERNO'
        DataPipeline = pplBalAnalAPCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'pplBalAnalAPCC'
        mmHeight = 3704
        mmLeft = 103981
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object dbtxtNomeCCBalAPCC: TppDBText
        UserName = 'dbtxtNomeCCBalAPCC'
        DataField = 'NOMECC'
        DataPipeline = pplBalAnalAPCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'pplBalAnalAPCC'
        mmHeight = 3704
        mmLeft = 118798
        mmTop = 794
        mmWidth = 41540
        BandType = 4
      end
      object rptBalAnalAPCCDBText5: TppDBText
        UserName = 'rptBalAnalAPCCDBText5'
        DataField = 'SALDOANTABS'
        DataPipeline = pplBalAnalAPCC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalAnalAPCC'
        mmHeight = 3704
        mmLeft = 162190
        mmTop = 794
        mmWidth = 25135
        BandType = 4
      end
      object rptBalAnalAPCCDBText6: TppDBText
        UserName = 'rptBalAnalAPCCDBText6'
        DataField = 'DEB'
        DataPipeline = pplBalAnalAPCC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalAnalAPCC'
        mmHeight = 3704
        mmLeft = 193146
        mmTop = 794
        mmWidth = 25135
        BandType = 4
      end
      object rptBalAnalAPCCDBText7: TppDBText
        UserName = 'rptBalAnalAPCCDBText7'
        DataField = 'CRED'
        DataPipeline = pplBalAnalAPCC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalAnalAPCC'
        mmHeight = 3704
        mmLeft = 220134
        mmTop = 794
        mmWidth = 25135
        BandType = 4
      end
      object rptBalAnalAPCCDBText8: TppDBText
        UserName = 'rptBalAnalAPCCDBText8'
        DataField = 'SALDOABS'
        DataPipeline = pplBalAnalAPCC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBalAnalAPCC'
        mmHeight = 3704
        mmLeft = 246857
        mmTop = 794
        mmWidth = 25135
        BandType = 4
      end
      object rptBalAnalAPCCDBText9: TppDBText
        UserName = 'rptBalAnalAPCCDBText9'
        DataField = 'DEBCRESALDO'
        DataPipeline = pplBalAnalAPCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplBalAnalAPCC'
        mmHeight = 3704
        mmLeft = 272521
        mmTop = 794
        mmWidth = 3969
        BandType = 4
      end
      object rptBalAnalAPCCDBText10: TppDBText
        UserName = 'rptBalAnalAPCCDBText10'
        DataField = 'DEBCREANT'
        DataPipeline = pplBalAnalAPCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplBalAnalAPCC'
        mmHeight = 3704
        mmLeft = 187855
        mmTop = 794
        mmWidth = 3440
        BandType = 4
      end
      object dbtxtAPBalAPCC: TppDBText
        UserName = 'dbtxtAPBalAPCC'
        DataField = 'UNECODIGO'
        DataPipeline = pplBalAnalAPCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplBalAnalAPCC'
        mmHeight = 3704
        mmLeft = 107421
        mmTop = 794
        mmWidth = 13494
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11906
      mmPrintPosition = 0
      object ppLine31: TppLine
        UserName = 'ppLine31'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object rptBalAnalAPCCLabel10: TppLabel
        UserName = 'rptBalAnalAPCCLabel10'
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
      object lblContBalAPCC: TppLabel
        UserName = 'lblContBalAPCC'
        AutoSize = False
        Caption = 'lblContBalAPCC'
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
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 239448
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object lblCalcBalAPCC: TppSystemVariable
        UserName = 'lblCalcBalAPCC1'
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
    object rptBalAnalAPCCGroup1: TppGroup
      BreakName = 'PLACONTA'
      DataPipeline = pplBalAnalAPCC
      OutlineSettings.CreateNode = True
      UserName = 'rptBalAnalAPCCGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplBalAnalAPCC'
      object rptBalAnalAPCCGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rptBalAnalAPCCGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1588
        mmPrintPosition = 0
        object rptBalAnalAPCCLine3: TppLine
          UserName = 'rptBalAnalAPCCLine3'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 4763
          mmTop = 529
          mmWidth = 272257
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object cdsBalAnalAPCC: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 88
    Data = {
      3E0300009619E0BD0100000018000000180000000000030000003E030A434F44
      45585445524E4F01004900000002000753554254595045020049000A00466978
      65644368617200055749445448020002000A0008504C41434F4E544101004900
      000002000753554254595045020049000A004669786564436861720005574944
      544802000200120007504C4147524155080004000000000007504C415449504F
      01004900000002000753554254595045020049000A0046697865644368617200
      0557494454480200020001000D504C41434F4E434F5252455350010049000000
      01000557494454480200020012000B504C414E41545552455A41010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      0200020001000E434F4443454E54524F435553544F0100490000000100055749
      445448020002000A0009444542435245414E5401004900000002000753554254
      595045020049000A00466978656443686172000557494454480200020001000B
      44454243524553414C444F01004900000002000753554254595045020049000A
      00466978656443686172000557494454480200020001000853414C444F414253
      08000400000000000B53414C444F414E5441425308000400000000000D4E4F4D
      45494E44454E5441444F01004900000002000753554254595045020049000A00
      4669786564436861720005574944544802000200960005434F4E544101004900
      00000100055749445448020002003C000E504C414E4F4D454F55544C494E4701
      0049000000010005574944544802000200280007504C414E4F4D450100490000
      000100055749445448020002003C00064E4F4D45434301004900000001000557
      49445448020002001E0009554E45434F4449474F010049000000010005574944
      5448020002000A0009554E49444E45474F430800040000000000044E4F4D4501
      0049000000010005574944544802000200190003444542080004000000000004
      435245440800040000000000034D4F5608000400000000000853414C444F414E
      5408000400000000000553414C444F080004000000000002000D44454641554C
      545F4F524445520200820003000000020010001100044C434944040001000908
      0000}
  end
  object sqlBalAnalAPCC: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */                                        '
      
        '   CodExterno, PLACONTA, PLAGRAU, PLATIPO, PLACONCORRESP, PLANAT' +
        'UREZA, CODCENTROCUSTO,        '
      
        '   ('#39' '#39') AS DEBCREANT, ('#39' '#39') AS DEBCRESALDO, (0) AS SALDOABS, (0' +
        ') AS SALDOANTABS,  '
      
        '   ('#39'12345678901234567890123456789012345678901234567890123456789' +
        '0123456789012345678901234567890123456789012345678901234567890123' +
        '456789012345678901234567890'#39') AS NOMEINDENTADO,  '
      
        '   CONTA, PLANOMEOUTLING, PLANOME, NOMECC, UNECODIGO, UNIDNEGOC,' +
        ' NOME, DEB, CRED, MOV,  '
      '   SALDOANT, SALDO FROM (                                   '
      '   SELECT                                                      '
      
        '     cc.codexterno, C.PLACONTA, C.PLAGRAU,                      ' +
        '             '
      
        '     C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, S.CODCENTROCUSTO' +
        ',        '
      
        '     DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PL' +
        'ANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PL' +
        'ANOME, '
      
        '     CC.NOME AS NOMECC, ('#39'         '#39') AS UNECODIGO, (0) AS UNIDN' +
        'EGOC, ('#39'                         '#39') AS NOME, '
      '     M.DEB,M.CRED,M.MOV, SA.SALDOANT, '
      
        '     SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENT' +
        'E) '
      
        '     - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SAL' +
        'DO '
      
        '   FROM                                                         ' +
        '    '
      
        '     PLANOSALDO S, PLANOCONTA C, CENTCUST CC,                   ' +
        '   '
      
        '       (SELECT P.PLANOME, P.PLACONTA, P.PLANO, P.PLATIPO, P.PLAI' +
        'NATIVA'
      '        FROM  PLANOCONTAPER P,'
      '          (SELECT'
      '             PLACONTA, PLANO,'
      
        '             MIN(TO_CHAR(PEREXERCICIO)||DECODE(LENGTH(NVL(PERNUM' +
        'ERO,0)),1,'#39'0'#39'||'
      
        '             TO_CHAR(NVL(PERNUMERO,0)),TO_CHAR(NVL(PERNUMERO,0))' +
        ')) AS PERNUMERO'
      '           FROM PLANOCONTAPER'
      '           WHERE'
      
        '            (TO_CHAR(PEREXERCICIO)||DECODE(LENGTH(NVL(PERNUMERO,' +
        '0)),1,'#39'0'#39'||TO_CHAR(NVL(PERNUMERO,0)),'
      '             TO_CHAR(NVL(PERNUMERO,0))) >= '#39'200504'#39')'
      '             AND (IDPESSOA = 1)'
      '           GROUP BY'
      '             PLACONTA, PLANO) PX'
      '        WHERE'
      '           (P.PLACONTA = PX.PLACONTA)     AND'
      '           (P.plano= PX.PLANO)           AND'
      '           (P.IDPESSOA = 1)     AND'
      
        '           (TO_CHAR(P.PEREXERCICIO)||DECODE(LENGTH(NVL(P.PERNUME' +
        'RO,0)),1,'#39'0'#39'||'
      
        '            TO_CHAR(NVL(P.PERNUMERO,0)),TO_CHAR(NVL(P.PERNUMERO,' +
        '0))) = PX.PERNUMERO))  PD, '
      '        (SELECT '
      '              PLACONTA, CODCENTROCUSTO,'
      
        '                     SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSD' +
        'EBITOCORRENTE) '
      
        '                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCO' +
        'R)) AS SALDOANT          '
      '           FROM PLANOSALDO '
      '           WHERE (PLANO =4) AND  '
      '         (PEREXERCICIO =2005) AND '
      '         ((PERNUMERO <4) OR (PERNUMERO IS NULL)) AND  '
      '--       (RTRIM(CODCENTROCUSTO) >= RTRIM('#39'0101'#39') AND '
      '--       (IDEMPRESA =1)) AND  '
      '--       (RTRIM(CODCENTROCUSTO) <= RTRIM('#39'0115'#39') AND '
      '--       (IDEMPRESA =1)) AND  '
      '         (IDPESSOA =1)  '
      '   GROUP BY PLACONTA,CODCENTROCUSTO ) SA, '
      '   (SELECT  '
      '       PLACONTA,CODCENTROCUSTO, '
      '       SUM(PLSDEBITOCORRENTE) AS DEB, '
      '       SUM(PLSCREDITOCOR) AS CRED, '
      '       (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV '
      '    FROM PLANOSALDO    '
      '    WHERE (PLANO =4) AND '
      '          (PERNUMERO(+) BETWEEN 4 AND 5) AND '
      '          (PEREXERCICIO =2005) AND  '
      '  --     (RTRIM(CODCENTROCUSTO) >= RTRIM('#39'0101'#39') AND '
      '--       (IDEMPRESA =1)) AND  '
      '  --     (RTRIM(CODCENTROCUSTO) <= RTRIM('#39'0115'#39') AND '
      '--       (IDEMPRESA =1)) and'
      '          (IDPESSOA =1) '
      '    GROUP BY PLACONTA, CODCENTROCUSTO ) M  '
      'WHERE  '
      '-- (RTRIM(S.CODCENTROCUSTO(+)) >= RTRIM('#39'0101'#39') AND '
      '-- (S.IDEMPRESA(+) =1)) AND '
      ' --(RTRIM(S.CODCENTROCUSTO(+)) <= RTRIM('#39'0115'#39') AND  '
      '-- (S.IDEMPRESA(+) =1)) AND '
      '    (cc.idplancentcust = 1 ) and'
      
        '    (cc.codexterno between '#39'0101'#39' and '#39'0115'#39') and               ' +
        '        '
      ''
      '    (S.PLANO =4) AND                         '
      '    (S.PEREXERCICIO(+) =2005) AND           '
      '    ((S.PERNUMERO <=4) OR (S.PERNUMERO IS NULL)) AND  '
      '    (S.IDPESSOA =1) AND                   '
      '    (S.IDPESSOA(+) =1) AND                '
      '    (RTRIM(C.PLACONTA) >= RTRIM('#39'0'#39')) AND   '
      '    (RTRIM(C.PLACONTA) <= RTRIM('#39'999999999999999999'#39')) AND   '
      '    (SA.PLACONTA(+)       = S.PLACONTA) AND       '
      '    (SA.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND  '
      '    (M.PLACONTA(+)        = S.PLACONTA) AND        '
      '    (M.CODCENTROCUSTO(+)  = S.CODCENTROCUSTO) AND  '
      '    (CC.CODCENTROCUSTO = S.CODCENTROCUSTO) AND     '
      '    (CC.IDEMPRESA = S.IDEMPRESA) AND               '
      '    (PD.PLACONTA(+) = C.PLACONTA) AND              '
      '    (PD.PLANO(+) = C.PLANO) AND                    '
      '    (S.PLACONTA = C.PLACONTA) AND'
      '    (S.PLANO = C.PLANO)                            '
      '    '
      'GROUP BY                                           '
      
        '   cc.codexterno, C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORR' +
        'ESP, C.PLANATUREZA, S.CODCENTROCUSTO,   '
      
        '   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), CC.NOME, C.PLAN' +
        'OMEOUTLING, SA.SALDOANT, M.DEB, M.CRED, M.MOV               '
      'UNION ALL   '
      'SELECT      '
      
        '   cc.codexterno, C.PLACONTA, C.PLAGRAU,                        ' +
        '                                        '
      '   C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, S.CODCENTROCUSTO, '
      
        '   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLAN' +
        'OMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLAN' +
        'OME,        '
      '   CC.NOME AS NOMECC,                                         '
      '   U.UNECODIGO, S.UNIDNEGOC, U.NOME,          '
      '   M.DEB,M.CRED,M.MOV,                                        '
      '   SA.SALDOANT,                                               '
      
        '   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)' +
        '  '
      
        '   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO' +
        '  '
      
        'FROM                                                            ' +
        '  '
      
        '   PLANOSALDO S, CENTCUST CC, PLANOCONTA C, UNIDNEGOCIO U,      ' +
        '  '
      '   (SELECT'
      '      P.PLANOME, P.PLACONTA, P.PLANO, P.PLATIPO, P.PLAINATIVA'
      '    FROM  PLANOCONTAPER P,'
      '      (SELECT PLACONTA, PLANO,'
      
        '       MIN(TO_CHAR(PEREXERCICIO)||DECODE(LENGTH(NVL(PERNUMERO,0)' +
        '),1,'#39'0'#39'||'
      
        '           TO_CHAR(NVL(PERNUMERO,0)),TO_CHAR(NVL(PERNUMERO,0))))' +
        ' AS PERNUMERO'
      '       FROM PLANOCONTAPER'
      
        '       WHERE (TO_CHAR(PEREXERCICIO)||DECODE(LENGTH(NVL(PERNUMERO' +
        ',0)),1,'#39'0'#39
      
        '            ||TO_CHAR(NVL(PERNUMERO,0)),TO_CHAR(NVL(PERNUMERO,0)' +
        ')) >= '#39'200504'#39')'
      '            AND (IDPESSOA = 1)'
      '       GROUP BY  PLACONTA, PLANO) PX'
      '    WHERE'
      '      (P.PLACONTA = PX.PLACONTA)'
      '      AND (P.PLANO = PX.PLANO)'
      '      AND (P.IDPESSOA = 1)'
      
        '      AND (TO_CHAR(P.PEREXERCICIO)||DECODE(LENGTH(NVL(P.PERNUMER' +
        'O,0)),1,'#39'0'#39'||'
      
        '           TO_CHAR(NVL(P.PERNUMERO,0)),TO_CHAR(NVL(P.PERNUMERO,0' +
        '))) = PX.PERNUMERO))  PD, '
      
        '   (SELECT                                                      ' +
        '  '
      
        '       PLACONTA,CODCENTROCUSTO,UNIDNEGOC,SUM(DECODE(PLSDEBITOCOR' +
        'RENTE, NULL, 0, PLSDEBITOCORRENTE) '
      
        '       - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO' +
        'ANT                    '
      
        '    FROM PLANOSALDO                                             ' +
        ' '
      '    WHERE (PLANO =4) AND                                   '
      '          (PEREXERCICIO =2005) AND                        '
      '          ((PERNUMERO <4) OR (PERNUMERO IS NULL)) AND '
      '   --    (RTRIM(CODCENTROCUSTO) >= RTRIM('#39'0101'#39') AND  '
      '--       (IDEMPRESA =1)) AND                       '
      '   --    (RTRIM(CODCENTROCUSTO) <= RTRIM('#39'0115'#39') AND  '
      '--       (IDEMPRESA =1)) AND                       '
      '          (IDPESSOA =1)                            '
      '    GROUP BY PLACONTA,UNIDNEGOC,CODCENTROCUSTO ) SA,       '
      '   (SELECT                                                 '
      '       PLACONTA,CODCENTROCUSTO,UNIDNEGOC,                  '
      '       SUM(PLSDEBITOCORRENTE) AS DEB,                      '
      '       SUM(PLSCREDITOCOR) AS CRED,                         '
      '       (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV '
      '    FROM PLANOSALDO                                         '
      '    WHERE (PLANO =4) AND                               '
      '          (PEREXERCICIO =2005) AND                    '
      '          (PERNUMERO(+) BETWEEN 4 AND 5) AND'
      '     --  (RTRIM(CODCENTROCUSTO) >= RTRIM('#39'0101'#39') AND  '
      '--       (IDEMPRESA =1)) AND                       '
      '    --   (RTRIM(CODCENTROCUSTO) <= RTRIM('#39'0115'#39') AND  '
      '--       (IDEMPRESA =1)) AND                       '
      '          (IDPESSOA =1)                            '
      '    GROUP BY PLACONTA, UNIDNEGOC, CODCENTROCUSTO) M        '
      'WHERE                                                      '
      '-- (RTRIM(S.CODCENTROCUSTO(+)) >= RTRIM('#39'0101'#39') AND   '
      '-- (S.IDEMPRESA(+) =1)) AND                        '
      '-- (RTRIM(S.CODCENTROCUSTO(+)) <= RTRIM('#39'0115'#39') AND   '
      '-- (S.IDEMPRESA(+) =1)) AND                        '
      '    (cc.idplancentcust = 1 ) and'
      
        '    (cc.codexterno between '#39'0101'#39' and '#39'0115'#39') and               ' +
        '        '
      '    ((C.PLARATEIOAP <> '#39'N'#39') OR (C.PLARATEIOAP IS NULL)) AND '
      '    (C.PLATIPO = '#39'A'#39') AND                                  '
      '    (S.PLANO = 4 ) AND                                    '
      '    (S.PEREXERCICIO(+) =2005) AND                      '
      '    ((S.PERNUMERO <=4) OR (S.PERNUMERO IS NULL)) AND'
      '    (S.IDPESSOA =1) AND                  '
      '    (S.IDPESSOA(+) =1) AND               '
      '    (RTRIM(C.PLACONTA) >= RTRIM('#39'0'#39')) AND  '
      '    (RTRIM(C.PLACONTA) <= RTRIM('#39'99999999999999999999'#39')) AND  '
      '    (SA.PLACONTA(+)    = S.PLACONTA) AND         '
      '    (SA.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND'
      '    (SA.UNIDNEGOC(+)   = S.UNIDNEGOC) AND        '
      '    (M.PLACONTA(+)     = S.PLACONTA) AND         '
      '    (M.CODCENTROCUSTO(+)  = S.CODCENTROCUSTO) AND'
      '    (M.UNIDNEGOC(+)    = S.UNIDNEGOC) AND        '
      '    (CC.CODCENTROCUSTO = S.CODCENTROCUSTO) AND   '
      '    (CC.IDEMPRESA = S.IDEMPRESA) AND             '
      '    (U.UNIDNEGOC = S.UNIDNEGOC) AND              '
      '    (U.IDPESSOA = S.IDPESSOA) AND                '
      '    (PD.PLACONTA(+) = C.PLACONTA) AND            '
      '    (PD.PLANO(+) = C.PLANO) AND                  '
      '    (1=2) and'
      '    (S.PLACONTA = C.PLACONTA) AND                '
      '    (S.PLANO = C.PLANO)                          '
      'GROUP BY                                         '
      
        '   cc.codexterno, C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORR' +
        'ESP, C.PLANATUREZA,'
      
        '   S.CODCENTROCUSTO, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME' +
        '), CC.NOME,'
      '   U.UNECODIGO, S.UNIDNEGOC, U.NOME,          '
      '   M.DEB,M.CRED,M.MOV, C.PLANOMEOUTLING,         '
      '   SA.SALDOANT                                   '
      'UNION ALL                                        '
      'SELECT                                           '
      '   cc.codexterno, C.PLACONTA, C.PLAGRAU,                        '
      
        '   C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, ('#39'         '#39') AS C' +
        'ODCENTROCUSTO, '
      
        '   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLAN' +
        'OMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLAN' +
        'OME, '
      
        '   ('#39'                             '#39') AS NOMECC, ('#39'         '#39') AS' +
        ' UNECODIGO, (0) AS UNIDNEGOC, ('#39'                         '#39') AS N' +
        'OME, '
      
        '   M.DEB,M.CRED,M.MOV, SA.SALDOANT,                             ' +
        ' '
      
        '   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)' +
        ' '
      
        '   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO' +
        ' '
      
        'FROM                                                            ' +
        ' '
      
        '   PLANOSALDO S, PLANOCONTA C, centcust cc,                     ' +
        '              '
      
        '(SELECT P.PLANOME, P.PLACONTA, P.PLANO, P.PLATIPO, P.PLAINATIVA ' +
        '  FROM  PLANOCONTAPER P,             (SELECT PLACONTA, PLANO, MI' +
        'N(TO_CHAR(PEREXERCICIO)||DECODE(LENGTH(NVL(PERNUMERO,0)),1,'#39'0'#39'||' +
        'TO_CHAR(NVL(PERNUMERO,0)),TO_CHAR(NVL(PERNUMERO,0)))) AS PERNUME' +
        'RO              FROM PLANOCONTAPER              WHERE (TO_CHAR(P' +
        'EREXERCICIO)||DECODE(LENGTH(NVL(PERNUMERO,0)),1,'#39'0'#39'||TO_CHAR(NVL' +
        '(PERNUMERO,0)),TO_CHAR(NVL(PERNUMERO,0))) >= '#39'200504'#39')          ' +
        '      AND (IDPESSOA = 1)              GROUP BY  PLACONTA, PLANO)' +
        ' PX   WHERE (P.PLACONTA = PX.PLACONTA)     AND (P.PLANO = PX.PLA' +
        'NO)           AND (P.IDPESSOA = 1)     AND (TO_CHAR(P.PEREXERCIC' +
        'IO)||DECODE(LENGTH(NVL(P.PERNUMERO,0)),1,'#39'0'#39'||TO_CHAR(NVL(P.PERN' +
        'UMERO,0)),TO_CHAR(NVL(P.PERNUMERO,0))) = PX.PERNUMERO))  PD, '
      '   (SELECT '
      
        '       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBIT' +
        'OCORRENTE) '
      
        '                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCO' +
        'R)) AS SALDOANT          '
      
        '    FROM PLANOSALDO                                             ' +
        ' '
      '    WHERE (PLANO =4) AND                                    '
      '          (PEREXERCICIO =2005) AND '
      '          ((PERNUMERO <5) OR (PERNUMERO IS NULL)) AND  '
      '--       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND '
      '--       (IDEMPRESA = 1)) AND                      '
      '  --     (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND '
      '--      (IDEMPRESA = 1)) AND                      '
      '          (IDPESSOA =1)                           '
      '    GROUP BY PLACONTA ) SA,                                 '
      '   (SELECT                                                  '
      '       PLACONTA,                                            '
      '       SUM(PLSDEBITOCORRENTE) AS DEB,                       '
      '       SUM(PLSCREDITOCOR) AS CRED,                          '
      '       (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV '
      '    FROM PLANOSALDO                                         '
      '    WHERE (PLANO =4) AND                               '
      
        '          (PERNUMERO(+) BETWEEN :PERIODOINI AND :PERIODOFIM) AND' +
        ' '
      '          (PEREXERCICIO =2005) AND  '
      '  --     (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND '
      '  --     (IDEMPRESA =:EMPRESA)) AND  '
      '  --     (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND '
      '  --     (IDEMPRESA =:EMPRESA)) AND  '
      '          (IDPESSOA =1) '
      '    GROUP BY PLACONTA ) M  '
      'WHERE  '
      ' --(RTRIM(S.CODCENTROCUSTO(+)) >= RTRIM(:CCUSTOINI) AND '
      ' --(S.IDEMPRESA(+) =:EMPRESA)) AND '
      ' --(RTRIM(S.CODCENTROCUSTO(+)) <= RTRIM(:CCUSTOFIM) AND  '
      ' --(S.IDEMPRESA(+) =:EMPRESA)) AND                '
      '   (cc.idplancentcust = 1 ) and'
      
        '   (cc.codexterno between '#39'0101'#39' and '#39'0115'#39') and                ' +
        '       '
      '   (cc.CodCentroCusto = S.CodCentroCusto ) and'
      '    (S.PLANO =4) AND                          '
      '    (S.PEREXERCICIO(+) =2005) AND            '
      '    ((S.PERNUMERO <=5) OR (S.PERNUMERO IS NULL)) AND  '
      '    (S.IDPESSOA =1) AND                    '
      '    (S.IDPESSOA(+) =1) AND                 '
      '    (RTRIM(C.PLACONTA) >= RTRIM('#39'0'#39')) AND    '
      
        '    (RTRIM(C.PLACONTA) <= RTRIM('#39'99999999999999999999999'#39')) AND ' +
        '   '
      '    (SA.PLACONTA(+)       = S.PLACONTA) AND        '
      '    (M.PLACONTA(+)        = S.PLACONTA) AND        '
      '    (PD.PLACONTA(+) = C.PLACONTA) AND              '
      '    (PD.PLANO(+) = C.PLANO) AND                    '
      '    (S.PLACONTA = C.PLACONTA) AND                  '
      '    (S.PLANO = C.PLANO)'
      '         '
      'GROUP BY                                           '
      
        '   cc.codexterno, C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORR' +
        'ESP, C.PLANATUREZA,  '
      
        '   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLANOMEOUTLIN' +
        'G, SA.SALDOANT, M.DEB, M.CRED, M.MOV )   '
      'ORDER BY PLACONTA, NOMECC, UNECODIGO                        ')
    ClientDataSet = cdsBalAnalAPCC
    Left = 192
    Top = 96
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 168
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
    Left = 200
    Top = 168
  end
  object sqlTitulos: TCMSqlParams
    ClientDataSet = cdsTitulos
    Left = 40
    Top = 176
  end
  object cdsTitulos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 176
  end
end
