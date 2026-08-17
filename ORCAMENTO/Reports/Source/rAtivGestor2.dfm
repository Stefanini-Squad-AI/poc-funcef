inherited rptAtivGestor2: TrptAtivGestor2
  Left = 312
  Top = 224
  Width = 458
  Height = 298
  Caption = 'rptAtivGestor2'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Distribuição de Saldos por Grupo de Contas - modelo 2'
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
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Exercicio'
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
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'PeriodoIni'
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
        Width = 185
      end
      item
        Caption = 'Período Final'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT PERIODO, NOMEPERIODO '
          'FROM PERIODOORCAMEN'
          'WHERE IDPESSOA = :IDPESSOA '
          'ORDER BY PERIODO')
        LookupSettings.Chave = 'PERIODO'
        LookupSettings.Display = 'NOMEPERIODO'
        LookupSettings.Descricao = 'Período Final'
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
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'PeriodoFim'
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
        Width = 185
      end
      item
        Caption = 'Centro de Responsabilidade'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CODCENTRORESPON, NOME'
          'FROM CENTRESPON'
          'WHERE IDPESSOA =:IDPESSOA'
          'ORDER BY NOME')
        LookupSettings.Chave = 'CODCENTRORESP'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Centro de Responsabilidade'
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
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CodCentroResp'
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
        Width = 185
      end
      item
        Caption = 'Ordenar por...'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Código do Grupo Orçamentário'
          'Nome do Grupo Orçamentário')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 60
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
        Name = 'Ordenacao'
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
        Width = 357
      end
      item
        Caption = 'Valores por'
        Controle = tcEdit
        TipodeDado = tdReal
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
        Name = 'ValorDiv'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        MaskEditSettings.EditMask = '9999999,99'
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
        Width = 185
      end
      item
        Caption = 'Impimir somente as Contas com Movimento'
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
        Name = 'Movimento'
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
        Caption = 'Usuário por...'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Centro de Responsabilidade'
          'Centro de Custo')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 60
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
        Name = 'Usuario'
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
        Width = 357
      end
      item
        Caption = 'Grupo Orçamentário'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  NOMEGRUPOORCAMEN, CODGRUPOORC, '
          '  FLGANALSINT,      IDGRUPOORCAMEN '
          'FROM'
          '  GRUPOORCAMEN')
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
        Caption = 'Plano Orçamentário'
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
        Caption = 'Grupo Totalizador'
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
        Caption = 'Tipo Conta'
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
        Caption = 'NomeCentroRespon'
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
        Caption = 'Plano'
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
        Caption = 'Patro'
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
        Caption = 'DescPlano'
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
        Caption = 'DescPatro'
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
      end>
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 351
    FormWidth = 450
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpAtivGestor2
    LabelEmpresa = ppLabel128
    LabelSistema = ppLabel199
  end
  object sqlAtivGestor2: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  G.CODGRUPOORC,'
      
        '  G.NOMEGRUPOORCAMEN, '#39'Grupo: '#39' || Trim(G.CODGRUPOORC) || '#39' - '#39' ' +
        '||  G.NOMEGRUPOORCAMEN AS DESCNOMEGRUPO,'
      '  C.IDCONTAORCAMEN,'
      '  C.NOMECONTAORCAMEN,'
      '  PPV.NOME AS PLANO,'
      '  P.NOME AS PATRO,'
      '  TRIM(CR.CODEXTERNO) || '#39' - '#39' || CR.NOME AS CENTRORESPON,'
      '  TRIM(CC.CODEXTERNO) || '#39' - '#39' || CC.NOME AS DESCCENTROCUSTO,'
      '  (DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM)+'
      '   DECODE(VT1.VLRTRANSFORI,NULL,0,VT1.VLRTRANSFORI) -'
      '   DECODE(VT2.VLRTRANSFDES,NULL,0,VT2.VLRTRANSFDES) -'
      '   DECODE(VS.VLRSUPL,NULL,0,VS.VLRSUPL)+'
      '   DECODE(VR.VLRRET,NULL,0,VR.VLRRET))/:VALORDIV AS VLRINICIAL,'
      '   VA.VLRREALACUM/:VALORDIV AS VLRREALACUM,'
      '   VT1.VLRTRANSFORI/:VALORDIV AS VLRTRANSFORI,'
      '   VT2.VLRTRANSFDES/:VALORDIV AS VLRTRANSFDES,'
      
        '   VS.VLRSUPL/:VALORDIV AS VLRSUPL, VR.VLRRET/:VALORDIV AS VLRRE' +
        'T,'
      
        '   VRE.VLRRES/:VALORDIV AS VLRRES, VA.VLRORCACUM/:VALORDIV AS VL' +
        'RORCACUM,'
      '   VCE.VLRCOMP/:VALORDIV AS VLRCOMP,'
      '  (DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM) -'
      '   DECODE(VRE.VLRRES,NULL,0,VRE.VLRRES) -'
      '   DECODE(VCE.VLRCOMP,NULL,0,VCE.VLRCOMP))/:VALORDIV AS SALDO,'
      '   DECODE((NVL(VA.VLRORCACUM,0)-NVL(VRE.VLRRES,0)),0,0,'
      
        '   NVL(VCE.VLRCOMP,0)/(NVL(VA.VLRORCACUM,0)-NVL(VRE.VLRRES,0))*1' +
        '00) AS PERCENT'
      'FROM'
      '  (SELECT'
      '     SUM(DECODE(VLRORCADO,NULL,0,VLRORCADO)) AS VLRORCACUM,'
      
        '     SUM(DECODE(VLRREALIZADO,NULL,0,VLRREALIZADO)) AS VLRREALACU' +
        'M,'
      '     IDCONTAORCAMEN'
      '   FROM'
      '     SALDOORCADO'
      '   WHERE'
      '     (EXERCICIO = :EXERCICIO) AND'
      '     (PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND'
      '     (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '     (IDPESSOA = :IDPESSOA) AND'
      '     IDCONTAORCAMEN IN (SELECT C.IDCONTAORCAMEN'
      '                        FROM CONTASORCAMEN C, GRUPOORCAMEN G'
      
        '                        WHERE C.IDGRUPOORCAMEN IN (SELECT IDGRUP' +
        'OORCAMEN'
      
        '                                                   FROM   GRUPOO' +
        'RCAMEN G'
      
        '                                                   WHERE  G.CODG' +
        'RUPOORC LIKE :TOTALGRUPO'
      
        '                                                   AND G.IDPLANO' +
        'ORCAMEN = :IDPLANOORCAMEN)'
      '                        AND C.IDPLANOORCAMEN = :IDPLANOORCAMEN'
      '                        AND G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN)'
      '   GROUP BY'
      '     IDCONTAORCAMEN) VA,'
      '  (SELECT'
      '     SUM(DECODE(VLRDEVOLVIDO,NULL,'
      
        '         DECODE(VLRCOMPROMISSO,NULL,VLRRESERVA,(VLRRESERVA-VLRCO' +
        'MPROMISSO)),'
      '         DECODE(VLRCOMPROMISSO,NULL,(VLRRESERVA-VLRDEVOLVIDO),'
      
        '         (VLRRESERVA-VLRCOMPROMISSO-VLRDEVOLVIDO)))) AS VLRRES, ' +
        'IDCONTAORCAMEN'
      '   FROM'
      '     RESERVAORCAMEN'
      '   WHERE'
      '     (EXERCICIO = :EXERCICIO) AND'
      '     (PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND'
      '     (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '     (IDPESSOA = :IDPESSOA) AND'
      '     (FLGRESERVA IN ('#39'A'#39','#39'U'#39')) AND'
      '     IDCONTAORCAMEN IN (SELECT C.IDCONTAORCAMEN'
      '                        FROM CONTASORCAMEN C, GRUPOORCAMEN G'
      
        '                        WHERE C.IDGRUPOORCAMEN IN (SELECT IDGRUP' +
        'OORCAMEN'
      
        '                                                   FROM   GRUPOO' +
        'RCAMEN G'
      
        '                                                   WHERE  G.CODG' +
        'RUPOORC LIKE :TOTALGRUPO'
      
        '                                                   AND G.IDPLANO' +
        'ORCAMEN = :IDPLANOORCAMEN)'
      '                        AND C.IDPLANOORCAMEN = :IDPLANOORCAMEN'
      '                        AND G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN)'
      '   GROUP BY'
      '     IDCONTAORCAMEN) VRE,'
      '  (SELECT'
      
        '     SUM(DECODE(VLRCOMPROMISSO,NULL,0,VLRCOMPROMISSO)) AS VLRCOM' +
        'P,'
      '     IDCONTAORCAMEN'
      '   FROM'
      '     RESERVAORCAMEN'
      '   WHERE'
      '     (EXERCICIO = :EXERCICIO) AND'
      '     (PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND'
      '     (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '     (FLGRESERVA <> '#39'C'#39') AND'
      '     (IDPESSOA = :IDPESSOA) AND'
      '     IDCONTAORCAMEN IN (SELECT C.IDCONTAORCAMEN'
      '                        FROM CONTASORCAMEN C, GRUPOORCAMEN G'
      
        '                        WHERE C.IDGRUPOORCAMEN IN (SELECT IDGRUP' +
        'OORCAMEN'
      
        '                                                   FROM   GRUPOO' +
        'RCAMEN G'
      
        '                                                   WHERE  G.CODG' +
        'RUPOORC LIKE :TOTALGRUPO'
      
        '                                                   AND G.IDPLANO' +
        'ORCAMEN = :IDPLANOORCAMEN)'
      '                        AND C.IDPLANOORCAMEN = :IDPLANOORCAMEN'
      ''
      '                        AND G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN)'
      '   GROUP BY'
      '     IDCONTAORCAMEN) VCE,'
      '  (SELECT'
      '     SUM(VLRSOLICITADO) AS VLRTRANSFORI, IDCONTAORIGEM'
      '   FROM'
      '     ALTERORCAMENTO'
      '   WHERE'
      '     (EXERCICIOORIGEM = :EXERCICIO) AND'
      '     (PERIODOORIGEM BETWEEN :PERIODOINI AND :PERIODOFIM) AND'
      '     (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '     (IDPESSOA = :IDPESSOA) AND'
      '     (FLGTIPOALTER = '#39'T'#39') AND'
      '     IDCONTAORIGEM IN (SELECT C.IDCONTAORCAMEN'
      '                        FROM CONTASORCAMEN C, GRUPOORCAMEN G'
      
        '                        WHERE C.IDGRUPOORCAMEN IN (SELECT IDGRUP' +
        'OORCAMEN'
      
        '                                                   FROM   GRUPOO' +
        'RCAMEN G'
      
        '                                                   WHERE  G.CODG' +
        'RUPOORC LIKE :TOTALGRUPO'
      
        '                                                   AND G.IDPLANO' +
        'ORCAMEN = :IDPLANOORCAMEN)'
      '                        AND C.IDPLANOORCAMEN = :IDPLANOORCAMEN'
      '                        AND G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN)'
      '   GROUP BY'
      '     IDCONTAORIGEM) VT1,'
      '  (SELECT'
      '     SUM(VLRSOLICITADO) AS VLRTRANSFDES, IDCONTADESTINO'
      '   FROM'
      '     ALTERORCAMENTO'
      '   WHERE'
      '     (EXERCICIODESTINO = :EXERCICIO) AND'
      '     (PERIODODESTINO BETWEEN :PERIODOINI AND :PERIODOFIM) AND'
      '     (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '     (IDPESSOA = :IDPESSOA) AND'
      '     (FLGTIPOALTER = '#39'T'#39') AND'
      '     IDCONTADESTINO IN (SELECT C.IDCONTAORCAMEN'
      '                        FROM CONTASORCAMEN C, GRUPOORCAMEN G'
      
        '                        WHERE C.IDGRUPOORCAMEN IN (SELECT IDGRUP' +
        'OORCAMEN'
      
        '                                                   FROM   GRUPOO' +
        'RCAMEN G'
      
        '                                                   WHERE  G.CODG' +
        'RUPOORC LIKE :TOTALGRUPO'
      
        '                                                   AND G.IDPLANO' +
        'ORCAMEN = :IDPLANOORCAMEN)'
      '                        AND C.IDPLANOORCAMEN = :IDPLANOORCAMEN'
      '                        AND G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN)'
      '   GROUP BY'
      '     IDCONTADESTINO) VT2,'
      '  (SELECT'
      '     SUM(VLRSOLICITADO) AS VLRRET, IDCONTAORIGEM'
      '   FROM'
      '     ALTERORCAMENTO'
      '   WHERE'
      '     (EXERCICIOORIGEM = :EXERCICIO) AND'
      '     (PERIODOORIGEM BETWEEN :PERIODOINI AND :PERIODOFIM) AND'
      '     (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '     (IDPESSOA = :IDPESSOA) AND'
      '     (FLGTIPOALTER = '#39'R'#39') AND'
      '     IDCONTAORIGEM IN (SELECT C.IDCONTAORCAMEN'
      '                        FROM CONTASORCAMEN C, GRUPOORCAMEN G'
      
        '                        WHERE C.IDGRUPOORCAMEN IN (SELECT IDGRUP' +
        'OORCAMEN'
      
        '                                                   FROM   GRUPOO' +
        'RCAMEN G'
      
        '                                                   WHERE  G.CODG' +
        'RUPOORC LIKE :TOTALGRUPO'
      
        '                                                   AND G.IDPLANO' +
        'ORCAMEN = :IDPLANOORCAMEN)'
      '                        AND C.IDPLANOORCAMEN = :IDPLANOORCAMEN'
      '                        AND G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN)'
      '   GROUP BY'
      '     IDCONTAORIGEM) VR,'
      '  (SELECT'
      '     SUM(VLRSOLICITADO) AS VLRSUPL, IDCONTAORIGEM'
      '   FROM'
      '     ALTERORCAMENTO'
      '   WHERE'
      '     (EXERCICIOORIGEM = :EXERCICIO) AND'
      '     (PERIODOORIGEM BETWEEN :PERIODOINI AND :PERIODOFIM) AND'
      '     (IDPESSOA = :IDPESSOA) AND'
      '     (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '     (FLGTIPOALTER = '#39'S'#39') AND'
      '     IDCONTAORIGEM IN (SELECT C.IDCONTAORCAMEN'
      '                        FROM CONTASORCAMEN C, GRUPOORCAMEN G'
      
        '                        WHERE C.IDGRUPOORCAMEN IN (SELECT IDGRUP' +
        'OORCAMEN'
      
        '                                                   FROM   GRUPOO' +
        'RCAMEN G'
      
        '                                                   WHERE  G.CODG' +
        'RUPOORC LIKE :TOTALGRUPO'
      
        '                                                   AND G.IDPLANO' +
        'ORCAMEN = :IDPLANOORCAMEN)'
      '                        AND C.IDPLANOORCAMEN = :IDPLANOORCAMEN'
      '                        AND G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN)'
      '   GROUP BY'
      '     IDCONTAORIGEM) VS,'
      ''
      '  CENTCUST CC,'
      '  CONTASORCAMEN C,'
      '  GRUPOORCAMEN G,'
      '  CENTRESPON CR,'
      '  PLANPREVCONTABIL PPV,'
      '  PESSOA P'
      ''
      ''
      'WHERE'
      '  :USUARIO'
      '  :CODCENTRORESPON'
      '  :GRUPOORCAMENTARIO'
      '  (G.IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '  ((C.FLGATIVA = '#39'A'#39') OR (C.FLGATIVA IS NULL)) AND'
      '  (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND'
      '  (C.IDPATRO         = P.IDPESSOA(+)) AND'
      '  (C.IDPLANOPREV     = PPV.IDPLANOPREV(+)) AND'
      '  (C.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND'
      '  (C.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND'
      '  (C.IDCONTAORCAMEN = VA.IDCONTAORCAMEN) AND'
      '  (C.IDCONTAORCAMEN = VT1.IDCONTAORIGEM(+)) AND'
      '  (C.IDCONTAORCAMEN = VT2.IDCONTADESTINO(+)) AND'
      '  (C.IDCONTAORCAMEN = VRE.IDCONTAORCAMEN(+)) AND'
      '  (C.IDCONTAORCAMEN = VCE.IDCONTAORCAMEN(+)) AND'
      '  (C.IDCONTAORCAMEN = VR.IDCONTAORIGEM(+)) AND'
      '  :IDPLANO'
      '  :IDPATRO'
      '  :MOVIMENTO'
      '  (C.IDCONTAORCAMEN = VS.IDCONTAORIGEM(+))'
      'ORDER BY'
      '  :ORDENACAO'
      '  C.IDCONTAORCAMEN '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    OnFormartParam = sqlAtivGestor2FormartParam
    ClientDataSet = cdsAtivGestor2
    Left = 16
    Top = 48
  end
  object cdsAtivGestor2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 48
    Top = 96
  end
  object dsAtivGestor2: TwwDataSource
    DataSet = cdsAtivGestor2
    Left = 157
    Top = 48
  end
  object rpAtivGestor2: TppReport
    AutoStop = False
    DataPipeline = pplAtivGestor2
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
    Template.DatabaseSettings.DataPipeline = pplAtivGestor2
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
    Left = 237
    Top = 16
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAtivGestor2'
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36513
      mmPrintPosition = 0
      object ppLabel127: TppLabel
        UserName = 'ppLabel127'
        Caption = 'Distribuição de Saldos por Grupos Orçamentários - modelo 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 5027
        mmLeft = 26988
        mmTop = 8731
        mmWidth = 119327
        BandType = 0
      end
      object ppLine35: TppLine
        UserName = 'ppLine35'
        ParentWidth = True
        Visible = False
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 35190
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel128: TppLabel
        UserName = 'ppLabel128'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 26988
        mmTop = 2381
        mmWidth = 28575
        BandType = 0
      end
      object txtPerGestor2: TppLabel
        UserName = 'txtPerGestor2'
        ReprintOnOverFlow = True
        AutoSize = False
        Caption = 'txtPerGestor2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 26988
        mmTop = 14552
        mmWidth = 160073
        BandType = 0
      end
      object rptAtivGestor2Label6: TppLabel
        UserName = 'rptAtivGestor2Label6'
        Caption = 'rptAtivGestor2Label6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 256911
        mmTop = 25135
        mmWidth = 26458
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 5292
        mmLeft = 266436
        mmTop = 5821
        mmWidth = 12965
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplCdsImagem
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplCdsImagem'
        mmHeight = 14288
        mmLeft = 3175
        mmTop = 2117
        mmWidth = 15610
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object shpZebra: TppShape
        OnPrint = shpZebraPrint
        UserName = 'shpZebra'
        Brush.Color = 15461355
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 265
        mmWidth = 276226
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'ppDBText50'
        BlankWhenZero = True
        DataField = 'VLRINICIAL'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 115359
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText86: TppDBText
        UserName = 'ppDBText86'
        DataField = 'VLRSUPL'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 134673
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText87: TppDBText
        UserName = 'ppDBText87'
        DataField = 'VLRTRANSFORI'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 193146
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText88: TppDBText
        UserName = 'ppDBText88'
        DataField = 'VLRTRANSFDES'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 173302
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText89: TppDBText
        UserName = 'ppDBText89'
        DataField = 'SALDO'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 251355
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText90: TppDBText
        UserName = 'ppDBText90'
        DataField = 'VLRCOMP'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 231775
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText91: TppDBText
        UserName = 'ppDBText91'
        DataField = 'VLRRES'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 212461
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object rptAtivGestor2DBText2: TppDBText
        UserName = 'rptAtivGestor2DBText2'
        DataField = 'VLRRET'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 153988
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText156: TppDBText
        UserName = 'DBText156'
        DataField = 'PERCENT'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 270140
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CENTRORESPON'
        DataPipeline = pplAtivGestor2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 79111
        mmTop = 529
        mmWidth = 32015
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PLANO'
        DataPipeline = pplAtivGestor2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 8467
        mmTop = 529
        mmWidth = 32808
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PATRO'
        DataPipeline = pplAtivGestor2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 44715
        mmTop = 529
        mmWidth = 32808
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object ppLine38: TppLine
        UserName = 'ppLine38'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1323
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel199: TppLabel
        UserName = 'ppLabel199'
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
        mmWidth = 70644
        BandType = 8
      end
      object ppCalc26: TppSystemVariable
        UserName = 'Calc26'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 122238
        mmTop = 2117
        mmWidth = 39952
        BandType = 8
      end
      object ppCalc27: TppSystemVariable
        UserName = 'Calc27'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258234
        mmTop = 2117
        mmWidth = 26194
        BandType = 8
      end
    end
    object rptAtivGestor2SummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object rptAtivGestor2Label3: TppLabel
        UserName = 'rptAtivGestor2Label3'
        Caption = 'TOTAL GERAL :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 93927
        mmTop = 14023
        mmWidth = 18785
        BandType = 7
      end
      object rptAtivGestor2DBCalc8: TppDBCalc
        UserName = 'rptAtivGestor2DBCalc8'
        BlankWhenZero = True
        DataField = 'VLRINICIAL'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 115888
        mmTop = 14023
        mmWidth = 17727
        BandType = 7
      end
      object rptAtivGestor2DBCalc9: TppDBCalc
        UserName = 'rptAtivGestor2DBCalc9'
        BlankWhenZero = True
        DataField = 'VLRSUPL'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 135202
        mmTop = 14023
        mmWidth = 17727
        BandType = 7
      end
      object rptAtivGestor2DBCalc10: TppDBCalc
        UserName = 'rptAtivGestor2DBCalc10'
        BlankWhenZero = True
        DataField = 'VLRTRANSFDES'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 173832
        mmTop = 14023
        mmWidth = 17727
        BandType = 7
      end
      object rptAtivGestor2DBCalc11: TppDBCalc
        UserName = 'rptAtivGestor2DBCalc11'
        BlankWhenZero = True
        DataField = 'VLRTRANSFORI'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 193675
        mmTop = 14023
        mmWidth = 17727
        BandType = 7
      end
      object rptAtivGestor2DBCalc12: TppDBCalc
        UserName = 'rptAtivGestor2DBCalc12'
        BlankWhenZero = True
        DataField = 'VLRRES'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 212990
        mmTop = 14023
        mmWidth = 17727
        BandType = 7
      end
      object rptAtivGestor2DBCalc13: TppDBCalc
        UserName = 'rptAtivGestor2DBCalc13'
        BlankWhenZero = True
        DataField = 'VLRCOMP'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 232305
        mmTop = 14023
        mmWidth = 17727
        BandType = 7
      end
      object rptAtivGestor2DBCalc14: TppDBCalc
        UserName = 'rptAtivGestor2DBCalc14'
        BlankWhenZero = True
        DataField = 'SALDO'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 251884
        mmTop = 14023
        mmWidth = 17727
        BandType = 7
      end
      object rptAtivGestor2Line1: TppLine
        UserName = 'rptAtivGestor2Line1'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 10319
        mmWidth = 284300
        BandType = 7
      end
      object rptAtivGestor2Line2: TppLine
        UserName = 'rptAtivGestor2Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 20902
        mmWidth = 284300
        BandType = 7
      end
      object rptAtivGestor2DBCalc16: TppDBCalc
        UserName = 'rptAtivGestor2DBCalc16'
        BlankWhenZero = True
        DataField = 'VLRRET'
        DataPipeline = pplAtivGestor2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtivGestor2'
        mmHeight = 2910
        mmLeft = 154517
        mmTop = 14023
        mmWidth = 17727
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'CODGRUPOORC'
      DataPipeline = pplAtivGestor2
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAtivGestor2'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppDBText94: TppDBText
          UserName = 'ppDBText94'
          AutoSize = True
          Color = clSilver
          DataField = 'DESCNOMEGRUPO'
          DataPipeline = pplAtivGestor2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 4191
          mmLeft = 265
          mmTop = 1058
          mmWidth = 33274
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCCENTROCUSTO'
      DataPipeline = pplAtivGestor2
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAtivGestor2'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 17463
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 14540253
          mmHeight = 4763
          mmLeft = 8467
          mmTop = 1323
          mmWidth = 276226
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 8467
          mmTop = 13229
          mmWidth = 24606
          BandType = 3
          GroupNo = 1
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 44715
          mmTop = 13229
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Centro de Responsabilidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 79111
          mmTop = 13229
          mmWidth = 32808
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Dotação inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 5821
          mmLeft = 123561
          mmTop = 10319
          mmWidth = 9525
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Total suplement.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 5821
          mmLeft = 139436
          mmTop = 10319
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Total retornos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 5821
          mmLeft = 161925
          mmTop = 10319
          mmWidth = 9790
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Transf. recebidas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 5821
          mmLeft = 179652
          mmTop = 10319
          mmWidth = 11377
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Transf. enviadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 5821
          mmLeft = 200555
          mmTop = 10319
          mmWidth = 10319
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Res/Comp. aguardando'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 5821
          mmLeft = 216165
          mmTop = 10319
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 'Compromissos efetivados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 5821
          mmLeft = 231775
          mmTop = 10319
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 262467
          mmTop = 13229
          mmWidth = 6615
          BandType = 3
          GroupNo = 1
        end
        object rptAtivGestor2Label1: TppLabel
          UserName = 'rptAtivGestor2Label1'
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 280988
          mmTop = 13229
          mmWidth = 2117
          BandType = 3
          GroupNo = 1
        end
        object ppLine36: TppLine
          UserName = 'ppLine36'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 8467
          mmTop = 16669
          mmWidth = 276226
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Centro de Custo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 9260
          mmTop = 1588
          mmWidth = 28840
          BandType = 3
          GroupNo = 1
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'DESCCENTROCUSTO'
          DataPipeline = pplAtivGestor2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 4233
          mmLeft = 39423
          mmTop = 1588
          mmWidth = 83344
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rptAtivGestor2Label2: TppLabel
          UserName = 'rptAtivGestor2Label2'
          Caption = 'TOTAIS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 101600
          mmTop = 1852
          mmWidth = 10583
          BandType = 5
          GroupNo = 1
        end
        object rptAtivGestor2DBCalc1: TppDBCalc
          UserName = 'rptAtivGestor2DBCalc1'
          BlankWhenZero = True
          DataField = 'VLRINICIAL'
          DataPipeline = pplAtivGestor2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 2910
          mmLeft = 115359
          mmTop = 1852
          mmWidth = 17727
          BandType = 5
          GroupNo = 1
        end
        object rptAtivGestor2DBCalc2: TppDBCalc
          UserName = 'rptAtivGestor2DBCalc2'
          BlankWhenZero = True
          DataField = 'VLRSUPL'
          DataPipeline = pplAtivGestor2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 2910
          mmLeft = 134673
          mmTop = 1852
          mmWidth = 17727
          BandType = 5
          GroupNo = 1
        end
        object rptAtivGestor2DBCalc15: TppDBCalc
          UserName = 'rptAtivGestor2DBCalc15'
          BlankWhenZero = True
          DataField = 'VLRRET'
          DataPipeline = pplAtivGestor2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 2910
          mmLeft = 153988
          mmTop = 1852
          mmWidth = 17727
          BandType = 5
          GroupNo = 1
        end
        object rptAtivGestor2DBCalc3: TppDBCalc
          UserName = 'rptAtivGestor2DBCalc3'
          BlankWhenZero = True
          DataField = 'VLRTRANSFDES'
          DataPipeline = pplAtivGestor2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 2910
          mmLeft = 173302
          mmTop = 1852
          mmWidth = 17727
          BandType = 5
          GroupNo = 1
        end
        object rptAtivGestor2DBCalc4: TppDBCalc
          UserName = 'rptAtivGestor2DBCalc4'
          BlankWhenZero = True
          DataField = 'VLRTRANSFORI'
          DataPipeline = pplAtivGestor2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 2910
          mmLeft = 193146
          mmTop = 1852
          mmWidth = 17727
          BandType = 5
          GroupNo = 1
        end
        object rptAtivGestor2DBCalc5: TppDBCalc
          UserName = 'rptAtivGestor2DBCalc5'
          BlankWhenZero = True
          DataField = 'VLRRES'
          DataPipeline = pplAtivGestor2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 2910
          mmLeft = 212461
          mmTop = 1852
          mmWidth = 17727
          BandType = 5
          GroupNo = 1
        end
        object rptAtivGestor2DBCalc6: TppDBCalc
          UserName = 'rptAtivGestor2DBCalc6'
          BlankWhenZero = True
          DataField = 'VLRCOMP'
          DataPipeline = pplAtivGestor2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 2910
          mmLeft = 231775
          mmTop = 1852
          mmWidth = 17727
          BandType = 5
          GroupNo = 1
        end
        object rptAtivGestor2DBCalc7: TppDBCalc
          UserName = 'rptAtivGestor2DBCalc7'
          BlankWhenZero = True
          DataField = 'SALDO'
          DataPipeline = pplAtivGestor2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAtivGestor2'
          mmHeight = 2910
          mmLeft = 251355
          mmTop = 1852
          mmWidth = 17727
          BandType = 5
          GroupNo = 1
        end
        object ppLine56: TppLine
          UserName = 'ppLine56'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 8467
          mmTop = 265
          mmWidth = 276226
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object CdsImagem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 160
    Top = 104
  end
  object dsImagem: TDataSource
    DataSet = CdsImagem
    Left = 240
    Top = 96
  end
  object pplCdsImagem: TppBDEPipeline
    DataSource = dsImagem
    UserName = 'lCdsImagem'
    Left = 240
    Top = 144
  end
  object pplAtivGestor2: TppBDEPipeline
    DataSource = dsAtivGestor2
    UserName = 'lAtivGestor2'
    Left = 245
    Top = 56
    object pplAtivGestor2ppField1: TppField
      FieldAlias = 'CODGRUPOORC'
      FieldName = 'CODGRUPOORC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField2: TppField
      FieldAlias = 'NOMEGRUPOORCAMEN'
      FieldName = 'NOMEGRUPOORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField3: TppField
      FieldAlias = 'IDCONTAORCAMEN'
      FieldName = 'IDCONTAORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField4: TppField
      FieldAlias = 'NOMECONTAORCAMEN'
      FieldName = 'NOMECONTAORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField5: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField6: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField7: TppField
      FieldAlias = 'CENTRORESPON'
      FieldName = 'CENTRORESPON'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField8: TppField
      FieldAlias = 'DESCCENTROCUSTO'
      FieldName = 'DESCCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField9: TppField
      FieldAlias = 'VLRINICIAL'
      FieldName = 'VLRINICIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField10: TppField
      FieldAlias = 'VLRREALACUM'
      FieldName = 'VLRREALACUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField11: TppField
      FieldAlias = 'VLRTRANSFORI'
      FieldName = 'VLRTRANSFORI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField12: TppField
      FieldAlias = 'VLRTRANSFDES'
      FieldName = 'VLRTRANSFDES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField13: TppField
      FieldAlias = 'VLRSUPL'
      FieldName = 'VLRSUPL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField14: TppField
      FieldAlias = 'VLRRET'
      FieldName = 'VLRRET'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField15: TppField
      FieldAlias = 'VLRRES'
      FieldName = 'VLRRES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField16: TppField
      FieldAlias = 'VLRORCACUM'
      FieldName = 'VLRORCACUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField17: TppField
      FieldAlias = 'VLRCOMP'
      FieldName = 'VLRCOMP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField18: TppField
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplAtivGestor2ppField19: TppField
      FieldAlias = 'PERCENT'
      FieldName = 'PERCENT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
  end
end
