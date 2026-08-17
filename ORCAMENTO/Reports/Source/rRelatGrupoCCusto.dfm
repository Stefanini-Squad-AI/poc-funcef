inherited rptRelatGrupoCCusto: TrptRelatGrupoCCusto
  Left = 379
  Top = 295
  Height = 187
  Caption = 'rptRelatGrupoCCusto'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Orçado x Realizado por Grupo por centro de Custo'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Exercício'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT EXERCICIO'
          'FROM  PERIODOORCAMEN          '
          'WHERE IDPESSOA = :IDPESSOA         '
          'ORDER BY EXERCICIO         ')
        LookupSettings.Chave = 'EXERCICIO'
        LookupSettings.Display = 'EXERCICIO'
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
        Required = False
        Name = 'Exercicio'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Período Inicial'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT PERIODO, NOMEPERIODO '
          'FROM PERIODOORCAMEN'
          'WHERE IDPESSOA = :IDPESSOA '
          'ORDER BY PERIODO')
        LookupSettings.Chave = 'PERIODO'
        LookupSettings.Display = 'NOMEPERIODO'
        LookupSettings.Descricao = 'Período Inicial'
        LookupSettings.Tamanho = '60'
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
        Name = 'PeriodoIni'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Centro de Responsabilidade'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   CODCENTRORESPON, NOME'
          'FROM '
          '   CENTRESPON '
          'WHERE'
          '   IDPESSOA =:IDPESSOA'
          'ORDER BY '
          '  NOME')
        LookupSettings.Chave = 'CODCENTRORESPON'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Centro de Responsabilidade'
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
        Required = False
        Name = 'CResp'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Imprime Valores Zerados'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
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
        Name = 'ValZero'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end
      item
        Caption = 'Moeda'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '   MOECODIGO, MOEDESC'
          'FROM'
          '   MOEDA'
          'WHERE'
          '   MOEINATIVO = '#39'A'#39
          'ORDER BY'
          '  MOEDESC')
        LookupSettings.Chave = 'MOECODIGO'
        LookupSettings.Display = 'MOEDESC'
        LookupSettings.Descricao = 'Moeda'
        LookupSettings.Tamanho = '20'
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
        Name = 'Moeda'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Grau'
        Controle = tcSpinEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
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
        Name = 'Grau'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 1
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 75
      end
      item
        Caption = 'Grupo Inicial'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          
            'SELECT CODGRUPOORC, (CODGRUPOORC + '#39' - '#39' + NOMEGRUPOORCAMEN) AS ' +
            'NOMEGRUPO'
          'FROM GRUPOORCAMEN'
          'ORDER BY CODGRUPOORC')
        LookupSettings.Chave = 'CODGRUPO'
        LookupSettings.Display = 'NOMEGRUPO'
        LookupSettings.Descricao = 'Grupo Inicial'
        LookupSettings.Tamanho = '43'
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
        Name = 'GrupoIni'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Grupo Final'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          
            'SELECT CODGRUPOORC, (CODGRUPOORC + '#39' - '#39' + NOMEGRUPOORCAMEN) AS ' +
            'NOMEGRUPO'
          'FROM GRUPOORCAMEN'
          'ORDER BY CODGRUPOORC')
        LookupSettings.Chave = 'CODGRUPO'
        LookupSettings.Display = 'NOMEGRUPO'
        LookupSettings.Descricao = 'Grupo Final'
        LookupSettings.Tamanho = '43'
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
        Name = 'GrupoFim'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Cenário'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT IDCENARIOORCAMEN, NOMECENARIO'
          'FROM CENARIOORCAMEN'
          'ORDER BY NOMECENARIO')
        LookupSettings.Chave = 'IDCENARIOORCAMEN'
        LookupSettings.Display = 'NOMECENARIO'
        LookupSettings.Descricao = 'Cenáro'
        LookupSettings.Tamanho = '60'
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
        Name = 'Cenario'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Parâmetro 1 - Posição Inicial'
        Controle = tcSpinEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
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
        Name = 'Pos1'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 1
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 75
      end
      item
        Caption = 'Parâmetro 1 - Dígitos'
        Controle = tcSpinEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
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
        Name = 'Digitos1'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 1
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 75
      end
      item
        Caption = 'Parâmetro 1 - Nome'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
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
        Name = 'Nome1'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Parâmetro 1 - Conteúdo'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
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
        Name = 'Conteudo1'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Parâmetro 2 - Posição Inicial'
        Controle = tcSpinEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
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
        Name = 'Pos2'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 1
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 75
      end
      item
        Caption = 'Parâmetro 2 - Dígitos'
        Controle = tcSpinEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
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
        Name = 'Digitos2'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 1
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 75
      end
      item
        Caption = 'Parâmetro 2 - Nome'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
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
        Name = 'Nome2'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Parâmetro 2 - Conteúdo'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
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
        Name = 'Conteudo2'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Parâmetro 3 - Posição Inicial'
        Controle = tcSpinEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
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
        Name = 'Pos3'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 1
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 75
      end
      item
        Caption = 'Parâmetro 3 - Dígitos'
        Controle = tcSpinEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
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
        Name = 'Digitos3'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 1
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 75
      end
      item
        Caption = 'Parâmetro 3 - Nome'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
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
        Name = 'Nome3'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Parâmetro 3 - Conteúdo'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
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
        Name = 'Conteudo3'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Parâmetro 4 - Posição Inicial'
        Controle = tcSpinEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
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
        Name = 'Pos4'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 1
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 75
      end
      item
        Caption = 'Parâmetro 4 - Dígitos'
        Controle = tcSpinEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
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
        Name = 'Digitos4'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 1
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 75
      end
      item
        Caption = 'Parâmetro 4 - Nome'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
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
        Name = 'Nome4'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Parâmetro 4 - Conteúdo'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
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
        Name = 'Conteudo4'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Centro de Custo'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   CODCENTROCUSTO, NOME'
          'FROM '
          '   CENTCUST '
          'WHERE'
          '         (IDEMPRESA =:IDEMPRESA)'
          '     AND (ATIVO = '#39'S'#39')'
          'ORDER BY'
          '   NOME')
        LookupSettings.Chave = 'CODCENTROCUSTO'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Centro de Custo'
        LookupSettings.Tamanho = '60'
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
        Name = 'CCusto'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Atividade/Projeto'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   UNIDNEGOC, NOME'
          'FROM  '
          '   UNIDNEGOCIO '
          'WHERE'
          '   IDPESSOA =:IDPESSOA'
          'ORDER BY'
          '   NOME')
        LookupSettings.Chave = 'UNIDNEGOC'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Atividade/Projeto'
        LookupSettings.Tamanho = '25'
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
        Name = 'AtivProj'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Plano Previdenciário'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '   IDPLANOPREV, NOME'
          'FROM'
          '   PLANPREVCONTABIL'
          'ORDER BY'
          '   NOME')
        LookupSettings.Chave = 'IDPLANOPREV'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Plano Previdenciário'
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
        Name = 'PPrev'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end
      item
        Caption = 'Patrocinadora'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   PA.IDPESSOA, PE.NOME'
          'FROM'
          '   PESSOA PE,'
          '   PATRO PA'
          'WHERE'
          '   (PA.IDPESSOA = PE.IDPESSOA)'
          'ORDER BY'
          '   PE.NOME')
        LookupSettings.Chave = 'IDPESSOA'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Patrocinadora'
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
        Name = 'Patro'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 185
      end>
    OnParamControlExit = CmpRptCMParamControlExit
    FormWidth = 450
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpRelatGrupoCCust
  end
  object sqlRelatGrupoCCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT C.CODCENTROCUSTO, C.NOME,'
      '       G.CODGRUPOORC, G.NOMEGRUPOORCAMEN,'
      '      0 AS ORC01, 0 AS REA01,'
      '      0 AS ORC02, 0 AS REA02,'
      '      0 AS ORC03, 0 AS REA03,'
      '      0 AS ORC04, 0 AS REA04,'
      '      0 AS ORC05, 0 AS REA05,'
      '      0 AS ORC06, 0 AS REA06,'
      '      0 AS TOTORC, 0 AS TOTREA,'
      '      0 AS PERORC, 0 AS PERREA'
      'FROM GRUPOORCAMEN G, CENTCUST C'
      'WHERE (C.IDEMPRESA = :IDEMPRESA)'
      '  AND (LENGTH(RTRIM(G.CODGRUPOORC)) <= :NUMDIGGRAU)'
      '  AND (G.CODGRUPOORC >= :CODGRUPOINI)'
      '  AND (G.CODGRUPOORC <= :CODGRUPOFIM)'
      'ORDER BY C.CODCENTROCUSTO, G.CODGRUPOORC')
    ClientDataSet = cdsRelatGrupoCCusto
    Left = 16
    Top = 48
  end
  object cdsRelatGrupoCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 48
    Top = 48
  end
  object dsRelatGrupoCCust: TwwDataSource
    DataSet = cdsRelatGrupoCCusto
    Left = 86
    Top = 47
  end
  object pplRelatGrupoCCust: TppBDEPipeline
    DataSource = dsRelatGrupoCCust
    UserName = 'lRelatGrupoCCust'
    Left = 126
    Top = 47
    object pplRelatGrupoCCustppField1: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object pplRelatGrupoCCustppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object pplRelatGrupoCCustppField3: TppField
      FieldAlias = 'CODGRUPOORC'
      FieldName = 'CODGRUPOORC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object pplRelatGrupoCCustppField4: TppField
      FieldAlias = 'NOMEGRUPOORCAMEN'
      FieldName = 'NOMEGRUPOORCAMEN'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplRelatGrupoCCustppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORC01'
      FieldName = 'ORC01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplRelatGrupoCCustppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'REA01'
      FieldName = 'REA01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplRelatGrupoCCustppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORC02'
      FieldName = 'ORC02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplRelatGrupoCCustppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'REA02'
      FieldName = 'REA02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplRelatGrupoCCustppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORC03'
      FieldName = 'ORC03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplRelatGrupoCCustppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'REA03'
      FieldName = 'REA03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplRelatGrupoCCustppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORC04'
      FieldName = 'ORC04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplRelatGrupoCCustppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'REA04'
      FieldName = 'REA04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplRelatGrupoCCustppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORC05'
      FieldName = 'ORC05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplRelatGrupoCCustppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'REA05'
      FieldName = 'REA05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplRelatGrupoCCustppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORC06'
      FieldName = 'ORC06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplRelatGrupoCCustppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'REA06'
      FieldName = 'REA06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplRelatGrupoCCustppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTORC'
      FieldName = 'TOTORC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplRelatGrupoCCustppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTREA'
      FieldName = 'TOTREA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplRelatGrupoCCustppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERORC'
      FieldName = 'PERORC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplRelatGrupoCCustppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERREA'
      FieldName = 'PERREA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
  end
  object rpRelatGrupoCCust: TppReport
    AutoStop = False
    DataPipeline = pplRelatGrupoCCust
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
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 166
    Top = 47
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand28: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30427
      mmPrintPosition = 0
      object ppLabel265: TppLabel
        UserName = 'ppLabel83'
        Caption = 'Orçado x Realizado por Grupo x C Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 109538
        mmTop = 8996
        mmWidth = 82550
        BandType = 0
      end
      object ppLine95: TppLine
        UserName = 'ppLine61'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20373
        mmWidth = 284427
        BandType = 0
      end
      object ppLabel268: TppLabel
        UserName = 'ppLabel205'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 127265
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel271: TppLabel
        UserName = 'rpRelatGrupoLabel1'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 9525
        mmTop = 26194
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel274: TppLabel
        UserName = 'rpRelatGrupoLabel2'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 26458
        mmTop = 26194
        mmWidth = 11906
        BandType = 0
      end
      object ppLine96: TppLine
        UserName = 'rpRelatGrupoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 29633
        mmWidth = 284427
        BandType = 0
      end
      object ppLine97: TppLine
        UserName = 'rpRelatGrupoLine2'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 77523
        mmTop = 22754
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoCCustoLabel262: TppLabel
        UserName = 'rpRelatGrupoCCustoLabel262'
        AutoSize = False
        Caption = 'Mes01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 89694
        mmTop = 20902
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel280: TppLabel
        UserName = 'rpRelatGrupoLabel4'
        AutoSize = False
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 77523
        mmTop = 26194
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel282: TppLabel
        UserName = 'rpRelatGrupoLabel5'
        AutoSize = False
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 93398
        mmTop = 26194
        mmWidth = 15610
        BandType = 0
      end
      object ppLine98: TppLine
        UserName = 'rpRelatGrupoLine3'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 98690
        mmTop = 22754
        mmWidth = 10319
        BandType = 0
      end
      object ppLine99: TppLine
        UserName = 'rpRelatGrupoLine4'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 109802
        mmTop = 22754
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoCCustoLabel265: TppLabel
        UserName = 'rpRelatGrupoCCustoLabel265'
        AutoSize = False
        Caption = 'Mes02'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 122238
        mmTop = 20902
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel284: TppLabel
        UserName = 'rpRelatGrupoLabel7'
        AutoSize = False
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 109802
        mmTop = 26194
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel285: TppLabel
        UserName = 'rpRelatGrupoLabel8'
        AutoSize = False
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 125942
        mmTop = 26194
        mmWidth = 15610
        BandType = 0
      end
      object ppLine100: TppLine
        UserName = 'rpRelatGrupoLine5'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 131234
        mmTop = 22754
        mmWidth = 10319
        BandType = 0
      end
      object ppLine101: TppLine
        UserName = 'rpRelatGrupoLine6'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 142346
        mmTop = 22754
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoCCustoLabel268: TppLabel
        UserName = 'rpRelatGrupoCCustoLabel268'
        AutoSize = False
        Caption = 'Mes03'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 154252
        mmTop = 20902
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel287: TppLabel
        UserName = 'rpRelatGrupoLabel10'
        AutoSize = False
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 142346
        mmTop = 26194
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel290: TppLabel
        UserName = 'rpRelatGrupoLabel11'
        AutoSize = False
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 158486
        mmTop = 26194
        mmWidth = 15610
        BandType = 0
      end
      object ppLine102: TppLine
        UserName = 'rpRelatGrupoLine7'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 163777
        mmTop = 22754
        mmWidth = 10319
        BandType = 0
      end
      object ppLine103: TppLine
        UserName = 'rpRelatGrupoLine8'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 175419
        mmTop = 22754
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoCCustoLabel271: TppLabel
        UserName = 'rpRelatGrupoCCustoLabel271'
        AutoSize = False
        Caption = 'Mes04'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 187590
        mmTop = 20902
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel292: TppLabel
        UserName = 'rpRelatGrupoLabel13'
        AutoSize = False
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 175419
        mmTop = 26194
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel293: TppLabel
        UserName = 'rpRelatGrupoLabel14'
        AutoSize = False
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 191294
        mmTop = 26194
        mmWidth = 15610
        BandType = 0
      end
      object ppLine104: TppLine
        UserName = 'rpRelatGrupoLine9'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 196586
        mmTop = 22754
        mmWidth = 10319
        BandType = 0
      end
      object ppLine105: TppLine
        UserName = 'rpRelatGrupoLine10'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 207698
        mmTop = 22754
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoCCustoLabel274: TppLabel
        UserName = 'rpRelatGrupoCCustoLabel274'
        AutoSize = False
        Caption = 'Mes05'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 220134
        mmTop = 20902
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel295: TppLabel
        UserName = 'rpRelatGrupoLabel16'
        AutoSize = False
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 207698
        mmTop = 26194
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel296: TppLabel
        UserName = 'rpRelatGrupoLabel17'
        AutoSize = False
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 223838
        mmTop = 26194
        mmWidth = 15610
        BandType = 0
      end
      object ppLine106: TppLine
        UserName = 'rpRelatGrupoLine11'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 229130
        mmTop = 22754
        mmWidth = 10319
        BandType = 0
      end
      object ppLine107: TppLine
        UserName = 'rpRelatGrupoLine12'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 240242
        mmTop = 22754
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoCCustoLabel277: TppLabel
        UserName = 'rpRelatGrupoCCustoLabel277'
        AutoSize = False
        Caption = 'Mes06'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 252148
        mmTop = 20902
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel298: TppLabel
        UserName = 'rpRelatGrupoLabel19'
        AutoSize = False
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 240242
        mmTop = 26194
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel299: TppLabel
        UserName = 'rpRelatGrupoLabel20'
        AutoSize = False
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 256382
        mmTop = 26194
        mmWidth = 15610
        BandType = 0
      end
      object ppLine108: TppLine
        UserName = 'rpRelatGrupoLine13'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 261673
        mmTop = 22754
        mmWidth = 10319
        BandType = 0
      end
      object rpRelatGrupoCCustoLabel280: TppLabel
        UserName = 'rpRelatGrupoCCustoLabel280'
        Caption = 'rpRelatGrupoCCustoLabel280'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 24606
        mmTop = 3704
        mmWidth = 39688
        BandType = 0
      end
      object ppLabel301: TppLabel
        UserName = 'rpRelatGrupoLabel22'
        Caption = 'Exercício:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 3704
        mmWidth = 13758
        BandType = 0
      end
      object rpRelatGrupoCCustoLabel282: TppLabel
        UserName = 'rpRelatGrupoCCustoLabel282'
        AutoSize = False
        Caption = 'rpRelatGrupoCCustoLabel282'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 7938
        mmWidth = 46831
        BandType = 0
      end
      object rpRelatGrupoCCustoLabel283: TppLabel
        UserName = 'rpRelatGrupoCCustoLabel283'
        AutoSize = False
        Caption = 'rpRelatGrupoCCustoLabel283'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 12171
        mmWidth = 46831
        BandType = 0
      end
      object rpRelatGrupoCCustoLabel284: TppLabel
        UserName = 'rpRelatGrupoCCustoLabel284'
        AutoSize = False
        Caption = 'rpRelatGrupoCCustoLabel284'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 59531
        mmTop = 8202
        mmWidth = 46831
        BandType = 0
      end
      object rpRelatGrupoCCustoLabel285: TppLabel
        UserName = 'rpRelatGrupoCCustoLabel285'
        AutoSize = False
        Caption = 'rpRelatGrupoCCustoLabel285'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 59531
        mmTop = 12171
        mmWidth = 46831
        BandType = 0
      end
      object rpRelatGrupoCCustoLabel286: TppLabel
        UserName = 'rpRelatGrupoCCustoLabel286'
        AutoSize = False
        Caption = 'rpRelatGrupoCCustoLabel286'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 205582
        mmTop = 12171
        mmWidth = 74348
        BandType = 0
      end
      object rpRelatGrupoCCustoLabel287: TppLabel
        UserName = 'rpRelatGrupoCCustoLabel287'
        AutoSize = False
        Caption = 'rpRelatGrupoCCustoLabel287'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 205582
        mmTop = 8202
        mmWidth = 74348
        BandType = 0
      end
      object ppLabel308: TppLabel
        UserName = 'rpRelatGrupoLabel29'
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
        mmLeft = 273844
        mmTop = 26194
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel297: TppLabel
        UserName = 'Label297'
        AutoSize = False
        Caption = 'Label297'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 16140
        mmWidth = 269611
        BandType = 0
      end
    end
    object ppDetailBand28: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText138: TppDBText
        UserName = 'rpRelatGrupoDBText1'
        DataField = 'CODGRUPOORC'
        DataPipeline = pplRelatGrupoCCust
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 9525
        mmTop = 265
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText139: TppDBText
        UserName = 'rpRelatGrupoDBText2'
        DataField = 'NOMEGRUPOORCAMEN'
        DataPipeline = pplRelatGrupoCCust
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 26458
        mmTop = 265
        mmWidth = 49742
        BandType = 4
      end
      object ppDBText140: TppDBText
        UserName = 'rpRelatGrupoDBText3'
        DataField = 'ORC01'
        DataPipeline = pplRelatGrupoCCust
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 77523
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText141: TppDBText
        UserName = 'rpRelatGrupoDBText4'
        DataField = 'REA01'
        DataPipeline = pplRelatGrupoCCust
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 93398
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText142: TppDBText
        UserName = 'rpRelatGrupoDBText5'
        DataField = 'ORC02'
        DataPipeline = pplRelatGrupoCCust
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 109802
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText143: TppDBText
        UserName = 'rpRelatGrupoDBText6'
        DataField = 'REA02'
        DataPipeline = pplRelatGrupoCCust
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 125942
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText144: TppDBText
        UserName = 'rpRelatGrupoDBText7'
        DataField = 'ORC03'
        DataPipeline = pplRelatGrupoCCust
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 142346
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText145: TppDBText
        UserName = 'rpRelatGrupoDBText8'
        DataField = 'REA03'
        DataPipeline = pplRelatGrupoCCust
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText146: TppDBText
        UserName = 'rpRelatGrupoDBText9'
        DataField = 'ORC04'
        DataPipeline = pplRelatGrupoCCust
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 174890
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText147: TppDBText
        UserName = 'rpRelatGrupoDBText10'
        DataField = 'REA04'
        DataPipeline = pplRelatGrupoCCust
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 191030
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText148: TppDBText
        UserName = 'rpRelatGrupoDBText11'
        DataField = 'ORC05'
        DataPipeline = pplRelatGrupoCCust
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 207434
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText149: TppDBText
        UserName = 'rpRelatGrupoDBText12'
        DataField = 'REA05'
        DataPipeline = pplRelatGrupoCCust
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 223573
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText150: TppDBText
        UserName = 'rpRelatGrupoDBText13'
        DataField = 'ORC06'
        DataPipeline = pplRelatGrupoCCust
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 239978
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText151: TppDBText
        UserName = 'rpRelatGrupoDBText14'
        DataField = 'REA06'
        DataPipeline = pplRelatGrupoCCust
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 256117
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText152: TppDBText
        UserName = 'rpRelatGrupoDBText15'
        DataField = 'PERORC'
        DataPipeline = pplRelatGrupoCCust
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 273844
        mmTop = 265
        mmWidth = 9260
        BandType = 4
      end
    end
    object ppFooterBand28: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel309: TppLabel
        UserName = 'ppLabel206'
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
        mmWidth = 280194
        BandType = 8
      end
      object ppLine109: TppLine
        UserName = 'ppLine62'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284427
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'Calc46'
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
        mmWidth = 280194
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'Calc47'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 254265
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'CODCENTROCUSTO'
      DataPipeline = pplRelatGrupoCCust
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppLabel310: TppLabel
          UserName = 'Label310'
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 4233
          mmTop = 1058
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppDBText153: TppDBText
          UserName = 'DBText153'
          DataField = 'CODCENTROCUSTO'
          DataPipeline = pplRelatGrupoCCust
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 23813
          mmTop = 1058
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppDBText154: TppDBText
          UserName = 'DBText154'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = pplRelatGrupoCCust
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 43656
          mmTop = 1058
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object sqlCompSaldo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO,'
      
        '  ROUND(SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,'#39'P'#39 +
        ',S.VLRORCADO,'
      '        (S.VLRORCADO*-1)))),2) AS VLRORCADOS,'
      
        '  ROUND(SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,' +
        #39'P'#39','
      
        '        S.VLRREALIZADO,(S.VLRREALIZADO*-1)))),2) AS VLRREALIZADO' +
        'S,'
      
        '  ROUND(DECODE(G.FLGSINALGRUPO,'#39'P'#39',SUM(DECODE(S.VLRORCADO,NULL,0' +
        ','
      
        '        DECODE(C.FLGSINALCONTA,'#39'P'#39',S.VLRORCADO,(S.VLRORCADO*-1))' +
        ')),'
      
        '        SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,'#39'P'#39 +
        ',S.VLRORCADO,'
      '        (S.VLRORCADO*-1))))*-1),2) AS VLRORCADO,'
      
        '  ROUND(DECODE(G.FLGSINALGRUPO,'#39'P'#39',SUM(DECODE(S.VLRREALIZADO,NUL' +
        'L,0,'
      
        '        DECODE(C.FLGSINALCONTA,'#39'P'#39',S.VLRREALIZADO,(S.VLRREALIZAD' +
        'O*-1)))),'
      
        '        SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,' +
        #39'P'#39','
      
        '        S.VLRREALIZADO,(S.VLRREALIZADO*-1))))*-1),2) AS VLRREALI' +
        'ZADO'
      'FROM'
      '  GRUPOORCAMEN G,'
      '  CONTASORCAMEN C,'
      '  SALDOORCADO S'
      'WHERE'
      '  (G.IDGRUPOORCAMEN IN (:GRUPO)) AND'
      '  ((C.FLGATIVA = '#39'A'#39') OR (C.FLGATIVA IS NULL)) AND'
      '  (S.EXERCICIO = :EXERCICIO) AND'
      '  (S.PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND'
      '  (S.IDPESSOA = :IDPESSOA) AND'
      '  (C.CODCENTROCUSTO = :CODCENTROCUSTO) AND'
      '  :CRESP'
      '  :CCUSTO'
      '  :ATIVPROJ'
      '  :PPREV'
      '  :PATRO'
      '  :PARAMETRO1'
      '  :PARAMETRO2'
      '  :PARAMETRO3'
      '  :PARAMETRO4'
      '  (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND'
      '  (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND'
      '  (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)'
      'GROUP BY'
      '  S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO'
      'ORDER  BY'
      '  S.EXERCICIO, S.PERIODO'
      '')
    OnFormartParam = sqlCompSaldoFormartParam
    ClientDataSet = cdsCompSaldo
    Left = 64
    Top = 80
  end
  object cdsCompSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 96
    Top = 80
  end
  object sqlCompSaldoC: TCMSqlParams
    SQL.Strings = (
      
        'SELECT                                                          ' +
        '            '
      '  U.PERIODO, U.EXERCICIO, U.FLGSINALGRUPO,'
      '  SUM(U.VLRORCADOS) AS VLRORCADOS,'
      '  SUM(U.VLRREALIZADOS) AS VLRREALIZADOS,'
      '  SUM(U.VLRORCADO) AS VLRORCADO,'
      '  SUM(U.VLRREALIZADO) AS VLRREALIZADO'
      'FROM'
      '  (SELECT'
      '     S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO,'
      '     (0) AS VLRORCADOS,'
      
        '     ROUND(SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCON' +
        'TA,'#39'P'#39','
      
        '           S.VLRREALIZADO,(S.VLRREALIZADO*-1)))),2) AS VLRREALIZ' +
        'ADOS,'
      '     (0) AS VLRORCADO,'
      
        '     ROUND(DECODE(G.FLGSINALGRUPO,'#39'P'#39',SUM(DECODE(S.VLRREALIZADO,' +
        'NULL,0,'
      
        '           DECODE(C.FLGSINALCONTA,'#39'P'#39',S.VLRREALIZADO,(S.VLRREALI' +
        'ZADO*-1)))),'
      
        '           SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCON' +
        'TA,'#39'P'#39','
      
        '           S.VLRREALIZADO,(S.VLRREALIZADO*-1))))*-1),2) AS VLRRE' +
        'ALIZADO'
      '   FROM'
      '     CONTASORCAMEN C,'
      '     GRUPOORCAMEN G,'
      '     SALDOORCADO S'
      '   WHERE'
      '     (G.IDGRUPOORCAMEN IN (:GRUPO)) AND'
      '     ((C.FLGATIVA = '#39'A'#39') OR (C.FLGATIVA IS NULL)) AND'
      '     (S.EXERCICIO = :EXERCICIO) AND'
      '     (S.PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND'
      '     (S.IDPESSOA = :IDPESSOA) AND'
      '     (C.CODCENTROCUSTO = :CODCENTROCUSTO) AND'
      '     :CRESP'
      '     :CCUSTO'
      '     :ATIVPROJ'
      '     :PPREV'
      '     :PATRO'
      '     :PARAMETRO1'
      '     :PARAMETRO2'
      '     :PARAMETRO3'
      '     :PARAMETRO4'
      '     (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND'
      '     (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND'
      '     (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)'
      '   GROUP BY'
      '     S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO'
      '   UNION ALL'
      '   SELECT'
      '     S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO,'
      
        '     ROUND(SUM(DECODE(S.VLRORCCENARIO,NULL,0,DECODE(C.FLGSINALCO' +
        'NTA,'#39'P'#39','
      
        '           S.VLRORCCENARIO,(S.VLRORCCENARIO*-1)))),2) AS VLRORCA' +
        'DOS,'
      '     (0) AS VLRREALIZADOS,'
      
        '     ROUND(DECODE(G.FLGSINALGRUPO,'#39'P'#39',SUM(DECODE(S.VLRORCCENARIO' +
        ',NULL,0,'
      
        '           DECODE(C.FLGSINALCONTA,'#39'P'#39',S.VLRORCCENARIO,(S.VLRORCC' +
        'ENARIO*-1)))),'
      
        '           SUM(DECODE(S.VLRORCCENARIO,NULL,0,DECODE(C.FLGSINALCO' +
        'NTA,'#39'P'#39','
      
        '           S.VLRORCCENARIO,(S.VLRORCCENARIO*-1))))*-1),2) AS VLR' +
        'ORCADO,'
      '     (0) AS VLRREALIZADO'
      '   FROM'
      '     GRUPOORCAMEN G,'
      '     CONTASORCAMEN C,'
      '     VALORESCENARIO S'
      '   WHERE'
      '     (G.IDGRUPOORCAMEN IN (:GRUPO)) AND'
      '     ((C.FLGATIVA = '#39'A'#39') OR (C.FLGATIVA IS NULL)) AND'
      '     (S.EXERCICIO = :EXERCICIO) AND'
      '     (S.PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND'
      '     (S.IDPESSOA = :IDPESSOA) AND'
      '     (S.IDCENARIOORCAMEN = :IDCENARIOORCAMEN) AND'
      '     (C.CODCENTROCUSTO = :CODCENTROCUSTO) AND'
      '     :CRESP'
      '     :CCUSTO'
      '     :ATIVPROJ'
      '     :PPREV'
      '     :PATRO'
      '     :PARAMETRO1'
      '     :PARAMETRO2'
      '     :PARAMETRO3'
      '     :PARAMETRO4'
      '     (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND'
      '     (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND'
      '     (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)'
      '   GROUP BY'
      '     S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO  ) U'
      
        'GROUP BY                                                        ' +
        '            '
      '  U.PERIODO, U.EXERCICIO, U.FLGSINALGRUPO'
      
        'ORDER  BY                                                       ' +
        '            '
      '  U.EXERCICIO, U.PERIODO'
      '')
    OnFormartParam = sqlCompSaldoCFormartParam
    ClientDataSet = cdsCompSaldoC
    Left = 64
    Top = 112
  end
  object cdsCompSaldoC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 96
    Top = 112
  end
  object sqlPeriodos: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PERIODO, NOMEPERIODO, DATAINIPERIODO, DATAFIMPERIODO'
      'FROM'
      '  PERIODOORCAMEN'
      'WHERE'
      '  (IDPESSOA = :IDPESSOA) AND'
      '  (EXERCICIO = :EXERCICIO) AND'
      '  ((PERIODO >= 1) AND (PERIODO <= 12))'
      'ORDER BY'
      '  PERIODO')
    ClientDataSet = cdsPeriodos
    Left = 152
    Top = 80
  end
  object cdsPeriodos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 192
    Top = 80
  end
  object sqlGrupoOrc: TCMSqlParams
    SQL.Strings = (
      'SELECT IDGRUPOORCAMEN'
      'FROM GRUPOORCAMEN'
      'WHERE (CODGRUPOORC LIKE :CODGRUPOORC) ')
    ClientDataSet = cdsGrupoOrc
    Left = 152
    Top = 112
  end
  object cdsGrupoOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 192
    Top = 112
  end
end
