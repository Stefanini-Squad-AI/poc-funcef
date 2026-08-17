inherited rptDemonstrativo3: TrptDemonstrativo3
  Left = 210
  Top = 229
  Width = 479
  Height = 267
  Caption = 'Relatório Demonstrativo de Resultado - Modelo/03'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório Demonstrativo de Resultado - Modelo/03'
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
        LookupSettings.Display = 'NOME'
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
        Caption = 'Moeda Realizado'
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
        Name = 'Moeda Realizado'
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
        Caption = 'Moeda Orçado'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT MOECODIGO,MOEDESC,MOESIGLA '
          'FROM MOEDA '
          'WHERE MOEINATIVO = '#39'A'#39' '
          'ORDER BY MOEDESC'
          '')
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Moeda Orçado'
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
        Caption = 'Imprime a descrição do filtro'
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
        Name = 'Imprime a descrição do filtro'
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
        MostraComboCompara = True
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
      end
      item
        Caption = 'Código(s) da(s) Ativ/Projetos'
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
        Name = 'Código(s) da(s) Ativ/Projetos'
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
    OnParamControlExit = CmpRptCMParamControlExit
    OnParamControlEnter = CmpRptCMParamControlEnter
    Formheight = 430
    FormWidth = 450
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptDemonstrativo3
    LabelSistema = lblsistema
  end
  object rptDemonstrativo3: TppReport
    AutoStop = False
    DataPipeline = pplDemonstrativo3
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 8000
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 309
    Top = 88
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplDemonstrativo3'
    object ppHeaderBand13: TppHeaderBand
      BeforePrint = ppHeaderBand13BeforePrint
      mmBottomOffset = 0
      mmHeight = 43921
      mmPrintPosition = 0
      object ppLabel57: TppLabel
        UserName = 'ppLabel57'
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
        mmLeft = 34131
        mmTop = 529
        mmWidth = 237332
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'ppLabel58'
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
        mmLeft = 34131
        mmTop = 17198
        mmWidth = 237332
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'ppLabel59'
        AutoSize = False
        Caption = 'BUDGET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 104511
        mmTop = 38894
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'ppLabel60'
        AutoSize = False
        Caption = 'ACTUAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 128323
        mmTop = 38894
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'ppLabel61'
        AutoSize = False
        Caption = 'LAST YEAR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 152400
        mmTop = 38894
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'ppLabel62'
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
        mmLeft = 34131
        mmTop = 6085
        mmWidth = 237332
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'ppLabel64'
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
        mmLeft = 34131
        mmTop = 11906
        mmWidth = 237332
        BandType = 0
      end
      object ppLine30: TppLine
        UserName = 'ppLine30'
        Pen.Width = 3
        Weight = 2.25
        mmHeight = 1852
        mmLeft = 0
        mmTop = 32544
        mmWidth = 271463
        BandType = 0
      end
      object ppLine31: TppLine
        UserName = 'ppLine31'
        Pen.Width = 3
        Weight = 2.25
        mmHeight = 1852
        mmLeft = 0
        mmTop = 42069
        mmWidth = 271463
        BandType = 0
      end
      object rptDemonstrativo3Label1: TppLabel
        UserName = 'rptDemonstrativo3Label1'
        AutoSize = False
        Caption = 'Sub-Título'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 34131
        mmTop = 22754
        mmWidth = 116417
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'ppLabel66'
        AutoSize = False
        Caption = 'C U R R E N T   M O N T H '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 104511
        mmTop = 34131
        mmWidth = 70644
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'ppLabel67'
        AutoSize = False
        Caption = 'BUDGET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 179123
        mmTop = 38894
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'ppLabel68'
        AutoSize = False
        Caption = 'ACTUAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 210344
        mmTop = 38894
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'ppLabel69'
        AutoSize = False
        Caption = 'LAST YEAR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 241830
        mmTop = 38894
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'ppLabel70'
        AutoSize = False
        Caption = 'Y E A R   T O   D A T E'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 178594
        mmTop = 34131
        mmWidth = 92604
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'ppLabel76'
        AutoSize = False
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 199232
        mmTop = 38894
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'ppLabel77'
        AutoSize = False
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 230453
        mmTop = 38894
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'ppLabel78'
        AutoSize = False
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 262203
        mmTop = 38894
        mmWidth = 8996
        BandType = 0
      end
      object rptDemonstrativo3Label2: TppLabel
        UserName = 'rptDemonstrativo3Label2'
        AutoSize = False
        Caption = 'Sub-Título'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 157427
        mmTop = 22754
        mmWidth = 113771
        BandType = 0
      end
      object rptDemonstrativo3DBImage1: TppDBImage
        UserName = 'rptDemonstrativo3DBImage1'
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
      object txtFiltro3: TppLabel
        UserName = 'txtFiltro3'
        AutoSize = False
        Caption = 'Filtro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 34131
        mmTop = 27517
        mmWidth = 163777
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      AfterPrint = ppDetailBand4AfterPrint
      BeforePrint = ppDetailBand4BeforePrint
      mmBottomOffset = 0
      mmHeight = 5200
      mmPrintPosition = 0
      object dbtxtNomeDemo3: TppDBText
        UserName = 'dbtxtNomeDemo3'
        DataField = 'ELEDESCELEM'
        DataPipeline = pplDemonstrativo3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDemonstrativo3'
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 101071
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'ppDBText11'
        DataField = 'ORCMESSN'
        DataPipeline = pplDemonstrativo3
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemonstrativo3'
        mmHeight = 3175
        mmLeft = 104775
        mmTop = 1058
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'ppDBText13'
        DataField = 'MESANTSN'
        DataPipeline = pplDemonstrativo3
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemonstrativo3'
        mmHeight = 3175
        mmLeft = 152665
        mmTop = 1058
        mmWidth = 22754
        BandType = 4
      end
      object ppLine32: TppLine
        UserName = 'ppLine32'
        Weight = 1
        mmHeight = 1323
        mmLeft = 0
        mmTop = 5027
        mmWidth = 271463
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'ppDBText14'
        DataField = 'REALMESSN'
        DataPipeline = pplDemonstrativo3
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemonstrativo3'
        mmHeight = 3175
        mmLeft = 128588
        mmTop = 1058
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'ppDBText15'
        DataField = 'ORCANOSN'
        DataPipeline = pplDemonstrativo3
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemonstrativo3'
        mmHeight = 3175
        mmLeft = 179388
        mmTop = 794
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'ppDBText16'
        DataField = 'REALANOSN'
        DataPipeline = pplDemonstrativo3
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemonstrativo3'
        mmHeight = 3175
        mmLeft = 210609
        mmTop = 794
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'ppDBText17'
        DataField = 'ANOANTSN'
        DataPipeline = pplDemonstrativo3
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemonstrativo3'
        mmHeight = 3175
        mmLeft = 242094
        mmTop = 794
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'ppDBText22'
        DataField = 'PERORCANO'
        DataPipeline = pplDemonstrativo3
        DisplayFormat = '#,0.0;-#,0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemonstrativo3'
        mmHeight = 3175
        mmLeft = 199496
        mmTop = 794
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'ppDBText23'
        DataField = 'PERREALANO'
        DataPipeline = pplDemonstrativo3
        DisplayFormat = '#,0.0;-#,0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemonstrativo3'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 794
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'ppDBText24'
        DataField = 'PERANOANT'
        DataPipeline = pplDemonstrativo3
        DisplayFormat = '#,0.0;-#,0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemonstrativo3'
        mmHeight = 3175
        mmLeft = 262467
        mmTop = 794
        mmWidth = 8996
        BandType = 4
      end
      object rptDemonstrativo3DBText1: TppDBText
        UserName = 'rptDemonstrativo3DBText1'
        DataField = 'SALTA'
        DataPipeline = pplDemonstrativo3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'pplDemonstrativo3'
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand13: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
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
        mmTop = 2117
        mmWidth = 109273
        BandType = 8
      end
      object ppLine34: TppLine
        UserName = 'ppLine34'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 282650
        BandType = 8
      end
      object rptDemonstrativo3Label3: TppLabel
        OnPrint = rptDemonstrativo3Label3Print
        UserName = 'rptDemonstrativo3Label3'
        Caption = 'rptDemonstrativo3Label3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 159544
        mmTop = 2117
        mmWidth = 33338
        BandType = 8
      end
      object rptDemonstrativo3Label4: TppLabel
        UserName = 'rptDemonstrativo3Label4'
        Caption = 'Página'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 149225
        mmTop = 2117
        mmWidth = 9525
        BandType = 8
      end
      object ppCalc26: TppSystemVariable
        UserName = 'Calc26'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 245269
        mmTop = 2117
        mmWidth = 26194
        BandType = 8
      end
      object rptDemonstrativo3Calc1: TppSystemVariable
        UserName = 'rptDemonstrativo3Calc1'
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
        mmLeft = 140494
        mmTop = 2117
        mmWidth = 1588
        BandType = 8
      end
    end
    object rptDemonstrativo3Group1: TppGroup
      BreakName = 'SALTA'
      DataPipeline = pplDemonstrativo3
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rptDemonstrativo3Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDemonstrativo3'
      object rptDemonstrativo3GroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rptDemonstrativo3GroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pplDemonstrativo3: TppBDEPipeline
    DataSource = dsDemonstrativo3
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lDemonstrativo3'
    Left = 205
    Top = 88
    object pplDemonstrativo3ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORCMES'
      FieldName = 'ORCMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplDemonstrativo3ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'REALMES'
      FieldName = 'REALMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplDemonstrativo3ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'MESANT'
      FieldName = 'MESANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplDemonstrativo3ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORCANO'
      FieldName = 'ORCANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplDemonstrativo3ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'REALANO'
      FieldName = 'REALANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplDemonstrativo3ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOANT'
      FieldName = 'ANOANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplDemonstrativo3ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERORCMES'
      FieldName = 'PERORCMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplDemonstrativo3ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERREALMES'
      FieldName = 'PERREALMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplDemonstrativo3ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERMESANT'
      FieldName = 'PERMESANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplDemonstrativo3ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERORCANO'
      FieldName = 'PERORCANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplDemonstrativo3ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERREALANO'
      FieldName = 'PERREALANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplDemonstrativo3ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERANOANT'
      FieldName = 'PERANOANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplDemonstrativo3ppField13: TppField
      FieldAlias = 'CALCU'
      FieldName = 'CALCU'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
    object pplDemonstrativo3ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDELEMANAVERTICAL'
      FieldName = 'IDELEMANAVERTICAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplDemonstrativo3ppField15: TppField
      FieldAlias = 'ELEDESCELEM'
      FieldName = 'ELEDESCELEM'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
    object pplDemonstrativo3ppField16: TppField
      FieldAlias = 'FLGINDENTACAO'
      FieldName = 'FLGINDENTACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object pplDemonstrativo3ppField17: TppField
      FieldAlias = 'FLGTIPOLINHA'
      FieldName = 'FLGTIPOLINHA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object pplDemonstrativo3ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'ELEORDEMLINHA'
      FieldName = 'ELEORDEMLINHA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplDemonstrativo3ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDELEMDEMONSTRAT'
      FieldName = 'IDELEMDEMONSTRAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplDemonstrativo3ppField20: TppField
      FieldAlias = 'ELETIPOELEM'
      FieldName = 'ELETIPOELEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 19
    end
    object pplDemonstrativo3ppField21: TppField
      FieldAlias = 'FLGSALTAPAGINA'
      FieldName = 'FLGSALTAPAGINA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
    end
    object pplDemonstrativo3ppField22: TppField
      FieldAlias = 'FLGMONETARIA'
      FieldName = 'FLGMONETARIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 21
    end
    object pplDemonstrativo3ppField23: TppField
      FieldAlias = 'FLGTRACO'
      FieldName = 'FLGTRACO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 22
    end
    object pplDemonstrativo3ppField24: TppField
      FieldAlias = 'FLGNEGRITO'
      FieldName = 'FLGNEGRITO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object pplDemonstrativo3ppField25: TppField
      FieldAlias = 'FLGNATUREZA'
      FieldName = 'FLGNATUREZA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object pplDemonstrativo3ppField26: TppField
      FieldAlias = 'FLGTIPONEGATIVO'
      FieldName = 'FLGTIPONEGATIVO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 25
    end
    object pplDemonstrativo3ppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORCMESSN'
      FieldName = 'ORCMESSN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplDemonstrativo3ppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'REALMESSN'
      FieldName = 'REALMESSN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplDemonstrativo3ppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'MESANTSN'
      FieldName = 'MESANTSN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplDemonstrativo3ppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORCANOSN'
      FieldName = 'ORCANOSN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplDemonstrativo3ppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'REALANOSN'
      FieldName = 'REALANOSN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object pplDemonstrativo3ppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOANTSN'
      FieldName = 'ANOANTSN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object pplDemonstrativo3ppField33: TppField
      FieldAlias = 'FLGDECIMAIS'
      FieldName = 'FLGDECIMAIS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 32
    end
    object pplDemonstrativo3ppField34: TppField
      FieldAlias = 'SALTA'
      FieldName = 'SALTA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 33
    end
  end
  object dsDemonstrativo3: TwwDataSource
    DataSet = cdsDemonstrativo3
    Left = 112
    Top = 88
  end
  object cdsDemonstrativo3: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 88
  end
  object cdsEmpresa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 56
  end
  object sqlEmpresa: TCMSqlParams
    SQL.Strings = (
      'SELECT NOMERELAT1, NOMERELAT2 FROM EMPRESAPROP '
      'WHERE IDPESSOA = :IDPESSOA'
      '')
    ClientDataSet = cdsEmpresa
    Left = 424
    Top = 56
  end
  object cdsTitulos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 8
  end
  object sqlTitulos: TCMSqlParams
    ClientDataSet = cdsTitulos
    Left = 408
    Top = 8
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
    Left = 152
    Top = 152
  end
  object cdsDemoAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 152
  end
  object cdsPerAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 144
  end
  object sqlPerAux: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '   PERNUMERO, PERNOME,PERNOMEOUTLING ,PERDATFIM,PERDATINI   '
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
    Left = 72
    Top = 144
  end
  object cdsPerAux2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 24
  end
  object sqlPerAux2: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '   PERNUMERO, PERNOME,PERNOMEOUTLING ,PERDATFIM,PERDATINI   '
      'FROM '
      '   PERIODO '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND '
      '   (PEREXERCICIO=:PEREXERCICIO)  '
      'ORDER BY '
      '   PERNUMERO'
      '')
    ClientDataSet = cdsPerAux2
    Left = 296
    Top = 24
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
    Top = 194
  end
  object cdsEmpresaProp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 195
  end
  object pplEmpresaProp: TppBDEPipeline
    DataSource = dsEmpresaProp
    UserName = 'lEmpresaProp'
    Left = 376
    Top = 144
  end
  object dsEmpresaProp: TwwDataSource
    DataSet = cdsEmpresaProp
    Left = 336
    Top = 145
  end
end
