inherited RptRazaoCCusto: TRptRazaoCCusto
  Left = 321
  Top = 215
  Height = 263
  Caption = 'RptRazaoCCusto'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Razão por Centro de Custo'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Exercício da Data Inicial'
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
        Name = 'Exercício da Data Inicial'
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
          '     PLANOME'
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
          '   CODEXTERNO AS CODCENTROCUSTO,'
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
          '   CODEXTERNO AS CODCENTROCUSTO,'
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
        Caption = 'Sub-Conta'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT '
          '    CODSUBCONTA,'
          '    NOMESUBCONTA'
          'FROM'
          '    SUBCONTA'
          'ORDER BY NOMESUBCONTA')
        LookupSettings.Chave = 'CODSUBCONTA'
        LookupSettings.Display = 'CODSUBCONTA|NOMESUBCONTA'
        LookupSettings.Descricao = 'Sub-Conta|Descrição'
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
        Name = 'Sub-Conta'
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
        Caption = 'Sistema de Origem'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT'
          '   NOMEMODULO, '
          '   IDMODULO'
          'FROM'
          '   MODULO '
          'ORDER BY NOMEMODULO')
        LookupSettings.Chave = 'IDMODULO'
        LookupSettings.Display = 'NOMEMODULO'
        LookupSettings.Descricao = 'Módulo'
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
        Name = 'Sistema de Origem'
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
        Caption = 'Tipo de Operação'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   TIPDESCRICAO, '
          '   TIPCODIGO '
          'FROM '
          '   TIPOPER'
          'ORDER BY '
          '   TIPDESCRICAO')
        LookupSettings.Chave = 'TIPCODIGO'
        LookupSettings.Display = 'TIPCODIGO|TIPDESCRICAO'
        LookupSettings.Descricao = 'Código|Descrição'
        LookupSettings.Tamanho = '5|40'
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
        Name = 'Tipo de Operação'
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
        Caption = 'Cód.Histórico Padrão'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   HITCODHIST, '
          '   HITDESCR1 '
          'FROM '
          '   HISTOPADRAO'
          'ORDER BY '
          '   HITCODHIST')
        LookupSettings.Chave = 'HITCODHIST'
        LookupSettings.Display = 'HITCODHIST|HITDESCR1'
        LookupSettings.Descricao = 'Código|Descrição'
        LookupSettings.Tamanho = '10|50'
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
        Name = 'Cód.Histórico Padrão'
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
        Caption = 'Filtrar todos os Lançamentos MENOS o Tipo de Operação'
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
        Name = 'Filtrar todos os Lançamentos MENOS o Tipo de Operação'
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
        Caption = 'Processar Lançamentos'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todos'
          'Integrados'
          'NÃO Integrados')
        RadioGroupSettings.Values.Strings = ()
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
        Name = 'Processar Lançamentos'
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
        Caption = 'Imprimir com máscara'
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
        Name = 'Imprimir com máscara'
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
        Caption = 'Imprimir C. Correspondente'
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
        Name = 'Imprimir C. Correspondente'
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
        Caption = 'Quebra por Centro de Custo'
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
        Name = 'Quebra por Centro de Custo'
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
        Caption = 'Imprimir Contra-Partida'
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
        Name = 'Imprimir Contra-Partida'
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
        Width = 270
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
        Width = 270
      end
      item
        Caption = 'Plano Previdenciário'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '   IDPLANOPREV, '
          '   NOME'
          'FROM'
          '   PLANPREVCONTABIL'
          'ORDER BY NOME'
          '')
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
        MostraComboCompara = True
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
        Width = 270
      end
      item
        Caption = 'Patrocinador'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   PA.IDPESSOA, '
          '   PE.NOME '
          'FROM'
          '   PESSOA PE,'
          '   PATRO PA'
          'WHERE'
          '   (PA.IDPESSOA = PE.IDPESSOA)'
          'ORDER BY PE.NOME'
          '')
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Patrocinador'
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
        Width = 270
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    Left = 164
    Top = 16
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptRazaoCCusto
    LabelSistema = ppLabel124
    Left = 67
  end
  object dsRazaoCCusto: TwwDataSource
    DataSet = cdsRazaoCCusto
    Left = 29
    Top = 86
  end
  object pplRazaoCCusto: TppBDEPipeline
    DataSource = dsRazaoCCusto
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lRazaoCCusto'
    Left = 98
    Top = 78
    object pplRazaoCCustoppField1: TppField
      FieldAlias = 'CODEXTERNO'
      FieldName = 'CODEXTERNO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object pplRazaoCCustoppField2: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 1
    end
    object pplRazaoCCustoppField3: TppField
      FieldAlias = 'PLANOME'
      FieldName = 'PLANOME'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object pplRazaoCCustoppField4: TppField
      FieldAlias = 'NOMESUBCONTA'
      FieldName = 'NOMESUBCONTA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplRazaoCCustoppField5: TppField
      FieldAlias = 'UNECODIGO'
      FieldName = 'UNECODIGO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object pplRazaoCCustoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLAGRAU'
      FieldName = 'PLAGRAU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplRazaoCCustoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOCABECALHO'
      FieldName = 'SALDOCABECALHO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplRazaoCCustoppField8: TppField
      FieldAlias = 'DEBCRECABECALHO'
      FieldName = 'DEBCRECABECALHO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
    object pplRazaoCCustoppField9: TppField
      FieldAlias = 'PLACONTAREF'
      FieldName = 'PLACONTAREF'
      FieldLength = 81
      DisplayWidth = 81
      Position = 8
    end
    object pplRazaoCCustoppField10: TppField
      FieldAlias = 'PLANOMEREF'
      FieldName = 'PLANOMEREF'
      FieldLength = 40
      DisplayWidth = 40
      Position = 9
    end
    object pplRazaoCCustoppField11: TppField
      FieldAlias = 'PLACONCORRESP'
      FieldName = 'PLACONCORRESP'
      FieldLength = 18
      DisplayWidth = 18
      Position = 10
    end
    object pplRazaoCCustoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDMODULO'
      FieldName = 'IDMODULO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplRazaoCCustoppField13: TppField
      FieldAlias = 'PLNEFETIVADO'
      FieldName = 'PLNEFETIVADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
    object pplRazaoCCustoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANT'
      FieldName = 'SALDOANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplRazaoCCustoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplRazaoCCustoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplRazaoCCustoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNPLANIL'
      FieldName = 'PLNPLANIL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplRazaoCCustoppField18: TppField
      FieldAlias = 'PLNDATDIA'
      FieldName = 'PLNDATDIA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 17
    end
    object pplRazaoCCustoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOVIMENT'
      FieldName = 'MOVIMENT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplRazaoCCustoppField20: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 204
      DisplayWidth = 204
      Position = 19
    end
    object pplRazaoCCustoppField21: TppField
      FieldAlias = 'LANCAMENTO'
      FieldName = 'LANCAMENTO'
      FieldLength = 81
      DisplayWidth = 81
      Position = 20
    end
    object pplRazaoCCustoppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEB'
      FieldName = 'DEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplRazaoCCustoppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'CRED'
      FieldName = 'CRED'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplRazaoCCustoppField24: TppField
      FieldAlias = 'EFET'
      FieldName = 'EFET'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object pplRazaoCCustoppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOCORRENTE'
      FieldName = 'SALDOCORRENTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplRazaoCCustoppField26: TppField
      FieldAlias = 'DEBCRE'
      FieldName = 'DEBCRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 25
    end
    object pplRazaoCCustoppField27: TppField
      FieldAlias = 'CONTRAPARTIDA'
      FieldName = 'CONTRAPARTIDA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 26
    end
    object pplRazaoCCustoppField28: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 27
    end
    object pplRazaoCCustoppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODSUBCONTA'
      FieldName = 'CODSUBCONTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplRazaoCCustoppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'LACNUMLAN'
      FieldName = 'LACNUMLAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplRazaoCCustoppField31: TppField
      FieldAlias = 'LACDEBCRE'
      FieldName = 'LACDEBCRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 30
    end
    object pplRazaoCCustoppField32: TppField
      FieldAlias = 'LACNUMDOC'
      FieldName = 'LACNUMDOC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 31
    end
    object pplRazaoCCustoppField33: TppField
      FieldAlias = 'NOMECC'
      FieldName = 'NOMECC'
      FieldLength = 30
      DisplayWidth = 30
      Position = 32
    end
  end
  object rptRazaoCCusto: TppReport
    AutoStop = False
    DataPipeline = pplRazaoCCusto
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 10000
    PrinterSetup.mmMarginLeft = 12000
    PrinterSetup.mmMarginRight = 8000
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
    Left = 162
    Top = 78
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplRazaoCCusto'
    object ppHeaderBand18: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object pplblTituloRCCusto: TppLabel
        UserName = 'pplblTituloRCCusto'
        Caption = 'Razão por Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 110861
        mmTop = 8731
        mmWidth = 55033
        BandType = 0
      end
      object ppLine44: TppLine
        UserName = 'ppLine44'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19315
        mmWidth = 277000
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'ppLabel14'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 124354
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'ppLabel21'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 21960
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'ppLabel65'
        Caption = 'Lanç.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 13494
        mmTop = 21960
        mmWidth = 7673
        BandType = 0
      end
      object ppLine52: TppLine
        UserName = 'ppLine52'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27252
        mmWidth = 277000
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'ppLabel74'
        Caption = 'Contra-Partida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 30692
        mmTop = 21960
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'ppLabel80'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 21960
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel86: TppLabel
        UserName = 'ppLabel86'
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 218811
        mmTop = 21960
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'ppLabel91'
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 237861
        mmTop = 21960
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'ppLabel93'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 255059
        mmTop = 21960
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel114: TppLabel
        UserName = 'ppLabel114'
        Caption = 'Sub.Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 63236
        mmTop = 21960
        mmWidth = 14817
        BandType = 0
      end
      object pplblTituloRCCusto2: TppLabel
        UserName = 'pplblTituloRCCusto2'
        Caption = 'pplblTituloRCCusto2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 14552
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel117: TppLabel
        UserName = 'ppLabel117'
        Caption = 'Ativ./Proj.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 104775
        mmTop = 21960
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel118: TppLabel
        UserName = 'ppLabel118'
        Caption = 'Sist.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 119592
        mmTop = 21960
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel119: TppLabel
        UserName = 'ppLabel119'
        Caption = 'Int.?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 22754
        mmTop = 21960
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel120: TppLabel
        UserName = 'ppLabel120'
        Caption = 'Num.Docto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 128059
        mmTop = 21960
        mmWidth = 16404
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      AfterGenerate = ppDetailBand6AfterGenerate
      BeforeGenerate = ppDetailBand6BeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBMemo1: TppDBMemo
        UserName = 'ppDBMemo1'
        CharWrap = False
        DataField = 'HISTORICO'
        DataPipeline = pplRazaoCCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplRazaoCCusto'
        mmHeight = 3704
        mmLeft = 148696
        mmTop = 529
        mmWidth = 58473
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText10: TppDBText
        UserName = 'ppDBText10'
        DataField = 'PLNDATDIA'
        DataPipeline = pplRazaoCCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRazaoCCusto'
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 529
        mmWidth = 12171
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'ppDBText18'
        DataField = 'LANCAMENTO'
        DataPipeline = pplRazaoCCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRazaoCCusto'
        mmHeight = 3704
        mmLeft = 14552
        mmTop = 529
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'ppDBText30'
        BlankWhenZero = True
        DataField = 'DEB'
        DataPipeline = pplRazaoCCusto
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRazaoCCusto'
        mmHeight = 3175
        mmLeft = 207963
        mmTop = 529
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'ppDBText32'
        BlankWhenZero = True
        DataField = 'CRED'
        DataPipeline = pplRazaoCCusto
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRazaoCCusto'
        mmHeight = 3175
        mmLeft = 228600
        mmTop = 529
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'ppDBText34'
        DataField = 'NOMESUBCONTA'
        DataPipeline = pplRazaoCCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRazaoCCusto'
        mmHeight = 3704
        mmLeft = 59002
        mmTop = 529
        mmWidth = 33073
        BandType = 4
      end
      object dbtxtUnidNegoc: TppDBText
        UserName = 'dbtxtUnidNegoc'
        DataField = 'UNECODIGO'
        DataPipeline = pplRazaoCCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRazaoCCusto'
        mmHeight = 3704
        mmLeft = 107686
        mmTop = 529
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'ppDBText41'
        DataField = 'IDMODULO'
        DataPipeline = pplRazaoCCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRazaoCCusto'
        mmHeight = 3704
        mmLeft = 119592
        mmTop = 529
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'ppDBText42'
        DataField = 'EFET'
        DataPipeline = pplRazaoCCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplRazaoCCusto'
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 529
        mmWidth = 1852
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'ppDBText44'
        DataField = 'LACNUMDOC'
        DataPipeline = pplRazaoCCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRazaoCCusto'
        mmHeight = 3704
        mmLeft = 127529
        mmTop = 529
        mmWidth = 20373
        BandType = 4
      end
      object dbSumMovConRazCC: TppDBCalc
        UserName = 'dbSumMovConRazCC'
        DataField = 'MOVIMENT'
        DataPipeline = pplRazaoCCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ResetGroup = ppGroup11
        Transparent = True
        Visible = False
        DataPipelineName = 'pplRazaoCCusto'
        mmHeight = 3704
        mmLeft = 191559
        mmTop = 265
        mmWidth = 13229
        BandType = 4
      end
      object dbtxtSaldoAntRazCC: TppDBText
        UserName = 'dbtxtSaldoAntRazCC'
        DataField = 'SALDOANT'
        DataPipeline = pplRazaoCCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'pplRazaoCCusto'
        mmHeight = 3704
        mmLeft = 177271
        mmTop = 265
        mmWidth = 13494
        BandType = 4
      end
      object dbtxtSaldoRazCC: TppDBText
        UserName = 'dbtxtSaldoRazCC'
        DataField = 'SALDO'
        DataPipeline = pplRazaoCCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'pplRazaoCCusto'
        mmHeight = 3704
        mmLeft = 162719
        mmTop = 265
        mmWidth = 13494
        BandType = 4
      end
      object txtSaldoRazCC: TppLabel
        UserName = 'txtSaldoRazCC'
        AutoSize = False
        Caption = 'txtSaldoRazCC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 248973
        mmTop = 529
        mmWidth = 20638
        BandType = 4
      end
      object txtDebCreRazCC: TppLabel
        UserName = 'txtDebCreRazCC'
        AutoSize = False
        Caption = 'txtDebCreRazCC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 269876
        mmTop = 529
        mmWidth = 5027
        BandType = 4
      end
      object dbtxtMovRazCC: TppDBText
        UserName = 'dbtxtMovRazCC'
        DataField = 'MOVIMENT'
        DataPipeline = pplRazaoCCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'pplRazaoCCusto'
        mmHeight = 3704
        mmLeft = 93134
        mmTop = 529
        mmWidth = 13494
        BandType = 4
      end
      object dbSumMovCCRazCC: TppDBCalc
        UserName = 'dbSumMovCCRazCC'
        DataField = 'MOVIMENT'
        DataPipeline = pplRazaoCCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ResetGroup = ppGroup9
        Transparent = True
        Visible = False
        DataPipelineName = 'pplRazaoCCusto'
        mmHeight = 3704
        mmLeft = 207963
        mmTop = 265
        mmWidth = 13229
        BandType = 4
      end
      object dbTxtContraPartida: TppDBText
        UserName = 'dbTxtContraPartida'
        DataField = 'CONTRAPARTIDA'
        DataPipeline = pplRazaoCCusto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRazaoCCusto'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 529
        mmWidth = 30163
        BandType = 4
      end
    end
    object ppFooterBand18: TppFooterBand
      BeforePrint = ppFooterBand18BeforePrint
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object ppLine53: TppLine
        UserName = 'ppLine53'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 277000
        BandType = 8
      end
      object ppLabel124: TppLabel
        UserName = 'ppLabel124'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 1588
        mmWidth = 79375
        BandType = 8
      end
      object ppLabel133: TppLabel
        UserName = 'ppLabel133'
        Caption = 'Página'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 129382
        mmTop = 1588
        mmWidth = 10054
        BandType = 8
      end
      object lblContRazCC: TppLabel
        UserName = 'lblContRazCC'
        Caption = 'lblContRazCC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 129911
        mmTop = 1588
        mmWidth = 19579
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 246063
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object lblCalcRazCC: TppSystemVariable
        UserName = 'lblCalcRazCC1'
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
        mmLeft = 93663
        mmTop = 794
        mmWidth = 1588
        BandType = 8
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'CODEXTERNO'
      DataPipeline = pplRazaoCCusto
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group9'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRazaoCCusto'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object rptRazaoCCustoLabel1: TppLabel
          UserName = 'rptRazaoCCustoLabel1'
          Caption = 'Centro de Custo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 1588
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
        object dbtxtCCusto: TppDBText
          UserName = 'dbtxtCCusto'
          DataField = 'CODEXTERNO'
          DataPipeline = pplRazaoCCusto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRazaoCCusto'
          mmHeight = 4233
          mmLeft = 30692
          mmTop = 1588
          mmWidth = 70379
          BandType = 3
          GroupNo = 0
        end
        object rptRazaoCCustoDBText2: TppDBText
          UserName = 'rptRazaoCCustoDBText2'
          DataField = 'NOMECC'
          DataPipeline = pplRazaoCCusto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRazaoCCusto'
          mmHeight = 4233
          mmLeft = 102394
          mmTop = 1588
          mmWidth = 91811
          BandType = 3
          GroupNo = 0
        end
        object rptRazaoCCustoLine1: TppLine
          UserName = 'rptRazaoCCustoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 7144
          mmWidth = 277000
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        AfterGenerate = ppGroupFooterBand9AfterGenerate
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppDBCalc2: TppDBCalc
          UserName = 'ppDBCalc2'
          DataField = 'DEB'
          DataPipeline = pplRazaoCCusto
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRazaoCCusto'
          mmHeight = 3704
          mmLeft = 207963
          mmTop = 529
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'ppDBCalc5'
          DataField = 'CRED'
          DataPipeline = pplRazaoCCusto
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRazaoCCusto'
          mmHeight = 3704
          mmLeft = 228600
          mmTop = 529
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppLabel140: TppLabel
          UserName = 'ppLabel140'
          Caption = 'Totais do Centro de Custo: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 166952
          mmTop = 529
          mmWidth = 39952
          BandType = 5
          GroupNo = 0
        end
        object ppLine55: TppLine
          UserName = 'ppLine55'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6879
          mmWidth = 277000
          BandType = 5
          GroupNo = 0
        end
        object txtSaldoCCRazCC: TppLabel
          UserName = 'txtSaldoCCRazCC'
          AutoSize = False
          Caption = 'txtSaldoCCRazCC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 249503
          mmTop = 529
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
        object txtDebCreCCRazCC: TppLabel
          UserName = 'txtDebCreCCRazCC'
          AutoSize = False
          Caption = 'txtDebCreRazCC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 270405
          mmTop = 529
          mmWidth = 5027
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'PLACONTAREF'
      DataPipeline = pplRazaoCCusto
      OutlineSettings.CreateNode = True
      UserName = 'Group11'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRazaoCCusto'
      object ppGroupHeaderBand11: TppGroupHeaderBand
        AfterGenerate = ppGroupHeaderBand11AfterGenerate
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLabel135: TppLabel
          UserName = 'ppLabel135'
          Caption = 'Conta :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 6615
          mmTop = 1058
          mmWidth = 10054
          BandType = 3
          GroupNo = 1
        end
        object dbTxtConta: TppDBText
          UserName = 'dbTxtConta'
          DataField = 'PLACONTAREF'
          DataPipeline = pplRazaoCCusto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRazaoCCusto'
          mmHeight = 3704
          mmLeft = 17463
          mmTop = 1058
          mmWidth = 70379
          BandType = 3
          GroupNo = 1
        end
        object ppLine54: TppLine
          UserName = 'ppLine54'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6085
          mmWidth = 277000
          BandType = 3
          GroupNo = 1
        end
        object ppDBText53: TppDBText
          UserName = 'ppDBText53'
          DataField = 'PLANOMEREF'
          DataPipeline = pplRazaoCCusto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRazaoCCusto'
          mmHeight = 3704
          mmLeft = 89959
          mmTop = 1058
          mmWidth = 91811
          BandType = 3
          GroupNo = 1
        end
        object ppLabel136: TppLabel
          UserName = 'ppLabel136'
          Caption = 'Conta Corresp. :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 184415
          mmTop = 1058
          mmWidth = 23813
          BandType = 3
          GroupNo = 1
        end
        object ppDBText54: TppDBText
          UserName = 'ppDBText54'
          DataField = 'PLACONCORRESP'
          DataPipeline = pplRazaoCCusto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRazaoCCusto'
          mmHeight = 3704
          mmLeft = 209550
          mmTop = 1058
          mmWidth = 31221
          BandType = 3
          GroupNo = 1
        end
        object txtSaldoCabRazCC: TppLabel
          UserName = 'txtSaldoCabRazCC'
          AutoSize = False
          Caption = 'txtSaldoCabRazCC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242094
          mmTop = 1058
          mmWidth = 27517
          BandType = 3
          GroupNo = 1
        end
        object txtDebCreCabRazCC: TppLabel
          UserName = 'txtDebCreCabRazCC'
          AutoSize = False
          Caption = 'txtDebCreCabRazCC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 269876
          mmTop = 1058
          mmWidth = 5027
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rptRazaoCCustoLabel4: TppLabel
          UserName = 'rptRazaoCCustoLabel4'
          Caption = 'Totais da Conta: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 183092
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object rptRazaoCCustoDBCalc1: TppDBCalc
          UserName = 'rptRazaoCCustoDBCalc1'
          DataField = 'DEB'
          DataPipeline = pplRazaoCCusto
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRazaoCCusto'
          mmHeight = 3704
          mmLeft = 208227
          mmTop = 1323
          mmWidth = 20108
          BandType = 5
          GroupNo = 1
        end
        object rptRazaoCCustoDBCalc2: TppDBCalc
          UserName = 'rptRazaoCCustoDBCalc2'
          DataField = 'CRED'
          DataPipeline = pplRazaoCCusto
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRazaoCCusto'
          mmHeight = 3704
          mmLeft = 228865
          mmTop = 1323
          mmWidth = 20108
          BandType = 5
          GroupNo = 1
        end
        object rptRazaoCCustoLine2: TppLine
          UserName = 'rptRazaoCCustoLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 2646
          mmLeft = 0
          mmTop = 6085
          mmWidth = 277000
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object sqlRazaoCCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT cc.codexterno,'
      
        '   L.PLACONTA, C.PLANOME, SC.NOMESUBCONTA, U.UNECODIGO, C.PLAGRA' +
        'U,'
      '   (0) AS SALDOCABECALHO, ('#39' '#39') AS DEBCRECABECALHO,'
      
        '   L.PLACONTA||'#39'                                                ' +
        '               '#39' AS PLACONTAREF,'
      '   C.PLANOME AS PLANOMEREF,'
      '   C.PLACONCORRESP, L.IDMODULO, P.PLNEFETIVADO,'
      '   SA.SALDOANT, SS.SALDO, P.PLNCODIGO, P.PLNPLANIL, P.PLNDATDIA,'
      
        '   (DECODE(L.LACDEBCRE, '#39'D'#39', L.LACVALOR, (L.LACVALOR * (-1)))) A' +
        'S MOVIMENT,'
      '   (RTRIM(L.LACHIST1)||'#39' '#39'||RTRIM(L.LACHIST2)||'#39' '#39'||'
      
        '    RTRIM(L.LACHIST3)||'#39' '#39'||RTRIM(L.LACHIST4)||'#39' '#39'||RTRIM(L.LACH' +
        'IST5)) AS HISTORICO,'
      
        '   (TO_CHAR(P.PLNPLANIL)||'#39'/'#39'||TO_CHAR(L.LACNUMLAN)) AS LANCAMEN' +
        'TO,'
      '   (DECODE(L.LACDEBCRE, '#39'D'#39', L.LACVALOR, 0)) AS DEB,'
      '   (DECODE(L.LACDEBCRE, '#39'C'#39', L.LACVALOR, 0)) AS CRED,'
      '   (DECODE(P.PLNEFETIVADO, '#39'S'#39', '#39'*'#39', '#39#39')) AS EFET,'
      '   (0) AS SALDOCORRENTE,'
      '   ('#39' '#39')  AS DEBCRE, ('#39'                  '#39') AS CONTRAPARTIDA,'
      '   L.CODCENTROCUSTO, L.CODSUBCONTA, L.LACNUMLAN,'
      '   L.LACDEBCRE, L.LACNUMDOC, CC.NOME AS NOMECC'
      'FROM'
      
        '   LANCAMENTO L, PLANILHA P, PLANOCONTA C, SUBCONTA SC, UNIDNEGO' +
        'CIO U,'
      '   CENTCUST CC,'
      '   (SELECT'
      '       S.PLACONTA, S.CODCENTROCUSTO,'
      
        '       SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRE' +
        'NTE) -'
      
        '           DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS' +
        ' SALDOANT'
      '    FROM PLANOSALDO S'
      '    WHERE'
      '          (S.IDPESSOA =:IDPESSOA) AND'
      #9'       (S.PEREXERCICIO =:EXERCICIO) AND'
      '          (S.PERNUMERO IS NULL) AND'
      '          (S.CODCENTROCUSTO IS NOT NULL) AND'
      '          (S.PLACONTA >=:CONTAINI) AND'
      '          (S.PLACONTA <=:CONTAFIM)'
      '    GROUP BY S.PLACONTA, S.CODCENTROCUSTO'
      '    ) SA,'
      '    (SELECT'
      '       L.PLACONTA, L.CODCENTROCUSTO,'
      
        '       SUM(DECODE(L.LACDEBCRE, '#39'D'#39', L.LACVALOR, (L.LACVALOR * (-' +
        '1)))) AS SALDO'
      '    FROM PLANILHA P, LANCAMENTO L'
      '    WHERE (L.PLNCODIGO = P.PLNCODIGO) AND'
      '          (P.IDPESSOA =:IDPESSOA) AND'
      '          (L.PLACONTA >= :CONTAINI) AND'
      '          (L.PLACONTA <= :CONTAFIM) AND'
      #9'       (P.PEREXERCICIO =:EXERCICIO) AND'
      '          (P.PLNDATDIA < :DATAINI)'
      '    GROUP BY L.PLACONTA, L.CODCENTROCUSTO'
      '    ) SS'
      'WHERE'
      '    (P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) AND'
      '    (P.IDPESSOA =:IDPESSOA) AND'
      '    (C.PLACONTA >= :CONTAINI) AND'
      '    (C.PLACONTA <= :CONTAFIM) AND'
      '    ((L.PLANO = C.PLANO) AND'
      '    (L.PLACONTA = C.PLACONTA)) AND'
      '    ((L.UNIDNEGOC = U.UNIDNEGOC(+)) AND'
      '    (L.IDPESSOA = U.IDPESSOA(+))) AND'
      '    (P.PLNCODIGO = L.PLNCODIGO) AND'
      '    (SA.PLACONTA(+) = L.PLACONTA) AND'
      '    (SS.PLACONTA(+) = L.PLACONTA) AND'
      '    (SA.CODCENTROCUSTO(+) = L.CODCENTROCUSTO) AND'
      '    (SS.CODCENTROCUSTO(+) = L.CODCENTROCUSTO) AND'
      '    (L.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND'
      '    (L.IDEMPRESA      = CC.IDEMPRESA) AND'
      '    (L.CODSUBCONTA = SC.CODSUBCONTA(+)) AND'
      '    (L.IDPESSOA    = SC.IDPESSOA(+))'
      'ORDER BY'
      
        '    L.CODCENTROCUSTO,PLACONTAREF, P.PLNDATDIA, P.PLNPLANIL, L.LA' +
        'CNUMLAN')
    ClientDataSet = cdsRazaoCCusto
    Left = 32
    Top = 136
  end
  object cdsRazaoCCusto: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 136
    Data = {
      5C0400009619E0BD0100000018000000210000000000030000005C040A434F44
      45585445524E4F01004900000002000753554254595045020049000A00466978
      65644368617200055749445448020002000A0008504C41434F4E544101004900
      000002000753554254595045020049000A004669786564436861720005574944
      544802000200120007504C414E4F4D4501004900000001000557494454480200
      020028000C4E4F4D45535542434F4E5441010049000000010005574944544802
      0002003C0009554E45434F4449474F0100490000000100055749445448020002
      000A0007504C414752415508000400000000000E53414C444F4341424543414C
      484F08000400000000000F4445424352454341424543414C484F010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      0200020001000B504C41434F4E54415245460100490000000200075355425459
      5045020049000A00466978656443686172000557494454480200020051000A50
      4C414E4F4D4552454601004900000001000557494454480200020028000D504C
      41434F4E434F5252455350010049000000010005574944544802000200120008
      49444D4F44554C4F08000400000000000C504C4E45464554495641444F010049
      00000002000753554254595045020049000A0046697865644368617200055749
      4454480200020001000853414C444F414E5408000400000000000553414C444F
      080004000000000009504C4E434F4449474F080004000000000009504C4E504C
      414E494C080004000000000009504C4E4441544449410800080000000000084D
      4F56494D454E54080004000000000009484953544F5249434F01004900000001
      0005574944544802000200CC000A4C414E43414D454E544F0100490000000100
      0557494454480200020051000344454208000400000000000443524544080004
      0000000000044546455401004900000001000557494454480200020001000D53
      414C444F434F5252454E54450800040000000000064445424352450100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      480200020001000D434F4E545241504152544944410100490000000200075355
      4254595045020049000A00466978656443686172000557494454480200020012
      000E434F4443454E54524F435553544F01004900000002000753554254595045
      020049000A0046697865644368617200055749445448020002000A000B434F44
      535542434F4E54410800040000000000094C41434E554D4C414E080004000000
      0000094C41434445424352450100490000000200075355425459504502004900
      0A0046697865644368617200055749445448020002000100094C41434E554D44
      4F430100490000000100055749445448020002000F00064E4F4D454343010049
      0000000100055749445448020002001E0002000D44454641554C545F4F524445
      5202008200050000001C000900120011001E00044C4349440400010009080000}
  end
  object sqlTitulos: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ codexterno,                                  ' +
        '            '
      
        '   PLACONTA, CODCENTROCUSTO, NOME, PLANOME,                     ' +
        ' '
      
        '   NOMEINDENTADO, CODEXTERNO,                                   ' +
        ' '
      
        '   PLAGRAU,                                                     ' +
        ' '
      
        '   DEB, CRED, MOV, SALDOANT, SALDO,                             ' +
        ' '
      '   DECODE(MOV, 0, '#39' '#39', DECODE(SIGN(MOV),                       '
      '   -1, '#39'C'#39', '#39'D'#39' )) AS MOVDC,                                 '
      '   DECODE(SALDO, 0, '#39' '#39', DECODE(SIGN(SALDO),                   '
      '   -1, '#39'C'#39', '#39'D'#39' )) AS DEBCRESALDO,                           '
      '   DECODE(SALDOANT, 0, '#39' '#39', DECODE(SIGN(SALDOANT),             '
      '   -1, '#39'C'#39', '#39'D'#39' )) AS DEBCREANT,                             '
      
        '   ABS(SALDOANT) as SALDOANTABS, ABS(SALDO) as SALDOABS,        ' +
        ' '
      
        '   ABS(MOV) AS MOVABS                                           ' +
        ' '
      
        'FROM (                                                          ' +
        ' '
      
        'SELECT                                                          ' +
        ' '
      
        '   CC.CODEXTERNO,                                               ' +
        '  '
      
        '   ('#39' '#39') AS PLACONTA, S.CODCENTROCUSTO, CC.NOME, ('#39' '#39') AS PLANOM' +
        'E, '
      '   ('#39' '#39') AS NOMEINDENTADO, 0 AS PLAGRAU,                       '
      
        '   SUM(S.PLSDEBITOCORRENTE) AS DEB,                             ' +
        ' '
      
        '   SUM(S.PLSCREDITOCOR) AS CRED,                                ' +
        ' '
      
        '   (SUM(S.PLSDEBITOCORRENTE) - SUM(S.PLSCREDITOCOR)) AS MOV,    ' +
        ' '
      
        '   SA.SALDOANT, SS.SALDO                                        ' +
        ' '
      
        'FROM                                                            ' +
        ' '
      
        '   PLANOSALDO S, CENTCUST CC,                                   ' +
        ' '
      
        '   (SELECT                                                      ' +
        ' '
      
        '       CODCENTROCUSTO, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PL' +
        'SDEBITOCORRENTE)      '
      
        '                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCO' +
        'R)) AS SALDOANT '
      
        '    FROM PLANOSALDO                                             ' +
        ' '
      '    WHERE (PLANO =4) AND                                    '
      '          (PEREXERCICIO =2005) AND                         '
      '          ((PERNUMERO <3) OR (PERNUMERO IS NULL)) AND  '
      '          (IDEMPRESA =1) AND                             '
      '          (RTRIM(PLACONTA) >= RTRIM('#39'0'#39')) AND              '
      
        '          (RTRIM(PLACONTA) <= RTRIM('#39'999999999999999999'#39'))      ' +
        '            '
      
        '    GROUP BY CODCENTROCUSTO ) SA,                               ' +
        ' '
      
        '                                                                ' +
        ' '
      
        '   (SELECT                                                      ' +
        ' '
      
        '       CODCENTROCUSTO, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PL' +
        'SDEBITOCORRENTE)   '
      
        '                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCO' +
        'R)) AS SALDO '
      
        '    FROM PLANOSALDO                                             ' +
        ' '
      '    WHERE (PLANO =4) AND                                    '
      '          (PEREXERCICIO =2005) AND                         '
      '          ((PERNUMERO <=5) OR (PERNUMERO IS NULL)) AND '
      '          (IDEMPRESA =1) AND                             '
      '          (RTRIM(PLACONTA) >= RTRIM('#39'0'#39')) AND              '
      
        '          (RTRIM(PLACONTA) <= RTRIM('#39'999999999999999999'#39'))      ' +
        '            '
      
        '    GROUP BY CODCENTROCUSTO ) SS                                ' +
        ' '
      
        'WHERE                                                           ' +
        ' '
      '    (CC.IDPLANCENTCUST = 1) AND '
      '    (S.IDPESSOA(+)        =1) AND                        '
      '    (S.IDEMPRESA(+)       =1) AND                        '
      '    (RTRIM(S.PLACONTA(+)) >= RTRIM('#39'0'#39')) AND               '
      
        '    (RTRIM(S.PLACONTA(+)) <= RTRIM('#39'999999999999999999'#39')) AND   ' +
        '            '
      '    (S.PEREXERCICIO(+)    =2005) AND                       '
      '    (S.PERNUMERO(+) BETWEEN 3 AND 5) AND     '
      '    (S.IDPESSOA(+) =1) AND                               '
      
        '    ((S.CODCENTROCUSTO(+) = CC.CODCENTROCUSTO) AND              ' +
        ' '
      
        '    (S.IDEMPRESA(+) = CC.IDEMPRESA)) AND                        ' +
        ' '
      
        '    (SA.CODCENTROCUSTO(+) = CC.CODCENTROCUSTO) AND              ' +
        ' '
      
        '    (SS.CODCENTROCUSTO(+) = CC.CODCENTROCUSTO)                  ' +
        ' '
      
        'GROUP BY                                                        ' +
        ' '
      
        '   S.CODCENTROCUSTO, CC.NOME, SA.SALDOANT, SS.SALDO, CC.CODEXTER' +
        'NO '
      
        'UNION ALL                                                       ' +
        ' '
      
        'SELECT                                                          ' +
        ' '
      
        '   C.PLACONTA, CC.CODEXTERNO, S.CODCENTROCUSTO, CC.NOME, DECODE(' +
        'PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,  '
      
        '   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS NOMEINDENTADO' +
        ', '
      
        '   C.PLAGRAU,                                                   ' +
        ' '
      
        '   M.DEB, M.CRED, M.MOV, SA.SALDOANT,                           ' +
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
        '  FROM  PLANOCONTAPER P,             (SELECT PLACONTA, PLANO, MI' +
        'N(TO_CHAR(PEREXERCICIO)||DECODE(LENGTH(NVL(PERNUMERO,0)),1,'#39'0'#39'||' +
        'TO_CHAR(NVL(PERNUMERO,0)),TO_CHAR(NVL(PERNUMERO,0)))) AS PERNUME' +
        'RO              FROM PLANOCONTAPER              WHERE (TO_CHAR(P' +
        'EREXERCICIO)||DECODE(LENGTH(NVL(PERNUMERO,0)),1,'#39'0'#39'||TO_CHAR(NVL' +
        '(PERNUMERO,0)),TO_CHAR(NVL(PERNUMERO,0))) >= '#39'200503'#39')          ' +
        '      AND (IDPESSOA = 1)              GROUP BY  PLACONTA, PLANO)' +
        ' PX   WHERE (P.PLACONTA = PX.PLACONTA)     AND (P.PLANO = PX.PLA' +
        'NO)           AND (P.IDPESSOA = 1)     AND (TO_CHAR(P.PEREXERCIC' +
        'IO)||DECODE(LENGTH(NVL(P.PERNUMERO,0)),1,'#39'0'#39'||TO_CHAR(NVL(P.PERN' +
        'UMERO,0)),TO_CHAR(NVL(P.PERNUMERO,0))) = PX.PERNUMERO))  PD, '
      
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
      '          (PEREXERCICIO =2005) AND                         '
      '          ((PERNUMERO <3) OR (PERNUMERO IS NULL)) AND  '
      '          (IDPESSOA =1) AND                              '
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
      '          (PERNUMERO BETWEEN 3 AND 5) AND    '
      '          (PEREXERCICIO =2005) AND                         '
      '          (IDPESSOA     =1) AND                          '
      '          (RTRIM(PLACONTA) >= RTRIM('#39'0'#39')) AND              '
      
        '          (RTRIM(PLACONTA) <= RTRIM('#39'999999999999999999'#39'))      ' +
        '            '
      
        '    GROUP BY PLACONTA, CODCENTROCUSTO ) M                       ' +
        ' '
      
        'WHERE                                                           ' +
        ' '
      '    (S.IDPESSOA(+)     =1) AND                           '
      '    (S.IDEMPRESA(+)    =1) AND                           '
      '    (RTRIM(C.PLACONTA) >= RTRIM('#39'0'#39')) AND                  '
      
        '    (RTRIM(C.PLACONTA) <= RTRIM('#39'999999999999999999'#39')) AND      ' +
        '            '
      '    (S.PEREXERCICIO(+) =2005) AND                          '
      '    ((S.PERNUMERO     <=5) OR (S.PERNUMERO IS NULL)) AND   '
      '    (S.IDPESSOA(+)    =1) AND                           '
      '    (S.PLANO          =4) AND                              '
      '    (SA.PLACONTA(+)   = S.PLACONTA) AND                         '
      
        '    (M.PLACONTA(+)        = S.PLACONTA) AND                     ' +
        ' '
      
        '    (SA.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND               ' +
        ' '
      
        '    (M.CODCENTROCUSTO(+)  = S.CODCENTROCUSTO) AND               ' +
        ' '
      
        '    (CC.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND               ' +
        ' '
      
        '    (CC.IDEMPRESA(+)      = S.IDEMPRESA) AND                    ' +
        ' '
      '    (CC.IDPLANCENTCUST = 1) AND '
      
        '    (PD.PLACONTA(+) = C.PLACONTA) AND                           ' +
        ' '
      
        '    (PD.PLANO(+) = C.PLANO) AND                                 ' +
        ' '
      
        '    (S.PLACONTA           = C.PLACONTA) AND                     ' +
        ' '
      
        '    (S.PLANO              = C.PLANO)                            ' +
        ' '
      
        'GROUP BY                                                        ' +
        ' '
      
        '   C.PLACONTA, S.CODCENTROCUSTO, DECODE(PD.PLANOME,NULL,C.PLANOM' +
        'E,PD.PLANOME), CC.NOME, C.PLAGRAU,  '
      
        '   M.DEB,M.CRED,M.MOV, SA.SALDOANT, CC.CODEXTERNO )             ' +
        ' '
      'WHERE (PLACONTA <> '#39' '#39')                                        '
      
        '  AND ((NVL(DEB,0) <> 0)                                        ' +
        ' '
      
        '  OR  (NVL(CRED,0) <> 0)                                        ' +
        ' '
      
        '  OR  (NVL(SALDOANT,0) <> 0))                                   ' +
        ' '
      
        'ORDER BY CODEXTERNO, CODCENTROCUSTO, PLACONTA                   ' +
        ' ')
    ClientDataSet = cdsTitulos
    Left = 232
    Top = 136
  end
  object cdsTitulos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 184
  end
end
