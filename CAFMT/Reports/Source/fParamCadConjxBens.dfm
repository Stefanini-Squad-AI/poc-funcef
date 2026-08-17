inherited frmParamCadConjxBens: TfrmParamCadConjxBens
  Left = 275
  Top = 216
  Caption = 'Cadastro de Conjuntos - Bens'
  ClientHeight = 178
  ClientWidth = 353
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 353
    Height = 139
    object Label8: TLabel
      Left = 16
      Top = 24
      Width = 69
      Height = 13
      Caption = 'Localização'
    end
    object Label5: TLabel
      Left = 16
      Top = 80
      Width = 74
      Height = 13
      Caption = 'Responsável'
    end
    object cmbLocalizacao: TwwDBLookupCombo
      Left = 16
      Top = 40
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'45'#9'Descrição')
      LookupTable = cdsLocalizacao
      LookupField = 'IDLOCALIZACAO'
      Options = [loTitles]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object cmbResponsavel: TwwDBLookupCombo
      Left = 16
      Top = 96
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Nome')
      LookupTable = cdsResponsavel
      LookupField = 'IDRESPONSAVEL'
      Options = [loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
  end
  inherited Dock971: TDock97
    Top = 139
    Width = 353
    inherited tb97Fundo: TToolbar97
      Left = 183
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 16
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 104
    Top = 256
  end
  inherited Cmp_Padrao: TCmParamReport
    Params = <
      item
        Caption = 'Localização'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT NOME, IDLOCALIZACAO'
          'FROM LOCALIZACAO'
          'ORDER BY NOME'
          '')
        LookupSettings.Chave = 'IDLOCALIZACAO'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '45'
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
        Caption = 'Responsável'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT P.NOME, R.IDRESPONSAVEL'
          'FROM PESSOA P,'
          '     RESPONSAVEL R'
          'WHERE (R.IDRESPONSAVEL = P.IDPESSOA)'
          'ORDER BY P.NOME'
          '')
        LookupSettings.Chave = 'IDRESPONSAVEL'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Nome'
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
    Left = 48
    Top = 272
  end
  object cdsLocalizacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 32
  end
  object cdsResponsavel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 88
  end
  object sqlLocalizacao: TCMSqlParams
    SQL.Strings = (
      'SELECT NOME, IDLOCALIZACAO'
      'FROM LOCALIZACAO'
      'ORDER BY NOME'
      '')
    ClientDataSet = cdsLocalizacao
    Left = 256
    Top = 32
  end
  object sqlResponsavel: TCMSqlParams
    SQL.Strings = (
      'SELECT P.NOME, R.IDRESPONSAVEL'
      'FROM PESSOA P,'
      '     RESPONSAVEL R'
      'WHERE (R.IDRESPONSAVEL = P.IDPESSOA)'
      'ORDER BY P.NOME'
      '')
    ClientDataSet = cdsResponsavel
    Left = 256
    Top = 96
  end
end
