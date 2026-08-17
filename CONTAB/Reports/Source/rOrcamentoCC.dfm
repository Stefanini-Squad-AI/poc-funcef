inherited rptOrcamentoCC: TrptOrcamentoCC
  Left = 234
  Top = 258
  Width = 418
  Height = 293
  Caption = 'Orçado x Realizado por Centro de Custo'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Orçado x Realizado'
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
        Required = True
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
        Caption = 'Período'
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
          '   PERNUMERO'
          '')
        LookupSettings.Chave = 'PERNUMERO'
        LookupSettings.Display = 'PEREXERCNOME'
        LookupSettings.Descricao = 'Período'
        LookupSettings.Tamanho = '30'
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Período'
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
        Required = True
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
        Caption = 'Conta Inicial'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '     PLACONTA,'
          '     PLANOME'
          'FROM'
          '     PLANOCONTA'
          'ORDER BY PLACONTA')
        LookupSettings.Chave = 'PLACONTA'
        LookupSettings.Display = 'PLACONTA|PLANOME'
        LookupSettings.Descricao = 'Conta|Descrição'
        LookupSettings.Tamanho = '20|40'
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
        Caption = 'Conta Final'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '     PLACONTA,'
          '     PLANOME'
          'FROM'
          '     PLANOCONTA'
          'ORDER BY PLACONTA')
        LookupSettings.Chave = 'PLACONTA'
        LookupSettings.Display = 'PLACONTA|PLANOME'
        LookupSettings.Descricao = 'Conta|Descrição'
        LookupSettings.Tamanho = '20|40'
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
        LookupSettings.Display = 'CODCENTROCUSTO|NOME'
        LookupSettings.Descricao = 'Centro de Custo'
        LookupSettings.Tamanho = '10|40'
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
        LookupSettings.Display = 'CODCENTROCUSTO|NOME'
        LookupSettings.Descricao = 'Centro de Custo'
        LookupSettings.Tamanho = '10|40'
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
        Caption = 'Atividade/Projeto'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   UNIDNEGOC, NOME '
          'FROM '
          '   UNIDNEGOCIO'
          'WHERE'
          '   ( IDPESSOA =1)'
          '   ')
        LookupSettings.Chave = 'UNIDNEGOC'
        LookupSettings.Display = 'UNIDNEGOC|NOME'
        LookupSettings.Descricao = 'Código|Nome'
        LookupSettings.Tamanho = '10|40'
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
        Caption = 'Imprimir Valores Negativos entre Parênteses'
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
        Caption = 'Quebra página por Centro de Custo'
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
        TextDefault = '6'
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
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
        Caption = 'Identa Contas'
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
        Caption = 'Coloca espaçamento entre Contas Sintéticas'
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
        Caption = 'Imprimir coluna de Código das Contas'
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
        Caption = 'Desconsiderar o Encerramento de Resultado'
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
        Caption = 'Título'
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
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    AfterExecute = CmpRptCMAfterExecute
    Formheight = 500
    FormWidth = 500
    Left = 148
  end
  inherited DevRptCM: TExtraOptions
    Left = 32
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptOrcamentoCC
    LabelEmpresa = lblempresa
    LabelSistema = lblsistema
    Left = 91
  end
  object sqlOrcamentoCC: TCMSqlParams
    SQL.Strings = (
      'SELECT CODCENTROCUSTO, IDEMPRESA,'
      '       ('#39'A'#39') AS CCTIPO,'
      '       ('#39'                              '#39') AS NOMECENTROCUSTO,'
      '       PLANO, PLACONTA,'
      '       ('#39'A'#39') AS PLATIPO,'
      '       ('#39'                                        '#39') AS PLANOME,'
      '       ('#39'123456789012345678901234567890'#39') AS NOMEINDENTADO,'
      '       ('#39'                  '#39') AS GRAU,'
      '       ('#39'                                        '#39') AS CONTA,'
      
        '       ('#39'                                        '#39') AS PLANOMEOU' +
        'TLING,'
      '       (0) AS PLAGRAU,'
      '       ('#39'                  '#39') AS PLACONCORRESP,'
      
        '       (0) AS REAL,      (0) AS ORC,                      /* Cal' +
        'culados */'
      '       (0) AS SALDOREAL, (0) AS SALDOORC,'
      
        '       (0) AS ORCABS,  (0) AS SORCABS,  (0) AS VARPER,    /* Emi' +
        'tidos no Relatório */'
      '       (0) AS REALABS, (0) AS SREALABS, (0) AS VARACUM,'
      '       ('#39' '#39') AS DEBCREORC,  ('#39' '#39') AS DEBCRESORC,'
      '       ('#39' '#39') AS DEBCREREAL, ('#39' '#39') AS DEBCRESREAL'
      'FROM   CONTASXCC'
      'WHERE  (CODCENTROCUSTO = '#39#39')'
      '  AND  (IDEMPRESA      = -1)'
      '  AND  (PLACONTA       = '#39#39')'
      '  AND  (PLANO          = -1)'
      'ORDER BY CODCENTROCUSTO, PLANO, PLACONTA'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsOrcamentoCC
    Left = 237
    Top = 64
  end
  object cdsOrcamentoCC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 237
    Top = 50
  end
  object dsOrcamentoCC: TwwDataSource
    DataSet = cdsOrcamentoCC
    Left = 238
    Top = 36
  end
  object pplOrcamentoCC: TppBDEPipeline
    DataSource = dsOrcamentoCC
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lOrcamentoCC'
    Left = 237
    Top = 22
    object pplOrcamentoCCppField1: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField2: TppField
      FieldAlias = 'IDEMPRESA'
      FieldName = 'IDEMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField3: TppField
      FieldAlias = 'CCTIPO'
      FieldName = 'CCTIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField4: TppField
      FieldAlias = 'NOMECENTROCUSTO'
      FieldName = 'NOMECENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField5: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField6: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField7: TppField
      FieldAlias = 'PLATIPO'
      FieldName = 'PLATIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField8: TppField
      FieldAlias = 'PLANOME'
      FieldName = 'PLANOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField9: TppField
      FieldAlias = 'NOMEINDENTADO'
      FieldName = 'NOMEINDENTADO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField10: TppField
      FieldAlias = 'GRAU'
      FieldName = 'GRAU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField11: TppField
      FieldAlias = 'CONTA'
      FieldName = 'CONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField12: TppField
      FieldAlias = 'PLANOMEOUTLING'
      FieldName = 'PLANOMEOUTLING'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField13: TppField
      FieldAlias = 'PLAGRAU'
      FieldName = 'PLAGRAU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField14: TppField
      FieldAlias = 'PLACONCORRESP'
      FieldName = 'PLACONCORRESP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField15: TppField
      FieldAlias = 'REAL'
      FieldName = 'REAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField16: TppField
      FieldAlias = 'ORC'
      FieldName = 'ORC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField17: TppField
      FieldAlias = 'SALDOREAL'
      FieldName = 'SALDOREAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField18: TppField
      FieldAlias = 'SALDOORC'
      FieldName = 'SALDOORC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField19: TppField
      FieldAlias = 'ORCABS'
      FieldName = 'ORCABS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField20: TppField
      FieldAlias = 'SORCABS'
      FieldName = 'SORCABS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField21: TppField
      FieldAlias = 'VARPER'
      FieldName = 'VARPER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField22: TppField
      FieldAlias = 'REALABS'
      FieldName = 'REALABS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField23: TppField
      FieldAlias = 'SREALABS'
      FieldName = 'SREALABS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField24: TppField
      FieldAlias = 'VARACUM'
      FieldName = 'VARACUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField25: TppField
      FieldAlias = 'DEBCREORC'
      FieldName = 'DEBCREORC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField26: TppField
      FieldAlias = 'DEBCRESORC'
      FieldName = 'DEBCRESORC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField27: TppField
      FieldAlias = 'DEBCREREAL'
      FieldName = 'DEBCREREAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object pplOrcamentoCCppField28: TppField
      FieldAlias = 'DEBCRESREAL'
      FieldName = 'DEBCRESREAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
  end
  object rptOrcamentoCC: TppReport
    AutoStop = False
    DataPipeline = pplOrcamentoCC
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
    Left = 237
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplOrcamentoCC'
    object ppHeaderBand10: TppHeaderBand
      BeforePrint = ppHeaderBand10BeforePrint
      mmBottomOffset = 0
      mmHeight = 28840
      mmPrintPosition = 0
      object ppLblTituloOrcamento: TppLabel
        UserName = 'ppLblTituloOrcamento'
        Caption = 'Orçado x Realizado por Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 102394
        mmTop = 8731
        mmWidth = 81756
        BandType = 0
      end
      object ppLine27: TppLine
        UserName = 'ppLine27'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16933
        mmWidth = 284300
        BandType = 0
      end
      object lblempresa: TppLabel
        UserName = 'lblempresa'
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
      object txtContaOrc: TppLabel
        UserName = 'txtContaOrc'
        AutoSize = False
        Caption = 'Cód. Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 23813
        mmWidth = 25400
        BandType = 0
      end
      object ppLine28: TppLine
        UserName = 'ppLine28'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 28046
        mmWidth = 284300
        BandType = 0
      end
      object txtNomeContaOrc: TppLabel
        UserName = 'txtNomeContaOrc'
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 37042
        mmTop = 23813
        mmWidth = 14023
        BandType = 0
      end
      object ppLblTituloOrcamento2: TppLabel
        UserName = 'ppLblTituloOrcamento2'
        Caption = 'ppLblTitulo2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 12700
        mmWidth = 14817
        BandType = 0
      end
      object txtReal: TppLabel
        UserName = 'txtReal'
        AutoSize = False
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 119856
        mmTop = 23813
        mmWidth = 15610
        BandType = 0
      end
      object txtPeriodo: TppLabel
        UserName = 'txtPeriodo'
        Caption = 'Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 19579
        mmWidth = 22490
        BandType = 0
      end
      object txtAcumulado: TppLabel
        UserName = 'txtAcumulado'
        AutoSize = False
        Caption = 'Acumulado no Exercício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 220134
        mmTop = 19844
        mmWidth = 35190
        BandType = 0
      end
      object txtOrc: TppLabel
        UserName = 'txtOrc'
        AutoSize = False
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 147373
        mmTop = 23813
        mmWidth = 19579
        BandType = 0
      end
      object txtVar: TppLabel
        UserName = 'txtVar'
        AutoSize = False
        Caption = 'Variação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 174096
        mmTop = 23813
        mmWidth = 14817
        BandType = 0
      end
      object txtRealAcu: TppLabel
        UserName = 'txtRealAcu'
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 201613
        mmTop = 23813
        mmWidth = 16140
        BandType = 0
      end
      object txtOrcAcu: TppLabel
        UserName = 'txtOrcAcu'
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 233363
        mmTop = 23813
        mmWidth = 17727
        BandType = 0
      end
      object txtVarAcu: TppLabel
        UserName = 'txtVarAcu'
        AutoSize = False
        Caption = 'Variação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 256382
        mmTop = 23813
        mmWidth = 16404
        BandType = 0
      end
      object rptOrcamentoLine1: TppLine
        UserName = 'rptOrcamentoLine1'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 165365
        mmTop = 21431
        mmWidth = 23813
        BandType = 0
      end
      object rptOrcamentoLine2: TppLine
        UserName = 'rptOrcamentoLine2'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 119856
        mmTop = 21431
        mmWidth = 21696
        BandType = 0
      end
      object rptOrcamentoLine3: TppLine
        UserName = 'rptOrcamentoLine3'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 200025
        mmTop = 21696
        mmWidth = 18256
        BandType = 0
      end
      object rptOrcamentoLine4: TppLine
        UserName = 'rptOrcamentoLine4'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 257176
        mmTop = 21696
        mmWidth = 16140
        BandType = 0
      end
    end
    object bndDetOrcamento: TppDetailBand
      BeforePrint = bndDetOrcamentoBeforePrint
      BeforeGenerate = bndDetOrcamentoBeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object dbtxtContaOrc: TppDBText
        UserName = 'dbtxtContaOrc'
        DataField = 'PLACONTA'
        DataPipeline = pplOrcamentoCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplOrcamentoCC'
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 0
        mmWidth = 34131
        BandType = 4
      end
      object dbtxtCorrespOrc: TppDBText
        UserName = 'dbtxtCorrespOrc'
        DataField = 'PLACONCORRESP'
        DataPipeline = pplOrcamentoCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'pplOrcamentoCC'
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 0
        mmWidth = 34131
        BandType = 4
      end
      object dbtxtNomeContaOrc: TppDBText
        UserName = 'dbtxtNomeContaOrc'
        DataField = 'NOMEINDENTADO'
        DataPipeline = pplOrcamentoCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplOrcamentoCC'
        mmHeight = 3704
        mmLeft = 36248
        mmTop = 0
        mmWidth = 65881
        BandType = 4
      end
      object dbtxtVarPer: TppDBText
        UserName = 'dbtxtVarPer'
        DataField = 'VARPER'
        DataPipeline = pplOrcamentoCC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcamentoCC'
        mmHeight = 3704
        mmLeft = 174361
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object dbtxtRealPerOrc: TppDBText
        UserName = 'dbtxtRealPerOrc'
        DataField = 'REALABS'
        DataPipeline = pplOrcamentoCC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcamentoCC'
        mmHeight = 3704
        mmLeft = 110331
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
      object dbtxtDCRealPerOrc: TppDBText
        UserName = 'dbtxtDCRealPerOrc'
        DataField = 'DEBCREREAL'
        DataPipeline = pplOrcamentoCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplOrcamentoCC'
        mmHeight = 3704
        mmLeft = 136261
        mmTop = 0
        mmWidth = 3440
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'ppDBText20'
        DataField = 'GRAU'
        DataPipeline = pplOrcamentoCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'pplOrcamentoCC'
        mmHeight = 3704
        mmLeft = 20902
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
      object dbtxtOrcPerOrc: TppDBText
        UserName = 'dbtxtOrcPerOrc'
        DataField = 'ORCABS'
        DataPipeline = pplOrcamentoCC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcamentoCC'
        mmHeight = 3704
        mmLeft = 141552
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
      object dbtxtDCOrcPerOrc: TppDBText
        UserName = 'dbtxtDCOrcPerOrc'
        DataField = 'DEBCREORC'
        DataPipeline = pplOrcamentoCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplOrcamentoCC'
        mmHeight = 3704
        mmLeft = 167482
        mmTop = 0
        mmWidth = 3440
        BandType = 4
      end
      object txtVarPer: TppLabel
        UserName = 'txtVarPer'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 189442
        mmTop = 265
        mmWidth = 2381
        BandType = 4
      end
      object txtVarAcum: TppLabel
        UserName = 'txtVarAcum'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 272786
        mmTop = 265
        mmWidth = 2381
        BandType = 4
      end
      object dbtxtVarAcum: TppDBText
        UserName = 'dbtxtVarAcum'
        DataField = 'VARACUM'
        DataPipeline = pplOrcamentoCC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcamentoCC'
        mmHeight = 3704
        mmLeft = 257969
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object dbtxtDCOrcAcumOrc: TppDBText
        UserName = 'dbtxtDCOrcAcumOrc'
        DataField = 'DEBCRESORC'
        DataPipeline = pplOrcamentoCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplOrcamentoCC'
        mmHeight = 3704
        mmLeft = 251090
        mmTop = 0
        mmWidth = 3440
        BandType = 4
      end
      object dbtxtOrcAcumOrc: TppDBText
        UserName = 'dbtxtOrcAcumOrc'
        DataField = 'SORCABS'
        DataPipeline = pplOrcamentoCC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcamentoCC'
        mmHeight = 3704
        mmLeft = 225425
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
      object dbtxtReaLAcumOrc: TppDBText
        UserName = 'dbtxtReaLAcumOrc'
        DataField = 'SREALABS'
        DataPipeline = pplOrcamentoCC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcamentoCC'
        mmHeight = 3704
        mmLeft = 194205
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
      object dbtxtDCRealAcumOrc: TppDBText
        UserName = 'dbtxtDCRealAcumOrc'
        DataField = 'DEBCRESREAL'
        DataPipeline = pplOrcamentoCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplOrcamentoCC'
        mmHeight = 3704
        mmLeft = 220134
        mmTop = 0
        mmWidth = 3440
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine29: TppLine
        UserName = 'ppLine29'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object lblsistema: TppLabel
        UserName = 'lblsistema'
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
      object ppCalc19: TppSystemVariable
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
        mmLeft = 123825
        mmTop = 1588
        mmWidth = 36777
        BandType = 8
      end
      object ppCalc20: TppSystemVariable
        UserName = 'ppCalc201'
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
    end
    object ppSummaryBand1: TppSummaryBand
      BeforePrint = ppSummaryBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
      object rptOrcamentoCCLabel9: TppLabel
        UserName = 'rptOrcamentoCCLabel9'
        AutoSize = False
        Caption = 'rptOrcamentoCCLabel9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 112713
        mmTop = 794
        mmWidth = 25135
        BandType = 7
      end
      object rptOrcamentoCCLabel10: TppLabel
        UserName = 'rptOrcamentoCCLabel10'
        AutoSize = False
        Caption = 'rptOrcamentoCCLabel10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 144198
        mmTop = 794
        mmWidth = 25135
        BandType = 7
      end
      object rptOrcamentoCCLabel11: TppLabel
        UserName = 'rptOrcamentoCCLabel11'
        AutoSize = False
        Caption = 'rptOrcamentoCCLabel11'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 196586
        mmTop = 794
        mmWidth = 25135
        BandType = 7
      end
      object rptOrcamentoCCLabel12: TppLabel
        UserName = 'rptOrcamentoCCLabel12'
        AutoSize = False
        Caption = 'rptOrcamentoCCLabel12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 227807
        mmTop = 794
        mmWidth = 25135
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'lblCCustoDesc1'
        AutoSize = False
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 48154
        mmTop = 794
        mmWidth = 59002
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CODCENTROCUSTO'
      DataPipeline = pplOrcamentoCC
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplOrcamentoCC'
      object GrpHeadSintetico: TppGroupHeaderBand
        BeforePrint = GrpHeadSinteticoBeforePrint
        BeforeGenerate = GrpHeadSinteticoBeforeGenerate
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBCODCCUSTO: TppDBText
          UserName = 'ppDBCODCCUSTO'
          DataField = 'CODCENTROCUSTO'
          DataPipeline = pplOrcamentoCC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplOrcamentoCC'
          mmHeight = 3704
          mmLeft = 1323
          mmTop = 794
          mmWidth = 33867
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'NOMECENTROCUSTO'
          DataPipeline = pplOrcamentoCC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplOrcamentoCC'
          mmHeight = 3704
          mmLeft = 37042
          mmTop = 794
          mmWidth = 66146
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 5027
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object rgSintetico: TppRegion
          UserName = 'rgSintetico'
          Caption = 'rgSintetico'
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 110331
          mmTop = 265
          mmWidth = 170392
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppDBText5: TppDBText
            UserName = 'dbtxtRealPerOrc1'
            DataField = 'REALABS'
            DataPipeline = pplOrcamentoCC
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplOrcamentoCC'
            mmHeight = 3704
            mmLeft = 110331
            mmTop = 794
            mmWidth = 25135
            BandType = 3
            GroupNo = 0
          end
          object ppDBText6: TppDBText
            UserName = 'dbtxtDCRealPerOrc1'
            DataField = 'DEBCREREAL'
            DataPipeline = pplOrcamentoCC
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplOrcamentoCC'
            mmHeight = 3704
            mmLeft = 136261
            mmTop = 794
            mmWidth = 3440
            BandType = 3
            GroupNo = 0
          end
          object ppDBText7: TppDBText
            UserName = 'dbtxtOrcPerOrc1'
            DataField = 'ORCABS'
            DataPipeline = pplOrcamentoCC
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplOrcamentoCC'
            mmHeight = 3704
            mmLeft = 141552
            mmTop = 794
            mmWidth = 25135
            BandType = 3
            GroupNo = 0
          end
          object ppDBText8: TppDBText
            UserName = 'dbtxtDCOrcPerOrc1'
            DataField = 'DEBCREORC'
            DataPipeline = pplOrcamentoCC
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplOrcamentoCC'
            mmHeight = 3704
            mmLeft = 167482
            mmTop = 794
            mmWidth = 3440
            BandType = 3
            GroupNo = 0
          end
          object ppDBText9: TppDBText
            UserName = 'dbtxtVarPer1'
            DataField = 'VARPER'
            DataPipeline = pplOrcamentoCC
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplOrcamentoCC'
            mmHeight = 3704
            mmLeft = 174361
            mmTop = 794
            mmWidth = 14552
            BandType = 3
            GroupNo = 0
          end
          object ppLabel1: TppLabel
            UserName = 'txtVarPer1'
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3704
            mmLeft = 189177
            mmTop = 794
            mmWidth = 2646
            BandType = 3
            GroupNo = 0
          end
          object ppDBText10: TppDBText
            UserName = 'dbtxtReaLAcumOrc1'
            DataField = 'SREALABS'
            DataPipeline = pplOrcamentoCC
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplOrcamentoCC'
            mmHeight = 3704
            mmLeft = 194205
            mmTop = 794
            mmWidth = 25135
            BandType = 3
            GroupNo = 0
          end
          object ppDBText11: TppDBText
            UserName = 'dbtxtDCRealAcumOrc1'
            DataField = 'DEBCRESREAL'
            DataPipeline = pplOrcamentoCC
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplOrcamentoCC'
            mmHeight = 3704
            mmLeft = 220134
            mmTop = 794
            mmWidth = 3440
            BandType = 3
            GroupNo = 0
          end
          object ppDBText12: TppDBText
            UserName = 'dbtxtOrcAcumOrc1'
            DataField = 'SORCABS'
            DataPipeline = pplOrcamentoCC
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplOrcamentoCC'
            mmHeight = 3704
            mmLeft = 225425
            mmTop = 794
            mmWidth = 25135
            BandType = 3
            GroupNo = 0
          end
          object ppDBText13: TppDBText
            UserName = 'dbtxtDCOrcAcumOrc1'
            DataField = 'DEBCRESORC'
            DataPipeline = pplOrcamentoCC
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplOrcamentoCC'
            mmHeight = 3704
            mmLeft = 251090
            mmTop = 794
            mmWidth = 3440
            BandType = 3
            GroupNo = 0
          end
          object ppDBText14: TppDBText
            UserName = 'dbtxtVarAcum1'
            DataField = 'VARACUM'
            DataPipeline = pplOrcamentoCC
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplOrcamentoCC'
            mmHeight = 3704
            mmLeft = 257969
            mmTop = 794
            mmWidth = 14552
            BandType = 3
            GroupNo = 0
          end
          object ppLabel2: TppLabel
            UserName = 'txtVarAcum1'
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 272786
            mmTop = 1058
            mmWidth = 2381
            BandType = 3
            GroupNo = 0
          end
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        AfterPrint = ppGroupFooterBand1AfterPrint
        BeforePrint = ppGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object rptOrcamentoCCLabel100: TppLabel
          UserName = 'rptOrcamentoCCLabel100'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 112977
          mmTop = 529
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object rptOrcamentoCCLabel101: TppLabel
          UserName = 'rptOrcamentoCCLabel101'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 529
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object rptOrcamentoCCLabel102: TppLabel
          UserName = 'rptOrcamentoCCLabel102'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 196850
          mmTop = 529
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object rptOrcamentoCCLabel103: TppLabel
          UserName = 'rptOrcamentoCCLabel103'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 228071
          mmTop = 529
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object lblCCustoDesc: TppLabel
          UserName = 'lblCCustoDesc'
          AutoSize = False
          Caption = 'lblCCustoDesc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 49742
          mmTop = 529
          mmWidth = 59002
          BandType = 5
          GroupNo = 0
        end
        object rptOrcamentoLine5: TppLine
          UserName = 'rptOrcamentoLine5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object sqlTitulos: TCMSqlParams
    ClientDataSet = cdsTitulos
    Left = 32
    Top = 136
  end
  object sqlPerAux: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '   PERNUMERO'
      'FROM '
      '   PERIODO '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND '
      '   (PEREXERCICIO=:PEREXERCICIO) AND '
      '   (PERNUMERO<=:PERNUMERO) AND '
      '   ((PERBLOQUE IS NULL) OR (PERBLOQUE = '#39'N'#39'))')
    ClientDataSet = cdsPerAux
    Left = 112
    Top = 136
  end
  object sqlSaldoOrc: TCMSqlParams
    ClientDataSet = cdsSaldoOrc
    Left = 112
    Top = 208
  end
  object sqlSaldoRea: TCMSqlParams
    ClientDataSet = cdsSaldoRea
    Left = 184
    Top = 136
  end
  object sqlSaldoEncer: TCMSqlParams
    ClientDataSet = cdsSaldoEncer
    Left = 32
    Top = 208
  end
  object sqlCContabSinteticos: TCMSqlParams
    SQL.Strings = (
      'SELECT PLACONTA, PLANOME, PLANOMEOUTLING, PLAGRAU, PLACONCORRESP'
      'FROM PLANOCONTA'
      'WHERE (PLANO = :PLANO)'
      '  AND (PLATIPO = '#39'S'#39')'
      'ORDER BY PLACONTA'
      ' ')
    ClientDataSet = cdsCContabSinteticos
    Left = 336
    Top = 149
  end
  object sqlAnaliticos: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   CX.CODCENTROCUSTO, CX.IDEMPRESA, CC.NOME AS NOMECENTROCUSTO, ' +
        'CC.STATUSGRUPOCDC AS CCTIPO,'
      
        '   CX.PLANO,CX.PLACONTA, PC.PLAGRAU, PC.PLATIPO, PC.PLACONCORRES' +
        'P,'
      '   (0) AS ORCABS,  (0) AS SORCABS,  (0) AS VARPER,'
      '   (0) AS REALABS, (0) AS SREALABS, (0) AS VARACUM,'
      '   ('#39' '#39') AS DEBCREORC,   ('#39' '#39') AS DEBCRESORC,'
      '   ('#39' '#39') AS DEBCREREAL,  ('#39' '#39') AS DEBCRESREAL,'
      '   ('#39'12345678901234567890123456789012345678901234567890'#39'+'
      '    '#39'12345678901234567890123456789012345678901234567890'#39'+'
      
        '    '#39'12345678901234567890123456789012345678901234567890'#39') AS NOM' +
        'EINDENTADO,'
      '   SUBSTR(PC.PLACONTA, 1, 10) AS GRAU,'
      '   PC.PLANOMEOUTLING AS CONTA,'
      '   DECODE(PD.PLANOME,NULL,PC.PLANOME,PD.PLANOME) AS PLANOME,'
      '   PC.PLANOMEOUTLING,'
      '   (0) AS REAL,      (0) AS ORC,'
      '   (0) AS SALDOREAL, (0) AS SALDOORC'
      'FROM'
      '   CONTASXCC CX, CENTCUST CC, PLANOCONTA PC,'
      ''
      
        '   (SELECT P.PLANOME, P.PLACONTA, P.PLANO, P.PLATIPO, P.PLAINATI' +
        'VA'
      '    FROM  PLANOCONTAPER P,'
      
        '          (SELECT PLACONTA, PLANO, MIN(TO_CHAR(PEREXERCICIO)||DE' +
        'CODE(LENGTH(NVL(PERNUMERO,0)),1,'#39'0'#39'||TO_CHAR(NVL(PERNUMERO,0)),T' +
        'O_CHAR(NVL(PERNUMERO,0)))) AS PERNUMERO'
      '           FROM PLANOCONTAPER'
      
        '           WHERE (TO_CHAR(PEREXERCICIO)||DECODE(LENGTH(NVL(PERNU' +
        'MERO,0)),1,'#39'0'#39'||TO_CHAR(NVL(PERNUMERO,0)),TO_CHAR(NVL(PERNUMERO,' +
        '0))) >= '#39'200112'#39')'
      '             AND (IDPESSOA = 1)'
      '           GROUP BY  PLACONTA, PLANO) PX'
      '    WHERE (P.PLACONTA = PX.PLACONTA)'
      '      AND (P.PLANO = PX.PLANO)'
      '      AND (P.IDPESSOA = 1)'
      
        '      AND (TO_CHAR(P.PEREXERCICIO)||DECODE(LENGTH(NVL(P.PERNUMER' +
        'O,0)),1,'#39'0'#39'||TO_CHAR(NVL(P.PERNUMERO,0)),TO_CHAR(NVL(P.PERNUMERO' +
        ',0))) = PX.PERNUMERO) PD,'
      ''
      'WHERE'
      '   (CX.IDEMPRESA      =  1) AND'
      '   (PC.PLANO          =  4) AND'
      '   (PC.PLAGRAU        <= 10) AND'
      '   (CX.CODCENTROCUSTO =  CC.CODCENTROCUSTO) AND'
      '   (CX.IDEMPRESA      =  CC.IDEMPRESA) AND'
      '   (PD.PLACONTA(+)    =  PC.PLACONTA) AND'
      '   (PD.PLANO(+)       =  PC.PLANO) AND'
      '   (CX.PLANO          =  PC.PLANO) AND                        '
      '   (CX.PLACONTA       =  PC.PLACONTA)                         '
      'ORDER BY CX.CODCENTROCUSTO, CX.PLANO, CX.PLACONTA'
      ''
      ' '
      ' ')
    ClientDataSet = cdsAnaliticos
    Left = 336
    Top = 22
  end
  object sqlCCustoSinteticos: TCMSqlParams
    SQL.Strings = (
      'SELECT CODCENTROCUSTO, NOME,IDEMPRESA'
      'FROM CENTCUST'
      'WHERE (IDEMPRESA = :IDPESSOA)'
      '  AND (STATUSGRUPOCDC = '#39'S'#39')'
      '  AND (ATIVO = '#39'S'#39')'
      'ORDER BY CODCENTROCUSTO')
    ClientDataSet = cdsCCustoSinteticos
    Left = 336
    Top = 85
  end
  object cdsTitulos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 120
  end
  object cdsPerAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 120
  end
  object cdsSaldoOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 192
  end
  object cdsSaldoRea: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 120
  end
  object cdsSaldoEncer: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 192
  end
  object cdsAnaliticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 8
  end
  object cdsCContabSinteticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 136
  end
  object cdsCCustoSinteticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 72
  end
end
