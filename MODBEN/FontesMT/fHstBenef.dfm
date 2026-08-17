inherited frmHstBenef: TfrmHstBenef
  Left = 32
  Top = 161
  HelpContext = 710007
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Histórico de Benefícios Sociais'
  ClientHeight = 307
  ClientWidth = 720
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 46
    Width = 720
    Height = 222
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderWidth = 1
    object dbgrHistorico: TwwDBGrid
      Left = 1
      Top = 1
      Width = 718
      Height = 220
      ControlType.Strings = (
        'FLGPERMANENTE;CheckBox;1;0')
      Selected.Strings = (
        'DESCRICAO'#9'46'#9'Benefício'#9'F'
        'ANOMESINICIO'#9'13'#9'A Partir de'
        'PARCELAS'#9'10'#9'Parcelas'
        'NUMOCORRENCIAS'#9'12'#9'Ocorridas'
        'VALORRUBRICA'#9'15'#9'Valor Mensal'
        'FLGPERMANENTE'#9'13'#9'Permanente?')
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
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgWordWrap]
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
    Top = 268
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
    Height = 46
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
      Left = 607
      Top = 9
      Width = 103
      Height = 28
      AllowAllUp = True
      GroupIndex = 1
      Caption = '   &Procurar'
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
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      Spacing = 0
      OnClick = sbtnProcurarClick
    end
    object dbtxtSituacao: TDBText
      Left = 526
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
      Width = 317
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
    Top = 139
  end
  object ds: TwwDataSource
    DataSet = Cds
    Left = 236
    Top = 86
  end
  object dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 232
    Top = 137
  end
  object MontaSelect: TMontaSelect
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
    Top = 87
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 207
    Top = 86
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRICAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ANOMESINICIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PARCELAS'
        DataType = ftFloat
      end
      item
        Name = 'NUMOCORRENCIAS'
        DataType = ftFloat
      end
      item
        Name = 'FLGPERMANENTE'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUBRICA'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 199
    Top = 137
  end
end
