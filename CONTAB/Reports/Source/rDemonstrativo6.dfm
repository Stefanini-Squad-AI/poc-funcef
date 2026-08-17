inherited rptDemonstrativo6: TrptDemonstrativo6
  Left = 198
  Top = 207
  Width = 558
  Height = 242
  Caption = 'Relatório Demonstrativo de Resultado - Modelo 06'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório Demonstrativo de Resultado - Modelo 06'
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
          'ORDER BY  PEREXERCICIO'
          '')
        LookupSettings.Chave = 'PEREXERCICIO'
        LookupSettings.Display = 'PEREXERCICIO'
        LookupSettings.Descricao = 'Exercício'
        LookupSettings.Tamanho = '4'
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
          '   PERNUMERO'
          '')
        LookupSettings.Chave = 'PERNUMERO'
        LookupSettings.Display = 'PEREXERCNOME'
        LookupSettings.Descricao = 'Número'
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
        Caption = 'Periodo Final'
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
          '   PERNUMERO'
          '')
        LookupSettings.Chave = 'PERNUMERO'
        LookupSettings.Display = 'PEREXERCNOME'
        LookupSettings.Descricao = 'Número'
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
        MostraComboCompara = True
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Periodo Final'
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
        Caption = 'Demonstrativo'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   IDDEMONSTRATIVO, IDPESSOA, DEMDESCDEMONSTRAT,DEMNATUREZA '
          'FROM '
          '   DEMONSTRATIVO '
          'ORDER BY '
          '   DEMDESCDEMONSTRAT')
        LookupSettings.Chave = 'IDDEMONSTRATIVO'
        LookupSettings.Display = 'DEMDESCDEMONSTRAT'
        LookupSettings.Descricao = 'Demonstrativo'
        LookupSettings.Tamanho = '50'
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
        Name = 'Demonstrativo'
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
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Centro de Custo'
        LookupSettings.Tamanho = '50'
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
        LookupSettings.Display = 'UNIDNEGOC|NOME'
        LookupSettings.Descricao = 'Atividade/Projeto'
        LookupSettings.Tamanho = '10|50'
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
          'SELECT MOECODIGO,MOEDESC,MOESIGLA '
          'FROM MOEDA '
          'WHERE MOEINATIVO = '#39'A'#39' '
          'ORDER BY MOEDESC')
        LookupSettings.Chave = 'MOECODIGO'
        LookupSettings.Display = 'MOEDESC'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '50'
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
        Caption = 'Página Inicial'
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
        TextDefault = '0'
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
        Width = 50
      end
      item
        Caption = 'Imprimir Cabeçalho em Inglês'
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
        Name = 'Imprimir Cabeçalho em Inglês'
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
        Caption = 'Imprime a Descrição do Filtro'
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
        Name = 'Imprime a Descrição do Filtro'
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
        Caption = 'Imprime Linhas com Valores Zerados'
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
        Name = 'Imprime Linhas com Valores Zerados'
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
        Caption = 'Desconsiderar o Encerramento das Contas de Resultado'
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
        Name = 'Desconsiderar o Encerramento das Contas de Resultado'
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
    Formheight = 325
    FormWidth = 400
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptDemonstrativo6
    LabelSistema = lblsistema
  end
  object rptDemonstrativo6: TppReport
    AutoStop = False
    DataPipeline = pplDemonstrativo6
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMMThousandths
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 293
    Top = 104
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplDemonstrativo6'
    object ppHeaderBand20: TppHeaderBand
      BeforePrint = ppHeaderBand20BeforePrint
      mmBottomOffset = 0
      mmHeight = 39952
      mmPrintPosition = 0
      object ppLabel45: TppLabel
        UserName = 'ppLabel45'
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
        mmLeft = 33338
        mmTop = 529
        mmWidth = 164042
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'ppLabel46'
        AutoSize = False
        Caption = 'Mes / Ano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 33338
        mmTop = 16933
        mmWidth = 164042
        BandType = 0
      end
      object ppLabel125: TppLabel
        UserName = 'ppLabel125'
        AutoSize = False
        Caption = 'Empresa 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 33338
        mmTop = 6085
        mmWidth = 164042
        BandType = 0
      end
      object ppLabel126: TppLabel
        UserName = 'ppLabel126'
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
        mmLeft = 33338
        mmTop = 11642
        mmWidth = 164042
        BandType = 0
      end
      object linAcima: TppLine
        UserName = 'linAcima'
        Pen.Width = 3
        Weight = 2.25
        mmHeight = 1852
        mmLeft = 529
        mmTop = 32544
        mmWidth = 194469
        BandType = 0
      end
      object linAbaixo: TppLine
        UserName = 'linAbaixo'
        Pen.Width = 3
        Weight = 2.25
        mmHeight = 1852
        mmLeft = 529
        mmTop = 38629
        mmWidth = 194469
        BandType = 0
      end
      object ppLabel129: TppLabel
        UserName = 'ppLabel129'
        AutoSize = False
        Caption = 'Moeda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 33602
        mmTop = 22754
        mmWidth = 85990
        BandType = 0
      end
      object ppLabel131: TppLabel
        UserName = 'ppLabel131'
        AutoSize = False
        Caption = 'ppLabel131'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 124090
        mmTop = 22754
        mmWidth = 72761
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
      object txtSaldoAnterior: TppLabel
        UserName = 'txtSaldoAnterior'
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 97367
        mmTop = 34131
        mmWidth = 20902
        BandType = 0
      end
      object txtDebito: TppLabel
        UserName = 'txtDebito'
        AutoSize = False
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 124090
        mmTop = 34131
        mmWidth = 21696
        BandType = 0
      end
      object txtCredito: TppLabel
        UserName = 'txtCredito'
        AutoSize = False
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 34131
        mmWidth = 20902
        BandType = 0
      end
      object txtSaldo: TppLabel
        UserName = 'txtSaldo'
        AutoSize = False
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 34131
        mmWidth = 21696
        BandType = 0
      end
      object txtFiltro6: TppLabel
        UserName = 'txtFiltro6'
        AutoSize = False
        Caption = 'Filtro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33602
        mmTop = 27517
        mmWidth = 163248
        BandType = 0
      end
    end
    object bndDetDemo6: TppDetailBand
      BeforePrint = bndDetDemo6BeforePrint
      mmBottomOffset = 0
      mmHeight = 5200
      mmPrintPosition = 0
      object dbtxtNomeDemo6: TppDBText
        UserName = 'dbtxtNomeDemo6'
        DataField = 'ELEDESCELEM'
        DataPipeline = pplDemonstrativo6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDemonstrativo6'
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 794
        mmWidth = 94721
        BandType = 4
      end
      object dbtxtSaldoAntDemo6: TppDBText
        UserName = 'dbtxtSaldoAntDemo6'
        DataField = 'SALDOANTSN'
        DataPipeline = pplDemonstrativo6
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemonstrativo6'
        mmHeight = 3175
        mmLeft = 97631
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object dbtxtDebDemo6: TppDBText
        UserName = 'dbtxtDebDemo6'
        DataField = 'DEBSN'
        DataPipeline = pplDemonstrativo6
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemonstrativo6'
        mmHeight = 3175
        mmLeft = 124354
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object dbtxtSaldoDemo6: TppDBText
        UserName = 'dbtxtSaldoDemo6'
        DataField = 'SALDOSN'
        DataPipeline = pplDemonstrativo6
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemonstrativo6'
        mmHeight = 3175
        mmLeft = 170657
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object linDemo6: TppLine
        UserName = 'linDemo6'
        ShiftWithParent = True
        Weight = 1
        mmHeight = 1588
        mmLeft = 794
        mmTop = 5027
        mmWidth = 194734
        BandType = 4
      end
      object dbtxtCreDemo6: TppDBText
        UserName = 'dbtxtCreDemo6'
        DataField = 'CRESN'
        DataPipeline = pplDemonstrativo6
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemonstrativo6'
        mmHeight = 3175
        mmLeft = 147373
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object dbtxtDCSaldoAntDemo6: TppDBText
        UserName = 'dbtxtDCSaldoAntDemo6'
        DataField = 'SALDOANTDEBCRE'
        DataPipeline = pplDemonstrativo6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDemonstrativo6'
        mmHeight = 3175
        mmLeft = 119327
        mmTop = 794
        mmWidth = 3175
        BandType = 4
      end
      object dbtxtDCSaldoDemo6: TppDBText
        UserName = 'dbtxtDCSaldoDemo6'
        DataField = 'SALDODEBCRE'
        DataPipeline = pplDemonstrativo6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDemonstrativo6'
        mmHeight = 3175
        mmLeft = 192352
        mmTop = 794
        mmWidth = 3175
        BandType = 4
      end
      object rptDemonstrativo6DBText1: TppDBText
        UserName = 'rptDemonstrativo6DBText1'
        DataField = 'SALTA'
        DataPipeline = pplDemonstrativo6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'pplDemonstrativo6'
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand21: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object ppLine66: TppLine
        UserName = 'ppLine66'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
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
      object rptDemonstrativo6Label1: TppLabel
        OnPrint = rptDemonstrativo6Label1Print
        UserName = 'rptDemonstrativo6Label1'
        Caption = 'rptDemonstrativo6Label1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 124884
        mmTop = 1588
        mmWidth = 33338
        BandType = 8
      end
      object rptDemonstrativo6Label2: TppLabel
        UserName = 'rptDemonstrativo6Label2'
        Caption = 'Página'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 114565
        mmTop = 1588
        mmWidth = 9525
        BandType = 8
      end
      object ppCalc42: TppSystemVariable
        UserName = 'Calc42'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object rptDemonstrativo6Calc1: TppSystemVariable
        UserName = 'rptDemonstrativo6Calc1'
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
        mmLeft = 105834
        mmTop = 1588
        mmWidth = 1588
        BandType = 8
      end
    end
    object rptDemonstrativo6Group1: TppGroup
      BreakName = 'SALTA'
      DataPipeline = pplDemonstrativo6
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rptDemonstrativo6Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDemonstrativo6'
      object rptDemonstrativo6GroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rptDemonstrativo6GroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pplDemonstrativo6: TppBDEPipeline
    DataSource = dsDemonstrativo6
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lDemonstrativo6'
    Left = 237
    Top = 80
    object pplDemonstrativo6ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEB'
      FieldName = 'DEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplDemonstrativo6ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'CRE'
      FieldName = 'CRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplDemonstrativo6ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplDemonstrativo6ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANT'
      FieldName = 'SALDOANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplDemonstrativo6ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBSN'
      FieldName = 'DEBSN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplDemonstrativo6ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'CRESN'
      FieldName = 'CRESN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplDemonstrativo6ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOSN'
      FieldName = 'SALDOSN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplDemonstrativo6ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANTSN'
      FieldName = 'SALDOANTSN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplDemonstrativo6ppField9: TppField
      FieldAlias = 'SALDODEBCRE'
      FieldName = 'SALDODEBCRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object pplDemonstrativo6ppField10: TppField
      FieldAlias = 'SALDOANTDEBCRE'
      FieldName = 'SALDOANTDEBCRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object pplDemonstrativo6ppField11: TppField
      FieldAlias = 'SALTA'
      FieldName = 'SALTA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 10
    end
    object pplDemonstrativo6ppField12: TppField
      FieldAlias = 'CALCU'
      FieldName = 'CALCU'
      FieldLength = 1
      DisplayWidth = 1
      Position = 11
    end
    object pplDemonstrativo6ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDELEMANAVERTICAL'
      FieldName = 'IDELEMANAVERTICAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplDemonstrativo6ppField14: TppField
      FieldAlias = 'ELEDESCELEM'
      FieldName = 'ELEDESCELEM'
      FieldLength = 60
      DisplayWidth = 60
      Position = 13
    end
    object pplDemonstrativo6ppField15: TppField
      FieldAlias = 'FLGINDENTACAO'
      FieldName = 'FLGINDENTACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 14
    end
    object pplDemonstrativo6ppField16: TppField
      FieldAlias = 'FLGTIPOLINHA'
      FieldName = 'FLGTIPOLINHA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object pplDemonstrativo6ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'ELEORDEMLINHA'
      FieldName = 'ELEORDEMLINHA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplDemonstrativo6ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDELEMDEMONSTRAT'
      FieldName = 'IDELEMDEMONSTRAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplDemonstrativo6ppField19: TppField
      FieldAlias = 'ELETIPOELEM'
      FieldName = 'ELETIPOELEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 18
    end
    object pplDemonstrativo6ppField20: TppField
      FieldAlias = 'FLGSALTAPAGINA'
      FieldName = 'FLGSALTAPAGINA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 19
    end
    object pplDemonstrativo6ppField21: TppField
      FieldAlias = 'FLGMONETARIA'
      FieldName = 'FLGMONETARIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
    end
    object pplDemonstrativo6ppField22: TppField
      FieldAlias = 'FLGTRACO'
      FieldName = 'FLGTRACO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 21
    end
    object pplDemonstrativo6ppField23: TppField
      FieldAlias = 'FLGNEGRITO'
      FieldName = 'FLGNEGRITO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 22
    end
    object pplDemonstrativo6ppField24: TppField
      FieldAlias = 'FLGNATUREZA'
      FieldName = 'FLGNATUREZA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object pplDemonstrativo6ppField25: TppField
      FieldAlias = 'FLGTIPONEGATIVO'
      FieldName = 'FLGTIPONEGATIVO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object pplDemonstrativo6ppField26: TppField
      FieldAlias = 'FLGDECIMAIS'
      FieldName = 'FLGDECIMAIS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 25
    end
  end
  object dsDemonstrativo6: TwwDataSource
    DataSet = cdsDemonstrativo6
    Left = 88
    Top = 104
  end
  object cdsDemonstrativo6: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 104
    Data = {
      140400009619E0BD01000000180000001A000000000003000000140403444542
      08000400000000000343524508000400000000000553414C444F080004000000
      00000853414C444F414E54080004000000000005444542534E08000400000000
      0005435245534E08000400000000000753414C444F534E08000400000000000A
      53414C444F414E54534E08000400000000000B53414C444F4445424352450100
      4900000002000753554254595045020049000A00466978656443686172000557
      494454480200020001000E53414C444F414E5444454243524501004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      00020001000553414C544101004900000002000753554254595045020049000A
      00466978656443686172000557494454480200020001000543414C4355010049
      00000002000753554254595045020049000A0046697865644368617200055749
      445448020002000100114944454C454D414E41564552544943414C0800040000
      0000000B454C4544455343454C454D0100490000000100055749445448020002
      003C000D464C47494E44454E544143414F010049000000020007535542545950
      45020049000A00466978656443686172000557494454480200020001000C464C
      475449504F4C494E484101004900000002000753554254595045020049000A00
      466978656443686172000557494454480200020001000D454C454F5244454D4C
      494E48410800040000000000104944454C454D44454D4F4E5354524154080004
      00000000000B454C455449504F454C454D010049000000020007535542545950
      45020049000A00466978656443686172000557494454480200020001000E464C
      4753414C5441504147494E410100490000000200075355425459504502004900
      0A00466978656443686172000557494454480200020001000C464C474D4F4E45
      544152494101004900000002000753554254595045020049000A004669786564
      436861720005574944544802000200010008464C47545241434F010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      0200020002000A464C474E45475249544F010049000000020007535542545950
      45020049000A00466978656443686172000557494454480200020001000B464C
      474E41545552455A4101004900000002000753554254595045020049000A0046
      6978656443686172000557494454480200020001000F464C475449504F4E4547
      415449564F01004900000002000753554254595045020049000A004669786564
      43686172000557494454480200020001000B464C47444543494D414953010049
      00000002000753554254595045020049000A0046697865644368617200055749
      4454480200020001000100044C4349440400010009080000}
  end
  object cdsEmpresa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 32
  end
  object sqlEmpresa: TCMSqlParams
    SQL.Strings = (
      'SELECT NOMERELAT1, NOMERELAT2 FROM EMPRESAPROP '
      'WHERE IDPESSOA = :IDPESSOA'
      '')
    ClientDataSet = cdsEmpresa
    Left = 464
    Top = 32
  end
  object sqlDemoAux: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   IDDEMONSTRATIVO, IDPESSOA, DEMDESCDEMONSTRAT,'
      '  DEMNATUREZA,FLGTRACOACIMA,FLGTRACOABAIXO,'
      '  DEMTITULOCOMPL, DEMTITULOCOMPL2  '
      'FROM '
      '   DEMONSTRATIVO '
      'WHERE '
      '   (IDDEMONSTRATIVO =:IDDEMO)  '
      'ORDER BY '
      '   DEMDESCDEMONSTRAT'
      '')
    ClientDataSet = cdsDemoAux
    Left = 248
    Top = 24
  end
  object cdsDemoAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 24
  end
  object cdsPerAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 168
  end
  object sqlPerAux: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '   PERNUMERO, PERNOME,PERNOMEOUTLING ,PERDATFIM'
      'FROM '
      '   PERIODO '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND '
      '   (PEREXERCICIO=:PEREXERCICIO) AND '
      '   (PERNUMERO=:PERNUMERO)'
      'ORDER BY '
      '   PERNUMERO'
      '')
    ClientDataSet = cdsPerAux
    Left = 104
    Top = 168
  end
  object dsEmpresaProp: TwwDataSource
    DataSet = cdsEmpresaProp
    Left = 408
    Top = 113
  end
  object pplEmpresaProp: TppBDEPipeline
    DataSource = dsEmpresaProp
    UserName = 'lEmpresaProp'
    Left = 448
    Top = 112
  end
  object cdsEmpresaProp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 163
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
    Left = 408
    Top = 162
  end
  object cdsPerAux2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 168
  end
  object sqlPeraux2: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '   PERNUMERO, PERNOME,'
      '   PERDATFIM, PERDATINI, PERNOMEOUTLING'
      'FROM '
      '   PERIODO '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND '
      '   (PEREXERCICIO=:PEREXERCICIO) AND'
      '   (PERNUMERO =:PERNUMERO)'
      'ORDER BY '
      '   PERNUMERO'
      '')
    ClientDataSet = cdsPerAux2
    Left = 272
    Top = 168
  end
  object cdsTitulos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 64
  end
  object sqlTitulos: TCMSqlParams
    ClientDataSet = cdsTitulos
    Left = 176
    Top = 64
  end
end
