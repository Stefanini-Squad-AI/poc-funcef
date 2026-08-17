inherited frmRParamListaContasMT: TfrmRParamListaContasMT
  Left = 283
  Top = 154
  Caption = 'Listagem de Contas Orçamentárias'
  ClientHeight = 289
  ClientWidth = 335
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 335
    Height = 250
    object lblGrupo: TLabel
      Left = 22
      Top = 53
      Width = 96
      Height = 13
      Caption = 'Grupo de Contas'
    end
    object rdgOrdenacao: TRadioGroup
      Left = 22
      Top = 93
      Width = 289
      Height = 145
      Caption = 'Ordenação'
      ItemIndex = 0
      Items.Strings = (
        'por Ordem de Código de Contas'
        'por Ordem de Nome de Contas '
        'por Ordem de Grupo de Contas'
        'por Ordem de Centro de Responsabilidade'
        'por Tipo de Cálculo do Orçado'
        'por Tipo de Cálculo do Realizado')
      TabOrder = 0
    end
    inline molPlanoOrcamentario: TmolPlanoOrcamentario
      Left = 13
      Top = 9
      Width = 316
      TabOrder = 1
      inherited cboPlanoOrcamen: TwwDBLookupCombo
        Width = 293
        OnExit = molPlanoOrcamentariocboPlanoOrcamenExit
      end
      inherited sqlPlanoOrcamen: TCMSqlParams
        Top = 65534
      end
      inherited CdsPlanoOrcamen: TCMClientDataSet
        Top = 65526
      end
      inherited cdsParametro: TCMClientDataSet
        Top = 65526
      end
    end
    object cboGrupoOrcamen: TwwDBLookupCombo
      Left = 22
      Top = 66
      Width = 291
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEGRUPOORCAMEN'#9'60'#9'NOMEGRUPOORCAMEN'#9'F'
        'CODGRUPOORC'#9'10'#9'CODGRUPOORC'#9'F'
        'FLGANALSINT'#9'1'#9'FLGANALSINT'#9'F')
      LookupTable = cdsGrupo
      LookupField = 'IDGRUPOORCAMEN'
      Options = [loColLines]
      DropDownCount = 5
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 250
    Width = 335
    inherited tb97Fundo: TToolbar97
      Left = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 208
    Top = 128
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited Cmp_Padrao: TCmParamReport
    Params = <
      item
        Caption = 'Grupo de Contas'
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
        Name = 'Grupo'
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
        Caption = 'Ordenação'
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
      end>
    Left = 144
    Top = 128
  end
  object dsGrupo: TwwDataSource
    DataSet = cdsGrupo
    Left = 277
    Top = 104
  end
  object sqlGrupo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDGRUPOORCAMEN, NOMEGRUPOORCAMEN, '
      '   FLGANALSINT, CODGRUPOORC'
      'FROM'
      '   GRUPOORCAMEN'
      'WHERE IDPLANOORCAMEN = :IDPLANOORCAMEN')
    ClientDataSet = cdsGrupo
    Left = 32
    Top = 144
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 72
    Top = 144
    object cdsGrupoIDGRUPOORCAMEN: TFloatField
      FieldName = 'IDGRUPOORCAMEN'
    end
    object cdsGrupoNOMEGRUPOORCAMEN: TStringField
      FieldName = 'NOMEGRUPOORCAMEN'
      Size = 60
    end
    object cdsGrupoFLGANALSINT: TStringField
      FieldName = 'FLGANALSINT'
      Size = 1
    end
    object cdsGrupoCODGRUPOORC: TStringField
      FieldName = 'CODGRUPOORC'
      Size = 10
    end
  end
end
