inherited rptMapaEvolu: TrptMapaEvolu
  Left = 288
  Top = 224
  Width = 420
  Height = 224
  Caption = 'Relatório Mapa de Evolução'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório Mapa de Evolução'
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
        Caption = 'Centro de Custo'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   CODCENTROCUSTO,'
          '   NOME'
          'FROM'
          '   CENTCUST'
          'ORDER BY NOME'
          '')
        LookupSettings.Chave = 'CODCENTROCUSTO'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Centro de Custo'
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
        Name = 'Centro de Custo'
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
          'ORDER BY NOME'
          '')
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
        Caption = 'Moeda'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT MOECODIGO,MOEDESC,MOESIGLA FROM MOEDA WHERE '
          'MOEINATIVO = '#39'A'#39' ORDER BY MOEDESC'
          '')
        LookupSettings.Chave = 'MOECODIGO'
        LookupSettings.Display = 'MOEDESC'
        LookupSettings.Descricao = 'Descrição'
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
        Caption = 'Imprimir Contas até o Grau'
        Controle = tcSpinEdit
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
        Name = 'Imprimir Contas até o Grau'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 1
        SpinEditSettings.Increment = 1
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
        Caption = 'Imprime linhas com os valores zerados'
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
        Name = 'Imprime linhas com os valores zerados'
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
        Caption = 'Nome dos planos previdenciários'
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
        Caption = 'Nome das Patrocinadoras'
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
        Caption = 'Exercicio Seguinte'
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
        Name = 'ExercicioSeg'
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
        Name = 'ContaInicial'
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
        Name = 'ContaFinal'
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
    Formheight = 280
    FormWidth = 400
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptMapaEvolu
    LabelEmpresa = LblEmpresa
    LabelSistema = lblSistema
    Left = 75
  end
  object dsMapaEvolu: TwwDataSource
    DataSet = cdsMapaEvolu
    Left = 197
    Top = 80
  end
  object pplMapaEvolu: TppBDEPipeline
    DataSource = dsMapaEvolu
    UserName = 'lMapaEvolu'
    Left = 269
    Top = 80
    object pplMapaEvoluppField1: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 0
    end
    object pplMapaEvoluppField2: TppField
      FieldAlias = 'PLANOME'
      FieldName = 'PLANOME'
      FieldLength = 40
      DisplayWidth = 40
      Position = 1
    end
    object pplMapaEvoluppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLAGRAU'
      FieldName = 'PLAGRAU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplMapaEvoluppField4: TppField
      FieldAlias = 'PLAGRUPO'
      FieldName = 'PLAGRUPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object pplMapaEvoluppField5: TppField
      FieldAlias = 'PLANATUREZA'
      FieldName = 'PLANATUREZA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object pplMapaEvoluppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'JANS'
      FieldName = 'JANS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplMapaEvoluppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'FEVS'
      FieldName = 'FEVS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplMapaEvoluppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'MARS'
      FieldName = 'MARS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplMapaEvoluppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'ABRS'
      FieldName = 'ABRS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplMapaEvoluppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'MAIS'
      FieldName = 'MAIS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplMapaEvoluppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'JUNS'
      FieldName = 'JUNS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplMapaEvoluppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'JULS'
      FieldName = 'JULS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplMapaEvoluppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGOS'
      FieldName = 'AGOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplMapaEvoluppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'SEBS'
      FieldName = 'SEBS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplMapaEvoluppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'OUTS'
      FieldName = 'OUTS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplMapaEvoluppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'NOVS'
      FieldName = 'NOVS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplMapaEvoluppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEZS'
      FieldName = 'DEZS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplMapaEvoluppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'JANM'
      FieldName = 'JANM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplMapaEvoluppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'FEVM'
      FieldName = 'FEVM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplMapaEvoluppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'MARM'
      FieldName = 'MARM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplMapaEvoluppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'ABRM'
      FieldName = 'ABRM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplMapaEvoluppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'MAIM'
      FieldName = 'MAIM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplMapaEvoluppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'JUNM'
      FieldName = 'JUNM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplMapaEvoluppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'JULM'
      FieldName = 'JULM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplMapaEvoluppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGOM'
      FieldName = 'AGOM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplMapaEvoluppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'SEBM'
      FieldName = 'SEBM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplMapaEvoluppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'OUTM'
      FieldName = 'OUTM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplMapaEvoluppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'NOVM'
      FieldName = 'NOVM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplMapaEvoluppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEZM'
      FieldName = 'DEZM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplMapaEvoluppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'JANP'
      FieldName = 'JANP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplMapaEvoluppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'FEVP'
      FieldName = 'FEVP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object pplMapaEvoluppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'MARP'
      FieldName = 'MARP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object pplMapaEvoluppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'ABRP'
      FieldName = 'ABRP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object pplMapaEvoluppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'MAIP'
      FieldName = 'MAIP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object pplMapaEvoluppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'JUNP'
      FieldName = 'JUNP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object pplMapaEvoluppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'JULP'
      FieldName = 'JULP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object pplMapaEvoluppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGOP'
      FieldName = 'AGOP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object pplMapaEvoluppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'SEBP'
      FieldName = 'SEBP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object pplMapaEvoluppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'OUTP'
      FieldName = 'OUTP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object pplMapaEvoluppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'NOVP'
      FieldName = 'NOVP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object pplMapaEvoluppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEZP'
      FieldName = 'DEZP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object pplMapaEvoluppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'JANPM'
      FieldName = 'JANPM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 41
    end
    object pplMapaEvoluppField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'FEVPM'
      FieldName = 'FEVPM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 42
    end
    object pplMapaEvoluppField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'MARPM'
      FieldName = 'MARPM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 43
    end
    object pplMapaEvoluppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'ABRPM'
      FieldName = 'ABRPM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 44
    end
    object pplMapaEvoluppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'MAIPM'
      FieldName = 'MAIPM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object pplMapaEvoluppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'JUNPM'
      FieldName = 'JUNPM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object pplMapaEvoluppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'JULPM'
      FieldName = 'JULPM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 47
    end
    object pplMapaEvoluppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGOPM'
      FieldName = 'AGOPM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object pplMapaEvoluppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'SEBPM'
      FieldName = 'SEBPM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 49
    end
    object pplMapaEvoluppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'OUTPM'
      FieldName = 'OUTPM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 50
    end
    object pplMapaEvoluppField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'NOVPM'
      FieldName = 'NOVPM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 51
    end
    object pplMapaEvoluppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEZPM'
      FieldName = 'DEZPM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 52
    end
  end
  object rptMapaEvolu: TppReport
    AutoStop = False
    DataPipeline = pplMapaEvolu
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
    PrinterSetup.mmPaperHeight = 209815
    PrinterSetup.mmPaperWidth = 297127
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
    Left = 349
    Top = 80
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplMapaEvolu'
    object ppHeaderBand18: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37042
      mmPrintPosition = 0
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
      object rptMapaEvoluLabel1: TppLabel
        UserName = 'rptMapaEvoluLabel1'
        Caption = 'Mapa de Evolução das Contas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 107156
        mmTop = 8996
        mmWidth = 70115
        BandType = 0
      end
      object rptMapaEvoluLabel2: TppLabel
        UserName = 'rptMapaEvoluLabel2'
        Caption = 'Contas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 265
        mmTop = 30692
        mmWidth = 8467
        BandType = 0
      end
      object rptMapaEvoluLabel3: TppLabel
        UserName = 'rptMapaEvoluLabel3'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 16140
        mmTop = 30692
        mmWidth = 11906
        BandType = 0
      end
      object rptMes1: TppLabel
        UserName = 'rptMes1'
        AutoSize = False
        Caption = 'Jan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 52652
        mmTop = 30427
        mmWidth = 18256
        BandType = 0
      end
      object rptMes2: TppLabel
        UserName = 'rptMes2'
        AutoSize = False
        Caption = 'Fev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 72231
        mmTop = 30692
        mmWidth = 18256
        BandType = 0
      end
      object rptMes3: TppLabel
        UserName = 'rptMes3'
        AutoSize = False
        Caption = 'Mar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 91281
        mmTop = 30692
        mmWidth = 18256
        BandType = 0
      end
      object rptMes4: TppLabel
        UserName = 'rptMes4'
        AutoSize = False
        Caption = 'Abr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 110331
        mmTop = 30692
        mmWidth = 18256
        BandType = 0
      end
      object rptMes5: TppLabel
        UserName = 'rptMes5'
        AutoSize = False
        Caption = 'Mai'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 128852
        mmTop = 30692
        mmWidth = 18256
        BandType = 0
      end
      object rptMes6: TppLabel
        UserName = 'rptMes6'
        AutoSize = False
        Caption = 'Jun'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 147638
        mmTop = 30692
        mmWidth = 18256
        BandType = 0
      end
      object rptMes7: TppLabel
        UserName = 'rptMes7'
        AutoSize = False
        Caption = 'Jul'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 166688
        mmTop = 30692
        mmWidth = 18256
        BandType = 0
      end
      object rptMes8: TppLabel
        UserName = 'rptMes8'
        AutoSize = False
        Caption = 'Ago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 185738
        mmTop = 30692
        mmWidth = 18256
        BandType = 0
      end
      object rptMes9: TppLabel
        UserName = 'rptMes9'
        AutoSize = False
        Caption = 'Set'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 204788
        mmTop = 30692
        mmWidth = 18256
        BandType = 0
      end
      object rptMes10: TppLabel
        UserName = 'rptMes10'
        AutoSize = False
        Caption = 'Out'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 223838
        mmTop = 30692
        mmWidth = 18256
        BandType = 0
      end
      object rptMes11: TppLabel
        UserName = 'rptMes11'
        AutoSize = False
        Caption = 'Nov'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 242888
        mmTop = 30692
        mmWidth = 18256
        BandType = 0
      end
      object rptMes12: TppLabel
        UserName = 'rptMes12'
        AutoSize = False
        Caption = 'Dez'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 261938
        mmTop = 30692
        mmWidth = 18256
        BandType = 0
      end
      object rptMapaEvoluLine2: TppLine
        UserName = 'rptMapaEvoluLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 29898
        mmWidth = 284427
        BandType = 0
      end
      object rptMapaEvoluLabel18: TppLabel
        UserName = 'rptMapaEvoluLabel18'
        Caption = 'rptMapaEvoluLabel18'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 11642
        mmWidth = 27252
        BandType = 0
      end
      object rptMapaEvoluLabel19: TppLabel
        UserName = 'rptMapaEvoluLabel19'
        Caption = 'rptMapaEvoluLabel19'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 5556
        mmWidth = 27252
        BandType = 0
      end
      object LblPatros: TppLabel
        UserName = 'LblPatros'
        Caption = 'LblPatro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 21696
        mmWidth = 10054
        BandType = 0
      end
      object LblPlanos: TppLabel
        UserName = 'LblPlanos'
        Caption = 'LblPlano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 25929
        mmWidth = 10319
        BandType = 0
      end
      object RptlblExercicioFim: TppLabel
        UserName = 'RptlblExercicioFim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 17198
        mmWidth = 35983
        BandType = 0
      end
    end
    object ppDetailBand13: TppDetailBand
      BeforePrint = ppDetailBand13BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object rptMapaEvoluRegion1: TppRegion
        UserName = 'rptMapaEvoluRegion1'
        Caption = 'rptMapaEvoluRegion1'
        Pen.Style = psClear
        mmHeight = 9790
        mmLeft = 0
        mmTop = 5292
        mmWidth = 284428
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLine45: TppLine
          UserName = 'ppLine45'
          Weight = 0.75
          mmHeight = 2910
          mmLeft = 30956
          mmTop = 6350
          mmWidth = 253471
          BandType = 4
        end
        object rptMapaEvoluDBText7: TppDBText
          UserName = 'rptMapaEvoluDBText7'
          DataField = 'FEVM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 72231
          mmTop = 6880
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText10: TppDBText
          UserName = 'rptMapaEvoluDBText10'
          DataField = 'MARM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 91281
          mmTop = 6880
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText13: TppDBText
          UserName = 'rptMapaEvoluDBText13'
          DataField = 'ABRM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 110331
          mmTop = 6880
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText16: TppDBText
          UserName = 'rptMapaEvoluDBText16'
          DataField = 'MAIM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 128852
          mmTop = 6880
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText19: TppDBText
          UserName = 'rptMapaEvoluDBText19'
          DataField = 'JUNM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 147638
          mmTop = 6879
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText22: TppDBText
          UserName = 'rptMapaEvoluDBText22'
          DataField = 'JULM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 166688
          mmTop = 6879
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText25: TppDBText
          UserName = 'rptMapaEvoluDBText25'
          DataField = 'AGOM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 185738
          mmTop = 6879
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText28: TppDBText
          UserName = 'rptMapaEvoluDBText28'
          DataField = 'SEBM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 204788
          mmTop = 6879
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText31: TppDBText
          UserName = 'rptMapaEvoluDBText31'
          DataField = 'OUTM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 223838
          mmTop = 6879
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText34: TppDBText
          UserName = 'rptMapaEvoluDBText34'
          DataField = 'NOVM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 242888
          mmTop = 6879
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText37: TppDBText
          UserName = 'rptMapaEvoluDBText37'
          DataField = 'DEZM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 261938
          mmTop = 6879
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText38: TppDBText
          UserName = 'rptMapaEvoluDBText38'
          DataField = 'JANPM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 52652
          mmTop = 10584
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText39: TppDBText
          UserName = 'rptMapaEvoluDBText39'
          DataField = 'FEVPM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 72231
          mmTop = 10584
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText40: TppDBText
          UserName = 'rptMapaEvoluDBText40'
          DataField = 'MARPM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 91281
          mmTop = 10584
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText41: TppDBText
          UserName = 'rptMapaEvoluDBText41'
          DataField = 'ABRPM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 110331
          mmTop = 10584
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText42: TppDBText
          UserName = 'rptMapaEvoluDBText42'
          DataField = 'MAIPM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 128852
          mmTop = 10583
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText43: TppDBText
          UserName = 'rptMapaEvoluDBText43'
          DataField = 'JUNPM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 147638
          mmTop = 10583
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText44: TppDBText
          UserName = 'rptMapaEvoluDBText44'
          DataField = 'JULPM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 166688
          mmTop = 10583
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText45: TppDBText
          UserName = 'rptMapaEvoluDBText45'
          DataField = 'AGOPM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 185738
          mmTop = 10583
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText46: TppDBText
          UserName = 'rptMapaEvoluDBText46'
          DataField = 'SEBPM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 204788
          mmTop = 10583
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText47: TppDBText
          UserName = 'rptMapaEvoluDBText47'
          DataField = 'OUTPM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 223838
          mmTop = 10583
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText48: TppDBText
          UserName = 'rptMapaEvoluDBText48'
          DataField = 'NOVPM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 242888
          mmTop = 10583
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluDBText49: TppDBText
          UserName = 'rptMapaEvoluDBText49'
          BlankWhenZero = True
          DataField = 'DEZPM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 261938
          mmTop = 10583
          mmWidth = 18256
          BandType = 4
        end
        object rptMapaEvoluLabel17: TppLabel
          UserName = 'rptMapaEvoluLabel17'
          Caption = 'Mensal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 38629
          mmTop = 6879
          mmWidth = 7938
          BandType = 4
        end
        object rptMapaEvoluDBText4: TppDBText
          UserName = 'rptMapaEvoluDBText4'
          DataField = 'JANM'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3440
          mmLeft = 52652
          mmTop = 6880
          mmWidth = 18256
          BandType = 4
        end
      end
      object rptMapaEvoluLabel16: TppLabel
        UserName = 'rptMapaEvoluLabel16'
        Caption = 'Acumulado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 33867
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object rptMapaEvoluDBText3: TppDBText
        UserName = 'rptMapaEvoluDBText3'
        DataField = 'JANP'
        DataPipeline = pplMapaEvolu
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaEvolu'
        mmHeight = 3175
        mmLeft = 52652
        mmTop = 794
        mmWidth = 18256
        BandType = 4
      end
      object rptMapaEvoluDBText6: TppDBText
        UserName = 'rptMapaEvoluDBText6'
        DataField = 'FEVP'
        DataPipeline = pplMapaEvolu
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaEvolu'
        mmHeight = 3175
        mmLeft = 72231
        mmTop = 794
        mmWidth = 18256
        BandType = 4
      end
      object rptMapaEvoluDBText9: TppDBText
        UserName = 'rptMapaEvoluDBText9'
        DataField = 'MARP'
        DataPipeline = pplMapaEvolu
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaEvolu'
        mmHeight = 3175
        mmLeft = 91281
        mmTop = 794
        mmWidth = 18256
        BandType = 4
      end
      object rptMapaEvoluDBText12: TppDBText
        UserName = 'rptMapaEvoluDBText12'
        DataField = 'ABRP'
        DataPipeline = pplMapaEvolu
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaEvolu'
        mmHeight = 3175
        mmLeft = 110331
        mmTop = 794
        mmWidth = 18256
        BandType = 4
      end
      object rptMapaEvoluDBText15: TppDBText
        UserName = 'rptMapaEvoluDBText15'
        DataField = 'MAIP'
        DataPipeline = pplMapaEvolu
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaEvolu'
        mmHeight = 3175
        mmLeft = 128852
        mmTop = 794
        mmWidth = 18256
        BandType = 4
      end
      object rptMapaEvoluDBText18: TppDBText
        UserName = 'rptMapaEvoluDBText18'
        DataField = 'JUNP'
        DataPipeline = pplMapaEvolu
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaEvolu'
        mmHeight = 3175
        mmLeft = 147638
        mmTop = 794
        mmWidth = 18256
        BandType = 4
      end
      object rptMapaEvoluDBText21: TppDBText
        UserName = 'rptMapaEvoluDBText21'
        DataField = 'JULP'
        DataPipeline = pplMapaEvolu
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaEvolu'
        mmHeight = 3175
        mmLeft = 166688
        mmTop = 794
        mmWidth = 18256
        BandType = 4
      end
      object rptMapaEvoluDBText24: TppDBText
        UserName = 'rptMapaEvoluDBText24'
        DataField = 'AGOP'
        DataPipeline = pplMapaEvolu
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaEvolu'
        mmHeight = 3175
        mmLeft = 185738
        mmTop = 794
        mmWidth = 18256
        BandType = 4
      end
      object rptMapaEvoluDBText27: TppDBText
        UserName = 'rptMapaEvoluDBText27'
        DataField = 'SEBP'
        DataPipeline = pplMapaEvolu
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaEvolu'
        mmHeight = 3175
        mmLeft = 204788
        mmTop = 794
        mmWidth = 18256
        BandType = 4
      end
      object rptMapaEvoluDBText30: TppDBText
        UserName = 'rptMapaEvoluDBText30'
        DataField = 'OUTP'
        DataPipeline = pplMapaEvolu
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaEvolu'
        mmHeight = 3175
        mmLeft = 223838
        mmTop = 794
        mmWidth = 18256
        BandType = 4
      end
      object rptMapaEvoluDBText33: TppDBText
        UserName = 'rptMapaEvoluDBText33'
        DataField = 'NOVP'
        DataPipeline = pplMapaEvolu
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaEvolu'
        mmHeight = 3175
        mmLeft = 242888
        mmTop = 794
        mmWidth = 18256
        BandType = 4
      end
      object rptMapaEvoluDBText36: TppDBText
        UserName = 'rptMapaEvoluDBText36'
        BlankWhenZero = True
        DataField = 'DEZP'
        DataPipeline = pplMapaEvolu
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaEvolu'
        mmHeight = 3175
        mmLeft = 261938
        mmTop = 794
        mmWidth = 18256
        BandType = 4
      end
    end
    object ppFooterBand18: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
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
        mmLeft = 265
        mmTop = 1058
        mmWidth = 70908
        BandType = 8
      end
      object ppCalc22: TppSystemVariable
        UserName = 'Calc22'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 127794
        mmTop = 1058
        mmWidth = 28575
        BandType = 8
      end
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 255588
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PLACONTA'
      DataPipeline = pplMapaEvolu
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplMapaEvolu'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppDBText4: TppDBText
          UserName = 'ppDBText4'
          DataField = 'PLACONTA'
          DataPipeline = pplMapaEvolu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 529
          mmTop = 1852
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object rptMapaEvoluDBText1: TppDBText
          UserName = 'rptMapaEvoluDBText1'
          DataField = 'PLANOME'
          DataPipeline = pplMapaEvolu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 16669
          mmTop = 1852
          mmWidth = 35190
          BandType = 3
          GroupNo = 0
        end
        object rptMapaEvoluDBText2: TppDBText
          UserName = 'rptMapaEvoluDBText2'
          DataField = 'JANS'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 52652
          mmTop = 1852
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object rptMapaEvoluDBText5: TppDBText
          UserName = 'rptMapaEvoluDBText5'
          DataField = 'FEVS'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 72231
          mmTop = 1852
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object rptMapaEvoluDBText8: TppDBText
          UserName = 'rptMapaEvoluDBText8'
          DataField = 'MARS'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 91281
          mmTop = 1852
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object rptMapaEvoluDBText11: TppDBText
          UserName = 'rptMapaEvoluDBText11'
          DataField = 'ABRS'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 110331
          mmTop = 1852
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object rptMapaEvoluDBText14: TppDBText
          UserName = 'rptMapaEvoluDBText14'
          DataField = 'MAIS'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 128852
          mmTop = 1852
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object rptMapaEvoluDBText17: TppDBText
          UserName = 'rptMapaEvoluDBText17'
          DataField = 'JUNS'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 147638
          mmTop = 1852
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object rptMapaEvoluDBText20: TppDBText
          UserName = 'rptMapaEvoluDBText20'
          DataField = 'JULS'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 166688
          mmTop = 1852
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object rptMapaEvoluDBText23: TppDBText
          UserName = 'rptMapaEvoluDBText23'
          DataField = 'AGOS'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 185738
          mmTop = 1852
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object rptMapaEvoluDBText26: TppDBText
          UserName = 'rptMapaEvoluDBText26'
          DataField = 'SEBS'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 204788
          mmTop = 1852
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object rptMapaEvoluDBText29: TppDBText
          UserName = 'rptMapaEvoluDBText29'
          DataField = 'OUTS'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 223838
          mmTop = 1852
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object rptMapaEvoluDBText32: TppDBText
          UserName = 'rptMapaEvoluDBText32'
          DataField = 'NOVS'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 242888
          mmTop = 1852
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object rptMapaEvoluDBText35: TppDBText
          UserName = 'rptMapaEvoluDBText35'
          DataField = 'DEZS'
          DataPipeline = pplMapaEvolu
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaEvolu'
          mmHeight = 3175
          mmLeft = 261938
          mmTop = 1852
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 265
          mmWidth = 284427
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object daDataModule1: TdaDataModule
    end
  end
  object cdsMapaEvolu: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 80
    Data = {
      890300009619E0BD010000001800000035000000000003000000890308504C41
      434F4E544101004900000002000753554254595045020049000A004669786564
      436861720005574944544802000200120007504C414E4F4D4501004900000001
      0005574944544802000200280007504C4147524155080004000000000008504C
      41475255504F01004900000002000753554254595045020049000A0046697865
      6443686172000557494454480200020001000B504C414E41545552455A410100
      4900000002000753554254595045020049000A00466978656443686172000557
      49445448020002000100044A414E530800040000000000044645565308000400
      00000000044D415253080004000000000004414252530800040000000000044D
      4149530800040000000000044A554E530800040000000000044A554C53080004
      00000000000441474F5308000400000000000453454253080004000000000004
      4F5554530800040000000000044E4F565308000400000000000444455A530800
      040000000000044A414E4D0800040000000000044645564D0800040000000000
      044D41524D0800040000000000044142524D0800040000000000044D41494D08
      00040000000000044A554E4D0800040000000000044A554C4D08000400000000
      000441474F4D0800040000000000045345424D0800040000000000044F55544D
      0800040000000000044E4F564D08000400000000000444455A4D080004000000
      0000044A414E50080004000000000004464556500800040000000000044D4152
      50080004000000000004414252500800040000000000044D4149500800040000
      000000044A554E500800040000000000044A554C500800040000000000044147
      4F50080004000000000004534542500800040000000000044F55545008000400
      00000000044E4F565008000400000000000444455A500800040000000000054A
      414E504D080004000000000005464556504D0800040000000000054D4152504D
      080004000000000005414252504D0800040000000000054D4149504D08000400
      00000000054A554E504D0800040000000000054A554C504D0800040000000000
      0541474F504D080004000000000005534542504D0800040000000000054F5554
      504D0800040000000000054E4F56504D08000400000000000544455A504D0800
      04000000000002000D44454641554C545F4F5244455202008200010000000100
      044C4349440400010009080000}
  end
  object sqlMapaEvolu: TCMSqlParams
    SQL.Strings = (
      'SELECT PLACONTA, PLANOME, PLAGRAU, PLAGRUPO, PLANATUREZA,'
      
        '      (0) AS JANS, (0) AS FEVS, (0) AS MARS, (0) AS ABRS, (0) AS' +
        ' MAIS, (0) AS JUNS,'
      
        '      (0) AS JULS, (0) AS AGOS, (0) AS SEBS, (0) AS OUTS, (0) AS' +
        ' NOVS, (0) AS DEZS,'
      
        '      (0) AS JANM, (0) AS FEVM, (0) AS MARM, (0) AS ABRM, (0) AS' +
        ' MAIM, (0) AS JUNM,'
      
        '      (0) AS JULM, (0) AS AGOM, (0) AS SEBM, (0) AS OUTM, (0) AS' +
        ' NOVM, (0) AS DEZM,'
      
        '      (0) AS JANP, (0) AS FEVP, (0) AS MARP, (0) AS ABRP, (0) AS' +
        ' MAIP, (0) AS JUNP,'
      
        '      (0) AS JULP, (0) AS AGOP, (0) AS SEBP, (0) AS OUTP, (0) AS' +
        ' NOVP, (0) AS DEZP,'
      
        '      (0) AS JANPM, (0) AS FEVPM, (0) AS MARPM, (0) AS ABRPM, (0' +
        ') AS MAIPM, (0) AS JUNPM,'
      
        '      (0) AS JULPM, (0) AS AGOPM, (0) AS SEBPM, (0) AS OUTPM, (0' +
        ') AS NOVPM, (0) AS DEZPM'
      'FROM PLANOCONTA'
      'WHERE (PLANO = :PLANO) AND'
      '      (PLAGRAU <= :PLAGRAU) AND'
      '      (PLAIMPRELATEVOL = '#39'S'#39')'
      'ORDER BY PLACONTA')
    ClientDataSet = cdsMapaEvolu
    Left = 112
    Top = 80
  end
  object sqlSaldos: TCMSqlParams
    ClientDataSet = cdsSaldos
    Left = 272
    Top = 136
  end
  object cdsSaldos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 136
  end
  object sqlPeriodoAtu: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '   PERNUMERO, PERDATFIM'
      'FROM '
      '   PERIODO '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND '
      '   (PEREXERCICIO=:PEREXERCICIO) AND'
      '   (PERNUMERO =:PERNUMERO)'
      '')
    ClientDataSet = cdsPeriodoAtu
    Left = 144
    Top = 144
  end
  object cdsPeriodoAtu: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 144
    Data = {
      4B0000009619E0BD0100000018000000020000000000030000004B0009504552
      4E554D45524F08000400000000000950455244415446494D0800080000000000
      0100044C4349440400010009080000}
  end
end
