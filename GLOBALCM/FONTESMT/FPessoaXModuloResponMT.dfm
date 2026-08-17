inherited FrmPessoaXModuloRespon: TFrmPessoaXModuloRespon
  HelpContext = 20003
  Caption = 'Associar Pessoa X Módulo Responsável'
  ClientHeight = 431
  ClientWidth = 619
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 619
    Height = 392
    object DbgLista: TwwDBGrid
      Left = 5
      Top = 121
      Width = 609
      Height = 266
      Selected.Strings = (
        'NOMEPESSOA'#9'60'#9'NOMEPESSOA'#9'F'
        'NOMEMODULO'#9'50'#9'NOMEMODULO'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = Ds
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
    end
    object Panel2: TPanel
      Left = 5
      Top = 93
      Width = 609
      Height = 28
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Pessoas Relacionadas'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 609
      Height = 88
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object lblFormaRecPag: TLabel
        Left = 8
        Top = 7
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object Label1: TLabel
        Left = 8
        Top = 47
        Width = 42
        Height = 13
        Caption = 'Módulo'
      end
      object BtnPesquisarPessoa: TBitBtn
        Left = 300
        Top = 16
        Width = 145
        Height = 25
        Caption = '&Pesquisar Pessoa'
        TabOrder = 1
        OnClick = BtnPesquisarPessoaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
          300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
          330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
          333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
          339977FF777777773377000BFB03333333337773FF733333333F333000333333
          3300333777333333337733333333333333003333333333333377333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
      end
      object BtnDesassociar: TBitBtn
        Left = 300
        Top = 56
        Width = 145
        Height = 25
        Caption = '&Desassociar Módulo'
        TabOrder = 3
        OnClick = BtnDesassociarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF3333993333339993333377FF3333377FF3399993333339
          993337777FF3333377F3393999333333993337F777FF333337FF993399933333
          399377F3777FF333377F993339993333399377F33777FF33377F993333999333
          399377F333777FF3377F993333399933399377F3333777FF377F993333339993
          399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
          99333773FF3333777733339993333339933333773FFFFFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
      end
      object BtnRelacionar: TBitBtn
        Left = 456
        Top = 56
        Width = 145
        Height = 25
        Caption = '&Relacionar'
        TabOrder = 4
        OnClick = BtnRelacionarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
      object EdNome: TEdit
        Left = 8
        Top = 20
        Width = 281
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object DbLcbModulo: TwwDBLookupCombo
        Left = 8
        Top = 60
        Width = 281
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEMODULO'#9'50'#9'NOMEMODULO'#9'F')
        LookupTable = CdsModulo
        LookupField = 'IDMODULO'
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 619
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 20003
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 396
    Top = 164
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object Ds: TDataSource
    DataSet = Cds
    Left = 448
    Top = 212
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 164
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.NOME'
      'PESSOA.IDMODULORESPON')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 396
    Top = 212
  end
  object CdsModulo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 164
  end
end
