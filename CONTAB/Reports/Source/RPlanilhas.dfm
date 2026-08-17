inherited rptPlanilhas: TrptPlanilhas
  Left = 231
  Top = 186
  Width = 465
  Height = 247
  Caption = 'Relatório Planilhas Lançadas'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Planilhas Lançadas'
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
        Required = True
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
        Required = True
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
        Name = 'Planilha Inicial'
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
        Name = 'Planilha Final'
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
        Caption = 'Sistema de Origem'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   IDMODULO, NOMEMODULO '
          'FROM '
          '   MODULO'
          'ORDER BY '
          '   NOMEMODULO')
        LookupSettings.Chave = 'IDMODULO'
        LookupSettings.Display = 'IDMODULO|NOMEMODULO'
        LookupSettings.Descricao = 'Código|Modulo'
        LookupSettings.Tamanho = '10|20'
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
        Caption = 'Cód. Histórico Padrão'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   HITCODHIST, HITDESCR1 '
          'FROM '
          '   HISTOPADRAO'
          'WHERE'
          '   IDPESSOA=1'
          'ORDER BY '
          '   HITCODHIST')
        LookupSettings.Chave = 'HITCODHIST'
        LookupSettings.Display = 'HITCODHIST|HITDESCR1'
        LookupSettings.Descricao = 'Código|Descrição'
        LookupSettings.Tamanho = '10|20'
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
        Name = 'Cód. Histórico Padrão'
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
          '   TIPCODIGO, TIPDESCRICAO '
          'FROM '
          '   TIPOPER'
          'ORDER BY '
          '   TIPDESCRICAO')
        LookupSettings.Chave = 'TIPCODIGO'
        LookupSettings.Display = 'TIPCODIGO|TIPDESCRICAO'
        LookupSettings.Descricao = 'Código|Descrição'
        LookupSettings.Tamanho = '10|25'
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
        Caption = 'Nº do Documento'
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
        Name = 'Nº do Documento'
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
        Caption = 'Processar lançamentos'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todos'
          'Integrados'
          'NÃO Integrados')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 1
        RadioGroupSettings.Height = 70
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
        Name = 'Processar lançamentos'
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
        Caption = 'Valores dos lançamentos'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todos'
          'Crédito igual ao Débito'
          'Crédito diferente do Débito')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 70
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
        Name = 'Valores dos lançamentos'
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
        Caption = 'Ordenado por'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Código da Planilha'
          'Data + Número da Planilha'
          'Data + Número do Documento')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 1
        RadioGroupSettings.Height = 70
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
        Name = 'Ordenado por'
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
        Caption = 'Quebra página por planilha'
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
        RadioGroupSettings.Height = 70
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
        Name = 'Quebra página por planilha'
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
        MostraComboCompara = True
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
        Caption = 'Imprime a Atividade/Projeto Sintética'
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
        Width = 0
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
        Width = 0
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    Left = 28
    Top = 64
  end
  inherited DevRptCM: TExtraOptions
    Left = 28
    Top = 12
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rptPlanilhas
    LabelEmpresa = ppLabel9
    LabelSistema = ppLabel23
    Left = 28
    Top = 108
  end
  object dsPlanilhas: TwwDataSource
    DataSet = Cds
    Left = 109
    Top = 112
  end
  object pplPlanilhas: TppDBPipeline
    DataSource = dsPlanilhas
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lPlanilhas'
    Left = 109
    Top = 68
    object pplPlanilhasppField1: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 0
    end
    object pplPlanilhasppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplPlanilhasppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNPLANIL'
      FieldName = 'PLNPLANIL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplPlanilhasppField4: TppField
      FieldAlias = 'PLNDATDIA'
      FieldName = 'PLNDATDIA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object pplPlanilhasppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'LACNUMLAN'
      FieldName = 'LACNUMLAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplPlanilhasppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLAGRAU'
      FieldName = 'PLAGRAU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplPlanilhasppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDEB'
      FieldName = 'TOTDEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplPlanilhasppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTCRED'
      FieldName = 'TOTCRED'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplPlanilhasppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIF'
      FieldName = 'DIF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplPlanilhasppField10: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object pplPlanilhasppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'LACVALOR'
      FieldName = 'LACVALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplPlanilhasppField12: TppField
      FieldAlias = 'PLANOME'
      FieldName = 'PLANOME'
      FieldLength = 40
      DisplayWidth = 40
      Position = 11
    end
    object pplPlanilhasppField13: TppField
      FieldAlias = 'LACDEBCRE'
      FieldName = 'LACDEBCRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
    object pplPlanilhasppField14: TppField
      FieldAlias = 'NOMEMODULO'
      FieldName = 'NOMEMODULO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 13
    end
    object pplPlanilhasppField15: TppField
      FieldAlias = 'LACNUMDOC'
      FieldName = 'LACNUMDOC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 14
    end
    object pplPlanilhasppField16: TppField
      FieldAlias = 'UNECODIGO'
      FieldName = 'UNECODIGO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
    object pplPlanilhasppField17: TppField
      FieldAlias = 'LACHIST1'
      FieldName = 'LACHIST1'
      FieldLength = 40
      DisplayWidth = 40
      Position = 16
    end
    object pplPlanilhasppField18: TppField
      FieldAlias = 'LACHIST2'
      FieldName = 'LACHIST2'
      FieldLength = 40
      DisplayWidth = 40
      Position = 17
    end
    object pplPlanilhasppField19: TppField
      FieldAlias = 'LACHIST3'
      FieldName = 'LACHIST3'
      FieldLength = 40
      DisplayWidth = 40
      Position = 18
    end
    object pplPlanilhasppField20: TppField
      FieldAlias = 'LACHIST4'
      FieldName = 'LACHIST4'
      FieldLength = 40
      DisplayWidth = 40
      Position = 19
    end
    object pplPlanilhasppField21: TppField
      FieldAlias = 'LACHIST5'
      FieldName = 'LACHIST5'
      FieldLength = 40
      DisplayWidth = 40
      Position = 20
    end
    object pplPlanilhasppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNNUMLAN'
      FieldName = 'PLNNUMLAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplPlanilhasppField23: TppField
      FieldAlias = 'PLNEFETIVADO'
      FieldName = 'PLNEFETIVADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 22
    end
    object pplPlanilhasppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODSUBCONTA'
      FieldName = 'CODSUBCONTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplPlanilhasppField25: TppField
      FieldAlias = 'NOMESUBCONTA'
      FieldName = 'NOMESUBCONTA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 24
    end
    object pplPlanilhasppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEB'
      FieldName = 'DEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplPlanilhasppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'CRE'
      FieldName = 'CRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplPlanilhasppField28: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 204
      DisplayWidth = 204
      Position = 27
    end
    object pplPlanilhasppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplPlanilhasppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplPlanilhasppField31: TppField
      FieldAlias = 'PLANPREVCONTABIL'
      FieldName = 'PLANPREVCONTABIL'
      FieldLength = 50
      DisplayWidth = 50
      Position = 30
    end
    object pplPlanilhasppField32: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 31
    end
  end
  object Cds: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 289
    Top = 92
    Data = {
      B40300009619E0BD010000001800000020000000000003000000B40308504C41
      434F4E544101004900000002000753554254595045020049000A004669786564
      436861720005574944544802000200120009504C4E434F4449474F0800040000
      00000009504C4E504C414E494C080004000000000009504C4E44415444494108
      00080000000000094C41434E554D4C414E080004000000000007504C41475241
      55080004000000000006544F54444542080004000000000007544F5443524544
      08000400000000000344494608000400000000000E434F4443454E54524F4355
      53544F01004900000002000753554254595045020049000A0046697865644368
      617200055749445448020002000A00084C414356414C4F520800040000000000
      07504C414E4F4D450100490000000100055749445448020002002800094C4143
      44454243524501004900000002000753554254595045020049000A0046697865
      6443686172000557494454480200020001000A4E4F4D454D4F44554C4F010049
      00000002000753554254595045020049000A0046697865644368617200055749
      445448020002003200094C41434E554D444F4301004900000001000557494454
      48020002000F0009554E45434F4449474F010049000000010005574944544802
      0002000A00084C41434849535431010049000000010005574944544802000200
      2800084C41434849535432010049000000010005574944544802000200280008
      4C414348495354330100490000000100055749445448020002002800084C4143
      48495354340100490000000100055749445448020002002800084C4143484953
      5435010049000000010005574944544802000200280009504C4E4E554D4C414E
      08000400000000000C504C4E45464554495641444F0100490000000200075355
      4254595045020049000A00466978656443686172000557494454480200020001
      000B434F44535542434F4E544108000400000000000C4E4F4D45535542434F4E
      54410100490000000100055749445448020002003C0003444542080004000000
      000003435245080004000000000009484953544F5249434F0100490000000100
      05574944544802000200CC000B4944504C414E4F505245560800040000000000
      074944504154524F080004000000000010504C414E50524556434F4E54414249
      4C010049000000010005574944544802000200320005504154524F0100490000
      000100055749445448020002003C0002000D44454641554C545F4F5244455202
      0082000200000002000500044C4349440400010009080000}
  end
  object sqlPlanilhas: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   L.PLACONTA, P.PLNCODIGO, P.PLNPLANIL, P.PLNDATDIA, l.LACNUMLA' +
        'N, C.PLAGRAU,'
      '   SA.TOTDEB, SA.TOTCRED, SA.DIF,'
      ''
      '   --Inicio - Rodolpho da Silva - pend 20506'
      '   --  L.CODCENTROCUSTO,'
      '     CC.CODEXTERNO AS CODCENTROCUSTO,'
      '   --Fim - Rodolpho da Silva - pend 20506'
      ''
      ''
      
        '   L.LACVALOR,C.PLANOME, L.LACDEBCRE, M.NOMEMODULO,  L.LACNUMDOC' +
        ','
      
        '   U.UNECODIGO, L.LACHIST1,L.LACHIST2,L.LACHIST3,L.LACHIST4,L.LA' +
        'CHIST5,'
      '   P.PLNNUMLAN, P.PLNEFETIVADO, L.CODSUBCONTA, S.NOMESUBCONTA,'
      '   DECODE(L.LACDEBCRE, '#39'D'#39',L.LACVALOR, 0) AS DEB,'
      '   DECODE(L.LACDEBCRE, '#39'C'#39',L.LACVALOR, 0) AS CRE,'
      
        '   (L.LACHIST1||'#39' '#39'||L.LACHIST2||'#39' '#39'||L.LACHIST3||'#39' '#39'||L.LACHIST' +
        '4||'#39' '#39'||L.LACHIST5) AS HISTORICO,'
      '   -- by alex 24/06 -pend 14304'
      
        '   L.IDPLANOPREV, L.IDPATRO, PC.NOME AS PLANPREVCONTABIL, PP.NOM' +
        'E AS PATRO'
      '   -- fim by alex'
      'FROM'
      
        '   LANCAMENTO L, PLANILHA P, PLANOCONTA C, SUBCONTA S, UNIDNEGOC' +
        'IO U, MODULO M,'
      '   -- by alex 24/06 -pend 14304'
      '   PLANPREVCONTABIL PC, PATRO PT, PESSOA PP,'
      '   -- fim by alex'
      ''
      '   --Inicio - Rodolpho da Silva - pend 20506'
      '     CENTCUST CC,'
      '   --Fim - Rodolpho da Silva - pend 20506'
      ''
      ''
      '   (SELECT P.PLNCODIGO,'
      
        '                  SUM(DECODE(L.LACDEBCRE, '#39'D'#39',L.LACVALOR, 0)) AS' +
        ' TOTDEB,'
      
        '                  SUM(DECODE(L.LACDEBCRE, '#39'C'#39', L.LACVALOR, 0)) A' +
        'S TOTCRED,'
      
        '                  SUM(DECODE(L.LACDEBCRE, '#39'D'#39', L.LACVALOR, (L.LA' +
        'CVALOR * -1))) AS DIF'
      '   FROM PLANILHA P, LANCAMENTO L'
      '   WHERE'
      '   (P.PLNCODIGO = L.PLNCODIGO) AND'
      '   (L.PLANO =2) AND'
      '   (P.PERNUMERO =1) AND'
      '   (P.PEREXERCICIO =1999) AND'
      '   (P.IDPESSOA =1) AND'
      '   ((P.PLNCODIGO >=1) AND'
      '   (P.PLNCODIGO <=999999999))'
      '   GROUP BY P.PLNCODIGO'
      
        '   HAVING SUM(DECODE(L.LACDEBCRE, '#39'D'#39', L.LACVALOR, (L.LACVALOR *' +
        ' -1))) <> 0'
      ') SA'
      'WHERE'
      '((L.PLANO = C.PLANO) AND'
      '(L.PLACONTA = C.PLACONTA)) AND'
      '(P.PLNCODIGO = L.PLNCODIGO) AND'
      '(L.UNIDNEGOC = U.UNIDNEGOC) AND'
      ''
      '--Inicio - Rodolpho da Silva - pend 20506'
      ' (CC.CODCENTROCUSTO(+) = L.CODCENTROCUSTO) AND'
      '--Fim - Rodolpho da Silva - pend 20506'
      ''
      ''
      '(P.IDMODULO = M.IDMODULO) AND'
      '-- by alex 24/06 -pend 14304'
      '(L.IDPLANOPREV = PC.IDPLANOPREV(+)) AND'
      '(L.IDPATRO = PT.IDPESSOA(+)) AND'
      '(PT.IDPESSOA = PP.IDPESSOA(+)) AND'
      '-- fim by alex'
      '(P.PLNCODIGO = SA.PLNCODIGO) AND'
      '(L.CODSUBCONTA = S.CODSUBCONTA(+)) AND'
      '(C.PLANO =2) AND'
      '(P.PERNUMERO =1) AND'
      '(P.PEREXERCICIO =1999) AND'
      '(P.IDPESSOA =1) AND'
      '((P.PLNCODIGO >=1) AND'
      ' (P.PLNCODIGO <=999999999)) AND'
      '(1 = 2)'
      ''
      'ORDER BY P.PLNCODIGO,L.LACNUMLAN'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = Cds
    Left = 288
    Top = 32
  end
  object rptPlanilhas: TppReport
    AutoStop = False
    DataPipeline = pplPlanilhas
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 109
    Top = 16
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplPlanilhas'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object pplblTituloPlanilhas: TppLabel
        UserName = 'pplblTituloPlanilhas'
        Caption = 'Planilhas Lançadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 124090
        mmTop = 8731
        mmWidth = 39423
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'ppLine8'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19315
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'ppLabel9'
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
      object ppLabel10: TppLabel
        UserName = 'ppLabel10'
        Caption = 'Cód. Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 11906
        mmTop = 21960
        mmWidth = 15875
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'ppLine10'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27252
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'ppLabel12'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 38629
        mmTop = 21960
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'ppLabel19'
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 260880
        mmTop = 21960
        mmWidth = 10848
        BandType = 0
      end
      object pplblTituloPlanilhas2: TppLabel
        UserName = 'pplblTituloPlanilhas2'
        Caption = 'pplblTituloPlanilhas2'
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
      object rptPlanilhasLabel8: TppLabel
        UserName = 'rptPlanilhasLabel8'
        Caption = 'Ativ./Proj.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 177271
        mmTop = 21960
        mmWidth = 13758
        BandType = 0
      end
      object rptPlanilhasLabel9: TppLabel
        UserName = 'rptPlanilhasLabel9'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 114036
        mmTop = 21960
        mmWidth = 12965
        BandType = 0
      end
      object rptPlanilhasLabel10: TppLabel
        UserName = 'rptPlanilhasLabel10'
        Caption = 'Sub-Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 191559
        mmTop = 21960
        mmWidth = 15081
        BandType = 0
      end
      object rptPlanilhasLabel11: TppLabel
        UserName = 'rptPlanilhasLabel11'
        Caption = 'Lanç.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 21960
        mmWidth = 7673
        BandType = 0
      end
      object rptPlanilhasLabel13: TppLabel
        UserName = 'rptPlanilhasLabel13'
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 234421
        mmTop = 21960
        mmWidth = 9260
        BandType = 0
      end
      object rptPlanilhasLabel5: TppLabel
        UserName = 'rptPlanilhasLabel5'
        Caption = 'C.Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 164836
        mmTop = 21960
        mmWidth = 11642
        BandType = 0
      end
      object rptPlanilhasLabel14: TppLabel
        UserName = 'rptPlanilhasLabel14'
        Caption = 'Nº Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 92075
        mmTop = 21960
        mmWidth = 20373
        BandType = 0
      end
    end
    object bndDetPlanilhas: TppDetailBand
      BeforeGenerate = bndDetPlanilhasBeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object dbtxtContaPlanilhas: TppDBText
        UserName = 'dbtxtContaPlanilhas'
        DataField = 'PLACONTA'
        DataPipeline = pplPlanilhas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPlanilhas'
        mmHeight = 3175
        mmLeft = 7673
        mmTop = 529
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        DataField = 'PLANOME'
        DataPipeline = pplPlanilhas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPlanilhas'
        mmHeight = 3175
        mmLeft = 38629
        mmTop = 529
        mmWidth = 53711
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'ppDBText9'
        BlankWhenZero = True
        DataField = 'DEB'
        DataPipeline = pplPlanilhas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPlanilhas'
        mmHeight = 3175
        mmLeft = 223044
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object rptPlanilhasDBMemo1: TppDBMemo
        UserName = 'rptPlanilhasDBMemo1'
        CharWrap = False
        DataField = 'HISTORICO'
        DataPipeline = pplPlanilhas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplPlanilhas'
        mmHeight = 3704
        mmLeft = 113506
        mmTop = 529
        mmWidth = 50536
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object dbtxtUnidNegocPlanilhas: TppDBText
        UserName = 'dbtxtUnidNegocPlanilhas'
        DataField = 'UNECODIGO'
        DataPipeline = pplPlanilhas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPlanilhas'
        mmHeight = 3175
        mmLeft = 178594
        mmTop = 529
        mmWidth = 11906
        BandType = 4
      end
      object rptPlanilhasDBText9: TppDBText
        UserName = 'rptPlanilhasDBText9'
        DataField = 'NOMESUBCONTA'
        DataPipeline = pplPlanilhas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPlanilhas'
        mmHeight = 3175
        mmLeft = 191559
        mmTop = 529
        mmWidth = 30956
        BandType = 4
      end
      object rptPlanilhasDBText11: TppDBText
        UserName = 'rptPlanilhasDBText11'
        DataField = 'LACNUMLAN'
        DataPipeline = pplPlanilhas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPlanilhas'
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 529
        mmWidth = 4233
        BandType = 4
      end
      object rptPlanilhasDBText8: TppDBText
        UserName = 'rptPlanilhasDBText8'
        BlankWhenZero = True
        DataField = 'CRE'
        DataPipeline = pplPlanilhas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPlanilhas'
        mmHeight = 3175
        mmLeft = 249767
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object dbtxtCCustoPlanilhas: TppDBText
        UserName = 'dbtxtCCustoPlanilhas'
        DataField = 'CODCENTROCUSTO'
        DataPipeline = pplPlanilhas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPlanilhas'
        mmHeight = 3175
        mmLeft = 164836
        mmTop = 529
        mmWidth = 12435
        BandType = 4
      end
      object rptPlanilhasDBText12: TppDBText
        UserName = 'rptPlanilhasDBText12'
        DataField = 'LACNUMDOC'
        DataPipeline = pplPlanilhas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPlanilhas'
        mmHeight = 3175
        mmLeft = 93398
        mmTop = 529
        mmWidth = 18521
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object ppLabel23: TppLabel
        UserName = 'ppLabel23'
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
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
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
      object ppCalc8: TppSystemVariable
        UserName = 'Calc8'
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
    object ppGroup2: TppGroup
      BreakName = 'PLNCODIGO'
      DataPipeline = pplPlanilhas
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplPlanilhas'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object rptPlanilhasLine1: TppLine
          UserName = 'rptPlanilhasLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5292
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object rptPlanilhasLabel1: TppLabel
          UserName = 'rptPlanilhasLabel1'
          Caption = 'Planilha :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 5556
          mmTop = 794
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rptPlanilhasDBText2: TppDBText
          UserName = 'rptPlanilhasDBText2'
          DataField = 'PLNPLANIL'
          DataPipeline = pplPlanilhas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplPlanilhas'
          mmHeight = 3704
          mmLeft = 18785
          mmTop = 794
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object rptPlanilhasDBText3: TppDBText
          UserName = 'rptPlanilhasDBText3'
          DataField = 'PLNNUMLAN'
          DataPipeline = pplPlanilhas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplPlanilhas'
          mmHeight = 3704
          mmLeft = 96044
          mmTop = 794
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object rptPlanilhasLabel3: TppLabel
          UserName = 'rptPlanilhasLabel3'
          Caption = 'N° Lançtos. :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 77258
          mmTop = 794
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object rptPlanilhasLabel7: TppLabel
          UserName = 'rptPlanilhasLabel7'
          Caption = 'Efetivada :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 117740
          mmTop = 794
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rptPlanilhasDBText7: TppDBText
          UserName = 'rptPlanilhasDBText7'
          DataField = 'PLNEFETIVADO'
          DataPipeline = pplPlanilhas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplPlanilhas'
          mmHeight = 3704
          mmLeft = 133350
          mmTop = 794
          mmWidth = 3440
          BandType = 3
          GroupNo = 0
        end
        object rptPlanilhasDBText10: TppDBText
          UserName = 'rptPlanilhasDBText10'
          DataField = 'PLNDATDIA'
          DataPipeline = pplPlanilhas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplPlanilhas'
          mmHeight = 3704
          mmLeft = 54240
          mmTop = 794
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rptPlanilhasLabel2: TppLabel
          UserName = 'rptPlanilhasLabel2'
          Caption = 'Data :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 45508
          mmTop = 794
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rptPlanilhasLabel12: TppLabel
          UserName = 'rptPlanilhasLabel12'
          Caption = 'Sistema de Origem :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 146579
          mmTop = 794
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object rptPlanilhasDBText1: TppDBText
          UserName = 'rptPlanilhasDBText1'
          DataField = 'NOMEMODULO'
          DataPipeline = pplPlanilhas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplPlanilhas'
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 794
          mmWidth = 77258
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object rptPlanilhasLine2: TppLine
          UserName = 'rptPlanilhasLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object rptPlanilhasDBText6: TppDBText
          UserName = 'rptPlanilhasDBText6'
          DataField = 'DIF'
          DataPipeline = pplPlanilhas
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplPlanilhas'
          mmHeight = 3704
          mmLeft = 179652
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object rptPlanilhasLabel6: TppLabel
          UserName = 'rptPlanilhasLabel6'
          Caption = 'Diferença :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 162719
          mmTop = 1323
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object rptPlanilhasDBText5: TppDBText
          UserName = 'rptPlanilhasDBText5'
          DataField = 'TOTCRED'
          DataPipeline = pplPlanilhas
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplPlanilhas'
          mmHeight = 3704
          mmLeft = 249767
          mmTop = 1323
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object rptPlanilhasDBText4: TppDBText
          UserName = 'rptPlanilhasDBText4'
          DataField = 'TOTDEB'
          DataPipeline = pplPlanilhas
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplPlanilhas'
          mmHeight = 3704
          mmLeft = 223044
          mmTop = 1323
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object rptPlanilhasLabel4: TppLabel
          UserName = 'rptPlanilhasLabel4'
          Caption = 'Totais :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 210609
          mmTop = 1323
          mmWidth = 10583
          BandType = 5
          GroupNo = 0
        end
        object ppLine11: TppLine
          UserName = 'ppLine11'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 5821
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 144
  end
  object sqlAux: TCMSqlParams
    ClientDataSet = cdsAux
    Left = 184
    Top = 96
  end
end
