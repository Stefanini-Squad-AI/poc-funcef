inherited rptDemonstrativoModelo6: TrptDemonstrativoModelo6
  Left = 324
  Top = 119
  Width = 632
  Height = 291
  Caption = 'rptDemonstrativoModelo6'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited cdsTestaPer: TClientDataSet
    Left = 175
    Top = 104
  end
  inherited CmpRptCM: TCmParamReport
    Caption = 'relatório Demonstrativo de Resultado - Modelo/06'
    Params = <
      item
        Caption = 'Exercício:'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT '
          '   PEREXERCICIO '
          'FROM '
          '   PERIODO '
          'ORDER BY '
          '   PEREXERCICIO')
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
        Name = 'Exercício:'
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
        Caption = 'Período Inicial:'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '   PERNUMERO,'
          
            '  (PEREXERCICIO || '#39' + QuotedStr('#39' - '#39')  + '#39' || PERNOME) AS PERE' +
            'XERCNOME'
          'FROM'
          '   PERIODO'
          'ORDER BY PERNUMERO')
        LookupSettings.Chave = 'PERNUMERO'
        LookupSettings.Display = 'PEREXERCNOME'
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Período Inicial:'
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
        Caption = 'Período Final:'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '   PERNUMERO,'
          
            '   (PEREXERCICIO || '#39' + QuotedStr('#39' - '#39')  + '#39' || PERNOME) AS PER' +
            'EXERCNOME'
          'FROM'
          '   PERIODO'
          'ORDER BY PERNUMERO')
        LookupSettings.Chave = 'PERNUMERO'
        LookupSettings.Display = 'PEREXERCNOME'
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Período Final:'
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
        Caption = 'Demonstrativo:'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   IDDEMONSTRATIVO, IDPESSOA, DEMDESCDEMONSTRAT,DEMNATUREZA '
          'FROM '
          '   DEMONSTRATIVO '
          'ORDER BY '
          '   DEMDESCDEMONSTRAT'
          '')
        LookupSettings.Chave = 'IDDEMONSTRATIVO'
        LookupSettings.Display = 'DEMDESCDEMONSTRAT'
        LookupSettings.Descricao = 'Demonstrativo'
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
        Name = 'Demonstrativo:'
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
        Caption = 'Centro de Custo:'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   CODCENTROCUSTO,'
          '   NOME'
          'FROM'
          '   CENTCUST'
          'ORDER BY CODCENTROCUSTO '
          '')
        LookupSettings.Chave = 'CODCENTROCUSTO'
        LookupSettings.Display = 'NOME'
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
        Name = 'Centro de Custo:'
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
        Caption = 'Atividade/Projeto:'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   UNIDNEGOC, NOME '
          'FROM '
          '   UNIDNEGOCIO')
        LookupSettings.Chave = 'UNIDNEGOC'
        LookupSettings.Display = 'NOME'
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
        Name = 'Atividade/Projeto:'
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
        Caption = 'Moeda do Relatório:'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   MOECODIGO,'
          '   MOEDESC,'
          '   MOESIGLA '
          'FROM '
          '   MOEDA '
          'WHERE '
          '   MOEINATIVO = '#39'A'#39' '
          'ORDER BY MOEDESC')
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
        Name = 'Moeda do Relatório:'
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
        Caption = 'Imprimir cabeçalho em Inglês'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Imprimir cabeçalho em Inglês'
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
        Caption = 'Página Inicial:'
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
        TextDefault = '1'
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Página Inicial:'
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
    Left = 32
    Top = 104
  end
  inherited DevRptCM: TExtraOptions
    Left = 32
    Top = 10
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rptDemonstrativoModelo6
    Left = 32
    Top = 58
  end
  inherited cdsAux: TClientDataSet
    Left = 175
    Top = 58
  end
  inherited cdsCotacaoMoeda: TClientDataSet
    Left = 175
    Top = 18
  end
  inherited cdsEmpresaProp: TClientDataSet
    Left = 108
    Top = 104
  end
  inherited dsEmpresaProp: TwwDataSource
    Left = 108
    Top = 58
  end
  inherited pplEmpresaProp: TppBDEPipeline
    Left = 108
    Top = 10
  end
  object dsRelatorio: TwwDataSource
    DataSet = Cds
    Left = 571
    Top = 104
  end
  object ppRelatorio: TppBDEPipeline
    DataSource = dsRelatorio
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'Relatorio'
    Left = 571
    Top = 58
    object pplDemonstrativo6ppField1: TppField
      FieldAlias = 'DEB'
      FieldName = 'DEB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField2: TppField
      FieldAlias = 'CRE'
      FieldName = 'CRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField3: TppField
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField4: TppField
      FieldAlias = 'SALDOANT'
      FieldName = 'SALDOANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField5: TppField
      FieldAlias = 'DEBSN'
      FieldName = 'DEBSN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField6: TppField
      FieldAlias = 'CRESN'
      FieldName = 'CRESN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField7: TppField
      FieldAlias = 'SALDOSN'
      FieldName = 'SALDOSN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField8: TppField
      FieldAlias = 'SALDOANTSN'
      FieldName = 'SALDOANTSN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField9: TppField
      FieldAlias = 'SALDODEBCRE'
      FieldName = 'SALDODEBCRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField10: TppField
      FieldAlias = 'SALDOANTDEBCRE'
      FieldName = 'SALDOANTDEBCRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField11: TppField
      FieldAlias = 'CALCU'
      FieldName = 'CALCU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField12: TppField
      FieldAlias = 'IDELEMANAVERTICAL'
      FieldName = 'IDELEMANAVERTICAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField13: TppField
      FieldAlias = 'ELEDESCELEM'
      FieldName = 'ELEDESCELEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField14: TppField
      FieldAlias = 'FLGINDENTACAO'
      FieldName = 'FLGINDENTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField15: TppField
      FieldAlias = 'FLGTIPOLINHA'
      FieldName = 'FLGTIPOLINHA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField16: TppField
      FieldAlias = 'ELEORDEMLINHA'
      FieldName = 'ELEORDEMLINHA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField17: TppField
      FieldAlias = 'IDELEMDEMONSTRAT'
      FieldName = 'IDELEMDEMONSTRAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField18: TppField
      FieldAlias = 'ELETIPOELEM'
      FieldName = 'ELETIPOELEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField19: TppField
      FieldAlias = 'FLGSALTAPAGINA'
      FieldName = 'FLGSALTAPAGINA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField20: TppField
      FieldAlias = 'FLGMONETARIA'
      FieldName = 'FLGMONETARIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField21: TppField
      FieldAlias = 'FLGTRACO'
      FieldName = 'FLGTRACO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField22: TppField
      FieldAlias = 'FLGNEGRITO'
      FieldName = 'FLGNEGRITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField23: TppField
      FieldAlias = 'FLGNATUREZA'
      FieldName = 'FLGNATUREZA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField24: TppField
      FieldAlias = 'FLGTIPONEGATIVO'
      FieldName = 'FLGTIPONEGATIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField25: TppField
      FieldAlias = 'FLGDECIMAIS'
      FieldName = 'FLGDECIMAIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pplDemonstrativo6ppField26: TppField
      FieldAlias = 'SALTA'
      FieldName = 'SALTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
  end
  object rptDemonstrativoModelo6: TppReport
    AutoStop = False
    DataPipeline = ppRelatorio
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
    Left = 571
    Top = 10
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppRelatorio'
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
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
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
        DataPipeline = ppRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelatorio'
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 794
        mmWidth = 94721
        BandType = 4
      end
      object dbtxtSaldoAntDemo6: TppDBText
        UserName = 'dbtxtSaldoAntDemo6'
        DataField = 'SALDOANTSN'
        DataPipeline = ppRelatorio
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelatorio'
        mmHeight = 3175
        mmLeft = 97631
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object dbtxtDebDemo6: TppDBText
        UserName = 'dbtxtDebDemo6'
        DataField = 'DEBSN'
        DataPipeline = ppRelatorio
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelatorio'
        mmHeight = 3175
        mmLeft = 124354
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object dbtxtSaldoDemo6: TppDBText
        UserName = 'dbtxtSaldoDemo6'
        DataField = 'SALDOSN'
        DataPipeline = ppRelatorio
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelatorio'
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
        DataPipeline = ppRelatorio
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelatorio'
        mmHeight = 3175
        mmLeft = 147373
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object dbtxtDCSaldoAntDemo6: TppDBText
        UserName = 'dbtxtDCSaldoAntDemo6'
        DataField = 'SALDOANTDEBCRE'
        DataPipeline = ppRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelatorio'
        mmHeight = 3175
        mmLeft = 119327
        mmTop = 794
        mmWidth = 3175
        BandType = 4
      end
      object dbtxtDCSaldoDemo6: TppDBText
        UserName = 'dbtxtDCSaldoDemo6'
        DataField = 'SALDODEBCRE'
        DataPipeline = ppRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelatorio'
        mmHeight = 3175
        mmLeft = 192352
        mmTop = 794
        mmWidth = 3175
        BandType = 4
      end
      object rptDemonstrativo6DBText1: TppDBText
        UserName = 'rptDemonstrativo6DBText1'
        DataField = 'SALTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
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
      object ppLabel132: TppLabel
        UserName = 'ppLabel132'
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
      DataPipeline = ppRelatorio
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rptDemonstrativo6Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRelatorio'
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
  object cdsDTDemonstrativo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 212
    Top = 148
  end
  object cdsPeriodoInicial: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 148
  end
  object cdsPeriodoFinal: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 331
    Top = 148
  end
  object cdsMoeda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 92
    Top = 148
  end
  object cdsCompConta: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 451
    Top = 148
  end
  object cdsSaldo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 84
    Top = 203
  end
  object cdsSaldoAnt: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 148
  end
  object cdsMovimentacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 203
  end
  object cdsCompSomatorio: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 391
    Top = 148
  end
  object cdslkDemonstrativo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 511
    Top = 148
  end
  object Cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 571
    Top = 148
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 148
  end
  object Csp: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  (0)   AS DEB, (0) AS CRE, (0) AS SALDO, (0) AS SALDOANT,'
      
        '  (0)   AS DEBSN, (0) AS CRESN, (0) AS SALDOSN, (0) AS SALDOANTS' +
        'N,'
      '  ('#39' '#39') AS SALDODEBCRE, ('#39' '#39') AS SALDOANTDEBCRE,'
      '  ('#39'N'#39') AS CALCU, ('#39' '#39') AS SALTA, E.IDELEMANAVERTICAL,'
      
        '  E.ELEDESCELEM, E.FLGINDENTACAO, E.FLGTIPOLINHA, E.ELEORDEMLINH' +
        'A,'
      
        '  E.IDELEMDEMONSTRAT,E.ELETIPOELEM,E.FLGSALTAPAGINA,E.FLGMONETAR' +
        'IA,'
      '  E.FLGTRACO,E.FLGNEGRITO,E.FLGNATUREZA,E.FLGTIPONEGATIVO,'
      '  E.FLGDECIMAIS'
      'FROM'
      '  ELEMDEMONSTRATIVO E'
      'WHERE'
      '  (E.IDDEMONSTRATIVO = :IDDEMONSTRATIVO)'
      'ORDER BY'
      '  E.ELEORDEMLINHA'
      '')
    ClientDataSet = Cds
    Left = 571
    Top = 203
  end
  object cspEmpresa: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   NOMERELAT1, NOMERELAT2 '
      'FROM '
      '   EMPRESAPROP '
      'WHERE '
      '   (IDPESSOA = :IDPESSOA)')
    ClientDataSet = cdsEmpresa
    Left = 152
    Top = 203
  end
  object cspDTDemonstrativo: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   IDDEMONSTRATIVO, IDPESSOA, DEMDESCDEMONSTRAT,'
      '   DEMNATUREZA,FLGTRACOACIMA,FLGTRACOABAIXO,'
      '   DEMTITULOCOMPL, DEMTITULOCOMPL2'
      'FROM '
      '   DEMONSTRATIVO '
      'WHERE '
      '   (IDDEMONSTRATIVO =:IDDEMONSTRATIVO)  '
      'ORDER BY '
      '   DEMDESCDEMONSTRAT')
    ClientDataSet = cdsDTDemonstrativo
    Left = 212
    Top = 203
  end
  object cspPeriodoInicial: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '   PERNUMERO, PERNOME,'
      '   PERDATFIM, PERDATINI, PERNOMEOUTLING'
      'FROM '
      '   PERIODO '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND '
      '   (PEREXERCICIO=:PEREXERCICIO)'
      'ORDER BY '
      '   PERNUMERO')
    ClientDataSet = cdsPeriodoInicial
    Left = 272
    Top = 203
  end
  object cspPeriodoFinal: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '   PERNUMERO, PERNOME,'
      '   PERDATFIM, PERDATINI, PERNOMEOUTLING'
      'FROM '
      '   PERIODO '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND '
      '   (PEREXERCICIO=:PEREXERCICIO)'
      'ORDER BY '
      '   PERNUMERO')
    ClientDataSet = cdsPeriodoFinal
    Left = 331
    Top = 203
  end
  object cspCompSomatorio: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   C.ELEMENTODEM, C.FLGOPERACAO, '
      '   C.ELEVALORCOND, C.ELECONDICAO'
      'FROM     '
      '   COMPOELEMDEM C, ELEMDEMONSTRATIVO E '
      'WHERE '
      '   (C.IDELEMDEMONSTRAT = :IELEMDEMONSTRAT) AND '
      '   (E.ELETIPOELEM = '#39'S'#39') AND '
      '   (C.IDELEMDEMONSTRAT = E.IDELEMDEMONSTRAT)'
      '')
    ClientDataSet = cdsCompSomatorio
    Left = 391
    Top = 203
  end
  object cspCompConta: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   C.CODSUBCONTA,C.CODCENTROCUSTO,C.IDEMPRESA,'
      '   C.UNIDNEGOC, C.PLACONTA,C.PLANO  '
      'FROM'
      '   COMPOELEMDEM C, ELEMDEMONSTRATIVO E '
      'WHERE '
      '   (C.IDELEMDEMONSTRAT = :IELEMDEMONSTRAT) AND '
      '   (E.ELETIPOELEM = '#39'C'#39')  AND '
      '   (C.IDELEMDEMONSTRAT = E.IDELEMDEMONSTRAT)')
    ClientDataSet = cdsCompConta
    Left = 451
    Top = 203
  end
  object csplkDemonstrativo: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   IDDEMONSTRATIVO, IDPESSOA, DEMDESCDEMONSTRAT,DEMNATUREZA '
      'FROM '
      '   DEMONSTRATIVO '
      'WHERE '
      '   (IDDEMONSTRATIVO = :pIDDEMONSTRATIVO)  '
      'ORDER BY '
      '   DEMDESCDEMONSTRAT')
    ClientDataSet = cdslkDemonstrativo
    Left = 511
    Top = 203
  end
end
