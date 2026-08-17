inherited frmCadProvento: TfrmCadProvento
  Left = 166
  Top = 197
  HelpContext = 710003
  Caption = 'Cadastro das Rubricas Salariais (Proventos e Descontos)'
  ClientHeight = 308
  ClientWidth = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 500
    Height = 222
    BorderWidth = 2
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 71
      Height = 13
      Caption = 'Cód. Interno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 165
      Top = 11
      Width = 45
      Height = 13
      Caption = 'Rubrica'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 54
      Width = 147
      Height = 13
      Caption = 'Regra / Forma de Cálculo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 96
      Width = 149
      Height = 13
      Caption = 'Tipo de Benefício Salarial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbedCodInterno: TwwDBEdit
      Left = 16
      Top = 25
      Width = 138
      Height = 21
      Color = clGray
      DataField = 'IDPROVENTO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedDescr: TwwDBEdit
      Left = 165
      Top = 25
      Width = 319
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblckRegra: TwwDBLookupCombo
      Left = 16
      Top = 68
      Width = 468
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEREGRA'#9'60'#9'Regra')
      DataField = 'IDREGRA'
      DataSource = ds
      LookupTable = CdsRegra
      LookupField = 'IDREGRA'
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dblckBenef: TwwDBLookupCombo
      Left = 16
      Top = 110
      Width = 468
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRBENEFSALAR'#9'30'#9'DESCRBENEFSALAR'#9'No')
      DataField = 'IDBENEFSALAR'
      DataSource = ds
      LookupTable = CdsTipoBenef
      LookupField = 'IDBENEFSALAR'
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dbrgrpDesconto: TDBRadioGroup
      Left = 16
      Top = 140
      Width = 230
      Height = 67
      Caption = 'Tipo de Rubrica'
      Columns = 2
      DataField = 'FLGDESCONTO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'Provento'
        'Desconto'
        'Outro')
      ParentFont = False
      TabOrder = 4
      TabStop = True
      Values.Strings = (
        '0'
        '1'
        '2')
    end
    object GroupBox1: TGroupBox
      Left = 258
      Top = 140
      Width = 226
      Height = 67
      Caption = 'Opções'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object dbchkConstaFolha: TDBCheckBox
        Left = 12
        Top = 18
        Width = 208
        Height = 17
        Caption = 'Consta na Folha de Pagamento'
        DataField = 'FLGCONSTAFOLHA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbchkObrigaFavorecido: TDBCheckBox
        Left = 12
        Top = 43
        Width = 208
        Height = 14
        Caption = 'Exige Indicação de Favorecido '
        DataField = 'FLGOBRIGAFAVOREC'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 500
  end
  inherited Dock971: TDock97
    Top = 269
    Width = 500
    inherited tb97Fundo: TToolbar97
      Left = 330
      DockPos = 474
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 163
      DockPos = 307
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 456
    Top = 1
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 456
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 395
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Rubrica Salarial'
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Cód. Interno'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '12'
      '130')
    Left = 395
    Top = 13
  end
  object CdsRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 322
    Top = 1
  end
  object CdsTipoBenef: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 322
    Top = 14
  end
end
