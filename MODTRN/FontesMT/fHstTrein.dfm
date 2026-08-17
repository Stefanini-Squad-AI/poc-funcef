inherited frmHstTrein: TfrmHstTrein
  Left = 38
  Top = 94
  HelpContext = 720014
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Histórico de Treinamento'
  ClientHeight = 395
  ClientWidth = 720
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 97
    Width = 720
    Height = 259
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderWidth = 1
    object dbgrTrein: TwwDBGrid
      Left = 1
      Top = 1
      Width = 718
      Height = 257
      Selected.Strings = (
        'DESCRICAO'#9'42'#9'Curso'#9'F'
        'DATPLINI'#9'11'#9'Início Plan.'
        'DATPLFIM'#9'11'#9'Final Plan.'
        'DATREINI'#9'11'#9'Início Real'
        'DATREFIM'#9'11'#9'Final Real'
        'AVALTEOR'#9'11'#9'Aval. Teór.'
        'AVALPRAT'#9'11'#9'Aval. Prát.')
      IniAttributes.Delimiter = ';;'
      TitleColor = clGray
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsDet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icYellow
    end
  end
  inherited Dock971: TDock97
    Top = 356
    Width = 720
    inherited tb97Fundo: TToolbar97
      Left = 554
      DockPos = 562
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 720
    Height = 97
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label2: TLabel
      Left = 166
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object sbtnProcurar: TSpeedButton
      Left = 151
      Top = 41
      Width = 112
      Height = 48
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Procurar &Empregado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      Spacing = 0
      OnClick = sbtnProcurarClick
    end
    object dbtxtSituacao: TDBText
      Left = 621
      Top = 13
      Width = 73
      Height = 21
      Alignment = taCenter
      DataField = 'SITUACAO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sbtnProcurarCand: TSpeedButton
      Left = 302
      Top = 41
      Width = 112
      Height = 48
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Procurar &Candidato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      Spacing = 0
      OnClick = sbtnProcurarCandClick
    end
    object sbtnImprimirHist: TSpeedButton
      Left = 457
      Top = 41
      Width = 112
      Height = 48
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Imprimir &Histórico'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        22222200000000000222208888888880802200000000000008020888888BBB88
        0002088888877788080200000000000008800888888888808080200000000008
        0800220FFFFFFFF080802220F00000F000022220FFFFFFFF022222220F00000F
        022222220FFFFFFFF02222222000000000222222222222222222}
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      Spacing = 0
      OnClick = sbtnImprimirHistClick
    end
    object dbedMat: TwwDBEdit
      Left = 71
      Top = 13
      Width = 84
      Height = 21
      Color = clGray
      DataField = 'MATRICULA'
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
    object dbedNome: TwwDBEdit
      Left = 202
      Top = 13
      Width = 391
      Height = 21
      Color = clGray
      DataField = 'NOME'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 317
    Top = 211
  end
  object ds: TwwDataSource
    DataSet = Cds
    Left = 236
    Top = 158
  end
  object dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 232
    Top = 209
  end
  object MontaSelectFunc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'CARGO.IDCARGO        = FUNCIONARIO.IDCARGO'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 318
    Top = 159
  end
  object MontaSelectCand: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Candidato'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'CPF (ou equivalente)'
      'Cargo')
    Tabelas.Strings = (
      'PESSOA'
      'CARGO'
      'CANDIDAT')
    CamposChave.Strings = (
      'CANDIDAT.IDPESSOA')
    Filtro.Strings = (
      'CANDIDAT.IDCARGO = CARGO.IDCARGO'
      'CANDIDAT.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 425
    Top = 159
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 207
    Top = 158
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DATPLINI'
        DataType = ftDateTime
      end
      item
        Name = 'DATPLFIM'
        DataType = ftDateTime
      end
      item
        Name = 'DATREINI'
        DataType = ftDateTime
      end
      item
        Name = 'DATREFIM'
        DataType = ftDateTime
      end
      item
        Name = 'AVALTEOR'
        DataType = ftFloat
      end
      item
        Name = 'AVALPRAT'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'CdsDetIndex'
        DescFields = 'DATREINI'
        Fields = 'DATREINI'
        Options = [ixDescending]
      end>
    IndexName = 'CdsDetIndex'
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    Left = 199
    Top = 209
  end
end
