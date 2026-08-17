inherited frmCadSaldoAntAtivProjMT: TfrmCadSaldoAntAtivProjMT
  Left = 281
  Top = 179
  Caption = 'Saldo Anterior por Atividade/Projeto'
  ClientHeight = 249
  ClientWidth = 384
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 384
    Height = 163
    object Label3: TLabel
      Left = 24
      Top = 21
      Width = 55
      Height = 13
      Caption = 'Exercício'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMoedaReal: TLabel
      Left = 104
      Top = 21
      Width = 39
      Height = 13
      Caption = 'Moeda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 24
      Top = 69
      Width = 100
      Height = 13
      Caption = 'Atividade/Projeto'
    end
    object Label1: TLabel
      Left = 24
      Top = 113
      Width = 30
      Height = 13
      Caption = 'Valor'
    end
    object dblkMoeda: TwwDBLookupCombo
      Left = 104
      Top = 36
      Width = 259
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MOEDESC'#9'20'#9'MOEDESC'
        'MOESIGLA'#9'10'#9'MOESIGLA')
      LookupTable = cdsMoeda
      LookupField = 'MOECODIGO'
      Options = [loColLines]
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object edtNomeAtivProj: TEdit
      Left = 81
      Top = 83
      Width = 260
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
    end
    object mskAtivProj: TMaskEdit
      Left = 24
      Top = 83
      Width = 57
      Height = 21
      TabOrder = 2
      OnExit = mskAtivProjExit
    end
    object dbrValor: TDBRealEdit
      Left = 24
      Top = 126
      Width = 129
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '         0')
      TabOrder = 3
      WordWrap = False
      IntDigits = 15
      DecDigits = 5
      NumberFormat = fNumber
      Signal = False
      DataField = 'VLRRATEIO'
      DataSource = ds
    end
    object btnAtivProj: TBitBtn
      Left = 343
      Top = 83
      Width = 25
      Height = 21
      TabOrder = 4
      OnClick = btnAtivProjClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 25
      Top = 36
      Width = 65
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PEREXERCICIO'#9'10'#9'Exercício')
      DataField = 'PEREXERCICIO'
      DataSource = ds
      LookupTable = cdsExercicio
      LookupField = 'PEREXERCICIO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock972: TDock97
    Width = 384
  end
  inherited Dock971: TDock97
    Top = 210
    Width = 384
    inherited tb97Fundo: TToolbar97
      Left = 214
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 47
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 354
    Top = 159
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 350
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 152
    Top = 247
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 248
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 324
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RATEIOATIVPROJ.PEREXERCICIO'
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.NOME'
      'RATEIOATIVPROJ.VLRRATEIO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Exercício'
      'Ativ./Proj.'
      'Descrição'
      'Valor')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RATEIOATIVPROJ'
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'RATEIOATIVPROJ.IDRATEIOATIVPROJ')
    Filtro.Strings = (
      'RATEIOATIVPROJ.UNIDNEGOC = UNIDNEGOCIO.UNIDNEGOC'
      'RATEIOATIVPROJ.IDPESSOA = UNIDNEGOCIO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '###,###,###,##0.00')
    Larguras.Strings = (
      '10'
      '10'
      '25'
      '10')
    Left = 312
    Top = 55
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 67
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 159
  end
  object MontaSelectAtivProj: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código '
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'UNIDNEGOCIO.UNIDNEGOC'
      'UNIDNEGOCIO.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '25')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 304
    Top = 136
  end
  object cdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 159
  end
  object cdsVerificaValores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 159
  end
end
